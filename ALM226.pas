Unit ALM226;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, Wwkeycb, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons,
   Spin, wwdblook, fcLabel, ExtCtrls, db, fcButton, fcImgBtn, fcShapeBtn;

Type
   TFTraslados = Class(TForm)
      Panel1: TPanel;
      fcLabel1: TfcLabel;
      lblCIA: TLabel;
      Label1: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      seAno: TSpinEdit;
      seMes: TSpinEdit;
      bbtnFiltra: TBitBtn;
      dbgGuia: TwwDBGrid;
      Panel2: TPanel;
      Z2bbtnSalir: TBitBtn;
      pnlBusca: TPanel;
      lblBusca1: TLabel;
      lblBusca2: TLabel;
      isBusca: TwwIncrementalSearch;
      Z2bbtnPrint: TBitBtn;
      GroupBox1: TGroupBox;
      fcsbtnGuiaNueva: TfcShapeBtn;
      fcbtnEditaGuia: TfcShapeBtn;
      Procedure bbtnFiltraClick(Sender: TObject);
      Procedure dblcCIANotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dbgGuiaTitleButtonClick(Sender: TObject; AFieldName: String);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure isBuscaExit(Sender: TObject);
      Procedure dbgGuiaDblClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure fcsbtnGuiaNuevaClick(Sender: TObject);
      Procedure fcbtnEditaGuiaClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   cCiaGuia: String;
   FTraslados: TFTraslados;

Implementation

Uses ALMDM1, ALM220, ALM222, ALM201IN;

{$R *.dfm}

Procedure TFTraslados.bbtnFiltraClick(Sender: TObject);
Var
   xSQL, cDiaIni, cDiaFin, cIniMS: String;
   nMes, nAno: Integer;
