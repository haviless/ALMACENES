Unit ALM203;

//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : ALM203
//Formulario               : FRegNtaE
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Ventana de Registro de Notas de Ingreso

//Actualizaciones:

// HPP_201101_ALM 26/01/2011: Se carga la variable bIngIGV con False para que
//                            las Notas de Ingreso se registren sin considerar el IGV
// HPP_201102_ALM 17/02/2011: Se incrementa el grado de precisión en los cálculos a 5 decimales
//                            Por ese motivo se modifica la asignación y el redondeo
//                            de los campos de montos en las Notas de ingreso
// HPP_201104_ALM 18/05/2011: Se modifica el SQL que lista las ordenes de compra, el cambio
//                            consiste en que también se mostrará la O/C con tipo de
//                            adquisición A: Activos fijos
// HPC_201106_ALM 16/09/2011: Se modificó la ventana de Registro de Notas de Ingreso
//                            el cambio consistió en:
//                            1.- Cuando se presiona el botón de grabar la nota de
//                                Ingreso queda grabada en la Base de Datos
//                            2.- Cuando se edita la cabecera (presionar el botón de la "manito"
//                                y se desea grabar y aceptar la Nota de Ingreso se
//                                habilitará el botón grabar y posteriormente el botón Aceptar
// HPC_201302_ALM 23/04/2013  Al momento de insertar una Nota de Ingreso se debe restringir los  tipos de
//                            inventarios inhabilitados; es decir no se debe poder realizar una nota de ingreso
//                            de un artículo con tipo de inventario inhabilitado.
// HPC_201303_ALM 08/05/2013  Al momento de  insertar una Nota de Ingreso de artículos y querer seleccionar  un almacén
//                            no se está mostrando los almacenes DESACTIVADO.
// HPC_201304_ALM 10/05/2013  Modificar las opciones que registran transacciones con Centro de Costo, para que no considere
//                            los Centros de Costos DESACTIVADOS.
// HPC_201307_ALM 21/10/2013  Modifica ACEPTACION de Nota de Ingreso para que utilice procedimientos de Base de Datos
//                            y grabación hacia Archivos de Saldos (LOG316, LOG337, LOG319)
// HPC_201308_ALM 05/12/2013  Valida que Fecha de Ingreso no sea menor a X días del Sistema
// HPC_201401_ALM 06/06/2014  En los ingresos y salidas de ARTICULOS, si esta marcado como inactivos no se muestra en la lista de consulta
//                            de artículos y si se digita muestra el siguiente mensaje de error. "ARTICULO INACTIVO" no dejando continuar con el proceso
// HPC_201403_ALM 12/09/2014  Se revisa el control de Transacciones, se adiciona en tres puntos: inicializacion de cabecera de Nota de Ingreso,
//                            Grabación de Nota de Ingreso y Aceptación de Nota de Ingreso.
// HPC_201502_ALM 21/06/2015  Ajustes a grabación de artículos con Nro.Serie
// HPC_201504_ALM 26/08/2015  Se cambia la llave de numeración de la Nota de Ingreso a CIA+ALMACEN+TIPO_NOTA+Nro.Nota
// HPC_201604_ALM 23/05/2016  Antes de validar nro de serie, valida que tenga flag FNSERIE='S' en Maestro de Artículos
// HPC_201605_ALM 04/07/2016: Se agrega estado "ELIMINADO" a notas de ingreso y notas de salida
//                            solo cuando estan en estado INICIAL. Se excluye eliminado físico.
//                            Se incluye actualización de usuario que acepta la NI/NS
// HPC_201607_ALM 08/08/2016  Grabación de campo NISAFREG en ACEPTACION de acuerdo a lo indicadd en campo de Fecha de la Nota de Ingreso
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
// HPC_201801_ALM 03/04/2018 Cambio de Búsqueda en Maestro de Clientes
//

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
   wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
   Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin, ppCtrls, ppBands,
   ppVar, ppStrtch, ppMemo, ppPrnabl, ppClass, ppProd, ppReport, ppComm,
   ppRelatv, ppCache, ppDB, ppDBPipe, ppViewr, wwclient, Variants, ppTypes,
   math, ppParameter, ppEndUsr, MsgDlgs;

