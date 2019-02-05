Unit ALM413;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ComCtrls, StdCtrls, ExtCtrls, Db, DBTables, ppDB, ppDBPipe,
   ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
   ppProd, ppReport, ppViewr, ppStrtch, ppSubRpt, ppEndUsr, ppTypes,
   Mask, wwdbedit, wwdblook, MsgDlgs;

Type
   TFToolCCosto = Class(TForm)
      ppdbMovi: TppDBPipeline;
      pnlTool: TPanel;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      pprCtblCCosto: TppReport;
      rdgSelecc: TRadioGroup;
      Z1sbActFiltro: TBitBtn;
      Z1sbCCosto: TBitBtn;
      pprResCCosto: TppReport;
      Z2bbtnResKdxVal: TBitBtn;
      Z2bbtnResSalCCosto: TBitBtn;
      pprlCCosto: TppReport;
      Z2bbtnResCtaCCosto: TBitBtn;
      pprCuentaCosto: TppReport;
      ppHeaderBand3: TppHeaderBand;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel44: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppLabel45: TppLabel;
      ppSystemVariable8: TppSystemVariable;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppFooterBand3: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppLabel56: TppLabel;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppLabel51: TppLabel;
      ppDBText35: TppDBText;
      ppLabel52: TppLabel;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppDBText36: TppDBText;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppLabel55: TppLabel;
      ppHeaderBand2: TppHeaderBand;
      ppLabel2: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel3: TppLabel;
      ppLabel6: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel12: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel13: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel20: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand3: TppSummaryBand;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppLabel73: TppLabel;
      ppGroup6: TppGroup;
      ppGroupHeaderBand6: TppGroupHeaderBand;
      ppLabel22: TppLabel;
      ppDBText28: TppDBText;
      ppLabel23: TppLabel;
      ppGroupFooterBand6: TppGroupFooterBand;
      ppGroup7: TppGroup;
      ppGroupHeaderBand7: TppGroupHeaderBand;
      ppDBText16: TppDBText;
      ppLabel1: TppLabel;
      ppLabel21: TppLabel;
      ppGroupFooterBand7: TppGroupFooterBand;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppDBText29: TppDBText;
      ppLabel25: TppLabel;
      ppLabel74: TppLabel;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppLabel7: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppLabel24: TppLabel;
      ppHeaderBand4: TppHeaderBand;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppLabel59: TppLabel;
      ppLabel60: TppLabel;
      ppLabel61: TppLabel;
      ppLabel62: TppLabel;
      ppSystemVariable9: TppSystemVariable;
      ppLabel63: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppLabel64: TppLabel;
      ppSystemVariable11: TppSystemVariable;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLabel65: TppLabel;
      ppLabel66: TppLabel;
      ppLabel67: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText37: TppDBText;
      ppDBText38: TppDBText;
      ppDBText39: TppDBText;
      ppFooterBand4: TppFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppLabel68: TppLabel;
      ppDBText40: TppDBText;
      ppLabel69: TppLabel;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppLabel70: TppLabel;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      pplblCtaHaber: TppLabel;
      ppGroup9: TppGroup;
      ppGroupHeaderBand9: TppGroupHeaderBand;
      ppDBText42: TppDBText;
      ppLabel72: TppLabel;
      ppGroupFooterBand9: TppGroupFooterBand;
      ppHeaderBand1: TppHeaderBand;
      ppDBText1: TppDBText;
      ppLabel16: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppLabel19: TppLabel;
      ppLabel26: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel27: TppLabel;
      ppDBText32: TppDBText;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLabel29: TppLabel;
      ppLabel34: TppLabel;
      ppLPeridodo: TppLabel;
      ppLabel32: TppLabel;
      ppLabel71: TppLabel;
      ppLabel30: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText41: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand2: TppSummaryBand;
      ppDBCalc5: TppDBCalc;
      ppLabel33: TppLabel;
      ppLine9: TppLine;
      ppDBCalc15: TppDBCalc;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText2: TppDBText;
      ppLabel28: TppLabel;
      ppDBText3: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel31: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      Diseno: TppDesigner;
      Timer1: TTimer;
      lblTransacc: TLabel;
      dblcTransac: TwwDBLookupCombo;
      dbeTransac: TwwDBEdit;
      ppDBText8: TppDBText;
      Procedure FormCreate(Sender: TObject);
      Procedure Z1sbCCostoClick(Sender: TObject);
      Procedure Z1sbActFiltroClick(Sender: TObject);
      Procedure pprCtblCCostoPreviewFormCreate(Sender: TObject);
      Procedure ppGroupHeaderBand5BeforePrint(Sender: TObject);
      Procedure ppGroupHeaderBand6BeforePrint(Sender: TObject);
      Procedure ppLabel24Print(Sender: TObject);
      Procedure Z2bbtnResKdxValClick(Sender: TObject);
      Procedure pprResCCostoPreviewFormCreate(Sender: TObject);
      Procedure pprlCCostoPreviewFormCreate(Sender: TObject);
      Procedure Z2bbtnResSalCCostoClick(Sender: TObject);
      Procedure ppGroupHeaderBand3BeforePrint(Sender: TObject);
      Procedure Z2bbtnResCtaCCostoClick(Sender: TObject);
      Procedure pprCuentaCostoPreviewFormCreate(Sender: TObject);
      Procedure ppGroupHeaderBand4BeforePrint(Sender: TObject);
      Procedure ppGroupFooterBand4BeforePrint(Sender: TObject);
      Procedure ppGroupHeaderBand7BeforePrint(Sender: TObject);
      Procedure ppGroupHeaderBand9BeforePrint(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure dblcTransacExit(Sender: TObject);
      Procedure dblcTransacEnter(Sender: TObject);
      Procedure dblcTransacNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolCCosto: TFToolCCosto;
   xAccesoBotones: Boolean;

Implementation

Uses ALMDM1, ALM411, oaIN4000;

{$R *.DFM}

Procedure TFToolCCosto.FormCreate(Sender: TObject);
Begin
   dtpHasta.Date := Date;
End;

Procedure TFToolCCosto.Z1sbCCostoClick(Sender: TObject);
Var
   xSQL, xWhere, sSQL: String;
   iX, iY, iZ: integer;
   sDesde, sHasta: String;
Begin
   If dtpDesde.Date > dtpHasta.Date Then
   Begin
      ErrorMsg(Caption, ' La Fecha Hasta no puede ser Menor a la Fecha Desde');
      Exit;
   End;
   Screen.Cursor := crHourGlass;

   xWhere := '';
  // vhndema
   xSQL := Copy(Mtx4000.FMant.SQL, pos('SOLVISTA', Mtx4000.FMant.SQL), Length(Mtx4000.FMant.SQL));

   For iX := 0 To Length(xsql) Do
   Begin
      If copy(xSQL, iX, 5) = 'WHERE' Then
      Begin
         xWhere := copy(xSQL, iX + 6, length(xSQL));
         break;
      End;
   End;
   For iY := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iY, 8) = 'ORDER BY' Then
      Begin
         xWhere := copy(xWhere, 1, iY - 2);
         break;
      End;
   End;
   For iZ := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iZ, 8) = 'GROUP BY' Then
      Begin
         xWhere := copy(xWhere, 1, iZ - 2);
         break;
      End;
   End;

   sSQL := 'SELECT CIAID, LOCID, TINID, ALMID, CCOSID, ARTID, ' +
      'NISAID, NISANDOC, NISAFREG, CUENTAID, ' +
      'KDXCNTG, KDXPEDIDOG, ARTPCG,  KDXCNTG * ARTPCG IMPG, ' +
      'KDXCNTU, KDXPEDIDOU, ARTPCU,  KDXCNTU * ARTPCU IMPU, ' +
      'ARTDES ';
   If dbeTransac.text <> '' Then
      sSQL := sSQL + ', ''Transacción : ' + dbeTransac.text + ''' TRANSAC '
   Else
      sSQL := sSQL + ', '' '' TRANSAC ';

   sSQL := sSQL + 'FROM LOG315 WHERE ';

   If Length(xWhere) > 0 Then
      sSQL := sSQL + xWhere + ' and ';

  // vhndema
   sSQL := sSQL + DMALM.wReplacCeros + '(CCOSID,''VACIO'')<>''VACIO'' and NISATIP=''SALIDA'' ';
   sSQL := sSQL + ' AND NISSIT=''ACEPTADO'' ';
   sDesde := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));
   sSQL := sSQL + 'AND NISAFREG>=' + sDesde + ' ';
   sSQL := sSQL + 'AND NISAFREG<=' + sHasta + ' ';

   If dblcTransac.Text <> '' Then
      sSQL := sSQL + 'AND TRIID=''' + dblcTransac.Text + ''' ';

   sSQL := sSQL + ' ORDER BY CIAID, LOCID, TINID, ALMID, CCOSID, ARTID';
  // END VHNDEMA

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Error, No Existen Registros para esta Consulta');
      DMALM.cdsReporte.Close;
      exit;
   End;

   pprlCCosto.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RptCCosto.rtm';
   pprlCCosto.template.LoadFromFile;

   ppLabel42.Caption := 'DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);

   xSQL := 'CIAID=' + QuotedStr(DMALM.cdsReporte.FieldByName('CIAID').AsString);
   ppLabel40.Caption := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', xSQL, 'CIADES');

   Screen.Cursor := crDefault;
   pprlCCosto.Print;
   pprlCCosto.Stop;
End;

Procedure TFToolCCosto.Z1sbActFiltroClick(Sender: TObject);
Var
   xSQL, SalCCoDes, SalCCoHas: String;
Begin
   SalCCoDes := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime));
   SalCCoHas := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));
   xSQL := '(NISAFREG>=' + SalCCoDes + ' AND NISAFREG<=' + SalCCoHas + ')';
   If dblcTransac.Text <> '' Then
      xSQL := xSQL + ' AND TRIID=''' + dblcTransac.Text + ''' ';

   Mtx4000.SetFilter(xSQL);
   Mtx4000.RefreshFilter;
End;

Procedure TFToolCCosto.pprCtblCCostoPreviewFormCreate(Sender: TObject);
Begin
   pprCtblCCosto.PreviewForm.ClientHeight := 500;
   pprCtblCCosto.PreviewForm.ClientWidth := 650;
   TppViewer(pprCtblCCosto.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolCCosto.ppGroupHeaderBand5BeforePrint(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + QuotedStr(DMALM.cdsReporte.FieldByName('CIAID').AsString) + 'AND CUENTAID=' + QuotedStr(ppDBText29.Text);
   ppLabel74.Text := DMALM.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', sSQL, 'CTADES');
End;

Procedure TFToolCCosto.ppGroupHeaderBand6BeforePrint(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'ALMID=' + QuotedStr(ppDBText35.Text);
   ppLabel23.Text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', sSQL, 'ALMDES');
End;

Procedure TFToolCCosto.ppLabel24Print(Sender: TObject);
Begin
   ppLabel24.Text := FloattoStr(strtoFloat(ppDBCalc2.Text) + StrtoFloat(ppDBCalc3.Text));
End;

{
SALIDA RESUMIDO POR CENTRO DE COSTO Y LINEA
SELECT CIAID, LOCID, TINID, ALMID, CCOSID, GRARID, COUNT(*) CONTA, SUM(KDXPEDIDOG * ARTPCG) VALG, SUM(KDXPEDIDOU * ARTPCU) VALU
FROM LOG315
WHERE NISATIP ='SALIDA'
GROUP BY CIAID, LOCID, TINID, ALMID, CCOSID, GRARID
ORDER BY CIAID, LOCID, TINID, ALMID, CCOSID, GRARID

SALIDA RESUMIDO POR CENTRO DE COSTO Y LINEA
SELECT CIAID, LOCID, TINID, ALMID, CCOSID, GRARID, COUNT(*) CONTA, SUM(KDXPEDIDOG * ARTPCG) VALG, SUM(KDXPEDIDOU * ARTPCU) VALU
FROM LOG315
WHERE NISATIP ='INGRESO'
GROUP BY CIAID, LOCID, TINID, ALMID, CCOSID, GRARID
ORDER BY CIAID, LOCID, TINID, ALMID, CCOSID, GRARID

}

Procedure TFToolCCosto.Z2bbtnResKdxValClick(Sender: TObject);
Var
   xSQL, xWhere, sSQL: String;
   iX, iY, iZ: integer;
Begin
   If dtpDesde.Date > dtpHasta.Date Then
   Begin
      ErrorMsg(Caption, ' La Fecha Hasta no puede ser Menor a la Fecha Desde');
      Exit;
   End;
   Screen.Cursor := crHourGlass;

   xWhere := '';
   xSQL := Mtx4000.FMant.SQL;
   For iX := 0 To Length(xsql) Do
   Begin
      If copy(xSQL, iX, 5) = 'WHERE' Then
      Begin
         xWhere := copy(xSQL, iX + 6, length(xSQL));
         break;
      End;
   End;
   For iY := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iY, 8) = 'ORDER BY' Then
      Begin
         xWhere := copy(xWhere, 1, iY - 2);
         break;
      End;
   End;
   For iZ := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iZ, 8) = 'GROUP BY' Then
      Begin
         xWhere := copy(xWhere, 1, iZ - 2);
         break;
      End;
   End;

   sSQL := 'SELECT CIAID, LOCID, TINID, ALMID, CCOSID, ARTID, ' +
      'NISAID, NISANDOC, NISAFREG, CUENTAID, ' +
      'KDXCNTG, KDXPEDIDOG, ARTPCG,  KDXCNTG * ARTPCG IMPG, ' +
      'KDXCNTU, KDXPEDIDOU, ARTPCU,  KDXCNTU * ARTPCU IMPU, ' +
      'ARTDES FROM LOG315 ';
   If Length(xWhere) > 0 Then
      sSQL := sSQL + 'WHERE ' + xWhere + ' AND ' + DMALM.wReplacCeros + '(CCOSID,''VACIO'')<>''VACIO'' '
   Else
      sSQL := sSQL + 'WHERE ' + DMALM.wReplacCeros + '(CCOSID,''VACIO'')<>''VACIO'' ';
   sSQL := sSQL + ' ORDER BY CIAID, LOCID, TINID, ALMID, CCOSID, CUENTAID, ARTID';

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Error, No Existen Registros para esta Consulta');
      DMALM.cdsReporte.Close;
      exit;
   End;

   pprCtblCCosto.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RptCtblCCosto.rtm';
   pprCtblCCosto.Template.LoadFromFile;

   ppLabel10.Caption := 'DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);

   xSQL := 'CIAID=' + QuotedStr(DMALM.cdsReporte.FieldByName('CIAID').AsString);
   ppLabel8.Caption := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', xSQL, 'CIADES');

   Screen.Cursor := crDefault;
   pprCtblCCosto.Print;
   pprCtblCCosto.Stop;
End;

Procedure TFToolCCosto.pprResCCostoPreviewFormCreate(Sender: TObject);
Begin
   pprResCCosto.PreviewForm.ClientHeight := 500;
   pprResCCosto.PreviewForm.ClientWidth := 650;
   TppViewer(pprResCCosto.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolCCosto.pprlCCostoPreviewFormCreate(Sender: TObject);
Begin
   pprlCCosto.PreviewForm.ClientHeight := 500;
   pprlCCosto.PreviewForm.ClientWidth := 650;
   TppViewer(pprlCCosto.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolCCosto.Z2bbtnResSalCCostoClick(Sender: TObject);
Var
   sDesde, sHasta, sSQL: String;
Begin
   Screen.Cursor := crHourGlass;
   sDesde := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));
   sSQL := 'SELECT A.CIAID, A.LOCID, A.TINID, A.ALMID, A.CCOSID, A.GRARID, COUNT(*) CONTA, ';
   sSQL := sSQL + 'trunc(SUM(KDXCNTG * A.ARTPCG),4) VALG, ';
   sSQL := sSQL + 'trunc(SUM(KDXCNTU * A.ARTPCU),4) VALU,  ';
   sSQL := sSQL + 'C.CUENTAID, C.GRARDES, E.ALMDES, D.CIADES, F.CCOSDES ';
   sSQL := sSQL + 'FROM LOG315 A, TGE205 B, TGE131 C, TGE101 D, TGE151 E, TGE203 F ';
   sSQL := sSQL + 'WHERE NISATIP =''SALIDA'' ';
   sSQL := sSQL + 'AND A.NISAFREG>=to_date(' + sDesde + ') ';
   sSQL := sSQL + 'AND A.NISAFREG<=TO_DATE(' + sHasta + ') ';
   sSQL := sSQL + 'AND A.ARTID =B.ARTID(+)  AND A.CIAID=B.CIAID(+) ';
   sSQL := sSQL + 'AND A.CIAID=C.CIAID(+) AND A.GRARID=C.GRARID(+) AND A.TINID=C.TINID(+) ';
   sSQL := sSQL + 'AND A.CIAID =D.CIAID(+) ';
   sSQL := sSQL + 'AND A.ALMID =E.ALMID(+) AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) ';
   sSQL := sSQL + 'AND A.CCOSID=F.CCOSID(+) ';
   sSQL := sSQL + 'AND ' + DMALM.wReplacCeros + '(A.CCOSID,''VACIO'')<>''VACIO'' ';
   sSQL := sSQL + 'GROUP BY A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID, A.CCOSID, E.ALMDES, D.CIADES, C.CUENTAID, C.GRARDES, F.CCOSDES ';
   sSQL := sSQL + 'ORDER BY CIAID, LOCID, TINID, ALMID, CCOSID, GRARID';

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ErrorMsg(Caption, 'No Existe Información a Mostrar');
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   pprResCCosto.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResCCosto.rtm';
   pprResCCosto.Template.LoadFromFile;

   ppLPeridodo.Caption := datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);

   Screen.Cursor := crDefault;
   pprResCCosto.Print;
   pprResCCosto.Stop;
End;

Procedure TFToolCCosto.ppGroupHeaderBand3BeforePrint(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'CCOSID=' + QuotedStr(ppDBText36.Text);
   ppLabel54.Text := DMALM.DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', sSQL, 'CCOSDES');
End;

Procedure TFToolCCosto.Z2bbtnResCtaCCostoClick(Sender: TObject);
Var
   xSQL, xWhere, sSQL: String;
   iX, iY, iZ: integer;
Begin
   If dtpDesde.Date > dtpHasta.Date Then
   Begin
      ErrorMsg(Caption, ' La Fecha Hasta no puede ser Menor a la Fecha Desde');
      Exit;
   End;
   Screen.Cursor := crHourGlass;

   xWhere := '';
   xSQL := Mtx4000.FMant.SQL;
   For iX := 0 To Length(xsql) Do
   Begin
      If copy(xSQL, iX, 5) = 'WHERE' Then
      Begin
         xWhere := copy(xSQL, iX + 6, length(xSQL));
         break;
      End;
   End;
   For iY := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iY, 8) = 'ORDER BY' Then
      Begin
         xWhere := copy(xWhere, 1, iY - 2);
         break;
      End;
   End;
   For iZ := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iZ, 8) = 'GROUP BY' Then
      Begin
         xWhere := copy(xWhere, 1, iZ - 2);
         break;
      End;
   End;

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'SELECT LOG315.CIAID, LOCID, LOG315.TINID, ALMID, C.CUENTAID, LOG315.CCOSID, D.TINDES, ' +
         'SUM(CASE WHEN KDXCNTG<>0 THEN (KDXCNTG * ARTPCG) ELSE (KDXCNTU * ARTPCU) END) AS DEBE, 0 HABER, R.CCOSDES ' +
         'FROM LOG315 ' +
         'LEFT JOIN TGE203 R ON (LOG315.CCOSID=R.CCOSID) ' +
         'LEFT JOIN TGE152 D ON (LOG315.CIAID=D.CIAID AND LOG315.TINID=D.TINID) ' +
         'LEFT JOIN TGE131 C ON (LOG315.CIAID=C.CIAID AND LOG315.TINID=C.TINID AND LOG315.GRARID=C.GRARID)';
      If Length(xWhere) > 0 Then
         sSQL := sSQL + ' WHERE ' + xWhere + ' AND (COALESCE(LOG315.CCOSID,''VACIO'')<>''VACIO'' OR LOG315.CCOSID='''')'
      Else
         sSQL := sSQL + ' WHERE COALESCE(LOG315.CCOSID,''VACIO'')<>''VACIO'' AND LOG315.CCOSID=''''';
      sSQL := sSQL + ' GROUP BY LOG315.CIAID, LOCID, LOG315.TINID, ALMID, C.CUENTAID, LOG315.CCOSID, R.CCOSDES, D.TINDES ' +
         'UNION ALL ' +
         'SELECT LOG315.CIAID, LOCID, LOG315.TINID, ALMID, C.CUENTAHAB CUENTAID, '''' CCOSID, D.TINDES, ' +
         '0 DEBE, SUM(CASE WHEN KDXCNTG<>0 THEN (KDXCNTG * ARTPCG) ELSE (KDXCNTU * ARTPCU) END) AS HABER, '''' CCOSDES ' +
         'FROM LOG315 ' +
         'LEFT JOIN TGE152 D ON (LOG315.CIAID=D.CIAID AND LOG315.TINID=D.TINID) ' +
         'LEFT JOIN TGE131 C ON (LOG315.CIAID=C.CIAID AND LOG315.TINID=C.TINID AND LOG315.GRARID=C.GRARID)';
      If Length(xWhere) > 0 Then
         sSQL := sSQL + ' WHERE ' + xWhere + ' AND (COALESCE(LOG315.CCOSID,''VACIO'')<>''VACIO'' OR LOG315.CCOSID='''')'
      Else
         sSQL := sSQL + ' WHERE COALESCE(LOG315.CCOSID,''VACIO'')<>''VACIO'' AND LOG315.CCOSID=''''';
      sSQL := sSQL + ' GROUP BY LOG315.CIAID, LOCID, LOG315.TINID, ALMID, C.CUENTAHAB, D.TINDES ' +
         'ORDER BY CIAID, LOCID, TINID, ALMID, CUENTAID, CCOSID DESC';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'SELECT A.CIAID, A.LOCID, A.TINID, A.ALMID, C.CUENTAID, A.CCOSID, SUM(DECODE(A.KDXCNTG,0,(A.KDXCNTU * A.ARTPCU),(A.KDXCNTG * A.ARTPCG))) AS DEBE, 0 HABER, R.CCOSDES, D.TINDES ' +
            'FROM LOG315 A, TGE203 R, TGE131 C, TGE152 D ' +
            'WHERE A.CCOSID=R.CCOSID(+) ' +
            'AND A.NISATIP =''SALIDA'' ' +
            'AND A.CIAID=C.CIAID ' +
            'AND A.TINID=C.TINID ' +
            'AND A.GRARID=C.GRARID ' +
            'AND A.CIAID=D.CIAID ' +
            'AND A.TINID=D.TINID ' +
            'AND NVL(A.CCOSID,''VACIO'')<>''VACIO''';
         If Length(xWhere) > 0 Then
            sSQL := sSQL + ' AND ' + xWhere;
         sSQL := sSQL + ' GROUP BY A.CIAID, A.LOCID, A.TINID, A.ALMID, C.CUENTAID, A.CCOSID, R.CCOSDES, D.TINDES ' +
            'UNION ALL ' +
            'SELECT A.CIAID, A.LOCID, A.TINID, A.ALMID, C.CUENTAHAB CUENTAID, '''' CCOSID,  0 DEBE, ' +
            'SUM(DECODE(A.KDXCNTG,0,(A.KDXCNTU * A.ARTPCU),(A.KDXCNTG * A.ARTPCG))) AS HABER, '''' CCOSDES, D.TINDES ' +
            'FROM LOG315 A, TGE131 C, TGE152 D ' +
            'WHERE A.NISATIP =''SALIDA'' ' +
            'AND A.CIAID=C.CIAID ' +
            'AND A.TINID=C.TINID ' +
            'AND A.GRARID=C.GRARID ' +
            'AND A.CIAID=D.CIAID ' +
            'AND A.TINID=D.TINID ' +
            'AND NVL(A.CCOSID,''VACIO'')<>''VACIO''';
         If Length(xWhere) > 0 Then
            sSQL := sSQL + ' AND ' + xWhere;
         sSQL := sSQL + ' GROUP BY A.CIAID, A.LOCID, A.TINID, A.ALMID, C.CUENTAHAB, D.TINDES ' +
            'ORDER BY CIAID, LOCID, TINID, ALMID, CUENTAID, CCOSID DESC';

    {sSQL:='SELECT A.CIAID, A.LOCID, A.TINID, A.ALMID, C.CUENTAID, C.CUENTAHAB, A.CCOSID, '+
          'SUM(DECODE(A.KDXCNTG,0,(A.KDXCNTU * A.ARTPCU),(A.KDXCNTG * A.ARTPCG))) AS DEBE, R.CCOSDES '+
          'FROM LOG315 A, TGE203 R, TGE131 C '+
          'WHERE A.CCOSID=R.CCOSID(+) '+
          'AND A.NISATIP =''SALIDA'' '+
          'AND A.CIAID=C.CIAID '+
          'AND A.TINID=C.TINID '+
          'AND A.GRARID=C.GRARID ';
   if Length(xWhere) > 0 then
    sSQL:=sSQL+' AND '+xWhere;
    sSQL:=sSQL+' GROUP BY A.CIAID, A.LOCID, A.TINID, A.ALMID, C.CUENTAID, C.CUENTAHAB, A.CCOSID, R.CCOSDES ';
   sSQL:=sSQL+'ORDER BY A.CIAID, A.LOCID, A.TINID, A.ALMID, C.CUENTAID, CCOSID';}

  {sSQL:='SELECT LOG315.CIAID, LOCID, TINID, ALMID, LOG315.CUENTAID, LOG315.CCOSID, '+
        'SUM(DECODE(KDXCNTG,0,(KDXPEDIDOU * ARTPCU),(KDXPEDIDOG * ARTPCG))) AS DEBE, R.CCOSDES '+
        'FROM LOG315, TGE203 R '+
        'WHERE (LOG315.CCOSID=R.CCOSID(+)) ';
 if Length(xWhere) > 0 then
  sSQL:=sSQL+' AND '+xWhere;
  sSQL:=sSQL+' GROUP BY LOG315.CIAID, LOCID, TINID, ALMID, LOG315.CUENTAID, LOG315.CCOSID, R.CCOSDES ';
 sSQL:=sSQL+' ORDER BY LOG315.CIAID, LOCID, TINID, ALMID, CUENTAID, CCOSID';}

      End;
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Error, No Existen Registros para esta Consulta');
      DMALM.cdsReporte.Close;
      exit;
   End;

   pprCuentaCosto.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RptCuentaCosto.Rtm';
   pprCuentaCosto.Template.LoadFromFile;

   ppLabel61.Caption := 'DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);

   Screen.Cursor := crDefault;
 //Diseno.Report:=pprCuentaCosto;
 //Diseno.Show;
 //Diseno.Report:=nIL;
   pprCuentaCosto.Print;
   pprCuentaCosto.Stop;
