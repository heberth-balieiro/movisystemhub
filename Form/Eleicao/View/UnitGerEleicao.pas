unit UnitGerEleicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
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
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, dxGDIPlusClasses, frxClass,
  frxDBSet, frxRich, UFormNovoBasePesquisa, cxContainer,
  Vcl.ButtonStylesAttributes, System.ImageList, Vcl.ImgList, cxImageList,
  DBAccess, Uni, ACBrBase, ACBrEnterTab, Vcl.StyledButton, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, cxGroupBox, UFormNovoBaseGerenciamento,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar;

type
  TFrmGerEleicao = class(FormNovoBaseGerenciamento)
    frxRelatorio: TfrxReport;
    frxDBListagemAptos: TfrxDBDataset;
    frxDBFolhaVotacao: TfrxDBDataset;
    frxDBFolhaCabechalho: TfrxDBDataset;
    frxDBListagemNaoVotantes: TfrxDBDataset;
    frxRichObject1: TfrxRichObject;
    frxDBDATA: TfrxDBDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure BtnPublicarClick(Sender: TObject);
    procedure Despublicar1Click(Sender: TObject);
    procedure ResultadodaCampanha1Click(Sender: TObject);
    procedure Env1Click(Sender: TObject);
    procedure EncerrarCampanha1Click(Sender: TObject);
    procedure btnListAptosClick(Sender: TObject);
    procedure btnListInaptosClick(Sender: TObject);
    procedure btnListVotacaoClick(Sender: TObject);
    procedure btnListNaoVotantesClick(Sender: TObject);
    procedure Ata1Click(Sender: TObject);
    procedure btnsincronizarClick(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
    procedure Listagem1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
  private
    bookmark: TBookmark;
    procedure OpenCadTela(id: integer;str:string);
    procedure Localizar;
    procedure RefreshTela;
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGerEleicao: TFrmGerEleicao;

implementation

{$R *.dfm}

uses UDM, UnitMembroCad, UnitCampanhaCad, Vcl.Loading, model.Campanha,
  UnitValidador, uJKDialog,  UnitResultado, UnitFrmWhatsAppMassa,
  UConeSul, UDMRelatorio, model.Empresa, Vcl.Session, model.Relatorio,
  Vcl.Validacoes, Vcl.PermissaoUsuario, uConfiguracaoService;

procedure TFrmGerEleicao.OpenCadTela(id: integer;str:string);
begin
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := str;
  TNavigation.OpenModal(TFrmCampanhaCad, FrmCampanhaCad);
end;

procedure TFrmGerEleicao.Ata1Click(Sender: TObject);
var
Model     :TModelEmpresa;
ModelRel  :TModelRelatorio;
msg:string;
TempImage: Timage;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Gerar Ata') then
  begin
    //Emissão ATA

  if not dm.TabConsCampanha.Eof then
  begin
    if ds.DataSet.FieldByName('id_campanha').AsInteger > 0 then
    begin
      if ds.DataSet.FieldByName('concluida').AsString='S' then
      begin
        ModelRel        := TModelRelatorio.Create;
        Try
          Try
            if ModelRel.RelAta(ds.DataSet.FieldByName('token').AsString) then//passo o token da campanha
            begin
              if not DMRelatorio.RelATA.Eof then
              begin

                FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelAta.fr3');
                Try
                  DMRelatorio.RelATA.DisableControls;

                  Model             := TModelEmpresa.Create;
                  Try
                    Model.idempresa   := TSession.IDEMPRESA;
                    Model.SelectCabecalhoReport(msg);

                    FrxRelatorio.Variables.Clear;
                    FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
                    FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
                    FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
                    FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
                    FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
                    FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
                    FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
                    FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
                    FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
                    FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
                    FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);

                    try
                      // Decodifica a imagem Base64 e carrega no fluxo de memória
                      TempImage   := TImage.Create(nil);
                      TConesul.ConvBase64Img(model.logo);
                      TempImage.Picture    :=TConesul.nfoto;
                      TConesul.nfoto.Free;
                      TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
                    finally
                      TempImage.Free;
                    end;

                    FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
                    FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
                    FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
                    FrxRelatorio.Variables['filtro']          :=quotedstr('ATA de Votação');

                  Finally
                    model.Free;
                  End;

                  FrxRelatorio.Report.PrepareReport();
                  FrxRelatorio.ShowReport;
                Finally
                  DMRelatorio.RelATA.First;
                  DMRelatorio.RelATA.EnableControls;
                End;

                //JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
              end
              else
              begin
                JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
              end;
            end;
          Finally
            //ModelRel.Free;
          End;

        Finally
          RefreshTela;
        End;
      end
      else
      begin
        JKDialog('Aviso','Campanha ainda está aberta!', tdAlerta);
      end;
    end
    else
    JKDialog('Aviso','Selecione um registro!', tdAlerta);

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