Type
   TFRegNtaE = Class(TForm)
      pnlCabecera: TPanel;
      dblcCIA: TwwDBLookupCombo;
      Z2bbtnOK: TBitBtn;
      Z2bbtnBorrar: TBitBtn;
      dbmObs: TDBMemo;
      pnlDetalleG: TPanel;
      dblcTALM: TwwDBLookupCombo;
      dbdtpFNS: TwwDBDateTimePicker;
      lblNDoc: TLabel;
      dbeNDoc: TwwDBEdit;
      lblFDoc: TLabel;
      dbdtpFDoc: TwwDBDateTimePicker;
      dblcdTDOC: TwwDBLookupComboDlg;
      dblcTransac: TwwDBLookupCombo;
      lblCC: TLabel;
      dblcdCC: TwwDBLookupComboDlg;
      dblcdProv: TwwDBLookupComboDlg;
      lblProv: TLabel;
      dblcTDA: TwwDBLookupCombo;
      lblNOC: TLabel;
      pnlOC: TPanel;
      Z2bbtnSOCOK: TBitBtn;
      Z2bbtnSOCCA: TBitBtn;
      edNOrdC: TEdit;
      btnOC: TButton;
      dbgOrdComp: TwwDBGrid;
      pnlSELOC: TPanel;
      Z2bbtnSOCOK1: TBitBtn;
      Z2bbtnSOCCA1: TBitBtn;
      dblcdSODC: TwwDBLookupComboDlg;
      dbeF1: TwwDBEdit;
      dbeF2: TwwDBEdit;
      dbeF3: TwwDBEdit;
      dblcLOC: TwwDBLookupCombo;
      stxTitulo1: TPanel;
      stxTitulo4: TPanel;
      stxTitulo3: TPanel;
      dbeLote1: TwwDBEdit;
      dbePO: TwwDBEdit;
      dbeNP: TwwDBEdit;
      dbeCIA: TEdit;
      dbeTDOC: TEdit;
      dbeTDNISA: TEdit;
      dbeLOC: TEdit;
      dbeALM: TEdit;
      dbeTransac: TEdit;
      dbeCC: TEdit;
      dbeProv: TEdit;
      dbgDKDX: TwwDBGrid;
      Z2dbgDReqsIButton: TwwIButton;
      dbgOrdCompIbtn: TwwIButton;
      pnlNIxOC: TPanel;
      z2bbtnOkNIOC: TBitBtn;
      z2bbtnCancNIOC: TBitBtn;
      dbgNIxOC: TwwDBGrid;
      stxNIxOC: TStaticText;
      pnlControl: TPanel;
      Z2bbtnAceptar: TBitBtn;
      Z2bbtnRegresa: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      pnlActuali: TPanel;
      lblActuali: TLabel;
      Z2bbtnSalir: TBitBtn;
      lblEstado1: TLabel;
      lblCia: TLabel;
      lblLoc: TLabel;
      lblAlm: TLabel;
      lblTDoc: TLabel;
      lblFIng: TLabel;
      lblTrans: TLabel;
      lblNro: TLabel;
      lblDref: TLabel;
      lblLote: TLabel;
      lblPacked: TLabel;
      lblNPed: TLabel;
      lblObs: TLabel;
      lblOCom: TBevel;
      lblFoCom: TLabel;
      lblConCom: TLabel;
      lblTGen: TLabel;
      Label1: TLabel;
      dblcTIN: TwwDBLookupCombo;
      dbeTIN: TEdit;
      Z2bbtnPrint: TBitBtn;
      ppDBCab: TppDBPipeline;
      ppdbOC: TppDBPipeline;
      pprNiaEnt: TppReport;
      ppReport1: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      DEBEL: TBevel;
      lblNroNota: TLabel;
      dblcdNSal: TwwDBLookupComboDlg;
      dblcdClie: TwwDBLookupComboDlg;
      lblClie: TLabel;
      dbeClie: TEdit;
      dblcdPedido: TwwDBLookupComboDlg;
      dblcdGuia: TwwDBLookupComboDlg;
      lblGuia: TLabel;
      Memo1: TMemo;
      pnlNumeSerie: TPanel;
      StaticText1: TStaticText;
      Bevel1: TBevel;
      dbgGridSerie: TwwDBGrid;
      bbtnOKSerie: TBitBtn;
      bbtnCancelSerie: TBitBtn;
      bbtnKDXSerie: TBitBtn;
      bbtnLote: TBitBtn;
      pnlLote: TPanel;
      StaticText2: TStaticText;
      Label2: TLabel;
      dbeLote: TwwDBEdit;
      Label3: TLabel;
      dtpFecLote: TwwDBDateTimePicker;
      bbntnCancelLote: TBitBtn;
      ppParameterList1: TppParameterList;
      Label12: TLabel;
      dbeTCambio: TwwDBEdit;
      edCodBar: TEdit;
      Label4: TLabel;
      Label5: TLabel;
      bbtnCodBar: TBitBtn;
      Label6: TLabel;
      Label7: TLabel;
      edMarca: TEdit;
      edModelo: TEdit;
      edColor: TEdit;
      bbtnMarca: TBitBtn;
      ppDisenoRep: TppDesigner;
      ppDBLOG332: TppDBPipeline;
      ppHeaderBand2: TppHeaderBand;
      ppDBText57: TppDBText;
      ppDBText58: TppDBText;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel42: TppLabel;
      ppLabel44: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppDBText70: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLabel1: TppLabel;
      ppDBMemo3: TppDBMemo;
      ppLabel2: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel7: TppLabel;
      ppDBText1: TppDBText;
      ppLabel3: TppLabel;
      ppDBText7: TppDBText;
      ppLabel8: TppLabel;
      ppDBText8: TppDBText;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLine2: TppLine;
      ppDBText2: TppDBText;
      ppDBText10: TppDBText;
      ppLabel12: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText60: TppDBText;
      ppDBText62: TppDBText;
      ppDBText63: TppDBText;
      ppDBMemo2: TppDBMemo;
      ppDBText4: TppDBText;
      ppDBText9: TppDBText;
      ppDBText3: TppDBText;
      ppDBText11: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppLabel11: TppLabel;
      ppLine1: TppLine;
      ppDBCalc1: TppDBCalc;
      ppLine4: TppLine;
      ppDBCalc2: TppDBCalc;
      ppLabel6: TppLabel;
      ppLine3: TppLine;
      pnlDetalleA: TPanel;
      lblMedUni: TLabel;
      lblMotivo: TLabel;
      lblPrecio: TLabel;
      lblMedGnrl: TLabel;
      lblCant: TLabel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      dbeItem: TwwDBEdit;
      dbeArti: TwwDBEdit;
      dbcldArti: TwwDBLookupComboDlg;
      dbeCantidadU: TwwDBEdit;
      stxTitulo2: TPanel;
      dblcConcAlm: TwwDBLookupCombo;
      dbePrecioG: TwwDBEdit;
      dbeCantidadG: TwwDBEdit;
      dbePrecioU: TwwDBEdit;
      edtConcAlm: TEdit;
      dbeNumNISA: TwwDBEdit;
      lblMarca: TLabel;
      lblModelo: TLabel;
      lblColor: TLabel;
      bbtnDetxOC: TBitBtn;
      bbtnRecalSld: TBitBtn;
      bbtnDetxTransf: TBitBtn;
      Button1: TButton;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;

      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormCreate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure Z2bbtnBorrarClick(Sender: TObject);
      Procedure Z2bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure Z2dbgDReqsIButtonClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure dbgDKDXKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure dbgDKDXDblClick(Sender: TObject);
      Procedure dbeNumNISAExit(Sender: TObject);
      Procedure dbmObsKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcExist(Sender: TObject);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcdCCChange(Sender: TObject);
      Procedure Z2bbtnSOCOKClick(Sender: TObject);
      Procedure Z2bbtnSOCCAClick(Sender: TObject);
      Procedure btnOCClick(Sender: TObject);
      Procedure Z2bbtnSOCOK1Click(Sender: TObject);
      Procedure Z2bbtnSOCCA1Click(Sender: TObject);
      Procedure dbgOrdCompDblClick(Sender: TObject);
      Procedure Z2bbtnOAOKClick(Sender: TObject);
      Procedure Z2bbtnAceptarClick(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure dblcdProvEnter(Sender: TObject);
      Procedure dbdtpFNSExit(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure dblcTDAExit(Sender: TObject);
      Procedure dblcTransacExit(Sender: TObject);
      Procedure dblcdTDOCExit(Sender: TObject);
      Procedure dbcldArtiExit(Sender: TObject);
      Procedure dblcdSODCExit(Sender: TObject);
      Procedure stxTitulo2Exit(Sender: TObject);
      Procedure dblcConcAlmExit(Sender: TObject);
      Procedure dbgOrdCompIbtnClick(Sender: TObject);
      Procedure z2bbtnOkNIOCClick(Sender: TObject);
      Procedure z2bbtnCancNIOCClick(Sender: TObject);
      Procedure dbePrecioUExit(Sender: TObject);
      Procedure dbePrecioGExit(Sender: TObject);
      Procedure dbePrecioGEnter(Sender: TObject);
      Procedure dbeNDocExit(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure dbgNIxOCDblClick(Sender: TObject);
      Procedure dbgOrdCompKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure dblcTALMEnter(Sender: TObject);
      Procedure dblcLOCEnter(Sender: TObject);
      Procedure dblcdCCExit(Sender: TObject);
      Procedure dblcTMonedaNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcTransacEnter(Sender: TObject);
      Procedure dblcTINEnter(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
      Procedure Z2bbtnPrintClick(Sender: TObject);
      Procedure pprNiaEntPreviewFormCreate(Sender: TObject);
      Procedure pprNiaEntBeforePrint(Sender: TObject);
      Procedure dblcdNSalDropDown(Sender: TObject);
      Procedure dblcdClieEnter(Sender: TObject);
   // Inicio HPC_201801_ALM
   // Cambio de Búsqueda en Maestro de Clientes
   //   Procedure dblcdClieExit(Sender: TObject);
   // Fin HPC_201801_ALM
      Procedure dblcdPedidoExit(Sender: TObject);
      Procedure dblcdGuiaExit(Sender: TObject);
      Procedure dblcdNSalExit(Sender: TObject);
      Procedure dbeCantidadGExit(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure dbeNumNISAKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnCancelSerieClick(Sender: TObject);
      Procedure bbtnKDXSerieClick(Sender: TObject);
      Procedure bbtnOKSerieClick(Sender: TObject);
      Procedure bbtnLoteClick(Sender: TObject);
      Procedure bbtnCodBarClick(Sender: TObject);
      Procedure bbtnMarcaClick(Sender: TObject);
      Procedure bbntnCancelLoteClick(Sender: TObject);
      Procedure bbtnDetxOCClick(Sender: TObject);
      Procedure bbtnRecalSldClick(Sender: TObject);
      Procedure bbtnDetxTransfClick(Sender: TObject);
      Procedure Button1Click(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
   { Private declarations }
      bIngIGV, xReqProveed, xReqCCosto, xReqOCompra, xReqNSalida, xNSalxDevPed, xReqCodCliente, xPermiteValorCero,
         xIndicaSalxConsig, xIndicaIngxDevoluc: Boolean;
      wCuenta, wTricvtas, wTriTMov: String;
      wPrecioTemp, wODCIDs, xArtDes, strTmp: String;
      iEstado, SelectOC: Integer;
      vValida, xCrea, wFlagIns: bool; { xCrea para flajear la salida } { vValida false = dentro del rango; true = fuera del rango }

      Procedure CargaDataSource;
      Procedure AsigDat;
      Procedure dcTDA;
      Procedure OnOffDetalle(Value: Boolean);
      Procedure OnOffCabecera(Value: Boolean);
      Procedure btnDetalle;
      Procedure lblEstado;
      Function EHandlerError(Ex: Exception): Boolean;
      Procedure Init(Sender: TObject);
      Procedure nOrds;
      Procedure dsOCNIADataChange(Sender: TObject; Field: TField);
      Procedure ConfiguraNota(Sender: TObject);
      Procedure Ir_a_Foco;
      Procedure ValidarFecha;
      Procedure NuevaFecha;
      Function VerificaNumerodeSerie: boolean;
      Procedure InsertaNumerosdeSerie;
      Function VeriFicaSerieDuplicados: boolean;
      Function VeriFicaBarraDuplicados: boolean;
      Procedure ChequeaSerieCodBar;
      Function RoundD(x: Double; D: Integer): Double;
      Procedure ELiminarNI;
      Procedure GrabaSerie;
   Public
   { Public declarations }
      wOperacion, wRegraNro, wSerieCodBar, wDupErrorSer, wDupErrorBar: String;
      wODCTcambio: Integer;
      xDias: integer;
      Procedure Adiciona;
      Procedure Edita;
   End;

Var
   FRegNtaE: TFRegNtaE;
   xNIngElim: String;
   SQLFiltro: String;

Implementation

Uses ALMDM1, ALM207, oaIN3000;

{$R *.DFM}

Procedure TFRegNtaE.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TDBMemo Then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRegNtaE.CargaDataSource;
Begin
   dbgDKDX.DataSource := DMALM.dsKDX;

// Compañía
   dblcCIA.DataSource := DMALM.dsNIA;
   dblcCIA.LookupTable := DMALM.cdsCIA;

// Localidad
   dblcLOC.DataSource := DMALM.dsNIA;
   dblcLOC.LookupTable := DMALM.cdsLOC;

// Tipo de Inventario
   dblcTIN.DataSource := DMALM.dsNIA;
   dblcTIN.LookupTable := DMALM.cdsTINID;

// Almacén
   dblcTALM.DataSource := DMALM.dsNIA;
   dblcTALM.LookupTable := DMALM.cdsALM;

// Tipo de Documento de Almacén
   dblcTDA.DataSource := DMALM.dsNIA;
   dblcTDA.LookupTable := DMALM.cdsTDNISA;

// Fecha de Nota de Ingreso
   dbdtpFNS.DataSource := DMALM.dsNIA;

// Transacción
   dblcTransac.DataSource := DMALM.dsNIA;
   dblcTransac.LookupTable := DMALM.cdsTRAN;

// Número de Nota de Ingreso
   dbeNumNISA.DataSource := DMALM.dsNIA;

// Centro de Costos
   dblcdCC.DataSource := DMALM.dsNIA;
   dblcdCC.LookupTable := DMALM.cdsCCost;

// Proveedor
   dblcdProv.DataSource := DMALM.dsNIA;
   dblcdProv.LookupTable := DMALM.cdsProv;

// Cliente
   dblcdClie.DataSource := DMALM.dsNIA;
   dblcdClie.LookupTable := DMALM.cdsClient;

   dblcdSODC.LookupTable := DMALM.cdsOrdComp;

// Tipo de Documento de Referencia
   dblcdTDOC.DataSource := DMALM.dsNIA;
   dblcdTDOC.LookupTable := DMALM.cdsTDOC;
// Número de Documento de Referencia
   dbeNDoc.DataSource := DMALM.dsNIA;
// Fecha del Documento de Referencia
   dbdtpFDoc.DataSource := DMALM.dsNIA;

// Observaciones
   dbmObs.DataSource := DMALM.dsNIA;

// Número de Pedido
   dblcdPedido.DataSource := DMALM.dsNIA;
   dblcdPedido.LookupTable := DMALM.cdsMovFac;
   dbeNP.DataSource := DMALM.dsNIA;

// Packwet Order
   dbePO.DataSource := DMALM.dsNIA;

// Guía de Remisión / Nota de Salida
   dblcdGuia.DataSource := DMALM.dsNIA;
   dblcdGuia.LookupTable := DMALM.cdsGuia;
   dblcdNSal.DataSource := DMALM.dsNIA;
   dblcdNSal.LookupTable := DMALM.cdsParaRepo;

// Lote
   dbeLote.DataSource := DMALM.dsNIA;
   dtpFecLote.DataSource := DMALM.dsNIA;
   dbeLote1.DataSource := DMALM.dsNIA;
   dbgGridSerie.DataSource := DMALM.dsKDXSerie;

// Artículo de Almacén
   dbcldArti.LookupTable := DMALM.cdsArti;

{
// Motivo / Concepto de Nota de Salida
   dblcConcAlm.LookupTable := DMALM.cdsConceptoAlm;
}

   dblcdProv.Selected.Clear;
   dblcdProv.Selected.Add('PROV'#9'8'#9'ID'#9'T');
   dblcdProv.Selected.Add('PROVDES'#9'40'#9'Proveedor'#9'T');
   dblcdProv.Selected.Add('CLAUXID'#9'8'#9'Auxiliar'#9'T');
End;

Procedure TFRegNtaE.FormCreate(Sender: TObject);
Begin
   CargaDataSource;
   dbcldArti.OnNotInList := dblcNotInList;
   dblcdCC.OnNotInList := dblcNotInList;
   dblcdTDOC.OnNotInList := dblcNotInList;
   dblcdProv.OnNotInList := dblcNotInList;
   DMALM.dsOCNIA.OnDataChange := dsOCNIADataChange; // Establecer el filtro...
// Selección de Ordenes de compra G
   pnlOC.Left := 171;
   pnlOC.Top := 229;
// Selección de Ordenes de compra P
   pnlSELOC.Left := 199;
   pnlSELOC.Top := 370;
// Detalle de Artículos
   pnlDetalleA.Left := 103;
   pnlDetalleA.Top := 344;
   dbdtpFNS.Date := Date;
End;

Procedure TFRegNtaE.FormShow(Sender: TObject);
Var
   xsql, sSQL, sProv, sTrans: String;
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
   If DMALM.wModo = 'A' Then
      wOperacion := 'ADD'
   Else
      If DMALM.wModo = 'M' Then
         wOperacion := 'MOD';

   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

   dblcdTDOC.enabled := True;
   dbeNDoc.enabled := True;
   dbdtpFDoc.enabled := True;
   dblcdProv.enabled := True;
   dblcdClie.enabled := True;

   bIngIGV := False;
   xReqCCosto := False;
   xReqProveed := False;
   xReqOCompra := False;
   xReqNSalida := False;
   xNSalxDevPed := False;
   xReqCodCliente := False;
   xPermiteValorCero := False;
   xIndicaSalxConsig := False;
   xIndicaIngxDevoluc := False;

   wCuenta := '';
   wTricvtas := '';
   wTriTMov := '';

   xCrea := true;
   xNIngElim := '';
   xSQL := 'Select CCOSID, CCOSDES, CCOSABR, CCOSNIV, CUENTAID, CCOSMOV, CCOSCIAS, '
      + '          CCOSLOCS, CCOSACT, CIADEST, GRUCENCOS, BAZCIA, BAZCTA, TRABIDRESP, '
      + '          CUENTAID_RND '
      + '     from TGE203 '
      + '    where nvl(CCOSACT,''S'')=''S'' and CCOSMOV=''S'' ';
   DMALM.cdsCCost.Close;
   DMALM.cdsCCost.DataRequest(xsql);
   DMALM.cdsCCost.open;

   pnlNIxOC.Visible := false;
   pnlOC.Visible := false;
   pnlDetalleA.Visible := false;
   pnlActuali.Visible := false;
   pnlSELOC.Visible := false;
   edNOrdC.Text := '';
   bbtnLote.visible := (DMALM.wLote = 'S');
   bbtnKDXSerie.visible := (DMALM.wKDXSerie = 'S');

   If wOperacion = 'ADD' Then
   Begin
      lblEstado1.Caption := 'INICIAL';
      DMALM.cdsNIA.FieldByName('NISSIT').AsString := 'INICIAL';
      DMALM.cdsNIA.FieldByName('NISATIP').AsString := 'INGRESO';
   End;

   If (DMALM.cdsNia.FieldByName('NISSIT').AsString <> 'INICIAL') Then
   Begin
      Z2dbgDReqsIButton.Enabled := False;
      OnOffCabecera(False); //Activar la cabecera
      OnOffDetalle(False); //Desactivar el panel de detalle
      nOrds; // Jala las O. de Compra
      Z2bbtnRegresa.Enabled := False;
      Z2bbtnAceptar.Enabled := False;
   End
   Else
   Begin
      Init(Sender);
      Z2dbgDReqsIButton.Enabled := True;
   End;

   sProv := dblcdProv.text;
   sTrans := dblcTransac.text;

   If DMALM.cdsNIA.State In [dsEdit] Then
   Begin
      dblcTransac.OnExit(dblcTransac);

      dblcdTDOC.OnExit(dblcdTDOC);

      If ((Not xNSalxDevPed) And (Not xReqCodCliente)) Then
         dblcdProvExit(Nil)
      Else
   // Inicio HPC_201801_ALM
   // Cambio de búsqueda del código de Cliente
      Begin
      //   dblcdClieExit(Nil);
         xSQL := 'Select CLIEID, CLIEDES '
            + '     from DB2ADMIN.TGE204 '
            + '    where CLAUXID='+quotedstr(DMALM.cdsNIA.FieldByName('CLAUXID').AsString)
            + '      and CLIEID='+quotedstr(DMALM.cdsNIA.FieldByName('CLIEID').AsString);
         DMALM.cdsQry.Close;
         DMALM.cdsQry.DataRequest(xsql);
         DMALM.cdsQry.Open;
         If DMALM.cdsQry.RecordCount>0 Then
         Begin
            dblcdClie.Text := DMALM.cdsQry.FieldByName('CLIEID').AsString;
            dbeClie.Text := DMALM.cdsQry.FieldByName('CLIEDES').AsString;
         End;
      End;
   // Fin HPC_201801_ALM

      dblcdCCExit(Nil);
   End
   Else
   Begin
      dbeLOC.Text := '';
      dbeALM.Text := '';
      dbeTIN.Text := '';
      dbeTDNISA.Text := '';
      dbeTransac.Text := '';
      dbeTDOC.Text := '';
      dbeProv.Text := '';
      dbeCC.text := '';
      dbeClie.text := '';

      If wOperacion = 'ADD' Then
      Begin
         DMALM.cdsNia.FieldByName('CIAID').AsString := xCia;
         DMALM.cdsNia.FieldByName('LOCID').AsString := xLoc;
         DMALM.cdsNia.FieldByName('TINID').AsString := xTin;
         DMALM.cdsNia.FieldByName('ALMID').AsString := xAlm;
      End;
   End;

   dblcCIAExit(Nil);
   dblcLOCExit(Nil);
   dblcTINExit(Nil);
   dblcTALMExit(Nil);
   dblcTDAExit(Nil);

//   If DMALM.cdsNIA.State In [dsInsert] Then
   If DMALM.wModo = 'A' Then
      Ir_a_Foco;
   vValida := false; {por defecto}
   If DMALM.cdsNIA.State In [dsEdit] Then
   Begin
      If Length(Trim(DMALM.cdsNIA.FieldByName('NISAORIID').AsString)) > 0 Then
      Begin
         dblcdTDOC.enabled := False;
         dbeNDoc.enabled := False;
         dbdtpFDoc.enabled := False;
         dblcdProv.enabled := False;
         dblcdClie.enabled := False;
      End
      Else
         If Length(Trim(edNOrdC.Text)) > 0 Then
         Begin
            sSQL := 'SELECT LOG304.* '
               + '     FROM LOG304 '
               + '    WHERE CIAID=' + quotedstr(DMALM.cdsNIA.FieldByName('CIAID').AsString)
               + '      AND (ODCEST=' + quotedstr('ACEPTADO') + ' OR ODCEST=' + quotedstr('PARCIAL') + ')'
               + '      AND (PROV=' + quotedstr(dblcdProv.Text) + ')'
               + '      AND (TIPOADQ=' + quotedstr('C') + ')';
            DMALM.cdsOrdComp.Close;
            DMALM.cdsOrdComp.DataRequest(sSQL);
            DMALM.cdsOrdComp.Open;
         End;

      If (dbdtpFNS.Enabled = true) And (pnlCabecera.Enabled = true) Then
         dbdtpFNS.SetFocus;
   End;

// Si está en Estado INICIAL, se inicializa Fecha con la Fecha del Sistema
   If DMALM.cdsNia.FieldByName('NISSIT').AsString = 'INICIAL' Then
   Begin
      DMALM.cdsNia.FieldByName('NISAFREG').AsDateTime := DateS;
      dbdtpFNS.Date := DateS;
   End;
   xCrea := false;

  //Parametro de días limite para generar una Nota de Ingreso
   xsql := 'Select VALPARAM from ALM_PARAM_NOTING where CODPARAM=''001'' ';
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xsql);
   DMALM.cdsQry.Open;
   xDias := StrToInt(DMALM.cdsQry.FieldbyName('VALPARAM').AsString);
End;

Procedure TFRegNtaE.dblcCIAExit(Sender: TObject);
Var
   xSQL, sNUM, sCIA, sTIN, sALM, sTDA, sLOC: String;
Begin
   sCIA := dblcCIA.Text;
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(sCIA), 'CIADES');


   FiltraTabla(DMALM.cdsLOC, 'TGE126', 'LOCID', 'LOCID', 'CIAID='+quotedstr(dblcCIA.Text));
{
   xSQL := 'Select CIAID, LOCID, LOCDES, LOCABR, DIRECCION, TELEFONO '
      + '     from TGE126 '
      + '    where CIAID=' + quotedstr(dblcCIA.text);
   DMALM.cdsLOC.Close;
   DMALM.cdsLOC.DataRequest(xSQL);
   DMALM.cdsLOC.open;
}
   If Not showing Then Exit;
   If (DMALM.wModo <> 'A') and (DMALM.wModo <> 'M') Then exit;
//   If Not (DMALM.cdsNIA.State In [dsInsert, dsEdit]) Then exit;

   sTDA := dblcTDA.Text;
   sLOC := dblcLOC.Text;
   sALM := dblcTALM.Text;
   sTIN := dblcTIN.Text;
   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sLOC = '') Or (sTIN = '') Then
      Exit;

   If DMALM.wModo = 'A' Then
//   If DMALM.cdsNIA.State In [dsInsert] Then
   Begin
      sNUM := '';
      DMALM.cdsNIA.FieldByName('NISAID').AsString := sNUM;
      dbeNumNISA.Text := sNUM;
   End
   Else
   Begin
      sNUM := DMALM.cdsNIA.FieldByName('NISAID').AsString;
      dbeNumNISA.Text := sNUM;
   End;
End;

Procedure TFRegNtaE.dblcLOCEnter(Sender: TObject);
Begin
   If dblcCIA.Text = '' Then
   Begin
      If dblcCIA.Enabled Then
         dblcCIA.SetFocus
      Else
      Begin
         ShowMessage('Falta el valor de la Compañía');
         dblcLOC.SetFocus;
      End;
   End;
End;

Procedure TFRegNtaE.dblcLOCExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeLoc.Text := DMALM.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', xSQL, 'LOCDES');

// Tipos de Inventario
   FiltraTabla(DMALM.cdsTINID, 'TGE152', 'TINID', 'TINID', 'CIAID='+quotedstr(dblcCIA.Text));
{

   xSQL := 'Select CIAID, TINID, TINDES, TINABR, CUENTAID, TINUSU, TINVENTAS, '
      + '          TINOC, TINNI, TINNS, HABILITADO, CODINVDEF '
      + '     from TGE152 '
      + '    where CIAID=' + quotedstr(dblcCIA.text);
   DMALM.cdsTINID.Close;
   DMALM.cdsTINID.DataRequest(xSQL);
   DMALM.cdsTINID.open;
}
End;

Procedure TFRegNtaE.dblcTINEnter(Sender: TObject);
Begin
   If dblcLOC.Text = '' Then
   Begin
      If dblcLOC.Enabled Then
         dblcLOC.SetFocus
      Else
      Begin
         ShowMessage('Falta el valor de la Localidad ');
         dblcLOC.SetFocus;
      End;
   End;
End;

Procedure TFRegNtaE.dblcTINExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If (Length(trim(dblcTIN.Text)) > 0) And (Not DMALM.VerificaTipInventario(dblcCIA.Text, dblcTIN.Text)) Then
   Begin
      ErrorMsg('Inventarios', 'El Tipo de Inventario ' + trim(dblcTIN.Text) + ' está DESHABILITADO..');
      dblcTIN.Text := '';
      dbeTIN.Text := '';
      dblcTIN.SetFocus;
      exit;
   End;

   xSQL := 'TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeTIN.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text)
      + ' AND LOCID=' + quotedstr(dblcLOC.text)
      + ' AND TINID=' + quotedstr(dblcTIN.text)
      + ' AND NVL(ACTIVO,''S'')=''S'' ';

// Almacenes
   FiltraTabla(DMALM.cdsALM, 'TGE151', 'ALMID', 'ALMID', xSQL);
End;

Procedure TFRegNtaE.dblcTALMEnter(Sender: TObject);
Begin
   If dblcTIn.Text = '' Then
   Begin
      If dblcTIn.Enabled Then
         dblcTIn.SetFocus
      Else
      Begin
         ShowMessage('Falta el valor del Tipo de Inventario ');
         dblcTIn.SetFocus;
      End;
   End;
End;

Procedure TFRegNtaE.dblcTDAExit(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTIN, sLOC, sTDA, sSQL: String;
Begin
   If Not Visible Then
      Exit;
   sCIA := dblcCIA.Text;
   sALM := dblcTALM.Text;
   sTDA := dblcTDA.Text;
   sLOC := dblcLOC.Text;
   sTIN := dblcTIN.Text;

   If (trim(sCIA) = '') Or (trim(sALM) = '') Or (trim(sTDA) = '') Or (trim(sLOC) = '') Then
   Begin
      Exit;
   End;
   sSQL := 'TDAID=' + quotedstr(dblcTDA.text) + ' AND TDATIP=''INGRESO''';

// TGE157 Tipos de Documentos de Nota de Ingreso
   dbeTDNISA.text := DMALM.DisplayDescrip('prvTGE', 'TGE157', 'TDADES', sSQL, 'TDADES');
   If DMALM.wModo = 'A' Then
//   If (DMALM.cdsNIA.State In [dsInsert]) Then
   Begin
      sNUM := '';
      DMALM.cdsNIA.FieldByName('NISAID').AsString := sNUM;
      dbeNumNISA.text := sNUM;
      dbeCC.Clear;
      dbeProv.Clear;
      dblcdCC.Clear;
      dblcdProv.Clear;
      dblcTransac.Clear;
   End;

   If DMALM.wModo = 'A' Then
//   If DMALM.cdsNIA.State In [dsInsert] Then
   Begin
      DMALM.cdsNIA.FieldByName('PROV').Clear;
      DMALM.cdsNIA.FieldByName('TRIID').Clear;
      DMALM.cdsNIA.FieldByName('CCOSID').Clear;
      dbeTransac.Text := '';
      dbeCC.Text := '';
      dbeProv.Text := '';
   End;

// Selecciona los diferentes Tipos de Transacciones de Ingresos
   sSQL := 'Select TRIID, TRIDES, TRIABR, TRISGT, TRIRQM, TRIRQD, TRIVLD, '
      + '          TRIPRCL, TRITRRS, TRISTAT, TDAID, TRICC, TRIPV, TRIOC, '
      + '          TRITMOV, TRITRDES, TRITDODES, CUENTAID, TRICVTAS, '
      + '          TRIFLAGV, TRICERO, TRINSAL, TRIDEVPED, TRIGENFACT, '
      + '          TRICONSIG, TRICLIEN, TRIASIEN, TRINCRE, TRITITGRAT, '
      + '          TRIPREP, TRIDEVFACT, TRICONSUMO, TRINSERIE, TRIINGDEV, '
      + '          TRITRANSEQ, TRIEQUI, TRIDEVCSG, TRIACTURQ, TRICOSREPO, '
      + '          CTADEBE, CTAHABER, ACTCOSPRO '
      + '     from TGE208 '
      + '    where TRISGT=''I'' ';
   DMALM.cdsTRAN.Close;
   DMALM.cdsTRAN.DataRequest(sSQL);
   DMALM.cdsTRAN.Open;
End;

Procedure TFRegNtaE.dbdtpFNSExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If dbdtpFNS.date = 0 Then
      dbdtpFNS.date := date;
   If xCrea <> true Then
      ValidarFecha;
   If vValida Then
   Begin
      dbdtpFNS.SetFocus;
      exit;
   End;

   If dbdtpFNS.Date < StrToDate(DateToStr((DateS - xDias))) Then
   Begin
      ShowMessage('No se permite registrar Fecha de Nota de Ingreso menor a ' + inttostr(xDias) + ' día(s) de anterioridad');
      dbdtpFNS.SetFocus;
      exit;
   End;

   xWhere := 'TMONID=' + quotedstr(DMALM.wTMonExt)
      + ' and FECHA=' + DMALM.wRepFuncDate + '''' + FormatDateTime(DMALM.wFormatFecha, dbdtpFNS.Date) + '''' + ')';
   If length(DMALM.DisplayDescrip('PrvTGE', 'TGE107', '*', xWhere, 'TMONID')) > 0 Then
   Begin
      dbeTCambio.Text := DMALM.cdsQry.fieldbyname('TCAM' + DMALM.wTipoCambioUsar).AsString;
   End
   Else
   Begin
      ShowMessage(' Fecha NO TIENE Tipo de Cambio para la Moneda seleccionada');
      dbdtpFNS.SetFocus;
      exit;
   End;

End;

Procedure TFRegNtaE.dblcTransacEnter(Sender: TObject);
Var
   xSQL: String;
Begin
   If dblcTDA.Text = '' Then
      dblcTDA.SetFocus;

   If Not DMALM.cdsTRAN.Active Then
   Begin
   // Selecciona los diferentes Tipos de Transacciones de Ingresos
      xSQL := 'Select TRIID, TRIDES, TRIABR, TRISGT, TRIRQM, TRIRQD, TRIVLD, '
         + '          TRIPRCL, TRITRRS, TRISTAT, TDAID, TRICC, TRIPV, TRIOC, '
         + '          TRITMOV, TRITRDES, TRITDODES, CUENTAID, TRICVTAS, '
         + '          TRIFLAGV, TRICERO, TRINSAL, TRIDEVPED, TRIGENFACT, '
         + '          TRICONSIG, TRICLIEN, TRIASIEN, TRINCRE, TRITITGRAT, '
         + '          TRIPREP, TRIDEVFACT, TRICONSUMO, TRINSERIE, TRIINGDEV, '
         + '          TRITRANSEQ, TRIEQUI, TRIDEVCSG, TRIACTURQ, TRICOSREPO, '
         + '          CTADEBE, CTAHABER, ACTCOSPRO '
         + '     from TGE208 '
         + '    where TRISGT=''I'' ';
      DMALM.cdsTRAN.Close;
      DMALM.cdsTRAN.DataRequest(xSQL);
      DMALM.cdsTRAN.Open;
   End;
End;

Procedure TFRegNtaE.dblcTransacExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If (DMALM.wModo = 'A') and (dblcTransac.Text='07') Then
   Begin
      ShowMessage('No se puede iniciar una Transferencia con una Nota de Ingreso');
      dblcTransac.SetFocus;
      Exit;
   End;

   xSQL := 'TRIID=' + quotedstr(dblcTransac.Text) + ' AND TRISGT=''I''';
   dbeTransac.Text := DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRIDES', xSQL, 'TRIDES');
   If dbeTransac.text <> '' Then
      ConfiguraNota(Nil);
End;

Procedure TFRegNtaE.dbeNumNISAKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In [' ',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '.', '-', '_'] Then
      Key := #0;
End;

Procedure TFRegNtaE.dbeNumNISAExit(Sender: TObject);
Var
   iVal, iCod: Integer;
   sNUM, sCIA, sALM, sTDA, sLOC, sTIN, sTIP: String;
Begin
   If wRegraNro = '1MOD' Then
      Exit;

   Val(dbeNumNISA.Text, iVal, iCod);

   sCIA := DMALM.cdsNIA.FieldByName('CIAID').AsString;
   sALM := DMALM.cdsNIA.FieldByName('ALMID').AsString;
   sTDA := DMALM.cdsNIA.FieldByName('TDAID').AsString;
   sLOC := DMALM.cdsNIA.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIA.FieldByName('TINID').AsString;
   sNUM := DMALM.cdsNIA.FieldByName('NISAID').AsString;
   sTIP := 'INGRESO';

   If (DMALM.IsExistNISA(sCIA, sALM, sTIP, sNUM, )) Then
   Begin
      ErrorMsg('Error', 'Ya existe una nota de ingreso' + #13 +
         'con el mismo número ... ' + sNUM);
      sNUM := DMALM.StrZero(DMALM.MaxNIA(sCIA, sALM), wAnchoIng);
      DMALM.cdsNIA.FieldByName('NISAID').AsString := sNUM;
   End
End;

Procedure TFRegNtaE.dblcdCCExit(Sender: TObject);
Var
   sSQL: String;
Begin
   dbeCC.text := DMALM.DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', 'CCOSID=' + quotedstr(dblcdCC.text), 'CCOSDES');
   sSQL := 'Select NISAID, NISAFREG FROM LOG314 '
      + '    where CIAID=' + QuotedStr(dblcCIA.text)
      + '      and LOCID=' + QuotedStr(dblcLOC.text)
      + '      and TINID=' + QuotedStr(dblcTIN.text)
      + '      and ALMID=' + QuotedStr(dblcTALM.text)
      + '      and NISATIP=''SALIDA'' '
      + '      and CCOSID=' + QuotedStr(dblcdCC.Text)
      + '      and NISSIT=''ACEPTADO'' '
      + '    order by NISAID';
   DMALM.cdsParaRepo.Close;
   DMALM.cdsParaRepo.DataRequest(sSQL);
   DMALM.cdsParaRepo.Open;
End;

Procedure TFRegNtaE.dblcdProvEnter(Sender: TObject);
Begin
   strTmp := TCustomEdit(Sender).Text;
End;

Procedure TFRegNtaE.dblcdProvExit(Sender: TObject);
Var
   xSQL, sSQL, sCIA, sALM, sTDA, sPRV, sclPRV: String;
   xsCodigoProv, xsTipoAuxiliar: String;
Begin
   If Z2bbtnBorrar.Focused Then exit;
   DMALM.cdsNia.FieldByName('CLAUXID').AsString := DMALM.cdsProv.FieldByName('CLAUXID').AsString;
   dbeProv.text := DMALM.cdsProv.FieldByName('PROVDES').asString;

   xsCodigoProv := DMALM.cdsNia.FieldByName('PROV').AsString;
   xsTipoAuxiliar := DMALM.cdsNia.FieldByName('CLAUXID').AsString;
   If Length(Trim(xsTipoAuxiliar)) = 0 Then xsTipoAuxiliar := 'P';
   DMALM.cdsProv.Locate('PROV;CLAUXID', VarArrayOf([xsCodigoProv, xsTipoAuxiliar]), []);
   dbeProv.text := DMALM.cdsProv.FieldByName('PROVDES').asString;
   sclPRV := DMALM.cdsProv.FieldByName('CLAUXID').asString;
   If DMALM.cdsNia.FieldByName('NISSIT').AsString = 'INICIAL' Then
   Begin
      DMALM.cdsNia.FieldByName('CLAUXID').AsString := xsTipoAuxiliar;
   End;
   If (DMALM.cdsNia.FieldByName('NISSIT').AsString = 'ACEPTADO') Or
      (DMALM.cdsNia.FieldByName('NISSIT').AsString = 'ANULADO') Then
      Exit;
   If (dblcTransac.Focused) Or (dbdtpFNS.focused) Or (dblcTDA.focused)
      Or (dblcTALM.Focused) Or (dblcLOC.Focused) Or (dblcCIA.Focused) Then
   Begin
      dblcdProv.text := '';
      dbeProv.text := '';
      exit;
   End;
   If Not (xReqCCosto) And Not (xNSalxDevPed) And (xReqProveed) Then
   Begin
      If (length(dblcdProv.Text) = 0) Then
      Begin
         ErrorMsg(Caption, ' Falta el Proveedor ');
         exit;
      End;
      dbeProv.text := DMALM.DisplayDescrip('prvTGE', 'TGE201', 'PROVDES', 'PROV=' + quotedstr(dblcdProv.text) + ' AND  CLAUXID = ' + QuotedStr(sclPRV), 'PROVDES');
      If Length(Trim(dbeProv.text)) = 0 Then
      Begin
         ErrorMsg(Caption, ' Proveedor no Existe ');
         Exit;
      End;
   End;
 // aqui se debe colocar el filtro de las ordenes de compra para cada proveedor
 // !!! al cambiar de proveedor las ordenes de compra se eliminan tener cuidado
 //-----------------------------------------------------------------------------
   sCIA := dblcCIA.Text;
   sALM := dblcTALM.Text;
   sTDA := dblcTDA.Text;
   sPRV := dblcdProv.Text;
   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sPRV = '') Then
      Exit;

   If xReqOCompra Then
   Begin
      sSQL := 'Select LOG304.* '
         + '     from LOG304 '
         + '    where CIAID=' + quotedstr(sCIA)
         + '      and (ODCEST=' + quotedstr('ACEPTADO') + ' OR ODCEST=' + quotedstr('PARCIAL') + ')'
         + '      and (PROV=' + quotedstr(dblcdProv.Text) + ')'
         + '      and (TIPOADQ IN (' + quotedstr('C') + ',' + quotedstr('A') + '))'
         + '      and (CLAUXID = ' + Quotedstr(xsTipoAuxiliar) + ')';
      DMALM.cdsOrdComp.Close;
      DMALM.cdsOrdComp.DataRequest(sSQL);
      DMALM.cdsOrdComp.Open;

      If wOperacion <> 'MOD' Then
      Begin
         If DMALM.cdsOrdComp.IsEmpty Then
         Begin
            ErrorMsg('Error', 'No existen Ordenes de Compra registradas con el Proveedor' + #13
               + '        ' + dbeProv.Text + '...');
            DMALM.cdsNIA.FieldByName('PROV').Clear;
            dblcdProv.Clear;
            dbeProv.Clear;
            lblNOC.Enabled := False;
            btnOC.Enabled := False;
            edNOrdC.Enabled := False;
            TCustomEdit(Sender).SetFocus;
            Exit;
         End;
      End;

        If DMALM.wModo = 'A' Then
//      If DMALM.cdsNIA.State In [dsInsert] Then
      Begin
         xSQL := ' Select * '
            + '      from LOG318 '
            + '     where CIAID =''' + DMALM.cdsNIA.FieldByName('CIAID').AsString + ''''
            + '       and LOCID =''' + DMALM.cdsNIA.FieldByName('LOCID').AsString + ''''
            + '       and TINID =''' + DMALM.cdsNIA.FieldByName('TINID').AsString + ''''
            + '       and ALMID =''' + DMALM.cdsNIA.FieldByName('ALMID').AsString + ''''
            + '       and TDAID =''' + DMALM.cdsNIA.FieldByName('TDAID').AsString + ''''
            + '       and NISAID=''' + DMALM.cdsNIA.FieldByName('NISAID').AsString + ''' '
            + '     order by ODCID';
         DMALM.cdsOCNIA.Close;
         DMALM.cdsOCNIA.DataRequest(xSQL);
         DMALM.cdsOCNIA.Open;
      End;
      lblNOC.Enabled := True;
      btnOC.Enabled := True;
   End
   Else
   Begin
      sSQL := 'Select LOG304.* '
         + '     from LOG304 '
         + '    where CIAID=' + quotedstr(sCIA)
         + '      and (ODCEST=' + quotedstr('ATENDIDO')
         + '        or ODCEST=' + quotedstr('PARCIAL')
         + '        or ODCEST=' + quotedstr('INICIAL')
         + '        or ODCEST=' + quotedstr('ACEPTADO') + ')'
         + '      and (PROV='''')'
         + '      and (TIPOADQ=' + QuotedStr('C') + ')';
      DMALM.cdsOrdComp.Close;
      DMALM.cdsOrdComp.DataRequest(sSQL);
      DMALM.cdsOrdComp.Open;
   End;

End;

// Inicio HPC_201801_ALM
// Cambio de Búsqueda en Maestro de Clientes
Procedure TFRegNtaE.dblcdClieEnter(Sender: TObject);
Begin
//   strTmp := TCustomEdit(Sender).Text;
   dbeClie.Enabled := False;
   dblcdClie.ReadOnly := True;
   FRegistros.BuscaMaeClientes;
End;
// Fin HPC_201801_ALM

// Inicio HPC_201801_ALM
// Cambio de Búsqueda en Maestro de Clientes
(*
Procedure TFRegNtaE.dblcdClieExit(Sender: TObject);
Var
   xSQL, sSQL, sCIA, sALM, sTDA, sCLI: String;
Begin
   If Z2bbtnBorrar.Focused Then exit;
   dbeClie.text := DMALM.DisplayDescrip('prvTGE', 'TGE204', 'CLIEDES', 'CLIEID=' + quotedstr(dblcdClie.text), 'CLIEDES');
   If (DMALM.cdsNia.FieldByName('NISSIT').AsString = 'ACEPTADO') Or
      (DMALM.cdsNia.FieldByName('NISSIT').AsString = 'ANULADO') Then
      Exit;
   If (dblcTransac.Focused) Or (dbdtpFNS.focused) Or (dblcTDA.focused)
      Or (dblcTALM.Focused) Or (dblcLOC.Focused) Or (dblcCIA.Focused) Then
   Begin
      dblcdClie.text := '';
      dbeClie.text := '';
      exit;
   End;

   If (length(dblcdClie.Text) = 0) Then
   Begin
      ErrorMsg(Caption, 'Falta el Cliente ');
      exit;
   End;

   dbeClie.text := DMALM.DisplayDescrip('prvTGE', 'TGE204', 'CLIEDES', 'CLIEID=' + quotedstr(dblcdClie.text), 'CLIEDES');
   If Length(Trim(dbeClie.text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' Cliente no Existe ');
      Exit;
   End;
 // aqui se debe colocar el filtro de las ordenes de compra para cada proveedor
 // !!! al cambiar de proveedor las ordenes de compra se eliminan tener cuidado
 //-----------------------------------------------------------------------------
   sCIA := dblcCIA.Text;
   sALM := dblcTALM.Text;
   sTDA := dblcTDA.Text;
   sCLI := dblcdClie.Text;
   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sCLI = '') Then
      Exit;

   If xReqOCompra Then
   Begin
      sSQL := 'Select LOG304.* '
         + '     from LOG304 '
         + '    where CIAID=' + quotedstr(sCIA)
         + '      and (ODCEST=' + quotedstr('ACEPTADO')
         + '        or ODCEST=' + quotedstr('PARCIAL') + ')'
         + '      and (PROV=' + quotedstr(dblcdProv.Text) + ')'
         + '      and (TIPOADQ=' + quotedstr('C') + ')';
      DMALM.cdsOrdComp.Close;
      DMALM.cdsOrdComp.DataRequest(sSQL);
      DMALM.cdsOrdComp.Open;

      If wOperacion <> 'MOD' Then
      Begin
         If DMALM.cdsOrdComp.IsEmpty Then
         Begin
            ErrorMsg('Error', 'No existen Ordenes de Compra registradas al Proveedor' + #13 +
               '        ' + dbeProv.Text + '...');
            DMALM.cdsNIA.FieldByName('PROV').Clear;
            dblcdProv.Clear;
            dbeProv.Clear;
            lblNOC.Enabled := False;
            btnOC.Enabled := False;
            edNOrdC.Enabled := False;
            TCustomEdit(Sender).SetFocus;
            Exit;
         End;
      End;

        If DMALM.wModo = 'A' Then
//      If DMALM.cdsNIA.State In [dsInsert] Then
      Begin
         xSQL := 'Select * FROM LOG318 '
            + '    where CIAID =''' + DMALM.cdsNIA.FieldByName('CIAID').AsString + ''''
            + '      and LOCID =''' + DMALM.cdsNIA.FieldByName('LOCID').AsString + ''''
            + '      and TINID =''' + DMALM.cdsNIA.FieldByName('TINID').AsString + ''''
            + '      and ALMID =''' + DMALM.cdsNIA.FieldByName('ALMID').AsString + ''''
            + '      and TDAID =''' + DMALM.cdsNIA.FieldByName('TDAID').AsString + ''''
            + '      and NISAID=''' + DMALM.cdsNIA.FieldByName('NISAID').AsString + ''' '
            + '    order by ODCID';
         DMALM.cdsOCNIA.Close;
         DMALM.cdsOCNIA.DataRequest(xSQL);
         DMALM.cdsOCNIA.Open;
      End;
      lblNOC.Enabled := True;
      btnOC.Enabled := True;
   End
   Else
   Begin
      sSQL := 'SELECT LOG304.* '
         + '     FROM LOG304 '
         + '    WHERE CIAID=' + quotedstr(sCIA)
         + '      AND (ODCEST=' + quotedstr('ATENDIDO') + ' OR ODCEST=' + quotedstr('PARCIAL') + ' OR ODCEST=' + quotedstr('INICIAL') + ' OR ODCEST=' + quotedstr('ACEPTADO') + ')'
         + '      AND (PROV='''')'
         + '      AND (TIPOADQ=' + quotedstr('C') + ')';
      DMALM.cdsOrdComp.Close;
      DMALM.cdsOrdComp.DataRequest(sSQL);
      DMALM.cdsOrdComp.Open;
   End;

   If xNSalxDevPed Then
   Begin
      sSQL := 'Select PEDIDO, PEDFECHA '
         + '     from FAC301 '
         + '    where CIAID=' + QuotedStr(dblcCIA.text)
         + '      and LOCID=' + QuotedStr(dblcLOC.text)
         + '      and ALMID=' + QuotedStr(dblcTALM.text)
         + '      and CLIEID=' + QuotedStr(dblcdClie.text)
         + '      and (PEDESTADO=''FACTURADO'' or PEDESTADO=''GUIADO'')';
      If (xIndicaSalxConsig) Then
         sSQL := sSQL + ' and TRIID=' + Quotedstr(DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRIID', 'TRISGT=''S'' AND TRICONSIG=''S'' ', 'TRIID'));

      DMALM.cdsMovFac.Close;
      DMALM.cdsMovFac.DataRequest(sSQL);
      DMALM.cdsMovFac.Open;
   End;
End;
*)
// Fin HPC_201801_ALM

Procedure TFRegNtaE.btnOCClick(Sender: TObject);
Begin
   If dbeProv.Text = '' Then
      Exit;
   Screen.Cursor := crHourGlass;
   pnlCabecera.Enabled := False;
   pnlControl.Enabled := False;
   pnlDetalleG.Enabled := False;
   dbgOrdComp.DataSource := DMALM.dsOCNIA;
   pnlOC.enabled := true;
   pnlOC.Visible := True;
   pnlOC.BringToFront;
   dbgOrdCompIbtnClick(Nil);
   Screen.Cursor := crDefault;
   dblcdSODC.setfocus;
End;

Procedure TFRegNtaE.dbgOrdCompIbtnClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   pnlOC.Enabled := False;
   pnlSELOC.Visible := True;
   pnlSELOC.BringToFront;
   dblcdSODC.Clear;
   dbeF1.Clear;
   dbeF2.Clear;
   dbeF3.Clear;
   iEstado := 0;
   Screen.Cursor := crDefault;
End;

Procedure TFRegNtaE.dblcdSODCExit(Sender: TObject);
Var
   sWhere, sCIA: String;
Begin
   sCIA := DMALM.cdsOrdComp.fieldbyname('CIAID').asString;
   sWhere := 'CIAID=''' + sCIA + ''' AND CCOMERID=' + quotedstr(DMALM.cdsOrdComp.fieldbyname('CCOMERID').asString);
   dbeF2.Text := DMALM.DisplayDescrip('prvTGE', 'CXC101', 'CCOMERDES', sWhere, 'CCOMERDES');
   dbeF1.Text := DateToStr(DMALM.cdsOrdComp.FieldByName('ODCFEMI').AsDateTime);
   dbeF3.Text := Format('%8.5f', [DMALM.cdsOrdComp.FieldByName('ODCTOTALG').AsFloat]);
End;

Procedure TFRegNtaE.Z2bbtnSOCOK1Click(Sender: TObject);
Var
   sTMONID, sCIA, sALM, sTDA, sODCID, sNISAID, sPRV, sFPAGOID, sLOC, sTIN: String;
   dFECHA: TDateTime;
   lExiste: Boolean;
   fTG: Double;
Begin
   If Length(Trim(dblcdSODC.Text)) = 0 Then
      exit;
   sCIA := DMALM.cdsNIA.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsNIA.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIA.FieldByName('TINID').AsString;
   sALM := DMALM.cdsNIA.FieldByName('ALMID').AsString;
   sTDA := DMALM.cdsNIA.FieldByName('TDAID').AsString;
   sNISAID := DMALM.cdsNIA.FieldByName('NISAID').AsString;
   sPRV := DMALM.cdsNIA.FieldByName('PROV').AsString;

   sODCID := dblcdSODC.Text;
   If (iEstado = 0) Then
      lExiste := DMALM.cdsOCNIA.Locate('CIAID;ALMID;TDAID;ODCID;NISAID;LOCID;TINID', VarArrayOf([sCIA, sALM, sTDA, sODCID, sNISAID, sLOC, sTIN]), [])
   Else
      lExiste := False;
   If lExiste Then // localizar el valor....
   Begin
      ErrorMsg('Error', 'No Pueden Existir Ordenes de Compra Duplicadas...');
      Exit; // salir del procedimiento
   End;
   Screen.Cursor := crHourGlass;
   If iEstado = 0 Then
      DMALM.cdsOCNIA.Insert
   Else
      DMALM.cdsOCNIA.Edit;

   dFECHA := DMALM.cdsOrdComp.FieldByName('ODCFEMI').AsDateTime;
   sFPAGOID := DMALM.cdsOrdComp.FieldByName('CCOMERID').AsString;
   fTG := DMALM.cdsOrdComp.FieldByName('ODCTOTALG').AsFloat;
   sTMONID := DMALM.cdsOrdComp.FieldByName('TMONID').AsString;

   DMALM.cdsOCNIA.FieldByName('NISAID').AsString := sNISAID;
   DMALM.cdsOCNIA.FieldByName('CIAID').AsString := sCIA;
   DMALM.cdsOCNIA.FieldByName('LOCID').AsString := sLOC;
   DMALM.cdsOCNIA.FieldByName('TINID').AsString := sTIN;
   DMALM.cdsOCNIA.FieldByName('ALMID').AsString := sALM;
   DMALM.cdsOCNIA.FieldByName('TDAID').AsString := sTDA;
   DMALM.cdsOCNIA.FieldByName('ODCID').AsString := sODCID;
   DMALM.cdsOCNIA.FieldByName('ODCFEOC').AsDateTime := dFECHA;
   DMALM.cdsOCNIA.FieldByName('FPAGOID').AsString := sFPAGOID;
   DMALM.cdsOCNIA.FieldByName('ODCTOTALG').AsString := FloatToStr(RoundD(fTG, 5));
   DMALM.cdsOCNIA.FieldByName('PROV').AsString := sPRV;
   DMALM.cdsOCNIA.FieldByName('TMONID').AsString := sTMONID;

   DMALM.cdsOCNIA.Post;
   dblcdSODC.setfocus;
   dbeF1.Text := '';
   dbeF2.Text := '';
   dbeF3.Text := '';
   Screen.Cursor := crDefault;
End;

Procedure TFRegNtaE.Z2bbtnSOCCA1Click(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   dbgOrdComp.DataSource := DMALM.dsOCNIA;
   pnlOC.Enabled := True;
   pnlSELOC.Visible := False;
   Screen.Cursor := crDefault;
End;

Procedure TFRegNtaE.Z2bbtnSOCOKClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   pnlCabecera.Enabled := True;
   pnlControl.Enabled := True;
   pnlDetalleG.Enabled := True;
 {aqui se construye la cadena que se muestra fuera en el número de OC }
   nOrds;
   pnlOC.Visible := False;
   btnOc.SetFocus;
   Screen.Cursor := crDefault;
End;

Procedure TFRegNtaE.Z2bbtnSOCCAClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   pnlCabecera.Enabled := True;
   pnlControl.Enabled := True;
   pnlDetalleG.Enabled := True;
   pnlOC.Visible := False;
   Screen.Cursor := crDefault;
End;

Procedure TFRegNtaE.dblcdTDOCExit(Sender: TObject);
Var
   lEstado: Boolean;
Begin
   dbeTDoc.text := DMALM.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', 'DOCID=' + quotedstr(dblcdTDOC.text), 'DOCDES');
   lEstado := Not (dblcdTDOC.Text = '');
   lblFDoc.Enabled := lEstado;
   lblNDoc.Enabled := lEstado;
   dbeNDoc.Enabled := lEstado;
   If DMALM.cdsKDX.RecordCount = 0 Then
      dbdtpFDoc.Enabled := lEstado;
   If (Not xNSalxDevPed) And (Not xReqNSalida) Then
      If lEstado Then
         If (DMALM.cdsNia.FieldByName('NISSIT').AsString = 'INICIAL') Then
            dbeNDoc.setFocus;
   If (xNSalxDevPed) Or (xReqNSalida) Then
   Begin
      lblFDoc.Enabled := False;
      lblNDoc.Enabled := False;
      dbeNDoc.Enabled := False;
      dbdtpFDoc.Enabled := False;
   End
   Else
   Begin
      lblFDoc.Enabled := True;
      lblNDoc.Enabled := True;
      dbeNDoc.Enabled := True;
      dbdtpFDoc.Enabled := True;
   End;
End;

Procedure TFRegNtaE.dbeNDocExit(Sender: TObject);
Begin
   If Length(Trim(dbeNDoc.Text)) = 0 Then
      ErrorMsg(Caption, ' El campo Nº de Documento no puede estar  en Blanco  ');
End;

Procedure TFRegNtaE.dblcdPedidoExit(Sender: TObject);
Var
   sPedido, sSQL: String;
Begin
   If dblcdPedido.text <> '' Then
   Begin
      If Not DMALM.cdsMovFac.Locate('PEDIDO', VarArrayOf([dblcdPedido.text]), []) Then
      Begin
         dblcdPedido.Text := '';
         ErrorMsg(Caption, 'El N° Pedido no es válido...');
         dblcdPedido.SetFocus;
         Exit;
      End;
      sPedido := ' and PEDIDO=' + QuotedStr(dblcdPedido.text);
   End
   Else
   Begin
      sPedido := '';
   End;

   sSQL := 'Select RTRIM(LTRIM(SERIE))||RTRIM(LTRIM(NGUIA)) NGUIA, GREMFECHA '
      + '     from FAC303 '
      + '    where CIAID=' + QuotedStr(dblcCIA.text)
      + '      and LOCID=' + QuotedStr(dblcLOC.text)
      + '      and ALMID=' + QuotedStr(dblcTALM.Text)
      + '      and CLIEID=' + QuotedStr(dblcdClie.Text)
      + '      and GREMESTADO=''P'' '
      + '      and nvl(GREMINGDEV,'''')<>''S'' ' + sPedido;
   DMALM.cdsGuia.Close;
   DMALM.cdsGuia.DataRequest(sSQL);
   DMALM.cdsGuia.Open;
End;

Procedure TFRegNtaE.dblcdGuiaExit(Sender: TObject);
Var
   sCanje, sLet, xWhere: String;
   xCont: integer;
Begin
   If Length(Trim(dblcdGuia.Text)) > 0 Then
   Begin
      If Not DMALM.cdsGuia.Locate('NGUIA', VarArrayOf([dblcdGuia.text]), []) Then
      Begin
         dblcdGuia.Text := '';
         dbeNDoc.text := '';
         ErrorMsg(Caption, 'El Documento no es válido...');
         Exit;
      End;

      xWhere := 'TRIID=' + quotedstr(dblcTransac.Text) + ' AND TRISGT=''I''';
      If DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRIID,TRIINGDEV', xWhere, 'TRIINGDEV') = 'S' Then
      Begin
         xWhere := 'CIAID=' + Quotedstr(dblcCia.text) + ' and SERIENGUIA=' + Quotedstr(dblcdGuia.text);
         DMALM.DisplayDescrip('prvTGE', 'FAC305', 'CIAID,DOCID,FACSERIE, NFAC ', xWhere, 'CIAID');
         xWhere := ' CIAID=' + Quotedstr(dblcCia.text)
            + '  and DOCID=' + Quotedstr(DMALM.cdsQry.fieldbyname('DOCID').AsString)
            + '  and CCSERIE=' + Quotedstr(DMALM.cdsQry.fieldbyname('FACSERIE').AsString)
            + '  and CCNODOC=' + Quotedstr(DMALM.cdsQry.fieldbyname('NFAC').AsString);
         If (DMALM.DisplayDescrip('prvTGE', 'CXC301', 'CIAID,CLIEID,CCESTADO,CCCANJE', xWhere, 'CCESTADO') = 'C') And (DMALM.cdsQry.fieldbyname('CCCANJE').IsNull) Then
         Begin
            dblcdGuia.Text := '';
            dbeNDoc.text := '';
            ErrorMsg(Caption, 'El Documento se encuentra cancelado...');
            Exit;
         End
         Else
         Begin
            xCont := 0;
            sCanje := DMALM.cdsQry.fieldbyname('CCCANJE').AsString;
            sLet := DMALM.DisplayDescrip('prvTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOC_FREG=''L''', 'DOCID');

            xWhere := ' Select CCNODOC,CCESTADO '
               + '        from CXC301 '
               + '       where CIAID=' + QuotedStr(dblcCIA.text)
               + '         and DOCID=' + Quotedstr(sLet)
               + '         and CCCANJE=' + Quotedstr(sCanje);
            DMALM.cdsQry6.IndexFieldNames := '';
            DMALM.cdsQry6.Filter := '';
            DMALM.cdsQry6.Filtered := false;
            DMALM.cdsQry6.Close;
            DMALM.cdsQry6.DataRequest(xWhere);
            DMALM.cdsQry6.Open;
            DMALM.cdsQry6.First;
            While Not DMALM.cdsQry6.Eof Do
            Begin
               If DMALM.cdsQry6.FieldByName('CCESTADO').AsString = 'C' Then
                  xCont := xCont + 1;
               DMALM.cdsQry6.Next;
            End;
            If xCont >= 1 Then
            Begin
               dblcdGuia.Text := '';
               dbeNDoc.text := '';
               ErrorMsg(Caption, 'El Documento se encuentra cancelado...');
               Exit;
            End;

         End;
      End;

      DMALM.cdsNIA.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsGuia.FieldByName('GREMFECHA').AsDateTime;
   End;
End;

Procedure TFRegNtaE.dblcdNSalDropDown(Sender: TObject);
Var
   sSQL: String;
Begin
   If xNSalxDevPed Then
   Begin
      sSQL := 'Select NISAID, NISAFREG, CCOSID, NISAIDNSAL '
         + '     from LOG314 '
         + '    where NISATIP=''SALIDA'' '
         + '      and CIAID=' + QuotedStr(dblcCIA.Text)
         + '      and LOCID=' + QuotedStr(dblcLOC.Text)
         + '      and TINID=' + QuotedStr(dblcTIN.Text)
         + '      and ALMID=' + QuotedStr(dblcTALM.Text);
      DMALM.cdsParaRepo.Close;
      DMALM.cdsParaRepo.DataRequest(sSQL);
      DMALM.cdsParaRepo.Open;
   End;
End;

Procedure TFRegNtaE.dblcdNSalExit(Sender: TObject);
Begin
   If Length(Trim(dblcdNSal.Text)) > 0 Then
   Begin
      DMALM.cdsNIA.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsParaRepo.FieldByName('NISAFREG').AsDateTime;
      DMALM.cdsNIA.FieldByName('NISANDOC').AsString := DMALM.cdsParaRepo.FieldByName('NISAID').AsString;
   End;
End;

Procedure TFRegNtaE.dbmObsKeyPress(Sender: TObject; Var Key: Char);
Var
   sC: String;
Begin
   sC := Key;
   sC := Uppercase(sC);
   Key := sC[1];
End;

Procedure TFRegNtaE.Z2bbtnBorrarClick(Sender: TObject);
Begin
   If Not dblcCia.Enabled Then Exit;

   If (DMALM.wModo = 'A') or (DMALM.wModo = 'M') Then
//   If DMALM.cdsNIA.State In [dsInsert, dsEdit] Then
   Begin
      Z2bbtnOK.Enabled := False;
      OnOffCabecera(False); //Desactivar el panel de Cabecera
      DMALM.cdsNIA.Cancel;
      DMALM.cdsNIA.Insert;
      Init(Nil);
   End;
   Ir_a_Foco;
End;

Procedure TFRegNtaE.Ir_a_Foco;
Begin
   If dblcLOC.Enabled Then
   Begin
      dblcCIAExit(Nil);
   End
   Else
   Begin
      If dblcLOC.Enabled Then
      Begin
         dblcCIAExit(Nil);
         dblcLOC.SetFocus
      End
      Else
      Begin
         If dblcTALM.Enabled Then
         Begin
            dblcLOCExit(Nil);
            dblcTALM.SetFocus
         End
         Else
         Begin
            If dblcTDA.Enabled Then
               dblcTDA.SetFocus
            Else
            Begin
               If dbdtpFNS.Enabled Then
                  dbdtpFNS.SetFocus
               Else
               Begin
                  If dblcTransac.Enabled Then
                     dblcTransac.SetFocus
                  Else
                  Begin
                     dblcdProv.SetFocus;
                  End;
               End;
            End;
         End;
      End;
   End;
End;

Procedure TFRegNtaE.bbtnLoteClick(Sender: TObject);
Begin
   pnlLote.visible := True;
End;

Procedure TFRegNtaE.Z2bbtnOKClick(Sender: TObject);
Var
   sConta: Integer;
   sSQL, xSQL, sFCH: String;
   sNUM, sTIN, sCIA, sALM, sTDA, sLOC, sTIP: String;
   xODCID: String;
Begin
   sConta := 0;
   ConfiguraNota(Nil);
   If xReqOCompra Then
   Begin
      DMALM.cdsOCNIA.First;
      While Not DMALM.cdsOCNIA.Eof Do
      Begin
         If (DMALM.cdsOCNIA.FieldByName('TMONID').AsString = DMALM.wTMonExt) Then
            sConta := sConta + 1;
         DMALM.cdsOCNIA.Next;
      End;
      If sConta > 0 Then
      Begin
         sSQL := 'TMONID=' + quotedstr(DMALM.wTMonExt);
         sFCH := QuotedStr(FormatDateTime(DMALM.wFormatFecha, dbdtpFNS.Date));
         sSQL := 'SELECT ' + 'TCAM' + DMALM.wTipoCambioUsar + ' TCAMB FROM TGE107 WHERE ' + sSQL + ' AND FECHA = ' + DMALM.wRepFuncDate + sFCH + ')';
         DMALM.cdsReporte.Close;
         DMALM.cdsReporte.DataRequest(sSQL);
         DMALM.cdsReporte.Open;
         If Trim(DMALM.cdsReporte.FieldByName('TCAMB').AsString) = '' Then
         Begin
            ErrorMsg(Caption, 'No Existe Tipo de Cambio Para la Fecha no Puede Continuar');
            Exit;
         End;
      End;
   End;

   If Length(Trim(dblcTIN.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Tipo de Inventario No puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dblcTALM.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Almacén No puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dblcTDA.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Tipo de Documento No puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dbdtpFNS.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Fecha de Nota de Ingreso no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dblcTransac.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Transacción no puede estar en Blanco  ');
      exit
   End;
   If xReqProveed Then
      If Length(Trim(dblcdProv.Text)) = 0 Then
      Begin
         ErrorMsg(Caption, ' El campo Proveedor no puede estar en Blanco  ');
         exit
      End;
   If Length(Trim(dblcdTDOC.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Documento de Referencia no puede estar en Blanco  ');
      exit
   End;

   If Length(Trim(dbeNDoc.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Nº de Documento No puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dbdtpFDoc.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Fecha de Documento No puede estar en Blanco  ');
      exit
   End;

   If xReqProveed Then
      If DMALM.cdsOrdComp.State = dsInactive Then
      Begin
         strTmp := '/*-'; //obligarlo a entrar al dblcdProv
         dblcdProv.OnExit(dblcdProv);
      End;

   If xReqNSalida Then
      If Length(Trim(dblcdNSal.Text)) = 0 Then
      Begin
         ErrorMsg(Caption, ' Ingrese Nº de Nota de Salida ');
         exit
      End;

   If xNSalxDevPed Then
      If Length(Trim(dblcdGuia.Text)) = 0 Then
      Begin
         ErrorMsg(Caption, ' Ingrese Nº de Guia ');
         exit
      End;

   If xReqOCompra Then
   Begin
      If Length(Trim(edNOrdC.Text)) = 0 Then
      Begin
         If wOperacion = 'ADD' Then
         Begin
            sNUM := DMALM.StrZero(DMALM.MaxNIA(sCIA, sALM), wAnchoSal);
            DMALM.cdsNIA.Edit;
            DMALM.cdsNIA.FieldByName('NISAID').AsString := sNUM;
         End;
         ErrorMsg(Caption, ' Tiene que Ingresar La(s) Orden(es) de Compra(s) ');
         btnOC.Click;
         Exit;
      End;
   End;

   vValida := False;
   If (wOperacion = 'ADD') Or
      (wOperacion = 'MOD') Then
   Begin
      ValidarFecha;
      If vValida = True Then
      Begin
         Information('Modulo de Almacen', ' No puede Continuar Registrando este Documento con esta Fecha de Documento  ');
         Exit;
      End;
   End;

   DMALM.DCOM1.AppServer.IniciaTransaccion;
   Begin
      Try
         If vValida = False Then
         Begin
            sCIA := dblcCIA.Text;
            sLOC := dblcLOC.Text;
            sTIN := dblcTIN.Text;
            sALM := dblcTALM.Text;
            sTDA := dblcTDA.Text;
            sNUM := '';
            sTIP := 'INGRESO';
            If (wOperacion = 'ADD') Then
            Begin
               sNUM := DMALM.StrZero(DMALM.MaxNIA(sCIA, sALM), wAnchoSal);
               DMALM.cdsNIA.Edit;
               DMALM.cdsNIA.FieldByName('NISAID').AsString := sNUM;
               dbeNumNISA.Text := sNUM;
            End;

            If xReqOCompra Then
            Begin
               DMALM.cdsOCNIA.First;
               While Not DMALM.cdsOCNIA.Eof Do
               Begin
                  DMALM.cdsOCNIA.edit;
                  DMALM.cdsOCNIA.FieldByName('NISAID').AsString := dbeNumNISA.Text;
                  DMALM.cdsOCNIA.Post;
                  DMALM.cdsOCNIA.Next;
               End;
            End;

            Screen.Cursor := crHourGlass;
            If wOperacion = 'ADD' Then
            Begin
               Try
                  AsigDat; // asignar los datos predeterminados
                  DMALM.cdsNIA.Post;
                  OnOffCabecera(False); //Desactivar el panel de Cabecera
                  OnOffDetalle(True); //Activar el panel de detalle
                  pnlDetalleG.SetFocus;
                  Z2bbtnCanc2.Enabled := True;
               Except
                  On E: Exception Do
                     If Not EHandlerError(E) Then Raise;
               End
            End
            Else
               If wOperacion = 'MOD' Then
               Begin
                  Try
                     AsigDat; // asignar los datos predeterminados
                     OnOffCabecera(False); //Desactivar el panel de Cabecera
                     OnOffDetalle(True); //Activar el panel de detalle
                     pnlDetalleG.SetFocus;
                     Z2bbtnCanc2.Enabled := True;
                  Except
                     On E: Exception Do
                        If Not EHandlerError(E) Then Raise;
                  End;
               End;
            Screen.Cursor := crDefault;
         End;

         If ((xNSalxDevPed) Or (xReqCodCliente)) Then
         Begin
            If (DMALM.cdsNIA.State <> dsEdit) And (DMALM.cdsNIA.State <> dsInsert) Then
               DMALM.cdsNIA.Edit;
            DMALM.cdsNIA.FieldByName('CLIEDES').AsString := dbeClie.Text;
            DMALM.cdsNIA.Post;
         End;
         Z2bbtnGraba.Enabled := true;

         If xReqOCompra Then
         Begin
            If DMALM.cdsOCNIA.RecordCount > 0 Then
            Begin
               DMALM.cdsOCNIA.First;
               While Not DMALM.cdsOCNIA.Eof Do
               Begin
                  xSQL := 'Select * From Log318 '
                     + '    Where Ciaid=''' + DMALM.cdsOCNIA.FieldByName('CIAID').AsString + ''' and '
                     + '          Locid=''' + DMALM.cdsOCNIA.FieldByName('LOCID').AsString + ''' and '
                     + '          Tinid=''' + DMALM.cdsOCNIA.FieldByName('TINID').AsString + ''' and '
                     + '          Almid=''' + DMALM.cdsOCNIA.FieldByName('ALMID').AsString + ''' and '
                     + '          Tdaid=''' + DMALM.cdsOCNIA.FieldByName('TDAID').AsString + ''' and '
                     + '          Odcid=''' + DMALM.cdsOCNIA.FieldByName('ODCID').AsString + ''' and '
                     + '          Odcfeoc=''' + DateTimeToStr(DMALM.cdsOCNIA.FieldByName('ODCFEOC').AsDateTime) + ''' and '
                     + '          nisaid=''' + DMALM.cdsOCNIA.FieldByName('NISAID').AsString + ''' ';
                  DMALM.cdsDOrdComp.Close;
                  DMALM.cdsDOrdComp.DataRequest(Xsql);
                  DMALM.cdsDOrdComp.Open;
                  If DMALM.cdsDOrdComp.RecordCount = 0 Then
                  Begin
                     Try
                        Xsql := 'Insert Into Log318(NISAID,CIAID,LOCID,TINID,ALMID,TDAID,ODCID,ODCFEOC,FPAGOID,ODCTOTALG,PROV,TMONID) '
                           + '   Values(' + quotedstr(DMALM.cdsOCNIA.FieldByName('NISAID').AsString) + ','
                           + quotedstr(DMALM.cdsOCNIA.FieldByName('CIAID').AsString) + ','
                           + quotedstr(DMALM.cdsOCNIA.FieldByName('LOCID').AsString) + ','
                           + quotedstr(DMALM.cdsOCNIA.FieldByName('TINID').AsString) + ','
                           + quotedstr(DMALM.cdsOCNIA.FieldByName('ALMID').AsString) + ','
                           + quotedstr(DMALM.cdsOCNIA.FieldByName('TDAID').AsString) + ','
                           + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCID').AsString) + ','
                           + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCFEOC').AsString) + ','
                           + quotedstr(DMALM.cdsOCNIA.FieldByName('FPAGOID').AsString) + ','
                           + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCTOTALG').AsString) + ','
                           + quotedstr(DMALM.cdsOCNIA.FieldByName('PROV').AsString) + ','
                           + quotedstr(DMALM.cdsOCNIA.FieldByName('TMONID').AsString) + ')';
                        DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
                     Except
                        ShowMessage('Error al añadir datos en archivo de Relación <<Nota de Ingreso-Orden de Compra>> (Log318)');
                        DMALM.DCOM1.AppServer.RetornaTransaccion;
                        Screen.Cursor := crDefault;
                        exit;
                     End;
                  End
                  Else
                  Begin
                     Try
                        Xsql := 'Update LOG318 '
                           + '      Set NISAID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('NISAID').AsString) + ','
                           + '          CIAID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('CIAID').AsString) + ','
                           + '          LOCID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('LOCID').AsString) + ','
                           + '          TINID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('TINID').AsString) + ','
                           + '          ALMID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('ALMID').AsString) + ','
                           + '          TDAID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('TDAID').AsString) + ','
                           + '          ODCID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCID').AsString) + ','
                           + '          ODCFEOC=' + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCFEOC').AsString) + ','
                           + '          FPAGOID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('FPAGOID').AsString) + ','
                           + '          ODCTOTALG=' + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCTOTALG').AsString) + ','
                           + '          PROV=' + quotedstr(DMALM.cdsOCNIA.FieldByName('PROV').AsString) + ','
                           + '          TMONID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('TMONID').AsString) + ' '
                           + '    Where CIAID=''' + DMALM.cdsOCNIA.FieldByName('CIAID').AsString + ''' and '
                           + '          LOCID=''' + DMALM.cdsOCNIA.FieldByName('LOCID').AsString + ''' and '
                           + '          TINID=''' + DMALM.cdsOCNIA.FieldByName('TINID').AsString + ''' and '
                           + '          ALMID=''' + DMALM.cdsOCNIA.FieldByName('ALMID').AsString + ''' and '
                           + '          TDAID=''' + DMALM.cdsOCNIA.FieldByName('TDAID').AsString + ''' and '
                           + '          ODCID=''' + DMALM.cdsOCNIA.FieldByName('ODCID').AsString + ''' and '
                           + '          ODCFEOC=''' + DateTimeToStr(DMALM.cdsOCNIA.FieldByName('ODCFEOC').AsDateTime) + ''' and '
                           + '          NISAID=''' + DMALM.cdsOCNIA.FieldByName('NISAID').AsString + ''' ';
                        DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
                     Except
                        ShowMessage('Error al actualizar datos en archivo de Relación <<Nota de Ingreso-Orden de Compra>> (Log318)');
                        DMALM.DCOM1.AppServer.RetornaTransaccion;
                        Screen.Cursor := crDefault;
                        exit;
                     End;
                  End;
                  DMALM.cdsOCNIA.Next;
               End;
            End;
         End;

         If (wOperacion = 'ADD') And (wRegraNro = '1ADD') Then
         Begin
            Screen.Cursor := crHourGlass;
            sCIA := DMALM.cdsNIA.FieldByName('CIAID').AsString;
            sLOC := DMALM.cdsNIA.FieldByName('LOCID').AsString;
            sTIN := DMALM.cdsNIA.FieldByName('TINID').AsString;
            sALM := DMALM.cdsNIA.FieldByName('ALMID').AsString;
            sTDA := DMALM.cdsNIA.FieldByName('TDAID').AsString;
            sNUM := DMALM.cdsNIA.FieldByName('NISAID').AsString;
            sTIP := 'INGRESO';
            If (DMALM.IsExistNISA(sCIA, sALM, sTIP, sNUM)) Then
            Begin
               ErrorMsg('Error', 'Ya Existe una Nota de Ingreso ' + #13 +
                  'con el mismo Número ... ' + sNUM);
               sNUM := DMALM.StrZero(DMALM.MaxNIA(sCIA, sALM), wAnchoIng);
               If (DMALM.cdsNIA.State <> dsEdit) And (DMALM.cdsNIA.State <> dsInsert) Then
                  DMALM.cdsNIA.Edit;
               DMALM.cdsNIA.FieldByName('NISAID').AsString := sNUM;
               DMALM.cdsNIA.Post;
            End;
            Try
               xSQL := ' Insert into LOG314( CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP,CLAUXID,PROV,CCOSID,CLIEID,CLIEDES,TRIID, '
                  + '                     NISAFREG,NISSIT,DOCID,NISANDOC,NISAFDOC,NISASOLIC,NISASERIE,NISANOMM,NISAOBS,NISAUSER,NISAHREG, '
                  + '                     NISAANO, NISAMES, NISADIA, NISATRIM, NISASEM, NISAANOMES, NISASS, NISAAATRI, NISAAASEM, NISAAASS, '
                  + '                     ALMORIID,TINORIID,LOCORIID,TIPPRESID,PARPRESID ) '
                  + '    Values( ' + quotedstr(DMALM.cdsNIA.fieldbyname('CIAID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('LOCID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('TINID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('ALMID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('TDAID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISAID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISATIP').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('CLAUXID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('PROV').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('CCOSID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('CLIEID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('CLIEDES').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('TRIID').AsString) + ', '
                  + quotedstr(datetostr(DMALM.cdsNIA.fieldbyname('NISAFREG').AsDateTime)) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISSIT').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('DOCID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISANDOC').AsString) + ', '
                  + quotedstr(datetostr(DMALM.cdsNIA.fieldbyname('NISAFDOC').AsDateTime)) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISASOLIC').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISASERIE').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISANOMM').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISAOBS').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISAUSER').AsString) + ', '
                  + '                sysdate, '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISAANO').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISAMES').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISADIA').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISATRIM').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISASEM').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISAANOMES').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISASS').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISAAATRI').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISAAASEM').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('NISAAASS').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('ALMORIID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('TINORIID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('LOCORIID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('TIPPRESID').AsString) + ', '
                  + quotedstr(DMALM.cdsNIA.fieldbyname('PARPRESID').AsString) + ') ';
               DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

               If DMALM.wTipoAdicion = 'xFiltro' Then
               Begin
                  DMALM.wModo := 'A';
                  DMALM.ActualizaFiltro(mtx3000, DMALM.cdsNIA, DMALM.wModo);
               End;
               wOperacion := 'MOD';
            Except
               ShowMessage('Error al Insertar Datos en la Cabecera de la Nota de Ingreso');
               DMALM.DCOM1.AppServer.RetornaTransaccion;
               Screen.Cursor := crDefault;
               exit;
            End;
            Screen.Cursor := crDefault;
         End
         Else
         Begin
            If (wOperacion = 'MOD') Then
            Begin
               Screen.Cursor := crHourGlass;
               sCIA := DMALM.cdsNIA.FieldByName('CIAID').AsString;
               sLOC := DMALM.cdsNIA.FieldByName('LOCID').AsString;
               sTIN := DMALM.cdsNIA.FieldByName('TINID').AsString;
               sALM := DMALM.cdsNIA.FieldByName('ALMID').AsString;
               sTDA := DMALM.cdsNIA.FieldByName('TDAID').AsString;
               sNUM := DMALM.cdsNIA.FieldByName('NISAID').AsString;
               sTIP := 'INGRESO';

               If length(trim(dbmObs.Text)) = 0 Then dbmObs.Text := '.';
               If xReqOCompra Then
                  xODCID := 'S'
               Else
                  xODCID := 'N';

               Try
                  XSQL := 'Update LOG314 '
                     + '      Set NISAOBS=''' + dbmObs.Text + ''','
                     + '          NISAHREG=sysdate,'
                     + '          NISTMOV=''' + wTriTMov + ''','
                     + '          ODCID=''' + xODCID + ''' '
                     + '    where CIAID  =' + QuotedStr(dblcCIA.Text)
                     + '      and LOCID  =' + QuotedStr(dblcLOC.Text)
                     + '      and TINID  =' + QuotedStr(dblcTIN.Text)
                     + '      and ALMID  =' + QuotedStr(dblcTALM.Text)
                     + '      and TDAID  =' + QuotedStr(dblcTDA.Text)
                     + '      and NISAID =' + QuotedStr(dbeNumNISA.Text)
                     + '      and NISATIP=''INGRESO'' ';
                  DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
                  If DMALM.wTipoAdicion = 'xFiltro' Then
                  Begin
                     DMALM.wModo := 'M';
                     DMALM.ActualizaFiltro(mtx3000, DMALM.cdsNIA, DMALM.wModo);
                  End;
               Except
                  ShowMessage('Error al Actualizar Datos en la Cabecera de la Nota de Ingreso');
                  DMALM.DCOM1.AppServer.RetornaTransaccion;
                  Screen.Cursor := crDefault;
                  exit;
               End;
               Screen.Cursor := crDefault;
            End;
         End;

         SQLFiltro := 'Select * '
            + '          from LOG314 '
            + '         where CIAID  =' + QuotedStr(dblcCIA.Text)
            + '           and LOCID  =' + QuotedStr(dblcLOC.Text)
            + '           and TINID  =' + QuotedStr(dblcTIN.Text)
            + '           and ALMID  =' + QuotedStr(dblcTALM.Text)
            + '           and TDAID  =' + QuotedStr(dblcTDA.Text)
            + '           and NISAID =' + QuotedStr(dbeNumNISA.Text)
            + '           and NISATIP=''INGRESO'' ';
         DMALM.cdsNIA.DataRequest(SQLFiltro);

         If wOperacion = 'ADD' Then
         Begin
            xNIngElim := DMALM.cdsNIA.FieldByName('NISAID').AsString; // Si graba podre borrar
         End;

         wRegraNro := '1MOD';
         Screen.Cursor := crHourGlass;
         xSQL := 'Select * '
            + '     from LOG315 '
            + '    where CIAID  =' + QuotedStr(DMALM.cdsNIA.FieldByName('CIAID').AsString)
            + '      and LOCID  =' + QuotedStr(DMALM.cdsNIA.FieldByName('LOCID').AsString)
            + '      and TINID  =' + QuotedStr(DMALM.cdsNIA.FieldByName('TINID').AsString)
            + '      and ALMID  =' + QuotedStr(DMALM.cdsNIA.FieldByName('ALMID').AsString)
            + '      and TDAID  =' + QuotedStr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
            + '      and NISAID =' + QuotedStr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
            + '      and NISATIP=''INGRESO'' '
            + '    order by KDXID';
         DMALM.cdsKDX.Close;
         DMALM.cdsKDX.DataRequest(xSQL);
         DMALM.cdsKDX.Open;
         sSQL := '';
         Screen.Cursor := crDefault;

     //	Segun la Transación va a realizar la seleccion de la data
         If Length(Trim(edNOrdC.Text)) > 0 Then // Si es por Orden de Compra
         Begin
            Screen.Cursor := crHourGlass;
            sSQL := 'Select B.ODCID, B.DODCID, B.ARTID, C.TMONID, C.ODCTCAMB, A.ARTDES DET, UNMID, ' + quotedstr('G') + ' TPMED, '
               + '          SUM(' + DMALM.wReplacCeros + '(DODCCSLD,0)) CANT, '
               + '          SUM(' + DMALM.wReplacCeros + '(DODCPUN,0)) PUNITR, '
               + '          SUM(' + DMALM.wReplacCeros + '(DODCPUN,0) *(1+NVL(DODCIMPU,0)/100) ) PUNITRATN, '
               + '          SUM(' + DMALM.wReplacCeros + '(DODCPUN,0)) *(1-(SUM(' + DMALM.wReplacCeros + '(DODCDSCTO,0))/100)) PUNIT, '
               + '          SUM(' + DMALM.wReplacCeros + '(DODCPUN,0)*(1+NVL(DODCIMPU,0)/100)) *(1-(SUM(' + DMALM.wReplacCeros + '(DODCDSCTO,0))/100)) PUNITATN, '
               + '          SUM(' + DMALM.wReplacCeros + '(DODCDSCTO,0)) DSCTO, '
               + '          SUM(' + DMALM.wReplacCeros + '(IMPUNI,0)) *(1-(SUM(' + DMALM.wReplacCeros + '(DODCDSCTO,0))/100)) PUFIS, '
               + '          SUM(' + DMALM.wReplacCeros + '(IMPUNI,0)) PUFISSD '
               + '     from LOG305 B, TGE205 A, LOG304 C '
               + '    where B.CIAID=' + quotedstr(dblcCia.text) + ' '
               + '      and A.CIAID = B.CIAID '
               + '      and B.CIAID = C.CIAID '
               + '      and B.ARTID = A.ARTID';
            If Length(trim(wODCIDs)) > 0 Then
               sSQL := sSQL + ' AND ' + wODCIDs;
            sSQL := sSQL + ' AND B.ODCID=C.ODCID AND A.TINID=' + quotedstr(dblcTIN.Text) + ' '
               + '   group by B.ODCID, B.DODCID, B.ARTID, A.ARTDES, UNMID, C.TMONID, C.ODCTCAMB '
               + '   union all '
               + '   select B.ODCID, B.DODCID, B.ARTID, C.TMONID, C.ODCTCAMB, A.ARTDES DET, UNMID, ' + quotedstr('U') + ' TPMED, '
               + '          sum(' + DMALM.wReplacCeros + '(DODCCSLDU,0)) CANT, '
               + '          sum(' + DMALM.wReplacCeros + '(DODCPUNU,0)) PUNITR,0 PUNITRATN, '
               + '          sum(' + DMALM.wReplacCeros + '(DODCPUNU,0)) *(1-(SUM(' + DMALM.wReplacCeros + '(DODCDSCTO,0))/100)) PUNIT,0 PUNITATN, '
               + '          sum(' + DMALM.wReplacCeros + '(DODCDSCTO,0)) DSCTO, '
               + '          sum(' + DMALM.wReplacCeros + '(IMPUNI,0)) *(1-(SUM(' + DMALM.wReplacCeros + '(DODCDSCTO,0))/100)) PUFIS, '
               + '          sum(' + DMALM.wReplacCeros + '(IMPUNI,0)) PUFISSD '
               + '     from LOG305 B, TGE205 A, LOG304 C '
               + '    where B.CIAID=' + quotedstr(dblcCia.text) + ' AND ' + DMALM.wReplacCeros + '(B.DODCCNTU,0)> 0 '
               + '      and A.CIAID = B.CIAID '
               + '      and B.CIAID = C.CIAID '
               + '      and B.ARTID = A.ARTID ';
            If Length(trim(wODCIDs)) > 0 Then
               sSQL := sSQL + ' AND ' + wODCIDs;
            sSQL := sSQL + ' AND B.ODCID=C.ODCID  AND A.TINID=' + quotedstr(dblcTIN.Text) + ' '
               + '    group by B.ODCID, B.DODCID, B.ARTID, A.ARTDES, UNMID, C.TMONID, C.ODCTCAMB '
               + '    order by ODCID, DODCID';
            DMALM.cdsSQL.Filter := '';
            DMALM.cdsSQL.Filtered := false;
            DMALM.cdsSQL.IndexFieldNames := '';
            DMALM.cdsSQL.Close;
            DMALM.cdsSQL.DataRequest(sSQL);
            DMALM.cdsSQL.Open;
            wODCTcambio := DMALM.cdsSql.FieldbyName('ODCTCAMB').AsInteger;
            Screen.Cursor := crDefault;
         End
         Else
            If (xReqNSalida) And (Length(Trim(dblcdNSal.Text)) > 0) Then // Si es devolucion de una Area (Centro de Costo)
            Begin
               Screen.Cursor := crHourGlass;
               sSQL := 'Select '' '' ODCID, '' '' DODCID, B.ARTID, C.TMONID, B.TCAMB ODCTCAMB, A.ARTDES DET, B.UNMIDG, ''G'' TPMED, '
                  + DMALM.wReplacCeros + '(B.KDXCNTG,0) CANT, ' + DMALM.wReplacCeros + '(B.ARTPCG,0) PUNIT, ' + DMALM.wReplacCeros + '(B.ARTPCG,0) PUFIS '
                  + '     from LOG315 B, TGE205 A, LOG314 C '
                  + '    where B.CIAID=C.CIAID AND B.LOCID=C.LOCID AND B.TINID=C.TINID '
                  + '      and B.ALMID=C.ALMID AND B.TDAID=C.TDAID AND B.NISAID=C.NISAID AND B.CIAID=A.CIAID '
                  + '      and B.TINID=A.TINID AND B.ARTID=A.ARTID AND B.NISAID=' + QuotedStr(dblcdNSal.Text) + ' AND B.NISATIP=''SALIDA'' '
                  + '      and B.CIAID=' + QuotedStr(dblcCIA.Text) + ' AND B.LOCID=' + QuotedStr(dblcLOC.Text) + ' AND B.TINID=' + QuotedStr(dblcTIN.Text) + ' '
                  + '      and B.ALMID=' + QuotedStr(dblcTALM.Text) + ' AND ' + DMALM.wReplacCeros + '(B.KDXCNTG,0) > 0 '
                  + '    union all '
                  + '   Select '' '' ODCID, '' '' DODCID, B.ARTID, C.TMONID, B.TCAMB ODCTCAMB, A.ARTDES DET, B.UNMIDU, ''U'' TPMED, '
                  + DMALM.wReplacCeros + '(B.KDXCNTU,0) CANT, ' + DMALM.wReplacCeros + '(B.ARTPCU,0) PUNIT, ' + DMALM.wReplacCeros + '(B.ARTPCU,0) PUFIS '
                  + '     from LOG315 B, TGE205 A, LOG314 C '
                  + '    where B.CIAID=C.CIAID AND B.LOCID=C.LOCID AND B.TINID=C.TINID '
                  + '      and B.ALMID=C.ALMID AND B.TDAID=C.TDAID AND B.NISAID=C.NISAID AND B.CIAID=A.CIAID '
                  + '      and B.TINID=A.TINID AND B.ARTID=A.ARTID AND B.NISAID=' + QuotedStr(dblcdNSal.Text) + ' AND B.NISATIP=''SALIDA'' '
                  + '      and B.CIAID=' + QuotedStr(dblcCIA.Text) + ' AND B.LOCID=' + QuotedStr(dblcLOC.Text) + ' AND B.TINID=' + QuotedStr(dblcTIN.Text) + ' '
                  + '      and B.ALMID=' + QuotedStr(dblcTALM.Text) + ' AND ' + DMALM.wReplacCeros + '(B.KDXCNTU,0) > 0';
               DMALM.cdsSQL.Filter := '';
               DMALM.cdsSQL.Filtered := false;
               DMALM.cdsSQL.IndexFieldNames := '';
               DMALM.cdsSQL.Close;
               DMALM.cdsSQL.DataRequest(sSQL);
               DMALM.cdsSQL.Open;
               Screen.Cursor := crDefault;
            End
            Else
               If (xNSalxDevPed) And (Length(Trim(dblcdGuia.Text)) > 0) Then // Si es devolucion de un Cliente (Venta)
               Begin
                  Screen.Cursor := crHourGlass;
                  xSQL := 'Select NISAID '
                     + '     from LOG314 '
                     + '    where CIAID=' + QuotedStr(dblcCIA.text)
                     + '      and LOCID=' + QuotedStr(dblcLOC.text)
                     + '      and TINID=' + QuotedStr(dblcTIN.text)
                     + '      and ALMID=' + QuotedStr(dblcTALM.text)
                     + '      and NISATIP=' + QuotedStr('SALIDA')
                     + '      and NISAID=' + QuotedStr(dblcdGuia.text);
                  DMALM.cdsQry.Close;
                  DMALM.cdsQry.DataRequest(xSQL);
                  DMALM.cdsQry.Open;

                  xSQL := 'Select A.CIAID, A.LOCID, A.ALMID, A.TDAID, A.NISAID, A.KDXID DODCID, '
                     + '          A.ARTID, A.NISATIP, '
                     + '          ARTCPROG PUNIT, ARTCPROU, A.ARTPCU, A.ARTPCG, A.ARTPVU, A.ARTPVG, '
                     + DMALM.wReplacCeros + '(KDXCNTG,0) CANT, KDXCNTG, '
                     + DMALM.wReplacCeros + '(KDXCNTU,0), KDXPEDIDOG, KDXPEDIDOU, KDXSALDOG, KDXSALDOU, A.ARTCONT, ''G'' TPMED, A.UNMIDG, A.UNMIDU, A.GRARID, '
                     + '          A.FABID, A.ARTSPRO, A.ARTSCA, A.ARTPARA, A.ARTSNA, A.ARTFUC, A.TMONID, A.ARTCRGO, A.CUENTAID, A.TINID, A.PROV, A.DOCID, TRIID, '
                     + '          ODCID, CCOSID, NISASOLIC, NISAFREG, NISANDOC, NISAFDOC, KDXUSER, KDXFREG, A.FLAGVAR, CALID, DODCID, B.ARTDES DET, '
                     + '          KDXNREQ, A.FAMID, A.SFAMID, CUENTA2ID, KDXCVTAS, TIPPRESID, PARPRESID, ARTMORIPCG, ARTMORIPCU, TCAMB ODCTCAMB, '
                     + '          SITUACION, NISAATERQS, NISSIT, ACFREG, A.FNSERIE, A.ARTACTIVO '
                     + '     from LOG315 A, TGE205 B '
                     + '    where A.CIAID=' + QuotedStr(dblcCIA.text) + ' AND A.TINID=' + QuotedStr(dblcTIN.text) + ' '
                     + '      and A.LOCID=' + QuotedStr(dblcLOC.text) + ' AND ALMID=' + QuotedStr(dblcTALM.text) + ' AND NISATIP=' + QuotedStr('SALIDA') + ' '
                     + '      and NISAID=' + QuotedStr(dblcdGuia.text) + ' '
                     + '      and A.CIAID=B.CIAID '
                     + '      and A.TINID=B.TINID '
                     + '      and A.ARTID=B.ARTID';
                  DMALM.cdsSQL.Filter := '';
                  DMALM.cdsSQL.Filtered := false;
                  DMALM.cdsSQL.IndexFieldNames := '';
                  DMALM.cdsSQL.Close;
                  DMALM.cdsSQL.DataRequest(xSQL);
                  DMALM.cdsSQL.Open;

                  xSQL := 'Select ARTID, SUM(' + DMALM.wReplacCeros + '(KDXCNTG,0)) CANTO '
                     + '     from LOG315 '
                     + '    where CIAID=' + QuotedStr(dblcCIA.text) + ' '
                     + '      and LOCID=' + QuotedStr(dblcLOC.text) + ' '
                     + '      and TINID=' + QuotedStr(dblcTIN.text) + ' '
                     + '      and ALMID=' + QuotedStr(dblcTALM.text) + ' '
                     + '      and NISATIP=''INGRESO'' '
                     + '      and NISANDOC=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISANDOC').AsString) + ' '
                     + '    group BY ARTID';
                  DMALM.cdsKDXTemp.Close;
                  DMALM.cdsKDXTemp.DataRequest(xSQL);
                  DMALM.cdsKDXTemp.Open;
                  If DMALM.cdsKDXTemp.RecordCount > 0 Then
                  Begin
                     If DMALM.cdsSQL.IndexFieldNames <> 'ARTID' Then
                        DMALM.cdsSQL.IndexFieldNames := 'ARTID';

                     DMALM.cdsKDXTemp.First;
                     While Not DMALM.cdsKDXTemp.Eof Do
                     Begin
                        DMALM.cdsSQL.SetKey;
                        DMALM.cdsSQL.Fieldbyname('ARTID').AsString := DMALM.cdsKDXTemp.FieldByName('ARTID').AsString;
                        If DMALM.cdsSQL.Gotokey Then
                        Begin
                           DMALM.cdsSQL.Edit;
                           DMALM.cdsSQL.FieldByName('CANT').AsFloat := DMALM.FRound((DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat - DMALM.cdsKDXTemp.FieldByName('CANTO').AsFloat), 15, 4);
                           DMALM.cdsSQL.Post;
                        End;
                        DMALM.cdsKDXTemp.Next;
                     End;
                     DMALM.cdsSQL.IndexFieldNames := '';
                  End;

                  If (xNSalxDevPed) And (xIndicaSalxConsig) Then
                  Begin
                     DMALM.cdsSQL.Filter := 'CANT>0';
                     DMALM.cdsSQL.Filtered := true;
                  End;

                  DMALM.cdsSQL.First;
                  If (xNSalxDevPed) And Not (xIndicaSalxConsig) Then
                  Begin
                     If DMALM.cdsKDX.RecordCount = 0 Then
                        While Not DMALM.cdsSQL.EOF Do
                        Begin
                           If DMALM.cdsSQL.FieldByName('CANT').AsFloat > 0 Then
                           Begin
                              DMALM.cdsKDX.Insert;
                              DMALM.cdsKDX.FieldByName('CIAID').AsString := dblcCIA.text;
                              DMALM.cdsKDX.FieldByName('LOCID').AsString := dblcLOC.text;
                              DMALM.cdsKDX.FieldByName('TINID').AsString := dblcTIN.text;
                              DMALM.cdsKDX.FieldByName('ALMID').AsString := dblcTALM.text;
                              DMALM.cdsKDX.FieldByName('TDAID').AsString := dblcTDA.text;
                              DMALM.cdsKDX.FieldByName('ARTID').AsString := DMALM.cdsSQL.FieldByName('ARTID').AsString;
                              DMALM.cdsKDX.FieldByName('KDXID').AsString := DMALM.cdsSQL.FieldByName('DODCID').AsString;
                              DMALM.cdsKDX.FieldByName('NISAID').AsString := DMALM.cdsNIA.FieldByName('NISAID').AsString;
                              DMALM.cdsKDX.FieldByName('KDXFREG').AsDateTime := DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime;
                              DMALM.cdsKDX.FieldByName('DOCID').AsString := DMALM.cdsNIA.FieldByName('DOCID').AsString;
                              DMALM.cdsKDX.FieldByName('TMONID').AsString := DMALM.cdsSQL.FieldByName('TMONID').AsString;
                              DMALM.cdsKDX.FieldByName('KDXPEDIDOG').AsFloat := 0;
                              DMALM.cdsKDX.FieldByName('KDXPEDIDOU').AsFloat := 0;
                              DMALM.cdsKDX.FieldByName('KDXCNTG').AsFloat := DMALM.FRound(DMALM.cdsSQL.FieldByName('CANT').AsFloat, 15, 4);
                              DMALM.cdsKDX.FieldByName('KDXCNTU').AsFloat := 0;
                              DMALM.cdsKDX.FieldByName('GRARID').AsString := DMALM.cdsSQL.FieldByName('GRARID').AsString;
                              DMALM.cdsKDX.FieldByName('FAMID').AsString := DMALM.cdsSQL.FieldByName('FAMID').AsString;
                              DMALM.cdsKDX.FieldByName('SFAMID').AsString := DMALM.cdsSQL.FieldByName('SFAMID').AsString;
                              DMALM.cdsKDX.FieldByName('ARTCONT').AsFloat := DMALM.cdsSQL.FieldByName('ARTCONT').AsFloat;
                              DMALM.cdsKDX.FieldByName('UNMIDG').AsString := DMALM.cdsSQL.FieldByName('UNMIDG').AsString;
                              DMALM.cdsKDX.FieldByName('UNMIDU').AsString := DMALM.cdsSQL.FieldByName('UNMIDU').AsString;
                              DMALM.cdsKDX.FieldByName('FABID').AsString := DMALM.cdsSQL.FieldByName('FABID').AsString;
                              DMALM.cdskdx.FieldByName('ARTSPRO').AsString := DMALM.cdsSQL.FieldByName('ARTSPRO').AsString;
                              DMALM.cdsKDX.FieldByName('ARTSCA').AsString := DMALM.cdsSQL.FieldByName('ARTSCA').AsString;
                              DMALM.cdsKDX.FieldByName('ARTPARA').AsString := DMALM.cdsSQL.FieldByName('ARTPARA').AsString;
                              DMALM.cdsKDX.FieldByName('ARTSNA').AsString := DMALM.cdsSQL.FieldByName('ARTSNA').AsString;
                              DMALM.cdsKDX.FieldByName('FNSERIE').AsString := DMALM.cdsSQL.FieldByName('FNSERIE').AsString;
                              DMALM.cdsKDX.FieldByName('ARTFUC').AsDateTime := dbdtpFNS.date;
                              DMALM.cdsKDX.FieldByName('ARTDES').AsString := DMALM.cdsSQL.FieldByName('DET').AsString;
                              DMALM.cdsKDX.FieldByName('ARTCRGO').AsFloat := DMALM.cdsSQL.FieldByName('ARTCRGO').AsFloat;
                              DMALM.cdsKDX.FieldByName('ARTACTIVO').AsString := DMALM.cdsSQL.FieldByName('ARTACTIVO').AsString;
                              DMALM.cdsKDX.FieldByName('CUENTAID').AsString := DMALM.cdsSQL.FieldByName('CUENTAID').AsString;
                              DMALM.cdsKDX.FieldByName('NISSIT').AsString := 'INICIAL';
                              DMALM.cdsKDX.FieldByName('ARTPCG').AsString := floatToStr(DMALM.FRound(DMALM.cdsSQL.FieldByName('PUNIT').AsFloat, 15, 5));
                              DMALM.cdsKDX.FieldByName('ARTPCU').AsString := floatToStr(DMALM.FRound(DMALM.cdsSQL.FieldByName('ARTCPROU').AsFloat, 15, 5));
                              DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsString := floatToStr(DMALM.FRound(DMALM.cdsSQL.FieldByName('PUNIT').AsFloat, 15, 5));
                              DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsString := floatToStr(DMALM.FRound(DMALM.cdsSQL.FieldByName('ARTCPROU').AsFloat, 15, 5));

                              DMALM.cdsKDX.FieldByName('ARTPVG').AsFloat := 0;
                              DMALM.cdsKDX.FieldByName('ARTPVU').AsFloat := 0;

                              DMALM.cdsKDX.FieldByName('KDXSALDOG').AsFloat := 0;
                              DMALM.cdsKDX.FieldByName('KDXSALDOU').AsFloat := 0;

                              DMALM.cdsKDX.FieldByName('ARTTOTALG').AsFloat := 0;
                              DMALM.cdsKDX.FieldByName('ARTTOTALU').AsFloat := 0;
                              DMALM.cdsKDX.FieldByName('ARTTOTAL').AsFloat := 0;

                              DMALM.cdsKDX.FieldByName('TCAMB').AsFloat := DMALM.FRound(DMALM.cdsSQL.FieldByName('ODCTCAMB').AsFloat, 15, 4);
                              DMALM.cdsKDX.FieldByName('PROV').AsString := '';
                              DMALM.cdsKDX.FieldByName('TRIID').AsString := DMALM.cdsNIA.FieldByName('TRIID').AsString;
                              DMALM.cdsKDX.FieldByName('CCOSID').AsString := DMALM.cdsNIA.FieldByName('CCOSID').AsString;
                              DMALM.cdsKDX.FieldByName('NISATIP').AsString := DMALM.cdsNIA.FieldByName('NISATIP').AsString;
                              DMALM.cdsKDX.FieldByName('NISASOLIC').AsString := DMALM.cdsNIA.FieldByName('NISASOLIC').AsString;
                              DMALM.cdsKDX.FieldByName('NISAFREG').AsDateTime := DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime;
                              DMALM.cdsKDX.FieldByName('NISANDOC').AsString := DMALM.cdsNIA.FieldByName('NISANDOC').AsString;
                              DMALM.cdsKDX.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsNIA.FieldByName('NISAFDOC').AsDateTime;

                              DMALM.cdsKDX.FieldbyName('KDXUSER').AsString := DMALM.wUsuario;
                              DMALM.cdsKDX.FieldbyName('KDXANO').AsString := DMALM.cdsNIA.FieldByName('NISAANO').AsString;
                              DMALM.cdsKDX.FieldbyName('KDXMM').AsString := DMALM.cdsNIA.FieldByName('NISAMES').AsString;
                              DMALM.cdsKDX.FieldbyName('KDXDD').AsString := DMALM.cdsNIA.FieldByName('NISADIA').AsString;
                              DMALM.cdsKDX.FieldbyName('KDXANOMM').AsString := DMALM.cdsNIA.FieldByName('NISAANOMES').AsString;
                              DMALM.cdsKDX.FieldbyName('KDXTRI').AsString := DMALM.cdsNIA.FieldByName('NISATRIM').AsString;
                              DMALM.cdsKDX.FieldbyName('KDXSEM').AsString := DMALM.cdsNIA.FieldByName('NISASEM').AsString;
                              DMALM.cdsKDX.FieldbyName('KDXSS').AsString := DMALM.cdsNIA.FieldByName('NISASS').AsString;
                              DMALM.cdsKDX.FieldbyName('KDXAATRI').AsString := DMALM.cdsNIA.FieldByName('NISAAATRI').AsString;
                              DMALM.cdsKDX.FieldbyName('KDXAASEM').AsString := DMALM.cdsNIA.FieldByName('NISAAASEM').AsString;
                              DMALM.cdsKDX.FieldbyName('KDXAASS').AsString := DMALM.cdsNIA.FieldByName('NISAAASS').AsString;

                              DMALM.cdsKDX.FieldbyName('KDXFREG').AsDateTime := Date;

                              DMALM.cdsKDX.FieldbyName('KDXHREG').AsDateTime := Date + SysUtils.Time;

                              DMALM.cdsKDX.FieldbyName('CUENTA2ID').AsString := wCuenta;
                              DMALM.cdsKDX.FieldbyName('KDXCVTAS').AsString := wTricvtas;

                              DMALM.cdsKDX.Post;
                           End;
                           DMALM.cdsSQL.Next;
                           Screen.Cursor := crHourGlass;
                        End;
                  End;
               End
               Else
               Begin // Si es Ingreso sin Ningun documento (Selecciona Desde el Maestro de Articuos)
                  Screen.Cursor := crHourGlass;
                  xSQL := 'Select * '
                     + '     from TGE205 '
                     + '    where CIAID=' + QuotedStr(dblcCIA.Text)
                     + '      and TINID=' + QuotedStr(dblcTIN.Text)
                     + '      and NVL(ARTEST,''A'')=''H'' '
                     + '    order by ARTID';
                  DMALM.cdsArti.Close;
                  DMALM.cdsArti.DataRequest(xSQL);
                  DMALM.cdsArti.Open;
                  Screen.Cursor := crDefault;
               End;

         Screen.Cursor := crHourGlass;
         If Not DMALM.cdsTRAN.Active Then
         Begin
            sSQL := 'Select TRIID, TRIDES, TRIABR, TRISGT, TRIRQM, TRIRQD, TRIVLD, '
               + '          TRIPRCL, TRITRRS, TRISTAT, TDAID, TRICC, TRIPV, TRIOC, '
               + '          TRITMOV, TRITRDES, TRITDODES, CUENTAID, TRICVTAS, '
               + '          TRIFLAGV, TRICERO, TRINSAL, TRIDEVPED, TRIGENFACT, '
               + '          TRICONSIG, TRICLIEN, TRIASIEN, TRINCRE, TRITITGRAT, '
               + '          TRIPREP, TRIDEVFACT, TRICONSUMO, TRINSERIE, TRIINGDEV, '
               + '          TRITRANSEQ, TRIEQUI, TRIDEVCSG, TRIACTURQ, TRICOSREPO, '
               + '          CTADEBE, CTAHABER, ACTCOSPRO '
               + '     from TGE208 '
               + '    where TRISGT=''I''';
            DMALM.cdsTRAN.Close;
            DMALM.cdsTRAN.DataRequest(sSQL);
            DMALM.cdsTRAN.Open;
         End;
         Screen.Cursor := crDefault;
         If Not xNSalxDevPed Then
            Z2dbgDReqsIButtonClick(sender);
         wFlagIns := False;
      Except
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error al actualizar la Nota de Ingreso (pase de Cabecera a Detalle)');
         Screen.Cursor := crDefault;
         exit;
      End;
   End;

   If Z2bbtnNuevo.Visible Then
      Z2bbtnCanc2.Enabled := False
   Else
      Z2bbtnCanc2.Enabled := True;
   Z2bbtnGraba.Enabled := true;
   Z2bbtnAceptar.Enabled := false;
   Z2bbtnNuevo.Enabled := false;

   DMALM.DCOM1.AppServer.GrabaTransaccion;
End;

Procedure TFRegNtaE.dbcldArtiExit(Sender: TObject);
Var
   ConUnitaria, SPrecSug: Boolean;
   sSQL, sTmp, UMedUni, PreSugG, PreSugU: String;
Begin
   If Z2bbtnRegCanc.Focused Then Exit;
   If DMALM.wAnchoArt > 0 Then
   Begin
      If Length(dbcldArti.Text) < DMALM.wAnchoArt Then
      Begin
         dbcldArti.Text := DMALM.StrZero(dbcldArti.Text, DMALM.wAnchoArt);
      End;
   End;

   SPrecSug := Not xReqOCompra;

   sSQL := 'ARTID=' + quotedstr(dbcldArti.Text) + ' AND CIAID=' + quotedstr(dblcCIA.Text) + ' AND TINID=' + quotedstr(dblcTIN.Text);
   dbeArti.Text := Trim(DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES, ARTCONT, UNMIDG, UNMIDU, ARTPCG, ARTPCU, ARTEST', sSQL, 'ARTDES'));

   If Length(Trim(dbeArti.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' Articulo No Existe ');
      If Not pnlDetalleA.Visible Then Exit;
      dbcldArti.SetFocus;
      Exit;
   End;

   If DMALM.cdsQry.FieldByName('ARTEST').AsString <> 'H' Then
   Begin
      ShowMessage('Artículo No ESTA ACTIVO ');
      dbcldArti.SetFocus;
      Exit;
   End;

   xArtDes := dbeArti.Text;
   ConUnitaria := (DMALM.cdsQry.FieldByName('ARTCONT').AsString <> '1');
   sTmp := 'UNMID=' + quotedstr(DMALM.cdsQry.FieldByName('UNMIDG').AsString);
   UMedUni := DMALM.cdsQry.FieldByName('UNMIDU').AsString;
   PreSugG := DMALM.cdsQry.FieldByName('ARTPCG').AsString;
   PreSugU := DMALM.cdsQry.FieldByName('ARTPCU').AsString;

   lblMedGnrl.Caption := 'Med. Gnrl. ' + DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');
   If (SPrecSug) And (StrtoFloat(dbePrecioG.Text) = 0) Then
      dbePrecioG.Text := PreSugG;

   If ConUnitaria = True Then
   Begin
      sTmp := 'UNMID=' + quotedstr(UMedUni);
      lblMedUni.Caption := 'Med. Uni. ' + DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');
      If (SPrecSug) And (StrtoFloat(dbePrecioU.Text) = 0) Then
         dbePrecioU.Text := PreSugU;
   End;
   dbePrecioU.Enabled := ConUnitaria;
   dbeCantidadU.Enabled := ConUnitaria;
   If ConUnitaria = False Then
   Begin
      dbeCantidadU.Text := '0';
      dbePrecioU.Text := '0';
   End;
   dblcExist(sender);
End;

Procedure TFRegNtaE.dbeCantidadGExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If Z2bbtnRegCanc.Focused Then exit;
   If Length(Trim(dbeCantidadG.Text)) = 0 Then
      dbeCantidadG.Text := '0';
   If xNSalxDevPed Then
   Begin
      xSQL := 'TDAFLAGV=''S''';
      DMALM.DisplayDescrip('prvTGE', 'TGE157', 'TDAID', xSQL, 'TDAID');
      xSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' '
         + 'and LOCID=' + QuotedStr(dblcLOC.Text) + ' '
         + 'and TINID=' + QuotedStr(dblcTIN.Text) + ' '
         + 'and ALMID=' + QuotedStr(dblcTALM.Text) + ' '
         + 'and TDAID=' + QuotedStr(DMALM.cdsSQL.FieldByName('TDAID').AsString) + ' '
         + 'and NISAID=' + QuotedStr(DMALM.cdsNia.FieldByName('NISANDOC').AsString) + ' '
         + 'and ARTID=' + QuotedStr(dbcldArti.Text) + ' '
         + 'and NISATIP=''SALIDA''';

      DMALM.DisplayDescrip('prvTGE', 'LOG315', DMALM.wReplacCeros + '(KDXCNTG,0) KDXCNTG', xSQL, 'KDXCNTG');

      xSQL := 'Select ARTID, SUM(' + DMALM.wReplacCeros + '(KDXCNTG,0)) CANTO '
         + '     from LOG315 '
         + '    where CIAID=' + QuotedStr(dblcCIA.text) + ' '
         + '      and TINID=' + QuotedStr(dblcTIN.text) + ' '
         + '      and LOCID=' + QuotedStr(dblcLOC.text) + ' '
         + '      and ALMID=' + QuotedStr(dblcTALM.text) + ' '
         + '      and ARTID=' + QuotedStr(dbcldArti.Text) + ' '
         + '      and NISATIP=''INGRESO'' '
         + '      and NISAID<>' + QuotedStr(dbeNumNISA.Text) + ' '
         + '      and NISANDOC=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISANDOC').AsString) + ' '
         + '    group BY ARTID';
      DMALM.cdsKDXTemp.Close;
      DMALM.cdsKDXTemp.DataRequest(xSQL);
      DMALM.cdsKDXTemp.Open;

      If (StrToFloat(dbeCantidadG.Text) + DMALM.cdsKDXTemp.FieldByName('CANTO').AsFloat) >
         DMALM.cdsQry.FieldByName('KDXCNTG').AsFloat Then
      Begin
         ErrorMsg('Modulo de Compras', 'La Cantida Ingresada Excede a la Cantidad del Saldo de la Guia, Que es de : ' +
            FloattoStr(DMALM.cdsQry.FieldByName('KDXCNTG').AsFloat));
         dbeCantidadG.SetFocus;
      End;
   End;
End;

Procedure TFRegNtaE.dbePrecioGEnter(Sender: TObject);
Begin
   wPrecioTemp := (sender As TwwDBEdit).text;
End;

Procedure TFRegNtaE.dbePrecioGExit(Sender: TObject);
Var
   PrecioMaes, PrecioMas, PrecioMenos, Precio, ContD: Double;
   ContS, sWhere: String;
Begin
   If Z2bbtnRegCanc.Focused Then exit;
   If (wCTRL_PCG = 'S') And (xNSalxDevPed = False) Then
   Begin
      Precio := StrToFloat(dbePrecioG.text);
      PrecioMas := Precio * (1 + StrtoFloat(wReg_Porc));
      PrecioMenos := Precio * (1 - StrtoFloat(wReg_Porc));
      sWhere := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND TINID=' + quotedstr(dblcTIN.Text) + ' AND ARTID=' + quotedstr(dbcldArti.Text);
      ContS := DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT, ARTPCG, ARTEST ', sWhere, 'ARTCONT');
      PrecioMaes := DMALM.cdsQry.FieldByName('ARTPCG').AsFloat;
      If (PrecioMaes > PrecioMas) Or (PrecioMaes < PrecioMenos) Then
      Begin
         ErrorMsg(Caption, ' Verifique Precio de Compra ');
      End;
      If ContS = '' Then
      Begin
         ErrorMsg(Caption, ' Articulo No Existe ');
         Exit;
      End;

      If DMALM.cdsQry.FieldByName('ARTEST').AsString <> 'H' Then
      Begin
         ErrorMsg(Caption, ' Artículo No ESTA ACTIVO ');
         dbcldArti.SetFocus;
         Exit;
      End;

      ContD := StrToFloat(ContS);
      If VarIsNull(ContD) Then
         ContD := 0;
      If (ContD > 1) Then
         dbePrecioU.Text := FloatToStr(Precio / ContD);
   End
   Else
   Begin
      If wPrecioTemp <> (sender As TwwDBEdit).text Then
      Begin
         Precio := StrToFloat(dbePrecioG.text);
         sWhere := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND TINID=' + quotedstr(dblcTIN.Text) + ' AND ARTID=' + quotedstr(dbcldArti.Text);
         ContS := DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT, ARTEST', sWhere, 'ARTCONT');
         If ContS = '' Then
         Begin
            ErrorMsg(Caption, ' Articulo no Existe ');
            Exit;
         End;

         If DMALM.cdsQry.FieldByName('ARTEST').AsString <> 'H' Then
         Begin
            ErrorMsg(Caption, ' Artículo No ESTA ACTIVO ');
            dbcldArti.SetFocus;
            Exit;
         End;

         ContD := StrToFloat(ContS);
         If VarIsNull(ContD) Then
            ContD := 0;
         If (ContD > 1) Then
            dbePrecioU.Text := FloatToStr(Precio / ContD);
      End;
   End;
End;

Procedure TFRegNtaE.dblcConcAlmExit(Sender: TObject);
Begin
   edtConcAlm.text := DMALM.DisplayDescrip('prvTGE', 'TGE168', 'CALDESC', 'CALID=' + quotedstr(dblcConcAlm.text), 'CALDESC');
End;

Procedure TFRegNtaE.dbePrecioUExit(Sender: TObject);
Var
   Precio, ContD: Double;
   ContS, sWhere: String;
Begin
   Precio := StrToFloat(dbePrecioU.text);
   If VarIsNull(precio) Then
      precio := 0;
   sWhere := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND TINID=' + quotedstr(dblcTIN.Text) + ' AND ARTID=' + quotedstr(dbcldArti.Text);
   ContS := DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT, ARTEST', sWhere, 'ARTCONT');
   If ContS = '' Then
   Begin
      ErrorMsg(Caption, ' Artículo no Existe ');
      Exit;
   End;

   If DMALM.cdsQry.FieldByName('ARTEST').AsString <> 'H' Then
   Begin
      ErrorMsg(Caption, ' Artículo No ESTA ACTIVO ');
      dbcldArti.SetFocus;
      Exit;
   End;

   ContD := StrToFloat(ContS);
   If VarIsNull(ContD) Then
      ContD := 0;
   dbePrecioG.Text := FloatToStr(Precio * ContD);
End;

Procedure TFRegNtaE.Z2bbtnRegOkClick(Sender: TObject);
Const
   sODCIDSel: String = '';
   sDODCIDSel: String = '';
Var
   sFCH, sCIA, sTIN, sART, sALM, sLOC, sNISA, sWhere, sTDA, sTmp, CadResult, sODCID, sSQL: String;
   dFECHAR: TDateTime;
   lExiste {, lEsta}: Boolean;
   fSum, Contenido, CantidadArt: Double;
Begin
   If trim(dbeCantidadG.text) = '' Then
      dbeCantidadG.text := '0.0';
   If trim(dbeCantidadU.text) = '' Then
      dbeCantidadU.text := '0.0';
   If trim(dbePrecioG.text) = '' Then
      dbePrecioG.text := '0.0';
   If trim(dbePrecioU.text) = '' Then
      dbePrecioU.text := '0.0';
   If ((StrToFloat(fRegNtaE.dbeCantidadG.Text) = 0) And
      (StrToFloat(fRegNtaE.dbeCantidadU.Text) = 0)) Then
   Begin
      ErrorMsg('Error', 'La cantidad Ingresada no puede ser CERO!!!');
      exit;
   End;
   If (dbcldArti.Text = '') Or (Trim(dbeArti.Text) = '') Then
   Begin
      ErrorMsg('Error', 'El código del Artículo es Obligatorio');
      dbcldArti.SetFocus;
      Exit;
   End;
 // Los Precios pueden ser ceros, según parámetro en archivo de Transacciones (TGE208)
   If Not xPermiteValorCero Then
   Begin
      If (strtofloat(dbePrecioG.Text) = 0) And (strtofloat(dbePrecioU.Text) = 0) Or
         (strtofloat(dbePrecioG.Text) < 0) And (strtofloat(dbePrecioU.Text) < 0) Then
      Begin
         ErrorMsg('Error', ' El Precio debe ser Mayor a CERO !!!');
         Exit;
      End;
   End;
 // Siempre que el oc es requerido, verificar que los articulos existan en las
 // ordenes de compra pendientes por proveedor o las ordenes de compra a la
 // cual se le quiere dar atención
   Screen.Cursor := crHourGlass;
   sART := dbcldArti.Text;
   sCIA := DMALM.cdsNIA.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsNIA.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIA.FieldByName('TINID').AsString;
   sALM := DMALM.cdsNIA.FieldByName('ALMID').AsString;
   sNISA := DMALM.cdsNIA.FieldByName('NISAID').AsString;
   sTDA := DMALM.cdsNIA.FieldByName('TDAID').AsString;
   dFECHAR := DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime;

   If xReqOCompra Then
   Begin
      sODCID := DMALM.cdsKDX.FieldByName('ODCID').AsString;
   // aqui se debe sumarizar los articulos y verificar que el articulo ingresado
   // sea menor o igual a la suma
      fSum := 0;
      sWhere := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND TINID=' + quotedstr(dblcTIN.Text) + ' AND ARTID=' + quotedstr(dbcldArti.Text);
      DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT,ARTEST', sWhere, 'ARTCONT');
      If DMALM.cdsQRY.FieldByName('ARTEST').AsString <> 'H' Then
      Begin
         ShowMessage('Artículo No está ACTIVO');
         exit;
      End;
      Contenido := DMALM.cdsQRY.FieldByName('ARTCONT').AsFloat;
      DMALM.cdsOCNIA.DisableControls;
      DMALM.cdsOCNIA.First;
      sCIA := DMALM.cdsOCNIA.FieldByName('CIAID').AsString;
      While Not DMALM.cdsOCNIA.eof Do
      Begin
         sWhere := 'CIAID=''' + sCIA + ''' and ODCID=''' + sODCID + ''' and ARTID =''' + sART + '''';
         CadResult := 'SUM(' + DMALM.wReplacCeros + '(DODCCNT,0) * ' + FloatToStr(Contenido) + ' + ' + DMALM.wReplacCeros + '(DODCCNTU,0)) AS xSUM';
         sTmp := DMALM.DisplayDescrip('prvTGE', 'LOG305', CadResult, sWhere, 'xSUM');
         DMALM.dsOCNIA.OnDataChange := dsOCNIADataChange;
         If length(sTmp) > 0 Then
            fSum := fSum + StrToFloat(sTmp);
         DMALM.cdsOCNIA.Next;
      End;
      CantidadArt := StrToFloat(dbeCantidadG.Text) * Contenido + StrToFloat(dbeCantidadU.Text);
      If CantidadArt > fSum Then
      Begin
         Screen.Cursor := crDefault;
         If Not Question('Confirmar', 'La Cantidad a Ingresar Excede al Total de la Orden de Compra !!!!' +
            'Desea Dar ingreso al Articulo ?...') Then
            Exit;
      End;
      sODCID := DMALM.cdsNIA.FieldByName('DOCID').AsString;
   End
   Else
   Begin
   // validar que no se ingresen detalles en caso de no ser con orden de compra
      If iEstado = 0 Then
         lExiste := DMALM.cdsKDX.Locate('CIAID;TINID;ALMID;ARTID;TDAID;NISAID;LOCID', VarArrayOf([sCIA, sTIN, sALM, sART, sTDA, sNISA, sLOC]), [])
      Else
         lExiste := False;
      If lExiste Then // localizar el valor....
      Begin
         Screen.Cursor := crDefault;
         ErrorMsg('Error', 'No pueden existir artículos duplicados...');
         Exit; // salir del procedimiento
      End;
   End;
   Screen.Cursor := crHourGlass;
   DMALM.cdsOCNIA.EnableControls;
   If iEstado = 0 Then {Guardar los datos del detalle }
      DMALM.cdsKDX.Insert
   Else
      DMALM.cdsKDX.Edit;
   sSQL := 'ARTID=''' + sART + ''' AND CIAID= ''' + sCIA + ''' AND TINID=''' + sTIN + '''';
   DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTID, GRARID, FAMID, SFAMID, TINID, ARTCONT, UNMIDG, UNMIDU, FABID, ARTSPRO, ARTSCA, ' +
      'ARTPARA, ARTPARA, ARTFUC, ARTCRGO, TMONID, ARTACTIVO, CUENTAID, FNSERIE', sSQL, 'ARTID'); // Para tomar los datos del M. de Articulos
 {+----------------------------------------------------------------------------+
 |                     GENERANDO MOVIMIENTO DEL ARTICULO                      |
 |     1. Insertar o adicionar registros del movieiento de los artículos      |
 |     se usa Displaydes.. por que cuando editas es posible que no estes Ubi. |
 +----------------------------------------------------------------------------+}
   If (DMALM.wModo = 'A') or (DMALM.wModo = 'M') Then
//   If DMALM.cdsKDX.State In [dsInsert, dsEdit] Then
   Begin
      Try
         DMALM.cdsKDX.FieldByName('CIAID').AsString := sCIA;
         DMALM.cdsKDX.FieldByName('LOCID').AsString := sLOC;
         DMALM.cdsKDX.FieldByName('TINID').AsString := sTIN;
         DMALM.cdsKDX.FieldByName('ALMID').AsString := sALM;
         DMALM.cdsKDX.FieldByName('TDAID').AsString := sTDA;
         DMALM.cdsKDX.FieldByName('ARTID').AsString := sART;
         DMALM.cdsKDX.FieldByName('KDXID').AsString := dbeItem.Text;
         DMALM.cdsKDX.FieldByName('NISAID').AsString := DMALM.cdsNIA.FieldByName('NISAID').AsString;
         DMALM.cdsKDX.FieldByName('KDXFREG').AsDateTime := dFECHAR;
         DMALM.cdsKDX.FieldByName('KDXPEDIDOG').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('KDXPEDIDOU').AsFloat := 0;

         DMALM.cdsKDX.FieldByName('KDXSALDOG').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('KDXSALDOU').AsFloat := 0;

         DMALM.cdsKDX.FieldByName('ARTTOTALG').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('ARTTOTALU').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('ARTTOTAL').AsFloat := 0;

         DMALM.cdsKDX.FieldByName('ARTPVU').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('ARTPVG').AsFloat := 0;

         DMALM.cdsKDX.FieldByName('KDXCNTG').AsFloat := strToFloat(dbeCantidadG.Text);
         DMALM.cdsKDX.FieldByName('KDXCNTU').AsFloat := strToFloat(dbeCantidadU.Text);
         DMALM.cdsKDX.FieldByName('GRARID').AsString := DMALM.cdsQry.FieldByName('GRARID').AsString;
         DMALM.cdsKDX.FieldByName('FAMID').AsString := DMALM.cdsQry.FieldByName('FAMID').AsString;
         DMALM.cdsKDX.FieldByName('SFAMID').AsString := DMALM.cdsQry.FieldByName('SFAMID').AsString;
         DMALM.cdsKDX.FieldByName('ARTCONT').AsFloat := DMALM.cdsQry.FieldByName('ARTCONT').AsFloat;
         DMALM.cdsKDX.FieldByName('UNMIDG').AsString := DMALM.cdsQry.FieldByName('UNMIDG').AsString;
         DMALM.cdsKDX.FieldByName('UNMIDU').AsString := DMALM.cdsQry.FieldByName('UNMIDU').AsString;
         DMALM.cdsKDX.FieldByName('FABID').AsString := DMALM.cdsQry.FieldByName('FABID').AsString;
         DMALM.cdskdx.FieldByName('ARTSPRO').AsString := DMALM.cdsQry.FieldByName('ARTSPRO').AsString;
         DMALM.cdsKDX.FieldByName('ARTSCA').AsString := DMALM.cdsQry.FieldByName('ARTSCA').AsString;
         DMALM.cdsKDX.FieldByName('ARTPARA').AsString := DMALM.cdsQry.FieldByName('ARTPARA').AsString;
         DMALM.cdsKDX.FieldByName('ARTSNA').AsString := DMALM.cdsQry.FieldByName('ARTPARA').AsString;
         DMALM.cdsKDX.FieldByName('FNSERIE').AsString := DMALM.cdsQry.FieldByName('FNSERIE').AsString;
         DMALM.cdsKDX.FieldByName('ARTFUC').AsDateTime := dbdtpFNS.date;
         DMALM.cdsKDX.FieldByName('ARTCRGO').AsFloat := DMALM.cdsQry.FieldByName('ARTCRGO').AsFloat;
         DMALM.cdsKDX.FieldByName('ARTACTIVO').AsString := DMALM.cdsQry.FieldByName('ARTACTIVO').AsString;
         DMALM.cdsKDX.FieldByName('CUENTAID').AsString := DMALM.cdsQry.FieldByName('CUENTAID').AsString;
         DMALM.cdsKDX.FieldByName('NISSIT').AsString := 'INICIAL';

         If xReqOCompra Then
         Begin
            sSQL := 'TMONID=' + quotedstr(DMALM.cdsKDX.FieldByName('TMONID').AsString);
            If DMALM.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', sSQL, 'TMON_LOC') = 'E' Then
            Begin
               sFCH := QuotedStr(FormatDateTime(DMALM.wFormatFecha, dbdtpFNS.Date));
               sSQL := 'SELECT ' + 'TCAM' + DMALM.wTipoCambioUsar + ' TCAMB FROM TGE107 WHERE ' + sSQL + ' AND FECHA = ' + DMALM.wRepFuncDate + sFCH + ')';
               DMALM.cdsReporte.Close;
               DMALM.cdsReporte.DataRequest(sSQL);
               DMALM.cdsReporte.Open;
               DMALM.cdsKDX.FieldByName('ARTPCG').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioG.text) * DMALM.cdsReporte.FieldByName('TCAMB').AsFloat, 15, 5));
               DMALM.cdsKDX.FieldByName('ARTPCU').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioU.text) * DMALM.cdsReporte.FieldByName('TCAMB').AsFloat, 15, 5));
               DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioG.text), 15, 5));
               DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioU.text), 15, 5));
               DMALM.cdsKDX.FieldByName('TCAMB').AsString := floatToStr(DMALM.FRound(DMALM.cdsReporte.FieldByName('TCAMB').AsFloat, 15, 5));
            End
            Else
            Begin
               DMALM.cdsKDX.FieldByName('ARTPCG').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioG.text), 15, 5));
               DMALM.cdsKDX.FieldByName('ARTPCU').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioU.text), 15, 5));
               DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioG.text), 15, 5));
               DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioU.text), 15, 5));
            End;
         End // Fin de si es con O. Compra
         Else
         Begin // Caso Contrario toma lo que tiene en el TGE205, si esta en blanco asume Soles
            DMALM.cdsKDX.FieldByName('TMONID').AsString := DMALM.cdsQry.FieldByName('TMONID').AsString;
            If length(DMALM.cdsQry.FieldByName('TMONID').AsString) = 0 Then
               DMALM.cdsKDX.FieldByName('TMONID').AsString := 'N';
            DMALM.cdsKDX.FieldByName('ARTPCG').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioG.text), 15, 5));
            DMALM.cdsKDX.FieldByName('ARTPCU').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioU.text), 15, 5));
            DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioG.text), 15, 5));
            DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsString := floatToStr(DMALM.FRound(strToFloat(dbePrecioU.text), 15, 5));
         End;

         DMALM.cdsKDX.FieldByName('PROV').AsString := DMALM.cdsNIA.FieldByName('PROV').AsString;
         DMALM.cdsKDX.FieldByName('TRIID').AsString := DMALM.cdsNIA.FieldByName('TRIID').AsString;
         DMALM.cdsKDX.FieldByName('CCOSID').AsString := DMALM.cdsNIA.FieldByName('CCOSID').AsString;
         DMALM.cdsKDX.FieldByName('NISATIP').AsString := DMALM.cdsNIA.FieldByName('NISATIP').AsString;
         DMALM.cdsKDX.FieldByName('NISASOLIC').AsString := DMALM.cdsNIA.FieldByName('NISASOLIC').AsString;
         DMALM.cdsKDX.FieldByName('NISAFREG').AsDateTime := DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime;
         DMALM.cdsKDX.FieldByName('NISANDOC').AsString := DMALM.cdsNIA.FieldByName('NISANDOC').AsString;
         DMALM.cdsKDX.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsNIA.FieldByName('NISAFDOC').AsDateTime;
         DMALM.cdsKDX.FieldbyName('KDXUSER').AsString := DMALM.wUsuario;
         DMALM.cdsKDX.FieldbyName('KDXANO').AsString := DMALM.cdsNIA.FieldByName('NISAANO').AsString;
         DMALM.cdsKDX.FieldbyName('KDXMM').AsString := DMALM.cdsNIA.FieldByName('NISAMES').AsString;
         DMALM.cdsKDX.FieldbyName('KDXDD').AsString := DMALM.cdsNIA.FieldByName('NISADIA').AsString;
         DMALM.cdsKDX.FieldbyName('KDXANOMM').AsString := DMALM.cdsNIA.FieldByName('NISAANOMES').AsString;
         DMALM.cdsKDX.FieldbyName('KDXTRI').AsString := DMALM.cdsNIA.FieldByName('NISATRIM').AsString;
         DMALM.cdsKDX.FieldbyName('KDXSEM').AsString := DMALM.cdsNIA.FieldByName('NISASEM').AsString;
         DMALM.cdsKDX.FieldbyName('KDXSS').AsString := DMALM.cdsNIA.FieldByName('NISASS').AsString;
         DMALM.cdsKDX.FieldbyName('KDXAATRI').AsString := DMALM.cdsNIA.FieldByName('NISAAATRI').AsString;
         DMALM.cdsKDX.FieldbyName('KDXAASEM').AsString := DMALM.cdsNIA.FieldByName('NISAAASEM').AsString;
         DMALM.cdsKDX.FieldbyName('KDXAASS').AsString := DMALM.cdsNIA.FieldByName('NISAAASS').AsString;
         DMALM.cdsKDX.FieldbyName('KDXFREG').AsDateTime := Date;
         DMALM.cdsKDX.FieldbyName('KDXHREG').AsDateTime := Date + SysUtils.Time;
         DMALM.cdsKDX.FieldbyName('CUENTA2ID').AsString := wCuenta;
         DMALM.cdsKDX.FieldbyName('KDXCVTAS').AsString := wTricvtas;
         DMALM.cdsKDX.FieldbyName('ARTDES').AsString := xArtDes;
         DMALM.cdsKDX.Post;
         dbgDKDX.RefreshDisplay;
         OnOffDetalle(True); // Activar Detalle
         If DMALM.cdsSQL.RecordCount > 0 Then
         Begin
            If (Length(Trim(edNOrdC.Text)) > 0) Or (xReqCCosto) Then
               DMALM.cdsSQL.delete
            Else
               If (xIndicaSalxConsig) Then
                  DMALM.cdsSQL.delete;

            If DMALM.cdsSQL.RecordCount = 0 Then
               pnlNIxOC.Visible := False;
         End
         Else
         Begin
            If (Length(Trim(edNOrdC.Text)) > 0) Or (xReqCCosto) Then
               pnlNIxOC.Visible := False
            Else
               If (xIndicaSalxConsig) Then
                  pnlNIxOC.Visible := False;

         End;
         pnlDetalleA.Visible := False;
         btnDetalle;
      Except
         On E: Exception Do EHandlerError(E);
      End;
   End;
   dbeArti.Text := '';
   edtConcAlm.text := '';
   Z2dbgDReqsIButton.Click;
   Screen.Cursor := crDefault;
End;

Procedure TFRegNtaE.Z2bbtnRegCancClick(Sender: TObject);
Begin
   If wFlagIns Then
      DMALM.cdsKDX.Delete;

   dbeArti.Text := '';
   edtConcAlm.text := '';
   OnOffDetalle(True); // activar detalle
   pnlDetalleA.Visible := False;
End;

//----------------------------------------------------------------------//
//     Procedimientos relacionados con el proceso de O.C. a N.I.        //
//----------------------------------------------------------------------//

Procedure TFRegNtaE.z2bbtnOkNIOCClick(Sender: TObject);
Var
   sCIA, sTIN, sALM, sLOC, sNISA, sTDA, sODCID: String;
   dFechaR: tdatetime;
   sSQL: String;
   lExiste: Boolean;
Begin
   If DMALM.cdsSQL.RecordCount = 0 Then
   Begin
      errormsg(Caption, ' No Existe Registros para Transferir ');
      Exit;
   End;
   Screen.Cursor := crHourGlass;

   sCIA := dblcCIA.text;
   sLOC := dblcLOC.text;
   sTIN := dblcTIN.text;
   sALM := dblcTALM.text;
   sNISA := dbeNumNISA.Text;
   sTDA := dblcTDA.Text;
   dFECHAR := dbdtpFNS.Date;
   sODCID := '';

   If (iEstado = 0) Then
   Begin
      If Length(Trim(DMALM.cdsSQL.fieldbyname('ODCID').asString)) > 0 Then
         lExiste := DMALM.cdsKDX.Locate('ODCID;DODCID;ARTID', VarArrayOf([
            DMALM.cdsSQL.fieldbyname('ODCID').asString,
               DMALM.cdsSQL.fieldbyname('DODCID').asString,
               DMALM.cdsSQL.fieldbyname('ARTID').asString]), [])
      Else
         lExiste := DMALM.cdsKDX.Locate('ARTID', VarArrayOf([
            DMALM.cdsSQL.fieldbyname('ARTID').asString]), [])
   End
   Else
      lExiste := False;
   If lExiste Then
   Begin
      ErrorMsg(Caption, 'Esta O. de Compra, con el Articulo ya se Encuentra en el Kardex' + #13 + #13 +
         ' No pueden existir O. de Compra y Articulos duplicadas...');
      Screen.Cursor := crDefault;
      Exit;
   End;
   DMALM.cdsKDX.Insert;
   If xNSalxDevPed Then
      DMALM.cdsKDX.FieldByName('KDXID').AsString := DMALM.cdsSQL.fieldbyname('DODCID').asString
   Else
      DMALM.cdsKDX.FieldByName('KDXID').AsString := DMALM.StrZero(DMALM.MaxValue('KDXID', DMALM.cdsKDX), 3);

   DMALM.cdsKDX.FieldByName('CIAID').AsString := sCIA;
   DMALM.cdsKDX.FieldByName('LOCID').AsString := sLOC;
   DMALM.cdsKDX.FieldByName('TINID').AsString := sTIN;
   DMALM.cdsKDX.FieldByName('ALMID').AsString := sALM;
   DMALM.cdsKDX.FieldByName('TDAID').AsString := sTDA;
   DMALM.cdsKDX.FieldByName('NISAID').AsString := sNISA;
   DMALM.cdsKDX.FieldByName('ARTTOTALG').AsFloat := 0;
   DMALM.cdsKDX.FieldByName('ARTTOTALU').AsFloat := 0;
   DMALM.cdsKDX.FieldByName('ARTTOTAL').AsFloat := 0;
   DMALM.cdsKDX.FieldByName('ARTPVU').AsFloat := 0;
   DMALM.cdsKDX.FieldByName('ARTPVG').AsFloat := 0;
   DMALM.cdsKDX.FieldByName('ARTID').AsString := DMALM.cdsSQL.fieldbyname('ARTID').asString;

   If xNSalxDevPed Then
      DMALM.cdsKDX.FieldByName('KDXFREG').AsDateTime := DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime
   Else
      DMALM.cdsKDX.FieldByName('KDXFREG').AsDateTime := dFechaR;
   DMALM.cdsKDX.FieldByName('KDXPEDIDOG').AsFloat := 0;
   DMALM.cdsKDX.FieldByName('KDXPEDIDOU').AsFloat := 0;
   If DMALM.cdsSQL.fieldbyname('TPMED').asstring = 'G' Then
   Begin
      DMALM.cdsKDX.FieldByName('KDXCNTG').AsString := floatToStr(RoundD(DMALM.cdsSQL.fieldbyname('CANT').asFloat, 5));
      If bIngIgv Then
         DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsString := floatToStr(RoundD(DMALM.cdsSQL.fieldbyname('PUNITATN').asFloat, 5))
      Else
         DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsString := floatToStr(RoundD(DMALM.cdsSQL.fieldbyname('PUNIT').asFloat, 5));
      DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsFloat := 0;
   End
   Else
   Begin
      DMALM.cdsKDX.FieldByName('KDXCNTU').AsString := floatToStr(RoundD(DMALM.cdsSQL.fieldbyname('CANT').asFloat, 5));
      DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsFloat := 0;
      If DMALM.wCredFiscal Then
         DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsString := floatToStr(RoundD(DMALM.cdsSQL.fieldbyname('PUFIS').asFloat, 5))
      Else
         DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsString := floatToStr(RoundD(DMALM.cdsSQL.fieldbyname('PUNIT').asFloat, 5));
   End;
   DMALM.cdsKDX.FieldByName('ODCID').AsString := DMALM.cdsSQL.fieldbyname('ODCID').asString;
   DMALM.cdsKDX.FieldByName('DODCID').AsString := DMALM.cdsSQL.fieldbyname('DODCID').asString;
   DMALM.cdsKDX.FieldByName('TMONID').AsString := DMALM.cdsSQL.fieldbyname('TMONID').asString;
   DMALM.cdsKDX.FieldByName('TCAMB').AsString := floatToStr(RoundD(DMALM.cdsSQL.fieldbyname('ODCTCAMB').asFloat, 5));

   sSQL := 'Select * '
      + '     from TGE205 '
      + '    where CIAID=' + quotedstr(sCIA)
      + '      and ARTID=' + quotedstr(DMALM.cdsSQL.fieldbyname('ARTID').asString)
      + '      and TINID=' + quotedstr(dblcTIN.Text);
   DMALM.FiltraCDS(DMALM.cdsArti, sSQL);
   DMALM.cdsKDX.FieldByName('GRARID').AsString := DMALM.cdsArti.FieldByName('GRARID').AsString;
   DMALM.cdsKDX.FieldByName('FAMID').AsString := DMALM.cdsArti.FieldByName('FAMID').AsString;
   DMALM.cdsKDX.FieldByName('SFAMID').AsString := DMALM.cdsArti.FieldByName('SFAMID').AsString;
   DMALM.cdsKDX.FieldByName('ARTCONT').AsFloat := DMALM.cdsArti.FieldByName('ARTCONT').AsFloat;
   DMALM.cdsKDX.FieldByName('UNMIDG').AsString := DMALM.cdsArti.FieldByName('UNMIDG').AsString;
   DMALM.cdsKDX.FieldByName('UNMIDU').AsString := DMALM.cdsArti.FieldByName('UNMIDU').AsString;
   DMALM.cdsKDX.FieldByName('FABID').AsString := DMALM.cdsArti.FieldByName('FABID').AsString;
   DMALM.cdskdx.FieldByName('ARTSPRO').AsString := DMALM.cdsArti.FieldByName('ARTSPRO').AsString;
   DMALM.cdsKDX.FieldByName('ARTSCA').AsString := DMALM.cdsArti.FieldByName('ARTSCA').AsString;
   DMALM.cdsKDX.FieldByName('ARTPARA').AsString := DMALM.cdsArti.FieldByName('ARTPARA').AsString;
   DMALM.cdsKDX.FieldByName('ARTSNA').AsString := DMALM.cdsArti.FieldByName('ARTPARA').AsString;
   DMALM.cdsKDX.FieldByName('ARTFUC').AsDateTime := dbdtpFNS.date;
   DMALM.cdsKDX.FieldByName('ARTCRGO').AsFloat := DMALM.cdsArti.FieldByName('ARTCRGO').AsFloat;
   DMALM.cdsKDX.FieldByName('ARTACTIVO').AsString := DMALM.cdsArti.FieldByName('ARTACTIVO').AsString;
   DMALM.cdsKDX.FieldByName('CUENTAID').AsString := DMALM.cdsArti.FieldByName('CUENTAID').AsString;
   DMALM.cdsKDX.FieldbyName('ARTDES').AsString := DMALM.cdsArti.FieldByName('ARTDES').AsString;

   DMALM.cdsKDX.FieldByName('PROV').AsString := DMALM.cdsNIA.FieldByName('PROV').AsString;
   DMALM.cdsKDX.FieldByName('DOCID').AsString := DMALM.cdsNIA.FieldByName('DOCID').AsString;
   DMALM.cdsKDX.FieldByName('TRIID').AsString := DMALM.cdsNIA.FieldByName('TRIID').AsString;
   DMALM.cdsKDX.FieldByName('CCOSID').AsString := DMALM.cdsNIA.FieldByName('CCOSID').AsString;
   DMALM.cdsKDX.FieldByName('NISATIP').AsString := DMALM.cdsNIA.FieldByName('NISATIP').AsString;
   DMALM.cdsKDX.FieldByName('NISASOLIC').AsString := DMALM.cdsNIA.FieldByName('NISASOLIC').AsString;
   DMALM.cdsKDX.FieldByName('NISAFREG').AsDateTime := DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime;
   DMALM.cdsKDX.FieldByName('NISANDOC').AsString := DMALM.cdsNIA.FieldByName('NISANDOC').AsString;
   DMALM.cdsKDX.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsNIA.FieldByName('NISAFDOC').AsDateTime;
   DMALM.cdsKDX.FieldByName('NISSIT').AsString := 'INICIAL';

   DMALM.cdsKDX.FieldbyName('KDXUSER').AsString := DMALM.wUsuario;

   DMALM.cdsKDX.FieldbyName('KDXANO').AsString := DMALM.cdsNIA.FieldByName('NISAANO').AsString;
   DMALM.cdsKDX.FieldbyName('KDXMM').AsString := DMALM.cdsNIA.FieldByName('NISAMES').AsString;
   DMALM.cdsKDX.FieldbyName('KDXDD').AsString := DMALM.cdsNIA.FieldByName('NISADIA').AsString;
   DMALM.cdsKDX.FieldbyName('KDXANOMM').AsString := DMALM.cdsNIA.FieldByName('NISAANOMES').AsString;
   DMALM.cdsKDX.FieldbyName('KDXTRI').AsString := DMALM.cdsNIA.FieldByName('NISATRIM').AsString;
   DMALM.cdsKDX.FieldbyName('KDXSEM').AsString := DMALM.cdsNIA.FieldByName('NISASEM').AsString;
   DMALM.cdsKDX.FieldbyName('KDXSS').AsString := DMALM.cdsNIA.FieldByName('NISASS').AsString;
   DMALM.cdsKDX.FieldbyName('KDXAATRI').AsString := DMALM.cdsNIA.FieldByName('NISAAATRI').AsString;
   DMALM.cdsKDX.FieldbyName('KDXAASEM').AsString := DMALM.cdsNIA.FieldByName('NISAAASEM').AsString;
   DMALM.cdsKDX.FieldbyName('KDXAASS').AsString := DMALM.cdsNIA.FieldByName('NISAAASS').AsString;

   DMALM.cdsKDX.Post;
   dbgDKDX.RefreshDisplay; //dbg asociado a cdskdx
   dbgDKDXDblClick(sender); // Aqui me jala lo del KDX
   dblcConcAlm.Text := '';
   edtConcAlm.Text := '';
   If xReqOCompra Then
   Begin
      dbePrecioG.Enabled := False;
      dbePrecioU.Enabled := False;
   End
   Else
   Begin
      dbePrecioG.Enabled := True;
      dbePrecioU.Enabled := True;
   End;
   pnlDetalleA.Left := 103;
   pnlDetalleA.Top := 344;
   pnlDetalleA.Visible := true;
   pnlDetalleA.SetFocus;
   wFlagIns := True;
   Screen.Cursor := crDefault;
End;

Procedure TFRegNtaE.z2bbtnCancNIOCClick(Sender: TObject);
Begin
   pnlNIxOC.Visible := false;
   OnOffDetalle(true); // Desactivar el panel de detalle;
End;

Procedure TFRegNtaE.Z2dbgDReqsIButtonClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   iEstado := 0;
   If (Length(Trim(edNOrdC.Text)) > 0) Or
      (Length(Trim(dblcdNSal.Text)) > 0) Or
      (xNSalxDevPed) Then
   Begin
      pnlNIxOC.BringToFront;
      pnlNIxOC.Left := 80;
      pnlNIxOC.Height := 268;
      pnlNIxOC.Top := 264;
      pnlNIxOC.Width := 641;
      If (xNSalxDevPed) And (xIndicaSalxConsig) Then
         stxNIxOC.Caption := 'Articulos existentes en la Guia x Consig. seleccionada'
      Else
         stxNIxOC.Caption := 'Articulos existentes en la Ordenes de Compra seleccionados';

      OnOffDetalle(False);
      btnDetalle;
      If DMALM.cdsSQL.RecordCount > 0 Then
      Begin
         dbgNIxOC.DataSource := DMALM.dsSQL;
         pnlNIxOC.Visible := True;
      End
      Else
         z2bbtnCancNIOC.Click;
   End
   Else
      If Length(Trim(edNOrdC.Text)) = 0 Then
      Begin
         dbeCantidadG.Text := '0';
         dbeCantidadU.Text := '0';
         dbePrecioG.Text := '0';
         dbePrecioU.Text := '0';
         dbcldArti.Clear;
         dbeArti.Clear;
         dblcConcAlm.Clear;
         dbeItem.Text := DMALM.StrZero(DMALM.MaxValue('KDXID', DMALM.cdsKDX), 3);
         SelectOC := 0;
         pnlDetalleA.BringToFront;
         dbcldArti.Enabled := True;
         If xReqOCompra Then
         Begin
            dbePrecioG.Enabled := False;
            dbePrecioU.Enabled := False;
         End
         Else
         Begin
            dbePrecioG.Enabled := True;
            dbePrecioU.Enabled := True;
         End;
         pnlDetalleA.Left := 103;
         pnlDetalleA.Top := 344;
         pnlDetalleA.Visible := True;
         dbcldArti.SetFocus;
         OnOffDetalle(False); // Desactivar el panel de detalle
         btnDetalle;
      End;
   Screen.Cursor := crDefault;
End;

Procedure TFRegNtaE.Z2bbtnRegresaClick(Sender: TObject);
Begin
   If DMALM.cdsNia.FieldByName('NISSIT').AsString = 'ACEPTADO' Then
   Begin
      Information(Caption, 'La Nota de Ingreso ya a sido Aceptada');
      Exit;
   End;
   If DMALM.cdsKDX.RecordCount > 0 Then
      dblcTransac.Enabled := False
   Else
      dblcTransac.Enabled := True;
   DMALM.cdsNIA.Edit;
   DMALM.cdsSQL.Filter := '';
   DMALM.cdsSQL.Filtered := false;
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;

   OnOffCabecera(True);
   OnOffDetalle(False);
End;

Procedure TFRegNtaE.Z2bbtnGrabaClick(Sender: TObject);
Var
   sSQL, xRequiereSerie: String;
Begin
   Screen.Cursor := crHourGlass;

   DMALM.DCOM1.AppServer.IniciaTransaccion;

   xSQL := ' delete from LOG315 '
      + '     Where CIAID = ' + quotedstr(DMALM.cdsNIA.FieldByName('CIAID').AsString)
      + '       and ALMID = ' + quotedstr(DMALM.cdsNIA.FieldByName('ALMID').AsString)
      + '       and LOCID = ' + quotedstr(DMALM.cdsNIA.FieldByName('LOCID').AsString)
      + '       and TINID = ' + quotedstr(DMALM.cdsNIA.FieldByName('TINID').AsString)
      + '       and NISATIP=' + quotedstr(DMALM.cdsNIA.FieldByName('NISATIP').AsString)
      + '       and NISAID = ' + quotedstr(DMALM.cdsNIA.FieldByName('NISAID').AsString);
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Error al Actualizar Datos del detalle de la Nota de Ingreso');
      Screen.Cursor := crDefault;
      exit;
   End;

   DMALM.cdsKDX.DisableControls;
   DMALM.cdsKDX.First;
   While Not DMALM.cdsKDX.Eof Do
   Begin
      xSQL := ' Insert into LOG315( CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, KDXID, NISSIT, '
         + '                        PROV,DOCID,TRIID,ARTID,ARTPCU,ARTPCG,ARTPVU,ARTPVG,KDXCNTG,KDXCNTU,KDXPEDIDOG,KDXPEDIDOU, '
         + '                        KDXSALDOG,KDXSALDOU,ARTCONT,UNMIDG,UNMIDU,GRARID,FABID,ARTSPRO,ARTSCA,ARTPARA,ARTSNA,ARTFUC,TMONID, '
         + '                        ARTCRGO,ARTACTIVO,CUENTAID,ODCID,CCOSID,NISASOLIC,NISAFREG,NISANDOC,NISAFDOC,KDXUSER,KDXFREG,KDXHREG,KDXANO,KDXMM, '
         + '                        KDXDD,KDXTRI,KDXSEM,KDXSS,KDXANOMM,KDXAATRI,KDXAASEM,KDXAASS,FLAGVAR,CALID,DODCID,ARTDES,KDXNREQ,FAMID,SFAMID, '
         + '                        CUENTA2ID,KDXCVTAS,ARTMORIPCG,ARTMORIPCU,TCAMB,SITUACION,NISAATERQS,FNSERIE,ACFREG,ARTTOTALG,ARTTOTALU,ARTTOTAL, '
         + '                        KDXFLAG,PROVRUC,COSREPO,CLAUXID,COSARTFAC,IMPNOTCRE) '
         + '    Values( ' + quotedstr(DMALM.cdsKDX.fieldbyname('CIAID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('LOCID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('TINID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ALMID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('TDAID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISAID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISATIP').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISSIT').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('PROV').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('DOCID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('TRIID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTID').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTPCU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTPCG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTPVU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTPVG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXCNTG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXCNTU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXPEDIDOG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXPEDIDOU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXSALDOG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXSALDOU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTCONT').AsFloat) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('UNMIDG').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('UNMIDU').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('GRARID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('FABID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTSPRO').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTSCA').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTPARA').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTSNA').AsString) + ', '
         + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('ARTFUC').AsDateTime)) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('TMONID').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTCRGO').AsFloat) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTACTIVO').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('CUENTAID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ODCID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('CCOSID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISASOLIC').AsString) + ', '
         + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('NISAFREG').AsDateTime)) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISANDOC').AsString) + ', '
         + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('NISAFDOC').AsDateTime)) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXUSER').AsString) + ', '
         + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('KDXFREG').AsDateTime)) + ', '
         + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('KDXHREG').AsDateTime)) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXANO').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXMM').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXDD').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXTRI').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXSEM').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXSS').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXANOMM').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXAATRI').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXAASEM').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXAASS').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('FLAGVAR').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('CALID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('DODCID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTDES').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXNREQ').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('FAMID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('SFAMID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('CUENTA2ID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXCVTAS').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTMORIPCG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTMORIPCU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('TCAMB').AsFloat) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('SITUACION').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISAATERQS').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('FNSERIE').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ACFREG').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTTOTALG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTTOTALU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTTOTAL').AsFloat) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXFLAG').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('PROVRUC').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('COSREPO').AsFloat) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('CLAUXID').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('COSARTFAC').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('IMPNOTCRE').AsFloat) + ') ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error al Insertar Datos del detalle de la Nota de Salida - LOG315');
         Screen.Cursor := crDefault;
         exit;
      End;

      DMALM.cdsKDX.Next;
   End;
   DMALM.cdsKDX.EnableControls;
   DMALM.DCOM1.AppServer.GrabaTransaccion;
   DMALM.cdsKDX.DisableControls;
   DMALM.cdsKDX.First;
   While Not DMALM.cdsKDX.EOF Do
   Begin
      sSQL := 'CIAID=' + QuotedStr(dblcCIA.text)
         + ' and TINID=' + QuotedSTr(dblcTIN.text)
         + ' and ARTID=' + QuotedStr(DMALM.cdsKDX.FieldByName('ARTID').AsString);
      DMALM.DisplayDescrip('prvTGE', 'TGE205', 'FNSERIE,MARCA,MODELO,COLOR,ARTACTIVO', sSQL, 'FNSERIE');
      ChequeaSerieCodBar;
      If wSerieCodBar <> '' Then
      Begin
         sSQL := ' Select * '
            + '      from LOG332 '
            + '     where CIAID   = ' + QuotedStr(dblcCIA.text)
            + '       and LOCID   = ' + QuotedStr(dblcLOC.text)
            + '       and TINID   = ' + QuotedStr(dblcTIN.text)
            + '       and ALMID   = ' + QuotedStr(dblcTALM.text)
            + '       and TDAID   = ' + QuotedStr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
            + '       and NISATIP = ' + QuotedStr(DMALM.cdsNIA.FieldByName('NISATIP').AsString)
            + '       and NISAID  = ' + QuotedStr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
            + '       and ARTID   = ' + Quotedstr(DMALM.cdsKDX.FieldByName('ARTID').AsString)
            + '     order by ITEM';
         DMALM.cdsKdxSerie.Close;
         DMALM.cdsKdxSerie.DataRequest(sSQL);
         DMALM.cdsKdxSerie.Open;

         If VerificaNumerodeSerie Then
         Begin
            Screen.Cursor := crDefault;
            If wSerieCodBar = '1' Then ShowMessage('Número de Serie es Obligatorio');
            If wSerieCodBar = '2' Then ShowMessage('Código de Barra es Obligatorio');
            If wSerieCodBar = '3' Then ShowMessage('Serie y Barra son Obligatorios');
            pnlNumeSerie.Left := 4;
            pnlNumeSerie.Top := 239;
            pnlNumeSerie.Visible := True;
            DMALM.cdsKDX.EnableControls;
            exit;
         End
         Else
         Begin
            bbtnOKSerieClick(self);
            If (wDupErrorSer = '1') Or (wDupErrorBar = '1') Or (wDupErrorBar = '2') Then
            Begin
               DMALM.cdsKDX.EnableControls;
               Screen.Cursor := crDefault;
               exit;
            End;
         End;
      End;
      DMALM.cdsKDX.Next;
      DMALM.cdsKDX.EnableControls;
   End;

   btnDetalle;

   Z2bbtnRegresa.Enabled := true;
   Z2bbtnCanc2.Enabled := False;
   Z2bbtnGraba.Enabled := False;
   Z2bbtnNuevo.Enabled := True;

   Z2bbtnAceptar.Enabled := True;
   wOperacion := 'MOD';
   xNIngElim := '';
   Screen.Cursor := crDefault;

End;

{********************************
Actualiza la tabla de control de stock,
las cantidades y montos del maestro de articulos
y el flag de aceptado de la tabla de nota de ingreso
********************************}

Procedure TFRegNtaE.Z2bbtnAceptarClick(Sender: TObject);
Var
   DFechar: TDateTime;
   sSQLMonto, sKDXArt: WideString;
   wPasa, Ano, Mes, sCIA, sART, sALM, sLOC, sTIN, xSQL, xItem: String;
   Contenido: Double;
   xConta1, xNumMax: Integer;
Begin

   If (DMALM.cdsNia.FieldByName('NISSIT').AsString = 'ACEPTADO') Then
   Begin
      Information('Observación', 'La Nota ya ha sido Aceptada');
      exit;
   End;

   If (DMALM.cdsKDX.RecordCount = 0) Then
   Begin
      Information(Caption, ' No se Puede Aceptar este Documento porque No tiene Detalle Registrado ');
      exit;
   End;
   If Not Question(Caption, ' Este Proceso: ' + #13 + #13 +
      ' Acepta la Nota de Ingreso ' + #13 + #13 + #13 + ' ¿Desea continuar? ') Then
   Begin
      Exit;
   End;

   wPasa := '0';
   pnlActuali.Visible := true;
   pnlActuali.Refresh;
   Screen.Cursor := crHourGlass;
   sKDXArt := '';
   dFECHAR := DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime;
   sCIA := DMALM.cdsNIA.FieldByName('CIAID').AsString;
   sALM := DMALM.cdsNIA.FieldByName('ALMID').AsString;
   sLOC := DMALM.cdsNIA.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIA.FieldByName('TINID').AsString;

   DecodeDate(dFECHAR, Y, M, D);
   Ano := IntToStr(Y);
   Mes := DMALM.StrZero(IntToStr(M), 2);

   ErrorCount := 0;
   DMALM.DCOM1.AppServer.IniciaTransaccion;

   Begin
      DMALM.cdsKDX.DisableControls;
      DMALM.cdsKDX.first;
      While Not DMALM.cdsKDX.Eof Do
      Begin
         sArt := DMALM.cdsKDX.FieldByName('ARTID').AsString;
         xSQL := 'Select CIAID, GRARID, ARTID, ARTDES, UNMIDG, UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA, ARTACTIVO, '
            + '          ARTCONT, ARTMNTG, ARTMNTU, ARTFUPRC, ARTCNTG, TMONID, ARTCRGO, CUENTAID, FAMID, SFAMID, '
            + '          ARTCNTU, ARTCPROG, ARTCPROU, ARTPCU, ARTPCG, ARTFUMV, ARTFUC, COSTOANT '
            + '     from TGE205 '
            + '    where CIAID=' + quotedstr(sCIA) + ' AND ARTID=' + quotedstr(sART);
         DMALM.cdsArtiStk.Close;
         DMALM.cdsArtiStk.DataRequest(xSQL);
         DMALM.cdsArtiStk.Open;
         If DMALM.cdsArtiStk.RecordCount = 1 Then
         Begin
            // Actualizo la Orden de compra si el ingreso es con orden de compra
            If xReqOCompra Then
            Begin
               xSql := 'Begin SP_ALM_ACT_ORDCOMP(''' + trim(dblcCIA.Text) + ''','
                  + '''' + DMALM.cdsKDX.FieldByname('Odcid').AsString + ''','
                  + '''' + DMALM.cdsKDX.FieldByname('Artid').AsString + ''','
                  + '''' + DMALM.cdsKDX.FieldByname('Kdxcntg').AsString + '''); End;';
               Try
                  DMALM.DCOM1.AppServer.EjecutaSQL(xsql);
               Except
                  DMALM.DCOM1.AppServer.RetornaTransaccion;
                  ShowMessage('Error 01 al actualizar Orden de Compra');
                  Screen.Cursor := crDefault;
                  Exit;
               End;
            End;

         // Actualizo los saldos de stock
            xSql := ' Declare VERROR VARCHAR2(1); '
               + '    Begin SP_ALM_ACT_STOCK_COSPRO_V2(' + quotedstr(trim(dblcCIA.Text)) + ','
               + quotedstr(trim(dblcTALM.Text)) + ','
               + quotedstr(DMALM.cdsKDX.FieldByname('ARTID').AsString) + ','
               + DMALM.cdsKDX.FieldByname('ARTPCG').AsString + ','
               + DMALM.cdsKDX.FieldByname('KDXCNTG').AsString + ','
               + 'trunc(to_date('+quotedstr(datetostr(DMALM.cdsKDX.FieldByname('NISAFREG').AsDateTime))+')),'
               + quotedstr(DMALM.wUsuario) + ','
               + quotedstr('I') + ','
               + quotedstr(DMALM.cdsKDX.FieldByname('TRIID').AsString) + ',VERROR);'
               + '    End;';
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
            Except
               DMALM.DCOM1.AppServer.RetornaTransaccion;
               ShowMessage('Error 02 al actualizar Stock');
               Screen.Cursor := crDefault;
               Exit;
            End;

         // Actualizo el Log332 si activo fijo
            xSql := 'Update LOG332 '
               + '      set NISSIT=''ACEPTADO'',NISIT=''ACEPTADO'' '
               + '    where CIAID=' + QuotedStr(dblcCIA.text)
               + '      and LOCID=' + QuotedStr(dblcLOC.text)
               + '      and TINID=' + QuotedStr(dblcTIN.text)
               + '      and ALMID=' + QuotedStr(dblcTALM.text)
               + '      and TDAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
               + '      and NISAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
               + '      and NISATIP=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISATIP').AsString)
               + '      and ARTID=' + QuotedStr(DMALM.cdsKdx.FieldByName('ARTID').AsString);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
            Except
               DMALM.DCOM1.AppServer.RetornaTransaccion;
               ShowMessage('Error 03 al actualizar Activo Fijo LOG332');
               Screen.Cursor := crDefault;
               Exit;
            End;

            SQLFiltro :=
               '   Select * '
               + '   from LOG315 '
               + '  where CIAID=' + quotedstr(dblcCIA.Text)
               + '    and LOCID=' + quotedstr(dblcLOC.Text)
               + '    and TINID=' + quotedstr(dblcTIN.Text)
               + '    and ALMID=' + quotedstr(dblcTALM.Text)
               + '    and TDAID=' + quotedstr(dblcTDA.Text)
               + '    and NISAID=' + quotedstr(dbeNumNISA.Text)
               + '    and ARTID=' + quotedstr(sArt)
               + '    and NISATIP=''INGRESO'' ';
            DMALM.cdsKDX.DataRequest(SQLFiltro);

            SQLFiltro :=
               '   Select * '
               + '   from TGE205 '
               + '  where CIAID=' + quotedstr(dblcCIA.Text)
               + '    and TINID=' + quotedstr(dblcTIN.Text)
               + '    and ARTID=' + quotedstr(sArt);
            DMALM.cdsArtiStk.DataRequest(SQLFiltro);
         End
         Else
         Begin
            DMALM.DCOM1.AppServer.RetornaTransaccion;
            ErrorMsg('Error Grave', 'No se encuentra el Articulo ' + sArt);
            wPasa := '1';
         End;
         DMALM.cdsKDX.next;
      End;

      If wPasa = '1' Then exit;

      xSql := 'Update LOG314 '
      + '      set NISSIT=''ACEPTADO'','
         + '          NISAFREG=' + quotedstr(datetostr(DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime)) + ','
         + '          SITFREG=trunc(sysdate), SITHREG=Sysdate, NISAUSER=' + quotedstr(DMALM.wUsuario)
         + '    where CIAID=' + quotedstr(Trim(dblcCIA.Text))
         + '      and LOCID=' + quotedstr(Trim(dblcLOC.Text))
         + '      and TINID=' + quotedstr(Trim(dblcTIN.Text))
         + '      and ALMID=' + quotedstr(Trim(dblcTALM.Text))
         + '      and TDAID=' + quotedstr(Trim(dblcTDA.Text))
         + '      and NISAID=' + quotedstr(Trim(dbeNumNISA.Text))
         + '      and NISATIP=''INGRESO'' ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
         If DMALM.wTipoAdicion = 'xFiltro' Then
         Begin
            DMALM.wModo := 'M';
            DMALM.ActualizaFiltro(mtx3000, DMALM.cdsNIA, DMALM.wModo);
         End;
      Except
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error 04  al actualizar del Estado de la Nota de ingreso - LOG314');
         Screen.Cursor := crDefault;
         Exit;
      End;

      xSql := 'Update LOG315 '
         + '      Set NISSIT=''ACEPTADO'','
         + '          NISAFREG=' + quotedstr(datetostr(DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime)) + ','
         + '          KDXFREG=trunc(sysdate), KDXHREG=Sysdate, KDXUSER=' + quotedstr(DMALM.wUsuario)
         + '    where CIAID=' + quotedstr(Trim(dblcCIA.Text))
         + '      and LOCID=' + quotedstr(Trim(dblcLOC.Text))
         + '      and TINID=' + quotedstr(Trim(dblcTIN.Text))
         + '      and ALMID=' + quotedstr(Trim(dblcTALM.Text))
         + '      and TDAID=' + quotedstr(Trim(dblcTDA.Text))
         + '      and NISAID=' + quotedstr(Trim(dbeNumNISA.Text))
         + '      and NISATIP=''INGRESO'' ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
      Except
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error  05 al actualizar del Estado de la Nota de ingreso - LOG315');
         Screen.Cursor := crDefault;
         Exit;
      End;

      Try
      // Si es con orden de compra actualiza datos referentes al estatus de la orden de compra
         If xReqOCompra Then DMALM.ActualizaEstadoOC(sCIA);
      Except
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error  06 al actualizar del Estado de la OC ');
         Screen.Cursor := crDefault;
         Exit;
      End;

      Z2bbtnAceptar.Enabled := False;
      Z2bbtnNuevo.Enabled := True;
      lblEstado1.Caption := 'ACEPTADO';
      pnlActuali.Visible := false;
      ShowMessage('Se actualizo el stock con exito');
      Screen.Cursor := crDefault;

      pnlActuali.Visible := false;
      Screen.Cursor := crDefault;
   End;

   DMALM.DCOM1.AppServer.GrabaTransaccion;
   DMALM.cdsNIA.Edit;
   DMALM.cdsNIA.FieldByName('NISSIT').AsString := 'ACEPTADO';
   If DMALM.wTipoAdicion = 'xFiltro' Then
   Begin
      DMALM.ActualizaFiltro(mtx3000, DMALM.cdsNIA, DMALM.wModo);
   End;

   Z2dbgDReqsIButton.Enabled := False;
   Z2bbtnGraba.Enabled := False;
End;

Procedure TFRegNtaE.Z2bbtnCanc2Click(Sender: TObject);
Var
   Xsql: String;
Begin
   If (wOperacion = 'ADD') And
      (trim(DMALM.cdsNIA.FieldByName('NISSIT').AsString) = 'INICIAL') And
      (Length(Trim(xNIngElim)) > 0) Then
   Begin
      DMALM.DCOM1.AppServer.IniciaTransaccion;

      xSql := 'Delete LOG318 '
         + '    where CIAID=' + quotedstr(Trim(dblcCIA.Text))
         + '      and LOCID=' + quotedstr(Trim(dblcLOC.Text))
         + '      and TINID=' + quotedstr(Trim(dblcTIN.Text))
         + '      and ALMID=' + quotedstr(Trim(dblcTALM.Text))
         + '      and TDAID=' + quotedstr(Trim(dblcTDA.Text))
         + '      and NISAID=' + quotedstr(Trim(xNIngElim));
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
      Except
         ShowMessage('Error al actualizar LOG318 ');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Exit;
      End;

      xSql := 'Delete LOG315 '
         + '    where CIAID=' + quotedstr(Trim(dblcCIA.Text))
         + '      and LOCID=' + quotedstr(Trim(dblcLOC.Text))
         + '      and TINID=' + quotedstr(Trim(dblcTIN.Text))
         + '      and ALMID=' + quotedstr(Trim(dblcTALM.Text))
         + '      and TDAID=' + quotedstr(Trim(dblcTDA.Text))
         + '      and NISAID=' + quotedstr(Trim(xNIngElim))
         + '      and NISATIP=''INGRESO'' ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
      Except
         ShowMessage('Error al actualizar LOG315 ');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Exit;
      End;

      Z2bbtnNuevoClick(Nil);
      DMALM.cdsNIA.CancelUpdates;
      DMALM.cdsKDX.CancelUpdates;
   End;
End;

Procedure TFRegNtaE.Z2bbtnPrintClick(Sender: TObject);
Var
   xSQL, sSQL, sCIA, sLOC, sTIN, sALM, sTDO, sNIN, sTip: String;
Begin

   Screen.Cursor := crHourGlass;
   sCIA := DMALM.cdsNIA.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsNIA.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIA.FieldByName('TINID').AsString;
   sALM := DMALM.cdsNIA.FieldByName('ALMID').AsString;
   sTDO := DMALM.cdsNIA.FieldByName('TDAID').AsString;
   sNIN := DMALM.cdsNIA.FieldByName('NISAID').AsString;
   sTIP := 'INGRESO';
   DMALM.ppRptNotaSE(sSQL, sCIA, sLOC, sTIN, sALM, sTDO, sNIN, sTip);
   ppDBCab.DataSource := DMALM.dsQry;
   DMALM.cdsSQL.IndexFieldNames := 'KDXID';
   ppdbOC.DataSource := DMALM.dsSQL;

// acceso al LOG332 para obtener codigos de barras
   DMALM.cdsKDXSerie.IndexFieldNames := 'KDXID';
   DMALM.cdsKDXSerie.MasterFields := 'KDXID';
   DMALM.cdsKDXSerie.MasterSource := DMALM.dsSQL;
   ppdbLOG332.DataSource := DMALM.dsKDXSerie;

   pprNiaEnt.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\NisaEnt.Rtm';
   Screen.Cursor := crDefault;
   pprNiaEnt.template.LoadFromFile;
   If cbDisenoRep.Checked Then
   Begin
      ppDisenoRep.Report := pprNiaEnt;
      ppDisenoRep.Show;
   End
   Else
   Begin
      pprNiaEnt.Print;
      pprNiaEnt.Stop;
      ppDBCab.DataSource := Nil;
      ppdbOC.DataSource := Nil;
      ppdbLOG332.DataSource := Nil;
      DMALM.cdsSQL.IndexFieldNames := '';
      DMALM.cdsSobrino.MasterSource := Nil;
      DMALM.cdsSobrino.MasterFields := '';
      DMALM.cdsSobrino.IndexFieldNames := '';
      DMALM.cdsKDXSerie.MasterFields := '';
      DMALM.cdsKDXSerie.MasterSource := Nil;
      DMALM.cdsKDXSerie.IndexFieldNames := '';
   End;
End;

Procedure TFRegNtaE.bbtnKDXSerieClick(Sender: TObject);
Var
   sSQL: String;
Begin
// Inicio HPC_201801_ALM
// Cambio de búsqueda del código de Cliente
   pnlDetalleG.Enabled := True;
// Fin HPC_201801_ALM

   sSQL := 'Select * '
      + '     from LOG332 '
      + '    where CIAID=' + QuotedStr(dblcCIA.text)
      + '      and LOCID=' + QuotedStr(dblcLOC.text)
      + '      and TINID=' + QuotedStr(dblcTIN.text)
      + '      and ALMID=' + QuotedStr(dblcTALM.text)
      + '      and TDAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
      + '      and NISAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
      + '      and NISATIP=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISATIP').AsString)
      + '      and ARTID=' + QuotedStr(DMALM.cdsKdx.FieldByName('ARTID').AsString)
      + '    order by ITEM';
   DMALM.cdsKdxSerie.Filtered := False;
   DMALM.cdsKdxSerie.Filter := '';
   DMALM.cdsKdxSerie.Close;
   DMALM.cdsKdxSerie.DataRequest(sSQL);
   DMALM.cdsKdxSerie.Open;

   If DMALM.cdsKDXSerie.RecordCount <= 0 Then
   Begin
      ShowMessage('No existen Registros que mostrar');
   End
   Else
   Begin
      If lblEstado1.caption = 'INICIAL' Then
      Begin
         dbgGridSerie.Selected.Clear;
         dbgGridSerie.Selected.Add('KDXID'#9'3'#9'N°'#9'T');
         dbgGridSerie.Selected.Add('ITEM'#9'3'#9'Itm'#9'T');
         dbgGridSerie.Selected.Add('ARTID'#9'8'#9'Artículo'#9'T');
         dbgGridSerie.Selected.Add('ARTDES'#9'20'#9'Descripción'#9'T');
         dbgGridSerie.Selected.Add('ACFSERIE'#9'20'#9'Serie'#9'F');
         dbgGridSerie.Selected.Add('MARCA'#9'20'#9'Marca'#9'F');
         dbgGridSerie.Selected.Add('MODELO'#9'20'#9'Modelo'#9'F');
         dbgGridSerie.Selected.Add('COLOR'#9'10'#9'Color'#9'F');
         dbgGridSerie.Selected.Add('CODBAR'#9'7'#9'Codigo~Barras'#9'F');
         dbgGridSerie.RedrawGrid;
      End
      Else
      Begin
         dbgGridSerie.Selected.Clear;
         dbgGridSerie.Selected.Add('KDXID'#9'3'#9'N°'#9'T');
         dbgGridSerie.Selected.Add('ITEM'#9'3'#9'Itm'#9'T');
         dbgGridSerie.Selected.Add('ARTID'#9'8'#9'Artículo'#9'T');
         dbgGridSerie.Selected.Add('ARTDES'#9'20'#9'Descripción'#9'T');
         dbgGridSerie.Selected.Add('ACFSERIE'#9'20'#9'Serie'#9'T');
         dbgGridSerie.Selected.Add('MARCA'#9'20'#9'Marca'#9'T');
         dbgGridSerie.Selected.Add('MODELO'#9'20'#9'Modelo'#9'T');
         dbgGridSerie.Selected.Add('COLOR'#9'10'#9'Color'#9'T');
         dbgGridSerie.Selected.Add('CODBAR'#9'7'#9'Codigo~Barras'#9'T');
         dbgGridSerie.RedrawGrid;
      End;
      pnlNumeSerie.Left := 4;
      pnlNumeSerie.Top := 239;
      pnlNumeSerie.visible := True;
   End;
End;

Procedure TFRegNtaE.Z2bbtnNuevoClick(Sender: TObject);
Var
   xSQL, sNUM, sCIA, sTIN, sALM, sTDA, sLOC: String;
Begin
   Screen.Cursor := crHourGlass;

   Try
      DMALM.DCOM1.AppServer.IniciaTransaccion;
      ELiminarNI;
   Except
      ShowMessage('Error al actualizar LOG314 ');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Exit;
   End;

   xSQL := 'SELECT * FROM TGE151 WHERE NVL(ACTIVO,''S'')=''S'' ';
   DMALM.cdsALM.Close;
   DMALM.cdsALM.DataRequest(xSQL);
   DMALM.cdsALM.open;

   xCia := DMALM.cdsNia.FieldByName('CIAID').AsString;
   xLoc := DMALM.cdsNia.FieldByName('LOCID').AsString;
   xTin := DMALM.cdsNia.FieldByName('TINID').AsString;
   xAlm := DMALM.cdsNia.FieldByName('ALMID').AsString;

   DMALM.cdsNIA.Insert;

   DMALM.cdsSQL.filter := '';
   DMALM.cdsSQL.filtered := false;
   DMALM.cdsSQL.Close;

   OnOffCabecera(True);
   OnOffDetalle(False);
   lblEstado;
   dblcCIA.Enabled := True;
   dblcLOC.enabled := True;
   dbeNumNISA.Enabled := True;
   dblcTALM.Enabled := True;
   dblcTIN.Enabled := True;
   dblcTransac.Enabled := True;
   dblcTDA.Enabled := True;
   dbdtpFNS.Enabled := True;
   dbeCIA.Text := '';
   dbeLOC.Text := '';
   dbeALM.Text := '';
   dbeTIN.Text := '';
   dbeTDNISA.Text := '';
   dbeTransac.Text := '';
   dbeCC.Text := '';
   dbeProv.Text := '';
   dbeTDOC.Text := '';
   dbeNDoc.Text := '';
   dbeTIN.Text := '';
   dbeLote.Text := '';
   dbePO.Text := '';
   dbeNP.Text := '';
   dbmObs.Text := '';
   dbeClie.Text := '';

   If DMALM.wModo = 'A' Then
//   If DMALM.cdsNIA.State In [dsInsert] Then
   Begin
      DMALM.cdsNia.FieldByName('CIAID').AsString := xCia;
      DMALM.cdsNia.FieldByName('LOCID').AsString := xLoc;
      DMALM.cdsNia.FieldByName('TINID').AsString := xTin;
      DMALM.cdsNia.FieldByName('ALMID').AsString := xAlm;

      dblcCIAExit(Nil);
      dblcLOCExit(Nil);
      dblcTINExit(Nil);
      dblcTALMExit(Nil);

      sCIA := DMALM.cdsNIA.FieldByName('CIAID').AsString;
      sALM := DMALM.cdsNIA.FieldByName('ALMID').AsString;
      sTDA := DMALM.cdsNIA.FieldByName('TDAID').AsString;
      sLOC := DMALM.cdsNIA.FieldByName('LOCID').AsString;
      sTIN := DMALM.cdsNIA.FieldByName('TINID').AsString;
      dblcTDAExit(Nil);
      sNUM := '';
      DMALM.cdsNIA.FieldByName('NISAID').AsString := sNUM;
      edNOrdC.Clear;
   End;

   DMALM.cdsKDX.EmptyDataSet;
   xSQL := 'SELECT * '
      + '  FROM LOG315 '
      + ' WHERE NISATIP=''NINGUNO'' ';
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(xSQL);
   DMALM.cdsKDX.Open;
   dbgDKDX.DataSource := DMALM.dsKDX;
   dbgDKDX.RefreshDisplay;
   Init(Nil);
   wOperacion := 'ADD';
   wRegraNro := '1ADD';
   btnDetalle;
   lblEstado1.Caption := 'INICIAL';
   DMALM.cdsNIA.FieldByName('NISSIT').AsString := 'INICIAL';
   DMALM.cdsNIA.FieldByName('NISATIP').AsString := 'INGRESO';
   Screen.Cursor := crDefault;
End;

Procedure TFRegNtaE.Z2bbtnSalirClick(Sender: TObject);
Begin
   Try
      DMALM.DCOM1.AppServer.IniciaTransaccion;
      ELiminarNI;
   Except
      ShowMessage('Error al actualizar LOG314 ');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Exit;
   End;

   DMALM.cdsNIA.CancelUpdates;
   If DMALM.cdsKDX.Active Then DMALM.cdsKDX.CancelUpdates;
   Close;
End;

Procedure TFRegNtaE.dbgDKDXDblClick(Sender: TObject);
Var
   sWhere, sTmp, UnmUni, UnmGnr: String;
   Uni: Boolean;
Begin
   If (DMALM.cdsNia.FieldByName('NISSIT').AsString = 'ACEPTADO') Or
      (DMALM.cdsNia.FieldByName('NISSIT').AsString = 'ANULADO') Then
   Begin
      ErrorMsg('Observación', 'La Nota ya ha sido Aceptado');
      exit;
   End;
   If DMALM.cdsKDX.recordcount = 0 Then
      exit;
   wFlagIns := False;
   OnOffDetalle(False); // Desactivar el panel de detalle
   dbeItem.Clear;
   dbcldArti.Clear;
   dbeArti.Clear;
   dbeItem.Text := DMALM.cdsKDX.FieldByName('KDXID').AsString;
   dbcldArti.Text := DMALM.cdsKDX.FieldByName('ARTID').AsString;
   dbeCantidadG.Text := DMALM.cdsKDX.FieldByName('KDXCNTG').AsString;
   dbeCantidadU.Text := DMALM.cdsKDX.FieldByName('KDXCNTU').AsString;
   dbePrecioG.Text := DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsString;
   dbePrecioU.Text := DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsString;

   sWhere := 'ARTID=' + quotedstr(dbcldArti.Text) + ' AND CIAID=' + quotedstr(dblcCIA.Text) + ' AND TINID=' + quotedstr(dblcTIN.Text);
   dbeArti.Text := Trim(DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES, ARTCONT, UNMIDG, UNMIDU', sWhere, 'ARTDES'));

   xArtDes := dbeArti.Text;
   dbcldArti.Enabled := False;

   Uni := (DMALM.cdsQry.FieldByName('ARTCONT').AsString <> '1');
   UnmGnr := DMALM.cdsQry.FieldByName('UNMIDG').AsString;
   UnmUni := DMALM.cdsQry.FieldByName('UNMIDU').AsString;

   sTmp := 'UNMID=' + quotedstr(UnmGnr);
   lblMedGnrl.Caption := 'Med. Gnrl. ' + DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');

   If Uni = True Then
   Begin
      sTmp := 'UNMID=' + quotedstr(UnmUni);
      lblMedUni.Caption := 'Med. Uni. ' + DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');
   End;
   dbeCantidadU.Enabled := Uni;
   dbePrecioU.Enabled := Uni;

   pnlDetalleA.BringToFront;
   If (xReqOCompra) Or
      (xNSalxDevPed) Then
   Begin
      dbePrecioG.Enabled := True;
      dbePrecioU.Enabled := True;
   End
   Else
   Begin
      dbePrecioG.Enabled := True;
      dbePrecioU.Enabled := True;
   End;
   pnlDetalleA.Left := 103;
   pnlDetalleA.Top := 344;
   pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
   iEstado := 1;
   btnDetalle;
End;

Procedure TFRegNtaE.AsigDat;
Var
   sSQL, sFecha: String;
   D, M, Y: Word;
Begin
   DecodeDate(dbdtpFNS.DateTime, Y, M, D);
   DMALM.cdsNIA.Edit;
   If wOperacion = 'ADD' Then
   Begin
      DMALM.cdsNIA.FieldbyName('NISATIP').AsString := 'INGRESO';
      DMALM.cdsNIA.FieldbyName('NISSIT').AsString := 'INICIAL';
      DMALM.cdsNIA.FieldbyName('NISAUSER').AsString := DMALM.wUsuario;

      sFecha := FormatDateTime(DMALM.wFormatFecha, dbdtpFNS.DateTime);
      sSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
      DMALM.FiltraCDS(DMALM.cdsPeriodo, sSQL);

      DMALM.cdsNIA.FieldbyName('NISAANO').AsString := IntToStr(Y);
      DMALM.cdsNIA.FieldbyName('NISAMES').AsString := DMALM.strzero(IntToStr(M), 2);
      DMALM.cdsNIA.FieldbyName('NISADIA').AsString := DMALM.strzero(IntToStr(D), 2);
      DMALM.cdsNIA.FieldbyName('NISAANOMES').AsString := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);
      DMALM.cdsNIA.FieldbyName('NISATRIM').AsString := DMALM.cdsPeriodo.fieldbyName('FECTRIM').asString;
      DMALM.cdsNIA.FieldbyName('NISASEM').AsString := DMALM.cdsPeriodo.fieldbyName('FECSEM').asString;
      DMALM.cdsNIA.FieldbyName('NISASS').AsString := DMALM.cdsPeriodo.fieldbyName('FECSS').asString;
      DMALM.cdsNIA.FieldbyName('NISAAATRI').AsString := DMALM.cdsPeriodo.fieldbyName('FECAATRI').asString;
      DMALM.cdsNIA.FieldbyName('NISAAASEM').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASEM').asString;
      DMALM.cdsNIA.FieldbyName('NISAAASS').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASS').asString;
      DMALM.cdsNIA.FieldbyName('NISANOMM').AsString := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);
   End;
   If length(trim(DMALM.cdsNIA.FieldbyName('NISAOBS').AsString)) = 0 Then
      DMALM.cdsNIA.FieldbyName('NISAOBS').AsString := '.';
   DMALM.cdsNIA.FieldbyName('NISAHREG').AsDateTime := Date + SysUtils.Time;

   If Length(Trim(wTriTMov)) > 0 Then
      DMALM.cdsNIA.FieldByName('NISTMOV').AsString := wTriTMov;
   If xReqOCompra Then
      DMALM.cdsNIA.FieldByName('ODCID').AsString := 'S'
   Else
      DMALM.cdsNIA.FieldByName('ODCID').AsString := 'N';
End;

Procedure TFRegNtaE.OnOffCabecera(Value: Boolean);
Begin
 // ....................... activar cabecera de requisición ...................
   pnlCabecera.Enabled := Value;
   Z2bbtnBorrar.Enabled := Value;
   Z2bbtnOK.Enabled := Value;
   bbtnLote.Enabled := Value;
End;

Procedure TFRegNtaE.OnOffDetalle(Value: Boolean);
Begin
 // ....................... activar detalle de requisición ....................
   If Value Then
      stxTitulo1.Color := clHighlight
   Else
      stxTitulo1.Color := clGray;

   pnlDetalleG.Enabled := Value;
   Z2bbtnCanc2.Enabled := Value;
   Z2bbtnGraba.Enabled := Value;
   Z2bbtnNuevo.Enabled := Value;
   Z2bbtnRegresa.Enabled := Value;
   If Value Then
      Z2bbtnNuevo.SetFocus;

   btnDetalle;
   If Z2dbgDReqsIButton.Enabled = False Then
   Begin
      Z2bbtnGraba.Enabled := False;
   End
   Else
   Begin
      Z2bbtnGraba.Enabled := True;
   End;
End;

Procedure TFRegNtaE.btnDetalle;
Var
   bDummy1: Boolean;
Begin
   bDummy1 := (DMALM.cdsKDX.RecordCount > 0) And
      ((DMALM.cdsNIA.ChangeCount > 0) Or
      (DMALM.cdsKDX.ChangeCount > 0) Or
      (DMALM.cdsNIA.Modified) Or
      (DMALM.cdsKDX.Modified));

   Z2bbtnGraba.Enabled := bDummy1;
   Z2bbtnCanc2.Enabled := bDummy1;
   Z2bbtnNuevo.Enabled := (DMALM.cdsKDX.ChangeCount = 0) And (DMALM.cdsNIA.ChangeCount = 0);
End;

Procedure TFRegNtaE.lblEstado;
Begin

End;

Procedure TFRegNtaE.dbgDKDXKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
   If (Key = $4D) And (ssCtrl In Shift) Then
      dbgDKDXDblClick(Nil);
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If (DMALM.cdsNia.FieldByName('NISSIT').AsString <> 'INICIAL') Then
      Begin
         Information(Caption, ' El Item No Puede Ser Eliminado ');
         Exit;
      End;
      If DMALM.cdsKDX.RecordCount > 0 Then
      Begin
         If DMALM.wKDXSerie = 'S' Then
            If DMALM.cdsKDXSerie.Active Then
            Begin
               DMALM.cdsKDXSerie.Filter := ' CIAID=' + QuotedStr(dblcCIA.text)
                  + ' and LOCID=' + QuotedStr(dblcLOC.text)
                  + ' and TINID=' + QuotedStr(dblcTIN.text)
                  + ' and ALMID=' + QuotedStr(dblcTALM.text)
                  + ' and TDAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
                  + ' and NISAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
                  + ' and NISATIP=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISATIP').AsString)
                  + ' and KDXID=' + QuotedStr(DMALM.cdsKDX.FieldByName('KDXID').AsString)
                  + ' and ARTID=' + QuotedStr(DMALM.cdsKDX.FieldByName('ARTID').AsString);
               DMALM.cdsKDXSerie.Filtered := True;
               DMALM.cdsKDXSerie.First;
               If DMALM.cdsKDXSerie.RecordCount > 0 Then
               Begin

                  xSQL := ' delete from LOG332 '
                     + '     Where CIAID=' + QuotedStr(dblcCIA.text)
                     + '       and LOCID=' + QuotedStr(dblcLOC.text)
                     + '       and TINID=' + QuotedStr(dblcTIN.text)
                     + '       and ALMID=' + QuotedStr(dblcTALM.text)
                     + '       and TDAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
                     + '       and NISAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
                     + '       and NISATIP=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISATIP').AsString)
                     + '       and KDXID=' + QuotedStr(DMALM.cdsKDX.FieldByName('KDXID').AsString)
                     + '       and ARTID=' + QuotedStr(DMALM.cdsKDX.FieldByName('ARTID').AsString);
                  Try
                     DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
                  Except
                     ShowMessage('Error al Eliminar el detalle Log332');
                     Screen.Cursor := crDefault;
                     exit;
                  End;
                  DMALM.cdsKDXSerie.Delete;
               End;
               DMALM.cdsKDXSerie.Filtered := False;
            End;

         xSQL := ' delete from LOG315 '
            + '     Where CIAID=' + QuotedStr(dblcCIA.text)
            + '       and LOCID=' + QuotedStr(dblcLOC.text)
            + '       and TINID=' + QuotedStr(dblcTIN.text)
            + '       and ALMID=' + QuotedStr(dblcTALM.text)
            + '       and TDAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
            + '       and NISAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
            + '       and NISATIP=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISATIP').AsString)
            + '       and ARTID=' + QuotedStr(DMALM.cdsKDX.FieldByName('ARTID').AsString);

         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al Eliminar el detalle Log315');
            Screen.Cursor := crDefault;
            exit;
         End;
         DMALM.cdsKDX.Delete;
      End
      Else
         ErrorMsg(Caption, ' No Existen Registros a Eliminar ');
   End;
   If (DMALM.cdsNia.FieldByName('NISSIT').AsString <> 'ACEPTADO') Then
   Begin
      btnDetalle;
      Z2bbtnGraba.Enabled := True;
   End;
End;

Procedure TFRegNtaE.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMALM.cdsTDOC.Filtered := False;
   DMALM.cdsTDOC.Filter := '';
   DMALM.cdsTDOC.Filtered := True;
   dbgNIxOC.DataSource := Nil;
   dbgOrdComp.DataSource := Nil;
   If (wOperacion = 'ADD') And
      (trim(DMALM.cdsNIA.FieldByName('NISSIT').AsString) = 'INICIAL') And
      (Length(Trim(xNIngElim)) > 0) Then
   Begin

      DMALM.DCOM1.AppServer.IniciaTransaccion;
      xSql := 'Delete LOG318 '
         + '    where CIAID=' + quotedstr(Trim(dblcCIA.Text))
         + '      and LOCID=' + quotedstr(Trim(dblcLOC.Text))
         + '      and TINID=' + quotedstr(Trim(dblcTIN.Text))
         + '      and ALMID=' + quotedstr(Trim(dblcTALM.Text))
         + '      and TDAID=' + quotedstr(Trim(dblcTDA.Text))
         + '      and NISAID=' + quotedstr(Trim(xNIngElim));
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
      Except
         ShowMessage('Error al actualizar LOG318 ');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Exit;
      End;
      xSql := 'Delete LOG315 '
         + '    where CIAID=' + quotedstr(Trim(dblcCIA.Text))
         + '      and LOCID=' + quotedstr(Trim(dblcLOC.Text))
         + '      and TINID=' + quotedstr(Trim(dblcTIN.Text))
         + '      and ALMID=' + quotedstr(Trim(dblcTALM.Text))
         + '      and TDAID=' + quotedstr(Trim(dblcTDA.Text))
         + '      and NISAID=' + quotedstr(Trim(xNIngElim));
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
      Except
         ShowMessage('Error al actualizar LOG315 ');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Exit;
      End;
      wOperacion := '';
   End;
   DMALM.cdsNIA.CancelUpdates;
   DMALM.cdsKDX.CancelUpdates;

   DMALM.cdsArtiStk.Close;
   pnlDetalleA.Visible := False;
   If DMALM.cdsNIA.State In [dsEdit, dsInsert] Then
      DMALM.cdsNIA.Cancel;
   If DMALM.cdsNIA.ChangeCount > 0 Then
      DMALM.cdsNIA.CancelUpdates;
   If DMALM.cdsKDX.ChangeCount > 0 Then
      DMALM.cdsKDX.CancelUpdates;
   DMALM.cdsTRAN.Filtered := False;
   DMALM.dsOCNIA.OnDataChange := Nil;

   DMALM.cdsSQL.Filter := '';
   DMALM.cdsSQL.Filtered := false;
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;

   DMALM.cdsSTK.IndexFieldNames := '';
   DMALM.cdsKDX.IndexFieldNames := '';
   DMALM.cdsKDXTemp.IndexFieldNames := '';

   xCrea := true;
   Action := CAFree;
End;

Function TFRegNtaE.EHandlerError(Ex: Exception): Boolean;
Var
   a, b: Integer;
   s1, s2: String;
Begin
   Result := true;
   If Ex.Message = 'Key violation.' Then
   Begin
      ErrorMsg('Error', 'No pueden existir registros duplicados.. ');
   End
   Else
   Begin
      a := pos('must have a value', Ex.Message);
      s1 := '';
      s2 := '';
      If a > 0 Then
      Begin
         s1 := Ex.Message;
         b := pos('''', s1);
         While s1[b + 1] <> '''' Do
         Begin
            inc(b);
            s2 := s2 + s1[b];
         End;
         ErrorMsg('Error', 'El campo ' + s2 + ' es obligatorio...  ');
      End
      Else
         Result := false;
   End;
End;

Procedure TFRegNtaE.dblcExist(Sender: TObject);
Var
   bRq: Boolean;
Begin
   bRq := false;
   If TwwDBCustomLookupCombo(Sender).DataSource <> Nil Then
      bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;
   If (bRq) And (trim(TwwDBCustomLookupCombo(Sender).Text) = '') Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegNtaE.dblcNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegNtaE.Init(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTDA, sLOC, sTIN: String;
Begin
   lblEstado;
   OnOffCabecera(True); //Activar la cabecera
   OnOffDetalle(False); //Desactivar el panel de detalle
   btnDetalle;

   DMALM.cdsTDOC.Filtered := False;
   DMALM.cdsTDOC.Filter := '';
   DMALM.cdsTDOC.Filter := 'REFALM=''S''';
   DMALM.cdsTDOC.Filtered := True;

   If DMALM.wModo = 'A' Then
//   If DMALM.cdsNIA.State In [dsInsert] Then
   Begin
      dcTDA;
      sCIA := DMALM.cdsNIA.FieldByName('CIAID').AsString;
      sALM := DMALM.cdsNIA.FieldByName('ALMID').AsString;
      sTDA := DMALM.cdsNIA.FieldByName('TDAID').AsString;
      sLOC := DMALM.cdsNIA.FieldByName('LOCID').AsString;
      sTIN := DMALM.cdsNIA.FieldByName('TINID').AsString;
      sNUM := '';
      DMALM.cdsNIA.FieldByName('NISAID').AsString := sNUM;
   End
   Else
   Begin
      nOrds;
   End;
End;

Procedure TFRegNtaE.dblcdCCChange(Sender: TObject);
Begin
   dbeCC.Text := DMALM.cdsCCost.FieldByName('CIADES').AsString;
End;

Procedure TFRegNtaE.dcTDA;
Var
   sTDA: String;
   sState: TDataSetState;
Begin
   sState := DMALM.cdsNIA.State;
   DMALM.cdsTDNISA.First;
   sTDA := trim(DMALM.cdsTDNISA.FieldByName('TDAID').AsString);

   If (sState = dsInsert) And Not (DMALM.cdsNIA.State In [dsInsert]) Then
      DMALM.cdsNIA.Insert;
   If (sState = dsEdit) And Not (DMALM.cdsNIA.State In [dsEdit]) Then
      DMALM.cdsNIA.Edit;
   If DMALM.cdsTDNISA.RecordCount > 1 Then
   Begin
      DMALM.cdsNIA.FieldByName('TDAID').AsString := sTDA;
      dblcTDA.Text := sTDA;
      dblcTDAExit(Nil);
   End;
End;

Procedure TFRegNtaE.dbgOrdCompDblClick(Sender: TObject);
Var
   sWhere, sCIA: String;
Begin
   dbgOrdComp.DataSource := DMALM.dsOCNIA;
   pnlOC.Enabled := True;
   pnlSELOC.Visible := False;
   dblcdSODC.Text := DMALM.cdsOCNIA.FieldByName('ODCID').AsString;

   sCIA := DMALM.cdsOrdComp.fieldbyname('CIAID').asString;
   sWhere := 'CIAID=''' + sCIA + ''' AND CCOMERID=' + quotedstr(DMALM.cdsOrdComp.fieldbyname('CCOMERID').asString);
   dbeF2.Text := DMALM.DisplayDescrip('prvTGE', 'CXC101', 'CCOMERDES', sWhere, 'CCOMERDES');
   dbeF1.Text := DateToStr(DMALM.cdsOrdComp.FieldByName('ODCFEMI').AsDateTime);
   dbeF3.Text := Format('%8.2f', [DMALM.cdsOrdComp.FieldByName('ODCTOTALG').AsFloat]);
   pnlSELOC.Visible := True;
   iEstado := 1;
End;

Procedure TFRegNtaE.nOrds;
Var
   sODCIDs, sCIA, sALM, sTDA, sNISAID, sLOC, sTin: String;
   bCIA, bALM, bTDA, bNISAID, bLOC, bTin: Boolean;
Begin
   sCIA := DMALM.cdsNIA.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsNIA.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIA.FieldByName('TINID').AsString;
   sALM := DMALM.cdsNIA.FieldByName('ALMID').AsString;
   sTDA := DMALM.cdsNIA.FieldByName('TDAID').AsString;
   sNISAID := DMALM.cdsNIA.FieldByName('NISAID').AsString;

   sODCIDs := '';
   wODCIDs := ''; //Esta variable sera usado para la visualizacion por registros de OC y DOC
   DMALM.cdsOCNIA.First;
   While Not DMALM.cdsOCNIA.Eof Do
   Begin
      bCIA := (sCIA = DMALM.cdsOCNIA.FieldByName('CIAID').AsString);
      bLOC := (sLOC = DMALM.cdsOCNIA.FieldByName('LOCID').AsString);
      bTIN := (sTIN = DMALM.cdsOCNIA.FieldByName('TINID').AsString);
      bALM := (sALM = DMALM.cdsOCNIA.FieldByName('ALMID').AsString);
      bTDA := (sTDA = DMALM.cdsOCNIA.FieldByName('TDAID').AsString);
      bNISAID := (sNISAID = DMALM.cdsOCNIA.FieldByName('NISAID').AsString);

      If bCIA And bALM And bTDA And bNISAID And bLOC And bTIN Then
      Begin
         sODCIDs := DMALM.cdsOCNIA.FieldByName('ODCID').AsString + ';' + sODCIDs;
         If wODCIDs = '' Then
            wODCIDs := '(B.ODCID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCID').AsString)
         Else
            wODCIDs := wODCIDs + ' OR B.ODCID=' + quotedstr(DMALM.cdsOCNIA.FieldByName('ODCID').AsString);
      End;
      DMALM.cdsOCNIA.Next;
   End;
   If wODCIDs <> '' Then
      wODCIDs := wODCIDs + ')';
   edNOrdC.Text := sODCIDs;
End;

Procedure TFRegNtaE.Z2bbtnOAOKClick(Sender: TObject);
Begin
   pnlCabecera.Enabled := False;
   pnlDetalleG.Enabled := True;
   pnlControl.Enabled := True;
End;

Procedure TFRegNtaE.dsOCNIADataChange(Sender: TObject; Field: TField);
Var
   sCIA, sODCID, sART: String;
Begin
   sODCID := DMALM.cdsOCNIA.FieldByName('ODCID').AsString;
   sCIA := DMALM.cdsOCNIA.FieldByName('CIAID').AsString;
   sART := trim(dbcldArti.Text);
   If sART = '' Then
      Exit; // no ejecutar el filtro
   DMALM.cdsDOCATT.Filtered := False;
   DMALM.cdsDOCATT.Filter := 'CIAID=''' + sCIA + ''' AND ARTID=''' + sART + ''' AND ODCID=''' + sODCID + '''';
   DMALM.cdsDOCATT.Filtered := True;
End;

Procedure TFRegNtaE.Adiciona;
Begin
   dbeProv.Clear;
End;

Procedure TFRegNtaE.Edita;
Begin
   lblEstado1.Caption := DMALM.cdsNIA.FieldByName('NISSIT').AsString;
End;

Procedure TFRegNtaE.ValidarFecha;
Var
   sSQL: String;
Begin
   If dblcTALM.Text <> '' Then
   Begin
      sSQL := 'Select * '
         + '     from LOG317'
         + '    where LOG317.CIAID=' + quotedstr(dblcCIA.text)
         + '      and LOG317.LOCID=' + quotedstr(dblcLOC.text)
         + '      and LOG317.ALMID=' + quotedstr(dblcTALM.text)
         + '      and LOG317.TINID=' + quotedstr(dblcTIN.text)
         + '    order by CIAID, LOCID, TINID, ALMID, CNSULTCIE';
      DMALM.cdsCierre.Close;
      DMALM.cdsCierre.DataRequest(sSQL);
      DMALM.cdsCierre.Open;
      If DMALM.cdsCierre.RecordCount = 0 Then
      Begin
         ErrorMsg('Error', ' No Existe Frecuencia de Cierre ');
         vValida := True;
         exit;
      End
      Else
      Begin
         If (dblcTALM.Text <> '') Then
         Begin
            DMALM.cdsCierre.Last;
            NuevaFecha;
         End;
      End;
   End;
End;

Procedure TFRegNtaE.NuevaFecha;
Var
 //ix : integer;
   vfecult, vmasdia: Tdate;
   vyear, vmonth, vday: word;
   vyear1, vmonth1, vday1: word;
   vyear2, vmonth2, vday2: word;
Begin
   vValida := false;
   vmasdia := StrToDate(DMALM.cdsCierre.fieldbyname('CNSPRICIE').AsString);
   vfecult := StrtoDate(DMALM.cdsCierre.fieldbyname('CNSULTCIE').AsString);
   DecodeDate(vmasdia, vyear, vmonth, vday); //calculado
   DecodeDate(vfecult, vyear1, vmonth1, vday1); // anterior
   DecodeDate(strtoDate(dbdtpFNS.text), vyear2, vmonth2, vday2); //digitada
   If (strTodate(dbdtpFNS.text) >= vmasdia) And
      (strTodate(dbdtpFNS.text) <= vfecult) Then
   Begin
      Exit;
   End;
   ErrorMsg('Error', 'No se puede Registrar la Nota de Ingreso al' + #13 + #13
      + IntToStr(vday2) + ' de ' + LongMonthNames[vmonth2] + ' del ' + IntToStr(vyear2) + ' ' + #13 + #13 +
      'Fecha No esta dentro del Rango Permitido del ' + datetostr(vmasdia) + ' al ' + datetostr(vfecult));
   vValida := True;
End;

Procedure TFRegNtaE.dblcTALMExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'CIAID='+quotedstr(dblcCIA.text)
      + ' and LOCID='+quotedstr(dblcLOC.text)
      + ' and TINID=' + quotedstr(dblcTIn.text)
      + ' and ALMID=' + quotedstr(dblcTALM.text);
   dbeALM.text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');
End;

Procedure TFRegNtaE.ConfiguraNota(Sender: TObject);
Var
   sSQL, sNUM, sCIA, sTIN, sALM, sLOC, sTDA: String;
Begin
   Screen.Cursor := crHourGlass;

   DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CJAAUTONOM', 'CIAID=' + QuotedStr(dblcCIA.text), 'CJAAUTONOM');
   bIngIGV := FALSE;

   sSQL := 'TRIID=''' + dblcTransac.Text + '''' + ' AND TRISGT=''I''';
   DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRICC, TRIPV, TRIOC, TRINSAL, TRIDEVPED, TRICLIEN, CUENTAID, TRICVTAS, TRITMOV, TRICERO,TRICONSIG,TRIINGDEV', sSQL, 'TRICC');

   xReqCCosto := (Trim(DMALM.cdsQry.FieldByName('TRICC').AsString) = 'S');
   xReqProveed := (Trim(DMALM.cdsQry.FieldByName('TRIPV').AsString) = 'S');
   xReqOCompra := (Trim(DMALM.cdsQry.FieldByName('TRIOC').AsString) = 'S');
   xReqNSalida := (Trim(DMALM.cdsQry.FieldByName('TRINSAL').AsString) = 'S');
   xNSalxDevPed := (Trim(DMALM.cdsQry.FieldByName('TRIDEVPED').AsString) = 'S');
   xReqCodCliente := (Trim(DMALM.cdsQry.FieldByName('TRICLIEN').AsString) = 'S');
   xPermiteValorCero := (Trim(DMALM.cdsQry.FieldByName('TRICERO').AsString) = 'S');
   xIndicaSalxConsig := (Trim(DMALM.cdsQry.FieldByName('TRICONSIG').AsString) = 'S');
   xIndicaIngxDevoluc := (Trim(DMALM.cdsQry.FieldByName('TRIINGDEV').AsString) = 'S');

   wCuenta := Trim(DMALM.cdsQry.FieldByName('CUENTAID').AsString);
   wTricvtas := Trim(DMALM.cdsQry.FieldByName('TRICVTAS').AsString);
   wTriTMov := Trim(DMALM.cdsQry.FieldByName('TRITMOV').AsString);

   If wOperacion = 'ADD' Then
   Begin
      If xReqNSalida Then
      Begin
         If Length(Trim(DMALM.cdsNIA.FieldByName('CLIEID').AsString)) > 0 Then
         Begin
            DMALM.cdsNIA.FieldByName('CLIEID').Clear;
            dbeClie.Text := '';
         End;
      End;
      If xNSalxDevPed Then
      Begin
         If Length(Trim(DMALM.cdsNIA.FieldByName('CCOSID').AsString)) > 0 Then
         Begin
            DMALM.cdsNIA.FieldByName('CCOSID').Clear;
            dbeCC.Text := '';
         End;
      End;
   End;

   If ((xNSalxDevPed) Or (xReqCodCliente)) And (Not DMALM.cdsClient.active) Then
      DMALM.cdsClient.open;

   dblcdClie.visible := (xNSalxDevPed) Or (xReqCodCliente);
   dblcdProv.visible := ((Not xNSalxDevPed) And (Not xReqCodCliente));

   dblcdClie.enabled := (xNSalxDevPed) Or (xReqCodCliente);
   dblcdProv.enabled := ((Not xNSalxDevPed) And (Not xReqCodCliente));

   lblClie.enabled := (xNSalxDevPed) Or (xReqCodCliente);
   lblProv.enabled := ((Not xNSalxDevPed) And (Not xReqCodCliente));

   lblClie.visible := (xNSalxDevPed) Or (xReqCodCliente);
   lblProv.visible := ((Not xNSalxDevPed) And (Not xReqCodCliente));

   dbeClie.visible := (xNSalxDevPed) Or (xReqCodCliente);
   dbeProv.visible := ((Not xNSalxDevPed) And (Not xReqCodCliente));

   dblcdPedido.visible := xNSalxDevPed;
   dbeNP.visible := Not xNSalxDevPed;

   dblcdPedido.enabled := xNSalxDevPed;
   dbeNP.enabled := Not xNSalxDevPed;

   dblcdGuia.visible := xNSalxDevPed;
   dblcdGuia.enabled := xNSalxDevPed;

   dbeNDoc.enabled := Not xNSalxDevPed;
   dbdtpFDoc.enabled := Not xNSalxDevPed;

   lblNroNota.visible := xReqCCosto;
   lblNroNota.enabled := xReqCCosto;

   lblGuia.visible := xNSalxDevPed;
   lblGuia.enabled := xNSalxDevPed;

   dblcdNSal.visible := xReqCCosto;
   dblcdNSal.enabled := xReqCCosto;

   DMALM.cdsNIA.FieldByName('CCOSID').Required := xReqCCosto;
   DMALM.cdsNIA.FieldByName('PROV').Required := xReqProveed;
   DMALM.cdsNIA.FieldByName('ODCID').Required := xReqOCompra;
   DMALM.cdsNIA.FieldByName('CLIEID').Required := xReqCodCliente;

   dblcdCC.Enabled := xReqCCosto;
   lblCC.Enabled := xReqCCosto;
   dblcdProv.Enabled := xReqProveed;
   lblProv.Enabled := xReqProveed;
   lblNOC.Enabled := xReqOCompra;
   btnOC.Enabled := xReqOCompra;
   lblNroNota.Enabled := xReqCCosto;
   dblcdNSal.Enabled := xReqCCosto;

   sCIA := dblcCIA.Text;
   sALM := dblcTALM.Text;
   sTDA := dblcTDA.Text;
   sLOC := dblcLOC.Text;
   sTIN := dblcTIN.Text;
   Screen.Cursor := crDefault;
   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sLOC = '') Or (sTIN = '') Then
   Begin
      Exit;
   End;
   sNUM := DMALM.StrZero(DMALM.MaxNIA(sCIA, sALM), wAnchoIng);
End;

Procedure TFRegNtaE.stxTitulo2Exit(Sender: TObject);
Begin
   dbeItem.setFocus;
End;

Procedure TFRegNtaE.dbgNIxOCDblClick(Sender: TObject);
Begin
   z2bbtnOkNIOC.Click;
End;

Procedure TFRegNtaE.dbgOrdCompKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
      DMALM.cdsOCNIA.Delete;
End;

Procedure TFRegNtaE.dblcTMonedaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegNtaE.pprNiaEntPreviewFormCreate(Sender: TObject);
Begin
   pprNiaEnt.PreviewForm.ClientHeight := 500;
   pprNiaEnt.PreviewForm.ClientWidth := 650;
   TppViewer(pprNiaEnt.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFRegNtaE.pprNiaEntBeforePrint(Sender: TObject);
Begin
   ppLabel10.Caption := edNOrdC.Text;
End;

Procedure TFRegNtaE.FormDestroy(Sender: TObject);
Begin
   DMALM.dsOCNIA.OnDataChange := Nil;
End;

Function TFRegNtaE.VerificaNumerodeSerie: boolean;
Var
   sSQL, wCiaId, wLocId, wTinId, wAlmId, wTdaId, wNisaId, wNisaTip, wKdxId, wArtId: String;
   BSerie: Boolean;
   i: integer;
Begin
   BSerie := False;
   DMALM.cdsKDXSerie.Filter :=
      '       CIAID=' + QuotedStr(dblcCIA.text)
      + ' and LOCID=' + QuotedStr(dblcLOC.text)
      + ' and TINID=' + QuotedStr(dblcTIN.text)
      + ' and ALMID=' + QuotedStr(dblcTALM.text)
      + ' and TDAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
      + ' and NISAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
      + ' and NISATIP=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISATIP').AsString)
      + ' and KDXID=' + QuotedStr(DMALM.cdsKDX.FieldByName('KDXID').AsString)
      + ' and ARTID=' + QuotedStr(DMALM.cdsKDX.FieldByName('ARTID').AsString);
   DMALM.cdsKDXSerie.Filtered := True;
   DMALM.cdsKDXSerie.First;

   If DMALM.cdsKdxSerie.RecordCount = 0 Then
      InsertaNumerosdeSerie;

   If DMALM.cdsKdxSerie.RecordCount > 0 Then
   Begin
      DMALM.cdsKDXSerie.First;
      While Not DMALM.cdsKDXSerie.EOF Do
      Begin
         If ((wSerieCodBar = '1') And (Length(DMALM.cdsKDXSerie.FieldByName('ACFSERIE').AsString) <= 0)) Or
            ((wSerieCodBar = '2') And (Length(DMALM.cdsKDXSerie.FieldByName('CODBAR').AsString) <= 0)) Or
            ((wSerieCodBar = '3') And ((Length(DMALM.cdsKDXSerie.FieldByName('ACFSERIE').AsString) <= 0) Or
            (Length(DMALM.cdsKDXSerie.FieldByName('CODBAR').AsString) <= 0))) Then
         Begin
            BSerie := True;
            DMALM.cdsKDXSerie.Last;
            result := BSerie;
            Exit;
         End
         Else
            DMALM.cdsKDXSerie.Next;
      End;
   End;
   result := BSerie;
End;

Procedure TFRegNtaE.InsertaNumerosdeSerie;
Var
   sSQL: String;
   i, j: integer;
Begin
   DMALM.DisplayDescrip('prvTGE', 'TGE205', 'FNSERIE,MARCA,MODELO,COLOR,ARTACTIVO',
      'CIAID=' + QuotedStr(dblcCIA.text) +
      ' AND TINID=' + QuotedSTr(dblcTIN.text) +
      ' AND ARTID=' + QuotedStr(DMALM.cdsKDX.FieldByName('ARTID').AsString), 'FNSERIE');
   wSerieCodBar := '0';
   ChequeaSerieCodBar;

   dbgGridSerie.Selected.Clear;
   dbgGridSerie.Selected.Add('KDXID'#9'3'#9'N°'#9'T');
   dbgGridSerie.Selected.Add('ITEM'#9'3'#9'Itm'#9'T');
   dbgGridSerie.Selected.Add('ARTID'#9'8'#9'Artículo'#9'T');
   dbgGridSerie.Selected.Add('ARTDES'#9'20'#9'Descripción'#9'T');
   dbgGridSerie.Selected.Add('ACFSERIE'#9'20'#9'Serie'#9'F');
   dbgGridSerie.Selected.Add('MARCA'#9'20'#9'Marca'#9'F');
   dbgGridSerie.Selected.Add('MODELO'#9'20'#9'Modelo'#9'F');
   dbgGridSerie.Selected.Add('COLOR'#9'10'#9'Color'#9'F');
   dbgGridSerie.Selected.Add('CODBAR'#9'7'#9'Codigo~Barras'#9'F');
   dbgGridSerie.RedrawGrid;

   DMALM.cdsKdxSerie.IndexFieldNames := 'CIAID;LOCID;TINID;ALMID;TDAID;NISAID;NISATIP;KDXID;ARTID';
   If DMALM.cdsKdxSerie.RecordCount <= 0 Then
   Begin
      If wSerieCodBar <> '0' Then
      Begin
         For i := 1 To DMALM.cdsKDX.FieldByName('KDXCNTG').AsInteger Do
         Begin
            j := StrToInt(DMALM.MaxValue('ITEM', DMALM.cdsKDXSerie));
            DMALM.cdsKDXSerie.Append;
            DMALM.cdsKDXSerie.FieldByName('CIAID').AsString := dblcCIA.text;
            DMALM.cdsKDXSerie.FieldByName('LOCID').AsString := dblcLOC.text;
            DMALM.cdsKDXSerie.FieldByName('TINID').AsString := dblcTIN.text;
            DMALM.cdsKDXSerie.FieldByName('ALMID').AsString := dblcTALM.text;
            DMALM.cdsKDXSerie.FieldByName('TDAID').AsString := DMALM.cdsNIA.FieldByName('TDAID').AsString;
            DMALM.cdsKDXSerie.FieldByName('NITDOC').AsString := DMALM.cdsNIA.FieldByName('TDAID').AsString;
            DMALM.cdsKDXSerie.FieldByName('NISAID').AsString := DMALM.cdsNIA.FieldByName('NISAID').AsString;
            DMALM.cdsKDXSerie.FieldByName('NINDOC').AsString := DMALM.cdsNIA.FieldByName('NISAID').AsString;
            DMALM.cdsKDXSerie.FieldByName('NISATIP').AsString := DMALM.cdsNIA.FieldByName('NISATIP').AsString;
            DMALM.cdsKDXSerie.FieldByName('KDXID').AsString := DMALM.cdsKDX.FieldByName('KDXID').AsString;
            DMALM.cdsKDXSerie.FieldByName('ARTID').AsString := DMALM.cdsKDX.FieldByName('ARTID').AsString;
            DMALM.cdsKDXSerie.FieldByName('ARTDES').AsString := DMALM.cdsKDX.FieldByName('ARTDES').AsString;
            DMALM.cdsKDXSerie.FieldByName('GRARID').AsString := DMALM.cdsKDX.FieldByName('GRARID').AsString;
            DMALM.cdsKDXSerie.FieldByName('FAMID').AsString := DMALM.cdsKDX.FieldByName('FAMID').AsString;
            DMALM.cdsKDXSerie.FieldByName('SFAMID').AsString := DMALM.cdsKDX.FieldByName('SFAMID').AsString;
            DMALM.cdsKDXSerie.FieldByName('MARCA').AsString := DMALM.cdsQry.FieldByName('MARCA').AsString;
            DMALM.cdsKDXSerie.FieldByName('MODELO').AsString := DMALM.cdsQry.FieldByName('MODELO').AsString;
            DMALM.cdsKDXSerie.FieldByName('COLOR').AsString := DMALM.cdsQry.FieldByName('COLOR').AsString;
            DMALM.cdsKDXSerie.FieldByName('PROV').AsString := DMALM.cdsNIA.FieldByName('PROV').AsString;
            DMALM.cdsKDXSerie.FieldByName('NISANDOC').AsString := DMALM.cdsNIA.FieldByName('NISANDOC').AsString;
            DMALM.cdsKDXSerie.FieldByName('NISAFDOC').AsString := DMALM.cdsNIA.FieldByName('NISAFDOC').AsString;
            DMALM.cdsKDXSerie.FieldByName('NIFECHA').AsString := DMALM.cdsNIA.FieldByName('NISAFREG').AsString;
            DMALM.cdsKDXSerie.FieldByName('TMONID').AsString := DMALM.cdsKDX.FieldByName('TMONID').AsString;
          ///////////////////////////////////////////////////////////////////////////////////////////////////
          // ESTE VALOR ES SIEMPRE GRABADO EN SOLES, AUN EL TMONIID SEA 'D'(DOLARES), E INCLUYE EL IGV
            DMALM.cdsKDXSerie.FieldByName('ARTPCG').AsString := DMALM.cdsKDX.FieldByName('ARTPCG').AsString;
          ///////////////////////////////////////////////////////////////////////////////////////////////////
          // SE GRABA EL TIPO DE CAMBIO DEL INGRESO, QUE ES CON EL CUAL INGRESARA AL ACTIVO
            DMALM.cdsKDXSerie.FieldByName('TCAMB').AsFloat := strToFloat(dbeTcambio.Text);
            If xReqOCompra Then
            Begin
               DMALM.cdsKDXSerie.FieldByName('ODCID').AsString := DMALM.cdsOrdComp.FieldByName('ODCID').AsString;
               DMALM.cdsKDXSerie.FieldByName('OCNDOC').AsString := DMALM.cdsOrdComp.FieldByName('ODCID').AsString;
               DMALM.cdsKDXSerie.FieldByName('OCFECHA').AsString := DMALM.cdsOrdComp.FieldByName('ODCFEMI').AsString;
            End;

            DMALM.cdsKDXSerie.FieldByName('FACTDOC').AsString := DMALM.cdsNIA.FieldByName('DOCID').AsString;
            DMALM.cdsKDXSerie.FieldByName('FACNSERIE').AsString := '';
            DMALM.cdsKDXSerie.FieldByName('FACNDOC').AsString := DMALM.cdsNIA.FieldByName('NISANDOC').AsString;
            DMALM.cdsKDXSerie.FieldByName('FACFECHA').AsString := DMALM.cdsNIA.FieldByName('NISAFDOC').AsString;

            DMALM.cdsKDXSerie.FieldByName('NISSIT').AsString := 'INICIAL'; // 'ACEPTADO'
            DMALM.cdsKDXSerie.FieldByName('NISIT').AsString := 'INICIAL'; // 'ACEPTADO'
            DMALM.cdsKDXSerie.FieldByName('ENTREGADO').AsString := 'N';
            DMALM.cdsKDXSerie.FieldByName('ESTADOID').AsString := 'N'; //=Pendiente DE SER ACTIVADO
            DMALM.cdsKDXSerie.FieldByName('ITEM').AsInteger := j;
            DMALM.cdsKDXSerie.Post;
            GrabaSerie;
         End;
      End;
   End
   Else
   Begin
      If wSerieCodBar <> '0' Then
      Begin
         If DMALM.cdsKDXSerie.RecordCount < DMALM.cdsKDX.FieldByName('KDXCNTG').AsInteger Then
         Begin
            For i := 1 To (DMALM.cdsKDX.FieldByName('KDXCNTG').AsInteger - DMALM.cdsKDXSerie.RecordCount) Do
            Begin
               j := StrToInt(DMALM.MaxValue('ITEM', DMALM.cdsKDXSerie));
               DMALM.cdsKDXSerie.Append;
               DMALM.cdsKDXSerie.FieldByName('CIAID').AsString := dblcCIA.text;
               DMALM.cdsKDXSerie.FieldByName('LOCID').AsString := dblcLOC.text;
               DMALM.cdsKDXSerie.FieldByName('TINID').AsString := dblcTIN.text;
               DMALM.cdsKDXSerie.FieldByName('ALMID').AsString := dblcTALM.text;
               DMALM.cdsKDXSerie.FieldByName('TDAID').AsString := DMALM.cdsNIA.FieldByName('TDAID').AsString;
               DMALM.cdsKDXSerie.FieldByName('NITDOC').AsString := DMALM.cdsNIA.FieldByName('TDAID').AsString;
               DMALM.cdsKDXSerie.FieldByName('NISAID').AsString := DMALM.cdsNIA.FieldByName('NISAID').AsString;
               DMALM.cdsKDXSerie.FieldByName('NINDOC').AsString := DMALM.cdsNIA.FieldByName('NISAID').AsString;
               DMALM.cdsKDXSerie.FieldByName('NIFECHA').AsString := DMALM.cdsNIA.FieldByName('NISAFREG').AsString;
               DMALM.cdsKDXSerie.FieldByName('NISATIP').AsString := DMALM.cdsNIA.FieldByName('NISATIP').AsString;
               DMALM.cdsKDXSerie.FieldByName('KDXID').AsString := DMALM.cdsKDX.FieldByName('KDXID').AsString;
               DMALM.cdsKDXSerie.FieldByName('ARTID').AsString := DMALM.cdsKDX.FieldByName('ARTID').AsString;
               DMALM.cdsKDXSerie.FieldByName('ARTDES').AsString := DMALM.cdsKDX.FieldByName('ARTDES').AsString;
               DMALM.cdsKDXSerie.FieldByName('GRARID').AsString := DMALM.cdsKDX.FieldByName('GRARID').AsString;
               DMALM.cdsKDXSerie.FieldByName('FAMID').AsString := DMALM.cdsKDX.FieldByName('FAMID').AsString;
               DMALM.cdsKDXSerie.FieldByName('SFAMID').AsString := DMALM.cdsKDX.FieldByName('SFAMID').AsString;
               DMALM.cdsKDXSerie.FieldByName('NISSIT').AsString := 'INICIAL'; // 'ACEPTADO'
               DMALM.cdsKDXSerie.FieldByName('NISIT').AsString := 'INICIAL'; // 'ACEPTADO'  solo para INGRESOS
               DMALM.cdsKDXSerie.FieldByName('ENTREGADO').AsString := 'N';
               DMALM.cdsKDXSerie.FieldByName('ESTADOID').AsString := 'N'; //=Pendiente DE SER ACTIVADO , AC=ACTIVADO
               DMALM.cdsKDXSerie.FieldByName('ITEM').AsInteger := j;
               DMALM.cdsKDXSerie.FieldByName('MARCA').AsString := DMALM.cdsQry.FieldByName('MARCA').AsString;
               DMALM.cdsKDXSerie.FieldByName('MODELO').AsString := DMALM.cdsQry.FieldByName('MODELO').AsString;
               DMALM.cdsKDXSerie.FieldByName('COLOR').AsString := DMALM.cdsQry.FieldByName('COLOR').AsString;
               DMALM.cdsKDXSerie.FieldByName('PROV').AsString := DMALM.cdsNIA.FieldByName('PROV').AsString;
               DMALM.cdsKDXSerie.FieldByName('DOCID').AsString := DMALM.cdsNIA.FieldByName('DOCID').AsString;
               DMALM.cdsKDXSerie.FieldByName('TMONID').AsString := DMALM.cdsKDX.FieldByName('TMONID').AsString;
               // SE GRABA EL TIPO DE CAMBIO DEL INGRESO, QUE ES CON EL CUAL INGRESARA AL ACTIVO
               DMALM.cdsKDXSerie.FieldByName('TCAMB').AsFloat := strToFloat(dbeTcambio.Text);
               If xReqOCompra Then
               Begin
                  DMALM.cdsKDXSerie.FieldByName('ODCID').AsString := DMALM.cdsOrdComp.FieldByName('ODCID').AsString;
                  DMALM.cdsKDXSerie.FieldByName('OCNDOC').AsString := DMALM.cdsOrdComp.FieldByName('ODCID').AsString;
                  DMALM.cdsKDXSerie.FieldByName('OCFECHA').AsString := DMALM.cdsOrdComp.FieldByName('ODCFEMI').AsString;
               End;
               DMALM.cdsKDXSerie.FieldByName('NISANDOC').AsString := DMALM.cdsNIA.FieldByName('NISANDOC').AsString;
               DMALM.cdsKDXSerie.FieldByName('NISAFDOC').AsString := DMALM.cdsNIA.FieldByName('NISAFDOC').AsString;
               ///////////////////////////////////////////////////////////////////////////////////////////////////
               // ESTE VALOR ES SIEMPRE GRABADO EN SOLES, AUN EL TMONID SEA 'D'(DOLARES), E INCLUYE EL IGV
               DMALM.cdsKDXSerie.FieldByName('ARTPCG').AsString := DMALM.cdsKDX.FieldByName('ARTPCG').AsString;
               ///////////////////////////////////////////////////////////////////////////////////////////////////
               DMALM.cdsKDXSerie.FieldByName('FACTDOC').AsString := DMALM.cdsNIA.FieldByName('DOCID').AsString;
               DMALM.cdsKDXSerie.FieldByName('FACNSERIE').AsString := '';
               DMALM.cdsKDXSerie.FieldByName('FACNDOC').AsString := DMALM.cdsNIA.FieldByName('NISANDOC').AsString;
               DMALM.cdsKDXSerie.FieldByName('FACFECHA').AsString := DMALM.cdsNIA.FieldByName('NISAFDOC').AsString;
               DMALM.cdsKDXSerie.Post;
               GrabaSerie;
            End;
         End
         Else
         Begin
            If DMALM.cdsKDXSerie.RecordCount > DMALM.cdsKDX.FieldByName('KDXCNTG').AsInteger Then
            Begin
               For i := 1 To (DMALM.cdsKDXSerie.RecordCount - DMALM.cdsKDX.FieldByName('KDXCNTG').AsInteger) Do
               Begin
                  DMALM.cdsKDXSerie.delete;
               End;
            End;
         End;
      End;
   End;
End;

Procedure TFRegNtaE.bbtnCancelSerieClick(Sender: TObject);
Begin
   pnlNumeSerie.Visible := False;
End;

Procedure TFRegNtaE.bbtnOKSerieClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If lblEstado1.caption = 'INICIAL' Then
   Begin
      If DMALM.cdsKDXSerie.State In [dsEdit] Then
      Begin
         DMALM.cdsKDXSerie.Post;
      End;
      xSQL := 'Select * '
         + '     from TGE205 '
         + '    where CIAID=' + QuotedStr(dblcCIA.Text)
         + '      and TINID=' + QuotedStr(dblcTIN.Text)
         + '      and NVL(ARTEST,''A'')=''H'' '
         + '    order by ARTID';
      DMALM.cdsArti.Close;
      DMALM.cdsArti.DataRequest(xSQL);
      DMALM.cdsArti.Open;
      DMALM.cdsArti.Filtered := False;
      DMALM.cdsArti.Filter := '';
      DMALM.cdsArti.Filter := 'ARTID=' + QuotedStr(DMALM.cdsKdx.FieldByName('ARTID').AsString) + '';
      DMALM.cdsArti.Filtered := True;
      If DMALM.cdsArti.FieldByName('FNSERIE').AsString = 'S' Then
      Begin
         If VerificaSerieDuplicados Then
         Begin
            If (wDupErrorSer = '1') Then
               ShowMessage('Número de Serie Duplicado');
            pnlNumeSerie.Left := 4;
            pnlNumeSerie.Top := 239;
            pnlNumeSerie.visible := True;
            Z2bbtnGraba.enabled := True;
            Z2bbtnAceptar.enabled := False;
         End
         Else
         Begin
            pnlNumeSerie.visible := False;
            Z2bbtnGraba.enabled := True;
            Z2bbtnAceptar.enabled := False;
         End;
      End;
      DMALM.cdsarti.Filtered := False;
      DMALM.cdsarti.Filter := '';
      If VerificaBarraDuplicados Then
      Begin
         If (wDupErrorBar = '1') Then
            ShowMessage('Código de Barra Duplicado');
         If (wDupErrorBar = '2') Then
            ShowMessage('Códigos de Barra YA existe en el Activo Fijo');
         pnlNumeSerie.Left := 4;
         pnlNumeSerie.Top := 239;
         pnlNumeSerie.visible := True;
         Z2bbtnGraba.enabled := True;
         Z2bbtnAceptar.enabled := False;
      End
      Else
      Begin
         pnlNumeSerie.visible := False;
         Z2bbtnGraba.enabled := True;
         Z2bbtnAceptar.enabled := False;
      End;
   End
   Else
   Begin
      pnlNumeSerie.visible := False;
   End;
End;

Function TFRegNtaE.VerificaSerieDuplicados: boolean;
Var
   bDuplicados: boolean;
   sCondicion, sSql: String;
Begin
   bDuplicados := False;
   DMALM.cdsKDXSerie.First;
   While (Not DMALM.cdsKDXSerie.EOF) And (Not bDuplicados) Do
   Begin
      wDupErrorSer := '0';
      sCondicion :=
         '       CIAID=' + QuotedStr(dblcCIA.text)
         + ' and LOCID=' + QuotedStr(dblcLOC.text)
         + ' and TINID=' + QuotedStr(dblcTIN.text)
         + ' and ALMID=' + QuotedStr(dblcTALM.text)
         + ' and TDAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
         + ' and NISAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
         + ' and NISATIP=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISATIP').AsString)
         + ' and KDXID=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('KDXID').AsString)
         + ' and ARTID=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('ARTID').AsString)
         + ' and ACFSERIE=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('ACFSERIE').AsString);
      If (DMALM.CountFor(DMALM.cdsKDXSerie, sCondicion) > 1) And (wSerieCodBar <> '2') Then
         wDupErrorSer := '1';

      If (wDupErrorSer = '1') Then
      Begin
         bDuplicados := True;
      End;
      DMALM.cdsKDXSerie.Next;
   End;
   DMALM.cdsKDXSerie.Prior;
   result := bDuplicados;
End;

Function TFRegNtaE.VerificaBarraDuplicados: boolean;
Var
   bDuplicados: boolean;
   sCondicion, sSql: String;
Begin
   bDuplicados := False;
   DMALM.cdsKDXSerie.First;
   While (Not DMALM.cdsKDXSerie.EOF) And (Not bDuplicados) Do
   Begin
      wDupErrorBar := '0';
      sCondicion :=
         '       CIAID=' + QuotedStr(dblcCIA.text)
         + ' and LOCID=' + QuotedStr(dblcLOC.text)
         + ' and TINID=' + QuotedStr(dblcTIN.text)
         + ' and ALMID=' + QuotedStr(dblcTALM.text)
         + ' and TDAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
         + ' and NISAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
         + ' and NISATIP=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISATIP').AsString)
         + ' and KDXID=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('KDXID').AsString)
         + ' and ARTID=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('ARTID').AsString)
         + ' and ACFSERIE=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('ACFSERIE').AsString);
      sCondicion := ' CODBAR=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('CODBAR').AsString);
      If (DMALM.CountFor(DMALM.cdsKDXSerie, sCondicion) > 1) And (wSerieCodBar <> '1') Then
         wDupErrorBar := '1';
      sSQL := 'ARTCODBAR=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('CODBAR').AsString);
      If length(DMALM.DisplayDescrip('prvTGE', 'ACF201', 'ARTCODBAR', sSql, 'ARTCODBAR')) > 0 Then
         wDupErrorBar := '2';

      If (wDupErrorBar = '1') Or (wDupErrorBar = '2') Then
      Begin
         bDuplicados := True;
      End;
      DMALM.cdsKDXSerie.Next;
   End;
   DMALM.cdsKDXSerie.Prior;
   result := bDuplicados;
End;

Procedure TFRegNtaE.bbtnCodBarClick(Sender: TObject);
Var
   wSql, wCodBar: String;
   wNumBar: integer;
Begin
   wSQL := 'ARTCODBAR=' + QuotedStr(edCodBar.Text);
   If length(DMALM.DisplayDescrip('prvTGE', 'ACF201', 'ARTCODBAR', wSql, 'ARTCODBAR')) > 0 Then
      showMessage('Código de Barras YA existe')
   Else
   Begin
      DMALM.cdsKDXSerie.First;
      wNumBar := StrToInt(edCodBar.Text);
      While (Not DMALM.cdsKDXSerie.EOF) Do
      Begin
         DMALM.cdsKDXSerie.Edit;
         If (DMALM.cdsKDXSerie.FieldbyName('CIAID').AsString = dblcCIA.text) And
            (DMALM.cdsKDXSerie.FieldbyName('LOCID').AsString = dblcLOC.text) And
            (DMALM.cdsKDXSerie.FieldbyName('TINID').AsString = dblcTIN.text) And
            (DMALM.cdsKDXSerie.FieldbyName('ALMID').AsString = dblcTALM.text) And
            (DMALM.cdsKDXSerie.FieldbyName('TDAID').AsString = DMALM.cdsNIA.FieldByName('TDAID').AsString) And
            (DMALM.cdsKDXSerie.FieldbyName('NISAID').AsString = DMALM.cdsNIA.FieldByName('NISAID').AsString) And
            (DMALM.cdsKDXSerie.FieldbyName('NISATIP').AsString = DMALM.cdsNIA.FieldByName('NISATIP').AsString) Then
         Begin
            wCodBar := DMALM.strzero(IntToStr(wNumBar), 6);
            DMALM.cdsKDXSerie.FieldByName('CODBAR').AsString := wCodBar;
            DMALM.cdsKDXSerie.Post;
            xSQL := 'Update LOG332 '
               + '      Set CODBAR =' + quotedstr(wCodBar)
               + '    where CIAID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('CIAID').AsString)
               + '      and LOCID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('LOCID').AsString)
               + '      and TINID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('TINID').AsString)
               + '      and ALMID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('ALMID').AsString)
               + '      and TDAID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('TDAID').AsString)
               + '      and NISAID =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('NISAID').AsString)
               + '      and NISATIP=' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('NISATIP').AsString)
               + '      and ARTID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('ARTID').AsString)
               + '      and ITEM   =' + inttostr(DMALM.cdsKDXSerie.FieldbyName('ITEM').AsInteger);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se pudo actualizar el código de barra en el archivo de Nro.Series');
            End;
            wNumBar := wNumBar + 1;
         End;
         DMALM.cdsKDXSerie.next;
      End;
   End;
End;

Procedure TFRegNtaE.ChequeaSerieCodBar;
Begin
   wSerieCodBar := '';
   bbtnCodBar.Visible := False;
   If (DMALM.cdsQry.FieldByName('FNSERIE').AsString = 'S') And
      (DMALM.cdsQry.FieldByName('ARTACTIVO').AsString <> 'ACTIVO') Then
   Begin
      wSerieCodBar := '1'; // por solo exigir Numero de Serie,  dbGridSerie sin CodBar
      Label4.Visible := False;
      Label5.Visible := False;
      edCodBAr.Visible := False;
      bbtnCodBar.Visible := False;
   End;
   If (DMALM.cdsQry.FieldByName('FNSERIE').AsString = 'N') And
      (DMALM.cdsQry.FieldByName('ARTACTIVO').AsString = 'ACTIVO') Then
   Begin
      wSerieCodBar := '2'; // por solo exigir Codigo de Barras, dbGridSerie sin Serie
      Label4.Visible := True;
      Label5.Visible := True;
      edCodBAr.Visible := True;
      bbtnCodBar.Visible := True;
   End;
   If (DMALM.cdsQry.FieldByName('FNSERIE').AsString = 'S') And
      (DMALM.cdsQry.FieldByName('ARTACTIVO').AsString = 'ACTIVO') Then
   Begin
      wSerieCodBar := '3'; // por exigir Serie y CodBarras,     dbGridSerie con Serie y CodBar
      Label4.Visible := True;
      Label5.Visible := True;
      edCodBAr.Visible := True;
      bbtnCodBar.Visible := True;
   End;
End;

Procedure TFRegNtaE.bbtnMarcaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   DMALM.cdsKDXSerie.First;
   While (Not DMALM.cdsKDXSerie.EOF) Do
   Begin
      DMALM.cdsKDXSerie.Edit;
      If (DMALM.cdsKDXSerie.FieldbyName('CIAID').AsString = dblcCIA.text) And
         (DMALM.cdsKDXSerie.FieldbyName('LOCID').AsString = dblcLOC.text) And
         (DMALM.cdsKDXSerie.FieldbyName('TINID').AsString = dblcTIN.text) And
         (DMALM.cdsKDXSerie.FieldbyName('ALMID').AsString = dblcTALM.text) And
         (DMALM.cdsKDXSerie.FieldbyName('TDAID').AsString = DMALM.cdsNIA.FieldByName('TDAID').AsString) And
         (DMALM.cdsKDXSerie.FieldbyName('NISAID').AsString = DMALM.cdsNIA.FieldByName('NISAID').AsString) And
         (DMALM.cdsKDXSerie.FieldbyName('NISATIP').AsString = DMALM.cdsNIA.FieldByName('NISATIP').AsString) Then
      Begin
         DMALM.cdsKDXSerie.FieldByName('MARCA').AsString := edMarca.Text;
         DMALM.cdsKDXSerie.FieldByName('MODELO').AsString := edModelo.Text;
         DMALM.cdsKDXSerie.FieldByName('COLOR').AsString := edColor.Text;
         DMALM.cdsKDXSerie.Post;

         xSQL := 'Update LOG332 '
            + '      Set MARCA  =' + quotedstr(edMarca.Text) + ','
            + '          MODELO =' + quotedstr(edModelo.Text) + ','
            + '          COLOR  =' + quotedstr(edColor.Text) + ','
            + '          ACFSERIE =' + quotedstr(DMALM.cdsKDXSerie.FieldByName('ACFSERIE').AsString);
         If length(DMALM.cdsKDXSerie.FieldByName('CODBAR').AsString) > 0 Then
            xSQL := xSQL + ', CODBAR = ' + quotedstr(DMALM.cdsKDXSerie.FieldByName('CODBAR').AsString);
         xSQL := xSQL
            + '    where CIAID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('CIAID').AsString)
            + '      and LOCID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('LOCID').AsString)
            + '      and TINID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('TINID').AsString)
            + '      and ALMID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('ALMID').AsString)
            + '      and TDAID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('TDAID').AsString)
            + '      and NISAID =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('NISAID').AsString)
            + '      and NISATIP=' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('NISATIP').AsString)
            + '      and ARTID  =' + quotedstr(DMALM.cdsKDXSerie.FieldbyName('ARTID').AsString)
            + '      and ITEM   =' + inttostr(DMALM.cdsKDXSerie.FieldbyName('ITEM').AsInteger);
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo actualizar la Marca, Modelo y Serie en el archivo de Nro.Series');
         End;
      End;
      DMALM.cdsKDXSerie.next;
   End;
End;

//Redondea el número a la cantidad de decimales que se indica en el argumento

Function TFRegNtaE.RoundD(x: Double; D: Integer): Double;
Var
   n: Extended;
Begin
   n := Power(10, d);
   x := x * n;
   Result := (int(x) + Int(Frac(x) * 2)) / n;
End;

Procedure TFRegNtaE.bbntnCancelLoteClick(Sender: TObject);
Begin
   pnlLote.visible := False;
End;

Procedure TFRegNtaE.ELiminarNI;
Var
   Xsql: String;
Begin

   If (trim(DMALM.cdsNIA.FieldByName('NISSIT').AsString) = 'INICIAL') And (Length(Trim(xNIngElim)) > 0) Then
   Begin
      xSQL := 'Select * '
         + '     from LOG315 '
         + '    where CIAID=' + quotedstr(DMALM.cdsNIA.FieldByName('CIAID').AsString)
         + '      and LOCID=' + quotedstr(DMALM.cdsNIA.FieldByName('LOCID').AsString)
         + '      and TINID=' + quotedstr(DMALM.cdsNIA.FieldByName('TINID').AsString)
         + '      and ALMID=' + quotedstr(DMALM.cdsNIA.FieldByName('ALMID').AsString)
         + '      and NISAID=' + quotedstr(dbeNumNISA.Text)
         + '      and NISATIP=' + quotedstr('INGRESO');
      DMALM.cdsKDX.DataRequest(xSQL);
      If DMALM.cdsKDX.RecordCount = 0 Then
      Begin
         If MessageDlg(' ¿ No ingresó detalle, Eliminar Nota de Ingreso ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            xSQl := 'Delete LOG314 '
               + '    where CIAID =' + quotedstr(DMALM.cdsNIA.FieldByName('CIAID').AsString)
               + '      and LOCID =' + quotedstr(DMALM.cdsNIA.FieldByName('LOCID').AsString)
               + '      and TINID =' + quotedstr(DMALM.cdsNIA.FieldByName('TINID').AsString)
               + '      and ALMID =' + quotedstr(DMALM.cdsNIA.FieldByName('ALMID').AsString)
               + '      and NISAID =' + quotedstr(dbeNumNISA.Text)
               + '      and NISATIP=' + quotedstr('INGRESO');
            DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
            If DMALM.wTipoAdicion = 'xFiltro' Then
            Begin
               DMALM.wModo := 'E';
               DMALM.ActualizaFiltro(mtx3000, DMALM.cdsNIA, DMALM.wModo);
            End;
         End;
      End;
   End;
End;

Procedure TFRegNtaE.GrabaSerie;
Var
   xSQL: String;
Begin
// Inicio HPC_201801_ALM
// Cambio en pruebas por Búsqueda en Maestro de Clientes
   xSQL := 'Insert into LOG332(CIAID, LOCID, TINID, ALMID, TDAID, NITDOC, NISAID, '
      + '                      NINDOC, NISATIP, KDXID, ARTID, ARTDES, GRARID, FAMID, '
      + '                      SFAMID, MARCA, MODELO, COLOR, PROV, NISANDOC, NISAFDOC, '
      + '                      NIFECHA, TMONID, ARTPCG, TCAMB, ODCID, OCNDOC, OCFECHA, '
      + '                      FACTDOC, FACNSERIE, FACNDOC, FACFECHA, NISSIT, NISIT, '
      + '                      ENTREGADO, ESTADOID, ITEM) '
      + '   values ('
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('CIAID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('LOCID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('TINID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('ALMID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('TDAID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('NITDOC').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('NISAID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('NINDOC').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('NISATIP').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('KDXID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('ARTID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('ARTDES').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('GRARID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('FAMID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('SFAMID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('MARCA').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('MODELO').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('COLOR').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('PROV').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('NISANDOC').AsString) + ', '
      + quotedstr(datetostr(DMALM.cdsKDXSerie.FieldByName('NISAFDOC').AsDateTime)) + ', '
      + quotedstr(datetostr(DMALM.cdsKDXSerie.FieldByName('NIFECHA').AsDateTime)) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('TMONID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('ARTPCG').AsString) + ', '
      + floattostr(DMALM.cdsKDXSerie.FieldByName('TCAMB').AsFloat) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('ODCID').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('OCNDOC').AsString) + ', '
      + quotedstr(datetostr(DMALM.cdsKDXSerie.FieldByName('OCFECHA').AsDateTime)) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('FACTDOC').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('FACNSERIE').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('FACNDOC').AsString) + ', '
      + quotedstr(datetostr(DMALM.cdsKDXSerie.FieldByName('FACFECHA').AsDateTime)) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('NISSIT').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('NISIT').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('ENTREGADO').AsString) + ', '
      + quotedstr(DMALM.cdsKDXSerie.FieldByName('ESTADOID').AsString) + ', '
      + inttostr(DMALM.cdsKDXSerie.FieldByName('ITEM').AsInteger) + ')';
// Fin HPC_201801_ALM
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al actualizar el número de Serie');
   End;
End;

Procedure TFRegNtaE.bbtnDetxOCClick(Sender: TObject);
Var
   sSQL: String;
Begin
// Verifica que no haya detalle
   If DMALM.cdsKDX.recordcount > 0 Then
   Begin
      ShowMessage('Sólo se puede hacer para cuando no hay Detalle');
      exit;
   End;

// Verifica que sea Ingreso por Orden de Compra
   If dblcTransac.Text <> '01' Then
   Begin
      ShowMessage('Sólo se puede hacer para Ingresos por Orden de Compra');
      exit;
   End;

   If length(trim(edNOrdC.Text)) = 0 Then
   Begin
      ShowMessage('No se ha especificado el Nro. de Orden de Compra');
      exit;
   End;

   wODCIDs := '';
// carga en variable wODCIDs las ordenes de compra
   nOrds;

   If wODCIDs = '' Then
   Begin
      ShowMessage('Nro(s) de Orden(es) de Compra no encontrados');
      exit;
   End;

   sSQL := 'Select B.ODCID, B.DODCID, B.ARTID, C.TMONID, C.ODCTCAMB, A.ARTDES DET, UNMID, '
      + '          ''G'' TPMED, '
      + '          DODCCNT CANT, '
      + '          DODCPUN PUNITR, '
      + '          NVL(DODCPUN,0) * (1 + NVL(DODCIMPU, 0) / 100) PUNITRATN, '
      + '          NVL(DODCPUN, 0) * (1 - (NVL(DODCDSCTO, 0)) / 100) PUNIT, '
      + '          NVL(DODCPUN, 0) * (1 + NVL(DODCIMPU, 0) / 100) * (1 - (NVL(DODCDSCTO, 0) / 100)) PUNITATN, '
      + '          NVL(DODCDSCTO, 0) DSCTO, NVL(IMPUNI, 0) * (1 - (NVL(DODCDSCTO, 0) / 100)) PUFIS, '
      + '          NVL(IMPUNI, 0) PUFISSD, '
      + '          A.GRARID, A.FABID, A.ARTSPRO, A.ARTSCA, A.ARTPARA, A.ARTSNA, '
      + '          A.ARTFUC, A.ARTCRGO, '
      + '          A.CUENTAID, A.TINID, A.PROV, A.FAMID, A.SFAMID, A.FNSERIE, A.ARTACTIVO, '
      + '          A.ARTCONT, A.UNMIDG, A.UNMIDU, A.ARTCPROU '
      + '     from LOG305 B, TGE205 A, LOG304 C '
      + '    where B.CIAID=' + quotedstr(dblcCia.text) + ' '
      + '      and A.CIAID = B.CIAID '
      + '      and B.CIAID = C.CIAID '
      + '      and B.ARTID = A.ARTID'
      + '      and ' + wODCIDs
      + '      and B.ODCID = C.ODCID '
      + '      and A.TINID=' + quotedstr(dblcTIN.Text)
      + '    order by ODCID, DODCID';
   DMALM.cdsSQL.Filter := '';
   DMALM.cdsSQL.Filtered := false;
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(sSQL);
   DMALM.cdsSQL.Open;

   If DMALM.cdsSQL.RecordCount = 0 Then
   Begin
      ShowMessage('Nro(s) de Orden(es) de Compra no encontrados');
      exit;
   End;
   Screen.Cursor := crHourGlass;

   DMALM.DCOM1.AppServer.IniciaTransaccion;
   DMALM.cdsSQL.First;
   While Not DMALM.cdsSQL.EOF Do
   Begin
      If DMALM.cdsSQL.FieldByName('CANT').AsFloat > 0 Then
      Begin
         DMALM.cdsKDX.Insert;
         DMALM.cdsKDX.FieldByName('CIAID').AsString := dblcCIA.text;
         DMALM.cdsKDX.FieldByName('LOCID').AsString := dblcLOC.text;
         DMALM.cdsKDX.FieldByName('TINID').AsString := dblcTIN.text;
         DMALM.cdsKDX.FieldByName('ALMID').AsString := dblcTALM.text;
         DMALM.cdsKDX.FieldByName('TDAID').AsString := dblcTDA.text;
         DMALM.cdsKDX.FieldByName('ARTID').AsString := DMALM.cdsSQL.FieldByName('ARTID').AsString;
         DMALM.cdsKDX.FieldByName('KDXID').AsString := DMALM.cdsSQL.FieldByName('DODCID').AsString;
         DMALM.cdsKDX.FieldByName('NISAID').AsString := DMALM.cdsNIA.FieldByName('NISAID').AsString;
         DMALM.cdsKDX.FieldByName('KDXFREG').AsDateTime := DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime;
         DMALM.cdsKDX.FieldByName('DOCID').AsString := DMALM.cdsNIA.FieldByName('DOCID').AsString;
         DMALM.cdsKDX.FieldByName('TMONID').AsString := DMALM.cdsSQL.FieldByName('TMONID').AsString;
         DMALM.cdsKDX.FieldByName('KDXPEDIDOG').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('KDXPEDIDOU').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('KDXCNTG').AsFloat := DMALM.FRound(DMALM.cdsSQL.FieldByName('CANT').AsFloat, 15, 4);
         DMALM.cdsKDX.FieldByName('KDXCNTU').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('GRARID').AsString := DMALM.cdsSQL.FieldByName('GRARID').AsString;
         DMALM.cdsKDX.FieldByName('FAMID').AsString := DMALM.cdsSQL.FieldByName('FAMID').AsString;
         DMALM.cdsKDX.FieldByName('SFAMID').AsString := DMALM.cdsSQL.FieldByName('SFAMID').AsString;
         DMALM.cdsKDX.FieldByName('ARTCONT').AsFloat := DMALM.cdsSQL.FieldByName('ARTCONT').AsFloat;
         DMALM.cdsKDX.FieldByName('UNMIDG').AsString := DMALM.cdsSQL.FieldByName('UNMIDG').AsString;
         DMALM.cdsKDX.FieldByName('UNMIDU').AsString := DMALM.cdsSQL.FieldByName('UNMIDU').AsString;
         DMALM.cdsKDX.FieldByName('FABID').AsString := DMALM.cdsSQL.FieldByName('FABID').AsString;
         DMALM.cdskdx.FieldByName('ARTSPRO').AsString := DMALM.cdsSQL.FieldByName('ARTSPRO').AsString;
         DMALM.cdsKDX.FieldByName('ARTSCA').AsString := DMALM.cdsSQL.FieldByName('ARTSCA').AsString;
         DMALM.cdsKDX.FieldByName('ARTPARA').AsString := DMALM.cdsSQL.FieldByName('ARTPARA').AsString;
         DMALM.cdsKDX.FieldByName('ARTSNA').AsString := DMALM.cdsSQL.FieldByName('ARTSNA').AsString;
         DMALM.cdsKDX.FieldByName('FNSERIE').AsString := DMALM.cdsSQL.FieldByName('FNSERIE').AsString;
         DMALM.cdsKDX.FieldByName('ARTFUC').AsDateTime := dbdtpFNS.date;
         DMALM.cdsKDX.FieldByName('ARTDES').AsString := DMALM.cdsSQL.FieldByName('DET').AsString;
         DMALM.cdsKDX.FieldByName('ARTCRGO').AsFloat := DMALM.cdsSQL.FieldByName('ARTCRGO').AsFloat;
         DMALM.cdsKDX.FieldByName('ARTACTIVO').AsString := DMALM.cdsSQL.FieldByName('ARTACTIVO').AsString;
         DMALM.cdsKDX.FieldByName('CUENTAID').AsString := DMALM.cdsSQL.FieldByName('CUENTAID').AsString;
         DMALM.cdsKDX.FieldByName('NISSIT').AsString := 'ACEPTADO';
         DMALM.cdsKDX.FieldByName('ARTPCG').AsString := floatToStr(DMALM.FRound(DMALM.cdsSQL.FieldByName('PUNIT').AsFloat, 15, 5));
         DMALM.cdsKDX.FieldByName('ARTPCU').AsString := floatToStr(DMALM.FRound(DMALM.cdsSQL.FieldByName('ARTCPROU').AsFloat, 15, 5));
         DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsString := floatToStr(DMALM.FRound(DMALM.cdsSQL.FieldByName('PUNIT').AsFloat, 15, 5));
         DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsString := floatToStr(DMALM.FRound(DMALM.cdsSQL.FieldByName('ARTCPROU').AsFloat, 15, 5));

         DMALM.cdsKDX.FieldByName('ARTPVG').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('ARTPVU').AsFloat := 0;

         DMALM.cdsKDX.FieldByName('KDXSALDOG').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('KDXSALDOU').AsFloat := 0;

         DMALM.cdsKDX.FieldByName('ARTTOTALG').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('ARTTOTALU').AsFloat := 0;
         DMALM.cdsKDX.FieldByName('ARTTOTAL').AsFloat := 0;

         DMALM.cdsKDX.FieldByName('TCAMB').AsFloat := DMALM.FRound(DMALM.cdsSQL.FieldByName('ODCTCAMB').AsFloat, 15, 4);
         DMALM.cdsKDX.FieldByName('PROV').AsString := '';
         DMALM.cdsKDX.FieldByName('TRIID').AsString := DMALM.cdsNIA.FieldByName('TRIID').AsString;
         DMALM.cdsKDX.FieldByName('CCOSID').AsString := DMALM.cdsNIA.FieldByName('CCOSID').AsString;
         DMALM.cdsKDX.FieldByName('NISATIP').AsString := DMALM.cdsNIA.FieldByName('NISATIP').AsString;
         DMALM.cdsKDX.FieldByName('NISASOLIC').AsString := DMALM.cdsNIA.FieldByName('NISASOLIC').AsString;
         DMALM.cdsKDX.FieldByName('NISAFREG').AsDateTime := DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime;
         DMALM.cdsKDX.FieldByName('NISANDOC').AsString := DMALM.cdsNIA.FieldByName('NISANDOC').AsString;
         DMALM.cdsKDX.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsNIA.FieldByName('NISAFDOC').AsDateTime;

         DMALM.cdsKDX.FieldbyName('KDXUSER').AsString := DMALM.wUsuario;
         DMALM.cdsKDX.FieldbyName('KDXANO').AsString := DMALM.cdsNIA.FieldByName('NISAANO').AsString;
         DMALM.cdsKDX.FieldbyName('KDXMM').AsString := DMALM.cdsNIA.FieldByName('NISAMES').AsString;
         DMALM.cdsKDX.FieldbyName('KDXDD').AsString := DMALM.cdsNIA.FieldByName('NISADIA').AsString;
         DMALM.cdsKDX.FieldbyName('KDXANOMM').AsString := DMALM.cdsNIA.FieldByName('NISAANOMES').AsString;
         DMALM.cdsKDX.FieldbyName('KDXTRI').AsString := DMALM.cdsNIA.FieldByName('NISATRIM').AsString;
         DMALM.cdsKDX.FieldbyName('KDXSEM').AsString := DMALM.cdsNIA.FieldByName('NISASEM').AsString;
         DMALM.cdsKDX.FieldbyName('KDXSS').AsString := DMALM.cdsNIA.FieldByName('NISASS').AsString;
         DMALM.cdsKDX.FieldbyName('KDXAATRI').AsString := DMALM.cdsNIA.FieldByName('NISAAATRI').AsString;
         DMALM.cdsKDX.FieldbyName('KDXAASEM').AsString := DMALM.cdsNIA.FieldByName('NISAAASEM').AsString;
         DMALM.cdsKDX.FieldbyName('KDXAASS').AsString := DMALM.cdsNIA.FieldByName('NISAAASS').AsString;

         DMALM.cdsKDX.FieldbyName('KDXFREG').AsDateTime := Date;

         DMALM.cdsKDX.FieldbyName('KDXHREG').AsDateTime := Date + SysUtils.Time;

         DMALM.cdsKDX.FieldbyName('CUENTA2ID').AsString := wCuenta;
         DMALM.cdsKDX.FieldbyName('KDXCVTAS').AsString := wTricvtas;

         DMALM.cdsKDX.Post;

         xSQL := ' Insert into LOG315( CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, KDXID, NISSIT, '
            + '                        PROV,DOCID,TRIID,ARTID,ARTPCU,ARTPCG,ARTPVU,ARTPVG,KDXCNTG,KDXCNTU,KDXPEDIDOG,KDXPEDIDOU, '
            + '                        KDXSALDOG,KDXSALDOU,ARTCONT,UNMIDG,UNMIDU,GRARID,FABID,ARTSPRO,ARTSCA,ARTPARA,ARTSNA,ARTFUC,TMONID, '
            + '                        ARTCRGO,ARTACTIVO,CUENTAID,ODCID,CCOSID,NISASOLIC,NISAFREG,NISANDOC,NISAFDOC,KDXUSER,KDXFREG,KDXHREG,KDXANO,KDXMM, '
            + '                        KDXDD,KDXTRI,KDXSEM,KDXSS,KDXANOMM,KDXAATRI,KDXAASEM,KDXAASS,FLAGVAR,CALID,DODCID,ARTDES,KDXNREQ,FAMID,SFAMID, '
            + '                        CUENTA2ID,KDXCVTAS,ARTMORIPCG,ARTMORIPCU,TCAMB,SITUACION,NISAATERQS,FNSERIE,ACFREG,ARTTOTALG,ARTTOTALU,ARTTOTAL, '
            + '                        KDXFLAG,PROVRUC,COSREPO,CLAUXID,COSARTFAC,IMPNOTCRE) '
            + '    Values( ' + quotedstr(DMALM.cdsKDX.fieldbyname('CIAID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('LOCID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('TINID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('ALMID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('TDAID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('NISAID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('NISATIP').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('NISSIT').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('PROV').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('DOCID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('TRIID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('ARTID').AsString) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('ARTPCU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('ARTPCG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('ARTPVU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('ARTPVG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('KDXCNTG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('KDXCNTU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('KDXPEDIDOG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('KDXPEDIDOU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('KDXSALDOG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('KDXSALDOU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('ARTCONT').AsFloat) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('UNMIDG').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('UNMIDU').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('GRARID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('FABID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('ARTSPRO').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('ARTSCA').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('ARTPARA').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('ARTSNA').AsString) + ', '
            + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('ARTFUC').AsDateTime)) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('TMONID').AsString) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('ARTCRGO').AsFloat) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('ARTACTIVO').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('CUENTAID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('ODCID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('CCOSID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('NISASOLIC').AsString) + ', '
            + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('NISAFREG').AsDateTime)) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('NISANDOC').AsString) + ', '
            + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('NISAFDOC').AsDateTime)) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXUSER').AsString) + ', '
            + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('KDXFREG').AsDateTime)) + ', '
            + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('KDXHREG').AsDateTime)) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXANO').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXMM').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXDD').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXTRI').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXSEM').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXSS').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXANOMM').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXAATRI').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXAASEM').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXAASS').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('FLAGVAR').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('CALID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('DODCID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('ARTDES').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXNREQ').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('FAMID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('SFAMID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('CUENTA2ID').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXCVTAS').AsString) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('ARTMORIPCG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('ARTMORIPCU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('TCAMB').AsFloat) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('SITUACION').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('NISAATERQS').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('FNSERIE').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('ACFREG').AsString) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('ARTTOTALG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('ARTTOTALU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('ARTTOTAL').AsFloat) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('KDXFLAG').AsString) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('PROVRUC').AsString) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('COSREPO').AsFloat) + ', '
            + quotedstr(DMALM.cdsKDX.fieldbyname('CLAUXID').AsString) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('COSARTFAC').AsFloat) + ', '
            + floattostr(DMALM.cdsKDX.fieldbyname('IMPNOTCRE').AsFloat) + ') ';
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al Insertar Datos del detalle de la Nota de Salida - LOG315');
            DMALM.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            exit;
         End;
      End;
      DMALM.cdsSQL.Next;
      Screen.Cursor := crHourGlass;
   End;
   Screen.Cursor := crDefault;
   DMALM.DCOM1.AppServer.GrabaTransaccion;
   ShowMessage('Detalle correctamente actualizado, recalcule saldos');
End;

Procedure TFRegNtaE.bbtnRecalSldClick(Sender: TObject);
Begin
   DMALM.cdsKDX.First;
   While Not DMALM.cdsKDX.Eof Do
   Begin
      xSQL := 'BEGIN DB2ADMIN.SP_ALM_REGENERA_STOCK('
         + quotedstr(DMALM.cdsKDX.FieldByName('CIAID').AsString) + ','
         + quotedstr(DMALM.cdsKDX.FieldByName('ARTID').AsString) + '); END;';
      Try
         DMALM.DCOM1.AppServer.IniciaTransaccion;
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         DMALM.DCOM1.AppServer.GrabaTransaccion;
      Except
         ShowMessage('Error al Actualizar los Saldos del Artículo');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         exit;
      End;
      DMALM.cdsKDX.Next;
   End;
   ShowMessage('Saldos actualizados');
End;

Procedure TFRegNtaE.bbtnDetxTransfClick(Sender: TObject);
Var
   sSQL: String;
Begin
// Verifica que no haya detalle
   If DMALM.cdsKDX.recordcount > 0 Then
   Begin
      ShowMessage('Sólo se puede hacer para cuando no hay Detalle');
      exit;
   End;

// Verifica que sea Ingreso por Transferencia
   If dblcTransac.Text <> '07' Then
   Begin
      ShowMessage('Sólo se puede hacer para Ingresos por Transferencia');
      exit;
   End;

// Verifica datos de Origen
// Almacén
   If length(DMALM.cdsNIA.FieldByName('ALMORIID').AsString) = 0 Then
   Begin
      ShowMessage('No hay datos de Almacén de Origen');
      exit;
   End;
// Nota de Salida de Origen
   If length(DMALM.cdsNIA.FieldByName('NISAORIID').AsString) = 0 Then
   Begin
      ShowMessage('No hay datos de Nota de Salida de Origen');
      exit;
   End;

   sSQL := 'Select B.CIAID,     B.LOCID,    B.TINID,     B.ALMID,      B.TDAID,      B.ARTID, B.KDXID, B.NISAID, '
      + '          B.KDXFREG,   B.DOCID,    B.TMONID,    B.KDXPEDIDOG, B.KDXPEDIDOU, B.KDXCNTG, '
      + '          B.KDXCNTU,   B.GRARID,   B.FAMID,     B.SFAMID,     B.ARTCONT,    B.UNMIDG, B.UNMIDU, B.FABID, '
      + '          B.ARTSPRO,   B.ARTSCA,   B.ARTPARA,   B.ARTSNA,     B.FNSERIE,    B.ARTFUC, B.ARTDES, B.ARTCRGO, '
      + '          B.ARTACTIVO, B.CUENTAID, B.NISSIT,    B.ARTPCG,     B.ARTPCU,     B.ARTMORIPCG, B.ARTMORIPCU, '
      + '          B.ARTPVG,    B.ARTPVU,   B.KDXSALDOG, B.KDXSALDOU,  B.ARTTOTALG,  B.ARTTOTALU, B.ARTTOTAL, '
      + '          B.TCAMB,     B.PROV,     B.TRIID,     B.CCOSID,     B.NISATIP,    B.NISASOLIC, B.NISAFREG, B.NISANDOC, '
      + '          B.NISAFDOC,  B.KDXUSER,  B.KDXANO,    B.KDXMM,      B.KDXDD,      B.KDXANOMM, B.KDXTRI, B.KDXSEM, '
      + '          B.KDXSS,     B.KDXAATRI, B.KDXAASEM,  B.KDXAASS,    B.KDXFREG,    B.KDXHREG, B.CUENTA2ID, B.KDXCVTAS '
      + '     from LOG315 B '
      + '    where B.CIAID=' + quotedstr(dblcCia.text)
      + '      and B.NISATIP=''SALIDA'' '
      + '      and B.ALMID = ' + quotedstr(DMALM.cdsNIA.FieldByName('ALMORIID').AsString)
      + '      and B.NISAID = ' + quotedstr(DMALM.cdsNIA.FieldByName('NISAORIID').AsString)
      + '    order by B.ODCID, B.DODCID';
   DMALM.cdsSQL.Filter := '';
   DMALM.cdsSQL.Filtered := false;
   DMALM.cdsSQL.IndexFieldNames := '';
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(sSQL);
   DMALM.cdsSQL.Open;

   If DMALM.cdsSQL.RecordCount = 0 Then
   Begin
      ShowMessage('Nota de Salida no encontrada');
      exit;
   End;
   Screen.Cursor := crHourGlass;

   DMALM.DCOM1.AppServer.IniciaTransaccion;
   DMALM.cdsSQL.First;
   While Not DMALM.cdsSQL.EOF Do
   Begin
      DMALM.cdsKDX.Insert;
      DMALM.cdsKDX.FieldByName('CIAID').AsString := DMALM.cdsSQL.FieldByName('CIAID').AsString;
      DMALM.cdsKDX.FieldByName('LOCID').AsString := dblcLOC.Text;
      DMALM.cdsKDX.FieldByName('TINID').AsString := dblcTIN.Text;
      DMALM.cdsKDX.FieldByName('ALMID').AsString := dblcTALM.Text;
      DMALM.cdsKDX.FieldByName('NISATIP').AsString := 'INGRESO';
      DMALM.cdsKDX.FieldByName('NISAID').AsString := dbeNumNISA.Text;

      DMALM.cdsKDX.FieldByName('NISSIT').AsString := DMALM.cdsSQL.FieldByName('NISSIT').AsString;
      DMALM.cdsKDX.FieldByName('TDAID').AsString := DMALM.cdsNIA.FieldByName('TDAID').AsString;
      DMALM.cdsKDX.FieldByName('ARTID').AsString := DMALM.cdsSQL.FieldByName('ARTID').AsString;
      DMALM.cdsKDX.FieldByName('KDXID').AsString := DMALM.cdsSQL.FieldByName('KDXID').AsString;
      DMALM.cdsKDX.FieldByName('KDXFREG').AsDateTime := DMALM.cdsSQL.FieldByName('KDXFREG').AsDateTime;
      DMALM.cdsKDX.FieldByName('DOCID').AsString := DMALM.cdsSQL.FieldByName('DOCID').AsString;
      DMALM.cdsKDX.FieldByName('TMONID').AsString := DMALM.cdsSQL.FieldByName('TMONID').AsString;
      DMALM.cdsKDX.FieldByName('KDXPEDIDOG').AsFloat := DMALM.cdsSQL.FieldByName('KDXPEDIDOG').AsFloat;
      DMALM.cdsKDX.FieldByName('KDXPEDIDOU').AsFloat := DMALM.cdsSQL.FieldByName('KDXPEDIDOU').AsFloat;
      DMALM.cdsKDX.FieldByName('KDXCNTG').AsFloat := DMALM.cdsSQL.FieldByName('KDXCNTG').AsFloat;
      DMALM.cdsKDX.FieldByName('KDXCNTU').AsFloat := DMALM.cdsSQL.FieldByName('KDXCNTU').AsFloat;
      DMALM.cdsKDX.FieldByName('GRARID').AsString := DMALM.cdsSQL.FieldByName('GRARID').AsString;
      DMALM.cdsKDX.FieldByName('FAMID').AsString := DMALM.cdsSQL.FieldByName('FAMID').AsString;
      DMALM.cdsKDX.FieldByName('SFAMID').AsString := DMALM.cdsSQL.FieldByName('SFAMID').AsString;
      DMALM.cdsKDX.FieldByName('ARTCONT').AsFloat := DMALM.cdsSQL.FieldByName('ARTCONT').AsFloat;
      DMALM.cdsKDX.FieldByName('UNMIDG').AsString := DMALM.cdsSQL.FieldByName('UNMIDG').AsString;
      DMALM.cdsKDX.FieldByName('UNMIDU').AsString := DMALM.cdsSQL.FieldByName('UNMIDU').AsString;
      DMALM.cdsKDX.FieldByName('FABID').AsString := DMALM.cdsSQL.FieldByName('FABID').AsString;
      DMALM.cdskdx.FieldByName('ARTSPRO').AsString := DMALM.cdsSQL.FieldByName('ARTSPRO').AsString;
      DMALM.cdsKDX.FieldByName('ARTSCA').AsString := DMALM.cdsSQL.FieldByName('ARTSCA').AsString;
      DMALM.cdsKDX.FieldByName('ARTPARA').AsString := DMALM.cdsSQL.FieldByName('ARTPARA').AsString;
      DMALM.cdsKDX.FieldByName('ARTSNA').AsString := DMALM.cdsSQL.FieldByName('ARTSNA').AsString;
      DMALM.cdsKDX.FieldByName('FNSERIE').AsString := DMALM.cdsSQL.FieldByName('FNSERIE').AsString;
      DMALM.cdsKDX.FieldByName('ARTFUC').AsDateTime := DMALM.cdsSQL.FieldByName('ARTFUC').AsDateTime;
      DMALM.cdsKDX.FieldByName('ARTDES').AsString := DMALM.cdsSQL.FieldByName('ARTDES').AsString;
      DMALM.cdsKDX.FieldByName('ARTCRGO').AsFloat := DMALM.cdsSQL.FieldByName('ARTCRGO').AsFloat;
      DMALM.cdsKDX.FieldByName('ARTACTIVO').AsString := DMALM.cdsSQL.FieldByName('ARTACTIVO').AsString;
      DMALM.cdsKDX.FieldByName('CUENTAID').AsString := DMALM.cdsSQL.FieldByName('CUENTAID').AsString;
      DMALM.cdsKDX.FieldByName('ARTPCG').AsString := DMALM.cdsSQL.FieldByName('ARTPCG').AsString;
      DMALM.cdsKDX.FieldByName('ARTPCU').AsString := DMALM.cdsSQL.FieldByName('ARTPCU').AsString;
      DMALM.cdsKDX.FieldByName('ARTMORIPCG').AsString := DMALM.cdsSQL.FieldByName('ARTMORIPCG').AsString;
      DMALM.cdsKDX.FieldByName('ARTMORIPCU').AsString := DMALM.cdsSQL.FieldByName('ARTMORIPCU').AsString;
      DMALM.cdsKDX.FieldByName('ARTPVG').AsFloat := DMALM.cdsSQL.FieldByName('ARTPVG').AsFloat;
      DMALM.cdsKDX.FieldByName('ARTPVU').AsFloat := DMALM.cdsSQL.FieldByName('ARTPVU').AsFloat;
      DMALM.cdsKDX.FieldByName('KDXSALDOG').AsFloat := DMALM.cdsSQL.FieldByName('KDXSALDOG').AsFloat;
      DMALM.cdsKDX.FieldByName('KDXSALDOU').AsFloat := DMALM.cdsSQL.FieldByName('KDXSALDOU').AsFloat;
      DMALM.cdsKDX.FieldByName('ARTTOTALG').AsFloat := DMALM.cdsSQL.FieldByName('ARTTOTALG').AsFloat;
      DMALM.cdsKDX.FieldByName('ARTTOTALU').AsFloat := DMALM.cdsSQL.FieldByName('ARTTOTALU').AsFloat;
      DMALM.cdsKDX.FieldByName('ARTTOTAL').AsFloat := DMALM.cdsSQL.FieldByName('ARTTOTAL').AsFloat;
      DMALM.cdsKDX.FieldByName('TCAMB').AsFloat := DMALM.cdsSQL.FieldByName('TCAMB').AsFloat;
      DMALM.cdsKDX.FieldByName('PROV').AsString := DMALM.cdsSQL.FieldByName('PROV').AsString;
      DMALM.cdsKDX.FieldByName('TRIID').AsString := DMALM.cdsSQL.FieldByName('TRIID').AsString;
      DMALM.cdsKDX.FieldByName('CCOSID').AsString := DMALM.cdsSQL.FieldByName('CCOSID').AsString;
      DMALM.cdsKDX.FieldByName('NISASOLIC').AsString := DMALM.cdsSQL.FieldByName('NISASOLIC').AsString;
      DMALM.cdsKDX.FieldByName('NISAFREG').AsDateTime := DMALM.cdsSQL.FieldByName('NISAFREG').AsDateTime;
      DMALM.cdsKDX.FieldByName('NISANDOC').AsString := DMALM.cdsSQL.FieldByName('NISANDOC').AsString;
      DMALM.cdsKDX.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsSQL.FieldByName('NISAFDOC').AsDateTime;
      DMALM.cdsKDX.FieldbyName('KDXUSER').AsString := DMALM.cdsSQL.FieldbyName('KDXUSER').AsString;
      DMALM.cdsKDX.FieldbyName('KDXANO').AsString := DMALM.cdsSQL.FieldbyName('KDXANO').AsString;
      DMALM.cdsKDX.FieldbyName('KDXMM').AsString := DMALM.cdsSQL.FieldbyName('KDXMM').AsString;
      DMALM.cdsKDX.FieldbyName('KDXDD').AsString := DMALM.cdsSQL.FieldbyName('KDXDD').AsString;
      DMALM.cdsKDX.FieldbyName('KDXANOMM').AsString := DMALM.cdsSQL.FieldbyName('KDXANOMM').AsString;
      DMALM.cdsKDX.FieldbyName('KDXTRI').AsString := DMALM.cdsSQL.FieldbyName('KDXTRI').AsString;
      DMALM.cdsKDX.FieldbyName('KDXSEM').AsString := DMALM.cdsSQL.FieldbyName('KDXSEM').AsString;
      DMALM.cdsKDX.FieldbyName('KDXSS').AsString := DMALM.cdsSQL.FieldbyName('KDXSS').AsString;
      DMALM.cdsKDX.FieldbyName('KDXAATRI').AsString := DMALM.cdsSQL.FieldbyName('KDXAATRI').AsString;
      DMALM.cdsKDX.FieldbyName('KDXAASEM').AsString := DMALM.cdsSQL.FieldbyName('KDXAASEM').AsString;
      DMALM.cdsKDX.FieldbyName('KDXAASS').AsString := DMALM.cdsSQL.FieldbyName('KDXAASS').AsString;
      DMALM.cdsKDX.FieldbyName('KDXFREG').AsDateTime := DMALM.cdsSQL.FieldbyName('KDXFREG').AsDateTime;
      DMALM.cdsKDX.FieldbyName('KDXHREG').AsDateTime := DMALM.cdsSQL.FieldbyName('KDXHREG').AsDateTime;
      DMALM.cdsKDX.FieldbyName('CUENTA2ID').AsString := DMALM.cdsSQL.FieldbyName('CUENTA2ID').AsString;
      DMALM.cdsKDX.FieldbyName('KDXCVTAS').AsString := DMALM.cdsSQL.FieldbyName('KDXCVTAS').AsString;
      DMALM.cdsKDX.Post;

      xSQL := ' Insert into LOG315( CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, KDXID, NISSIT, '
         + '                        PROV,DOCID,TRIID,ARTID,ARTPCU,ARTPCG,ARTPVU,ARTPVG,KDXCNTG,KDXCNTU,KDXPEDIDOG,KDXPEDIDOU, '
         + '                        KDXSALDOG,KDXSALDOU,ARTCONT,UNMIDG,UNMIDU,GRARID,FABID,ARTSPRO,ARTSCA,ARTPARA,ARTSNA,ARTFUC,TMONID, '
         + '                        ARTCRGO,ARTACTIVO,CUENTAID,ODCID,CCOSID,NISASOLIC,NISAFREG,NISANDOC,NISAFDOC,KDXUSER,KDXFREG,KDXHREG,KDXANO,KDXMM, '
         + '                        KDXDD,KDXTRI,KDXSEM,KDXSS,KDXANOMM,KDXAATRI,KDXAASEM,KDXAASS,FLAGVAR,CALID,DODCID,ARTDES,KDXNREQ,FAMID,SFAMID, '
         + '                        CUENTA2ID,KDXCVTAS,ARTMORIPCG,ARTMORIPCU,TCAMB,SITUACION,NISAATERQS,FNSERIE,ACFREG,ARTTOTALG,ARTTOTALU,ARTTOTAL, '
         + '                        KDXFLAG,PROVRUC,COSREPO,CLAUXID,COSARTFAC,IMPNOTCRE) '
         + '    Values( ' + quotedstr(DMALM.cdsKDX.fieldbyname('CIAID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('LOCID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('TINID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ALMID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('TDAID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISAID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISATIP').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISSIT').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('PROV').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('DOCID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('TRIID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTID').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTPCU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTPCG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTPVU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTPVG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXCNTG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXCNTU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXPEDIDOG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXPEDIDOU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXSALDOG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('KDXSALDOU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTCONT').AsFloat) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('UNMIDG').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('UNMIDU').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('GRARID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('FABID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTSPRO').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTSCA').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTPARA').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTSNA').AsString) + ', '
         + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('ARTFUC').AsDateTime)) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('TMONID').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTCRGO').AsFloat) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTACTIVO').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('CUENTAID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ODCID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('CCOSID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISASOLIC').AsString) + ', '
         + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('NISAFREG').AsDateTime)) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISANDOC').AsString) + ', '
         + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('NISAFDOC').AsDateTime)) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXUSER').AsString) + ', '
         + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('KDXFREG').AsDateTime)) + ', '
         + quotedstr(datetostr(DMALM.cdsKDX.fieldbyname('KDXHREG').AsDateTime)) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXANO').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXMM').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXDD').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXTRI').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXSEM').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXSS').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXANOMM').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXAATRI').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXAASEM').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXAASS').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('FLAGVAR').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('CALID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('DODCID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ARTDES').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXNREQ').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('FAMID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('SFAMID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('CUENTA2ID').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXCVTAS').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTMORIPCG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTMORIPCU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('TCAMB').AsFloat) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('SITUACION').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('NISAATERQS').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('FNSERIE').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('ACFREG').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTTOTALG').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTTOTALU').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('ARTTOTAL').AsFloat) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('KDXFLAG').AsString) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('PROVRUC').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('COSREPO').AsFloat) + ', '
         + quotedstr(DMALM.cdsKDX.fieldbyname('CLAUXID').AsString) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('COSARTFAC').AsFloat) + ', '
         + floattostr(DMALM.cdsKDX.fieldbyname('IMPNOTCRE').AsFloat) + ') ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al Insertar Datos del detalle de la Nota de Salida - LOG315');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         exit;
      End;
      DMALM.cdsSQL.Next;
      Screen.Cursor := crHourGlass;
   End;
   Screen.Cursor := crDefault;
   DMALM.DCOM1.AppServer.GrabaTransaccion;
   ShowMessage('Detalle correctamente actualizado, recalcule saldos');
