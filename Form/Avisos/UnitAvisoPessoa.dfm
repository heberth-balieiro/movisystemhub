object FrmAvisoPessoa: TFrmAvisoPessoa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Aviso'
  ClientHeight = 161
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object edtAviso: TcxMemo
    Left = 0
    Top = 0
    Align = alClient
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    Style.BorderStyle = ebsNone
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    ExplicitWidth = 592
    ExplicitHeight = 173
    Height = 161
    Width = 584
  end
end
