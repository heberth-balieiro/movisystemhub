unit UnitAnexo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, cxStyles, cxGridTableView, cxClasses, Data.DB,
  DBAccess, Uni, ACBrBase, ACBrEnterTab, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.StyledButton, dxBevel, Vcl.ExtCtrls, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  cxCheckBox, cxGroupBox, cxTextEdit,
  Controller.Anexo,Model.Anexo, dxmdaset,System.Generics.Collections,
  uJKDialog, Vcl.Session, cxMaskEdit, cxButtonEdit, cxDropDownEdit, cxBlobEdit,
  ACBrUtil;

type
  TFrmAnexo = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    Label3: TLabel;
    cxNome: TcxTextEdit;
    Btneditar: TStyledBitBtn;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    GridRecId: TcxGridDBColumn;
    Gridid_secretaria: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridrazao: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    mdSituacao: TdxMemData;
    cxarquivo: TcxButtonEdit;
    Label2: TLabel;
    Label59: TLabel;
    cxobs: TcxBlobEdit;
    GridColumn1: TcxGridDBColumn;
    GridColumn2: TcxGridDBColumn;
    GridColumn3: TcxGridDBColumn;
    mdSituacaoid_anexo: TIntegerField;
    mdSituacaonome_original: TStringField;
    mdSituacaoextensao: TStringField;
    mdSituacaotipo_arquivo: TStringField;
    mdSituacaoobservacao: TStringField;
    mdSituacaodatainclusao: TDateField;
    mdSituacaonome: TStringField;
    procedure BtneditarClick(Sender: TObject);
    procedure cxCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure cxarquivoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    Procedure LimparCampos;
    Procedure CarregarGrid;
    Procedure AcaoBtn;

    { Private declarations }
  public
    ATipoReferencia, ARefTela :String;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    { Public declarations }
  end;

var
  FrmAnexo: TFrmAnexo;
  Obj       : TModelAnexo;
implementation

{$R *.dfm}

uses Vcl.PermissaoUsuario;


{ TFrmdepartamentoCad }

procedure TFrmAnexo.AcaoBtn;
begin
  if ParamsStr='E' then
  begin
    BtnEditar.Enabled   := False;
    BtnCancelar.Enabled := False;
    BtnSalvar.Enabled   := true;
  end
  else
  begin
    btnEditar.Enabled   := true;
    BtnCancelar.Enabled := True;
  end;
end;

procedure TFrmAnexo.CarregarGrid;
var
List    : TObjectList<TModelAnexo>;
begin
  try
    List    := Nil;
    Try
      List  := TAnexoController.ListarPorReferencia(TSession.IDEMPRESA,ATipoReferencia, ParamsInt);
      mdSituacao.Close;
      mdSituacao.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdSituacao.Close;
        exit;
      end;

      if not mdSituacao.Active then
      mdSituacao.Open;

      mdSituacao.DisableControls;

      for var Item in List do
      begin
        mdSituacao.Append;

        mdSituacaoid_anexo.AsInteger    := Item.id_anexo;
        mdSituacaonome_original.AsString:= Item.nome_original;
        mdSituacaoextensao.AsString     := Item.extensao;
        mdSituacaotipo_arquivo.AsString := Item.tipo_arquivo;
        mdSituacaoobservacao.AsString   := Item.observacao;
        mdSituacaodatainclusao.AsDateTime:=Item.datainclusao;
        mdSituacaonome.AsString         := Item.nome;

        mdSituacao.Post;

      end;
      mdSituacao.First;
      mdSituacao.EnableControls;
    Finally
      if Assigned(List) then
      List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAnexo.cxarquivoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.Title := 'Selecionar anexo';
    OpenDialog.Filter :=
      'Arquivos permitidos (*.pdf;*.jpg;*.jpeg;*.png;*.bmp)|*.pdf;*.jpg;*.jpeg;*.png;*.bmp|' +
      'PDF (*.pdf)|*.pdf|' +
      'Imagens (*.jpg;*.jpeg;*.png;*.bmp)|*.jpg;*.jpeg;*.png;*.bmp';
    OpenDialog.FilterIndex  := 1;
    OpenDialog.Options      := [ofFileMustExist, ofPathMustExist, ofEnableSizing];
    if OpenDialog.Execute then
    begin
      cxarquivo.Text := OpenDialog.FileName;
      // Opcional: preencher observação automaticamente se estiver vazia
      if Trim(cxobs.Text) = '' then
        cxobs.Text := ExtractFileName(OpenDialog.FileName);
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TFrmAnexo.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmAnexo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmAnexo  := nil;
end;

