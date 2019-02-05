Unit ALM222;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
   Spin, wwdblook, Wwkeycb, ppEndUsr, ppParameter, ppBands, ppStrtch,
   ppMemo, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
   ppRelatv, ppDB, ppDBPipe, DB, MsgDlgs;

Type
   TFGuiaConsulta = Class(TForm)
      dbgGuia: TwwDBGrid;
      Panel1: TPanel;
      Panel2: TPanel;
      fcLabel1: TfcLabel;
      Z2bbtnSalir: TBitBtn;
      pnlBusca: TPanel;
      lblBusca1: TLabel;
      lblBusca2: TLabel;
      isBusca: TwwIncrementalSearch;
      lblCIA: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      seAno: TSpinEdit;
      seMes: TSpinEdit;
      Label1: TLabel;
      bbtnFiltra: TBitBtn;
      Z2bbtnPrint: TBitBtn;
      ppdbCab: TppDBPipeline;
      ppr1: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDBText4: TppDBText;
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
      ppDBText17: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppDBMemo1: TppDBMemo;
      ppDBText18: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLabel1: TppLabel;
      ppParameterList1: TppParameterList;
      ppd1: TppDesigner;
      bbtnAnula: TBitBtn;
      BitBtn1: TBitBtn;
      BitBtn2: TBitBtn;
      Bevel1: TBevel;
      Label2: TLabel;
      Procedure dbgGuiaTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure FormActivate(Sender: TObject);
      Procedure dbgGuiaDblClick(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure bbtnFiltraClick(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure isBuscaExit(Sender: TObject);
      Procedure Z2bbtnPrintClick(Sender: TObject);
      Procedure dbgGuiaKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure bbtnAnulaClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
   Private
    { Private declarations }
      cCia: String;
      cSerie: String;
      cNumGuiaN: String;
      Function Anular_Numero: Boolean;
      Function ExisteGuiaRemision(cCia, cSer, cNum: String): Boolean;
   Public
    { Public declarations }
   End;

Var
   cCiaGuia: String;
   cFActivo: String;
   FGuiaConsulta: TFGuiaConsulta;

Implementation

{$R *.dfm}

//USES ALM_DM, ALM220, ALM224, ALM_001, ALM226;
Uses ALMDM1, ALM220, ALM224, ALM_001, ALM226;
//USES ALMDM1, ALM220, ALM224;

Procedure TFGuiaConsulta.dbgGuiaTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   If (AFieldName = 'NUMGUIA') Or (AFieldName = 'RAZSOC') Or (AFieldName = 'RAZSOC') Then
   Begin
      pnlBusca.Visible := True;
      isBusca.SearchField := AFieldName;
      dbgGuia.SetActiveField(AFieldName);
      DMALM.cdsMovCNT.IndexFieldNames := AFieldName;

      If AFieldName = 'NUMGUIA' Then lblBusca2.caption := 'Guia de Remisión';
      If AFieldName = 'RAZSOC' Then lblBusca2.caption := 'Nombre o Razón Social';
      If AFieldName = 'NISAID' Then lblBusca2.caption := 'Numero de Guia';

      isBusca.SetFocus;
   End;
End;

Procedure TFGuiaConsulta.FormActivate(Sender: TObject);
Var
   D, M, Y: Word;
Begin
   dblcCia.Text := '02';
   cCiaGuia := '02';
   dblcCIAExit(Self);
   DecodeDate(Date, Y, M, D);
   seAno.Value := Y;
   seMes.Value := M;
   bbtnFiltraClick(Self);
End;

Procedure TFGuiaConsulta.dbgGuiaDblClick(Sender: TObject);
Begin
   Try
      If DMALM.cdsMovCNT.FieldByName('ORIGEN').AsString = 'AF' Then
         cFActivo := 'S'
      Else
         cFActivo := 'N';

      DMALM.wModoGuia := 'M';

      FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
      FGuiaRemisionALM.ShowModal;
   Finally
      FGuiaRemisionALM.Free;
   End;

   bbtnFiltraClick(Self);

End;

Procedure TFGuiaConsulta.dblcCIAExit(Sender: TObject);
Begin
   dbeCIA.text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.text), 'CIADES');
End;

Procedure TFGuiaConsulta.bbtnFiltraClick(Sender: TObject);
Var
   xSQL, xMes: String;
