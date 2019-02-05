Unit ALM311;
// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ComCtrls, wwdblook, ALM600;

Type
   TFCierrexMes = Class(TForm)
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      gbPeriodo: TGroupBox;
      dblcPerALM: TwwDBLookupCombo;
      dtpFecha: TDateTimePicker;
      Label1: TLabel;
      Label3: TLabel;
      gbAccion: TGroupBox;
      chkSaldos: TCheckBox;
      chkCerrar: TCheckBox;
      gbCLA: TGroupBox;
      dblcALM: TwwDBLookupCombo;
      edtALM: TEdit;
      Procedure bbtnCancClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure fraCLAEnter(Sender: TObject);
      Procedure fraCLAExit(Sender: TObject);
   Private
    { Private declarations }
      sOldCIA, sOldLOC, sOldALM: String;
      sNewCIA, sNewLOC, sNewALM: String;
   Public
      Procedure Principal(Sender: TObject);
    { Public declarations }
   End;

Var
   FCierrexMes: TFCierrexMes;

Implementation

{$R *.DFM}
Uses ALMDM1;

Procedure TFCierrexMes.bbtnCancClick(Sender: TObject);
Begin
   close;
End;

Procedure TFCierrexMes.FormCreate(Sender: TObject);
Begin
   dm1.cdsCIA.Open;
   dm1.cdsLOC.Open;
   dm1.cdsALM.Open;
   dtpFecha.DateTime := now;
End;

Procedure TFCierrexMes.fraCLAEnter(Sender: TObject);
Begin
   sOldCIA := fraCLA.dblcCIA.Text;
   sOldLOC := fraCLA.dblcLOC.Text;
   sOldALM := fraCLA.dblcALM.Text;
End;

Procedure TFCierrexMes.fraCLAExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sNewCIA := fraCLA.dblcCIA.Text;
   sNewLOC := fraCLA.dblcLOC.Text;
   sNewALM := fraCLA.dblcALM.Text;
   If ((sNewCIA <> sOldCIA) Or (sNewLOC <> sOldLOC) Or (sNewALM <> sOldALM)) Then
   Begin
      sSQL := 'SELECT * FROM LOG104 WHERE CIAID=' + quotedStr(sNewCIA);
      sSQL := sSQL + ' AND LOCID=' + quotedStr(sNewLOC);
      sSQL := sSQL + ' AND ALMID=' + quotedStr(sNewALM);
      sSQL := sSQL + ' AND ( PERESTADO IS NULL OR PERESTADO<>' + quotedStr('S') + ') ';
      sSQL := sSQL + ' ORDER BY PERID';
      dm1.FiltraCDS(dm1.cdsPerALM, sSQL);
      If DM1.cdsPerAlm.recordcount = 0 Then
      Begin
         showmessage('No hay Periodos a cerrar');
         bbtnCanc.Setfocus;
         exit;
      End;
   End
   Else
   Begin
      bbtnCanc.Setfocus;
   End;
End;

Procedure TFCierrexMes.bbtnOkClick(Sender: TObject);
Begin
   If fraCLA.edtCia.Text = '' Then
   Begin
      ShowMessage('Falta Definición de Compañía');
      fraCLA.dblcCia.SetFocus;
      exit;
   End;
   If fraCLA.edtLOC.Text = '' Then
   Begin
      ShowMessage('Falta Definición de Localidad');
      fraCLA.dblcLOC.SetFocus;
      exit;
   End;
   If fraCLA.edtALM.Text = '' Then
   Begin
      ShowMessage('Falta Definición de Almacen');
      fraCLA.dblcALM.SetFocus;
      exit;
   End;
   If trim(dblcPerALM.Text) = '' Then
   Begin
      ShowMessage('Falta Periodo');
      dblcPerALM.SetFocus;
      exit;
   End;
   Principal(sender);
End;

Procedure TFCierrexMes.Principal(Sender: TObject);
Var
   sSQL, sWhere: String;
   sAno, sMes: String;
   sCIA, sLOC, sALM, sTIN: String;
   sArtID: String;
   nArtCont: double;
   cEstado: String;
   cFlag: char;
   sPerAlm: String;
   sNISAID, sTriID, sNISATIP: String;
