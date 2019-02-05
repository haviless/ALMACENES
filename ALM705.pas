Unit ALM705;

// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, wwdbedit, Wwdbspin, ppCtrls,
   ppBands, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppEndUsr, ppComm,
   ppRelatv, ppCache, ppDB, ppDBPipe, wwdblook, ppViewr;

Type
   TFToolDinCtbl = Class(TForm)
      pnlTool: TPanel;
      Z1sbKardex: TBitBtn;
      Label2: TLabel;
      dbseMes: TwwDBSpinEdit;
      Label1: TLabel;
      dbseAno: TwwDBSpinEdit;
      ppData: TppDBPipeline;
      Diseno: TppDesigner;
      lblCia: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      ppReporte: TppReport;
      ppHeaderBand2: TppHeaderBand;
      pplblCiades: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel6: TppLabel;
      pplblTDiario: TppLabel;
      pplblDiarioDes: TppLabel;
      ppLabel9: TppLabel;
      pplblNoCompro: TppLabel;
      ppLabel15: TppLabel;
      pplblProveedor: TppLabel;
      ppLabel43: TppLabel;
      ppLabel47: TppLabel;
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
      ppLabel63: TppLabel;
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
      ppLabel77: TppLabel;
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
      Memo1: TMemo;
      Procedure Z1sbKardexClick(Sender: TObject);
      Procedure ppReportePreviewFormCreate(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dbseMesExit(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolDinCtbl: TFToolDinCtbl;
   xSQL: String;
   xTAutoNum, xTAno, xTMes, xxNoReg: String;

Implementation

Uses ALMDM1;

{$R *.DFM}

Procedure TFToolDinCtbl.Z1sbKardexClick(Sender: TObject);
Var
   xSQL, mes, ano, xwhere, MONABR: String;
   TMoneda, mesdes, TDiario: String;
   xTotHaber: DOUBLE;
Begin
   wDinCtbl := 'TOOL';
   If DM1.wAdmin = 'G' Then Exit;

   dm1.cdsReporte.IndexFieldNames := '';
   dbseMes.Text := DM1.StrZero(dbseMes.Text, 2);
   xTMes := dbseMes.Text;
   xTAno := dbseAno.Text;

   xSQL := 'SELECT * FROM LOG204 ' +
      'WHERE CIAID=' + QuotedStr(dblcCIA.Text);
   dm1.cdsHijo.Close;
   dm1.cdsHijo.DataRequest(xSQL);
   dm1.cdsHijo.Open;

   If dm1.cdsHijo.RecordCount = 0 Then
   Begin
      ErrorMsg(Caption, 'No Existe información a Mostrar');
      Exit;
   End;

  //if not AsientoCuadra then
   //raise exception.Create('Error : Asiento No Cuadra ');

   xTAutoNum := DM1.DisplayDescrip('prvTGE', 'TGE104', 'AUTONUM', 'TDIARID=' + quotedstr('ZZ'), 'AUTONUM');
   xxNoReg := DM1.UltimoRegistro(xTAutoNum, dblcCia.Text, 'ZZ', xTAno, xTMes);
  //xxNoReg		:= DM1.GrabaUltimoRegistro( xTAutoNum,dblcCia.Text,'ZZ',xTAno,xTMes,StrToInt(xxNoReg) );
   xxNoReg := dm1.StrZero(xxNoReg, 10);

   TDiario := 'ZZ';

   xSQL := 'DELETE FROM CNT311 ' +
      'WHERE CIAID=' + quotedstr(dblcCia.text) + ' ' +
      'AND CNTANOMM=' + quotedstr(dbseAno.text + dbseMes.Text) + ' ' +
      'AND TDIARID=' + quotedstr('ZZ') + ' ' +
      'AND CNTCOMPROB=' + quotedstr(dbseAno.text);
   Try
      DM1.DCOM1.AppServer.EjecutaQry(xSql);
   Except
   End;

   xSQL := 'DELETE FROM CNT310 ' +
      'WHERE CIAID=' + quotedstr(dblcCia.text) + ' ' +
      'AND CNTANOMM=' + quotedstr(dbseAno.text + dbseMes.Text) + ' ' +
      'AND TDIARID=' + quotedstr(dbseAno.text) + ' ' +
      'AND CNTCOMPROB=' + quotedstr(dbseAno.text);
   Try
      DM1.DCOM1.AppServer.EjecutaQry(xSql);
   Except
   End;

   DM1.GeneraContab(dblcCia.Text, TDiario, dbseAno.text + dbseMes.Text, xxNoReg, Self, 'P');

  // Se Transfiere la Data Generada en el SOLContabiliza
   dm1.cdsReporte.Data := dm1.cdsMovCNT.data;

   ppData.DataSource := dm1.dsReporte;

   ppReporte.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AlmVoucher.rtm';
   ppReporte.Template.LoadFromFile;

  //pplblDesEstado.caption:='Previo';
   xSQL := 'SELECT CNTGLOSA FROM CNT310 WHERE CIAID=' + quotedstr(dblcCia.text) + ' ' +
      'AND CNTANOMM=' + quotedstr(dbseAno.text + dbseMes.Text) + ' ' +
      'AND TDIARID=' + quotedstr(dbseAno.text) + ' ' +
      'AND CNTCOMPROB=' + quotedstr(dbseAno.text);
   DM1.cdsQry5.close;
   DM1.cdsQry5.ProviderName := 'dspUltTGE';
   DM1.cdsQry5.DataRequest(xsql);
   DM1.cdsQry5.Open;

   pplblTipoCamb.Caption := DM1.CalcTipoCambio(dm1.wTMonExt, StrtoDate(xFec_Sis), dm1.wTipoCambioUsar);

   mes := dbseMes.text;
   ano := dbseAno.text;

   xWhere := 'MESIDR=''' + mes + '''';
   mesdes := DM1.DisplayDescrip('dspTGE', 'TGE181', 'MESDESL', XWHERE, 'MESDESL');

  //pplblAnoMes.Caption  :=mesdes+' '+ano;
   pplblNoCompro.Caption := xxNoReg;
   pplblDesEstado.caption := 'Previo';

  {TMoneda := 'DM1.DisplayDescrip('dspTGE','TGE103','TMON_LOC','TMONID='+quotedstr(dblcTMon.text),'TMON_LOC');
  MONABR:= DM1.DisplayDescrip('dspTGE','TGE103','TMONABR','TMONID='+quotedstr(dblcTMon.text),'TMONABR');

  If TMoneda = 'L' then
  begin
     pplblMonedaDoc.Visible := false;
     ppdbMtoExt.Visible:= false;
     pplblCntTCambio.Visible:= false;
     ppdbCntTCambio.Visible:= false;
  end;}

  // DM1.cdsDetCxP.DisableControls;
   xTotHaber := 0;
   DM1.cdsReporte.First;
   While Not DM1.cdsReporte.Eof Do
   Begin
      If DM1.cdsReporte.FieldByName('CNTDH').AsString = 'H' Then
         xTotHaber := xTotHaber + DM1.FRound(DM1.cdsReporte.Fieldbyname('CNTMTOORI').AsFloat, 15, 2);
      DM1.cdsReporte.Next;
   End;
   DM1.cdsReporte.First;
   pplblMontoImporte.Caption := MONABR + ' ' + FloatToStrF(xTotHaber, ffNumber, 15, 2);

  //pplblMonedaDoc.Caption:= MONABR;
   pplblCiades.Caption := dbeCIA.text;
  //pplblCodProv.Caption 	:= dblcdProv.Text;
   pplblDiarioDes.Caption := DM1.DisplayDescrip('prvSQL', 'TGE104', 'TDIARDES', 'TDIARID=' + QuotedStr(TDiario), 'TDIARDES');
   pplblTDiario.Caption := TDiario;
  //pplblTipoCamb.Caption 	:= pplblTipoCamb.Caption;
  //pplblNoCompro.Caption 	:= meNoReg.text ;
   pplblProveedor.Caption := '';
   pplblCodProv.Caption := '';
  //pplblMonedaDes.caption  := DM1.DisplayDescrip('dspTGE','TGE103','TMONDES','TMONID='+quotedstr(dblcTMon.text),'TMONDES');
   pplblGlosaDes.caption := '';

  //DM1.cdsCxP.IndexFieldNames:='CNTREG';
   Screen.Cursor := crDefault;
 //Diseno.Report:=ppReporte;
 //Diseno.Show;
   ppReporte.Print;
   ppReporte.Stop;
   ppData.DataSource := Nil;

  {DM1.cdsCxP.IndexFieldNames:='';
  DM1.cdsCxP.Close;
  DM1.cdsMovCnt.Close;}
End;

Procedure TFToolDinCtbl.ppReportePreviewFormCreate(Sender: TObject);
Begin
   ppReporte.PreviewForm.ClientHeight := 500;
   ppReporte.PreviewForm.ClientWidth := 650;
   TppViewer(ppReporte.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolDinCtbl.dblcCIAExit(Sender: TObject);
Begin
   dbeCia.Text := DM1.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.Text), 'CIADES');
End;

Procedure TFToolDinCtbl.dbseMesExit(Sender: TObject);
Begin
   dbseMes.Text := DM1.StrZero(dbseMes.Text, 2);
End;

End.

