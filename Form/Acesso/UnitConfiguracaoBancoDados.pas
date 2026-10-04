unit UnitConfiguracaoBancoDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.FileCtrl,
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
  cxCheckBox, Vcl.Menus, cxButtons, ACBrBase, ACBrEnterTab, dxBarBuiltInMenu,
  cxPC, ACBRUTIL, ACBrDFe, ACBrNFe,ACBrDFeSSL, Data.DB, DBAccess, Uni,System.IniFiles,
  UFormNovoBaseDiversos, cxStyles, cxGridTableView, cxClasses,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton;

type
  TFrmConfiguracaoBancodados = class(TFormNovoBaseDiversos)
    Label7: TLabel;
    edtDriver: TcxTextEdit;
    Label8: TLabel;
    edtserver: TcxTextEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtbanco: TcxTextEdit;
    edtUsuario: TcxTextEdit;
    edtsenha: TcxTextEdit;
    BtnSalvar: TStyledBitBtn;
    BtnCancelar: TStyledBitBtn;
    cxLookAndFeelController1: TcxLookAndFeelController;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    procedure CarregarDados;
    function Salvar(out msg: string): Boolean;
    function ValidarCampos(out msg: string): Boolean;

    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmConfiguracaoBancodados: TFrmConfiguracaoBancodados;

implementation

{$R *.dfm}

Uses Vcl.Loading, Vcl.Session, uJKDialog, UConeSul, UDM;

procedure TFrmConfiguracaoBancodados.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfiguracaoBancodados.btnSalvarClick(Sender: TObject);
var
msg :String;
begin
  //Salvar e validar dados
  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          JKDialog('Sucesso',msg, tdSucesso);
          Application.Terminate;
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

procedure TFrmConfiguracaoBancodados.CarregarDados;
var
  Config: TIniFile;
  Senha : String;
begin
  Config := TIniFile.Create(dm.nDirArquivo + '\Config.ini');

  Try

    try
      edtDriver.EditValue   := Config.ReadString('DADOS', 'DriverID', '');
      edtServer.EditValue   := Config.ReadString('DADOS', 'Server',   '');
      edtbanco.EditValue    := Config.ReadString('DADOS', 'Database', '');
      edtusuario.EditValue  := Config.ReadString('DADOS', 'User_Name','');
      senha                 := Config.ReadString('DADOS', 'Password', '');
      edtsenha.EditValue    := TConeSul.Crypt('D',senha);

    Except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;

  Finally
    Config.Free;
  End;

end;

procedure TFrmConfiguracaoBancodados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmConfiguracaoBancodados := nil;
end;

procedure TFrmConfiguracaoBancodados.FormCreate(Sender: TObject);
begin
  inherited;
  cxLookAndFeelController1.SkinName := 'Office2019Colorful';
end;

procedure TFrmConfiguracaoBancodados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F10 then
  begin
    btnSalvar.Click;
    key :=0;
  end;

  if key = VK_ESCAPE  then
  begin
    btnCancelar.Click;
    key :=0;
  end;
end;

procedure TFrmConfiguracaoBancodados.FormShow(Sender: TObject);
var
msg:string;
begin
  CarregarDados;
end;

function TFrmConfiguracaoBancodados.Salvar(out msg: string): Boolean;
var
  Config: TIniFile;
begin
  Result:= false;
  Config := TIniFile.Create(dm.nDirArquivo+'\Config.ini');
  Try

    Try
      Config.WriteString('DADOS', 'DriverID',   Trim(edtDriver.Text));
      Config.WriteString('DADOS', 'Database',   Trim(edtbanco.text));
      Config.WriteString('DADOS', 'User_Name',  Trim(edtusuario.text));
      Config.WriteString('DADOS', 'Password',   TConeSul.Crypt('C',Trim(edtsenha.Text)));
      Config.WriteString('DADOS', 'Server',     Trim(edtserver.text));

      //Teste de Conexão


      Result  := True;
      msg := 'Dados salvo com sucesso!';
    except on e:exception do
      raise Exception.Create(e.Message);
    End;

  Finally
    Config.Free;
  End;

end;

function TFrmConfiguracaoBancodados.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if edtDriver.text='' then
  begin
    msg   := 'Informe o driver de conexão!';
    Result:= False;
    Exit;
  end;

  if edtserver.text='' then
  begin
    msg   := 'Informe o endereço do servidor!';
    Result:= False;
    Exit;
  end;

  if edtBanco.text='' then
  begin
    msg   := 'Informe o nome do banco de dados!';
    Result:= False;
    Exit;
  end;

  if edtUsuario.text='' then
  begin
    msg   := 'Informe o nome do usuário do banco de dados!';
    Result:= False;
    Exit;
  end;

  if edtsenha.text='' then
  begin
    msg   := 'Informe a senha do banco de dados!';
    Result:= False;
    Exit;
  end;

end;

end.
