unit UnitPedido;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
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
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxGDIPlusClasses, Vcl.Menus, cxTimeEdit,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.Tabs, dxBarBuiltInMenu, cxPC,DateUtils,
  UFormNovoBaseGerenciamento, DBAccess, Uni, ACBrBase, ACBrEnterTab, cxGroupBox,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, System.ImageList, Vcl.ImgList,
  cxImageList, dxmdaset,
  Controller.Pedido, Model.Pedido,
  Model.PedidoItens,Controller.PedidoItens, uConfiguracaoService,
  Controller.LookupHelper, UnitGlobal, Datasnap.DBClient,Controller.Estoque,
  frxClass, frxDBSet, UDMRelatorio, frxExportBaseDialog, frxExportPDF,
  UnitFrmWhatsApp, ACBRUTIL, UnitFrmEmail

  ;
type
  TFrmPedido = class(TFormNovoBaseGerenciamento)
    cxPedido: TcxComboBox;
    Label5: TLabel;
    GridID: TcxGridDBColumn;
    GridData: TcxGridDBColumn;
    GridNumero: TcxGridDBColumn;
    GridPessoa: TcxGridDBColumn;
    GridPrazoPagamento: TcxGridDBColumn;
    GridTotal: TcxGridDBColumn;
    GridObservacao: TcxGridDBColumn;
    GridStatus: TcxGridDBColumn;
    GridVendedor: TcxGridDBColumn;
    GridUsuario: TcxGridDBColumn;
    GridHora: TcxGridDBColumn;
    GriddataValidade: TcxGridDBColumn;
    mdPesquisaid_pedido: TIntegerField;
    mdPesquisanumpedido: TIntegerField;
    mdPesquisadata: TDateField;
    mdPesquisahora: TTimeField;
    mdPesquisastatus: TStringField;
    mdPesquisaobservacao: TStringField;
    mdPesquisapedido: TStringField;
    mdPesquisatotal: TCurrencyField;
    mdPesquisadata_entrega: TDateField;
    mdPesquisanomepessoa: TStringField;
    mdPesquisaprazopagamento: TStringField;
    mdPesquisanomeusuario: TStringField;
    mdPesquisanomevendedor: TStringField;
    BtnReabrir: TMenuItem;
    BtnExcluir: TMenuItem;
    BtnCancelar: TMenuItem;
    btnEditar: TMenuItem;
    TabItensPedido: TClientDataSet;
    TabItensPedidoid_produto: TIntegerField;
    TabItensPedidoid_pedido_itens: TIntegerField;
    TabItensPedidoqtde: TFloatField;
    TabItensPedidoprc_unitario: TFloatField;
    TabItensPedidoservico: TStringField;
    TabItensPedidoseqitem: TIntegerField;
    TabItensPedidoprc_compra: TFloatField;
    TabItensPedidoprc_custo: TFloatField;
    TabItensPedidocontrolaestoque: TStringField;
    N1: TMenuItem;
    BtnImprimir: TMenuItem;
    Relatrio1: TMenuItem;
    N2: TMenuItem;
    btnenviowhatsapp: TMenuItem;
    btnemail: TMenuItem;
    frxRelatorio: TfrxReport;
    btnListagem: TMenuItem;
    FrxPedidoListagem: TfrxDBDataset;
    FrxPedidoItens: TfrxDBDataset;
    FrxPedido: TfrxDBDataset;
    frxPDF: TfrxPDFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnReabrirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnListagemClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure btnenviowhatsappClick(Sender: TObject);
    procedure btnemailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
  private
    Function EstoqueAjuste(Aid:Integer;Str:String):Boolean;
    { Private declarations }
  public
    { Public declarations }
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;
    //Procedure Listagem    ;override;
    //Procedure Relatorio   ;override;
  end;
var
  FrmPedido: TFrmPedido;

  ContPedido  : TPedidoController;
  ObjPedido   : TModelPedido;

  ContItens   : TPedidoItensController;
  ObjItens    : TModelPedidoItens;

  ContEstoque : TEstoqueController;
implementation

{$R *.dfm}

uses UConeSul, uJKDialog, Vcl.Loading, Vcl.Session, unitpedidocad,UnitPrincipalNew,
     UnitImpressao, Vcl.Validacoes,System.Generics.Collections,Model.Relatorio;

{ TFrmPedido }

