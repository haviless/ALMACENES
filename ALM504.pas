Unit ALM504;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : Alm504
//Formulario               : FContab
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Esta ventana se encarga de contabilizar masivamente las
//                           salidas de almacén.

//ACTUALIZACIONES
// Sar2011-151
// HPC_201201_ALM 23/02/2012: Se implementó una validación adicional al momento de
//                            generar los asientos contables por las Salidas de Almacén.
//                            La validación consiste en verificar la configuración de cuentas contables
//                            de los centros de costo en los casos que sea una salida hacia otra compañía.
// HPC_201309_ALM 12/12/2013
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, StdCtrls, wwdblook, DB, Buttons, ppCtrls, ppBands, ppVar,
   ppPrnabl, ppClass, ppProd, ppReport, ppEndUsr, ppComm, ppRelatv, ppCache,
   ppDB, ppDBPipe, ppViewr, Gauges, ppTypes, oaVariables, Mask, MsgDlgs;

Type
   TFContab = Class(TForm)
      pnlConta: TPanel;
      lblCia: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      dblcdPeriodo: TwwDBLookupCombo;
      Label1: TLabel;
      bbtnOk: TBitBtn;
      bbtnCancel: TBitBtn;
      ppData: TppDBPipeline;
      Diseno: TppDesigner;
      ppReporte: TppReport;
      ppHeaderBand2: TppHeaderBand;
      pplblCiades: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel4: TppLabel;
      ppLabel6: TppLabel;
      pplblTDiario: TppLabel;
      pplblDiarioDes: TppLabel;
      lblAnoMes: TppLabel;
      pplblNoCompro: TppLabel;
      ppLabel15: TppLabel;
      pplblProveedor: TppLabel;
      ppLabel43: TppLabel;
      lblMonedaDes: TppLabel;
      ppLabel48: TppLabel;
      pplblGlosaDes: TppLabel;
      ppLabel50: TppLabel;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppLabel59: TppLabel;
      ppLabel60: TppLabel;
      pplblCodProv: TppLabel;
      pplblTipoCamb: TppDBText;
      ppLabel62: TppLabel;
      ppDBText15: TppDBText;
      lblFecEmision: TppLabel;
      ppDBText16: TppDBText;
      ppLabel64: TppLabel;
      pplblDesEstado: TppLabel;
      ppLabel66: TppLabel;
      ppLabel67: TppLabel;
      ppLabel68: TppLabel;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      ppLabel71: TppLabel;
      ppLabel72: TppLabel;
      ppLabel73: TppLabel;
      pplblMontoImporte: TppLabel;
      ppLabel75: TppLabel;
      ppLabel76: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      lblTipoCamb: TppLabel;
      ppLabel78: TppLabel;
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
      ppSummaryBand2: TppSummaryBand;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLabel79: TppLabel;
      ppLabel80: TppLabel;
      ppLabel3: TppLabel;
      g: TGauge;
      lblTitulo: TLabel;
      ppValida: TppReport;
      ppdbValida: TppDBPipeline;
      bbtnAgrupado: TBitBtn;
      bbtnDetallado: TBitBtn;
      ppRepAgrupa: TppReport;
      dbpbAgrupado: TppDBPipeline;
      ppRepDetalla: TppReport;
      dbpbDetallado: TppDBPipeline;
      ppHeaderBand4: TppHeaderBand;
      pplblDCia: TppLabel;
      ppLabel5: TppLabel;
      pplblDTit: TppLabel;
      pplblDSubTit: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppSystemVariable7: TppSystemVariable;
      ppSystemVariable8: TppSystemVariable;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel30: TppLabel;
      ppLabel1: TppLabel;
      ppLabel7: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText10: TppDBText;
      ppDBText14: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppFooterBand3: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppLabel28: TppLabel;
      ppDBText32: TppDBText;
      ppLabel29: TppLabel;
      ppDBText13: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppLabel20: TppLabel;
      ppDBText33: TppDBText;
      ppHeaderBand3: TppHeaderBand;
      pplblACia: TppLabel;
      ppLabel2: TppLabel;
      pplblATit: TppLabel;
      pplblASubTit: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppLabel36: TppLabel;
      dblcTALM: TwwDBLookupCombo;
      lblAlm: TLabel;
      dbeALM: TEdit;
      Z2bbtnContab: TBitBtn;
      ppd1: TppDesigner;
      Label2: TLabel;
      BitBtn1: TBitBtn;
      ppdbSus: TppDBPipeline;
      pprSus: TppReport;
      ppHeaderBand5: TppHeaderBand;
      ppDetailBand5: TppDetailBand;
      ppFooterBand4: TppFooterBand;
      ppd2: TppDesigner;
      gbPerCnt: TGroupBox;
      meMesCNT: TMaskEdit;
      cbPer: TCheckBox;
      bbtnRepNew: TBitBtn;
      pprSusNew: TppReport;
      ppHeaderBand6: TppHeaderBand;
      ppDetailBand6: TppDetailBand;
      ppFooterBand5: TppFooterBand;
      BitBtn2: TBitBtn;
      cbDiseno: TCheckBox;
      sbDiseno: TSpeedButton;
      BitBtn3: TBitBtn;
      BitBtn4: TBitBtn;
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnCancelClick(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure ppReportePreviewFormCreate(Sender: TObject);
      Procedure bbtnAgrupadoClick(Sender: TObject);
      Procedure bbtnDetalladoClick(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure dblcdPeriodoExit(Sender: TObject);
      Procedure Z2bbtnContabClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure dblcTALMEnter(Sender: TObject);
      Procedure cbPerClick(Sender: TObject);
      Procedure bbtnRepNewClick(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure sbDisenoClick(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure BitBtn4Click(Sender: TObject);
   Private
      Procedure VerificaMovimientos(xxCia, xxAlm, xxTDiario, xxAnoMM: String);
      Function VerificaCierreContable(xxCia, xxAnoMM: String): boolean;
      Procedure GeneraContabilizacionBazar(cCia, cOrigen, cPeriodo, cNoReg: String; xForma: TForm; xTipoC: String);
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FContab: TFContab;

Implementation

Uses ALMDM1;

{$R *.DFM}

Procedure TFContab.NotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFContab.dblcCIAExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If bbtnCancel.focused Then exit;
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.text), 'CIADES');
   If length(Trim(dbeCia.text)) = 0 Then
   Begin
      dblcCIA.setFocus;
      Raise Exception.Create('Ingrese Compañía');
   End;
   FiltraTabla(DMALM.cdsAlm, 'TGE151', 'ALMID', 'ALMID', 'CIAID=' + quotedstr(dblcCIA.text) + ' AND ACTIVO=''S''');
End;

Procedure TFContab.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFContab.FormShow(Sender: TObject);
Var
   a, m, d: word;
   sSQL: String;
   sAnomes: String;
Begin
   ppdbValida.DataSource := Nil;

   FiltraTabla(DMALM.cdsCia, 'TGE101', 'CIAID', 'CIAID');
   dbeCIA.text := '';

   dblcCia.LookupTable := Nil;
   dblcCia.LookupTable := DMALM.cdsCia;

   dblcTALM.LookupTable := Nil;
   dblcTALM.LookupTable := DMALM.cdsALM;

   dblcdPeriodo.LookUpTable := Nil;
   dblcdPeriodo.LookUpField := '';

   DecodeDate(date - 35, a, m, d);
   sAnomes := DMALM.StrZero(IntToStr(a), 4) + DMALM.StrZero(IntToStr(m), 2);
   sSQL := ' SELECT * FROM TGE813 order by anomes desc';

   dblcdPeriodo.LookUpTable := DMALM.cdsQry6;
   dblcdPeriodo.LookUpField := 'ANOMES';

   DMALM.cdsQry6.Close;
   DMALM.cdsQry6.DataRequest(sSQL);
   DMALM.cdsQry6.Open;
   DMALM.cdsQry6.IndexFieldNames := 'ANOMES';
   DMALM.cdsQry6.Setkey;
   DMALM.cdsQry6.FieldByName('ANOMES').AsString := sAnoMes;
   DMALM.cdsQry6.Gotokey;

   dblcdPeriodo.text := sAnoMes;
   meMesCNT.Text := dblcdPeriodo.Text;
End;

Procedure TFContab.bbtnCancelClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFContab.bbtnOkClick(Sender: TObject);
Var
   sSQL, smes, sano, swhere, sMONABR: String;
   xxNoReg, sTAutoNum, sTMes, sTAno, sTMoneda, smesdes, sTDiario: String;
   dTotHaber: DOUBLE;
   nNumero: Integer;
   sNumRev, xxxglosa: String;
Begin
   If DMALM.wAdmin = 'G' Then Exit;

   If VerificaCierreContable(dblcCIA.text, meMesCNT.text) Then

      If MessageDlg('    Periodo Contable Cerrado     ' + chr(13)
         + '     ¿Seguro de Continuar?       ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Exit;

   DMALM.cdsReporte.IndexFieldNames := '';
   sTMes := Copy(meMesCNT.text, 5, 2);
   sTAno := Copy(meMesCNT.text, 1, 4);

   sTDiario := DMALM.DisplayDescrip('prvTGE', 'TGE104', 'TDIARID,AUTONUM', 'FLAGALM=' + quotedstr('S'), 'TDIARID');
   If sTDiario = '' Then
      Raise Exception.Create('No existe Tipo de Diario para Asientos de Almacén');

   sTAutoNum := DMALM.cdsQry.FieldByName('AUTONUM').AsString;

   If MessageDlg('Contabilizar Consumos de Almacén' + chr(13)
      + '         ¿Esta Seguro?          ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Exit;

   Screen.Cursor := crHourGlass;

//   If Copy(dblcdPeriodo.text, 5, 2)='11' Then
//   Begin
   sSQL := ' DELETE FROM CNT311 '
      + '  WHERE CIAID>=''02'''
      + '    and CNTANOMM=' + quotedstr(meMesCNT.text)
      + '    and TDIARID=' + quotedstr(sTDiario)
      + '    and CNTLOTE=' + quotedstr(dblcCIA.text + dblcTALM.text)
      + '    and CNTESTADO IN (''I'',''A'',''P'') '
      + '    and CNTCOMPROB like ''00000' + Copy(dblcdPeriodo.text, 5, 2) + '%''';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sSql);
   Except
   End;

   sSQL := ' Delete from CNT301 '
      + '  where CIAID>=''02'' '
      + '    and CNTANOMM=' + quotedstr(meMesCNT.text)
      + '    and TDIARID=' + quotedstr(sTDiario)
      + '    and CNTLOTE=' + quotedstr(dblcCIA.text + dblcTALM.text)
      + '    and CNTESTADO IN (''I'',''A'',''P'') '
      + '    and CNTCOMPROB like ''00000' + Copy(dblcdPeriodo.text, 5, 2) + '%''';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sSql);
   Except
   End;

   sSQL := ' Delete from CNT300 '
      + '  where CIAID>=''02'' '
      + '    and CNTANOMM=' + quotedstr(meMesCNT.text)
      + '    and TDIARID=' + quotedstr(sTDiario)
      + '    and CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text)
      + '    and CNTESTADO IN (''I'',''A'',''P'') '
      + '    and CNTCOMPROB like ''00000' + Copy(dblcdPeriodo.text, 5, 2) + '%''';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sSql);
   Except
   End;
//   End;

   VerificaMovimientos(dblcCia.Text, dblcTALM.text, sTDiario, dblcdPeriodo.Text);

   sSQL := 'Select A.CIAID,A.ALMID,A.TDAID,TINID,NISAID,TRUNC(NISAFREG) NISAFREG,NISAHREG '
      + '  from LOG314 A, TGE208 B '
      + ' where A.ALMID=' + QuotedStr(dblcTALM.text) + ' AND A.CIAID=' + QuotedStr(dblcCIA.text)
      + '   and A.NISANOMM=' + QuotedStr(dblcdPeriodo.text)
      + '   and A.NISSIT=''ACEPTADO'' AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' '
      + ' order BY NISAFREG,NISAID,TINID ';

   DMALM.cdsQry2.Close;
   DMALM.cdsQry2.DataRequest(sSQL);
   DMALM.cdsQry2.Open;
   If DMALM.cdsQry2.Recordcount = 0 Then
      Raise Exception.Create('No existen Movimientos para este Almacén');
   DMALM.cdsQry2.First;

   sSQL := 'Select NVL( MAX( CNTCOMPROB ), ''00000' + Copy(dblcdPeriodo.text, 5, 2) + '000'' ) NUMMAX '
      + '  from CNT300 '
      + ' where CIAID IN (''02'',''04'') '
      + '   and CNTANOMM=' + quotedstr(meMesCNT.text)
      + '   and TDIARID=' + quotedstr(sTDiario)
      + '   and CNTCOMPROB like ''00000' + Copy(dblcdPeriodo.text, 5, 2) + '%'' ';
   DMALM.cdsULTTGE.Close;
   DMALM.cdsULTTGE.DataRequest(sSQL); // Llamada remota al provider del servidor
   DMALM.cdsULTTGE.Open;

   nNumero := StrToInt(DMALM.cdsULTTGE.FieldByname('NUMMAX').AsString);

   If dblcCia.Text = '02' Then
   Begin
      lblTitulo.caption := '';
      lblTitulo.visible := True;
      g.visible := True;
      g.MaxValue := DMALM.cdsQry2.RecordCount;
      g.Progress := 0;
      sNumRev := '20112890';
      While Not DMALM.cdsQry2.EOF Do
      Begin
         lblTitulo.caption := 'Generando Previo ' + IntToStr(DMALM.cdsQry2.RecNo) + '/' + IntToStr(DMALM.cdsQry2.RecordCount);
         g.Progress := g.Progress + 1;
         Application.ProcessMessages;
         nNumero := nNumero + 1;
         If DMALM.cdsQry2.FieldByname('NISAID').AsString = sNumRev Then
            ShowMessage('revisar ' + sNumRev);

         xxNoReg := DMALM.StrZero(IntToStr(nNumero), 10);
         DMALM.GeneraContabilizacion(dblcCia.Text, sTDiario, dblcdPeriodo.Text, xxNoReg, meMesCNT.Text, Self, 'P');
         DMALM.cdsQry2.Next;
      End;
      g.visible := False;
      lblTitulo.visible := False;
   End;

   If dblcCia.Text = '04' Then
   Begin
      lblTitulo.caption := '';
      lblTitulo.visible := True;
      g.visible := True;
      g.MaxValue := DMALM.cdsQry2.RecordCount;
      g.Progress := 0;
      While Not DMALM.cdsQry2.EOF Do
      Begin
         lblTitulo.caption := 'Generando Previo ' + IntToStr(DMALM.cdsQry2.RecNo) + '/' + IntToStr(DMALM.cdsQry2.RecordCount);
         g.Progress := g.Progress + 1;
         Application.ProcessMessages;
         nNumero := nNumero + 1;
         xxNoReg := DMALM.StrZero(IntToStr(nNumero), 10);
         GeneraContabilizacionBazar(dblcCia.Text, sTDiario, dblcdPeriodo.Text, xxNoReg, Self, 'P');
         DMALM.cdsQry2.Next;
      End;
      g.visible := False;
      lblTitulo.visible := False;
   End;

   If dblcdPeriodo.TEXT = '201311' Then
      xxxglosa := ' NOV2013'
   Else
      XXXGLOSA := '';

   sSQL := ' Insert into cnt300 (CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, '
      + '                     CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
      + '                     CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, '
      + '                     CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, '
      + '                     TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
      + '                     CNTTS, DOCMOD, MODULO ) '
      + ' Select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, '
      + '        MAX(AUXDES)||'' ALM ''||MAX(SUBSTR(CNTLOTE,3,2))||'' T.INV ''||MAX(CNTSERIE)||'' N.''||MAX(CNTNODOC)||''' + xxxglosa + ''' CNTGLOSA, '
      + '        MAX(NVL(A.CNTTCAMBIO,0)),A.CNTFCOMP, ''I'', ''N'' , '
      + '        MAX( CNTUSER ) CNTUSER, MAX(CNTFREG), MAX(CNTHREG), A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, '
      + '        A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ' + QuotedStr(DMALM.wTMonLoc) + ' TMONID, '''', '
      + '        A.TDIARDES, SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME), '
      + '        MAX(CNTTS), MAX(CNTMODDOC), MAX(MODULO) '
      + '   from CNT311 A '
      + '  where A.CIAID>=''02'' AND A.TDIARID=' + QuotedStr(sTDiario)
      + '    and A.CNTANOMM=' + QuotedStr(meMesCNT.Text) + ' AND A.CNTESTADO=''I'' '
      + '    and CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text)
      + '    and CNTCOMPROB like ''00000' + Copy(dblcdPeriodo.text, 5, 2) + '%'' '
      + '  group by A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, '
      + '           A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, '
      + '           A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS,  A.TDIARDES ';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
   Except
   End;

   Screen.Cursor := crDefault;

   ShowMessage('Terminó con exito.');
End;

Procedure TFContab.ppReportePreviewFormCreate(Sender: TObject);
Begin
   ppReporte.PreviewForm.ClientHeight := 500;
   ppReporte.PreviewForm.ClientWidth := 650;
   TppViewer(ppReporte.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFContab.VerificaMovimientos(xxCia, xxAlm, xxTDiario, xxAnoMM: String);
Var
   xSQL: String;
   xsCompaniaDestino: String;
Begin
   Screen.cursor := crHourGlass;
   xSQL := ' SELECT LPAD(' + QuotedStr('0') + ',1000,' + QuotedStr('0') + ') OBSERVACION FROM TGE901 ';
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;
   DMALM.cdsReporte.EmptyDataSet;

   xSQL := 'SELECT ' + QuotedStr(xxAlm) + ' ALMID,' + QuotedStr(xxCia) + ' CIAID,' + QuotedStr(xxTDiario)
      + ' TDIARID, ' + QuotedStr(xxAnoMM) + ' DCPANOMM, ' + 'B.CUENTAID,E.CTADES DCPGLOSA,''D'' DCPDH,'
      + QuotedStr(DMALM.wTMonLoc) + ' TMONID,''N'' CNTCUADRE, E.CTADES, E.CTA_CCOS, C.CCOSID, G.CCOSDES, '
      + ' F.TDIARDES, ''000'' DCPLOTE,0 TOTDEBE,SUM(ROUND(A.KDXCNTG*A.ARTPCG,2)) TOTHABER, '
      + ' 0 CPPRORORI, 0 CPPRORMOLOC, 0 CPPRORMOEXT,C.TDAID,C.NISAID,C.TINID,B.TRIABR,E.CTA_DOC,B.TRISGT '
      + '  FROM LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE202 E,TGE104 F,TGE203 G '
      + ' WHERE A.ALMID=' + QuotedStr(xxAlm) + ' AND A.CIAID=' + QuotedStr(xxCia) + ' AND A.KDXANOMM=' + QuotedStr(xxAnoMM)
      + '   AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' '
      + '   AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID AND A.ALMID=C.ALMID AND A.NISAID=C.NISAID '
      + '   AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID '
      + '   AND A.CIAID=D.CIAID AND A.TINID=D.TINID AND A.GRARID=D.GRARID '
      + '   AND A.CIAID=E.CIAID AND B.CUENTAID=E.CUENTAID AND F.TDIARID=' + QuotedStr(xxTDiario) + ' AND A.CCOSID=G.CCOSID(+) '
      + ' GROUP BY B.CUENTAID,E.CTADES,E.CTA_CCOS,C.CCOSID,G.CCOSDES,F.TDIARDES,C.TDAID,C.NISAID,C.TINID, '
      + '          B.TRIABR, E.CTA_DOC, B.TRISGT ';
   xSQL := xSQL + ' UNION ALL '
      + 'SELECT ' + QuotedStr(xxAlm) + ' ALMID,' + QuotedStr(xxCia) + ' CIAID,' + QuotedStr(xxTDiario) + ' TDIARID, '
      + QuotedStr(xxAnoMM) + ' DCPANOMM, D.CUENTAID,E.CTADES DCPGLOSA,''H'' DCPDH,'
      + QuotedStr(DMALM.wTMonLoc) + ' TMONID,''N'' CNTCUADRE, E.CTADES, E.CTA_CCOS,C.CCOSID, G.CCOSDES, '
      + ' F.TDIARDES,''000'' DCPLOTE,SUM(ROUND(A.KDXCNTG*A.ARTPCG,2)) TOTDEBE,0 TOTHABER, '
      + ' 0 CPPRORORI, 0 CPPRORMOLOC, 0 CPPRORMOEXT,C.TDAID,C.NISAID,C.TINID,B.TRIABR,E.CTA_DOC,B.TRISGT '
      + '  FROM LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE202 E,TGE104 F,TGE203 G '
      + ' WHERE A.ALMID=' + QuotedStr(xxAlm) + ' AND A.CIAID=' + QuotedStr(xxCia) + ' AND A.KDXANOMM=' + QuotedStr(xxAnoMM)
      + '   AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' '
      + '   AND A.CIAID=C.CIAID AND A.TINID=C.TINID AND A.NISAID=C.NISAID AND A.NISATIP=C.NISATIP '
      + '   AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID '
      + '   AND A.CIAID=D.CIAID AND A.TINID=D.TINID AND A.GRARID=D.GRARID '
      + '   AND A.CIAID=E.CIAID AND D.CUENTAID=E.CUENTAID '
      + '   AND F.TDIARID=' + QuotedStr(xxTDiario) + ' AND A.CCOSID=G.CCOSID(+) '
      + ' GROUP BY D.CUENTAID,E.CTADES,E.CTA_CCOS,C.CCOSID,G.CCOSDES,F.TDIARDES,C.TDAID,C.NISAID,C.TINID, '
      + '          B.TRIABR,E.CTA_DOC,B.TRISGT ';
   DMALM.cdsQry2.Close;
   DMALM.cdsQry2.DataRequest(xSQL);
   DMALM.cdsQry2.Open;
   DMALM.cdsQry2.First;

   lblTitulo.caption := '';
   lblTitulo.visible := True;
   g.visible := True;
   g.MaxValue := DMALM.cdsQry2.RecordCount;
   g.Progress := 0;

   While Not DMALM.cdsQry2.EOF Do
   Begin
      lblTitulo.caption := 'Comprobando Movimientos ' + IntToStr(DMALM.cdsQry2.RecNo) + '/' + IntToStr(DMALM.cdsQry2.RecordCount);
      g.Progress := g.Progress + 1;
      Application.ProcessMessages;
      If (DMALM.cdsQry2.FieldByName('TOTDEBE').AsFloat < 0) Or (DMALM.cdsQry2.FieldByName('TOTHABER').AsFloat < 0) Then
      Begin
         DMALM.cdsReporte.Append;
         DMALM.cdsReporte.FieldByName('OBSERVACION').AsString := 'Mov. Tda ' + QuotedStr(DMALM.cdsQry2.fieldByName('TDAID').AsString) +
            ' Tip. Inv ' + DMALM.cdsQry2.fieldByName('TINID').AsString +
            ' N° ' + DMALM.cdsQry2.fieldByName('NISAID').AsString + '. Tiene montos negativos ';
      End;
      If (Length(DMALM.cdsQry2.FieldByName('CCOSID').AsString) > 0) And (DMALM.DisplayDescrip('prvTGE', 'TGE203', 'CCOSID,CCOSMOV', 'CCOSID=' + quotedstr(DMALM.cdsQry2.fieldByName('CCOSID').AsString), 'CCOSMOV') <> 'S') Then
      Begin
         DMALM.cdsReporte.Append;
         DMALM.cdsReporte.FieldByName('OBSERVACION').AsString := 'Mov. Tda ' + QuotedStr(DMALM.cdsQry2.fieldByName('TDAID').AsString) +
            ' Tip. Inv ' + DMALM.cdsQry2.fieldByName('TINID').AsString +
            ' N° ' + DMALM.cdsQry2.fieldByName('NISAID').AsString + '. Tiene Centro de costo Errado: ' + QuotedStr(DMALM.cdsQry2.fieldByName('CCOSID').AsString);
      End;

      If (Length(DMALM.cdsQry2.FieldByName('CCOSID').AsString) = 0) And (DMALM.cdsQry2.FieldByName('TRISGT').AsString = 'S') Then
      Begin
         DMALM.cdsReporte.Append;
         DMALM.cdsReporte.FieldByName('OBSERVACION').AsString := 'Mov. Tda ' + QuotedStr(DMALM.cdsQry2.fieldByName('TDAID').AsString) +
            ' Tip. Inv ' + DMALM.cdsQry2.fieldByName('TINID').AsString +
            ' N° ' + DMALM.cdsQry2.fieldByName('NISAID').AsString + '. No tiene Centro de costo ';
      End;
      xsCompaniaDestino := DMALM.DisplayDescrip('prvSQL', 'TGE203', '*', 'CCOSID=' + quotedstr(DMALM.cdsQry2.fieldByName('CCOSID').AsString), 'CIADEST');
      If Length(Trim(xsCompaniaDestino)) > 0 Then
      Begin
         If (Length(Trim(DMALM.cdsQry.fieldByName('CUENTAID').AsString)) = 0) Or
            (Length(Trim(DMALM.cdsQry.fieldByName('BAZCTA').AsString)) = 0) Or
            (Length(Trim(DMALM.cdsQry.fieldByName('BAZCIA').AsString)) = 0) Then
         Begin
            DMALM.cdsReporte.Append;
            DMALM.cdsReporte.FieldByName('OBSERVACION').AsString := 'La configuración de las cuentas contables del Centro de Costo ' +
               DMALM.cdsQry.fieldByName('CCOSID').AsString + '-' + DMALM.cdsQry.fieldByName('CCOSDES').AsString +
               ' está incompleta. Por favor verifique el mantenimiento de Centros de Costo';
         End;
      End;
      DMALM.cdsQry2.Next;
   End;
   g.visible := False;
   lblTitulo.visible := False;

   If DMALM.cdsReporte.RecordCount > 0 Then
   Begin
      Screen.cursor := crDefault;
      ShowMessage('Existen observaciones en los movimientos');
      ppdbValida.DataSource := DMALM.dsReporte;
      ppValida.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ObsConta.rtm';
      ppValida.Template.LoadFromFile;
      ppd1.Report := ppValida;
      If cbDiseno.Checked Then
         ppd1.showModal
      Else
         ppValida.Print;

      ppValida.STOP;
      abort;
   End;
   Screen.cursor := crDefault;
End;

Procedure TFContab.bbtnAgrupadoClick(Sender: TObject);
Var
   sTDiario, sSQL: String;
   x10: integer;
Begin
   sTDiario := DMALM.DisplayDescrip('prvTGE', 'TGE104', 'TDIARID,TDIARDES,AUTONUM', 'FLAGALM=' + quotedstr('S'), 'TDIARID');
   sSQL := 'SELECT CNT300.*,''1234567890123456789012345678901234567890'' CIADES '
      + '  FROM CNT300 '
      + ' WHERE TDIARID=' + quotedstr(sTDiario)
      + '   AND CNTANOMM=' + quotedstr(dblcdPeriodo.text)
      + '   AND CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text)
      + '   AND CNTESTADO=''I'' ORDER BY CIAID,TDIARID,CNTANOMM,CNTCOMPROB ';
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;
   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.EOF Do
   Begin
      DMALM.cdsReporte.Edit;
      DMALM.cdsReporte.FieldByName('CIADES').AsString := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(DMALM.cdsReporte.FieldByName('CIAID').AsString), 'CIADES');
      DMALM.cdsReporte.Post;
      DMALM.cdsReporte.Next;
   End;

   sTDiario := DMALM.DisplayDescrip('prvTGE', 'TGE104', 'TDIARID,TDIARDES,AUTONUM', 'FLAGALM=' + quotedstr('S'), 'TDIARID');
   If DMALM.cdsReporte.RecordCount = 0 Then
      Raise Exception.Create('No existen registros que mostrar');
   dbpbAgrupado.DataSource := DMALM.dsReporte;
   ppRepAgrupa.DataPipeline := dbpbAgrupado;
   ppRepAgrupa.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ComprAgrupado.rtm';
   ppRepAgrupa.Template.LoadFromFile;
   pplblATit.caption := ' LISTADO RESUMIDO DE COMPROBANTES';
   pplblASubTit.caption := ' PERIDO: ' + dblcdPeriodo.text + '   T. Diario: ' + sTDiario + ' ' + DMALM.cdsQry.FieldbyName('TDIARDES').AsString;

   ppd1.Report := ppRepAgrupa;
   If cbDiseno.Checked Then
      ppd1.showModal
   Else
      ppRepAgrupa.Print;

   ppRepAgrupa.Stop;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
   dbpbAgrupado.DataSource := Nil;
   ppd1.Report := Nil;
End;

Procedure TFContab.bbtnDetalladoClick(Sender: TObject);
Var
   sTDiario, sSQL: String;
   x10: integer;
Begin
   sTDiario := DMALM.DisplayDescrip('prvTGE', 'TGE104', 'TDIARID,TDIARDES,AUTONUM', 'FLAGALM=' + quotedstr('S'), 'TDIARID');

   If dblcdPeriodo.text <= '201012' Then
   Begin
      sSQL := 'Select CNT311.*, TGE101.CIADES '
         + '  from CNT311, TGE101 '
         + ' where CNT311.CIAID>=''02'' AND TDIARID=' + quotedstr(sTDiario)
         + '   and CNTANOMM=' + quotedstr(dblcdPeriodo.text) + ' AND CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text)
         + '   and CNTESTADO=''I'' '
         + '   and CNT311.CIAID=TGE101.CIAID '
         + ' order BY CNT311.CIAID, TDIARID, CNTANOMM, CNTNODOC, CNTSERIE, CNTREG';
      DMALM.cdsReporte.Close;
      DMALM.cdsReporte.DataRequest(sSQL);
      DMALM.cdsReporte.Open;

      If DMALM.cdsReporte.recordcount <= 0 Then
      Begin
         sSQL := 'Select CNT301.*, TGE101.CIADES '
            + '  from CNT301, TGE101 '
            + ' where CNT301.CIAID>=''02'' AND TDIARID=' + quotedstr(sTDiario)
            + '   and CNTANOMM=' + quotedstr(dblcdPeriodo.text)
            + '   and CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text)
            + '   and CNTCOMPROB like ''00000' + Copy(meMesCNT.text, 5, 2) + '%'' ' //rmz
            + '   and CNTESTADO=''P'' '
            + '   and CNT301.CIAID=TGE101.CIAID '
            + ' order by CNT301.CIAID, TDIARID, CNTANOMM, CNTNODOC, CNTSERIE, CNTREG ';
         DMALM.cdsReporte.Close;
         DMALM.cdsReporte.DataRequest(sSQL);
         DMALM.cdsReporte.Open;
      End;
   End
   Else
   Begin
      sSQL := 'Select CNT311.*, TGE101.CIADES '
         + '  from CNT311, TGE101 '
         + ' where CNT311.CIAID>=''02'' AND TDIARID=' + quotedstr(sTDiario)
           //  +'   and CNTANOMM>=''201101'' AND CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text) rmz
      + '   and CNTANOMM=' + quotedstr(dblcdPeriodo.text)
         + '   and CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text)
         + '   and CNTESTADO=''I'' '
         + '   and CNT311.CIAID=TGE101.CIAID '
 //          +'   and CNTCOMPROB like ''00000' + Copy(dblcdPeriodo.text, 5, 2) + '%'' '
      + '   and CNTCOMPROB like ''00000' + Copy(meMesCNT.text, 5, 2) + '%'' ' //rmz
         + ' order by CNT311.CIAID, TDIARID, CNTANOMM, CNTNODOC, CNTSERIE, CNTREG';
      DMALM.cdsReporte.Close;
      DMALM.cdsReporte.DataRequest(sSQL);
      DMALM.cdsReporte.Open;
   End;

   sTDiario := DMALM.DisplayDescrip('prvTGE', 'TGE104', 'TDIARID,TDIARDES,AUTONUM', 'FLAGALM=' + quotedstr('S'), 'TDIARID');
   If DMALM.cdsReporte.RecordCount = 0 Then
      Raise Exception.Create('No existen registros que mostrar');

   dbpbDetallado.DataSource := DMALM.dsReporte;
   ppRepDetalla.DataPipeline := dbpbDetallado;

   ppRepDetalla.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ComprDetallado.rtm';
   ppRepDetalla.Template.LoadFromFile;
   pplblDTit.caption := ' LISTADO RESUMIDO DE COMPROBANTES';
   pplblDSubTit.caption := ' PERIDO: ' + dblcdPeriodo.text + '   T. Diario: ' + sTDiario + ' ' + DMALM.cdsQry.FieldbyName('TDIARDES').AsString;
   ppd1.Report := ppRepDetalla;
   If cbDiseno.Checked Then
      ppd1.showModal
   Else
      ppRepDetalla.Print;
   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
   dbpbDetallado.DataSource := Nil;
   ppd1.Report := Nil;
End;

Procedure TFContab.dblcTALMExit(Sender: TObject);
Begin
   If bbtnCancel.focused Then exit;

   dbeALM.Text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', 'CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + QuotedStr(dblcTALM.text), 'ALMDES');
   If length(Trim(dbeALM.text)) = 0 Then
   Begin
      dblcTALM.setFocus;
      Raise Exception.Create('Ingrese Almacén');
   End;
