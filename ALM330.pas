unit ALM330;

// Actualizaciones
// HPC_201605_ALM 02/06/2016 Se crea Formulario
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
// HPC_201801_ALM 03/04/2018 Cambios por búsqueda de Cliente
//

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppVar, ppDB, ppDBPipe, ppEndUsr, ppParameter, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, StdCtrls,
  Buttons, Wwdbigrd, Grids, Wwdbgrid, ComCtrls, ExtCtrls, Wwdbdlg,
  wwdbdatetimepicker, Mask, wwdbedit, wwdblook;

type
  TFRevalorizaNCre = class(TForm)
    pnlDetalle: TPanel;
    pc1: TPageControl;
    ts1: TTabSheet;
    pnlPendientes: TPanel;
    Label1: TLabel;
    dbgPendientes: TwwDBGrid;
    ts2: TTabSheet;
    pnlDetCxC: TPanel;
    Label5: TLabel;
    dbgDetCxC: TwwDBGrid;
    btnActReg: TwwIButton;
    pnlRegistro: TPanel;
    lblTipReg: TLabel;
    lblCnpEgr: TLabel;
    lblDH: TLabel;
    lblImporte: TLabel;
    lblGlosa: TLabel;
    lblCuenta: TLabel;
    lblCCosto: TLabel;
    lblTipPre: TLabel;
    lblPresu: TLabel;
    edtTipReg: TEdit;
    dbeImporte: TwwDBEdit;
    dbeDH: TwwDBEdit;
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;
    dbeCuenta: TwwDBEdit;
    dbeGlosa: TwwDBEdit;
    dblcTipReg: TwwDBLookupCombo;
    dblcdCnpEgr: TwwDBLookupComboDlg;
    StaticText1: TStaticText;
    dblcdCCosto: TwwDBLookupComboDlg;
    edtCCosto: TEdit;
    dblcTipPre: TwwDBLookupCombo;
    dbeTipPre: TwwDBEdit;
    dblcdPresup: TwwDBLookupComboDlg;
    edtPresup: TEdit;
    edtFinal: TEdit;
    cbDisenoRep: TCheckBox;
    pnlPie: TPanel;
    Label6: TLabel;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    pprptNotaCred: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText14: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppdbtGlosa: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppdbcMtoOri: TppDBCalc;
    pplblNCSEUO: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList1: TppParameterList;
    ppDesigner1: TppDesigner;
    ppdbpNotaCred: TppDBPipeline;
    ppdbpPreview: TppDBPipeline;
    ppField61: TppField;
    ppField62: TppField;
    ppField63: TppField;
    ppField64: TppField;
    ppField65: TppField;
    ppField66: TppField;
    ppField67: TppField;
    ppField68: TppField;
    ppField69: TppField;
    ppField70: TppField;
    ppField71: TppField;
    ppField72: TppField;
    ppField73: TppField;
    ppField74: TppField;
    ppField75: TppField;
    ppField76: TppField;
    ppField77: TppField;
    ppField78: TppField;
    ppField79: TppField;
    ppField80: TppField;
    ppField81: TppField;
    ppField82: TppField;
    ppField83: TppField;
    ppField84: TppField;
    ppField85: TppField;
    ppField86: TppField;
    ppField87: TppField;
    ppField88: TppField;
    ppField89: TppField;
    ppField90: TppField;
    ppField91: TppField;
    ppField92: TppField;
    ppField93: TppField;
    ppField94: TppField;
    ppField95: TppField;
    ppField96: TppField;
    ppField97: TppField;
    ppField98: TppField;
    ppField99: TppField;
    ppField100: TppField;
    ppField101: TppField;
    ppField102: TppField;
    ppField103: TppField;
    ppField104: TppField;
    ppField105: TppField;
    ppField106: TppField;
    ppField107: TppField;
    ppField108: TppField;
    ppField109: TppField;
    ppField110: TppField;
    ppField111: TppField;
    ppField112: TppField;
    ppField113: TppField;
    ppField114: TppField;
    ppField115: TppField;
    ppField116: TppField;
    ppField117: TppField;
    ppField118: TppField;
    ppField119: TppField;
    pprRNCD: TppReport;
    ppHeaderBand1: TppHeaderBand;
    pplblNCDRazon: TppLabel;
    pplblNCDDir: TppLabel;
    pplblNCDRUC: TppLabel;
    pplblNCDFactura: TppLabel;
    pplblNCDFacFecha: TppLabel;
    pplblNCDConPagoId: TppLabel;
    pplblNCDVendedor: TppLabel;
    pplblNCDClie: TppLabel;
    pplblNCDAno: TppLabel;
    pplblNCDFEmision: TppLabel;
    pplblNCDNumero: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppFooterBand1: TppFooterBand;
    pplblNCDIGV: TppLabel;
    pplblNCDTotal: TppLabel;
    pplblNCDLetras: TppLabel;
    ppLabel50: TppLabel;
    pplblNCDDIA: TppLabel;
    pplblNCDMes: TppLabel;
    pplblNCDAno1: TppLabel;
    pplblNCDNETO: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppdbpNCD: TppDBPipeline;
    pprPreview: TppReport;
    ppHeaderBand5: TppHeaderBand;
    lblVCiaDes: TppLabel;
    ppsV4: TppSystemVariable;
    lblV30: TppLabel;
    ppsV5: TppSystemVariable;
    lblV1: TppLabel;
    lblV2: TppLabel;
    lblV25: TppLabel;
    lblV26: TppLabel;
    lblVTD: TppLabel;
    lblVDiario: TppLabel;
    lblVPeriodo: TppLabel;
    lblVNoCompro: TppLabel;
    lblV27: TppLabel;
    lblVProveedor: TppLabel;
    lblV28: TppLabel;
    lblVmoneda: TppLabel;
    lblV29: TppLabel;
    lblVTipoCamb: TppLabel;
    lblV31: TppLabel;
    lblVGlosa: TppLabel;
    lblV32: TppLabel;
    lblV33: TppLabel;
    lblV34: TppLabel;
    lblV3: TppLabel;
    lblV4: TppLabel;
    lblV5: TppLabel;
    lblV6: TppLabel;
    lblV7: TppLabel;
    lblV8: TppLabel;
    lblV9: TppLabel;
    lblV10: TppLabel;
    lblVauxiliar: TppLabel;
    ppDBVText30: TppDBText;
    lblV11: TppLabel;
    ppDBVText31: TppDBText;
    lblV12: TppLabel;
    lblVMesDia: TppLabel;
    ppDBVText32: TppDBText;
    lblV13: TppLabel;
    lblVEstado: TppLabel;
    lblV14: TppLabel;
    lblV47: TppLabel;
    lblV48: TppLabel;
    lblV49: TppLabel;
    lblV50: TppLabel;
    lblB15: TppLabel;
    lblV16: TppLabel;
    lblV17: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBVText33: TppDBText;
    ppDBVText34: TppDBText;
    ppDBVText35: TppDBText;
    ppDBVText36: TppDBText;
    ppDBVText4: TppDBText;
    ppVtDesc: TppDBText;
    ppDBVText5: TppDBText;
    ppDBVText6: TppDBText;
    ppDBVText8: TppDBText;
    ppDBVText9: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDBVCalc6: TppDBCalc;
    ppDBVCalc7: TppDBCalc;
    lblV18: TppLabel;
    pnlDocCanje: TPanel;
    lblTMon: TLabel;
    pnlCabecera: TPanel;
    GroupBox1: TGroupBox;
    lblCia: TLabel;
    Label3: TLabel;
    lblNoDoc: TLabel;
    lblFEmis: TLabel;
    Label2: TLabel;
    lblFComprob: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dblcCia: TComboBox;
    edtSerie: TEdit;
    edtNoDoc: TwwDBEdit;
    dtpFEmis: TwwDBDateTimePicker;
    dblcTMon: TComboBox;
    dtpFComp: TwwDBDateTimePicker;
    bbtnAcepta: TBitBtn;
    edtMonto: TEdit;
    edtTcambio: TEdit;
    edtRucProv: TEdit;
    edtDesprov: TEdit;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtArtid: TEdit;
    edtArtdes: TEdit;
    edtAplic: TEdit;
    edtCosto: TEdit;
    bbtnOK: TBitBtn;
    bbtnAdd: TBitBtn;
    edtArtid2: TEdit;
    edtArtdes2: TEdit;
    edtAplic2: TEdit;
    edtCosto2: TEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label4: TLabel;
    edtNoDocP: TwwDBEdit;
    dtpFEmisP: TwwDBDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtArtid3: TEdit;
    edtArtdes3: TEdit;
    edtAplic3: TEdit;
    edtCosto3: TEdit;
    edtArtid4: TEdit;
    edtArtdes4: TEdit;
    edtAplic4: TEdit;
    edtCosto4: TEdit;
    edtArtid5: TEdit;
    edtArtdes5: TEdit;
    edtAplic5: TEdit;
    edtCosto5: TEdit;
    edtSerieP: TEdit;
    dblcTMonP: TComboBox;
    edtMontoP: TEdit;
    dblcTdocP: TComboBox;
    edtCodProv: TEdit;
    Label20: TLabel;
    bbtn2Add: TButton;
    bbtn3Add: TButton;
    bbtn4Add: TButton;
    bbtn5Add: TButton;
// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
    edtArtid6: TEdit;
    edtArtid7: TEdit;
    edtArtid8: TEdit;
    edtArtdes6: TEdit;
    edtArtdes7: TEdit;
    edtArtdes8: TEdit;
    edtAplic6: TEdit;
    edtAplic7: TEdit;
    edtAplic8: TEdit;
    edtCosto6: TEdit;
    edtCosto7: TEdit;
    edtCosto8: TEdit;
    bbtn6Add: TButton;
    bbtn7Add: TButton;
    bbtn8Add: TButton;
    edtArtid9: TEdit;
    edtArtid10: TEdit;
    edtArtdes9: TEdit;
    edtArtdes10: TEdit;
    edtAplic9: TEdit;
    edtAplic10: TEdit;
    edtCosto9: TEdit;
    edtCosto10: TEdit;
    bbtn9Add: TButton;
    bbtn10Add: TButton;
    bbtnPagS: TBitBtn;
    bbtnPagA: TBitBtn;
    dblcTD: TComboBox;
    edtArtid11: TEdit;
    edtArtid12: TEdit;
    edtArtid13: TEdit;
    edtArtid14: TEdit;
    edtArtid15: TEdit;
    edtArtid16: TEdit;
    edtArtid17: TEdit;
    edtArtid18: TEdit;
    edtArtid19: TEdit;
    edtArtid20: TEdit;
    edtArtdes11: TEdit;
    edtArtdes12: TEdit;
    edtArtdes13: TEdit;
    edtArtdes14: TEdit;
    edtArtdes15: TEdit;
    edtArtdes16: TEdit;
    edtArtdes17: TEdit;
    edtArtdes18: TEdit;
    edtArtdes19: TEdit;
    edtArtdes20: TEdit;
    edtAplic11: TEdit;
    edtAplic12: TEdit;
    edtAplic13: TEdit;
    edtAplic14: TEdit;
    edtAplic15: TEdit;
    edtAplic16: TEdit;
    edtAplic17: TEdit;
    edtAplic18: TEdit;
    edtAplic19: TEdit;
    edtAplic20: TEdit;
    edtCosto11: TEdit;
    edtCosto12: TEdit;
    edtCosto13: TEdit;
    edtCosto14: TEdit;
    edtCosto15: TEdit;
    edtCosto16: TEdit;
    edtCosto17: TEdit;
    edtCosto18: TEdit;
    edtCosto19: TEdit;
    edtCosto20: TEdit;
    bbtn11Add: TBitBtn;
    bbtn12Add: TButton;
    bbtn13Add: TButton;
    bbtn14Add: TButton;
    bbtn15Add: TButton;
    bbtn16Add: TButton;
    bbtn17Add: TButton;
    bbtn18Add: TButton;
    bbtn19Add: TButton;
    bbtn20Add: TButton;
