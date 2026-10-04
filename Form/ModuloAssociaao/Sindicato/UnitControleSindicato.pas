unit UnitControleSindicato;

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
  Model.Pessoa, Controller.Pessoa, UnitRelatorioAssociado,
  UnitSindicatoDesfiliar, frxRich, UnitHistoricoFiliado;

type
  TFrmAssociadoSindicato = class(TFormNovoBasePesquisa)
    frxRelatorio: TfrxReport;
    frxDBAssociadoListagem: TfrxDBDataset;
    Memo1: TMemo;
    mdPesquisa: TdxMemData;
    mdPesquisaid_socio: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisamatricula: TIntegerField;
    mdPesquisanome: TStringField;
    mdPesquisacpf: TStringField;
    mdPesquisacelular: TStringField;
    mdPesquisawhatsapp: TStringField;
    mdPesquisaemail: TStringField;
    mdPesquisasituacao: TStringField;
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
    BtnDependente: TMenuItem;
    Enviarwhatsapp2: TMenuItem;
    BtnEnvioWhatsApp: TMenuItem;
    BtnEnvioMensagemLote: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    cxordenar: TcxComboBox;
    Label3: TLabel;
    BtnRefiliar: TMenuItem;
    frxRichObject1: TfrxRichObject;
    btnImprimirRequerimento: TMenuItem;
    BtnHistorico: TMenuItem;
    procedure BtnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnDependenteClick(Sender: TObject);
    procedure BtnEnvioWhatsAppClick(Sender: TObject);
    procedure BtnEnvioMensagemLoteClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure BtnRefiliarClick(Sender: TObject);
    procedure BtnHistoricoClick(Sender: TObject);
  private
    Procedure Refiliar;
    { Private declarations }
  public
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    //Procedure Excluir     ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
    { Public declarations }
  end;

var
  FrmAssociadoSindicato: TFrmAssociadoSindicato;
  ContPessoa  : TPessoaController;
  ObjPessoa   : TPESSOA;
implementation

{$R *.dfm}

uses UnitAssociadoCad, Vcl.Loading, UnitPrincipalNew, uJKDialog,
  UnitFrmWhatsApp, UnitFrmWhatsAppMassa, Vcl.Session, System.IOUtils,
  UConeSul, Vcl.PermissaoUsuario, uConfiguracaoService,System.Generics.Collections,
  UDM;

procedure TFrmAssociadoSindicato.FormCreate(Sender: TObject);
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

procedure TFrmAssociadoSindicato.FormShow(Sender: TObject);
begin
  inherited;
  try
    ParamsTela  := 'Associados/Dependentes';
    TitleText   := 'Controle de Associado';
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoSindicato.GridCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  try
    Editar;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmAssociadoSindicato.Listagem;
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
      FrxRelatorio.Variables['filtro']         := quotedstr('Filtro: '+cxativo.Text);

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

procedure TFrmAssociadoSindicato.Novo;
begin
  inherited;
  try
    if not Assigned(FrmAssociadoCad) then
    FrmAssociadoCad             := TFrmAssociadoCad.Create(Application);
    FrmAssociadoCad.ParamsStr   := 'N';
    FrmAssociadoCad.ShowModal;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoSindicato.Pesquisa;