end;

procedure TFrmGerEleicao.btnBuscaClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Pesquisa') then
  begin
    RefreshTela;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmGerEleicao.RefreshTela;
begin
  Localizar;
end;

procedure TFrmGerEleicao.Relatrio1Click(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Relatório') then
  begin

  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmGerEleicao.ResultadodaCampanha1Click(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Visualizar Resultado') then
  begin
    //abrir Novo Formulario com os dados.

    if not dm.TabConsCampanha.Eof then
    begin
      if ds.DataSet.FieldByName('id_campanha').AsInteger > 0 then
      begin
        if ds.DataSet.FieldByName('publicada').AsString='PUBLICADA' then
        begin
          Try

            FrmValidador            := TFrmValidador.create(Application);
            FrmValidador.Acao       := 'R'; //resultado
            FrmValidador.idCampanha := ds.DataSet.FieldByName('id_campanha').AsInteger;
            FrmValidador.ShowModal;

            //TNavigation.ParamInt          := ds.DataSet.FieldByName('id_campanha').AsInteger;
            //TNavigation.ParamsStr         := '';
            //TNavigation.OpenModal(TFrmResultado, FrmResultado);

          Finally
            RefreshTela;
          End;
        end

        else
        JKDialog('Aviso','Selecione uma campanha publicada!', tdAlerta);
      end
      else
      JKDialog('Aviso','Selecione um registro!', tdAlerta);

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


end;

procedure TFrmGerEleicao.btnListVotacaoClick(Sender: TObject);
var
Model     :TModelEmpresa;
ModelRel  :TModelRelatorio;
msg:string;
TempImage: Timage;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Imprimir Listagem de Votação') then
  begin
    //Lista de votacao

  if not dm.TabConsCampanha.Eof then
  begin
    if ds.DataSet.FieldByName('id_campanha').AsInteger > 0 then
    begin
      if ds.DataSet.FieldByName('concluida').AsString='S' then
      begin
        Try
          ModelRel        := TModelRelatorio.Create;

          Try
            if ModelRel.RelListagemAssociadoVotantes(ds.DataSet.FieldByName('token').AsString) then
            begin
              if not DMRelatorio.RelListagemVotantes.Eof then
              begin

                FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListFolhaVotacao.fr3');
                Try
                  DMRelatorio.RelListagemVotantes.DisableControls;

                  Model             := TModelEmpresa.Create;
                  Try
                    Model.idempresa   := TSession.IDEMPRESA;
                    Model.SelectCabecalhoReport(msg);

                    FrxRelatorio.Variables.Clear;
                    FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
                    FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
                    FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
                    FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
                    FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
                    FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
                    FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
                    FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
                    FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
                    FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
                    FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);

                    try
                      // Decodifica a imagem Base64 e carrega no fluxo de memória
                      TempImage   := TImage.Create(nil);
                      TConesul.ConvBase64Img(model.logo);
                      TempImage.Picture    :=TConesul.nfoto;
                      TConesul.nfoto.Free;
                      TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
                    finally
                      TempImage.Free;
                    end;

                    FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
                    FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
                    FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
                    FrxRelatorio.Variables['filtro']          :=quotedstr('Ficha de Votação');

                  Finally
                    model.Free;
                  End;

                  FrxRelatorio.Report.PrepareReport();
                  FrxRelatorio.ShowReport;
                Finally
                  DMRelatorio.RelListagemVotantes.First;
                  DMRelatorio.RelListagemVotantes.EnableControls;
                End;

                //JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
              end
              else
              begin
                JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
              end;
            end;
          Finally
            //ModelRel.Free;
          End;

        Finally
          RefreshTela;
        End;
      end
      else
      begin
        JKDialog('Aviso','Campanha ainda está aberta!', tdAlerta);
      end;
    end
    else
    JKDialog('Aviso','Selecione um registro!', tdAlerta);

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

end;

procedure TFrmGerEleicao.btnListNaoVotantesClick(Sender: TObject);
var
Model     :TModelEmpresa;
ModelRel  :TModelRelatorio;
msg:string;
TempImage: Timage;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Imprimir Listagem de não Votantes') then
  begin
    //Lista de associado não votantes

  if not dm.TabConsCampanha.Eof then
  begin
    if ds.DataSet.FieldByName('id_campanha').AsInteger > 0 then
    begin
      if ds.DataSet.FieldByName('concluida').AsString='S' then
      begin
        Try
          ModelRel        := TModelRelatorio.Create;

          Try
            if ModelRel.RelListagemAssociadoNaoVotantes(ds.DataSet.FieldByName('token').AsString) then
            begin
              if not DMRelatorio.RelListagemNaoVotantes.Eof then
              begin

                FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListAssociadoNaoVotantes.fr3');
                Try
                  DMRelatorio.RelListagemNaoVotantes.DisableControls;

                  Model             := TModelEmpresa.Create;
                  Try
                    Model.idempresa   := TSession.IDEMPRESA;
                    Model.SelectCabecalhoReport(msg);

                    FrxRelatorio.Variables.Clear;
                    FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
                    FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
                    FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
                    FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
                    FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
                    FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
                    FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
                    FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
                    FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
                    FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
                    FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);

                    try
                      // Decodifica a imagem Base64 e carrega no fluxo de memória
                      TempImage   := TImage.Create(nil);
                      TConesul.ConvBase64Img(model.logo);
                      TempImage.Picture    :=TConesul.nfoto;
                      TConesul.nfoto.Free;
                      TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
                    finally
                      TempImage.Free;
                    end;

                    FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
                    FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
                    FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
                    FrxRelatorio.Variables['filtro']          :=quotedstr('Ficha de Votação');

                  Finally
                    model.Free;
                  End;

                  FrxRelatorio.Report.PrepareReport();
                  FrxRelatorio.ShowReport;
                Finally
                  DMRelatorio.RelListagemNaoVotantes.First;
                  DMRelatorio.RelListagemNaoVotantes.EnableControls;
                End;

                //JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
              end
              else
              begin
                JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
              end;
            end;
          Finally
            //ModelRel.Free;
          End;

        Finally
          RefreshTela;
        End;
      end
      else
      begin
        JKDialog('Aviso','Campanha ainda está aberta!', tdAlerta);
      end;
    end
    else
    JKDialog('Aviso','Selecione um registro!', tdAlerta);

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

