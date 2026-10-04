inherited FrmTecnOrdemServico: TFrmTecnOrdemServico
  Caption = 'FrmTecnOrdemServico'
  ClientHeight = 590
  ClientWidth = 630
  ExplicitWidth = 630
  ExplicitHeight = 590
  TextHeight = 17
  inherited Panel2: TPanel
    Left = 512
    Top = 540
    ExplicitLeft = 512
    ExplicitTop = 540
  end
  inherited Panel1: TPanel
    Left = 390
    Top = 540
    ExplicitLeft = 390
    ExplicitTop = 540
  end
  inherited Paneltitulo: TPanel
    Width = 630
    inherited lblTitulo: TLabel
      Width = 615
      Caption = 'Diagn'#243'stico T'#233'cnico - Orderm de Servi'#231'o'
      ExplicitWidth = 615
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    Style.BorderStyle = ebsUltraFlat
    ExplicitWidth = 630
    ExplicitHeight = 484
    Height = 484
    Width = 630
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 48
      Height = 17
      Caption = 'N'#250'mero'
    end
    object Label2: TLabel
      Left = 94
      Top = 6
      Width = 27
      Height = 17
      Caption = 'Data'
    end
    object Label3: TLabel
      Left = 192
      Top = 6
      Width = 29
      Height = 17
      Caption = 'Hora'
    end
    object Label4: TLabel
      Left = 255
      Top = 6
      Width = 35
      Height = 17
      Caption = 'Status'
    end
    object Label5: TLabel
      Left = 388
      Top = 6
      Width = 61
      Height = 17
      Caption = 'Prioridade'
    end
    object Label6: TLabel
      Left = 461
      Top = 6
      Width = 49
      Height = 17
      Caption = 'Garantia'
    end
    object Label8: TLabel
      Left = 529
      Top = 6
      Width = 50
      Height = 17
      Caption = 'Tipo O.S'
    end
    object Label7: TLabel
      Left = 8
      Top = 55
      Width = 39
      Height = 17
      Caption = 'Cliente'
    end
    object Label9: TLabel
      Left = 428
      Top = 55
      Width = 43
      Height = 17
      Caption = 'T'#233'cnico'
    end
    object Label12: TLabel
      Left = 8
      Top = 105
      Width = 70
      Height = 17
      Caption = 'Observa'#231#227'o'
    end
    object edtNumero: TcxTextEdit
      Left = 8
      Top = 24
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 80
    end
    object edtData: TcxDateEdit
      Left = 94
      Top = 24
      EditValue = 0d
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 92
    end
    object edtHora: TcxTimeEdit
      Left = 192
      Top = 24
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.TimeFormat = tfHourMin
      TabOrder = 2
      Width = 57
    end
    object EdtStatus: TcxComboBox
      Left = 255
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Em andamento'
        'Finalizada'
        'Cancelada')
      TabOrder = 3
      Text = 'EM ANDAMENTO'
      Width = 127
    end
    object EdtPrioridade: TcxComboBox
      Left = 388
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Alta'
        'M'#233'dia'
        'Baixa')
      TabOrder = 4
      Text = 'M'#201'DIA'
      Width = 67
    end
    object EdtGarantia: TcxComboBox
      Left = 461
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Sim'
        'N'#227'o')
      TabOrder = 5
      Text = 'N'#195'O'
      Width = 62
    end
    object EdtTipoOS: TcxComboBox
      Left = 529
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Or'#231'amento'
        'Retorno'
        'Execu'#231#227'o')
      TabOrder = 6
      Text = 'OR'#199'AMENTO'
      Width = 93
    end
    object edtCliente: TcxLookupComboBox
      Left = 8
      Top = 74
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_socio'
      Properties.ListColumns = <
        item
          Caption = 'Pessoa/Raz'#227'o'
          Width = 365
          FieldName = 'cliente'
        end
        item
          Caption = 'CPF/CNPJ'
          MinWidth = 120
          Width = 125
          FieldName = 'cpf'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      EditValue = 0
      TabOrder = 7
      Width = 388
    end
    object BtnCliVisualizar: TcxButtonEdit
      Left = 395
      Top = 74
      Cursor = crHandPoint
      Properties.Buttons = <
        item
          Default = True
          Glyph.SourceDPI = 96
          Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000013744558745469746C6500507265766965773B5072696E749891A1F3
            0000028649444154785E6D915D48D45918C67FE73FA3A649F481F6A1F831D137
            A34562D85E440EA8A0D48D15425DB4D2D645D04D52BB4B73951521E145484448
            A44412151951BB62178991659F1F7AA146C85C2CACB84BECEC7CFCCF396FC330
            CC20CE73F13EE7C0737E3C2FC72B220074F58E0F23520F200822A0002BC98988
            02B1080A30CF7E3DBE3B00E025256B6C7DC7B15A001052926C573A7B5ED4032C
            0068B1E9802099736A480687D19645001337E9C791A8414430364511050EE4E7
            7900D0C66401680308D60A7FCF7FE7CED30F4CCDCE6145F095ACE4606335656B
            57E02887989BA5816B6C321CFAEB5F823D43F8FC1BD9DBBA030798FA3243F0EA
            1382C70394971663B4CEDE4044E87F344EA57F03B575DBD8BE3A87E97943D4BF
            152596BEC1D79C39D6905C61F8FC1EAC910C20EE1A8CB1BC9D0CD1FA4B1DFE62
            2F112DE4E740382ED4D46CA2FBD218AE4EE6926E139E5921D5C0755D1C84AFFF
            180A721413733A0151E42A857135565BB4B1C45DBDB0813106506CA928E2F3F8
            04E19DDB89C42D4B721D5617787833F68192C2309158145FD972DC2F6631C051
            8AB6961ACE5E19C4EB51EC4CD4CE4DF8FBB149869E3CE7544D88A9A11B94AF69
            A2F5C4B8D3FF73954D03B405E538097A315D1DFBB93E3042F7D00B442CABD43C
            ED953334057E62E2E53B66DFDD06283CDCFBF1BF85BF00388E97D275459C3BB9
            0FAD355A1B62B138A3372FF3FCC19F045A7661A39FB8D0BCBEF3B7C73367D200
            ABCD1FED1DF71BAD80A34044B0024A099B7D455456B531F2B80773EF190DCDD5
            BC1A7E7F12389706DCEA3ED04446F41DAD6274641A0166510467FE778065872A
            965E7C78F7ED8998C7B906B85EB20B3766D0A270E306048E94E6D9BE50ECFBC0
            B7F069E077200E447F00A25E564DD5AF61520000000049454E44AE426082}
          Kind = bkGlyph
        end>
      Properties.CaseInsensitive = False
      Properties.IncrementalSearch = False
      Properties.ViewStyle = vsButtonsOnly
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 8
      Width = 27
    end
    object EdtTecnico: TcxLookupComboBox
      Left = 428
      Top = 74
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_socio'
      Properties.ListColumns = <
        item
          Caption = 'Pessoa/Raz'#227'o'
          Width = 365
          FieldName = 'cliente'
        end
        item
          Caption = 'CPF/CNPJ'
          MinWidth = 120
          Width = 125
          FieldName = 'cpf'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      EditValue = 0
      TabOrder = 9
      Width = 194
    end
    object EdtObs: TcxBlobEdit
      Left = 8
      Top = 122
      Properties.BlobEditKind = bekMemo
      Properties.ClearKey = 16452
      Properties.PopupHeight = 180
      Properties.PopupWidth = 515
      TabOrder = 10
      Width = 614
    end
    object cxPageControl1: TcxPageControl
      Left = 4
      Top = 151
      Width = 622
      Height = 329
      Align = alBottom
      TabOrder = 11
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 327
      ClientRectLeft = 2
      ClientRectRight = 620
      ClientRectTop = 35
      object cxTabSheet1: TcxTabSheet
        Caption = 'Avalia'#231#227'o'
        ImageIndex = 0
        object cxGroupBox4: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          ParentBackground = False
          ParentColor = False
          Style.BorderStyle = ebsNone
          TabOrder = 0
          Height = 292
          Width = 618
          object cxGroupBox3: TcxGroupBox
            AlignWithMargins = True
            Left = 7
            Top = 202
            Align = alBottom
            Caption = 'Avalia'#231#227'o T'#233'cnica'
            Style.TextStyle = [fsBold]
            TabOrder = 0
            Height = 83
            Width = 604
            object Label11: TLabel
              Left = 7
              Top = 18
              Width = 114
              Height = 17
              Caption = 'Diagn'#243'stico t'#233'cnico'
            end
            object cxBlobEdit1: TcxBlobEdit
              Left = 7
              Top = 35
              Properties.BlobEditKind = bekMemo
              Properties.ClearKey = 16452
              Properties.PopupHeight = 180
              Properties.PopupWidth = 515
              TabOrder = 0
              Width = 593
            end
          end
          object cxGroupBox2: TcxGroupBox
            AlignWithMargins = True
            Left = 7
            Top = 7
            Align = alClient
            Caption = 'Equipamento'
            Style.TextStyle = [fsBold]
            TabOrder = 1
            Height = 189
            Width = 604
            object Label10: TLabel
              Left = 515
              Top = 19
              Width = 40
              Height = 17
              Caption = 'Estado'
            end
            object Label14: TLabel
              Left = 7
              Top = 19
              Width = 49
              Height = 17
              Caption = 'N'#186' S'#233'rie'
            end
            object Label15: TLabel
              Left = 95
              Top = 19
              Width = 138
              Height = 17
              Caption = 'Descri'#231#227'o equipamento'
            end
            object Label16: TLabel
              Left = 7
              Top = 67
              Width = 111
              Height = 17
              Caption = 'Defeito Reclamado'
            end
            object Label17: TLabel
              Left = 7
              Top = 115
              Width = 73
              Height = 17
              Caption = 'Anexo/Foto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtEstado: TcxComboBox
              Left = 515
              Top = 36
              Properties.CharCase = ecUpperCase
              Properties.ClearKey = 16452
              Properties.DropDownListStyle = lsEditFixedList
              Properties.ImmediatePost = True
              Properties.Items.Strings = (
                'Consignado'
                'Consignado Loja'
                'Pr'#243'prio'
                'Zero')
              TabOrder = 0
              Width = 85
            end
            object Edt_DescEquipamento: TcxLookupComboBox
              Left = 95
              Top = 36
              Properties.CharCase = ecUpperCase
              Properties.ClearKey = 16452
              Properties.ImmediatePost = True
              Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
              Properties.KeyFieldNames = 'id_socio'
              Properties.ListColumns = <
                item
                  Caption = 'Pessoa/Raz'#227'o'
                  Width = 365
                  FieldName = 'cliente'
                end
                item
                  Caption = 'CPF/CNPJ'
                  MinWidth = 120
                  Width = 125
                  FieldName = 'cpf'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListOptions.SyncMode = True
              EditValue = 0
              TabOrder = 1
              Width = 414
            end
            object EdtSerie: TcxTextEdit
              Left = 7
              Top = 36
              Properties.CharCase = ecUpperCase
              TabOrder = 2
              Width = 82
            end
            object edtDefeito: TcxBlobEdit
              Left = 7
              Top = 84
              Properties.BlobEditKind = bekMemo
              Properties.ClearKey = 16452
              Properties.PopupHeight = 180
              Properties.PopupWidth = 515
              TabOrder = 3
              Width = 593
            end
            object EdtAnexo: TcxListBox
              Left = 7
              Top = 132
              Width = 593
              Height = 56
              ItemHeight = 17
              TabOrder = 4
            end
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Produto/Servi'#231'o'
        ImageIndex = 1
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 352
    Top = 554
  end
end
