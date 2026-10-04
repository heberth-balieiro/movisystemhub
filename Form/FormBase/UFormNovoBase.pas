{

Cores antes  $009C6D4E

Nova cor titulo    = $00503E2C
Nova cor rodape    = $00C7C3BD

Cor botão

 cadastro

 $008D611F
 $00F1F0EC

}

unit UFormNovoBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  ACBrBase, ACBrEnterTab, Data.DB, DBAccess, Uni, cxStyles, cxGridTableView,
  cxClasses;

type
  TFormNovoBase = class(TForm)
    Paneltitulo: TPanel;
    lblTitulo: TLabel;
    PanelButton: TPanel;
    PanelClient: TPanel;
    BtnFechar: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    Ds: TUniDataSource;
    cxStyle: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxGridHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxColunaPedido: TcxStyle;
    GridCancelado: TcxStyle;
    GridSolicitacao: TcxStyle;
    GridPago: TcxStyle;
    GridInativo: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    GridVencido: TcxStyle;
    GridVencDia: TcxStyle;
    CxGridPedido: TcxGridTableViewStyleSheet;
    GridTableDependente: TcxGridTableViewStyleSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnFecharClick(Sender: TObject);
    procedure lblTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FTitle: string;
    { Private declarations }
    procedure SetTitle(const Value: string);
  public
    { Public declarations }
    property TitleText: string read FTitle write SetTitle;
  end;

var
  FormNovoBase: TFormNovoBase;

implementation

{$R *.dfm}

procedure TFormNovoBase.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormNovoBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action        := TCloseAction.caFree;
end;

procedure TFormNovoBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
    Close;
    key:=0;
  end;
end;

procedure TFormNovoBase.lblTituloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Self.Handle, WM_NCLBUTTONDOWN, HTCAPTION, 0);
end;

procedure TFormNovoBase.SetTitle(const Value: string);
begin
  FTitle            := Value;
  lblTitulo.Caption := Value;
end;

end.
