unit Dao.Operacoes;
{
  Criada  : 21/05/2025
  Dao criada para manipular telas de operações

}

interface

uses
  System.RTTI, Data.DB, System.Generics.Collections, Uni,
  System.SysUtils, uAtributosRTTI, Datasnap.DBClient,
  DBAccess, MemDS, Provider,System.StrUtils;

type
  TDAOOperacao<T: class, constructor> = class
  private
    FConnection: TUniConnection;
    FContext: TRttiContext;
    FTableName: string;

    function GetTableName: string;
    //function GetFieldsAndParams(Obj: T; out Fields, Params: string; out Values: TArray<TValue>): Boolean;
    function GetKeyField: string;
    function DataSetToObject(DataSet: TDataSet): T;
    function GetFieldsAndParams(Obj: T; out Fields, Params: string;
      out Values: TArray<TValue>; const Operacao: string = 'INSERT'): Boolean;




  public
    constructor Create(AConnection: TUniConnection);
    destructor Destroy; override;

    function Insert(Obj: T): Integer;
    function Update(Obj: T): Boolean;
    function Delete(AId: Integer): Boolean;
    function FindById(AId: Integer): T;
    function FindAll: TObjectList<T>;
    function UpdateComOperacao(Obj: T): Boolean;

    function DeleteWhere(const Filtros: TDictionary<string, Variant>): Boolean; //para excluir registro mais de um parametro.

    function GetNextCode(const FieldName: string = 'codigo'): Integer;
    function FindWhere(const SQL: string;
      const Params: TArray<TPair<string, Variant>>): TObjectList<T>;
    function UpdatePart(const AObject: T; PrimaryKeyField: string):boolean;
    function FindByIdIn(const AIds: TList<Integer>): TObjectList<T>;
  end;

implementation

uses
  System.Classes, cxDateUtils, Variants, System.Types;

{ TDAOOperacao<T> }

function TDAOOperacao<T>.DeleteWhere(const Filtros: TDictionary<string, Variant>): Boolean;
var
  Qry: TUniQuery;
  SQL, Campo: string;
  i: Integer;
  Parametro: TPair<string, Variant>;
begin
  Result := False;
  if Filtros.Count = 0 then
    raise Exception.Create('Filtros não informados para exclusão segura.');

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;

    // Monta SQL base
    SQL := 'DELETE FROM ' + FTableName + ' WHERE ';

    i := 0;
    for Parametro in Filtros do
    begin
      if i > 0 then
        SQL := SQL + ' AND ';
      SQL := SQL + Parametro.Key + ' = :' + Parametro.Key;
      Inc(i);
    end;

    Qry.SQL.Text := SQL;

    // Atribui os parâmetros
    for Parametro in Filtros do
      Qry.ParamByName(Parametro.Key).Value := Parametro.Value;

    Qry.ExecSQL;
    Result := Qry.RowsAffected > 0;
  finally
    Qry.Free;
  end;
end;

constructor TDAOOperacao<T>.Create(AConnection: TUniConnection);
begin
  FConnection := AConnection;
  FContext := TRttiContext.Create;
  FTableName := GetTableName;
end;

destructor TDAOOperacao<T>.Destroy;
begin
  FContext.Free;
  inherited;
end;

function TDAOOperacao<T>.GetTableName: string;
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

function TDAOOperacao<T>.GetFieldsAndParams(Obj: T; out Fields, Params: string; out Values: TArray<TValue>; const Operacao: string = 'INSERT'): Boolean;
var
  RType: TRttiType;
  RProp: TRttiProperty;
  FieldAttr: FieldName;
  OptionsAttr: FieldOptions;
  Attr: TCustomAttribute;
  ListaFields: TList<string>;
  ListaParams: TList<string>;
  ListaValues: TList<TValue>;
  ParamName: string;
  IncluirCampo: Boolean;
begin
  Result := False;
  Fields := '';
  Params := '';
  SetLength(Values, 0);

  ListaFields := TList<string>.Create;
  ListaParams := TList<string>.Create;
  ListaValues := TList<TValue>.Create;

  try
    RType := FContext.GetType(Obj.ClassType);
    for RProp in RType.GetProperties do
    begin
      FieldAttr := nil;
      OptionsAttr := nil;

      // Busca os atributos
      for Attr in RProp.GetAttributes do
      begin
        if Attr is FieldName then
          FieldAttr := FieldName(Attr)
        else if Attr is FieldOptions then
          OptionsAttr := FieldOptions(Attr);
      end;

      if Assigned(FieldAttr) and not FieldAttr.PrimaryKey then
      begin
        IncluirCampo := True;

        if Assigned(OptionsAttr) then
        begin
          if SameText(Operacao, 'INSERT') then
            IncluirCampo := foInsert in OptionsAttr.Options
          else if SameText(Operacao, 'UPDATE') then
            IncluirCampo := foUpdate in OptionsAttr.Options;
        end;

        if IncluirCampo then
        begin
          ParamName := Format(':p%d', [ListaValues.Count + 1]);
          ListaFields.Add(FieldAttr.Field);
          ListaParams.Add(ParamName);

          //ajustar para id null
          if SameText(FieldAttr.Field, 'id_pai') and
             (RProp.PropertyType.TypeKind in [tkInteger, tkInt64]) and
             (RProp.GetValue(TObject(Obj)).AsInt64 = 0) then
            ListaValues.Add(TValue.Empty)
          else

          ListaValues.Add(RProp.GetValue(TObject(Obj)));
        end;
      end;
    end;

    if ListaFields.Count > 0 then
    begin
      Fields := String.Join(', ', ListaFields.ToArray);
      Params := String.Join(', ', ListaParams.ToArray);
      Values := ListaValues.ToArray;
      Result := True;
    end;
  finally
    ListaFields.Free;
    ListaParams.Free;
    ListaValues.Free;
  end;
