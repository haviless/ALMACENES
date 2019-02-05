Unit ALM770;
// MODIFICADO POR     : Abelardo Sulca Palomino
// Nº HPP             : HPP_201103_ALM
// FECHA MODIFICACION : 21/03/2011
// DESCRIPCION        : Se agrega el botón "Rpt Activos Sin Salida" que invoca
//                      a la ventana de Reporte de Activos sin Salida
//*********************************************************
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, StdCtrls, Buttons, ExtCtrls, ppProd, ppClass, ppReport, ppComm,
   ppRelatv, ppCache, ppDB, ppDBPipe, ppPrnabl, ppCtrls, ppBands,
   ppVar, ppViewr, ppEndUsr, ppTypes, MsgDlgs;

Type
   TFToolSA = Class(TForm)
      pnlTool: TPanel;
      Z1bbtNIngreso: TBitBtn;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      BitBtn1: TBitBtn;
      ppDBNS: TppDBPipeline;
      ppField1: TppField;
      ppField2: TppField;
      ppField3: TppField;
      ppField4: TppField;
      ppField5: TppField;
      ppField6: TppField;
      ppField7: TppField;
      ppField8: TppField;
      ppField9: TppField;
      ppField10: TppField;
      ppField11: TppField;
      ppField12: TppField;
      ppField13: TppField;
      ppField14: TppField;
      ppField15: TppField;
      ppField16: TppField;
      ppField17: TppField;
      ppField18: TppField;
      ppField19: TppField;
      ppRNS: TppReport;
      ppDBSalidaAcum: TppDBPipeline;
      ppRSalidaAcum: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLine1: TppLine;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel10: TppLabel;
      pplbluser: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel11: TppLabel;
      pplblAno: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppFooterBand1: TppFooterBand;
      BitBtn2: TBitBtn;
      ppRCarta: TppReport;
      ppDBCarta: TppDBPipeline;
      ppHeaderBand3: TppHeaderBand;
      ppLabel30: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppSystemVariable8: TppSystemVariable;
      ppSystemVariable9: TppSystemVariable;
      pplblCIA1: TppLabel;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      pplblNDocRef1: TppLabel;
      ppLabel52: TppLabel;
      pplblTCambio1: TppLabel;
      pplblDocRef1: TppLabel;
      pplblProv1: TppLabel;
      pplblProvDes1: TppLabel;
      pplblDocId1: TppLabel;
      pplblDocDes1: TppLabel;
      ppLabel59: TppLabel;
      ppLbl60: TppLabel;
      ppLabel61: TppLabel;
      pplblOCompra1: TppLabel;
      ppDBText18: TppDBText;
      pplblNISA1: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppFooterBand3: TppFooterBand;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppLabel64: TppLabel;
      ppLine7: TppLine;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppLabel65: TppLabel;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBCalc16: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppDBCalc19: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      ppLabel66: TppLabel;
      ppHeaderBand2: TppHeaderBand;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppSystemVariable6: TppSystemVariable;
      pplblCIA: TppLabel;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      pplblNDocRef: TppLabel;
      ppLabel28: TppLabel;
      pplblTCambio: TppLabel;
      pplblDocRef: TppLabel;
      pplblProv: TppLabel;
      pplblProvDes: TppLabel;
      pplblDocId: TppLabel;
      pplblDocDes: TppLabel;
      ppLabel29: TppLabel;
      pplblUsuario: TppLabel;
      ppLabel31: TppLabel;
      lblOCompra: TppLabel;
      ppDBText26: TppDBText;
      pplblNISA: TppLabel;
      ppLabel38: TppLabel;
      ppLabel51: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppLabel32: TppLabel;
      ppLine4: TppLine;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppLabel33: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppLabel34: TppLabel;
      ppDesigner1: TppDesigner;
      Timer1: TTimer;
      btnActivosSinSalida: TBitBtn;
      Procedure FormCreate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure ppRSalidaAcumPreviewFormCreate(Sender: TObject);
      Procedure Z1bbtNIngresoClick(Sender: TObject);
      Procedure ppRNSPreviewFormCreate(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure btnActivosSinSalidaClick(Sender: TObject);
   Private
    { Private declarations }
      wODCIDs: String;
   Public
    { Public declarations }
   End;

Var
   FToolSA: TFToolSA;
   xAccesoBotones: Boolean;

Implementation

//INICIO HPP_201103_ALM
//uses ALMDM1, ALM411, oaIN4000; //ALM001;
Uses ALMDM1, ALM411, oaIN4000, ALM771;
//FIN HPP_201103_ALM
{$R *.DFM}

Procedure TFToolSA.FormCreate(Sender: TObject);
Begin
   dtpHasta.Date := DateS;
End;

Procedure TFToolSA.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
    //if self.ActiveControl Is TDBMemo then Exit;
    //if self.ActiveControl Is TMemo then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFToolSA.BitBtn1Click(Sender: TObject);
Var
   sSQL, xSQL, xWhere, sWhere, XaNO: String;
   sDesde, sHasta, strans: String;
   iX, iY: integer;
   Y, M, D: word;
Begin
   If dtpDesde.Date = 0 Then
   Begin
      dtpDesde.SetFocus;
      Showmessage('Falta Fecha Inicial de Reporte');
      exit;
   End;

   If dtpHasta.Date = 0 Then
   Begin
      dtpHasta.SetFocus;
      Showmessage('Falta Fecha Final de Reporte');
      exit;
   End;

   If (dtpDesde.Date > dtpHasta.Date) Then
   Begin
      dtpHasta.Date := dtpDesde.Date;
      dtpHasta.setfocus;
      Raise exception.Create('Error: F.Final debe ser mayor/igual' + #13 + ' a la Fecha de Inicio');
   End;

   DecodeDate(dtpHasta.Date, Y, M, D);

   xSQL := mtx4000.FMant.SQL;
   For iX := 0 To Length(xsql) Do
   Begin
      If copy(xSQL, iX, 5) = 'WHERE' Then
      Begin
         xwhere := copy(xSQL, iX + 6, length(xSQL));
         break;
      End;
   End;

   For iY := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iY, 8) = 'ORDER BY' Then
      Begin
         xwhere := copy(xWhere, 1, iY - 2);
         break;
      End;
   End;

   sDesde := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.Date));
   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.Date));

   sWhere := xWhere;

   If length(sWhere) = 0 Then
      Raise exception.Create('Seleccione una Condición de Búsqueda...');

   sTrans := DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRIID', 'TRIFLAGV=''A'' AND TRIDEVPED=''S'' ', 'TRIID');

   Screen.Cursor := crHourGlass;
 ////SALIDAS X AÑO INCLUYE TOTAL ACUM X AÑO, PROM X AÑO , STOK FISICO ACTUAL
   sSQL := 'SELECT  KDXANO, ARTID, ARTDES, SUM(SALACUM) TOTACUM, SUM(SALACUM)/COUNT(*) PROM, SUM(STOCK) STK, 0 STKACT ' +
      'FROM( ' +
      'SELECT  KDXANO, KDXMM, LOG315.ARTID, TGE205.ARTDES, SUM(KDXCNTG) SALACUM, SUM(LOG316.STKSACTG) STOCK, 0.00 MES ' +
      'FROM LOG315, TGE205, LOG316';
   If length(sWhere) > 0 Then
      sSQL := sSQL + ' WHERE ' + sWhere + ' AND NISAFREG>=' + sDesde
   Else
      sSQL := sSQL + ' WHERE NISAFREG>=' + sDesde;

   sSQL := sSQL + ' AND NISAFREG<=' + sHasta + ' ' +
      'AND LOG315.CIAID=TGE205.CIAID AND LOG315.TINID=TGE205.TINID AND LOG315.ARTID=TGE205.ARTID ' +
      'AND LOG316.STKANO=LOG315.KDXANO AND LOG316.CIAID=LOG315.CIAID ' +
      'AND LOG316.LOCID=LOG315.LOCID  AND LOG316.TINID=LOG315.TINID ' +
      'AND LOG316.ALMID=LOG315.ALMID AND LOG316.ARTID=LOG315.ARTID ' +
      'GROUP BY KDXANO,KDXMM,LOG315.ARTID,TGE205.ARTDES ' +
      ')XX ' +
      'GROUP BY KDXANO, ARTID, ARTDES';
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;
  ////SALIDAS X AÑO INCLUYE TOTAL ACUM DEL MES ACTUAL
   If DMALM.cdsReporte.RecordCount > 0 Then
   Begin
      sSQL := 'SELECT KDXANO,LOG315.ARTID,TGE205.ARTDES, 0 TOTACUM ,0 PROM ,SUM(KDXCNTG) STKACT ' +
         'FROM LOG315, TGE205';
      If length(sWhere) > 0 Then
         sSQL := sSQL + ' WHERE ' + sWhere + ' AND TO_NUMBER(TO_CHAR(LOG315.NISAFREG,''YYYY''))=' + Floattostr(Y)
      Else
         sSQL := sSQL + ' WHERE TO_NUMBER(TO_CHAR(LOG315.NISAFREG,''YYYY''))=' + Floattostr(Y);

      sSQL := sSQL + ' AND TO_NUMBER(TO_CHAR(LOG315.NISAFREG,''MM''))= ' + Floattostr(M) + ' ' +
         'AND LOG315.CIAID=TGE205.CIAID AND LOG315.TINID=TGE205.TINID AND LOG315.ARTID=TGE205.ARTID ' +
         'GROUP BY KDXANO, LOG315.ARTID, TGE205.ARTDES';

      DMALM.cdsQry2.Close;
      DMALM.cdsQry2.DataRequest(sSQL);
      DMALM.cdsQry2.Open;
      DMALM.cdsQry2.IndexFieldNames := '';
      DMALM.cdsQry2.IndexFieldNames := 'KDXANO;ARTID';
  // INGRESOS X DEVOLUCION DE PEDIDO X AÑO
      sSQL := 'SELECT KDXANO, ARTID, ARTDES, SUM(SALACUM) TOTACUM, SUM(SALACUM)/COUNT(*) PROM, SUM(STOCK) STK, 0 STKACT ' +
         'FROM( ' +
         'SELECT  KDXANO, KDXMM, LOG315.ARTID, TGE205.ARTDES, SUM(KDXCNTG) SALACUM, 0 STOCK, 0.00 MES ' +
         'FROM LOG315, TGE205 ' +
         'WHERE NISATIP=''INGRESO'' ' +
         'AND TRIID='''' ' +
         'AND LOG315.CIAID=TGE205.CIAID AND LOG315.TINID=TGE205.TINID AND LOG315.ARTID=TGE205.ARTID ' +
         'GROUP BY  KDXANO, KDXMM, LOG315.ARTID, TGE205.ARTDES ' +
         ')XX ' +
         'GROUP BY KDXANO, ARTID, ARTDES';
      DMALM.cdsQry4.Close;
      DMALM.cdsQry4.DataRequest(sSQL);
      DMALM.cdsQry4.Open;
      DMALM.cdsQry4.IndexFieldNames := '';
      DMALM.cdsQry4.IndexFieldNames := 'KDXANO;ARTID';

      If DMALM.cdsReporte.RecordCount > 0 Then
      Begin
         DMALM.cdsReporte.First;
         While Not DMALM.cdsReporte.Eof Do
         Begin
            If wRptCia = 'Incoresa' Then
               If DMALM.cdsReporte.FieldByName('ARTID').AsString = '010404' Then
                  XaNO := DMALM.cdsReporte.FieldByName('KDXANO').AsString;
            DMALM.cdsQry2.SetKey;
            DMALM.cdsQry2.FieldByName('KDXANO').AsString := DMALM.cdsReporte.fieldbyname('KDXANO').AsString;
            DMALM.cdsQry2.FieldByName('ARTID').AsString := DMALM.cdsReporte.fieldbyname('ARTID').AsString;
            If DMALM.cdsQry2.GotoKey Then
            Begin
               DMALM.cdsReporte.Edit;
               DMALM.cdsReporte.FieldByName('STKACT').AsFloat := DMALM.cdsQry2.FieldByName('STKACT').AsFloat;
               DMALM.cdsReporte.Post;
            End;
            DMALM.cdsQry4.SetKey;
            DMALM.cdsQry4.FieldByName('KDXANO').AsString := DMALM.cdsReporte.fieldbyname('KDXANO').AsString;
            DMALM.cdsQry4.FieldByName('ARTID').AsString := DMALM.cdsReporte.fieldbyname('ARTID').AsString;
            If DMALM.cdsQry4.GotoKey Then
            Begin
               DMALM.cdsReporte.Edit;
               DMALM.cdsReporte.FieldByName('TOTACUM').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('TOTACUM').AsFloat - DMALM.cdsQry4.FieldByName('TOTACUM').AsFloat, 15, 4);
               DMALM.cdsReporte.FieldByName('PROM').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('PROM').AsFloat - DMALM.cdsQry4.FieldByName('PROM').AsFloat, 15, 4);
               DMALM.cdsReporte.Post;
            End;
            DMALM.cdsReporte.Next;
         End;
      End;
   End
   Else
   Begin
      Raise exception.Create('No se Encontraron Datos para Imprimir...!!!!');
      Screen.Cursor := crDefault;
   End;
   Screen.Cursor := crDefault;

   DMALM.cdsReporte.IndexFieldNames := 'KDXANO;ARTID';
   ppDBSalidaAcum.DataSource := DMALM.dsReporte;
   ppRSalidaAcum.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\SalidasAcum.Rtm';
   pplblUser.Caption := DMALM.wUsuario;

   ppRSalidaAcum.Template.LoadFromFile;
   ppRSalidaAcum.Print;
End;

Procedure TFToolSA.ppRSalidaAcumPreviewFormCreate(Sender: TObject);
Begin
   ppRSalidaAcum.PreviewForm.ClientHeight := 500;
   ppRSalidaAcum.PreviewForm.ClientWidth := 650;
   TppViewer(ppRSalidaAcum.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolSA.Z1bbtNIngresoClick(Sender: TObject);
Var
   xSQL, sODCIDs, sCIA, sALM, sTDA, sNISA, sLOC, sTin, XCampo: String;
   bCIA, bALM, bTDA, bNISAID, bLOC, bTin: Boolean;
   sSQL, sWhere: String;
   fTCambio: double;
Begin
   If (mtx4000.FMant.cds2.recordcount = 0) Then exit;

   Screen.Cursor := crHourGlass;
   ppDBNS.DataSource := DMALM.dsReporte;
   pprNS.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\NSalidaVal.Rtm';
   pprNS.template.LoadFromFile;

   sCIA := mtx4000.FMant.cds2.fieldbyname('CIAID').AsString;
   sLOC := mtx4000.FMant.cds2.fieldbyname('LOCID').AsString;
   sALM := mtx4000.FMant.cds2.fieldbyname('ALMID').AsString;
   sTIN := mtx4000.FMant.cds2.fieldbyname('TINID').AsString;
   sTDA := mtx4000.FMant.cds2.fieldbyname('TDAID').AsString;
   sNISA := mtx4000.FMant.cds2.fieldbyname('NISAID').AsString;
//   if mtx4000.TableName<>'LOG315' then
//   begin
   xSQL := 'SELECT * FROM LOG315 WHERE ' +
      'NISATIP=''SALIDA'' ' +
      'AND NISAID=''' + mtx4000.FMant.cds2.FieldByName('NISAID').AsString + ''' ' +
      'AND CIAID =''' + mtx4000.FMant.cds2.FieldByName('CIAID').AsString + ''' ' +
      'AND LOCID =''' + mtx4000.FMant.cds2.FieldByName('LOCID').AsString + ''' ' +
      'AND TINID =''' + mtx4000.FMant.cds2.FieldByName('TINID').AsString + ''' ' +
      'AND ALMID =''' + mtx4000.FMant.cds2.FieldByName('ALMID').AsString + ''' ' +
      'AND TDAID =''' + mtx4000.FMant.cds2.FieldByName('TDAID').AsString + ''' ORDER BY KDXID';
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(xSQL);
   DMALM.cdsKDX.Open;
//   end;
   xSQL := 'SELECT * FROM LOG318 WHERE ' +
      'NISAID=''' + mtx4000.FMant.cds2.FieldByName('NISAID').AsString + ''' ' +
      'AND CIAID =''' + mtx4000.FMant.cds2.FieldByName('CIAID').AsString + ''' ' +
      'AND LOCID =''' + mtx4000.FMant.cds2.FieldByName('LOCID').AsString + ''' ' +
      'AND TINID =''' + mtx4000.FMant.cds2.FieldByName('TINID').AsString + ''' ' +
      'AND ALMID =''' + mtx4000.FMant.cds2.FieldByName('ALMID').AsString + ''' ' +
      'AND TDAID =''' + mtx4000.FMant.cds2.FieldByName('TDAID').AsString + ''' ORDER BY ODCID';
   DMALM.cdsOCNIA.Close;
   DMALM.cdsOCNIA.DataRequest(xSQL);
   DMALM.cdsOCNIA.Open;

   sODCIDs := '';
   wODCIDs := ''; //Esta variable sera usado para la visualizacion por registros de OC y DOC
   DMALM.cdsOCNIA.First;
   While Not DMALM.cdsOCNIA.Eof Do
   Begin
      bCIA := (sCIA = DMALM.cdsOCNIA.FieldByName('CIAID').AsString);
      bLOC := (sLOC = DMALM.cdsOCNIA.FieldByName('LOCID').AsString);
      bTIN := (sTIN = DMALM.cdsOCNIA.FieldByName('TINID').AsString);
      bALM := (sALM = DMALM.cdsOCNIA.FieldByName('ALMID').AsString);
      bTDA := (sTDA = DMALM.cdsOCNIA.FieldByName('TDAID').AsString);
      bNISAID := (sNISA = DMALM.cdsOCNIA.FieldByName('NISAID').AsString);
      If bCIA And bALM And bTDA And bNISAID And bLOC And bTIN Then
      Begin
         sODCIDs := DMALM.cdsOCNIA.FieldByName('ODCID').AsString + ';' + sODCIDs;
         If wODCIDs = '' Then
            wODCIDs := '(B.ODCID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCID').AsString)
         Else
            wODCIDs := wODCIDs + ' OR B.ODCID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCID').AsString);
      End;
      DMALM.cdsOCNIA.Next;
   End;
   If wODCIDs <> '' Then
      wODCIDs := wODCIDs + ')';
   xCampo := sODCIDs;

   sWhere := 'TMONID=' + '''' + DMALM.wTMonExt + '''' + ' AND '
      + 'FECHA = ' + DMALM.wRepFuncDate + '''' + FormatDateTime(DMALM.wFormatFecha, mtx4000.FMant.cds2.fieldbyname('NISAFREG').AsDatetime) + '''' + ')';
   If length(DMALM.DisplayDescrip('dspUltTGE', 'TGE107', '*', sWhere, 'TMONID')) > 0 Then
      fTCambio := DMALM.cdsQry.fieldbyname('TCAM' + DMALM.wTipoCambioUsar).AsFloat
   Else
   Begin
      Screen.Cursor := crDefault;
      information(Caption, 'No Existe Tipo de Cambio para el Dia');
      ppDBNS.DataSource := Nil;
      Exit;
   End;

   sSQL := 'Select A.NISAID, A.CIAID, A.GRARID, B.GRARDES, A.KDXID, A.ARTID, A.ARTPCG, A.ARTDES, A.UNMIDG, A.KDXCNTG, NISAFREG, '
      + '          ROUND(DECODE(TMONID,' + QuotedStr(DMALM.wTMonExt) + ', NVL(ARTPCG,0), NVL(ARTPCG,0)),5) COSTOMN, '
      + '          ROUND(DECODE(TMONID,' + QuotedStr(DMALM.wTMonExt) + ', NVL(ARTMORIPCG,0), NVL(ARTPCG,0)/NVL(' + '' + floattostr(fTCambio) + '' + ',0)),5) COSTOME, '
      + '          ROUND(DECODE(TMONID,' + QuotedStr(DMALM.wTMonExt) + ', NVL(ARTPCG,0)*NVL(KDXCNTG,0), NVL(ARTPCG,0)*NVL(KDXCNTG,0)),5) SUBTMN, '
      + '          ROUND(DECODE(TMONID,' + QuotedStr(DMALM.wTMonExt) + ', NVL(KDXCNTG,0)*NVL(ARTMORIPCG,0), NVL(KDXCNTG,0)*NVL(ARTPCG,0)/NVL(' + '' + floattostr(fTcambio) + '' + ',0)),5) SUBTME '
      + '     from LOG315 A, TGE131 B '
      + '    where A.CIAID=' + quotedstr(sCIA)
      + '      and A.LOCID=' + quotedstr(sLOC)
      + '      and A.ALMID=' + quotedstr(sALM)
      + '      and A.NISAID=' + quotedstr(sNISA)
      + '      and A.TINID=' + quotedstr(sTIN)
      + '      and A.TDAID=' + quotedstr(sTDA)
      + '      and A.NISATIP=''SALIDA'' '
      + '      and A.GRARID=B.GRARID(+) '
      + '      and A.CIAID=B.CIAID(+) '
      + '      and A.TINID=B.TINID(+) '
      + '    order BY A.GRARID';

   DMALM.cdsReporte.close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.open;
   DMALM.cdsReporte.IndexFieldNames := 'GRARID;ARTID';
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      Information('Reporte Nota de Salida Valorizado', ' No Existe Información a Mostrar ');
      ppDBNS.DataSource := Nil;
      Exit;
   End;

   pplblCia.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(sCIA), 'CIADES');
   pplblNISA.Caption := mtx4000.FMant.cds2.fieldbyname('NISAID').AsString;
   pplblDOCID.Caption := mtx4000.FMant.cds2.fieldbyname('TRIID').AsString;
   pplblDOCDES.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE208', 'TRIDES', 'TRIID=' + quotedstr(mtx4000.FMant.cds2.fieldbyname('TRIID').AsString), 'TRIDES');
   pplblPROV.Caption := mtx4000.FMant.cds2.fieldbyname('PROV').AsString;
   pplblPROVDES.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE201', 'PROVDES', 'PROV=' + quotedstr(mtx4000.FMant.cds2.fieldbyname('PROV').AsString), 'PROVDES');
   pplblTCambio.Caption := floattostr(fTCambio);
   lblOCompra.Caption := xCampo;
//  pplblDOCREF.Caption  := mtx4000.FMant.cds2.fieldbyname('TDAID').AsString;
   pplblDOCREF.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE157', 'TDADES', 'TDAID=' + quotedstr(mtx4000.FMant.cds2.fieldbyname('TDAID').AsString), 'TDADES');
   pplblNDOCREF.Caption := mtx4000.FMant.cds2.fieldbyname('NISANDOC').AsString;
   pplblUsuario.Caption := DMALM.wUsuario;
   ppLabel1.Caption := 'GUIA DE SALIDA VALORIZADA   Nº  ' + mtx4000.FMant.cds2.fieldbyname('NISAID').AsString;
   ppLabel51.Caption := DMALM.DisplayDescrip('prvSQL', 'TGE203', 'CCOSDES', 'CCOSID=' + quotedStr(mtx4000.FMant.cds2.fieldbyname('CCOSID').AsString), 'CCOSDES');

   Screen.Cursor := crDefault;
   pprNS.Print;
   pprNS.stop;
   ppDBNS.DataSource := Nil;
   DMALM.cdsReporte.IndexFieldNames := ''
End;

Procedure TFToolSA.ppRNSPreviewFormCreate(Sender: TObject);
Begin
   ppRNS.PreviewForm.ClientHeight := 500;
   ppRNS.PreviewForm.ClientWidth := 650;
   TppViewer(ppRNS.PreviewForm.Viewer).ZoomSetting := zsPagewidth;

End;

Procedure TFToolSA.BitBtn2Click(Sender: TObject);
Var
   xSQL, sODCIDs, sCIA, sALM, sTDA, sNISA, sLOC, sTin, XCampo: String;
   bCIA, bALM, bTDA, bNISAID, bLOC, bTin: Boolean;
   sSQL, sWhere: String;
   fTCambio: double;

Begin
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      Information('Reporte Nota de Salida Valorizado', ' No Existe Información a Mostrar ');
      ppDBNS.DataSource := Nil;
      Exit;
   End;

   ppDBCarta.DataSource := DMALM.dsReporte;
   pprCarta.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\NSalidaValCarta.Rtm';
   Screen.Cursor := crDefault;
   pprCarta.template.LoadFromFile;

   Screen.Cursor := crHourGlass;
   xSQL := 'SELECT * FROM LOG318 WHERE ' +
      'NISAID=''' + DMALM.cdsNIS.FieldByName('NISAID').AsString + ''' ' +
      'AND CIAID =''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' ' +
      'AND LOCID =''' + DMALM.cdsNIS.FieldByName('LOCID').AsString + ''' ' +
      'AND TINID =''' + DMALM.cdsNIS.FieldByName('TINID').AsString + ''' ' +
      'AND ALMID =''' + DMALM.cdsNIS.FieldByName('ALMID').AsString + ''' ' +
      'AND TDAID =''' + DMALM.cdsNIS.FieldByName('TDAID').AsString + ''' ORDER BY ODCID';
   DMALM.cdsOCNIA.Close;
   DMALM.cdsOCNIA.DataRequest(xSQL);
   DMALM.cdsOCNIA.Open;

   sCIA := mtx4000.FMant.cds2.fieldbyname('CIAID').AsString;
   sLOC := mtx4000.FMant.cds2.fieldbyname('LOCID').AsString;
   sALM := mtx4000.FMant.cds2.fieldbyname('ALMID').AsString;
   sTIN := mtx4000.FMant.cds2.fieldbyname('TINID').AsString;
   sTDA := mtx4000.FMant.cds2.fieldbyname('TDAID').AsString;
   sNISA := mtx4000.FMant.cds2.fieldbyname('NISAID').AsString;

   sODCIDs := '';
   wODCIDs := ''; //Esta variable sera usado para la visualizacion por registros de OC y DOC
   DMALM.cdsOCNIA.First;
   While Not DMALM.cdsOCNIA.Eof Do
   Begin
      bCIA := (sCIA = DMALM.cdsOCNIA.FieldByName('CIAID').AsString);
      bLOC := (sLOC = DMALM.cdsOCNIA.FieldByName('LOCID').AsString);
      bTIN := (sTIN = DMALM.cdsOCNIA.FieldByName('TINID').AsString);
      bALM := (sALM = DMALM.cdsOCNIA.FieldByName('ALMID').AsString);
      bTDA := (sTDA = DMALM.cdsOCNIA.FieldByName('TDAID').AsString);
      bNISAID := (sNISA = DMALM.cdsOCNIA.FieldByName('NISAID').AsString);
      If bCIA And bALM And bTDA And bNISAID And bLOC And bTIN Then
      Begin
         sODCIDs := DMALM.cdsOCNIA.FieldByName('ODCID').AsString + ';' + sODCIDs;
         If wODCIDs = '' Then
            wODCIDs := '(B.ODCID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCID').AsString)
         Else
            wODCIDs := wODCIDs + ' OR B.ODCID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCID').AsString);
      End;
      DMALM.cdsOCNIA.Next;
   End;
   If wODCIDs <> '' Then
      wODCIDs := wODCIDs + ')';
   xCampo := sODCIDs;

   sWhere := 'TMONID=' + '''' + DMALM.wTMonExt + '''' + ' AND '
      + 'FECHA = ' + DMALM.wRepFuncDate + '''' + FormatDateTime(DMALM.wFormatFecha, mtx4000.FMant.cds2.fieldbyname('NISAFREG').AsDatetime) + '''' + ')';
   If length(DMALM.DisplayDescrip('dspUltTGE', 'TGE107', '*', sWhere, 'TMONID')) > 0 Then
      fTCambio := DMALM.cdsQry.fieldbyname('TCAM' + DMALM.wTipoCambioUsar).AsFloat
   Else
   Begin
      Screen.Cursor := crDefault;
      information(Caption, 'No Existe Tipo de Cambio para el Dia');
      ppDBNS.DataSource := Nil;
      Exit;
   End;

   pplblCia1.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(sCIA), 'CIADES');
   pplblNISA1.Caption := mtx4000.FMant.cds2.fieldbyname('NISAID').AsString;
   pplblDOCID1.Caption := mtx4000.FMant.cds2.fieldbyname('TRIID').AsString;
   pplblDOCDES1.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE208', 'TRIDES', 'TRIID=' + quotedstr(mtx4000.FMant.cds2.fieldbyname('TRIID').AsString), 'TRIDES');
   pplblPROV1.Caption := mtx4000.FMant.cds2.fieldbyname('PROV').AsString;
   pplblPROVDES1.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE201', 'PROVDES', 'PROV=' + quotedstr(mtx4000.FMant.cds2.fieldbyname('PROV').AsString), 'PROVDES');
   pplblTCambio1.Caption := floattostr(fTCambio);
   pplblOCompra1.Caption := xCampo;
//  pplblDOCREF.Caption  := mtx4000.FMant.cds2.fieldbyname('TDAID').AsString;
   pplblDOCREF1.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE157', 'TDADES', 'TDAID=' + quotedstr(mtx4000.FMant.cds2.fieldbyname('TDAID').AsString), 'TDADES');
   pplblNDOCREF1.Caption := mtx4000.FMant.cds2.fieldbyname('NISANDOC').AsString;
   pplbl60.Caption := DMALM.wUsuario;
   ppLabel30.Caption := 'GUIA DE SALIDA VALORIZADA   Nº  ' + mtx4000.FMant.cds2.fieldbyname('NISAID').AsString;
   Screen.Cursor := crDefault;
   pprCarta.Print;
   pprCarta.stop;
   ppDBCarta.DataSource := Nil;

End;

Procedure TFToolSA.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolSA';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolSA);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;
//INICIO HPP_201103_ALM

Procedure TFToolSA.btnActivosSinSalidaClick(Sender: TObject);
Begin
   Try
      FRptActivosSinSalida := TFRptActivosSinSalida.Create(Application); // ALM771
      FRptActivosSinSalida.ShowModal;
   Finally
      FRptActivosSinSalida.Free;
   End;
End;
//FIN HPP_201103_ALM
End.

