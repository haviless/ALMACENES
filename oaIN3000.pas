Unit oaIN3000;
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201105_ALM
// FECHA DE MODIF.  : 19/07/2011
// DESCRIPCION      : Se agrega la funcionalidad que invoque a la
//                    ventana de generacion de guis de remisión   
//*********************************************************

// Actualizaciones:
// HPC_201306_ALM 01/09/2013 Se adiciona en la opción de salida de stock un control que verifica
//                           si existe artículos para reposición y los exporta a un Excel para ser
//                           guardado y posteriormente generar la respectiva Orden de Compra y/o Cotización,
//                           el artículo para reposición siempre se visualizara mientras no sea repuesto.
// HPC_201401_ALM 19/06/2014 Cambio de Versión a 20140623083000
// HPC_201404_ALM 15/09/2014 Se adiciona la apertura de la tabla de Proveedor
// HPC_201505_ALM 14/09/2015 Se incluye filtro de almacenes permitidos para el usuario.
// HPC_201604_ALM 19/05/2016 Añade Control de Acceso por Grupo de Usuario
// HPC_201605_ALM 04/07/2016 Se agrega estado "ELIMINADO" a notas de ingreso y notas de salida
//                           solo cuando estan en estado INICIAL. Se excluye eliminado físico.
//                           Se incluye actualización de usuario que acepta la NI/NS
// HPC_201606_ALM 02/06/2016 Se añade Opción de Revalorización por Nota de Crédito
// HPC_201606_ALM 01/08/2016 Cambio de Version a 20160801100000
// HPC_201607_ALM 08/08/2016 Cambio de Version a 20160818083000
// HPC_201608_ALM 22/09/2016 Cambio de Version a 20160923083000
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
//                           reimplementa Control de Acceso por Grupo de Usuario
// HPC_201801_ALM 03/04/2018 Cambia búsqueda de Maestro de Clientes
//
// HPC_201803_ALM 12/06/2018 Se adiciona la Compañia 21 Fondo Editorial al Filtro

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, ExtCtrls, StdCtrls, Buttons, Wwdbigrd, Grids, DBGrids, MsgDlgs;

Type
   TFRegistros = Class(TForm)
      lblVersion: TLabel;
      DTGDATA: TDBGrid;
   Private
    { Private declarations }
   Public
    { Public declarations }
   // Inicio HPC_201801_ALM
   // Cambia búsqueda de Maestro de Clientes
      MtxBuscaCli: TMant;
   // Fin HPC_201801_ALM

   // Notas de Ingreso ALM203 - FRegNtaE
      Procedure OnInsertNIA(Sender: TObject);
      Procedure OnEditNIA(Sender: TObject; MantFields: TFields);
      Procedure OnDeleteNIA(Sender: TObject; MantFields: TFields);
      Procedure PGridShow(Sender: TObject);
      Procedure MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure PegaPanelToolNIngreso(Sender: TObject);

   // Notas de Salida  ALM201IN - FRegNtaSAL
   // ALM7A0 Tool de la Nota de Salida
      Procedure OnInsertNIS(Sender: TObject);
      Procedure OnEditNIS(Sender: TObject; MantFields: TFields);
      Procedure OnDeleteNIS(Sender: TObject; MantFields: TFields);
      Procedure OnShowNIS(Sender: TObject);
      Procedure PegaToolNSal(Sender: TObject);

   // Apertura/Cierre Operativo

   // Apertura Anual

   // Requisiciones
      Procedure OnInsertRequis(Sender: TObject);
      Procedure OnEditRequis(Sender: TObject; MantFields: TFields);
      Procedure OnDeleteRequis(Sender: TObject; MantFields: TFields);
      Procedure OnShowRequis(Sender: TObject);
      Procedure PegaPanelTool(Sender: TObject);

   // Notas de Ingreso ALM203 - FRegNtaE
      Procedure OnInsertRevNCre(Sender: TObject);
      Procedure OnEditRevNCre(Sender: TObject; MantFields: TFields);
      Procedure PegaPanelToolRevNCre(Sender: TObject);
	  
   // Inicio HPC_201801_ALM
   // Cambia búsqueda de Maestro de Clientes
   // Tool de Busqueda de Cliente
      Procedure ToolBuscaCliCreate(Sender: TObject); //Asociados
   // Evento de Selección de Cliente en búsqueda (doble click)
      Procedure OnEditBuscaCli(Sender: TObject; MantFields: TFields);
   // Filtro OASIS del Maestro de Clientes
      Procedure BuscaMaeClientes;
   // Fin HPC_201801_ALM

   End;

Procedure INNotadeIngreso; stdcall;
Procedure INNotadeSalida; stdcall;
Procedure INAperturaCierre; stdcall;
Procedure INAperturaAnual; stdcall;
Procedure INRequisicion; stdcall;
Procedure INRequisicionAut; stdcall;
Procedure INProcesoSaldos; stdcall;
Procedure INGuiaRemision; stdcall;
Procedure INVerificaVersion; stdcall;
Procedure INRevalorizaNCre; stdcall;

Exports
   INNotadeIngreso,
   INNotadeSalida,
   INAperturaCierre,
   INAperturaAnual,
   INRequisicion,
   INRequisicionAut,
   INGuiaRemision,
   INProcesoSaldos,
   INVerificaVersion,
   INRevalorizaNCre;

Var
   FRegistros: TFRegistros;
   mtx3000: TMant;
   mtx3001: TMant;
   mtx4000: TMant;
   M, Y, D: word;
   xCia, xLoc, xTin, xAlm: String;
   pg: TPanel;
   xsFilterCiaUser: String;
   xsFilterAlmUser: String;

Implementation

{$R *.dfm}
Uses ALMDM1, ALM750, ALM203, ALM201IN, ALM312, ALM209,
   ALM223,
   ALM260, ALM320, ALM7A0, alm412, ALM222,
// Inicio HPC_201801_ALM
// cambio por nueva búsqueda en Maestro de Clientes
   CLIE771IN,
// Fin HPC_201801_ALM
   ALM330, ALM755;

// ALM750   Tool de la Nota de Ingreso
// ALM203   Nota de Ingreso
// ALM7A0   Tool de la Nota de Salida
// ALM201IN Nota de Salida
// ALM312   Apertura/Cierre Operativo
// ALM209   Apertura Anual
// ALM260   Requisiciones
// ALM320   Requisiciones Automáticas
// ALM222   registro de Guias de Remision
// ALM223   Tool Guía de Remisión
// ALM330   Revalorización por N/Cre
// ALM755   Tool Revalorización por N/Cre

/////////////////////////////////////////////////
// NOTAS DE INGRESO
/////////////////////////////////////////////////

Procedure INProcesoSaldos;
Var
   xSQL: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020307') then Exit;
// Fin HPC_201701_ALM

   FProcesos := TFProcesos.create(Application);
   Try
      FProcesos.ShowModal;
   Finally
      FProcesos.Free;
   End;
End;

Procedure INNotadeIngreso;
Var
   FIni, xSQL, xProv: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020301') then Exit;
