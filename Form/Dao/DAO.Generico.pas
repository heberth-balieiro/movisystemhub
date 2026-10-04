unit DAO.Generico;

{
  Criada  : 20/05/2025
  Dao criada para manipular telas de cadastros

}

interface

uses
  System.RTTI, Data.DB, System.Generics.Collections, Uni,
  System.SysUtils, uAtributosRTTI,Datasnap.DBClient,
  DBAccess, MemDS, Provider;

type
  TDAO<T: class, constructor> = class
  private
    FConnection: TUniConnection;
    FContext: TRttiContext;
    FTableName: string;

    function GetTableName: string;
    function GetFieldsAndParams(Obj: T; out Fields, Params: string; out Values: TArray<TValue>): Boolean;
    function GetKeyField: string;
    function DataSetToObject(DataSet: TDataSet): T;

  public
    constructor Create(AConnection: TUniConnection);
    destructor Destroy; override;

    function Insert(Obj: T): Boolean;
    function Update(Obj: T): Boolean;
    function Delete(AId: Integer): Boolean;
    function FindById(AId: Integer): T;
    function FindAll: TObjectList<T>;

    function GetNextCode(const FieldName: string = 'codigo'): Integer;
    function FindWhere(const SQL: string;
      const Params: TArray<TPair<string, Variant>>): TObjectList<T>;

  end;

implementation

uses
  System.Classes, cxDateUtils;

{ TDAO<T> }

constructor TDAO<T>.Create(AConnection: TUniConnection);
begin
  FConnection := AConnection;
  FContext := TRttiContext.Create;
  FTableName := GetTableName;
end;

destructor TDAO<T>.Destroy;
begin
  FContext.Free;
  inherited;
end;

function TDAO<T>.GetTableName: string;
var
  RType: TRttiType;
  Attr: TCustomAttribute;
begin
  RType := FContext.GetType(T);
  for Attr in RType.GetAttributes do
    if Attr is TableName then
      Exit(TableName(Attr).Name);

  raise Exception.Create('Classe sem atributo [TableName]');
end;

function TDAO<T>.GetFieldsAndParams(Obj: T; out Fields, Params: string; out Values: TArray<TValue>): Boolean;
var
  RType: TRttiType;
  RProp: TRttiProperty;
  Attr: TCustomAttribute;
  FieldAttr: FieldName;
  ListFields: TList<string>;
  ListParams: TList<string>;
  ListValues: TList<TValue>;
begin
  ListFields := TList<string>.Create;
  ListParams := TList<string>.Create;
  ListValues := TList<TValue>.Create;
  try
    RType := FContext.GetType(Obj.ClassType);
    for RProp in RType.GetProperties do
      for Attr in RProp.GetAttributes do
        if Attr is FieldName then
        begin
          FieldAttr := FieldName(Attr);
          if not FieldAttr.PrimaryKey then
          begin
            ListFields.Add(FieldAttr.Field);
            ListParams.Add(':' + FieldAttr.Field);
            ListValues.Add(RProp.GetValue(TObject(Obj)));
          end;
        end;

    Fields := String.Join(',', ListFields.ToArray);
    Params := String.Join(',', ListParams.ToArray);
    Values := ListValues.ToArray;
    Result := True;
  finally
    ListFields.Free;
    ListParams.Free;
    ListValues.Free;
  end;
end;

function TDAO<T>.Insert(Obj: T): Boolean;
var
  SQL, Fields, Params: string;
  Qry: TUniQuery;
  Values: TArray<TValue>;
  i: Integer;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    if not GetFieldsAndParams(Obj, Fields, Params, Values) then
      Exit;

    SQL := Format('INSERT INTO %s (%s) VALUES (%s)', [FTableName, Fields, Params]);
    Qry.SQL.Text := SQL;

    {for i := 0 to High(Values) do
      Qry.Params[i].Value := Values[i].AsVariant;}

    for i := 0 to High(Values) do
    begin
      if Values[i].Kind = tkFloat then
      begin
        // Verifica se o tipo é DateTime
        if SameText(Values[i].TypeInfo.Name, 'TDateTime') then
        begin
          if Values[i].AsExtended = NullDate then
            Qry.Params[i].Clear  // envia NULL para o banco
          else
            Qry.Params[i].AsDateTime := Values[i].AsExtended;
        end
        else
          Qry.Params[i].Value := Values[i].AsVariant;
      end
      else
        Qry.Params[i].Value := Values[i].AsVariant;
    end;

    Qry.ExecSQL;
    Result := True;
  finally
    Qry.Free;
  end;
end;

