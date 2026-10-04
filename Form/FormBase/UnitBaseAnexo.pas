unit UnitBaseAnexo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
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
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, cxGroupBox, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, cxTextEdit, Vcl.Menus, cxButtons, cxMaskEdit,
  cxButtonEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtDlgs,
  System.NetEncoding, System.IOUtils, Winapi.ShellAPI;

type
  TFrmAnexoPadrao = class(TForm)
    P_Cancelar: TPanel;
    btnCancelar: TSpeedButton;
    P_salvar: TPanel;
    btnVisualizar: TSpeedButton;
    Paneltitulo: TPanel;
    lblTitulo: TLabel;
    cxGroupBox1: TcxGroupBox;
    ACBrEnterTab1: TACBrEnterTab;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    edtDescricao: TcxTextEdit;
    btnIncluir: TcxButton;
    btnexcluir: TcxButton;
    EdtCaminho: TcxButtonEdit;
    Label2: TLabel;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    OpenAnexo: TOpenTextFileDialog;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure EdtCaminhoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    tela  : string;
    function Visualizar(out msg: string): Boolean; virtual; abstract;
    function ValidarCampos(out msg: string): Boolean; virtual; abstract;
    procedure CarregarDados; virtual; abstract;
    function Inserir(out msg: string): Boolean; virtual; abstract;
    Procedure Excluir; virtual; abstract;
    procedure VisualizarAnexo(const Base64, Extensao: string);
    { Public declarations }
  end;

var
  FrmAnexoPadrao: TFrmAnexoPadrao;

implementation

{$R *.dfm}


uses  Udm, Vcl.Session, uJKDialog, Vcl.Navigation,
  Vcl.PermissaoUsuario;

procedure TFrmAnexoPadrao.btnCancelarClick(Sender: TObject);
begin
  TNavigation.Close(Self);
end;

procedure TFrmAnexoPadrao.btnexcluirClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Excluir Documento') then
    Excluir
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmAnexoPadrao.btnIncluirClick(Sender: TObject);
var
msg :String;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Inserir Documento') then
  begin
    if ValidarCampos(msg) then
    begin
      Try
         if Inserir(msg) then
          begin
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
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmAnexoPadrao.btnVisualizarClick(Sender: TObject);
var
msg :String;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Visualizar Documento') then
  begin
    Try
      if Visualizar(msg) then
      begin

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
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmAnexoPadrao.EdtCaminhoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  //Chamar o carregamento do arquivo
  OpenAnexo.Filter := 'Todos Arquivos Suportados|*.pdf;*.doc;*.docx;*.jpg;*.jpeg;*.png;*.bmp|Documentos (*.pdf;*.doc;*.docx)|*.pdf;*.doc;*.docx|Imagens (*.jpg;*.jpeg;*.png;*.bmp)|*.jpg;*.jpeg;*.png;*.bmp';
  OpenAnexo.Title  := 'Selecione o arquivo para anexar';

  if OpenAnexo.Execute then
  begin
    // Preenche o Edit com o caminho do arquivo selecionado
    EdtCaminho.EditValue := OpenAnexo.FileName;
    edtDescricao.SetFocus;
  end;
end;

procedure TFrmAnexoPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action          := TCloseAction.caFree;
  FrmAnexoPadrao  := nil;
end;

procedure TFrmAnexoPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
    btncancelar.Click;
    key:=0;
  end;
end;

procedure TFrmAnexoPadrao.FormShow(Sender: TObject);
begin
  CarregarDados;
end;

procedure TFrmAnexoPadrao.VisualizarAnexo(const Base64, Extensao: string);
var
  Bytes: TBytes;
  CaminhoTemp, NomeTemp: string;
  FileStream: TFileStream;
begin
  // Cria a pasta temp, se não existir
  CaminhoTemp     := dm.nDirArquivo+'/Temp'; // TPath.Combine(TPath.GetTempPath, 'AutoEasyTemp');
  if not TDirectory.Exists(CaminhoTemp) then
    TDirectory.CreateDirectory(CaminhoTemp);

  // Cria um nome único para o arquivo com a extensão correta
  NomeTemp := TPath.Combine(CaminhoTemp, 'Anexo_' + FormatDateTime('yyyymmddhhnnsszzz', Now) + '.' + Extensao);

  // Converte o Base64 para bytes
  Bytes := TNetEncoding.Base64.DecodeStringToBytes(Base64);

  // Salva no arquivo temporário
  FileStream := TFileStream.Create(NomeTemp, fmCreate);
  try
    FileStream.WriteBuffer(Bytes, Length(Bytes));
  finally
    FileStream.Free;
  end;

  // Abre o arquivo com o programa padrão do Windows
  ShellExecute(0, 'open', PChar(NomeTemp), nil, nil, SW_SHOWNORMAL);
end;


end.
