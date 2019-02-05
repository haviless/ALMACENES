Unit ALM442;

// Actualizaciones
// HPC_201502_ALM  20/06/2015 Se añadió exportación al excel de información del reporte.
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, wwdblook, ppEndUsr,
   ppBands, ppCache, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, DB, ppCtrls, ppVar, ppPrnabl, ppParameter, Mask, wwdbedit,
   ExtCtrls, Wwdbdlg, Grids, DBGrids;

Type
   TFMovPorArticulo = Class(TForm)
      Label2: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      Label5: TLabel;
      dblcTInv: TwwDBLookupCombo;
      edtTinv: TEdit;
      gbRango: TGroupBox;
      Label1: TLabel;
      dtpInicio: TwwDBDateTimePicker;
      Label3: TLabel;
      dtpFin: TwwDBDateTimePicker;
      bbtnRep2: TBitBtn;
      ppdb1: TppDBPipeline;
      ppr1: TppReport;
      ppd1: TppDesigner;
      ppParameterList1: TppParameterList;
      ppHeaderBand2: TppHeaderBand;
      ppDBText1: TppDBText;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppDBText12: TppDBText;
      ppLabel18: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText11: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc2: TppDBCalc;
      ppLabel15: TppLabel;
      ppLabel17: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppLabel1: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc1: TppDBCalc;
      ppDBText10: TppDBText;
      ppDBCalc3: TppDBCalc;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppLabel14: TppLabel;
      ppLabel16: TppLabel;
      gbOpcional: TGroupBox;
      Label4: TLabel;
      dblcAlmacen: TwwDBLookupCombo;
      edtAlmacen: TEdit;
      dbcldArti: TwwDBLookupComboDlg;
      rgTipo: TRadioGroup;
      dbeArti: TwwDBEdit;
      cbReporte: TCheckBox;
      dtgData: TDBGrid;
      Procedure bbtnRep2Click(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcTInvExit(Sender: TObject);
      Procedure dblcAlmacenExit(Sender: TObject);
      Procedure dblcAlmacenEnter(Sender: TObject);
      Procedure dblcTInvEnter(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dbcldArtiExit(Sender: TObject);
      Procedure dbcldArtiEnter(Sender: TObject);
      Procedure dblcTInvNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcAlmacenNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FMovPorArticulo: TFMovPorArticulo;
   xHojaCalculo: Boolean;

Implementation

{$R *.dfm}

Uses ALMDM1;

Procedure TFMovPorArticulo.bbtnRep2Click(Sender: TObject);
Var
   x10: integer;
   xSQL, cIngSal, cTitulo, cTitAlm: String;
Begin
   If dblcCia.text = '' Then
   Begin
      dblcCia.enabled := True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   End;

   If dblcTInv.text = '' Then
   Begin
      dblcTInv.enabled := True;
      dblcTInv.SetFocus;
      Raise Exception.Create('Ingrese el Tipo de Inventario');
   End;

   If dtpInicio.date = 0 Then
   Begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   End;

   If dtpFin.date = 0 Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   End;

   If dtpFin.date < dtpInicio.date Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   End;

   If dbcldArti.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar el Articulo');
      Exit;
   End;

   If dbeArti.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar el Articulo');
      Exit;
   End;

   xHojaCalculo := False;
   If MessageDlg('¿Importar a Excel?   ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      xHojaCalculo := True;

   If rgTipo.ItemIndex = 0 Then cIngSal := 'AND A.NISATIP=''INGRESO'' ';
   If rgTipo.ItemIndex = 1 Then cIngSal := 'AND A.NISATIP=''SALIDA'' ';
   If rgTipo.ItemIndex = 2 Then cIngSal := '';
   If rgTipo.ItemIndex = 0 Then cTitulo := 'INGRESOS DE ALMACEN';
   If rgTipo.ItemIndex = 1 Then cTitulo := 'SALIDAS DE ALMACEN';
   If rgTipo.ItemIndex = 2 Then cTitulo := 'INGRESOS Y SALIDAS DE ALMACEN';

   If dblcAlmacen.Text = '' Then
      cTitAlm := 'Todos los Almacenes'
   Else
      cTitAlm := 'Almacen : ' + dblcAlmacen.Text + ' - ' + edtAlmacen.Text;

   Screen.Cursor := crHourGlass;

// Inicio HPC_201502_ALM
   xSQL := 'Select A.CIAID, B.CIADES, A.LOCID, A.TINID, A.ALMID, C.ALMDES, A.TDAID, '
      + '       A.TRIID, D.TRIDES, A.NISATIP, A.NISAID, A.NISAFREG, A.PROV, '
      + '       A.ARTID, A.ARTDES, A.KDXCNTG, A.ARTPCG, A.ARTTOTALG, '
      + '       CASE WHEN A.NISATIP=''INGRESO'' THEN KDXCNTG ELSE 0 END INGRESOS, '
      + '       CASE WHEN A.NISATIP=''SALIDA''  THEN KDXCNTG ELSE 0 END SALIDAS, '
      + '       CASE WHEN A.NISATIP=''INGRESO'' THEN KDXCNTG ELSE KDXCNTG*(-1) END SALDO, '
      + '       '' Desde ' + dtpInicio.Text + ' Hasta ' + dtpFin.Text + ''' RANGO, '
      + '       ''' + cTitulo + ''' TITULO, ''' + cTitAlm + ''' TITALM '
      + '  from LOG315 A, LOG314 T, TGE101 B, TGE151 C, TGE208 D '
      + ' where A.CIAID=''' + dblcCia.Text + ''' AND A.TINID=''' + dblcTInv.Text + ''' '
      + '   and A.ALMID LIKE ''' + dblcAlmacen.Text + '%'' '
      + '   and A.NISAFREG>=' + quotedstr(datetostr(dtpInicio.Date))
      + '   and A.NISAFREG<=' + quotedstr(datetostr(dtpFin.Date))
      + '   and A.NISSIT=''ACEPTADO'' ' + cIngSal
      + '   and A.ARTID LIKE ''' + dbcldArti.Text + '%'' '
      + '   and A.CIAID=T.CIAID AND A.LOCID=T.LOCID AND A.TINID=T.TINID AND A.ALMID=T.ALMID '
      + '   and A.TDAID=T.TDAID AND A.NISATIP=T.NISATIP AND A.NISAID=T.NISAID AND A.NISSIT=''ACEPTADO'' '
      + '   and A.CIAID=B.CIAID(+) '
      + '   and A.CIAID=C.CIAID(+) AND A.LOCID=C.LOCID(+) AND A.TINID=C.TINID(+) AND A.ALMID=C.ALMID(+) '
      + '   and C.ACTIVO=''S'' '
      + '   and A.TRIID=D.TRIID(+) '
      + ' order BY ARTID, A.ALMID, A.NISAFREG, A.NISATIP';
// Fin HPC_201502_ALM
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      ShowMessage('No Existe Información a Mostrar');
      ppdb1.DataSource := Nil;
      Exit;
   End;
   Screen.Cursor := crHourglass;
   ppR1.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\MovimientoxArticulo.rtm';
   ppR1.template.LoadFromFile;

   ppdb1.DataSource := DMALM.dsReporte;

   Screen.Cursor := crDefault;

// Inicio HPC_201502_ALM
   If xHojaCalculo Then
   Begin
      dtgData.datasource := DMALM.dsReporte;
      Try
         DMALM.HojaExcel('MOV_X_ART', DMALM.dsReporte, dtgData);
      Except
         On Ex: Exception Do
            Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      End;
      Exit;
   End
   Else
   Begin
      If cbReporte.Checked Then
         ppd1.ShowModal
      Else
      Begin
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
   End;
// Fin HPC_201502_ALM
End;

Procedure TFMovPorArticulo.FormCreate(Sender: TObject);
Begin
   If DMALM.cdsCia.Active = False Then
      FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

   dblcCia.LookupTable := DMALM.cdsCia;
   dblcTInv.LookupTable := DMALM.cdsTINID;
   dblcAlmacen.LookupTable := DMALM.cdsALM;

   dblcCia.Enabled := True;
   If DMALM.cdsCia.RecordCount = 1 Then
      dblcCia.Enabled := False;
   dblcCia.Text := DMALM.cdsCia.FieldByName('CIAID').AsString;
   edtCia.Text := DMALM.cdsCia.FieldByName('CIADES').AsString;

   FiltraTabla(DMALM.cdsTINID, 'TGE152', 'TINID', 'TINID', 'CIAID=' + quotedstr(dblcCia.Text));

   dblcTInv.Enabled := True;
   If DMALM.cdsTINID.RecordCount = 1 Then
      dblcTInv.Enabled := False;
   dblcTInv.Text := DMALM.cdsTINID.FieldByname('TINID').AsString;
   edtTinv.Text := DMALM.cdsTINID.FieldByName('TINDES').AsString;

   dtpInicio.Date := Date;
   dtpFin.Date := Date;
End;

Procedure TFMovPorArticulo.dblcCiaExit(Sender: TObject);
Begin
   If DMALM.cdsCia.IndexFieldNames <> 'CIAID' Then
      DMALM.cdsCia.IndexFieldNames := 'CIAID';
   DMALM.cdsCia.SetKey;
   DMALM.cdsCia.FieldByName('CIAID').AsString := dblcCia.Text;
   If Not DMALM.cdsCia.GotoKey Then
   Begin
      ShowMessage('Compañía No encontrada en Relación, Reintente!');
      dblcCia.SetFocus;
      exit;
   End;
   edtCia.Text := DMALM.cdsCia.FieldByName('CIADES').AsString;
   FiltraTabla(DMALM.cdsTINID, 'TGE152', 'TINID', 'TINID', 'CIAID=' + quotedstr(dblcCia.Text));
   DMALM.cdsAlm.Close;
   DMALM.cdsArti.Close;
End;

Procedure TFMovPorArticulo.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFMovPorArticulo.dblcTInvExit(Sender: TObject);
Begin
   If DMALM.cdsTINID.IndexFieldNames <> 'TINID' Then
      DMALM.cdsTINID.IndexFieldNames := 'TINID';
   DMALM.cdsTINID.SetKey;
   DMALM.cdsTINID.FieldByName('TINID').AsString := dblcTInv.Text;
   If Not DMALM.cdsTINID.GotoKey Then
   Begin
      ShowMessage('Tipo de Inventario NO encontrado en relación, reintente');
      dblcTInv.SetFocus;
      exit;
   End;
   edtTinv.Text := DMALM.cdsTINID.FieldByName('TINDES').AsString;

   DMALM.cdsAlm.Close;
   DMALM.cdsArti.Close;
End;

Procedure TFMovPorArticulo.dblcAlmacenExit(Sender: TObject);
Begin
   If DMALM.cdsAlm.IndexFieldNames <> 'ALMID' Then
      DMALM.cdsAlm.IndexFieldNames := 'ALMID';

   If dblcAlmacen.Text = '' Then
   Begin
      edtAlmacen.Text := '';
      Exit;
   End;

   DMALM.cdsAlm.SetKey;
   DMALM.cdsAlm.FieldByName('ALMID').AsString := dblcAlmacen.Text;
   If Not DMALM.cdsAlm.GotoKey Then
   Begin
      ShowMessage('Almacén NO encontrado, reintente');
      dblcAlmacen.SetFocus;
      exit;
   End;
   edtAlmacen.Text := DMALM.cdsAlm.FieldByName('ALMDES').AsString;
End;

Procedure TFMovPorArticulo.dblcAlmacenEnter(Sender: TObject);
Begin
   If edtTinv.Text = '' Then dblcTInv.SetFocus;

   If Not DMALM.cdsAlm.active Then
   Begin
      FiltraTabla(DMALM.cdsAlm, 'TGE151', 'ALMID', 'ALMID', 'CIAID=' + quotedstr(dblcCia.Text) + ' and TINID=' + quotedstr(dblcTInv.Text) + ' and ALMVTA=''S''');
      DMALM.cdsAlm.Last;
      dblcAlmacen.Text := DMALM.cdsAlm.FieldByname('ALMID').AsString;
      edtAlmacen.Text := DMALM.cdsAlm.FieldByName('ALMDES').AsString;
   End;
End;

Procedure TFMovPorArticulo.dblcTInvEnter(Sender: TObject);
Begin
   If edtCia.Text = '' Then dblcCia.SetFocus;
End;

Procedure TFMovPorArticulo.FormActivate(Sender: TObject);
Begin
   If dblcAlmacen.Text <> '' Then
      dtpInicio.SetFocus;
End;

Procedure TFMovPorArticulo.dbcldArtiExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND TINID=' + quotedstr(dblcTInv.Text) + ' AND ARTID=' + quotedstr(dbcldArti.Text);
   dbeArti.Text := DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES', xWhere, 'ARTDES');
End;

Procedure TFMovPorArticulo.dbcldArtiEnter(Sender: TObject);
Var
   xSQL: String;
Begin
   If Not DMALM.cdsArti.Active Then
   Begin
      xSQL := 'Select ARTID, ARTDES '
         + '  from TGE205 '
         + ' where CIAID=' + Quotedstr(dblcCIA.text)
         + '   and TINID=' + Quotedstr(dblcTInv.Text);
      DMALM.cdsArti.Close;
      DMALM.cdsArti.ProviderName := 'prvArti';
      DMALM.cdsArti.DataRequest(xSQL);
      DMALM.cdsArti.Open;
   End;
   dbcldArti.LookupTable := DMALM.cdsArti;
   dbcldArti.LookupField := 'ARTID';
End;

Procedure TFMovPorArticulo.dblcTInvNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFMovPorArticulo.dblcAlmacenNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFMovPorArticulo.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMALM.cdsReporte.Close;
   DMALM.cdsALM.IndexFieldNames := '';
   DMALM.cdsAlm.Close;
   DMALM.cdsArti.Close;
   DMALM.cdsTINID.Close;
   Action := CAFree;
End;

Procedure TFMovPorArticulo.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

End.

