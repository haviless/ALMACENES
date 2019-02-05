Unit ALM404;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Mask, wwdbedit, ExtCtrls;

Type
   TFPPedido = Class(TForm)
      pnlPrincipal: TPanel;
      lblArticulo: TLabel;
      Label1: TLabel;
      Label2: TLabel;
      dbeDescripcion: TwwDBEdit;
      wwDBEdit1: TwwDBEdit;
      wwDBEdit2: TwwDBEdit;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FPPedido: TFPPedido;

Implementation

Uses ALMDM1;

{$R *.DFM}

End.

