unit ALM610;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook;

type
  TfraGrpFamSubfam = class(TFrame)
    dblcGArti: TwwDBLookupCombo;
    dblcFAM: TwwDBLookupCombo;
    dblcSUBFAM: TwwDBLookupCombo;
    edtGArti: TEdit;
    edtFAM: TEdit;
    edtSUBFAM: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTINID: TEdit;
    Label4: TLabel;
    dblcTINID: TwwDBLookupCombo;
    procedure dblcGArtiExit(Sender: TObject);
    procedure dblcFAMExit(Sender: TObject);
    procedure dblcSUBFAMExit(Sender: TObject);
    procedure dblcGArtiChange(Sender: TObject);
    procedure dblcFAMChange(Sender: TObject);
    procedure dblcTINIDExit(Sender: TObject);
    procedure dblcTINIDChange(Sender: TObject);
  private
    { Private declarations }
    sActTINID, sNewTINID : string;
    sActGArti, sNewGArti : string;
    sActFAM, sNewFAM : string;
  public
    { Public declarations }
    sCiaID : string;
  end;

implementation

{$R *.DFM}
uses ALMDM1;

procedure TfraGrpFamSubfam.dblcTINIDExit(Sender: TObject);
var sSQL : string;
begin
  if sNewTINID = sActTINID then
    exit;

  if dblcTINID.Text <> '' then
    edtTINID.Text := DM1.DisplayDescrip('prvTINID','TGE152','TINDES','TINID='+quotedStr(dblcTINID.text),'TINDES')
  else
    edtTINID.Text := '';

  if edtTINID.Text <> '' then
  begin
    sActTINID := dblcTINID.Text;
    dblcGArti.Enabled := true;
    sSQL := 'SELECT * FROM TGE131 WHERE CIAID='+sCIAID+' AND TINID='+quotedStr(dblcTINID.Text);
    DM1.cdsGArti.close;
    DM1.cdsGArti.ProviderName:='prvGArti';
    DM1.cdsGArti.DataRequest(sSQL);
    DM1.cdsGArti.Open;
    dblcGArti.SetFocus;
  end
  else
    dblcGArti.Enabled := false;
end;

procedure TfraGrpFamSubfam.dblcGArtiExit(Sender: TObject);
var sSQL : string;
begin
  if sNewGArti = sActGArti then
    exit;

  if dblcGArti.Text <> '' then
    edtGArti.Text := DM1.DisplayDescrip('prvGArti','TGE131','GRARDES','GRARID='+quotedStr(dblcGArti.text)+' AND CIAID='+sCIAID,'GRARDES')
  else
    edtGArti.Text := '';

  if edtGArti.Text <> '' then
  begin
    sActGArti := dblcGArti.Text;
    dblcFAM.Enabled := true;
    sSQL := 'SELECT * FROM TGE169 WHERE GRARID='+quotedStr(dblcGArti.text)+' AND TINID='+quotedStr(dblcTINID.text);
    DM1.cdsFAM.Close;
    DM1.cdsFAM.ProviderName:='prvFAM';
    DM1.cdsFAM.DataRequest(sSQL);
    DM1.cdsFAM.Open;
    dblcFAM.SetFocus;
  end
  else
    dblcFAM.Enabled := false;
end;

procedure TfraGrpFamSubfam.dblcFAMExit(Sender: TObject);
var sSQL : string;
begin
  if sNewFAM = sActFAM then
    exit;

  if dblcFAM.Text <>  '' then
    edtFAM.Text := DM1.DisplayDescrip('prvFAM','TGE169','FAMDES','FAMID='+quotedStr(dblcFAM.Text),'FAMDES')
  else
    edtFAM.Text := '';

  if edtFAM.Text <> '' then
  begin
    sActFam := dblcFAM.text;
    dblcSUBFAM.Enabled := true;
    sSQL := 'SELECT * FROM TGE170 WHERE GRARID=' +quotedStr(dblcGArti.text)+ ' AND FAMID=' +quotedStr(dblcFAM.text)+ ' AND TINID=' +quotedStr(dblcTINID.text);
    DM1.cdsSUBFAM.Close;
    DM1.cdsSUBFAM.ProviderName:='prvSUBFAM';
    DM1.cdsSUBFAM.DataRequest(sSQL);
    DM1.cdsSUBFAM.Open;
    dblcSUBFAM.SetFocus;
  end
  else
    dblcSUBFAM.Enabled := false;
end;

procedure TfraGrpFamSubfam.dblcSUBFAMExit(Sender: TObject);
begin
  edtSUBFAM.Text := DM1.DisplayDescrip('prvSUBFAM','TGE170','SFAMDES','SFAMID='+quotedStr(dblcSUBFAM.text),'SFAMDES');
end;

procedure TfraGrpFamSubfam.dblcGArtiChange(Sender: TObject);
begin
  sNewGArti := dblcGArti.Text;
end;

procedure TfraGrpFamSubfam.dblcFAMChange(Sender: TObject);
begin
  sNewFAM  := dblcFAM.text;
end;

procedure TfraGrpFamSubfam.dblcTINIDChange(Sender: TObject);
begin
  sNewTINID := dblcTINID.Text;
end;

end.
