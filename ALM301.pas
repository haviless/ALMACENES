Unit ALM301;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   ALM301
// Formulario           :   FMovAlmSalEnt
// Fecha de Creación    :
// Autor                :   Equipo de Desarrollo
// Objetivo             :   Ajustes de Inventario
// HPC_201404_ALM   24/10/2014 Unificación de módulos de Inventarios
//                  13/11/2014 Reordenamiento de Formulario
//                             Ajustes para Toma de Inventario 2014Nov
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Wwdbdlg, wwdbdatetimepicker, StdCtrls, DBCtrls, Mask, wwdbedit, Buttons,
   wwdblook, ExtCtrls, ComCtrls, wwSpeedButton, wwDBNavigator, wwclearpanel,
   db, Grids, Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin, Spin, Mant, MsgDlgs;

Type
   TFMovAlmSalEnt = Class(TForm)
      pnlCabecera: TPanel;
      Bevel1: TBevel;
      lblCIA: TLabel;
      lblObs: TLabel;
      Label2: TLabel;
      Bevel2: TBevel;
      Label3: TLabel;
      Z2bbtnProc: TBitBtn;
      dblcLOC: TwwDBLookupCombo;
      Bevel3: TBevel;
      lblNumNS: TLabel;
      Label1: TLabel;
      Label4: TLabel;
      dtpAjuSal: TDateTimePicker;
      Z2bbtnCancel: TBitBtn;
      gbPer: TGroupBox;
      speAno: TSpinEdit;
      speMM: TSpinEdit;
      Z2bbtnAcep: TBitBtn;
      dbeSal: TwwDBEdit;
      dbeIng: TwwDBEdit;
      dblcCIA: TwwDBLookupCombo;
      dblcALM: TwwDBLookupCombo;
      dbgAjuSal: TwwDBGrid;
      dbgAjuSalIButton: TwwIButton;
      pnlEtiq: TPanel;
      lblCaption: TLabel;
      pbProceso: TProgressBar;
      Z2bbtnDetAju: TBitBtn;
      dbeCIA: TEdit;
      dbeLOC: TEdit;
      dbeALM: TEdit;
      dbmObs: TMemo;
      Label5: TLabel;
      dblcTIN: TwwDBLookupCombo;
      dbeTIN: TEdit;
      Panel1: TPanel;
      BitBtn1: TBitBtn;
      Procedure Z2bbtnProcClick(Sender: TObject);
      Procedure Z2bbtnCancelClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure Z2bbtnAcepClick(Sender: TObject);
      Procedure dbgAjuSalDblClick(Sender: TObject);
      Procedure dbgAjuSalIButtonClick(Sender: TObject);
      Procedure Z2bbtnDetAjuClick(Sender: TObject);
      Procedure ActualizaSituacionAjuste(IngSal: Char);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcALMExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcTINExit(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure speMMExit(Sender: TObject);
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure FormShow(Sender: TObject);
   Private
      sCIA, sLOC, sTIN, sALM, sTDAS, sTDAE, sTRIS, sTRIE, sAno, sMes, sMes0: String;
      Procedure ProcDetalle;
      Function fg_AceptaAjuste: Boolean;
    { Private declarations }
   Public
    { Public declarations }
      Function DetalleKDXSE: String;

   End;

Var
   FMovAlmSalEnt: TFMovAlmSalEnt;
   MtxAI: TMant;
   D, M, Y: Word;
   xAno, xMes, xDia: Word;
   xWhere, wCuentaS, wCuentaE, NumAnoAjuInv: String;

Implementation

Uses ALMDM1, ALM201IN, oaIN5000;

{$R *.DFM}

Function TFMovAlmSalEnt.DetalleKDXSE: String;
Var
   sSQL, sQRY: String;
Begin
   If (Length(Trim(dbeSal.Text)) > 0) And (Length(Trim(dbeIng.Text)) > 0) Then
      sSQL := '(LOG315.NISAID=''' + dbeSal.Text + ''' OR LOG315.NISAID=''' + dbeIng.Text + ''') AND '
   Else
   Begin
      If (Length(Trim(dbeSal.Text)) > 0) Then
         sSQL := 'LOG315.NISAID=''' + dbeSal.Text + ''' AND '
      Else
         If (Length(Trim(dbeIng.Text)) > 0) Then
            sSQL := 'LOG315.NISAID=''' + dbeIng.Text + ''' AND ';
   End;

   sQRY := 'CIAID=' + quotedstr(dblcCIA.text);
   If (Length(Trim(dbeSal.Text)) > 0) And (Length(Trim(dbeIng.Text)) > 0) Then
      sSQL := sSQL + '(LOG315.TRIID=''' + DMALM.DisplayDescrip('prvTGE', 'TGE101', 'TRIIDS', sQRY, 'TRIIDS') + ''' OR LOG315.TRIID=''' + DMALM.DisplayDescrip('prvTGE', 'TGE101', 'TRIIDE', sQRY, 'TRIIDE') + ''')'
   Else
   Begin
      If (Length(Trim(dbeSal.Text)) > 0) Then
         sSQL := sSQL + 'LOG315.TRIID=''' + DMALM.DisplayDescrip('prvTGE', 'TGE101', 'TRIIDS', sQRY, 'TRIIDS') + ''''
      Else
         If (Length(Trim(dbeIng.Text)) > 0) Then
            sSQL := sSQL + 'LOG315.TRIID=''' + DMALM.DisplayDescrip('prvTGE', 'TGE101', 'TRIIDE', sQRY, 'TRIIDE') + '''';
   End;
   Result := sSQL;
End;

Procedure TFMovAlmSalEnt.ActualizaSituacionAjuste(IngSal: Char);
Var
   sSQL: String;
Begin
   DMALM.cdsAjuSal.Edit;
   DMALM.cdsAjuSal.FieldByName('FLAGVAR').AsString := 'P'; // Procesado
   DMALM.cdsAjuSal.Post;

   sSQL := ' UPDATE LOG333 SET TOINESTADO=''ACEPTADO'' WHERE TOINID=' + QuotedStr(DMALM.cdsAjuSal.FieldByName('INVCORR').AsString);
   DMALM.ExecSQL(sSQL);

   DMALM.ControlTran(0, Nil, '');
//Inicio HPC_201404_ALM
   sSQL := 'Update LOG314 '
      + '   set NISSIT = ''ACEPTADO'' '
      + ' where CIAID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('CIAID').AsString)
      + '   and LOCID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('LOCID').AsString)
      + '   and ALMID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('ALMID').AsString)
      + '   and TINID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('TINID').AsString)
      + '   and NISAID= ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('NISAIDE').AsString)
      + '   and NISATIP=''INGRESO'' ';
   DMALM.ExecSQL(sSQL);

   sSQL := ' Update  LOG315 '
      + '    set NISSIT = ' + QuotedStr('ACEPTADO')
      + '  where CIAID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('CIAID').AsString)
      + '    and LOCID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('LOCID').AsString)
      + '    and ALMID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('ALMID').AsString)
      + '    and TINID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('TINID').AsString)
      + '    and NISAID= ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('NISAIDE').AsString)
      + '    and NISATIP=' + QuotedStr('INGRESO');
   DMALM.ExecSQL(sSQL);

   sSQL := 'Update LOG314 '
      + '   set NISSIT = ''ACEPTADO'' '
      + ' where CIAID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('CIAID').AsString)
      + '   and LOCID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('LOCID').AsString)
      + '   and ALMID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('ALMID').AsString)
      + '   and TINID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('TINID').AsString)
      + '   and NISAID= ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('NISAIDS').AsString)
      + '   and NISATIP=''SALIDA''';
   DMALM.ExecSQL(sSQL);

   sSQL := ' Update LOG315 '
      + '    set NISSIT = ' + QuotedStr('ACEPTADO')
      + '  where CIAID  = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('CIAID').AsString)
      + '    and LOCID  = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('LOCID').AsString)
      + '    and ALMID  = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('ALMID').AsString)
      + '    and TINID  = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('TINID').AsString)
      + '    and NISAID = ' + QuotedStr(DMALM.cdsAjuSal.FieldByName('NISAIDS').AsString)
      + '    and NISATIP= ' + QuotedStr('SALIDA');
//Final HPC_201404_ALM
   DMALM.ExecSQL(sSQL);
End;

Procedure TFMovAlmSalEnt.Z2bbtnProcClick(Sender: TObject);
Var
   xxxSQL, sPer, sSQL, sFecha: String;
   intE, intS: integer;
   xsSql: String;
   xsNumero: String;
Begin
   If DMALM.cdsAjuSal.State <> dsInsert Then
   Begin
      ErrorMsg(Caption, ' No esta en modo de Inserción !! ');
      Exit;
   End;
   If (DMALM.cdsAjuSal.FieldByName('CIAID').AsString = '') Or
      (DMALM.cdsAjuSal.FieldByName('LOCID').AsString = '') Or
      (DMALM.cdsAjuSal.FieldByName('TINID').AsString = '') Or
      (DMALM.cdsAjuSal.FieldByName('ALMID').AsString = '') Then
   Begin
      ErrorMsg(Caption, ' Algunos de los Campos están en Blanco ');
      Exit;
   End;

   sCIA := DMALM.cdsAjuSal.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsAjuSal.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsAjuSal.FieldByName('TINID').AsString;
   sALM := DMALM.cdsAjuSal.FieldByName('ALMID').AsString;

   sSQL := 'CIAID=' + QuotedStr(sCIA);
   DMALM.DisplayDescrip('prvTGE', 'TGE101', 'TDAIDS,TDAIDE,TRIIDS,TRIIDE', sSQL, 'TDAIDS');

   sTDAS := DMALM.cdsQry.FieldByName('TDAIDS').AsString;
   sTDAE := DMALM.cdsQry.FieldByName('TDAIDE').AsString;
   sTRIS := DMALM.cdsQry.FieldByName('TRIIDS').AsString;
   sTRIE := DMALM.cdsQry.FieldByName('TRIIDE').AsString;

   If (sTDAS = '') Or (sTDAE = '') Or (sTRIS = '') Or (sTRIE = '') Then
   Begin
      ErrorMsg(Caption, ' La Compañia ' + dbeCIA.Text + #13 + #13 +
         ' No Cuenta con Parámetros Necesarios ' + #13 + #13 +
         ' Para Realizar el Ajuste de inventario ');
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   DecodeDate(dtpAjuSal.Date, Y, M, D);
   pbProceso.Visible := True;
//Inicio HPC_201404_ALM
   xxxSQL := ' CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + ' AND LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString)
      + ' AND TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + ' AND ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString)
      + ' AND TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString);
