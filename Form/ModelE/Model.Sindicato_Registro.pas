unit Model.Sindicato_Registro;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('sindicato_registro')]
  TModelSindRegistro = class

  Private
    Fobs: string;
    Fhora: TTime;
    Fid_registro: Integer;
    Fsincronizado: string;
    Fid_carteira: Integer;
    Fdata: TDate;
    Fid_usuario: Integer;
    Fnmusuario: string;
    Fwhatsapp: string;
    Fnome: string;
    Fmatricula: integer;

  Public
    [FieldName('id_registro', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_registro: Integer read Fid_registro write Fid_registro;

    [FieldName('id_carteira')]
    [FieldOptions([foInsert, foSelect])]
    property id_carteira: Integer read Fid_carteira write Fid_carteira;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('data')]
    [FieldOptions([foInsert, foselect])]
    property data: TDate read Fdata write Fdata;

    [FieldName('hora')]
    [FieldOptions([foInsert, foselect])]
    property hora: TTime read Fhora write Fhora;

    [FieldName('obs')]
    [FieldOptions([foInsert, foSelect])]
    property obs: string read Fobs write Fobs;

    [FieldName('sincronizado')]
    [FieldOptions([foInsert, foSelect])]
    property sincronizado: string read Fsincronizado write Fsincronizado;

    //variaveis
    [FieldName('matricula')]
    [FieldOptions([foInsert, foSelect])]
    [Editable(False)]
    property matricula: integer read Fmatricula write Fmatricula;

    [FieldName('nome')]
    [FieldOptions([foInsert, foSelect])]
    [Editable(False)]
    property nome: string read Fnome write Fnome;

    [FieldName('whatsapp')]
    [FieldOptions([foInsert, foSelect])]
    [Editable(False)]
    property whatsapp: string read Fwhatsapp write Fwhatsapp;

    [FieldName('nmusuario')]
    [FieldOptions([foInsert, foSelect])]
    [Editable(False)]
    property nmusuario: string read Fnmusuario write Fnmusuario;

  End;

implementation

{ TModelSindRegistro }

//function TModelSindRegistro.Localizar(out msg: string; campo: string; dt1,dt2:Tdate): Boolean;
//var
//  Qry: TUniQuery;
//  sqlQuery, sqlOrdem, sqlCampo: string;
//begin
//  Result  := False;
//
//  sqlQuery  := '  SELECT                                                    '+
//                ' s.id_registro,'+
//                ' s.data AS dataentrada,                                  '+
//                ' s.hora AS horaentrada,                                    '+
//                ' ss.matricula AS matricula,'+
//                ' COALESCE(ss.nome, d.nome) AS nome,                    '+
//                ' COALESCE(ss.whatsapp, d.fone) AS whatsapp,             '+
//                ' u.nome as nmusuario                                     '+
//                ' FROM                                                     '+
//                ' sindicato_registro s                                      '+
//                ' INNER JOIN                                                 '+
//                ' carteira c ON s.id_carteira = c.id_carteira                 '+
//                ' LEFT JOIN                                                    '+
//                ' socio ss ON c.id_socio = ss.id_socio                          '+
//                ' LEFT JOIN                                                    '+
//                ' sindicato_dependente d ON c.id_dependente = d.id_dependente   '+
//                ' INNER JOIN                                                     '+
//                ' usuario u on s.id_usuario = u.id_usuario where s.id_registro >0 and s.data >=:x and s.data <=:y ';
//
//  sqlOrdem  := ' order by s.data';
//
//  if campo <> '' then
//  begin
//    sqlCampo:= ' and (ss.matricula like :Filtro or '+
//                                 ' ss.nome like :filtro or'+
//                                 ' d.nome like :filtro)';
//  end;
//
//
//  Qry   := Tuniquery.Create(nil);
//
//  Try
//    try
//
//      Qry.Connection  := dm.Conn;
//
//      if campo <> '' then
//      begin
//        Qry.SQL.Text := SqlQuery + sqlCampo + sqlOrdem;
//        qry.ParamByName('filtro').Value := '%' + campo + '%';
//      end
//      else
//      begin
//        Qry.SQL.Text := SqlQuery + sqlOrdem;
//      end;
//
//      qry.Params.ParamByName('x').AsDateTime := dt1;
//      qry.Params.ParamByName('y').AsDateTime := dt2;
//
//      Qry.Open;
//
//      if dm.TabConsSindregistro.Active then //se estiver ativo limpar tabelas
//        begin
//          dm.TabConsSindregistro.EmptyDataSet;
//        end
//        else
//        begin
//          dm.TabConsSindregistro.Open;
//          dm.TabConsSindregistro.EmptyDataSet;
//        end;
//
//      if not qry.IsEmpty then
//      begin
//        Result  := True;
//        msg     := 'Pesquisa realizada com sucesso!';
//
//        Qry.First;
//        dm.TabConsSindregistro.DisableControls;
//
//        while not Qry.Eof do
//        begin
//          dm.TabConsSindregistro.Append;
//
//          dm.TabConsSindregistrodataentrada.AsDateTime    := Qry.fieldbyname('dataentrada').AsDateTime;
//          dm.TabConsSindregistrohoraentrada.AsDateTime    := Qry.Fieldbyname('horaentrada').AsDateTime;
//          dm.TabConsSindregistromatricula.asinteger   := Qry.Fieldbyname('matricula').asinteger;
//          dm.TabConsSindregistronome.asstring         := Qry.fieldbyname('nome').asstring;
//          dm.TabConsSindregistrofone.asstring         := Qry.fieldbyname('whatsapp').asstring;
//          dm.TabConsSindregistronmusuario.asstring    := Qry.fieldbyname('nmusuario').asstring;
//
//          dm.TabConsSindregistro.Post;
//          Qry.Next;
//        end;
//
//        dm.TabConsSindregistro.First;
//        dm.TabConsSindregistro.EnableControls;
//      end
//      else
//      msg := 'Nenhum registro encontrado!';
//
//      Qry.Close;
//    except on e:exception do
//      begin
//        raise
//      end;
//    end;
//  Finally
//    FreeAndnil(Qry);
//  End;
//end;

{ TModelSindRegistro }


end.
