Unit ALM791;

// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, StdCtrls, wwdblook, Buttons, wwdbedit, Wwdbdlg, Mask, Wwdotdot,
   DB;

Type
   TFToolLote = Class(TForm)
      pnlTool: TPanel;
      lblCia: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      lblLoc: TLabel;
      dblcLOC: TwwDBLookupCombo;
      dbeLOC: TEdit;
      dblcTIN: TwwDBLookupCombo;
      Label1: TLabel;
      dbeTIN: TEdit;
      dbeALM: TEdit;
      lblAlm: TLabel;
      dblcTALM: TwwDBLookupCombo;
      Label2: TLabel;
      edtLinea: TEdit;
      Label10: TLabel;
      edtFamilia: TEdit;
      Label3: TLabel;
      Label4: TLabel;
      dblcdArticulo: TwwDBLookupComboDlg;
      lblCnpEgr: TLabel;
      Label5: TLabel;
      bbtnConsultaLote: TBitBtn;
      dblcdLinea: TwwDBLookupComboDlg;
      dblcdFamilia: TwwDBLookupComboDlg;
      dblcdSFamilia: TwwDBLookupComboDlg;
      edtSFamilia: TEdit;
      dbeArticulo: TEdit;
      dbeUnMidG: TEdit;
      Timer1: TTimer;
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure dblcdLineaExit(Sender: TObject);
      Procedure dblcdFamiliaExit(Sender: TObject);
      Procedure dblcdSFamiliaExit(Sender: TObject);
      Procedure dblcdArticuloExit(Sender: TObject);
      Procedure bbtnConsultaLoteClick(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolLote: TFToolLote;
   xAccesoBotones: Boolean;

Implementation

Uses ALMDM1, oaIN4000;

{$R *.DFM}

Procedure TFToolLote.NotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFToolLote.dblcCIAExit(Sender: TObject);
Var
   xSQL: String;
Begin
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.Text), 'CIADES');
   xSQL := 'SELECT * FROM TGE126 WHERE CIAID=' + quotedstr(dblcCIA.text);
   DMALM.cdsLOC.Close;
   DMALM.cdsLOC.DataRequest(xSQL);
   DMALM.cdsLOC.open;

End;

Procedure TFToolLote.dblcLOCExit(Sender: TObject);
Var
   xSQL: String;
Begin
//  if (Sender as TWincontrol).TabOrder>FToolLote.ActiveControl.TabOrder then Exit;

   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeLoc.Text := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE152 WHERE ' + xSQL;
   DMALM.cdsTINID.Close;
   DMALM.cdsTINID.DataRequest(xSQL);
   DMALM.cdsTINID.open;
End;

Procedure TFToolLote.dblcTINExit(Sender: TObject);
Var
   xSQL: String;
Begin
//  if (Sender as TWincontrol).TabOrder>ActiveControl.TabOrder then Exit;

   xSQL := 'TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeTIN.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE151 WHERE ' + xSQL;
   DMALM.cdsALM.Close;
   DMALM.cdsALM.DataRequest(xSQL);
   DMALM.cdsALM.open;

   xSQL := 'SELECT * FROM TGE131 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text);
   DMALM.cdsGArti.Close;
   DMALM.cdsGArti.DataRequest(xSQL);
   DMALM.cdsGArti.Open;
End;

Procedure TFToolLote.dblcTALMExit(Sender: TObject);
Var
   xSQL: String;
Begin
//  if (Sender as TWincontrol).TabOrder>ActiveControl.TabOrder then Exit;

   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIn.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALM.text);
   dbeALM.text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');
End;

Procedure TFToolLote.dblcdLineaExit(Sender: TObject);
Var
   xSQL: String;
Begin
//  if (Sender as TWincontrol).TabOrder>ActiveControl.TabOrder then Exit;

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) + ' AND GRARID=' + quotedstr(dblcdLinea.text);

   If Length(DMALM.DisplayDescrip('prvTGE', 'TGE131', 'GRARDES', xSQL, 'GRARDES')) > 0 Then
   Begin
      edtLinea.text := DMALM.cdsQry.FieldByName('GRARDES').AsString;
      xSQL := 'SELECT * FROM TGE169 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedStr(dblcTIN.text) + ' AND GRARID=' + quotedStr(dblcdLinea.text);
      DMALM.cdsFAM.Close;
      DMALM.cdsFAM.ProviderName := 'prvFAM';
      DMALM.cdsFAM.DataRequest(xSQL);
      DMALM.cdsFAM.Open;
   End
   Else
      dblcdLinea.SetFocus;
