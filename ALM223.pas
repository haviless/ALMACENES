Unit ALM223;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : ALM223
//Formulario               : FToolGuiaRemision
//Fecha de Creación        : 13/08/2012
//Autor                    : Abelardo Sulca Palomino
//Objetivo                 : ToolBar de Guías de Remisión
//
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
// HPC_201803_ALM 12/06/2018 Se adiciona debido a que se ha habilitado la compañia


Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Mant, DB, Wwdbigrd, Dialogs, ExtCtrls, StdCtrls, Buttons, wwdblook,
   ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppBands, ppCache;

Type
   TFToolGuiaRemision = Class(TForm)
      pnlAct: TPanel;
      GroupBox1: TGroupBox;
      btnRptGuiaRemision: TBitBtn;
      Label1: TLabel;
      Label2: TLabel;
      dblcCompania: TwwDBLookupCombo;
      edtCompania: TEdit;
      Label3: TLabel;
      ppdbRptGuiasRemision: TppDBPipeline;
      pprRptGuiasRemision: TppReport;
      ppdRptGuiasRemision: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      btnNotaSalida: TBitBtn;
      btnTraslado: TBitBtn;
      btnReqUsuario: TBitBtn;
      btnGuiaAnulada: TBitBtn;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      Procedure btnGuiaAnuladaClick(Sender: TObject);
      Procedure btnNotaSalidaClick(Sender: TObject);
      Procedure PegaPanelTool(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure btnTrasladoClick(Sender: TObject);
      Procedure btnReqUsuarioClick(Sender: TObject);
      Procedure btnRptGuiaRemisionClick(Sender: TObject);
      Procedure fg_CerrarVentana(Sender: TObject);
      Procedure fg_DeshabilitarBotones(Sender: TObject); 
// Inicio HPC_201803_ALM
// Se adiciona un nuevo evento a la compañia
    procedure dblcCompaniaExit(Sender: TObject); 
// Fin HPC_201803_ALM
   Private
    { Private declarations }
    //Procedure fg_EditarGuiRemision;
   Public
    { Public declarations }
      Procedure fg_EditarGuiRemision(Sender: TObject; MantFields: TFields);
      Function fg_VerificaVentanasAbiertas: Boolean;
   End;

Var
   FToolGuiaRemision: TFToolGuiaRemision;
   Mtx3010: TMant;
   cFActivo: String;
   xsGuiaOrigen: String;
   cCiaGuia: String;
   xsVentanaAbierta: String;
Implementation

Uses ALM225, ALMDM1, oaIN3000, ALM220, ALM227, ALM228, ALM229;

{$R *.dfm}

Procedure TFToolGuiaRemision.btnGuiaAnuladaClick(Sender: TObject);
Var
   xsSQL: String;
Begin
   If fg_VerificaVentanasAbiertas = False Then
   Begin
      Exit;
   End;
   Try
      fg_DeshabilitarBotones(Self);
      FGuiaNumAnula := TFGuiaNumAnula.Create(Self);
      FGuiaNumAnula.lblTit1.Caption := 'Anular Número de Guía';
      FGuiaNumAnula.lblTit2.Caption := '';
      FGuiaNumAnula.lblTit3.Caption := 'Número';
      //FGuiaNumAnula.dblcompania.Text := dblcCompania.Text ;
      FGuiaNumAnula.xsGuiaRemCompania := dblcCompania.Text;
      //FGuiaNumAnula.dblcompaniaExit(Self);
      //FGuiaNumAnula.dblcompania.Enabled := False;
      FGuiaNumAnula.ShowModal;
   Finally
      FGuiaNumAnula.Free;
   End;
End;

Procedure TFToolGuiaRemision.fg_EditarGuiRemision(Sender: TObject; MantFields: TFields);
Var
   xsSql: String;
Begin

   xsSql := ' SELECT * FROM LOG_GUI_REM '
      + ' WHERE  CIAID = ' + QuotedStr(mtx3001.FMant.cds2.FieldByName('CIAID').AsString)
      + ' AND SERGUIA = ' + QuotedStr(mtx3001.FMant.cds2.FieldByName('SERGUIA').AsString)
      + ' AND NUMGUIA = ' + QuotedStr(mtx3001.FMant.cds2.FieldByName('NUMGUIA').AsString)
      + ' ORDER BY SERGUIA, NUMGUIA';

   DMALM.cdsMovCNT.Close;
   DMALM.cdsMovCNT.DataRequest(xsSql);
   DMALM.cdsMovCNT.Open;
   Try
      (*If DMALM.cdsMovCNT.FieldByName('ORIGEN').AsString='AF' Then
         cFActivo:='S'
      Else
         cFActivo:='N';  *)

      //cCiaGuia := DMALM.cdsMovCNT.FieldByName('CIAID').AsString ;
      cCiaGuia := dblcCompania.Text;
      DMALM.wModoGuia := 'M';
      FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
      FGuiaRemisionALM.xsOrigen := DMALM.cdsMovCNT.FieldByName('ORIGEN').AsString;
      //FGuiaRemisionALM:=TFGuiaRemisionALM.Create(Application);
      FGuiaRemisionALM.ShowModal;
   Finally
      FGuiaRemisionALM.Free;
   End;

End;

Procedure TFToolGuiaRemision.btnNotaSalidaClick(Sender: TObject);
Var
   xsSql: String;
Begin
   If DMALM = Nil Then Exit;
   If Not DMALM.DCOM1.Connected Then Exit;

   If fg_VerificaVentanasAbiertas = False Then
   Begin
      Exit;
   End;
   cCiaGuia := dblcCompania.Text;
   //xsCompania := dblcCompania.Text ;
   Screen.Cursor := crHourGlass;
   xsSql := 'SELECT A.* FROM ( SELECT LOG314.CIAID, ' + // COMPANIA,
      ' LOG314.LOCID, ' + // LOCALIDAD,
      ' LOG314.TINID, ' + // TIPOINVENTARIO,
      ' LOG314.ALMID, ' + // ALMACEN,
      ' LOG314.NISAID, ' + // NOTASALIDA,
      ' LOG314.CCOSID, ' + // CENTROCOSTO,
      ' LOG314.TRIID, ' + // TIPODESALIDA,
      ' (SELECT TGE208.TRIDES FROM TGE208 WHERE TGE208.TRIID = LOG314.TRIID AND TGE208.TRISGT = ' + QuotedStr('S') + ') TIPOSALIDA ,' +
      ' LOG314.NISAFREG, ' + // FECHA,
      ' LOG314.NISSIT, ' + // ESTADO,
      ' LOG314.NISANOMM, ' + // ANIOMES,
      ' LOG314.NISAOBS, ' + // OBSERVACION,
      ' LOG314.NISAUSER, ' + // USUARIO,
      ' LOG_GUI_REM.SERGUIA GUIASERIE,' +
      ' LOG_GUI_REM.NUMGUIA GUIANUMERO,' +
      ' LOG_GUI_REM.FECGUIA GUIAFECHA,' +
      ' LOG_GUI_REM.USUARIO GUIAUSUARIO,' +
      ' LOG_GUI_REM.GUIAANOMES GUIAANIOMES,' +
      ' LOG_GUI_REM.GUIAFECTRA GUIAFECTRAS,' +
      ' LOG_GUI_REM.ESTADO GUIAESTADO' +
      ' FROM LOG314 , (SELECT * FROM LOG_GUI_REM ' +
      ' WHERE LOG_GUI_REM.ORIGEN = ' + QuotedStr('NS') +
      ' AND LOG_GUI_REM.ESTADO <> ' + QuotedStr('ANULADO') + ' ) LOG_GUI_REM ' +
      ' WHERE LOG314.CIAID = LOG_GUI_REM.CIAID(+)' +
      ' AND LOG314.LOCID  = LOG_GUI_REM.LOCID(+) ' +
      ' AND LOG314.TINID = LOG_GUI_REM.TINID(+)' +
      ' AND LOG314.ALMID = LOG_GUI_REM.ALMID(+)' +
      ' AND LOG314.NISATIP = LOG_GUI_REM.NISATIP(+)' +
      ' AND LOG314.NISAID = LOG_GUI_REM.NISAID(+)' +
      ' AND LOG314.CIAID = ' + QuotedStr(cCiaGuia) +
      ' AND LOG314.NISATIP = ' + QuotedStr('SALIDA') +
      ' AND LOG314.NISSIT = ' + QuotedStr('ACEPTADO') + '  ) A' +
      ' WHERE 1 = 1 ';

   DMALM.cdsGuiaRemSalida.CLose;
   DMALM.cdsGuiaRemSalida.DataRequest(xsSQL);
   DMALM.cdsGuiaRemSalida.Open;

   FToolGuiaRemisionSalida := TFToolGuiaRemisionSalida.Create(Application); // ALM227.pas

   DMALM.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3010 := TMant.Create(Application);
   //Mtx3010 := TMant.Create(FToolGuiaRemision);
   xsVentanaAbierta := 'Notas de Salida';
   Try
      Mtx3010.Admin := DMALM.wAdmin;
      Mtx3010.User := DMALM.wUsuario;
      Mtx3010.Module := DMALM.wModulo;
      Mtx3010.OnCreateMant := Nil;
      Mtx3010.TableName := 'VWALMGUIAREMSALIDA';
      Mtx3010.Titulo := 'Guías de Remisión - Notas de Salida';
      Mtx3010.UsuarioSQL.Add(xsSQL);
      pg := FToolGuiaRemisionSalida.pnlAct;
      Mtx3010.ClientDataSet := DMALM.cdsGuiaRemSalida;
      Mtx3010.DComC := DMALM.DCOM1;
      Mtx3010.OnEdit := FToolGuiaRemisionSalida.fg_EditarGuiRemisionSalida;
      //Mtx3010.OnInsert        := FToolGuiaRemisionSalida.fg_AdicionarGuiRemision;;
      Mtx3010.OnInsert := Nil;
      Mtx3010.OnCreateMant := FToolGuiaRemision.PegaPanelTool;
      Mtx3010.OnDelete := Nil;
      Mtx3010.OnShow := fg_DeshabilitarBotones;
      Mtx3010.SectionName := 'Salida - Guia Remisión';
      Mtx3010.FileNameIni := '\oaALM.ini';
      //Mtx3010.Filter          := cFilterCiaUser;
      Mtx3010.OnCierra := fg_CerrarVentana;
      Mtx3010.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3010.Execute;
   Finally
   End;
End;

Procedure TFToolGuiaRemision.PegaPanelTool(Sender: TObject);
Var
   //pg : TPanel;
   pl: TPanel;
Begin
   //pg := FToolNI.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFToolGuiaRemision.FormCreate(Sender: TObject);
Begin

   FiltraTabla(DMALM.cdsCia, 'TGE101', 'CIAID', 'CIAID');
   dblcCompania.LookupTable := DMALM.cdsCia;
   dblcCompania.LookupField := 'CIAID';
End;

Procedure TFToolGuiaRemision.btnTrasladoClick(Sender: TObject);
Var
   xsSql: String;
Begin
   If DMALM = Nil Then Exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   If fg_VerificaVentanasAbiertas = False Then
   Begin
      Exit;
   End;
   cCiaGuia := dblcCompania.Text;
   //xsCompania := dblcCompania.Text ;
   Screen.Cursor := crHourGlass;

   xsSql := ' SELECT * FROM ( SELECT ' + QuotedStr(cCiaGuia) + ' CIAID,' +
      ' ACF320.DOCREF, ' +
      ' ACF320.NUMDOC, ' + //NUMERO TRASLADO
      ' TO_CHAR(ACF320.FECTRAS, ' + QuotedStr('YYYYMM') + ') ANIOMES, ' + //ANIOMES
      ' ACF320.FECTRAS, ' + //FECHA
      ' ACF320.MOTIVO, ' + //MOTIVO
      ' ACF320.OBSERVAC, ' + //OBSERVACION
      ' ACF320.USUARIO, ' + //USUARIO
      ' ACF320.LOCAL_D, ' + //LOCALDESTINOID
      ' ACF320.LOCDES_D, ' + //LOCALDESTINODES
      ' ACF320.ACEPTADO,  ' + //ESTADO
      ' LOG_GUI_REM.SERGUIA GUIASERIE,' +
      ' LOG_GUI_REM.NUMGUIA GUIANUMERO,' +
      ' LOG_GUI_REM.FECGUIA GUIAFECHA,' +
      ' LOG_GUI_REM.USUARIO GUIAUSUARIO,' +
      ' LOG_GUI_REM.GUIAANOMES GUIAANIOMES,' +
      ' LOG_GUI_REM.GUIAFECTRA GUIAFECTRAS,' +
      ' LOG_GUI_REM.ESTADO GUIAESTADO' +
      ' FROM ACF320, (SELECT * FROM LOG_GUI_REM ' +
      ' WHERE LOG_GUI_REM.ORIGEN = ' + QuotedStr('AF') +
      ' AND LOG_GUI_REM.ESTADO <> ' + QuotedStr('ANULADO') + ' ) LOG_GUI_REM ' +
      ' WHERE ACF320.NUMDOC = LOG_GUI_REM.NISAID(+)' +
      ' AND ACF320.ACEPTADO = ' + QuotedStr('S') + ' ) A ' +
      ' WHERE 1=1 ';

   DMALM.cdsGuiaRemTraslado.CLose;
   DMALM.cdsGuiaRemTraslado.DataRequest(xsSQL);
   DMALM.cdsGuiaRemTraslado.Open;

   FToolGuiaRemisionTraslado := TFToolGuiaRemisionTraslado.Create(Application); // ALM228.pas

   DMALM.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3010 := TMant.Create(Application);
   //Mtx3010 := TMant.Create(FToolGuiaRemision);
   xsVentanaAbierta := 'Traslados';
   Try
      Mtx3010.Admin := DMALM.wAdmin;
      Mtx3010.User := DMALM.wUsuario;
      Mtx3010.Module := DMALM.wModulo;
      Mtx3010.OnCreateMant := Nil;
      Mtx3010.TableName := 'VWALMGUIAREMTRASLADO';
      Mtx3010.Titulo := 'Guías de Remisión - Traslados AF';
      Mtx3010.UsuarioSQL.Add(xsSQL);
      pg := FToolGuiaRemisionTraslado.pnlAct;
      Mtx3010.ClientDataSet := DMALM.cdsGuiaRemTraslado;
      Mtx3010.DComC := DMALM.DCOM1;
      Mtx3010.OnEdit := FToolGuiaRemisionTraslado.fg_EditarGuiRemisionTraslado;
      //Mtx3010.OnInsert        := FToolGuiaRemisionSalida.fg_AdicionarGuiRemision;;
      Mtx3010.OnInsert := Nil;
      Mtx3010.OnCreateMant := FToolGuiaRemision.PegaPanelTool;
      Mtx3010.OnDelete := Nil;
      Mtx3010.OnShow := fg_DeshabilitarBotones;
      Mtx3010.SectionName := 'Traslado - Guia Remisión';
      Mtx3010.FileNameIni := '\oaALM.ini';
      //Mtx3010.Filter          := cFilterCiaUser;
      Mtx3010.OnCierra := fg_CerrarVentana;
      Mtx3010.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3010.Execute;
   Finally
   End;

End;

Procedure TFToolGuiaRemision.btnReqUsuarioClick(Sender: TObject);
Var
   xsSql: String;
Begin
   If DMALM = Nil Then Exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   If fg_VerificaVentanasAbiertas = False Then
   Begin
      Exit;
   End;
   cCiaGuia := dblcCompania.Text;
   //xsCompania := dblcCompania.Text ;
   Screen.Cursor := crHourGlass;

   xsSql := ' SELECT A.* FROM  (SELECT LOG306.CIAID, ' + //-CIAID
      ' LOG306.LOCID, ' + // --LOCALIDAD
      ' LOG306.CCOSID, ' + // --CCOSTOID
      ' LOG306.CCOSDES, ' + // --CCOSTODES
      ' LOG306.URQID, ' + // --NUMREQ
      ' LOG306.URQEST, ' + //  --ESTADO
      ' LOG306.TIPOADQ, ' + // --TIPO DE REQUERIMIENTO
      ' LOG306.URQOBS, ' + // --OBSERVACION
      ' LOG306.URQUSR, ' + // --USUARIO
      ' LOG306.URQFREG, ' + // --FECHA
      ' LOG306.OBRAID, ' + // --TIPOSERVICIOID
      ' LOG306.OBRADES, ' + // --TIPOSERVICIODES
      ' LOG306.URQANOMM, ' + // --ANIOMES
      ' LOG306.GENOC, ' + // --GENERAOC
      ' LOG_GUI_REM.SERGUIA GUIASERIE, ' +
      ' LOG_GUI_REM.NUMGUIA GUIANUMERO,  ' +
      ' LOG_GUI_REM.FECGUIA GUIAFECHA,  ' +
      ' LOG_GUI_REM.USUARIO GUIAUSUARIO,  ' +
      ' LOG_GUI_REM.GUIAANOMES GUIAANIOMES,  ' +
      ' LOG_GUI_REM.GUIAFECTRA GUIAFECTRAS,  ' +
      ' LOG_GUI_REM.ESTADO GUIAESTADO  ' +
      ' FROM LOG306, (SELECT * FROM LOG_GUI_REM ' +
      ' WHERE LOG_GUI_REM.ORIGEN = ' + QuotedStr('RU') +
      ' AND LOG_GUI_REM.ESTADO <> ' + QuotedStr('ANULADO') + ' ) LOG_GUI_REM ' +
      ' WHERE LOG306.CIAID = LOG_GUI_REM.CIAID(+) ' +
      ' AND LOG306.URQID = LOG_GUI_REM.NISAID(+)' +
      ' AND LOG306.URQEST = ' + QuotedStr('ACEPTADO') + ' ) A ' +
      ' WHERE A.CIAID = ' + QuotedStr(cCiaGuia);

   DMALM.cdsGuiaRemRequerimiento.CLose;
   DMALM.cdsGuiaRemRequerimiento.DataRequest(xsSQL);
   DMALM.cdsGuiaRemRequerimiento.Open;

   FToolGuiaRemisionRequerimiento := TFToolGuiaRemisionRequerimiento.Create(Application); // ALM229.pas

   DMALM.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3010 := TMant.Create(Application);
   //Mtx3010 := TMant.Create(FToolGuiaRemision);
   xsVentanaAbierta := 'Requerimientos de Usuario';
   Try
      Mtx3010.Admin := DMALM.wAdmin;
      Mtx3010.User := DMALM.wUsuario;
      Mtx3010.Module := DMALM.wModulo;
      Mtx3010.OnCreateMant := Nil;
      Mtx3010.TableName := 'VWALMGUIAREMREQ';
      Mtx3010.Titulo := 'Guías de Remisión - Req Usuario';
      Mtx3010.UsuarioSQL.Add(xsSQL);
      pg := FToolGuiaRemisionRequerimiento.pnlAct;
      Mtx3010.ClientDataSet := DMALM.cdsGuiaRemRequerimiento;
      Mtx3010.DComC := DMALM.DCOM1;
      Mtx3010.OnEdit := FToolGuiaRemisionRequerimiento.fg_EditarGuiRemisionRequerimiento;
      //Mtx3010.OnInsert        := FToolGuiaRemisionSalida.fg_AdicionarGuiRemision;;
      Mtx3010.OnInsert := Nil;
      Mtx3010.OnCreateMant := FToolGuiaRemision.PegaPanelTool;
      Mtx3010.OnDelete := Nil;
      Mtx3010.OnShow := fg_DeshabilitarBotones;
      Mtx3010.SectionName := 'Req Usuario - Guia Remisión';
      Mtx3010.FileNameIni := '\oaALM.ini';
      //Mtx3010.Filter          := cFilterCiaUser;
      Mtx3010.OnCierra := fg_CerrarVentana;
      Mtx3010.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3010.Execute;
   Finally
   End;

End;

Procedure TFToolGuiaRemision.btnRptGuiaRemisionClick(Sender: TObject);
Var
   xsSQL, xsFiltro: String;
   xsFiltroTexto1, xsFiltroTexto2, xsFiltroTexto3, xsFiltroTexto4: String;
   xsFiltroTexto5, xsFiltroTexto6, xsFiltroTexto7, xsFiltroTexto8: String;
   xsFiltroUsuario: String;
   xnContador: integer;
Begin
   If fg_VerificaVentanasAbiertas = False Then
   Begin
      Exit;
   End;
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
   For xnContador := 0 To Mtx3001.FMant.lbFiltroReal.Count - 1 Do
   Begin
      If length(trim(xsFiltro)) = 0 Then
      Begin
         xsFiltro := Mtx3001.FMant.lbFiltroReal.items[xnContador];
      End
      Else
      Begin
         xsFiltro := xsFiltro + ' AND ' + Mtx3001.FMant.lbFiltroReal.items[xnContador];
      End;
      If xnContador = 0 Then
         xsFiltroTexto1 := Mtx3001.FMant.lbFiltro.items[xnContador]
      Else
         If xnContador = 1 Then
            xsFiltroTexto2 := Mtx3001.FMant.lbFiltro.items[xnContador]
         Else
            If xnContador = 2 Then
               xsFiltroTexto3 := Mtx3001.FMant.lbFiltro.items[xnContador]
            Else
               If xnContador = 3 Then
                  xsFiltroTexto4 := Mtx3001.FMant.lbFiltro.items[xnContador]
               Else
                  If xnContador = 4 Then
                     xsFiltroTexto5 := Mtx3001.FMant.lbFiltro.items[xnContador]
                  Else
                     If xnContador = 5 Then
                        xsFiltroTexto6 := Mtx3001.FMant.lbFiltro.items[xnContador]
                     Else
                        If xnContador = 6 Then
                           xsFiltroTexto7 := Mtx3001.FMant.lbFiltro.items[xnContador]
                        Else
                           If xnContador = 7 Then xsFiltroTexto8 := Mtx3001.FMant.lbFiltro.items[xnContador];
   End;
   If Length(Mtx3001.Filter) > 0 Then
   Begin
      xsFiltroUsuario := ' AND ' + Mtx3001.Filter;
   End;
   If length(trim(xsFiltro)) > 0 Then
   Begin
      xsFiltro := ' AND ' + xsFiltro;
   End;

   xsSql := 'SELECT A.*, ' +
      QuotedStr(DMALM.wUsuario) + ' USUARIO_IMPRIME, ' +
      QuotedStr(xsFiltroTexto1) + ' FILTRO1, ' +
      QuotedStr(xsFiltroTexto2) + ' FILTRO2, ' +
      QuotedStr(xsFiltroTexto3) + ' FILTRO3, ' +
      QuotedStr(xsFiltroTexto4) + ' FILTRO4, ' +
      QuotedStr(xsFiltroTexto5) + ' FILTRO5, ' +
      QuotedStr(xsFiltroTexto6) + ' FILTRO6, ' +
      QuotedStr(xsFiltroTexto7) + ' FILTRO7, ' +
      QuotedStr(xsFiltroTexto8) + ' FILTRO8 ' +
      ' FROM (SELECT LOG_GUI_REM.*, ' +
      ' (SELECT TGE147.UBIGEODPTO FROM TGE147 WHERE TGE147.CODDPTO = LOG_GUI_REM.DPTOID AND ROWNUM = 1  ) DEPARTAMENTO,' +
      ' (SELECT TGE147.UBIGEOPROV FROM TGE147 WHERE TGE147.CODDPTO = LOG_GUI_REM.DPTOID AND TGE147.CODPROV = LOG_GUI_REM.CIUDID AND ROWNUM = 1  ) PROVINCIA,' +
      ' (SELECT TGE147.UBIGEODIST FROM TGE147 WHERE TGE147.CODDPTO = LOG_GUI_REM.DPTOID AND TGE147.CODPROV = LOG_GUI_REM.CIUDID AND TGE147.CODDIST = LOG_GUI_REM.ZIPID  AND ROWNUM = 1  ) DISTRITO,' +
      ' (SELECT TGE208.TRIDES FROM TGE208 WHERE  LOG_GUI_REM.TRIID = TGE208.TRIID AND TGE208.TRISGT = ' + QuotedStr('S') + '  ) TIPOTRANSACCION' +
      ' FROM LOG_GUI_REM ' +
      ' WHERE LOG_GUI_REM.CIAID = ' + QuotedStr(dblcCompania.Text) + ') A' +
      ' WHERE 1 = 1 ' +
      xsFiltroUsuario + xsFiltro +
      ' ORDER BY A.SERGUIA , A.NUMGUIA  ';

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xsSql);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;

   ppdbRptGuiasRemision.DataSource := DMALM.dsReporte;
   pprRptGuiasRemision.DataPipeline := ppdbRptGuiasRemision;

   pprRptGuiasRemision.Template.FileName := wRutaRpt + '\RptGuiasRemision.rtm';
   pprRptGuiasRemision.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppdRptGuiasRemision.Report := pprRptGuiasRemision ;
   //ppdRptGuiasRemision.ShowModal() ;
   pprRptGuiasRemision.Print;

