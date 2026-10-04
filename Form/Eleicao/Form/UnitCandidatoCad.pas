unit UnitCandidatoCad;

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
  ACBrEnterTab, dxGDIPlusClasses, ACBrValidador, ACBRUTIL, cxCheckBox,
  Vcl.Validacoes, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton;

type
  TFrmCandidatoCad = class(TFormNovoBaseCadastro)
    ACBrValidador1: TACBrValidador;
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    Label3: TLabel;
    cxNome: TcxTextEdit;
    Label2: TLabel;
    cxcpf: TcxButtonEdit;
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
    dxBevel2: TdxBevel;
    edtFoto: TImage;
    cxTextEdit1: TcxTextEdit;
    Label4: TLabel;
    edtobs: TcxBlobEdit;
    Label5: TLabel;
    gbAtivo: TcxGroupBox;
    cxAtivo: TcxCheckBox;
//    procedure btnCancelarClick(Sender: TObject);
//    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure edtFotoDblClick(Sender: TObject);
//    procedure FormShow(Sender: TObject);
//    procedure btnSalvarClick(Sender: TObject);
//    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
//    Function Salvar(out msg:string):Boolean;
//    Function ValidarCampos(out msg:string):Boolean;
//    function ValidarTamanhoImagem(caminhoImagem: string; larguraMax,
//      alturaMax: Integer): Boolean;
//    procedure CarregarDadosEditar;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmCandidatoCad: TFrmCandidatoCad;

implementation

{$R *.dfm}

uses Model.Candidato, UDM, UConesul, uJKDialog, Vcl.Session,
  uConfiguracaoService;