end;

//antes da alteracao do byte
//function TDAOOperacao<T>.Insert(Obj: T): Integer;
//var
//  SQL, Fields, Params: string;
//  Qry: TUniQuery;
//  Values: TArray<TValue>;
//  i: Integer;
//begin
//  Result := 0;
//  Qry := TUniQuery.Create(nil);
//  try
//    Qry.Connection := FConnection;
//
//    //Validar os Campos
//    if not GetFieldsAndParams(Obj, Fields, Params, Values, 'INSERT') then
//    exit;
//
//    SQL := Format('INSERT INTO %s (%s) VALUES (%s)', [FTableName, Fields, Params]);
//    Qry.SQL.Text := SQL;
//
//    for i := 0 to High(Values) do
//    begin
//      if Values[i].IsEmpty then
//      begin
//        Qry.Params[i].Clear;
//        Continue;
//      end;
//
//      if Values[i].Kind = tkFloat then
//      begin
//        if SameText(Values[i].TypeInfo.Name, 'TDateTime') or SameText(Values[i].TypeInfo.Name, 'TDate')  then
//        begin
//          if Values[i].AsExtended = NullDate then
//            Qry.Params[i].Clear
//          else
//            Qry.Params[i].AsDateTime := Values[i].AsExtended;
//        end
//        else
//          Qry.Params[i].Value := Values[i].AsVariant;
//      end
//      else
//        Qry.Params[i].Value := Values[i].AsVariant;
//    end;
//
//    Qry.ExecSQL;
//
//    // Recupera o último ID inserido
//    Qry.SQL.Text := 'SELECT LAST_INSERT_ID()';
//    Qry.Open;
//    if not Qry.IsEmpty then
//      Result := Qry.Fields[0].AsInteger;
//  finally
//    Qry.Free;
//  end;
//end;

function TDAOOperacao<T>.Insert(Obj: T): Integer;
var
  SQL: string;
  Fields: string;
  Params: string;
  Qry: TUniQuery;
  Values: TArray<TValue>;
  LBytes: TBytes;
  i: Integer;
begin
  Result := 0;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;

    // Valida e monta os campos, parâmetros e valores do INSERT
    if not GetFieldsAndParams(
      Obj,
      Fields,
      Params,
      Values,
      'INSERT'
    ) then
      Exit;

    SQL := Format(
      'INSERT INTO %s (%s) VALUES (%s)',
      [
        FTableName,
        Fields,
        Params
      ]
    );

    Qry.SQL.Text := SQL;

    for i := 0 to High(Values) do
    begin
      // TValue vazio
      if Values[i].IsEmpty then
      begin
        Qry.Params[i].Clear;
        Continue;
      end;

      // Tratamento para TBytes / campos BLOB
      //
      // Não deve comparar TypeInfo.Name com "TBytes", pois o RTTI
      // pode retornar TArray<Byte> ou TArray<System.Byte>.
      if Values[i].IsType<TBytes> then
      begin
        LBytes := Values[i].AsType<TBytes>;

        if Length(LBytes) = 0 then
        begin
          Qry.Params[i].Clear;
        end
        else
        begin
          Qry.Params[i].DataType := ftBlob;
          Qry.Params[i].AsBytes := LBytes;
        end;

        Continue;
      end;

      // Tratamento para datas
      if Values[i].Kind = tkFloat then
      begin
        if Assigned(Values[i].TypeInfo) and
           (
             SameText(
               string(Values[i].TypeInfo.Name),
               'TDateTime'
             )
             or
             SameText(
               string(Values[i].TypeInfo.Name),
               'TDate'
             )
           ) then
        begin
          if Values[i].AsExtended = NullDate then
            Qry.Params[i].Clear
          else
            Qry.Params[i].AsDateTime :=
              Values[i].AsExtended;

          Continue;
        end;

        Qry.Params[i].Value :=
          Values[i].AsVariant;

        Continue;
      end;

      // Tratamento padrão para os demais tipos
      Qry.Params[i].Value :=
        Values[i].AsVariant;
    end;

    Qry.ExecSQL;

    // Recupera o último ID inserido
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'SELECT LAST_INSERT_ID()';
    Qry.Open;

    if not Qry.IsEmpty then
      Result := Qry.Fields[0].AsInteger;

  finally
    Qry.Free;
  end;
