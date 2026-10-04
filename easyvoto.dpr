program easyvoto;

uses
  Vcl.Forms,
  Vcl.Loading in 'Utils\Vcl.Loading.pas',
  Vcl.Session in 'Utils\Vcl.Session.pas',
  Vcl.Navigation in 'Utils\Vcl.Navigation.pas',
  UnitPessoaAdicionar in 'Form\Consulta\UnitPessoaAdicionar.pas' {FrmPessoaAdicionar},
  UnitAssociadoCad in 'Form\Cadastro\UnitAssociadoCad.pas' {FrmAssociadoCad},
  UnitEleicaoCad in 'Form\Cadastro\UnitEleicaoCad.pas' {FrmeleicaoCad},
  UDM in 'DM\UDM.pas' {DM: TDataModule},
  Model.Campanha in 'Model\Model.Campanha.pas',
  Model.Chapa in 'Model\Model.Chapa.pas',
  Model.Connection in 'Model\Model.Connection.pas',
  Model.Produto in 'Model\Model.Produto.pas',
  Model.Email in 'Model\Model.Email.pas',
  Model.Empresa in 'Model\Model.Empresa.pas',
  Model.Perfil in 'Model\Model.Perfil.pas',
  Model.Funcionario in 'Model\Model.Funcionario.pas',
  Model.Usuario in 'Model\Model.Usuario.pas',
  UnitSedeCad in 'Form\Cadastro\UnitSedeCad.pas' {FrmSedeCad},
  UnitChapaCad in 'Form\Cadastro\UnitChapaCad.pas' {FrmChapaCad},
  UnitMembroCad in 'Form\Cadastro\UnitMembroCad.pas' {FrmMembroCad},
  UConeSul in 'Utils\UConeSul.pas',
  UnitSecretaria in 'Form\Consulta\UnitSecretaria.pas' {FrmSecretaria},
  uRotinasComuns in 'Utils\uRotinasComuns.pas' {DMRotinas: TDataModule},
  UnitEmpresa in 'Form\Acesso\UnitEmpresa.pas' {FrmEmpresa},
  UnitEmpresaCad in 'Form\Acesso\UnitEmpresaCad.pas' {FrmEmpresaCad},
  UnitEmpresaRegistro in 'Form\Acesso\UnitEmpresaRegistro.pas' {FrmRegistroEmpresa},
  UnitLogin in 'Form\Acesso\UnitLogin.pas' {FrmLogin},
  UnitPerfil in 'Form\Acesso\UnitPerfil.pas' {FrmPerfil},
  UnitPerfilCad in 'Form\Acesso\UnitPerfilCad.pas' {FrmPerfilCad},
  UnitPermissao in 'Form\Acesso\UnitPermissao.pas' {FrmPermissao},
  UnitPrincipal in 'Form\Acesso\UnitPrincipal.pas' {FrmPrincipal},
  UnitUsuario in 'Form\Acesso\UnitUsuario.pas' {FrmUsuario},
  UnitUsuarioCad in 'Form\Acesso\UnitUsuarioCad.pas' {FrmUsuarioCad},
  UnitEleicao in 'Form\Consulta\UnitEleicao.pas' {FrmEleicao},
  UnitCandidatoCad in 'Form\Cadastro\UnitCandidatoCad.pas' {FrmCandidatoCad},
  Model.Membro in 'Model\Model.Membro.pas',
  Model.Candidato in 'Model\Model.Candidato.pas',
  Model.Eleicao in 'Model\Model.Eleicao.pas',
  uJKDialog in 'Utils\uJKDialog.pas',
  uFormsDialogs in 'Form\FormModelo\uFormsDialogs.pas' {JKFormDialog},
  Model.Socio in 'Model\Model.Socio.pas',
  UnitPedidoCad in 'Form\Pedido\UnitPedidoCad.pas' {FrmPedidoCad},
  Model.Pedido in 'Model\Model.Pedido.pas',
  UnitImpressao in 'Form\Pedido\UnitImpressao.pas' {FrmImpressao},
  UnitProdutoEstoque in 'Form\Estoque\UnitProdutoEstoque.pas' {FrmProdutoEstoque},
  UnitFrmEmail in 'Form\Sistema\UnitFrmEmail.pas' {FrmEnviarEmail},
  UnitFrmWhatsAppMassa in 'Form\Sistema\UnitFrmWhatsAppMassa.pas' {FrmEnviarWhatsAppMassa},
  UnitQrCodeWhatsApp in 'Form\Sistema\UnitQrCodeWhatsApp.pas' {FrmQrCodeWhatsApp},
  Model.PrazoPag in 'Model\Model.PrazoPag.pas',
  Model.Relatorio in 'ModelRelatorio\Model.Relatorio.pas',
  UDMRelatorio in 'DM\UDMRelatorio.pas' {DMRelatorio: TDataModule},
  UnitConfiguracaoBancoDados in 'Form\Acesso\UnitConfiguracaoBancoDados.pas' {FrmConfiguracaoBancodados},
  UnitFrmWhatsAppMSG in 'Form\Sistema\UnitFrmWhatsAppMSG.pas' {FrmEnviarWhatsAppMSG},
  UnitCandidato in 'Form\Consulta\UnitCandidato.pas' {FrmCandidato},
  UnitDashBoard in 'Form\Sistema\UnitDashBoard.pas' {FrmDashBoard},
  UnitControleSindicato in 'Form\ModuloAssociaao\Sindicato\UnitControleSindicato.pas' {FrmAssociadoSindicato},
  UnitSede in 'Form\Consulta\UnitSede.pas' {FrmSede},
  Model.Secretaria in 'Model\Model.Secretaria.pas',
  Model.Sede_old in 'Model\Model.Sede_old.pas',
  UnitSecretariaCad in 'Form\Cadastro\UnitSecretariaCad.pas' {FrmsecretariaCad},
  UDMAtualiza in 'DM\UDMAtualiza.pas' {DMAtualiza: TDataModule},
  Model.Atualizacao in 'Model\Model.Atualizacao.pas',
  Model.Estoque in 'Model\Model.Estoque.pas',
  UnitEmailCad in 'Form\Acesso\UnitEmailCad.pas' {FrmEmailCad},
  AppVendas in 'AppVendas\AppVendas.pas',
  UnitPessoaCad in 'Form\Cadastro\UnitPessoaCad.pas' {FrmPessoaCad},
  UnitProdutoCad in 'Form\Cadastro\UnitProdutoCad.pas' {FrmProdutoCad},
  Model.ConfNF in 'Model\Model.ConfNF.pas',
  Model.SQLQry in 'Model\Model.SQLQry.pas',
  UnitGlobal in 'Utils\UnitGlobal.pas',
  UnitConfiguracao in 'Form\Acesso\UnitConfiguracao.pas' {FrmConfiguracao};

{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMAtualiza, DMAtualiza);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMRotinas, DMRotinas);
  Application.CreateForm(TDMRelatorio, DMRelatorio);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmEmailCad, FrmEmailCad);
  Application.CreateForm(TFrmPessoaCad, FrmPessoaCad);
  Application.CreateForm(TFrmProdutoCad, FrmProdutoCad);
  Application.CreateForm(TFrmConfiguracao, FrmConfiguracao);
  Application.Run;
end.