end;

procedure TFrmGerEleicao.btnListAptosClick(Sender: TObject);
var
Model     :TModelEmpresa;
ModelRel  :TModelRelatorio;
msg:string;
TempImage: Timage;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Imprimir Listagem de Associados Aptos') then
  begin
    //Listagem Associado aptos a vota
  ModelRel        := TModelRelatorio.Create;

  Try
    if ModelRel.RelListagemAssociadoAptosInaptos('S') then
    begin
      if not DMRelatorio.RelListagemAptos.Eof then
      begin

        FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListAssociadoAptos.fr3');
        Try
          DMRelatorio.RelListagemAptos.DisableControls;

          Model             := TModelEmpresa.Create;
          Try
            Model.idempresa   := TSession.IDEMPRESA;
            Model.SelectCabecalhoReport(msg);

            FrxRelatorio.Variables.Clear;
            FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
            FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
            FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
            FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
            FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
            FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
            FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
            FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
            FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
            FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
            FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);

            try
              // Decodifica a imagem Base64 e carrega no fluxo de memória
              TempImage   := TImage.Create(nil);
              TConesul.ConvBase64Img(model.logo);
              TempImage.Picture    :=TConesul.nfoto;
              TConesul.nfoto.Free;
              TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
            finally
              TempImage.Free;
            end;

            FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
            FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
            FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
            FrxRelatorio.Variables['filtro']          :=quotedstr('Todos Associado Aptos a Votação');

          Finally
            model.Free;
          End;

          FrxRelatorio.Report.PrepareReport();
          FrxRelatorio.ShowReport;
        Finally
          DMRelatorio.RelListagemAptos.First;
          DMRelatorio.RelListagemAptos.EnableControls;
        End;

        //JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
      end
      else
      begin
        JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
      end;
    end;
  Finally
    //ModelRel.Free;
  End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);


end;