End;

Procedure TFToolCCosto.pprCuentaCostoPreviewFormCreate(Sender: TObject);
Begin
   pprCuentaCosto.PreviewForm.ClientHeight := 500;
   pprCuentaCosto.PreviewForm.ClientWidth := 650;
   TppViewer(pprCuentaCosto.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolCCosto.ppGroupHeaderBand4BeforePrint(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'ALMID=' + QuotedStr(ppDBText40.Text);
   ppLabel69.Text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', sSQL, 'ALMDES');
End;

Procedure TFToolCCosto.ppGroupFooterBand4BeforePrint(Sender: TObject);
Begin
   pplblCtaHaber.Caption := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'CUENTAID', 'ALMID=' + quotedstr(DMALM.cdsReporte.fieldbyname('ALMID').AsString), 'CUENTAID')
End;

Procedure TFToolCCosto.ppGroupHeaderBand7BeforePrint(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'CCOSID=' + QuotedStr(ppDBText16.Text);
   ppLabel21.Text := DMALM.DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', sSQL, 'CCOSDES');
End;

Procedure TFToolCCosto.ppGroupHeaderBand9BeforePrint(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + QuotedStr(DMALM.cdsReporte.FieldByName('CIAID').AsString) + 'AND CUENTAID=' + QuotedStr(ppDBText29.Text);
   ppLabel72.Text := DMALM.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', sSQL, 'CTADES');
End;

Procedure TFToolCCosto.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolCCosto';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolCCosto);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

Procedure TFToolCCosto.dblcTransacExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'TRIID=' + quotedstr(dblcTransac.Text) + ' AND TRISGT=''S''';
   dbeTransac.Text := DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRIDES', xSQL, 'TRIDES');
End;

Procedure TFToolCCosto.dblcTransacEnter(Sender: TObject);
Var
   xSQL: String;
Begin
   If Not DMALM.cdsTRAN.Active Then
   Begin
      xSQL := 'SELECT * FROM TGE208 WHERE TRISGT=''S''';
      DMALM.cdsTRAN.Close;
      DMALM.cdsTRAN.DataRequest(xSQL);
      DMALM.cdsTRAN.Open;
   End;
End;

Procedure TFToolCCosto.dblcTransacNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

End.