Begin
   cCiaGuia := '02';

   xMes := DMALM.StrZero(IntToStr(seAno.Value), 4) + DMALM.strzero(IntToStr(seMes.Value), 2);

   xSQL := 'Select * from LOG_GUI_REM '
      + 'Where CIAID like ''' + dblcCia.Text + '%'' and GUIAANOMES=''' + xMes + ''' '
      + 'ORDER BY CIAID, SERGUIA, NUMGUIA DESC';
   DMALM.cdsMovCNT.Close;
   DMALM.cdsMovCNT.IndexFieldNames := '';
   DMALM.cdsMovCNT.DataRequest(xSQL);
   DMALM.cdsMovCNT.Open;

 //(DMALM.cdsMovCNT.FieldByName('FECGUIA') AS TDateTimeField).DisplayFormat:= 'dd/mm/yyyy';
   dbgGuia.DataSource := DMALM.dsMovCNT;
End;

Procedure TFGuiaConsulta.Z2bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFGuiaConsulta.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFGuiaConsulta.isBuscaExit(Sender: TObject);
Begin
   pnlBusca.Visible := False;
End;

Procedure TFGuiaConsulta.Z2bbtnPrintClick(Sender: TObject);
Var
   xSQL, xMes: String;
   x10: Integer;
Begin

   xMes := DMALM.StrZero(IntToStr(seAno.Value), 4) + DMALM.strzero(IntToStr(seMes.Value), 2);

   xSQL := 'Select A.*, B.DPTODES, C.CIUDDES, D.ZIPDES, E.TRIDES, '
      + '''' + dbeCIA.Text + ''' CIADES, ''' + seAno.Text + DMALM.StrZero(seMes.Text, 2) + ''' PERIODO '
       //INICIO SAR666
       //+'From LOG_GUI_REM A, TGE158 B, TGE121 C, TGE122 D, TGE208 E '
   + 'From LOG_GUI_REM A, TGE158 B, TGE121 C, TGE122 D, (SELECT TGE208.* FROM  TGE208 WHERE TGE208.TRISGT = ' + QuotedStr('S') + ' ) E '
       //FIN SAR666
   + 'Where CIAID like ''%' + dblcCia.Text + '%'' and GUIAANOMES=''' + xMes + ''' '
      + 'and ESTADO IN (''ACEPTADO'',''ANULADO'') '
      + 'and A.DPTOID=B.DPTOID(+) '
      + 'and A.DPTOID=C.DPTOID(+) AND A.CIUDID=C.CIUDID(+) '
      + 'and A.DPTOID=D.DPTOID(+) AND A.CIUDID=D.CIUDID(+) AND A.ZIPID=D.ZIPID(+) '
      + 'and A.TRIID=E.TRIID(+) '
      + 'ORDER BY CIAID, SERGUIA, NUMGUIA';
   DMALM.cdsQry8.Close;
   DMALM.cdsQry8.DataRequest(xSQL);
   DMALM.cdsQry8.Open;

   ppdbCab.DataSource := DMALM.dsQry8;
   ppr1.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\GuiaRemisionMes.rtm';
   ppr1.Template.LoadFromFile;
   Screen.Cursor := crDefault;

   If DMALM.wUsuario = 'HNORIEGA' Then
      ppd1.ShowModal
   Else
      ppr1.Print;

   ppr1.Stop;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
   ppdbCab.DataSource := Nil;
   DMALM.cdsQry8.Close;
End;

Procedure TFGuiaConsulta.dbgGuiaKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Var
   xSQL: String;
Begin
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin

      If DMALM.cdsMovCNT.FieldByName('ESTADO').AsString <> 'INICIAL' Then
      Begin
         ShowMessage('Solo se Puede Eliminar Guia en Estado Inicial');
         Exit;
      End;

      If Question(Caption, 'Este Proceso: ' + #13 + #13 +
         'Elimina la Guia de Remisión ' + #13 + #13 + #13 + 'Desea Continuar ') Then
      Begin
         xSQL := 'delete from LOG_GUI_REM '
            + 'Where CIAID=''' + DMALM.cdsMovCNT.FieldByName('CIAID').AsString + ''' '
            + 'and TINID=''' + DMALM.cdsMovCNT.FieldByName('TINID').AsString + ''' '
            + 'and NISAID=''' + DMALM.cdsMovCNT.FieldByName('NISAID').AsString + ''' '
            + 'and ESTADO=''INICIAL'' ';
         DMALM.cdsTGE.Close;
         DMALM.cdsTGE.DataRequest(xSQL);
         DMALM.cdsTGE.Execute;

         bbtnFiltraClick(Self);
         ShowMessage('Guia Eliminada');
      End;
   End;
End;

Procedure TFGuiaConsulta.bbtnAnulaClick(Sender: TObject);
Var
   xsSQL: String;
Begin

   If dblcCia.Text = '' Then
   Begin
      ShowMessage('Debe Seleccionar Compañia');
      Exit;
   End;

   cCia := dblcCia.Text;

   xSQL := 'select SERIEID from FAC103 A WHERE CIAID=''' + cCia + ''' and FLAGV=''G''';
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;

   If DMALM.cdsQry.FieldByName('SERIEID').AsString = '' Then
   Begin
      ShowMessage('Error : No existe Serie para Guia de Remision');
      Close;
      Exit;
   End;
   cSerie := DMALM.cdsQry.FieldByName('SERIEID').AsString;

   xSQL := 'Select * from LOG_GUI_REM '
      + 'Where CIAID=''' + cCia + ''' and SERGUIA=''' + cSerie + ''' and NUMGUIA=''XYZ''';
   DMALM.cdsCnt300.Close;
   DMALM.cdsCnt300.DataRequest(xSQL);
   DMALM.cdsCnt300.Open;

   DMALM.cdsCnt300.Insert;
   DMALM.cdsCnt300.FieldByName('CIAID').AsString := cCia;
   DMALM.cdsCnt300.FieldByName('SERGUIA').AsString := cSerie;

   Try
      fNumOk := False;
      FGuiaNum := TFGuiaNum.Create(Self);
      FGuiaNum.lblTit1.Caption := 'Anular Número de Guía';
      FGuiaNum.lblTit2.Caption := '';
      FGuiaNum.lblTit3.Caption := 'Número';
      FGuiaNum.ShowModal;
      cNumGuiaN := FGuiaNum.dbeNumGuia.Text;

      If ExisteGuiaRemision(DMALM.cdsCnt300.FieldByName('CIAID').AsString,
         DMALM.cdsCnt300.FieldByName('SERGUIA').AsString,
         cNumGuiaN) Then
      Begin
         ShowMessage('Numero de Guia ya fue Usado');
         fNumOk := False;
      End;
   Finally
      If fNumOk Then
      Begin
         If Anular_Numero Then
         Begin
            Try
               bbtnFiltraClick(Self);
               ShowMessage('Número de Guía Remisión Anulada');
            Except
               ShowMessage('Error al Grabar');
            End
         End
         Else
         Begin
            ShowMessage('Error al Grabar');
         End;
      End;
      FGuiaNum.Free;
   End;
