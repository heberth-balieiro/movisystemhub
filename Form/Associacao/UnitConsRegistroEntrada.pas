unit UnitConsRegistroEntrada;

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
  Vcl.StyledButton, dxmdaset,Controllers.SindRegistro, Model.Sindicato_Registro;

type
  TFrmRegistroEntrada = class(TFormNovoBasePesquisa)
    Label3: TLabel;
    cxData1: TcxDateEdit;
    cxdata2: TcxDateEdit;
    mdPesquisa: TdxMemData;
    mdPesquisaid_registro: TIntegerField;
    mdPesquisadata: TDateField;
    mdPesquisahora: TTimeField;
    mdPesquisanome: TStringField;
    mdPesquisawhatsapp: TStringField;
    mdPesquisanmusuario: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_registro: TcxGridDBColumn;
    Griddata: TcxGridDBColumn;
    Gridhora: TcxGridDBColumn;
    Gridmatricula: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridwhatsapp: TcxGridDBColumn;
    Gridnmusuario: TcxGridDBColumn;
    mdPesquisamatricula: TIntegerField;
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
    Procedure Pesquisa    ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
    { Public declarations }
  end;

var
  FrmRegistroEntrada: TFrmRegistroEntrada;
  ContEntrada     : TRegistroEntradaController;
  ObjEntrada      : TModelSindRegistro;

implementation

{$R *.dfm}

uses UnitPrincipalNew, Vcl.Loading, uJKDialog,
  System.DateUtils, Vcl.Validacoes, Vcl.Session, Vcl.PermissaoUsuario,System.Generics.Collections,
  uConfiguracaoService;

{ TFrmRegistroEntrada }


procedure TFrmRegistroEntrada.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmRegistroEntrada.btnsincronizarClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Registro de Entrada');

    if Permissao.TemPermissao('Permitir Receber Dados') then
    begin
      if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
      begin
        //Incluir os cadastro para sincronizar
        TConfiguracaoService.SincronizarGravar(17, 0);
            JKDialog('Sucesso','Sincronização em execução. Você pode continuar usando o sistema!', tdSucesso);
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

procedure TFrmRegistroEntrada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmRegistroEntrada  := nil;
end;

procedure TFrmRegistroEntrada.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmRegistroEntrada.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Registro de Entrada';
  TitleText   := 'Registro de Entrada';
  cxdata1.EditValue := StartOfTheMonth(date);
  cxdata2.EditValue := EndOfTheMonth(date);
end;

procedure TFrmRegistroEntrada.Listagem;
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

procedure TFrmRegistroEntrada.Pesquisa;
var
List    : TObjectList<TModelSindRegistro>;
nCampo : String;
begin
  inherited;
  try
    List      := Nil;
    nCampo    := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    ContEntrada       := TRegistroEntradaController.Create;

    Try
      List  := ContEntrada.ListarTodos(nCampo, '', cxdata1.EditValue, cxdata2.EditValue);

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

        mdPesquisaid_registro.AsInteger   := Item.id_registro;
        mdPesquisadata.AsDateTime         := Item.data;
        mdPesquisahora.AsDateTime         := Item.hora;
        mdPesquisamatricula.AsInteger     := Item.matricula;
        mdPesquisanome.AsString           := Item.nome;
        mdPesquisawhatsapp.AsString       := Item.whatsapp;
        mdPesquisanmusuario.AsString      := Item.nmusuario;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContEntrada);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmRegistroEntrada.Relatorio;
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


//procedure TFrmRegistroEntrada.Sincronizardados1Click(Sender: TObject);
//var
//
//Permissao: TPermissaoUsuario;
//begin
//  inherited;
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Registro de Entrada');
//
//  if Permissao.TemPermissao('Permitir Receber Dados') then
//  begin
//
//        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
//        begin
//          try
//            TConfiguracaoService.SincronizarGravar(17, 0);
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
//
//end.
