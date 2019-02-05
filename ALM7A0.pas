Unit ALM7A0;

//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : ALM7A0
//Formulario               : FToolNSal
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Toolbar de las Notas de Salida

//ACTUALIZACIONES

// HPP_201102_ALM 17/02/2011 -Se incrementa el grado de precisión en los cálculos a 5 decimales
//                            Por ese motivo se modifica el redondeo del reporte
//                           -Liberar el activo en la tabla LOG332
//                            cuando se anula o elimina la nota de salida
// HPC_201202_ALM 13/08/2012 -Se implementó un reporte que muestra la misma
//                            información que la ventana.
// HPC_201404_ALM 01/07/2014 -Se modifica el reporte de salidas valorizadas para que tome el costo promedio
// HPC_201404_ALM 11/11/2014 -Se Adiciona control para modificar diseño, un dato de pie de pagina para las firmas
//                           -Se modifica cabecera de reporte segun lo requerido por el usuario
// HPC_201605_ALM 04/07/2016: -  Se agrega estado "ELIMINADO" a notas de ingreso y notas de salida
//                               solo cuando estan en estado INICIAL. Se excluye eliminado físico.
//                               Se incluye actualización de usuario que acepta la NI/NS
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad


Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, StdCtrls, Buttons, ExtCtrls, ppProd, ppClass, ppReport, ppComm,
   ppRelatv, ppCache, ppDB, ppDBPipe, ppPrnabl, ppCtrls, ppBands,
   ppVar, ppViewr, ppEndUsr, ppTypes, fcButton, fcImgBtn,
   fcShapeBtn, ppParameter, ppStrtch, ppMemo, Mask, wwdbedit, wwdblook,
// Inicio HPC_201404_ALM
   wwdbdatetimepicker, db, Mant, MsgDlgs, jpeg;
// Fin HPC_201404_ALM

