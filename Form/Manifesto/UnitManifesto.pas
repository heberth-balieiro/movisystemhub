unit UnitManifesto;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxGDIPlusClasses, Vcl.Menus, cxTimeEdit,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.Tabs, dxBarBuiltInMenu, cxPC,SHDocVw,
  ACBrBase, ACBrEnterTab, pcnConversao,UConeSul,DateUtils,
  UFormNovoBasePesquisa, Vcl.ButtonStylesAttributes, System.ImageList,
  Vcl.ImgList, cxImageList, DBAccess, Uni, Vcl.StyledButton, cxGroupBox;
type
  TFrmManifesto = class(TFormNovoBasePesquisa)
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmManifesto: TFrmManifesto;
  
implementation
{$R *.dfm}
uses uJKDialog, Vcl.Loading, Vcl.Navigation, Vcl.Session, ACBrUtil, pcnRetDistDFeInt, UnitGlobal;




//procedure TFrmManifesto.btnBuscaClick(Sender: TObject);
//begin
//  RefreshTela;
//end;
//
//procedure TFrmManifesto.btnCancelarClick(Sender: TObject);
//var
////Pedido : TModelPedido;
//msg:string;
//begin
//  //cancelar Pedido fechado
//  if not dm.TabConsPedido.Eof then
//  begin
//    if ds.DataSet.FieldByName('idpedido').AsInteger > 0 then
//    begin
//      if ds.DataSet.FieldByName('status').AsString = 'FECHADO' then
//      begin
//        if JKDialog('Aviso', 'Deseja cancelar o pedido selecionada?', tdMensagem)  then
//        begin
////          Try
////            Pedido             := TModelPedido.Create;
////            Try
////              pedido.idPedido    := ds.DataSet.FieldByName('idpedido').AsInteger;
////              pedido.Cancelar(msg);
////            Finally
////              //Pedido.Free;
////            End;
////          Finally
////            RefreshTela;
////          End;
//        end;
//      end
//      else
//      JKDialog('Aviso','Pedido com status aberto.', tdAlerta);
//
//    end
//    else
//    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
//  end
//  else
//  begin
//    JKDialog('Aviso','Realize um filtro!', tdAlerta);
//  end;
//end;
//
//procedure TFrmManifesto.btnCienciaClick(Sender: TObject);
//var
//cnpj:string;
//iduf:integer;
//cStat, xEvento:String;
//begin
//  //Ciencia da Operação
//
//  ModelNF           := TModelConfNF.Create;
//  ModelEmp          := TModelEmpresa.Create;
//  try
//    Modelnf.ConfigurarComponenteNFe;
//    dm.ACBrNFe1.NotasFiscais.Clear;
//
//    if JKDialog('Aviso', 'Deseja dar ciência a nfe selecionada?', tdMensagem)  then
//    begin
//      Try
//        if ModelEmp.SelectDadosNFe(cnpj, iduf) then
//        GerouManifesto(cStat, xEvento,
//                     ds.DataSet.FieldByName('chave').AsString,
//                     CNPJ,
//                     '',
//                     teManifDestCiencia);
//
//        JKDialog('Sucesso','Status:'+cStat+#13+'Mensagem:'+xEvento, tdSucesso);
//      Finally
//
//      End;
//    end;
//
//  finally
//    ModelNF.free;
//  end;
//end;
//
//procedure TFrmManifesto.btnConfirmarClick(Sender: TObject);
//var
//cnpj:string;
//iduf:integer;
//cStat, xEvento:String;
//begin
//  //Confirmação da NFE
//  ModelNF           := TModelConfNF.Create;
//  ModelEmp          := TModelEmpresa.Create;
//  try
//    Modelnf.ConfigurarComponenteNFe;
//    dm.ACBrNFe1.NotasFiscais.Clear;
//
//    if JKDialog('Aviso', 'Deseja confirmar a nfe selecionada?', tdMensagem)  then
//    begin
//      Try
//        if ModelEmp.SelectDadosNFe(cnpj, iduf) then
//        GerouManifesto(cStat, xEvento,
//                     ds.DataSet.FieldByName('chave').AsString,
//                     CNPJ,
//                     '',
//                     teManifDestConfirmacao);
//
//        JKDialog('Sucesso','Status:'+cStat+#13+'Mensagem:'+xEvento, tdSucesso);
//      Finally
//
//      End;
//    end;
//
//  finally
//    ModelNF.free;
//  end;
//
//end;
//
//procedure TFrmManifesto.GerarPDF1Click(Sender: TObject);
//begin
//  //Gerar PDF XML selecionado
//  if not DM.TabManifesto.Eof then
//  begin
//    if ds.DataSet.FieldByName('id').AsInteger > 0 then
//    begin
//      //Verificar se tem XML
//      if ds.DataSet.FieldByName('xml').AsString <>'' then
//      begin
//        //Gravar Diretorio
//        ModelNF           := TModelConfNF.Create;
//
//        Try
//          Modelnf.ConfigurarComponenteNFe;
//
//          dm.ACBrNFe1.NotasFiscais.Clear;
//          //dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar := dm.nDirArquivo+NfePathPdf;
//
//          Try
//            dm.ACBrNFe1.NotasFiscais.LoadFromString(ds.DataSet.FieldByName('xml').AsString);
//            dm.ACBrNFe1.NotasFiscais.ImprimirPDF;
//
//            JKDialog('Sucesso', 'PDF gerado com sucesso!'+#13+dm.nDirArquivo+NfePathPdf, tdSucesso);
//          Except on e:exception do
//            JKDialog('Erro', 'Erro ao gerar PDF: ' + E.Message, tdErro);
//          End;
//        Finally
//          Modelnf.Free;
//        End;
//      end
//      else
//      JKDialog('Aviso', 'O XML está vazio! faça uma consulta', tdAlerta);
//    end
//    else
//    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
//  end
//  else
//  begin
//    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
//  end;
//
//end;
//
//function TFrmManifesto.GerouManifesto(out cStat, xEvento: string; chave, cnpj,
//                          xJustificativa: string; situacao: TpcnTpEvento): boolean;
//var
//  Msg: String;
//  vsituacao: string;
//  Model:  TModelSQL;
//  QryStr:String;
//begin
//  Result := false;
//  dm.ACBrNFe1.EventoNFe.Evento.Clear;
//
//  with dm.ACBrNFe1.EventoNFe.Evento.New do
//  begin
//    InfEvento.cOrgao    := 91;
//    InfEvento.chNFe     := Trim(OnlyNumber(chave));
//    InfEvento.cnpj      := Trim(OnlyNumber(cnpj));
//    InfEvento.dhEvento  := now;
//    InfEvento.tpEvento  := situacao;
//
//    if situacao = teManifDestOperNaoRealizada then
//    InfEvento.detEvento.xJust := xJustificativa;
//  end;
//
//  case situacao of
//    teManifDestCiencia:
//      vsituacao                 := 'Ciência da Operação';
//    teManifDestDesconhecimento:
//      vsituacao                 := 'Desconhecimento da Operação';//D
//    teManifDestConfirmacao:
//      vsituacao                 := 'Confirmação da Operação'; //M
//    teManifDestOperNaoRealizada:
//      vsituacao                 := 'Operação Não Realizada';
//  end;
//
//  if dm.ACBrNFe1.EnviarEvento(StrToInt('1')) then
//  begin
//    //Update nos dados
//
//    cStat   := IntToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cStat);
//    xEvento := dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.xMotivo;
//
//    if cStat = '135' then       //135 confirmação da operação    573 Duplicidade
//    begin
//      Model   := TModelSQL.Create;
//
//      Try
//        QryStr  := 'Update nfe_manifesto set situacao= :sit, '+
//                    ' protocolo= :prot, evento_tpevento= :etp, evento_corgao= :ece,'+
//                    ' evento_dhregevento= :dh, xmotivo= :xm,'+
//                    ' evento_verapli= :eapli, cstat= :cstat, evento_nseqevento= :sege'+
//                    ' where chave= :ch and id_empresa= :idemp';
//
//        Model.ExecutarSQL(dm.Conn,QryStr,[vsituacao,
//                                  dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.nProt,
//                                  TpEventoToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.tpEvento),
//                                  IntToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cOrgao),
//                                  DateTimeToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.dhRegEvento),
//                                  dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.xMotivo,
//                                  dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.verAplic,
//                                  dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cStat,
//                                  dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.nseqEvento,
//                                  chave, Tsession.IDEMPRESA]);
//        Result := true;
//      Finally
//        Model.Free;
//      End;
//
//    end
//    else
//    begin
//      Model   := TModelSQL.Create;
//
//      Try
//        QryStr  := 'Update nfe_manifesto set situacao= :sit, '+
//                    ' evento_tpevento= :etp, evento_corgao= :ece,'+
//                    ' evento_dhregevento= :dh, xmotivo= :xm,'+
//                    ' evento_verapli= :eapli, cstat= :cstat, evento_nseqevento= :sege'+
//                    ' where chave= :ch and id_empresa= :idemp';
//
//        Model.ExecutarSQL(dm.Conn,QryStr,['Confirmação da Operação',
//                                  TpEventoToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.tpEvento),
//                                  IntToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cOrgao),
//                                  DateTimeToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.dhRegEvento),
//                                  dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.xMotivo,
//                                  dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.verAplic,
//                                  dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cStat,
//                                  dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.nseqEvento,
//                                  chave, Tsession.IDEMPRESA]);
//        Result := true;
//      Finally
//        Model.Free;
//      End;
//    end;
//    {
//    //Teste para pegar lote
//
//     Memo1.Lines.Text := dm.ACBrNFe1.WebServices.EnvEvento.RetWS;
//     memo2.Lines.Text := dm.ACBrNFe1.WebServices.EnvEvento.RetornoWS;
//
//     //LoadXML(ACBrNFe1.WebServices.EnvEvento.RetornoWS, WBResposta);
//
//    Memo3.Lines.Add('');
//    Memo3.Lines.Add('Retorno do Evento');
//    Memo3.Lines.Add('');
//    Memo3.Lines.Add('Id.........: ' + dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.Id);
//    Memo3.Lines.Add('tpAmb......: ' + TpAmbToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.TpAmb));
//    Memo3.Lines.Add('verAplic...: ' + dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.verAplic);
//    Memo3.Lines.Add('cOrgao.....: ' + IntToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cOrgao));
//    Memo3.Lines.Add('cStat......: ' + IntToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cStat));
//    Memo3.Lines.Add('xMotivo....: ' + dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.xMotivo);
//    Memo3.Lines.Add('chNFe......: ' + dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.chNFe);
//    Memo3.Lines.Add('tpEvento...: ' + TpEventoToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.tpEvento));
//    Memo3.Lines.Add('xEvento....: ' + dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.xEvento);
//    Memo3.Lines.Add('nSeqEvento.: ' + IntToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.nSeqEvento));
//    Memo3.Lines.Add('CNPJDest...: ' + dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.CNPJDest);
//    Memo3.Lines.Add('emailDest..: ' + dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.emailDest);
//    Memo3.Lines.Add('dhRegEvento: ' + DateTimeToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.dhRegEvento));
//    Memo3.Lines.Add('Protocolo..: '+ dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.nProt);
//    }
//
//  end;
//
//end;
//
//procedure TFrmManifesto.btnDesconhecerClick(Sender: TObject);
//var
//cnpj:string;
//iduf:integer;
//cStat, xEvento:String;
//begin
//  //Desconhecimanto da NFE
//
//  ModelNF           := TModelConfNF.Create;
//  ModelEmp          := TModelEmpresa.Create;
//  try
//    Modelnf.ConfigurarComponenteNFe;
//    dm.ACBrNFe1.NotasFiscais.Clear;
//
//    if JKDialog('Aviso', 'Deseja realiar o desconhecimento da nfe selecionada?', tdMensagem)  then
//    begin
//      Try
//        if ModelEmp.SelectDadosNFe(cnpj, iduf) then
//        GerouManifesto(cStat, xEvento,
//                     ds.DataSet.FieldByName('chave').AsString,
//                     CNPJ,
//                     '',
//                     teManifDestDesconhecimento);
//
//        JKDialog('Sucesso','Status:'+cStat+#13+'Mensagem:'+xEvento, tdSucesso);
//      Finally
//
//      End;
//    end;
//
//  finally
//    ModelNF.free;
//  end;
//end;
//
//procedure TFrmManifesto.btnFiltroClick(Sender: TObject);
//begin
//  edtbusca.Clear;
//  RefreshTela;
//end;
//
//procedure TFrmManifesto.btnLimparClick(Sender: TObject);
//begin
//  //Limpar consulta
//  edtbusca.Clear;
//  data1.EditValue := StartOfTheMonth(Now);
//  data2.EditValue := EndOfTheMonth(Now);
//  EdtFiltro.ItemIndex := 0;
//  DM.TabManifesto.EmptyDataSet;
//end;
//
//procedure TFrmManifesto.btnNaorealizadaClick(Sender: TObject);
//var
//cnpj:string;
//iduf:integer;
//cStat, xEvento:String;
//xJustificativa:string;
//begin
//  //não realizado
//  //Passar a justificativa
//  xJustificativa := '';
//  if not(InputQuery('Não Realizado', 'Informe o motivo da operação', xJustificativa)) then
//  exit;
//
//  if Length(xJustificativa) < 15 then
//  begin
//    JKDialog('Alerta','O texto precisa ter pelo menos 15 caracteres. Por favor, revise e tente novamente.', tdAlerta);
//    exit;
//  end;
//
//  ModelNF           := TModelConfNF.Create;
//  ModelEmp          := TModelEmpresa.Create;
//  try
//    Modelnf.ConfigurarComponenteNFe;
//    dm.ACBrNFe1.NotasFiscais.Clear;
//
//    if JKDialog('Aviso', 'Deseja realizar essa operação da nfe selecionada?', tdMensagem)  then
//    begin
//      Try
//        if ModelEmp.SelectDadosNFe(cnpj, iduf) then
//        GerouManifesto(cStat, xEvento,
//                     ds.DataSet.FieldByName('chave').AsString,
//                     CNPJ,
//                     xJustificativa,
//                     teManifDestOperNaoRealizada);
//
//        JKDialog('Sucesso','Status:'+cStat+#13+'Mensagem:'+xEvento, tdSucesso);
//      Finally
//
//      End;
//    end;
//
//  finally
//    ModelNF.free;
//  end;
//
//end;
//
//procedure TFrmManifesto.BtnConsLoteClick(Sender: TObject);
//var
//nsu:string;
//iduf:Integer;
//cnpj:string;
//msg:String;
//titulo, tdtipo:string;
//begin
//
//
//  {if OpenDialog.Execute then
//  begin
//    dirxml  := OpenDialog.FileName;
//  end; }
//
//  //Consulta NFe Lote
//  ModelNF           := TModelConfNF.Create;
//  ModelEmp          := TModelEmpresa.Create;
//
//  Try
//    if Assigned(ModelNf) then
//    Modelnf.ConfigurarComponenteNFe;
//    dm.ACBrNFe1.NotasFiscais.Clear;
//
//    nsu       := IntTostr(Modelnf.NfeNsu);
//
//    if (nsu = '') then
//    begin
//      nsu := '0';
//    end;
//
//    Try
//      if Assigned(ModelEmp) then
//      if ModelEmp.SelectDadosNFe(cnpj, iduf) then
//      begin
//
//        TLoading.Show(FrmManifesto,'Aguarde! Consultando notas...');
//
//        try
//          TThread.CreateAnonymousThread(
//            procedure
//            begin
//
//              Try
//                if ConsultaNFeNSU(iduf, cnpj, nsu, msg, titulo, tdtipo) then
//                  TThread.Synchronize(TThread.CurrentThread,
//                  procedure
//                  begin
//                    TLoading.Hide;
//                    JKDialog(titulo,msg, tdAlerta);
//                  end)
//                else
//                  TThread.Synchronize(TThread.CurrentThread,
//                  procedure
//                  begin
//                    TLoading.Hide;
//                    JKDialog(titulo,msg, tdAlerta);
//                  end);
//
//              Except on e:exception do
//                begin
//                  TThread.Synchronize(TThread.CurrentThread,
//                    procedure
//                    begin
//                      TLoading.Hide;
//                      JKDialog('Erro',msg + E.Message, tdErro);
//                    end);
//                end;
//              End;
//
//            end).Start;
//        except
//          TLoading.Hide;
//        end;
//      end
//      else
//      JKDialog('Aviso','Verifique os dados da empresa!', tdAlerta);
//
//    except on e:exception do
//      begin
//        JKDialog('Erro',e.Message, tderro);
//      end;
//    End;
//
//  Finally
//    //ModelNF.Free;
//    //ModelEmp.Free;
//  End;
//end;
//
//{$REGION 'Buscar XML'}
//
//procedure TFrmManifesto.btnConsultaClick(Sender: TObject);
//var
//  xChave, chave: String;
//
//  nsu:string;
//  iduf:Integer;
//  cnpj:string;
//begin
//  //Consulta por chave
//  ModelNF             :=TModelConfNF.Create;
//  ModelEmp          := TModelEmpresa.Create;
//  Try
//
//    Modelnf.ConfigurarComponenteNFe;
//    dm.ACBrNFe1.NotasFiscais.Clear;
//
//    chave := ds.DataSet.FieldByName('chave').AsString; //InputBox('Chave da NFe', 'Digite a Chave', xChave);
//    xChave := chave;
//
//    if length(chave) <> 44 then
//    begin
//      ShowMessage('Chave Inválida');
//      exit;
//    end;
//
//    if ModelEmp.SelectDadosNFe(cnpj, iduf) then
//    begin
//
//      if ConsultaNFeChave(iduf,
//                        cnpj,
//                        chave) then
//
//    end;
//
//  Finally
//    ModelNF.Free;
//
//  End;
//
//end;
//
//function TFrmManifesto.ConsultaNFeNSU(UF: Integer;cnpj, ultnsusys:string;
//                                     out MsgR, titulo, tdtipo: string): boolean;
//var
//  i, j, k: Integer;
//  chaveRet, nsu,idemp,msg, TipoDoc:string;
//  AultNSU:string;
//  sStart, SMotivo :string;
//  stipoNFE,Impresso, tpeventor:string;
//begin
//  Result := False;
//                                                              //'C:\Projeto2024\ProjetoAsmuv\Aplicacao\Bin\NFe\Xml\20241029193803-dist-dfe.xml'
//    //dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.LerXMLFromFile(dirxml);
//    //dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.LerXml();
//
//    try
//      if dm.ACBrNFe1.DistribuicaoDFePorUltNSU(UF, cnpj, IntToStr(StrToInt(ultnsusys))) then
//      Result  := True;
//    except on E: Exception do
//      begin
//        raise Exception.Create('Erro ao consultar NFe: ' + E.Message);
//      end;
//    end;
//
//
//  Try
//    with dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt do
//    begin
//      sStart    := inttostr(cStat);
//      SMotivo   := xMotivo;
//      AultNSU   := ultNSU;
//      Result    := true;
//
//      if ((cStat = 137) or (cStat = 656) or (ultnsu = maxNSU)) then
//      begin
//        //656 - Consumo indevido
//        if cStat = 656 then
//        begin
//          MsgR := 'Consumo indevido!' + sLineBreak + xMotivo + sLineBreak + 'Data/Hora:' + DateToStr(dhresp);
//
//          if AultNSU <> ultnsu then
//          MsgR := 'Última NSU utilizada nesta consulta [' + AultNSU + ']' + sLineBreak +
//                      'é diferente do último NSU consultado na SEFAZ [' + ultNSU + '].';
//
//
//          titulo  := 'Atenção';
//          tdtipo  := 'tdAlerta';
//        end
//        else
//        if cStat = 137 then
//          MsgR    :=  'Não existem mais registros disponíveis!'
//        else
//          MsgR := 'Este é o último lote de registros disponíveis para distribuição!' + sLineBreak +
//                    'Aguarde 1 hora para a próxima consulta.';
//
//        titulo  := 'Atenção';
//        tdtipo  := 'tdAlerta';
//
//        //atualizar banco de dados com o ultimo nsu devolvido.
//
//        if ModelNF.UpdateNSU(msg,AultNSU) then
//      end;
//
//      //Percorrer dados recebidos
//      k := 0;
//      j := docZip.Count - 1;
//
//      For i := 0 to j do
//      begin
//
//        case docZip[i].schema of
//
//          schresNFe :begin  //Inserindo o Resumo no banco de dados
//                      if docZip[i].resDFe.chDFe <> '' then
//                      begin
//                        //Verifica se já tem no banco de dados
//                        if Assigned(ModelNf) then
//                        ModelNF.ExisteManifesto(chaveRet, nsu, idemp, docZip.Items[i].resDFe.chDFe);
//
//                          if chaveret <> docZip.Items[i].resDFe.chDFe then
//                          begin
//                            //Chave não registrado no banco
//
//                            case docZip.Items[i].resDFe.cSitDFe of
//                              snAutorizado: Impresso:= 'Autorizado';
//                              snDenegado:   Impresso:= 'Denegado';
//                              snCancelado:  Impresso:= 'Cancelado';
//                            end;
//
//                            case docZip.Items[i].resDFe.tpNF of
//                              tnEntrada: sTipoNFe := 'E';
//                              tnSaida:   sTipoNFe := 'S';
//                            end;
//
//                            if ModelNF.InsertManifestoResumo(msg,
//                                                      Copy(docZip.Items[i].resDFe.chDFe,26,9),
//                                                      docZip.Items[i].resDFe.chDFe,
//                                                      Copy(docZip.Items[i].resDFe.chDFe,23,3),
//                                                      docZip.Items[i].resDFe.xNome,
//                                                      docZip.Items[i].resDFe.CNPJCPF,
//                                                      docZip.Items[i].resDFe.IE,
//                                                      docZip.Items[i].NSU,
//                                                      docZip.Items[i].XML,
//                                                      Impresso,
//                                                      sTipoNFe,
//                                                      'Não Manifestado',
//                                                      SMotivo,
//                                                      docZip.Items[i].resDFe.vNF,
//                                                      now,
//                                                      docZip.Items[i].resDFe.dhEmi,
//                                                      strtoint(sStart)
//                                                      ) then
//                            Result  := True;
//                            Inc(k);
//                          end
//                          else
//                          begin
//                            if Assigned(ModelNf) then
//                            ModelNF.UpdateNSU(msg,AultNSU);
//                          end;
//                      end;
//                    end;
//
//          schprocNFe:begin //nota completa
//                      if docZip[i].resDFe.chDFe <> '' then
//                      begin
//                        //Verifica se já tem no banco de dados
//                        if Assigned(ModelNf) then
//                        ModelNF.ExisteManifesto(chaveRet, nsu, idemp, docZip.Items[i].resDFe.chDFe);
//
//                          if chaveret = docZip.Items[i].resDFe.chDFe then
//                          begin
//                            //Chave for = a que está no banco então atualiza a nota
//                            case docZip.Items[i].resDFe.cSitDFe of
//                              snAutorizado: Impresso:= 'Autorizado';
//                              snDenegado:   Impresso:= 'Denegado';
//                              snCancelado:  Impresso:= 'Cancelado';
//                            end;
//
//                            if ModelNF.UpdateXML(docZip[i].resDFe.chDFe,
//                                              docZip[i].XML,
//                                              impresso,
//                                              SMotivo
//                                              ) then
//
//                            Result  := True;
//                          end
//                          else
//                          begin
//                            if Assigned(ModelNf) then
//                            ModelNF.UpdateNSU(msg,AultNSU);
//                          end;
//                      end;
//                    end;
//
//          schresEvento:begin
//                      if docZip[i].resEvento.chDFe <> '' then
//                      begin
//                        //Verifica se já tem no banco de dados
//                        if Assigned(ModelNf) then
//                        ModelNF.ExisteManifesto(chaveRet, nsu, idemp, docZip[i].resEvento.chDFe);
//
//                          if chaveret = docZip.Items[i].resEvento.chDFe then
//                          begin
//
//                            case docZip.Items[i].resEvento.tpEvento of
//                              teManifDestConfirmacao      :tpeventor:='Confirmação da Operação';
//                              teManifDestCiencia          :tpeventor:='Ciência da Operação';
//                              teManifDestDesconhecimento  :tpeventor:='Desconhecimento da Operação';
//                              teManifDestOperNaoRealizada :tpeventor:='Operação Não Realizada';
//                            end;
//
//                            if ModelNF.UpdateEvento(docZip.Items[i].resDFe.chDFe,
//                                                    docZip.Items[i].resEvento.xEvento,
//                                                    docZip.Items[i].resEvento.nProt,
//                                                    tpeventor,
//                                                    docZip.Items[i].resEvento.dhEvento,
//                                                    docZip.Items[i].resEvento.dhRecbto,
//                                                    docZip.Items[i].resEvento.nSeqEvento,
//                                                    docZip.Items[i].resEvento.cOrgao) then
//
//                            Result  := True;
//                          end;
//                      end;
//                    end;
//        end;
//
//      end;
//
//      MsgR := 'Qtde Documentos Retornados: ' + IntToStr(docZip.Count) + sLineBreak +
//                'Status....: ' + IntToStr(cStat) + sLineBreak +
//                'Motivo....: ' + xMotivo + sLineBreak +
//                'Documentos Retornados:' + IntToStr(k);
//
//      titulo  := 'Sucesso';
//      tdtipo  := 'tdSucesso';
//    end;
//  except on e:exception do
//    MsgR := 'Erro ao consultar nota na SEFAZ: ' + E.Message;
//  End;
//end;
//
//procedure TFrmManifesto.ShowAlerta(const Title, Msg, tdtipo: string);
//begin
//  JKDialog(Title, Msg, tdAlerta);
//end;
//
//function TFrmManifesto.ConsultaNFeChave(UF: Integer;
//                                        cnpj, chave: string): boolean;
//var
//  i, j, k: Integer;
//  chaver,nsu,idemp,msg:string;
//begin
//
//  try
//    Result := false;
//
//    if dm.ACBrNFe1.DistribuicaoDFePorChaveNFe(UF, cnpj,chave) then
//    begin
//
//      if dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137 then
//      begin
//        ShowMessage(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo);
//        exit;
//      end;
//
//      j := dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count - 1;
//
//      For i := 0 to j do
//      begin
//
//        if dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe <> '' then
//        begin
//
//          //Buscar se chave já existe
//          Try
//            ModelNF     := TModelConfnf.create;
//
//            if dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.cSitDFe = TSituacaoDFe(snAutorizado) then
//            begin
//
//              if ModelNF.ExisteManifesto(chaver, nsu,idemp,dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe) then
//              if chaveR <> dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe then
//              begin
//                //Se ha chave não esta no banco de dados então inserir novo registro
//
//                if ModelNF.InsertManifesto(msg,
//                                         COPY(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe, 26, 9),
//                                         dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe,
//                                         COPY(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe, 23, 3),
//                                         dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.xNome,
//                                         dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.CNPJCPF,
//                                         dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.IE,
//                                         dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].nsu,
//                                         'Não Manifestado',
//                                         '',
//                                         '',
//                                         'N',
//                                         '',
//                                         '',
//                                         '',
//                                         '',
//                                         '',
//                                         '',
//                                         '',
//                                         dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.vNF,
//                                         Now,
//                                         dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.dhRecbto,
//                                         0,
//                                         0
//                                          ) then
//                Result := true;
//
//
//
//              end
//              else
//              begin
//                //Atualizar NSu
//
//                if ModelNF.UpdateXML(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe,
//                                              dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].XML,
//                                              '',
//                                              ''
//                                              ) then
//
//                //if ModelNF.UpdateNSU(msg,nsu) then
//
//
//
//              end;
//            end;
//
//          Finally
//            //Model.Free;
//          End;
//
//        end;
//      end;
//      Result := true;
//    end;
//  except
//    On e: exception do
//    begin
//      with dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt do
//        raise exception.Create('Retorno:' + xMotivo + sLineBreak + 'Erro:' +
//          e.Message);
//    end;
//  end;
//end;
//
//
//function TFrmManifesto.ConsultaXml(cnpj,chave: string; iduf:integer): string;
//var
//  i, j: Integer;
//  caminho: string;
//
//begin
//  ModelNF     := TModelConfnf.Create;
//
//  try
//    dm.ACBrNFe1.NotasFiscais.Clear;
//
//    if dm.ACBrNFe1.DistribuicaoDFePorChaveNFe(iduf,cnpj, chave) then
//    begin
//      Sleep(1000);
//
//      j := dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count - 1;
//
//      if dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137 then
//        raise exception.Create
//
//      (dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo);
//
//      for i := 0 to j do
//      begin
//
//        //Gravar XML Tabela
//
//        Try
//          //if Modelnf.UpdateXML(chave,dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].XML) then
//
//        Finally
//
//        End;
//
//      end;
//    end
//    else
//    begin
//      ShowMessage(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat.ToString + '-' +
//        dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
//    end;
//  except
//    on e: exception do
//      raise exception.Create(e.Message);
//  end;
//
//end;
//
//
//
//
//{$ENDREGION}
//
//
//procedure TFrmManifesto.btnpermissaoClick(Sender: TObject);
//begin
////Chamar tela de Impressao
//
//  if not dm.TabConsPedido.Eof then
//  begin
//    if ds.DataSet.FieldByName('idpedido').AsInteger > 0 then
//    begin
//      Try
////        FrmImpressao          := TFrmImpressao.Create(Application);
////        FrmImpressao.idPedido := ds.DataSet.FieldByName('idpedido').AsInteger;
////        FrmImpressao.nmPedido := ds.DataSet.FieldByName('numpedido').AsInteger;
////        FrmImpressao.idPessoa := ds.DataSet.FieldByName('idcliente').AsInteger;
////        FrmImpressao.nmVendedor	:= ds.DataSet.FieldByName('nmvendedor').AsString;
////        FrmImpressao.ShowModal;
//      Finally
//
//      End;
//    end
//    else
//    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
//  end
//  else
//  begin
//    JKDialog('Aviso','Realize um filtro!', tdAlerta);
//  end;
//
//end;
//
//procedure TFrmManifesto.btnvisualizarClick(Sender: TObject);
//begin
//  //Visualizar PDF
//  if not DM.TabManifesto.Eof then
//  begin
//    if ds.DataSet.FieldByName('id').AsInteger > 0 then
//    begin
//      //Verificar se tem XML
//      if ds.DataSet.FieldByName('xml').AsString <>'' then
//      begin
//        //Gravar Diretorio
//        dm.ACBrNFe1.NotasFiscais.Clear;
//        dm.ACBrNFe1.NotasFiscais.LoadFromString(ds.DataSet.FieldByName('xml').AsString);
//        dm.ACBrNFe1.NotasFiscais.Imprimir;
//
//        //dm.ACBrNFe1.DANFE.PathPDF := dm.nDirArquivo+NfePathPdf;
//      end
//      else
//      begin
//        btnConsulta.Click;
//
//        //dm.ACBrNFe1.DANFE.PathPDF := dm.nDirArquivo+NfePathPdf;
//
//      end;
//    end
//    else
//    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
//  end
//  else
//  begin
//    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
//  end;
//end;
//
//procedure TFrmManifesto.cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
//  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
//  AShift: TShiftState; var AHandled: Boolean);
//var
////Pedido : TModelPedido;
//msg:string;
//begin
//  //Buscar os itens do pedido selecionado
////  if not dm.TabConsPedido.Eof then
////  begin
////    if ds.DataSet.FieldByName('idpedido').AsInteger > 0 then
////    begin
////      Try
////        Try
////          Pedido          := TModelPedido.Create;
////          if Pedido.ItensPedido(msg,ds.DataSet.FieldByName('idpedido').AsInteger) then
////          else
////          JKDialog('Aviso',msg, tdAlerta);
////        Except on e:exception do
////          begin
////          raise
////          end;
////        End;
////
////      Finally
////        Pedido.Free;
////      End;
////    end;
////  end;
//
//end;
//
//procedure TFrmManifesto.cxGridDBTableView2CellDblClick(
//  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
//  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
//begin
//  //escolher para manifesar
//
//end;
//
//procedure TFrmManifesto.cxGridDBTableView2KeyDown(Sender: TObject;
//  var Key: Word; Shift: TShiftState);
//begin
//  // Verifica se a tecla pressionada é Enter (VK_RETURN)
//  if Key = VK_RETURN then
//  begin
//    //Escolher se quer manifestar
//  end;
//end;
//
//procedure TFrmManifesto.data1KeyPress(Sender: TObject; var Key: Char);
//begin
//  if Key = #13 then
//  begin
//    Key := #0;
//    Perform(WM_NEXTDLGCTL, 0, 0);
//    data2.SetFocus;
//  end;
//end;
//
//procedure TFrmManifesto.data2KeyPress(Sender: TObject; var Key: Char);
//begin
//  if Key = #13 then
//  begin
//    Key := #0;
//    Perform(WM_NEXTDLGCTL, 0, 0);
//    edtfiltro.SetFocus;
//  end;
//end;
//
//procedure TFrmManifesto.edtBuscaKeyPress(Sender: TObject; var Key: Char);
//begin
//  if Key = #13 then
//  begin
//    Key := #0;
//    Perform(WM_NEXTDLGCTL, 0, 0);
//    btnbusca.Click;
//  end;
//end;
//
//procedure TFrmManifesto.EdtFiltroKeyPress(Sender: TObject; var Key: Char);
//begin
//  if Key = #13 then
//  begin
//    Key := #0;
//    Perform(WM_NEXTDLGCTL, 0, 0);
//    edtbusca.SetFocus;
//  end;
//end;
//
//procedure TFrmManifesto.TabStatusChange(Sender: TObject);
//begin
//  RefreshTela;
//end;
//
//procedure TFrmManifesto.FormClose(Sender: TObject; var Action: TCloseAction);
//begin
//    Action := TCloseAction.caFree;
//    FrmManifesto := nil;
//end;
//
//procedure TFrmManifesto.FormKeyDown(Sender: TObject; var Key: Word;
//  Shift: TShiftState);
//begin
//  case key of
//    vk_F2:BtnConsLote.Click;
//    vk_F3:btnvisualizar.Click;
//    vk_F4:GerarPDF1.Click;
//    vk_f8:btnlimpar.Click;
//    vk_f7:btnbusca.Click;
//    vk_F9:btnlistagem.Click;
//
//  end;
//end;
//
//procedure TFrmManifesto.FormShow(Sender: TObject);
//begin
//  self.SetFocus;
//  data1.EditValue := StartOfTheMonth(date);
//  data2.EditValue := EndOfTheMonth(date);
//  edtbusca.SetFocus;
//end;
//
//procedure TFrmManifesto.Image1Click(Sender: TObject);
//begin
//  PopUp.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
//end;
//
//procedure TFrmManifesto.Localiza;
//var
//msg:string;
//begin
//  ModelNF          := TModelConfNF.Create;
//  Try
//    Try
//      ds.DataSet.Close;
//      ds.DataSet.Open;
//      if Modelnf.LocalizarDFe(msg,
//                        TabStatus.TabIndex,
//                        0,
//                        EdtFiltro.itemindex,
//                        data1.Date,
//                        data2.Date,
//                        edtBusca.text
//                        ) =False then
//      JKDialog('Aviso','Nenhum resultado encontrado!', tdAlerta);
//
//    Except on e:exception do
//      begin
//        JKDialog('Aviso',e.Message, tdErro);
//        raise
//      end;
//    End;
//
//  Finally
//    ModelNF.Free;
//  End;
//end;
//
//procedure TFrmManifesto.OpenCadTela(id: integer; str: string);
//begin
//
//  TNavigation.ParamInt          := id;
//  TNavigation.ParamsStr         := Str;
//  TNavigation.OpenModal(TFrmPedidoCad, FrmPedidoCad);
//end;
//
//procedure TFrmManifesto.Reabrir1Click(Sender: TObject);
//var
////Pedido : TModelPedido;
//msg:string;
//begin
//  //Reabrir  Pedido
////  if not dm.TabConsPedido.Eof then
////  begin
////    if ds.DataSet.FieldByName('idpedido').AsInteger > 0 then
////    begin
////      if ds.DataSet.FieldByName('status').AsString = 'FECHADO' then
////      begin
////        if JKDialog('Aviso', 'Deseja reabrir o pedido selecionada?', tdMensagem)  then
////        begin
////          Try
////            Pedido             := TModelPedido.Create;
////            Try
////              pedido.idPedido    := ds.DataSet.FieldByName('idpedido').AsInteger;
////              pedido.Reabrir(msg);
////            Finally
////              //Pedido.Free;
////            End;
////          Finally
////            RefreshTela;
////          End;
////        end;
////      end
////      else
////      JKDialog('Aviso','Pedido com status aberto.', tdAlerta);
////
////    end
////    else
////    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
////  end
////  else
////  begin
////    JKDialog('Aviso','Realize um filtro!', tdAlerta);
////  end;
//end;
//
//procedure TFrmManifesto.RefreshTela;
//begin
//  Localiza;
//end;
//
//procedure TFrmManifesto.Sincronizar1Click(Sender: TObject);
//begin
//  //receber Pedido
//
//
//
//
//
//end;
//
//procedure TFrmManifesto.StatusServio1Click(Sender: TObject);
//var
//Msg:string;
//
//begin
//  //Status do Servico web service
//  ModelNF       := TModelConfNF.Create;
//  Try
//    Modelnf.ConfigurarComponenteNFe;
//  Finally
//    Modelnf.Free;
//  End;
//
//
//  dm.ACBrNFe1.WebServices.StatusServico.Executar;
//
//  msg:='Status Serviço'+sLineBreak+
//  'tpAmb: '    +TpAmbToStr(dm.ACBrNFe1.WebServices.StatusServico.tpAmb)+sLineBreak+
//  'verAplic: ' +dm.ACBrNFe1.WebServices.StatusServico.verAplic+sLineBreak+
//  'cStat: '    +IntToStr(dm.ACBrNFe1.WebServices.StatusServico.cStat)+sLineBreak+
//  'xMotivo: '  +dm.ACBrNFe1.WebServices.StatusServico.xMotivo+sLineBreak+
//  'cUF: '      +IntToStr(dm.ACBrNFe1.WebServices.StatusServico.cUF)+sLineBreak+
//  'dhRecbto: ' +DateTimeToStr(dm.ACBrNFe1.WebServices.StatusServico.dhRecbto)+sLineBreak+
//  'tMed: '     +IntToStr(dm.ACBrNFe1.WebServices.StatusServico.TMed)+sLineBreak+
//  'dhRetorno: '+DateTimeToStr(dm.ACBrNFe1.WebServices.StatusServico.dhRetorno)+sLineBreak+
//  'xObs: '     +dm.ACBrNFe1.WebServices.StatusServico.xObs+sLineBreak;
//
//  Showmessage(msg);
//
//end;
//
//procedure TFrmManifesto.TabSet_StatusChange(Sender: TObject; NewTab: Integer;
//  var AllowChange: Boolean);
//begin
//  RefreshTela;
//end;
//
//procedure TFrmManifesto.TabSet_StatusClick(Sender: TObject);
//begin
//  Localiza;
//end;
end.
