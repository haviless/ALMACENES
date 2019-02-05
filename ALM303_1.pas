unit ALM303_1;

interface

{ 21/08/2000 pjsv }

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, wwdbedit, StdCtrls, wwdblook, Buttons, ExtCtrls, wwdbdatetimepicker,
  ComCtrls, db, Grids, Wwdbigrd, Wwdbgrid, ppPrnabl, ppClass, ppCtrls,
  ppDB, ppBands, ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, ppViewr,
  ppTypes;

type
  TFStockVal = class(TForm)
    pnlParame: TPanel;
    lblTipMon: TLabel;
    lblTipCam: TLabel;
    lblCambio: TLabel;
    dblcTipMon: TwwDBLookupCombo;
    dbeTipCam: TwwDBEdit;
    bbSalir: TBitBtn;
    rgTipVal: TRadioGroup;
    dbeTipmondes: TwwDBEdit;
    lblFCambio: TLabel;
    BitBtn1: TBitBtn;
    dtpFCambio: TDateTimePicker;
    cbItemTCam: TComboBox;
    dbgStockVal: TwwDBGrid;
    ppDBPStockVal: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLblTit1: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    pplbltotal: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLblTit2: TppLabel;
    ppLabel13: TppLabel;
    procedure bbSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcTipMonChange(Sender: TObject);
    procedure cbItemTCamChange(Sender: TObject);
    procedure dblcTipMonNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure rgTipValClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure dtpFCambioChange(Sender: TObject);
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
     Xsql : string;
//     vtipcam : real;
     procedure inicializa;
     procedure JalaTipCam; { jala el monto para un determinado tipo de cambio}
  public
    { Public declarations }
  end;

var
  FStockVal: TFStockVal;

implementation
Uses ALM303, ALMDM1;
{$R *.DFM}

procedure TFStockVal.FormCreate(Sender: TObject);
begin
  //** 13/03/2001 - pjsv - OJO debe de ir la fecha del sistema
  dtpFCambio.Date:=date();
  //**
   inicializa;
end;

procedure TFStockVal.bbSalirClick(Sender: TObject);
begin
  FStockVal.Close;
end;

procedure TFStockVal.dblcTipMonChange(Sender: TObject);
//var
 //ssql : string;
begin
  dbeTipmondes.Text := dm1.cdsTMoneda.fieldbyname('TMONDES').AsString;
  JalaTipCam;  
{  ssql := '';
  ssql := 'Select * FROM TGE107 WHERE TGE107.TMONID='+QUOTEDSTR(dblcTipMon.Text);
  dm1.cdsTipCam.Close;
  dm1.cdsTipCam.DataRequest(ssql);
  dm1.cdsTipCam.Open;}
end;


procedure TFStockVal.cbItemTCamChange(Sender: TObject);
begin
  JalaTipCam;
end;

procedure TFStockVal.dblcTipMonNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFStockVal.rgTipValClick(Sender: TObject);
begin
//fdgfd
end;

procedure TFStockVal.BitBtn1Click(Sender: TObject);
var
	//vpreg,vpreu : real;
	iX : integer;
	vbool : bool;
	sDolar: string;