End;

Function TFGuiaConsulta.Anular_Numero: Boolean;
Var
   xSQL: String;
Begin

   Result := False;

   xSQL := 'Select * from LOG_GUI_REM '
      + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
      + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
      + 'and NUMGUIA=''' + cNumGuiaN + '''';
   DMALM.cdsCnt300.Close;
   DMALM.cdsCnt300.DataRequest(xSQL);
   DMALM.cdsCnt300.Open;

   DMALM.cdsCnt300.Insert;
   DMALM.cdsCnt300.FieldByName('CIAID').AsString := cCia;
   DMALM.cdsCnt300.FieldByName('FECGUIA').AsDateTime := DateS;
   DMALM.cdsCnt300.FieldByName('SERGUIA').AsString := cSerie;
   DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString := cNumGuiaN;
   DMALM.cdsCnt300.FieldByName('USUARIO').AsString := DMALM.wUsuario;
   DMALM.cdsCnt300.FieldByName('FECREGGUIA').AsDateTime := DateS + SysUtils.Time;
   DMALM.cdsCnt300.FieldByName('ESTADO').AsString := 'ANULADO';
   DMALM.cdsCnt300.FieldByName('FECANUGUIA').AsDateTime := Date + SysUtils.Time;
   DMALM.cdsCnt300.FieldByName('GUIAANOMES').AsString := Copy(DMALM.cdsCnt300.FieldByName('FECGUIA').AsString, 7, 4) + Copy(DMALM.cdsCnt300.FieldByName('FECGUIA').AsString, 4, 2);
   DMALM.cdsPost(DMALM.cdsCnt300);
   DMALM.cdsCnt300.Post;

   If DMALM.cdsCnt300.ApplyUpdates(0) > 0 Then
   Begin
      DMALM.cdsCnt300.Close;
      ShowMessage('Error al Grabar');
      Exit;
   End;

   Result := true;
End;

Function TFGuiaConsulta.ExisteGuiaRemision(cCia, cSer, cNum: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT NUMGUIA FROM LOG_GUI_REM '
      + 'Where CIAID=''' + cCia + ''' and SERGUIA=''' + cSer + ''' and NUMGUIA=''' + cNum + '''';

   DMALM.cdsTGE.Close;
   DMALM.cdsTGE.DataRequest(xSQL);
   DMALM.cdsTGE.Open;

   If DMALM.cdsTGE.RecordCount <= 0 Then
      Result := False
   Else
      Result := True;
End;

Procedure TFGuiaConsulta.BitBtn1Click(Sender: TObject);
Begin
   FGRemSalidasAlm := TFGRemSalidasAlm.Create(self);
   Try
      FGRemSalidasAlm.ShowModal;
   Finally
      FGRemSalidasAlm.free;
   End;
   bbtnFiltraClick(self);
End;

Procedure TFGuiaConsulta.BitBtn2Click(Sender: TObject);
Begin
   FTraslados := TFTraslados.Create(self);
   Try
      FTraslados.ShowModal;
   Finally
      FTraslados.free;
   End;
   bbtnFiltraClick(self);
End;

End.

