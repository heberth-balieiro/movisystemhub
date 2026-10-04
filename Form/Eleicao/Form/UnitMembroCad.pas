unit UnitMembroCad;

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
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, dxBevel, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, dxGDIPlusClasses, ACBrValidador, cxCheckBox,
  ACBRUTIL, Vcl.Validacoes, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCalendar, Model.EleicaoChapaMembro, Controller.EleicaoChapaMembro,
  dxmdaset, Datasnap.DBClient, UnitGlobal, Controller.LookupHelper,
  Vcl.PermissaoUsuario,
  System.IOUtils;

type
  TFrmMembroCad = class(TFormNovoBaseCadastro)
    ACBrValidador1: TACBrValidador;
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    Label3: TLabel;
    cxNome: TcxTextEdit;
    Label8: TLabel;
    Label2: TLabel;
    cxcpf: TcxButtonEdit;
    Label7: TLabel;
    cxTelefone: TcxMaskEdit;
    Btneditar: TStyledBitBtn;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    GridRecId: TcxGridDBColumn;
    Gridid_depedente: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridcpf: TcxGridDBColumn;
    Gridparentesco: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    Gridautorizado: TcxGridDBColumn;
    Gridid_socio: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxFoto: TdxBevel;
    cxFoto: TImage;
    cxemail: TcxTextEdit;
    Label5: TLabel;
    cxEleicao: TcxLookupComboBox;
    Label6: TLabel;
    Label9: TLabel;
    cxCargo: TcxComboBox;
    cxTipo: TcxComboBox;
    cxAtivo: TcxCheckBox;
    Label4: TLabel;
    cxobservacao: TcxBlobEdit;
    mdPesquisa: TdxMemData;
    mdPesquisaid: TIntegerField;
    TabEleicao: TClientDataSet;
    TabEleicaoid_eleicao: TIntegerField;
    TabEleicaocodigo: TIntegerField;
    TabEleicaonome: TStringField;
    TabEleicaonpesquisa: TStringField;
    dsEleicao: TUniDataSource;
    mdPesquisacodigo: TIntegerField;
    mdPesquisanome: TStringField;
    mdPesquisacpf: TStringField;
    mdPesquisatelefone: TStringField;
    mdPesquisaativo: TStringField;
    mdPesquisaid_eleicao: TIntegerField;
    mdPesquisaid_chapa: TIntegerField;
    mdPesquisacargo: TStringField;
    mdPesquisatipo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtneditarClick(Sender: TObject);
    procedure cxFotoDblClick(Sender: TObject);

  private
    Procedure LimparCampos;
    Procedure CarregarGrid;
    Procedure AcaoBtn;
    procedure LimparPastaAnexosTemp(const APastaTemp: string);
    { Private declarations }
  public
    AIDEleicao  : Integer;
    AIDChapa    : Integer;

    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmMembroCad  : TFrmMembroCad;
  Obj   : TModelChapaMembro;
implementation

{$R *.dfm}

uses UConesul, Vcl.Session,  uJKDialog, uConfiguracaoService,System.Generics.Collections;

{ TFrmMembroCad }

procedure TFrmMembroCad.AcaoBtn;
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

procedure TFrmMembroCad.BtnCancelarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Excluir Membros') then
    begin
      if not mdPesquisa.Eof then
      begin
        if mdPesquisaid.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
        begin

          Try
            if TEleicaoChapaMembroController.Excluir(mdPesquisaid.AsInteger) then
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

procedure TFrmMembroCad.BtneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Editar Membros') then
    begin
      if not mdPesquisa.Eof then
      begin

        if mdPesquisaid.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
        begin
          ParamsStr       := 'E';
          PopularCampos;
          AcaoBtn;
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

procedure TFrmMembroCad.CarregarGrid;
var
List    : TObjectList<TModelChapaMembro>;
begin
  try
    List    := Nil;
    Try
      List  := TEleicaoChapaMembroController.ListarTodos(TSession.IDEMPRESA, AIDChapa, AIDEleicao);

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

        mdPesquisaid.AsInteger        := Item.id;
        mdPesquisacodigo.AsInteger    := Item.codigo;
        mdPesquisanome.AsString       := Item.nome;
        mdPesquisacpf.AsString        := Item.cpf;
        mdPesquisatelefone.AsString   := Item.telefone;
        mdPesquisaativo.AsString      := Item.ativo;
        mdPesquisaid_eleicao.AsInteger:= Item.id_eleicao;
        mdPesquisaid_chapa.AsInteger  := Item.id_chapa;
        mdPesquisacargo.AsString      := Item.cargo;
        mdPesquisatipo.AsString       := Item.tipo;

        mdPesquisa.Post;

      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;
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