Begin
	Screen.Cursor:=crHourGlass;
  vbool := false;
  xsql := '';
  sDolar:='1';

  if (dblcTipMon.text = dm1.DisplayDescrip('prvTMoneda','TGE103','TMONID','TMON_LOC = ''E''','TMONID')) then
  	sDolar:=dbeTipCam.Text;

  //  dm1.cdsStockVal.DisableControls;
	{21/08/2000 dejarlo por siaca
  xsql := 'Select LOG316.CIAID,LOG316.STKANO,LOG316.ALMID,LOG316.LOCID,'+
           'LOG316.TINID,LOG316.GRARID,LOG316.FAMID,LOG316.SFAMID,'+
           'LOG316.ARTID,TGE205.ARTDES,LOG316.TMONID,';}

  xSQL:= 'SELECT LOG316.CIAID, LOG316.STKANO, LOG316.ALMID, LOG316.LOCID, '+
         'LOG316.TINID, LOG316.GRARID, LOG316.FAMID, LOG316.SFAMID, '+
         'LOG316.ARTID, TGE205.ARTDES, TGE205.ARTDES, ';

	//xsql := 'Select LOG316.*,TGE205.ARTDES,';
  case rgTipVal.ItemIndex of
   0: begin
				xsql:= xSQL +'DEC('+dm1.wReplacCeros+'(LOG316.STKSANTG,0),15,2) * 1/'+sDolar+' AS STOCKG, '+
                     'DEC('+dm1.wReplacCeros+'(LOG316.STKSANTU,0),15,2) * 1/'+sDolar+' AS STOCKU, '+
                     'DEC('+dm1.wReplacCeros+'(TGE205.ARTCPROG,0),15,2) * 1/'+sDolar+' AS PRECIOG, '+
                     'DEC('+dm1.wReplacCeros+'(TGE205.ARTCPROU,0),15,2) * 1/'+sDolar+' AS PRECIOU, '+
                     'DEC(((('+dm1.wReplacCeros+'(LOG316.STKSANTG,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROG,0))*100)+0.5)/100,15,2) * 1/'+sDolar+' AS IMPORTEG, '+
                     'DEC(((('+dm1.wReplacCeros+'(LOG316.STKSANTU,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROU,0))*100)+0.5)/100,15,2) * 1/'+sDolar+' AS IMPORTEU, '+
                     '(DEC(((('+dm1.wReplacCeros+'(LOG316.STKSANTG,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROG,0))*100)+0.5)/100,15,2) * 1/'+sDolar+')+ '+
                     '(DEC(((('+dm1.wReplacCeros+'(LOG316.STKSANTU,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROU,0))*100)+0.5)/100,15,2) * 1/'+sDolar+') AS TOTALVAL ';

			end;
   1: begin
   			xSQL:= xSQL +'DEC('+dm1.wReplacCeros+'(LOG316.STKSACTG,0),15,2) * 1/'+sDolar+' AS STOCKG, '+
                     'DEC('+dm1.wReplacCeros+'(LOG316.STKSACTU,0),15,2) * 1/'+sDolar+' AS STOCKU, '+
                     'DEC('+dm1.wReplacCeros+'(TGE205.ARTCPROG,0),15,2) * 1/'+sDolar+' AS PRECIOG, '+
                     'DEC('+dm1.wReplacCeros+'(TGE205.ARTCPROU,0),15,2) * 1/'+sDolar+' AS PRECIOU, '+
                     'DEC(((('+dm1.wReplacCeros+'(LOG316.STKSACTG,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROG,0))*100)+0.5)/100,15,2) * 1/'+sDolar+' AS IMPORTEG, '+
                     'DEC(((('+dm1.wReplacCeros+'(LOG316.STKSACTU,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROU,0))*100)+0.5)/100,15,2) * 1/'+sDolar+' AS IMPORTEU, '+
                     '(DEC(((('+dm1.wReplacCeros+'(LOG316.STKSACTG,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROG,0))*100)+0.5)/100,15,2) * 1/'+sDolar+')+ '+
                     '(DEC(((('+dm1.wReplacCeros+'(LOG316.STKSACTU,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROU,0))*100)+0.5)/100,15,2) * 1/'+sDolar+') AS TOTALVAL ';
   	 	end;
   2: begin
   			xSQL:= xSQL +'DEC('+dm1.wReplacCeros+'(LOG316.STKSFISG,0),15,2) * 1/'+sDolar+' AS STOCKG, '+
                     'DEC('+dm1.wReplacCeros+'(LOG316.STKSFISU,0),15,2) * 1/'+sDolar+' AS STOCKU, '+
                     'DEC('+dm1.wReplacCeros+'(TGE205.ARTCPROG,0),15,2) * 1/'+sDolar+' AS PRECIOG, '+
                     'DEC('+dm1.wReplacCeros+'(TGE205.ARTCPROU,0),15,2) * 1/'+sDolar+' AS PRECIOU, '+
                     'DEC(((('+dm1.wReplacCeros+'(LOG316.STKSFISG,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROG,0))*100)+0.5)/100,15,2) * 1/'+sDolar+' AS IMPORTEG, '+
                     'DEC(((('+dm1.wReplacCeros+'(LOG316.STKSFISU,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROU,0))*100)+0.5)/100,15,2) * 1/'+sDolar+' AS IMPORTEU, '+
                     '(DEC(((('+dm1.wReplacCeros+'(LOG316.STKSFISG,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROG,0))*100)+0.5)/100,15,2) * 1/'+sDolar+')+ '+
                     '(DEC(((('+dm1.wReplacCeros+'(LOG316.STKSFISU,0)*'+ ''+dm1.wReplacCeros+'(TGE205.ARTCPROU,0))*100)+0.5)/100,15,2) * 1/'+sDolar+') AS TOTALVAL ';
   		end;
  end;

	xsql := xsql +     ' FROM LOG316, TGE205 WHERE TGE205.ARTID = LOG316.ARTID ';

  if ALM303.xwhere <> '' then
  	xsql := xsql + 'AND '+ ALM303.xwhere;

  for ix := 0 to Length(xsql) do
  begin
  	if copy(xsql,iX,8) = 'ORDER BY' then
    begin
    	vbool := true;
      break;
    end;
  end;

  if vbool = false then
   xsql := xsql + ' ORDER BY CIAID,ALMID,LOCID,'+
                  ' GRARID,FAMID,SFAMID,ARTID'
  else
   xsql := xsql + ' ,CIAID,ALMID,LOCID,'+
                  ' GRARID,FAMID,SFAMID,ARTID';

  dm1.cdsStockVal.Close;
  dm1.cdsStockVal.ProviderName := 'prvStockVal';
  dm1.cdsStockVal.DataRequest(xSQL);
  dm1.cdsStockVal.Open;

  Screen.Cursor:=crDefault;
  //** 15/03/2001 - pjsv
  ppReport1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\ContaInve.rtm';
  ppReport1.template.LoadFromFile ;
  //**
  ppReport1.Print;
  ppReport1.Stop;  
