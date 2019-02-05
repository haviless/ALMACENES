Unit ALM700;
//*********************************************************
// Nº HPP           : HPP_201102_ALM
// DESCRIPCION      : Se incrementa el grado de precisión a 5 decimales
//                    en el redondeo de los campos de montos
//*********************************************************
// HPP_201102_ALM    : Se modifica el formato de variable
// HPC_201309_ALM    : Se genera otro formato para el Reporte de Kardex (control de Stock)
//                   : Se Modifca en formulario del Inventario Valorizado
// HPC_201402_ALM    : reordenamiento de sangría
//                     Se habilita exportación a Excel del Inventario Valorizado - bbtnInvValExcelClick(Sender: TObject);
//                     Se modifica rutina de Inventario Valorizado - Z2bbtnInvValClick(Sender: TObject);
//                     Se agregan nuevos campos a GRID inicial - btnChkClick(Sender: TObject);
//                     Se unifica consulta de Inventario Valorizado en una única rutina - DataInvValorizado
// HPC_201404_ALM      15/09/2014
//                     - se agrega el valor A al Tipo de Movimiento (NISATIP) cuando se trate de Saldos Iniciales,
//                       para que ordene y coloque en 1er lugar
//                     - se agrega el valor Z al Tipo de Movimiento (NISATIP) cuando se trate de Saldos Finales,
//                       para que ordene y coloque en Último lugar
//                     - se cambia orden de presentación del Kardex CIAID;ALMID;GRARID;TINID;ARTID;NISAFREG;NISATIP;NISAID
// HPC_201502_ALM   19/06/2015 Se ajusta sincronía entre consultas y diccionario de filtro
// HPC_201504_ALM   17/08/2015 Se ajusta la fijación de Rango de fechas para tener el universo a filtrar
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad


Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ComCtrls, StdCtrls, ExtCtrls, Db, DBTables, ppDB, ppDBPipe,
   ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
   ppProd, ppReport, ppViewr, ppStrtch, ppSubRpt, ppEndUsr, ppTypes,
   ppParameter, Grids, DBGrids, Mask, wwdbedit, Wwdbspin, DBClient, DateUtils,
   jpeg, MsgDlgs, wwdblook;

Type
   TFToolKdx = Class(TForm)
      pnlTool: TPanel;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      pprInvVal: TppReport;
      ppDesigner1: TppDesigner;
      GroupBox1: TGroupBox;
      ppdbMovi: TppDBPipeline;
      ppParameterList1: TppParameterList;
      Timer1: TTimer;
      ppHeaderBand3: TppHeaderBand;
      ppDBText30: TppDBText;
      ppLabel26: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      pplPeriodo: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText31: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppDBText40: TppDBText;
      ppDBCalc2: TppDBCalc;
      ppSummaryBand1: TppSummaryBand;
      ppShape9: TppShape;
      ppLabel30: TppLabel;
      ppDBCalc8: TppDBCalc;
      ppGroup8: TppGroup;
      ppGroupHeaderBand8: TppGroupHeaderBand;
      ppShape2: TppShape;
      ppShape1: TppShape;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel40: TppLabel;
      ppLabel46: TppLabel;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppLabel31: TppLabel;
      ppDBText41: TppDBText;
      ppDBText136: TppDBText;
      ppGroupFooterBand8: TppGroupFooterBand;
      ppGroup25: TppGroup;
      ppGroupHeaderBand25: TppGroupHeaderBand;
      ppGroupFooterBand25: TppGroupFooterBand;
      ppDBCalc23: TppDBCalc;
      ppLine26: TppLine;
      ppLabel47: TppLabel;
      ppGroup29: TppGroup;
      ppGroupHeaderBand29: TppGroupHeaderBand;
      ppGroupFooterBand29: TppGroupFooterBand;
      ppLabel44: TppLabel;
      ppLine6: TppLine;
      ppDBCalc9: TppDBCalc;
      ppGroup10: TppGroup;
      ppGroupHeaderBand10: TppGroupHeaderBand;
      ppDBText55: TppDBText;
      ppDBText56: TppDBText;
      ppLabel52: TppLabel;
      ppGroupFooterBand10: TppGroupFooterBand;
      ppLine12: TppLine;
      ppDBCalc22: TppDBCalc;
      ppLabel69: TppLabel;
      dtgData: TDBGrid;
      sbAno: TwwDBSpinEdit;
      sbMes: TwwDBSpinEdit;
      dsKardex: TDataSource;
      cdsKardex: TClientDataSet;
      RepKardex: TppReport;
      dbKardex: TppDBPipeline;
      Label1: TLabel;
      Label2: TLabel;
      Edit1: TEdit;
      btnChk: TBitBtn;
      ppImage2: TppImage;
      ppLabel197: TppLabel;
      ppSystemVariable26: TppSystemVariable;
      cbDiseno: TCheckBox;
      sbDiseno: TSpeedButton;
      bbtnKardex: TBitBtn;
      GroupBox2: TGroupBox;
      Z2bbtnInvVal: TBitBtn;
      bbtnInvValExcel: TBitBtn;
   // Inicio HPC_201502_ALM
      ppParameterList2: TppParameterList;
      ppHeaderBand11: TppHeaderBand;
      ppDBText153: TppDBText;
      ppLabel194: TppLabel;
      ppLabel195: TppLabel;
      ppLabel196: TppLabel;
      ppSystemVariable23: TppSystemVariable;
      ppSystemVariable24: TppSystemVariable;
      ppSystemVariable25: TppSystemVariable;
      pplTituloKardex: TppLabel;
      ppImage1: TppImage;
      ppDetailBand11: TppDetailBand;
      ppDBText63: TppDBText;
      ppDBText65: TppDBText;
      ppDBText137: TppDBText;
      ppDBText138: TppDBText;
      ppDBText139: TppDBText;
      ppDBText145: TppDBText;
      ppDBText62: TppDBText;
      ppDBText64: TppDBText;
      ppFooterBand6: TppFooterBand;
      ppGroup30: TppGroup;
      ppGroupHeaderBand30: TppGroupHeaderBand;
      ppShape17: TppShape;
      ppShape16: TppShape;
      ppShape15: TppShape;
      ppShape14: TppShape;
      ppShape13: TppShape;
      ppShape12: TppShape;
      ppShape11: TppShape;
      ppShape10: TppShape;
      ppDBText155: TppDBText;
      ppLabel29: TppLabel;
      ppLabel70: TppLabel;
      ppLabel71: TppLabel;
      ppLabel188: TppLabel;
      ppLabel189: TppLabel;
      ppLabel190: TppLabel;
      ppLabel191: TppLabel;
      ppLabel193: TppLabel;
      ppLabel198: TppLabel;
      ppShape18: TppShape;
      ppShape19: TppShape;
      ppGroupFooterBand30: TppGroupFooterBand;
      ppGroup31: TppGroup;
      ppGroupHeaderBand31: TppGroupHeaderBand;
      ppDBText154: TppDBText;
      ppLabel192: TppLabel;
      ppGroupFooterBand31: TppGroupFooterBand;
      ppGroup32: TppGroup;
      ppGroupHeaderBand32: TppGroupHeaderBand;
      ppGroupFooterBand32: TppGroupFooterBand;
      ppGroup33: TppGroup;
      ppGroupHeaderBand33: TppGroupHeaderBand;
      ppGroupFooterBand33: TppGroupFooterBand;
      ppGroup34: TppGroup;
      ppGroupHeaderBand34: TppGroupHeaderBand;
      ppDBText150: TppDBText;
      ppDBText152: TppDBText;
      ppGroupFooterBand34: TppGroupFooterBand;
      ppShape20: TppShape;
   // Fin HPC_201502_ALM
      Procedure FormCreate(Sender: TObject);
      Procedure Z2bbtnInvValClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Timer1Timer(Sender: TObject);
      Procedure btnChkClick(Sender: TObject);
      Procedure sbDisenoClick(Sender: TObject);
      Procedure bbtnInvValExcelClick(Sender: TObject);
      Procedure sbMesExit(Sender: TObject);
      Procedure DataInvValorizado;
      Procedure bbtnKardexClick(Sender: TObject);
   // Inicio HPC_201502_ALM
      Procedure pprInvValPreviewFormCreate(Sender: TObject);
      Procedure RepKardexPreviewFormCreate(Sender: TObject);
   // Fin HPC_201502_ALM
   Private
  { Private declarations }
   Public
  { Public declarations }
      Procedure VerAno;
      Procedure VerAnoNew;
   End;

