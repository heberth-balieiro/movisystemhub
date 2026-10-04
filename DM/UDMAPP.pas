unit UDMAPP;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TDMAPP = class(TDataModule)
    SincPessoa: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAPP: TDMAPP;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
