Unit oaIN4000;

// ACTUALIZACIONES:
// HPC_201401_ALM 19/06/2014 Cambio de Versión a 20140623083000
// HPC_201404_ALM 19/09/2014 Se corrigio la adición y consulta de Notas de Salida cuando es salidas
//                            por devolución y transferencia a otro almacén.
// HPC_201604_ALM 19/05/2016 Añade Control de Acceso por Grupo de Usuario
// HPC_201605_ALM 04/07/2016 Se agrega nueva variable modulo Mtx4000
// HPC_201606_ALM 01/08/2016 Cambio de Version a 20160801100000
// HPC_201607_ALM 08/08/2016 Cambio de Version a 20160818083000
// HPC_201608_ALM 22/09/2016 Cambio de Version a 20160923083000
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
//                           reimplementa Control de Acceso por Grupo de Usuario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, ExtCtrls, StdCtrls, Buttons, Wwdbigrd, MsgDlgs;

Type
   TFINConsultas = Class(TForm)
    lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }
      Procedure PGridShow(Sender: TObject);
      Procedure MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);
   // kardex
      Procedure PegaPanelToolKdx(Sender: TObject);
      Procedure OnEditKardex(Sender: TObject; MantFields: TFields);
      Procedure OnShowKardex(Sender: TObject);

   // saldos por stock
      Procedure PegaPanelToolSalStock(Sender: TObject);

   // detalle de movimiento por almacén
      Procedure PegaPanelToolNSal(Sender: TObject);

   // consulta artículos
      Procedure PegaPanelToolConxArt(Sender: TObject);
      Procedure OnEditConArt(Sender: TObject; MantFields: TFields);

   // consumo por centro de costo
      Procedure PegaPanelToolCCosto(Sender: TObject);
      Procedure OnEditDetMovCCosto(Sender: TObject; MantFields: TFields);
      Procedure OnEditNIS(Sender: TObject; MantFields: TFields);
      Procedure OnEditDetMovxArt(Sender: TObject; MantFields: TFields);

   // consumo por artículos
      Procedure PegaPanelToolArtCCosto(Sender: TObject);
      Procedure OnEditArtCCosto(Sender: TObject; MantFields: TFields);
      Procedure OnEditArtCCostoDet(Sender: TObject; MantFields: TFields);

   // consumo por años
      Procedure PegaPanelToolAnno(Sender: TObject);
      Procedure OnEditaConsumo(Sender: TObject; MantFields: TFields);
      Procedure OnEditaTotal(Sender: TObject; MantFields: TFields);

   // orden de despacho
   //   Procedure ToolAlmCreate(Sender: TObject);
   //   Procedure AlmacenEdita(Sender: TObject; MantFields: TFields);

   // artículo por lote
   //   Procedure PegaPanelToolLote(Sender: TObject);
   End;

Procedure INKardex; stdcall;
Procedure INSaldoStock; stdcall;
Procedure INDetalleMovAlm; stdcall;
Procedure INConsultaArticulos; stdcall;
Procedure INConsumoCCosto; stdcall;
Procedure INConsumoxArticulos; stdcall;
Procedure INConsumoxAnos; stdcall;
Procedure INOrdenDespacho; stdcall;
Procedure INArticuloxLote; stdcall;
Procedure INConsumoAnualCCos; stdcall;
Procedure INMovimientoArticulos; stdcall;
Procedure INMovTipoTransaccion; stdcall;
Procedure INVerificaVersion; stdcall;

Exports
   INKardex,
   INSaldoStock,
   INDetalleMovAlm,
   INConsultaArticulos,
   INConsumoCCosto,
   INConsumoxArticulos,
   INConsumoxAnos,
   INOrdenDespacho,
   INArticuloxLote,
   INConsumoAnualCCos,
   INMovimientoArticulos,
   INMovTipoTransaccion,
   INVerificaVersion;
Var
// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   FINConsultas: TFINConsultas;
   mtx4000, mtx4001, mtx4002: TMant;
   D, M, Y: Word;
// Fin  HPC_201605_ALM

Implementation

{$R *.dfm}

Uses ALMDM1, ALM700, ALM411, ALM760, ALM770, ALM710, ALM417, ALM413, ALM201IN,
   ALM414, ALM415, ALM440, ALM442, ALM444;

// ALM444 FMovTipoTransaccion   Reporte por tipo de Transaccion
// ALM442 FMovPorArticulo       Reporte de Movimiento de Articulos

// ALM700 FToolKdx, Tool del Kardex
// ALM411 FKardex

// ALM760 FToolSalArt, Tool de Saldos de Stock
// ALM770 FToolSA, Tool de detalle de movimiento por almacén

// ALM710 FToolConxArt,  Tool de consulta artículos
// ALM417 FConArtHist Distribución de Artículos en Almacén

// ALM413 FToolCCosto, Tool de consumo por centro de costo
// ALM201IN FRegNtaSal  Nota de Salida

// ALM414 FToolArtCCosto Tool de consumo por artículos

// ALM415 FToolConAnno, Tool de consumo por años

// ALM7B0 FToolAlm, Tool de orden de despacho
// ALM430 FAlmacen  Pedidos x Atender

// ALM791 FToolLote, Tool de artículo por lote

// ALM440 FConsumoAnualCCos, Consulta Anual por Centros de Costo

Procedure TFINConsultas.PGridShow(Sender: TObject);
Var
   i: Integer;
   MGrid: TMant;