End;

Procedure TFContab.dblcdPeriodoExit(Sender: TObject);
Begin
   If bbtnCancel.focused Then exit;

   meMesCNT.Text := dblcdPeriodo.Text;
End;

Function TFContab.VerificaCierreContable(xxCia, xxAnoMM: String): boolean;
Var
   sSQL: String;
Begin
   sSQL := 'SELECT * FROM TGE154 '
      + ' WHERE CIAID=' + QuotedStr(xxCia)
      + '   AND ANO=' + QuotedStr(copy(xxAnoMM, 1, 4));
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(sSQL);
   DMALM.cdsQry.Open;
   result := (DMALM.cdsQry.FieldByName('PER' + copy(xxAnoMM, 5, 2)).AsString = 'S');
End;

Procedure TFContab.Z2bbtnContabClick(Sender: TObject);
Var
   sTDiario, sSQL: String;
Begin
   If VerificaCierreContable(dblcCIA.text, dblcdPeriodo.text) Then
      Raise Exception.Create('Ya se realizó el cierre contable para este periodo.');

   sTDiario := DMALM.DisplayDescrip('prvTGE', 'TGE104', 'TDIARID,AUTONUM', 'FLAGALM=' + quotedstr('S'), 'TDIARID');
   If sTDiario = '' Then
      Raise Exception.Create('No existe Tipo de Diario para Asientos de Almacén');

   If Question('Confirmar', 'Esta Seguro de Contabilizar los registros? ') Then
   Begin
      sSQL := 'SELECT * '
         + '  FROM CNT300 '
         + ' WHERE CIAID=' + QuotedStr(dblcCIA.text)
         + '   AND TDIARID=' + QuotedStr(sTDiario)
         + '   AND CNTANOMM=' + QuotedStr(dblcdPeriodo.text)
         + '   AND CNTLOTE=' + QuotedStr(dblcCia.Text + dblcTALM.text) + ' AND CNTESTADO=''I'' ';
      DMALM.FiltraCDS(DMALM.cdsQry2, sSQL);
      If DMALM.cdsQry2.RecordCount = 0 Then
         Raise Exception.Create('No existen registros para contabilizar.');

      Screen.Cursor := crHourGlass;

      DMALM.cdsQry2.First;
      While Not DMALM.cdsQry2.EOF Do
      Begin
         sSQL := ' select * '
            + '   from CNT311 '
            + '  where CIAID=' + QuotedStr(DMALM.cdsQry2.FieldbyName('CIAID').AsString)
            + '    and TDIARID=' + QuotedStr(DMALM.cdsQry2.FieldbyName('TDIARID').AsString)
            + '    and CNTANOMM=' + QuotedStr(DMALM.cdsQry2.FieldbyName('CNTANOMM').AsString)
            + '    and CNTCOMPROB=' + QuotedStr(DMALM.cdsQry2.FieldbyName('CNTCOMPROB').AsString);
         DMALM.FiltraCds(DMALM.cdsMovCnt, sSQL);

         sSQL := ' Update LOG314 '
            + '    set NISA_CONTA=''S'' '
            + '  where CIAID=' + QuotedStr(DMALM.cdsQry2.FieldbyName('CIAID').AsString)
            + '    and TINID=' + QuotedStr(DMALM.cdsMovCnt.FieldbyName('CNTSERIE').AsString)
            + '    and ALMID=' + QuotedStr(Copy(DMALM.cdsQry2.FieldbyName('CNTLOTE').AsString, 3, 2))
            + '    and TDAID=' + QuotedStr(DMALM.cdsMovCnt.FieldbyName('DOCID').AsString)
            + '    and NISAID=' + QuotedStr(DMALM.cdsMovCnt.FieldbyName('CNTNODOC').AsString);
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(sSql);
         Except
            Screen.Cursor := crDefault;
            ShowMessage('Error');
         End;

         DMALM.cdsQry2.Next;
      End;
      Screen.Cursor := crDefault;
      ShowMessage('Contabilizado OK.');
   End;
