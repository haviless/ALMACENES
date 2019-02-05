Unit ALM320;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Wwdbdlg, Mask, wwdbedit, StdCtrls, wwdblook, ExtCtrls, Grids, Wwdbigrd,
   Wwdbgrid, DB, DBTables, Buttons, GridControl, dbclient, MsgDlgs;

Type
   TFRqsAuto = Class(TForm)
      pnlCab: TPanel;
      lblCIA: TLabel;
      dblcCIA: TwwDBLookupCombo;
      Label1: TLabel;
      dblcdCCos: TwwDBLookupComboDlg;
      dblcTRqs: TwwDBLookupCombo;
      Label8: TLabel;
      Z2bbtnArtPOk: TBitBtn;
      Z2bbtnAcepta: TBitBtn;
      pnlGrids: TPanel;
      dbgArtPend: TwwDBGrid;
      dbgArtNIS: TwwDBGrid;
      Z2bbtnRegresa: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      lblPrioridad: TLabel;
      dblcPRIO: TwwDBLookupCombo;
      Label9: TLabel;
      dblcLOC: TwwDBLookupCombo;
      dblcALM: TwwDBLookupCombo;
      Label10: TLabel;
      Label2: TLabel;
      dblcTIN: TwwDBLookupCombo;
      dbeCIA: TEdit;
      dbeTIN: TEdit;
      dbeALM: TEdit;
      dbeTRqs: TEdit;
      dbeCCostos: TEdit;
      dbePRIO: TEdit;
      dbeLOC: TEdit;
      dblcTRqsn: TwwDBLookupCombo;
      edtTRqs: TEdit;
      lblTipPre: TLabel;
      dblcTipPre: TwwDBLookupCombo;
      dbeTipPre: TwwDBEdit;
      lblPresu: TLabel;
      dblcdPresup: TwwDBLookupComboDlg;
      edtPresup: TEdit;
      pnlActualizando: TPanel;
      lblActualizando: TLabel;
      Procedure dblcExist(Sender: TObject);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure Z2bbtnArtPOkClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure Z2bbtnRegresaClick(Sender: TObject);
      Procedure dbgArtPendCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure dbgArtNISCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure dbgArtNISDblClick(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure dblcTRqsExit(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcLOCEnter(Sender: TObject);
      Procedure dblcTINEnter(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
      Procedure dblcALMEnter(Sender: TObject);
      Procedure dblcALMExit(Sender: TObject);
      Procedure dblcdCCosExit(Sender: TObject);
      Procedure dblcPRIOExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcTRqsnExit(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcTipPreExit(Sender: TObject);
      Procedure dblcdPresupExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      sSQL, sCIA, sTRQ, sCCO, sPIO, sALM, sTIN, sLOC: String;
      xPresu: String;
      Procedure dcCIA;
      Procedure dcALM;
      Procedure dcLOC;
      Procedure dcTRQ;
      Procedure dcCCO;
      Procedure dcPRI;
   End;

Var
   FRqsAuto: TFRqsAuto;
   wAcepto: Boolean;
   wNReq: String;

Implementation

Uses oaIN3000, ALMDM1;

{$R *.DFM}

Procedure TFRqsAuto.dblcExist(Sender: TObject);
Var
   bRq: Boolean;
Begin
   If TwwDBCustomLookupCombo(Sender).DataSource <> Nil Then
      bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;

   If (bRq) And (trim(TwwDBCustomLookupCombo(Sender).Text) = '') Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRqsAuto.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRqsAuto.Z2bbtnArtPOkClick(Sender: TObject);
Begin
   sCIA := trim(dbeCIA.Text);
   sLOC := trim(dbeLOC.Text);
   sTIN := trim(dbeTIN.Text);
   sALM := trim(dbeALM.Text);
   sTRQ := trim(dblcTRqs.Text);
   sCCO := trim(dbeCCostos.Text);
   sPIO := trim(dbePRIO.Text);

   If sCIA = '' Then
   Begin
      ErrorMsg('Error', ' Debe ingresar la Compañía...');
      Exit;
   End;
   If sTRQ = '' Then
   Begin
      ErrorMsg('Error', ' Debe ingresar el Tipo de Requisición... ');
      Exit;
   End;

  {If wActuaPresu then
  begin
   if xPresu = 'N' then
    begin
   ErrorMsg('Error',' Centro de Costo No Tiene Partida Presupuestal... ');
   Exit;
    end;
  end;}

   If sCCO = '' Then
   Begin
      ErrorMsg('Error', ' Debe ingresar el Centro de Costos... ');
      Exit;
   End;
   If sPIO = '' Then
   Begin
      ErrorMsg('Error', ' Debe ingresar la Prioridad... ');
      Exit;
   End;
   If sLOC = '' Then
   Begin
      ErrorMsg('Error', ' Debe ingresar la Localidad... ');
      Exit;
   End;
   If sALM = '' Then
   Begin
      ErrorMsg('Error', ' Debe ingresar el Almacén... ');
      Exit;
   End;

   Z2bbtnArtPOk.Enabled := False;
   pnlCab.Enabled := False;
   pnlGrids.Enabled := True;
   sSQL := 'SELECT CIAID, ARTID, SUM(KDXPEDIDOG - KDXCNTG) CNTG, SUM(KDXPEDIDOU - KDXCNTU) CNTU, ' +
           'ARTDES, B.UNMDES, '''' FLAGVAR, UNMIDG, UNMIDU ' +
           'FROM LOG315, TGE130 B ' +
           'WHERE CIAID=''' + dblcCIA.Text + ''' ' +
           'AND LOCID=''' + dblcLOC.Text + ''' ' +
           'AND TINID=''' + dblcTIN.Text + ''' ' +
           'AND ALMID=''' + dblcALM.Text + ''' ' +
           'AND NISATIP=''SALIDA'' ' +
           'AND (NISAATERQS IS NULL OR  NISAATERQS <> ''S'') ' +
           'AND (KDXPEDIDOG - KDXCNTG > 0 OR  KDXPEDIDOU - KDXCNTU > 0) ' +
           'AND LOG315.UNMIDG = B.UNMID(+) ' +
           'GROUP BY  CIAID, ARTID,  ARTDES, B.UNMDES, UNMIDG, UNMIDU ' +
           'ORDER BY ARTID';
        DMALM.cdsAPNIS.Close;
        DMALM.cdsAPNIS.DataRequest(sSQL);
        DMALM.cdsAPNIS.Open;
        sSQL := 'SELECT LOG315.*, (KDXPEDIDOG-KDXCNTG) AS SALDO ' +
           'FROM LOG315 ' +
           'WHERE CIAID=''' + dblcCIA.Text + ''' ' +
           'AND LOCID=''' + dblcLOC.Text + ''' ' +
      'AND TINID=''' + dblcTIN.Text + ''' ' +
      'AND ALMID=''' + dblcALM.Text + ''' ' +
      '  AND (NISAATERQS IS NULL OR  NISAATERQS <> ''S'') ' +
      '  AND NISATIP=''SALIDA''' +
      '  AND ' + DMALM.wReplacCeros + '(KDXNREQ,'''')='''' ' +
      '  AND ((' + DMALM.wReplacCeros + '(KDXPEDIDOG,0)-' + DMALM.wReplacCeros + '(KDXCNTG,0))>0' +
      '   OR (' + DMALM.wReplacCeros + '(KDXPEDIDOU,0)-' + DMALM.wReplacCeros + '(KDXCNTU,0))>0) ';
      //' and KDXSALDOG>0    ';
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(sSQL);
   DMALM.cdsKDX.Open;
End;

Procedure TFRqsAuto.FormCreate(Sender: TObject);
Begin
   pnlGrids.Enabled := False;
   sSQL := 'SELECT CIAID, ARTID, SUM(KDXPEDIDOG - KDXCNTG) CNTG, SUM(KDXPEDIDOU - KDXCNTU) CNTU, ' +
      'ARTDES, B.UNMDES, '''' FLAGVAR ' +
      'FROM LOG315, TGE130 B ' +
      'WHERE CIAID=''' + sCIA + ''' ' +
      'AND LOCID=''' + sLOC + ''' ' +
      'AND TINID=''' + sTIN + ''' ' +
      'AND ALMID=''' + sALM + ''' ' +
      'AND NISATIP=''SALIDA'' ' +
      'AND (NISAATERQS IS NULL OR  NISAATERQS <> ''S'') ' +
      'AND (KDXPEDIDOG - KDXCNTG > 0 OR  KDXPEDIDOU - KDXCNTU > 0) ' +
      'AND LOG315.UNMIDG = B.UNMID(+) ' +
      'GROUP BY  CIAID, ARTID,  ARTDES, B.UNMDES ' +
      'ORDER BY ARTID';
   DMALM.cdsAPNIS.Close;
   DMALM.cdsAPNIS.DataRequest(sSQL);
   DMALM.cdsAPNIS.Open;
   sSQL := 'SELECT LOG315.*, (KDXPEDIDOG-KDXCNTG) AS SALDO ' +
      'FROM LOG315 ' +
      'WHERE CIAID=''' + sCIA + '''' +
      '  AND LOCID=''' + sLOC + '''' +
      '  AND ALMID=''' + sALM + '''' +
      '  AND TINID=''' + sTIN + '''' +
      '  AND (NISAATERQS IS NULL OR  NISAATERQS <> ''S'') ' +
      '  AND NISATIP=''SALIDA''' +
      '  AND ' + DMALM.wReplacCeros + '(KDXNREQ,'''')='''' ' +
      '  AND ((' + DMALM.wReplacCeros + '(KDXPEDIDOG,0)-' + DMALM.wReplacCeros + '(KDXCNTG,0))>0' +
      '   OR (' + DMALM.wReplacCeros + '(KDXPEDIDOU,0)-' + DMALM.wReplacCeros + '(KDXCNTU,0))>0) ';
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(sSQL);
   DMALM.cdsKDX.MasterSource := DMALM.dsAPNIS;
   DMALM.cdsKDX.MasterFields := 'CIAID;ARTID';
   DMALM.cdsKDX.IndexFieldNames := 'CIAID;ARTID';
   DMALM.cdsKDX.Open;
 {   Agg := cdsKDX.Aggregates.Add;
 Agg.AggregateName := 'AggKDXPEDIDO';
 Agg.Expression    := 'SUM(KDXPEDIDO)';}
   sSQL := 'SELECT * FROM LOG308';
   DMALM.cdsReqs.Close;
   DMALM.cdsReqs.DataRequest(sSQL);
   DMALM.cdsReqs.Open;

   sSQL := 'SELECT * FROM LOG309';
   DMALM.cdsDReqs.Close;
   DMALM.cdsDReqs.DataRequest(sSQL);
   DMALM.cdsDReqs.MasterSource := DMALM.dsReqs;
   DMALM.cdsDReqs.MasterFields := 'CIAID;RQSID';
   DMALM.cdsDReqs.IndexFieldNames := 'CIAID;RQSID';
   DMALM.cdsDReqs.Open;

   dblcdCCos.OnNotInList := dblcNotInList;
   dcCIA;
   dcLOC;
 //dcALM;
   dcTRQ;
   dcCCO;
   dcPRI;
   dblcTRqs.Text := 'C';
   dblcTRqsExit(Nil);
   dblcPRIOExit(Nil);
//	dblcdCCosExit(Nil);
End;

Procedure TFRqsAuto.dcCIA;
Begin
   DMALM.cdsCIA.First;
   sCIA := trim(DMALM.cdsCIA.FieldByName('CIAID').AsString);
   dblcCIA.Text := sCIA;
   dbeCIA.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + QuotedStr(dblcCIA.Text), 'CIADES');
   dblcCIA.Enabled := DMALM.cdsCIA.RecordCount > 1;
End;

Procedure TFRqsAuto.Z2bbtnRegresaClick(Sender: TObject);
Begin
   pnlGrids.Enabled := False;
   pnlCab.Enabled := True;
   Z2bbtnAcepta.Enabled := True;
   Z2bbtnArtPOk.Enabled := True;
   If dblcCIA.Enabled Then
      dblcCIA.SetFocus
   Else
   Begin
      If dblcLOC.Enabled Then
         dblcLOC.SetFocus
      Else
      Begin
         If dblcALM.Enabled Then
         Begin
            dblcALM.SetFocus
         End;
      End;
   End;
   DMALM.cdsKDX.CancelUpdates;
   DMALM.cdsAPNIS.CancelUpdates;
End;

Procedure TFRqsAuto.dbgArtPendCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
 {if DMALM.cdsAPNIS.FieldByName('FLAGVAR').AsString = '*' then
 if (not Highlight) then
 begin
  AFont.Style := [fsBold];
  ABrush.Color := clInfoBk;
 end;

 if gdSelected	in State then
 begin
  AFont.Color  := clHighlightText;
  ABrush.Color := clHighlight;
 end;}
End;

Procedure TFRqsAuto.dbgArtNISCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   If DMALM.cdsKDX.FieldByName('FLAGVAR').AsString = '*' Then
      If (Not Highlight) Then
      Begin
         AFont.Style := [fsBold];
         ABrush.Color := clInfoBk;
      End;

   If gdSelected In State Then
   Begin
      AFont.Color := clHighlightText;
      ABrush.Color := clHighlight;
   End;
End;

Procedure TFRqsAuto.dbgArtNISDblClick(Sender: TObject);
Var
   Cnt: LongInt;
   sART, sFIL: String;
Begin
   DMALM.cdsKDX.Edit;
   If (DMALM.cdsKDX.FieldByName('FLAGVAR').IsNull) Or
      (DMALM.cdsKDX.FieldByName('FLAGVAR').AsString = '') Then
      DMALM.cdsKDX.FieldByName('FLAGVAR').AsString := '*'
   Else
      DMALM.cdsKDX.FieldByName('FLAGVAR').AsString := '';
   DMALM.cdsKDX.Post;

   sART := DMALM.cdsAPNIS.FieldByName('ARTID').AsString;
   sFIL := 'CIAID=''' + sCIA + ''' AND ARTID=''' + sART + ''' AND FLAGVAR=''*''';
   Cnt := DMALM.CountFor(DMALM.cdsKDX, sFIL);

   DMALM.cdsAPNIS.Edit;

   If (Cnt > 0) Then
   Begin
      If (DMALM.cdsAPNIS.FieldByName('FLAGVAR').IsNull) Or
         (DMALM.cdsAPNIS.FieldByName('FLAGVAR').AsString = '') Then
         DMALM.cdsAPNIS.FieldByName('FLAGVAR').AsString := '*';
   End
   Else
      DMALM.cdsAPNIS.FieldByName('FLAGVAR').AsString := '';
   DMALM.cdsAPNIS.Post;
   dbgArtPend.RefreshDisplay;
End;

Procedure TFRqsAuto.Z2bbtnCanc2Click(Sender: TObject);
Begin
 // Cancelar..
   DMALM.cdsKDX.CancelUpdates;
   DMALM.cdsAPNIS.CancelUpdates;
   Close;
End;

Procedure TFRqsAuto.Z2bbtnAceptaClick(Sender: TObject);
Var
   D, M, Y: Word;
   sMarkAP, sMarkKD, sRQS, sFIL, sFecha: String;
   fSaldo, fSum: Extended;
   Cnt: Integer;
   sTDA, sNIS, sART: String;
Begin
   If DMALM.cdsAPNIS.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No Existen Artículos para Generar Requisición.');
      Exit;
   End;
   DecodeDate(Date, Y, M, D);
   sRQS := DMALM.StrZero(DMALM.MaxReqA(dblcCIA.Text, dblcLOC.Text), 2); //5
   DMALM.cdsReqs.Insert;
   DMALM.cdsReqs.FieldByName('CIAID').AsString := dblcCIA.Text;
   DMALM.cdsReqs.FieldByName('RQSID').AsString := sRQS;
   DMALM.cdsReqs.FieldByName('LOCID').AsString := dblcLOC.Text;
   DMALM.cdsReqs.FieldByName('ALMID').AsString := dblcALM.Text;
   DMALM.cdsReqs.FieldByName('CCOSID').AsString := dblcdCCos.Text;
   DMALM.cdsReqs.FieldByName('RQSFREG').AsDateTime := Date;
   DMALM.cdsReqs.FieldByName('TIPOADQ').AsString := dblcTRqs.Text;
   DMALM.cdsReqs.FieldByName('RQSEST').AsString := 'INICIAL';
   DMALM.cdsReqs.FieldByName('PRIOID').AsString := dblcPRIO.Text;
   DMALM.cdsReqs.fieldbyname('RQSFREG').AsDateTime := Date;
   DMALM.cdsReqs.fieldbyname('RQSHREG').AsDateTime := SysUtils.Time;
   DMALM.cdsReqs.fieldbyname('RQSFATE').AsDateTime := date;
   DMALM.cdsReqs.fieldbyname('RQSUSER').AsString := DMALM.wUsuario;

   sFecha := formatdatetime(DMALM.wFormatFecha, Date);
   sSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
   DMALM.FiltraCDS(DMALM.cdsPeriodo, sSQL);

   DMALM.cdsReqs.FieldbyName('RqsAno').AsString := IntToStr(Y);
   DMALM.cdsReqs.FieldbyName('RqsMM').AsString := IntToStr(M);
   DMALM.cdsReqs.FieldbyName('RqsDD').AsString := DMALM.strzero(IntToStr(D), 2);
   DMALM.cdsReqs.FieldbyName('RqsAnoMM').AsString := IntToStr(Y) + IntToStr(M);
   DMALM.cdsReqs.FieldbyName('RqsTri').AsString := DMALM.cdsPeriodo.fieldbyName('FECTRIM').asString;
   DMALM.cdsReqs.FieldbyName('RqsSem').AsString := DMALM.cdsPeriodo.fieldbyName('FECSEM').asString;
   DMALM.cdsReqs.FieldbyName('RqsSS').AsString := DMALM.cdsPeriodo.fieldbyName('FECSS').asString;
   DMALM.cdsReqs.FieldbyName('RqsAATri').AsString := DMALM.cdsPeriodo.fieldbyName('FECAATRI').asString;
   DMALM.cdsReqs.FieldbyName('RqsAASem').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASEM').asString;
   DMALM.cdsReqs.FieldbyName('RqsAASS').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASS').asString;
   DMALM.cdsReqs.FieldbyName('RqsAnoMM').AsString := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);
   DMALM.cdsReqs.FieldbyName('FlagVar').AsString := '';

   DMALM.cdsReqs.fieldbyname('RQSSOLI').AsString := 'ALMACEN';
   DMALM.cdsReqs.fieldbyname('RQSOBS').AsString := 'Requisición Automatica de Almacén ' + dblcALM.Text + ' - ' + Trim(dbeALM.Text);
   DMALM.cdsReqs.Post;

   DMALM.cdsAPNIS.First;
   While Not DMALM.cdsAPNIS.Eof Do
   Begin
      If (DMALM.cdsAPNIS.FieldByName('CNTG').AsFloat > 0) Or
         (DMALM.cdsAPNIS.FieldByName('CNTU').AsFloat > 0) Then
      Begin
         DMALM.cdsDReqs.Insert;
         DMALM.cdsDReqs.FieldByName('CIAID').AsString := DMALM.cdsReqs.FieldByName('CIAID').AsString;
         DMALM.cdsDReqs.FieldByName('RQSID').AsString := sRQS;
         DMALM.cdsDReqs.FieldByName('PRIOID').AsString := DMALM.cdsReqs.FieldByName('PRIOID').AsString;
         DMALM.cdsDReqs.FieldByName('LOCID').AsString := DMALM.cdsReqs.FieldByName('LOCID').AsString;
         DMALM.cdsDReqs.FieldByName('ALMID').AsString := DMALM.cdsReqs.FieldByName('ALMID').AsString;
         DMALM.cdsDReqs.fieldbyname('RQSFREG').AsDateTime := Date;
         DMALM.cdsDReqs.fieldbyname('RQSFATE').AsDateTime := date;
         DMALM.cdsDReqs.FieldByName('PRIOID').AsString := dblcPRIO.Text;
         DMALM.cdsDReqs.FieldByName('TIPOADQ').AsString := dblcTRqs.Text;
         DMALM.cdsDReqs.FieldByName('TRQSID').AsString := dblcTRqsn.Text;
         DMALM.cdsDReqs.FieldByName('DRQSID').AsString := DMALM.StrZero(DMALM.MaxValue('DRQSID', DMALM.cdsDReqs), 3);
         DMALM.cdsDReqs.FieldByName('ARTID').AsString := DMALM.cdsAPNIS.FieldByName('ARTID').AsString;
         DMALM.cdsDReqs.FieldByName('RQSEST').AsString := 'INICIAL';
         DMALM.cdsDReqs.FieldByName('UNMIDG').AsString := DMALM.cdsAPNIS.FieldByName('UNMIDG').AsString;
         DMALM.cdsDReqs.FieldByName('DRQSCNSG').AsFloat := DMALM.cdsAPNIS.FieldByName('CNTG').AsFloat;
         DMALM.cdsDReqs.FieldByName('DRQSCNSU').AsFloat := DMALM.cdsAPNIS.FieldByName('CNTU').AsFloat;
         DMALM.cdsDReqs.FieldByName('DRQSCNAG').AsFloat := 0;
         DMALM.cdsDReqs.FieldByName('DRQSCNAU').AsFloat := 0;
         If Length(DMALM.cdsAPNIS.FieldByName('ARTDES').AsString) > 0 Then
            DMALM.cdsDReqs.FieldByName('DRQSOBS').asString := DMALM.cdsAPNIS.FieldByName('ARTDES').AsString
         Else
            DMALM.cdsDReqs.FieldByName('DRQSOBS').asString := '.';
         DMALM.cdsDReqs.Post;
      End;
      DMALM.cdsAPNIS.Next;
   End;
   DMALM.cdsAPNIS.First;
 //DMALM.ControlTran;
   DMALM.ControlTran(0, Nil, '');
   Z2bbtnAcepta.Enabled := False;

 //wAcepto := False;
 //wNReq   := '';
 //DMALM.cdsReqs.Edit;
 // Se cambio la Forma de LOG201 a LOG215
 {Application.CreateForm(TFRqsAutoGen, FRqsAutoGen);
 Try
  FRqsAutoGen.ShowModal;
  Finally
   FRqsAutoGen.Free;
  End;}

 {if not wAcepto then
  Exit;
 DMALM.cdsAPNIS.First;
 while not DMALM.cdsAPNIS.Eof do
 begin
  DMALM.cdsKDX.First;
  while not DMALM.cdsKDX.Eof do
  begin
   sMarkKD := DMALM.cdsKDX.FieldByName('FLAGVAR').AsString;
   if sMarkKD = '*' then
   begin
    sTDA := DMALM.cdsKDX.FieldByName('TDAID').AsString;
    sNIS := DMALM.cdsKDX.FieldByName('NISAID').AsString;
    sART := DMALM.cdsKDX.FieldByName('ARTID').AsString;
    sSQL := 'UPDATE LOG315 SET KDXNREQ='''+wNReq+''' '
       + 'WHERE CIAID=''' + dblcCIA.Text+''' and '
       +       'LOCID=''' + dblcLOC.Text+''' and '
       +       'ALMID=''' + dblcALM.Text+''' and '
       +       'TDAID=''' + sTDA        +''' and '
       +       'NISAID='''+ sNIS        +''' and '
       +       'ARTID=''' + sART        +'''';
    DMALM.ExecSQL( sSQL );
   end;
   DMALM.cdsKDX.Next;
  end;
  DMALM.cdsAPNIS.Next;
 end;
 DMALM.cdsKDX.Close;
 DMALM.cdsKDX.Open;
 DMALM.cdsAPNIS.Close;
 DMALM.cdsAPNIS.Open;}
End;

Procedure TFRqsAuto.dcALM;
Begin
   DMALM.cdsALM.First;
   sALM := trim(DMALM.cdsALM.FieldByName('ALMID').AsString);
   dblcALM.Text := sALM;
   dblcALMExit(Nil);
   dblcALM.Enabled := DMALM.cdsALM.RecordCount > 1;
End;

Procedure TFRqsAuto.dcLOC;
Begin
   DMALM.cdsLOC.First;
   sLOC := trim(DMALM.cdsLOC.FieldByName('LOCID').AsString);
   dblcLOC.Text := sLOC;
   dbeLOC.Text := DMALM.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', 'LOCID=' + QuotedStr(dblcLOC.Text) + ' AND CIAID=' + QuotedStr(dblcCIA.Text), 'LOCDES');
   dblcLOC.Enabled := DMALM.cdsLOC.RecordCount > 1;
End;

Procedure TFRqsAuto.dcCCO;
Begin
   DMALM.cdsCCost.First;
   sLOC := trim(DMALM.cdsCCost.FieldByName('CCOSID').AsString);
   dblcdCCos.Text := sLOC;
   dblcdCCos.Enabled := DMALM.cdsCCost.RecordCount > 1;
End;

Procedure TFRqsAuto.dcPRI;
Begin
   DMALM.cdsPRIO.First;
   sPIO := trim(DMALM.cdsPRIO.FieldByName('PRIOID').AsString);
   dblcPRIO.Text := sPIO;
   dblcPRIO.Enabled := DMALM.cdsPRIO.RecordCount > 1;
End;

Procedure TFRqsAuto.dcTRQ;
Begin
   DMALM.cdsLOC.First;
   sTRQ := ''; //trim(DMALM.cdsTRqs.FieldByName('TRQSID').AsString);
   dblcTRqs.Text := sTRQ;
 //dblcTRqs.Enabled := DMALM.cdsTRqs.RecordCount > 1;
End;

Procedure TFRqsAuto.dblcTRqsExit(Sender: TObject);
Var
   sSQL: String;
   bRq: Boolean;
Begin
   sSQL := 'TIPOADQ=' + QuotedStr(dblcTRqs.Text);
   dbeTRqs.Text := DMALM.DisplayDescrip('prvTGE', 'TGE173', 'TIPADQDES', sSQL, 'TIPADQDES');
 //dbeTRqs.Text := DMALM.cdsTRqs.FieldByName('TRQSDES').AsString;
End;

Procedure TFRqsAuto.dblcCIAExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + QuotedStr(dblcCIA.Text);
   dbeCIA.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', sSQL, 'CIADES');

   DMALM.cdsLOC.Filtered := False;
   DMALM.cdsLOC.Filter := 'CIAID=''' + dblcCIA.Text + '''';
   DMALM.cdsLOC.Filtered := True;

   DMALM.cdsTINID.Filtered := False;
   DMALM.cdsTINID.Filter := 'CIAID=''' + dblcCIA.Text + '''';
   DMALM.cdsTINID.Filtered := True;

   sSQL := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S'' AND CCOSCIAS LIKE ''%' + dblcCIA.Text + '%''';
   DMALM.cdsCCost.Close;
   DMALM.cdsCCost.DataRequest(ssql);
   DMALM.cdsCCost.open;
   dblcdCCos.OnExit(dblcdCCos);

   DMALM.cdsParPre.Filtered := False;
   DMALM.cdsParPre.Filter := 'CIAID=''' + dblcCIA.Text + '''';
   DMALM.cdsParPre.Filtered := True;
End;

Procedure TFRqsAuto.dblcLOCExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'LOCID=' + QuotedStr(dblcLOC.Text) + ' AND CIAID=' + QuotedStr(dblcCIA.Text);
   dbeLOC.Text := DMALM.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', sSQL, 'LOCDES');
End;

Procedure TFRqsAuto.dblcLOCEnter(Sender: TObject);
Begin
   If dblcCIA.Text = '' Then
   Begin
      If dblcCIA.Enabled Then
         dblcCIA.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Compañía');
      End;
   End;
End;

Procedure TFRqsAuto.dblcTINEnter(Sender: TObject);
Begin
   If dblcLOC.Text = '' Then
   Begin
      If dblcLOC.Enabled Then
         dblcLOC.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Localidad');
      End;
   End;
End;

Procedure TFRqsAuto.dblcTINExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'TINID=' + QuotedStr(dblcTIN.Text) + ' AND CIAID=' + QuotedStr(dblcCIA.Text);
   dbeTIN.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', sSQL, 'TINDES');

   DMALM.cdsALM.Filtered := False;
   DMALM.cdsALM.Filter := 'CIAID=''' + dblcCIA.Text + ''' AND LOCID=''' + dblcLOC.Text + ''' AND TINID=''' + dblcTIN.Text + '''';
   DMALM.cdsALM.Filtered := True;
End;

Procedure TFRqsAuto.dblcALMEnter(Sender: TObject);
Begin
   If dblcTIn.Text = '' Then
   Begin
      If dblcTIn.Enabled Then
         dblcTIn.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Tipo de Inventario ');
   //dblcTInv.SetFocus;
      End;
   End;
End;

Procedure TFRqsAuto.dblcALMExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIn.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcALM.text);
   dbeALM.Text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', sSQL, 'ALMDES');
End;

Procedure TFRqsAuto.dblcdCCosExit(Sender: TObject);
{var
 sSQL : String;
begin
 sSQL:='CCOSID='+quotedstr(dblcdCCos.text);
 dbeCCostos.Text := DMALM.DisplayDescrip('prvTGE','TGE203','CCOSDES',sSQL,'CCOSDES');
}
Var
   xSql, xWhere, xParPres, xTipPres: String;
Begin
   xPresu := 'N';
   dbeCCostos.Text := DMALM.DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', 'CCOSID=' + quotedStr(dblcdCCos.text), 'CCOSDES');
   If dblcdCCos.Text = '' Then Exit;
   If wActuaPresu Then
   Begin
      Try
//     If DMALM.wModo = 'A' then
//      begin
         Screen.Cursor := crHourGlass;
         pnlActualizando.Visible := True;
         pnlActualizando.Refresh;
         lblActualizando.Caption := 'Buscando Partidas Presupuestales...';
         lblActualizando.Refresh;
         xWhere := 'CCOSID=' + quotedstr(dblcdCCos.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
         eXIT;
         If Length(DMALM.DisplayDescrip('prvTGE', 'PPRES301', 'CCOSID', xWhere, 'CCOSID')) > 0 Then
         Begin
            xPresu := 'S';
            xSql := 'SELECT CIAID,CCOSID,PARPRESID,TIPPRESID FROM PPRES301 WHERE CCOSID=' + quotedstr(dblcdCCos.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
            DMALM.cdsSQL.Close;
            DMALM.cdsSQL.DataRequest(xSql);
            DMALM.cdsSQL.open;
            DMALM.cdsSQL.First;
            xParPres := 'SELECT * FROM PPRES201 WHERE CIAID=' + quotedstr(dblcCIA.text);
            xTipPres := 'SELECT * FROM PPRES101 WHERE';
            DMALM.cdsParPre.IndexFieldNames := 'CIAID;PARPRESID;PARPRESMOV';
            DMALM.cdsTipPre.IndexFieldNames := 'TIPPRESID';
            While Not DMALM.cdsSQL.Eof Do
            Begin
               DMALM.cdsParPre.SetKey;
               DMALM.cdsParPre.FieldByName('CIAID').AsString := DMALM.cdsSQL.fieldbyname('CIAID').Asstring;
               DMALM.cdsParPre.FieldByName('PARPRESID').AsString := DMALM.cdsSQL.fieldbyname('PARPRESID').Asstring;
               DMALM.cdsParPre.FieldByName('PARPRESMOV').AsString := 'S';
               If DMALM.cdsParPre.GotoKey Then
                  xParPres := xParPres + ' AND PARPRESID =' + quotedstr(DMALM.cdsSQL.fieldbyname('PARPRESID').Asstring);
               DMALM.cdsTipPre.SetKey;
  //           DMALM.cdsTipPre.FieldByName('CIAID').AsString := DMALM.cdsSQL.fieldbyname('CIAID').Asstring;
               DMALM.cdsTipPre.FieldByName('TIPPRESID').AsString := DMALM.cdsSQL.fieldbyname('TIPPRESID').Asstring;
               If DMALM.cdsTipPre.GotoKey Then
                  If Length(xTipPres) > 28 Then
                     xTipPres := xTipPres + ' AND TIPPRESID =' + quotedstr(DMALM.cdsSQL.fieldbyname('TIPPRESID').Asstring)
                  Else
                     xTipPres := xTipPres + ' TIPPRESID =' + quotedstr(DMALM.cdsSQL.fieldbyname('TIPPRESID').Asstring);
               DMALM.cdsSQL.Next;
            End;
            DMALM.cdsParPre.Close;
            DMALM.cdsParPre.DataRequest(xParPres);
            DMALM.cdsParPre.Open;
            DMALM.cdsTipPre.Close;
            DMALM.cdsTipPre.DataRequest(xTipPres);
            DMALM.cdsTipPre.Open;
            dblcTipPre.enabled := wActuaPresu;
            dblcdPresup.enabled := wActuaPresu;
         End
         Else
         Begin
            showmessage('Centro de Costo No Tiene Partida Presupuestal');
            xPresu := 'N';
         End;
//      end;
      Finally
         pnlActualizando.Visible := False;
         Screen.Cursor := crDefault;
      End;
   End;

End;

Procedure TFRqsAuto.dblcPRIOExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'PRIOID=' + quotedstr(dblcPRIO.text);
   dbePRIO.Text := DMALM.DisplayDescrip('prvTGE', 'TGE155', 'PRIODES', sSQL, 'PRIODES');
End;

  {sMarkAP := DMALM.cdsAPNIS.FieldByName('FLAGVAR').AsString;
  if sMarkAP = '*' then
  begin
   fSum := 0;
   DMALM.cdsKDX.First;
   while not DMALM.cdsKDX.Eof do
   begin
    // Aqui se genera las requisiciones
    sMarkKD := DMALM.cdsKDX.FieldByName('FLAGVAR').AsString;
    if sMarkKD = '*' then
    begin
     fSaldo:= DMALM.cdsKDX.FieldByName('KDXPEDIDOG').AsFloat-DMALM.cdsKDX.FieldByName('KDXCNTG').AsFloat;
     fSum  := fSum + fSaldo;
    end;
    DMALM.cdsKDX.Next;
   end;}

   //if fSum>0 then

{	{sFIL:= 'CIAID='''+sCIA+''' AND FLAGVAR=''*''';
 DMALM.cdsKDX.First;
 Cnt := DMALM.CountFor( DMALM.cdsKDX,sFIL );
 if Cnt=0 then
 begin
  ErrorMsg('Error',' No se han seleccionado artículos para generar requisición.  ');
  Exit;
 end;}
 //sRQS := DMALM.StrZero( DMALM.MaxReqA(dblcCIA.Text,dblcLOC.Text), 5);
 //sRQS := DMALM.StrZero(DMALM.MaxReqs(sCIA,sLOC,sALM),5);

Procedure TFRqsAuto.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMALM.cdsALM.Filtered := False;
   DMALM.cdsALM.Filter := '';
   DMALM.cdsALM.Close;

   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.MasterSource := Nil;
   DMALM.cdsKDX.MasterFields := '';
   DMALM.cdsKDX.IndexFieldNames := '';

   DMALM.cdsLOC.Filtered := False;
   DMALM.cdsLOC.Filter := 'CIAID=''' + dblcCIA.Text + '''';
   DMALM.cdsLOC.Filtered := True;

   Screen.Cursor := crDefault;
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   //FVariables.w_IN_Registro := False;
   Action := CAFree;
 //DMALM.cdsKDX.Open;
End;

Procedure TFRqsAuto.dblcTRqsnExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'TRQSID=' + QuotedStr(dblcTRqsn.Text);
   edtTRqs.Text := DMALM.DisplayDescrip('prvTGE', 'TGE142', 'TRQSDES', sSQL, 'TRQSDES');
End;

Procedure TFRqsAuto.FormActivate(Sender: TObject);
Begin
End;

//** 23/06/2001 - pjsv

Procedure TFRqsAuto.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;
//**

Procedure TFRqsAuto.dblcTipPreExit(Sender: TObject);
Begin
   If Length(dblcTipPre.Text) = 0 Then
   Begin
      Raise exception.Create('Falta Tipo de Presupuesto');
      Exit;
   End;
   dbeTipPre.text := DMALM.DisplayDescrip('prvTGE', 'PPRES101', 'TIPPRESDES', 'TIPPRESID=' + quotedstr(dblcTipPre.text), 'TIPPRESDES');
End;

Procedure TFRqsAuto.dblcdPresupExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'PARPRESID=' + quotedstr(dblcdPresup.Text) + ' AND CIAID=''' + dblcCIA.Text + '''';
   edtPresup.Text := DMALM.DisplayDescrip('PPRES201', 'PPRES201', 'PARPRESDES', xSQL, 'PARPRESDES');
   If Length(edtPresup.text) = 0 Then
   Begin
      Raise exception.Create('Falta Partida Presupuestal');
      dblcdPresup.SetFocus;
   End;
End;

Procedure TFRqsAuto.FormShow(Sender: TObject);
Var
   xsql: String;
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
   dbeCCostos.Text := '';
   edtTRqs.Text := '';
   dblcTipPre.Visible := wActuaPresu;
   dblcdPresup.Visible := wActuaPresu;
   lblTipPre.Visible := wActuaPresu;
   lblPresu.Visible := wActuaPresu;
   dbeTipPre.Visible := wActuaPresu;
   edtPresup.Visible := wActuaPresu;
   Screen.Cursor := crDefault;
End;

End.

