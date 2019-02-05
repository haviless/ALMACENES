Unit ALM418;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   ALM418
// Formulario           :   FToolTomaInventario
// Fecha de Creación    :
// Autor                :   Equipo de Desarrollo
// Objetivo             :   Barra de tarear de Toma deInventario
// HPC_201404_ALM   24/10/2014 Unificación de módulos de Inventarios
//                  13/11/2014 Reordenamiento de Formulario
//                             Ajustes para Toma de Inventario 2014Nov
// HPC_201505_ALM   06/11/2015 Se incluye criterior del filtro MANT a reportes
//                             de la Toma de Inventario
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ExtCtrls, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppProd,
   ppReport, ppDB, ppComm, ppRelatv, ppCache, ppDBPipe, ppviewr, ppTypes,
   ppParameter, oaVariables, ppEndUsr, StdCtrls, wwdblook, Wwdbdlg, Variants, MsgDlgs;

Type
   TFToolTomaInventario = Class(TForm)
      pnl: TPanel;
      Z1sbTomaInv: TSpeedButton;
      Z1sbResulInv: TSpeedButton;
      ppdbTomInv: TppDBPipeline;
      pprTomaInv: TppReport;
      ppdbResulInv: TppDBPipeline;
      pprResulInv: TppReport;
      ppParameterList1: TppParameterList;
      Z1sbInicializaArticulos: TSpeedButton;
      Timer1: TTimer;
      ppd1: TppDesigner;
      ppParameterList2: TppParameterList;
      ppHeaderBand2: TppHeaderBand;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel10: TppLabel;
      ppLabel43: TppLabel;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDetailBand2: TppDetailBand;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText20: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppDBText12: TppDBText;
      ppLabel44: TppLabel;
      ppDBText14: TppDBText;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppHeaderBand1: TppHeaderBand;
      ppLabel2: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppsyvPag: TppSystemVariable;
      ppsyvfecha: TppSystemVariable;
      ppsyvHora: TppSystemVariable;
      pplblTitulo: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel9: TppLabel;
      ppLabel1: TppLabel;
      ppLabel3: TppLabel;
      ppLabel12: TppLabel;
      ppLabel6: TppLabel;
      ppDBText1: TppDBText;
      ppDBText4: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDetailBand1: TppDetailBand;
      ppdbtArtId: TppDBText;
      ppDBText7: TppDBText;
      ppDBText11: TppDBText;
      ppLabel33: TppLabel;
      ppDBText17: TppDBText;
      ppDBText13: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText31: TppDBText;
      pplblArtId: TppLabel;
      ppDBText32: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      Z1sbRepCarga: TSpeedButton;
      Z1sbImpotaInv: TSpeedButton;
      Z1sbResulInvVal: TSpeedButton;
      dblcdArt: TwwDBLookupComboDlg;
      bbtnBuscar: TBitBtn;
      Z1sbCierre: TSpeedButton;
      Z1sbDiferencias: TSpeedButton;
      Z1sbStockSis: TSpeedButton;
      Z1sbReal: TSpeedButton;
      cbMayor: TCheckBox;
      Z1sbTomaInv2: TSpeedButton;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      Procedure Z1sbResulInvClick(Sender: TObject);
      Procedure Z1sbTomaInvClick(Sender: TObject);
      Procedure pprResulInvPreviewFormCreate(Sender: TObject);
      Procedure ppVariable1Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable2Calc(Sender: TObject; Var Value: Variant);
      Procedure Z1sbImpotaInvClick(Sender: TObject);
      Procedure ValidarImportacion;
      Procedure Z1sbInicializaArticulosClick(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure pprTomaInvPreviewFormCreate(Sender: TObject);
      Procedure Z1sbRepCargaClick(Sender: TObject);
      Procedure Z1sbResulInvValClick(Sender: TObject);
      Procedure bbtnBuscarClick(Sender: TObject);
      Procedure dblcdArtEnter(Sender: TObject);
      Procedure Z1sbCierreClick(Sender: TObject);
      Procedure Z1sbStockSisClick(Sender: TObject);
      Procedure Z1sbDiferenciasClick(Sender: TObject);
      Procedure Z1sbRealClick(Sender: TObject);
      Procedure Z1sbTomaInv2Click(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolTomaInventario: TFToolTomaInventario;
   xAccesoBotones: Boolean;

Implementation

Uses ALMDM1, oaIN5000, ALM301;

{$R *.DFM}

Procedure TFToolTomaInventario.Z1sbResulInvClick(Sender: TObject);
Var
   x10: integer;
   xSQL, cCia, cLoc, cTin, cAlm: String;
Begin
   Screen.Cursor := crHourGlass;

   xSQL := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   cCia := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(xSQL), 'CIADES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cLoc := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cTin := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' and ' +
      'CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ' AND ALMID=' + quotedstr(DMALM.cdsCInventario.FieldByName('ALMID').AsString);
   cAlm := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');

   pprResulInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResulInv.Rtm';
   pprResulInv.Template.LoadFromFile;
//Inicio HPC_201404_ALM
   xSQL := 'Select C.GRARDES, D.FAMDES, E.SFAMDES, B.UNMABR, '
      + quotedstr(cCia) + ' CIADES, ' + quotedstr(cLoc) + ' LOCDES, '
      + quotedstr(cTin) + ' TINDES, ' + quotedstr(cAlm) + ' ALMDES, '
      + '       NVL(A.TIPART,''0000'') TIPART, NVL(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
      + '       NVL(T.LINCOM,''00'') LINCOM, NVL(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, '
      + '       K.*, nvl(STKSFISG,0)-nvl(STKSACTG,0) DIFERENCIA '
      + '  from LOG334 K, TGE130 B, TGE131 C, TGE169 D, TGE170 E, TGE205 A, ALM_TIP_ART T, ALM_LIN_COM L '
      + ' where TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) + ' '
      + '   and K.UNMIDG=B.UNMID '
      + '   and K.CIAID=C.CIAID(+) AND K.TINID=C.TINID(+) AND K.GRARID=C.GRARID(+) '
      + '   and K.CIAID=D.CIAID(+) AND K.TINID=D.TINID(+) AND K.GRARID=D.GRARID(+) AND K.FAMID=D.FAMID(+) '
      + '   and K.CIAID=E.CIAID(+) AND K.TINID=E.TINID(+) AND K.GRARID=E.GRARID(+) AND K.FAMID=E.FAMID(+) AND K.SFAMID=E.SFAMID(+) '
      + '   and K.CIAID=A.CIAID(+) AND K.TINID=A.TINID(+) AND K.ARTID=A.ARTID(+) '
      + '   and A.TIPART=T.TIPART(+) '
      + '   and T.LINCOM=L.LINCOM(+) ';
//Final HPC_201404_ALM
   If cbMayor.Checked Then
      xSQL := xSQL + ' and ( K.STKSACTG > 0 or nvl(STKSFISG,0)<>nvl(STKSACTG,0) )';

   xSQL := xSQL + ' ORDER BY K.GRARID, K.FAMID, K.MARCA, K.ARTID';
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQl);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;

   ppdbResulInv.DataSource := DMALM.dsReporte;
   ppd1.Report := pprResulInv;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros');
   End;

   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      pprResulInv.Print;

      pprResulInv.Stop;
      ppdbResulInv.DataSource := Nil;
      ppd1.Report := Nil;

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

Procedure TFToolTomaInventario.Z1sbTomaInvClick(Sender: TObject);
Var
   x10: integer;
   xSQL, cCia, cLoc, cTin, cAlm: String;
// Inicio HPC_201506_ALM
   xWhere, xOrder: String;
   x: integer;
// Fin HPC_201506_ALM
Begin
   Screen.Cursor := crHourGlass;

   xSQL := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   cCia := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(xSQL), 'CIADES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cLoc := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cTin := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' and '
      + 'CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ' AND ALMID=' + quotedstr(DMALM.cdsCInventario.FieldByName('ALMID').AsString);
   cAlm := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');

   pprTomaInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\TomaInv.Rtm';
   pprTomaInv.Template.LoadFromFile;

// Inicio HPC_201506_ALM
// Inicio HPC_201404_ALM
   xSQL := 'Select C.GRARDES, D.FAMDES, E.SFAMDES, B.UNMABR, '
      + quotedstr(cCia) + ' CIADES, ' + quotedstr(cLoc) + ' LOCDES, '
      + quotedstr(cTin) + ' TINDES, ' + quotedstr(cAlm) + ' ALMDES, '
      + '       NVL(A.TIPART,''0000'') TIPART, NVL(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
      + '       NVL(T.LINCOM,''00'') LINCOM, NVL(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, K.* '
      + '  from LOG334 K, TGE130 B, TGE131 C, TGE169 D, TGE170 E, TGE205 A, ALM_TIP_ART T, ALM_LIN_COM L '
      + ' where TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) + ' '
      + '   and ARTADI=''N'' '
      + '   and K.UNMIDG=B.UNMID '
      + '   and K.CIAID=C.CIAID(+) AND K.TINID=C.TINID(+) AND K.GRARID=C.GRARID(+) '
      + '   and K.CIAID=D.CIAID(+) AND K.TINID=D.TINID(+) AND K.GRARID=D.GRARID(+) AND K.FAMID=D.FAMID(+) '
      + '   and K.CIAID=E.CIAID(+) AND K.TINID=E.TINID(+) AND K.GRARID=E.GRARID(+) AND K.FAMID=E.FAMID(+) AND K.SFAMID=E.SFAMID(+) '
      + '   and K.CIAID=A.CIAID(+) AND K.TINID=A.TINID(+) AND K.ARTID=A.ARTID(+) '
      + '   and A.TIPART=T.TIPART(+) '
      + '   and T.LINCOM=L.LINCOM(+) ';
   If cbMayor.Checked Then
      xSQL := xSQL + ' and K.STKSACTG > 0 ';
//   xSQL := xSQL + ' order by K.GRARID, K.FAMID, K.MARCA, Trim(K.ARTDES) ';
   xSQL := xSQL + ' order by K.GRARID, K.FAMID, K.MARCA, Trim(K.ARTID) ';
// Final HPC_201404_ALM

   xWhere := '';
   For x := 0 To Mtx5001.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      If length(xWhere) > 0 Then
         If Copy(Mtx5001.FMant.lbFiltroReal.Items.Strings[x], 1, 4) = ' or ' Then
            xWhere := xWhere + Mtx5001.FMant.lbFiltroReal.Items.Strings[x]
         Else
            xWhere := xWhere + ' and ' + Mtx5001.FMant.lbFiltroReal.Items.Strings[x]
      Else
      Begin
         xWhere := Mtx5001.FMant.lbFiltroReal.Items.Strings[x];
      End;
   End;

   xOrder := '';
   For x := 0 To Mtx5001.FMant.lbOrdenReal.Items.Count - 1 Do
   Begin
      If length(xOrder) > 0 Then
         xOrder := xOrder + ', ' + Mtx5001.FMant.lbOrdenReal.Items.Strings[x]
      Else
      Begin
         xOrder := Mtx5001.FMant.lbOrdenReal.Items.Strings[x];
      End;
   End;

   xSQL := 'Select * from (' + xSQL + ' ) ';

   If length(xWhere) > 0 Then
      xSQL := xSQL + ' where ' + xWhere;
   If length(xOrder) > 0 Then
      xSQL := xSQL + ' Order by ' + xOrder;
// Fin HPC_201506_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQl);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros en la Toma de Inventario');
   End;

   ppdbTomInv.DataSource := DMALM.dsReporte;
   ppd1.Report := pprTomaInv;

   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      pprTomaInv.Print;

      pprTomaInv.Stop;
      ppdbTomInv.DataSource := Nil;
      ppd1.Report := Nil;

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

Procedure TFToolTomaInventario.pprResulInvPreviewFormCreate(
   Sender: TObject);
Begin
   pprResulInv.PreviewForm.ClientHeight := 500;
   pprResulInv.PreviewForm.ClientWidth := 650;
   TppViewer(pprResulInv.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolTomaInventario.ppVariable1Calc(Sender: TObject;
   Var Value: Variant);
Begin
   Value := DMALM.cdsReporte.FieldByName('STKSFISG').AsFloat - DMALM.cdsReporte.FieldByName('STKSACTG').AsFloat
End;

Procedure TFToolTomaInventario.ppVariable2Calc(Sender: TObject;
   Var Value: Variant);
Begin
   Value := DMALM.cdsReporte.FieldByName('STKSFISU').AsFloat - DMALM.cdsReporte.FieldByName('STKSACTU').AsFloat
End;

Procedure TFToolTomaInventario.Z1sbImpotaInvClick(Sender: TObject);
Begin
   ValidarImportacion;
   DMALM.cdsReporte.IndexFieldNames := 'ARTID';
   DMALM.cdsDInventario.First;
   While Not DMALM.cdsDInventario.EOF Do
   Begin
      DMALM.cdsReporte.SetKey;
      DMALM.cdsReporte.FieldByName('ARTID').AsString := DMALM.cdsDInventario.FieldByName('ARTID').AsString;
      If DMALM.cdsReporte.Gotokey Then
      Begin
         DMALM.cdsDInventario.Edit;
         DMALM.cdsDInventario.FieldByName('STKSFISG').AsFloat := DMALM.cdsReporte.FieldByName('STKSFISG').AsFloat;
         DMALM.cdsDInventario.FieldByName('STKSFISU').AsFloat := DMALM.cdsReporte.FieldByName('STKSFISU').AsFloat;
         DMALM.cdsDInventario.FieldByName('STKINV').AsString := 'T';
         DMALM.cdsDInventario.Post;

         DMALM.AplicaDatos(DMALM.cdsDInventario, 'XX');
      End;
      DMALM.cdsDInventario.Next;
   End;

   ShowMessage('Se realizó la importación con éxito');
   DMALM.cdsReporte.IndexFieldNames := '';
End;

Procedure TFToolTomaInventario.ValidarImportacion;
Var
   sSQL: String;
Begin
//Inicio HPC_201404_ALM
   sSQL := ' Select A.TOINID,A.STKANO,A.CIAID,A.LOCID,A.TINID,A.ALMID,A.ARTID,A.ARTDES, '
      + '        B.TOINID,B.STKANO,B.CIAID,B.LOCID,B.TINID,B.ALMID,B.ARTID FROM LOG334 A, LOG335 B '
      + '  where A.TOINID=B.TOINID(+) AND A.STKANO=B.STKANO(+) AND A.CIAID=B.CIAID(+) '
      + '    and A.LOCID=B.LOCID(+) AND A.TINID=B.TINID(+) AND A.ALMID=B.ALMID(+) AND A.ARTID=B.ARTID(+) '
      + '    and A.TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString)
      + '    and A.STKANO=' + QuotedStr(DMALM.cdsCInventario.FieldByName('STKANO').AsString)
      + '    and A.CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + '    and A.LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString)
      + '    and A.TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + '    and A.ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString)
      + '    and B.TOINID IS NULL ';