// Fin HPC_201701_ALM

   FiltraTabla(DMALM.cdsCia, 'TGE101', 'CIAID', '');
   DecodeDate(date, Y, M, D);
   Screen.Cursor := crHourGlass;

   xProv := DMALM.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');
   DMALM.cdsProv.Close;
   DMALM.cdsProv.DataRequest('SELECT PROV, PROVRUC, PROVDES, PROVNOMCOM, CLAUXID FROM TGE201 WHERE CLAUXID IN (' + QuotedStr('P') + ',' + QuotedStr('H') + ') ORDER BY PROV');
   DMALM.cdsProv.FetchOnDemand := False;
   DMALM.cdsProv.PacketRecords := 20;
   DMALM.cdsProv.FetchOnDemand := True;
   DMALM.cdsProv.Open;

   xSQL := 'Select * '
      + '     from LOG318 '
      + '    where CIAID=''XX''';
   DMALM.cdsOCNIA.Filter := '';
   DMALM.cdsOCNIA.Filtered := False;
   DMALM.cdsOCNIA.IndexFieldNames := '';
   DMALM.cdsOCNIA.Close;
   DMALM.cdsOCNIA.DataRequest(xSQL);
   DMALM.cdsOCNIA.Open;

   xSQL := 'Select * '
      + '     from LOG304 '
      + '    where CIAID=''XX'' '
      + '      and TIPOADQ=''C''';
   DMALM.cdsOrdComp.Filter := '';
   DMALM.cdsOrdComp.Filtered := False;
   DMALM.cdsOrdComp.IndexFieldNames := '';
   DMALM.cdsOrdComp.Close;
   DMALM.cdsOrdComp.DataRequest(xSQL);
   DMALM.cdsOrdComp.Open;

   DMALM.cdsTDOC.Open;
   DMALM.FiltraCDS(DMALM.cdsTDNISA,
        'Select * '
      + '  from TGE157 '
      + ' where TDATIP=''INGRESO'' '
      + ' order by TDAID');
   FToolNI := TFToolNI.create(Application);

   FIni := '01/' + IntToStr(M) + '/' + IntToStr(Y);
   FToolNI.dtpDesde.Date := StrToDate(FIni);
   FToolNI.dtpHasta.Date := Date;
   FToolNI.Height := 115;
   FToolNI.Visible := False;

   DMALM.cdsClient.Filter := '';
   DMALM.cdsClient.Filtered := False;
   DMALM.cdsClient.IndexFieldNames := '';
   DMALM.cdsClient.Close;
   DMALM.cdsClient.DataRequest('SELECT CIAID,CLIEID,CLIERUC,CLIEDES FROM TGE204');
   DMALM.cdsClient.FetchOnDemand := False;
   DMALM.cdsClient.PacketRecords := 20;
   DMALM.cdsClient.FetchOnDemand := True;
   DMALM.cdsClient.Open;

// Compañía
   If Not DMALM.cdsCIA.Active Then
      FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

   xsFilterCiaUser := DMALM.FiltraCiaPorUsuario(DMALM.cdsCia);

   xsFilterAlmUser := DMALM.FiltraAlmPorUsuario(DMALM.wUsuario);

   DMALM.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   mtx3000 := TMant.Create(Application);
   Try
      mtx3000.DComC := DMALM.DCOM1;
      mtx3000.Admin := DMALM.wAdmin;
      mtx3000.Module := DMALM.wModulo;
      mtx3000.User := DMALM.wUsuario;
      mtx3000.TableName := 'LOG314';
      mtx3000.Titulo := 'Notas de Ingreso';
      mtx3000.ClientDataSet := DMALM.cdsNIA;
      mtx3000.OnEdit := FRegistros.OnEditNIA;
      mtx3000.OnInsert := FRegistros.OnInsertNIA;
      mtx3000.OnDelete := nil; //FRegistros.OnDeleteNIA;
      mtx3000.OnShow := FRegistros.PGridShow;
      mtx3000.OnCreateMant := FRegistros.PegaPanelToolNIngreso;
      mtx3000.Filter := 'LOG314.NISATIP=''INGRESO'' ';

      If xsFilterCiaUser <> '' Then
      Begin
         mtx3000.Filter := mtx3000.Filter + ' and ' + xsFilterCiaUser;
      End;

      If xsFilterAlmUser <> '' Then
      Begin
         mtx3000.Filter := mtx3000.Filter + ' and ' + xsFilterAlmUser;
      End;

      mtx3000.SectionName := 'ALMNotasIngreso';
      mtx3000.FileNameIni := '\oaALM.INI';
      mtx3000.OnCierra := DMALM.DisminuyeForma;
      If DMALM.wLote <> 'S' Then
      Begin
         mtx3000.NoVisible.Clear;
         mtx3000.NoVisible.Add('NISALOTE');
         mtx3000.NoVisible.Add('NISAFEXP');
      End;
      Screen.Cursor := crDefault;
      mtx3000.Execute;
   Finally
   End;
End;