end;

//antes do bytes

//function TDAOOperacao<T>.Update(Obj: T): Boolean;
//var
//  SQL, SetClause, KeyField: string;
//  Qry: TUniQuery;
//  Values: TArray<TValue>;
//  Fields, Params: string;
//  RType: TRttiType;
//  RProp: TRttiProperty;
//  Attr: TCustomAttribute;
//  FieldAttr: FieldName;
//  KeyValue: TValue;
//  i: Integer;
//begin
//  Result := False;
//  Qry := TUniQuery.Create(nil);
//  try
//    Qry.Connection := FConnection;
//
//    // Pega os campos editáveis e valores
//    if not GetFieldsAndParams(Obj, Fields, Params, Values, 'UPDATE') then
//      Exit;
//
//    // Identifica o campo chave primária
//    RType := FContext.GetType(Obj.ClassType);
//    KeyField := '';
//    for RProp in RType.GetProperties do
//    begin
//      for Attr in RProp.GetAttributes do
//      begin
//        if (Attr is FieldName) and FieldName(Attr).PrimaryKey then
//        begin
//          KeyField := FieldName(Attr).Field;
//          KeyValue := RProp.GetValue(TObject(Obj));
//          Break;
//        end;
//      end;
//      if KeyField <> '' then Break;
//    end;
//
//    if KeyField = '' then
//      raise Exception.Create('Chave primária não definida para a classe ' + Obj.ClassName);
//
//    // Monta o SET
//    SetClause := '';
//    for i := 0 to High(Values) do
//      SetClause := SetClause + Trim(SplitString(Fields, ',')[i]) + ' =:' + Trim(SplitString(Fields, ',')[i]) + ', ';
//    SetClause := Copy(SetClause, 1, Length(SetClause) - 2); // Remove vírgula final
//
//    // Monta SQL final
//    SQL := Format('UPDATE %s SET %s WHERE %s = :%s', [FTableName, SetClause, KeyField, KeyField]);
//    Qry.SQL.Text := SQL;
//
//    // Atribui os parâmetros do SET
//    for i := 0 to High(Values) do
//    begin
//      if (Values[i].Kind = tkFloat) then
//      begin
//        if SameText(Values[i].TypeInfo.Name, 'TDateTime') or SameText(Values[i].TypeInfo.Name, 'TDate') then
//        begin
//          if Values[i].AsExtended = NullDate then
//            Qry.Params[i].Clear
//          else
//            Qry.Params[i].AsDateTime := Values[i].AsExtended;
//        end
//        else
//          Qry.Params[i].Value := Values[i].AsVariant;
//      end
//      else
//        Qry.Params[i].Value := Values[i].AsVariant;
//    end;
//
//    // Adiciona o parâmetro da chave primária
//    Qry.ParamByName(Trim(KeyField)).Value := KeyValue.AsVariant;
//
//    Qry.ExecSQL;
//    Result := True;
//  finally
//    Qry.Free;
//  end;
//end;


function TDAOOperacao<T>.Update(Obj: T): Boolean;
var
  SQL: string;
  SetClause: string;
  KeyField: string;
  Qry: TUniQuery;
  Values: TArray<TValue>;
  Fields: string;
  Params: string;
  FieldList: TStringDynArray;
  RType: TRttiType;
  RProp: TRttiProperty;
  Attr: TCustomAttribute;
  KeyValue: TValue;
  Bytes: TBytes;
  Param: TParam;
  i: Integer;
