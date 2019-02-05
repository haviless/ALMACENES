Unit ALM306A;
// HPC_201602_ALM 30/04/2016 Entrega a Calidad
//
{31/08/2000 pjsv }
Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Mask, wwdbedit, Wwdbspin, ExtCtrls, Buttons, wwdblook, db, ComCtrls,
   Grids, Wwdbigrd, Wwdbgrid, DBClient, ppCtrls, ppBands, ppVar, ppPrnabl,
   ppClass, ppDB, ppCache, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppViewr;

Type
   TFGenAsiAlm = Class(TForm)
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
      dbgAsientoS: TwwDBGrid;
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
      Z1sbCCosto: TBitBtn;
      pprAsientoCtbl: TppReport;
      ppdbMovi: TppDBPipeline;
      Z1sbAContable: TBitBtn;
      pprAContable: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppShape2: TppShape;
      ppShape3: TppShape;
      ppLabel4: TppLabel;
      ppLabel7: TppLabel;
      ppLabel11: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel36: TppLabel;
      ppLine17: TppLine;
      ppLine18: TppLine;
      ppLine21: TppLine;
      ppLine22: TppLine;
      ppLine23: TppLine;
      ppLine25: TppLine;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      lblProveedor: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel35: TppLabel;
      ppLabel37: TppLabel;
      pplblMesDia: TppLabel;
      ppLabel100: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppDBText11: TppDBText;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      ppLine19: TppLine;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      pplNoDoc: TppLabel;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      pplTCSBS: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      lblBanco: TppLabel;
      lblCuenta: TppLabel;
      lblNumChq: TppLabel;
      ppDBText1: TppDBText;
      ppDetailBand1: TppDetailBand;
      ppLine20: TppLine;
      ppLine24: TppLine;
      ppLine26: TppLine;
      ppLine27: TppLine;
      ppLine28: TppLine;
      ppLine29: TppLine;
      ppLine30: TppLine;
      ppLine31: TppLine;
      ppDBText10: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppLine32: TppLine;
      ppDBText15: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLine33: TppLine;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppLabel53: TppLabel;
      ppLine34: TppLine;
      ppLine35: TppLine;
      ppLine36: TppLine;
      ppLine37: TppLine;
      ppLine38: TppLine;
      ppLine39: TppLine;
      ppLine40: TppLine;
      ppLabel54: TppLabel;
      ppLine41: TppLine;
      ppLine42: TppLine;
      ppLabel55: TppLabel;
      ppHeaderBand2: TppHeaderBand;
      ppLine15: TppLine;
      ppLine16: TppLine;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppShape8: TppShape;
      ppLabel5: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel9: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      lblGlosa: TppLabel;
      lblTipoCamb: TppLabel;
      ppLabel21: TppLabel;
      lblmoneda: TppLabel;
      ppLabel30: TppLabel;
      ppLabel10: TppLabel;
      ppLine13: TppLine;
      ppLine14: TppLine;
      ppDBText3: TppDBText;
      ppLabel3: TppLabel;
      ppLabel2: TppLabel;
      ppLabel1: TppLabel;
      ppLabel6: TppLabel;
      lblPeriodo: TppLabel;
      lblDiario: TppLabel;
      lblNoComp: TppLabel;
      lblTD: TppLabel;
      ppLabel8: TppLabel;
      ppShape1: TppShape;
      lblImporte: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppLine4: TppLine;
      ppLine7: TppLine;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppDBText14: TppDBText;
      pptDesc: TppDBText;
      ppDBText2: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppShape10: TppShape;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLine3: TppLine;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppLine10: TppLine;
      ppLine11: TppLine;
      ppLine12: TppLine;
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
      Procedure Z1sbCCostoClick(Sender: TObject);
      Procedure pprAsientoCtblPreviewFormCreate(Sender: TObject);
      Procedure ppHeaderBand2BeforePrint(Sender: TObject);
      Procedure Z1sbAContableClick(Sender: TObject);
      Procedure ppHeaderBand1BeforePrint(Sender: TObject);
      Procedure pprAContablePreviewFormCreate(Sender: TObject);

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
   FGenAsiAlm: TFGenAsiAlm;

Implementation
Uses ALMDM1;
{$R *.DFM}

Procedure TFGenAsiAlm.FormActivate(Sender: TObject);
Begin
    {setea la bariable validaCL}
   validaCL := 'L';
   dm1.cdsTGE.Close;
    { abre Client}
//    dm1.cdsCia.Open;     {compañia}
   dm1.cdsTMoneda.Open; { tipo de moneda}
   dm1.cdsPeriodo.open; { periodos, semestres, etc.. TGE114 }
   dm1.cdsNivel.Open;
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

Procedure TFGenAsiAlm.dblcNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFGenAsiAlm.dtpFCambioChange(Sender: TObject);
Begin
   dbeTipCam.text := '';
   If (dm1.strZero(dbseMes.text, 2) = copy(DateTostr(dtpFCambio.date), 4, 2)) Or
      (dbseAnio.text = copy(DateTostr(dtpFCambio.date), 7, 4)) Then
      JalaTipCam;
End;

Procedure TFGenAsiAlm.cbItemTCamChange(Sender: TObject);
Begin
   dbeTipCam.text := '';
   JalaTipCam;
End;

Procedure TFGenAsiAlm.JalaTipCam;
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

