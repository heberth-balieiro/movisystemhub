/////////////////////////////////////////////////////////////////////////////
{
    Unit Vcl.Navigation
    Criação: 99 Coders | Heber Stein Mazutti
    Site: https://www.youtube.com/@99coders
    Versão: 1.0
}
/////////////////////////////////////////////////////////////////////////////



unit Vcl.Navigation;

interface

uses System.SysUtils, System.UITypes, Vcl.Forms, Vcl.Graphics, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections, System.Classes, System.Rtti;

type
  TNavigation = class
    private

        class var FrmOpen         : TForm;
        class var FrmModalOpen    : TForm;
        class var FrmModalOpen2   : TForm;
        class var FrmModalFundo   : TForm;
        class var FrmModalFundo2  : TForm;

        class var FrmModalOpenImpressao :TForm;
        class var FrmModalFundoImpressao:TForm;


    public
        class var ParamOrdemInt   :integer;
        class var ParamInt        :integer;
        class var ParamCod        :integer;
        class var ParamsStr       :string;
        class var ParamsIDPedido  :integer;
        class var ParamsKey       :String;
        class var PatamsStrClose  :String;
        class var ParamsStrCompraOP : String;
        class var ParamsStrList   :TList<Integer>;


        class var ExecuteOnClose: procedure of Object;

        class procedure Open(FrmClass: TFormClass;
                             Frm: TForm;
                             Parent: TPanel = nil);


        class procedure OpenModal(FrmClass: TFormClass;
                                  Frm: TForm;
                                  Parent: TForm = nil
                                  );

        class procedure OpenModalCamada(FrmClass: TFormClass;
                                        Frm: TForm;
                                        Parent: TForm = nil);

        class procedure OpenModalImpressao(FrmClass: TFormClass;
                                        Frm: TForm;
                                        Parent: TForm = nil);

        class procedure CloseImpressao(Frm: TForm);
        class procedure CloseCamada(Frm: TForm);
        class procedure Close(Frm: TForm);

        class procedure CloseAndCancel(Frm: TForm);


    end;


implementation

class procedure TNavigation.Open(FrmClass: TFormClass;
              Frm: TForm;
              Parent: TPanel);
begin
    // Fecha o form caso tenha algo algum aberto...
    if Assigned(FrmOpen) then
    begin
        FrmOpen.Free;
        FrmOpen := nil
    end;

    if (FrmClass = nil) then
        exit;

    if NOT Assigned(Frm) then
        Application.CreateForm(FrmClass, Frm);

    if Parent <> nil then
    begin
        if Parent.ClassType = TPanel then
        begin
            Frm.Parent := TPanel(Parent);
            TPanel(Parent).Margins.Bottom := 1;
            TPanel(Parent).Margins.Bottom := 0;
        end
        else if Parent.ClassType = TForm then
            Frm.Parent := TForm(Parent);
    end;

    FrmOpen := Frm; // Salva qual é o form aberto
    Frm.Show;
end;

class procedure TNavigation.OpenModal(FrmClass: TFormClass;
                                      Frm: TForm;
                                      Parent: TForm = nil
                                      );

begin
    // Fundo opaco...
    if NOT Assigned(FrmModalFundo) then
        FrmModalFundo := TForm.Create(Frm);

    FrmModalFundo.AlphaBlend      := true;
    FrmModalFundo.AlphaBlendValue := 160;
    FrmModalFundo.Color           := clBlack;

    //Alterado dia 15/05/2025

    if Parent = nil then
    begin
      FrmModalFundo.WindowState := wsNormal;
      FrmModalFundo.Position    := poDesigned;
      FrmModalFundo.BorderStyle := bsNone;

      FrmModalFundo.SetBounds(
        Application.MainForm.Left,
        Application.MainForm.Top,
        Application.MainForm.Width,
        Application.MainForm.Height
      );
    end;
    if NOT Assigned(Frm) then
        Frm := FrmClass.Create(Frm);

    FrmModalFundo.Show;
    FrmModalOpen := Frm;
    Frm.ShowModal;

    {if Parent = nil then
        FrmModalFundo.WindowState := wsMaximized//verficar para não pega tela toda
    else
    begin
        FrmModalFundo.WindowState := wsNormal;
        FrmModalFundo.Position    := poDesigned;
        FrmModalFundo.Width       := Parent.Width;
        FrmModalFundo.Height      := Parent.Height;
        FrmModalFundo.Left        := Parent.Left;
        FrmModalFundo.Top         := Parent.Top;
    end;

    FrmModalFundo.BorderStyle     := bsNone;

    if NOT Assigned(Frm) then
        Frm := FrmClass.Create(Frm);

    FrmModalFundo.Show;

    FrmModalOpen := Frm; // Salva qual é o form modal aberto...

    Frm.ShowModal;}
