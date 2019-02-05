Unit FExplorerIN;

// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ComCtrls, wwriched, Grids, Wwdbigrd, Wwdbgrid,
   Buttons, ExtCtrls, wwSpeedButton, wwDBNavigator, wwclearpanel;

Type
   TFExplorer = Class(TForm)
      pnlTextoSQL: TPanel;
      reTextoSQL: TwwDBRichEdit;
      pnlBotones: TPanel;
      sbEjecuta: TSpeedButton;
      pnlResultados: TPanel;
      dbgSQL: TwwDBGrid;
      pnlControles: TPanel;
      bbtnGridAlign: TBitBtn;
      dbnSQL: TwwDBNavigator;
      dbnSQLFirst: TwwNavButton;
      dbnSQLPriorPage: TwwNavButton;
      dbnSQLPrior: TwwNavButton;
      dbnSQLNext: TwwNavButton;
      dbnSQLNextPage: TwwNavButton;
      dbnSQLLast: TwwNavButton;
      dbnSQLInsert: TwwNavButton;
      dbnSQLDelete: TwwNavButton;
      dbnSQLEdit: TwwNavButton;
      dbnSQLPost: TwwNavButton;
      dbnSQLCancel: TwwNavButton;
      dbnSQLRefresh: TwwNavButton;
      dbnSQLSaveBookmark: TwwNavButton;
      dbnSQLRestoreBookmark: TwwNavButton;
      Procedure sbEjecutaClick(Sender: TObject);
      Procedure bbtnGridAlignClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FExplorer: TFExplorer;

Implementation

Uses ALMDM1;

{$R *.dfm}

Procedure TFExplorer.sbEjecutaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   dbgSQL.DataSource := Nil;
   xSQL := trimleft(reTextoSQL.Text);
   If uppercase(copy(xSQL, 1, 6)) = 'SELECT' Then
   Begin
      DMALM.cdsQry2.Close;
      DMALM.cdsQry2.DataRequest(xSQL);
      DMALM.cdsQry2.IndexFieldNames := '';
      DMALM.cdsQry2.Open;
      DMALM.cdsQry2.FetchOnDemand := False;
      DMALM.cdsQry2.PacketRecords := 35;
      dbgSQL.DataSource := DMALM.dsQry2;
      dbnSQL.DataSource := DMALM.dsQry2;
   End
   Else
   Begin
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         ShowMessage('ok');
      Except
         ShowMessage('Error en el SQL');
      End;
   End;
End;

Procedure TFExplorer.bbtnGridAlignClick(Sender: TObject);
Begin
   If dbgSQL.Align = alNone Then
      dbgSQL.Align := alClient
   Else
      dbgSQL.Align := alNone;
End;

Procedure TFExplorer.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   //FVariables.w_Num_Formas := FVariables.w_Num_Formas-1;
End;

End.