end;

procedure TFStockVal.ppReport1BeforePrint(Sender: TObject);
var
 vtotales : real;
begin
   case rgTipVal.ItemIndex of
    0 : ppLblTit1.Text := 'Contabilidad de Inventarios - Stock Inicial';
    1 : ppLblTit1.Text := 'Contabilidad de Inventarios - Stock Lógico';
    2 : ppLblTit1.Text := 'Contabilidad de Inventarios - Stock Físico';
   end;
  ppLblTit1.Left := (ppReport1.printersetup.PaperHeight / 2) - (ppLblTit1.Width/2);
  ppLblTit2.Text := 'Valorización en ' + dbeTipmondes.Text;
  ppLblTit2.Left := (ppReport1.printersetup.PaperHeight / 2) - (ppLblTit2.Width/2);
  vtotales := 0;
  DM1.cdsStockVal.First;
  while not DM1.cdsStockVal.eof do
   begin
    vtotales := vtotales + DM1.cdsStockVal.fieldbyname('TOTALVAL').Value;
    DM1.cdsStockVal.Next;
   end;
  pplbltotal.Caption := FormatFloat('###,###,##0.00',vTotales);
end;

procedure TFStockVal.dtpFCambioChange(Sender: TObject);
begin
  JalaTipCam;
end;

procedure TFStockVal.inicializa;
begin
   dm1.cdsTMoneda.First;
   dblcTipMon.text := dm1.cdsTMoneda.fieldbyname('TMONID').Asstring;
   cbItemTCam.ItemIndex := 0;
   dtpFCambio.Date := Date();
   JalaTipCam;
   dm1.cdsStockVal.Open;
   dm1.cdsStockVal.First;
   while not dm1.cdsStockVal.Eof do dm1.cdsStockVal.Delete;
   rgTipVal.ItemIndex := 0;
   rgTipValClick(nil);
end;

procedure TFStockVal.JalaTipCam;
var
 sFecha,ssql : string;
begin
  ssql := '';
	{23/08/2000 pjsv
  ssql := 'TMONID='+quotedstr(dblcTipMon.Text)+ ' AND FECHA=' + quotedstr(DATETOSTR(dtpFCambio.Date));}
  //** 13/03/2001 - pjsv
  sFecha := formatdatetime(dm1.wFormatFecha,dtpFCambio.DateTime);
  ssql := 'FECHA=' + quotedstr(sfecha);
  //**
  case cbItemTCam.ItemIndex of
    0 : dbeTipCam.Text := dm1.DisplayDescrip('prvTGE','TGE107','TCAMVBC',ssql,'TCAMVBC');
    1 : dbeTipCam.Text := dm1.DisplayDescrip('prvTGE','TGE107','TCAMVBV',ssql,'TCAMVBV');
    2 : dbeTipCam.Text := dm1.DisplayDescrip('prvTGE','TGE107','TCAMVPC',ssql,'TCAMVPC');
    3 : dbeTipCam.Text := dm1.DisplayDescrip('prvTGE','TGE107','TCAMVPV',ssql,'TCAMVPV');
    4 : dbeTipCam.Text := dm1.DisplayDescrip('prvTGE','TGE107','TCAMVOC',ssql,'TCAMVOC');
    5 : dbeTipCam.Text := dm1.DisplayDescrip('prvTGE','TGE107','TCAMVOV',ssql,'TCAMVOV');
    6 : dbeTipCam.Text := dm1.DisplayDescrip('prvTGE','TGE107','TCAMVXC',ssql,'TCAMVXC');
    7 : dbeTipCam.Text := dm1.DisplayDescrip('prvTGE','TGE107','TCAMVXV',ssql,'TCAMVXV');
  end;
  if dbeTipCam.text = '' then dbeTipCam.text := '0.00';
end;

procedure TFStockVal.ppReport1PreviewFormCreate(Sender: TObject);
begin
   ppReport1.PreviewForm.ClientHeight := 500;
   ppReport1.PreviewForm.ClientWidth  := 650;
   TppViewer(ppReport1.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;

//** 15/03/2001 - pjsv
procedure TFStockVal.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;
//**

procedure TFStockVal.ppHeaderBand1BeforePrint(Sender: TObject);
var sSQL:string;
begin
	sSQL:='CIAID='+QuotedStr(ppDBText1.Text);
	ppLabel13.Text:=dm1.DisplayDescrip('prvTGE','TGE101','CIADES',sSQL,'CIADES');
end;

end.


