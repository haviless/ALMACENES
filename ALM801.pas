Unit ALM801;

// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, wwdblook, ComCtrls, Mask, wwdbedit, Wwdbdlg, DB,
   DBClient, wwclient;

Type
   TFReprocesa = Class(TForm)
      lblCIA: TLabel;
      dblcCIA: TwwDBLookupCombo;
      edtCia: TEdit;
      Label2: TLabel;
      dblcTALM: TwwDBLookupCombo;
      edtALM: TEdit;
      lblArti: TLabel;
      dblcdArt: TwwDBLookupComboDlg;
      edtArti: TwwDBEdit;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      bbtnProcMes: TButton;
      Label1: TLabel;
      dblcTInv: TwwDBLookupCombo;
      edtTInv: TEdit;
      pbProceso: TProgressBar;
      lblArticulo: TLabel;
      Procedure FormCreate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcTInvExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure bbtnProcMesClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcdArtExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FReprocesa: TFReprocesa;
Procedure FiltraCDS(xxCds: TwwClientDataSet; xxArchivo, xxcampos, xxCampofiltro, xxIndices, xxFiltro: String);

Implementation

Uses ALMDM1;

{$R *.dfm}

Procedure FiltraCDS(xxCds: TwwClientDataSet; xxArchivo, xxcampos, xxCampofiltro, xxIndices, xxFiltro: String);
Var
   xSQL, xFiltro, xWhere: String;
Begin
   DMALM.cdsAcceso.Filter := '';
   DMALM.cdsAcceso.Filtered := False;
   DMALM.cdsAcceso.Filter := 'NTABLA=' + '''' + xxArchivo + '''';
   DMALM.cdsAcceso.Filtered := True;
   xWhere := '';
   DMALM.cdsAcceso.First;
   While Not DMALM.cdsAcceso.Eof Do
   Begin
      If Length(xWhere) = 0 Then
         xWhere := xxCampofiltro + '=' + '''' + DMALM.cdsAcceso.FieldByName('CODIGO').AsString + ''''
      Else
         xWhere := xWhere + ' or ' + xxCampofiltro + '=' + '''' + DMALM.cdsAcceso.FieldByName('CODIGO').AsString + '''';
      DMALM.cdsAcceso.Next;
   End;
   xSQL := 'Select ' + xxCampos + ' from ' + xxArchivo;
   If length(xWhere) > 0 Then
   Begin
      If length(trim(xxFiltro)) > 0 Then
         xWhere := xxFiltro + ' and (' + xWhere + ')';
   End
   Else
      xWhere := xxFiltro;

   If length(xWhere) > 0 Then
      xSQL := xSQL + ' Where ' + xWhere;

   xxCds.filter := '';
   xxCds.filtered := false;
   xxCds.IndexFieldNames := '';
   xxCds.Close;
   xxCds.DataRequest(xSQL);
   xxCds.Open;
   xxCds.Indexfieldnames := xxIndices;
End;

Procedure TFReprocesa.FormCreate(Sender: TObject);
Begin
// abre compañías
//                  cds    archivo   campos        campofiltro indices filtro
   FiltraCDS(DMALM.cdsCIA, 'TGE101', 'CIAID,CIADES', 'CIAID', 'CIAID', '');
   dblcCIA.lookUpTable := DMALM.cdsCIA;
   dblcCIA.lookUpField := 'CIAID';

End;

Procedure TFReprocesa.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
   xSQL := ' SELECT * FROM LOG317 WHERE NOCIERRE=(SELECT MAX(NOCIERRE)  FROM LOG317) ';
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;
   dtpDesde.Date := DMALM.cdsQry.FieldByName('CNSPRICIE').AsDateTime;
   dtpHasta.Date := DMALM.cdsQry.FieldByName('CNSULTCIE').AsDateTime;
   dblcCIA.SetFocus;
End;

Procedure TFReprocesa.dblcCIAExit(Sender: TObject);
Var
   xWhere: String;
Begin
   DMALM.cdsCIA.SetKey;
   DMALM.cdsCIA.FieldByName('CIAID').AsString := dblcCIA.Text;
   If Not DMALM.cdsCIA.GotoKey Then
   Begin
      ShowMessage('Compañía No existe');
      dblcCIA.SetFocus;
      exit;
   End;
   edtCia.Text := DMALM.cdsCIA.FieldByName('CIADES').AsString;

// abre Tipo de Inventario
//                  cds    archivo   campos        campofiltro indices filtro
   xWhere := 'CIAID=' + quotedstr(dblcCIA.text);
   FiltraCDS(DMALM.cdsTINID, 'TGE152', 'TINID,TINDES', 'TINID', 'TINID', xWhere);
   dblcTInv.lookUpTable := DMALM.cdsTINID;
   dblcTInv.lookUpField := 'TINID';
End;

Procedure TFReprocesa.dblcTInvExit(Sender: TObject);
Var
   xWhere: String;