begin
  Result := False;

  if not Assigned(Obj) then
    raise Exception.Create('O objeto informado para atualização não foi criado.');

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;

    // Pega os campos editáveis e os respectivos valores
    if not GetFieldsAndParams(
      Obj,
      Fields,
      Params,
      Values,
      'UPDATE'
    ) then
      Exit;

    // Identifica a chave primária
    RType := FContext.GetType(Obj.ClassType);

    KeyField := '';
    KeyValue := TValue.Empty;

    for RProp in RType.GetProperties do
    begin
      for Attr in RProp.GetAttributes do
      begin
        if (Attr is FieldName) and
           FieldName(Attr).PrimaryKey then
        begin
          KeyField := FieldName(Attr).Field;
          KeyValue := RProp.GetValue(TObject(Obj));
          Break;
        end;
      end;

      if KeyField <> '' then
        Break;
    end;

    if KeyField = '' then
      raise Exception.Create(
        'Chave primária não definida para a classe ' +
        Obj.ClassName
      );

    if KeyValue.IsEmpty then
      raise Exception.Create(
        'O valor da chave primária não foi informado.'
      );

    // Separa a lista de campos uma única vez
    FieldList := SplitString(Fields, ',');

    if Length(FieldList) <> Length(Values) then
      raise Exception.CreateFmt(
        'A quantidade de campos (%d) é diferente da quantidade de valores (%d).',
        [Length(FieldList), Length(Values)]
      );

    // Monta a cláusula SET
    SetClause := '';

    for i := 0 to High(FieldList) do
    begin
      if SetClause <> '' then
        SetClause := SetClause + ', ';

      SetClause :=
        SetClause +
        Trim(FieldList[i]) +
        ' = :' +
        Trim(FieldList[i]);
    end;

    // Monta o SQL final
    SQL := Format(
      'UPDATE %s SET %s WHERE %s = :%s',
      [
        FTableName,
        SetClause,
        KeyField,
        KeyField
      ]
    );

    Qry.SQL.Text := SQL;

    // Atribui os parâmetros dos campos do SET
    for i := 0 to High(Values) do
    begin
      Param := Qry.ParamByName(Trim(FieldList[i]));

      // Tratamento específico para TBytes / BLOB
      if Values[i].IsType<TBytes> then
      begin
        Bytes := Values[i].AsType<TBytes>;

        if Length(Bytes) = 0 then
          Param.Clear
        else
        begin
          Param.DataType := ftBlob;
          Param.AsBytes := Bytes;
        end;

        Continue;
      end;

      // Tratamento para datas
      if Values[i].Kind = tkFloat then
      begin
        if SameText(Values[i].TypeInfo.Name, 'TDateTime') or
           SameText(Values[i].TypeInfo.Name, 'TDate') then
        begin
          if Values[i].AsExtended = NullDate then
            Param.Clear
          else
            Param.AsDateTime := Values[i].AsExtended;
        end
        else
          Param.Value := Values[i].AsVariant;

        Continue;
      end;

      // Tratamento padrão
      Param.Value := Values[i].AsVariant;
    end;

    // Adiciona o parâmetro da chave primária
    Param := Qry.ParamByName(KeyField);

    case KeyValue.Kind of
      tkInteger:
        Param.AsInteger := KeyValue.AsInteger;

      tkInt64:
        Param.AsLargeInt := KeyValue.AsInt64;

      tkUString,
      tkWString,
      tkLString,
      tkString:
        Param.AsString := KeyValue.AsString;

    else
      Param.Value := KeyValue.AsVariant;
    end;

    Qry.ExecSQL;

    Result := Qry.RowsAffected > 0;
  finally
    Qry.Free;
  end;
end;





function TDAOOperacao<T>.UpdateComOperacao(Obj: T): Boolean;
var
  SQL, SetClause, KeyField, NomeCampo, ParamName, CampoOperacao: string;
  Qry: TUniQuery;
  RType: TRttiType;
  RProp: TRttiProperty;
  Attr: TCustomAttribute;
  FieldAttr: FieldName;
  FieldOpAttr: TFieldMathOp;
  OptionsAttr: FieldOptions;
  KeyValue, Value, OrigValue: TValue;
  ParamValues: TDictionary<string, TValue>;
  OrigProp: TRttiProperty;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  ParamValues := TDictionary<string, TValue>.Create;
  try
    Qry.Connection := FConnection;

    RType := FContext.GetType(Obj.ClassType);
    SetClause := '';
    KeyField := '';

    for RProp in RType.GetProperties do
    begin
      FieldAttr := nil;
      FieldOpAttr := nil;
      OptionsAttr := nil;

      for Attr in RProp.GetAttributes do
      begin
        if Attr is FieldName then FieldAttr := FieldName(Attr);
        if Attr is FieldOptions then OptionsAttr := FieldOptions(Attr);
        if Attr is TFieldMathOp then FieldOpAttr := TFieldMathOp(Attr);
      end;

      if not Assigned(FieldAttr) then Continue;

      NomeCampo := FieldAttr.Field;
      ParamName := ':' + NomeCampo;
      Value := RProp.GetValue(TObject(Obj));

      if FieldAttr.PrimaryKey then
      begin
        KeyField := NomeCampo;
        KeyValue := Value;
        Continue;
      end;

      // Se o campo NÃO tem foUpdate, ele deve ser ignorado do SET
      if not Assigned(OptionsAttr) or not (foUpdate in OptionsAttr.Options) then
      begin
        // Porém, se ele for um campo auxiliar usado em uma operação (como qtdenova),
        // não entra no SET mas entra nos parâmetros
        if RProp.Name.ToLower = 'qtdenova' then
          ParamValues.AddOrSetValue('qtdenova', RProp.GetValue(TObject(Obj)));

        Continue; // <-- aqui é onde ele sai do SET
      end;

      // Campo com operação matemática
      if Assigned(FieldOpAttr) and SameText(FieldOpAttr.Op, 'soma') then
      begin
        CampoOperacao := 'qtdenova'; // Valor auxiliar passado para somar
        SetClause     := SetClause + Format('%s = %s + :%s, ', [NomeCampo, NomeCampo, CampoOperacao]);

        OrigProp      := RType.GetProperty(CampoOperacao);
        if not Assigned(OrigProp) then
          raise Exception.Create('Campo auxiliar "' + CampoOperacao + '" não encontrado.');

        OrigValue     := OrigProp.GetValue(TObject(Obj));
        ParamValues.AddOrSetValue(CampoOperacao, OrigValue);
      end
      else
      begin
        SetClause     := SetClause + Format('%s = :%s, ', [NomeCampo, NomeCampo]);
        ParamValues.AddOrSetValue(NomeCampo, Value);
      end;
    end;

    if SetClause.EndsWith(', ') then
      SetClause       := Copy(SetClause, 1, Length(SetClause) - 2);

    if KeyField = '' then
      raise Exception.Create('Chave primária não definida.');

    SQL               := Format('UPDATE %s SET %s WHERE %s = :%s', [FTableName, SetClause, KeyField, KeyField]);
    Qry.SQL.Text := SQL;

    // Atribui os parâmetros da operação
    for var Pair in ParamValues do
    begin
      ParamName := Pair.Key;
      Value := Pair.Value;

      if Value.Kind = tkFloat then
      begin
        if SameText(Value.TypeInfo.Name, 'TDateTime') and (Value.AsExtended = NullDate) then
          Qry.ParamByName(ParamName).Clear
        else
          Qry.ParamByName(ParamName).AsFloat := Value.AsExtended;
      end
      else
        Qry.ParamByName(ParamName).Value := Value.AsVariant;
    end;

    Qry.ParamByName(KeyField).Value := KeyValue.AsVariant;

    Qry.ExecSQL;
    Result := True;
  finally
    ParamValues.Free;
    Qry.Free;
  end;
