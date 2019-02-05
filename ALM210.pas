Unit ALM210;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, wwdblook, ExtCtrls, ComCtrls, Mant, ppCache, ppDB,
   ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, DB, Mask, wwdbedit,
   Spin, MsgDlgs;

Type
   TFParRepAuto = Class(TForm)
      pnlOpciones: TPanel;
      pnlBoton: TPanel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      edtDias: TEdit;
      lblDias: TLabel;
      Label1: TLabel;
      edtFactor: TEdit;
      pbProceso: TProgressBar;
      Label2: TLabel;
      gbPorcentaje: TGroupBox;
      dbeStkMax: TwwDBEdit;
      dbePtoRep: TwwDBEdit;
      dbeStkMin: TwwDBEdit;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      gbMes: TGroupBox;
      dblcMesFin: TwwDBLookupCombo;
      Label8: TLabel;
      gbAno: TGroupBox;
      spnAnoIni: TSpinEdit;
      Label9: TLabel;
      Label10: TLabel;
      spnAnoFin: TSpinEdit;
      lblInicial: TLabel;
      dblcMesIni: TwwDBLookupCombo;
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbeStkMinExit(Sender: TObject);
      Procedure dbeStkMaxExit(Sender: TObject);
      Procedure dbePtoRepExit(Sender: TObject);
      Procedure dblcMesIniNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcMesFinNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcMesFinExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FParRepAuto: TFParRepAuto;

Implementation

//uses ALMDM1, ALM001, ALM211;
Uses ALMDM1, oaIN2000, ALM211;

{$R *.DFM}

Procedure TFParRepAuto.Z2bbtnRegCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFParRepAuto.FormCreate(Sender: TObject);
Var
   FIni, xSQL: String;

