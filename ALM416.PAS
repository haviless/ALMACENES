Unit ALM416;

// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Mask, wwdbedit, Wwdbspin, ExtCtrls, Buttons, wwdblook, db, ComCtrls,
   Grids, Wwdbigrd, Wwdbgrid, DBClient;

Type
   TFGenAsiES = Class(TForm)
      pnlCabecera: TPanel;
      Label8: TLabel;
      dblcCia: TwwDBLookupCombo;
      Label1: TLabel;
      Label2: TLabel;
      dbseMes: TwwDBSpinEdit;
      Label3: TLabel;
      dbseAnio: TwwDBSpinEdit;
      Label4: TLabel;
      dtpFCambio: TDateTimePicker;
      lblCambio: TLabel;
      dbeTipCam: TwwDBEdit;
      cbItemTCam: TComboBox;
      lblTipCam: TLabel;
      dbeMoneda: TwwDBEdit;
      dblcMoneda: TwwDBLookupCombo;
      Label5: TLabel;
      bbGenera: TBitBtn;
      bbCierra: TBitBtn;
      pnlDetalle: TPanel;
      Label6: TLabel;
      dbgAsientoI: TwwDBGrid;
      bbGraba: TBitBtn;
      bbModi: TBitBtn;
      bbsalir: TBitBtn;
      dblcLOC: TwwDBLookupCombo;
      Label9: TLabel;
      dbeCIA: TEdit;
      dbeLOC: TEdit;
      Label10: TLabel;
      dblcTInv: TwwDBLookupCombo;
      dbeTInv: TEdit;
      dblcAlm: TwwDBLookupCombo;
      Label11: TLabel;
      dbeAlm: TEdit;
      Label7: TLabel;
      dbgAsientoS: TwwDBGrid;
      Procedure FormActivate(Sender: TObject);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dtpFCambioChange(Sender: TObject);
      Procedure cbItemTCamChange(Sender: TObject);
      Procedure bbGeneraClick(Sender: TObject);
      Procedure bbGrabaClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dtpFCambioExit(Sender: TObject);
      Procedure bbModiClick(Sender: TObject);
      Procedure bbsalirClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcMonedaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTInvExit(Sender: TObject);
      Procedure dblcAlmExit(Sender: TObject);

   Private
    { Private declarations }
      validaCL: String;
      vanomes, vmes, vdia: String;
//   vtothabd,vtothabs,vtotdebd,vtotdebs,
      vtotals, vtotald, vdebes, vhabers, vdebed, vhaberd: real;
      vyear, vmonth, vday: word;
      vCargaCta: String;
      Procedure JalaTipCam;
      Procedure Limpia;
   Public
    { Public declarations }
   End;

Var
   FGenAsiES: TFGenAsiES;

Implementation
Uses ALMDM1;
{$R *.DFM}

Procedure TFGenAsiES.FormActivate(Sender: TObject);
Var
   ssql: String;
Begin
    {setea la bariable validaCL}
   validaCL := 'L';

    { abre Client}
//    dm1.cdsCia.Open;     {compañia}
   dm1.cdsTMoneda.Open; { tipo de moneda}
   dm1.cdsPeriodo.open; { periodos, semestres, etc.. TGE114 }
   dm1.cdsTMoneda.First;

    { descodifica el date del sistema}
   DecodeDate(date(), vyear, vmonth, vday);
   dbseMes.Value := vmonth;
   dbseAnio.Value := vyear;
    { setea los controles }
   vcargacta := '';
   dblcCia.text := dm1.cdsCia.fieldbyname('CIAID').AsString;
   dtpFCambio.DateTime := Date();

   cbItemTCam.ItemIndex := 0;
   dblcMoneda.Text := dm1.cdsTMoneda.fieldbyname('TMONID').AsString;
   dblcMoneda.OnExit(self);
   pnlDetalle.enabled := false;
   pnlCabecera.enabled := True;
End;

Procedure TFGenAsiES.dblcNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFGenAsiES.dtpFCambioChange(Sender: TObject);
Begin
   dbeTipCam.text := '';
   If (dm1.strZero(dbseMes.text, 2) = copy(DateTostr(dtpFCambio.date), 4, 2)) Or
      (dbseAnio.text = copy(DateTostr(dtpFCambio.date), 7, 4)) Then
      JalaTipCam;
End;

Procedure TFGenAsiES.cbItemTCamChange(Sender: TObject);
Begin
   dbeTipCam.text := '';
   JalaTipCam;
End;

Procedure TFGenAsiES.JalaTipCam;
Var
   sfecha, ssql: String;
Begin
   //** 15/03/2001 - pjsv
   sFecha := formatdatetime(dm1.wFormatFecha, dtpFCambio.Date);
   ssql := 'FECHA=' + quotedstr(sFecha);
   //**
   Case cbItemTCam.ItemIndex Of
      0: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVBC', ssql, 'TCAMVBC');
      1: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVBV', ssql, 'TCAMVBV');
      2: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVPC', ssql, 'TCAMVPC');
      3: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVPV', ssql, 'TCAMVPV');
      4: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVOC', ssql, 'TCAMVOC');
      5: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVOV', ssql, 'TCAMVOV');
      6: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVXC', ssql, 'TCAMVXC');
      7: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVXV', ssql, 'TCAMVXV');
   End;
   If dbeTipCam.text = '' Then
   Begin
      dbeTipCam.text := '0.00';
      bbGenera.enabled := false;
   End
   Else
      bbGenera.enabled := true;
End;

Procedure TFGenAsiES.bbGeneraClick(Sender: TObject);
Var
   xsql, ssql: widestring;
   vcuen, vcia, vloc, valm, vart, vnisatip: String;