end;

function TDAOOperacao<T>.DataSetToObject(DataSet: TDataSet): T;
var
  Ctx: TRttiContext;
  RttiType: TRttiType;
  Prop: TRttiProperty;
  Obj: T;
  Inst: TObject;
  Field: TField;
  Kind: TTypeKind;
begin
  Obj := T.Create;
  Inst := TObject(Obj); // ✅ garante instância como TObject para o RTTI

  Ctx := TRttiContext.Create;
  try
    RttiType := Ctx.GetType(Inst.ClassType);

    for Prop in RttiType.GetProperties do
    begin
      if not Prop.IsWritable then
        Continue;

      Field := DataSet.FindField(Prop.Name);
      if (Field = nil) or Field.IsNull then
        Continue;

      Kind := Prop.PropertyType.TypeKind;

      try
        case Field.DataType of
          ftBoolean:
            Prop.SetValue(Inst, Field.AsBoolean);

          ftInteger, ftSmallint, ftWord, ftAutoInc:
            begin
              if Kind = tkInt64 then
                Prop.SetValue(Inst, Int64(Field.AsInteger))
              else
                Prop.SetValue(Inst, Field.AsInteger);
            end;

          ftLargeint:
            begin

              if Kind = tkInt64 then
                Prop.SetValue(Inst, Field.AsLargeInt)
              else
                Prop.SetValue(Inst, Integer(Field.AsLargeInt));
            end;

          ftFloat:
            Prop.SetValue(Inst, Field.AsFloat);

          ftCurrency, ftFMTBcd, ftBCD:
            Prop.SetValue(Inst, Field.AsCurrency);

          ftDate, ftTime, ftDateTime, ftTimeStamp:
            Prop.SetValue(Inst, TValue.From<TDateTime>(Field.AsDateTime));

        else
          Prop.SetValue(Inst, TValue.FromVariant(Field.Value));
        end;

      except
        on E: Exception do
          raise Exception.CreateFmt(
            'Erro ao mapear campo "%s" para propriedade "%s" (%s). DataType=%d. Msg=%s',
            [Field.FieldName, Prop.Name, Prop.PropertyType.Name, Ord(Field.DataType), E.Message]
          );
      end;
    end;

    Result := Obj;
  finally
    // TRttiContext é record, não precisa Free.
  end;
end;


//function TDAOOperacao<T>.DataSetToObject(DataSet: TDataSet): T;
//var
//  Ctx: TRttiContext;
//  RttiType: TRttiType;
//  Prop: TRttiProperty;
//  Obj: T;
//  Field: TField;
//begin
//  Obj := T.Create;
//  Ctx := TRttiContext.Create;
//  try
//    //RttiType := Ctx.GetType(TClass(T));    // foi comentado devido um erro nos totalizadores
//
//    //  pega RTTI da instância real
//    RttiType := Ctx.GetType(Obj.ClassType);
//
//    for Prop in RttiType.GetProperties do
//    begin
//      if not Prop.IsWritable then
//        Continue;
//
//      Field := DataSet.FindField(Prop.Name);
//      if Assigned(Field) and not Field.IsNull then
//      begin
//        try
//          case Field.DataType of
//            ftBoolean:  Prop.SetValue(Pointer(Obj), Field.AsBoolean);
//            ftInteger, ftSmallint, ftWord:
//              Prop.SetValue(Pointer(Obj), Field.AsInteger);
//            ftFloat, ftCurrency, ftFMTBcd:
//              Prop.SetValue(Pointer(Obj), Field.AsExtended);
//            ftDate, ftTime, ftDateTime:
//              Prop.SetValue(Pointer(Obj), TValue.From<TDateTime>(Field.AsDateTime));
//            else
//              Prop.SetValue(Pointer(Obj), TValue.FromVariant(Field.Value));
//          end;
//        except on E: Exception do
//          raise Exception.Create(E.Message);
//        end;
//      end;
//    end;
//
//    Result := Obj;
//  finally
//    Ctx.Free;
//  end;
//end;





