unit UnitAtualizacaoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, dxGDIPlusClasses, cxMaskEdit,System.JSON, ACBRUTIL,
  Vcl.ComCtrls, frxClass, frxDBSet, UnitDependentesCad, UnitCarteirinha,
  Vcl.Validacoes, APP.Asmuv, UFormNovoBasePesquisa, cxContainer,
  Vcl.ButtonStylesAttributes, System.ImageList, Vcl.ImgList, cxImageList,
  DBAccess, Uni, ACBrBase, ACBrEnterTab, Vcl.StyledButton, cxDropDownEdit,
  cxTextEdit, cxGroupBox, dxmdaset,
  UnitRelatorioAssociado, Model.AssociadoAtualizarAPI, Controller.AssociadoAtualizacaoAPI,
  UnitSindicatoDesfiliar, frxRich, UnitHistoricoFiliado,
  UnitAssociadoProcessarAtualizacao;

type
  TFrmAssociadoAtualizacao = class(TFormNovoBasePesquisa)
    frxRelatorio: TfrxReport;
    frxDBAssociadoListagem: TfrxDBDataset;
    mdPesquisa: TdxMemData;
    GridRecId: TcxGridDBColumn;
    Gridid_socio: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridmatricula: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridcpf: TcxGridDBColumn;
    Gridcelular: TcxGridDBColumn;
    Gridwhatsapp: TcxGridDBColumn;
    Gridemail: TcxGridDBColumn;
    Gridsituacao: TcxGridDBColumn;
    N7: TMenuItem;
    cxordenar: TcxComboBox;
    Label3: TLabel;
    frxRichObject1: TfrxRichObject;
    GridColumn1: TcxGridDBColumn;
    GridColumn2: TcxGridDBColumn;
    GridColumn3: TcxGridDBColumn;
    GridColumn5: TcxGridDBColumn;
    mdPesquisaid_solicitacao_api: TLargeintField;
    mdPesquisaid_empresa: TIntegerField;
    mdPesquisapessoa_id_api: TIntegerField;
    mdPesquisanome: TStringField;
    mdPesquisacpf: TStringField;
    mdPesquisamatricula: TIntegerField;
    mdPesquisaemail_novo: TStringField;
    mdPesquisatelefone_novo: TStringField;
    mdPesquisawhatsapp_novo: TStringField;
    mdPesquisasituacao: TStringField;
    mdPesquisarecebido_em: TDateTimeField;
    mdPesquisaprocessado_em: TDateTimeField;
    mdPesquisaerro: TStringField;
    mdPesquisacep_novo: TStringField;
    mdPesquisaendereco_novo: TStringField;
    mdPesquisanumero_novo: TStringField;
    mdPesquisabairro_novo: TStringField;
    mdPesquisacomplemento_novo: TStringField;
    mdPesquisacidade_nova: TStringField;
    procedure BtnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnNovoClick(Sender: TObject);

  private

    { Private declarations }
  public
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    //Procedure Editar      ;override;
    //Procedure Excluir     ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
    { Public declarations }
  end;

var
  FrmAssociadoAtualizacao: TFrmAssociadoAtualizacao;
  Controller  : TAssociadoAtualizacaoController;
  Obj         : TAssociadoAtualizacao;
implementation

{$R *.dfm}

uses Vcl.Loading, UnitPrincipalNew, uJKDialog,
  Vcl.Session, System.IOUtils,
  UConeSul, Vcl.PermissaoUsuario, uConfiguracaoService,System.Generics.Collections,
  UDM;

procedure TFrmAssociadoAtualizacao.FormCreate(Sender: TObject);
begin
  inherited;
  try
    if not mdPesquisa.Active then
      mdPesquisa.Open;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoAtualizacao.FormShow(Sender: TObject);
begin
  inherited;
  try
    ParamsTela  := 'Associados/Dependentes';
    TitleText   := 'Atualiza'#231#227'o Cadastrais (API)';

    if cxAtivo.Properties.Items.IndexOf('Rejeitado') < 0 then
      cxAtivo.Properties.Items.Add('Rejeitado');
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoAtualizacao.GridCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  try
    BtnNovoClick(BtnNovo);
    AHandled := True;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoAtualizacao.Listagem;
var
  DadosEmpresa  : TEmpresaRelatorio;
  TempImage     : Timage;