Begin
   DMALM.cdsTINID.SetKey;
   DMALM.cdsTINID.FieldByName('TINID').AsString := dblcTInv.Text;
   If Not DMALM.cdsTINID.GotoKey Then
   Begin
      ShowMessage('Tipo de Inventario No existe');
      dblcTInv.SetFocus;
      exit;
   End;
   edtTInv.Text := DMALM.cdsTINID.FieldByName('TINDES').AsString;

// abre Almacenes
   xWhere := 'CIAID=' + quotedstr(dblcCIA.text) + ' and TINID=' + quotedstr(dblcTInv.Text);
   FiltraCDS(DMALM.cdsALM, 'TGE151', 'ALMID,ALMDES', 'ALMID', 'ALMID', xWhere);
   dblcTALM.lookUpTable := DMALM.cdsALM;
   dblcTALM.lookUpField := 'ALMID';

// abre Artículos
   xWhere := 'CIAID=' + quotedstr(dblcCIA.text) + ' and TINID=' + quotedstr(dblcTInv.Text);
   FiltraCDS(DMALM.cdsArti, 'TGE205', '*', 'ARTID', 'ARTID', xWhere);
   dblcdArt.lookUpTable := DMALM.cdsArti;
   dblcdArt.lookUpField := 'ARTID';
End;

Procedure TFReprocesa.dblcTALMExit(Sender: TObject);
Begin
   DMALM.cdsALM.SetKey;
   DMALM.cdsALM.FieldByName('ALMID').AsString := dblcTALM.Text;
   If Not DMALM.cdsALM.GotoKey Then
   Begin
      ShowMessage('Almacén No existe');
      dblcTALM.SetFocus;
      exit;
   End;
   edtALM.Text := DMALM.cdsALM.FieldByName('ALMDES').AsString;
End;

Procedure TFReprocesa.dblcdArtExit(Sender: TObject);
Begin
   DMALM.cdsArti.SetKey;
   DMALM.cdsArti.FieldByName('ARTID').AsString := dblcdArt.Text;
   If Not DMALM.cdsArti.GotoKey Then
   Begin
      ShowMessage('Tipo de Inventario No existe');
      dblcdArt.SetFocus;
      exit;
   End;
   edtArti.Text := DMALM.cdsArti.FieldByName('ARTDES').AsString;

End;

Procedure TFReprocesa.bbtnProcMesClick(Sender: TObject);
Var
   sDesde, sHasta, xWhereArt, xxAnio: String;
   Contenido: Double;
   xFecha, sFechaNota: TDateTime;
   i, Y, M, D, YX, MX, DX: Word;
   AnoAnt, Ano, Mes, sCIA, sART, sALM, sLOC, sTIN, xSQL, lSQL, xArticulo: String;

   CantidadG, CantidadU, CantidadActG, CantidadActU,
      MontoActG, MontoActU, PrecioG, PrecioU: double;

   STKSANTG, STKSANTU: double;
   STKMANTG, STKMANTU: double;
