Unit ALM310;
// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, ComCtrls, StdCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Buttons,
   ppBands, ppClass, ppCache, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
   ppReport, wwdblook, Menus, ppVar, ppPrnabl, ppCtrls, Grids, Wwdbigrd,
   Wwdbgrid, ppModule, daDatMod, Db, Wwdatsrc, DBTables, Wwquery,
   ppViewr, ppTypes;

Type
   TFSQLMovAlmacen = Class(TForm)
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      gbTransaccionTipo: TRadioGroup;
      gbDocumentoTipo: TGroupBox;
      rbDocTipoTodo: TRadioButton;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      rbDocTipoParcial: TRadioButton;
      gbDocParcial: TGroupBox;
      dblcTDoc: TwwDBLookupCombo;
      edtTDoc: TEdit;
      dblcTRAN: TwwDBLookupCombo;
      edtTran: TEdit;
      pprReporte: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      pplblTitulo: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel1: TppLabel;
      ppdbLocal: TppDBText;
      ppLabel3: TppLabel;
      ppdbtxtLocal: TppDBText;
      pplblLin0: TppLabel;
      pplblLin1: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel15: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppgrpCIAID: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppdbcalcTotalG: TppDBCalc;
      ppdbcalcTotalU: TppDBCalc;
      ppdbCalcU: TppDBCalc;
      ppdbCalcG: TppDBCalc;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppdbMovKardex: TppDBPipeline;
      ppDBText7: TppDBText;
      ppLabel28: TppLabel;
      ppgrpKDXID: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      Label1: TLabel;
      Label2: TLabel;
      gbCAL: TGroupBox;
      Procedure bbtnOkClick(Sender: TObject);
      Procedure bbtnCancClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure rbDocTipoTodoClick(Sender: TObject);
      Procedure rbTipoParcialClick(Sender: TObject);
      Procedure gbTransaccionTipoClick(Sender: TObject);
      Procedure dblcTDocExit(Sender: TObject);
      Procedure pplblLin0Print(Sender: TObject);
      Procedure dblcTRANExit(Sender: TObject);
      Procedure pprReportePreviewFormCreate(Sender: TObject);
      Procedure fraCALdblcLOCExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
   Private
    { Private declarations }
      Procedure ProcPrincipal;
   Public
    { Public declarations }
   End;

Var
   FSQLMovAlmacen: TFSQLMovAlmacen;

Implementation
{$R *.DFM}
Uses ALMDM1, ALM600;

Procedure TFSQLMovAlmacen.FormActivate(Sender: TObject);
Begin
   DM1.cdsCIA.active := true;
   gbTransaccionTipo.OnClick(sender);
  //** 13/03/2001 - pjsv
   dtpDesde.date := Date();
   dtpHasta.date := Date();
  //**
End;

Procedure TFSQLMovAlmacen.bbtnCancClick(Sender: TObject);
Begin
   close;
End;

Procedure TFSQLMovAlmacen.rbDocTipoTodoClick(Sender: TObject);
Begin
   dblcTDoc.Text := '';
   edtTDoc.Text := '';
   dblcTRAN.Text := '';
   edtTRAN.Text := '';
End;

Procedure TFSQLMovAlmacen.rbTipoParcialClick(Sender: TObject);
Begin
   dblcTDoc.Enabled := true
End;

Procedure TFSQLMovAlmacen.dblcTDocExit(Sender: TObject);
Var
   sSQL: String;
Begin
   edtTDoc.Text := DM1.DisplayDescrip('prvLOG', 'TGE157', 'TDADES', 'TDAID=' + quotedStr(dblcTDoc.Text), 'TDADES');
   If edtTDoc.Text <> '' Then
   Begin
      dblcTran.Enabled := true;
      sSQL := 'SELECT * FROM TGE208 WHERE TDAID=' + quotedStr(dblcTDoc.Text) + ' ORDER BY TRIID';
      DM1.cdsTRAN.Close;
      DM1.cdsTRAN.DataRequest(sSQL);
      DM1.cdsTRAN.Open;
   End
   Else
   Begin
      dblcTran.Enabled := false;
      edtTran.Text := '';
   End;
