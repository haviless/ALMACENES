Unit ALM710;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, ComCtrls, wwdblook,
   Mask, wwdbedit, Wwdbspin, Db, DBClient, wwclient, DBCtrls, Mant,
   Wwdbdlg, ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
   ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, MsgDlgs;

Type
   TFToolConxArt = Class(TForm)
      pnlTool: TPanel;
      Z1sbActFiltro: TBitBtn;
      lblCia: TLabel;
      lblLoc: TLabel;
      Label1: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      dblcLOC: TwwDBLookupCombo;
      dbeLOC: TEdit;
      dblcTIN: TwwDBLookupCombo;
      dbeTIN: TEdit;
      Timer1: TTimer;
      GroupBox1: TGroupBox;
      lblAlm: TLabel;
      dblcTALM: TwwDBLookupCombo;
      dbeALM: TEdit;
      Label3: TLabel;
      dtpDesde: TDateTimePicker;
      Label4: TLabel;
      dtpHasta: TDateTimePicker;
      Z1sbKardex: TBitBtn;
      dbcldArti: TwwDBLookupComboDlg;
      ppdb1: TppBDEPipeline;
      ppr1: TppReport;
      ppHeaderBand4: TppHeaderBand;
      ppDBText27: TppDBText;
      ppDetailBand4: TppDetailBand;
      ppFooterBand4: TppFooterBand;
      ppd1: TppDesigner;

      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure FormCreate(Sender: TObject);
      Procedure Z1sbActFiltroClick(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure dblcTALMEnter(Sender: TObject);
      Procedure dblcTINEnter(Sender: TObject);
      Procedure dbcldArtiEnter(Sender: TObject);
      Procedure Z1sbKardexClick(Sender: TObject);
   Private
  { Private declarations }
   Public
  { Public declarations }
   End;

Var
   FToolConxArt: TFToolConxArt;
   xSQL: String;
   xAccesoBotones: Boolean;

Implementation

Uses oaIN4000, ALMDM1;

{$R *.DFM}

Procedure TFToolConxArt.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFToolConxArt.FormCreate(Sender: TObject);
Begin
   dtpHasta.Date := Date;
End;

Procedure TFToolConxArt.Z1sbActFiltroClick(Sender: TObject);
Begin
   xSQL := 'SELECT A.CIAID, A.TINID, A.ARTID, A.ARTDES, A.ARTABR, A.GRARID, A.FAMID, A.SFAMID, A.UNMIDG, A.UNMIDU,  ' +
      'A.ARTSPRO, A.ARTPCU, A.ARTPCG, A.ARTPVU, A.ARTPVG, A.ARTFUC, A.ARTCNTG, A.ARTCNTU, ' +
      'A.ARTCPROU, A.ARTCPROG, A.ARTCONT, ' +
      'B.GRARDES, C.FAMDES, D.SFAMDES ' +
      'FROM TGE205 A, TGE131 B, TGE169 C, TGE170 D ' +
      'WHERE A.CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
      'AND A.TINID=' + QuotedStr(dblcTIN.Text) + ' ' +
      'AND A.CIAID=B.CIAID(+) AND A.TINID=B.TINID(+) AND A.GRARID=B.GRARID(+) ' +
      'AND A.CIAID=C.CIAID(+) AND A.TINID=C.TINID(+) AND A.GRARID=C.GRARID(+) AND A.FAMID=C.FAMID(+) ' +
      'AND A.CIAID=D.CIAID(+) AND A.TINID=D.TINID(+) AND A.GRARID=D.GRARID(+) AND A.FAMID=D.FAMID(+) AND A.SFAMID=D.SFAMID(+)';
   Mtx4000.UsuarioSQL.Clear;
 //FPrincipal.Mtx.FMant.wTabla:='VWWDKÑKA';
   Mtx4000.UsuarioSQL.Add(xSQL);
   Mtx4000.NewQuery;
End;

Procedure TFToolConxArt.dblcCIAExit(Sender: TObject);
Var
   sCIA: String;
Begin
   sCIA := dblcCIA.Text;
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(sCIA), 'CIADES');

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE152 WHERE ' + xSQL;
   DMALM.cdsTINID.Close;
   DMALM.cdsTINID.DataRequest(xSQL);
   DMALM.cdsTINID.open;

   xSQL := 'SELECT * FROM TGE205 WHERE CIAID=' + QuotedStr(dblcCIA.Text) + ' ORDER BY ARTID';
   DMALM.cdsArti.Close;
   DMALM.cdsArti.DataRequest(xSQL);
   DMALM.cdsArti.Open;

 {xSQL:='SELECT * FROM TGE126 WHERE CIAID='+quotedstr(dblcCIA.text);
 DMALM.cdsLOC.Close;
 DMALM.cdsLOC.DataRequest( xSQL );
 DMALM.cdsLOC.open;}