end;

class procedure TNavigation.Close(Frm: TForm);
begin
    // Verifica se está fechando um modal...
    if Frm.Name = FrmModalOpen.Name then
    begin
        FrmModalFundo.Free;
        FrmModalFundo := nil;
    end;

    if Assigned(ExecuteOnClose) then
    begin
        ExecuteOnClose();
        ExecuteOnClose := nil;
    end;

    Frm.Close;
end;


class procedure TNavigation.CloseAndCancel(Frm: TForm);
begin
    // Verifica se está fechando um modal...
    if Frm.Name = FrmModalOpen.Name then
    begin
        FrmModalFundo.Free;
        FrmModalFundo := nil;
    end;

    Frm.Close;
end;




{$REGION 'Modal 3'}

class procedure TNavigation.OpenModalCamada(FrmClass: TFormClass;
                                      Frm: TForm;
                                      Parent: TForm = nil
                                      );

begin
    // Fundo opaco...
    if NOT Assigned(FrmModalFundo2) then
        FrmModalFundo2 := TForm.Create(Frm);

    FrmModalFundo2.AlphaBlend      := true;
    FrmModalFundo2.AlphaBlendValue := 160;
    FrmModalFundo2.Color           := clBlack;

    if Parent = nil then
        FrmModalFundo2.WindowState := wsMaximized
    else
    begin
        FrmModalFundo2.WindowState := wsNormal;
        FrmModalFundo2.Position    := poDesigned;
        FrmModalFundo2.Width       := Parent.Width;
        FrmModalFundo2.Height      := Parent.Height;
        FrmModalFundo2.Left        := Parent.Left;
        FrmModalFundo2.Top         := Parent.Top;
    end;

    FrmModalFundo2.BorderStyle     := bsNone;

    if NOT Assigned(Frm) then
        Frm := FrmClass.Create(Frm);

    FrmModalFundo2.Show;

    FrmModalOpen2 := Frm; // Salva qual é o form modal aberto...

    Frm.ShowModal;
end;


class procedure TNavigation.CloseCamada(Frm: TForm);
begin
    // Verifica se está fechando um modal...
    if Frm.Name = FrmModalOpen2.Name then
    begin
        FrmModalFundo2.Free;
        FrmModalFundo2 := nil;
    end;

    if Assigned(ExecuteOnClose) then
    begin
        ExecuteOnClose();
        ExecuteOnClose := nil;
    end;

    Frm.Close;
end;


{$ENDREGION}


{$REGION 'Modal Impressao'}

class procedure TNavigation.OpenModalImpressao(FrmClass: TFormClass;
                                      Frm: TForm;
                                      Parent: TForm = nil
                                      );

begin
    // Fundo opaco...
    if NOT Assigned(FrmModalFundoImpressao) then
        FrmModalFundoImpressao := TForm.Create(Frm);

    FrmModalFundoImpressao.AlphaBlend      := true;
    FrmModalFundoImpressao.AlphaBlendValue := 160;
    FrmModalFundoImpressao.Color           := clBlack;

    if Parent = nil then
        FrmModalFundoImpressao.WindowState := wsMaximized
    else
    begin
        FrmModalFundoImpressao.WindowState := wsNormal;
        FrmModalFundoImpressao.Position    := poDesigned;
        FrmModalFundoImpressao.Width       := Parent.Width;
        FrmModalFundoImpressao.Height      := Parent.Height;
        FrmModalFundoImpressao.Left        := Parent.Left;
        FrmModalFundoImpressao.Top         := Parent.Top;
    end;

    FrmModalFundoImpressao.BorderStyle     := bsNone;

    if NOT Assigned(Frm) then
        Frm := FrmClass.Create(Frm);

    FrmModalFundoImpressao.Show;

    FrmModalOpenImpressao := Frm; // Salva qual é o form modal aberto...

    Frm.ShowModal;
end;


class procedure TNavigation.CloseImpressao(Frm: TForm);
begin
    // Verifica se está fechando um modal...
    if Frm.Name = FrmModalOpenImpressao.Name then
    begin
        FrmModalFundoImpressao.Free;
        FrmModalFundoImpressao := nil;
    end;

    if Assigned(ExecuteOnClose) then
    begin
        ExecuteOnClose();
        ExecuteOnClose := nil;
    end;

    Frm.Close;
end;


{$ENDREGION}



end.
