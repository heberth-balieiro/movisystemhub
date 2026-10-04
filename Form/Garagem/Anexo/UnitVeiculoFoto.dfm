object FrmVeiculoFoto: TFrmVeiculoFoto
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 429
  ClientWidth = 785
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
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 667
    Top = 384
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 545
    Top = 384
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
    Visible = False
    object btnSalvar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Salvar | F5'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 6
    end
  end
  object Paneltitulo: TPanel
    Left = 0
    Top = 0
    Width = 785
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
      Width = 770
      Height = 50
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Caption = 'Fotos Ve'#237'culo'
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
    Caption = 'Dados Ve'#237'culo'
    Style.TextStyle = [fsBold]
    TabOrder = 3
    Height = 79
    Width = 785
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object Label4: TLabel
      Left = 94
      Top = 22
      Width = 41
      Height = 17
      Caption = 'Ve'#237'culo'
    end
    object Label18: TLabel
      Left = 463
      Top = 22
      Width = 30
      Height = 17
      Caption = 'Placa'
    end
    object Label22: TLabel
      Left = 682
      Top = 22
      Width = 36
      Height = 17
      Caption = 'Venda'
    end
    object Label23: TLabel
      Left = 581
      Top = 22
      Width = 66
      Height = 17
      Caption = 'Tabela Fipe'
    end
    object edtcodigo: TcxTextEdit
      Left = 8
      Top = 41
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 80
    end
    object edtDescricao: TcxTextEdit
      Left = 94
      Top = 41
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      TabOrder = 1
      Width = 363
    end
    object edtPlaca: TcxTextEdit
      Left = 463
      Top = 41
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      TabOrder = 2
      Width = 112
    end
    object edtprcvenda: TcxCurrencyEdit
      Left = 682
      Top = 41
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.ReadOnly = True
      TabOrder = 3
      Width = 95
    end
    object vlrFipe: TcxCurrencyEdit
      Left = 581
      Top = 41
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.ReadOnly = True
      TabOrder = 4
      Width = 95
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 129
    Align = alTop
    Caption = 'Galeria de Fotos'
    Style.TextStyle = [fsBold]
    TabOrder = 4
    Height = 248
    Width = 785
    object edtFoto: TImage
      Left = 581
      Top = 23
      Width = 160
      Height = 137
      Cursor = crHandPoint
      Center = True
      Proportional = True
      Transparent = True
      Visible = False
    end
    object dxGalleryControl1: TdxGalleryControl
      AlignWithMargins = True
      Left = 7
      Top = 61
      Width = 771
      Height = 168
      Cursor = crHandPoint
      Align = alBottom
      BorderStyle = cxcbsNone
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = ''
      OptionsView.ColumnAutoWidth = True
      OptionsView.ColumnCount = 5
      OptionsView.Item.Image.ShowFrame = False
      OptionsView.Item.Image.Size.Height = 150
      OptionsView.Item.Image.Size.Width = 200
      OptionsView.Item.Text.AlignVert = vaBottom
      TabOrder = 0
      Transparent = True
      OnItemClick = dxGalleryControl1ItemClick
      ExplicitLeft = 5
      ExplicitTop = 75
      ExplicitWidth = 775
      object dxGalleryControl1Group1: TdxGalleryControlGroup
        Caption = 'Group0'
        ShowCaption = False
      end
    end
    object btnIncluir: TcxButton
      Left = 8
      Top = 23
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
      TabOrder = 1
      OnClick = btnIncluirClick
    end
    object btnexcluir: TcxButton
      Left = 94
      Top = 23
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
      TabOrder = 2
      OnClick = btnexcluirClick
    end
    object btnVisualizar: TcxButton
      Left = 180
      Top = 23
      Width = 85
      Height = 25
      Cursor = crHandPoint
      Caption = 'Visualizar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000013744558745469746C65005765623B576F726C643B4579650744383A
        0000038949444154785E55936D4C935714C7AFDBDC0BC36C98B82563D9546418
        C97483601A9D6D4550C6ECEC043637AA1B60C644289497696C112A3495551CE0
        60A0052C1A70804040A64883505AB165950A84494B79192B56602C2B29B866F8
        DF7D9A05E74D7EB91FEEB9BF7BFEC93D44A933100084AE67E4AA5D01A5D7788D
        B29A38DBE9C67EC81B4C53B23A63E3E15C69203D7FB65A2327E5B49E9E11006E
        98B5626F6C9A87E0E451E9993ABE4B3FF61DFAC6BB31E75AC2C4BC0BD5BAEBC8
        AE8C709DB91272CA2FF08D1799FADCBABEA704CF7D7A2CB14C7CB9193FDD5660
        EED1202C0F06F070F11FD829F76D26A887CE41752B0A0972EE792A5829B9A47F
        22F844E8137A28730FF2D56A68CD7761B4EA30681BC6A8C3E5C632B700FD583F
        2A3A1321BEB01BC182883D4CDC2782149FABF2DA8F70ECA21846FB224CD38B18
        987984815937D0FCDA4323B54233990CA53A12DC2F763650C1F3CB82D0C3FE0F
        140DFB90AA94A2CDEA40F7A413BADF29930BD08CCFE0AAB616973B2EE24A6F3C
        2ABA3E43680CCB4E051ECB821DD1B1AE83A7E2216ED2A2443F8B9661075ACD0E
        D4DC56A3FC7A296A7AB428D6DB91549209456304D882201715786EE7151056F8
        5942C2852AFB91F3BD48500D20BB7D0A67B5D3A830FE0155DB258C4C77A0CFDA
        0593F91EEEDE1FA40CA1E6DA4D2715BC4259B1352C9F105F36A79997780851B9
        25F8B2D80051AD05B746FE42FFA815F537BA9157F633C48A6624489A9096D384
        A4CCBA055E749ED0D36BDD2AE66F90B5ACD7F66D3DB016DF28A2C0137D85C2FA
        16684D93C82E52A3B2DE886EC3084EC8ABB03F2EC7BD77F698F1FD852E04ED96
        8FAE7F57B09130797CB8DEB5DC185F24177E888E5F8CC82BED8469680A0EE7DF
        48932AD16BFF1319D9E7909CA5C4D71985B0CFCEA3A5FD1E36B3B3B48469C363
        F54BAFAFFBE0CD32BFE0B0A59B7A0BD265AD989973C2F6701EC1111910490A40
        EB1079F028D8FC54587F9B85C13486CD9C1C2789961C77CF01C573F57AFFF0FC
        8A1B664152D5E376CD3086C7A7112BCA77BFFC794C0AE2BF2D44648C04C6C109
        54D5DFC1A66D621DD910964BDE66C7B96782B292F2EA5B7E612C2EBF604294D5
        801F2ADBC13B900E9FF73EC65EBA1795B7213EBD1A5B38D271EF77F8FE04C032
        3B237F249CFDC5EE586BBC03BDB6708E0B03436477024264B6805DA769CBD2A9
        4DDB24860DEF1F49F3F4F25DC3CCD1530236BDBC835F44E827F97F472F335D51
        BCFE6315E50526F646D649F22F89453D56C978243A0000000049454E44AE4260
        82}
      TabOrder = 3
      OnClick = btnVisualizarClick
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 576
    Top = 2
  end
  object dxOpenFileDialog1: TdxOpenFileDialog
    Left = 248
    Top = 377
  end
  object OpenPicture: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.jpeg;*.png)|*.jpg;*.jpeg;*.png|JPEG Image File (*.j' +
      'pg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Portable Network Graph' +
      'ics (*.png)|*.png'
    Title = 'Carregar Foto'
    Left = 296
    Top = 376
  end
end
