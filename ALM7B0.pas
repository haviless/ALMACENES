Unit ALM7B0;

// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Mant, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ExtCtrls, StdCtrls, wwdblook, wwclient, db, ppBands, ppVar,
   ppCtrls, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppCache,
   ppDB, ppDBPipe, ppViewr, ComCtrls, Wwdbigrd, Wwdbgrid, ppTypes;

Type
   TFToolAlm = Class(TForm)
      pnGLT: TPanel;
      dblcAlmacen: TwwDBLookupCombo;
      Label1: TLabel;
      edtAlmacen: TEdit;
      Z1sbMenuReglas2: TSpeedButton;
      SpeedButton1: TSpeedButton;
      rgSeleccion: TRadioGroup;
      SpeedButton2: TSpeedButton;
      sbtnOrdenDespacho: TSpeedButton;
      ppDBPipeline1: TppDBPipeline;
      ppRepOrden: TppReport;
      ppDBConsolidado: TppDBPipeline;
      ppRConsPedido: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLine01: TppLine;
      ppLine02: TppLine;
      ppDetailBand1: TppDetailBand;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppHeaderBand3: TppHeaderBand;
      ppShape2: TppShape;
      pplblCiaOD: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppLabel64: TppLabel;
      ppLine10: TppLine;
      ppLabel68: TppLabel;
      ppLabel77: TppLabel;
      pplblCopia2: TppLabel;
      ppLabel92: TppLabel;
      pplblZonaOD: TppLabel;
      ppLabel94: TppLabel;
      pplbRucCia: TppLabel;
      pplblDirEmp: TppLabel;
      ppLabel103: TppLabel;
      pplblServ: TppLabel;
      ppDBText9: TppDBText;
      ppLabel65: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel66: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppLabel67: TppLabel;
      ppSystemVariable8: TppSystemVariable;
      ppLabel82: TppLabel;
      pplblUsuario: TppLabel;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      ppdbtClieId: TppDBText;
      ppLabel75: TppLabel;
      ppLabel78: TppLabel;
      pplblVendedorOD: TppLabel;
      pplblLugarEntrega: TppLabel;
      ppLabel86: TppLabel;
      ppLabel88: TppLabel;
      pplblCCom: TppLabel;
      ppLabel91: TppLabel;
      ppdbtDcto1: TppDBText;
      ppLabel72: TppLabel;
      pplblZonaD: TppLabel;
      ppdbtClieDes: TppDBText;
      ppdbtClieDir: TppDBText;
      ppLine4: TppLine;
      ppdbClieRUC: TppDBText;
      ppLabel74: TppLabel;
      pplblFEntrega: TppLabel;
      pplblNDespachoID: TppLabel;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      pplblDAgencia: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppdbtArtId: TppDBText;
      ppdbtArtDes: TppDBText;
      ppdbtUM: TppDBText;
      ppvCantEnt: TppVariable;
      ppvCantFrac: TppVariable;
      ppDBText15: TppDBText;
      ppDBText19: TppDBText;
      ppFooterBand3: TppFooterBand;
      ppLine11: TppLine;
      ppLabel108: TppLabel;
      pplbRuc2: TppLabel;
      ppLine12: TppLine;
      ppLabel110: TppLabel;
      ppLabel111: TppLabel;
      ppLabel112: TppLabel;
      pplblPorCia: TppLabel;
      ppLabel114: TppLabel;
      ppdbtClientePie: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      Timer1: TTimer;
      Procedure dblcAlmacenExit(Sender: TObject);
      Procedure Z1sbMenuReglas2Click(Sender: TObject);
      Procedure SpeedButton1Click(Sender: TObject);
      Procedure dblcAlmacenNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure SpeedButton2Click(Sender: TObject);
      Procedure rgSeleccionClick(Sender: TObject);
      Procedure sbtnOrdenDespachoClick(Sender: TObject);
      Procedure ppvCantEntCalc(Sender: TObject; Var Value: Variant);
      Procedure ppRepOrdenPreviewFormCreate(Sender: TObject);
      Procedure ppRConsPedidoPreviewFormCreate(Sender: TObject);
      Procedure ppRepOrdenPrintingComplete(Sender: TObject);
      Procedure ppvCantEntPrint(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);

   Private
  { Private declarations }
      grid: TwwDBGrid;
      cdsAlmacen: TwwClientDataSet;
      MAlmacen: TMant;
      Function DiasSemana(iDia: integer): String;
   Public
  { Public declarations }
   End;

