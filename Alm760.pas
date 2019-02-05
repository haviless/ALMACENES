Unit Alm760;
//Inicio Uso de Estándares  : 01/08/2011
//Unidad                    : ALM760
//Formulario                : FToolSalArt
//Fecha de Creación         :
//Autor                     : Equipo de Desarrollo
//Objetivo                  : Barra de tareas de Saldo de Stock
//Modificaciones            :
// HPC_201401_ALM 03/07/2014: Se quita la función que recalcula stock (RecalculaSaldosAlmacen) lo esta haciendo mal
//                          : malogrando  el saldo actual de la tabla de saldos LOG316
// HPC_201404_ALM 15/09/2014: Se adiciono en el Sql el campo Marca, tambien se ordena el código fuente
// HPC_201502_ALM 17/06/2015: Ajustes al Saldo de Stock
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, StdCtrls, Buttons, ComCtrls, ppProd, ppClass, ppReport,
   ppEndUsr, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppViewr, ppCtrls,
   ppPrnabl, ppBands, wwdblook, DB, ppVar, ppTypes, ppParameter,
   ActnList, MsgDlgs;

Type
   TFToolSalArt = Class(TForm)
      pnlTool: TPanel;
      gbPeriodo: TGroupBox;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      GroupBox1: TGroupBox;
      rgTipoStocValo: TRadioGroup;
      Z1sbKardex: TBitBtn;
      DdBase: TppDBPipeline;
      Diseno: TppDesigner;
      ppSalResStock: TppReport;
      lblCia: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      pplblCia: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLine1: TppLine;
      ppLabel10: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLine2: TppLine;
      Timer1: TTimer;
      bbtnSMaxMin: TBitBtn;
      ActionList1: TActionList;
      bbtnCodBar: TBitBtn;
      ppdb4: TppDBPipeline;
      ppr4: TppReport;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      ppHeaderBand3: TppHeaderBand;
      ppDetailBand3: TppDetailBand;
      ppFooterBand3: TppFooterBand;
   // Inicio HPC_201502_ALM
      ppLabel11: TppLabel;
      ppDBText6: TppDBText;
   // Fin HPC_201502_ALM

      Procedure Z1sbKardexClick(Sender: TObject);
      Procedure ppSalResStockPreviewFormCreate(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCIAEnter(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure bbtnSMaxMinClick(Sender: TObject);
      Procedure bbtnCodBarClick(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
    { Private declarations }
   Public
  { Public declarations }
      Procedure InsDataFil;
   End;

Var
   FToolSalArt: TFToolSalArt;
   xwhere: String;
   xAccesoBotones: Boolean;

Implementation

Uses ALMDM1, oaIN4000;

{$R *.DFM}

Procedure TFToolSalArt.InsDataFil;
Var
   MtoGFNameG, MtoGFNameU, CntGFNameG, CntGFNameU, sTOTAL, sWhere: String;
   xSQL, SalIniHas: String;
   D, M, Y, DH, MH, YH: Word;
   iX, iY: integer;
Begin
   xWhere := '';
   DecodeDate(dtpDesde.Date, Y, M, D);
   DecodeDate(dtpHasta.Date, YH, MH, DH);
   If D = 1 Then
      SalIniHas := IntToStr(D) + '/' + IntToStr(M) + '/' + IntToStr(Y)
   Else
      SalIniHas := IntToStr(D - 1) + '/' + IntToStr(M) + '/' + IntToStr(Y);

   CntGFNameG := 'STKTSG' + DMALM.StrZero(IntToStr(M), 2);
   CntGFNameU := 'STKTSU' + DMALM.StrZero(IntToStr(M), 2);
   MtoGFNameG := 'STKTMG' + DMALM.StrZero(IntToStr(M), 2);
   MtoGFNameU := 'STKTMU' + DMALM.StrZero(IntToStr(M), 2);

   SalIniHas := quotedStr(formatdatetime(DMALM.wFormatFecha, strtodatetime(SalIniHas)));

   xSQL := 'DELETE FROM LOG323 WHERE USUARIO=''' + DMALM.wUsuario + '''';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := Mtx4000.FMant.SQL;
   For iX := 0 To Length(xsql) Do
   Begin
      If copy(xSQL, iX, 5) = 'WHERE' Then
      Begin
         xwhere := copy(xSQL, iX + 6, length(xSQL));
         break;
      End;
   End;
   For iY := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iY, 8) = 'ORDER BY' Then
      Begin
         xwhere := copy(xWhere, 1, iY - 2);
         break;
      End;
   End;

   sWhere := xWhere;

// Inicio HPC_201502_ALM
   sTOTAL := ' INSERT INTO LOG323(CIAID, LOCID, ALMID, TINID, GRARID, NISAFREG, TDAID, '
      + '                    TDAABR, ARTFUC, ARTID, ARTDES, UNMIDG, UMEDGDES, '
      + '                    UNMIDU, UMEDUDES, NISAID, NISATIP, SALDOG, SALDOU, '
      + '                    MONTOG, MONTOU, KDXCNTG, KDXCNTU, KDXCNTGI, KDXCNTUI, '
      + '                    KDXCNTGS, KDXCNTUS, ARTCPROG, ARTCPROU, KDXCPROGI, '
      + '                    KDXCPROUI, KDXCPROGS, KDXCPROUS, USUARIO ) '
      + '(SELECT CIAID, LOCID, ALMID, TINID, GRARID, (' + SalIniHas + '), ''00'', '''', '
      + '        ARTFUC, ARTID, ARTDES, UNMIDG, '''', UNMIDU, '''', ''Saldo Inicial'', '
      + '        '''', ' + CntGFNameG + ', ' + CntGFNameU + ', ' + MtoGFNameG + ', '
      + MtoGFNameU + ', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '
      + '        0.00, 0.00, 0.00, ''' + DMALM.wUsuario + ''' '
      + '  FROM (SELECT ''SALDOS'' TIPO,B.MARCA,C.MARDES,A.* '
      + '          FROM LOG316 A, TGE205 B,ALM_MAR_ART C '
      + '         WHERE A.CIAID=B.CIAID AND A.ARTID=B.ARTID AND B.MARCA=C.MARCA ) LOG316 ';
   If Length(sWhere) > 0 Then
      sTOTAL := sTOTAL + 'WHERE ' + sWhere + ' AND LOG316.CIAID=' + QuotedStr(dblcCIA.text) + ' AND LOG316.STKANO=''' + InttoStr(YH) + ''')'
   Else
      sTOTAL := sTOTAL + 'WHERE LOG316.CIAID=' + QuotedStr(dblcCIA.text) + ' AND LOG316.STKANO=''' + InttoStr(YH) + ''')';
// Fin HPC_201502_ALM
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sTOTAL);
   Except
   End;
End;

Procedure TFToolSalArt.Z1sbKardexClick(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, StkSM, xWhere, xOrder: String;
   D, M, Y: Word;
   x10, X: Integer;
Begin
   If dbeCIA.text = '' Then
      Raise Exception.Create('Ingrese Compañía');

   Screen.Cursor := crHourGlass;

   DecodeDate(dtpHasta.Date, Y, M, D);

   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

// Inicio HPC_201504_ALM
{
   InsDataFil;
}
// Fin HPC_201504

   xWhere := '';
   For x := 0 To Mtx4000.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      If length(xWhere) > 0 Then
         If Copy(Mtx4000.FMant.lbFiltroReal.Items.Strings[x], 1, 4) = ' or ' Then
            xWhere := xWhere + Mtx4000.FMant.lbFiltroReal.Items.Strings[x]
         Else
            xWhere := xWhere + ' and ' + Mtx4000.FMant.lbFiltroReal.Items.Strings[x]
      Else
      Begin
         xWhere := Mtx4000.FMant.lbFiltroReal.Items.Strings[x];
      End;
   End;

   xOrder := '';
   For x := 0 To Mtx4000.FMant.lbOrdenReal.Items.Count - 1 Do
   Begin
      If length(xOrder) > 0 Then
         xOrder := xOrder + ', ' + Mtx4000.FMant.lbOrdenReal.Items.Strings[x]
      Else
      Begin
         xOrder := Mtx4000.FMant.lbOrdenReal.Items.Strings[x];
      End;
   End;

// Inicio HPC_201504_ALM
{
// Inicio HPC_201502_ALM
   xSQL := ' SELECT * FROM '
         + '        (SELECT ''SALDOS'' TIPO,A.*,B.MARCA,C.MARDES, '
         + '                NVL(A.STKSACTG,0)-NVL(A.STKRACTG,0) STKREALG, '
         + '                NVL(A.STKSACTU,0)-NVL(A.STKRACTU,0) STKREALU, '
         + '                D.ALMDES, ''Almacén : ''||A.ALMID||'' - ''||D.ALMDES ALMACEN '
         + '           FROM LOG316 A,TGE205 B,ALM_MAR_ART C, TGE151 D '
         + '          WHERE A.CIAID=' + QuotedStr(dblcCIA.text)
         + '            AND A.STKANO=''' + xAno + ''' '
         + '            AND A.CIAID=B.CIAID AND A.TINID=B.TINID(+) '
         + '                AND A.ARTID=B.ARTID(+) AND B.MARCA=C.MARCA(+) '
         + '            AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+)'
         + '                AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) ) A  '
         + '  WHERE A.TIPO=''SALDOS'' ';
   If length(xWhere) > 0 Then xSQL := xSQL + ' and (' + xWhere + ')';
// Fin HPC_201502_ALM
}

   xSQL := ' Select * '
      + '   from ('
      + '         Select A.CIAID,A.LOGANOMM,''SALDOS'' TIPO, '
      + '                ''STOCK AL MES DE ''' + Quotedstr(xAno + xMes) + ' PERIODO_STOCK, '
      + '                A.ALMID, D.ALMDES, '
      + '                ''Almacén : ''||A.ALMID||'' - ''||D.ALMDES ALMACEN, '
      + '                A.ARTID, B.TINID, B.GRARID, B.FAMID, B.SFAMID, E.GRARDES, B.ARTDES, '
      + '                B.MARCA, C.MARDES, '
      + '                A.STKINI, A.CANTOTING, A.CANTOTSAL, A.STKFIN, '
      + '                0.00 STKREALG, '
      + '                0.00 STKREALU, 0.00 STKSACTG, 0.00 STKRACTG '
      + '           from LOG319 A,TGE205 B, ALM_MAR_ART C, TGE151 D, TGE131 E '
      + '          where A.CIAID = ' + QuotedStr(dblcCIA.text)
      + '            and A.LOGANOMM=' + Quotedstr(xAno + xMes)
      + '            and B.CIAID=A.CIAID and B.ARTID=A.ARTID '
      + '            and C.MARCA(+)=B.MARCA '
      + '            and D.CIAID=A.CIAID and D.ALMID=A.ALMID and D.ACTIVO=''S'' '
      + '            and E.CIAID(+)=B.CIAID and E.TINID(+)=B.TINID and E.GRARID(+)=B.GRARID '
      + '         ) A  '
      + '  where A.TIPO=''SALDOS'' '
      + '    and STKINI+CANTOTING+CANTOTSAL+STKFIN > 0 ';
   If length(xWhere) > 0 Then xSQL := xSQL + ' and (' + xWhere + ')';

   xSQL := xSQL + '  Order by GRARID, ALMID, ARTID ';
// Fin HPC_201504_ALM
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Módulo de Almacén', 'No Existe Información a Mostrar');
      Exit;
   End;
   ppSalResStock.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RptStockReal.rtm';
   ppSalResStock.Template.LoadFromFile;
   pplblCia.caption := dbeCIA.text;

   DdBase.DataSource := DMALM.dsReporte;

   If cbDisenoRep.Checked Then
   Begin
      Diseno.ShowModal
   End
   Else
      ppSalResStock.Print;

   ppSalResStock.Stop;
   DdBase.DataSource := Nil;

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

Procedure TFToolSalArt.ppSalResStockPreviewFormCreate(Sender: TObject);
Begin
   ppSalResStock.PreviewForm.ClientHeight := 500;
   ppSalResStock.PreviewForm.ClientWidth := 650;
   TppViewer(ppSalResStock.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolSalArt.dblcCIAExit(Sender: TObject);
Begin
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.Text), 'CIADES');
End;

Procedure TFToolSalArt.NotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFToolSalArt.dblcCIAEnter(Sender: TObject);
Begin
   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');
End;

Procedure TFToolSalArt.Timer1Timer(Sender: TObject);
Begin
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolSalArt);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

Procedure TFToolSalArt.bbtnSMaxMinClick(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, StkSM, xWhere, xOrder: String;
   D, M, Y: Word;
   x10, X: Integer;
Begin
   If dbeCIA.text = '' Then
      Raise Exception.Create('Ingrese Compañía');

   Screen.Cursor := crHourGlass;

   DecodeDate(dtpHasta.Date, Y, M, D);

   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

   InsDataFil;

   xWhere := '';
   For x := 0 To Mtx4000.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      If length(xWhere) > 0 Then
         If Copy(Mtx4000.FMant.lbFiltroReal.Items.Strings[x], 1, 4) = ' or ' Then
            xWhere := xWhere + Mtx4000.FMant.lbFiltroReal.Items.Strings[x]
         Else
            xWhere := xWhere + ' and ' + Mtx4000.FMant.lbFiltroReal.Items.Strings[x]
      Else
      Begin
         xWhere := Mtx4000.FMant.lbFiltroReal.Items.Strings[x];
      End;
   End;

   xOrder := '';
   For x := 0 To Mtx4000.FMant.lbOrdenReal.Items.Count - 1 Do
   Begin
      If length(xOrder) > 0 Then
         xOrder := xOrder + ', ' + Mtx4000.FMant.lbOrdenReal.Items.Strings[x]
      Else
      Begin
         xOrder := Mtx4000.FMant.lbOrdenReal.Items.Strings[x];
      End;
   End;

// Inicio HPC_201502_ALM
   xSQL := ' SELECT * FROM '
      + '        (SELECT ''SALDOS'' TIPO,A.*,B.MARCA,C.MARDES, '
      + '                NVL(A.STKSACTG,0)-NVL(A.STKRACTG,0) STKREALG, '
      + '                NVL(A.STKSACTU,0)-NVL(A.STKRACTU,0) STKREALU, '
      + '                D.ALMDES, ''Almacén : ''||A.ALMID||'' - ''||D.ALMDES ALMACEN, '
      + '                B.STKSMAX, B.STKSMIN '
      + '           FROM LOG316 A, TGE205 B,ALM_MAR_ART C, TGE151 D '
      + '          WHERE A.CIAID=' + QuotedStr(dblcCIA.text)
      + '            AND STKANO=''' + xAno + ''' '
      + '            AND A.CIAID=B.CIAID(+) AND A.GRARID=B.GRARID(+) '
      + '               AND A.ARTID=B.ARTID(+) '
      + '            AND B.MARCA=C.MARCA(+)  '
      + '            AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) '
      + '            AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) ) A  '
      + '  WHERE A.TIPO=''SALDOS'' ';
   If length(xWhere) > 0 Then xSQL := xSQL + ' and (' + xWhere + ')';
   xSQL := xSQL + ' order by A.TINID, A.ALMID, A.GRARID, A.ARTID';
// Fin HPC_201502_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Módulo de Almacén', 'No Existe Información a Mostrar');
      Exit;
   End;

   DdBase.DataSource := DMALM.dsReporte;

   ppSalResStock.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RptStockMaxMin.rtm';
   ppSalResStock.Template.LoadFromFile;
   pplblCia.caption := dbeCIA.text;

   If cbDisenoRep.Checked Then
   Begin
      Diseno.ShowModal
   End
   Else
      ppSalResStock.Print;

   ppSalResStock.Stop;
   DdBase.DataSource := Nil;

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

Procedure TFToolSalArt.bbtnCodBarClick(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, StkSM, xWhere, xOrder: String;
   D, M, Y: Word;
   x10, X: Integer;
Begin
   If dbeCIA.text = '' Then
      Raise Exception.Create('Ingrese Compañía');

   Screen.Cursor := crHourGlass;

   DecodeDate(dtpHasta.Date, Y, M, D);

   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

   InsDataFil;

   xWhere := '';
   For x := 0 To Mtx4000.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      If length(xWhere) > 0 Then
         If Copy(Mtx4000.FMant.lbFiltroReal.Items.Strings[x], 1, 4) = ' or ' Then
            xWhere := xWhere + Mtx4000.FMant.lbFiltroReal.Items.Strings[x]
         Else
            xWhere := xWhere + ' and ' + Mtx4000.FMant.lbFiltroReal.Items.Strings[x]
      Else
      Begin
         xWhere := Mtx4000.FMant.lbFiltroReal.Items.Strings[x];
      End;
   End;

   xOrder := '';
   For x := 0 To Mtx4000.FMant.lbOrdenReal.Items.Count - 1 Do
   Begin
      If length(xOrder) > 0 Then
         xOrder := xOrder + ', ' + Mtx4000.FMant.lbOrdenReal.Items.Strings[x]
      Else
      Begin
         xOrder := Mtx4000.FMant.lbOrdenReal.Items.Strings[x];
      End;
   End;

   xSQL := ' Select * '
      + '   from '
      + '        (Select ''SALDOS'' TIPO,A.*, A.STKSACTG KDXCNTG,L.TLISTAID, '
      + '                null NISSIT, NUMERO, '
      + '                B.MARCA,C.MARDES, '
      + '                E.ALMDES, ''Almacén : ''||A.ALMID||'' - ''||E.ALMDES ALMACEN, '
      + '                ROUND( NVL(L.PREVEN,0)*((D.TASACAN/100)+1), 2 ) PRECIO, M.TMONABR, '
      + '                M.TMONABR||ROUND( NVL(L.PREVEN,0)*((D.TASACAN/100)+1), 2 ) TM_PRECIO '
      + '           from LOG316 A, TGE205 B, ALM_MAR_ART C,TGE108 D, '
      + '                TGE151 E, LOG323 G,  FAC201 L,  TGE103 M, NUMEROS N  '
      + '          where A.CIAID=' + QuotedStr(dblcCIA.text)
      + '            and STKANO=''' + xAno + ''' '
      + '            and A.CIAID=B.CIAID(+) AND A.GRARID=B.GRARID(+) AND A.ARTID=B.ARTID(+) '
      + '            and B.MARCA=C.MARCA(+)  '
      + '            and A.CIAID=G.CIAID(+) AND A.LOCID=G.LOCID(+) AND A.TINID=G.TINID(+) '
      + '            and A.ALMID=G.ALMID(+) AND A.ARTID=G.ARTID(+) '
      + '            and G.USUARIO=' + QuotedStr(DMALM.wUsuario)
      + '            and A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+)'
      + '            and A.TINID=E.TINID(+) AND A.ALMID=E.ALMID(+)'
      + '            and NUMERO<=A.STKSACTG '
      + '            and A.CIAID=L.CIAID(+) AND L.TLISTAID(+)=''2DE'' '
      + '              and A.ARTID=L.ARTID(+) '
      + '            and A.TINID=L.TINID(+) '
      + '            and ( L.ACTIVO=''S'' OR L.ACTIVO IS NULL OR L.ACTIVO='' '' ) '
      + '            and D.TASAFLG=''I'' '
      + '            and L.LPRETMONID=M.TMONID(+) ) A  WHERE A.TIPO=''SALDOS'' ';
   If length(xWhere) > 0 Then xSQL := xSQL + ' and (' + xWhere + ')';
   xSQL := xSQL + ' order by A.TINID, A.ALMID, A.ARTID, NUMERO';

   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(xSQL);
   DMALM.cdsSQL.Open;

   If DMALM.cdsSQL.RecordCount <= 0 Then
   Begin
      ShowMessage('No existe información para las condiciones del Filtro');
      Screen.Cursor := crDefault;
      Exit;
   End;

   ppdb4.DataSource := DMALM.dsSQL;

   ppr4.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CodigoBarra04.rtm';
   ppr4.Template.LoadFromFile;
   Screen.Cursor := crDefault;

   If cbDisenoRep.Checked Then
   Begin
      Diseno.Report := ppr4;
      Diseno.ShowModal;
   End
   Else
   Begin
      ppr4.Print;
      ppdb4.DataSource := Nil;
      ppr4.Stop;
   End;
End;

Procedure TFToolSalArt.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

End.

