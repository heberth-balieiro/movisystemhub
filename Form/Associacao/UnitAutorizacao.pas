unit UnitAutorizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, frxClass, frxDBSet,
  Vcl.Tabs, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox,
  UFormNovoBasePesquisa, Vcl.ButtonStylesAttributes, System.ImageList,
  Vcl.ImgList, cxImageList, DBAccess, Uni, ACBrBase, ACBrEnterTab,
  Vcl.StyledButton, dxmdaset, Controller.Autorizacao, Model.Autorizacao,
  Vcl.PermissaoUsuario;

type
  TFrmAutorizacao = class(TFormNovoBasePesquisa)
    mdPesquisa: TdxMemData;
    mdPesquisaid_autorizacao: TIntegerField;
    mdPesquisadata: TDateField;
    mdPesquisanome: TStringField;
    mdPesquisaqtde_pessoa: TIntegerField;
    mdPesquisapessoa_autorizou: TStringField;
    mdPesquisastatus: TStringField;
    Label3: TLabel;
    cxData1: TcxDateEdit;
    cxdata2: TcxDateEdit;
    GridRecId: TcxGridDBColumn;
    Gridid_autorizacao: TcxGridDBColumn;
    Griddata: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridqtde_pessoa: TcxGridDBColumn;
    Gridpessoa_autorizou: TcxGridDBColumn;
    Gridstatus: TcxGridDBColumn;
    N2: TMenuItem;
    btnsincronizar: TMenuItem;
    procedure BtnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnsincronizarClick(Sender: TObject);

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
  FrmAutorizacao: TFrmAutorizacao;
  ContAut       : TAutorizacaoController;
  ObjAut        : TModelautorizacao;

implementation

{$R *.dfm}

uses uJKDialog, Vcl.Session, Vcl.Loading,
  Vcl.Navigation, UnitCadAutorizacao, System.DateUtils, UnitPrincipalNew,
  uConfiguracaoService,System.Generics.Collections;

procedure TFrmAutorizacao.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmAutorizacao.btnsincronizarClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Autorização');

    if Permissao.TemPermissao('Permitir Sincronizar API') then
    begin
      if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
      begin
        //Incluir os cadastro para sincronizar
        ContAut       := nil;
        ContAut       := TAutorizacaoController.Create;

        Try
          if ContAut.IncluiRegistroSincronizar then
          begin
            TConfiguracaoService.SincronizarGravar(16, 0);
            JKDialog('Sucesso','Sincronização em execução. Você pode continuar usando o sistema!', tdSucesso);
          end
          else
          JKDialog('Aviso','Comando não execultado!', tdAlerta);

        Finally
          FreeAndNil(ContAut);
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

procedure TFrmAutorizacao.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmCadAutorizacao) then
        FrmCadAutorizacao := TFrmCadAutorizacao.Create(Application);
        FrmCadAutorizacao.ParamsStr  := 'E';
        FrmCadAutorizacao.ParamsInt  := mdPesquisaid_autorizacao.AsInteger;
        if mdPesquisaid_autorizacao.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmCadAutorizacao.Show;
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

procedure TFrmAutorizacao.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContAut       := Nil;
          ContAut       := TAutorizacaoController.Create;

          if mdPesquisaid_autorizacao.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContAut.ExcluidoCancelado(mdPesquisaid_autorizacao.AsInteger, Tsession.ID_USUARIO) then
          begin
            if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
            begin
              TConfiguracaoService.SincronizarGravar(16, mdPesquisaid_autorizacao.AsInteger);
            end;
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContAut);
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

procedure TFrmAutorizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmAutorizacao  := Nil;
end;

procedure TFrmAutorizacao.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmAutorizacao.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Autorização';
  TitleText   := 'Pesquisa de Autorização';
  cxdata1.EditValue := StartOfTheMonth(date);
  cxdata2.EditValue := EndOfTheMonth(date);
end;

procedure TFrmAutorizacao.Listagem;
begin
  inherited;
  try
    JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAutorizacao.Novo;
begin
  inherited;
  if not Assigned(FrmCadAutorizacao) then
  FrmCadAutorizacao := TFrmCadAutorizacao.Create(Application);
  FrmCadAutorizacao.ParamsStr  := 'N';
  FrmCadAutorizacao.ShowModal;
end;

procedure TFrmAutorizacao.Pesquisa;
var
List    : TObjectList<TModelAutorizacao>;
nCampo, nSituacao : String;
begin
  inherited;
  try
    List      := Nil;
    nCampo    := '';
    nSituacao := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    case cxativo.ItemIndex of
      1: nsituacao   := 'S';
      2: nsituacao   := 'N';
    end;

    ContAut       := TAutorizacaoController.Create;

    Try
      List  := ContAut.ListarTodos(nCampo, nSituacao, cxdata1.EditValue, cxdata2.EditValue);

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

        mdPesquisaid_autorizacao.AsInteger    := Item.id_autorizacao;
        mdPesquisadata.AsDateTime             := Item.data;
        mdPesquisanome.AsString               := Item.nome;
        mdPesquisaqtde_pessoa.AsInteger       := Item.qtdepessoa;
        mdPesquisapessoa_autorizou.AsString   := Item.pessoaautorizou;
        mdPesquisastatus.AsString             := Item.enviarapp;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(contAut);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAutorizacao.Relatorio;
begin
  inherited;
  try
    JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

end.


//procedure TFrmAutorizacao.btnSincronizarClick(Sender: TObject);
//var
//
//Permissao: TPermissaoUsuario;
//begin
//  inherited;
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Autorização');
//
//  if Permissao.TemPermissao('Permitir Sincronizar API') then
//  begin
//
//        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
//        begin
//          try
//            TConfiguracaoService.SincronizarGravar(16, 0);
//            JKDialog('Sucesso','Sincronização em andamento, Aguarde!', tdSucesso);
//          except on e:exception do
//            begin
//              JKDialog('Erro','Erro ao gravar registro para sincronizar:'+#13+e.Message, tdErro);
//              raise;
//            end;
//          end;
//        end;
//
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//end;