//Final HPC_201404_ALM
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;
   If DMALM.cdsReporte.RecordCount > 0 Then
   Begin
      Raise Exception.Create('El Artículo ' + DMALM.cdsReporte.FieldByName('ARTID').AsString + ' ' + DMALM.cdsReporte.FieldByName('ARTDES').AsString + ', No existe en el archivo de Importación');
   End;
//Inicio HPC_201404_ALM
   sSQL := ' Select A.ARTID,COUNT(*) TOTAL '
      + '   from LOG335 A '
      + '  where A.TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString)
      + '    and A.STKANO=' + QuotedStr(DMALM.cdsCInventario.FieldByName('STKANO').AsString)
      + '    and A.CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + '    and A.LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString)
      + '    and A.TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + '    and A.ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString)
      + '  group BY A.ARTID HAVING COUNT(*)>1 ';
//Final HPC_201404_ALM
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;
   If DMALM.cdsReporte.RecordCount > 0 Then
   Begin
      Raise Exception.Create('El Artículo ' + DMALM.cdsReporte.FieldByName('ARTID').AsString + ', Está registrado ' + DMALM.cdsReporte.FieldByName('TOTAL').AsString + ' veces en el archivo de Importación');
   End;

//Inicio HPC_201404_ALM
   sSQL := ' Select * '
      + '   from LOG335 '
      + '  where TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString)
      + '    and STKANO=' + QuotedStr(DMALM.cdsCInventario.FieldByName('STKANO').AsString)
      + '    and CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + '    and LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString)
      + '    and TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + '    and ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString);
