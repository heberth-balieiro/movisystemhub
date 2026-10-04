inherited FrmPermissao: TFrmPermissao
  Caption = 'Permissao'
  ClientHeight = 625
  ClientWidth = 650
  Color = clWhite
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 650
  ExplicitHeight = 625
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 600
    Width = 650
    TabOrder = 0
    ExplicitTop = 740
    ExplicitWidth = 889
  end
  inherited PanelClient: TPanel
    Width = 650
    Height = 560
    TabOrder = 1
    ExplicitWidth = 889
    ExplicitHeight = 700
    object cxGridPermissao: TcxGrid
      Left = 0
      Top = 0
      Width = 650
      Height = 515
      Align = alTop
      BorderStyle = cxcbsNone
      TabOrder = 0
      object cxGridPermissaoDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = Ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object Tela: TcxGridDBColumn
          Caption = 'Tela'
          DataBinding.FieldName = 'tela'
          Visible = False
          GroupIndex = 1
          Options.Editing = False
          Options.Moving = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 286
        end
        object nome: TcxGridDBColumn
          Caption = 'A'#231#227'o'
          DataBinding.FieldName = 'nome'
          Options.Editing = False
          Options.Moving = False
          Width = 527
        end
        object liberado: TcxGridDBColumn
          Caption = 'Permiss'#227'o'
          DataBinding.FieldName = 'liberado'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayChecked = 'S'
          Properties.DisplayUnchecked = 'N'
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          Properties.OnEditValueChanged = liberadoPropertiesEditValueChanged
          Options.Moving = False
          Width = 88
        end
        object nmodulo: TcxGridDBColumn
          Caption = 'M'#243'dulo'
          DataBinding.FieldName = 'modulo'
          Visible = False
          GroupIndex = 0
          SortIndex = 1
          SortOrder = soAscending
        end
      end
      object cxGridPermissaoDBLayoutView1: TcxGridDBLayoutView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGridPermissaoDBLayoutView1Item1: TcxGridDBLayoutViewItem
          Caption = 'modulos'
          DataBinding.FieldName = 'tela'
          LayoutItem = cxGridPermissaoDBLayoutView1LayoutItem1
        end
        object cxGridPermissaoDBLayoutView1Group_Root: TdxLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          Index = -1
        end
        object cxGridPermissaoDBLayoutView1LayoutItem1: TcxGridLayoutItem
          Parent = cxGridPermissaoDBLayoutView1Group_Root
          Index = 0
        end
      end
      object cxGridPermissaoLevel1: TcxGridLevel
        GridView = cxGridPermissaoDBTableView1
      end
    end
    object BtnCancelar: TStyledBitBtn
      Left = 537
      Top = 521
      Width = 110
      Height = 35
      Caption = 'Cancelar | ESC'
      TabOrder = 1
      OnClick = BtnCancelarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Danger'
    end
  end
  inherited Paneltitulo: TPanel
    Width = 650
    TabOrder = 2
    ExplicitWidth = 889
    inherited lblTitulo: TLabel
      Width = 595
      ExplicitWidth = 595
    end
    inherited BtnFechar: TSpeedButton
      Left = 610
      ExplicitLeft = 610
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 352
    Top = 2
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 288
    Top = 0
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 224
    Top = 4
    object mdPesquisaid_nivel: TIntegerField
      FieldName = 'id_nivel'
    end
    object mdPesquisaid_perfil: TIntegerField
      FieldName = 'id_perfil'
    end
    object mdPesquisatela: TStringField
      FieldName = 'tela'
      Size = 45
    end
    object mdPesquisanome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object mdPesquisaliberado: TStringField
      FieldName = 'liberado'
    end
    object mdPesquisamodulo: TStringField
      FieldName = 'modulo'
      Size = 60
    end
  end
end