Begin
   DecodeDate(Date, Y, M, D);
   FIni := '01/' + IntToStr(M) + '/' + IntToStr(Y);
   dtpDesde.Date := StrToDate(FIni);
   dtpHasta.Date := Date;
  //CIM 07/11/2002
   xSQL := 'SELECT MESIDR,MESDESL FROM TGE181';
   DMALM.cdsQry4.IndexFieldNames := '';
   DMALM.cdsQry4.Filter := '';
   DMALM.cdsQry4.Filtered := FALSE;
   DMALM.cdsQry4.Close;
   DMALM.cdsQry4.DataRequest(Xsql);
   DMALM.cdsQry4.Open;
   dblcMesIni.LookupTable := DMALM.cdsQry4;
   dblcMesIni.LookupField := 'MESIDR';
   dblcMesIni.Selected.Clear;
   dblcMesIni.Selected.Add('MESIDR'#9'2'#9'Id');
   dblcMesIni.Selected.Add('MESDESL'#9'20'#9'Mes');

   dblcMesFin.LookupTable := DMALM.cdsQry4;
   dblcMesFin.LookupField := 'MESIDR';
   dblcMesFin.Selected.Clear;
   dblcMesFin.Selected.Add('MESIDR'#9'2'#9'Id');
   dblcMesFin.Selected.Add('MESDESL'#9'20'#9'Mes');
  //*
End;

Procedure TFParRepAuto.Z2bbtnRegOkClick(Sender: TObject);
Var
 {SalIniDes, SalIniHas,}sDesde, sHasta: String;
   CadSql, sSQL, xwhere, xTriPRep {, xOrder}: String;
   iX {, iY}: integer;
   iDesde, iHasta: integer;
   iDesAn, iHasAn: integer;
   xMes, xCantProm: Double;
Begin
   If DMALM.cdsArti.RecordCount = 0 Then
   Begin
      ErrorMsg(Caption, ' No Existe Registro a Procesar ');
      Exit;
   End;
 {if Length(Trim(edtDias.text)) = 0 then
  begin
    ErrorMsg(Caption, ' Dias no Válido ');
   Exit;
  end;}

  //cim 07/11/2002

   sDesde := spnAnoIni.Text + dblcMesIni.Text;
   sHasta := spnAnoFin.Text + dblcMesFin.Text;

   If length(Trim(spnAnoIni.text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' Año Inicial no Valido ');
      Exit;
   End;

   If length(Trim(spnAnoFin.text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' Año Final no Válido ');
      Exit;
   End;

   If strtofloat(sDesde) > strtofloat(sHasta) Then
   Begin
      ErrorMsg(Caption, ' El Periodo Inicial  ' + sDesde + '  No Puede ser Mayor al Periodo Final ' + sHasta);
      Exit;
   End;

  {if length(Trim(dblcMesIni.text))=0 then
  begin
    ErrorMsg(Caption, ' Mes Inicial no Valido ');
   Exit;
  end;

  if length(Trim(dblcMesFin.text))=0 then
  begin
    ErrorMsg(Caption, ' Mes Final no Válido ');
   Exit;
  end;

  if strtofloat(dblcMesIni.text)>strtofloat(dblcMesFin.text) then
  begin
    ErrorMsg(Caption, ' El Mes Inicial no puede ser mayor al Mes Final ');
    Exit;
  end;}

   If length(Trim(dbeStkMax.text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Porcentaje de Stock Máximo no Válido ');
      Exit;
   End;

   If length(Trim(dbePtoRep.text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' Porcentaje de Pto.Reposición no Válido ');
      Exit;
   End;

   If length(Trim(dbeStkMin.text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' Porcentaje de Stock Mínimo no Válido ');
      Exit;
   End;

   If strtoint(dbeStkMax.Text) > 100 Then
   Begin
      ErrorMsg(Caption, ' El Porcentaje de Stock Máx. debe ser menor a 100 ');
      Exit;
   End;

   If strtoint(dbeStkMin.Text) > 100 Then
   Begin
      ErrorMsg(Caption, ' El Porcentaje de Stock Mín. debe ser menor a 100 ');
      Exit;
   End;

   If strtoint(dbePtoRep.Text) > 100 Then
   Begin
      ErrorMsg(Caption, ' El Porcentaje de Pto. Reposición debe ser menor a 100 ');
      Exit;
   End;

   If strtoint(dbeStkMin.Text) > strtoint(dbeStkMax.Text) Then
   Begin
      ErrorMsg(Caption, ' El Stock Mínimo no puede ser mayor al Stock Máximo ');
      Exit;
   End;

   If strtoint(dbePtoRep.Text) > strtoint(dbeStkMax.Text) Then
   Begin
      ErrorMsg(Caption, ' El Pto. Reposición no puede ser mayor al Stock Máximo ');
      Exit;
   End;

  //*

 {if strtoFloat(edtDias.text) <= 0 then
  begin
    ErrorMsg(Caption, ' Dias no Valido ');
   Exit;
  end;}

{	if Length(Trim(edtFactor.Text)) = 0 then
  begin
    ErrorMsg(Caption, ' Factor no Valido ');
   Exit;
  end;

 if strtoFloat(edtFactor.Text) <= 0 then
  begin
    ErrorMsg(Caption, ' Factor no Valido ');
   Exit;
  end;}

   If Not Question('Confirmar', 'Esta Seguro de Continuar con los Parametros de Reposición Automatico ' + #13 + #13 +
      ' Desea Continuar ') Then
      Exit;

   Screen.Cursor := crHourGlass;
   CadSql := Mtx2000.FMant.SQL;

   xCantProm := 0;

   For iX := 0 To Length(CadSql) Do
   Begin
      If copy(CadSql, iX, 5) = 'WHERE' Then
      Begin
         xwhere := copy(CadSql, iX + 6, length(CadSql));
         break;
      End;
   End;

   pbProceso.Visible := True;
   DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTID', xWhere, 'ARTID');
   pbProceso.Max := DMALM.cdsQry.RecordCount;

 {sDesde  := QuotedStr(FormatDateTime(DMALM.wFormatFecha,dtpDesde.DateTime));
  sHasta   := QuotedStr(FormatDateTime(DMALM.wFormatFecha,dtpHasta.DateTime));}
   iDesde := StrToInt(dblcMesIni.text);
   iHasta := StrToInt(dblcMesFin.text);

   iDesAn := StrToInt(spnAnoIni.text);
   iHasAn := StrToInt(spnAnoFin.text);

   xTriPRep := '';
   DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRIID', 'TRISGT=''S'' AND TRIPREP=''S''', 'TRIID');
   DMALM.cdsQry.First;
   While Not DMALM.cdsQry.Eof Do
   Begin
      If Length(Trim(xTriPRep)) = 0 Then
         xTriPRep := ' AND (TRIID=' + QuotedStr(DMALM.cdsQry.FieldByName('TRIID').AsString)
      Else
         xTriPRep := xTriPRep + ' OR TRIID=' + QuotedStr(DMALM.cdsQry.FieldByName('TRIID').AsString);
      DMALM.cdsQry.Next;
   End;
 //CIM 07/11/2002
   CadSql := 'SELECT CIAID, TINID, GRARID, ARTID, ARTDES, STKSMAX, STKSMIN, ARTPCU, STKSPRE, STKSCPE ' +
      'FROM TGE205 ' +
      'WHERE CIAID=''XX''';

   DMALM.cdsTMP.Filter := '';
   DMALM.cdsTMP.Filtered := false;
   DMALM.cdsTMP.IndexFieldNames := '';
   DMALM.cdsTMP.Close;
   DMALM.cdsTMP.DataRequest(CadSql);

   FPProy := TFPProy.create(self);

   FPProy.dbgProy.Selected.clear;
   FPProy.dbgProy.Selected.Add('CIAID'#9'3'#9'Cia');
   FPProy.dbgProy.Selected.Add('TINID'#9'3'#9'Tipo~Inv.');
   FPProy.dbgProy.Selected.Add('ARTID'#9'9'#9'Id~Articulo');
   FPProy.dbgProy.Selected.Add('ARTPCU'#9'10'#9'Total~Salidas');
   FPProy.dbgProy.Selected.Add('STKSMAX'#9'10'#9'Stock~Maximo');
   FPProy.dbgProy.Selected.Add('STKSMIN'#9'10'#9'Stock~Minimo');
   FPProy.dbgProy.Selected.Add('STKSPRE'#9'10'#9'Punto~Reposición');
   FPProy.dbgProy.Selected.Add('STKSCPE'#9'10'#9'Cantidad~Pedir');
   DMALM.cdsTMP.Open;

{  xMes:=(dtpHasta.Date-dtpDesde.Date)/30+1;
 if strtoFloat(edtDias.text) <= 0 then
  edtDias.Text := FloattoStr(xMes);}
 //xMes := (strtoint(dblcMesFin.text)-strtoint(dblcMesIni.text)+1);
   xMes := strtofloat(sHasta) - strtofloat(sDesde) + 1;

   DMALM.cdsArti.DisableControls;
   DMALM.cdsArti.First;
   While Not DMALM.cdsArti.Eof Do
   Begin
      Application.ProcessMessages;
      pbProceso.Position := pbProceso.Position + 1;

      sSQL := 'SELECT MIN(KDXCNTG) MIN, MAX(KDXCNTG) MAX, SUM(KDXCNTG) KDX ' +
         'FROM LOG315 ' +
         'WHERE TO_NUMBER(TO_CHAR(NISAFREG,''MM'')) >=' + FloatToStr(iDesde) + ' ' +
         'AND TO_NUMBER(TO_CHAR(NISAFREG,''MM'')) <=' + FloatToStr(iHasta) + ' ' +
         'AND TO_NUMBER(TO_CHAR(NISAFREG,''YYYY'')) >=' + FloatToStr(iDesAn) + ' ' +
         'AND TO_NUMBER(TO_CHAR(NISAFREG,''YYYY'')) >=' + FloatToStr(iHasAn) + ' ' +
         'AND CIAID=' + QuotedStr(DMALM.cdsArti.FieldByName('CIAID').AsString) + ' ' +
         'AND TINID=' + QuotedStr(DMALM.cdsArti.FieldByName('TINID').AsString) + ' ' +
         'AND ARTID=' + QuotedStr(DMALM.cdsArti.FieldByName('ARTID').AsString) + ' ' +
         'AND NISATIP=''SALIDA''';

      If Length(Trim(xTriPRep)) > 0 Then
         sSQL := sSQL + xTriPRep + ')';

      DMALM.cdsReporte.close;
      DMALM.cdsReporte.DataRequest(sSQL);
      DMALM.cdsReporte.Open;

      DMALM.cdsTMP.Insert;
      DMALM.cdsTMP.FieldByName('CIAID').AsString := DMALM.cdsArti.FieldByName('CIAID').AsString;
      DMALM.cdsTMP.FieldByName('TINID').AsString := DMALM.cdsArti.FieldByName('TINID').AsString;
      DMALM.cdsTMP.FieldByName('GRARID').AsString := DMALM.cdsArti.FieldByName('GRARID').AsString;
      DMALM.cdsTMP.FieldByName('ARTID').AsString := DMALM.cdsArti.FieldByName('ARTID').AsString;
      DMALM.cdsTMP.FieldByName('ARTDES').AsString := DMALM.cdsArti.FieldByName('ARTDES').AsString;
  //CIM 07/11/2002
    {DMALM.cdsTMP.FieldByName('STKSMAX').AsFloat	:= DMALM.cdsReporte.FieldByName('MAX').AsFloat;
  DMALM.cdsTMP.FieldByName('STKSMIN').AsFloat	:= DMALM.cdsReporte.FieldByName('MIN').AsFloat;
  DMALM.cdsTMP.FieldByName('ARTPCU').AsFloat	:= DMALM.cdsReporte.FieldByName('KDX').AsFloat;
    DMALM.cdsTMP.FieldByName('STKSPRE').AsFloat	:= DMALM.FRound(DMALM.cdsReporte.FieldByName('MAX').AsFloat * StrtoFloat(edtDias.Text)/30,15,2);
    //DMALM.cdsTMP.FieldByName('STKSCPE').AsFloat	:= StrtoFloat(edtFactor.Text);
    DMALM.cdsTMP.FieldByName('STKSCPE').AsFloat	:= DMALM.FRound((DMALM.cdsReporte.FieldByName('KDX').AsFloat/Trunc(xMes)) * StrtoFloat(edtFactor.Text),15,2);}
    {DMALM.cdsTMP.FieldByName('STKSMAX').AsFloat	:= DMALM.FRound((DMALM.cdsReporte.FieldByName('KDX').AsFloat/xMes)*(1+DMALM.FRound(strtofloat(dbeStkMax.text)/100,15,4)),15,2);
    DMALM.cdsTMP.FieldByName('STKSMIN').AsFloat	:= DMALM.FRound((DMALM.cdsReporte.FieldByName('KDX').AsFloat/xMes)*(1-DMALM.FRound(strtofloat(dbeStkMin.text)/100,15,4)),15,2);
    DMALM.cdsTMP.FieldByName('ARTPCU').AsFloat	:= DMALM.FRound(DMALM.cdsReporte.FieldByName('KDX').AsFloat,15,2);
    DMALM.cdsTMP.FieldByName('STKSPRE').AsFloat	:= DMALM.FRound((DMALM.cdsReporte.FieldByName('KDX').AsFloat/xMes)*(1-DMALM.FRound(strtofloat(dbeStkMin.text)/100,15,4))*(1+DMALM.FRound(strtofloat(dbeStkMax.text)/100,15,4)),15,2);
    DMALM.cdsTMP.FieldByName('STKSCPE').AsFloat	:= DMALM.FRound((DMALM.cdsReporte.FieldByName('KDX').AsFloat/xMes)*(1-DMALM.FRound(strtofloat(dbeStkMin.text)/100,15,4))*(1+DMALM.FRound(strtofloat(dbeStkMax.text)/100,15,4)),15,2);}

      DMALM.cdsTMP.FieldByName('STKSMAX').AsFloat := DMALM.FRound((DMALM.cdsReporte.FieldByName('KDX').AsFloat / xMes) * (DMALM.FRound(strtofloat(dbeStkMax.text) / 100, 15, 4)), 15, 2);
      DMALM.cdsTMP.FieldByName('STKSMIN').AsFloat := DMALM.FRound((DMALM.cdsReporte.FieldByName('KDX').AsFloat / xMes) * (DMALM.FRound(strtofloat(dbeStkMin.text) / 100, 15, 4)), 15, 2);
      DMALM.cdsTMP.FieldByName('ARTPCU').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('KDX').AsFloat, 15, 2);
      DMALM.cdsTMP.FieldByName('STKSPRE').AsFloat := DMALM.FRound((DMALM.cdsReporte.FieldByName('KDX').AsFloat / xMes) * (DMALM.FRound(strtofloat(dbeStkMin.text) / 100, 15, 4)) * (1 + DMALM.FRound(strtofloat(dbeStkMax.text) / 100, 15, 4)), 15, 2);
      DMALM.cdsTMP.FieldByName('STKSCPE').AsFloat := DMALM.FRound((DMALM.cdsReporte.FieldByName('KDX').AsFloat / xMes) * (DMALM.FRound(strtofloat(dbeStkMin.text) / 100, 15, 4)) * (1 + DMALM.FRound(strtofloat(dbeStkMax.text) / 100, 15, 4)), 15, 2);

    //*
      DMALM.cdsTMP.Post;
      DMALM.cdsArti.Next;
   End;
   DMALM.cdsTMP.IndexFieldNames := 'CIAID;TINID;GRARID;ARTID';
   TNumericField(DMALM.cdsTMP.FieldByName('STKSMAX')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMALM.cdsTMP.FieldByName('STKSMIN')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMALM.cdsTMP.FieldByName('ARTPCU')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMALM.cdsTMP.FieldByName('STKSPRE')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMALM.cdsTMP.FieldByName('STKSCPE')).DisplayFormat := '###,###,##0.00';

   DMALM.cdsArti.EnableControls;
  //DMALM.ControlTran;
 //pbProceso.Visible := False;
   Screen.Cursor := crDefault;
   Try
      FPProy.ShowModal;
   Finally
      FPProy.Free;
      pbProceso.Max := 0;
      DMALM.cdsTMP.Filter := '';
      DMALM.cdsTMP.Filtered := false;
      DMALM.cdsTMP.IndexFieldNames := '';
      DMALM.cdsTMP.Close;

   End;

 //SELECT * FROM LOG315 WHERE NISAFREG>='2001-11-01' AND NISAFREG<='2001-12-07'
  { DMALM.cdsArti.Edit;
    DMALM.cdsArti.FieldByName('STKSMAX').AsFloat:= DMALM.cdsReporte.FieldByName('MAX').AsFloat;
    DMALM.cdsArti.FieldByName('STKSMIN').AsFloat:= DMALM.cdsReporte.FieldByName('MIN').AsFloat;
    DMALM.cdsArti.FieldByName('STKSPRE').AsFloat:=DMALM.FRound(DMALM.cdsReporte.FieldByName('MAX').AsFloat*StrtoFloat(edtDias.Text)/30,15,2);
    DMALM.cdsArti.FieldByName('STKSCPE').AsFloat:=DMALM.FRound(DMALM.cdsArti.FieldByName('STKSPRE').AsFloat*StrtoFloat(edtFactor.Text),15,2);
    DMALM.cdsArti.Post;
    DMALM.cdsArti.Next;}
End;

 {CadSql:=Mtx.FMant.SQL;
  for iX := 0 to Length(CadSql) do
  begin
    if copy(CadSql,iX,5) = 'WHERE' then
    begin
      xwhere := copy(CadSql,iX+6,length(CadSql));
      break;
    end;
  end;

  for iY := 0 to Length(xWhere) do
  begin
    if copy(xWhere,iY,8) = 'ORDER BY' then
    begin
      xOrder := copy(xWhere,1,iY-2);
      break;
    end;
  end;}

Procedure TFParRepAuto.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End
End;

Procedure TFParRepAuto.dbeStkMinExit(Sender: TObject);
Begin
   If length(Trim(dbeStkMin.Text)) > 0 Then
   Begin
      If strtoint(dbeStkMin.Text) > 100 Then
      Begin
         ErrorMsg(Caption, ' El Porcentaje debe ser menor a 100 ');
         Exit;
      End;

      If strtoint(dbeStkMin.Text) > strtoint(dbeStkMax.Text) Then
      Begin
         ErrorMsg(Caption, ' El Stock Mínimo no puede ser mayor al Stock Máximo ');
         Exit;
      End;
   End;

End;

Procedure TFParRepAuto.dbeStkMaxExit(Sender: TObject);
Begin
   If length(Trim(dbeStkMax.text)) > 0 Then
   Begin
      If strtoint(dbeStkMax.Text) > 100 Then
      Begin
         ErrorMsg(Caption, ' El Porcentaje debe ser menor a 100 ');
         Exit;
      End;
   End;

End;

Procedure TFParRepAuto.dbePtoRepExit(Sender: TObject);
Begin
   If length(Trim(dbePtoRep.text)) > 0 Then
   Begin
      If strtoint(dbePtoRep.Text) > 100 Then
      Begin
         ErrorMsg(Caption, ' El Porcentaje debe ser menor a 100 ');
         Exit;
      End;
      If strtoint(dbePtoRep.Text) > strtoint(dbeStkMax.Text) Then
      Begin
         ErrorMsg(Caption, ' El Pto. Reposición no puede ser mayor al Stock Máximo ');
         Exit;
      End;
   End;

End;

Procedure TFParRepAuto.dblcMesIniNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;

End;

Procedure TFParRepAuto.dblcMesFinNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;

End;

Procedure TFParRepAuto.dblcMesFinExit(Sender: TObject);
Begin
  {if (length(Trim(dblcMesFin.text))>0) and (length(Trim(dblcMesIni.text))>0) then
   begin
     if strtofloat(dblcMesIni.text)>strtofloat(dblcMesFin.text) then
     begin
       ErrorMsg(Caption, ' El Mes Inicial no puede ser mayor al Mes Final ');
       Exit;
     end;
   end;}
End;

Procedure TFParRepAuto.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
   spnAnoIni.Text := IntToStr(Y);
   spnAnoFin.Text := IntToStr(Y);
End;

End.

