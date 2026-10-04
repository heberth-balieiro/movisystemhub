/////////////////////////////////////////////////////////////////////////////
{
    Unit Vcl.Loading
    Criação: 99 Coders | Heber Stein Mazutti
    Site: https://www.youtube.com/@99coders
    Versão: 1.1
}
/////////////////////////////////////////////////////////////////////////////

unit Vcl.Loading;

interface

uses System.SysUtils, System.UITypes, Vcl.Forms, Vcl.Graphics, Vcl.WinXCtrls,
  Vcl.StdCtrls, System.Classes, Vcl.Dialogs;

type
  TMyThreadMethod = procedure(Sender: TObject) of object;

  TLoading = class
    private
        class var Fundo: TForm;
        class var Loading: TForm;
        class var Indicator: TActivityIndicator;
        class var mensagem:tLabel;
    public
      class procedure UpdateMessage(const msg:string);
      class procedure ShowNovo(const Frm : Tform; const msg : string);
      class procedure Show(Frm: TForm = nil;const msg: string ='');
      class procedure Hide;
      class procedure ExecuteThread(proc: TProc;
                                    procTerminate: TMyThreadMethod);
    end;

implementation

uses
  Vcl.Controls;


{ TLoading }

class procedure TLoading.ShowNovo(const Frm: TForm; const msg: string);
var
  Mensagem: TLabel;
begin
  // Form de fundo opaco...
  if not Assigned(Fundo) then
    Fundo := TForm.Create(nil);

  Fundo.AlphaBlend := True;
  Fundo.AlphaBlendValue := 60;
  Fundo.Color := clBlack;
  Fundo.BorderStyle := bsNone;
  Fundo.FormStyle := fsStayOnTop;

  if Frm = nil then
    Fundo.WindowState := wsMaximized
  else
  begin
    Fundo.Position := poDesigned;
    Fundo.Width := Frm.Width;
    Fundo.Height := Frm.Height;
    Fundo.Left := Frm.Left;
    Fundo.Top := Frm.Top;
  end;

  // Form transparente com o loading...
  if not Assigned(Loading) then
    Loading := TForm.Create(nil);

  Loading.TransparentColor := True;
  Loading.Color := $00737373;
  Loading.TransparentColorValue := $00737373;
  Loading.Position := poDesigned;
  Loading.BorderStyle := bsNone;
  Loading.FormStyle := fsStayOnTop;

  if Frm = nil then
  begin
    Loading.Width := Screen.Width;
    Loading.Height := Screen.Height;
    Loading.Left := 0;
    Loading.Top := 0;
  end
  else
  begin
    Loading.Width := Frm.Width - 16;
    Loading.Height := Frm.Height - 8;
    Loading.Left := Frm.Left + 8;
    Loading.Top := Frm.Top;
  end;

  // Cria a animação...
  if not Assigned(Indicator) then
    Indicator := TActivityIndicator.Create(Loading);

  Indicator.Parent := Loading;
  Indicator.IndicatorSize := aisLarge;
  Indicator.IndicatorType := aitRotatingSector;
  Indicator.FrameDelay := 100;

  if Frm = nil then
  begin
    Indicator.Left := (Screen.Width div 2) - (Indicator.Width div 2);
    Indicator.Top := (Screen.Height div 2) - (Indicator.Height div 2);
  end
  else
  begin
    Indicator.Left := (Frm.Width div 2) - (Indicator.Width div 2);
    Indicator.Top := (Frm.Height div 2) - (Indicator.Height div 2);
  end;

  Indicator.Animate := True;

  // Exibe o loading sobre o formulário principal...
  if Frm <> nil then
  begin
    Fundo.Parent := Frm.Parent; // Definindo o mesmo Parent do formulário principal
    Loading.Parent := Frm.Parent;
  end;

  // Label do texto...
  Mensagem              := TLabel.Create(Loading);
  Mensagem.Parent       := Loading; // Corrigido para o loading
  Mensagem.Left := (Loading.Width div 2) - (Mensagem.Width div 2); // Centraliza horizontalmente
  Mensagem.Top := (Loading.Height div 2) - (Mensagem.Height div 2); // Centraliza verticalmente
  Mensagem.Margins.Top  := 10;
  Mensagem.Font.Size    := 13;
  Mensagem.Height       := 70;
  Mensagem.Width        := Loading.Width - 100;
  Mensagem.Font.Color   := clWhite; // Cor do texto
  Mensagem.Alignment    := taCenter; // Alinhamento centralizado
  Mensagem.Caption      := msg;

  // Exibe o loading...
  Fundo.Show;
  Fundo.BringToFront;
  Loading.Show;
  Loading.BringToFront;
