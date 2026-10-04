unit LoadingConeSul;

interface

uses
  System.SysUtils, FMX.Types, FMX.Controls, FMX.Objects, FMX.Layouts, FMX.Forms, FMX.Graphics, FMX.Ani, FMX.VirtualKeyboard, FMX.Platform;

type
  TLoadingConeSul = class
  private
    class var Layout: TLayout;
    class var Fundo: TRectangle;
    class var Arco: TArc;
    class var Mensagem: TLabel;
    class var Animacao: TFloatAnimation;
  public
    class procedure Show(const Frm: TForm; const msg: string);
    class procedure Hide;
    class procedure UpdateMessage(const msg: string);
  end;

implementation

{ TLoadingConeSul }

class procedure TLoadingConeSul.Hide;
begin
  if Assigned(Layout) then
  begin
    Mensagem.DisposeOf;
    Animacao.DisposeOf;
    Arco.DisposeOf;
    Fundo.DisposeOf;
    Layout.DisposeOf;
  end;
  Mensagem := nil; Animacao := nil; Arco := nil; Layout := nil; Fundo := nil;
end;

class procedure TLoadingConeSul.Show(const Frm: TForm; const msg: string);
var
  FService: IFMXVirtualKeyboardService;
begin
  // Fundo opaco
  Fundo := TRectangle.Create(Frm);
  Fundo.Parent := Frm;
  Fundo.Fill.Color := TAlphaColorRec.Black;
  Fundo.Opacity := 0;
  Fundo.Align := TAlignLayout.Contents;
  Fundo.AnimateFloat('Opacity', 0.7);

  // Layout com texto e arco
  Layout := TLayout.Create(Frm);
  Layout.Parent := Frm;
  Layout.Width := 250; Layout.Height := 78;
  Layout.Align := TAlignLayout.Center;

  // Arco da animação
  Arco := TArc.Create(Frm);
  Arco.Parent := Layout;
  Arco.Width := 25; Arco.Height := 25; Arco.EndAngle := 280;
  Arco.Stroke.Color := $FFFEFFFF; Arco.Stroke.Thickness := 2;

  // Animação
  Animacao := TFloatAnimation.Create(Frm);
  Animacao.Parent := Arco;
  Animacao.StartValue := 0; Animacao.StopValue := 360;
  Animacao.Duration := 0.8; Animacao.Loop := True;
  Animacao.PropertyName := 'RotationAngle';
  Animacao.Start;

  // Label do texto
  Mensagem := TLabel.Create(Frm);
  Mensagem.Parent := Layout;
  Mensagem.Align := TAlignLayout.Center;
  Mensagem.Font.Size := 13;
  Mensagem.FontColor := $FFFEFFFF;
  Mensagem.Text := msg;

  // Exibir Layout
  Layout.AnimateFloat('Opacity', 1);

  // Esconde o teclado virtual
  if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService)) then
    FService.HideVirtualKeyboard;
end;

class procedure TLoadingConeSul.UpdateMessage(const msg: string);
begin
  if Assigned(Mensagem) then
    Mensagem.Text := msg;
end;

end.

