unit Model.PlanoConta;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('planoconta')]
  TModelPlanoconta = class

  Private
    FData_Alteracao: TDate;
    FAtivo: string;
    Fid_pai: Integer;
    FId_PlanoConta: Integer;
    Faceita: string;
    FDescricao: string;
    FCodigo: string;
    FData_Excluido: TDate;
    Fnivel: Integer;
    FId_Empresa: Integer;
    FSaldoInicial: Double;
    FId_Usuario_Exc: Integer;
    Fordem: Integer;
    Ftipo: string;
    FExcluido: Integer;
    FId_Usuario_Alt: Integer;
    FId_Usuario: Integer;
    FDataCriacao: TDate;
    Fdesnivel: string;

  Public
    [FieldName('id_planoconta', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Id_PlanoConta: Integer read FId_PlanoConta write FId_PlanoConta;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    property Codigo: string read FCodigo write FCodigo;

    [FieldName('descricao')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property Descricao: string read FDescricao write FDescricao;

    [FieldName('id_pai')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property id_pai: Integer read Fid_pai write Fid_pai;

    [FieldName('saldoinicial')]
    [FieldOptions([foInsert,foSelect])]
    property SaldoInicial: Double read FSaldoInicial write FSaldoInicial;

    [FieldName('datacriacao')]
    [FieldOptions([foInsert])]
    property DataCriacao: TDate read FDataCriacao write FDataCriacao;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property Id_Usuario: Integer read FId_Usuario write FId_Usuario;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property Id_Empresa: Integer read FId_Empresa write FId_Empresa;

    [FieldName('ativo')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property Ativo: string read FAtivo write FAtivo;

    [FieldName('data_alteracao')]
    [FieldOptions([foupdate])]
    property Data_Alteracao: TDate read FData_Alteracao write FData_Alteracao;

    [FieldName('data_excluido')]
    [FieldOptions([foupdate])]
    property Data_Excluido: TDate read FData_Excluido write FData_Excluido;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate])]
    property Id_Usuario_Alt: Integer read FId_Usuario_Alt write FId_Usuario_Alt;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foupdate])]
    property Id_Usuario_Exc: Integer read FId_Usuario_Exc write FId_Usuario_Exc;

    [FieldName('excluido')]
    [FieldOptions([foInsert])]
    property Excluido: Integer read FExcluido write FExcluido;

    [FieldName('nivel')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property nivel: Integer read Fnivel write Fnivel;

    [FieldName('tipo')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property tipo: string read Ftipo write Ftipo;

    [FieldName('aceita_lancamento')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property aceita: string read Faceita write Faceita;

    [FieldName('ordem')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ordem: Integer read Fordem write Fordem;

    [FieldName('desnivel')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property desnivel: string read Fdesnivel write Fdesnivel;


  End;


implementation


end.