Procedure TFGenAsiAlm.bbGeneraClick(Sender: TObject);
Var
   ssql: widestring;
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
      sSQL := 'SELECT D.CIADES, LOG315.CIAID, LOG315.LOCID, LOG315.TINID, LOG315.ALMID, LOG315.GRARID, C.CUENTAID, LOG315.CCOSID, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXCNTG * ARTPCG) ELSE (KDXCNTU * ARTPCU) END) AS DEBES, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXCNTG * ARTPCG) ELSE (KDXCNTU * ARTPCU) END)/' + dbeTipCam.text + ' DEBED, ' +
         '0 HABERS, 0 HABERD, R.CCOSDES, F.CTADES, ' +
         '''Consumo de Almacen Periodo ' + dm1.FormatPeriodo(strtoint(dbseAnio.Text), strtoint(dbseMes.Text)) + ''' GLOSA, ' +
         'H.CNTFREG, H.CNTCOMPROB ' +
         'FROM LOG315 ' +
         'LEFT JOIN TGE203 R ON (LOG315.CCOSID=R.CCOSID) ' +
         'LEFT JOIN TGE101 D ON (LOG315.CIAID=D.CIAID) ' +
         'LEFT JOIN TGE131 C ON (LOG315.CIAID=C.CIAID AND LOG315.TINID=C.TINID AND LOG315.GRARID=C.GRARID) ' +
         'LEFT JOIN TGE202 F ON (C.CIAID=F.CIAID AND C.CUENTAID=F.CUENTAID) ' +
         'LEFT JOIN LOG325 H ON (LOG315.CIAID=H.CIAID AND LOG315.TINID=H.TINID AND LOG315.ALMID =H.ALMID AND H.CNTANOMM=''' + dm1.FormatPeriodo(strtoint(dbseAnio.Text), strtoint(dbseMes.Text)) + ''') ' +
         'WHERE NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         'AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
         'AND (TRIID IN (SELECT TRIID FROM TGE208 WHERE TRISGT=''S'' AND ' + DM1.wReplacCeros + '(TRITMOV,'''')='''' )) ' +
         'GROUP BY D.CIADES, LOG315.CIAID, LOG315.LOCID, LOG315.TINID, LOG315.ALMID, LOG315.GRARID, C.CUENTAID, LOG315.CCOSID, R.CCOSDES, F.CTADES, H.CNTFREG, H.CNTCOMPROB ' +
         'UNION ALL ' +
         'SELECT D.CIADES, LOG315.CIAID, LOG315.LOCID, LOG315.TINID, LOG315.ALMID, LOG315.GRARID, ALM.CUENTAHAB CUENTAID, '''' CCOSID, 0 DEBES, 0 DEBED, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXCNTG * ARTPCG) ELSE (KDXCNTU * ARTPCU) END) AS HABERS, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXCNTG * ARTPCG) ELSE (KDXCNTU * ARTPCU) END)/' + dbeTipCam.text + ' HABERD, '''' CCOSDES, F.CTADES, ' +
         '''Consumo de Almacen Periodo ' + dm1.FormatPeriodo(strtoint(dbseAnio.Text), strtoint(dbseMes.Text)) + ''' GLOSA, ' +
         'H.CNTFREG, H.CNTCOMPROB ' +
         'FROM LOG315 ' +
         'LEFT JOIN TGE131 ALM ON (LOG315.CIAID=ALM.CIAID AND LOG315.TINID=ALM.TINID AND LOG315.GRARID=ALM.GRARID) ' +
         'LEFT JOIN TGE101 D ON (LOG315.CIAID=D.CIAID) ' +
         'LEFT JOIN TGE202 F ON (ALM.CIAID=F.CIAID AND ALM.CUENTAID=F.CUENTAID) ' +
         'LEFT JOIN LOG325 H ON (LOG315.CIAID=H.CIAID AND LOG315.TINID=H.TINID AND LOG315.ALMID =H.ALMID AND H.CNTANOMM=''' + dm1.FormatPeriodo(strtoint(dbseAnio.Text), strtoint(dbseMes.Text)) + ''') ' +
         'WHERE LOG315.NISATIP =''SALIDA'' AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         'AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') AND (KDXANOMM=' + QuotedStr(vanomes) + ') ' +
         'AND (TRIID IN (SELECT TRIID FROM TGE208 WHERE TRISGT=''S'' AND ' + DM1.wReplacCeros + '(TRITMOV,'''')='''' )) ' +
         'GROUP BY D.CIADES, LOG315.CIAID, LOG315.LOCID, LOG315.TINID, LOG315.ALMID, LOG315.GRARID, ALM.CUENTAHAB, F.CTADES, H.CNTFREG, H.CNTCOMPROB ' +
         'ORDER BY CIAID, LOCID, TINID, ALMID, GRARID, CCOSID DESC';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'SELECT D.CIADES, A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID, G.CUENTAID CUENTAID, A.CCOSID, ' +
            'SUM(DECODE(A.KDXCNTG,0,(A.KDXCNTU * A.ARTPCU),(A.KDXCNTG * A.ARTPCG))) DEBES, ' +
            'SUM(DECODE(A.KDXCNTG,0,(A.KDXCNTU * A.ARTPCU),(A.KDXCNTG * A.ARTPCG)))/' + dbeTipCam.text + ' DEBED,  0 HABERS,0 HABERD, R.CCOSDES, F.CTADES, ' +
            '''Consumo de Almacen Periodo ' + dm1.FormatPeriodo(strtoint(dbseAnio.Text), strtoint(dbseMes.Text)) + ''' GLOSA, ' +
            'H.CNTFREG, H.CNTCOMPROB ' +
            'FROM LOG315 A, TGE203 R, TGE131 G, TGE101 D, TGE202 F, LOG325 H ' +
            'WHERE (A.CCOSID=R.CCOSID(+)) ' +
            'AND A.CIAID=D.CIAID(+) ' +
            'AND A.NISATIP =''SALIDA'' AND (A.KDXANOMM=' + QuotedStr(vanomes) + ') AND (A.CIAID=' + QuotedStr(dblcCia.text) + ') AND (A.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            'AND (A.TINID=' + QuotedStr(dblcTInv.text) + ') AND (A.ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
            'AND (A.CIAID=G.CIAID) AND (A.TINID=G.TINID) AND (A.GRARID=G.GRARID) ' +
            'AND G.CIAID = F.CIAID(+) AND G.CUENTAID = F.CUENTAID(+) ' +
            'AND A.CIAID =H.CIAID(+) AND A.TINID =H.TINID(+) AND A.ALMID =H.ALMID(+) AND H.CNTANOMM(+)=''' + dm1.FormatPeriodo(strtoint(dbseAnio.Text), strtoint(dbseMes.Text)) + ''' ' +
            'GROUP BY D.CIADES, A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID, G.CUENTAID, A.CCOSID, R.CCOSDES, F.CTADES, H.CNTFREG, H.CNTCOMPROB ' +
            'UNION ALL ' +
            'SELECT D.CIADES, A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID, G.CUENTAHAB CUENTAID, '''' CCOSID, 0 DEBES, 0 DEBED, ' +
            'SUM(DECODE(A.KDXCNTG,0, (A.KDXCNTU * A.ARTPCU), (A.KDXCNTG * A.ARTPCG))) HABERS, ' +
            'SUM(DECODE(A.KDXCNTG,0, (A.KDXCNTU * A.ARTPCU), (A.KDXCNTG * A.ARTPCG)))/' + dbeTipCam.text + ' HABERD, '' '' CCOSDES, F.CTADES, ' +
            '''Consumo de Almacen Periodo ' + dm1.FormatPeriodo(strtoint(dbseAnio.Text), strtoint(dbseMes.Text)) + ''' GLOSA, ' +
            'H.CNTFREG, H.CNTCOMPROB ' +
            'FROM LOG315 A, TGE131 G, TGE101 D, TGE202 F, LOG325 H ' +
            'WHERE A.NISATIP =''SALIDA'' AND (A.CIAID=' + QuotedStr(dblcCia.text) + ') AND (A.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            'AND (A.TINID=' + QuotedStr(dblcTInv.text) + ') AND (A.ALMID=' + QuotedStr(dblcAlm.text) + ') AND A.CIAID=G.CIAID AND (KDXANOMM=' + QuotedStr(vanomes) + ') ' +
            'AND (A.TINID=G.TINID) AND (A.GRARID=G.GRARID) AND A.CIAID=D.CIAID(+) ' +
            'AND G.CIAID = F.CIAID(+) AND G.CUENTAID = F.CUENTAID(+) ' +
            'AND A.CIAID =H.CIAID(+) AND A.TINID =H.TINID(+) AND A.ALMID =H.ALMID(+) AND H.CNTANOMM(+)=''' + dm1.FormatPeriodo(strtoint(dbseAnio.Text), strtoint(dbseMes.Text)) + ''' ' +
            'GROUP BY D.CIADES, A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID, G.CUENTAHAB, F.CTADES, H.CNTFREG, H.CNTCOMPROB ' +
            'ORDER BY CIAID, LOCID, TINID, ALMID, GRARID, CCOSID DESC';
      End;

   dm1.cdsTGE.Close;
   dm1.cdsTGE.ProviderName := 'prvTGE';
   dm1.cdsTGE.DataRequest(sSQL);
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
   dbgAsientoS.Selected.Add('GRARID'#9'3'#9'Lin');
   dbgAsientoS.Selected.Add('CUENTAID'#9'16'#9'Cuenta');
   dbgAsientoS.Selected.Add('CCOSID'#9'8'#9'C.Costo');
   dbgAsientoS.Selected.Add('CCOSDES'#9'26'#9'Descripcion');
   dbgAsientoS.Selected.Add('DEBES'#9'10'#9'Debe');
   dbgAsientoS.Selected.Add('HABERS'#9'10'#9'Haber');

   dbgAsientoS.DataSource := DM1.dsTGE;

   pnlDetalle.enabled := true;
   pnlCabecera.enabled := false;
   Screen.Cursor := crDefault;
End;

Procedure TFGenAsiAlm.bbGrabaClick(Sender: TObject);
Var
   sFecha, sSQL, sTDiar, sTDiarDes: String;
   sCompro, STipCam, vTRI, vSEM, vSS, vAATRI, vAASEM, vAASS: String;
Begin
   If dm1.cdsTGE.RecordCount = 0 Then
   Begin
      MessageDlg('No existen Registro a procesar', mtConfirmation, [mbYes], 0);
      exit;
   End;

   sFecha := formatdatetime(dm1.wFormatFecha, dtpFCambio.DateTime);
   sSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
   DM1.FiltraCDS(DM1.cdsPeriodo, sSQL);

   vTRI := DM1.cdsPeriodo.fieldbyName('FECTRIM').asString;
   vSEM := DM1.cdsPeriodo.fieldbyName('FECSEM').asString;
   vSS := DM1.cdsPeriodo.fieldbyName('FECSS').asString;
   vAATRI := DM1.cdsPeriodo.fieldbyName('FECAATRI').asString;
   vAASEM := DM1.cdsPeriodo.fieldbyName('FECAASEM').asString;
   vAASS := DM1.cdsPeriodo.fieldbyName('FECAASS').asString;
   STipCam := Copy(cbItemTCam.text, 1, 1);
   STipCam := STipCam + copy(cbItemTCam.text, pos(' ', cbItemTCam.text) + 1, 1);

  //VERIFICA EN TABLA DE CONTROL LOG325 SI YA EXISTE ASIENTO PARA EL ALMACEN
   sSQL := ' CIAID=' + quotedStr(dblcCia.text) + ' AND LOCID=' + quotedStr(dblcLOC.text) +
      ' AND TINID=' + quotedStr(dblcTInv.text) + ' AND ALMID=' + quotedStr(dblcALM.text) +
      ' AND CNTANOMM=' + QuotedStr(vanomes) + 'AND FLAGCONS=''S''';

   If DM1.DisplayDescrip('prvTGE', 'LOG325', 'COUNT(*) CUENTA', sSQL, 'CUENTA') <> '0' Then
   Begin
      MessageDlg('Ya se procesó el asiento para este almacén', mtConfirmation, [mbYes], 0);
      exit;
   End;

   If MessageDlg('¿Está seguro de grabar el asiento?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      exit;
   Screen.Cursor := crHourGlass;

  // Captura el Tipo de Diario en la Tabla de Almacentes
   sSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTInv.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcALM.text);
   sTDiar := DM1.DisplayDescrip('prvTGE', 'TGE151', 'TDIARID', sSQL, 'TDIARID');

   sSQL := 'TDIARID=' + QuotedStr(sTDiar);
   sTDiarDes := DM1.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', sSQL, 'TDIARDES');

  //BUSCA COMPROBANTE PARA CIAID+PERIODO+TDIARID
   sSQL := ' CIAID=' + QuotedStr(dblcCia.text) + ' AND TDIARID=' + QuotedStr(sTDiar) + ' AND CNTANOMM=' + QuotedStr(vAnoMes);
   sCompro := DM1.StrZero(DM1.UltimoNum('prvTGE', 'CNT300', 'CNTCOMPROB', sSQL), 10);

  //INSERTA REGISTRO EN TABLA DE CONTROL LOG325
   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'INSERT INTO LOG325(CIAID, LOCID, TINID, ALMID, CNTANOMM, CNTUSER, CNTFREG, CNTHREG, CNTCOMPROB, FLAGCONS) ' +
         'VALUES(' + quotedStr(dblcCia.text) + ', ' + quotedStr(dblcLOC.text) + ', ' + quotedStr(dblcTInv.text) + ', ' +
         quotedStr(dblcALM.text) + ', ' + QuotedStr(vanomes) + ', ' + quotedStr(DM1.wUsuario) + ', ' +
         QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ', ' + QuotedStr(TimeToStr(Time)) + ', ' +
         QuotedStr(sCompro) + ',''S'')';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'INSERT INTO LOG325(CIAID, LOCID, TINID, ALMID, CNTANOMM, CNTUSER, CNTFREG, CNTHREG, CNTCOMPROB, FLAGCONS) ' +
            'VALUES(' + quotedStr(dblcCia.text) + ', ' + quotedStr(dblcLOC.text) + ', ' + quotedStr(dblcTInv.text) + ',' +
            quotedStr(dblcALM.text) + ', ' + QuotedStr(vanomes) + ', ' + quotedStr(DM1.wUsuario) + ',' +
            QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ', SYSDATE, ' +
            QuotedStr(sCompro) + ',''S'')';
      End;
   DM1.DCOM1.AppServer.EjecutaQry(sSQL);

  //INSERTA REGISTRO DEL DEBE EN TABLA CNT301 DETALLE
   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'INSERT INTO CNT301(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, ' +
         'CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, ' +
         'CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, ' +
         'CNTAASS, TMONID, TDIARDES, CTADES, CCOSDES, CNTTS, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTMODDOC) ' +
         'SELECT LOG315.CIAID, ' + QuotedStr(sTDiar) + ' TDIARID, ' + QuotedStr(sCompro) + ' CNTCOMPROB, ' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM, ''0000'' LOTE, ' +
         'LIN.CUENTAID, '''' DOCID, '''' CNTSERIE, '''' CNTNODOC, ' + QuotedStr('CONSUMOS ALM:' + dblcAlm.text + ' MES:' + vmes + ' AÑO: ' + dbseAnio.Text) + ' CNTGLOSA, ' +
         '''D'' CNTDH, LOG315.CCOSID, ' + dbeTipCam.text + ' CNTTCAMBIO, ' + ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOORI, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOLOC, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTMTOEXT, ' +
         'DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS, ' +
         'DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO, ' +
         'DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP, ' +
         '''P'' CNTESTADO, ''S'' CNTCUADRE, ''S'' CNTAUTOM, ' + QuotedStr(DM1.wUsuario) + ' CNTUSER, DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG, ' +
         QuotedStr(TimeToStr(Time)) + ' CNTHREG,' + QuotedStr(vMes) + ' CNTMM,' + QuotedStr(vDia) + ' CNTDD,' + QuotedStr(vTRI) + ' CNTTRI,' + QuotedStr(vSEM) + 'CNTSEM,' +
         QuotedStr(vSS) + ' CNTSS, ' + QuotedStr(vAATRI) + ' CNTAATRI, ' + QuotedStr(vAASEM) + ' CNTAASEM, ' + QuotedStr(vAASS) + ' CNTAASS,' + QuotedStr(dblcMoneda.text) + ' TMONID, SUBSTR(' +
         QuotedStr(sTDiarDes) + ',1,15) TDIARDES, SUBSTR(CTA.CTADES,1,15) CTADES,SUBSTR(CCOS.CCOSDES,1,15), ' + QuotedStr(sTipCam) + ' CNTTS, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTDEBEMN, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTDEBEME, 0 CNTHABEMN, 0 CNTHABEME, ''ALM'' ' +
         'FROM LOG315 ' +
         'LEFT JOIN TGE202 CTA ON (LOG315.CUENTAID=CTA.CUENTAID) ' +
         'LEFT JOIN TGE203 CCOS ON (LOG315.CCOSID=CCOS.CCOSID) ' +
         'LEFT JOIN TGE131 LIN ON (LOG315.CIAID=LIN.CIAID AND LOG315.TINID=LIN.TINID AND LOG315.GRARID=LIN.GRARID) ' +
         'WHERE NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         'AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
         'GROUP BY LOG315.CIAID, KDXANOMM, LIN.CUENTAID, CTADES, LOG315.CCOSID, CCOSDES ';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'INSERT INTO CNT301(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, ' +
            'CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, ' +
            'CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, ' +
            'CNTAASS, TMONID, TDIARDES, CTADES, CCOSDES, CNTTS, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTMODDOC) ' +
            'SELECT LOG315.CIAID, ' + QuotedStr(sTDiar) + ' TDIARID, ' + QuotedStr(sCompro) + ' CNTCOMPROB, ' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM, ''0000'' LOTE, ' +
            'LIN.CUENTAID, '''' DOCID, '''' CNTSERIE, '''' CNTNODOC, ' + QuotedStr('CONSUMOS ALM:' + dblcAlm.text + ' MES:' + vmes + ' AÑO: ' + dbseAnio.Text) + ' CNTGLOSA, ' +
            '''D'' CNTDH, LOG315.CCOSID, ' + dbeTipCam.text + ' CNTTCAMBIO, ' +
            'SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTMTOORI, ' +
            'SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTMTOLOC, ' +
            'SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTMTOEXT, ' +
            'TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS, ' +
            'TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO, ' +
            'TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP, ' +
            '''P'' CNTESTADO, ''S'' CNTCUADRE, ''S'' CNTAUTOM, ' + QuotedStr(DM1.wUsuario) + ' CNTUSER, TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG, ' +
            'SYSDATE CNTHREG, ' + QuotedStr(vMes) + ' CNTMM, ' + QuotedStr(vDia) + ' CNTDD, ' + QuotedStr(vTRI) + ' CNTTRI, ' + QuotedStr(vSEM) + 'CNTSEM, ' +
            QuotedStr(vSS) + ' CNTSS, ' + QuotedStr(vAATRI) + ' CNTAATRI, ' + QuotedStr(vAASEM) + ' CNTAASEM, ' + QuotedStr(vAASS) + ' CNTAASS, ' + QuotedStr(dblcMoneda.text) + ' TMONID, SUBSTR(' +
            QuotedStr(sTDiarDes) + ',1,15) TDIARDES, SUBSTR(CTA.CTADES,1,15) CTADES, CCOS.CCOSABR, ' + QuotedStr(sTipCam) + ' CNTTS, ' +
            'SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTDEBEMN, ' +
            'SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTDEBEME, 0 CNTHABEMN, 0 CNTHABEME, ''ALM'' ' +
            'FROM LOG315,TGE202 CTA,TGE203 CCOS, TGE131 LIN ' +
            'WHERE (LOG315.CUENTAID=CTA.CUENTAID(+)) AND (LOG315.CCOSID=CCOS.CCOSID(+)) AND NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            'AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
            'AND (LOG315.CIAID=LIN.CIAID) AND (LOG315.TINID=LIN.TINID) AND (LOG315.GRARID=LIN.GRARID) ' +
            'GROUP BY LOG315.CIAID, KDXANOMM, LIN.CUENTAID, CTADES, LOG315.CCOSID, CCOSABR';
      End;

   DM1.DCOM1.AppServer.EjecutaQry(sSQL);

  //INSERTA REGISTRO DEL HABER EN TABLA CNT301 DETALLE
   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'INSERT INTO CNT301(CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH, ' +
         'CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,' +
         'CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,' +
         'CNTAASS,TMONID,TDIARDES,CTADES,CCOSDES,CNTTS,CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME, CNTMODDOC) ' +
         'SELECT LOG315.CIAID, ' + QuotedStr(sTDiar) + ' TDIARID, ' + QuotedStr(sCompro) + ' CNTCOMPROB,' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM, ''0000'' LOTE,' +
         'LIN.CUENTAHAB, ''VR'' DOCID, ''000'' CNTSERIE, ' + QuotedStr(sTDiar + Scompro) + ' CNTNODOC, ' + QuotedStr('CONSUMOS ALM:' + dblcAlm.text + ' MES:' + vmes + ' AÑO: ' + dbseAnio.Text) + ' CNTGLOSA, ' +
         '''H'' CNTDH, '''' CCOSID, ' + dbeTipCam.text + ' CNTTCAMBIO, ' + ' SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOORI, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTMTOLOC, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTMTOEXT, ' +
         'DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS, ' +
         'DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO, ' +
         'DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP, ' +
         '''P'' CNTESTADO, ''S'' CNTCUADRE, ''S'' CNTAUTOM, ' + QuotedStr(DM1.wUsuario) + ' CNTUSER, DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG,' +
         QuotedStr(TimeToStr(Time)) + ' CNTHREG,' + QuotedStr(vMes) + ' CNTMM,' + QuotedStr(vDia) + ' CNTDD, ' + QuotedStr(vTRI) + ' CNTTRI, ' + QuotedStr(vSEM) + 'CNTSEM, ' +
         QuotedStr(vSS) + ' CNTSS,' + QuotedStr(vAATRI) + ' CNTAATRI, ' + QuotedStr(vAASEM) + ' CNTAASEM, ' + QuotedStr(vAASS) + ' CNTAASS, ' + QuotedStr(dblcMoneda.text) + ' TMONID, SUBSTR(' +
         QuotedStr(sTDiarDes) + ',1,15) TDIARDES, SUBSTR(CTA.CTADES,1,15) CTADES, '''' CCOSDES, ' + QuotedStr(sTipCam) + ' CNTTS, ' +
         '0 CNTDEBEMN, 0 CNTDEBEME, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END) CNTHABEMN, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXPEDIDOG * ARTPCG) ELSE (KDXPEDIDOU * ARTPCU) END)/' + dbeTipCam.text + ' CNTHABEME, ''ALM'' ' +
         'FROM LOG315 ' +
         'LEFT JOIN TGE131 LIN ON (LOG315.CIAID=LIN.CIAID AND LOG315.TINID=LIN.TINID AND LOG315.GRARID=LIN.GRARID) ' +
         'LEFT JOIN TGE202 CTA ON (LIN.CUENTAHAB=CTA.CUENTAID) ' +
         'WHERE NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         'AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
         'GROUP BY LOG315.CIAID, KDXANOMM, LIN.CUENTAHAB, CTADES';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'INSERT INTO CNT301(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, ' +
            'CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO,' +
            'CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM,' +
            'CNTAASS, TMONID, TDIARDES, CTADES, CCOSDES, CNTTS, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTMODDOC) ' +
            'SELECT LOG315.CIAID, ' + QuotedStr(sTDiar) + ' TDIARID, ' + QuotedStr(sCompro) + ' CNTCOMPROB, ' + QuotedStr(dbseAnio.Text) + ' CNTANO, KDXANOMM, ''0000'' LOTE, ' +
            'LIN.CUENTAHAB, ''VR'' DOCID, ''000'' CNTSERIE, ' + QuotedStr(sTDiar + Scompro) + ' CNTNODOC, ' + QuotedStr('CONSUMOS ALM:' + dblcAlm.text + ' MES:' + vmes + ' AÑO: ' + dbseAnio.Text) + ' CNTGLOSA, ' +
            '''H'' CNTDH, '''' CCOSID, ' + dbeTipCam.text + ' CNTTCAMBIO, ' +
            'SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTMTOORI, ' +
            'SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTMTOLOC, ' +
            'SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTMTOEXT, ' +
            'TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFEMIS, ' +
            'TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFVCMTO, ' +
            'TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, dtpFCambio.date)) + ') CNTFCOMP, ' +
            '''P'' CNTESTADO, ''S'' CNTCUADRE, ''S'' CNTAUTOM, ' + QuotedStr(DM1.wUsuario) + ' CNTUSER, TO_DATE(' + QuotedStr(FormatDateTime(dm1.wFormatFecha, Date)) + ') CNTFREG, ' +
            'SYSDATE CNTHREG, ' + QuotedStr(vMes) + ' CNTMM, ' + QuotedStr(vDia) + ' CNTDD, ' + QuotedStr(vTRI) + ' CNTTRI, ' + QuotedStr(vSEM) + 'CNTSEM, ' +
            QuotedStr(vSS) + ' CNTSS, ' + QuotedStr(vAATRI) + ' CNTAATRI, ' + QuotedStr(vAASEM) + ' CNTAASEM, ' + QuotedStr(vAASS) + ' CNTAASS,' + QuotedStr(dblcMoneda.text) + ' TMONID, SUBSTR(' +
            QuotedStr(sTDiarDes) + ',1,15) TDIARDES, SUBSTR(CTA.CTADES,1,15) CTADES, '''' CCOSDES, ' + QuotedStr(sTipCam) + ' CNTTS, ' +
            '0 CNTDEBEMN, 0  CNTDEBEME, ' +
            'SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) CNTHABEMN, ' +
            'SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG)))/' + dbeTipCam.text + ' CNTHABEME, ''ALM'' ' +
            'FROM LOG315, TGE131 LIN, TGE202 CTA ' +
            'WHERE (LIN.CUENTAHAB=CTA.CUENTAID(+)) AND NISATIP =''SALIDA'' AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (LOG315.CIAID=' + QuotedStr(dblcCia.text) + ') AND (LOG315.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            'AND (LOG315.TINID=' + QuotedStr(dblcTInv.text) + ') AND (LOG315.ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
            'AND LOG315.CIAID=LIN.CIAID AND LOG315.TINID=LIN.TINID AND LOG315.GRARID=LIN.GRARID ' +
            'GROUP BY LOG315.CIAID, KDXANOMM, LIN.CUENTAHAB, CTADES';
      End;
   DM1.DCOM1.AppServer.EjecutaQry(sSQL);
  //Contabiliza
  //ErrorMsg(' Henry ',' Falta Contabilizar ');
   DM1.GeneraContabilidad(dblcCia.text, sTDiar, vanomes, sCompro, self, 'ALM');

   Screen.Cursor := crDefault;
   bbGraba.Enabled := false;
   bbModi.Enabled := false;
   vcargacta := '';
   Screen.Cursor := crDefault;
End;

Procedure TFGenAsiAlm.dblcCiaExit(Sender: TObject);
Var
   ssql: String;
Begin
   If dblcCia.text = '' Then
   Begin
      errormsg('Error', 'Debe de escoger una Compañia');
   //dblcCia.setfocus;
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

Procedure TFGenAsiAlm.dtpFCambioExit(Sender: TObject);
Begin
 { descodifica el date del sistema}
   If (dm1.strZero(dbseMes.text, 2) <> copy(DateTostr(dtpFCambio.date), 4, 2)) Or (dbseAnio.text <> copy(DateTostr(dtpFCambio.date), 7, 4)) Then
   Begin
      errormsg('Error', 'La fecha debe de estar dentro' + #13 + 'del Mes y Año del Período');
      dtpFCambio.setfocus;
      dtpFCambio.DateTime := date();
   End;
End;

Procedure TFGenAsiAlm.bbModiClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   Limpia;
   vcargacta := '';
   pnlDetalle.enabled := false;
   pnlCabecera.enabled := True;
   Screen.Cursor := crDefault;
End;

Procedure TFGenAsiAlm.Limpia;
Begin
{ dm1.cdsTGE.first;
 while not dm1.cdsTGE.eof do dm1.cdsTGE.delete;
 dm1.cdsAsientoS.first;
 while not dm1.cdsAsientoS.eof do dm1.cdsAsientoS.delete;}
End;

Procedure TFGenAsiAlm.bbsalirClick(Sender: TObject);
Begin
   FGenAsiAlm.Close;
End;

Procedure TFGenAsiAlm.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   dm1.cdsTMoneda.Close; { tipo de moneda}
//  dm1.cdsTRAN.Close;    {transaccion}
   dm1.cdsKDX.Close; {detalle de mov. LOG315}
//  dm1.cdsCia.Close;     {compañia}
   dm1.cdsNivel.Close;
   dm1.cdsTDiario.Close;
   DM1.cdsTDiario.DataRequest('SELECT * FROM TGE104');

   dm1.cdsPeriodo.Close; { periodos, semestres, etc.. TGE114 }
End;

Procedure TFGenAsiAlm.dblcMonedaExit(Sender: TObject);
Begin
   dbeTipCam.text := '';
   dbeMoneda.Text := dm1.cdsTMoneda.fieldbyname('TMONDES').AsString;
   JalaTipCam;
End;

//** 15/03/2001 - pjsv

Procedure TFGenAsiAlm.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;
//**

Procedure TFGenAsiAlm.dblcLOCExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If dblcLOc.text = '' Then
   Begin
      errormsg('Error', 'Debe de escoger una Localidad');
   //dblcLOC.setfocus;
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

Procedure TFGenAsiAlm.dblcTInvExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If dblcTInv.text = '' Then
   Begin
      errormsg('Error', 'Debe de escoger una Tipo de Inventario');
   //dblcTInv.setfocus;
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

Procedure TFGenAsiAlm.dblcAlmExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If dblcAlm.text = '' Then
   Begin
      errormsg('Error', 'Debe de escoger una Tipo de Inventario');
   //dblcAlm.setfocus;
      exit;
   End;
   sSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTInv.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcALM.text);
   dbeALM.Text := DM1.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', sSQL, 'ALMDES');
End;

Procedure TFGenAsiAlm.Z1sbCCostoClick(Sender: TObject);
Var
   sSQL: String;
Begin
   pprAsientoCtbl.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RptAsientoCtblAlm.rtm';
   pprAsientoCtbl.template.LoadFromFile;

   lblPeriodo.Text := dm1.FormatPeriodo(strtoint(dbseAnio.Text), strtoint(dbseMes.Text));
   lblGlosa.Text := 'Consumo de Almacen Periodo ' + lblPeriodo.Text;
   lblmoneda.Text := dbeMoneda.Text;
   lblTipoCamb.Text := dbeTipCam.Text;

   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'SELECT ' +
         'SUM(CASE WHEN A.KDXCNTG<>0 THEN (A.KDXCNTG * A.ARTPCG) ELSE (A.KDXCNTU * A.ARTPCU) END) TOTALS, ' +
         'SUM(CASE WHEN A.KDXCNTG<>0 THEN (A.KDXCNTG * A.ARTPCG) ELSE (A.KDXCNTU * A.ARTPCU) END)/' + dbeTipCam.text + ' TOTALD ' +
         'FROM LOG315 A, TGE203 R, TGE131 G, TGE101 D ' +
         'WHERE (A.CCOSID=R.CCOSID) ' +
         'AND A.NISATIP =''SALIDA'' ' +
         'AND A.CIAID=D.CIAID ' +
         'AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (A.CIAID=' + QuotedStr(dblcCia.text) + ') AND (A.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
         'AND (A.TINID=' + QuotedStr(dblcTInv.text) + ') AND (A.ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
         'AND (A.CIAID=G.CIAID) ' +
         'AND (A.TINID=G.TINID) ' +
         'AND (A.GRARID=G.GRARID)';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'SELECT ' +
            'SUM(DECODE(A.KDXCNTG,0,(A.KDXCNTU * A.ARTPCU),(A.KDXCNTG * A.ARTPCG))) TOTALS, ' +
            'SUM(DECODE(A.KDXCNTG,0,(A.KDXCNTU * A.ARTPCU),(A.KDXCNTG * A.ARTPCG)))/' + dbeTipCam.text + ' TOTALD ' +
            'FROM LOG315 A, TGE203 R, TGE131 G, TGE101 D ' +
            'WHERE (A.CCOSID=R.CCOSID(+)) ' +
            'AND A.NISATIP =''SALIDA'' ' +
            'AND A.CIAID=D.CIAID(+) ' +
            'AND (KDXANOMM=' + QuotedStr(vanomes) + ') AND (A.CIAID=' + QuotedStr(dblcCia.text) + ') AND (A.LOCID=' + QuotedStr(dblcLOC.text) + ') ' +
            'AND (A.TINID=' + QuotedStr(dblcTInv.text) + ') AND (A.ALMID=' + QuotedStr(dblcAlm.text) + ') ' +
            'AND (A.CIAID=G.CIAID) ' +
            'AND (A.TINID=G.TINID) ' +
            'AND (A.GRARID=G.GRARID)';
      End;
   dm1.cdsReporte.Close;
   dm1.cdsReporte.DataRequest(sSQL);
   dm1.cdsReporte.Open;

   If dm1.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe información a Mostrar');
      Exit;
   End;

   lblImporte.Text := FloatToStrF(dm1.cdsReporte.FieldByName('TOTALS').AsFloat, ffNumber, 15, 2);

   pprAsientoCtbl.Print;
   pprAsientoCtbl.Stop;

End;

Procedure TFGenAsiAlm.pprAsientoCtblPreviewFormCreate(Sender: TObject);
Begin
   pprAsientoCtbl.PreviewForm.ClientHeight := 500;
   pprAsientoCtbl.PreviewForm.ClientWidth := 650;
   TppViewer(pprAsientoCtbl.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFGenAsiAlm.ppHeaderBand2BeforePrint(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTInv.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcALM.text);
   lblTD.Text := DM1.DisplayDescrip('prvTGE', 'TGE151', 'TDIARID', sSQL, 'TDIARID');
   sSQL := 'TDIARID=' + QuotedStr(lblTD.Text);
   lblDiario.Text := DM1.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', sSQL, 'TDIARDES');
  //lblImporte.Text:=ppDBCalc1.Text;
End;

Procedure TFGenAsiAlm.Z1sbAContableClick(Sender: TObject);
Begin
   If dm1.cdsTGE.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe información a Mostrar');
      Exit;
   End;
   pprAContable.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AlmVoucherG.rtm';
   pprAContable.template.LoadFromFile;
   ppLabel32.Text := dm1.FormatPeriodo(strtoint(dbseAnio.Text), strtoint(dbseMes.Text));
   ppLabel4.Text := 'Consumo de Almacen Periodo ' + ppLabel32.Text;
   ppLabel37.Text := dbeMoneda.Text;
   ppLabel45.Text := dbeTipCam.Text;
   pplNoDoc.Text := '';
   ppLabel31.Text := dbeTipCam.Text;

   If dm1.wTMonExt = dblcMoneda.Text Then
   Begin
      ppDBText6.DataField := 'DEBED';
      ppDBText7.DataField := 'HABERD';
      ppDBCalc3.DataField := 'DEBED';
      ppDBCalc4.DataField := 'HABERD';
      ppDBCalc5.DataField := '';
      ppDBCalc6.DataField := '';
      ppDBText8.DataField := '';
      ppDBText9.DataField := '';
   End
   Else
   Begin
      ppDBText6.DataField := '';
      ppDBText7.DataField := '';
      ppDBCalc3.DataField := '';
      ppDBCalc4.DataField := '';
      ppDBCalc5.DataField := 'DEBES';
      ppDBCalc6.DataField := 'HABERS';
      ppDBText8.DataField := 'DEBES';
      ppDBText9.DataField := 'HABERS';
   End;
   pprAContable.Print;
   pprAContable.Stop;
End;

Procedure TFGenAsiAlm.ppHeaderBand1BeforePrint(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTInv.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcALM.text);
   ppLabel14.Text := DM1.DisplayDescrip('prvTGE', 'TGE151', 'TDIARID', sSQL, 'TDIARID');
   sSQL := 'TDIARID=' + QuotedStr(ppLabel14.Text);
   ppLabel15.Text := DM1.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', sSQL, 'TDIARDES');
  //ppLabel35.Text:='';
  //lblImporte.Text:=ppDBCalc1.Text;
End;

Procedure TFGenAsiAlm.pprAContablePreviewFormCreate(Sender: TObject);
Begin
   pprAContable.PreviewForm.ClientHeight := 500;
   pprAContable.PreviewForm.ClientWidth := 650;
   TppViewer(pprAContable.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

{
procedure TFToolKdx.CalcularKardex();
var
 sSQL, xSQL, sTOTAL : String;
 SalIniDes, SalIniHas, sDesde, sHasta : string;
 xSalIni : Double;
begin
 if dtpDesde.Date > dtpHasta.Date then
 begin
  ErrorMsg(Caption, ' La Fecha Hasta no puede ser Menor a la Fecha Desde');
  Exit;
 end;
 Screen.Cursor:=crHourGlass;
 xwhere := '';
 if rgTipoStocValo.ItemIndex = 0 then
 begin
  pprDetalle.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\KardexFiltro.Rtm' ;
  pprDetalle.template.LoadFromFile
 end
 else
 begin
  pprDetalle.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\KardexFilVal.Rtm' ;
  pprDetalle.template.LoadFromFile
 end;
 InsDataFil;		// Inserta en el LOG323
 DecodeDate(dtpDesde.Date, Y, M, D);
 SalIniDes:='01'+'/'+IntToStr(M)+'/'+IntToStr(Y);
 if D = 1 then
  SalIniHas:=IntToStr(D)+'/'+IntToStr(M)+'/'+IntToStr(Y)
 else
  SalIniHas:=IntToStr(D-1)+'/'+IntToStr(M)+'/'+IntToStr(Y);

 SalIniDes:=quotedStr(formatdatetime(dm1.wFormatFecha,strtodatetime(SalIniDes)));
 SalIniHas:=quotedStr(formatdatetime(dm1.wFormatFecha,strtodatetime(SalIniHas)));
 sDesde   :=quotedStr(formatdatetime(dm1.wFormatFecha,dtpDesde.DateTime));
 sHasta   :=quotedStr(formatdatetime(dm1.wFormatFecha,dtpHasta.DateTime));

 if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
 begin
  if D > 1 then
  begin
   sTOTAL:='SELECT '+
    'MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, DATE('+SalIniHas+') NISAFREG, TIME(''00:00:00'') KDXHREG, '+
    '''00'' TDAID, ''Saldo Inicial'' TDAABR, '''' TDATIP, MOV.ARTFUC, '+
    'MOV.ARTID, MOV.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, '+
    ''' '' NISAID,  '' '' NISATIP, '+
    'MOV.SALDOG + XX.TOTINGG - XX.TOTSALG SALDOG, '+
    'MOV.SALDOU + XX.TOTINGU - XX.TOTSALU SALDOU, '+
    'MOV.MONTOG + XX.MTOINGG - XX.MTOSALG MONTOG, '+
    'MOV.MONTOU + XX.MTOINGU - XX.MTOSALU MONTOU, '+
    '0.00 ARTPCG, 0.00 ARTPCU, '+
    '0.00 KDXCNTG, 0.00 KDXCNTU, '+
    '0.00 KDXCNTGI, 0.00 KDXCNTUI, 0.00 KDXCNTGS, 0.00 KDXCNTUS, '+
    'MOV.ARTCPROG, MOV.ARTCPROU, '+
    '0.00 KDXCPROGI, 0.00 KDXCPROUI, 0.00 KDXCPROGS, 0.00 KDXCPROUS, '+
    'ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZCNT '+
    'FROM LOG323  AS MOV '+
    'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) '+
    'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) '+
    'LEFT JOIN TGE101 CIA   ON ( MOV.CIAID=CIA.CIAID ) '+
    'LEFT JOIN TGE126 LOC   ON ( MOV.LOCID=LOC.LOCID AND MOV.CIAID=LOC.CIAID) '+
    'LEFT JOIN TGE151 ALM   ON ( MOV.ALMID=ALM.ALMID AND MOV.CIAID=ALM.CIAID AND MOV.LOCID=ALM.LOCID AND MOV.TINID=ALM.TINID) '+
    'LEFT JOIN TGE152 TIN   ON ( MOV.TINID=TIN.TINID AND MOV.CIAID=TIN.CIAID) '+
    'LEFT JOIN TGE131 GRA   ON ( MOV.GRARID=GRA.GRARID AND MOV.TINID=GRA.TINID) '+
    'LEFT JOIN TGE205 ART   ON ( MOV.ARTID=ART.ARTID AND MOV.CIAID=ART.CIAID) '+
    'LEFT JOIN (SELECT CIAID, ARTID, '+
           'SUM(CASE WHEN NISATIP =''INGRESO'' THEN '+dm1.wReplacCeros+'(KDXCNTG,0.00) ELSE (0.00) END) TOTINGG, '+
           'SUM(CASE WHEN NISATIP =''SALIDA''  THEN '+dm1.wReplacCeros+'(KDXCNTG,0.00) ELSE (0.00) END) TOTSALG, '+
           'SUM(CASE WHEN NISATIP =''INGRESO'' THEN '+dm1.wReplacCeros+'(KDXCNTU,0.00) ELSE (0.00) END) TOTINGU, '+
           'SUM(CASE WHEN NISATIP =''SALIDA''  THEN '+dm1.wReplacCeros+'(KDXCNTU,0.00) ELSE (0.00) END) TOTSALU, ' +
           'SUM(CASE WHEN NISATIP =''INGRESO'' THEN '+dm1.wReplacCeros+'(ARTPCG,0.00) ELSE (0.00) END) MTOINGG, '+
           'SUM(CASE WHEN NISATIP =''SALIDA''  THEN '+dm1.wReplacCeros+'(ARTPCG,0.00) ELSE (0.00) END) MTOSALG, '+
           'SUM(CASE WHEN NISATIP =''INGRESO'' THEN '+dm1.wReplacCeros+'(ARTPCU,0.00) ELSE (0.00) END) MTOINGU, '+
           'SUM(CASE WHEN NISATIP =''SALIDA''  THEN '+dm1.wReplacCeros+'(ARTPCU,0.00) ELSE (0.00) END) MTOSALU  '+
          'FROM LOG315 WHERE '+
          'NISAFREG>='+SalIniDes+' AND '+
          'NISAFREG<='+SalIniHas+' '+
          'GROUP BY CIAID, ARTID '+
          ') XX ON (MOV.ARTID=XX.ARTID  AND MOV.CIAID=XX.CIAID) '+
    'WHERE MOV.USUARIO='''+DM1.wUsuario+''' ';
   sTOTAL:=sTOTAL+' UNION ALL ';
  end
  else
  if D = 1 then
  begin
   sTOTAL:='SELECT '+
    'MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, DATE('+SalIniHas+') NISAFREG, TIME(''00:00:00'') KDXHREG, ''00'' TDAID, ''Saldo Inicial'' TDAABR, '''' TDATIP, MOV.ARTFUC, '+
    'MOV.ARTID, MOV.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, '+
    ''' '' NISAID,  '' '' NISATIP, '+
    'MOV.SALDOG, MOV.SALDOU, '+
    'MOV.MONTOG, MOV.MONTOU, 0.00 ARTPCG, 0.00 ARTPCU, '+
    '0.00 KDXCNTG, 0.00 KDXCNTU, '+
    '0.00 KDXCNTGI, 0.00 KDXCNTUI, 0.00 KDXCNTGS, 0.00 KDXCNTUS, '+
    'MOV.ARTCPROG, MOV.ARTCPROU, '+
    '0.00 KDXCPROGI, 0.00 KDXCPROUI, 0.00 KDXCPROGS, 0.00 KDXCPROUS, '+
    'ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZCNT '+
    'FROM LOG323 AS MOV '+
    'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) '+
    'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) '+
    'LEFT JOIN TGE205 ART   ON ( MOV.ARTID=ART.ARTID AND MOV.CIAID=ART.CIAID) '+
    'LEFT JOIN TGE101 CIA   ON ( MOV.CIAID=CIA.CIAID ) '+
    'LEFT JOIN TGE126 LOC   ON ( MOV.LOCID=LOC.LOCID AND MOV.CIAID=LOC.CIAID) '+
    'LEFT JOIN TGE151 ALM   ON ( MOV.ALMID=ALM.ALMID AND MOV.CIAID=ALM.CIAID AND MOV.LOCID=ALM.LOCID AND MOV.TINID=ALM.TINID) '+
    'LEFT JOIN TGE152 TIN   ON ( MOV.TINID=TIN.TINID AND MOV.CIAID=TIN.CIAID) '+
    'LEFT JOIN TGE131 GRA   ON ( MOV.GRARID=GRA.GRARID AND MOV.TINID=GRA.TINID) '+
    'WHERE MOV.USUARIO='''+DM1.wUsuario+''' ';
   sTOTAL:=sTOTAL+' UNION ALL ';
  end;
   sSQL := 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, MOV.NISAFREG, MOV.KDXHREG, MOV.TDAID, DOC.TDAABR, DOC.TDATIP, '+
          'MOV.ARTFUC, MOV.ARTID, ART.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, '+
          'MOV.NISAID, MOV.NISATIP, 0.00 SALDOG, 0.00 SALDOU, 0.00 MONTOG, 0.00 MONTOU, MOV.ARTPCG, MOV.ARTPCU, '+
          'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (-1*MOV.KDXCNTG) END AS KDXCNTG, '+
          'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (-1*MOV.KDXCNTU) END AS KDXCNTU, '+
          'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (0.00) END AS KDXCNTGI, '+
          'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (0.00) END AS KDXCNTUI, '+
          'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG) ELSE (0.00) END AS KDXCNTGS, '+
          'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU) ELSE (0.00) END AS KDXCNTUS, ART.ARTCPROG, ART.ARTCPROU, '+
          'MOV.KDXCNTG * MOV.ARTPCG KDXCPROGI, '+
          'MOV.KDXCNTU * MOV.ARTPCU KDXCPROUI, '+
          'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG * ART.ARTCPROG) ELSE (0.00) END AS KDXCPROGS, '+
          'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU * ART.ARTCPROU) ELSE (0.00) END AS KDXCPROUS, '+
          'ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZCNT '+
         'FROM LOG315 AS MOV '+
          'LEFT JOIN LOG323 B     ON ( B.USUARIO='''+DM1.wUsuario+''' ) '+
          'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) '+
          'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) '+
          'LEFT JOIN TGE157 DOC   ON ( MOV.TDAID=DOC.TDAID ) '+
          'LEFT JOIN TGE205 ART   ON ( MOV.ARTID=ART.ARTID AND MOV.CIAID=ART.CIAID) '+
          'LEFT JOIN TGE101 CIA   ON ( MOV.CIAID=CIA.CIAID ) '+
          'LEFT JOIN TGE126 LOC   ON ( MOV.LOCID=LOC.LOCID AND MOV.CIAID=LOC.CIAID) '+
          'LEFT JOIN TGE151 ALM   ON ( MOV.ALMID=ALM.ALMID AND MOV.CIAID=ALM.CIAID AND MOV.LOCID=ALM.LOCID AND MOV.TINID=ALM.TINID) '+
          'LEFT JOIN TGE152 TIN   ON ( MOV.TINID=TIN.TINID AND MOV.CIAID=TIN.CIAID) '+
          'LEFT JOIN TGE131 GRA   ON ( MOV.GRARID=GRA.GRARID AND MOV.TINID=GRA.TINID) '+
         'WHERE '+
          'MOV.NISAFREG>='+sDesde+' AND '+
          'MOV.NISAFREG<='+sHasta+' '+
          'AND MOV.CIAID=B.CIAID '+
          'AND MOV.LOCID=B.LOCID '+
          'AND MOV.ALMID=B.ALMID '+
          'AND MOV.TINID=B.TINID '+
          'AND MOV.ARTID=B.ARTID '+
          'ORDER BY CIAID, LOCID, ALMID, TINID, GRARID, ARTID, NISAFREG, TDATIP';
 end
 else
 if SRV_D = 'ORACLE' then
 begin
  if D > 1 then
  begin
   sTOTAL:='SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, TO_DATE('+SalIniHas+') NISAFREG, TO_CHAR(SYSDATE,''DD-MM-YYYY HH:MI:SSSSS'') KDXHREG, '+
       '''00'' TDAID, ''Saldo Inicial'' TDAABR, '''' TDATIP, MOV.ARTFUC, MOV.ARTID, MOV.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, '+
       'MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, '' '' NISAID,  '' '' NISATIP, '+
       'MOV.SALDOG + XX.TOTINGG - XX.TOTSALG SALDOG, MOV.SALDOU + XX.TOTINGU - XX.TOTSALU SALDOU, '+
       'MOV.MONTOG + XX.MTOINGG - XX.MTOSALG MONTOG, MOV.MONTOU + XX.MTOINGU - XX.MTOSALU MONTOU, '+
       '0.00 ARTPCG, 0.00 ARTPCU, 0.00 KDXCNTG, 0.00 KDXCNTU, 0.00 KDXCNTGI, 0.00 KDXCNTUI, 0.00 KDXCNTGS, 0.00 KDXCNTUS, MOV.ARTCPROG, MOV.ARTCPROU, '+
       '0.00 KDXCPROGI, 0.00 KDXCPROUI, 0.00 KDXCPROGS, 0.00 KDXCPROUS, ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, '+
       '0.00 VALORIZ, 0.00 VALORIZCNT '+
       'FROM LOG323 MOV, TGE130 UMEDG, TGE130 UMEDU, TGE101 CIA, TGE126 LOC, TGE151 ALM, TGE152 TIN, TGE131 GRA, TGE205 ART, '+
       ' (SELECT CIAID, ARTID,'+
       '  SUM(DECODE (NISATIP, ''INGRESO'', NVL(KDXCNTG,0.00), 0.00))  TOTINGG,'+
       '  SUM(DECODE (NISATIP, ''SALIDA'',  NVL(KDXCNTG,0.00), 0.00)) TOTSALG,'+
       '  SUM(DECODE (NISATIP, ''INGRESO'', NVL(KDXCNTU,0.00), 0.00)) TOTINGU,'+
       '  SUM(DECODE (NISATIP, ''SALIDA'',  NVL(KDXCNTU,0.00), 0.00)) TOTSALU,'+
       '  SUM(DECODE (NISATIP, ''INGRESO'', NVL(ARTPCG,0.00), 0.00)) MTOINGG,'+
       '  SUM(DECODE (NISATIP, ''SALIDA'',  NVL(ARTPCG,0.00), 0.00)) MTOSALG,'+
       '  SUM(DECODE (NISATIP, ''INGRESO'', NVL(ARTPCU,0.00), 0.00)) MTOINGU,'+
       '  SUM(DECODE (NISATIP, ''SALIDA'',  NVL(ARTPCU,0.00), 0.00)) MTOSALU'+
       '  FROM LOG315'+
       '  WHERE NISAFREG>=TO_DATE('+SalIniDes+')'+
       '  AND NISAFREG<=TO_DATE('+SalIniHas+')'+
       '  GROUP BY CIAID, ARTID ) XX '+
       'WHERE MOV.USUARIO='''+DM1.wUsuario+''''+
       ' AND MOV.UNMIDG=UMEDG.UNMID(+)'+
       ' AND MOV.UNMIDU=UMEDU.UNMID(+)'+
       ' AND MOV.CIAID=CIA.CIAID(+)'+
       ' AND MOV.LOCID=LOC.LOCID(+) AND MOV.CIAID=LOC.CIAID(+)'+
       ' AND MOV.ALMID=ALM.ALMID(+) AND MOV.CIAID=ALM.CIAID(+) AND MOV.LOCID=ALM.LOCID(+) AND MOV.TINID=ALM.TINID(+)'+
       ' AND MOV.TINID=TIN.TINID(+) AND MOV.CIAID=TIN.CIAID(+)'+
       ' AND MOV.GRARID=GRA.GRARID(+) AND MOV.TINID=GRA.TINID(+)'+
       ' AND MOV.ARTID=ART.ARTID(+) AND MOV.CIAID=ART.CIAID(+)'+
       ' AND MOV.ARTID=XX.ARTID  AND MOV.CIAID=XX.CIAID'+
       ' UNION ALL ';
  end
  else
  if D = 1 then
  begin
   sTOTAL:= 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, TO_DATE('+SalIniHas+') NISAFREG, TO_CHAR(SYSDATE,''DD-MM-YYYY HH:MI:SSSSS'') KDXHREG '+
    ', ''00'' TDAID, ''Saldo Inicial'' TDAABR, '' '' TDATIP, MOV.ARTFUC, MOV.ARTID, MOV.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, '+
    'MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, '' '' NISAID,  '' '' NISATIP, MOV.SALDOG, MOV.SALDOU, MOV.MONTOG, MOV.MONTOU, 0 ARTPCG, '+
    '0.00 ARTPCU, 0.00 KDXCNTG, 0.00 KDXCNTU, 0.00 KDXCNTGI, 0.00 KDXCNTUI, 0.00 KDXCNTGS, 0.00 KDXCNTUS, MOV.ARTCPROG, MOV.ARTCPROU, 0 KDXCPROGI, '+
    '0.00 KDXCPROUI, 0.00 KDXCPROGS, 0.00 KDXCPROUS, ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZCNT '+
    'FROM LOG323 MOV, TGE130 UMEDG, TGE130 UMEDU, TGE205 ART, TGE101 CIA, TGE126 LOC, TGE151 ALM, TGE152 TIN, TGE131 GRA '+
    'WHERE MOV.USUARIO='''+DM1.wUsuario+''' '+
    'AND MOV.UNMIDG=UMEDG.UNMID(+) '+
    'AND MOV.UNMIDU=UMEDU.UNMID(+) '+
    'AND MOV.ARTID=ART.ARTID(+) AND MOV.CIAID=ART.CIAID(+) '+
    'AND MOV.CIAID=CIA.CIAID(+) '+
    'AND MOV.LOCID=LOC.LOCID(+) AND MOV.CIAID=LOC.CIAID(+) '+
    'AND MOV.ALMID=ALM.ALMID(+) AND MOV.CIAID=ALM.CIAID(+) AND MOV.LOCID=ALM.LOCID(+) AND MOV.TINID=ALM.TINID(+) '+
    'AND MOV.TINID=TIN.TINID(+) AND MOV.CIAID=TIN.CIAID(+) '+
    'AND MOV.GRARID=GRA.GRARID(+) AND MOV.TINID=GRA.TINID(+)'+
    ' UNION ALL ';
  end;
  sSQL:= 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, MOV.NISAFREG,TO_CHAR(MOV.KDXHREG,''DD-MM-YYYY HH:MI:SSSSS'') KDXHREG, MOV.TDAID, DOC.TDAABR, '+
   'DOC.TDATIP, MOV.ARTFUC, MOV.ARTID, ART.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, '+
   'MOV.NISAID, MOV.NISATIP, 0.00 SALDOG, 0.00 SALDOU, 0.00 MONTOG, 0.00 MONTOU, MOV.ARTPCG, MOV.ARTPCU, '+
   'DECODE (MOV.NISATIP, ''INGRESO'', MOV.KDXCNTG, -1*MOV.KDXCNTG) KDXCNTG, '+
   'DECODE (MOV.NISATIP, ''INGRESO'', MOV.KDXCNTU, -1*MOV.KDXCNTU) KDXCNTU, '+
   'DECODE (MOV.NISATIP, ''INGRESO'', MOV.KDXCNTG, 0.00 ) KDXCNTGI, '+
   'DECODE (MOV.NISATIP, ''INGRESO'', MOV.KDXCNTU, 0.00 ) KDXCNTUI, '+
   'DECODE (MOV.NISATIP, ''SALIDA'', MOV.KDXCNTG, 0.00) KDXCNTGS, '+
   'DECODE (MOV.NISATIP, ''SALIDA'', MOV.KDXCNTU, 0.00) KDXCNTUS, ART.ARTCPROG, ART.ARTCPROU, '+
   'MOV.KDXCNTG * MOV.ARTPCG KDXCPROGI, MOV.KDXCNTU * MOV.ARTPCU KDXCPROUI, '+
   'DECODE (MOV.NISATIP, ''SALIDA'', MOV.KDXCNTG * ART.ARTCPROG, 0.00) KDXCPROGS, '+
   'DECODE (MOV.NISATIP, ''SALIDA'', MOV.KDXCNTU * ART.ARTCPROU, 0.00) KDXCPROUS, '+
   'ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZCNT '+
   'FROM LOG315 MOV, LOG323 B, TGE130 UMEDG, TGE130 UMEDU, TGE157 DOC, TGE205 ART, TGE101 CIA, TGE126 LOC, TGE151 ALM, TGE152 TIN, TGE131 GRA '+
   'WHERE MOV.NISAFREG>=TO_DATE('+sDesde+') '+
   'AND MOV.NISAFREG<=TO_DATE('+sHasta+') '+
   'AND MOV.CIAID=B.CIAID'+
   'AND MOV.LOCID=B.LOCID'+
   'AND MOV.ALMID=B.ALMID'+
   'AND MOV.TINID=B.TINID'+
   'AND MOV.ARTID=B.ARTID'+
   'AND B.USUARIO='''+DM1.wUsuario+''''+
   'AND MOV.UNMIDG=UMEDG.UNMID(+)'+
   'AND MOV.UNMIDU=UMEDU.UNMID(+)'+
   'AND MOV.TDAID=DOC.TDAID(+)'+
   'AND MOV.ARTID=ART.ARTID(+) AND MOV.CIAID=ART.CIAID(+)'+
   'AND MOV.CIAID=CIA.CIAID(+)'+
   'AND MOV.LOCID=LOC.LOCID(+) AND MOV.CIAID=LOC.CIAID(+)'+
   'AND MOV.ALMID=ALM.ALMID(+) AND MOV.CIAID=ALM.CIAID(+) AND MOV.LOCID=ALM.LOCID(+) AND MOV.TINID=ALM.TINID(+)'+
   'AND MOV.TINID=TIN.TINID(+) AND MOV.CIAID=TIN.CIAID(+)'+
   'AND MOV.GRARID=GRA.GRARID(+) AND MOV.TINID=GRA.TINID(+)'+
   'ORDER BY CIAID, LOCID, ALMID, TINID, GRARID, ARTID, NISAFREG, TDATIP';
 end;

  if rgTipoStocValo.ItemIndex = 0 then
    ppLabel49.Caption := 'KARDEX DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date)
  else
    ppLabel49.Caption := 'KARDEX VALORIZADO DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);
 sTOTAL:=sTOTAL+sSQL;
 dm1.cdsReporte.Close;
 dm1.cdsReporte.DataRequest(sTOTAL);
 dm1.cdsReporte.Open;

 if rgTipoStocValo.ItemIndex = 0 then					// Cantidades
 begin
  dm1.cdsReporte.First;
  while not dm1.cdsReporte.Eof do
  begin
   xSalIni :=dm1.cdsReporte.FieldByName('KDXCNTG').AsFloat +
        dm1.cdsReporte.FieldByName('SALDOG').AsFloat +
        dm1.cdsReporte.FieldByName('KDXCNTU').AsFloat +
        dm1.cdsReporte.FieldByName('SALDOU').AsFloat;
   dm1.cdsReporte.Edit;
   dm1.cdsReporte.FieldByName('VALORIZCNT').AsFloat:=xSalIni;
   dm1.cdsReporte.Post;
   dm1.cdsReporte.Next;
   while (not dm1.cdsReporte.Eof) and
      (dm1.cdsReporte.FieldByName('TDAID').AsString <> '00') do
   begin
    if Trim(dm1.cdsReporte.FieldByName('TDATIP').AsString) = 'INGRESO' then
    begin
     xSalIni:=xSalIni + (dm1.cdsReporte.FieldByName('KDXCNTG').AsFloat+(dm1.cdsReporte.FieldByName('KDXCNTU').AsFloat/dm1.cdsReporte.FieldByName('ARTCONT').AsFloat));
     dm1.cdsReporte.Edit;
     dm1.cdsReporte.FieldByName('VALORIZCNT').AsFloat:=xSalIni;
     dm1.cdsReporte.Post;
    end
    else
    begin
     xSalIni:=xSalIni + (dm1.cdsReporte.FieldByName('KDXCNTG').AsFloat+(dm1.cdsReporte.FieldByName('KDXCNTU').AsFloat/dm1.cdsReporte.FieldByName('ARTCONT').AsFloat));
     dm1.cdsReporte.Edit;
     dm1.cdsReporte.FieldByName('VALORIZCNT').AsFloat:=xSalIni;
     dm1.cdsReporte.Post;
    end;
    dm1.cdsReporte.Next;
   end;
  end;
 end
 else
 if rgTipoStocValo.ItemIndex = 1 then
 begin
  dm1.cdsReporte.First;
  while not dm1.cdsReporte.Eof do
  begin
   xSalIni := dm1.cdsReporte.FieldByName('KDXCPROGI').AsFloat+dm1.cdsReporte.FieldByName('MONTOG').AsFloat+dm1.cdsReporte.FieldByName('KDXCPROUI').AsFloat+dm1.cdsReporte.FieldByName('MONTOU').AsFloat;
   dm1.cdsReporte.Edit;
   dm1.cdsReporte.FieldByName('VALORIZ').AsFloat:=xSalIni;
   dm1.cdsReporte.Post;
   dm1.cdsReporte.Next;
   while (not dm1.cdsReporte.Eof) and
      (dm1.cdsReporte.FieldByName('TDAID').AsString <> '00') do
   begin
    if Trim(dm1.cdsReporte.FieldByName('TDATIP').AsString) = 'INGRESO' then
    begin
     xSalIni:=xSalIni + (dm1.cdsReporte.FieldByName('KDXCPROGI').AsFloat+dm1.cdsReporte.FieldByName('KDXCPROUI').AsFloat);
     dm1.cdsReporte.Edit;
     dm1.cdsReporte.FieldByName('VALORIZ').AsFloat:=xSalIni;
     dm1.cdsReporte.Post;
    end
    else
    begin
     xSalIni:=xSalIni - (dm1.cdsReporte.FieldByName('KDXCPROGI').AsFloat+dm1.cdsReporte.FieldByName('KDXCPROUI').AsFloat);
     dm1.cdsReporte.Edit;
     dm1.cdsReporte.FieldByName('VALORIZ').AsFloat:=xSalIni;
     dm1.cdsReporte.Post;
    end;
    dm1.cdsReporte.Next;
   end;
  end;
 end;
 Screen.Cursor:=crDefault;
 if dm1.cdsReporte.recordCount = 0 then
 begin
  ShowMessage('Error, No Existen Registros para esta Consulta');
  dm1.cdsReporte.Close;
  exit;
 end;
 pprDetalle.Print;
 Screen.Cursor:=crHourGlass;
 pprDetalle.Stop;

 xSQL:='DELETE FROM LOG323 WHERE USUARIO='''+DM1.wUsuario+'''';
 try
  DM1.DCOM1.AppServer.EjecutaQry(xSQL);
 Except

 end;
 Screen.Cursor:=crDefault;
end;

}

End.

