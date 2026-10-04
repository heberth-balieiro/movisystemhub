unit uAtributosRTTI;

interface

uses
  System.Classes, System.SysUtils;

type
  // Atributo para nome da tabela
  TableName = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const AName: string);
    property Name: string read FName;
  end;

  // Atributo para campos da tabela, com opção de chave primária
  FieldName = class(TCustomAttribute)
  private
    FField: string;
    FPrimaryKey: Boolean;
  public
    constructor Create(const AField: string; APrimaryKey: Boolean = False);
    property Field: string read FField;
    property PrimaryKey: Boolean read FPrimaryKey;
  end;

   // Atributo para indicar se o campo é editável (usado no Update)
  Editable = class(TCustomAttribute)
  private
    FIsEditable: Boolean;
  public
    constructor Create(AIsEditable: Boolean);
    property IsEditable: Boolean read FIsEditable;
  end;

  //atributo para indicar null quando integer
  NullIfZeroAttribute = class(TCustomAttribute)
    private
      FNullIfZero: Boolean;
    public
    property NullIfZero:Boolean read FNullIfZero;
  end;

type
  TFieldOption = (foInsert, foUpdate, foSelect);
  TFieldOptions = set of TFieldOption;

  // Atributo para indicar se o campo participa de insert/update
  FieldOptions = class(TCustomAttribute)
  private
    FOptions: TFieldOptions;
  public
    constructor Create(const AOptions: TFieldOptions);
    property Options: TFieldOptions read FOptions;
  end;

type
  // atributo para campo somatório
  TFieldMathOp = class(TCustomAttribute)
  public
    Op: string;
    SourceField: string;
    constructor Create(const AOp: string; const ASourceField: string = '');
  end;

implementation

{ TableName }

constructor TableName.Create(const AName: string);
begin
  FName := AName;
end;

{ FieldName }

constructor FieldName.Create(const AField: string; APrimaryKey: Boolean);
begin
  FField := AField;
  FPrimaryKey := APrimaryKey;
end;

{ Editable }

constructor Editable.Create(AIsEditable: Boolean);
begin
  FIsEditable := AIsEditable;
end;

{ FieldOptions }

constructor FieldOptions.Create(const AOptions: TFieldOptions);
begin
  FOptions := AOptions;
end;


{ TFieldMathOp }

constructor TFieldMathOp.Create(const AOp: string; const ASourceField: string);
begin
  Op := AOp.ToLower;
  SourceField := ASourceField;
end;

end.

