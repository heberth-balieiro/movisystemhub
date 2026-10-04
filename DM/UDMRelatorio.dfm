object DMRelatorio: TDMRelatorio
  Height = 480
  Width = 892
  object ClientPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 2
  end
  object ClientPedidoItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 31
    Top = 58
  end
  object RelListagemAptos: TClientDataSet
    PersistDataPacket.Data = {
      860000009619E0BD010000001800000005000000000003000000860006636F64
      69676F0400010000000000096D6174726963756C610400010000000000046E6F
      6D65010049000000010005574944544802000200BE000572617A616F01004900
      0000010005574944544802000200BE0003637066010049000000010005574944
      54480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 704
    Top = 10
    object RelListagemAptoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object RelListagemAptosmatricula: TIntegerField
      FieldName = 'matricula'
    end
    object RelListagemAptosnome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object RelListagemAptosrazao: TStringField
      FieldName = 'razao'
      Size = 190
    end
    object RelListagemAptoscpf: TStringField
      FieldName = 'cpf'
    end
  end
  object RelListagemVotantes: TClientDataSet
    PersistDataPacket.Data = {
      F60000009619E0BD01000000180000000B000000000003000000F60006636F64
      69676F0400010000000000096D6174726963756C610400010000000000046E6F
      6D65010049000000010005574944544802000200BE0003637066010049000000
      0100055749445448020002001400027267010049000000010005574944544802
      0002001400056F7267616F010049000000010005574944544802000200140005
      6F7264656D040001000000000002697001004900000001000557494454480200
      02001E00056368617665010049000000010005574944544802000200FA000464
      617461040006000000000004686F726104000700000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'matricula'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'rg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'orgao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ordem'
        DataType = ftInteger
      end
      item
        Name = 'ip'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'chave'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'data'
        DataType = ftDate
      end
      item
        Name = 'hora'
        DataType = ftTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 704
    Top = 66
    object RelListagemVotantescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object RelListagemVotantesmatricula: TIntegerField
      FieldName = 'matricula'
    end
    object RelListagemVotantesnome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object RelListagemVotantescpf: TStringField
      FieldName = 'cpf'
    end
    object RelListagemVotantesrg: TStringField
      FieldName = 'rg'
    end
    object RelListagemVotantesorgao: TStringField
      FieldName = 'orgao'
    end
    object RelListagemVotantesordem: TIntegerField
      FieldName = 'ordem'
    end
    object RelListagemVotantesip: TStringField
      FieldName = 'ip'
      Size = 30
    end
    object RelListagemVotanteschave: TStringField
      FieldName = 'chave'
      Size = 250
    end
    object RelListagemVotantesdata: TDateField
      FieldName = 'data'
    end
    object RelListagemVotanteshora: TTimeField
      FieldName = 'hora'
    end
  end
  object RelCabechalhoVotantes: TClientDataSet
    PersistDataPacket.Data = {
      990000009619E0BD010000001800000006000000000003000000990009646573
      63726963616F010049000000010005574944544802000200FA00046E6F6D6501
      0049000000010005574944544802000200FA0008646174615F696E6904000600
      0000000008686F72615F696E6904000700000000000A646174615F66696E616C
      04000600000000000A686F72615F66696E616C04000700000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'descricao'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'data_ini'
        DataType = ftDate
      end
      item
        Name = 'hora_ini'
        DataType = ftTime
      end
      item
        Name = 'data_final'
        DataType = ftDate
      end
      item
        Name = 'hora_final'
        DataType = ftTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 800
    Top = 10
    object RelCabechalhoVotantesdescricao: TStringField
      FieldName = 'descricao'
      Size = 250
    end
    object RelCabechalhoVotantesnome: TStringField
      FieldName = 'nome'
      Size = 250
    end
    object RelCabechalhoVotantesdata_ini: TDateField
      FieldName = 'data_ini'
    end
    object RelCabechalhoVotanteshora_ini: TTimeField
      FieldName = 'hora_ini'
    end
    object RelCabechalhoVotantesdata_final: TDateField
      FieldName = 'data_final'
    end
    object RelCabechalhoVotanteshora_final: TTimeField
      FieldName = 'hora_final'
    end
  end
  object RelListagemNaoVotantes: TClientDataSet
    PersistDataPacket.Data = {
      B70000009619E0BD010000001800000007000000000003000000B70006636F64
      69676F0400010000000000096D6174726963756C610400010000000000046E6F
      6D65010049000000010005574944544802000200BE0003637066010049000000
      0100055749445448020002001400027267010049000000010005574944544802
      0002001400056F7267616F010049000000010005574944544802000200140005
      656D61696C010049000000010005574944544802000200BE000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 704
    Top = 122
    object RelListagemNaoVotantescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object RelListagemNaoVotantesmatricula: TIntegerField
      FieldName = 'matricula'
    end
    object RelListagemNaoVotantesnome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object RelListagemNaoVotantescpf: TStringField
      FieldName = 'cpf'
    end
    object RelListagemNaoVotantesrg: TStringField
      FieldName = 'rg'
    end
    object RelListagemNaoVotantesorgao: TStringField
      FieldName = 'orgao'
    end
    object RelListagemNaoVotantesemail: TStringField
      FieldName = 'email'
      Size = 190
    end
  end
  object RelListagemPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 41
    Top = 160
  end
  object RelATA: TClientDataSet
    PersistDataPacket.Data = {
      3C0100009619E0BD01000000180000000B0000000000030000003C010D717464
      655F766F74616E746573040001000000000014717464655F766F74616E746573
      5F636861706131040001000000000014717464655F766F74616E7465735F6272
      616E636F04000100000000000869645F63686170610400010000000000067065
      73736F610100490000000100055749445448020002009600066E636861706101
      00490000000100055749445448020002003C000A717464655F766F746F730400
      0100000000000B766F74616E7465737374720100490000000100055749445448
      0200020096000863686170617374720100490000000100055749445448020002
      009600096272616E636F73747201004900000001000557494454480200020096
      0008766F746F7373747201004900000001000557494454480200020096000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'qtde_votantes'
        DataType = ftInteger
      end
      item
        Name = 'qtde_votantes_chapa1'
        DataType = ftInteger
      end
      item
        Name = 'qtde_votantes_branco'
        DataType = ftInteger
      end
      item
        Name = 'id_chapa'
        DataType = ftInteger
      end
      item
        Name = 'pessoa'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'nchapa'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'qtde_votos'
        DataType = ftInteger
      end
      item
        Name = 'votantesstr'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'chapastr'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'brancostr'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'votosstr'
        DataType = ftString
        Size = 150
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 552
    Top = 8
    object RelATAqtde_votantes: TIntegerField
      FieldName = 'qtde_votantes'
    end
    object RelATAqtde_votantes_chapa1: TIntegerField
      FieldName = 'qtde_votantes_chapa1'
    end
    object RelATAqtde_votantes_branco: TIntegerField
      FieldName = 'qtde_votantes_branco'
    end
    object RelATAid_chapa: TIntegerField
      FieldName = 'id_chapa'
    end
    object RelATApessoa: TStringField
      FieldName = 'pessoa'
      Size = 150
    end
    object RelATAnchapa: TStringField
      FieldName = 'nchapa'
      Size = 60
    end
    object RelATAqtde_votos: TIntegerField
      FieldName = 'qtde_votos'
    end
    object RelATAvotantesstr: TStringField
      FieldName = 'votantesstr'
      Size = 150
    end
    object RelATAchapastr: TStringField
      FieldName = 'chapastr'
      Size = 150
    end
    object RelATAbrancostr: TStringField
      FieldName = 'brancostr'
      Size = 150
    end
    object RelATAvotosstr: TStringField
      FieldName = 'votosstr'
      Size = 150
    end
  end
  object RelImpressaoTicket: TClientDataSet
    PersistDataPacket.Data = {
      660100009619E0BD01000000180000000D00000000000300000066010969645F
      7469636B657404000100000000000576616C6F7208000400000000000A76616C
      6F725F7265616C010049000000010005574944544802000200BE000D636F6469
      676F696E7465726E6F0400010000000000096D6174726963756C610400010000
      0000000A73656372657461726961010049000000010005574944544802000200
      5A000B64617461656D697373616F04000600000000000B6D6573646573636F6E
      746F0100490000000100055749445448020002003C000C6D6573706167616D65
      6E746F0100490000000100055749445448020002003C000A666F726E65636564
      6F72010049000000010005574944544802000200BE000D636F6469676F5F7469
      636B65740400010000000000096173736F636961646F01004900000001000557
      4944544802000200BE00096E6D7573756172696F010049000000010005574944
      5448020002003C000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_ticket'
        DataType = ftInteger
      end
      item
        Name = 'valor'
        DataType = ftFloat
      end
      item
        Name = 'valor_real'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'codigointerno'
        DataType = ftInteger
      end
      item
        Name = 'matricula'
        DataType = ftInteger
      end
      item
        Name = 'secretaria'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'dataemissao'
        DataType = ftDate
      end
      item
        Name = 'mesdesconto'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'mespagamento'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'fornecedor'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'codigo_ticket'
        DataType = ftInteger
      end
      item
        Name = 'associado'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'nmusuario'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 568
    Top = 192
    object RelImpressaoTicketid_ticket: TIntegerField
      FieldName = 'id_ticket'
    end
    object RelImpressaoTicketvalor: TFloatField
      FieldName = 'valor'
    end
    object RelImpressaoTicketvalor_real: TStringField
      FieldName = 'valor_real'
      Size = 190
    end
    object RelImpressaoTicketcodigointerno: TIntegerField
      FieldName = 'codigointerno'
    end
    object RelImpressaoTicketmatricula: TIntegerField
      FieldName = 'matricula'
    end
    object RelImpressaoTicketsecretaria: TStringField
      FieldName = 'secretaria'
      Size = 90
    end
    object RelImpressaoTicketdataemissao: TDateField
      FieldName = 'dataemissao'
    end
    object RelImpressaoTicketmesdesconto: TStringField
      FieldName = 'mesdesconto'
      Size = 60
    end
    object RelImpressaoTicketmespagamento: TStringField
      FieldName = 'mespagamento'
      Size = 60
    end
    object RelImpressaoTicketfornecedor: TStringField
      FieldName = 'fornecedor'
      Size = 190
    end
    object RelImpressaoTicketcodigo_ticket: TIntegerField
      FieldName = 'codigo_ticket'
    end
    object RelImpressaoTicketassociado: TStringField
      FieldName = 'associado'
      Size = 190
    end
    object RelImpressaoTicketnmusuario: TStringField
      FieldName = 'nmusuario'
      Size = 60
    end
  end
  object RelTicket: TClientDataSet
    PersistDataPacket.Data = {
      3C0100009619E0BD01000000180000000D0000000000030000003C010969645F
      7469636B65740400010000000000096474656D697373616F0400060000000000
      0C6E756D65726F7469636B657404000100000000000A6474646573636F6E746F
      04000600000000000B6474706167616D656E746F040006000000000009766C72
      7469636B6574080004000000000008736974756163616F010049000000010005
      5749445448020002001400036F62730200490000000100055749445448020002
      00F401076173736E6F6D65010049000000010005574944544802000200BE000C
      6173736D6174726963756C61040001000000000009617373636F6469676F0400
      01000000000007636F6E6E6F6D65010049000000010005574944544802000200
      BE00077365636E6F6D650100490000000100055749445448020002003C000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 248
    object RelTicketid_ticket: TIntegerField
      FieldName = 'id_ticket'
    end
    object RelTicketdtemissao: TDateField
      FieldName = 'dtemissao'
    end
    object RelTicketnumeroticket: TIntegerField
      FieldName = 'numeroticket'
    end
    object RelTicketdtdesconto: TDateField
      FieldName = 'dtdesconto'
    end
    object RelTicketdtpagamento: TDateField
      FieldName = 'dtpagamento'
    end
    object RelTicketvlrticket: TFloatField
      FieldName = 'vlrticket'
    end
    object RelTicketsituacao: TStringField
      FieldName = 'situacao'
    end
    object RelTicketobs: TStringField
      FieldName = 'obs'
      Size = 500
    end
    object RelTicketassnome: TStringField
      FieldName = 'assnome'
      Size = 190
    end
    object RelTicketassmatricula: TIntegerField
      FieldName = 'assmatricula'
    end
    object RelTicketasscodigo: TIntegerField
      FieldName = 'asscodigo'
    end
    object RelTicketconnome: TStringField
      FieldName = 'connome'
      Size = 190
    end
    object RelTicketsecnome: TStringField
      FieldName = 'secnome'
      Size = 60
    end
  end
  object RelTicketTotalizado: TClientDataSet
    PersistDataPacket.Data = {
      A30000009619E0BD010000001800000006000000000003000000A30009617373
      636F6469676F04000100000000000C6173736D6174726963756C610400010000
      000000076173736E6F6D65010049000000010005574944544802000200BE0007
      7365636E6F6D650100490000000100055749445448020002003C0005746F7461
      6C080004000000000007636F6E6E6F6D65010049000000010005574944544802
      000200BE000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 304
    object RelTicketTotalizadoasscodigo: TIntegerField
      FieldName = 'asscodigo'
    end
    object RelTicketTotalizadoassmatricula: TIntegerField
      FieldName = 'assmatricula'
    end
    object RelTicketTotalizadoassnome: TStringField
      FieldName = 'assnome'
      Size = 190
    end
    object RelTicketTotalizadosecnome: TStringField
      FieldName = 'secnome'
      Size = 60
    end
    object RelTicketTotalizadototal: TFloatField
      FieldName = 'total'
    end
    object RelTicketTotalizadoconnome: TStringField
      FieldName = 'connome'
      Size = 190
    end
  end
end
