unit Model.EntradaVeiculoFinanceiro;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('compra_pagamento')]
  TEntradaVeiculoFinanceiro = class

  Private
    Fstatusfin: string;
    Fobservacao: string;
    Fdata_pagamento: TDate;
    Fvalor: double;
    Fid_compra: Integer;
    Fparcelado: string;
    Fid_prazo: Integer;
    Fid_pagamento: Integer;
    Fgerar_financeiro: string;
    Fnumero_parcelas: Integer;
    Fforma_pagamento: string;
    Fdata_vencimento: TDate;
    Fnumero_doc: string;

  Public

    [FieldName('id_pagamento', True)]
    [FieldOptions([foInsert, foSelect])]
    property id_pagamento: Integer read Fid_pagamento write Fid_pagamento;

    [FieldName('id_compra')]
    [FieldOptions([foInsert, foSelect])]
    property id_compra: Integer read Fid_compra write Fid_compra;

    [FieldName('id_prazo')]
    [FieldOptions([foInsert, foSelect])]
    property id_prazo: Integer read Fid_prazo write Fid_prazo;

    [FieldName('forma_pagamento')]
    [FieldOptions([foInsert, foSelect])]
    property forma_pagamento: string read Fforma_pagamento write Fforma_pagamento;

    [FieldName('valor')]
    [FieldOptions([foInsert, foSelect])]
    property valor: double read Fvalor write Fvalor;

    [FieldName('data_pagamento')]
    [FieldOptions([foInsert, foSelect])]
    property data_pagamento: TDate read Fdata_pagamento write Fdata_pagamento;

    [FieldName('parcelado')]
    [FieldOptions([foInsert, foSelect])]
    property parcelado: string read Fparcelado write Fparcelado;

    [FieldName('numero_parcelas')]
    [FieldOptions([foInsert, foSelect])]
    property numero_parcelas: Integer read Fnumero_parcelas write Fnumero_parcelas;

    [FieldName('gerar_financeiro')]
    [FieldOptions([foInsert, foSelect])]
    property gerar_financeiro: string read Fgerar_financeiro write Fgerar_financeiro;

    [FieldName('observacao')]
    [FieldOptions([foInsert, foSelect])]
    property observacao: string read Fobservacao write Fobservacao;

    [FieldName('statusfin')]
    [FieldOptions([foInsert, foSelect])]
    property statusfin: string read Fstatusfin write Fstatusfin;

    [FieldName('data_vencimento')]
    [FieldOptions([foInsert, foSelect])]
    property data_vencimento: TDate read Fdata_vencimento write Fdata_vencimento;

    [FieldName('numero_doc')]
    [FieldOptions([foInsert, foSelect])]
    property numero_doc: string read Fnumero_doc write Fnumero_doc;


    {$REGION 'CamposVirtual'}

    {$ENDREGION}


  end;

implementation

end.