Var
   FToolKdx: TFToolKdx;
   xwhere: String;
   xAccesoBotones: Boolean;
   xContinuaConsulta: boolean;
   xFechaPeriodo: String;
   xCiaFiltro: String;

Implementation

Uses ALMDM1, ALM411, oaIN4000;

{$R *.DFM}

Procedure TFToolKdx.FormCreate(Sender: TObject);
Begin
   dtpHasta.Date := Date;
   sbMes.Text := COPY(datetostr(Dates), 4, 2);
   sbAno.Text := COPY(datetostr(Dates), 7, 4);
End;

Procedure TFToolKdx.Z2bbtnInvValClick(Sender: TObject);
Var
   x10: Integer;
   x: Integer;
Begin

   xCiaFiltro := '';
   For x := 0 To Mtx4000.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      If pos('CIAID', Mtx4000.FMant.lbFiltroReal.Items.Strings[x]) > 0 Then
         xCiaFiltro := Mtx4000.FMant.lbFiltroReal.Items.Strings[x];
   End;
   If length(xCiaFiltro) = 0 Then
   Begin
      ShowMessage('Debe indicar la Compañía en el Filtro');
      exit;
   End;

   xContinuaConsulta := True;
   xFechaPeriodo := datetostr(dtpHasta.date);
   DataInvValorizado;
   If Not xContinuaConsulta Then exit;

   ppdbMovi.DataSource := DMALM.dsReporte;
   pprInvVal.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexInvVal.Rtm';
   pprInvVal.template.LoadFromFile;
   pprInvVal.DataPipeline := ppdbMovi;
   pplPeriodo.Caption := xFechaPeriodo;

   If cbDiseno.Checked Then
   Begin
      ppDesigner1.Report := pprInvVal;
      ppDesigner1.ShowModal;
   End
   Else
   Begin
      pprInvVal.Print;
      pprInvVal.Stop;
      DMALM.cdsReporte.Close;
      DMALM.cdsReporte.IndexFieldNames := '';

      pprInvVal.DataPipeline := Nil;
      ppdbMovi.DataSource := Nil;
      ppDesigner1.Report := Nil;

      x10 := pprInvVal.GroupCount - 1;
      While x10 >= 0 Do
      Begin
         pprInvVal.Groups[x10].Free;
         x10 := x10 - 1;
      End;
   End;
End;

Procedure TFToolKdx.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFToolKdx.VerAno;
Var
   YD, MD, DD: word;
   YH, MH, DH: word;
