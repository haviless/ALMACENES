unit ALM410;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Buttons,
  ppBands, ppClass, ppCache, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppReport, wwdblook, Menus, ppVar, ppPrnabl, ppCtrls, Grids, Wwdbigrd,
  Wwdbgrid, ppModule, daDatMod, ppViewr, ALM600, ALM610, ppTypes;

type
  TFCalculoKardex = class(TForm)
    gbPeriodo: TGroupBox;
    dtpDesde: TDateTimePicker;
    dtpHasta: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    rgTipoReporte: TRadioGroup;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    pprDetalle: TppReport;
    pmArticulos: TPopupMenu;
    pmArticulosMarcar: TMenuItem;
    pmArticulosDesmarcar: TMenuItem;
    gbCompanyia: TGroupBox;
    gbArticulos: TGroupBox;
    lvArticulos: TListView;
    ckbSeleccionar: TCheckBox;
    ppLabel9: TppLabel;
    ppLabel20: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel21: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel22: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    pplblTitulo: TppLabel;
    pplblLin0: TppLabel;
    pplblLin1: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    pplblGStkActual: TppLabel;
    pplblUStkActual: TppLabel;
    pplblGStkInicial: TppLabel;
    pplblUStkInicial: TppLabel;
    pplblGStkFinal: TppLabel;
    pplblUStkFinal: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    pptxtArtiId: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    pprResumen: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel15: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    pplblRTitulo: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel23: TppLabel;
    ppLabel26: TppLabel;
    ppLabel28: TppLabel;
    ppLabel33: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel36: TppLabel;
    ppDBText9: TppDBText;
    ppDBText8: TppDBText;
    ppdetbDetalle: TppDetailBand;
    edtBuscar: TEdit;
    Label1: TLabel;
    cbSeleccionar: TButton;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppdbtxtResArtID: TppDBText;
    ppDBText13: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel25: TppLabel;
    fraCAL: TfraCiaAlmLoc;
    gbGrpArticulo: TGroupBox;
    btnFiltrar: TButton;
    ppSummaryBand1: TppSummaryBand;
    fraGFS: TfraGrpFamSubfam;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    pplblRGStkInicial: TppLabel;
    pplblRGStkActual: TppLabel;
    pplblRUStkFinal: TppLabel;
    pplblRUStkActual: TppLabel;
    pplblRGStkFinal: TppLabel;
    pplblRUStkInicial: TppLabel;
    ppLabel37: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppLabel16: TppLabel;
    ppdbFuente: TppDBPipeline;
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure lvSeleccionar(lSeleccionar: boolean);
    procedure lvMarcar(lSeleccionar: boolean);
    procedure ckbSeleccionarClick(Sender: TObject);
    procedure pmArticulosMarcarClick(Sender: TObject);
    procedure pmArticulosDesmarcarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ppdetbDetalleBeforeGenrate(Sender: TObject);
    procedure ppghDCabeceeraBeforeGenerate(Sender: TObject);
    procedure ppgfbDPieBeforeGenerate(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure cbSeleccionarClick(Sender: TObject);
    procedure ppghArtIDBeforeGenerate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure fraCALdblcCIAExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ppGroupHeaderBand1BeforeGenerate(Sender: TObject);
    procedure ppDetailBand2BeforeGenerate(Sender: TObject);
    procedure ppGroupFooterBand1AfterGenerate(Sender: TObject);
    procedure pprDetallePreviewFormCreate(Sender: TObject);
    procedure pprResumenPreviewFormCreate(Sender: TObject);
    procedure fraGFSdblcGArtiExit(Sender: TObject);
  private
    { Private declarations }
    procedure CalcularKardex();
    procedure RepCabeza(sArtID:string);
    procedure RepDetalle();
    procedure RepPie();
  public
    { Public declarations }
    nStockG : Double;
    nStockU : Double;
    sOldCia, sNewCia : string;
    nSeleccion : integer;
    lModEDit : boolean;
  end;

var
  FCalculoKardex: TFCalculoKardex;


implementation
{$R *.DFM}
uses ALMDM1;

procedure TFCalculoKardex.FormActivate(Sender: TObject);
begin
  DM1.cdsCIA.active:=true;
  sOldCia := '/*-';
  sNewCia := fraCAL.dblcCia.Text;
  nSeleccion := -1;
  lModEdit := true;
  dtpDesde.date:=Date;
  dtpHasta.date:=Date;
end;

procedure TFCalculoKardex.bbtnCancClick(Sender: TObject);
begin
  close;
end;

procedure TFCalculoKardex.fraCALdblcCIAExit(Sender: TObject);
var sSQL : string;
begin
  fraCAL.dblcCIAExit(Sender);
  if fraCAL.edtCia.Text <> '' then
  begin
  	Screen.Cursor:=crHourGlass;
    //btnFiltrar.OnClick(sender);
    fraGFS.sCiaID := quotedStr(fraCAL.dblcCia.Text);
    fraGFS.dblcTINID.Enabled := true;
//    sSQL := 'SELECT TINID, TINDES FROM TGE152 WHERE CIAID='+quotedStr(fraCAL.dblcCIA.text)+' ORDER BY TINDES';
    sSQL := 'SELECT * FROM TGE152 WHERE CIAID='+quotedStr(fraCAL.dblcCIA.text)+' ORDER BY TINDES';
    dm1.cdsTINID.DisableControls;
    dm1.cdsTINID.Close;
    dm1.cdsTINID.ProviderName:='prvTINID';
    dm1.cdsTINID.DataRequest(sSQL);
    dm1.cdsTINID.Open;
    dm1.cdsTINID.EnableControls;
    Screen.Cursor:=crDefault;
  end
  else
    fraGFS.dblcTINID.Enabled := false;
end;

procedure TFCalculoKardex.ckbSeleccionarClick(Sender: TObject);
begin
  if ckbSeleccionar.Checked then
    begin
    lvSeleccionar(true);
    ckbSeleccionar.Caption := 'Deseleccionar &Todos';
    end
  else
    begin
    lvSeleccionar(false);
    ckbSeleccionar.Caption := 'Seleccionar &Todos';
    end;
end;

procedure TFCalculoKardex.lvSeleccionar(lSeleccionar: boolean);
var i: integer;
begin
  for i := 0 to lvArticulos.Items.Count-1 do
  begin
    lvArticulos.Items[i].Checked := lSeleccionar;
  end;
end;

procedure TFCalculoKardex.pmArticulosMarcarClick(Sender: TObject);
begin
  lvSeleccionar(true)
end;

procedure TFCalculoKardex.pmArticulosDesmarcarClick(Sender: TObject);
begin
  lvSeleccionar(false)
end;

procedure TFCalculoKardex.lvMarcar(lSeleccionar: boolean);
var i: integer;
begin
  for i := 0 to lvArticulos.Items.Count-1 do
  begin
    if lvArticulos.Items[i].Selected then
    begin
      lvArticulos.Items[i].Checked := lSeleccionar;
      lvArticulos.Items[i].selected := lSeleccionar;
    end;
  end;
end;



procedure TFCalculoKardex.bbtnOkClick(Sender: TObject);
var
	i : integer;
  lFlag : boolean;
begin
	if fraCAL.edtCia.Text = '' then
  begin
    ShowMessage('Falta Definición de Compañía');
    fraCAL.dblcCia.SetFocus;
    exit;
	end;
  if fraCAL.edtLOC.Text = '' then
  begin
    ShowMessage('Falta Definición de Localidad');
    fraCAL.dblcLOC.SetFocus;
    exit;
	end;
  if fraCAL.edtALM.Text = '' then
  begin
    ShowMessage('Falta Definición de Almacen');
    fraCAL.dblcALM.SetFocus;
    exit;
	end;

  i := 0;
  lFlag := false;
  while (i<lvArticulos.Items.Count) and (not lFlag) do
  begin
    if lvArticulos.Items[i].Checked then
       lFlag := true;
    i := i+1;
  end;
  if not lFlag then
  begin
    ShowMessage('Error, tiene que seleccionar un articulo');
    lvArticulos.SetFocus;
    exit;
  end;
  CalcularKardex()
end;

procedure TFCalculoKardex.CalcularKardex();
var
	sDesde, sHasta, sASeleccionados : string;
  sCia, sSQL, sTemp, sWhere : string;
  i : longint;
begin
	Screen.Cursor:=crHourGlass;
  //** 14/03/2001 - pjsv
  //sDesde :=    quotedStr(datetoStr(dtpDesde.DateTime));
  //sHasta :=    quotedStr(datetoStr(dtpHasta.DateTime));
  sDesde := formatdatetime(dm1.wFormatFecha,dtpDesde.DateTime);
  sHasta := formatdatetime(dm1.wFormatFecha,dtpHasta.DateTime);
  //**
  sCia :=      quotedStr(fraCAL.dblcCia.Text);
  sASeleccionados := '';
  if not ckbSeleccionar.Checked then
  begin
  	for i := 0 to lvArticulos.Items.Count-1 do
    begin
    	if lvArticulos.Items[i].Checked then
      begin
      	sTemp := quotedStr(lvArticulos.Items[i].SubItems.Strings[0]);
        sASeleccionados := sASeleccionados + 'MOV.ARTID='+ sTemp + ' OR ';
      end;
    end;
  end
  else
  begin
  	sASeleccionados := 'MOV.ARTID<>' + quotedstr('#$');
  end;
  if length(sASeleccionados)>0 then
      sASeleccionados := '('+ copy(sASeleccionados, 1, length(sASeleccionados)-4) + ')';

  sWhere := ' AND MOV.ALMID=' +quotedStr(fraCAL.dblcALM.text);
  sWhere := sWhere + ' AND MOV.LOCID=' +quotedStr(fraCAL.dblcLOC.text);
  if fraGFS.edtTINID.text <> '' then
  	sWhere := sWhere + ' AND MOV.TINID=' +quotedStr(fraGFS.dblcTINID.text);
  if fraGFS.edtGArti.Text <> '' then
    sWhere := sWhere + ' AND MOV.GRARID=' +quotedStr(fraGFS.dblcGArti.Text);
  if fraGFS.edtFAM.Text <> '' then
    sWhere := sWhere + ' AND MOV.FAMID=' +quotedStr(fraGFS.dblcFAM.Text);
  if fraGFS.edtSUBFAM.Text <> '' then
    sWhere := sWhere + ' AND MOV.SFAMID=' + quotedStr(fraGFS.dblcSUBFAM.Text);

  if rgTipoReporte.ItemIndex = 0 then
  begin
  	pprDetalle.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\ConKardexDet.rtm' ;
		pprDetalle.template.LoadFromFile
  end
  else
  begin
  	pprResumen.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\ConKardexRes.rtm' ;
		pprResumen.template.LoadFromFile
  end;
    
  if rgTipoReporte.ItemIndex = 0 then
  begin
    // ppDetallado
    if (SRV_D = 'DB2NT') or
       (SRV_D = 'DB2400') then
    begin
      sSQL := 'SELECT MOV.CIAID,  MOV.LOCID,   MOV.ALMID,  MOV.NISAFREG, MOV.TDAID, DOC.TDAABR, MOV.ARTFUC,'+
                    'MOV.ARTID,  ART.ARTDES,  MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, '+
                    'MOV.NISAID, MOV.NISATIP, '+   //, MOV.KDXCNTG, MOV.KDXCNTU
                    'CASE WHEN MOV.NISATIP =' +quotedStr('INGRESO')+ ' THEN (MOV.KDXCNTG) ELSE (-1*MOV.KDXCNTG) END AS KDXCNTG, '+
                    'CASE WHEN MOV.NISATIP =' +quotedStr('INGRESO')+ ' THEN (MOV.KDXCNTU) ELSE (-1*MOV.KDXCNTU) END AS KDXCNTU '+
                 'FROM LOG315 AS MOV '+
                    'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) '+
                    'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) '+
                    'LEFT JOIN TGE157 DOC   ON ( MOV.TDAID=DOC.TDAID ) '+
                    'LEFT JOIN TGE205 ART   ON ( MOV.ARTID=ART.ARTID ) '+
                 'WHERE MOV.CIAID=' +sCia+ ' AND '+
                     //** 14/03/2001 - pjsv
                    'MOV.NISAFREG>='+quotedstr(sDesde)+' AND '+
                    'MOV.NISAFREG<='+quotedstr(sHasta)+
                     //**
                    sWhere +' AND '+
                    sASeleccionados;
      sSQL := sSQL + ' ORDER BY MOV.ARTID, MOV.ARTFUC, DOC.TDAABR, MOV.NISATIP';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
      sSQL := 'SELECT MOV.CIAID,  MOV.LOCID,   MOV.ALMID,  MOV.NISAFREG, MOV.TDAID, DOC.TDAABR, MOV.ARTFUC,'+
              'MOV.ARTID,  ART.ARTDES,  MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, '+
              'MOV.NISAID, MOV.NISATIP, '+
							'DECODE(MOV.NISATIP, ''INGRESO'', MOV.KDXCNTG, -1*MOV.KDXCNTG ) KDXCNTG, '+
							'DECODE(MOV.NISATIP, ''INGRESO'', MOV.KDXCNTU, -1*MOV.KDXCNTU ) KDXCNTU '+
              'FROM LOG315 AS MOV, TGE130 UMEDG, TGE130 UMEDU, TGE157 DOC, TGE205 ART '+
              'WHERE MOV.CIAID=' +sCia+ ' AND '+
              'MOV.NISAFREG>='+quotedstr(sDesde)+' AND '+
              'MOV.NISAFREG<='+quotedstr(sHasta)+' AND '+
              'MOV.UNMIDG=UMEDG.UNMID(+) '+
              'MOV.TDAID=DOC.TDAID(+) '+
              'MOV.TDAID=DOC.TDAID(+) '+
              'MOV.ARTID=ART.ARTID(+) '+
               sWhere +' AND '+
                    sASeleccionados;
      sSQL := sSQL + ' ORDER BY MOV.ARTID, MOV.ARTFUC, DOC.TDAABR, MOV.NISATIP';
  end;
    
    pplblTitulo.Caption := 'DETALLE DEL KARDEX DE PRODUCTOS DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);
  end
  else
  begin
    if (SRV_D = 'DB2NT') or
       (SRV_D = 'DB2400') then
    begin
      sSQL := 'SELECT MOV.CIAID,  MOV.LOCID,  MOV.ALMID,  MOV.TDAID, DOC.TDAABR, '+
              'MOV.ARTID, ART.ARTDES, MOV.UNMIDG, MOV.UNMIDU, UMEDG.UNMDES UMEDGDES, UMEDU.UNMDES UMEDUDES, '+
              'CASE WHEN MOV.NISATIP =' +quotedStr('INGRESO')+ ' THEN SUM(MOV.KDXCNTG) ELSE SUM(-1*MOV.KDXCNTG) END AS KDXCNTG, '+
              'CASE WHEN MOV.NISATIP =' +quotedStr('INGRESO')+ ' THEN SUM(MOV.KDXCNTU) ELSE SUM(-1*MOV.KDXCNTU) END AS KDXCNTU '+
              'FROM LOG315 AS MOV '+
              'LEFT JOIN TGE157 DOC   ON ( MOV.TDAID=DOC.TDAID ) '+
              'LEFT JOIN TGE205 ART   ON ( MOV.ARTID=ART.ARTID ) '+
              'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) '+
              'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) ' +
              'WHERE MOV.CIAID=' +sCia+ ' AND '+
              'MOV.NISAFREG>=' +quotedstr(sDesde)+ ' AND '+
              'MOV.NISAFREG<=' +quotedstr(sHasta)+
              sWhere +' AND '+
              sASeleccionados+
              ' GROUP BY '+
              'MOV.ARTID, MOV.TDAID, MOV.CIAID, MOV.LOCID, MOV.ALMID, ART.ARTDES, '+
              'MOV.UNMIDG, UMEDg.UNMDES, MOV.UNMIDU, UMEDu.UNMDES, MOV.NISATIP, DOC.TDAABR'+
              ' ORDER BY MOV.ARTID, MOV.TDAID';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
      sSQL := 'SELECT MOV.CIAID,  MOV.LOCID,  MOV.ALMID,  MOV.TDAID, DOC.TDAABR, '+
              'MOV.ARTID, ART.ARTDES, MOV.UNMIDG, MOV.UNMIDU, UMEDG.UNMDES UMEDGDES, UMEDU.UNMDES UMEDUDES, '+
							'DECODE(MOV.NISATIP, ''INGRESO'', SUM(MOV.KDXCNTG), SUM(-1*MOV.KDXCNTG) ) KDXCNTG, '+
							'DECODE(MOV.NISATIP, ''INGRESO'', SUM(MOV.KDXCNTU), SUM(-1*MOV.KDXCNTU) ) KDXCNTU '+
              'FROM LOG315 AS MOV, TGE157 DOC, TGE205 ART, TGE130 UMEDG, TGE130 UMEDU '+
              'WHERE MOV.CIAID=' +sCia+ ' AND '+
              'MOV.NISAFREG>=' +quotedstr(sDesde)+ ' AND '+
              'MOV.NISAFREG<=' +quotedstr(sHasta)+ ' '+
              'AND MOV.TDAID=DOC.TDAID(+) '+
              'AND MOV.ARTID=ART.ARTID(+) '+
              'AND MOV.UNMIDG=UMEDG.UNMID(+) '+
              'AND MOV.UNMIDU=UMEDU.UNMID(+) '+
              sWhere +' AND '+
              sASeleccionados+
              ' GROUP BY '+
              'MOV.ARTID, MOV.TDAID, MOV.CIAID, MOV.LOCID, MOV.ALMID, ART.ARTDES, '+
              'MOV.UNMIDG, UMEDg.UNMDES, MOV.UNMIDU, UMEDu.UNMDES, MOV.NISATIP, DOC.TDAABR'+
              ' ORDER BY MOV.ARTID, MOV.TDAID';
  end;
            
    pplblRTitulo.Caption := 'RESUMEN DE MOVIMIENTOS DE PRODUCTOS DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);
  end;
  dm1.cdsKDXTemp.Close;
  dm1.cdsKDXTemp.ProviderName:='prvKDXTemp';
  dm1.cdsKDXTemp.DataRequest(sSQL);
  dm1.cdsKDXTemp.Open;
  Screen.Cursor:=crDefault;
  if dm1.cdsKDXTemp.recordCount = 0 then
  begin
    ShowMessage('Error, No existen registros para esta Consulta');
    lvArticulos.SetFocus;
    exit;
  end;
  if rgTipoReporte.ItemIndex = 0 then
    pprDetalle.Print
  else
    pprResumen.Print;
end;

procedure TFCalculoKardex.edtBuscarChange(Sender: TObject);
var i: integer;
   lEncontro : boolean;
   nAncho : integer;
   sLista, sTexto : string;
begin

  if not lModEdit then
    exit;
  nAncho := length(edtBuscar.Text);
  if ( nAncho = 0 ) then
  begin
    lvArticulos.Items[nSeleccion].Selected := false;
    nSeleccion := -1;
    exit;
  end;

  if nSeleccion <> -1 then
    lvArticulos.Items[nSeleccion].Selected := false;

  i := 0;
  lEncontro := false;
  sTexto := UpperCase(edtBuscar.Text);
  while (not lEncontro) and (i < lvArticulos.Items.Count) do
  begin
    sLista := UpperCase( copy(lvArticulos.Items[i].Caption, 1, nAncho) );
    if ( sLista = sTexto ) then
       lEncontro := true
    else
       if (lvArticulos.Items[i].Caption < edtBuscar.Text) then
          i := i+1
       else
          i := lvArticulos.Items.Count+1
  end;
  if lEncontro then
  begin
    nSeleccion := i;
    lvArticulos.Items[nSeleccion].selected := true;

    sTexto := lvArticulos.Items[nSeleccion].Caption;
    lModEdit := false;
    edtBuscar.Text := sTexto;
    lModEdit := true;
    edtBuscar.SelStart := nAncho;
    edtBuscar.SelLength := Length(sTexto)-nAncho;
  end;
end;

procedure TFCalculoKardex.cbSeleccionarClick(Sender: TObject);
begin
   if nSeleccion > -1 then
     lvArticulos.Items[nSeleccion].Checked := true;
end;

procedure TFCalculoKardex.ppghArtIDBeforeGenerate(Sender: TObject);
begin
   //
end;

procedure TFCalculoKardex.btnFiltrarClick(Sender: TObject);
var sSQL : string;
  i : integer;
begin
	Screen.Cursor:=crHourGlass;
  sOldCia := sNewCia;
  sSQL := 'SELECT ARTID, ARTDES FROM TGE205 WHERE CIAID='+quotedStr(fraCAL.dblcCIA.text);

  if fraGFS.edtTINID.text <> '' then
    sSQL := sSQL + ' AND TINID=' +quotedStr(fraGFS.dblcTINID.text);

  if fraGFS.edtGArti.Text <> '' then
    sSQL := sSQL + ' AND GRARID=' +quotedStr(fraGFS.dblcGArti.Text);

  if fraGFS.edtFAM.Text <> '' then
    sSQL := sSQL + ' AND FAMID=' +quotedStr(fraGFS.dblcFAM.Text);

  if fraGFS.edtSUBFAM.Text <> '' then
    sSQL := sSQL + ' AND SFAMID=' + quotedStr(fraGFS.dblcSUBFAM.Text);

  sSQL := sSQL + ' ORDER BY ARTDES';
  dm1.cdsQry.DisableControls;
  dm1.cdsQry.Close;
  dm1.cdsQry.ProviderName:='prvArti';
  dm1.cdsQry.DataRequest(sSQL);
  dm1.cdsQry.Open;
  dm1.cdsQry.First;
  lvArticulos.Items.Clear;
  i := 0;
  while (not dm1.cdsQry.Eof) do
  begin
    lvArticulos.Items.Add;
    lvArticulos.Items[i].Caption := DM1.cdsQry.fieldbyname('ARTDES').asString;
    lvArticulos.Items[i].SubItems.Add(DM1.cdsQry.fieldbyname('ARTID').asString);
    if ckbSeleccionar.Checked then
      lvArticulos.Items[i].Checked := true;
    dm1.cdsQry.Next;
    i := i+1;
  end;
  dm1.cdsQry.active:=false;
  dm1.cdsQry.Close;
  Screen.Cursor:=crDefault;
end;

procedure TFCalculoKardex.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;


procedure TFCalculoKardex.RepCabeza(sArtID:string);
var
   sAlmacen, sLocalidad, sCia : string;
   nMes, nDia, nAnyo : word;
   sMes, sAnyo : string;
   sDesde : string;
   sSQL : string;
   sCampoSTKG, sCampoSTKU : string;
begin

  sCia :=      quotedStr(fraCAL.dblcCia.Text);
  sAlmacen :=  quotedStr(fraCAL.dblcAlm.Text);
  sLocalidad :=quotedStr(fraCAL.dblcLoc.text);

  decodeDate(dtpDesde.DateTime, nAnyo, nMes, nDia);
  sAnyo := inttoStr(nAnyo);

  // Calculamos el stock hasta el mes o año anterior
  if nMes = 1 then
  begin
    sMes := Dm1.StrZero ( inttoStr( nMes ), 2);
    sCampoSTKG := 'STKSANTG';
    sCampoSTKU := 'STKSANTU';
  end
  else
  begin
    sMes := Dm1.StrZero ( inttoStr( nMes-1 ), 2);
    sCampoSTKG := 'STKISG' + sMes;
    sCampoSTKU := 'STKISU' + sMes;
  end;

  sSQL := 'SELECT '+ sCampoSTKG +','+  sCampoSTKU + ' FROM LOG316 ';
  sSQL := sSQL + 'WHERE STKANO='+quotedStr(sAnyo);
  sSQL := sSQL +  ' AND ARTID=' +quotedStr(sArtID);
  sSQL := sSQL +  ' AND CIAID=' +sCia;
  sSQL := sSQL +  ' AND ALMID='+sAlmacen;
  sSQL := sSQL +  ' AND LOCID=' +sLocalidad;

  dm1.cdsQry.DisableControls;
  dm1.cdsQry.Close;
  dm1.cdsQry.ProviderName:='prvTGE';
  dm1.cdsQry.DataRequest(sSQL);
  dm1.cdsQry.Open;
// Saldo Anterior
  nStockG := DM1.cdsQry.FieldByName(sCampoSTKG).asFloat;
  nStockU := DM1.cdsQry.FieldByName(sCampoSTKU).asFloat;
  dm1.cdsQry.Close;

  //Calculamos el stock desde el 1/mes/año hasta el dia/mes/año
  sDesde := quotedStr(datetoStr(dtpDesde.DateTime));
  sSQL := 'SELECT sum(MOV.KDXCNTG) as totalg, SUM(MOV.KDXCNTU) as totalu ';
  sSQL := sSQL + 'FROM LOG315 AS MOV ';
  sSQL := sSQL + 'WHERE CIAID='+ sCia;
  sSQL := sSQL + ' AND ARTID='    + quotedStr(sArtID);
  sSQL := sSQL + ' AND NISAFREG>='+ quotedStr('1/'+sMes+'/'+inttoStr(nAnyo));
  sSQL := sSQL + ' AND NISAFREG<' + sDesde;
  sSQL := sSQL + ' AND ALMID=' + sAlmacen;
  sSQL := sSQL + ' AND LOCID=' + sLocalidad;
  dm1.cdsQry.DisableControls;
  dm1.cdsQry.Close;
  dm1.cdsQry.ProviderName:='prvTGE';
  dm1.cdsQry.DataRequest(sSQL);
  dm1.cdsQry.Open;

  nStockG := nStockG + DM1.cdsQry.FieldByName('TotalG').asInteger;
  nStockU := nStockU + DM1.cdsQry.FieldByName('TotalU').asInteger;
  dm1.cdsQry.Close;
end;

procedure TFCalculoKardex.RepDetalle();
begin
  nStockG := nStockG + dm1.cdsKDXTemp.FieldByName('KDXCNTG').asFloat;
  nStockU := nStockU + dm1.cdsKDXTemp.FieldByName('KDXCNTU').asFloat;
end;

procedure TFCalculoKardex.RepPie();
begin
  //
end;

procedure TFCalculoKardex.ppghDCabeceeraBeforeGenerate(
  Sender: TObject);
begin
  RepCabeza(pptxtArtiId.text);
  pplblGStkInicial.Caption := Format('%8.2f', [nStockG]);
  pplblUStkInicial.Caption := Format('%8.2f', [nStockU])
end;

procedure TFCalculoKardex.ppdetbDetalleBeforeGenrate(Sender: TObject);
begin
  RepDetalle();
  pplblGStkActual.Caption := Format('%8.2f', [nStockG]);
  pplblUStkActual.Caption := Format('%8.2f', [nStockU]);
end;

procedure TFCalculoKardex.ppgfbDPieBeforeGenerate(
  Sender: TObject);
begin
  RepPie();
  pplblGStkFinal.Caption := Format('%8.2f', [nStockG]);
  pplblUStkFinal.Caption := Format('%8.2f', [nStockU]);
end;

procedure TFCalculoKardex.ppGroupHeaderBand1BeforeGenerate(
  Sender: TObject);
begin
  RepCabeza(ppdbtxtResArtID.text);
  pplblRGStkInicial.Caption := Format('%8.2f', [nStockG]);
  pplblRUStkInicial.Caption := Format('%8.2f', [nStockU]);
end;

procedure TFCalculoKardex.ppDetailBand2BeforeGenerate(Sender: TObject);
begin
  RepDetalle();
  pplblRGStkActual.Caption := Format('%8.2f', [nStockG]);
  pplblRUStkActual.Caption := Format('%8.2f', [nStockU]);
end;

procedure TFCalculoKardex.ppGroupFooterBand1AfterGenerate(Sender: TObject);
begin
  RepPie();
  pplblRGStkFinal.Caption := Format('%8.2f', [nStockG]);
  pplblRUStkFinal.Caption := Format('%8.2f', [nStockU]);
end;

procedure TFCalculoKardex.pprDetallePreviewFormCreate(Sender: TObject);
begin
   pprDetalle.PreviewForm.ClientHeight := 500;
   pprDetalle.PreviewForm.ClientWidth  := 650;
   TppViewer(pprDetalle.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;

procedure TFCalculoKardex.pprResumenPreviewFormCreate(Sender: TObject);
begin
   pprResumen.PreviewForm.ClientHeight := 500;
   pprResumen.PreviewForm.ClientWidth  := 650;
   TppViewer(pprResumen.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;

procedure TFCalculoKardex.fraGFSdblcGArtiExit(Sender: TObject);
begin
  fraGFS.dblcGArtiExit(Sender);

end;

End.