function TDAO<T>.Update(Obj: T): Boolean;
var
  SQL, SetClause, KeyField: string;
  RType: TRttiType;
  RProp: TRttiProperty;
  Attr: TCustomAttribute;
  FieldAttr: FieldName;
  EditableAttr: Editable;
  Qry: TUniQuery;
  Value: TValue;
  IsEditable: Boolean;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    RType := FContext.GetType(Obj.ClassType);
    SetClause := '';

    // Monta o SET apenas com campos editáveis (exceto a chave primária)
    for RProp in RType.GetProperties do
    begin
      FieldAttr := nil;
      EditableAttr := nil;

      for Attr in RProp.GetAttributes do
      begin
        if Attr is FieldName then
          FieldAttr := FieldName(Attr);
        if Attr is Editable then
          EditableAttr := Editable(Attr);
      end;

      if Assigned(FieldAttr) then
      begin
        if FieldAttr.PrimaryKey then
          KeyField := FieldAttr.Field
        else
        begin
          // Se não tiver o atributo Editable, considera como True (editável)
          IsEditable := True;
          if Assigned(EditableAttr) then
            IsEditable := EditableAttr.IsEditable;

          if IsEditable then
            SetClause := SetClause + FieldAttr.Field + ' = :' + FieldAttr.Field + ', ';
        end;
      end;
    end;

    // Remove vírgula final
    if SetClause.EndsWith(', ') then
      SetClause := Copy(SetClause, 1, Length(SetClause) - 2);

    SQL := Format('UPDATE %s SET %s WHERE %s = :%s', [FTableName, SetClause, KeyField, KeyField]);
    Qry.SQL.Text := SQL;

    // Preenche parâmetros (apenas os do SET e chave primária)
    for RProp in RType.GetProperties do
    begin
      FieldAttr := nil;
      EditableAttr := nil;

      for Attr in RProp.GetAttributes do
      begin
        if Attr is FieldName then
          FieldAttr := FieldName(Attr);
        if Attr is Editable then
          EditableAttr := Editable(Attr);
      end;

      if Assigned(FieldAttr) then
      begin
        IsEditable := True;
        if Assigned(EditableAttr) then
          IsEditable := EditableAttr.IsEditable;

        if (FieldAttr.PrimaryKey) or (IsEditable) then
        begin
          Value := RProp.GetValue(TObject(Obj));

          if Value.Kind = tkFloat then
          begin
            if SameText(Value.TypeInfo.Name, 'TDateTime') then
            begin
              if Value.AsExtended = NullDate then
                Qry.ParamByName(FieldAttr.Field).Clear
              else
                Qry.ParamByName(FieldAttr.Field).AsDateTime := Value.AsExtended;
            end
            else
              Qry.ParamByName(FieldAttr.Field).Value := Value.AsVariant;
          end
          else
            Qry.ParamByName(FieldAttr.Field).Value := Value.AsVariant;
        end;
      end;
    end;

    Qry.ExecSQL;
    Result := True;
  finally
    Qry.Free;
  end;
end;

function TDAO<T>.DataSetToObject(DataSet: TDataSet): T;
var
  Ctx: TRttiContext;
  RttiType: TRttiType;
  Prop: TRttiProperty;
  Obj: T;
  Field: TField;
begin
  Obj := T.Create;
  Ctx := TRttiContext.Create;
  try
    RttiType := Ctx.GetType(TClass(T));

    for Prop in RttiType.GetProperties do
    begin
      if not Prop.IsWritable then
        Continue;

      Field := DataSet.FindField(Prop.Name);
      if Assigned(Field) and not Field.IsNull then
      begin
        try
          case Field.DataType of
            ftBoolean:  Prop.SetValue(Pointer(Obj), Field.AsBoolean);
            ftInteger, ftSmallint, ftWord:
              Prop.SetValue(Pointer(Obj), Field.AsInteger);
            ftFloat, ftCurrency, ftFMTBcd:
              Prop.SetValue(Pointer(Obj), Field.AsExtended);
            ftDate, ftTime, ftDateTime:
              Prop.SetValue(Pointer(Obj), TValue.From<TDateTime>(Field.AsDateTime));
            else
              Prop.SetValue(Pointer(Obj), TValue.FromVariant(Field.Value));
          end;
        except
          on E: Exception do
            ; // Ignora campos que não puderem ser atribuídos
        end;
      end;
    end;

    Result := Obj;
  finally
    Ctx.Free;
  end;
end;

function TDAO<T>.Delete(AId: Integer): Boolean;
var
  SQL: string;
  Qry: TUniQuery;
  KeyField: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    KeyField := GetKeyField;

    SQL := Format('DELETE FROM %s WHERE %s = :ID', [FTableName, KeyField]);
    Qry.SQL.Text := SQL;
    Qry.ParamByName('ID').AsInteger := AId;
    Qry.ExecSQL;
    Result := True;
  finally
    Qry.Free;
  end;
