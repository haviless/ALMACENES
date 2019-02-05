Unit ALM312;

// Actualizaciones
// HPC_201402_ALM 03/09/2014     Reordenamiento de Sangría
//                03/09/2014     Cambia Cierre, adicionando actualización de archivos de saldos LOG319 y LOG337
// HPC_201606_ALM 25/07/2016     Cambios en proceso de cierre de inventarios
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   wwdbdatetimepicker, Mask, wwdbedit, StdCtrls, wwdblook, ExtCtrls, Buttons, MsgDlgs;

Type
   TFApeCieOpe = Class(TForm)
      Label1: TLabel;
      bbtnGraba: TBitBtn;
      bbtnSalir: TBitBtn;
      Panel1: TPanel;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      pnlReg2: TPanel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      dbeNoCierreU: TwwDBEdit;
      dtpFIniU: TwwDBDateTimePicker;
      dtpFCierreU: TwwDBDateTimePicker;
      dtpFRegU: TwwDBDateTimePicker;
      dtpHRegU: TwwDBDateTimePicker;
      dbeUserU: TwwDBEdit;
      pnlReg3: TPanel;
      Label9: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      Label12: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      Label15: TLabel;
      dbeNoCierre: TwwDBEdit;
      dtpFIni: TwwDBDateTimePicker;
      dtpFCierre: TwwDBDateTimePicker;
      dtpFReg: TwwDBDateTimePicker;
      dtpHReg: TwwDBDateTimePicker;
      dbeUser: TwwDBEdit;
      Label16: TLabel;
      Label17: TLabel;
      Label18: TLabel;
      dbeALM: TwwDBEdit;
      dbeLOC: TwwDBEdit;
      dblcLOC: TwwDBLookupCombo;
      dblcALM: TwwDBLookupCombo;
      dblcTIN: TwwDBLookupCombo;
      dbeTIN: TEdit;
      bbtnNuevo: TBitBtn;
      bbtnElimina: TBitBtn;
      Procedure FormShow(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure bbtnSalirClick(Sender: TObject);
      Procedure dtpFCierreExit(Sender: TObject);
      Procedure dbeNoCierreExit(Sender: TObject);
      Procedure bbtnGrabaClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcALMExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnNuevoClick(Sender: TObject);
      Procedure dblcALMEnter(Sender: TObject);
      Procedure dblcTINEnter(Sender: TObject);
      Procedure dblcLOCEnter(Sender: TObject);
      Procedure dblcCiaEnter(Sender: TObject);
      Procedure bbtnEliminaClick(Sender: TObject);
   Private
    { Private declarations }
      Procedure GeneraCostoPromedio;
   Public
  { Public declarations }
   End;

Var
   FApeCieOpe: TFApeCieOpe;
   xWhere, xSQL: String;

Implementation

Uses ALMDM1, oaIN3000;

{$R *.DFM}

Procedure TFApeCieOpe.FormShow(Sender: TObject);
Begin
   pnlReg3.Enabled := False;
   bbtnElimina.Visible := False;

   xSQL := 'Select CIAID, LOCID, TINID, ALMID, NOCIERRE, CNSFRECU, CNSPRICIE, '
      +    '       CNSULTCIE, USUARIO, FREG, HREG '
      +    '  from LOG317 '
      +    ' order BY CIAID, LOCID, TINID, ALMID, CNSULTCIE';
   DMALM.cdsCierre.Close;
   DMALM.cdsCierre.DataRequest(xSQL);
   DMALM.cdsCierre.Open;

   FiltraTabla(DMALM.cdsCia, 'TGE101', 'CIAID', '');
   dblcCia.SetFocus;
End;

Procedure TFApeCieOpe.dblcCiaExit(Sender: TObject);
Begin
   If bbtnSalir.Focused Then Exit;
   xWhere := 'CIAID=' + quotedstr(dblcCIA.Text);
   edtCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', xWhere, 'CIADES');
   If length(edtCia.Text) = 0 Then
   Begin
      Raise Exception.Create('Falta Código de Compañía');
   End;

   xSQL := 'Select CIAID, LOCID, LOCDES, LOCABR, DIRECCION, TELEFONO '
      +    '  from TGE126 '
      +    ' where CIAID=' + quotedstr(dblcCIA.text);
   DMALM.cdsLOC.Close;
   DMALM.cdsLOC.DataRequest(xSQL);
   DMALM.cdsLOC.open;
End;

Procedure TFApeCieOpe.dblcLOCExit(Sender: TObject);
Begin
   If bbtnSalir.Focused Then Exit;
   xWhere := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeLoc.Text := DMALM.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', xWhere, 'LOCDES');

   If length(dbeLOC.Text) = 0 Then
   Begin
      Raise Exception.Create('Falta Código de Localidad');
   End;

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'Select CIAID, TINID, TINDES, TINABR, CUENTAID, TINUSU, TINVENTAS, '
      +    '       TINOC, TINNI, TINNS, HABILITADO, CODINVDEF '
      +    '  from TGE152 '
      +    ' where ' + xSQL;
   DMALM.cdsTINID.Close;
   DMALM.cdsTINID.DataRequest(xSQL);
   DMALM.cdsTINID.open;
End;

Procedure TFApeCieOpe.dblcTINExit(Sender: TObject);
Begin
   If bbtnSalir.Focused Then Exit;
   xWhere := 'TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeTIN.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xWhere, 'TINDES');

   If length(dbeTIN.Text) = 0 Then
   Begin
      Raise Exception.Create('Falta Código de Tipo de Inventario');
   End;

   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'Select CIAID, LOCID, TINID, ALMID, ALMDES, ALMABR, TDIARID, CIUID, ALMVTA, '
      +    '       ALMDIR, ALMTELF, ALMFAX, ALMEMAIL, ALMRESP, CUENTAID, FLAGVAR, '
      +    '       ALMENVIACIA, ALMACTIVOF, ACTIVO, TIE_ID '
      +    '  from TGE151 '
      +    ' where ' + xSQL;
   DMALM.cdsALM.Close;
   DMALM.cdsALM.DataRequest(xSQL);
   DMALM.cdsALM.open;
End;

Procedure TFApeCieOpe.dblcALMExit(Sender: TObject);
Var
   Y, M, D: Word;
Begin
   xWhere := 'LOCID=' + quotedstr(dblcLOC.text)
      + ' AND TINID=' + quotedstr(dblcTIn.text)
      + ' AND CIAID=' + quotedstr(dblcCIA.text)
      + ' AND ALMID=' + quotedstr(dblcALM.text);
   dbeALM.text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xWhere, 'ALMDES');

   If length(dbeALM.Text) = 0 Then
   Begin
      Raise Exception.Create('Falta Código de Almacén');
   End;

   dtpFCierreU.Date := DMALM.BuscaUltFecha('dspUltCxP', 'LOG317', 'CNSULTCIE', xWhere);

   xWhere := xWhere + ' AND '
      + 'CNSULTCIE=' + DMALM.wRepFuncDate + '''' + FormatDateTime(DMALM.wFormatFecha, dtpFCierreU.Date) + '''' + ')';
   DMALM.DisplayDescrip('prvTGE', 'LOG317', '*', xWhere, 'CNSULTCIE');
   dbeNoCierreU.Text := DMALM.cdsQry.FieldByName('NOCIERRE').AsString;
   If dbeNoCierreU.Text = '' Then
      dbeNoCierreU.Text := '000000';

   dtpFIniU.Date := DMALM.cdsQry.FieldByName('CNSPRICIE').AsDateTime;
   dbeUserU.Text := DMALM.cdsQry.FieldByName('USUARIO').AsString;
   dtpFRegU.Date := DMALM.cdsQry.FieldByName('FREG').AsDateTime;
   dtpHRegU.Time := DMALM.cdsQry.FieldByName('HREG').AsDateTime;

   DMALM.cdsCierre.Insert;
   DMALM.cdsCierre.FieldByName('CIAID').AsString := dblcCia.Text;
   DMALM.cdsCierre.FieldByName('LOCID').AsString := dblcLOC.Text;
   DMALM.cdsCierre.FieldByName('TINID').AsString := dblcTIN.Text;
   DMALM.cdsCierre.FieldByName('ALMID').AsString := dblcALM.Text;
   DMALM.cdsCierre.FieldByName('NOCIERRE').AsString := DMALM.StrZero(IntToStr(StrtoInt(dbeNoCierreU.Text) + 1), 6);
   DMALM.cdsCierre.FieldByName('CNSPRICIE').AsDateTime := dtpFCierreU.Date + 1;

   DecodeDate(DMALM.cdsCierre.FieldByName('CNSPRICIE').AsDateTime, Y, M, D);

   M := M + 1;
   If M = 13 Then
   Begin
      M := 1;
      Y := Y + 1;
   End;

   DMALM.cdsCierre.FieldByName('CNSULTCIE').AsDateTime := StrtoDate('01/' + DMALM.StrZero(IntToStr(M), 2) + '/' + IntToStr(Y)) - 1;

   DMALM.cdsCierre.FieldByName('USUARIO').AsString := DMALM.wUsuario;
   DMALM.cdsCierre.FieldByName('FREG').AsDateTime := DateS;
   DMALM.cdsCierre.FieldByName('HREG').AsdateTime := Time;
   DMALM.cdsCierre.Post;
   pnlReg2.Visible := True;
   bbtnNuevo.Visible := True;
   bbtnElimina.Visible := True;