//Final HPC_201404_ALM
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros para Importar');
   End;
   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.EOF Do
   Begin
      If Length(DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTID',
         ' CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) +
        //Inicio HPC_201404_ALM
         ' and TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString) +
         ' and ARTID=' + QuotedStr(DMALM.cdsReporte.FieldByName('ARTID').AsString), 'ARTID')) = 0 Then
        //Final HPC_201404_ALM
      Begin
         Raise Exception.Create('El Artículo ' + DMALM.cdsReporte.FieldByName('ARTID').AsString + ' ' + DMALM.cdsReporte.FieldByName('ARTDES').AsString + ', No existe en el Maestro de Artículos');
      End;

      If Length(DMALM.DisplayDescrip('prvTGE', 'LOG334', 'ARTID', 'STKANO=' + QuotedStr(DMALM.cdsCInventario.FieldByName('STKANO').AsString) +
        //Inicio HPC_201404_ALM
         ' and TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) +
         ' and STKANO=' + QuotedStr(DMALM.cdsCInventario.FieldByName('STKANO').AsString) +
         ' and CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) +
         ' and LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) +
         ' and TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString) +
         ' and ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString) +
         ' and ARTID=' + QuotedStr(DMALM.cdsReporte.FieldByName('ARTID').AsString), 'ARTID')) = 0 Then
        //Final HPC_201404_ALM
      Begin
         Raise Exception.Create('El Artículo ' + DMALM.cdsReporte.FieldByName('ARTID').AsString + ' ' + DMALM.cdsReporte.FieldByName('ARTDES').AsString + ', No existe en la toma de Inventario');
      End;
      DMALM.cdsReporte.Next;
   End;

End;

Procedure TFToolTomaInventario.Z1sbInicializaArticulosClick(Sender: TObject);
Var
   xSQL, sSQL: String;
