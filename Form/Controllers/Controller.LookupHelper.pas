unit Controller.LookupHelper;

interface

uses
  Datasnap.DBClient, DAO.Utilitarios, System.SysUtils, System.Classes;

type
  TLookupHelper = class
  Private
    class procedure CopyDataSet(Source, Dest: TClientDataSet);
  public
    class procedure CarregarLookup(CDS: TClientDataSet; const ASQL: string);
  end;

implementation

uses
  uDM;

{ TLookupHelper }

{class procedure TLookupHelper.CarregarLookup(CDS: TClientDataSet; const ASQL: string);
var
  TempCDS: TClientDataSet;
begin
  TempCDS := TDAOUtil.GetDataSetAsCDS(dm.Conn, ASQL);
  CDS.Close;
  CDS.CloneCursor(TempCDS, True);
end;}

{class procedure TLookupHelper.CarregarLookup(CDS: TClientDataSet; const ASQL: string);
var
  TempCDS: TClientDataSet;
begin
  TempCDS := TDAOUtil.GetDataSetAsCDS(dm.Conn, ASQL);
  try
    CDS.DisableControls;
    CDS.Close;
    CDS.CreateDataSet; // Garante que estrutura esteja válida

    TempCDS.First;
    while not TempCDS.Eof do
    begin
      CDS.Append;
      CDS.FieldByName('id_socio').Value := TempCDS.FieldByName('id_socio').Value;
      CDS.FieldByName('cliente').Value := TempCDS.FieldByName('cliente').AsString;
      CDS.FieldByName('cpf').Value     := TempCDS.FieldByName('cpf').Value;
      CDS.Post;
      TempCDS.Next;
    end;
  finally
    CDS.EnableControls;
    TempCDS.Free;
  end;
end; }

class procedure TLookupHelper.CarregarLookup(CDS: TClientDataSet; const ASQL: string);
var
  TempCDS: TClientDataSet;
begin
  TempCDS := TDAOUtil.GetDataSetAsCDS(dm.Conn, ASQL);
  try
    CopyDataSet(TempCDS, CDS);
  finally
    TempCDS.Free;
  end;
end;


class procedure TLookupHelper.CopyDataSet(Source, Dest: TClientDataSet);
var
  I: Integer;
  FieldName: string;
begin
  if not Assigned(Source) or not Assigned(Dest) then
    Exit;

  Dest.DisableControls;
  try
    Dest.Close;
    Dest.CreateDataSet;

    Source.First;
    while not Source.Eof do
    begin
      Dest.Append;
      for I := 0 to Dest.Fields.Count - 1 do
      begin
        FieldName := Dest.Fields[I].FieldName;
        if Source.FindField(FieldName) <> nil then
          Dest.Fields[I].Value := Source.FieldByName(FieldName).Value;
      end;
      Dest.Post;
      Source.Next;
    end;
  finally
    Dest.EnableControls;
  end;
end;


{

Exemplo de uso

uses Controller.LookupHelper, Model.Pessoa;

TLookupHelper.CarregarLookup<TPessoa>(cdsPessoas, 'SELECT id_pessoa, nome FROM pessoa WHERE ativo = "S" ORDER BY nome');



}

end.