procedure TFrmGerEleicao.btnListInaptosClick(Sender: TObject);
var
Model     :TModelEmpresa;
ModelRel  :TModelRelatorio;
msg:string;
TempImage: Timage;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Imprimir Listagem de Associados Inaptos') then
  begin
    //Listagem Associado inaptos a vota
  ModelRel        := TModelRelatorio.Create;

  Try
    if ModelRel.RelListagemAssociadoAptosInaptos('N') then
    begin
      if not DMRelatorio.RelListagemAptos.Eof then
      begin

        FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListAssociadoInapto.fr3');
        Try
          DMRelatorio.RelListagemAptos.DisableControls;

          Model             := TModelEmpresa.Create;
          Try
            Model.idempresa   := TSession.IDEMPRESA;
            Model.SelectCabecalhoReport(msg);

            FrxRelatorio.Variables.Clear;
            FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
            FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
            FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
            FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
            FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
            FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
            FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
            FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
            FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
            FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
            FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);

            try
              // Decodifica a imagem Base64 e carrega no fluxo de memória
              TempImage   := TImage.Create(nil);
              TConesul.ConvBase64Img(model.logo);
              TempImage.Picture    :=TConesul.nfoto;
              TConesul.nfoto.Free;
              TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
            finally
              TempImage.Free;
            end;

            FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
            FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
            FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
            FrxRelatorio.Variables['filtro']          :=quotedstr('Todos Associado Inapto a Votação');

          Finally
            model.Free;
          End;

          FrxRelatorio.Report.PrepareReport();
          FrxRelatorio.ShowReport;
        Finally
          DMRelatorio.RelListagemAptos.First;
          DMRelatorio.RelListagemAptos.EnableControls;
        End;

        //JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
      end
      else
      begin
        JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
      end;
    end;
  Finally
    //ModelRel.Free;
  End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmGerEleicao.Listagem1Click(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Imprimir Listagem') then
  begin

  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmGerEleicao.Localizar;
var
campanha : TModelcampanha;
msg:string;
begin
  Try
    campanha    := TModelCampanha.Create;

    campanha.Pesquisa(msg);

    if msg = 'Consulta realizada com sucesso' then
    begin
      ds.DataSet.Open;
      cxgrid.SetFocus;
    end;

  Finally
    campanha.Free;
  End;
end;

procedure TFrmGerEleicao.btnEditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Editar') then
  begin
    if not dm.TabConsCampanha.Eof then
    begin
      if ds.DataSet.FieldByName('id_campanha').AsInteger > 0 then
      begin
        if ds.DataSet.FieldByName('publicada').AsString='NÃO PUBLICADA' then
        begin
          Try
            FrmValidador            := TFrmValidador.create(Application);
            FrmValidador.Acao       := 'E'; //nova eleicao
            FrmValidador.idCampanha := ds.DataSet.FieldByName('id_campanha').AsInteger;
            FrmValidador.ShowModal;
          Finally
            RefreshTela;
          End;
        end
        //OpenCadTela(ds.DataSet.FieldByName('id_campanha').AsInteger,'E')
        else
        JKDialog('Aviso','Campanha já publicada!', tdAlerta);
      end
      else
      JKDialog('Aviso','Selecione um registro!', tdAlerta);

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

end;

procedure TFrmGerEleicao.btnExcluirClick(Sender: TObject);
var
campanha : TModelCampanha;
msg:string;
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Excluir') then
  begin
    if not dm.TabConsCampanha.Eof then
  begin
    if ds.DataSet.FieldByName('id_campanha').AsInteger > 0 then
    begin
      if JKDialog('Aviso', 'Deseja excluir a campanha selecionada?', tdMensagem)  then
      begin
        if (ds.DataSet.FieldByName('publicada').AsString = 'PUBLICADA') or (ds.DataSet.FieldByName('concluida').AsString='S') then
        begin
          JKDialog('Aviso','Campanha já publicada ou concluida!', tdAlerta);
          exit;
        end;

        Try
          campanha         := TModelcampanha.Create;
          campanha.idcampanha := ds.DataSet.FieldByName('id_campanha').AsInteger;
          campanha.Delete(msg);
        Finally
          ds.DataSet.Close;
          RefreshTela;
          //campanha.Free;
        End;
      end;
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

end;

procedure TFrmGerEleicao.btnNovoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try
    //Validar Acesso antes de abrir
    FrmValidador        := TFrmValidador.create(Application);
    FrmValidador.Acao   := 'N'; //nova eleicao
    FrmValidador.ShowModal;

  Finally
    RefreshTela;
  End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmGerEleicao.BtnPublicarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Publicar') then
  begin
    if not dm.TabConsCampanha.Eof then
    begin
      if ds.DataSet.FieldByName('id_campanha').AsInteger > 0 then
      begin
        //Validar se já está publicada
        if ds.DataSet.FieldByName('publicada').AsString='PUBLICADA' then
        begin
          JKDialog('Aviso','Campanha já publicada!', tdAlerta);
          exit;
        end;

        //publicar Eleição
        Try
          FrmValidador      := TFrmValidador.create(Application);
          FrmValidador.Acao := 'P';//publicar eleicao
          frmValidador.idCampanha := ds.DataSet.FieldByName('id_campanha').AsInteger;
          FrmValidador.ShowModal;
        Finally
          RefreshTela;
        End;
      end
      else
      JKDialog('Aviso','Selecione um registro!', tdAlerta);

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



end;

procedure TFrmGerEleicao.btnsincronizarClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Sincronizar API') then
  begin
    // verificar se esta habilitado para api

            if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
            begin
              try
                TConfiguracaoService.SincronizarGravar(12, 0);
              except on e:exception do
                begin
                  //msg   := 'Erro ao gravar registro para sincronizar:'+#13+e.Message;
                  raise;
                end;
              end;
            end;
      
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);