Begin
//Inicio HPC_201404_ALM
   xSQL := 'select * '
      + '  from LOG333 '
      + ' where CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + '   and LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString)
      + '   and TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + '   and ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString)
      + '   and TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString)
      + '   and STKANO=' + QuotedStr(DMALM.cdsCInventario.FieldByName('STKANO').AsString);
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existe Toma de Inventario');
   End;

   xSQL := ' Select * '
      + '   from LOG334 '
      + '  where CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + '    and LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString)
      + '    and TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + '    and ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString)
      + '    and TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString)
      + '    and STKANO=' + QuotedStr(DMALM.cdsCInventario.FieldByName('STKANO').AsString);
//Final HPC_201404_ALM
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount > 0 Then
   Begin
      If Not Question('Confirmar', 'La Toma de Inventario Contiene Data, Desea volver a generarla ' + #13 + #13) Then
      Begin
         Screen.Cursor := crDefault;
         exit;
      End;
   End;
//Inicial HPC_201404_ALM
   xSQL := ' Select * '
      + '   from LOG334 '
      + ' where CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + '   and LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString)
      + '   and TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + '   and ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString)
      + '   and TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString)
      + '   and STKANO=' + QuotedStr(DMALM.cdsCInventario.FieldByName('STKANO').AsString)
      + '   and nvl(STKSFISG,0)<>0';
//Final HPC_201404_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount > 0 Then
   Begin
      ShowMessage('La Toma de Inventario Contiene Registro Actualizados por DIGITADORES. Verificar...');
      Screen.Cursor := crDefault;
      exit;
   End;

   Screen.Cursor := crHourGlass;
//Inicio HPC_201404_ALM
   xSQL := 'Delete from LOG334 '
      + ' where CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + '   and LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString)
      + '   and TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + '   and ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString)
      + '   and TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString)
      + '   and STKANO=' + QuotedStr(DMALM.cdsCInventario.FieldByName('STKANO').AsString);
   DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
//Final HPC_201404_ALM

   Screen.Cursor := crHourGlass;

   pprTomaInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\TomaInv.Rtm';
   pprTomaInv.Template.LoadFromFile;

