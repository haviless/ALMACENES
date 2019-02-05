unit ALM302;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbdlg, wwdbdatetimepicker, StdCtrls, DBCtrls, Mask, wwdbedit, Buttons,
  wwdblook, ExtCtrls;

type
  TFMovAlmEnt = class(TForm)
    pnlCabecera: TPanel;
    bvl4: TBevel;
    lblCIA: TLabel;
    lblNumNS: TLabel;
    lblObs: TLabel;
    Label2: TLabel;
    lblFReg: TLabel;
    lblTDocumento: TLabel;
    lblNDoc: TLabel;
    lblFDoc: TLabel;
    lblTransacc: TLabel;
    lblCC: TLabel;
    lblProv: TLabel;
    Label7: TLabel;
    lblNOC: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edNOrdC: TEdit;
    dblcCIA: TwwDBLookupCombo;
    Z2bbtnOK: TBitBtn;
    Z2bbtnBorrar: TBitBtn;
    dbeNumNISA: TwwDBEdit;
    dbmObs: TDBMemo;
    dbeCIA: TwwDBEdit;
    dblcTALM: TwwDBLookupCombo;
    dbeALM: TwwDBEdit;
    dbdtpFNS: TwwDBDateTimePicker;
    dbeTDOC: TwwDBEdit;
    dbeNDoc: TwwDBEdit;
    dbdtpFDoc: TwwDBDateTimePicker;
    dblcdTDOC: TwwDBLookupComboDlg;
    dblcTransac: TwwDBLookupCombo;
    dbeTransac: TwwDBEdit;
    dblcdCC: TwwDBLookupComboDlg;
    dbeCC: TwwDBEdit;
    dblcdProv: TwwDBLookupComboDlg;
    dbeProv: TwwDBEdit;
    dblcTDA: TwwDBLookupCombo;
    dbeTDNISA: TwwDBEdit;
    btnOC: TButton;
    dblcLOC: TwwDBLookupCombo;
    dbeLOC: TwwDBEdit;
    dbeLote: TwwDBEdit;
    dbePO: TwwDBEdit;
    dbeNP: TwwDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMovAlmEnt: TFMovAlmEnt;

implementation

uses ALMDM1;
  

{$R *.DFM}

end.