Begin
   DecodeDate(dtpDesde.Date, YD, MD, DD);
   DecodeDate(dtpHasta.Date, YH, MH, DH);

   If YD <> YH Then
   Begin
      Raise Exception.Create('Solo Puede Elegir Periodos Dentro del Mismo Año');
   End;
End;

Procedure TFToolKdx.VerAnoNew;
Var
   YD, MD, DD: word;
   YH, MH, DH: word;
Begin
   DecodeDate(dtpDesde.Date, YD, MD, DD);
   DecodeDate(dtpHasta.Date, YH, MH, DH);
End;

Procedure TFToolKdx.Timer1Timer(Sender: TObject);
Var
   xSQL: String; // HPC_201404_ALM
Begin
//   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolKdx);
      xAccesoBotones := True;
   End;

// Inicio HPC_201502_ALM
   cbDiseno.Checked := False;
   xSQL := 'Select ''12'' CIAID, ''1234567890123456789012345678901234567890'' CIADES, '
      + '       ''12'' ALMID, ''1234567890123456789012345678901234567890'' ALMDES, '
      + '       ''12'' TINID, ''1234567890123456789012345678901234567890'' TINDES, '
      + '       ''123456789012345'' ARTID, '
      + '       ''123456789012345678901234567890123456789012345678901234567890'' ARTDES, '
      + '       ''123456789012345'' NISAID, '
      + '       ''123456789012345'' NISSIT, '
      + '       0 KDXCNTG, 0.00 ARTPCG, '
      + '       0 STKINI, 0 INGRESO, 0 SALIDA, 0 SALDO, ''INGRESO'' NISATIP, '
      + '       0.00 STKVALINI, 0.00 INGRESOVAL, 0.00 SALIDAVAL, 0.00 SALDOVAL, '
      + '       sysdate NISAFREG, ''N'' TMONID, ''201410'' ANOMESMOV,  '
      + '       ''123'' GRARID, ''1234567890123456789012345678901234567890'' GRARDES, '
      + '       ''12'' TRIID, ''1234567890123456789012345678901234567890'' TRIDES, '
      + '       0.0000 PREPROMINI, '
      + '       '' '' ORDENIMP '
      + '  from DUAL ';
// Fin HPC_201502_ALM
   cdsKardex.Close;
   cdsKardex.RemoteServer := DMALM.DCOM1;
   cdsKardex.ProviderName := 'prvTGE';
   cdsKardex.Close;
   cdsKardex.DataRequest(xSQL);
   cdsKardex.Open;

   Timer1.Destroy;
End;

Procedure TFToolKdx.btnChkClick(Sender: TObject);
Var
   xsql, xper1, xper2: String;
   xWhere, xOrder: String;
   x: Integer;
Begin
   xper1 := sbAno.Text + sbMes.Text;
   xper2 := FormatDateTime('YYYYMM', dtpHasta.DateTime);

// Inicio HPC_201502_ALM
   xSQL := 'Select A.CIAID, A.LOGANOMM,A.ALMID,B.TINID, B.GRARID, B.FAMID, B.SFAMID, '
      + '       A.ARTID, B.ARTDES, A.STKINI, A.CANTOTING, '
      + '       A.CANTOTSAL, A.STKFIN, A.USUARIO, A.FREG, B.MARCA, C.MARDES '
      + '  From LOG319 A, TGE205 B, ALM_MAR_ART C, TGE151 D '
      + ' Where A.LOGANOMM>=' + quotedstr(xper1)
      + '   and A.LOGANOMM<=' + quotedstr(xper2)
      + '   and B.CIAID=A.CIAID and B.ARTID=A.ARTID '
      + '   and C.MARCA(+) = B.MARCA '
      + '   and D.CIAID=A.CIAID and D.ALMID=A.ALMID and D.ACTIVO=''S'' ';
   xSQL := 'Select * from (' + xSQL + ' ) SOLVISTA';
// Fin HPC_201502_ALM
// Inicio HPC_201504_ALM
{
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

   If length(xWhere) > 0 Then
      xSQL := xSQL + ' where ' + xWhere;
   If length(xOrder) = 0 Then
      xSQL := xSQL + ' Order by CIAID, ALMID, TINID, ARTID, LOGANOMM '
   Else
      xSQL := xSQL + ' Order by ' + xOrder;
}
// Fin HPC_201504_ALM
   Mtx4000.UsuarioSQL.Clear;
   Mtx4000.NoVisible.Clear;
   Mtx4000.UsuarioSQL.Add(xSQL);
   Mtx4000.NewQuery;

End;

Procedure TFToolKdx.sbDisenoClick(Sender: TObject);
Begin
   cbDiseno.Checked := Not cbDiseno.Checked;
End;

Procedure TFToolKdx.bbtnInvValExcelClick(Sender: TObject);
Begin
   xContinuaConsulta := True;
   xFechaPeriodo := datetostr(dtpHasta.date);
   DataInvValorizado;
   If Not xContinuaConsulta Then exit;

   dtgData.datasource := DMALM.dsReporte;
   Try
      DMALM.HojaExcel('INVENTARIO', DMALM.dsReporte, dtgData);
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
End;

Procedure TFToolKdx.sbMesExit(Sender: TObject);
Begin
   sbMes.Text := DMALM.StrZero(trim(sbMes.Text), 2);
End;

Procedure TFToolKdx.DataInvValorizado;
Var
   xSQL, xDia, xMes, xMAn, xAno, sHasta: String;
   D, M, Y: Word;
   xConCeros: boolean;
   xWhere, xOrder: String;
   x: Integer;