End;

Procedure TFToolLote.dblcdFamiliaExit(Sender: TObject);
Var
   xSQL: String;
Begin
//  if (Sender as TWincontrol).TabOrder>ActiveControl.TabOrder then Exit;
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
      ' AND GRARID=' + quotedstr(dblcdLinea.text) + ' AND FAMID=' + quotedstr(dblcdFamilia.text);

   If dblcdFamilia.text = '' Then
   Begin
      DMALM.cdsSUBFAM.Close;
      DMALM.cdsSUBFAM.ProviderName := 'prvSUBFAM';
      DMALM.cdsSUBFAM.DataRequest('SELECT * FROM TGE170 WHERE ' + xSQL);
      DMALM.cdsSUBFAM.Open;
      exit;
   End;

   If Length(DMALM.DisplayDescrip('prvTGE', 'TGE169', 'FAMDES', xSQL, 'FAMDES')) > 0 Then
   Begin
      edtFamilia.text := DMALM.cdsQry.FieldByName('FAMDES').AsString;
      xSQL := 'SELECT * FROM TGE170 WHERE ' + xSQL;
      DMALM.cdsSUBFAM.Close;
      DMALM.cdsSUBFAM.ProviderName := 'prvSUBFAM';
      DMALM.cdsSUBFAM.DataRequest(xSQL);
      DMALM.cdsSUBFAM.Open;
   End
   Else
      dblcdFamilia.SetFocus;
End;

Procedure TFToolLote.dblcdSFamiliaExit(Sender: TObject);
Var
   xSQL: String;