//Inicio HPC_201404_ALM
   sSQL := 'Insert into LOG334 (TOINID, STKANO, CIAID, LOCID, TINID, ALMID, GRARID, FAMID, SFAMID, ARTID, '
      + '                    ARTCONT, UNMIDG, UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA, ARTFUC, '
      + '                    TMONID, STKINV, ARTCRGO, ARTACTIVO, CUENTAID, STKSACTG, STKSACTU, STKMACTG, '
      + '                    STKMACTU, STKSFISG, STKSFISU, STKSMAXG, STKSMING, STKSMAXU, STKSMINU, '
      + '                    STKPUPED, STKLOTEC, STKRACTG, STKRACTU, ARTDES, ARTADI, MARCA '
      + '                    ) '
      + 'Select ' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) + ' TOINID, '
      + '       A.STKANO, A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID, A.FAMID, A.SFAMID, A.ARTID, '
      + '       A.ARTCONT, A.UNMIDG, A.UNMIDU, A.FABID, A.ARTSPRO, A.ARTSCA, A.ARTPARA, A.ARTSNA, '
      + '       A.ARTFUC, A.TMONID, A.STKINV, A.ARTCRGO, A.ARTACTIVO, A.CUENTAID, '
      + '       A.STKSACTG, A.STKSACTU, A.STKMACTG, A.STKMACTU, A.STKSACTG, A.STKSFISU, A.STKSMAXG, '
      + '       A.STKSMING, A.STKSMAXU, A.STKSMINU, A.STKPUPED, A.STKLOTEC, A.STKRACTG, A.STKRACTU, '
      + '       A.ARTDES, ''N'', MARDES '
      + '  from LOG316 A, (Select CIAID, ARTID, max(NISAFREG) ULTMOV '
      + '                    from LOG315 '
      + '                   Where CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ' '
      + '                   group by CIAID, ARTID order by CIAID, ARTID ) B, '
      + '       TGE205 C, ALM_MAR_ART D '
      + ' where a.CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + '   and a.LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString)
      + '   and a.TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + '   and a.ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString)
      + '   and a.STKANO=' + QuotedStr(DMALM.cdsCInventario.FieldByName('STKANO').AsString)
      + '   and A.CIAID=B.CIAID(+) AND A.ARTID=B.ARTID(+) '
      + '   and ( a.STKSACTG>0 OR ULTMOV>SYSDATE-365 ) '
      + '   and A.CIAID=C.CIAID(+) AND A.ARTID=C.ARTID(+) '
      + '   and C.MARCA=D.MARCA(+) '
      + ' order by GRARID, FAMID, C.MARCA, A.ARTID';

   sSQL := 'Insert into LOG334 (TOINID, STKANO, CIAID, LOCID, TINID, ALMID, GRARID, FAMID, SFAMID, ARTID, '
      + '                    ARTCONT, UNMIDG, UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA, ARTFUC, '
      + '                    TMONID, ' //STKINV,
      + '                    ARTCRGO, ARTACTIVO, CUENTAID, STKSACTG, STKSACTU, STKMACTG, '
      + '                    STKMACTU, STKSFISG, STKSFISU, STKSMAXG, STKSMING, STKSMAXU, STKSMINU, '
      + '                    STKPUPED, STKLOTEC, STKRACTG, STKRACTU, ARTDES, ARTADI, MARCA '
      + '                    ) '
      + 'Select ' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) + ' TOINID, '
      + '       substr(A.LOGANOMM,1,4) STKANO, A.CIAID, ''01'' LOCID, A.TINID, A.ALMID, '
      + '       C.GRARID, C.FAMID, C.SFAMID, A.ARTID, '
      + '       C.ARTCONT, C.UNMIDG, C.UNMIDU, substr(C.FABID,1,2) FABID, '''' ARTSPRO, C.ARTSCA, C.ARTPARA, C.ARTSNA, '
      + '       C.ARTFUC, C.TMONID, '
   //      + '       --A.STKINV,
   + '       C.ARTCRGO, C.ARTACTIVO, C.CUENTAID, '
      + '       STKFIN STKSACTG, 0.00 STKSACTU, 0.00 STKMACTG, 0.00 STKMACTU, STKFIN STKSFISG,'
      + '       0.00 STKSFISU, 0.00 STKSMAXG, 0.00 STKSMING, 0.00 STKSMAXU, 0.00 STKSMINU, '
      + '       0.00 STKPUPED, 0.00 STKLOTEC, 0.00 STKRACTG, 0.00 STKRACTU, '
      + '       C.ARTDES, ''N'', D.MARDES '
      + '  from LOG319 A, (Select CIAID, ARTID, max(NISAFREG) ULTMOV '
      + '                    from LOG315 '
      + '                   Where CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + '                   group by CIAID, ARTID order by CIAID, ARTID ) B, '
      + '       TGE205 C, ALM_MAR_ART D '
      + ' where A.CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + '   and A.TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + '   and A.ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString)
      + '   and A.LOGANOMM = ' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINANOMM').AsString)
      + '   and A.CIAID=B.CIAID(+) AND A.ARTID=B.ARTID(+) '
      + '   and ( STKFIN>0 OR ULTMOV>SYSDATE-365 ) '
      + '   and A.CIAID=C.CIAID(+) AND A.ARTID=C.ARTID(+) '
      + '   and C.MARCA=D.MARCA(+) '
      + ' order by GRARID, FAMID, C.MARCA, A.ARTID ';
//Final HPC_201404_ALM
   DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
   mtx5001.RefreshFilter;
End;

Procedure TFToolTomaInventario.Timer1Timer(Sender: TObject);
Begin
//Inicio HPC_201404_ALM
   FVariables.w_NombreForma := 'FToolTomaInventario';
//Final HPC_201404_ALM

   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolTomaInventario);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

Procedure TFToolTomaInventario.pprTomaInvPreviewFormCreate(
   Sender: TObject);
Begin
   pprTomaInv.PreviewForm.ClientHeight := 500;
   pprTomaInv.PreviewForm.ClientWidth := 650;
   TppViewer(pprTomaInv.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolTomaInventario.Z1sbRepCargaClick(Sender: TObject);
Var
   x10: integer;
   xSQL, cCia, cLoc, cTin, cAlm: String;
Begin
   Screen.Cursor := crHourGlass;

   xSQL := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   cCia := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(xSQL), 'CIADES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cLoc := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cTin := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' and ' +
      'CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ' AND ALMID=' + quotedstr(DMALM.cdsCInventario.FieldByName('ALMID').AsString);
   cAlm := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');

   pprResulInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResulInvDig.Rtm';
   pprResulInv.Template.LoadFromFile;

//Inicio HPC_201404_ALM
   xSQL := 'Select C.GRARDES, D.FAMDES, E.SFAMDES, B.UNMABR, '
      + quotedstr(cCia) + ' CIADES, ' + quotedstr(cLoc) + ' LOCDES, '
      + quotedstr(cTin) + ' TINDES, ' + quotedstr(cAlm) + ' ALMDES, '
      + '       NVL(A.TIPART,''0000'') TIPART, NVL(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
      + '       NVL(T.LINCOM,''00'') LINCOM, NVL(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, '
      + '       K.*, nvl(STKSFISG,0)-nvl(STKSACTG,0) DIFERENCIA '
      + '  from LOG334 K, TGE130 B, TGE131 C, TGE169 D, TGE170 E, TGE205 A, ALM_TIP_ART T, ALM_LIN_COM L '
      + ' where TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) + ' '
      + '   and K.UNMIDG=B.UNMID '
      + '   and K.CIAID=C.CIAID(+) AND K.TINID=C.TINID(+) AND K.GRARID=C.GRARID(+) '
      + '   and K.CIAID=D.CIAID(+) AND K.TINID=D.TINID(+) AND K.GRARID=D.GRARID(+) AND K.FAMID=D.FAMID(+) '
      + '   and K.CIAID=E.CIAID(+) AND K.TINID=E.TINID(+) AND K.GRARID=E.GRARID(+) AND K.FAMID=E.FAMID(+) AND K.SFAMID=E.SFAMID(+) '
      + '   and K.CIAID=A.CIAID(+) AND K.TINID=A.TINID(+) AND K.ARTID=A.ARTID(+) '
      + '   and A.TIPART=T.TIPART(+) '
      + '   and T.LINCOM=L.LINCOM(+) '
      + ' order by K.GRARID, K.FAMID, K.MARCA, K.ARTID';
//Final HPC_201404_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQl);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;

   ppdbResulInv.DataSource := DMALM.dsReporte;
   ppd1.Report := pprResulInv;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros');
   End;

   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      pprResulInv.Print;

      pprResulInv.Stop;
      ppdbResulInv.DataSource := Nil;
      ppd1.Report := Nil;

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

Procedure TFToolTomaInventario.Z1sbResulInvValClick(Sender: TObject);
Var
   x10: integer;
   xSQL, cCia, cLoc, cTin, cAlm: String;
Begin
   Screen.Cursor := crHourGlass;

   xSQL := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   cCia := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(xSQL), 'CIADES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cLoc := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cTin := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' and ' +
      'CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ' AND ALMID=' + quotedstr(DMALM.cdsCInventario.FieldByName('ALMID').AsString);
   cAlm := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');

   pprResulInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResulInvVal.Rtm';
   pprResulInv.Template.LoadFromFile;

//Inicio HPC_201404_ALM
   xSQL := 'Select C.GRARDES, D.FAMDES, E.SFAMDES, B.UNMABR, '
      + quotedstr(cCia) + ' CIADES, ' + quotedstr(cLoc) + ' LOCDES, '
      + quotedstr(cTin) + ' TINDES, ' + quotedstr(cAlm) + ' ALMDES, '
      + '       nvl(A.TIPART,''0000'') TIPART, nvl(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
      + '       nvl(T.LINCOM,''00'') LINCOM, nvl(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, K.*, '
      + '       nvl(STKSFISG,0)-nvl(STKSACTG,0) DIFERENCIA, A.ARTPCG, ((nvl(STKSFISG,0)-nvl(STKSACTG,0))*A.ARTPCG) VALOR, '
      + '       case when nvl(A.CONSIGNACION,''N'')=''S'' then ''CONSIGNACION'' else '' ALMACEN'' end CONSIGNACION '
      + '  from LOG334 K, TGE130 B, TGE131 C, TGE169 D, TGE170 E, TGE205 A, ALM_TIP_ART T, ALM_LIN_COM L '
      + ' where TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) + ' '
      + '   and K.UNMIDG=B.UNMID '
      + '   and K.CIAID=C.CIAID(+) AND K.TINID=C.TINID(+) AND K.GRARID=C.GRARID(+) '
      + '   and K.CIAID=D.CIAID(+) AND K.TINID=D.TINID(+) AND K.GRARID=D.GRARID(+) AND K.FAMID=D.FAMID(+) '
      + '   and K.CIAID=E.CIAID(+) AND K.TINID=E.TINID(+) AND K.GRARID=E.GRARID(+) AND K.FAMID=E.FAMID(+) AND K.SFAMID=E.SFAMID(+) '
      + '   and K.CIAID=A.CIAID(+) AND K.TINID=A.TINID(+) AND K.ARTID=A.ARTID(+) '
      + '   and A.TIPART=T.TIPART(+) '
      + '   and T.LINCOM=L.LINCOM(+) '
      + '   and ( nvl(STKSFISG,0)<>0 or nvl(STKSACTG,0)<>0 ) '
      + ' order by K.GRARID, K.FAMID, K.MARCA, K.ARTID, '
      + '          case when nvl(A.CONSIGNACION,''N'')=''S'' then ''CONSIGNACION'' else '' ALMACEN'' end';
//Final HPC_201404_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQl);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;

   ppdbResulInv.DataSource := DMALM.dsReporte;
   ppd1.Report := pprResulInv;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros');
   End;

   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      pprResulInv.Print;

      pprResulInv.Stop;
      ppdbResulInv.DataSource := Nil;
      ppd1.Report := Nil;

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

Procedure TFToolTomaInventario.bbtnBuscarClick(Sender: TObject);
Begin
   mtx5001.FMant.cds2.First;
   mtx5001.FMant.cds2.Locate('ARTID', VarArrayOf([dblcdArt.Text]), []);
End;

Procedure TFToolTomaInventario.dblcdArtEnter(Sender: TObject);
Var
   xSQL: String;
Begin

   If dblcdArt.LookupTable = Nil Then
   Begin
//Inicio HPC_201404_ALM
      xSQL := 'Select * '
         + '  from TGE205 '
         + ' where CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
         + '   and TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
         + ' order by ARTID';
//Final HPC_201404_ALM
      DMALM.cdsArti.Close;
      DMALM.cdsArti.DataRequest(xSQL);
      DMALM.cdsArti.Open;
      dblcdArt.LookupTable := DMALM.cdsArti;
   End;
End;

Procedure TFToolTomaInventario.Z1sbCierreClick(Sender: TObject);
Var
   CadSql, {xWhere,} xOrder: String;
   iX, iY: integer;
Begin
//Inicio HPC_201404_ALM
   xSQL := 'Select LOG316.* '
      + '  from LOG334 LOG316 '
      + ' where LOG316.CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + '   and LOG316.LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString)
      + '   and LOG316.TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + '   and LOG316.ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString)
      + '   and LOG316.TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString);
//Final HPC_201404_ALM
   DMALM.cdsDInventario.Close;
   DMALM.cdsDInventario.DataRequest(xSQl);
   DMALM.cdsDInventario.Open;

   If DMALM.cdsDInventario.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros');
   End;

   FMovAlmSalEnt := TFMovAlmSalEnt.Create(Self);
   Try
      FMovAlmSalEnt.dtpAjuSal.date := dateS;
      FMovAlmSalEnt.ShowModal;
   Finally
      DMALM.cdsMAlmCab.Close;
      FMovAlmSalEnt.free;
   End;
End;

Procedure TFToolTomaInventario.Z1sbStockSisClick(Sender: TObject);
Var
   x10: integer;
   xSQL, cCia, cLoc, cTin, cAlm: String;
Begin
   Screen.Cursor := crHourGlass;

   xSQL := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   cCia := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(xSQL), 'CIADES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cLoc := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cTin := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' and ' +
      'CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ' AND ALMID=' + quotedstr(DMALM.cdsCInventario.FieldByName('ALMID').AsString);
   cAlm := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');

   pprResulInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\StockSis.Rtm';
   pprResulInv.Template.LoadFromFile;

//Inicio HPC_201404_ALM
   xSQL := 'Select C.GRARDES, D.FAMDES, E.SFAMDES, B.UNMABR, '
      + quotedstr(cCia) + ' CIADES, ' + quotedstr(cLoc) + ' LOCDES, '
      + quotedstr(cTin) + ' TINDES, ' + quotedstr(cAlm) + ' ALMDES, '
      + '       NVL(A.TIPART,''0000'') TIPART, NVL(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
      + '       NVL(T.LINCOM,''00'') LINCOM, NVL(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, '
      + '       K.*, nvl(STKSFISG,0)-nvl(STKSACTG,0) DIFERENCIA '
      + '  from LOG334 K, TGE130 B, TGE131 C, TGE169 D, TGE170 E, TGE205 A, ALM_TIP_ART T, ALM_LIN_COM L '
      + ' where TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) + ' '
      + '   and K.UNMIDG=B.UNMID '
      + '   and K.CIAID=C.CIAID(+) AND K.TINID=C.TINID(+) AND K.GRARID=C.GRARID(+) '
      + '   and K.CIAID=D.CIAID(+) AND K.TINID=D.TINID(+) AND K.GRARID=D.GRARID(+) AND K.FAMID=D.FAMID(+) '
      + '   and K.CIAID=E.CIAID(+) AND K.TINID=E.TINID(+) AND K.GRARID=E.GRARID(+) AND K.FAMID=E.FAMID(+) AND K.SFAMID=E.SFAMID(+) '
      + '   and K.CIAID=A.CIAID(+) AND K.TINID=A.TINID(+) AND K.ARTID=A.ARTID(+) '
      + '   and A.TIPART=T.TIPART(+) '
      + '   and T.LINCOM=L.LINCOM(+) ';
   If cbMayor.Checked Then
      xSQL := xSQL + ' and K.STKSACTG > 0 ';

   xSQL := xSQL + ' order by K.GRARID, K.FAMID, K.MARCA, K.ARTID';
//Final HPC_201404_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQl);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;

   ppdbResulInv.DataSource := DMALM.dsReporte;
   ppd1.Report := pprResulInv;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros');
   End;

   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      pprResulInv.Print;

      pprResulInv.Stop;
      ppdbResulInv.DataSource := Nil;
      ppd1.Report := Nil;

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

Procedure TFToolTomaInventario.Z1sbDiferenciasClick(Sender: TObject);
Var
   x10: integer;
   xSQL, cCia, cLoc, cTin, cAlm: String;
Begin
   Screen.Cursor := crHourGlass;

   xSQL := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   cCia := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(xSQL), 'CIADES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cLoc := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cTin := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' and ' +
      'CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ' AND ALMID=' + quotedstr(DMALM.cdsCInventario.FieldByName('ALMID').AsString);
   cAlm := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');

   pprResulInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResulInvVal.Rtm';
   pprResulInv.Template.LoadFromFile;

//Inicio HPC_201404_ALM
   xSQL := 'Select C.GRARDES, D.FAMDES, E.SFAMDES, B.UNMABR, '
      + quotedstr(cCia) + ' CIADES, ' + quotedstr(cLoc) + ' LOCDES, '
      + quotedstr(cTin) + ' TINDES, ' + quotedstr(cAlm) + ' ALMDES, '
      + '       NVL(A.TIPART,''0000'') TIPART, NVL(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
      + '       NVL(T.LINCOM,''00'') LINCOM, NVL(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, K.*, '
      + '       nvl(STKSFISG,0)-nvl(STKSACTG,0) DIFERENCIA, A.ARTPCG, ((nvl(STKSFISG,0)-nvl(STKSACTG,0))*A.ARTPCG) VALOR '
      + '  from LOG334 K, TGE130 B, TGE131 C, TGE169 D, TGE170 E, TGE205 A, ALM_TIP_ART T, ALM_LIN_COM L '
      + ' where TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) + ' '
      + '   and K.UNMIDG=B.UNMID '
      + '   and K.CIAID=C.CIAID(+) AND K.TINID=C.TINID(+) AND K.GRARID=C.GRARID(+) '
      + '   and K.CIAID=D.CIAID(+) AND K.TINID=D.TINID(+) AND K.GRARID=D.GRARID(+) AND K.FAMID=D.FAMID(+) '
      + '   and K.CIAID=E.CIAID(+) AND K.TINID=E.TINID(+) AND K.GRARID=E.GRARID(+) AND K.FAMID=E.FAMID(+) AND K.SFAMID=E.SFAMID(+) '
      + '   and K.CIAID=A.CIAID(+) AND K.TINID=A.TINID(+) AND K.ARTID=A.ARTID(+) '
      + '   and A.TIPART=T.TIPART(+) '
      + '   and T.LINCOM=L.LINCOM(+) '
      + '   and nvl(STKSFISG,0)<>nvl(STKSACTG,0) '
      + ' order by K.GRARID, K.FAMID, K.MARCA, K.ARTID';
//Final HPC_201404_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQl);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;

   ppdbResulInv.DataSource := DMALM.dsReporte;
   ppd1.Report := pprResulInv;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros');
   End;

   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      pprResulInv.Print;

      pprResulInv.Stop;
      ppdbResulInv.DataSource := Nil;
      ppd1.Report := Nil;

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

Procedure TFToolTomaInventario.Z1sbRealClick(Sender: TObject);
Var
   nMes, x10: integer;
   xSQL, cCia, cLoc, cTin, cAlm, cMes, STKSACTG, STKMACTG: String;
Begin
   Screen.Cursor := crHourGlass;

   nMes := StrToInt(Copy(DMALM.cdsCInventario.FieldByName('TOINFEC').AsString, 4, 2)) + 1;
   If nMes = 13 Then
   Begin
      STKSACTG := 'S.STKSACTG';
      STKMACTG := 'S.STKMACTG';
   End
   Else
   Begin
      cMes := DMALM.StrZero(IntToStr(nMes), 2);
      STKSACTG := 'S.STKTSG' + cMes;
      STKMACTG := 'S.STKTMG' + cMes;
   End;

   xSQL := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   cCia := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(xSQL), 'CIADES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cLoc := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cTin := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' and ' +
      'CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ' AND ALMID=' + quotedstr(DMALM.cdsCInventario.FieldByName('ALMID').AsString);
   cAlm := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');

   pprResulInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\StockReal.Rtm';
   pprResulInv.Template.LoadFromFile;

//Inicio HPC_201404_ALM
   xSQL := 'Select C.GRARDES, D.FAMDES, E.SFAMDES, B.UNMABR, '
      + quotedstr(cCia) + ' CIADES, ' + quotedstr(cLoc) + ' LOCDES, '
      + quotedstr(cTin) + ' TINDES, ' + quotedstr(cAlm) + ' ALMDES, '
      + '       nvl(A.TIPART,''0000'') TIPART, NVL(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
      + '       nvl(T.LINCOM,''00'') LINCOM, NVL(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, K.*, '
      + '       nvl(K.STKSFISG,0)-nvl(K.STKSACTG,0) DIFERENCIA, A.ARTPCG, ((nvl(K.STKSFISG,0)-nvl(K.STKSACTG,0))*A.ARTPCG) VALOR, '
      + STKSACTG + ' STOCK_LOG316, ' + STKMACTG + ' COSTO_LOG316, ' + STKMACTG + '/CASE WHEN ' + STKSACTG + '=0 THEN 1 ELSE ' + STKSACTG + ' END COSTO_UNI '
      + '  from LOG334 K, TGE130 B, TGE131 C, TGE169 D, TGE170 E, TGE205 A, ALM_TIP_ART T, ALM_LIN_COM L, LOG316 S '
      + ' where TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) + ' '
      + '   and K.UNMIDG=B.UNMID '
      + '   and K.CIAID=C.CIAID(+) AND K.TINID=C.TINID(+) AND K.GRARID=C.GRARID(+) '
      + '   and K.CIAID=D.CIAID(+) AND K.TINID=D.TINID(+) AND K.GRARID=D.GRARID(+) AND K.FAMID=D.FAMID(+) '
      + '   and K.CIAID=E.CIAID(+) AND K.TINID=E.TINID(+) AND K.GRARID=E.GRARID(+) AND K.FAMID=E.FAMID(+) AND K.SFAMID=E.SFAMID(+) '
      + '   and K.CIAID=A.CIAID(+) AND K.TINID=A.TINID(+) AND K.ARTID=A.ARTID(+) '
      + '   and A.TIPART=T.TIPART(+) '
      + '   and T.LINCOM=L.LINCOM(+) '
      + '   and K.CIAID=S.CIAID(+) AND K.TINID=S.TINID(+) AND K.ARTID=S.ARTID(+) '
      + '   and S.STKANO(+)=''' + DMALM.cdsCInventario.FieldByName('STKANO').AsString + ''' '
      + '   and S.ALMID(+)=''' + DMALM.cdsCInventario.FieldByName('ALMID').AsString + ''' '
      + ' order by K.GRARID, K.FAMID, K.MARCA, K.ARTID';
//Final HPC_201404_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQl);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;

   ppdbResulInv.DataSource := DMALM.dsReporte;
   ppd1.Report := pprResulInv;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros');
   End;

   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      pprResulInv.Print;

      pprResulInv.Stop;
      ppdbResulInv.DataSource := Nil;
      ppd1.Report := Nil;

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

Procedure TFToolTomaInventario.Z1sbTomaInv2Click(Sender: TObject);
Var
   x10: integer;
   xSQL, cCia, cLoc, cTin, cAlm: String;
// Inicio HPC_201506_ALM
   xWhere, xOrder: String;
   x: integer;
// Fin HPC_201506_ALM
Begin
   Screen.Cursor := crHourGlass;

   xSQL := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   cCia := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(xSQL), 'CIADES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cLoc := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cTin := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' and '
      + 'CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ' AND ALMID=' + quotedstr(DMALM.cdsCInventario.FieldByName('ALMID').AsString);
   cAlm := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');

   pprTomaInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\TomaInv_Sin_Stock.Rtm';
   pprTomaInv.Template.LoadFromFile;

// Inicio HPC_201506_ALM
// Inicio HPC_201404_ALM
   xSQL := 'Select C.GRARDES, D.FAMDES, E.SFAMDES, B.UNMABR, '
      + quotedstr(cCia) + ' CIADES, ' + quotedstr(cLoc) + ' LOCDES, '
      + quotedstr(cTin) + ' TINDES, ' + quotedstr(cAlm) + ' ALMDES, '
      + '       NVL(A.TIPART,''0000'') TIPART, NVL(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
      + '       NVL(T.LINCOM,''00'') LINCOM, NVL(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, K.* '
      + '  from LOG334 K, TGE130 B, TGE131 C, TGE169 D, TGE170 E, TGE205 A, ALM_TIP_ART T, ALM_LIN_COM L '
      + ' where TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) + ' '
      + '   and ARTADI=''N'' '
      + '   and K.UNMIDG=B.UNMID '
      + '   and K.CIAID=C.CIAID(+) AND K.TINID=C.TINID(+) AND K.GRARID=C.GRARID(+) '
      + '   and K.CIAID=D.CIAID(+) AND K.TINID=D.TINID(+) AND K.GRARID=D.GRARID(+) AND K.FAMID=D.FAMID(+) '
      + '   and K.CIAID=E.CIAID(+) AND K.TINID=E.TINID(+) AND K.GRARID=E.GRARID(+) AND K.FAMID=E.FAMID(+) AND K.SFAMID=E.SFAMID(+) '
      + '   and K.CIAID=A.CIAID(+) AND K.TINID=A.TINID(+) AND K.ARTID=A.ARTID(+) '
      + '   and A.TIPART=T.TIPART(+) '
      + '   and T.LINCOM=L.LINCOM(+) ';
   If cbMayor.Checked Then
      xSQL := xSQL + ' and K.STKSACTG > 0 ';

//   xSQL := xSQL + ' ORDER BY K.GRARID, K.FAMID, K.MARCA,Trim(K.ARTDES)';
   xSQL := xSQL + ' ORDER BY K.GRARID, K.FAMID, K.MARCA,Trim(K.ARTID)';
// Final HPC_201404_ALM

   xWhere := '';
   For x := 0 To Mtx5001.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      If length(xWhere) > 0 Then
         If Copy(Mtx5001.FMant.lbFiltroReal.Items.Strings[x], 1, 4) = ' or ' Then
            xWhere := xWhere + Mtx5001.FMant.lbFiltroReal.Items.Strings[x]
         Else
            xWhere := xWhere + ' and ' + Mtx5001.FMant.lbFiltroReal.Items.Strings[x]
      Else
      Begin
         xWhere := Mtx5001.FMant.lbFiltroReal.Items.Strings[x];
      End;
   End;

   xOrder := '';
   For x := 0 To Mtx5001.FMant.lbOrdenReal.Items.Count - 1 Do
   Begin
      If length(xOrder) > 0 Then
         xOrder := xOrder + ', ' + Mtx5001.FMant.lbOrdenReal.Items.Strings[x]
      Else
      Begin
         xOrder := Mtx5001.FMant.lbOrdenReal.Items.Strings[x];
      End;
   End;

   xSQL := 'Select * from (' + xSQL + ' ) ';

   If length(xWhere) > 0 Then
      xSQL := xSQL + ' where ' + xWhere;
   If length(xOrder) > 0 Then
      xSQL := xSQL + ' Order by ' + xOrder;
// Fin HPC_201506_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQl);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros en la Toma de Inventario');
   End;

   ppdbTomInv.DataSource := DMALM.dsReporte;
   ppd1.Report := pprTomaInv;

   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      pprTomaInv.Print;

      pprTomaInv.Stop;
      ppdbTomInv.DataSource := Nil;
      ppd1.Report := Nil;

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

Procedure TFToolTomaInventario.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

End.