end;

class procedure TLoading.UpdateMessage(const msg:string);
begin
  if Assigned(Mensagem) then
    Mensagem.Caption := msg;
end;

class procedure TLoading.Hide;
begin
    if Assigned(Indicator) then
        FreeAndNil(Indicator);

    if Assigned(Loading) then
        FreeAndNil(Loading);

    if Assigned(Fundo) then
        FreeAndNil(Fundo);
end;

class procedure TLoading.Show(Frm: TForm = nil; const msg: string ='');
var
  MessageLabel: TLabel;
begin
    // Form de fundo opaco...
    if NOT Assigned(Fundo) then
        Fundo := TForm.Create(nil);

    Fundo.AlphaBlend        := true;
    Fundo.AlphaBlendValue   := 60;
    Fundo.Color             := clBlack;
    Fundo.BorderStyle       := bsNone;
    Fundo.FormStyle         := fsStayOnTop;

    if Frm = nil then
        Fundo.WindowState := wsMaximized
    else
    begin
        Fundo.Position  := poDesigned;
        Fundo.Width     := Frm.Width;
        Fundo.Height    := Frm.Height;
        Fundo.Left      := Frm.Left;
        Fundo.Top       := Frm.Top;
    end;


    // Form transparente com o loading...
    if NOT Assigned(Loading) then
        Loading := TForm.Create(nil);

    Loading.TransparentColor        := true;
    Loading.Color                   := $00737373;
    Loading.TransparentColorValue   := $00737373;
    Loading.Position                := poDesigned;
    Loading.BorderStyle             := bsNone;
    Loading.FormStyle               := fsStayOnTop;

    if Frm = nil then
    begin
        Loading.Width       := Screen.Width;
        Loading.Height      := Screen.Height;
        Loading.Left        := 0;
        Loading.Top         := 0;
    end
    else
    begin
        Loading.Width       := Frm.Width - 16;
        Loading.Height      := Frm.Height - 8;
        Loading.Left        := Frm.Left + 8;
        Loading.Top         := Frm.Top;
    end;



    // Cria a animacao...
    if NOT Assigned(Indicator) then
        Indicator := TActivityIndicator.Create(Loading);

    Indicator.Parent        := Loading;
    Indicator.IndicatorSize := aisLarge;
    Indicator.IndicatorType := aitRotatingSector;
    Indicator.FrameDelay    := 100;

    if Frm = nil then
    begin
        Indicator.Left := Trunc(Screen.Width / 2) - Trunc(Indicator.Width / 2);
        Indicator.Top := Trunc(Screen.Height / 2) - Trunc(Indicator.Height / 2);
    end
    else
    begin
        Indicator.Left := Trunc(Frm.Width / 2) - Trunc(Indicator.Width / 2);
        Indicator.Top := Trunc(Frm.Height / 2) - Trunc(Indicator.Height / 2);
    end;

    Indicator.Animate := true;

    if Assigned(Loading) then
    begin
        MessageLabel            := TLabel.Create(Loading);
        MessageLabel.Parent     := Loading;
        MessageLabel.Caption    := Msg; // Define o texto da mensagem
        MessageLabel.Font.Color := clBlack; // Cor do texto
        MessageLabel.Font.Size  := 18;
        MessageLabel.Align      := alClient; // Alinha na parte inferior
        MessageLabel.Height     := 30; // Define a altura do Label
        MessageLabel.Transparent:= true; // Torna o fundo do Label transparente
        MessageLabel.Layout     := tlCenter; // Centraliza o texto
        MessageLabel.Alignment  := taCenter;
        MessageLabel.AlignWithMargins := True;
        MessageLabel.Margins.Top := 100;
    end;

    // Exibe o loading sobre o formulário principal...
    if Frm <> nil then
    begin
        Fundo.Parent    := Frm.Parent; // Definindo o mesmo Parent do formulário principal
        Loading.Parent  := Frm.Parent;
    end;

    // Exibe o loading...
    Fundo.Show;
    Fundo.BringToFront;
    Loading.Show;
    Loading.BringToFront;
end;

class procedure TLoading.ExecuteThread(proc: TProc;
                                       procTerminate: TMyThreadMethod);
var
    t: TThread;
begin
    t := TThread.CreateAnonymousThread(proc);

    if Assigned(procTerminate) then
        t.OnTerminate := procTerminate;

    t.Start;
end;


end.