End;

Procedure TFContab.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
   Action := CAFree;
End;

Procedure TFContab.BitBtn1Click(Sender: TObject);
Var
   xSQL: String;
   x10: Integer;
Begin
   xSQL := 'Select A.TRIID, B.TRIDES, C.NISAID, C.TINID, A.FAMID, A.SFAMID, C.ALMID, J.ALMDES, C.TDAID, C.CCOSID, '
      + '       C.NISAOBS, C.NISASOLIC, A.CIAID, I.CIADES, A.KDXID, A.ARTID, A.ARTDES, A.UNMIDG, '
      + '       A.KDXCNTG, A.ARTPCG, ROUND(A.KDXCNTG*A.ARTPCG,2) ARTTOTALG, A.COSREPO, G.CCOSDES, '
      + '       C.NISAFREG, A.KDXANOMM, A.KDXANOMM PERIODO, '' '' RANGO, ''SUSTENTO DE INVENTARIOS'' TITULO '
      + '  from LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE203 G, TGE101 I, TGE151 J '
//       + ' where A.CIAID=' + QuotedStr(dblcCIA.text) + ' AND A.KDXANOMM=' + quotedstr(dblcdPeriodo.text) + ' '
   + ' where A.CIAID=' + QuotedStr(dblcCIA.text) + ' AND A.KDXANOMM=' + quotedstr(meMesCNT.text) + ' '
      + '   and C.ALMID=' + QuotedStr(dblcTALM.text) + ' AND C.NISSIT=''ACEPTADO'' '
      + '   and A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' '
      + '   and A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID '
      + '   and A.ALMID=C.ALMID AND A.NISAID=C.NISAID '
      + '   and A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID '
      + '   and A.CIAID=D.CIAID AND A.TINID=D.TINID   AND A.GRARID=D.GRARID '
      + '   and A.CCOSID=G.CCOSID(+) '
      + '   and A.CIAID = J.CIAID(+) AND A.LOCID=J.LOCID(+) AND A.TINID=J.TINID(+) AND A.ALMID=J.ALMID(+) '
      + '   and A.CIAID = I.CIAID(+) '
      + ' order BY A.NISAID, A.TINID, A.KDXID';
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount = 0 Then
      Raise Exception.Create('No existen registros que mostrar');

   ppdbSus.DataSource := DMALM.dsReporte;
   pprSus.DataPipeline := ppdbSus;

  // pprSus.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\SustentoInventario.rtm'; tmz
   pprSus.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\SustentoInvComb.rtm';
   pprSus.Template.LoadFromFile;

   ppd2.Report := pprSus;
   If cbDiseno.Checked Then
      ppd2.showModal
   Else
      pprSus.Print;

   pprSus.Stop;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
   ppd2.Report := Nil;
   ppdbSus.DataSource := Nil;