Type
   TFToolNSal = Class(TForm)
      pnlTool: TPanel;
      Z1bbtNSalValoriz: TBitBtn;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
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
      ppDesigner1: TppDesigner;
      Timer1: TTimer;
      sbtnAnular: TfcShapeBtn;
      sbtnEliminar: TfcShapeBtn;
      Z2bbtnPrint: TBitBtn;
      ppDBCab: TppDBPipeline;
      ppdbOC: TppDBPipeline;
      pprNisSal: TppReport;
      ppHeaderBand4: TppHeaderBand;
      ppDBText49: TppDBText;
      ppDBText58: TppDBText;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppLabel60: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppLabel67: TppLabel;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppLabel68: TppLabel;
      ppDBMemo3: TppDBMemo;
      ppLabel69: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppLabel70: TppLabel;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppLine8: TppLine;
      ppLabel71: TppLabel;
      ppLabel72: TppLabel;
      pplblCosRepo: TppLabel;
      pplblCosRepo1: TppLabel;
      ppDBText35: TppDBText;
      ppLabel73: TppLabel;
      ppDBText36: TppDBText;
      ppDBText37: TppDBText;
      ppDBText57: TppDBText;
      ppLabel74: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText60: TppDBText;
      ppDBText62: TppDBText;
      ppDBText63: TppDBText;
      ppDBMemo2: TppDBMemo;
      ppDBText38: TppDBText;
      ppDBText39: TppDBText;
      ppDBText40: TppDBText;
      ppdbCosRepo: TppDBText;
      ppFooterBand4: TppFooterBand;
      ppLine9: TppLine;
      ppLine10: TppLine;
      ppLabel75: TppLabel;
      ppLabel76: TppLabel;
      ppDBText41: TppDBText;
      ppLabel77: TppLabel;
      ppSummaryBand4: TppSummaryBand;
      ppLabel78: TppLabel;
      ppDBCalc21: TppDBCalc;
      ppLabel79: TppLabel;
      ppDBCalc22: TppDBCalc;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppParameterList2: TppParameterList;
      ppDesigner2: TppDesigner;
      ppDBSerie: TppDBPipeline;
      pprSeries: TppReport;
      ppHeaderBand5: TppHeaderBand;
      ppLabel80: TppLabel;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppLabel81: TppLabel;
      ppLabel82: TppLabel;
      ppLabel83: TppLabel;
      ppLabel84: TppLabel;
      ppDBText44: TppDBText;
      ppDBText45: TppDBText;
      ppLabel85: TppLabel;
      ppLabel86: TppLabel;
      ppLabel87: TppLabel;
      ppSystemVariable11: TppSystemVariable;
      ppDBText46: TppDBText;
      ppLabel88: TppLabel;
      ppLabel89: TppLabel;
      ppLabel90: TppLabel;
      ppLabel91: TppLabel;
      ppDBText47: TppDBText;
      ppDBText48: TppDBText;
      ppDBText50: TppDBText;
      ppLine13: TppLine;
      ppDetailBand5: TppDetailBand;
      ppDBText51: TppDBText;
      ppDBText52: TppDBText;
      ppDBText53: TppDBText;
      ppDBText54: TppDBText;
      ppFooterBand5: TppFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppDBText55: TppDBText;
      ppDBText56: TppDBText;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppParameterList1: TppParameterList;
      sbtnInicial: TfcShapeBtn;
      gbTransf: TGroupBox;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      lblCIA: TLabel;
      lblTransacc: TLabel;
      dblcTransac: TwwDBLookupCombo;
      dbeTransac: TwwDBEdit;
      bbtnRepTipTrans: TBitBtn;
      ppdbSus: TppDBPipeline;
      pprSus: TppReport;
      ppHeaderBand6: TppHeaderBand;
      ppDetailBand6: TppDetailBand;
      ppFooterBand6: TppFooterBand;
      ppd2: TppDesigner;
      dtpDesde: TwwDBDateTimePicker;
      dtpHasta: TwwDBDateTimePicker;
      GroupBox1: TGroupBox;
      fcsGuia: TfcShapeBtn;
      fcsbtnGuiaNueva: TfcShapeBtn;
      btnRptSalidas: TBitBtn;
      ppdbRptSalidas: TppDBPipeline;
      pprRptSalidas: TppReport;
      ppdRptSalidas: TppDesigner;
      ppHeaderBand7: TppHeaderBand;
      ppDetailBand7: TppDetailBand;
      ppFooterBand7: TppFooterBand;
      ppParameterList3: TppParameterList;
      chkdis: TCheckBox;
    ppHeaderBand2: TppHeaderBand;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
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
    pplblNDocRef: TppLabel;
    ppLabel28: TppLabel;
    pplblTCambio: TppLabel;
    pplblDocId: TppLabel;
    pplblDocDes: TppLabel;
    ppLabel29: TppLabel;
    pplblUsuario: TppLabel;
    ppDBText26: TppDBText;
    pplblNISA: TppLabel;
    ppLabel38: TppLabel;
    ppLabel51: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppImage1: TppImage;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel31: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel27: TppLabel;
    pplblDOCREF: TppLabel;
    pplblalmacenorigen: TppLabel;
    pplblalmacendestino: TppLabel;
    pplblproveedor: TppLabel;
    ppDBText64: TppDBText;
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
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppDBText59: TppDBText;
    ppLabel94: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc6: TppDBCalc;
    ppDBCalc8: TppDBCalc;
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
    //Fin HPC_201404_ALM
      Procedure FormCreate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure ppRSalidaAcumPreviewFormCreate(Sender: TObject);
      Procedure Z1bbtNSalValorizClick(Sender: TObject);
      Procedure ppRNSPreviewFormCreate(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure sbtnAnularClick(Sender: TObject);
      Procedure sbtnEliminarClick(Sender: TObject);
      Procedure Z2bbtnPrintClick(Sender: TObject);
      Procedure pprNisSalPreviewFormCreate(Sender: TObject);
      Procedure sbtnInicialClick(Sender: TObject);
      Procedure fcsbtnGuiaNuevaClick(Sender: TObject);
      Procedure fcsGuiaClick(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcTransacExit(Sender: TObject);
      Procedure bbtnRepTipTransClick(Sender: TObject);
      Procedure fcbtnEditaGuiaClick(Sender: TObject);
      Procedure dblcCIANotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure btnRptSalidasClick(Sender: TObject);
      Procedure fg_CerrarVentana(Sender: TObject);
   Private
    { Private declarations }
      wODCIDs: String;
      Function validafecha: boolean;
      Function Nuevafecha: Boolean;
      Function fg_VerificaVentanasAbiertas: Boolean;
   Public
    { Public declarations }
   End;

Var
   FToolNSal: TFToolNSal;
   xAccesoBotones: Boolean;
   xsVentanaAbierta: String;

Implementation

// ALM220 - GUIA DE REMISION
//Incio HPC_201404_ALM
//Uses ALMDM1, MsgDlgs, ALM411, oaIN3000, ALM220, ALM222, ALM223;
Uses ALMDM1, ALM411, oaIN3000, ALM220, ALM222, ALM223;
//Fin HPC_201404_ALM
{$R *.DFM}

Procedure TFToolNSal.FormCreate(Sender: TObject);
Begin
   dtpHasta.Date := DateS;
   dblcCIA.LookupTable := DMALM.cdsCIA;
//Incio HPC_201404_ALM
// If (DMALM.wUsuario = 'HNORIEGA') Or
//    (DMALM.wUsuario = 'FPAZOS') Then
   If (DMALM.wUsuario = 'HNORIEGA') Then
//Fin HPC_201404_ALM
   Begin
      sbtnAnular.Visible := True;
      sbtnEliminar.Visible := True;
      sbtnInicial.Visible := True;
   End;
End;

Procedure TFToolNSal.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
    //if self.ActiveControl Is TDBMemo then Exit;
    //if self.ActiveControl Is TMemo then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFToolNSal.BitBtn1Click(Sender: TObject);
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

Procedure TFToolNSal.ppRSalidaAcumPreviewFormCreate(Sender: TObject);
Begin
   ppRSalidaAcum.PreviewForm.ClientHeight := 500;
   ppRSalidaAcum.PreviewForm.ClientWidth := 650;
   TppViewer(ppRSalidaAcum.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolNSal.Z1bbtNSalValorizClick(Sender: TObject);
Var
   xSQL, sODCIDs, sCIA, sALM, sTDA, sNISA, sLOC, sTin, XCampo: String;
   bCIA, bALM, bTDA, bNISAID, bLOC, bTin: Boolean;
   sSQL, sWhere, xProv: String;
   sTRIID: String;
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
   sTRIID := mtx4000.FMant.cds2.fieldbyname('TRIID').AsString;
   xSQL := 'Select * '
      + '     from LOG315 '
      + '    where NISATIP=''SALIDA'' '
      + '      and NISAID=''' + mtx4000.FMant.cds2.FieldByName('NISAID').AsString + ''' '
      + '      and CIAID =''' + mtx4000.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + '      and LOCID =''' + mtx4000.FMant.cds2.FieldByName('LOCID').AsString + ''' '
      + '      and TINID =''' + mtx4000.FMant.cds2.FieldByName('TINID').AsString + ''' '
      + '      and ALMID =''' + mtx4000.FMant.cds2.FieldByName('ALMID').AsString + ''' '
      + '      and TDAID =''' + mtx4000.FMant.cds2.FieldByName('TDAID').AsString + ''' '
      + '    order by KDXID';
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(xSQL);
   DMALM.cdsKDX.Open;

   xSQL := 'Select * '
      + '     from LOG318 '
      + '    where NISAID=''' + mtx4000.FMant.cds2.FieldByName('NISAID').AsString + ''' '
      + '      and CIAID =''' + mtx4000.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + '      and LOCID =''' + mtx4000.FMant.cds2.FieldByName('LOCID').AsString + ''' '
      + '      and TINID =''' + mtx4000.FMant.cds2.FieldByName('TINID').AsString + ''' '
      + '      and ALMID =''' + mtx4000.FMant.cds2.FieldByName('ALMID').AsString + ''' '
      + '      and TDAID =''' + mtx4000.FMant.cds2.FieldByName('TDAID').AsString + ''' '
      + '    order by ODCID';
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
   xSQL := 'Select nvl(TRITRDES,'''') DESTINO from TGE208 where TRIID=' + quotedstr(sTRIID);
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;
   If length(DMALM.cdsQry.FieldByName('DESTINO').AsString) > 0 Then // sTRIID = '06' Then // Salida por Transferencia
   Begin
      sWhere := ' AND B.CIAID(+)=A.CIAID AND B.LOCID(+)=A.LOCORIID AND B.TINID(+)=A.TINORIID AND B.ALMID(+)=A.ALMORIID '
         +      ' AND C.CIAID(+)=A.CIAID AND C.LOCID(+)=A.LOCID    AND C.TINID(+)=A.TINID    AND C.ALMID(+)=A.ALMID ';
      xSQL := 'Select NISATCAMB,NISASOLIC,NISAOBS,TRIID,B.ALMDES ALMDESTINO,C.ALMDES ALMORIGEN From LOG314 A, TGE151 B,TGE151 C ';
   End
   Else
   Begin
      sWhere := ' ';
      xSQL := 'Select NISATCAMB,NISASOLIC,NISAOBS,TRIID From LOG314 A ';
   End;
   xSQL := xSQL
      + ' WHERE A.CIAID=' + quotedstr(sCIA)
      + '   AND A.LOCID=' + quotedstr(sLOC)
      + '   AND A.ALMID=' + quotedstr(sALM)
      + '   AND A.NISAID=' + quotedstr(sNISA)
      + '   AND A.TINID=' + quotedstr(sTIN)
      + '   AND A.TDAID=' + quotedstr(sTDA)
      + '   AND A.NISATIP=' + quotedstr('SALIDA') + sWhere;
   DMALM.cdsTGE.Close;
   DMALM.cdsTGE.DataRequest(xSQL);
   DMALM.cdsTGE.Open;

   If DMALM.cdsTGE.FieldByname('NISATCAMB').AsFloat <= 0 Then
   Begin
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
   End
   Else
      fTCambio := DMALM.cdsTGE.FieldByname('NISATCAMB').AsFloat;

   sSQL := 'Select A.NISAID, A.CIAID, A.GRARID, B.GRARDES, A.KDXID, A.ARTID, A.ARTPCG, A.ARTDES, A.UNMIDG, A.KDXCNTG, NISAFREG, '
      + '          Round(CASE WHEN TMONID=''D'' THEN NVL(ARTPCG,0)*NVL(' + floattostr(fTCambio) + ',0) ELSE NVL(ARTPCG,0) END,5) COSTOMN,'
      + '          Round(CASE WHEN TMONID=''D'' THEN NVL(ARTPCG,0) ELSE NVL(ARTPCG,0)/NVL(' + floattostr(fTCambio) + ',0) END,5) COSTOME,'
      + '          Round(CASE WHEN TMONID=''D'' THEN (NVL(ARTPCG,0)*NVL(' + floattostr(fTCambio) + ',0))*NVL(KDXCNTG,0) ELSE NVL(ARTPCG,0)*NVL(KDXCNTG,0) END,5) SUBTMN,'
      + '          Round(CASE WHEN TMONID=''D'' THEN NVL(ARTPCG,0)*NVL(KDXCNTG,0) ELSE (NVL(ARTPCG,0)/NVL(' + floattostr(fTCambio) + ',0))*NVL(KDXCNTG,0) END,5) SUBTME,'
      + '          ''Hecho por : ''||D.USERNOM HECHOPOR, A.NISSIT, C.ALMDES '
      + '     from LOG315 A, TGE131 B, TGE006 D, TGE151 C  '
      + '    where A.CIAID=' + quotedstr(sCIA)
      + '      and A.LOCID=' + quotedstr(sLOC)
      + '      and A.ALMID=' + quotedstr(sALM)
      + '      and A.NISAID=' + quotedstr(sNISA)
      + '      and A.TINID=' + quotedstr(sTIN)
      + '      and A.TDAID=' + quotedstr(sTDA)
      + '      and A.NISATIP=''SALIDA'' '
      + '      and B.CIAID(+)=A.CIAID and B.TINID(+)=A.TINID and B.GRARID(+)=A.GRARID '
      + '      and A.KDXUSER=D.USERID(+) '
      + '      and C.CIAID(+)=A.CIAID and C.TINID(+)=A.TINID and C.ALMID(+)=A.ALMID '
      + '    order by A.GRARID';
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
   pplblDOCDES.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE208', 'TRIDES', 'TRIID=' + quotedstr(mtx4000.FMant.cds2.fieldbyname('TRIID').AsString) + ' AND TRISGT = ' + QuotedStr('S'), 'TRIDES');
   pplblTCambio.Caption := floattostr(fTCambio);
   pplblDOCREF.Caption := DMALM.DisplayDescrip('prvSQL', 'TGE110', 'DOCDES', 'DOCID=' + quotedstr(mtx4000.FMant.cds2.fieldbyname('DOCID').AsString), 'DOCDES');
   pplblNDOCREF.Caption := mtx4000.FMant.cds2.fieldbyname('NISANDOC').AsString;

   If Length(trim(mtx4000.FMant.cds2.fieldbyname('PROV').AsString)) > 0 Then
   Begin
      xProv := DMALM.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');
      pplblproveedor.Caption := 'Proveedor: ' + mtx4000.FMant.cds2.fieldbyname('PROV').AsString + ' - ' + DMALM.DisplayDescrip('dspUltTGE', 'TGE201', 'PROVDES', 'CLAUXID=' + quotedstr(xProv) + ' and PROV=' + quotedstr(mtx4000.FMant.cds2.fieldbyname('PROV').AsString), 'PROVDES')
   End
   Else
      pplblproveedor.Caption := '';

//   pplblalmacenorigen.Caption := 'Almacén Origen : ' + DMALM.cdsTGE.FieldByname('ALMORIGEN').AsString;
   pplblalmacenorigen.Caption := 'Almacén Origen : ' + DMALM.cdsReporte.FieldByname('ALMDES').AsString;
   pplblalmacendestino.Caption := '';
   If DMALM.cdsTGE.FieldByName('TRIID').AsString = '06' Then
      pplblalmacendestino.Caption := 'Almacén Destino: ' + DMALM.cdsTGE.FieldByname('ALMDESTINO').AsString;


   pplblUsuario.Caption := DMALM.wUsuario;
   ppLabel1.Caption := 'GUIA DE SALIDA VALORIZADA Nº ' + mtx4000.FMant.cds2.fieldbyname('NISAID').AsString;
   ppLabel51.Caption := DMALM.DisplayDescrip('prvSQL', 'TGE203', 'CCOSDES', 'CCOSID=' + quotedStr(mtx4000.FMant.cds2.fieldbyname('CCOSID').AsString), 'CCOSDES');

   Screen.Cursor := crDefault;

   ppDBCab.DataSource := DMALM.dsTGE;
   If (chkdis.Checked) Then
   Begin
      ppDesigner1.Report := pprNS;
      ppDesigner1.ShowModal;
   End
   Else
   Begin
      pprNS.Print;
      pprNS.stop;
      ppDBNS.DataSource := Nil;
      DMALM.cdsReporte.IndexFieldNames := '';
   End;
End;

Procedure TFToolNSal.ppRNSPreviewFormCreate(Sender: TObject);
Begin
   ppRNS.PreviewForm.ClientHeight := 500;
   ppRNS.PreviewForm.ClientWidth := 650;
   TppViewer(ppRNS.PreviewForm.Viewer).ZoomSetting := zsPagewidth;

End;

Procedure TFToolNSal.BitBtn2Click(Sender: TObject);
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
   pplblDOCREF1.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE157', 'TDADES', 'TDAID=' + quotedstr(mtx4000.FMant.cds2.fieldbyname('TDAID').AsString), 'TDADES');
   pplblNDOCREF1.Caption := mtx4000.FMant.cds2.fieldbyname('NISANDOC').AsString;
   pplbl60.Caption := DMALM.wUsuario;
   ppLabel30.Caption := 'GUIA DE SALIDA VALORIZADA   Nº  ' + mtx4000.FMant.cds2.fieldbyname('NISAID').AsString;
   Screen.Cursor := crDefault;
   pprCarta.Print;
   pprCarta.stop;
   ppDBCarta.DataSource := Nil;

End;

Procedure TFToolNSal.Timer1Timer(Sender: TObject);
Begin
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolNSal);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

Procedure TFToolNSal.sbtnAnularClick(Sender: TObject);
Var
   xSQL, cMes, cMeses, cMesT: String;
   nMes, mm: Integer;
Begin

   If mtx4000.FMant.cds2.FieldByName('NISSIT').AsString = 'ANULADO' Then
   Begin
      ShowMessage('Salida de Almacén ya fue Anulado. Verifique...');
      Exit;
   End;

   If validafecha Then
      Exit;

   //temporalmente quitado para hacer prueba
   {
   if Copy(mtx4000.FMant.cds2.FieldByName('NISAOBS').AsString,1,11)='FACTURA NRO' then
   begin
      ShowMessage('Nota de Salida '+mtx4000.FMant.cds2.FieldByName('NISAID').AsString+'.'+#13
                 +'Fue Generada por Factura o Boleta de Venta.'
                 + #13+#13+'No se Puede Eliminar desde Almacen' );
      Exit;
   end;
   }
   If Question('Confirmar', 'Esta Seguro de Anular Nota de Salida ' + #13 + #13 +
      'Nº ' + mtx4000.FMant.cds2.FieldByName('NISAID').AsString + #13 +
      #13 + ' Desea Continuar ') Then
   Begin

      xSQL := 'SELECT * FROM LOG315 ' +
         ' WHERE CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsSQL.Filter := '';
      DMALM.cdsSQL.Filtered := False;
      DMALM.cdsSQL.IndexFieldNames := '';
      DMALM.cdsSQL.Close;
      DMALM.cdsSQL.DataRequest(xSQL);
      DMALM.cdsSQL.Open;

      xSQL := ' UPDATE LOG314 SET NISSIT=''ANULADO'' ' +
         ' WHERE CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

      xSQL := ' UPDATE LOG315 SET NISSIT=''ANULADO'' ' +
         ' WHERE CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

     //liberando el activo
      xSQL := ' UPDATE LOG332 SET ESTADOID = ' + QuotedStr('X') + ',' +
         ' ENTREGADO = ' + QuotedStr('N') + ',' +
         ' NFAC = NULL,  TDAID2 = NULL ' +
         ' , OTRNDOC = NULL' +
         ' WHERE CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID2=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NFAC=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

      If mtx4000.FMant.cds2.FieldByName('NISSIT').AsString = 'ACEPTADO' Then
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
                  cMeses := cMeses + ', ' + 'STKTSG' + cMesT + '=STKTSG' + cMesT + '+' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               End;
            End;

            xSQL := 'UPDATE LOG316 '
               + 'SET STKSACTG=STKSACTG+' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ', '
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
      ShowMessage('Nota de Salida Anulada');
   End;
End;

Function TFToolNSal.validafecha: boolean;
Var
   sSQL: String;
Begin
   Result := False;

   sSQL := 'SELECT * FROM LOG317 '
      + 'WHERE LOG317.CIAID=' + QUOTEDSTR(mtx4000.FMant.cds2.FieldByName('CIAID').AsString)
      + ' AND LOG317.LOCID=' + QUOTEDSTR(mtx4000.FMant.cds2.FieldByName('LOCID').AsString)
      + ' AND LOG317.ALMID=' + QUOTEDSTR(mtx4000.FMant.cds2.FieldByName('ALMID').AsString)
      + ' AND LOG317.TINID=' + QUOTEDSTR(mtx4000.FMant.cds2.FieldByName('TINID').AsString)
      + ' ORDER BY CIAID, LOCID, TINID, ALMID, CNSULTCIE';
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

Function TFToolNSal.Nuevafecha: Boolean;
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
   DecodeDate(strTodate(mtx4000.FMant.cds2.FieldByName('NISAFREG').AsString), vyear2, vmonth2, vday2); //digitada
   If (strTodate(mtx4000.FMant.cds2.FieldByName('NISAFREG').AsString) >= vmasdia) And
      (strTodate(mtx4000.FMant.cds2.FieldByName('NISAFREG').AsString) <= vfecult) Then
   Begin
      Exit;
   End;

   ErrorMsg('Error', 'No se puede Eliminar la Nota de Salida '
      + mtx4000.FMant.cds2.FieldByName('NISAID').AsString + ' al' + #13 + #13
      + IntToStr(vday2) + ' de ' + LongMonthNames[vmonth2] + ' del ' + IntToStr(vyear2) + ' ' + #13 + #13 +
      'Fecha No esta dentro del Rango Permitido del ' + datetostr(vmasdia) + ' al ' + datetostr(vfecult));
   Result := True;
End;

Procedure TFToolNSal.sbtnEliminarClick(Sender: TObject);
Var
   xSQL, cMes, cMeses, cMesT: String;
   nMes, mm: Integer;
Begin

// Inicio HPC_201605_ALM
// Se excluye eliminado físico y se agrega nuevo estado "ELIMINADO"

   If validafecha Then
      Exit;

  xSQL := 'SELECT * FROM LOG314 ' +
         ' WHERE CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
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
      Information(Caption, 'Esta Nota de Salida ya fue Aceptada o Eliminada ');
      exit;
   End;

     xSQL := 'SELECT * FROM LOG315 ' +
         ' WHERE CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsSQL.Filter := '';
      DMALM.cdsSQL.Filtered := False;
      DMALM.cdsSQL.IndexFieldNames := '';
      DMALM.cdsSQL.Close;
      DMALM.cdsSQL.DataRequest(xSQL);
      DMALM.cdsSQL.Open;

      Screen.Cursor := crDefault;
      If DMALM.cdsSQL.RecordCount > 0 Then
         Information(Caption, ' Esta Nota de Salida Tiene Detalle ');

      If Question('Confirmar', 'Esta Seguro de Eliminar Nota de Salida ' + #13 + #13 +
         'Nº ' + mtx4000.FMant.cds2.FieldByName('NISAID').AsString + #13 +
          #13 + ' Desea Continuar ? ') Then

      Begin
        xSQL := ' Update LOG314     '
        +'  set NISSIT = ''ELIMINADO'', SITFREG=trunc(sysdate), SITHREG=Sysdate, NISAUSER='+quotedstr(DMALM.wUsuario) + ','
        +'  NISAOBS ='  + quotedstr('Eliminada por Usuario : ' + DMALM.wUsuario)
        +' where  CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString)
        +' and    LOCID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString)
        +' and    TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString)
        +' and    ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString)
        +' and    TDAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString)
        +' and  NISATIP=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISATIP').AsString)
        +' and   NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

      xSQL := ' Update LOG315  '
       + ' set NISSIT = ''ELIMINADO'', KDXFREG=trunc(sysdate), KDXHREG=Sysdate, KDXUSER='+quotedstr(DMALM.wUsuario)
       + ' where CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString)
       + ' and LOCID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString)
       + ' and TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString)
       + ' and ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString)
       + ' and TDAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString)
       + ' and NISATIP=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISATIP').AsString)
       + ' and NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

      If mtx4000.FMant.cds2.FieldByName('NISSIT').AsString = 'ACEPTADO' Then
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
                  cMeses := cMeses + ', ' + 'STKTSG' + cMesT + '=STKTSG' + cMesT + '+' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               End;
            End;

            xSQL := 'UPDATE LOG316 '
               + 'SET STKSACTG=STKSACTG+' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ', '
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

      ShowMessage('Nota de Salida Eliminada');
   End;
// Fin HPC_201605_ALM

End;

Procedure TFToolNSal.Z2bbtnPrintClick(Sender: TObject);
Var
   sSQL, sCIA, sLOC, sTIN, sALM, sTDO, sNISA, sTip: String;
   x10: integer;
Begin
   If Not Question(Caption, 'Impresión en Bloque de las Notas de Salida de Almacen: ' + #13 + #13 +
      'Se imprimira a partir del Registro Actual hasta el ultimo Registro' + #13 + #13 +
      'Desea Continuar ?') Then
   Begin
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   While Not mtx4000.FMant.cds2.Eof Do
   Begin

      sCIA := mtx4000.FMant.cds2.fieldbyname('CIAID').AsString;
      sLOC := mtx4000.FMant.cds2.fieldbyname('LOCID').AsString;
      sTIN := mtx4000.FMant.cds2.fieldbyname('TINID').AsString;
      sALM := mtx4000.FMant.cds2.fieldbyname('ALMID').AsString;
      sTDO := mtx4000.FMant.cds2.fieldbyname('TDAID').AsString;
      sNISA := mtx4000.FMant.cds2.fieldbyname('NISAID').AsString;
      sTIP := 'SALIDA';

      DMALM.ppRptNotaSE(sSQL, sCIA, sLOC, sTIN, sALM, sTDO, sNISA, sTip);
      ppDBCab.DataSource := DMALM.dsQry;
      ppdbOC.DataSource := DMALM.dsSQL;
      pprNisSal.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\NisaSal.rtm';
      pprNisSal.Template.LoadFromFile;
      Screen.Cursor := crDefault;

      pplblCosRepo.Visible := True;
      pplblCosRepo1.Visible := True;
      ppdbcosRepo.Visible := True;
  {
  if ( DMALM.wUsuario='BALBARRACIN' ) or
     ( DMALM.wUsuario='HNORIEGA' )   or
     ( DMALM.wUsuario='RMEDINA' )   or
     ( DMALM.wUsuario='MVARCE' )   then
  begin
     ppDesigner1.Report:=pprNisSal;
     ppDesigner1.ShowModal;
  end
  else }
      pprNisSal.Print;

      pprNisSal.Stop;

      sSQL := 'select ARTID,ARTDES,ACFSERIE,MARCA,MODELO,COLOR '
         + 'from LOG332 A '
         + 'where A.CIAID=' + quotedstr(sCia)
         + '  and A.ALMID=' + quotedstr(sAlm)
         + '  and A.TINID=' + quotedstr(sTin)
         + '  and A.TDAID2=' + quotedstr(sTDO)
         + '  and A.NFAC=' + quotedstr(sNISA);
      DMALM.cdsKDXSerie.MasterSource := Nil;
      DMALM.cdsKDXSerie.MasterFields := '';
      DMALM.cdsKDXSerie.Filter := '';
      DMALM.cdsKDXSerie.Filtered := False;
      DMALM.cdsKDXSerie.IndexFieldNames := '';
      DMALM.cdsKDXSerie.Close;
      DMALM.cdsKDXSerie.DataRequest(sSQL);
      DMALM.cdsKDXSerie.Open;
      DMALM.cdsKDXSerie.IndexFieldNames := 'ARTID';
      If DMALM.cdsKDXSerie.recordcount > 0 Then
      Begin
         ppDBSerie.MasterDataPipeline := Nil;
         ppDBSerie.DataSource := DMALM.dsKDXSerie;
         pprSeries.DataPipeLine := ppDBSerie;
         pprSeries.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\NSalidaSerie.rtm';
         pprSeries.Template.LoadFromFile;
      {
      if ( DMALM.wUsuario='BALBARRACIN' ) or
         ( DMALM.wUsuario='HNORIEGA' )   or
         ( DMALM.wUsuario='RMEDINA' )   or
         ( DMALM.wUsuario='MVARCE' )   then
      begin
         ppDesigner1.Report:=pprSeries;
         ppDesigner1.ShowModal;
      end
      else}
         pprSeries.Print;

         pprSeries.Stop;

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
      ppDBCab.DataSource := Nil;
      ppdbOC.DataSource := Nil;
      ppDBSerie.DataSource := Nil;

      mtx4000.FMant.cds2.Next;
   End;
   ShowMessage('ok');
End;

Procedure TFToolNSal.pprNisSalPreviewFormCreate(Sender: TObject);
Begin
   pprNisSal.PreviewForm.ClientHeight := 500;
   pprNisSal.PreviewForm.ClientWidth := 650;
   TppViewer(pprNisSal.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolNSal.sbtnInicialClick(Sender: TObject);
Var
   xSQL, cMes, cMeses, cMesT: String;
   nMes, mm: Integer;
Begin

   If validafecha Then
      Exit;

   If Question('Confirmar', 'Esta Seguro de Cambiar a Estado Inicial Nota de Salida ' + #13 + #13 +
      'Nº ' + mtx4000.FMant.cds2.FieldByName('NISAID').AsString + #13 +
      #13 + ' Desea Continuar ') Then
   Begin

      xSQL := 'SELECT * FROM LOG315 ' +
         ' WHERE CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsSQL.Filter := '';
      DMALM.cdsSQL.Filtered := False;
      DMALM.cdsSQL.IndexFieldNames := '';
      DMALM.cdsSQL.Close;
      DMALM.cdsSQL.DataRequest(xSQL);
      DMALM.cdsSQL.Open;

      xSQL := ' UPDATE LOG314 SET NISSIT=''INICIAL'' ' +
         ' WHERE CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

      xSQL := ' UPDATE LOG315 SET NISSIT=''INICIAL'' ' +
         ' WHERE CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString) +
         ' AND LOCID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString) +
         ' AND TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString) +
         ' AND ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString) +
         ' AND TDAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString) +
         ' AND NISATIP=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISATIP').AsString) +
         ' AND NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

      If mtx4000.FMant.cds2.FieldByName('NISSIT').AsString = 'ACEPTADO' Then
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
                  cMeses := cMeses + ', ' + 'STKTSG' + cMesT + '=STKTSG' + cMesT + '+' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               End;
            End;

            xSQL := 'UPDATE LOG316 '
               + 'SET STKSACTG=STKSACTG+' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ', '
               + 'STKSSG' + cMes + '=STKSSG' + cMes + '+' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               + cMeses
               + 'where CIAID=''' + DMALM.cdsSQL.FieldByName('CIAID').AsString + ''' '
               + 'and STKANO=''' + DMALM.cdsSQL.FieldByName('KDXANO').AsString + ''' '
               + 'and LOCID=''' + DMALM.cdsSQL.FieldByName('LOCID').AsString + ''' '
               + 'and TINID=''' + DMALM.cdsSQL.FieldByName('TINID').AsString + ''' '
               + 'and ALMID=''' + DMALM.cdsSQL.FieldByName('ALMID').AsString + ''' '
               + 'and GRARID=''' + DMALM.cdsSQL.FieldByName('GRARID').AsString + ''' '
               + 'and ARTID=''' + DMALM.cdsSQL.FieldByName('ARTID').AsString + ''' ';
            DMALM.cdsTGE.Close;
            DMALM.cdsTGE.DataRequest(xSQL);
            DMALM.cdsTGE.Execute;

            xSQL := 'UPDATE TGE205 '
               + 'SET ARTCNTG=ARTCNTG+' + DMALM.cdsSQL.FieldByName('KDXCNTG').AsString + ' '
               + 'where CIAID=''' + DMALM.cdsSQL.FieldByName('CIAID').AsString + ''' '
               + 'and TINID=''' + DMALM.cdsSQL.FieldByName('TINID').AsString + ''' '
               + 'and GRARID=''' + DMALM.cdsSQL.FieldByName('GRARID').AsString + ''' '
               + 'and ARTID=''' + DMALM.cdsSQL.FieldByName('ARTID').AsString + ''' ';
            DMALM.cdsTGE.Close;
            DMALM.cdsTGE.DataRequest(xSQL);
            DMALM.cdsTGE.Execute;
            DMALM.cdsSQL.Next;

         End;

      End;

      ShowMessage('Nota de Ingreso en Estado Inicial');
   End;
End;

Procedure TFToolNSal.fcsbtnGuiaNuevaClick(Sender: TObject);
/////////////////////////////////////////////////////////////////////////////

Var
   xsSQL: String;
Begin
   If mtx4000.FMant.cds2.FieldByName('CIAID').AsString <> '02' Then
   Begin
      ShowMessage('Guia de Remisión solo se usa para Compañía 02');
      Exit;
   End;
   If mtx4000.FMant.cds2.FieldByName('NISSIT').AsString <> 'ACEPTADO' Then
   Begin
      ShowMessage('Notas de Salida tiene que estar Aceptada');
      Exit;
   End;
   If fg_VerificaVentanasAbiertas = False Then
   Begin
      Exit;
   End;
   xSQL := 'SELECT * FROM LOG314 ' +
      ' WHERE CIAID = ' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString) +
      ' AND LOCID = ' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString) +
      ' AND TINID = ' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString) +
      ' AND ALMID = ' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString) +
      ' AND NISATIP = ' + QuotedStr('SALIDA') +
      ' AND NISAID = ' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);

   DMALM.cdsNIS.Close;
   DMALM.cdsNIS.DataRequest(xSQL);
   DMALM.cdsNIS.Open;

   xsSql := 'Select * from LOG_GUI_REM '
      + 'Where CIAID=' + Quotedstr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString)
      + 'and TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString)
      + 'and NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString)
      + 'and ESTADO<>''ANULADO'' '
      + 'Order by SERGUIA, NUMGUIA';
   DMALM.cdsMovCNT.Close;
   DMALM.cdsMovCNT.DataRequest(xsSql);
   DMALM.cdsMovCNT.Open;

   cFActivo := 'N';
   If DMALM.cdsMovCNT.RecordCount > 0 Then
   Begin
      ShowMessage('Nota de Salida Tiene Generada(s) Guia(s) de Remisión');
      Try
         DMALM.wModoGuia := 'M';
         FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
         FGuiaRemisionALM.xsCompania := mtx4000.FMant.cds2.FieldByName('CIAID').AsString;
         FGuiaRemisionALM.xsOrigen := 'NS';
         FGuiaRemisionALM.ShowModal;
      Finally
         FGuiaRemisionALM.Free;
      End;
   End
   Else
   Begin
      Try
         DMALM.wModoGuia := 'A';
         FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
         FGuiaRemisionALM.xsCompania := mtx4000.FMant.cds2.FieldByName('CIAID').AsString;
         FGuiaRemisionALM.xsOrigen := 'NS';
         FGuiaRemisionALM.ShowModal;
      Finally
         FGuiaRemisionALM.Free;
      End;
   End;
End;

Procedure TFToolNSal.fcsGuiaClick(Sender: TObject);
Var
   xsCompaniaGRemision: String;
   xsSql: String;
Begin
   If mtx4000.FMant.cds2.FieldByName('CIAID').AsString <> '02' Then
   Begin
      ShowMessage('Guia de Remisión solo se usa para Compañía 02');
      Exit;
   End;
   If fg_VerificaVentanasAbiertas = False Then
   Begin
      Exit;
   End;

   xsCompaniaGRemision := mtx4000.FMant.cds2.FieldByName('CIAID').AsString;
   If DMALM = Nil Then Exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   Screen.Cursor := crHourGlass;

   xsSql := 'SELECT A.* FROM (SELECT LOG_GUI_REM.*, ' +
      ' (SELECT TGE147.UBIGEODPTO FROM TGE147 WHERE TGE147.CODDPTO = LOG_GUI_REM.DPTOID AND ROWNUM = 1  ) DEPARTAMENTO,' +
      ' (SELECT TGE147.UBIGEOPROV FROM TGE147 WHERE TGE147.CODDPTO = LOG_GUI_REM.DPTOID AND TGE147.CODPROV = LOG_GUI_REM.CIUDID AND ROWNUM = 1  ) PROVINCIA,' +
      ' (SELECT TGE147.UBIGEODIST FROM TGE147 WHERE TGE147.CODDPTO = LOG_GUI_REM.DPTOID AND TGE147.CODPROV = LOG_GUI_REM.CIUDID AND TGE147.CODDIST = LOG_GUI_REM.ZIPID  AND ROWNUM = 1  ) DISTRITO,' +
      ' (SELECT TGE208.TRIDES FROM TGE208 WHERE  LOG_GUI_REM.TRIID = TGE208.TRIID AND TGE208.TRISGT = ' + QuotedStr('S') + '  ) TIPOTRANSACCION' +
      ' FROM LOG_GUI_REM ' +
      ' WHERE LOG_GUI_REM.CIAID = ' + QuotedStr(xsCompaniaGRemision) + ') A' +
      ' WHERE 1 = 1';

   DMALM.cdsGuiaRemision.CLose;
   DMALM.cdsGuiaRemision.DataRequest(xsSQL);
   DMALM.cdsGuiaRemision.Open;

   FToolGuiaRemision := TFToolGuiaRemision.Create(Application); // ALM223.pas
   DMALM.wTipoAdicion := 'xFiltro';

   DMALM.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   xsVentanaAbierta := 'LISTADO GUIAS DE REMISION';
   fcsGuia.Enabled := False;
   fcsbtnGuiaNueva.Enabled := False;
   Mtx3001 := TMant.Create(Application);
   Try
      Mtx3001.Admin := DMALM.wAdmin;
      Mtx3001.User := DMALM.wUsuario;
      Mtx3001.Module := DMALM.wModulo;
      Mtx3001.OnCreateMant := Nil;
      Mtx3001.TableName := 'VWALMGUIAREMISION';
      Mtx3001.Titulo := 'Guías de Remisión';
      Mtx3001.UsuarioSQL.Add(xsSQL);
      pg := FToolGuiaRemision.pnlAct;
      Mtx3001.ClientDataSet := DMALM.cdsGuiaRemision;
      Mtx3001.DComC := DMALM.DCOM1;
      Mtx3001.OnEdit := FToolGuiaRemision.fg_EditarGuiRemision;
      Mtx3001.OnInsert := Nil;
      Mtx3001.OnCreateMant := FRegistros.PegaPanelTool;
      Mtx3001.OnDelete := Nil;
      Mtx3001.OnShow := Nil;
      Mtx3001.SectionName := 'GUIAREM';
      Mtx3001.FileNameIni := '\oaALM.ini';
      //mtx4000.Filter          := cFilterCiaUser;
      Mtx3001.OnCierra := fg_CerrarVentana;
      Mtx3001.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3001.Execute;
      FToolGuiaRemision.dblcCompania.Text := xsCompaniaGRemision;
      FToolGuiaRemision.edtcompania.text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + QuotedStr(FToolGuiaRemision.dblcCompania.Text), 'CIADES');
   Finally
   End;
//////////////////////////////////////////////////////////////////////
End;

Procedure TFToolNSal.dblcCIAExit(Sender: TObject);
Begin
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.TEXT), 'CIADES');
End;

Procedure TFToolNSal.dblcTransacExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'TRIID=' + quotedstr(dblcTransac.Text) + ' AND TRISGT=''I''';
   dbeTransac.Text := DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRIDES', xSQL, 'TRIDES');
End;

Procedure TFToolNSal.bbtnRepTipTransClick(Sender: TObject);
Var
   xSQL: String;
   x10: Integer;
Begin
   If dblcCIA.Text = '' Then
   Begin
      ShowMessage('Tiene que seleccionar una Compañía');
      Exit;
   End;

   If dtpDesde.Date = 0 Then
   Begin
      ShowMessage('Tiene que Ingresar Fecha de Inicio');
      Exit;
   End;
   If dtpHasta.Date = 0 Then
   Begin
      ShowMessage('Tiene que Ingresar Fecha Final');
      Exit;
   End;
   If dtpDesde.Date > dtpHasta.Date Then
   Begin
      ShowMessage('Fecha de Inicio no debe ser mayor a Fecha Final');
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   xSQL := 'SELECT A.CIAID, A.TRIID, B.TRIDES, C.NISAID, C.TINID, C.ALMID, J.ALMDES, C.TDAID, C.CCOSID, '
      + 'C.NISAOBS, C.NISASOLIC, A.CIAID, I.CIADES, A.KDXID, A.ARTID, A.ARTDES, A.UNMIDG, '
      + 'A.KDXCNTG, A.ARTPCG, ROUND(A.KDXCNTG*A.ARTPCG,2) ARTTOTALG, A.COSREPO, G.CCOSDES, '
      + 'C.NISAFREG, A.KDXANOMM, '' '' PERIODO, '
      + '''DESDE ' + DateToStr(dtpDesde.Date) + ' HASTA ' + DateToStr(dtpHasta.Date) + ''' RANGO, '
      + '''' + dbeCIA.Text + ''' CIADES, ''TRANSFERENCIAS DE ALMACEN'' TITULO '
      + 'FROM LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE203 G, TGE101 I, TGE151 J '
      + 'WHERE A.CIAID=' + QuotedStr(dblcCIA.text) + ' '
      + 'AND A.NISAFREG>=' + quotedstr(DateToStr(dtpDesde.Date)) + ' '
      + 'AND A.NISAFREG<=' + quotedstr(DateToStr(dtpHasta.Date)) + ' '
      + 'AND C.ALMID in (''12'',''13'',''14'',''15'',''16'') AND C.NISSIT=''ACEPTADO'' '
      + 'AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' ' //AND TRITMOV=''T'' '
      + 'AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID '
      + 'AND A.ALMID=C.ALMID AND A.NISAID=C.NISAID '
      + 'AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID '
      + 'AND A.CIAID=D.CIAID AND A.TINID=D.TINID   AND A.GRARID=D.GRARID '
      + 'AND A.CCOSID=G.CCOSID(+) '
      + 'AND A.CIAID=J.CIAID(+) AND A.LOCID=J.LOCID(+) AND A.TINID=J.TINID(+) AND A.ALMID=J.ALMID(+) '
      + 'AND A.CIAID=I.CIAID(+) '
      + 'ORDER BY C.ALMID, A.NISAID, A.TINID, A.KDXID';
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      Raise Exception.Create('No existen registros que mostrar');
   End;

   ppdbSus.DataSource := DMALM.dsReporte;
   pprSus.DataPipeline := ppdbSus;

   pprSus.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\SustentoInventario.rtm';
   pprSus.Template.LoadFromFile;

   Screen.Cursor := crDefault;

   ppd2.Report := pprSus;
   If (DMALM.wUsuario = 'HNORIEGA') Then
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

Procedure TFToolNSal.fcbtnEditaGuiaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If mtx4000.FMant.cds2.FieldByName('CIAID').AsString <> '02' Then
   Begin
      ShowMessage('Guia de Remisión solo se usa para Compañía 02');
      Exit;
   End;

   xSQL := 'Select * from LOG_GUI_REM '
      + 'Where CIAID=''' + mtx4000.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + 'and TINID=''' + mtx4000.FMant.cds2.FieldByName('TINID').AsString + ''' '
      + 'and NISAID=''' + mtx4000.FMant.cds2.FieldByName('NISAID').AsString + ''' '
      + 'and ESTADO<>''ANULADO'' '
      + 'Order by SERGUIA, NUMGUIA';
   DMALM.cdsMovCNT.Close;
   DMALM.cdsMovCNT.DataRequest(xSQL);
   DMALM.cdsMovCNT.Open;

   If DMALM.cdsMovCNT.RecordCount <= 0 Then
   Begin
      ShowMessage('Nota de Salida no Tiene Guia(s) de Remisión');
      Exit;
   End;

   Try
      DMALM.wModoGuia := 'M';

      FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
      FGuiaRemisionALM.ShowModal;
   Finally
      FGuiaRemisionALM.Free;
   End;
End;

Procedure TFToolNSal.dblcCIANotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFToolNSal.btnRptSalidasClick(Sender: TObject);
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
   For xnContador := 0 To mtx4000.FMant.lbFiltroReal.Count - 1 Do
   Begin
      If length(trim(xsFiltro)) = 0 Then
      Begin
         xsFiltro := mtx4000.FMant.lbFiltroReal.items[xnContador];
      End
      Else
      Begin
         xsFiltro := xsFiltro + ' AND ' + mtx4000.FMant.lbFiltroReal.items[xnContador];
      End;
      If xnContador = 0 Then
         xsFiltroTexto1 := mtx4000.FMant.lbFiltro.items[xnContador]
      Else
         If xnContador = 1 Then
            xsFiltroTexto2 := mtx4000.FMant.lbFiltro.items[xnContador]
         Else
            If xnContador = 2 Then
               xsFiltroTexto3 := mtx4000.FMant.lbFiltro.items[xnContador]
            Else
               If xnContador = 3 Then
                  xsFiltroTexto4 := mtx4000.FMant.lbFiltro.items[xnContador]
               Else
                  If xnContador = 4 Then
                     xsFiltroTexto5 := mtx4000.FMant.lbFiltro.items[xnContador]
                  Else
                     If xnContador = 5 Then
                        xsFiltroTexto6 := mtx4000.FMant.lbFiltro.items[xnContador]
                     Else
                        If xnContador = 6 Then
                           xsFiltroTexto7 := mtx4000.FMant.lbFiltro.items[xnContador]
                        Else
                           If xnContador = 7 Then xsFiltroTexto8 := mtx4000.FMant.lbFiltro.items[xnContador];
   End;
   If Length(mtx4000.Filter) > 0 Then
   Begin
      xsFiltroUsuario := ' AND ' + mtx4000.Filter;
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
      ' AND TGE208.TRISGT = ' + QuotedStr('S') +
      ' AND LOG314.NISATIP = ' + QuotedStr('SALIDA') +
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
   ppdbRptSalidas.DataSource := DMALM.dsReporte;
   pprRptSalidas.DataPipeline := ppdbRptSalidas;

   pprRptSalidas.Template.FileName := wRutaRpt + '\RptSalidas.rtm';
   pprRptSalidas.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppdRptSalidas.Report := pprRptSalidas ;
   //ppdRptSalidas.ShowModal() ;
   pprRptSalidas.Print;

End;

Procedure TFToolNSal.fg_CerrarVentana(Sender: TObject);
Begin
   xsVentanaAbierta := '';
   fcsGuia.Enabled := True;
   fcsbtnGuiaNueva.Enabled := True;
End;

Function TFToolNSal.fg_VerificaVentanasAbiertas: Boolean;
Var
   xsMensaje: String;
Begin
   xsMensaje := '';
   If xsVentanaAbierta = 'LISTADO GUIAS DE REMISION' Then
   Begin
      xsMensaje := 'Debe cerrar primero la ventana de Listado de Guías de Remisión';
   End;
   If xsMensaje <> '' Then
   Begin
      ShowMessage(xsMensaje);
      Result := False;
      Exit;
   End;
   Result := True
End;

End.

