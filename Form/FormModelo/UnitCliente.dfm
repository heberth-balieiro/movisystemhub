object FrmModelo: TFrmModelo
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'xxxxxx'
  ClientHeight = 614
  ClientWidth = 1032
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnClose = FormClose
  TextHeight = 15
  object pHeader: TPanel
    Left = 0
    Top = 0
    Width = 1032
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Color = 16051947
    ParentBackground = False
    TabOrder = 0
    object Label4: TLabel
      AlignWithMargins = True
      Left = 0
      Top = 15
      Width = 169
      Height = 50
      Margins.Left = 0
      Margins.Top = 15
      Margins.Right = 0
      Margins.Bottom = 15
      Align = alLeft
      AutoSize = False
      Caption = 'xxxxx'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -29
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 907
      Top = 20
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 6906591
      ParentBackground = False
      TabOrder = 0
      object btnAcessar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Excluir'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 72
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 657
      Top = 20
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 1
      object btnNovo: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Inserir'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnNovoClick
        ExplicitLeft = 72
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 782
      Top = 20
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 2
      object SpeedButton2: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Editar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 72
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pBusca: TPanel
      AlignWithMargins = True
      Left = 169
      Top = 0
      Width = 408
      Height = 80
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 80
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = 16051947
      ParentBackground = False
      TabOrder = 3
      object Panel7: TPanel
        AlignWithMargins = True
        Left = 283
        Top = 20
        Width = 110
        Height = 40
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 15
        Margins.Bottom = 20
        Align = alRight
        BevelOuter = bvNone
        Color = 16475988
        ParentBackground = False
        TabOrder = 0
        object btnBusca: TSpeedButton
          Left = 0
          Top = 0
          Width = 110
          Height = 40
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Filtrar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 72
          ExplicitTop = 8
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object edtBusca: TEdit
        AlignWithMargins = True
        Left = 0
        Top = 20
        Width = 283
        Height = 40
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 20
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitHeight = 38
      end
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 80
    Width = 1032
    Height = 534
    Align = alClient
    TabOrder = 1
    object cxGridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'id-sede'
          Column = coll1
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = 'Nenhum registro encontrado'
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object coll1: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'id_Sede'
        Width = 50
      end
      object coll2: TcxGridDBColumn
        Caption = 'Raz'#227'o'
        DataBinding.FieldName = 'razao'
        Width = 280
      end
      object coll3: TcxGridDBColumn
        Caption = 'Fantasia'
        DataBinding.FieldName = 'fantasia'
        Width = 165
      end
      object coll4: TcxGridDBColumn
        Caption = 'CNPJ'
        DataBinding.FieldName = 'cnpj'
        Width = 151
      end
      object coll5: TcxGridDBColumn
        Caption = 'Telefone'
        DataBinding.FieldName = 'telefone'
        Width = 99
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object ds: TDataSource
    Left = 728
    Top = 272
  end
end