Begin
   Screen.Cursor := crHourGlass;
   cFlag := ' ';
   sPerALM := dblcPerALM.Text;
   sCIA := fraCLA.dblcCIA.Text;
   sALM := fraCLA.dblcALM.Text;
   sLOC := fraCLA.dblcLOC.Text;
   sLOC := '01'; //fraCLA.dblcLOC.Text;
   sAno := copy(dblcPerALM.text, 1, 4);
   sMes := copy(dblcPerALM.text, 5, 2);
   sWhere := 'CIAID=' + quotedStr(sCIA) +
      ' AND ALMID=' + quotedStr(sALM) +
      ' AND LOCID=' + quotedStr(sLOC);
   If chkSaldos.Checked Then
   Begin
      cEstado := DM1.DisplayDescrip('prvTGE', 'LOG104', 'PERESTADO', 'PERID=' + quotedStr(sPerALM) + ' AND ' + sWhere, 'PERESTADO');
      If cEstado = 'S' Then
      Begin
         Screen.Cursor := crDefault;
         application.MessageBox('Este periodo ya esta cerrado', 'Error', MB_OK);
         exit;
      End;
      Screen.Cursor := crHourGlass;
      If (SRV_D = 'DB2NT') Or
         (SRV_D = 'DB2400') Then
      Begin
         sSQL := 'SELECT DET.CIAID, DET.LOCID, DET.ALMID, DET.TDAID, DET.NISAID, DET.NISATIP, CAB.NISSIT, ';
         sSQl := sSQL + ' DET.ARTID, DET.NISAFREG, DET.TRIID, ART.ARTCONT, TRAN.TRIOC ';
         sSQl := sSQL + ' FROM LOG315 DET ';
         sSQl := sSQL + ' LEFT JOIN LOG314 CAB ON ( (DET.CIAID = CAB.CIAID) AND (DET.LOCID = CAB.LOCID) AND (DET.ALMID = CAB.ALMID) AND (DET.TDAID = CAB.TDAID) AND (DET.NISAID = CAB.NISAID) AND (DET.NISATIP = CAB.NISATIP)  )';
         sSQl := sSQL + ' LEFT JOIN TGE205 ART ON (DET.ARTID=ART.ARTID)';
         sSQl := sSQL + ' LEFT JOIN TGE208 TRAN ON (DET.TRIID=TRAN.TRIID) ';
         sSQL := sSQL + ' WHERE CAB.NISSIT=' + quotedStr('ACEPTADO');
         sSQL := sSQL + ' AND MONTH(DET.NISAFREG)=' + inttoStr(strtoint(sMes));
         sSQL := sSQL + ' AND DET.CIAID=' + quotedStr(sCIA);
         sSQL := sSQL + ' AND DET.ALMID=' + quotedStr(sALM);
         sSQL := sSQL + ' AND DET.LOCID=' + quotedStr(sLOC) + ' ';
         sSQl := sSQL + ' ORDER BY DET.TDAID, DET.NISAID, DET.ARTID';
      End
      Else
         If SRV_D = 'ORACLE' Then
         Begin
            sSQL := 'SELECT DET.CIAID, DET.LOCID, DET.ALMID, DET.TDAID, DET.NISAID, DET.NISATIP, CAB.NISSIT, ';
            sSQl := sSQL + ' DET.ARTID, DET.NISAFREG, DET.TRIID, ART.ARTCONT, TRAN.TRIOC ';
            sSQl := sSQL + ' FROM LOG315 DET, LOG314 CAB, TGE205 ART, TGE208 TRAN';
            sSQL := sSQL + ' WHERE CAB.NISSIT=' + quotedStr('ACEPTADO');
            sSQL := sSQL + ' AND MONTH(DET.NISAFREG)=' + inttoStr(strtoint(sMes));
            sSQL := sSQL + ' AND DET.CIAID=' + quotedStr(sCIA);
            sSQL := sSQL + ' AND DET.ALMID=' + quotedStr(sALM);
            sSQL := sSQL + ' AND DET.LOCID=' + quotedStr(sLOC);
            sSQL := sSQL + ' AND DET.CIAID = CAB.CIAID(+) AND DET.LOCID = CAB.LOCID(+) AND DET.ALMID = CAB.ALMID(+) AND DET.TDAID = CAB.TDAID(+) AND DET.NISAID = CAB.NISAID(+) AND DET.NISATIP = CAB.NISATIP(+)';
            sSQL := sSQL + ' AND DET.ARTID=ART.ARTID(+)';
            sSQL := sSQL + ' AND DET.TRIID=TRAN.TRIID(+)';
            sSQl := sSQL + ' ORDER BY DET.TDAID, DET.NISAID, DET.ARTID';
         End;
      dm1.cdsQry.Close;
      dm1.cdsQry.ProviderName := 'prvTGE';
      dm1.cdsQry.DataRequest(sSQL);
      dm1.cdsQry.Open;
      dm1.cdsQry.first;
      While Not dm1.cdsQry.Eof Do
      Begin
         sNISAID := dm1.cdsQry.FieldByName('NISAID').asString;
         sNISATIP := DM1.cdsQry.FieldByName('NISATIP').asString;
         While (Not dm1.cdsQry.Eof) And (sNISAID = dm1.cdsQry.FieldByName('NISAID').asString)
            And (sNISATIP = DM1.cdsQry.FieldByName('NISATIP').asString) Do
         Begin
            sTriID := dm1.cdsQry.FieldByName('TRIID').asString;
    //Filtrar x CDSNIA y CDSNIS (ENTRADA Y SALIDA) log314
            sSQL := 'SELECT * FROM LOG314 WHERE ' + sWhere;
            sSQL := sSQL + ' AND NISAID=' + quotedStr(sNISAID);
            sSQL := sSQL + ' AND TRIID=' + quotedStr(sTriID);
            If dm1.cdsQry.FieldByName('NISATIP').asString = 'INGRESO' Then
            Begin
               cFlag := 'I';
               dm1.FiltraCDS(dm1.cdsNIA, sSQL + ' AND NISATIP=' + quotedStr('INGRESO'))
            End
            Else
            Begin
               cFlag := 'S';
               dm1.FiltraCDS(dm1.cdsNIS, sSQL + ' AND NISATIP=' + quotedStr('SALIDA'));
            End;
    //Filtrar cdsArti
            sArtID := dm1.cdsQry.FieldByName('ARTID').AsString;
            sSQL := 'SELECT * FROM TGE205 WHERE CIAID=' + quotedStr(sCIA) + ' AND ARTID=' + quotedStr(sArtID);
            dm1.FiltraCDS(dm1.cdsArti, sSQL);
    // Filtrar KDX
            sSQL := 'SELECT * FROM LOG315 WHERE ' + sWhere;
            sSQL := sSQL + ' AND NISAID=' + quotedStr(sNISAID);
            sSQL := sSQL + ' AND ARTID=' + quotedStr(sArtID);
            sSQL := sSQL + ' AND TDAID=' + quotedStr(dm1.cdsQry.FieldByName('TDAID').asString);
            dm1.FiltraCDS(dm1.cdsKDX, sSQL);

            nArtCont := dm1.cdsQry.FieldByName('ARTCONT').asFloat;
            dm1.ControlStock(sCIA, sALM, sLOC, sTIN, sArtID, sAno, sMes, nArtCont, cFlag);
            dm1.ActualizaArticulo(sCIA, sArtID, nArtCont, cFlag);
            dm1.cdsQry.next;
         End; // while (not dm1.cdsQry.Eof) and (sNISAID = dm1.cdsQry.FieldByName('NISAID').asString) do
     //dm1.ControlTran;
         DM1.ControlTran(0, Nil, '');
      //dm1.cdsARTI.ApplyUpdates(0);
      //dm1.cdsSTK.ApplyUpdates(0);
      //if  cFlag = 'I' then
      //dm1.cdsNIA.ApplyUpdates(0)
      //else
      //dm1.cdsNIS.ApplyUpdates(0);
      End; //while not dm1.cdsQry.Eof do
   End;
   If chkCerrar.Checked Then
   Begin
      sSQL := 'UPDATE LOG104 SET PERESTADO=' + quotedStr('S');
      If length(DM1.wUsuario) > 0 Then
         sSQL := sSQL + ', PERUSER=' + DM1.wUsuario
      Else
         sSQL := sSQL + ', PERUSER=' + quotedStr('');
      sSQL := sSQL + ', PERFREG=' + quotedStr(datetoStr(date));
  //    sSQL := sSQL +   ', PERHREG=' + quotedStr(timetoStr(time));
      sSQL := sSQL + ', PERMM=' + quotedStr(sMes);
      sSQL := sSQL + ', PERANO=' + quotedStr(sAno);
      sSQL := sSQL + ' WHERE PERID=' + quotedStr(sPerALM);
      sSQL := sSQL + ' AND ' + sWhere;
      DM1.DCOM1.AppServer.EjecutaQry(sSQL);
      fraCLA.OnExit(sender);
   End;
   Screen.Cursor := crDefault;
End;

End.