function TDAOOperacao<T>.Delete(AId: Integer): Boolean;
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

function TDAOOperacao<T>.FindAll: TObjectList<T>;
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

//antes do ajuste para bytes
//function TDAOOperacao<T>.FindById(AId: Integer): T;
//var
//  SQL: string;
//  Qry: TUniQuery;
//  Obj: T;
//  RType: TRttiType;
//  RProp: TRttiProperty;
//  Attr: TCustomAttribute;
//  FieldAttr: FieldName;
//  EditableAttr: Editable;
//  Field: TField;
//  IsEditable: Boolean;
//  v: TValue;
//begin
//  Result := nil;
//
//  Qry := TUniQuery.Create(nil);
//  try
//    Qry.Connection := FConnection;
//    SQL := Format('SELECT * FROM %s WHERE %s = :ID', [FTableName, GetKeyField]);
//    Qry.SQL.Text := SQL;
//    Qry.ParamByName('ID').AsInteger := AId;
//    Qry.Open;
//
//    if not Qry.IsEmpty then
//    begin
//      Obj := T.Create;
//      RType := FContext.GetType(Obj.ClassType);
//
//      for RProp in RType.GetProperties do
//      begin
//        FieldAttr := nil;
//        EditableAttr := nil;
//
//        // Captura atributos FieldName e Editable
//        for Attr in RProp.GetAttributes do
//        begin
//          if Attr is FieldName then
//            FieldAttr := FieldName(Attr)
//          else if Attr is Editable then
//            EditableAttr := Editable(Attr);
//        end;
//
//        // Só continua se tiver o atributo FieldName
//        if not Assigned(FieldAttr) then
//          Continue;
//
//        // Verifica se o campo é editável
//        IsEditable := True;
//        if Assigned(EditableAttr) and (not EditableAttr.IsEditable) then
//          IsEditable := False;
//
//        if IsEditable then
//        begin
//          Field := Qry.FindField(FieldAttr.Field);
//          if Assigned(Field) and (not Field.IsNull) then
//          begin
//            case RProp.PropertyType.TypeKind of
//              tkInteger, tkInt64:
//                v := Field.AsInteger;
//              tkFloat:
//                begin
//                  // RTTI mapeia Date/DateTime como Float
//                  if RProp.PropertyType.Handle = TypeInfo(TDate) then
//                    v := Field.AsDateTime
//                  else
//                    v := Field.AsFloat;
//                end;
//              tkUString, tkWString, tkLString, tkString:
//                v := Field.AsString;
//              tkEnumeration:
//                begin
//                  if RProp.PropertyType.Handle = TypeInfo(Boolean) then
//                    v := Field.AsBoolean
//                  else
//                    v := TValue.FromOrdinal(RProp.PropertyType.Handle, Field.AsInteger);
//                end;
//              else
//                v := TValue.FromVariant(Field.Value);
//            end;
//
//            RProp.SetValue(TObject(Obj), v);
//          end;
//        end;
//      end;
//
//      Result := Obj;
//    end;
//  finally
//    Qry.Free;
//  end;
//
//end;


function TDAOOperacao<T>.FindById(AId: Integer): T;
var
  SQL: string;
  Qry: TUniQuery;
  Obj: T;
  RType: TRttiType;
  RProp: TRttiProperty;
  Attr: TCustomAttribute;
  FieldAttr: FieldName;
  EditableAttr: Editable;
  Field: TField;
  IsEditable: Boolean;
  v: TValue;
  BlobStream: TStream;
  Bytes: TBytes;