Var
   FToolAlm: TFToolAlm;
   xTAutoNum, xTAno, xTMes: String;
   xFlgImp: Boolean;
   xAccesoBotones: Boolean;

Implementation

{$R *.DFM}
Uses ALMDM1, oaIN4000;

Procedure TFToolAlm.dblcAlmacenExit(Sender: TObject);
Var
   sWhere: String;
Begin
   If length(dblcAlmacen.text) > 0 Then
   Begin
      sWhere := 'ALMID=' + '''' + dblcAlmacen.text + '''';
      edtAlmacen.text := DMALM.DisplayDescrip('dspUltTGE', 'TGE151', 'ALMDES', sWhere, 'ALMDES');
      If length(edtAlmacen.Text) = 0 Then
      Begin
         ShowMessage('Código de Almacen no existe');
         dblcAlmacen.Text := '';
         dblcAlmacen.SetFocus;
      End;
   End;
End;

Procedure TFToolAlm.Z1sbMenuReglas2Click(Sender: TObject);
Var
   sSQL: String;
Begin
   If rgSeleccion.ItemIndex = 0 Then
   Begin //Pedido
      sSQL := 'SELECT FAC302.PEDIDO,FAC302.PEDFECHA,FAC302.GRARID,FAC302.ARTID,FAC302.ARTDES,'
         + ' FAC302.UNMIDO,FAC302.DPEDCANTAC,FAC302.DPEDSALDO,FAC302.CIAID,FAC302.ALMID,'
         + ' (COALESCE(LOG316.STKSACTG,0)-COALESCE(LOG316.STKRACTG,0)) STKSACTG '
         + ' from FAC302 '
         + ' left outer join LOG316 on (FAC302.CIAID=LOG316.CIAID and FAC302.ALMID=LOG316.ALMID and FAC302.ARTID=LOG316.ARTID)'
         + ' where (DPEDSIT=''PENDIENTE''  AND DPEDESTADO=''ALMACEN'') AND DPEDARTIAN=''N'' ';
      //+' where (DPEDSIT=''PENDIENTE''  ) AND DPEDARTIAN=''N'' ';
   End
   Else
      If rgSeleccion.ItemIndex = 1 Then
      Begin //Por Articulo
         sSQL := 'SELECT ' + quotedstr('***') + ' PEDIDO, GRARID, ARTID, ARTDES, UNMIDO, SUM(DPEDCANTXA ) DPEDCANTAC, SUM(DPEDSALDO) DPEDSALDO, '
            + 'CIAID,ALMID,0 STKSACTG,''01/01/2002'' PEDFECHA '
            + 'FROM FAC302'
     //+' WHERE DPEDSIT=''PENDIENTE'' AND DPEDARTIAN=''N'' '
         + 'where (DPEDSIT=''PENDIENTE''  AND DPEDESTADO=''ALMACEN'') AND DPEDARTIAN=''N'' '
            + 'GROUP BY GRARID,ARTID,ARTDES,UNMIDO,CIAID,ALMID ORDER BY ARTID';
      End;
 {FPrincipal.GAlmacen.UsuarioSQL.Clear;
 FPrincipal.GAlmacen.UsuarioSQL.Add(sSQL);
  FPrincipal.GAlmacen.RefreshFilter;}
   Mtx4000.TableName := 'VWFACALMACEN';
   Mtx4000.ClientDataSet.Close;
   Mtx4000.ClientDataSet.DataRequest(sSQL);
   Mtx4000.ClientDataSet.Open;
   If rgSeleccion.ItemIndex = 0 Then
   Begin
      Mtx4000.FMant.bbtnGruposClick(Sender);
      Mtx4000.NoVisible.Clear;
   End
   Else
   Begin
      Mtx4000.NoVisible.Add('PEDIDO');
      Mtx4000.NoVisible.Add('PEDFECHA');
   End;
   Mtx4000.RefreshDisplay;
End;

