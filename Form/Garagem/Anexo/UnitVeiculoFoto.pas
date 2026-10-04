unit UnitVeiculoFoto;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
  cxCheckBox, ACBrBase, ACBrEnterTab, cxCurrencyEdit, dxGalleryControl,
  Vcl.Menus, cxButtons, Vcl.ExtDlgs, dxShellDialogs,uni, dxGallery, cxClasses,ShellAPI;

type
  TFrmVeiculoFoto = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Paneltitulo: TPanel;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    edtcodigo: TcxTextEdit;
    edtDescricao: TcxTextEdit;
    ACBrEnterTab1: TACBrEnterTab;
    edtPlaca: TcxTextEdit;
    Label18: TLabel;
    Label22: TLabel;
    edtprcvenda: TcxCurrencyEdit;
    Label23: TLabel;
    vlrFipe: TcxCurrencyEdit;
    cxGroupBox2: TcxGroupBox;
    dxGalleryControl1: TdxGalleryControl;
    btnIncluir: TcxButton;
    dxOpenFileDialog1: TdxOpenFileDialog;
    OpenPicture: TOpenPictureDialog;
    dxGalleryControl1Group1: TdxGalleryControlGroup;
    edtFoto: TImage;
    btnexcluir: TcxButton;
    btnVisualizar: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure dxGalleryControl1ItemClick(Sender: TObject;
      AItem: TdxGalleryControlItem);
    procedure btnVisualizarClick(Sender: TObject);
  private
    Fidveiculo: Integer;
    idFotoSelecionada: Integer;
    Procedure CarregarFotosNaGaleria;
    procedure GravarFotoNoBanco(const FotoPath: TImage; ext, caminho:String; out idretfoto:integer);
    procedure ExcluirFotoSelecionada;
    Procedure VisualizarFoto;
    //function GetSelectedGalleryItem: TdxGalleryItem;
    { Private declarations }
  public
    Property idveiculo  :Integer  read  Fidveiculo  write Fidveiculo;

    { Public declarations }
  end;

var
  FrmVeiculoFoto: TFrmVeiculoFoto;

implementation

{$R *.dfm}

Uses Udm, Vcl.Session, uJKDialog, Winapi.Windows, Model.Produto, UConeSul,
  Vcl.Validacoes, uConfiguracaoService;

procedure TFrmVeiculoFoto.btnCancelarClick(Sender: TObject);
begin
  TNavigation.Close(Self);
end;

procedure TFrmVeiculoFoto.btnexcluirClick(Sender: TObject);
begin
  ExcluirFotoSelecionada;
end;

procedure TFrmVeiculoFoto.btnIncluirClick(Sender: TObject);
var
  i: Integer;
  NewItem: TdxGalleryItem;
  FotoPath: string;
  idretfoto:integer;

begin
  // Permite selecionar múltiplas fotos
  OpenPicture.Options               := [ofAllowMultiSelect];

  if OpenPicture.Execute then
  begin
    for i := 0 to OpenPicture.Files.Count - 1 do
    begin
      FotoPath := OpenPicture.Files[i];
      edtFoto.Picture.LoadFromFile(FotoPath);
      // 1. Grava foto na tabela foto_veiculo (pode ser caminho ou blob)
      GravarFotoNoBanco(edtFoto,TConeSul.CapturarExtensaoArquivo(FotoPath),FotoPath, idretfoto);

      // 2. Adiciona na galeria visual
      NewItem := dxGalleryControl1.Gallery.Groups[0].Items.Add;
      NewItem.Caption := 'Foto ' + IntToStr(i + 1);
      NewItem.Hint := IntToStr(idretfoto);
      NewItem.Glyph.LoadFromFile(FotoPath);
      idFotoSelecionada     := 0;


        if TConfiguracaoService.ValidarUsoAppVeiculo(TSession.idempresa) then
        begin
          try
            TConfiguracaoService.SincronizarGravar(21, 0); //foto veiculo
          except on e:exception do
            begin
              raise;
            end;
          end;
        end;
     
      
    end;
  end;
end;

procedure TFrmVeiculoFoto.btnVisualizarClick(Sender: TObject);
begin
  // Visualizar foto no navegador.
  VisualizarFoto;
end;

Procedure TFrmVeiculoFoto.GravarFotoNoBanco(const FotoPath: TImage; ext, caminho:String; out idretfoto:integer );
var
ModelVeiculo  : TModelVeiculo;
Base64:string;
begin
  Modelveiculo    := TModelVeiculo.Create;
  Try
    Modelveiculo.idempresa    := Tsession.IDEMPRESA;
    ModelVeiculo.idProduto    := idveiculo;

    Base64                    := TConeSul.ConvImgBase64(FotoPath);

    ModelVeiculo.GravarFotoVeiculo(idretfoto,Base64,caminho,ext);
  Finally
    FreeAndNil(ModelVeiculo);
  End;
end;

