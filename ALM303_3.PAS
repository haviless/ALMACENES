unit ALM303_3;

interface
{ 23/08/2000 pjsv }
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mant, ControlGridDisp, Buttons, Wwdbigrd, Grids, Wwdbgrid, ExtCtrls,
  StdCtrls, Mask, wwdbedit;

type
  TFMovAlmE = class(TForm)
    dbeCIA: TwwDBEdit;
    dbeLoca: TwwDBEdit;
    dbeAlma: TwwDBEdit;
    dbeTipDoc: TwwDBEdit;
    dbeFNI: TwwDBEdit;
    dbeTans: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    dbeCCos: TwwDBEdit;
    dbeProv: TwwDBEdit;
    dbeOrdComp: TwwDBEdit;
    dbeDocRef: TwwDBEdit;
    dbeNumDoc: TwwDBEdit;
    dbeFDoc: TwwDBEdit;
    dbeLote: TwwDBEdit;
    dbePack: TwwDBEdit;
    dbeNumPed: TwwDBEdit;
    dbeObser: TwwDBEdit;
    lblCIA: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    lblFReg: TLabel;
    lblTransacc: TLabel;
    lblNumNS: TLabel;
    lblCC: TLabel;
    lblProv: TLabel;
    lblNOC: TLabel;
    lblTDocumento: TLabel;
    lblNDoc: TLabel;
    lblFDoc: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblObs: TLabel;
    pnlDetalleG: TPanel;
    dbgDReqs: TwwDBGrid;
    Z2dbgDReqsIButton: TwwIButton;
    stxTitulo1: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMovAlmE: TFMovAlmE;

implementation
uses almdm1;
{$R *.DFM}

procedure TFMovAlmE.FormActivate(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'CIAID='+quotedstr(DM1.cdsNIA.FieldByName('CIAID').AsString);
   dbeCIA.Text:=DM1.DisplayDescrip('prvLOG','TGE101','CIADES',xWhere,'CIADES');
   xWhere := 'LOCID='+quotedstr(DM1.cdsNIA.FieldByName('LOCID').AsString);
   dbeLOCA.Text:=DM1.DisplayDescrip('prvLOG','TGE126','LOCDES',xWhere,'LOCDES');
   xWhere := 'ALMID='+quotedstr(DM1.cdsNIA.FieldByName('ALMID').AsString);
   dbeALMA.Text:=DM1.DisplayDescrip('prvLOG','TGE151','ALMDES',xWhere,'ALMDES');
   xWhere := 'TDAID='+quotedstr(DM1.cdsNIA.FieldByName('TDAID').AsString);
   dbeTIPDOC.Text:=DM1.DisplayDescrip('prvLOG','TGE157','TDADES',xWhere,'TDADES');
   xWhere := 'TRIID='+quotedstr(DM1.cdsNIA.FieldByName('TRIID').AsString);
   dbeTANS.Text:=DM1.DisplayDescrip('prvLOG','TGE208','TRIDES',xWhere,'TRIDES');
   xWhere := 'CCOSID='+quotedstr(DM1.cdsNIA.FieldByName('CCOSID').AsString);
   dbeCCOS.Text:=DM1.DisplayDescrip('prvLOG','TGE203','CCOSDES',xWhere,'CCOSDES');
   xWhere := 'DOCID='+quotedstr(DM1.cdsNIA.FieldByName('DOCID').AsString);
   dbeDOCREF.Text:=DM1.DisplayDescrip('prvLOG','TGE110','DOCDES',xWhere,'DOCDES');
end;

//** 15/03/2001 - pjsv
procedure TFMovAlmE.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;
//**

end.