Begin
   cDiaIni := '01/' + DMALM.strzero(IntToStr(seMes.Value), 2) + '/' + DMALM.StrZero(IntToStr(seAno.Value), 4);

   If seMes.Value = 12 Then
      nMes := 1
   Else
      nMes := seMes.Value + 1;
   If seMes.Value = 12 Then
      nAno := seAno.Value + 1
   Else
      nAno := seAno.Value;

   cDiaFin := DateToStr(StrToDate('01/' + DMALM.strzero(IntToStr(nMes), 2) + '/' + DMALM.StrZero(IntToStr(nAno), 4)) - 1);

   xSQL := 'Select ''02'' CIAID, A.* FROM ACF320 A '
      + 'Where FECTRAS>=''' + cDiaIni + ''' and FECTRAS<=''' + cDiaFin + ''' '
      + 'ORDER BY NUMDOC';
   DMALM.cdsNIS.Close;
   DMALM.cdsNIS.DataRequest(xSQL);
   DMALM.cdsNIS.Open;

   dbgGuia.DataSource := DMALM.dsNIS;
End;

Procedure TFTraslados.dblcCIANotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFTraslados.FormCreate(Sender: TObject);
Var
   D, M, Y: Word;
Begin
   cCiaGuia := '02';
   DecodeDate(Date, Y, M, D);
   seAno.Value := Y;
   seMes.Value := M;
   bbtnFiltraClick(Self);
End;

Procedure TFTraslados.dblcCIAExit(Sender: TObject);
Begin
   dbeCIA.text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.text), 'CIADES');
End;

Procedure TFTraslados.dbgGuiaTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   If (AFieldName = 'NISAID') Or (AFieldName = 'RAZSOC') Or (AFieldName = 'RAZSOC') Then
   Begin
      pnlBusca.Visible := True;
      isBusca.SearchField := AFieldName;
      dbgGuia.SetActiveField(AFieldName);
      DMALM.cdsNIS.IndexFieldNames := AFieldName;

      If AFieldName = 'NISAID' Then lblBusca2.caption := 'Nota de Salida';
      If AFieldName = 'RAZSOC' Then lblBusca2.caption := 'Nombre o Razón Social';
      If AFieldName = 'NISAID' Then lblBusca2.caption := 'Numero de Guia';

      isBusca.SetFocus;
   End;
End;

Procedure TFTraslados.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFTraslados.isBuscaExit(Sender: TObject);
Begin
   pnlBusca.Visible := False;
End;

Procedure TFTraslados.dbgGuiaDblClick(Sender: TObject);
Var
   xSQL, sCIA, sLOC, sALM, sNIS, sTDO, sSQL, sTIP: String;
Begin
{
   if DM1.cdsNIS.RecordCount = 0 then
   begin
      ShowMessage('Error : No Existen Registros a Editar');
      exit;
   end;

   try
      Screen.Cursor:=crHourGlass;

      xSQL:='SELECT * FROM LOG315 WHERE '+
          'NISATIP=''SALIDA'' '+
          'AND NISAID='''+DM1.cdsNIS.FieldByName('NISAID').AsString+''' '+
          'AND CIAID ='''+DM1.cdsNIS.FieldByName('CIAID').AsString +''' '+
          'AND LOCID ='''+DM1.cdsNIS.FieldByName('LOCID').AsString +''' '+
          'AND TINID ='''+DM1.cdsNIS.FieldByName('TINID').AsString +''' '+
          'AND ALMID ='''+DM1.cdsNIS.FieldByName('ALMID').AsString +''' '+
          'AND TDAID ='''+DM1.cdsNIS.FieldByName('TDAID').AsString +''' ORDER BY KDXID';
      DM1.cdsKDX.Filter:='';
      DM1.cdsKDX.Filtered:=False;
      DM1.cdsKDX.IndexFieldNames:='';
      DM1.cdsKDX.Close;
      DM1.cdsKDX.DataRequest(xSQL);
      DM1.cdsKDX.Open;
      DM1.cdsNIS.Edit;

      FRegNtaSAL := TFRegNtaSAL.create( self );
      FRegNtaSAL.Edita;
      FRegNtaSAL.xCCosto := 0;
      Screen.Cursor:=crDefault;

      FRegNtaSAL.dblcCIA.Enabled    := False;
      FRegNtaSAL.dblcLOC.Enabled    := False;
      FRegNtaSAL.dblcTInv.Enabled   := False;
      FRegNtaSAL.dblcdCC.Enabled    := False;
      FRegNtaSAL.dbdtpFNS.Enabled  := False;
      FRegNtaSAL.dblcTALM.Enabled   := False;
      FRegNtaSAL.dblcTDA.Enabled    := False;
      FRegNtaSAL.dblcTransac.Enabled:= False;
      FRegNtaSAL.dbeNumNISA.Enabled := False;

      FRegNtaSAL.wOperacion:='MOD';
      FRegNtaSAL.wRegraNro:='1MOD';
      FRegNtaSAL.ShowModal;
   finally
      FRegNtaSAL.Free;
      dblcCia.Text:=cCiaGuia;
      dblcCIAExit(Self);
   end;
}
End;

Procedure TFTraslados.FormActivate(Sender: TObject);
Var
   D, M, Y: Word;
Begin
   dblcCia.Text := cCiaGuia;
   dblcCIAExit(Self);
   DecodeDate(Date, Y, M, D);
   seAno.Value := Y;
   seMes.Value := M;
   bbtnFiltraClick(Self);
End;

Procedure TFTraslados.Z2bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFTraslados.fcsbtnGuiaNuevaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMALM.cdsNIS.RecordCount <= 0 Then
   Begin
      ShowMessage('No exiten Traslado(s) de Activo Fijo para Generar Guía de Remisión');
      Exit;
   End;

   If DMALM.cdsNIS.FieldByName('ACEPTADO').AsString <> 'S' Then
   Begin
      ShowMessage('Traslado de Activo tiene que estar Aceptada');
      Exit;
   End;

   xSQL := 'Select * from LOG_GUI_REM '
      + 'Where ORIGEN=''AF'' '
      + 'and NISAID=''' + DMALM.cdsNIS.FieldByName('NUMDOC').AsString + ''' '
      + 'and ESTADO<>''ANULADO'' '
      + 'Order by SERGUIA, NUMGUIA';
   DMALM.cdsMovCNT.Close;
   DMALM.cdsMovCNT.DataRequest(xSQL);
   DMALM.cdsMovCNT.Open;

   If DMALM.cdsMovCNT.RecordCount > 0 Then
   Begin
      ShowMessage('Traslado de Activo Tiene Generada(s) Guia(s) de Remisión');
      Try
         cFActivo := 'S';
         DMALM.wModoGuia := 'M';

         FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
         FGuiaRemisionALM.ShowModal;
      Finally
         FGuiaRemisionALM.Free;
      End;

   End
   Else
   Begin
      Try
         cFActivo := 'S';
         DMALM.wModoGuia := 'A';
         FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
         FGuiaRemisionALM.ShowModal;
      Finally
         FGuiaRemisionALM.Free;
      End;
   End;
End;

Procedure TFTraslados.fcbtnEditaGuiaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMALM.cdsNIS.RecordCount <= 0 Then
   Begin
      ShowMessage('No exiten Traslado(s) de Activo Fijo para Generar Guía de Remisión');
      Exit;
   End;

   If DMALM.cdsNIS.FieldByName('ACEPTADO').AsString <> 'S' Then
   Begin
      ShowMessage('Traslado de Activo tiene que estar Aceptada');
      Exit;
   End;

   xSQL := 'Select * from LOG_GUI_REM '
      + 'Where ORIGEN=''AF'' '
      + 'and NISAID=''' + DMALM.cdsNIS.FieldByName('NUMDOC').AsString + ''' '
      + 'and ESTADO<>''ANULADO'' '
      + 'Order by SERGUIA, NUMGUIA';
   DMALM.cdsMovCNT.Close;
   DMALM.cdsMovCNT.DataRequest(xSQL);
   DMALM.cdsMovCNT.Open;

   If DMALM.cdsMovCNT.RecordCount <= 0 Then
   Begin
      ShowMessage('Traslado de Activo No Tiene Generada(s) Guia(s) de Remisión');
      Exit;
   End;

   Try
      cFActivo := 'S';
      DMALM.wModoGuia := 'M';

      FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
      FGuiaRemisionALM.ShowModal;
   Finally
      FGuiaRemisionALM.Free;
   End;
End;

End.

