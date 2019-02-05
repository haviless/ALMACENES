Unit ALM_001;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Wwkeycb, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons,
   Spin, wwdblook, fcLabel, ExtCtrls, db, fcButton, fcImgBtn, fcShapeBtn;

Type
   TFGRemSalidasAlm = Class(TForm)
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
      Procedure fcsbtnGuiaNuevaClick(Sender: TObject);
      Procedure fcbtnEditaGuiaClick(Sender: TObject);
      Procedure dbgGuiaTitleButtonClick(Sender: TObject; AFieldName: String);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure isBuscaExit(Sender: TObject);
      Procedure dbgGuiaDblClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FGRemSalidasAlm: TFGRemSalidasAlm;

Implementation

Uses ALMDM1, ALM220, ALM222, ALM201IN;

{$R *.dfm}

Procedure TFGRemSalidasAlm.bbtnFiltraClick(Sender: TObject);
Var
   xSQL, xMes: String;
Begin
   xMes := DMALM.StrZero(IntToStr(seAno.Value), 4) + DMALM.strzero(IntToStr(seMes.Value), 2);

   xSQL := 'Select * FROM LOG314 '
      + 'Where CIAID like ''' + dblcCia.Text + '%'' and NISANOMM=''' + xMes + ''' '
      + 'and NISATIP=''SALIDA'' '
      + 'ORDER BY CIAID, NISAID';
   DMALM.cdsNIS.Close;
   DMALM.cdsNIS.DataRequest(xSQL);
   DMALM.cdsNIS.Open;

   dbgGuia.DataSource := DMALM.dsNIS;
End;

Procedure TFGRemSalidasAlm.dblcCIANotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFGRemSalidasAlm.FormCreate(Sender: TObject);
Var
   D, M, Y: Word;
Begin
   cCiaGuia := '02';
   DecodeDate(Date, Y, M, D);
   seAno.Value := Y;
   seMes.Value := M;
   bbtnFiltraClick(Self);
End;

Procedure TFGRemSalidasAlm.dblcCIAExit(Sender: TObject);
Begin
   dbeCIA.text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.text), 'CIADES');
End;

Procedure TFGRemSalidasAlm.fcsbtnGuiaNuevaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMALM.cdsNIS.RecordCount <= 0 Then
   Begin
      ShowMessage('No exiten Nota(s) de Salida para Generar Guía de Remisión');
      Exit;
   End;

   If DMALM.cdsNIS.FieldByName('CIAID').AsString <> cCiaGuia Then
   Begin
      ShowMessage('Guia de Remisión solo se usa para Compañía ' + cCiaGuia);
      Exit;
   End;

   If DMALM.cdsNIS.FieldByName('NISSIT').AsString <> 'ACEPTADO' Then
   Begin
      ShowMessage('Notas de Salida tiene que estar Aceptada');
      Exit;
   End;

   xSQL := 'Select * from LOG_GUI_REM '
      + 'Where CIAID=''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' '
      + 'and TINID=''' + DMALM.cdsNIS.FieldByName('TINID').AsString + ''' '
      + 'and NISAID=''' + DMALM.cdsNIS.FieldByName('NISAID').AsString + ''' '
      + 'and ESTADO<>''ANULADO'' '
      + 'Order by SERGUIA, NUMGUIA';
   DMALM.cdsMovCNT.Close;
   DMALM.cdsMovCNT.DataRequest(xSQL);
   DMALM.cdsMovCNT.Open;

   cFActivo := 'N';
   If DMALM.cdsMovCNT.RecordCount > 0 Then
   Begin
      ShowMessage('Nota de Salida Tiene Generada(s) Guia(s) de Remisión');
      Try
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
         DMALM.wModoGuia := 'A';
         FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
         FGuiaRemisionALM.ShowModal;
      Finally
         FGuiaRemisionALM.Free;
      End;
   End;
End;

Procedure TFGRemSalidasAlm.fcbtnEditaGuiaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMALM.cdsNIS.RecordCount <= 0 Then
   Begin
      ShowMessage('No exiten Nota(s) de Salida');
      Exit;
   End;

   If DMALM.cdsNIS.FieldByName('CIAID').AsString <> cCiaGuia Then
   Begin
      ShowMessage('Guia de Remisión solo se usa para Compañía ' + cCiaGuia);
      Exit;
   End;

   xSQL := 'Select * from LOG_GUI_REM '
      + 'Where CIAID=''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' '
      + 'and TINID=''' + DMALM.cdsNIS.FieldByName('TINID').AsString + ''' '
      + 'and NISAID=''' + DMALM.cdsNIS.FieldByName('NISAID').AsString + ''' '
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

Procedure TFGRemSalidasAlm.dbgGuiaTitleButtonClick(Sender: TObject;
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

Procedure TFGRemSalidasAlm.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFGRemSalidasAlm.isBuscaExit(Sender: TObject);
Begin
   pnlBusca.Visible := False;
End;

Procedure TFGRemSalidasAlm.dbgGuiaDblClick(Sender: TObject);
Var
   xSQL, sCIA, sLOC, sALM, sNIS, sTDO, sSQL, sTIP: String;
Begin
   If DMALM.cdsNIS.RecordCount = 0 Then
   Begin
      ShowMessage('Error : No Existen Registros a Editar');
      exit;
   End;

   Try
      Screen.Cursor := crHourGlass;

      xSQL := 'SELECT * FROM LOG315 WHERE ' +
         'NISATIP=''SALIDA'' ' +
         'AND NISAID=''' + DMALM.cdsNIS.FieldByName('NISAID').AsString + ''' ' +
         'AND CIAID =''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' ' +
         'AND LOCID =''' + DMALM.cdsNIS.FieldByName('LOCID').AsString + ''' ' +
         'AND TINID =''' + DMALM.cdsNIS.FieldByName('TINID').AsString + ''' ' +
         'AND ALMID =''' + DMALM.cdsNIS.FieldByName('ALMID').AsString + ''' ' +
         'AND TDAID =''' + DMALM.cdsNIS.FieldByName('TDAID').AsString + ''' ORDER BY KDXID';
      DMALM.cdsKDX.Filter := '';
      DMALM.cdsKDX.Filtered := False;
      DMALM.cdsKDX.IndexFieldNames := '';
      DMALM.cdsKDX.Close;
      DMALM.cdsKDX.DataRequest(xSQL);
      DMALM.cdsKDX.Open;
      DMALM.cdsNIS.Edit;

      FRegNtaSAL := TFRegNtaSAL.create(self);
      FRegNtaSAL.Edita;
      FRegNtaSAL.xCCosto := 0;
      Screen.Cursor := crDefault;

      FRegNtaSAL.dblcCIA.Enabled := False;
      FRegNtaSAL.dblcLOC.Enabled := False;
      FRegNtaSAL.dblcTInv.Enabled := False;
      FRegNtaSAL.dblcdCC.Enabled := False;
      FRegNtaSAL.dbdtpFNS.Enabled := False;
      FRegNtaSAL.dblcTALM.Enabled := False;
      FRegNtaSAL.dblcTDA.Enabled := False;
      FRegNtaSAL.dblcTransac.Enabled := False;
      FRegNtaSAL.dbeNumNISA.Enabled := False;

      FRegNtaSAL.wOperacion := 'MOD';
      FRegNtaSAL.wRegraNro := '1MOD';
      FRegNtaSAL.Visible := False;
      FRegNtaSAL.ShowModal;
   Finally
      FRegNtaSAL.Free;
      dblcCia.Text := cCiaGuia;
      dblcCIAExit(Self);
   End;

End;

Procedure TFGRemSalidasAlm.FormActivate(Sender: TObject);
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

Procedure TFGRemSalidasAlm.Z2bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

End.