End;

Procedure TFContab.GeneraContabilizacionBazar(cCia, cOrigen, cPeriodo, cNoReg: String; xForma: TForm; xTipoC: String);
Var
   xSQL, xSQL1, xSQL2, xWhere: String;
   xNombreBoton: String;
   xContR: Integer;
   xTOTMG, xTOTTO, xxTCambio: Double;
   D, M, Y: Word;
   sTCambio, sFecha, xTCtaD, xTCtaH: String;
   NISAANO, NISAMES, NISADIA, NISAANOMES, NISATRIM, NISASEM, NISASS, NISAAATRI, NISAAASEM, NISAAASS, NISANOMM: String;
   sCiaDes, sAutoNum, xxNoReg: String;
Begin

   xFec_Sis := DMALM.cdsQry2.FieldByName('NISAFREG').AsString;
   xHor_Sis := DMALM.cdsQry2.FieldByName('NISAHREG').AsString;

   sTCambio := DMALM.CalcTipoCambio(DMALM.wTMonExt, StrtoDate(xFec_Sis), 'TCAM' + DMALM.wTipoCambioUsar);

   sFecha := FormatDateTime(DMALM.wFormatFecha, StrtoDate(xFec_Sis));
   xSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
   DMALM.FiltraCDS(DMALM.cdsPeriodo, xSQL);

   DecodeDate(StrtoDate(xFec_Sis), Y, M, D);

   NISAANO := IntToStr(Y);
   NISAMES := DMALM.strzero(IntToStr(M), 2);
   NISADIA := DMALM.strzero(IntToStr(D), 2);
   NISAANOMES := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);
   NISATRIM := DMALM.cdsPeriodo.fieldbyName('FECTRIM').asString;
   NISASEM := DMALM.cdsPeriodo.fieldbyName('FECSEM').asString;
   NISASS := DMALM.cdsPeriodo.fieldbyName('FECSS').asString;
   NISAAATRI := DMALM.cdsPeriodo.fieldbyName('FECAATRI').asString;
   NISAAASEM := DMALM.cdsPeriodo.fieldbyName('FECAASEM').asString;
   NISAAASS := DMALM.cdsPeriodo.fieldbyName('FECAASS').asString;
   NISANOMM := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);

   xSQL := 'Insert Into CNT311 ';
   xSQL1 := 'SELECT ' + QuotedStr(cCia) + ' CIAID,' + QuotedStr(cOrigen) + ' TDIARID, '
      + QuotedStr(cNoReg) + ' CNTCOMPROB, ' + QuotedStr(Copy(cPeriodo, 1, 4)) + ' CNTANO, ' + QuotedStr(cPeriodo) + ' CNTANOMM, '
      + QuotedStr(DMALM.cdsQry2.FieldByName('CIAID').AsString + DMALM.cdsQry2.FieldByName('ALMID').AsString) + ' CNTLOTE, '
      + 'CASE WHEN G.BAZCIA=''04'' THEN D.CUENTAHAB ELSE G.BAZCTA END CUENTAID, NULL, NULL, '
      + 'C.TDAID, C.TINID, C.NISAID, B.TRIABR, ''D'' CNTDH, C.CCOSID, ' + sTCambio + ' CNTTCAMBIO, '
      + 'SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTMTOORI, SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTMTOLOC, '
      + 'SUM( ROUND(ROUND(A.KDXCNTG*A.ARTPCG,2)/' + sTCambio + ',2) ) CNTMTOEXT, '
      + QuotedStr(xFec_Sis) + ' CNTFEMIS,' + QuotedStr(xFec_Sis) + ' CNTFVCMTO, ' + QuotedStr(xFec_Sis) + ' CNTFCOMP, '
      + '''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, ''' + DMALM.wUsuario + ''' CNTUSER, SYSDATE, SYSDATE, '
      + QuotedStr(NISAMES) + ' CNTMM, ' + QuotedStr(NISADIA) + ' CNTDD, ' + QuotedStr(NISATRIM) + ' CNTTRI, '
      + QuotedStr(NISASEM) + ' CNTSEM, ' + QuotedStr(NISASS) + ' CNTSS, ' + QuotedStr(NISAAATRI) + ' CNTAATRI, '
      + QuotedStr(NISAAASEM) + ' CNTAASEM, ' + QuotedStr(NISAAASS) + ' DCPAASS, '
      + '''N'' TMONID, NULL, NULL, NULL, ''CONSUMO DE ALMACENES'' TDIARDES, E.CTADES, NULL, NULL DOCDES, '
      + 'G.CCOSABR, SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTDEBEMN, '
      + 'SUM( ROUND(ROUND(A.KDXCNTG*A.ARTPCG,2)/' + sTCambio + ',2) ) CNTDEBEME, '
      + '0.00 CNTHABEMN, 0.00 CNTHABEME, 0.00, 0.00, NULL, ''VB'', NULL, ''ALM'', 1 CNTREG, ''ALM'', NULL '
      + 'FROM LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE202 E, TGE104 F, TGE203 G '
      + 'WHERE A.CIAID=' + QuotedStr(cCia) + ' AND A.KDXANOMM=' + QuotedStr(cPeriodo) + ' '
      + 'AND C.ALMID=' + QuotedStr(DMALM.cdsQry2.FieldByName('ALMID').AsString) + ' '
      + 'AND C.TDAID=' + QuotedStr(DMALM.cdsQry2.FieldByName('TDAID').AsString) + ' '
      + 'AND C.TINID=' + QuotedStr(DMALM.cdsQry2.FieldByName('TINID').AsString) + ' '
      + 'AND C.NISAID=' + QuotedStr(DMALM.cdsQry2.FieldByName('NISAID').AsString) + ' '
      + 'AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' '
      + 'AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID AND A.ALMID=C.ALMID '
      + 'AND A.NISAID=C.NISAID AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID '
      + 'AND A.CIAID=D.CIAID AND A.TINID=D.TINID AND A.GRARID=D.GRARID '
      + 'AND G.BAZCIA=E.CIAID AND CASE WHEN G.BAZCIA=''04'' THEN D.CUENTAHAB ELSE G.BAZCTA END=E.CUENTAID '
      + 'AND F.TDIARID=' + QuotedStr(cOrigen) + ' AND A.CCOSID=G.CCOSID(+) '
      + 'GROUP BY G.BAZCTA, E.CTADES, E.CTA_CCOS, C.CCOSID, G.CCOSABR, F.TDIARDES, C.TDAID, C.NISAID, C.TINID, '
      + 'B.TRIABR, E.CTA_DOC, B.TRISGT, G.BAZCIA, D.CUENTAHAB '
      + 'UNION ALL ';
   xSQL2 := 'SELECT ' + QuotedStr(cCia) + ' CIAID,' + QuotedStr(cOrigen) + ' TDIARID, '
      + QuotedStr(cNoReg) + ' CNTCOMPROB, ' + QuotedStr(Copy(cPeriodo, 1, 4)) + ' CNTANO, ' + QuotedStr(cPeriodo) + ' CNTANOMM, '
      + QuotedStr(DMALM.cdsQry2.FieldByName('CIAID').AsString + DMALM.cdsQry2.FieldByName('ALMID').AsString) + ' CNTLOTE, '
      + 'D.CUENTAID, NULL, NULL, '
      + 'C.TDAID, C.TINID, C.NISAID, B.TRIABR, ''H'' CNTDH, C.CCOSID, ' + sTCambio + ' CNTTCAMBIO, '
      + 'SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTMTOORI, SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTMTOLOC, '
      + 'SUM( ROUND(ROUND(A.KDXCNTG*A.ARTPCG,2)/' + sTCambio + ',2) ) CNTMTOEXT, '
      + QuotedStr(xFec_Sis) + ' CNTFEMIS,' + QuotedStr(xFec_Sis) + ' CNTFVCMTO, ' + QuotedStr(xFec_Sis) + ' CNTFCOMP, '
      + '''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, ''' + DMALM.wUsuario + ''' CNTUSER, SYSDATE, SYSDATE, '
      + QuotedStr(NISAMES) + ' CNTMM, ' + QuotedStr(NISADIA) + ' CNTDD, ' + QuotedStr(NISATRIM) + ' CNTTRI, '
      + QuotedStr(NISASEM) + ' CNTSEM, ' + QuotedStr(NISASS) + ' CNTSS, ' + QuotedStr(NISAAATRI) + ' CNTAATRI, '
      + QuotedStr(NISAAASEM) + ' CNTAASEM, ' + QuotedStr(NISAAASS) + ' DCPAASS, '
      + '''N'' TMONID, NULL, NULL, NULL, ''CONSUMO DE ALMACENES'' TDIARDES, E.CTADES, NULL, NULL DOCDES, G.CCOSABR, '
      + '0.00 CNTDEBEMN, 0.00 CNTDEBEME, '
      + 'SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTHABEMN, '
      + 'SUM( ROUND(ROUND(A.KDXCNTG*A.ARTPCG,2)/' + sTCambio + ',2) ) CNTHABEME, '
      + '0.00, 0.00, NULL, ''VB'', NULL, ''ALM'', 2 CNTREG, ''ALM'', NULL '
      + 'FROM LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE202 E, TGE104 F, TGE203 G '
      + 'WHERE A.CIAID=' + QuotedStr(cCia) + ' AND A.KDXANOMM=' + QuotedStr(cPeriodo) + ' '
      + 'AND C.ALMID=' + QuotedStr(DMALM.cdsQry2.FieldByName('ALMID').AsString) + ' '
      + 'AND C.TDAID=' + QuotedStr(DMALM.cdsQry2.FieldByName('TDAID').AsString) + ' '
      + 'AND C.TINID=' + QuotedStr(DMALM.cdsQry2.FieldByName('TINID').AsString) + ' '
      + 'AND C.NISAID=' + QuotedStr(DMALM.cdsQry2.FieldByName('NISAID').AsString) + ' '
      + 'AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' '
      + 'AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID AND A.ALMID=C.ALMID '
      + 'AND A.NISAID=C.NISAID AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID '
      + 'AND A.CIAID=D.CIAID AND A.TINID=D.TINID AND A.GRARID=D.GRARID '
      + 'AND A.CIAID=E.CIAID AND D.CUENTAID=E.CUENTAID AND F.TDIARID=' + QuotedStr(cOrigen) + ' '
      + 'AND A.CCOSID=G.CCOSID(+) '
      + 'GROUP BY D.CUENTAID, E.CTADES, E.CTA_CCOS, C.CCOSID, G.CCOSABR, F.TDIARDES, C.TDAID, C.NISAID, C.TINID, '
      + 'B.TRIABR, E.CTA_DOC, B.TRISGT, G.BAZCIA, D.CUENTAHAB ';

   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL + xSQL1 + xSQL2);
   Except
   End;

   xSQL := 'SELECT NVL(G.BAZCIA,''02'') BAZCIA FROM LOG315 A, TGE208 B, LOG314 C, TGE203 G '
      + 'WHERE A.CIAID=' + QuotedStr(cCia) + ' AND A.KDXANOMM=' + QuotedStr(cPeriodo) + ' '
      + 'AND C.ALMID=' + QuotedStr(DMALM.cdsQry2.FieldByName('ALMID').AsString) + ' '
      + 'AND C.TDAID=' + QuotedStr(DMALM.cdsQry2.FieldByName('TDAID').AsString) + ' '
      + 'AND C.TINID=' + QuotedStr(DMALM.cdsQry2.FieldByName('TINID').AsString) + ' '
      + 'AND C.NISAID=' + QuotedStr(DMALM.cdsQry2.FieldByName('NISAID').AsString) + ' '
      + 'AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' '
      + 'AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID AND A.ALMID=C.ALMID '
      + 'AND A.NISAID=C.NISAID AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID '
      + 'AND A.CCOSID=G.CCOSID(+) ';
   DMALM.cdsSQL1.Close;
   DMALM.cdsSQL1.DataRequest(xSQL);
   DMALM.cdsSQL1.Open;

   sCiaDes := DMALM.cdsSQL1.FieldByName('BAZCIA').AsString;

   If DMALM.cdsSQL1.FieldByName('BAZCIA').AsString <> '04' Then
   Begin

      xSQL := 'Insert Into CNT311 ';
      xSQL1 := 'SELECT ' + QuotedStr(sCiaDes) + ' CIAID,' + QuotedStr(cOrigen) + ' TDIARID, '
         + QuotedStr(cNoReg) + ' CNTCOMPROB, ' + QuotedStr(Copy(cPeriodo, 1, 4)) + ' CNTANO, ' + QuotedStr(cPeriodo) + ' CNTANOMM, '
         + QuotedStr(DMALM.cdsQry2.FieldByName('CIAID').AsString + DMALM.cdsQry2.FieldByName('ALMID').AsString) + ' CNTLOTE, '
         + 'D.CUENTAHAB CUENTAID, NULL, NULL, '
         + 'C.TDAID, C.TINID, C.NISAID, B.TRIABR, ''D'' CNTDH, C.CCOSID, ' + sTCambio + ' CNTTCAMBIO, '
         + 'SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTMTOORI, SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTMTOLOC, '
         + 'SUM( ROUND(ROUND(A.KDXCNTG*A.ARTPCG,2)/' + sTCambio + ',2) ) CNTMTOEXT, '
         + QuotedStr(xFec_Sis) + ' CNTFEMIS,' + QuotedStr(xFec_Sis) + ' CNTFVCMTO, ' + QuotedStr(xFec_Sis) + ' CNTFCOMP, '
         + '''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, ''' + DMALM.wUsuario + ''' CNTUSER, SYSDATE, SYSDATE, '
         + QuotedStr(NISAMES) + ' CNTMM, ' + QuotedStr(NISADIA) + ' CNTDD, ' + QuotedStr(NISATRIM) + ' CNTTRI, '
         + QuotedStr(NISASEM) + ' CNTSEM, ' + QuotedStr(NISASS) + ' CNTSS, ' + QuotedStr(NISAAATRI) + ' CNTAATRI, '
         + QuotedStr(NISAAASEM) + ' CNTAASEM, ' + QuotedStr(NISAAASS) + ' DCPAASS, '
         + '''N'' TMONID, NULL, NULL, NULL, ''CONSUMO DE ALMACENES'' TDIARDES, E.CTADES, NULL, NULL DOCDES, '
         + 'G.CCOSABR, SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTDEBEMN, '
         + 'SUM( ROUND(ROUND(A.KDXCNTG*A.ARTPCG,2)/' + sTCambio + ',2) ) CNTDEBEME, '
         + '0.00 CNTHABEMN, 0.00 CNTHABEME, 0.00, 0.00, NULL, ''VB'', NULL, ''ALM'', 1 CNTREG, ''ALM'', NULL '
         + 'FROM LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE202 E, TGE104 F, TGE203 G '
         + 'WHERE A.CIAID=' + QuotedStr(cCia) + ' AND A.KDXANOMM=' + QuotedStr(cPeriodo) + ' '
         + 'AND C.ALMID=' + QuotedStr(DMALM.cdsQry2.FieldByName('ALMID').AsString) + ' '
         + 'AND C.TDAID=' + QuotedStr(DMALM.cdsQry2.FieldByName('TDAID').AsString) + ' '
         + 'AND C.TINID=' + QuotedStr(DMALM.cdsQry2.FieldByName('TINID').AsString) + ' '
         + 'AND C.NISAID=' + QuotedStr(DMALM.cdsQry2.FieldByName('NISAID').AsString) + ' '
         + 'AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' '
         + 'AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID AND A.ALMID=C.ALMID '
         + 'AND A.NISAID=C.NISAID AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID '
         + 'AND A.CIAID=D.CIAID AND A.TINID=D.TINID AND A.GRARID=D.GRARID '
         + 'AND ' + QuotedStr(sCiaDes) + '=E.CIAID AND D.CUENTAHAB=E.CUENTAID AND F.TDIARID=' + QuotedStr(cOrigen) + ' '
         + 'AND A.CCOSID=G.CCOSID(+) and G.BAZCIA<>''04'' '
         + 'GROUP BY D.CUENTAHAB, E.CTADES, E.CTA_CCOS, C.CCOSID, G.CCOSABR, F.TDIARDES, C.TDAID, C.NISAID, C.TINID, '
         + 'B.TRIABR, E.CTA_DOC, B.TRISGT, G.BAZCIA, D.CUENTAHAB '
         + 'UNION ALL ';
      xSQL2 := 'SELECT ' + QuotedStr(sCiaDes) + ' CIAID,' + QuotedStr(cOrigen) + ' TDIARID, '
         + QuotedStr(cNoReg) + ' CNTCOMPROB, ' + QuotedStr(Copy(cPeriodo, 1, 4)) + ' CNTANO, ' + QuotedStr(cPeriodo) + ' CNTANOMM, '
         + QuotedStr(DMALM.cdsQry2.FieldByName('CIAID').AsString + DMALM.cdsQry2.FieldByName('ALMID').AsString) + ' CNTLOTE, '
         + 'CASE WHEN G.BAZCIA=''02'' THEN ''16604'' ELSE ''46604'' END CUENTAID, NULL, NULL, '
         + 'C.TDAID, C.TINID, C.NISAID, B.TRIABR, ''H'' CNTDH, C.CCOSID, ' + sTCambio + ' CNTTCAMBIO, '
         + 'SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTMTOORI, SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTMTOLOC, '
         + 'SUM( ROUND(ROUND(A.KDXCNTG*A.ARTPCG,2)/' + sTCambio + ',2) ) CNTMTOEXT, '
         + QuotedStr(xFec_Sis) + ' CNTFEMIS,' + QuotedStr(xFec_Sis) + ' CNTFVCMTO, ' + QuotedStr(xFec_Sis) + ' CNTFCOMP, '
         + '''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, ''' + DMALM.wUsuario + ''' CNTUSER, SYSDATE, SYSDATE, '
         + QuotedStr(NISAMES) + ' CNTMM, ' + QuotedStr(NISADIA) + ' CNTDD, ' + QuotedStr(NISATRIM) + ' CNTTRI, '
         + QuotedStr(NISASEM) + ' CNTSEM, ' + QuotedStr(NISASS) + ' CNTSS, ' + QuotedStr(NISAAATRI) + ' CNTAATRI, '
         + QuotedStr(NISAAASEM) + ' CNTAASEM, ' + QuotedStr(NISAAASS) + ' DCPAASS, '
         + '''N'' TMONID, NULL, NULL, NULL, ''CONSUMO DE ALMACENES'' TDIARDES, E.CTADES, NULL, NULL DOCDES, G.CCOSABR, '
         + '0.00 CNTDEBEMN, 0.00 CNTDEBEME, '
         + 'SUM( ROUND(A.KDXCNTG*A.ARTPCG,2) ) CNTHABEMN, '
         + 'SUM( ROUND(ROUND(A.KDXCNTG*A.ARTPCG,2)/' + sTCambio + ',2) ) CNTHABEME, '
         + '0.00, 0.00, NULL, ''VB'', NULL, ''ALM'', 2 CNTREG, ''ALM'', NULL '
         + 'FROM LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE202 E, TGE104 F, TGE203 G '
         + 'WHERE A.CIAID=' + QuotedStr(cCia) + ' AND A.KDXANOMM=' + QuotedStr(cPeriodo) + ' '
         + 'AND C.ALMID=' + QuotedStr(DMALM.cdsQry2.FieldByName('ALMID').AsString) + ' '
         + 'AND C.TDAID=' + QuotedStr(DMALM.cdsQry2.FieldByName('TDAID').AsString) + ' '
         + 'AND C.TINID=' + QuotedStr(DMALM.cdsQry2.FieldByName('TINID').AsString) + ' '
         + 'AND C.NISAID=' + QuotedStr(DMALM.cdsQry2.FieldByName('NISAID').AsString) + ' '
         + 'AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' '
         + 'AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID AND A.ALMID=C.ALMID '
         + 'AND A.NISAID=C.NISAID AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID '
         + 'AND A.CIAID=D.CIAID AND A.TINID=D.TINID AND A.GRARID=D.GRARID '
         + 'AND G.BAZCIA=E.CIAID AND CASE WHEN G.BAZCIA=''02'' THEN ''16604'' ELSE ''46604'' END=E.CUENTAID '
         + 'AND F.TDIARID=' + QuotedStr(cOrigen) + ' '
         + 'AND A.CCOSID=G.CCOSID(+) and G.BAZCIA<>''04'' '
         + 'GROUP BY E.CTADES, E.CTA_CCOS, C.CCOSID, G.CCOSABR, F.TDIARDES, C.TDAID, C.NISAID, C.TINID, '
         + 'B.TRIABR, E.CTA_DOC, B.TRISGT, G.BAZCIA ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL + xSQL1 + xSQL2);
      Except
      End;

   End;
