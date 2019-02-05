unit ALM303_4;

interface
{ 24/08/2000 pjsv }
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Wwdbigrd, Grids, Wwdbgrid, StdCtrls, DBCtrls, Mask, wwdbedit;

type
  TFMovAlmS = class(TForm)
    lblCIA: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    lblTransacc: TLabel;
    Label11: TLabel;
    lblNumNS: TLabel;
    Label12: TLabel;
    lblFReg: TLabel;
    lblProv: TLabel;
    lblTDocumento: TLabel;
    lblSerie: TLabel;
    lblNDoc: TLabel;
    lblFDoc: TLabel;
    lblSolic: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblObs: TLabel;
    dbeCIA: TwwDBEdit;
    dbeLOC: TwwDBEdit;
    dbeALM: TwwDBEdit;
    dbeTDNISA: TwwDBEdit;
    dbeTransac: TwwDBEdit;
    dbeLOCOri: TwwDBEdit;
    dbeNumNISA: TwwDBEdit;
    dbeALMOri: TwwDBEdit;
    dbeCC: TwwDBEdit;
    dbeProv: TwwDBEdit;
    dbeTDOC: TwwDBEdit;
    dbeSerie: TwwDBEdit;
    dbeNDoc: TwwDBEdit;
    dbeSolic: TwwDBEdit;
    deObra: TwwDBEdit;
    dbeLote: TwwDBEdit;
    dbePO: TwwDBEdit;
    dbeNP: TwwDBEdit;
    dbmObs: TDBMemo;
    wwDBEdit1: TwwDBEdit;
    lblCC: TLabel;
    wwDBEdit2: TwwDBEdit;
    dbgDReqs: TwwDBGrid;
    Z2dbgDReqsIButton: TwwIButton;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMovAlmS: TFMovAlmS;

implementation

uses ALMDM1;

{$R *.DFM}

procedure TFMovAlmS.FormActivate(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'CIAID='+quotedstr(DM1.cdsNIS.FieldByName('CIAID').AsString);
   dbeCIA.Text:=DM1.DisplayDescrip('prvLOG','TGE101','CIADES',xWhere,'CIADES');
   xWhere := 'LOCID='+quotedstr(DM1.cdsNIS.FieldByName('LOCID').AsString);
   dbeLOC.Text:=DM1.DisplayDescrip('prvLOG','TGE126','LOCDES',xWhere,'LOCDES');
   xWhere := 'ALMID='+quotedstr(DM1.cdsNIS.FieldByName('ALMID').AsString);
   dbeALM.Text:=DM1.DisplayDescrip('prvLOG','TGE151','ALMDES',xWhere,'ALMDES');
   xWhere := 'TDAID='+quotedstr(DM1.cdsNIS.FieldByName('TDAID').AsString);
   dbeTDNISA.Text:=DM1.DisplayDescrip('prvLOG','TGE157','TDADES',xWhere,'TDADES');
   xWhere := 'TRIID='+quotedstr(DM1.cdsNIS.FieldByName('TRIID').AsString);
   dbeTRANSAC.Text:=DM1.DisplayDescrip('prvLOG','TGE208','TRIDES',xWhere,'TRIDES');
   xWhere := 'CCOSID='+quotedstr(DM1.cdsNIS.FieldByName('CCOSID').AsString);
   dbeCC.Text:=DM1.DisplayDescrip('prvLOG','TGE203','CCOSDES',xWhere,'CCOSDES');
   xWhere := 'CLIEID='+quotedstr(DM1.cdsNIS.FieldByName('PROV').AsString);
   dbePROV.Text:=DM1.DisplayDescrip('prvLOG','TGE204','CLIEDES',xWhere,'CLIEDES');
   xWhere := 'DOCID='+quotedstr(DM1.cdsNIS.FieldByName('DOCID').AsString);
   dbeTDOC.Text:=DM1.DisplayDescrip('prvLOG','TGE110','DOCDES',xWhere,'DOCDES');
end;

//** 15/03/2001 - pjsv
procedure TFMovAlmS.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;
//**

end.
