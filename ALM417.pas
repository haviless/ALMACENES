Unit ALM417;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, DBCtrls, Buttons;

Type
   TFConArtHist = Class(TForm)
      Panel1: TPanel;
      Panel2: TPanel;
      DBText1: TDBText;
      DBText2: TDBText;
      PageControl1: TPageControl;
      tshActual: TTabSheet;
      dbgArtActual: TwwDBGrid;
      Z2bbtnRegCanc: TBitBtn;
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FConArtHist: TFConArtHist;

Implementation

Uses ALMDM1;

{$R *.DFM}

Procedure TFConArtHist.Z2bbtnRegCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFConArtHist.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
   dbgArtActual.ColumnByName('STKSACTG').FooterValue := FloatToStrF(DMALM.OperClientDataSet(DMALM.cdsSTK, 'SUM(STKSACTG)', ''), ffNumber, 15, 2);
   dbgArtActual.ColumnByName('STKSACTU').FooterValue := FloatToStrF(DMALM.OperClientDataSet(DMALM.cdsSTK, 'SUM(STKSACTU)', ''), ffNumber, 15, 2);
   dbgArtActual.ColumnByName('STKRACTG').FooterValue := FloatToStrF(DMALM.OperClientDataSet(DMALM.cdsSTK, 'SUM(STKRACTG)', ''), ffNumber, 15, 2);
   dbgArtActual.ColumnByName('STKRACTU').FooterValue := FloatToStrF(DMALM.OperClientDataSet(DMALM.cdsSTK, 'SUM(STKRACTU)', ''), ffNumber, 15, 2);
   dbgArtActual.ColumnByName('DIFG').FooterValue := FloatToStrF(DMALM.OperClientDataSet(DMALM.cdsSTK, 'SUM(DIFG)', ''), ffNumber, 15, 2);
   dbgArtActual.ColumnByName('DIFU').FooterValue := FloatToStrF(DMALM.OperClientDataSet(DMALM.cdsSTK, 'SUM(DIFU)', ''), ffNumber, 15, 2);
End;

Procedure TFConArtHist.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   //FVariables.w_IN_Registro := False;
   Action := CAFree;
End;

End.

