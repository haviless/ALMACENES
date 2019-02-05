Unit ALM414;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ComCtrls, ExtCtrls;

Type
   TFToolArtCCosto = Class(TForm)
      pnlTool: TPanel;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      Z1sbActFiltro: TBitBtn;
      Z1sbCCosto: TBitBtn;
      Z2bbtnResKdxVal: TBitBtn;
      Z2bbtnResSalCCosto: TBitBtn;
      Z2bbtnResCtaCCosto: TBitBtn;
      Timer1: TTimer;
      Procedure FormCreate(Sender: TObject);
      Procedure Z1sbActFiltroClick(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolArtCCosto: TFToolArtCCosto;
   xAccesoBotones: Boolean;

Implementation

Uses oaIN4000, ALMDM1;

{$R *.DFM}

Procedure TFToolArtCCosto.FormCreate(Sender: TObject);
Begin
   dtpHasta.Date := Date;
End;

Procedure TFToolArtCCosto.Z1sbActFiltroClick(Sender: TObject);
Var
   xSQL, SalCCoDes, SalCCoHas: String;
Begin
   SalCCoDes := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime));
   SalCCoHas := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));
   xSQL := '( NISAFREG>=' + SalCCoDes + ' AND NISAFREG<=' + SalCCoHas + ')';
 //Mtx.SetFilter(xSQL );
End;

{
SELECT CIAID, LOCID, TINID, ALMID, CCOSID,  ARTID, COUNT(*) CONTA, SUM(KDXPEDIDOG * ARTPCG) VALG, SUM(KDXPEDIDOU * ARTPCU) VALU FROM LOG315 WHERE ARTID='00012105' AND NISAFDOC>='2001-04-01' AND NISAFDOC<='2001-04-30' AND CIAID='01' AND TINID='01'AND NISATIP ='SALIDA' GROUP BY CIAID, LOCID, TINID, ALMID, ARTID, ARTID ORDER BY CIAID, LOCID, TINID, ALMID, ARTID, ARTID
}

Procedure TFToolArtCCosto.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolArtCCosto';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolArtCCosto);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

End.