Begin
   Screen.Cursor := crHourGlass;
   xConCeros := False;
   If MessageDlg('¿Considerar Saldos con Cero?   ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      xConCeros := True;

   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));
   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

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
   xSQL := 'Select LOG319.CIAID, LOG319.ALMID, B.TINID, B.ARTCONT, '
      + '          LOG319.LOGANOMM, LOG319.CANTOTING, LOG319.CANTOTSAL,'
      + '          nvl(LOG319.STKINI,0) STKINI, '
      + '          nvl(LOG319.STKFIN,0) STKFIN, '
      + '          nvl(H.PREPROMFIN,B.ARTCPROG) COSTOU, '
      + '          nvl(H.PREPROMFIN,B.ARTCPROG) COSTO, '
      + '          round(nvl(LOG319.STKFIN,0)*nvl(H.PREPROMFIN,B.ARTCPROG),5) VALOR, '
      + '          B.UNMIDG, B.UNMIDU, E.ALMDES, F.TINDES, B.GRARID, C.GRARDES, '
      + '          LOG319.ARTID, B.ARTDES, D.CIADES, B.FAMID, B.SFAMID, '
      + '          LOG319.USUARIO, LOG319.FREG, B.MARCA, '''' MARDES '
      + '     From LOG319, TGE205 B, TGE131 C, TGE101 D, '
      + '          TGE151 E, TGE152 F, ' // LOG323 G,
      + '          LOG337 H '
      + '    where LOG319.LOGANOMM=' + quotedstr(xAno + xMes);
   If Not xConCeros Then
      xSQL := xSQL + '          and nvl(LOG319.STKFIN,0) > 0 ';
   xSQL := xSQL
      + '          and B.CIAID(+)=LOG319.CIAID and B.ARTID(+)=LOG319.ARTID and nvl(B.CONSIGNACION,''N'')=''N'' '
      + '          and H.CIAID(+)=LOG319.CIAID and H.LOGANOMM(+)=LOG319.LOGANOMM and H.ARTID(+)=LOG319.ARTID '
      + '          and C.CIAID(+)=B.CIAID and C.TINID(+)=B.TINID and C.GRARID(+)=B.GRARID '
      + '          and D.CIAID(+)=LOG319.CIAID '
      + '          and E.CIAID(+)=LOG319.CIAID '
      + '               and E.TINID(+)=LOG319.TINID and E.ALMID(+)=LOG319.ALMID '
      + '               and E.ACTIVO=''S'' '
      + '          and F.CIAID(+)=B.CIAID and F.TINID(+)=B.TINID ';
// Fin HPC_201502_ALM

   xSQL := 'select * from (' + xSQL + ' ) SOLVISTA';

   If length(xWhere) > 0 Then
      xSQL := xSQL + ' where ' + xWhere;
   If length(xOrder) = 0 Then
      xSQL := xSQL + ' Order by TINID, ALMID, GRARID, ARTID '
   Else
      xSQL := xSQL + ' Order by ' + xOrder;

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   DecodeDate(dtpHasta.Date + 1, Y, M, D); // si es último día del mes, la siguiente fecha cambia de mes
   If strtoint(xMes) = M Then
   Begin
      If MessageDlg('¿Considerar Saldos sólo hasta ' + datetostr(dtpHasta.Date) + '? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMALM.cdsReporte.First;
         While Not DMALM.cdsReporte.EOF Do
         Begin
         // Inicio HPC_201502_ALM
            xSQL := 'select sum(case when NISATIP=''INGRESO'' then KDXCNTG else -KDXCNTG end) MOVKARDEX '
               + '  from LOG315 '
               + ' where CIAID=' + quotedstr(DMALM.cdsReporte.FieldByName('CIAID').AsString)
               + '   and ALMID=' + quotedstr(DMALM.cdsReporte.FieldByName('ALMID').AsString)
               + '   and ARTID=' + quotedstr(DMALM.cdsReporte.FieldByName('ARTID').AsString)
               + '   and NISAFREG>=' + quotedstr(datetostr(strtodate('01/' + xMes + '/' + xAno)))
               + '   and NISAFREG<=' + quotedstr(datetostr(dtpHasta.Date))
               + '   and NISSIT=' + quotedstr('ACEPTADO');
            DMALM.cdsQry.Close;
            DMALM.cdsQry.DataRequest(xSQL);
            DMALM.cdsQry.Open;
            If DMALM.cdsQry.Recordcount > 0 Then
            Begin
               DMALM.cdsReporte.Edit;
               DMALM.cdsReporte.FieldByName('STKFIN').AsFloat := DMALM.cdsReporte.FieldByName('STKINI').AsFloat
                  + DMALM.cdsQry.FieldByName('MOVKARDEX').AsFloat;
               DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('STKFIN').AsFloat
                  * DMALM.cdsReporte.FieldByName('COSTO').AsFloat, 15, 2);
               DMALM.cdsReporte.Post;
            End;
         // Fin HPC_201502_ALM
            DMALM.cdsReporte.Next;
         End;
      End;
   End;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Módulo de Almacén', 'No Existe Información a Mostrar');
      xContinuaConsulta := False;
      Exit;
   End;

   xFechaPeriodo := xDia + '/' + xMes + '/' + xAno;

   DMALM.cdsReporte.First;
End;

Procedure TFToolKdx.bbtnKardexClick(Sender: TObject);
Var
   xSQL, xCiaid, xAlmid, xArtid, xAnoMesIni, xAnoMesFin: String;
   xFechaInicio, xFechaFinal: TDateTime;
   xSaldoInicial, xSaldoFinal: Currency;
   wAno, wMes, wDia: Word;
Begin
   xFechaInicio := strtodate('01/'
      + DMALM.StrZero(sbMes.Text, 2)
      + '/'
      + sbAno.Text);
   xFechaFinal := dtpHasta.Date;
   xAnoMesIni := sbAno.Text + DMALM.StrZero(sbMes.Text, 2);
   decodedate(xFechaFinal, wAno, wMes, wDia);
   xAnoMesFin := IntToStr(wAno) + DMALM.StrZero(IntToStr(wMes), 2);

// Inicio HPC_201502_ALM
   xSQL := 'Select ''12'' CIAID, ''1234567890123456789012345678901234567890'' CIADES, '
      + '       ''12'' ALMID, ''1234567890123456789012345678901234567890'' ALMDES, '
      + '       ''12'' TINID, ''1234567890123456789012345678901234567890'' TINDES, '
      + '       ''123456789012345''ARTID, ''123456789012345678901234567890123456789012345678901234567890'' ARTDES, '
      + '       ''123'' GRARID, ''1234567890123456789012345678901234567890'' GRARDES, '
      + '       ''123456789012345'' ORDENIMP, '
      + '       ''12'' TRIID, ''1234567890123456789012345678901234567890'' TRIDES, '
      + '       ''123'' FAMID, ''1234567890123456789012345678901234567890'' FAMDES, '
      + '       ''12345678'' SFAMID, ''1234567890123456789012345678901234567890'' SFAMDES, '
      + '       ''123456789012345'' NISAID, '
      + '       ''123456789012345'' NISSIT, 0.00 KDXCNTG, '
      + '       0.00 INGRESO, '
      + '       0.00 SALIDA, '
      + '       0.00 ARTPCG, ''1234567890'' NISATIP, trunc(sysdate) NISAFREG, ''1'' TMONID, '
      + '       ''YYYYMM'' ANOMESMOV, 0.00 SALDO, 0.00 PREPROMINI '
      + '  from DUAL '
      + ' where 1<>1 ';
// Fin HPC_201502_ALM

   cdsKardex.Close;
   cdsKardex.DataRequest(xSQL);
   cdsKardex.Open;

   cdsKardex.EmptyDataSet;

   Mtx4000.FMant.cds2.DisableControls;
   Mtx4000.FMant.cds2.IndexFieldNames := 'CIAID; ARTID; ALMID';
   Mtx4000.FMant.cds2.First;
   While Not Mtx4000.FMant.cds2.EOF Do
   Begin
      xCiaId := Mtx4000.FMant.cds2.FieldByName('CIAID').AsString;
      xAlmId := Mtx4000.FMant.cds2.FieldByName('ALMID').AsString;
      xArtId := Mtx4000.FMant.cds2.FieldByName('ARTID').AsString;
      While (Not Mtx4000.FMant.cds2.EOF)
         And (Mtx4000.FMant.cds2.FieldByName('CIAID').AsString = xCiaId)
         And (Mtx4000.FMant.cds2.FieldByName('ALMID').AsString = xAlmId)
         And (Mtx4000.FMant.cds2.FieldByName('ARTID').AsString = xArtId) Do
      Begin
         Mtx4000.FMant.cds2.Next;
      End;

   // Inicio HPC_201502_ALM
      xSQL := ' select ARTI.CIAID, CIAS.CIADES, '
         + quotedstr(xAnoMesIni) + ' LOGANOMM, '
         + quotedstr(xAlmId) + ' ALMID, ALM.ALMDES, '
         + '        ARTI.TINID, TINV.TINDES, '
         + '        ARTI.ARTID, ARTI.ARTDES, '
         + '        ARTI.GRARID, LINEAS.GRARDES, '
         + '        ARTI.FAMID, FAMIL.FAMDES, '
         + '        0.00 STKINI, 0.00 CANTOTING, 0.00 CANTOTSAL, 0.00 STKFIN '
         + '   from TGE205 ARTI, TGE101 CIAS, TGE151 ALM, '
         + '        TGE152 TINV, TGE131 LINEAS, TGE169 FAMIL '
         + '  where ARTI.CIAID=' + quotedstr(xCiaId)
         + '    and ARTI.ARTID=' + quotedstr(xArtId)
         + '    and CIAS.CIAID=ARTI.CIAID '
         + '    and ALM.CIAID=ARTI.CIAID and ALM.LOCID=''01'' '
         + '        and ALM.TINID=ARTI.TINID and ALM.ALMID=' + quotedstr(xAlmId)
         + '        and ALM.ACTIVO=''S'' '
         + '    and TINV.CIAID=ARTI.CIAID and TINV.TINID=ARTI.TINID '
         + '    and LINEAS.CIAID=ARTI.CIAID and LINEAS.TINID=ARTI.TINID and LINEAS.GRARID=ARTI.GRARID '
         + '    and FAMIL.CIAID(+)=ARTI.CIAID and FAMIL.TINID(+)=ARTI.TINID and FAMIL.GRARID(+)=ARTI.GRARID and FAMIL.FAMID(+)=ARTI.FAMID ';
      DMALM.cdsQry2.Close;
      DMALM.cdsQry2.DataRequest(xSQL);
      DMALM.cdsQry2.Open;

   // Saldo Inicial del Artículo
      xSQL := ' Select SALDOS.CIAID, CIAS.CIADES, '
         + '        SALDOS.LOGANOMM, '
         + '        SALDOS.ALMID, ALM.ALMDES, '
         + '        SALDOS.TINID, TINV.TINDES, '
         + '        SALDOS.ARTID, ARTI.ARTDES, '
         + '        ARTI.GRARID, LINEAS.GRARDES, '
         + '        ARTI.FAMID, FAMIL.FAMDES, '
         + '        SALDOS.STKINI, SALDOS.CANTOTING, SALDOS.CANTOTSAL, '
         + '        SALDOS.STKFIN '
         + '   from LOG319 SALDOS, TGE101 CIAS, TGE205 ARTI, TGE151 ALM, '
         + '        TGE152 TINV, TGE131 LINEAS, TGE169 FAMIL '
         + '  where SALDOS.CIAID=' + quotedstr(xCiaId)
         + '    and SALDOS.LOGANOMM=' + quotedstr(xAnoMesIni)
         + '    and SALDOS.ALMID=' + quotedstr(xAlmId)
         + '    and SALDOS.ARTID=' + quotedstr(xArtId)
         + '    and CIAS.CIAID=SALDOS.CIAID '
         + '    and ARTI.CIAID=SALDOS.CIAID and ARTI.ARTID=SALDOS.ARTID '
         + '    and ALM.CIAID=SALDOS.CIAID and ALM.LOCID=''01'' and ALM.TINID=ARTI.TINID and ALM.ALMID=SALDOS.ALMID '
         + '    and ALM.ACTIVO=''S'' '
         + '    and TINV.CIAID=SALDOS.CIAID and TINV.TINID=ARTI.TINID '
         + '    and LINEAS.CIAID=SALDOS.CIAID and LINEAS.TINID=ARTI.TINID and LINEAS.GRARID=ARTI.GRARID '
         + '    and FAMIL.CIAID(+)=ARTI.CIAID and FAMIL.TINID(+)=ARTI.TINID and FAMIL.GRARID(+)=ARTI.GRARID and FAMIL.FAMID(+)=ARTI.FAMID ';
   // Fin HPC_201502_ALM
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
      xSaldoInicial := 0;
   // Se inserta registro de Saldo Inicial
      If DMALM.cdsQry.RecordCount > 0 Then
      Begin
         xSaldoInicial := DMALM.cdsQry.FieldByName('STKINI').AsFloat;
         cdsKardex.Append;
         cdsKardex.FieldByName('CIAID').AsString := DMALM.cdsQry.FieldByname('CIAID').AsString;
         cdsKardex.FieldByName('CIADES').AsString := DMALM.cdsQry.FieldByname('CIADES').AsString;
         cdsKardex.FieldByName('ALMID').AsString := DMALM.cdsQry.FieldByname('ALMID').AsString;
         cdsKardex.FieldByName('ALMDES').AsString := DMALM.cdsQry.FieldByname('ALMDES').AsString;
         cdsKardex.FieldByName('TINID').AsString := DMALM.cdsQry.FieldByname('TINID').AsString;
         cdsKardex.FieldByName('TINDES').AsString := DMALM.cdsQry.FieldByname('TINDES').AsString;
         cdsKardex.FieldByName('ARTID').AsString := DMALM.cdsQry.FieldByname('ARTID').AsString;
         cdsKardex.FieldByName('ARTDES').AsString := DMALM.cdsQry.FieldByname('ARTDES').AsString;
         cdsKardex.FieldByName('GRARID').AsString := DMALM.cdsQry.FieldByname('GRARID').AsString;
         cdsKardex.FieldByName('GRARDES').AsString := DMALM.cdsQry.FieldByname('GRARDES').AsString;
         cdsKardex.FieldByName('ORDENIMP').AsString := 'A';
         cdsKardex.FieldByName('NISAID').AsString := 'Saldo Inicial';
         cdsKardex.FieldByName('NISATIP').AsString := '';
         cdsKardex.FieldByName('NISAFREG').AsDateTime := xFechaInicio;
         cdsKardex.FieldByName('SALDO').AsFloat := xSaldoInicial;
         cdsKardex.FieldByName('PREPROMINI').AsFloat := 0.00;
         cdsKardex.Post;
      End
      Else
      Begin
         xSaldoInicial := DMALM.cdsQry2.FieldByName('STKINI').AsFloat;
         cdsKardex.Append;
         cdsKardex.FieldByName('CIAID').AsString := DMALM.cdsQry2.FieldByname('CIAID').AsString;
         cdsKardex.FieldByName('CIADES').AsString := DMALM.cdsQry2.FieldByname('CIADES').AsString;
         cdsKardex.FieldByName('ALMID').AsString := DMALM.cdsQry2.FieldByname('ALMID').AsString;
         cdsKardex.FieldByName('ALMDES').AsString := DMALM.cdsQry2.FieldByname('ALMDES').AsString;
         cdsKardex.FieldByName('TINID').AsString := DMALM.cdsQry2.FieldByname('TINID').AsString;
         cdsKardex.FieldByName('TINDES').AsString := DMALM.cdsQry2.FieldByname('TINDES').AsString;
         cdsKardex.FieldByName('ARTID').AsString := DMALM.cdsQry2.FieldByname('ARTID').AsString;
         cdsKardex.FieldByName('ARTDES').AsString := DMALM.cdsQry2.FieldByname('ARTDES').AsString;
         cdsKardex.FieldByName('GRARID').AsString := DMALM.cdsQry2.FieldByname('GRARID').AsString;
         cdsKardex.FieldByName('GRARDES').AsString := DMALM.cdsQry2.FieldByname('GRARDES').AsString;
         cdsKardex.FieldByName('ORDENIMP').AsString := 'A';
         cdsKardex.FieldByName('NISAID').AsString := 'Saldo Inicial';
         cdsKardex.FieldByName('NISATIP').AsString := '';
         cdsKardex.FieldByName('NISAFREG').AsDateTime := xFechaInicio;
         cdsKardex.FieldByName('SALDO').AsFloat := xSaldoInicial;
         cdsKardex.FieldByName('PREPROMINI').AsFloat := 0.00;
         cdsKardex.Post;
      End;

   // Movimientos de Almacén
   // Inicio HPC_201502_ALM
      xSQL := 'Select A.CIAID, E.CIADES, A.ALMID, G.ALMDES, A.TINID, H.TINDES, '
         + '       A.ARTID, C.ARTDES, C.GRARID, I.GRARDES, A.NISATIP ORDENIMP, '
         + '       A.TRIID, J.TRIDES, '
         + '       C.FAMID, C.SFAMID, A.NISAID, '
         + '       B.NISSIT, A.KDXCNTG, '
         + '       case when A.NISATIP=''INGRESO'' then A.KDXCNTG end INGRESO, '
         + '       case when A.NISATIP=''SALIDA''  then A.KDXCNTG end SALIDA, '
         + '       A.ARTPCG, A.NISATIP, A.NISAFREG NISAFREG, B.TMONID, '
         + '       to_char(A.NISAFREG,''YYYYMM'') ANOMESMOV, 0.00 SALDO, 0.00 PREPROMINI '
         + '  from LOG315 A, LOG314 B, TGE205 C, TGE101 E, TGE126 F, TGE151 G, TGE152 H, '
         + '       TGE131 I, TGE208 J '
         + ' where A.CIAID=' + quotedstr(xCiaId)
         + '   and A.ALMID=' + quotedstr(xAlmId)
         + '   and A.ARTID=' + quotedstr(xArtId)
         + '   and A.NISAFREG>=' + quotedstr(datetostr(xFechaInicio))
         + '   and A.NISAFREG<=' + quotedstr(datetostr(xFechaFinal))
         + '   and A.NISSIT=''ACEPTADO'' '
         + '   and B.CIAID(+)=A.CIAID '
         + '   and B.TINID(+)=A.TINID and B.ALMID(+)=A.ALMID and B.NISATIP(+)=A.NISATIP '
         + '   and B.NISAID(+)=A.NISAID and B.TRIID(+)=A.TRIID and B.NISSIT(+)=''ACEPTADO'' '
         + '   and C.CIAID=A.CIAID AND C.TINID=A.TINID AND C.ARTID=A.ARTID '
         + '   and E.CIAID(+)=A.CIAID and F.CIAID(+)=A.CIAID and F.LOCID(+)=A.LOCID '
         + '   and G.CIAID(+)=A.CIAID and G.LOCID(+)=A.LOCID and G.TINID(+)=A.TINID '
         + '   and G.ALMID(+)=A.ALMID and G.ACTIVO=''S'' '
         + '   and H.CIAID(+)=A.CIAID and H.TINID(+)=A.TINID '
         + '   and I.CIAID(+)=A.CIAID and I.TINID(+)=A.TINID and I.GRARID(+)=A.GRARID '
         + '   and J.TRIID(+)=A.TRIID and J.TDAID(+)=A.TDAID '
         + ' Order by A.CIAID, A.ALMID, A.ARTID, A.NISAFREG, A.NISATIP, A.NISAID ';
   // Fin HPC_201502_ALM
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;

   // Inicio HPC_201502_ALM
      xSaldoFinal := xSaldoInicial;
   // Fin HPC_201502_ALM
      DMALM.cdsQry.First;
      While Not DMALM.cdsQry.EOF Do
      Begin
         cdsKardex.Append;
         cdsKardex.FieldByName('CIAID').AsString := DMALM.cdsQry.FieldByname('CIAID').AsString;
         cdsKardex.FieldByName('CIADES').AsString := DMALM.cdsQry.FieldByname('CIADES').AsString;
         cdsKardex.FieldByName('ALMID').AsString := DMALM.cdsQry.FieldByname('ALMID').AsString;
         cdsKardex.FieldByName('ALMDES').AsString := DMALM.cdsQry.FieldByname('ALMDES').AsString;
         cdsKardex.FieldByName('TINID').AsString := DMALM.cdsQry.FieldByname('TINID').AsString;
         cdsKardex.FieldByName('TINDES').AsString := DMALM.cdsQry.FieldByname('TINDES').AsString;
         cdsKardex.FieldByName('ARTID').AsString := DMALM.cdsQry.FieldByname('ARTID').AsString;
         cdsKardex.FieldByName('ARTDES').AsString := DMALM.cdsQry.FieldByname('ARTDES').AsString;
         cdsKardex.FieldByName('GRARID').AsString := DMALM.cdsQry.FieldByname('GRARID').AsString;
         cdsKardex.FieldByName('GRARDES').AsString := DMALM.cdsQry.FieldByname('GRARDES').AsString;
         cdsKardex.FieldByName('ORDENIMP').AsString := DMALM.cdsQry.FieldByName('ORDENIMP').AsString;
         cdsKardex.FieldByName('TRIID').AsString := DMALM.cdsQry.FieldByName('TRIID').AsString;
         cdsKardex.FieldByName('TRIDES').AsString := DMALM.cdsQry.FieldByName('TRIDES').AsString;
         cdsKardex.FieldByName('FAMID').AsString := DMALM.cdsQry.FieldByName('FAMID').AsString;
         cdsKardex.FieldByName('SFAMID').AsString := DMALM.cdsQry.FieldByName('SFAMID').AsString;
         cdsKardex.FieldByName('NISAID').AsString := DMALM.cdsQry.FieldByName('NISAID').AsString;
         cdsKardex.FieldByName('NISSIT').AsString := DMALM.cdsQry.FieldByName('NISSIT').AsString;
         cdsKardex.FieldByName('KDXCNTG').AsFloat := DMALM.cdsQry.FieldByName('KDXCNTG').AsFloat;
         cdsKardex.FieldByName('INGRESO').AsFloat := DMALM.cdsQry.FieldByName('INGRESO').AsFloat;
         cdsKardex.FieldByName('SALIDA').AsFloat := DMALM.cdsQry.FieldByName('SALIDA').AsFloat;
         cdsKardex.FieldByName('ARTPCG').AsFloat := DMALM.cdsQry.FieldByName('ARTPCG').AsFloat;
         cdsKardex.FieldByName('NISATIP').AsString := DMALM.cdsQry.FieldByName('NISATIP').AsString;
         cdsKardex.FieldByName('NISAFREG').AsDateTime := DMALM.cdsQry.FieldByName('NISAFREG').AsDateTime;
         cdsKardex.FieldByName('TMONID').AsString := DMALM.cdsQry.FieldByName('TMONID').AsString;
         cdsKardex.FieldByName('ANOMESMOV').AsString := DMALM.cdsQry.FieldByName('ANOMESMOV').AsString;
         xSaldoFinal := xSaldoFinal + cdsKardex.FieldByName('INGRESO').AsFloat
            - cdsKardex.FieldByName('SALIDA').AsFloat;
         cdsKardex.FieldByName('SALDO').AsFloat := xSaldoFinal;
         cdsKardex.FieldByName('PREPROMINI').AsFloat := DMALM.cdsQry.FieldByName('PREPROMINI').AsFloat;
         cdsKardex.Post;
         DMALM.cdsQry.Next;
      End;

   // Se inserta registro de Saldo Final
      cdsKardex.Append;
      cdsKardex.FieldByName('CIAID').AsString := DMALM.cdsQry2.FieldByname('CIAID').AsString;
      cdsKardex.FieldByName('CIADES').AsString := DMALM.cdsQry2.FieldByname('CIADES').AsString;
      cdsKardex.FieldByName('ALMID').AsString := DMALM.cdsQry2.FieldByname('ALMID').AsString;
      cdsKardex.FieldByName('ALMDES').AsString := DMALM.cdsQry2.FieldByname('ALMDES').AsString;
      cdsKardex.FieldByName('TINID').AsString := DMALM.cdsQry2.FieldByname('TINID').AsString;
      cdsKardex.FieldByName('TINDES').AsString := DMALM.cdsQry2.FieldByname('TINDES').AsString;
      cdsKardex.FieldByName('ARTID').AsString := DMALM.cdsQry2.FieldByname('ARTID').AsString;
      cdsKardex.FieldByName('ARTDES').AsString := DMALM.cdsQry2.FieldByname('ARTDES').AsString;
      cdsKardex.FieldByName('GRARID').AsString := DMALM.cdsQry2.FieldByname('GRARID').AsString;
      cdsKardex.FieldByName('GRARDES').AsString := DMALM.cdsQry2.FieldByname('GRARDES').AsString;
      cdsKardex.FieldByName('ORDENIMP').AsString := 'Z';
      cdsKardex.FieldByName('NISAID').AsString := 'Saldo Final';
      cdsKardex.FieldByName('NISATIP').AsString := '';
      cdsKardex.FieldByName('NISAFREG').AsDateTime := xFechaFinal;
      cdsKardex.FieldByName('SALDO').AsFloat := xSaldoFinal;
      cdsKardex.FieldByName('PREPROMINI').AsFloat := 0.00;
      cdsKardex.Post;
   End;

   If cdsKardex.Recordcount > 0 Then
   Begin
      dbKardex.DataSource := dsKardex;
      RepKardex.DataPipeline := dbKardex;
      RepKardex.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RepKardex2.rtm';
      RepKardex.Template.LoadFromFile;

      pplTituloKardex.Caption := 'Kardex del ' + datetostr(xFechaInicio) + ' al ' + datetostr(xFechaFinal);

      If cbDiseno.Checked Then
      Begin
         ppDesigner1.Report := RepKardex;
         ppDesigner1.ShowModal;
      End
      Else
      Begin
         RepKardex.Print;
         RepKardex.Stop;
      End;
   End
   Else
   Begin
      ShowMessage('No hay registros para imprimir');
   End;

   Mtx4000.FMant.cds2.First;
   Mtx4000.FMant.cds2.EnableControls;
End;

Procedure TFToolKdx.pprInvValPreviewFormCreate(Sender: TObject);
Begin
   pprInvVal.PreviewForm.WindowState := WsMaximized;
   TppViewer(pprInvVal.PreviewForm.Viewer).ZoomSetting := zs100Percent;
End;

Procedure TFToolKdx.RepKardexPreviewFormCreate(Sender: TObject);
Begin
   RepKardex.PreviewForm.WindowState := WsMaximized;
   TppViewer(RepKardex.PreviewForm.Viewer).ZoomSetting := zs100Percent;
End;

End.

