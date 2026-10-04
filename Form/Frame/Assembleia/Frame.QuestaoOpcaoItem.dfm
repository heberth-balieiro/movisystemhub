object FrameQuestaoOpcaoItem: TFrameQuestaoOpcaoItem
  Left = 0
  Top = 0
  Width = 635
  Height = 26
  TabOrder = 0
  object rbOpcao: TRadioButton
    Left = 8
    Top = 5
    Width = 22
    Height = 17
    Enabled = False
    TabOrder = 0
  end
  object edtdescricao: TcxTextEdit
    Left = 36
    Top = 2
    Cursor = crIBeam
    Properties.ClearKey = 16452
    StyleFocused.BorderColor = clNavy
    StyleFocused.Color = 15855596
    TabOrder = 1
    TextHint = 'Texto de resposta'
    Width = 543
  end
  object btnExcluir: TcxButtonEdit
    Left = 580
    Top = 2
    Cursor = crHandPoint
    TabStop = False
    Properties.Buttons = <
      item
        Default = True
        Glyph.SourceDPI = 96
        Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000014744558745469746C650044656C6574653B52656D6F76653B3B3E73
          850000008949444154785E8D90310AC0200C4573BB4EED594A5B1114EDE2995B
          3AD9040C0E42BEC35B3EBC070995528495090C4D129B432A7F4C65D2847C33B5
          399B0CAE0D4A8272E7D0AA1F2258BEF4042362CB1AB022D992350022A38C0282
          47B282BFDDC93030CA3882E493F15604C924581128A388C8D1905124C8B830CF
          20E3C82BAE0C1AD9BB0071CDA11FAB2AF0B52FE3843E0000000049454E44AE42
          6082}
        Kind = bkGlyph
      end>
    Properties.CaseInsensitive = False
    Properties.IncrementalSearch = False
    Properties.ViewStyle = vsButtonsOnly
    Properties.OnButtonClick = btnExcluirPropertiesButtonClick
    Style.BorderStyle = ebsFlat
    Style.HotTrack = True
    Style.Shadow = False
    Style.TransparentBorder = True
    Style.ButtonStyle = btsDefault
    TabOrder = 2
    Width = 27
  end
end
