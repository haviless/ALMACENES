Unit ALM412;

// Actualizaciones
// HPC_201505_ALM
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
// HPC_201801_ALM 03/04/2018 Cambio en pruebas por Búsqueda en Maestro de Clientes
//

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ComCtrls, Buttons, ExtCtrls, wwdblook, Wwdbdlg, Spin, ppCtrls,
   ppBands, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
   ppCache, ppDB, ppDBPipe, Grids, Wwdbigrd, Wwdbgrid, wwriched, MsgDlgs,
   wwdbdatetimepicker, Mask, wwdbedit, DB;

Type
   TFProcesos = Class(TForm)
      pgcKardex: TPageControl;
      tshKardex: TTabSheet;
      tshMovim: TTabSheet;
      Panel2: TPanel;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      dblcdArt: TwwDBLookupComboDlg;
      edtArtDes: TEdit;
      dbgData: TwwDBGrid;
      Panel3: TPanel;
      pppipe: TppDBPipeline;
      ppReporte: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel7: TppLabel;
      ppLine1: TppLine;
      ppSystemVariable3: TppSystemVariable;
      ppLabel8: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppLine2: TppLine;
      ppDBCalc1: TppDBCalc;
      ppLabel9: TppLabel;
      Label1: TLabel;
      Panel6: TPanel;
      edtArtDescrip: TEdit;
      lblArti: TLabel;
      Z2bbtnRegCanc: TBitBtn;
      ppReport1: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppFooterBand2: TppFooterBand;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      bbtnDesdeLista: TButton;
      dblcCia: TwwDBLookupCombo;
      Label6: TLabel;
      bbtnTodosMov: TBitBtn;
      rgTipoLista: TRadioGroup;
      memo1: TwwDBRichEdit;
      tsArticulos: TTabSheet;
      dbgArtObser: TwwDBGrid;
      pnlCambioDatos: TPanel;
      lblFecha: TLabel;
      lblCantidad: TLabel;
      dbeCantidad: TwwDBEdit;
      dbdtpFecha: TwwDBDateTimePicker;
      bbtnOk: TBitBtn;
      bbtnCancel: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Label2: TLabel;
      bbtnLlenaLista: TBitBtn;
      edtCIA: TEdit;
      pbProceso: TProgressBar;
      lblAlmacen: TLabel;
      lblCostoProm: TLabel;
      dbeAlmacen: TwwDBEdit;
      dbeCostoProm: TwwDBEdit;
      lblCostoMonOri: TLabel;
      dbeCostoMonOrig: TwwDBEdit;
      sbIr_al_Neg: TSpeedButton;
      dbeAlmacen2: TwwDBEdit;
      bbtnMetodo2: TBitBtn;
      rgMetodo: TRadioGroup;
      dblcdArticulo: TwwDBLookupComboDlg;
      tsBuscaPorDescrip: TTabSheet;
      edtArtxDescr: TEdit;
      bbtnBuscaArtxDescr: TBitBtn;
      dbgArtxDescr: TwwDBGrid;
      tsKardexII: TTabSheet;
      dbgKardex2: TwwDBGrid;
      Panel4: TPanel;
      Label7: TLabel;
      SpeedButton1: TSpeedButton;
      edtArtDesc2: TEdit;
      edtArt2: TEdit;
      bbtnCambiaCodArt: TBitBtn;
      edtTipDocVta: TEdit;
      edtSerieDocVta: TEdit;
      edtNroFacVta: TEdit;
      Label5: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      edtAlmVta: TEdit;
      Label11: TLabel;
      edtTipoNotaVta: TEdit;
      Label12: TLabel;
      edtNroNotaVta: TEdit;
      TabSheet1: TTabSheet;
      dbgIngresos: TwwDBGrid;
      bbtnGeneraTransf: TBitBtn;
    tsTransferencias: TTabSheet;
    pnlGeneraTransf: TPanel;
    Label13: TLabel;
    Label20: TLabel;
    dtpFechaTransf: TwwDBDateTimePicker;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    gbSalidaxTransf: TGroupBox;
    Label15: TLabel;
    Label19: TLabel;
    dbeAlmOriTransf: TwwDBEdit;
    dbeCantxTransf: TwwDBEdit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    dbeAlmDestTransf: TwwDBEdit;
    dbgTransferencias: TwwDBGrid;
      Procedure FormActivate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcdArticuloExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure bbtnDesdeListaClick(Sender: TObject);
      Procedure bbtnTodosMovClick(Sender: TObject);
      Procedure bbtnLlenaListaClick(Sender: TObject);
      Procedure dbgArtObserDblClick(Sender: TObject);
      Procedure MuestraMovxArt;
      Procedure RecalculaSaldosMov;
      Procedure dbgDataCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dbgDataDblClick(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure bbtnCancelClick(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcdArtExit(Sender: TObject);
      Procedure sbIr_al_NegClick(Sender: TObject);
      Procedure bbtnMetodo2Click(Sender: TObject);
      Procedure bbtnMetodo2AntClick(Sender: TObject);
      Procedure tshMovimEnter(Sender: TObject);
      Procedure bbtnBuscaArtxDescrClick(Sender: TObject);
      Procedure dbgArtxDescrDblClick(Sender: TObject);
      Procedure SpeedButton1Click(Sender: TObject);
      Procedure dbgKardex2CalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure bbtnCambiaCodArtClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnGeneraTransfClick(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
   Private
  { Private declarations }
   Public
  { Public declarations }
   End;

Var
   FProcesos: TFProcesos;
   sSQL, xSQL: String;
   xDesdeLista: boolean;
   xAnoMes: String;

Implementation

Uses ALMDM1;

{$R *.DFM}

Procedure TFProcesos.FormActivate(Sender: TObject);
Var
   Y, M, D: Word;
Begin
   DecodeDate(Date, Y, M, D);
   edtArtDes.Text := '';

   pgcKardex.ActivePage := tshKardex;

   xSQL := 'select CIAID, CIADES from TGE101 ';
   DMALM.cdsCia.Close;
   DMALM.cdsCia.DataRequest(xSQL);
   DMALM.cdsCia.Open;
   dblcCia.LookUpTable := DMALM.cdsCia;
   dblcCia.LookUpField := 'CIAID';

   dbgData.Selected.clear;
   dbgData.Selected.Add('ARTID'#9'10'#9'Articulo');
   dbgData.Selected.Add('ARTDES'#9'40'#9'Descrpción Articulo');
   dbgData.Selected.Add('MOVI'#9'10'#9'Mov.~Ingreso');
   dbgData.Selected.Add('MOVS'#9'10'#9'Mov.~Salida');
   dbgData.Selected.Add('INGSAL'#9'10'#9'Diferencia~Ing. - Sal.');
   dbgData.Selected.Add('SALSTOCK'#9'10'#9'Stock~Saldos');
   dbgData.Selected.Add('DIFER'#9'10'#9'Diferencia');

   sSQL := ' SELECT * FROM LOG317 WHERE NOCIERRE=(SELECT MAX(NOCIERRE)  FROM LOG317) ';
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(sSQL);
   DMALM.cdsQry.Open;
   dtpDesde.Date := dmalm.cdsQry.FieldByName('CNSPRICIE').AsDateTime;
   dtpHasta.Date := dmalm.cdsQry.FieldByName('CNSULTCIE').AsDateTime;
End;

Procedure TFProcesos.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFProcesos.dblcdArticuloExit(Sender: TObject);
Var
   xSQL: String;
Begin
{
   If (dmalm.wAnchoArt > 0) And (Length(Trim(dblcdArticulo.Text)) > 0) Then
      dblcdArticulo.Text := dmalm.StrZero(dblcdArticulo.Text, dmalm.wAnchoArt);
   sSQL := 'CIAID=' + quotedstr(dblcCia.text) + ' and ARTID=' + quotedstr(dblcdArticulo.Text);
   edtArtDescrip.Text := dmalm.displaydescrip('prvTGE', 'TGE205', 'ARTDES', sSQL, 'ARTDES');
   If length(edtArtDescrip.Text) = 0 Then
      edtArtDescrip.Text := '***ARTÍCULO NO EXISTE EN MAESTRO***';

   xSQL := 'select * from TGE205 '
      + ' where CIAID=' + quotedstr(dblcCia.text)
      + '   and ARTID=' + quotedstr(dblcdArticulo.Text);
   DMALM.cdsQry6.Close;
   DMALM.cdsQry6.DataRequest(xSQL);
   DMALM.cdsQry6.Open;
}

   If DMALM.cdsQry6.IndexFieldNames <> 'ARTID' Then
      DMALM.cdsQry6.IndexFieldNames := 'ARTID';
   edtArtDescrip.Text := '***ARTÍCULO NO EXISTE EN MAESTRO***';
   DMALM.cdsQry6.SetKey;
   DMALM.cdsQry6.FieldByName('ARTID').AsString := dblcdArticulo.Text;
   If DMALM.cdsQry6.Gotokey Then
      edtArtDescrip.Text := DMALM.cdsQry6.FieldByName('ARTDES').AsString;

   MuestraMovxArt;
End;

Procedure TFProcesos.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMALM.cdsQry2.IndexFieldNames := '';
   DMALM.cdsQry2.Close;
   DMALM.cdsQry3.IndexFieldNames := '';
   DMALM.cdsQry3.Close;
   dmalm.cdsGArti.Close;
   dmalm.cdsPadre.Close;
   dmalm.cdsPadre.DataRequest('');
End;

Procedure TFProcesos.Z2bbtnRegCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFProcesos.bbtnDesdeListaClick(Sender: TObject);
Var
   I: integer;
Begin
   pbProceso.Visible := True;
   pbProceso.max := memo1.lines.Count - 1;
   xDesdeLista := True;
   For i := 0 To memo1.lines.Count - 1 Do
   Begin
      pbProceso.Position := pbProceso.Position + 1;
      dblcdArt.text := memo1.lines[i];
      dblcdArtExit(Nil);
      Application.ProcessMessages;
      bbtnTodosMovClick(Nil);
      Application.ProcessMessages;
   End;
   xDesdeLista := False;
   ShowMessage('Stock Final actualizado con éxito');
   pbProceso.Visible := False;
End;

Procedure TFProcesos.bbtnTodosMovClick(Sender: TObject);
Var
   xAlm, xArt: String;
   xCantInicioMes, xCantFinal, xCantIngMes, xCantSalMes: double;
   wAno, wMes, wDia: Word;
   xAno, xMes, xDia: String;
   xCampoInicial, xCampoIngresos, xCampoSalidas, xCampoFinal: String;
Begin
   If length(trim(dblcCia.text)) = 0 Then
   Begin
      ShowMessage('Debe indicar la Compañía');
      dblcCia.SetFocus;
      exit;
   End;

   If length(trim(dblcdArt.text)) = 0 Then
   Begin
      ShowMessage('Debe indicar el Artículo');
      dblcdArt.SetFocus;
      exit;
   End;

   xArt := dblcdArt.text;

   DecodeDate(dtpHasta.Date, wAno, wMes, wDia);
   xAno := inttostr(wAno);
   xMes := DMALM.strZero(inttostr(wMes), 2);

   xSQL := 'select * from TGE205 '
      + ' where CIAID=' + quotedstr(dblcCia.text)
      + '   and ARTID=' + quotedstr(xArt);
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;

   If DMALM.cdsQry.RecordCount = 0 Then
   Begin
      If Not xDesdeLista Then
         ShowMessage('Artículo No existe');
      exit;
   End;

   If rgMetodo.itemindex = 0 Then
   Begin
      xSQL := 'BEGIN DB2ADMIN.SP_ALM_REGENERA_STOCK('
         + quotedstr(dblcCia.text) + ','
         + quotedstr(dblcdArt.text) + '); END;';
      Try
         DMALM.DCOM1.AppServer.IniciaTransaccion;
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         DMALM.DCOM1.AppServer.GrabaTransaccion;
      Except
         ShowMessage('Error al Actualizar los Saldos del Artículo');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         exit;
      End;
   End
   Else
   Begin
      bbtnMetodo2Click(Sender);
   End;
End;

Procedure TFProcesos.bbtnLlenaListaClick(Sender: TObject);
Var
   wAno, wMes, wDia: word;
   xAno, xMes, xDia: String;
   xAlmAnt: String;
   xSaldo, xSaldoGral: double;
Begin
   If dblcCia.Text = '' Then
   Begin
      ShowMessage('Indique primero la Compañía');
      dblcCia.SetFocus;
      exit;
   End;

// Inicio Movimientos comparados con el Maestro de Artículos
   If rgTipoLista.ItemIndex = 0 Then
   Begin
   // Archivo que contendrá Observaciones
      xSQL := ' Select ''XX'' CIAID, ''12345678'' ARTID, ''1234567890123456789012345678901234567890'' ARTDES,'
         + '        ''1234567890123456789012345678901234567890'' OBSERVACION, '
         + '        0.00 ARTCNTG, 0.00 CANTGRAL '
         + '   from DUAL '
         + '  where 1<>1';
      DMALM.cdsQry3.Close;
      DMALM.cdsQry3.DataRequest(xSQL);
      DMALM.cdsQry3.Open;

      dbgArtObser.Selected.Clear;
      dbgArtObser.Selected.Add('CIAID'#9'3'#9'Cía');
      dbgArtObser.Selected.Add('ARTID'#9'10'#9'Artículo');
      dbgArtObser.Selected.Add('ARTDES'#9'40'#9'Descrpción Articulo');
      dbgArtObser.Selected.Add('OBSERVACION'#9'60'#9'Observación');
      dbgArtObser.Selected.Add('ARTCNTG'#9'12'#9'Cant.Maestro');
      dbgArtObser.Selected.Add('CANTGRAL'#9'12'#9'Cant.General');
      dbgArtObser.ApplySelected;

   // Maestro de Artículos
      xSQL := ' Select CIAID, ARTID, substr(ARTDES,1,40) ARTDES, ARTCNTG '
         + '   from TGE205 '
         + '  where CIAID=' + quotedstr(dblcCia.Text)
         + '    and ARTEST=''H'' ';
      DMALM.cdsReporte.Close;
      DMALM.cdsReporte.DataRequest(xSQL);
      DMALM.cdsReporte.Open;
      DMALM.cdsReporte.First;
      While Not DMALM.cdsReporte.EOF Do
      Begin
         If DMALM.cdsReporte.FieldByName('ARTCNTG').Asfloat < 0 Then
         Begin
            DMALM.cdsQry3.Append;
            DMALM.cdsQry3.FieldByName('CIAID').AsString := DMALM.cdsReporte.FieldByName('CIAID').AsString;
            DMALM.cdsQry3.FieldByName('ARTID').AsString := DMALM.cdsReporte.FieldByName('ARTID').AsString;
            DMALM.cdsQry3.FieldByName('ARTDES').AsString := DMALM.cdsReporte.FieldByName('ARTDES').AsString;
            DMALM.cdsQry3.FieldByName('OBSERVACION').AsString := 'Cantidad Negativa en el Maestro';
            DMALM.cdsQry3.FieldByName('ARTCNTG').AsFloat := DMALM.cdsReporte.FieldByName('ARTCNTG').Asfloat;
            DMALM.cdsQry3.Post;
         End
         Else
         Begin
            xSaldoGral := 0;
            xSQL := ' Select CIAID, ALMID, ALMID ALMID2, ARTID, NISAFREG, NISATIP, KDXCNTG, 0 SALDO'
               + '   from LOG315 '
               + '  where CIAID=' + quotedstr(dblcCia.Text)
               + '    and ARTID=' + quotedstr(DMALM.cdsReporte.FieldByName('ARTID').AsString)
               + '    and NISSIT=''ACEPTADO'' '
               + '  order by ALMID, NISAFREG, NISATIP';
            DMALM.cdsQry2.Close;
            DMALM.cdsQry2.DataRequest(xSQL);
            DMALM.cdsQry2.Open;
            DMALM.cdsQry2.IndexFieldNames := 'ALMID; NISAFREG; NISATIP';
            DMALM.cdsQry2.First;
            xSaldo := 0;
            xAlmAnt := 'XX';
            While Not DMALM.cdsQry2.EOF Do
            Begin
               If DMALM.cdsQry2.FieldByName('ALMID').AsString <> xAlmAnt Then
               Begin
                  If DMALM.cdsQry2.FieldByName('NISATIP').AsString = 'SALIDA' Then
                  Begin
                     DMALM.cdsQry3.Append;
                     DMALM.cdsQry3.FieldByName('CIAID').AsString := DMALM.cdsReporte.FieldByName('CIAID').AsString;
                     DMALM.cdsQry3.FieldByName('ARTID').AsString := DMALM.cdsReporte.FieldByName('ARTID').AsString;
                     DMALM.cdsQry3.FieldByName('OBSERVACION').AsString := 'Comienza con SALIDA';
                     DMALM.cdsQry3.Post;
                     Break;
                  End;
                  xSaldo := DMALM.cdsQry2.FieldByName('KDXCNTG').AsFloat;
                  xSaldoGral := xSaldoGral + DMALM.cdsQry2.FieldByName('KDXCNTG').AsFloat;
               End
               Else
               Begin
                  If DMALM.cdsQry2.FieldByName('NISATIP').AsString = 'INGRESO' Then
                  Begin
                     xSaldo := xSaldo + DMALM.cdsQry2.FieldByName('KDXCNTG').AsFloat;
                     xSaldoGral := xSaldoGral + DMALM.cdsQry2.FieldByName('KDXCNTG').AsFloat;
                  End
                  Else
                  Begin
                     xSaldo := xSaldo - DMALM.cdsQry2.FieldByName('KDXCNTG').AsFloat;
                     xSaldoGral := xSaldoGral - DMALM.cdsQry2.FieldByName('KDXCNTG').AsFloat;
                  End;
                  xSaldo := DMALM.FRound(xSaldo, 15, 4);
                  xSaldoGral := DMALM.FRound(xSaldoGral, 15, 4);
                  If xSaldo < 0 Then
                  Begin
                     DMALM.cdsQry3.Append;
                     DMALM.cdsQry3.FieldByName('CIAID').AsString := DMALM.cdsReporte.FieldByName('CIAID').AsString;
                     DMALM.cdsQry3.FieldByName('ARTID').AsString := DMALM.cdsReporte.FieldByName('ARTID').AsString;
                     DMALM.cdsQry3.FieldByName('ARTDES').AsString := DMALM.cdsReporte.FieldByName('ARTDES').AsString;
                     DMALM.cdsQry3.FieldByName('OBSERVACION').AsString := 'Saldo Negativo';
                     DMALM.cdsQry3.Post;
                     Break;
                  End;
               End;
               xAlmAnt := DMALM.cdsQry2.FieldByName('ALMID').AsString;
               DMALM.cdsQry2.Next;
            End;
            If xSaldoGral <> DMALM.cdsReporte.FieldByName('ARTCNTG').Asfloat Then
            Begin
               DMALM.cdsQry3.Append;
               DMALM.cdsQry3.FieldByName('CIAID').AsString := DMALM.cdsReporte.FieldByName('CIAID').AsString;
               DMALM.cdsQry3.FieldByName('ARTID').AsString := DMALM.cdsReporte.FieldByName('ARTID').AsString;
               DMALM.cdsQry3.FieldByName('ARTDES').AsString := DMALM.cdsReporte.FieldByName('ARTDES').AsString;
               DMALM.cdsQry3.FieldByName('OBSERVACION').AsString := 'Cant.Gral no coincide en el Maestro de Artículos';
               DMALM.cdsQry3.FieldByName('ARTCNTG').AsFloat := DMALM.cdsReporte.FieldByName('ARTCNTG').Asfloat;
               DMALM.cdsQry3.FieldByName('CANTGRAL').AsFloat := xSaldoGral;
               DMALM.cdsQry3.Post;
            End;
         End;
         DMALM.cdsReporte.Next;
      End;

      DMALM.cdsQry3.IndexFieldNames := 'ARTID';
      DMALM.cdsQry3.First;
      memo1.Lines.Clear;
      While Not DMALM.cdsQry3.EOF Do
      Begin
         memo1.Lines.Add(DMALM.cdsQry3.FieldByName('ARTID').AsString);
         DMALM.cdsQry3.Next;
      End;
      dbgArtObser.DataSource := DMALM.dsQry3;
      DMALM.cdsQry3.IndexFieldNames := '';
      DMALM.cdsQry3.First;
   End;
// Fin Lista desde Movimientos comparados con el Maestro de Artículos

// Inicio Movimientos vs Stock
   If rgTipoLista.ItemIndex = 1 Then
   Begin
      DecodeDate(dtpHasta.Date, wAno, wMes, wDia);
      xAno := inttostr(wAno);
      xMes := DMALM.strZero(inttostr(wMes), 2);
      xAnoMes := xAno + xMes;

      xSQL := ' select distinct ARTID '
         + '   from ( '
         + '         Select CIAID, ARTID, '
         + '                sum(MOV_INGRESOS) MOV_INGRESOS, '
         + '                sum(MOV_SALIDAS) MOV_SALIDAS, '
         + '                sum(MOV_SALDOS) MOV_SALDOS, '
         + '                sum(SALD_INGRESOS) SALD_INGRESOS, '
         + '                sum(SALD_SALIDAS) SALD_SALIDAS, '
         + '                sum(SALD_SALDOS_CALC) SALD_SALDOS_CALC, '
         + '                sum(SALD_SALDOS_ARCH) SALD_SALDOS_ARCH, '
         + '                sum(SALDO_316) SALDO_316 '
      // LOG315
      + '           from (Select CIAID, ARTID, '
         + '                        sum(case when NISATIP=''INGRESO'' then KDXCNTG else 0 end) MOV_INGRESOS, '
         + '                        sum(case when NISATIP=''SALIDA'' then KDXCNTG else 0 end) MOV_SALIDAS, '
         + '                        sum(case when NISATIP=''INGRESO'' then KDXCNTG else -KDXCNTG end) MOV_SALDOS, '
         + '                        0 SALD_INGRESOS, '
         + '                        0 SALD_SALIDAS, '
         + '                        0 SALD_SALDOS_CALC, '
         + '                        0 SALD_SALDOS_ARCH, '
         + '                        0 SALDO_316 '
         + '                   from LOG315 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text) + ' and NISSIT=''ACEPTADO'' '
         + '                  group by CIAID, ARTID '
      // LOG319 Suma Ingresos y Salidas
      + '                  union all '
         + '                 Select CIAID, ARTID, '
         + '                        0 MOV_INGRESOS, '
         + '                        0 MOV_SALIDAS, '
         + '                        0 MOV_SALDOS, '
         + '                        sum(CANTOTING) SALD_INGRESOS, '
         + '                        sum(CANTOTSAL) SALD_SALIDAS, '
         + '                        sum(CANTOTING-CANTOTSAL) SALD_SALDOS_CALC, '
         + '                        0 SALD_SALDOS_ARCH, '
         + '                        0 SALDO_316 '
         + '                   from LOG319 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text)
         + '                  group by CIAID, ARTID '
      // LOG319 Saldos por Almacén
      + '                  union all '
         + '                 Select CIAID, ARTID, '
         + '                        0 MOV_INGRESOS, '
         + '                        0 MOV_SALIDAS, '
         + '                        0 MOV_SALDOS, '
         + '                        0 SALD_INGRESOS, '
         + '                        0 SALD_SALIDAS, '
         + '                        0 SALD_SALDOS_CALC, '
         + '                        sum(STKFIN) SALD_SALDOS_ARCH, '
         + '                        0 SALDO_316 '
         + '                   from LOG319 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text)
         + '                    and LOGANOMM=' + quotedstr(xAnoMes)
         + '                  group by CIAID, ARTID '
      // LOG337 Saldos Globales
      + '                 union all '
         + '                 Select CIAID, ARTID, '
         + '                        0 MOV_INGRESOS, '
         + '                        0 MOV_SALIDAS, '
         + '                        0 MOV_SALDOS, '
         + '                        0 SALD_INGRESOS, '
         + '                        0 SALD_SALIDAS, '
         + '                        0 SALD_SALDOS_CALC, '
         + '                        0 SALD_SALDOS_ARCH, '
         + '                        STKFIN SALDO_316 '
         + '                   from LOG337 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text)
         + '                    and LOGANOMM=' + quotedstr(xAnoMes)
     //
      + '            ) '
         + '          group by CIAID, ARTID '
         + '          having (sum(MOV_INGRESOS)<>sum(SALD_INGRESOS) '
         + '              or sum(MOV_SALIDAS)<>sum(SALD_SALIDAS) '
         + '              or sum(MOV_SALDOS)<>sum(SALD_SALDOS_CALC) '
         + '              or sum(MOV_SALDOS)<>sum(SALD_SALDOS_ARCH) '
         + '              or sum(SALD_SALDOS_CALC)<>sum(SALD_SALDOS_ARCH) '
         + '              or sum(SALDO_316)<>sum(MOV_SALDOS)) '
         + '        )';
      DMALM.cdsQry3.Close;
      DMALM.cdsQry3.DataRequest(xSQL);
      DMALM.cdsQry3.Open;
      DMALM.cdsQry3.IndexFieldNames := 'ARTID';

      DMALM.cdsQry3.First;
      memo1.Lines.Clear;
      While Not DMALM.cdsQry3.EOF Do
      Begin
         memo1.Lines.Add(DMALM.cdsQry3.FieldByName('ARTID').AsString);
         DMALM.cdsQry3.Next;
      End;
      DMALM.cdsQry3.IndexFieldNames := '';
{
      xSQL := ' Select CIAID, ALMID, ARTID, ''                                        '' ARTDES, '
         + '                sum(MOV_INGRESOS) MOV_INGRESOS, '
         + '                sum(MOV_SALIDAS) MOV_SALIDAS, '
         + '                sum(MOV_SALDOS) MOV_SALDOS, '
         + '                sum(SALD_INGRESOS) SALD_INGRESOS, '
         + '                sum(SALD_SALIDAS) SALD_SALIDAS, '
         + '                sum(SALD_SALDOS_CALC) SALD_SALDOS_CALC, '
         + '                sum(SALD_SALDOS_ARCH) SALD_SALDOS_ARCH, '
         + '                sum(SALDO_316) SALDO_316 '
         + '           from (Select CIAID, ALMID, ARTID, '
         + '                        sum(case when NISATIP=''INGRESO'' then KDXCNTG else 0 end) MOV_INGRESOS, '
         + '                        sum(case when NISATIP=''SALIDA'' then KDXCNTG else 0 end) MOV_SALIDAS, '
         + '                        sum(case when NISATIP=''INGRESO'' then KDXCNTG else -KDXCNTG end) MOV_SALDOS, '
         + '                        0 SALD_INGRESOS, '
         + '                        0 SALD_SALIDAS, '
         + '                        0 SALD_SALDOS_CALC, '
         + '                        0 SALD_SALDOS_ARCH, '
         + '                        0 SALDO_316 '
         + '                   from LOG315 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text) + ' and NISSIT=''ACEPTADO'' '
         + '                  group by CIAID, ALMID, ARTID '
         + '                  union all '
         + '                 Select CIAID, ALMID, ARTID, '
         + '                        0 MOV_INGRESOS, '
         + '                        0 MOV_SALIDAS, '
         + '                        0 MOV_SALDOS, '
         + '                        sum(CANTOTING) SALD_INGRESOS, '
         + '                        sum(CANTOTSAL) SALD_SALIDAS, '
         + '                        sum(CANTOTING-CANTOTSAL) SALD_SALDOS_CALC, '
         + '                        0 SALD_SALDOS_ARCH, '
         + '                        0 SALDO_316 '
         + '                   from LOG319 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text)
         + '                  group by CIAID, ALMID, ARTID '
         + '                  union all '
         + '                 Select CIAID, ALMID, ARTID, '
         + '                        0 MOV_INGRESOS, '
         + '                        0 MOV_SALIDAS, '
         + '                        0 MOV_SALDOS, '
         + '                        0 SALD_INGRESOS, '
         + '                        0 SALD_SALIDAS, '
         + '                        0 SALD_SALDOS_CALC, '
         + '                        STKFIN SALD_SALDOS_ARCH, '
         + '                        0 SALDO_316 '
         + '                   from LOG319 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text)
         + '                    and LOGANOMM=' + quotedstr(xAnoMes)
         + '                  union all '
         + '                 Select CIAID, '''' ALMID, ARTID, '
         + '                        0 MOV_INGRESOS, '
         + '                        0 MOV_SALIDAS, '
         + '                        0 MOV_SALDOS, '
         + '                        0 SALD_INGRESOS, '
         + '                        0 SALD_SALIDAS, '
         + '                        0 SALD_SALDOS_CALC, '
         + '                        0 SALD_SALDOS_ARCH, '
         + '                        STKFIN SALDO_316 '
         + '                   from LOG337 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text)
         + '                    and LOGANOMM=' + quotedstr(xAnoMes)
         + '            ) '
         + '          group by CIAID, ALMID, ARTID '
         + '          having (sum(MOV_INGRESOS)<>sum(SALD_INGRESOS) '
         + '              or sum(MOV_SALIDAS)<>sum(SALD_SALIDAS) '
         + '              or sum(MOV_SALDOS)<>sum(SALD_SALDOS_CALC) '
         + '              or sum(MOV_SALDOS)<>sum(SALD_SALDOS_ARCH) '
         + '              or sum(SALD_SALDOS_CALC)<>sum(SALD_SALDOS_ARCH)) '
         + '  order by ALMID, ARTID ';
}
      xSQL := ' Select CIAID, ARTID, ''                                        '' ARTDES, '
         + '                sum(MOV_INGRESOS) MOV_INGRESOS, '
         + '                sum(MOV_SALIDAS) MOV_SALIDAS, '
         + '                sum(MOV_SALDOS) MOV_SALDOS, '
         + '                sum(SALD_INGRESOS) SALD_INGRESOS, '
         + '                sum(SALD_SALIDAS) SALD_SALIDAS, '
         + '                sum(SALD_SALDOS_CALC) SALD_SALDOS_CALC, '
         + '                sum(SALD_SALDOS_ARCH) SALD_SALDOS_ARCH, '
         + '                sum(SALDO_316) SALDO_316 '
         + '           from (Select CIAID, ARTID, '
         + '                        sum(case when NISATIP=''INGRESO'' then KDXCNTG else 0 end) MOV_INGRESOS, '
         + '                        sum(case when NISATIP=''SALIDA'' then KDXCNTG else 0 end) MOV_SALIDAS, '
         + '                        sum(case when NISATIP=''INGRESO'' then KDXCNTG else -KDXCNTG end) MOV_SALDOS, '
         + '                        0 SALD_INGRESOS, '
         + '                        0 SALD_SALIDAS, '
         + '                        0 SALD_SALDOS_CALC, '
         + '                        0 SALD_SALDOS_ARCH, '
         + '                        0 SALDO_316 '
         + '                   from LOG315 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text) + ' and NISSIT=''ACEPTADO'' '
         + '                  group by CIAID, ARTID '
         + '                  union all '
         + '                 Select CIAID, ARTID, '
         + '                        0 MOV_INGRESOS, '
         + '                        0 MOV_SALIDAS, '
         + '                        0 MOV_SALDOS, '
         + '                        sum(CANTOTING) SALD_INGRESOS, '
         + '                        sum(CANTOTSAL) SALD_SALIDAS, '
         + '                        sum(CANTOTING-CANTOTSAL) SALD_SALDOS_CALC, '
         + '                        0 SALD_SALDOS_ARCH, '
         + '                        0 SALDO_316 '
         + '                   from LOG319 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text)
         + '                  group by CIAID, ARTID '
         + '                  union all '
         + '                 Select CIAID, ARTID, '
         + '                        0 MOV_INGRESOS, '
         + '                        0 MOV_SALIDAS, '
         + '                        0 MOV_SALDOS, '
         + '                        0 SALD_INGRESOS, '
         + '                        0 SALD_SALIDAS, '
         + '                        0 SALD_SALDOS_CALC, '
         + '                        STKFIN SALD_SALDOS_ARCH, '
         + '                        0 SALDO_316 '
         + '                   from LOG319 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text)
         + '                    and LOGANOMM=' + quotedstr(xAnoMes)
         + '                  union all '
         + '                 Select CIAID, ARTID, '
         + '                        0 MOV_INGRESOS, '
         + '                        0 MOV_SALIDAS, '
         + '                        0 MOV_SALDOS, '
         + '                        0 SALD_INGRESOS, '
         + '                        0 SALD_SALIDAS, '
         + '                        0 SALD_SALDOS_CALC, '
         + '                        0 SALD_SALDOS_ARCH, '
         + '                        STKFIN SALDO_316 '
         + '                   from LOG337 '
         + '                  where CIAID=' + quotedstr(dblcCia.Text)
         + '                    and LOGANOMM=' + quotedstr(xAnoMes)
         + '            ) '
         + '          group by CIAID, ARTID '
         + '          having (sum(MOV_INGRESOS)<>sum(SALD_INGRESOS) '
         + '              or sum(MOV_SALIDAS)<>sum(SALD_SALIDAS) '
         + '              or sum(MOV_SALDOS)<>sum(SALD_SALDOS_CALC) '
         + '              or sum(MOV_SALDOS)<>sum(SALD_SALDOS_ARCH) '
         + '              or sum(SALD_SALDOS_CALC)<>sum(SALD_SALDOS_ARCH)) '
         + '  order by ARTID ';
      DMALM.cdsQry3.Close;
      DMALM.cdsQry3.DataRequest(xSQL);
      DMALM.cdsQry3.Open;

      xSQL := ' Select ARTID, ARTDES '
         + '   from TGE205 '
         + '  where CIAID=' + quotedstr(dblcCia.Text);
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
      DMALM.cdsQry.IndexFieldNames := 'ARTID';
      DMALM.cdsQry3.First;
      While Not DMALM.cdsQry3.EOF Do
      Begin
         DMALM.cdsQry.SetKey;
         DMALM.cdsQry.FieldByName('ARTID').AsString := DMALM.cdsQry3.FieldByName('ARTID').AsString;
         If DMALM.cdsQry.Gotokey Then
         Begin
            DMALM.cdsQry3.Edit;
            DMALM.cdsQry3.FieldByName('ARTDES').AsString := DMALM.cdsQry.FieldByName('ARTDES').AsString;
            DMALM.cdsQry3.Post;
         End
         Else
         Begin
            DMALM.cdsQry3.Edit;
            DMALM.cdsQry3.FieldByName('ARTDES').AsString := '** NO ENCONTRADO EN MAESTRO **';
            DMALM.cdsQry3.Post;
         End;
         DMALM.cdsQry3.Next;
      End;
      DMALM.cdsQry.Close;
      DMALM.cdsQry.IndexFieldNames := '';

      dbgArtObser.Selected.Clear;
      dbgArtObser.Selected.Add('CIAID'#9'3'#9'Cía');
//      dbgArtObser.Selected.Add('ALMID'#9'5'#9'Almacén');
      dbgArtObser.Selected.Add('ARTID'#9'10'#9'Artículo');
      dbgArtObser.Selected.Add('ARTDES'#9'20'#9'Descripción~Artículo');
      dbgArtObser.Selected.Add('MOV_INGRESOS'#9'12'#9'Tot.Ingresos ~en Movimientos');
      dbgArtObser.Selected.Add('MOV_SALIDAS'#9'12'#9'Tot.Salidas ~en Movimientos');
      dbgArtObser.Selected.Add('MOV_SALDOS'#9'12'#9'Saldo ~en Movimientos');
      dbgArtObser.Selected.Add('SALD_INGRESOS'#9'12'#9'Tot.Ingresos~en Saldos');
      dbgArtObser.Selected.Add('SALD_SALIDAS'#9'12'#9'Tot.Salidas~en Saldos');
      dbgArtObser.Selected.Add('SALD_SALDOS_CALC'#9'12'#9'Saldo Calculado~de Saldos');
      dbgArtObser.Selected.Add('SALD_SALDOS_ARCH'#9'12'#9'Saldo en~Arch.Saldos');
      dbgArtObser.Selected.Add('SALDO_316'#9'12'#9'Saldo en~316');
      dbgArtObser.ApplySelected;

      dbgArtObser.DataSource := DMALM.dsQry3;
      DMALM.cdsQry3.First;
   End;
// Fin Movimientos vs Stock
End;

Procedure TFProcesos.dbgArtObserDblClick(Sender: TObject);
Begin
   dblcdArticulo.Text := DMALM.cdsQry3.FieldByName('ARTID').AsString;
   dblcdArticuloExit(Sender);
End;

Procedure TFProcesos.MuestraMovxArt;
Begin
   xSQL := ' Select 0 NUMORDEN, CIAID, ALMID, ALMID ALMID2, TRIID, ARTID, NISAFREG, NISATIP, NISAID, '
      + '        KDXCNTG, ARTPCG, ARTMORIPCG, 0 SALDO, ''N'' CAMBIADO '
      + '   from LOG315 '
      + '  where CIAID=' + quotedstr(dblcCia.Text)
      + '    and ARTID=' + quotedstr(dblcdArticulo.Text)
      + '    and NISSIT=''ACEPTADO'' '
      + '  order by ALMID, NISAFREG, NISATIP, NISAID';
   DMALM.cdsQry2.Close;
   DMALM.cdsQry2.DataRequest(xSQL);
   DMALM.cdsQry2.Open;
   DMALM.cdsQry2.IndexFieldNames := 'ALMID; NISAFREG; NISATIP; NISAID';
   DMALM.cdsQry2.First;
   RecalculaSaldosMov;
   dbgData.DataSource := DMALM.dsQry2;
   dbgData.Selected.Clear;
   dbgData.Selected.Add('CIAID'#9'3'#9'Cía');
   dbgData.Selected.Add('ALMID'#9'3'#9'Alm');
   dbgData.Selected.Add('TRIID'#9'3'#9'Trans');
   dbgData.Selected.Add('NISAFREG'#9'10'#9'Fecha');
   dbgData.Selected.Add('NISATIP'#9'12'#9'Tipo');
   dbgData.Selected.Add('NISAID'#9'12'#9'Nro.Nota');
   dbgData.Selected.Add('KDXCNTG'#9'12'#9'Cantidad');
   dbgData.Selected.Add('SALDO'#9'12'#9'Saldo');
   dbgData.Selected.Add('ARTPCG'#9'12'#9'Precio~Promedio');
   dbgData.Selected.Add('ARTMORIPCG'#9'12'#9'Precio en~Moneda Orig');
   dbgData.Selected.Add('CAMBIADO'#9'5'#9'Cambiado');
   dbgData.ApplySelected;
End;

Procedure TFProcesos.dbgDataCalcCellColors(Sender: TObject; Field: TField;
   State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   If DMALM.cdsQry2.FieldByName('SALDO').AsInteger < 0 Then
   Begin
      AFont.Style := [fsBold];
      ABrush.Color := clRed;
   End;
End;

Procedure TFProcesos.dbgDataDblClick(Sender: TObject);
Begin
   pnlCambioDatos.Visible := True;
   pnlCambioDatos.Left := 344;
   pnlCambioDatos.Top := 120;
   xSQL := 'Select ''  '' ALMID, ''  '' ALMID2, trunc(sysdate) FECHA, 0 CANTIDAD, 0.00 ARTPCG, 0.00 ARTMORIPCG from DUAL';
   DMALM.cdsQry4.Close;
   DMALM.cdsQry4.DataRequest(xSQL);
   DMALM.cdsQry4.Open;
   dbeAlmacen.DataField := 'ALMID';
   dbeAlmacen.DataSource := DMALM.dsQry4;
   dbeAlmacen2.DataField := 'ALMID2';
   dbeAlmacen2.DataSource := DMALM.dsQry4;
   dbdtpFecha.DataField := 'FECHA';
   dbdtpFecha.DataSource := DMALM.dsQry4;
   dbeCantidad.DataField := 'CANTIDAD';
   dbeCantidad.DataSource := DMALM.dsQry4;
   dbeCostoProm.DataField := 'ARTPCG';
   dbeCostoProm.DataSource := DMALM.dsQry4;
   dbeCostoMonOrig.DataField := 'ARTMORIPCG';
   dbeCostoMonOrig.DataSource := DMALM.dsQry4;
   DMALM.cdsQry4.Edit;
   DMALM.cdsQry4.FieldByName('ALMID').AsString := DMALM.cdsQry2.FieldByName('ALMID').AsString;
   DMALM.cdsQry4.FieldByName('ALMID2').AsString := DMALM.cdsQry2.FieldByName('ALMID').AsString;
   DMALM.cdsQry4.FieldByName('FECHA').AsDateTime := DMALM.cdsQry2.FieldByName('NISAFREG').AsDateTime;
   DMALM.cdsQry4.FieldByName('CANTIDAD').AsInteger := DMALM.cdsQry2.FieldByName('KDXCNTG').AsInteger;
   DMALM.cdsQry4.FieldByName('ARTPCG').AsFloat := DMALM.cdsQry2.FieldByName('ARTPCG').AsFloat;
   DMALM.cdsQry4.FieldByName('ARTMORIPCG').AsFloat := DMALM.cdsQry2.FieldByName('ARTMORIPCG').AsFloat;
   DMALM.cdsQry4.Post;
End;

Procedure TFProcesos.bbtnOkClick(Sender: TObject);
Var
   xNum: Integer;
Begin
   xNum := DMALM.cdsQry2.FieldByName('NUMORDEN').AsInteger;

   DMALM.cdsQry2.Edit;
   DMALM.cdsQry2.FieldByName('ALMID').AsString := DMALM.cdsQry4.FieldByName('ALMID').AsString;
   DMALM.cdsQry2.FieldByName('ALMID2').AsString := DMALM.cdsQry4.FieldByName('ALMID2').AsString;
   DMALM.cdsQry2.FieldByName('NISAFREG').AsDateTime := DMALM.cdsQry4.FieldByName('FECHA').AsDateTime;
   DMALM.cdsQry2.FieldByName('KDXCNTG').AsInteger := DMALM.cdsQry4.FieldByName('CANTIDAD').AsInteger;
   DMALM.cdsQry2.FieldByName('CAMBIADO').AsString := 'S';
   DMALM.cdsQry2.FieldByName('ARTPCG').AsFloat := DMALM.cdsQry4.FieldByName('ARTPCG').AsFloat;
   DMALM.cdsQry2.FieldByName('ARTMORIPCG').AsFloat := DMALM.cdsQry4.FieldByName('ARTMORIPCG').AsFloat;
   DMALM.cdsQry2.Post;
   RecalculaSaldosMov;
   DMALM.cdsQry2.Locate('NUMORDEN', xNum, []);
   pnlCambioDatos.Visible := False;
End;

Procedure TFProcesos.RecalculaSaldosMov;
Var
   xAlmAnt: String;
   xSaldo, xNum: Integer;
Begin
   xAlmAnt := 'XX';
   xNum := 0;
   DMALM.cdsQry2.First;
   While Not DMALM.cdsQry2.EOF Do
   Begin
      xNum := xNum + 1;
      If DMALM.cdsQry2.FieldByName('ALMID').AsString <> xAlmAnt Then
         xSaldo := 0;
      If DMALM.cdsQry2.FieldByName('NISATIP').AsString = 'INGRESO' Then
         xSaldo := xSaldo + DMALM.cdsQry2.FieldByName('KDXCNTG').AsInteger
      Else
         xSaldo := xSaldo - DMALM.cdsQry2.FieldByName('KDXCNTG').AsInteger;
      DMALM.cdsQry2.Edit;
      DMALM.cdsQry2.FieldByName('NUMORDEN').AsInteger := xNum;
      DMALM.cdsQry2.FieldByName('SALDO').AsInteger := xSaldo;
      DMALM.cdsQry2.Post;
      xAlmAnt := DMALM.cdsQry2.FieldByName('ALMID').AsString;
      DMALM.cdsQry2.Next;
   End;
   DMALM.cdsQry2.First;
End;

Procedure TFProcesos.bbtnCancelClick(Sender: TObject);
Begin
   pnlCambioDatos.Visible := False;
End;

Procedure TFProcesos.Z2bbtnGrabaClick(Sender: TObject);
Var
   xAno: String;
Begin
   xAno := copy(xAnoMes, 1, 4);
   DMALM.cdsQry2.First;
   While Not DMALM.cdsQry2.EOF Do
   Begin
      If DMALM.cdsQry2.FieldByName('CAMBIADO').AsString = 'S' Then
      Begin
         xSQL := ' Update LOG315 '
            + '    Set NISAFREG=' + quotedstr(datetostr(DMALM.cdsQry2.FieldByName('NISAFREG').AsDateTime)) + ','
            + '        KDXCNTG=' + inttostr(DMALM.cdsQry2.FieldByName('KDXCNTG').AsInteger) + ','
            + '        ALMID=' + quotedstr(DMALM.cdsQry2.FieldByName('ALMID2').AsString)
            + '  Where CIAID=' + quotedstr(DMALM.cdsQry2.FieldByName('CIAID').AsString)
            + '    and ALMID=' + quotedstr(DMALM.cdsQry2.FieldByName('ALMID').AsString)
            + '    and NISATIP=' + quotedstr(DMALM.cdsQry2.FieldByName('NISATIP').AsString)
            + '    and NISAID=' + quotedstr(DMALM.cdsQry2.FieldByName('NISAID').AsString)
            + '    and ARTID=' + quotedstr(DMALM.cdsQry2.FieldByName('ARTID').AsString);
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se actualizó ALMACEN=' + quotedstr(DMALM.cdsQry2.FieldByName('ALMID').AsString)
               + ' NOTA=' + quotedstr(DMALM.cdsQry2.FieldByName('NISAID').AsString));
            Exit;
         End;
      End;
      DMALM.cdsQry2.Next;
   End;
   xSQL := 'BEGIN DB2ADMIN.SP_ALM_REGENERA_STOCK('
      + quotedstr(DMALM.cdsQry2.FieldByName('CIAID').AsString) + ','
      + quotedstr(DMALM.cdsQry2.FieldByName('ARTID').AsString) + '); END;';
   Try
      DMALM.DCOM1.AppServer.IniciaTransaccion;
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      DMALM.DCOM1.AppServer.GrabaTransaccion;
   Except
      ShowMessage('Error al Actualizar los Saldos del Artículo');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   If rgTipoLista.ItemIndex = 1 Then
   Begin
      xSQL := ' Select CIAID, ALMID, ARTID, '
         + '        sum(MOV_INGRESOS) MOV_INGRESOS, '
         + '        sum(MOV_SALIDAS) MOV_SALIDAS, '
         + '        sum(MOV_SALDOS) MOV_SALDOS, '
         + '        sum(SALD_INGRESOS) SALD_INGRESOS, '
         + '        sum(SALD_SALIDAS) SALD_SALIDAS, '
         + '        sum(SALD_SALDOS_CALC) SALD_SALDOS_CALC, '
         + '        sum(SALD_SALDOS_ARCH) SALD_SALDOS_ARCH, '
         + '        sum(SALDO_316) SALDO_316 '
         + '   from (Select CIAID, ALMID, ARTID, '
         + '                sum(case when NISATIP=''INGRESO'' then KDXCNTG else 0 end) MOV_INGRESOS, '
         + '                sum(case when NISATIP=''SALIDA'' then KDXCNTG else 0 end) MOV_SALIDAS, '
         + '                sum(case when NISATIP=''INGRESO'' then KDXCNTG else -KDXCNTG end) MOV_SALDOS, '
         + '                0 SALD_INGRESOS, '
         + '                0 SALD_SALIDAS, '
         + '                0 SALD_SALDOS_CALC, '
         + '                0 SALD_SALDOS_ARCH, '
         + '                0 SALDO_316 '
         + '           from LOG315 '
         + '          where CIAID=' + quotedstr(dblcCia.Text) + ' and NISSIT=''ACEPTADO'' '
         + '            and ALMID=' + quotedstr(DMALM.cdsQry3.FieldByName('ALMID').AsString)
         + '            and ARTID=' + quotedstr(DMALM.cdsQry2.FieldByName('ARTID').AsString)
         + '          group by CIAID, ALMID, ARTID '
         + '          union all '
         + '         Select CIAID, ALMID, ARTID, '
         + '                0 MOV_INGRESOS, '
         + '                0 MOV_SALIDAS, '
         + '                0 MOV_SALDOS, '
         + '                sum(CANTOTING) SALD_INGRESOS, '
         + '                sum(CANTOTSAL) SALD_SALIDAS, '
         + '                sum(CANTOTING-CANTOTSAL) SALD_SALDOS_CALC, '
         + '                0 SALD_SALDOS_ARCH, '
         + '                0 SALDO_316 '
         + '           from LOG319 '
         + '          where CIAID=' + quotedstr(dblcCia.Text)
         + '            and ALMID=' + quotedstr(DMALM.cdsQry3.FieldByName('ALMID').AsString)
         + '            and ARTID=' + quotedstr(DMALM.cdsQry2.FieldByName('ARTID').AsString)
         + '          group by CIAID, ALMID, ARTID '
         + '          union all '
         + '         Select CIAID, ALMID, ARTID, '
         + '                0 MOV_INGRESOS, '
         + '                0 MOV_SALIDAS, '
         + '                0 MOV_SALDOS, '
         + '                0 SALD_INGRESOS, '
         + '                0 SALD_SALIDAS, '
         + '                0 SALD_SALDOS_CALC, '
         + '                STKFIN SALD_SALDOS_ARCH, '
         + '                0 SALDO_316 '
         + '           from LOG319 '
         + '          where CIAID=' + quotedstr(dblcCia.Text)
         + '            and LOGANOMM=' + quotedstr(xAnoMes)
         + '            and ALMID=' + quotedstr(DMALM.cdsQry3.FieldByName('ALMID').AsString)
         + '            and ARTID=' + quotedstr(DMALM.cdsQry2.FieldByName('ARTID').AsString)
         + '          union all '
         + '         Select CIAID, ALMID, ARTID, '
         + '                0 MOV_INGRESOS, '
         + '                0 MOV_SALIDAS, '
         + '                0 MOV_SALDOS, '
         + '                0 SALD_INGRESOS, '
         + '                0 SALD_SALIDAS, '
         + '                0 SALD_SALDOS_CALC, '
         + '                0 SALD_SALDOS_ARCH, '
         + '                 STKSACTG SALDO_316 '
         + '           from LOG316 '
         + '          where CIAID=' + quotedstr(dblcCia.Text)
         + '            and STKANO=' + quotedstr(xAno)
         + '            and ALMID=' + quotedstr(DMALM.cdsQry3.FieldByName('ALMID').AsString)
         + '            and ARTID=' + quotedstr(DMALM.cdsQry2.FieldByName('ARTID').AsString)
         + '         ) '
         + '  group by CIAID, ALMID, ARTID ';
      DMALM.cdsQry5.Close;
      DMALM.cdsQry5.DataRequest(xSQL);
      DMALM.cdsQry5.Open;
      If DMALM.cdsQry5.RecordCount > 0 Then
      Begin
         DMALM.cdsQry3.Edit;
         DMALM.cdsQry3.FieldByName('MOV_INGRESOS').AsFloat := DMALM.cdsQry5.FieldByName('MOV_INGRESOS').AsFloat;
         DMALM.cdsQry3.FieldByName('MOV_SALIDAS').AsFloat := DMALM.cdsQry5.FieldByName('MOV_SALIDAS').AsFloat;
         DMALM.cdsQry3.FieldByName('MOV_SALDOS').AsFloat := DMALM.cdsQry5.FieldByName('MOV_SALDOS').AsFloat;
         DMALM.cdsQry3.FieldByName('SALD_INGRESOS').AsFloat := DMALM.cdsQry5.FieldByName('SALD_INGRESOS').AsFloat;
         DMALM.cdsQry3.FieldByName('SALD_SALIDAS').AsFloat := DMALM.cdsQry5.FieldByName('SALD_SALIDAS').AsFloat;
         DMALM.cdsQry3.FieldByName('SALD_SALDOS_CALC').AsFloat := DMALM.cdsQry5.FieldByName('SALD_SALDOS_CALC').AsFloat;
         DMALM.cdsQry3.FieldByName('SALD_SALDOS_ARCH').AsFloat := DMALM.cdsQry5.FieldByName('SALD_SALDOS_ARCH').AsFloat;
         DMALM.cdsQry3.FieldByName('SALDO_316').AsFloat := DMALM.cdsQry5.FieldByName('SALDO_316').AsFloat;
         DMALM.cdsQry3.Post;
      End;
   End;

   If rgTipoLista.ItemIndex = 0 Then
   Begin
      xSQL := 'Select CIAID, ARTID, ARTDES, ARTCNTG, CANTGRAL '
         + '     from TGE205, '
         + '         (Select sum(case when NISATIP=''INGRESO'' '
         + '                          then KDXCNTG '
         + '                          else KDXCNTG*-1 '
         + '                      end) CANTGRAL '
         + '            from LOG315 '
         + '           where CIAID=' + quotedstr(dblcCia.Text)
         + '             and ARTID=' + quotedstr(DMALM.cdsQry2.FieldByName('ARTID').AsString)
         + '             and NISSIT=''ACEPTADO'' '
         + '             and ALMID in (select ALMID from TGE151 '
         + '                            where CIAID=' + quotedstr(dblcCia.Text)
         + '                              and ACTIVO=''S'') '
         + '          ) MOVS '
         + '    where CIAID=' + quotedstr(dblcCia.Text)
         + '      and ARTID=' + quotedstr(DMALM.cdsQry2.FieldByName('ARTID').AsString);
      DMALM.cdsQry5.Close;
      DMALM.cdsQry5.DataRequest(xSQL);
      DMALM.cdsQry5.Open;
      If DMALM.cdsQry5.RecordCount > 0 Then
      Begin
         DMALM.cdsQry3.Edit;
         DMALM.cdsQry3.FieldByName('ARTCNTG').AsFloat := DMALM.cdsQry5.FieldByName('ARTCNTG').AsFloat;
         DMALM.cdsQry3.FieldByName('CANTGRAL').AsFloat := DMALM.cdsQry5.FieldByName('CANTGRAL').AsFloat;
         DMALM.cdsQry3.Post;
      End;
   End;

   ShowMessage('Correctamente actualizado');
End;

Procedure TFProcesos.dblcCiaExit(Sender: TObject);
Begin
   edtCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCia.Text), 'CIADES');
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Registre correctamente la Cía');
      dblcCia.SetFocus;
      Exit;
   End;
   xSQL := ' Select * '
      + '   from LOG317 '
      + '  where CIAID=' + quotedstr(dblcCia.Text)
      + '    and NOCIERRE=(Select max(NOCIERRE) '
      + '                    from LOG317 '
      + '                   where CIAID=' + quotedstr(dblcCia.Text) + ') ';
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;
   dtpDesde.Date := DMALM.cdsQry.FieldByName('CNSPRICIE').AsDateTime;
   dtpHasta.Date := DMALM.cdsQry.FieldByName('CNSULTCIE').AsDateTime;

   xSQL := ' Select CIAID, TINID, GRARID, FAMID, SFAMID, ARTID, substr(ARTDES,1,40) ARTDES, ARTCNTG '
      + '   from TGE205 '
      + '  where CIAID=' + quotedstr(dblcCia.Text);
//         + '    and ARTEST=''H'' ';
   DMALM.cdsQry6.Close;
   DMALM.cdsQry6.DataRequest(xSQL);
   DMALM.cdsQry6.Open;
   If DMALM.cdsQry6.IndexFieldNames <> 'ARTID' Then
      DMALM.cdsQry6.IndexFieldNames := 'ARTID';

   dblcdArticulo.LookUpField := '';
   dblcdArticulo.LookUpTable := DMALM.cdsQry6;

End;

Procedure TFProcesos.dblcdArtExit(Sender: TObject);
Begin
   edtArtDes.Text := DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES', 'CIAID=' + quotedstr(dblcCia.Text) + ' and ARTID=' + quotedstr(dblcdArt.Text), 'ARTDES');
   dblcdArticulo.Text := dblcdArt.Text;
End;

Procedure TFProcesos.sbIr_al_NegClick(Sender: TObject);
Begin
   DMALM.cdsQry2.First;
   While Not DMALM.cdsQry2.EOF Do
   Begin
      If DMALM.cdsQry2.FieldByName('SALDO').AsInteger < 0 Then
         break;
      DMALM.cdsQry2.Next;
   End;
End;

Procedure TFProcesos.bbtnMetodo2Click(Sender: TObject);
Var
// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
   xCantInicioMes, xCantFinal, xCantMes, xCantIngMes, xCantSalMes, xCantProm: double;
   xAlm: String;
   xCampoInicial, xCampoIngresos, xCampoSalidas, xCampoFinal: String;
   wAno, wMes, wDia: Word;
   xAno, xMes, xDia, xMesAnt, xCorrelMes, xTinId, xAnoMesSig: String;
   xFecha1, xFechaUltMov, xFechaUltComp: TDateTime;
   xTieneMesFinal, xCambioMes: Boolean;
   xPrecioProm, xPrecioPromIni : double;

   xPrecioPromME, xUltPrecioCompra : double;
   xUltFechaCompra : TDateTime;
   xTMonId : String;
// Fin HPC_201801_ALM
Begin
   DecodeDate(dtpHasta.Date, wAno, wMes, wDia);
   xAno := inttostr(wAno);
   xMes := DMALM.strZero(inttostr(wMes), 2);
   xAnoMes := xAno + xMes;

   xSQL := 'Delete from LOG319 '
      + '    where CIAID=' + quotedstr(dblcCia.text)
      + '      and ARTID=' + quotedstr(dblcdArticulo.text);
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se Inicializó el archivo de SALDOS LOG319');
      exit;
   End;

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
//   xTieneMesFinal := False;
// Fin HPC_201801_ALM
   xSQL := 'Select LOG315.CIAID, to_char(LOG315.NISAFREG,''YYYYMM'') LOGANOMM, LOG315.ALMID, TGE205.TINID, LOG315.ARTID, '
      + '          0.00 STKINI, '
      + '          nvl(sum(case when NISATIP=''INGRESO'' then KDXCNTG else 0.00 end),0) CANTOTING, '
      + '          nvl(sum(case when NISATIP=''SALIDA'' then KDXCNTG else 0.00 end),0) CANTOTSAL, '
      + '          0.00 STKFIN, '
      + quotedstr(DMALM.wUsuario) + ' USUARIO, '
      + '          Sysdate FREG '
      + '     from LOG315, TGE205 '
      + '    where LOG315.CIAID=' + quotedstr(dblcCia.text)
      + '      and LOG315.ARTID=' + quotedstr(dblcdArticulo.text)
      + '      and LOG315.NISSIT=''ACEPTADO'' '
      + '      and TGE205.CIAID=LOG315.CIAID and TGE205.ARTID=LOG315.ARTID '
      + '    group by LOG315.CIAID, to_char(LOG315.NISAFREG,''YYYYMM''), LOG315.ALMID, TGE205.TINID, LOG315.ARTID ';
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(xSQL);
   DMALM.cdsSQL.Open;
   DMALM.cdsSQL.IndexFieldNames := 'ALMID; LOGANOMM';
   xTinId := DMALM.cdsSQL.FieldByName('TINID').AsString;
   DMALM.cdsSQL.First;
// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
   While Not DMALM.cdsSQL.EOF Do
   Begin
      xAlm := DMALM.cdsSQL.FieldByName('ALMID').AsString;
      xTieneMesFinal := False;
      xCantInicioMes := 0;
      xCantFinal := 0;
      xCorrelMes := DMALM.cdsSQL.FieldByName('LOGANOMM').AsString;
      While (Not DMALM.cdsSQL.EOF) And (DMALM.cdsSQL.FieldByName('ALMID').AsString = xAlm) Do
      Begin
         xCantFinal := xCantInicioMes
            + DMALM.cdsSQL.FieldByName('CANTOTING').AsFloat
            - DMALM.cdsSQL.FieldByName('CANTOTSAL').AsFloat;
         xSQL := 'Insert into LOG319(CIAID, LOGANOMM, ALMID, TINID, ARTID, STKINI, CANTOTING, CANTOTSAL, STKFIN, USUARIO, FREG) '
            + 'values(' + quotedstr(dblcCia.text) + ', '
            + quotedstr(DMALM.cdsSQL.FieldByName('LOGANOMM').AsString) + ', '
            + quotedstr(DMALM.cdsSQL.FieldByName('ALMID').AsString) + ', '
            + quotedstr(DMALM.cdsSQL.FieldByName('TINID').AsString) + ', '
            + quotedstr(DMALM.cdsSQL.FieldByName('ARTID').AsString) + ', '
            + floattostr(xCantInicioMes) + ', '
            + floattostr(DMALM.cdsSQL.FieldByName('CANTOTING').AsFloat) + ', '
            + floattostr(DMALM.cdsSQL.FieldByName('CANTOTSAL').AsFloat) + ', '
            + floattostr(xCantFinal) + ', '
            + quotedstr(DMALM.wUsuario) + ', '
            + 'sysdate)';
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se actualizó el archivo de SALDOS LOG319');
            exit;
         End;
         xCantInicioMes := xCantFinal;
         If DMALM.cdsSQL.FieldByName('LOGANOMM').AsString = xAnoMes Then
            xTieneMesFinal := True;
         xCorrelMes := DMALM.cdsSQL.FieldByName('LOGANOMM').AsString;
         DMALM.cdsSQL.Next;
      End;

      If (xCantFinal>0) and (not xTieneMesFinal) Then
      Begin
{
         If DMALM.cdsSQL.EOF Then
            xAnoMesSig := ''
         Else
            xAnoMesSig := DMALM.cdsSQL.FieldByName('LOGANOMM').AsString;

//         While (xAnoMesSig <> xCorrelMes) And (xCorrelMes <= xAnoMes) Do
}

         While xCorrelMes<xAnoMes Do
         Begin
            If (strtoint(copy(xCorrelMes, 5, 2)) + 1) < 13 Then
               xCorrelMes := copy(xCorrelMes, 1, 4) + DMALM.StrZero(inttostr(strtoint(copy(xCorrelMes, 5, 2)) + 1), 2)
            Else
               xCorrelMes := inttostr(strtoint(copy(xCorrelMes, 1, 4)) + 1) + '01';
            xSQL := 'Insert into LOG319(CIAID, LOGANOMM, ALMID, TINID, ARTID, STKINI, CANTOTING, CANTOTSAL, STKFIN, USUARIO, FREG) '
               + 'values(' + quotedstr(dblcCia.text) + ', '
               +             quotedstr(xCorrelMes) + ', '
               +             quotedstr(xAlm) + ', '
               +             quotedstr(xTinId) + ', '
               +             quotedstr(dblcdArticulo.text) + ', '
               +             floattostr(xCantFinal) + ', '
               +             floattostr(0.00) + ', '
               +             floattostr(0.00) + ', '
               +             floattostr(xCantFinal) + ', '
               +             quotedstr(DMALM.wUsuario) + ', '
               + '           sysdate)';
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se actualizó el archivo de SALDOS LOG319');
               exit;
            End;
//            If (strtoint(copy(xCorrelMes, 5, 2)) + 1) < 13 Then
//              xCorrelMes := copy(xCorrelMes, 1, 4) + DMALM.StrZero(inttostr(strtoint(copy(xCorrelMes, 5, 2)) + 1), 2)
//            Else
//               xCorrelMes := inttostr(strtoint(copy(xCorrelMes, 1, 4)) + 1) + '01';
         End;

      End;
      {
      If not xTieneMesFinal Then
      Begin
         xSQL := 'Insert into LOG319(CIAID, LOGANOMM, ALMID, TINID, ARTID, STKINI, CANTOTING, CANTOTSAL, STKFIN, USUARIO, FREG) '
            + 'values('+quotedstr(dblcCia.text)+', '
            +         quotedstr(xAnoMes)+', '
            +         quotedstr(DMALM.cdsSQL.FieldByName('ALMID').AsString)+', '
            +         quotedstr(DMALM.cdsSQL.FieldByName('TINID').AsString)+', '
            +         quotedstr(DMALM.cdsSQL.FieldByName('ARTID').AsString)+', '
            +         floattostr(xCantFinal)+', '
            +         floattostr(0.00)+', '
            +         floattostr(0.00)+', '
            +         floattostr(xCantFinal)+', '
            +         quotedstr(DMALM.wUsuario)+', '
            +         'sysdate)';
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se actualizó el archivo de SALDOS LOG319');
            exit;
         End;
      End;
      }
   End;

// Fin HPC_201801_ALM

   xSQL := 'Delete from LOG337 '
      + '    where CIAID=' + quotedstr(dblcCia.text)
      + '      and ARTID=' + quotedstr(dblcdArticulo.text)
      + '      and LOGANOMM>' + quotedstr(xAnoMes);
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se Inicializó el archivo de SALDOS LOG319');
      exit;
   End;

   xTieneMesFinal := False;
   xSQL := 'Select ARTID, to_char(NISAFREG,''YYYYMM'') LOGANOMM, '
      + '          sum(case when NISATIP=''INGRESO'' then KDXCNTG else 0.00 end) CANTOTING, '
      + '          sum(case when NISATIP=''SALIDA'' then KDXCNTG else 0.00 end) CANTOTSAL '
      + '     from LOG315 '
      + '    where LOG315.CIAID=' + quotedstr(dblcCia.text)
      + '      and LOG315.ARTID=' + quotedstr(dblcdArticulo.text)
      + '      and LOG315.NISSIT=''ACEPTADO'' '
      + '    group by ARTID, to_char(NISAFREG,''YYYYMM'') ';
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(xSQL);
   DMALM.cdsSQL.Open;
   DMALM.cdsSQL.IndexFieldNames := 'LOGANOMM';
   DMALM.cdsSQL.First;
   xCantInicioMes := 0;
   xCantFinal := 0;
   xCorrelMes := DMALM.cdsSQL.FieldByName('LOGANOMM').AsString;
   While Not DMALM.cdsSQL.EOF Do
   Begin
      xCantFinal := xCantInicioMes
         + DMALM.cdsSQL.FieldByName('CANTOTING').AsFloat
         - DMALM.cdsSQL.FieldByName('CANTOTSAL').AsFloat;
      xSQL := 'Select ARTID from LOG337 '
         + '    where LOG337.CIAID=' + quotedstr(dblcCia.text)
         + '      and LOG337.ARTID=' + quotedstr(dblcdArticulo.text)
         + '      and LOG337.LOGANOMM=' + quotedstr(DMALM.cdsSQL.FieldByName('LOGANOMM').AsString);
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
      If DMALM.cdsQry.RecordCount > 0 Then
      Begin
         xSQL := 'Update LOG337 '
            + '      Set STKINI=' + floattostr(xCantInicioMes) + ', '
            + '          CANTOTING=' + floattostr(DMALM.cdsSQL.FieldByName('CANTOTING').AsFloat) + ', '
            + '          CANTOTSAL=' + floattostr(DMALM.cdsSQL.FieldByName('CANTOTSAL').AsFloat) + ', '
            + '          STKFIN=' + floattostr(xCantFinal)
            + '    where LOG337.CIAID=' + quotedstr(dblcCia.text)
            + '      and LOG337.ARTID=' + quotedstr(dblcdArticulo.text)
            + '      and LOG337.LOGANOMM=' + quotedstr(DMALM.cdsSQL.FieldByName('LOGANOMM').AsString);
      End
      Else
      Begin
         xSQL := 'Insert into LOG337(CIAID, LOGANOMM, ARTID, STKINI, CANTOTING, CANTOTSAL, STKFIN, USUARIO, FREG) '
            + 'values(' + quotedstr(dblcCia.text) + ', '
            + quotedstr(DMALM.cdsSQL.FieldByName('LOGANOMM').AsString) + ', '
            + quotedstr(DMALM.cdsSQL.FieldByName('ARTID').AsString) + ', '
            + floattostr(xCantInicioMes) + ', '
            + floattostr(DMALM.cdsSQL.FieldByName('CANTOTING').AsFloat) + ', '
            + floattostr(DMALM.cdsSQL.FieldByName('CANTOTSAL').AsFloat) + ', '
            + floattostr(xCantFinal) + ', '
            + quotedstr(DMALM.wUsuario) + ', '
            + 'sysdate)';
      End;
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se actualizó el archivo de SALDOS LOG337');
         exit;
      End;
      If DMALM.cdsSQL.FieldByName('LOGANOMM').AsString = xAnoMes Then
         xTieneMesFinal := True;
      xCantInicioMes := xCantFinal;
///////////////////////////////////
      If (strtoint(copy(xCorrelMes, 5, 2)) + 1) < 13 Then
         xCorrelMes := copy(xCorrelMes, 1, 4) + DMALM.StrZero(inttostr(strtoint(copy(xCorrelMes, 5, 2)) + 1), 2)
      Else
         xCorrelMes := inttostr(strtoint(copy(xCorrelMes, 1, 4)) + 1) + '01';
      DMALM.cdsSQL.Next;

      If DMALM.cdsSQL.EOF Then
         xAnoMesSig := ''
      Else
         xAnoMesSig := DMALM.cdsSQL.FieldByName('LOGANOMM').AsString;
      While (xAnoMesSig <> xCorrelMes) And (xCorrelMes <= xAnoMes) Do
      Begin
         xSQL := 'Select ARTID from LOG337 '
            + '    where LOG337.CIAID=' + quotedstr(dblcCia.text)
            + '      and LOG337.ARTID=' + quotedstr(dblcdArticulo.text)
            + '      and LOG337.LOGANOMM=' + quotedstr(xCorrelMes);
         DMALM.cdsQry.Close;
         DMALM.cdsQry.DataRequest(xSQL);
         DMALM.cdsQry.Open;
         If DMALM.cdsQry.RecordCount > 0 Then
         Begin
            xSQL := 'Update LOG337 '
               + '      Set STKINI=' + floattostr(xCantInicioMes) + ', '
               + '          CANTOTING=' + floattostr(0.00) + ', '
               + '          CANTOTSAL=' + floattostr(0.00) + ', '
               + '          STKFIN=' + floattostr(xCantFinal)
               + '    where LOG337.CIAID=' + quotedstr(dblcCia.text)
               + '      and LOG337.ARTID=' + quotedstr(dblcdArticulo.text)
               + '      and LOG337.LOGANOMM=' + quotedstr(xCorrelMes);
         End
         Else
         Begin
            xSQL := 'Insert into LOG337(CIAID, LOGANOMM, ARTID, STKINI, CANTOTING, CANTOTSAL, STKFIN, USUARIO, FREG) '
               + 'values(' + quotedstr(dblcCia.text) + ', '
               + quotedstr(xCorrelMes) + ', '
               + quotedstr(dblcdArticulo.text) + ', '
               + floattostr(xCantInicioMes) + ', '
               + floattostr(0.00) + ', '
               + floattostr(0.00) + ', '
               + floattostr(xCantFinal) + ', '
               + quotedstr(DMALM.wUsuario) + ', '
               + 'sysdate)';
         End;
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se actualizó el archivo de SALDOS LOG337');
            exit;
         End;
         If (strtoint(copy(xCorrelMes, 5, 2)) + 1) < 13 Then
            xCorrelMes := copy(xCorrelMes, 1, 4) + DMALM.StrZero(inttostr(strtoint(copy(xCorrelMes, 5, 2)) + 1), 2)
         Else
            xCorrelMes := inttostr(strtoint(copy(xCorrelMes, 1, 4)) + 1) + '01';
      End;
   End;

   {
   If not xTieneMesFinal Then
   Begin
      xSQL := 'Insert into LOG337(CIAID, LOGANOMM, ARTID, STKINI, CANTOTING, CANTOTSAL, STKFIN, USUARIO, FREG) '
         + 'values('+quotedstr(dblcCia.text)+', '
         +         quotedstr(xAnoMes)+', '
         +         quotedstr(dblcdArticulo.text)+', '
         +         floattostr(xCantFinal)+', '
         +         floattostr(0.00)+', '
         +         floattostr(0.00)+', '
         +         floattostr(xCantFinal)+', '
         +         quotedstr(DMALM.wUsuario)+', '
         +         'sysdate)';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se actualizó el archivo de SALDOS LOG337');
         exit;
      End;
   End;
   }
// Costo Promedio
// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
   xSQL := 'Select LOG315.CIAID, LOG315.ALMID, LOG315.ARTID, LOG315.NISAID, LOG315.NISATIP, LOG315.ARTMORIPCG ARTPCG, '
      + '          LOG315.NISAFREG, LOG315.KDXCNTG, '
      + '          LOG315.KDXHREG, LOG315.KDXANO, to_char(LOG315.NISAFREG, ''YYYYMM'') LOGANOMM, LOG315.TRIID, TGE208.ACTCOSPRO, '
//////////////////      + '          LOG315.TMONID, TGE107.TCAMVBV TCAMBIO '
      + '          LOG315.TMONID, TGE107.TCAMVBC TCAMBIO '
      + '     from LOG315, TGE208, TGE107 '
      + '    where LOG315.CIAID = ' + quotedstr(dblcCia.text)
      + '      and LOG315.ARTID = ' + quotedstr(dblcdArticulo.text)
      + '      and LOG315.NISSIT = ''ACEPTADO'' '
      + '      and TGE208.TRISGT=substr(LOG315.NISATIP,1,1) and TGE208.TRIID=LOG315.TRIID '
//      + '      and TGE107.FECHA= nvl(trunc(LOG315.NISAFDOC),trunc(LOG315.NISAFREG)) '
      + '      and TGE107.FECHA=nvl(trunc(LOG315.NISAFREG),trunc(LOG315.KDXHREG)) '
      + '    union all '
      + '   Select DET.CIAID, ''XZ'' ALMID, DET.ARTID, DET.ARTID NISAID, ''INGRESO'' NISATIP, DET.IMP_APL, '
      + '          trunc(CAB.FECHA_APL) NISAFREG, 0 KDXCNTG, CAB.FECHA_APL KDXHREG, '
      + '          to_char(CAB.FECHA_APL,''YYYY'') KDXANO, to_char(CAB.FECHA_APL,''YYYYMM'') LOGANOMM, ''NC'' TRIID, '
      + '          ''S'' ACTCOSPRO, CAB.TMONID, TGE107.TCAMVBV TCAMBIO '
      + '     from LOG_REVAL_DET DET, LOG_REVAL_CAB CAB, TGE107 '
      + '    where DET.CIAID=' + quotedstr(dblcCia.text)
      + '      and DET.ARTID=' + quotedstr(dblcdArticulo.text)
      + '      and CAB.CIAID=DET.CIAID and CAB.RUCPROV=DET.RUCPROV and CAB.TIPDOC=DET.TIPDOC '
      + '      and CAB.SERIEDOC=DET.SERIEDOC and CAB.NUMDOC=DET.NUMDOC '
      + '      and CAB.ESTADO=''ACEPTADO'' '
      + '      and TGE107.FECHA=trunc(CAB.FECHA_APL) ';
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(xSQL);
   DMALM.cdsSQL.Open;

   xSQL := 'Select ARTID from LOG_REVAL_DET DET '
      + '    where DET.CIAID=' + quotedstr(dblcCia.text)
      + '      and DET.ARTID=' + quotedstr(dblcdArticulo.text);
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;

   If DMALM.cdsQry.RecordCount>0 Then
      DMALM.cdsSQL.IndexFieldNames := 'NISAFREG; KDXHREG; TRIID'
   Else
//      DMALM.cdsSQL.IndexFieldNames := 'NISAFREG; NISATIP; KDXHREG';
      DMALM.cdsSQL.IndexFieldNames := 'NISAFREG; KDXHREG';
   DMALM.cdsSQL.First;
   xPrecioProm := 0;
// POR SI ACASO COMIENCE CON NOTA(S) DE SALIDA)
// Fin HPC_201801_ALM

   If DMALM.cdsSQL.FieldByName('NISATIP').AsString = 'SALIDA' Then
   Begin
      While Not DMALM.cdsSQL.EOF Do
      Begin
         xSQL := 'Update LOG315 '
            + '      Set ARTPCG=0, ARTMORIPCG=0, ARTTOTALG=0 '
            + '    where CIAID='+quotedstr(dblcCia.text)
            + '      and ALMID='+quotedstr(DMALM.cdsSQL.FieldByName('ALMID').AsString)
            + '      and NISATIP='+quotedstr(DMALM.cdsSQL.FieldByName('NISATIP').AsString)
            + '      and NISAID='+quotedstr(DMALM.cdsSQL.FieldByName('NISAID').AsString)
            + '      and ARTID='+quotedstr(DMALM.cdsSQL.FieldByName('ARTID').AsString);
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se actualizó Costo Promedio (1)');
            exit;
         End;
         If DMALM.cdsSQL.FieldByName('NISATIP').AsString <> 'SALIDA' Then
            Break;
         DMALM.cdsSQL.Next;
      End;
   End;
   xPrecioPromIni := DMALM.cdsSQL.FieldByName('ARTPCG').AsFloat;
   xPrecioProm := DMALM.cdsSQL.FieldByName('ARTPCG').AsFloat;

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
   xCantProm := 0;
   xCambioMes := False;

   xUltPrecioCompra := 0;
   xUltFechaCompra := strtodate('01/01/1900');

   If DMALM.cdsSQL.FieldByName('TMONID').AsString='D' Then
   Begin
      xPrecioPromIni := DMALM.FRound(xPrecioPromIni*DMALM.cdsSQL.FieldByName('TCAMBIO').AsFloat, 15, 4);
   End;
   xPrecioPromME  := xPrecioProm;

   While Not DMALM.cdsSQL.EOF Do
   Begin
      xCorrelMes := DMALM.cdsSQL.FieldByName('LOGANOMM').AsString;
      While (Not DMALM.cdsSQL.EOF) and (DMALM.cdsSQL.FieldByName('LOGANOMM').AsString=xCorrelMes) Do
      Begin
         xFechaUltMov := DMALM.cdsSQL.FieldByName('NISAFREG').AsDateTime;
      // Si el Registro es Nota de Crédito
         If DMALM.cdsSQL.FieldByName('TRIID').AsString = 'NC' then
         Begin
            xTMonId := DMALM.cdsSQL.FieldByName('TMONID').AsString;
            xPrecioProm := (xPrecioPromME*xCantProm - DMALM.cdsSQL.FieldByName('ARTPCG').AsFloat) / xCantProm;
            xPrecioPromME  := xPrecioProm;
            xUltPrecioCompra := xPrecioProm;
            xUltFechaCompra  := DMALM.cdsSQL.FieldByName('NISAFREG').AsDateTime;
            If xTMonId='D' then
            Begin
               xPrecioProm := DMALM.FRound(xPrecioProm*DMALM.cdsSQL.FieldByName('TCAMBIO').AsFloat, 15, 4);
               xUltPrecioCompra := DMALM.FRound(xUltPrecioCompra*DMALM.cdsSQL.FieldByName('TCAMBIO').AsFloat, 15, 4);
            End;
         End
         Else
         Begin
         // Si es Ingreso que actualiza el Costo Promedio
            If (DMALM.cdsSQL.FieldByName('ACTCOSPRO').AsString = 'S') and (DMALM.cdsSQL.FieldByName('NISATIP').AsString = 'INGRESO') Then
            Begin
               If DMALM.cdsSQL.FieldByName('NISAFREG').AsDateTime>xUltFechaCompra Then
               Begin
                  xTMonId := DMALM.cdsSQL.FieldByName('TMONID').AsString;
                  xUltPrecioCompra := DMALM.cdsSQL.FieldByName('ARTPCG').AsFloat;
                  xUltFechaCompra  := DMALM.cdsSQL.FieldByName('NISAFREG').AsDateTime;
               End;
            End;

         // Inicio HPC_201801_ALM
         // cambio en Costo Promedio
            If (DMALM.cdsSQL.FieldByName('ACTCOSPRO').AsString = 'S') And (DMALM.cdsSQL.FieldByName('NISATIP').AsString = 'INGRESO') Then
            Begin
               xFechaUltComp := DMALM.cdsSQL.FieldByName('NISAFREG').AsDateTime;
               xUltPrecioCompra := DMALM.cdsSQL.FieldByName('ARTPCG').AsFloat;
               If xTMonId='D' then
                  xUltPrecioCompra := DMALM.FRound(DMALM.cdsSQL.FieldByName('ARTPCG').AsFloat
                                     *DMALM.cdsSQL.FieldByName('TCAMBIO').AsFloat, 15, 4);

            //   xPrecioProm := (xPrecioPromME * xCantProm + DMALM.cdsSQL.FieldByName('ARTPCG').AsFloat * DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat) / (xCantProm + DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat);
               xPrecioProm := (xPrecioProm * xCantProm + xUltPrecioCompra * DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat) / (xCantProm + DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat);
               xPrecioPromME := xPrecioProm;
               xUltPrecioCompra := xPrecioProm;
            //   If xTMonId='D' then
            //   Begin
            //      xPrecioProm := DMALM.FRound(xPrecioProm*DMALM.cdsSQL.FieldByName('TCAMBIO').AsFloat, 15, 4);
            //      xUltPrecioCompra := DMALM.FRound(xUltPrecioCompra*DMALM.cdsSQL.FieldByName('TCAMBIO').AsFloat, 15, 4);
            //   End;
            End;

            If DMALM.cdsSQL.FieldByName('NISATIP').AsString = 'INGRESO' Then
               xCantProm := xCantProm + DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat
            Else
               xCantProm := xCantProm - DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat;
         // Fin HPC_201801_ALM
         End;

         If DMALM.cdsSQL.FieldByName('ACTCOSPRO').AsString <> 'S' Then
         Begin
            xSQL := 'Update LOG315 '
               + '      Set ARTPCG='+floattostr(xPrecioProm)+','
               + '          ARTMORIPCG='+floattostr(xPrecioProm)+','
               + '          ARTTOTALG=round(KDXCNTG * '+floattostr(xPrecioProm)+',2), '
               + '          TMONID=''N'' '
               + '    where CIAID='+quotedstr(dblcCia.text)
               + '      and ALMID='+quotedstr(DMALM.cdsSQL.FieldByName('ALMID').AsString)
               + '      and NISATIP='+quotedstr(DMALM.cdsSQL.FieldByName('NISATIP').AsString)
               + '      and NISAID='+quotedstr(DMALM.cdsSQL.FieldByName('NISAID').AsString)
               + '      and ARTID='+quotedstr(DMALM.cdsSQL.FieldByName('ARTID').AsString);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se actualizó Costo Promedio (2)');
               exit;
            End;
         End;
         DMALM.cdsSQL.Next;
      End;

      xSQL := 'Update LOG337 '
         + '      Set PREPROMINI = ' + FloatToStr(xPrecioPromIni) + ', '
         + '          VALTOTINI = round(STKINI*' + FloatToStr(xPrecioPromIni) + ',2), '
         + '          MONTOTING = round(CANTOTING*' + FloatToStr(xPrecioProm) + ',2), '
         + '          MONTOTSAL = round(CANTOTSAL*' + FloatToStr(xPrecioProm) + ',2), '
         + '          PREPROMFIN = ' + FloatToStr(xPrecioProm) + ', '
         + '          VALTOTFIN = round(STKFIN*' + FloatToStr(xPrecioProm) + ',2)'
         + '    where CIAID=' + quotedstr(dblcCia.text)
         + '      and ARTID=' + quotedstr(dblcdArticulo.text)
         + '      and LOGANOMM=' + quotedstr(xCorrelMes);
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se actualizó Precio en archivo de SALDOS LOG337');
         exit;
      End;
      xPrecioPromIni :=  xPrecioProm;
   End;

   If (xCantProm>0) and (xCorrelMes<xAnoMes) Then
   Begin
      While xCorrelMes <= xAnoMes Do
      Begin
         If (strtoint(copy(xCorrelMes, 5, 2)) + 1) < 13 Then
            xCorrelMes := copy(xCorrelMes, 1, 4) + DMALM.StrZero(inttostr(strtoint(copy(xCorrelMes, 5, 2)) + 1), 2)
         Else
            xCorrelMes := inttostr(strtoint(copy(xCorrelMes, 1, 4)) + 1) + '01';

         xSQL := 'Update LOG337 '
            + '      Set PREPROMINI = ' + FloatToStr(xPrecioPromIni) + ', '
            + '          VALTOTINI = round(STKINI*' + FloatToStr(xPrecioPromIni) + ',2), '
            + '          MONTOTING = round(CANTOTING*' + FloatToStr(xPrecioProm) + ',2), '
            + '          MONTOTSAL = round(CANTOTSAL*' + FloatToStr(xPrecioProm) + ',2), '
            + '          PREPROMFIN=' + FloatToStr(xPrecioProm) + ', '
            + '          VALTOTFIN = round(STKFIN*' + FloatToStr(xPrecioProm) + ',2)'
            + '    where CIAID=' + quotedstr(dblcCia.text)
            + '      and ARTID=' + quotedstr(dblcdArticulo.text)
            + '      and LOGANOMM=' + quotedstr(xCorrelMes);
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se actualizó precio en el archivo de SALDOS LOG337');
            exit;
         End;
      End;
   End;

// Archivo Maestro TGE205
   xSQL := 'Update TGE205 '
      + '      set ARTPCG='+floattostr(xUltPrecioCompra)+ ','
      + '          ARTFUC='+quotedstr(datetostr(xUltFechaCompra))+ ','
      + '          COSTOANT=ARTCPROG, '
      + '          ARTCNTG=' + FloatToStr(xCantFinal) + ','
      + '          ARTCPROG=round(' + FloatToStr(xPrecioProm) + ',2), '
      + '          ARTMNTG=round(' + FloatToStr(xCantFinal * xPrecioProm) + ',2), '
      + '          ARTFUMV=' + quotedstr(datetostr(xFechaUltMov)) + ', '
      + '          ARTFADQ=' + quotedstr(datetostr(xFechaUltComp)) + ' '
      + '    where CIAID=' + quotedstr(dblcCia.text)
      + '      and ARTID=' + quotedstr(dblcdArticulo.text);
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se actualizó el Maestro de Artículos TGE205');
      exit;
   End;

// Fin HPC_201801_ALM

   If DMALM.cdsQry3.Active Then
   Begin
      DMALM.cdsSQL.Close;
      DMALM.cdsSQL.IndexFieldNames := '';

      xSQL := ' Select CIAID, ARTID, '
         + '        sum(MOV_INGRESOS) MOV_INGRESOS, '
         + '        sum(MOV_SALIDAS) MOV_SALIDAS, '
         + '        sum(MOV_SALDOS) MOV_SALDOS, '
         + '        sum(SALD_INGRESOS) SALD_INGRESOS, '
         + '        sum(SALD_SALIDAS) SALD_SALIDAS, '
         + '        sum(SALD_SALDOS_CALC) SALD_SALDOS_CALC, '
         + '        sum(SALD_SALDOS_ARCH) SALD_SALDOS_ARCH, '
         + '        sum(SALDO_316) SALDO_316 '
         + '   from (Select CIAID, ARTID, '
         + '                sum(case when NISATIP=''INGRESO'' then KDXCNTG else 0 end) MOV_INGRESOS, '
         + '                sum(case when NISATIP=''SALIDA'' then KDXCNTG else 0 end) MOV_SALIDAS, '
         + '                sum(case when NISATIP=''INGRESO'' then KDXCNTG else -KDXCNTG end) MOV_SALDOS, '
         + '                0 SALD_INGRESOS, '
         + '                0 SALD_SALIDAS, '
         + '                0 SALD_SALDOS_CALC, '
         + '                0 SALD_SALDOS_ARCH, '
         + '                0 SALDO_316 '
         + '           from LOG315 '
         + '          where CIAID=' + quotedstr(dblcCia.Text) + ' and NISSIT=''ACEPTADO'' '
         + '            and ARTID=' + quotedstr(dblcdArticulo.text)
         + '          group by CIAID, ARTID '
         + '          union all '
         + '         Select CIAID, ARTID, '
         + '                0 MOV_INGRESOS, '
         + '                0 MOV_SALIDAS, '
         + '                0 MOV_SALDOS, '
         + '                sum(CANTOTING) SALD_INGRESOS, '
         + '                sum(CANTOTSAL) SALD_SALIDAS, '
         + '                sum(CANTOTING-CANTOTSAL) SALD_SALDOS_CALC, '
         + '                0 SALD_SALDOS_ARCH, '
         + '                0 SALDO_316 '
         + '           from LOG319 '
         + '          where CIAID=' + quotedstr(dblcCia.Text)
         + '            and ARTID=' + quotedstr(dblcdArticulo.text)
         + '          group by CIAID, ARTID '
         + '          union all '
         + '         Select CIAID, ARTID, '
         + '                0 MOV_INGRESOS, '
         + '                0 MOV_SALIDAS, '
         + '                0 MOV_SALDOS, '
         + '                0 SALD_INGRESOS, '
         + '                0 SALD_SALIDAS, '
         + '                0 SALD_SALDOS_CALC, '
         + '                STKFIN SALD_SALDOS_ARCH, '
         + '                0 SALDO_316 '
         + '           from LOG319 '
         + '          where CIAID=' + quotedstr(dblcCia.Text)
         + '            and LOGANOMM=' + quotedstr(xAnoMes)
         + '            and ARTID=' + quotedstr(dblcdArticulo.text)
         + '          union all '
         + '         Select CIAID, ARTID, '
         + '                0 MOV_INGRESOS, '
         + '                0 MOV_SALIDAS, '
         + '                0 MOV_SALDOS, '
         + '                0 SALD_INGRESOS, '
         + '                0 SALD_SALIDAS, '
         + '                0 SALD_SALDOS_CALC, '
         + '                0 SALD_SALDOS_ARCH, '
         + '                STKFIN SALDO_316 '
         + '           from LOG337 '
         + '          where CIAID=' + quotedstr(dblcCia.Text)
         + '            and LOGANOMM=' + quotedstr(xAnoMes)
         + '            and ARTID=' + quotedstr(dblcdArticulo.text)
         + '         ) '
         + '  group by CIAID, ARTID ';
      DMALM.cdsQry5.Close;
      DMALM.cdsQry5.DataRequest(xSQL);
      DMALM.cdsQry5.Open;
      If DMALM.cdsQry5.RecordCount > 0 Then
      Begin
         If rgTipoLista.ItemIndex = 1 Then
         Begin
            DMALM.cdsQry3.Edit;
            DMALM.cdsQry3.FieldByName('MOV_INGRESOS').AsFloat := DMALM.cdsQry5.FieldByName('MOV_INGRESOS').AsFloat;
            DMALM.cdsQry3.FieldByName('MOV_SALIDAS').AsFloat := DMALM.cdsQry5.FieldByName('MOV_SALIDAS').AsFloat;
            DMALM.cdsQry3.FieldByName('MOV_SALDOS').AsFloat := DMALM.cdsQry5.FieldByName('MOV_SALDOS').AsFloat;
            DMALM.cdsQry3.FieldByName('SALD_INGRESOS').AsFloat := DMALM.cdsQry5.FieldByName('SALD_INGRESOS').AsFloat;
            DMALM.cdsQry3.FieldByName('SALD_SALIDAS').AsFloat := DMALM.cdsQry5.FieldByName('SALD_SALIDAS').AsFloat;
            DMALM.cdsQry3.FieldByName('SALD_SALDOS_CALC').AsFloat := DMALM.cdsQry5.FieldByName('SALD_SALDOS_CALC').AsFloat;
            DMALM.cdsQry3.FieldByName('SALD_SALDOS_ARCH').AsFloat := DMALM.cdsQry5.FieldByName('SALD_SALDOS_ARCH').AsFloat;
            DMALM.cdsQry3.FieldByName('SALDO_316').AsFloat := DMALM.cdsQry5.FieldByName('SALDO_316').AsFloat;
            DMALM.cdsQry3.Post;
         End;
      End;
   End;
   If Not xDesdeLista Then
      ShowMessage('Método 2 ok');
End;

Procedure TFProcesos.bbtnMetodo2AntClick(Sender: TObject);
Var
   xCantInicioMes, xCantFinal, xCantMes, xCantIngMes, xCantSalMes: double;
   xAlm: String;
   xCampoInicial, xCampoIngresos, xCampoSalidas, xCampoFinal: String;
   wAno, wMes, wDia: Word;
   xAno, xMes, xDia, xMesAnt: String;
   xFecha1: TDateTime;
Begin
   DecodeDate(dtpHasta.Date, wAno, wMes, wDia);
   xAno := inttostr(wAno);
   xMes := DMALM.strZero(inttostr(wMes), 2);
   xAnoMes := xAno + xMes;
   xFecha1 := strtodate('01/' + xMes + '/' + xAno);

   xSQL := 'select CIAID, ALMID, ARTID, NISAID, NISATIP, ARTPCG, NISAFREG, '
      + '       KDXCNTG, KDXANO, to_char(NISAFREG,''YYYYMM'') ANOMES '
      + '  from LOG315 '
      + ' where CIAID=' + quotedstr(dblcCia.text)
      + '   and ARTID=' + quotedstr(dblcdArticulo.text)
      + '   and NISSIT=''ACEPTADO'' '
      + '   and NISAFREG>=' + quotedstr(datetostr(xFecha1))
      + '   and NISAFREG<=' + quotedstr(datetostr(dtpHasta.Date))
      + ' order by ARTID, ALMID, NISAFREG, NISATIP, NISAID ';
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(xSQL);
   DMALM.cdsSQL.Open;
   DMALM.cdsSQL.IndexFieldNames := 'ARTID; ALMID; NISAFREG; NISATIP; NISAID';
   DMALM.cdsSQL.First;

   xCantFinal := 0;
   While Not DMALM.cdsSQL.EOF Do
   Begin
      xCantInicioMes := 0;
      xALM := DMALM.cdsSQL.FieldByName('ALMID').AsString;

   // Rescata Saldos de Mes Anterior
      If xMes = '01' Then
         xMesAnt := inttostr(wAno + 1) + '12'
      Else
         xMesAnt := xAno + DMALM.strZero(inttostr(wMes - 1), 2);

      xSQL := ' Select CIAID, LOGANOMM, ALMID, TINID, ARTID, STKINI, CANTOTING, '
         + '        CANTOTSAL, STKFIN, USUARIO, FREG '
         + '   from LOG319 '
         + '  where CIAID=' + quotedstr(dblcCia.text)
         + '    and LOGANOMM=' + quotedstr(xMesAnt)
         + '    and ALMID=' + quotedstr(xALM)
         + '    and ARTID=' + quotedstr(dblcdArticulo.text);
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
      If DMALM.cdsQry.RecordCount > 0 Then
         xCantInicioMes := DMALM.cdsQry.FieldByName('STKFIN').AsFloat;

      xCantFinal := xCantFinal + xCantInicioMes;

   // Revisa Saldos del Mes Actual, sino está lo inserta en Tabla LOG319
      xSQL := ' Select CIAID, LOGANOMM, ALMID, TINID, ARTID, STKINI, CANTOTING, '
         + '        CANTOTSAL, STKFIN, USUARIO, FREG '
         + '   from LOG319 '
         + '  where CIAID=' + quotedstr(dblcCia.text)
         + '    and LOGANOMM=' + quotedstr(xAno + xMes)
         + '    and ALMID=' + quotedstr(xALM)
         + '    and ARTID=' + quotedstr(dblcdArticulo.text);
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
      If DMALM.cdsQry.RecordCount = 0 Then
      Begin
         xSQL := ' Insert into LOG319(CIAID, LOGANOMM, ALMID, TINID, ARTID, '
            + '                    STKINI, CANTOTING, CANTOTSAL, STKFIN, USUARIO, FREG) '
            + ' values('
            + quotedstr(dblcCia.text) + ','
            + quotedstr(xAnoMes) + ','
            + quotedstr(xALM) + ','
            + quotedstr(DMALM.cdsQry6.FieldByName('TINID').AsString) + ','
            + quotedstr(dblcdArticulo.text) + ','
            + ' 0.00, ' // STKINI
            + ' 0.00, ' // CANTOTING
            + ' 0.00, ' // CANTOTSAL
            + ' 0.00, ' // STKFIN
            + quotedstr(DMALM.wUsuario) + ','
            + ' trunc(sysdate)) ';
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se inscribió el archivo de SALDOS LOG319');
            exit;
         End;
      End;

   // Archivo de Saldos LOG316
      xSQL := ' Select CIAID, ALMID, ARTID, STKANO '
         + '      from LOG316 '
         + '     where CIAID=' + quotedstr(dblcCia.text)
         + '       and ALMID=' + quotedstr(xALM)
         + '       and ARTID=' + quotedstr(dblcdArticulo.text)
         + '       and STKANO=' + quotedstr(xAno);
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
      If DMALM.cdsQry.RecordCount = 0 Then
      Begin
         xSQL := 'Insert into LOG316(STKANO, CIAID, LOCID, TINID, ALMID, GRARID, FAMID, SFAMID, ARTID, ARTCONT, '
            + '                   UNMIDG, ARTFUC, ARTACTIVO, STKSACTG, ARTDES, USUARIO, FREG, HREG) '
            + 'values('
            + quotedstr(copy(xAno, 1, 4)) + ','
            + quotedstr(dblcCia.text) + ','
            + quotedstr('01') + ','
            + quotedstr(DMALM.cdsQry6.FieldByName('TINID').AsString) + ','
            + quotedstr(xALM) + ','
            + quotedstr(DMALM.cdsQry6.FieldByName('GRARID').AsString) + ','
            + quotedstr(DMALM.cdsQry6.FieldByName('FAMID').AsString) + ','
            + quotedstr(DMALM.cdsQry6.FieldByName('SFAMID').AsString) + ','
            + quotedstr(dblcdArticulo.text) + ','
            + inttostr(DMALM.cdsQry6.FieldByName('ARTCONT').AsInteger) + ','
            + quotedstr(DMALM.cdsQry6.FieldByName('UNMIDG').AsString) + ','
            + quotedstr(DMALM.cdsQry6.FieldByName('ARTFUC').AsString) + ','
            + quotedstr(DMALM.cdsQry6.FieldByName('ARTACTIVO').AsString) + ','
            + ' 0.00 ,' // ARTSACTG
            + quotedstr(DMALM.cdsQry6.FieldByName('ARTDES').AsString) + ','
            + quotedstr(DMALM.wUsuario) + ','
            + ' trunc(sysdate), '
            + ' sysdate) ';
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se inscribió el archivo de SALDOS LOG316');
            exit;
         End;
      End;

      xCantMes := 0;
      xCantIngMes := 0;
      xCantSalMes := 0;

      While (Not DMALM.cdsSQL.EOF) And (DMALM.cdsSQL.FieldByName('ALMID').AsString = xALM)
         And (DMALM.cdsSQL.FieldByName('ANOMES').AsString = xAnoMes) Do
      Begin
         If DMALM.cdsSQL.FieldByName('NISATIP').AsString = 'INGRESO' Then
         Begin
            xCantFinal := xCantFinal + DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat;
            xCantMes := xCantMes + DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat;
            xCantIngMes := xCantIngMes + DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat;
         End
         Else
         Begin
            xCantFinal := xCantFinal - DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat;
            xCantMes := xCantMes - DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat;
            xCantSalMes := xCantSalMes + DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat;
         End;
         DMALM.cdsSQL.Next;
      End;
      xCantMes := xCantInicioMes + xCantMes;

   // Archivo de Saldos LOG316
      xCampoInicial := 'STKTSG' + copy(xAnoMes, 5, 2);
      xCampoIngresos := 'STKISG' + copy(xAnoMes, 5, 2);
      xCampoSalidas := 'STKSSG' + copy(xAnoMes, 5, 2);
      If copy(xAnoMes, 5, 2) <> '12' Then
         xCampoFinal := 'STKTSG' + DMALM.StrZero(inttostr(strtoint(copy(xAnoMes, 5, 2)) + 1), 2)
      Else
         xCampoFinal := 'STKSACTG';
      xSQL := 'Update LOG316 '
         + '   set ' + xCampoInicial + '=' + floattostr(xCantInicioMes) + ','
         + xCampoIngresos + '=' + floattostr(xCantIngMes) + ','
         + xCampoSalidas + '=' + floattostr(xCantSalMes) + ',';
      If copy(xAnoMes, 5, 2) <> '12' Then
         xSQL := xSQL
            + xCampoFinal + '=' + floattostr(xCantMes) + ',';
      If xCantMes < 0 Then
         xSQL := xSQL + ' STKSACTG=0.00'
      Else
         xSQL := xSQL
            + ' STKSACTG=' + floattostr(xCantMes);
      xSQL := xSQL
         + ' where CIAID=' + quotedstr(dblcCia.text)
         + '   and ALMID=' + quotedstr(xALM)
         + '   and ARTID=' + quotedstr(dblcdArticulo.text)
         + '   and STKANO=' + quotedstr(copy(xAnoMes, 1, 4));
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se actualizó el archivo de SALDOS LOG316');
         exit;
      End;

   // Archivo de Saldos LOG319
      xSQL := 'Update LOG319 '
         + '   set STKINI=' + floattostr(xCantInicioMes) + ','
         + '       CANTOTING=' + floattostr(xCantIngMes) + ','
         + '       CANTOTSAL=' + floattostr(xCantSalMes) + ','
         + '       STKFIN=' + floattostr(xCantMes)
         + ' where CIAID=' + quotedstr(dblcCia.text)
         + '   and LOGANOMM=' + quotedstr(xAnoMes)
         + '   and ALMID=' + quotedstr(xALM)
         + '   and ARTID=' + quotedstr(dblcdArticulo.text);
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se actualizó el archivo de SALDOS LOG319');
         exit;
      End;

      xCantInicioMes := xCantMes;
   End;

// Archivo Maestro TGE205
   xSQL := 'Update TGE205 '
      + '      set ARTCNTG=' + floattostr(xCantFinal)
      + '    where CIAID=' + quotedstr(dblcCia.text)
      + '      and ARTID=' + quotedstr(dblcdArticulo.text);
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se actualizó el Maestro de Artículos TGE205');
      exit;
   End;

   If DMALM.cdsQry3.Active Then
   Begin
      DMALM.cdsSQL.Close;
      DMALM.cdsSQL.IndexFieldNames := '';

      xSQL := ' Select CIAID, ALMID, ARTID, '
         + '        sum(MOV_INGRESOS) MOV_INGRESOS, '
         + '        sum(MOV_SALIDAS) MOV_SALIDAS, '
         + '        sum(MOV_SALDOS) MOV_SALDOS, '
         + '        sum(SALD_INGRESOS) SALD_INGRESOS, '
         + '        sum(SALD_SALIDAS) SALD_SALIDAS, '
         + '        sum(SALD_SALDOS_CALC) SALD_SALDOS_CALC, '
         + '        sum(SALD_SALDOS_ARCH) SALD_SALDOS_ARCH, '
         + '        sum(SALDO_316) SALDO_316 '
         + '   from (Select CIAID, ALMID, ARTID, '
         + '                sum(case when NISATIP=''INGRESO'' then KDXCNTG else 0 end) MOV_INGRESOS, '
         + '                sum(case when NISATIP=''SALIDA'' then KDXCNTG else 0 end) MOV_SALIDAS, '
         + '                sum(case when NISATIP=''INGRESO'' then KDXCNTG else -KDXCNTG end) MOV_SALDOS, '
         + '                0 SALD_INGRESOS, '
         + '                0 SALD_SALIDAS, '
         + '                0 SALD_SALDOS_CALC, '
         + '                0 SALD_SALDOS_ARCH, '
         + '                0 SALDO_316 '
         + '           from LOG315 '
         + '          where CIAID=' + quotedstr(dblcCia.Text) + ' and NISSIT=''ACEPTADO'' '
         + '            and ALMID=' + quotedstr(DMALM.cdsQry3.FieldByName('ALMID').AsString)
         + '            and ARTID=' + quotedstr(dblcdArticulo.text)
         + '          group by CIAID, ALMID, ARTID '
         + '          union all '
         + '         Select CIAID, ALMID, ARTID, '
         + '                0 MOV_INGRESOS, '
         + '                0 MOV_SALIDAS, '
         + '                0 MOV_SALDOS, '
         + '                sum(CANTOTING) SALD_INGRESOS, '
         + '                sum(CANTOTSAL) SALD_SALIDAS, '
         + '                sum(CANTOTING-CANTOTSAL) SALD_SALDOS_CALC, '
         + '                0 SALD_SALDOS_ARCH, '
         + '                0 SALDO_316 '
         + '           from LOG319 '
         + '          where CIAID=' + quotedstr(dblcCia.Text)
         + '            and ALMID=' + quotedstr(DMALM.cdsQry3.FieldByName('ALMID').AsString)
         + '            and ARTID=' + quotedstr(dblcdArticulo.text)
         + '          group by CIAID, ALMID, ARTID '
         + '          union all '
         + '         Select CIAID, ALMID, ARTID, '
         + '                0 MOV_INGRESOS, '
         + '                0 MOV_SALIDAS, '
         + '                0 MOV_SALDOS, '
         + '                0 SALD_INGRESOS, '
         + '                0 SALD_SALIDAS, '
         + '                0 SALD_SALDOS_CALC, '
         + '                STKFIN SALD_SALDOS_ARCH, '
         + '                0 SALDO_316 '
         + '           from LOG319 '
         + '          where CIAID=' + quotedstr(dblcCia.Text)
         + '            and LOGANOMM=' + quotedstr(xAnoMes)
         + '            and ALMID=' + quotedstr(DMALM.cdsQry3.FieldByName('ALMID').AsString)
         + '            and ARTID=' + quotedstr(dblcdArticulo.text)
         + '          union all '
         + '         Select CIAID, ALMID, ARTID, '
         + '                0 MOV_INGRESOS, '
         + '                0 MOV_SALIDAS, '
         + '                0 MOV_SALDOS, '
         + '                0 SALD_INGRESOS, '
         + '                0 SALD_SALIDAS, '
         + '                0 SALD_SALDOS_CALC, '
         + '                0 SALD_SALDOS_ARCH, '
         + '                 STKSACTG SALDO_316 '
         + '           from LOG316 '
         + '          where CIAID=' + quotedstr(dblcCia.Text)
         + '            and STKANO=' + quotedstr(xAno)
         + '            and ALMID=' + quotedstr(DMALM.cdsQry3.FieldByName('ALMID').AsString)
         + '            and ARTID=' + quotedstr(dblcdArticulo.text)
         + '         ) '
         + '  group by CIAID, ALMID, ARTID ';
      DMALM.cdsQry5.Close;
      DMALM.cdsQry5.DataRequest(xSQL);
      DMALM.cdsQry5.Open;
      If DMALM.cdsQry5.RecordCount > 0 Then
      Begin
         If rgTipoLista.ItemIndex = 1 Then
         Begin
            DMALM.cdsQry3.Edit;
            DMALM.cdsQry3.FieldByName('MOV_INGRESOS').AsFloat := DMALM.cdsQry5.FieldByName('MOV_INGRESOS').AsFloat;
            DMALM.cdsQry3.FieldByName('MOV_SALIDAS').AsFloat := DMALM.cdsQry5.FieldByName('MOV_SALIDAS').AsFloat;
            DMALM.cdsQry3.FieldByName('MOV_SALDOS').AsFloat := DMALM.cdsQry5.FieldByName('MOV_SALDOS').AsFloat;
            DMALM.cdsQry3.FieldByName('SALD_INGRESOS').AsFloat := DMALM.cdsQry5.FieldByName('SALD_INGRESOS').AsFloat;
            DMALM.cdsQry3.FieldByName('SALD_SALIDAS').AsFloat := DMALM.cdsQry5.FieldByName('SALD_SALIDAS').AsFloat;
            DMALM.cdsQry3.FieldByName('SALD_SALDOS_CALC').AsFloat := DMALM.cdsQry5.FieldByName('SALD_SALDOS_CALC').AsFloat;
            DMALM.cdsQry3.FieldByName('SALD_SALDOS_ARCH').AsFloat := DMALM.cdsQry5.FieldByName('SALD_SALDOS_ARCH').AsFloat;
            DMALM.cdsQry3.FieldByName('SALDO_316').AsFloat := DMALM.cdsQry5.FieldByName('SALDO_316').AsFloat;
            DMALM.cdsQry3.Post;
         End;
      End;

      ShowMessage('Método 2 ok');
   End;
End;

Procedure TFProcesos.tshMovimEnter(Sender: TObject);
Begin
   xDesdeLista := False;
End;

Procedure TFProcesos.bbtnBuscaArtxDescrClick(Sender: TObject);
Var
   xListaArticulos: String;
Begin
   xSQL := 'Select TGE205.ARTID, TGE205.ARTDES, 0.00 SALDO '
      + '     from TGE205 '
      + '    where TGE205.CIAID=' + quotedstr(dblcCia.Text)
      + '      and TGE205.ARTDES like (' + quotedstr('%' + edtArtxDescr.text + '%') + ')';
   DMALM.cdsQry7.Close;
   DMALM.cdsQry7.DataRequest(xSQL);
   DMALM.cdsQry7.Open;
   If DMALM.cdsQry7.RecordCount = 0 Then
   Begin
      ShowMessage('No se han encontrado artículos con la descripción indicada');
      exit;
   End;
   xListaArticulos := '';
   DMALM.cdsQry7.First;
   While Not DMALM.cdsQry7.EOF Do
   Begin
      xSQL := 'Select max(LOGANOMM) LOGANOMM '
         + '     from LOG319 '
         + '    where CIAID=' + quotedstr(dblcCia.Text)
         + '      and ALMID=''95'' '
         + '      and ARTID=' + quotedstr(DMALM.cdsQry7.FieldByName('ARTID').AsString)
         + '      and LOGANOMM<=''201708'' ';
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
      If DMALM.cdsQry.RecordCount > 0 Then
      Begin
         xSQL := 'Select STKFIN '
            + '     from LOG319 '
            + '    where CIAID=' + quotedstr(dblcCia.Text)
            + '      and LOGANOMM=' + quotedstr(DMALM.cdsQry.FieldByName('LOGANOMM').AsString)
            + '      and ALMID=''95'' '
            + '      and ARTID=' + quotedstr(DMALM.cdsQry7.FieldByName('ARTID').AsString);
         DMALM.cdsQry.Close;
         DMALM.cdsQry.DataRequest(xSQL);
         DMALM.cdsQry.Open;

         DMALM.cdsQry7.Edit;
         DMALM.cdsQry7.FieldByName('SALDO').AsFloat := DMALM.cdsQry.FieldByName('STKFIN').AsFloat;
         DMALM.cdsQry7.Post;
      End;
      If xListaArticulos = '' Then
         xListaArticulos := quotedstr(DMALM.cdsQry7.FieldByName('ARTID').AsString)
      Else
         xListaArticulos := xListaArticulos + ',' + quotedstr(DMALM.cdsQry7.FieldByName('ARTID').AsString);

      DMALM.cdsQry7.Next;
   End;
   dbgArtxDescr.DataSource := DMALM.dsQry7;
   dbgArtxDescr.Selected.Clear;
   dbgArtxDescr.Selected.Add('ARTID'#9'10'#9'Artículo');
   dbgArtxDescr.Selected.Add('ARTDES'#9'60'#9'Descripción');
   dbgArtxDescr.Selected.Add('SALDO'#9'12'#9'Saldo');
   dbgArtxDescr.ApplySelected;

// Ingresos
   xSQL := 'Select A.ALMID, A.NISAFREG, A.ARTID, B.ARTDES, A.TRIID, A.KDXCNTG '
      + '     from LOG315 A, TGE205 B'
      + '    where A.CIAID=' + quotedstr(dblcCia.Text)
      + '      and A.ALMID=''95'' and A.NISATIP=''INGRESO'' '
      + '      and A.ARTID in (' + xListaArticulos + ')'
      + '      and B.CIAID=A.CIAID and B.ARTID=A.ARTID '
      + '    order by A.NISAFREG, A.ARTID';
   DMALM.cdsQry9.Close;
   DMALM.cdsQry9.DataRequest(xSQL);
   DMALM.cdsQry9.Open;
   dbgIngresos.datasource := DMALM.dsQry9;
   dbgIngresos.Selected.Clear;
   dbgIngresos.Selected.Add('ALMID'#9'10'#9'Almacén');
   dbgIngresos.Selected.Add('NISAFREG'#9'10'#9'Fecha');
   dbgIngresos.Selected.Add('ARTID'#9'10'#9'Artículo');
   dbgIngresos.Selected.Add('ARTDES'#9'40'#9'Descripción');
   dbgIngresos.Selected.Add('TRIID'#9'10'#9'Transacción');
   dbgIngresos.Selected.Add('KDXCNTG'#9'12'#9'Cantidad');
   dbgIngresos.ApplySelected;
End;

Procedure TFProcesos.dbgArtxDescrDblClick(Sender: TObject);
Var
   xSaldo, xNum: Integer;
   xAlmAnt: String;
Begin
   edtArt2.Text := DMALM.cdsQry7.FieldByName('ARTID').AsString;
   edtArtDesc2.Text := DMALM.cdsQry7.FieldByName('ARTDES').AsString;

   xSQL := ' Select 0 NUMORDEN, CIAID, ALMID, ALMID ALMID2, TRIID, ARTID, NISAFREG, NISATIP, NISAID, '
      + '        KDXCNTG, ARTPCG, ARTMORIPCG, 0 SALDO, ''N'' CAMBIADO '
      + '   from LOG315 '
      + '  where CIAID=' + quotedstr(dblcCia.Text)
      + '    and ARTID=' + quotedstr(DMALM.cdsQry7.FieldByName('ARTID').AsString)
      + '    and NISSIT=''ACEPTADO'' '
      + '  order by ALMID, NISAFREG, NISATIP';
   DMALM.cdsQry8.Close;
   DMALM.cdsQry8.DataRequest(xSQL);
   DMALM.cdsQry8.Open;
   DMALM.cdsQry8.IndexFieldNames := 'ALMID; NISAFREG; NISATIP';
   DMALM.cdsQry8.First;
//   RecalculaSaldosMov;
   xAlmAnt := 'XX';
   xNum := 0;
   DMALM.cdsQry8.First;
   While Not DMALM.cdsQry8.EOF Do
   Begin
      xNum := xNum + 1;
      If DMALM.cdsQry8.FieldByName('ALMID').AsString <> xAlmAnt Then
         xSaldo := 0;
      If DMALM.cdsQry8.FieldByName('NISATIP').AsString = 'INGRESO' Then
         xSaldo := xSaldo + DMALM.cdsQry8.FieldByName('KDXCNTG').AsInteger
      Else
         xSaldo := xSaldo - DMALM.cdsQry8.FieldByName('KDXCNTG').AsInteger;
      DMALM.cdsQry8.Edit;
      DMALM.cdsQry8.FieldByName('NUMORDEN').AsInteger := xNum;
      DMALM.cdsQry8.FieldByName('SALDO').AsInteger := xSaldo;
      DMALM.cdsQry8.Post;
      xAlmAnt := DMALM.cdsQry8.FieldByName('ALMID').AsString;
      DMALM.cdsQry8.Next;
   End;
   DMALM.cdsQry8.First;

//
   dbgKardex2.DataSource := DMALM.dsQry8;
   dbgKardex2.Selected.Clear;
   dbgKardex2.Selected.Add('CIAID'#9'3'#9'Cía');
   dbgKardex2.Selected.Add('ALMID'#9'3'#9'Alm');
   dbgKardex2.Selected.Add('TRIID'#9'3'#9'Trans');
   dbgKardex2.Selected.Add('NISAFREG'#9'10'#9'Fecha');
   dbgKardex2.Selected.Add('NISATIP'#9'12'#9'Tipo');
   dbgKardex2.Selected.Add('NISAID'#9'12'#9'Nro.Nota');
   dbgKardex2.Selected.Add('KDXCNTG'#9'12'#9'Cantidad');
   dbgKardex2.Selected.Add('SALDO'#9'12'#9'Saldo');
   dbgKardex2.Selected.Add('ARTPCG'#9'12'#9'Precio~Promedio');
   dbgKardex2.Selected.Add('ARTMORIPCG'#9'12'#9'Precio en~Moneda Orig');
   dbgKardex2.Selected.Add('CAMBIADO'#9'5'#9'Cambiado');
   dbgKardex2.ApplySelected;

   edtTipDocVta.Text := copy(DMALM.cdsQry2.FieldByName('NISAID').AsString, 1, 2);
   edtSerieDocVta.Text := copy(DMALM.cdsQry2.FieldByName('NISAID').AsString, 3, 4);
   edtNroFacVta.Text := trim(copy(DMALM.cdsQry2.FieldByName('NISAID').AsString, 7, 10));
   edtAlmVta.Text := DMALM.cdsQry2.FieldByName('ALMID').AsString;
   edtTipoNotaVta.Text := DMALM.cdsQry2.FieldByName('NISATIP').AsString;
   edtNroNotaVta.Text := DMALM.cdsQry2.FieldByName('NISAID').AsString;

// Transferencias
   xSQL := ' Select 0 NUMORDEN, CIAID, ALMID, ALMID ALMID2, TRIID, ARTID, NISAFREG, NISATIP, NISAID, '
      + '        KDXCNTG, ARTPCG, ARTMORIPCG, 0 SALDO, ''N'' CAMBIADO '
      + '   from LOG315 '
      + '  where CIAID=' + quotedstr(dblcCia.Text)
      + '    and ARTID=' + quotedstr(DMALM.cdsQry7.FieldByName('ARTID').AsString)
      + '    and NISSIT=''ACEPTADO'' '
      + '    and TRIID in (''06'',''07'') '
      + '  order by NISAFREG, NISATIP, ALMID';
   DMALM.cdsQry10.Close;
   DMALM.cdsQry10.DataRequest(xSQL);
   DMALM.cdsQry10.Open;
   DMALM.cdsQry10.IndexFieldNames := 'NISAFREG; NISATIP; ALMID';
   DMALM.cdsQry10.First;
   dbgTransferencias.DataSource := DMALM.dsQry10;
   dbgTransferencias.Selected.Clear;
   dbgTransferencias.Selected.Add('CIAID'#9'3'#9'Cía');
   dbgTransferencias.Selected.Add('ALMID'#9'3'#9'Alm');
   dbgTransferencias.Selected.Add('TRIID'#9'3'#9'Trans');
   dbgTransferencias.Selected.Add('NISAFREG'#9'10'#9'Fecha');
   dbgTransferencias.Selected.Add('NISATIP'#9'12'#9'Tipo');
   dbgTransferencias.Selected.Add('NISAID'#9'12'#9'Nro.Nota');
   dbgTransferencias.Selected.Add('KDXCNTG'#9'12'#9'Cantidad');
   dbgTransferencias.Selected.Add('SALDO'#9'12'#9'Saldo');
   dbgTransferencias.Selected.Add('ARTPCG'#9'12'#9'Precio~Promedio');
   dbgTransferencias.Selected.Add('ARTMORIPCG'#9'12'#9'Precio en~Moneda Orig');
   dbgTransferencias.Selected.Add('CAMBIADO'#9'5'#9'Cambiado');
   dbgTransferencias.ApplySelected;


End;

Procedure TFProcesos.SpeedButton1Click(Sender: TObject);
Begin
   DMALM.cdsQry8.First;
   While Not DMALM.cdsQry8.EOF Do
   Begin
      If DMALM.cdsQry8.FieldByName('SALDO').AsInteger < 0 Then
         break;
      DMALM.cdsQry8.Next;
   End;
End;

Procedure TFProcesos.dbgKardex2CalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   If DMALM.cdsQry8.FieldByName('SALDO').AsInteger < 0 Then
   Begin
      AFont.Style := [fsBold];
      ABrush.Color := clRed;
   End;
End;

Procedure TFProcesos.bbtnCambiaCodArtClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;

   DMALM.DCOM1.AppServer.IniciaTransaccion;
// Actualiza Movimiento de Almacén
   xSQL := 'Update LOG315 '
      + '      Set ARTID=' + quotedstr(edtArt2.Text)
      + '    where CIAID=' + quotedstr(dblcCia.Text)
      + '      and ALMID=' + quotedstr(edtAlmVta.Text)
      + '      and ARTID=' + quotedstr(dblcdArticulo.Text)
      + '      and NISATIP=' + quotedstr(edtTipoNotaVta.Text)
      + '      and NISAID=' + quotedstr(edtNroNotaVta.Text);
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al actualizar el archivo de Notas de I/S del Artículo');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

// Actualiza Movimiento de Ventas
   xSQL := 'Update FAC306 '
      + '      Set ARTID=' + quotedstr(edtArt2.Text)
      + '    where CIAID=' + quotedstr(dblcCia.Text)
      + '      and DOCID=' + quotedstr(edtTipDocVta.Text)
      + '      and FACSERIE=' + quotedstr(edtSerieDocVta.Text)
      + '      and NFAC=' + quotedstr(edtNroFacVta.Text)
      + '      and ARTID=' + quotedstr(dblcdArticulo.Text);
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al actualizar el archivo de Boletas de Venta del Artículo');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   DMALM.DCOM1.AppServer.GrabaTransaccion;

   xSQL := 'BEGIN DB2ADMIN.SP_ALM_REGENERA_STOCK('
      + quotedstr(dblcCia.Text) + ','
      + quotedstr(dblcdArticulo.Text) + '); END;';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al Actualizar los Saldos del Artículo ' + dblcdArticulo.Text);
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   xSQL := 'BEGIN DB2ADMIN.SP_ALM_REGENERA_STOCK('
      + quotedstr(dblcCia.Text) + ','
      + quotedstr(edtArt2.Text) + '); END;';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al Actualizar los Saldos del Artículo ' + edtArt2.Text);
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   Screen.Cursor := crDefault;
   ShowMessage('Ventas y Movimientos de Almacén actualizas satisfactoriamente');

End;

Procedure TFProcesos.FormShow(Sender: TObject);
Begin
   Height := 458;
   Width := 795;
   ClientHeight := 458;
   ClientWidth := 795;
   pnlGeneraTransf.Visible := False;
End;

Procedure TFProcesos.bbtnGeneraTransfClick(Sender: TObject);
Begin
   pnlGeneraTransf.Visible := True;
   pnlGeneraTransf.Top := 136;
   pnlGeneraTransf.Left := 176;
   pnlGeneraTransf.Height := 257;
   pnlGeneraTransf.Width := 385;

End;

Procedure TFProcesos.BitBtn3Click(Sender: TObject);
Begin
   pnlGeneraTransf.Visible := False;
End;

Procedure TFProcesos.BitBtn2Click(Sender: TObject);
var
   xNroNotaSal, xNroNotaIng : String;
   xTCambio : double;
   xNISAANO, xNISAMES, xNISADIA, xNISATRIM, xNISASEM, xNISAANOMES, xNISASS, xNISAAATRI, xNISAAASEM, xNISAAASS : String;
Begin
// Tipo de Cambio
   xSQL := 'Select TCAMVBC from TGE107 '
      + '    Where FECHA='+quotedstr(datetostr(dtpFechaTransf.date));
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;
   If DMALM.cdsQry.recordcount=0 Then
   Begin
      xSQL := 'Select TCAMVBC '
         + '     from TGE107 '
         + '    where to_char(FECHA,''YYYYMM'') >= to_char('+quotedstr(datetostr(dtpFechaTransf.date))+',''YYYYMM'') '
         + '      and ROWNUM=1 ';
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
   End;
   xTCambio := DMALM.cdsQry.FieldByName('TCAMVBC').AsFloat;

   xNISAANO:= ''; xNISAMES:= ''; xNISADIA:= ''; xNISATRIM:= ''; xNISASEM:= ''; xNISAANOMES:= '';
   xNISASS:= ''; xNISAAATRI:= ''; xNISAAASEM:= ''; xNISAAASS:= '';
   xSQL := 'Select * from TGE114 '
      + '    Where FECHA='+quotedstr(datetostr(dtpFechaTransf.date));
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;
   If DMALM.cdsQry.RecordCount>0 then
   Begin
      xNISAANO:= DMALM.cdsQry.FieldByName('FECANO').AsString;
      xNISAMES:= DMALM.cdsQry.FieldByName('FECMES').AsString;
      xNISADIA:= DMALM.cdsQry.FieldByName('FECDIA').AsString;
      xNISATRIM:= DMALM.cdsQry.FieldByName('FECTRIM').AsString;
      xNISASEM:= DMALM.cdsQry.FieldByName('FECSEM').AsString;
      xNISAANOMES:= DMALM.cdsQry.FieldByName('FECANO').AsString+DMALM.cdsQry.FieldByName('FECMES').AsString;
      xNISASS:= DMALM.cdsQry.FieldByName('FECSS').AsString;
      xNISAAATRI:= DMALM.cdsQry.FieldByName('FECAATRI').AsString;
      xNISAAASEM:= DMALM.cdsQry.FieldByName('FECAASEM').AsString;
      xNISAAASS:= DMALM.cdsQry.FieldByName('FECAASS').AsString;
   End;

// Número Salida por Transferencia
   xSQL := 'select cast(cast(max(NISAID) as integer)+1 as varchar2(8)) NRONOTA '
      + '     from LOG314 '
      + '    where CIAID='+quotedstr(dblcCia.Text)
      + '      and ALMID='+quotedstr(dbeAlmOriTransf.Text)
      + '      and NISATIP=''SALIDA'' and NISAID is not null '
      + '      and length(NISAID)=8';
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;
   If DMALM.cdsQry.recordcount=0 Then
      xNroNotaSal := '00000001'
   Else
      If strtoint(DMALM.cdsQry.FieldByName('NRONOTA').AsString)=0 Then
         xNroNotaSal := '00000001'
      Else
         xNroNotaSal := DMALM.cdsQry.FieldByName('NRONOTA').AsString;

// Número Ingreso por Transferencia
   xSQL := 'select cast(cast(max(NISAID) as integer)+1 as varchar2(8)) NRONOTA '
      + '     from LOG314 '
      + '    where CIAID='+quotedstr(dblcCia.Text)
      + '      and ALMID='+quotedstr(dbeAlmDestTransf.Text)
      + '      and NISATIP=''INGRESO'' and NISAID is not null '
      + '      and length(NISAID)=8';
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;
   If DMALM.cdsQry.recordcount=0 Then
      xNroNotaIng := '00000001'
   Else
      If strtoint(DMALM.cdsQry.FieldByName('NRONOTA').AsString)=0 Then
         xNroNotaIng := '00000001'
      Else
         xNroNotaIng := DMALM.cdsQry.FieldByName('NRONOTA').AsString;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Cabecera de Nota de Salida por Transferencia
   xSQL :=  'Insert into LOG314(CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, CCOSID, TRIID, '
      + '                       NISAFREG, NISSIT, DOCID, NISANDOC, NISAFDOC, NISASOLIC, NISASERIE, LOCORIID, '
      + '                       ALMORIID, NISAORIID, NISANOMM, NISATCAMB, TINORIID, NISAOBS, SITUACION, '
      + '                       SITFREG, SITHREG, NISAUSER, NISAHREG, NISAANO, NISAMES, NISADIA, NISATRIM, '
      + '                       NISASEM, NISAANOMES, NISASS, NISAAATRI, NISAAASEM, NISAAASS, TDAORIID) '
      + '    Select '+quotedstr(dblcCia.Text)+' CIAID, ''01'' LOCID, ''26'' TINID, '+quotedstr(dbeAlmOriTransf.Text)+' ALMID, ''03'' TDAID, '
      +               quotedstr(xNroNotaSal)+' NISAID, ''SALIDA'' NISATIP, ''6900'' CCOSID, ''06'' TRIID, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') NISAFREG, '
      + '             ''ACEPTADO'' NISSIT, ''46'' DOCID, to_char(to_date('+quotedstr(datetostr(dtpFechaTransf.date))+'),''YYYYMMDD'') NISANDOC, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') NISAFDOC, ''FONDO EDITORIAL'' NISASOLIC, ''000'' NISASRIE, '
      + '             ''01'' LOCORIID, '+quotedstr(dbeAlmDestTransf.Text)+' ALMORIID, '
      +               quotedstr(xNroNotaSal)+' NISAORIID,'
      + '             to_char(to_date('+quotedstr(datetostr(dtpFechaTransf.date))+'),''YYYYMM'') NISANOMM, '+floattostr(xTCambio)+'NISATCAMB, '
      + '             ''26'' TINORIID, ''TRANSFERENCIA A ALMACÉN FONDO EDITORIAL'' NISAOBS, ''ATENDIDO'' SITUACION, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') SITFREG, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') SITHREG, '
      + '             ''EBULNES'' NISAUSER, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') NISAHREG, '
      +               quotedstr(xNISAANO)+', '+quotedstr(xNISAMES)+', '+quotedstr(xNISADIA)+', '+quotedstr(xNISATRIM)+', '
      +               quotedstr(xNISASEM)+', '+quotedstr(xNISAANOMES)+', '+quotedstr(xNISASS)+', '+quotedstr(xNISAAATRI)+', '
      +               quotedstr(xNISAAASEM)+', '+quotedstr(xNISAAASS)+', '+quotedstr('01')
      + '      from DUAL ';
   DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

// Detalle de Nota de Salida por Transferencia
   xSQL := 'Insert into LOG315(CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, KDXID, NISSIT, DOCID, TRIID, ARTID, ARTPCU, ARTPCG, '
      + '                      ARTPVU, ARTPVG, KDXCNTG, KDXCNTU, KDXPEDIDOG, KDXPEDIDOU, KDXSALDOG, KDXSALDOU, ARTCONT, UNMIDG, '
      + '                      GRARID, ARTSPRO, TMONID, ARTCRGO, ARTACTIVO, CCOSID, NISASOLIC, NISAFREG, NISANDOC, NISAFDOC, '
      + '                      KDXUSER, KDXFREG, KDXHREG, KDXANO, KDXMM, KDXDD, KDXTRI, KDXSEM, KDXSS, KDXANOMM, KDXAATRI, KDXAASEM, '
      + '                      KDXAASS, ARTDES, FAMID, SFAMID, CUENTA2ID, ARTMORIPCG, ARTMORIPCU, TCAMB, SITUACION, ARTTOTALG, '
      + '                      ARTTOTALU, ARTTOTAL, COSREPO, COSARTFAC, IMPNOTCRE) '
      + '    Select '+quotedstr(dblcCia.Text)+' CIAID, ''01'' LOCID, ''26'' TINID, '+quotedstr(dbeAlmOriTransf.Text)+' ALMID, ''03'' TDAID, '
      +               quotedstr(xNroNotaSal)+' NISAID, ''SALIDA'' NISATIP, ''001'' KDXID, ''ACEPTADO'' NISSIT, ''46'' DOCID, ''06'' TRIID, '
      +               quotedstr(dblcdArticulo.Text)+ 'ARTID, 0.000 ARTPCU, 0.00 ARTPCG, 0.00 ARTPVU, 0.00 ARTPVG,'
      +               dbeCantxTransf.Text+' KDXCNTG, 0 KDXCNTU, 0 KDXPEDIDOG, 0 KDXPEDIDOU, 0 KDXSALDOG, 0 KDXSALDOU, 1 ARTCONT, ''UND'' UNMIDG, '

      +               quotedstr(DMALM.cdsQry6.FieldByName('GRARID').AsString)+' GRARID, ''NACIONAL'' ARTSPRO, ''N'' TMONID, 0 ARTCRGO, '
      + '             ''STOCK'' ARTACTIVO, ''6900'' CCOSID, ''FONDO EDITORIAL'' NISASOLIC, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') NISAFREG, ''00000001'' NISANDOC, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') NISAFDOC, '

      + '             ''EBULNES'' KDXUSER, to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') KDXFREG,'
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') KDXHREG, '
      +               quotedstr(xNISAANO)+' KDXANO, '
      +               quotedstr(xNISAMES)+' KDXMM, '
      +               quotedstr(xNISADIA)+' KDXDD, '
      +               quotedstr(xNISATRIM)+' KDXTRI, '
      +               quotedstr(xNISASEM)+' KDXSEM, '
      +               quotedstr(xNISASS)+' KDXSS, '
      +               quotedstr(xNISAANOMES)+' KDXANOMM, '
      +               quotedstr(xNISAAATRI)+' KDXAATRI, '
      +               quotedstr(xNISAAASEM)+' KDXAASEM, '
      +               quotedstr(xNISAAASS)+' KDXAASS, '

      +               quotedstr(edtArtDescrip.Text)+' ARTDES, '
      +               quotedstr(DMALM.cdsQry6.FieldByName('FAMID').AsString)+' FAMID, '
      +               quotedstr(DMALM.cdsQry6.FieldByName('SFAMID').AsString)+' SFAMID, '
      +               quotedstr('61101')+' CUENTA2ID, '
      + '             0.00  ARTMORIPCG, 0.00 ARTMORIPCU,'+floattostr(xTCambio)+' TCAMB, '
      + '             ''ATENDIDO'' SITUACION, 0.00 ARTTOTALG, '
      + '             0.00 ARTTOTALU, 0.00 ARTTOTAL, 0.00 COSREPO, 0.00 COSARTFAC, 0.00 IMPNOTCRE '
      + '      from DUAL ';
   DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Cabecera de Nota de Ingreso por Transferencia
   xSQL :=  'Insert into LOG314(CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, CCOSID, TRIID, '
      + '                       NISAFREG, NISSIT, DOCID, NISANDOC, NISAFDOC, LOCORIID, '
      + '                       ALMORIID, NISAORIID, NISANOMM, NISATCAMB, TINORIID, NISAOBS, SITUACION, '
      + '                       SITFREG, SITHREG, NISAUSER, NISAHREG, NISAANO, NISAMES, NISADIA, NISATRIM, '
      + '                       NISASEM, NISAANOMES, NISASS, NISAAATRI, NISAAASEM, NISAAASS, TDAORIID) '
      + '    Select '+quotedstr(dblcCia.Text)+' CIAID, ''01'' LOCID, ''26'' TINID, '+quotedstr(dbeAlmDestTransf.Text)+' ALMID, ''01'' TDAID, '
      +               quotedstr(xNroNotaIng)+' NISAID, ''INGRESO'' NISATIP, ''6900'' CCOSID, ''07'' TRIID, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') NISAFREG, '
      + '             ''ACEPTADO'' NISSIT, ''46'' DOCID, '+quotedstr(xNroNotaSal)+' NISANDOC, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') NISAFDOC, '
      + '             ''01'' LOCORIID, '+quotedstr(dbeAlmOriTransf.Text)+' ALMORIID, '
      +               quotedstr(xNroNotaSal)+' NISAORIID,'
      + '             to_char(to_date('+quotedstr(datetostr(dtpFechaTransf.date))+'),''YYYYMM'') NISANOMM, '+floattostr(xTCambio)+'NISATCAMB, '
      + '             ''26'' TINORIID, ''TRANSFERENCIA A ALMACÉN FONDO EDITORIAL'' NISAOBS, ''ATENDIDO'' SITUACION, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') SITFREG, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') SITHREG, '
      + '             ''EBULNES'' NISAUSER, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') NISAHREG, '
      +               quotedstr(xNISAANO)+', '+quotedstr(xNISAMES)+', '+quotedstr(xNISADIA)+', '+quotedstr(xNISATRIM)+', '
      +               quotedstr(xNISASEM)+', '+quotedstr(xNISAANOMES)+', '+quotedstr(xNISASS)+', '+quotedstr(xNISAAATRI)+', '
      +               quotedstr(xNISAAASEM)+', '+quotedstr(xNISAAASS)+', '+quotedstr('01')
      + '      from DUAL ';
   DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

// Detalle de Nota de Ingreso por Transferencia
   xSQL := 'Insert into LOG315(CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, KDXID, NISSIT, DOCID, TRIID, ARTID, ARTPCU, ARTPCG, '
      + '                      ARTPVU, ARTPVG, KDXCNTG, KDXCNTU, KDXPEDIDOG, KDXPEDIDOU, KDXSALDOG, KDXSALDOU, ARTCONT, UNMIDG, '
      + '                      GRARID, ARTSPRO, TMONID, ARTCRGO, ARTACTIVO, CCOSID, NISAFREG, NISANDOC, NISAFDOC, '
      + '                      KDXUSER, KDXFREG, KDXHREG, KDXANO, KDXMM, KDXDD, KDXTRI, KDXSEM, KDXSS, KDXANOMM, KDXAATRI, '
      + '                      KDXAASEM, KDXAASS, ARTDES, FAMID, SFAMID, ARTMORIPCG, ARTMORIPCU, TCAMB, ARTTOTALG, ARTTOTALU, ARTTOTAL, '
      + '                      COSREPO, COSARTFAC, IMPNOTCRE) '
      + '    Select '+quotedstr(dblcCia.Text)+' CIAID, ''01'' LOCID, ''26'' TINID, '+quotedstr(dbeAlmDestTransf.Text)+' ALMID, ''01'' TDAID, '
      +               quotedstr(xNroNotaIng)+' NISAID, ''INGRESO'' NISATIP, ''001'' KDXID, ''ACEPTADO'' NISSIT, ''46'' DOCID, ''07'' TRIID, '
      +               quotedstr(dblcdArticulo.Text)+ 'ARTID, 0.000 ARTPCU, 0.00 ARTPCG, 0.00 ARTPVU, 0.00 ARTPVG,'
      +               dbeCantxTransf.Text+' KDXCNTG, 0 KDXCNTU, 0 KDXPEDIDOG, 0 KDXPEDIDOU, 0 KDXSALDOG, 0 KDXSALDOU, 1 ARTCONT, ''UND'' UNMIDG, '
      +               quotedstr(DMALM.cdsQry6.FieldByName('GRARID').AsString)+' GRARID, ''NACIONAL'' ARTSPRO, ''N'' TMONID, 0 ARTCRGO, '
      + '             ''STOCK'' ARTACTIVO, ''6900'' CCOSID, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') NISAFREG, '+quotedstr(xNroNotaSal)+' NISANDOC, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') NISAFDOC, '
      + '             ''EBULNES'' KDXUSER, '
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') KDXFREG,'
      + '             to_date('+quotedstr(datetostr(dtpFechaTransf.date))+') KDXHREG, '
      +               quotedstr(xNISAANO)+' KDXANO, '
      +               quotedstr(xNISAMES)+' KDXMM, '
      +               quotedstr(xNISADIA)+' KDXDD, '
      +               quotedstr(xNISATRIM)+' KDXTRI, '
      +               quotedstr(xNISASEM)+' KDXSEM, '
      +               quotedstr(xNISASS)+' KDXSS, '
      +               quotedstr(xNISAANOMES)+' KDXANOMM, '
      +               quotedstr(xNISAAATRI)+' KDXAATRI, '
      +               quotedstr(xNISAAASEM)+' KDXAASEM, '
      +               quotedstr(xNISAAASS)+' KDXAASS, '
      +               quotedstr(edtArtDescrip.Text)+' ARTDES, '
      +               quotedstr(DMALM.cdsQry6.FieldByName('FAMID').AsString)+' FAMID, '
      +               quotedstr(DMALM.cdsQry6.FieldByName('SFAMID').AsString)+' SFAMID, '
      + '             0.00  ARTMORIPCG, 0.00 ARTMORIPCU,'+floattostr(xTCambio)+' TCAMB, '
      + '             0.00 ARTTOTALG, '
      + '             0.00 ARTTOTALU, 0.00 ARTTOTAL, 0.00 COSREPO, 0.00 COSARTFAC, 0.00 IMPNOTCRE '
      + '      from DUAL ';
   DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

   bbtnMetodo2Click(Sender);
   ShowMessage('ok');

End;

End.