End;

Procedure TFContab.dblcTALMEnter(Sender: TObject);
Begin
   If dblcCIA.text = '' Then
      dblcCIA.SetFocus;
End;

Procedure TFContab.cbPerClick(Sender: TObject);
Begin
   If cbPer.Checked Then
      gbPerCnt.Enabled := True
   Else
      gbPerCnt.Enabled := False;
End;

Procedure TFContab.bbtnRepNewClick(Sender: TObject);
Var
   sTDiario, xSQL, sSQL: String;
   x10: Integer;
Begin

   sTDiario := DMALM.DisplayDescrip('prvTGE', 'TGE104', 'TDIARID,TDIARDES,AUTONUM', 'FLAGALM=' + quotedstr('S'), 'TDIARID');

   If dblcdPeriodo.text <= '201012' Then
   Begin
      sSQL := 'SELECT CNT311.*, TGE101.CIADES FROM CNT311, TGE101 ' +
         ' WHERE CNT311.CIAID>=''02'' AND TDIARID=' + quotedstr(sTDiario) +
         ' AND CNTANOMM=' + quotedstr(dblcdPeriodo.text) + ' AND CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text) +
         ' AND CNTESTADO=''I'' ' +
         ' AND CNT311.CIAID=TGE101.CIAID ' +
         'ORDER BY CNT311.CIAID, TDIARID, CNTANOMM, CNTNODOC, CNTSERIE, CNTREG';
      DMALM.cdsQry8.Close;
      DMALM.cdsQry8.DataRequest(sSQL);
      DMALM.cdsQry8.Open;

      If DMALM.cdsReporte.recordcount <= 0 Then
      Begin
         sSQL := 'SELECT CNT301.*, TGE101.CIADES FROM CNT301, TGE101 ' +
            ' WHERE CNT301.CIAID>=''02'' AND TDIARID=' + quotedstr(sTDiario) +
            ' AND CNTANOMM=' + quotedstr(dblcdPeriodo.text) + ' AND CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text) +
            ' AND CNTESTADO=''P'' ' +
            ' AND CNT301.CIAID=TGE101.CIAID ' +
            ' ORDER BY CNT301.CIAID, TDIARID, CNTANOMM, CNTNODOC, CNTSERIE, CNTREG ';
         DMALM.cdsQry8.Close;
         DMALM.cdsQry8.DataRequest(sSQL);
         DMALM.cdsQry8.Open;
      End;
   End
   Else
   Begin
      sSQL := 'SELECT CNT311.*, TGE101.CIADES FROM CNT311, TGE101 ' +
         ' WHERE CNT311.CIAID>=''02'' AND TDIARID=' + quotedstr(sTDiario) +
         ' AND CNTANOMM>=''201101'' AND CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text) +
         ' AND CNTESTADO=''I'' ' +
         ' AND CNT311.CIAID=TGE101.CIAID ' +
         // ' and CNTCOMPROB like ''00000' + Copy(dblcdPeriodo.text, 5, 2) + '%'' ' + rmz
      ' and CNTCOMPROB like ''00000' + Copy(meMesCNT.text, 5, 2) + '%'' ' +
         'ORDER BY CNT311.CIAID, TDIARID, CNTANOMM, CNTNODOC, CNTSERIE, CNTREG';
      DMALM.cdsQry8.Close;
      DMALM.cdsQry8.DataRequest(sSQL);
      DMALM.cdsQry8.Open;
   End;

   sTDiario := DMALM.DisplayDescrip('prvTGE', 'TGE104', 'TDIARID,TDIARDES,AUTONUM', 'FLAGALM=' + quotedstr('S'), 'TDIARID');
   If DMALM.cdsQry8.RecordCount = 0 Then
      Raise Exception.Create('No existen registros que mostrar');

   dbpbDetallado.DataSource := DMALM.dsQry8;

   // -------------------------------------------- //

   xSQL := 'SELECT A.TRIID, B.TRIDES, C.NISAID, C.TINID, A.GRARID, A.FAMID, A.SFAMID, C.ALMID, J.ALMDES, C.TDAID, C.CCOSID, '
      + 'C.NISAOBS, C.NISASOLIC, A.CIAID, I.CIADES, A.KDXID, A.ARTID, A.ARTDES, A.UNMIDG, '
      + 'A.KDXCNTG, A.ARTPCG, ROUND(A.KDXCNTG*A.ARTPCG,2) ARTTOTALG, A.COSREPO, G.CCOSDES, '
      + 'C.NISAFREG, A.KDXANOMM, A.KDXANOMM PERIODO, '' '' RANGO, ''SUSTENTO DE INVENTARIOS'' TITULO '
      + 'FROM LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE203 G, TGE101 I, TGE151 J '
   // + 'WHERE A.CIAID=' + QuotedStr(dblcCIA.text) + ' AND A.KDXANOMM=' + quotedstr(dblcdPeriodo.text) + ' '    rmz
   + 'WHERE A.CIAID=' + QuotedStr(dblcCIA.text) + ' AND A.KDXANOMM=' + quotedstr(meMesCNT.text) + ' '
      + 'AND C.ALMID=' + QuotedStr(dblcTALM.text) + ' AND C.NISSIT=''ACEPTADO'' '
      + 'AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' '
      + 'AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID '
      + 'AND A.ALMID=C.ALMID AND A.NISAID=C.NISAID '
      + 'AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID '
      + 'AND A.CIAID=D.CIAID AND A.TINID=D.TINID   AND A.GRARID=D.GRARID '
      + 'AND A.CCOSID=G.CCOSID(+) '
      + 'AND A.CIAID = J.CIAID(+) AND A.LOCID=J.LOCID(+) AND A.TINID=J.TINID(+) AND A.ALMID=J.ALMID(+) '
      + 'AND A.CIAID = I.CIAID(+) '
        //+'ORDER BY A.NISAFREG, A.NISAID, A.TINID, A.KDXID';
   + 'ORDER BY A.NISAID, A.TINID, A.KDXID';
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount = 0 Then
      Raise Exception.Create('No existen registros que mostrar');

   ppdbSus.DataSource := DMALM.dsReporte;
   pprSusNew.DataPipeline := ppdbSus;

   pprSusNew.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\SustentoInvComb.rtm';
   pprSusNew.Template.LoadFromFile;

   ppd2.Report := pprSusNew;
   If cbDiseno.Checked Then
      ppd2.showModal
   Else
      pprSus.Print;

   pprSus.Stop;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
   ppd2.Report := Nil;
   ppdbSus.DataSource := Nil;

