unit UnitRelatorioAssociado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseRelatorio, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.ButtonStylesAttributes,
  frxExportHelpers, frxExportSVG, frxClass, frxExportBaseDialog, frxExportPDF,
  frxDBSet, cxStyles, cxGridTableView, cxClasses, Data.DB, DBAccess, Uni,
  ACBrBase, ACBrEnterTab, Vcl.StyledButton, cxGroupBox, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Datasnap.DBClient, Controller.LookupHelper, UnitGlobal,
  uJKDialog, Controller.Pessoa, MemDS, uConfiguracaoService, Vcl.Session,
  UConeSul, UDM, Vcl.Grids, Vcl.DBGrids;

type
  TFrmRelAssociado = class(TFrmBaseRelatorio)
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    cxGroupBox3: TcxGroupBox;
    Label2: TLabel;
    cxSituacao: TcxComboBox;
    Label17: TLabel;
    cxCidade: TcxLookupComboBox;
    Label40: TLabel;
    cxLotacao: TcxLookupComboBox;
    Label21: TLabel;
    cxsecretaria: TcxLookupComboBox;
    cxGroupBox4: TcxGroupBox;
    Label3: TLabel;
    cxModeloRelatorio: TcxComboBox;
    cxdata1: TcxDateEdit;
    cxdata2: TcxDateEdit;
    Label10: TLabel;
    cxaniversario: TcxComboBox;
    cxordernar: TcxComboBox;
    Label4: TLabel;
    TabSindLotacao: TClientDataSet;
    TabSindLotacaoid_lotacao: TIntegerField;
    TabSindLotacaocodigo: TIntegerField;
    TabSindLotacaodescricao: TStringField;
    TabSindLotacaoativo: TStringField;
    TabSindLotacaonlotacao: TStringField;
    dsLotacao: TUniDataSource;
    TabSecretaria: TClientDataSet;
    TabSecretariaid_secretaria: TIntegerField;
    TabSecretariacodigo: TIntegerField;
    TabSecretariarazao: TStringField;
    TabSecretariansecretaria: TStringField;
    dsSecretaria: TUniDataSource;
    TabCidade: TClientDataSet;
    TabCidadeid_cidade: TIntegerField;
    TabCidadecidade: TStringField;
    TabCidadeuf: TStringField;
    TabCidadencidade: TStringField;
    dsCidade: TUniDataSource;
    QryFiltro: TUniQuery;
    frxRelatorio: TfrxReport;
    BtnFiltro: TStyledBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxModeloRelatorioPropertiesChange(Sender: TObject);
    procedure BtnFiltroClick(Sender: TObject);
  private
    FController: TPessoaController;
    Function MontarFiltroSql:String;
    procedure MontarCabecalhoRelatorio(const AFiltro: string);
    procedure PrepararRelatorio(const AArquivo: string);
    procedure VisualizarRelatorio;
    procedure FiltragemSelecionado(I: Integer);
    Procedure LimparFiltro;
    { Private declarations }
  public
    function Imprimir(out msg: string): Boolean;override;
    function ValidarCampos(out msg: string): Boolean; override;
    { Public declarations }
  end;

var
  FrmRelAssociado: TFrmRelAssociado;

implementation

{$R *.dfm}

procedure TFrmRelAssociado.BtnFiltroClick(Sender: TObject);
begin
  inherited;
  LimparFiltro;
end;

procedure TFrmRelAssociado.cxModeloRelatorioPropertiesChange(Sender: TObject);
begin
  inherited;
  cxaniversario.Enabled	:= False;
  cxdata1.Enabled       := false;
  cxdata2.Enabled       := false;

  case cxModeloRelatorio.ItemIndex of
    5:
    begin    
      cxaniversario.Enabled	:= True;
    end;
    6:
    begin
      cxdata1.Enabled       := True;
      cxdata2.Enabled       := true;
    end;
  end;
end;

procedure TFrmRelAssociado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmRelAssociado := nil;
end;

procedure TFrmRelAssociado.FormShow(Sender: TObject);
begin
  inherited;
  Try
    TLookupHelper.CarregarLookup(
                  TabCidade,LookupCidadeSql);

    TLookupHelper.CarregarLookup(
                  TabsindLotacao,LookupLotacaoSql);

    TLookupHelper.CarregarLookup(
                  TabSecretaria,LookupSecretariaSql);

    TitleText               := 'Relatório de Associado';
    cxdata1.Enabled         := False;
    cxdata2.Enabled         := false;
    cxaniversario.Enabled   := false;
  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