End;

Procedure TFSQLMovAlmacen.dblcTRANExit(Sender: TObject);
Begin
   edtTran.Text := DM1.DisplayDescrip('prvLOG', 'TGE208', 'TRIDES', 'TRIID=' + quotedStr(dblcTRAN.text), 'TRIDES');
End;

Procedure TFSQLMovAlmacen.gbTransaccionTipoClick(Sender: TObject);
Var
   sTipo: String;
   sSQL: String;
Begin
   If gbTransaccionTipo.ItemIndex = 0 Then
      sTipo := 'INGRESO'
   Else
      sTipo := 'SALIDA';
   dblcTDoc.Text := '';
   edtTDoc.Text := '';
   dblcTRAN.Text := '';
   edtTRAN.Text := '';
   sSQL := 'SELECT * FROM TGE157 WHERE TDATIP=' + quotedStr(sTipo);
   DM1.cdsTDNISA.Close;
   DM1.cdsTDNISA.DataRequest(sSQL);
   DM1.cdsTDNISA.Open;
End;

Procedure TFSQLMovAlmacen.bbtnOkClick(Sender: TObject);
Begin
   If fraCAL.edtCia.Text = '' Then
   Begin
      ShowMessage('Falta Definición de Compañía');
      fraCAL.dblcCia.SetFocus;
      exit;
   End;
   If fraCAL.edtLoc.Text = '' Then
   Begin
      ShowMessage('Falta Definición del Local');
      fraCAL.dblcLoc.SetFocus;
      exit;
   End;
   If fraCAL.edtAlm.Text = '' Then
   Begin
      ShowMessage('Falta Definición de Almacen');
      fraCAL.dblcAlm.SetFocus;
      exit;
   End;

   ProcPrincipal;
End;

Procedure TFSQLMovAlmacen.ProcPrincipal;
Var
   sDesde, sHasta: String;
   sAlmacen, sLocalidad, sCia: String;
   sSQL: String;
   sWhere: String;
   sCampos: String;
   sFrom: String;
   sTitulo: String;
