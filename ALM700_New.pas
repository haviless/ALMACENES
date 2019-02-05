Unit ALM700;
//*********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201102_ALM
// FECHA DE MODIF.  : 17/02/2011
// DESCRIPCION      : Se incrementa el grado de precisión a 5 decimales
//                    en el redondeo de los campos de montos
//*********************************************************
// HPP_201102_ALM    : Se modifica el formato de variable
// HPC_201309_ALM    : Se genera otro formato para el Reporte de Kardex (control de Stock)
//                   : Se Modifca en formulario del Inventario Valorizado
// HPC_201402_ALM    : reordenamiento de sangría
//                     Se habilita exportación a Excel del Inventario Valorizado - bbtnInvValExcelClick(Sender: TObject);
//                     Se modifica rutina de Inventario Valorizado - Z2bbtnInvValClick(Sender: TObject);
//                     Se agregan nuevos campos a GRID inicial - btnChkClick(Sender: TObject);
//                     Se unifica consulta de Inventario Valorizado en una única rutina - DataInvValorizado
// HPC_201404_ALM      15/09/2014
//                     - se agrega el valor A al Tipo de Movimiento (NISATIP) cuando se trate de Saldos Iniciales,
//                       para que ordene y coloque en 1er lugar
//                     - se agrega el valor Z al Tipo de Movimiento (NISATIP) cuando se trate de Saldos Finales,
//                       para que ordene y coloque en Último lugar
//                     - se cambia orden de presentación del Kardex CIAID;ALMID;GRARID;TINID;ARTID;NISAFREG;NISATIP;NISAID

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ComCtrls, StdCtrls, ExtCtrls, Db, DBTables, ppDB, ppDBPipe,
   ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
   ppProd, ppReport, ppViewr, ppStrtch, ppSubRpt, ppEndUsr, ppTypes,
   ppParameter, Grids, DBGrids, Mask, wwdbedit, Wwdbspin, DBClient, DateUtils,
   jpeg, MsgDlgs, wwdblook;

