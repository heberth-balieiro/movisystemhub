object FrmAvisoDependente: TFrmAvisoDependente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Lista de dependentes que completam 18 anos'
  ClientHeight = 308
  ClientWidth = 873
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object cxGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 873
    Height = 308
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 865
    ExplicitHeight = 296
    object cxGridDB: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = ds
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
      OptionsView.NoDataToDisplayInfoText = 'Nenhum aviso encontrado'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = FrmPrincipalNew.CxGridPedido
      object coll1: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
        Width = 53
      end
      object coll2: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'nome'
        Width = 239
      end
      object coll3: TcxGridDBColumn
        Caption = 'CPF'
        DataBinding.FieldName = 'cpf'
        Width = 100
      end
      object coll5: TcxGridDBColumn
        Caption = 'Nascimento'
        DataBinding.FieldName = 'nascimento'
        Width = 82
      end
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = 'Matricula'
        DataBinding.FieldName = 'matricula'
        Width = 68
      end
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = 'Associado'
        DataBinding.FieldName = 'nmsocio'
        Width = 337
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDB
    end
  end
  object ds: TUniDataSource
    DataSet = DM.AvisoDependente18
    Left = 408
    Top = 176
  end
end