Begin
   Screen.Cursor := crHourGlass;
   sDesde := quotedStr(formatdatetime(dm1.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(dm1.wFormatFecha, dtpHasta.DateTime));
   sCia := quotedStr(fraCAL.dblcCia.text);
   sAlmacen := quotedStr(fraCAL.dblcAlm.Text);
   sLocalidad := quotedStr(fraCAL.dblcLoc.text);

   pprReporte.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConMovAlm.rtm';
   pprReporte.template.LoadFromFile;

   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sCampos := 'MOV.NISAID, MOV.CIAID, CIA.CIADES, MOV.LOCID, LOC.LOCDES,  MOV.ALMID, ALM.ALMDES, MOV.TDAID, ';
      sCampos := sCampos + 'MOV.KDXCNTG, MOV.KDXCNTU, ART.ARTPCG, ART.ARTPCU, IODOC.TDAABR, MOV.ARTID, ';
      sCampos := sCampos + 'ART.ARTABR, MOV.NISAFREG, MOV.NISATIP, IODOC.TDAABR, MTRANSAC.TRIABR,';
      sCampos := sCampos + 'MOV.UNMIDG, MOV.UNMIDU, UMEDG.UNMABR UMEDGDES, UMEDU.UNMABR UMEDUDES, ';
      sCampos := sCampos + 'MAST.NISASOLIC, SUBSTR(MAST.NISAOBS,1,20) NISAOBS, ';
      sCampos := sCampos + 'ART.ARTPCG*MOV.KDXCNTG IMPORTEG, ART.ARTPCU*MOV.KDXCNTU IMPORTEU ';

      sFrom := 'LOG315 AS MOV ';
      sFrom := sFrom + 'LEFT JOIN TGE126 LOC ON ( MOV.LOCID=LOC.LOCID AND MOV.CIAID=LOC.LOCID) '; //union con maestro de locales
      sFrom := sFrom + 'LEFT JOIN TGE101 CIA ON ( MOV.CIAID=CIA.CIAID ) '; //union con maestro de CIAs
      sFrom := sFrom + 'LEFT JOIN TGE151 ALM ON ( MOV.ALMID=ALM.ALMID AND MOV.CIAID=ALM.CIAID AND MOV.TINID=ALM.TINID) '; //union con maestro de Almacen
      sFrom := sFrom + 'LEFT JOIN TGE157 IODOC ON ( MOV.TDAID=IODOC.TDAID ) '; //union por Documento Entrada/Salida
      sFrom := sFrom + 'LEFT JOIN TGE208 MTRANSAC ON ( MOV.TRIID=MTRANSAC.TRIID ) '; //union con Maestro de Transacciones
      sFrom := sFrom + 'LEFT JOIN TGE205 ART  ON ( MOV.ARTID=ART.ARTID AND MOV.CIAID=ART.ARTID) '; //union con Articulos
      sFrom := sFrom + 'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) '; //union con unidad de mediga general
      sFrom := sFrom + 'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) '; //union con unidad de mediga unitaria
      sFrom := sFrom + 'LEFT JOIN LOG314 MAST ON ( MOV.CIAID=MAST.CIAID AND MOV.LOCID=MAST.LOCID AND MOV.ALMID=MAST.ALMID AND MOV.NISATIP=MAST.NISATIP AND MOV.NISAID=MAST.NISAID AND MOV.TDAID=MAST.TDAID AND MOV.TRIID=MAST.TRIID )';

      sWhere := ' MOV.ALMID=' + sAlmacen;
      sWhere := sWhere + ' AND MOV.CIAID=' + sCia;
      sWhere := sWhere + ' AND MOV.LOCID=' + sLocalidad;
      sWhere := sWhere + ' AND MOV.NISAFREG>=' + sDesde;
      sWhere := sWhere + ' AND MOV.NISAFREG<=' + sHasta;
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sCampos := 'MOV.NISAID, MOV.CIAID, CIA.CIADES, MOV.LOCID, LOC.LOCDES,  MOV.ALMID, ALM.ALMDES, MOV.TDAID, ';
         sCampos := sCampos + 'MOV.KDXCNTG, MOV.KDXCNTU, ART.ARTPCG, ART.ARTPCU, IODOC.TDAABR, MOV.ARTID, ';
         sCampos := sCampos + 'ART.ARTABR, MOV.NISAFREG, MOV.NISATIP, IODOC.TDAABR, MTRANSAC.TRIABR,';
         sCampos := sCampos + 'MOV.UNMIDG, MOV.UNMIDU, UMEDG.UNMABR UMEDGDES, UMEDU.UNMABR UMEDUDES, ';
         sCampos := sCampos + 'MAST.NISASOLIC, SUBSTR(MAST.NISAOBS,1,20) NISAOBS, ';
         sCampos := sCampos + 'ART.ARTPCG*MOV.KDXCNTG IMPORTEG, ART.ARTPCU*MOV.KDXCNTU IMPORTEU ';

         sFrom := 'LOG315 MOV, TGE126 LOC, TGE101 CIA, TGE151 ALM, TGE157 IODOC, ';
         sFrom := sFrom + 'TGE208 MTRANSAC, TGE205 ART, TGE130 UMEDG, TGE130 UMEDU, LOG314 MAST ';

         sWhere := 'MOV.ALMID=' + sAlmacen;
         sWhere := sWhere + ' AND MOV.CIAID=' + sCia;
         sWhere := sWhere + ' AND MOV.LOCID=' + sLocalidad;
         sWhere := sWhere + ' AND MOV.NISAFREG>=' + sDesde;
         sWhere := sWhere + ' AND MOV.NISAFREG<=' + sHasta;

         sWhere := sWhere + ' AND MOV.LOCID=LOC.LOCID(+)';
         sWhere := sWhere + ' AND MOV.CIAID=CIA.CIAID(+)';
         sWhere := sWhere + ' AND MOV.ALMID=ALM.ALMID(+)';
         sWhere := sWhere + ' AND MOV.TDAID=IODOC.TDAID(+)';
         sWhere := sWhere + ' AND MOV.TRIID=MTRANSAC.TRIID(+)';
         sWhere := sWhere + ' AND MOV.ARTID=ART.ARTID(+)';
         sWhere := sWhere + ' AND MOV.UNMIDG=UMEDG.UNMID(+)';
         sWhere := sWhere + ' AND MOV.UNMIDU=UMEDU.UNMID(+)';
         sWhere := sWhere + ' AND MOV.CIAID=MAST.CIAID(+)';
         sWhere := sWhere + ' AND MOV.LOCID=MAST.LOCID(+)';
         sWhere := sWhere + ' AND MOV.ALMID=MAST.ALMID(+)';
         sWhere := sWhere + ' AND MOV.NISATIP=MAST.NISATIP(+)';
         sWhere := sWhere + ' AND MOV.NISAID=MAST.NISAID(+)';
         sWhere := sWhere + ' AND MOV.TDAID=MAST.TDAID(+)';
         sWhere := sWhere + ' AND MOV.TRIID=MAST.TRIID(+)';
      End;

   sTitulo := 'REPORTE DE ';
   If gbTransaccionTipo.ItemIndex = 0 Then
   Begin
      sWhere := sWhere + ' AND MOV.NISATIP=' + quotedStr('INGRESO');
      sTitulo := sTitulo + ' INGRESOS';
   End
   Else
   Begin
      sWhere := sWhere + ' AND MOV.NISATIP=' + quotedStr('SALIDA');
      sTitulo := sTitulo + ' SALIDAS';
   End;

   If rbDocTipoTodo.Checked Then
      sTitulo := sTitulo + ' DE PRODUCTOS';
   If rbDocTipoParcial.Checked Then
   Begin
      If length(dblcTDoc.Text) > 0 Then
      Begin
         If length(dblctran.Text) = 0 Then
         Begin
            sTitulo := sTitulo + ' POR DOCUMENTOS';
            sWhere := sWhere + ' AND MOV.DOCID=' + quotedStr(dblcTDoc.Text);
         End
         Else
         Begin
            sTitulo := sTitulo + ' POR DOCUMENTOS Y TRANSACCIONES';
            sWhere := sWhere + ' AND MOV.DOCID=' + quotedStr(dblcTDoc.Text);
            sWhere := sWhere + ' AND MOV.TRIID=' + quotedStr(dblcTRAN.Text);
         End;
      End
   End;

   sSQL := sSQL + 'SELECT ' + sCampos + ' FROM ' + sFrom + ' WHERE ' + sWhere + ' ORDER BY MOV.NISAID';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName := 'prvLOG';
   DM1.cdsQry.DataRequest(sSQL);
   DM1.cdsQry.Open;
   Screen.Cursor := crDefault;
   If DM1.cdsQry.recordCount = 0 Then
   Begin
      ShowMessage('Error, No existen registros para esta Consulta');
      exit;
   End;
   pplblTitulo.Caption := sTitulo;
   pprReporte.Print;

End;

Procedure TFSQLMovAlmacen.pplblLin0Print(Sender: TObject);
Begin
   pplblLin1.Caption := pplblLin0.Caption;
  //pplblLin2.Caption := pplblLin0.Caption;
End;

Procedure TFSQLMovAlmacen.pprReportePreviewFormCreate(Sender: TObject);
Begin
   pprReporte.PreviewForm.ClientHeight := 500;
   pprReporte.PreviewForm.ClientWidth := 650;
   TppViewer(pprReporte.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFSQLMovAlmacen.fraCALdblcLOCExit(Sender: TObject);
Begin
   fraCAL.dblcLOCExit(Sender);
End;

Procedure TFSQLMovAlmacen.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

End.