var
List    : TObjectList<TPessoa>;
nCampo, nSituacao, nOrdem  : String;
begin
  inherited;
  try
    List      := Nil;
    nCampo    := '';
    nSituacao := '';
    nOrdem    := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    case cxAtivo.ItemIndex of
      1: nSituacao := 'ATIVO';
      2: nSituacao := 'INATIVO';
      3: nSituacao := 'INADIMPLENTE';
      4: nSituacao := 'SUSPENSO';
      5: nSituacao := 'CANCELADO';
      6: nSituacao := 'AFASTADO';
    end;

    case cxordenar.ItemIndex of
      0:
      begin//Código
        nOrdem  := ' order by s.codigo';
      end;
      1:
      begin //Matrícula
        nOrdem  := ' order by s.matricula';
      end;
      2:
      begin  //Nome
        nOrdem  := ' order by s.nome';
      end;
      3:
      begin //Situação
        nOrdem  := ' order by s.situacao';
      end;
    end;

    ContPessoa      := TPessoaController.Create;

    Try
      List  := ContPessoa.ListarTodos(nCampo, nSituacao, nOrdem);

      mdPesquisa.Close;
      mdPesquisa.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdPesquisa.Close;
        //JKDialog('Aviso','Nenhum registro encontrado!', tdAlerta);
        exit;
      end;

      if not mdPesquisa.Active then
        mdPesquisa.Open;

      mdPesquisa.DisableControls;

      for var Item in List do
      begin
        mdPesquisa.Append;
        mdPesquisaid_socio.AsInteger      := Item.idsocio;
        mdPesquisacodigo.AsInteger        := ITem.Codigo;
        mdPesquisamatricula.AsInteger     := Item.matricula;
        mdPesquisanome.AsString           := Item.nome;
        mdPesquisacpf.AsString            := Item.cpf;
        mdPesquisacelular.AsString        := Item.celular;
        mdPesquisawhatsapp.AsString       := Item.whatsapp;
        mdPesquisaemail.AsString          := Item.email;
        mdPesquisasituacao.AsString       := Item.situacao;
        mdPesquisa.Post;
      end;
      //mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContPessoa);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmAssociadoSindicato.Refiliar;
begin
  try
    if not mdPesquisa.Eof then
    begin
      //Validar cadastro para refilair
      if IndexText(Trim(mdPesquisaSituacao.AsString), ['INATIVO', 'SUSPENSO', 'CANCELADO', 'AFASTADO','ATESTADO','CEDIDO','DEMITIDO','FALECIDO']) >= 0 then
      begin
        if JKDialog('Aviso', 'Deseja refiliar o registro selecionado?', tdMensagem)  then
        begin
          if not Assigned(FrmAssociadoCad) then
          FrmAssociadoCad := TFrmAssociadoCad.Create(Application);
          FrmAssociadoCad.ParamsStr  := 'R';
          FrmAssociadoCad.ParamsInt  := mdPesquisaid_socio.AsInteger;
          if mdPesquisaid_socio.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;
          FrmAssociadoCad.Show;
        end;
      end
      else
      begin
        JKDialog('Alerta','Registro selecionado não pode realizar essa ação.', tdAlerta);
        exit;
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

procedure TFrmAssociadoSindicato.Relatorio;
begin
  inherited;
  try
//    if not Assigned(FrmRelAssociado) then
//    FrmRelAssociado := TFrmRelAssociado.Create(Application);
//    FrmRelAssociado.ShowModal;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmAssociadoSindicato.BtnDependenteClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

    if Permissao.TemPermissao('Permitir Cadastrar Dependente') then
    begin
      if not mdPesquisa.Eof then
      begin
        if mdPesquisaid_socio.AsInteger > 0 then
        begin
          if not Assigned(FrmDependentesCad) then
          FrmDependentesCad           := TFrmDependentesCad.Create(Application);
          FrmDependentesCad.ParamsInt	:= mdPesquisaid_socio.AsInteger;
          FrmDependentesCad.ParamsStr := 'N';
          FrmDependentesCad.ShowModal;
        end
        else
        JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
      end;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoSindicato.btnEditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir desfiliar') then
  begin
    Try
      Editar;
    Finally
      Pesquisa;
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmAssociadoSindicato.BtnEnvioMensagemLoteClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

    if Permissao.TemPermissao('Permitir Enviar WhatsApp Massa') then
    begin
      if not Assigned(FrmEnviarWhatsAppMassa) then
      FrmEnviarWhatsAppMassa            := TFrmEnviarWhatsAppMassa.Create(Application);
      FrmEnviarWhatsAppMassa.ShowModal;
    end
    else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoSindicato.BtnEnvioWhatsAppClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