Procedure TFRegistros.MueveMouse(xObjeto: TObject; Shift: TShiftState; X,
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

Procedure TFRegistros.OnDeleteNIA(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
   sNUM, sCIA, sALM, sTDA, sTIN, sLOC: String;
Begin
   xSQL := ' Select * '
      + '      from LOG314 '
      + '     where CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString)
      + '       and LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString)
      + '       and TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString)
      + '       and ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString)
      + '       and NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString)
      + '       and NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
   DMALM.cdsNIA.Filter := '';
   DMALM.cdsNIA.Filtered := False;
   DMALM.cdsNIA.IndexFieldNames := '';
   DMALM.cdsNIA.Close;
   DMALM.cdsNIA.DataRequest(xSQL);
   DMALM.cdsNIA.Open;

   If DMALM.cdsNIA.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No Existen Registros a Eliminar');
      exit;
   End;

   If DMALM.cdsNIA.FieldByName('NISSIT').AsString <> 'INICIAL' Then
   Begin
      Information(Caption, 'Esta Nota de Ingreso ya está Aceptada ');
      exit;
   End;

   Screen.Cursor := crHourGlass;
   sNUM := DMALM.cdsNIA.FieldByName('NISAID').AsString;
   sCIA := DMALM.cdsNIA.FieldByName('CIAID').AsString;
   sALM := DMALM.cdsNIA.FieldByName('ALMID').AsString;
   sTDA := DMALM.cdsNIA.FieldByName('TDAID').AsString;
   sTIN := DMALM.cdsNIA.FieldByName('TINID').AsString;
   sLOC := DMALM.cdsNIA.FieldByName('LOCID').AsString;

   sSQL := 'Select * '
      + '     from LOG315 '
      + '    where CIAID=' + quotedstr(sCIA)
      + '      and ALMID=' + quotedstr(sALM)
      + '      and NISATIP=' + quotedstr('INGRESO')
      + '      and TDAID=' + quotedstr(sTDA)
      + '      and LOCID=' + quotedstr(sLOC)
      + '      and NISAID=' + quotedstr(sNUM)
      + '      and TINID=' + quotedstr(sTIN);
   DMALM.cdsSQL.Filter := '';
   DMALM.cdsSQL.Filtered := False;
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(sSQL);
   DMALM.cdsSQL.Open;
   Screen.Cursor := crDefault;
   If DMALM.cdsSQL.RecordCount > 0 Then
      Information(Caption, ' Esta Nota de Ingreso Tiene Detalle ');
   If Question('Confirmar', 'Esta Seguro de Eliminar La Nota de Ingreso ' + #13 + #13 +
      'Nº ' + DMALM.cdsNIA.FieldByName('NISAID').AsString + '  ' + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;
   // Relación Orden de Compra - Versus Nota de Ingreso
      Try
         sSQL := 'Delete from LOG318 '
            + '    where CIAID=' + quotedstr(sCIA)
            + '      and ALMID=' + quotedstr(sALM)
            + '      and TDAID=' + quotedstr(sTDA)
            + '      and LOCID=' + quotedstr(sLOC)
            + '      and NISAID=' + quotedstr(sNUM)
            + '      and TINID=' + quotedstr(sTIN);
         DMALM.DCOM1.AppServer.EjecutaQry(sSQL);
      Except
      End;

      Try
         sSQL := 'Delete FROM LOG315 '
            + '    where CIAID=' + quotedstr(sCIA)
            + '      and ALMID=' + quotedstr(sALM)
            + '      and NISATIP=' + quotedstr('INGRESO')
            + '      and TDAID=' + quotedstr(sTDA)
            + '      and LOCID=' + quotedstr(sLOC)
            + '      and NISAID=' + quotedstr(sNUM)
            + '      and TINID=' + quotedstr(sTIN);
         DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      xBorrar := '1';
      DMALM.cdsNIA.Delete;
      DMALM.ControlTran(0, Nil, '');

      xBorrar := '0';
      DMALM.ActualizaFiltro(mtx3000, DMALM.cdsNIA, 'E');
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFRegistros.OnEditNIA(Sender: TObject; MantFields: TFields);
Var
   sTDO, xSQL: String;
Begin
   If mtx3000.FMant.cds2.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No existen Registros a Editar');
      exit;
   End;

   xSQL := ' Select * '
      + '      from LOG314 '
      + '     where CIAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('CIAID').AsString)
      + '       and LOCID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('LOCID').AsString)
      + '       and TINID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TINID').AsString)
      + '       and ALMID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('ALMID').AsString)
      + '       and TDAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('TDAID').AsString)
      + '       and NISATIP=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISATIP').AsString)
      + '       and NISAID=' + QuotedStr(mtx3000.FMant.cds2.FieldByName('NISAID').AsString);
   DMALM.cdsNIA.Filter := '';
   DMALM.cdsNIA.Filtered := False;
   DMALM.cdsNIA.IndexFieldNames := '';
   DMALM.cdsNIA.Close;
   DMALM.cdsNIA.DataRequest(xSQL);
   DMALM.cdsNIA.Open;

   Screen.Cursor := crHourGlass;
   sTDO := MantFields.FieldByName('TDAID').AsString;
   xSQL := 'Select * '
      + '     from TGE208 '
      + '    where TRISGT=''I'' ';
   DMALM.cdsTRAN.Filter := '';
   DMALM.cdsTRAN.Filtered := False;
   DMALM.cdsTRAN.IndexFieldNames := '';
   DMALM.cdsTRAN.Close;
   DMALM.cdsTRAN.DataRequest(xSQL);
   DMALM.cdsTRAN.Open;

   xSQL := 'Select * '
      + '     from LOG318 '
      + '    where NISAID=' + quotedstr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
      + '      and CIAID =' + quotedstr(DMALM.cdsNIA.FieldByName('CIAID').AsString)
      + '      and LOCID =' + quotedstr(DMALM.cdsNIA.FieldByName('LOCID').AsString)
      + '      and TINID =' + quotedstr(DMALM.cdsNIA.FieldByName('TINID').AsString)
      + '      and ALMID =' + quotedstr(DMALM.cdsNIA.FieldByName('ALMID').AsString)
      + '      and TDAID =' + quotedstr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
      + '    order by ODCID';
   DMALM.cdsOCNIA.Filter := '';
   DMALM.cdsOCNIA.Filtered := False;
   DMALM.cdsOCNIA.IndexFieldNames := '';
   DMALM.cdsOCNIA.Close;
   DMALM.cdsOCNIA.DataRequest(xSQL);
   DMALM.cdsOCNIA.Open;

   xSQL := 'Select * '
      + '     from LOG315 '
      + '    where NISATIP=' + quotedstr('INGRESO')
      + '      and NISAID=' + quotedstr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
      + '      and CIAID =' + quotedstr(DMALM.cdsNIA.FieldByName('CIAID').AsString)
      + '      and LOCID =' + quotedstr(DMALM.cdsNIA.FieldByName('LOCID').AsString)
      + '      and TINID =' + quotedstr(DMALM.cdsNIA.FieldByName('TINID').AsString)
      + '      and ALMID =' + quotedstr(DMALM.cdsNIA.FieldByName('ALMID').AsString)
      + '      and TDAID =' + quotedstr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
      + '    order by KDXID';
   DMALM.cdsKDX.Filter := '';
   DMALM.cdsKDX.Filtered := False;
   DMALM.cdsKDX.IndexFieldNames := '';
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(xSQL);
   DMALM.cdsKDX.Open;
   DMALM.cdsNIA.Edit;

   DMALM.wModo := 'M';
   DMALM.wTipoAdicion := 'xFiltro';

   FRegNtaE := TFRegNtaE.create(Application);

   FRegNtaE.edita;
   FRegNtaE.dblcCIA.Enabled := False;
   FRegNtaE.dblcLOC.Enabled := False;
   FRegNtaE.dblcTIN.Enabled := False;
   FRegNtaE.dblcTALM.Enabled := False;
   FRegNtaE.dbdtpFNS.Enabled := False;
   FRegNtaE.dblcTDA.Enabled := False;
   FRegNtaE.dblcTransac.Enabled := False;
   FRegNtaE.dbeNumNISA.Enabled := False;
   FRegNtaE.dblcdNSal.Enabled := False;

   FRegNtaE.wOperacion := 'MOD';
   FRegNtaE.wRegraNro := '1MOD';
   Screen.Cursor := crDefault;
   FRegNtaE.ActiveMDIChild;
End;

