object FrmBaseCadCons: TFrmBaseCadCons
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 784
  ClientWidth = 1043
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 17
  object cxGroupBox1: TcxGroupBox
    Left = 405
    Top = 340
    PanelStyle.Active = True
    TabOrder = 0
    Height = 341
    Width = 630
    object Label1: TLabel
      Left = 5
      Top = 6
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object Label4: TLabel
      Left = 91
      Top = 6
      Width = 66
      Height = 17
      Caption = 'Descri'#231#227'o *'
    end
    object edtcodigo: TcxTextEdit
      Left = 5
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.OnChange = edtDescricaoPropertiesChange
      TabOrder = 0
      Width = 80
    end
    object edtDescricao: TcxTextEdit
      Left = 91
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.OnChange = edtDescricaoPropertiesChange
      TabOrder = 1
      Width = 534
    end
    object edtativo: TcxCheckBox
      Left = 5
      Top = 55
      Caption = 'Ativo'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      TabOrder = 2
      Transparent = True
    end
    object cxGrid: TcxGrid
      AlignWithMargins = True
      Left = 7
      Top = 77
      Width = 616
      Height = 257
      Align = alBottom
      TabOrder = 3
      ExplicitLeft = 47
      ExplicitTop = 221
      ExplicitWidth = 1029
      object cxGridDB: TcxGridDBTableView
        PopupMenu = PopMenu
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
  object PopMenu: TPopupMenu
    Left = 328
    Top = 634
    object btnListagem: TMenuItem
      Caption = 'Listagem'
      ShortCut = 120
      OnClick = btnListagemClick
    end
  end
  object ds: TUniDataSource
    Left = 368
    Top = 634
  end
end
