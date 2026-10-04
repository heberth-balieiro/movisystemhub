inherited FrmProdutoSaida: TFrmProdutoSaida
  Caption = 'Sa'#237'da de produto'
  ClientHeight = 481
  ClientWidth = 850
  ExplicitWidth = 850
  ExplicitHeight = 481
  TextHeight = 17
  inherited Label27: TLabel
    Visible = False
  end
  object Label7: TLabel [1]
    Left = 8
    Top = 433
    Width = 135
    Height = 17
    Caption = 'F2 - Pesquisa produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel [2]
    Left = 8
    Top = 456
    Width = 122
    Height = 17
    Caption = 'F4 - Excluir produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel2: TPanel
    Left = 731
    Top = 433
    ExplicitLeft = 731
    ExplicitTop = 433
  end
  inherited Panel1: TPanel
    Left = 609
    Top = 433
    ExplicitLeft = 609
    ExplicitTop = 433
    inherited btnSalvar: TSpeedButton
      ExplicitLeft = 40
      ExplicitTop = 16
    end
  end
  inherited Paneltitulo: TPanel
    Width = 850
    inherited lblTitulo: TLabel
      Width = 835
      Caption = 'Retirada de produtos'
      ExplicitLeft = 15
      ExplicitTop = -3
      ExplicitWidth = 835
      ExplicitHeight = 50
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 850
    ExplicitHeight = 377
    Height = 377
    Width = 850
    inherited Label4: TLabel
      Width = 57
      Caption = 'Descri'#231#227'o'
      ExplicitWidth = 57
    end
    object Label2: TLabel [2]
      Left = 431
      Top = 6
      Width = 49
      Height = 17
      Caption = 'Unidade'
    end
    object Label3: TLabel [3]
      Left = 503
      Top = 6
      Width = 65
      Height = 17
      Caption = 'Qtde. Atual'
    end
    object Label5: TLabel [4]
      Left = 589
      Top = 6
      Width = 61
      Height = 17
      Caption = 'Prc. Venda'
    end
    object Label6: TLabel [5]
      Left = 675
      Top = 6
      Width = 67
      Height = 17
      Caption = 'Qtde. Nova'
    end
    inherited edtcodigo: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited edtDescricao: TcxTextEdit
      ExplicitWidth = 331
      ExplicitHeight = 25
      Width = 331
    end
    inherited edtativo: TcxCheckBox
      Visible = False
      ExplicitWidth = 47
    end
    object cxTextEdit1: TcxTextEdit
      Left = 431
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      TabOrder = 3
      Width = 66
    end
    object edtqtdemt: TcxCurrencyEdit
      Left = 503
      Top = 24
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.ReadOnly = True
      TabOrder = 4
      Width = 80
    end
    object cxCurrencyEdit1: TcxCurrencyEdit
      Left = 589
      Top = 24
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.ReadOnly = True
      TabOrder = 5
      Width = 80
    end
    object cxCurrencyEdit2: TcxCurrencyEdit
      Left = 675
      Top = 24
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.ReadOnly = True
      TabOrder = 6
      Width = 80
    end
    object btnIncluir: TcxButton
      Left = 761
      Top = 24
      Width = 80
      Height = 25
      Cursor = crHandPoint
      Caption = 'Incluir'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C0000001B744558745469746C65004164643B506C75733B426172
        733B526962626F6E3B9506332F0000004749444154785EE592C90900200C046D
        D0A6ACCAEE4604E32B8AB8011F3E0602590672244062DBCCA532E8F5D7024017
        AC98C11B4205C6D10896F50486B744235CA09FF1FD274A34995FABF9E946D7E8
        0000000049454E44AE426082}
      TabOrder = 7
    end
    object cxGrid: TcxGrid
      AlignWithMargins = True
      Left = 5
      Top = 55
      Width = 840
      Height = 317
      Align = alBottom
      TabOrder = 8
      object cxGridDB: TcxGridDBTableView
        PopupMenu = Pop
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = coll1
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = 'Nenhum registro encontrado'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = FrmPrincipal.CxGridPedido
        object coll1: TcxGridDBColumn
          Width = 50
          IsCaptionAssigned = True
        end
        object coll2: TcxGridDBColumn
          Width = 274
          IsCaptionAssigned = True
        end
        object coll3: TcxGridDBColumn
          Width = 238
          IsCaptionAssigned = True
        end
        object coll5: TcxGridDBColumn
          Width = 54
          IsCaptionAssigned = True
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDB
      end
    end
  end
  object Pop: TPopupMenu
    Left = 184
    Top = 402
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      ShortCut = 115
    end
    object LimparLista1: TMenuItem
      Caption = 'Limpar Lista'
    end
  end
end