procedure TFrmVeiculoFoto.VisualizarFoto;
var
ModelVeiculo  :TModelVeiculo;
Base64, Extensao, caminho:string;
begin
  if idFotoSelecionada = 0 then
  begin
    JKDialog('Aviso','Nenhuma foto selecionada.', tdAlerta);
    Exit;
  end;

  ModelVeiculo      := TmodelVeiculo.Create;

  try
    Try
      if Modelveiculo.VisualizarFotoSelecionada(idFotoSelecionada, idveiculo, base64,Extensao) then
      begin
        if base64<>'' then
        begin
          TConesul.LimparPasta(dm.nDirArquivo+'/Temp');
          TConesul.ndir := dm.nDirArquivo+'/Temp';
          caminho       := TConesul.ConvBase64ImgDir(base64,Extensao);

          if caminho <> '' then
          begin
            ShellExecute(0, 'open', PChar(caminho), nil, nil, SW_SHOWNORMAL);          
          end
          else
          JKDialog('Erro','Erro na conversão da foto.', tderro);
        end;
      end;
    Except on e:exception do
      begin
        raise;
      end;
    End;

  finally
    ModelVeiculo.Free;
  end;

end;

procedure TFrmVeiculoFoto.CarregarFotosNaGaleria;
var
  Qry     : TUniQuery;
  NewItem : TdxGalleryItem;

begin
  dxGalleryControl1.Gallery.Groups[0].Items.Clear;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.Conn;
    Qry.SQL.Text := 'SELECT id_foto, base64 FROM veiculo_foto WHERE id_veiculo = :id';
    Qry.ParamByName('id').AsInteger           := idveiculo;
    Qry.Open;

    while not Qry.Eof do
    begin
      //NewItem := dxGalleryControl1.Gallery.Groups[0].Items.Add;
      //NewItem.Caption := 'Foto';
      //NewItem.Hint    := 'Foto do veículo';

      TConesul.ConvBase64Img(Qry.FieldByName('base64').AsString);
      edtfoto.Picture         := TConeSul.nfoto;
      TConeSul.nfoto.Free;

      // Cria novo item na galeria
      NewItem := dxGalleryControl1.Gallery.Groups[0].Items.Add;
      NewItem.Caption := 'Foto';
      NewItem.Hint := Qry.FieldByName('id_foto').AsString;
      NewItem.Glyph.Assign(edtfoto.Picture.Graphic);

      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TFrmVeiculoFoto.dxGalleryControl1ItemClick(Sender: TObject;
  AItem: TdxGalleryControlItem);
begin

  if AItem.Hint <> '' then
    idFotoSelecionada   := Strtoint(AItem.Hint)
  else
    idFotoSelecionada   := 0;

end;

procedure TFrmVeiculoFoto.ExcluirFotoSelecionada;
var
ModelVeiculo  : TModelveiculo;
begin
  if idFotoSelecionada = 0 then
  begin
    JKDialog('Aviso','Nenhuma foto selecionada.', tdAlerta);
    Exit;
  end;

  if JKDialog('Aviso', 'Confirmar excluir a foto selecionada?', tdMensagem) then
  begin
    ModelVeiculo      := TModelVeiculo.Create;

    Try
      Try
        if ModelVeiculo.ExcluirFotoVeiculoSelecionado(idFotoSelecionada,idveiculo) then
        begin
          CarregarFotosNaGaleria;
          idFotoSelecionada := 0;
          JKDialog('Sucesso','Foto Excluida.', tdSucesso);
        end
        else
        begin
          JKDialog('Aviso','Não foi possivel excluir a foto selecionada.', tdAlerta);
        end;
      Except on e:exception do
        begin
          JKDialog('Erro','Erro ao excluir foto:'+#13+e.Message, tderro);
          raise;
        end;
      End;

    Finally
      ModelVeiculo.Free;
    End;
  end;

end;

procedure TFrmVeiculoFoto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmVeiculoFoto := nil;
end;

procedure TFrmVeiculoFoto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_ESCAPE then
  begin
    btncancelar.Click;
    key:=0;
  end;
end;

procedure TFrmVeiculoFoto.FormShow(Sender: TObject);
var
Modelveiculo  : TmodelVeiculo;
rcodigo:integer;
rdescricao, rplaca:String;
rprcvenda, rvlrfipe: double;
begin
  idFotoSelecionada       := 0;
  idveiculo               := TNavigation.ParamInt;

  Try
    Modelveiculo      := TmodelVeiculo.Create;
    if Modelveiculo.CarregardadosVeiculoFoto(rcodigo,rdescricao, rplaca,rprcvenda, rvlrfipe, idveiculo) then
    begin
      edtcodigo.EditValue     := rcodigo;
      edtDescricao.EditValue  := rdescricao;
      edtPlaca.EditValue      := rplaca;
      vlrFipe.EditValue       := rvlrfipe;
      edtprcvenda.EditValue   := rprcvenda;
    end;

  Finally
    FreeAndNil(ModelVeiculo)
  End;
  CarregarFotosNaGaleria;
end;


{Quando clica na foto podemos ver as fotos pela url da api.}

end.