//Final HPC_201404_ALM
   DMALM.DisplayDescrip('prvTGE', 'LOG334', 'ARTID', xxxSQL, 'ARTID');
   pbProceso.Max := DMALM.cdsqry.RecordCount;
   pbProceso.Position := 1;
   sAno := speAno.Text;
   sMes := speMM.Text;

   sMes0 := DMALM.StrZero(sMes, 2);

//Inicio HPC_201404_ALM
   sSQL := 'SELECT * '
      + '  FROM LOG315 '
      + ' WHERE CIAID=''' + DMALM.cdsCInventario.FieldByName('CIAID').AsString + ''' AND NISATIP=''HH''';
//Final HPC_201404_ALM
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(sSQL);
   DMALM.cdsKDX.Open;

   sSQL := 'TRIID=''' + sTRIS + '''' + ' AND TRISGT=''S''';
   wCuentaS := DMALM.DisplayDescrip('prvTGE', 'TGE208', 'CUENTAID', sSQL, 'CUENTAID');

   sSQL := 'TRIID=''' + sTRIE + '''' + ' AND TRISGT=''I''';
   wCuentaE := DMALM.DisplayDescrip('prvTGE', 'TGE208', 'CUENTAID', sSQL, 'CUENTAID');
//Inicio HPC_201404_ALM
   sSQL := ' Select count(*) as TOTAL '
      + '   from LOG334 LOG316 '
      + '  where (LOG316.STKSACTG-LOG316.STKSFISG < 0 '
      + '      or LOG316.STKSACTU-LOG316.STKSFISU < 0) '
      + '    and ' + xxxSQL
      + '    and LOG316.STKINV=''S''';
//Final HPC_201404_ALM
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(sSQL);
   DMALM.cdsSQL.Open;
   intE := DMALM.cdsSQL.FieldByName('TOTAL').AsInteger;
//Inicio HPC_201404_ALM
   sSQL := 'Select count(*) as TOTAL '
      + '  from LOG334 LOG316 '
      + ' where (LOG316.STKSACTG-LOG316.STKSFISG > 0 '
      + '     or LOG316.STKSACTU-LOG316.STKSFISU > 0) '
      + '   and ' + xxxSQL
      + '   and LOG316.STKINV = ''S''';
//Final HPC_201404_ALM
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(sSQL);
   DMALM.cdsSQL.Open;
   intS := DMALM.cdsSQL.FieldByName('TOTAL').AsInteger;

   DMALM.cdsAjuSal.FieldByName('KDXANO').AsString := sAno;
   DMALM.cdsAjuSal.FieldByName('KDXMM').AsString := DMALM.StrZero(sMes, 2);
   DMALM.cdsAjuSal.FieldByName('FREG').AsDateTime := dtpAjuSal.Date;

//Inicio HPC_201404_ALM
   If intE > 0 Then
//      DMALM.cdsAjuSal.FieldByName('NISAIDE').AsString := DMALM.StrZero(DMALM.MaxNIA(sCIA, sALM, sTIN, sLOC, sTDAE), wAnchoIng); // Ingreso
   Begin
      xSSQL := 'CIAID=' + QuotedStr(sCIA) // cia. alm, tipo (sal/ent)
         + ' and ALMID=' + QuotedStr(sALM)
         + ' and NISATIP=' + QuotedStr('INGRESO')
         + ' and LOCID=' + QuotedStr(sLOC)
         + ' and TINID=' + QuotedStr(sTIN)
         + ' and NISAANO = ' + QuotedStr(speAno.Text);
      xsNumero := DMALM.MaxSQL('LOG314', 'NISAID', xsSql);
      If length(xsNumero) < wAnchoIng Then
      Begin
         xsNumero := sAno + DMALM.StrZero(xsNumero, 4);
      End;
      DMALM.cdsAjuSal.FieldByName('NISAIDE').AsString := xsNumero; // Ingreso
   End;
//Final HPC_201404_ALM

//Inicio HPC_201404_ALM
   If intS > 0 Then
//      DMALM.cdsAjuSal.FieldByName('NISAIDS').AsString := DMALM.StrZero(DMALM.MaxNIS(sCIA, sALM, sTIN, sLOC, sTDAS), wAnchoSal); // Salida
   Begin
      xsSql := 'CIAID=' + QuotedStr(sCIA) // cia. alm, tipo (sal/ent)
         + ' AND ALMID=' + QuotedStr(sALM)
         + ' AND NISATIP=' + QuotedStr('SALIDA')
         + ' AND LOCID=' + QuotedStr(sLOC)
         + ' AND TINID=' + QuotedStr(sTIN)
         + ' AND NISAANO = ' + QuotedStr(speAno.Text);
      xsNumero := DMALM.MaxSQL('LOG314', 'NISAID', xsSql);
      If length(xsNumero) < wAnchoSal Then
      Begin
         xsNumero := sAno + DMALM.StrZero(xsNumero, 4);
      End;
      DMALM.cdsAjuSal.FieldByName('NISAIDS').AsString := xsNumero; // Salida
   End;