function TFrmRelAssociado.Imprimir(out msg: string): Boolean;
begin
  Result  := False;
  msg     := '';

  case cxmodelorelatorio.ItemIndex of
    0:
    begin
      FiltragemSelecionado(0);
      PrepararRelatorio(ExtractFilePath(Application.ExeName)+'\Relatorio\RelAssociadoListagemSimples.fr3');
    end;
    1:
    begin
      FiltragemSelecionado(1);
      PrepararRelatorio(ExtractFilePath(Application.ExeName)+'\Relatorio\RelAssociadoListagemCompleta.fr3');
    end;
    2:
    begin
      FiltragemSelecionado(2);
      PrepararRelatorio(ExtractFilePath(Application.ExeName)+'\Relatorio\RelAssociadoListagemAgrupadoCidade.fr3');
    end;
    3:
    begin
      FiltragemSelecionado(2);
      PrepararRelatorio(ExtractFilePath(Application.ExeName)+'\Relatorio\RelAssociadoListagemAgrupadoSecretaria.fr3');
    end;
    4:
    begin
      FiltragemSelecionado(4);
      PrepararRelatorio(ExtractFilePath(Application.ExeName)+'\Relatorio\RelAssociadoListagemAgrupadoLotacao.fr3');
    end;
    5:
    begin
      FiltragemSelecionado(5);
      PrepararRelatorio(ExtractFilePath(Application.ExeName)+'\Relatorio\RelAssociadoListagemAniversariantes.fr3');
    end;
    6:
    begin
      FiltragemSelecionado(6);
      PrepararRelatorio(ExtractFilePath(Application.ExeName)+'\Relatorio\RelAssociadoListagemDataAssociacao.fr3');
    end;
  end;

  if QryFiltro.RecordCount > 0 then
  begin
    VisualizarRelatorio;
    Result  := true;
  end
  else
  begin
    msg := 'Nenhum registro encontrado';
    ParamsAviso := 'Alerta';
  end;
end;

procedure TFrmRelAssociado.LimparFiltro;
begin
  //Limpar Filtro
  cxmodelorelatorio.ItemIndex := 0;
  cxordernar.ItemIndex        := 1;
  cxSituacao.ItemIndex        := 0;
  cxCidade.EditValue          := 0;
  cxCidade.Text               := '';
  cxLotacao.EditValue         := 0;
  cxLotacao.Text              := '';
  cxsecretaria.EditValue      := 0;
  cxsecretaria.Text           := '';
  cxdata1.Clear;
  cxdata2.Clear;
  cxaniversario.ItemIndex     := 0;
  cxmodelorelatorio.SetFocus;
end;

Procedure TFrmRelAssociado.FiltragemSelecionado(I:Integer);
begin
  Try
    FController      := TPessoaController.Create;

    Try
      QryFiltro.Close;
      case I of
        0,1,2,3,4:
        begin
          if FController.ImpressaoRelatorioSimples(QryFiltro, MontarFiltroSQL) then
          begin
            QryFiltro.DisableControls;
          end;
        end;
        5:
        begin
           if FController.ImpressaoRelatorioSimples(QryFiltro, MontarFiltroSQL) then
          begin
            QryFiltro.DisableControls;
          end;
        end;
        6:
        begin
           if FController.ImpressaoRelatorioSimples(QryFiltro, MontarFiltroSQL) then
          begin
            QryFiltro.DisableControls;
          end;
        end;
      end;

    Finally
      FreeAndNil(FController);
    End;

  except on e:exception do
    begin
      ParamsAviso:= 'Error';
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TFrmRelAssociado.MontarFiltroSql: String;
begin
  Result  := ' where 1=1 and s.excluido=0 and s.id_socio > 0 and s.cliente=''S'' ';

  if cxsituacao.Text <> '' then
  Result  := Result + ' and s.situacao = '+Quotedstr(LowerCase(cxsituacao.Text));

  if (cxcidade.Text <> '') or (cxcidade.EditValue > 0)  then
  Result  := Result + ' and s.id_cidade = '+ Inttostr(cxcidade.EditValue);

  if (cxlotacao.Text <> '') or (cxlotacao.EditValue > 0)  then
  Result  := Result + ' and s.id_lotacao = '+ Inttostr(cxlotacao.EditValue);

  if (cxsecretaria.Text <> '') or (cxsecretaria.EditValue > 0)  then
  Result  := Result + ' and s.escritorio = '+ Inttostr(cxsecretaria.EditValue);

  case cxmodelorelatorio.ItemIndex of
    0,1:
    begin //Listagem simples, Listagem completa
      case cxordernar.ItemIndex of
        0:Result := Result + ' order by s.codigo';
        1:Result := Result + ' order by s.matricula';
        2:Result := Result + ' order by s.nome';
        3:Result := Result + ' order by s.situacao';
        4:Result := Result + ' order by c.cidade';
      end;
    end;
    2:
    begin //Listagem agrupada por cidade
      Result := Result + ' order by c.cidade';
    end;
    3:
    begin //Listagem agrupada por secretaria
      Result := Result + ' order by ss.razao';
    end;
    4:
    begin  //Listagem agrupada por lotação
      Result := Result + ' order by sl.descricao';
    end;
    5:
    begin //Listagem de aniversariante
      if cxaniversario.ItemIndex > 0 then
      begin
        Result  := Result + ' and month(s.nascimento) = '+ Inttostr(cxaniversario.ItemIndex);
        Result := Result +' ORDER BY s.nascimento, s.nome';
      end;
    end;
    6:
    begin //Listagem por data de associação
      Result := Result +
      ' and s.socio_deste >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', cxdata1.Date)) +
      ' and s.socio_deste <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', cxdata2.Date));
      Result := Result + ' order by s.socio_deste, s.nome';
    end;
  end;