Type
   TFToolKdx = Class(TForm)
      pprDetalle: TppReport;
      pnlTool: TPanel;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      pprInvVal: TppReport;
      Z2bbtnInvVal: TBitBtn;
      Z2bbtnResIngLin: TBitBtn;
      Z2bbtnKdxValInv: TBitBtn;
      pprResIngLin: TppReport;
      pprResKdxVal: TppReport;
      Z1sbCompKdx: TBitBtn;
      ppDesigner1: TppDesigner;
      ppKdxStock: TppReport;
      GroupBox1: TGroupBox;
      rgTipoStocValo: TRadioGroup;
      Z1sbKardex: TBitBtn;
      Z2bbtnResKdxValInv: TBitBtn;
      ppResIniFinInv: TppReport;
      BitBtn1: TBitBtn;
      ppResIniFinProc: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppDBText22: TppDBText;
      ppLabel1: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLPeridodo: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand3: TppSummaryBand;
      ppLabel18: TppLabel;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppGroup6: TppGroup;
      ppGroupHeaderBand6: TppGroupHeaderBand;
      ppLabel15: TppLabel;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppGroupFooterBand6: TppGroupFooterBand;
      ppDBCalc3: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppLabel17: TppLabel;
      ppLine9: TppLine;
      ppHeaderBand7: TppHeaderBand;
      ppLabel135: TppLabel;
      ppLabel136: TppLabel;
      ppSystemVariable15: TppSystemVariable;
      ppSystemVariable16: TppSystemVariable;
      ppSystemVariable17: TppSystemVariable;
      ppLabel137: TppLabel;
      ppLabel138: TppLabel;
      ppLabel139: TppLabel;
      ppLine19: TppLine;
      ppDBText114: TppDBText;
      ppLabel140: TppLabel;
      ppLabel141: TppLabel;
      ppLabel142: TppLabel;
      ppLabel143: TppLabel;
      ppLabel144: TppLabel;
      ppLabel145: TppLabel;
      ppLabel146: TppLabel;
      ppLabel147: TppLabel;
      ppLabel148: TppLabel;
      ppLabel149: TppLabel;
      ppDetailBand7: TppDetailBand;
      ppDBText106: TppDBText;
      ppDBText107: TppDBText;
      ppDBText108: TppDBText;
      ppDBText109: TppDBText;
      ppDBText110: TppDBText;
      ppDBText111: TppDBText;
      ppDBText112: TppDBText;
      ppDBText113: TppDBText;
      ppFooterBand4: TppFooterBand;
      ppSummaryBand7: TppSummaryBand;
      ppLine20: TppLine;
      ppDBCalc50: TppDBCalc;
      ppDBCalc51: TppDBCalc;
      ppDBCalc52: TppDBCalc;
      ppDBCalc54: TppDBCalc;
      ppDBCalc55: TppDBCalc;
      ppDBCalc53: TppDBCalc;
      ppHeaderBand6: TppHeaderBand;
      ppDBText104: TppDBText;
      ppSystemVariable13: TppSystemVariable;
      ppLabel133: TppLabel;
      ppLabel134: TppLabel;
      ppSystemVariable14: TppSystemVariable;
      ppLabel113: TppLabel;
      ppDBText105: TppDBText;
      ppLine17: TppLine;
      ppLine18: TppLine;
      ppLabel114: TppLabel;
      ppLabel115: TppLabel;
      ppLabel116: TppLabel;
      ppLabel117: TppLabel;
      ppLabel118: TppLabel;
      ppLabel119: TppLabel;
      ppLabel120: TppLabel;
      ppLabel121: TppLabel;
      ppLabel122: TppLabel;
      ppLabel123: TppLabel;
      ppLabel124: TppLabel;
      ppLabel125: TppLabel;
      ppLabel126: TppLabel;
      ppShape7: TppShape;
      ppShape8: TppShape;
      ppLabel127: TppLabel;
      ppLabel156: TppLabel;
      ppDetailBand6: TppDetailBand;
      ppDBText90: TppDBText;
      ppDBText91: TppDBText;
      ppDBText92: TppDBText;
      ppDBText93: TppDBText;
      ppDBText94: TppDBText;
      ppDBText95: TppDBText;
      ppDBCalc42: TppDBCalc;
      ppDBText96: TppDBText;
      ppDBText97: TppDBText;
      ppDBText98: TppDBText;
      ppDBText117: TppDBText;
      ppFooterBand3: TppFooterBand;
      ppSummaryBand6: TppSummaryBand;
      ppDBCalc43: TppDBCalc;
      ppDBCalc44: TppDBCalc;
      ppDBCalc45: TppDBCalc;
      ppDBCalc46: TppDBCalc;
      ppLabel157: TppLabel;
      ppLine14: TppLine;
      ppGroup11: TppGroup;
      ppGroupHeaderBand11: TppGroupHeaderBand;
      ppLabel158: TppLabel;
      ppDBText118: TppDBText;
      ppDBText119: TppDBText;
      ppGroupFooterBand11: TppGroupFooterBand;
      ppKdxCompro: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel16: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppLabel19: TppLabel;
      ppSystemVariable8: TppSystemVariable;
      ppLabel48: TppLabel;
      ppSystemVariable9: TppSystemVariable;
      ppLabel49: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText5: TppDBText;
      ppLabel50: TppLabel;
      ppLabel51: TppLabel;
      ppLabel53: TppLabel;
      ppLabel59: TppLabel;
      ppLabel61: TppLabel;
      ppLabel62: TppLabel;
      ppLabel64: TppLabel;
      ppLabel65: TppLabel;
      ppLabel66: TppLabel;
      ppLabel67: TppLabel;
      ppLabel68: TppLabel;
      ppLabel74: TppLabel;
      ppLabel75: TppLabel;
      ppLabel79: TppLabel;
      ppLabel85: TppLabel;
      ppLabel86: TppLabel;
      ppLabel87: TppLabel;
      ppLabel63: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel60: TppLabel;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppDBText18: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDetailBand1: TppDetailBand;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText57: TppDBText;
      ppDBText37: TppDBText;
      ppDBText38: TppDBText;
      ppDBText39: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup14: TppGroup;
      ppGroupHeaderBand14: TppGroupHeaderBand;
      ppGroupFooterBand14: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppLabel2: TppLabel;
      ppDBText4: TppDBText;
      ppDBText16: TppDBText;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppVariable7: TppVariable;
      ppLabel88: TppLabel;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppLabel5: TppLabel;
      ppDBText19: TppDBText;
      ppDBText17: TppDBText;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppDBText58: TppDBText;
      ppLabel76: TppLabel;
      ppDBText59: TppDBText;
      ppDBText60: TppDBText;
      ppLabel77: TppLabel;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppLabel78: TppLabel;
      ppDBCalc4: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppVariable1: TppVariable;
      ppVariable2: TppVariable;
      ppDBCalc1: TppDBCalc;
      ppVariable6: TppVariable;
      ppDBCalc5: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppHeaderBand4: TppHeaderBand;
      ppDBText23: TppDBText;
      ppSystemVariable3: TppSystemVariable;
      ppLabel9: TppLabel;
      ppLabel12: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel13: TppLabel;
      ppDBText32: TppDBText;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLabel14: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      pplPerKdx: TppLabel;
      ppLabel6: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppShape3: TppShape;
      ppShape4: TppShape;
      ppLabel45: TppLabel;
      ppLabel107: TppLabel;
      ppLabel22: TppLabel;
      ppLabel39: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText44: TppDBText;
      ppDBText45: TppDBText;
      ppDBText46: TppDBText;
      ppDBText47: TppDBText;
      ppDBText48: TppDBText;
      ppDBText49: TppDBText;
      ppDBCalc13: TppDBCalc;
      ppDBText50: TppDBText;
      ppDBText51: TppDBText;
      ppDBText52: TppDBText;
      ppDBText53: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand4: TppSummaryBand;
      ppDBCalc18: TppDBCalc;
      ppDBCalc19: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      ppDBCalc21: TppDBCalc;
      ppLabel108: TppLabel;
      ppLine11: TppLine;
      ppGroup7: TppGroup;
      ppGroupHeaderBand7: TppGroupHeaderBand;
      ppLabel109: TppLabel;
      ppDBText54: TppDBText;
      ppDBText61: TppDBText;
      ppGroupFooterBand7: TppGroupFooterBand;
      ppGroup9: TppGroup;
      ppGroupHeaderBand9: TppGroupHeaderBand;
      ppLabel110: TppLabel;
      ppDBText86: TppDBText;
      ppDBText87: TppDBText;
      ppGroupFooterBand9: TppGroupFooterBand;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppLabel111: TppLabel;
      ppLine10: TppLine;
      ppDBCalc33: TppDBCalc;
      ppDBCalc34: TppDBCalc;
      ppDBCalc35: TppDBCalc;
      ppDBCalc36: TppDBCalc;
      ppLine13: TppLine;
      ppdbMovi: TppDBPipeline;
      ppHeaderBand8: TppHeaderBand;
      ppLabel112: TppLabel;
      ppSystemVariable18: TppSystemVariable;
      ppLabel128: TppLabel;
      ppSystemVariable19: TppSystemVariable;
      ppLabel129: TppLabel;
      ppSystemVariable20: TppSystemVariable;
      ppLabel130: TppLabel;
      ppDBText88: TppDBText;
      ppDBText89: TppDBText;
      ppDBText99: TppDBText;
      ppDBText100: TppDBText;
      ppLabel131: TppLabel;
      ppLabel132: TppLabel;
      ppLabel150: TppLabel;
      ppLabel151: TppLabel;
      ppDetailBand8: TppDetailBand;
      ppDBText101: TppDBText;
      ppDBText102: TppDBText;
      ppDBText103: TppDBText;
      ppDBText115: TppDBText;
      ppDBText116: TppDBText;
      ppDBText120: TppDBText;
      ppDBText121: TppDBText;
      ppSummaryBand8: TppSummaryBand;
      ppGroup19: TppGroup;
      ppGroupHeaderBand19: TppGroupHeaderBand;
      ppLabel152: TppLabel;
      ppLabel153: TppLabel;
      ppLabel154: TppLabel;
      ppLabel155: TppLabel;
      ppLabel159: TppLabel;
      ppGroupFooterBand19: TppGroupFooterBand;
      ppGroup20: TppGroup;
      ppGroupHeaderBand20: TppGroupHeaderBand;
      ppGroupFooterBand20: TppGroupFooterBand;
      ppGroup21: TppGroup;
      ppGroupHeaderBand21: TppGroupHeaderBand;
      ppLabel160: TppLabel;
      ppDBText122: TppDBText;
      ppDBText123: TppDBText;
      ppGroupFooterBand21: TppGroupFooterBand;
      ppGroup22: TppGroup;
      ppGroupHeaderBand22: TppGroupHeaderBand;
      ppGroupFooterBand22: TppGroupFooterBand;
      ppGroup23: TppGroup;
      ppGroupHeaderBand23: TppGroupHeaderBand;
      ppLabel161: TppLabel;
      ppDBText124: TppDBText;
      ppDBText125: TppDBText;
      ppGroupFooterBand23: TppGroupFooterBand;
      ppGroup24: TppGroup;
      ppGroupHeaderBand24: TppGroupHeaderBand;
      ppLabel162: TppLabel;
      ppLabel163: TppLabel;
      ppGroupFooterBand24: TppGroupFooterBand;
      ppDBCalc37: TppDBCalc;
      ppVariable4: TppVariable;
      ppDBCalc38: TppDBCalc;
      ppDBCalc39: TppDBCalc;
      ppDBCalc40: TppDBCalc;
      ppDBText126: TppDBText;
      ppDBText127: TppDBText;
      ppDBText128: TppDBText;
      ppParameterList1: TppParameterList;
      ppParameterList2: TppParameterList;
      ppHeaderBand5: TppHeaderBand;
      ppLabel72: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppLabel73: TppLabel;
      ppSystemVariable11: TppSystemVariable;
      ppLabel80: TppLabel;
      ppSystemVariable12: TppSystemVariable;
      ppLabel81: TppLabel;
      ppDBText66: TppDBText;
      ppDBText67: TppDBText;
      ppDBText68: TppDBText;
      ppDBText69: TppDBText;
      ppLabel82: TppLabel;
      ppLabel83: TppLabel;
      ppLabel84: TppLabel;
      ppDetailBand5: TppDetailBand;
      ppDBText70: TppDBText;
      ppDBText71: TppDBText;
      ppDBText72: TppDBText;
      ppDBText73: TppDBText;
      ppDBText74: TppDBText;
      ppDBText75: TppDBText;
      ppDBText76: TppDBText;
      ppDBText77: TppDBText;
      ppDBText78: TppDBText;
      ppDBText79: TppDBText;
      ppDBText83: TppDBText;
      ppSummaryBand5: TppSummaryBand;
      ppGroup12: TppGroup;
      ppGroupHeaderBand12: TppGroupHeaderBand;
      ppLabel89: TppLabel;
      ppLabel90: TppLabel;
      ppLabel91: TppLabel;
      ppLabel92: TppLabel;
      ppLabel93: TppLabel;
      ppLabel94: TppLabel;
      ppLabel95: TppLabel;
      ppLabel96: TppLabel;
      ppLabel97: TppLabel;
      ppLabel98: TppLabel;
      ppLabel99: TppLabel;
      ppLabel100: TppLabel;
      ppLabel101: TppLabel;
      ppLabel105: TppLabel;
      ppLabel106: TppLabel;
      ppGroupFooterBand12: TppGroupFooterBand;
      ppGroup13: TppGroup;
      ppGroupHeaderBand13: TppGroupHeaderBand;
      ppGroupFooterBand13: TppGroupFooterBand;
      ppGroup15: TppGroup;
      ppGroupHeaderBand15: TppGroupHeaderBand;
      ppGroupFooterBand15: TppGroupFooterBand;
      ppGroup16: TppGroup;
      ppGroupHeaderBand16: TppGroupHeaderBand;
      ppGroupFooterBand16: TppGroupFooterBand;
      ppGroup17: TppGroup;
      ppGroupHeaderBand17: TppGroupHeaderBand;
      ppGroupFooterBand17: TppGroupFooterBand;
      ppGroup18: TppGroup;
      ppGroupHeaderBand18: TppGroupHeaderBand;
      ppDBText80: TppDBText;
      ppDBText81: TppDBText;
      ppDBText82: TppDBText;
      ppLabel102: TppLabel;
      ppLabel103: TppLabel;
      ppGroupFooterBand18: TppGroupFooterBand;
      ppLabel104: TppLabel;
      ppDBCalc25: TppDBCalc;
      ppVariable3: TppVariable;
      ppDBCalc26: TppDBCalc;
      ppDBCalc27: TppDBCalc;
      ppDBCalc28: TppDBCalc;
      ppDBText84: TppDBText;
      ppDBText85: TppDBText;
      ppDBCalc29: TppDBCalc;
      ppDBCalc30: TppDBCalc;
      ppDBCalc31: TppDBCalc;
      ppDBCalc32: TppDBCalc;
      Timer1: TTimer;
      BitBtn2: TBitBtn;
      ppr1: TppReport;
      ppParameterList3: TppParameterList;
      ppdb1: TppDBPipeline;
      ppHeaderBand9: TppHeaderBand;
      ppDBText129: TppDBText;
      ppLabel164: TppLabel;
      ppSystemVariable21: TppSystemVariable;
      ppLabel165: TppLabel;
      ppLabel166: TppLabel;
      ppSystemVariable22: TppSystemVariable;
      ppLabel167: TppLabel;
      ppDetailBand9: TppDetailBand;
      ppDBText130: TppDBText;
      ppDBText131: TppDBText;
      ppDBText132: TppDBText;
      ppDBText133: TppDBText;
      ppDBText134: TppDBText;
      ppDBText135: TppDBText;
      ppDBCalc41: TppDBCalc;
      ppSummaryBand9: TppSummaryBand;
      ppLabel168: TppLabel;
      ppLine16: TppLine;
      ppDBCalc47: TppDBCalc;
      ppGroup26: TppGroup;
      ppGroupHeaderBand26: TppGroupHeaderBand;
      ppLabel169: TppLabel;
      ppDBText140: TppDBText;
      ppShape5: TppShape;
      ppShape6: TppShape;
      ppLine15: TppLine;
      ppLine21: TppLine;
      ppLabel170: TppLabel;
      ppLabel171: TppLabel;
      ppLabel172: TppLabel;
      ppLabel173: TppLabel;
      ppLabel174: TppLabel;
      ppLabel175: TppLabel;
      ppLabel176: TppLabel;
      ppLabel177: TppLabel;
      ppLabel178: TppLabel;
      ppLabel179: TppLabel;
      ppLabel180: TppLabel;
      ppLabel181: TppLabel;
      ppLabel182: TppLabel;
      ppGroupFooterBand26: TppGroupFooterBand;
      ppLabel183: TppLabel;
      ppLine22: TppLine;
      ppDBCalc48: TppDBCalc;
      ppGroup27: TppGroup;
      ppGroupHeaderBand27: TppGroupHeaderBand;
      ppLabel184: TppLabel;
      ppDBText141: TppDBText;
      ppDBText142: TppDBText;
      ppGroupFooterBand27: TppGroupFooterBand;
      ppLabel185: TppLabel;
      ppLine23: TppLine;
      ppDBCalc49: TppDBCalc;
      ppGroup28: TppGroup;
      ppGroupHeaderBand28: TppGroupHeaderBand;
      ppDBText143: TppDBText;
      ppDBText144: TppDBText;
      ppLabel186: TppLabel;
      ppGroupFooterBand28: TppGroupFooterBand;
      ppLine24: TppLine;
      ppLabel187: TppLabel;
      ppDBCalc56: TppDBCalc;
      ppLine25: TppLine;
      bbtnMov: TBitBtn;
      bbtnInvComercial: TBitBtn;
      BitBtn3: TBitBtn;
      BitBtn4: TBitBtn;
      ppHeaderBand3: TppHeaderBand;
      ppDBText30: TppDBText;
      ppLabel26: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      pplPeriodo: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText31: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppDBText40: TppDBText;
      ppDBCalc2: TppDBCalc;
      ppSummaryBand1: TppSummaryBand;
      ppShape9: TppShape;
      ppLabel30: TppLabel;
      ppDBCalc8: TppDBCalc;
      ppGroup8: TppGroup;
      ppGroupHeaderBand8: TppGroupHeaderBand;
      ppShape2: TppShape;
      ppShape1: TppShape;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel40: TppLabel;
      ppLabel46: TppLabel;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppLabel31: TppLabel;
      ppDBText41: TppDBText;
      ppDBText136: TppDBText;
      ppGroupFooterBand8: TppGroupFooterBand;
      ppGroup25: TppGroup;
      ppGroupHeaderBand25: TppGroupHeaderBand;
      ppGroupFooterBand25: TppGroupFooterBand;
      ppDBCalc23: TppDBCalc;
      ppLine26: TppLine;
      ppLabel47: TppLabel;
      ppGroup29: TppGroup;
      ppGroupHeaderBand29: TppGroupHeaderBand;
      ppGroupFooterBand29: TppGroupFooterBand;
      ppLabel44: TppLabel;
      ppLine6: TppLine;
      ppDBCalc9: TppDBCalc;
      ppGroup10: TppGroup;
      ppGroupHeaderBand10: TppGroupHeaderBand;
      ppDBText55: TppDBText;
      ppDBText56: TppDBText;
      ppLabel52: TppLabel;
      ppGroupFooterBand10: TppGroupFooterBand;
      ppLine12: TppLine;
      ppDBCalc22: TppDBCalc;
      ppLabel69: TppLabel;
      bbtnAntiguo: TBitBtn;
      bbtnConsignacion: TBitBtn;
      ppr2: TppReport;
      ppdbLin: TppDBPipeline;
      ppHeaderBand10: TppHeaderBand;
      ppDetailBand10: TppDetailBand;
      ppFooterBand5: TppFooterBand;
      bbtnExcel1: TBitBtn;
      dtgData: TDBGrid;
      bbtnExcelAntig: TBitBtn;
      sbAno: TwwDBSpinEdit;
      sbMes: TwwDBSpinEdit;
      dsKardex: TDataSource;
      cdsKardex: TClientDataSet;
      RepKardex: TppReport;
      dbKardex: TppDBPipeline;
      ppParameterList4: TppParameterList;
      Label1: TLabel;
      Label2: TLabel;
      Edit1: TEdit;
      btnChk: TBitBtn;
      ppImage2: TppImage;
      ppLabel197: TppLabel;
      ppSystemVariable26: TppSystemVariable;
      cbDiseno: TCheckBox;
      sbDiseno: TSpeedButton;
      bbtnInvValExcel: TBitBtn;
      ppHeaderBand11: TppHeaderBand;
      ppDBText153: TppDBText;
      ppLabel194: TppLabel;
      ppLabel195: TppLabel;
      ppLabel196: TppLabel;
      ppSystemVariable23: TppSystemVariable;
      ppSystemVariable24: TppSystemVariable;
      ppSystemVariable25: TppSystemVariable;
      pplTituloKardex: TppLabel;
      ppImage1: TppImage;
      ppDetailBand11: TppDetailBand;
      ppDBText63: TppDBText;
      ppDBText65: TppDBText;
      ppDBText137: TppDBText;
      ppDBText138: TppDBText;
      ppDBText139: TppDBText;
      ppDBText145: TppDBText;
      ppDBText62: TppDBText;
      ppDBText64: TppDBText;
      ppFooterBand6: TppFooterBand;
      ppGroup30: TppGroup;
      ppGroupHeaderBand30: TppGroupHeaderBand;
      ppShape17: TppShape;
      ppShape16: TppShape;
      ppShape15: TppShape;
      ppShape14: TppShape;
      ppShape13: TppShape;
      ppShape12: TppShape;
      ppShape11: TppShape;
      ppShape10: TppShape;
      ppDBText154: TppDBText;
      ppDBText155: TppDBText;
      ppLabel29: TppLabel;
      ppLabel70: TppLabel;
      ppLabel71: TppLabel;
      ppLabel188: TppLabel;
      ppLabel189: TppLabel;
      ppLabel190: TppLabel;
      ppLabel191: TppLabel;
      ppLabel192: TppLabel;
      ppLabel193: TppLabel;
      ppLabel198: TppLabel;
      ppShape18: TppShape;
      ppShape19: TppShape;
      ppGroupFooterBand30: TppGroupFooterBand;
      ppGroup31: TppGroup;
      ppGroupHeaderBand31: TppGroupHeaderBand;
      ppGroupFooterBand31: TppGroupFooterBand;
      ppGroup32: TppGroup;
      ppGroupHeaderBand32: TppGroupHeaderBand;
      ppGroupFooterBand32: TppGroupFooterBand;
      ppGroup33: TppGroup;
      ppGroupHeaderBand33: TppGroupHeaderBand;
      ppGroupFooterBand33: TppGroupFooterBand;
      ppGroup34: TppGroup;
      ppGroupHeaderBand34: TppGroupHeaderBand;
      ppDBText150: TppDBText;
      ppDBText152: TppDBText;
      ppGroupFooterBand34: TppGroupFooterBand;
      ppShape20: TppShape;
    lblCIA: TLabel;
    dblcCIA: TwwDBLookupCombo;
    dbeCIA: TEdit;
 //
      Procedure pprDetallePreviewFormCreate(Sender: TObject);
      Procedure ppVariable2Calc(Sender: TObject; Var Value: Variant);
      Procedure FormCreate(Sender: TObject);
      Procedure ppVariable1Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable6Print(Sender: TObject);
      Procedure Z1sbKardexClick(Sender: TObject);
      Procedure Z2bbtnInvValClick(Sender: TObject);
      Procedure pprInvValPreviewFormCreate(Sender: TObject);
      Procedure Z2bbtnResIngLinClick(Sender: TObject);
      Procedure pprResIngLinPreviewFormCreate(Sender: TObject);
      Procedure Z2bbtnKdxValInvClick(Sender: TObject);
      Procedure pprResKdxValPreviewFormCreate(Sender: TObject);
      Procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
      Procedure ppVariable6Calc(Sender: TObject; Var Value: Variant);
      Procedure ppDBText14Print(Sender: TObject);
      Procedure ppDBText15Print(Sender: TObject);
      Procedure ppDBText57Print(Sender: TObject);
      Procedure ppDBText13Print(Sender: TObject);
      Procedure ppDBText37Print(Sender: TObject);
      Procedure ppDBText38Print(Sender: TObject);
      Procedure ppDBText12Print(Sender: TObject);
      Procedure ppDBText11Print(Sender: TObject);
      Procedure ppDBText9Print(Sender: TObject);
      Procedure ppDBText10Print(Sender: TObject);
      Procedure ppDBText39Print(Sender: TObject);
      Procedure Z1sbCompKdxClick(Sender: TObject);
      Procedure ppKdxStockPreviewFormCreate(Sender: TObject);
      Procedure ppVariable3Calc(Sender: TObject; Var Value: Variant);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Z2bbtnResKdxValInvClick(Sender: TObject);
      Procedure ppResIniFinInvPreviewFormCreate(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure ppResIniFinProcPreviewFormCreate(Sender: TObject);
      Procedure ppVariable4Calc(Sender: TObject; Var Value: Variant);
      Procedure ppKdxComproPreviewFormCreate(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure bbtnMovClick(Sender: TObject);
      Procedure bbtnInvComercialClick(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure BitBtn4Click(Sender: TObject);
      Procedure bbtnAntiguoClick(Sender: TObject);
      Procedure bbtnConsignacionClick(Sender: TObject);
      Procedure bbtnExcel1Click(Sender: TObject);
      Procedure bbtnExcelAntigClick(Sender: TObject);
      Procedure btnChkClick(Sender: TObject);
      Procedure sbDisenoClick(Sender: TObject);
      Procedure bbtnInvValExcelClick(Sender: TObject);
      Procedure sbMesExit(Sender: TObject);
      Procedure DataInvValorizado;
   Private
  { Private declarations }
      Procedure CalcularKardex();
      Procedure CalcularKardexComp();
   Public
  { Public declarations }
      Procedure InsDataFil;
      Procedure VerAno;
      Procedure VerAnoNew;
   End;

Var
   FToolKdx: TFToolKdx;
   xwhere: String;
   xAccesoBotones: Boolean;
   xContinuaConsulta: boolean; // HPC_201402_ALM
   xFechaPeriodo: String; // HPC_201402_ALM
   xCiaFiltro : String; // HPC_201405_ALM

Implementation

Uses ALMDM1, ALM411, oaIN4000;

{$R *.DFM}

Procedure TFToolKdx.pprDetallePreviewFormCreate(Sender: TObject);
Begin
   pprDetalle.PreviewForm.ClientHeight := 500;
   pprDetalle.PreviewForm.ClientWidth := 650;
   TppViewer(pprDetalle.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolKdx.ppVariable2Calc(Sender: TObject; Var Value: Variant);
Var
   xVal: Double;
Begin
   If ppDBText57.Text = '' Then
      xVal := 0
   Else
      xVal := StrToFloat(ppDBText57.Text);
   value := (StrToFloat(ppDBCalc6.Text) + xVal);
End;

Procedure TFToolKdx.FormCreate(Sender: TObject);
Begin
   dtpHasta.Date := Date;
   sbMes.Text := COPY(datetostr(Dates), 4, 2);
   sbAno.Text := COPY(datetostr(Dates), 7, 4);
End;

Procedure TFToolKdx.ppVariable1Calc(Sender: TObject; Var Value: Variant);
Var
   xValG, xValU: Double;
   sSQL, ContS: String;
   Tot {, Res, xRes}: Double;
  {Ent,}ContI: Integer;
Begin
   If ppDBCalc5.Text = '' Then
      xValG := 0
   Else
      xValG := StrToFloat(ppDBCalc5.Text);
   xValG := (StrToFloat(ppDBCalc4.Text) + xValG);

   If ppDBCalc7.Text = '' Then
      xValU := 0
   Else
      xValU := StrToFloat(ppDBCalc7.Text);
   xValU := (StrToFloat(ppDBCalc1.Text) + xValU);

   If xValU <> 0 Then
   Begin
      sSQL := 'CIAID=' + quotedstr(DMALM.cdsReporte.FieldByName('CIAID').AsString) + ' AND ARTID=' + quotedstr(DMALM.cdsReporte.FieldByName('ARTID').AsString);
      ContS := DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT', sSQL, 'ARTCONT');
      If ContS = '' Then
         ContI := 1
      Else
         ContI := StrToInt(ContS);

      Tot := xValG * ContI;
      Tot := Tot + xValU;
      If Tot < 0.0001 Then
         Tot := 0;
      value := FloattoStr(Tot);
      Exit;
   End;
   If xValG < 0.0001 Then
      xValG := 0;
   value := FloattoStrf(xValG, fffixed, 15, 2);
End;

Procedure TFToolKdx.ppVariable6Print(Sender: TObject);
Begin
   If Length(ppVariable6.Text) = 0 Then
      ppVariable6.Value := 0;
   If ppVariable7.Value + StrtoFloat(ppVariable6.Value) < 0.0001 Then
   Begin
      ppVariable7.Value := 0;
      ppVariable6.Value := 0;
   End
   Else
   Begin
      ppVariable7.Value := ppVariable7.Value + StrtoFloat(ppVariable6.Value);
   End;

End;

Procedure TFToolKdx.Z1sbKardexClick(Sender: TObject);
Var
   XSQL, ssQl1, ssQl2, ssQl3, ssQl4, ssQl5, xFechainititulo, xFecha, xfechafinal, xFechafinal2: String;
   xSaldo, xSaldoInicial, xSaldoFinal, xPreproini: currency;
   xPeriodos: integer;
   cPreproini: String;
Begin
   Mtx4000.FMant.cds2.First;
   Mtx4000.FMant.cds2.DisableControls;
   cdsKardex.EmptyDataSet;
   Screen.Cursor := crHourGlass;
   xFechaIniTitulo := '01/' + Copy(Mtx4000.FMant.cds2.FieldByname('LOGANOMM').AsString, 5, 2) + '/' + Copy(Mtx4000.FMant.cds2.FieldByname('LOGANOMM').AsString, 1, 4);
   xSaldo := Mtx4000.FMant.cds2.FieldByname('STKINI').AsFloat;
   xPeriodos := Mtx4000.FMant.cds2.RecordCount;
   While Not Mtx4000.FMant.cds2.Eof Do
   Begin
      xFecha := '01/' + Copy(Mtx4000.FMant.cds2.FieldByname('LOGANOMM').AsString, 5, 2) + '/' + Copy(Mtx4000.FMant.cds2.FieldByname('LOGANOMM').AsString, 1, 4);
      xFechafinal := IntToStr(DaysInMonth(StrTodate(xFecha))) + '/' + Copy(Mtx4000.FMant.cds2.FieldByname('LOGANOMM').AsString, 5, 2) + '/' + Copy(Mtx4000.FMant.cds2.FieldByname('LOGANOMM').AsString, 1, 4);
      xFechafinal2 := datetostr(Dates);

      xSQL := 'SELECT A.CIAID,E.CIADES,A.ALMID,G.ALMDES,a.TINID,H.TINDES,C.ARTID,C.GRARID,I.GRARDES,A.TRIID,J.TRIDES,'
            + '       C.FAMID,C.SFAMID,C.ARTDES,A.NISAID,B.NISSIT,A.ARTID,A.KDXCNTG,'
            + '       CASE WHEN A.NISATIP=''INGRESO'' THEN A.KDXCNTG END INGRESO,'
            + '       CASE WHEN A.NISATIP=''SALIDA''  THEN A.KDXCNTG END SALIDA,'
         // Inicio HPC_201405_ALM
           // + '       A.ARTPCG,A.NISATIP,A.NISAFREG NISAFREG,B.TMONID,TO_CHAR(A.NISAFREG,''YYYYMM'')ANOMESMOV,'
            + '       A.ARTPCG, A.NISATIP, A.NISATIP ORDENIMP, A.NISAFREG NISAFREG,B.TMONID,TO_CHAR(A.NISAFREG,''YYYYMM'')ANOMESMOV,'
         // Fin HPC_201405_ALM
            + '       (SELECT STKINI '
            + '          FROM LOG319 D '
            + '         WHERE A.CIAID=D.CIAID AND A.ALMID=D.ALMID AND TO_CHAR(A.NISAFREG,''YYYYMM'')=D.LOGANOMM AND A.ARTID=D.ARTID) STKINI '
            + '  FROM LOG315 A, '
            + '       LOG314 B,'
            + '       TGE205 C,'
            + '       TGE101 E,' //CIAD
            + '       TGE126 F,' //LOCALIDAD
            + '       TGE151 G,' //ALMACEN
            + '       TGE152 H,' //T. INVENTARIO
            + '       TGE131 I,' //GRARID
            + '       TGE208 J ' //TIPO DE TRANSACCION
            + ' WHERE A.CIAID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('CIAID').AsString)+' and ' // HPC_201405_ALM
            + '       A.CIAID=B.CIAID   AND A.ALMID=B.ALMID AND B.TINID=A.TINID and '
            + '       A.NISAID=B.NISAID AND A.NISATIP = B.NISATIP AND A.ARTID=''' + Mtx4000.FMant.cds2.FieldByname('ARTID').AsString + ''' AND B.NISSIT=''ACEPTADO'' AND (A.NISAFREG>=''' + xFecha + ''' AND A.NISAFREG<=''' + xFechafinal + ''') AND '
            + '       A.CIAID=C.CIAID AND A.TINID=C.TINID AND A.ARTID=C.ARTID AND '
            + '       A.CIAID=E.CIAID(+) AND ' //COMPAÑIA
            + '       A.CIAID=F.CIAID(+) AND A.LOCID=F.LOCID(+) AND ' //LOCALIDAD
            + '       A.CIAID=G.CIAID(+) AND A.LOCID=G.LOCID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+) AND ' //ALMACEN
            + '       A.CIAID=H.CIAID(+) AND A.TINID=H.TINID(+) AND ' //T.INVENTARIO
            + '       A.CIAID=I.CIAID(+) AND A.TINID=I.TINID(+) AND  A.GRARID=I.GRARID(+) AND ' // GRUPO
            + '       A.TRIID=J.TRIID(+) AND A.TDAID=J.TDAID(+) ' //TIPO DE TRANSACCION
            + ' ORDER BY A.CIAID,A.ALMID,A.ARTID,A.NISAFREG,A.NISATIP,A.NISAID';
      DMALM.cdsStockAct.Close;
      DMALM.cdsStockAct.DataRequest(XSQL);
      DMALM.cdsStockAct.Open;
      DMALM.cdsStockAct.IndexFieldNames := 'CIAID;ALMID;ARTID;NISAFREG;NISATIP;NISAID';
      DMALM.cdsStockAct.first;

      xSaldoInicial := Mtx4000.FMant.cds2.FieldByname('STKINI').AsFloat;
      xSaldoFinal := Mtx4000.FMant.cds2.FieldByname('STKFIN').AsFloat;

   // Inicio HPC_201402_ALM
      ssQl1 := ' CIAID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('CIAID').AsString);
      ssQl2 := ' CIAID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('CIAID').AsString)
              +' and LOCID='+quotedstr('01')
              +' and TINID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('TINID').AsString)
              +' and ALMID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('ALMID').AsString);
      ssQl3 := ' CIAID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('CIAID').AsString)
              +' and TINID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('TINID').AsString)
              +' and ARTID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('ARTID').AsString);
      ssQl4 := ' CIAID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('CIAID').AsString)
              +' and TINID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('TINID').AsString)
              +' and GRARID='+quotedstr(DMALM.DisplayDescrip('prvSQL', 'TGE205', 'GRARID', ssQl3, 'GRARID'));
      ssQl5 := 'CIAID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('CIAID').AsString)
              +'  and LOGANOMM='+quotedstr(Mtx4000.FMant.cds2.FieldByname('LOGANOMM').Asstring)
              +'  and ARTID='+quotedstr(Mtx4000.FMant.cds2.FieldByname('ARTID').Asstring);
   // Fin HPC_201402_ALM

      cPreproini := DMALM.DisplayDescrip('prvSQL', 'LOG337', 'PREPROMINI', ssQl5, 'PREPROMINI');
      If Length(Trim(cPreproini)) = 0 Then
         xPreproini := 0.00
      Else
         xPreproini := strtoFloat(cPreproini);

   // Se inserta registro de Saldo Inicial y Final
      cdsKardex.Insert;
      cdsKardex.FieldByName('CIAID').AsString := Mtx4000.FMant.cds2.FieldByname('CIAID').AsString;
      cdsKardex.FieldByName('CIADES').AsString := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', sSQL1, 'CIADES');
      cdsKardex.FieldByName('ALMID').AsString := Mtx4000.FMant.cds2.FieldByname('ALMID').AsString;
      cdsKardex.FieldByName('ALMDES').AsString := DMALM.DisplayDescrip('prvSQL', 'TGE151', 'ALMDES', ssQl2, 'ALMDES');
      cdsKardex.FieldByName('TINID').AsString := Mtx4000.FMant.cds2.FieldByname('TINID').AsString;
      cdsKardex.FieldByName('ARTID').AsString := Mtx4000.FMant.cds2.FieldByname('ARTID').AsString;
      cdsKardex.FieldByName('ARTDES').AsString := DMALM.DisplayDescrip('prvSQL', 'TGE205', 'ARTDES', ssQl3, 'ARTDES');
      cdsKardex.FieldByName('GRARID').AsString := DMALM.DisplayDescrip('prvSQL', 'TGE205', 'GRARID', ssQl3, 'GRARID');
      cdsKardex.FieldByName('GRARDES').AsString := DMALM.DisplayDescrip('prvSQL', 'TGE131', 'GRARDES', ssQl4, 'GRARDES');

   // Inicio HPC_201404_ALM
   // se agrega el valor A al Tipo de Movimiento cuando se trate de Saldos Iniciales, para que ordene y coloque en 1er lugar
      cdsKardex.FieldByName('ORDENIMP').AsString := 'A'; // HPC_201405_ALM
   // Fin HPC_201404_ALM

      cdsKardex.FieldByName('NISAID').AsString := 'Saldo Inicial';
      cdsKardex.FieldByName('NISAFREG').AsString := xFecha;
      cdsKardex.FieldByName('SALDO').AsFloat := Mtx4000.FMant.cds2.FieldByname('STKINI').AsFloat;
      cdsKardex.FieldByName('PREPROMINI').AsFloat := xPreproini;
      cdsKardex.FieldByName('ARTPCG').AsFloat := xPreproini;
      cdsKardex.FieldByName('STKVALINI').AsFloat := DMALM.FRound(Mtx4000.FMant.cds2.FieldByname('STKINI').AsFloat*xPreproini,15,4);
      cdsKardex.FieldByName('INGRESOVAL').AsFloat := 0.00;
      cdsKardex.FieldByName('SALIDAVAL').AsFloat := 0.00;
      cdsKardex.FieldByName('SALDOVAL').AsFloat := DMALM.FRound(Mtx4000.FMant.cds2.FieldByname('STKINI').AsFloat*xPreproini,15,4);

      While Not DMALM.cdsStockAct.eof Do
      Begin
      // llena tabla temporal CDS
         cdsKardex.Insert;
         cdsKardex.FieldByName('CIAID').AsString := DMALM.cdsStockAct.FieldByname('CIAID').AsString;
         cdsKardex.FieldByName('CIADES').AsString := DMALM.cdsStockAct.FieldByname('CIADES').AsString;
         cdsKardex.FieldByName('ALMID').AsString := DMALM.cdsStockAct.FieldByname('ALMID').AsString;
         cdsKardex.FieldByName('ALMDES').AsString := DMALM.cdsStockAct.FieldByname('ALMDES').AsString;
         cdsKardex.FieldByName('TINID').AsString := DMALM.cdsStockAct.FieldByname('TINID').AsString;
         cdsKardex.FieldByName('TINDES').AsString := DMALM.cdsStockAct.FieldByname('TINDES').AsString;
         cdsKardex.FieldByName('ARTID').AsString := DMALM.cdsStockAct.FieldByname('ARTID').AsString;
         cdsKardex.FieldByName('ARTDES').AsString := DMALM.cdsStockAct.FieldByname('ARTDES').AsString;
         cdsKardex.FieldByName('GRARID').AsString := DMALM.cdsStockAct.FieldByname('GRARID').AsString;
         cdsKardex.FieldByName('GRARDES').AsString := DMALM.cdsStockAct.FieldByname('GRARDES').AsString;
         cdsKardex.FieldByName('NISAID').AsString := DMALM.cdsStockAct.FieldByname('NISAID').AsString;
         cdsKardex.FieldByName('NISSIT').AsString := DMALM.cdsStockAct.FieldByname('NISSIT').AsString;
         cdsKardex.FieldByName('KDXCNTG').AsString := DMALM.cdsStockAct.FieldByname('KDXCNTG').AsString;
         cdsKardex.FieldByName('INGRESO').AsString := DMALM.cdsStockAct.FieldByname('INGRESO').AsString;
         cdsKardex.FieldByName('SALIDA').AsString := DMALM.cdsStockAct.FieldByname('SALIDA').AsString;
         cdsKardex.FieldByName('NISATIP').AsString := DMALM.cdsStockAct.FieldByname('NISATIP').AsString;
         cdsKardex.FieldByName('ORDENIMP').AsString := DMALM.cdsStockAct.FieldByname('NISATIP').AsString; // HPC_201405_ALM
         cdsKardex.FieldByName('NISAFREG').AsDateTime := DMALM.cdsStockAct.FieldByname('NISAFREG').AsDateTime;
         cdsKardex.FieldByName('TMONID').AsString := DMALM.cdsStockAct.FieldByname('TMONID').AsString;
         cdsKardex.FieldByName('ANOMESMOV').AsString := DMALM.cdsStockAct.FieldByname('ANOMESMOV').AsString;
         cdsKardex.FieldByName('STKINI').AsString := DMALM.cdsStockAct.FieldByname('STKINI').AsString;
         cdsKardex.FieldByName('TRIID').AsString := DMALM.cdsStockAct.FieldByname('TRIID').AsString;
         cdsKardex.FieldByName('TRIDES').AsString := DMALM.cdsStockAct.FieldByname('TRIDES').AsString;
         cdsKardex.FieldByName('PREPROMINI').AsFloat := xPreproini;

         If cdsKardex.FieldByName('INGRESO').AsFloat > 0 Then
         Begin
            cdsKardex.FieldByName('ARTPCG').AsFloat := DMALM.cdsStockAct.FieldByname('ARTPCG').AsFloat;
            cdsKardex.FieldByName('STKVALINI').AsFloat := DMALM.FRound(xSaldo*cdsKardex.FieldByName('ARTPCG').AsFloat,15,4);
            cdsKardex.FieldByName('INGRESOVAL').AsFloat := DMALM.FRound(cdsKardex.FieldByName('KDXCNTG').AsFloat
                                                                *cdsKardex.FieldByName('ARTPCG').AsFloat,15,4);
            cdsKardex.FieldByName('SALIDAVAL').AsFloat := 0.00;
            xPreproFin := (xSaldo*xPreproFin+cdsKardex.FieldByName('INGRESO').AsFloat*cdsKardex.FieldByName('ARTPCG').AsFloat)
                         /(xSaldo+cdsKardex.FieldByName('INGRESO').AsFloat);
            xSaldo := xSaldo + cdsKardex.FieldByName('INGRESO').AsFloat;
            cdsKardex.FieldByName('SALDO').AsFloat := xSaldo;
            cdsKardex.FieldByName('SALDOVAL').AsFloat := cdsKardex.FieldByName('STKVALINI').AsFloat
                                                        +cdsKardex.FieldByName('INGRESOVAL').AsFloat;
         End;
         If cdsKardex.FieldByName('SALIDA').AsFloat > 0 Then
         Begin
            cdsKardex.FieldByName('ARTPCG').AsFloat := xPreproFin;  // DMALM.cdsStockAct.FieldByname('ARTPCG').AsFloat;
            cdsKardex.FieldByName('STKVALINI').AsFloat := DMALM.FRound(xSaldo*cdsKardex.FieldByName('ARTPCG').AsFloat,15,4);
            cdsKardex.FieldByName('INGRESOVAL').AsFloat := 0.00;
            cdsKardex.FieldByName('SALIDAVAL').AsFloat := DMALM.FRound(cdsKardex.FieldByName('KDXCNTG').AsFloat
                                                                *cdsKardex.FieldByName('ARTPCG').AsFloat,15,4);

            //xPreproFin := cdsKardex.FieldByName('ARTPCG').AsFloat;
            xSaldo := xSaldo - cdsKardex.FieldByName('SALIDA').AsFloat;
            cdsKardex.FieldByName('SALDO').AsFloat := xSaldo;
            cdsKardex.FieldByName('SALDOVAL').AsFloat := cdsKardex.FieldByName('STKVALINI').AsFloat
                                                        -cdsKardex.FieldByName('SALIDAVAL').AsFloat;
         End;
         DMALM.cdsStockAct.Next;
      End; //End While   cdsStockAct.eof

   // Saldo final
      cdsKardex.Insert;
      cdsKardex.FieldByName('CIAID').AsString := Mtx4000.FMant.cds2.FieldByname('CIAID').AsString;
      cdsKardex.FieldByName('CIADES').AsString := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', sSQL1, 'CIADES');
      cdsKardex.FieldByName('ALMID').AsString := Mtx4000.FMant.cds2.FieldByname('ALMID').AsString;
      cdsKardex.FieldByName('ALMDES').AsString := DMALM.DisplayDescrip('prvSQL', 'TGE151', 'ALMDES', ssQl2, 'ALMDES');
      cdsKardex.FieldByName('TINID').AsString := Mtx4000.FMant.cds2.FieldByname('TINID').AsString;
      cdsKardex.FieldByName('ARTID').AsString := Mtx4000.FMant.cds2.FieldByname('ARTID').AsString;
      cdsKardex.FieldByName('ARTDES').AsString := DMALM.DisplayDescrip('prvSQL', 'TGE205', 'ARTDES', ssQl3, 'ARTDES');
      cdsKardex.FieldByName('GRARID').AsString := DMALM.DisplayDescrip('prvSQL', 'TGE205', 'GRARID', ssQl3, 'GRARID');
      cdsKardex.FieldByName('GRARDES').AsString := DMALM.DisplayDescrip('prvSQL', 'TGE131', 'GRARDES', ssQl4, 'GRARDES');
   // Inicio HPC_201404_ALM
   // se agrega el valor Z al Tipo de Movimiento cuando se trate de Saldos Finales, para que ordene y coloque en Último lugar
      cdsKardex.FieldByName('ORDENIMP').AsString := 'Z'; // HPC_201405_ALM
   // Final HPC_201404_ALM
      cdsKardex.FieldByName('NISAID').AsString := 'Saldo Final';
      If xPeriodos = 1 Then
         cdsKardex.FieldByName('NISAFREG').AsString := xFechafinal2
      Else
         cdsKardex.FieldByName('NISAFREG').AsString := xFechafinal;

      cdsKardex.FieldByName('SALDO').AsFloat := Mtx4000.FMant.cds2.FieldByname('STKFIN').AsFloat;
      cdsKardex.FieldByName('PREPROMINI').AsFloat := xPreproFin;
      cdsKardex.FieldByName('ARTPCG').AsFloat := xPreproFin;

      cdsKardex.FieldByName('STKVALINI').AsFloat := DMALM.FRound(Mtx4000.FMant.cds2.FieldByname('STKFIN').AsFloat*xPreproFin,15,4);
      cdsKardex.FieldByName('INGRESOVAL').AsFloat := 0.00;
      cdsKardex.FieldByName('SALIDAVAL').AsFloat := 0.00;
      cdsKardex.FieldByName('SALDOVAL').AsFloat := DMALM.FRound(Mtx4000.FMant.cds2.FieldByname('STKINI').AsFloat*xPreproini,15,4);

      Mtx4000.FMant.cds2.Next;
      xPeriodos := xPeriodos - 1;
      xSaldo := Mtx4000.FMant.cds2.FieldByname('STKINI').AsFloat;
   End; //End While FMant.cds2.eof

   Mtx4000.FMant.cds2.EnableControls;
   Screen.Cursor := crDefault;
// Inicio HPC_201404_ALM
// se cambia orden de presentación del Kardex
// Inicio HPC_201405_ALM
//   cdsKardex.IndexFieldNames := 'CIAID;ALMID;GRARID;TINID;ARTID;NISAFREG;NISATIP;NISAID;';
   cdsKardex.IndexFieldNames := 'CIAID;ALMID;GRARID;TINID;ARTID;NISAFREG;ORDENIMP;NISAID;';
// Fin HPC_201405_ALM
// Final HPC_201404_ALM
   cdsKardex.first;

   dbKardex.DataSource := dsKardex;
   RepKardex.DataPipeline := dbKardex;
   If rgTipoStocValo.ItemIndex = 0 Then
      RepKardex.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RepKardex2.rtm'
   else
      RepKardex.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RepKardexValorizado.rtm';
   RepKardex.Template.LoadFromFile;

   pplTituloKardex.Caption := 'Kardex del ' + xFechaIniTitulo + ' al ' + datetostr(Dates);

   If cbDiseno.Checked Then
   Begin
      ppDesigner1.Report := RepKardex;
      ppDesigner1.ShowModal;
   End
   Else
   Begin
      RepKardex.Print;
      RepKardex.Stop;
   End;
End;

Procedure TFToolKdx.CalcularKardex();
Var
   sSQL, xSQL, sTOTAL: String;
   SalIniDes, SalIniHas, sDesde, sHasta: String;
   xSalIni, xSalIniU, xVecesCont: Double;
   x10: Integer;
   YH, MH, DH: word;
Begin
   If dtpDesde.Date > dtpHasta.Date Then
   Begin
      ErrorMsg(Caption, ' La Fecha Final no puede ser Menor a la Fecha Inicial');
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   xwhere := '';
   InsDataFil; // Inserta en el LOG323
   DecodeDate(dtpDesde.Date, Y, M, D);
   DecodeDate(dtpHasta.Date, YH, MH, DH);

   SalIniDes := '01' + '/' + IntToStr(M) + '/' + IntToStr(Y);
   If D = 1 Then
      SalIniHas := IntToStr(D) + '/' + IntToStr(M) + '/' + IntToStr(Y)
   Else
      SalIniHas := IntToStr(D - 1) + '/' + IntToStr(M) + '/' + IntToStr(Y);

   SalIniDes := quotedStr(formatdatetime(DMALM.wFormatFecha, strtodatetime(SalIniDes)));
   SalIniHas := quotedStr(formatdatetime(DMALM.wFormatFecha, strtodatetime(SalIniHas)));
   sDesde := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

// Inicio HPC_201402_ALM
{
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      If D > 1 Then
      Begin
         sTOTAL := 'SELECT ' +
            'MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, DATE(' + SalIniHas + ') NISAFREG, TIME(''00:00:00'') KDXHREG, ' +
            '''00'' TDAID, ''Saldo Inicial'' TDAABR, '''' TDATIP, MOV.ARTFUC, ' +
            'MOV.ARTID, MOV.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, ' +
            ''' '' NISAID,  '' '' NISATIP, ' +
            'MOV.SALDOG + XX.TOTINGG - XX.TOTSALG SALDOG, ' +
            'MOV.SALDOU + XX.TOTINGU - XX.TOTSALU SALDOU, ' +
            'MOV.MONTOG + XX.MTOINGG - XX.MTOSALG MONTOG, ' +
            'MOV.MONTOU + XX.MTOINGU - XX.MTOSALU MONTOU, ' +
            '0.00 ARTPCG, 0.00 ARTPCU, ' +
            '0.00 KDXCNTG, 0.00 KDXCNTU, ' +
            '0.00 KDXCNTGI, 0.00 KDXCNTUI, ' +
            '0.00 KDXMTOTOIG, 0.00 KDXMTOTOIU, ' +
            '0.00 KDXCNTGS, 0.00 KDXCNTUS, ' +
            'MOV.ARTCPROG, MOV.ARTCPROU, ' +
            '0.00 KDXCPROGI, 0.00 KDXCPROUI, ' +
            '0.00 KDXMTOTOSG, 0.00 KDXMTOTOSU, ' +
            '0.00 KDXCPROGS, 0.00 KDXCPROUS, ' +
            'ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZU, 0.00 VALCNTG, 0.00 VALCNTU, ' +
            ''' '' TRIID, '' '' TRIDES,''          '' NOTADESPID,0.00  RESERVA,0.00 DISPONIBLE ' +
            'FROM LOG323  AS MOV ' +
            'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) ' +
            'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) ' +
            'LEFT JOIN TGE101 CIA   ON ( MOV.CIAID=CIA.CIAID ) ' +
            'LEFT JOIN TGE126 LOC   ON ( MOV.CIAID=LOC.CIAID AND MOV.LOCID=LOC.LOCID ) ' +
            'LEFT JOIN TGE151 ALM   ON ( MOV.CIAID=ALM.CIAID AND MOV.LOCID=ALM.LOCID AND MOV.TINID=ALM.TINID AND MOV.ALMID=ALM.ALMID ) ' +
            'LEFT JOIN TGE152 TIN   ON ( MOV.CIAID=TIN.CIAID AND MOV.TINID=TIN.TINID ) ' +
            'LEFT JOIN TGE131 GRA   ON ( MOV.CIAID=GRA.CIAID AND MOV.TINID=GRA.TINID AND MOV.GRARID=GRA.GRARID ) ' +
            'LEFT JOIN TGE205 ART   ON ( MOV.CIAID=ART.CIAID AND MOV.TINID=ART.TINID AND MOV.ARTID=ART.ARTID ) ' +
            'LEFT JOIN (SELECT CIAID, ARTID, ' +
            'SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(KDXCNTG,0.00) ELSE (0.00) END) TOTINGG, ' +
            'SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(KDXCNTG,0.00) ELSE (0.00) END) TOTSALG, ' +
            'SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(KDXCNTU,0.00) ELSE (0.00) END) TOTINGU, ' +
            'SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(KDXCNTU,0.00) ELSE (0.00) END) TOTSALU, ' +
            'SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(ARTPCG,0.00) ELSE (0.00) END) MTOINGG, ' +
            'SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(ARTPCG,0.00) ELSE (0.00) END) MTOSALG, ' +
            'SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(ARTPCU,0.00) ELSE (0.00) END) MTOINGU, ' +
            'SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(ARTPCU,0.00) ELSE (0.00) END) MTOSALU  ' +
            'FROM LOG315 WHERE ' +
            'NISAFREG>=' + SalIniDes + ' AND ' +
            'NISAFREG<=' + SalIniHas + ' ' +
            'AND NISSIT=''ACEPTADO'' ' +
            'GROUP BY CIAID, ARTID ' +
            ') XX ON (MOV.CIAID=XX.CIAID AND MOV.ARTID=XX.ARTID) ' +
            'WHERE MOV.USUARIO=''' + DMALM.wUsuario + '''';
         sTOTAL := sTOTAL + ' UNION ALL ';
      End
      Else
         If D = 1 Then
         Begin
            sTOTAL := 'SELECT ' +
               'MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, DATE(' + SalIniHas + ') NISAFREG, TIME(''00:00:00'') KDXHREG, ''00'' TDAID, ''Saldo Inicial'' TDAABR, '''' TDATIP, MOV.ARTFUC, ' +
               'MOV.ARTID, MOV.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, ' +
               ''' '' NISAID,  '' '' NISATIP, ' +
               'MOV.SALDOG, MOV.SALDOU, ' +
               'MOV.MONTOG, MOV.MONTOU, 0.00 ARTPCG, 0.00 ARTPCU, ' +
               '0.00 KDXCNTG, 0.00 KDXCNTU, ' +
               '0.00 KDXCNTGI, 0.00 KDXCNTUI, 0.00 KDXMTOTOIG, 0.00 KDXMTOTOIU, ' +
               '0.00 KDXCNTGS, 0.00 KDXCNTUS, ' +
               'MOV.ARTCPROG, MOV.ARTCPROU, ' +
               '0.00 KDXCPROGI, 0.00 KDXCPROUI, ' +
               '0.00 KDXMTOTOSG, 0.00 KDXMTOTOSU, ' +
               '0.00 KDXCPROGS, 0.00 KDXCPROUS, ' +
               'ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZU, 0.00 VALCNTG, 0.00 VALCNTU, ' +
               ''' '' TRIID, '' '' TRIDES,''          '' NOTADESPID, 0.00  RESERVA,0.00 DISPONIBLE ' +
               'FROM LOG323 AS MOV ' +
               'LEFT JOIN TGE130 UMEDG ON ( UMEDG.UNMID=MOV.UNMIDG ) ' +
               'LEFT JOIN TGE130 UMEDU ON ( UMEDU.UNMID=MOV.UNMIDU ) ' +
               'LEFT JOIN TGE205 ART   ON ( ART.CIAID=MOV.CIAID AND ART.TINID=MOV.TINID AND ART.ARTID=MOV.ARTID ) ' +
               'LEFT JOIN TGE101 CIA   ON ( CIA.CIAID=MOV.CIAID ) ' +
               'LEFT JOIN TGE126 LOC   ON ( LOC.CIAID=MOV.CIAID AND LOC.LOCID=MOV.LOCID ) ' +
               'LEFT JOIN TGE151 ALM   ON ( ALM.CIAID=MOV.CIAID AND ALM.LOCID=MOV.LOCID AND ALM.TINID=MOV.TINID AND ALM.ALMID=MOV.ALMID) ' +
               'LEFT JOIN TGE152 TIN   ON ( TIN.CIAID=MOV.CIAID AND TIN.TINID=MOV.TINID ) ' +
               'LEFT JOIN TGE131 GRA   ON ( GRA.CIAID=MOV.CIAID AND GRA.TINID=MOV.TINID AND GRA.GRARID=MOV.GRARID) ' +
               'WHERE MOV.USUARIO=''' + DMALM.wUsuario + '''';
            sTOTAL := sTOTAL + ' UNION ALL ';
         End;
    // Movimientos Log315
      sSQL := 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, MOV.NISAFREG, MOV.KDXHREG, MOV.TDAID, DOC.TDAABR, DOC.TDATIP, ' +
         'MOV.ARTFUC, MOV.ARTID, ART.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, ' +
         'MOV.NISAID, MOV.NISATIP, 0.00 SALDOG, 0.00 SALDOU, 0.00 MONTOG, 0.00 MONTOU, MOV.ARTPCG, MOV.ARTPCU, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (-1*MOV.KDXCNTG) END AS KDXCNTG, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (-1*MOV.KDXCNTU) END AS KDXCNTU, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (0.00) END AS KDXCNTGI, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (0.00) END AS KDXCNTUI, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG * MOV.ARTPCG) ELSE (0.00) END AS KDXMTOTOIG, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU * MOV.ARTPCU) ELSE (0.00) END AS KDXMTOTOIU, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG) ELSE (0.00) END AS KDXCNTGS, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU) ELSE (0.00) END AS KDXCNTUS, ART.ARTCPROG, ART.ARTCPROU, ' +
         'MOV.KDXCNTG * MOV.ARTPCG KDXCPROGI, ' +
         'MOV.KDXCNTU * MOV.ARTPCU KDXCPROUI, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG * MOV.ARTPCG) ELSE (0.00) END AS KDXMTOTOSG, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU * MOV.ARTPCU) ELSE (0.00) END AS KDXMTOTOSU, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG * ART.ARTCPROG) ELSE (0.00) END AS KDXCPROGS, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU * ART.ARTCPROU) ELSE (0.00) END AS KDXCPROUS, ' +
         'ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZU, 0.00 VALCNTG, 0.00 VALCNTU, ' +
         'MOV.TRIID, CASE WHEN MOV.NISATIP=''INGRESO'' THEN TRII.TRIDES ELSE TRIS.TRIDES END TRIDES ' +
         ',''          '' NOTADESPID,0.00  RESERVA,0.00 DISPONIBLE ' +
         'FROM LOG315 AS MOV ' +
         'LEFT JOIN LOG323 B     ON ( B.USUARIO=''' + DMALM.wUsuario + ''' ) ' +
         'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) ' +
         'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) ' +
         'LEFT JOIN TGE157 DOC   ON ( MOV.TDAID=DOC.TDAID ) ' +
         'LEFT JOIN TGE205 ART   ON ( MOV.CIAID=ART.CIAID AND MOV.TINID=ART.TINID AND MOV.ARTID=ART.ARTID ) ' +
         'LEFT JOIN TGE101 CIA   ON ( MOV.CIAID=CIA.CIAID ) ' +
         'LEFT JOIN TGE126 LOC   ON ( MOV.CIAID=LOC.CIAID AND MOV.LOCID=LOC.LOCID) ' +
         'LEFT JOIN TGE151 ALM   ON ( MOV.CIAID=ALM.CIAID AND MOV.LOCID=ALM.LOCID AND MOV.TINID=ALM.TINID AND MOV.ALMID=ALM.ALMID) ' +
         'LEFT JOIN TGE152 TIN   ON ( MOV.CIAID=TIN.CIAID AND MOV.TINID=TIN.TINID ) ' +
         'LEFT JOIN TGE131 GRA   ON ( MOV.CIAID=GRA.CIAID AND MOV.TINID=GRA.TINID AND MOV.GRARID=GRA.GRARID) ' +
         'LEFT JOIN TGE208 TRII  ON ( MOV.TRIID=TRII.TRIID AND TRII.TRISGT=''I'') ' +
         'LEFT JOIN TGE208 TRIS  ON ( MOV.TRIID=TRIS.TRIID AND TRIS.TRISGT=''S'') ' +
         'WHERE ' +
         'MOV.NISAFREG>=' + sDesde + ' AND ' +
         'MOV.NISAFREG<=' + sHasta + ' ' +
         'AND MOV.NISSIT=''ACEPTADO'' ' +
      //A Solicitud de Vito se volvio a cambiar se le quito el estado CC de Jorge
      //'AND COALESCE(ART.ARTEST,'''')<>''A'' '+
      'AND (MOV.CIAID=B.CIAID ' +
         'AND MOV.LOCID=B.LOCID ' +
         'AND MOV.TINID=B.TINID ' +
         'AND MOV.ALMID=B.ALMID ' +
         'AND MOV.ARTID=B.ARTID) ' +
         'ORDER BY CIAID, LOCID, TINID, ALMID, GRARID, ARTID, NISAFREG, KDXHREG';
   //'ORDER BY CIAID, LOCID, ALMID, TINID, GRARID, ARTID, NISAFREG, TDATIP';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
}
   If D > 1 Then
   Begin
      sTOTAL := 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, TO_DATE(' + SalIniHas + ') NISAFREG, '
               +'       TO_CHAR(SYSDATE,''DD-MM-YYYY HH:MI:SSSSS'') KDXHREG, '
               +'       ''00'' TDAID, ''Saldo Inicial'' TDAABR, '''' TDATIP, MOV.ARTFUC, MOV.ARTID, MOV.ARTDES, MOV.UNMIDG, '
               +'       UMEDG.UNMDES UMEDGDES, MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, '' '' NISAID,  '' '' NISATIP, '
               +'       NVL(MOV.SALDOG,0) + NVL(XX.TOTINGG,0) - NVL(XX.TOTSALG,0) SALDOG, '
               +'       NVL(MOV.SALDOU,0) + NVL(XX.TOTINGU,0) - NVL(XX.TOTSALU,0) SALDOU, '
               +'       NVL(MOV.MONTOG,0) + NVL(XX.MTOINGG,0) - NVL(XX.MTOSALG,0) MONTOG, '
               +'       NVL(MOV.MONTOU,0) + NVL(XX.MTOINGU,0) - NVL(XX.MTOSALU,0) MONTOU, '
               +'       0.00 ARTPCG, 0.00 ARTPCU, 0.00 KDXCNTG, 0.00 KDXCNTU, 0.00 KDXCNTGI, 0.00 KDXCNTUI,  0.00 KDXMTOTOIG, '
               +'       0.00 KDXMTOTOIU, 0.00 KDXCNTGS, 0.00 KDXCNTUS, MOV.ARTCPROG, MOV.ARTCPROU, '
               +'       0.00 KDXCPROGI, 0.00 KDXCPROUI, 0.00 KDXMTOTOSG, 0.00 KDXMTOTOSU, 0.00 KDXCPROGS, 0.00 KDXCPROUS, '
               +'       ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, '
               +'       0.00 VALORIZ, 0.00 VALORIZU, 0.00 VALCNTG, 0.00 VALCNTU, '
               +'       '' '' TRIID, '' '' TRIDES '
               +'  FROM LOG323 MOV, TGE130 UMEDG, TGE130 UMEDU, TGE101 CIA, TGE126 LOC, TGE151 ALM, TGE152 TIN, '
               +'       TGE131 GRA, TGE205 ART, '
               +'      (SELECT CIAID, ARTID,ALMID, '
               +'              SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(KDXCNTG,0.00) ELSE (0.00) END) TOTINGG, '
               +'              SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(KDXCNTG,0.00) ELSE (0.00) END) TOTSALG, '
               +'              SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(KDXCNTU,0.00) ELSE (0.00) END) TOTINGU, '
               +'              SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(KDXCNTU,0.00) ELSE (0.00) END) TOTSALU, '
               +'              SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(ARTPCG,0.00) ELSE (0.00) END) MTOINGG, '
               +'              SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(ARTPCG,0.00) ELSE (0.00) END) MTOSALG, '
               +'              SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(ARTPCU,0.00) ELSE (0.00) END) MTOINGU, '
               +'              SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(ARTPCU,0.00) ELSE (0.00) END) MTOSALU  '
               +'         FROM LOG315 '
               +'        WHERE NISAFREG>=TO_DATE(' + SalIniDes + ') '
               +'          AND NISAFREG<=TO_DATE(' + SalIniHas + ') '
               +'          AND NISSIT=''ACEPTADO'' '
               +'        GROUP BY CIAID, ARTID,ALMID ) XX '
               +' WHERE MOV.USUARIO=''' + DMALM.wUsuario + ''' '
               +'   AND MOV.UNMIDG=UMEDG.UNMID(+) '
               +'   AND MOV.UNMIDU=UMEDU.UNMID(+) '
               +'   AND MOV.CIAID=CIA.CIAID(+) '
               +'   AND MOV.CIAID=LOC.CIAID(+) AND MOV.LOCID=LOC.LOCID(+) '
               +'   AND MOV.CIAID=ALM.CIAID(+) AND MOV.LOCID=ALM.LOCID(+) AND MOV.TINID=ALM.TINID(+) AND MOV.ALMID=ALM.ALMID(+) '
               +'   AND MOV.CIAID=TIN.CIAID(+) AND MOV.TINID=TIN.TINID(+) '
               +'   AND MOV.CIAID=GRA.CIAID(+) AND MOV.TINID=GRA.TINID(+) AND MOV.GRARID=GRA.GRARID(+) '
               +'   AND MOV.CIAID=ART.CIAID(+) AND MOV.TINID=ART.TINID(+) AND MOV.ARTID=ART.ARTID(+) '
               +'   AND MOV.CIAID=XX.CIAID(+) AND MOV.ARTID=XX.ARTID(+) AND MOV.ALMID=XX.ALMID(+) '
               +' UNION ALL ';
   End
   Else
   Begin
      If D = 1 Then
      Begin
         sTOTAL := 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, TO_DATE(' + SalIniHas + ') NISAFREG, '
                  +'       TO_CHAR(SYSDATE,''DD-MM-YYYY HH:MI:SSSSS'') KDXHREG, '
                  +'       ''00'' TDAID, ''Saldo Inicial'' TDAABR, '' '' TDATIP, MOV.ARTFUC, MOV.ARTID, MOV.ARTDES, '
                  +'       MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, '
                  +'       MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, '' '' NISAID,  '' '' NISATIP, MOV.SALDOG, MOV.SALDOU, '
                  +'       MOV.MONTOG, MOV.MONTOU, 0 ARTPCG, '
                  +'       0.00 ARTPCU, 0.00 KDXCNTG, 0.00 KDXCNTU, 0.00 KDXCNTGI, 0.00 KDXCNTUI,  0.00 KDXMTOTOIG, '
                  +'       0.00 KDXMTOTOIU, 0.00 KDXCNTGS, 0.00 KDXCNTUS, MOV.ARTCPROG, MOV.ARTCPROU, 0.00 KDXCPROGI, '
                  +'       0.00 KDXCPROUI, 0.00 KDXMTOTOSG, 0.00 KDXMTOTOSU, 0.00 KDXCPROGS, 0.00 KDXCPROUS, ART.ARTCONT, '
                  +'       CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZU, '
                  +'       0.00 VALCNTG, 0.00 VALCNTU, '
                  +'       '' '' TRIID, '' '' TRIDES '
                  +'  FROM LOG323 MOV, TGE130 UMEDG, TGE130 UMEDU, TGE205 ART, TGE101 CIA, TGE126 LOC, TGE151 ALM, '
                  +'       TGE152 TIN, TGE131 GRA '
                  +' WHERE MOV.USUARIO=''' + DMALM.wUsuario + ''' '
                  +'   AND MOV.UNMIDG=UMEDG.UNMID(+) '
                  +'   AND MOV.UNMIDU=UMEDU.UNMID(+) '
                  +'   AND MOV.CIAID=ART.CIAID(+) AND MOV.TINID=ART.TINID(+) AND MOV.ARTID=ART.ARTID(+) '
                  +'   AND MOV.CIAID=CIA.CIAID(+) '
                  +'   AND MOV.CIAID=LOC.CIAID(+) AND MOV.LOCID=LOC.LOCID(+) '
                  +'   AND MOV.CIAID=ALM.CIAID(+) AND MOV.LOCID=ALM.LOCID(+) '
                  +'   AND MOV.TINID=ALM.TINID(+) AND MOV.ALMID=ALM.ALMID(+) '
                  +'   AND MOV.CIAID=TIN.CIAID(+) AND MOV.TINID=TIN.TINID(+) '
                  +'   AND MOV.CIAID=GRA.CIAID(+) AND MOV.TINID=GRA.TINID(+) AND MOV.GRARID=GRA.GRARID(+) '
                  +' UNION ALL ';
      End;
   End;
   // Movimientos Log315
   sSQL := 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, MOV.NISAFREG, '
          +'       TO_CHAR(MOV.KDXHREG,''DD-MM-YYYY HH:MI:SSSSS'') KDXHREG, MOV.TDAID, DOC.TDAABR, '
          +'       DOC.TDATIP, MOV.ARTFUC, MOV.ARTID, ART.ARTDES, MOV.UNMIDG, UMEDG.UNMDES UMEDGDES, '
          +'       MOV.UNMIDU, UMEDU.UNMDES UMEDUDES, MOV.NISAID, MOV.NISATIP, 0.00 SALDOG, 0.00 SALDOU, '
          +'       0.00 MONTOG, 0.00 MONTOU, MOV.ARTPCG, MOV.ARTPCU, '
          +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (-1*MOV.KDXCNTG) END AS KDXCNTG, '
          +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (-1*MOV.KDXCNTU) END AS KDXCNTU, '
          +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (0.00) END AS KDXCNTGI, '
          +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (0.00) END AS KDXCNTUI, '
          +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG * MOV.ARTPCG) ELSE (0.00) END AS KDXMTOTOIG, '
          +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU * MOV.ARTPCU) ELSE (0.00) END AS KDXMTOTOIU, '
          +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG) ELSE (0.00) END AS KDXCNTGS, '
          +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU) ELSE (0.00) END AS KDXCNTUS, '
          +'       ART.ARTCPROG, ART.ARTCPROU, MOV.KDXCNTG * MOV.ARTPCG KDXCPROGI, MOV.KDXCNTU * MOV.ARTPCU KDXCPROUI, '
          +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG * MOV.ARTPCG) ELSE (0.00) END AS KDXMTOTOSG, '
          +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU * MOV.ARTPCU) ELSE (0.00) END AS KDXMTOTOSU, '
          +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG * ART.ARTCPROG) ELSE (0.00) END AS KDXCPROGS, '
          +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU * ART.ARTCPROU) ELSE (0.00) END AS KDXCPROUS, '
          +'       ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZU, '
          +'       0.00 VALCNTG, 0.00 VALCNTU, '
          +'       MOV.TRIID, CASE WHEN MOV.NISATIP=''INGRESO'' THEN TRII.TRIDES ELSE TRIS.TRIDES END TRIDES '
          +'  FROM LOG315 MOV, LOG323 B, TGE130 UMEDG, TGE130 UMEDU, TGE157 DOC, TGE205 ART, TGE101 CIA, TGE126 LOC, '
          +'       TGE151 ALM, TGE152 TIN, TGE131 GRA, TGE208 TRII, TGE208 TRIS '
          +' WHERE MOV.NISAFREG>=TO_DATE(' + sDesde + ') '
          +'   AND MOV.NISAFREG<=TO_DATE(' + sHasta + ') '
          +'   AND MOV.NISSIT=''ACEPTADO'' '
          +'   AND MOV.CIAID=B.CIAID AND MOV.LOCID=B.LOCID AND MOV.TINID=B.TINID AND MOV.ALMID=B.ALMID '
          +'   AND MOV.ARTID=B.ARTID AND B.USUARIO=''' + DMALM.wUsuario + ''' '
          +'   AND MOV.UNMIDG=UMEDG.UNMID(+) '
          +'   AND MOV.UNMIDU=UMEDU.UNMID(+) '
          +'   AND MOV.TDAID=DOC.TDAID(+) '
          +'   AND MOV.CIAID=ART.CIAID(+) AND MOV.TINID=ART.TINID(+) AND MOV.ARTID=ART.ARTID(+) '
          +'   AND MOV.CIAID=CIA.CIAID(+) '
          +'   AND MOV.LOCID=LOC.LOCID(+) AND MOV.CIAID=LOC.CIAID(+) '
          +'   AND MOV.CIAID=ALM.CIAID(+) AND MOV.LOCID=ALM.LOCID(+) AND MOV.TINID=ALM.TINID(+) AND MOV.ALMID=ALM.ALMID(+) '
          +'   AND MOV.CIAID=TIN.CIAID(+) AND MOV.TINID=TIN.TINID(+) '
          +'   AND MOV.CIAID=GRA.CIAID(+) AND MOV.TINID=GRA.TINID(+) AND MOV.GRARID=GRA.GRARID(+) '
          +'   AND MOV.TRIID=TRII.TRIID(+) AND TRII.TRISGT(+)=''I'' '
          +'   AND MOV.TRIID=TRIS.TRIID(+) AND TRIS.TRISGT(+)=''S'' '
          +' ORDER BY CIAID, LOCID, ALMID, TINID, GRARID, ARTID, NISAFREG,  TDAID, KDXHREG';
//      End;
// Final HPC_201402_ALM

   sTOTAL := sTOTAL + sSQL;
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(sTOTAL);
   DMALM.cdsReporte.Open;
   DMALM.cdsReporte.IndexFieldNames := 'CIAID;ALMID;ARTID;NISAFREG;TDAID;NISATIP';

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Error, No Existen Registros para esta Consulta');
      DMALM.cdsReporte.Close;
      exit;
   End;

   If rgTipoStocValo.ItemIndex = 0 Then
   Begin
      ppKdxStock.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexFiltro.Rtm';
      ppKdxStock.Template.LoadFromFile
   End
   Else
   Begin
      pprDetalle.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexFilVal.Rtm';
      pprDetalle.Template.LoadFromFile
   End;

   If rgTipoStocValo.ItemIndex = 0 Then
      ppLabel81.Caption := 'KARDEX DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date)
   Else
      ppLabel49.Caption := 'KARDEX VALORIZADO DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      xSalIni := DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat + DMALM.cdsReporte.FieldByName('SALDOG').AsFloat;
      xSalIniU := DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat + DMALM.cdsReporte.FieldByName('SALDOU').AsFloat;
      DMALM.cdsReporte.Edit;
      DMALM.cdsReporte.FieldByName('VALCNTG').AsFloat := xSalIni;
      DMALM.cdsReporte.FieldByName('VALCNTU').AsFloat := xSalIniU;
      If (SRV_D = 'DB2NT') And (rgTipoStocValo.ItemIndex = 0) Then
      Begin
         If (DMALM.cdsReporte.FieldByName('TDATIP').AsString = 'SALIDA') Then
         Begin
            DMALM.cdsSQL.SetKey;
            DMALM.cdsSQL.FieldByName('CIAID').AsString := DMALM.cdsReporte.FieldByName('CIAID').AsString;
            DMALM.cdsSQL.FieldByName('SERIENGUIA').AsString := DMALM.cdsReporte.FieldByName('NISAID').AsString;
            If DMALM.cdsSQL.GotoKey Then
               DMALM.cdsReporte.FieldByName('NOTADESPID').AsString := DMALM.cdsSQL.FieldByName('NOTADESPID').AsString
         End;
         DMALM.cdsQry6.SetKey;
         DMALM.cdsQry6.FieldByName('CIAID').AsString := DMALM.cdsReporte.FieldByName('CIAID').AsString;
         DMALM.cdsQry6.FieldByName('LOCID').AsString := DMALM.cdsReporte.FieldByName('LOCID').AsString;
         DMALM.cdsQry6.FieldByName('TINID').AsString := DMALM.cdsReporte.FieldByName('TINID').AsString;
         DMALM.cdsQry6.FieldByName('ALMID').AsString := DMALM.cdsReporte.FieldByName('ALMID').AsString;
         DMALM.cdsQry6.FieldByName('ARTID').AsString := DMALM.cdsReporte.FieldByName('ARTID').AsString;
         If DMALM.cdsQry6.GotoKey Then
         Begin
            DMALM.cdsReporte.FieldByName('DISPONIBLE').AsFloat := DMALM.cdsQry6.FieldByName('DISPONIBLE').AsFloat;
            DMALM.cdsReporte.FieldByName('RESERVA').AsFloat := DMALM.cdsQry6.FieldByName('RESERVA').AsFloat;
         End;
      End;

      DMALM.cdsReporte.Post;
      DMALM.cdsReporte.Next;
      While (Not DMALM.cdsReporte.Eof) And
         (DMALM.cdsReporte.FieldByName('TDAID').AsString <> '00') Do
      Begin
         If Trim(DMALM.cdsReporte.FieldByName('TDATIP').AsString) = 'INGRESO' Then
         Begin
            xSalIni := xSalIni + DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat; //(DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat+(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat/DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat));
            xSalIniU := xSalIniU + DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat; //(DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat+(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat/DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat));
            If xSalIniU > DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat Then
            Begin
               xVecesCont := Int(xSalIniU / DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat);
               xSalIni := xSalIni + xVecesCont;
               xSalIniU := xSalIniU - (DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat * xVecesCont);
            End;
            DMALM.cdsReporte.Edit;
            DMALM.cdsReporte.FieldByName('VALCNTG').AsFloat := xSalIni;
            DMALM.cdsReporte.FieldByName('VALCNTU').AsFloat := xSalIniU;
            DMALM.cdsReporte.Post;
         End
         Else
         Begin
            If xSalIniU < Abs(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat) Then
            Begin
               xVecesCont := 1 + Int(Abs(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat) / DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat);
               xSalIni := xSalIni - xVecesCont;
               xSalIniU := xSalIniU + (DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat * xVecesCont);
            End;
            xSalIni := xSalIni + DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat; //(DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat+(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat/DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat));
            xSalIniU := xSalIniU + DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat; //(DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat+(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat/DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat));
            If xSalIniU >= DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat Then
            Begin
               xVecesCont := Int(Abs(xSalIniU) / DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat);
               xSalIniU := xSalIniU - (DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat * xVecesCont);
               xSalIni := xSalIni + xVecesCont;
            End;

            DMALM.cdsReporte.Edit;
            DMALM.cdsReporte.FieldByName('VALCNTG').AsFloat := xSalIni;
            DMALM.cdsReporte.FieldByName('VALCNTU').AsFloat := xSalIniU;

            If (SRV_D = 'DB2NT') And (rgTipoStocValo.ItemIndex = 0) Then
            Begin
               DMALM.cdsSQL.SetKey;
               DMALM.cdsSQL.FieldByName('CIAID').AsString := DMALM.cdsReporte.FieldByName('CIAID').AsString;
               DMALM.cdsSQL.FieldByName('SERIENGUIA').AsString := DMALM.cdsReporte.FieldByName('NISAID').AsString;
               If DMALM.cdsSQL.GotoKey Then
                  DMALM.cdsReporte.FieldByName('NOTADESPID').AsString := DMALM.cdsSQL.FieldByName('NOTADESPID').AsString

            End;

            DMALM.cdsReporte.Post;
         End;

         If (SRV_D = 'DB2NT') And (rgTipoStocValo.ItemIndex = 0) Then
         Begin
            DMALM.cdsQry6.SetKey;
            DMALM.cdsQry6.FieldByName('CIAID').AsString := DMALM.cdsReporte.FieldByName('CIAID').AsString;
            DMALM.cdsQry6.FieldByName('LOCID').AsString := DMALM.cdsReporte.FieldByName('LOCID').AsString;
            DMALM.cdsQry6.FieldByName('TINID').AsString := DMALM.cdsReporte.FieldByName('TINID').AsString;
            DMALM.cdsQry6.FieldByName('ALMID').AsString := DMALM.cdsReporte.FieldByName('ALMID').AsString;
            DMALM.cdsQry6.FieldByName('ARTID').AsString := DMALM.cdsReporte.FieldByName('ARTID').AsString;
            If DMALM.cdsQry6.GotoKey Then
            Begin
               DMALM.cdsReporte.Edit;
               DMALM.cdsReporte.FieldByName('DISPONIBLE').AsFloat := DMALM.cdsQry6.FieldByName('DISPONIBLE').AsFloat;
               DMALM.cdsReporte.FieldByName('RESERVA').AsFloat := DMALM.cdsQry6.FieldByName('RESERVA').AsFloat;
               DMALM.cdsReporte.Post;

            End;
         End;
         DMALM.cdsReporte.Next;
      End;
   End;

   If rgTipoStocValo.ItemIndex = 1 Then
   Begin
      DMALM.cdsReporte.First;
      While Not DMALM.cdsReporte.Eof Do
      Begin
         xSalIni := (DMALM.cdsReporte.FieldByName('MONTOG').AsFloat) +
            (DMALM.cdsReporte.FieldByName('MONTOU').AsFloat);
         If xSalIni < 0 Then
            xSalIni := 0;
         DMALM.cdsReporte.Edit;

         DMALM.cdsReporte.FieldByName('VALORIZ').AsString := FloatToStrF(xSalIni, ffNumber, 15, 5);
         DMALM.cdsReporte.Post;
         DMALM.cdsReporte.Next;
         While (Not DMALM.cdsReporte.Eof) And
            (DMALM.cdsReporte.FieldByName('TDAID').AsString <> '00') Do
         Begin
            If Trim(DMALM.cdsReporte.FieldByName('TDATIP').AsString) = 'INGRESO' Then
            Begin
               xSalIni := xSalIni + (DMALM.cdsReporte.FieldByName('KDXCPROGI').AsFloat + DMALM.cdsReporte.FieldByName('KDXCPROUI').AsFloat);
               If xSalIni < 0 Then
                  xSalIni := 0;
               DMALM.cdsReporte.Edit;
               DMALM.cdsReporte.FieldByName('VALORIZ').AsString := FloatToStrF(xSalIni, ffNumber, 15, 5);
               DMALM.cdsReporte.Post;
            End
            Else
            Begin
               xSalIni := xSalIni - (DMALM.cdsReporte.FieldByName('KDXCPROGI').AsFloat + DMALM.cdsReporte.FieldByName('KDXCPROUI').AsFloat);
               If xSalIni < 0 Then
                  xSalIni := 0;
               DMALM.cdsReporte.Edit;
               DMALM.cdsReporte.FieldByName('VALORIZ').AsString := FloatToStrF(xSalIni, ffNumber, 15, 5);
               DMALM.cdsReporte.Post;
            End;
            DMALM.cdsReporte.Next;
         End;
      End;
   End;
   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.recordCount = 0 Then
   Begin
      ShowMessage('Error, No Existen Registros para esta Consulta');
      DMALM.cdsReporte.Close;
      exit;
   End;

   ppdbMovi.DataSource := DMALM.dsReporte;

   If rgTipoStocValo.ItemIndex = 0 Then
   Begin
      If cbDiseno.Checked Then
      Begin
         ppDesigner1.Report := ppKdxStock;
         ppDesigner1.ShowModal;
      End
      Else
      Begin
         ppKdxStock.Print;
         ppKdxStock.Stop;
         x10 := ppKdxStock.GroupCount - 1;
         While x10 >= 0 Do
         Begin
            ppKdxStock.Groups[x10].Free;
            x10 := x10 - 1;
         End;
      End;
   End
   Else
   Begin
      If cbDiseno.Checked Then
      Begin
         ppDesigner1.Report := pprDetalle;
         ppDesigner1.ShowModal;
      End
      Else
      Begin
         pprDetalle.Print;
         pprDetalle.Stop;
         x10 := pprDetalle.GroupCount - 1;
         While x10 >= 0 Do
         Begin
            pprDetalle.Groups[x10].Free;
            x10 := x10 - 1;
         End;
      End;
   End;

   ppdbMovi.DataSource := Nil;

   xSQL := 'DELETE FROM LOG323 WHERE USUARIO=''' + DMALM.wUsuario + '''';
   Try
  //DMALM.DCOM1.AppServer.EjecutaQry(xSQL);
   Except
   End;
   DMALM.cdsReporte.IndexFieldNames := '';
   Screen.Cursor := crDefault;
End;

// Inicio HPC_201402_ALM
Procedure TFToolKdx.Z2bbtnInvValClick(Sender: TObject);
Var
   x10 : Integer;
   x : Integer; // HPC_201405_ALM
Begin
// Inicio HPC_201405_ALM
   xCiaFiltro := '';
   For x := 0 To Mtx4000.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      if copy(Mtx4000.FMant.lbFiltroReal.Items.Strings[x],3,5)='CIAID' then
         xCiaFiltro := Mtx4000.FMant.lbFiltroReal.Items.Strings[x];
   End;
   if length(xCiaFiltro)=0 then
   begin
      ShowMessage('Debe indicar la Compañía en el Filtro');
      exit;
   end;
// Fin HPC_201405_ALM

   xContinuaConsulta := True;
   xFechaPeriodo := datetostr(dtpHasta.date);
   DataInvValorizado;
   If Not xContinuaConsulta Then exit;

   ppdbMovi.DataSource := DMALM.dsReporte;
   pprInvVal.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexInvVal.Rtm';
   pprInvVal.template.LoadFromFile;
   pprInvVal.DataPipeline := ppdbMovi;
   pplPeriodo.Caption := xFechaPeriodo;

   If cbDiseno.Checked Then
   Begin
      ppDesigner1.Report := pprInvVal;
      ppDesigner1.ShowModal;
   End
   Else
   Begin
      pprInvVal.Print;
      pprInvVal.Stop;
      DMALM.cdsReporte.Close;
      DMALM.cdsReporte.IndexFieldNames := '';

      pprInvVal.DataPipeline := Nil;
      ppdbMovi.DataSource := Nil;
      ppDesigner1.Report := Nil;

      x10 := pprInvVal.GroupCount - 1;
      While x10 >= 0 Do
      Begin
         pprInvVal.Groups[x10].Free;
         x10 := x10 - 1;
      End;
   End;
End;
// Fin HPC_201402_ALM

Procedure TFToolKdx.pprInvValPreviewFormCreate(Sender: TObject);
Begin
   pprInvVal.PreviewForm.ClientHeight := 500;
   pprInvVal.PreviewForm.ClientWidth := 650;
   TppViewer(pprInvVal.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolKdx.Z2bbtnResIngLinClick(Sender: TObject);
Var
   sDesde, sHasta, sSQL: String;
   x10: Integer;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   InsDataFil;

   sDesde := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

// Inicio HPC_201402_ALM
{
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'SELECT A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID, COUNT(*) CONTA, ' +
         'DECIMAL(SUM(A.KDXCNTG * ARTPCG),15,4) VALG, ' +
         'DECIMAL(SUM(A.KDXCNTU * ARTPCU),15,4) VALU, ' +
         'E.TINDES, B.GRARDES, C.ALMDES, D.CIADES ' +
         'FROM LOG315 A ' +
         'LEFT JOIN TGE131 B ON (A.CIAID=B.CIAID AND A.TINID=B.TINID AND A.GRARID=B.GRARID) ' +
         'LEFT JOIN TGE151 C ON (A.CIAID=C.CIAID AND A.TINID=C.TINID AND A.ALMID=C.ALMID AND A.LOCID=C.LOCID) ' +
         'LEFT JOIN TGE101 D ON (A.CIAID=D.CIAID) ' +
         'LEFT JOIN TGE152 E ON (A.CIAID=E.CIAID AND A.TINID=E.TINID) ' +
         'INNER JOIN LOG323 G ON (A.CIAID=G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ') ' +
         'WHERE A.NISATIP =''INGRESO'' ' +
         'AND A.NISAFREG>=' + sDesde + ' ' +
         'AND A.NISAFREG<=' + sHasta + ' ' +
         'AND A.NISSIT=''ACEPTADO'' ' +
         'GROUP BY A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID, E.TINDES, B.GRARDES, C.ALMDES, D.CIADES ' +
         'ORDER BY CIAID, LOCID, TINID, ALMID, GRARID';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
}
   sSQL := 'SELECT A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID, COUNT(*) CONTA, '
         + '       TRUNC(SUM(A.KDXCNTG * ARTPCG),4) VALG, '
         + '       TRUNC(SUM(A.KDXCNTU * ARTPCU),4) VALU, '
         + '       E.TINDES, B.GRARDES, C.ALMDES, D.CIADES '
         + '  FROM LOG315 A,TGE131 B,TGE151 C,TGE101 D, TGE152 E, LOG323 G '
         + ' WHERE A.NISATIP =''INGRESO'' '
         + '   AND A.NISAFREG>=' + sDesde + ' '
         + '   AND A.NISAFREG<=' + sHasta + ' '
         + '   AND A.NISSIT=''ACEPTADO'' '
         + '   AND A.CIAID=B.CIAID(+) AND A.TINID=B.TINID(+) AND A.GRARID=B.GRARID(+) '
         + '   AND A.CIAID=C.CIAID(+) AND A.TINID=C.TINID(+) AND A.ALMID=C.ALMID(+) AND A.LOCID=C.LOCID(+) '
         + '   AND A.CIAID=D.CIAID(+) '
         + '   AND A.CIAID=E.CIAID(+) AND A.TINID=E.TINID(+) '
         + '   AND A.CIAID=G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID '
         + '   AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ' '
         + ' GROUP BY A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID, E.TINDES, B.GRARDES, C.ALMDES, D.CIADES '
         + ' ORDER BY CIAID, LOCID, TINID, ALMID, GRARID';
//      End;
// Fin HPC_201402_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   pprResIngLin.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResIngLin.Rtm';
   pprResIngLin.Template.LoadFromFile;

   ppLPeridodo.Caption := datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);

   pprResIngLin.Print;
   pprResIngLin.Stop;

   x10 := pprResIngLin.GroupCount - 1;
   While x10 >= 0 Do
   Begin
      pprResIngLin.Groups[x10].Free;
      x10 := x10 - 1;
   End;

End;

Procedure TFToolKdx.pprResIngLinPreviewFormCreate(Sender: TObject);
Begin
   pprResIngLin.PreviewForm.ClientHeight := 500;
   pprResIngLin.PreviewForm.ClientWidth := 650;
   TppViewer(pprResIngLin.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolKdx.Z2bbtnKdxValInvClick(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, StkSM: String;
   D, M, Y: Word;
   x10: Integer;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   InsDataFil;

   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

   If rgTipoStocValo.ItemIndex = 0 Then
      StkSM := 'S'
   Else
      If rgTipoStocValo.ItemIndex = 1 Then
         StkSM := 'M';

// Inicio HPC_201402_ALM
{
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'SELECT A.TINID, F.TINDES, A.GRARID, A.ARTID, A.UNMIDG, A.FAMID, A.SFAMID, ' +
         'STKT' + StkSM + 'G' + xMes + ' STOCK, STKI' + StkSM + 'G' + xMes + ' INGRESO, STKS' + StkSM + 'G' + xMes + ' SALIDA, ' +
         DMALM.wReplacCeros + '(A.STKT' + StkSM + 'G' + xMes + ',0) + (' + DMALM.wReplacCeros + '(A.STKI' + StkSM + 'G' + xMes + ',0) - ' + DMALM.wReplacCeros + '(A.STKS' + StkSM + 'G' + xMes + ',0)) EXISTE, ' +
         'STKT' + StkSM + 'U' + xMes + ' STOCKU, STKI' + StkSM + 'U' + xMes + ' INGRESOU, STKS' + StkSM + 'U' + xMes + ' SALIDAU, ' +
         DMALM.wReplacCeros + '(A.STKT' + StkSM + 'U' + xMes + ',0) + (' + DMALM.wReplacCeros + '(A.STKI' + StkSM + 'U' + xMes + ',0) - ' + DMALM.wReplacCeros + '(A.STKS' + StkSM + 'U' + xMes + ',0)) EXISTEU, ' +
         'E.ALMDES, C.GRARDES, B.ARTDES, D.CIADES ' +
         'FROM LOG316 A ' +
         'LEFT JOIN TGE205 B ON (A.CIAID=B.CIAID AND A.TINID=B.TINID AND A.ARTID =B.ARTID) ' +
         'LEFT JOIN TGE131 C ON (A.CIAID=C.CIAID AND A.GRARID=C.GRARID AND A.TINID=C.TINID) ' +
         'LEFT JOIN TGE101 D ON (A.CIAID=D.CIAID) ' +
         'LEFT JOIN TGE151 E ON (A.CIAID=E.CIAID AND A.LOCID=E.LOCID AND A.TINID=E.TINID AND A.ALMID=E.ALMID) ' +
         'LEFT JOIN TGE152 F ON (A.CIAID=F.CIAID AND A.TINID=F.TINID) ' +
         'INNER JOIN LOG323 G ON(A.CIAID=G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ') ' +
         'WHERE (STKTMG' + xMes + '>0 OR STKTSG' + xMes + '>0 OR STKIMG' + xMes + '>0 OR STKSMG' + xMes + '>0) AND STKANO=''' + xAno + ''' ' +
         'ORDER BY A.TINID, A.GRARID, A.ARTID';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
}
   xSQL := 'SELECT A.TINID, F.TINDES, A.GRARID, A.ARTID, A.UNMIDG, A.FAMID, A.SFAMID, '
          +'       STKT' + StkSM + 'G' + xMes + ' STOCK, STKI' + StkSM + 'G' + xMes + ' INGRESO, '
          +'       STKS' + StkSM + 'G' + xMes + ' SALIDA, '
          +        DMALM.wReplacCeros + '(A.STKT' + StkSM + 'G' + xMes + ',0) + (' + DMALM.wReplacCeros + '(A.STKI' + StkSM + 'G' + xMes + ',0) - ' + DMALM.wReplacCeros + '(A.STKS' + StkSM + 'G' + xMes + ',0)) EXISTE, '
          +'       STKT' + StkSM + 'U' + xMes + ' STOCKU, STKI' + StkSM + 'U' + xMes + ' INGRESOU, STKS' + StkSM + 'U' + xMes + ' SALIDAU, '
          +        DMALM.wReplacCeros + '(A.STKT' + StkSM + 'U' + xMes + ',0) + (' + DMALM.wReplacCeros + '(A.STKI' + StkSM + 'U' + xMes + ',0) - ' + DMALM.wReplacCeros + '(A.STKS' + StkSM + 'U' + xMes + ',0)) EXISTEU, '
          +'       E.ALMDES, C.GRARDES, B.ARTDES, D.CIADES '
          +'  FROM LOG316 A,TGE205 B, TGE131 C, TGE101 D, TGE151 E, TGE152 F, LOG323 G '
          +' WHERE (STKTMG' + xMes + '>0 OR STKTSG' + xMes + '>0 OR STKIMG' + xMes + '>0 OR STKSMG' + xMes + '>0) AND STKANO=''' + xAno + ''' '
          +'   AND A.ARTID =B.ARTID(+)  AND A.CIAID=B.CIAID(+) '
          +'   AND A.GRARID=C.GRARID(+) AND A.TINID=C.TINID(+) '
          +'   AND A.CIAID =D.CIAID(+) '
          +'   AND A.ALMID =E.ALMID(+) AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) '
          +'   AND A.CIAID =F.CIAID(+) AND A.TINID=F.TINID(+) '
          +'   AND A.CIAID =G.CIAID(+) AND A.LOCID=G.LOCID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+) '
          +'   AND A.ARTID=G.ARTID(+) AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ' '
          +' ORDER BY A.TINID, A.GRARID, A.ARTID';
//      End;
// Fin HPC_201402_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   pprResKdxVal.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResKdxVal.rtm';
   pprResKdxVal.Template.LoadFromFile;

   If rgTipoStocValo.ItemIndex = 0 Then
      ppLabel6.Caption := 'Kardex al'
   Else
      If rgTipoStocValo.ItemIndex = 1 Then
         ppLabel6.Caption := 'Kardex Valorizado al';
   pplPerKdx.Caption := xDia + '/' + xMes + '/' + xAno;

   pprResKdxVal.Print;
   pprResKdxVal.Stop;
   x10 := pprResKdxVal.GroupCount - 1;
   While x10 >= 0 Do
   Begin
      pprResKdxVal.Groups[x10].Free;
      x10 := x10 - 1;
   End;

End;

Procedure TFToolKdx.pprResKdxValPreviewFormCreate(Sender: TObject);
Begin
   pprResKdxVal.PreviewForm.ClientHeight := 500;
   pprResKdxVal.PreviewForm.ClientWidth := 650;
   TppViewer(pprResKdxVal.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolKdx.ppGroupFooterBand3BeforePrint(Sender: TObject);
Begin
   If ppVariable1.Value = 0.00 Then
      ppVariable1.Visible := false
   Else
      ppVariable1.Visible := True;
End;

Procedure TFToolKdx.ppVariable6Calc(Sender: TObject; Var Value: Variant);
Begin
   ppVariable6.Value := ppDBText39.Text;
End;

Procedure TFToolKdx.ppDBText14Print(Sender: TObject);
Begin
   If ppDBText14.Text <> '' Then
      If StrToFloat(ppDBText14.Text) = 0.00 Then
         ppDBText14.Visible := False
      Else
         ppDBText14.Visible := true;
End;

Procedure TFToolKdx.ppDBText15Print(Sender: TObject);
Begin
   If ppDBText15.Text <> '' Then
      If StrToFloat(ppDBText15.Text) = 0.00 Then
         ppDBText15.Visible := False
      Else
         ppDBText15.Visible := true;
End;

Procedure TFToolKdx.ppDBText57Print(Sender: TObject);
Begin
   If ppDBText57.Text <> '' Then
      If StrToFloat(ppDBText57.Text) = 0.00 Then
         ppDBText57.Visible := False
      Else
         ppDBText57.Visible := true;
End;

Procedure TFToolKdx.ppDBText13Print(Sender: TObject);
Begin
   If ppDBText13.Text <> '' Then
      If StrToFloat(ppDBText13.Text) = 0.00 Then
         ppDBText13.Visible := False
      Else
         ppDBText13.Visible := true;
End;

Procedure TFToolKdx.ppDBText37Print(Sender: TObject);
Begin
   If ppDBText37.Text <> '' Then
      If StrToFloat(StringReplace(ppDBText37.Text, ',', '', [rfReplaceAll])) = 0.00 Then
         ppDBText37.Visible := False
      Else
         ppDBText37.Visible := true;
End;

Procedure TFToolKdx.ppDBText38Print(Sender: TObject);
Begin
   If ppDBText38.Text <> '' Then
      If StrToFloat(ppDBText38.Text) = 0.00 Then
         ppDBText38.Visible := False
      Else
         ppDBText38.Visible := true;
End;

Procedure TFToolKdx.ppDBText12Print(Sender: TObject);
Begin
   If ppDBText12.Text <> '' Then
      If StrToFloat(ppDBText12.Text) = 0.00 Then
         ppDBText12.Visible := False
      Else
         ppDBText12.Visible := true;
End;

Procedure TFToolKdx.ppDBText11Print(Sender: TObject);
Begin
   If ppDBText11.Text <> '' Then
      If StrToFloat(ppDBText11.Text) = 0.00 Then
         ppDBText11.Visible := False
      Else
         ppDBText11.Visible := true;
End;

Procedure TFToolKdx.ppDBText9Print(Sender: TObject);
Begin
   If ppDBText9.Text <> '' Then
      If StrToFloat(ppDBText9.Text) = 0.00 Then
         ppDBText9.Visible := False
      Else
         ppDBText9.Visible := true;
End;

Procedure TFToolKdx.ppDBText10Print(Sender: TObject);
Begin
   If ppDBText10.Text <> '' Then
      If StrToFloat(ppDBText10.Text) = 0.00 Then
         ppDBText10.Visible := False
      Else
         ppDBText10.Visible := true;
End;

Procedure TFToolKdx.ppDBText39Print(Sender: TObject);
Begin
   If ppDBText39.Text <> '' Then
      If StrToFloat(ppDBText39.Text) = 0.00 Then
         ppDBText39.Visible := False
      Else
         ppDBText39.Visible := true;
End;

Procedure TFToolKdx.Z1sbCompKdxClick(Sender: TObject);
Begin
   VerAno;
   CalcularKardexComp();
End;

Procedure TFToolKdx.CalcularKardexComp;
Var
   SalIniDes, SalIniHas, sDesde, sHasta: String;
   MtoGFNameG, MtoGFNameU, CntGFNameG, CntGFNameU, sSQL, sTOTAL: String;
   D, M, Y: Word;
   xwhere: String;
   xSalIni, xSalIniU, xVecesCont: Double;
Begin
   If dtpDesde.Date > dtpHasta.Date Then
   Begin
      ErrorMsg(Caption, ' La Fecha Hasta no puede ser Menor a la Fecha Desde');
      Exit;
   End;
   Screen.Cursor := crHourGlass;

   DecodeDate(dtpDesde.Date, Y, M, D);
   SalIniDes := '01' + '/' + IntToStr(M) + '/' + IntToStr(Y);
   If D = 1 Then
      SalIniHas := IntToStr(D) + '/' + IntToStr(M) + '/' + IntToStr(Y)
   Else
      SalIniHas := IntToStr(D - 1) + '/' + IntToStr(M) + '/' + IntToStr(Y);

   CntGFNameG := 'STKTSG' + DMALM.StrZero(IntToStr(M), 2);
   CntGFNameU := 'STKTSU' + DMALM.StrZero(IntToStr(M), 2);
   MtoGFNameG := 'STKTMG' + DMALM.StrZero(IntToStr(M), 2);
   MtoGFNameU := 'STKTMU' + DMALM.StrZero(IntToStr(M), 2);
   SalIniDes := quotedStr(formatdatetime(DMALM.wFormatFecha, strtodatetime(SalIniDes)));
   SalIniHas := quotedStr(formatdatetime(DMALM.wFormatFecha, strtodatetime(SalIniHas)));
   sDesde := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

   xwhere := '';
   InsDataFil; // Inserta en el LOG323

// Inicio HPC_201402_ALM
{
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      If D > 1 Then
      Begin
         sTOTAL := 'SELECT ' +
            'MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, DATE(' + SalIniHas + ') NISAFREG, TIME(''00:00:00'') KDXHREG, ' +
            '''00'' TDAID, ''Saldo Inicial'' TDAABR, '''' TDATIP, MOV.ARTFUC, ' +
            'MOV.ARTID, MOV.ARTDES, MOV.UNMIDG, UMEDG.UNMABR UMEDGDES, MOV.UNMIDU, UMEDU.UNMABR UMEDUDES, ' +
            ''' '' NISAID,  '' '' NISATIP, ' +
            'MOV.SALDOG + XX.TOTINGG - XX.TOTSALG SALDOG, ' +
            'MOV.SALDOU + XX.TOTINGU - XX.TOTSALU SALDOU, ' +
            'MOV.MONTOG + XX.MTOINGG - XX.MTOSALG MONTOG, ' +
            'MOV.MONTOU + XX.MTOINGU - XX.MTOSALU MONTOU, ' +
            '0.00 ARTPCG, 0.00 ARTPCU, ' +
            '0.00 KDXCNTG, 0.00 KDXCNTU, ' +
            '0.00 KDXCNTGI, 0.00 KDXCNTUI, ' +
            '0.00 KDXMTOTOIG, 0.00 KDXMTOTOIU, ' +
            '0.00 KDXCNTGS, 0.00 KDXCNTUS, ' +
            'MOV.ARTCPROG, MOV.ARTCPROU, ' +
            '0.00 KDXCPROGI, 0.00 KDXCPROUI, ' +
            '0.00 KDXMTOTOSG, 0.00 KDXMTOTOSU, ' +
            '0.00 KDXCPROGS, 0.00 KDXCPROUS, ' +
            'ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZU, 0.00 VALCNTG, 0.00 VALCNTU, ' +
            ''' '' TRIID, '' '' TRIDES ' +
            'FROM LOG323  AS MOV ' +
            'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) ' +
            'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) ' +
            'LEFT JOIN TGE101 CIA   ON ( MOV.CIAID=CIA.CIAID ) ' +
            'LEFT JOIN TGE126 LOC   ON ( MOV.CIAID=LOC.CIAID AND MOV.LOCID=LOC.LOCID) ' +
            'LEFT JOIN TGE151 ALM   ON ( MOV.CIAID=ALM.CIAID AND MOV.LOCID=ALM.LOCID AND MOV.TINID=ALM.TINID AND MOV.ALMID=ALM.ALMID) ' +
            'LEFT JOIN TGE152 TIN   ON ( MOV.CIAID=TIN.CIAID AND MOV.TINID=TIN.TINID) ' +
            'LEFT JOIN TGE131 GRA   ON ( MOV.CIAID=GRA.CIAID AND MOV.TINID=GRA.TINID AND MOV.GRARID=GRA.GRARID) ' +
            'LEFT JOIN TGE205 ART   ON ( MOV.CIAID=ART.CIAID AND MOV.TINID=ART.TINID AND MOV.ARTID=ART.ARTID) ' +
            'LEFT JOIN (SELECT CIAID, ARTID, ' +
            'SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(KDXCNTG,0.00) ELSE (0.00) END) TOTINGG, ' +
            'SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(KDXCNTG,0.00) ELSE (0.00) END) TOTSALG, ' +
            'SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(KDXCNTU,0.00) ELSE (0.00) END) TOTINGU, ' +
            'SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(KDXCNTU,0.00) ELSE (0.00) END) TOTSALU, ' +
            'SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(ARTPCG,0.00) ELSE (0.00) END) MTOINGG, ' +
            'SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(ARTPCG,0.00) ELSE (0.00) END) MTOSALG, ' +
            'SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(ARTPCU,0.00) ELSE (0.00) END) MTOINGU, ' +
            'SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(ARTPCU,0.00) ELSE (0.00) END) MTOSALU  ' +
            'FROM LOG315 WHERE ' +
            'NISAFREG>=' + SalIniDes + ' AND ' +
            'NISAFREG<=' + SalIniHas + ' ' +
            'AND NISSIT=''ACEPTADO'' ' +
            'GROUP BY CIAID, ARTID ' +
            ') XX ON (MOV.ARTID=XX.ARTID  AND MOV.CIAID=XX.CIAID) ' +
            'WHERE MOV.USUARIO=''' + DMALM.wUsuario + ''' ';
         sTOTAL := sTOTAL + ' UNION ALL ';
      End
      Else
         If D = 1 Then
         Begin
            sTOTAL := 'SELECT ' +
               'MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, DATE(' + SalIniHas + ') NISAFREG, TIME(''00:00:00'') KDXHREG, ''00'' TDAID, ''Saldo Inicial'' TDAABR, '''' TDATIP, MOV.ARTFUC, ' +
               'MOV.ARTID, MOV.ARTDES, MOV.UNMIDG, UMEDG.UNMABR UMEDGDES, MOV.UNMIDU, UMEDU.UNMABR UMEDUDES, ' +
               ''' '' NISAID,  '' '' NISATIP, ' +
               'MOV.SALDOG, MOV.SALDOU, ' +
               'MOV.MONTOG, MOV.MONTOU, 0.00 ARTPCG, 0.00 ARTPCU, ' +
               '0.00 KDXCNTG, 0.00 KDXCNTU, ' +
               '0.00 KDXCNTGI, 0.00 KDXCNTUI, 0.00 KDXMTOTOIG, 0.00 KDXMTOTOIU, ' +
               '0.00 KDXCNTGS, 0.00 KDXCNTUS, ' +
               'MOV.ARTCPROG, MOV.ARTCPROU, ' +
               '0.00 KDXCPROGI, 0.00 KDXCPROUI, ' +
               '0.00 KDXMTOTOSG, 0.00 KDXMTOTOSU, ' +
               '0.00 KDXCPROGS, 0.00 KDXCPROUS, ' +
               'ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZU, 0.00 VALCNTG, 0.00 VALCNTU, ' +
               ''' '' TRIID, '' '' TRIDES ' +
               'FROM LOG323 AS MOV ' +
               'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) ' +
               'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) ' +
               'LEFT JOIN TGE205 ART   ON ( MOV.ARTID=ART.ARTID AND MOV.CIAID=ART.CIAID) ' +
               'LEFT JOIN TGE101 CIA   ON ( MOV.CIAID=CIA.CIAID ) ' +
               'LEFT JOIN TGE126 LOC   ON ( MOV.LOCID=LOC.LOCID AND MOV.CIAID=LOC.CIAID) ' +
               'LEFT JOIN TGE151 ALM   ON ( MOV.ALMID=ALM.ALMID AND MOV.CIAID=ALM.CIAID AND MOV.LOCID=ALM.LOCID AND MOV.TINID=ALM.TINID) ' +
               'LEFT JOIN TGE152 TIN   ON ( MOV.TINID=TIN.TINID AND MOV.CIAID=TIN.CIAID) ' +
               'LEFT JOIN TGE131 GRA   ON ( MOV.CIAID=GRA.CIAID AND MOV.GRARID=GRA.GRARID AND MOV.TINID=GRA.TINID) ' +
               'WHERE MOV.USUARIO=''' + DMALM.wUsuario + ''' ';
            sTOTAL := sTOTAL + ' UNION ALL ';
         End;
      sSQL := 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, MOV.NISAFREG, MOV.KDXHREG, MOV.TDAID, DOC.TDAABR, DOC.TDATIP, ' +
         'MOV.ARTFUC, MOV.ARTID, ART.ARTDES, MOV.UNMIDG, UMEDG.UNMABR UMEDGDES, MOV.UNMIDU, UMEDU.UNMABR UMEDUDES, ' +
         'MOV.NISAID, MOV.NISATIP, 0.00 SALDOG, 0.00 SALDOU, 0.00 MONTOG, 0.00 MONTOU, MOV.ARTPCG, MOV.ARTPCU, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (-1*MOV.KDXCNTG) END AS KDXCNTG, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (-1*MOV.KDXCNTU) END AS KDXCNTU, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (0.00) END AS KDXCNTGI, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (0.00) END AS KDXCNTUI, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO''  THEN (MOV.KDXCNTG * MOV.ARTPCG) ELSE (0.00) END AS KDXMTOTOIG, ' +
         'CASE WHEN MOV.NISATIP =''INGRESO''  THEN (MOV.KDXCNTU * MOV.ARTPCU) ELSE (0.00) END AS KDXMTOTOIU, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG) ELSE (0.00) END AS KDXCNTGS, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU) ELSE (0.00) END AS KDXCNTUS, ART.ARTCPROG, ART.ARTCPROU, ' +
         'MOV.KDXCNTG * MOV.ARTPCG KDXCPROGI, ' +
         'MOV.KDXCNTU * MOV.ARTPCU KDXCPROUI, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG * MOV.ARTPCG) ELSE (0.00) END AS KDXMTOTOSG, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU * MOV.ARTPCU) ELSE (0.00) END AS KDXMTOTOSU, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG * ART.ARTCPROG) ELSE (0.00) END AS KDXCPROGS, ' +
         'CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU * ART.ARTCPROU) ELSE (0.00) END AS KDXCPROUS, ' +
         'ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZU, 0.00 VALCNTG, 0.00 VALCNTU, ' +
         'MOV.TRIID, CASE WHEN MOV.NISATIP=''INGRESO'' THEN TRII.TRIDES ELSE TRIS.TRIDES END TRIDES ' +
         'FROM LOG315 AS MOV ' +
         'LEFT JOIN LOG323 B     ON ( B.USUARIO=''' + DMALM.wUsuario + ''' ) ' +
         'LEFT JOIN TGE130 UMEDG ON ( MOV.UNMIDG=UMEDG.UNMID ) ' +
         'LEFT JOIN TGE130 UMEDU ON ( MOV.UNMIDU=UMEDU.UNMID ) ' +
         'LEFT JOIN TGE157 DOC   ON ( MOV.TDAID=DOC.TDAID ) ' +
         'LEFT JOIN TGE205 ART   ON ( MOV.ARTID=ART.ARTID AND MOV.CIAID=ART.CIAID) ' +
         'LEFT JOIN TGE101 CIA   ON ( MOV.CIAID=CIA.CIAID ) ' +
         'LEFT JOIN TGE126 LOC   ON ( MOV.LOCID=LOC.LOCID AND MOV.CIAID=LOC.CIAID) ' +
         'LEFT JOIN TGE151 ALM   ON ( MOV.ALMID=ALM.ALMID AND MOV.CIAID=ALM.CIAID AND MOV.LOCID=ALM.LOCID AND MOV.TINID=ALM.TINID) ' +
         'LEFT JOIN TGE152 TIN   ON ( MOV.TINID=TIN.TINID AND MOV.CIAID=TIN.CIAID) ' +
         'LEFT JOIN TGE131 GRA   ON ( MOV.GRARID=GRA.GRARID AND MOV.TINID=GRA.TINID) ' +
         'LEFT JOIN TGE208 TRII  ON ( MOV.TRIID=TRII.TRIID AND TRII.TRISGT=''I'') ' +
         'LEFT JOIN TGE208 TRIS  ON ( MOV.TRIID=TRIS.TRIID AND TRIS.TRISGT=''S'') ' +
         'WHERE ' +
         'MOV.NISAFREG>=' + sDesde + ' AND ' +
         'MOV.NISAFREG<=' + sHasta + ' ' +
         'AND MOV.NISSIT=''ACEPTADO'' ' +
         'AND MOV.CIAID=B.CIAID ' +
         'AND MOV.LOCID=B.LOCID ' +
         'AND MOV.ALMID=B.ALMID ' +
         'AND MOV.TINID=B.TINID ' +
         'AND MOV.ARTID=B.ARTID ' +
         'ORDER BY CIAID, LOCID, ALMID, TINID, GRARID, ARTID, NISAFREG, KDXHREG';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
}
   If D > 1 Then
   Begin
      sTOTAL := 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, TO_DATE(' + SalIniHas + ') NISAFREG, '
               +'       TO_CHAR(SYSDATE,''DD-MM-YYYY HH:MI:SSSSS'') KDXHREG, '
               +'       ''00'' TDAID, ''Saldo Inicial'' TDAABR, '''' TDATIP, MOV.ARTFUC, MOV.ARTID, MOV.ARTDES, '
               +'       MOV.UNMIDG, UMEDG.UNMABR UMEDGDES, '
               +'       MOV.UNMIDU, UMEDU.UNMABR UMEDUDES, '' '' NISAID,  '' '' NISATIP, '
               +'       MOV.SALDOG + XX.TOTINGG - XX.TOTSALG SALDOG, MOV.SALDOU + XX.TOTINGU - XX.TOTSALU SALDOU, '
               +'       MOV.MONTOG + XX.MTOINGG - XX.MTOSALG MONTOG, MOV.MONTOU + XX.MTOINGU - XX.MTOSALU MONTOU, '
               +'       0.00 ARTPCG, 0.00 ARTPCU, 0.00 KDXCNTG, 0.00 KDXCNTU, 0.00 KDXCNTGI, 0.00 KDXCNTUI,  '
               +'       0.00 KDXMTOTOIG, 0.00 KDXMTOTOIU, '
               +'       0.00 KDXCNTGS, 0.00 KDXCNTUS, MOV.ARTCPROG, MOV.ARTCPROU, '
               +'       0.00 KDXCPROGI, 0.00 KDXCPROUI, 0.00 KDXMTOTOSG, 0.00 KDXMTOTOSU, 0.00 KDXCPROGS, '
               +'       0.00 KDXCPROUS, ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, '
               +'       0.00 VALORIZ, 0.00 VALORIZU, 0.00 VALCNTG, 0.00 VALCNTU, '
               +'       '' '' TRIID, '' '' TRIDES '
               +'  FROM LOG323 MOV, TGE130 UMEDG, TGE130 UMEDU, TGE101 CIA, TGE126 LOC, TGE151 ALM, TGE152 TIN, '
               +'       TGE131 GRA, TGE205 ART, '
               +'      (SELECT CIAID, ARTID,'
               +'              SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(KDXCNTG,0.00) ELSE (0.00) END) TOTINGG, '
               +'              SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(KDXCNTG,0.00) ELSE (0.00) END) TOTSALG, '
               +'              SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(KDXCNTU,0.00) ELSE (0.00) END) TOTINGU, '
               +'              SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(KDXCNTU,0.00) ELSE (0.00) END) TOTSALU, '
               +'              SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(ARTPCG,0.00) ELSE (0.00) END) MTOINGG, '
               +'              SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(ARTPCG,0.00) ELSE (0.00) END) MTOSALG, '
               +'              SUM(CASE WHEN NISATIP =''INGRESO'' THEN ' + DMALM.wReplacCeros + '(ARTPCU,0.00) ELSE (0.00) END) MTOINGU, '
               +'              SUM(CASE WHEN NISATIP =''SALIDA''  THEN ' + DMALM.wReplacCeros + '(ARTPCU,0.00) ELSE (0.00) END) MTOSALU  '
               +'         FROM LOG315 '
               +'        WHERE NISAFREG>=TO_DATE(' + SalIniDes + ') '
               +'          AND NISAFREG<=TO_DATE(' + SalIniHas + ') '
               +'          AND NISSIT=''ACEPTADO'' '
               +'        GROUP BY CIAID, ARTID ) XX '
               +' WHERE MOV.USUARIO=''' + DMALM.wUsuario + ''' '
               +'   AND MOV.UNMIDG=UMEDG.UNMID(+) '
               +'   AND MOV.UNMIDU=UMEDU.UNMID(+) '
               +'   AND MOV.CIAID=CIA.CIAID(+) '
               +'   AND MOV.LOCID=LOC.LOCID(+) AND MOV.CIAID=LOC.CIAID(+) '
               +'   AND MOV.ALMID=ALM.ALMID(+) AND MOV.CIAID=ALM.CIAID(+) AND MOV.LOCID=ALM.LOCID(+) AND MOV.TINID=ALM.TINID(+) '
               +'   AND MOV.TINID=TIN.TINID(+) AND MOV.CIAID=TIN.CIAID(+) '
               +'   AND MOV.GRARID=GRA.GRARID(+) AND MOV.TINID=GRA.TINID(+) '
               +'   AND MOV.ARTID=ART.ARTID(+) AND MOV.CIAID=ART.CIAID(+) '
               +'   AND MOV.ARTID=XX.ARTID  AND MOV.CIAID=XX.CIAID '
               +'UNION ALL ';
   End
   Else
      If D = 1 Then
      Begin
         sTOTAL := 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, TO_DATE(' + SalIniHas + ') NISAFREG, '
                  +'       TO_CHAR(SYSDATE,''DD-MM-YYYY HH:MI:SSSSS'') KDXHREG, '
                  +'       ''00'' TDAID, ''Saldo Inicial'' TDAABR, '' '' TDATIP, MOV.ARTFUC, MOV.ARTID, MOV.ARTDES, '
                  +'       MOV.UNMIDG, UMEDG.UNMABR UMEDGDES, '
                  +'       MOV.UNMIDU, UMEDU.UNMABR UMEDUDES, '' '' NISAID,  '' '' NISATIP, MOV.SALDOG, MOV.SALDOU, '
                  +'       MOV.MONTOG, MOV.MONTOU, 0 ARTPCG, '
                  +'       0.00 ARTPCU, 0.00 KDXCNTG, 0.00 KDXCNTU, 0.00 KDXCNTGI, 0.00 KDXCNTUI,  0.00 KDXMTOTOIG, '
                  +'       0.00 KDXMTOTOIU, 0.00 KDXCNTGS, 0.00 KDXCNTUS, MOV.ARTCPROG, MOV.ARTCPROU, 0.00 KDXCPROGI, '
                  +'       0.00 KDXCPROUI, 0.00 KDXMTOTOSG, 0.00 KDXMTOTOSU, 0.00 KDXCPROGS, 0.00 KDXCPROUS, ART.ARTCONT, '
                  +'       CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZU, '
                  +'       0.00 VALCNTG, 0.00 VALCNTU, '
                  +'       '' '' TRIID, '' '' TRIDES '
                  +'  FROM LOG323 MOV, TGE130 UMEDG, TGE130 UMEDU, TGE205 ART, TGE101 CIA, TGE126 LOC, TGE151 ALM, '
                  +'       TGE152 TIN, TGE131 GRA '
                  +' WHERE MOV.USUARIO=''' + DMALM.wUsuario + ''' '
                  +'   AND MOV.UNMIDG=UMEDG.UNMID(+) '
                  +'   AND MOV.UNMIDU=UMEDU.UNMID(+) '
                  +'   AND MOV.ARTID=ART.ARTID(+) AND MOV.CIAID=ART.CIAID(+) '
                  +'   AND MOV.CIAID=CIA.CIAID(+) '
                  +'   AND MOV.LOCID=LOC.LOCID(+) AND MOV.CIAID=LOC.CIAID(+) '
                  +'   AND MOV.ALMID=ALM.ALMID(+) AND MOV.CIAID=ALM.CIAID(+) '
                  +'   AND MOV.LOCID=ALM.LOCID(+) AND MOV.TINID=ALM.TINID(+) '
                  +'   AND MOV.TINID=TIN.TINID(+) AND MOV.CIAID=TIN.CIAID(+) '
                  +'   AND MOV.CIAID=GRA.CIAID(+) AND MOV.GRARID=GRA.GRARID(+) '
                  +'   AND MOV.TINID=GRA.TINID(+) '
                  +' UNION ALL ';
      End;
      sSQL := 'SELECT MOV.CIAID, MOV.LOCID, MOV.ALMID, MOV.TINID, MOV.GRARID, MOV.NISAFREG, '
             +'       TO_CHAR(MOV.KDXHREG,''DD-MM-YYYY HH:MI:SSSSS'') KDXHREG, MOV.TDAID, DOC.TDAABR, '
             +'       DOC.TDATIP, MOV.ARTFUC, MOV.ARTID, ART.ARTDES, MOV.UNMIDG, UMEDG.UNMABR UMEDGDES, '
             +'       MOV.UNMIDU, UMEDU.UNMABR UMEDUDES, MOV.NISAID, MOV.NISATIP, 0.00 SALDOG, 0.00 SALDOU, '
             +'       0.00 MONTOG, 0.00 MONTOU, MOV.ARTPCG, MOV.ARTPCU, '
             +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (-1*MOV.KDXCNTG) END AS KDXCNTG, '
             +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (-1*MOV.KDXCNTU) END AS KDXCNTU, '
             +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG) ELSE (0.00) END AS KDXCNTGI, '
             +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU) ELSE (0.00) END AS KDXCNTUI, '
             +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTG * MOV.ARTPCG) ELSE (0.00) END AS KDXMTOTOIG, '
             +'       CASE WHEN MOV.NISATIP =''INGRESO'' THEN (MOV.KDXCNTU * MOV.ARTPCU) ELSE (0.00) END AS KDXMTOTOIU, '
             +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG) ELSE (0.00) END AS KDXCNTGS, '
             +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU) ELSE (0.00) END AS KDXCNTUS, ART.ARTCPROG, '
             +'       ART.ARTCPROU, MOV.KDXCNTG * MOV.ARTPCG KDXCPROGI, MOV.KDXCNTU * MOV.ARTPCU KDXCPROUI, '
             +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG * MOV.ARTPCG) ELSE (0.00) END AS KDXMTOTOSG, '
             +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU * MOV.ARTPCU) ELSE (0.00) END AS KDXMTOTOSU, '
             +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTG * ART.ARTCPROG) ELSE (0.00) END AS KDXCPROGS, '
             +'       CASE WHEN MOV.NISATIP =''SALIDA''  THEN (MOV.KDXCNTU * ART.ARTCPROU) ELSE (0.00) END AS KDXCPROUS, '
             +'       ART.ARTCONT, CIA.CIADES, LOC.LOCDES, ALM.ALMDES, TIN.TINDES, GRA.GRARDES, 0.00 VALORIZ, 0.00 VALORIZU, '
             +'       0.00 VALCNTG, 0.00 VALCNTU, '
             +'       MOV.TRIID, CASE WHEN MOV.NISATIP=''INGRESO'' THEN TRII.TRIDES ELSE TRIS.TRIDES END TRIDES '
             +'  FROM LOG315 MOV, LOG323 B, TGE130 UMEDG, TGE130 UMEDU, TGE157 DOC, TGE205 ART, TGE101 CIA, TGE126 LOC, '
             +'       TGE151 ALM, TGE152 TIN, TGE131 GRA, TGE208 TRII, TGE208 TRIS '
             +' WHERE MOV.NISAFREG>=TO_DATE(' + sDesde + ') '
             +'   AND MOV.NISAFREG<=TO_DATE(' + sHasta + ') '
             +'   AND MOV.NISSIT=''ACEPTADO'' '
             +'   AND MOV.CIAID=B.CIAID '
             +'   AND MOV.LOCID=B.LOCID '
             +'   AND MOV.ALMID=B.ALMID '
             +'   AND MOV.TINID=B.TINID '
             +'   AND MOV.ARTID=B.ARTID '
             +'   AND B.USUARIO=''' + DMALM.wUsuario + ''' '
             +'   AND MOV.UNMIDG=UMEDG.UNMID(+) '
             +'   AND MOV.UNMIDU=UMEDU.UNMID(+) '
             +'   AND MOV.TDAID=DOC.TDAID(+) '
             +'   AND MOV.ARTID=ART.ARTID(+) AND MOV.CIAID=ART.CIAID(+) '
             +'   AND MOV.CIAID=CIA.CIAID(+) '
             +'   AND MOV.LOCID=LOC.LOCID(+) AND MOV.CIAID=LOC.CIAID(+) '
             +'   AND MOV.ALMID=ALM.ALMID(+) AND MOV.CIAID=ALM.CIAID(+) '
             +'   AND MOV.LOCID=ALM.LOCID(+) AND MOV.TINID=ALM.TINID(+) '
             +'   AND MOV.TINID=TIN.TINID(+) AND MOV.CIAID=TIN.CIAID(+) '
             +'   AND MOV.CIAID=GRA.CIAID(+) AND MOV.GRARID=GRA.GRARID(+) AND MOV.TINID=GRA.TINID(+) '
             +'   AND MOV.TRIID=TRII.TRIID(+) AND TRII.TRISGT(+)=''I'' '
             +'   AND MOV.TRIID=TRIS.TRIID(+) AND TRIS.TRISGT(+)=''S'' '
             +' ORDER BY CIAID, LOCID, ALMID, TINID, GRARID, ARTID, NISAFREG, KDXHREG';
   //'ORDER BY CIAID, LOCID, ALMID, TINID, GRARID, ARTID, NISAFREG, TDATIP';
//      End;
// Fin HPC_201402_ALM

   sTOTAL := sTOTAL + sSQL;
   DMALM.cdsReporte.Close; // Detalle - Movimientos
   DMALM.cdsReporte.DataRequest(sTOTAL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.recordCount = 0 Then
   Begin
      ShowMessage('Error, No Existen Registros para esta Consulta');
      DMALM.cdsReporte.Close;
      exit;
   End;

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      xSalIni := DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat +
         DMALM.cdsReporte.FieldByName('SALDOG').AsFloat;
      xSalIniU := DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat +
         DMALM.cdsReporte.FieldByName('SALDOU').AsFloat;
      DMALM.cdsReporte.Edit;
      DMALM.cdsReporte.FieldByName('VALCNTG').AsFloat := xSalIni;
      DMALM.cdsReporte.FieldByName('VALCNTU').AsFloat := xSalIniU;
      DMALM.cdsReporte.Post;
      DMALM.cdsReporte.Next;
      While (Not DMALM.cdsReporte.Eof) And
         (DMALM.cdsReporte.FieldByName('TDAID').AsString <> '00') Do
      Begin
         If Trim(DMALM.cdsReporte.FieldByName('TDATIP').AsString) = 'INGRESO' Then
         Begin
            xSalIni := xSalIni + DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat; //(DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat+(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat/DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat));
            xSalIniU := xSalIniU + DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat; //(DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat+(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat/DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat));
            If xSalIniU > DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat Then
            Begin
               xVecesCont := Int(xSalIniU / DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat);
               xSalIni := xSalIni + xVecesCont;
               xSalIniU := xSalIniU - (DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat * xVecesCont);
            End;
            DMALM.cdsReporte.Edit;
            DMALM.cdsReporte.FieldByName('VALCNTG').AsFloat := xSalIni;
            DMALM.cdsReporte.FieldByName('VALCNTU').AsFloat := xSalIniU;
            DMALM.cdsReporte.Post;
         End
         Else
         Begin
            If xSalIniU < Abs(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat) Then
            Begin
               xVecesCont := 1 + Int(Abs(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat) / DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat);
               xSalIni := xSalIni - xVecesCont;
               xSalIniU := xSalIniU + (DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat * xVecesCont);
            End;
            xSalIni := xSalIni + DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat; //(DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat+(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat/DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat));
            xSalIniU := xSalIniU + DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat; //(DMALM.cdsReporte.FieldByName('KDXCNTG').AsFloat+(DMALM.cdsReporte.FieldByName('KDXCNTU').AsFloat/DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat));
            If xSalIniU >= DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat Then
            Begin
               xVecesCont := Int(Abs(xSalIniU) / DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat);
               xSalIniU := xSalIniU - (DMALM.cdsReporte.FieldByName('ARTCONT').AsFloat * xVecesCont);
               xSalIni := xSalIni + xVecesCont;
            End;

            DMALM.cdsReporte.Edit;
            DMALM.cdsReporte.FieldByName('VALCNTG').AsFloat := xSalIni;
            DMALM.cdsReporte.FieldByName('VALCNTU').AsFloat := xSalIniU;
            DMALM.cdsReporte.Post;
         End;
         DMALM.cdsReporte.Next;
      End;
   End;

   If rgTipoStocValo.ItemIndex = 1 Then
   Begin
      DMALM.cdsReporte.First;
      While Not DMALM.cdsReporte.Eof Do
      Begin
         xSalIni := (DMALM.cdsReporte.FieldByName('MONTOG').AsFloat) +
            (DMALM.cdsReporte.FieldByName('MONTOU').AsFloat);
         DMALM.cdsReporte.Edit;
         DMALM.cdsReporte.FieldByName('VALORIZ').AsFloat := xSalIni;
         DMALM.cdsReporte.Post;
         DMALM.cdsReporte.Next;
         While (Not DMALM.cdsReporte.Eof) And
            (DMALM.cdsReporte.FieldByName('TDAID').AsString <> '00') Do
         Begin
            If Trim(DMALM.cdsReporte.FieldByName('TDATIP').AsString) = 'INGRESO' Then
            Begin
               xSalIni := xSalIni + (DMALM.cdsReporte.FieldByName('KDXCPROGI').AsFloat + DMALM.cdsReporte.FieldByName('KDXCPROUI').AsFloat);
               DMALM.cdsReporte.Edit;
               DMALM.cdsReporte.FieldByName('VALORIZ').AsFloat := xSalIni;
               DMALM.cdsReporte.Post;
            End
            Else
            Begin
               xSalIni := xSalIni - (DMALM.cdsReporte.FieldByName('KDXCPROGI').AsFloat + DMALM.cdsReporte.FieldByName('KDXCPROUI').AsFloat);
               DMALM.cdsReporte.Edit;
               DMALM.cdsReporte.FieldByName('VALORIZ').AsFloat := xSalIni;
               DMALM.cdsReporte.Post;
            End;
            DMALM.cdsReporte.Next;
         End;
      End;
   End;

   ppKdxCompro.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexCompro.Rtm';
   ppKdxCompro.template.LoadFromFile;

   ppLabel151.Caption := 'KARDEX DE COMPROBACION';
   ppLabel130.Caption := 'Del ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);

   ppKdxCompro.Print;
   ppKdxCompro.Stop;
   Screen.Cursor := crHourGlass;

   Screen.Cursor := crDefault;
End;

Procedure TFToolKdx.InsDataFil;
Var
   MtoGFNameG, MtoGFNameU, CntGFNameG, CntGFNameU, sTOTAL, sWhere: String;
   xSQL, SalIniHas: String;
   D, M, Y, DH, MH, YH: Word;
   iX, iY: integer;
Begin
   xWhere := '';
   DecodeDate(dtpDesde.Date, Y, M, D);
   DecodeDate(dtpHasta.Date, YH, MH, DH);
   If D = 1 Then
      SalIniHas := IntToStr(D) + '/' + IntToStr(M) + '/' + IntToStr(Y)
   Else
      SalIniHas := IntToStr(D - 1) + '/' + IntToStr(M) + '/' + IntToStr(Y);

   CntGFNameG := 'STKTSG' + DMALM.StrZero(IntToStr(M), 2);
   CntGFNameU := 'STKTSU' + DMALM.StrZero(IntToStr(M), 2);
   MtoGFNameG := 'STKTMG' + DMALM.StrZero(IntToStr(M), 2);
   MtoGFNameU := 'STKTMU' + DMALM.StrZero(IntToStr(M), 2);

   SalIniHas := quotedStr(formatdatetime(DMALM.wFormatFecha, strtodatetime(SalIniHas)));

   xSQL := 'DELETE FROM LOG323 WHERE USUARIO=''' + DMALM.wUsuario + '''';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := Mtx4000.FMant.SQL;
   For iX := 0 To Length(xsql) Do
   Begin
      If UpperCase(copy(xSQL, iX, 5)) = 'WHERE' Then //HPC_201309_ALM
      Begin
         xwhere := copy(xSQL, iX + 6, length(xSQL));
         break;
      End;
   End;

   For iY := 0 To Length(xWhere) Do
   Begin
      If UpperCase(copy(xWhere, iY, 8)) = 'ORDER BY' Then //HPC_201309_ALM
      Begin
         xwhere := copy(xWhere, 1, iY - 2);
         break;
      End;
   End;

   sWhere := xWhere;

   If YH > Y Then
      YH := Y;

// Inicio HPC_201402_ALM
{
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      sTOTAL := 'INSERT INTO LOG323 ' +
         '(CIAID, LOCID, ALMID, TINID, GRARID, NISAFREG, TDAID, TDAABR, ARTFUC, ARTID, ARTDES, UNMIDG, UMEDGDES, ' +
         'UNMIDU, UMEDUDES, NISAID, NISATIP, SALDOG, SALDOU, MONTOG, MONTOU, KDXCNTG, KDXCNTU, KDXCNTGI, KDXCNTUI, ' +
         'KDXCNTGS, KDXCNTUS, ARTCPROG, ARTCPROU, KDXCPROGI, KDXCPROUI, KDXCPROGS, KDXCPROUS, USUARIO ) ' +
         '(SELECT ' +
         ' CIAID, LOCID, ALMID, TINID, GRARID, DATE(' + SalIniHas + '), ''00'', '''', ARTFUC, ARTID, ARTDES, UNMIDG, '''', UNMIDU, '''', ''Saldo Inicial'', ' +
         ''''', ' + CntGFNameG + ', ' + CntGFNameU + ', ' + MtoGFNameG + ', ' + MtoGFNameU + ', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, ''' + DMALM.wUsuario + ''' ' +
         'FROM LOG316 ';

      If Length(sWhere) > 0 Then
         sTOTAL := sTOTAL + 'WHERE ' + sWhere + ' AND LOG316.STKANO=''' + InttoStr(YH) + ''')'
      Else
         sTOTAL := sTOTAL + 'WHERE LOG316.STKANO=''' + InttoStr(YH) + ''')';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
}
   sTOTAL := 'INSERT INTO LOG323(CIAID, LOCID, ALMID, TINID, GRARID, NISAFREG, TDAID, TDAABR, ARTFUC, ARTID, ARTDES, '
            +'                   UNMIDG, UMEDGDES, UNMIDU, UMEDUDES,NISAID, NISATIP, SALDOG, SALDOU, MONTOG, MONTOU, '
            +'                   KDXCNTG, KDXCNTU, KDXCNTGI, KDXCNTUI, KDXCNTGS, KDXCNTUS, ARTCPROG, ARTCPROU, '
            +'                   KDXCPROGI, KDXCPROUI, KDXCPROGS, KDXCPROUS, USUARIO ) '
            +'(SELECT A.CIAID, ''01''LOCID, A.ALMID, A.TINID, B.GRARID, (' + SalIniHas + '), ''00'', '''', '
            +'        C.FULTPRECOMP ARTFUC, A.ARTID, B.ARTDES, B.UNMIDG, '''', B.UNMIDU, '''', ''Saldo Inicial'', '
            +'        '''', A.STKINI,0.00 , VALTOTINI,0.00 , 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '
            +'        0.00, 0.00, 0.00, ''' + DMALM.wUsuario + ''' '
            +'   FROM LOG319 A,TGE205 B,LOG337 C '
            +'  WHERE ' + sWhere + 'AND  A.CIAID=B.CIAID(+) AND A.TINID=B.TINID(+) AND A.ARTID=B.ARTID(+) '
            +'    AND A.CIAID=C.CIAID(+) AND A.LOGANOMM=C.LOGANOMM(+) AND A.ARTID=C.ARTID(+) )';
//      End;
// Final HPC_201402_ALM

   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sTOTAL);
   Except
   End;
End;

Procedure TFToolKdx.ppKdxStockPreviewFormCreate(Sender: TObject);
Begin
   ppKdxStock.PreviewForm.ClientHeight := 500;
   ppKdxStock.PreviewForm.ClientWidth := 650;
   TppViewer(ppKdxStock.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolKdx.ppVariable3Calc(Sender: TObject; Var Value: Variant);
Var
   xValG, xValU: Double;
   sSQL, ContS: String;
   Tot: Double;
   ContI: Integer;
Begin
   If ppDBCalc27.Text = '' Then
      xValG := 0
   Else
      xValG := StrToFloat(ppDBCalc27.Text);
   xValG := (StrToFloat(ppDBCalc25.Text) + xValG);

   If ppDBCalc28.Text = '' Then
      xValU := 0
   Else //ppDBText10
      xValU := StrToFloat(ppDBCalc28.Text);
   xValU := (StrToFloat(ppDBCalc26.Text) + xValU);

   If xValU <> 0 Then
   Begin
      sSQL := 'CIAID=' + quotedstr(DMALM.cdsReporte.FieldByName('CIAID').AsString) + ' AND ARTID=' + quotedstr(DMALM.cdsReporte.FieldByName('ARTID').AsString);
      ContS := DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT', sSQL, 'ARTCONT');
      If ContS = '' Then
         ContI := 1
      Else
         ContI := StrToInt(ContS);

      Tot := xValG * ContI;
      Tot := Tot + xValU;
      If Tot < 0.0001 Then
         Tot := 0;
      value := FloattoStr(Tot);
      Exit;
   End;
   If xValG < 0.0001 Then
      xValG := 0;
   value := FloattoStrf(xValG, fffixed, 15, 2);
End;

Procedure TFToolKdx.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFToolKdx.Z2bbtnResKdxValInvClick(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, StkSM: String;
   D, M, Y: Word;
   x10: Integer;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   InsDataFil;

   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

   If rgTipoStocValo.ItemIndex = 0 Then
      StkSM := 'S'
   Else
      If rgTipoStocValo.ItemIndex = 1 Then
         StkSM := 'M';

// Inicio HPC_201402_ALM
{
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'SELECT A.TINID, F.TINDES, A.GRARID, ' +
         'SUM(STKT' + StkSM + 'G' + xMes + ') STOCK, SUM(STKI' + StkSM + 'G' + xMes + ') INGRESO, SUM(STKS' + StkSM + 'G' + xMes + ') SALIDA, ' +
         'SUM(' + DMALM.wReplacCeros + '(A.STKT' + StkSM + 'G' + xMes + ',0)) + (SUM(' + DMALM.wReplacCeros + '(A.STKI' + StkSM + 'G' + xMes + ',0)) - SUM(' + DMALM.wReplacCeros + '(A.STKS' + StkSM + 'G' + xMes + ',0))) EXISTE, ' +
         'SUM(STKT' + StkSM + 'U' + xMes + ') STOCKU, SUM(STKI' + StkSM + 'U' + xMes + ') INGRESOU, SUM(STKS' + StkSM + 'U' + xMes + ') SALIDAU, ' +
         'SUM(' + DMALM.wReplacCeros + '(A.STKT' + StkSM + 'U' + xMes + ',0)) + (SUM(' + DMALM.wReplacCeros + '(A.STKI' + StkSM + 'U' + xMes + ',0)) - SUM(' + DMALM.wReplacCeros + '(A.STKS' + StkSM + 'U' + xMes + ',0))) EXISTEU, ' +
         'E.ALMDES, C.GRARDES, D.CIADES ' +
         'FROM LOG316 A ' +
         'LEFT JOIN TGE131 C ON (A.CIAID =C.CIAID AND A.TINID=C.TINID AND A.GRARID=C.GRARID) ' +
         'LEFT JOIN TGE101 D ON (A.CIAID =D.CIAID) ' +
         'LEFT JOIN TGE151 E ON (A.CIAID=E.CIAID AND A.LOCID=E.LOCID AND A.TINID=E.TINID AND A.ALMID=E.ALMID) ' +
         'LEFT JOIN TGE152 F ON (A.CIAID =F.CIAID AND A.TINID=F.TINID) ' +
         'INNER JOIN LOG323 G ON (A.CIAID=G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ') ' +
         'WHERE (STKTMG' + xMes + '>0 OR STKTSG' + xMes + '>0 OR STKIMG' + xMes + '>0 OR STKSMG' + xMes + '>0) AND STKANO=''' + xAno + ''' ' +
         'GROUP BY A.TINID, F.TINDES, A.GRARID, E.ALMDES, C.GRARDES, D.CIADES ' +
         'ORDER BY A.TINID, A.GRARID';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
}
   xSQL := 'SELECT A.TINID, F.TINDES, A.GRARID, '
          +'       SUM(STKT' + StkSM + 'G' + xMes + ') STOCK, SUM(STKI' + StkSM + 'G' + xMes + ') INGRESO, SUM(STKS' + StkSM + 'G' + xMes + ') SALIDA, '
          +'       SUM(' + DMALM.wReplacCeros + '(A.STKT' + StkSM + 'G' + xMes + ',0)) + (SUM(' + DMALM.wReplacCeros + '(A.STKI' + StkSM + 'G' + xMes + ',0)) - SUM(' + DMALM.wReplacCeros + '(A.STKS' + StkSM + 'G' + xMes + ',0))) EXISTE, '
          +'       SUM(STKT' + StkSM + 'U' + xMes + ') STOCKU, SUM(STKI' + StkSM + 'U' + xMes + ') INGRESOU, SUM(STKS' + StkSM + 'U' + xMes + ') SALIDAU, '
          +'       SUM(' + DMALM.wReplacCeros + '(A.STKT' + StkSM + 'U' + xMes + ',0)) + (SUM(' + DMALM.wReplacCeros + '(A.STKI' + StkSM + 'U' + xMes + ',0)) - SUM(' + DMALM.wReplacCeros + '(A.STKS' + StkSM + 'U' + xMes + ',0))) EXISTEU, '
          +'       E.ALMDES, C.GRARDES, D.CIADES '
          +'  FROM LOG316 A, TGE131 C, TGE101 D, TGE151 E, TGE152 F, LOG323 G '
          +' WHERE (STKTMG' + xMes + '>0 OR STKTSG' + xMes + '>0 OR STKIMG' + xMes + '>0 OR STKSMG' + xMes + '>0) AND STKANO=''' + xAno + ''' '
          +'   AND A.CIAID =C.CIAID(+) AND A.TINID=C.TINID(+) AND A.GRARID=C.GRARID(+) '
          +'   AND A.CIAID =D.CIAID(+) '
          +'   AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) AND A.ALMID=E.ALMID(+) '
          +'   AND A.CIAID =F.CIAID(+) AND A.TINID=F.TINID(+) '
          +'   AND A.CIAID=G.CIAID(+) AND A.LOCID=G.LOCID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+) '
          +'   AND A.ARTID=G.ARTID(+) AND G.USUARIO(+)=' + QuotedStr(DMALM.wUsuario) + ' '
          +' GROUP BY A.TINID, F.TINDES, A.GRARID, E.ALMDES, C.GRARDES, D.CIADES '
          +' ORDER BY A.TINID, A.GRARID';
//      End;
// Final HPC_201402_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   ppResIniFinInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResIniFinInv.rtm';
   ppResIniFinInv.Template.LoadFromFile;

   If rgTipoStocValo.ItemIndex = 0 Then
      ppLabel122.Caption := 'Resumen de Kardex al'
   Else
      If rgTipoStocValo.ItemIndex = 1 Then
         ppLabel122.Caption := 'Resumen de Kardex Valorizado al';

   ppLabel121.Caption := xDia + '/' + xMes + '/' + xAno;

   ppResIniFinInv.Print;
   ppResIniFinInv.Stop;

   x10 := ppResIniFinInv.GroupCount - 1;
   While x10 >= 0 Do
   Begin
      ppResIniFinInv.Groups[x10].Free;
      x10 := x10 - 1;
   End;
End;

Procedure TFToolKdx.ppResIniFinInvPreviewFormCreate(Sender: TObject);
Begin
   ppResIniFinInv.PreviewForm.ClientHeight := 500;
   ppResIniFinInv.PreviewForm.ClientWidth := 650;
   TppViewer(ppResIniFinInv.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolKdx.BitBtn1Click(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, StkSM: String;
   D, M, Y: Word;
   x10: Integer;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   InsDataFil;

   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

   If rgTipoStocValo.ItemIndex = 0 Then
      StkSM := 'S'
   Else
      If rgTipoStocValo.ItemIndex = 1 Then
         StkSM := 'M';

// Inicio HPC_201402_ALM
{
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'SELECT TINID, TINDES, GRARID, ALMID, ALMDES, GRARDES, CIADES, ' +
         'SUM(STOCKIMP) STOCKIMP, SUM(STOCKNAC) STOCKNAC, SUM(EXISTEIMP) EXISTEIMP, SUM(EXISTENAC) EXISTENAC, ' +
         'SUM(STOCKUIMP) STOCKUIMP, SUM(STOCKUNAC) STOCKUNAC, SUM(EXISTEUIMP) EXISTEUIMP, SUM(EXISTEUNAC) EXISTEUNAC, ' +
         'SUM(STOCKIMP) + SUM(STOCKNAC) TOTINI, SUM(EXISTEIMP)  + SUM(EXISTENAC) TOTFIN, ' +
         'SUM(STOCKUIMP) + SUM(STOCKUNAC) TOTINIU, SUM(EXISTEUIMP) + SUM(EXISTEUNAC) TOTFINU ' +
         'FROM ( ' +
         'SELECT A.TINID, F.TINDES, A.GRARID, A.ALMID, E.ALMDES, C.GRARDES, D.CIADES, ' +
         'CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN SUM(STKT' + StkSM + 'G' + xMes + ') ELSE 0 END STOCKIMP, ' +
         'CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN 0 ELSE SUM(STKT' + StkSM + 'G' + xMes + ') END STOCKNAC, ' +
         'CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN SUM(COALESCE(A.STKT' + StkSM + 'G' + xMes + ',0)) + (SUM(COALESCE(A.STKI' + StkSM + 'G' + xMes + ',0)) - SUM(COALESCE(A.STKS' + StkSM + 'G' + xMes + ',0))) ELSE 0 END EXISTEIMP, ' +
         'CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN 0 ELSE SUM(COALESCE(A.STKT' + StkSM + 'G' + xMes + ',0)) + (SUM(COALESCE(A.STKI' + StkSM + 'G' + xMes + ',0)) - SUM(COALESCE(A.STKS' + StkSM + 'G' + xMes + ',0))) END EXISTENAC, ' +
         'CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN SUM(STKT' + StkSM + 'U' + xMes + ') ELSE 0 END STOCKUIMP, ' +
         'CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN 0 ELSE SUM(STKT' + StkSM + 'U' + xMes + ') END STOCKUNAC, ' +
         'CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN SUM(COALESCE(A.STKT' + StkSM + 'U' + xMes + ',0)) + (SUM(COALESCE(A.STKI' + StkSM + 'U' + xMes + ',0)) - SUM(COALESCE(A.STKS' + StkSM + 'U' + xMes + ',0))) ELSE 0 END EXISTEUIMP, ' +
         'CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN 0 ELSE SUM(COALESCE(A.STKT' + StkSM + 'U' + xMes + ',0)) + (SUM(COALESCE(A.STKI' + StkSM + 'U' + xMes + ',0)) - SUM(COALESCE(A.STKS' + StkSM + 'U' + xMes + ',0))) END EXISTEUNAC ' +
         'FROM LOG316 A ' +
         'INNER JOIN LOG323 G ON (A.CIAID=G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ') ' +
         'LEFT JOIN TGE101 D ON (A.CIAID=D.CIAID) ' +
         'LEFT JOIN TGE131 C ON (A.CIAID=C.CIAID AND A.TINID=C.TINID AND A.GRARID=C.GRARID) ' +
         'LEFT JOIN TGE151 E ON (A.CIAID=E.CIAID AND A.LOCID=E.LOCID AND A.TINID=E.TINID AND A.ALMID =E.ALMID) ' +
         'LEFT JOIN TGE152 F ON (A.CIAID=F.CIAID AND A.TINID=F.TINID) ' +
         'LEFT JOIN TGE205 B ON (A.CIAID=B.CIAID AND A.TINID=B.TINID AND A.ARTID=B.ARTID) ' +
         'WHERE STKANO=''' + xAno + '''' + ' AND (STKTMG' + xMes + '>0 OR STKTSG' + xMes + '>0 OR STKIMG' + xMes + '>0 OR STKSMG' + xMes + '>0) ' +
         'GROUP BY A.TINID, F.TINDES, A.GRARID, A.ALMID, E.ALMDES, C.GRARDES, D.CIADES, B.ARTSPRO ' +
         ') X ' +
         'GROUP BY TINID, TINDES, GRARID, ALMID, ALMDES, GRARDES, CIADES ' +
         'ORDER BY TINID, GRARID';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
}
   xSQL := 'SELECT TINID, TINDES, GRARID, ALMID, ALMDES, GRARDES, CIADES, SUM(STOCKIMP) STOCKIMP, SUM(STOCKNAC) STOCKNAC, '
          +'       SUM(EXISTEIMP) EXISTEIMP, SUM(EXISTENAC) EXISTENAC, SUM(STOCKUIMP) STOCKUIMP, SUM(STOCKUNAC) STOCKUNAC, '
          +'       SUM(EXISTEUIMP) EXISTEUIMP, SUM(EXISTEUNAC) EXISTEUNAC, '
          +'       SUM(STOCKIMP) + SUM(STOCKNAC) TOTINI, SUM(EXISTEIMP)  + SUM(EXISTENAC) TOTFIN, '
          +'       SUM(STOCKUIMP) + SUM(STOCKUNAC) TOTINIU, SUM(EXISTEUIMP) + SUM(EXISTEUNAC) TOTFINU '
          +'  FROM (SELECT A.TINID, F.TINDES, A.GRARID, A.ALMID, E.ALMDES, C.GRARDES, D.CIADES, '
          +'               CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN SUM(STKT' + StkSM + 'G' + xMes + ') ELSE 0 END STOCKIMP, '
          +'               CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN 0 ELSE SUM(STKT' + StkSM + 'G' + xMes + ') END STOCKNAC, '
          +'               CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN SUM(NVL(A.STKT' + StkSM + 'G' + xMes + ',0)) + (SUM(NVL(A.STKI' + StkSM + 'G' + xMes + ',0)) - SUM(NVL(A.STKS' + StkSM + 'G' + xMes + ',0))) ELSE 0 END EXISTEIMP, '
          +'               CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN 0 ELSE SUM(NVL(A.STKT' + StkSM + 'G' + xMes + ',0)) + (SUM(NVL(A.STKI' + StkSM + 'G' + xMes + ',0)) - SUM(NVL(A.STKS' + StkSM + 'G' + xMes + ',0))) END EXISTENAC, '
          +'               CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN SUM(STKT' + StkSM + 'U' + xMes + ') ELSE 0 END STOCKUIMP, '
          +'               CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN 0 ELSE SUM(STKT' + StkSM + 'U' + xMes + ') END STOCKUNAC, '
          +'               CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN SUM(NVL(A.STKT' + StkSM + 'U' + xMes + ',0)) + (SUM(NVL(A.STKI' + StkSM + 'U' + xMes + ',0)) - SUM(NVL(A.STKS' + StkSM + 'U' + xMes + ',0))) ELSE 0 END EXISTEUIMP, '
          +'               CASE WHEN B.ARTSPRO=''IMPORTADO'' THEN 0 ELSE SUM(NVL(A.STKT' + StkSM + 'U' + xMes + ',0)) + (SUM(NVL(A.STKI' + StkSM + 'U' + xMes + ',0)) - SUM(NVL(A.STKS' + StkSM + 'U' + xMes + ',0))) END EXISTEUNAC '
          +'          FROM LOG316 A, TGE205 B, TGE131 C, TGE101 D, TGE151 E, TGE152 F, LOG323 G '
          +'         WHERE (STKTMG' + xMes + '>0 OR STKTSG' + xMes + '>0 OR STKIMG' + xMes + '>0 OR STKSMG' + xMes + '>0) AND STKANO=''' + xAno + ''' '
          +'           AND A.CIAID=B.CIAID(+) AND A.TINID=B.TINID(+) AND A.ARTID=B.ARTID(+) '
          +'           AND A.CIAID=C.CIAID(+) AND A.TINID=C.TINID(+) AND A.GRARID=C.GRARID(+) '
          +'           AND A.CIAID=D.CIAID(+) '
          +'           AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) AND A.ALMID =E.ALMID(+) '
          +'           AND A.CIAID=F.CIAID(+) AND A.TINID=F.TINID(+) '
          +'           AND A.CIAID=G.CIAID(+) AND A.LOCID=G.LOCID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+) AND A.ARTID=G.ARTID(+) AND G.USUARIO(+)=' + QuotedStr(DMALM.wUsuario) + ' '
          +'         GROUP BY A.TINID, F.TINDES, A.GRARID, A.ALMID, E.ALMDES, C.GRARDES, D.CIADES, B.ARTSPRO '
          +'       ) X '
          +' GROUP BY TINID, TINDES, GRARID, ALMID, ALMDES, GRARDES, CIADES '
          +' ORDER BY TINID, GRARID';
//      End;
// Final HPC_201402_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   ppResIniFinProc.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResIniFinProc.rtm';
   ppResIniFinProc.Template.LoadFromFile;

   If rgTipoStocValo.ItemIndex = 0 Then
   Begin
      ppLabel135.Caption := 'Stock Inicial y Final en Cantidades';
      ppDBCalc50.Visible := False;
      ppDBCalc51.Visible := False;
      ppDBCalc52.Visible := False;
      ppDBCalc53.Visible := False;
      ppDBCalc54.Visible := False;
      ppDBCalc55.Visible := False;
   End
   Else
      If rgTipoStocValo.ItemIndex = 1 Then
      Begin
         ppLabel135.Caption := 'Stock Inicial y Final en N. Soles';
         ppDBCalc50.Visible := True;
         ppDBCalc51.Visible := True;
         ppDBCalc52.Visible := True;
         ppDBCalc53.Visible := True;
         ppDBCalc54.Visible := True;
         ppDBCalc55.Visible := True;
      End;

   ppLabel136.Caption := 'Al ' + xDia + '/' + xMes + '/' + xAno;

 //ppDesigner1.Report:=ppResIniFinProc;
 //ppDesigner1.ShowModal;
   ppResIniFinProc.Print;
   ppResIniFinProc.Stop;

   //Screen.Cursor:=crHourGlass;
   x10 := ppResIniFinProc.GroupCount - 1;
   While x10 >= 0 Do
   Begin
      ppResIniFinProc.Groups[x10].Free;
      x10 := x10 - 1;
   End;

End;

Procedure TFToolKdx.ppResIniFinProcPreviewFormCreate(Sender: TObject);
Begin
   ppResIniFinProc.PreviewForm.ClientHeight := 500;
   ppResIniFinProc.PreviewForm.ClientWidth := 650;
   TppViewer(ppResIniFinProc.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolKdx.ppVariable4Calc(Sender: TObject; Var Value: Variant);
Var
   xValG, xValU: Double;
   sSQL, ContS: String;
   Tot {, Res, xRes}: Double;
  {Ent,}ContI: Integer;
Begin
   If ppDBCalc39.Text = '' Then
      xValG := 0
   Else
      xValG := StrToFloat(ppDBCalc39.Text);
   xValG := (StrToFloat(ppDBCalc37.Text) + xValG);

   If ppDBCalc40.Text = '' Then
      xValU := 0
   Else //ppDBText10
      xValU := StrToFloat(ppDBCalc40.Text);
   xValU := (StrToFloat(ppDBCalc38.Text) + xValU);

   If xValU <> 0 Then
   Begin
      sSQL := 'CIAID=' + quotedstr(DMALM.cdsReporte.FieldByName('CIAID').AsString) + ' AND ARTID=' + quotedstr(DMALM.cdsReporte.FieldByName('ARTID').AsString);
      ContS := DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT', sSQL, 'ARTCONT');
      If ContS = '' Then
         ContI := 1
      Else
         ContI := StrToInt(ContS);

      Tot := xValG * ContI;
      Tot := Tot + xValU;
      If Tot < 0.0001 Then
         Tot := 0;
      value := FloattoStr(Tot);
      Exit;
   End;
   If xValG < 0.0001 Then
      xValG := 0;
   value := FloattoStrf(xValG, fffixed, 15, 2);
End;

Procedure TFToolKdx.VerAno;
Var
   YD, MD, DD: word;
   YH, MH, DH: word;
Begin
   DecodeDate(dtpDesde.Date, YD, MD, DD);
   DecodeDate(dtpHasta.Date, YH, MH, DH);

   If YD <> YH Then
   Begin
      Raise Exception.Create('Solo Puede Elegir Periodos Dentro del Mismo Año');
   End;
End;

Procedure TFToolKdx.VerAnoNew;
Var
   YD, MD, DD: word;
   YH, MH, DH: word;
Begin
   DecodeDate(dtpDesde.Date, YD, MD, DD);
   DecodeDate(dtpHasta.Date, YH, MH, DH);
End;

Procedure TFToolKdx.ppKdxComproPreviewFormCreate(Sender: TObject);
Begin
   ppKdxCompro.PreviewForm.ClientHeight := 500;
   ppKdxCompro.PreviewForm.ClientWidth := 650;
   TppViewer(ppKdxCompro.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolKdx.Timer1Timer(Sender: TObject);
Var
   xSQL : String; // HPC_201404_ALM
Begin
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolKdx);
      xAccesoBotones := True;
   End;

// Inicio HPC_201404_ALM
   xSQL := 'Select ''12'' CIAID, ''1234567890123456789012345678901234567890'' CIADES, '
          +'       ''12'' ALMID, ''1234567890123456789012345678901234567890'' ALMDES, '
          +'       ''12'' TINID, ''1234567890123456789012345678901234567890'' TINDES, '
          +'       ''123456789012345'' ARTID, '
          +'       ''123456789012345678901234567890123456789012345678901234567890'' ARTDES, '
          +'       ''123456789012345'' NISAID, '
          +'       ''123456789012345'' NISSIT, '
          +'       0 KDXCNTG, 0.00 ARTPCG, '
          +'       0 STKINI, 0 INGRESO, 0 SALIDA, 0 SALDO, ''INGRESO'' NISATIP, '
          +'       0.00 STKVALINI, 0.00 INGRESOVAL, 0.00 SALIDAVAL, 0.00 SALDOVAL, '
          +'       sysdate NISAFREG, ''N'' TMONID, ''201410'' ANOMESMOV,  '
          +'       ''123'' GRARID, ''1234567890123456789012345678901234567890'' GRARDES, '
          +'       ''12'' TRIID, ''1234567890123456789012345678901234567890'' TRIDES, '
          +'       0.0000 PREPROMINI, '
          +'       '' '' ORDENIMP '
          +'  from DUAL ';
   cdsKardex.Close;
   cdsKardex.RemoteServer := DMALM.DCOM1;
   cdsKardex.ProviderName := 'prvTGE';
   cdsKardex.Close;
   cdsKardex.DataRequest(xSQL);
   cdsKardex.Open;
// Fin HPC_201404_ALM

   Timer1.Destroy;
End;

Procedure TFToolKdx.BitBtn2Click(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, sHasta: String;
   D, M, Y: Word;
   x10: Integer;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   InsDataFil;

   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

// Inicio HPC_201402_ALM
   xSQL := 'SELECT A.ARTCONT, X.PRECIO COSTO_ULT_COMPRA, '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) * nvl(X.PRECIO,0) VALOR_ULT_COMPRA, '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) - round(( (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) * nvl(X.PRECIO,0) ),2) DIFERENCIA, '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) STOCK, '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) VALOR, '
          +'       CASE WHEN '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) <> 0 THEN '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) / '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) ELSE 0 END COSTO, A.UNMIDG, '
          +'       E.ALMDES, A.CIAID, A.TINID, F.TINDES, A.GRARID, C.GRARDES, A.ARTID, B.ARTDES, D.CIADES, A.FAMID, A.SFAMID '
          +'  FROM LOG316 A, TGE205 B, TGE131 C, TGE101 D, TGE151 E, TGE152 F, LOG323 G, '
          +'      (SELECT B.CIAID, B.ARTID, MAX(ARTPCG) PRECIO, FECHA '
          +'         FROM (select B.CIAID, B.TINID, B.ARTID, max(B.NISAFREG) FECHA '
          +'                 from LOG315 B '
          +'                WHERE B.CIAID in (''04'',''05'') AND NISATIP=''INGRESO'' AND NISAFREG>=''01/12/2004'' AND NISSIT=''ACEPTADO'' '
          +'                group by B.CIAID, B.TINID, B.ARTID '
          +'                ORDER BY ARTID '
          +'               ) A, LOG315 B '
          +'        WHERE A.CIAID=B.CIAID(+) AND A.ARTID=B.ARTID(+) AND A.FECHA=B.NISAFREG(+) '
          +'        GROUP BY B.CIAID, B.ARTID, FECHA '
          +'       ) X '
          +' WHERE ((((' + DMALM.wReplacCeros + '(STKTSG' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISG' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSG' + xMes + ',0)) *  B.ARTCPROG) > 0) '
          +'       OR (((' + DMALM.wReplacCeros + '(STKTSU' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISU' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSU' + xMes + ',0)) *  B.ARTCPROU) > 0)) '
          +'   AND A.ARTID =B.ARTID(+)  AND A.CIAID=B.CIAID(+) '
          +'   AND A.CIAID=C.CIAID(+) AND A.GRARID=C.GRARID(+) AND A.TINID=C.TINID(+) '
          +'   AND A.CIAID =D.CIAID(+) '
          +'   AND A.ALMID =E.ALMID(+) AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) '
          +'   AND A.CIAID =F.CIAID(+) AND A.TINID=F.TINID(+) '
          +'   AND A.CIAID =G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ' '
          +'   AND STKANO=''' + xAno + ''' '
          +'   AND A.CIAID=X.CIAID(+) AND A.ARTID=X.ARTID(+) '
          +' ORDER BY A.TINID, E.ALMDES, A.GRARID, A.ARTID';
// Final HPC_201402_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   DMALM.cdsReporte.IndexFieldNames := 'CIAID;ALMDES;TINID;GRARID;ARTID';

   ppr1.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexInvValReal.Rtm';
   ppr1.template.LoadFromFile;

   ppdb1.DataSource := DMALM.dsReporte;

   If cbDiseno.Checked Then
      ppDesigner1.ShowModal
   Else
      ppr1.Print;

   ppr1.Stop;
   ppdb1.DataSource := Nil;

   x10 := ppr1.GroupCount - 1;
   While x10 >= 0 Do
   Begin
      ppr1.Groups[x10].Free;
      x10 := x10 - 1;
   End;
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
End;

Procedure TFToolKdx.bbtnMovClick(Sender: TObject);
Begin
   VerAnoNew;
   CalcularKardex();
End;

Procedure TFToolKdx.bbtnInvComercialClick(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, sHasta, cSQLArt: String;
   D, M, Y: Word;
   x10: Integer;
   CCont: Double;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   InsDataFil;

   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

// Inicio HPC_201402_ALM
   xSQL := 'SELECT A.ARTCONT, '
         + '       NVL(B.TIPART,''0000'') TIPART, NVL(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
         + '       NVL(T.LINCOM,''00'') LINCOM, NVL(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, '
         + '       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) STOCK, '
         + '       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) VALOR, '
         + '       round( CASE WHEN '
         + '       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) <> 0 THEN '
         + '       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) / '
         + '       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) ELSE 0 END,4) COSTO, A.UNMIDG, '
         + '       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) STOCKU, '
         + '       (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) VALORU, '
         + '       round( CASE WHEN '
         + '       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) <> 0 THEN '
         + '       (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) / '
         + '       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) ELSE 0 END,4) COSTOU, A.UNMIDU, '
         + '       E.ALMDES, A.CIAID, A.TINID, F.TINDES, A.GRARID, '' '' GRARDES, A.ARTID, B.ARTDES, D.CIADES, A.FAMID, A.SFAMID '
         + '  FROM LOG316 A, TGE205 B, TGE101 D, TGE151 E, TGE152 F, LOG323 G, ALM_TIP_ART T, ALM_LIN_COM L '
         + ' WHERE ((((' + DMALM.wReplacCeros + '(STKTSG' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISG' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSG' + xMes + ',0)) ) > 0) '
         + '       OR (((' + DMALM.wReplacCeros + '(STKTSU' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISU' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSU' + xMes + ',0)) ) > 0)) '
         + '   AND A.ARTID =B.ARTID(+)  AND A.CIAID=B.CIAID(+) '
         + '   AND A.CIAID =D.CIAID(+) '
         + '   AND A.ALMID =E.ALMID(+) AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) '
         + '   AND A.CIAID =F.CIAID(+) AND A.TINID=F.TINID(+) '
         + '   AND A.CIAID =G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ' '
         + '   AND STKANO=''' + xAno + ''' '
         + '   AND B.TIPART=T.TIPART(+) '
         + '   AND T.LINCOM=L.LINCOM(+) '
         + ' ORDER BY E.ALMDES, NVL(T.LINCOM,''00''), NVL(B.TIPART,''0000''), B.ARTID';
// Fin HPC_201402_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      If (DMALM.cdsReporte.FieldByName('STOCKU').AsFloat < 0) Then
      Begin
         CCont := DMALM.cdsReporte.FieldByName('ARTCONT').AsInteger;
         DMALM.cdsReporte.Edit;
         DMALM.cdsReporte.FieldByName('STOCK').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat - 1;
         DMALM.cdsReporte.FieldByName('STOCKU').AsFloat := DMALM.cdsReporte.FieldByName('STOCKU').AsFloat + CCont;
         DMALM.cdsReporte.FieldByName('COSTO').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('COSTO').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('COSTOU').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('COSTOU').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat * DMALM.cdsReporte.FieldByName('COSTO').AsFloat;
         DMALM.cdsReporte.FieldByName('VALORU').AsFloat := DMALM.cdsReporte.FieldByName('STOCKU').AsFloat * DMALM.cdsReporte.FieldByName('COSTOU').AsFloat;
         DMALM.cdsReporte.Post;
      End;
      DMALM.cdsReporte.Next;
   End;

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      If DMALM.cdsReporte.FieldByName('COSTO').AsFloat <= 0 Then
      Begin
      // Inicio HPC_201402_ALM
         cSQLArt := 'Select nvl(ARTPCG,0) PREUNI '
                  + '  from TGE205 C '
                  + ' where C.CIAID=''' + DMALM.cdsReporte.FieldByName('CIAID').AsString + ''' '
                  + '   and C.TINID=''' + DMALM.cdsReporte.FieldByName('TINID').AsString + ''' '
                  + '   and C.ARTID=''' + DMALM.cdsReporte.FieldByName('ARTID').AsString + ''' ';
      // Fin HPC_201402_ALM
         DMALM.cdsQry.Close;
         DMALM.cdsQry.DataRequest(cSQLArt);
         DMALM.cdsQry.Open;

         DMALM.cdsReporte.Edit;
         DMALM.cdsReporte.FieldByName('COSTO').AsFloat := DMALM.FRound(DMALM.cdsQry.FieldByName('PREUNI').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat * DMALM.cdsReporte.FieldByName('COSTO').AsFloat;
         DMALM.cdsReporte.Post;
      End;
      DMALM.cdsReporte.Next;
   End;

   ppdbLin.DataSource := DMALM.dsReporte;
   ppr2.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\InvLinCom_fin.Rtm';
   ppr2.template.LoadFromFile;
   ppr2.DataPipeline := ppdbLin;

   ppr2.Print;

   ppr2.Stop;
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';

   ppr2.DataPipeline := Nil;
   ppdbLin.DataSource := Nil;
   ppDesigner1.Report := Nil;

   x10 := ppr2.GroupCount - 1;
   While x10 >= 0 Do
   Begin
      ppr2.Groups[x10].Free;
      x10 := x10 - 1;
   End;
End;

Procedure TFToolKdx.BitBtn3Click(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, sHasta: String;
   D, M, Y: Word;
   x10: Integer;
   CCont: Double;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   InsDataFil;

   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

// Inicio HPC_201402_ALM
   xSQL := 'SELECT A.ARTCONT, B.ARTPCG, (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) * B.ARTPCG TOTCOS, '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) STOCK, '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) VALOR, '
          +'       CASE WHEN '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) <> 0 THEN '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) / '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) ELSE 0 END COSTO, A.UNMIDG, '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) STOCKU, '
          +'       (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) VALORU, '
          +'       CASE WHEN '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) <> 0 THEN '
          +'       (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) / '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) ELSE 0 END COSTOU, A.UNMIDU, '
          +'       E.ALMDES, A.CIAID, A.TINID, F.TINDES, A.GRARID, C.GRARDES, A.ARTID, B.ARTDES, D.CIADES, A.FAMID, A.SFAMID '
          +'  FROM LOG316 A, TGE205 B, TGE131 C, TGE101 D, TGE151 E, TGE152 F, LOG323 G '
          +' WHERE ((((' + DMALM.wReplacCeros + '(STKTSG' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISG' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSG' + xMes + ',0)) *  B.ARTCPROG) > 0) '
          +'      OR (((' + DMALM.wReplacCeros + '(STKTSU' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISU' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSU' + xMes + ',0)) *  B.ARTCPROU) > 0)) '
          +'   AND A.ARTID =B.ARTID(+)  AND A.CIAID=B.CIAID(+) '
          +'   AND A.CIAID=C.CIAID(+) AND A.GRARID=C.GRARID(+) AND A.TINID=C.TINID(+) '
          +'   AND A.CIAID =D.CIAID(+) '
          +'   AND A.ALMID =E.ALMID(+) AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) '
          +'   AND A.CIAID =F.CIAID(+) AND A.TINID=F.TINID(+) '
          +'   AND A.CIAID =G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ' '
          +'   AND STKANO=''' + xAno + ''' '
          +' ORDER BY A.TINID, A.GRARID, A.ARTID';
// Final HPC_201402_ALM
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      If (DMALM.cdsReporte.FieldByName('STOCKU').AsFloat < 0) Then
      Begin
         CCont := DMALM.cdsReporte.FieldByName('ARTCONT').AsInteger;

         DMALM.cdsReporte.Edit;
         DMALM.cdsReporte.FieldByName('STOCK').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat - 1;
         DMALM.cdsReporte.FieldByName('STOCKU').AsFloat := DMALM.cdsReporte.FieldByName('STOCKU').AsFloat + CCont;

         DMALM.cdsReporte.FieldByName('COSTO').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('COSTO').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('COSTOU').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('COSTOU').AsFloat, 15, 4);

         DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat * DMALM.cdsReporte.FieldByName('COSTO').AsFloat;
         DMALM.cdsReporte.FieldByName('VALORU').AsFloat := DMALM.cdsReporte.FieldByName('STOCKU').AsFloat * DMALM.cdsReporte.FieldByName('COSTOU').AsFloat;

         DMALM.cdsReporte.Post;
      End;
      DMALM.cdsReporte.Next;
   End;

   DMALM.cdsReporte.IndexFieldNames := 'CIAID;ALMDES;TINID;GRARID;ARTID';

   pprInvVal.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\Inventario_Real.Rtm';
   pprInvVal.template.LoadFromFile;
   pplPeriodo.Caption := xDia + '/' + xMes + '/' + xAno;

   ppDesigner1.Report := pprInvVal;
   ppDesigner1.ShowModal;
   pprInvVal.Stop;

   x10 := pprInvVal.GroupCount - 1;
   While x10 >= 0 Do
   Begin
      pprInvVal.Groups[x10].Free;
      x10 := x10 - 1;
   End;
End;

Procedure TFToolKdx.BitBtn4Click(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, sHasta: String;
   D, M, Y: Word;
   x10: Integer;
   CCont: Double;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   InsDataFil;

   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

// Inicio HPC_201402_ALM
   xSQL := 'SELECT A.ARTCONT, B.ARTPCG, (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) * B.ARTPCG TOTCOS, '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) STOCK, '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) VALOR, '
          +'       CASE WHEN '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) <> 0 THEN '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) / '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) ELSE 0 END COSTO, A.UNMIDG, '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) STOCKU, '
          +'       (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) VALORU, '
          +'       CASE WHEN '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) <> 0 THEN '
          +'       (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) / '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) ELSE 0 END COSTOU, A.UNMIDU, '
          +'       E.ALMDES, A.CIAID, A.TINID, F.TINDES, A.GRARID, C.GRARDES, A.ARTID, B.ARTDES, D.CIADES, A.FAMID, A.SFAMID '
          +'  FROM LOG316 A, TGE205 B, TGE131 C, TGE101 D, TGE151 E, TGE152 F, LOG323 G '
          +' WHERE ( NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0) > 0 ) '
          +'   AND A.ARTID =B.ARTID(+)  AND A.CIAID=B.CIAID(+) '
          +'   AND A.CIAID=C.CIAID(+) AND A.GRARID=C.GRARID(+) AND A.TINID=C.TINID(+) '
          +'   AND A.CIAID =D.CIAID(+) '
          +'   AND A.ALMID =E.ALMID(+) AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) '
          +'   AND A.CIAID =F.CIAID(+) AND A.TINID=F.TINID(+) '
          +'   AND A.CIAID =G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ' '
          +'   AND STKANO=''' + xAno + ''' '
          +' ORDER BY A.TINID, A.GRARID, A.ARTID';
// Final HPC_201402_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      If (DMALM.cdsReporte.FieldByName('STOCKU').AsFloat < 0) Then
      Begin
         CCont := DMALM.cdsReporte.FieldByName('ARTCONT').AsInteger;

         DMALM.cdsReporte.Edit;
         DMALM.cdsReporte.FieldByName('STOCK').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat - 1;
         DMALM.cdsReporte.FieldByName('STOCKU').AsFloat := DMALM.cdsReporte.FieldByName('STOCKU').AsFloat + CCont;

         DMALM.cdsReporte.FieldByName('COSTO').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('COSTO').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('COSTOU').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('COSTOU').AsFloat, 15, 4);

         DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat * DMALM.cdsReporte.FieldByName('COSTO').AsFloat;
         DMALM.cdsReporte.FieldByName('VALORU').AsFloat := DMALM.cdsReporte.FieldByName('STOCKU').AsFloat * DMALM.cdsReporte.FieldByName('COSTOU').AsFloat;

         DMALM.cdsReporte.Post;
      End;
      DMALM.cdsReporte.Next;
   End;

   DMALM.cdsReporte.IndexFieldNames := 'CIAID;ALMDES;TINID;GRARID;ARTID';

   pprInvVal.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\Inventario_Real.Rtm';
   pprInvVal.template.LoadFromFile;

   pplPeriodo.Caption := xDia + '/' + xMes + '/' + xAno;
   pprInvVal.Print;
   pprInvVal.Stop;

   x10 := pprInvVal.GroupCount - 1;
   While x10 >= 0 Do
   Begin
      pprInvVal.Groups[x10].Free;
      x10 := x10 - 1;
   End;
End;

Procedure TFToolKdx.bbtnAntiguoClick(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, sHasta, cSQLArt: String;
   D, M, Y: Word;
   x10: Integer;
   CCont, dIGV: Double;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   BuscaQry('dspUltTGE', 'TGE108', '*', 'TASAFLG=''I'' ', 'TASAID');
   dIGV := DMALM.cdsQry.FieldByName('TASACAN').AsFloat;

   InsDataFil;

   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

// Inicio HPC_201402_ALM
   xSQL := 'SELECT A.CIAID, A.TINID, A.ARTCONT, '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) STOCK, '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) VALOR, '
          +'       round( CASE WHEN '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) <> 0 THEN '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) / '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) ELSE 0 END, 4) COSTO, A.UNMIDG, '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) STOCKU, '
          +'       (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) VALORU, '
          +'       round( CASE WHEN '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) <> 0 THEN '
          +'       (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) / '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) ELSE 0 END, 4) COSTOU, A.UNMIDU, '
          +'       A.ALMID, E.ALMDES, F.TINDES, A.GRARID, C.GRARDES, A.ARTID, B.ARTDES, D.CIADES, A.FAMID, A.SFAMID, '
          +'       T.FECHA, TO_CHAR( T.FECHA,''YYYY'') ANOCOMP, LPREPREGMO PRE_VEN, ROUND(LPREPREGMO * ( 1 + (' + FloatToStr(dIGV) + '/100) ),2) PRE_VEN_IGV  '
          +'  FROM LOG316 A, TGE205 B, TGE131 C, TGE101 D, TGE151 E, TGE152 F, LOG323 G, '
          +'      (Select CIAID, ARTID, MAX(NISAFREG) FECHA from LOG315 '
          +'        where CIAID IN (''02'', ''04'') and NISATIP=''INGRESO'' AND TRIID IN (''01'',''02'',''09'',''11'',''16'') '
          +'        group by CIAID, ARTID ) T, FAC201 L '
          +' WHERE ((((' + DMALM.wReplacCeros + '(STKTSG' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISG' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSG' + xMes + ',0)) ) > 0) '
          +'       OR (((' + DMALM.wReplacCeros + '(STKTSU' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISU' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSU' + xMes + ',0)) ) > 0)) '
          +'   AND A.ARTID =B.ARTID(+)  AND A.CIAID=B.CIAID(+) AND NVL(B.CONSIGNACION,''N'')=''N'' '
          +'   AND A.CIAID=C.CIAID(+) AND A.GRARID=C.GRARID(+) AND A.TINID=C.TINID(+) '
          +'   AND A.CIAID =D.CIAID(+) '
          +'   AND A.ALMID =E.ALMID(+) AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) '
          +'   AND A.CIAID =F.CIAID(+) AND A.TINID=F.TINID(+) '
          +'   AND A.CIAID =G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ' '
          +'   AND STKANO=''' + xAno + ''' AND A.CIAID=T.CIAID(+) AND A.ARTID=T.ARTID(+) '
          +'   AND A.CIAID=L.CIAID(+) AND L.TLISTAID(+)=''2DE'' AND A.ARTID=L.ARTID(+) '
          +' ORDER BY A.TINID, A.GRARID, A.ARTID';
// Final HPC_201402_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      If (DMALM.cdsReporte.FieldByName('STOCKU').AsFloat < 0) Then
      Begin
         CCont := DMALM.cdsReporte.FieldByName('ARTCONT').AsInteger;

         DMALM.cdsReporte.Edit;
         DMALM.cdsReporte.FieldByName('STOCK').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat - 1;
         DMALM.cdsReporte.FieldByName('STOCKU').AsFloat := DMALM.cdsReporte.FieldByName('STOCKU').AsFloat + CCont;
         DMALM.cdsReporte.FieldByName('COSTO').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('COSTO').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('COSTOU').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('COSTOU').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat * DMALM.cdsReporte.FieldByName('COSTO').AsFloat;
         DMALM.cdsReporte.FieldByName('VALORU').AsFloat := DMALM.cdsReporte.FieldByName('STOCKU').AsFloat * DMALM.cdsReporte.FieldByName('COSTOU').AsFloat;

         DMALM.cdsReporte.Post;
      End;
      DMALM.cdsReporte.Next;
   End;

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      If DMALM.cdsReporte.FieldByName('COSTO').AsFloat <= 0 Then
      Begin
         cSQLArt := 'SELECT nvl(ARTPCG,0) PREUNI FROM TGE205 C '
                  + ' WHERE C.CIAID=''' + DMALM.cdsReporte.FieldByName('CIAID').AsString + ''' '
                  + '   AND C.TINID=''' + DMALM.cdsReporte.FieldByName('TINID').AsString + ''' '
                  + '   AND C.ARTID=''' + DMALM.cdsReporte.FieldByName('ARTID').AsString + ''' ';
         DMALM.cdsQry.Close;
         DMALM.cdsQry.DataRequest(cSQLArt);
         DMALM.cdsQry.Open;

         DMALM.cdsReporte.Edit;
         DMALM.cdsReporte.FieldByName('COSTO').AsFloat := DMALM.FRound(DMALM.cdsQry.FieldByName('PREUNI').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat * DMALM.cdsReporte.FieldByName('COSTO').AsFloat;
         DMALM.cdsReporte.Post;
      End;
      DMALM.cdsReporte.Next;
   End;

   DMALM.cdsReporte.IndexFieldNames := 'CIAID; ANOCOMP; TINID; ALMID; GRARID; ARTID';

   ppdbMovi.DataSource := DMALM.dsReporte;
   pprInvVal.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexAntiguedad.Rtm';
   pprInvVal.template.LoadFromFile;
   pprInvVal.DataPipeline := ppdbMovi;

   pprInvVal.AllowPrintToArchive := True;
   pprInvVal.AllowPrintToFile := True;

   pplPeriodo.Caption := xDia + '/' + xMes + '/' + xAno;

   If cbDiseno.Checked Then
   Begin
      ppDesigner1.Report := pprInvVal;
      ppDesigner1.ShowModal;
   End
   Else
   Begin
      pprInvVal.Print;
      pprInvVal.Stop;
      DMALM.cdsReporte.Close;
      DMALM.cdsReporte.IndexFieldNames := '';

      pprInvVal.DataPipeline := Nil;
      ppdbMovi.DataSource := Nil;
      ppDesigner1.Report := Nil;

      Screen.Cursor := crDefault;
      x10 := pprInvVal.GroupCount - 1;
      While x10 >= 0 Do
      Begin
         pprInvVal.Groups[x10].Free;
         x10 := x10 - 1;
      End;
   End;
End;

Procedure TFToolKdx.bbtnConsignacionClick(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, sHasta, cSQLArt: String;
   D, M, Y: Word;
   x10: Integer;
   CCont: Double;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   InsDataFil;

   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

// Inicio HPC_201402_ALM
   xSQL := 'SELECT A.CIAID, A.TINID, A.ARTCONT, '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) STOCK, '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) VALOR, '
          +'       round( CASE WHEN '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) <> 0 THEN '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) / '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) ELSE 0 END COSTO,4), A.UNMIDG, '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) STOCKU, '
          +'       (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) VALORU, '
          +'       round( CASE WHEN '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) <> 0 THEN '
          +'       (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) / '
          +'       (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) ELSE 0 END,4) COSTOU, A.UNMIDU, '
          +'       A.ALMID, E.ALMDES, A.CIAID, A.TINID, F.TINDES, A.GRARID, C.GRARDES, A.ARTID, B.ARTDES, D.CIADES, A.FAMID, A.SFAMID '
          +'  FROM LOG316 A, TGE205 B, TGE131 C, TGE101 D, TGE151 E, TGE152 F, LOG323 G '
          +' WHERE ((((' + DMALM.wReplacCeros + '(STKTSG' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISG' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSG' + xMes + ',0)) ) > 0) '
          +'     OR (((' + DMALM.wReplacCeros + '(STKTSU' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISU' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSU' + xMes + ',0)) ) > 0)) '
          +'   AND A.ARTID =B.ARTID(+)  AND A.CIAID=B.CIAID(+) AND NVL(B.CONSIGNACION,''N'')=''S'' '
          +'   AND A.CIAID=C.CIAID(+) AND A.GRARID=C.GRARID(+) AND A.TINID=C.TINID(+) '
          +'   AND A.CIAID =D.CIAID(+) '
          +'   AND A.ALMID =E.ALMID(+) AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) '
          +'   AND A.CIAID =F.CIAID(+) AND A.TINID=F.TINID(+) '
          +'   AND A.CIAID =G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ' '
          +'   AND STKANO=''' + xAno + ''' '
          +' ORDER BY A.TINID, A.GRARID, A.ARTID';
// Final HPC_201402_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      If (DMALM.cdsReporte.FieldByName('STOCKU').AsFloat < 0) Then
      Begin
         CCont := DMALM.cdsReporte.FieldByName('ARTCONT').AsInteger;

         DMALM.cdsReporte.Edit;
         DMALM.cdsReporte.FieldByName('STOCK').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat - 1;
         DMALM.cdsReporte.FieldByName('STOCKU').AsFloat := DMALM.cdsReporte.FieldByName('STOCKU').AsFloat + CCont;
         DMALM.cdsReporte.FieldByName('COSTO').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('COSTO').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('COSTOU').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('COSTOU').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat * DMALM.cdsReporte.FieldByName('COSTO').AsFloat;
         DMALM.cdsReporte.FieldByName('VALORU').AsFloat := DMALM.cdsReporte.FieldByName('STOCKU').AsFloat * DMALM.cdsReporte.FieldByName('COSTOU').AsFloat;

         DMALM.cdsReporte.Post;
      End;
      DMALM.cdsReporte.Next;
   End;

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      If DMALM.cdsReporte.FieldByName('COSTO').AsFloat <= 0 Then
      Begin
         cSQLArt := 'SELECT nvl(ARTPCG,0) PREUNI FROM TGE205 C '
                  + ' WHERE C.CIAID=''' + DMALM.cdsReporte.FieldByName('CIAID').AsString + ''' '
                  + '   AND C.TINID=''' + DMALM.cdsReporte.FieldByName('TINID').AsString + ''' '
                  + '   AND C.ARTID=''' + DMALM.cdsReporte.FieldByName('ARTID').AsString + ''' ';
         DMALM.cdsQry.Close;
         DMALM.cdsQry.DataRequest(cSQLArt);
         DMALM.cdsQry.Open;

         DMALM.cdsReporte.Edit;
         DMALM.cdsReporte.FieldByName('COSTO').AsFloat := DMALM.FRound(DMALM.cdsQry.FieldByName('PREUNI').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat * DMALM.cdsReporte.FieldByName('COSTO').AsFloat;
         DMALM.cdsReporte.Post;
      End;
      DMALM.cdsReporte.Next;
   End;

   DMALM.cdsReporte.IndexFieldNames := 'CIAID;ALMID;TINID;GRARID;ARTID';

   ppdbMovi.DataSource := DMALM.dsReporte;
   pprInvVal.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\KardexInvConsig.Rtm';
   pprInvVal.template.LoadFromFile;
   pprInvVal.DataPipeline := ppdbMovi;

   pplPeriodo.Caption := xDia + '/' + xMes + '/' + xAno;

   If cbDiseno.Checked Then
   Begin
      ppDesigner1.Report := pprInvVal;
      ppDesigner1.ShowModal;
   End
   Else
      pprInvVal.Print;
   pprInvVal.Stop;
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';

   pprInvVal.DataPipeline := Nil;
   ppdbMovi.DataSource := Nil;
   ppDesigner1.Report := Nil;

   x10 := pprInvVal.GroupCount - 1;
   While x10 >= 0 Do
   Begin
      pprInvVal.Groups[x10].Free;
      x10 := x10 - 1;
   End;
End;

Procedure TFToolKdx.bbtnExcel1Click(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, sHasta, cSQLArt: String;
   D, M, Y: Word;
   x10: Integer;
   CCont: Double;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   InsDataFil;

   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

// Inicio HPC_201402_ALM
   xSQL := 'SELECT A.CIAID, D.CIADES, '
          +'       NVL(B.TIPART,''0000'') TIPART, NVL(T.TIPARTDES,''NO ASIGNADOS'') TIPARTDES, '
          +'       NVL(T.LINCOM,''00'') LINCOM, NVL(L.LINCOMDES,''NO ASIGNADOS'') LINCOMDES, '
          +'       A.ARTID, B.ARTDES, '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) STOCK,  A.UNMIDG,'
          +'       round( CASE WHEN '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) <> 0 THEN '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) / '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) ELSE 0 END,4) COSTO, '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) VALOR, '
          +'       E.ALMDES, A.TINID, F.TINDES, A.FAMID, A.SFAMID '
          +'  FROM LOG316 A, TGE205 B, TGE101 D, TGE151 E, TGE152 F, LOG323 G, ALM_TIP_ART T, ALM_LIN_COM L '
          +' WHERE ((((' + DMALM.wReplacCeros + '(STKTSG' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISG' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSG' + xMes + ',0)) ) > 0) '
          +'      OR (((' + DMALM.wReplacCeros + '(STKTSU' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISU' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSU' + xMes + ',0)) ) > 0)) '
          +'   AND A.ARTID =B.ARTID(+)  AND A.CIAID=B.CIAID(+) '
          +'   AND A.CIAID =D.CIAID(+) '
          +'   AND A.ALMID =E.ALMID(+) AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) '
          +'   AND A.CIAID =F.CIAID(+) AND A.TINID=F.TINID(+) '
          +'   AND A.CIAID =G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ' '
          +'   AND STKANO=''' + xAno + ''' '
          +'   AND B.TIPART=T.TIPART(+) '
          +'   AND T.LINCOM=L.LINCOM(+) '
          +' ORDER BY E.ALMDES, NVL(T.LINCOM,''00''), NVL(B.TIPART,''0000''), B.ARTID';
// Fin HPC_201402_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      If DMALM.cdsReporte.FieldByName('COSTO').AsFloat <= 0 Then
      Begin
         cSQLArt := 'SELECT nvl(ARTPCG,0) PREUNI FROM TGE205 C '
                  + ' WHERE C.CIAID=''' + DMALM.cdsReporte.FieldByName('CIAID').AsString + ''' '
                  + '   AND C.TINID=''' + DMALM.cdsReporte.FieldByName('TINID').AsString + ''' '
                  + '   AND C.ARTID=''' + DMALM.cdsReporte.FieldByName('ARTID').AsString + ''' ';
         DMALM.cdsQry.Close;
         DMALM.cdsQry.DataRequest(cSQLArt);
         DMALM.cdsQry.Open;

         DMALM.cdsReporte.Edit;
         DMALM.cdsReporte.FieldByName('COSTO').AsFloat := DMALM.FRound(DMALM.cdsQry.FieldByName('PREUNI').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat * DMALM.cdsReporte.FieldByName('COSTO').AsFloat;
         DMALM.cdsReporte.Post;
      End;
      DMALM.cdsReporte.Next;
   End;

   dtgData.DataSource := DMALM.dsReporte;

   (*Screen.Cursor := crDefault;*)

   If DMALM.cdsReporte.RecordCount > 0 Then
   Begin
      Try
         DMALM.HojaExcel('INVENTARIO', DMALM.dsReporte, dtgData);
      Except
         On Ex: Exception Do
            Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      End;
   End
   Else
      MessageDlg('No Existe Infromación Para Esta Consulta ', mtInformation, [mbOk], 0);

End;

Procedure TFToolKdx.bbtnExcelAntigClick(Sender: TObject);
Var
   xSQL, xDia, xMes, xMAn, xAno, sHasta, cSQLArt: String;
   D, M, Y: Word;
   x10: Integer;
   CCont, dIGV: Double;
Begin
   VerAno;
   Screen.Cursor := crHourGlass;

   BuscaQry('dspUltTGE', 'TGE108', '*', 'TASAFLG=''I'' ', 'TASAID');
   dIGV := DMALM.cdsQry.FieldByName('TASACAN').AsFloat;

   InsDataFil;

   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));

   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

// Inicio HPC_201402_ALM
   xSQL := 'SELECT A.CIAID, A.TINID, '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) STOCK, '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) VALOR, '
          +'       round( CASE WHEN '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) <> 0 THEN '
          +'       (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) / '
          +'       (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) ELSE 0 END COSTO,4), A.UNMIDG, '
          +'       A.ALMID, E.ALMDES, F.TINDES, A.GRARID, C.GRARDES, A.ARTID, B.ARTDES, D.CIADES, A.FAMID, A.SFAMID, '
          +'       T.FECHA, TO_CHAR( T.FECHA,''YYYY'') ANOCOMP, LPREPREGMO PRE_VEN, ROUND(LPREPREGMO * ( 1 + (' + FloatToStr(dIGV) + '/100) ),2) PRE_VEN_IGV  '
          +'  FROM LOG316 A, TGE205 B, TGE131 C, TGE101 D, TGE151 E, TGE152 F, LOG323 G, '
          +'      (Select CIAID, ARTID, MAX(NISAFREG) FECHA from LOG315 '
          +'        where CIAID IN (''02'', ''04'') and NISATIP=''INGRESO'' AND TRIID IN (''01'',''02'',''09'',''11'',''16'') '
          +'        group by CIAID, ARTID ) T, FAC201 L '
          +' WHERE ((((' + DMALM.wReplacCeros + '(STKTSG' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISG' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSG' + xMes + ',0)) ) > 0) '
          +'      OR (((' + DMALM.wReplacCeros + '(STKTSU' + xMes + ',0) + ' + DMALM.wReplacCeros + '(STKISU' + xMes + ',0) - ' + DMALM.wReplacCeros + '(STKSSU' + xMes + ',0)) ) > 0)) '
          +'   AND A.ARTID =B.ARTID(+)  AND A.CIAID=B.CIAID(+) AND NVL(B.CONSIGNACION,''N'')=''N'' '
          +'   AND A.CIAID=C.CIAID(+) AND A.GRARID=C.GRARID(+) AND A.TINID=C.TINID(+) '
          +'   AND A.CIAID =D.CIAID(+) '
          +'   AND A.ALMID =E.ALMID(+) AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) '
          +'   AND A.CIAID =F.CIAID(+) AND A.TINID=F.TINID(+) '
          +'   AND A.CIAID =G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMID=G.ALMID AND A.ARTID=G.ARTID AND G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ' '
          +'   AND STKANO=''' + xAno + ''' AND A.CIAID=T.CIAID(+) AND A.ARTID=T.ARTID(+) '
          +'   AND A.CIAID=L.CIAID(+) AND L.TLISTAID(+)=''2DE'' AND A.ARTID=L.ARTID(+) '
          +' ORDER BY A.TINID, A.GRARID, A.ARTID';
// Final HPC_201402_ALM

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo de Almacen', 'No Existe Información a Mostrar');
      Exit;
   End;

   DMALM.cdsReporte.First;
   While Not DMALM.cdsReporte.Eof Do
   Begin
      If DMALM.cdsReporte.FieldByName('COSTO').AsFloat <= 0 Then
      Begin
         cSQLArt := 'SELECT nvl(ARTPCG,0) PREUNI FROM TGE205 C '
                  + ' WHERE C.CIAID=''' + DMALM.cdsReporte.FieldByName('CIAID').AsString + ''' '
                  + '   AND C.TINID=''' + DMALM.cdsReporte.FieldByName('TINID').AsString + ''' '
                  + '   AND C.ARTID=''' + DMALM.cdsReporte.FieldByName('ARTID').AsString + ''' ';
         DMALM.cdsQry.Close;
         DMALM.cdsQry.DataRequest(cSQLArt);
         DMALM.cdsQry.Open;

         DMALM.cdsReporte.Edit;
         DMALM.cdsReporte.FieldByName('COSTO').AsFloat := DMALM.FRound(DMALM.cdsQry.FieldByName('PREUNI').AsFloat, 15, 4);
         DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.cdsReporte.FieldByName('STOCK').AsFloat * DMALM.cdsReporte.FieldByName('COSTO').AsFloat;
         DMALM.cdsReporte.Post;
      End;
      DMALM.cdsReporte.Next;
   End;

   DMALM.cdsReporte.IndexFieldNames := 'CIAID; ANOCOMP; TINID; ALMID; GRARID; ARTID';

   dtgData.DataSource := DMALM.dsReporte;

   If DMALM.cdsReporte.RecordCount > 0 Then
   Begin
      Try
         DMALM.HojaExcel('INVENTARIO', DMALM.dsReporte, dtgData);
      Except
         On Ex: Exception Do
            Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      End;
   End
   Else
      MessageDlg('No Existe Infromación Para Esta Consulta ', mtInformation, [mbOk], 0);

End;

Procedure TFToolKdx.btnChkClick(Sender: TObject);
Var
   xsql, xper1, xper2: String;
   xWhere, xOrder: String; // HPC_201405_ALM
   x: Integer; // HPC_201405_ALM
Begin
   xper1 := sbAno.Text + sbMes.Text;
   xper2 := FormatDateTime('YYYYMM', dtpHasta.DateTime);

// Inicio HPC_201402_ALM
   {
 xSQL :='Select A.ciaid,A.loganomm,A.almid,A.tinid,A.artid,A.stkini,A.cantoting,A.cantotsal,A.stkfin,A.usuario,A.freg '
   +'From Log319 A	Where A.LOGANOMM>='''+xper1+''' AND A.LOGANOMM<='''+xper2+''' order by Ciaid,Almid,Tinid,Artid,Loganomm ';
   }
// Inicio HPC_201405_ALM
   xSQL := 'Select A.CIAID, A.LOGANOMM,A.ALMID,B.TINID, B.GRARID, B.FAMID, B.SFAMID, A.ARTID, B.ARTDES, A.STKINI, A.CANTOTING, '
         + '       A.CANTOTSAL, A.STKFIN, A.USUARIO, A.FREG '
         + '  From LOG319 A, TGE205 B '
         + ' Where A.LOGANOMM>=' + quotedstr(xper1)
         + '   and A.LOGANOMM<=' + quotedstr(xper2)
         + '   and B.CIAID=A.CIAID and B.ARTID=A.ARTID ';

   xWhere := '';
   For x := 0 To Mtx4000.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      If length(xWhere) > 0 Then
         If Copy(Mtx4000.FMant.lbFiltroReal.Items.Strings[x], 1, 4) = ' or ' Then
            xWhere := xWhere + Mtx4000.FMant.lbFiltroReal.Items.Strings[x]
         Else
            xWhere := xWhere + ' and ' + Mtx4000.FMant.lbFiltroReal.Items.Strings[x]
      Else
      Begin
         xWhere := Mtx4000.FMant.lbFiltroReal.Items.Strings[x];
      End;
   End;

   xOrder := '';
   For x := 0 To Mtx4000.FMant.lbOrdenReal.Items.Count - 1 Do
   Begin
      If length(xOrder) > 0 Then
         xOrder := xOrder + ', ' + Mtx4000.FMant.lbOrdenReal.Items.Strings[x]
      Else
      Begin
         xOrder := Mtx4000.FMant.lbOrdenReal.Items.Strings[x];
      End;
   End;

   If length(xWhere) > 0 Then
      xSQL := xSQL + 'and ' + xWhere;
   If length(xOrder) = 0 Then
      xSQL := xSQL + ' Order by CIAID,ALMID,TINID,ARTID,LOGANOMM '
   Else
      xSQL := xSQL + ' Order by ' + xOrder;
// Final HPC_201402_ALM
   Mtx4000.UsuarioSQL.Clear;
// Final HPC_201405_ALM
   Mtx4000.NoVisible.Clear;
   Mtx4000.UsuarioSQL.Add(xSQL);
   Mtx4000.NewQuery;
End;

Procedure TFToolKdx.sbDisenoClick(Sender: TObject);
Begin
   cbDiseno.Checked := Not cbDiseno.Checked;
End;

// Inicio HPC_201402_ALM
Procedure TFToolKdx.bbtnInvValExcelClick(Sender: TObject);
Begin
   xContinuaConsulta := True;
   xFechaPeriodo := datetostr(dtpHasta.date);
   DataInvValorizado;
   If Not xContinuaConsulta Then exit;

   dtgData.datasource := DMALM.dsReporte;
   Try
      DMALM.HojaExcel('INVENTARIO', DMALM.dsReporte, dtgData);
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
End;
// Final HPC_201402_ALM

Procedure TFToolKdx.sbMesExit(Sender: TObject);
Begin
   sbMes.Text := DMALM.StrZero(trim(sbMes.Text), 2);
End;

// Inicio HPC_201402_ALM
Procedure TFToolKdx.DataInvValorizado;
Var
   xSQL, xDia, xMes, xMAn, xAno, sHasta: String;
   D, M, Y: Word;
   xConCeros: boolean;
   xWhere, xOrder: String;
   x: Integer;
Begin
   Screen.Cursor := crHourGlass;
   xConCeros := False;
   If MessageDlg('¿Considerar Saldos con Cero?   ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      xConCeros := True;

   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dtpHasta.DateTime));
   DecodeDate(dtpHasta.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

   xWhere := '';
   For x := 0 To Mtx4000.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      If length(xWhere) > 0 Then
         If Copy(Mtx4000.FMant.lbFiltroReal.Items.Strings[x], 1, 4) = ' or ' Then
            xWhere := xWhere + Mtx4000.FMant.lbFiltroReal.Items.Strings[x]
         Else
            xWhere := xWhere + ' and ' + Mtx4000.FMant.lbFiltroReal.Items.Strings[x]
      Else
      Begin
         xWhere := Mtx4000.FMant.lbFiltroReal.Items.Strings[x];
      End;
   End;

   xOrder := '';
   For x := 0 To Mtx4000.FMant.lbOrdenReal.Items.Count - 1 Do
   Begin
      If length(xOrder) > 0 Then
         xOrder := xOrder + ', ' + Mtx4000.FMant.lbOrdenReal.Items.Strings[x]
      Else
      Begin
         xOrder := Mtx4000.FMant.lbOrdenReal.Items.Strings[x];
      End;
   End;

// Inicio HPC_201405_ALM
   xSQL := 'Select A.CIAID, A.ALMID, B.TINID, B.ARTCONT, '
         + '       nvl(A.STKINI,0) STOCKINI, '
         + '       nvl(A.STKFIN,0) STOCK, '
         + '              nvl(H.PREPROMFIN,B.ARTCPROG) COSTOU, '
         + '              nvl(H.PREPROMFIN,B.ARTCPROG) COSTO, '
         + '              round(nvl(A.STKFIN,0)*nvl(H.PREPROMFIN,B.ARTCPROG),5) VALOR, '
         + '              B.UNMIDG, B.UNMIDU, A.ALMID, E.ALMDES, A.CIAID, F.TINDES, B.GRARID, C.GRARDES, '
         + '              A.ARTID, B.ARTDES, D.CIADES, B.FAMID, B.SFAMID '
         + '  From LOG319 A, TGE205 B, TGE131 C, TGE101 D, '
         + '              TGE151 E, TGE152 F, ' // LOG323 G,
         + '              LOG337 H '
//         + '        WHERE A.CIAID='+quotedstr(xCiaFiltro)
//         + '          and A.LOGANOMM=' + quotedstr(xAno + xMes);
         + '        WHERE A.LOGANOMM=' + quotedstr(xAno + xMes);
// Fin HPC_201405_ALM
   If Not xConCeros Then
      xSQL := xSQL + '          and nvl(A.STKFIN,0) > 0 ';
   xSQL := xSQL
         + '          and B.CIAID(+)=A.CIAID and B.ARTID(+)=A.ARTID and nvl(B.CONSIGNACION,''N'')=''N'' '
         + '          and H.CIAID(+)=A.CIAID and H.LOGANOMM(+)=A.LOGANOMM and H.ARTID(+)=A.ARTID '
         + '          and C.CIAID(+)=B.CIAID and C.TINID(+)=B.TINID and C.GRARID(+)=B.GRARID '
         + '          and D.CIAID(+)=A.CIAID '
         + '          and E.CIAID(+)=A.CIAID '
         + '               and E.TINID(+)=A.TINID and E.ALMID(+)=A.ALMID '
         + '          and F.CIAID(+)=B.CIAID and F.TINID(+)=B.TINID ';
   If length(xWhere) > 0 Then
      xSQL := xSQL + 'and ' + xWhere;
   If length(xOrder) = 0 Then
      xSQL := xSQL + ' Order by B.TINID, B.GRARID, A.ARTID, A.ALMID '
   Else
      xSQL := xSQL + ' Order by ' + xOrder;

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.IndexFieldNames := '';
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   DecodeDate(dtpHasta.Date + 1, Y, M, D); // si es último día del mes, la siguiente fecha cambia de mes
   If strtoint(xMes) = M Then
   Begin
      If MessageDlg('¿Considerar Saldos sólo hasta ' + datetostr(dtpHasta.Date) + '? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMALM.cdsReporte.First;
         While Not DMALM.cdsReporte.EOF Do
         Begin
            xSQL := 'select sum(case when NISATIP=''INGRESO'' then KDXCNTG else -KDXCNTG end) MOVKARDEX '
                  + '  from LOG315 '
                  + ' where CIAID=' + quotedstr(DMALM.cdsReporte.FieldByName('CIAID').AsString)
                  + '   and ALMID=' + quotedstr(DMALM.cdsReporte.FieldByName('ALMID').AsString)
                  + '   and ARTID=' + quotedstr(DMALM.cdsReporte.FieldByName('ARTID').AsString)
                  + '   and NISAFREG>=' + quotedstr(datetostr(strtodate('01/' + xMes + '/' + xAno)))
                  + '   and NISAFREG<=' + quotedstr(datetostr(dtpHasta.Date))
                  + '   and NISSIT=' + quotedstr('ACEPTADO');
            DMALM.cdsQry.Close;
            DMALM.cdsQry.DataRequest(xSQL);
            DMALM.cdsQry.Open;
            If DMALM.cdsQry.Recordcount > 0 Then
            Begin
               DMALM.cdsReporte.Edit;
               DMALM.cdsReporte.FieldByName('STOCK').AsFloat := DMALM.cdsReporte.FieldByName('STOCKINI').AsFloat
                  + DMALM.cdsQry.FieldByName('MOVKARDEX').AsFloat;
               DMALM.cdsReporte.FieldByName('VALOR').AsFloat := DMALM.FRound(DMALM.cdsReporte.FieldByName('STOCK').AsFloat
                  * DMALM.cdsReporte.FieldByName('COSTO').AsFloat, 15, 2);
               DMALM.cdsReporte.Post;
            End;
            DMALM.cdsReporte.Next;
         End;
      End;
   End;

   Screen.Cursor := crDefault;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Módulo de Almacén', 'No Existe Información a Mostrar');
      xContinuaConsulta := False;
      Exit;
   End;

   xFechaPeriodo := xDia + '/' + xMes + '/' + xAno;

   DMALM.cdsReporte.First;
End;
// Fin HPC_201402_ALM

End.