Begin
   xArticulo := '';
   xArticulo := dblcdArt.Text;
   If Length(Trim(xArticulo)) > 0 Then
   Begin
      If Length(Trim(edtArti.Text)) = 0 Then
      Begin
         ShowMessage('Código de Artículo Errado');
         dblcdArt.SetFocus;
         Exit;
      End;
   End
   Else
   Begin
      ShowMessage('Falta Código de Artículo');
      dblcdArt.SetFocus;
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   pbProceso.Position := 1; // Cantidad de Tablas a Abrir;
   xWhereArt := ' WHERE ARTID=' + quotedstr(xArticulo);

   DecodeDate(dtpDesde.date, Y, M, D);
   xSQL := 'SELECT * FROM LOG316 WHERE STKANO=' + QuotedStr(DMALM.StrZero(IntToStr(Y), 4));
   If length(xArticulo) > 0 Then
   Begin
      xSQL := xSQL + ' AND ARTID=' + quotedstr(xArticulo);
   End;

   DMALM.cdsSTK.close;
   DMALM.cdsSTK.DataRequest(xSQL);
   DMALM.cdsSTK.Open;

   If DMALM.cdsSTK.RecordCount > 0 Then
   Begin
      DMALM.cdsSTK.First;
      While Not DMALM.cdsSTK.Eof Do
      Begin
         DMALM.cdsSTK.Edit;
         For i := M To 12 Do
         Begin
            If i = M Then
            Begin
               If i = 1 Then
               Begin
                  STKSANTG := 0;
                  STKSANTU := 0;
                  STKMANTG := 0;
                  STKMANTU := 0;

                  xxAnio := DMALM.cdsSTK.fieldbyname('STKANO').AsString;
                  xSQL := 'CIAID=' + QuotedStr(DMALM.cdsSTK.fieldbyname('CIAID').AsString) + ' AND LOCID=' + QuotedStr(DMALM.cdsSTK.fieldbyname('LOCID').AsString) + ' AND ' +
                     'TINID=' + QuotedStr(DMALM.cdsSTK.fieldbyname('TINID').AsString) + ' AND ALMID=' + QuotedStr(DMALM.cdsSTK.fieldbyname('ALMID').AsString) + ' AND ' +
                     'ARTID=' + QuotedStr(DMALM.cdsSTK.fieldbyname('ARTID').AsString) + ' AND STKANO=' + QuotedStr(InttoStr(StrtoInt(xxAnio) - 1));
                  DMALM.displaydescrip('prvTGE', 'LOG316', 'CIAID, LOCID, TINID, ALMID, ' +
                     'STKSACTG, STKSACTU, ' +
                     'STKMACTG, STKMACTU, ' +
                     'STKTMU12, STKIMU12, STKSMU12', xSQL, 'STKSACTG');
                  // Guardar los saldos finales del año anterior para despues asignarlos a los
                  // saldos iniciales del nuevo registro
                  If DMALM.cdsQry.RecordCount > 0 Then
                  Begin
                     STKSANTG := DMALM.cdsQry.FieldByName('STKSACTG').AsFloat;
                     STKSANTU := DMALM.cdsQry.FieldByName('STKSACTU').AsFloat;
                     STKMANTG := DMALM.cdsQry.FieldByName('STKMACTG').AsFloat;
                     STKMANTU := DMALM.cdsQry.FieldByName('STKMACTU').AsFloat;
                  End;
                  DMALM.cdsSTK.FieldByName('STKTSG' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := STKSANTG;
                  DMALM.cdsSTK.FieldByName('STKTSU' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := STKSANTU;
                  DMALM.cdsSTK.FieldByName('STKTMG' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := STKMANTG;
                  DMALM.cdsSTK.FieldByName('STKTMU' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := STKMANTU;
               End
            End
            Else
               If i <> M Then
               Begin
                  DMALM.cdsSTK.FieldByName('STKTSU' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;
                  DMALM.cdsSTK.FieldByName('STKTSG' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;
                  DMALM.cdsSTK.FieldByName('STKTMU' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;
                  DMALM.cdsSTK.FieldByName('STKTMG' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;
               End;

            DMALM.cdsSTK.FieldByName('STKISU' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;
            DMALM.cdsSTK.FieldByName('STKISG' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;
            DMALM.cdsSTK.FieldByName('STKIMU' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;
            DMALM.cdsSTK.FieldByName('STKIMG' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;

            DMALM.cdsSTK.FieldByName('STKSSU' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;
            DMALM.cdsSTK.FieldByName('STKSSG' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;
            DMALM.cdsSTK.FieldByName('STKSMU' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;
            DMALM.cdsSTK.FieldByName('STKSMG' + DMALM.StrZero(IntToStr(i), 2)).AsFloat := 0;
     //CIM
            If i = M Then
            Begin
               DMALM.cdsSTK.FieldByName('STKSACTG').AsFloat := DMALM.cdsSTK.FieldByName('STKTSG' + DMALM.StrZero(IntToStr(i), 2)).AsFloat;
               DMALM.cdsSTK.FieldByName('STKSACTU').AsFloat := DMALM.cdsSTK.FieldByName('STKTSU' + DMALM.StrZero(IntToStr(i), 2)).AsFloat;
               DMALM.cdsSTK.FieldByName('STKMACTG').AsFloat := DMALM.cdsSTK.FieldByName('STKTMG' + DMALM.StrZero(IntToStr(i), 2)).AsFloat;
               DMALM.cdsSTK.FieldByName('STKMACTU').AsFloat := DMALM.cdsSTK.FieldByName('STKTMU' + DMALM.StrZero(IntToStr(i), 2)).AsFloat;
            End;
     //*
         End;
         DMALM.cdsSTK.Post;
         DMALM.cdsSTK.Next;
      End;
   End;
   DMALM.cdsSTK.ApplyUpdates(0);
   DMALM.cdsSTK.First;

   xSQL := 'SELECT SUM(DPEDCANTRE) STKRACTG FROM FAC302 ' +
      xWhereArt + ' AND (DPEDSIT=''INICIAL'' OR DPEDSIT=''PENDIENTE'') AND DPEDSALDO > 0 ';

   DMALM.cdsArtiStk.IndexFieldNames := '';
   DMALM.cdsArtiStk.close;
   DMALM.cdsArtiStk.DataRequest(xSQL);
   DMALM.cdsArtiStk.Open;

   If DMALM.cdsArtiStk.recordcount > 0 Then
      xReserva := DMALM.cdsArtiStk.fieldbyname('STKRACTG').AsFloat;

   xFecha := StrToDate('01/03/2001');
//  xSQL := 'UPDATE TGE205 SET ARTPCU=0, ARTPCG=0, ARTCNTG=0, ARTCNTU=0, ARTMNTG=0, ARTMNTU=0, ARTCPROU=0, ARTCPROG=0, '
   xSQL := 'UPDATE TGE205 SET ARTCNTG=0, ARTCNTU=0, ARTMNTG=0, ARTMNTU=0, ARTCPROU=0, ARTCPROG=0, ' +
      'ARTFUPRC=' + DMALM.wRepFuncDate + '''' + FormatDateTime(DMALM.wFormatFecha, xFecha) + ''')';
   If length(xArticulo) > 0 Then xSQL := xSQL + xWhereArt;
   DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

   xSQL := 'SELECT * FROM TGE205';
   If length(xArticulo) > 0 Then
      xSQL := xSQL + xWhereArt;
   DMALM.cdsArtiStk.close;
   DMALM.cdsArtiStk.DataRequest(xSQL);
   DMALM.cdsArtiStk.Open;
   If DMALM.cdsArtiStk.IndexFieldNames <> 'ARTID' Then
      DMALM.cdsArtiStk.IndexFieldNames := 'ARTID';

   xSQL := 'SELECT * FROM LOG316 WHERE STKANO=' + QuotedStr(DMALM.StrZero(IntToStr(Y), 4));
   If length(xArticulo) > 0 Then
      xSQL := xSQL + ' AND ARTID=' + quotedstr(xArticulo);

   DMALM.cdsSTK.close;
   DMALM.cdsSTK.DataRequest(xSQL);
   DMALM.cdsSTK.Open;

   If DMALM.cdsSTK.IndexFieldNames <> 'STKANO;CIAID;LOCID;TINID;ALMID;ARTID' Then
      DMALM.cdsSTK.IndexFieldNames := 'STKANO;CIAID;LOCID;TINID;ALMID;ARTID';

   sDesde := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime)); //NISAFDOC<='+sHasta+'

   xSQL := 'SELECT * FROM LOG315 WHERE (NISAFREG>=' + sDesde + ' AND NISAFREG<=' + sHasta + ')';
 //xSQL:='SELECT * FROM LOG315 WHERE NISAFREG>='+sDesde+' AND NISAFREG<='+sHasta+' AND '+DMALM.wReplacCeros+'(NISSIT,''S'')<>''INICIAL''';

   If length(xArticulo) > 0 Then
      xSQL := xSQL + ' AND ARTID=' + quotedstr(xArticulo);
   DMALM.cdsKdx.close;
   DMALM.cdsKdx.DataRequest(xSQL);
   DMALM.cdsKdx.Open;

   If DMALM.cdsKdx.IndexFieldNames <> 'ARTID;NISAFREG;NISATIP' Then
      DMALM.cdsKdx.IndexFieldNames := 'ARTID;NISAFREG;NISATIP';

   DMALM.cdsKdx.First;
   pbProceso.Visible := True;
   pbProceso.Max := DMALM.cdsKdx.RecordCount; // Cantidad de Tablas a Abrir;

   If DMALM.cdsKdx.RecordCount = 0 Then // Genera un Registro en el nuevo Ano
   Begin
      If length(xArticulo) > 0 Then
      Begin
         sArt := xArticulo;
         DMALM.cdsArtiStk.SetKey;
         DMALM.cdsArtiStk.FieldByName('ARTID').AsString := sArt;
         If Not DMALM.cdsArtiStk.Gotokey Then
         Begin
            ShowMessage('Error Grave en Maestro de Artículos:' + sArt);
            exit;
         End;
         lblArticulo.Caption := '';
         lblArticulo.Caption := DMALM.cdsArtiStk.FieldByName('ARTID').AsString + ' ' + Trim(DMALM.cdsArtiStk.FieldByName('ARTDES').AsString);
         lblArticulo.Refresh;

         Contenido := DMALM.cdsArtiStk.FieldByName('ARTCONT').AsFloat;
         If Contenido < 1 Then
         Begin
            ShowMessage('Error en contenido de Artículo');
            exit;
         End;
         sFechaNota := dtpDesde.Date;
         DecodeDate(sFechaNota, Y, M, D);
         AnoAnt := IntToStr(Y - 1);
         Ano := IntToStr(Y);
         Mes := DMALM.StrZero(IntToStr(M), 2);

         YX := Y;
         MX := M;
         DX := D;

         If MX = 1 Then
         Begin
            MX := 12;
            YX := YX - 1;
            xSQL := 'SELECT * FROM LOG330 WHERE ARTID=' + QuotedStr(sArt) + ' AND STKANO=' + QuotedStr(DMALM.StrZero(IntToStr(YX), 4));
         End
         Else
         Begin
            MX := MX - 1;
            xSQL := 'SELECT * FROM LOG330 WHERE ARTID=' + QuotedStr(sArt) + ' AND STKANO=' + QuotedStr(DMALM.StrZero(IntToStr(YX), 4));
         End;

         DMALM.cdsQry4.IndexFieldNames := '';
         DMALM.cdsQry4.Filter := '';
         DMALM.cdsQry4.Filtered := false;
         DMALM.cdsQry4.Close;
         DMALM.cdsQry4.DataRequest(xSQL);
         DMALM.cdsQry4.Open;

         If M = 1 Then
            xSQL := 'SELECT * FROM LOG316 WHERE ARTID=' + QuotedStr(sArt) + ' AND STKANO=' + QuotedStr(AnoAnt)
         Else
            xSQL := 'SELECT * FROM LOG316 WHERE ARTID=' + QuotedStr(sArt) + ' AND STKANO=' + QuotedStr(Ano);

         DMALM.cdsKdx.IndexFieldNames := '';

         DMALM.cdsKdx.close;
         DMALM.cdsKdx.DataRequest(xSQL);
         DMALM.cdsKdx.Open;

         DMALM.cdsKdx.First;
         While Not DMALM.cdsKdx.Eof Do
         Begin
            sCIA := DMALM.cdsKDX.FieldByName('CIAID').AsString;
            sLOC := DMALM.cdsKDX.FieldByName('LOCID').AsString;
            sTIN := DMALM.cdsKDX.FieldByName('TINID').AsString;
            sALM := DMALM.cdsKDX.FieldByName('ALMID').AsString;

            /////RESERVAS
            xReserva := 0;
            xSQL := ' SELECT SUM(DPEDCANTRE) STKRACTG FROM FAC302 ' +
               ' WHERE CIAID=' + Quotedstr(sCIa) +
               ' AND TINID=' + Quotedstr(sTIN) +
               ' AND ALMID=' + Quotedstr(sALM) +
               ' AND ARTID=' + Quotedstr(DMALM.cdsKDX.FieldByName('ARTID').AsString) +
            //              xWhereArt+' AND (DPEDSIT=''INICIAL'' OR DPEDSIT=''PENDIENTE'') AND DPEDSALDO > 0 ';
            ' AND (DPEDSIT=''INICIAL'' OR DPEDSIT=''PENDIENTE'') AND DPEDSALDO > 0 ';
            DMALM.cdsNieto.Close;
            DMALM.cdsNieto.DataRequest(xSQL);
            DMALM.cdsNieto.Open;
            If DMALM.cdsNieto.recordcount > 0 Then
               xReserva := DMALM.cdsNieto.fieldbyname('STKRACTG').AsFloat;
        /////

            DMALM.ControlStock(sCIA, sALM, sLOC, sTIN, sArt, Ano, Mes, Contenido, 'N'); // Act. LOG316 (STK)
            DMALM.SaldosIniciales(sCIA, sArt, Ano + Mes, Contenido, DMALM.cdsQry4.fieldbyname('ARTCPROG' + DMALM.StrZero(IntToStr(MX), 2)).AsFloat); // Act. LOG316 (STK)
            DMALM.cdsKdx.Next;
         End;
         DMALM.cdsSTK.Edit;
         DMALM.cdsSTK.FieldByName('STKMACTG').AsFloat := DMALM.cdsSTK.fieldbyname('STKTMG' + DMALM.StrZero(IntToStr(M), 2)).AsFloat;
         DMALM.cdsSTK.FieldByName('STKMACTU').AsFloat := DMALM.cdsSTK.fieldbyname('STKTMU' + DMALM.StrZero(IntToStr(M), 2)).AsFloat;
         DMALM.cdsSTK.Post;
         DMALM.cdsSTK.ApplyUpdates(0);
         ////////////////////////////
         If (MX = 12) And (M = 1) Then
         Begin
            xSQL := ' SELECT SUM(STKSACTG) STKSACTG,SUM(STKSACTU) STKSACTU,'
               + ' SUM(STKMACTG) STKMACTG,SUM(STKMACTU) STKMACTU '
               + ' FROM LOG316 '
               + ' WHERE ARTID=' + QuotedStr(sArt) + ' AND STKANO=' + QuotedStr(DMALM.StrZero(IntToStr(YX), 4));
         End
         Else
         Begin
            xSQL := 'SELECT ' +
               'SUM(STKTSG01) STKTSG01, SUM(STKTSU01) STKTSU01, ' +
               'SUM(STKTMG01) STKTMG01, SUM(STKTMU01) STKTMU01, ' +
               'SUM(STKTSG02) STKTSG02, SUM(STKTSU02) STKTSU02, ' +
               'SUM(STKTMG02) STKTMG02, SUM(STKTMU02) STKTMU02, ' +
               'SUM(STKTSG03) STKTSG03, SUM(STKTSU03) STKTSU03, ' +
               'SUM(STKTMG03) STKTMG03, SUM(STKTMU03) STKTMU03, ' +
               'SUM(STKTSG04) STKTSG04, SUM(STKTSU04) STKTSU04, ' +
               'SUM(STKTMG04) STKTMG04, SUM(STKTMU04) STKTMU04, ' +
               'SUM(STKTSG05) STKTSG05, SUM(STKTSU05) STKTSU05, ' +
               'SUM(STKTMG05) STKTMG05, SUM(STKTMU05) STKTMU05, ' +
               'SUM(STKTSG06) STKTSG06, SUM(STKTSU06) STKTSU06, ' +
               'SUM(STKTMG06) STKTMG06, SUM(STKTMU06) STKTMU06, ' +
               'SUM(STKTSG07) STKTSG07, SUM(STKTSU07) STKTSU07, ' +
               'SUM(STKTMG07) STKTMG07, SUM(STKTMU07) STKTMU07, ' +
               'SUM(STKTSG08) STKTSG08, SUM(STKTSU08) STKTSU08, ' +
               'SUM(STKTMG08) STKTMG08, SUM(STKTMU08) STKTMU08, ' +
               'SUM(STKTSG09) STKTSG09, SUM(STKTSU09) STKTSU09, ' +
               'SUM(STKTMG09) STKTMG09, SUM(STKTMU09) STKTMU09, ' +
               'SUM(STKTSG10) STKTSG10, SUM(STKTSU10) STKTSU10, ' +
               'SUM(STKTMG10) STKTMG10, SUM(STKTMU10) STKTMU10, ' +
               'SUM(STKTSG11) STKTSG11, SUM(STKTSU11) STKTSU11, ' +
               'SUM(STKTMG11) STKTMG11, SUM(STKTMU11) STKTMU11, ' +
               'SUM(STKTSG12) STKTSG12, SUM(STKTSU12) STKTSU12, ' +
               'SUM(STKTMG12) STKTMG12, SUM(STKTMU12) STKTMU12 ' +
               'FROM LOG316 ' +
               'WHERE ARTID=' + QuotedStr(sArt) + ' AND STKANO=' + QuotedStr(DMALM.StrZero(IntToStr(YX), 4));
         End;

         DMALM.cdsQry6.Close;
         DMALM.cdsQry6.DataRequest(xSQL);
         DMALM.cdsQry6.Open;

         xSQL := 'UPDATE TGE205 SET ' +
            'ARTCPROG=' + Floattostr(DMALM.cdsQry4.fieldbyname('ARTCPROG' + DMALM.StrZero(IntToStr(MX), 2)).AsFloat) + ', ' +
            'ARTCPROU=' + Floattostr(DMALM.cdsQry4.fieldbyname('ARTCPROU' + DMALM.StrZero(IntToStr(MX), 2)).AsFloat) + ', ';
         If MX = 12 Then
         Begin
            xSQL := xSQL + ' ARTCNTG=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKSACTG').AsFloat) + ', ' +
               ' ARTCNTU=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKSACTU').AsFloat) + ', ' +
               ' ARTMNTG=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKMACTG').AsFloat) + ', ' +
               ' ARTMNTU=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKMACTU').AsFloat);
         End
         Else
         Begin
            xSQL := xSQL + ' ARTCNTG=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKTSG' + DMALM.StrZero(IntToStr(M), 2)).AsFloat) + ', ' +
               ' ARTCNTU=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKTSU' + DMALM.StrZero(IntToStr(M), 2)).AsFloat) + ', ' +
               ' ARTMNTG=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKTMG' + DMALM.StrZero(IntToStr(M), 2)).AsFloat) + ', ' +
               ' ARTMNTU=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKTMU' + DMALM.StrZero(IntToStr(M), 2)).AsFloat);

         End;

         If length(xArticulo) > 0 Then xSQL := xSQL + xWhereArt;
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

      End;
   End
   Else // Cuando Tiene Movimiento Normal
   Begin
