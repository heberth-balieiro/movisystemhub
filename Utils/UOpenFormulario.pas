unit UOpenFormulario;

interface

uses System.SysUtils, System.UITypes, Vcl.Forms, Vcl.Graphics, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections, System.Classes, System.Rtti;

type
  TNavForm = class
    private
      class var FrmOpenPes      : TForm;
    public
      class procedure Open(FrmClass: TFormClass;
                             Frm: TForm
                            );
  end;
implementation

{ TNavForm }

class procedure TNavForm.Open(FrmClass: TFormClass; Frm: TForm);
begin
  // Fecha o form caso tenha algo algum aberto...
    if Assigned(FrmOpenPes) then
    begin
        FrmOpenPes.Free;
        FrmOpenPes := nil
    end;

    if (FrmClass = nil) then
        exit;

    if NOT Assigned(Frm) then
        Application.CreateForm(FrmClass, Frm);

    FrmOpenPes  := Frm; // Salva qual é o form aberto
    Frm.Show;
end;

end.