PreencherDados  : TDadosMensaagem;
RetTelefone:string;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

    if Permissao.TemPermissao('Permitir Enviar WhatsApp') then
    begin
      if not mdPesquisa.Eof then
      begin
        if JKDialog('Aviso', 'Deseja enviar mensagem para o registro selecionado?', tdMensagem)  then
        begin
          if mdPesquisaid_socio.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end
          else
          begin
            if TConfiguracaoService.ValidarPessoaReceberWhatsApp(mdPesquisaid_socio.AsInteger,RetTelefone) then
            begin
              ObjPessoa        := Nil;
              ContPessoa       := Nil;

              ObjPessoa        := TPESSOA.Create;
              ContPessoa       := TPessoaController.Create;

              Try
                ObjPessoa    := ContPessoa.BuscarPorID(mdPesquisaid_socio.AsInteger);
                if Assigned(ObjPessoa) then
                begin
                  if not Assigned(FrmEnviarWhatsApp) then
                  FrmEnviarWhatsApp               := TFrmEnviarWhatsApp.Create(Application);

                  PreencherDados.Editpara         := Trim(ObjPessoa.nome);
                  PreencherDados.EditTelefone     := tirapontos(ObjPessoa.whatsapp);
                  PreencherDados.EditVendedor     := '';
                  PreencherDados.EditCPF          := ObjPessoa.cpf;
                  PreencherDados.EditMatricula    := ObjPessoa.matricula;
                  PreencherDados.EditIDPessoa     := mdPesquisaid_socio.AsInteger;
                  PreencherDados.EditMensagem     := 'Matrícula: '+Inttostr(ObjPessoa.matricula)+sLineBreak +
                                                      'Nome: '+ObjPessoa.nome+sLineBreak +
                                                      'CPF: '+ TConeSul.AplicarMascaraCPF(ObjPessoa.cpf)+sLineBreak +
                                                      'Data Nascimento: '+ FormatDateTime('dd/mm/yyyy', ObjPessoa.nascimento)+sLineBreak +
                                                      'Email: '+ObjPessoa.email;
                  PreencherDados.PreencherTela(FrmEnviarWhatsApp.cxPara,FrmEnviarWhatsApp.cxTelefone,FrmEnviarWhatsApp.cxMensagem);

                  FrmEnviarWhatsApp.ShowModal;
                end;
              Finally
                FreeAndNil(ObjPessoa);
                FreeAndNil(ContPessoa);
              End;
            end
            else
            JKDialog('Aviso',
               'O cadastro selecionado não está configurado para receber mensagem via whatsapp.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
          end;
        end;
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
      end;
    end
    else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoSindicato.BtnHistoricoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //refiliar associado
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir visualizar histórico') then
    begin
      try
      if not mdPesquisa.Eof then
      begin
          if not Assigned(FrmHistoricoFiliado) then
          FrmHistoricoFiliado            := TFrmHistoricoFiliado.Create(Application);
          FrmHistoricoFiliado.AIDRegistro:= mdPesquisaid_socio.AsInteger;

          if mdPesquisaid_socio.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;
          FrmHistoricoFiliado.ShowModal;

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
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmAssociadoSindicato.BtnLimparClick(Sender: TObject);
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

procedure TFrmAssociadoSindicato.BtnRefiliarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //refiliar associado
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir refiliar') then
  begin
    Try
      Refiliar;
    Finally
      Pesquisa;
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmAssociadoSindicato.Editar;
begin
  try
    if not mdPesquisa.Eof then
    begin
      //Validar situacao cadastro

      if IndexText(Trim(mdPesquisaSituacao.AsString), ['INATIVO', 'SUSPENSO', 'CANCELADO', 'AFASTADO']) >= 0 then
      begin
        JKDialog('Alerta','Registro selecionado não pode realizar essa ação.', tdAlerta);
        exit;
      end;

      if JKDialog('Aviso', 'Deseja desfiliar o registro selecionado?', tdMensagem)  then
      begin

        if not Assigned(FrmSindicatoDesfiliar) then
        FrmSindicatoDesfiliar            := TFrmSindicatoDesfiliar.Create(Application);
        FrmSindicatoDesfiliar.AIDRegistro:= mdPesquisaid_socio.AsInteger;

        if mdPesquisaid_socio.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmSindicatoDesfiliar.ShowModal;
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

procedure TFrmAssociadoSindicato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmAssociadoSindicato := nil;
end;

end.
