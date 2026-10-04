unit UnitBaseCadCons;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBasic,
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
  dxSkinXmas2008Blue, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  cxBlobEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  cxCheckBox, ACBrBase, ACBrEnterTab, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, DBAccess,
  Uni;

type
  TFrmBaseCadCons = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    edtcodigo: TcxTextEdit;
    edtDescricao: TcxTextEdit;
    edtativo: TcxCheckBox;
    cxGrid: TcxGrid;
    cxGridDB: TcxGridDBTableView;
    coll1: TcxGridDBColumn;
    coll2: TcxGridDBColumn;
    coll3: TcxGridDBColumn;
    coll5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    PopMenu: TPopupMenu;
    btnListagem: TMenuItem;
    ds: TUniDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtDescricaoPropertiesChange(Sender: TObject);
    procedure btnListagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    tela    :String;
    Function Novo(out msg: string): Boolean; virtual; abstract;
    Function Editar: Boolean; virtual; abstract;
    Function Excluir: Boolean; virtual; abstract;
    Function Salvar(out msg: string): Boolean; virtual; abstract;
    Function ValidarCampos(out msg: string): Boolean; virtual; abstract;
    Procedure CarregarGrid; virtual; abstract;
    Procedure Botoes(acao:Integer);
    Function Pesquisa:Boolean; virtual; abstract;
    Function Listagem:Boolean;virtual;abstract;
    { Public declarations }
  end;

var
  FrmBaseCadCons: TFrmBaseCadCons;

implementation

{$R *.dfm}

Uses Udm, Vcl.Session, uJKDialog, UnitPermissao, Vcl.PermissaoUsuario;

procedure TFrmBaseCadCons.Botoes(acao: Integer);
begin
//  case Acao of
//    0:   //inicial
//    begin
//      btnnovo.enabled	    := True;
//      btneditar.enabled	  := True;
//      btnexcluir.enabled  := True;
//      btncancelar.enabled	:= True;
//      btnsalvar.enabled   := False;
//    end;
//
//    1:  //novo
//    begin
//      btnnovo.enabled	    := False;
//      btneditar.enabled	  := False;
//      btnexcluir.enabled  := False;
//      btncancelar.enabled	:= True;
//      btnsalvar.enabled   := True;
//    end;
//
//    2:  //editar
//    begin
//      btnnovo.enabled	    := False;
//      btneditar.enabled	  := False;
//      btnexcluir.enabled  := False;
//      btncancelar.enabled	:= True;
//      btnsalvar.enabled   := True;
//    end;
//
//  end;
end;

procedure TFrmBaseCadCons.btnCancelarClick(Sender: TObject);
begin

  TNavigation.Close(Self)

end;

procedure TFrmBaseCadCons.btneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,Tela);

  if Permissao.TemPermissao('Permitir Editar') then
  begin
    Botoes(2);
  editar;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmBaseCadCons.btnexcluirClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,Tela);

  if Permissao.TemPermissao('Permitir Excluir') then
  begin
    Botoes(0);
    excluir;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmBaseCadCons.btnListagemClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin

//  if btnnovo.enabled = True then
//  begin
//
//    FreeAndNil(TPermissaoUsuario.FInstance);
//    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);
//
//    if Permissao.TemPermissao('Permitir Imprimir Listagem') then
//      Listagem
//    else
//      JKDialog('Acesso Negado',
//               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//               'Por favor, entre em contato com o administrador do sistema.',
//               tdAlerta);
//  end;
end;

procedure TFrmBaseCadCons.btnNovoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Botoes(1);
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmBaseCadCons.btnSalvarClick(Sender: TObject);
var
msg :String;
begin
  //
  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          Botoes(0);
          JKDialog('Sucesso',msg, tdSucesso);
        end
        else
        JKDialog('Aviso',msg, tdAlerta);

    Except on e:exception do
      begin
        JKDialog('Aviso',msg+' :'+e.Message, tdErro);
        raise
      end;
    End;
  end
  else
  begin
    JKDialog('Aviso',msg, tdAlerta);
    exit;
  end;
end;

procedure TFrmBaseCadCons.edtDescricaoPropertiesChange(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin

//  if btnnovo.enabled = True then
//  begin
//
//    FreeAndNil(TPermissaoUsuario.FInstance);
//    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);
//
//    if Permissao.TemPermissao('Permitir Pesquisa') then
//      Pesquisa
//    else
//      JKDialog('Acesso Negado',
//               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//               'Por favor, entre em contato com o administrador do sistema.',
//               tdAlerta);
//  end;

end;

procedure TFrmBaseCadCons.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  FrmBaseCadCons := nil;
end;

procedure TFrmBaseCadCons.FormCreate(Sender: TObject);
begin
  Botoes(0);
end;

procedure TFrmBaseCadCons.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

//  case key of
//    vk_F2:btnNovo.click;
//    vk_F3:btneditar.click;
//    vk_F4:btnexcluir.click;
//    vk_F5:btnSalvar.click;
//    vk_F9:btnListagem.click;
//    vk_ESCAPE:btncancelar.Click;
//  end;

end;

procedure TFrmBaseCadCons.FormShow(Sender: TObject);
begin
  self.setfocus;
  CarregarGrid;
end;

end.