// xn,xm : REal;
Begin
   Screen.Cursor := crHourGlass;
   vdebed := 0;
   vhaberd := 0;
   vtotald := 0;
   vdebes := 0;
   vhabers := 0;
   vtotals := 0;
   dm1.cdsQry.DisableControls;
   vmes := dm1.StrZero(dbseMes.Text, 2);
   vdia := copy(DateTostr(dtpFCambio.date), 1, 2);
   vanomes := dbseAnio.Text + vmes;

   sSQL := '';
   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := ' SELECT LOG315.CIAID, LOCID, TINID, ALMID, LOG315.CUENTAID, LOG315.CCOSID, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) AS DEBES, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' DEBED, ' +
         ' 0 HABERS,0 HABERD,R.CCOSDES ' +
         ' FROM LOG315 ' +
         ' LEFT JOIN TGE203 R ON (LOG315.CCOSID=R.CCOSID) ' +
         ' WHERE NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         ' AND (TINID=' + QuotedStr(dblcTInv.text) + ') AND (ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
         ' AND (TRIID IN (SELECT TRIID FROM TGE208 WHERE TRISGT=''S'' AND TRITMOV=''I'' )) ' +
         ' GROUP BY LOG315.CIAID, LOCID, TINID, ALMID, LOG315.CUENTAID, LOG315.CCOSID,R.CCOSDES ' +

      ' UNION ALL ' +
         ' SELECT ALM.CIAID,ALM.LOCID,ALM.TINID,ALM.ALMID,ALM.CUENTAID,'''',0 DEBES,0 DEBED, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) AS HABERS, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' HABERD, '''' ' +
         ' FROM LOG315, TGE151 ALM ' +
         ' WHERE LOG315.NISATIP =''SALIDA'' AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         ' AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND   (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') AND LOG315.ALMID=ALM.ALMID AND (KDXANOMM=' + QuotedStr(vanomes) + ') ' +
         ' AND (TRIID IN (SELECT TRIID FROM TGE208 WHERE TRISGT=''S'' AND TRITMOV=''I'' )) ' +
         ' GROUP BY ALM.CIAID,ALM.LOCID,ALM.TINID,ALM.ALMID,ALM.CUENTAID ' +

      ' ORDER BY CIAID, LOCID, TINID, ALMID, CUENTAID DESC';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := ' SELECT LOG315.CIAID, LOCID, TINID, ALMID, LOG315.CUENTAID, LOG315.CCOSID, ' +
            ' SUM(DECODE(KDXCNT,0(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) DEBES, ' +
            ' SUM(DECODE(KDXCNTG,0(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' DEBED, ' +
            ' 0 HABERS,0 HABERD,R.CCOSDES ' +
            ' FROM LOG315,TGE203 R' +
            ' WHERE (LOG315.CCOSID=R.CCOSID(+)) AND NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            ' AND (TINID=' + QuotedStr(dblcTInv.text) + ') AND (ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
            ' AND (TRIID IN (SELECT TRIID FROM TGE208 WHERE TRISGT=''S'' AND TRITMOV=''I'' )) ' +
            ' GROUP BY LOG315.CIAID, LOCID, TINID, ALMID, LOG315.CUENTAID, LOG315.CCOSID,R.CCOSDES ' +

         ' UNION ALL ' +
            ' SELECT ALM.CIAID,ALM.LOCID,ALM.TINID,ALM.ALMID,ALM.CUENTAID,'''',0 DEBES,0 DEBED, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) HABERS, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' HABERD, '''' ' +
            ' FROM LOG315, TGE151 ALM ' +
            ' WHERE LOG315.NISATIP =''SALIDA'' AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            ' AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND   (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') AND LOG315.ALMID=ALM.ALMID AND (KDXANOMM=' + QuotedStr(vanomes) + ') ' +
            ' AND (TRIID IN (SELECT TRIID FROM TGE208 WHERE TRISGT=''S'' AND TRITMOV=''I'' )) ' +
            ' GROUP BY ALM.CIAID,ALM.LOCID,ALM.TINID,ALM.ALMID,ALM.CUENTAID ' +

         ' ORDER BY CIAID, LOCID, TINID, ALMID, CUENTAID DESC';
      End;

   dm1.cdsTGE.Close;
   dm1.cdsTGE.ProviderName := 'prvTGE';
   dm1.cdsTGE.DataRequest(ssql);
   dm1.cdsTGE.open;
   TNumericField(dm1.cdsTGE.FieldByName('DEBES')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsTGE.FieldByName('HABERS')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsTGE.FieldByName('DEBED')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsTGE.FieldByName('HABERD')).DisplayFormat := '###,###,##0.00';

   dbgAsientoS.Selected.clear;
   dbgAsientoS.Selected.Add('CIAID'#9'3'#9'Cia');
   dbgAsientoS.Selected.Add('LOCID'#9'3'#9'Loc');
   dbgAsientoS.Selected.Add('TINID'#9'3'#9'Inv.');
   dbgAsientoS.Selected.Add('ALMID'#9'3'#9'Alm');
   dbgAsientoS.Selected.Add('CUENTAID'#9'8'#9'Cuenta');
   dbgAsientoS.Selected.Add('CCOSID'#9'6'#9'C.Costo');
   dbgAsientoS.Selected.Add('CCOSDES'#9'20'#9'Descripcion');
   dbgAsientoS.Selected.Add('DEBES'#9'10'#9'Debe');
   dbgAsientoS.Selected.Add('HABERS'#9'10'#9'Haber');

   dbgAsientoS.DataSource := DM1.dsTGE;

   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := ' SELECT LOG315.CIAID, LOCID, TINID, ALMID, LOG315.CUENTAID, LOG315.CCOSID, ' +
         ' 0 DEBES,0 DEBED, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) AS HABERS, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' HABERD, ' +
         ' R.CCOSDES ' +
         ' FROM LOG315 ' +
         ' LEFT JOIN TGE203 R ON (LOG315.CCOSID=R.CCOSID) ' +
         ' WHERE NISATIP =''INGRESO'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         ' AND (TINID=' + QuotedStr(dblcTInv.text) + ') AND (ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
         ' AND (TRIID IN (SELECT TRIID FROM TGE208 WHERE TRISGT=''I'' AND TRITMOV=''I'' )) ' +
         ' GROUP BY LOG315.CIAID, LOCID, TINID, ALMID, LOG315.CUENTAID, LOG315.CCOSID,R.CCOSDES ' +

      ' UNION ALL ' +
         ' SELECT ALM.CIAID,ALM.LOCID,ALM.TINID,ALM.ALMID,ALM.CUENTAID,'''', ' +
         ' 0 DEBES,0 DEBED, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) AS HABERS, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' HABERD, '''' ' +
         ' FROM LOG315, TGE151 ALM ' +
         ' WHERE LOG315.NISATIP =''INGRESO'' AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         ' AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND   (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') AND LOG315.ALMID=ALM.ALMID AND (KDXANOMM=' + QuotedStr(vanomes) + ') ' +
         ' AND (TRIID IN (SELECT TRIID FROM TGE208 WHERE TRISGT=''I'' AND TRITMOV=''I'' )) ' +
         ' GROUP BY ALM.CIAID,ALM.LOCID,ALM.TINID,ALM.ALMID,ALM.CUENTAID ' +

      ' ORDER BY CIAID, LOCID, TINID, ALMID, CUENTAID DESC';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := ' SELECT LOG315.CIAID, LOCID, TINID, ALMID, LOG315.CUENTAID, LOG315.CCOSID, ' +
            ' 0 DEBES,0 DEBED, ' +
            ' SUM(DECODE(KDXCNT,0(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) HABERS, ' +
            ' SUM(DECODE(KDXCNTG,0(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' HABERD, ' +
            ' R.CCOSDES ' +
            ' FROM LOG315,TGE203 R' +
            ' WHERE (LOG315.CCOSID=R.CCOSID(+)) AND NISATIP =''INGRESO'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            ' AND (TINID=' + QuotedStr(dblcTInv.text) + ') AND (ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
            ' AND (TRIID IN (SELECT TRIID FROM TGE208 WHERE TRISGT=''I'' AND TRITMOV=''I'' )) ' +
            ' GROUP BY LOG315.CIAID, LOCID, TINID, ALMID, LOG315.CUENTAID, LOG315.CCOSID,R.CCOSDES ' +

         ' UNION ALL ' +
            ' SELECT ALM.CIAID,ALM.LOCID,ALM.TINID,ALM.ALMID,ALM.CUENTAID,'''', ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) DEBES, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' DEBED, ' +
            ' 0 DEBES,0 DEBED,'''' ' +
            ' FROM LOG315, TGE151 ALM ' +
            ' WHERE LOG315.NISATIP =''INGRESO'' AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            ' AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND   (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') AND LOG315.ALMID=ALM.ALMID AND (KDXANOMM=' + QuotedStr(vanomes) + ') ' +
            ' AND (TRIID IN (SELECT TRIID FROM TGE208 WHERE TRISGT=''I'' AND TRITMOV=''I'' )) ' +
            ' GROUP BY ALM.CIAID,ALM.LOCID,ALM.TINID,ALM.ALMID,ALM.CUENTAID ' +

         ' ORDER BY CIAID, LOCID, TINID, ALMID, CUENTAID DESC';
      End;

   dm1.cdsAsiento.Close;
   dm1.cdsAsiento.ProviderName := 'prvAsiento';
   dm1.cdsAsiento.DataRequest(ssql);
   dm1.cdsAsiento.open;
   TNumericField(dm1.cdsAsiento.FieldByName('DEBES')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsAsiento.FieldByName('HABERS')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsAsiento.FieldByName('DEBED')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsAsiento.FieldByName('HABERD')).DisplayFormat := '###,###,##0.00';

   dbgAsientoI.Selected.clear;
   dbgAsientoI.Selected.Add('CIAID'#9'3'#9'Cia');
   dbgAsientoI.Selected.Add('LOCID'#9'3'#9'Loc');
   dbgAsientoI.Selected.Add('TINID'#9'3'#9'Inv.');
   dbgAsientoI.Selected.Add('ALMID'#9'3'#9'Alm');
   dbgAsientoI.Selected.Add('CUENTAID'#9'8'#9'Cuenta');
   dbgAsientoI.Selected.Add('CCOSID'#9'6'#9'C.Costo');
   dbgAsientoI.Selected.Add('CCOSDES'#9'20'#9'Descripcion');
   dbgAsientoI.Selected.Add('DEBES'#9'10'#9'Debe');
   dbgAsientoI.Selected.Add('HABERS'#9'10'#9'Haber');

   dbgAsientoI.DataSource := DM1.dsAsiento;

   pnlDetalle.enabled := true;
   pnlCabecera.enabled := false;
   Screen.Cursor := crDefault;
End;

Procedure TFGenAsiES.bbGrabaClick(Sender: TObject);
Var
   sFecha, vprecio: String;
   vcia: String;
   ssql: String;
   sTDiar, sTDiarDes: String;
   sCompro, STipCam: String;
   vTRI, vSEM, vSS, vAATRI, vAASEM, vAASS: String;
Begin

   If (dm1.cdsAsiento.RecordCount = 0) And (dm1.cdsTGE.RecordCount = 0) Then
   Begin
      MessageDlg('No existen registro a procesar', mtConfirmation, [mbYes], 0);
      exit;
   End;

  //captura variables de Fecha
   sFecha := formatdatetime(dm1.wFormatFecha, dtpFCambio.DateTime);
   ssql := 'FECHA=' + quotedStr(sFecha);
   vTRI := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECTRIM', ssql, 'FECTRIM');
   vSEM := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECSEM', ssql, 'FECSEM');
   vSS := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECSS', ssql, 'FECSS');
   vAATRI := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAATRI', ssql, 'FECAATRI');
   vAASEM := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAASEM', ssql, 'FECAASEM');
   vAASS := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAASS', ssql, 'FECAASS');
   STipCam := Copy(cbItemTCam.text, 1, 1);
   STipCam := STipCam + copy(cbItemTCam.text, pos(' ', cbItemTCam.text) + 1, 1);

  //VERIFICA EN TABLA DE CONTROL LOG325 SI YA EXISTE ASIENTO PARA EL ALMACEN
   sSQL := ' CIAID=' + quotedStr(dblcCia.text) + ' AND LOCID=' + quotedStr(dblcLOC.text) +
      ' AND TINID=' + quotedStr(dblcTInv.text) + ' AND ALMID=' + quotedStr(dblcALM.text) +
      ' AND CNTANOMM=' + QuotedStr(vanomes) + 'AND FLAGAJIN=''S''';

   If DM1.DisplayDescrip('prvTGE', 'LOG325', 'COUNT(*) CUENTA', sSQL, 'CUENTA') <> '0' Then
   Begin
      MessageDlg('Ya se procesó el asiento para este almacén', mtConfirmation, [mbYes], 0);
      exit;
   End;

   If MessageDlg('¿Está seguro de grabar el asiento?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      exit;

   Screen.Cursor := crHourGlass;

  // Captura el Tipo de Diario en la Tabla de Almacentes
   sSQL := 'ALMID=' + QuotedStr(dblcAlm.text);
   sTDiar := DM1.DisplayDescrip('prvTGE', 'TGE151', 'TDIARID', sSQL, 'TDIARID');

   sSQL := 'TDIARID=' + QuotedStr(sTDiar);
   sTDiarDes := DM1.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', sSQL, 'TDIARDES');

  //BUSCA COMPROBANTE PARA CIAID+PERIODO+TDIARID
   sSQL := ' CIAID=' + QuotedStr(dblcCia.text) + ' AND TDIARID=' + QuotedStr(sTDiar) + ' AND CNTANOMM=' + QuotedStr(vAnoMes);
   sCompro := DM1.StrZero(DM1.UltimoNum('prvTGE', 'CNT300', 'CNTCOMPROB', sSQL), 10);

  //INSERTA REGISTRO EN TABLA DE CONTROL LOG325
   sSQL := ' INSERT INTO LOG325(CIAID,LOCID,TINID,ALMID,CNTANOMM,CNTUSER,CNTFREG,CNTHREG,CNTCOMPROB,FLAGAJIN) ' +
      ' VALUES(' + quotedStr(dblcCia.text) + ',' + quotedStr(dblcLOC.text) + ',' + quotedStr(dblcTInv.text) + ',' +
      quotedStr(dblcALM.text) + ',' + QuotedStr(vanomes) + ',' + quotedStr(DM1.wUsuario) + ',' +
      QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ',' + QuotedStr(TimeToStr(Time)) + ',' +
      QuotedStr(sCompro) + ',''S'')';

   DM1.DCOM1.AppServer.EjecutaQry(sSQL);

   //INSERTA REGISTRO EN TABLA CNT300 CABECERA
{   sSQL:='INSERT INTO CNT300(CIAID,TDIARID,CNTCOMPROB,CNTANOMM,CNTLOTE,CNTGLOSA,CNTTCAMBIO,CNTFCOMP,CNTESTADO,'+
             'CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG,CNTANO,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,'+
             'CNTAASS,TMONID,TDIARDES,CNTTS,CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME)'+
      ' SELECT CIAID,'+QuotedStr(sTDiar)+' TDIARID,'+QuotedStr(sCompro)+' CNTCOMPROB,KDXANOMM,''0000'' LOTE,'+
     QuotedStr('SALIDAS MES:'+vmes+' AÑO:'+dbseAnio.Text)+' CNTGLOSA,'+dbeTipCam.text+' CNTTCAMBIO,DATE('+QuotedStr(FormatDateTime(dm1.wFormatFecha,dtpFCambio.date))+') CNTFCOMP,'+
     '''P'' CNTESTADO,''S'' CNTCUADRE,''S'' CNTAUTOM,'+QuotedStr(DM1.wUsuario)+' CNTUSER,DATE('+QuotedStr(FormatDateTime(dm1.wFormatFecha,Date))+') CNTFREG,'+
     QuotedStr(TimeToStr(Time))+' CNTHREG,'+QuotedStr(dbseAnio.Text)+' CNTANO,'+QuotedStr(vMes)+' CNTMM,'+QuotedStr(vDia)+' CNTDD,'+QuotedStr(vTRI)+' CNTTRI,'+QuotedStr(vSEM)+'CNTSEM,'+
     QuotedStr(vSS)+' CNTSS,'+QuotedStr(vAATRI)+' CNTAATRI,'+QuotedStr(vAASEM)+' CNTAASEM,'+QuotedStr(vAASS)+' CNTAASS,'+QuotedStr(dblcMoneda.text)+ ' TMONID,'+
     QuotedStr(sTDiarDes)+' TDIARDES,'+QuotedStr(sTipCam)+' CNTTS,'+
     ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) DEBEMN, '+
     ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/'+dbeTipCam.text+' DEBEME,0 HABEMN,0 HABEME '+
     ' FROM LOG315 '+
     ' WHERE NISATIP =''SALIDA'' AND (KDXANOMM='+QuotedStr(vanomes)+') AND (CIAID='+QuotedStr(dblcCia.text)+') AND (LOCID='+QuotedStr(dblcLOC.text)+') '+
     ' AND (TINID='+QuotedStr(dblcTInv.text)+') AND (ALMID='+QuotedStr(dblcAlm.text)+') '+
     ' GROUP BY CIAID,KDXANOMM ';
     DM1.DCOM1.AppServer.EjecutaQry(sSQL);}

   //INSERTA REGISTRO DEL DEBE EN TABLA CNT301 DETALLE PARA SALIDAS
   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'INSERT INTO CNT301(CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH, ' +
         'CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,' +
         'CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,' +
         'CNTAASS,TMONID,TDIARDES,CTADES,CCOSDES,CNTTS,CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME) ' +
         ' SELECT LOG315.CIAID,' + QuotedStr(sTDiar) + ' TDIARID,' + QuotedStr(sCompro) + ' CNTCOMPROB,' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM,''0000'' LOTE,' +
         'LOG315.CUENTAID,'''' DOCID,'''' CNTSERIE,'''' CNTNODOC,' + QuotedStr('SALIDAS POR AJUSTE DE INV MES:' + vmes + ' AÑO:' + dbseAnio.Text + ' ALM: ' + dblcAlm.text) + ' CNTGLOSA,' +
         '''D'' CNTDH,LOG315.CCOSID,' + dbeTipCam.text + ' CNTTCAMBIO,' + ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOORI, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOLOC, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTMTOEXT,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP,' +
         '''P'' CNTESTADO,''S'' CNTCUADRE,''S'' CNTAUTOM,' + QuotedStr(DM1.wUsuario) + ' CNTUSER,DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG,' +
         QuotedStr(TimeToStr(Time)) + ' CNTHREG,' + QuotedStr(vMes) + ' CNTMM,' + QuotedStr(vDia) + ' CNTDD,' + QuotedStr(vTRI) + ' CNTTRI,' + QuotedStr(vSEM) + 'CNTSEM,' +
         QuotedStr(vSS) + ' CNTSS,' + QuotedStr(vAATRI) + ' CNTAATRI,' + QuotedStr(vAASEM) + ' CNTAASEM,' + QuotedStr(vAASS) + ' CNTAASS,' + QuotedStr(dblcMoneda.text) + ' TMONID,' +
         QuotedStr(sTDiarDes) + ' TDIARDES,SUBSTR(CTA.CTADES,1,15) CTADES,CCOS.CCOSDES,' + QuotedStr(sTipCam) + ' CNTTS,' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTDEBEMN, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTDEBEME,0 CNTHABEMN,0 CNTHABEME ' +
         ' FROM LOG315 ' +
         ' LEFT JOIN TGE202 CTA ON (LOG315.CUENTAID=CTA.CUENTAID) ' +
         ' LEFT JOIN TGE203 CCOS ON (LOG315.CCOSID=CCOS.CCOSID) ' +
         ' WHERE NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         ' AND (TINID=' + QuotedStr(dblcTInv.text) + ') AND (ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
         ' GROUP BY LOG315.CIAID,KDXANOMM,LOG315.CUENTAID,CTADES,LOG315.CCOSID,CCOSDES ';

   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'INSERT INTO CNT301(CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH, ' +
            'CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,' +
            'CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,' +
            'CNTAASS,TMONID,TDIARDES,CTADES,CCOSDES,CNTTS,CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME) ' +
            ' SELECT LOG315.CIAID,' + QuotedStr(sTDiar) + ' TDIARID,' + QuotedStr(sCompro) + ' CNTCOMPROB,' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM,''0000'' LOTE,' +
            'LOG315.CUENTAID,'''' DOCID,'''' CNTSERIE,'''' CNTNODOC,' + QuotedStr('SALIDAS POR AJUSTE DE INV MES:' + vmes + ' AÑO:' + dbseAnio.Text + ' ALM: ' + dblcAlm.text) + ' CNTGLOSA,' +
            '''D'' CNTDH,LOG315.CCOSID,' + dbeTipCam.text + ' CNTTCAMBIO,' + ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOORI, ' +
            ' SUM(DECODE,KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTMTOLOC, ' +
            ' SUM(DECODE,KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTMTOEXT, ' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS, ' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO, ' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP, ' +
            '''P'' CNTESTADO,''S'' CNTCUADRE,''S'' CNTAUTOM,' + QuotedStr(DM1.wUsuario) + ' CNTUSER,TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG,' +
            QuotedStr(TimeToStr(Time)) + ' CNTHREG,' + QuotedStr(vMes) + ' CNTMM,' + QuotedStr(vDia) + ' CNTDD,' + QuotedStr(vTRI) + ' CNTTRI,' + QuotedStr(vSEM) + 'CNTSEM,' +
            QuotedStr(vSS) + ' CNTSS,' + QuotedStr(vAATRI) + ' CNTAATRI,' + QuotedStr(vAASEM) + ' CNTAASEM,' + QuotedStr(vAASS) + ' CNTAASS,' + QuotedStr(dblcMoneda.text) + ' TMONID,' +
            QuotedStr(sTDiarDes) + ' TDIARDES,SUBSTR(CTA.CTADES,1,15) CTADES,CCOS.CCOSDES,' + QuotedStr(sTipCam) + ' CNTTS,' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTDEBEMN, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTDEBEME,0 CNTHABEMN,0 CNTHABEME ' +
            ' FROM LOG315,TGE202 CTA,TGE203 CCOS ' +
            ' WHERE (LOG315.CUENTAID=CTA.CUENTAID(+)) AND (LOG315.CCOSID=CCOS.CCOSID(+)) AND NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            ' AND (TINID=' + QuotedStr(dblcTInv.text) + ') AND (ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
            ' GROUP BY LOG315.CIAID,KDXANOMM,LOG315.CUENTAID,CTADES,LOG315.CCOSID,CCOSDES ';
      End;
   If dm1.cdsTGE.RecordCount <> 0 Then
      DM1.DCOM1.AppServer.EjecutaQry(sSQL);

   //INSERTA REGISTRO DEL HABER EN TABLA CNT301 DETALLE PARA SALIDAS
   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'INSERT INTO CNT301(CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH, ' +
         'CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,' +
         'CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,' +
         'CNTAASS,TMONID,TDIARDES,CTADES,CCOSDES,CNTTS,CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME) ' +

      ' SELECT ALM.CIAID,' + QuotedStr(sTDiar) + ' TDIARID,' + QuotedStr(sCompro) + ' CNTCOMPROB,' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM,''0000'' LOTE,' +
         'ALM.CUENTAID,''VR'' DOCID,''000'' CNTSERIE,' + QuotedStr(sTDiar + Scompro) + ' CNTNODOC,' + QuotedStr('SALIDAS POR AJUSTE DE INV MES:' + vmes + ' AÑO:' + dbseAnio.Text + ' ALM: ' + dblcAlm.text) + ' CNTGLOSA,' +
         '''H'' CNTDH,'''' CCOSID,' + dbeTipCam.text + ' CNTTCAMBIO,' + ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOORI, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOLOC, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTMTOEXT,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP,' +
         '''P'' CNTESTADO,''S'' CNTCUADRE,''S'' CNTAUTOM,' + QuotedStr(DM1.wUsuario) + ' CNTUSER,DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG,' +
         QuotedStr(TimeToStr(Time)) + ' CNTHREG,' + QuotedStr(vMes) + ' CNTMM,' + QuotedStr(vDia) + ' CNTDD,' + QuotedStr(vTRI) + ' CNTTRI,' + QuotedStr(vSEM) + 'CNTSEM,' +
         QuotedStr(vSS) + ' CNTSS,' + QuotedStr(vAATRI) + ' CNTAATRI,' + QuotedStr(vAASEM) + ' CNTAASEM,' + QuotedStr(vAASS) + ' CNTAASS,' + QuotedStr(dblcMoneda.text) + ' TMONID,' +
         QuotedStr(sTDiarDes) + ' TDIARDES,SUBSTR(CTA.CTADES,1,15) CTADES,'''' CCOSDES,' + QuotedStr(sTipCam) + ' CNTTS,' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTDEBEMN, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTDEBEME,0 CNTHABEMN,0 CNTHABEME ' +
         ' FROM LOG315, TGE151 ALM ' +
         ' LEFT JOIN TGE202 CTA ON (ALM.CUENTAID=CTA.CUENTAID) ' +
         ' WHERE NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         ' AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') ' + ' AND (LOG315.ALMID=ALM.ALMID) ' +
         ' GROUP BY ALM.CIAID,KDXANOMM,ALM.CUENTAID,CTADES ';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'INSERT INTO CNT301(CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH, ' +
            'CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,' +
            'CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,' +
            'CNTAASS,TMONID,TDIARDES,CTADES,CCOSDES,CNTTS,CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME) ' +

         ' SELECT ALM.CIAID,' + QuotedStr(sTDiar) + ' TDIARID,' + QuotedStr(sCompro) + ' CNTCOMPROB,' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM,''0000'' LOTE,' +
            'ALM.CUENTAID,''VR'' DOCID,''000'' CNTSERIE,' + QuotedStr(sTDiar + Scompro) + ' CNTNODOC,' + QuotedStr('SALIDAS POR AJUSTE DE INV MES:' + vmes + ' AÑO:' + dbseAnio.Text + ' ALM: ' + dblcAlm.text) + ' CNTGLOSA,' +
            '''H'' CNTDH,'''' CCOSID,' + dbeTipCam.text + ' CNTTCAMBIO,' + ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTMTOORI, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTMTOLOC, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTMTOEXT,' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS,' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO,' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP,' +
            '''P'' CNTESTADO,''S'' CNTCUADRE,''S'' CNTAUTOM,' + QuotedStr(DM1.wUsuario) + ' CNTUSER, TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG,' +
            QuotedStr(TimeToStr(Time)) + ' CNTHREG,' + QuotedStr(vMes) + ' CNTMM,' + QuotedStr(vDia) + ' CNTDD,' + QuotedStr(vTRI) + ' CNTTRI,' + QuotedStr(vSEM) + 'CNTSEM,' +
            QuotedStr(vSS) + ' CNTSS,' + QuotedStr(vAATRI) + ' CNTAATRI,' + QuotedStr(vAASEM) + ' CNTAASEM,' + QuotedStr(vAASS) + ' CNTAASS,' + QuotedStr(dblcMoneda.text) + ' TMONID,' +
            QuotedStr(sTDiarDes) + ' TDIARDES,SUBSTR(CTA.CTADES,1,15) CTADES,'''' CCOSDES,' + QuotedStr(sTipCam) + ' CNTTS,' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTDEBEMN, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTDEBEME,0 CNTHABEMN,0 CNTHABEME ' +
            ' FROM LOG315, TGE151 ALM,TGE202 CTA ' +
            ' WHERE (ALM.CUENTAID=CTA.CUENTAID(+)) AND NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            ' AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') ' + ' AND (LOG315.ALMID=ALM.ALMID) ' +
            ' GROUP BY ALM.CIAID,KDXANOMM,ALM.CUENTAID,CTADES ';
      End;

   If dm1.cdsTGE.RecordCount <> 0 Then
      DM1.DCOM1.AppServer.EjecutaQry(sSQL);

   //INSERTA REGISTRO DEL DEBE EN TABLA CNT301 DETALLE PARA INGRESOS
   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'INSERT INTO CNT301(CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH, ' +
         'CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,' +
         'CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,' +
         'CNTAASS,TMONID,TDIARDES,CTADES,CCOSDES,CNTTS,CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME) ' +
         ' SELECT LOG315.CIAID,' + QuotedStr(sTDiar) + ' TDIARID,' + QuotedStr(sCompro) + ' CNTCOMPROB,' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM,''0000'' LOTE,' +
         'LOG315.CUENTAID,'''' DOCID,'''' CNTSERIE,'''' CNTNODOC,' + QuotedStr('INGRESOS POR AJUSTE DE INV MES:' + vmes + ' AÑO:' + dbseAnio.Text + ' ALM: ' + dblcAlm.text) + ' CNTGLOSA,' +
         '''D'' CNTDH,LOG315.CCOSID,' + dbeTipCam.text + ' CNTTCAMBIO,' + ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOORI, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOLOC, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTMTOEXT,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP,' +
         '''P'' CNTESTADO,''S'' CNTCUADRE,''S'' CNTAUTOM,' + QuotedStr(DM1.wUsuario) + ' CNTUSER,DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG,' +
         QuotedStr(TimeToStr(Time)) + ' CNTHREG,' + QuotedStr(vMes) + ' CNTMM,' + QuotedStr(vDia) + ' CNTDD,' + QuotedStr(vTRI) + ' CNTTRI,' + QuotedStr(vSEM) + 'CNTSEM,' +
         QuotedStr(vSS) + ' CNTSS,' + QuotedStr(vAATRI) + ' CNTAATRI,' + QuotedStr(vAASEM) + ' CNTAASEM,' + QuotedStr(vAASS) + ' CNTAASS,' + QuotedStr(dblcMoneda.text) + ' TMONID,' +
         QuotedStr(sTDiarDes) + ' TDIARDES,SUBSTR(CTA.CTADES,1,15) CTADES,CCOS.CCOSDES,' + QuotedStr(sTipCam) + ' CNTTS,' +
         ' 0 CNTDEBEMN,0 CNTDEBEME, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTHABEMN, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTHABEME ' +
         ' FROM LOG315 ' +
         ' LEFT JOIN TGE202 CTA ON (LOG315.CUENTAID=CTA.CUENTAID) ' +
         ' LEFT JOIN TGE203 CCOS ON (LOG315.CCOSID=CCOS.CCOSID) ' +
         ' WHERE NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         ' AND (TINID=' + QuotedStr(dblcTInv.text) + ') AND (ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
         ' GROUP BY LOG315.CIAID,KDXANOMM,LOG315.CUENTAID,CTADES,LOG315.CCOSID,CCOSDES ';

   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'INSERT INTO CNT301(CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH, ' +
            'CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,' +
            'CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,' +
            'CNTAASS,TMONID,TDIARDES,CTADES,CCOSDES,CNTTS,CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME) ' +
            ' SELECT LOG315.CIAID,' + QuotedStr(sTDiar) + ' TDIARID,' + QuotedStr(sCompro) + ' CNTCOMPROB,' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM,''0000'' LOTE,' +
            'LOG315.CUENTAID,'''' DOCID,'''' CNTSERIE,'''' CNTNODOC,' + QuotedStr('INGRESOS POR AJUSTE DE INV MES:' + vmes + ' AÑO:' + dbseAnio.Text + ' ALM: ' + dblcAlm.text) + ' CNTGLOSA,' +
            '''D'' CNTDH,LOG315.CCOSID,' + dbeTipCam.text + ' CNTTCAMBIO,' + ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOORI, ' +
            ' SUM(DECODE,KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTMTOLOC, ' +
            ' SUM(DECODE,KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTMTOEXT, ' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS, ' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO, ' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP, ' +
            '''P'' CNTESTADO,''S'' CNTCUADRE,''S'' CNTAUTOM,' + QuotedStr(DM1.wUsuario) + ' CNTUSER,TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG,' +
            QuotedStr(TimeToStr(Time)) + ' CNTHREG,' + QuotedStr(vMes) + ' CNTMM,' + QuotedStr(vDia) + ' CNTDD,' + QuotedStr(vTRI) + ' CNTTRI,' + QuotedStr(vSEM) + 'CNTSEM,' +
            QuotedStr(vSS) + ' CNTSS,' + QuotedStr(vAATRI) + ' CNTAATRI,' + QuotedStr(vAASEM) + ' CNTAASEM,' + QuotedStr(vAASS) + ' CNTAASS,' + QuotedStr(dblcMoneda.text) + ' TMONID,' +
            QuotedStr(sTDiarDes) + ' TDIARDES,SUBSTR(CTA.CTADES,1,15) CTADES,CCOS.CCOSDES,' + QuotedStr(sTipCam) + ' CNTTS,' +
            ' 0 CNTDEBEMN,0 CNTDEBEME, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTHABEMN, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTHABEME ' +
            ' FROM LOG315,TGE202 CTA,TGE203 CCOS ' +
            ' WHERE (LOG315.CUENTAID=CTA.CUENTAID(+)) AND (LOG315.CCOSID=CCOS.CCOSID(+)) AND NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            ' AND (TINID=' + QuotedStr(dblcTInv.text) + ') AND (ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
            ' GROUP BY LOG315.CIAID,KDXANOMM,LOG315.CUENTAID,CTADES,LOG315.CCOSID,CCOSDES ';
      End;
   If dm1.cdsAsiento.RecordCount <> 0 Then
      DM1.DCOM1.AppServer.EjecutaQry(sSQL);

   //INSERTA REGISTRO DEL HABER EN TABLA CNT301 DETALLE PARA INGRESOS
   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'INSERT INTO CNT301(CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH, ' +
         'CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,' +
         'CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,' +
         'CNTAASS,TMONID,TDIARDES,CTADES,CCOSDES,CNTTS,CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME) ' +

      ' SELECT ALM.CIAID,' + QuotedStr(sTDiar) + ' TDIARID,' + QuotedStr(sCompro) + ' CNTCOMPROB,' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM,''0000'' LOTE,' +
         'ALM.CUENTAID,''VR'' DOCID,''000'' CNTSERIE,' + QuotedStr(sTDiar + Scompro) + ' CNTNODOC,' + QuotedStr('INGRESOS POR AJUSTE DE INV MES:' + vmes + ' AÑO:' + dbseAnio.Text + ' ALM: ' + dblcAlm.text) + ' CNTGLOSA,' +
         '''H'' CNTDH,'''' CCOSID,' + dbeTipCam.text + ' CNTTCAMBIO,' + ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOORI, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOLOC, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTMTOEXT,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO,' +
         ' DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP,' +
         '''P'' CNTESTADO,''S'' CNTCUADRE,''S'' CNTAUTOM,' + QuotedStr(DM1.wUsuario) + ' CNTUSER,DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG,' +
         QuotedStr(TimeToStr(Time)) + ' CNTHREG,' + QuotedStr(vMes) + ' CNTMM,' + QuotedStr(vDia) + ' CNTDD,' + QuotedStr(vTRI) + ' CNTTRI,' + QuotedStr(vSEM) + 'CNTSEM,' +
         QuotedStr(vSS) + ' CNTSS,' + QuotedStr(vAATRI) + ' CNTAATRI,' + QuotedStr(vAASEM) + ' CNTAASEM,' + QuotedStr(vAASS) + ' CNTAASS,' + QuotedStr(dblcMoneda.text) + ' TMONID,' +
         QuotedStr(sTDiarDes) + ' TDIARDES,SUBSTR(CTA.CTADES,1,15) CTADES,'''' CCOSDES,' + QuotedStr(sTipCam) + ' CNTTS,' +
         ' 0 CNTDEBEMN,0 CNTDEBEME, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTHABEMN, ' +
         ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTHABEME ' +
         ' FROM LOG315, TGE151 ALM ' +
         ' LEFT JOIN TGE202 CTA ON (ALM.CUENTAID=CTA.CUENTAID) ' +
         ' WHERE NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         ' AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') ' + ' AND (LOG315.ALMID=ALM.ALMID) ' +
         ' GROUP BY ALM.CIAID,KDXANOMM,ALM.CUENTAID,CTADES ';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'INSERT INTO CNT301(CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH, ' +
            'CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,' +
            'CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,' +
            'CNTAASS,TMONID,TDIARDES,CTADES,CCOSDES,CNTTS,CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME) ' +

         ' SELECT ALM.CIAID,' + QuotedStr(sTDiar) + ' TDIARID,' + QuotedStr(sCompro) + ' CNTCOMPROB,' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM,''0000'' LOTE,' +
            'ALM.CUENTAID,''VR'' DOCID,''000'' CNTSERIE,' + QuotedStr(sTDiar + Scompro) + ' CNTNODOC,' + QuotedStr('INGRESOS POR AJUSTE DE INV MES:' + vmes + ' AÑO:' + dbseAnio.Text + ' ALM: ' + dblcAlm.text) + ' CNTGLOSA,' +
            '''H'' CNTDH,'''' CCOSID,' + dbeTipCam.text + ' CNTTCAMBIO,' + ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTMTOORI, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTMTOLOC, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTMTOEXT,' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS,' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO,' +
            ' TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP,' +
            '''P'' CNTESTADO,''S'' CNTCUADRE,''S'' CNTAUTOM,' + QuotedStr(DM1.wUsuario) + ' CNTUSER, TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG,' +
            QuotedStr(TimeToStr(Time)) + ' CNTHREG,' + QuotedStr(vMes) + ' CNTMM,' + QuotedStr(vDia) + ' CNTDD,' + QuotedStr(vTRI) + ' CNTTRI,' + QuotedStr(vSEM) + 'CNTSEM,' +
            QuotedStr(vSS) + ' CNTSS,' + QuotedStr(vAATRI) + ' CNTAATRI,' + QuotedStr(vAASEM) + ' CNTAASEM,' + QuotedStr(vAASS) + ' CNTAASS,' + QuotedStr(dblcMoneda.text) + ' TMONID,' +
            QuotedStr(sTDiarDes) + ' TDIARDES,SUBSTR(CTA.CTADES,1,15) CTADES,'''' CCOSDES,' + QuotedStr(sTipCam) + ' CNTTS,' +
            ' 0 CNTDEBEMN,0 CNTDEBEME ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTHABEMN, ' +
            ' SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTHABEME' +
            ' FROM LOG315, TGE151 ALM,TGE202 CTA ' +
            ' WHERE (ALM.CUENTAID=CTA.CUENTAID(+)) AND NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            ' AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') ' + ' AND (LOG315.ALMID=ALM.ALMID) ' +
            ' GROUP BY ALM.CIAID,KDXANOMM,ALM.CUENTAID,CTADES ';
      End;

   If dm1.cdsAsiento.RecordCount <> 0 Then
      DM1.DCOM1.AppServer.EjecutaQry(sSQL);

  //Contabiliza
   DM1.GeneraContabilidad(dblcCia.text, sTDiar, vanomes, sCompro, self, 'ALM');

   Screen.Cursor := crDefault;
   bbGraba.Enabled := false;
   bbModi.Enabled := false;
   vcargacta := '';
   Screen.Cursor := crDefault;
End;

Procedure TFGenAsiES.dblcCiaExit(Sender: TObject);
Var
   ssql: String;
Begin
   If dblcCia.text = '' Then
   Begin
      errormsg('Error', 'Debe de escoger una Compañia');
      dblcCia.setfocus;
      exit;
   End;
   sSQL := 'CIAID=' + QuotedStr(dblcCia.text);
   dbeCIA.text := DM1.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', sSQL, 'CIADES');
   ssql := '';
   ssql := 'SELECT * FROM TGE126 WHERE CIAID=' + QUOTEDSTR(dblcCia.Text);
   dm1.cdsLOC.Close;
   dm1.cdsLOC.DataRequest(ssql);
   dm1.cdsLOC.Open;
   dm1.cdsLOC.First;
End;

Procedure TFGenAsiES.dtpFCambioExit(Sender: TObject);
Begin
 { descodifica el date del sistema}
   If (dm1.strZero(dbseMes.text, 2) <> copy(DateTostr(dtpFCambio.date), 4, 2)) Or (dbseAnio.text <> copy(DateTostr(dtpFCambio.date), 7, 4)) Then
   Begin
      errormsg('Error', 'La fecha debe de estar dentro' + #13 + 'del Mes y Año del Período');
      dtpFCambio.setfocus;
      dtpFCambio.DateTime := date();
   End;
End;

Procedure TFGenAsiES.bbModiClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   Limpia;
   vcargacta := '';
   pnlDetalle.enabled := false;
   pnlCabecera.enabled := True;
   Screen.Cursor := crDefault;
End;

Procedure TFGenAsiES.Limpia;
Begin
{ dm1.cdsTGE.first;
 while not dm1.cdsTGE.eof do dm1.cdsTGE.delete;
 dm1.cdsAsientoS.first;
 while not dm1.cdsAsientoS.eof do dm1.cdsAsientoS.delete;}
End;

Procedure TFGenAsiES.bbsalirClick(Sender: TObject);
Begin
   FGenAsiES.Close;
End;

Procedure TFGenAsiES.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   dm1.cdsTMoneda.Close; { tipo de moneda}
//  dm1.cdsTRAN.Close;    {transaccion}
   dm1.cdsKDX.Close; {detalle de mov. LOG315}
//  dm1.cdsCia.Close;     {compañia}

   dm1.cdsTDiario.Close;
   DM1.cdsTDiario.DataRequest('SELECT * FROM TGE104');

   dm1.cdsPeriodo.Close; { periodos, semestres, etc.. TGE114 }
End;

Procedure TFGenAsiES.dblcMonedaExit(Sender: TObject);
Begin
   dbeTipCam.text := '';
   dbeMoneda.Text := dm1.cdsTMoneda.fieldbyname('TMONDES').AsString;
   JalaTipCam;
End;

//** 15/03/2001 - pjsv

Procedure TFGenAsiES.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;
//**

Procedure TFGenAsiES.dblcLOCExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If dblcLOc.text = '' Then
   Begin
      errormsg('Error', 'Debe de escoger una Localidad');
      dblcLOC.setfocus;
      exit;
   End;

   sSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeLoc.Text := DM1.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', sSQL, 'LOCDES');
   sSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   sSQL := 'SELECT * FROM TGE152 WHERE ' + sSQL;
   DM1.cdsTINID.Close;
   DM1.cdsTINID.DataRequest(sSQL);
   DM1.cdsTINID.open;
End;

Procedure TFGenAsiES.dblcTInvExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If dblcTInv.text = '' Then
   Begin
      errormsg('Error', 'Debe de escoger una Tipo de Inventario');
      dblcTInv.setfocus;
      exit;
   End;

   sSQL := 'TINID=' + quotedstr(dblcTInv.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeTinv.Text := DM1.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', sSQL, 'TINDES');
   sSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTInv.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   sSQL := 'SELECT * FROM TGE151 WHERE ' + sSQL;
   DM1.cdsALM.Close;
   DM1.cdsALM.DataRequest(sSQL);
   DM1.cdsALM.open;
End;

Procedure TFGenAsiES.dblcAlmExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If dblcAlm.text = '' Then
   Begin
      errormsg('Error', 'Debe de escoger una Tipo de Inventario');
      dblcAlm.setfocus;
      exit;
   End;

   sSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTInv.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcALM.text);
   dbeALM.Text := DM1.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', sSQL, 'ALMDES');
End;

End.