Begin
   MGrid := TMant(Sender);
   For i := 0 To MGrid.FMant.ComponentCount - 1 Do
   Begin
      If MGrid.FMant.Components[i].ClassName = 'TPanel' Then
         TPanel(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
  // para botones
      If MGrid.FMant.Components[i].ClassName = 'TButton' Then
         TButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
  // para bitbuttons
      If MGrid.FMant.Components[i].ClassName = 'TBitBtn' Then
         TBitBtn(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
  // para speedbuttons
      If MGrid.FMant.Components[i].ClassName = 'TSpeedButton' Then
         TSpeedButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
  // Boton de Grid
      If MGrid.FMant.Components[i].ClassName = 'TwwIButton' Then
         TwwIButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
  // para la forma
      MGrid.FMant.onMouseMove := MueveMouse;
   End;
//  DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario,'2', MGrid.FMant );
End;

/////////////////////////////////////////////////
// KARDEX
/////////////////////////////////////////////////

Procedure INKardex;
Var
   FIni: String;
   xSql: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020401') then Exit;
// Fin HPC_201701_ALM

   DMALM.cdsReporte.Close;
   FKardex := TFKardex.Create(Application);
   FToolKdx := TFToolKdx.Create(Application);
   DecodeDate(DateS, Y, M, D);
   FIni := '01/' + DMALM.StrZero(IntToStr(M), 2) + '/' + IntToStr(Y);
   FToolKdx.dtpDesde.Date := StrToDate(FIni);
   FToolKdx.dtpHasta.Date := DateS;
   FToolKdx.Height := 150;
   FToolKdx.Visible := False;

   xSQL := 'Select A.CIAID, A.LOGANOMM,A.ALMID,B.TINID, B.GRARID, B.FAMID, B.SFAMID, '
      + '       A.ARTID, B.ARTDES, A.STKINI, A.CANTOTING, '
      + '       A.CANTOTSAL, A.STKFIN, A.USUARIO, A.FREG, B.MARCA, C.MARDES '
      + '  From LOG319 A, TGE205 B, ALM_MAR_ART C '
      + ' Where A.LOGANOMM=''' + IntToStr(Y) + DMALM.StrZero(IntToStr(M), 2) + ''' '
      + '   and B.CIAID=A.CIAID and B.ARTID=A.ARTID '
      + '   and C.MARCA(+) = B.MARCA '
      + ' Order by A.CIAID, A.ALMID, A.TINID, A.ARTID, A.LOGANOMM ';
   xSQL := 'select * from (' + xSQL + ' ) SOLVISTA';
// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   Mtx4000 := TMant.Create(Application);
   Try
      Mtx4000.NoVisible.Clear;
      Mtx4000.Admin := DMALM.wAdmin;
      Mtx4000.DComC := DMALM.DCom1;
      Mtx4000.User := DMALM.wUsuario;
      Mtx4000.OnCreateMant := FINConsultas.PegaPanelToolKdx;
      Mtx4000.Filter := '';
      Mtx4000.ClientDataSet := DMALM.cdsSTK;
      Mtx4000.Module := DMALM.wModulo;
      Mtx4000.SectionName := 'ALMSaldos';
      Mtx4000.FileNameIni := '\oaAlm.Ini';
      Mtx4000.TableName := 'LOG319VW';
      //Mtx4000.TableName := 'LOG319';
      Mtx4000.UsuarioSQL.Add(xSQL);
      Mtx4000.Titulo := 'Kardex';
      Mtx4000.OnEdit := FINConsultas.OnEditKardex;
      Mtx4000.OnInsert := Nil;
      Mtx4000.OnDelete := Nil;
      Mtx4000.OnShow := FINConsultas.OnShowKardex;
      Mtx4000.Colors.Add('STKTSG01;clTeal;clWhite;;;STKTSG01%>=%0%;');
      Mtx4000.Colors.Add('STKTSG02;clTeal;clWhite;;;STKTSG02%>=%0%;');
      Mtx4000.Colors.Add('STKTSG03;clTeal;clWhite;;;STKTSG03%>=%0%;');
      Mtx4000.Colors.Add('STKTSG04;clTeal;clWhite;;;STKTSG04%>=%0%;');
      Mtx4000.Colors.Add('STKTSG05;clTeal;clWhite;;;STKTSG05%>=%0%;');
      Mtx4000.Colors.Add('STKTSG06;clTeal;clWhite;;;STKTSG06%>=%0%;');
      Mtx4000.Colors.Add('STKTSG07;clTeal;clWhite;;;STKTSG07%>=%0%;');
      Mtx4000.Colors.Add('STKTSG08;clTeal;clWhite;;;STKTSG08%>=%0%;');
      Mtx4000.Colors.Add('STKTSG09;clTeal;clWhite;;;STKTSG09%>=%0%;');
      Mtx4000.Colors.Add('STKTSG10;clTeal;clWhite;;;STKTSG10%>=%0%;');
      Mtx4000.Colors.Add('STKTSG11;clTeal;clWhite;;;STKTSG11%>=%0%;');
      Mtx4000.Colors.Add('STKTSG12;clTeal;clWhite;;;STKTSG12%>=%0%;');
      Mtx4000.NoVisible.Clear;
      Mtx4000.OnCierra := DMALM.DisminuyeForma;
      Mtx4000.Execute;
// Fin HPC_201605_ALM

   Finally
   End;
End;

Procedure TFINConsultas.OnEditKardex(Sender: TObject; MantFields: TFields);
Begin
// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   If mtx4000.FMant.cds2.RecordCount = 0 Then
// Fin HPC_201605_ALM
   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;
End;

Procedure TFINConsultas.OnShowKardex(Sender: TObject);
Begin
   FKardex.dtpDesde.Date := DateS;
   FKardex.dtpHasta.Date := DateS;
End;

Procedure TFINConsultas.PegaPanelToolKdx(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolKdx.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pl.AutoSize := True;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

/////////////////////////////////////////////////
// SALDOS X STOCK
/////////////////////////////////////////////////

Procedure INSaldoStock;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020402') then Exit;
// Fin HPC_201701_ALM

   Screen.Cursor := crHourGlass;
// ALM760 FToolSalArt, Tool de Saldos de Stock
// ALM770 FToolSA, Tool de detalle de movimiento por almacén
   FToolSalArt := TFToolSalArt.Create(Application);
   FToolSalArt.dtpHasta.Date := DateS;
   FToolSalArt.Height := 100;
   FToolSalArt.Visible := False;
   FToolSalArt.dbeCIA.text := '';

   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');
// Inicio HPC_201504_ALM
{
   xSql := 'Select A.* '
         + '  From (Select ''SALDOS'' TIPO, A.*, B.MARCA, C.MARDES '
         + '          From LOG316 A, TGE205 B, ALM_MAR_ART C '
         + '         Where A.CIAID=B.CIAID AND A.TINID=B.TINID(+) AND A.ARTID=B.ARTID(+) '
         + '           and B.MARCA=C.MARCA(+)) A '
         + ' where TIPO=''SALDOS'' ';
}
   xSql := ' Select *    from '
      + ' (Select A.CIAID,A.LOGANOMM,''SALDOS'' TIPO, ''STOCK AL MES DE '' ||A.LOGANOMM PERIODO_STOCK, A.ALMID, D.ALMDES, ''Almacén : ''||A.ALMID||'' - ''||D.ALMDES ALMACEN,A.ARTID, B.TINID, B.GRARID, B.FAMID, B.SFAMID, '
      + ' E.GRARDES, B.ARTDES, B.MARCA, C.MARDES, A.STKINI, A.CANTOTING, A.CANTOTSAL, A.STKFIN, 0.00 STKREALG, 0.00 STKREALU, 0.00 STKSACTG, 0.00 STKRACTG '
      + ' from LOG319 A,TGE205 B, ALM_MAR_ART C, TGE151 D, TGE131 E where B.CIAID=A.CIAID and B.ARTID=A.ARTID and C.MARCA(+)=B.MARCA '
      + ' and D.CIAID=A.CIAID and D.ALMID=A.ALMID and D.ACTIVO=''S'' and E.CIAID(+)=B.CIAID and E.TINID(+)=B.TINID and E.GRARID(+)=B.GRARID ) A '
      + ' where A.TIPO=''SALDOS'' and STKINI+CANTOTING+CANTOTSAL+STKFIN > 0 '
      + ' Order by GRARID, ALMID, ARTID ';
// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   Mtx4000 := TMant.Create(Application);
   Try
      Mtx4000.Admin := DMALM.wAdmin;
      Mtx4000.Module := DMALM.wModulo;
      Mtx4000.User := DMALM.wUsuario;
      Mtx4000.DComC := DMALM.DCOM1;

//    Mtx4000.TableName := 'LOG316VW';
      Mtx4000.TableName := 'SALDOSTOCK';
// Fin HPC_201504_ALM
      Mtx4000.UsuarioSQL.Add(xSQL);
      Mtx4000.Titulo := 'Saldo de Stock';
      Mtx4000.ClientDataSet := DMALM.cdsSaldos;
      Mtx4000.OnCreateMant := FINConsultas.PegaPanelToolSalStock;
      Mtx4000.OnEdit := Nil; //OnEditINV;
      Mtx4000.OnShow := FINConsultas.PGridShow;
      Mtx4000.OnDelete := Nil;
      Mtx4000.OnInsert := Nil;
      Mtx4000.Filter := '';
      Mtx4000.SectionName := 'ALMConsultaStocks';
      Mtx4000.FileNameIni := '\oaALM.INI';

      Mtx4000.Colors.Add('STKTSG01;clTeal;clWhite;;;STKTSG01%>=%0%;');
      Mtx4000.Colors.Add('STKTSG02;clTeal;clWhite;;;STKTSG02%>=%0%;');
      Mtx4000.Colors.Add('STKTSG03;clTeal;clWhite;;;STKTSG03%>=%0%;');
      Mtx4000.Colors.Add('STKTSG04;clTeal;clWhite;;;STKTSG04%>=%0%;');
      Mtx4000.Colors.Add('STKTSG05;clTeal;clWhite;;;STKTSG05%>=%0%;');
      Mtx4000.Colors.Add('STKTSG06;clTeal;clWhite;;;STKTSG06%>=%0%;');
      Mtx4000.Colors.Add('STKTSG07;clTeal;clWhite;;;STKTSG07%>=%0%;');
      Mtx4000.Colors.Add('STKTSG08;clTeal;clWhite;;;STKTSG08%>=%0%;');
      Mtx4000.Colors.Add('STKTSG09;clTeal;clWhite;;;STKTSG09%>=%0%;');
      Mtx4000.Colors.Add('STKTSG10;clTeal;clWhite;;;STKTSG10%>=%0%;');
      Mtx4000.Colors.Add('STKTSG11;clTeal;clWhite;;;STKTSG11%>=%0%;');
      Mtx4000.Colors.Add('STKTSG12;clTeal;clWhite;;;STKTSG12%>=%0%;');
      Mtx4000.NoVisible.Clear;
      Mtx4000.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4000.Execute;
// Fin HPC_201605_ALM

   Finally
   End;
End;

Procedure TFINConsultas.PegaPanelToolSalStock(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolSalArt.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pl.AutoSize := True;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

/////////////////////////////////////////////////
// DETALLE DE MOVIMIENTO POR ALMACEN
/////////////////////////////////////////////////

Procedure INDetalleMovAlm;
Var
   FIni: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020403') then Exit;
// Fin HPC_201701_ALM

   Screen.Cursor := crHourGlass;
   FToolSA := TFToolSA.create(Application);
   DecodeDate(DateS, Y, M, D);
   FIni := '01/' + IntToStr(M) + '/' + IntToStr(Y);
   FToolSA.dtpDesde.Date := StrToDate(FIni);
   FToolSA.dtpHasta.Date := Date;
   FToolSA.Height := 100;
   FToolSA.Visible := False;

   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   Mtx4000 := TMant.Create(Application);
   Try
      Mtx4000.Admin := DMALM.wAdmin;
      Mtx4000.OnCreateMant := FINConsultas.PegaPanelToolNSal;
      Mtx4000.User := DMALM.wUsuario;
      Mtx4000.DComC := DMALM.DCOM1;
      Mtx4000.Module := DMALM.wModulo;
      Mtx4000.TableName := 'LOG315';
      Mtx4000.Titulo := 'Detalle de Movimiento de Almacen';
      Mtx4000.ClientDataSet := DMALM.cdsKDX;
      Mtx4000.OnDelete := Nil;
      Mtx4000.OnEdit := Nil;
      Mtx4000.OnInsert := Nil;
      Mtx4000.OnShow := FINConsultas.PGridShow;
      Mtx4000.Filter := '';
      Mtx4000.SectionName := 'ALMInventarios';
      Mtx4000.FileNameIni := '\oaALM.INI';
      Mtx4000.NoVisible.Clear;
      Mtx4000.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4000.Execute;
// Fin HPC_201605_ALM

   Finally
   End;
End;

Procedure TFINConsultas.PegaPanelToolNSal(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolSA.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
 //pg.Height   := 55;
   pl.Height := pg.Height + 5;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

/////////////////////////////////////////////////
// CONSULTA ARICULOS
/////////////////////////////////////////////////

Procedure INConsultaArticulos;
Var
   xSQL: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020404') then Exit;
// Fin HPC_201701_ALM

   Screen.Cursor := crHourGlass;

   xSQL := 'SELECT A.CIAID, A.TINID, A.ARTID, A.ARTDES, A.ARTABR, A.GRARID, A.FAMID, A.SFAMID, A.UNMIDG, A.UNMIDU,  A.ARTSPRO, ' +
      'A.ARTPCU, A.ARTPCG, A.ARTPVU, A.ARTPVG, A.ARTFUC, A.ARTCNTG, A.ARTCNTU, A.ARTCPROU, A.ARTCPROG, A.ARTCONT, B.GRARDES, C.FAMDES, D.SFAMDES ' +
      'FROM TGE205 A, TGE131 B, TGE169 C, TGE170 D ' +
      'WHERE A.CIAID=''99'' ' +
      'AND A.TINID=''99'' ' +
      'AND A.CIAID=B.CIAID AND A.TINID=B.TINID AND A.GRARID=B.GRARID ' +
      'AND A.TINID=C.TINID AND A.GRARID=C.GRARID AND A.FAMID=C.FAMID ' +
      'AND A.TINID=D.TINID AND A.GRARID=D.GRARID AND A.FAMID=D.FAMID AND A.SFAMID=D.SFAMID';

   xSQL := 'select ''  '' CIAID, ''  '' TINID, ''                    '' ARTID, '
      + '       ''                              '' ARTDES, '
      + '       ''               '' ARTABR, ''  '' GRARID, ''   '' FAMID, ''   '' SFAMID, '
      + '       ''   '' UNMIDG, ''   '' UNMIDU,  ''            '' ARTSPRO, '
      + '       0.00 ARTPCU, 0.00 ARTPCG, 0.00 ARTPVU, 0.00 ARTPVG, ''  /  /    '' ARTFUC, '
      + '       0 ARTCNTG, 0 ARTCNTU, 0.00 ARTCPROU, 0.00 ARTCPROG, 0.00 ARTCONT, '
      + '       ''                           '' GRARDES, ''                           '' FAMDES,'
      + '       ''                           '' SFAMDES '
      + '  from TGE901 ';
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(xSQL);
   DMALM.cdsKDX.Open;

   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');
   FToolConxArt := TFToolConxArt.Create(Application);
   FToolConxArt.Visible := False;

// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   Mtx4000 := TMant.Create(Application);
   Try
      Mtx4000.Admin := DMALM.wAdmin;
      Mtx4000.User := DMALM.wUsuario;
      Mtx4000.DComC := DMALM.DCOM1;
      Mtx4000.Module := DMALM.wModulo;
      Mtx4000.OnCreateMant := FINConsultas.PegaPanelToolConxArt;
      Mtx4000.TableName := 'VWALMCONART';
      Mtx4000.Titulo := 'Consulta por Artículos';
      Mtx4000.ClientDataSet := DMALM.cdsKDX;
      Mtx4000.OnDelete := Nil;
      Mtx4000.OnEdit := FINConsultas.OnEditConArt;
      Mtx4000.OnInsert := Nil;
      Mtx4000.OnShow := FINConsultas.PGridShow;
      Mtx4000.Filter := '';
      Mtx4000.SectionName := 'ALMConArt';
      Mtx4000.FileNameIni := '\oaALM.INI';
      Mtx4000.UsuarioSQL.Add(xSQL);
      Mtx4000.NoVisible.Clear;
      Mtx4000.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4000.Execute;
// Fin HPC_201605_ALM

   Finally
   End;
End;

Procedure TFINConsultas.PegaPanelToolConxArt(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolConxArt.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pl.AutoSize := True;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFINConsultas.OnEditConArt(Sender: TObject; MantFields: TFields);
Var
   xxSQL: String;
Begin
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   If mtx4000.FMant.cds2.RecordCount = 0 Then
// Fin HPC_201605_ALM
   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;
   DecodeDate(DateS, Y, M, D);
   xxSQL := 'Select A.LOCID, A.ALMID, '
      + '       NVL(A.STKSACTG,0) STKSACTG, NVL(A.STKSACTU,0) STKSACTU, '
      + '       NVL(A.STKRACTG,0) STKRACTG, NVL(A.STKRACTU,0) STKRACTU, '
      + '       NVL(A.STKSACTG,0) - NVL(A.STKRACTG,0) DIFG, '
      + '       NVL(A.STKSACTU,0) - NVL(A.STKRACTU,0) DIFU '
      + '  from LOG316 A '
      + ' where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '   and STKANO=' + QuotedStr(InttoStr(Y))
      + '   and ARTID=' + QuotedStr(MantFields.FieldByName('ARTID').AsString);
   DMALM.cdsSTK.Close;
   DMALM.cdsSTK.DataRequest(xxSQL);
   DMALM.cdsSTK.Open;
   If DMALM.cdsSTK.RecordCount = 0 Then
   Begin
      ShowMessage('Error, No Existen Registros Para Esta Consulta');
      DMALM.cdsSTK.Close;
      exit;
   End;

   FConArtHist := TFConArtHist.Create(Application);
   FConArtHist.Caption := 'Distribución en Almacenes de ' + MantFields.FieldByName('ARTDES').AsString;
   FConArtHist.dbgArtActual.Selected.clear;
   FConArtHist.dbgArtActual.Selected.Add('LOCID'#9'5'#9'Localidad');
   FConArtHist.dbgArtActual.Selected.Add('ALMID'#9'5'#9'Almacén');
   FConArtHist.dbgArtActual.Selected.Add('STKSACTG'#9'8'#9'Stock~Act. Gnrl');
   FConArtHist.dbgArtActual.Selected.Add('STKSACTU'#9'8'#9'Stock~Act. Unit');
   FConArtHist.dbgArtActual.Selected.Add('STKRACTG'#9'8'#9'Reserva~Act. Gnrl.');
   FConArtHist.dbgArtActual.Selected.Add('STKRACTU'#9'8'#9'Reserva~Act. Unit.');
   FConArtHist.dbgArtActual.Selected.Add('DIFG'#9'8'#9'Saldo.~Gnrl.');
   FConArtHist.dbgArtActual.Selected.Add('DIFU'#9'8'#9'Saldo.~Unit');
   FConArtHist.dbgArtActual.DataSource := DMALM.dsSTK;
   FConArtHist.ActiveMDIChild;
End;

/////////////////////////////////////////////////
// CONSUMO POR CENTRO DE COSTO
/////////////////////////////////////////////////

Procedure INConsumoCCosto;
Var
   SalIniDes, SalIniHas, sSQL, FIni: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020405') then Exit;
// Fin HPC_201701_ALM

   Screen.Cursor := crHourGlass;
   FToolCCosto := TFToolCCosto.Create(Application);
   DecodeDate(DateS, Y, M, D);
   FIni := '01/' + IntToStr(M) + '/' + IntToStr(Y);
   FToolCCosto.dtpDesde.Date := StrToDate(FIni);
   FToolCCosto.dtpHasta.Date := Date;
   FToolCCosto.Z1sbCCosto.Visible := True;
   FToolCCosto.Z1sbActFiltro.Visible := True;
   FToolCCosto.rdgSelecc.Visible := True;
   FToolCCosto.Visible := False;
   SalIniDes := quotedStr(formatdatetime(DMALM.wFormatFecha, strtodatetime(Fini)));
   SalIniHas := quotedStr(formatdatetime(DMALM.wFormatFecha, Date));
   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

   sSQL := 'Select * '
      + '  from (Select CIAID, LOCID, TINID, ALMID, CCOSID, COUNT(*) CONTA, '
      + '               sum(KDXCNTG*ARTPCG) VALG, '
      + '               sum(KDXPEDIDOU*ARTPCU) VALU '
      + '          from LOG315 '
      + '         where NISATIP = ''SALIDA'' '
      + '           and NISSIT = ''ACEPTADO'' '
      + '         group by CIAID, LOCID, TINID, ALMID, CCOSID) SOLVISTA';
// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   Mtx4000 := TMant.Create(Application);
   Try
      Mtx4000.Admin := DMALM.wAdmin;
      Mtx4000.User := DMALM.wUsuario;
      Mtx4000.ClientDataSet := DMALM.cdsDetMov;
      Mtx4000.DComC := DMALM.DCom1;
      Mtx4000.FileNameIni := '\oaALM.INI';
      Mtx4000.Filter := '';
      Mtx4000.Module := DMALM.wModulo;
      Mtx4000.SectionName := 'DetCCosto';
      Mtx4000.TableName := 'VWALMDETCCOSTO';
      Mtx4000.Titulo := 'Consumos por Centros de Costo';
      Mtx4000.OnCreateMant := FINConsultas.PegaPanelToolCCosto;
      Mtx4000.OnEdit := FINConsultas.OnEditDetMovCCosto;
      Mtx4000.OnInsert := Nil;
      Mtx4000.OnDelete := Nil;
      Mtx4000.OnShow := FINConsultas.PGridShow;
      Mtx4000.UsuarioSQL.Add(sSQL);
      Mtx4000.NoVisible.Clear;
      Mtx4000.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4000.Execute;
// Fin HPC_201605_ALM

   Finally
   End
End;

Procedure TFINConsultas.PegaPanelToolCCosto(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolCCosto.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pl.AutoSize := True;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFINConsultas.OnEditDetMovCCosto(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   If mtx4000.FMant.cds2.RecordCount = 0 Then
// Fin HPC_201605_ALM

   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;

   If FToolCCosto.rdgSelecc.ItemIndex = 0 Then
   Begin // Por Nota de Salida
      Screen.Cursor := crHourGlass;
      sSQL := 'SELECT * FROM (SELECT * ';
      sSQL := sSQl + 'FROM LOG314 ';
      sSQL := sSQl + 'WHERE CCOSID=' + QuotedStr(MantFields.FieldByName('CCOSID').AsString);
      sSQL := sSQl + ' AND NISAFREG>=' + QuotedStr(formatdatetime(DMALM.wFormatFecha, FToolCCosto.dtpDesde.DateTime));
      sSQL := sSQl + ' AND NISAFREG<=' + QuotedStr(formatdatetime(DMALM.wFormatFecha, FToolCCosto.dtpHasta.DateTime));
      sSQL := sSQl + ' AND CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString);
      sSQL := sSQl + ' AND LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString);
      sSQL := sSQl + ' AND TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString);
      sSQL := sSQl + ' AND ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString) + ') SOLVISTA ';
      Mtx4001 := TMant.Create(Application);
      Try
         Mtx4001.Admin := DMALM.wAdmin;
         Mtx4001.User := DMALM.wUsuario;
         Mtx4001.ClientDataSet := DMALM.cdsNIS; //DMALM.cdsDetMovCco;
         Mtx4001.DComC := DMALM.DCom1;
         Mtx4001.FileNameIni := '\oaALM.INI';
         Mtx4001.Filter := '';
         Mtx4001.Module := DMALM.wModulo;
         Mtx4001.SectionName := 'DetCosNis';
         Mtx4001.TableName := 'VWALMDETCOSNIS'; // Cambiar
         Mtx4001.Titulo := 'Notas de Salida';
         Mtx4001.OnCreateMant := Nil; //PegaPanelToolOC;
         Mtx4001.OnEdit := FINConsultas.OnEditNIS;
         Mtx4001.OnInsert := Nil;
         Mtx4001.OnDelete := Nil;
         Mtx4001.OnShow := FINConsultas.PGridShow;
         Mtx4001.UsuarioSQL.Add(sSQL);
         Mtx4001.NoVisible.Clear;
         Mtx4001.OnCierra := DMALM.DisminuyeForma;
         Screen.Cursor := crDefault;
         Mtx4001.Execute;
      Finally
      End;
   End
   Else
      If FToolCCosto.rdgSelecc.ItemIndex = 1 Then
      Begin // Por Articulos
         Screen.Cursor := crHourGlass;
         sSQL := 'SELECT CIAID, LOCID, TINID, ALMID, CCOSID,  ARTID, COUNT(*) CONTA, ';
         sSQL := sSQl + 'SUM(KDXPEDIDOG * ARTPCG) VALG, ';
         sSQL := sSQl + 'SUM(KDXPEDIDOU * ARTPCU) VALU ';
         sSQL := sSQl + 'FROM LOG315 ';
         sSQL := sSQl + 'WHERE CCOSID=' + QuotedStr(MantFields.FieldByName('CCOSID').AsString);
         sSQL := sSQl + ' AND NISAFREG>=' + QuotedStr(formatdatetime(DMALM.wFormatFecha, FToolCCosto.dtpDesde.DateTime));
         sSQL := sSQl + ' AND NISAFREG<=' + QuotedStr(formatdatetime(DMALM.wFormatFecha, FToolCCosto.dtpHasta.DateTime));
         sSQL := sSQl + ' AND CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString);
         sSQL := sSQl + ' AND LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString);
         sSQL := sSQl + ' AND TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString);
         sSQL := sSQl + ' AND ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString);
         sSQL := sSQl + 'AND NISATIP =''SALIDA'' ';
         sSQL := sSQl + 'GROUP BY CIAID, LOCID, TINID, ALMID, CCOSID, ARTID ';
         Mtx4001 := TMant.Create(Application);
         Try
            Mtx4001.Admin := DMALM.wAdmin;
            Mtx4001.User := DMALM.wUsuario;
            Mtx4001.ClientDataSet := DMALM.cdsDetMovCco; //DMALM.cdsNIS;
            Mtx4001.DComC := DMALM.DCom1;
            Mtx4001.FileNameIni := '\oaALM.INI';
            Mtx4001.Filter := '';
            Mtx4001.Module := DMALM.wModulo;
            Mtx4001.SectionName := 'DetCosxArt';
            Mtx4001.TableName := 'VWALMDETCOSXART'; // Cambiar
            Mtx4001.Titulo := 'Por Articulos';
            Mtx4001.OnCreateMant := Nil; //PegaPanelToolOC;
            Mtx4001.OnEdit := FINConsultas.OnEditDetMovxArt;
            Mtx4001.OnInsert := Nil;
            Mtx4001.OnDelete := Nil;
            Mtx4001.OnShow := FINConsultas.PGridShow;
            Mtx4001.UsuarioSQL.Add(sSQL);
            Mtx4001.NoVisible.Clear;
            Mtx4001.OnCierra := DMALM.DisminuyeForma;
            Screen.Cursor := crDefault;
            Mtx4001.Execute;
         Finally
         End;
      End;
End;

Procedure TFINConsultas.OnEditNIS(Sender: TObject; MantFields: TFields);
Var
   xSQL, sCIA, sLOC, sALM, sNIS, sTDO, sSQL, sTIP: String;
Begin
   If Not DMALM.DCOM1.Connected Then Exit;

   If mtx4001.FMant.cds2.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No Existen Registros a Editar');
      exit;
   End;

   Try
      Screen.Cursor := crHourGlass;
      DMALM.wModo := 'M';
      sCIA := MantFields.FieldByName('CIAID').AsString;
      sLOC := MantFields.FieldByName('LOCID').AsString;
      sALM := MantFields.FieldByName('ALMID').AsString;
      sNIS := MantFields.FieldByName('NISAID').AsString;
      sTDO := MantFields.FieldByName('TDAID').AsString;
      sTIP := MantFields.FieldByName('NISATIP').AsString;
      xSQL := ' Select * '
         + '  from LOG314 '
         + ' where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
         + '   and LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString)
         + '   and TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
         + '   and ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString)
         + '   and NISATIP=' + QuotedStr(MantFields.FieldByName('NISATIP').AsString)
         + '   and NISAID=' + QuotedStr(MantFields.FieldByName('NISAID').AsString);
      DMALM.cdsNIS.Close;
      DMALM.cdsNIS.DataRequest(xSQL);
      DMALM.cdsNIS.Open;
      xSQL := 'Select * '
         + '  from LOG315 '
         + ' where NISATIP=''SALIDA'' '
         + '   and NISAID=' + QuotedStr(DMALM.cdsNIS.FieldByName('NISAID').AsString)
         + '   and CIAID =' + QuotedStr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
         + '   and LOCID =' + QuotedStr(DMALM.cdsNIS.FieldByName('LOCID').AsString)
         + '   and TINID =' + QuotedStr(DMALM.cdsNIS.FieldByName('TINID').AsString)
         + '   and ALMID =' + QuotedStr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
         + '   and TDAID =' + QuotedStr(DMALM.cdsNIS.FieldByName('TDAID').AsString)
         + ' order by KDXID';
      DMALM.cdsKDX.Close;
      DMALM.cdsKDX.DataRequest(xSQL);
      DMALM.cdsKDX.Open;

      FRegNtaSAL := TFRegNtaSAL.create(Application);
      FRegNtaSAL.xCCosto := 1;

      FRegNtaSAL.dblcCIA.Enabled := False;
      FRegNtaSAL.dblcLOC.Enabled := False;
      FRegNtaSAL.dblcTInv.Enabled := False;
      FRegNtaSAL.dblcdCC.Enabled := False;
      FRegNtaSAL.dbdtpFNS.Enabled := False;
      FRegNtaSAL.dblcTALM.Enabled := False;
      FRegNtaSAL.dblcTDA.Enabled := False;
      FRegNtaSAL.dblcTransac.Enabled := False;
      FRegNtaSAL.dbeNumNISA.Enabled := False;
      sSQL := 'Select * from TGE208 where TRISGT=''S'' ';
      DMALM.cdsTRAN.Close;
      DMALM.cdsTRAN.DataRequest(sSQL);
      DMALM.cdsTRAN.Open;
      xSQL := 'Select * '
         + '  from LOG315 '
         + ' where NISATIP=''SALIDA'' '
         + '   and NISAID=' + QuotedStr(MantFields.FieldByName('NISAID').AsString)
         + '   and CIAID =' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
         + '   and LOCID =' + QuotedStr(MantFields.FieldByName('LOCID').AsString)
         + '   and TINID =' + QuotedStr(MantFields.FieldByName('TINID').AsString)
         + '   and ALMID =' + QuotedStr(MantFields.FieldByName('ALMID').AsString)
         + '   and TDAID =' + QuotedStr(MantFields.FieldByName('TDAID').AsString)
         + ' order by KDXID';
      DMALM.cdsKDX.Close;
      DMALM.cdsKDX.DataRequest(xSQL);
      DMALM.cdsKDX.Open;
      FRegNtaSAL.Edita;
      DMALM.cdsNIS.Edit;
      FRegNtaSAL.wOperacion := 'MOD';
      FRegNtaSAL.wRegraNro := '1MOD';
      Screen.Cursor := crDefault;
   Finally
      FRegNtaSAL.ActiveMDIChild;
   End;
End;

Procedure TFINConsultas.OnEditDetMovxArt(Sender: TObject; MantFields: TFields);
Var
   sSQL, sWhere, sTit: String;
Begin
   If Not DMALM.DCOM1.Connected Then Exit;

   If mtx4001.FMant.cds2.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;
   Screen.Cursor := crHourGlass;
   sSQL := 'Select * '
      + '  from (select * '
      + '          from LOG315 A '
      + '         where A.CCOSID=' + QuotedStr(MantFields.FieldByName('CCOSID').AsString)
      + '           and A.NISAFREG>=' + QuotedStr(formatdatetime(DMALM.wFormatFecha, FToolCCosto.dtpDesde.DateTime))
      + '           and A.NISAFREG<=' + QuotedStr(formatdatetime(DMALM.wFormatFecha, FToolCCosto.dtpHasta.DateTime))
      + '           and A.CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '           and A.LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString)
      + '           and A.TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
      + '           and A.ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString)
      + '           and A.ARTID=' + QuotedStr(MantFields.FieldByName('ARTID').AsString)
      + '         order by A.CIAID, A.LOCID, A.TINID, A.ALMID, A.CCOSID) SOLVISTA';

   sWhere := 'ARTID=' + QuotedStr(MantFields.FieldByName('ARTID').AsString)
      + ' AND CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString);
   sTit := DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES', sWhere, 'ARTDES');
   Mtx4002 := TMant.Create(Application);
   Try
      Mtx4002.Admin := DMALM.wAdmin;
      Mtx4002.User := DMALM.wUsuario;
      Mtx4002.ClientDataSet := DMALM.cdsNIS;
      Mtx4002.DComC := DMALM.DCom1;
      Mtx4002.FileNameIni := '\oaALM.INI';
      Mtx4002.Filter := '';
      Mtx4002.Module := DMALM.wModulo;
      Mtx4002.SectionName := 'DetCosArt';
      Mtx4002.TableName := 'VWALMDETCOSART';
      Mtx4002.Titulo := 'Artículo: ' + Trim(sTit);
      Mtx4002.OnCreateMant := Nil;
      Mtx4002.OnEdit := Nil;
      Mtx4002.OnInsert := Nil;
      Mtx4002.OnDelete := Nil;
      Mtx4002.OnShow := FINConsultas.PGridShow;
      Mtx4002.UsuarioSQL.Add(sSQL);
      Mtx4002.NoVisible.Clear;
      Mtx4002.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4002.Execute;
   Finally
   End;
End;

/////////////////////////////////////////////////
// CONSUMO POR ARTICULOS
/////////////////////////////////////////////////

Procedure INConsumoxArticulos;
Var
   FIni: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020406') then Exit;
// Fin HPC_201701_ALM

   Screen.Cursor := crHourGlass;
   FToolArtCCosto := TFToolArtCCosto.Create(Application);
   DecodeDate(DateS, Y, M, D);
   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

   FIni := '01/' + IntToStr(M) + '/' + IntToStr(Y);
   FToolArtCCosto.dtpDesde.Date := StrToDate(FIni);

// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   Mtx4000 := TMant.Create(Application);
   Try
      Mtx4000.Admin := DMALM.wAdmin;
      Mtx4000.User := DMALM.wUsuario;
      Mtx4000.DComC := DMALM.DCOM1;
      Mtx4000.Module := DMALM.wModulo;
      Mtx4000.Titulo := 'Consumo por Artículos';
      Mtx4000.Filter := '';
      Mtx4000.ClientDataSet := DMALM.cdsArti;
      Mtx4000.OnEdit := FINConsultas.OnEditArtCCosto;
      Mtx4000.OnInsert := Nil;
      Mtx4000.OnDelete := Nil;
      Mtx4000.OnShow := FINConsultas.PGridShow;
      Mtx4000.OnCreateMant := FINConsultas.PegaPanelToolArtCCosto;
      Mtx4000.SectionName := 'ARTCCosto';
      Mtx4000.TableName := 'TGE205';
      Mtx4000.FileNameIni := '\oaALM.INI';
      Mtx4000.NoVisible.Clear;
      Mtx4000.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4000.Execute;
// Fin HPC_201605_ALM

   Finally
   End;
End;

Procedure TFINConsultas.PegaPanelToolArtCCosto(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolArtCCosto.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pl.AutoSize := True;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFINConsultas.OnEditArtCCosto(Sender: TObject;
   MantFields: TFields);
Var
   sSQL: String;
Begin
// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   If mtx4000.FMant.cds2.RecordCount = 0 Then
// Fin HPC_201605_ALM

   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;
   Screen.Cursor := crHourGlass;
   sSQL := 'Select A.CIAID, A.LOCID, A.TINID, A.ALMID, A.CCOSID, A.ARTID, COUNT(*) CONTA, '
      + '       SUM(KDXPEDIDOG) CANTG, '
      + '       SUM(KDXPEDIDOG * ARTPCG) VALG, '
      + '       SUM(KDXPEDIDOU) CANTU, '
      + '       SUM(KDXPEDIDOU * ARTPCU) VALU, B.CCOSDES '
      + '  from LOG315 A, TGE203 B '
      + ' where A.ARTID=' + QuotedStr(MantFields.FieldByName('ARTID').AsString)
      + '   and A.NISAFDOC>=' + QuotedStr(formatdatetime(DMALM.wFormatFecha, FToolArtCCosto.dtpDesde.DateTime))
      + '   and A.NISAFDOC<=' + QuotedStr(formatdatetime(DMALM.wFormatFecha, FToolArtCCosto.dtpHasta.DateTime))
      + '   and A.CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '   and A.TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
      + '   and A.NISATIP =''SALIDA'' '
      + '   and A.CCOSID = B.CCOSID(+) '
      + ' group by A.CIAID, A.LOCID, A.TINID, A.ALMID, A.CCOSID, A.ARTID, B.CCOSDES '
      + ' order by A.CIAID, A.LOCID, A.TINID, A.ALMID, A.CCOSID, A.ARTID';
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(sSQL);
   DMALM.cdsSQL.Open;
   If DMALM.cdsSQL.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ErrorMsg(Caption, ' No Existe Data para el Rango de Fecha Seleccionado ');
      Exit;
   End;
   Mtx4001 := TMant.Create(Application);
   Try
      Mtx4001.Admin := DMALM.wAdmin;
      Mtx4001.User := DMALM.wUsuario;
      Mtx4001.ClientDataSet := DMALM.cdsNIS;
      Mtx4001.DComC := DMALM.DCom1;
      Mtx4001.FileNameIni := '\oaALM.INI';
      Mtx4001.Filter := '';
      Mtx4001.Module := DMALM.wModulo;
      Mtx4001.SectionName := 'ARTCCosto';
      Mtx4001.TableName := 'VWALMARTCCOSTO';
      Mtx4001.Titulo := 'Consumo de ' + MantFields.FieldByName('ARTDES').AsString;
      Mtx4001.OnCreateMant := Nil;
      Mtx4001.OnEdit := FINConsultas.OnEditArtCCostoDet;
      Mtx4001.OnInsert := Nil;
      Mtx4001.OnDelete := Nil;
      Mtx4001.OnShow := FINConsultas.PGridShow;
      Mtx4001.UsuarioSQL.Add(sSQL);
      Mtx4001.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx4001.Execute;
   Finally
   End;
End;

Procedure TFINConsultas.OnEditArtCCostoDet(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   If Not DMALM.DCOM1.Connected Then Exit;

   If mtx4001.FMant.cds2.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;
   Screen.Cursor := crHourGlass;
   sSQL := 'Select * '
      + '  from LOG315 A '
      + ' where A.ARTID=' + QuotedStr(MantFields.FieldByName('ARTID').AsString)
      + '   and A.NISAFDOC>=' + QuotedStr(formatdatetime(DMALM.wFormatFecha, FToolArtCCosto.dtpDesde.DateTime))
      + '   and A.NISAFDOC<=' + QuotedStr(formatdatetime(DMALM.wFormatFecha, FToolArtCCosto.dtpHasta.DateTime))
      + '   and A.CCOSID=' + QuotedStr(MantFields.FieldByName('CCOSID').AsString)
      + '   and A.CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '   and A.TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
      + '   and A.NISATIP =''SALIDA'' '
      + ' order by A.CIAID, A.LOCID, A.TINID, A.ALMID, A.CCOSID, A.ARTID';

   Mtx4002 := TMant.Create(Application);
   Try
      Mtx4002.Admin := DMALM.wAdmin;
      Mtx4002.User := DMALM.wUsuario;
      Mtx4002.ClientDataSet := DMALM.cdsPeriodo; //DMALM.cdsDetMovCco;
      Mtx4002.DComC := DMALM.DCom1;
      Mtx4002.FileNameIni := '\oaALM.INI';
      Mtx4002.Filter := '';
      Mtx4002.Module := DMALM.wModulo;
      Mtx4002.SectionName := 'ARTCCostoD';
      Mtx4002.TableName := 'VWALMARTCCOSTOD';
      Mtx4002.Titulo := 'C. de Costo ' + MantFields.FieldByName('CCOSDES').AsString;
      Mtx4002.OnCreateMant := Nil;
      Mtx4002.OnEdit := Nil;
      Mtx4002.OnInsert := Nil;
      Mtx4002.OnDelete := Nil;
      Mtx4002.OnShow := FINConsultas.PGridShow;
      Mtx4002.UsuarioSQL.Add(sSQL);
      Mtx4002.NoVisible.Clear;
      Mtx4002.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4002.Execute;
   Finally
   End;
End;

/////////////////////////////////////////////////
// CONSUMO POR AÑOS
/////////////////////////////////////////////////

Procedure INConsumoxAnos;
Var
   sSQL: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020407') then Exit;
// Fin HPC_201701_ALM

   Screen.Cursor := crHourGlass;
   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

   FiltraTabla(DMALM.cdsGArti, 'TGE131', 'GRARID', 'GRARID');
   FiltraTabla(DMALM.cdsLOC, 'TGE126', 'LOCID', 'LOCID');
   FiltraTabla(DMALM.cdsTINID, 'TGE152', 'TINID', 'TINID');

   FToolConAnno := TFToolConAnno.Create(Application);
   DecodeDate(DateS, Y, M, D);
   sSQL := 'Select ARTID ARTICULO, ' // Código Articulo
      + '       ARTDES DESCRIPCION, ' // Descrip. Articulo
      + '       UNMIDG, '
      + '       UNMGDES U_MEDIDA, ' // UMed
      + '       UNMIDU, UNMUDES, '
      + '       SUM(ENE) ENE, SUM(FEB) FEB, '
      + '       SUM(MAR) MAR, SUM(ABR) ABR, '
      + '       SUM(MAY) MAY, SUM(JUN) JUN, '
      + '       SUM(JUL) JUL, SUM(AGO) AGO, '
      + '       SUM(SEPT) SEPT, SUM(OCT) OCT, '
      + '       SUM(NOV) NOV, SUM(DIC) DIC, '
      + '       0 ANO_4, 0 ANO_3, 0 ANO_2, 0 ANO_1 '
      + '  from (Select ARTID, ARTDES, UNMIDG, UG.UNMDES UNMGDES, UNMIDU, UU.UNMDES UNMUDES, '
      + '               case when KDXMM=''01'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end ENE, '
      + '               case when KDXMM=''02'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end FEB, '
      + '               case when KDXMM=''03'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end MAR, '
      + '               case when KDXMM=''04'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end ABR, '
      + '               case when KDXMM=''05'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end MAY, '
      + '               case when KDXMM=''06'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end JUN, '
      + '               case when KDXMM=''07'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end JUL, '
      + '               case when KDXMM=''08'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end AGO, '
      + '               case when KDXMM=''09'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end SEPT, '
      + '               case when KDXMM=''10'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end OCT, '
      + '               case when KDXMM=''11'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end NOV, '
      + '               case when KDXMM=''12'' then SUM(KDXCNTG*ARTCONT+KDXCNTU) else 0 end DIC '
      + '          from LOG315, TGE130 UU, TGE130 UG '
      + '         where CIAID=''oker'' '
      + '           and NISATIP=''SALIDA'' '
      + '           and KDXANO=' + quotedStr(IntToStr(Y))
      + '           and LOG315.UNMIDU=UU.UNMID(+) '
      + '           and LOG315.UNMIDG=UG.UNMID(+) '
      + '         group by ARTID, ARTDES, UNMIDG, UG.UNMDES, UNMIDU, UU.UNMDES, KDXMM) X '
      + ' group by ARTID, ARTDES, UNMIDG, UNMGDES, UNMIDU, UNMUDES';

// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   Mtx4000 := TMant.Create(Application);
   Try
      Mtx4000.Admin := DMALM.wAdmin;
      Mtx4000.User := DMALM.wUsuario;
      Mtx4000.DComC := DMALM.DCOM1;
      Mtx4000.Module := DMALM.wModulo;
      Mtx4000.TituloFont.Size := 16;
      Mtx4000.Titulo := 'Consumo de Articulos por Mes';
      Mtx4000.Filter := '';
      Mtx4000.ClientDataSet := DMALM.cdsKdx;
      Mtx4000.OnEdit := FINConsultas.OnEditaConsumo;
      Mtx4000.OnInsert := Nil;
      Mtx4000.OnDelete := Nil;
      Mtx4000.OnShow := Nil;
      Mtx4000.OnCreateMant := FINConsultas.PegaPanelToolAnno;
      Mtx4000.SectionName := 'ConsumoMes';
      Mtx4000.TableName := 'VWALMDETCONMES';
      Mtx4000.FileNameIni := '\oaALM.INI';
      Mtx4000.UsuarioSQL.Add(sSQL);
      Mtx4000.NoVisible.Clear;
      Mtx4000.NoVisible.Add('UNMIDG');
      Mtx4000.NoVisible.Add('UNMIDU');
      Mtx4000.NoVisible.Add('UNMUDES');
      Mtx4000.NoVisible.Add('ANO_4');
      Mtx4000.NoVisible.Add('ANO_3');
      Mtx4000.NoVisible.Add('ANO_2');
      Mtx4000.NoVisible.Add('ANO_1');
      Mtx4000.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4000.Execute;
// Fin HPC_201605_ALM

   Finally
   End;
End;

Procedure TFINConsultas.PegaPanelToolAnno(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolConAnno.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pl.AutoSize := True;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFINConsultas.OnEditaConsumo(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   If mtx4000.FMant.cds2.RecordCount = 0 Then
// Fin HPC_201605_ALM

      Raise Exception.Create('No existen Registros a mostrar');

   Screen.Cursor := crHourGlass;
   DecodeDate(DateS, Y, M, D);

   If FToolConAnno.rgPeriodo.ItemIndex = 0 Then //Anual
   Begin
      sSQL := ' Select 0 ENE, 0 FEB, 0 MAR, 0 ABR, 0 MAY, 0 JUN, '
         + '        0 JUL, 0 AGO, 0 SEPT, 0 OCT, 0 NOV, 0 DIC, '
         + '        ARTID, ARTDES, X.ALMID ALMACEN, A.ALMDES DESCRIPCION, '
         + '        SUM(A1) ANOACT,' //A' + IntToStr(Y) + ', '
         + '        SUM(A2) ANO_3,' //A' + IntToStr(Y - 1) + ', '
         + '        SUM(A3) ANO_2,' //A' + IntToStr(Y - 2) + ', '
         + '        SUM(A4) ANO_1 ' //+ IntToStr(Y - 3)
         + '   from (SELECT CIAID, LOCID, TINID, ARTID, ARTDES, ALMID, '
         + '                CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y))
         + '                     THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A1, '
         + '                CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y - 1))
         + '                     THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A2, '
         + '                CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y - 2))
         + '                     THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A3, '
         + '                CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y - 3))
         + '                     THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A4 '
         + '           FROM LOG315 '
         + '          WHERE KDXANO<=' + quotedStr(IntToStr(Y))
         + '            AND KDXANO>=' + quotedStr(IntToStr(Y - 3))
         + FToolConAnno.sWhere
         + '            AND ARTID=' + quotedStr(MantFields.FieldByName('ARTICULO').AsString)
         + '          GROUP BY CIAID,LOCID,TINID,ARTID,ARTDES,ALMID,KDXANO) X, TGE151 A '
         + '  where A.LOCID(+)=X.LOCID AND A.TINID(+)=X.TINID AND A.ALMID(+)=X.ALMID '
         + '    and A.CIAID(+)=X.CIAID '
         + '  group BY ARTID,ARTDES,X.ALMID,A.ALMDES ';
   End
   Else //Mensual
   Begin
      sSQL := ' Select 0 ANOACT,' //A' + IntToStr(Y) + ', '
         + '        0 ANO_3,' //A' + IntToStr(Y - 1) + ', '
         + '        0 ANO_2,' //A' + IntToStr(Y - 2) + ', '
         + '        0 ANO_1,' //A' + IntToStr(Y - 3) + ', '
         + '        ARTID, ARTDES, X.ALMID ALMACEN, A.ALMDES DESCRIPCION, '
         + '        sum(ENE) ENE,   sum(FEB) FEB, sum(MAR) MAR, sum(ABR) ABR, '
         + '        sum(MAY) MAY,   sum(JUN) JUN, sum(JUL) JUL, sum(AGO) AGO, '
         + '        sum(SEPT) SEPT, sum(OCT) OCT, sum(NOV) NOV, sum(DIC) DIC '
         + '   from (Select CIAID, LOCID, TINID, ARTID, ARTDES, ALMID, '
         + '                case when KDXMM=''01'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end ENE, '
         + '                case when KDXMM=''02'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end FEB, '
         + '                case when KDXMM=''03'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end MAR, '
         + '                case when KDXMM=''04'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end ABR, '
         + '                case when KDXMM=''05'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end MAY, '
         + '                case when KDXMM=''06'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end JUN, '
         + '                case when KDXMM=''07'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end JUL, '
         + '                case when KDXMM=''08'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end AGO, '
         + '                case when KDXMM=''09'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end SEPT, '
         + '                case when KDXMM=''10'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end OCT, '
         + '                case when KDXMM=''11'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end NOV, '
         + '                case when KDXMM=''12'' then sum(KDXCNTG*ARTCONT+KDXCNTU) else 0 end DIC '
         + '           from LOG315 '
         + '          where KDXANO=' + quotedStr(IntToStr(Y))
         + '            and ARTID=' + quotedStr(MantFields.FieldByName('ARTICULO').AsString)
         + FToolConAnno.sWhere
         + '         group by CIAID, LOCID, TINID, ARTID, ARTDES, ALMID, KDXMM) X, '
         + '       TGE151 A '
         + '  where (A.CIAID(+)=X.CIAID AND A.LOCID(+)=X.LOCID AND A.TINID(+)=X.TINID '
         + '    and A.ALMID(+)=X.ALMID) '
         + '  group by ARTID, ARTDES, X.ALMID, A.ALMDES ';
   End;

   Mtx4001 := TMant.Create(Application);
   Try

      Mtx4001.NoVisible.Clear;
      If FToolConAnno.rgPeriodo.ItemIndex = 0 Then
      Begin
         Mtx4001.NoVisible.Add('ENE');
         Mtx4001.NoVisible.Add('FEB');
         Mtx4001.NoVisible.Add('MAR');
         Mtx4001.NoVisible.Add('ABR');
         Mtx4001.NoVisible.Add('MAY');
         Mtx4001.NoVisible.Add('JUN');
         Mtx4001.NoVisible.Add('JUL');
         Mtx4001.NoVisible.Add('AGO');
         Mtx4001.NoVisible.Add('SEPT');
         Mtx4001.NoVisible.Add('OCT');
         Mtx4001.NoVisible.Add('NOV');
         Mtx4001.NoVisible.Add('DIC');
         Mtx4001.NoVisible.Add('ARTID');
         Mtx4001.NoVisible.Add('ARTDES');
      End
      Else
      Begin
         {
         Mtx4001.NoVisible.Add('A' + IntToStr(Y));
         Mtx4001.NoVisible.Add('A' + IntToStr(Y - 1));
         Mtx4001.NoVisible.Add('A' + IntToStr(Y - 2));
         Mtx4001.NoVisible.Add('A' + IntToStr(Y - 3));
         }
         Mtx4001.NoVisible.Add('ANOACT');
         Mtx4001.NoVisible.Add('ANO_3');
         Mtx4001.NoVisible.Add('ANO_2');
         Mtx4001.NoVisible.Add('ANO_1');
         Mtx4001.NoVisible.Add('ARTID');
         Mtx4001.NoVisible.Add('ARTDES');
      End;

      Mtx4001.Admin := DMALM.wAdmin;
      Mtx4001.User := DMALM.wUsuario;
      Mtx4001.DComC := DMALM.DCOM1;
      Mtx4001.Module := DMALM.wModulo;
      Mtx4001.TituloFont.Size := 16;
      Mtx4001.Titulo := MantFields.FieldByName('DESCRIPCION').AsString;
      Mtx4001.Filter := '';
      Mtx4001.ClientDataSet := DMALM.cdsSQL;
      Mtx4001.OnEdit := FINConsultas.OnEditaTotal;
      Mtx4001.OnInsert := Nil;
      Mtx4001.OnDelete := Nil;
      Mtx4001.OnShow := Nil;
      Mtx4001.OnCreateMant := Nil;
      Mtx4001.SectionName := 'ConsumoAlm';
      Mtx4001.TableName := 'VWALMDETCONALM';
      Mtx4001.FileNameIni := '\oaALM.INI';
      Mtx4001.UsuarioSQL.Add(sSQL);
      Mtx4001.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4001.Execute;
   Finally
   End;

End;

Procedure TFINConsultas.OnEditaTotal(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   If Not DMALM.DCOM1.Connected Then Exit;

   If mtx4001.FMant.cds2.RecordCount = 0 Then
      Raise Exception.Create('No existen Registros a mostrar');

   Screen.Cursor := crHourGlass;
   sSQL := ' Select LOG315.CIAID, C.CIADES, ARTID, ARTDES, LOG315.ALMID, A.ALMDES, KDXMM, '
      + '        M.MESDESL MES, '
      + '        case when KDXANO=' + quotedSTR(IntToStr(Y))
      + '             then SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A' + IntToStr(Y) + ', '
      + '        case when KDXANO=' + quotedSTR(IntToStr(Y - 1))
      + '             then SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A' + IntToStr(Y - 1) + ', '
      + '        case when KDXANO=' + quotedSTR(IntToStr(Y - 2))
      + '             then SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A' + IntToStr(Y - 2) + ', '
      + '        case when KDXANO=' + quotedSTR(IntToStr(Y - 3))
      + '             then SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A' + IntToStr(Y - 3)
      + '   from LOG315,TGE181 M,TGE101 C,TGE151 A '
      + '  where LOG315.KDXMM=M.MESIDR(+) AND LOG315.CIAID=C.CIAID(+) '
      + '    and LOG315.CIAID=A.CIAID(+) AND LOG315.LOCID=A.LOCID(+)  '
      + '    and LOG315.TINID=A.TINID(+)  AND LOG315.ALMID=A.ALMID(+) '
      + FToolConAnno.sWhere
      + '    and KDXANO<=' + quotedStr(IntToStr(Y))
      + '    and KDXANO>=' + quotedStr(IntToStr(Y - 3))
// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
      + '    and ARTID=' + quotedStr(mtx4000.FMant.cds2.FieldByName('ARTICULO').AsString)
      + '    and LOG315.ALMID=' + quotedStr(mtx4001.FMant.cds2.FieldByName('ALMACEN').AsString)
      + '  group by LOG315.CIAID, C.CIADES, ARTID, ARTDES, LOG315.ALMID, A.ALMDES, '
      + '           KDXMM, KDXANO, M.MESDESL ';

   Mtx4002 := TMant.Create(Application);
   Try
      Mtx4002.Admin := DMALM.wAdmin;
      Mtx4002.User := DMALM.wUsuario;
      Mtx4002.DComC := DMALM.DCOM1;
      Mtx4002.Module := DMALM.wModulo;
      Mtx4002.TituloFont.Size := 16;
      Mtx4002.Titulo := mtx4000.FMant.cds2.FieldByName('DESCRIPCION').AsString + ' en Almacén '
         + mtx4001.FMant.cds2.FieldByName('ALMACEN').AsString;
      Mtx4002.Filter := '';
      Mtx4002.ClientDataSet := DMALM.cdsSQL1;
      Mtx4002.OnEdit := Nil;
      Mtx4002.OnInsert := Nil;
      Mtx4002.OnDelete := Nil;
      Mtx4002.OnShow := Nil;
      Mtx4002.OnCreateMant := Nil;
      Mtx4002.SectionName := 'ConsumoTot';
      Mtx4002.TableName := 'VWALMDETCONTOT';
      Mtx4002.FileNameIni := '\oaALM.INI';
      Mtx4002.NoVisible.Clear;
      Mtx4002.NoVisible.Add('ARTID');
      Mtx4002.NoVisible.Add('ARTDES');
      Mtx4002.NoVisible.Add('ALMID');
      Mtx4002.NoVisible.Add('ALMDES');
      Mtx4002.NoVisible.Add('CIAID');
      Mtx4002.NoVisible.Add('CIADES');
      Mtx4002.NoVisible.Add('KDXMM');
      Mtx4002.UsuarioSQL.Add(sSQL);
      Mtx4002.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4002.Execute;
// Fin HPC_201605_ALM

   Finally
      Screen.Cursor := crDefault;
   End;
End;

/////////////////////////////////////////////////
// ORDEN DE DESPACHO
/////////////////////////////////////////////////

Procedure INOrdenDespacho;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   ShowMessage('Esta opción se encuentra deshabilitada, ya no hay Requisiciones');
   Exit;
   {
// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020408') then Exit;
// Fin HPC_201701_ALM

   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

   Screen.Cursor := crHourGlass;
   Try
      FAlmacen := TFAlmacen.Create(Application);
      FToolAlm := TFToolAlm.Create(Application);
      FToolAlm.Visible := False;

// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
      Mtx4000 := TMant.Create(Application);
      Mtx4000.DComC := DMALM.DCOM1;
      Mtx4000.Admin := DMALM.wAdmin;
      Mtx4000.User := DMALM.wUsuario;
      Mtx4000.Module := DMALM.wModulo;
      Mtx4000.Titulo := 'Orden de Despacho (Ped. x Atender)';
      Mtx4000.TableName := 'FAC301'; //'VWFACALMACEN';
      Mtx4000.OnCreateMant := FINConsultas.ToolAlmCreate;
      Mtx4000.ClientDataSet := DMALM.cdsKdx;
      Mtx4000.OnInsert := Nil;
      Mtx4000.OnEdit := FINConsultas.AlmacenEdita;
      Mtx4000.OnDelete := Nil;
      Mtx4000.OnShow := FINConsultas.PGridShow;
      Mtx4000.Filter := 'PEDSIT=''PENDIENTE'' AND PEDESTADO=''ALMACEN''';
      Mtx4000.MultiSelect := True;
      Mtx4000.SectionName := 'LogAlmacen';
      Mtx4000.FileNameIni := '\oaAlm.ini';
      Mtx4000.Colors.Add('PEDIDO;clRed;clWhite;;;PEDIMP%>%0%;');
      Mtx4000.NoVisible.Clear;
      Mtx4000.NoVisible.Add('PEDMTOMO');
      Mtx4000.NoVisible.Add('PEDIGVMO');
      Mtx4000.NoVisible.Add('PEDDCTOMO');
      Mtx4000.NoVisible.Add('PEDTOTMO');
      Mtx4000.NoVisible.Add('PEDTCAM');
      Mtx4000.NoVisible.Add('TMONID');
      Mtx4000.NoVisible.Add('CONDPID');
      Mtx4000.NoVisible.Add('ESTVENTAS');
      Mtx4000.NoVisible.Add('ESTALM');
      Mtx4000.NoVisible.Add('ESTDESP');
      Mtx4000.NoVisible.Add('ESTGUIA');
      Mtx4000.NoVisible.Add('ESTFACT');
      Mtx4000.NoVisible.Clear;
      Mtx4000.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4000.Execute;
// Fin HPC_201605_ALM

   Finally
   End;
   }
End;

(*
Procedure TFINConsultas.ToolAlmCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolAlm.pnGLt;
   pl := TMant(Sender).FMant.pnlBtns;

   pl.AutoSize := True;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;
*)

(*
Procedure TFINConsultas.AlmacenEdita(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   If Not DMALM.DCOM1.Connected Then Exit;
   DMALM.wModo := 'M';
// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   If mtx4000.FMant.cds2.RecordCount = 0 Then
// Fin HPC_201605_ALM

      exit;
   If FtoolAlm.rgSeleccion.ItemIndex = 0 Then
   Begin //Por Pedido
      sSQL := 'SELECT * FROM FAC302 WHERE PEDIDO=' + quotedstr(MantFields.fieldbyname('PEDIDO').AsString);
   End
   Else
      If FtoolAlm.rgSeleccion.ItemIndex = 1 Then
      Begin //Por Articulo
         sSQL := 'SELECT * FROM FAC302 WHERE ARTID=' + quotedstr(MantFields.fieldbyname('ARTID').AsString)
      End;
   DMALM.cdsDetFac.IndexFieldNames := '';
   DMALM.cdsDetFac.Close;
   DMALM.cdsDetFac.DataRequest(sSQL);
   DMALM.cdsDetFac.Open;
   If DMALM.cdsDetFac.RecordCount = 0 Then
      Exit;
   Screen.Cursor := crHourGlass;
   DMALM.cdsDetFac.IndexFieldNames := 'PEDIDO;ARTID';
   sSQL := ' Select FAC302.PEDFECHA, FAC302.DPEDITEM, FAC302.CIAID, FAC302.PEDIDO, '
      + '        FAC302.DPEDFREG, FAC302.GRARID, FAC302.ARTID, FAC302.ARTDES, '
      + '        FAC302.UNMIDO, FAC302.DPEDSALDO, FAC302.DPEDCANTAC, FAC302.CIAID, '
      + '        FAC302.CLIEID, TGE204.CLIEDES, DPEDESTADO, '
      + '        (NVL(LOG316.STKSACTG,0)-NVL(LOG316.STKRACTG,0)) STKSACTG, '
      + '        FAC302.DPEDCANTXA, FAC302.DPEDCANTRE, DPEDSIT '
      + '   from FAC302, TGE204, LOG316 '
      + '  where (DPEDSIT=''PENDIENTE''  AND DPEDESTADO=''ALMACEN'') AND DPEDARTIAN=''N'' '
// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
      + '    and PEDIDO=' + quotedstr(Mtx4000.FMant.cds2.fieldbyname('PEDIDO').AsString)
// Fin HPC_201605_ALM
      + '    and DPEDCANTXA>0 '
      + '    and FAC302.CIAID=TGE204.CIAID AND FAC302.CLIEID=TGE204.CLIEID '
      + '    and FAC302.CIAID=LOG316.CIAID AND FAC302.ALMID=LOG316.ALMID '
      + '    and FAC302.ARTID=LOG316.ARTID ORDER BY DPEDITEM';
   DMALM.cdsQry4.close;
   DMALM.cdsQry4.DataRequest(sSQL);
   DMALM.cdsQry4.Open;
 {if DMALM.cdsQry4.RecordCount = 0 then
 begin
  ErrorMsg(Caption, 'No Existe Información a Mostrar ')
  Exit;
 end;}
   Screen.Cursor := crDefault;
   FAlmacen.ActiveMDIChild;
End;
*)

/////////////////////////////////////////////////
// ARTICULO POR LOTE
/////////////////////////////////////////////////

Procedure INArticuloxLote;
Var
   sSQL: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   ShowMessage('Esta opción se encuentra deshabilitada, ya no hay Requisiciones');
   Exit;
   (*
// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020409') then Exit;
// Fin HPC_201701_ALM

   DMALM.cdsReporte.Close;
   FToolLote := TFToolLote.Create(Application);

   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

   sSQL := ' SELECT * '
      + '   FROM (SELECT ''XXX'' ARTID,''XXX'' ARTDES,''XXX'' CIADES, NISALOTE, NISAFEXP, '
      + '                SUM(INGRESO) INGRESO, SUM(EGRESO) EGRESO, SUM(SALDO) SALDO '
      + '           FROM (SELECT C5.CIAID, C5.LOCID, C5.TINID, C5.ALMID, C5.TDAID, C5.NISAID, '
      + '                        C5.NISATIP, C5.GRARID, C5.FAMID, C5.SFAMID, C5.ARTID, '
      + '                        C4.NISALOTE, C4.NISAFEXP, '
      + '                        CASE WHEN C5.NISATIP=''INGRESO'' '
      + '                             THEN C5.KDXCNTG ELSE 0 END INGRESO, '
      + '                        CASE WHEN C5.NISATIP=''SALIDA'' '
      + '                             THEN C5.KDXCNTG ELSE 0 END EGRESO, '
      + '                        CASE WHEN C5.NISATIP=''INGRESO'' '
      + '                             THEN C5.KDXCNTG ELSE 0 END '
      + '                      - CASE WHEN C5.NISATIP=''SALIDA'' '
      + '                             THEN C5.KDXCNTG ELSE 0 END SALDO '
      + '                   FROM LOG315 C5,LOG314 C4 '
      + '                  WHERE C5.CIAID=C4.CIAID(+) AND C5.LOCID=C4.LOCID(+) '
      + '                    AND C5.TINID=C4.TINID(+) AND C5.ALMID=C4.ALMID(+) '
      + '                    AND C5.TDAID=C4.TDAID(+) AND C5.NISAID=C4.NISAID(+) '
      + '                    AND C5.NISATIP=C4.NISATIP(+) AND C5.CIAID=''A'' '
      + '                    AND C5.CIAID=''B'' ) X '
      + '          GROUP BY NISALOTE, NISAFEXP) SOLVISTA';

// Inicio HPC_201605_ALM
// Se agrega nueva variable modulo Mtx4000
   Mtx4000 := TMant.Create(Application);
   Try
      Mtx4000.Admin := DMALM.wAdmin;
      Mtx4000.ClientDataSet := DMALM.cdsReporte;
      Mtx4000.DComC := DMALM.DCom1;
      Mtx4000.FileNameIni := '\oaALM.INI';
      Mtx4000.Filter := '';
      Mtx4000.Module := DMALM.wModulo;
      Mtx4000.SectionName := 'ALMLote';
      Mtx4000.TableName := 'VWALMCONARTLOC';
      Mtx4000.Titulo := 'Consulta x Lote';
      Mtx4000.User := DMALM.wUsuario;
      Mtx4000.OnCreateMant := FINConsultas.PegaPanelToolLote;
      Mtx4000.OnEdit := Nil;
      Mtx4000.OnInsert := Nil;
      Mtx4000.OnDelete := Nil;
      Mtx4000.OnShow := Nil;
      Mtx4000.Colors.Add('NISAFEXP;clRed;clWhite;fsbold;;NISAFEXP%<=%' + DateToStr(date) + '%;');
      Mtx4000.UsuarioSQL.Add(sSQL);
      Mtx4000.NoVisible.Clear;
      Mtx4000.OnCierra := DMALM.DisminuyeForma;
      Mtx4000.Execute;
// Fin HPC_201605_ALM

   Finally
   End
   *)
End;

(*
Procedure TFINConsultas.PegaPanelToolLote(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolLote.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pl.AutoSize := True;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;
*)

Procedure TFINConsultas.MueveMouse(xObjeto: TObject; Shift: TShiftState; X,
   Y: Integer);
Var
   xComponente: String;
   xForma: TForm;
Begin
   xForma := Screen.ActiveForm;
   xComponente := xForma.Name;

   If xObjeto Is TForm Then
   Else
   Begin
      xComponente := xComponente + '.' + TControl(xObjeto).Name;
      DMALM.wObjetoForma := xForma.Name;
      DMALM.wObjetoNombr := TControl(xObjeto).Name;
      If Copy(DMALM.wObjetoNombr, 2, 1) = '2' Then
         DMALM.wObjetoDescr := DMALM.wObjetoDesPr + ' - ' + TControl(xObjeto).Hint
      Else
      Begin
         DMALM.wObjetoDescr := TControl(xObjeto).Hint;
      End;
   End;
End;

Procedure INConsumoAnualCCos;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020410') then Exit;
// Fin HPC_201701_ALM

   FConsumoAnualCCos := TFConsumoAnualCCos.Create(Application);
   Try
// ALM440 FConsumoAnualCCos, Consulta Anual por Centros de Costo
      FConsumoAnualCCos.ActiveMDIChild;
   Finally
   End;
End;

Procedure INMovimientoArticulos;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020411') then Exit;
// Fin HPC_201701_ALM

   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');
   Try
      FMovPorArticulo := TFMovPorArticulo.Create(Application);
      FMovPorArticulo.ShowModal;
   Finally
      FMovPorArticulo.Free;
   End;
End;

Procedure INMovTipoTransaccion;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020412') then Exit;
// Fin HPC_201701_ALM

   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');
   Try
      FMovTipoTransaccion := TFMovTipoTransaccion.Create(Application);
      FMovTipoTransaccion.ShowModal;
   Finally
      FMovTipoTransaccion.Free;
   End;
End;

Procedure INVerificaVersion;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   FINConsultas := TFINConsultas.Create(Application);
   If DMALM.fg_VerificaVersion(FINConsultas.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.

