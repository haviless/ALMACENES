Unit oaIN5000;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   oalN5000
// Formulario           :   FINInventarios
// Fecha de Creación    :
// Autor                :   Equipo de Desarrollo
// Objetivo             :   Contenedor de Formularios

// ACTUALIZACIONES:
// HPC_201401_ALM 19/06/2014 Cambio de Versión a 20140623083000
// HPC_201404_ALM 24/10/2014 Unificación de módulos de Inventarios
// HPC_201604_ALM 19/05/2016 Añade Control de Acceso por Grupo de Usuario
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
   TFINInventarios = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
      sInvCorr: String;
    { Public declarations }
      Procedure PGridShow(Sender: TObject);
      Procedure MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);

   // Toma de Inventario Físico
      Procedure PegaToolTomaInventario(Sender: TObject);
      Procedure InsertTomaInventario(Sender: TObject);
      Procedure DetalleTomaInventario(Sender: TObject; MantFields: TFields);
      Procedure DetalleTomaInventarioDig(Sender: TObject; MantFields: TFields);
      Procedure DeleteTomaInventario(Sender: TObject; MantFields: TFields);
      Procedure OnEditINV(Sender: TObject; MantFields: TFields);
      Procedure OnInsertTomaInventario(Sender: TObject);

   // Genera Notas de Ingreso/Salida por Inventario Físico
//      Procedure PegaPanelTool(Sender: TObject);
//      Procedure OnShowTomaInv(Sender: TObject);
   End;

Procedure INTomaInv; stdcall;
//Procedure INGeneraInv; stdcall;
Procedure INRegistroInv; stdcall;
Procedure INVerificaVersion; stdcall;

Exports
   INTomaInv,
//   INGeneraInv,
   INRegistroInv,
   INVerificaVersion;

Var
   FINInventarios: TFINInventarios;
   mtx5000, mtx5001, mtx5002, mtx5003: TMant;
   D, M, Y: Word;

Implementation

{$R *.dfm}
//Uses ALMDM1, ALM503, ALM300, ALM418, ALM313, ALM730;
Uses ALMDM1, ALM503, ALM300, ALM418, ALM313;
// ALM503 FTomaInventario - Inserta Nuevos Inventarios
// ALM300 FInventario - Captura de Datos de Inventario Físico
// ALM418 FToolTomaInventario - Botones: Imprime Toma de Inventario,
//                                       Resultado de Inventario,
//                                       Importar Toma de Inventario
// ALM313 FDetalleInventario - Inserta Nuevos artículos para el Inventario
// ALM730 FToolMant Mantenimiento de Inventario Físico

//////////////////////////////////////////////////////////
// GENERACION DE DATOS PARA TOMA DE INVENTARIO FÍSICO
//////////////////////////////////////////////////////////

Procedure INRegistroInv;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020503') then Exit;
// Fin HPC_201701_ALM

   DMALM.wTipoAdicion := 'xFiltro';

   Mtx5003 := TMant.Create(Application);
   Try
      mtx5003.Admin := DMALM.wAdmin;
      mtx5003.DComC := DMALM.DCom1;
      mtx5003.User := DMALM.wUsuario;
      mtx5003.OnCreateMant := Nil;
      mtx5003.Filter := 'TOINESTADO=''INICIAL''';
      mtx5003.ClientDataSet := DMALM.cdsCInventario;
      mtx5003.Module := DMALM.wModulo;
      mtx5003.SectionName := 'ALMTomaInventario';
      mtx5003.FileNameIni := '\oaALM.Ini';
      mtx5003.TableName := 'LOG333';
      mtx5003.Titulo := 'Toma de Inventario - Digitación';
      mtx5003.OnInsert := Nil;
      mtx5003.OnEdit := FINInventarios.DetalleTomaInventarioDig;
      mtx5003.OnDelete := Nil;
      mtx5003.OnShow := Nil;
      Mtx5003.OnCierra := DMALM.DisminuyeForma;
      mtx5003.NoVisible.Clear;
      mtx5003.Execute;
   Finally
   End;
End;

Procedure TFINInventarios.DetalleTomaInventarioDig(Sender: TObject;
   MantFields: TFields);
Var
   sSQL, cCia, cLoc, cTin, cAlm: String;
