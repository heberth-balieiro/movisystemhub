unit Model.Estatisticas;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('socio')]
  TModelEstatisticas = class

    Private
      Fhomens: double ;
      Fmulheres: Double ;
      Fsituacao: String;
      Fcisgenero: double ;
      Foutros: double ;
      Fbinario: double ;
      Ftransgenero: double ;
      Ftotal: integer ;
      Fativo: double;
      Fcancelado: double;
      Finativo: double;
      Fafastado: double;
      Fsuspenso: double;
      Finadimplente: double;
      Fsecretaria: String;

    Public

    [FieldName('situacao')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property Situacao: String read Fsituacao write Fsituacao;

    [FieldName('homens')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property homens: double  read Fhomens write Fhomens;

    [FieldName('mulheres')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property mulheres: double  read Fmulheres write Fmulheres;

    [FieldName('cisgenero')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property cisgenero: double  read Fcisgenero write Fcisgenero;

    [FieldName('transgenero')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property transgenero: double  read Ftransgenero write Ftransgenero;

    [FieldName('binario')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property binario: double  read Fbinario write Fbinario;

    [FieldName('outros')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property outros: double  read Foutros write Foutros;

    [FieldName('total')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property total: integer  read Ftotal write Ftotal;


    //totais secretaria
    [FieldName('ativo')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property ativo: double  read Fativo write Fativo;

    [FieldName('inadimplente')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property inadimplente: double  read Finadimplente write Finadimplente;

    [FieldName('suspenso')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property suspenso: double  read Fsuspenso write Fsuspenso;

    [FieldName('afastado')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property afastado: double  read Fafastado write Fafastado;

    [FieldName('inativo')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property inativo: double  read Finativo write Finativo;

    [FieldName('cancelado')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property cancelado: double  read Fcancelado write Fcancelado;

    [FieldName('secretaria')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property secretaria: String read Fsecretaria write Fsecretaria;



  end;



implementation

{ TModelEstatistica }


end.