Procedure TFToolAlm.SpeedButton1Click(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'SELECT  PEDIDO, GRARID, ARTID, ARTDES, UNMIDO, DPEDCANTXA, '
      + 'DPEDCANTAC, CIAID,ALMID, PEDFECHA '
      + 'FROM FAC302 WHERE DPEDESTADO=''ALMACEN'' AND DPEDSIT=''PENDIENTE'' AND DPEDARTIAN=''N'' '
      + 'ORDER BY ARTID';
   DMALM.cdsQry6.IndexFieldNames := 'ARTID';
   DMALM.cdsQry6.close;
   DMALM.cdsQry6.DataRequest(xSQL);
   DMALM.cdsQry6.Open;
   If DMALM.cdsQry6.recordcount = 0 Then exit;
 //DMALM.cdsQry6.MasterFields := 'ARTID';
  //DMALM.cdsqRY6.MasterSource := DMALM.dsKdx;

   ppDBConsolidado.DataSource := DMALM.dsQry6;
   ppRConsPedido.template.fileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsolidadoPedido.rtm';
   ppRConsPedido.template.LoadFromFile;
   ppRConsPedido.Print;
   ppRConsPedido.Stop;
   DMALM.cdsQry6.MasterSource := Nil;
   DMALM.cdsQry6.MasterFields := '';
   DMALM.cdsQry6.IndexFieldNames := '';

End;

Procedure TFToolAlm.dblcAlmacenNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;

End;

Procedure TFToolAlm.SpeedButton2Click(Sender: TObject);
Var
   xInt, xSolu, xSoluDes, xSQL: String;
Begin
   cdsAlmacen := Mtx4000.FMant.cds2; //Despachos
   MAlmacen := Mtx4000;
   If cdsAlmacen.RecordCount = 0 Then exit;

   If cdsAlmacen.FieldByName('PEDESTADO').AsString = 'G' Then
      Raise exception.Create('El Pedido se encuentra Guiado')
   Else
      If cdsAlmacen.FieldByName('PEDESTADO').AsString = 'D' Then
         Raise exception.Create('El Pedido se encuentra en Despacho')
      Else
         If cdsAlmacen.FieldByName('PEDESTADO').AsString = 'I' Then
            Raise exception.Create('El Pedido no se encuentra Aceptado');

   If MessageDlg('Pasar el Pedido a Despacho' + chr(13) + '      ¿ Esta Seguro ?      ',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo Then exit;
   xInt := DMALM.DisplayDescrip('dspUltTGE', 'FAC113', 'INTID', 'INTVAR=''AM''', 'INTID');

   xSolu := DMALM.DisplayDescrip('dspUltTGE', 'FAC114', 'SOLUID', 'SOLUFLAG=''O''', 'SOLUID');
   xSoluDes := DMALM.cdsULTTGE.FieldByName('SOLUDES').AsString;
   xInt := DMALM.DisplayDescrip('dspUltTGE', 'FAC113', 'INTID', 'INTVAR=''AD''', 'INTID');

   xSQL := 'INSERT INTO FAC310 (CIAID, LOCID,CLIEID, CLIERUC, PEDIDO, ETAPAID, INTID,'
      + ' HOJTFECREG, HOJTHORREG,SOLUID,SOLUFID,SOLUDES  )'
      + ' VALUES(' + '''' + cdsAlmacen.FieldByName('CIAID').AsString + '''' + ',' + '''' + cdsAlmacen.FieldByName('LOCID').AsString + ''''
      + ',' + '''' + cdsAlmacen.FieldByName('CLIEID').AsString + '''' + ',' + '''' + cdsAlmacen.FieldByName('CLIERUC').AsString + ''''
      + ',' + '''' + cdsAlmacen.FieldByName('PEDIDO').AsString + ''''
      + ',' + '''' + DMALM.cdsULTTGE.fieldbyname('EtapaId').AsString + '''' + ',' + '''' + xInt + ''''
      + ',' + DMALM.wRepFecServi + ',' + DMALM.wRepTimeServi + ''
      + ',' + '''' + xSolu + '''' + ',' + '''' + xSolu + '''' + ',' + '''' + xSOluDes + '''' + ' )';
   DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

   cdsAlmacen.Edit;
   cdsAlmacen.FieldByName('PEDESTADO').AsString := 'D'; //Despacho
   cdsAlmacen.Post;
   DMALM.AplicaDatos(cdsAlmacen, 'MOVFAC');
   MAlmacen.RefreshFilter;

End;

Procedure TFToolAlm.rgSeleccionClick(Sender: TObject);
Begin
   Z1sbMenuReglas2Click(Sender);
End;

Procedure TFToolAlm.sbtnOrdenDespachoClick(Sender: TObject);
Var
   xSQL, xWhere, xNDespacho: String;
   xSectorDes, xCZipId, xCZipDes, xZonaVtaId, xZonaVtaDes: String;
   i: Integer;
   wDia, wMes, wAno: word;
   xFlagNDesp: boolean;

Begin
   Grid := Mtx4000.FMant.dbgFiltro;
   For i := 0 To grid.SelectedList.Count - 1 Do
   Begin
      grid.datasource.dataset.GotoBookmark(grid.SelectedList.items[i]);

  // Si se modifica, hacerlo tambien en el ALM430
      xFlgImp := False;
      ppRepOrden.template.fileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\OrdenDespacho.rtm';
      ppRepOrden.template.LoadFromFile;

      Screen.Cursor := crHourGlass;
      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      Begin
         xSQL := 'SELECT FAC302.CIAID, FAC302.CLIEID, TGE204.CLIERUC, TGE204.CLIEDES, TGE204.CLIEDIR, TGE204.CLIETELF, '
            + 'FAC302.PEDIDO, FAC302.DPEDFREG, FAC302.GRARID, FAC302.ARTID, FAC302.ARTDES, '
            + 'FAC302.DPEDDCTO1, FAC302.UNMIDO, FAC302.DPEDSALDO, FAC302.DPEDCANTAC, FAC302.DPEDITEM, FAC302.UNMIDG, '
            + 'FAC302.DPEDCANTXA, (COALESCE(LOG316.STKSACTG,0)-COALESCE(LOG316.STKRACTG,0)+COALESCE(FAC302.DPEDCANTRE,0)) STKSACTG, DPEDOBS '
            + 'FROM FAC302 '
            + 'LEFT OUTER JOIN TGE204 ON (FAC302.CIAID=TGE204.CIAID AND FAC302.CLIEID=TGE204.CLIEID) '
            + 'LEFT OUTER JOIN LOG316 ON (FAC302.CIAID=LOG316.CIAID AND FAC302.ALMID=LOG316.ALMID AND FAC302.ARTID=LOG316.ARTID) '
            + 'WHERE FAC302.CIAID =' + quotedstr(DMALM.cdsMovFac.FieldByName('CIAID').AsString) + ' '
            + 'AND FAC302.CLIEID =' + quotedstr(DMALM.cdsMovFac.FieldByName('CLIEID').AsString) + ' '
            + 'AND FAC302.PEDIDO =' + quotedstr(DMALM.cdsMovFac.FieldByName('PEDIDO').AsString) + ' '
            + 'AND DPEDARTIAN=' + quotedstr('N') + ' '
            + 'AND DPEDCANTXA>0 '
            + 'ORDER BY DPEDITEM';
      End
      Else
         If SRV_D = 'ORACLE' Then
         Begin
            xSQL := 'SELECT FAC302.CIAID, FAC302.CLIEID, TGE204.CLIERUC, TGE204.CLIEDES, TGE204.CLIEDIR, TGE204.CLIETELF, '
               + 'FAC302.PEDIDO, FAC302.DPEDFREG, FAC302.GRARID, FAC302.ARTID, FAC302.ARTDES, '
               + 'FAC302.DPEDDCTO1, FAC302.UNMIDO, FAC302.DPEDSALDO, FAC302.DPEDCANTAC, FAC302.DPEDITEM, FAC302.UNMIDG, '
               + 'FAC302.DPEDCANTXA, (LOG316.STKSACTG-LOG316.STKRACTG+FAC302.DPEDCANTRE) STKSACTG,DPEDOBS '
               + 'FROM FAC302, TGE204, LOG316 '
               + 'WHERE FAC302.CIAID =' + quotedstr(DMALM.cdsMovFac.FieldByName('CIAID').AsString)
               + 'AND FAC302.CLIEID =' + quotedstr(DMALM.cdsMovFac.FieldByName('CLIEID').AsString)
               + 'AND FAC302.PEDIDO =' + quotedstr(DMALM.cdsMovFac.FieldByName('PEDIDO').AsString)
               + 'AND DPEDARTIAN=' + quotedstr('N')
               + 'AND DPEDCANTXA>0'
               + 'AND FAC302.CIAID=TGE204.CIAID AND FAC302.CLIEID=TGE204.CLIEID '
               + 'AND FAC302.CIAID=LOG316.CIAID AND FAC302.ALMID=LOG316.ALMID AND FAC302.ARTID=LOG316.ARTID '
               + 'ORDER BY DPEDITEM';
         End;

      DMALM.cdsQry6.IndexFieldNames := '';
      DMALM.cdsQry6.Close;
      DMALM.cdsQry6.DataRequest(xSQL);
      DMALM.cdsQry6.Open;
      If DMALM.cdsQry6.RecordCount = 0 Then
         Raise exception.Create('No existen Datos a imprimir!!! ');

      decodedate(DMALM.cdsMovFac.fieldbyname('PEDFECENT').AsDatetime, wAno, wMes, wDia);

      xSQL := DiasSemana(DayOfWeek(DMALM.cdsMovFac.fieldbyname('PEDFECENT').AsDatetime)) + ' '
         + inttostr(wDia) + ' ' + DMALM.NombreMes(wMes) + ' del ' + inttostr(wAno);
      pplblFEntrega.Caption := xSQL;

      xWhere := 'CIAID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('CIAID').AsString);
      pplblCiaOD.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE101', '*', xWhere, 'CIADES');
      pplbRucCia.caption := DMALM.cdsQry.FieldByName('CIARUC').AsString;
      pplblDirEmp.Caption := DMALM.cdsQry.FieldByName('CIADIRE').AsString;
      pplblServ.Caption := DMALM.cdsQry.FieldByName('CIATLF').AsString;

      xFlagNDesp := false;
      xNDespacho := '';
      pplblNDespachoID.Caption := DMALM.cdsMovFac.FieldByName('NOTADESPID').AsString;

      xWhere := 'EMPID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('EMPID').AsString);
      pplblDAgencia.Caption := DMALM.DisplayDescrip('dspUltTGE', 'FAC104', 'EMPABR', xWhere, 'EMPABR');

      pplblUsuario.caption := DMALM.wUsuario;

      xCZipId := DMALM.cdsMovFac.FieldByName('ZIPID').AsString;

      xWhere := 'ZIPID=' + quotedstr(xCZipId);
      xCZipDes := DMALM.DisplayDescrip('dspUltTGE', 'TGE122', 'ZIPDES', xWhere, 'ZIPDES');

      xZonaVtaId := DMALM.cdsMovFac.FieldByName('ZONVTAID').AsString;

      xWhere := 'ZVTAID=' + quotedstr(xZonaVtaId);
      xZonaVtaDes := DMALM.DisplayDescrip('dspUltTGE', 'FAC106', 'ZVTADES,TVTAID', xWhere, 'ZVTADES');

      xWhere := 'TVTAID=' + quotedstr(DMALM.cdsQry.fieldbyname('TVTAID').AsString);
      xSectorDes := DMALM.DisplayDescrip('dspUltTGE', 'FAC105', 'TVTADES', xWhere, 'TVTADES');

      pplblLugarEntrega.Caption := DMALM.cdsMovFac.FieldByName('PEDDIRENT').AsString + ' ' + xCZipDes;
      pplblZonaOD.caption := xZonaVtaDes + ' - ' + xSectorDes;
      pplblZonaD.caption := xZonaVtaDes + ' - ' + xSectorDes;
      xWhere := 'CIAID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('CIAID').AsString)
         + ' and SCOMERID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('TIPVTAID').AsString)
         + ' and CCOMERID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('FPAGOID').AsString);
      pplblCCom.Caption := DMALM.DisplayDescrip('dspUltTGE', 'TGE180', 'DCCOMDES', xWhere, 'DCCOMDES');

      xWhere := 'CIAID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('CIAID').AsString)
         + ' and VEID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('VEID').AsString);
      pplblVendedorOD.Caption := DMALM.cdsMovFac.fieldbyname('VEID').AsString + ' ' +
         DMALM.DisplayDescrip('dspUltTGE', 'CXC203', 'VENOMBRES', xWhere, 'VENOMBRES');
      pplblPorCia.Caption := 'Por:' + pplblCiaOD.Caption;
      pplbRuc2.Caption := pplbRucCia.caption;
      ppDBPipeline1.DataSource := DMALM.dsQry6;

      If DMALM.cdsMovFac.fieldbyname('PEDIMP').AsInteger >= 1 Then
      Begin
         If MessageDlg('Desea volver a Imprimir la Orden de Despacho ' + Quotedstr(DMALM.cdsMovFac.FieldByName('NOTADESPID').AsString)
            + chr(13) + '', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Begin
            Screen.Cursor := crDefault;
//           break;
         End
         Else
         Begin
            Screen.Cursor := crDefault;
            ppRepOrden.Print;
            ppRepOrden.Stop;
         End;

      End
      Else
      Begin
         Screen.Cursor := crDefault;
         ppRepOrden.Print;
         ppRepOrden.Stop;
      End;

      If xFlgImp Then
      Begin
         DMALM.cdsMovFac.Edit;
         DMALM.cdsMovFac.FieldByName('PEDIMP').AsFloat := DMALM.cdsMovFac.FieldByName('PEDIMP').AsFloat + 1;
         DMALM.cdsMovFac.FieldByName('PEDHOR').AsDateTime := Time;
         DMALM.cdsMovFac.Post;
         xSQL := 'SELECT * FROM FAC301 '
            + ' WHERE CIAID=' + Quotedstr(DMALM.cdsMovFac.FieldByName('CIAID').AsString)
            + ' AND PEDIDO=' + Quotedstr(DMALM.cdsMovFac.FieldByName('PEDIDO').AsString);
         DMALM.cdsMovFac.DataRequest(xSQL);
         DMALM.ControlTran(9, DMALM.cdsMovFac, 'MOVFAC');
      End;

  // Si se modifica, hacerlo tambien en el ALM430
      xFlagNDesp := false;
      xNDespacho := '';
      DMALM.cdsQry6.Close;
      DMALM.cdsQry6.Filter := '';
      DMALM.cdsQry6.IndexfieldNames := '';
   End;
   grid.SelectedList.clear;
End;

Procedure TFToolAlm.ppvCantEntCalc(Sender: TObject; Var Value: Variant);
Var
   fEntero, fNumero, fdecimal, ffrac: double;
   sCont, sUnMid: String;
Begin
   fNumero := DMALM.cdsQry6.FieldByName('DPEDCANTXA').AsFloat;
   SUnMid := DMALM.cdsQry6.FieldByName('UNMIDG').AsString;
   fEntero := Int(fNumero);
   fdecimal := Frac(fNumero);
   sCont := DMALM.DisplayDescrip('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(sUnmid), 'EUNMEQ');
   ppvCantFrac.Text := '';
   If (fdecimal > 0) Then
   Begin
      fFrac := DMALM.FRound(fdecimal * StrToFloat(sCont), 15, 0);
      ppvCantFrac.Text := FloatToStr(fFrac) + '/' + sCont;
   End;
   Value := FloatToStr(fEntero) + '.00';
End;

Procedure TFToolAlm.ppRepOrdenPreviewFormCreate(Sender: TObject);
Begin
   ppRepOrden.PreviewForm.ClientHeight := 500;
   ppRepOrden.PreviewForm.ClientWidth := 650;
   TppViewer(ppRepOrden.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolAlm.ppRConsPedidoPreviewFormCreate(Sender: TObject);
Begin
   ppRConsPedido.PreviewForm.ClientHeight := 500;
   ppRConsPedido.PreviewForm.ClientWidth := 650;
   TppViewer(ppRConsPedido.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolAlm.ppRepOrdenPrintingComplete(Sender: TObject);
Begin
   xFlgImp := True;
End;

Function TFToolAlm.DiasSemana(iDia: integer): String;
Begin
   Case iDia Of
      1:
         Begin
            result := 'Domingo'
         End;
      2:
         Begin
            result := 'Lunes'
         End;
      3:
         Begin
            result := 'Martes'
         End;
      4:
         Begin
            result := 'Miercoles'
         End;
      5:
         Begin
            result := 'Jueves'
         End;
      6:
         Begin
            result := 'Viernes'
         End;
      7:
         Begin
            result := 'Sabado'
         End;
   End; //CASE
End;

Procedure TFToolAlm.ppvCantEntPrint(Sender: TObject);
Var
   fEntero, fNumero, fdecimal, ffrac: double;
   sCont, sUnMid: String;
Begin
   fNumero := DMALM.cdsQry6.FieldByName('DPEDCANTXA').AsFloat;
   SUnMid := DMALM.cdsQry6.FieldByName('UNMIDG').AsString;
   fEntero := Int(fNumero);
   fdecimal := Frac(fNumero);
   sCont := DMALM.DisplayDescrip('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(sUnmid), 'EUNMEQ');
   ppvCantFrac.Text := '';
   If (fdecimal > 0) Then
   Begin
      fFrac := DMALM.FRound(fdecimal * StrToFloat(sCont), 15, 0);
      ppvCantFrac.Text := FloatToStr(fFrac) + '/' + sCont;
   End;
   ppvCantEnt.Text := FloatToStr(fEntero) + '.00';
End;

Procedure TFToolAlm.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolAlm';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolAlm);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

End.