//Final HPC_201404_ALM

   If Length(trim(dbmObs.text)) = 0 Then
      DMALM.cdsAjuSal.fieldbyname('OBSER').AsString := '.'
   Else
      DMALM.cdsAjuSal.fieldbyname('OBSER').AsString := dbmObs.text;
   If intE + intS > 0 Then
   Begin
      DMALM.cdsAjuSal.FieldByName('KDXUSER').AsString := DMALM.wUsuario;
      DMALM.cdsAjuSal.Post;
      DMALM.ControlTran(0, Nil, '');
      sPer := sAno + sMes0;
      Try
         sFecha := formatdatetime(DMALM.wFormatFecha, dtpAjuSal.DateTime);
         If intE > 0 Then
         Begin
         // Inicio HPC_201404_ALM
            sSQL := 'Insert into LOG314 (CIAID, LOCID, TINID, ALMID, NISAID, TRIID, '
               + '                    NISATIP,  NISANOMM,  NISAFREG,  TDAID, NISAOBS, NISSIT, NISAFDOC, NISAUSER,NISAANO ) '
               + 'Values (' + quotedstr(sCIA) + ',' + quotedstr(sLOC) + ',' + quotedstr(sTIN) + ',' + quotedstr(sALM) + ','
               + quotedstr(DMALM.cdsAjuSal.FieldByName('NISAIDE').AsString) + ',' + quotedstr(sTRIE) + ','
               + '        ''INGRESO'', ' + quotedstr(sAno + sMes0) + ',' + quotedstr(sFecha) + ','
               + quotedstr(sTDAE) + ', ''.'', ''INICIAL'', ' + quotedstr(sFecha) + ','
               + quotedstr(DMALM.wUsuario) + ', ' + QuotedStr(sAno) + ')';
         // Final HPC_201404_ALM
            DMALM.ExecSQL(sSQL);
         End;

         If intS > 0 Then
         Begin
         // Inicio HPC_201404_ALM
            sSQL := 'Insert into LOG314 (CIAID, LOCID, TINID, ALMID, NISAID, TRIID, '
               + '                    NISATIP, NISANOMM, NISAFREG, TDAID, NISAOBS, NISSIT, NISAFDOC, NISAUSER ,NISAANO) '
               + 'Values (' + quotedstr(sCIA) + ',' + quotedstr(sLOC) + ',' + quotedstr(sTIN) + ',' + quotedstr(sALM) + ','
               + quotedstr(DMALM.cdsAjuSal.FieldByName('NISAIDS').AsString) + ',' + quotedstr(sTRIS) + ','
               + '         ''SALIDA'',' + quotedstr(sAno + sMes0) + ',' + quotedstr(sFecha) + ','
               + quotedstr(sTDAS) + ', ''.'', ''INICIAL'', ' + quotedstr(sFecha) + ','
               + quotedstr(DMALM.wUsuario) + ', ' + QuotedStr(sAno) + ')';
         // Final HPC_201404_ALM
            DMALM.ExecSQL(sSQL);
         End;
         ProcDetalle; // Procedimiento para llenar el detalle en el log315
         DMALM.ControlTran(0, Nil, '');
         Screen.Cursor := crDefault;
         Z2bbtnAcep.Enabled := true;
         Z2bbtnProc.Enabled := false;
         pbProceso.Visible := false;
      Except
         Screen.Cursor := crDefault;
         ErrorMsg(Caption, 'Error ');
         DMALM.cdsAjuSal.Cancel;
         DMALM.cdsKDX.Cancel;
      End;
   End
   Else
   Begin
      Screen.Cursor := crDefault;
      pbProceso.Visible := false;
      ErrorMsg(Caption, ' No Existen Diferencias en la Tabla Saldos ');
   End;
End;

Procedure TFMovAlmSalEnt.ProcDetalle; // Proceso
Var
   sSQL, sMaxE, sMaxS, sFecha: String;
Begin
   sFecha := formatdatetime(DMALM.wFormatFecha, dtpAjuSal.DateTime);
   sSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
   DMALM.FiltraCDS(DMALM.cdsPeriodo, sSQL);
   DMALM.cdsDInventario.First;
   While Not DMALM.cdsDInventario.Eof Do
   Begin
      Application.ProcessMessages;
