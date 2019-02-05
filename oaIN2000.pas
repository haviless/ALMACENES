Unit oaIN2000;
// INICIO USO DE ESTANDARES  : 01/08/2011
// UNIDAD                    : oalN2000
// FORMULARIO                : FINMaestros
// FECHA DE CREACION         :
// AUTOR                     : EQUIPO DE DESARROLLO
// OBJETIVO                  : Contenedor de Maestro de Articulos, Maestro de Proveedors, etc.
// Actualizaciones           :
// HPC_201306_ALM            Se adiciona una opción para evaluar y emitir un listado de los artículos para reposición
// HPC_201604_ALM 19/05/2016 Añade Control de Acceso por Grupo de Usuario
// HPC_201606_ALM 01/08/2016 Cambio de Version a 20160801100000
// HPC_201607_ALM 08/08/2016 Cambio de Version a 20160818083000
// HPC_201608_ALM 22/09/2016 Cambio de Version a 20160923083000
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
//                           reimplementa Control de Acceso por Grupo de Usuario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, ExtCtrls, StdCtrls, Buttons, Grids,
   Wwdbigrd, Wwdbgrid, MsgDlgs;

Type
   TFINMaestros = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }

  // Maestro de Artículos FREGARTI - ALM270
      Procedure PegaPanelToolArti(Sender: TObject);
      Procedure OnInsertArticulo(Sender: TObject);
      Procedure OnDeleteArticulo(Sender: TObject; MantFields: TFields);
      Procedure OnEditArticulo(Sender: TObject; MantFields: TFields);
      Procedure OnShowArticulo(Sender: TObject);

  // Parámetros de Reposición FPARREPOS - ALM401
      Procedure OnEditParaRepo(Sender: TObject; MantFields: TFields);
      Procedure PegaPanelToolParaRepo(Sender: TObject);

      Procedure PGridShow(Sender: TObject);

  // Ubicación de Artículos FUBICACION - ALM402
      Procedure MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure OnEditUbicArti(Sender: TObject; MantFields: TFields);
      Procedure PegaPanelToolUbicArt(Sender: TObject);

   End;

Procedure INMaestroArticulos; stdcall;
Procedure INParametrosReposicion; stdcall;
Procedure INUbicacionArticulo; stdcall;
Procedure INVerificaVersion; stdcall;
Procedure INArticulosreponer; stdcall;

Exports
   INMaestroArticulos,
   INParametrosReposicion,
   INUbicacionArticulo,
   INVerificaVersion,
   INArticulosreponer;

Var
   FINMaestros: TFINMaestros;
   mtx2000: TMant;
   D, M, Y: Word;

Implementation

{$R *.dfm}

Uses ALMDM1, ALM270, ALM212, ALM740, ALM401, ALM720, ALM402, ALM270_REP; //, ALM403;
// ALM270,     FRegArti,            Maestro de Artículos - (Se agrego IN al nombre LOG212 para q no se cruce con Logística
// ALM212,     FToolArti,           Tool del Maestro de Artículos - FToolArti
// ALM740,     FToolParaRepo,       Tool de Parámetros de Reposición
// ALM401,     FParRepos,           Parámetros de Reposición
// ALM720,     FToolMantParRepos,   Tool Parametros de Reposición / Ubicación / Saldos Ininciales
// ALM402,     FUbicacion,          Actualización de Ubicación de Artículos
// ALM403,     FSaldosInic,         Saldios Iniciales (llamado por Ubicación de Articulos???)
// ALM270_REP  FStockReposicion     Articulos para reponer

/////////////////////////////////////
// MAESTRO DE ARTICULOS
/////////////////////////////////////

Procedure INMaestroArticulos;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020201') then Exit;
// Fin HPC_201701_ALM

   Screen.Cursor := crHourGlass;