//      while not DMALM.cdsKDX.Eof do
//      begin
      sArt := DMALM.cdsKDX.FieldByName('ARTID').AsString;
      DMALM.cdsArtiStk.SetKey;
      DMALM.cdsArtiStk.FieldByName('ARTID').AsString := sArt;
      If Not DMALM.cdsArtiStk.Gotokey Then
      Begin
         ShowMessage('Error Grave en Maestro de Artículos:' + sArt);
         exit;
      End;
      lblArticulo.Caption := '';
      lblArticulo.Caption := DMALM.cdsArtiStk.FieldByName('ARTID').AsString + ' ' + Trim(DMALM.cdsArtiStk.FieldByName('ARTDES').AsString);
      lblArticulo.Refresh;

      Contenido := DMALM.cdsArtiStk.FieldByName('ARTCONT').AsFloat;
      If Contenido < 1 Then
      Begin
         ShowMessage('Error en contenido de Artículo');
         exit;
      End;

        ////CIM 26/12/2002
      YX := Y;
      MX := M;
      DX := D;

      If MX = 1 Then
      Begin
         MX := 12;
         YX := Y - 1;
         xSQL := 'SELECT * FROM LOG330 WHERE ARTID=' + QuotedStr(sArt) + ' AND STKANO=' + QuotedStr(DMALM.StrZero(IntToStr(YX), 4));
      End
      Else
      Begin
         MX := MX - 1;
         xSQL := 'SELECT * FROM LOG330 WHERE ARTID=' + QuotedStr(sArt) + ' AND STKANO=' + QuotedStr(DMALM.StrZero(IntToStr(YX), 4));
      End;

      DMALM.cdsQry4.IndexFieldNames := '';
      DMALM.cdsQry4.Filter := '';
      DMALM.cdsQry4.Filtered := false;
      DMALM.cdsQry4.Close;
      DMALM.cdsQry4.DataRequest(xSQL);
      DMALM.cdsQry4.Open;

      If (MX = 12) And (M = 1) Then
      Begin
         xSQL := ' SELECT SUM(STKSACTG) STKSACTG,SUM(STKSACTU) STKSACTU,'
            + ' SUM(STKMACTG) STKMACTG,SUM(STKMACTU) STKMACTU '
            + ' FROM LOG316 '
            + ' WHERE ARTID=' + QuotedStr(sArt) + ' AND STKANO=' + QuotedStr(DMALM.StrZero(IntToStr(YX), 4));
      End
      Else
      Begin
         xSQL := 'SELECT ' +
            'SUM(STKTSG01) STKTSG01, SUM(STKTSU01) STKTSU01, ' +
            'SUM(STKTMG01) STKTMG01, SUM(STKTMU01) STKTMU01, ' +
            'SUM(STKTSG02) STKTSG02, SUM(STKTSU02) STKTSU02, ' +
            'SUM(STKTMG02) STKTMG02, SUM(STKTMU02) STKTMU02, ' +
            'SUM(STKTSG03) STKTSG03, SUM(STKTSU03) STKTSU03, ' +
            'SUM(STKTMG03) STKTMG03, SUM(STKTMU03) STKTMU03, ' +
            'SUM(STKTSG04) STKTSG04, SUM(STKTSU04) STKTSU04, ' +
            'SUM(STKTMG04) STKTMG04, SUM(STKTMU04) STKTMU04, ' +
            'SUM(STKTSG05) STKTSG05, SUM(STKTSU05) STKTSU05, ' +
            'SUM(STKTMG05) STKTMG05, SUM(STKTMU05) STKTMU05, ' +
            'SUM(STKTSG06) STKTSG06, SUM(STKTSU06) STKTSU06, ' +
            'SUM(STKTMG06) STKTMG06, SUM(STKTMU06) STKTMU06, ' +
            'SUM(STKTSG07) STKTSG07, SUM(STKTSU07) STKTSU07, ' +
            'SUM(STKTMG07) STKTMG07, SUM(STKTMU07) STKTMU07, ' +
            'SUM(STKTSG08) STKTSG08, SUM(STKTSU08) STKTSU08, ' +
            'SUM(STKTMG08) STKTMG08, SUM(STKTMU08) STKTMU08, ' +
            'SUM(STKTSG09) STKTSG09, SUM(STKTSU09) STKTSU09, ' +
            'SUM(STKTMG09) STKTMG09, SUM(STKTMU09) STKTMU09, ' +
            'SUM(STKTSG10) STKTSG10, SUM(STKTSU10) STKTSU10, ' +
            'SUM(STKTMG10) STKTMG10, SUM(STKTMU10) STKTMU10, ' +
            'SUM(STKTSG11) STKTSG11, SUM(STKTSU11) STKTSU11, ' +
            'SUM(STKTMG11) STKTMG11, SUM(STKTMU11) STKTMU11, ' +
            'SUM(STKTSG12) STKTSG12, SUM(STKTSU12) STKTSU12, ' +
            'SUM(STKTMG12) STKTMG12, SUM(STKTMU12) STKTMU12 ' +
            'FROM LOG316 ' +
            'WHERE ARTID=' + QuotedStr(sArt) + ' AND STKANO=' + QuotedStr(DMALM.StrZero(IntToStr(YX), 4));
      End;

      DMALM.cdsQry6.Close;
      DMALM.cdsQry6.DataRequest(xSQL);
      DMALM.cdsQry6.Open;

      xSQL := 'UPDATE TGE205 SET ' +
         'ARTCPROG=' + Floattostr(DMALM.cdsQry4.fieldbyname('ARTCPROG' + DMALM.StrZero(IntToStr(MX), 2)).AsFloat) + ', ' +
         'ARTCPROU=' + Floattostr(DMALM.cdsQry4.fieldbyname('ARTCPROU' + DMALM.StrZero(IntToStr(MX), 2)).AsFloat) + ', ';
      If MX = 12 Then
      Begin
         xSQL := xSQL + ' ARTCNTG=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKSACTG').AsFloat) + ', ' +
            ' ARTCNTU=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKSACTU').AsFloat) + ', ' +
            ' ARTMNTG=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKMACTG').AsFloat) + ', ' +
            ' ARTMNTU=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKMACTU').AsFloat);
      End
      Else
      Begin
         xSQL := xSQL + ' ARTCNTG=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKTSG' + DMALM.StrZero(IntToStr(M), 2)).AsFloat) + ', ' +
            ' ARTCNTU=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKTSU' + DMALM.StrZero(IntToStr(M), 2)).AsFloat) + ', ' +
            ' ARTMNTG=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKTMG' + DMALM.StrZero(IntToStr(M), 2)).AsFloat) + ', ' +
            ' ARTMNTU=' + Floattostr(DMALM.cdsQry6.fieldbyname('STKTMU' + DMALM.StrZero(IntToStr(M), 2)).AsFloat);

      End;

      If length(xArticulo) > 0 Then xSQL := xSQL + xWhereArt;
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

      xSQL := 'SELECT * FROM TGE205';
      If length(xArticulo) > 0 Then
         xSQL := xSQL + xWhereArt;
      DMALM.cdsArtiStk.close;
      DMALM.cdsArtiStk.DataRequest(xSQL);
      DMALM.cdsArtiStk.Open;
      If DMALM.cdsArtiStk.IndexFieldNames <> 'ARTID' Then
         DMALM.cdsArtiStk.IndexFieldNames := 'ARTID';

      While (Not DMALM.cdsKDX.eof) And (DMALM.cdsKDX.fieldbyname('ARTID').AsString = sArt) Do
      Begin
         Application.ProcessMessages;
         pbProceso.Position := pbProceso.Position + 1;
         sFechaNota := DMALM.cdsKDX.FieldByName('NISAFREG').AsDateTime;
         sCIA := DMALM.cdsKDX.FieldByName('CIAID').AsString;
         sLOC := DMALM.cdsKDX.FieldByName('LOCID').AsString;
         sTIN := DMALM.cdsKDX.FieldByName('TINID').AsString;
         sALM := DMALM.cdsKDX.FieldByName('ALMID').AsString;
            /////RESERVAS
         xReserva := 0;
         xSQL := ' SELECT SUM(DPEDCANTRE) STKRACTG FROM FAC302 ' +
            ' WHERE CIAID=' + Quotedstr(sCIa) +
            ' AND TINID=' + Quotedstr(sTIN) +
            ' AND ALMID=' + Quotedstr(sALM) +
            ' AND ARTID=' + Quotedstr(DMALM.cdsKDX.FieldByName('ARTID').AsString) +
      //              xWhereArt+' AND (DPEDSIT=''INICIAL'' OR DPEDSIT=''PENDIENTE'') AND DPEDSALDO > 0 ';
         ' AND (DPEDSIT=''INICIAL'' OR DPEDSIT=''PENDIENTE'') AND DPEDSALDO > 0 ';
         DMALM.cdsNieto.Close;
         DMALM.cdsNieto.DataRequest(Xsql);
         DMALM.cdsNieto.Open;
         If DMALM.cdsNieto.recordcount > 0 Then
            xReserva := DMALM.cdsNieto.fieldbyname('STKRACTG').AsFloat;

            ////////
         DecodeDate(sFechaNota, Y, M, D);
         Ano := IntToStr(Y);
         Mes := DMALM.StrZero(IntToStr(M), 2);
              // campo ingreso o salida del mes del movimiento (stock y monto)
         If DMALM.cdsKDX.fieldbyname('NISATIP').AsString = 'INGRESO' Then
         Begin
            DMALM.ControlStock(sCIA, sALM, sLOC, sTIN, sArt, Ano, Mes, Contenido, 'I'); // Act. LOG316 (STK)
              // actualiza maestro de articulos
            DMALM.ActualizaArticulo(sCIA, sArt, Contenido, 'I'); // Act. TGE205
         End
         Else
         Begin
            DMALM.ControlStock(sCIA, sALM, sLOC, sTIN, sArt, Ano, Mes, Contenido, 'S'); // Act. LOG316 (STK)
              // actualiza maestro de articulos
            DMALM.ActualizaArticulo(sCIA, sArt, Contenido, 'S'); // Act. TGE205
         End;
         DMALM.SaldosIniciales(sCIA, sArt, Ano + Mes, Contenido, DMALM.cdsArtiStk.fieldbyname('ARTCPROG').AsFloat); // Act. LOG316 (STK)
         DMALM.cdsKDX.next;
      End;
            // actualiza saldos
            //DMALM.ControlTran;
      DMALM.cdsSTK.ApplyUpdates(0);
      DMALM.cdsArtiStk.ApplyUpdates(0);
      DMALM.cdsKDX.ApplyUpdates(0);

//      end;
   End;

   xReserva := 0;
   lblArticulo.Caption := '';
   pbProceso.Visible := False;
   Screen.Cursor := crDefault;
       //Information(Caption, ' Ok ');
   dblcdArt.SetFocus;
End;

Procedure TFReprocesa.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
//      if self.ActiveControl Is TDBMemo then Exit;
//      if self.ActiveControl Is TMemo then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFReprocesa.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   //FVariables.w_Num_Formas := FVariables.w_Num_Formas-1;
End;

End.