procedure TFrmAnexo.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Anexo';

   if not mdSituacao.Active then
   begin
    mdSituacao.Open;
   end;
end;

procedure TFrmAnexo.FormShow(Sender: TObject);
begin
  inherited;
  try
    if ParamsStr = 'N' then
    begin
      TitleText   := 'Incluir Anexo';
      cxarquivo.SetFocus;
      cxCodigo.EditValue  := ParamsInt;
      cxnome.EditValue    := ARefTela;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAnexo.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
//  if not mdSituacao.Eof then
//  begin
//    ParamsInt := mdSituacaoid_anexo.AsInteger;
//  end;
end;

procedure TFrmAnexo.LimparCampos;
begin
  cxobs.Clear;
  cxarquivo.Clear;
end;

function TFrmAnexo.Salvar(out msg: string): Boolean;
var
AID:Integer;
AStr:String;
begin
  try
    Result    := False;
    Obj       := nil;
    Obj       := TModelAnexo.Create;

    Try
      if ParamsStr = 'N' then
      begin
        Obj.id_empresa      := TSession.IDEMPRESA;
        Obj.id_usuario      := TSession.ID_USUARIO;
        Obj.id_referencia   := ParamsInt;
        Obj.tipo_referencia := ATipoReferencia;  //nome relatorio
        Obj.nome_arquivo    := Trim(cxarquivo.Text);
        Obj.nome_original   := ExtractFileName(Trim(cxarquivo.Text));
        Obj.observacao      := Trim(cxobs.Text);
        Obj.datainclusao    := Now;
      end;

      if TAnexoController.Incluir(Obj, AID, AStr) then
      begin
        Result  := true;
        msg:= 'Registro inserido com sucesso.';
        CarregarGrid;
        LimparCampos;
        cxarquivo.SetFocus;
        ParamsStr       := 'N';
        ParamsCloseTela := 'N';
      end
      else
      begin
        ParamsMsgTela := 'S';
        msg           := AStr;
        Result        := False;
        cxarquivo.SetFocus;
      end;

    Finally
      FreeAndNil(Obj);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAnexo.BtnCancelarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Excluir') then
    begin
      if not mdSituacao.Eof then
      begin
        if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
        begin

          Try
            if TAnexoController.Excluir(mdSituacaoid_anexo.AsInteger, ParamsInt, TSession.idempresa) then
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          Finally
            CarregarGrid;
          End;
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

procedure TFrmAnexo.BtneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
  ID:Integer;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Visualizar') then
    begin
      if not mdSituacao.Eof then
      begin
        if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
        begin
          ID        := mdSituacaoid_anexo.AsInteger;

          if not TAnexoController.Visualizar(ID, ParamsInt, TSession.IDEMPRESA) then
            JKDialog('Aviso','Não foi possível visualizar o anexo.', tdAlerta);
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

procedure TFrmAnexo.BtnSalvarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Incluir') then
  begin
    inherited;
    AcaoBtn;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

function TFrmAnexo.ValidarCampos(out msg: string): Boolean;
var
  Ext:String;
begin
  Result  := True;

  Ext := LowerCase(ExtractFileExt(Trim(cxarquivo.Text)));
  if not MatchText(Ext, ['.pdf', '.jpg', '.jpeg', '.png', '.bmp']) then
  begin
    msg     := 'Tipo de arquivo não permitido. Selecione PDF ou imagem.';
    Result  := False;
    Exit;
  end;

  if cxArquivo.text='' then
  begin
    msg     := 'Selecione um arquivo!';
    Result  := False;
    exit;
  end;
end;

end.
