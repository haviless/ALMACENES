Unit ALM750;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : Alm750
//Formulario               : FToolNI
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Tollbar de las Notas de Ingreso

//Actualización
// HPC_201202_ALM 13/08/2012: -  Se implementó un reporte que muestra la misma
//                               información que la ventana.
// HPC_201605_ALM 04/07/2016: -  Se agrega estado "ELIMINADO" a notas de ingreso y notas de salida
//                               solo cuando estan en estado INICIAL. Se excluye eliminado físico.
//                               Se incluye actualización de usuario que acepta la NI/NS
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, StdCtrls, Buttons, Wwdbgrid, ppProd, ppClass, ppReport, ppComm,
   ppRelatv, ppCache, ppDB, ppDBPipe, ppVar, ppCtrls, ppPrnabl, ppBands,
   ComCtrls, ppEndUsr, ppViewr, pptypes, fcButton, fcImgBtn,
   fcShapeBtn, wwdblook, Wwdbdlg, ppDBBDE, db, ppParameter, MsgDlgs;

Type
   TFToolNI = Class(TForm)
      pnlTool: TPanel;
      Z1bbtNIngreso: TBitBtn;
      ppDBNI: TppDBPipeline;
      ppRNI: TppReport;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      ppResRNI: TppReport;
      Diseno: TppDesigner;
      Z2bbtnResKdxValInv: TBitBtn;
      bbtnIngArt: TBitBtn;
      ppRptIngresos: TppReport;
      ppHeaderBand3: TppHeaderBand;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLine6: TppLine;
      ppSystemVariable7: TppSystemVariable;
      ppSystemVariable8: TppSystemVariable;
      ppSystemVariable9: TppSystemVariable;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppDBText25: TppDBText;
      ppLabel45: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppFooterBand3: TppFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppDBText23: TppDBText;
      ppLabel41: TppLabel;
      ppDBText24: TppDBText;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppHeaderBand2: TppHeaderBand;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppSystemVariable6: TppSystemVariable;
      ppLine5: TppLine;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppLine4: TppLine;
      ppLabel46: TppLabel;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      pplblCIA: TppLabel;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      pplblNDocRef: TppLabel;
      ppLabel21: TppLabel;
      pplblTCambio: TppLabel;
      pplblDocRef: TppLabel;
      pplblProv: TppLabel;
      pplblProvDes: TppLabel;
      pplblDocId: TppLabel;
      pplblDocDes: TppLabel;
      ppLabel5: TppLabel;
      pplblUser: TppLabel;
      ppLabel22: TppLabel;
      lblOCompra: TppLabel;
      ppDBText26: TppDBText;
      ppDetailBand1: TppDetailBand;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText1: TppDBText;
      ppDBText4: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppLabel16: TppLabel;
      ppLine3: TppLine;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLabel15: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppLabel17: TppLabel;
      Timer1: TTimer;
      sbtnAnular: TfcShapeBtn;
      sbtnEliminar: TfcShapeBtn;
      sbtnInicial: TfcShapeBtn;
      BitBtn2: TBitBtn;
      gbCia: TGroupBox;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      dbcldArti: TwwDBLookupComboDlg;
      gbArt: TGroupBox;
      ppdb1: TppBDEPipeline;
      ppr1: TppReport;
      ppd1: TppDesigner;
      ppHeaderBand4: TppHeaderBand;
      ppDetailBand4: TppDetailBand;
      ppFooterBand4: TppFooterBand;
      ppDBText27: TppDBText;
      ppd2: TppDesigner;
      btnRptIngresos: TBitBtn;
      ppdbRptIngresos: TppDBPipeline;
      pprRptIngresos: TppReport;
      ppdRptIngresos: TppDesigner;
      ppParameterList1: TppParameterList;
      ppHeaderBand7: TppHeaderBand;
      ppShape15: TppShape;
      ppShape9: TppShape;
      ppShape8: TppShape;
      ppShape7: TppShape;
      ppShape4: TppShape;
      ppShape3: TppShape;
      ppShape1: TppShape;
      ppShape2: TppShape;
      ppSystemVariable12: TppSystemVariable;
      ppLabel92: TppLabel;
      ppSystemVariable13: TppSystemVariable;
      ppLabel93: TppLabel;
      ppSystemVariable14: TppSystemVariable;
      ppLabel94: TppLabel;
      ppLabel95: TppLabel;
      ppLabel96: TppLabel;
      ppSystemVariable15: TppSystemVariable;
      ppDBText59: TppDBText;
      ppLabel97: TppLabel;
      ppLabel98: TppLabel;
      ppDBText61: TppDBText;
      ppDBText64: TppDBText;
      ppDBText65: TppDBText;
      ppDBText66: TppDBText;
      ppDBText67: TppDBText;
      ppDBText68: TppDBText;
      ppDBText69: TppDBText;
      ppDBText70: TppDBText;
      ppLabel99: TppLabel;
      ppLabel100: TppLabel;
      ppLabel102: TppLabel;
      ppLabel105: TppLabel;
      ppLabel108: TppLabel;
      ppLabel109: TppLabel;
      ppLabel114: TppLabel;
      ppShape5: TppShape;
      ppLabel101: TppLabel;
      ppShape6: TppShape;
      ppLabel103: TppLabel;
      ppShape16: TppShape;
      ppLabel106: TppLabel;
      ppShape10: TppShape;
      ppLabel104: TppLabel;
      ppShape11: TppShape;
      ppLabel107: TppLabel;
      ppDetailBand7: TppDetailBand;
      ppDBText71: TppDBText;
      ppDBText72: TppDBText;
      ppDBText73: TppDBText;
      ppDBText74: TppDBText;
      ppDBText75: TppDBText;
      ppDBText76: TppDBText;
      ppDBText77: TppDBText;
      ppDBText78: TppDBText;
      ppDBText79: TppDBText;
      ppDBText80: TppDBText;
      ppDBText81: TppDBText;
      ppDBText82: TppDBText;
      ppDBCalc23: TppDBCalc;
      ppDBText83: TppDBText;
      ppDBText84: TppDBText;
      ppDBText85: TppDBText;
      ppDBText86: TppDBText;
      ppDBText87: TppDBText;
      ppDBText88: TppDBText;
      ppFooterBand7: TppFooterBand;
      ppSummaryBand2: TppSummaryBand;
      ppLine14: TppLine;
      ppLabel110: TppLabel;
      ppDBCalc24: TppDBCalc;
      Procedure Z1bbtNIngresoClick(Sender: TObject);
      Procedure ppRNIPreviewFormCreate(Sender: TObject);
      Procedure ppResRNIPreviewFormCreate(Sender: TObject);
      Procedure Z2bbtnResKdxValInvClick(Sender: TObject);
      Procedure bbtnIngArtClick(Sender: TObject);
      Procedure ppRptIngresosPreviewFormCreate(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure sbtnAnularClick(Sender: TObject);
      Procedure sbtnEliminarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure sbtnInicialClick(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dbcldArtiEnter(Sender: TObject);
      Procedure btnRptIngresosClick(Sender: TObject);
   Private
  { Private declarations }
    //grid : TwwDBGrid;
      wODCIDs: String;
      Function validafecha: boolean;
      Function Nuevafecha: Boolean;
   Public
  { Public declarations }
      Procedure InsDataFil;
   End;

Var
   FToolNI: TFToolNI;
   xwhere: String;
   xAccesoBotones: Boolean;

Implementation
//uses ALM001, ALMDM1;
Uses oaIN3000, ALMDM1;

{$R *.DFM}

Procedure TFToolNI.Z1bbtNIngresoClick(Sender: TObject);
Var
   xSQL, sODCIDs, sCIA, sALM, sTDA, sNISA, sLOC, sTin, XCampo: String;
   bCIA, bALM, bTDA, bNISAID, bLOC, bTin: Boolean;
   sSQL, sWhere: String;
   fTCambio: double;
Begin
   If mtx3000.FMant.cds2.FieldByName('CIAID').AsString = '04' Then
      pprNI.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\NIngresoVal_04.Rtm'
   Else
      pprNI.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\NIngresoVal.Rtm';

   pprNI.template.LoadFromFile;
   If (Mtx3000.FMant.cds2.recordcount = 0) Then exit;

   Screen.Cursor := crHourGlass;
   xSQL := 'SELECT * FROM LOG318 WHERE ' +
      'NISAID=''' + mtx3000.FMant.cds2.FieldByName('NISAID').AsString + ''' ' +
      'AND CIAID =''' + mtx3000.FMant.cds2.FieldByName('CIAID').AsString + ''' ' +
      'AND LOCID =''' + mtx3000.FMant.cds2.FieldByName('LOCID').AsString + ''' ' +
      'AND TINID =''' + mtx3000.FMant.cds2.FieldByName('TINID').AsString + ''' ' +
      'AND ALMID =''' + mtx3000.FMant.cds2.FieldByName('ALMID').AsString + ''' ' +
      'AND TDAID =''' + mtx3000.FMant.cds2.FieldByName('TDAID').AsString + ''' ORDER BY ODCID';
   DMALM.cdsOCNIA.Close;
   DMALM.cdsOCNIA.DataRequest(xSQL);
   DMALM.cdsOCNIA.Open;

   sCIA := mtx3000.FMant.cds2.fieldbyname('CIAID').AsString;
   sLOC := mtx3000.FMant.cds2.fieldbyname('LOCID').AsString;
   sALM := mtx3000.FMant.cds2.fieldbyname('ALMID').AsString;
   sTIN := mtx3000.FMant.cds2.fieldbyname('TINID').AsString;
   sTDA := mtx3000.FMant.cds2.fieldbyname('TDAID').AsString;
   sNISA := mtx3000.FMant.cds2.fieldbyname('NISAID').AsString;

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
      + 'FECHA = ' + DMALM.wRepFuncDate + '''' + FormatDateTime(DMALM.wFormatFecha, mtx3000.FMant.cds2.fieldbyname('NISAFREG').AsDatetime) + '''' + ')';
   If length(DMALM.DisplayDescrip('dspUltTGE', 'TGE107', '*', sWhere, 'TMONID')) > 0 Then
      fTCambio := DMALM.cdsQry.fieldbyname('TCAM' + DMALM.wTipoCambioUsar).AsFloat
   Else
   Begin
      Screen.Cursor := crDefault;
      information(Caption, 'No Existe Tipo de Cambio para el Dia');
      ppDBNI.DataSource := Nil;
      Exit;
   End;

// Inicio HPC_201502_ALM
      sSQL := 'SELECT A.NISAID, A.CIAID, A.GRARID, B.GRARDES, A.KDXID, A.ARTID, A.ARTPCG, A.ARTDES, A.UNMIDG, A.KDXCNTG, A.NISAFREG, ' +
         'Round(DECODE(A.TMONID,' + QuotedStr(DMALM.wTMonExt) + ', NVL(ARTMORIPCG,0)*' + floattostr(fTCambio) + ', NVL(ARTMORIPCG,0)),4) COSTOMN, ' +
         'Round(DECODE(A.TMONID,' + QuotedStr(DMALM.wTMonExt) + ', NVL(ARTMORIPCG,0), NVL(ARTPCG,0)/NVL(' + '' + floattostr(fTCambio) + '' + ',0)),4) COSTOME, ' +
         'Round(DECODE(A.TMONID,' + QuotedStr(DMALM.wTMonExt) + ', NVL(ARTMORIPCG,0)*NVL(KDXCNTG,0)*' + floattostr(fTCambio) + ', NVL(ARTMORIPCG,0)*NVL(KDXCNTG,0)),4) SUBTMN, ' +
         'Round(DECODE(A.TMONID,' + QuotedStr(DMALM.wTMonExt) + ', NVL(KDXCNTG,0)*NVL(ARTMORIPCG,0), NVL(KDXCNTG,0)*NVL(ARTPCG,0)/NVL(' + '' + floattostr(fTcambio) + '' + ',0)),4) SUBTME, ' +
         'C.NISSIT ESTADO, ''Hecho por : ''||D.USERNOM HECHOPOR ' +
         'FROM LOG315 A, TGE131 B, LOG314 C, TGE006 D ' +
         'WHERE A.CIAID=' + quotedstr(sCIA) + ' AND A.LOCID=' + quotedstr(sLOC) +
         ' AND A.ALMID=' + quotedstr(sALM) + ' AND A.NISAID=' + quotedstr(sNISA) +
         ' AND A.TINID=' + quotedstr(sTIN) + ' AND A.TDAID=' + quotedstr(sTDA) +
         ' AND A.NISATIP=''INGRESO'' ' +
         ' AND A.GRARID=B.GRARID(+) AND A.CIAID=B.CIAID(+) AND A.TINID=B.TINID(+) ' +
         ' AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID AND A.ALMID=C.ALMID ' +
         ' AND A.TDAID=C.TDAID AND A.NISATIP=C.NISATIP AND A.NISAID=C.NISAID ' +
         ' AND C.NISAUSER=D.USERID(+) ' +
         'ORDER BY A.GRARID, KDXID';
// Fin HPC_201502_ALM
   DMALM.cdsReporte.close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.open;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      Information('Reporte Nota de Ingreso Valorizado', ' No Existe Información a Mostrar ');
      ppDBNI.DataSource := Nil;
      Exit;
   End;

   ppDBNI.DataSource := DMALM.dsReporte;

   pplblCia.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(sCIA), 'CIADES');
   pplblDOCID.Caption := mtx3000.FMant.cds2.fieldbyname('TRIID').AsString;
   pplblDOCDES.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE208', 'TRIDES', 'TRIID=' + quotedstr(mtx3000.FMant.cds2.fieldbyname('TRIID').AsString), 'TRIDES');
   pplblPROV.Caption := mtx3000.FMant.cds2.fieldbyname('PROV').AsString;
   pplblPROVDES.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE201', 'PROVDES', 'PROV=' + quotedstr(mtx3000.FMant.cds2.fieldbyname('PROV').AsString) + ' AND CLAUXID = NVL(' + quotedstr(mtx3000.FMant.cds2.fieldbyname('CLAUXID').AsString) + ',' + QuotedStr('P') + ')', 'PROVDES');
   pplblTCambio.Caption := floattostr(fTCambio);
   lblOCompra.Caption := xCampo;
   pplblDOCREF.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE157', 'TDADES', 'TDAID=' + quotedstr(mtx3000.FMant.cds2.fieldbyname('TDAID').AsString), 'TDADES');
   pplblNDOCREF.Caption := mtx3000.FMant.cds2.fieldbyname('NISANDOC').AsString;
   pplblUser.Caption := mtx3000.FMant.cds2.fieldbyname('NISAUSER').AsString;
   ppLabel1.Caption := 'GUIA DE INGRESO VALORIZADA   Nº  ' + mtx3000.FMant.cds2.fieldbyname('NISAID').AsString;
   Screen.Cursor := crDefault;

   If (DMALM.wUsuario = 'JCARBONEL') Or (DMALM.wUsuario = 'HNORIEGA') Then
      ppd2.ShowModal
   Else
      pprNI.Print;

   pprNI.stop;
   ppDBNI.DataSource := Nil;
End;

Procedure TFToolNI.ppRNIPreviewFormCreate(Sender: TObject);
Begin
   ppRNI.PreviewForm.ClientHeight := 500;
   ppRNI.PreviewForm.ClientWidth := 650;
   TppViewer(ppRNI.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolNI.ppResRNIPreviewFormCreate(Sender: TObject);
Begin
   ppResRNI.PreviewForm.ClientHeight := 500;
   ppResRNI.PreviewForm.ClientWidth := 650;
   TppViewer(ppResRNI.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolNI.Z2bbtnResKdxValInvClick(Sender: TObject);
Var
   sCIA, sALM, sTDA, sNISA, sLOC, sTin: String;
   sSQL, sWhere: String;
   sDesde, sHasta: String;
   fTCambio: double;
   x10: integer;
Begin

   If length(dblcCia.Text) = 0 Then Raise exception.Create('Falta Código de Compañía');
   If length(edtCia.Text) = 0 Then Raise exception.Create('Código de Compañía Errado');

   Screen.Cursor := crHourGlass;
   sDesde := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

 {xSQL:= 'SELECT * FROM LOG318 WHERE '+
     'NISAID='''+DMALM.cdsNIA.FieldByName('NISAID').AsString+''' '+
     'AND CIAID ='''+DMALM.cdsNIA.FieldByName('CIAID').AsString +''' '+
     'AND LOCID ='''+DMALM.cdsNIA.FieldByName('LOCID').AsString +''' '+
     'AND TINID ='''+DMALM.cdsNIA.FieldByName('TINID').AsString +''' '+
     'AND ALMID ='''+DMALM.cdsNIA.FieldByName('ALMID').AsString +''' '+
     'AND TDAID ='''+DMALM.cdsNIA.FieldByName('TDAID').AsString +''' ORDER BY ODCID';
 DMALM.cdsOCNIA.Close;
 DMALM.cdsOCNIA.DataRequest(xSQL);
 DMALM.cdsOCNIA.Open;

 sCIA   := mtx3000.FMant.cds2.fieldbyname('CIAID').AsString;
 sLOC   := mtx3000.FMant.cds2.fieldbyname('LOCID').AsString;
 sALM   := mtx3000.FMant.cds2.fieldbyname('ALMID').AsString;
 sTIN   := mtx3000.FMant.cds2.fieldbyname('TINID').AsString;
 sTDA   := mtx3000.FMant.cds2.fieldbyname('TDAID').AsString;
 sNISA  := mtx3000.FMant.cds2.fieldbyname('NISAID').AsString;

 sODCIDs := '';
 wODCIDs := ''; //Esta variable sera usado para la visualizacion por registros de OC y DOC
 DMALM.cdsOCNIA.First;
 while not DMALM.cdsOCNIA.Eof do
 begin
  bCIA    := (sCIA = DMALM.cdsOCNIA.FieldByName('CIAID').AsString);
  bLOC    := (sLOC = DMALM.cdsOCNIA.FieldByName('LOCID').AsString);
  bTIN    := (sTIN = DMALM.cdsOCNIA.FieldByName('TINID').AsString);
  bALM    := (sALM = DMALM.cdsOCNIA.FieldByName('ALMID').AsString);
  bTDA    := (sTDA = DMALM.cdsOCNIA.FieldByName('TDAID').AsString);
  bNISAID := (sNISA = DMALM.cdsOCNIA.FieldByName('NISAID').AsString);
  if bCIA and bALM and bTDA and bNISAID and bLOC and bTIN then
  begin
   sODCIDs := DMALM.cdsOCNIA.FieldByName('ODCID').AsString+';'+sODCIDs;
   if wODCIDs = '' then
    wODCIDs := '(B.ODCID='+quotedstr(DMALM.cdsOCNIA.FieldByName('ODCID').AsString)
   else
    wODCIDs := wODCIDs + ' OR B.ODCID='+quotedstr(DMALM.cdsOCNIA.FieldByName('ODCID').AsString);
  end;
  DMALM.cdsOCNIA.Next;
 end;
 if wODCIDs <> '' then
  wODCIDs := wODCIDs + ')';
 xCampo := sODCIDs;}

   sWhere := 'TMonId=' + '''' + DMALM.wTMonExt + '''' + ' and '
      + 'Fecha = ' + DMALM.wRepFuncDate + '''' + FormatDateTime(DMALM.wFormatFecha, Date) + '''' + ')';
   If length(DMALM.DisplayDescrip('dspUltTGE', 'TGE107', '*', sWhere, 'TMONID')) > 0 Then
      fTCambio := DMALM.cdsQry.fieldbyname('TCAM' + DMALM.wTipoCambioUsar).AsFloat
   Else
      fTCambio := 1;

   sSQL := 'SELECT TMONID, A.CIAID, A.LOCID, A.ALMID, A.NISAID, A.TINID, A.TDAID, SUM(A.ARTPCG) PRECIO, ' +
      'CASE WHEN TMONID=' + QuotedStr(DMALM.wTMonExt) + ' THEN (SUM(NVL(ARTPCG,0))) ELSE SUM((NVL(ARTPCG,0))) END COSTOMN, ' +
      'CASE WHEN TMONID=' + QuotedStr(DMALM.wTMonExt) + ' THEN (SUM(NVL(ARTMORIPCG,0))) ELSE ROUND(SUM(NVL(ARTPCG,0)/NVL(' + '' + floattostr(fTCambio) + '' + ',0)),2) END COSTOME, ' +
      'CASE WHEN TMONID=' + QuotedStr(DMALM.wTMonExt) + ' THEN ROUND(SUM(NVL(ARTPCG,0))*SUM(NVL(KDXCNTG,0)),2) ELSE ROUND(SUM(NVL(ARTPCG,0)*NVL(KDXCNTG,0)),2) END SUBTMN, ' +
      'CASE WHEN TMONID=' + QuotedStr(DMALM.wTMonExt) + ' THEN ROUND(SUM(NVL(KDXCNTG,0))*SUM(NVL(ARTMORIPCG,0)),2) ELSE ROUND(SUM(NVL(KDXCNTG,0))*SUM(NVL(ARTPCG,0))/SUM(NVL(' + '' + floattostr(fTCambio) + '' + ',0)),2) END SUBTME ' +
      'FROM LOG315 A ' +
      'WHERE A.CIAID=''' + dblcCia.Text + ''' and A.NISATIP=' + quotedstr('INGRESO') + ' ' +
      'AND NISAFREG>=' + sDesde + ' AND NISAFREG<=' + sHasta + ' ' +
      'GROUP BY A.CIAID, A.LOCID, A.ALMID, A.NISAID, A.TINID, A.TDAID, TMONID ' +
      'ORDER BY NISAID';
   DMALM.cdsReporte.close;
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.open;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      Information('Reporte de Resumen de Nota de Ingreso Valorizado', ' No Existe Información a Mostrar ');
      ppDBNI.DataSource := Nil;
      Exit;
   End;
   ppDBNI.DataSource := DMALM.dsReporte;
   ppResRNI.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResNIngresoVal.Rtm';
   ppResRNI.Template.LoadFromFile;

 {pplblCia.Caption     := DMALM.DisplayDescrip('dspUltTGE','TGE101','CIADES','CIAID='+quotedstr(sCIA),'CIADES');
 pplblNISA.Caption    := mtx3000.FMant.cds2.fieldbyname('NISAID').AsString;
 pplblDOCID.Caption   := mtx3000.FMant.cds2.fieldbyname('TRIID').AsString;
 pplblDOCDES.Caption  := DMALM.DisplayDescrip('dspUltTGE','TGE208','TRIDES','TRIID='+quotedstr(mtx3000.FMant.cds2.fieldbyname('TRIID').AsString),'TRIDES');
 pplblPROV.Caption    := mtx3000.FMant.cds2.fieldbyname('PROV').AsString;
 pplblPROVDES.Caption := DMALM.DisplayDescrip('dspUltTGE','TGE201','PROVDES','PROV='+quotedstr(mtx3000.FMant.cds2.fieldbyname('PROV').AsString),'PROVDES');
 pplblTCambio.Caption := floattostr(fTCambio);
 lblOCompra.Caption   := xCampo;
//  pplblDOCREF.Caption  := mtx3000.FMant.cds2.fieldbyname('TDAID').AsString;
 pplblDOCREF.Caption  := DMALM.DisplayDescrip('dspUltTGE','TGE157','TDADES','TDAID='+quotedstr(mtx3000.FMant.cds2.fieldbyname('TDAID').AsString),'TDADES');
 pplblNDOCREF.Caption := mtx3000.FMant.cds2.fieldbyname('NISANDOC').AsString;
 pplblUser.Caption    := mtx3000.FMant.cds2.fieldbyname('NISAUSER').AsString;}

   ppLabel46.Text := 'Del ' + datetostr(dtpDesde.DateTime) + ' Al ' + datetostr(dtpHasta.DateTime);
   Screen.Cursor := crDefault;
 //Diseno.Show;
   ppResRNI.Print;
   ppResRNI.stop;
   ppDBNI.DataSource := Nil;
   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
End;

Procedure TFToolNI.bbtnIngArtClick(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, sDesde, sHasta, xTri: String;
   D, M, Y: Word;
   x10: Integer;
Begin

   If length(dblcCia.Text) = 0 Then Raise exception.Create('Falta Código de Compañía');
   If length(edtCia.Text) = 0 Then Raise exception.Create('Código de Compañía Errado');

   Screen.Cursor := crHourGlass;
   ppDBNI.DataSource := DMALM.dsReporte;
   sDesde := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));
   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

   xSQL := 'TRISGT=''I'' AND TRIPV=''S''';

   DMALM.DisplayDescrip('dspUltTGE', 'TGE208', 'TRIID', xSQL, 'TRIID');
   xTri := '';
   DMALM.cdsQry.First;
   While Not DMALM.cdsQry.Eof Do
   Begin
      If xTri = '' Then
         xTri := QuotedStr(DMALM.cdsQry.FieldByName('TRIID').AsString)
      Else
         xTri := xTri + ',' + QuotedStr(DMALM.cdsQry.FieldByName('TRIID').AsString);
      DMALM.cdsQry.Next;
   End;

   xSQL := 'SELECT A.*, B.LPREPREGMO, B.TLISTAID, C.GRARDES, D.CIADES '
      + 'FROM LOG315 A, FAC201 B, TGE131 C, TGE101 D, LOG314 Z '
      + 'WHERE A.CIAID=''' + dblcCia.Text + ''' and A.NISATIP=''INGRESO'' '
      + 'AND A.NISAFREG>=' + sDesde + ' AND A.NISAFREG<=' + sHasta + ' '
      + 'AND A.TRIID IN (' + xTri + ') '
      + 'AND A.CIAID=B.CIAID(+) AND A.LOCID=B.LOCID(+) AND A.TINID=B.TINID(+) '
      + 'AND A.ALMID=B.ALMID(+) AND A.ARTID=B.ARTID(+) AND TLISTAID(+)=''NOR'' '
      + 'AND A.CIAID=C.CIAID(+) AND A.GRARID=C.GRARID(+) AND A.TINID=C.TINID(+) '
      + 'AND A.CIAID=D.CIAID(+) '
      + 'AND A.CIAID=Z.CIAID AND A.LOCID=Z.LOCID AND A.TINID=Z.TINID AND A.ALMID=Z.ALMID '
      + 'AND A.TDAID=Z.TDAID AND A.NISATIP=Z.NISATIP AND A.NISAID=Z.NISAID AND Z.NISSIT=''ACEPTADO'' '
      + 'ORDER BY A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID';
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      ppDBNI.DataSource := Nil;
      Exit;
   End;
   Screen.Cursor := crHourglass;
   ppRptIngresos.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RptIngresos.rtm';
   ppRptIngresos.template.LoadFromFile;

   ppLabel45.Caption := 'Desde ' + DatetoStr(dtpDesde.DateTime) + ' HASTA ' + DatetoStr(dtpHasta.DateTime);
   Screen.Cursor := crDefault;
 //Diseno.ShowModal;
   ppRptIngresos.Print;
   ppRptIngresos.Stop;
   ppDBNI.DataSource := Nil;
   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
End;

Procedure TFToolNI.InsDataFil;
Var
   MtoGFNameG, MtoGFNameU, CntGFNameG, CntGFNameU, sTOTAL, sWhere: String;
   xSQL, SalIniHas: String;
   D, M, Y, DH, MH, YH: Word;
   iX, iY: integer;
Begin
   xWhere := '';
   DecodeDate(dtpDesde.Date, Y, M, D);
   DecodeDate(dtpHasta.Date, YH, MH, DH);
   If D = 1 Then
      SalIniHas := IntToStr(D) + '/' + IntToStr(M) + '/' + IntToStr(Y)
   Else
      SalIniHas := IntToStr(D - 1) + '/' + IntToStr(M) + '/' + IntToStr(Y);

   CntGFNameG := 'STKTSG' + DMALM.StrZero(IntToStr(M), 2);
   CntGFNameU := 'STKTSU' + DMALM.StrZero(IntToStr(M), 2);
   MtoGFNameG := 'STKTMG' + DMALM.StrZero(IntToStr(M), 2);
   MtoGFNameU := 'STKTMU' + DMALM.StrZero(IntToStr(M), 2);

   SalIniHas := quotedStr(formatdatetime(DMALM.wFormatFecha, strtodatetime(SalIniHas)));

   xSQL := 'DELETE FROM LOG323 WHERE USUARIO=''' + DMALM.wUsuario + '''';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := mtx3000.FMant.SQL;
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

   sWhere := xWhere;

   sTOTAL := 'INSERT INTO LOG323 ' +
      '(CIAID, LOCID, ALMID, TINID, GRARID, NISAFREG, TDAID, TDAABR, ARTFUC, ARTID, ARTDES, UNMIDG, UMEDGDES, ' +
      'UNMIDU, UMEDUDES, NISAID, NISATIP, SALDOG, SALDOU, MONTOG, MONTOU, KDXCNTG, KDXCNTU, KDXCNTGI, KDXCNTUI, ' +
      'KDXCNTGS, KDXCNTUS, ARTCPROG, ARTCPROU, KDXCPROGI, KDXCPROUI, KDXCPROGS, KDXCPROUS, USUARIO ) ' +
      '(SELECT ' +
      ' CIAID, LOCID, ALMID, TINID, GRARID, (' + SalIniHas + '), ''00'', '''', ARTFUC, ARTID, ARTDES, UNMIDG, '''', UNMIDU, '''', ''Saldo Inicial'', ' +
      ''''', ' + CntGFNameG + ', ' + CntGFNameU + ', ' + MtoGFNameG + ', ' + MtoGFNameU + ', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, ''' + DMALM.wUsuario + ''' ' +
      'FROM LOG316 ';

   If Length(sWhere) > 0 Then
      sTOTAL := sTOTAL + 'WHERE ' + sWhere + ' AND LOG316.STKANO=''' + InttoStr(YH) + ''')'
   Else
      sTOTAL := sTOTAL + 'WHERE LOG316.STKANO=''' + InttoStr(YH) + ''')';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sTOTAL);
   Except
   End;
End;

Procedure TFToolNI.ppRptIngresosPreviewFormCreate(Sender: TObject);
Begin
   ppRptIngresos.PreviewForm.ClientHeight := 500;
   ppRptIngresos.PreviewForm.ClientWidth := 650;
   TppViewer(ppRptIngresos.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolNI.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolNI';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolNI);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

Procedure TFToolNI.sbtnAnularClick(Sender: TObject);
Var
   xSQL, cMes, cMeses, cMesT: String;
   nMes, mm: Integer;
Begin

   If mtx3000.FMant.cds2.FieldByName('NISSIT').AsString = 'ANULADO' Then
   Begin
      ShowMessage('Factura ya fue Anulado. Verifique...');
      Exit;
   End;
  {
   if validafecha then
      Exit;
   }
   If Question('Confirmar', 'Esta Seguro de Anular Nota de Ingreso ' + #13 + #13 +
      'Nº ' + mtx3000.FMant.cds2.FieldByName('NISAID').AsString + #13 +
      #13 + ' Desea Continuar ') Then
   Begin

      xSQL := 'SELECT  * FROM LOG315 ' +
         ' WHERE CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsSQL.Filter := '';
      DMALM.cdsSQL.Filtered := False;
      DMALM.cdsSQL.IndexFieldNames := '';
      DMALM.cdsSQL.Close;
      DMALM.cdsSQL.DataRequest(xSQL);
      DMALM.cdsSQL.Open;

      xSQL := ' UPDATE LOG314 SET NISSIT=''ANULADO'' ' +
         ' WHERE CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
     //DMALM.cdsTGE.Execute;

      xSQL := ' UPDATE LOG315 SET NISSIT=''ANULADO'' ' +
         ' WHERE CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
     //DMALM.cdsTGE.Execute;

      If mtx3000.FMant.cds2.FieldByName('NISSIT').AsString = 'ACEPTADO' Then
      Begin
         cMes := Copy(DMALM.cdsSQL.FieldByName('KDXANOMM').AsString, 5, 2);
         nMes := StrToInt(cMes) + 1;

         DMALM.cdsSQL.First;
         While Not DMALM.cdsSQL.Eof Do
         Begin

            cMeses := '';
            If nMes <= 12 Then
            Begin
               For mm := nMes To 12 Do
               Begin
                  cMesT := DMALM.StrZero(IntToStr(mm), 2);
                  cMeses := cMeses + ', ' + 'STKTSG' + cMesT + '=STKTSG' + cMesT + '-' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               End;
            End;

            xSQL := 'UPDATE LOG316 '
               + 'SET STKSACTG=STKSACTG-' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ', '
               + 'STKISG' + cMes + '=STKISG' + cMes + '-' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               + cMeses
               + 'where CIAID=''' + DMALM.cdsSQL.FieldByName('CIAID').AsString + ''' '
               + 'and STKANO=''' + DMALM.cdsSQL.FieldByName('KDXANO').AsString + ''' '
               + 'and LOCID=''' + DMALM.cdsSQL.FieldByName('LOCID').AsString + ''' '
               + 'and TINID=''' + DMALM.cdsSQL.FieldByName('TINID').AsString + ''' '
               + 'and ALMID=''' + DMALM.cdsSQL.FieldByName('ALMID').AsString + ''' '
               + 'and GRARID=''' + DMALM.cdsSQL.FieldByName('GRARID').AsString + ''' '
              // VHNDEMA REVISAR PORQUE EN ALGUNOS CASOS NO GRABA LA FAMILIA Y SUBFAMILIA
              //+  'and FAMID='''  +DMALM.cdsSQL.FieldByName('FAMID').AsString  +''' '
              //+  'and SFAMID=''' +DMALM.cdsSQL.FieldByName('SFAMID').AsString +''' '
            + 'and ARTID=''' + DMALM.cdsSQL.FieldByName('ARTID').AsString + ''' ';
            DMALM.cdsTGE.Close;
            DMALM.cdsTGE.DataRequest(xSQL);
         //DMALM.cdsTGE.Execute;
            DMALM.cdsSQL.Next;
         End;

      End;
      ShowMessage('Nota de Ingreso Anulada');
   End;
End;

Procedure TFToolNI.sbtnEliminarClick(Sender: TObject);
Var
   xSQL, cMes, cMeses, cMesT: String;
   nMes, mm: Integer;

// Inicio HPC_201605_ALM
// Se excluye eliminado físico y se agrega nuevo estado "ELIMINADO"
Begin
   If validafecha Then
      Exit;

   xSQL := 'SELECT * FROM LOG314 ' +
      ' WHERE CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString) +
      ' AND LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString) +
      ' AND TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString) +
      ' AND ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString) +
      ' AND TDAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString) +
      ' AND NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString) +
      ' AND NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
   DMALM.cdsSQL.Filter := '';
   DMALM.cdsSQL.Filtered := False;
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(xSQL);
   DMALM.cdsSQL.Open;

   If DMALM.cdsSQL.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No Existen Registros a Eliminar');
      exit;
   End;

   If DMALM.cdsSQL.FieldByName('NISSIT').AsString <> 'INICIAL' Then
   Begin
      Information(Caption, 'Esta Nota de Ingreso ya fue Aceptada o Eliminada ');
      exit;
   End;

   xSQL := 'SELECT * FROM LOG315 ' +
      ' WHERE CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString) +
      ' AND LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString) +
      ' AND TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString) +
      ' AND ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString) +
      ' AND TDAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString) +
      ' AND NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString) +
      ' AND NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
   DMALM.cdsSQL.Filter := '';
   DMALM.cdsSQL.Filtered := False;
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(xSQL);
   DMALM.cdsSQL.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsSQL.RecordCount > 0 Then
      Information(Caption, ' Esta Nota de Ingreso Tiene Detalle ');
   If Question('Confirmar', 'Esta Seguro de Eliminar Nota de Ingreso ' + #13 + #13 +
      'Nº ' + mtx3000.FMant.cds2.FieldByName('NISAID').AsString + #13 +
      #13 + ' Desea Continuar ? ') Then
   Begin

      xSQL := ' Update LOG314  '
         + ' set NISSIT = ''ELIMINADO'', SITFREG=trunc(sysdate), SITHREG=Sysdate, NISAUSER=' + quotedstr(DMALM.wUsuario) + ','
         + ' NISAOBS =' + quotedstr('Eliminada por Usuario : ' + DMALM.wUsuario)
         + ' where CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString)
         + ' and LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString)
         + ' and TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString)
         + ' and ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString)
         + ' and TDAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString)
         + ' and NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString)
         + ' and NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

      xSQL := ' Update LOG315 '
         + ' set NISSIT = ''ELIMINADO'', KDXFREG=trunc(sysdate), KDXHREG=Sysdate, KDXUSER=' + quotedstr(DMALM.wUsuario)
         + ' where CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString)
         + ' and LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString)
         + ' and TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString)
         + ' and ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString)
         + ' and TDAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString)
         + ' and NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString)
         + ' and NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

      If mtx3000.FMant.cds2.FieldByName('NISSIT').AsString = 'ACEPTADO' Then
      Begin
         cMes := Copy(DMALM.cdsSQL.FieldByName('KDXANOMM').AsString, 5, 2);
         nMes := StrToInt(cMes) + 1;

         DMALM.cdsSQL.First;
         While Not DMALM.cdsSQL.Eof Do
         Begin

            cMeses := '';
            If nMes <= 12 Then
            Begin
               For mm := nMes To 12 Do
               Begin
                  cMesT := DMALM.StrZero(IntToStr(mm), 2);
                  cMeses := cMeses + ', ' + 'STKTSG' + cMesT + '=STKTSG' + cMesT + '-' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               End;
            End;

            xSQL := 'UPDATE LOG316 '
               + 'SET STKSACTG=STKSACTG-' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ', '
               + 'STKSSG' + cMes + '=STKSSG' + cMes + '-' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               + cMeses
               + 'where CIAID=''' + DMALM.cdsSQL.FieldByName('CIAID').AsString + ''' '
               + 'and STKANO=''' + DMALM.cdsSQL.FieldByName('KDXANO').AsString + ''' '
               + 'and LOCID=''' + DMALM.cdsSQL.FieldByName('LOCID').AsString + ''' '
               + 'and TINID=''' + DMALM.cdsSQL.FieldByName('TINID').AsString + ''' '
               + 'and ALMID=''' + DMALM.cdsSQL.FieldByName('ALMID').AsString + ''' '
               + 'and GRARID=''' + DMALM.cdsSQL.FieldByName('GRARID').AsString + ''' '
              // VHNDEMA REVISAR PORQUE EN ALGUNOS CASOS NO GRABA LA FAMILIA Y SUBFAMILIA
              //+  'and FAMID='''  +DMALM.cdsSQL.FieldByName('FAMID').AsString  +''' '
              //+  'and SFAMID=''' +DMALM.cdsSQL.FieldByName('SFAMID').AsString +''' '
            + 'and ARTID=''' + DMALM.cdsSQL.FieldByName('ARTID').AsString + ''' ';
            DMALM.cdsTGE.Close;
            DMALM.cdsTGE.DataRequest(xSQL);
            DMALM.cdsTGE.Execute;
            DMALM.cdsSQL.Next;
         End;

      End;

      ShowMessage('Nota de Ingreso Eliminada');
// Inicio HPC_201605_ALM

   End;
End;

Function TFToolNI.validafecha: boolean;
Var
   sSQL: String;
Begin
   Result := False;

   sSQL := 'Select * from LOG317 '
      + '    where LOG317.CIAID=' + QUOTEDSTR(mtx3000.FMant.cds2.FieldByName('CIAID').AsString)
      + '      and LOG317.LOCID=' + QUOTEDSTR(mtx3000.FMant.cds2.FieldByName('LOCID').AsString)
      + '      and LOG317.ALMID=' + QUOTEDSTR(mtx3000.FMant.cds2.FieldByName('ALMID').AsString)
      + '      and LOG317.TINID=' + QUOTEDSTR(mtx3000.FMant.cds2.FieldByName('TINID').AsString)
      + '    order by CIAID, LOCID, TINID, ALMID, CNSULTCIE';
   DMALM.cdsCIERRE.Close;
   DMALM.cdsCIERRE.DataRequest(sSQL);
   DMALM.cdsCIERRE.Open;
   If DMALM.cdsCIERRE.RecordCount < 1 Then
   Begin
      ErrorMsg('Error', ' No Existe Frecuencia de Cierre ');
      Result := True;
      exit;
   End
   Else
   Begin
      DMALM.cdsCierre.Last;
      Result := NuevaFecha;
   End;
End;

Function TFToolNI.Nuevafecha: Boolean;
Var
   vfecult, vmasdia: Tdate;
   vyear, vmonth, vday: word;
   vyear1, vmonth1, vday1: word;
   vyear2, vmonth2, vday2: word;
Begin
   Result := false;

   vmasdia := StrToDate(DMALM.cdsCIERRE.fieldbyname('CNSPRICIE').AsString);
   vfecult := StrToDate(DMALM.cdsCIERRE.fieldbyname('CNSULTCIE').AsString);
   DecodeDate(vmasdia, vyear, vmonth, vday); //calculado
   DecodeDate(vfecult, vyear1, vmonth1, vday1); // anterior
   DecodeDate(strTodate(mtx3000.FMant.cds2.FieldByName('NISAFREG').AsString), vyear2, vmonth2, vday2); //digitada
   If (strTodate(mtx3000.FMant.cds2.FieldByName('NISAFREG').AsString) >= vmasdia) And
      (strTodate(mtx3000.FMant.cds2.FieldByName('NISAFREG').AsString) <= vfecult) Then
   Begin
      Exit;
   End;

   ErrorMsg('Error', 'No se puede Eliminar la Nota de Salida '
      + mtx3000.FMant.cds2.FieldByName('NISAID').AsString + ' al' + #13 + #13
      + IntToStr(vday2) + ' de ' + LongMonthNames[vmonth2] + ' del ' + IntToStr(vyear2) + ' ' + #13 + #13 +
      'Fecha No esta dentro del Rango Permitido del ' + datetostr(vmasdia) + ' al ' + datetostr(vfecult));
   Result := True;
End;

Procedure TFToolNI.FormCreate(Sender: TObject);
Begin
   If (DMALM.wUsuario = 'HNORIEGA') Or
      (DMALM.wUsuario = 'FPAZOS') Then
   Begin
      sbtnAnular.Visible := True;
      sbtnEliminar.Visible := True;
      sbtnInicial.Visible := True;
   End;
End;

Procedure TFToolNI.sbtnInicialClick(Sender: TObject);
Var
   xSQL, cMes, cMeses, cMesT: String;
   nMes, mm: Integer;
Begin

   If validafecha Then
      Exit;

   If Question('Confirmar', 'Esta Seguro de Cambiar a Estado Inicial Nota de Ingreso ' + #13 + #13 +
      'Nº ' + mtx3000.FMant.cds2.FieldByName('NISAID').AsString + #13 +
      #13 + ' Desea Continuar ') Then
   Begin

      xSQL := 'SELECT * FROM LOG315 ' +
         ' WHERE CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsSQL.Filter := '';
      DMALM.cdsSQL.Filtered := False;
      DMALM.cdsSQL.IndexFieldNames := '';
      DMALM.cdsSQL.Close;
      DMALM.cdsSQL.DataRequest(xSQL);
      DMALM.cdsSQL.Open;

      xSQL := ' UPDATE LOG314 SET NISSIT=''INICIAL'' ' +
         ' WHERE CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

      xSQL := ' UPDATE LOG315 SET NISSIT=''INICIAL'' ' +
         ' WHERE CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

      If mtx3000.FMant.cds2.FieldByName('NISSIT').AsString = 'ACEPTADO' Then
      Begin
         cMes := Copy(DMALM.cdsSQL.FieldByName('KDXANOMM').AsString, 5, 2);
         nMes := StrToInt(cMes) + 1;

         DMALM.cdsSQL.First;
         While Not DMALM.cdsSQL.Eof Do
         Begin

            cMeses := '';
            If nMes <= 12 Then
            Begin
               For mm := nMes To 12 Do
               Begin
                  cMesT := DMALM.StrZero(IntToStr(mm), 2);
                  cMeses := cMeses + ', ' + 'STKTSG' + cMesT + '=STKTSG' + cMesT + '-' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               End;
            End;

            xSQL := 'UPDATE LOG316 '
               + 'SET STKSACTG=STKSACTG-' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ', '
               + 'STKSSG' + cMes + '=STKSSG' + cMes + '-' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               + cMeses
               + 'where CIAID=''' + DMALM.cdsSQL.FieldByName('CIAID').AsString + ''' '
               + 'and STKANO=''' + DMALM.cdsSQL.FieldByName('KDXANO').AsString + ''' '
               + 'and LOCID=''' + DMALM.cdsSQL.FieldByName('LOCID').AsString + ''' '
               + 'and TINID=''' + DMALM.cdsSQL.FieldByName('TINID').AsString + ''' '
               + 'and ALMID=''' + DMALM.cdsSQL.FieldByName('ALMID').AsString + ''' '
               + 'and GRARID=''' + DMALM.cdsSQL.FieldByName('GRARID').AsString + ''' '
              // VHNDEMA REVISAR PORQUE EN ALGUNOS CASOS NO GRABA LA FAMILIA Y SUBFAMILIA
              //+  'and FAMID='''  +DMALM.cdsSQL.FieldByName('FAMID').AsString  +''' '
              //+  'and SFAMID=''' +DMALM.cdsSQL.FieldByName('SFAMID').AsString +''' '
            + 'and ARTID=''' + DMALM.cdsSQL.FieldByName('ARTID').AsString + ''' ';
            DMALM.cdsTGE.Close;
            DMALM.cdsTGE.DataRequest(xSQL);
            DMALM.cdsTGE.Execute;

            xSQL := 'UPDATE TGE205 '
               + 'SET ARTCNTG=ARTCNTG-' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               + 'where CIAID=''' + DMALM.cdsSQL.FieldByName('CIAID').AsString + ''' '
               + 'and TINID=''' + DMALM.cdsSQL.FieldByName('TINID').AsString + ''' '
               + 'and GRARID=''' + DMALM.cdsSQL.FieldByName('GRARID').AsString + ''' '
               + 'and ARTID=''' + DMALM.cdsSQL.FieldByName('ARTID').AsString + ''' ';
            DMALM.cdsTGE.Close;
            DMALM.cdsTGE.DataRequest(xSQL);
            DMALM.cdsTGE.Execute;
         //Actualizando el stock y costo promedio
            xSQL := 'BEGIN DB2ADMIN.SP_ALM_ACTUALIZA_STOCK(' +
               QuotedStr(DMALM.cdsSQL.FieldByName('KDXANO').AsString) + ', ' +
               QuotedStr(DMALM.cdsSQL.FieldByName('CIAID').AsString) + ', ' +
               QuotedStr(DMALM.cdsSQL.FieldByName('LOCID').AsString) + ', ' +
               QuotedStr(DMALM.cdsSQL.FieldByName('TINID').AsString) + ', ' +
               QuotedStr(DMALM.cdsSQL.FieldByName('ALMID').AsString) + ', ' +
               QuotedStr(DMALM.cdsSQL.FieldByName('ARTID').AsString) + ') ; END ;';
            DMALM.DCOM1.AppServer.Ejecutasql(xSQL);

            DMALM.cdsSQL.Next;

         End;
       //Elimina en la tabla LO332  si es activo
         xSQL := ' DELETE LOG332 WHERE LOG332.CIAID = ' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString) +
            ' AND LOG332.TINID = ' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString) +
            ' AND LOG332.ALMID = ' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString) +
            ' AND LOG332.TDAID = ' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString) +
            ' AND LOG332.NISATIP = ' + Quotedstr('INGRESO') +
            ' AND LOG332.NISAID = ' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

      End;

      ShowMessage('Nota de Ingreso en Estado Inicial');
   End;
End;

Procedure TFToolNI.BitBtn2Click(Sender: TObject);
Var
   sDesde, sHasta: String;
   x10: Integer;
Begin
   If length(dblcCia.Text) = 0 Then Raise exception.Create('Falta Código de Compañía');
   If length(edtCia.Text) = 0 Then Raise exception.Create('Código de Compañía Errado');

   sDesde := formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime);
   sHasta := formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime);

   xSQL := 'SELECT A.CIAID, B.CIADES, A.LOCID, A.TINID, A.ALMID, C.ALMDES, A.TDAID, A.TRIID, TRIDES, '
      + 'A.NISATIP, A.NISAID, A.NISAFREG, A.PROV, A.ARTID, A.ARTDES, A.KDXCNTG, A.ARTPCG, A.ARTTOTALG, '
      + ''' Desde ' + sDesde + ' Hasta ' + sHasta + ''' RANGO '
      + 'FROM LOG315 A, TGE101 B, TGE151 C, TGE208 D, LOG314 Z '
      + 'WHERE A.CIAID=''' + dblcCia.Text + ''' and A.NISATIP=''INGRESO'' '
      + 'AND A.NISAFREG>=''' + sDesde + ''' AND A.NISAFREG<=''' + sHasta + ''' AND A.NISSIT=''ACEPTADO'' '
      + 'and A.ARTID LIKE ''%' + dbcldArti.Text + '%'' '
      + 'AND A.CIAID=B.CIAID(+) '
      + 'AND A.CIAID=C.CIAID(+) AND A.LOCID=C.LOCID(+) AND A.TINID=C.TINID(+) AND A.ALMID=C.ALMID(+) '
      + 'AND A.TRIID=D.TRIID(+) AND D.TRISGT=''I'' '
      + 'AND A.CIAID=Z.CIAID AND A.LOCID=Z.LOCID AND A.TINID=Z.TINID AND A.ALMID=Z.ALMID '
      + 'AND A.TDAID=Z.TDAID AND A.NISATIP=Z.NISATIP AND A.NISAID=Z.NISAID AND Z.NISSIT=''ACEPTADO'' '
      + 'ORDER BY A.ARTID, A.NISAFREG';

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      ppdb1.DataSource := Nil;
      Exit;
   End;
   Screen.Cursor := crHourglass;
   ppR1.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DetxArticulo.rtm';
   ppR1.template.LoadFromFile;

   ppdb1.DataSource := DMALM.dsReporte;

   Screen.Cursor := crDefault;

   If (DMALM.wUsuario = 'FPAZOS') Or (DMALM.wUsuario = 'HNORIEGA') Then
      ppd1.ShowModal
   Else
      ppr1.Print;

   ppR1.Stop;

   ppdb1.DataSource := Nil;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;

End;

Procedure TFToolNI.dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFToolNI.dblcCiaExit(Sender: TObject);
Begin
   If dblcCIA.text = '' Then
      edtCIA.text := ''
   Else
   Begin
      Screen.Cursor := crHourGlass;
      edtCIA.text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.text), 'CIADES');
      xSQL := 'SELECT * FROM TGE205 WHERE CIAID=' + QuotedStr(dblcCIA.Text) + ' ORDER BY ARTID';
      DMALM.cdsArti.Close;
      DMALM.cdsArti.DataRequest(xSQL);
      DMALM.cdsArti.Open;
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFToolNI.dbcldArtiEnter(Sender: TObject);
Begin
   If dblcCia.Text = '' Then
   Begin
      ShowMessage('Ingrese Compañía');
      dblcCia.SetFocus;
   End;
End;
//INICIO HPC_201202_ALM

Procedure TFToolNI.btnRptIngresosClick(Sender: TObject);
Var
   xSQL, xsFiltro: String;
   xsFiltroTexto1, xsFiltroTexto2, xsFiltroTexto3, xsFiltroTexto4: String;
   xsFiltroTexto5, xsFiltroTexto6, xsFiltroTexto7, xsFiltroTexto8: String;
   xsFiltroUsuario: String;
   xnContador: integer;
Begin
   xsFiltroUsuario := '';
   xsFiltroTexto1 := ' ';
   xsFiltroTexto2 := ' ';
   xsFiltroTexto3 := ' ';
   xsFiltroTexto4 := ' ';
   xsFiltroTexto5 := ' ';
   xsFiltroTexto6 := ' ';
   xsFiltroTexto7 := ' ';
   xsFiltroTexto8 := ' ';
   xsFiltro := '';
   For xnContador := 0 To mtx3000.FMant.lbFiltroReal.Count - 1 Do
   Begin
      If length(trim(xsFiltro)) = 0 Then
      Begin
         xsFiltro := mtx3000.FMant.lbFiltroReal.items[xnContador];
      End
      Else
      Begin
         xsFiltro := xsFiltro + ' AND ' + mtx3000.FMant.lbFiltroReal.items[xnContador];
      End;
      If xnContador = 0 Then
         xsFiltroTexto1 := mtx3000.FMant.lbFiltro.items[xnContador]
      Else
         If xnContador = 1 Then
            xsFiltroTexto2 := mtx3000.FMant.lbFiltro.items[xnContador]
         Else
            If xnContador = 2 Then
               xsFiltroTexto3 := mtx3000.FMant.lbFiltro.items[xnContador]
            Else
               If xnContador = 3 Then
                  xsFiltroTexto4 := mtx3000.FMant.lbFiltro.items[xnContador]
               Else
                  If xnContador = 4 Then
                     xsFiltroTexto5 := mtx3000.FMant.lbFiltro.items[xnContador]
                  Else
                     If xnContador = 5 Then
                        xsFiltroTexto6 := mtx3000.FMant.lbFiltro.items[xnContador]
                     Else
                        If xnContador = 6 Then
                           xsFiltroTexto7 := mtx3000.FMant.lbFiltro.items[xnContador]
                        Else
                           If xnContador = 7 Then xsFiltroTexto8 := mtx3000.FMant.lbFiltro.items[xnContador];
   End;
   If Length(Mtx3000.Filter) > 0 Then
   Begin
      xsFiltroUsuario := ' AND ' + Mtx3000.Filter;
   End;
   If length(trim(xsFiltro)) > 0 Then
   Begin
      xsFiltro := ' AND ' + xsFiltro;
   End;

   xSQL := ' SELECT LOG314.CIAID COMPANIAID, ' +
      ' LOG314.LOCID LOCALIDADID, ' +
      ' TGE126.LOCDES  LOCALIDADDES, ' +
      ' LOG314.TINID TIPOINVENTARIOID, ' +
      ' TGE152.TINDES TIPOINVENTARIODES, ' +
      ' LOG314.ALMID ALMACENID, ' +
      ' TGE151.ALMDES ALMACENDES,  ' +
      ' LOG314.NISAID NUMERO,  ' + //Nº SALIDA
      ' LOG314.CCOSID CETROCOSTOSID,  ' +
      ' (SELECT TGE203.CCOSDES FROM TGE203 WHERE TGE203.CCOSID = LOG314.CCOSID) CENTROCOSTOSDES, ' +
      ' LOG314.TRIID TIPOTRANSACCIONID,  ' +
      ' TGE208.TRIDES TIPOTRANSACCIONDES,  ' +
      ' LOG314.NISAFREG FECHA,  ' +
      ' LOG314.NISSIT ESTADO,  ' +
      ' LOG314.DOCID DOCREFERENCIAID,  ' +
      ' (SELECT TGE110.DOCDES FROM TGE110 WHERE LOG314.DOCID = TGE110.DOCID AND  TGE110.REFALM = ' + QuotedStr('S') + ' ) DOCREFERENCIADES, ' +
      ' LOG314.NISANDOC DOCREFERENCIA, ' +
      ' LOG314.NISASOLIC SOLICITANTE,  ' +
      ' LOG314.NISAOBS OBSERVACION,  ' +
      ' LOG314.NISAUSER USUARIO , ' +
      QuotedStr(DMALM.wUsuario) + ' USUARIO_IMPRIME, ' +
      QuotedStr(xsFiltroTexto1) + ' FILTRO1, ' +
      QuotedStr(xsFiltroTexto2) + ' FILTRO2, ' +
      QuotedStr(xsFiltroTexto3) + ' FILTRO3, ' +
      QuotedStr(xsFiltroTexto4) + ' FILTRO4, ' +
      QuotedStr(xsFiltroTexto5) + ' FILTRO5, ' +
      QuotedStr(xsFiltroTexto6) + ' FILTRO6, ' +
      QuotedStr(xsFiltroTexto7) + ' FILTRO7, ' +
      QuotedStr(xsFiltroTexto8) + ' FILTRO8 ' +
      ' FROM LOG314, TGE126, TGE152, TGE151, TGE208  ' +
      ' WHERE LOG314.CIAID = TGE126.CIAID  ' +
      ' AND LOG314.LOCID = TGE126.LOCID  ' +
      ' AND LOG314.CIAID = TGE152.CIAID  ' +
      ' AND LOG314.TINID = TGE152.TINID  ' +
      ' AND LOG314.CIAID = TGE151.CIAID  ' +
      ' AND LOG314.LOCID = TGE151.LOCID  ' +
      ' AND LOG314.TINID = TGE151.TINID  ' +
      ' AND LOG314.ALMID = TGE151.ALMID  ' +
      ' AND LOG314.TRIID = TGE208.TRIID  ' +
      ' AND TGE208.TRISGT = ' + QuotedStr('I') +
      ' AND LOG314.NISATIP = ' + QuotedStr('INGRESO') +
      xsFiltroUsuario + xsFiltro +
      ' ORDER BY LOG314.CIAID , LOG314.NISAID  ';
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppdbRptIngresos.DataSource := DMALM.dsReporte;
   pprRptIngresos.DataPipeline := ppdbRptIngresos;

   pprRptIngresos.Template.FileName := wRutaRpt + '\RptListaIngresos.rtm';
   pprRptIngresos.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppdRptIngresos.Report := pprRptIngresos ;
   //ppdRptIngresos.ShowModal() ;
   pprRptIngresos.Print;

End;
//FIN HPC_201202_ALM
End.

OPCION_1000;
1010000;
Adquisiciones;

OPCION_1010;
2010100;
Parámetros;
OPCION_1011;
3010101;
Parámetros;
OPCION_1012;
3010102;
Lista de Precios;
OPCION_1013;
3010103;
Enviar Lista de Precios;

OPCION_1020;
2010200;
Maestros;
OPCION_1021;
3010201;
Artículos;
OPCION_1022;
3010202;
Proveedores;

OPCION_1030;
2010300;
Transacciones;
OPCION_1031;
3010301;
Requerimiento de Usuario;
OPCION_1032;
3010302;
Transferencia de Req.;
OPCION_1033;
3010303;
Requisiciones;
OPCION_1034;
3010304;
Solicitud de Cotizaciones;
OPCION_1035;
3010305;
Envío de Solicitudes a Proveedores;
OPCION_1036;
3010306;
Proformas Directas;
OPCION_1037;
3010307;
Registro de Proformas;
OPCION_1038;
3010308;
Eval.Prof.Almacén;
OPCION_1039;
3010309;
Eval.Prof.Servicio;
OPCION_1040;
3010310;
Eval.Prof.Activo Fijo;
OPCION_1041;
3010311;
Ordenes de Compra;
OPCION_1042;
3010312;
Seg / Vis Requisiciones;
OPCION_1043;
3010313;
Seg / Vis Órdenes de Compra;
OPCION_1044;
3010314;
Req.Aut.por Punto de Reposición;

OPCION_1050;
2010400;
Procesos;
OPCION_1051;
3010401;
Depura Requisiciones Pendientes;
OPCION_1052;
3010402;
Depura Órdenes de Compra;

OPCION_1060;
2010500;
Consultas;
OPCION_1061;
3010501;
O.Compra Pendientes por Artículo;
OPCION_1062;
3010502;
Requisiciones Pendientes por Artículo;
OPCION_1063;
3010503;
Facturas por Pagar;
OPCION_1064;
3010504;
Articulos por Proveedor;
OPCION_1065;
3010505;
Proveedor por Artículos;
OPCION_1066;
3010506;
Consumo por Años;
OPCION_1067;
3010507;
Proveedores por Rubro;
OPCION_1068;
3010508;
Requerimientos Pendientes;
OPCION_1069;
3010509;
Detalle de O.Compra;

OPCION_1100;
1020000;
Inventarios;

OPCION_1110;
2020100;
Parámetros;
OPCION_1111;
3020101;
Parámetros;

OPCION_1120;
2020200;
Maestros;
OPCION_1121;
3020201;
De Artículos;
OPCION_1122;
3020202;
De Proveedores;
OPCION_1123;
3020203;
Parámetros de Reposición;
OPCION_1124;
3020204;
Ubicación de Artículo;

OPCION_1130;
2020300;
Registros;
OPCION_1131;
3020301;
Nota de Ingreso;
OPCION_1132;
3020302;
Nota de Salida;
OPCION_1133;
3020303;
Apertura / Cierre Operativo;
OPCION_1134;
3020304;
Cierre Anual;
OPCION_1135;
3020305;
Requisiciones;
OPCION_1136;
3020306;
Requisiciones Automáticas;

OPCION_1140;
2020400;
Consultas;
OPCION_1141;
3020401;
Kardex;
OPCION_1142;
3020402;
Saldos de Stock;
OPCION_1143;
3020403;
Detalle de Mov.de Almacén;
OPCION_1144;
3020404;
Consulta por Artículo;
OPCION_1145;
3020405;
Consumo por Centro de Costo;
OPCION_1146;
3020406;
Consumo por Artículos;
OPCION_1147;
3020407;
Consumo por Años;
OPCION_1149;
3020409;
Consulta de Artículo x Lote;

OPCION_1150;
2020500;
Inventario Físico;
OPCION_1151;
3020501;
Toma de Inventario Físico;
OPCION_1152;
3020502;
Genera Inventario;

OPCION_1160;
2020600;
Contabilidad de Inventarios;
OPCION_1161;
3020601;
Contabilización;
OPCION_1162;
3020602;
Contab.Inventarios;

OPCION_1300;
1040000;
Ventas;

OPCION_1310;
2040100;
Parámetros;
OPCION_1311;
3040101;
Parámetros;
OPCION_1312;
3040102;
Consulta T.Cambio;

OPCION_1320;
2040200;
Transacciones;
OPCION_1321;
3040201;
Proforma;
OPCION_1322;
3040202;
Facturación;
OPCION_1323;
3040203;
Lista de Precios;
OPCION_1324;
3040204;
Maestro de Clientes;
OPCION_1325;
3040205;
Descarga Depósitos en Banco;
OPCION_1326;
3040206;
Actualiza Datos;

OPCION_1330;
2040300;
Informes;
OPCION_1331;
3040301;
Consulta por Cliente;
OPCION_1332;
3040302;
Encinas;
OPCION_1331;
3040303;
Artículos Vendidos;
OPCION_1334;
3040304;
Documentos Emitidos;
OPCION_1335;
3040305;
Res.de Ventas por Vendedor;
OPCION_1336;
3040306;
Res.de Venta por Vencimiento;
OPCION_1337;
3040307;
Res.Venta Nacional - Importado;
OPCION_1338;
3040308;
Res.de Venta Neta por Línea;
OPCION_1339;
3040309;
Compras acumuladas de Cliente;
OPCION_1340;
3040310;
Comisiones;
OPCION_1341;
3040311;
Costo de Ventas;

OPCION_1400;
1050000;
Cuentas por Cobrar;

OPCION_1401;
2050100;
Parámetros;
OPCION_1402;
3050101;
Parámetros;
OPCION_1403;
3050102;
Dinámica Cont.Docs.;

OPCION_1410;
2050200;
Transacciones;
OPCION_1411;
3050201;
Maestro de Clientes;
OPCION_1412;
3050202;
Provisión;
OPCION_1413;
3050203;
Nota de Crédito;
OPCION_1414;
3050204;
Anticipos;
OPCION_1415;
3050205;
Aplicación de Abonos;
OPCION_1416;
3050206;
Contabilización de Aplicaciones;
OPCION_1417;
3050207;
Canje por Letras;
OPCION_1418;
3050208;
Renovación de Letras;
OPCION_1419;
3050209;
Gestión de Letras;
OPCION_1420;
3050210;
Dinámica Contable de Letras;
OPCION_1421;
3050211;
Contabilización de Letras;
OPCION_1422;
3050212;
Planilla de Bancos;
OPCION_1423;
3050213;
Nota de Cobranza;
OPCION_1424;
3050214;
Cierre Operativo;

OPCION_1430;
2050300;
Informes;
OPCION_1431;
3050301;
Registro de Ventas;
OPCION_1432;
3050302;
Registro de Letras;
OPCION_1433;
3050303;
Cuenta Corriente;
OPCION_1434;
3050304;
Movimientos por Estado Doc.;
OPCION_1435;
3050305;
Clientes con Saldo;
OPCION_1436;
3050306;
Movimientos por Cliente;
OPCION_1437;
3050307;
Cheques Diferidos;
OPCION_1438;
3050308;
Transferencia al DAOT;

