Unit ALM201IN;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : ALM201IN
//Formulario               : FRegNtaSAL
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Ventana de Registro de Notas de Salida

//31/08/2000 PJSV            SE DESACTIVA PORQUE HAY UNA NUEO PROCESO PARA VALIDAR
//                            SI ES QUE EXISTE UN CIERRE OPERATIVO, EL CUAL SE ACTIVA CUANDO UNO ESCOGE LA
//                            FECHA DE LA NOTA O CUANDO SE PRESIONA Z2bbtnOK
// HPP_201102_ALM 17/02/2011: Se incrementa el grado de precisión en los cálculos a 5 decimales
//                            Por ese motivo se modifica la asignación y el redondeo
//                            de los campos de montos en las Notas de salida
// HPP_201104_ALM 19/04/2011: Se implementa la funcionalidad que permite actualizar el
//                            maestro de activos a estado A cuando se acepta la nota de salida.
//                            Además se actualiza la tabla LOG332
// HPC_201106_ALM 16/09/2011: Se modificó la ventana de Registro de Notas de Salida
//                            el cambio consistió en:
//                            1.- Cuando se presiona el botón de grabar la nota de
//                                Salida queda grabada en la Base de Datos
//                            2.- Cuando se edita la cabecera (presionar el botón de la "manito"
//                                y se desea grabar y aceptar la Nota de Salida se
//                                habilitará el botón grabar y posteriormente el botón Aceptar
// HPC_201303_ALM 08/05/2013 Al momento de  insertar una Nota de Salida  de artículos y querer seleccionar
//                           un almacén no se está mostrando los almacenes DESACTIVADO.
// HPC_201307_ALM 25/10/2013 Modifica ACEPTACION de Nota de Ingreso para que utilice procedimientos de Base de Datos

//                            y grabación hacia Archivos de Saldos (LOG316, LOG337, LOG319)
// HPC_201401_ALM  06/06/2014 En los ingresos y salidas de ARTICULOS, si esta marcado como inactivos no se muestra en la lista de consulta
//                            de artículos y si se digita muestra el siguiente mensaje de error. "ARTICULO INACTIVO" no dejando continuar con el proceso
// HPC_201403_ALM  12/09/2014 Se revisa el control de Transacciones, se adiciona en tres puntos: inicializacion de cabecera de Nota de SaLida,
//                            Grabación de Nota de Salida y Aceptación de Nota de Salida.
// HPC_201404_ALM  05/11/2014 Actualiza FLAG Activo Fijo
//                 11/11/2014 Se cambia formato de impresión de Guia valorizada, coordinado con S.G.
// HPC_201501_ALM  23/02/2015 Observaciones a cambiar
// HPC_201502_ALM  18/06/2015 Ajustes a grabación de artículos con Nro.Serie
// HPC_201503_ALM  21/08/2015 Al momento de seleccionar el Listado de Articulos se esta excluyendo los Articulos
// HPC_201504_ALM  26/08/2015 Se cambia la llave de numeración a CIA+ALMACEN+TIPO_NOTA+Nro.Nota
//                 25/08/2015 Se condiciona para que no se consideren salidas de Artículos que son ACTIVOS FIJOS
// HPC_201604_ALM  18/05/2016 Ajustes para no utilizar tabla LOG316
// HPC_201605_ALM 04/07/2016: Se agrega estado "ELIMINADO" a notas de ingreso y notas de salida
//                            solo cuando estan en estado INICIAL. Se excluye eliminado físico.
//                            Se incluye actualización de usuario que acepta la NI/NS
// HPC_201607_ALM 08/08/2016  Grabación de campo NISAFREG en ACEPTACION de acuerdo a lo indicadd en campo de Fecha de la Nota de Salida
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
// HPC_201801_ALM 02/04/2018 Cambio en pruebas por Búsqueda en Maestro de Clientes
//

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
   wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
   Wwdbigrd, Wwdbgrid, dbclient, Wwdbspin, ppBands, ppCtrls, ppVar,
   ppStrtch, ppMemo, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
   ppCache, ppDB, ppDBPipe, ppViewr, wwClient, ppEndUsr, ppSubRpt, Variants,
   ppTypes, ppParameter, MsgDlgs;

