Unit ALM212;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   ALM212
// Formulario           :   FToolArti
// Fecha de Creación    :
// Autor                :   Equipo de Desarrollo
// Objetivo             :   Barra de herramientas del Mantenimiento de Artículos
//

// Actualizaciones      :
// HPC_201202_ALM  12/11/2012  Se implementó validaciones al campo Afecto a IGV
//                             para evitar los errores en INFODEM
// HPC_201502_ALM  20/06/2015: Ajustes al Movimientos de Almacén
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, StdCtrls, wwdblook, Wwdbdlg, Buttons, ppPrnabl, ppClass,
   ppCtrls, ppDB, ppBands, ppCache, ppProd, ppReport, ppComm, ppRelatv,
   ppDBPipe, ppEndUsr, ppVar, ppParameter, oaVariables, MsgDlgs;

Type
   TFToolArti = Class(TForm)
      pnlTools: TPanel;
      z1sbExporta: TBitBtn;
      ppdbVidaUtil: TppDBPipeline;
      pprVidaUtil: TppReport;
      ppDesigner1: TppDesigner;
      Z1ParamRep: TBitBtn;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLine1: TppLine;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc1: TppDBCalc;
      ppLabel7: TppLabel;
      Timer1: TTimer;
      BitBtn1: TBitBtn;
      ppdb1: TppDBPipeline;
      ppr1: TppReport;
      ppd1: TppDesigner;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppFooterBand2: TppFooterBand;
      bbtnConsig: TBitBtn;
      btnRptArticulos: TBitBtn;
      ppdbCtaArticulo: TppDBPipeline;
      pprCtaArticulo: TppReport;
      ppdCtaArticulo: TppDesigner;
      ppParameterList2: TppParameterList;
      ppHeaderBand3: TppHeaderBand;
      ppShape8: TppShape;
      ppShape7: TppShape;
      ppShape6: TppShape;
      ppShape5: TppShape;
      ppShape4: TppShape;
      ppShape3: TppShape;
      ppShape1: TppShape;
      ppShape2: TppShape;
      ppSystemVariable4: TppSystemVariable;
      ppLabel57: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel58: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel60: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppDBText13: TppDBText;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppDBText8: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText14: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppDBText37: TppDBText;
      ppLabel8: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel9: TppLabel;
      ppShape14: TppShape;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppShape15: TppShape;
      ppLabel13: TppLabel;
      ppShape16: TppShape;
      ppLabel12: TppLabel;
      ppLabel14: TppLabel;
      ppLabel27: TppLabel;
      ppShape17: TppShape;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText9: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBCalc2: TppDBCalc;
      ppFooterBand3: TppFooterBand;
      ppLabel24: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppLine2: TppLine;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      bbtnRecalculo: TBitBtn;
      bbtnRevisaMovAlm: TBitBtn;
      Procedure z1sbExportaClick(Sender: TObject);
      Procedure Z1ParamRepClick(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure bbtnConsigClick(Sender: TObject);
      Procedure btnRptArticulosClick(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
      Procedure bbtnRecalculoClick(Sender: TObject);
      Procedure bbtnRevisaMovAlmClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolArti: TFToolArti;
   xSQL: String;
   xAccesoBotones: Boolean;

Implementation

Uses ALMDM1, ALM202, oaIN2000, ALM810;

{$R *.DFM}

Procedure TFToolArti.z1sbExportaClick(Sender: TObject);
Begin
   FActPCompra := TFActPCompra.Create(self);
   Try
      FActPCompra.ShowModal;
   Finally
      FActPCompra.Free;
   End;
End;

Procedure TFToolArti.Z1ParamRepClick(Sender: TObject);
Var
   xSQL, xWhere: String;
   iX: integer;
   Ano, Mes, Dia: Integer;
Begin
   xWhere := '';
   xSQL := Mtx2000.FMant.SQL;
   For iX := 0 To Length(xSQL) Do
   Begin
      If copy(xSQL, iX, 5) = 'WHERE' Then
      Begin
         xwhere := copy(xSQL, iX + 6, length(xSQL));
         break;
      End;
   End;

   xSQL := 'Select TINID,ARTID,ARTDES,ARTCVIDA,ARTFUMV,'
      + '       to_date(sysdate) FECHAACT,''                            '' DIASSINMOV, '
      + '       ''  '' EXCEDE_VIDA_UTIL '
      + '  from TGE205 ';
   If length(trim(xWhere)) > 0 Then
      xSQL := xSQL + ' where ' + xWhere;
   DMALM.cdsQry3.Close;
   DMALM.cdsQry3.MasterSource := Nil;
   DMALM.cdsQry3.MasterFields := '';
   DMALM.cdsQry3.IndexFieldNames := '';
   DMALM.cdsQry3.Filter := '';
   DMALM.cdsQry3.Filtered := False;
   DMALM.cdsQry3.DataRequest(xSQL);
   DMALM.cdsQry3.Open;
   DMALM.cdsQry3.IndexFieldNames := 'ARTID';
   DMALM.cdsQry3.First;
   While Not DMALM.cdsQry3.eof Do
   Begin
      DMALM.cdsQry3.Edit;
      If DMALM.cdsQry3.FieldByName('ARTFUMV').AsDateTime > 0 Then
      Begin
         DMALM.Tiempo(DMALM.cdsQry3.FieldByName('ARTFUMV').AsDateTime,
            DMALM.cdsQry3.FieldByName('FECHAACT').AsDateTime, Ano, Mes, Dia);
         DMALM.cdsQry3.FieldByName('DIASSINMOV').AsString := InttoStr(Ano) + ' Años ' + InttoStr(Mes) + ' Meses ' + InttoStr(Dia) + ' Días';
         If ((DMALM.cdsQry3.FieldByName('ARTFUMV').AsDateTime + DMALM.cdsQry3.FieldByName('ARTCVIDA').AsInteger)
            < DMALM.cdsQry3.FieldByName('FECHAACT').AsDateTime) Then
            DMALM.cdsQry3.FieldByName('EXCEDE_VIDA_UTIL').AsString := 'SI'
         Else
            DMALM.cdsQry3.FieldByName('EXCEDE_VIDA_UTIL').AsString := 'NO';
      End
      Else
      Begin
         DMALM.cdsQry3.FieldByName('DIASSINMOV').AsString := '*** no hay fecha ult.Mov ***';
      End;
      DMALM.cdsQry3.Next;
   End;

   pprVidaUtil.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\VidaUtildeArticulos.Rtm';
   pprVidaUtil.Template.LoadFromFile;

//   ppDesigner1.Show;
   pprVidaUtil.Print;
End;

Procedure TFToolArti.Timer1Timer(Sender: TObject);
Begin
   FVariables.w_NombreForma := 'FToolArti';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolArti);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

Procedure TFToolArti.BitBtn1Click(Sender: TObject);
Var
   xSQL, xWhere: String;
   iX: integer;
   Ano, Mes, Dia: Integer;
Begin

   xWhere := '';
   xSQL := Mtx2000.FMant.SQL;
   For iX := 0 To Length(xSQL) Do
   Begin
      If copy(xSQL, iX, 5) = 'WHERE' Then
      Begin
         xwhere := copy(xSQL, iX + 6, length(xSQL));
         break;
      End;
   End;

   xSQL := 'Select TGE205.CIAID, TGE205.ARTID, TGE205.ARTDES, TGE205.TIPART, OBSEQUIO, '
      + '       B.TIPARTDES, B.LINCOM, '
      + '       C.LINCOMDES, C.UTILIDAD, D.CIADES, TGE205.ARTPCG, '
      + '       case when nvl(PREVENPRO,0)>0 then nvl(PREVENPRO,0) else nvl(PREVEN,0) end PRECIO, '
      + '       case when nvl(PREVENPRO,0)>0 then nvl(PREVENPRO,0) else nvl(PREVEN,0) end - TGE205.ARTPCG UTIL '
      + '  from TGE205, ALM_TIP_ART B, ALM_LIN_COM C, TGE101 D, FAC201 E '
      + ' where TGE205.CIAID=''04'' AND TGE205.TIPART=B.TIPART(+) AND B.LINCOM=C.LINCOM(+) '
      + '   and TGE205.CIAID=D.CIAID(+) AND NVL(TGE205.CONCESION,''N'')<>''S'' '
      + '   and TGE205.CIAID=E.CIAID AND TGE205.ARTID=E.ARTID AND TLISTAID=''2DE''';

   If length(trim(xWhere)) > 0 Then
      xSQL := xSQL + ' and ' + xWhere;

   xSQL := xSQL + ' ORDER BY ARTID';

   DMALM.cdsQry3.Close;
   DMALM.cdsQry3.MasterSource := Nil;
   DMALM.cdsQry3.MasterFields := '';
   DMALM.cdsQry3.IndexFieldNames := '';
   DMALM.cdsQry3.Filter := '';
   DMALM.cdsQry3.Filtered := False;
   DMALM.cdsQry3.DataRequest(xSQL);
   DMALM.cdsQry3.Open;
   DMALM.cdsQry3.First;

   ppdb1.DataSource := DMALM.dsQry3;

   ppr1.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\Articulos_Utilidad.Rtm';
   ppr1.Template.LoadFromFile;

   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      ppr1.Print;
      ppr1.Stop;
      ppdb1.DataSource := Nil;
      DMALM.cdsQry3.Close;
   End;
End;

Procedure TFToolArti.bbtnConsigClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select CIAID, TINID, ARTID, CONSIGNACION from TGE205 '
      + ' where CIAID=''' + Mtx2000.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + '   and TINID=''' + Mtx2000.FMant.cds2.FieldByName('TINID').AsString + ''' '
      + '   and ARTID=''' + Mtx2000.FMant.cds2.FieldByName('ARTID').AsString + '''';
   DMALM.cdsQry3.Close;
   DMALM.cdsQry3.MasterSource := Nil;
   DMALM.cdsQry3.MasterFields := '';
   DMALM.cdsQry3.IndexFieldNames := '';
   DMALM.cdsQry3.Filter := '';
   DMALM.cdsQry3.Filtered := False;
   DMALM.cdsQry3.DataRequest(xSQL);
   DMALM.cdsQry3.Open;

   If DMALM.cdsQry3.FieldByName('CONSIGNACION').AsString = 'N' Then
   Begin
      If MessageDlg('Articulo NO esta marcado para Consignación ' + chr(13) + chr(13) +
         '           ¿ Desea Marcar ?     ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then exit;

      xSQL := 'Update TGE205 '
         + '   set CONSIGNACION=''S'' '
         + ' where CIAID=''' + Mtx2000.FMant.cds2.FieldByName('CIAID').AsString + ''' '
         + '   and TINID=''' + Mtx2000.FMant.cds2.FieldByName('TINID').AsString + ''' '
         + '   and ARTID=''' + Mtx2000.FMant.cds2.FieldByName('ARTID').AsString + '''';
      Mtx2000.FMant.cds2.Edit;
      Mtx2000.FMant.cds2.FieldByname('CONSIGNACION').AsString := 'S';
      Mtx2000.FMant.cds2.Post;
   End
   Else
   Begin
      If MessageDlg('Articulo SI esta marcado para Consignación ' + chr(13) + chr(13) +
         '           ¿ Desea Des-Marcar ?     ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then exit;

      xSQL := 'Update TGE205 '
         + '   set CONSIGNACION=''N'' '
         + ' where CIAID=''' + Mtx2000.FMant.cds2.FieldByName('CIAID').AsString + ''' '
         + '   and TINID=''' + Mtx2000.FMant.cds2.FieldByName('TINID').AsString + ''' '
         + '   and ARTID=''' + Mtx2000.FMant.cds2.FieldByName('ARTID').AsString + '''';

      Mtx2000.FMant.cds2.Edit;
      Mtx2000.FMant.cds2.FieldByname('CONSIGNACION').AsString := 'N';
      Mtx2000.FMant.cds2.Post;
   End;

//   DMALM.DCOM1.AppServer.IniciaTransaccion;
   Try
      DMALM.cdsQry3.Close;
      DMALM.cdsQry3.DataRequest(xSQL);
      DMALM.cdsQry3.Execute;
//      DMALM.DCOM1.AppServer.GrabaTransaccion;
   Except
//      DMALM.DCOM1.AppServer.RegresaTransaccion;
   End;

   ShowMessage('Ok');
End;
//INICIO HPC_201202_ALM

Procedure TFToolArti.btnRptArticulosClick(Sender: TObject);
Var
   xSQL, xsFiltro: String;
   xsFiltroTexto1, xsFiltroTexto2, xsFiltroTexto3, xsFiltroTexto4: String;
   xsFiltroTexto5, xsFiltroTexto6, xsFiltroTexto7, xsFiltroTexto8: String;
   xsFiltroUsuario: String;
   xnContador: integer;
Begin
   xsFiltroUsuario := '';
   xsFiltroTexto1 := ' ';
   xsFiltroTexto2 := ' ';
   xsFiltroTexto3 := ' ';
   xsFiltroTexto4 := ' ';
   xsFiltroTexto5 := ' ';
   xsFiltroTexto6 := ' ';
   xsFiltroTexto7 := ' ';
   xsFiltroTexto8 := ' ';
   xsFiltro := '';
   For xnContador := 0 To Mtx2000.FMant.lbFiltroReal.Count - 1 Do
   Begin
      If length(trim(xsFiltro)) = 0 Then
      Begin
         xsFiltro := Mtx2000.FMant.lbFiltroReal.items[xnContador];
      End
      Else
      Begin
         xsFiltro := xsFiltro + ' and ' + Mtx2000.FMant.lbFiltroReal.items[xnContador];
      End;
      If xnContador = 0 Then
         xsFiltroTexto1 := Mtx2000.FMant.lbFiltro.items[xnContador]
      Else
         If xnContador = 1 Then
            xsFiltroTexto2 := Mtx2000.FMant.lbFiltro.items[xnContador]
         Else
            If xnContador = 2 Then
               xsFiltroTexto3 := Mtx2000.FMant.lbFiltro.items[xnContador]
            Else
               If xnContador = 3 Then
                  xsFiltroTexto4 := Mtx2000.FMant.lbFiltro.items[xnContador]
               Else
                  If xnContador = 4 Then
                     xsFiltroTexto5 := Mtx2000.FMant.lbFiltro.items[xnContador]
                  Else
                     If xnContador = 5 Then
                        xsFiltroTexto6 := Mtx2000.FMant.lbFiltro.items[xnContador]
                     Else
                        If xnContador = 6 Then
                           xsFiltroTexto7 := Mtx2000.FMant.lbFiltro.items[xnContador]
                        Else
                           If xnContador = 7 Then xsFiltroTexto8 := Mtx2000.FMant.lbFiltro.items[xnContador];

   End;
   If length(trim(xsFiltro)) > 0 Then
   Begin
      xsFiltro := ' AND ' + xsFiltro;
   End;
   If Length(Mtx2000.Filter) > 0 Then
   Begin
      xsFiltroUsuario := ' AND ' + Mtx2000.Filter;
   End;

   xSQL := 'SELECT TGE205.CIAID, ' +
      ' TGE205.TINID, ' +
      ' TGE205.ARTID, ' +
      ' TGE205.ARTDES, ' +
      ' TGE205.GRARID, ' +
      ' LINEA.GRARDES_1, ' +
      ' LINEA.CUENTAID_1, ' +
      ' LINEA.CUENTAHAB_1, ' +
      ' TGE205.FAMID, ' +
      ' TGE205.SFAMID, ' +
      ' TGE205.ARTCNTG, ' +
      ' TGE205.ARTMNTG, ' +
      ' TGE205.ARTIGV, ' +
      ' TGE205.ART_IGV_EXO, ' +
      QuotedStr(DMALM.wUsuario) + ' USUARIO_IMPRIME, ' +
      QuotedStr(xsFiltroTexto1) + ' FILTRO1, ' +
      QuotedStr(xsFiltroTexto2) + ' FILTRO2, ' +
      QuotedStr(xsFiltroTexto3) + ' FILTRO3, ' +
      QuotedStr(xsFiltroTexto4) + ' FILTRO4, ' +
      QuotedStr(xsFiltroTexto5) + ' FILTRO5, ' +
      QuotedStr(xsFiltroTexto6) + ' FILTRO6, ' +
      QuotedStr(xsFiltroTexto7) + ' FILTRO7, ' +
      QuotedStr(xsFiltroTexto8) + ' FILTRO8 ' +
      ' FROM TGE205, (SELECT TGE131.CIAID CIAID_1,' +
      ' TGE131.TINID TINID_1, ' +
      ' TGE131.GRARID GRARID_1,' +
      ' TGE131.GRARDES GRARDES_1,' +
      ' TGE131.CUENTAID CUENTAID_1,' +
      ' TGE131.CUENTAHAB CUENTAHAB_1 ' +
      ' FROM TGE131 ) LINEA ' +
      ' WHERE  TGE205.CIAID = LINEA.CIAID_1 ' +
      ' AND TGE205.TINID = LINEA.TINID_1 ' +
      ' AND TGE205.GRARID = LINEA.GRARID_1  ' +
      xsFiltroUsuario + xsFiltro +
      ' ORDER BY TGE205.CIAID , TGE205.TINID ,TGE205.GRARID, TGE205.FAMID, TGE205.SFAMID,TGE205.ARTID ';

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppdbCtaArticulo.DataSource := DMALM.dsReporte;
   pprCtaArticulo.DataPipeline := ppdbCtaArticulo;

   pprCtaArticulo.Template.FileName := wRutaRpt + '\RptCtaArticulo.rtm';
   pprCtaArticulo.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppdCtaArticulo.Report := pprCtaArticulo ;
   //ppdCtaArticulo.ShowModal() ;
   pprCtaArticulo.Print;
End;
//FIN HPC_201202_ALM

Procedure TFToolArti.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

Procedure TFToolArti.bbtnRecalculoClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If MessageDlg('Recalculo de Artículos' + chr(13) + ' ¿Esta Seguro?   ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then exit;
   Screen.Cursor := crHourGlass;
   Mtx2000.FMant.cds2.First;
   While Not Mtx2000.FMant.cds2.EOF Do
   Begin
      Try
         DMALM.DCOM1.AppServer.IniciaTransaccion;
         xsql := 'BEGIN DB2ADMIN.SP_ALM_REGENERA_STOCK(''' + Mtx2000.FMant.cds2.FieldByName('CIAID').AsString + ''',''' + Mtx2000.FMant.cds2.FieldByName('ARTID').AsString + '''); END;';
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         DMALM.DCOM1.AppServer.GrabaTransaccion;
      Except
         Screen.Cursor := crDefault;
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error en el proceso del artículo ' + Mtx2000.FMant.cds2.FieldByName('ARTID').AsString);
      End;
      Mtx2000.FMant.cds2.Next;
   End;
   ShowMessage('Procesó con exito...');
   Screen.Cursor := crDefault;
End;

Procedure TFToolArti.bbtnRevisaMovAlmClick(Sender: TObject);
Begin
   FRevisaPrecios := TFRevisaPrecios.create(Application);
   Try
      FRevisaPrecios.ShowModal;
   Finally
   End;
End;

End.