End;

Procedure TFRegNtaE.Button1Click(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select NISAID, NISAFREG FROM LOG315 '
      + '    where CIAID=' + QuotedStr(dblcCIA.text)
      + '      and LOCID=' + QuotedStr(dblcLOC.text)
      + '      and TINID=' + QuotedStr(dblcTIN.text)
      + '      and ALMID=' + QuotedStr(dblcTALM.text)
      + '      and NISATIP=''INGRESO'' '
      + '      and TDAID  =' + quotedstr(dblcTDA.Text)
      + '      and NISAID=' + quotedstr(dbeNumNISA.Text)
      + '      and NISSIT=''ACEPTADO'' '
      + '    order by NISAID';
   DMALM.cdsParaRepo.Close;
   DMALM.cdsParaRepo.DataRequest(xSQL);
   DMALM.cdsParaRepo.Open;
   If DMALM.cdsParaRepo.RecordCount = 0 Then
   Begin
      xSQL := 'Update LOG314 '
         + '      Set NISSIT =''INICIAL'' '
         + '    where CIAID  =' + quotedstr(dblcCIA.text)
         + '      and LOCID  =' + quotedstr(dblcLOC.text)
         + '      and TINID  =' + quotedstr(dblcTIN.text)
         + '      and ALMID  =' + quotedstr(dblcTALM.text)
         + '      and TDAID  =' + quotedstr(dblcTDA.Text)
         + '      and NISAID =' + quotedstr(dbeNumNISA.Text)
         + '      and NISATIP=''INGRESO'' ';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar el código de barra en el archivo de Nro.Series');
      End;
   End;
End;

Procedure TFRegNtaE.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

End.

