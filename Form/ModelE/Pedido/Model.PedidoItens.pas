unit Model.PedidoItens;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

Type
  [TableName('pedido_itens')]
  TModelPedidoItens = Class

  Private
    Fdesconto_reais: Double;

    Fprodcodbarra: string;

    Fid_produto: integer;

    Fid_pedido_itens: integer;
    Fproaltdescricao: string;
    Fdescricao: string;
    Fid_pedido: integer;
    Fproddescricao: string;
    Fprodestoque: double;
    FProdFoto: String;
    Fqtde: Double;
    Fseqitem: integer;
    Fprc_unitario: Double;
    Fprc_subtotal: Double;
    Fcomplemento: string;
    Fprodfracionado: String;
    Fprc_total: Double;
    Fprodcodproduto: integer;
    Fdesconto_perc: Double;
    Fqtde_2: Double;
    Fpeso: Double;
    Fvolume: Double;
    Faltura: Double;

    Flargura: Double;
    Fpreco_m2: String;
    Fprc_unitariom2: Double;
    Fusa_chapa: String;
    Public

    [FieldName('id_pedido_itens', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property  id_pedido_itens   :integer    read  Fid_pedido_itens    write Fid_pedido_itens;

    [FieldName('id_pedido')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property  id_pedido       :integer    read  Fid_pedido        write Fid_pedido;

    [FieldName('id_produto')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property  id_produto       :integer    read  Fid_produto        write Fid_produto;

    [FieldName('qtde')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property qtde :Double read Fqtde  write Fqtde;

    [FieldName('qtde_2')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property qtde_2 :Double read Fqtde_2  write Fqtde_2;

    [FieldName('prc_unitario')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property prc_unitario :Double read Fprc_unitario  write Fprc_unitario;

    [FieldName('desconto_perc')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property desconto_perc :Double read Fdesconto_perc  write Fdesconto_perc;

    [FieldName('desconto_reais')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property desconto_reais :Double read Fdesconto_reais  write Fdesconto_reais;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property  descricao :string     read  Fdescricao  write Fdescricao;

    [FieldName('complemento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property  complemento :string     read  Fcomplemento  write Fcomplemento;

    [FieldName('prc_total')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property prc_total :Double read Fprc_total  write Fprc_total;

    [FieldName('prc_subtotal')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property prc_subtotal :Double read Fprc_subtotal  write Fprc_subtotal;

    [FieldName('seqitem')]
    [FieldOptions([foInsert, foSelect])]
    Property  seqitem       :integer    read  Fseqitem        write Fseqitem;

    [FieldName('peso')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property peso :Double read Fpeso  write Fpeso;

    [FieldName('volume')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property volume :Double read Fvolume  write Fvolume;

    [FieldName('altura')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property altura :Double read Faltura  write Faltura;

    [FieldName('largura')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property largura :Double read Flargura  write Flargura;

    [FieldName('prc_unitariom2')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property prc_unitariom2 :Double read Fprc_unitariom2  write Fprc_unitariom2;


    [FieldName('prodcodproduto')]
    [FieldOptions([foSelect])]
    [EditTable([False])]
    Property  prodcodproduto  :integer    read  Fprodcodproduto   write Fprodcodproduto;

    [FieldName('prodcodbarra')]
    [FieldOptions([foSelect])]
    [EditTable([False])]
    Property  prodcodbarra    :string     read  Fprodcodbarra     write Fprodcodbarra;

    [FieldName('proddescricao')]
    [FieldOptions([foSelect])]
    [EditTable([False])]
    Property  proddescricao   :string     read  Fproddescricao    write Fproddescricao;

    [FieldName('prodestoque')]
    [FieldOptions([foSelect])]
    [EditTable([False])]
    Property  prodestoque     :double     read  Fprodestoque      write Fprodestoque;

    [FieldName('proaltdescricao')]
    [FieldOptions([foSelect])]
    [EditTable([False])]
    Property  proaltdescricao :string     read  Fproaltdescricao  write Fproaltdescricao;

    [FieldName('ProdFoto')]
    [FieldOptions([foSelect])]
    [EditTable([False])]
    Property  ProdFoto        :String   read  FProdFoto          write FProdFoto;

    [FieldName('prodfracionado')]
    [FieldOptions([foSelect])]
    [EditTable([False])]
    Property  prodfracionado  :String   read  Fprodfracionado     write Fprodfracionado;

    [FieldName('preco_m2')]
    [FieldOptions([foSelect])]
    [EditTable([False])]
    Property  preco_m2  :String   read  Fpreco_m2     write Fpreco_m2;

    [FieldName('usa_chapa')]
    [FieldOptions([foInsert, foSelect])]
    Property  usa_chapa  :String   read  Fusa_chapa     write Fusa_chapa;


  End;
implementation

end.