end;

function TFrmRelAssociado.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;
  msg     := '';

  if cxmodelorelatorio.ItemIndex = 6 then
  begin
    if (cxdata1.Date = 0) and (cxdata2.Date = 0) then
    begin
      msg := 'Informe a data inicial e final.';
      Exit(False);
    end;
  end;

 if cxmodelorelatorio.ItemIndex = 5 then
 begin
   if cxaniversario.ItemIndex < 0 then
   begin
     msg  := 'Informe o mês de aniversário';
     exit(False);
   end;
 end;




  {

1 - Listagem simples
2 - Listagem completa
3 - Listagem agrupada por cidade
4 - Listagem agrupada por secretária
5 - Listagem agrupada por lotação
6 - Listagem de aniversariante
7 - Listagem por data de associação


  }
end;

procedure TFrmRelAssociado.VisualizarRelatorio;
begin
  MontarCabecalhoRelatorio('');
  FrxRelatorio.Report.PrepareReport();
  FrxRelatorio.ShowReport;
end;

procedure TFrmRelAssociado.MontarCabecalhoRelatorio(const AFiltro: string);
var
  DadosEmpresa: TEmpresaRelatorio;
  TempImage: TImage;
  CaminhoLogo: string;
begin
  DadosEmpresa := TConfiguracaoService.ObterDadosEmpresaRelatorio(TSession.IDEMPRESA);

  FrxRelatorio.Variables.Clear;
  FrxRelatorio.Variables['nrazao']    := QuotedStr(DadosEmpresa.razao);
  FrxRelatorio.Variables['nfantasia'] := QuotedStr(DadosEmpresa.fantasia);
  FrxRelatorio.Variables['nendereco'] := QuotedStr(DadosEmpresa.endereco);
  FrxRelatorio.Variables['nnumero']   := QuotedStr(DadosEmpresa.numero);
  FrxRelatorio.Variables['nbairro']   := QuotedStr(DadosEmpresa.bairro);
  FrxRelatorio.Variables['ntelefone'] := QuotedStr(DadosEmpresa.telefone);
  FrxRelatorio.Variables['nfone1']    := QuotedStr(DadosEmpresa.telefone2);
  FrxRelatorio.Variables['nfone2']    := QuotedStr(DadosEmpresa.celular);
  FrxRelatorio.Variables['nemail']    := QuotedStr(DadosEmpresa.email1);
  FrxRelatorio.Variables['ncnpj']     := QuotedStr(DadosEmpresa.cnpj);
  FrxRelatorio.Variables['nie']       := QuotedStr(DadosEmpresa.ie);
  FrxRelatorio.Variables['ncep']      := QuotedStr(DadosEmpresa.cep);
  FrxRelatorio.Variables['ncidade']   := QuotedStr(DadosEmpresa.cidade);
  FrxRelatorio.Variables['filtro']    := QuotedStr(AFiltro);
  CaminhoLogo := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +'Temp\Logo.jpeg';

  ForceDirectories(ExtractFilePath(CaminhoLogo));

  if DadosEmpresa.logo <> '' then
  begin
    TempImage := TImage.Create(nil);
    try
      TConesul.ConvBase64Img(DadosEmpresa.logo);
      TempImage.Picture := TConesul.nfoto;
      TempImage.Picture.SaveToFile(CaminhoLogo);
      FrxRelatorio.Variables['wlogo'] := QuotedStr(CaminhoLogo);
    finally
      if Assigned(TConesul.nfoto) then
        FreeAndNil(TConesul.nfoto);
      TempImage.Free;
    end;
  end
  else
    FrxRelatorio.Variables['wlogo'] := QuotedStr('');
end;

procedure TFrmRelAssociado.PrepararRelatorio(const AArquivo: string);
begin
  if FileExists(AArquivo) then
    frxRelatorio.LoadFromFile(AArquivo)
  else
    raise Exception.Create('Arquivo de relatório não encontrado: ' + AArquivo);
end;

end.