End;

Procedure TFToolConxArt.dblcLOCExit(Sender: TObject);
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeLoc.Text := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE152 WHERE ' + xSQL;
   DMALM.cdsTINID.Close;
   DMALM.cdsTINID.DataRequest(xSQL);
   DMALM.cdsTINID.open;
End;

Procedure TFToolConxArt.dblcTINExit(Sender: TObject);
Begin
   xSQL := 'TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeTIN.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');
   xSQL := 'TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' and ALMVTA=''S''';
   xSQL := 'SELECT * FROM TGE151 WHERE ' + xSQL + ' ORDER BY ALMID';
   DMALM.cdsALM.Close;
   DMALM.cdsALM.DataRequest(xSQL);
   DMALM.cdsALM.open;
End;

Procedure TFToolConxArt.dblcTALMExit(Sender: TObject);
Begin
   xSQL := 'TINID=' + quotedstr(dblcTIn.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALM.text);
   dbeALM.text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');
End;

Procedure TFToolConxArt.FormActivate(Sender: TObject);
Begin
   Z1sbActFiltro.SetFocus;
End;

Procedure TFToolConxArt.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolConxArt';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolConxArt);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

Procedure TFToolConxArt.dblcTALMEnter(Sender: TObject);
Begin
   If dblcTIN.Text = '' Then
   Begin
      ShowMessage('Debe Seleecionar el Tipo de Inventario');
      dblcTIN.SetFocus;
   End;
End;

Procedure TFToolConxArt.dblcTINEnter(Sender: TObject);
Begin
   If dblcCIA.Text = '' Then
   Begin
      ShowMessage('Debe Seleecionar el Tipo de Inventario');
      dblcTIN.SetFocus;
   End;
End;

Procedure TFToolConxArt.dbcldArtiEnter(Sender: TObject);
Begin
   If Not DMALM.cdsArti.Active Then
   Begin
      xSQL := 'SELECT * FROM TGE205 WHERE CIAID=' + QuotedStr(dblcCIA.Text) + ' ORDER BY ARTID';
      DMALM.cdsArti.Close;
      DMALM.cdsArti.DataRequest(xSQL);
      DMALM.cdsArti.Open;
   End;
End;

Procedure TFToolConxArt.Z1sbKardexClick(Sender: TObject);
Var
   sDesde, sHasta: String;
   x10: Integer;
Begin
   If length(dblcCia.Text) = 0 Then Raise exception.Create('Falta Código de Compañía');

   sDesde := formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime);
   sHasta := formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime);

   xSQL := 'SELECT A.CIAID, B.CIADES, A.LOCID, A.TINID, A.ALMID, C.ALMDES, A.TDAID, A.TRIID, TRIDES, '
      + 'NISATIP, NISAID, NISAFREG, PROV, ARTID, ARTDES, KDXCNTG, ARTPCG, ARTTOTALG, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' THEN KDXCNTG ELSE 0 END INGRESOS, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  THEN KDXCNTG ELSE 0 END SALIDAS, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' THEN KDXCNTG ELSE KDXCNTG*(-1) END SALDO, '
      + ''' Desde ' + sDesde + ' Hasta ' + sHasta + ''' RANGO '
      + 'FROM LOG315 A, TGE101 B, TGE151 C, TGE208 D '
      + 'WHERE A.CIAID=''' + dblcCia.Text + ''' '
      + 'AND A.ALMID=''' + dblcTALM.Text + ''' '
      + 'AND A.NISAFREG>=''' + sDesde + ''' AND A.NISAFREG<=''' + sHasta + ''' AND NISSIT=''ACEPTADO'' '
      + 'and ARTID LIKE ''%' + dbcldArti.Text + '%'' '
      + 'AND A.CIAID=B.CIAID(+) '
      + 'AND A.CIAID=C.CIAID(+) AND A.LOCID=C.LOCID(+) AND A.TINID=C.TINID(+) AND A.ALMID=C.ALMID(+) '
      + 'AND A.TRIID=D.TRIID(+) '
      + 'ORDER BY ARTID, NISAFREG, A.NISATIP';

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      ppdb1.DataSource := Nil;
      Exit;
   End;
   Screen.Cursor := crHourglass;
   ppR1.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\MovimientoxArticulo.rtm';
   ppR1.template.LoadFromFile;

   ppdb1.DataSource := DMALM.dsReporte;

   Screen.Cursor := crDefault;

   If (DMALM.wUsuario = 'FPAZOS') Or (DMALM.wUsuario = 'HNORIEGA') Then
      ppd1.ShowModal
   Else
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

End.

