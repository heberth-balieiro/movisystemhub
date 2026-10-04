unit UFrmPesquisaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBasePesquisa, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, Vcl.Menus, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, cxGroupBox,
  Datasnap.DBClient;

type
  TFrmPesquisaCliente = class(TFrmBasePesquisa)
    TabCliente: TClientDataSet;
    TabClienteid_socio: TIntegerField;
    TabClientecodigo: TIntegerField;
    TabClientesituacao: TStringField;
    TabClientenome: TStringField;
    TabClienteapelido: TStringField;
    TabClientecep: TStringField;
    TabClienteendereco: TStringField;
    TabClientenumero: TStringField;
    TabClientebairro: TStringField;
    TabClientecomplemento: TStringField;
    TabClientetelefone: TStringField;
    TabClientecelular: TStringField;
    TabClientewhatsapp: TStringField;
    TabClientecpf: TStringField;
    TabClienteemail: TStringField;
    TabClienteobs: TMemoField;
    TabClienteaviso: TMemoField;
    TabClientecidade: TStringField;
    TabClienteuf: TStringField;
    GridCodigo: TcxGridDBColumn;
    GridNome: TcxGridDBColumn;
    GridApelido: TcxGridDBColumn;
    GridCPF: TcxGridDBColumn;
    GridTelefone: TcxGridDBColumn;
    Gridcelular: TcxGridDBColumn;
    Gridwhatsapp: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure edtBuscaChange(Sender: TObject);
    procedure GridCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Pesquisa;override;
    Procedure Selecionar;override;
  end;

var
  FrmPesquisaCliente: TFrmPesquisaCliente;

implementation

{$R *.dfm}

uses Controller.LookupHelper, uJKDialog, Vcl.Navigation;

Procedure TFrmPesquisaCliente.Selecionar;
begin

  if not Assigned(Tabcliente) then
  begin
    JKDialog('Erro', 'Dataset não foi inicializado.', tdErro);
    Exit;
  end;

  if not Tabcliente.Active then
  begin
    JKDialog('Erro', 'Dataset não está ativo.', tdErro);
    Exit;
  end;


  if Tabcliente.IsEmpty then
  begin
    JKDialog('Aviso', 'Nenhum cliente listado para selecionar.', tdAlerta);
    Exit;
  end;

  if Tabcliente.FindField('id_socio') = nil then
  begin
    JKDialog('Erro', 'Campo "id_socio" não encontrado.', tdErro);
    Exit;
  end;

  if Tabcliente.FieldByName('id_socio').IsNull then
  begin
    JKDialog('Aviso', 'Registro selecionado não possui ID de sócio.', tdAlerta);
    Exit;
  end;

  TNavigation.ParamOrdemInt := Tabcliente.FieldByName('id_socio').AsInteger;
  ModalResult := mrOk;

end;

procedure TFrmPesquisaCliente.edtBuscaChange(Sender: TObject);
begin
  Pesquisa;
end;

procedure TFrmPesquisaCliente.FormShow(Sender: TObject);
begin
  inherited;
  Tela  := 'Pessoa';
end;

procedure TFrmPesquisaCliente.GridCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  Selecionar;
end;

procedure TFrmPesquisaCliente.Pesquisa;
var
  Busca: string;
begin
  Busca := Trim(edtbusca.Text);

    if Busca <> '' then
    begin
      TLookupHelper.CarregarLookup(
      TabCliente,
      'SELECT s.id_socio, s.codigo, s.situacao, s.nome, s.apelido, ' +
      '       s.cep, s.endereco, s.numero, s.bairro, s.complemento, ' +
      '       s.telefone, s.celular, s.whatsapp, s.cpf, s.email, ' +
      '       s.obs, s.aviso, c.CIDADE, c.UF ' +
      'FROM socio s ' +
      'INNER JOIN cidade c ON s.id_cidade = c.ID_CIDADE ' +
      'WHERE s.excluido = 0 ' +
      '  AND s.situacao = ''ATIVO'' ' +
      '  AND s.cliente = ''S'' ' +

      '  AND (s.nome LIKE ''%' + Busca + '%'' ' +
      '    OR s.apelido LIKE ''%' + Busca + '%'' ' +
      '    OR s.cpf LIKE ''%' + Busca + '%'' ' +
      '    OR s.codigo = ''' + Busca + ''') ' +
      'ORDER BY s.codigo, s.nome');
    end
    else
    begin
      TLookupHelper.CarregarLookup(
      TabCliente,
      'SELECT s.id_socio, s.codigo, s.situacao, s.nome, s.apelido, ' +
      '       s.cep, s.endereco, s.numero, s.bairro, s.complemento, ' +
      '       s.telefone, s.celular, s.whatsapp, s.cpf, s.email, ' +
      '       s.obs, s.aviso, c.CIDADE, c.UF ' +
      'FROM socio s ' +
      'INNER JOIN cidade c ON s.id_cidade = c.ID_CIDADE ' +
      'WHERE s.excluido = 0 ' +
      '  AND s.situacao = ''ATIVO'' ' +
      '  AND s.cliente = ''S'' ' +
      'ORDER BY s.codigo, s.nome');
    end;




  TabCliente.First;
end;

end.
