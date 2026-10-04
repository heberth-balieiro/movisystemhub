unit UnitUnidadeCad;

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
  ACBrBase, ACBrEnterTab, cxCheckBox, model.Unidade, Controller.Unidade,
  UnitBaseNovoCadastro, Data.DB, DBAccess, Uni, dxBevel,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, cxStyles, cxGridTableView,
  cxClasses, cxCurrencyEdit;

type
  TFrmUnidadeCad = class(TFormNovoBaseCadastro)
    Label3: TLabel;
    cxCodigo: TcxTextEdit;
    cxSigla: TcxTextEdit;
    cxUnidade: TcxTextEdit;
    Label5: TLabel;
    Label6: TLabel;
    cxAtivo: TcxCheckBox;
    procedure cxCodigoKeyPress(Sender: TObject; var Key: Char);
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
  FrmUnidadeCad: TFrmUnidadeCad;
  ObjModel  :TModelUnidade;
  ObjController :TUnidadeController;
implementation

{$R *.dfm}

Uses Vcl.Session, uJKDialog;

procedure TFrmUnidadeCad.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmUnidadeCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmUnidadeCad := nil;
end;

procedure TFrmUnidadeCad.FormShow(Sender: TObject);
begin
  inherited;
  Try
    if ParamsStr = 'N' then
    begin
      TitleText   := 'Nova Unidade';
      cxSigla.SetFocus;
    end
    else
    begin
      TitleText   := 'Editar Unidade';
      PopularCampos;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmUnidadeCad.PopularCampos;
begin
  inherited;
  ObjModel      := Nil;
  ObjController := Nil;
  Try
    ObjModel      := TModelUnidade.Create	;
    ObjController := TUnidadeController.Create;
    Try
      ObjModel     := ObjController.BuscarPorID(ParamsInt);

      if Assigned(ObjModel) then
      begin
        cxcodigo.EditValue   := ObjModel.codigo;
        cxSigla.EditValue    := ObjModel.uni;
        cxUnidade.EditValue  := ObjModel.unidade;
        cxativo.EditValue    := ObjModel.ativo;
        cxSigla.SetFocus;
      end
      else
      begin
        JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
        exit;
      end;
    Finally
      ObjModel.Free;
      ObjController.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

function TFrmUnidadeCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result        := False;

  ObjModel      := nil;
  ObjController := nil;
  Try
    ObjModel      := TModelUnidade.Create	;
    ObjController := TUnidadeController.Create;

    Try
      if ParamsStr='N' then
      ObjModel.id_unidade   := 0
      else
      ObjModel.id_unidade     := ParamsInt;
      ObjModel.uni            := cxSigla.EditValue;
      ObjModel.unidade        := Trim(cxUnidade.Text);
      ObjModel.ativo          := cxativo.EditValue;
      ObjModel.excluido       := 0;
      ObjModel.id_empresa     := TSession.idempresa;
      ObjModel.id_usuario     := TSession.id_usuario;
      ObjModel.data_cadastro  := Now;

      if ParamsStr='E' then
      begin
        ObjModel.id_usuario_alt :=TSession.id_usuario;
        ObjModel.Data_Alteracao := Date();
      end;

      if ObjController.Salvar(ObjModel, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, Código: '+IntToStr(AId);
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(ObjModel);
      FreeAndNil(ObjController);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmUnidadeCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;
  Try
    if cxSigla.Text='' then
    begin
      msg     := 'Informe uma sigla!';
      Result  := False;
      Exit;
    end;

    if cxUnidade.Text='' then
    begin
      msg     := 'Informe uma descrição!';
      Result  := False;
      Exit;
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

end.