//procedure TFrmCandidatoCad.btnCancelarClick(Sender: TObject);
//begin
//  TNavigation.Close(Self);
//end;
//
//procedure TFrmCandidatoCad.btnSalvarClick(Sender: TObject);
//var
//msg:String;
//begin
//  if ValidarCampos(msg) then
//  begin
//    Try
//       if Salvar(msg) then
//        begin
//          JKDialog('Sucesso',msg, tdSucesso);
//          edtCodigo.Clear;
//          edtnome.Clear;
//          edtcargo.Clear;
//          edtcpf.clear;
//          edtfoto.Picture:= nil;
//          edtdescricao.Clear;
//          TNavigation.Close(Self);
//        end
//        else
//        JKDialog('Aviso',msg, tdAlerta);
//
//
//    Except on e:exception do
//      begin
//        JKDialog('Erro',msg+' :'+e.Message, tderro);
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
//procedure TFrmCandidatoCad.CarregarDadosEditar;
//var
//Candidato : TModelCandidato;
//msg:string;
//begin
//
//  Try
//    try
//      Candidato                 := TModelCandidato.Create;
//      Candidato.idcandidato     := TNavigation.ParamInt;
//
//      if Candidato.Select(msg) then
//      begin
//        edtcodigo.EditValue     := Candidato.codigo;
//        edtnome.EditValue       := Candidato.nome;
//        edtativo.EditValue      := Candidato.inativo;
//        edtcargo.editvalue      := Candidato.cargo;
//        edtcpf.editvalue        := Candidato.cpf;
//        edtdescricao.editvalue  := Candidato.descricao;
//
//        if Candidato.foto <> '' then
//        begin
//          TConesul.ConvBase64Img(Candidato.foto);
//          edtfoto.Picture         := TConeSul.nfoto;
//          TConeSul.nfoto.Free;
//        end;
//      end;
//
//    Except on e:exception do
//      begin
//        msg := msg+' :'+e.Message;
//        raise;
//      end;
//    end;
//  Finally
//    Candidato.Free;
//  End;
//end;
//
//procedure TFrmCandidatoCad.edtFotoDblClick(Sender: TObject);
//var
//  OpenDialog: TOpenDialog;
//begin
//  // Cria um objeto TOpenDialog
//  OpenDialog := TOpenDialog.Create(nil);
//  try
//    // Configurações do diálogo
//    OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
//    OpenDialog.Title := 'Selecione uma foto';
//
//    // Exibe o diálogo e verifica se o usuário selecionou um arquivo
//    if OpenDialog.Execute then
//    begin
//      if ValidarTamanhoImagem(OpenDialog.FileName,500,1000) then
//      // Carrega a imagem selecionada no TImage
//      edtfoto.Picture.LoadFromFile(OpenDialog.FileName)
//      else
//      Showmessage('Verifique o tamanho a imagem!');
//    end;
//  finally
//    // Libera o objeto TOpenDialog
//    OpenDialog.Free;
//  end;
//end;
//
//procedure TFrmCandidatoCad.FormClose(Sender: TObject; var Action: TCloseAction);
//begin
//    Action := TCloseAction.caFree;
//    FrmCandidatoCad := nil;
//end;
//
//procedure TFrmCandidatoCad.FormKeyDown(Sender: TObject; var Key: Word;
//  Shift: TShiftState);
//begin
//  if key = Vk_F10 then
//  begin
//    btnSalvar.Click;
//    key:=0;
//  end;
//
//  if key = vk_escape then
//  begin
//    btncancelar.Click;
//    key:=0;
//  end;
//
//end;
//
//procedure TFrmCandidatoCad.FormShow(Sender: TObject);
//begin
//
//  if TNavigation.ParamsStr = 'E' then
//  begin
//    CarregarDadosEditar;
//    edtnome.SetFocus;
//  end;
//
//  if TNavigation.ParamsStr = 'V' then
//  begin
//    CarregarDadosEditar;
//    cxGroupBox1.Enabled := False;
//    btnSalvar.Enabled   := false;
//  end;
//
//  if TNavigation.ParamsStr = 'N' then
//  edtnome.SetFocus;
//end;
//
//function TFrmCandidatoCad.Salvar(out msg: string): Boolean;
//var
//Candidato : TModelCandidato;
//begin
//  Result  := False;
//  Try
//    try
//      Candidato             :=  TModelCandidato.Create;
//
//      Candidato.idCandidato :=  TNavigation.ParamInt;
//
//      if edtcodigo.Text <>'' then
//      Candidato.codigo      :=  edtCodigo.EditValue;
//      Candidato.nome        :=  Trim(edtnome.Text);
//      Candidato.cargo       :=  Trim(edtcargo.text);
//      Candidato.cpf         :=  TiraPontos(edtcpf.text);
//      Candidato.descricao   :=  trim(edtDescricao.text);
//      Candidato.inativo     :=  edtativo.EditValue;
//      Candidato.idempresa   :=  TSession.IDEMPRESA;
//
//      if edtFoto.Picture.Graphic <> nil then
//      begin
//        Candidato.foto        := TConeSul.ConvImgBase64(edtfoto);
//      end;
//
//      if TNavigation.ParamsStr='N' then
//      begin
//        //validar se já existe
//        if Candidato.ValidarRegistro(msg) then
//        begin
//          msg := 'Candidato já cadastrado! Verifique. '+msg;
//          Result  :=False;
//          exit;
//        end;
//        if Candidato.Insert(msg) then;
//        Result  := True;
//      end
//      else
//      begin
//        if Candidato.Update(msg) then;
//        Result  := True;
//      end;
//
//        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
//        begin
//          try
//            TConfiguracaoService.SincronizarGravar(8, 0);
//          except on e:exception do
//            begin
//              msg   := 'Erro ao gravar registro para sincronizar:'+#13+e.Message;
//              raise;
//            end;
//          end;
//        end;
//
//    Except on e:exception do
//      begin
//        msg := msg+' :'+e.Message;
//        raise;
//      end;
//    end;
//  Finally
//    Candidato.Free;
//  End;
//end;
//
//function TFrmCandidatoCad.ValidarCampos(out msg: string): Boolean;
//begin
//  Result  := True;
//
//  if (edtnome.Text ='') or (Length(edtnome.Text) < 3) then
//  begin
//    msg     := 'Informe o nome do candidato!';
//    Result  := False;
//    Exit;
//  end;
//
//  if edtvalidar.Checked=false then
//  begin
//    if (edtcpf.Text ='') or  (edtcpf.Text= '   .   .   -  ') then
//    begin
//      msg     := 'Informe um CPF valido!';
//      result  := False;
//      exit;
//    end;
//
//
//    if (edtcpf.Text <>'') or  (edtcpf.Text<> '000.000.000-00') then
//    begin
//      ACBrValidador1.TipoDocto := docCPF;
//      ACBrValidador1.Documento := edtcpf.EditValue;
//      if not ACBrValidador1.Validar then
//        raise Exception.Create(ACBrValidador1.MsgErro);
//    end;
//
//  end;
//end;
//
//function TFrmCandidatoCad.ValidarTamanhoImagem(caminhoImagem: string;
//  larguraMax, alturaMax: Integer): Boolean;
//var
//  picture: TPicture;
//begin
//  Result := False;
//  picture := TPicture.Create;
//  try
//    try
//      picture.LoadFromFile(caminhoImagem);
//      if (picture.Width <= larguraMax) and (picture.Height <= alturaMax) then
//        Result := True;
//    except
//      // Lidar com erros de carregamento de arquivo aqui
//    end;
//  finally
//    picture.Free;
//  end;
//end;

end.