procedure TFrmPedido.BtnCancelarClick(Sender: TObject);
begin
  //cancelar Pedido
  try
    if not mdPesquisa.Eof then
    begin
      if mdPesquisastatus.AsString = 'Aberto' then
      begin
        JKDialog('Alerta','Opção valída somente para pedido com o status fechado.', tdAlerta);
        exit;
      end;

      if mdPesquisastatus.AsString = 'Cancelado' then
      begin
        JKDialog('Alerta','Pedido já consta cancelado.', tdAlerta);
        exit;
      end;

      if JKDialog('Aviso', 'Deseja cancelar o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContPedido    := Nil;
          ContPedido    := TPedidoController.Create;

          if mdPesquisaid_pedido.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContPedido.CancelarPedido(mdPesquisaid_pedido.AsInteger, TSession.ID_USUARIO) then
          begin
            //Valida o estoque
            if TConfiguracaoService.ValidarControleEstoque(TSession.IDEMPRESA) then
            begin
              if not EstoqueAjuste(mdPesquisaid_pedido.AsInteger,'Estorno por cancelamento de pedido') then
              begin
                exit;
              end;
            end;

            Pesquisa;
            JKDialog('Sucesso','Registro cancelado com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContPedido);
        End;
      end;
    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmPedido.btnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TFrmPedido.btnemailClick(Sender: TObject);
var
  Relatorio :TModelRelatorio;
  msg:string;
  Email: string;
  idPessoa  : Integer;
begin
  Try
   Relatorio       := TModelRelatorio.Create;
    try
      Relatorio.RelPedido(msg, mdPesquisaid_pedido.AsInteger);
      Relatorio.RelPedidoItens(msg,mdPesquisaid_pedido.AsInteger);
      if not TConfiguracaoService.RetornoIDPessoaPedido(idPessoa, mdPesquisaid_pedido.AsInteger) then
      exit;
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelPedidoNew.fr3');
      frxPDF.FileName               := 'PEDIDO_'+Inttostr(DMRelatorio.ClientPedido.FieldByName('numPedido').Value)+'.PDF';
      frxPDF.DefaultPath            := ExtractFilePath(Application.ExeName) + '\Temp';
      frxPDF.ShowDialog             := False;
      frxPDF.ShowProgress           := False;
      frxPDF.OverwritePrompt        := False;
      FrxRelatorio.PrepareReport();
      FrxRelatorio.Export(frxPDF);
      if not TConfiguracaoService.ValidarPessoaReceberemail(idPessoa, Email) then
      begin
        JKDialog('Aviso','Cliente não configurado para enviar email!', tdAlerta);
        exit;
      end;
      FrmEnviarEmail                      := TFrmEnviarEmail.Create(Application);
      FrmEnviarEmail.nmPessoa             := DMRelatorio.ClientPedido.FieldByName('nome').Value;
      FrmEnviarEmail.vTituloAnexo         := 'Pedido/Orçamento';
      FrmEnviarEmail.AnexaArquivo         := True;
      FrmEnviarEmail.edtemail.EditValue   := email;
      FrmEnviarEmail.edtAssunto.EditValue := 'Pedido Nº '+Inttostr(DMRelatorio.ClientPedido.FieldByName('numPedido').Value);
      FrmEnviarEmail.edtMensagem.EditValue:= 'Segue em anexo Pedido/Orçamento';
      FrmEnviarEmail.EdtAnexo.items.Add(ExtractFilePath(Application.ExeName) + 'Temp\PEDIDO_'+Inttostr(DMRelatorio.ClientPedido.FieldByName('numPedido').Value)+'.PDF');
      FrmEnviarEmail.ShowModal;

    finally
      Relatorio.Free;
    end;
  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmPedido.btnenviowhatsappClick(Sender: TObject);
var
  Relatorio :TModelRelatorio;
  msg:string;
  Telefone: string;
  idPessoa  : Integer;
  PreencherDados  : TDadosMensaagem;
begin
  Try
    if not TConfiguracaoService.ValidarUsoWhatsApp(TSession.IDEMPRESA) then
    begin
      JKDialog('Aviso','Função não habilitada!', tdAlerta);
      exit;
    end;

    Relatorio       := TModelRelatorio.Create;
    try
      Relatorio.RelPedido(msg, mdPesquisaid_pedido.AsInteger);
      Relatorio.RelPedidoItens(msg,mdPesquisaid_pedido.AsInteger);
      if not TConfiguracaoService.RetornoIDPessoaPedido(idPessoa, mdPesquisaid_pedido.AsInteger) then
      exit;
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelPedidoNew.fr3');
      frxPDF.FileName               := 'PEDIDO_'+Inttostr(DMRelatorio.ClientPedido.FieldByName('numPedido').Value)+'.PDF';
      frxPDF.DefaultPath            := ExtractFilePath(Application.ExeName) + '\Temp';
      frxPDF.ShowDialog             := False;
      frxPDF.ShowProgress           := False;
      frxPDF.OverwritePrompt        := False;
      FrxRelatorio.PrepareReport();
      FrxRelatorio.Export(frxPDF);
      if not TConfiguracaoService.ValidarPessoaReceberWhatsApp(idPessoa, Telefone) then
      begin
        JKDialog('Aviso','Cliente não configurado para enviar whatsapp!', tdAlerta);
        exit;
      end;
      FrmEnviarWhatsApp                         := TFrmEnviarWhatsApp.Create(Application);
      PreencherDados.Editpara                   := Trim(DMRelatorio.ClientPedido.FieldByName('nome').Value);
                  PreencherDados.EditTelefone   := Tirapontos(telefone);
                  PreencherDados.EditVendedor   := mdPesquisanomevendedor.AsString;
                  PreencherDados.EditCPF        := DMRelatorio.ClientPedido.FieldByName('cpf').Value;
                  PreencherDados.EditDataPedido := DMRelatorio.ClientPedido.FieldByName('data').Value;
                  PreencherDados.EditHoraPedido := DMRelatorio.ClientPedido.FieldByName('hora').Value;
                  PreencherDados.EditPedido     := 1;
                  PreencherDados.EditTotal      := DMRelatorio.ClientPedido.FieldByName('total').Value;
                  PreencherDados.EditIDPessoa   := idPessoa;
                  PreencherDados.EditMensagem   := 'Segue seu Pedido/Orçamento';

                  PreencherDados.PreencherTela(FrmEnviarWhatsApp.cxPara, FrmEnviarWhatsApp.cxTelefone, FrmEnviarWhatsApp.cxMensagem);
      FrmEnviarWhatsApp.cxListAnexo.items.Add(ExtractFilePath(Application.ExeName) + 'Temp\PEDIDO_'+Inttostr(DMRelatorio.ClientPedido.FieldByName('numPedido').Value)+'.PDF');
      FrmEnviarWhatsApp.ShowModal;
    finally
      Relatorio.Free;
    end;
  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmPedido.BtnExcluirClick(Sender: TObject);
begin
  try
    if not mdPesquisa.Eof then
    begin
      if mdPesquisastatus.AsString = 'Fechado' then
      begin
        JKDialog('Alerta','Opção valída somente para pedido com o status aberto.', tdAlerta);
        exit;
      end;

      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContPedido    := Nil;
          ContPedido    := TPedidoController.Create;

          if mdPesquisaid_pedido.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContPedido.Excluir(mdPesquisaid_pedido.AsInteger) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContPedido);
        End;
      end;
    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmPedido.BtnImprimirClick(Sender: TObject);
var
  Relatorio :TModelRelatorio;
  msg:string;
begin
  Try
    Relatorio       := TModelRelatorio.Create;
    try
      Relatorio.RelPedido(msg, mdPesquisaid_pedido.AsInteger);
      Relatorio.RelPedidoItens(msg,mdPesquisaid_pedido.AsInteger);
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelPedidoNew.fr3');
      FrxRelatorio.Report.PrepareReport();
      FrxRelatorio.ShowReport;
    finally
      Relatorio.Free;
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmPedido.btnListagemClick(Sender: TObject);
var
  DadosEmpresa  : TEmpresaRelatorio;
  TempImage: Timage;
begin
  try
    if not mdPesquisa.Eof then
    begin

      DadosEmpresa  := TConfiguracaoService.ObterDadosEmpresaRelatorio(TSession.IDEMPRESA);
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\Pedido\RelListagemPedido.fr3');

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

      FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
      FrxRelatorio.Variables['ncep']            :=quotedstr(DadosEmpresa.cep);
      FrxRelatorio.Variables['ncidade']         :=quotedstr(DadosEmpresa.cidade);


      FrxRelatorio.Report.PrepareReport();
      FrxRelatorio.ShowReport;
      mdPesquisa.EnableControls;
      mdPesquisa.First;
    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPedido.BtnReabrirClick(Sender: TObject);
begin
  //reabrir
  try
    if not mdPesquisa.Eof then
    begin
      if mdPesquisastatus.AsString = 'Aberto' then
      begin
        JKDialog('Alerta','Opção valída somente para pedido com o status fechado.', tdAlerta);
        exit;
      end;

      if mdPesquisastatus.AsString = 'Cancelado' then
      begin
        JKDialog('Alerta','Pedido consta como cancelado.', tdAlerta);
        exit;
      end;

      if JKDialog('Aviso', 'Deseja reabrir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContPedido    := Nil;
          ContPedido    := TPedidoController.Create;

          if mdPesquisaid_pedido.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContPedido.ReabrirPedido(mdPesquisaid_pedido.AsInteger, tSession.ID_USUARIO) then
          begin
            //Valida o estoque
            if TConfiguracaoService.ValidarControleEstoque(TSession.IDEMPRESA) then
            begin
              if not EstoqueAjuste(mdPesquisaid_pedido.AsInteger,'Estorno por reabertura de pedido') then
              begin
                exit;
              end;
            end;

            Pesquisa;
            JKDialog('Sucesso','Registro cancelado com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContPedido);
        End;
      end;
    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

Function TFrmPedido.EstoqueAjuste(Aid:Integer;Str:String):Boolean;
var
I:integer;
begin
  Result  := True;
  ContEstoque   := Nil;

  Try

    TLookupHelper.CarregarLookup(
                  TabItensPedido,GetProdutoPedidoListaSQL(Aid));

    ContEstoque := TEstoqueController.Create;
    Try
      TabItensPedido.First;
      TabItensPedido.DisableControls;

      for I := 0 to TabItensPedido.RecordCount -1 do
      begin
        if (TabItensPedidocontrolaestoque.AsString = 'S') and (TabItensPedidoservico.AsString = 'N') then
        begin
          if not ContEstoque.EstornarEstoque(TabItensPedidoid_produto.AsInteger,
                                  TabItensPedidoqtde.AsFloat,
                                  TSession.IDEMPRESA,
                                  TSession.ID_USUARIO,
                                  AID,
                                  TabItensPedidoprc_compra.AsFloat,
                                  TabItensPedidoprc_unitario.AsFloat,
                                  Str
                                  ) then
          begin
            Result  := False;
          end;
        end;
        TabItensPedido.Next;
      end;

      TabItensPedido.EnableControls;

    Finally
      FreeandNil(ContEstoque);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPedido.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if mdPesquisastatus.AsString = 'Fechado' then
      begin
        JKDialog('Alerta','Opção valída somente para pedido com o status Aberto.', tdAlerta);
        exit;
      end;

      if mdPesquisastatus.AsString = 'Cancelado' then
      begin
        JKDialog('Alerta','Pedido consta como cancelado.', tdAlerta);
        exit;
      end;

      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmPedidoCad) then
        FrmPedidoCad := TFrmPedidoCad.Create(Application);
        FrmPedidoCad.ParamsStr  := 'E';
        FrmPedidoCad.ParamsInt  := mdPesquisaid_pedido.AsInteger;

        if mdPesquisaid_pedido.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmPedidoCad.Show;
      end;
    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPedido.Excluir;
begin
  inherited;
end;

procedure TFrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmPedido:= nil;
end;

procedure TFrmPedido.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmPedido.FormShow(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmPedido.Novo;
begin
  inherited;
  if not Assigned(FrmPedidoCad) then
  FrmPedidoCad := TFrmPedidoCad.Create(Application);
  FrmPedidoCad.ParamsStr  := 'N';
  FrmPedidoCad.ShowModal;
end;

procedure TFrmPedido.Pesquisa;
var
List    : TObjectList<TModelPedido>;
nCampo, nSituacao, nTipo : String;
begin
  inherited;
  try
    List      := Nil;
    nCampo    := '';
    nSituacao := '';
    nTipo     := '';
    ContPedido:= nil;

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    case EdtFiltropor.ItemIndex of
      1: nsituacao   := 'A';
      2: nsituacao   := 'F';
      3: nsituacao   := 'C';
    end;

    case cxPedido.ItemIndex of
      0: nTipo   := 'P';
      1: nTipo   := 'O';
    end;

    ContPedido       := TPedidoController.Create;

    Try
      List  := ContPedido.ListarTodos(EdtDataInicial.EditValue, edtDataFinal.EditValue, nsituacao, nTipo, nCampo, TSession.IDEMPRESA);

      mdPesquisa.Close;
      mdPesquisa.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdPesquisa.Close;
        exit;
      end;

      if not mdPesquisa.Active then
        mdPesquisa.Open;

      mdPesquisa.DisableControls;

      for var Item in List do
      begin
        mdPesquisa.Append;

        mdPesquisaid_pedido.AsInteger       :=Item.id_Pedido;
        mdPesquisanumpedido.AsInteger       :=Item.numPedido;
        mdPesquisadata.AsDateTime           :=Item.data;
        mdPesquisahora.AsDateTime           :=Item.hora;
        mdPesquisastatus.AsString           :=Item.Status;
        mdPesquisaobservacao.AsString       :=Item.observacao;
        mdPesquisapedido.AsString           :=Item.Pedido;
        mdPesquisatotal.AsCurrency          :=Item.total;
        mdPesquisadata_entrega.AsDateTime   :=Item.dataentrega;
        mdPesquisanomepessoa.AsString       :=Item.nomepessoa;
        mdPesquisaprazopagamento.AsString   :=Item.prazopagamento;
        mdPesquisanomeusuario.AsString      :=Item.nomeusuario;
        mdPesquisanomevendedor.AsString     :=Item.nomevendedor;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContPedido);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

End.