Begin
   sInvCorr := MantFields.FieldByName('TOINID').AsString;

   sSQL := 'Select * '
      + '  from LOG333 '
      + ' where CIAID=' + MantFields.FieldByName('CIAID').AsString
      + '   and LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString)
      + '   and TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
      + '   and ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString)
      + '   and TOINID=' + QuotedStr(MantFields.FieldByName('TOINID').AsString);
   DMALM.cdsCInventario.Close;
   DMALM.cdsCInventario.DataRequest(sSQL);
   DMALM.cdsCInventario.Open;

   xSQL := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   cCia := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(xSQL), 'CIADES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cLoc := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cTin := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' and '
      + 'CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ' AND ALMID=' + quotedstr(DMALM.cdsCInventario.FieldByName('ALMID').AsString);
   cAlm := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');

   sSQL := 'Select * '
      + '  from (Select C.GRARDES, D.FAMDES, E.SFAMDES, B.UNMABR, '
      + quotedstr(cCia) + ' CIADES, '
      + quotedstr(cLoc) + ' LOCDES, '
      + quotedstr(cTin) + ' TINDES, '
      + quotedstr(cAlm) + ' ALMDES, '
      + '               NVL(A.TIPART,''0000'') TIPART, '
      + '               NVL(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
      + '               NVL(T.LINCOM,''00'') LINCOM, '
      + '               NVL(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, '
      + '               K.*, '
      + '               nvl(STKSFISG,0)-nvl(STKSACTG,0) DIFERENCIA, '
      + '               A.ARTPCG, ((nvl(STKSFISG,0)-nvl(STKSACTG,0))*A.ARTPCG) VALOR '
      + '          from LOG334 K, TGE130 B, TGE131 C, TGE169 D, TGE170 E, '
      + '               TGE205 A, ALM_TIP_ART T, ALM_LIN_COM L '
      + '         where TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString)
      + '           and K.UNMIDG=B.UNMID '
      + '           and K.CIAID=C.CIAID(+) AND K.TINID=C.TINID(+) AND K.GRARID=C.GRARID(+) '
      + '           and K.CIAID=D.CIAID(+) AND K.TINID=D.TINID(+) AND K.GRARID=D.GRARID(+) '
      + '           and K.FAMID=D.FAMID(+) '
      + '           and K.CIAID=E.CIAID(+) AND K.TINID=E.TINID(+) AND K.GRARID=E.GRARID(+) '
      + '           and K.FAMID=E.FAMID(+) AND K.SFAMID=E.SFAMID(+) '
      + '           and K.CIAID=A.CIAID(+) AND K.TINID=A.TINID(+) AND K.ARTID=A.ARTID(+) '
      + '           and A.TIPART=T.TIPART(+) '
      + '           and T.LINCOM=L.LINCOM(+) '
      + '         order by K.GRARID, K.FAMID, K.MARCA, K.ARTID '
      + '        ) SOLVISTA';
   FToolTomaInventario := TFToolTomaInventario.Create(Application);
   FToolTomaInventario.Z1sbInicializaArticulos.Visible := False;
   FToolTomaInventario.Z1sbTomaInv.Visible := False;
   FToolTomaInventario.Z1sbResulInv.Visible := False;
   FToolTomaInventario.Z1sbResulInvVal.Visible := False;
   FToolTomaInventario.Z1sbStockSis.Visible := False;
   FToolTomaInventario.Z1sbDiferencias.Visible := False;
   FToolTomaInventario.Z1sbCierre.Visible := False;
   FToolTomaInventario.Z1sbRepCarga.Visible := True;

   Mtx5001 := TMant.Create(Application);
   Try
      mtx5001.Admin := DMALM.wAdmin;
      mtx5001.DComC := DMALM.DCom1;
      mtx5001.User := DMALM.wUsuario;
      mtx5001.OnCreateMant := PegaToolTomaInventario;
      mtx5001.Filter := '';
      mtx5001.UsuarioSQL.add(sSQL);
      mtx5001.ClientDataSet := DMALM.cdsDInventario;
      mtx5001.Module := DMALM.wModulo;
      mtx5001.SectionName := 'ALMDetalleTomaInventario';
      mtx5001.FileNameIni := '\oaALM.INI';
      mtx5001.TableName := 'LOG334';
      mtx5001.Titulo := 'Detalle de Toma de Inventario No.' + DMALM.cdsCInventario.FieldByName('TOINID').AsString;

      If DMALM.cdsCInventario.FieldByName('TOINESTADO').AsString = 'ACEPTADO' Then
      Begin
         mtx5001.OnEdit := Nil;
         mtx5001.OnInsert := Nil;
      End
      Else
      Begin
         mtx5001.OnEdit := FINInventarios.OnEditINV;
         mtx5001.OnInsert := FINInventarios.OnInsertTomaInventario;
      End;
      mtx5001.OnDelete := Nil;
      mtx5001.OnShow := Nil;
      mtx5001.NoVisible.Clear;
      mtx5001.Execute;
   Finally
   End;
