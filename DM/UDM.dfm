object DM: TDM
  OnCreate = DataModuleCreate
  Height = 800
  Width = 1297
  object TabConSede: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
  end
  object TabConsSocio: TClientDataSet
    PersistDataPacket.Data = {
      A70100009619E0BD010000001800000010000000000003000000A7010869645F
      736F63696F040001000000000006636F6469676F0400010000000000096D6174
      726963756C61040001000000000008736974756163616F010049000000010005
      5749445448020002001E00046E6F6D6501004900000001000557494454480200
      0200BE00076170656C69646F0100490000000100055749445448020002007800
      0363706601004900000001000557494454480200020014000874656C65666F6E
      6501004900000001000557494454480200020014000763656C756C6172010049
      0000000100055749445448020002001400087768617473617070010049000000
      010005574944544802000200140005656D61696C010049000000010005574944
      544802000200BE0008636C695F7469706F010049000000010005574944544802
      0002000A000D636F64666F726E656365646F72040001000000000007636C6965
      6E746501004900000001000557494454480200020001000A666F726E65636564
      6F7201004900000001000557494454480200020001000A6E617363696D656E74
      6F04000600000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 56
    object TabConsSocioid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabConsSociocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsSociomatricula: TIntegerField
      FieldName = 'matricula'
    end
    object TabConsSociosituacao: TStringField
      FieldName = 'situacao'
      Size = 30
    end
    object TabConsSocionome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object TabConsSocioapelido: TStringField
      FieldName = 'apelido'
      Size = 120
    end
    object TabConsSociocpf: TStringField
      FieldName = 'cpf'
    end
    object TabConsSociotelefone: TStringField
      FieldName = 'telefone'
    end
    object TabConsSociocelular: TStringField
      FieldName = 'celular'
    end
    object TabConsSociowhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object TabConsSocioemail: TStringField
      FieldName = 'email'
      Size = 190
    end
    object TabConsSociocli_tipo: TStringField
      FieldName = 'cli_tipo'
      Size = 10
    end
    object TabConsSociocodfornecedor: TIntegerField
      FieldName = 'codfornecedor'
    end
    object TabConsSociocliente: TStringField
      FieldName = 'cliente'
      Size = 1
    end
    object TabConsSociofornecedor: TStringField
      FieldName = 'fornecedor'
      Size = 1
    end
    object TabConsSocionascimento: TDateField
      FieldName = 'nascimento'
    end
  end
  object TabCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 56
  end
  object TabSede: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
  end
  object TabConsUsuario: TClientDataSet
    PersistDataPacket.Data = {
      160100009619E0BD01000000180000000B00000000000300000016010A69645F
      7573756172696F0400010000000000046E6F6D65010049000000010005574944
      5448020002003C00056C6F67696E010049000000010005574944544802000200
      2D000A69645F656D707265736104000100000000000769645F73656465040001
      00000000000573656E6861010049000000010005574944544802000200FA0005
      617469766F010049000000010005574944544802000200010005656D61696C01
      0049000000010005574944544802000200B4000773697374656D610100490000
      0001000557494454480200020001000969645F70657266696C04000100000000
      000E69645F66756E63696F6E6172696F04000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 112
    object TabConsUsuarioid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object TabConsUsuarionome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object TabConsUsuariologin: TStringField
      FieldName = 'login'
      Size = 45
    end
    object TabConsUsuarioid_empresa: TIntegerField
      FieldName = 'id_empresa'
    end
    object TabConsUsuarioid_sede: TIntegerField
      FieldName = 'id_sede'
    end
    object TabConsUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 250
    end
    object TabConsUsuarioativo: TStringField
      FieldName = 'ativo'
      Size = 1
    end
    object TabConsUsuarioemail: TStringField
      FieldName = 'email'
      Size = 180
    end
    object TabConsUsuariosistema: TStringField
      FieldName = 'sistema'
      Size = 1
    end
    object TabConsUsuarioid_perfil: TIntegerField
      FieldName = 'id_perfil'
    end
    object TabConsUsuarioid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
  end
  object TabConsPerfil: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 56
  end
  object TabConChapa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 168
  end
  object TabConsEleicao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 112
  end
  object TabConsCandidatos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 224
  end
  object TabCandidato: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 56
  end
  object ACBrCEP: TACBrCEP
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
    WebService = wsRepublicaVirtual
    ChaveAcesso = '1STa9eKhhfKvc7Ljh6W6CO5Kr/bFOl.'
    PesquisarIBGE = True
    OnBuscaEfetuada = ACBrCEPBuscaEfetuada
    Left = 632
    Top = 600
  end
  object TabConsMembro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 280
  end
  object TabConsCampanha: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 336
  end
  object TabEleicao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 112
  end
  object TabConsMarca: TClientDataSet
    PersistDataPacket.Data = {
      6E0000009619E0BD0100000018000000040000000000030000006E000869645F
      6D61726361040001000000000006636F6469676F0400010000000000056D6172
      63610100490000000100055749445448020002003C0005617469766F01004900
      000001000557494454480200020003000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 640
    object TabConsMarcaid_marca: TIntegerField
      FieldName = 'id_marca'
    end
    object TabConsMarcacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsMarcamarca: TStringField
      FieldName = 'marca'
      Size = 60
    end
    object TabConsMarcaativo: TStringField
      FieldName = 'ativo'
      Size = 3
    end
  end
  object TabConsGrupo: TClientDataSet
    PersistDataPacket.Data = {
      870000009619E0BD01000000180000000500000000000300000087000869645F
      677275706F040001000000000006636F6469676F040001000000000005677275
      706F0100490000000100055749445448020002003C0005617469766F01004900
      00000100055749445448020002000500047469706F0100490000000100055749
      4454480200020001000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_grupo'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'grupo'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'tipo'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 640
    Top = 56
    object TabConsGrupoid_grupo: TIntegerField
      FieldName = 'id_grupo'
    end
    object TabConsGrupocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsGrupogrupo: TStringField
      FieldName = 'grupo'
      Size = 60
    end
    object TabConsGrupoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabConsGrupotipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
  object TabConsUnidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 112
  end
  object TabConsLocalizacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 168
  end
  object TabConsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
  end
  object TabConsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 224
  end
  object TabMarca: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 168
  end
  object TabGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 224
  end
  object TabUnidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 280
  end
  object TabLocalizacao: TClientDataSet
    PersistDataPacket.Data = {
      600000009619E0BD01000000180000000300000000000300000060000E69645F
      6C6F63616C697A6163616F040001000000000006636F6469676F040001000000
      00000B6C6F63616C697A6163616F010049000000010005574944544802000200
      5A000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 336
    object TabLocalizacaoid_localizacao: TIntegerField
      FieldName = 'id_localizacao'
    end
    object TabLocalizacaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabLocalizacaolocalizacao: TStringField
      FieldName = 'localizacao'
      Size = 90
    end
  end
  object TabCliente: TClientDataSet
    PersistDataPacket.Data = {
      5F0000009619E0BD0100000018000000030000000000030000005F000869645F
      736F63696F040001000000000007636C69656E74650100490000000100055749
      44544802000200BE000363706601004900000001000557494454480200020014
      000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 392
    object TabClienteid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabClientecliente: TStringField
      FieldName = 'cliente'
      Size = 190
    end
    object TabClientecpf: TStringField
      FieldName = 'cpf'
    end
  end
  object TabVendedor: TClientDataSet
    PersistDataPacket.Data = {
      620000009619E0BD01000000180000000300000000000300000062000E69645F
      66756E63696F6E6172696F04000100000000000466756E630100490000000100
      05574944544802000200BE000363706601004900000001000557494454480200
      020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 448
    object TabVendedorid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object TabVendedorfunc: TStringField
      FieldName = 'func'
      Size = 190
    end
    object TabVendedorcpf: TStringField
      FieldName = 'cpf'
    end
  end
  object TabPrazoPag: TClientDataSet
    PersistDataPacket.Data = {
      710000009619E0BD01000000180000000400000000000300000071000869645F
      7072617A6F040001000000000006636F6469676F040001000000000009646573
      63726963616F0100490000000100055749445448020002005A00047469706F01
      004900000001000557494454480200020001000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 504
    object TabPrazoPagid_prazo: TIntegerField
      FieldName = 'id_prazo'
    end
    object TabPrazoPagcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabPrazoPagdescricao: TStringField
      FieldName = 'descricao'
      Size = 90
    end
    object TabPrazoPagtipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
  object TabProdutoPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 560
  end
  object TabItensPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 560
  end
  object TabConsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 560
  end
  object TabConsFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 280
  end
  object TabConsPrazoPag: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 336
  end
  object TabConsPedidoItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 616
  end
  object TabVotos: TClientDataSet
    PersistDataPacket.Data = {
      530000009619E0BD010000001800000003000000000003000000530005766F74
      6F73040001000000000005636861706101004900000001000557494454480200
      02005A0008736F6D61766F746F04000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'votos'
        DataType = ftInteger
      end
      item
        Name = 'chapa'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'somavoto'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 168
    object TabVotosvotos: TIntegerField
      FieldName = 'votos'
    end
    object TabVotoschapa: TStringField
      FieldName = 'chapa'
      Size = 90
    end
    object TabVotossomavoto: TIntegerField
      FieldName = 'somavoto'
    end
  end
  object TotalAssociado: TClientDataSet
    PersistDataPacket.Data = {
      280000009619E0BD010000001800000001000000000003000000280005746F74
      616C04000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 224
    object TotalAssociadototal: TIntegerField
      FieldName = 'total'
    end
  end
  object TabTotalVotos: TClientDataSet
    PersistDataPacket.Data = {
      280000009619E0BD010000001800000001000000000003000000280005746F74
      616C04000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'total'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 288
    object TabTotalVotostotal: TIntegerField
      FieldName = 'total'
    end
  end
  object TabTotalVotoBranco: TClientDataSet
    PersistDataPacket.Data = {
      280000009619E0BD010000001800000001000000000003000000280005746F74
      616C04000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 344
    object TabTotalVotoBrancototal: TIntegerField
      FieldName = 'total'
    end
  end
  object TabTotalVotoNulo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 400
    object TabTotalVotoNulototal: TIntegerField
      FieldName = 'total'
    end
  end
  object TabTotalVotoDepartamento: TClientDataSet
    PersistDataPacket.Data = {
      4F0000009619E0BD0100000018000000020000000000030000004F000C646570
      617274616D656E746F0100490000000100055749445448020002003C000B746F
      74616C5F766F746F7304000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 456
    object TabTotalVotoDepartamentodepartamento: TStringField
      FieldName = 'departamento'
      Size = 60
    end
    object TabTotalVotoDepartamentototal_votos: TIntegerField
      FieldName = 'total_votos'
    end
  end
  object TabNaoVotaram: TClientDataSet
    PersistDataPacket.Data = {
      280000009619E0BD010000001800000001000000000003000000280005746F74
      616C04000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'total'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 520
    object TabNaoVotaramtotal: TIntegerField
      FieldName = 'total'
    end
  end
  object TabConsSecretaria: TClientDataSet
    PersistDataPacket.Data = {
      900000009619E0BD01000000180000000500000000000300000090000D69645F
      73656372657461726961040001000000000006636F6469676F04000100000000
      000572617A616F01004900000001000557494454480200020078000866616E74
      61736961010049000000010005574944544802000200780005617469766F0100
      4900000001000557494454480200020005000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 400
    object TabConsSecretariaid_secretaria: TIntegerField
      FieldName = 'id_secretaria'
    end
    object TabConsSecretariacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsSecretariarazao: TStringField
      FieldName = 'razao'
      Size = 120
    end
    object TabConsSecretariafantasia: TStringField
      FieldName = 'fantasia'
      Size = 120
    end
    object TabConsSecretariaativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
  end
  object TabSecretaria: TClientDataSet
    PersistDataPacket.Data = {
      770000009619E0BD01000000180000000400000000000300000077000D69645F
      73656372657461726961040001000000000006636F6469676F04000100000000
      000572617A616F0100490000000100055749445448020002007800096E706573
      717569736101004900000001000557494454480200020078000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_secretaria'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'razao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 392
    Top = 400
    object TabSecretariaid_secretaria: TIntegerField
      FieldName = 'id_secretaria'
    end
    object TabSecretariacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSecretariarazao: TStringField
      FieldName = 'razao'
      Size = 120
    end
    object TabSecretarianpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 120
    end
  end
  object TabConsSocioWhats: TClientDataSet
    PersistDataPacket.Data = {
      A70100009619E0BD010000001800000010000000000003000000A7010869645F
      736F63696F040001000000000006636F6469676F0400010000000000096D6174
      726963756C61040001000000000008736974756163616F010049000000010005
      5749445448020002001E00046E6F6D6501004900000001000557494454480200
      0200BE00076170656C69646F0100490000000100055749445448020002007800
      0363706601004900000001000557494454480200020014000874656C65666F6E
      6501004900000001000557494454480200020014000763656C756C6172010049
      0000000100055749445448020002001400087768617473617070010049000000
      010005574944544802000200140005656D61696C010049000000010005574944
      544802000200BE0008636C695F7469706F010049000000010005574944544802
      0002000A000D636F64666F726E656365646F72040001000000000007636C6965
      6E746501004900000001000557494454480200020001000A6E617363696D656E
      746F04000600000000000A666F726E656365646F720100490000000100055749
      4454480200020001000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_socio'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'matricula'
        DataType = ftInteger
      end
      item
        Name = 'situacao'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'apelido'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'telefone'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'celular'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'whatsapp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'email'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'cli_tipo'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'codfornecedor'
        DataType = ftInteger
      end
      item
        Name = 'cliente'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'nascimento'
        DataType = ftDate
      end
      item
        Name = 'fornecedor'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 32
    Top = 472
    object TabConsSocioWhatsid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabConsSocioWhatscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsSocioWhatsmatricula: TIntegerField
      FieldName = 'matricula'
    end
    object TabConsSocioWhatssituacao: TStringField
      FieldName = 'situacao'
      Size = 30
    end
    object TabConsSocioWhatsnome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object TabConsSocioWhatsapelido: TStringField
      FieldName = 'apelido'
      Size = 120
    end
    object TabConsSocioWhatscpf: TStringField
      FieldName = 'cpf'
    end
    object TabConsSocioWhatstelefone: TStringField
      FieldName = 'telefone'
    end
    object TabConsSocioWhatscelular: TStringField
      FieldName = 'celular'
    end
    object TabConsSocioWhatswhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object TabConsSocioWhatsemail: TStringField
      FieldName = 'email'
      Size = 190
    end
    object TabConsSocioWhatscli_tipo: TStringField
      FieldName = 'cli_tipo'
      Size = 10
    end
    object TabConsSocioWhatscodfornecedor: TIntegerField
      FieldName = 'codfornecedor'
    end
    object TabConsSocioWhatscliente: TStringField
      FieldName = 'cliente'
      Size = 1
    end
    object TabConsSocioWhatsnascimento: TDateField
      FieldName = 'nascimento'
    end
    object TabConsSocioWhatsfornecedor: TStringField
      FieldName = 'fornecedor'
      Size = 1
    end
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormaEmissao = teContingencia
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoDF = ve200
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 15000
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Configuracoes.WebServices.TimeOut = 20000
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = ACBrNFeDANFeRL1
    Left = 714
    Top = 623
  end
  object TabManifesto: TClientDataSet
    PersistDataPacket.Data = {
      300100009619E0BD01000000180000000C000000000003000000300102696404
      00010000000000066E756D65726F010049000000010005574944544802000200
      0A000563686176650100490000000100055749445448020002002C0005736572
      69650100490000000100055749445448020002000300046E6F6D650100490000
      00010005574944544802000200B40004636E706A010049000000010005574944
      5448020002001400036E73750100490000000100055749445448020002001400
      0576616C6F7208000400000000000A64745F656E747261646104000600000000
      000A64745F656D697373616F040006000000000008736974756163616F010049
      000000010005574944544802000200280003786D6C04004B0000000100075355
      425459504502004900070042696E617279000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 512
    object TabManifestoid: TIntegerField
      FieldName = 'id'
    end
    object TabManifestonumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object TabManifestochave: TStringField
      FieldName = 'chave'
      Size = 44
    end
    object TabManifestoserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object TabManifestonome: TStringField
      FieldName = 'nome'
      Size = 180
    end
    object TabManifestocnpj: TStringField
      FieldName = 'cnpj'
    end
    object TabManifestonsu: TStringField
      FieldName = 'nsu'
    end
    object TabManifestovalor: TFloatField
      FieldName = 'valor'
    end
    object TabManifestodt_entrada: TDateField
      FieldName = 'dt_entrada'
    end
    object TabManifestodt_emissao: TDateField
      FieldName = 'dt_emissao'
    end
    object TabManifestosituacao: TStringField
      FieldName = 'situacao'
      Size = 40
    end
    object TabManifestoxml: TBlobField
      FieldName = 'xml'
    end
  end
  object TabConsTipoPlano: TClientDataSet
    PersistDataPacket.Data = {
      8A0000009619E0BD0100000018000000050000000000030000008A000769645F
      7469706F040001000000000006636F6469676F0400010000000000047469706F
      0100490000000100055749445448020002002D000964657363726963616F0200
      49000000010005574944544802000200FF0005617469766F0100490000000100
      0557494454480200020005000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 816
    Top = 8
    object TabConsTipoPlanoid_tipo: TIntegerField
      FieldName = 'id_tipo'
    end
    object TabConsTipoPlanocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsTipoPlanotipo: TStringField
      FieldName = 'tipo'
      Size = 45
    end
    object TabConsTipoPlanodescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
    object TabConsTipoPlanoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
  end
  object TabTipoPlano: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 920
    Top = 8
  end
  object TabGrupoPlano: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 920
    Top = 64
  end
  object TabConsPlanoConta: TClientDataSet
    PersistDataPacket.Data = {
      040100009619E0BD01000000180000000900000000000300000004010D69645F
      706C616E6F636F6E7461040001000000000006636F6469676F01004900000001
      000557494454480200020014000964657363726963616F020049000000010005
      574944544802000200FF001069645F737562677275706F706C616E6F04000100
      000000000C73616C646F696E696369616C080004000000000005617469766F01
      00490000000100055749445448020002000100096E737562677275706F020049
      000000010005574944544802000200FF00066E677275706F0200490000000100
      05574944544802000200FF00056E7469706F0200490000000100055749445448
      02000200FF000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_planoconta'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'id_subgrupoplano'
        DataType = ftInteger
      end
      item
        Name = 'saldoinicial'
        DataType = ftFloat
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'nsubgrupo'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ngrupo'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ntipo'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 816
    Top = 64
    object TabConsPlanoContaid_planoconta: TIntegerField
      FieldName = 'id_planoconta'
    end
    object TabConsPlanoContacodigo: TStringField
      FieldName = 'codigo'
    end
    object TabConsPlanoContadescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
    object TabConsPlanoContaid_subgrupoplano: TIntegerField
      FieldName = 'id_subgrupoplano'
    end
    object TabConsPlanoContasaldoinicial: TFloatField
      FieldName = 'saldoinicial'
    end
    object TabConsPlanoContaativo: TStringField
      FieldName = 'ativo'
      Size = 1
    end
    object TabConsPlanoContansubgrupo: TStringField
      FieldName = 'nsubgrupo'
      Size = 255
    end
    object TabConsPlanoContangrupo: TStringField
      FieldName = 'ngrupo'
      Size = 255
    end
    object TabConsPlanoContantipo: TStringField
      FieldName = 'ntipo'
      Size = 255
    end
  end
  object TabSubGrupo: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 920
    Top = 120
  end
  object TabPlanoConta: TClientDataSet
    PersistDataPacket.Data = {
      E30000009619E0BD010000001800000008000000000003000000E30002696404
      0001000000000006636F6469676F04000100000000000964657363726963616F
      0100490000000100055749445448020002003C0005617469766F010049000000
      0100055749445448020002000500096E737562706C616E6F0100490000000100
      055749445448020002003C000B6E677275706F706C616E6F0100490000000100
      055749445448020002003C000A6E7469706F706C616E6F010049000000010005
      5749445448020002003C00056E7469706F010049000000010005574944544802
      0002000F000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nsubplano'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ngrupoplano'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ntipoplano'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ntipo'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 920
    Top = 176
    object TabPlanoContaid: TIntegerField
      FieldName = 'id'
    end
    object TabPlanoContacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabPlanoContadescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabPlanoContaativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabPlanoContansubplano: TStringField
      FieldName = 'nsubplano'
      Size = 60
    end
    object TabPlanoContangrupoplano: TStringField
      FieldName = 'ngrupoplano'
      Size = 60
    end
    object TabPlanoContantipoplano: TStringField
      FieldName = 'ntipoplano'
      Size = 60
    end
    object TabPlanoContantipo: TStringField
      FieldName = 'ntipo'
      Size = 15
    end
  end
  object TabConsTransportadora: TClientDataSet
    PersistDataPacket.Data = {
      830100009619E0BD01000000180000000E00000000000300000083011169645F
      7472616E73706F727461646F7261040001000000000006636F6469676F040001
      00000000000572617A616F010049000000010005574944544802000200960008
      66616E7461736961010049000000010005574944544802000200C80002696501
      0049000000010005574944544802000200140004616E74740100490000000100
      0557494454480200020014000363657001004900000001000557494454480200
      0200140008656E64657265636F01004900000001000557494454480200020096
      00066E756D65726F010049000000010005574944544802000200140006626169
      72726F0100490000000100055749445448020002005A000B636F6D706C656D65
      6E746F0100490000000100055749445448020002005A0005656D61696C020049
      000000010005574944544802000200FF00066369646164650100490000000100
      055749445448020002005A0004636E706A010049000000010005574944544802
      00020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_transportadora'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'razao'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'fantasia'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ie'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'antt'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cep'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'endereco'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'numero'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'bairro'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'complemento'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'email'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'cnpj'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 824
    Top = 192
    object TabConsTransportadoraid_transportadora: TIntegerField
      FieldName = 'id_transportadora'
    end
    object TabConsTransportadoracodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsTransportadorarazao: TStringField
      FieldName = 'razao'
      Size = 150
    end
    object TabConsTransportadorafantasia: TStringField
      FieldName = 'fantasia'
      Size = 200
    end
    object TabConsTransportadoraie: TStringField
      FieldName = 'ie'
    end
    object TabConsTransportadoraantt: TStringField
      FieldName = 'antt'
    end
    object TabConsTransportadoracep: TStringField
      FieldName = 'cep'
    end
    object TabConsTransportadoraendereco: TStringField
      FieldName = 'endereco'
      Size = 150
    end
    object TabConsTransportadoranumero: TStringField
      FieldName = 'numero'
    end
    object TabConsTransportadorabairro: TStringField
      FieldName = 'bairro'
      Size = 90
    end
    object TabConsTransportadoracomplemento: TStringField
      FieldName = 'complemento'
      Size = 90
    end
    object TabConsTransportadoraemail: TStringField
      FieldName = 'email'
      Size = 255
    end
    object TabConsTransportadoracidade: TStringField
      FieldName = 'cidade'
      Size = 90
    end
    object TabConsTransportadoracnpj: TStringField
      FieldName = 'cnpj'
    end
  end
  object TabConsContas: TClientDataSet
    PersistDataPacket.Data = {
      980000009619E0BD010000001800000006000000000003000000980002696404
      0001000000000006636F6469676F0400010000000000076167656E6369610100
      490000000100055749445448020002000A0005636F6E74610100490000000100
      055749445448020002000A000B636F7272656E74697374610200490000000100
      05574944544802000200FF000573616C646F08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 824
    Top = 256
    object TabConsContasid: TIntegerField
      FieldName = 'id'
    end
    object TabConsContascodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsContasagencia: TStringField
      FieldName = 'agencia'
      Size = 10
    end
    object TabConsContasconta: TStringField
      FieldName = 'conta'
      Size = 10
    end
    object TabConsContascorrentista: TStringField
      FieldName = 'correntista'
      Size = 255
    end
    object TabConsContassaldo: TFloatField
      FieldName = 'saldo'
    end
  end
  object TabConsLivroCaixa: TClientDataSet
    PersistDataPacket.Data = {
      D90000009619E0BD01000000180000000B000000000003000000D90002696404
      0001000000000006636F6469676F040001000000000004646174610400060000
      000000086F7065726163616F0100490000000100055749445448020002002800
      03646F630100490000000100055749445448020002002D0004766C7265080004
      000000000004766C727308000400000000000573616C646F0800040000000000
      09686973746F7269636F010049000000010005574944544802000200FA000576
      616C6F720800040000000000066E73616C646F08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'data'
        DataType = ftDate
      end
      item
        Name = 'operacao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'doc'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'vlre'
        DataType = ftFloat
      end
      item
        Name = 'vlrs'
        DataType = ftFloat
      end
      item
        Name = 'saldo'
        DataType = ftFloat
      end
      item
        Name = 'historico'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'valor'
        DataType = ftFloat
      end
      item
        Name = 'nsaldo'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 824
    Top = 320
    object TabConsLivroCaixaid: TIntegerField
      FieldName = 'id'
    end
    object TabConsLivroCaixacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsLivroCaixadata: TDateField
      FieldName = 'data'
    end
    object TabConsLivroCaixaoperacao: TStringField
      FieldName = 'operacao'
      Size = 40
    end
    object TabConsLivroCaixadoc: TStringField
      FieldName = 'doc'
      Size = 45
    end
    object TabConsLivroCaixavlre: TFloatField
      FieldName = 'vlre'
    end
    object TabConsLivroCaixavlrs: TFloatField
      FieldName = 'vlrs'
    end
    object TabConsLivroCaixasaldo: TFloatField
      FieldName = 'saldo'
    end
    object TabConsLivroCaixahistorico: TStringField
      FieldName = 'historico'
      Size = 250
    end
    object TabConsLivroCaixavalor: TFloatField
      FieldName = 'valor'
    end
    object TabConsLivroCaixansaldo: TFloatField
      FieldName = 'nsaldo'
    end
  end
  object TabCusto: TClientDataSet
    PersistDataPacket.Data = {
      520000009619E0BD010000001800000003000000000003000000520002696404
      0001000000000006636F6469676F04000100000000000964657363726963616F
      0100490000000100055749445448020002003C000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 920
    Top = 240
    object TabCustoid: TIntegerField
      FieldName = 'id'
    end
    object TabCustocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabCustodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
  end
  object ACBrNFeDANFeRL1: TACBrNFeDANFeRL
    MostraStatus = False
    Sistema = 'ConeSul Sistemas - www.conesulsistemas.com.br'
    Usuario = 'ConeSul'
    MargemInferior = 0.700000000000000000
    MargemSuperior = 0.700000000000000000
    MargemEsquerda = 0.700000000000000000
    MargemDireita = 0.700000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 4
    CasasDecimais.vUnCom = 4
    CasasDecimais.MaskqCom = '###,###,###,##0.00'
    CasasDecimais.MaskvUnCom = '###,###,###,##0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrNFe = ACBrNFe1
    PosCanhotoLayout = prlBarra
    ExibeResumoCanhoto = False
    ExibeCampoFatura = False
    Left = 779
    Top = 575
  end
  object TabConsMensagem: TClientDataSet
    PersistDataPacket.Data = {
      CC0000009619E0BD010000001800000007000000000003000000CC000B69645F
      6D656E736167656D040001000000000006636F6469676F040001000000000009
      64657363726963616F0100490000000100055749445448020002005A00056174
      69766F01004900000001000557494454480200020001000375736F0100490000
      000100055749445448020002002D000D617373756E746F5F656D61696C010049
      0000000100055749445448020002007800086D656E736167656D020049000000
      010005574944544802000200F4010000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 392
    object TabConsMensagemid_mensagem: TIntegerField
      FieldName = 'id_mensagem'
    end
    object TabConsMensagemcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsMensagemdescricao: TStringField
      FieldName = 'descricao'
      Size = 90
    end
    object TabConsMensagemativo: TStringField
      FieldName = 'ativo'
      Size = 1
    end
    object TabConsMensagemuso: TStringField
      FieldName = 'uso'
      Size = 45
    end
    object TabConsMensagemassunto_email: TStringField
      FieldName = 'assunto_email'
      Size = 120
    end
    object TabConsMensagemmensagem: TStringField
      FieldName = 'mensagem'
      Size = 500
    end
  end
  object TabMensagem: TClientDataSet
    PersistDataPacket.Data = {
      CC0000009619E0BD010000001800000007000000000003000000CC000B69645F
      6D656E736167656D040001000000000006636F6469676F040001000000000009
      64657363726963616F0100490000000100055749445448020002005A00056174
      69766F01004900000001000557494454480200020001000375736F0100490000
      000100055749445448020002002D000D617373756E746F5F656D61696C010049
      0000000100055749445448020002007800086D656E736167656D020049000000
      010005574944544802000200F4010000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_mensagem'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'uso'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'assunto_email'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'mensagem'
        DataType = ftString
        Size = 500
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 640
    Top = 448
    object TabMensagemid_mensagem: TIntegerField
      FieldName = 'id_mensagem'
    end
    object TabMensagemcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabMensagemdescricao: TStringField
      FieldName = 'descricao'
      Size = 90
    end
    object TabMensagemativo: TStringField
      FieldName = 'ativo'
      Size = 1
    end
    object TabMensagemuso: TStringField
      FieldName = 'uso'
      Size = 45
    end
    object TabMensagemassunto_email: TStringField
      FieldName = 'assunto_email'
      Size = 120
    end
    object TabMensagemmensagem: TStringField
      FieldName = 'mensagem'
      Size = 500
    end
  end
  object TabRelacaoAniversariante: TClientDataSet
    PersistDataPacket.Data = {
      BB0000009619E0BD010000001800000007000000000003000000BB000869645F
      736F63696F040001000000000006636F6469676F0400010000000000046E6F6D
      65010049000000010005574944544802000200BE00076170656C69646F010049
      000000010005574944544802000200BE000763656C756C617201004900000001
      0005574944544802000200140008776861747361707001004900000001000557
      494454480200020014000A6E617363696D656E746F04000600000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1040
    Top = 8
    object TabRelacaoAniversarianteid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabRelacaoAniversariantecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabRelacaoAniversariantenome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object TabRelacaoAniversarianteapelido: TStringField
      FieldName = 'apelido'
      Size = 190
    end
    object TabRelacaoAniversariantecelular: TStringField
      FieldName = 'celular'
    end
    object TabRelacaoAniversariantewhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object TabRelacaoAniversariantenascimento: TDateField
      FieldName = 'nascimento'
    end
  end
  object TabUsuario: TClientDataSet
    PersistDataPacket.Data = {
      910000009619E0BD01000000180000000500000000000300000091000A69645F
      7573756172696F0400010000000000046E6F6D65010049000000010005574944
      5448020002003C00056C6F67696E010049000000010005574944544802000200
      2D000573656E6861010049000000010005574944544802000200FA000E69645F
      66756E63696F6E6172696F04000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 168
    object TabUsuarioid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object TabUsuarionome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object TabUsuariologin: TStringField
      FieldName = 'login'
      Size = 45
    end
    object TabUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 250
    end
    object TabUsuarioid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
  end
  object TabConsSindEmpresa: TClientDataSet
    PersistDataPacket.Data = {
      890000009619E0BD01000000180000000500000000000300000089000F73696E
      645F69645F656D7072657361040001000000000006636F6469676F0400010000
      0000000964657363726963616F010049000000010005574944544802000200BE
      000769645F73656465040001000000000005617469766F010049000000010005
      57494454480200020005000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 232
    object TabConsSindEmpresasind_id_empresa: TIntegerField
      FieldName = 'sind_id_empresa'
    end
    object TabConsSindEmpresacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsSindEmpresadescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabConsSindEmpresaid_sede: TIntegerField
      FieldName = 'id_sede'
    end
    object TabConsSindEmpresaativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
  end
  object TabConsSindProfissao: TClientDataSet
    PersistDataPacket.Data = {
      760000009619E0BD01000000180000000400000000000300000076000C69645F
      70726F66697373616F040001000000000006636F6469676F0400010000000000
      0964657363726963616F010049000000010005574944544802000200BE000561
      7469766F01004900000001000557494454480200020005000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 288
    object TabConsSindProfissaoid_profissao: TIntegerField
      FieldName = 'id_profissao'
    end
    object TabConsSindProfissaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsSindProfissaodescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabConsSindProfissaoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
  end
  object TabConsSindLotacao: TClientDataSet
    PersistDataPacket.Data = {
      740000009619E0BD01000000180000000400000000000300000074000A69645F
      6C6F746163616F040001000000000006636F6469676F04000100000000000964
      657363726963616F010049000000010005574944544802000200BE0005617469
      766F01004900000001000557494454480200020005000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 344
    object TabConsSindLotacaoid_lotacao: TIntegerField
      FieldName = 'id_lotacao'
    end
    object TabConsSindLotacaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsSindLotacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabConsSindLotacaoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
  end
  object TabSindEmpresa: TClientDataSet
    PersistDataPacket.Data = {
      A70000009619E0BD010000001800000006000000000003000000A7000F73696E
      645F69645F656D7072657361040001000000000006636F6469676F0400010000
      0000000964657363726963616F010049000000010005574944544802000200BE
      000769645F73656465040001000000000005617469766F010049000000010005
      5749445448020002000500096E70657371756973610100490000000100055749
      44544802000200BE000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'sind_id_empresa'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'id_sede'
        DataType = ftInteger
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 190
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 392
    Top = 232
    object TabSindEmpresasind_id_empresa: TIntegerField
      FieldName = 'sind_id_empresa'
    end
    object TabSindEmpresacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSindEmpresadescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabSindEmpresaid_sede: TIntegerField
      FieldName = 'id_sede'
    end
    object TabSindEmpresaativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabSindEmpresanpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 190
    end
  end
  object TabSindProfissao: TClientDataSet
    PersistDataPacket.Data = {
      940000009619E0BD01000000180000000500000000000300000094000C69645F
      70726F66697373616F040001000000000006636F6469676F0400010000000000
      0964657363726963616F010049000000010005574944544802000200BE000561
      7469766F0100490000000100055749445448020002000500096E706573717569
      7361010049000000010005574944544802000200BE000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_profissao'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 190
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 392
    Top = 288
    object TabSindProfissaoid_profissao: TIntegerField
      FieldName = 'id_profissao'
    end
    object TabSindProfissaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSindProfissaodescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabSindProfissaoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabSindProfissaonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 190
    end
  end
  object TabSindLotacao: TClientDataSet
    PersistDataPacket.Data = {
      920000009619E0BD01000000180000000500000000000300000092000A69645F
      6C6F746163616F040001000000000006636F6469676F04000100000000000964
      657363726963616F010049000000010005574944544802000200BE0005617469
      766F0100490000000100055749445448020002000500096E7065737175697361
      010049000000010005574944544802000200BE000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_lotacao'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 190
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 392
    Top = 344
    object TabSindLotacaoid_lotacao: TIntegerField
      FieldName = 'id_lotacao'
    end
    object TabSindLotacaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSindLotacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabSindLotacaoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabSindLotacaonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 190
    end
  end
  object TabConsSindDependentes: TClientDataSet
    PersistDataPacket.Data = {
      E10000009619E0BD010000001800000008000000000003000000E1000D69645F
      646570656E64656E7465040001000000000006636F6469676F04000100000000
      00046E6F6D65010049000000010005574944544802000200BE000A706172656E
      746573636F010049000000010005574944544802000200280003637066010049
      0000000100055749445448020002001400047365786F01004900000001000557
      4944544802000200140005617469766F01004900000001000557494454480200
      020005000A4175746F72697A61646F0100490000000100055749445448020002
      0005000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_dependente'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'parentesco'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'sexo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Autorizado'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 496
    Top = 464
    object TabConsSindDependentesid_dependente: TIntegerField
      FieldName = 'id_dependente'
    end
    object TabConsSindDependentescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsSindDependentesnome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object TabConsSindDependentesparentesco: TStringField
      FieldName = 'parentesco'
      Size = 40
    end
    object TabConsSindDependentescpf: TStringField
      FieldName = 'cpf'
    end
    object TabConsSindDependentessexo: TStringField
      FieldName = 'sexo'
    end
    object TabConsSindDependentesativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabConsSindDependentesAutorizado: TStringField
      FieldName = 'Autorizado'
      Size = 5
    end
  end
  object EntradaProduto: TClientDataSet
    PersistDataPacket.Data = {
      E30000009619E0BD01000000180000000A000000000003000000E3000A69645F
      70726F6475746F04000100000000000D717464655F616E746572696F72080004
      00000000000A7072635F636F6D7072610800040000000000097072635F76656E
      6461080004000000000009717464655F6E6F7661080004000000000006636F64
      69676F04000100000000000964657363726963616F0100490000000100055749
      44544802000200BE0003756E640100490000000100055749445448020002000A
      00097174646566696E616C0800040000000000096F7264656D70726F64040001
      00000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_produto'
        DataType = ftInteger
      end
      item
        Name = 'qtde_anterior'
        DataType = ftFloat
      end
      item
        Name = 'prc_compra'
        DataType = ftFloat
      end
      item
        Name = 'prc_venda'
        DataType = ftFloat
      end
      item
        Name = 'qtde_nova'
        DataType = ftFloat
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'und'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'qtdefinal'
        DataType = ftFloat
      end
      item
        Name = 'ordemprod'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ordemprod'
    Params = <>
    StoreDefs = True
    Left = 896
    Top = 568
    object EntradaProdutoid_produto: TIntegerField
      FieldName = 'id_produto'
    end
    object EntradaProdutoqtde_anterior: TFloatField
      FieldName = 'qtde_anterior'
    end
    object EntradaProdutoprc_compra: TFloatField
      FieldName = 'prc_compra'
    end
    object EntradaProdutoprc_venda: TFloatField
      FieldName = 'prc_venda'
    end
    object EntradaProdutoqtde_nova: TFloatField
      FieldName = 'qtde_nova'
    end
    object EntradaProdutocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object EntradaProdutodescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object EntradaProdutound: TStringField
      FieldName = 'und'
      Size = 10
    end
    object EntradaProdutoqtdefinal: TFloatField
      FieldName = 'qtdefinal'
    end
    object EntradaProdutoordemprod: TIntegerField
      FieldName = 'ordemprod'
    end
  end
  object TabConsMovEstoque: TClientDataSet
    PersistDataPacket.Data = {
      000100009619E0BD01000000180000000B00000000000300000000010569646D
      6F7604000100000000000C71746465616A75737461646108000400000000000C
      71746465616E746572696F72080004000000000009707263636F6D7072610800
      0400000000000870726376656E646108000400000000000864617461686F7261
      08000800000000000B6E756D6F7065726163616F04000100000000000B6E6F6D
      6570726F6475746F010049000000010005574944544802000200BE0006636F64
      69676F0400010000000000047469706F01004900000001000557494454480200
      0200320009686973746F7269636F020049000000010005574944544802000200
      F4010000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idmov'
        DataType = ftInteger
      end
      item
        Name = 'qtdeajustada'
        DataType = ftFloat
      end
      item
        Name = 'qtdeanterior'
        DataType = ftFloat
      end
      item
        Name = 'prccompra'
        DataType = ftFloat
      end
      item
        Name = 'prcvenda'
        DataType = ftFloat
      end
      item
        Name = 'datahora'
        DataType = ftDateTime
      end
      item
        Name = 'numoperacao'
        DataType = ftInteger
      end
      item
        Name = 'nomeproduto'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'tipo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'historico'
        DataType = ftString
        Size = 500
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 896
    Top = 528
    object TabConsMovEstoqueidmov: TIntegerField
      FieldName = 'idmov'
    end
    object TabConsMovEstoqueqtdeajustada: TFloatField
      FieldName = 'qtdeajustada'
    end
    object TabConsMovEstoqueqtdeanterior: TFloatField
      FieldName = 'qtdeanterior'
    end
    object TabConsMovEstoqueprccompra: TFloatField
      FieldName = 'prccompra'
    end
    object TabConsMovEstoqueprcvenda: TFloatField
      FieldName = 'prcvenda'
    end
    object TabConsMovEstoquedatahora: TDateTimeField
      FieldName = 'datahora'
    end
    object TabConsMovEstoquenumoperacao: TIntegerField
      FieldName = 'numoperacao'
    end
    object TabConsMovEstoquenomeproduto: TStringField
      FieldName = 'nomeproduto'
      Size = 190
    end
    object TabConsMovEstoquecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsMovEstoquetipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
    object TabConsMovEstoquehistorico: TStringField
      FieldName = 'historico'
      Size = 500
    end
  end
  object TabSaldoEstoque: TClientDataSet
    PersistDataPacket.Data = {
      F40000009619E0BD010000001800000009000000000003000000F4000A69645F
      70726F6475746F04000100000000000C6E6F6D655F70726F6475746F01004900
      0000010005574944544802000200BE0009707263636F6D707261080004000000
      00000870726376656E6461080004000000000006636F6469676F040001000000
      00000A6E6F6D655F6D617263610100490000000100055749445448020002005A
      000C6E6F6D655F756E6964616465010049000000010005574944544802000200
      05000A6E6F6D655F677275706F0100490000000100055749445448020002005A
      000C73616C646F6573746F71756508000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 992
    Top = 528
    object TabSaldoEstoqueid_produto: TIntegerField
      FieldName = 'id_produto'
    end
    object TabSaldoEstoquenome_produto: TStringField
      FieldName = 'nome_produto'
      Size = 190
    end
    object TabSaldoEstoqueprccompra: TFloatField
      FieldName = 'prccompra'
    end
    object TabSaldoEstoqueprcvenda: TFloatField
      FieldName = 'prcvenda'
    end
    object TabSaldoEstoquecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSaldoEstoquenome_marca: TStringField
      FieldName = 'nome_marca'
      Size = 90
    end
    object TabSaldoEstoquenome_unidade: TStringField
      FieldName = 'nome_unidade'
      Size = 5
    end
    object TabSaldoEstoquenome_grupo: TStringField
      FieldName = 'nome_grupo'
      Size = 90
    end
    object TabSaldoEstoquesaldoestoque: TFloatField
      FieldName = 'saldoestoque'
    end
  end
  object TabProdutoZerado: TClientDataSet
    PersistDataPacket.Data = {
      F40000009619E0BD010000001800000009000000000003000000F4000A69645F
      70726F6475746F04000100000000000C6E6F6D655F70726F6475746F01004900
      0000010005574944544802000200BE0009707263636F6D707261080004000000
      00000870726376656E6461080004000000000006636F6469676F040001000000
      00000A6E6F6D655F6D617263610100490000000100055749445448020002005A
      000C6E6F6D655F756E6964616465010049000000010005574944544802000200
      05000A6E6F6D655F677275706F0100490000000100055749445448020002005A
      000C73616C646F6573746F71756508000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_produto'
        DataType = ftInteger
      end
      item
        Name = 'nome_produto'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'prccompra'
        DataType = ftFloat
      end
      item
        Name = 'prcvenda'
        DataType = ftFloat
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nome_marca'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'nome_unidade'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nome_grupo'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'saldoestoque'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1048
    Top = 528
    object TabProdutoZeradoid_produto: TIntegerField
      FieldName = 'id_produto'
    end
    object TabProdutoZeradonome_produto: TStringField
      FieldName = 'nome_produto'
      Size = 190
    end
    object TabProdutoZeradoprccompra: TFloatField
      FieldName = 'prccompra'
    end
    object TabProdutoZeradoprcvenda: TFloatField
      FieldName = 'prcvenda'
    end
    object TabProdutoZeradocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabProdutoZeradonome_marca: TStringField
      FieldName = 'nome_marca'
      Size = 90
    end
    object TabProdutoZeradonome_unidade: TStringField
      FieldName = 'nome_unidade'
      Size = 5
    end
    object TabProdutoZeradonome_grupo: TStringField
      FieldName = 'nome_grupo'
      Size = 90
    end
    object TabProdutoZeradosaldoestoque: TFloatField
      FieldName = 'saldoestoque'
    end
  end
  object TabEstoqueNegativo: TClientDataSet
    PersistDataPacket.Data = {
      F40000009619E0BD010000001800000009000000000003000000F4000A69645F
      70726F6475746F04000100000000000C6E6F6D655F70726F6475746F01004900
      0000010005574944544802000200BE0009707263636F6D707261080004000000
      00000870726376656E6461080004000000000006636F6469676F040001000000
      00000A6E6F6D655F6D617263610100490000000100055749445448020002005A
      000C6E6F6D655F756E6964616465010049000000010005574944544802000200
      05000A6E6F6D655F677275706F0100490000000100055749445448020002005A
      000C73616C646F6573746F71756508000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_produto'
        DataType = ftInteger
      end
      item
        Name = 'nome_produto'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'prccompra'
        DataType = ftFloat
      end
      item
        Name = 'prcvenda'
        DataType = ftFloat
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nome_marca'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'nome_unidade'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nome_grupo'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'saldoestoque'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1120
    Top = 528
    object TabEstoqueNegativoid_produto: TIntegerField
      FieldName = 'id_produto'
    end
    object TabEstoqueNegativonome_produto: TStringField
      FieldName = 'nome_produto'
      Size = 190
    end
    object TabEstoqueNegativoprccompra: TFloatField
      FieldName = 'prccompra'
    end
    object TabEstoqueNegativoprcvenda: TFloatField
      FieldName = 'prcvenda'
    end
    object TabEstoqueNegativocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabEstoqueNegativonome_marca: TStringField
      FieldName = 'nome_marca'
      Size = 90
    end
    object TabEstoqueNegativonome_unidade: TStringField
      FieldName = 'nome_unidade'
      Size = 5
    end
    object TabEstoqueNegativonome_grupo: TStringField
      FieldName = 'nome_grupo'
      Size = 90
    end
    object TabEstoqueNegativosaldoestoque: TFloatField
      FieldName = 'saldoestoque'
    end
  end
  object TabProduto: TClientDataSet
    PersistDataPacket.Data = {
      1C0100009619E0BD01000000180000000A0000000000030000001C0109696470
      726F6475746F040001000000000008636F646261727261010049000000010005
      5749445448020002001E000A7265666572656E63696101004900000001000557
      49445448020002003C000770726F6475746F0100490000000100055749445448
      02000200BE00076573746F7175650800040000000000056D6172636101004900
      0000010005574944544802000200280005677275706F01004900000001000557
      49445448020002002800056C6F63616C01004900000001000557494454480200
      0200280007756E69646164650100490000000100055749445448020002000500
      096E70657371756973610200490000000100055749445448020002002C010000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idproduto'
        DataType = ftInteger
      end
      item
        Name = 'codbarra'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'referencia'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'produto'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'estoque'
        DataType = ftFloat
      end
      item
        Name = 'marca'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'grupo'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'local'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'unidade'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 300
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 896
    Top = 472
    object TabProdutoidproduto: TIntegerField
      FieldName = 'idproduto'
    end
    object TabProdutocodbarra: TStringField
      FieldName = 'codbarra'
      Size = 30
    end
    object TabProdutoreferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object TabProdutoproduto: TStringField
      FieldName = 'produto'
      Size = 190
    end
    object TabProdutoestoque: TFloatField
      FieldName = 'estoque'
    end
    object TabProdutomarca: TStringField
      FieldName = 'marca'
      Size = 40
    end
    object TabProdutogrupo: TStringField
      FieldName = 'grupo'
      Size = 40
    end
    object TabProdutolocal: TStringField
      FieldName = 'local'
      Size = 40
    end
    object TabProdutounidade: TStringField
      FieldName = 'unidade'
      Size = 5
    end
    object TabProdutonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 300
    end
  end
  object TabHistoricoProduto: TClientDataSet
    PersistDataPacket.Data = {
      AF0000009619E0BD010000001800000007000000000003000000AF0004746970
      6F0100490000000100055749445448020002000A000471746465080004000000
      000004646174610800080000000000036F627302004900000001000557494454
      4802000200F40106636F6469676F04000100000000000964657363726963616F
      010049000000010005574944544802000200BE00086E70726F6475746F010049
      000000010005574944544802000200FA000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 976
    Top = 472
    object TabHistoricoProdutotipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object TabHistoricoProdutoqtde: TFloatField
      FieldName = 'qtde'
    end
    object TabHistoricoProdutodata: TDateTimeField
      FieldName = 'data'
    end
    object TabHistoricoProdutoobs: TStringField
      FieldName = 'obs'
      Size = 500
    end
    object TabHistoricoProdutocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabHistoricoProdutodescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabHistoricoProdutonproduto: TStringField
      FieldName = 'nproduto'
      Size = 250
    end
  end
  object TabAssociado: TClientDataSet
    PersistDataPacket.Data = {
      9B0000009619E0BD0100000018000000060000000000030000009B000869645F
      736F63696F040001000000000006636F6469676F0400010000000000096D6174
      726963756C610400010000000000046E6F6D6501004900000001000557494454
      4802000200BE0003637066010049000000010005574944544802000200140009
      6E7065737175697361010049000000010005574944544802000200C8000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 464
    object TabAssociadoid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabAssociadocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabAssociadomatricula: TIntegerField
      FieldName = 'matricula'
    end
    object TabAssociadonome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object TabAssociadocpf: TStringField
      FieldName = 'cpf'
    end
    object TabAssociadonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 200
    end
  end
  object TabConsCarteira: TClientDataSet
    PersistDataPacket.Data = {
      0A0100009619E0BD01000000180000000B0000000000030000000A010B69645F
      636172746569726104000100000000000869645F736F63696F04000100000000
      000876616C6964616465040006000000000005617469766F0100490000000100
      055749445448020002000A00076469676974616C010049000000010005574944
      5448020002000A00096D6174726963756C61040001000000000006636F646967
      6F0400010000000000046E6F6D65010049000000010005574944544802000200
      BE000363706601004900000001000557494454480200020014000572617A616F
      0100490000000100055749445448020002003C00036170690100490000000100
      0557494454480200020005000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_carteira'
        DataType = ftInteger
      end
      item
        Name = 'id_socio'
        DataType = ftInteger
      end
      item
        Name = 'validade'
        DataType = ftDate
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'digital'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'matricula'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
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
        Name = 'razao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'api'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 584
    Top = 688
    object TabConsCarteiraid_carteira: TIntegerField
      FieldName = 'id_carteira'
    end
    object TabConsCarteiraid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabConsCarteiravalidade: TDateField
      FieldName = 'validade'
    end
    object TabConsCarteiraativo: TStringField
      FieldName = 'ativo'
      Size = 10
    end
    object TabConsCarteiradigital: TStringField
      FieldName = 'digital'
      Size = 10
    end
    object TabConsCarteiramatricula: TIntegerField
      FieldName = 'matricula'
    end
    object TabConsCarteiracodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsCarteiranome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object TabConsCarteiracpf: TStringField
      FieldName = 'cpf'
    end
    object TabConsCarteirarazao: TStringField
      FieldName = 'razao'
      Size = 60
    end
    object TabConsCarteiraapi: TStringField
      FieldName = 'api'
      Size = 5
    end
  end
  object TabCarteirinhaImpresso: TClientDataSet
    PersistDataPacket.Data = {
      C10400009619E0BD01000000180000002D000000000003000000C1040B69645F
      636172746569726104000100000000000869645F736F63696F04000100000000
      000876616C6964616465040006000000000005617469766F0100490000000100
      055749445448020002000500076469676974616C010049000000010005574944
      5448020002000500096D6174726963756C61040001000000000006636F646967
      6F0400010000000000046E6F6D65010049000000010005574944544802000200
      BE00036370660100490000000100055749445448020002001400027267010049
      0000000100055749445448020002001400037069730100490000000100055749
      4454480200020014000573657269650100490000000100055749445448020002
      000A000A6E617363696D656E746F04000600000000000861646D697373616F04
      000600000000000970726F66697373616F010049000000010005574944544802
      0002003C000C6E61747572616C69646164650100490000000100055749445448
      020002003C00036D6165010049000000010005574944544802000200BE000370
      6169010049000000010005574944544802000200BE000B736F63696F5F646573
      7465040006000000000004637470730100490000000100055749445448020002
      001400086465706E6F6D6531010049000000010005574944544802000200BE00
      0E6465706E617363696D656E746F3104000600000000000E646570706172656E
      746573636F310100490000000100055749445448020002003C00076465706370
      66310100490000000100055749445448020002001400086465706E6F6D653201
      0049000000010005574944544802000200BE000E6465706E617363696D656E74
      6F3204000600000000000E646570706172656E746573636F3201004900000001
      00055749445448020002003C0007646570637066320100490000000100055749
      445448020002001400086465706E6F6D65330100490000000100055749445448
      02000200BE000E6465706E617363696D656E746F3304000600000000000E6465
      70706172656E746573636F330100490000000100055749445448020002003C00
      0764657063706633010049000000010005574944544802000200140008646570
      6E6F6D6534010049000000010005574944544802000200BE000E6465706E6173
      63696D656E746F3404000600000000000E646570706172656E746573636F3401
      00490000000100055749445448020002003C0007646570637066340100490000
      000100055749445448020002001400086465706E6F6D65350100490000000100
      05574944544802000200BE000E6465706E617363696D656E746F350100490000
      0001000557494454480200020014000E646570706172656E746573636F350100
      490000000100055749445448020002003C000764657063706635010049000000
      0100055749445448020002001400086465706E6F6D6536010049000000010005
      574944544802000200BE000E6465706E617363696D656E746F36040006000000
      00000E646570706172656E746573636F36010049000000010005574944544802
      0002003C00076465706370663601004900000001000557494454480200020014
      0004666F746F04004B0000000100075355425459504502004900070042696E61
      7279000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_carteira'
        DataType = ftInteger
      end
      item
        Name = 'id_socio'
        DataType = ftInteger
      end
      item
        Name = 'validade'
        DataType = ftDate
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'digital'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'matricula'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
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
        Name = 'pis'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'serie'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'nascimento'
        DataType = ftDate
      end
      item
        Name = 'admissao'
        DataType = ftDate
      end
      item
        Name = 'profissao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'naturalidade'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'mae'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'pai'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'socio_deste'
        DataType = ftDate
      end
      item
        Name = 'ctps'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'depnome1'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'depnascimento1'
        DataType = ftDate
      end
      item
        Name = 'depparentesco1'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'depcpf1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'depnome2'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'depnascimento2'
        DataType = ftDate
      end
      item
        Name = 'depparentesco2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'depcpf2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'depnome3'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'depnascimento3'
        DataType = ftDate
      end
      item
        Name = 'depparentesco3'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'depcpf3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'depnome4'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'depnascimento4'
        DataType = ftDate
      end
      item
        Name = 'depparentesco4'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'depcpf4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'depnome5'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'depnascimento5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'depparentesco5'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'depcpf5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'depnome6'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'depnascimento6'
        DataType = ftDate
      end
      item
        Name = 'depparentesco6'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'depcpf6'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'foto'
        DataType = ftBlob
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 656
    Top = 744
    object TabCarteirinhaImpressoid_carteira: TIntegerField
      FieldName = 'id_carteira'
    end
    object TabCarteirinhaImpressoid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabCarteirinhaImpressovalidade: TDateField
      FieldName = 'validade'
    end
    object TabCarteirinhaImpressoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabCarteirinhaImpressodigital: TStringField
      FieldName = 'digital'
      Size = 5
    end
    object TabCarteirinhaImpressomatricula: TIntegerField
      FieldName = 'matricula'
    end
    object TabCarteirinhaImpressocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabCarteirinhaImpressonome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object TabCarteirinhaImpressocpf: TStringField
      FieldName = 'cpf'
    end
    object TabCarteirinhaImpressorg: TStringField
      FieldName = 'rg'
    end
    object TabCarteirinhaImpressopis: TStringField
      FieldName = 'pis'
    end
    object TabCarteirinhaImpressoserie: TStringField
      FieldName = 'serie'
      Size = 10
    end
    object TabCarteirinhaImpressonascimento: TDateField
      FieldName = 'nascimento'
    end
    object TabCarteirinhaImpressoadmissao: TDateField
      FieldName = 'admissao'
    end
    object TabCarteirinhaImpressoprofissao: TStringField
      FieldName = 'profissao'
      Size = 60
    end
    object TabCarteirinhaImpressonaturalidade: TStringField
      FieldName = 'naturalidade'
      Size = 60
    end
    object TabCarteirinhaImpressomae: TStringField
      FieldName = 'mae'
      Size = 190
    end
    object TabCarteirinhaImpressopai: TStringField
      FieldName = 'pai'
      Size = 190
    end
    object TabCarteirinhaImpressosocio_deste: TDateField
      FieldName = 'socio_deste'
    end
    object TabCarteirinhaImpressoctps: TStringField
      FieldName = 'ctps'
    end
    object TabCarteirinhaImpressodepnome1: TStringField
      FieldName = 'depnome1'
      Size = 190
    end
    object TabCarteirinhaImpressodepnascimento1: TDateField
      FieldName = 'depnascimento1'
    end
    object TabCarteirinhaImpressodepparentesco1: TStringField
      FieldName = 'depparentesco1'
      Size = 60
    end
    object TabCarteirinhaImpressodepcpf1: TStringField
      FieldName = 'depcpf1'
    end
    object TabCarteirinhaImpressodepnome2: TStringField
      FieldName = 'depnome2'
      Size = 190
    end
    object TabCarteirinhaImpressodepnascimento2: TDateField
      FieldName = 'depnascimento2'
    end
    object TabCarteirinhaImpressodepparentesco2: TStringField
      FieldName = 'depparentesco2'
      Size = 60
    end
    object TabCarteirinhaImpressodepcpf2: TStringField
      FieldName = 'depcpf2'
    end
    object TabCarteirinhaImpressodepnome3: TStringField
      FieldName = 'depnome3'
      Size = 190
    end
    object TabCarteirinhaImpressodepnascimento3: TDateField
      FieldName = 'depnascimento3'
    end
    object TabCarteirinhaImpressodepparentesco3: TStringField
      FieldName = 'depparentesco3'
      Size = 60
    end
    object TabCarteirinhaImpressodepcpf3: TStringField
      FieldName = 'depcpf3'
    end
    object TabCarteirinhaImpressodepnome4: TStringField
      FieldName = 'depnome4'
      Size = 190
    end
    object TabCarteirinhaImpressodepnascimento4: TDateField
      FieldName = 'depnascimento4'
    end
    object TabCarteirinhaImpressodepparentesco4: TStringField
      FieldName = 'depparentesco4'
      Size = 60
    end
    object TabCarteirinhaImpressodepcpf4: TStringField
      FieldName = 'depcpf4'
    end
    object TabCarteirinhaImpressodepnome5: TStringField
      FieldName = 'depnome5'
      Size = 190
    end
    object TabCarteirinhaImpressodepnascimento5: TStringField
      FieldName = 'depnascimento5'
    end
    object TabCarteirinhaImpressodepparentesco5: TStringField
      FieldName = 'depparentesco5'
      Size = 60
    end
    object TabCarteirinhaImpressodepcpf5: TStringField
      FieldName = 'depcpf5'
    end
    object TabCarteirinhaImpressodepnome6: TStringField
      FieldName = 'depnome6'
      Size = 190
    end
    object TabCarteirinhaImpressodepnascimento6: TDateField
      FieldName = 'depnascimento6'
    end
    object TabCarteirinhaImpressodepparentesco6: TStringField
      FieldName = 'depparentesco6'
      Size = 60
    end
    object TabCarteirinhaImpressodepcpf6: TStringField
      FieldName = 'depcpf6'
    end
    object TabCarteirinhaImpressofoto: TBlobField
      FieldName = 'foto'
    end
  end
  object TabEstatisticas: TClientDataSet
    PersistDataPacket.Data = {
      680000009619E0BD010000001800000004000000000003000000680009646573
      63726963616F010049000000010005574944544802000200640006686F6D656E
      730400010000000000056D756C686504000100000000000A746F74616C676572
      616C04000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 896
    Top = 424
    object TabEstatisticasdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object TabEstatisticashomens: TIntegerField
      FieldName = 'homens'
    end
    object TabEstatisticasmulhe: TIntegerField
      FieldName = 'mulhe'
    end
    object TabEstatisticastotalgeral: TIntegerField
      FieldName = 'totalgeral'
    end
  end
  object TabConsConvenio: TClientDataSet
    PersistDataPacket.Data = {
      F90000009619E0BD010000001800000009000000000003000000F9000B69645F
      636F6E76656E696F040001000000000006636F6469676F040001000000000004
      6E6F6D650100490000000100055749445448020002005A00047469706F010049
      0000000100055749445448020002002D00067465726D6F730100490000000100
      05574944544802000200FA0013696E666F726D6163616F5F636F6E747261746F
      020049000000010005574944544802000200F4010776616C6F72657308000400
      000000000874656C65666F6E6501004900000001000557494454480200020014
      0005617469766F01004900000001000557494454480200020005000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 728
    Top = 240
    object TabConsConvenioid_convenio: TIntegerField
      FieldName = 'id_convenio'
    end
    object TabConsConveniocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsConvenionome: TStringField
      FieldName = 'nome'
      Size = 90
    end
    object TabConsConveniotipo: TStringField
      FieldName = 'tipo'
      Size = 45
    end
    object TabConsConveniotermos: TStringField
      FieldName = 'termos'
      Size = 250
    end
    object TabConsConvenioinformacao_contrato: TStringField
      FieldName = 'informacao_contrato'
      Size = 500
    end
    object TabConsConveniovalores: TFloatField
      FieldName = 'valores'
    end
    object TabConsConveniotelefone: TStringField
      FieldName = 'telefone'
    end
    object TabConsConvenioativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
  end
  object TabSindDependentes: TClientDataSet
    PersistDataPacket.Data = {
      AE0000009619E0BD010000001800000006000000000003000000AE000D69645F
      646570656E64656E7465040001000000000006636F6469676F04000100000000
      00046E6F6D65010049000000010005574944544802000200BE000A706172656E
      746573636F01004900000001000557494454480200020028000A4175746F7269
      7A61646F01004900000001000557494454480200020005000363706601004900
      000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_dependente'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'parentesco'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Autorizado'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 616
    object TabSindDependentesid_dependente: TIntegerField
      FieldName = 'id_dependente'
    end
    object TabSindDependentescodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSindDependentesnome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object TabSindDependentesparentesco: TStringField
      FieldName = 'parentesco'
      Size = 40
    end
    object TabSindDependentesAutorizado: TStringField
      FieldName = 'Autorizado'
      Size = 5
    end
    object TabSindDependentescpf: TStringField
      FieldName = 'cpf'
    end
  end
  object TabConsCarteiraDependente: TClientDataSet
    PersistDataPacket.Data = {
      D70000009619E0BD010000001800000008000000000003000000D7000B69645F
      63617274656972610400010000000000076469676974616C0100490000000100
      055749445448020002000A0006636F6469676F0400010000000000046E6F6D65
      010049000000010005574944544802000200BE00036370660100490000000100
      0557494454480200020014000D69645F646570656E64656E7465040001000000
      00000A706172656E746573636F0100490000000100055749445448020002002D
      000361706901004900000001000557494454480200020005000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_carteira'
        DataType = ftInteger
      end
      item
        Name = 'digital'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'codigo'
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
        Name = 'id_dependente'
        DataType = ftInteger
      end
      item
        Name = 'parentesco'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'api'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 520
    Top = 736
    object TabConsCarteiraDependenteid_carteira: TIntegerField
      FieldName = 'id_carteira'
    end
    object TabConsCarteiraDependentedigital: TStringField
      FieldName = 'digital'
      Size = 10
    end
    object TabConsCarteiraDependentecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsCarteiraDependentenome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object TabConsCarteiraDependentecpf: TStringField
      FieldName = 'cpf'
    end
    object TabConsCarteiraDependenteid_dependente: TIntegerField
      FieldName = 'id_dependente'
    end
    object TabConsCarteiraDependenteparentesco: TStringField
      FieldName = 'parentesco'
      Size = 45
    end
    object TabConsCarteiraDependenteapi: TStringField
      FieldName = 'api'
      Size = 5
    end
  end
  object TabDependenteListcarteira: TClientDataSet
    PersistDataPacket.Data = {
      8E0000009619E0BD0100000018000000050000000000030000008E000D69645F
      646570656E64656E7465040001000000000006636F6469676F04000100000000
      00046E6F6D65010049000000010005574944544802000200BE00096E70657371
      75697361010049000000010005574944544802000200BE000363706601004900
      000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_dependente'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 672
    object TabDependenteListcarteiraid_dependente: TIntegerField
      FieldName = 'id_dependente'
    end
    object TabDependenteListcarteiracodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabDependenteListcarteiranome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object TabDependenteListcarteiranpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 190
    end
    object TabDependenteListcarteiracpf: TStringField
      FieldName = 'cpf'
    end
  end
  object Conn: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Username = 'root'
    LoginPrompt = False
    Left = 16
    Top = 576
  end
  object UniTransaction1: TUniTransaction
    DefaultConnection = Conn
    Left = 80
    Top = 576
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 128
    Top = 576
  end
  object TabMensagemWhatsapp: TClientDataSet
    PersistDataPacket.Data = {
      5B0000009619E0BD0100000018000000030000000000030000005B000B69645F
      6D656E736167656D040001000000000006636F6469676F040001000000000009
      64657363726963616F0100490000000100055749445448020002005A000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 128
    object TabMensagemWhatsappid_mensagem: TIntegerField
      FieldName = 'id_mensagem'
    end
    object TabMensagemWhatsappcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabMensagemWhatsappdescricao: TStringField
      FieldName = 'descricao'
      Size = 90
    end
  end
  object TabConsSindregistro: TClientDataSet
    PersistDataPacket.Data = {
      A40000009619E0BD010000001800000006000000000003000000A4000B646174
      61656E747261646104000600000000000B686F7261656E747261646104000700
      00000000096D6174726963756C610400010000000000046E6F6D650100490000
      00010005574944544802000200640004666F6E65010049000000010005574944
      5448020002001400096E6D7573756172696F0100490000000100055749445448
      0200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 728
    Top = 112
    object TabConsSindregistrodataentrada: TDateField
      FieldName = 'dataentrada'
    end
    object TabConsSindregistrohoraentrada: TTimeField
      FieldName = 'horaentrada'
    end
    object TabConsSindregistromatricula: TIntegerField
      FieldName = 'matricula'
    end
    object TabConsSindregistronome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object TabConsSindregistrofone: TStringField
      FieldName = 'fone'
    end
    object TabConsSindregistronmusuario: TStringField
      FieldName = 'nmusuario'
      Size = 100
    end
  end
  object UniQuery1: TUniQuery
    Connection = Conn
    Left = 168
    Top = 648
  end
  object AvisoDependente18: TClientDataSet
    PersistDataPacket.Data = {
      B10000009619E0BD010000001800000007000000000003000000B1000D69645F
      646570656E64656E7465040001000000000006636F6469676F04000100000000
      00046E6F6D65010049000000010005574944544802000200BE000A6E61736369
      6D656E746F040006000000000003637066010049000000010005574944544802
      0002001400096D6174726963756C610400010000000000076E6D736F63696F01
      0049000000010005574944544802000200BE000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1200
    Top = 8
    object AvisoDependente18id_dependente: TIntegerField
      FieldName = 'id_dependente'
    end
    object AvisoDependente18codigo: TIntegerField
      FieldName = 'codigo'
    end
    object AvisoDependente18nome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object AvisoDependente18nascimento: TDateField
      FieldName = 'nascimento'
    end
    object AvisoDependente18cpf: TStringField
      FieldName = 'cpf'
    end
    object AvisoDependente18matricula: TIntegerField
      FieldName = 'matricula'
    end
    object AvisoDependente18nmsocio: TStringField
      FieldName = 'nmsocio'
      Size = 190
    end
  end
  object TabConsAutorizacao: TClientDataSet
    PersistDataPacket.Data = {
      A50000009619E0BD010000001800000006000000000003000000A5000D696461
      75746F72697A6163616F04000100000000000464617461040006000000000004
      6E6F6D65010049000000010005574944544802000200BE000A71746465706573
      736F610400010000000000036F62730200490000000100055749445448020002
      00F4010F706573736F616175746F72697A6F7501004900000001000557494454
      48020002003C000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 728
    object TabConsAutorizacaoidautorizacao: TIntegerField
      FieldName = 'idautorizacao'
    end
    object TabConsAutorizacaodata: TDateField
      FieldName = 'data'
    end
    object TabConsAutorizacaonome: TStringField
      FieldName = 'nome'
      Size = 190
    end
    object TabConsAutorizacaoqtdepessoa: TIntegerField
      FieldName = 'qtdepessoa'
    end
    object TabConsAutorizacaoobs: TStringField
      FieldName = 'obs'
      Size = 500
    end
    object TabConsAutorizacaopessoaautorizou: TStringField
      FieldName = 'pessoaautorizou'
      Size = 60
    end
  end
  object TabConvenioticket: TClientDataSet
    PersistDataPacket.Data = {
      690000009619E0BD01000000180000000300000000000300000069000B69645F
      636F6E76656E696F0400010000000000096E7065737175697361010049000000
      010005574944544802000200BE000874656C65666F6E65010049000000010005
      57494454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1200
    Top = 72
    object TabConvenioticketid_convenio: TIntegerField
      FieldName = 'id_convenio'
    end
    object TabConvenioticketnpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 190
    end
    object TabConveniotickettelefone: TStringField
      FieldName = 'telefone'
    end
  end
  object TabConsTicket: TClientDataSet
    PersistDataPacket.Data = {
      970100009619E0BD01000000180000001000000000000300000097010969645F
      7469636B657404000100000000000B646174615F7469636B6574040006000000
      000006636F6469676F04000100000000000D646174615F646573636F6E746F04
      000600000000000E646174615F706167616D656E746F04000600000000000961
      6E6F7461636F6573020049000000010005574944544802000200F40108736974
      756163616F0100490000000100055749445448020002000F000C76616C6F725F
      7469636B657408000400000000000A6E6D636F6E76656E696F01004900000001
      0005574944544802000200BE00076E6D736F63696F0100490000000100055749
      44544802000200BE00077573756172696F010049000000010005574944544802
      00020064000869645F736F63696F04000100000000000A636F6469676F6C6F74
      650400010000000000066D6F7469766F02004900000001000557494454480200
      0200F401106F62735F63616E63656C616D656E746F0200490000000100055749
      44544802000200F40107766C727061676F08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_ticket'
        DataType = ftInteger
      end
      item
        Name = 'data_ticket'
        DataType = ftDate
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'data_desconto'
        DataType = ftDate
      end
      item
        Name = 'data_pagamento'
        DataType = ftDate
      end
      item
        Name = 'anotacoes'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'situacao'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'valor_ticket'
        DataType = ftFloat
      end
      item
        Name = 'nmconvenio'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'nmsocio'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'usuario'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'id_socio'
        DataType = ftInteger
      end
      item
        Name = 'codigolote'
        DataType = ftInteger
      end
      item
        Name = 'motivo'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'obs_cancelamento'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'vlrpago'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1200
    Top = 128
    object TabConsTicketid_ticket: TIntegerField
      FieldName = 'id_ticket'
    end
    object TabConsTicketdata_ticket: TDateField
      FieldName = 'data_ticket'
    end
    object TabConsTicketcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsTicketdata_desconto: TDateField
      FieldName = 'data_desconto'
    end
    object TabConsTicketdata_pagamento: TDateField
      FieldName = 'data_pagamento'
    end
    object TabConsTicketanotacoes: TStringField
      FieldName = 'anotacoes'
      Size = 500
    end
    object TabConsTicketsituacao: TStringField
      FieldName = 'situacao'
      Size = 15
    end
    object TabConsTicketvalor_ticket: TFloatField
      FieldName = 'valor_ticket'
    end
    object TabConsTicketnmconvenio: TStringField
      FieldName = 'nmconvenio'
      Size = 190
    end
    object TabConsTicketnmsocio: TStringField
      FieldName = 'nmsocio'
      Size = 190
    end
    object TabConsTicketusuario: TStringField
      FieldName = 'usuario'
      Size = 100
    end
    object TabConsTicketid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabConsTicketcodigolote: TIntegerField
      FieldName = 'codigolote'
    end
    object TabConsTicketmotivo: TStringField
      FieldName = 'motivo'
      Size = 500
    end
    object TabConsTicketobs_cancelamento: TStringField
      FieldName = 'obs_cancelamento'
      Size = 500
    end
    object TabConsTicketvlrpago: TFloatField
      FieldName = 'vlrpago'
    end
  end
  object TabConsTicketBaixa: TClientDataSet
    PersistDataPacket.Data = {
      730100009619E0BD01000000180000000F00000000000300000073010969645F
      7469636B657404000100000000000B646174615F7469636B6574040006000000
      000006636F6469676F04000100000000000D646174615F646573636F6E746F04
      000600000000000E646174615F706167616D656E746F04000600000000000961
      6E6F7461636F6573020049000000010005574944544802000200F40108736974
      756163616F0100490000000100055749445448020002000F000C76616C6F725F
      7469636B657408000400000000000A6E6D636F6E76656E696F01004900000001
      0005574944544802000200BE00076E6D736F63696F0100490000000100055749
      44544802000200BE00077573756172696F010049000000010005574944544802
      00020064000869645F736F63696F04000100000000000A636F6469676F6C6F74
      6504000100000000000773656C6563616F010049000000010005574944544802
      000200040007766C727061676F08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_ticket'
        DataType = ftInteger
      end
      item
        Name = 'data_ticket'
        DataType = ftDate
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'data_desconto'
        DataType = ftDate
      end
      item
        Name = 'data_pagamento'
        DataType = ftDate
      end
      item
        Name = 'anotacoes'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'situacao'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'valor_ticket'
        DataType = ftFloat
      end
      item
        Name = 'nmconvenio'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'nmsocio'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'usuario'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'id_socio'
        DataType = ftInteger
      end
      item
        Name = 'codigolote'
        DataType = ftInteger
      end
      item
        Name = 'selecao'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'vlrpago'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1184
    Top = 224
    object TabConsTicketBaixaid_ticket: TIntegerField
      FieldName = 'id_ticket'
    end
    object TabConsTicketBaixadata_ticket: TDateField
      FieldName = 'data_ticket'
    end
    object TabConsTicketBaixacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsTicketBaixadata_desconto: TDateField
      FieldName = 'data_desconto'
    end
    object TabConsTicketBaixadata_pagamento: TDateField
      FieldName = 'data_pagamento'
    end
    object TabConsTicketBaixaanotacoes: TStringField
      FieldName = 'anotacoes'
      Size = 500
    end
    object TabConsTicketBaixasituacao: TStringField
      FieldName = 'situacao'
      Size = 15
    end
    object TabConsTicketBaixavalor_ticket: TFloatField
      FieldName = 'valor_ticket'
    end
    object TabConsTicketBaixanmconvenio: TStringField
      FieldName = 'nmconvenio'
      Size = 190
    end
    object TabConsTicketBaixanmsocio: TStringField
      FieldName = 'nmsocio'
      Size = 190
    end
    object TabConsTicketBaixausuario: TStringField
      FieldName = 'usuario'
      Size = 100
    end
    object TabConsTicketBaixaid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabConsTicketBaixacodigolote: TIntegerField
      FieldName = 'codigolote'
    end
    object TabConsTicketBaixaselecao: TStringField
      FieldName = 'selecao'
      Size = 4
    end
    object TabConsTicketBaixavlrpago: TFloatField
      FieldName = 'vlrpago'
    end
  end
  object TabConsVeiculoEspecie: TClientDataSet
    PersistDataPacket.Data = {
      730000009619E0BD010000001800000004000000000003000000730009696465
      737065636965040001000000000006636F6469676F0400010000000000096465
      7363726963616F0100490000000100055749445448020002003C000561746976
      6F01004900000001000557494454480200020005000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idespecie'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 728
    Top = 64
    object TabConsVeiculoEspecieidespecie: TIntegerField
      FieldName = 'idespecie'
    end
    object TabConsVeiculoEspeciecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsVeiculoEspeciedescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabConsVeiculoEspecieativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
  end
  object TabConsModeloVeiculo: TClientDataSet
    PersistDataPacket.Data = {
      9E0000009619E0BD0100000018000000060000000000030000009E000869646D
      6F64656C6F040001000000000006636F6469676F040001000000000009646573
      63726963616F0100490000000100055749445448020002003C0005617469766F
      01004900000001000557494454480200020005000769646D6172636104000100
      00000000076E6D6D617263610100490000000100055749445448020002003C00
      0000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 728
    Top = 168
    object TabConsModeloVeiculoidmodelo: TIntegerField
      FieldName = 'idmodelo'
    end
    object TabConsModeloVeiculocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsModeloVeiculodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabConsModeloVeiculoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabConsModeloVeiculoidmarca: TIntegerField
      FieldName = 'idmarca'
    end
    object TabConsModeloVeiculonmmarca: TStringField
      FieldName = 'nmmarca'
      Size = 60
    end
  end
  object TabMarcaVeiculo: TClientDataSet
    PersistDataPacket.Data = {
      580000009619E0BD01000000180000000300000000000300000058000869645F
      6D61726361040001000000000006636F6469676F0400010000000000096E7065
      7371756973610100490000000100055749445448020002005A000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1040
    Top = 224
    object TabMarcaVeiculoid_marca: TIntegerField
      FieldName = 'id_marca'
    end
    object TabMarcaVeiculocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabMarcaVeiculonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 90
    end
  end
  object TabEspecieVeiculo: TClientDataSet
    PersistDataPacket.Data = {
      5A0000009619E0BD0100000018000000030000000000030000005A000A69645F
      65737065636965040001000000000006636F6469676F0400010000000000096E
      70657371756973610100490000000100055749445448020002003C000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1040
    Top = 336
    object TabEspecieVeiculoid_especie: TIntegerField
      FieldName = 'id_especie'
    end
    object TabEspecieVeiculocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabEspecieVeiculonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 60
    end
  end
  object TabModeloVeiculo: TClientDataSet
    PersistDataPacket.Data = {
      590000009619E0BD01000000180000000300000000000300000059000969645F
      6D6F64656C6F040001000000000006636F6469676F0400010000000000096E70
      657371756973610100490000000100055749445448020002003C000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1040
    Top = 392
    object TabModeloVeiculoid_modelo: TIntegerField
      FieldName = 'id_modelo'
    end
    object TabModeloVeiculocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabModeloVeiculonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 60
    end
  end
  object TabConsultaVeiculo: TClientDataSet
    PersistDataPacket.Data = {
      9B0100009619E0BD01000000180000000F0000000000030000009B0105706C61
      63610100490000000100055749445448020002000A000964657363726963616F
      01004900000001000557494454480200020096001064657363726963616F5F66
      697363616C0100490000000100055749445448020002009600097072635F7665
      6E646108000400000000000C76656963756C6F5F666970650800040000000000
      0D76656963756C6F5F6C7563726F08000400000000001276656963756C6F5F63
      7573746F746F74616C0800040000000000076573746F71756501004900000001
      00055749445448020002000500086E6D6D6F64656C6F01004900000001000557
      49445448020002006400056C6F63616C01004900000001000557494454480200
      020064000A69645F76656963756C6F040001000000000009616E6F6D6F64656C
      6F0100490000000100055749445448020002001E0006636F6469676F04000100
      000000000774656D666F746F0100490000000100055749445448020002000500
      0874656D616E65786F01004900000001000557494454480200020005000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'placa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'descricao_fiscal'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'prc_venda'
        DataType = ftFloat
      end
      item
        Name = 'veiculo_fipe'
        DataType = ftFloat
      end
      item
        Name = 'veiculo_lucro'
        DataType = ftFloat
      end
      item
        Name = 'veiculo_custototal'
        DataType = ftFloat
      end
      item
        Name = 'estoque'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nmmodelo'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'local'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'id_veiculo'
        DataType = ftInteger
      end
      item
        Name = 'anomodelo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'temfoto'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'temanexo'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1040
    Top = 448
    object TabConsultaVeiculoplaca: TStringField
      FieldName = 'placa'
      Size = 10
    end
    object TabConsultaVeiculodescricao: TStringField
      FieldName = 'descricao'
      Size = 150
    end
    object TabConsultaVeiculodescricao_fiscal: TStringField
      FieldName = 'descricao_fiscal'
      Size = 150
    end
    object TabConsultaVeiculoprc_venda: TFloatField
      FieldName = 'prc_venda'
    end
    object TabConsultaVeiculoveiculo_fipe: TFloatField
      FieldName = 'veiculo_fipe'
    end
    object TabConsultaVeiculoveiculo_lucro: TFloatField
      FieldName = 'veiculo_lucro'
    end
    object TabConsultaVeiculoveiculo_custototal: TFloatField
      FieldName = 'veiculo_custototal'
    end
    object TabConsultaVeiculoestoque: TStringField
      FieldName = 'estoque'
      Size = 5
    end
    object TabConsultaVeiculonmmodelo: TStringField
      FieldName = 'nmmodelo'
      Size = 100
    end
    object TabConsultaVeiculolocal: TStringField
      FieldName = 'local'
      Size = 100
    end
    object TabConsultaVeiculoid_veiculo: TIntegerField
      FieldName = 'id_veiculo'
    end
    object TabConsultaVeiculoanomodelo: TStringField
      FieldName = 'anomodelo'
      Size = 30
    end
    object TabConsultaVeiculocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsultaVeiculotemfoto: TStringField
      FieldName = 'temfoto'
      Size = 5
    end
    object TabConsultaVeiculotemanexo: TStringField
      FieldName = 'temanexo'
      Size = 5
    end
  end
  object TabAnexo: TClientDataSet
    PersistDataPacket.Data = {
      870000009619E0BD01000000180000000400000000000300000087000869645F
      616E65786F04000100000000000C6E6F6D655F6172717569766F010049000000
      0100055749445448020002003C0008657874656E73616F010049000000010005
      57494454480200020006000964657363726963616F0100490000000100055749
      4454480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 896
    Top = 640
    object TabAnexoid_anexo: TIntegerField
      FieldName = 'id_anexo'
    end
    object TabAnexonome_arquivo: TStringField
      FieldName = 'nome_arquivo'
      Size = 60
    end
    object TabAnexoextensao: TStringField
      FieldName = 'extensao'
      Size = 6
    end
    object TabAnexodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
  end
  object TabPrazoPagCompra: TClientDataSet
    PersistDataPacket.Data = {
      710000009619E0BD01000000180000000400000000000300000071000869645F
      7072617A6F040001000000000006636F6469676F040001000000000009646573
      63726963616F0100490000000100055749445448020002005A00047469706F01
      004900000001000557494454480200020001000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_prazo'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'tipo'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 336
    Top = 504
    object TabPrazoPagCompraid_prazo: TIntegerField
      FieldName = 'id_prazo'
    end
    object TabPrazoPagCompracodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabPrazoPagCompradescricao: TStringField
      FieldName = 'descricao'
      Size = 90
    end
    object TabPrazoPagCompratipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
  object TabConTipoDoc: TClientDataSet
    PersistDataPacket.Data = {
      760000009619E0BD01000000180000000400000000000300000076000C69645F
      646F63756D656E746F040001000000000006636F6469676F0400010000000000
      0964657363726963616F01004900000001000557494454480200020014000561
      7469766F01004900000001000557494454480200020005000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_documento'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 792
    Top = 656
    object TabConTipoDocid_documento: TIntegerField
      FieldName = 'id_documento'
    end
    object TabConTipoDoccodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConTipoDocdescricao: TStringField
      DisplayWidth = 60
      FieldName = 'descricao'
    end
    object TabConTipoDocativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
  end
end