//--------------------------------------------------------------------------------------------------------------------------
//																							 Inserta el Ingreso
//--------------------------------------------------------------------------------------------------------------------------
      If ((DMALM.cdsDInventario.FieldByName('STKSACTG').AsFloat - DMALM.cdsDInventario.FieldByName('STKSFISG').AsFloat < 0) Or
         (DMALM.cdsDInventario.FieldByName('STKSACTU').AsFloat - DMALM.cdsDInventario.FieldByName('STKSFISU').AsFloat < 0)) And
         (DMALM.cdsDInventario.FieldByName('CIAID').AsString = sCIA) And
         (DMALM.cdsDInventario.FieldByName('ALMID').AsString = sALM) And // Ingreso
         (DMALM.cdsDInventario.FieldByName('LOCID').AsString = sLOC) And
         (DMALM.cdsDInventario.FieldByName('TINID').AsString = sTIN) And
         (DMALM.cdsDInventario.FieldByName('STKINV').AsString = 'S') Then
      Begin
         sMaxE := DMALM.StrZero(DMALM.MaxValue('KDXID', DMALM.cdsKDX), 5);
         DMALM.CDSKDX.insert;
         DMALM.cdsKDX.FieldByName('CIAID').AsString := sCIA;
         DMALM.cdsKDX.FieldByName('ALMID').AsString := sALM;
         DMALM.cdsKDX.FieldByName('NISAID').AsString := DMALM.cdsAjuSal.FieldByName('NISAIDE').AsString;
         DMALM.cdsKDX.FieldByName('ARTID').AsString := DMALM.cdsDInventario.FieldByName('ARTID').AsString;
         DMALM.cdsKDX.FieldByName('TDAID').AsString := sTDAE;
         DMALM.cdsKDX.FieldByName('TRIID').AsString := sTRIE;
         DMALM.cdsKDX.FieldByName('LOCID').AsString := sLOC;
         DMALM.cdsKDX.FieldByName('TINID').AsString := sTIN;
         DMALM.cdsKDX.FieldByName('KDXID').AsString := sMaxE;
         DMALM.cdsKDX.FieldByName('KDXPEDIDOG').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('KDXPEDIDOU').AsFloat := 0;

         DMALM.cdsKDX.FieldByName('KDXCNTG').AsFloat := abs(DMALM.cdsDInventario.FieldByName('STKSACTG').AsFloat - DMALM.cdsDInventario.FieldByName('STKSFISG').AsFloat);
         DMALM.cdsKDX.FieldByName('KDXCNTU').AsFloat := abs(DMALM.cdsDInventario.FieldByName('STKSACTU').AsFloat - DMALM.cdsDInventario.FieldByName('STKSFISU').AsFloat);

         DMALM.cdsKDX.FieldByName('KDXSALDOG').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('KDXSALDOU').AsFloat := 0;
         sSQL := 'ARTID=''' + DMALM.cdsDInventario.FieldByName('ARTID').AsString + ''' AND CIAID= ''' + sCIA + '''';
         DMALM.DisplayDescrip('prvLOG', 'TGE205', 'ARTID,ARTPCU,ARTPCG,ARTPVU,ARTPVG,ARTDES,GRARID,ARTCONT,UNMIDG,UNMIDU,FABID,FAMID,SFAMID,TINID,ARTSPRO,ARTFUC,TMONID,ARTCRGO,ARTACTIVO,CUENTAID,ARTCPROG,ARTCPROU,ARTSCA,ARTPARA,ARTPARA', sSQL, 'ARTID');

         DMALM.cdsKDX.FieldByName('ARTPCU').AsFloat := DMALM.cdsqry.fieldbyname('ARTCPROU').asfloat;
         DMALM.cdsKDX.FieldByName('ARTPCG').AsFloat := DMALM.cdsqry.fieldbyname('ARTCPROG').asfloat;
         DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsFloat := DMALM.cdsqry.fieldbyname('ARTCPROU').asfloat;
         DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsFloat := DMALM.cdsqry.fieldbyname('ARTCPROG').asfloat;
         DMALM.cdsKDX.FieldByName('ARTSCA').AsString := DMALM.cdsqry.fieldbyname('ARTSCA').AsString;
         DMALM.cdsKDX.FieldByName('ARTPARA').AsString := DMALM.cdsqry.fieldbyname('ARTPARA').AsString;
         DMALM.cdsKDX.FieldByName('ARTSNA').AsString := DMALM.cdsqry.fieldbyname('ARTPARA').AsString;

         DMALM.cdsKDX.FieldByName('ARTPVU').AsFloat := DMALM.cdsqry.fieldbyname('ARTPVU').asfloat;
         DMALM.cdsKDX.FieldByName('ARTPVG').AsFloat := DMALM.cdsqry.fieldbyname('ARTPVG').asfloat;
         DMALM.cdsKDX.FieldByName('ARTDES').AsString := DMALM.cdsqry.fieldbyname('ARTDES').asString;
         DMALM.cdsKDX.FieldByName('ARTSPRO').AsString := DMALM.cdsqry.FieldByName('ARTSPRO').AsString;
         DMALM.cdsKDX.FieldByName('GRARID').AsString := DMALM.cdsqry.fieldbyname('GRARID').asString;
         DMALM.cdsKDX.FieldByName('ARTCONT').AsFloat := DMALM.cdsqry.fieldbyname('ARTCONT').asFloat;
         DMALM.cdsKDX.FieldByName('UNMIDG').AsString := DMALM.cdsqry.fieldbyname('UNMIDG').asString;
         DMALM.cdsKDX.FieldByName('UNMIDU').AsString := DMALM.cdsqry.fieldbyname('UNMIDU').asString;
         DMALM.cdsKDX.FieldByName('FABID').AsString := DMALM.cdsqry.fieldbyname('FABID').asString;
         DMALM.cdsKDX.FieldByName('FAMID').AsString := DMALM.cdsqry.fieldbyname('FAMID').asString;
         DMALM.cdsKDX.FieldByName('SFAMID').AsString := DMALM.cdsqry.fieldbyname('SFAMID').asString;
         DMALM.cdsKDX.FieldByName('TINID').AsString := DMALM.cdsqry.fieldbyname('TINID').asString;
         DMALM.cdsKDX.FieldByName('ARTFUC').AsDateTime := DMALM.cdsqry.FieldByName('ARTFUC').AsDateTime;
         DMALM.cdsKDX.FieldByName('TMONID').AsString := DMALM.cdsqry.FieldByName('TMONID').AsString;
         DMALM.cdsKDX.FieldByName('ARTCRGO').AsFloat := DMALM.cdsqry.FieldByName('ARTCRGO').AsFloat;
         DMALM.cdsKDX.FieldByName('ARTACTIVO').AsString := DMALM.cdsqry.FieldByName('ARTACTIVO').AsString;
         DMALM.cdsKDX.FieldByName('CUENTAID').AsString := DMALM.cdsqry.FieldByName('CUENTAID').AsString;

         DMALM.cdsKDX.FieldByName('NISATIP').AsString := 'INGRESO';
      // Inicio HPC_201404_ALM
         DMALM.cdsKDX.FieldByName('NISAFREG').AsDateTime := dtpAjuSal.Date;
         DMALM.cdsKDX.FieldByName('NISAFDOC').AsDateTime := dtpAjuSal.Date;
      // Final  HPC_201404_ALM
         DMALM.cdsKDX.FieldByName('NISANDOC').AsString := DMALM.cdsAjuSal.FieldByName('NISAIDE').AsString;
         DMALM.cdsKDX.FieldbyName('KDXUSER').AsString := DMALM.wUsuario;
         DMALM.cdsKDX.FieldbyName('KDXANO').AsString := sAno;
         DMALM.cdsKDX.FieldbyName('KDXMM').AsString := sMes;
         DMALM.cdsKDX.FieldbyName('KDXDD').AsString := DMALM.strzero(IntToStr(D), 2);
         DMALM.cdsKDX.FieldbyName('CUENTA2ID').AsString := wCUENTAE;

         DMALM.cdsKDX.FieldbyName('KDXANOMM').AsString := sAno + SMes0;
         DMALM.cdsKDX.FieldbyName('KDXTRI').AsString := DMALM.cdsPeriodo.fieldbyName('FECTRIM').asString;
         DMALM.cdsKDX.FieldbyName('KDXSEM').AsString := DMALM.cdsPeriodo.fieldbyName('FECSEM').asString;
         DMALM.cdsKDX.FieldbyName('KDXSS').AsString := DMALM.cdsPeriodo.fieldbyName('FECSS').asString;
         DMALM.cdsKDX.FieldbyName('KDXAATRI').AsString := DMALM.cdsPeriodo.fieldbyName('FECAATRI').asString;
         DMALM.cdsKDX.FieldbyName('KDXAASEM').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASEM').asString;
         DMALM.cdsKDX.FieldbyName('KDXAASS').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASS').asString;
      // Inicio HPC_201404_ALM
         DMALM.cdsKDX.FieldbyName('KDXFREG').AsDateTime := dtpAjuSal.Date;
         DMALM.cdsKDX.FieldbyName('KDXHREG').AsDateTime := SysUtils.Date + SysUtils.Time;
      // Final  HPC_201404_ALM
         DMALM.cdsDInventario.Edit;
         DMALM.cdsDInventario.FieldByName('STKINV').AsString := 'T';
         DMALM.cdsDInventario.Post;
         DMALM.cdsKDX.Post;
         pbProceso.Position := pbProceso.Position + 1;
      End
      Else
//--------------------------------------------------------------------------------------------------------------------------
//																							 Inserta el Salida
//--------------------------------------------------------------------------------------------------------------------------
         If ((DMALM.cdsDInventario.FieldByName('STKSACTG').AsFloat - DMALM.cdsDInventario.FieldByName('STKSFISG').AsFloat > 0) Or
            (DMALM.cdsDInventario.FieldByName('STKSACTU').AsFloat - DMALM.cdsDInventario.FieldByName('STKSFISU').AsFloat > 0)) And
            (DMALM.cdsDInventario.FieldByName('CIAID').AsString = sCIA) And
            (DMALM.cdsDInventario.FieldByName('ALMID').AsString = sALM) And // Salida
            (DMALM.cdsDInventario.FieldByName('LOCID').AsString = sLOC) And
            (DMALM.cdsDInventario.FieldByName('TINID').AsString = sTIN) And
            (DMALM.cdsDInventario.FieldByName('STKINV').AsString = 'S') Then
         Begin
            sMaxS := DMALM.StrZero(DMALM.MaxValue('KDXID', DMALM.cdsKDX), 5);
            DMALM.CDSKDX.insert;
            DMALM.cdsKDX.FieldByName('CIAID').AsString := sCIA;
            DMALM.cdsKDX.FieldByName('ALMID').AsString := sALM;
            DMALM.cdsKDX.FieldByName('NISAID').AsString := DMALM.cdsAjuSal.FieldByName('NISAIDS').AsString;
            DMALM.cdsKDX.FieldByName('ARTID').AsString := DMALM.cdsDInventario.FieldByName('ARTID').AsString;
            DMALM.cdsKDX.FieldByName('TDAID').AsString := sTDAS;
            DMALM.cdsKDX.FieldByName('TRIID').AsString := sTRIS;
            DMALM.cdsKDX.FieldByName('LOCID').AsString := sLOC;
            DMALM.cdsKDX.FieldByName('TINID').AsString := sTIN;
            DMALM.cdsKDX.FieldByName('KDXID').AsString := sMaxS;
            DMALM.cdsKDX.FieldByName('KDXPEDIDOG').AsFloat := 0;
            DMALM.cdsKDX.FieldByName('KDXPEDIDOU').AsFloat := 0;

            DMALM.cdsKDX.FieldByName('KDXCNTG').AsFloat := abs(DMALM.cdsDInventario.FieldByName('STKSACTG').AsFloat - DMALM.cdsDInventario.FieldByName('STKSFISG').AsFloat);
            DMALM.cdsKDX.FieldByName('KDXCNTU').AsFloat := abs(DMALM.cdsDInventario.FieldByName('STKSACTU').AsFloat - DMALM.cdsDInventario.FieldByName('STKSFISU').AsFloat);

            DMALM.cdsKDX.FieldByName('KDXSALDOG').AsFloat := 0;
            DMALM.cdsKDX.FieldByName('KDXSALDOU').AsFloat := 0;

            sSQL := 'ARTID=''' + DMALM.cdsDInventario.FieldByName('ARTID').AsString + ''' AND CIAID=' + quotedstr(dblcCIA.Text) + ' AND TINID=' + quotedstr(dblcTIN.Text);
            DMALM.DisplayDescrip('prvLOG', 'TGE205', 'ARTID,ARTPCU,ARTPCG,ARTPVU,ARTPVG,ARTDES,GRARID,ARTCONT,UNMIDG,UNMIDU,FABID,FAMID,SFAMID,TINID,ARTSPRO,ARTFUC,TMONID,ARTCRGO,ARTACTIVO,CUENTAID,ARTCPROG,ARTCPROU,ARTSCA,ARTPARA,ARTSNA', sSQL, 'ARTID');

            DMALM.cdsKDX.FieldByName('ARTPCU').AsFloat := DMALM.cdsqry.fieldbyname('ARTCPROU').asfloat;
            DMALM.cdsKDX.FieldByName('ARTPCG').AsFloat := DMALM.cdsqry.fieldbyname('ARTCPROG').asfloat;
            DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsFloat := DMALM.cdsqry.fieldbyname('ARTCPROU').asfloat;
            DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsFloat := DMALM.cdsqry.fieldbyname('ARTCPROG').asfloat;
            DMALM.cdsKDX.FieldByName('ARTSCA').AsString := DMALM.cdsqry.fieldbyname('ARTSCA').AsString;
            DMALM.cdsKDX.FieldByName('ARTPARA').AsString := DMALM.cdsqry.fieldbyname('ARTPARA').AsString;
            DMALM.cdsKDX.FieldByName('ARTSNA').AsString := DMALM.cdsqry.fieldbyname('ARTSNA').AsString;

            DMALM.cdsKDX.FieldByName('ARTDES').AsString := DMALM.cdsqry.fieldbyname('ARTDES').asstring;
            DMALM.cdsKDX.FieldByName('GRARID').AsString := DMALM.cdsqry.fieldbyname('GRARID').asstring;
            DMALM.cdsKDX.FieldByName('ARTCONT').AsFloat := DMALM.cdsqry.fieldbyname('ARTCONT').asFloat;
            DMALM.cdsKDX.FieldByName('UNMIDG').AsString := DMALM.cdsqry.fieldbyname('UNMIDG').asstring;
            DMALM.cdsKDX.FieldByName('UNMIDU').AsString := DMALM.cdsqry.fieldbyname('UNMIDU').asstring;
            DMALM.cdsKDX.FieldByName('FABID').AsString := DMALM.cdsqry.fieldbyname('FABID').asstring;
            DMALM.cdsKDX.FieldByName('FAMID').AsString := DMALM.cdsqry.fieldbyname('FAMID').asString;
            DMALM.cdsKDX.FieldByName('SFAMID').AsString := DMALM.cdsqry.fieldbyname('SFAMID').asString;
            DMALM.cdsKDX.FieldByName('TINID').AsString := DMALM.cdsqry.fieldbyname('TINID').asstring;
            DMALM.cdsKDX.FieldByName('ARTSPRO').AsString := DMALM.cdsqry.FieldByName('ARTSPRO').AsString;
            DMALM.cdsKDX.FieldByName('ARTFUC').AsDateTime := DMALM.cdsqry.FieldByName('ARTFUC').AsDateTime;
            DMALM.cdsKDX.FieldByName('TMONID').AsString := DMALM.cdsqry.FieldByName('TMONID').AsString;
            DMALM.cdsKDX.FieldByName('ARTCRGO').AsFloat := DMALM.cdsqry.FieldByName('ARTCRGO').AsFloat;
            DMALM.cdsKDX.FieldByName('ARTACTIVO').AsString := DMALM.cdsqry.FieldByName('ARTACTIVO').AsString;
            DMALM.cdsKDX.FieldByName('CUENTAID').AsString := DMALM.cdsqry.FieldByName('CUENTAID').AsString;

            DMALM.cdsKDX.FieldByName('NISATIP').AsString := 'SALIDA';
         // Inicio HPC_201404_ALM
            DMALM.cdsKDX.FieldByName('NISAFREG').AsDateTime := dtpAjuSal.Date;
            DMALM.cdsKDX.FieldByName('NISAFDOC').AsDateTime := dtpAjuSal.Date;
         // Final HPC_201404_ALM
            DMALM.cdsKDX.FieldByName('NISANDOC').AsString := DMALM.cdsAjuSal.FieldByName('NISAIDS').AsString;
            DMALM.cdsKDX.FieldbyName('CUENTA2ID').AsString := wCUENTAS;

            DMALM.cdsKDX.FieldbyName('KDXUSER').AsString := DMALM.wUsuario;
            DMALM.cdsKDX.FieldbyName('KDXANO').AsString := sAno;
            DMALM.cdsKDX.FieldbyName('KDXMM').AsString := sMes;
            DMALM.cdsKDX.FieldbyName('KDXDD').AsString := DMALM.strzero(IntToStr(D), 2);
            DMALM.cdsKDX.FieldbyName('KDXANOMM').AsString := sAno + SMes0;
            DMALM.cdsKDX.FieldbyName('KDXTRI').AsString := DMALM.cdsPeriodo.fieldbyName('FECTRIM').asString;
            DMALM.cdsKDX.FieldbyName('KDXSEM').AsString := DMALM.cdsPeriodo.fieldbyName('FECSEM').asString;
            DMALM.cdsKDX.FieldbyName('KDXSS').AsString := DMALM.cdsPeriodo.fieldbyName('FECSS').asString;
            DMALM.cdsKDX.FieldbyName('KDXAATRI').AsString := DMALM.cdsPeriodo.fieldbyName('FECAATRI').asString;
            DMALM.cdsKDX.FieldbyName('KDXAASEM').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASEM').asString;
            DMALM.cdsKDX.FieldbyName('KDXAASS').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASS').asString;
         // Inicio HPC_201404_ALM
            DMALM.cdsKDX.FieldbyName('KDXFREG').AsDateTime := dtpAjuSal.Date;
            DMALM.cdsKDX.FieldbyName('KDXHREG').AsDateTime := SysUtils.Date + SysUtils.Time;
         // Final HPC_201404_ALM

            DMALM.cdsDInventario.Edit;
            DMALM.cdsDInventario.FieldByName('STKINV').AsString := 'T';
            DMALM.cdsDInventario.Post;
            DMALM.cdsKDX.Post;
         End;
      pbProceso.Position := pbProceso.Position + 1;

      DMALM.cdsDInventario.Next;
   End;
   DMALM.ControlTran(0, Nil, '');
End;

Procedure TFMovAlmSalEnt.Z2bbtnCancelClick(Sender: TObject);
Begin
   DMALM.cdsAjuSal.Cancel;
   dbgAjuSal.Enabled := True;
   pnlCabecera.Visible := false;
End;

Procedure TFMovAlmSalEnt.FormActivate(Sender: TObject);
Var
   xSQL: String; // HPC_201404_ALM
Begin
//Inicio HPC_201404_ALM
{
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value := xAno;
   speMM.Value := xMes;
   NumAnoAjuInv := copy(DMALM.DisplayDescrip('prvTGE', 'oaREGLAS', 'VRN_NUMCORANO', 'VRN_MODULO=''ALM''', 'VRN_NUMCORANO'), 3, 1);
}
   DMALM.cdsAjuSal.Close;
   //DMALM.cdsAjuSal.DataRequest('select * from LOG102 ' );
   DMALM.cdsAjuSal.DataRequest('select * from LOG102 where INVCORR=''' + FINInventarios.sInvCorr + ''' ');
//Final HPC_201404_ALM
   DMALM.cdsAjuSal.Open;

   dbgAjuSal.DataSource := DMALM.dsAjuSal;

   dbgAjuSal.Selected.clear;
   dbgAjuSal.Selected.Add('INVCORR'#9'12'#9'Nº');
   dbgAjuSal.Selected.Add('CIAID'#9'3'#9'Cia');
   dbgAjuSal.Selected.Add('LOCID'#9'3'#9'Loc');
   dbgAjuSal.Selected.Add('TINID'#9'3'#9'Tipo~Inv.');
   dbgAjuSal.Selected.Add('ALMID'#9'3'#9'Alm');
   dbgAjuSal.Selected.Add('NISAIDS'#9'9'#9'Nº Nota~Salida');
   dbgAjuSal.Selected.Add('NISAIDE'#9'9'#9'Nº Nota~Ingreso');
   dbgAjuSal.Selected.Add('FLAGVAR'#9'3'#9'Flag~Cierre');
   dbgAjuSal.Selected.Add('KDXUSER'#9'12'#9'Usuario');
   dbgAjuSal.Selected.Add('FREG'#9'10'#9'Fecha~Registro');
   dbgAjuSal.Selected.Add('OBSER'#9'25'#9'Observación');
   dbgAjuSal.RedrawGrid;
End;

Procedure TFMovAlmSalEnt.Z2bbtnAcepClick(Sender: TObject);
Var
// Inicio HPC_201404_ALM
{
   dFechar: TDateTime;
   Ano, Mes, xSQL, sSQL: String;
   xFlagKdx: Char;
   Contenido: Double;
   sCIA, sART, sALM, sLOC, sTIN, sInv: String; }
   xSQL: String;
   vControl: Integer;
// Fin HPC_201404_ALM
Begin
// Inicio HPC_201404_ALM
 {  If (DMALM.cdsAjuSal.FieldByName('FLAGVAR').AsString = 'P') Then

   Begin
      ErrorMsg('Observación', 'La nota ya ha sido aceptado');
      exit;
   End;
   If Question(Caption, 'Este Proceso: ' + #13 + #13 +
      ' Acepta el Movimiento de Ajuste ' + #13 +
      ' Genera los Movimiento de Saldos del Stock Logico ' + #13 +
      ' Inicializa los Datos de la Toma de Inventarios' + #13 + #13 +
      '                     Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;
      pbProceso.Visible := true;
      pbProceso.Max := DMALM.cdsqry.RecordCount;
      pbProceso.Position := 1;

      dFECHAR := DMALM.cdsAjuSal.FieldByName('FREG').AsDateTime;
      sCIA := DMALM.cdsAjuSal.FieldByName('CIAID').AsString;
      sALM := DMALM.cdsAjuSal.FieldByName('ALMID').AsString;
      sLOC := DMALM.cdsAjuSal.FieldByName('LOCID').AsString;
      sTIN := DMALM.cdsAjuSal.FieldByName('TINID').AsString;
      sInv := DMALM.cdsAjuSal.FieldByName('INVCORR').AsString;

      DecodeDate(dFECHAR, Y, M, D);
      Ano := IntToStr(Y);
      Mes := DMALM.StrZero(IntToStr(M), 2);

      xSQL := 'SELECT * FROM LOG316 ' +
         'WHERE CIAID=' + QuotedStr(sCIA) + ' ' +
         'AND LOCID=' + QuotedStr(sLOC) + ' ' +
         'AND TINID=' + QuotedStr(sTIN) + ' ' +
         'AND ALMID=' + QuotedStr(sALM) + ' ' +
         'AND STKANO=' + QuotedStr(Ano);

      DMALM.cdsSTK.close;
      DMALM.cdsSTK.DataRequest(xSQL);
      DMALM.cdsSTK.Open;
      DMALM.cdsSTK.IndexFieldNames := 'STKANO;CIAID;LOCID;TINID;ALMID;ARTID';

      sSQL := 'SELECT * FROM LOG315 WHERE CIAID=' + QuotedStr(sCIA) + ' AND ' + DetalleKDXSE;
      DMALM.cdsKDX.Close;
      DMALM.cdsKDX.DataRequest(sSQL);
      DMALM.cdsKDX.Open;

      DMALM.cdsKDX.DisableControls;
      DMALM.cdsKDX.first;
      While Not DMALM.cdsKDX.Eof Do
      Begin
         If DMALM.cdsKDX.FieldByName('SITUACION').AsString <> 'DEPURADO' Then
         Begin
            sArt := DMALM.cdsKDX.FieldByName('ARTID').AsString;
            xSQL := 'SELECT * FROM TGE205 WHERE CIAID=' + quotedstr(sCIA) + ' AND ARTID=' + quotedstr(sART) + ' AND TINID=' + QuotedStr(sTIN);
            DMALM.cdsArtiStk.Close;
            DMALM.cdsArtiStk.DataRequest(xSQL);
            DMALM.cdsArtiStk.Open;
            If DMALM.cdsArtiStk.RecordCount = 1 Then
            Begin
               Contenido := DMALM.cdsArtiStk.FieldByName('ARTCONT').AsFloat;
               If DMALM.cdsKDX.FieldByName('NISATIP').AsString = 'INGRESO' Then
                  xFlagKdx := 'I'
               Else
                  xFlagKdx := 'S';
               DMALM.ControlStock(sCIA, sALM, sLOC, sTIN, sArt, Ano, Mes, Contenido, xFlagKdx);
               DMALM.ActualizaArticulo(sCIA, sArt, Contenido, xFlagKdx);
               DMALM.SaldosIniciales(sCIA, sArt, Ano + Mes, Contenido, DMALM.cdsArtiStk.fieldbyname('ARTCPROG').AsFloat); // Act. LOG316 (STK)

               DMALM.ControlTran(0, Nil, '');
            End
            Else
               ErrorMsg('Error Grave', 'No se encuentra el articulo ' + sCIA + sArt);
         End;
         pbProceso.Position := pbProceso.Position + 1;
         DMALM.cdsKDX.next;
      End;
      DMALM.cdsKDX.EnableControls;

      ActualizaSituacionAjuste('S');
      DMALM.ControlTran(0, Nil, '');
      pbProceso.Visible := false;
      pnlCabecera.Visible := false;
      dbgAjuSal.Enabled := True;
      Screen.Cursor := crDefault;
   End;  }

   vcontrol := 0;
   If (Length(Trim(dbeSal.Text)) > 0) And (Length(Trim(dbeIng.Text)) > 0) Then
      vControl := 2
   Else
      If (Length(Trim(dbeSal.Text)) > 0) Or (Length(Trim(dbeIng.Text)) > 0) Then vControl := 1;

   If vcontrol > 0 Then
   Begin

      If Length(Trim(dbeIng.Text)) > 0 Then
      Begin
         xSQL := 'Select NISSIT,NISAID From Log314 Where ciaid=' + QuotedStr(dblcCIA.Text) + ' And almid=' + QuotedStr(dblcALM.Text) + ' And Nisatip=''INGRESO''  And '
            + ' Locid=' + QuotedStr(dblcLOC.Text) + ' And Tinid=' + QuotedStr(dblcTIN.Text) + ' And Nisaano=' + QuotedStr(speAno.Text) + ' And Nisaid=' + QuotedStr(dbeIng.Text);
         DMALM.cdsArtiStk.Close;
         DMALM.cdsArtiStk.DataRequest(xSQL);
         DMALM.cdsArtiStk.Open;
         If DMALM.cdsArtiStk.FieldByName('NISSIT').Asstring <> 'ACEPTADO' Then
         Begin
            ShowMessage('LA NOTA DE INGRESO POR AJUSTE N°' + DMALM.cdsArtiStk.FieldByname('NISAID').Asstring + ' NO ESTA ACEPTADA');
            Exit;
         End;
         vcontrol := vcontrol - 1;
      End;

      If Length(Trim(dbeSal.Text)) > 0 Then
      Begin
         xSQL := 'Select NISSIT,NISAID From Log314 Where ciaid=' + QuotedStr(dblcCIA.Text) + ' And almid=' + QuotedStr(dblcALM.Text) + ' And Nisatip=''SALIDA''  And '
            + ' Locid=' + QuotedStr(dblcLOC.Text) + ' And Tinid=' + QuotedStr(dblcTIN.Text) + ' And Nisaano=' + QuotedStr(speAno.Text) + ' And Nisaid=' + QuotedStr(dbeSal.Text);
         DMALM.cdsArtiStk.Close;
         DMALM.cdsArtiStk.DataRequest(xSQL);
         DMALM.cdsArtiStk.Open;

         If DMALM.cdsArtiStk.FieldByName('NISSIT').Asstring <> 'ACEPTADO' Then
         Begin
            ShowMessage('LA NOTA DE SALIDA POR AJUSTE N°' + DMALM.cdsArtiStk.FieldByname('NISAID').Asstring + ' NO ESTA ACEPTADA');
            Exit;
         End;
         vcontrol := vcontrol - 1;
      End;

      If vcontrol = 0 Then // si estam todas las guias ACEPTADAS se procede a cerrar el AJUSTE POR INVENTARIO
      Begin
         xSql := 'UPDATE LOG333 SET  TOINESTADO=''ACEPTADO'' WHERE TOINID=' + QuotedStr(FINInventarios.sInvCorr);
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

         xSql := 'UPDATE LOG102 SET FLAGVAR=''P'' WHERE INVCORR=' + QuotedStr(FINInventarios.sInvCorr);
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

         xSql := 'select * from LOG102 where INVCORR=''' + FINInventarios.sInvCorr + ''' ';
         DMALM.cdsAjuSal.Close;
         DMALM.cdsAjuSal.DataRequest(xSql);
         DMALM.cdsAjuSal.Open;

         ShowMessage('Ajuste de Inventario se Cerró con Éxito');
         Z2bbtnAcep.Enabled := False;
      End;

   End
   Else
      ShowMessage('No existe Guias por AJUSTE');

//Final HPC_201404_alm
End;

Procedure TFMovAlmSalEnt.dbgAjuSalDblClick(Sender: TObject);
Begin
   If DMALM.cdsAjuSal.RecordCount = 0 Then
   Begin
      ErrorMsg(Caption, 'No Existen Registros a Editar');
      Exit;
   End;

   dblcCIA.OnExit(dblcCIA);
   dblcLOC.OnExit(dblcLOC);
   dblcTIN.OnExit(dblcTIN);
   dblcALM.OnExit(dblcALM);

   dbgAjuSal.Enabled := False;

   //Inicio HPC_201404_AlM
   speAno.Text := DMALM.cdsAjuSal.Fieldbyname('KDXANO').AsString;
   speMM.Text := DMALM.cdsAjuSal.Fieldbyname('KDXMM').AsString;
   //Final HPC_201404_AlM

   If DMALM.cdsAjuSal.FieldByName('FLAGVAR').AsString <> 'P' Then // Para Procesar
   Begin
      pnlCabecera.Visible := true;
      Z2bbtnProc.Enabled := false;
      Z2bbtnAcep.Enabled := true;
      gbPer.Enabled := true;
      dtpAjuSal.Enabled := true;
      dbmObs.Enabled := true;
      dbmObs.Text := DMALM.cdsAjuSal.FieldByName('OBSER').AsString;
      dtpAjuSal.SetFocus;
      DMALM.cdsAjuSal.Edit;
   End
   Else
      If DMALM.cdsAjuSal.FieldByName('FLAGVAR').AsString = 'P' Then // Procesado
      Begin
         pnlCabecera.Visible := true;
         Z2bbtnProc.Enabled := false;
         Z2bbtnAcep.Enabled := false;
         gbPer.Enabled := false;
         dtpAjuSal.Enabled := false;
         dbmObs.Enabled := false;
         dbmObs.Text := DMALM.cdsAjuSal.FieldByName('OBSER').AsString;
         Z2bbtnCancel.SetFocus;
      End;
End;

Procedure TFMovAlmSalEnt.dbgAjuSalIButtonClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   pnlCabecera.Visible := true;
   dbmObs.Enabled := True;
   dbmObs.Text := '';
   //Inicio HPC_201404_ALM
   speAno.Text := FormatDateTime('YYYY', dtpAjuSal.DateTime);
   speMM.Text := FormatDateTime('MM', dtpAjuSal.DateTime);
   //Final HPC_201404_ALM

   Z2bbtnProc.Enabled := true;
   Z2bbtnAcep.Enabled := false;
   dblcCIA.Enabled := False;
   dblcLOC.Enabled := False;
   dblcTIN.Enabled := False;
   dblcALM.Enabled := False;

   dbgAjuSal.Enabled := False;

   DMALM.cdsAjuSal.Append;

   DMALM.cdsAjuSal.FieldByName('INVCORR').AsString := DMALM.cdsCInventario.FieldByName('TOINID').AsString;
   DMALM.cdsAjuSal.FieldByName('CIAID').AsString := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   DMALM.cdsAjuSal.FieldByName('LOCID').AsString := DMALM.cdsCInventario.FieldByName('LOCID').AsString;
   DMALM.cdsAjuSal.FieldByName('TINID').AsString := DMALM.cdsCInventario.FieldByName('TINID').AsString;
   DMALM.cdsAjuSal.FieldByName('ALMID').AsString := DMALM.cdsCInventario.FieldByName('ALMID').AsString;
   DMALM.cdsAjuSal.FieldbyName('OBSER').AsString := '.';
   dblcCIA.OnExit(dblcCIA);
   dblcLOC.OnExit(dblcLOC);
   dblcTIN.OnExit(dblcTIN);
   dblcALM.OnExit(dblcALM);
   dbmObs.SetFocus;
   Screen.Cursor := crDefault;
End;

Procedure TFMovAlmSalEnt.Z2bbtnDetAjuClick(Sender: TObject);
Begin
   Try
      MtxAI := TMant.Create(Self);
      MtxAI.Admin := DMALM.wAdmin;
      MtxAI.ClientDataSet := DMALM.cdsQry;
      MtxAI.DComC := DMALM.DCom1;
      MtxAI.FileNameIni := '\SOLAjuDet.INI';
      MtxAI.Filter := DetalleKDXSE;
      MtxAI.Module := DMALM.wModulo;
      MtxAI.SectionName := 'ALMAjuInv';
      MtxAI.TableName := 'LOG315';
      MtxAI.Titulo := ' Inventario Fisico ';
      MtxAI.User := DMALM.wUsuario;
      MtxAI.OnCreateMant := Nil;
      MtxAI.OnEdit := Nil;
      MtxAI.OnInsert := Nil;
      MtxAI.OnDelete := Nil;
      MtxAI.OnShow := Nil;
      MtxAI.NoVisible.Clear;
      Screen.Cursor := crDefault;
      MtxAI.Execute;
   Finally
      MtxAI.Free;
   End
End;

Procedure TFMovAlmSalEnt.dblcCIAExit(Sender: TObject);
Begin
   If Z2bbtnCancel.Focused Then Exit;
   xWhere := 'CIAID=' + quotedStr(dblcCia.text);
   dbeCIA.Text := DMALM.DisplayDescrip('prvLOG', 'TGE101', 'CIADES', xWhere, 'CIADES');
   If dbeCia.Text = '' Then
   Begin
      showMessage('Falta Compañia');
      Exit;
   End;
End;

Procedure TFMovAlmSalEnt.dblcLOCExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Z2bbtnCancel.Focused Then Exit;
   xWhere := 'LOCID=' + quotedStr(dblcLOC.text) + ' AND CIAID=' + quotedStr(dblcCIA.text);
   dbeLoc.text := DMALM.DisplayDescrip('prvLOG', 'TGE126', 'LOCDES', xWhere, 'LOCDES');
   If dbeLoc.Text = '' Then
   Begin
      showMessage('Falta Localidad');
      Exit;
   End;
End;

Procedure TFMovAlmSalEnt.dblcALMExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Z2bbtnCancel.Focused Then Exit;
   xWhere := 'ALMID=' + quotedStr(dblcALM.text) + ' AND TINID=' + QuotedStr(dblcTIN.text) + ' AND LOCID=' + quotedStr(dblcLOC.text) + ' AND CIAID=' + quotedStr(dblcCIA.text);
   dbeAlm.text := DMALM.DisplayDescrip('prvLOG', 'TGE151', 'ALMDES', xWhere, 'ALMDES');
   If dbeAlm.Text = '' Then
      showMessage('Falta Almacen');
End;

Procedure TFMovAlmSalEnt.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TDBMemo Then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFMovAlmSalEnt.dblcTINExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Z2bbtnCancel.Focused Then Exit;
   xWhere := 'TINID=' + quotedStr(dblcTIN.text) + ' AND CIAID=' + quotedStr(dblcCIA.text);
   dbeTIN.text := DMALM.DisplayDescrip('prvLOG', 'TGE152', 'TINDES', xWhere, 'TINDES');
   If dbeTIN.Text = '' Then
   Begin
      showMessage('Falta Tipo de Inventario');
      Exit;
   End;
End;

Procedure TFMovAlmSalEnt.BitBtn1Click(Sender: TObject);
Begin
   Close;
End;

Procedure TFMovAlmSalEnt.speMMExit(Sender: TObject);
Begin
   speMM.Text := DMALM.StrZero(speMM.Text, 2);
End;

Procedure TFMovAlmSalEnt.NotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFMovAlmSalEnt.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
End;

//Inicio HPC_201404_ALM

Function TFMovAlmSalEnt.fg_AceptaAjuste: Boolean;
Var
   xsAnio: String;
   xsCompania: String;
   xsLocalidad: String;
   xsTipoInventario: String;
   xsAlmacen: String;
   xsArticulo: String;
   xsSql: String;
Begin
   If (DMALM.cdsAjuSal.FieldByName('FLAGVAR').AsString = 'P') Then
   Begin
      ErrorMsg('Observación', 'El ajuste de Inventarios ya fue Aceptado');
      Exit;
   End;
   Try
      If Question(Caption, 'Este Proceso: ' + #13
         + '           Acepta el Movimiento de Ajuste,         ' + #13
         + ' Genera los Movimiento de Saldos del Stock Lógico, ' + #13
         + ' e Inicializa los Datos de la Toma de Inventarios  ' + #13
         + '                     ¿Desea Continuar? ') Then
      Begin
      //aceptamos las nota de ingreso y de salida
         ActualizaSituacionAjuste('S');
         DMALM.ControlTran(0, Nil, '');

         xsSQL := 'SELECT * FROM LOG315 WHERE CIAID = ' + QuotedStr(dblcCIA.Text) + ' AND ' + DetalleKDXSE;
         DMALM.cdsKDX.Close;
         DMALM.cdsKDX.DataRequest(xsSQL);
         DMALM.cdsKDX.Open;
         Screen.Cursor := crHourGlass;
         pbProceso.Visible := true;
         pbProceso.Max := DMALM.cdsKDX.RecordCount;
         pbProceso.Position := 1;

         While Not DMALM.cdsKDX.Eof Do
         Begin
            xsAnio := DMALM.cdsKDX.FieldByName('KDXANO').AsString;
            xsCompania := DMALM.cdsKDX.FieldByName('CIAID').AsString;
            xsLocalidad := DMALM.cdsKDX.FieldByName('LOCID').AsString;
            xsTipoInventario := DMALM.cdsKDX.FieldByName('TINID').AsString;
            xsAlmacen := DMALM.cdsKDX.FieldByName('ALMID').AsString;
            xsArticulo := DMALM.cdsKDX.FieldByName('ARTID').AsString;
            xsSql := ' BEGIN DB2ADMIN.SP_ALM_ACTUALIZA_STOCKBAZAR(' +
               QuotedStr(xsAnio) + ', ' +
               QuotedStr(xsCompania) + ', ' +
               QuotedStr(xsLocalidad) + ', ' +
               QuotedStr(xsTipoInventario) + ', ' +
               QuotedStr(xsAlmacen) + ', ' +
               QuotedStr(xsArticulo) + '); ' +
               ' END; ';
            DMALM.ExecSQL(xsSql);
            pbProceso.Position := pbProceso.Position + 1;
            DMALM.cdsKDX.next;
         End;
      End;
      pbProceso.Visible := false;
      pnlCabecera.Visible := false;
      dbgAjuSal.Enabled := True;
      Screen.Cursor := crDefault;
      Result := True;
      Exit;
   Except
      Result := False;
      Exit;
   End;

End;
//Final HPC_201404_ALM

End.