// Fin HPC_201801_ALM

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    Procedure bbtnOKClick(Sender: TObject);

    Procedure dbgCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; Var Accept: Boolean);
    Procedure dtpFCompExit(Sender: TObject);
    Procedure LlenaDetCxC;
    Procedure dbgPendientes2DragOver(Sender, Source: TObject; X,
         Y: Integer; State: TDragState; Var Accept: Boolean);
    Procedure dbgDetCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; Var Accept: Boolean);
    Procedure dbgDetCxCMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
    Procedure bbtnDel1DragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; Var Accept: Boolean);
    Procedure bbtnCalcClick(Sender: TObject);
    Procedure edtSerieXExit(Sender: TObject);
    Procedure edtSerieXKeyPress(Sender: TObject; Var Key: Char);
    Procedure dblcdClieKeyPress(Sender: TObject; Var Key: Char);
    Procedure dblcdClieRucKeyPress(Sender: TObject; Var Key: Char);
    Procedure edtNoDocKeyPress(Sender: TObject; Var Key: Char);
    Procedure dtpFCompKeyPress(Sender: TObject; Var Key: Char);
    Procedure dbeLoteKeyPress(Sender: TObject; Var Key: Char);

    Procedure FormCreate(Sender: TObject);
    Procedure bbtnAceptaClick(Sender: TObject);
    Procedure dbgPendientesMouseDown(Sender: TObject;
         Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    Procedure InicializaPnlCab2;
    Procedure dbgPendientesDragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; Var Accept: Boolean);
    Procedure dblcTipPreExit(Sender: TObject);
    Procedure ppHeaderBand2BeforePrint(Sender: TObject);
    Procedure ppFooterBand2BeforePrint(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtnAddClick(Sender: TObject);
    procedure bbtn2AddClick(Sender: TObject);
    procedure bbtn3AddClick(Sender: TObject);
    procedure bbtn4AddClick(Sender: TObject);
    procedure bbtn5AddClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Z2bbtnAceptaClick(Sender: TObject);
// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
//    procedure GroupBox2Click(Sender: TObject);
//    procedure BitBtn3Click(Sender: TObject);
    procedure bbtn6AddClick(Sender: TObject);
    procedure bbtn7AddClick(Sender: TObject);
    procedure bbtn8AddClick(Sender: TObject);
    procedure bbtn9AddClick(Sender: TObject);
    procedure bbtn10AddClick(Sender: TObject);
    procedure bbtnPagSClick(Sender: TObject);

    procedure LimpiaPagina1;
    procedure LimpiaPagina2;
    procedure LimpiaPagina22;
    procedure MuestraPagina1;
    procedure MuestraPagina2;
    procedure bbtnPagAClick(Sender: TObject);
    procedure bbtn11AddClick(Sender: TObject);
    procedure bbtn12AddClick(Sender: TObject);
    procedure bbtn13AddClick(Sender: TObject);
    procedure bbtn14AddClick(Sender: TObject);
    procedure bbtn15AddClick(Sender: TObject);
    procedure bbtn16AddClick(Sender: TObject);
    procedure bbtn17AddClick(Sender: TObject);
    procedure bbtn18AddClick(Sender: TObject);
    procedure bbtn20AddClick(Sender: TObject);
    procedure bbtn19AddClick(Sender: TObject);
// Fin HPC_201801_ALM

  private
    { Private declarations }
    cFlagNI: Boolean;
    Procedure HabilitaCampos;
    Procedure DesHabilitaCampos;
        
  public
      { Public declarations }
      xxTCambio: Double;
      xTDA: String;
      
  end;

var
  FRevalorizaNCre: TFRevalorizaNCre;
  xCrea: Boolean;

  wSimbMn, wTDoc, wTDiar, wCje, wEstadTem: String;
  xTAutoNum, xTAno, xTMes: String;
  xFlGrid: Boolean;
  xAAMM: String;


implementation

Uses ALMDM1;

{$R *.dfm}

procedure TFRevalorizaNCre.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
end;




Procedure TFRevalorizaNCre.dtpFCompExit(Sender: TObject);
Var
   wLote, wMes, xWhere: String;
   Year, Month, Day: Word;
Begin
   If xCrea Then Exit;
//   If bbtnBorra.Focused Then Exit;

   If dtpFComp.date = 0 Then
   Begin
      dtpFComp.SetFocus;
      Raise Exception.Create(' Error :  Falta Registrar Fecha ');
   End;

   If Not DMALM.VerificaPeriodoVentas(dblcCia.text, dtpFComp.date) Then
   Begin
      dtpFComp.SetFocus;
      Exit;
   End;

   xWhere := 'TMONID='+quotedstr(DMALM.wTMonExt)
     + ' and FECHA=' + DMALM.wRepFuncDate+quotedstr(FORMATDATETIME(DMALM.wFormatFecha, dtpFComp.Date))+ ')';
   If length(BuscaQry('dspTGE', 'TGE107', 'TMONID,TCAM' + DMALM.wTipoCambioUsar, xWhere, 'TMonId')) > 0 Then
      xxTCambio := DMALM.cdsQry.FieldByName('TCAM' + DMALM.wTipoCambioUsar).AsFloat
   Else
   Begin
      dtpFComp.SetFocus;
      Raise Exception.Create(' Error :  Fecha No tiene Tipo de Cambio ');
   End;

   DecodeDate(dtpFComp.Date, Year, Month, Day);
   wMes := inttostr(Month);
   If Month < 10 Then wMes := '0' + inttostr(Month);
   xAAMM := IntToStr(Year) + wMes;
   xTAno := IntToStr(Year);
   xTMes := wMes;
   xWhere := 'CIAID=''' + dblcCia.Text + ''' AND TDiarId=' + '''' + wTDiar + '''' + ' and CCAnoMes=' + '''' + xAAMM + '''';
   Try
      wLote := DMALM.BuscaUltTGE('dspTGE', 'CXC301', 'CCLote', xWhere);
   Except
      wLote := '0000';
   End;
End;

Procedure TFRevalorizaNCre.dbgPendientesMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
   dbgPendientes.BeginDrag(False);
End;

Procedure TFRevalorizaNCre.dbgCanjeDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;

Procedure TFRevalorizaNCre.LlenaDetCxC;
Begin
   With DMALM Do
   Begin

   End;
End;

Procedure TFRevalorizaNCre.dbgPendientes2DragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;

Procedure TFRevalorizaNCre.dbgDetCanjeDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;


Procedure TFRevalorizaNCre.dbgDetCxCMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
   dbgDetCxC.BeginDrag(False);
End;

Procedure TFRevalorizaNCre.bbtnDel1DragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;

Procedure TFRevalorizaNCre.bbtnCalcClick(Sender: TObject);
Begin
   WinExec('C:\windows\calc.exe', 1); // Executa Aplicación
End;


Procedure TFRevalorizaNCre.InicializaPnlCab2;
Begin
   dtpFComp.date := 0;
   dblcTMon.Text := '';
   dtpFEmis.date := 0;
End;

Procedure TFRevalorizaNCre.edtSerieXExit(Sender: TObject);
Begin
   If xCrea Then Exit;

//   If bbtnBorra.Focused Then Exit;
   If length(edtSerie.Text) = 0 Then
   Begin
      ShowMessage('Falta No.Serie');
      edtSerie.SetFocus;
   End;
End;

Procedure TFRevalorizaNCre.edtSerieXKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then edtNoDoc.setfocus;
End;


Procedure TFRevalorizaNCre.dblcdClieKeyPress(Sender: TObject; Var Key: Char);
Begin
//   If Key = #13 Then dblcdClieRuc.setfocus;
End;

Procedure TFRevalorizaNCre.dblcdClieRucKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then edtSerie.setfocus;
End;

Procedure TFRevalorizaNCre.edtNoDocKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then dtpFComp.setfocus;
End;

Procedure TFRevalorizaNCre.dtpFCompKeyPress(Sender: TObject; Var Key: Char);
Begin
//   If Key = #13 Then dbeNoReg.setfocus;
End;

Procedure TFRevalorizaNCre.dbeLoteKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then dblcTMon.setfocus;
End;


Procedure TFRevalorizaNCre.FormCreate(Sender: TObject);
Begin

   cbDisenoRep.Visible := True;
End;


Procedure TFRevalorizaNCre.dbgPendientesDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;


Procedure TFRevalorizaNCre.bbtnAceptaClick(Sender: TObject);

Var
   xSQL : String;
   v_ciaid, v_tipodoc, v_msg, v_fecha_app, v_tcambio, v_desprov, v_continua :  String;
   v_Dia, v_Mes, v_Ano: Word;
   v_Hoy: TDateTime;

Begin

//     Inicio Ejecucion SP
   v_tipodoc := '07';
   v_continua := 'S';
   If  dblcCia.text ='' Then
       v_continua := 'Ingrese Compañía...'
   Else
       If  edtSerie.text ='' Then
           v_continua := 'Ingrese Serie de NC...'
       Else
           If edtNoDoc.text ='' Then
               v_continua := 'Ingrese Número de NC...' 
           Else
              If edtRucProv.text ='' Then
                 v_continua := 'Ingrese RUC de Proveedor de NC...'
              Else
                 If dtpFEmis.text ='' Then
                    v_continua := 'Ingrese Fecha Emisión de NC...'
                 Else
                    If dblcTMon.text ='' Then
                       v_continua := 'Ingrese Moneda de NC...'
                    Else
                       If edtMonto.text ='' Then
                          v_continua := 'Ingrese Monto de NC...' ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
          exit;
   End
   Else
   Begin

// Valida Existencia de NC
        v_continua := 'S';
        DMALM.DCOM1.AppServer.IniciaTransaccion;
        xSQL  := 'select PROV_ID, FECHA_APL '
         +       'from db2admin.LOG_REVAL_CAB '
         +       '     where ciaid  = ' + QuotedStr(dblcCia.Text)
         +       '     and  tipdoc  = ' + QuotedStr(v_tipodoc)
         +       '     and seriedoc = ' + QuotedStr(edtSerie.Text)
         +       '     and numdoc   = ' + QuotedStr(edtNoDoc.Text)
         +       '     and rucprov  = ' + QuotedStr(edtRucProv.Text) ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;


        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtCodProv.text := DMALM.cdsQry.FieldByName('PROV_ID').AsString;
           dtpFComp.text := DMALM.cdsQry.FieldByName('FECHA_APL').AsString;
           v_continua := 'Nota de Crédito ya fue Ingresada! ';
        End;

// Valida Existencia de Proveedor
        DMALM.DCOM1.AppServer.IniciaTransaccion;
        xSQL  := 'select PROVDES, PROV '
         +       ' from db2admin.TGE201 '
         +       '     where provruc  = ' + QuotedStr(edtRucProv.Text)
         +       '     and   activo  = ''S'' ' ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtDesprov.text := DMALM.cdsQry.FieldByName('PROVDES').AsString;
           edtCodProv.text := DMALM.cdsQry.FieldByName('PROV').AsString;
        End
        Else
        Begin
           v_continua := 'Proveedor NO Existe, Revise RUC! ';
        End ;

// Valida Existencia de Tipo de Cambio del Día
        DMALM.DCOM1.AppServer.IniciaTransaccion;
        xSQL  := 'select TCAMVBV '
         +       'from db2admin.TGE107 '
         +       '     where fecha  = to_char(sysdate,''dd/mm/yyyy'') ' ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
           edtTcambio.text := DMALM.cdsQry.FieldByName('TCAMVBV').AsString
        Else
        Begin
           v_continua := 'Tipo de Cambio del día aún no se ha registrado, avise a Contabilidad! ';

        End ;

        If v_continua <> 'S'   Then
              ShowMessage(v_continua)  //;
        Else
        Begin
          GroupBox3.enabled := True;
          GroupBox3.visible := True;
          dtpFComp.date :=  Date;//DatetoStr(v_Hoy) ;
        End;



//   Fin Ejecucion SP

  End;
End;


procedure TFRevalorizaNCre.BitBtn1Click(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
   v_femisp: TDateTime;
Begin
// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
   LimpiaPagina22;
// Fin HPC_201801_ALM

   v_continua := 'S';
   If  dblcTdocP.text ='' Then
       v_continua := 'Ingrese Tipo Documento de Documento Relacionado...'
   Else
       If  edtSerieP.text ='' Then
           v_continua := 'Ingrese Serie de Documento Relacionado...'
       Else
           If  edtNoDocP.text ='' Then
               v_continua := 'Ingrese Número de Documento Relacionado...'   ;


   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'select CPFEMIS, TMONID, CPMTOORI '
         +  'from db2admin.cxp301 '
         +  '     where docid = ' + QuotedStr(dblcTdocP.Text)
         +  '     and cpserie = ' + QuotedStr(edtSerieP.Text)
         +  '     and cpnodoc = ' + QuotedStr(edtNoDocP.Text)
         +  '     and provruc = ' + QuotedStr(edtRucProv.Text)
         +  '     and cpestado in (''C'', ''P'')';

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           v_femisp := DMALM.cdsQry.FieldByName('CPFEMIS').AsDateTime;
           dtpFEmisP.date := v_femisp;
           dblcTMonP.text := DMALM.cdsQry.FieldByName('TMONID').AsString;
           edtMontoP.text := DMALM.cdsQry.FieldByName('CPMTOORI').AsString;
           GroupBox2.enabled := True;
           GroupBox2.visible := True;
        End
        Else
        Begin
           ShowMessage('Documento NO Existe para este Proveedor!!! ');
           GroupBox2.enabled := False;
           GroupBox2.visible := False;
           Exit;
        End;
     End;

end;


procedure TFRevalorizaNCre.bbtnAddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
           If  StrToFloat(edtAplic.text) < StrToFloat(edtMonto.text) Then
           Begin
               edtArtid2.visible := True;
               edtArtdes2.visible := True;
               edtAplic2.visible := True;
               edtCosto2.visible := True;
               bbtn2Add.visible := True;
           End
           Else
           Begin
               edtArtid2.visible := False;
               edtArtdes2.visible := False;
               edtAplic2.visible := False;
               edtCosto2.visible := False;
               bbtn2Add.visible := False;
           End;
        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;


Procedure TFRevalorizaNCre.bbtnOKClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin
   Z2bbtnGraba.Enabled  := False;
   v_continua := 'S';
// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
   If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
        StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
        StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)) > StrToFloat(edtMonto.text) Then
   Begin
        v_continua := 'Sumatoria de Importes a Aplicar es MAYOR al Total de la NC. Revise!' ;
   End
   Else
        If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
             StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
             StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)) < StrToFloat(edtMonto.text) Then
        Begin
            v_continua := 'Sumatoria de Importes a Aplicar es MENOR al Total de la NC. Revise!' ;
        End
        Else
          Begin
            Z2bbtnGraba.Enabled  := True;
            v_continua := 'S';
          End;
// Fin HPC_201801_ALM

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
        Z2bbtnGraba.Enabled  := True;
        DesHabilitaCampos;
        Exit;
   End;

End;


Procedure TFRevalorizaNCre.dblcTipPreExit(Sender: TObject);
Begin
   If xCrea = true Then exit;
   If bbtnRegCanc.Focused Then exit;
   If dblcdCCosto.Focused Then exit;

   If dblcTipReg.Focused Then exit;
   If Length(dblcTipPre.Text) = 0 Then
   Begin
      Raise exception.Create('Falta Tipo de Presupuesto');
      dblcTipPre.SetFocus;
   End;
End;


Procedure TFRevalorizaNCre.ppHeaderBand2BeforePrint(Sender: TObject);
Var
   sDocid, sSerie, sDocumento, sWhere, sCanje: String;
   sVendedor, sDesDoc, sComerid, sDesConPago: String;
Begin
End;

Procedure TFRevalorizaNCre.ppFooterBand2BeforePrint(Sender: TObject);
Var
   xIgv, xTotal: Double;
Begin
End;

procedure TFRevalorizaNCre.bbtn2AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid2.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic2.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid2.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes2.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto2.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
           If  (StrToFloat(edtAplic2.text) + StrToFloat(edtAplic.text)) < StrToFloat(edtMonto.text) Then
           Begin
               edtArtid3.visible  := True;
               edtArtdes3.visible := True;
               edtAplic3.visible  := True;
               edtCosto3.visible  := True;
               bbtn3Add.visible   := True;
           End
           Else
           Begin
               edtArtid3.visible  := False;
               edtArtdes3.visible := False;
               edtAplic3.visible  := False;
               edtCosto3.visible  := False;
               bbtn3Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;

procedure TFRevalorizaNCre.bbtn3AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid3.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic3.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid3.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes3.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto3.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
           If  (StrToFloat(edtAplic3.text) + StrToFloat(edtAplic2.text) + StrToFloat(edtAplic.text)) < StrToFloat(edtMonto.text) Then
           Begin
               edtArtid4.visible  := True;
               edtArtdes4.visible := True;
               edtAplic4.visible  := True;
               edtCosto4.visible  := True;
               bbtn4Add.visible   := True;
           End
           Else
           Begin
               edtArtid4.visible  := False;
               edtArtdes4.visible := False;
               edtAplic4.visible  := False;
               edtCosto4.visible  := False;
               bbtn4Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;

procedure TFRevalorizaNCre.bbtn4AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid4.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic4.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid4.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes4.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto4.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
           If  (StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) + StrToFloat(edtAplic2.text) + StrToFloat(edtAplic.text)) < StrToFloat(edtMonto.text) Then
           Begin
               edtArtid5.visible  := True;
               edtArtdes5.visible := True;
               edtAplic5.visible  := True;
               edtCosto5.visible  := True;
               bbtn5Add.visible   := True;
           End
           Else
           Begin
               edtArtid5.visible  := False;
               edtArtdes5.visible := False;
               edtAplic5.visible  := False;
               edtCosto5.visible  := False;
               bbtn5Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;

procedure TFRevalorizaNCre.bbtn5AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid5.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic5.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid5.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes5.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto5.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
           // Inicio HPC_201801_ALM
           // Cambio en pruebas por Búsqueda en Maestro de Clientes
           If  (StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) + StrToFloat(edtAplic2.text) + StrToFloat(edtAplic.text)) < StrToFloat(edtMonto.text) Then
           Begin
               edtArtid6.visible  := True;
               edtArtdes6.visible := True;
               edtAplic6.visible  := True;
               edtCosto6.visible  := True;
               bbtn6Add.visible   := True;
           End
           Else
           Begin
               edtArtid6.visible  := False;
               edtArtdes6.visible := False;
               edtAplic6.visible  := False;
               edtCosto6.visible  := False;
               bbtn6Add.visible   := False;
           End;
           // Fin HPC_201801_ALM
        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;

procedure TFRevalorizaNCre.Z2bbtnGrabaClick(Sender: TObject);
Var
    v_totapl : Double;
    v_anomes, v_usuario, v_tipodoc, v_costonew, v_estado, v_mm : String;
    v_Dia, v_Mes, v_Ano: Word;
    v_Hoy: TDateTime;
begin
   If MessageDlg(' Se procederá a Revalorizar Items ingresados con la NC, Continuar ? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
   Begin
      HabilitaCampos;
      Z2bbtnGraba.Enabled  := False;
      Exit;
   End
   Else
      Begin
         v_totapl :=  StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                      StrToFloat(edtAplic2.text) + StrToFloat(edtAplic.text) ;
         v_Hoy := Now;
         DecodeDate(v_Hoy, v_Ano, v_Mes, v_Dia);
         if   length(IntToStr(v_mes)) = 1 Then
              v_mm := concat('0', IntToStr(v_Mes))
         else v_mm := IntToStr(v_Mes);
         v_anomes :=  concat( IntToStr(v_Ano), v_mm) ;

         v_usuario := DMALM.wUsuario;
         v_tipodoc := '07';
         v_estado := 'INICIAL';

// Insertando Cabecera
         xSQL := 'Insert into db2admin.LOG_REVAL_CAB (CIAID, TIPDOC, SERIEDOC, NUMDOC, FECHADOC, '
               + '                           PROV_ID, TMONID, TOTAL_NC_MO, TOTAL_NC_ML, TOTAL_APL_ML, '
               + '                           TIPO_CAMB, FECHA_APL, ESTADO, LOGANOMM, USUARIO, RUCPROV ) '
               + '   values ('
               +              QuotedStr(dblcCIA.Text) + ', '
// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
//               +              QuotedStr(v_tipodoc) + ', '   dblcTD
               +              QuotedStr(dblcTD.text) + ', '
// Fin HPC_201801_ALM
               +              QuotedStr(edtSerie.text) + ', '
               +              QuotedStr(edtNoDoc.text) + ', '
               +              QuotedStr(dtpFEmis.text) + ', '
               +              QuotedStr(edtCodProv.text) + ', '
               +              QuotedStr(dblcTMon.text) + ', '
               +              QuotedStr(edtMonto.text) + ', '
               +              QuotedStr(edtMonto.text) + ', '
               +              QuotedStr(edtMonto.text) + ', '
               +              QuotedStr(edtTcambio.text) + ', '
               +              QuotedStr(dtpFComp.text) + ', '
               +              QuotedStr(v_estado) + ', '
               +              QuotedStr(v_anomes) + ', '
               +              QuotedStr(v_usuario) + ', '
               +              QuotedStr(edtRucProv.text) + ' )' ;
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al Actualizar Nota de Crédito - Cab');
            exit;
         End;

// Insertando Pie
         xSQL := 'Insert into db2admin.LOG_REVAL_PIE (CIAID, TIPDOC, SERIEDOC, NUMDOC, TIPDOC_REL, SERIE_REL, '
               + '                           NUMDOC_REL, FECHA_REL, TMONID_REL, TOTAL_REL, RUCPROV ) '
               + '   values ('
               +              QuotedStr(dblcCIA.Text) + ', '
               +              QuotedStr(v_tipodoc) + ', '
               +              QuotedStr(edtSerie.text) + ', '
               +              QuotedStr(edtNoDoc.text) + ', '
               +              QuotedStr(dblcTdocP.text) + ', '
               +              QuotedStr(edtSerieP.text) + ', '
               +              QuotedStr(edtNoDocP.text) + ', '
               +              QuotedStr(dtpFEmisP.text) + ', '
               +              QuotedStr(dblcTMonP.text) + ', '
               +              QuotedStr(edtMontoP.text) + ', '
               +              QuotedStr(edtRucProv.text) + ' )' ;
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al Actualizar Nota de Crédito - Pie');
            exit;
         End;

// Insertando Detalle
         v_costonew := '0';
         xSQL := 'Insert into db2admin.LOG_REVAL_DET (CIAID, TIPDOC, SERIEDOC, NUMDOC, ARTID, IMP_APL, '
               + '                           COSTOP_ANT, COSTOP_ACT, RUCPROV ) '
               + '   Select '
               +              QuotedStr(dblcCIA.Text) + ', '
               +              QuotedStr(v_tipodoc) + ', '
               +              QuotedStr(edtSerie.text) + ', '
               +              QuotedStr(edtNoDoc.text) + ', '
               +              QuotedStr(edtArtid.text) + ', '
               +              QuotedStr(edtAplic.text) + ', '
               +              QuotedStr(edtCosto.text) + ', '
               +              QuotedStr(v_costonew) + ', '
               +              QuotedStr(edtRucProv.text) + ' From DUAL ' ;

         If  edtArtid2.text <> '' Then
         Begin
         xSQL := xSQL + '   Union All  Select'
               +              QuotedStr(dblcCIA.Text) + ', '
               +              QuotedStr(v_tipodoc) + ', '
               +              QuotedStr(edtSerie.text) + ', '
               +              QuotedStr(edtNoDoc.text) + ', '
               +              QuotedStr(edtArtid2.text) + ', '
               +              QuotedStr(edtAplic2.text) + ', '
               +              QuotedStr(edtCosto2.text) + ', '
               +              QuotedStr(v_costonew) + ', '
               +              QuotedStr(edtRucProv.text) + ' From DUAL ' ;
             If  edtArtid3.text <> '' Then
                 xSQL := xSQL + '   Union All  Select'
               +              QuotedStr(dblcCIA.Text) + ', '
               +              QuotedStr(v_tipodoc) + ', '
               +              QuotedStr(edtSerie.text) + ', '
               +              QuotedStr(edtNoDoc.text) + ', '
               +              QuotedStr(edtArtid3.text) + ', '
               +              QuotedStr(edtAplic3.text) + ', '
               +              QuotedStr(edtCosto3.text) + ', '
               +              QuotedStr(v_costonew) + ', '
               +              QuotedStr(edtRucProv.text) + ' From DUAL ' ;

                 If edtArtid4.text <> '' Then
                    xSQL := xSQL + '   Union All  Select'
               +              QuotedStr(dblcCIA.Text) + ', '
               +              QuotedStr(v_tipodoc) + ', '
               +              QuotedStr(edtSerie.text) + ', '
               +              QuotedStr(edtNoDoc.text) + ', '
               +              QuotedStr(edtArtid4.text) + ', '
               +              QuotedStr(edtAplic4.text) + ', '
               +              QuotedStr(edtCosto4.text) + ', '
               +              QuotedStr(v_costonew) + ', '
               +              QuotedStr(edtRucProv.text) + ' From DUAL ' ;

                    If edtArtid5.text <> '' Then
                       xSQL := xSQL + '   Union All  Select'
               +              QuotedStr(dblcCIA.Text) + ', '
               +              QuotedStr(v_tipodoc) + ', '
               +              QuotedStr(edtSerie.text) + ', '
               +              QuotedStr(edtNoDoc.text) + ', '
               +              QuotedStr(edtArtid5.text) + ', '
               +              QuotedStr(edtAplic5.text) + ', '
               +              QuotedStr(edtCosto5.text) + ', '
               +              QuotedStr(v_costonew) + ', '
               +              QuotedStr(edtRucProv.text) + ' From DUAL ' ;


         End ;

         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al Actualizar Nota de Crédito - Det');
            exit;
         End;

         DMALM.DCOM1.AppServer.GrabaTransaccion;

         DMALM.DCOM1.AppServer.IniciaTransaccion;
         xSQL :=  ' Declare v_err_num varchar2(2); v_err_msg varchar2(500);'
                + ' Begin db2admin.SP_ALM_REVAL_INV_NC('
                + QuotedStr(dblcCia.text) + ','
                + QuotedStr(v_tipodoc)  + ','
                + QuotedStr(edtSerie.text) + ','
                + QuotedStr(edtNoDoc.text) + ','
                + QuotedStr(edtRucProv.text) + ','
                + 'v_err_num, v_err_msg); End;' ;
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

         Except
            ShowMessage('Error al Ejecutar SP_ALM_REVAL_INV_NC ');
            DMALM.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            exit;

      End;

            ShowMessage('Proceso de Revalorización Terminó Correctamente ');
            Z2bbtnGraba.Enabled  := False;

            Exit;


   End;
end;

Procedure TFRevalorizaNCre.DesHabilitaCampos;
Begin
        dblcCia.enabled := False;
        edtSerie.enabled := False;
        edtNoDoc.enabled := False;
        dtpFEmis.enabled := False;
        edtRucProv.enabled := False;
        dblcTMon.enabled := False;
        edtMonto.enabled := False;

        edtNoDocP.enabled := False;
        edtSerieP.enabled := False;
        dblcTdocP.enabled := False;

        edtArtid.enabled := False;
        edtArtdes.enabled := False;
        edtAplic.enabled := False;
        edtArtid2.enabled := False;
        edtArtdes2.enabled := False;
        edtAplic2.enabled := False;
        edtArtid3.enabled := False;
        edtArtdes3.enabled := False;
        edtAplic3.enabled := False;
        edtArtid4.enabled := False;
        edtArtdes4.enabled := False;
        edtAplic4.enabled := False;
        edtArtid5.enabled := False;
        edtArtdes5.enabled := False;
        edtAplic5.enabled := False;

        bbtnOK.Enabled  := False;
        BitBtn1.Enabled  := False;
        bbtnAcepta.Enabled  := False;
        bbtnAdd.Enabled  := False;
        bbtn2Add.Enabled  := False;
        bbtn3Add.Enabled  := False;
        bbtn4Add.Enabled  := False;
        bbtn5Add.Enabled  := False;

End;

Procedure TFRevalorizaNCre.HabilitaCampos;
Begin
        dblcCia.enabled := True;
        edtSerie.enabled := True;
        edtNoDoc.enabled := True;
        dtpFEmis.enabled := True;
        edtRucProv.enabled := True;
        dblcTMon.enabled := True;
        edtMonto.enabled := True;

        edtNoDocP.enabled := True;
        edtSerieP.enabled := True;
        dblcTdocP.enabled := True;

        edtArtid.enabled := True;
        edtArtdes.enabled := True;
        edtAplic.enabled := True;
        edtArtid2.enabled := True;
        edtArtdes2.enabled := True;
        edtAplic2.enabled := True;
        edtArtid3.enabled := True;
        edtArtdes3.enabled := True;
        edtAplic3.enabled := True;
        edtArtid4.enabled := True;
        edtArtdes4.enabled := True;
        edtAplic4.enabled := True;
        edtArtid5.enabled := True;
        edtArtdes5.enabled := True;
        edtAplic5.enabled := True;

        bbtnOK.Enabled  := True;
        BitBtn1.Enabled  := True;
        bbtnAcepta.Enabled  := True;
        bbtnAdd.Enabled  := True;
        bbtn2Add.Enabled  := True;
        bbtn3Add.Enabled  := True;
        bbtn4Add.Enabled  := True;
        bbtn5Add.Enabled  := True;

End;



procedure TFRevalorizaNCre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFRevalorizaNCre.Z2bbtnAceptaClick(Sender: TObject);
begin
      //DMALM.cdsALM.DataRequest(xSQL);
end;

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn6AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid6.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic6.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid6.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes6.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto6.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
           If  (StrToFloat(edtAplic6.text) + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text) + StrToFloat(edtAplic.text)) < StrToFloat(edtMonto.text) Then
           Begin
               edtArtid7.visible  := True;
               edtArtdes7.visible := True;
               edtAplic7.visible  := True;
               edtCosto7.visible  := True;
               bbtn7Add.visible   := True;
           End
           Else
           Begin
               edtArtid7.visible  := False;
               edtArtdes7.visible := False;
               edtAplic7.visible  := False;
               edtCosto7.visible  := False;
               bbtn7Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn7AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid7.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic7.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid7.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes7.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto7.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
           If  (StrToFloat(edtAplic7.text) + StrToFloat(edtAplic6.text) + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) +
                StrToFloat(edtAplic3.text) + StrToFloat(edtAplic2.text) + StrToFloat(edtAplic.text)) < StrToFloat(edtMonto.text) Then
           Begin
               edtArtid8.visible  := True;
               edtArtdes8.visible := True;
               edtAplic8.visible  := True;
               edtCosto8.visible  := True;
               bbtn8Add.visible   := True;
           End
           Else
           Begin
               edtArtid8.visible  := False;
               edtArtdes8.visible := False;
               edtAplic8.visible  := False;
               edtCosto8.visible  := False;
               bbtn8Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn8AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid8.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic8.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid8.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes8.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto8.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
           If  (StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) + StrToFloat(edtAplic6.text) + StrToFloat(edtAplic5.text) +
                StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) + StrToFloat(edtAplic2.text) + StrToFloat(edtAplic.text)) < StrToFloat(edtMonto.text) Then
           Begin
               edtArtid9.visible  := True;
               edtArtdes9.visible := True;
               edtAplic9.visible  := True;
               edtCosto9.visible  := True;
               bbtn9Add.visible   := True;
           End
           Else
           Begin
               edtArtid9.visible  := False;
               edtArtdes9.visible := False;
               edtAplic9.visible  := False;
               edtCosto9.visible  := False;
               bbtn9Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn9AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid9.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic9.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid9.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes9.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto9.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
           If  (StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) + StrToFloat(edtAplic6.text) +
                StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) + StrToFloat(edtAplic2.text) +
                StrToFloat(edtAplic.text)) < StrToFloat(edtMonto.text) Then
           Begin
               edtArtid10.visible  := True;
               edtArtdes10.visible := True;
               edtAplic10.visible  := True;
               edtCosto10.visible  := True;
               bbtn10Add.visible   := True;
           End
           Else
           Begin
               edtArtid10.visible  := False;
               edtArtdes10.visible := False;
               edtAplic10.visible  := False;
               edtCosto10.visible  := False;
               bbtn10Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn10AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid10.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic10.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid10.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes10.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto10.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
           bbtnPagS.visible   := True;
           bbtnPagS.Enabled   := True;
{
           If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
                StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)) < StrToFloat(edtMonto.text) Then
           Begin
               edtArtid10.visible  := True;
               edtArtdes10.visible := True;
               edtAplic10.visible  := True;
               edtCosto10.visible  := True;
               bbtnPagS.visible   := True;
           End
           Else
           Begin
               edtArtid10.visible  := False;
               edtArtdes10.visible := False;
               edtAplic10.visible  := False;
               edtCosto10.visible  := False;
               bbtn10Add.visible   := False;
           End;
}
        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.LimpiaPagina1;
Begin
               edtArtid.visible  := False;
               edtArtid2.visible  := False;
               edtArtid3.visible  := False;
               edtArtid4.visible  := False;
               edtArtid5.visible  := False;
               edtArtid6.visible  := False;
               edtArtid7.visible  := False;
               edtArtid8.visible  := False;
               edtArtid9.visible  := False;
               edtArtid10.visible  := False;

               edtArtdes.visible := False;
               edtArtdes2.visible := False;
               edtArtdes3.visible := False;
               edtArtdes4.visible := False;
               edtArtdes5.visible := False;
               edtArtdes6.visible := False;
               edtArtdes7.visible := False;
               edtArtdes8.visible := False;
               edtArtdes9.visible := False;
               edtArtdes10.visible := False;

               edtAplic.visible  := False;
               edtAplic2.visible  := False;
               edtAplic3.visible  := False;
               edtAplic4.visible  := False;
               edtAplic5.visible  := False;
               edtAplic6.visible  := False;
               edtAplic7.visible  := False;
               edtAplic8.visible  := False;
               edtAplic9.visible  := False;
               edtAplic10.visible  := False;

               edtCosto.visible  := False;
               edtCosto2.visible  := False;
               edtCosto3.visible  := False;
               edtCosto4.visible  := False;
               edtCosto5.visible  := False;
               edtCosto6.visible  := False;
               edtCosto7.visible  := False;
               edtCosto8.visible  := False;
               edtCosto9.visible  := False;
               edtCosto10.visible  := False;

               bbtnAdd.visible   := False;
               bbtn2Add.visible   := False;
               bbtn3Add.visible   := False;
               bbtn4Add.visible   := False;
               bbtn5Add.visible   := False;
               bbtn6Add.visible   := False;
               bbtn7Add.visible   := False;
               bbtn8Add.visible   := False;
               bbtn9Add.visible   := False;
               bbtn10Add.visible   := False;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.MuestraPagina1;
Begin
               edtArtid.visible  := True;
               edtArtid2.visible  := True;
               edtArtid3.visible  := True;
               edtArtid4.visible  := True;
               edtArtid5.visible  := True;
               edtArtid6.visible  := True;
               edtArtid7.visible  := True;
               edtArtid8.visible  := True;
               edtArtid9.visible  := True;
               edtArtid10.visible  := True;

               edtArtdes.visible := True;
               edtArtdes2.visible := True;
               edtArtdes3.visible := True;
               edtArtdes4.visible := True;
               edtArtdes5.visible := True;
               edtArtdes6.visible := True;
               edtArtdes7.visible := True;
               edtArtdes8.visible := True;
               edtArtdes9.visible := True;
               edtArtdes10.visible := True;

               edtAplic.visible  := True;
               edtAplic2.visible  := True;
               edtAplic3.visible  := True;
               edtAplic4.visible  := True;
               edtAplic5.visible  := True;
               edtAplic6.visible  := True;
               edtAplic7.visible  := True;
               edtAplic8.visible  := True;
               edtAplic9.visible  := True;
               edtAplic10.visible  := True;

               edtCosto.visible  := True;
               edtCosto2.visible  := True;
               edtCosto3.visible  := True;
               edtCosto4.visible  := True;
               edtCosto5.visible  := True;
               edtCosto6.visible  := True;
               edtCosto7.visible  := True;
               edtCosto8.visible  := True;
               edtCosto9.visible  := True;
               edtCosto10.visible  := True;

               bbtnAdd.visible   := True;
               bbtn2Add.visible   := True;
               bbtn3Add.visible   := True;
               bbtn4Add.visible   := True;
               bbtn5Add.visible   := True;
               bbtn6Add.visible   := True;
               bbtn7Add.visible   := True;
               bbtn8Add.visible   := True;
               bbtn9Add.visible   := True;
               bbtn10Add.visible   := True;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.LimpiaPagina2;
Begin
      If edtArtid11.Text = ''   Then
         Begin
               edtArtid11.visible  := False;
               edtArtdes11.visible := False;
               edtAplic11.visible  := False;
               edtCosto11.visible  := False;
               bbtn11Add.visible   := False;
         End;

      If edtArtid12.Text = ''   Then
         Begin
               edtArtid12.visible  := False;
               edtArtdes12.visible := False;
               edtAplic12.visible  := False;
               edtCosto12.visible  := False;
               bbtn12Add.visible   := False;
         End;

      If edtArtid13.Text = ''   Then
         Begin
               edtArtid13.visible  := False;
               edtArtdes13.visible := False;
               edtAplic13.visible  := False;
               edtCosto13.visible  := False;
               bbtn13Add.visible   := False;
         End;

      If edtArtid14.Text = ''   Then
         Begin
               edtArtid14.visible  := False;
               edtArtdes14.visible := False;
               edtCosto14.visible  := False;
               edtAplic14.visible  := False;
               bbtn14Add.visible   := False;
         End;

      If edtArtid15.Text = ''   Then
         Begin
               edtArtid15.visible  := False;
               edtArtdes15.visible := False;
               edtAplic15.visible  := False;
               edtCosto15.visible  := False;
               bbtn15Add.visible   := False;
         End;

      If edtArtid16.Text = ''   Then
         Begin
               edtArtid16.visible  := False;
               edtArtdes16.visible := False;
               edtAplic16.visible  := False;
               edtCosto16.visible  := False;
               bbtn16Add.visible   := False;
         End;

      If edtArtid17.Text = ''   Then
         Begin
               edtArtid17.visible  := False;
               edtArtdes17.visible := False;
               edtAplic17.visible  := False;
               edtCosto17.visible  := False;
               bbtn17Add.visible   := False;
         End;

      If edtArtid18.Text = ''   Then
         Begin
               edtArtid18.visible  := False;
               edtArtdes18.visible := False;
               edtAplic18.visible  := False;
               edtCosto18.visible  := False;
               bbtn18Add.visible   := False;
         End;

      If edtArtid19.Text = ''   Then
         Begin
               edtArtid19.visible  := False;
               edtArtdes19.visible := False;
               edtAplic19.visible  := False;
               edtCosto19.visible  := False;
               bbtn19Add.visible   := False;
         End;

      If edtArtid20.Text = ''   Then
         Begin
               edtArtid20.visible  := False;
               edtArtdes20.visible := False;
               edtAplic20.visible  := False;
               edtCosto20.visible  := False;
               bbtn20Add.visible   := False;
         End;               
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.LimpiaPagina22;
Begin
               edtArtid11.visible  := False;
               edtArtdes11.visible := False;
               edtAplic11.visible  := False;
               edtCosto11.visible  := False;
               bbtn11Add.visible   := False;

               edtArtid12.visible  := False;
               edtArtdes12.visible := False;
               edtAplic12.visible  := False;
               edtCosto12.visible  := False;
               bbtn12Add.visible   := False;

               edtArtid13.visible  := False;
               edtArtdes13.visible := False;
               edtAplic13.visible  := False;
               edtCosto13.visible  := False;
               bbtn13Add.visible   := False;

               edtArtid14.visible  := False;
               edtArtdes14.visible := False;
               edtCosto14.visible  := False;
               edtAplic14.visible  := False;
               bbtn14Add.visible   := False;

               edtArtid15.visible  := False;
               edtArtdes15.visible := False;
               edtAplic15.visible  := False;
               edtCosto15.visible  := False;
               bbtn15Add.visible   := False;

               edtArtid16.visible  := False;
               edtArtdes16.visible := False;
               edtAplic16.visible  := False;
               edtCosto16.visible  := False;
               bbtn16Add.visible   := False;

               edtArtid17.visible  := False;
               edtArtdes17.visible := False;
               edtAplic17.visible  := False;
               edtCosto17.visible  := False;
               bbtn17Add.visible   := False;

               edtArtid18.visible  := False;
               edtArtdes18.visible := False;
               edtAplic18.visible  := False;
               edtCosto18.visible  := False;
               bbtn18Add.visible   := False;

               edtArtid19.visible  := False;
               edtArtdes19.visible := False;
               edtAplic19.visible  := False;
               edtCosto19.visible  := False;
               bbtn19Add.visible   := False;

               edtArtid20.visible  := False;
               edtArtdes20.visible := False;
               edtAplic20.visible  := False;
               edtCosto20.visible  := False;
               bbtn20Add.visible   := False;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.MuestraPagina2;
Begin
               edtArtid11.visible  := True;
               edtArtid12.visible  := True;
               edtArtid13.visible  := True;
               edtArtid14.visible  := True;
               edtArtid15.visible  := True;
               edtArtid16.visible  := True;
               edtArtid17.visible  := True;
               edtArtid18.visible  := True;
               edtArtid19.visible  := True;
               edtArtid20.visible  := True;

               edtArtdes11.visible := True;
               edtArtdes12.visible := True;
               edtArtdes13.visible := True;
               edtArtdes14.visible := True;
               edtArtdes15.visible := True;
               edtArtdes16.visible := True;
               edtArtdes17.visible := True;
               edtArtdes18.visible := True;
               edtArtdes19.visible := True;
               edtArtdes20.visible := True;

               edtAplic11.visible  := True;
               edtAplic12.visible  := True;
               edtAplic13.visible  := True;
               edtAplic14.visible  := True;
               edtAplic15.visible  := True;
               edtAplic16.visible  := True;
               edtAplic17.visible  := True;
               edtAplic18.visible  := True;
               edtAplic19.visible  := True;
               edtAplic20.visible  := True;

               edtCosto11.visible  := True;
               edtCosto12.visible  := True;
               edtCosto13.visible  := True;
               edtCosto14.visible  := True;
               edtCosto15.visible  := True;
               edtCosto16.visible  := True;
               edtCosto17.visible  := True;
               edtCosto18.visible  := True;
               edtCosto19.visible  := True;
               edtCosto20.visible  := True;

               bbtn11Add.visible   := True;
               bbtn12Add.visible   := True;
               bbtn13Add.visible   := True;
               bbtn14Add.visible   := True;
               bbtn15Add.visible   := True;
               bbtn16Add.visible   := True;
               bbtn17Add.visible   := True;
               bbtn18Add.visible   := True;
               bbtn19Add.visible   := True;
               bbtn20Add.visible   := True;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtnPagSClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

           bbtnPagS.Enabled   := True;

           If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
                StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)) < StrToFloat(edtMonto.text) Then
           Begin
               LimpiaPagina1;
               MuestraPagina2;
               LimpiaPagina2;
               edtArtid11.visible  := True;
               edtArtdes11.visible := True;
               edtAplic11.visible  := True;
               edtCosto11.visible  := True;
               bbtn11Add.visible   := True;
               bbtnPagA.Enabled   := True;

           End
           Else
           Begin
               LimpiaPagina2;
               MuestraPagina1;
               bbtnPagS.Enabled   := False;
               bbtnPagS.Enabled   := False;
           End;
end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtnPagAClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

           bbtnPagS.visible   := True;
           bbtnPagS.Enabled   := True;

           LimpiaPagina22;
           MuestraPagina1;

end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn11AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid11.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic11.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid11.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes11.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto11.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;

           If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
                StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)  +
                StrToFloat(edtAplic11.text)) < StrToFloat(edtMonto.text) Then
           Begin
               edtArtid12.visible  := True;
               edtArtdes12.visible := True;
               edtAplic12.visible  := True;
               edtCosto12.visible  := True;
               bbtn12Add.visible   := True;
           End
           Else
           Begin
               edtArtid12.visible  := False;
               edtArtdes12.visible := False;
               edtAplic12.visible  := False;
               edtCosto12.visible  := False;
               bbtn12Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn12AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid12.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic12.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid12.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes12.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto12.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;

           If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
                StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)  +
                StrToFloat(edtAplic12.text) + StrToFloat(edtAplic11.text)) < StrToFloat(edtMonto.text) Then

           Begin
               edtArtid13.visible  := True;
               edtArtdes13.visible := True;
               edtAplic13.visible  := True;
               edtCosto13.visible  := True;
               bbtn13Add.visible   := True;
           End
           Else
           Begin
               edtArtid13.visible  := False;
               edtArtdes13.visible := False;
               edtAplic13.visible  := False;
               edtCosto13.visible  := False;
               bbtn13Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn13AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid13.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic13.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid13.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes13.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto13.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;

           If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
                StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)  +
                StrToFloat(edtAplic13.text) + StrToFloat(edtAplic12.text) + StrToFloat(edtAplic11.text)) < StrToFloat(edtMonto.text) Then

           Begin
               edtArtid14.visible  := True;
               edtArtdes14.visible := True;
               edtAplic14.visible  := True;
               edtCosto14.visible  := True;
               bbtn14Add.visible   := True;
           End
           Else
           Begin
               edtArtid14.visible  := False;
               edtArtdes14.visible := False;
               edtAplic14.visible  := False;
               edtCosto14.visible  := False;
               bbtn14Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn14AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid14.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic14.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid14.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes14.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto14.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;

           If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
                StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)  +
                StrToFloat(edtAplic14.text) + StrToFloat(edtAplic13.text) + StrToFloat(edtAplic12.text) + StrToFloat(edtAplic11.text))
                < StrToFloat(edtMonto.text) Then

           Begin
               edtArtid15.visible  := True;
               edtArtdes15.visible := True;
               edtAplic15.visible  := True;
               edtCosto15.visible  := True;
               bbtn15Add.visible   := True;
           End
           Else
           Begin
               edtArtid15.visible  := False;
               edtArtdes15.visible := False;
               edtAplic15.visible  := False;
               edtCosto15.visible  := False;
               bbtn15Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn15AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid15.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic15.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid15.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes15.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto15.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;

           If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
                StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)  +
                StrToFloat(edtAplic15.text) + StrToFloat(edtAplic14.text) + StrToFloat(edtAplic13.text) + StrToFloat(edtAplic12.text) +
                StrToFloat(edtAplic11.text)) < StrToFloat(edtMonto.text) Then

           Begin
               edtArtid16.visible  := True;
               edtArtdes16.visible := True;
               edtAplic16.visible  := True;
               edtCosto16.visible  := True;
               bbtn16Add.visible   := True;
           End
           Else
           Begin
               edtArtid16.visible  := False;
               edtArtdes16.visible := False;
               edtAplic16.visible  := False;
               edtCosto16.visible  := False;
               bbtn16Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn16AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid16.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic16.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid16.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes16.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto16.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;

           If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
                StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)  +
                StrToFloat(edtAplic16.text) + StrToFloat(edtAplic15.text) + StrToFloat(edtAplic14.text) + StrToFloat(edtAplic13.text) +
                StrToFloat(edtAplic12.text) + StrToFloat(edtAplic11.text)) < StrToFloat(edtMonto.text) Then

           Begin
               edtArtid17.visible  := True;
               edtArtdes17.visible := True;
               edtAplic17.visible  := True;
               edtCosto17.visible  := True;
               bbtn17Add.visible   := True;
           End
           Else
           Begin
               edtArtid17.visible  := False;
               edtArtdes17.visible := False;
               edtAplic17.visible  := False;
               edtCosto17.visible  := False;
               bbtn17Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn17AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid17.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic17.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid17.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes17.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto17.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;

           If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
                StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)  +
                StrToFloat(edtAplic17.text) + StrToFloat(edtAplic16.text) + StrToFloat(edtAplic15.text) + StrToFloat(edtAplic14.text) + StrToFloat(edtAplic13.text) +
                StrToFloat(edtAplic12.text) + StrToFloat(edtAplic11.text)) < StrToFloat(edtMonto.text) Then

           Begin
               edtArtid18.visible  := True;
               edtArtdes18.visible := True;
               edtAplic18.visible  := True;
               edtCosto18.visible  := True;
               bbtn18Add.visible   := True;
           End
           Else
           Begin
               edtArtid18.visible  := False;
               edtArtdes18.visible := False;
               edtAplic18.visible  := False;
               edtCosto18.visible  := False;
               bbtn18Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn18AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid18.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic18.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid18.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes18.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto18.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;

           If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
                StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)  +
                StrToFloat(edtAplic18.text) + StrToFloat(edtAplic17.text) + StrToFloat(edtAplic16.text) + StrToFloat(edtAplic15.text) +
                StrToFloat(edtAplic14.text) + StrToFloat(edtAplic13.text) + StrToFloat(edtAplic12.text) + StrToFloat(edtAplic11.text))
                < StrToFloat(edtMonto.text) Then

           Begin
               edtArtid19.visible  := True;
               edtArtdes19.visible := True;
               edtAplic19.visible  := True;
               edtCosto19.visible  := True;
               bbtn19Add.visible   := True;
           End
           Else
           Begin
               edtArtid19.visible  := False;
               edtArtdes19.visible := False;
               edtAplic19.visible  := False;
               edtCosto19.visible  := False;
               bbtn19Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn19AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid19.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic19.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid19.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes19.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto19.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;

           If  (StrToFloat(edtAplic10.text) + StrToFloat(edtAplic9.text) + StrToFloat(edtAplic8.text) + StrToFloat(edtAplic7.text) +
                StrToFloat(edtAplic6.text)  + StrToFloat(edtAplic5.text) + StrToFloat(edtAplic4.text) + StrToFloat(edtAplic3.text) +
                StrToFloat(edtAplic2.text)  + StrToFloat(edtAplic.text)  +
                StrToFloat(edtAplic19.text) + StrToFloat(edtAplic18.text) + StrToFloat(edtAplic17.text) + StrToFloat(edtAplic16.text) +
                StrToFloat(edtAplic15.text) + StrToFloat(edtAplic14.text) + StrToFloat(edtAplic13.text) + StrToFloat(edtAplic12.text) +
                StrToFloat(edtAplic11.text))  < StrToFloat(edtMonto.text) Then

           Begin
               edtArtid20.visible  := True;
               edtArtdes20.visible := True;
               edtAplic20.visible  := True;
               edtCosto20.visible  := True;
               bbtn20Add.visible   := True;
           End
           Else
           Begin
               edtArtid20.visible  := False;
               edtArtdes20.visible := False;
               edtAplic20.visible  := False;
               edtCosto20.visible  := False;
               bbtn20Add.visible   := False;
           End;

        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
procedure TFRevalorizaNCre.bbtn20AddClick(Sender: TObject);
Var
   xWhere, xc1, xc2, xc3, v_continua: String;
Begin

   v_continua := 'S';
   If  edtArtid20.text ='' Then
       v_continua := 'Ingrese Código de Artículo...'
   Else
       If  edtAplic20.text ='' Then
           v_continua := 'Ingrese Importe a Aplicar de NC...'   ;

   If v_continua <> 'S'   Then
   Begin
          ShowMessage(v_continua)  ;
   End
   Else
   Begin
    xSQL := 'Select ARTDES, ARTCPROG '
      +     '  from db2admin.tge205 '
                 +     '  where ciaid= ' + QuotedStr(dblcCIA.Text)
                 +     '  and   artid= ' + QuotedStr(edtArtid20.Text)
                 +     '  and   prov = ' + QuotedStr(edtCodProv.Text)
                 +     '  and  artest= ''H'' '  ;

        DMALM.cdsQry.Close;
        DMALM.cdsQry.DataRequest(xSQL);
        DMALM.cdsQry.Open;

        If DMALM.cdsQry.RecordCount > 0 Then
        Begin
           edtArtdes20.text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
           edtCosto20.text := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
           bbtnPagA.Enabled   := True;
        End
        Else
        Begin
           ShowMessage('Artículo NO Existe o no Pertenece a este Proveedor!!! ');
           Exit;
        End;
     End;

end;
// Fin HPC_201801_ALM

End.