Begin
//  if (Sender as TWincontrol).TabOrder>ActiveControl.TabOrder then Exit;
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
      ' AND GRARID=' + quotedstr(dblcdLinea.text) + ' AND FAMID=' + quotedstr(dblcdFamilia.text) +
      ' AND SFAMID=' + quotedstr(dblcdSFamilia.text);

   If dblcdSFamilia.text = '' Then
   Begin
      If dblcdFamilia.text = '' Then
         xSQL := 'SELECT * FROM TGE205 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
            ' AND GRARID=' + quotedstr(dblcdLinea.text)
      Else
         xSQL := 'SELECT * FROM TGE205 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
            ' AND GRARID=' + quotedstr(dblcdLinea.text) + ' AND FAMID=' + quotedstr(dblcdFamilia.text);

      DMALM.cdsArti.Close;
      DMALM.cdsArti.ProviderName := 'prvArti';
      DMALM.cdsArti.DataRequest(xSQL);
      DMALM.cdsArti.Open;
      dbeArticulo.text := '';
      dbeUnMidG.text := '';
      exit;
   End;

   If Length(DMALM.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', xSQL, 'SFAMDES')) > 0 Then
   Begin
      edtSFamilia.text := DMALM.cdsQry.FieldByName('SFAMDES').AsString;
      xSQL := 'SELECT * FROM TGE205 WHERE ' + xSQL;
      DMALM.cdsArti.Close;
      DMALM.cdsArti.ProviderName := 'prvArti';
      DMALM.cdsArti.DataRequest(xSQL);
      DMALM.cdsArti.Open;
      dbeArticulo.text := '';
      dbeUnMidG.text := '';
   End
   Else
      dblcdSFamilia.SetFocus;
End;

Procedure TFToolLote.dblcdArticuloExit(Sender: TObject);
Var
   xSQL: String;
Begin
//  if (Sender as TWincontrol).TabOrder>ActiveControl.TabOrder then Exit;

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
      ' AND GRARID=' + quotedstr(dblcdLinea.text) + ' AND FAMID=' + quotedstr(dblcdFamilia.text) +
      ' AND SFAMID=' + quotedstr(dblcdSFamilia.text) + ' AND ARTID=' + quotedstr(dblcdArticulo.text);

   If dblcdSFamilia.text = '' Then
   Begin
      If dblcdFamilia.text = '' Then
         xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
            ' AND GRARID=' + quotedstr(dblcdLinea.text) + ' AND ARTID=' + quotedstr(dblcdArticulo.text)
      Else
         xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
            ' AND GRARID=' + quotedstr(dblcdLinea.text) + ' AND FAMID=' + quotedstr(dblcdFamilia.text) +
            ' AND ARTID=' + quotedstr(dblcdArticulo.text);
   End;

   If dblcdArticulo.text = '' Then
   Begin
      dbeArticulo.text := '';
      dbeUnMidG.text := '';
      exit;
   End;

   If Length(DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTID,ARTDES,UNMIDG', xSQL, 'ARTDES')) > 0 Then
   Begin
      dbeArticulo.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
      dbeUnMidG.text := DMALM.cdsQry.FieldByName('UNMIDG').AsString;
   End
   Else
   Begin
      dbeArticulo.text := '';
      dbeUnMidG.text := '';
      dblcdArticulo.SetFocus;
   End;
End;

Procedure TFToolLote.bbtnConsultaLoteClick(Sender: TObject);
Var
   sSQL: String;
Begin
   If dblcCIA.text = '' Then
   Begin
      dblcCIA.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   End;
   If dblcLOC.text = '' Then
   Begin
      dblcLOC.SetFocus;
      Raise Exception.Create('Ingrese Localidad');
   End;
   If dblcTIN.text = '' Then
   Begin
      dblcTIN.SetFocus;
      Raise Exception.Create('Ingrese Tipo de Inventario');
   End;
   If dblcTALM.text = '' Then
   Begin
      dblcTALM.SetFocus;
      Raise Exception.Create('Ingrese Almacén');
   End;
   If dblcdLinea.text = '' Then
   Begin
      dblcdLinea.SetFocus;
      Raise Exception.Create('Ingrese Línea de Artículo');
   End;
   If dblcdArticulo.text = '' Then
   Begin
      dblcdArticulo.SetFocus;
      Raise Exception.Create('Ingrese Artículo');
   End;

   Screen.Cursor := crHourGlass;
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'SELECT * FROM ( ' +
         'SELECT ' + QuotedStr(dblcdArticulo.text) + 'ARTID,' + QuotedStr(dbeArticulo.text) + ' ARTDES,' + QuotedStr(dbeCIA.text) + ' CIADES, NISALOTE, NISAFEXP, SUM(INGRESO) INGRESO, SUM(EGRESO) EGRESO, SUM(SALDO) SALDO FROM ' +
         '( SELECT ' +
         'C5.CIAID, C5.LOCID, C5.TINID, C5.ALMID, C5.TDAID, C5.NISAID, C5.NISATIP, C5.GRARID, C5.FAMID, C5.SFAMID, C5.ARTID, ' +
         'C4.NISALOTE, C4.NISAFEXP, ' +
         'CASE WHEN C5.NISATIP=''INGRESO'' THEN C5.KDXCNTG ELSE 0 END INGRESO, ' +
         'CASE WHEN C5.NISATIP=''SALIDA'' THEN C5.KDXCNTG ELSE 0 END EGRESO, ' +
         'CASE WHEN C5.NISATIP=''INGRESO'' THEN C5.KDXCNTG ELSE 0 END - ' +
         'CASE WHEN C5.NISATIP=''SALIDA'' THEN C5.KDXCNTG ELSE 0 END SALDO ' +
         'FROM ' +
         'LOG315 C5 ' +
         'LEFT JOIN LOG314 C4 ON ' +
         ' C5.CIAID=C4.CIAID AND C5.LOCID=C4.LOCID AND C5.TINID=C4.TINID AND C5.ALMID=C4.ALMID AND C5.TDAID=C4.TDAID AND ' +
         ' C5.NISAID=C4.NISAID AND C5.NISATIP=C4.NISATIP ' +
         'WHERE ' +
         'C4.CIAID=' + QuotedStr(dblcCIA.text) + ' AND ' +
         'C4.LOCID=' + QuotedStr(dblcLOC.text) + ' AND ' +
         'C4.TINID=' + QuotedStr(dblcTIN.text) + ' AND ' +
         'C4.ALMID=' + QuotedStr(dblcTALM.text) + ' AND ' +
         'C5.GRARID=' + QuotedStr(dblcdLinea.text) + ' AND ' +
         'C5.ARTID=' + QuotedStr(dblcdArticulo.text) + ' AND C4.NISALOTE IS NOT NULL ';
      If dblcdFamilia.text <> '' Then
         sSQL := sSQL + ' AND C5.FAMID=' + QuotedStr(dblcdFamilia.text);
      If dblcdSFamilia.text <> '' Then
         sSQL := sSQL + ' AND C5.SFAMID=' + QuotedStr(dblcdSFamilia.text);
      sSQL := sSQL + ' ) X GROUP BY NISALOTE, NISAFEXP ) SOLVISTA';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'SELECT * FROM ( ' +
            'SELECT ' + QuotedStr(dblcdArticulo.text) + 'ARTID,' + QuotedStr(dbeArticulo.text) + ' ARTDES,' + QuotedStr(dbeCIA.text) + ' CIADES, NISALOTE, NISAFEXP, SUM(INGRESO) INGRESO, SUM(EGRESO) EGRESO, SUM(SALDO) SALDO FROM ' +
            '( SELECT ' +
            'C5.CIAID, C5.LOCID, C5.TINID, C5.ALMID, C5.TDAID, C5.NISAID, C5.NISATIP, C5.GRARID, C5.FAMID, C5.SFAMID, C5.ARTID, ' +
            'C4.NISALOTE, C4.NISAFEXP, ' +
            'CASE WHEN C5.NISATIP=''INGRESO'' THEN C5.KDXCNTG ELSE 0 END INGRESO, ' +
            'CASE WHEN C5.NISATIP=''SALIDA'' THEN C5.KDXCNTG ELSE 0 END EGRESO, ' +
            'CASE WHEN C5.NISATIP=''INGRESO'' THEN C5.KDXCNTG ELSE 0 END - ' +
            'CASE WHEN C5.NISATIP=''SALIDA'' THEN C5.KDXCNTG ELSE 0 END SALDO ' +
            'FROM ' +
            ' LOG315 C5,LOG314 C4 WHERE ' +
            ' C5.CIAID=C4.CIAID(+) AND C5.LOCID=C4.LOCID(+) AND C5.TINID=C4.TINID(+) AND C5.ALMID=C4.ALMID(+) AND C5.TDAID=C4.TDAID(+) AND ' +
            ' C5.NISAID=C4.NISAID(+) AND C5.NISATIP=C4.NISATIP(+) ' +
            'AND ' +
            'C4.CIAID=' + QuotedStr(dblcCIA.text) + ' AND ' +
            'C4.LOCID=' + QuotedStr(dblcLOC.text) + ' AND ' +
            'C4.TINID=' + QuotedStr(dblcTIN.text) + ' AND ' +
            'C4.ALMID=' + QuotedStr(dblcTALM.text) + ' AND ' +
            'C5.GRARID=' + QuotedStr(dblcdLinea.text) + ' AND ' +
            'C5.ARTID=' + QuotedStr(dblcdArticulo.text) + ' AND C4.NISALOTE IS NOT NULL';
         If dblcdFamilia.text <> '' Then
            sSQL := sSQL + ' AND C5.FAMID=' + QuotedStr(dblcdFamilia.text);
         If dblcdSFamilia.text <> '' Then
            sSQL := sSQL + ' AND C5.SFAMID=' + QuotedStr(dblcdSFamilia.text);
         sSQL := sSQL + ' ) X GROUP BY NISALOTE, NISAFEXP ) SOLVISTA';
      End;
   Mtx4000.UsuarioSQL.Clear;
   Mtx4000.UsuarioSQL.Add(sSQL);
   Mtx4000.NewQuery;
   Screen.Cursor := crDefault;
End;

Procedure TFToolLote.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolLote';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolLote);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

End.

