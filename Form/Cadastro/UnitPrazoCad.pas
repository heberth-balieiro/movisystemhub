unit UnitPrazoCad;

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
  ACBrBase, ACBrEnterTab, cxCheckBox, UnitBaseNovoCadastro, Data.DB, DBAccess,
  Uni, dxBevel,
  model.PrazoPag, Controller.PrazoPag, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, cxStyles, cxGridTableView, cxClasses;

type
  TFrmPrazoCad = class(TFormNovoBaseCadastro)
    Label3: TLabel;
    cxCodigo: TcxTextEdit;
    cxTipo: TcxComboBox;
    Label5: TLabel;
    cxDescricao: TcxTextEdit;
    Label6: TLabel;
    cxAtivo: TcxCheckBox;
    cxPedido: TcxCheckBox;
    cxAPP: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    
  private

    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmPrazoCad : TFrmPrazoCad;
  ObjModel    : TModelPrazoPag;
  Controller  : TPrazoPagController;
implementation

{$R *.dfm}

Uses Vcl.Session, uJKDialog;

{$REGION 'Função'}

function TFrmPrazoCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result      := False;

  ObjModel    := nil;
  Controller  := nil;

  ObjModel    := TModelPrazoPag.Create;
  Controller  := TPrazoPagController.Create;

  Try
    if ParamsStr='N' then
    ObjModel.id_prazo     := 0
    else
    ObjModel.id_prazo       := ParamsInt;

    ObjModel.id_empressa    := TSession.IDEMPRESA;
    ObjModel.tipo           := cxTipo.Text;
    ObjModel.descricao      := Trim(cxDescricao.Text);
    ObjModel.ativo          := cxAtivo.EditValue;
    ObjModel.id_usuario     := TSession.ID_USUARIO;
    ObjModel.pedido         := cxPedido.EditValue;
    ObjModel.exibirapp      := cxapp.EditValue;

    if ParamsStr='E' then
    ObjModel.id_usuario_alt := TSession.id_usuario;

    Try
      if Controller.Salvar(ObjModel, AId) then
      begin
        msg     := 'Registro salvo com sucesso';
        Result  := true;
        ParamsCloseTela := 'S';
      end;
    Except on e:exception do
      begin
        msg   := 'Ocorreu um erro ao salvar: '+e.Message;
        exit;
      end;
    End;

  Finally
    FreeAndNil(ObjModel);
    FreeAndNil(Controller);
  End;
end;

function TFrmPrazoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxDescricao.text='' then
  begin
    msg     := 'Informe a descrição do pagamento!';
    Result  := False;
    exit;
  end;

end;


{$ENDREGION}


{$REGION 'Procedimento'}

procedure TFrmPrazoCad.PopularCampos;
begin
  inherited;
  ObjModel         := Nil;
  Controller       := Nil;

  ObjModel    := TModelPrazoPag.Create;
  Controller  := TPrazoPagController.Create;

  Try
    try

      ObjModel     :=  Controller.BuscarPorID(ParamsInt);

      if Assigned(ObjModel) then
      begin
        cxCodigo.EditValue        := ObjModel.Codigo;
        cxDescricao.EditValue     := ObjModel.descricao;
        cxAtivo.EditValue         := ObjModel.ativo;
        cxPedido.EditValue        := ObjModel.pedido;
        cxApp.EditValue           := ObjModel.exibirapp;

        cxDescricao.SetFocus;
      end
      else
      begin
        JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
        exit;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;

  Finally
    ObjModel.Free;
    Controller.Free;
  End;
end;

{$ENDREGION}



{$REGION 'Form'}

procedure TFrmPrazoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmPrazoCad   := nil;
end;

procedure TFrmPrazoCad.FormShow(Sender: TObject);
begin
  inherited;
  if ParamsStr = 'N' then
  begin
    TitleText   := 'Novo Prazo de Pagamento';
    cxDescricao.SetFocus;
  end
  else
  begin
    TitleText   := 'Editar Prazo de Pagamento';
    PopularCampos;
  end;
end;

{$ENDREGION}










{
procedure TFrmPrazoCad.btnCancelarClick(Sender: TObject);
begin
    TNavigation.Close(Self);
end;

procedure TFrmPrazoCad.btnSalvarClick(Sender: TObject);
var
msg :String;
begin
  //

  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          JKDialog('Sucesso',msg, tdSucesso);
          TNavigation.Close(Self);
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

procedure TFrmPrazoCad.CarregarDados;
var
Prazo : TModelPrazo;
msg:string;
begin

  Try
    try
      Prazo             := TModelPrazo.Create;
      Prazo.idPrazo     := TNavigation.ParamInt;

      if Prazo.Select(msg) then
      begin
        //idprazo                 := Prazo.idPrazo;
        edtcodigo.EditValue     := Prazo.codigo;
        edttipo.EditValue       := Prazo.tipo;
        edtdescricao.EditValue  := Prazo.descricao;
        edtativo.EditValue      := Prazo.ativo;
        edtpedido.EditValue     := Prazo.pedido;
        edtApp.EditValue        := Prazo.app;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    prazo.Free;
  End;
end;

procedure TFrmPrazoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmPrazoCad := nil;
end;

procedure TFrmPrazoCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f5 then
  begin
    btnsalvar.Click;
    key:=0;
  end;

  if key = VK_ESCAPE then
  begin
    btncancelar.Click;
    key:=0;
  end;

end;

procedure TFrmPrazoCad.FormShow(Sender: TObject);
begin
  if TNavigation.ParamsStr='V' then
  begin
    lblTitulo.Caption := 'Visualizando Prazo Pagamento';
    CarregarDados;
    cxGroupBox1.Enabled := False;
    btnSalvar.Enabled   := false;
  end;

  if TNavigation.ParamsStr='E' then
  begin
    lblTitulo.Caption := 'Editando Prazo Pagamento';
    CarregarDados;
    edttipo.SetFocus;
  end;

  if TNavigation.ParamsStr = 'N' then
  begin
    edtativo.EditValue  := 'S';
    edtpedido.EditValue := 'N';
    edttipo.ItemIndex   := 0;
    edttipo.SetFocus;
  end;


end;

function TFrmPrazoCad.Salvar(out msg: string): Boolean;
var
Prazo : TModelprazo;
id:integer;
begin
  Result  := False;
  Try
    try
      Prazo           :=  TModelprazo.Create;

      Prazo.tipo      :=  edttipo.Text;
      Prazo.descricao :=  trim(edtdescricao.Text);
      Prazo.ativo     :=  edtativo.EditValue;
      Prazo.pedido    :=  edtpedido.EditValue;
      Prazo.idempresa :=  Tsession.IDEMPRESA;
      prazo.idusuario :=  TSession.ID_USUARIO;
      prazo.sistema   :=  'N';
      Prazo.app       := edtApp.EditValue;

      if TNavigation.ParamsStr='N' then
      begin
        if Prazo.Insert(msg) then;
        Result  := True;
      end
      else
      begin
        Prazo.idPrazo := TNavigation.ParamInt;
        if Prazo.Update(msg) then;
        Result  := True;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    Prazo.Free;
  End;
end;

function TFrmPrazoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edttipo.ItemIndex= -1) or (edttipo.Text='') then
  begin
    msg     := 'Informe o tipo de lançamento!';
    Result  := False;
    Exit;
  end;

  if (edtdescricao.Text ='') then
  begin
    msg     := 'Informe a descrição do pagamento!';
    Result  := False;
    Exit;
  end;
end;
}
{ TFrmPrazoCad }





end.