end;

procedure TFrmGerEleicao.Despublicar1Click(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Despublicar') then
  begin
    if not dm.TabConsCampanha.Eof then
  begin
    if ds.DataSet.FieldByName('id_campanha').AsInteger > 0 then
    begin
      //Validar se já está publicada
      if ds.DataSet.FieldByName('publicada').AsString='NÃO PUBLICADA' then
      begin
        JKDialog('Aviso','Campanha não está publicada!', tdAlerta);
        exit;
      end;

      //publicar Eleição
      try
        FrmValidador      := TFrmValidador.create(Application);
        FrmValidador.Acao := 'D';//despublicar eleicao
        frmValidador.idCampanha := ds.DataSet.FieldByName('id_campanha').AsInteger;
        FrmValidador.ShowModal;
      finally
        RefreshTela;
      end;
    end
    else
    JKDialog('Aviso','Selecione um registro!', tdAlerta);
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

end;

procedure TFrmGerEleicao.EncerrarCampanha1Click(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Encerrar Campanha') then
  begin
    //Encerrar campanha;
    if not dm.TabConsCampanha.Eof then
    begin
      if ds.DataSet.FieldByName('id_campanha').AsInteger > 0 then
      begin
        //Validar se já está publicada
        if ds.DataSet.FieldByName('publicada').AsString='NÃO PUBLICADA' then
        begin
          JKDialog('Aviso','Campanha não está publicada!', tdAlerta);
          exit;
        end;

        //Encerrar campanha Eleição
        try
          FrmValidador      := TFrmValidador.create(Application);
          FrmValidador.Acao := 'F';//Encerrar eleicao
          frmValidador.idCampanha := ds.DataSet.FieldByName('id_campanha').AsInteger;
          FrmValidador.ShowModal;
        finally
          RefreshTela;
        end;
      end
      else
      JKDialog('Aviso','Selecione um registro!', tdAlerta);
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


end;

procedure TFrmGerEleicao.Env1Click(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

  if Permissao.TemPermissao('Permitir Enviar Link') then
  begin
    //Enviar Linck com a mensagem.
    if not dm.TabConsCampanha.Eof then
    begin
      Try
        //ajustar para a tela que foi refatorada 22/02/2026
//        FrmEnviarWhatsAppMassa                      := TFrmEnviarWhatsAppMassa.Create(Application);
//        FrmEnviarWhatsAppMassa.lblTitulo.Caption    := 'Envio de Link Campanha';
//        FrmEnviarWhatsAppMassa.edtUrl.EditValue     := TConesul.LerValorIni(GetCurrentDir + '\Config.ini','PEDIDO','URLAPP','');
//        FrmEnviarWhatsAppMassa.btnVariavel.Visible  := True;
//        FrmEnviarWhatsAppMassa.idcampanha           := ds.DataSet.FieldByName('id_campanha').AsInteger;
//        FrmEnviarWhatsAppMassa.ShowModal;
      Finally

      End;
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


end;

procedure TFrmGerEleicao.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmGerEleicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmGerEleicao := nil;
end;

procedure TFrmGerEleicao.Image1Click(Sender: TObject);
begin
  PopUp.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

end.
