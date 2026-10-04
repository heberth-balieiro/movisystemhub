unit UFormNovoBaseDiversos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBase, Data.DB, DBAccess, Uni,
  ACBrBase, ACBrEnterTab, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, cxStyles,
  cxGridTableView, cxClasses;

type
  TFormNovoBaseDiversos = class(TFormNovoBase)
  private
    { Private declarations }
  public
    class var ParamsTela  :String;
    { Public declarations }
  end;

var
  FormNovoBaseDiversos: TFormNovoBaseDiversos;

implementation

{$R *.dfm}

end.