begin
  inherited;
  try
    if mdPesquisa.RecordCount > 0 then
    begin
      DadosEmpresa  := TConfiguracaoService.ObterDadosEmpresaRelatorio(TSession.IDEMPRESA);
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelAssociadoListagem.fr3');

      mdPesquisa.First;
      mdPesquisa.DisableControls;

      FrxRelatorio.Variables.Clear;
      FrxRelatorio.Variables['nrazao']          :=quotedstr(DadosEmpresa.razao);
      FrxRelatorio.Variables['nfantasia']       :=quotedstr(DadosEmpresa.fantasia);
      FrxRelatorio.Variables['nendereco']       :=quotedstr(DadosEmpresa.endereco);
      FrxRelatorio.Variables['nnumero']         :=quotedstr(DadosEmpresa.numero);
      FrxRelatorio.Variables['nbairro']         :=quotedstr(DadosEmpresa.bairro);
      FrxRelatorio.Variables['ntelefone']       :=quotedstr(DadosEmpresa.telefone);
      FrxRelatorio.Variables['nfone1']          :=quotedstr(DadosEmpresa.telefone2);
      FrxRelatorio.Variables['nfone2']          :=quotedstr(DadosEmpresa.celular);
      FrxRelatorio.Variables['nemail']          :=quotedstr(DadosEmpresa.email1);
      FrxRelatorio.Variables['ncnpj']           :=quotedstr(DadosEmpresa.cnpj);
      FrxRelatorio.Variables['nie']             :=quotedstr(DadosEmpresa.ie);

      try
        TempImage             := TImage.Create(nil);
        TConesul.ConvBase64Img(DadosEmpresa.logo);
        TempImage.Picture    :=TConesul.nfoto;
        TConesul.nfoto.Free;
        TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
      finally
        TempImage.Free;
      end;

      FrxRelatorio.Variables['wlogo']           := quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
      FrxRelatorio.Variables['ncep']            := quotedstr(DadosEmpresa.cep);
      FrxRelatorio.Variables['ncidade']         := quotedstr(DadosEmpresa.cidade);
      FrxRelatorio.Variables['filtro']          := quotedstr('Filtro: '+cxativo.Text);

      FrxRelatorio.Report.PrepareReport();
      FrxRelatorio.ShowReport;
      mdPesquisa.EnableControls;
      mdPesquisa.First;
    end
    else
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoAtualizacao.Novo;
begin
  inherited;
end;

procedure TFrmAssociadoAtualizacao.Pesquisa;
var
  List: TObjectList<TAssociadoAtualizacao>;
  nCampo, nSituacao, nOrdem: String;
begin
  inherited;
  try
    List      := Nil;
    nCampo    := '';
    nSituacao := '';
    nOrdem    := '';

    if Trim(edtBusca.Text) <> '' then
      nCampo := Trim(edtBusca.Text);

    case cxAtivo.ItemIndex of
      1: nSituacao := 'Pendente';
      2: nSituacao := 'Processado';
      3: nSituacao := 'Erro';
      4: nSituacao := 'Rejeitado';
    end;

    case cxordenar.ItemIndex of
      0: nOrdem := 'cpf';
      1: nOrdem := 'matricula';
      2: nOrdem := 'nome';
      3: nOrdem := 'situacao';
    end;

    Controller := TAssociadoAtualizacaoController.Create;
    try
      List := Controller.ListarTodos(nCampo, nSituacao, nOrdem);

      mdPesquisa.Close;
      mdPesquisa.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdPesquisa.Close;
        Exit;
      end;

      if not mdPesquisa.Active then
        mdPesquisa.Open;

      mdPesquisa.DisableControls;
      try
        for var Item in List do
        begin
          mdPesquisa.Append;
          mdPesquisaid_solicitacao_api.AsLargeInt := Item.Id_Solicitacao_API;
          mdPesquisapessoa_id_api.AsInteger       := Item.Pessoa_Id_API;
          mdPesquisamatricula.AsInteger           := StrToInt(Item.Matricula);
          mdPesquisanome.AsString                 := Item.Nome;
          mdPesquisacpf.AsString                  := Item.CPF;
          mdPesquisatelefone_novo.AsString        := Item.Telefone_Novo;
          mdPesquisawhatsapp_novo.AsString        := Item.Whatsapp_Novo;
          mdPesquisaemail_novo.AsString           := Item.Email_Novo;
          mdPesquisasituacao.AsString             := Item.Situacao;
          mdPesquisarecebido_em.AsDateTime        := Item.Recebido_Em;

          if Item.Processado_Em > 0 then
            mdPesquisaprocessado_em.AsDateTime := Item.Processado_Em
          else
            mdPesquisaprocessado_em.Clear;

          mdPesquisaerro.AsString := Item.Erro;
          mdPesquisa.Post;
        end;
        mdPesquisa.First;
      finally
        mdPesquisa.EnableControls;
      end;
    finally
      FreeAndNil(Controller);
      if Assigned(List) then
        List.Free;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoAtualizacao.Relatorio;
begin
  inherited;
  try
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoAtualizacao.BtnLimparClick(Sender: TObject);
begin
  inherited;
  try
    mdPesquisa.Close;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoAtualizacao.BtnNovoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
  IdSolicitacao: Int64;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

  if (not mdPesquisa.Active) or mdPesquisa.IsEmpty then
  begin
    JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
    Exit;
  end;

  if not Permissao.TemPermissao('Permitir Processar') then
  begin
    JKDialog('Acesso Negado',
             'O seu perfil n'#227'o tem permiss'#227'o para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
    Exit;
  end;

  IdSolicitacao := mdPesquisaid_solicitacao_api.AsLargeInt;

  if IdSolicitacao <= 0 then
  begin
    JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
    Exit;
  end;

  if IdSolicitacao > High(Integer) then
  begin
    JKDialog('Erro',
             'O ID da solicita'#231#227'o excede o limite suportado pela tela de processamento.',
             tdErro);
    Exit;
  end;

  if not Assigned(FrmAssociadoProcessarAtualizacao) then
    FrmAssociadoProcessarAtualizacao := TFrmAssociadoProcessarAtualizacao.Create(Application);

  FrmAssociadoProcessarAtualizacao.ParamsInt := Integer(IdSolicitacao);
  FrmAssociadoProcessarAtualizacao.Show;
end;

procedure TFrmAssociadoAtualizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmAssociadoAtualizacao := nil;
end;

end.