Procedure TFRegistros.OnInsertNIA(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select * '
      + '     from LOG314 '
      + '    where CIAID=''XXX'' ';
   DMALM.cdsNia.Filter := '';
   DMALM.cdsNia.Filtered := False;
   DMALM.cdsNia.IndexFieldNames := '';
   DMALM.cdsNia.Close;
   DMALM.cdsNia.DataRequest(xSQL);
   DMALM.cdsNia.Open;

   If DMALM.cdsNIA.State In [dsInsert, dsEdit] Then
      DMALM.cdsNIA.Cancel;

   Screen.Cursor := crHourGlass;
   xSQL := ' Select * '
      + '      from LOG315 '
      + '     where NISATIP=''NINGUNO'' ';
   DMALM.cdsKDX.Filter := '';
   DMALM.cdsKDX.Filtered := False;
   DMALM.cdsKDX.IndexFieldNames := '';
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(xSQL);
   DMALM.cdsKDX.Open;

   xCia := DMALM.cdsNia.FieldByName('CIAID').AsString;
   xLoc := DMALM.cdsNia.FieldByName('LOCID').AsString;
   xTin := DMALM.cdsNia.FieldByName('TINID').AsString;
   xAlm := DMALM.cdsNia.FieldByName('ALMID').AsString;

   DMALM.cdsNIA.Insert;

   DMALM.wModo := 'A';

   DMALM.wTipoAdicion := 'xFiltro';

   FRegNtaE := TFRegNtaE.create(Application);

   FRegNtaE.dblcCIA.Enabled := True;
   FRegNtaE.dblcLOC.Enabled := True;
   FRegNtaE.dblcTIN.Enabled := True;
   FRegNtaE.dblcTALM.Enabled := True;
   FRegNtaE.dbdtpFNS.Enabled := True;
   FRegNtaE.dblcTDA.Enabled := True;
   FRegNtaE.dblcTransac.Enabled := True;
   FRegNtaE.dbeNumNISA.Enabled := True;
   FRegNtaE.dblcdNSal.Enabled := True;
   FRegNtaE.edNOrdC.Clear;

   FRegNtaE.dbeProv.Clear;
   FRegNtaE.dblcTALM.Clear;
   FRegNtaE.wOperacion := 'ADD';
   FRegNtaE.wRegraNro := '1ADD';
   Screen.Cursor := crDefault;

   Try
      FRegNtaE.ActiveMDIChild;
   Finally
   End;
End;

Procedure TFRegistros.PegaPanelToolNIngreso(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolNI.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFRegistros.PGridShow(Sender: TObject);
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

/////////////////////////////////////////////////
// NOTAS DE SALIDA
/////////////////////////////////////////////////

Procedure INNotadeSalida;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020302') then Exit;
// Fin HPC_201701_ALM

   DMALM.AnalizaStockRepos;
   If DMALM.cdsQry5.RecordCount > 0 Then
   Begin
      Try
         ShowMessage('Existen Artículos para REPOSICIÓN....');
         FRegistros.DTGDATA.DataSource := DMALM.dsQry5;
         DMALM.HojaExcel('Reposicion', DMALM.dsQry5, FRegistros.DTGDATA);
      Except
         On Ex: Exception Do
            Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      End;
   End;

   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

   Screen.Cursor := crHourGlass;
   DMALM.AbreCierraCDS([DMALM.cdsTDOC], ['TGE110'], True);
   DMALM.FiltraCDS(DMALM.cdsTDNISA,
        'Select * '
      + '  from TGE157 '
      + ' where TDATIP=''SALIDA'' '
      + ' order by TDAID');

   If Not DMALM.cdsCIA.Active Then
      FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

   FToolNSal := TFToolNSal.create(application);

   If DMALM.cdsCIA.FieldByName('CIAID').AsString = '04' Then
   Begin
      FToolNSal.gbTransf.Visible := True;
      FToolNSal.gbPeriodo.Visible := True;
   End;
   xsFilterAlmUser := DMALM.FiltraAlmPorUsuario(DMALM.wUsuario);
   FToolNSal.dtpHasta.Date := DateS;
   FToolNSal.Height := 100;
   FToolNSal.Visible := False;

   DMALM.cdsClient.Filter := '';
   DMALM.cdsClient.Filtered := False;
   DMALM.cdsClient.IndexFieldNames := '';
   DMALM.cdsClient.Close;
   DMALM.cdsClient.DataRequest('Select CIAID,CLIEID,CLIERUC,CLIEDES from TGE204');
   DMALM.cdsClient.FetchOnDemand := False;
   DMALM.cdsClient.PacketRecords := 20;
   DMALM.cdsClient.FetchOnDemand := True;
   DMALM.cdsClient.Open;

   DMALM.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   mtx4000 := TMant.Create(application);
   Try
      mtx4000.Admin := DMALM.wAdmin;
      mtx4000.DComC := DMALM.DCOM1;
      mtx4000.Module := DMALM.wModulo;
      mtx4000.User := DMALM.wUsuario;
      mtx4000.TableName := 'LOG314';
      mtx4000.Titulo := 'Notas de Salida';
      mtx4000.ClientDataSet := DMALM.cdsNIS;
      mtx4000.OnEdit := FRegistros.OnEditNIS;
      mtx4000.OnInsert := FRegistros.OnInsertNIS;
      mtx4000.OnDelete := nil; //FRegistros.OnDeleteNIA;
      mtx4000.OnShow := FRegistros.PGridShow;
      If DMALM.wLote <> 'S' Then
      Begin
         mtx4000.NoVisible.Clear;
         mtx4000.NoVisible.Add('NISALOTE');
         mtx4000.NoVisible.Add('NISAFEXP');
      End;
      mtx4000.OnCreateMant := FRegistros.PegaToolNSal;
      mtx4000.Filter := 'LOG314.NISATIP=''SALIDA''';

      If xsFilterCiaUser <> '' Then
      Begin
         mtx4000.Filter := mtx4000.Filter + ' and ' + xsFilterCiaUser;
      End;

      If xsFilterAlmUser <> '' Then
      Begin
         mtx4000.Filter := mtx4000.Filter + ' and ' + xsFilterAlmUser;
      End;

      mtx4000.SectionName := 'ALMNotasSalida';
      mtx4000.FileNameIni := '\oaALM.INI';
      mtx4000.OnCierra := DMALM.DisminuyeForma;
      mtx4000.NoVisible.Clear;
      Screen.Cursor := crDefault;
      mtx4000.Execute;
   Finally
   End;
End;

Procedure TFRegistros.OnInsertNIS(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := ' Select * '
      + '      from LOG314 '
      + '     where 1<>1';
   DMALM.cdsNIS.Filter := '';
   DMALM.cdsNIS.Filtered := False;
   DMALM.cdsNIS.IndexFieldNames := '';
   DMALM.cdsNIS.Close;
   DMALM.cdsNIS.DataRequest(xSQL);
   DMALM.cdsNIS.Open;

   Screen.Cursor := crHourGlass;

   DMALM.wModo := 'A';
   DMALM.wTipoAdicion := 'xFiltro';

   xSQL := 'Select * '
      + '     from LOG315 '
      + '    where NISATIP='' ''';
   DMALM.cdsKDXNSal.Filter := '';
   DMALM.cdsKDXNSal.Filtered := False;
   DMALM.cdsKDXNSal.IndexFieldNames := '';
   DMALM.cdsKDXNSal.Close;
   DMALM.cdsKDXNSal.DataRequest(xSQL);
   DMALM.cdsKDXNSal.Open;

   xCia := DMALM.cdsNis.FieldByName('CIAID').AsString;
   xLoc := DMALM.cdsNis.FieldByName('LOCID').AsString;
   xTin := DMALM.cdsNis.FieldByName('TINID').AsString;
   xAlm := DMALM.cdsNis.FieldByName('ALMID').AsString;

   DMALM.cdsNIS.Insert;
   FRegNtaSAL := TFRegNtaSAL.create(application);
   FRegNtaSAL.xCCosto := 0;

   FRegNtaSAL.dblcCIA.Enabled := True;
   FRegNtaSAL.dblcLOC.Enabled := True;
   FRegNtaSAL.dblcTINV.Enabled := True;
   FRegNtaSAL.dblcdCC.Enabled := True;
   FRegNtaSAL.dbdtpFNS.Enabled := True;
   FRegNtaSAL.dblcTALM.Enabled := True;
   FRegNtaSAL.dblcTransac.Enabled := True;
   FRegNtaSAL.dbeNumNISA.Enabled := True;
   FRegNtaSAL.wOperacion := 'ADD';
   FRegNtaSAL.wRegraNro := '1ADD';
   FRegNtaSAL.Adiciona;
   Screen.Cursor := crDefault;
   FRegNtaSAL.ActiveMDIChild;
End;

Procedure TFRegistros.OnEditNIS(Sender: TObject; MantFields: TFields);
Var
   xSQL, sCIA, sLOC, sALM, sNIS, sTDO, sSQL, sTIP: String;
   xprov: String;
Begin
   xSQL := ' Select * '
      + '      from LOG314 '
      + '     where CIAID=' + quotedstr(mtx4000.fmant.cds2.fieldbyname('CIAID').asstring)
      + '       and LOCID=' + quotedstr(mtx4000.fmant.cds2.fieldbyname('LOCID').asstring)
      + '       and TINID=' + quotedstr(mtx4000.fmant.cds2.fieldbyname('TINID').asstring)
      + '       and ALMID=' + quotedstr(mtx4000.fmant.cds2.fieldbyname('ALMID').asstring)
      + '       and NISATIP=' + quotedstr(mtx4000.fmant.cds2.fieldbyname('NISATIP').asstring)
      + '       and TDAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TDAID').AsString)
      + '       and NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
   DMALM.cdsNIS.Filter := '';
   DMALM.cdsNIS.Filtered := False;
   DMALM.cdsNIS.IndexFieldNames := '';
   DMALM.cdsNIS.Close;
   DMALM.cdsNIS.DataRequest(xSQL);
   DMALM.cdsNIS.Open;

   If DMALM.cdsNIS.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No Existen Registros a Editar');
      exit;
   End;

   Try
      Screen.Cursor := crHourGlass;

      DMALM.wModo := 'M';
      DMALM.wTipoAdicion := 'xFiltro';

      sCIA := MantFields.FieldByName('CIAID').AsString;
      sLOC := MantFields.FieldByName('LOCID').AsString;
      sALM := MantFields.FieldByName('ALMID').AsString;
      sNIS := MantFields.FieldByName('NISAID').AsString;
      sTDO := MantFields.FieldByName('TDAID').AsString;
      sTIP := MantFields.FieldByName('NISATIP').AsString;

      sSQL := 'Select * from TGE208 WHERE TRISGT=''S''';
      DMALM.cdsTRAN.Filter := '';
      DMALM.cdsTRAN.Filtered := False;
      DMALM.cdsTRAN.IndexFieldNames := '';
      DMALM.cdsTRAN.Close;
      DMALM.cdsTRAN.DataRequest(sSQL);
      DMALM.cdsTRAN.Open;
      xSQL := 'Select * '
         + '  from LOG315 '
         + ' where NISATIP=''SALIDA'' '
         + '   and NISAID=''' + DMALM.cdsNIS.FieldByName('NISAID').AsString + ''' '
         + '   and CIAID =''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' '
         + '   and LOCID =''' + DMALM.cdsNIS.FieldByName('LOCID').AsString + ''' '
         + '   and TINID =''' + DMALM.cdsNIS.FieldByName('TINID').AsString + ''' '
         + '   and ALMID =''' + DMALM.cdsNIS.FieldByName('ALMID').AsString + ''' '
         + '   and TDAID =''' + DMALM.cdsNIS.FieldByName('TDAID').AsString + ''' '
         + ' order by KDXID';
      DMALM.cdsKDXNSal.Filter := '';
      DMALM.cdsKDXNSal.Filtered := False;
      DMALM.cdsKDXNSal.IndexFieldNames := '';
      DMALM.cdsKDXNSal.Close;
      DMALM.cdsKDXNSal.DataRequest(xSQL);
      DMALM.cdsKDXNSal.Open;
      DMALM.cdsNIS.Edit;

      xSQL := 'Select * '
         + '  from TGE126 '
         + ' where CIAID=''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' ';
      DMALM.cdsLKLOC.Close;
      DMALM.cdsLKLOC.DataRequest(xSQL);
      DMALM.cdsLKLOC.open;

      xprov := DMALM.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');
      xSQL := 'Select PROV, PROVRUC, PROVDES, PROVNOMCOM, CLAUXID '
         + '     from TGE201 '
         + '    where CLAUXID=' + QuotedStr(xprov)
         + '      and PROV =' + QuotedStr(DMALM.cdsNIS.FieldByname('PROV').AsString)
         + '    order BY PROV';
      DMALM.cdsProv.Close;
      DMALM.cdsProv.DataRequest(xSQL);
      DMALM.cdsProv.Open;
      FRegNtaSAL := TFRegNtaSAL.create(application);
      FRegNtaSAL.dblcLOCOriExit(Self);
      FRegNtaSAL.dblcTINOriExit(Self);
      FRegNtaSAL.dblcTALMOriExit(Self);
      FRegNtaSAL.Edita;
      FRegNtaSAL.xCCosto := 0;

      FRegNtaSAL.dblcCIA.Enabled := False;
      FRegNtaSAL.dblcLOC.Enabled := False;
      FRegNtaSAL.dblcTInv.Enabled := False;
      FRegNtaSAL.dblcdCC.Enabled := False;
      FRegNtaSAL.dbdtpFNS.Enabled := False;
      FRegNtaSAL.dblcTALM.Enabled := False;
      FRegNtaSAL.dblcTDA.Enabled := False;
      FRegNtaSAL.dblcTransac.Enabled := False;
      FRegNtaSAL.dbeNumNISA.Enabled := False;

      FRegNtaSAL.wOperacion := 'MOD';
      FRegNtaSAL.wRegraNro := '1MOD';
      Screen.Cursor := crDefault;
   Finally
      FRegNtaSAL.ActiveMDIChild;
   End;
End;

Procedure TFRegistros.OnDeleteNIS(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
   sNUM, sCIA, sALM, sTDA, sLOC, sTIN: String;
   bCia, bLoc, bTin, bAlm, bTda, bNis: String;
   xesTransferencia: Boolean;
Begin
   xSQL := ' Select * '
      + '      from LOG314 '
      + '     where CIAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('CIAID').AsString)
      + '       and LOCID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('LOCID').AsString)
      + '       and TINID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('TINID').AsString)
      + '       and ALMID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('ALMID').AsString)
      + '       and NISATIP=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISATIP').AsString)
      + '       and NISAID=' + QuotedStr(mtx4000.FMant.cds2.FieldByName('NISAID').AsString);
   DMALM.cdsNIS.Filter := '';
   DMALM.cdsNIS.Filtered := False;
   DMALM.cdsNIS.IndexFieldNames := '';
   DMALM.cdsNIS.Close;
   DMALM.cdsNIS.DataRequest(xSQL);
   DMALM.cdsNIS.Open;

   If DMALM.cdsNIS.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No existen Registros a Eliminar');
      exit;
   End;

   If DMALM.cdsNIS.FieldByName('NISSIT').AsString <> 'INICIAL' Then
   Begin
      Information(Caption, 'Esta Nota de Salida ya fue Aceptada ');
      exit;
   End;

   Screen.Cursor := crHourGlass;
   sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIS.FieldByName('TINID').AsString;
   sALM := DMALM.cdsNIS.FieldByName('ALMID').AsString;
   sTDA := DMALM.cdsNIS.FieldByName('TDAID').AsString;
   sNUM := DMALM.cdsNIS.FieldByName('NISAID').AsString;

   sSQL := 'select * from LOG315 '
      + '    where CIAID=' + quotedstr(sCIA)
      + '      and LOCID=' + quotedstr(sLOC)
      + '      and TINID=' + quotedstr(sTIN)
      + '      and ALMID=' + quotedstr(sALM)
      + '      and TDAID=' + quotedstr(sTDA)
      + '      and NISAID=' + quotedstr(sNUM)
      + '      and NISATIP=' + quotedstr('SALIDA');
   DMALM.cdsSQL.Filter := '';
   DMALM.cdsSQL.Filtered := False;
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(sSQL);
   DMALM.cdsSQL.Open;
   Screen.Cursor := crDefault;
   If DMALM.cdsSQL.RecordCount > 0 Then
      Information(Caption, ' Advertencia, esta Nota de Salida Tiene Detalle ');

   If Question('Confirmar', 'Esta Seguro de Eliminar La Nota de Salida ' + #13 + #13 +
      'Nº ' + DMALM.cdsNIS.FieldByName('NISAID').AsString + '  ' + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;
      sSQL := 'TRIID=''' + DMALM.cdsNIS.FieldByName('TRIID').AsString + '''' + ' AND TRISGT=''S''';
      DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRITMOV', sSQL, 'TRITMOV');
      xesTransferencia := (Trim(DMALM.cdsQry.FieldByName('TRITMOV').AsString) = 'T');

      If xesTransferencia Then
      Begin
         sSQL := 'CIAID=' + quotedstr(sCIA)
            + ' AND LOCORIID=' + quotedstr(sLOC)
            + ' AND TINORIID=' + quotedstr(sTIN)
            + ' AND ALMORIID=' + quotedstr(sALM)
            + ' AND TDAORIID=' + quotedstr(sTDA)
            + ' AND NISAORIID=' + quotedstr(sNUM)
            + ' AND NISATIP=' + quotedstr('INGRESO');

         DMALM.DisplayDescrip('prvTGE', 'LOG314', 'CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISSIT', sSQL, 'NISAID');

         If DMALM.cdsQry.RecordCount > 0 Then
         Begin
            Screen.Cursor := crDefault;
            Information('Eliminación Nota de Salida', 'NO ES POSIBLE ELIMINAR, la Nota de Ingreso x Transferencia ya Fue Aceptada en el otro Almacen');
            Exit;
         End;
         bCia := DMALM.cdsQry.FieldByName('CIAID').AsString;
         bLoc := DMALM.cdsQry.FieldByName('LOCID').AsString;
         bTin := DMALM.cdsQry.FieldByName('TINID').AsString;
         bAlm := DMALM.cdsQry.FieldByName('ALMID').AsString;
         bTda := DMALM.cdsQry.FieldByName('TDAID').AsString;
         bNis := DMALM.cdsQry.FieldByName('NISAID').AsString;

         Try
            sSQL := 'DELETE FROM LOG314 '
               + '    where CIAID=' + quotedstr(bCIA)
               + '      and LOCID=' + quotedstr(bLOC)
               + '      and TINID=' + quotedstr(bTIN)
               + '      and ALMID=' + quotedstr(bALM)
               + '      and TDAID=' + quotedstr(bTDA)
               + '      and NISAID=' + quotedstr(bNIS)
               + '      and NISATIP=' + quotedstr('INGRESO');
            DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except
         End;

         Try
            sSQL := 'Delete from LOG315 '
               + '    where CIAID=' + quotedstr(bCIA)
               + '      and LOCID=' + quotedstr(bLOC)
               + '      and TINID=' + quotedstr(bTIN)
               + '      and ALMID=' + quotedstr(bALM)
               + '      and TDAID=' + quotedstr(bTDA)
               + '      and NISAID=' + quotedstr(bNIS)
               + '      and NISATIP=' + quotedstr('INGRESO');
            DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except
         End;
      End;

      Try
         sSQL := 'Delete from LOG315 '
            + '    where CIAID=' + quotedstr(sCIA)
            + '      and LOCID=' + quotedstr(sLOC)
            + '      and TINID=' + quotedstr(sTIN)
            + '      and ALMID=' + quotedstr(sALM)
            + '      and TDAID=' + quotedstr(sTDA)
            + '      and NISAID=' + quotedstr(sNUM)
            + '      and NISATIP=' + quotedstr('SALIDA');
         DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      xBorrar := '1';
      DMALM.cdsNIS.Delete;
      DMALM.ControlTran(0, Nil, '');
      xBorrar := '0';
      DMALM.ActualizaFiltro(mtx4000, DMALM.cdsNIS, 'E');
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFRegistros.OnShowNIS(Sender: TObject);
Begin
//Sólo si desea ejecutar algo en nota de salida, al momento de ejecutarse
End;

Procedure TFRegistros.PegaToolNSal(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolNSal.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

///////////////////////////////////////////
// APERTURA/CIERRE OPERATIVO
///////////////////////////////////////////

Procedure INAperturaCierre;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020303') then Exit;
// Fin HPC_201701_ALM

// ALM312 Apertura/Cierre Operativo
   FApeCieOpe := TFApeCieOpe.Create(Application);
   Try
      FApeCieOpe.ActiveMDIChild;
   Finally
   End;
End;

// APERTURA ANUAL
Procedure INAperturaAnual;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020304') then Exit;
// Fin HPC_201701_ALM

   FCierreAnual := TFCierreAnual.Create(Application);
   Try
      FCierreAnual.ActiveMDIChild;
   Finally

   End;
End;

// REQUISICIONES

Procedure INRequisicion;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020305') then Exit;
// Fin HPC_201701_ALM

   Screen.Cursor := crHourGlass;
   If wActuaPresu Then
   Begin
      FiltraTabla(DMALM.cdsParPre, 'PPRES201', 'PARPRESID', 'PARPRESID');
      FiltraTabla(DMALM.cdsTipPre, 'PPRES101', 'TIPPRESID', 'TIPPRESID');
   End;
   FiltraTabla(DMALM.cdsLOC, 'TGE126', 'LOCID', 'LOCID');

   DMALM.cdsObra.Filter := '';
   DMALM.cdsObra.Filtered := False;
   DMALM.cdsObra.IndexFieldNames := '';
   DMALM.cdsObra.Close;
   DMALM.cdsObra.DataRequest('SELECT * FROM TGE213 ORDER BY OBRAID');
   DMALM.cdsObra.Open;

   FiltraTabla(DMALM.cdsTipSol, 'TGE137', 'TSCID', 'TSCID');
   DMALM.cdsTipSol.Filtered := False;
   DMALM.cdsTipSol.Filter := '';
   DMALM.cdsTipSol.Filter := 'TIPOADQ=' + quotedstr('C');
   DMALM.cdsTipSol.Filtered := True;
   FiltraTabla(DMALM.cdsPRIO, 'TGE155', 'PRIOID', 'PRIOID');

   DMALM.cdsArti.Filter := '';
   DMALM.cdsArti.Filtered := False;
   DMALM.cdsArti.IndexFieldNames := '';
   DMALM.cdsArti.Close;
   DMALM.cdsArti.DataRequest('SELECT * FROM TGE205');
   DMALM.cdsArti.FetchOnDemand := False;
   DMALM.cdsArti.PacketRecords := 50;
   DMALM.cdsArti.FetchOnDemand := True;
   DMALM.cdsArti.Open;

   FiltraTabla(DMALM.cdsUMed, 'TGE130', 'UNMID', 'UNMID');

   DMALM.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3000 := TMant.Create(Application);
   Try
      Mtx3000.Admin := DMALM.wAdmin;
      Mtx3000.User := DMALM.wUsuario;
      Mtx3000.Module := DMALM.wModulo;
      Mtx3000.TableName := 'LOG308';

      Mtx3000.TablaLlave := 'CIAID;LOCID;RQSID';

      Mtx3000.Tabla2 := 'LOG309';
      Mtx3000.Tabla2Llave := 'CIAID;LOCID;RQSID';

      Mtx3000.Titulo := 'Requisiciones';
      Mtx3000.ClientDataSet := DMALM.cdsReqs;
      Mtx3000.OnCreateMant := Nil;
      Mtx3000.DComC := DMALM.DCOM1;
      Mtx3000.OnEdit := FRegistros.OnEditRequis;
      Mtx3000.OnInsert := FRegistros.OnInsertRequis;
      Mtx3000.OnDelete := FRegistros.OnDeleteRequis;
      Mtx3000.OnShow := FRegistros.PGridShow;
      Mtx3000.SectionName := 'ALMRqs';
      Mtx3000.FileNameIni := '\oaALM.Ini';
      Mtx3000.Filter := 'TIPOADQ=''C''';
      mtx3000.OnCierra := DMALM.DisminuyeForma;
      Mtx3000.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3000.Execute;
   Finally
   End;
End;

Procedure TFRegistros.OnInsertRequis(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'Select * '
      + '     from LOG308 '
      + '    where 1<>1';
   DMALM.cdsReqs.Close;
   DMALM.cdsReqs.IndexFieldNames := '';
   DMALM.cdsReqs.Filter := '';
   DMALM.cdsReqs.Filtered := False;
   DMALM.cdsReqs.DataRequest(sSQL);
   DMALM.cdsReqs.Open;

   If DMALM.cdsReqs.State In [dsInsert, dsEdit] Then
      DMALM.cdsReqs.Cancel;

   DMALM.wModo := 'A';
   DMALM.wTipoAdicion := 'xFiltro';

   FRegReqs := TFRegReqs.Create(Application);
   FRegReqs.xValorX := '';
   FRegReqs.xReqLec := '';
   DMALM.cdsReqs.Insert;
   FRegReqs.dblcCIA.Enabled := True;
   FRegReqs.dbeNumRqs.Enabled := True;
   FRegReqs.dblcLOC.Enabled := True;
   Try
      FRegReqs.ActiveMDIChild;
   Finally

   End;
End;

Procedure TFRegistros.OnEditRequis(Sender: TObject; MantFields: TFields);
Var
   sCIA, sLOC, sRQS, sSQL: String;
Begin
   sCIA := MantFields.FieldByName('CIAID').AsString;
   sLOC := MantFields.FieldByName('LOCID').AsString;
   sRQS := MantFields.FieldByName('RQSID').AsString;

   sSQL := 'Select * from LOG308 '
      + '    where CIAID=' + quotedstr(sCIA)
      + '      and LOCID=' + quotedstr(sLOC)
      + '      and RQSID=' + quotedstr(sRQS);
   DMALM.cdsReqs.Close;
   DMALM.cdsReqs.IndexFieldNames := '';
   DMALM.cdsReqs.Filter := '';
   DMALM.cdsReqs.Filtered := False;
   DMALM.cdsReqs.DataRequest(sSQL);
   DMALM.cdsReqs.Open;

   If (DMALM.cdsReqs.RecNo <= 0) And
      (DMALM.cdsReqs.eof) Then
   Begin
      ErrorMsg('Error', 'No existen registros a editar');
      exit;
   End;

   DMALM.wModo := 'M';
   DMALM.wTipoAdicion := 'xFiltro';

   sSQL := 'Select * from LOG309 '
      + '    where CIAID=' + quotedstr(sCIA)
      + '      and LOCID=' + quotedstr(sLOC)
      + '      and RQSID=' + quotedstr(sRQS)
      + '    order by DRQSID';
   DMALM.cdsDReqs.IndexFieldNames := '';
   DMALM.cdsDReqs.Filter := '';
   DMALM.cdsDReqs.Filtered := False;
   DMALM.cdsDReqs.Close;
   DMALM.cdsDReqs.DataRequest(sSQL);
   DMALM.cdsDReqs.IndexFieldNames := 'DRQSID';
   DMALM.cdsDReqs.Open;

   FRegReqs := TFRegReqs.Create(Application);
   FRegReqs.xValorX := '';
   FRegReqs.xReqLec := '';
   FRegReqs.dblcCIA.Enabled := False;
   FRegReqs.dbeNumRqs.Enabled := False;
   FRegReqs.dblcLOC.Enabled := False;
   Try
      FRegReqs.ActiveMDIChild;
   Finally

   End;
End;

Procedure TFRegistros.OnDeleteRequis(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   sSQL := 'Select * from LOG308 '
      + '    where CIAID=' + quotedstr(MantFields.FieldByName('CIAID').AsString)
      + '      and LOCID=' + quotedstr(MantFields.FieldByName('LOCID').AsString)
      + '      and RQSID=' + quotedstr(MantFields.FieldByName('RQSID').AsString);
   DMALM.cdsReqs.Close;
   DMALM.cdsReqs.IndexFieldNames := '';
   DMALM.cdsReqs.Filter := '';
   DMALM.cdsReqs.Filtered := False;
   DMALM.cdsReqs.DataRequest(sSQL);
   DMALM.cdsReqs.Open;

   If (trim(DMALM.cdsReqs.FieldbyName('RQSEST').AsString) <> 'INICIAL') Or
      (Length(Trim(DMALM.cdsReqs.fieldbyname('RQSVISADOR').AsString)) > 0) Then
   Begin
      ErrorMsg(Caption, 'Esta Requisición ya a Sido Aceptada ó Visada, No es Posible Eliminarla');
      Exit;
   End;
   If Question('Confirmar', 'Esta Seguro de Eliminar La Requisición ' + #13 + #13 +
      DMALM.cdsReqs.FieldByName('RQSID').AsString + '  -  ' + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;

      sSQL := 'delete from LOG309 '
         + '    where CIAID=''' + DMALM.cdsReqs.FieldByName('CIAID').AsString + ''' '
         + '      and LOCID=''' + DMALM.cdsReqs.FieldByName('LOCID').AsString + ''' '
         + '      and RQSID=''' + DMALM.cdsReqs.FieldByName('RQSID').AsString + '''';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      xBorrar := '1';
      DMALM.cdsReqs.Delete;
      DMALM.ControlTran(9, DMALM.cdsReqs, 'REQS');
      xBorrar := '0';
      DMALM.ActualizaFiltro(mtx3000, DMALM.cdsReqs, 'E');
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFRegistros.OnShowRequis(Sender: TObject);
Begin
//
End;

// REQUISICIONES AUTOMATICAS
Procedure INRequisicionAut;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020306') then Exit;
// Fin HPC_201701_ALM

   Screen.Cursor := crHourGlass;
   If wActuaPresu Then
   Begin
      FiltraTabla(DMALM.cdsParPre, 'PPRES201', 'PARPRESID', 'PARPRESID');
      FiltraTabla(DMALM.cdsTipPre, 'PPRES101', 'TIPPRESID', 'TIPPRESID');
   End;
   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');
   FiltraTabla(DMALM.cdsLOC, 'TGE126', 'LOCID', 'LOCID');
   FiltraTabla(DMALM.cdsTINID, 'TGE152', 'TINID', 'TINID');
   FiltraTabla(DMALM.cdsALM, 'TGE151', 'ALMID', 'ALMID');
   FiltraTabla(DMALM.cdsTipSol, 'TGE137', 'TSCID', 'TSCID');
   FiltraTabla(DMALM.cdsTRqs, 'TGE142', 'TRQSID', 'TRQSID');
   FiltraTabla(DMALM.cdsPRIO, 'TGE155', 'PRIOID', 'PRIOID');

   xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
   DMALM.cdsCCost.IndexFieldNames := '';
   DMALM.cdsCCost.Filter := '';
   DMALM.cdsCCost.Filtered := False;
   DMALM.cdsCCost.Close;
   DMALM.cdsCCost.DataRequest(xsql);
   DMALM.cdsCCost.open;

   xsql := 'SELECT * FROM TGE142 WHERE TIPOADQ=''C''';
   DMALM.cdsTRqs.IndexFieldNames := '';
   DMALM.cdsTRqs.Filter := '';
   DMALM.cdsTRqs.Filtered := False;
   DMALM.cdsTRqs.Close;
   DMALM.cdsTRqs.DataRequest(xsql);
   DMALM.cdsTRqs.open;

   Application.Initialize;
   FRqsAuto := TFRqsAuto.Create(Application);
   Try
      FRqsAuto.ActiveMDIChild;
   Finally
   End;
End;

Procedure INGuiaRemision;
Var
   xsSql: String;
   xsCompaniaGRemision: String;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020308') then Exit;
// Fin HPC_201701_ALM
// Inicio HPC_201803_ALM
// debido a que ahora se requiere para otras compañias
   //xsCompaniaGRemision := '02';
   xsCompaniaGRemision := '(''02'',''21'')';

   If DMALM = Nil Then Exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   Screen.Cursor := crHourGlass;
   xsSql := 'SELECT A.* '
      + '      FROM (SELECT LOG_GUI_REM.*, '
      + '                  (SELECT TGE147.UBIGEODPTO '
      + '                     FROM TGE147 '
      + '                    WHERE TGE147.CODDPTO=LOG_GUI_REM.DPTOID AND ROWNUM=1) DEPARTAMENTO,'
      + '                  (SELECT TGE147.UBIGEOPROV '
      + '                     FROM TGE147 '
      + '                    WHERE TGE147.CODDPTO=LOG_GUI_REM.DPTOID '
      + '                      AND TGE147.CODPROV=LOG_GUI_REM.CIUDID AND ROWNUM=1) PROVINCIA, '
      + '                  (SELECT TGE147.UBIGEODIST '
      + '                     FROM TGE147 '
      + '                    WHERE TGE147.CODDPTO=LOG_GUI_REM.DPTOID '
      + '                      AND TGE147.CODPROV=LOG_GUI_REM.CIUDID '
      + '                      AND TGE147.CODDIST=LOG_GUI_REM.ZIPID AND ROWNUM=1) DISTRITO, '
      + '                  (SELECT TGE208.TRIDES '
      + '                     FROM TGE208 '
      + '                    WHERE LOG_GUI_REM.TRIID = TGE208.TRIID '
      + '                      AND TGE208.TRISGT = ' + QuotedStr('S') + ') TIPOTRANSACCION '
      + '              FROM LOG_GUI_REM '
      + '             WHERE LOG_GUI_REM.CIAID IN ' + xsCompaniaGRemision + ') A'
      + '     WHERE 1 = 1';
   DMALM.cdsGuiaRemision.CLose;
   DMALM.cdsGuiaRemision.DataRequest(xsSQL);
   DMALM.cdsGuiaRemision.Open;
// Fin HPC_201803_ALM
   FToolGuiaRemision := TFToolGuiaRemision.Create(Application); // ALM223.pas
   DMALM.wTipoAdicion := 'xFiltro';

   xsFilterCiaUser := DMALM.FiltraCiaPorUsuario(DMALM.cdsCia);

   DMALM.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3001 := TMant.Create(Application);
   Try
      Mtx3001.Admin := DMALM.wAdmin;
      Mtx3001.User := DMALM.wUsuario;
      Mtx3001.Module := DMALM.wModulo;
      Mtx3001.TableName := 'VWALMGUIAREMISION';
      Mtx3001.Titulo := 'Guías de Remisión';
      Mtx3001.UsuarioSQL.Add(xsSQL);
      pg := FToolGuiaRemision.pnlAct;
      Mtx3001.ClientDataSet := DMALM.cdsGuiaRemision;
      Mtx3001.DComC := DMALM.DCOM1;
      Mtx3001.OnEdit := FToolGuiaRemision.fg_EditarGuiRemision;
      Mtx3001.OnInsert := Nil;
      Mtx3001.OnCreateMant := FRegistros.PegaPanelTool;
      Mtx3001.OnDelete := Nil;
      Mtx3001.OnShow := FRegistros.PGridShow;
      Mtx3001.SectionName := 'GUIAREM';
      Mtx3001.FileNameIni := '\oaALM.ini';
      Mtx3001.Filter := xsFilterCiaUser;
      Mtx3001.OnCierra := DMALM.DisminuyeForma;
      Mtx3001.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3001.Execute;
// Inicio HPC_201803_ALM
// debido a que ahora se requiere para otras compañias
    //FToolGuiaRemision.dblcCompania.Text := xsCompaniaGRemision;
      FToolGuiaRemision.dblcCompania.Text := '02';
// Fin HPC_201803_ALM
      FToolGuiaRemision.edtcompania.text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + QuotedStr(FToolGuiaRemision.dblcCompania.Text), 'CIADES');
   Finally
   End;

End;

Procedure TFRegistros.PegaPanelTool(Sender: TObject);
Var
   pl: TPanel;
Begin
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure INVerificaVersion;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   FRegistros := TFRegistros.Create(Application);
   If DMALM.fg_VerificaVersion(FRegistros.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

// Opción de Revalorización por Nota de Crédito
Procedure INRevalorizaNCre;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201701_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020309') then Exit;
// Fin HPC_201701_ALM

   If DMALM.fg_VerificaVersion(FRegistros.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;

// Compañía
   If Not DMALM.cdsCIA.Active Then
      FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

   FToolNCre := TFToolNCre.create(Application);

   DMALM.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   mtx3000 := TMant.Create(Application);
   Try
      mtx3000.DComC := DMALM.DCOM1;
      mtx3000.Admin := DMALM.wAdmin;
      mtx3000.Module := DMALM.wModulo;
      mtx3000.User := DMALM.wUsuario;
      mtx3000.TableName := 'LOG_REVAL_CAB';
      mtx3000.Titulo := 'Revalorización por Notas de Crédito';
      mtx3000.ClientDataSet := DMALM.cdsNIA;
      mtx3000.OnInsert := FRegistros.OnInsertRevNCre;
      mtx3000.OnEdit := nil; //FRegistros.OnEditRevNCre;
      mtx3000.OnDelete := nil;
      mtx3000.OnShow := FRegistros.PGridShow;
      mtx3000.OnCreateMant := FRegistros.PegaPanelToolRevNCre;
      mtx3000.SectionName := 'ALMRevalorizNCre';
      mtx3000.FileNameIni := '\oaALM.INI';
      mtx3000.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      mtx3000.Execute;
   Finally
   End;
End;

// Revalorización por Nota de Crédito - Adición
procedure TFRegistros.OnInsertRevNCre(Sender: TObject);
begin
   DMALM.wModo := 'A';
   FRevalorizaNCre := TFRevalorizaNCre.Create(Application);
   Try
      FRevalorizaNCre.ActiveMDIChild;
   Finally
   End;
end;

// Revalorización por Nota de Crédito - Modificación
procedure TFRegistros.OnEditRevNCre(Sender: TObject; MantFields: TFields);
begin
   DMALM.wModo := 'M';
   FRevalorizaNCre := TFRevalorizaNCre.Create(Application);
   Try
      FRevalorizaNCre.ActiveMDIChild;
   Finally
   End;
end;

// Tool de Revalorización por Nota de Crédito
procedure TFRegistros.PegaPanelToolRevNCre(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolNCre.pnlToolRevNCre;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
end;

// Inicio HPC_201801_ALM
// Cambia búsqueda de Maestro de Clientes
procedure TFRegistros.BuscaMaeClientes;
begin
   FRegistros.MtxBuscaCli := TMant.Create(Application);
   FToolBuscaCli := TFToolBuscaCli.Create(Application);

   xSQL := 'Select TDOC_ID_SUNAT, NUMDOCID, TIPPERID, CLAUXID, CLIEID, CLIEDNI, CLIERUC, CLIEAPEPAT, CLIEAPEMAT, CLIENOMBRE, '
      + '          CLIENOMBRE1, CLIEDES, CLIEABR, CLIEDIR, PAISID, DPTOID, CIUDID, CLIECZIP, CLIETELF, CLIEFAX, CLIEEMAI, '
      + '          CLIEDIRLEG, CIAID, CLIESALL, CLIEREPR, CLIESALE, CLIEGARAN, CLASIFID, CLIECONTAC, CLIEGIRA, VEID, GIROID, '
      + '          CLIECOND, CLIELISPRE, VINCID, CLIECAPSOC, CLIEDIREC, CLIEGGRAL, CLIEGADM, CLIECGRAL, CLIESECECO, SECECOID, '
      + '          CONDPID, CLIECANTAT, CLIECANTPE, CLIEMPEDME, CLIEMPEDMN, CLIEMATEMN, CLIEMATEME, CLIECANTFA, CLIEMFACMN, '
      + '          CLIEMFACME, TMONID, ZONVTAID, CLIEFLAGCR, SITCLIEID, DESCLIEID, CLIECREUTI, GRUPOID, CLIECONDFE, TVTAID, '
      + '          USERID, FREG, HREG, TLISTAID, CLIEINTER, AVALNOMB, AVALDIR, AVALTEL, AVALDOC, AVALTELF, CLIECREMIN, CLIECREMAX, '
      + '          CLIECREDISP, VEIDNW, ZONVTANW, FLAGMOV, CLIECODMOD, USEID, CLIECODAUX, CIUUID, FLAGVAR, ACTIVO, FECCREA, USUCREA '
      + '     from DB2ADMIN.TGE204 '
      + '    where 1<>1';
//   FIngresoCaja.MtxBuscaCli.FMant.wTabla := 'TGE204';

   Try
      FRegistros.MtxBuscaCli.User := DMALM.wUsuario;
      FRegistros.MtxBuscaCli.Admin := DMALM.wAdmin;
      FRegistros.MtxBuscaCli.Module := DMALM.wModulo;
      FRegistros.MtxBuscaCli.DComC := DMALM.DCOM1;
      FRegistros.MtxBuscaCli.OnCreateMant := FRegistros.ToolBuscaCliCreate;
      FRegistros.MtxBuscaCli.TableName := 'TGE204';
      FRegistros.MtxBuscaCli.ClientDataSet := DMALM.cdsClient;
      FRegistros.MtxBuscaCli.Filter := '';
      FRegistros.MtxBuscaCli.Titulo := 'Maestro de Clientes';
      FRegistros.MtxBuscaCli.OnInsert := Nil;
      FRegistros.MtxBuscaCli.OnEdit := FRegistros.OnEditBuscaCli;
      FRegistros.MtxBuscaCli.OnDelete := Nil;
      FRegistros.MtxBuscaCli.OnShow := Nil;
      FRegistros.MtxBuscaCli.SectionName := 'BuscaCli';
      FRegistros.MtxBuscaCli.FileNameIni := '\oaCaja.ini';
      FRegistros.MtxBuscaCli.UsuarioSQL.Add(xSQL);
      FRegistros.MtxBuscaCli.Execute;
   Finally
   End;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambia búsqueda de Maestro de Clientes
procedure TFRegistros.OnEditBuscaCli(Sender: TObject; MantFields: TFields);
begin
   If Not DMALM.DCOM1.Connected Then Exit;
   Screen.Cursor := crHourGlass;

   FRegNtaE.dblcdClie.Text := MantFields.FieldByName('CLIEID').AsString;
   DMALM.cdsNIA.fieldbyname('CLAUXID').AsString:= MantFields.FieldByName('CLAUXID').AsString;
   DMALM.cdsNIA.FieldByName('CLIEID').AsString := MantFields.FieldByName('CLIEID').AsString;

   FRegNtaE.dbeClie.Text := MantFields.FieldByName('CLIEDES').AsString;

   TMant(Sender).FMant.Close;
   If length(FRegNtaE.dbeClie.Text)>0 then
      FRegNtaE.dblcdTDOC.SetFocus
   Else
      FRegNtaE.dblcdClieEnter(Self);

   Screen.Cursor := crDefault;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambia búsqueda de Maestro de Clientes
procedure TFRegistros.ToolBuscaCliCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolBuscaCli.pnlBot;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   TMant(Sender).FMant.pnlBtns.Visible := True;
end;
// Fin HPC_201801_ALM

End.