procedure TFrmMembroCad.cxFotoDblClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  // Cria um objeto TOpenDialog
  OpenDialog      := TOpenDialog.Create(nil);
  try
    // Configurações do diálogo
    OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
    OpenDialog.Title := 'Selecione uma foto';

    // Exibe o diálogo e verifica se o usuário selecionou um arquivo
    if OpenDialog.Execute then
    begin
      cxfoto.Picture.LoadFromFile(OpenDialog.FileName);
      cxfoto.Hint := OpenDialog.FileName;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TFrmMembroCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  AIDEleicao    := 0;
  AIDChapa      := 0;
  FrmMembroCad  := nil;
end;

procedure TFrmMembroCad.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Eleição';

  if not mdPesquisa.Active then
  begin
    mdPesquisa.Open;
  end;
end;

procedure TFrmMembroCad.FormShow(Sender: TObject);
begin
  inherited;
  try
    TLookupHelper.CarregarLookup(
            Tabeleicao,LookupEleicaoSql);
    Tabeleicao.First;

    if ParamsStr = 'N' then
    begin
      TitleText                 := 'Composição da Chapa';
      cxeleicao.EditValue       := AidEleicao;
      cxnome.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmMembroCad.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdpesquisa.Eof then
  begin
    ParamsInt := mdpesquisaid.AsInteger;
  end;
end;

procedure TFrmMembroCad.LimparCampos;
begin
  cxCodigo.Clear;
  cxnome.Clear;
  cxcpf.Clear;
  cxTelefone.Clear;
  cxemail.Clear;
  cxAtivo.Checked   := True;
  cxCargo.ItemIndex := -1;
  cxTipo.ItemIndex  := -1;
  cxobservacao.Clear;
  cxFoto.Picture  := nil;
end;

procedure TFrmMembroCad.PopularCampos;
var
  BlobStream: TStream;
  FileStream: TFileStream;
  CaminhoTemp: string;
  PastaTemp: string;
  NomeArquivo: string;
  ExtensaoArquivo :string;
begin
  inherited;
  try
    Obj  := nil;
    Obj  := TModelChapaMembro.Create;

    try
      Obj  := TEleicaoChapaMembroController.BuscarPorID(ParamsInt);

      cxeleicao.EditValue           := Obj.id_eleicao;
      cxCodigo.EditValue            := Obj.codigo;
      cxnome.EditValue              := Obj.nome;
      cxcpf.EditValue               := Obj.cpf;
      cxTelefone.EditValue          := Obj.telefone;
      cxemail.EditValue             := Obj.email;
      cxAtivo.EditValue             := Obj.ativo;
      cxCargo.Text                  := Obj.cargo;
      cxTipo.Text                   := Obj.tipo;
      cxobservacao.EditValue        := Obj.observacao;

      //exibir foto

      cxFoto.Picture  := nil;
      cxFoto.Hint     := '';

      if Length(Obj.arquivo_foto) > 0 then
      begin
        // Define a extensão da foto
        if Trim(Obj.extensao_foto) <> '' then
          ExtensaoArquivo := LowerCase(Trim(Obj.extensao_foto))
        else
          ExtensaoArquivo := 'png';

        // Remove o ponto, caso tenha sido gravado como ".png"
        ExtensaoArquivo := StringReplace(ExtensaoArquivo,'.','',[rfReplaceAll]);
        NomeArquivo     := 'foto_' + IntToStr(Obj.id) + '.' + ExtensaoArquivo;
        PastaTemp       := TPath.Combine(ExtractFilePath(ParamStr(0)), 'Temp\Anexo');

        if not TDirectory.Exists(PastaTemp) then
        TDirectory.CreateDirectory(PastaTemp)
        else
        LimparPastaAnexosTemp(PastaTemp);

        CaminhoTemp := TPath.Combine(PastaTemp,FormatDateTime('yyyymmddhhnnss_', Now) + NomeArquivo);
        BlobStream  := TBytesStream.Create(Obj.arquivo_foto);

        try
          BlobStream.Position := 0;

          FileStream := TFileStream.Create(CaminhoTemp, fmCreate);

          try
            FileStream.CopyFrom(BlobStream, BlobStream.Size);
          finally
            FileStream.Free;
          end;
        finally
          BlobStream.Free;
        end;

        if TFile.Exists(CaminhoTemp) then
        begin
          cxFoto.Picture.LoadFromFile(CaminhoTemp);
          cxFoto.Hint := CaminhoTemp;
        end;

      end;

    finally
      FreeandNil(Obj);
    end;
  except on E: Exception do
    raise
  end;
