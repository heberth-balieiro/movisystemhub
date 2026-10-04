inherited FrmRegistroEntrada: TFrmRegistroEntrada
  Caption = 'Registro de Entrada'
  Color = clWhite
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  inherited PanelClient: TPanel
    inherited cxGrid: TcxGrid
      inherited Grid: TcxGridDBTableView
        DataController.DataSource = Ds
        OptionsView.ColumnAutoWidth = False
        Styles.Content = nil
        Styles.ContentEven = nil
        Styles.ContentOdd = nil
        Styles.Footer = nil
        Styles.Group = nil
        Styles.GroupByBox = nil
        Styles.Header = nil
        Styles.Inactive = nil
        Styles.Indicator = nil
        Styles.Preview = nil
        Styles.Selection = nil
        object GridRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object Gridid_registro: TcxGridDBColumn
          DataBinding.FieldName = 'id_registro'
          Visible = False
        end
        object Griddata: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'data'
          Width = 86
        end
        object Gridhora: TcxGridDBColumn
          Caption = 'Hor'#225'rio'
          DataBinding.FieldName = 'hora'
          Width = 62
        end
        object Gridmatricula: TcxGridDBColumn
          Caption = 'Matr'#237'cula'
          DataBinding.FieldName = 'matricula'
          Width = 82
        end
        object Gridnome: TcxGridDBColumn
          Caption = 'Pessoa'
          DataBinding.FieldName = 'nome'
          Width = 332
        end
        object Gridwhatsapp: TcxGridDBColumn
          Caption = 'WhatsApp'
          DataBinding.FieldName = 'whatsapp'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          Width = 128
        end
        object Gridnmusuario: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'nmusuario'
          Width = 176
        end
      end
    end
  end
  inherited PanelFiltro: TPanel
    inherited GBFiltro: TcxGroupBox
      inherited Label1: TLabel
        Left = 181
        ExplicitLeft = 181
      end
      inherited Label2: TLabel
        Visible = False
      end
      object Label3: TLabel [2]
        Left = 3
        Top = 20
        Width = 46
        Height = 17
        Caption = 'Per'#237'odo'
        Color = 8679796
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5325111
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        StyleName = 'Windows'
      end
      inherited EdtBusca: TcxTextEdit
        Left = 181
        ExplicitLeft = 181
        ExplicitWidth = 501
        Width = 501
      end
      inherited cxAtivo: TcxComboBox
        Visible = False
      end
      inherited BtnPesquisar: TStyledBitBtn
        Left = 683
        ExplicitLeft = 683
      end
      inherited BtnLimpar: TStyledBitBtn
        Left = 774
        ExplicitLeft = 774
      end
      inherited BtnNovo: TStyledBitBtn
        Visible = False
      end
      object cxData1: TcxDateEdit
        Left = 3
        Top = 38
        EditValue = 0d
        Properties.ButtonGlyph.SourceDPI = 96
        Properties.ButtonGlyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000014744558745469746C6500446174653B43616C656E6461
          723BDF38D8A6000001D149444154785E8553316E5341107D9B7C5120C325C046
          5434544E1C51240484284002F9021C818A2E4A68728470015A44811134360810
          4D2863B80305C2B2FEDFDDC9BC99FD76EC26238FDF9BD99DB733BBFA1580A0BE
          A9BE81A505ACDA7A5ED4B37AAC583C7EF6F8B32AECE49C91B38028EA89313D39
          1762F23D758C93E1F79FBB265005ECDC7EF210102FD60A20298F1192C8135254
          54CF91EB11DFDE7D1AB0D646C822B671FEE7CC05929FCA9C903B2EF866E71ACF
          A2858A206CBBAE917862B4F61553C1568CF9926B14252F04C2AFA787E80FEFE0
          6A9DFD9AD89112515C31F17969EFDF9E023FEEBA40E4A95E4737A384FF4A24C1
          30247F8BA621412B10EDB4AC3EFAFADBAAF6B6BAF8A89CF9FDED2E3E8CA7B6FE
          E85E0FB42280CA83B603E17D14CED98DF9D3724DC8DB0E2EDC41533AE0FEDD7E
          17C222F2AD1BB63B59473729AC5C108402F182409D7CFE2CF8FBEA858D70FDF5
          0946638E23B83FE861349982B6AF3C6CAC0930A0401984291FC554513ACA248A
          BCC8B07A07B5065C4819E81C9C9402C1DE36C76111B48B5B2EA04108405CDE81
          07FE8462B834293D052E4281CCC49BB8EC20CE66FF262F8F46038817F85F21C2
          9265BEE5F5FCFF170205E66F8E9F3F50BCB2F619874B3EE79AB5E71DE48B3460
          34A2F10000000049454E44AE426082}
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        StyleFocused.BorderColor = clWindowFrame
        StyleFocused.Color = 15855596
        TabOrder = 6
        Width = 90
      end
      object cxdata2: TcxDateEdit
        Left = 92
        Top = 38
        EditValue = 0d
        Properties.ButtonGlyph.SourceDPI = 96
        Properties.ButtonGlyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000014744558745469746C6500446174653B43616C656E6461
          723BDF38D8A6000001D149444154785E8553316E5341107D9B7C5120C325C046
          5434544E1C51240484284002F9021C818A2E4A68728470015A44811134360810
          4D2863B80305C2B2FEDFDDC9BC99FD76EC26238FDF9BD99DB733BBFA1580A0BE
          A9BE81A505ACDA7A5ED4B37AAC583C7EF6F8B32AECE49C91B38028EA89313D39
          1762F23D758C93E1F79FBB265005ECDC7EF210102FD60A20298F1192C8135254
          54CF91EB11DFDE7D1AB0D646C822B671FEE7CC05929FCA9C903B2EF866E71ACF
          A2858A206CBBAE917862B4F61553C1568CF9926B14252F04C2AFA787E80FEFE0
          6A9DFD9AD89112515C31F17969EFDF9E023FEEBA40E4A95E4737A384FF4A24C1
          30247F8BA621412B10EDB4AC3EFAFADBAAF6B6BAF8A89CF9FDED2E3E8CA7B6FE
          E85E0FB42280CA83B603E17D14CED98DF9D3724DC8DB0E2EDC41533AE0FEDD7E
          17C222F2AD1BB63B59473729AC5C108402F182409D7CFE2CF8FBEA858D70FDF5
          0946638E23B83FE861349982B6AF3C6CAC0930A0401984291FC554513ACA248A
          BCC8B07A07B5065C4819E81C9C9402C1DE36C76111B48B5B2EA04108405CDE81
          07FE8462B834293D052E4281CCC49BB8EC20CE66FF262F8F46038817F85F21C2
          9265BEE5F5FCFF170205E66F8E9F3F50BCB2F619874B3EE79AB5E71DE48B3460
          34A2F10000000049454E44AE426082}
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        StyleFocused.BorderColor = clWindowFrame
        StyleFocused.Color = 15855596
        TabOrder = 7
        Width = 90
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 496
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 456
    Top = 248
  end
  inherited MenuPop: TPopupMenu
    Left = 440
    Top = 4
    inherited btnEditar: TMenuItem
      Visible = False
    end
    inherited btnExcluir: TMenuItem
      Visible = False
    end
    inherited N1: TMenuItem
      Visible = False
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object btnsincronizar: TMenuItem
      Caption = 'Sincronizar'
      ImageIndex = 5
      OnClick = btnsincronizarClick
    end
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
    Left = 384
    Top = 0
    DesignInfo = 384
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 408
    Top = 252
    object mdPesquisaid_registro: TIntegerField
      FieldName = 'id_registro'
    end
    object mdPesquisadata: TDateField
      FieldName = 'data'
    end
    object mdPesquisahora: TTimeField
      FieldName = 'hora'
    end
    object mdPesquisanome: TStringField
      FieldName = 'nome'
      Size = 200
    end
    object mdPesquisawhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object mdPesquisanmusuario: TStringField
      FieldName = 'nmusuario'
      Size = 60
    end
    object mdPesquisamatricula: TIntegerField
      FieldName = 'matricula'
    end
  end
end