begin
  Result := nil;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;

    SQL := Format(
      'SELECT * FROM %s WHERE %s = :ID',
      [FTableName, GetKeyField]
    );

    Qry.SQL.Text := SQL;
    Qry.ParamByName('ID').AsInteger := AId;
    Qry.Open;

    if not Qry.IsEmpty then
    begin
      Obj := T.Create;

      try
        RType := FContext.GetType(Obj.ClassType);

        for RProp in RType.GetProperties do
        begin
          FieldAttr := nil;
          EditableAttr := nil;

          // Captura os atributos FieldName e Editable
          for Attr in RProp.GetAttributes do
          begin
            if Attr is FieldName then
              FieldAttr := FieldName(Attr)
            else if Attr is Editable then
              EditableAttr := Editable(Attr);
          end;

          // Só continua se tiver o atributo FieldName
          if not Assigned(FieldAttr) then
            Continue;

          // Verifica se o campo é editável
          IsEditable := True;

          if Assigned(EditableAttr) and
             (not EditableAttr.IsEditable) then
            IsEditable := False;

          if not IsEditable then
            Continue;

          Field := Qry.FindField(FieldAttr.Field);

          if not Assigned(Field) then
            Continue;

          if Field.IsNull then
            Continue;

          // Tratamento específico para propriedades TBytes / BLOB
          if RProp.PropertyType.Handle = TypeInfo(TBytes) then
          begin
            SetLength(Bytes, 0);

            if Field is TBlobField then
            begin
              BlobStream := Qry.CreateBlobStream(
                TBlobField(Field),
                bmRead
              );

              try
                SetLength(Bytes, BlobStream.Size);

                if BlobStream.Size > 0 then
                begin
                  BlobStream.Position := 0;
                  BlobStream.ReadBuffer(
                    Bytes[0],
                    BlobStream.Size
                  );
                end;
              finally
                BlobStream.Free;
              end;
            end;

            v := TValue.From<TBytes>(Bytes);

            RProp.SetValue(
              TObject(Obj),
              v
            );

            Continue;
          end;

          case RProp.PropertyType.TypeKind of
            tkInteger:
              v := Field.AsInteger;

            tkInt64:
              v := Field.AsLargeInt;

            tkFloat:
              begin
                // RTTI mapeia TDate e TDateTime como Float
                if (RProp.PropertyType.Handle = TypeInfo(TDate)) or
                   (RProp.PropertyType.Handle = TypeInfo(TDateTime)) then
                  v := Field.AsDateTime
                else
                  v := Field.AsFloat;
              end;

            tkUString,
            tkWString,
            tkLString,
            tkString:
              v := Field.AsString;

            tkEnumeration:
              begin
                if RProp.PropertyType.Handle = TypeInfo(Boolean) then
                  v := Field.AsBoolean
                else
                  v := TValue.FromOrdinal(
                    RProp.PropertyType.Handle,
                    Field.AsInteger
                  );
              end;

            else
              v := TValue.FromVariant(Field.Value);
          end;

          RProp.SetValue(
            TObject(Obj),
            v
          );
        end;

        Result := Obj;
        Obj := nil;

      finally
        Obj.Free;
      end;
    end;

  finally
    Qry.Free;
  end;
end;


function TDAOOperacao<T>.FindByIdIn(const AIds: TList<Integer>): TObjectList<T>;
var
  SQL, ParamsStr: string;
  Qry: TUniQuery;
  Obj: T;
  RType: TRttiType;
  RProp: TRttiProperty;
  Attr: TCustomAttribute;
  FieldAttr: FieldName;
  EditableAttr: Editable;
  Field: TField;
  IsEditable: Boolean;
  v: TValue;
  I: Integer;
begin
  //funcao para passa uma lista de Ids
  Result := TObjectList<T>.Create(True); // True = DAO será dono dos objetos

  if (AIds = nil) or (AIds.Count = 0) then
    Exit;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;

    // Monta lista de parâmetros :p0, :p1, :p2 ...
    ParamsStr := '';
    for I := 0 to AIds.Count - 1 do
    begin
      if ParamsStr <> '' then
        ParamsStr := ParamsStr + ',';
      ParamsStr := ParamsStr + Format(':p%d', [I]);
    end;

    SQL := Format('SELECT * FROM %s WHERE %s IN (%s)',
      [FTableName, GetKeyField, ParamsStr]);

    Qry.SQL.Text := SQL;

    // Preenche os parâmetros
    for I := 0 to AIds.Count - 1 do
      Qry.ParamByName(Format('p%d', [I])).AsInteger := AIds[I];

    Qry.Open;

    while not Qry.Eof do
    begin
      Obj := T.Create;
      RType := FContext.GetType(Obj.ClassType);

      for RProp in RType.GetProperties do
      begin
        FieldAttr := nil;
        EditableAttr := nil;

        for Attr in RProp.GetAttributes do
        begin
          if Attr is FieldName then
            FieldAttr := FieldName(Attr)
          else if Attr is Editable then
            EditableAttr := Editable(Attr);
        end;

        if not Assigned(FieldAttr) then
          Continue;

        IsEditable := True;
        if Assigned(EditableAttr) and (not EditableAttr.IsEditable) then
          IsEditable := False;

        if IsEditable then
        begin
          Field := Qry.FindField(FieldAttr.Field);
          if Assigned(Field) and (not Field.IsNull) then
          begin
            case RProp.PropertyType.TypeKind of
              tkInteger, tkInt64:
                v := Field.AsInteger;
              tkFloat:
                begin
                  if RProp.PropertyType.Handle = TypeInfo(TDate) then
                    v := Field.AsDateTime
                  else
                    v := Field.AsFloat;
                end;
              tkUString, tkWString, tkLString, tkString:
                v := Field.AsString;
              tkEnumeration:
                begin
                  if RProp.PropertyType.Handle = TypeInfo(Boolean) then
                    v := Field.AsBoolean
                  else
                    v := TValue.FromOrdinal(RProp.PropertyType.Handle, Field.AsInteger);
                end;
            else
              v := TValue.FromVariant(Field.Value);
            end;

            RProp.SetValue(TObject(Obj), v);
          end;
        end;
      end;

      Result.Add(Obj);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;