end;

procedure TFrmMembroCad.LimparPastaAnexosTemp(const APastaTemp: string);
var
  Arquivo: string;
begin
  if not TDirectory.Exists(APastaTemp) then
    Exit;
  for Arquivo in TDirectory.GetFiles(APastaTemp) do
  begin
    try
      TFile.Delete(Arquivo);
    except
    end;
  end;
end;

function TFrmMembroCad.Salvar(out msg: string): Boolean;
var
AID:Integer;
AStr:String;
begin
  Result        := False;

  try
    //popular os campos conforme registro
    Obj           := nil;
    Obj           := TModelChapaMembro.Create;

    if ParamsStr = 'N' then
    begin
      Obj.id                  := 0;
      Obj.id_eleicao          := cxeleicao.EditValue;
      Obj.id_chapa            := AIDChapa;
      Obj.id_empresa          := TSession.IDEMPRESA;
      Obj.nome                := Trim(cxNome.Text);
      Obj.cpf                 := Tirapontos(cxcpf.Text);
      Obj.telefone            := tirapontos(cxtelefone.Text);
      Obj.email               := trim(cxemail.Text);
      Obj.ativo               := cxAtivo.EditValue;
      Obj.cargo               := cxcargo.Text;
      Obj.tipo                := cxtipo.Text;
      Obj.observacao          := trim(cxobservacao.Text);
      Obj.caminho_foto        := cxfoto.Hint;
      Obj.id_usuario          := TSession.ID_USUARIO;
      Obj.datacriacao         := now;
      Obj.sinc_app            := 'N';
    end;

    if ParamsStr = 'E' then
    begin
      Obj.id                  := ParamsInt;
      Obj.nome                := Trim(cxNome.Text);
      Obj.cpf                 := Tirapontos(cxcpf.Text);
      Obj.telefone            := tirapontos(cxtelefone.Text);
      Obj.email               := trim(cxemail.Text);
      Obj.ativo               := cxAtivo.EditValue;
      Obj.cargo               := cxcargo.Text;
      Obj.tipo                := cxtipo.Text;
      Obj.observacao          := trim(cxobservacao.Text);
      Obj.caminho_foto        := cxfoto.Hint;
      Obj.id_usuario_alt      := TSession.ID_USUARIO;
      Obj.dataalteracao       := now;
      Obj.sinc_app            := 'N';
    end;

    Try
      if ParamsStr = 'E' then
      AID         := ParamsInt;

        if TEleicaoChapaMembroController.Salvar(Obj, AID, AStr) then
        begin
          Result          := true;
          msg:= 'Registro inserido com sucesso.';
          CarregarGrid;
          LimparCampos;
          cxnome.SetFocus;
          ParamsStr       := 'N';
          ParamsCloseTela := 'N';
          AcaoBtn;

//          if TConfiguracaoService.ValidarUsoAppEleicao(TSession.idempresa) then
//          begin
//            if ParamsStr = 'E' then
//              TConfiguracaoService.SincronizarGravar(103, ParamsInt)
//            else
//              TConfiguracaoService.SincronizarGravar(103, AID);
//          end;

        end
        else
        begin
          ParamsMsgTela := 'S';
          msg           := AStr;
          Result        := False;
          cxnome.SetFocus;
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

function TFrmMembroCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (cxNome.text= '') then
  begin
    msg     := 'Informe o nome do membro.';
    Result  := False;
    exit;
  end;

  if (Tirapontos(cxcpf.text)='') then
  begin
    msg     := 'Informe o número do CPF do membro.';
    Result  := False;
    exit;
  end;

  if (Tirapontos(cxcpf.text) <> '') then
  begin
    ACBrValidador1.TipoDocto    := docCPF;
    ACBrValidador1.Documento    := Tirapontos(cxcpf.text);
    if not ACBrValidador1.Validar then
    begin
      msg     := ACBrValidador1.MsgErro;
      Result  := False;
      exit;
    end;

  end;


  if (cxcargo.Text='') or (cxcargo.ItemIndex=-1) then
  begin
    msg     := 'Selecione um cargo para o membro.';
    Result  := False;
    exit;
  end;

  if (cxtipo.Text='') or (cxtipo.ItemIndex=-1) then
  begin
    msg     := 'Selecione um tipo para o membro.';
    Result  := False;
    exit;
  end;

end;

end.