End;

Procedure TFApeCieOpe.bbtnGrabaClick(Sender: TObject);
Var
   xWhere: String;
   xSQL: String;
Begin
   xWhere := '';
   If (Length(Trim(edtCia.Text)) = 0) Or
      (Length(Trim(dbeLOC.Text)) = 0) Or
      (Length(Trim(dbeTIN.Text)) = 0) Or
      (Length(Trim(dbeALM.Text)) = 0) Then
   Begin
      ErrorMsg(Caption, 'Registro no válido');
      Exit;
   End;

   xWhere := 'CIAID=' + QuotedStr(dblcCia.Text)
      + ' and LOCID=' + QuotedStr(dblcLOC.Text)
      + ' and TINID=' + QuotedStr(dblcTIN.Text)
      + ' and ALMID=' + QuotedStr(dblcALM.Text)
      + ' and NISAFREG<=''' + dtpFCierreU.Text + ''' '
      + ' and NISSIT=''INICIAL'' ';
   DMALM.DisplayDescrip('prvTGE', 'LOG314', 'NISAID', xWhere, 'NISAID');

   If DMALM.cdsQry.RecordCount > 0 Then
   Begin
      Information(Caption, 'Existen Notas de Entrada/Salida en Estado ''INICIAL'' No Puede Cerrar el Periodo Actual');
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   If Not Question(Caption, 'Desea Grabar el Nuevo Periodo de Trabajo') Then
      Exit;

   xSigueGrab := True;
   DMALM.DCOM1.AppServer.IniciaTransaccion;
   DMALM.cdsCierre.Edit;
   DMALM.cdsCierre.FieldByName('CNSFRECU').AsFloat := dtpFCierre.Date - dtpFIni.Date;
   DMALM.cdsCierre.FieldByName('HREG').AsdateTime := DateS + Time;
   DMALM.cdsCierre.Post;
   If DMALM.cdsCierre.ApplyUpdates(0) > 0 Then
   Begin
      xSQL := 'Insert Into LOG317(CIAID, LOCID, TINID, ALMID, NOCIERRE, CNSPRICIE, CNSULTCIE, USUARIO, CNSFRECU, FREG, HREG) '
         +    'values( '
         +              quotedstr(DMALM.cdsCierre.FieldByName('CIAID').AsString) + ','
         +              quotedstr(DMALM.cdsCierre.FieldByName('LOCID').AsString) + ','
         +              quotedstr(DMALM.cdsCierre.FieldByName('TINID').AsString) + ','
         +              quotedstr(DMALM.cdsCierre.FieldByName('ALMID').AsString) + ','
         +              quotedstr(DMALM.cdsCierre.FieldByName('NOCIERRE').AsString) + ','
         +              quotedstr(datetostr(DMALM.cdsCierre.FieldByName('CNSPRICIE').AsDateTime)) + ','
         +              quotedstr(datetostr(DMALM.cdsCierre.FieldByName('CNSULTCIE').AsDateTime)) + ','
         +              quotedstr(DMALM.cdsCierre.FieldByName('USUARIO').AsString) + ','
         +              floattostr(DMALM.cdsCierre.FieldByName('CNSFRECU').AsFloat) + ','
         +              'trunc(sysdate), '
         +              'sysdate) ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('No se pudo añadir un nuevo periodo de trabajo (LOG317)');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
   End;
   DMALM.DCOM1.AppServer.IniciaTransaccion;
   GeneraCostoPromedio;
   If Not xSigueGrab Then
   Begin
      Screen.Cursor := crDefault;
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      exit;
   End;
   DMALM.DCOM1.AppServer.GrabaTransaccion;
   Screen.Cursor := crDefault;

   pnlReg3.Enabled := False;
   bbtnGraba.Enabled := False;

   bbtnSalir.SetFocus;
   Information(Caption, 'Cierre Operativo Grabado');
End;

Procedure TFApeCieOpe.bbtnSalirClick(Sender: TObject);
Begin
   DMALM.cdsCierre.CancelUpdates;
   Close;
End;

Procedure TFApeCieOpe.dtpFCierreExit(Sender: TObject);
Begin
   If DMALM.cdsCierre.FieldByName('CNSULTCIE').AsdateTime <= dtpFCierreU.Date Then
   Begin
      Raise Exception.Create('Error : Fecha debe Ser Mayor a Fecha de Cierre Anterior');
   End;
End;

Procedure TFApeCieOpe.dbeNoCierreExit(Sender: TObject);
Begin
   If DMALM.cdsCierre.FieldByName('NOCIERRE').AsString <= dbeNoCierreU.Text Then
   Begin
      Raise Exception.Create('Error : Nº. Cierre debe Ser Mayor a Nº. Cierre de Cierre Anterior');
   End;

End;

Procedure TFApeCieOpe.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFApeCieOpe.GeneraCostoPromedio;
Var
   xSQL, xMes: String;
   Y, M, D: Word;
   xPeriodoAnt, xPeriodo: String;
   xFecini: String;
   verror: String;
Begin
   DecodeDate(dtpFIniU.date, Y, M, D);
   xMes := DMALM.StrZero(Floattostr(M), 2);

   xPeriodoAnt := inttostr(Y) + xMes;
   If M = 12 Then
      xPeriodo := inttostr(Y + 1) + '01'
   Else
      xPeriodo := inttostr(Y) + DMALM.StrZero(Floattostr(M + 1), 2);
   xSQL := ' Select * '
      +    '   from LOG330 '
      +    '  where CIAID=' + Quotedstr(dblcCia.text)
      +    '    and TINID=' + Quotedstr(dblcTIN.text)
      +    '    and STKANO=' + Quotedstr(Floattostr(Y));
   DMALM.cdsQry4.IndexFieldNames := '';
   DMALM.cdsQry4.Filter := '';
   DMALM.cdsQry4.Filtered := false;
   DMALM.cdsQry4.Close;
   DMALM.cdsQry4.DataRequest(xSQL);
   DMALM.cdsQry4.Open;
   If DMALM.cdsQry4.RecordCount = 0 Then
   Begin
      xSQL := ' Insert into LOG330(CIAID,TINID,ARTID,STKANO,ARTCPROG' + DMALM.StrZero(Floattostr(M), 2) + ',ARTCPROU' + DMALM.StrZero(Floattostr(M), 2) + ') '
         +    ' Select A.CIAID,A.TINID,A.ARTID,' + Quotedstr(Floattostr(Y)) + ' ,A.ARTCPROG ,A.ARTCPROU '
         +    '   from TGE205 A, LOG316 B '
         +    '  where (A.CIAID=' + Quotedstr(dblcCia.text)
         +    '    and A.TINID=' + Quotedstr(dblcTIN.text) + ')'
         +    '    and B.STKANO=' + Quotedstr(Floattostr(Y))
         +    '    and (B.CIAID=A.CIAID AND B.TINID=A.TINID AND B.ARTID=A.ARTID)';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('No se pudo añadir un nuevo periodo de trabajo <1> (LOG330)');
         xSigueGrab := False;
         exit;
      End;
   End
   Else
   Begin
      xSQL := ' Insert into LOG330(CIAID,TINID,ARTID,STKANO) '
         +    ' Select A.CIAID,A.TINID,A.ARTID ,A.STKANO'
         +    '   from LOG316 A '
         +    '  where (A.STKANO=' + Quotedstr(Floattostr(Y))
         +    '    and A.CIAID=' + Quotedstr(dblcCia.text)
         +    '    and A.TINID=' + Quotedstr(dblcTIN.text)
         +    '         ) '
         +    '    and A.ARTID not in (Select B.ARTID '
         +    '                          from LOG330 B '
         +    '                         where B.CIAID = ' + Quotedstr(dblcCia.text)
         +    '                           and B.TINID = ' + Quotedstr(dblcTIN.text)
         +    '                           and B.STKANO = ' + Quotedstr(Floattostr(Y))
         +    '                           and B.ARTID = A.ARTID)';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('No se pudo añadir un nuevo periodo de trabajo <2> (LOG330)');
         xSigueGrab := False;
         exit;
      End;

      xSQL := ' Update LOG330 A '
         +    '    set (A.ARTCPROG' + xMes + ',A.ARTCPROU' + xMes + ') ='
         +    '        (Select B.ARTCPROG, B.ARTCPROU '
         +    '           from TGE205 B'
         +    '          where B.CIAID=A.CIAID and B.TINID=A.TINID and B.ARTID=A.ARTID)'
         +    '  where A.CIAID=' + Quotedstr(dblcCia.text)
         +    '    and A.TINID=' + Quotedstr(dblcTin.text)
         +    '    and A.STKANO=' + Quotedstr(Floattostr(Y));
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('No se pudo actualizar el Costo Promedio en nuevo periodo de trabajo (LOG330)');
         xSigueGrab := False;
         exit;
      End;
   End;

// Inicio HPC_201606_ALM
//        Se cambia el store de ejecución del cierre
   XSQL := ' Declare v_err_num varchar2(2); v_err_msg varchar2(500);'
           + ' BEGIN SP_ALM_CIERRE_OPE_V2('
           + QuotedStr(Formatdatetime('YYYY', dtpFIniU.Date)) + ','
           + QuotedStr(dblcCia.Text) + ','
           + QuotedStr(dblcLOC.Text) + ','
           + QuotedStr(dblcTIN.Text) + ','
           + QuotedStr(dblcALM.Text) + ','
           + 'to_date('+QuotedStr(dtpFIniU.Text) + ',''dd/mm/yyyy''),'
           + 'to_date('+QuotedStr(dtpFCierreU.Text) + ',''dd/mm/yyyy''),'
           + QuotedStr(DMALM.wUsuario) + ','
           + 'v_err_num, v_err_msg ); END;' ;
// Fin HPC_201606_ALM           
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      ShowMessage('No se pudo actualizar los saldos [LOG319,LOG337]');
      xSigueGrab := False;
      exit;
   End;
End;

Procedure TFApeCieOpe.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Action := CAFree;
End;

Procedure TFApeCieOpe.bbtnNuevoClick(Sender: TObject);
Begin
   bbtnNuevo.Visible := False;
   bbtnElimina.Visible := False;

   pnlReg3.visible := True;
   bbtnGraba.visible := True;
   bbtnGraba.Enabled := True;
End;

Procedure TFApeCieOpe.dblcALMEnter(Sender: TObject);
Begin
   pnlReg2.Visible := False;
   bbtnNuevo.Visible := False;
   bbtnElimina.Visible := False;
   pnlReg3.visible := False;
   bbtnGraba.visible := False;
End;

Procedure TFApeCieOpe.dblcTINEnter(Sender: TObject);
Begin
   pnlReg2.Visible := False;
   bbtnNuevo.Visible := False;
   bbtnElimina.Visible := False;
   pnlReg3.visible := False;
   bbtnGraba.visible := False;
End;

Procedure TFApeCieOpe.dblcLOCEnter(Sender: TObject);
Begin
   pnlReg2.Visible := False;
   bbtnNuevo.Visible := False;
   bbtnElimina.Visible := False;
   pnlReg3.visible := False;
   bbtnGraba.visible := False;
End;

Procedure TFApeCieOpe.dblcCiaEnter(Sender: TObject);
Begin
   pnlReg2.Visible := False;
   bbtnNuevo.Visible := False;
   bbtnElimina.Visible := False;
   pnlReg3.visible := False;
   bbtnGraba.visible := False;
End;

Procedure TFApeCieOpe.bbtnEliminaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If Not Question(Caption, 'Esta Seguro de Eliminar Periodo de Trabajo') Then
      Exit;

   Screen.Cursor := crHourGlass;

   DMALM.DCOM1.AppServer.IniciaTransaccion;

   xSQL := 'Delete LOG317 '
      + '    Where CIAID=''' + dblcCia.Text + ''' '
      + '      and LOCID=''' + dblcLOC.Text + ''' '
      + '      and TINID=''' + dblcTIN.Text + ''' '
      + '      and ALMID=''' + dblcALM.Text + ''' '
      + '      and NOCIERRE=''' + dbeNoCierreU.Text + ''' ';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo borrar el periodo de trabajo (LOG317)');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

// Inicio HPC_201606_ALM Se excluye eliminación de registros
{   
   xSQL := 'Delete LOG319 '
      + '    Where CIAID=''' + dblcCia.Text + ''' '
      + '      and LOGANOMM=''' + FormatDateTime('YYYYMM', dtpFIniU.Date) + ''' '
      + '      and TINID=''' + dblcTIN.Text + ''' ';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo borrar el periodo en el archivo de Saldos de Stock (LOG319)');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   xSQL := 'Delete LOG337 '
      + '    Where CIAID=''' + dblcCia.Text + ''' '
      + '      and LOGANOMM=''' + FormatDateTime('YYYYMM', dtpFIniU.Date) + ''' ';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo borrar el periodo en el archivo de Saldos Valorizados (LOG337)');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;
 }
 // Fin HPC_201606_ALM

   DMALM.DCOM1.AppServer.GrabaTransaccion;
   Screen.Cursor := crDefault;

   dblcCiaExit(self);

   ShowMessage('Periodo Eliminado');
End;

End.