End;

Procedure TFContab.BitBtn2Click(Sender: TObject);
Var
   sTDiario, sSQL: String;
   x10: integer;
Begin
   sTDiario := DMALM.DisplayDescrip('prvTGE', 'TGE104', 'TDIARID,TDIARDES,AUTONUM', 'FLAGALM=' + quotedstr('S'), 'TDIARID');

   If dblcdPeriodo.text <= '201012' Then
   Begin
      sSQL := 'SELECT CNT311.*, TGE101.CIADES FROM CNT311, TGE101 ' +
         ' WHERE CNT311.CIAID>=''02'' AND TDIARID=' + quotedstr(sTDiario) +
         ' AND CNTANOMM=' + quotedstr(dblcdPeriodo.text) + ' AND CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text) +
         ' AND CNTESTADO=''I'' ' +
         ' AND CNT311.CIAID=TGE101.CIAID ' +
         'ORDER BY CNT311.CIAID, TDIARID, CNTANOMM, CNTNODOC, CNTSERIE, CNTREG';
      DMALM.cdsReporte.Close;
      DMALM.cdsReporte.DataRequest(sSQL);
      DMALM.cdsReporte.Open;

      If DMALM.cdsReporte.recordcount <= 0 Then
      Begin
         sSQL := 'SELECT CNT301.*, TGE101.CIADES FROM CNT301, TGE101 ' +
            ' WHERE CNT301.CIAID>=''02'' AND TDIARID=' + quotedstr(sTDiario) +
            ' AND CNTANOMM=' + quotedstr(dblcdPeriodo.text) + ' AND CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text) +
            ' AND CNTESTADO=''P'' ' +
            ' AND CNT301.CIAID=TGE101.CIAID ' +
            ' ORDER BY CNT301.CIAID, TDIARID, CNTANOMM, CNTNODOC, CNTSERIE, CNTREG ';
         DMALM.cdsReporte.Close;
         DMALM.cdsReporte.DataRequest(sSQL);
         DMALM.cdsReporte.Open;
      End;
   End
   Else
   Begin
      sSQL := 'SELECT CNT311.*, TGE101.CIADES FROM CNT311, TGE101 ' +
         ' WHERE CNT311.CIAID>=''02'' AND TDIARID=' + quotedstr(sTDiario) +
         ' AND CNTANOMM>=''201101'' AND CNTLOTE=' + QuotedStr(dblcCIA.text + dblcTALM.text) +
         ' AND CNTESTADO=''I'' ' +
         ' AND CNT311.CIAID=TGE101.CIAID ' +
       // ' and CNTCOMPROB like ''00000' + Copy(dblcdPeriodo.text, 5, 2) + '%'' ' +  rmz
      ' and CNTCOMPROB like ''00000' + Copy(meMesCNT.text, 5, 2) + '%'' ' +
         'ORDER BY CNT311.CIAID, TDIARID, CNTANOMM, CNTNODOC, CNTSERIE, CNTREG';
      DMALM.cdsReporte.Close;
      DMALM.cdsReporte.DataRequest(sSQL);
      DMALM.cdsReporte.Open;
   End;

   sTDiario := DMALM.DisplayDescrip('prvTGE', 'TGE104', 'TDIARID,TDIARDES,AUTONUM', 'FLAGALM=' + quotedstr('S'), 'TDIARID');
   If DMALM.cdsReporte.RecordCount = 0 Then
      Raise Exception.Create('No existen registros que mostrar');

   dbpbDetallado.DataSource := DMALM.dsReporte;
   ppRepDetalla.DataPipeline := dbpbDetallado;

   ppRepDetalla.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ComprDetalladoNew.rtm';
   ppRepDetalla.Template.LoadFromFile;
   pplblDTit.caption := ' LISTADO RESUMIDO DE COMPROBANTES';
   pplblDSubTit.caption := ' PERIDO: ' + dblcdPeriodo.text + '   T. Diario: ' + sTDiario + ' ' + DMALM.cdsQry.FieldbyName('TDIARDES').AsString;

   ppd1.Report := ppRepDetalla;
   If cbDiseno.Checked Then
      ppd1.showModal
   Else
      ppRepDetalla.Print;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
   dbpbDetallado.DataSource := Nil;
   ppd1.Report := Nil;
