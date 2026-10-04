unit Model.Cidade;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('CIDADE')]
  TCidade = class
  private
    Fuf: string;
    Fcid_ibge: Integer;
    Finativo: Integer;
    Fcidade: string;
    Fid_cidade: Integer;

  Public
    [FieldName('id_cidade', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_cidade: Integer read Fid_cidade write Fid_cidade;

    [FieldName('cidade')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cidade: string read Fcidade write Fcidade;

    [FieldName('uf')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property uf: string read Fuf write Fuf;

    [FieldName('inativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property inativo: integer read Finativo write Finativo;

    [FieldName('cid_ibge')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property cid_ibge: Integer read Fcid_ibge write Fcid_ibge;

  end;


implementation

end.
