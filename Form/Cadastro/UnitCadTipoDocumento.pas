unit UnitCadTipoDocumento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCad, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, cxCheckBox, cxTextEdit,
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, Data.DB, DBAccess, Uni, Vcl.StyledButton, dxBevel,
  cxStyles, cxGridTableView, cxClasses;

type
  TFrmCadTipoDocumento = class(TFormNovoBaseCadastro)
    gbAtivo: TcxGroupBox;
    cxAtivo: TcxCheckBox;
    cxNome: TcxTextEdit;
    Label3: TLabel;
    cxCodigo: TcxTextEdit;
    Label1: TLabel;
    //procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
//    procedure CarregarDados; override;
//    function Salvar(out msg: string): Boolean; override;
//    function ValidarCampos(out msg: string): Boolean; override;
    { Public declarations }
  end;

var
  FrmCadTipoDocumento: TFrmCadTipoDocumento;

implementation

{$R *.dfm}

uses uJKDialog, Vcl.Navigation, Controller.TipoDocumento, Model.TipoDocumento,
  Vcl.Session;

{ TFrmCadTipoDocumento }

//procedure TFrmCadTipoDocumento.CarregarDados;
//var
//  Controller  : TTipoDocumentoController;
//  Documento   : TTipoDocumento;
//begin
//  inherited;
//
//  Controller := TTipoDocumentoController.Create;
//  try
//    Documento := Controller.BuscarPorId(TNavigation.ParamInt);
//
//    if Assigned(Documento) then
//    begin
//      // Preencher os campos da tela
//      edtCodigo.EditValue     := Documento.Codigo;
//      edtDescricao.EditValue  := Documento.Descricao;
//      edtativo.EditValue      := Documento.Ativo;
//
//      Documento.Free;
//    end
//    else
//      JKDialog('Aviso','Registro não encontrado.', tdAlerta);
//
//  finally
//    Controller.Free;
//  end;
//end;
//
//procedure TFrmCadTipoDocumento.FormShow(Sender: TObject);
//begin
//  inherited;
//  if TNavigation.ParamsStr = 'E' then
//  begin
//    CarregarDados;
//    edtdescricao.SetFocus;
//  end
//  else
//  begin
//    edtdescricao.SetFocus;
//  end;
//end;
//
//function TFrmCadTipoDocumento.Salvar(out msg: string): Boolean;
//var
//Controller  : TTipoDocumentoController;
//Obj         : TTipoDocumento;
//begin
//  Result    := False;
//  msg       := '';
//
//  Controller := TTipoDocumentoController.Create;
//  Obj := TTipoDocumento.Create;
//
//  try
//    Obj.Id_documento := 0;
//    Obj.Codigo       := StrToIntDef(edtCodigo.Text, 0);
//    Obj.Descricao    := edtDescricao.Text;
//    Obj.Ativo        := edtativo.EditValue;
//    Obj.Id_Empresa   := Tsession.IdEmpresa;
//    Obj.Id_Usuario   := Tsession.Id_Usuario;
//
//    if TNavigation.ParamInt > 0 then
//    begin
//      Obj.Id_documento          := TNavigation.ParamInt;
//      Obj.Id_usuario_alteracao  := Tsession.Id_Usuario;
//      Obj.Data_alteracao        := Now;
//    end;
//
//    Result := Controller.Salvar(Obj);
//    if not Result then
//      msg := 'Erro ao salvar o registro.'
//    else
//    msg :=  'Registro salvo com sucesso!';
//  finally
//    Controller.Free;
//    Obj.Free;
//  end;
//
//end;
//
//function TFrmCadTipoDocumento.ValidarCampos(out msg: string): Boolean;
//begin
//  Result  := True;
//
//  if (edtDescricao.Text='') then
//  begin
//    msg     := 'Informe o tipo de documento!';
//    Result  := False;
//    Exit;
//  end;
//
//end;

end.