end;

function TDAO<T>.FindAll: TObjectList<T>;
var
  SQL: string;
  Qry: TUniQuery;
  RType: TRttiType;
  RProp: TRttiProperty;
  Obj: T;
  Attr: TCustomAttribute;
  FieldAttr: FieldName;
begin
  Result := TObjectList<T>.Create;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    SQL := Format('SELECT * FROM %s', [FTableName]);
    Qry.SQL.Text := SQL;
    Qry.Open;

    while not Qry.Eof do
    begin
      Obj := T.Create;
      RType := FContext.GetType(Obj.ClassType);

      for RProp in RType.GetProperties do
        for Attr in RProp.GetAttributes do
          if Attr is FieldName then
          begin
            FieldAttr := FieldName(Attr);
            if Qry.FindField(FieldAttr.Field) <> nil then
              RProp.SetValue(TObject(Obj), TValue.FromVariant(Qry.FieldByName(FieldAttr.Field).Value));
          end;

      Result.Add(Obj);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

function TDAO<T>.FindById(AId: Integer): T;
var
  SQL: string;
  Qry: TUniQuery;
  Obj: T;
  RType: TRttiType;
  RProp: TRttiProperty;
  Attr: TCustomAttribute;
  FieldAttr: FieldName;
  KeyField: string;
  Field: TField;
begin
  Result := nil;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    KeyField := GetKeyField;
    SQL := Format('SELECT * FROM %s WHERE %s = :ID', [FTableName, KeyField]);
    Qry.SQL.Text := SQL;
    Qry.ParamByName('ID').AsInteger := AId;
    Qry.Open;

    if not Qry.IsEmpty then
    begin
      Obj := T.Create;
      RType := FContext.GetType(Obj.ClassType);

      for RProp in RType.GetProperties do
        for Attr in RProp.GetAttributes do
          if Attr is FieldName then
          begin
            FieldAttr := FieldName(Attr);
            Field := Qry.FindField(FieldAttr.Field);

            if Assigned(Field) and (not Field.IsNull) then
              RProp.SetValue(TObject(Obj), TValue.FromVariant(Field.Value));
          end;

      Result := Obj;
    end;
  finally
    Qry.Free;
  end;
end;

function TDAO<T>.GetKeyField: string;
var
  RType: TRttiType;
  Attr: TCustomAttribute;
begin
  RType := FContext.GetType(T);
  for var Prop in RType.GetProperties do
    for Attr in Prop.GetAttributes do
      if (Attr is FieldName) and FieldName(Attr).PrimaryKey then
        Exit(FieldName(Attr).Field);

  raise Exception.Create('Classe não possui chave primária definida');
end;

function TDAO<T>.GetNextCode(const FieldName: string = 'codigo'): Integer;
var
  TableAttr: TableName;
  RType: TRttiType;
  Attr: TCustomAttribute;
  TableNameStr, SQL: string;
  qry: TUniQuery;
begin
  Result := 1; // valor padrão se tabela estiver vazia

  // Obter o nome da tabela via RTTI
  RType := FContext.GetType(T);
  for Attr in RType.GetAttributes do
    if Attr is TableName then
    begin
      TableAttr := TableName(Attr);
      TableNameStr := TableAttr.Name;
      Break;
    end;

  if TableNameStr.IsEmpty then
    raise Exception.Create('Atributo [TableName] não definido na classe.');

  // Montar e executar SQL
  SQL := Format('SELECT MAX(%s) + 1 AS NEXT_CODE FROM %s', [FieldName, TableNameStr]);

  qry := TUniQuery.Create(nil);
  try
    qry.Connection := FConnection;
    qry.SQL.Text := SQL;
    qry.Open;

    if not qry.FieldByName('NEXT_CODE').IsNull then
      Result := qry.FieldByName('NEXT_CODE').AsInteger;
  finally
    qry.Free;
  end;
end;

function TDAO<T>.FindWhere(const SQL: string; const Params: TArray<TPair<string, Variant>>): TObjectList<T>;
var
  Qry: TUniQuery;
  Obj: T;
begin
  Result := TObjectList<T>.Create;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := SQL;

    for var Param in Params do
      Qry.ParamByName(Param.Key).Value := Param.Value;

    Qry.Open;
    while not Qry.Eof do
    begin
      Obj := DataSetToObject(Qry); // seu método RTTI para converter dataset em objeto
      Result.Add(Obj);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;


end.
