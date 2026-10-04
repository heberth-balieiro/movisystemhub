unit UnitEnderecoCad;

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
  cxCheckBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, DBAccess, Uni;

type
  TFrmEnderecoCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Paneltitulo: TPanel;
    Label27: TLabel;
    cxGroupBox1: TcxGroupBox;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    coll1: TcxGridDBColumn;
    coll3: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Label9: TLabel;
    edtcep: TcxButtonEdit;
    Label10: TLabel;
    edtendereco: TcxTextEdit;
    Label11: TLabel;
    edtnumero: TcxTextEdit;
    Label13: TLabel;
    edtcomplemento: TcxTextEdit;
    Label14: TLabel;
    edtbairro: TcxTextEdit;
    Label12: TLabel;
    edtcidade: TcxLookupComboBox;
    Label7: TLabel;
    edtie: TcxTextEdit;
    dsCidade: TUniDataSource;
    
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmEnderecoCad: TFrmEnderecoCad;

implementation

{$R *.dfm}

Uses Udm, model.Grupo, Vcl.Session, uJKDialog;
end.
//procedure TFrmEnderecoCad.btnCancelarClick(Sender: TObject);
//begin
//    TNavigation.Close(Self);
//end;
//
//procedure TFrmEnderecoCad.btnSalvarClick(Sender: TObject);
//var
//msg :String;
//begin
//  //
//
//  if ValidarCampos(msg) then
//  begin
//    Try
//       if Salvar(msg) then
//        begin
//          JKDialog('Sucesso',msg, tdSucesso);
//          TNavigation.Close(Self);
//        end
//        else
//        JKDialog('Aviso',msg, tdAlerta);
//
//
//    Except on e:exception do
//      begin
//        JKDialog('Aviso',msg+' :'+e.Message, tdErro);
//        raise
//      end;
//    End;
//  end
//  else
//  begin
//    JKDialog('Aviso',msg, tdAlerta);
//    exit;
//  end;
//end;
//
//procedure TFrmEnderecoCad.CarregarDados;
//var
//Grupo : TModelGrupo;
//msg:string;
//begin
//
//  Try
//    try
//      Grupo             := TModelGrupo.Create;
//      Grupo.idGrupo     := TNavigation.ParamInt;
//
//      if Grupo.Select(msg) then
//      begin
//        //edtcodigo.EditValue     := Grupo.codigo;
//        //edtperfil.EditValue     := Grupo.grupo;
//        //edtativo.EditValue      := grupo.inativo;
//
//      end;
//
//    Except on e:exception do
//      begin
//        msg := msg+' :'+e.Message;
//        raise;
//      end;
//    end;
//  Finally
//    Grupo.Free;
//  End;
//end;
//
//procedure TFrmEnderecoCad.FormClose(Sender: TObject; var Action: TCloseAction);
//begin
//    Action := TCloseAction.caFree;
//    FrmEnderecoCad := nil;
//end;
//
//procedure TFrmEnderecoCad.FormKeyDown(Sender: TObject; var Key: Word;
//  Shift: TShiftState);
//begin
//  if key = vk_f10 then
//  begin
//    btnsalvar.Click;
//    key:=0;
//  end;
//
//  if key = VK_ESCAPE then
//  begin
//    btncancelar.Click;
//    key:=0;
//  end;
//end;
//
//procedure TFrmEnderecoCad.FormShow(Sender: TObject);
//begin
//  if TNavigation.ParamsStr='V' then
//  begin
//    lblTitulo.Caption := 'Visualizando Grupo';
//    CarregarDados;
//    cxGroupBox1.Enabled := False;
//    btnSalvar.Enabled   := false;
//  end;
//
//  if TNavigation.ParamsStr='E' then
//  begin
//    lblTitulo.Caption := 'Editando Grupo';
//    CarregarDados;
//    //edtperfil.SetFocus;
//  end;
//
//  if TNavigation.ParamsStr = 'N' then
//  begin
//    //edtperfil.SetFocus;
//    //edtativo.Checked    := true;
//  end;
//end;
//
//function TFrmEnderecoCad.Salvar(out msg: string): Boolean;
//begin
//  Result  := False;
//  {Try
//    try
//      Grupo             :=  TModelGrupo.Create;
//
//      //Grupo.grupo       :=  Trim(edtperfil.Text);
//      grupo.inativo     := edtativo.EditValue;
//      Grupo.idempresa  := TSession.IDEMPRESA;
//      grupo.idusuario  := TSession.ID_USUARIO;
//
//      if TNavigation.ParamsStr='N' then
//      begin
//        if Grupo.Insert(msg,id) then;
//        Result  := True;
//      end
//      else
//      begin
//        Grupo.idGrupo := TNavigation.ParamInt;
//        if Grupo.Update(msg) then;
//        Result  := True;
//      end;
//
//    Except on e:exception do
//      begin
//        msg := msg+' :'+e.Message;
//        raise;
//      end;
//    end;
//  Finally
//    Grupo.Free;
//  End; }
//end;
//
//function TFrmEnderecoCad.ValidarCampos(out msg: string): Boolean;
//begin
//  Result  := True;
//  {
//  if (edtperfil.Text ='') or (Length(edtperfil.Text) < 3) then
//  begin
//    msg     := 'Informe a descrição do grupo acima de 3 caracteres!';
//    Result  := False;
//    Exit;
//  end; }
//end;
//
//end.