End;

Procedure TFToolGuiaRemision.fg_CerrarVentana(Sender: TObject);
Begin
   xsVentanaAbierta := '';
   btnNotaSalida.Enabled := True;
   btnTraslado.Enabled := True;
   btnReqUsuario.Enabled := True;
   btnGuiaAnulada.Enabled := True;
   btnRptGuiaRemision.Enabled := True;
End;

Procedure TFToolGuiaRemision.fg_DeshabilitarBotones(Sender: TObject);
Begin
   btnNotaSalida.Enabled := False;
   btnTraslado.Enabled := False;
   btnReqUsuario.Enabled := False;
   btnGuiaAnulada.Enabled := False;
   btnRptGuiaRemision.Enabled := False;
End;

Function TFToolGuiaRemision.fg_VerificaVentanasAbiertas: Boolean;
Var
   xsMensaje: String;
Begin
   xsMensaje := '';
   If xsVentanaAbierta = 'Notas de Salida' Then
   Begin
      xsMensaje := 'Debe cerrar primero la ventana de Notas de Salida';
   End
   Else
      If xsVentanaAbierta = 'Traslados' Then
      Begin
         xsMensaje := 'Debe cerrar primero la ventana de Notas de Salida';
      End
      Else
         If xsVentanaAbierta = 'Requerimientos de Usuario' Then
         Begin
            xsMensaje := 'Debe cerrar primero la ventana de Requerimientos de Usuario';
         End;
   If xsMensaje <> '' Then
   Begin
      ShowMessage(xsMensaje);
      Result := False;
      Exit;
   End;
   Result := True
End;
// Inicio HPC_201803_ALM
// Se adiciona debido a que se ha habilitado la compañia
procedure TFToolGuiaRemision.dblcCompaniaExit(Sender: TObject);
begin
  edtCompania.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCompania.Text), 'CIADES');
end;
// Fin HPC_201803_ALM
End.

