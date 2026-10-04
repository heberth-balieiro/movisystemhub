object FrmAnexoPadrao: TFrmAnexoPadrao
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FrmAnexoPadrao'
  ClientHeight = 500
  ClientWidth = 760
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 17
  object P_Cancelar: TPanel
    AlignWithMargins = True
    Left = 641
    Top = 449
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 14869218
    ParentBackground = False
    TabOrder = 0
    object btnCancelar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585461
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
      ExplicitLeft = 80
      ExplicitTop = 16
    end
  end
  object P_salvar: TPanel
    AlignWithMargins = True
    Left = 513
    Top = 449
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 16475988
    ParentBackground = False
    TabOrder = 1
    object btnVisualizar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Visualizar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnVisualizarClick
      ExplicitLeft = 6
    end
  end
  object Paneltitulo: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 16744448
    ParentBackground = False
    TabOrder = 2
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 0
      Width = 745
      Height = 50
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Caption = 'XXXXXXXXXXXX'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 0
      ExplicitWidth = 697
      ExplicitHeight = 35
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 50
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 3
    Height = 393
    Width = 760
    object cxGroupBox2: TcxGroupBox
      Left = 4
      Top = 4
      Align = alTop
      Caption = 'Anexo'
      Style.TextStyle = [fsBold]
      TabOrder = 0
      Height = 79
      Width = 752
      object Label1: TLabel
        Left = 314
        Top = 22
        Width = 57
        Height = 17
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 8
        Top = 22
        Width = 51
        Height = 17
        Caption = 'Localizar'
      end
      object edtDescricao: TcxTextEdit
        Left = 314
        Top = 41
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = False
        TabOrder = 1
        Width = 263
      end
      object btnIncluir: TcxButton
        Left = 583
        Top = 41
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
        TabOrder = 2
        OnClick = btnIncluirClick
      end
      object btnexcluir: TcxButton
        Left = 669
        Top = 41
        Width = 80
        Height = 25
        Cursor = crHandPoint
        Caption = 'Excluir'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000029744558745469746C650052656D6F76653B44656C6574
          653B426172733B526962626F6E3B5374616E646172643B635648300000002B49
          444154785EEDD03111000008C340C4E104D3B8091EE8C2711DB2FE9000A4CE00
          06BA924D32F066A281015E5FEF3B94FC8DC40000000049454E44AE426082}
        TabOrder = 3
        OnClick = btnexcluirClick
      end
      object EdtCaminho: TcxButtonEdit
        Left = 8
        Top = 41
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000001974455874536F6674776172650041646F626520496D616765526561
              647971C9653C00000017744558745469746C650050726576696F75733B417272
              6F773B55705E034A02000000ED49444154785EA5D3A10EC2301006E06AE696A0
              98A899E205402D41D4F10404030FB204BDF9792C0F809D1A383C9A10DC2453E5
              27F9975CAE0C33F165A1F7EFE86E9D591FCE9A83121A68A9E19AD379F9C34201
              35E490414C19D76A66AC6E60E10815A4DE7BF3CBB70615B35636285888D40D1B
              D8AAB588D9A26FE0B8B5540557D0D142EF84F738C3E1E42A30E7F03CBD205199
              1C4AC30967A230853B78E5061391CBA031FCA758142EE0FB2B5D793D895C0C6D
              D080C107CCC053024F78EB06C123C8A1F50DB8BE842E7C040E5114766A375ED4
              F67A8883AF5137F8F31AC383A40D1FA4F14779FCC734FA73FE00B68E424A1C43
              BA710000000049454E44AE426082}
            Kind = bkGlyph
          end>
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        Properties.OnButtonClick = EdtCaminhoPropertiesButtonClick
        TabOrder = 0
        Width = 300
      end
    end
    object cxGrid: TcxGrid
      Left = 4
      Top = 83
      Width = 752
      Height = 306
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 81
      ExplicitWidth = 756
      ExplicitHeight = 310
      object Grid: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnExpressionEditing = True
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.ColumnsQuickCustomizationMaxDropDownCount = 1
        OptionsCustomize.ColumnsQuickCustomizationReordering = qcrEnabled
        OptionsCustomize.ColumnsQuickCustomizationSorted = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
      end
      object cxGridLevel1: TcxGridLevel
        GridView = Grid
      end
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 26
    Top = 450
  end
  object OpenAnexo: TOpenTextFileDialog
    Left = 120
    Top = 440
  end
end
