Unit ALM720;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ToolWin, ComCtrls, StdCtrls, ExtCtrls, Math;

Type
   TFToolMantParRepos = Class(TForm)
      cb1: TControlBar;
      ToolBar2: TToolBar;
      spb1: TSpeedButton;
      spb2: TSpeedButton;
      spb3: TSpeedButton;
      spbAct: TSpeedButton;
      spbNor: TSpeedButton;
      Timer1: TTimer;
      Procedure FormCreate(Sender: TObject);
      Procedure spbActClick(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
      Function ExtracWhere4SQL(sSQL: String): String;
   Public
    { Public declarations }
      Procedure ActSaldos;
      Procedure Edita(sARTID: String);
   End;

Var
   FToolMantParRepos: TFToolMantParRepos;
   xAccesoBotones: Boolean;

Implementation

//uses ALMDM1,ALM001 , ALM401, ALM402, ALM403;
Uses ALMDM1, oaIN2000, ALM401, ALM402, ALM403;

{$R *.DFM}

Procedure TFToolMantParRepos.ActSaldos;
Begin
   DMALM.cdsSaldos.Close;
   DMALM.cdsSaldos.DataRequest(Mtx2000.FMant.SQL);
   DMALM.cdsSaldos.Open;
End;

Procedure TFToolMantParRepos.Edita;
Var
   cTipo: char;
   sWhere: String;
Begin
   If spbNor.Down Then
      cTipo := 'N'
   Else
      cTipo := 'B';

//   sWhere := ExtracWhere4SQL(Mtx2000.FMant.SQL);

 //  ActSaldos;
 //  DMALM.cdsSaldos.Locate ('ARTID',VarArrayOf([sARTID]),[])  ;
   sWhere := 'SELECT * FROM LOG316 '
      + 'WHERE CIAID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('CIAID').AsString)
      + '  AND LOCID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('LOCID').AsString)
      + '  AND TINID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('TINID').AsString)
      + '  AND ALMID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('ALMID').AsString)
      + '  AND ARTID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('ARTID').AsString)
      + '  AND STKANO=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('STKANO').AsString);
   DMALM.cdsSaldos.Close;
   DMALM.cdsSaldos.DataRequest(sWhere);
   DMALM.cdsSaldos.Open;
   DMALM.cdsSaldos.Edit;

   If spb1.Down Then
   Begin
      FParRepos.whereSQL := sWhere;
      FParRepos.TipoProceso := cTipo;
      FParRepos.ShowModal; //ALM401
   End
   Else
      If spb2.down Then
      Begin
         If cTipo = 'N' Then
         Begin
            FUbicacion.pnlIngreso.Height := 77;
            FUbicacion.pnlIngreso.Left := 0;
            FUbicacion.pnlIngreso.Top := 104;
            FUbicacion.pnlIngreso.Width := 404;
         End
         Else
         Begin
            FUbicacion.pnlIngreso.Height := 181;
            FUbicacion.pnlIngreso.Left := 0;
            FUbicacion.pnlIngreso.Top := 0;
            FUbicacion.pnlIngreso.Width := 404;
         End;
         FUbicacion.whereSQL := sWhere;
         FUbicacion.TipoProceso := cTipo;
         FUbicacion.ShowModal; //ALM402
      End
      Else
         If spb3.down Then
         Begin
            FSaldosInic.whereSQL := sWhere;
            FSaldosInic.TipoProceso := cTipo;
            FSaldosInic.ShowModal; //ALM403
         End;
 //FInventario.ShowModal;
End;

Procedure TFToolMantParRepos.FormCreate(Sender: TObject);
Begin
   DMALM.cdsSaldos.Close;
   DMALM.cdsSaldos.DataRequest('SELECT * FROM LOG316 WHERE 1 = 2');
   DMALM.cdssaldos.Open;
End;

Function TFToolMantParRepos.ExtracWhere4SQL(sSQL: String): String;
Var
   sWhere: String;
   nPosWhere: integer;
   nPosGroupBy, nPosOrderBy: integer;
   nMin: integer;
Begin
   nMin := 0;
   nPosWhere := Pos('WHERE ', sSQL);
   If nPosWhere = 0 Then
   Begin
      result := '';
      exit;
   End;

   nPosGroupBy := Pos('GROUP BY', sSQL);
   nPosOrderBy := Pos('ORDER BY', sSQL);
   If (nPosGroupBy > 0) And (nPosOrderBy > 0) Then
      nMin := length(sSQL) - Min(nPosGroupBy, nPosOrderBy) + 1
   Else
      If (nPosGroupBy = 0) And (nPosOrderBy = 0) Then
         nMin := length(sSQL) - nPosWhere + 1
      Else
      Begin
         If nPosGroupBy = 0 Then
            nMin := length(sSQL) - nPosOrderBy + 3;
         If nPosOrderBy = 0 Then
            nMin := length(sSQL) - nPosGroupBy + 3;
      End;
   If nPosWhere > 0 Then
      sWhere := copy(sSQL, nPosWhere, nMin);
   result := trim(sWhere);
End;

Procedure TFToolMantParRepos.spbActClick(Sender: TObject);
Begin
   If application.MessageBox(
      'Todas las operaciones se realizarán sobre todos los registros,' + chr(10) + chr(13) + '                 ¿Aun desea Continuar?                       ',
      'Advertencia', MB_YESNO) = IDNO Then
   Begin
      spbAct.Down := false;
      spbNor.Down := true;
   End
   Else
   Begin
      FINMaestros.OnEditUbicArti(Sender, Nil);
   End;
End;

Procedure TFToolMantParRepos.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolMantParRepos';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolMantParRepos);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

End.

