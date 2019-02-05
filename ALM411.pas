Unit ALM411;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, Menus, ComCtrls, StdCtrls, ppDB, ppDBPipe, ppCtrls, ppBands,
   ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
   Buttons, Mask, wwdbedit, wwdblook, ppViewr, ppTypes, MsgDlgs;

Type
   TFKardex = Class(TForm)
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      pprDetalle: TppReport;
      pprResumen: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel13: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel15: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      pplblRTitulo: TppLabel;
      ppLabel17: TppLabel;
      ppColumnHeaderBand1: TppColumnHeaderBand;
      ppLabel19: TppLabel;
      ppLabel26: TppLabel;
      ppLabel18: TppLabel;
      ppLabel23: TppLabel;
      ppLabel33: TppLabel;
      ppLabel28: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText1: TppDBText;
      pplblRGStkActual: TppLabel;
      pplblRUStkActual: TppLabel;
      ppColumnFooterBand1: TppColumnFooterBand;
      ppFooterBand2: TppFooterBand;
      ppLabel36: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLabel25: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppdbtxtResArtID: TppDBText;
      ppDBText13: TppDBText;
      pplblRGStkInicial: TppLabel;
      pplblRUStkInicial: TppLabel;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppLabel16: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel37: TppLabel;
      pplblRGStkFinal: TppLabel;
      pplblRUStkFinal: TppLabel;
      ppdbFuente: TppDBPipeline;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      pmArticulos: TPopupMenu;
      pmArticulosMarcar: TMenuItem;
      pmArticulosDesmarcar: TMenuItem;
      rgTipoReporte: TRadioGroup;
      dblcTINID: TwwDBLookupCombo;
      edtTINID: TwwDBEdit;
      dblcGArti: TwwDBLookupCombo;
      edtGArti: TwwDBEdit;
      dblcFAM: TwwDBLookupCombo;
      edtFAM: TwwDBEdit;
      dblcSUBFAM: TwwDBLookupCombo;
      edtSUBFAM: TwwDBEdit;
      lblTMON: TLabel;
      lblGrArtID: TLabel;
      lblFAM: TLabel;
      lblSUBFAM: TLabel;
      lblCIA: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      Label2: TLabel;
      dblcTALM: TwwDBLookupCombo;
      dbeALM: TwwDBEdit;
      Label1: TLabel;
      dblcLOC: TwwDBLookupCombo;
      dbeLOC: TwwDBEdit;
      lblNSolCot: TLabel;
      lvArticulos: TwwDBEdit;
      edtArti: TwwDBEdit;
      rgTipoStocValo: TRadioGroup;
      ppHeaderBand1: TppHeaderBand;
      ppLabel20: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppLabel21: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel22: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      pplblTitulo: TppLabel;
      pplblLin0: TppLabel;
      pplblLin1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel6: TppLabel;
      ppLabel12: TppLabel;
      ppLabel9: TppLabel;
      ppLabel1: TppLabel;
      ppLabel14: TppLabel;
      ppLabel24: TppLabel;
      ppLabel27: TppLabel;
      ppLabel29: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel34: TppLabel;
      ppLabel38: TppLabel;
      ppLine2: TppLine;
      ppdetbDetalle: TppDetailBand;
      pplblUStkActual: TppLabel;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText12: TppDBText;
      ppDBText14: TppDBText;
      ppLabel35: TppLabel;
      ppDBText15: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppLabel30: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppVariable1: TppVariable;
      ppLine1: TppLine;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppVariable2: TppVariable;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppDBText2: TppDBText;
      pptxtArtiId: TppDBText;
      ppDBText9: TppDBText;
      ppGroupFooterBand2: TppGroupFooterBand;
      Procedure bbtnCancClick(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure pprDetallePreviewFormCreate(Sender: TObject);
      Procedure pprResumenPreviewFormCreate(Sender: TObject);
      Procedure pprDetalleBeforePrint(Sender: TObject);
      Procedure ppVariable1Calc(Sender: TObject; Var Value: Variant);
      Procedure dtpDesdeExit(Sender: TObject);
      Procedure dtpHastaExit(Sender: TObject);
      Procedure ppVariable2Calc(Sender: TObject; Var Value: Variant);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
      Procedure CalcularKardex();
   Public
    { Public declarations }
   End;

Var
   FKardex: TFKardex;
   wTipMed: String;

Implementation

Uses ALMDM1;

{$R *.DFM}

Procedure TFKardex.bbtnCancClick(Sender: TObject);
Begin
   DMALM.cdsSTK.Cancel;
   Close;
End;

Procedure TFKardex.bbtnOkClick(Sender: TObject);
Begin
   CalcularKardex();
End;

Procedure TFKardex.CalcularKardex();
Var
   Temp, SalIniDes, SalIniHas, sDesde, sHasta, sASeleccionados: String;
   CntGFNameG, CntGFNameU, sCia, sSQL, sSALDO, sTOTAL, {sTemp,} sWhere, xDesUMed: String;
   SalIniG, sTOTINGG, sTOTSALG: DOUBLE;
   SalIniU, sTOTINGU, sTOTSALU: DOUBLE;
   D, M, Y: Word;
  //i : longint;
Begin
   If dtpDesde.Date > dtpHasta.Date Then
   Begin
      ErrorMsg(Caption, ' La Fecha Hasta no puede ser Menor a la Fecha Desde');
      Exit;
   End;
  {if dtpHasta.Date > Date then
  begin
   ErrorMsg(Caption, ' La Fecha Hasta no puede ser Mayor a la Fecha del Sistema ');
    Exit;
  end;}
   Screen.Cursor := crHourGlass;
   If rgTipoStocValo.ItemIndex = 0 Then
   Begin
      If wTipMed = '1' Then
      Begin
         pprDetalle.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexGen.Rtm';
         pprDetalle.template.LoadFromFile
      End
      Else
      Begin
         pprDetalle.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexUni.Rtm';
         pprDetalle.template.LoadFromFile
      End
   End
   Else
   Begin
      If wTipMed = '1' Then
      Begin
         pprDetalle.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexValor.Rtm';
         pprDetalle.template.LoadFromFile
      End
      Else
      Begin
         pprDetalle.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexValor.Rtm';
         pprDetalle.template.LoadFromFile
      End
   End;

   sTOTSALG := 0;
   sTOTINGG := 0;
   sTOTSALU := 0;
   sTOTINGU := 0;
   DecodeDate(dtpDesde.Date, Y, M, D);
   SalIniDes := '01' + '/' + IntToStr(M) + '/' + IntToStr(Y);
   If D = 1 Then
      SalIniHas := IntToStr(D) + '/' + IntToStr(M) + '/' + IntToStr(Y)
   Else
      SalIniHas := IntToStr(D - 1) + '/' + IntToStr(M) + '/' + IntToStr(Y);

   CntGFNameG := 'STKTSG' + DMALM.StrZero(IntToStr(M), 2);
   CntGFNameU := 'STKTSU' + DMALM.StrZero(IntToStr(M), 2);

   sSQL := 'ARTID=''' + lvArticulos.text + ''' AND CIAID= ''' + dblcCia.Text + '''';
   DMALM.DisplayDescrip('prvLOG', 'LOG316', CntGFNameG, sSQL, CntGFNameG);
   Temp := DMALM.cdsQry.FieldByName(CntGFNameG).AsString;
   If Temp = '' Then
      SalIniG := 0
   Else
      SalIniG := StrToFloat(Temp);

   DMALM.DisplayDescrip('prvLOG', 'LOG316', CntGFNameU, sSQL, CntGFNameU);
   Temp := DMALM.cdsQry.FieldByName(CntGFNameU).AsString;
   If Temp = '' Then
      SalIniU := 0
   Else
      SalIniU := StrToFloat(Temp);

   SalIniDes := quotedStr(formatdatetime(DMALM.wFormatFecha, strtodatetime(SalIniDes)));
   SalIniHas := quotedStr(formatdatetime(DMALM.wFormatFecha, strtodatetime(SalIniHas)));
   sDesde := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));
   sCia := quotedStr(dblcCia.Text);
   sASeleccionados := '';
   sASeleccionados := 'MOV.ARTID=' + quotedstr(lvArticulos.text);

   sWhere := ' AND MOV.ALMID=' + quotedStr(dblcTALM.text);
   sWhere := sWhere + ' AND MOV.LOCID=' + quotedStr(dblcLOC.text);
   If edtTINID.text <> '' Then
      sWhere := sWhere + ' AND MOV.TINID=' + quotedStr(dblcTINID.text);
   If edtGArti.Text <> '' Then
      sWhere := sWhere + ' AND MOV.GRARID=' + quotedStr(dblcGArti.Text);
   If edtFAM.Text <> '' Then
      sWhere := sWhere + ' AND MOV.FAMID=' + quotedStr(dblcFAM.Text);
   If edtSUBFAM.Text <> '' Then
      sWhere := sWhere + ' AND MOV.SFAMID=' + quotedStr(dblcSUBFAM.Text);

   If D > 1 Then
   Begin
      sTOTAL := 'SELECT ' +
         ' ' + DMALM.wReplacCeros + '(SUM(CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (0) END),0) TOTINGG, ' +
         ' ' + DMALM.wReplacCeros + '(SUM(CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG) ELSE (0) END),0) TOTSALG, ' +
         ' ' + DMALM.wReplacCeros + '(SUM(CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (0) END),0) TOTINGU, ' +
         ' ' + DMALM.wReplacCeros + '(SUM(CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU) ELSE (0) END),0) TOTSALU ' +
         ' FROM LOG315 AS MOV ' +
         'WHERE MOV.CIAID=' + sCia + ' AND ' +
         'MOV.NISAFDOC>=' + SalIniDes + ' AND ' +
         'MOV.NISAFDOC<=' + SalIniHas +
         sWhere + ' AND ' +
         sASeleccionados;
      DMALM.cdsReporte.Close;
      DMALM.cdsReporte.DataRequest(sTOTAL);
      DMALM.cdsReporte.Open;
      sTOTSALG := DMALM.cdsReporte.FieldByName('TOTSALG').AsFloat;
      sTOTINGG := DMALM.cdsReporte.FieldByNAme('TOTINGG').AsFloat;
      sTOTSALU := DMALM.cdsReporte.FieldByName('TOTSALU').AsFloat;
      sTOTINGU := DMALM.cdsReporte.FieldByNAme('TOTINGU').AsFloat;
   End
   Else
      If D = 1 Then
      Begin
         sTOTSALG := 0;
         sTOTINGG := 0;
         sTOTSALU := 0;
         sTOTINGU := 0;
      End;
   sSALDO := ' SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, DATE(' + SalIniHas + ') NISAFREG, ''00'' TDAID, '''' TDAABR, MOV.ARTFUC, ' +
      ' MOV.ARTID, ART.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, ''Saldo Inicial'' NISAID, ' +
      ' '' '' NISATIP, ' + FloatToStr(SalIniG + sTOTINGG - sTOTSALG) + ' SALDOG, ' + FloatToStr(SalIniU + sTOTINGU - sTOTSALU) + ' SALDOU, ' +
      ' 0 KDXCNTGI, 0 KDXCNTUI, 0 KDXCNTGS, 0 KDXCNTUS, ARTCPROG, ARTCPROU, ' +
      ' 0 KDXCPROGI, 0 KDXCPROUI, 0 KDXCPROGS, 0 KDXCPROUS ' +
      ' FROM LOG316 AS MOV ' +
      ' LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) ' +
      ' LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) ' +
      ' LEFT JOIN TGE205 ART   ON ( MOV.ARTID=ART.ARTID )' +
      ' WHERE MOV.CIAID=' + sCia +
      sWhere + ' AND ' +
      sASeleccionados +
      ' UNION ALL ';
   If rgTipoReporte.ItemIndex = 0 Then
   Begin
    // ppDetallado
      sSQL := 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.NISAFDOC NISAFREG, MOV.TDAID, DOC.TDAABR, MOV.ARTFUC, ' +
         'MOV.ARTID, ART.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, ' +
         'MOV.NISAID, MOV.NISATIP, 0 SALDOG, 0 SALDOU, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (0) END AS KDXCNTGI, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (0) END AS KDXCNTUI, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG) ELSE (0) END AS KDXCNTGS, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU) ELSE (0) END AS KDXCNTUS, ART.ARTCPROG, ART.ARTCPROU, ' +

      'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG * ART.ARTCPROG) ELSE (0) END AS KDXCPROGI, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU * ART.ARTCPROU) ELSE (0) END AS KDXCPROUI, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG * ART.ARTCPROG) ELSE (0) END AS KDXCPROGS, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU * ART.ARTCPROU) ELSE (0) END AS KDXCPROUS ' +
         'FROM LOG315 AS MOV ' +
         'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) ' +
         'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) ' +
         'LEFT JOIN TGE157 DOC   ON ( MOV.TDAID=DOC.TDAID ) ' +
         'LEFT JOIN TGE205 ART   ON ( MOV.ARTID=ART.ARTID ) ' +
         'WHERE MOV.CIAID=' + sCia + ' AND ' +
         'MOV.NISAFDOC>=' + sDesde + ' AND ' +
         'MOV.NISAFDOC<=' + sHasta +
         sWhere + ' AND ' +
         sASeleccionados;
    //sSQL := sSQL + ' ORDER BY MOV.ARTID, MOV.ARTFUC, DOC.TDAABR, MOV.NISATIP';
      If wTipMed = '1' Then
         xDesUMed := 'General'
      Else
         xDesUMed := 'Unitaria';
      If rgTipoStocValo.ItemIndex = 0 Then
         pplblTitulo.Caption := 'KARDEX DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + '  U. de Medida ' + xDesUMed
      Else
         pplblTitulo.Caption := 'KARDEX VALORIZADO DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + '  U. de Medida ' + xDesUMed;
   End;
  {else
  begin
    sSQL := 'SELECT MOV.CIAID,  MOV.LOCID,  MOV.ALMID,  MOV.TDAID, DOC.TDAABR, '+
                  'MOV.ARTID, ART.ARTDES, MOV.UNMIDG, MOV.UNMIDU, UMEDG.UNMDES UMEDGDES, UMEDU.UNMDES UMEDUDES, '+
                  'CASE WHEN MOV.NISATIP =' +quotedStr('INGRESO')+ ' THEN SUM(MOV.KDXCNTG) ELSE SUM(-1*MOV.KDXCNTG) END AS KDXCNTG, '+
                  'CASE WHEN MOV.NISATIP =' +quotedStr('INGRESO')+ ' THEN SUM(MOV.KDXCNTU) ELSE SUM(-1*MOV.KDXCNTU) END AS KDXCNTU '+
            'FROM LOG315 AS MOV '+
                     'LEFT JOIN TGE157 DOC   ON ( MOV.TDAID=DOC.TDAID ) '+
                     'LEFT JOIN TGE205 ART   ON ( MOV.ARTID=ART.ARTID ) '+
                     'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) '+
                     'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) ' +
            'WHERE MOV.CIAID=' +sCia+ ' AND '+
                     'MOV.NISAFREG>=' +sDesde+ ' AND '+
                     'MOV.NISAFREG<=' +sHasta+
                      sWhere +' AND '+
                      sASeleccionados+
            ' GROUP BY '+
                      'MOV.ARTID, MOV.TDAID, MOV.CIAID, MOV.LOCID, MOV.ALMID, ART.ARTDES, '+
                      'MOV.UNMIDG, UMEDg.UNMDES, MOV.UNMIDU, UMEDu.UNMDES, MOV.NISATIP, DOC.TDAABR'+
            ' ORDER BY MOV.ARTID, MOV.TDAID';
    pplblRTitulo.Caption := 'RESUMEN DE MOVIMIENTOS DE PRODUCTOS DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);
  end;}
   DMALM.cdsKDXTemp.Close;
   DMALM.cdsKDXTemp.ProviderName := 'prvKDXTemp';
   sSQL := sSALDO + sSQL;
   DMALM.cdsKDXTemp.DataRequest(sSQL);
   DMALM.cdsKDXTemp.Open;
   Screen.Cursor := crDefault;
   If DMALM.cdsKDXTemp.recordCount = 0 Then
   Begin
      ShowMessage('Error, No Existen Registros para esta Consulta');
      lvArticulos.SetFocus;
      exit;
   End;
   If rgTipoReporte.ItemIndex = 0 Then
      pprDetalle.Print
  //else
    //pprResumen.Print;
End;

Procedure TFKardex.FormActivate(Sender: TObject);
Var
   sWhere: String;
Begin
   dblcCIA.Text := DMALM.cdsSTK.FieldByName('CIAID').AsString;
   dblcLOC.Text := DMALM.cdsSTK.FieldByName('LOCID').AsString;
   dblcTALM.Text := DMALM.cdsSTK.FieldByName('ALMID').AsString;
   dblcTINID.Text := DMALM.cdsSTK.FieldByName('TINID').AsString;
   dblcGArti.Text := DMALM.cdsSTK.FieldByName('GRARID').AsString;
   dblcFAM.Text := DMALM.cdsSTK.FieldByName('FAMID').AsString;
   dblcSUBFAM.Text := DMALM.cdsSTK.FieldByName('SFAMID').AsString;
   lvArticulos.Text := DMALM.cdsSTK.FieldByName('ARTID').AsString;

   sWhere := 'CIAID=' + quotedstr(dblcCIA.Text);
   dbeCIA.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', sWhere, 'CIADES');
   sWhere := 'LOCID=' + quotedstr(dblcLOC.Text);
   dbeLOC.Text := DMALM.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', sWhere, 'LOCDES');
   sWhere := 'ALMID=' + quotedstr(dblcTALM.Text);
   dbeALM.Text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', sWhere, 'ALMDES');
   sWhere := 'TINID=' + quotedstr(dblcTINID.Text);
   edtTINID.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', sWhere, 'TINDES');
   sWhere := 'GRARID=' + quotedstr(dblcGArti.Text);
   edtGArti.Text := DMALM.DisplayDescrip('prvTGE', 'TGE131', 'GRARDES', sWhere, 'GRARDES');
   sWhere := 'FAMID=' + quotedstr(dblcFAM.Text);
   edtFAM.Text := DMALM.DisplayDescrip('prvTGE', 'TGE169', 'FAMDES', sWhere, 'FAMDES');
   sWhere := 'SFAMID=' + quotedstr(dblcSUBFAM.Text);
   edtSUBFAM.Text := DMALM.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', sWhere, 'SFAMDES');
   sWhere := 'ARTID=' + quotedstr(lvArticulos.Text);
   edtArti.Text := DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES', sWhere, 'ARTDES');
   If DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT', sWhere, 'ARTCONT') = '1' Then
      wTipMed := '1'
   Else
      wTipMed := '2';
   dtpDesde.Date := Date;
   dtpHasta.Date := Date;
End;

Procedure TFKardex.pprDetallePreviewFormCreate(Sender: TObject);
Begin
   pprDetalle.PreviewForm.ClientHeight := 500;
   pprDetalle.PreviewForm.ClientWidth := 650;
   TppViewer(pprDetalle.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFKardex.pprResumenPreviewFormCreate(Sender: TObject);
Begin
   pprResumen.PreviewForm.ClientHeight := 500;
   pprResumen.PreviewForm.ClientWidth := 650;
   TppViewer(pprResumen.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

{
SELECT MOV.CIAID,  MOV.LOCID,   MOV.ALMID,  MOV.NISAFREG, MOV.TDAID, DOC.TDAABR, MOV.ARTFUC, MOV.ARTID,
ART.ARTDES,  MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, MOV.NISAID, MOV.NISATIP,
CASE WHEN MOV.NISATIP ='INGRESO' THEN (MOV.KDXCNTG) ELSE (0) END AS KDXCNTGI,
CASE WHEN MOV.NISATIP ='INGRESO' THEN (MOV.KDXCNTU) ELSE (0) END AS KDXCNTUI,
CASE WHEN MOV.NISATIP ='SALIDA' THEN (MOV.KDXCNTG) ELSE (0) END AS KDXCNTGS,
CASE WHEN MOV.NISATIP ='SALIDA' THEN (MOV.KDXCNTU) ELSE (0) END AS KDXCNTUS

FROM LOG315 AS MOV
LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID )
LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID )
LEFT JOIN TGE157 DOC   ON ( MOV.TDAID=DOC.TDAID )
LEFT JOIN TGE205 ART   ON ( MOV.ARTID=ART.ARTID )
WHERE MOV.CIAID='01'
AND MOV.NISAFREG>='2001-01-09'
AND MOV.NISAFREG<='2001-01-29'
AND MOV.ALMID='01'
AND MOV.LOCID='01'
AND MOV.TINID='01'
AND MOV.GRARID='07'
AND MOV.ARTID='S07553'
ORDER BY MOV.ARTID, MOV.ARTFUC, DOC.TDAABR, MOV.NISATIP
}

Procedure TFKardex.pprDetalleBeforePrint(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + quotedstr(FKardex.dblcCIA.text);
   ppLabel24.Caption := FKardex.edtTINID.Text;
   ppLabel27.Caption := FKardex.edtGArti.Text;
   ppLabel29.Caption := DMALM.DisplayDescrip('prvCIA', 'TGE101', '*', sSQL, 'CIADES');
End;

Procedure TFKardex.ppVariable1Calc(Sender: TObject; Var Value: Variant);
Begin
   value := StrToFloat(ppDBCalc5.Text) + StrToFloat(ppDBCalc1.Text) - StrToFloat(ppDBCalc2.Text);
End;

Procedure TFKardex.dtpDesdeExit(Sender: TObject);
Begin
   If dtpDesde.Date > dtpHasta.Date Then
      ErrorMsg(Caption, ' La Fecha Hasta no puede ser Menor a la Fecha Desde');
End;

Procedure TFKardex.dtpHastaExit(Sender: TObject);
Begin
  //if dtpHasta.Date > Date() then
   //ErrorMsg(Caption, ' La Fecha Hasta no puede ser Mayor a la Fecha del Sistema ');
End;

Procedure TFKardex.ppVariable2Calc(Sender: TObject; Var Value: Variant);
Begin
   value := StrToFloat(ppDBCalc6.Text) + StrToFloat(ppDBCalc7.Text) - StrToFloat(ppDBCalc8.Text);
End;

{                  //'CASE WHEN MOV.NISATIP =' +quotedStr('INGRESO')+ ' THEN (MOV.KDXCNTG) ELSE (-1*MOV.KDXCNTG) END AS KDXCNTG, '+
                  //'CASE WHEN MOV.NISATIP =' +quotedStr('INGRESO')+ ' THEN (MOV.KDXCNTU) ELSE (-1*MOV.KDXCNTU) END AS KDXCNTU '+

}

Procedure TFKardex.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
End;

End.

