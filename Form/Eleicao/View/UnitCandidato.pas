unit UnitCandidato;

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
  cxMaskEdit, Vcl.Menus, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ComCtrls,
  UFormNovoBasePesquisa, cxContainer, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, Vcl.StyledButton, cxDropDownEdit, dxGDIPlusClasses, cxTextEdit,
  cxGroupBox;

type
  TFrmCandidato = class(TFormNovoBasePesquisa)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TabCandidatoChange(Sender: TObject);
  private
    procedure OpenCad(id: integer;Str:String);
    procedure RefreshDados;
    Procedure Localizar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCandidato: TFrmCandidato;

implementation

{$R *.dfm}

uses Model.Candidato, UDM, UnitCandidatoCad, uJKDialog,
  Vcl.PermissaoUsuario, Vcl.Session;

{$REGION 'Filtragem'}

procedure TFrmCandidato.btnBuscaClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Candidato');

  if Permissao.TemPermissao('Permitir Pesquisa') then
  begin
     RefreshDados;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmCandidato.RefreshDados;
begin
  Localizar;
end;

procedure TFrmCandidato.SpeedButton2Click(Sender: TObject);
begin
   if not dm.TabConsCandidatos.Eof then
  begin
    if ds.DataSet.FieldByName('id_candidato').AsInteger > 0 then
    begin
      OpenCad(ds.DataSet.FieldByName('id_candidato').AsInteger,'E');
    end
    else
    JKDialog('Aviso','Selecione um registro!', tdAlerta);
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmCandidato.TabCandidatoChange(Sender: TObject);
begin
  RefreshDados;
end;

procedure TfrmCandidato.Localizar;
var
Model : TModelCandidato;
msg:string;
begin
  Try
    Model    := TModelCandidato.Create;
    ds.DataSet.Close;
    Model.PopularDataSetFiltragem(msg,Trim(edtBusca.Text),Tabcandidato.TabIndex);

    if msg = 'Consulta realizada com sucesso' then
    begin
      ds.DataSet.Open;
      cxgrid.SetFocus;
    end;

  Finally
    Model.Free;
  End;
end;

{$ENDREGION}


procedure TFrmCandidato.OpenCad(id: integer;Str:String);
begin
  TNavigation.ExecuteOnClose    := RefreshDados;
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := Str;
  TNavigation.OpenModal(TFrmCandidatoCad, FrmCandidatoCad);
end;

procedure TFrmCandidato.btnExcluirClick(Sender: TObject);
var
Candidato : TModelCandidato;
msg:string;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Candidato');

  if Permissao.TemPermissao('Permitir Excluir') then
  begin
    Candidato           := TModelCandidato.Create;
    Try
      if not dm.TabConsCandidatos.Eof then
      begin
        if ds.DataSet.FieldByName('id_candidato').AsInteger > 0 then
        begin
          Candidato.idCandidato   := ds.DataSet.FieldByName('id_candidato').AsInteger;
          if Candidato.Delete(msg) then
          JKDialog('Sucesso',msg, tdSucesso)
          else
          JKDialog('Aviso',msg, tdAlerta);
        end
        else
        JKDialog('Aviso','Selecione um registro!', tdAlerta);
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
      end;
    Finally
      Candidato.Free;
      RefreshDados;
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);



end;

procedure TFrmCandidato.btnNovoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Candidato');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    OpenCad(0,'N');
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmCandidato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action        := TCloseAction.caFree;
    FrmCandidato  := nil;
end;

end.