// ALM212.pas
   FToolArti := TFToolArti.Create(Application);
   FToolArti.Visible := false;

   xSQL := 'Select CLAUXID, PROV, PROVDES from TGE201 where CLAUXID=''P'' Order by PROVDES';
   DMALM.cdsProv2.Close;
   DMALM.cdsProv2.DataRequest(xSQL);
   DMALM.cdsProv2.Open;

   DMALM.wTipoAdicion := 'xFiltro';
   Mtx2000 := TMant.Create(Application);
   Try
      Mtx2000.Admin := DMALM.wAdmin;
      Mtx2000.User := DMALM.wUsuario;
      Mtx2000.DComC := DMALM.DCOM1;
      Mtx2000.Module := DMALM.wModulo;
      Mtx2000.TableName := 'TGE205';
      Mtx2000.Titulo := 'Maestro de Artículos';
      Mtx2000.Filter := '';
      Mtx2000.ClientDataSet := DMALM.cdsArti;
      Mtx2000.OnCreateMant := FINMaestros.PegaPanelToolArti;
      Mtx2000.OnEdit := FINMaestros.OnEditArticulo;
      Mtx2000.OnInsert := FINMaestros.OnInsertArticulo;
      Mtx2000.OnDelete := FINMaestros.OnDeleteArticulo;
      Mtx2000.OnShow := FINMaestros.OnShowArticulo;
      Mtx2000.SectionName := 'ALMArticulos';
      Mtx2000.FileNameIni := '\oaALM.INI';
      Mtx2000.OnCierra := DMALM.DisminuyeForma;
      Mtx2000.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx2000.Execute;
   Finally
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFINMaestros.OnInsertArticulo(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMALM.cdsArti.State In [dsInsert, dsEdit] Then DMALM.cdsArti.Cancel;

   DMALM.wModo := 'A';

   xSQL := 'Select * '
      + '     from TGE205 '
      + '    where 1<>1 ';
   DMALM.cdsArti.Close;
   DMALM.cdsArti.IndexFieldNames := '';
   DMALM.cdsArti.Filter := '';
   DMALM.cdsArti.Filtered := False;
   DMALM.cdsArti.DataRequest(xSQL);
   DMALM.cdsArti.Open;

   FRegArti := TFRegArti.create(Application);
   FRegArti.dblcCIA.Enabled := True;
   FRegArti.dbeCodArti.Enabled := True;

   FRegArti.ActiveMDIChild;
End;

Procedure TFINMaestros.OnEditArticulo(Sender: TObject;
   MantFields: TFields);
Var
   xSQL: String;
Begin
// se ubica en registro a actualizar
   xSQL := 'Select * from TGE205 '
      + 'where CIAID=' + quotedstr(Mtx2000.FMant.cds2.fieldbyname('CIAID').AsString)
      + '  and ARTID=' + quotedStr(Mtx2000.FMant.cds2.fieldbyname('ARTID').AsString);
   DMALM.cdsArti.Close;
   DMALM.cdsArti.IndexFieldNames := '';
   DMALM.cdsArti.Filter := '';
   DMALM.cdsArti.Filtered := False;
   DMALM.cdsArti.DataRequest(xSQL);
   DMALM.cdsArti.Open;

   If (DMALM.cdsArti.Recordcount = 0) Then
   Begin
      ErrorMsg('Error', 'No existen registros que modificar');
      exit;
   End;
   DMALM.wModo := 'M';
   FRegArti := TFRegArti.create(Application);

   FRegArti.ActiveMDIChild;
End;

Procedure TFINMaestros.OnDeleteArticulo(Sender: TObject;
   MantFields: TFields);
Var
   xSQL, sSQL: String;
Begin
// Se ubica en registro a actualizar
   xSQL := 'Select * '
      + '  from TGE205 '
      + ' where CIAID=' + quotedstr(Mtx2000.FMant.cds2.fieldbyname('CIAID').AsString)
      + '   and ARTID=' + quotedStr(Mtx2000.FMant.cds2.fieldbyname('ARTID').AsString);
   DMALM.cdsArti.Close;
   DMALM.cdsArti.IndexFieldNames := '';
   DMALM.cdsArti.Filter := '';
   DMALM.cdsArti.Filtered := False;
   DMALM.cdsArti.DataRequest(xSQL);
   DMALM.cdsArti.Open;

   sSQL := 'CIAID = ''' + DMALM.cdsArti.FieldByName('CIAID').AsString + ''''
      + ' and ARTID = ''' + DMALM.cdsArti.FieldByName('ARTID').AsString + ''' ';

 //--------------------------------------- Facturación ----------------------------------------------
   DMALM.DisplayDescrip('prvTGE', 'FAC306', 'ARTID', sSQL, 'ARTID');
   If DMALM.cdsQry.RecordCount > 0 Then
   Begin
      Information('Inventarios', ' Este Artículo Tiene Movimiento en la Facturación');
      Exit;
   End;

 //--------------------------------------- Proforma de Venta  ---------------------------------------
   DMALM.DisplayDescrip('prvTGE', 'FAC312', 'ARTID', sSQL, 'ARTID');
   If DMALM.cdsQry.RecordCount > 0 Then
   Begin
      Information('Inventarios', ' Este Artículo Tiene Movimiento en la Proforma de Venta');
      Exit;
   End;

 //--------------------------------------- Requerimiento de Usuario --------------------------------
   DMALM.DisplayDescrip('prvTGE', 'LOG307', 'ARTID', sSQL, 'ARTID');
   If DMALM.cdsQry.RecordCount > 0 Then
   Begin
      Information(Caption, ' Este Artículo Tiene Movimiento en el Requerimiento de Usuarios');
      Exit;
   End;

 //--------------------------------------- Requisición ---------------------------------------------
   DMALM.DisplayDescrip('prvTGE', 'LOG309', 'ARTID', sSQL, 'ARTID');
   If DMALM.cdsQry.RecordCount > 0 Then
   Begin
      Information(Caption, ' Este Artículo Tiene Movimiento en la Requisición ');
      Exit;
   End;

 //--------------------------------------- Orden de Compra ----------------------------------------
   DMALM.DisplayDescrip('prvTGE', 'LOG305', 'ARTID', sSQL, 'ARTID');
   If DMALM.cdsQry.RecordCount > 0 Then
   Begin
      Information(Caption, ' Este Artículo Tiene Movimiento en Ordenes de Compra ');
      Exit;
   End;

 //------------------------------ Movimientos de Nota de Entrada / Salida--------------------------
   DMALM.DisplayDescrip('prvTGE', 'LOG315', 'ARTID', sSQL, 'ARTID');
   If DMALM.cdsQry.RecordCount > 0 Then
   Begin
      Information(Caption, ' Este Artículo Tiene Movimiento en la Nota de Entrada / Salida ');
      Exit;
   End;

 //--------------------------------------- Kardex --------------------------------------------------
   DMALM.DisplayDescrip('prvTGE', 'LOG316', 'ARTID', sSQL, 'ARTID');
   If DMALM.cdsQry.RecordCount > 0 Then
   Begin
      Information(Caption, ' Este Artículo Tiene Movimiento en el Kardex ');
      Exit;
   End;

   If Question('Confirmar', 'Va a Eliminar El Artículo ' + #13 + #13 +
      DMALM.cdsArti.FieldByName('ARTID').AsString + '  -  ' +
      DMALM.cdsArti.FieldByName('ARTDES').AsString + #13 +
      #13 + ' ¿Desea Continuar? ') Then
   Begin

      Screen.Cursor := crHourGlass;
    //---------------------------------------  --------------------------------------------------
      sSQL := 'Delete from TGE207 '
         + ' where ARTID = ''' + DMALM.cdsArti.FieldByName('ARTID').AsString + ''''
         + '   and CIAID = ''' + DMALM.cdsArti.FieldByName('CIAID').AsString + ''' ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;

    //---------------------------------------  --------------------------------------------------
      sSQL := 'delete from TGE206 '
         + ' where ARTID = ''' + DMALM.cdsArti.FieldByName('ARTID').AsString + ''''
         + '   and CIAID = ''' + DMALM.cdsArti.FieldByName('CIAID').AsString + ''' ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;

    //--------------------------------------- Lista de Precios ----------------------------------------
      sSQL := 'delete from FAC201 '
         + ' where ARTID = ''' + DMALM.cdsArti.FieldByName('ARTID').AsString + ''''
         + '   and CIAID = ''' + DMALM.cdsArti.FieldByName('CIAID').AsString + ''' ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      xBorrar := '1';
      DMALM.cdsArti.Delete;
      DMALM.ControlTran(9, DMALM.cdsArti, 'ARTI');
      xBorrar := '0';
      DMALM.ActualizaFiltro(Mtx2000, DMALM.cdsArti, 'E');
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFINMaestros.OnShowArticulo(Sender: TObject);
Begin
//
End;

Procedure TFINMaestros.PegaPanelToolArti(Sender: TObject);
Var
   p1: TPanel;
   pg: TPanel;
Begin
   pg := FToolArti.pnlTools;
   p1 := TMant(Sender).FMant.pnlBtns;
   p1.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   p1.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

/////////////////////////////////////
// PARAMETROS DE REPOSICION
/////////////////////////////////////

Procedure INParametrosReposicion;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020202') then Exit;
// Fin HPC_201701_ALM

   Screen.Cursor := crHourGlass;
   DMALM.cdsReporte.Close;
   FiltraTabla(DMALM.cdsCia, 'TGE101', 'CIAID', '');

   FParRepos := TFParRepos.Create(Application);
   FToolParaRepo := TFToolParaRepo.Create(Application);
   FToolParaRepo.Visible := False;

   FToolParaRepo.Spb1.Down := True;
   FToolParaRepo.SpbNor.Down := True;

   FToolParaRepo.spbParRepAut.Visible := True;

   DMALM.wTipoAdicion := 'xFiltro';
   Mtx2000 := TMant.Create(Application);
   mtx2000.UsuarioSQL.Clear;
   mtx2000.NoVisible.Clear;
   Try
      mtx2000.Admin := DMALM.wAdmin;
      mtx2000.DComC := DMALM.DCOM1;
      mtx2000.Module := DMALM.wModulo;
      mtx2000.OnCreateMant := FINMaestros.PegaPanelToolParaRepo;
      mtx2000.User := DMALM.wUsuario;
      mtx2000.TableName := 'TGE205';
      mtx2000.Titulo := 'Reposición de Consumo o Venta';
      mtx2000.ClientDataSet := DMALM.cdsArti;
      mtx2000.OnEdit := FINMaestros.OnEditParaRepo;
      mtx2000.OnInsert := Nil;
      mtx2000.OnDelete := Nil;
      mtx2000.Filter := '';
      mtx2000.GrupoCols := 0;
      mtx2000.OnShow := FINMaestros.PGridShow;
      mtx2000.Filter := '';
      Mtx2000.OnCierra := DMALM.DisminuyeForma;
      mtx2000.SectionName := 'ParamRepos';
      mtx2000.FileNameIni := '\oaALM.INI';
      Screen.Cursor := crDefault;
      mtx2000.Execute;
   Finally
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFINMaestros.OnEditParaRepo(Sender: TObject; MantFields: TFields);
Var
   sARTID: String;
Begin
   If (mtx2000.Fmant.cds2.RecNo <= 0) And
      (mtx2000.Fmant.cds2.eof) Then
   Begin
      Information(Caption, 'No Existen Registros a Editar');
      exit;
   End;

   sARTID := mtx2000.Fmant.cds2.FieldByName('ARTID').AsString;
   FToolParaRepo.Edita(sARTID);
End;

Procedure TFINMaestros.PegaPanelToolParaRepo(Sender: TObject);
Var
   cb: TPanel;
   pl: TPanel;
Begin
   cb := FToolParaRepo.pnlPRep;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := cb.Height + 5;
   cb.Parent := TMant(Sender).FMant.pnlBtns;
   cb.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;

   FToolParaRepo.dblcCIA.LookupTable := DMALM.cdsCIA;
   FToolParaRepo.dblcTIN.LookupTable := DMALM.cdsTINID;
   FToolParaRepo.dblcTALM.LookupTable := DMALM.cdsALM;
   FToolParaRepo.dblcLOC.LookupTable := DMALM.cdsLOC;
End;

////////////////////////////////////////////////////////////////
//   UBICACION DE ARTICULOS
////////////////////////////////////////////////////////////////

Procedure INUbicacionArticulo;
Var
   xSQL, xFiltro: String;
   DD, MM, YY: Word;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020203') then Exit;
// Fin HPC_201701_ALM

   decodedate(DateS, DD, MM, YY);

   xFiltro := 'STKANO=' + quotedstr(inttostr(YY));

   FiltraTabla(DMALM.cdsCia, 'TGE101', 'CIAID', '');
   Screen.Cursor := crHourGlass;
   FUbicacion := TFUbicacion.Create(Application);
   DMALM.wTipoAdicion := 'xFiltro';
   Mtx2000 := TMant.Create(Application);
   Try
      FToolMantPARREPOS := TFToolMantParRepos.Create(Application);
      FToolMantParRepos.Visible := False;
      FToolMantParRepos.Spb2.Down := True;
      FToolMantParRepos.SpbNor.Down := True;

      Mtx2000.DComC := DMALM.DCOM1;
      Mtx2000.Module := DMALM.wModulo;
      Mtx2000.OnCreateMant := FINMaestros.PegaPanelToolUbicArt;
      Mtx2000.User := DMALM.wUsuario;
      Mtx2000.TableName := 'LOG316';
      Mtx2000.Titulo := 'Asignación de Valores de Ubicación';
      Mtx2000.ClientDataSet := DMALM.cdsSaldos;
      Mtx2000.OnEdit := FINMaestros.OnEditUbicArti;
      Mtx2000.OnInsert := Nil;
      Mtx2000.OnDelete := Nil;
      Mtx2000.Filter := xFiltro;
      Mtx2000.OnShow := FINMaestros.PGridShow;
      Screen.Cursor := crDefault;
      Mtx2000.SectionName := 'ParametrosReposicion';
      Mtx2000.FileNameIni := '\oaALM.INI';
      Mtx2000.OnCierra := DMALM.DisminuyeForma;
      Mtx2000.NoVisible.Clear;
      Mtx2000.Execute;
   Finally
   End;
End;

Procedure TFINMaestros.MueveMouse(xObjeto: TObject; Shift: TShiftState; X,
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

Procedure TFINMaestros.OnEditUbicArti(Sender: TObject;
   MantFields: TFields);
Var
   sARTID: String;
Begin
   If DMALM.cdsSaldos.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No existen registros a editar');
      exit;
   End;
   sARTID := DMALM.cdsSaldos.FieldByName('ARTID').AsString;
   FToolMantParRepos.Edita(sARTID);
End;

Procedure TFINMaestros.PegaPanelToolUbicArt(Sender: TObject);
Var
   cb: Tcontrolbar;
   pl: TPanel;
Begin
   cb := FToolMantParRepos.cb1;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := cb.Height + 5;
   cb.Parent := TMant(Sender).FMant.pnlBtns;
   cb.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFINMaestros.PGridShow(Sender: TObject);
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

Procedure INVerificaVersion;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   FINMaestros := TFINMaestros.Create(Application);
   If DMALM.fg_VerificaVersion(FINMaestros.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

Procedure INArticulosreponer;
Var
   xsql: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020204') then Exit;
// Fin HPC_201701_ALM

   xsql := 'Select CODIGO '
      + '  from TGE004 '
      + ' Where NTABLA=''TGE101'' '
      + '   and USERID=' + quotedstr(DMALM.wUsuario)
      + '   and MODULOID=''ALM'' ';
   DMALM.cdsQry1.Close;
   DMALM.cdsQry1.DataRequest(xsql);
   DMALM.cdsQry1.Open;
   If DMALM.cdsQry1.Eof Then
   Begin
      ShowMessage('El USUARIO ' + Trim(DMALM.wUsuario) + ' NO TIENE ASIGNADO UNA COMPAÑIA UNICA PARA LA CONSULTA DE ARTÍCULOS DE REPOSICION');
      DMALM.cdsQry1.Close;
      DMALM.cdsQry1.IndexFieldNames := '';
      DMALM.cdsQry1.Filter := '';
      DMALM.cdsQry1.Filtered := False;
   End
   Else
   Begin
      FStockReposicion := TFStockReposicion.Create(Application);
      FStockReposicion.ActiveMDIChild;
   End;
End;

End.

