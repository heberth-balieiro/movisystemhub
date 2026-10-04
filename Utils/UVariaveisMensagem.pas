unit UVariaveisMensagem;

interface

uses
  System.SysUtils, System.Classes;

function GetVariaveisMensagem: string;

implementation

function GetVariaveisMensagem: string;
begin
  Result :=
    '[Data]'       + sLineBreak +
    '[Empresa]'    + sLineBreak +
    '[Telefone_empresa]'    + sLineBreak +
    '[Nome]'       + sLineBreak +
    '[Vendedor]'   + sLineBreak +
    '[Pedido]'     + sLineBreak +
    '[Total]'      + sLineBreak +
    '[CPF]'        + sLineBreak +
    '[Matricula]'  + sLineBreak +
    '[Telefone]'   + sLineBreak +
    '[Email]'      + sLineBreak +
    '[Nascimento]' + sLineBreak +
    '[Campanha]'   + sLineBreak +
    '[Numero_os]'  + sLineBreak +
    '[Data_os]'    + sLineBreak +
    '[Hora_os]'    + sLineBreak +
    '[Status_os]'  + sLineBreak +
    '[Tipo_os]'    + sLineBreak +
    '[Nome_cliente]'+ sLineBreak +
    '[Nome_tecnico]'+ sLineBreak +
    '[Descricao_equipamento]';
end;

end.