Type
   TFRegNtaSAL = Class(TForm)
      pnlCabecera: TPanel;
      dblcCIA: TwwDBLookupCombo;
      lblCIA: TLabel;
      Z2bbtnOK: TBitBtn;
      Z2bbtnBorrar: TBitBtn;
      lblNumNS: TLabel;
      dbmObs: TDBMemo;
      lblObs: TLabel;
      pnlDetalleG: TPanel;
      dbgDReqs: TwwDBGrid;
      pnlDetalleA: TPanel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      dbeItem: TwwDBEdit;
      dbeArti: TwwDBEdit;
      dbcldArti: TwwDBLookupComboDlg;
      dbeCantidadG: TwwDBEdit;
      lblItem: TLabel;
      lblArti: TLabel;
      lblCntS: TLabel;
      bvlDetalle: TBevel;
      Bevel1: TBevel;
      Z2dbgDReqsIButton: TwwIButton;
      dblcTALM: TwwDBLookupCombo;
      Label2: TLabel;
      dbdtpFNS: TwwDBDateTimePicker;
      lblFReg: TLabel;
      lblTDocumento: TLabel;
      lblNDoc: TLabel;
      dbeNDoc: TwwDBEdit;
      lblFDoc: TLabel;
      dbdtpFDoc: TwwDBDateTimePicker;
      dbeSolic: TwwDBEdit;
      lblSolic: TLabel;
      dblcdTDOC: TwwDBLookupComboDlg;
      Label1: TLabel;
      dbePedidoG: TwwDBEdit;
      lblTransacc: TLabel;
      dblcTransac: TwwDBLookupCombo;
      dbeTransac: TwwDBEdit;
      lblCC: TLabel;
      dblcdCC: TwwDBLookupComboDlg;
      dbeCC: TwwDBEdit;
      dblcdClie: TwwDBLookupComboDlg;
      lblClie: TLabel;
      dbeClie: TwwDBEdit;
      Label7: TLabel;
      dblcTDA: TwwDBLookupCombo;
      dbeTDNISA: TwwDBEdit;
      Bevel2: TBevel;
      Label3: TLabel;
      dblcLOC: TwwDBLookupCombo;
      stxTitulo2: TPanel;
      stxTitulo1: TPanel;
      lblSerie: TLabel;
      dbeSerie: TwwDBEdit;
      Label6: TLabel;
      deObra: TwwDBEdit;
      Label8: TLabel;
      dbeLote1: TwwDBEdit;
      Label9: TLabel;
      dbePO: TwwDBEdit;
      Label10: TLabel;
      dbeNP: TwwDBEdit;
      Label11: TLabel;
      dblcLOCOri: TwwDBLookupCombo;
      Label12: TLabel;
      dblcTALMOri: TwwDBLookupCombo;
      lblMedGnrl: TLabel;
      lblMedUni: TLabel;
      dbePedidoU: TwwDBEdit;
      dbeCantidadU: TwwDBEdit;
      Z2bbtnAceptar: TBitBtn;
      Z2bbtnRegresa: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      lblEstado: TLabel;
      pnlActuali: TPanel;
      lblActuali: TLabel;
      dbeDOCS: TEdit;
      Z2bbtnSalir: TBitBtn;
      Label4: TLabel;
      dblcTInv: TwwDBLookupCombo;
      dbeCIA: TEdit;
      dbeLOC: TEdit;
      dbeTinv: TEdit;
      dbeALM: TEdit;
      Label5: TLabel;
      dblcTINOri: TwwDBLookupCombo;
      dbeALMOri: TEdit;
      dbeTINOri: TEdit;
      dbeLOCOri: TEdit;
      chkBxAtendido: TCheckBox;
      Z2bbtnPrint: TBitBtn;
      ppDBCab: TppDBPipeline;
      ppdbOC: TppDBPipeline;
      pprNisSal: TppReport;
      pnlActualizando: TPanel;
      lblActualizando: TLabel;
      lblProv: TLabel;
      dblcdProv: TwwDBLookupComboDlg;
      dbeProv: TEdit;
      pnlTransf: TPanel;
      BitBtn1: TBitBtn;
      bbtnSalirTranf: TBitBtn;
      dblcdRequerimiento: TwwDBLookupComboDlg;
      lblReqUsuario: TLabel;
      bbtnLote: TBitBtn;
      pnlLote: TPanel;
      Label13: TLabel;
      Label14: TLabel;
      StaticText2: TStaticText;
      dbdtpFecLote: TwwDBDateTimePicker;
      bbntnCancelLote: TBitBtn;
      Label16: TLabel;
      dbcldArtiDestino: TwwDBLookupComboDlg;
      dbeArtiDest: TwwDBEdit;
      Panel1: TPanel;
      Z2bbtnTransEqui: TBitBtn;
      lblMedGnrlDest: TLabel;
      lblMedUniDest: TLabel;
      Label19: TLabel;
      dbeCantGDest: TwwDBEdit;
      dbeCantUDest: TwwDBEdit;
      bbtnKDXSerie: TBitBtn;
      pnlKDXSerie: TPanel;
      lblCodigo: TLabel;
      lblDescripcion: TLabel;
      StaticText1: TStaticText;
      bbtnOKKDXSerie: TBitBtn;
      bbtnCancelKDXSerie: TBitBtn;
      dbgGridSerie: TwwDBGrid;
      ppDesigner1: TppDesigner;
      ppDBSerie: TppDBPipeline;
      pprSeries: TppReport;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppLabel16: TppLabel;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppDBText15: TppDBText;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppDBText18: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppLine7: TppLine;
      ppDetailBand2: TppDetailBand;
      ppDBText14: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      dblcdNroLote: TwwDBLookupComboDlg;
      lblImpRepo: TLabel;
      dbeImpRepo: TwwDBEdit;
      Label17: TLabel;
      ppParameterList2: TppParameterList;
      ppHeaderBand4: TppHeaderBand;
      ppDBText49: TppDBText;
      ppDBText58: TppDBText;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel37: TppLabel;
      ppLabel42: TppLabel;
      ppLabel44: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLabel1: TppLabel;
      ppDBMemo3: TppDBMemo;
      ppLabel2: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel7: TppLabel;
      ppDBText7: TppDBText;
      ppDBText1: TppDBText;
      ppLine3: TppLine;
      ppLabel6: TppLabel;
      ppLabel8: TppLabel;
      pplblCosRepo: TppLabel;
      pplblCosRepo1: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText60: TppDBText;
      ppDBText62: TppDBText;
      ppDBText63: TppDBText;
      ppDBMemo2: TppDBMemo;
      ppDBText4: TppDBText;
      ppDBText3: TppDBText;
      ppDBText8: TppDBText;
      ppdbCosRepo: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppDBText2: TppDBText;
      ppLabel5: TppLabel;
      ppSummaryBand4: TppSummaryBand;
      ppLabel9: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppLabel10: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppLine4: TppLine;
      ppLine5: TppLine;
      dblcdNDoc: TwwDBLookupComboDlg;
      lblTCambio: TLabel;
      dbeTCambio: TwwDBEdit;
      chkdis: TCheckBox;
      Label18: TLabel;
      Panel2: TPanel;
      dbeNumNISA: TwwDBEdit;
   // Inicio HPC_201502_ALM
      ppLabel11: TppLabel;
      ppDBText9: TppDBText;
   // Fin HPC_201502_ALM
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure Z2bbtnBorrarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure Z2bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure Z2dbgDReqsIButtonClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure dbgDReqsKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure dbgDReqsDblClick(Sender: TObject);
      Procedure dbeNumNISAExit(Sender: TObject);
      Procedure dbmObsKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dbeCantidadGExit(Sender: TObject);
      Procedure dblcdCCChange(Sender: TObject);
      Procedure Z2bbtnAceptarClick(Sender: TObject);
      Procedure dblcdCCExit(Sender: TObject);
      Procedure dblcdClieExit(Sender: TObject);
      Procedure dblcdTDOCExit(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure dblcTDAExit(Sender: TObject);
      Procedure dblcTransacExit(Sender: TObject);
      Procedure dblcLOCOriExit(Sender: TObject);
      Procedure dblcTALMOriExit(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure dbcldArtiExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcLOCEnter(Sender: TObject);
      Procedure dblcTALMEnter(Sender: TObject);
      Procedure dblcTransacEnter(Sender: TObject);
      Procedure dblcTInvEnter(Sender: TObject);
      Procedure dblcTInvExit(Sender: TObject);
      Procedure dblcTINOriExit(Sender: TObject);
      Procedure dblcTINOriEnter(Sender: TObject);
      Procedure dblcTALMOriEnter(Sender: TObject);
      Procedure Z2bbtnPrintClick(Sender: TObject);
      Procedure pprNisSalPreviewFormCreate(Sender: TObject);
      Procedure dbdtpFNSExit(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure dbgDReqsCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure dbeNumNISAKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnSalirTranfClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure bbntnCancelLoteClick(Sender: TObject);
      Procedure bbtnLoteClick(Sender: TObject);
      Procedure Z2bbtnTransEquiClick(Sender: TObject);
      Procedure dbcldArtiDestinoExit(Sender: TObject);
      Procedure dbeCantGDestExit(Sender: TObject);
      Procedure bbtnKDXSerieClick(Sender: TObject);
      Procedure bbtnOKKDXSerieClick(Sender: TObject);
      Procedure dbgGridSerieFieldChanged(Sender: TObject; Field: TField);
      Procedure bbtnCancelKDXSerieClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblcdNroLoteExit(Sender: TObject);
//      Procedure Z2bbtnCeroClick(Sender: TObject);
      Procedure dblcdNDocEnter(Sender: TObject);
      Procedure dblcdNDocExit(Sender: TObject);
   Private
  { Private declarations }

      IMPREPO, COSREPO, wFlagProveedor, wFlagCCosto, wTipoMov, wFlagCliente, wGenTraAlm: Boolean;
      wEsConcumo: boolean; //Flag para saber si es de consumo
      wTranfEquiv: boolean; //Flag para saber si es transferencia de Equivalentes
      bActURQ: boolean;
      wGenTraEqui: boolean; //Flag para saber si se genera transferencia de equivalentes
      xCrea: bool;
      iEstado: Integer;
      vvalida: bool; {false = dentro del rango; true = fuera del rango }
      wCuenta, wTricvtas, wTritdodes, wtritrdes: String;
      xYear, xMess, xDia: Word;
      xMoneda: String;
      cError: Boolean;
      Procedure AsigDat;
      Procedure dcTDA;
      Procedure OnOffDetalle(Value: Boolean);
      Procedure OnOffCabecera(Value: Boolean);
      Procedure btnDetalle;
      Function EHandlerError(Ex: Exception): Boolean;
      Procedure Init(Sender: TObject);
      Procedure GeneraIngresoTransf();
      Procedure ActivaBotones(pnl: TPanel; xFlag: Boolean);
      Procedure ValidaFecha;
      Procedure ValidaFechaEnAlmacenDestino;
      Procedure NuevaFechaEnAlmacenDestino;
      Procedure NuevaFecha;
      Procedure ConfiguraNota(Sender: TObject);
      Procedure GeneraIngresoTransfEqui();
      Procedure ActualizaLog332NSSIt;
      Procedure ActualizaACF201;
      Procedure VerificaNumeroSerie;
      Function VerificaNumerodeSerie: boolean;
      Procedure InsertaDetalle(nItem: Integer);
//      Procedure CalculaStock;
//      Procedure InsDataFil;
      Procedure CargaDataSource;
      Procedure ELiminarNS;
   Public
  { Public declarations }
      xCCosto: Integer; // Para ver si Activa los Botones Cuando se Entra por CCosto
      wOperacion, wRegraNro: String; //'ADD' or 'MOD'
      xProv: String;
      Procedure Edita;
      Procedure Adiciona;
      Function Verif_Saldos: Boolean;

   End;

Var
   FRegNtaSAL: TFRegNtaSAL;
   xNSalElim: String;
   SQLFiltro: String;
   sOK, xAcep: Integer;
   sTDA: String;
   xxCantAnt: double; // Cantidad Anterior

Implementation

Uses ALMDM1, oaIN3000, ALM7A0;

{$R *.DFM}

Procedure TFRegNtaSAL.Z2bbtnOKClick(Sender: TObject);
Var
   sSQL, xSQL: String;
   sNUM, sCIA, sALM, sTIN, sTDA, sLOC, sTIP: String;
   D, M, Y: Word;
   vMes: String;
Begin
   xAcep := 0;
   vMes := '';
   DecodeDate(dbdtpFNS.DateTime, Y, M, D);
   sSQL := 'TRIID=''' + dblcTransac.Text + '''' + ' AND TRISGT=''S''';
   If Length(Trim(dblcTInv.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Almacén no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dblcTALM.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Almacén no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dblcTDA.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Tipo de Documento no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dblcTransac.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Transacción no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dbdtpFNS.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Fecha de Nota de Salida no puede estar en Blanco  ');
      exit
   End;
   If Trim(DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRICC', sSQL, 'TRICC')) = 'S' Then
   Begin
      If Length(Trim(dblcdCC.Text)) = 0 Then
      Begin
         ErrorMsg(Caption, ' El campo Centro de Costo no puede estar en Blanco  ');
         exit;
      End;
   End;

   If wGenTraAlm Then
   Begin
      If Length(Trim(dblcLOCOri.Text)) = 0 Then
      Begin
         ErrorMsg(Caption, ' El Campo Localidad Destino no puede estar en Blanco  ');
         exit
      End;

      If Length(Trim(dblcTINOri.Text)) = 0 Then
      Begin
         ErrorMsg(Caption, ' El Campo Tipo de inventario Destino no puede estar en Blanco  ');
         exit
      End;

      If Length(Trim(dblcTALMOri.Text)) = 0 Then
      Begin
         ErrorMsg(Caption, ' El Campo Almacén Destino no puede estar en Blanco  ');
         exit
      End;
   End;

   If Length(Trim(dblcdTDOC.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Documento de Referencia no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dbeNDoc.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Nº de Documento no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dbdtpFDoc.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El campo Fecha de Documento no puede estar en Blanco  ');
      exit
   End;

   vValida := False;
   If (wOperacion = 'ADD') Or (wOperacion = 'MOD') Then
   Begin
      ValidaFecha;
      If vValida = True Then
      Begin
         ErrorMsg(Caption, ' No puede Continuar Registrando este Documento con esta fecha de Documento  ');
         Exit;
      End;
   End;

   DMALM.DCOM1.AppServer.IniciaTransaccion;
   If vValida = False Then
   Begin
      sCIA := dblcCIA.Text;
      sLOC := dblcLOC.Text;
      sTIN := dblcTInv.Text;
      sALM := dblcTALM.Text;
      sTDA := dblcTDA.Text;
      sNUM := '';
      sTIP := 'SALIDA';
      If (wOperacion = 'ADD') Then
      Begin
        //Inicio HPC_201504_ALM
        //  Se cambia la llave de numeración a CIA+ALMACEN+TIPO+Nro.Nota
        //sNUM := DMALM.StrZero(DMALM.MaxNIS(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoSal);
         sNUM := DMALM.StrZero(DMALM.MaxNIS(sCIA, sALM), wAnchoSal);
        //Fin HPC_201504_ALM
         DMALM.cdsNIS.Edit;
         DMALM.cdsNIS.FieldByName('NISAID').AsString := sNUM;
         dbeNumNISA.Text := sNUM;
      End;

      If DMALM.cdsNIS.State In [dsInsert, dsEdit] Then
         Screen.Cursor := crHourGlass;
      AsigDat; // asignar los datos predeterminados de la Cabecera

      If wEsConcumo And wFlagCCosto Then
      Begin
         xSQL := 'Select * '
            + '     from LOG331 '
            + '    where CIAID =''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''''
            + '      and LOCID =''' + DMALM.cdsNIS.FieldByName('LOCID').AsString + ''''
            + '      and TINID =''' + DMALM.cdsNIS.FieldByName('TINID').AsString + ''''
            + '      and ALMID =''' + DMALM.cdsNIS.FieldByName('ALMID').AsString + ''''
            + '      and TDAID =''' + DMALM.cdsNIS.FieldByName('TDAID').AsString + ''''
            + '      and NISAID=''' + DMALM.cdsNIS.FieldByName('NISAID').AsString + ''' '
            + '    order by URQID';
         DMALM.cdsOCNIA.IndexFieldNames := '';
         DMALM.cdsOCNIA.Filter := '';
         DMALM.cdsOCNIA.Filtered := FALSE;
         DMALM.cdsOCNIA.Close;
         DMALM.cdsOCNIA.DataRequest(xSQL);
         DMALM.cdsOCNIA.Open;

         DMALM.cdsOCNIA.IndexFieldNames := 'CIAID;LOCID;TINID;ALMID;TDAID;NISAID;URQID';
      End;

      sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
      sLOC := DMALM.cdsNIS.FieldByName('LOCID').AsString;
      sTIN := DMALM.cdsNIS.FieldByName('TINID').AsString;
      sALM := DMALM.cdsNIS.FieldByName('ALMID').AsString;
      sTDA := DMALM.cdsNIS.FieldByName('TDAID').AsString;
      sNUM := DMALM.cdsNIS.FieldByName('NISAID').AsString;
      sTIP := 'SALIDA';

      If (wOperacion = 'ADD') And (wRegraNro = '1ADD') Then
      Begin
      // Inicio HPC_201504_ALM
         //  Se cambia la llave de numeración a CIA+ALMACEN+TIPO+Nro.Nota
         //  If (DMALM.IsExistNISA(sCIA, sALM, sLOC, sTDA, sNUM, sTIP, sTIN)) Then
         If (DMALM.IsExistNISA(sCIA, sALM, sTIP, sNUM, )) Then
      // Final HPC_201504_ALM
         Begin
            ErrorMsg('Error', 'Ya Existe una Nota de Salida ' + #13 +
               'con el mismo Número ... ' + sNUM);
         // Inicio HPC_201504_ALM
            //  Se cambia la llave de numeración a CIA+ALMACEN+TIPO+Nro.Nota
            // sNUM := DMALM.StrZero(DMALM.MaxNIS(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoSal);
            sNUM := DMALM.StrZero(DMALM.MaxNIS(sCIA, sALM), wAnchoSal);
         // Fin HPC_201504_ALM
            If (DMALM.cdsNIS.State <> dsEdit) And (DMALM.cdsNIS.State <> dsInsert) Then
               DMALM.cdsNIS.Edit;
            DMALM.cdsNIS.FieldByName('NISAID').AsString := sNUM;
         End;
         Try
            xSQL := ' Insert into LOG314( CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, CCOSID, TRIID, '
               + '                        NISAFREG,NISSIT,DOCID,NISANDOC,NISAFDOC,NISASOLIC,NISASERIE,NISANOMM,NISAOBS,NISAUSER,NISAHREG, '
               + '                        NISAANO, NISAMES, NISADIA, NISATRIM, NISASEM, NISAANOMES, NISASS, NISAAATRI, NISAAASEM, NISAAASS, '
               + '                        ALMORIID,TINORIID,LOCORIID,PROV,NISATCAMB ) '
               + '    Values( ' + quotedstr(DMALM.cdsNIS.fieldbyname('CIAID').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('LOCID').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('TINID').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('ALMID').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('TDAID').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISAID').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISATIP').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('CCOSID').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('TRIID').AsString) + ', '
               + quotedstr(datetostr(DMALM.cdsNIS.fieldbyname('NISAFREG').AsDateTime)) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISSIT').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('DOCID').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISANDOC').AsString) + ', '
               + quotedstr(datetostr(DMALM.cdsNIS.fieldbyname('NISAFDOC').AsDateTime)) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISASOLIC').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISASERIE').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISANOMM').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISAOBS').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISAUSER').AsString) + ', '
               + '                sysdate, '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISAANO').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISAMES').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISADIA').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISATRIM').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISASEM').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISAANOMES').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISASS').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISAAATRI').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISAAASEM').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISAAASS').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('ALMORIID').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('TINORIID').AsString) + ', '
               + quotedstr(DMALM.cdsNIS.fieldbyname('LOCORIID').AsString) + ', '
               + quotedstr(dblcdProv.Text) + ','
               + quotedstr(DMALM.cdsNIS.fieldbyname('NISATCAMB').AsString)
               + '           ) ';
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al añadir datos en la nueva Cabecera de la Nota de Salida');
            DMALM.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            exit;
         End;
      End;

      Screen.Cursor := crDefault;
      If wOperacion = 'ADD' Then
      Begin
         xNSalElim := DMALM.cdsNIS.FieldByName('NISAID').AsString; // Si graba podre borrar
      End;
      Screen.Cursor := crHourGlass;
      wRegraNro := '1MOD';
      DMALM.cdsNIS.Edit;

      OnOffCabecera(False); //Desactivar el panel de Cabecera
      OnOffDetalle(True); //Activar el panel de detalle
      pnlDetalleG.SetFocus;
      Z2bbtnCanc2.Enabled := True;
      Z2bbtnRegresa.Enabled := true;
      If Z2bbtnNuevo.Visible Then
         Z2bbtnCanc2.Enabled := False
      Else
         Z2bbtnCanc2.Enabled := True;
      Z2bbtnGraba.Enabled := true;
      Z2bbtnAceptar.Enabled := false;
      Z2bbtnNuevo.Enabled := false;
      Z2bbtnTransEqui.Visible := wTranfEquiv;
      Z2bbtnTransEqui.Enabled := wTranfEquiv;

      xSQL := 'Select * FROM LOG315 '
         + '    where CIAID =''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' '
         + '      and LOCID =''' + DMALM.cdsNIS.FieldByName('LOCID').AsString + ''' '
         + '      and TINID =''' + DMALM.cdsNIS.FieldByName('TINID').AsString + ''' '
         + '      and ALMID =''' + DMALM.cdsNIS.FieldByName('ALMID').AsString + ''' '
         + '      and TDAID =''' + DMALM.cdsNIS.FieldByName('TDAID').AsString + ''' '
         + '      and NISAID=''' + DMALM.cdsNIS.FieldByName('NISAID').AsString + ''' '
         + '      and NISATIP=''SALIDA'' '
         + '    order by KDXID';
      DMALM.FiltraCDS(DMALM.cdsKDXNSal, xSQL);

      If (cError) And (DMALM.cdsKDXNSal.RecordCount <= 0) Then
      Begin
         xSQL := 'Select CIAID, LOCID, TINID, ALMID, '
            + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString) + ' NISAID, '
            + quotedstr(DMALM.cdsNIS.FieldByName('TDAID').AsString) + ' TDAID, '
            + '          KDXID, ARTID, ''SALIDA'' NISATIP, ''PENDIENTE'' SITUACION, ''INICIAL'' '
            + '          NISSIT, ARTPCG, TCAMB, ARTPVG, KDXCNTG, KDXCNTG, ARTCONT, UNMIDG, '
            + '          UNMIDU, GRARID, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA, ARTACTIVO, '
            + '          CUENTAID, ARTDES, TMONID, ARTTOTALG, ARTTOTAL '
            + '     from LOG315 '
            + '    where CIAID  =''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' '
            + '      and LOCID  =''' + DMALM.cdsNIS.FieldByName('LOCID').AsString + ''' '
            + '      and TINID  =''' + DMALM.cdsNIS.FieldByName('TINID').AsString + ''' '
            + '      and ALMID  =''' + DMALM.cdsNIS.FieldByName('ALMID').AsString + ''' '
            + '      and NISATIP=''INGRESO'' '
            + '      and NISAID=''' + DMALM.cdsNIS.FieldByName('NISANDOC').AsString + ''' '
            + '    order by KDXID';
         DMALM.cdsQry.Close;
         DMALM.cdsQry.DataRequest(xSQL);
         DMALM.cdsQry.Open;

         DMALM.cdsQry.First;
         While Not DMALM.cdsQry.Eof Do
         Begin
            DMALM.cdsKDXNSal.Insert;
            DMALM.cdsKDXNSal.FieldByName('CIAID').AsString := DMALM.cdsQry.FieldByName('CIAID').AsString;
            DMALM.cdsKDXNSal.FieldByName('LOCID').AsString := DMALM.cdsQry.FieldByName('LOCID').AsString;
            DMALM.cdsKDXNSal.FieldByName('TINID').AsString := DMALM.cdsQry.FieldByName('TINID').AsString;
            DMALM.cdsKDXNSal.FieldByName('ALMID').AsString := DMALM.cdsQry.FieldByName('ALMID').AsString;
            DMALM.cdsKDXNSal.FieldByName('NISAID').AsString := DMALM.cdsQry.FieldByName('NISAID').AsString;
            DMALM.cdsKDXNSal.FieldByName('TDAID').AsString := DMALM.cdsQry.FieldByName('TDAID').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXID').AsString := DMALM.cdsQry.FieldByName('KDXID').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTID').AsString := DMALM.cdsQry.FieldByName('ARTID').AsString;
            DMALM.cdsKDXNSal.FieldByName('NISATIP').AsString := DMALM.cdsQry.FieldByName('NISATIP').AsString;
            DMALM.cdsKDXNSal.FieldByName('SITUACION').AsString := DMALM.cdsQry.FieldByName('SITUACION').AsString;
            DMALM.cdsKDXNSal.FieldByName('NISSIT').AsString := DMALM.cdsQry.FieldByName('NISSIT').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTPCG').AsString := DMALM.cdsQry.FieldByName('ARTPCG').AsString;
            DMALM.cdsKDXNSal.FieldByName('COSREPO').AsString := DMALM.cdsQry.FieldByName('ARTPCG').AsString;
            DMALM.cdsKDXNSal.FieldByName('TCAMB').AsString := DMALM.cdsQry.FieldByName('TCAMB').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTPVG').AsString := DMALM.cdsQry.FieldByName('ARTPVG').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXCNTG').AsString := DMALM.cdsQry.FieldByName('KDXCNTG').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXPEDIDOG').AsString := DMALM.cdsQry.FieldByName('KDXCNTG').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTCONT').AsString := DMALM.cdsQry.FieldByName('ARTCONT').AsString;
            DMALM.cdsKDXNSal.FieldByName('UNMIDG').AsString := DMALM.cdsQry.FieldByName('UNMIDG').AsString;
            DMALM.cdsKDXNSal.FieldByName('UNMIDU').AsString := DMALM.cdsQry.FieldByName('UNMIDU').AsString;
            DMALM.cdsKDXNSal.FieldByName('GRARID').AsString := DMALM.cdsQry.FieldByName('GRARID').AsString;
            DMALM.cdsKDXNSal.FieldByName('FABID').AsString := DMALM.cdsQry.FieldByName('FABID').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTSPRO').AsString := DMALM.cdsQry.FieldByName('ARTSPRO').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTSCA').AsString := DMALM.cdsQry.FieldByName('ARTSCA').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTPARA').AsString := DMALM.cdsQry.FieldByName('ARTPARA').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTSNA').AsString := DMALM.cdsQry.FieldByName('ARTSNA').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTACTIVO').AsString := DMALM.cdsQry.FieldByName('ARTACTIVO').AsString;
            DMALM.cdsKDXNSal.FieldByName('CUENTAID').AsString := DMALM.cdsQry.FieldByName('CUENTAID').AsString;
            DMALM.cdsKDXNSal.FieldByName('NISAFREG').AsString := DMALM.cdsNIS.FieldByName('NISAFREG').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXUSER').AsString := DMALM.wUsuario;
            DMALM.cdsKDXNSal.FieldByName('KDXFREG').AsString := DMALM.cdsNIS.FieldByName('NISAFREG').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXHREG').AsDateTime := Date + Time;
            DMALM.cdsKDXNSal.FieldByName('KDXANO').AsString := DMALM.cdsNIS.FieldByName('NISAANO').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXMM').AsString := DMALM.cdsNIS.FieldByName('NISAMES').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXDD').AsString := DMALM.cdsNIS.FieldByName('NISADIA').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXSEM').AsString := DMALM.cdsNIS.FieldByName('NISASEM').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXSS').AsString := DMALM.cdsNIS.FieldByName('NISASS').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXANOMM').AsString := DMALM.cdsNIS.FieldByName('NISAANOMES').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXAATRI').AsString := DMALM.cdsNIS.FieldByName('NISAAATRI').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXAASEM').AsString := DMALM.cdsNIS.FieldByName('NISAAASEM').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXAASS').AsString := DMALM.cdsNIS.FieldByName('NISAAASS').AsString;
            DMALM.cdsKDXNSal.FieldByName('KDXTRI').AsString := DMALM.cdsNIS.FieldbyName('NISATRIM').AsString;
            DMALM.cdsKDXNSal.FieldByName('TRIID').AsString := DMALM.cdsNIS.FieldByName('TRIID').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTDES').AsString := DMALM.cdsQry.FieldByName('ARTDES').AsString;
            DMALM.cdsKDXNSal.FieldByName('TMONID').AsString := DMALM.cdsQry.FieldByName('TMONID').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTTOTALG').AsString := DMALM.cdsQry.FieldByName('ARTTOTALG').AsString;
            DMALM.cdsKDXNSal.FieldByName('ARTTOTAL').AsString := DMALM.cdsQry.FieldByName('ARTTOTAL').AsString;
            DMALM.cdsKDXNSal.Post;
            DMALM.cdsQry.Next;
         End;
      End;

      xSQL := 'Select * '
         + '     from LOG315 '
         + '    where CIAID =''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' '
         + '      and LOCID =''' + DMALM.cdsNIS.FieldByName('LOCORIID').AsString + ''' '
         + '      and TINID =''' + DMALM.cdsNIS.FieldByName('TINORIID').AsString + ''' '
         + '      and ALMID =''' + DMALM.cdsNIS.FieldByName('ALMORIID').AsString + ''' '
         + '      and TDAID =''' + DMALM.cdsNIS.FieldByName('TDAID').AsString + ''' '
         + '      and NISAID=''' + DMALM.cdsNIS.FieldByName('NISAID').AsString + ''' '
         + '      and NISATIP=''SALIDA'' '
         + '    order by KDXID';
      DMALM.cdsMovFac.Close;
      DMALM.cdsMovFac.DataRequest(xSQL);
      DMALM.cdsMovFac.Open;

      dbcldArti.Selected.clear;
      dbcldArti.Selected.Add('ARTID'#9'10'#9'Artículo');
      dbcldArti.Selected.Add('ARTDES'#9'50'#9'Descripción');
      dbcldArti.Selected.Add('UNMIDG'#9'6'#9'Unidad~Medida');
      dbcldArti.Selected.Add('STKSACTG'#9'10'#9'Stock~Act. Gnrl');


   if length(IntToStr(M))< 2 then
      vMes := '0'+ IntToStr(M)
   else
      vMes := IntToStr(M);

//      sSQL := 'Select B.ARTID, B.ARTDES, B.UNMIDG, A.STKSACTG '
//         + '     from LOG316 A, TGE205 B '
      sSQL := 'Select B.ARTID, B.ARTDES, B.UNMIDG, A.STKFIN '
         + '     from LOG319 A, TGE205 B '
         + '    where (A.CIAID = B.CIAID '
         + '      and A.TINID = B.TINID '
         + '      and A.ARTID = B.ARTID) '
         + '      and NVL(B.ARTEST,''A'')=''H'' '
         + '      and (A.CIAID= ''' + dblcCIA.Text + ''' '
//         + '      and A.LOCID= ''' + dblcLOC.Text + ''' '
         + '      and A.TINID= ''' + dblcTInv.Text + ''' '
         + '      and A.ALMID= ''' + dblcTALM.Text + ''' '
//         + '      and A.STKANO=''' + InttoStr(Y) + '''' + ') '
         + '      and A.LOGANOMM=''' + InttoStr(Y) + vMes + '''' + ') '
// Inicio HPC_201504_ALM
//   Se condiciona para que no se consideren salidas de Artículos que son ACTIVOS FIJOS
      + '      and B.ARTACTIVO <> ''ACTIVO'' '
// Fin HPC_201504_ALM
//      + '      and ( (nvl(STKSACTG,0) - nvl(STKRACTG,0)) > 0 or '
//         + '            (nvl(STKSACTU,0) - nvl(STKRACTU,0)) > 0 ) ';
      + '      and  nvl(A.STKFIN,0)  > 0 ';

      DMALM.cdsSalAlm.Close;
      DMALM.cdsSalAlm.DataRequest(sSQL);
      DMALM.cdsSalAlm.Open;

      Screen.Cursor := crDefault;

      If (cError) Then
         dblcdNDoc.Enabled := False
      Else
      Begin
//         If wOperacion = 'ADD' Then
         Z2dbgDReqsIButtonClick(sender);
      End;
      wOperacion := 'MOD';
   End;

   Screen.Cursor := crDefault;
   DMALM.DCOM1.AppServer.GrabaTransaccion;
End;

Procedure TFRegNtaSAL.Z2bbtnBorrarClick(Sender: TObject);
Begin
   Exit;
   If DMALM.cdsNIS.State In [dsInsert, dsEdit] Then
   Begin
      Z2bbtnOK.Enabled := False;
      DMALM.cdsNIS.Cancel;
      OnOffCabecera(False); //Desactivar el panel de Cabecera
      Init(Nil);
   End;
End;

Procedure TFRegNtaSAL.AsigDat;
Var
   sSQL, sFecha: String;
   D, M, Y: Word;
Begin
   DecodeDate(dbdtpFNS.DateTime, Y, M, D);
   If wOperacion = 'ADD' Then
   Begin
      DMALM.cdsNIS.FieldbyName('NISATIP').AsString := 'SALIDA';
      DMALM.cdsNIS.FieldbyName('NISSIT').AsString := 'INICIAL';
      DMALM.cdsNIS.FieldbyName('NISAUSER').AsString := DMALM.wUsuario;

      sFecha := FormatDateTime(DMALM.wFormatFecha, dbdtpFNS.DateTime);
      sSQL := 'Select * from TGE114 where FECHA=' + quotedstr(sFecha);
      DMALM.FiltraCDS(DMALM.cdsPeriodo, sSQL);

      DMALM.cdsNIS.FieldbyName('NISAANO').AsString := IntToStr(Y);
      DMALM.cdsNIS.FieldbyName('NISAMES').AsString := DMALM.strzero(IntToStr(M), 2);
      DMALM.cdsNIS.FieldbyName('NISADIA').AsString := DMALM.strzero(IntToStr(D), 2);
      DMALM.cdsNIS.FieldbyName('NISAANOMES').AsString := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);
      DMALM.cdsNIS.FieldbyName('NISATRIM').AsString := DMALM.cdsPeriodo.fieldbyName('FECTRIM').asString;
      DMALM.cdsNIS.FieldbyName('NISASEM').AsString := DMALM.cdsPeriodo.fieldbyName('FECSEM').asString;
      DMALM.cdsNIS.FieldbyName('NISASS').AsString := DMALM.cdsPeriodo.fieldbyName('FECSS').asString;
      DMALM.cdsNIS.FieldbyName('NISAAATRI').AsString := DMALM.cdsPeriodo.fieldbyName('FECAATRI').asString;
      DMALM.cdsNIS.FieldbyName('NISAAASEM').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASEM').asString;
      DMALM.cdsNIS.FieldbyName('NISAAASS').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASS').asString;
      DMALM.cdsNIS.FieldbyName('NISANOMM').AsString := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);
   End;

   If length(trim(DMALM.cdsNIS.FieldbyName('NISAOBS').AsString)) = 0 Then
      DMALM.cdsNIS.FieldbyName('NISAOBS').AsString := '.';

   DMALM.cdsNIS.FieldbyName('NISAHREG').AsDateTime := Date + Time;
End;

Procedure TFRegNtaSAL.FormCreate(Sender: TObject);
Begin
   CargaDataSource;
   dbcldArti.OnNotInList := dblcNotInList;
   dblcdCC.OnNotInList := dblcNotInList;
   dblcdTDOC.OnNotInList := dblcNotInList;
   dblcdProv.OnNotInList := dblcNotInList;
   pnlDetalleA.Left := 46;
   pnlDetalleA.Top := 293;

// Compañía
   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');
   dblcCIA.LookupTable := DMALM.cdsCIA;
   dblcCIA.LookupField := 'CIAID';
// Centros de Costo
   DMALM.FiltraCDS(DMALM.cdsCCost, 'SELECT * FROM TGE203 WHERE CCOSACT<>''N'' ORDER BY CCOSID');
End;

Procedure TFRegNtaSAL.Z2bbtnRegresaClick(Sender: TObject);
Begin
   If DMALM.cdsNIS.FieldByName('NISSIT').AsString = 'ACEPTADO' Then
   Begin
      Information(Caption, 'La Nota de Salida ya a sido Aceptada');
      Exit;
   End;

   dblcCIA.Enabled := False;
   dblcLOC.Enabled := False;
   dblcTInv.Enabled := False;
   dblcTALM.Enabled := False;
   dblcTDA.Enabled := False;
   dbeNumNISA.Enabled := False;
   dbdtpFNS.Enabled := False;

   If DMALM.cdsKDXNSal.RecordCount > 0 Then
      dblcTransac.Enabled := False
   Else
      dblcTransac.Enabled := True;
   DMALM.cdsNIS.Edit;
   OnOffCabecera(True);
   OnOffDetalle(False);
   ActivaBotones(pnlDetalleG, False);
End;

Procedure TFRegNtaSAL.Z2bbtnGrabaClick(Sender: TObject);
Var
   sSQL, sCIA, sALM, sLOC, sTIN: String;
   sConta: Integer;
   fTCambio: double;
Begin
   Screen.Cursor := crHourGlass;
   sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   sALM := DMALM.cdsNIS.FieldByName('ALMID').AsString;
   sLOC := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIS.FieldByName('TINID').AsString;

   If DMALM.cdsNIS.FieldByname('NISATCAMB').AsFloat <= 0 Then
   Begin
      sSQL := 'TMONID=' + '''' + DMALM.wTMonExt + ''''
         + ' AND FECHA = ' + DMALM.wRepFuncDate + '''' + FormatDateTime(DMALM.wFormatFecha, DMALM.cdsNIS.fieldbyname('NISAFREG').AsDatetime) + '''' + ')';
      If length(DMALM.DisplayDescrip('dspUltTGE', 'TGE107', '*', sSQL, 'TMONID')) > 0 Then
         fTCambio := DMALM.cdsQry.fieldbyname('TCAM' + DMALM.wTipoCambioUsar).AsFloat
      Else
      Begin
         Screen.Cursor := crDefault;
         information(Caption, 'No Existe Tipo de Cambio para el Dia');
         Exit;
      End;
   End
   Else
      fTCambio := DMALM.cdsNIS.FieldByname('NISATCAMB').AsFloat;

// Actualiza las tablas log314, log315, log318
   ErrorCount := 0;
   DMALM.DCOM1.AppServer.IniciaTransaccion;

   sConta := 0;

   DMALM.cdsKDXNSal.DisableControls;
   DMALM.cdsKDXNSal.First;
   While Not DMALM.cdsKDXNSal.Eof Do
   Begin
      If DMALM.cdsKDXNSal.FieldByName('SITUACION').AsString = 'PENDIENTE' Then
         sConta := sConta + 1;
      DMALM.cdsKDXNSal.Next;
   End;
   DMALM.cdsKDXNSal.EnableControls;

   DMALM.cdsNIS.Edit;
   If sConta > 0 Then
   Begin
      DMALM.cdsNIS.FieldByName('SITUACION').AsString := 'PENDIENTE';
      DMALM.cdsNIS.FieldbyName('SITFREG').AsDateTime := Date;
      DMALM.cdsNIS.FieldbyName('SITHREG').AsDateTime := SysUtils.Time;
   End
   Else
   Begin
      DMALM.cdsNIS.FieldByName('SITUACION').AsString := 'ATENDIDO';
      DMALM.cdsNIS.FieldbyName('SITFREG').AsDateTime := Date;
      DMALM.cdsNIS.FieldbyName('SITHREG').AsDateTime := SysUtils.Time;
   End;

   Try
      DMALM.cdsNIS.Post;
      DMALM.cdsKDXNSal.EnableControls;
      xSQL := ' Update LOG314 '
         + '       set NISATCAMB=' + floattostr(fTCambio) + ','
         + '           SITUACION=' + quotedstr(DMALM.cdsNIS.FieldByName('SITUACION').AsString) + ', '
         + '           SITFREG = trunc(sysdate), '
         + '           SITHREG = sysdate '
         + '     Where CIAID = ' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
         + '       and ALMID = ' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
         + '       and LOCID = ' + quotedstr(DMALM.cdsNIS.FieldByName('LOCID').AsString)
         + '       and TINID = ' + quotedstr(DMALM.cdsNIS.FieldByName('TINID').AsString)
         + '       and NISATIP = ' + quotedstr('SALIDA')
         + '       and NISAID = ' + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al actualizar Cabecera de Nota de Salida');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   If wTranfEquiv Then
   // No entra nunca por aquí
   Begin
      If ((DMALM.cdsMovFac.ChangeCount > 0) Or (DMALM.cdsMovfac.Modified)) Then // Kdx
      Begin
         Try
            DMALM.AplicaDatos(DMALM.cdsMovFac, 'KDX');
         Except
            ShowMessage('Error 2 al hacer AplicaDatos en  cdsMovFac');
            DMALM.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            exit;
         End;
      End;
   End;

   xSQL := 'delete from LOG315 '
      + '    Where CIAID = ' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
      + '      and ALMID = ' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
      + '      and LOCID = ' + quotedstr(DMALM.cdsNIS.FieldByName('LOCID').AsString)
      + '      and TINID = ' + quotedstr(DMALM.cdsNIS.FieldByName('TINID').AsString)
      + '      and NISATIP = ' + quotedstr(DMALM.cdsNIS.FieldByName('NISATIP').AsString)
      + '      and NISAID = ' + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   Try
      DMALM.cdsQry.Execute;
   Except
   End;

   DMALM.cdsKDXNSal.DisableControls;
   DMALM.cdsKDXNSal.First;
   While Not DMALM.cdsKDXNSal.Eof Do
   Begin
      Try
         xSQL := ' Insert into LOG315( CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, KDXID, NISSIT, '
            + '                        PROV,DOCID,TRIID,ARTID,ARTPCU,ARTPCG,ARTPVU,ARTPVG,KDXCNTG,KDXCNTU,KDXPEDIDOG,KDXPEDIDOU, '
            + '                        KDXSALDOG,KDXSALDOU,ARTCONT,UNMIDG,UNMIDU,GRARID,FABID,ARTSPRO,ARTSCA,ARTPARA,ARTSNA,ARTFUC,TMONID, '
            + '                        ARTCRGO,ARTACTIVO,CUENTAID,ODCID,CCOSID,NISASOLIC,NISAFREG,NISANDOC,NISAFDOC,KDXUSER,KDXFREG,KDXHREG,KDXANO,KDXMM, '
            + '                        KDXDD,KDXTRI,KDXSEM,KDXSS,KDXANOMM,KDXAATRI,KDXAASEM,KDXAASS,FLAGVAR,CALID,DODCID,ARTDES,KDXNREQ,FAMID,SFAMID, '
            + '                        CUENTA2ID,KDXCVTAS,ARTMORIPCG,ARTMORIPCU,TCAMB,SITUACION,NISAATERQS,FNSERIE,ACFREG,ARTTOTALG,ARTTOTALU,ARTTOTAL, '
            + '                        KDXFLAG,PROVRUC,COSREPO,CLAUXID,COSARTFAC,IMPNOTCRE) '
            + '    Values( ' + quotedstr(DMALM.cdsKDXNSal.fieldbyname('CIAID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('LOCID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('TINID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('ALMID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('TDAID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('NISAID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('NISATIP').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('NISSIT').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('PROV').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('DOCID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('TRIID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('ARTID').AsString) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('ARTPCU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('ARTPCG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('ARTPVU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('ARTPVG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('KDXCNTG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('KDXCNTU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('KDXPEDIDOG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('KDXPEDIDOU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('KDXSALDOG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('KDXSALDOU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('ARTCONT').AsFloat) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('UNMIDG').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('UNMIDU').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('GRARID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('FABID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('ARTSPRO').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('ARTSCA').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('ARTPARA').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('ARTSNA').AsString) + ', '
            + quotedstr(datetostr(DMALM.cdsKDXNSal.fieldbyname('ARTFUC').AsDateTime)) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('TMONID').AsString) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('ARTCRGO').AsFloat) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('ARTACTIVO').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('CUENTAID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('ODCID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('CCOSID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('NISASOLIC').AsString) + ', '
            + quotedstr(datetostr(DMALM.cdsKDXNSal.fieldbyname('NISAFREG').AsDateTime)) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('NISANDOC').AsString) + ', '
            + quotedstr(datetostr(DMALM.cdsKDXNSal.fieldbyname('NISAFDOC').AsDateTime)) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXUSER').AsString) + ', '
            + quotedstr(datetostr(DMALM.cdsKDXNSal.fieldbyname('KDXFREG').AsDateTime)) + ', '
            + quotedstr(datetostr(DMALM.cdsKDXNSal.fieldbyname('KDXHREG').AsDateTime)) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXANO').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXMM').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXDD').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXTRI').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXSEM').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXSS').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXANOMM').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXAATRI').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXAASEM').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXAASS').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('FLAGVAR').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('CALID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('DODCID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('ARTDES').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXNREQ').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('FAMID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('SFAMID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('CUENTA2ID').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXCVTAS').AsString) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('ARTMORIPCG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('ARTMORIPCU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('TCAMB').AsFloat) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('SITUACION').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('NISAATERQS').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('FNSERIE').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('ACFREG').AsString) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('ARTTOTALG').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('ARTTOTALU').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('ARTTOTAL').AsFloat) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('KDXFLAG').AsString) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('PROVRUC').AsString) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('COSREPO').AsFloat) + ', '
            + quotedstr(DMALM.cdsKDXNSal.fieldbyname('CLAUXID').AsString) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('COSARTFAC').AsFloat) + ', '
            + floattostr(DMALM.cdsKDXNSal.fieldbyname('IMPNOTCRE').AsFloat) + ') ';
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al Insertar Datos del detalle de la Nota de Salida');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         exit;
      End;
      DMALM.cdsKDXNSal.Next;
   End;
   DMALM.cdsKDXNSal.EnableControls;

   DMALM.DCOM1.AppServer.GrabaTransaccion;

   xNSalElim := ''; // Si graba podre borrar
      //Genera una nota de Ingreso por concepto de Transferencia

   If DMALM.wKDXSerie = 'S' Then
   Begin
      If VerificaNumerodeSerie Then
      Begin
         Screen.Cursor := crDefault;
         ShowMessage('Falta Registrar Números de Serie');
         exit;
      End;
   End;

   If DMALM.wTipoAdicion = 'xFiltro' Then
   Begin
      DMALM.ActualizaFiltro(mtx4000, DMALM.cdsNIS, DMALM.wModo);
   End;

   DMALM.wModo := 'M';
   btnDetalle;
   lblEstado.Caption := 'INICIAL';
   Z2bbtnRegresa.Enabled := true;
   Z2bbtnCanc2.Enabled := False;
   Z2bbtnGraba.Enabled := False;
   Z2bbtnAceptar.Enabled := True;
   Z2bbtnNuevo.Enabled := True;
   Screen.Cursor := crDefault;
   wOperacion := 'MOD';
End;

Procedure TFRegNtaSAL.Z2bbtnCanc2Click(Sender: TObject);
Var
   xSQL, xSQLDet: String;
Begin
   DMALM.cdsNIS.CancelUpdates;
   DMALM.cdsKDXNSal.CancelUpdates;
   If (wOperacion = 'ADD') And
      (trim(DMALM.cdsNIS.FieldByName('NISSIT').AsString) = 'INICIAL') And
      (Length(Trim(xNSalElim)) > 0) Then
   Begin
      DMALM.cdsKDXNSal.First;
      While Not DMALM.cdsKDXNSal.Eof Do
         DMALM.cdsKDXNSal.Delete;
      DMALM.cdsNIS.Delete;

      DMALM.DCOM1.AppServer.IniciaTransaccion;
   // Cabecera de la Nota de Salida
      xSQL := 'Select * from LOG314 '
         + '    where CIAID=' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
         + '      and ALMID=' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
         + '      and NISATIP=' + quotedstr(DMALM.cdsNIS.FieldByName('NISATIP').AsString)
         + '      and NISAID=' + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
      If DMALM.cdsQry.RecordCount > 0 Then
      Begin
         xSQL := 'Delete from LOG314 '
            + '    where CIAID=' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
            + '      and ALMID=' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
            + '      and NISATIP=' + quotedstr(DMALM.cdsNIS.FieldByName('NISATIP').AsString)
            + '      and NISAID=' + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera de la Nota de Ingreso');
            DMALM.DCOM1.AppServer.RetornaTransaccion;
         End;
      End;
   // Detalle de la Nota de Salida
      xSQL := 'Select * from LOG315 '
         + '    where CIAID=' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
         + '      and ALMID=' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
         + '      and NISATIP=' + quotedstr(DMALM.cdsNIS.FieldByName('NISATIP').AsString)
         + '      and NISAID=' + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
      If DMALM.cdsQry.RecordCount > 0 Then
      Begin
         xSQL := 'Delete from LOG315 '
            + '    where CIAID=' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
            + '      and ALMID=' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
            + '      and NISATIP=' + quotedstr(DMALM.cdsNIS.FieldByName('NISATIP').AsString)
            + '      and NISAID=' + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera de la Nota de Ingreso');
            DMALM.DCOM1.AppServer.RetornaTransaccion;
         End;
      End;
      DMALM.DCOM1.AppServer.GrabaTransaccion;
      ShowMessage('Nota de Salida ELIMINADA');
      wOperacion := '';
   End;
   Z2bbtnNuevoClick(Nil);
End;

Procedure TFRegNtaSAL.Z2dbgDReqsIButtonClick(Sender: TObject);
Begin
   If (cError) Then
   Begin
      ShowMessage('Nota de Salida es por Error en Ingreso, No se puede Insertar nuevos articulos');
      Exit;
   End;

   iEstado := 0;
   dbcldArti.Clear;
   dbeArti.Clear;
   dbePedidoG.text := '0';
   dbePedidoU.text := '0';
   dbeCantidadG.text := '0';
   dbeCantidadU.text := '0';
   xxCantAnt := 0;
   dbeItem.Text := DMALM.StrZero(DMALM.MaxValue('KDXID', DMALM.cdsKDXNSal), 3);
   chkBxAtendido.Checked := false;
   dblcdRequerimiento.text := '';
   dblcdRequerimiento.Visible := False;
   dbcldArti.Enabled := True;
   bbtnKDXSerie.visible := False;
   pnlDetalleA.Visible := True;
   dbcldArti.SetFocus;
   pnlDetalleA.BringToFront;
   OnOffDetalle(False); // Desactivar el panel de detalle
   btnDetalle;
End;

Procedure TFRegNtaSAL.Z2bbtnRegOkClick(Sender: TObject);
Var
   Ano, Mes, sSit, sSQL, sCIA, sART, sTIN, sALM, sNISA, sTDA, sLOC, xWhere: String;
   DFechar: TDateTime;
   bExiste: Boolean;
   D, M, Y: Word;
   PedidoG, PedidoU, CantidadG, CantidadU, Contenido: Double;
Begin
   If sOK <> 1 Then
   Begin
      ErrorMSg('Error', ' La Cantidad Atendida Esta con Errores ');
      Exit;
   End;
   sART := dbcldArti.Text;
   If sART = '' Then
   Begin
      ErrorMSg('Error', 'El Código del Artículo es Obligatorio');
      dbcldArti.SetFocus;
      Exit;
   End;
   If bbtnKDXSerie.visible Then
      VerificaNumeroSerie;

   If dbePedidoG.Text = '' Then dbePedidoG.Text := '0';
   If dbePedidoU.Text = '' Then dbePedidoU.Text := '0';
   If dbeCantidadG.Text = '' Then dbeCantidadG.Text := '0';
   If dbeCantidadU.Text = '' Then dbeCantidadU.Text := '0';

   CantidadG := StrToFloat(dbeCantidadG.Text);
   CantidadU := StrToFloat(dbeCantidadU.Text);
   PedidoG := StrToFloat(dbePedidoG.Text);
   PedidoU := StrToFloat(dbePedidoU.Text);

   sSQL := '  CIAID=''' + dblcCIA.Text + ''' '
      + ' AND TINID=''' + dblcTInv.Text + ''' '
      + ' AND ARTID=''' + sART + ''' ';
   DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTPCG,ARTID, ARTDES, FAMID, SFAMID, TINID, '
      + 'GRARID, ARTCONT, UNMIDG, UNMIDU, FABID, ARTSPRO, '
      + 'ARTSCA, ARTPARA, ARTSNA, ARTCPROU, ARTCPROG, ARTPVU, '
      + 'ARTPVG, ARTFUC, TMONID, ARTCRGO, ARTACTIVO, CUENTAID', sSQL, 'ARTID');
   Contenido := DMALM.cdsQry.FieldByName('ARTCONT').AsFloat;
   If CantidadG * Contenido + CantidadU > PedidoG * Contenido + PedidoU Then
   Begin
      ErrorMsg('Error', ' La Cantidad Atendida No Puede ser Mayor a la Pedida');
      Exit;
   End;
   If (PedidoG = 0) And (PedidoU = 0) Then
   Begin
      ErrorMsg('Error', ' La Cantidad Pedida No Puede Ser CERO ');
      Exit;
   End;
   If (CantidadG = 0) And (CantidadU = 0) Or
      (CantidadG < 0) And (CantidadU < 0) Then
   Begin
      ErrorMsg('Error', ' La Cantidad Atendida No Puede Ser CERO !!!!! ');
      Exit;
   End;
   sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIS.FieldByName('TINID').AsString;
   sALM := DMALM.cdsNIS.FieldByName('ALMID').AsString;
   DFechar := DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime;
   sNISA := DMALM.cdsNIS.FieldByName('NISAID').AsString;
   sTDA := DMALM.cdsNIS.FieldByName('TDAID').AsString;

   If iEstado = 0 Then
   Begin
      bExiste := DMALM.cdsKDXNSal.Locate('CIAID;LOCID;TINID;ALMID;TDAID;NISAID;ARTID', VarArrayOf([sCIA, sLOC, sTIN, sALM, sTDA, sNISA, sART]), [])
   End
   Else
      bExiste := False;
   If bExiste Then
   Begin
      ErrorMsg('Error', 'No Pueden Existir Artículos Duplicados ...!!!');
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   DecodeDate(DFechar, Y, M, D);
   Ano := IntToStr(Y);
   Mes := DMALM.StrZero(IntToStr(M), 2);
   If (PedidoG = CantidadG) And
      (PedidoU = CantidadU) Then
      sSit := 'ATENDIDO'
   Else
      sSit := 'PENDIENTE';

   If iEstado = 0 Then
      DMALM.cdsKDXNSal.Insert
   Else

      DMALM.cdsKDXNSal.Edit;

 {+----------------------------------------------------------------------------+
 |                     GENERANDO MOVIMIENTO DEL ARTICULO                       |
 |     1. Insertar o adicionar registros del movimiento de los artículos       |
 +----------------------------------------------------------------------------+}
   If DMALM.cdsKDXNSal.State In [dsInsert, dsEdit] Then
   Begin
      Try
         DMALM.cdsKDXNSal.FieldByName('KDXID').AsString := dbeItem.Text;
         DMALM.cdsKDXNSal.FieldByName('CIAID').AsString := sCIA;
         DMALM.cdsKDXNSal.FieldByName('LOCID').AsString := sLOC;
         DMALM.cdsKDXNSal.FieldByName('TINID').AsString := sTIN;
         DMALM.cdsKDXNSal.FieldByName('ALMID').AsString := sALM;
         DMALM.cdsKDXNSal.FieldByName('TDAID').AsString := sTDA;
         DMALM.cdsKDXNSal.FieldByName('ARTID').AsString := sART;
         DMALM.cdsKDXNSal.FieldByName('KDXFREG').AsDateTime := DFechar;
         DMALM.cdsKDXNSal.FieldByName('KDXPEDIDOG').AsString := FloatToStr(PedidoG);
         DMALM.cdsKDXNSal.FieldByName('KDXPEDIDOU').AsString := FloatToStr(PedidoU);
         DMALM.cdsKDXNSal.FieldByName('KDXCNTG').AsString := FloatToStr(CantidadG);
         DMALM.cdsKDXNSal.FieldByName('KDXCNTU').AsString := FloatToStr(CantidadU);
         DMALM.cdsKDXNSal.FieldByName('SITUACION').AsString := sSit;
         If chkBxAtendido.Checked Then
            DMALM.cdsKDXNSal.FieldByName('NISAATERQS').AsString := 'S'
         Else
            DMALM.cdsKDXNSal.FieldByName('NISAATERQS').Clear;
         DMALM.cdsKDXNSal.FieldByName('KDXSALDOG').AsString := FloatToStr(PedidoG - CantidadG);
         DMALM.cdsKDXNSal.FieldByName('KDXSALDOU').AsString := FloatToStr(PedidoU - CantidadU);
         DMALM.cdsKDXNSal.FieldByName('ARTDES').AsString := DMALM.cdsQry.FieldByName('ARTDES').AsString;
         DMALM.cdsKDXNSal.FieldByName('FAMID').AsString := DMALM.cdsQry.FieldByName('FAMID').AsString;
         DMALM.cdsKDXNSal.FieldByName('SFAMID').AsString := DMALM.cdsQry.FieldByName('SFAMID').AsString;
         DMALM.cdsKDXNSal.FieldByName('GRARID').AsString := DMALM.cdsQry.FieldByName('GRARID').AsString;
         DMALM.cdsKDXNSal.FieldByName('ARTCONT').AsString := DMALM.cdsQry.FieldByName('ARTCONT').AsString;
         DMALM.cdsKDXNSal.FieldByName('UNMIDG').AsString := DMALM.cdsQry.FieldByName('UNMIDG').AsString;
         DMALM.cdsKDXNSal.FieldByName('UNMIDU').AsString := DMALM.cdsQry.FieldByName('UNMIDU').AsString;
         DMALM.cdsKDXNSal.FieldByName('FABID').AsString := DMALM.cdsQry.FieldByName('FABID').AsString;
         DMALM.cdsKDXNSal.FieldByName('ARTSPRO').AsString := DMALM.cdsQry.FieldByName('ARTSPRO').AsString;
         DMALM.cdsKDXNSal.FieldByName('ARTSCA').AsString := DMALM.cdsQry.FieldByName('ARTSCA').AsString;
         DMALM.cdsKDXNSal.FieldByName('ARTPARA').AsString := DMALM.cdsQry.FieldByName('ARTPARA').AsString;
         DMALM.cdsKDXNSal.FieldByName('ARTSNA').AsString := DMALM.cdsQry.FieldByName('ARTSNA').AsString;
   // El costo de la salida toma el costo promedio actual Eso me sirve para el caso de transferencia y en ventascuando devuelven
   // En realidad, el costo de salida real, lo determina recien en el momento de aceptar la nota de salida
         DMALM.cdsKDXNSal.FieldByName('ARTPCU').AsString := DMALM.cdsQry.FieldByName('ARTCPROU').AsString;
         DMALM.cdsKDXNSal.FieldByName('ARTPCG').AsString := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
         DMALM.cdsKDXNSal.FieldByName('ARTMORIPCU').AsString := DMALM.cdsQry.FieldByName('ARTCPROU').AsString;
         DMALM.cdsKDXNSal.FieldByName('ARTMORIPCG').AsString := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;

         If IMPREPO Then
         Begin
            If length(dbeImpRepo.Text) = 0 Then dbeImpRepo.Text := '0';
            DMALM.cdsKDXNSal.FieldByName('COSREPO').AsString := FloatToStr(DMALM.FRound(StrToFloat(dbeImpRepo.Text), 15, 5));
         End
         Else
            DMALM.cdsKDXNSal.FieldByName('COSREPO').AsString := DMALM.cdsQry.FieldByName('ARTPCG').AsString;

         DMALM.cdsKDXNSal.FieldByName('ARTPVU').AsString := DMALM.cdsQry.FieldByName('ARTPVU').AsString;
         DMALM.cdsKDXNSal.FieldByName('ARTPVG').AsString := DMALM.cdsQry.FieldByName('ARTPVG').AsString;
         DMALM.cdsKDXNSal.FieldByName('ARTFUC').AsDateTime := DMALM.cdsQry.FieldByName('ARTFUC').AsDateTime;
         DMALM.cdsKDXNSal.FieldByName('TMONID').AsString := DMALM.wTMonLoc;
         DMALM.cdsKDXNSal.FieldByName('ARTCRGO').AsString := DMALM.cdsQry.FieldByName('ARTCRGO').AsString;
         DMALM.cdsKDXNSal.FieldByName('ARTACTIVO').AsString := DMALM.cdsQry.FieldByName('ARTACTIVO').AsString;
         DMALM.cdsKDXNSal.FieldByName('CUENTAID').AsString := DMALM.cdsQry.FieldByName('CUENTAID').AsString;
         DMALM.cdsKDXNSal.FieldByName('NISSIT').AsString := 'INICIAL';
         DMALM.cdsKDXNSal.FieldByName('ARTTOTALG').AsFloat := 0;
         DMALM.cdsKDXNSal.FieldByName('ARTTOTALU').AsFloat := 0;
         DMALM.cdsKDXNSal.FieldByName('ARTTOTAL').AsFloat := 0;
         DMALM.cdsKDXNSal.FieldByName('PROV').AsString := DMALM.cdsNIS.FieldByName('PROV').AsString;
         DMALM.cdsKDXNSal.FieldByName('DOCID').AsString := DMALM.cdsNIS.FieldByName('DOCID').AsString;
         DMALM.cdsKDXNSal.FieldByName('TRIID').AsString := DMALM.cdsNIS.FieldByName('TRIID').AsString;
         DMALM.cdsKDXNSal.FieldByName('CCOSID').AsString := DMALM.cdsNIS.FieldByName('CCOSID').AsString;
         DMALM.cdsKDXNSal.FieldByName('ODCID').AsString := DMALM.cdsNIS.FieldByName('ODCID').AsString;
         DMALM.cdsKDXNSal.FieldByName('NISAID').AsString := DMALM.cdsNIS.FieldByName('NISAID').AsString;
         DMALM.cdsKDXNSal.FieldByName('NISATIP').AsString := DMALM.cdsNIS.FieldByName('NISATIP').AsString;
         DMALM.cdsKDXNSal.FieldByName('NISASOLIC').AsString := Trim(DMALM.cdsNIS.FieldByName('NISASOLIC').AsString);
         DMALM.cdsKDXNSal.FieldByName('NISAFREG').AsDateTime := DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime;
         DMALM.cdsKDXNSal.FieldByName('NISANDOC').AsString := DMALM.cdsNIS.FieldByName('NISANDOC').AsString;
         DMALM.cdsKDXNSal.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsNIS.FieldByName('NISAFDOC').AsDateTime;
         DMALM.cdsKDXNSal.FieldbyName('KDXUSER').AsString := DMALM.wUsuario;
         DMALM.cdsKDXNSal.FieldbyName('KDXANO').AsString := DMALM.cdsNIS.FieldByName('NISAANO').AsString;
         DMALM.cdsKDXNSal.FieldbyName('KDXMM').AsString := DMALM.cdsNIS.FieldByName('NISAMES').AsString;
         DMALM.cdsKDXNSal.FieldbyName('KDXDD').AsString := DMALM.cdsNIS.FieldByName('NISADIA').AsString;
         DMALM.cdsKDXNSal.FieldbyName('KDXANOMM').AsString := DMALM.cdsNIS.FieldByName('NISAANOMES').AsString;
         DMALM.cdsKDXNSal.FieldbyName('KDXTRI').AsString := DMALM.cdsNIS.FieldByName('NISATRIM').AsString;
         DMALM.cdsKDXNSal.FieldbyName('KDXSEM').AsString := DMALM.cdsNIS.FieldByName('NISASEM').AsString;
         DMALM.cdsKDXNSal.FieldbyName('KDXSS').AsString := DMALM.cdsNIS.FieldByName('NISASS').AsString;
         DMALM.cdsKDXNSal.FieldbyName('KDXAATRI').AsString := DMALM.cdsNIS.FieldByName('NISAAATRI').AsString;
         DMALM.cdsKDXNSal.FieldbyName('KDXAASEM').AsString := DMALM.cdsNIS.FieldByName('NISAAASEM').AsString;
         DMALM.cdsKDXNSal.FieldbyName('KDXAASS').AsString := DMALM.cdsNIS.FieldByName('NISAAASS').AsString;

         DMALM.cdsKDXNSal.FieldbyName('KDXFREG').AsDateTime := Date;

         DMALM.cdsKDXNSal.FieldbyName('KDXHREG').AsDateTime := Date + SysUtils.Time;

         DMALM.cdsKDXNSal.FieldbyName('CUENTA2ID').AsString := wCUENTA;
         DMALM.cdsKDXNSal.FieldbyName('KDXCVTAS').AsString := wTRICVTAS;

         If wEsConcumo And wFlagCCosto Then
         Begin
            xWhere := ' CIAID=' + Quotedstr(dblcCIA.text) +
               ' AND LOCID=' + Quotedstr(dblcLOC.text) +
               ' AND CCOSID=' + Quotedstr(dblcdCC.text) +
               ' AND URQID=' + Quotedstr(dblcdRequerimiento.text) +
               ' AND ARTID=' + Quotedstr(dbcldArti.text);

            DMALM.cdsKDXNSal.FieldbyName('KDXNREQ').AsString := dblcdRequerimiento.text;
            DMALM.cdsKDXNSal.FieldbyName('DODCID').AsString := DMALM.DisplayDescrip('prvTGE', 'LOG307', 'DURQID', xWhere, 'DURQID');
            DMALM.cdsOCNIA.SetKey;
            DMALM.cdsOCNIA.fieldbyname('CIAID').AsString := sCIA;
            DMALM.cdsOCNIA.fieldbyname('LOCID').AsString := sLOC;
            DMALM.cdsOCNIA.fieldbyname('TINID').AsString := sTIN;
            DMALM.cdsOCNIA.fieldbyname('ALMID').AsString := sALM;
            DMALM.cdsOCNIA.fieldbyname('TDAID').AsString := sTDA;
            DMALM.cdsOCNIA.fieldbyname('NISAID').AsString := sNISA;
            DMALM.cdsOCNIA.fieldbyname('URQID').AsString := dblcdRequerimiento.text;

            If Not DMALM.cdsOCNIA.GotoKey Then
            Begin
               DMALM.cdsOCNIA.Insert;
               DMALM.cdsOCNIA.fieldbyname('CIAID').AsString := sCIA;
               DMALM.cdsOCNIA.fieldbyname('LOCID').AsString := sLOC;
               DMALM.cdsOCNIA.fieldbyname('TINID').AsString := sTIN;
               DMALM.cdsOCNIA.fieldbyname('ALMID').AsString := sALM;
               DMALM.cdsOCNIA.fieldbyname('TDAID').AsString := sTDA;
               DMALM.cdsOCNIA.fieldbyname('NISAID').AsString := sNISA;
               DMALM.cdsOCNIA.fieldbyname('URQID').AsString := dblcdRequerimiento.text;
               DMALM.cdsOCNIA.fieldbyname('CCOSID').AsString := dblcdCC.text;
               DMALM.cdsOCNIA.Post;
               sSQL := 'Select * '
                  + '     from LOG331 '
                  + '    where CIAID =''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' '
                  + '      and LOCID =''' + DMALM.cdsNIS.FieldByName('LOCID').AsString + ''' '
                  + '      and TINID =''' + DMALM.cdsNIS.FieldByName('TINID').AsString + ''' '
                  + '      and ALMID =''' + DMALM.cdsNIS.FieldByName('ALMID').AsString + ''' '
                  + '      and TDAID =''' + DMALM.cdsNIS.FieldByName('TDAID').AsString + ''' '
                  + '      and NISAID=''' + DMALM.cdsNIS.FieldByName('NISAID').AsString + ''' ';
               DMALM.cdsOCNIA.DataRequest(sSQL);
            End
            Else
            Begin
               DMALM.cdsOCNIA.Edit;
               DMALM.cdsOCNIA.fieldbyname('CIAID').AsString := sCIA;
               DMALM.cdsOCNIA.fieldbyname('LOCID').AsString := sLOC;
               DMALM.cdsOCNIA.fieldbyname('TINID').AsString := sTIN;
               DMALM.cdsOCNIA.fieldbyname('ALMID').AsString := sALM;
               DMALM.cdsOCNIA.fieldbyname('TDAID').AsString := sTDA;
               DMALM.cdsOCNIA.fieldbyname('NISAID').AsString := sNISA;
               DMALM.cdsOCNIA.fieldbyname('URQID').AsString := dblcdRequerimiento.text;
               DMALM.cdsOCNIA.fieldbyname('CCOSID').AsString := dblcdCC.text;
               DMALM.cdsOCNIA.Post;
               sSQL := 'Select * '
                  + '     from LOG331 '
                  + '    where CIAID =''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' '
                  + '      and LOCID =''' + DMALM.cdsNIS.FieldByName('LOCID').AsString + ''' '
                  + '      and TINID =''' + DMALM.cdsNIS.FieldByName('TINID').AsString + ''' '
                  + '      and ALMID =''' + DMALM.cdsNIS.FieldByName('ALMID').AsString + ''' '
                  + '      and TDAID =''' + DMALM.cdsNIS.FieldByName('TDAID').AsString + ''' '
                  + '      and NISAID=''' + DMALM.cdsNIS.FieldByName('NISAID').AsString + ''' ';
               DMALM.cdsOCNIA.DataRequest(sSQL);
            End;
         End;

         DMALM.cdsKDXNSal.Post;
         OnOffDetalle(True);
         pnlDetalleA.Visible := False;
         btnDetalle;
         If Z2bbtnNuevo.Visible Then
            Z2bbtnCanc2.Enabled := False
         Else
            Z2bbtnCanc2.Enabled := True;
         Z2bbtnGraba.Enabled := true;
         Z2bbtnAceptar.Enabled := false;
         Z2bbtnNuevo.Enabled := false;
      Except
         On E: Exception Do EHandlerError(E);
      End;
   End;

   Screen.Cursor := crDefault;
   Z2dbgDReqsIButton.Click;
End;

Procedure TFRegNtaSAL.Z2bbtnRegCancClick(Sender: TObject);
Begin
   If pnlKDXSerie.visible Then
      Raise Exception.Create('Cierre panel de N° de Serie');
   If DMALM.cdsKDXNSal.State In [dsInsert, dsEdit] Then
      DMALM.cdsKDXNSal.Cancel;
   OnOffDetalle(True); // activar detalle
   pnlDetalleA.Visible := False;
End;

Procedure TFRegNtaSAL.OnOffCabecera(Value: Boolean);
Begin
  // ....................... activar cabecera de requisición ...................
   pnlCabecera.Enabled := Value;
   Z2bbtnBorrar.Enabled := Value;
   Z2bbtnOK.Enabled := Value;
   bbtnLote.Enabled := Value;
End;

Procedure TFRegNtaSAL.OnOffDetalle(Value: Boolean);
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

   btnDetalle;
   If Z2dbgDReqsIButton.Enabled = True Then
   Begin
      Z2bbtnGraba.Enabled := Value;
   End;
End;

Procedure TFRegNtaSAL.btnDetalle;
Var
   bDummy1: Boolean;
Begin
   bDummy1 := (DMALM.cdsKDXNSal.RecordCount > 0) And
      ((DMALM.cdsNIS.ChangeCount > 0) Or
      (DMALM.cdsKDXNSal.ChangeCount > 0) Or
      (DMALM.cdsNIS.Modified) Or
      (DMALM.cdsKDXNSal.Modified));
   Z2bbtnGraba.Enabled := bDummy1;
   Z2bbtnCanc2.Enabled := bDummy1;
   Z2bbtnNuevo.Enabled := (DMALM.cdsKDXNSal.ChangeCount = 0) And (DMALM.cdsNIS.ChangeCount = 0);
End;

Procedure TFRegNtaSAL.Z2bbtnNuevoClick(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTDA, sTIN, sLOC, xSQL: String;
Begin
   ELiminarNS;

   Screen.Cursor := crHourGlass;
   DMALM.cdsNIS.Insert;
   xCrea := True;
   OnOffCabecera(True);
   OnOffDetalle(False);
   dblcCIA.Enabled := True;
   dbeNumNISA.Enabled := True;
   dblcTALM.Enabled := True;
   dblcLOC.Enabled := True;
   dblcTInv.Enabled := True;
   dblcTransac.Enabled := True;
   dblcdCC.Enabled := True;
   dblcTDA.Enabled := True;
   dbdtpFNS.Enabled := True;
   dbeCIA.Text := '';
   dbeLOC.Text := '';
   dblcTInv.Text := '';
   dbeTinv.Text := '';
   dbeALM.Text := '';
   dbeTDNISA.Text := '';
   dbeTransac.Text := '';
   dbeLOCOri.Text := '';
   dbeALMOri.Text := '';
   dbeCC.Text := '';
   dbeProv.Text := '';
   dbeDOCS.Text := '';
   dbeSerie.Text := '';
   dbeNDoc.Text := '';
   dbeSolic.Text := '';
   deObra.Text := '';
   dblcdNroLote.Text := '';
   dbePO.Text := '';
   dbeNP.Text := '';
   dbmObs.Text := '';

   xCia := DMALM.cdsNis.FieldByName('CIAID').AsString;
   xLoc := DMALM.cdsNis.FieldByName('LOCID').AsString;
   xTin := DMALM.cdsNis.FieldByName('TINID').AsString;
   xAlm := DMALM.cdsNis.FieldByName('ALMID').AsString;

   If DMALM.cdsNIS.State In [dsInsert] Then
   Begin
      DMALM.cdsNis.FieldByName('CIAID').AsString := xCia;
      DMALM.cdsNis.FieldByName('LOCID').AsString := xLoc;
      DMALM.cdsNis.FieldByName('TINID').AsString := xTin;
      DMALM.cdsNis.FieldByName('ALMID').AsString := xAlm;

      dblcCIAExit(Nil);
      dblcLOCExit(Nil);
      dblcTINvExit(Nil);
      dblcTALMExit(Nil);
      sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
      sALM := DMALM.cdsNIS.FieldByName('ALMID').AsString;
      sTDA := DMALM.cdsNIS.FieldByName('TDAID').AsString;
      sLOC := DMALM.cdsNIS.FieldByName('LOCID').AsString;
      sTIN := DMALM.cdsNIS.FieldByName('TINID').AsString;
      dblcTDAExit(Nil);
      sNUM := '';
      DMALM.cdsNIS.FieldByName('NISAID').AsString := sNUM; //marks
   End;

   xSQL := ' Select * '
      + '      from LOG315 '
      + '     where NISATIP=''NINGUNO'' ';
   DMALM.cdsKDXNSal.Close;
   DMALM.cdsKDXNSal.DataRequest(xSQL);
   DMALM.cdsKDXNSal.Open;

   xSQL := ' Select * '
      + '      from LOG315 '
      + '     where NISATIP=''NINGUNO'' ';
   DMALM.cdsMovFac.IndexFieldNames := '';
   DMALM.cdsMovFac.Filter := '';
   DMALM.cdsMovFac.Filtered := False;
   DMALM.cdsMovFac.Close;
   DMALM.cdsMovFac.DataRequest(xSQL);
   DMALM.cdsMovFac.Open;

   Init(Sender);
   btnDetalle;
   wOperacion := 'ADD';
   wRegraNro := '1ADD';
   lblEstado.Caption := 'INICIAL';
   DMALM.cdsNIS.FieldByName('NISSIT').AsString := 'INICIAL';
   DMALM.cdsNIS.FieldByName('NISATIP').AsString := 'SALIDA';
   xCrea := False;
   Screen.Cursor := crDefault;
End;

Procedure TFRegNtaSAL.dbgDReqsKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Var
   xSQL: String;
Begin
   If (Key = $4D) And (ssCtrl In Shift) Then
   Begin
      dbgDReqsDblClick(Nil);
   End;
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If (DMALM.cdsNis.FieldByName('NISSIT').AsString <> 'INICIAL') Then
      Begin
         Information(Caption, ' El Item No Puede Ser Eliminado ');
         Exit;
      End;

      If DMALM.cdsKDXNSal.RecordCount > 0 Then
      Begin
         DMALM.DCOM1.AppServer.IniciaTransaccion;
         xSQL := 'Select * '
            + '     from LOG332 '
            + '    where CIAID=' + QuotedStr(dblcCia.text)
            + '      and ARTID=' + QuotedStr(DMALM.cdsKDXNSal.FieldByName('ARTID').AsString)
            + '      and NFAC=' + QuotedStr(dbeNumNISA.text)
            + '      and TDAID2=' + QuotedStr(dblcTDA.text);
         DMALM.cdsKDXSerie.Close;
         DMALM.cdsKDXSerie.DataRequest(xSQL);
         DMALM.cdsKDXSerie.Open;
         If DMALM.cdsKDXSerie.RecordCount>0 then
         Begin
            DMALM.cdsKDXSerie.First;
            While Not DMALM.cdsKDXSerie.EOF Do
            Begin
               DMALM.cdsKDXSerie.Edit;
               DMALM.cdsKDXSerie.FieldByName('ENTREGADO').AsString := 'N';
               If Not (DMALM.cdsKDXSerie.state In [dsEdit]) Then
                  DMALM.cdsKDXSerie.Edit;
               DMALM.cdsKDXSerie.FieldByName('TDAID2').AsString := '';
               DMALM.cdsKDXSerie.FieldByName('NFAC').AsString := '';
               DMALM.cdsKDXSerie.Post;
               DMALM.cdsKDXSerie.Next;
            End;
            xSQL := 'Update LOG332 '
               + '      Set ENTREGADO=''N'', '
               + '          TDAID2 = null, '
               + '          NFAC = null '
               + '    where CIAID=' + QuotedStr(dblcCia.text)
               + '      and ARTID=' + QuotedStr(DMALM.cdsKDXNSal.FieldByName('ARTID').AsString)
               + '      and NFAC=' + QuotedStr(dbeNumNISA.text)
               + '      and TDAID2=' + QuotedStr(dblcTDA.text);
            try
               DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('Error al actualizar marcas en Archivo de Series de Artículos');
               DMALM.DCOM1.AppServer.RetornaTransaccion;
               Screen.Cursor := crDefault;
               exit;
            End;
         End;
         DMALM.cdsKDXNSal.Delete;
         {
         sSQL := 'Select * '
            + '     from LOG332 '
            + '    where CIAID=' + QuotedStr(dblcCia.text)
            + '      and ARTID=' + QuotedStr(DMALM.cdsKDXNSal.FieldByName('ARTID').AsString)
            + '      and NFAC=' + QuotedStr(dbeNumNISA.text)
            + '      and TDAID2=' + QuotedStr(dblcTDA.text);
         DMALM.cdsKDXSerie.Close;
         DMALM.cdsKDXSerie.DataRequest(sSQL);
         DMALM.cdsKDXSerie.Open;
         DMALM.cdsKDXSerie.IndexFieldNames := '';
         DMALM.cdsKDXSerie.First;
         While Not DMALM.cdsKDXSerie.EOF Do
         Begin
            DMALM.cdsKDXSerie.Edit;
            DMALM.cdsKDXSerie.FieldByName('ENTREGADO').AsString := 'N';
            If Not (DMALM.cdsKDXSerie.state In [dsEdit]) Then
               DMALM.cdsKDXSerie.Edit;
            DMALM.cdsKDXSerie.FieldByName('TDAID2').AsString := '';
            DMALM.cdsKDXSerie.FieldByName('NFAC').AsString := '';
            DMALM.cdsKDXSerie.Post;
            DMALM.cdsKDXSerie.Next;
         End;
         DMALM.cdsKDXNSal.Delete;
         sSQL := 'Select * '
            + '     from LOG332 '
            + '    where CIAID=' + QuotedStr(dblcCia.text);
         DMALM.cdsKDXSerie.DataRequest(sSQL);
         If ((DMALM.cdsKDXSerie.ChangeCount > 0) Or (DMALM.cdsKDXSerie.Modified)) Then
            DMALM.AplicaDatos(DMALM.cdsKDXSerie, 'KDXSERIE');
         }
      End
      Else
      Begin
         ErrorMsg(Caption, ' No Existen Registros a Eliminar ');
         Exit;
      End;
   End;
   btnDetalle;
//   Z2bbtnGraba.Enabled := True;
End;

Procedure TFRegNtaSAL.dbgDReqsDblClick(Sender: TObject);
Var
   sWhere, sTmp, UnmUni, UnmGnr: String;
   Uni: Boolean;
   xCont: Integer;
Begin

   If (DMALM.cdsNis.FieldByName('NISSIT').AsString = 'ACEPTADO') Or
      (DMALM.cdsNis.FieldByName('NISSIT').AsString = 'ANULADO') Then
   Begin
      ErrorMsg('Observación', ' La Nota ya ha sido Aceptado ');
      exit;
   End;

   If (cError) Then
   Begin
      ShowMessage('Nota de Salida es por Error en Ingreso, No se puede Modificar Cantidad');
      Exit;
   End;

   If DMALM.cdsKDXNSal.recordcount = 0 Then
      exit;
   OnOffDetalle(False); // Desactivar el panel de detalle
   dbeItem.Clear;
   dbcldArti.Clear;
   dbeArti.Clear;
   dbeItem.Text := DMALM.cdsKDXNSal.FieldByName('KDXID').AsString;
   dbcldArti.Text := DMALM.cdsKDXNSal.FieldByName('ARTID').AsString;
   dbeCantidadG.Text := DMALM.cdsKDXNSal.FieldByName('KDXCNTG').AsString;
   dbeCantidadU.Text := DMALM.cdsKDXNSal.FieldByName('KDXCNTU').AsString;
   dbePedidoG.Text := DMALM.cdsKDXNSal.FieldByName('KDXPEDIDOG').AsString;
   dbePedidoU.Text := DMALM.cdsKDXNSal.FieldByName('KDXPEDIDOU').AsString;
   dbeImpRepo.Text := DMALM.cdsKDXNSal.FieldByName('COSREPO').AsString;
   xCont := DMALM.cdsKDXNSal.FieldByName('ARTCONT').AsInteger;
   If wEsConcumo And wFlagCCosto Then
   Begin
      lblReqUsuario.Visible := true;
      dblcdRequerimiento.Visible := true;
      dblcdRequerimiento.Enabled := False;
      dblcdRequerimiento.Text := DMALM.cdsKDXNSal.FieldByName('KDXNREQ').AsString;
   End;

   xxCantAnt := DMALM.FRound(StrToFloat(dbeCantidadG.Text) + xCont * StrToFloat(dbeCantidadU.Text), 15, 4);

   If DMALM.cdsKDXNSal.FieldByName('NISAATERQS').AsString = 'S' Then
      chkBxAtendido.Checked := true
   Else
      chkBxAtendido.Checked := false;

   sWhere := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND TINID=' + quotedstr(dblcTInv.Text) + ' AND ARTID=' + quotedstr(dbcldArti.Text);
   DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES, ARTCONT, UNMIDG, UNMIDU', sWhere, 'ARTDES');

   dbeArti.Text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
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
   dbePedidoU.Enabled := Uni;
   dbeCantidadU.Enabled := Uni;

   pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
   dbcldArti.Enabled := False;

   pnlDetalleA.BringToFront;
   iEstado := 1;
   sOK := 1;
   bbtnKDXSerie.visible := ((DMALM.wKDXSerie = 'S') And (DMALM.DisplayDescrip('dspUltTGE', 'TGE205', 'FNSERIE', 'CIAID=' + QuotedStr(dblcCia.text) + ' AND ARTID=' + QuotedStr(dbcldArti.text), 'FNSERIE') = 'S'));

   btnDetalle;
End;

Procedure TFRegNtaSAL.dbeNumNISAExit(Sender: TObject);
Var
   iVal, iCod: Integer;
   sNUM, sCIA, sALM, sTDA, sTIN, sLOC, sTIP: String;
Begin
   If wRegraNro = '1MOD' Then
      Exit;

   Val(dbeNumNISA.Text, iVal, iCod);
   sCIA := dblcCIA.Text;
   sALM := dblcTALM.Text;
   sTDA := dblcTDA.Text;
   sLOC := dblcLOC.Text;
   sTIN := dblcTInv.Text;
   sTIP := 'SALIDA';

   sNUM := dbeNumNISA.Text;
// Inicio HPC_201504_ALM
   //  Se cambia la llave de numeración a CIA+ALMACEN+TIPO+Nro.Nota
   // If (DMALM.IsExistNISA(sCIA, sALM, sLOC, sTDA, sNUM, sTIP, sTIN)) Then
   If (DMALM.IsExistNISA(sCIA, sALM, sTIP, sNUM)) Then
   Begin
      ErrorMsg('Error', 'Ya existe una nota de salida' + #13 +
         'con el mismo número ... ' + sNUM);
      // sNUM := DMALM.StrZero(DMALM.MaxNIS(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoSal);
      sNUM := DMALM.StrZero(DMALM.MaxNIS(sCIA, sALM), wAnchoSal);
      dbeNumNISA.Text := sNUM;
   End;
// Fin HPC_201504_ALM
End;

Procedure TFRegNtaSAL.dbmObsKeyPress(Sender: TObject; Var Key: Char);
Var
   sC: String;
Begin
   sC := Key;
   sC := Uppercase(sC);
   Key := sC[1];
End;

Procedure TFRegNtaSAL.FormClose(Sender: TObject; Var Action: TCloseAction);
Var
   xSQL, xSQLDet: String;
Begin
   If pnlDetalleA.Visible Then
   Begin
      Information('Inventarios', 'Cierre el Panel de Artículos');
      Abort;
   End;

   DMALM.cdsTDOC.Filtered := False;
   DMALM.cdsTDOC.Filter := '';
   DMALM.cdsTDOC.Filtered := True;

   If (wOperacion = 'ADD') And
      (trim(DMALM.cdsNIS.FieldByName('NISSIT').AsString) = 'INICIAL') And
      (Length(Trim(xNSalElim)) > 0) Then
   Begin
      DMALM.cdsKDXNSal.First;
      While Not DMALM.cdsKDXNSal.Eof Do
         DMALM.cdsKDXNSal.Delete;
      DMALM.cdsNIS.Delete;
      DMALM.DCOM1.AppServer.IniciaTransaccion;

   // Cabecera de la Nota de Salida
      xSQL := 'Select * from LOG314 '
         + '    where CIAID=' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
         + '      and ALMID=' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
         + '      and NISATIP=' + quotedstr(DMALM.cdsNIS.FieldByName('NISATIP').AsString)
         + '      and NISAID=' + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
      If DMALM.cdsQry.RecordCount > 0 Then
      Begin
         xSQL := 'Delete from LOG314 '
            + '    where CIAID=' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
            + '      and ALMID=' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
            + '      and NISATIP=' + quotedstr(DMALM.cdsNIS.FieldByName('NISATIP').AsString)
            + '      and NISAID=' + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera de la Nota de Ingreso');
            DMALM.DCOM1.AppServer.RetornaTransaccion;
         End;
      End;
   // Detalle de la Nota de Salida
      xSQL := 'Select * from LOG315 '
         + '    where CIAID=' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
         + '      and ALMID=' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
         + '      and NISATIP=' + quotedstr(DMALM.cdsNIS.FieldByName('NISATIP').AsString)
         + '      and NISAID=' + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(xSQL);
      DMALM.cdsQry.Open;
      If DMALM.cdsQry.RecordCount > 0 Then
      Begin
         xSQL := 'Delete from LOG315 '
            + '    where CIAID=' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
            + '      and ALMID=' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
            + '      and NISATIP=' + quotedstr(DMALM.cdsNIS.FieldByName('NISATIP').AsString)
            + '      and NISAID=' + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera de la Nota de Ingreso');
            DMALM.DCOM1.AppServer.RetornaTransaccion;
         End;
      End;
      DMALM.DCOM1.AppServer.GrabaTransaccion;
      wOperacion := '';
   End;

   If (DMALM.cdsNIS.ChangeCount > 0) Or (DMALM.cdsNIS.Modified) Then
      DMALM.cdsNIS.CancelUpdates;

   btnDetalle;

   If pnlDetallea.Visible Then
      Z2bbtnRegCanc.OnClick(Nil);
   DMALM.cdsTRAN.Close;

   DMALM.cdsOCNIA.IndexFieldNames := '';
   DMALM.cdsOCNIA.Filter := '';
   DMALM.cdsOCNIA.Filtered := FALSE;
   DMALM.cdsOCNIA.Close;

   DMALM.cdsMovFac.IndexFieldNames := '';
   DMALM.cdsMovFac.Filter := '';
   DMALM.cdsMovFac.Filtered := FALSE;
   DMALM.cdsMovFac.Close;

   DMALM.cdsKDXNSal.IndexFieldNames := '';

   DMALM.cdsKDXSerie.Filter := '';
   DMALM.cdsKDXSerie.Filtered := False;
   DMALM.cdsKDXSerie.IndexFieldNames := '';
   DMALM.cdsKDXSerie.Close;

   xCrea := true;
   Action := CAFree;
End;

Function TFRegNtaSAL.EHandlerError(Ex: Exception): Boolean;
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

Procedure TFRegNtaSAL.dblcdCCExit(Sender: TObject);
Var
   xSql, xWhere: String;
Begin
   dbeCC.Text := DMALM.DisplayDescrip('prvSQL', 'TGE203', 'CCOSMOV,CCOSDES', 'CCOSID=' + quotedStr(dblcdCC.text), 'CCOSDES');
   If DMALM.cdsQry.FieldByName('CCOSMOV').AsString <> 'S' Then
   Begin
      dblcdCC.SetFocus;
      dbeCC.text := '';
        Raise Exception.Create('El centro de costo no es de movimiento');
   End;

   If (DMALM.cdsNIS.State = dsInsert) And
      (Length(Trim(dbeSolic.text)) = 0) Then
      DMALM.cdsNIS.FieldByName('NISASOLIC').AsString := Trim(dbeCC.text);

   If dblcdCC.Text = '' Then Exit;
   Exit;

End;

Procedure TFRegNtaSAL.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegNtaSAL.Init(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTDA, sLOC, sTIN: String;
Begin
   OnOffCabecera(True); //Activar la cabecera
   OnOffDetalle(False); //Desactivar el panel de detalle
   btnDetalle;

   DMALM.cdsTDOC.Filtered := False;
   DMALM.cdsTDOC.Filter := '';
   DMALM.cdsTDOC.Filter := 'REFALM=''S''';
   DMALM.cdsTDOC.Filtered := True;

   If DMALM.cdsNIS.State In [dsInsert] Then
   Begin
      sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
      sALM := DMALM.cdsNIS.FieldByName('ALMID').AsString;
      sTDA := DMALM.cdsNIS.FieldByName('TDAID').AsString;
      sLOC := DMALM.cdsNIS.FieldByName('LOCID').AsString;
      sTIN := DMALM.cdsNIS.FieldByName('TINID').AsString;
      dcTDA;

      dblcTDAExit(Nil);
      DMALM.cdsNIS.FieldByName('NISAID').AsString := sNUM;
      lblEstado.Caption := 'INICIAL';
      DMALM.cdsNIS.FieldByName('NISSIT').AsString := 'INICIAL';
   End
   Else
   Begin
      If showing Then
      Begin
         dblcTransacExit(Nil);
      End;
   End;
End;

Procedure TFRegNtaSAL.dbeCantidadGExit(Sender: TObject);
Var
   sSQL, sTIN, sCIA, sALM, sART, sLOC: String;
   Y, M, D: Word;
   fSTK, Contenido: Double;
   vMes: String;

Begin
   sOK := 0;
   vMes := '';

   If (Z2bbtnRegCanc.Focused) Or (Z2bbtnSalir.Focused) Then
      exit;

   If Length(Trim(dbeCantidadG.Text)) = 0 Then
      dbeCantidadG.Text := '0';
   If Length(Trim(dbePedidoG.Text)) = 0 Then
      dbePedidoG.Text := '0';
   If Length(Trim(dbeCantidadU.Text)) = 0 Then
      dbeCantidadU.Text := '0';
   If Length(Trim(dbePedidoU.Text)) = 0 Then
      dbePedidoU.Text := '0';

   If (strtofloat(dbeCantidadG.Text) > strtofloat(dbePedidoG.Text)) Or
      (strtofloat(dbeCantidadU.Text) > strtofloat(dbePedidoU.Text)) Then
   Begin
      ErrorMsg(Caption, 'La Cantidad Atendida no Puede ser Mayor a la Pedida');
      Exit;
   End;
   DecodeDate(DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime, Y, M, D);
   sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIS.FieldByName('TINID').AsString;
   sALM := DMALM.cdsNIS.FieldByName('ALMID').AsString;
   sART := dbcldArti.Text;

   sSQL := 'CIAID=' + quotedstr(sCIA) + ' AND TINID=' + quotedstr(sTIN) + ' AND ARTID=' + quotedstr(sART);
   DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT', sSQL, 'ARTCONT');
   Contenido := DMALM.cdsQry.FieldByName('ARTCONT').AsFloat;

{
   sSQL := 'STKANO=''' + IntToStr(Y)
      + ''' AND CIAID=''' + sCIA
      + ''' AND LOCID=''' + sLOC
      + ''' AND TINID=''' + sTIN
      + ''' AND ALMID=''' + sALM
      + ''' AND ARTID=''' + sART + '''';
}
   if length(IntToStr(M))< 2 then
      vMes := '0'+ IntToStr(M)
   else
      vMes := IntToStr(M);


   sSQL := 'LOGANOMM=''' + IntToStr(Y) + vMes
   // IntToStr(M)
      + ''' AND CIAID=''' + sCIA
      + ''' AND TINID=''' + sTIN
      + ''' AND ALMID=''' + sALM
      + ''' AND ARTID=''' + sART + '''';


 {
   DMALM.DisplayDescrip('prvTGE', 'LOG316', 'ARTID, ' + DMALM.wReplacCeros + '(STKSACTG,0) - ' + DMALM.wReplacCeros + '(STKRACTG,0) STKSACTG, '
      + DMALM.wReplacCeros + '(STKSACTU,0) - ' + DMALM.wReplacCeros + '(STKRACTU,0) STKSACTU', sSQL, 'ARTID'); // Para tomar los datos de Saldos de Articulos
}
   DMALM.DisplayDescrip('prvTGE', 'LOG319', 'ARTID, STKFIN', sSQL, 'ARTID'); // Para tomar los datos de Saldos de Articulos



   If DMALM.cdsQry.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', ' No Existe El producto para dar Salida !!!');
      Exit;
   End;
   If DMALM.cdsQry.RecordCount > 0 Then
   Begin
//    fSTK := DMALM.cdsQry.FieldByName('STKSACTG').AsFloat * Contenido + DMALM.cdsQry.FieldByName('STKSACTU').AsFloat;
      fSTK := DMALM.cdsQry.FieldByName('STKFIN').AsFloat * Contenido ;
      If fSTK <= 0 Then
      Begin
         ErrorMsg('Error', ' El Stock del Producto se Halla en CERO !!!');
         Exit;
      End;

      If DMALM.FRound((StrToFloat(dbeCantidadG.Text) * Contenido + StrToFloat(dbeCantidadU.Text)), 15, 4) > fSTK Then
      Begin
         If (Sender = dbeCantidadG) And (StrToFloat(dbeCantidadG.Text) > 0) Then
         Begin
            ErrorMsg('Error', ' La Cantidad a dar Salida excede a la cantidad en stock que es de ' + Format('%8.2f', [fSTK / Contenido]) + '  !!!');
            Exit;
         End
         Else
            If (Sender = dbeCantidadU) And (StrToFloat(dbeCantidadU.Text) > 0) Then
            Begin
               ErrorMsg('Error', ' La Cantidad a dar Salida excede a la cantidad en stock que es de  ' + FloattoStr(fSTK) + '  !!!');
               Exit;
            End;
      End;
   End;
   sOK := 1;
End;

Procedure TFRegNtaSAL.dblcdCCChange(Sender: TObject);
Begin
   dbeCC.Text := DMALM.cdsCCost.FieldByName('CIADES').AsString;
End;

Procedure TFRegNtaSAL.dcTDA;
Var
   sState: TDataSetState;
Begin
   sState := DMALM.cdsNIS.State;
   DMALM.cdsTDNISA.First;
   sTDA := trim(DMALM.cdsTDNISA.FieldByName('TDAID').AsString);
   If (sState = dsInsert) And Not (DMALM.cdsNIS.State In [dsInsert]) Then
      DMALM.cdsNIS.Insert;
   If (sState = dsEdit) And Not (DMALM.cdsNIS.State In [dsEdit]) Then
      DMALM.cdsNIS.Edit;
   dblcTDA.Enabled := True;
   If DMALM.cdsTDNISA.RecordCount > 1 Then
   Begin
      DMALM.cdsNIS.fieldbyname('TDAID').AsString := DMALM.cdsTDNISA.fieldbyname('TDAID').AsString;
      DMALM.cdsNIS.FieldByName('TDAID').AsString := sTDA;
   End;
End;

Procedure TFRegNtaSAL.Z2bbtnAceptarClick(Sender: TObject);
Var
   wPasa, xItem, sKDXArt, xSQL, Ano, Mes, sCIA, sART, sALM, sTIN, sLOC: String;
   xNumMax, xConta1: Integer;
   DFechar: TDateTime;
   Y, M, D: Word;
   Contenido: Double;
Begin
   If (DMALM.cdsNis.FieldByName('NISSIT').AsString = 'ACEPTADO') Then
   Begin
      ErrorMsg('Observación', ' La Nota ya ha sido Aceptado ');
      exit;
   End;
   If (DMALM.cdsKDXNSal.RecordCount = 0) Then
   Begin
      ErrorMsg(Caption, ' No se Puede Aceptar este Documento ');
      exit;
   End;

   If Not Verif_Saldos Then
   Begin
      ErrorMsg(Caption, 'Existe Items que no Cuentan con Saldo Disponible para Despachar');
      exit;
   End;

   If xAcep > 0 Then
   Begin
      ErrorMsg(Caption, 'Existe Items que no Cuentan con Saldo Disponible para Despachar');
      Exit;
   End;

   If Not Question(Caption, 'Este Proceso ' + #13
      + 'Acepta la Nota de Salida ' + #13 + #13 + #13 + '¿Desea Continuar?') Then
   Begin
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   wPasa := '0';
   pnlActuali.Visible := true;
   pnlActuali.Refresh;
   DFechaR := DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime;
   sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIS.FieldByName('TINID').AsString;
   sALM := DMALM.cdsNIS.FieldByName('ALMID').AsString;

   DecodeDate(DFechar, Y, M, D);
   Ano := IntToStr(Y);
   Mes := DMALM.StrZero(IntToStr(M), 2);

   ErrorCount := 0;
   DMALM.DCOM1.AppServer.IniciaTransaccion;
   Begin
      DMALM.cdsKDXNSal.DisableControls;
      DMALM.cdsKDXNSal.first;
      While Not DMALM.cdsKDXNSal.Eof Do
      Begin
         If DMALM.cdsKDXNSal.FieldByName('SITUACION').AsString <> 'DEPURADO' Then
         Begin
            sArt := DMALM.cdsKDXNSal.FieldByName('ARTID').AsString;
            xSQL := 'Select CIAID, GRARID, ARTID, ARTDES, UNMIDG, UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA, ARTACTIVO, '
               + '          ARTCONT, ARTMNTG, ARTMNTU, ARTFUPRC, ARTCNTG, ARTCNTU, TMONID, ARTCRGO, CUENTAID, FAMID, SFAMID, '
               + '          ARTCPROG, ARTCPROU, ARTPCU, ARTPCG, ARTFUMV, ARTFUC, COSTOANT '
               + '     from TGE205 '
               + '    where CIAID=' + quotedstr(sCIA) + ' AND ARTID=' + quotedstr(sART) + ' AND TINID=' + QuotedStr(sTIN);
            DMALM.cdsArtiStk.Close;
            DMALM.cdsArtiStk.DataRequest(xSQL);
            DMALM.cdsArtiStk.Open;
            If DMALM.cdsArtiStk.RecordCount = 1 Then
            Begin
               // Si es salida por error de Ingreso
               If cError Then
               Begin
                  DMALM.cdsKDXNSal.Edit;
                  DMALM.cdsKDXNSal.FieldByName('ARTPCG').AsString := floatToStr(DMALM.FRound(DMALM.cdsArtiStk.FieldByName('ARTPCG').AsFloat, 15, 5));
                  DMALM.cdsKDXNSal.Post;
               End;

               // Inicio HPC_201801_ALM
               // Cambio en pruebas por Búsqueda en Maestro de Clientes
               xSql := ' Declare VERROR VARCHAR2(1); '
                  +    ' Begin SP_ALM_ACT_STOCK_COSPRO_V2('
                  +             quotedstr(trim(dblcCIA.Text)) + ','
                  +             quotedstr(trim(dblcTALM.Text)) + ','
                  +             quotedstr(DMALM.cdsKDXNSal.FieldByname('ARTID').AsString) + ','
                  +             DMALM.cdsKDXNSal.FieldByname('ARTPCG').AsString + ','
                  +             DMALM.cdsKDXNSal.FieldByname('KDXCNTG').AsString + ','
                  +           ' trunc(to_date('+quotedstr(datetostr(DMALM.cdsKDXNSal.FieldByname('NISAFREG').AsDateTime))+')),'
                  +             quotedstr(DMALM.wUsuario) + ','
                  +             quotedstr('S') + ','
                  +             quotedstr(DMALM.cdsKDXNSal.FieldByname('TRIID').AsString) + ',VERROR);'
                  +    ' End;';
               // Fin HPC_201801_ALM
               Try
                  DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
               Except
                  ShowMessage('Error al actualizar Stock');
                  DMALM.DCOM1.AppServer.RetornaTransaccion;
                  Screen.Cursor := crDefault;
                  Exit;
               End;

               xSQL := ' Update LOG332 '
                  + '      set NSSIT=' + Quotedstr('ACEPTADO') + ','
                  + '          ESTADOID=' + Quotedstr('A')
                  + '    where CIAID=' + QuotedStr(dblcCia.text)
                  + '      and ALMID=' + QuotedStr(dblcTALM.text)
                  + '      and ARTID=' + QuotedStr(DMALM.cdsKDXNSal.FieldByname('ARTID').AsString)
                  + '      and NSTDOC=' + QuotedStr(dblcTDA.text)
                  + '      and NSNDOC=' + QuotedStr(dbeNumNISA.Text)
                  + '      and ENTREGADO=' + QuotedStr('S')
                  + '      and NISIT=' + QuotedStr('ACEPTADO')
                  + '      and NSSIT=' + QuotedStr('INICIAL');
               Try
                  DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  ShowMessage('Error al actualizar Activo Fijo');
                  DMALM.DCOM1.AppServer.RetornaTransaccion;
                  Screen.Cursor := crDefault;
                  Exit;
               End;

               xSQL := ' Select * '
                  + '      from LOG332 '
                  + '     where CIAID=' + QuotedStr(dblcCia.text)
                  + '       and ALMID=' + QuotedStr(dblcTALM.text)
                  + '       and ARTID=' + QuotedStr(DMALM.cdsKDXNSal.FieldByname('ARTID').AsString)
                  + '       and NSTDOC=' + QuotedStr(dblcTDA.text)
                  + '       and NSNDOC=' + QuotedStr(dbeNumNISA.Text)
                  + '       and ENTREGADO=' + QuotedStr('S')
                  + '       and NISIT=' + QuotedStr('ACEPTADO');
               DMALM.cdsKDXSerie.Close;
               DMALM.cdsKDXSerie.DataRequest(xSQL);
               DMALM.cdsKDXSerie.Open;

               While Not DMALM.cdsKDXSerie.eof Do
               Begin
                  Try
                     xSQL := ' Update ACF201 '
                        + '       set ACFFLAGACT=' + quotedstr('A')
                        + '     where ARTCODBAR=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('CODBAR').AsString);
                     DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
                  Except
                     ShowMessage('Error al actualizar Activo Fijo - ACF201');
                     DMALM.DCOM1.AppServer.RetornaTransaccion;
                     Screen.Cursor := crDefault;
                     Exit;
                  End;
                  DMALM.cdsKDXSerie.Next;
               End;

               SQLFiltro :=
                  '     Select * '
                  + '     from LOG314 '
                  + '    where CIAID =' + quotedstr(sCIA)
                  + '      and LOCID =' + quotedstr(sLOC)
                  + '      and TINID =' + quotedstr(sTIN)
                  + '      and ALMID =' + quotedstr(sALM)
                  + '      and NISAID =' + quotedstr(dbeNumNISA.Text)
                  + '      and NISATIP=' + quotedstr('SALIDA');
               DMALM.cdsNIS.DataRequest(SQLFiltro);

               xSQL := 'Select * '
                  + '     from LOG315 '
                  + '    where CIAID=' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
                  + '      and LOCID=' + quotedstr(DMALM.cdsNIS.FieldByName('LOCID').AsString)
                  + '      and TINID=' + quotedstr(DMALM.cdsNIS.FieldByName('TINID').AsString)
                  + '      and ALMID=' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
                  + '      and NISAID=' + quotedstr(dbeNumNISA.Text)
                  + '      and NISATIP=' + quotedstr('SALIDA');
               DMALM.cdsKDXNSal.DataRequest(xSQL);
            End
            Else
            Begin
               ErrorMsg('Error Grave', 'No se encuentra el Artículo ' + sCIA + ' - ' + sTIN + ' - ' + sArt);
               wPasa := '1';
               break;
            End;
         End; //<> DEPURADO
         DMALM.cdsKDXNSal.next;
      End; //WHILE KARDEX

      If wPasa = '1' Then exit;

// Inicio HPC_201605_ALM
// Se agregan campo usuario y fechas a Update

   // Inicio HPC_201607_ALM
   // 08/08/2016  Grabación de campo NISAFREG en ACEPTACION de acuerdo a lo indicadd en campo de Fecha de la Nota de Salida
      xSql := 'Update LOG314 '
         + '      Set NISSIT=''ACEPTADO'', '
         + '          NISAFREG='+quotedstr(datetostr(DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime))+ ','
         + '          SITFREG=trunc(sysdate), SITHREG=Sysdate, '
         + '          NISAUSER='+quotedstr(DMALM.wUsuario)
         + '    where CIAID=' + quotedstr(Trim(dblcCIA.Text))
         + '      and LOCID=' + quotedstr(Trim(dblcLOC.Text))
         + '      and TINID=' + quotedstr(Trim(dblcTINV.Text))
         + '      and ALMID=' + quotedstr(Trim(dblcTALM.Text))
         + '      and TDAID=' + quotedstr(Trim(dblcTDA.Text))
         + '      and NISAID=' + quotedstr(Trim(dbeNumNISA.Text))
         + '      and NISATIP=' + quotedstr('SALIDA');
   // Fin HPC_201607_ALM
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
      Except
         ShowMessage('Error al actualizar del Estado de la Nota de ingreso');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Exit;
      End;

   // Inicio HPC_201607_ALM
   // 08/08/2016  Grabación de campo NISAFREG en ACEPTACION de acuerdo a lo indicadd en campo de Fecha de la Nota de Salida
      xSql := 'Update LOG315 '
         + '      Set NISSIT=''ACEPTADO'', '
         + '          NISAFREG='+quotedstr(datetostr(DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime))+ ','
         + '          KDXFREG=trunc(sysdate), KDXHREG=Sysdate, KDXUSER='+quotedstr(DMALM.wUsuario)
         + '    where CIAID=' + quotedstr(Trim(dblcCIA.Text))
         + '      and LOCID=' + quotedstr(Trim(dblcLOC.Text))
         + '      and TINID=' + quotedstr(Trim(dblcTINV.Text))
         + '      and ALMID=' + quotedstr(Trim(dblcTALM.Text))
         + '      and TDAID=' + quotedstr(Trim(dblcTDA.Text))
         + '      and NISAID=' + quotedstr(Trim(dbeNumNISA.Text))
         + '      and NISATIP=' + quotedstr('SALIDA');
   // Fin HPC_201607_ALM
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
      Except
         ShowMessage('Error al actualizar del Estado de la Nota de ingreso');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Exit;
      End;
// Fin HPC_201605_ALM


      DMALM.cdsKDXNSal.EnableControls;
      ActivaBotones(pnlDetalleG, False);
      Z2bbtnNuevo.Enabled := True;
      lblEstado.Caption := 'ACEPTADO';
      pnlActuali.Visible := false;
      Screen.Cursor := crDefault;
      Z2dbgDReqsIButton.Enabled := False;
   End;

   Try
      If wGenTraAlm Then GeneraIngresoTransf();
      If wGenTraEqui Then GeneraIngresoTransfEqui();
   Except
      ShowMessage('Error al actualizar Ingresar por Transferencia');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Exit;
   End;

   DMALM.DCOM1.AppServer.GrabaTransaccion;
   ShowMessage('Se grabó con éxito');

   If DMALM.wTipoAdicion = 'xFiltro' Then
   Begin
      DMALM.ActualizaFiltro(mtx4000, DMALM.cdsNIS, DMALM.wModo);
      DMALM.wTipoAdicion := '';
   End;
End;

Procedure TFRegNtaSAL.GeneraIngresoTransf();
Var
   sCIA, sALM, sTDA, sTIN, sLOC, sNIS: String;
   sALMs, sTDAs, sLOCs, sNISs, sTINs: String;
   sSQL, sFecha, xWhere: String;
   D, M, Y: Word;
   NISAANO, NISAMES, NISADIA, NISAANOMES, NISATRIM, NISASEM, NISASS, NISAAATRI, NISAAASEM, NISAAASS, NISANOMM: String;
   i, j: integer;
Begin
   xWhere := 'CIAID=' + QuotedStr(dblcCIA.Text)
      + ' AND LOCORIID=' + QuotedStr(dblcLOC.Text)
      + ' AND TINORIID=' + QuotedStr(dblcTInv.Text)
      + ' AND ALMORIID=' + QuotedStr(dblcTALM.Text)
      + ' AND TDAORIID=' + QuotedStr(dblcTDA.Text)
      + ' AND NISAORIID=' + QuotedStr(dbeNumNISA.Text)
      + ' AND NISATIP=''INGRESO'' ';
   If Length(DMALM.DisplayDescrip('prvTGE', 'LOG314', 'NISAID', xWhere, 'NISAID')) > 0 Then
   Begin
      ErrorMsg(Caption, 'Error, Ya Existe un Transferencia con el número de esta Nota de Salida');
   End;

// la fecha debe ser la Misma que la Nota de Salida y no la fecha del Date
   DecodeDate(DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime, Y, M, D);
   sFecha := FormatDateTime(DMALM.wFormatFecha, DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime);

   sSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
   DMALM.FiltraCDS(DMALM.cdsPeriodo, sSQL);

   NISAANO := IntToStr(Y);
   NISAMES := DMALM.strzero(IntToStr(M), 2);
   NISADIA := DMALM.strzero(IntToStr(D), 2);
   NISAANOMES := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);
   NISATRIM := DMALM.cdsPeriodo.fieldbyName('FECTRIM').asString;
   NISASEM := DMALM.cdsPeriodo.fieldbyName('FECSEM').asString;
   NISASS := DMALM.cdsPeriodo.fieldbyName('FECSS').asString;
   NISAAATRI := DMALM.cdsPeriodo.fieldbyName('FECAATRI').asString;
   NISAAASEM := DMALM.cdsPeriodo.fieldbyName('FECAASEM').asString;
   NISAAASS := DMALM.cdsPeriodo.fieldbyName('FECAASS').asString;
   NISANOMM := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);

   If DMALM.cdsNIA.Active = False Then
      DMALM.cdsNIA.Open;
   If DMALM.cdsNIA.State In [dsInsert, dsEdit] Then DMALM.cdsNIA.Cancel;

   DMALM.cdsNIA.Insert;
   sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := dblcLOCOri.Text;
   sALM := dblcTALMOri.Text;
   sTIN := dblcTINOri.Text;
   sTDA := wTRITDODES;
// Inicio HPC_201504_ALM
   //  Se cambia la llave de numeración a CIA+ALMACEN+TIPO+Nro.Nota
   // sNIS := DMALM.StrZero(DMALM.MaxNIA(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoIng);
   sNIS := DMALM.StrZero(DMALM.MaxNIA(sCIA, sALM), wAnchoIng);
// Fin HPC_201504_ALM

   DMALM.cdsNIA.FieldByName('CIAID').AsString := sCIA;
   DMALM.cdsNIA.FieldByName('LOCID').AsString := sLOC;
   DMALM.cdsNIA.FieldByName('TINID').AsString := sTIN;
   DMALM.cdsNIA.FieldByName('ALMID').AsString := sALM;
   DMALM.cdsNIA.FieldByName('TDAID').AsString := sTDA;
   DMALM.cdsNIA.FieldByName('NISAID').AsString := sNIS;

   DMALM.cdsNIA.FieldByName('TRIID').AsString := wTRITRDES;
   DMALM.cdsNIA.FieldByName('LOCORIID').AsString := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   DMALM.cdsNIA.FieldByName('TINORIID').AsString := DMALM.cdsNIS.FieldByName('TINID').AsString;
   DMALM.cdsNIA.FieldByName('ALMORIID').AsString := DMALM.cdsNIS.FieldByName('ALMID').AsString;
   DMALM.cdsNIA.FieldByName('TDAORIID').AsString := DMALM.cdsNIS.FieldByName('TDAID').AsString;
   DMALM.cdsNIA.FieldByName('NISAORIID').AsString := DMALM.cdsNIS.FieldByName('NISAID').AsString;
   DMALM.cdsNIA.FieldByName('CCOSID').AsString := DMALM.cdsNIS.FieldByName('CCOSID').AsString;
   DMALM.cdsNIA.FieldbyName('NISATIP').AsString := 'INGRESO';
   DMALM.cdsNIA.FieldByName('NISSIT').AsString := 'INICIAL';
   DMALM.cdsNIA.FieldByName('DOCID').AsString := DMALM.cdsNIS.FieldByName('DOCID').AsString;
   DMALM.cdsNIA.FieldByName('NISANDOC').AsString := DMALM.cdsNIS.FieldByName('NISANDOC').AsString;
   DMALM.cdsNIA.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsNIS.FieldByName('NISAFDOC').AsDateTime;
   DMALM.cdsNIA.FieldbyName('NISAUSER').AsString := DMALM.wUsuario;
   DMALM.cdsNIA.FieldByName('ODCID').AsString := 'N';
   DMALM.cdsNIA.FieldbyName('NISAOBS').AsString := 'TRANSFERIDO DESDE ' + Uppercase(dbeALM.Text) + '      Nº Nota Salida  ' + DMALM.cdsNIS.FieldByName('NISAID').AsString;

   DMALM.cdsNIA.FieldbyName('NISAANO').AsString := NISAANO;
   DMALM.cdsNIA.FieldbyName('NISAMES').AsString := NISAMES;
   DMALM.cdsNIA.FieldbyName('NISADIA').AsString := NISADIA;
   DMALM.cdsNIA.FieldbyName('NISAANOMES').AsString := NISAANOMES;
   DMALM.cdsNIA.FieldbyName('NISATRIM').AsString := NISATRIM;
   DMALM.cdsNIA.FieldbyName('NISASEM').AsString := NISASEM;
   DMALM.cdsNIA.FieldbyName('NISASS').AsString := NISASS;
   DMALM.cdsNIA.FieldbyName('NISAAATRI').AsString := NISAAATRI;
   DMALM.cdsNIA.FieldbyName('NISAAASEM').AsString := NISAAASEM;
   DMALM.cdsNIA.FieldbyName('NISAAASS').AsString := NISAAASS;
   DMALM.cdsNIA.FieldbyName('NISANOMM').AsString := NISANOMM;
   DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime := DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime;
   DMALM.cdsNIA.FieldbyName('NISAHREG').AsDateTime := Date + SysUtils.Time;

   DMALM.cdsNIA.FieldByName('PROV').required := False;
   DMALM.cdsNIA.FieldByName('CCOSID').required := False;

   DMALM.cdsNIA.Post;
   Try
      xSQL := ' Insert into LOG314( CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, CCOSID, TRIID, '
         + '                        NISAFREG,NISSIT,DOCID,NISANDOC,NISAFDOC,NISANOMM,NISAOBS,NISAUSER,NISAHREG, '
         + '                        NISAANO, NISAMES, NISADIA, NISATRIM, NISASEM, NISAANOMES, NISASS, NISAAATRI, NISAAASEM, NISAAASS, '
         + '                        ALMORIID,TINORIID,LOCORIID,TDAORIID,NISAORIID,ODCID ) '
         + '    Values( ' + quotedstr(sCIA) + ', '
         + quotedstr(sLOC) + ', '
         + quotedstr(sTIN) + ', '
         + quotedstr(sALM) + ', '
         + quotedstr(sTDA) + ', '
         + quotedstr(sNIS) + ', '
         + quotedstr('INGRESO') + ', '
         + quotedstr(DMALM.cdsNIS.fieldbyname('CCOSID').AsString) + ', '
         + quotedstr(wTRITRDES) + ', '
      // Inicio HPC_201607_ALM 08/08/2016
      // Grabación de campo NISAFREG en ACEPTACION de acuerdo a lo indicadd en campo de Fecha de la Nota de Salida
      //   + '                TRUNC(sysdate), '
         + quotedstr(datetostr(DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime))+ ', '
      // Fin HPC_201607_ALM 08/08/2016
         + quotedstr('INICIAL') + ', '
         + quotedstr(DMALM.cdsNIS.fieldbyname('DOCID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.fieldbyname('NISANDOC').AsString) + ', '
         + quotedstr(datetostr(DMALM.cdsNIS.fieldbyname('NISAFDOC').AsDateTime)) + ', '
         + quotedstr(DMALM.cdsNIS.fieldbyname('NISANOMM').AsString) + ', '
         + quotedstr('TRANSFERIDO DESDE ' + Uppercase(dbeALM.Text) + '      Nº Nota Salida  ' + DMALM.cdsNIS.FieldByName('NISAID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.fieldbyname('NISAUSER').AsString) + ', '
         + '                sysdate, '
         + quotedstr(NISAANO) + ', '
         + quotedstr(NISAMES) + ', '
         + quotedstr(NISADIA) + ', '
         + quotedstr(NISATRIM) + ', '
         + quotedstr(NISASEM) + ', '
         + quotedstr(NISAANOMES) + ', '
         + quotedstr(NISASS) + ', '
         + quotedstr(NISAAATRI) + ', '
         + quotedstr(NISAAASEM) + ', '
         + quotedstr(NISAAASS) + ', '
         + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.FieldByName('TINID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.FieldByName('LOCID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.FieldByName('TDAID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString) + ', '
         + quotedstr('N') + ')';
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error 3 al Insertar Datos en la Cabecera de la Nota de Ingreso por Transferencia');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   sLOCs := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   sTINs := DMALM.cdsNIS.FieldByName('TINID').AsString;
   sALMs := DMALM.cdsNIS.FieldByName('ALMID').AsString;
   sTDAs := DMALM.cdsNIS.FieldByName('TDAID').AsString;
   sNISs := DMALM.cdsNIS.FieldByName('NISAID').AsString;

   sSQL := ' Insert into LOG315(CIAID, LOCID, ALMID, TINID, TDAID, NISAID, TRIID, DOCID, NISAFDOC, '
      + '                       KDXID, NISATIP, NISSIT, ARTID, GRARID, FAMID, SFAMID, ARTCONT, UNMIDG, '
      + '                       UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA, ARTPCU, ARTPCG, ARTMORIPCG, '
      + '                       ARTMORIPCU,  ARTPVU, ARTPVG, ARTFUC, TMONID, ARTCRGO, ARTACTIVO, CUENTAID, '
      + '                       NISANDOC, CCOSID, ARTDES, NISAFREG, KDXPEDIDOG, KDXPEDIDOU, KDXCNTG, KDXCNTU, '
      + '                       KDXSALDOG, KDXSALDOU, KDXUSER, KDXFREG, KDXHREG, KDXANO, KDXMM, KDXDD, KDXTRI, '
      + '                       KDXSEM, KDXSS, KDXANOMM, KDXAATRI, KDXAASEM, KDXAASS, FLAGVAR, CALID) '
      + '    Select ' + quotedstr(sCIA) + ','
      + quotedstr(sLOC) + ','
      + quotedstr(sALM) + ','
      + quotedstr(sTIN) + ','
      + quotedstr(sTDA) + ','
      + quotedstr(sNIS) + ','
      + quotedstr(wtritrdes) + ','
      + '           DOCID, NISAFDOC, KDXID, ''INGRESO'', ''INICIAL'', ARTID, '
      + '           GRARID, FAMID, SFAMID, ARTCONT, UNMIDG, UNMIDU, FABID, ARTSPRO, ARTSCA, '
      + '           ARTPARA, ARTSNA, ARTPCU, ARTPCG, ARTPCG, ARTPCU, ARTPVU, ARTPVG, ARTFUC, '
      + '           TMONID, ARTCRGO, ARTACTIVO, CUENTAID, NISANDOC, CCOSID, ARTDES, '
      + '           NISAFREG, 0, 0, KDXCNTG, KDXCNTU, 0, 0, '
      + quotedstr(DMALM.wUsuario) + ', KDXFREG, KDXHREG, '
      + quotedstr(NISAANO) + ', '
      + quotedstr(NISAMES) + ', '
      + quotedstr(NISADIA) + ', '
      + quotedstr(NISATRIM) + ', '
      + quotedstr(NISASEM) + ', '
      + quotedstr(NISASS) + ', '
      + quotedstr(NISAANOMES) + ', '
      + quotedstr(NISAAATRI) + ', '
      + quotedstr(NISAAASEM) + ', '
      + quotedstr(NISAAASS) + ', '
      + '           FLAGVAR, CALID '
      + '      from LOG315 '
      + '     where CIAID= ''' + sCIA + ''' '
      + '       and LOCID=''' + sLOCs + ''' '
      + '       and TINID=''' + sTINs + ''' '
      + '       and ALMID=''' + sALMs + ''' '
      + '       and TDAID=''' + sTDAs + ''' '
      + '       and NISAID=''' + sNISs + ''''
      + '       and NISATIP =''SALIDA'' ';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
   Except
      ShowMessage('Error 3 al Insertar Datos en el Detalle de la Nota de Ingreso por Transferencia');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   DMALM.cdsNIS.Edit;
   DMALM.cdsNIS.FieldByName('NISAORIID').AsString := sNIS;
   DMALM.cdsNIS.FieldByName('NISAOBS').AsString := DMALM.cdsNIS.FieldByName('NISAOBS').AsString + '                    Nº Nota Ingreso  ' + sNIS;
   DMALM.cdsNIS.FieldByName('TDAORIID').AsString := wTRITDODES;
   DMALM.cdsNIS.Post;
   xsql := 'Update LOG314 '
      + '      set NISAORIID=''' + sNIS + ''','
      + '          NISAOBS=''' + DMALM.cdsNIS.FieldByName('NISAOBS').AsString + '                    Nº Nota Ingreso  ' + sNIS + ''','
      + '          TDAORIID=''' + wTRITDODES + ''' '
      + '    where CIAID = ''' + sCIA + ''' '
      + '      and LOCID = ''' + sLOCs + ''' '
      + '      and TINID = ''' + sTINs + ''' '
      + '      and ALMID = ''' + sALMs + ''' '
      + '      and TDAID = ''' + sTDAs + ''' '
      + '      and NISAID= ''' + sNISs + ''' '
      + '      and NISATIP=''SALIDA''';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      ShowMessage('Error al actualizar las Observaciones en la cabecera de la Nota de Salida');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      exit;
   End;

   sSQL := ' Select * from LOG332 '
      + '     where CIAID=' + QuotedStr(dblcCIA.text)
      + '       and LOCID=' + QuotedStr(dblcLOC.text)
      + '       and TINID=' + QuotedStr(dblcTInv.text)
      + '       and ALMID=' + QuotedStr(dblcTALMOri.text)
      + '       and TDAID2=' + QuotedStr(DMALM.cdsNIA.FieldByName('TDAID').AsString)
      + '       and NISAID=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISAID').AsString)
      + '       and NISATIP=' + QuotedStr(DMALM.cdsNIA.FieldByName('NISATIP').AsString);
   DMALM.cdsQry4.Close;
   DMALM.cdsQry4.DataRequest(sSQL);
   DMALM.cdsQry4.Open;
   DMALM.cdsQry4.filter := '';
   DMALM.cdsQry4.filtered := False;

   If DMALM.cdsQry4.RecordCount <= 0 Then
   Begin
      DMALM.cdsQry3.Close;
      DMALM.cdsQry3.DataRequest('SELECT LOG332.*,''N'' TX '
         + '                       FROM LOG332 '
         + '                      WHERE CIAID=' + QuotedStr(dblcCIA.text)
         + '                        AND LOCID=' + QuotedStr(dblcLOC.text)
         + '                        AND TINID=' + QuotedStr(dblcTInv.text)
         + '                        AND ALMID=' + QuotedStr(dblcTALM.text)
         + '                        AND TDAID2=' + QuotedStr(dblcTDA.text)
         + '                        AND NFAC=' + QuotedStr(dbeNumNISA.text));
      DMALM.cdsQry3.Open;
      DMALM.cdsQry3.First;

      DMALM.cdsKDXNSal.DisableControls;
      DMALM.cdsKDXNSal.First;
      While Not DMALM.cdsKDXNSal.EOF Do
      Begin
         If DMALM.DisplayDescrip('prvTGE', 'TGE205', 'FNSERIE,MARCA,MODELO,COLOR',
            'CIAID=' + QuotedStr(dblcCIA.text)
            + ' AND TINID=' + QuotedSTr(dblcTInv.text)
            + ' AND ARTID=' + QuotedStr(DMALM.cdsKDXNSal.FieldByName('ARTID').AsString), 'FNSERIE') = 'S' Then
         Begin
            For i := 1 To DMALM.cdsKDXNSal.FieldByName('KDXCNTG').AsInteger Do
            Begin
               j := StrToInt(DMALM.MaxValue('ITEM', DMALM.cdsQry4));
               DMALM.cdsQry3.Filter := ' ARTID=' + QuotedStr(DMALM.cdsKDXNSal.FieldByName('ARTID').AsString)
                  + ' and TX=''N'' ';
               DMALM.cdsQry3.Filtered := True;

               DMALM.cdsQry4.Append; //DATOS DE LA NOTA DE INGRESO cdsNIA
               DMALM.cdsQry4.FieldByName('CIAID').AsString := dblcCIA.text;
               DMALM.cdsQry4.FieldByName('LOCID').AsString := dblcLOC.text;
               DMALM.cdsQry4.FieldByName('TINID').AsString := dblcTInv.text;
               DMALM.cdsQry4.FieldByName('ALMID').AsString := dblcTALMOri.text;
               DMALM.cdsQry4.FieldByName('TDAID').AsString := sTDA;
               DMALM.cdsQry4.FieldByName('NISAID').AsString := sNis;
               DMALM.cdsQry4.FieldByName('NISATIP').AsString := 'INGRESO';
               DMALM.cdsQry4.FieldByName('KDXID').AsString := DMALM.cdsKDXNSal.FieldByName('KDXID').AsString;
               DMALM.cdsQry4.FieldByName('ARTID').AsString := DMALM.cdsKDXNSal.FieldByName('ARTID').AsString;
               DMALM.cdsQry4.FieldByName('ARTDES').AsString := DMALM.cdsKDXNSal.FieldByName('ARTDES').AsString;
               DMALM.cdsQry4.FieldByName('GRARID').AsString := DMALM.cdsKDXNSal.FieldByName('GRARID').AsString;
               DMALM.cdsQry4.FieldByName('FAMID').AsString := DMALM.cdsKDXNSal.FieldByName('FAMID').AsString;
               DMALM.cdsQry4.FieldByName('SFAMID').AsString := DMALM.cdsKDXNSal.FieldByName('SFAMID').AsString;
               DMALM.cdsQry4.FieldByName('MARCA').AsString := DMALM.cdsQry.FieldByName('MARCA').AsString;
               DMALM.cdsQry4.FieldByName('MODELO').AsString := DMALM.cdsQry.FieldByName('MODELO').AsString;
               DMALM.cdsQry4.FieldByName('COLOR').AsString := DMALM.cdsQry3.FieldByName('COLOR').AsString;
               DMALM.cdsQry4.FieldByName('ACFSERIE').AsString := DMALM.cdsQry3.FieldByName('ACFSERIE').AsString;
               DMALM.cdsQry4.FieldByName('ITEM').AsInteger := j;
               DMALM.cdsQry4.FieldByName('ENTREGADO').AsString := 'N';
               DMALM.cdsQry4.Post;

               xSQL := 'Insert into LOG332(CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, '
                  + '                      KDXID, ARTID, ARTDES, GRARID, FAMID, SFAMID, MARCA, '
                  + '                      MODELO, COLOR, ACFSERIE, ITEM, ENTREGADO) '
                  + '   Values('
                  + quotedstr(DMALM.cdsQry4.FieldByName('CIAID').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('LOCID').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('TINID').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('ALMID').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('TDAID').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('NISAID').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('NISATIP').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('KDXID').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('ARTID').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('ARTDES').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('GRARID').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('FAMID').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('SFAMID').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('MARCA').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('MODELO').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('COLOR').AsString) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('ACFSERIE').AsString) + ','
                  + inttostr(DMALM.cdsQry4.FieldByName('ITEM').AsInteger) + ','
                  + quotedstr(DMALM.cdsQry4.FieldByName('ENTREGADO').AsString) + ')';
               Try
                  DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('Error al actualizar archivo transitorio de Activos Fijos en la N/Ingreso');
                  DMALM.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
               DMALM.cdsQry3.Edit;
               DMALM.cdsQry3.FieldByName('TX').AsString := 'S';
               DMALM.cdsQry3.Post;
            End;
         End;
         DMALM.cdsKDXNSal.Next;
      End;
      DMALM.cdsKDXNSal.EnableControls;
   End;

   DMALM.DCOM1.AppServer.GrabaTransaccion;
   Screen.Cursor := crDefault;
   ShowMessage('Ingreso por Transferencia correctamente grabado');

   DMALM.cdsQry3.Filtered := False;
   DMALM.cdsQry3.Filter := '';

   DMALM.cdsQry4.Filtered := False;
   DMALM.cdsQry4.IndexFieldNames := '';
End;

Procedure TFRegNtaSAL.Adiciona;
Begin
   Z2bbtnNuevo.Visible := True;
   dblcTransac.Clear;
   dbeTransac.Clear;
   dblcdCC.Clear;
   dbeCC.Clear;
   dblcdProv.Clear;
   dbeProv.Clear;
End;

Procedure TFRegNtaSAL.Edita;
Begin
   lblEstado.Caption := DMALM.cdsNIS.FieldByName('NISSIT').AsString;
   If (DMALM.cdsNIS.FieldByName('NISSIT').AsString = 'ACEPTADO') Or
      (DMALM.cdsNIS.FieldByName('NISSIT').AsString = 'ANULADO') Then
   Begin
      OnOffCabecera(False);
      OnOffDetalle(False); //Desactivar el panel de detalle
      ActivaBotones(pnlDetalleG, False);
   End
   Else
   Begin
      OnOffCabecera(True); //Activar la cabecera
      ActivaBotones(pnlDetalleG, false);
      OnOffDetalle(False); //Desactivar el panel de detalle
   End;
End;

Procedure TFRegNtaSAL.ActivaBotones(pnl: TPanel; xFlag: Boolean);
Var
   i: Integer;
Begin
   For i := 0 To pnl.ControlCount - 1 Do
   Begin
      If pnl.controls[i] Is tbitbtn Then
         TBitBtn(pnl.controls[i]).enabled := xFlag;
   End;
End;

Procedure TFRegNtaSAL.validafecha;
Var
   sSQL: String;
Begin
   If dblcTALM.Text <> '' Then
   Begin
      sSQL := 'Select * '
         + '     from LOG317 '
         + '    where LOG317.CIAID=' + QUOTEDSTR(dblcCIA.Text)
         + '      and LOG317.LOCID=' + QUOTEDSTR(dblcLOC.Text)
         + '      and LOG317.ALMID=' + QUOTEDSTR(dblcTALM.Text)
         + '      and LOG317.TINID=' + QUOTEDSTR(dblcTInv.Text)
         + '    order by CIAID, LOCID, TINID, ALMID, CNSULTCIE';
      DMALM.cdsCIERRE.Close;
      DMALM.cdsCIERRE.DataRequest(sSQL);
      DMALM.cdsCIERRE.Open;
      If DMALM.cdsCIERRE.RecordCount < 1 Then
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

Procedure TFRegNtaSAL.Nuevafecha;
Var
   vfecult, vmasdia: Tdate;
   vyear, vmonth, vday: word;
   vyear1, vmonth1, vday1: word;
   vyear2, vmonth2, vday2: word;
Begin
   vValida := false;
   vmasdia := StrToDate(DMALM.cdsCIERRE.fieldbyname('CNSPRICIE').AsString);
   vfecult := StrToDate(DMALM.cdsCIERRE.fieldbyname('CNSULTCIE').AsString);
   DecodeDate(vmasdia, vyear, vmonth, vday); //calculado
   DecodeDate(vfecult, vyear1, vmonth1, vday1); // anterior
   DecodeDate(strTodate(dbdtpFNS.text), vyear2, vmonth2, vday2); //digitada
   If (strTodate(dbdtpFNS.text) >= vmasdia) And
      (strTodate(dbdtpFNS.text) <= vfecult) Then
   Begin
      Exit;
   End;
   ErrorMsg('Error', 'No se puede Registrar la Nota de Salida al' + #13 + #13
      + IntToStr(vday2) + ' de ' + LongMonthNames[vmonth2] + ' del ' + IntToStr(vyear2) + ' ' + #13 + #13 +
      'Fecha No esta dentro del Rango Permitido del ' + datetostr(vmasdia) + ' al ' + datetostr(vfecult));
   vValida := True;
End;

Procedure TFRegNtaSAL.dblcdClieExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'CLIEID=' + quotedstr(dblcdProv.text);
   dbeClie.Text := DMALM.DisplayDescrip('prvTGE', 'TGE204', 'CLIEDES', ssql, 'CLIEDES');
End;

Procedure TFRegNtaSAL.dblcdProvExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'CLAUXID=' + quotedstr(xProv) + ' AND PROV=' + quotedstr(dblcdProv.text);
   dbeProv.Text := DMALM.DisplayDescrip('prvTGE', 'TGE201', 'PROVDES', ssql, 'PROVDES');
End;

Procedure TFRegNtaSAL.dblcdTDOCExit(Sender: TObject);
Var
   bValue: Boolean;
   xSQL: String;
Begin
   bValue := Not (dblcdTDOC.Text = '');
   lblFDoc.Enabled := bValue;
   lblNDoc.Enabled := bValue;
   lblSerie.Enabled := bValue;
   dbeNDoc.Enabled := bValue;
   If DMALM.cdsKDXNSal.Active = true Then
      If DMALM.cdsKDXNSal.RecordCount = 0 Then
         dbdtpFDoc.Enabled := bValue;
   dbeSerie.Enabled := bValue;
   xSQL := 'DOCID=' + quotedstr(dblcdTDOC.Text);
   If (dblcdTDOC.text <> '') Then
      dbeDOCS.text := DMALM.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', xSQL, 'DOCDES');
   If (bValue) And (pnlCabecera.Enabled = true) Then
      dbeSerie.SetFocus;
End;

Procedure TFRegNtaSAL.dblcCIAExit(Sender: TObject);
Var
   xSQL, sNUM, sCIA, sALM, sTIN, sTDA, sLOC: String;
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   If DMALM.cdsNIS.fieldbyname('CIAID').AsString <> '' Then
      dbeCIA.text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', xSQL, 'CIADES');

   If wFil_Ccos = 'S' Then
   Begin
      DMALM.FiltraCDS(DMALM.cdsCCost, 'SELECT * FROM TGE203 WHERE CCOSACT<>''N'' AND CCOSCIAS LIKE ''%' + dblcCIA.Text + '%'' ORDER BY CCOSID');
   End;

   FiltraTabla(DMALM.cdsLOC, 'TGE126', 'LOCID', 'LOCID', xSQL);
{   xSQL := 'SELECT * FROM TGE126 WHERE ' + xSQL;
   DMALM.cdsLOC.Close;
   DMALM.cdsLOC.DataRequest(xSQL);
   DMALM.cdsLOC.open;
}

   If Not showing Then Exit;
   If Not (DMALM.cdsNIS.State In [dsInsert, dsEdit]) Then exit;
   sCIA := dblcCIA.Text;
   sALM := dblcTALM.Text;
   sLOC := dblcLOC.Text;
   sTDA := dblcTDA.Text;
   sTIN := dblcTInv.Text;
   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sLOC = '') Then
      Exit;

   If DMALM.cdsNIS.State In [dsInsert] Then
   Begin
      DMALM.cdsNIS.FieldByName('NISAID').AsString := '';
      dbeNumNISA.Text := '';
      sNUM := '';
   End
   Else
   Begin
      snum := DMALM.cdsNIS.fieldbyname('NISAID').AsString;
      dbeNumNISA.Text := sNUM;
   End;

End;

Procedure TFRegNtaSAL.dblcLOCExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND LOCID=' + quotedstr(dblcLOC.text);
   dbeLoc.Text := DMALM.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', xSQL, 'LOCDES');
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);

// Tipos de Inventario
   FiltraTabla(DMALM.cdsTINID, 'TGE152', 'TINID', 'TINID', xSQL);
{
   xSQL := 'SELECT * FROM TGE152 WHERE ' + xSQL;
   DMALM.cdsTINID.Close;
   DMALM.cdsTINID.DataRequest(xSQL);
   DMALM.cdsTINID.open;
}
End;

Procedure TFRegNtaSAL.dblcTALMExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTInv.text) + ' AND ALMID=' + quotedstr(dblcTALM.text);
   dbeALM.Text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');
End;

Procedure TFRegNtaSAL.dblcTDAExit(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTIN, sLOC, sTDA, sSQL: String;
Begin
   If Not showing Then exit;
   If Not (DMALM.cdsNIS.State In [dsInsert, dsEdit]) Then exit;
   If Not DMALM.cdsNIS.Modified Then Exit;

   sCIA := dblcCIA.Text;
   sALM := dblcTALM.Text;
   sTDA := dblcTDA.Text;
   sLOC := dblcLOC.Text;
   sTIN := dblcTInv.Text;

   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sLOC = '') Then
   Begin
      DMALM.cdsNIS.FieldByName('TDAID').Clear;
      If xCrea Then
         Exit;
      dblcTALM.SetFocus;
      Exit;
   End;

   FiltraTabla(DMALM.cdsTRAN, 'TGE208', 'TRIID', 'TRIID', 'TRISGT=''S''');
   If DMALM.cdsNIS.State In [dsInsert, dsEdit] Then
   Begin
      DMALM.cdsNIS.FieldByName('TRIID').Clear;
      DMALM.cdsNIS.FieldByName('CCOSID').Clear;
      DMALM.cdsNIS.FieldByName('PROV').Clear;
   End;
   dblcTransac.Clear;
   dbeTransac.Clear;
   dblcdCC.Clear;
   dbeCC.Clear;
   dblcdProv.Clear;
   dbeProv.Clear;
   If DMALM.cdsNIS.State In [dsInsert] Then
   Begin
      dbeNumNISA.Text := '';
   End
   Else
   Begin
      snum := DMALM.cdsNIS.fieldbyname('NISAID').AsString;
      dbeNumNISA.Text := sNUM;
   End;
   If DMALM.cdsNIS.fieldbyname('TDAID').AsString <> '' Then
      dbeTDNISA.text := DMALM.cdsTDNISA.fieldbyname('TDADES').AsString;
End;

Procedure TFRegNtaSAL.dblcTransacExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'TRIID=' + quotedstr(dblcTransac.Text) + ' AND TRISGT=''S''';
   dbeTransac.Text := DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRIDES', xSQL, 'TRIDES');
   If dbeTransac.text <> '' Then
      ConfiguraNota(Nil);
End;

Procedure TFRegNtaSAL.ConfiguraNota(Sender: TObject);
Var
   xSQL, sSQL: String;
Begin
   If Not showing Then
      Exit;
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   If DMALM.cdsNIS.State = dsInsert Then
   Begin
      DMALM.cdsNIS.fieldbyname('CCOSID').Clear;
      DMALM.cdsNIS.fieldbyname('PROV').Clear;
      DMALM.cdsNIS.fieldbyname('CLIEID').Clear;
      DMALM.cdsNIS.fieldbyname('DOCID').Clear;
      DMALM.cdsNIS.fieldbyname('LOCORIID').Clear;
      DMALM.cdsNIS.fieldbyname('ALMORIID').Clear;
      dbeCC.Text := '';
      dbeProv.Text := '';
      dbeDOCS.Text := '';
      dbeLOCOri.Text := '';
      dbeTINOri.Text := '';
      dbeALMOri.Text := '';
   End;
   sSQL := 'TRIID=''' + dblcTransac.Text + '''' + ' AND TRISGT=''S''';

   DMALM.DisplayDescrip('prvTGE', 'TGE208', 'TRICOSREPO,TRICC, TRIPV, TRITMOV, TRICLIEN, CUENTAID, TRICVTAS, TRITDODES, TRITRDES,TRICONSUMO,TRITRANSEQ,TRIACTURQ,TRICONSIG', sSQL, 'TRICC');

   wFlagCCosto := (Trim(DMALM.cdsQry.FieldByName('TRICC').AsString) = 'S');
   wFlagProveedor := (Trim(DMALM.cdsQry.FieldByName('TRIPV').AsString) = 'S');
   wTipoMov := (Trim(DMALM.cdsQry.FieldByName('TRITMOV').AsString) = 'T');
   wFlagCliente := (Trim(DMALM.cdsQry.FieldByName('TRICLIEN').AsString) = 'S');
   wEsConcumo := (Trim(DMALM.cdsQry.FieldByName('TRICONSUMO').AsString) = 'S');
   wTranfEquiv := (Trim(DMALM.cdsQry.FieldByName('TRITRANSEQ').AsString) = 'S');
   bActUrq := (Trim(DMALM.cdsQry.FieldByName('TRIACTURQ').AsString) = 'S');
   COSREPO := (Trim(DMALM.cdsQry.FieldByName('TRICOSREPO').AsString) = 'S');
   IMPREPO := (Trim(DMALM.cdsQry.FieldByName('TRICONSIG').AsString) = 'S');
   cError := (Trim(DMALM.cdsQry.FieldByName('TRITMOV').AsString) = 'E');

   dbeNDoc.Visible := True;
   dbeSerie.Enabled := True;
   dblcdNDoc.Visible := False;
   lblNDoc.Enabled := True;
   lblTCambio.Visible := wFlagProveedor;
   dbeTCambio.Visible := wFlagProveedor;
   If cError Then
   Begin
      dblcdTDOC.Enabled := False;
      DMALM.cdsNIS.FieldByName('DOCID').AsString := '69';
      dbeSerie.Enabled := False;
      dblcdNDoc.Visible := True;
      dbeNDoc.Visible := False;
      lblNDoc.Enabled := True;
      dblcdNDoc.Enabled := True;
      dblcdNDocEnter(Self);
      If dblcdNDoc.Text <> '' Then
      Begin
         dblcdNDoc.Enabled := False;
      End;
   End;

   wCuenta := Trim(DMALM.cdsQry.FieldByName('CUENTAID').AsString);
   wTricvtas := Trim(DMALM.cdsQry.FieldByName('TRICVTAS').AsString);
   wTritdodes := Trim(DMALM.cdsQry.FieldByName('TRITDODES').AsString);
   wtritrdes := Trim(DMALM.cdsQry.FieldByName('TRITRDES').AsString);
   wGenTraAlm := (Trim(DMALM.cdsQry.FieldByName('TRITMOV').AsString) = 'T');
   wGenTraEqui := (Trim(DMALM.cdsQry.FieldByName('TRITRANSEQ').AsString) = 'S');

   DMALM.cdsNIS.FieldByName('CCOSID').Required := wFlagCCosto;
   DMALM.cdsNIS.FieldByName('PROV').Required := wFlagProveedor;
   DMALM.cdsNIS.FieldByName('CLIEID').Required := wFlagCliente;

   dblcdCC.Enabled := wFlagCCosto;
   lblCC.Enabled := wFlagCCosto;

   Z2bbtnTransEqui.Visible := wTranfEquiv;

   If IMPREPO Then
   Begin
      dbeImpRepo.Visible := True;
      lblImpRepo.Visible := True;
   End
   Else
   Begin
      dbeImpRepo.Visible := False;
      lblImpRepo.Visible := False;
   End;

   If wFlagProveedor Then
   Begin
      dbeProv.Visible := wFlagProveedor;
      dblcdProv.Visible := wFlagProveedor;
      lblProv.Visible := wFlagProveedor;

      dbeClie.Visible := Not wFlagProveedor;
      dblcdClie.Visible := Not wFlagProveedor;
      lblClie.Visible := Not wFlagProveedor;

      dblcdProv.Enabled := wFlagProveedor;
      lblProv.Enabled := wFlagProveedor;

      xProv := DMALM.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');
      DMALM.cdsProv.Close;
      DMALM.cdsProv.DataRequest('SELECT CLAUXID, PROV, PROVRUC, PROVDES, PROVNOMCOM FROM TGE201 WHERE CLAUXID=' + QuotedStr(xProv) + ' ORDER BY PROV');
      DMALM.cdsProv.FetchOnDemand := False;
      DMALM.cdsProv.PacketRecords := 20;
      DMALM.cdsProv.FetchOnDemand := True;
      DMALM.cdsProv.Open;
   End
   Else
      If wFlagCliente Then
      Begin
         dbeProv.Visible := Not wFlagCliente;
         dblcdProv.Visible := Not wFlagCliente;
         lblProv.Visible := Not wFlagCliente;

         dbeClie.Visible := wFlagCliente;
         dblcdClie.Visible := wFlagCliente;
         lblClie.Visible := wFlagCliente;

         dblcdClie.Enabled := wFlagCliente;
         lblClie.Enabled := wFlagCliente;

         If DMALM.wModo = 'A' Then
         Begin
            If (wFlagCliente) And (Not DMALM.cdsClient.active) Then
            Begin
               DMALM.cdsClient.Close;
               DMALM.cdsClient.DataRequest('SELECT * FROM TGE204 ORDER BY CLIEID');
               DMALM.cdsClient.FetchOnDemand := False;
               DMALM.cdsClient.PacketRecords := 20;
               DMALM.cdsClient.FetchOnDemand := True;
               DMALM.cdsClient.Open;
            End;
         End;
      End
      Else
      Begin
         dbeClie.Visible := True;
         dblcdClie.Visible := True;
         lblClie.Visible := True;

         dblcdClie.Enabled := False;
         lblClie.Enabled := False;
      End;

   If wTipoMov Then
   Begin
      xSQL := 'SELECT * FROM TGE126 WHERE ' + xSQL;
      DMALM.cdsLKLOC.Close;
      DMALM.cdsLKLOC.DataRequest(xSQL);
      DMALM.cdsLKLOC.open;
   End
   Else
      If Not wTipoMov And Not wTranfEquiv Then
      Begin
         dblcLOCOri.Text := '';
         dbeLOCOri.Text := '';
         dblcTINOri.Text := '';
         dbeTINOri.Text := '';
         dblcTALMOri.Text := '';
         dbeALMOri.Text := '';
         dblcTINOri.Text := '';
         dbeTINOri.Text := '';
      End;
   dblcLOCOri.Enabled := wTipoMov;
   dblcTALMOri.Enabled := wTipoMov;
   dblcTINOri.Enabled := wTipoMov;

   If cError Then
   Begin
      xSQL := 'DOCID=' + quotedstr(dblcdTDOC.Text);
      dbeDOCS.text := DMALM.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', xSQL, 'DOCDES');
   End;

// Transferencia Equivalentes
   If Not wTipoMov And wTranfEquiv Then
   Begin
      xSQL := 'SELECT * FROM TGE126 WHERE ' + xSQL;
      DMALM.cdsLKLOC.Close;
      DMALM.cdsLKLOC.DataRequest(xSQL);
      DMALM.cdsLKLOC.open;
   End
   Else
      If Not wTranfEquiv And Not wTipoMov Then
      Begin
         dblcLOCOri.Text := '';
         dbeLOCOri.Text := '';
         dblcTINOri.Text := '';
         dbeTINOri.Text := '';
         dblcTALMOri.Text := '';
         dbeALMOri.Text := '';
         dblcTINOri.Text := '';
         dbeTINOri.Text := '';
      End;
   If wTranfEquiv And Not wTipoMov Then
   Begin
      dblcLOCOri.Enabled := wTranfEquiv;
      dblcTALMOri.Enabled := wTranfEquiv;
      dblcTINOri.Enabled := wTranfEquiv;
   End;

   If wOperacion = 'MOD' Then
   Begin
      dblcLOCOri.Enabled := False;
      dblcTALMOri.Enabled := False;
      dblcTINOri.Enabled := False;
   End;
End;

Procedure TFRegNtaSAL.dblcLOCOriExit(Sender: TObject);
Var
   xSQL, sWhere: String;
Begin
   sWhere := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND LOCID=' + quotedstr(dblcLOCOri.Text);
   If DMALM.cdsNIS.fieldbyname('LOCORIID').AsString <> '' Then
      dbeLOCOri.text := DMALM.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', sWhere, 'LOCDES');

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   FiltraTabla(DMALM.cdsLKTIN, 'TGE152', 'TINID', 'TINID', xSQL);
   {
   xSQL := 'SELECT * FROM TGE152 WHERE CIAID=' + quotedstr(dblcCIA.text);
   DMALM.cdsLKTIN.Close;
   DMALM.cdsLKTIN.DataRequest(xSQL);
   DMALM.cdsLKTIN.open;
   }
End;

Procedure TFRegNtaSAL.dblcTALMOriExit(Sender: TObject);
Var
   sWhere: String;
Begin
   sWhere := 'LOCID=' + quotedstr(dblcLOCOri.text) + ' AND TINID=' + quotedstr(dblcTINOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALMOri.text);
   If DMALM.cdsNIS.fieldbyname('ALMORIID').AsString <> '' Then
      dbeALMOri.text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', sWhere, 'ALMDES');
   If length(trim(DMALM.cdsNIS.FieldbyName('NISAOBS').AsString)) = 0 Then
      DMALM.cdsNIS.FieldbyName('NISAOBS').AsString := 'TRANSFERENCIA A ' + Uppercase(dbeALMOri.text) + '.';
End;

Procedure TFRegNtaSAL.Z2bbtnSalirClick(Sender: TObject);
Begin
   ELiminarNS;

   If DMALM.wTipoAdicion = 'xFiltro' Then
   Begin
      mtx4000.RefreshFilter;
   End;
   DMALM.cdsNIS.CancelUpdates;
   If DMALM.cdsKDXNSal.Active Then DMALM.cdsKDXNSal.CancelUpdates;
   Close;
End;

Procedure TFRegNtaSAL.dbcldArtiExit(Sender: TObject);
Var
   sWhere, sTmp, UMedG, UMedU, sSQL: String;
   ConUnitaria: Boolean;
Begin
   If Z2bbtnRegCanc.Focused Then Exit;

   If DMALM.wAnchoArt > 0 Then
   Begin
      If Length(dbcldArti.Text) < DMALM.wAnchoArt Then
      Begin
         dbcldArti.Text := DMALM.StrZero(dbcldArti.Text, DMALM.wAnchoArt);
      End;
   End;

// Inicio HPC_201504_ALM
   // Se condiciona para que no se consideren salidas de Artículos que son ACTIVOS FIJOS
   sWhere := ' CIAID=' + quotedstr(dblcCIA.Text)
      + '  and TINID=' + quotedstr(dblcTInv.Text)
      + '  and ARTID=' + quotedstr(dbcldArti.Text) + ' '
      + '  and ARTACTIVO <>''ACTIVO'' ';
// Fin HPC_201504_ALM
   DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES, ARTCONT, UNMIDG, UNMIDU, ARTFUC, ARTEST', sWhere, 'ARTDES');
   dbeArti.Text := DMALM.cdsQry.FieldByName('ARTDES').AsString;

   If Length(Trim(dbeArti.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' Artículo No Existe ');
      dbcldArti.SetFocus;
      Exit;
   End;

   If DMALM.cdsQry.FieldByName('ARTEST').AsString <> 'H' Then
   Begin
      ErrorMsg(Caption, ' Artículo No ESTA ACTIVO ');
      dbcldArti.SetFocus;
      Exit;
   End;

   If DMALM.cdsQry.FieldByName('ARTFUC').AsDateTime > dbdtpFNS.date Then
   Begin
      dbcldArti.text := '';
      dbeArti.text := '';
      dbePedidoG.text := '';
      dbeCantidadG.text := '';
      dbePedidoU.text := '';
      dbeCantidadU.text := '';
      dbcldArti.SetFocus;
      ErrorMsg(Caption, 'La Fecha de la Nota de Salida ' + #13 + 'es menor a la Fecha de la última compra');
      Exit;
   End;

   UMedG := DMALM.cdsQry.FieldByName('UNMIDG').AsString;
   UMedU := DMALM.cdsQry.FieldByName('UNMIDU').AsString;

   ConUnitaria := ((DMALM.cdsQry.FieldByName('ARTCONT').AsString) <> '1');
   sTmp := 'UNMID=' + quotedstr(UMedG);
   lblMedGnrl.Caption := 'Med. Gnrl. ' + DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');

   If ConUnitaria = True Then
   Begin
      sTmp := 'UNMID=' + quotedstr(UMedU);
      lblMedUni.Caption := 'Med. Uni. ' + DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');
   End;

   dbePedidoU.Enabled := ConUnitaria;
   dbeCantidadU.Enabled := ConUnitaria;
   If ConUnitaria = False Then
   Begin
      dbePedidoU.Text := '0';
      dbeCantidadU.Text := '0';
   End;

   lblReqUsuario.Visible := False;
   dblcdRequerimiento.Visible := False;

   If wEsConcumo And wFlagCCosto Then
   Begin
      sSQL := ' SELECT URQID,DURQEST,' + '(' + DMALM.wReplacCeros + '(DURQCNAG,0) - ' + DMALM.wReplacCeros + '(DURQCNATG,0)) SALDG,  ' +
         '(' + DMALM.wReplacCeros + '(DURQCNAU,0) - ' + DMALM.wReplacCeros + '(DURQCNATU,0)) SALDU  '
         + '   FROM LOG307'
         + '  WHERE CIAID=' + Quotedstr(dblcCIA.text)
         + '    AND LOCID=' + Quotedstr(dblcLOC.text)
         + '    AND CCOSID=' + Quotedstr(dblcdCC.text)
         + '    AND ARTID=' + Quotedstr(dbcldArti.text);
      DMALM.cdsQry4.IndexFieldNames := '';
      DMALM.cdsQry4.Filter := '';
      DMALM.cdsQry4.Filtered := FALSE;
      DMALM.cdsQry4.Close;
      DMALM.cdsQry4.DataRequest(sSQL);
      DMALM.cdsQry4.Open;
      If DMALM.cdsQry4.RecordCount > 1 Then
      Begin
         dblcdRequerimiento.Selected.clear;
         dblcdRequerimiento.Selected.Add('URQID'#9'10'#9'Requerimiento');
         dblcdRequerimiento.Selected.Add('DURQEST'#9'10'#9'Estado');
         dblcdRequerimiento.Selected.Add('SALDG'#9'10'#9'Saldo~Gral');
         dblcdRequerimiento.Selected.Add('SALDU'#9'10'#9'Saldo~Unt');
         dblcdRequerimiento.LookupTable := DMALM.cdsQry4;
         dblcdRequerimiento.LookupField := 'URQID';
         lblReqUsuario.Visible := True;
         dblcdRequerimiento.Visible := True;
      End
      Else
      Begin
         dblcdRequerimiento.Selected.clear;
         dblcdRequerimiento.Selected.Add('URQID'#9'10'#9'Requerimiento');
         dblcdRequerimiento.Selected.Add('DURQEST'#9'50'#9'Estado');
         dblcdRequerimiento.Selected.Add('SALDG'#9'10'#9'Saldo~Gral');
         dblcdRequerimiento.Selected.Add('SALDU'#9'10'#9'Saldo~Unt');
         dblcdRequerimiento.LookupTable := DMALM.cdsQry4;
         dblcdRequerimiento.LookupField := 'URQID';
         dblcdRequerimiento.text := DMALM.cdsQry4.fieldbyname('URQID').AsString;
         lblReqUsuario.Visible := True;
         dblcdRequerimiento.Visible := True;
         dblcdRequerimiento.Enabled := False;
         If DMALM.cdsQry4.RecordCount = 0 Then
         Begin
            dblcdRequerimiento.Visible := False;
            dblcdRequerimiento.Enabled := False;
         End;

      End;

   End;
   bbtnKDXSerie.visible := ((DMALM.wKDXSerie = 'S') And (DMALM.DisplayDescrip('dspUltTGE', 'TGE205', 'FNSERIE', 'CIAID=' + QuotedStr(dblcCia.text) + ' AND ARTID=' + QuotedStr(dbcldArti.text), 'FNSERIE') = 'S'));
End;

Procedure TFRegNtaSAL.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TDBMemo Then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRegNtaSAL.dblcLOCEnter(Sender: TObject);
Begin
   If dblcCIA.Text = '' Then
   Begin
      If dblcCIA.Enabled Then
         dblcCIA.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Compañía');
      End;
   End;
End;

Procedure TFRegNtaSAL.dblcTALMEnter(Sender: TObject);
Begin
   If dblcTInv.Text = '' Then
   Begin
      If dblcTInv.Enabled Then
         dblcTInv.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Tipo de Inventario ');
      End;
   End;
End;

Procedure TFRegNtaSAL.dblcTransacEnter(Sender: TObject);
Var
   xSQL: String;
Begin
   If dblcTDA.Text = '' Then
   Begin
      dblcTDA.SetFocus;
      Exit;
   End;

   If Not DMALM.cdsTRAN.Active Then
   Begin
      FiltraTabla(DMALM.cdsTRAN, 'TGE208', 'TRIID', 'TRIID', 'TRISGT=''S''');
   End;
End;

Procedure TFRegNtaSAL.dblcTInvEnter(Sender: TObject);
Begin
   If dblcLOC.Text = '' Then
   Begin
      If dblcLOC.Enabled Then
         dblcLOC.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Localidad');
      End;
   End;
End;

Procedure TFRegNtaSAL.dblcTInvExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTInv.text);
   dbeTinv.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND LOCID=' + quotedstr(dblcLOC.text) + ' AND '
      + 'TINID=' + quotedstr(dblcTInv.text) + ' AND NVL(ACTIVO,''S'')=''S'' ';
   FiltraTabla(DMALM.cdsALM, 'TGE151', 'ALMID', 'ALMID', xSQL);
End;

Procedure TFRegNtaSAL.dblcTINOriExit(Sender: TObject);
Var
   xSQL, sWhere: String;
Begin
   sWhere := 'TINID=' + quotedstr(dblcTINOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   If DMALM.cdsNIS.fieldbyname('TINORIID').AsString <> '' Then
      dbeTINOri.text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', sWhere, 'TINDES');

   xSQL := 'Select * from TGE151 '
      + '    where CIAID=' + quotedstr(dblcCIA.text)
      + '      and LOCID=' + quotedstr(dblcLOCOri.text)
      + '      and TINID=' + quotedstr(dblcTINOri.text)
      + '      and ALMID<>' + quotedstr(dblcTALM.text);
   DMALM.cdsLKALM.Close;
   DMALM.cdsLKALM.DataRequest(xSQL);
   DMALM.cdsLKALM.open;

//   FiltraTabla(DMALM.cdsLKALM, 'TGE151', 'ALMID', 'ALMID', xSQL);
End;

Procedure TFRegNtaSAL.dblcTINOriEnter(Sender: TObject);
Begin
   If dblcLOCOri.Text = '' Then
   Begin
      If dblcLOCOri.Enabled Then
         dblcLOCOri.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Localidad de Destino');
         dblcLOCOri.SetFocus;
      End;
   End;
End;

Procedure TFRegNtaSAL.dblcTALMOriEnter(Sender: TObject);
Begin
   If dblcTINOri.Text = '' Then
   Begin
      If dblcTINOri.Enabled Then
         dblcTINOri.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Tipo de Inventario de Destino');
         dblcTINOri.SetFocus;
      End;
   End;
End;

Procedure TFRegNtaSAL.Z2bbtnPrintClick(Sender: TObject);
Var
   sSQL, sCIA, sLOC, sTIN, sALM, sTDO, sNIN, sTip: String;
   x10: integer;
Begin
   Screen.Cursor := crHourGlass;

   If Not (mtx4000.FMant.cds2.Locate('CIAID;LOCID;TINID;ALMID;TDAID;NISAID',
      VarArrayOf([DMALM.cdsNIS.FieldByName('CIAID').AsString,
      DMALM.cdsNIS.FieldByName('LOCID').AsString,
         DMALM.cdsNIS.FieldByName('TINID').AsString,
         DMALM.cdsNIS.FieldByName('ALMID').AsString,
         DMALM.cdsNIS.FieldByName('TDAID').AsString,
         DMALM.cdsNIS.fieldbyname('NISAID').AsString]), [])) Then
   Begin
      ShowMessage('Nota de Salida aún no está en el Filtro, grabe la Nota de Salida');
      exit;
   End;
// Nota de Salida Valorizada
   FToolNSal.Z1bbtNSalValorizClick(self);

// Documento de Sustento para Salida de Artículos con #Serie y/o Código de Barras
   sSQL := 'Select ARTID, ARTDES, ACFSERIE, MARCA, MODELO, COLOR, CODBAR, '
      + quotedstr(dbeCIA.Text) + ' CIADES, '
      + quotedstr(dbeALM.Text) + ' ALMDES, '
      + quotedstr(dbeCC.Text) + ' NISASOLIC, ';
   If length(dbeALMOri.Text) > 0 Then
      sSQL := sSQL + quotedstr(dbeALMOri.Text) + ' ALMDESORI, '
   Else
      sSQL := sSQL + quotedstr('--') + ' ALMDESORI, ';
   sSQL := sSQL
      + quotedstr(dbeTransac.Text) + ' TRIDES, '
      + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString) + ' NISAID, '
      + quotedstr(datetostr(dbdtpFNS.Date)) + ' NISAFREG '
      + '     from LOG332 A '
      + '    where A.CIAID=' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
      + '      and A.ALMID=' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
      + '      and A.TINID=' + quotedstr(DMALM.cdsNIS.FieldByName('TINID').AsString)
      + '      and A.TDAID2=' + quotedstr(DMALM.cdsNIS.FieldByName('TDAID').AsString)
      + '      and A.NFAC=' + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
   DMALM.cdsKDXSerie.MasterSource := Nil;
   DMALM.cdsKDXSerie.MasterFields := '';
   DMALM.cdsKDXSerie.Filter := '';
   DMALM.cdsKDXSerie.Filtered := False;
   DMALM.cdsKDXSerie.IndexFieldNames := '';
   DMALM.cdsKDXSerie.Close;
   DMALM.cdsKDXSerie.DataRequest(sSQL);
   DMALM.cdsKDXSerie.Open;
   DMALM.cdsKDXSerie.IndexFieldNames := 'ARTID';
   If DMALM.cdsKDXSerie.recordcount > 0 Then
   Begin
      ppDBSerie.MasterDataPipeline := Nil;
      ppDBSerie.DataSource := DMALM.dsKDXSerie;
      pprSeries.DataPipeLine := ppDBSerie;
      pprSeries.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\NSalidaSerie.rtm';
      pprSeries.Template.LoadFromFile;
      If chkdis.Checked Then
      Begin
         ppDesigner1.Report := pprSeries;
         ppDesigner1.ShowModal;
      End
      Else
      Begin
         pprSeries.Print;
         pprSeries.Stop;
         x10 := Self.ComponentCount - 1;
         While x10 >= 0 Do
         Begin
            If Self.Components[x10].ClassName = 'TppGroup' Then
            Begin
               Self.Components[x10].Free;
            End;
            x10 := x10 - 1;
         End;
         ppDBCab.DataSource := Nil;
         ppdbOC.DataSource := Nil;
         ppDBSerie.DataSource := Nil;
      End;
   End;
End;

Procedure TFRegNtaSAL.pprNisSalPreviewFormCreate(Sender: TObject);
Begin
   pprNisSal.PreviewForm.ClientHeight := 500;
   pprNisSal.PreviewForm.ClientWidth := 650;
   TppViewer(pprNisSal.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFRegNtaSAL.dbdtpFNSExit(Sender: TObject);
Begin
   If dbdtpFNS.DateTime = 0 Then
      dbdtpFNS.DateTime := Date;
   vValida := False;
   If xCrea <> true Then
      validafecha;
   If Not vValida Then
   Begin
      If wFlagProveedor Then
         dblcdProv.DropDown;
   End
   Else
   Begin
      dbdtpFNS.SetFocus;
      exit;
   End;
End;

Procedure TFRegNtaSAL.dbgDReqsCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   If DMALM.cdsKDXNSal.FieldByName('KDXFLAG').AsString = 'N' Then
   Begin
      AFont.Style := [fsBold];
      ABrush.Color := clRed;
   End;
End;

Function TFRegNtaSAL.Verif_Saldos: Boolean;
Var
   sSQL, sTIN, sCIA, sALM, sART, sLOC: String;
   Y, M, D: Word;
   xCantTotG, xCantTotU, FStk, Contenido: Double;
Begin

   DecodeDate(DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime, Y, M, D);
   sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIS.FieldByName('TINID').AsString;
   sALM := DMALM.cdsNIS.FieldByName('ALMID').AsString;

   DMALM.cdsKDXNSal.First;
   While Not DMALM.cdsKDXNSal.Eof Do
   Begin
      sART := DMALM.cdsKDXNSal.FieldByName('ARTID').AsString;
      sSQL := 'Select CIAID, LOGANOMM, ALMID, TINID, ARTID, STKINI, CANTOTING, CANTOTSAL, STKFIN, USUARIO, FREG '
         + '     from LOG319 '
         + '    where CIAID=' + quotedstr(sCIA)
         + '      AND TINID=' + quotedstr(sTIN)
         + '      AND ALMID=' + quotedstr(sALM)
         + '      and ARTID=' + quotedstr(sART)
         + '      and LOGANOMM=' + quotedstr(inttostr(Y) + DMALM.StrZero(inttostr(M), 2));
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(sSQL);
      DMALM.cdsQry.Open;
      result := False;
      If DMALM.cdsQry.FieldByName('STKFIN').AsFloat <= 0 Then
      Begin
         result := False;
         exit;
      End;
      DMALM.cdsKDXNSal.Next;
   End;
   result := True;
End;

Procedure TFRegNtaSAL.dbeNumNISAKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In [' ',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '.', '-', '_'] Then
      Key := #0;
End;

Procedure TFRegNtaSAL.bbtnSalirTranfClick(Sender: TObject);
Begin

   If DMALM.cdsMovFac.State In [dsInsert, dsEdit] Then
      DMALM.cdsMovFac.Cancel;
   pnLTransf.Visible := False;
   pnlDetalleG.SetFocus;
End;

Procedure TFRegNtaSAL.BitBtn1Click(Sender: TObject);
Var
   Ano, Mes, sSit, sSQL, sCIA, sART, sTIN, sALM, sNISA, sTDA, sLOC, xWhere: String;
   DFechar: TDateTime;
   bExiste: Boolean;
   D, M, Y: Word;
   PedidoG, PedidoU, CantidadG, CantidadU, Contenido: Double;
Begin
   If sOK <> 1 Then
   Begin
      ErrorMSg('Error', ' La Cantidad a Ingresar Esta con Errores ');
      Exit;
   End;
   sART := dbcldArtiDestino.Text;
   If sART = '' Then
   Begin
      ErrorMSg('Error', 'El Código del Artículo es Obligatorio');
      dbcldArtiDestino.SetFocus;
      Exit;
   End;
   If dbeCantGDest.Text = '' Then dbeCantGDest.Text := '0';
   If dbeCantUDest.Text = '' Then dbeCantUDest.Text := '0';

   CantidadG := StrToFloat(dbeCantGDest.Text);
   CantidadU := StrToFloat(dbeCantUDest.Text);

   sSQL := 'CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINOri.Text + ''' AND ARTID=''' + sART + '''';
   DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTID, ARTDES, FAMID, SFAMID, TINID, GRARID, ARTCONT, UNMIDG, UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA,ARTSNA,ARTCPROU,ARTCPROG,ARTPVU,ARTPVG,ARTFUC,TMONID,ARTCRGO,ARTACTIVO,CUENTAID', sSQL, 'ARTID');
   Contenido := DMALM.cdsQry.FieldByName('ARTCONT').AsFloat;
   If (CantidadG = 0) And (CantidadU = 0) Or
      (CantidadG < 0) And (CantidadU < 0) Then
   Begin
      ErrorMsg('Error', ' La Cantidad Atendida No Puede Ser CERO !!!!! ');
      Exit;
   End;

   sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIS.FieldByName('TINID').AsString;
   sALM := DMALM.cdsNIS.FieldByName('ALMID').AsString;
   DFechar := DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime;
   sNISA := DMALM.cdsNIS.FieldByName('NISAID').AsString;
   sTDA := DMALM.cdsNIS.FieldByName('TDAID').AsString;

   If iEstado = 0 Then
   Begin
      bExiste := DMALM.cdsKDXNSal.Locate('CIAID;LOCID;TINID;ALMID;TDAID;NISAID;ARTID', VarArrayOf([sCIA, sLOC, sTIN, sALM, sTDA, sNISA, sART]), [])
   End
   Else
      bExiste := False;
   If bExiste Then
   Begin
      ErrorMsg('Error', 'No Pueden Existir Artículos Duplicados ...!!!');
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   DecodeDate(DFechar, Y, M, D);
   Ano := IntToStr(Y);
   Mes := DMALM.StrZero(IntToStr(M), 2);
   sSit := 'ATENDIDO';

   sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := dblcLOCOri.text;
   sTIN := dblcTINOri.text;
   sALM := dblcTALMOri.text;
   DFechar := DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime;
   sNISA := DMALM.cdsNIS.FieldByName('NISAID').AsString;
   sTDA := DMALM.cdsNIS.FieldByName('TDAID').AsString;

   If iEstado = 0 Then
      DMALM.cdsMovFac.Insert
   Else
      DMALM.cdsMovFac.Edit;
 {+----------------------------------------------------------------------------+
 |                     GENERANDO MOVIMIENTO DEL ARTICULO                       |
 |     1. Insertar o adicionar registros del movimiento de los artículos       |
 +----------------------------------------------------------------------------+}
   If DMALM.cdsMovFac.State In [dsInsert, dsEdit] Then
   Begin
      Try
         DMALM.cdsMovFac.FieldByName('KDXID').AsString := dbeItem.Text;
         DMALM.cdsMovFac.FieldByName('CIAID').AsString := sCIA;
         DMALM.cdsMovFac.FieldByName('LOCID').AsString := sLOC;
         DMALM.cdsMovFac.FieldByName('TINID').AsString := sTIN;
         DMALM.cdsMovFac.FieldByName('ALMID').AsString := sALM;
         DMALM.cdsMovFac.FieldByName('TDAID').AsString := sTDA;
         DMALM.cdsMovFac.FieldByName('ARTID').AsString := sART;
         DMALM.cdsMovFac.FieldByName('KDXFREG').AsDateTime := DFechar;
         DMALM.cdsMovFac.FieldByName('KDXPEDIDOG').AsString := FloatToStr(CantidadG);
         DMALM.cdsMovFac.FieldByName('KDXPEDIDOU').AsString := FloatToStr(CantidadU);
         DMALM.cdsMovFac.FieldByName('KDXCNTG').AsString := FloatToStr(CantidadG);
         DMALM.cdsMovFac.FieldByName('KDXCNTU').AsString := FloatToStr(CantidadU);
         DMALM.cdsMovFac.FieldByName('SITUACION').AsString := sSit;
         DMALM.cdsMovFac.FieldByName('NISAATERQS').Clear;
         DMALM.cdsMovFac.FieldByName('KDXSALDOG').AsString := '0';
         DMALM.cdsMovFac.FieldByName('KDXSALDOU').AsString := '0';
         DMALM.cdsMovFac.FieldByName('ARTDES').AsString := DMALM.cdsQry.FieldByName('ARTDES').AsString;
         DMALM.cdsMovFac.FieldByName('FAMID').AsString := DMALM.cdsQry.FieldByName('FAMID').AsString;
         DMALM.cdsMovFac.FieldByName('SFAMID').AsString := DMALM.cdsQry.FieldByName('SFAMID').AsString;
         DMALM.cdsMovFac.FieldByName('GRARID').AsString := DMALM.cdsQry.FieldByName('GRARID').AsString;
         DMALM.cdsMovFac.FieldByName('ARTCONT').AsString := DMALM.cdsQry.FieldByName('ARTCONT').AsString;
         DMALM.cdsMovFac.FieldByName('UNMIDG').AsString := DMALM.cdsQry.FieldByName('UNMIDG').AsString;
         DMALM.cdsMovFac.FieldByName('UNMIDU').AsString := DMALM.cdsQry.FieldByName('UNMIDU').AsString;
         DMALM.cdsMovFac.FieldByName('FABID').AsString := DMALM.cdsQry.FieldByName('FABID').AsString;
         DMALM.cdsMovFac.FieldByName('ARTSPRO').AsString := DMALM.cdsQry.FieldByName('ARTSPRO').AsString;
         DMALM.cdsMovFac.FieldByName('ARTSCA').AsString := DMALM.cdsQry.FieldByName('ARTSCA').AsString;
         DMALM.cdsMovFac.FieldByName('ARTPARA').AsString := DMALM.cdsQry.FieldByName('ARTPARA').AsString;
         DMALM.cdsMovFac.FieldByName('ARTSNA').AsString := DMALM.cdsQry.FieldByName('ARTSNA').AsString;
   // El costo de la salida toma el costo promedio actual Eso me sirve para el caso de transferencia y en ventascuando devuelven
   // En realidad, el costo de salida real, lo determina recien en el momento de aceptar la nota de salida
         DMALM.cdsMovFac.FieldByName('ARTPCU').AsString := DMALM.cdsQry.FieldByName('ARTCPROU').AsString;
         DMALM.cdsMovFac.FieldByName('ARTPCG').AsString := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
         DMALM.cdsMovFac.FieldByName('ARTPVU').AsString := DMALM.cdsQry.FieldByName('ARTPVU').AsString;
         DMALM.cdsMovFac.FieldByName('ARTPVG').AsString := DMALM.cdsQry.FieldByName('ARTPVG').AsString;
         DMALM.cdsMovFac.FieldByName('ARTFUC').AsDateTime := DMALM.cdsQry.FieldByName('ARTFUC').AsDateTime;
         DMALM.cdsMovFac.FieldByName('TMONID').AsString := DMALM.cdsQry.FieldByName('TMONID').AsString;
         DMALM.cdsMovFac.FieldByName('ARTCRGO').AsString := DMALM.cdsQry.FieldByName('ARTCRGO').AsString;
         DMALM.cdsMovFac.FieldByName('ARTACTIVO').AsString := DMALM.cdsQry.FieldByName('ARTACTIVO').AsString;
         DMALM.cdsMovFac.FieldByName('CUENTAID').AsString := DMALM.cdsQry.FieldByName('CUENTAID').AsString;
         DMALM.cdsMovFac.FieldByName('NISSIT').AsString := 'INICIAL';
         DMALM.cdsMovFac.FieldByName('ARTTOTALG').AsFloat := 0;
         DMALM.cdsMovFac.FieldByName('ARTTOTALU').AsFloat := 0;
         DMALM.cdsMovFac.FieldByName('ARTTOTAL').AsFloat := 0;
         DMALM.cdsMovFac.FieldByName('PROV').AsString := DMALM.cdsNIS.FieldByName('PROV').AsString;
         DMALM.cdsMovFac.FieldByName('DOCID').AsString := DMALM.cdsNIS.FieldByName('DOCID').AsString;
         DMALM.cdsMovFac.FieldByName('TRIID').AsString := DMALM.cdsNIS.FieldByName('TRIID').AsString;
         DMALM.cdsMovFac.FieldByName('CCOSID').AsString := DMALM.cdsNIS.FieldByName('CCOSID').AsString;
         DMALM.cdsMovFac.FieldByName('ODCID').AsString := DMALM.cdsNIS.FieldByName('ODCID').AsString;
         DMALM.cdsMovFac.FieldByName('NISAID').AsString := DMALM.cdsNIS.FieldByName('NISAID').AsString;
         DMALM.cdsMovFac.FieldByName('NISATIP').AsString := DMALM.cdsNIS.FieldByName('NISATIP').AsString;
         DMALM.cdsMovFac.FieldByName('NISASOLIC').AsString := Trim(DMALM.cdsNIS.FieldByName('NISASOLIC').AsString);
         DMALM.cdsMovFac.FieldByName('NISAFREG').AsDateTime := DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime;
         DMALM.cdsMovFac.FieldByName('NISANDOC').AsString := DMALM.cdsNIS.FieldByName('NISANDOC').AsString;
         DMALM.cdsMovFac.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsNIS.FieldByName('NISAFDOC').AsDateTime;
         DMALM.cdsMovFac.FieldbyName('KDXUSER').AsString := DMALM.wUsuario;
         DMALM.cdsMovFac.FieldbyName('KDXANO').AsString := DMALM.cdsNIS.FieldByName('NISAANO').AsString;
         DMALM.cdsMovFac.FieldbyName('KDXMM').AsString := DMALM.cdsNIS.FieldByName('NISAMES').AsString;
         DMALM.cdsMovFac.FieldbyName('KDXDD').AsString := DMALM.cdsNIS.FieldByName('NISADIA').AsString;
         DMALM.cdsMovFac.FieldbyName('KDXANOMM').AsString := DMALM.cdsNIS.FieldByName('NISAANOMES').AsString;
         DMALM.cdsMovFac.FieldbyName('KDXTRI').AsString := DMALM.cdsNIS.FieldByName('NISATRIM').AsString;
         DMALM.cdsMovFac.FieldbyName('KDXSEM').AsString := DMALM.cdsNIS.FieldByName('NISASEM').AsString;
         DMALM.cdsMovFac.FieldbyName('KDXSS').AsString := DMALM.cdsNIS.FieldByName('NISASS').AsString;
         DMALM.cdsMovFac.FieldbyName('KDXAATRI').AsString := DMALM.cdsNIS.FieldByName('NISAAATRI').AsString;
         DMALM.cdsMovFac.FieldbyName('KDXAASEM').AsString := DMALM.cdsNIS.FieldByName('NISAAASEM').AsString;
         DMALM.cdsMovFac.FieldbyName('KDXAASS').AsString := DMALM.cdsNIS.FieldByName('NISAAASS').AsString;
         DMALM.cdsMovFac.FieldbyName('KDXFREG').AsDateTime := Date;
         DMALM.cdsMovFac.FieldbyName('KDXHREG').AsDateTime := Date + SysUtils.Time;
         DMALM.cdsMovFac.FieldbyName('CUENTA2ID').AsString := wCUENTA;
         DMALM.cdsMovFac.FieldbyName('KDXCVTAS').AsString := wTRICVTAS;
         DMALM.cdsMovFac.Post;
         pnlDetalleA.Visible := False;
      Except
         On E: Exception Do EHandlerError(E);
      End;
   End;

   Screen.Cursor := crDefault;

   pnLTransf.Visible := False;
End;

Procedure TFRegNtaSAL.bbntnCancelLoteClick(Sender: TObject);
Begin
   pnlLote.visible := False;
End;

Procedure TFRegNtaSAL.bbtnLoteClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'select NISALOTE,NISAFEXP '
      + '     from LOG314 '
      + '    where NISATIP=''INGRESO'' and NISALOTE is not null ';
   DMALM.cdsQry5.filter := '';
   DMALM.cdsQry5.filtered := False;
   DMALM.cdsQry5.IndexFieldNames := '';
   DMALM.cdsQry5.Close;
   DMALM.cdsQry5.DataRequest(xSQL);
   DMALM.cdsQry5.Open;
   DMALM.cdsQry5.IndexFieldNames := 'NISALOTE';

   pnlLote.visible := True;
End;

Procedure TFRegNtaSAL.Z2bbtnTransEquiClick(Sender: TObject);
Var
   sSQL, sWhere: String;
   sCIA, xWhere: String;
   sTmp, UnmUni, UnmGnr: String;
   Uni: Boolean;
   xCont: Integer;

Begin
   If Not wTranfEquiv Then
      Raise exception.Create('No puede Generar la Transferencia de Equivalentes');

   If DMALM.cdsMovFac.recordcount > 0 Then
   Begin
      iEstado := 1;
      sOK := 1
   End
   Else
      If length(DMALM.cdsMovFac.fieldbyname('ARTID').AsString) = 0 Then
         iEstado := 0;

   dbcldArtiDestino.text := DMALM.cdsMovFac.fieldbyname('ARTID').AsString;
   dbeCantGDest.text := DMALM.cdsMovFac.FieldByName('KDXCNTG').AsString;
   dbeCantUDest.text := DMALM.cdsMovFac.FieldByName('KDXCNTU').AsString;

   sWhere := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND TINID=' + quotedstr(dblcTINOri.Text) + ' AND ARTID=' + quotedstr(dbcldArtiDestino.Text);
   DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES, ARTCONT, UNMIDG, UNMIDU', sWhere, 'ARTDES');

   dbeArtiDest.Text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
   Uni := (DMALM.cdsQry.FieldByName('ARTCONT').AsString <> '1');
   UnmGnr := DMALM.cdsQry.FieldByName('UNMIDG').AsString;
   UnmUni := DMALM.cdsQry.FieldByName('UNMIDU').AsString;

   sTmp := 'UNMID=' + quotedstr(UnmGnr);
   lblMedGnrlDest.Caption := 'Med. Gnrl. ' + DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');
   If Uni = True Then
   Begin
      sTmp := 'UNMID=' + quotedstr(UnmUni);
      lblMedUniDest.Caption := 'Med. Uni. ' + DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');
   End;

   dbeCantUDest.Enabled := Uni;

   If DMALM.cdsMovFac.recordCount = 0 Then
      dbcldArtiDestino.Enabled := True
   Else
      dbcldArtiDestino.Enabled := False;

   If DMALM.cdsMovFac.recordCount = 0 Then
   Begin
      sSQL := ' Select ARTID,ARTDES,UNMIDG '
         + '      from TGE205 '
         + '     where CIAID=' + Quotedstr(dblcCIA.text)
         + '       and TINID=' + Quotedstr(dblcTINOri.text)
         + '       and NVL(ARTEST,''A'')=''H'' ';
      DMALM.cdsArti.Close;
      DMALM.cdsArti.ProviderName := 'prvArti';
      DMALM.cdsArti.DataRequest(sSQL);
      DMALM.cdsArti.Open;
      dbcldArtiDestino.LookupTable := DMALM.cdsArti;
      dbcldArtiDestino.LookupField := 'ARTID';

   End;

   pnlTransf.BringToFront;
   pnlTransf.Left := 157;
   pnlTransf.Top := 345;
   pnlTransf.Visible := True;
   If iEstado = 0 Then dbcldArtiDestino.SetFocus;
End;

Procedure TFRegNtaSAL.dbcldArtiDestinoExit(Sender: TObject);
Var
   sWhere, sTmp, UMedG, UMedU, sSQL: String;
   ConUnitaria: Boolean;
Begin
   If bbtnSalirTranf.Focused Then exit;

   sWhere := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND TINID=' + quotedstr(dblcTINOri.Text)
      + ' AND ARTID=' + quotedstr(dbcldArtiDestino.Text);

   DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES, ARTCONT, UNMIDG, UNMIDU, ARTFUC', sWhere, 'ARTDES');
   dbeArtiDest.Text := DMALM.cdsQry.FieldByName('ARTDES').AsString;
   If Length(Trim(dbeArtiDest.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' Artículo No Existe ');
      dbcldArtiDestino.SetFocus;
      Exit;
   End;

   UMedG := DMALM.cdsQry.FieldByName('UNMIDG').AsString;
   UMedU := DMALM.cdsQry.FieldByName('UNMIDU').AsString;

   ConUnitaria := ((DMALM.cdsQry.FieldByName('ARTCONT').AsString) <> '1');
   sTmp := 'UNMID=' + quotedstr(UMedG);
   lblMedGnrlDest.Caption := 'Med. Gnrl. ' + DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');

   If ConUnitaria = True Then
   Begin
      sTmp := 'UNMID=' + quotedstr(UMedU);
      lblMedUniDest.Caption := 'Med. Uni. ' + DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');
   End;

   dbeCantUDest.Enabled := ConUnitaria;
   If ConUnitaria = False Then
   Begin
      dbeCantUDest.Text := '0';
   End;

End;

Procedure TFRegNtaSAL.dbeCantGDestExit(Sender: TObject);
Var
   sSQL, sTIN, sCIA, sALM, sART, sLOC: String;
   Y, M, D: Word;
   fSTK, Contenido: Double;
Begin
   sOK := 0;
   If (bbtnSalirTranf.Focused) Or (Z2bbtnSalir.Focused) Then
      exit;

   If Length(Trim(dbeCantGDest.Text)) = 0 Then
      dbeCantidadG.Text := '0';
   If Length(Trim(dbeCantUDest.Text)) = 0 Then
      dbeCantidadU.Text := '0';

   sOK := 1;

End;

Procedure TFRegNtaSAL.GeneraIngresoTransfEqui();
Var
   sCIA, sALM, sTDA, sTIN, sLOC, sNIS: String;
   sALMs, sTDAs, sLOCs, sNISs, sTINs: String;
   sSQL, sFecha, xWhere: String;
   D, M, Y: Word;
   NISAANO, NISAMES, NISADIA, NISAANOMES, NISATRIM, NISASEM, NISASS, NISAAATRI, NISAAASEM, NISAAASS, NISANOMM: String;
Begin
   xWhere := 'CIAID=''' + dblcCIA.Text + ''' ' +
      '   AND LOCORIID=''' + dblcLOC.Text + ''' ' +
      '   AND TINORIID=''' + dblcTInv.Text + ''' ' +
      '   AND ALMORIID=''' + dblcTALM.Text + ''' ' +
      '   AND TDAORIID=''' + dblcTDA.Text + ''' ' +
      '   AND NISAORIID=''' + dbeNumNISA.Text + ''' ' +
      '   AND NISATIP=''INGRESO''';
   If Length(DMALM.DisplayDescrip('prvTGE', 'LOG314', 'NISAID', xWhere, 'NISAID')) > 0 Then
   Begin
      ErrorMsg(Caption, 'Error, Ya Existe un Transferencia con de esta Nota de Salida');
   End;

   DecodeDate(DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime, Y, M, D);
   sFecha := FormatDateTime(DMALM.wFormatFecha, DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime);

   sSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
   DMALM.FiltraCDS(DMALM.cdsPeriodo, sSQL);

   NISAANO := IntToStr(Y);
   NISAMES := DMALM.strzero(IntToStr(M), 2);
   NISADIA := DMALM.strzero(IntToStr(D), 2);
   NISAANOMES := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);
   NISATRIM := DMALM.cdsPeriodo.fieldbyName('FECTRIM').asString;
   NISASEM := DMALM.cdsPeriodo.fieldbyName('FECSEM').asString;
   NISASS := DMALM.cdsPeriodo.fieldbyName('FECSS').asString;
   NISAAATRI := DMALM.cdsPeriodo.fieldbyName('FECAATRI').asString;
   NISAAASEM := DMALM.cdsPeriodo.fieldbyName('FECAASEM').asString;
   NISAAASS := DMALM.cdsPeriodo.fieldbyName('FECAASS').asString;
   NISANOMM := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);

   If DMALM.cdsNIA.Active = False Then
      DMALM.cdsNIA.Open;
   If DMALM.cdsNIA.State In [dsInsert, dsEdit] Then DMALM.cdsNIA.Cancel;

   DMALM.cdsNIA.Insert;
   sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := dblcLOCOri.Text;
   sALM := dblcTALMOri.Text;
   sTIN := dblcTINOri.Text;
   sTDA := wTRITDODES;
// Inicio HPC_201504_ALM
   //  Se cambia la llave de numeración a CIA+ALMACEN+TIPO+Nro.Nota
   // sNIS := DMALM.StrZero(DMALM.MaxNIA(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoIng);
   sNIS := DMALM.StrZero(DMALM.MaxNIA(sCIA, sALM), wAnchoIng);
// Fin HPC_201504_ALM
   DMALM.cdsNIA.FieldByName('CIAID').AsString := sCIA;
   DMALM.cdsNIA.FieldByName('LOCID').AsString := sLOC;
   DMALM.cdsNIA.FieldByName('TINID').AsString := sTIN;
   DMALM.cdsNIA.FieldByName('ALMID').AsString := sALM;
   DMALM.cdsNIA.FieldByName('TDAID').AsString := sTDA;
   DMALM.cdsNIA.FieldByName('NISAID').AsString := sNIS;

   DMALM.cdsNIA.FieldByName('TRIID').AsString := wTRITRDES;
   DMALM.cdsNIA.FieldByName('LOCORIID').AsString := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   DMALM.cdsNIA.FieldByName('TINORIID').AsString := DMALM.cdsNIS.FieldByName('TINID').AsString;
   DMALM.cdsNIA.FieldByName('ALMORIID').AsString := DMALM.cdsNIS.FieldByName('ALMID').AsString;
   DMALM.cdsNIA.FieldByName('TDAORIID').AsString := DMALM.cdsNIS.FieldByName('TDAID').AsString;
   DMALM.cdsNIA.FieldByName('NISAORIID').AsString := DMALM.cdsNIS.FieldByName('NISAID').AsString;
   DMALM.cdsNIA.FieldByName('CCOSID').AsString := DMALM.cdsNIS.FieldByName('CCOSID').AsString;
   DMALM.cdsNIA.FieldbyName('NISATIP').AsString := 'INGRESO';
   DMALM.cdsNIA.FieldByName('NISSIT').AsString := 'INICIAL';
   DMALM.cdsNIA.FieldByName('DOCID').AsString := DMALM.cdsNIS.FieldByName('DOCID').AsString;
   DMALM.cdsNIA.FieldByName('NISANDOC').AsString := DMALM.cdsNIS.FieldByName('NISANDOC').AsString;
   DMALM.cdsNIA.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsNIS.FieldByName('NISAFDOC').AsDateTime;
   DMALM.cdsNIA.FieldbyName('NISAUSER').AsString := DMALM.wUsuario;
   DMALM.cdsNIA.FieldByName('ODCID').AsString := 'N';
   DMALM.cdsNIA.FieldbyName('NISAOBS').AsString := 'TRANSFERIDO DESDE ' + Uppercase(dbeALM.Text) + '      Nº Nota Salida  ' + DMALM.cdsNIS.FieldByName('NISAID').AsString;

   DMALM.cdsNIA.FieldbyName('NISAANO').AsString := NISAANO;
   DMALM.cdsNIA.FieldbyName('NISAMES').AsString := NISAMES;
   DMALM.cdsNIA.FieldbyName('NISADIA').AsString := NISADIA;
   DMALM.cdsNIA.FieldbyName('NISAANOMES').AsString := NISAANOMES;
   DMALM.cdsNIA.FieldbyName('NISATRIM').AsString := NISATRIM;
   DMALM.cdsNIA.FieldbyName('NISASEM').AsString := NISASEM;
   DMALM.cdsNIA.FieldbyName('NISASS').AsString := NISASS;
   DMALM.cdsNIA.FieldbyName('NISAAATRI').AsString := NISAAATRI;
   DMALM.cdsNIA.FieldbyName('NISAAASEM').AsString := NISAAASEM;
   DMALM.cdsNIA.FieldbyName('NISAAASS').AsString := NISAAASS;
   DMALM.cdsNIA.FieldbyName('NISANOMM').AsString := NISANOMM;
   DMALM.cdsNIA.FieldByName('NISAFREG').AsDateTime := DMALM.cdsNIS.FieldByName('NISAFDOC').AsDateTime;
   DMALM.cdsNIA.FieldbyName('NISAHREG').AsDateTime := Date + SysUtils.Time;

   DMALM.cdsNIA.Post;

   Try
      xSQL := ' Insert into LOG314( CIAID, LOCID, TINID, ALMID, TDAID, NISAID, NISATIP, CCOSID, TRIID, '
         + '                        NISAFREG,NISSIT,DOCID,NISANDOC,NISAFDOC,NISANOMM,NISAOBS,NISAUSER,NISAHREG, '
         + '                        NISAANO, NISAMES, NISADIA, NISATRIM, NISASEM, NISAANOMES, NISASS, NISAAATRI, NISAAASEM, NISAAASS, '
         + '                        ALMORIID,TINORIID,LOCORIID,TDAORIID,NISAORIID,ODCID ) '
         + '    Values( '
         + quotedstr(sCIA) + ', '
         + quotedstr(sLOC) + ', '
         + quotedstr(sTIN) + ', '
         + quotedstr(sALM) + ', '
         + quotedstr(sTDA) + ', '
         + quotedstr(sNIS) + ', '
         + quotedstr('INGRESO') + ', '
         + quotedstr(DMALM.cdsNIS.fieldbyname('CCOSID').AsString) + ', '
         + quotedstr(wTRITRDES) + ', '
         + '           TRUNC(sysdate), '
         + quotedstr('INICIAL') + ', '
         + quotedstr(DMALM.cdsNIS.fieldbyname('DOCID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.fieldbyname('NISANDOC').AsString) + ', '
         + quotedstr(datetostr(DMALM.cdsNIS.fieldbyname('NISAFDOC').AsDateTime)) + ', '
         + quotedstr(DMALM.cdsNIS.fieldbyname('NISANOMM').AsString) + ', '
         + quotedstr('TRANSFERIDO DESDE ' + Uppercase(dbeALM.Text) + '      Nº Nota Salida  ' + DMALM.cdsNIS.FieldByName('NISAID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.fieldbyname('NISAUSER').AsString) + ', '
         + '           sysdate, '
         + quotedstr(NISAANO) + ', '
         + quotedstr(NISAMES) + ', '
         + quotedstr(NISADIA) + ', '
         + quotedstr(NISATRIM) + ', '
         + quotedstr(NISASEM) + ', '
         + quotedstr(NISAANOMES) + ', '
         + quotedstr(NISASS) + ', '
         + quotedstr(NISAAATRI) + ', '
         + quotedstr(NISAAASEM) + ', '
         + quotedstr(NISAAASS) + ', '
         + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.FieldByName('TINID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.FieldByName('LOCID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.FieldByName('TDAID').AsString) + ', '
         + quotedstr(DMALM.cdsNIS.FieldByName('NISAID').AsString) + ', '
         + quotedstr('N') + ')';
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al Insertar Datos en la Cabecera de la Nota de Ingreso por Transferencia');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   sLOCs := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   sTINs := DMALM.cdsNIS.FieldByName('TINID').AsString;
   sALMs := DMALM.cdsNIS.FieldByName('ALMID').AsString;
   sTDAs := DMALM.cdsNIS.FieldByName('TDAID').AsString;
   sNISs := DMALM.cdsNIS.FieldByName('NISAID').AsString;

   sSQL := 'Insert into LOG315 '
      + '      (CIAID, LOCID, ALMID, TINID, TDAID, NISAID, TRIID, DOCID, NISAFDOC, '
      + '       KDXID, NISATIP, NISSIT, ARTID, GRARID, FAMID, SFAMID, ARTCONT, UNMIDG, '
      + '       UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA, '
      + '       ARTPCU, ARTPCG, ARTMORIPCG, ARTMORIPCU,  ARTPVU, '
      + '       ARTPVG, ARTFUC, TMONID, ARTCRGO, ARTACTIVO, '
      + '       CUENTAID, NISANDOC, CCOSID, ARTDES, '
      + '       NISAFREG, KDXPEDIDOG, KDXPEDIDOU, KDXCNTG, KDXCNTU, KDXSALDOG, KDXSALDOU, '
      + '       KDXUSER, KDXFREG, KDXHREG, KDXANO, KDXMM, '
      + '       KDXDD, KDXTRI, KDXSEM, KDXSS, KDXANOMM, KDXAATRI, KDXAASEM, KDXAASS, '
      + '       FLAGVAR, CALID) '
      + '   Select '
      + quotedstr(sCIA) + ','
      + quotedstr(sLOC) + ','
      + quotedstr(sALM) + ','
      + quotedstr(sTIN) + ','
      + quotedstr(sTDA) + ','
      + quotedstr(sNIS) + ','
      + quotedstr(wtritrdes) + ','
      + '          DOCID, NISAFDOC, KDXID, ''INGRESO'', ''INICIAL'', ARTID, GRARID, '
      + '          FAMID, SFAMID, ARTCONT, UNMIDG, UNMIDU, FABID, ARTSPRO, ARTSCA, '
      + '          ARTPARA, ARTSNA, ARTPCU, ARTPCG, ARTPCG, ARTPCU, ARTPVU, ARTPVG, '
      + '          ARTFUC, TMONID, ARTCRGO, ARTACTIVO, CUENTAID, NISANDOC, CCOSID, '
      + '          ARTDES, NISAFREG, 0, 0, KDXCNTG, KDXCNTU, 0, 0, '
      + quotedstr(DMALM.wUsuario) + ','
      + '          KDXFREG, KDXHREG, '
      + quotedstr(NISAANO) + ','
      + quotedstr(NISAMES) + ','
      + quotedstr(NISADIA) + ','
      + quotedstr(NISATRIM) + ','
      + quotedstr(NISASEM) + ','
      + quotedstr(NISASS) + ','
      + quotedstr(NISAANOMES) + ','
      + quotedstr(NISAAATRI) + ','
      + quotedstr(NISAAASEM) + ','
      + quotedstr(NISAAASS) + ','
      + '          FLAGVAR, CALID '
      + '     from LOG315 '
      + '    where CIAID = ' + quotedstr(sCIA)
      + '      and LOCID = ' + quotedstr(DMALM.cdsNIS.FieldByName('LOCORIID').AsString)
      + '      and TINID = ' + quotedstr(DMALM.cdsNIS.FieldByName('TINORIID').AsString)
      + '      and ALMID = ' + quotedstr(DMALM.cdsNIS.FieldByName('ALMORIID').AsString)
      + '      and TDAID = ' + quotedstr(sTDAs)
      + '      and NISAID= ' + quotedstr(sNISs);
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
   Except
      ShowMessage('Error  al Insertar Datos de Detalle de la Nota de Ingreso por Transferencia');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   sSQL := 'Update LOG314 '
      + '      set NISAORIID = ' + quotedstr(sNIS) + ','
      + '          TDAORIID = ' + quotedstr(wTRITDODES) + ','
      + '    where CIAID = ' + quotedstr(sCIA)
      + '      and LOCID = ' + quotedstr(sLOCs)
      + '      and TINID = ' + quotedstr(sTINs)
      + '      and ALMID = ' + quotedstr(sALMs)
      + '      and TDAID = ' + quotedstr(sTDAs)
      + '      and NISAID= ' + quotedstr(sNISs)
      + '      and NISATIP=''SALIDA'' ';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
   Except
      ShowMessage('Error al Actualiza Datos de Cabecera de la Nota de Ingreso por Transferencia');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   sSQL := 'Delete FROM LOG315 '
      + '    where CIAID = ' + quotedstr(sCIA)
      + '      and LOCID = ' + quotedstr(DMALM.cdsNIS.FieldByName('LOCORIID').AsString)
      + '      and TINID = ' + quotedstr(DMALM.cdsNIS.FieldByName('TINORIID').AsString)
      + '      and ALMID = ' + quotedstr(DMALM.cdsNIS.FieldByName('ALMORIID').AsString)
      + '      and TDAID = ' + quotedstr(sTDAs)
      + '      and NISATIP = ' + quotedstr('INGRESO')
      + '      and NISAID= ' + quotedstr(sNISs);
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
   Except
      ShowMessage('Error al hacer un DELETE Del Detalle de la Nota de Ingreso por Transferencia');
      DMALM.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;
End;

Function TFRegNtaSAL.VerificaNumerodeSerie: boolean;
Var
   sSQL: String;
   BSerie: Boolean;
   i: integer;
Begin
   BSerie := False;
   sSQL := ' Select * '
      + '      from LOG332 '
      + '     where CIAID=' + QuotedStr(dblcCIA.text)
      + '       and ALMID=' + QuotedStr(dblcTALM.text)
      + '       and TDAID2=' + QuotedStr(DMALM.cdsNIS.FieldByName('TDAID').AsString)
      + '       and NFAC=' + QuotedStr(DMALM.cdsNIS.FieldByName('NISAID').AsString);
   DMALM.cdsKDXSerie.Close;
   DMALM.cdsKDXSerie.DataRequest(sSQL);
   DMALM.cdsKDXSerie.Open;
   DMALM.cdsKDXSerie.IndexFieldNames := 'CIAID;ALMID;ARTID;TDAID2;NFAC';

   dbgGridSerie.Selected.Clear;
   dbgGridSerie.Selected.Add('CODBAR'#9'6'#9'Código de Barra'#9'T');
   dbgGridSerie.Selected.Add('ARTID'#9'10'#9'Código~Artículo'#9'T');
   dbgGridSerie.Selected.Add('ARTDES'#9'30'#9'Descripción~Artículo'#9'T');
   dbgGridSerie.Selected.Add('ACFSERIE'#9'20'#9'Serie'#9'F');
   dbgGridSerie.Selected.Add('MARCA'#9'20'#9'Marca'#9'T');
   dbgGridSerie.Selected.Add('MODELO'#9'20'#9'Modelo'#9'T');
   dbgGridSerie.Selected.Add('COLOR'#9'20'#9'Color'#9'T');
   dbgGridSerie.Selected.Add('DOCID'#9'3'#9'T.Doc.'#9'T');
   dbgGridSerie.Selected.Add('FACSERIE'#9'3'#9'Serie'#9'T');
   dbgGridSerie.Selected.Add('NFAC'#9'10'#9'Documento'#9'T');
   dbgGridSerie.Selected.Add('TDAID2'#9'3'#9'Doc.~Alm.'#9'T');
   dbgGridSerie.RedrawGrid;

   If DMALM.cdsKDXNSal.RecordCount > 0 Then
   Begin
      DMALM.cdsKDXNSal.DisableControls;
      DMALM.cdsKDXNSal.First;
      While Not DMALM.cdsKDXNSal.EOF Do
      Begin
         DMALM.cdsKDXSerie.Filter := '';
         DMALM.cdsKDXSerie.Filtered := False;

         DMALM.cdsKDXSerie.SetKey;
         DMALM.cdsKDXSerie.FieldByName('CIAID').AsString := dblcCIA.text;
         DMALM.cdsKDXSerie.FieldByName('ALMID').AsString := dblcTALM.text;
         DMALM.cdsKDXSerie.FieldByName('TDAID2').AsString := DMALM.cdsNIS.FieldByName('TDAID').AsString;
         DMALM.cdsKDXSerie.FieldByName('NFAC').AsString := DMALM.cdsNIS.FieldByName('NISAID').AsString;
         DMALM.cdsKDXSerie.FieldByName('ARTID').AsString := DMALM.cdsKDXNSal.FieldByName('ARTID').AsString;
         If (DMALM.cdsKDXSerie.GotoKey) And (DMALM.DisplayDescrip('prvTGE', 'TGE205', 'FNSERIE', 'CIAID=' + QuotedStr(dblcCIA.text) +
            ' AND ARTID=' + QuotedStr(DMALM.cdsKDXNSal.FieldByName('ARTID').AsString), 'FNSERIE') = 'S') Then
         Begin
            DMALM.cdsKDXSerie.Filter :=
               '       CIAID=' + QuotedStr(dblcCIA.text)
               + ' and ALMID=' + QuotedStr(dblcTALM.text)
               + ' and TDAID2=' + QuotedStr(DMALM.cdsNIS.FieldByName('TDAID').AsString)
               + ' and NFAC=' + QuotedStr(DMALM.cdsNIS.FieldByName('NISAID').AsString)
               + ' and ARTID=' + QuotedStr(DMALM.cdsKDXNSal.FieldByName('ARTID').AsString);
            DMALM.cdsKDXSerie.Filtered := True;
            DMALM.cdsKDXSerie.First;
            While Not DMALM.cdsKDXSerie.EOF Do
            Begin
               If Length(DMALM.cdsKDXSerie.FieldByName('ACFSERIE').AsString) <= 0 Then
               Begin
                  BSerie := True;
                  DMALM.cdsKDXSerie.Last;
                  DMALM.cdsKDXNSal.Last;
                  DMALM.cdsKDXSerie.Filter := '';
                  DMALM.cdsKDXSerie.Filtered := False;
                  DMALM.cdsKDXNSal.EnableControls;
               End;
               If BSerie Then
                  DMALM.cdsKDXSerie.Last
               Else
                  DMALM.cdsKDXSerie.Next;
            End;
            If BSerie Then
               DMALM.cdsKDXNSal.Last
            Else
               DMALM.cdsKDXNSal.Next;
         End
         Else
         Begin
            If (Not DMALM.cdsKDXSerie.GotoKey) And (DMALM.DisplayDescrip('prvTGE', 'TGE205', 'FNSERIE', 'CIAID=' + QuotedStr(dblcCIA.text) +
               ' AND ARTID=' + QuotedStr(DMALM.cdsKDXNSal.FieldByName('ARTID').AsString), 'FNSERIE') = 'S') Then
            Begin
               BSerie := True;
            End;
            If BSerie Then
               DMALM.cdsKDXNSal.Last
            Else
               DMALM.cdsKDXNSal.Next;
         End;
      End;
      DMALM.cdsKDXSerie.Filter := '';
      DMALM.cdsKDXSerie.Filtered := False;
      DMALM.cdsKDXNSal.EnableControls;
   End;
   result := BSerie;
End;

Procedure TFRegNtaSAL.bbtnKDXSerieClick(Sender: TObject);
Var
   sSQL: String;
Begin
   pnlKDXSerie.BringToFront;
   pnlKDXSerie.Left := 72;
   pnlKDXSerie.Top := 214;
   sSQL := ' Select * '
      + '      from LOG332 '
      + '     where CIAID=' + QuotedStr(dblcCia.text)
      + '       and ALMID=' + QuotedStr(dblcTALM.text)
      + '       and ARTID=' + QuotedStr(dbcldArti.text);
   DMALM.cdsKDXSerie.Close;
   DMALM.cdsKDXSerie.DataRequest(sSQL);
   DMALM.cdsKDXSerie.Open;
   DMALM.cdsKDXSerie.IndexFieldNames := 'ARTID;DOCID';

   dbgGridSerie.Selected.Clear;
   dbgGridSerie.Selected.Add('CODBAR'#9'6'#9'Código de Barra'#9'T');
   dbgGridSerie.Selected.Add('ACFSERIE'#9'20'#9'Serie'#9'T');
   dbgGridSerie.Selected.Add('ENTREGADO'#9'1'#9'Seleccionado'#9'F');
   dbgGridSerie.Selected.Add('MARCA'#9'10'#9'Marca'#9'T');
   dbgGridSerie.Selected.Add('MODELO'#9'10'#9'Modelo'#9'T');
   dbgGridSerie.Selected.Add('COLOR'#9'10'#9'Color'#9'T');
   dbgGridSerie.Selected.Add('DOCID'#9'3'#9'T.Doc.'#9'T');
   dbgGridSerie.Selected.Add('FACSERIE'#9'3'#9'Serie'#9'T');
   dbgGridSerie.Selected.Add('NFAC'#9'10'#9'Documento'#9'T');
   dbgGridSerie.Selected.Add('TDAID2'#9'3'#9'Doc.~Alm.'#9'T');
   dbgGridSerie.RedrawGrid;

   If DMALM.cdsKDXSerie.RecordCount > 0 Then
   Begin
      lblCodigo.caption := dbcldArti.text;
      lblDescripcion.caption := dbeArti.text;
      pnlKDXSerie.visible := True;
   End
   Else
   Begin
      ShowMessage('No existen registros a mostrar')
   End;
End;

Procedure TFRegNtaSAL.bbtnOKKDXSerieClick(Sender: TObject);
Var
   sCondicion, sGlosa, xSQL: String;
Begin
   If DMALM.cdsKDXSerie.state In [dsEdit] Then
   Begin
      DMALM.cdsKDXSerie.Post;
   End;

   sCondicion :=
      '       ARTID=' + QuotedStr(lblCodigo.caption)
      + ' and ENTREGADO=' + QuotedStr('S')
      + ' and TDAID2=' + QuotedStr(dblcTDA.text)
      + ' and NFAC=' + QuotedStr(dbeNumNISA.text);
   If DMALM.CountFor(DMALM.cdsKDXSerie, sCondicion) > StrToInt(dbePedidoG.text) Then
   Begin
      Raise Exception.Create('Debe Seleccionar ' + dbePedidoG.text + ' artículos. ');
   End
   Else
   Begin
      If DMALM.CountFor(DMALM.cdsKDXSerie, sCondicion) < StrToInt(dbePedidoG.text) Then
      Begin
         Raise Exception.Create('Debe Seleccionar ' + dbePedidoG.text + ' artículos. ');
      End
      Else
      Begin
         DMALM.DCOM1.AppServer.IniciaTransaccion;
         DMALM.cdsKDXSerie.First;
         While Not DMALM.cdsKDXSerie.Eof Do
         Begin
            If DMALM.cdsKDXSerie.FieldByName('ENTREGADO').AsString = 'S' Then
            Begin
               xSQL := 'Update LOG332 '
                  + '      Set TDAID2=' + quotedstr(DMALM.cdsKDXSerie.FieldByName('TDAID2').AsString) + ','
                  + '          NFAC=' + quotedstr(DMALM.cdsKDXSerie.FieldByName('NFAC').AsString) + ','
                  + '          ENTREGADO=''S'' '
                  + '     where CIAID=' + QuotedStr(dblcCIA.text)
                  + '       and LOCID=' + QuotedStr(dblcLOC.text)
                  + '       and TINID=' + QuotedStr(dblcTInv.text)
                  + '       and ALMID=' + QuotedStr(dblcTALM.text)
                  + '       and ARTID=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('ARTID').AsString)
                  + '       and NISAID=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('NISAID').AsString)
                  + '       and ITEM=' + InttoStr(DMALM.cdsKDXSerie.FieldByName('ITEM').AsInteger);
               Try
                  DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  ShowMessage('No se pudo actualizar la tabla de Series');
                  DMALM.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            End;
            DMALM.cdsKDXSerie.Next;
         End;
         DMALM.DCOM1.AppServer.GrabaTransaccion;
      End;
   End;
End;

Procedure TFRegNtaSAL.VerificaNumeroSerie;
Var
   sSQL: String;
Begin
   sSQL := ' Select * '
      + '      from LOG332 '
      + '     where CIAID=' + QuotedStr(dblcCia.text)
      + '       and ARTID=' + QuotedStr(dbcldArti.text)
      + '       and ENTREGADO=' + QuotedStr('S')
      + '       and TDAID2=' + QuotedStr(dblcTDA.text)
      + '       and NFAC=' + QuotedStr(dbeNumNISA.text);
   DMALM.cdsQry.close;
   DMALM.cdsQry.DataRequest(sSQL);
   DMALM.cdsQry.Open;
   If DMALM.cdsQry.RecordCount <> StrToInt(dbePedidoG.text) Then
      Raise Exception.Create('Falta Registrar Número de Serie');
End;

Procedure TFRegNtaSAL.dbgGridSerieFieldChanged(Sender: TObject;
   Field: TField);
Begin
   If Field.FieldName = 'ENTREGADO' Then
   Begin
      If DMALM.cdsKDXSerie.FieldByName('ENTREGADO').AsString = 'S' Then
      Begin
         DMALM.cdsKDXSerie.FieldByName('TDAID2').AsString := dblcTDA.text;
         DMALM.cdsKDXSerie.FieldByName('NFAC').AsString := dbeNumNISA.text;
      End
      Else
      Begin
         If (DMALM.cdsKDXSerie.FieldByName('TDAID2').AsString = dblcTDA.text) And
            (DMALM.cdsKDXSerie.FieldByName('NFAC').AsString = dbeNumNISA.text) Then
         Begin
            DMALM.cdsKDXSerie.FieldByName('TDAID2').AsString := '';
            DMALM.cdsKDXSerie.FieldByName('NFAC').AsString := '';
         End
         Else
         Begin
            DMALM.cdsKDXSerie.Cancel;
         End;
      End;
   End;
End;

Procedure TFRegNtaSAL.bbtnCancelKDXSerieClick(Sender: TObject);
Begin
   DMALM.cdsKDXSerie.Cancel;
   pnlKDXSerie.Visible := False;
End;

Procedure TFRegNtaSAL.ValidaFechaEnAlmacenDestino;
Var
   sSQL: String;
Begin
   If dblcTALM.Text <> '' Then
   Begin
      sSQL := 'Select * '
         + '     from LOG317 '
         + '    where LOG317.CIAID=' + QUOTEDSTR(dblcCIA.Text)
         + '      and LOG317.LOCID=' + QUOTEDSTR(dblcLOC.Text)
         + '      and LOG317.ALMID=' + QUOTEDSTR(dblcTALMOri.Text)
         + '      and LOG317.TINID=' + QUOTEDSTR(dblcTInv.Text)
         + '    order by CIAID, LOCID, TINID, ALMID, CNSULTCIE';
      DMALM.cdsCIERRE.Close;
      DMALM.cdsCIERRE.DataRequest(sSQL);
      DMALM.cdsCIERRE.Open;
      If DMALM.cdsCIERRE.RecordCount < 1 Then
      Begin
         ErrorMsg('Error', ' No Existe Frecuencia de Cierre en el Otro Almacén');
         vValida := True;
         exit;
      End
      Else
      Begin
         If (dblcTALMOri.Text <> '') Then
         Begin
            DMALM.cdsCierre.Last;
            NuevaFecha;
         End;
      End;
   End;
End;

Procedure TFRegNtaSAL.NuevaFechaEnAlmacenDestino;
Begin
End;

Procedure TFRegNtaSAL.FormShow(Sender: TObject);
Var
   xsql, ssql: String;
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
   If DMALM.wModo = 'A' Then
      wOperacion := 'ADD'
   Else
      If DMALM.wModo = 'M' Then
         wOperacion := 'MOD';

   dblcdTDOC.Enabled := True;
   dbeSerie.Enabled := True;
   dbeNDoc.Enabled := True;
   dblcdCC.Enabled := True;

   wFlagCCosto := False;
   wFlagProveedor := False;
   wTipoMov := False;
   wFlagCliente := False;
   wEsConcumo := False;
   wTranfEquiv := False;
   COSREPO := False;
   bActUrq := False;

   wCuenta := '';
   wTricvtas := '';
   wTritdodes := '';
   wtritrdes := '';
   wGenTraAlm := False;
   wGenTraEqui := False;

   xCrea := true;
   xNSalElim := '';
   pnlDetalleA.Visible := False;

   dbeCIA.Text := '';
   dbeLOC.Text := '';
   dbeTinv.Text := '';
   dbeALM.Text := '';
   dbeTDNISA.Text := '';
   dbeTransac.Text := '';
   dbeLOCOri.Text := '';
   dbeALMOri.Text := '';
   dbeCC.Text := '';
   dbeProv.Text := '';
   dbeClie.Text := '';
   dbeDOCS.Text := '';
   wCuenta := '';
   wTricvtas := '';
   wTritdodes := '';
   wtritrdes := '';
   bbtnLote.visible := (DMALM.wLote = 'S');
   dbeNumNISA.Text := '';

   If wOperacion = 'ADD' Then
   Begin
      lblEstado.Caption := 'INICIAL';
      DMALM.cdsNIS.FieldByName('NISSIT').AsString := 'INICIAL';
      DMALM.cdsNIS.FieldByName('NISATIP').AsString := 'SALIDA';

      DMALM.cdsNis.FieldByName('CIAID').AsString := xCia;
      DMALM.cdsNis.FieldByName('LOCID').AsString := xLoc;
      DMALM.cdsNis.FieldByName('TINID').AsString := xTin;
      DMALM.cdsNis.FieldByName('ALMID').AsString := xAlm;
      DMALM.cdsNis.FieldByName('NISAID').AsString := '';
   End;

   If (DMALM.cdsNis.FieldByName('NISSIT').AsString = 'ACEPTADO') Or
      (DMALM.cdsNis.FieldByName('NISSIT').AsString = 'ANULADO') Then
   Begin
      OnOffCabecera(False); //Activar la cabecera
      OnOffDetalle(True); //Desactivar el panel de detalle
      Z2dbgDReqsIButton.Enabled := False;
      dblcTransac.OnExit(dblcTransac);
   End
   Else
   Begin
      Init(Sender);
      Z2dbgDReqsIButton.Enabled := True;
   End;

   vvalida := false; {por defecto}

   If DMALM.cdsNIS.State = dsEdit Then
   Begin
      ssql := 'TDAID=' + quotedstr(dblcTDA.text);
      dbeTDNISA.Text := DMALM.DisplayDescrip('prvTGE', 'TGE157', 'TDADES', ssql, 'TDADES');
      dblcTransac.Enabled := False;
   // Transferencia
      If wGenTraAlm Then
      Begin
         ssql := 'TINID=' + quotedstr(dblcTINOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
         dbeTINOri.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', ssql, 'TINDES');
         ssql := 'LOCID=' + quotedstr(dblcLOCOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
         dbeLOCOri.Text := DMALM.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', ssql, 'LOCDES');
         ssql := 'LOCID=' + quotedstr(dblcLOCOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALMOri.text) + ' AND TINID=' + quotedstr(dblcTINOri.text);
         dbeALMOri.Text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', ssql, 'ALMDES');

         dblcdTDOC.Enabled := False;
         dbeSerie.Enabled := False;
         dbeNDoc.Enabled := False;
         dblcdCC.Enabled := False;
      End;

      If wGenTraEqui Then
      Begin
         ssql := 'TINID=' + quotedstr(dblcTINOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
         dbeTINOri.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', ssql, 'TINDES');
         ssql := 'LOCID=' + quotedstr(dblcLOCOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
         dbeLOCOri.Text := DMALM.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', ssql, 'LOCDES');
         ssql := 'LOCID=' + quotedstr(dblcLOCOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALMOri.text) + ' AND TINID=' + quotedstr(dblcTINOri.text);
         dbeALMOri.Text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', ssql, 'ALMDES');

         dblcdTDOC.Enabled := False;
         dbeSerie.Enabled := False;
         dbeNDoc.Enabled := False;
         dblcdCC.Enabled := False;
      End;

      ssql := 'CCOSID=' + quotedstr(DMALM.cdsNIS.fieldbyname('CCOSID').AsString);
      dbeCC.Text := DMALM.DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', ssql, 'CCOSDES');
      If wFlagCliente Then
      Begin
         sSQL := 'CLIEID=' + quotedstr(dblcdClie.text);
         dbeClie.Text := DMALM.DisplayDescrip('prvTGE', 'TGE204', 'CLIEDES', ssql, 'CLIEDES');
      End;
      If wFlagProveedor Then
      Begin
         dblcdProv.text := DMALM.cdsNis.FieldByName('PROV').AsString;
         sSQL := 'PROV=' + quotedstr(dblcdProv.text);
         dbeProv.Text := DMALM.DisplayDescrip('prvTGE', 'TGE201', 'PROVDES', ssql, 'PROVDES');
      End;

      ssql := 'DOCID=' + quotedstr(dblcdTDOC.text);
      dbeDOCS.Text := DMALM.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', ssql, 'DOCDES');
   End
   Else
      If DMALM.cdsNIS.State = dsInsert Then
      Begin
         dblcTransac.Enabled := True;
      End;

// Si está en Estado INICIAL, se inicializa Fecha con la Fecha del Sistema
   If DMALM.cdsNis.FieldByName('NISSIT').AsString = 'INICIAL' Then
   Begin
      DMALM.cdsNis.FieldByName('NISAFREG').AsDateTime := DateS;
      dbdtpFNS.Date := DateS;
   End;

   xCrea := false;
   If xCCosto = 1 Then
   Begin
      Z2bbtnOK.Enabled := False;
      Z2bbtnGraba.Enabled := False;
      Z2bbtnAceptar.Enabled := False;
      Z2bbtnNuevo.Enabled := False;
      Z2bbtnCanc2.Enabled := False;
   End;

   dblcCIAExit(Nil);
   dblcLOCExit(Nil);
   dblcTINvExit(Nil);
   dblcTALMExit(Nil);
End;

Procedure TFRegNtaSAL.dblcdNroLoteExit(Sender: TObject);
Begin
   If DMALM.cdsNIS.State = dsBrowse Then
      DMALM.cdsNIS.Edit;
   DMALM.cdsNIS.FieldByName('NISAFEXP').AsDateTime := DMALM.cdsQry5.FieldByName('NISAFEXP').AsDateTime;
End;

{
Procedure TFRegNtaSAL.Z2bbtnCeroClick(Sender: TObject);
Var
   nCont: Integer;
   xSQL: String;
Begin
   CalculaStock;

   Screen.Cursor := crHourGlass;
   nCont := 0;
   DMALM.cdsReporte.First;

   DMALM.DCOM1.AppServer.IniciaTransaccion;
   While Not DMALM.cdsReporte.Eof Do
   Begin
     // insertar detalle de Nota de Salida
      nCont := nCont + 1;
      InsertaDetalle(nCont);

      xSQL := 'Insert into LOG315(KDXID, CIAID, LOCID, TINID, ALMID, TDAID, ARTID, KDXFREG, '
         + '                      KDXPEDIDOG, KDXPEDIDOU, KDXCNTG, KDXCNTU, SITUACION, NISAATERQS, '
         + '                      KDXSALDOG, KDXSALDOU, ARTDES, FAMID, SFAMID, GRARID, ARTCONT, '
         + '                      UNMIDG, UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA, ARTPCU, '
         + '                      ARTPCG, ARTMORIPCU, ARTMORIPCG, COSREPO, ARTPVU, ARTPVG, ARTFUC, '
         + '                      TMONID, ARTCRGO, ARTACTIVO, CUENTAID, NISSIT, ARTTOTALG, ARTTOTALU, '
         + '                      ARTTOTAL, PROV, DOCID, TRIID, CCOSID, ODCID, NISAID, NISATIP, '
         + '                      NISASOLIC, NISAFREG, NISANDOC, NISAFDOC, KDXUSER, KDXANO, KDXMM, '
         + '                      KDXDD, KDXANOMM, KDXTRI, KDXSEM, KDXSS, KDXAATRI, KDXAASEM, KDXAASS, '
         + '                      KDXFREG, KDXHREG, CUENTA2ID, KDXCVTAS) '
         + '   values ('
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('KDXID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('CIAID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('LOCID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('TINID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ALMID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('TDAID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTID').AsString) + ','
         + quotedstr(datetostr(DMALM.cdsKDXNSal.FieldByName('KDXFREG').AsDateTime)) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('KDXPEDIDOG').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('KDXPEDIDOU').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('KDXCNTG').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('KDXCNTU').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('SITUACION').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('NISAATERQS').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('KDXSALDOG').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('KDXSALDOU').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTDES').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('FAMID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('SFAMID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('GRARID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTCONT').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('UNMIDG').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('UNMIDU').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('FABID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTSPRO').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTSCA').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTPARA').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTSNA').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTPCU').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTPCG').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTMORIPCU').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTMORIPCG').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('COSREPO').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTPVU').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTPVG').AsString) + ','
         + quotedstr(datetostr(DMALM.cdsKDXNSal.FieldByName('ARTFUC').AsDateTime)) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('TMONID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTCRGO').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ARTACTIVO').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('CUENTAID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('NISSIT').AsString) + ','
         + floattostr(DMALM.cdsKDXNSal.FieldByName('ARTTOTALG').AsFloat) + ','
         + floattostr(DMALM.cdsKDXNSal.FieldByName('ARTTOTALU').AsFloat) + ','
         + floattostr(DMALM.cdsKDXNSal.FieldByName('ARTTOTAL').AsFloat) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('PROV').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('DOCID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('TRIID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('CCOSID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('ODCID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('NISAID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('NISATIP').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('NISASOLIC').AsString) + ','
         + quotedstr(datetostr(DMALM.cdsKDXNSal.FieldByName('NISAFREG').AsDateTime)) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldByName('NISANDOC').AsString) + ','
         + quotedstr(datetostr(DMALM.cdsKDXNSal.FieldByName('NISAFDOC').AsDateTime)) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXUSER').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXANO').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXMM').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXDD').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXANOMM').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXTRI').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXSEM').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXSS').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXAATRI').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXAASEM').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXAASS').AsString) + ','
         + quotedstr(datetostr(DMALM.cdsKDXNSal.FieldbyName('KDXFREG').AsDateTime)) + ','
         + quotedstr(datetostr(DMALM.cdsKDXNSal.FieldbyName('KDXHREG').AsDateTime)) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('CUENTA2ID').AsString) + ','
         + quotedstr(DMALM.cdsKDXNSal.FieldbyName('KDXCVTAS').AsString) + ')';
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al actualizar detalle');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
      DMALM.cdsReporte.Next;
   End;
   DMALM.DCOM1.AppServer.GrabaTransaccion;

   Z2bbtnGraba.Enabled := true;
   Screen.Cursor := crDefault;
End;


Procedure TFRegNtaSAL.CalculaStock;
Var
   xSQL, xDia, xMes, xMAn, xAno, sHasta: String;
   D, M, Y: Word;
   x10: Integer;
   CCont: Double;
Begin
   Screen.Cursor := crHourGlass;

   InsDataFil;

   sHasta := quotedStr(formatdatetime(DMALM.wFormatFecha, dbdtpFNS.DateTime));

   DecodeDate(dbdtpFNS.Date, Y, M, D);
   DMALM.StrZero(IntToStr(M), 2);
   xMes := DMALM.StrZero(IntToStr(M), 2);
   xMAn := DMALM.StrZero(IntToStr(M + 1), 2);
   xAno := DMALM.StrZero(IntToStr(Y), 4);
   xDia := DMALM.StrZero(IntToStr(D), 2);

   xSQL := 'Select A.ARTCONT, '
      + '         (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) STOCK, '
      + '         (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) VALOR, '
      + '          CASE WHEN (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) <> 0 '
      + '               THEN (NVL(STKTMG' + xMes + ',0) + NVL(STKIMG' + xMes + ',0) - NVL(STKSMG' + xMes + ',0)) / '
      + '                    (NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) '
      + '               ELSE 0 END COSTO, A.UNMIDG, '
      + '         (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) STOCKU, '
      + '         (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) VALORU, '
      + '          CASE WHEN (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) <> 0 '
      + '               THEN (NVL(STKTMU' + xMes + ',0) + NVL(STKIMU' + xMes + ',0) - NVL(STKSMU' + xMes + ',0)) / '
      + '                    (NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) '
      + '               ELSE 0 END COSTOU, A.UNMIDU, '
      + '          E.ALMDES, A.CIAID, A.TINID, F.TINDES, A.GRARID, C.GRARDES, A.ARTID, B.ARTDES, D.CIADES, '
      + '          A.FAMID, A.SFAMID '
      + '     from LOG316 A, TGE205 B, TGE131 C, TGE101 D, TGE151 E, TGE152 F, LOG323 G '
      + '    where (((( NVL(STKTSG' + xMes + ',0) + NVL(STKISG' + xMes + ',0) - NVL(STKSSG' + xMes + ',0)) * B.ARTCPROG) > 0) '
      + '         OR (((NVL(STKTSU' + xMes + ',0) + NVL(STKISU' + xMes + ',0) - NVL(STKSSU' + xMes + ',0)) * B.ARTCPROU) > 0)) '
      + '      and A.ARTID =B.ARTID(+)  AND A.CIAID=B.CIAID(+) '
      + '      and A.CIAID=C.CIAID(+) AND A.GRARID=C.GRARID(+) AND A.TINID=C.TINID(+) '
      + '      and A.CIAID =D.CIAID(+) '
      + '      and A.ALMID =E.ALMID(+) AND A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+) AND A.TINID=E.TINID(+) '
      + '      and A.CIAID =F.CIAID(+) AND A.TINID=F.TINID(+) '
      + '      and A.CIAID =G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID '
      + '      and A.ALMID=G.ALMID AND A.ARTID=G.ARTID '
      + '      and G.USUARIO=' + QuotedStr(DMALM.wUsuario) + ' '
      + '      and STKANO=''' + xAno + ''' '
      + '    order by A.TINID, A.GRARID, A.ARTID';

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;

End;


Procedure TFRegNtaSAL.InsDataFil;
Var
   MtoGFNameG, MtoGFNameU, CntGFNameG, CntGFNameU, sTOTAL, sWhere: String;
   xSQL, SalIniHas: String;
   D, M, Y, DH, MH, YH: Word;
   iX, iY: integer;
Begin
   DecodeDate(dbdtpFNS.Date, YH, MH, DH);
   DecodeDate(StrToDate('01/01/' + IntToStr(YH)), Y, M, D);

   If D = 1 Then
      SalIniHas := IntToStr(D) + '/' + IntToStr(M) + '/' + IntToStr(Y)
   Else
      SalIniHas := IntToStr(D - 1) + '/' + IntToStr(M) + '/' + IntToStr(Y);

   CntGFNameG := 'STKTSG' + DMALM.StrZero(IntToStr(M), 2);
   CntGFNameU := 'STKTSU' + DMALM.StrZero(IntToStr(M), 2);
   MtoGFNameG := 'STKTMG' + DMALM.StrZero(IntToStr(M), 2);
   MtoGFNameU := 'STKTMU' + DMALM.StrZero(IntToStr(M), 2);

   SalIniHas := quotedStr(formatdatetime(DMALM.wFormatFecha, strtodatetime(SalIniHas)));

   xSQL := 'Delete from LOG323 where USUARIO=''' + DMALM.wUsuario + '''';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   sTOTAL := 'Insert into LOG323 '
      + '         (CIAID, LOCID, ALMID, TINID, GRARID, NISAFREG, TDAID, TDAABR, ARTFUC, '
      + '          ARTID, ARTDES, UNMIDG, UMEDGDES, UNMIDU, UMEDUDES, NISAID, NISATIP, '
      + '          SALDOG, SALDOU, MONTOG, MONTOU, KDXCNTG, KDXCNTU, KDXCNTGI, KDXCNTUI, '
      + '          KDXCNTGS, KDXCNTUS, ARTCPROG, ARTCPROU, KDXCPROGI, KDXCPROUI, KDXCPROGS, '
      + '          KDXCPROUS, USUARIO) '
      + '     Select CIAID, LOCID, ALMID, TINID, GRARID, (' + SalIniHas + '), ''00'', '''', '
      + '            ARTFUC, ARTID, ARTDES, UNMIDG, '''', UNMIDU, '''', ''Saldo Inicial'', '
      + '            '''', ' + CntGFNameG + ', ' + CntGFNameU + ', ' + MtoGFNameG + ', '
      + MtoGFNameU + ', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '
      + '            0.00, 0.00, 0.00, ' + quotedstr(DMALM.wUsuario)
      + '       from LOG316 '
      + '      where CIAID=' + quotedstr(dblcCia.Text)
      + '        and LOG316.STKANO=' + quotedstr(InttoStr(YH))
      + '        and ALMID=' + quotedstr(dblcTALM.Text);
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sTOTAL);
   Except
   End;
End;
}

Procedure TFRegNtaSAL.InsertaDetalle(nItem: Integer);
Var
   Ano, Mes, sSit, sSQL, sCIA, sART, sTIN, sALM, sNISA, sTDA, sLOC, xWhere: String;
   DFechar: TDateTime;
   bExiste: Boolean;
   D, M, Y: Word;
   PedidoG, PedidoU, CantidadG, CantidadU, Contenido: Double;
Begin

   CantidadG := DMALM.cdsReporte.FieldByname('STOCK').AsFloat;
   CantidadU := 0;
   PedidoG := 0;
   PedidoU := 0;

   sSQL := 'CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTInv.Text + ''' AND ARTID=''' + DMALM.cdsReporte.FieldByname('ARTID').AsString + '''';
   DMALM.DisplayDescrip('prvTGE', 'TGE205', 'ARTPCG,ARTID, ARTDES, FAMID, SFAMID, TINID, GRARID, ARTCONT, UNMIDG, UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA,ARTSNA,ARTCPROU,ARTCPROG,ARTPVU,ARTPVG,ARTFUC,TMONID,ARTCRGO,ARTACTIVO,CUENTAID', sSQL, 'ARTID');
   Contenido := DMALM.cdsQry.FieldByName('ARTCONT').AsFloat;

   sCIA := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMALM.cdsNIS.FieldByName('TINID').AsString;
   sALM := DMALM.cdsNIS.FieldByName('ALMID').AsString;
   DFechar := DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime;
   sNISA := DMALM.cdsNIS.FieldByName('NISAID').AsString;
   sTDA := DMALM.cdsNIS.FieldByName('TDAID').AsString;

 {+----------------------------------------------------------------------------+
 |                     GENERANDO MOVIMIENTO DEL ARTICULO                       |
 |     1. Insertar o adicionar registros del movimiento de los artículos       |
 +----------------------------------------------------------------------------+}

   DMALM.cdsKDXNSal.Insert;
   DMALM.cdsKDXNSal.FieldByName('KDXID').AsString := DMALM.StrZero(IntToStr(nItem), 3);
   DMALM.cdsKDXNSal.FieldByName('CIAID').AsString := sCIA;
   DMALM.cdsKDXNSal.FieldByName('LOCID').AsString := sLOC;
   DMALM.cdsKDXNSal.FieldByName('TINID').AsString := sTIN;
   DMALM.cdsKDXNSal.FieldByName('ALMID').AsString := sALM;
   DMALM.cdsKDXNSal.FieldByName('TDAID').AsString := sTDA;
   DMALM.cdsKDXNSal.FieldByName('ARTID').AsString := DMALM.cdsReporte.FieldByname('ARTID').AsString;
   DMALM.cdsKDXNSal.FieldByName('KDXFREG').AsDateTime := DFechar;
   DMALM.cdsKDXNSal.FieldByName('KDXPEDIDOG').AsString := FloatToStr(PedidoG);
   DMALM.cdsKDXNSal.FieldByName('KDXPEDIDOU').AsString := FloatToStr(PedidoU);
   DMALM.cdsKDXNSal.FieldByName('KDXCNTG').AsString := FloatToStr(CantidadG);
   DMALM.cdsKDXNSal.FieldByName('KDXCNTU').AsString := FloatToStr(CantidadU);
   DMALM.cdsKDXNSal.FieldByName('SITUACION').AsString := sSit;
   DMALM.cdsKDXNSal.FieldByName('NISAATERQS').Clear;
   DMALM.cdsKDXNSal.FieldByName('KDXSALDOG').AsString := '0';
   DMALM.cdsKDXNSal.FieldByName('KDXSALDOU').AsString := '0';
   DMALM.cdsKDXNSal.FieldByName('ARTDES').AsString := DMALM.cdsQry.FieldByName('ARTDES').AsString;
   DMALM.cdsKDXNSal.FieldByName('FAMID').AsString := DMALM.cdsQry.FieldByName('FAMID').AsString;
   DMALM.cdsKDXNSal.FieldByName('SFAMID').AsString := DMALM.cdsQry.FieldByName('SFAMID').AsString;
   DMALM.cdsKDXNSal.FieldByName('GRARID').AsString := DMALM.cdsQry.FieldByName('GRARID').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTCONT').AsString := DMALM.cdsQry.FieldByName('ARTCONT').AsString;
   DMALM.cdsKDXNSal.FieldByName('UNMIDG').AsString := DMALM.cdsQry.FieldByName('UNMIDG').AsString;
   DMALM.cdsKDXNSal.FieldByName('UNMIDU').AsString := DMALM.cdsQry.FieldByName('UNMIDU').AsString;
   DMALM.cdsKDXNSal.FieldByName('FABID').AsString := DMALM.cdsQry.FieldByName('FABID').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTSPRO').AsString := DMALM.cdsQry.FieldByName('ARTSPRO').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTSCA').AsString := DMALM.cdsQry.FieldByName('ARTSCA').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTPARA').AsString := DMALM.cdsQry.FieldByName('ARTPARA').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTSNA').AsString := DMALM.cdsQry.FieldByName('ARTSNA').AsString;
 // El costo de la salida toma el costo promedio actual Eso me sirve para el caso de transferencia y en ventascuando devuelven
 // En realidad, el costo de salida real, lo determina recien en el momento de aceptar la nota de salida
   DMALM.cdsKDXNSal.FieldByName('ARTPCU').AsString := DMALM.cdsQry.FieldByName('ARTCPROU').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTPCG').AsString := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTMORIPCU').AsString := DMALM.cdsQry.FieldByName('ARTCPROU').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTMORIPCG').AsString := DMALM.cdsQry.FieldByName('ARTCPROG').AsString;
   DMALM.cdsKDXNSal.FieldByName('COSREPO').AsString := DMALM.cdsQry.FieldByName('ARTPCG').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTPVU').AsString := DMALM.cdsQry.FieldByName('ARTPVU').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTPVG').AsString := DMALM.cdsQry.FieldByName('ARTPVG').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTFUC').AsDateTime := DMALM.cdsQry.FieldByName('ARTFUC').AsDateTime;
   DMALM.cdsKDXNSal.FieldByName('TMONID').AsString := DMALM.wTMonLoc;
   DMALM.cdsKDXNSal.FieldByName('ARTCRGO').AsString := DMALM.cdsQry.FieldByName('ARTCRGO').AsString;
   DMALM.cdsKDXNSal.FieldByName('ARTACTIVO').AsString := DMALM.cdsQry.FieldByName('ARTACTIVO').AsString;
   DMALM.cdsKDXNSal.FieldByName('CUENTAID').AsString := DMALM.cdsQry.FieldByName('CUENTAID').AsString;
   DMALM.cdsKDXNSal.FieldByName('NISSIT').AsString := 'INICIAL';

   DMALM.cdsKDXNSal.FieldByName('ARTTOTALG').AsFloat := 0;
   DMALM.cdsKDXNSal.FieldByName('ARTTOTALU').AsFloat := 0;
   DMALM.cdsKDXNSal.FieldByName('ARTTOTAL').AsFloat := 0;

   DMALM.cdsKDXNSal.FieldByName('PROV').AsString := DMALM.cdsNIS.FieldByName('PROV').AsString;
   DMALM.cdsKDXNSal.FieldByName('DOCID').AsString := DMALM.cdsNIS.FieldByName('DOCID').AsString;

   DMALM.cdsKDXNSal.FieldByName('TRIID').AsString := DMALM.cdsNIS.FieldByName('TRIID').AsString;

   DMALM.cdsKDXNSal.FieldByName('CCOSID').AsString := DMALM.cdsNIS.FieldByName('CCOSID').AsString;
   DMALM.cdsKDXNSal.FieldByName('ODCID').AsString := DMALM.cdsNIS.FieldByName('ODCID').AsString;
   DMALM.cdsKDXNSal.FieldByName('NISAID').AsString := DMALM.cdsNIS.FieldByName('NISAID').AsString;
   DMALM.cdsKDXNSal.FieldByName('NISATIP').AsString := DMALM.cdsNIS.FieldByName('NISATIP').AsString;
   DMALM.cdsKDXNSal.FieldByName('NISASOLIC').AsString := Trim(DMALM.cdsNIS.FieldByName('NISASOLIC').AsString);
   DMALM.cdsKDXNSal.FieldByName('NISAFREG').AsDateTime := DMALM.cdsNIS.FieldByName('NISAFREG').AsDateTime;
   DMALM.cdsKDXNSal.FieldByName('NISANDOC').AsString := DMALM.cdsNIS.FieldByName('NISANDOC').AsString;
   DMALM.cdsKDXNSal.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsNIS.FieldByName('NISAFDOC').AsDateTime;

   DMALM.cdsKDXNSal.FieldbyName('KDXUSER').AsString := DMALM.wUsuario;

   DMALM.cdsKDXNSal.FieldbyName('KDXANO').AsString := DMALM.cdsNIS.FieldByName('NISAANO').AsString;
   DMALM.cdsKDXNSal.FieldbyName('KDXMM').AsString := DMALM.cdsNIS.FieldByName('NISAMES').AsString;
   DMALM.cdsKDXNSal.FieldbyName('KDXDD').AsString := DMALM.cdsNIS.FieldByName('NISADIA').AsString;
   DMALM.cdsKDXNSal.FieldbyName('KDXANOMM').AsString := DMALM.cdsNIS.FieldByName('NISAANOMES').AsString;
   DMALM.cdsKDXNSal.FieldbyName('KDXTRI').AsString := DMALM.cdsNIS.FieldByName('NISATRIM').AsString;
   DMALM.cdsKDXNSal.FieldbyName('KDXSEM').AsString := DMALM.cdsNIS.FieldByName('NISASEM').AsString;
   DMALM.cdsKDXNSal.FieldbyName('KDXSS').AsString := DMALM.cdsNIS.FieldByName('NISASS').AsString;
   DMALM.cdsKDXNSal.FieldbyName('KDXAATRI').AsString := DMALM.cdsNIS.FieldByName('NISAAATRI').AsString;
   DMALM.cdsKDXNSal.FieldbyName('KDXAASEM').AsString := DMALM.cdsNIS.FieldByName('NISAAASEM').AsString;
   DMALM.cdsKDXNSal.FieldbyName('KDXAASS').AsString := DMALM.cdsNIS.FieldByName('NISAAASS').AsString;

   DMALM.cdsKDXNSal.FieldbyName('KDXFREG').AsDateTime := Date;
   DMALM.cdsKDXNSal.FieldbyName('KDXHREG').AsDateTime := Date + SysUtils.Time;

   DMALM.cdsKDXNSal.FieldbyName('CUENTA2ID').AsString := wCUENTA;
   DMALM.cdsKDXNSal.FieldbyName('KDXCVTAS').AsString := wTRICVTAS;

   DMALM.cdsKDXNSal.Post;
End;

Procedure TFRegNtaSAL.dblcdNDocEnter(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select CIAID, NISAID, ALMID, NISAFREG, PROV '
      + '     from LOG314 A '
      + '    where CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTInv.Text + ''' '
      + '      and ALMID=''' + dblcTALM.Text + ''' AND NISATIP=''INGRESO'' '
      + '      and NISAFREG>=SYSDATE-15';
   DMALM.cdsNIT.Close;
   DMALM.cdsNIT.DataRequest(xSQL);
   DMALM.cdsNIT.Open;
   dblcdNDoc.LookupTable := DMALM.cdsNIT;
End;

Procedure TFRegNtaSAL.dblcdNDocExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select CIAID, NISAID, ALMID, NISAFREG, PROV '
      + '     from LOG314 A '
      + '    where CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTInv.Text + ''' '
      + '      and ALMID=''' + dblcTALM.Text + ''' AND NISATIP=''INGRESO'' '
      + '      and NISAID=''' + dblcdNDoc.Text + ''' '
      + '      and NISAFREG>=SYSDATE-15';
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;

   If DMALM.cdsQry.RecordCount <= 0 Then
   Begin
      ShowMessage('Nota de Ingreso no esta en el Rango');
      DMALM.cdsNIS.FieldByName('NISANDOC').AsString := '';
      Exit;
   End;
   DMALM.cdsNIS.FieldByName('NISAFDOC').AsDateTime := DMALM.cdsQry.FieldByName('NISAFREG').AsDateTime;
End;

Procedure TFRegNtaSAL.CargaDataSource;
Begin

   dbgDReqs.DataSource := DMALM.dsKDXNSal;
   dbgGridSerie.DataSource := DMALM.dsKDXSerie;

   dblcCIA.DataSource := DMALM.dsNIS;
   dblcCIA.LookupTable := DMALM.cdsCIA;
   dblcLOC.DataSource := DMALM.dsNIS;
   dblcLOC.LookupTable := DMALM.cdsLOC;
   dblcTInv.DataSource := DMALM.dsNIS;
   dblcTInv.LookupTable := DMALM.cdsTINID;
   dblcTALM.DataSource := DMALM.dsNIS;
   dblcTALM.LookupTable := DMALM.cdsALM;

   dblcTDA.DataSource := DMALM.dsNIS;
   dblcTDA.LookupTable := DMALM.cdsTDNISA;
   dblcTransac.DataSource := DMALM.dsNIS;
   dblcTransac.LookupTable := DMALM.cdsTRAN;
   dbdtpFNS.DataSource := DMALM.dsNIS;
   dbeNumNISA.DataSource := DMALM.dsNIS;
   dblcdProv.DataSource := DMALM.dsNIS;
   dblcdProv.LookupTable := DMALM.cdsProv;

   dblcLOCOri.DataSource := DMALM.dsNIS;
   dblcLOCOri.LookupTable := DMALM.cdsLKLOC;
   dblcTINOri.DataSource := DMALM.dsNIS;
   dblcTINOri.LookupTable := DMALM.cdsLKTIN;
   dblcTALMOri.DataSource := DMALM.dsNIS;
   dblcTALMOri.LookupTable := DMALM.cdsLKALM;

   dblcdCC.DataSource := DMALM.dsNIS;
   dblcdCC.LookupTable := DMALM.cdsCCost;

   dblcdTDOC.DataSource := DMALM.dsNIS;
   dblcdTDOC.LookupTable := DMALM.cdsTDOC;
   dbeSerie.DataSource := DMALM.dsNIS;
   dbeNDoc.DataSource := DMALM.dsNIS;
   dblcdNDoc.DataSource := DMALM.dsNIS;
   dblcdNDoc.LookupTable := DMALM.cdsNIT;

   dbdtpFDoc.DataSource := DMALM.dsNIS;
   dbeSolic.DataSource := DMALM.dsNIS;
   dbeLote1.DataSource := DMALM.dsNIS;
   dbmObs.DataSource := DMALM.dsNIS;

   deObra.DataSource := DMALM.dsNIS;
   dbePO.DataSource := DMALM.dsNIS;
   dbeNP.DataSource := DMALM.dsNIS;

   dbeTCambio.DataSource := DMALM.dsNIS;

   dblcdNroLote.DataSource := DMALM.dsNIS;
   dbdtpFecLote.DataSource := DMALM.dsNIS;

   dbcldArti.LookupTable := DMALM.cdsSalAlm

End;

Procedure TFRegNtaSAL.ActualizaLog332NSSIt;
Begin
   xSQL := ' Select * '
      + '      from LOG332 '
      + '     where CIAID=' + QuotedStr(dblcCia.text)
      + '       and ALMID=' + QuotedStr(dblcTALM.text)
      + '       and ARTID=' + QuotedStr(DMALM.cdsKDXNSal.FieldByName('ARTID').AsString)
      + '       and NSTDOC=' + QuotedStr(dblcTDA.Text)
      + '       and NSNDOC=' + QuotedStr(dbeNumNISA.Text)
      + '       and NISIT=' + QuotedStr('ACEPTADO')
      + '       and NSSIT=' + QuotedStr('INICIAL')
      + '       and ENTREGADO=' + QuotedStr('S');
   DMALM.cdsKDXSerie.Close;
   DMALM.cdsKDXSerie.DataRequest(xSQL);
   DMALM.cdsKDXSerie.Open;

   DMALM.cdsKDXSerie.First;
   While Not DMALM.cdsKDXSerie.Eof Do
   Begin
      DMALM.cdsKDXSerie.Edit;
      DMALM.cdsKDXSerie.FieldByName('NSSIT').AsString := 'ACEPTADO';
      DMALM.cdsKDXSerie.Post;
      ActualizaACF201;
      DMALM.cdsKDXSerie.Next;
   End;
End;

Procedure TFRegNtaSAL.ActualizaACF201;
Begin
  // ACTIVA el bien por aceptarse la N. de Salida
   xSQL := ' Update ACF201 '
      + '       set ACFFLAGACT=' + quotedstr('A')
      + '     where ARTCODBAR=' + QuotedStr(DMALM.cdsKDXSerie.FieldByName('CODBAR').AsString);
   DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
End;

Procedure TFRegNtaSAL.ELiminarNS;
Var
   xSQL: String;
Begin
   If (trim(DMALM.cdsNIS.FieldByName('NISSIT').AsString) = 'INICIAL') And (Length(Trim(xNSalElim)) > 0) Then
   Begin
      xSQL := 'Select * '
         + '     from LOG315 '
         + '    where CIAID=' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
         + '      and LOCID=' + quotedstr(DMALM.cdsNIS.FieldByName('LOCID').AsString)
         + '      and TINID=' + quotedstr(DMALM.cdsNIS.FieldByName('TINID').AsString)
         + '      and ALMID=' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
         + '      and NISAID=' + quotedstr(dbeNumNISA.Text)
         + '      and NISATIP=' + quotedstr('SALIDA');
      DMALM.cdsKDXNSal.DataRequest(xSQL);
      If DMALM.cdsKDXNSal.RecordCount = 0 Then
      Begin
         If MessageDlg(' ¿ No ingresó registro de detalle, Eliminar Nota de Ingreso ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            xSQl := 'Delete LOG314 '
               + '    where CIAID =' + quotedstr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
               + '      and LOCID =' + quotedstr(DMALM.cdsNIS.FieldByName('LOCID').AsString)
               + '      and TINID =' + quotedstr(DMALM.cdsNIS.FieldByName('TINID').AsString)
               + '      and ALMID =' + quotedstr(DMALM.cdsNIS.FieldByName('ALMID').AsString)
               + '      and NISAID =' + quotedstr(dbeNumNISA.Text)
               + '      and NISATIP=' + quotedstr('SALIDA');
            DMALM.DCOM1.AppServer.EjecutaSQL(xSql);
         End
      End;
   End;
End;

End.