End;

Procedure TFINInventarios.PegaToolTomaInventario(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolTomaInventario.pnl;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pl.AutoSize := True;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFINInventarios.PGridShow(Sender: TObject);
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
End;

Procedure TFINInventarios.MueveMouse(xObjeto: TObject; Shift: TShiftState; X,
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

//////////////////////////////////////////////////////////
// GENERACION DE DATOS PARA TOMA DE INVENTARIO FÍSICO
//////////////////////////////////////////////////////////

Procedure INTomaInv;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020501') then Exit;
// Fin HPC_201701_ALM

   DMALM.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx5000 := TMant.Create(Application);
   Try
      mtx5000.Admin := DMALM.wAdmin;
      mtx5000.DComC := DMALM.DCom1;
      mtx5000.User := DMALM.wUsuario;
      mtx5000.OnCreateMant := Nil; //PegaToolTomaInventario;
      mtx5000.Filter := '';
      mtx5000.ClientDataSet := DMALM.cdsCInventario;
      mtx5000.Module := DMALM.wModulo;
      mtx5000.SectionName := 'ALMTomaInventario';
      mtx5000.FileNameIni := '\oaALM.Ini';
      mtx5000.TableName := 'LOG333';
      mtx5000.Titulo := 'Toma de Inventario - Administración';
      mtx5000.OnInsert := FINInventarios.InsertTomaInventario;
      mtx5000.OnEdit := FINInventarios.DetalleTomaInventario;
      mtx5000.OnDelete := FINInventarios.DeleteTomaInventario;
      mtx5000.OnShow := Nil;
      Mtx5000.OnCierra := DMALM.DisminuyeForma;
      mtx5000.NoVisible.Clear;
      mtx5000.Execute;
   Finally
   End;
End;

Procedure TFINInventarios.InsertTomaInventario(Sender: TObject);
Var
   xSQL: String;
Begin
   DMALM.wModo := 'A';
   xSQL := 'select * from LOG333 where 1<>1';
   DMALM.cdsCInventario.Close;
   DMALM.cdsCInventario.DataRequest(xSQL);
   DMALM.cdsCInventario.Open;
   FTomaInventario := TFTomaInventario.Create(Application);
   FTomaInventario.ActiveMDIChild;
End;

Procedure TFINInventarios.DetalleTomaInventario(Sender: TObject;
   MantFields: TFields);
Var
   sSQL, cCia, cLoc, cTin, cAlm: String;
Begin
   sInvCorr := MantFields.FieldByName('TOINID').AsString;
   sSQL := 'Select * from LOG333 '
      + ' where CIAID=' + MantFields.FieldByName('CIAID').AsString
      + '   and LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString)
      + '   and TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
      + '   and ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString)
      + '   and TOINID=' + QuotedStr(MantFields.FieldByName('TOINID').AsString);
   DMALM.cdsCInventario.Close;
   DMALM.cdsCInventario.DataRequest(sSQL);
   DMALM.cdsCInventario.Open;

   sSQL := 'Select * from LOG334 '
      + ' where CIAID=' + MantFields.FieldByName('CIAID').AsString
      + '   and LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString)
      + '   and TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
      + '   and ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString)
      + '   and TOINID=' + QuotedStr(MantFields.FieldByName('TOINID').AsString);

   xSQL := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   cCia := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(xSQL), 'CIADES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cLoc := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' AND CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString);
   cTin := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'LOCID=' + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ' AND TINID=' + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ' and '
      + 'CIAID=' + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ' AND ALMID=' + quotedstr(DMALM.cdsCInventario.FieldByName('ALMID').AsString);
   cAlm := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');

   sSQL := 'Select * '
      + '  from (Select C.GRARDES, D.FAMDES, E.SFAMDES, B.UNMABR, '
      + quotedstr(cCia) + ' CIADES, '
      + quotedstr(cLoc) + ' LOCDES, '
      + quotedstr(cTin) + ' TINDES, '
      + quotedstr(cAlm) + ' ALMDES, '
      + '               NVL(A.TIPART,''0000'') TIPART, '
      + '               NVL(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
      + '               NVL(T.LINCOM,''00'') LINCOM, '
      + '               NVL(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, '
      + '               K.*, '
      + '               nvl(STKSFISG,0)-nvl(STKSACTG,0) DIFERENCIA, '
      + '               A.ARTPCG, '
      + '               ((nvl(STKSFISG,0)-nvl(STKSACTG,0))*A.ARTPCG) VALOR '
      + '          from LOG334 K, TGE130 B, TGE131 C, TGE169 D, TGE170 E, TGE205 A, '
      + '               ALM_TIP_ART T, ALM_LIN_COM L '
      + '         where TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString)
      + '           and K.UNMIDG=B.UNMID '
      + '           and K.CIAID=C.CIAID(+) AND K.TINID=C.TINID(+) AND K.GRARID=C.GRARID(+) '
      + '           and K.CIAID=D.CIAID(+) AND K.TINID=D.TINID(+) AND K.GRARID=D.GRARID(+) '
      + '           and K.FAMID=D.FAMID(+) '
      + '           and K.CIAID=E.CIAID(+) AND K.TINID=E.TINID(+) AND K.GRARID=E.GRARID(+) '
      + '           and K.FAMID=E.FAMID(+) AND K.SFAMID=E.SFAMID(+) '
      + '           and K.CIAID=A.CIAID(+) AND K.TINID=A.TINID(+) AND K.ARTID=A.ARTID(+) '
      + '           and A.TIPART=T.TIPART(+) '
      + '           and T.LINCOM=L.LINCOM(+) '
      + '        ) VISTA WHERE 1=1 ';
   FToolTomaInventario := TFToolTomaInventario.Create(Application);
   FToolTomaInventario.Z1sbInicializaArticulos.Visible := True;
   FToolTomaInventario.Z1sbTomaInv.Visible := True;
   FToolTomaInventario.Z1sbResulInv.Visible := True;
   FToolTomaInventario.Z1sbResulInvVal.Visible := True;
   FToolTomaInventario.Z1sbRepCarga.Visible := False;

   Mtx5001 := TMant.Create(Application);
   Try
      mtx5001.Admin := DMALM.wAdmin;
      mtx5001.DComC := DMALM.DCom1;
      mtx5001.User := DMALM.wUsuario;
      mtx5001.OnCreateMant := PegaToolTomaInventario;
      mtx5001.Filter := '';
      mtx5001.UsuarioSQL.add(sSQL);
      mtx5001.ClientDataSet := DMALM.cdsDInventario;
      mtx5001.Module := DMALM.wModulo;
      mtx5001.SectionName := 'ALMDetalleTomaInventario';
      mtx5001.FileNameIni := '\oaALM.INI';
      mtx5001.TableName := 'LOG334';
      mtx5001.Titulo := 'Detalle de Toma de Inventario No.' + DMALM.cdsCInventario.FieldByName('TOINID').AsString;
      If DMALM.cdsCInventario.FieldByName('TOINESTADO').AsString = 'ACEPTADO' Then
      Begin
         mtx5001.OnEdit := Nil;
         mtx5001.OnInsert := Nil;
      End
      Else
      Begin
         mtx5001.OnEdit := FINInventarios.OnEditINV;
         mtx5001.OnInsert := FINInventarios.OnInsertTomaInventario;
      End;
      mtx5001.OnDelete := Nil;
      mtx5001.OnShow := Nil;
      mtx5001.NoVisible.Clear;
      mtx5001.Execute;
   Finally
   End;
End;

Procedure TFINInventarios.DeleteTomaInventario(Sender: TObject;
   MantFields: TFields);
Var
   sSQL: String;
Begin
   If Mantfields.FieldByName('TOINESTADO').AsString = 'ACEPTADO' Then
   Begin
      Raise Exception.Create('La Toma de Inventario ya está en estado ACEPTADO. No se puede Eliminar');
   End;

   sSQL := 'Select COUNT(*) TOTAL '
      + '  from LOG334 '
      + ' where TOINID=' + QuotedStr(Mantfields.FieldByName('TOINID').AsString);
   DMALM.FiltraCDS(DMALM.cdsQry, sSQL);
   If DMALM.cdsQry.FieldByName('TOTAL').AsFloat > 0 Then
   Begin
      Raise Exception.Create('La Toma de Inventario Tiene Detalle. No se puede Eliminar');
   End;

   If Question('Confirmar', 'Se Eliminará La Toma de Inventario ' + #13
      + 'Nº ' + Mantfields.FieldByName('TOINID').AsString + '  '
      + #13 + ' Desea Continuar ?') Then
   Begin
      DMALM.cdsCInventario.Delete;
      DMALM.AplicaDatos(DMALM.cdsCInventario, 'XX');
      ShowMessage('Registro Eliminado');
   End;

End;

Procedure TFINInventarios.OnEditINV(Sender: TObject; MantFields: TFields);
Var
   sARTID, sSQL: String;
   xCont: double;
Begin
   If Mtx5001.FMant.cds2.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No existen registros a editar');
      exit;
   End;
   sARTID := MantFields.FieldByName('ARTID').AsString;

   sSQL := ' Select * '
      + '   from LOG334 '
      + '  where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '    and LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString)
      + '    and TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
      + '    and ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString)
      + '    and TOINID=' + QuotedStr(MantFields.FieldByName('TOINID').AsString)
      + '    and ARTID=' + quotedstr(MantFields.FieldByName('ARTID').AsString);

   DMALM.cdsDInventario.Close;
   DMALM.cdsDInventario.DataRequest(sSQL);
   DMALM.cdsDInventario.Open;

   FInventario := TFInventario.Create(Application);
   FInventario.ActiveMDIChild;
End;

Procedure TFINInventarios.OnInsertTomaInventario(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'Select * from LOG334 where 1<>1 ';
   DMALM.cdsDInventario.Close;
   DMALM.cdsDInventario.DataRequest(sSQL);
   DMALM.cdsDInventario.Open;

   DMALM.wModo := 'A';
   DMALM.cdsDInventario.Append;

// ALM313 FDetalleInventario - Inserta Nuevos artículos para el Inventario
   FDetalleInventario := TFDetalleInventario.Create(Application);
   FDetalleInventario.ActiveMDIChild;
End;

//////////////////////////////////////////////////////////
// REGISTRO DE INVENTARIO FÍSICO
//////////////////////////////////////////////////////////
{
Procedure INGeneraInv;
Var
   sSQL: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201604_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020502') then Exit;
// Fin HPC_201604_ALM

   Screen.Cursor := crHourGlass;
   FToolMant := TFToolMant.Create(Application);
   FToolMant.Visible := False;
   DMALM.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx5000 := TMant.Create(Application);
   Try
      Mtx5000.Admin := DMALM.wAdmin;
      mtx5000.DComC := DMALM.DCom1;
      mtx5000.User := DMALM.wUsuario;
      mtx5000.OnCreateMant := FINInventarios.PegaPanelTool;
      mtx5000.Filter := '';
      mtx5000.ClientDataSet := DMALM.cdsSaldos;
      mtx5000.Module := DMALM.wModulo;
      mtx5000.SectionName := 'ALMRegTomaInventario';
      mtx5000.FileNameIni := '\oaALM.Ini';
      mtx5000.TableName := 'LOG316';
      mtx5000.Titulo := 'Inventario Físico del Almacén ';
      mtx5000.OnInsert := Nil;
      mtx5000.OnEdit := Nil;
      mtx5000.OnDelete := Nil;
      mtx5000.OnShow := FINInventarios.OnShowTomaInv;
      Mtx5000.OnCierra := DMALM.DisminuyeForma;
      mtx5000.NoVisible.Clear;
      mtx5000.Execute;
      Screen.Cursor := crDefault;
   Finally
   End;
End;
}
{
Procedure TFINInventarios.PegaPanelTool(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolMant.pnlOpciones;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pl.AutoSize := True;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;
}
{
Procedure TFINInventarios.OnShowTomaInv(Sender: TObject);
Begin
   FToolMant.dblcdTomaInv.Selected.Clear;
   FToolMant.dblcdTomaInv.Selected.Add('TOINID'#9'10'#9'Id');
   FToolMant.dblcdTomaInv.Selected.Add('TOINFEC'#9'12'#9'Fecha');
   FToolMant.dblcdTomaInv.Selected.Add('TOINOBS'#9'20'#9'Obs');
End;
}

Procedure INVerificaVersion;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   FINInventarios := TFINInventarios.Create(Application);
   If DMALM.fg_VerificaVersion(FINInventarios.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.

