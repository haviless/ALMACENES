unit ALM600;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook;

type
  TfraCiaAlmLoc = class(TFrame)
    lblCIA: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    dblcCIA: TwwDBLookupCombo;
    dblcALM: TwwDBLookupCombo;
    edtCia: TEdit;
    edtLOC: TEdit;
    edtALM: TEdit;
    dblcLOC: TwwDBLookupCombo;
    Label1: TLabel;
    dblcTIN: TwwDBLookupCombo;
    edtTin: TEdit;
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcCIAChange(Sender: TObject);
    procedure dblcLOCExit(Sender: TObject);
    procedure dblcALMExit(Sender: TObject);
    procedure dblcTINExit(Sender: TObject);
  private
    { Private declarations }
    sCiaNuevo, sCiaActual : string;
  public
    { Public declarations }
  end;

implementation

uses ALMDM1;

{$R *.DFM}

procedure TfraCiaAlmLoc.dblcCIAChange(Sender: TObject);
begin
  sCiaNuevo := dblcCia.Text;
end;

procedure TfraCiaAlmLoc.dblcCIAExit(Sender: TObject);
var sSQL : string;
begin
  edtCIA.Text := DM1.DisplayDescrip('prvLOG','TGE101','CIADES','CIAID='+quotedStr(dblcCia.text),'CIADES');
  if sCiaActual <> sCiaNuevo then
  begin
    //se cargan todos los almacenes y locales por cia
    sSQL := 'SELECT * FROM TGE151 WHERE CIAID='+quotedStr(dblcCIA.Text)+' ORDER BY ALMID';
    DM1.cdsALM.Close;
    DM1.cdsALM.DataRequest(sSQL);
    DM1.cdsALM.Open;
    sSQL := 'SELECT * FROM TGE126 WHERE CIAID='+quotedStr(dblcCIA.Text)+' ORDER BY LOCID';
    DM1.cdsLOC.Close;
    DM1.cdsLOC.DataRequest(sSQL);
    DM1.cdsLOC.Open;

    sSQL := 'SELECT * FROM TGE152 WHERE CIAID='+quotedStr(dblcCIA.Text)+' ORDER BY TINID';
    DM1.cdsTINID.Close;
    DM1.cdsTINID.DataRequest(sSQL);
    DM1.cdsTINID.Open;

  end;
  sCiaActual := dblcCIA.text;
end;

procedure TfraCiaAlmLoc.dblcLOCExit(Sender: TObject);
var
	xSQL : String;
begin
  xSQL:='LOCID='+quotedStr(dblcLOC.text)+' AND CIAID='+quotedStr(dblcCIA.Text);
  edtLoc.text := DM1.DisplayDescrip('prvLOG','TGE126','LOCDES',xSQL,'LOCDES');
end;

procedure TfraCiaAlmLoc.dblcALMExit(Sender: TObject);
var
	xSQL : String;
begin
	xSQL:='ALMID='+quotedStr(dblcALM.text)+' AND CIAID='+quotedStr(dblcCIA.Text);
  edtAlm.text := DM1.DisplayDescrip('prvLOG','TGE151','ALMDES',xSQL,'ALMDES');
end;

procedure TfraCiaAlmLoc.dblcTINExit(Sender: TObject);
var
	xSQL : String;
begin
	xSQL:='TINID='+quotedStr(dblcTIN.text)+' AND CIAID='+quotedStr(dblcCIA.Text);
	edtTin.text := DM1.DisplayDescrip('prvLOG','TGE152','TINDES',xSQL,'TINDES');
end;

end.