function TDAOOperacao<T>.GetKeyField: string;
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

function TDAOOperacao<T>.GetNextCode(const FieldName: string = 'codigo'): Integer;
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

//function TDAOOperacao<T>.FindWhere(const SQL: string; const Params: TArray<TPair<string, Variant>>): TObjectList<T>;
//var
//  Qry: TUniQuery;
//  Obj: T;
//begin
//  Result := TObjectList<T>.Create;
//  Qry := TUniQuery.Create(nil);
//  try
//    Qry.Connection := FConnection;
//    Qry.SQL.Text := SQL;
//
//    for var Param in Params do
//    begin
//      if VarIsType(Param.Value, varDate) then
//      Qry.ParamByName(Param.Key).AsDate := Param.Value
//      else
//      Qry.ParamByName(Param.Key).Value := Param.Value;
//    end;
//
//
//
//    Qry.Open;
//    while not Qry.Eof do
//    begin
//      Obj := DataSetToObject(Qry);
//      Result.Add(Obj);
//      Qry.Next;
//    end;
//  finally
//    Qry.Free;
//  end;
//end;

function TDAOOperacao<T>.FindWhere(const SQL: string;
  const Params: TArray<TPair<string, Variant>>): TObjectList<T>;
var
  Qry: TUniQuery;
  Obj: T;
  Param: TPair<string, Variant>;
begin
  Result := TObjectList<T>.Create;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.ParamCheck := True;
    Qry.SQL.Text := SQL;
    Qry.Prepare;

    for Param in Params do
    begin
      if Qry.FindParam(Param.Key) = nil then
        raise Exception.Create('Parâmetro não encontrado no SQL: ' + Param.Key);

      if VarIsType(Param.Value, varDate) or VarIsType(Param.Value, varUString) and TryStrToDate(VarToStr(Param.Value), TDateTime(nil^)) then
        Qry.ParamByName(Param.Key).AsDateTime := VarToDateTime(Param.Value)
      else
        Qry.ParamByName(Param.Key).Value := Param.Value;
    end;

    Qry.Open;

    while not Qry.Eof do
    begin
      Obj := DataSetToObject(Qry);
      Result.Add(Obj);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;



//Update para lidar com poucos registro selecionado
function TDAOOperacao<T>.UpdatePart(const AObject: T; PrimaryKeyField: string): Boolean;
var
  Context: TRttiContext;
  RttiType: TRttiType;
  Prop: TRttiProperty;
  FieldName, SQLSet: string;
  Value: TValue;
  PrimaryKeyValue: Variant;
  ValDate: TDateTime;
  Qry: TUniQuery;
  ParamFields: TDictionary<string, Variant>;
  V: Variant;
begin
  Result := False;
  SQLSet := '';
  Context := TRttiContext.Create;
  Qry := TUniQuery.Create(nil);
  ParamFields := TDictionary<string, Variant>.Create;
  try
    Qry.Connection := FConnection;
    RttiType := Context.GetType(AObject.ClassType);
    Qry.SQL.Clear;

    // 1. Montar a SQL e guardar os valores dos parâmetros
    for Prop in RttiType.GetProperties do
    begin
      if not Prop.IsReadable or not Prop.IsWritable then Continue;

      FieldName := LowerCase(Prop.Name);
      Value := Prop.GetValue(TObject(AObject));

      if SameText(FieldName, LowerCase(PrimaryKeyField)) then
      begin
        PrimaryKeyValue := Value.AsVariant;
        Continue;
      end;

      try
        V := Value.AsVariant;

        if VarIsNull(V) then Continue;

        case Value.Kind of
          tkUString:
            if Trim(Value.AsString) = '' then Continue;

          tkInteger, tkInt64:
            if V = 0 then Continue;

          tkFloat:
            if Prop.PropertyType.Handle = TypeInfo(TDateTime) then
            begin
              ValDate := Value.AsExtended;
              if (ValDate = 0) or (ValDate = EncodeDate(1,1,1)) then Continue;
            end
            else if V = 0 then Continue;
        end;

        if SQLSet <> '' then SQLSet := SQLSet + ', ';
        SQLSet := SQLSet + FieldName + ' = :' + FieldName;

        ParamFields.Add(FieldName, V); // Guarda para setar depois

      except
        Continue;
      end;
    end;

    if SQLSet = '' then
      raise Exception.Create('Nenhum campo válido informado para atualizar.');

    // 2. Montar a SQL
    Qry.SQL.Add('UPDATE ' + FTableName + ' SET');
    Qry.SQL.Add(SQLSet);
    Qry.SQL.Add('WHERE ' + PrimaryKeyField + ' = :' + PrimaryKeyField);

    // 3. Setar parâmetros
    for FieldName in ParamFields.Keys do
      Qry.ParamByName(FieldName).Value := ParamFields[FieldName];

    Qry.ParamByName(PrimaryKeyField).Value := PrimaryKeyValue;

    Qry.ExecSQL;
    Result := True;
  finally
    ParamFields.Free;
    Qry.Free;
  end;
end;


end.
