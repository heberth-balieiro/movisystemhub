unit Model.LancamentoBancario;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('lancamento_bancario')]
  TLancamentoBancario = class
  private
    Fid_origem: Integer;
    Fdata_vencimento: TDate;
    Fhistorico: String;
    Fprevisao: String;
    Fid_custo: Integer;
    Fdata_alteracao: TDateTime;
    Fobservacao: String;
    Fid_historico: Integer;
    Fvalor: Currency;
    Fdata_emissao: TDate;
    Fid_pessoa: Integer;
    Fid_planoconta: Integer;
    Fdata_cadastro: TDateTime;
    Fdata_competencia: TDate;
    Ftipo_movimento: String;
    Fid_prazo: Integer;
    Fnumero: String;
    Fdata_conciliacao: TDate;
    Fsituacao: String;
    Fid_lancamento_bancario: Integer;
    Fid_empresa: Integer;
    Fid_departamento: Integer;
    Fid_conta: Integer;
    Fconciliado: String;
    Ftabela_origem: String;
    Forigem: String;
    Fcheque: String;
    Fid_usuario_alt: Integer;
    Fid_usuario: Integer;
    Fnbanco: String;
    Fnhistorico: String;
    Ftem_anexo: Integer;
    Fid_usuario_conci: Integer;
    Ffitid: String;

  public
    [FieldName('id_lancamento_bancario', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_lancamento_bancario: Integer Read Fid_lancamento_bancario Write Fid_lancamento_bancario;

    [FieldName('id_conta')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_conta: Integer Read Fid_conta Write Fid_conta;

    [FieldName('data_emissao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property data_emissao: TDate Read Fdata_emissao Write Fdata_emissao;

    [FieldName('data_competencia')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property data_competencia: TDate Read Fdata_competencia Write Fdata_competencia;

    [FieldName('data_vencimento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property data_vencimento: TDate Read Fdata_vencimento Write Fdata_vencimento;

    [FieldName('numero')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property numero: String Read Fnumero Write Fnumero;

    [FieldName('valor')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property valor: Currency Read Fvalor Write Fvalor;

    [FieldName('tipo_movimento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipo_movimento: String Read Ftipo_movimento Write Ftipo_movimento;

    [FieldName('situacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property situacao: String Read Fsituacao Write Fsituacao;

    [FieldName('cheque')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cheque: String Read Fcheque Write Fcheque;

    [FieldName('previsao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property previsao: String Read Fprevisao Write Fprevisao;

    [FieldName('id_historico')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_historico: Integer Read Fid_historico Write Fid_historico;

    [FieldName('historico')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property historico: String Read Fhistorico Write Fhistorico;

    [FieldName('id_prazo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_prazo: Integer Read Fid_prazo Write Fid_prazo;


    [FieldName('id_planoconta')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_planoconta: Integer Read Fid_planoconta Write Fid_planoconta;

    [FieldName('id_custo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_custo: Integer Read Fid_custo Write Fid_custo;

    [FieldName('id_pessoa')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_pessoa: Integer Read Fid_pessoa Write Fid_pessoa;

    [FieldName('id_departamento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_departamento: Integer Read Fid_departamento Write Fid_departamento;

    [FieldName('origem')]
    [FieldOptions([foInsert, foSelect])]
    property origem: String Read Forigem Write Forigem;

    [FieldName('id_origem')]
    [FieldOptions([foInsert, foSelect])]
    property id_origem: Integer Read Fid_origem Write Fid_origem;

    [FieldName('tabela_origem')]
    [FieldOptions([foInsert, foSelect])]
    property tabela_origem: String Read Ftabela_origem Write Ftabela_origem;

    [FieldName('conciliado')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property conciliado: String Read Fconciliado Write Fconciliado;

    [FieldName('data_conciliacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property data_conciliacao: TDate Read Fdata_conciliacao Write Fdata_conciliacao;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property id_usuario: Integer Read Fid_usuario Write Fid_usuario;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate])]
    property id_usuario_alt: Integer Read Fid_usuario_alt Write Fid_usuario_alt;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer Read Fid_empresa Write Fid_empresa;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert])]
    property data_cadastro: TDateTime Read Fdata_cadastro Write Fdata_cadastro;

    [FieldName('data_alteracao')]
    [FieldOptions([foUpdate])]
    property data_alteracao: TDateTime Read Fdata_alteracao Write Fdata_alteracao;

    [FieldName('id_usuario_conci')]
    [FieldOptions([foInsert, foUpdate])]
    property id_usuario_conci: Integer Read Fid_usuario_conci Write Fid_usuario_conci;


    [FieldName('fitid')]
    [FieldOptions([foInsert, foSelect])]
    property fitid: String Read Ffitid Write Ffitid;


    [FieldName('nhistorico')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property nhistorico: String Read Fnhistorico Write Fnhistorico;

    [FieldName('nbanco')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property nbanco: String Read Fnbanco Write Fnbanco;

    [FieldName('tem_anexo')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property tem_anexo: Integer Read Ftem_anexo Write Ftem_anexo;


  end;

implementation

end.
