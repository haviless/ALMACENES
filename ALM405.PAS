unit ALM405;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, ExtCtrls;

type
  TFLEconomico = class(TForm)
    pnlPrincipal: TPanel;
    lblArticulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dbeDescripcion: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLEconomico: TFLEconomico;

implementation

uses ALMDM1;

{$R *.DFM}

end.

