unit UnitAssociado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
  Model.Pessoa, Controller.Pessoa, UnitRelatorioAssociado;

type
  TFrmAssociado = class(TFormNovoBasePesquisa)
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
    BtnCarteira: TMenuItem;
    Enviarwhatsapp2: TMenuItem;
    BtnEnvioWhatsApp: TMenuItem;
    BtnEnvioMensagemLote: TMenuItem;
    BtnSincronizarCadastro: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    cxordenar: TcxComboBox;
    Label3: TLabel;
    procedure BtnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnDependenteClick(Sender: TObject);
    procedure BtnCarteiraClick(Sender: TObject);
    procedure BtnEnvioWhatsAppClick(Sender: TObject);
    procedure BtnEnvioMensagemLoteClick(Sender: TObject);
    procedure BtnSincronizarCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
    { Public declarations }
  end;

var
  FrmAssociado: TFrmAssociado;
  ContPessoa  : TPessoaController;
  ObjPessoa   : TPESSOA;
implementation

{$R *.dfm}

uses UnitAssociadoCad, Vcl.Loading, UnitPrincipalNew, uJKDialog,
  UnitFrmWhatsApp, UnitFrmWhatsAppMassa, Vcl.Session, System.IOUtils,
  UConeSul, Vcl.PermissaoUsuario, uConfiguracaoService,System.Generics.Collections,
  UDM;

procedure TFrmAssociado.FormCreate(Sender: TObject);
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

procedure TFrmAssociado.FormShow(Sender: TObject);
begin
  inherited;
  try
    ParamsTela  := 'Associados/Dependentes';
    TitleText   := 'Pesquisa de Associado';
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociado.GridCellDblClick(Sender: TcxCustomGridTableView;
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

procedure TFrmAssociado.Listagem;
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

procedure TFrmAssociado.Novo;
begin
  inherited;
  try
    if not Assigned(FrmAssociadoCad) then
    FrmAssociadoCad := TFrmAssociadoCad.Create(Application);
    FrmAssociadoCad.ParamsStr  := 'N';
    FrmAssociadoCad.ShowModal;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociado.Pesquisa;
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

procedure TFrmAssociado.Relatorio;
begin
  inherited;
  try
    if not Assigned(FrmRelAssociado) then
    FrmRelAssociado := TFrmRelAssociado.Create(Application);
    FrmRelAssociado.ShowModal;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmAssociado.BtnSincronizarCadastroClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

    if Permissao.TemPermissao('Permitir Sincronizar API') then
    begin
      if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
      begin
        //Incluir os cadastro para sincronizar
        ContPessoa      := TPessoaController.Create;

        Try
          if ContPessoa.IncluiRegistroSincronizar then
          begin
            ContPessoa.IncluiRegistroDependenteSincronizar;
            TConfiguracaoService.SincronizarGravar(4, 0);
            TConfiguracaoService.SincronizarGravar(5, 0);
            JKDialog('Sucesso','Sincronização em execução. Você pode continuar usando o sistema!', tdSucesso);
          end
          else
          JKDialog('Aviso','Comando não execultado!', tdAlerta);

        Finally
          FreeAndNil(ContPessoa);
        End;

      end;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
  except on E: Exception do
    JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
  end;
end;

procedure TFrmAssociado.BtnDependenteClick(Sender: TObject);
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

procedure TFrmAssociado.BtnEnvioMensagemLoteClick(Sender: TObject);
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

procedure TFrmAssociado.BtnEnvioWhatsAppClick(Sender: TObject);
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

procedure TFrmAssociado.BtnLimparClick(Sender: TObject);
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

procedure TFrmAssociado.BtnCarteiraClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if Permissao.TemPermissao('Permitir Utilizar') then
    begin
      //Gerenciar Carteirinha
      if not Assigned(FrmCarteira) then
        FrmCarteira                         := TFrmCarteira.Create(Application);
        FrmCarteira.EdtBusca.EditValue      := mdPesquisamatricula.AsInteger;
        FrmCarteira.Show;
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

procedure TFrmAssociado.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmAssociadoCad) then
        FrmAssociadoCad := TFrmAssociadoCad.Create(Application);
        FrmAssociadoCad.ParamsStr  := 'E';
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
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociado.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContPessoa    := Nil;
          ContPessoa    := TPessoaController.Create;
          if mdPesquisaid_socio.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          //Validar se tem Carteira na tabela
          if TConfiguracaoService.ValidarPessoaCarteiraWeb(mdPesquisaid_socio.AsInteger) then
          begin
            JKDialog('Alerta','Existe carteira web vinculada ao cadastro!', tdAlerta);
            exit;
          end;

          if ContPessoa.ExcluidoCancelado(mdPesquisaid_socio.AsInteger) then
          JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);

          if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
          begin
            TConfiguracaoService.SincronizarGravar(4, mdPesquisaid_socio.AsInteger);
            TConfiguracaoService.SincronizarGravar(6, mdPesquisaid_socio.AsInteger);
          end;
        Finally
          FreeAndNil(ContPessoa);
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

procedure TFrmAssociado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmAssociado := nil;
end;

end.









//procedure TFrmAssociado.Listagem1Click(Sender: TObject);
//var
//Model   :TModelEmpresa;
//msg:string;
//TempImage: Timage;
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');
//
//  if Permissao.TemPermissao('Permitir Imprimir Listagem') then
//  begin
//    //Listagem Associado
//    if not dm.TabConsSocio.Eof then
//    begin
//
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelAssociadoListagem.fr3');
//      Try
//        DM.TabConsSocio.DisableControls;
//
//        Model             := TModelEmpresa.Create;
//        Try
//          Model.idempresa   := TSession.IDEMPRESA;
//          Model.SelectCabecalhoReport(msg);
//
//          FrxRelatorio.Variables.Clear;
//          FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
//          FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
//          FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
//          FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
//          FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
//          FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
//          FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
//          FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
//          FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
//          FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
//          FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);
//
//          try
//            // Decodifica a imagem Base64 e carrega no fluxo de memória
//            TempImage   := TImage.Create(nil);
//            TConesul.ConvBase64Img(model.logo);
//            TempImage.Picture    :=TConesul.nfoto;
//            TConesul.nfoto.Free;
//            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
//          finally
//            TempImage.Free;
//          end;
//
//          FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
//          FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
//          FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Todos ativos/inativos');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsSocio.First;
//        DM.TabConsSocio.EnableControls;
//      End;
//
//      //JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
//    end
//    else
//    begin
//      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
//    end;
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//end;