End;

Procedure TFContab.sbDisenoClick(Sender: TObject);
Begin
   cbDiseno.Checked := Not cbDiseno.Checked;
End;

Procedure TFContab.BitBtn3Click(Sender: TObject);
Var
   sql: String;
   anomes: integer;
Begin

   anomes := 201201;
   While anomes <= 202012 Do
   Begin

      xsql := ' Delete tge813 where anomes=''' + trim(inttostr(anomes)) + ''' ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xsql);
      Except
      End;

      xsql := 'Insert into tge813(anomes) values(''' + trim(inttostr(anomes)) + ''')';
      DMALM.DCOM1.AppServer.EjecutaSQL(xsql);

      anomes := anomes + 1;
      If copy(inttostr(anomes), 5, 2) = '13' Then
         anomes := strtoint(inttostr(strtoint(copy(inttostr(anomes), 1, 4)) + 1) + '01');

   End;

End;

Procedure TFContab.BitBtn4Click(Sender: TObject);
Var
   XSQL: String;
Begin

   XSQL := 'DELETE FROM CNT311 WHERE CIAID>=''02'' AND TDIARID=''39''   and CNTANOMM=''201312'' AND CNTLOTE=''0201'' ';
   DMALM.DCOM1.AppServer.EjecutaSQL(xsql);

   XSQL := 'DELETE FROM CNT300 WHERE CIAID>=''02'' AND TDIARID=''39''   and CNTANOMM=''201312'' AND CNTLOTE=''0201'' ';
   DMALM.DCOM1.AppServer.EjecutaSQL(xsql);

End;

End.

