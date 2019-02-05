Unit ALMDM1;

// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : ALMDM1
// FORMULARIO               : DMALM
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : El módulo de datos contiene los ClientaDataSet y los
//                            DataSource que se usa en el módulo para interactuar
//                            con los datos de la Base de Datos.
//                            también contiene las funcionalidades genéricas que
//                            pueden ser invocadas desde cualquier formulario
//                            del módulo

// Actualizaciones:
// HPP_201102_ALM 17/02/2011  Se incrementa el grado de precisión en los cálculos a 5 decimales
//                            Por ese motivo se modifica el redondeo en la asignación y cálculos
// HPC_201107_ALM 17/02/2011  Se modifica la ruta de los RTMs debido a la unificación
//                            de todos los módulos del Oasis
// HPC_201202_ALM 13/08/2012: -Se implementó el control de versiones
// HPC_201302_ALM 19/04/2013  Se implementa una funcion donde verifica si el Tipo inventario esta habilitado
// HPC_201306_ALM 01/09/2013  Se adiciona procedimiento que analiza la información de los artículos de reposición,
//                            si el usuario tiene asignado compañía para el proceso, también si esta información
//                            se debe reprocesar por tiempo límite
// HPC_201504_ALM 26/08/2015 Se cambia la llave de numeracion a CIA+ALMACEN+TIPO+Nro.Nota
//                           Se cambia funciones:
//                           IsExistNISA : función que determina si la Nota de I/S ya existe
//                           MaxNIS      : función que determina el siguiente correlativo de las Notas de Ingreso
//                           MaxNIA      : función que determina el siguiente correlativo de las Notas de Salida
// HPC_201505_ALM 14/09/2015 Se crea función que devuelve los almacenes permitidos para el usuario.
// HPC_201601_ALM 04/04/2016 Cambios del Maestro para incluir Clase y SubClase
// HPC_201604_ALM 30/05/2016 Inicializa variable para controlar accesos del grupo del perfil de usuario
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBClient, MConnect, Db, Wwdatsrc, wwclient, DBTables, Wwquery, extctrls,
   IniFiles, oaContabiliza, comctrls, RecError, Wwtable, Variants,
   Mant, OleServer, DBGrids, SConnect, winsock, Msgdlgs, Excel2000;

Type
   TDMALM = Class(TDataModule)
      dsArti: TwwDataSource;
      cdsCCost: TwwClientDataSet;
      dsCCost: TwwDataSource;
      cdsCIA: TwwClientDataSet;
      dsCIA: TwwDataSource;
      cdsGArti: TwwClientDataSet;
      dsGArti: TwwDataSource;
      cdsUMed: TwwClientDataSet;
      dsUMed: TwwDataSource;
      cdsUser: TwwClientDataSet;
      dsUser: TwwDataSource;
      cdsTMoneda: TwwClientDataSet;
      dsTMoneda: TwwDataSource;
      cdsSQL: TwwClientDataSet;
      dsSQL: TwwDataSource;
      cdsLEntrega: TwwClientDataSet;
      dsLEntrega: TwwDataSource;
      cdsArtPend: TwwClientDataSet;
      dsArtPend: TwwDataSource;
      cdsQry: TwwClientDataSet;
      dsQry: TwwDataSource;
      cdsProv: TwwClientDataSet;
      dsProv: TwwDataSource;
      cdsDOrdComp: TwwClientDataSet;
      dsDOrdComp: TwwDataSource;
      cdsFAB: TwwClientDataSet;
      dsFAB: TwwDataSource;
      dsEARTI: TwwDataSource;
      cdsClnArti: TwwClientDataSet;
      dsClnArti: TwwDataSource;
      cdsQARTI: TwwClientDataSet;
      dsQARTI: TwwDataSource;
      cdsNIS: TwwClientDataSet;
      dsNIS: TwwDataSource;
      dsKDX: TwwDataSource;
      cdsALM: TwwClientDataSet;
      dsALM: TwwDataSource;
      cdsTDOC: TwwClientDataSet;
      dsTDOC: TwwDataSource;
      cdsTRAN: TwwClientDataSet;
      dsTRAN: TwwDataSource;
      cdsSTK: TwwClientDataSet;
      dsSTK: TwwDataSource;
      cdsCNS: TwwClientDataSet;
      dsCNS: TwwDataSource;
      cdsEUNMED: TwwClientDataSet;
      dsEUNMED: TwwDataSource;
      dsNIA: TwwDataSource;
      cdsTDNISA: TwwClientDataSet;
      dsTDNISA: TwwDataSource;
      cdsOCNIA: TwwClientDataSet;
      dsOCNIA: TwwDataSource;
      cdsLKTRAN: TwwClientDataSet;
      dsLKTRAN: TwwDataSource;
      cdsCierre: TwwClientDataSet;
      dsCierre: TwwDataSource;
      cdsDOCATT: TwwClientDataSet;
      dsDOCATT: TwwDataSource;
      cdsPRIO: TwwClientDataSet;
      dsPRIO: TwwDataSource;
      cdsArti: TwwClientDataSet;
      cdsEARTI: TwwClientDataSet;
      cdsKDX: TwwClientDataSet;
      cdsTMP: TwwClientDataSet;
      dsTMP: TwwDataSource;
      cdsLOC: TwwClientDataSet;
      dsLOC: TwwDataSource;
      dsClient: TwwDataSource;
      cdsClient: TwwClientDataSet;
      cdsConceptoAlm: TwwClientDataSet;
      dsConceptoAlm: TwwDataSource;
      cdsLKLOC: TwwClientDataSet;
      dsLKLOC: TwwDataSource;
      cdsLKALM: TwwClientDataSet;
      dsLKALM: TwwDataSource;
      cdsDOCATT2: TwwClientDataSet;
      dsDOCATT2: TwwDataSource;
      cdsFAM: TwwClientDataSet;
      dsFAM: TwwDataSource;
      cdsSUBFAM: TwwClientDataSet;
      dsSUBFAM: TwwDataSource;
      cdsTINID: TwwClientDataSet;
      dsTINID: TwwDataSource;
      cdsPCUENTA: TwwClientDataSet;
      dsPCUENTA: TwwDataSource;
      cdsKDXTemp: TwwClientDataSet;
      dsKDXTemp: TwwDataSource;
      cdsSaldos: TwwClientDataSet;
      dsSaldos: TwwDataSource;
      cdsMAlmCab: TwwClientDataSet;
      dsMAlmCab: TwwDataSource;
      cdsMAlmDet: TwwClientDataSet;
      dsMAlmDet: TwwDataSource;
      cdsOrdComp: TwwClientDataSet;
      dsOrdComp: TwwDataSource;
      cdsFPago: TwwClientDataSet;
      cdsUsuarios: TwwClientDataSet;
      cdsMGrupo: TwwClientDataSet;
      cdsGrupos: TwwClientDataSet;
      cdsAcceso: TwwClientDataSet;
      dsUsuarios: TwwDataSource;
      dsMGrupo: TwwDataSource;
      dsGrupos: TwwDataSource;
      dsAcceso: TwwDataSource;
      dsAjuSal: TwwDataSource;
      cdsUbicacion: TwwClientDataSet;
      cdsAjuSal: TwwClientDataSet;
      cdsStockVal: TwwClientDataSet;
      dsStockVal: TwwDataSource;
      cdsTipCam: TwwClientDataSet;
      dsTipCam: TwwDataSource;
      cdsVeriClon: TwwClientDataSet;
      cdsVeriNum: TwwClientDataSet;
      cdsVeriResul: TwwClientDataSet;
      dsVeriNum: TwwDataSource;
      dsVeriClon: TwwDataSource;
      dsVeriResul: TwwDataSource;
      cdsPerALM: TwwClientDataSet;
      dsPerALM: TwwDataSource;
      cdsTDiario: TwwClientDataSet;
      dsTDiario: TwwDataSource;
      cdsTGE: TwwClientDataSet;
      cdsEjecuta: TwwClientDataSet;
      dsTGE: TwwDataSource;
      dsEjecuta: TwwDataSource;
      cdsSQL1: TwwClientDataSet;
      dsSQL1: TwwDataSource;
      cdsAsientoS: TwwClientDataSet;
      dsAsientoS: TwwDataSource;
      cdsAsiento: TwwClientDataSet;
      cdsDAsiento: TwwClientDataSet;
      dsAsiento: TwwDataSource;
      dsDAsiento: TwwDataSource;
      cdsPeriodo: TwwClientDataSet;
      dsPeriodo: TwwDataSource;
      cdsCnt300: TwwClientDataSet;
      cdsCnt301: TwwClientDataSet;
      dsCnt300: TwwDataSource;
      dsCnt301: TwwDataSource;
      cdsSalAlm: TwwClientDataSet;
      dsSalAlm: TwwDataSource;
      cdsReporte: TwwClientDataSet;
      dsReporte: TwwDataSource;
      cdsArtiStk: TwwClientDataSet;
      dsArtiStk: TwwDataSource;
      cdsNia: TwwClientDataSet;
      cdsLKTIN: TwwClientDataSet;
      dsLKTIN: TwwDataSource;
      cdsAPNIS: TwwClientDataSet;
      dsAPNIS: TwwDataSource;
      cdsReqs: TwwClientDataSet;
      dsReqs: TwwDataSource;
      cdsDReqs: TwwClientDataSet;
      dsDReqs: TwwDataSource;
      cdsTipSol: TwwClientDataSet;
      dsTipSol: TwwDataSource;
      cdsDetMov: TwwClientDataSet;
      dsDetMov: TwwDataSource;
      cdsDetMovCco: TwwClientDataSet;
      dsDetMovCco: TwwDataSource;
      cdsTRqs: TwwClientDataSet;
      dsTRqs: TwwDataSource;
      cdsConsumo: TwwClientDataSet;
      dsConsumo: TwwDataSource;
      cdsObra: TwwClientDataSet;
      dsObra: TwwDataSource;
      cdsMovCNT1: TwwClientDataSet;
      cdsNivel: TwwClientDataSet;
      cdsQry2: TwwClientDataSet;
      cdsMovCxP: TwwClientDataSet;
      dsMovCxP: TwwDataSource;
      dsMovCNT1: TwwDataSource;
      dsNivel: TwwDataSource;
      dsQry2: TwwDataSource;
      dsCabPre: TwwDataSource;
      cdsCabPre: TwwClientDataSet;
      cdsNivelPresu: TwwClientDataSet;
      dsNivelPresu: TwwDataSource;
      cdsTipPre: TwwClientDataSet;
      dsTipPre: TwwDataSource;
      dsParPre: TwwDataSource;
      cdsParPre: TwwClientDataSet;
      dsDetPre: TwwDataSource;
      cdsDetPre: TwwClientDataSet;
      cdsParaRepo: TwwClientDataSet;
      dsParaRepo: TwwDataSource;
      cdsResultSet: TwwClientDataSet;
      cdsDeltaSet: TwwClientDataSet;
      dsDeltaSet: TwwDataSource;
      cdsMovFac: TwwClientDataSet;
      cdsGuia: TwwClientDataSet;
      dsGuia: TwwDataSource;
      dsMovFac: TwwDataSource;
      dsDetGuia: TwwDataSource;
      cdsDetGuia: TwwClientDataSet;
      dsDetFac: TwwDataSource;
      cdsDetFac: TwwClientDataSet;
      cdsQry4: TwwClientDataSet;
      dsQry4: TwwDataSource;
      cdsHojaT: TwwClientDataSet;
      dsHojaT: TwwDataSource;
      cdsDHojaT: TwwClientDataSet;
      dsDHojaT: TwwDataSource;
      cdsUltTGE: TwwClientDataSet;
      cdsQry1: TwwClientDataSet;
      cdsQry6: TwwClientDataSet;
      dsQry6: TwwDataSource;
      cdsKDXSerie: TwwClientDataSet;
      dsKDXSerie: TwwDataSource;
      cdsPadre: TwwClientDataSet;
      cdsHijo: TwwClientDataSet;
      cdsNieto: TwwClientDataSet;
      cdsSobrino: TwwClientDataSet;
      dsPadre: TwwDataSource;
      dsHijo: TwwDataSource;
      dsNieto: TwwDataSource;
      dsSobrino: TwwDataSource;
      cdsQry5: TwwClientDataSet;
      dsQry5: TwwDataSource;
      cdsQry3: TwwClientDataSet;
      dsQry3: TwwDataSource;
      cdsMovCNT: TwwClientDataSet;
      dsMovCNT: TwwDataSource;
      cdsCInventario: TwwClientDataSet;
      dsCInventario: TwwDataSource;
      dsDInventario: TwwDataSource;
      cdsDInventario: TwwClientDataSet;
      cdsReqAut: TwwClientDataSet;
      dsReqAut: TwwDataSource;
      cdsStkMto: TwwClientDataSet;
      cdsPais: TwwClientDataSet;
      dsPais: TwwDataSource;
      cdsProvinc: TwwClientDataSet;
      dsProvinc: TwwDataSource;
      cdsDpto: TwwClientDataSet;
      dsDpto: TwwDataSource;
      cdsDistrito: TwwClientDataSet;
      dsDistrito: TwwDataSource;
      cdsSecEco: TwwClientDataSet;
      dsSecEco: TwwDataSource;
      cdsGiro: TwwClientDataSet;
      dsGiro: TwwDataSource;
      cdsClasif: TwwClientDataSet;
      dsClasif: TwwDataSource;
      cdsClAux: TwwClientDataSet;
      dsClAux: TwwDataSource;
      cdsTipPer: TwwClientDataSet;
      dsTipPer: TwwDataSource;
      cdsTipProv: TwwClientDataSet;
      dsTipProv: TwwDataSource;
      cdsStockErr: TwwClientDataSet;
      dsStockErr: TwwDataSource;
      cdsStock: TwwClientDataSet;
      dsStock: TwwDataSource;
      cdsStockAct: TwwClientDataSet;
      dsStockAct: TwwDataSource;
      cdsProv2: TwwClientDataSet;
      dsProv2: TwwDataSource;
      cdsMarca: TwwClientDataSet;
      cdsTipArt: TwwClientDataSet;
      dsMarca: TwwDataSource;
      dsTipArt: TwwDataSource;
      cdsQry8: TwwClientDataSet;
      dsQry8: TwwDataSource;
      cdsNIT: TwwClientDataSet;
      dsNIT: TwwDataSource;
      ExcelApp: TExcelApplication;
      ExcelBook: TExcelWorkbook;
      WS: TExcelWorksheet;
      DCOM1: TSocketConnection;
      cdsGuiaRemision: TwwClientDataSet;
      dsGuiaRemision: TwwDataSource;
      cdsGuiaRemSalida: TwwClientDataSet;
      dsGuiaRemSalida: TwwDataSource;
      cdsGuiaRemTraslado: TwwClientDataSet;
      dsGuiaRemTraslado: TwwDataSource;
      cdsGuiaRemRequerimiento: TwwClientDataSet;
      cdsSCLASE: TClientDataSet;
      dsSCLASE: TDataSource;
      cdsCLASE: TwwClientDataSet;
      dsGuiaRemRequerimiento: TwwDataSource;
      dsCLASE: TwwDataSource;
      dsKDXNSal: TwwDataSource;
      cdsKDXNSal: TwwClientDataSet;
      cdsQry7: TwwClientDataSet;
      dsQry7: TwwDataSource;
      cdsQry9: TwwClientDataSet;
      dsQry9: TwwDataSource;
      cdsQry10: TwwClientDataSet;
      dsQry10: TwwDataSource;


      Procedure AplicaDatos(wCDS: TClientDataSet; wNomArch: String);
      Procedure ControlTran(wControlError: Integer; wCDS: TClientDataSet; wNomArch: String);
      Procedure cdsSaldosCalcFields(DataSet: TDataSet);
      Procedure cdsParaRepoReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; Var Action: TReconcileAction);
      Procedure Accesos;
      Procedure AbrirCDS(xxCds: TwwClientDataSet);
      Procedure AbrirTabla(xxTabla: TwwTable);
      Procedure cdsCInventarioReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
      Procedure cdsDInventarioReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
      Procedure cdsKDXSerieReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
      Procedure DataModuleCreate(Sender: TObject);
      Procedure cdsCnt301ReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
      Procedure cdsCnt300ReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);

   Private
  { Private declarations }

      FormatCel: Array Of OleVariant;

      pnlConta: TPanel;
      Procedure CreaPanel(xForma: TForm; xMensaje: String);
      Function Contabiliza(xCia, xTDiario, xAnoMM, xNoComp: String): Boolean;
      Procedure GeneraEnLinea401(xxxCia, xxxDiario, xxxAnoMM, xxxNoComp: String);
      Function CuentaExiste(xxxxCia, xxxxAno, xxxxCuenta, xxxxAux, xxxxCCos: String): Boolean;
      Procedure InsertaMov(cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto, cDH, cMov, cCtaDes, cAuxDes, cCCoDes, cNivel: String; nImpMN, nImpME: Double);
      Procedure ActualizaMov(cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto, cDH, cMov, cCtaDes, cAuxDes, cCCoDes, cNivel: String; nImpMN, nImpME: Double);

   Public
  { Public declarations }

      cIP, wOfiId, widepc, ideconex, fechorcon: String;

      wModoGuia: String;
      wTMonExt: String; // Tipo de Moneda extranjera oficial (normalmente dólares)
      wTMonLoc: String;

      wAnchoArt, wAnchoPro: Integer;
      wCredFiscal: Boolean;
      wDBFunc01, wDBFunc02: String;
      pbConta: tprogressbar;

   // Flag que se usa para cálculo de Revalorización
      xFlagCal: Boolean;

      wKDXSerie, wLote,
         wFormatFecha, wTipoCambioUsar,
         wReplacCeros, wRepFecServi,
         wRepHorServi, wRepFuncDate, wRepFuncChar,
         wRepTimeServi,
         wModo,
         wGrupo,
         wAdmin,
         wModulo,
         wGrupoTmp,
         wObjetoDescr,
         wObjetoForma,
         wObjetoNombr,
         wObjetoDesPr,
         wCHEQUE,
         wTARJETA,
         wClaseAuxClie,
         wClaseAuxProv,
         wUsuario,
         wMonedaNac,
         wMonedaExt,
         wTipoAdicion, // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
         wEFECTIVO: String;
      wComponente: TControl;

      sClose, wSRV: String;

    // Excel
      Procedure HojaExcel(Tit: String; TDs: TDataSource; TDb: TDBGrid);
      Procedure FormatosCeldas(N: Integer; TDs: TDataSource);
    //

      Function BuscaUltFecha(xPrv, xTabla, xCampo, xWhere: String): TDate;
      Function IsExistRqsM(Const sCIA, sLOC, sRQS: String): Boolean; // requisicion manual
      Procedure ExecSQL(Const cSQL: String);
      Function MaxSCC(Const sCIA: String): String;
      Function MaxArt(Const sCIA: String): String;
      Function MaxReqs(Const sCIA, sLOC, sALM: String): String;
      Function MaxReqA(Const sCIA, sLOC: String): String;
      Function MaxValue(Const sDetail: String; CD: TDataSet): String;
      Function MaxSQL(Const sTabla, sMxCampo, sCondicion: String): String;
      Function MaxSQLArt04(Const sTabla, sMxCampo, sCondicion: String): String;
      Function StrZero(wNumero: String; wLargo: Integer): String;
      Function IsExistRqs(Const sCIA, sLOCID, sALMID, sRqs: String): Boolean;
      Function IsExistSol(Const sCIA, sSol: String): Boolean;
      Function MaxPROF(Const sCIA: String): String;
      Function IsExistProf(Const sCIA, sPRF, sPRFP: String): Boolean;
      Function DisplayDescrip(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
      Procedure ppRptNotaSE(sSQL, sCIA, sLOC, sTIN, sALM, sTDO, sNIN, sTip: String);
      Procedure MultiOpen(Const CDS: Array Of TwwClientDataSet);
      Procedure MultiClose(Const CDS: Array Of TwwClientDataSet);
      Function MaxORD(Const sCIA: String): String;
      Function IsExistORD(Const sCIA, sORD: String): Boolean;
      Function IsExistART(Const sCIA, sART: String): Boolean;
      Function IsExistNISA(Const sCIA, sALM, sTIP, sNISA: String): Boolean;
      Function MaxNIS(Const sCIA, sALM: String): String;
      Function MaxNIA(Const sCIA, sALM: String): String;
      Function MaxAjuS(Const sCIA, sALM, sTIN, sLOC, sTDA: String): String;
      Function MaxAjuE(Const sCIA, sALM, sTIN, sLOC, sTDA: String): String;
      Function MaxAju: String;

  // Forma un periodo de la forma yyyymm
      Function FormatPeriodo(Y, M: Word): String;
  // Devuelve el periodo de la forma yyyymm, dado  un periodo de la misma forma
      Function PeriodoAnterior(Periodo: String): String;

      Procedure dOpen;
      Procedure dClose;
      Procedure CocienteResto(Num1, Num2: double; Var Cociente, Resto: double);
      Procedure CocienteRestoFalta(Num1, Num2: double; Var Cociente, Resto: double);
      Procedure ActualizaEstadoOC(sCIA: String);
      Procedure ActualizaOC(sCIA: String; Contenido: Double);
      Procedure ControlStock(sCIA, sALM, sLOC, sTIN, sArt, Ano, Mes: String; Contenido: Double; IngSal: Char);
      Procedure ControlStockJCC(sCIA, sALM, sLOC, sTIN, sArt, Ano, Mes: String; IngSal: Char; xCantg, xMontg: double);
      Procedure InsertaLOG316(sCIA, sALM, sLOC, sTIN, sArt, Ano, Mes: String; Contenido: Double; IngSal: Char);
      Procedure ActualizaArticulo(sCIA, sArt: String; Contenido: Double; IngSal: Char);
      Procedure ActualizaArticuloCIM(sCIA, sArt: String; Contenido: Double; IngSal: Char);
      Procedure ActualizaSituacion(IngSal: Char);
      Procedure ActualizaCantidadMonto(CantidadG, CantidadU, Contenido: double; SumaResta: Char; Var PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU: Double);
      Procedure ActualizaCantidadMontoDev(CantidadG, CantidadU, Contenido: double; SumaResta: Char; Var PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU: Double);
      Procedure ActualizaCantidadMontoCIM(CantidadG, CantidadU, Contenido: double; SumaResta: Char; Var PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU: Double);
      Procedure ActualizaCantidad(CantidadG, CantidadU, Contenido: double; SumaResta: char; Var CantidadActG, CantidadActU: Double);
      Function CountFor(cds: TwwClientDataSet; sCondicion: String): LongInt;
      Function Encripta(wPalabra: String): String;
      Function DesEncripta(wPalabra: String): String;
      Procedure AccesosUsuarios(xxModulo, xxUsuario, xxTipo, xxForma: String);
      Procedure AccesosUsuariosR(xxModulo, xxUsuario, xxTipo: String; xxForma: TForm);
      Function BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
      Function RecuperarDatos(xTabla, xCampos, xWhere: String): Boolean;
      Procedure AbreCierraCDS(xxCds: Array Of TwwClientDataSet; xxNom: Array Of String; xBool: Boolean);
      Procedure FiltraCDS(xxCds: TwwClientDataSet; xxSQL: String);
      Procedure SaldosIniciales(sCIA, sArt, xAnoMes: String; sContenido, sPrecio: Double);
      Procedure SaldosInicialesJCC(sCIA, sArt, xAnoMes: String; sContenido, sPrecio: Double);
      Procedure SaldosInicialesCLG(sCIA, sArt, xAnoMes: String; sContenido, sPrecio: Double);
      Function UltimoNum(wPrv, wTabla, wCampo, wWhere: String): String;
      Procedure GeneraContabilidad(xxCia, xxTDiario, xxAnoMM, xxNoComp: String; xForma: TForm; xxModulo: String);
      Function FRound(xReal: double; xEnteros, xDecimal: Integer): double;
      Procedure PanelMsg(xMensaje: String; xProc: Integer);
      Procedure TransferiraCNT(pCIAID, pECANOMM, pTDIARID, pECNOCOMP, pMod: String);
      Procedure Tiempo(wwFecha1, wwFecha2: TDateTime; Var wwAnos, wwMeses, wwDias: Integer);
      Procedure cdsPost(xxCds: TwwClientDataSet);
      Function NotLetras(xCampo: String): String;
      Procedure ActualizaRQUS(sCIA: String; Contenido: Double);
      Procedure ActualizaRequerimiento(sCIA, sLoc, sTipoAdq, sCCos, sArtid: String; dCantAtendida: double);
      Procedure ActualizaEstadoRQUS(sCIA: String);
      Function AnoNumDoc(Flag, Num, Ano: String): String;
      Function OperClientDataSet(ClientDataSet: TwwClientDataSet; Expression, Condicion: String): Double;
      Procedure GeneraContabilizacion(xxCia, xxTDiario, xxAnoMM, xxNoComp, xxPerCNT: String; xForma: TForm; xTipoC: String);
      Procedure GeneraContab(xxCia, xxTDiario, xxAnoMM, xxNoComp: String; xForma: TForm; xTipoC: String);
      Procedure Transferencia_CXP_a_CNT_Almacen(xCia, xTDia, xAAMM, xNoComp, xPerCNT, xTipoC: String; xxAuto: String = '');
      Procedure Transferencia_CXP_a_CNT(xCia, xTDia, xAAMM, xNoComp, xTipoC: String);
      Function UltimoRegistro(xAutoNum, xCia, xTDiario, xAno, xMes: String): String;
      Function GrabaUltimoRegistro(xAutoNum, xCia, xTDiario, xAno, xMes: String; xNumUsu: Integer): String;
      Function CalcTipoCambio(sMoneda: String; dtFecha: tdatetime; sCampo: String): String;
      Procedure ActualizaLOG336(sCIA, sLOC, sTIN, sArt, Ano, Mes, IngSal: String; fMonto: double);
      Procedure DisminuyeForma(Sender: TObject);
      Procedure ActualizaFiltro(wwFiltro: TMant; wwCdsLee: TwwClientDataSet; wwAccion: String);
      Procedure RecalculaSaldosAlmacen(cCia, cAno: String);
      Function NombreMes(wwMes: integer): String;
      Function FiltraCiaPorUsuario(cdsCiaUser: TwwClientDataSet): String;
      Function ObtenerIpdeNetbios(Host: String): String;
      Function ComputerName: String;
      Function AccesosModulo: Boolean;
      Function fg_VerificaVersion(wgVersion: String): Boolean;
      //Verifica si el Tipo inventario esta habilitado
      Function VerificaTipInventario(vCIAID: String; vTINID: String): Boolean;
      Procedure AnalizaStockRepos();
      Function FiltraAlmPorUsuario(wsUsuario: String): String;
      Function wf_AccesoOpcion(wOpcion: String): Boolean;
      Function VerificaPeriodoVentas(sCia: String; dFecha: TDate): Boolean;
      Function BuscaUltTGE(xPrv, xTabla, xCampo, xWhere: String): String;
      Function BuscaFecha(PTable, PKey: String; PVal: TDateTime): Boolean;
      Function BuscaCxCDoc(PCia, PDoc, PSerie, PNoDoc: String): Boolean;
   End;

Var
   DMALM: TDMALM;
   wwDCOM1: TDCOMConnection;
   wDinCtbl, wModo, xBorrar: String;
   SRV_E: String;
   SRV_D: String;
   SRV_V: String;
   wRptCia, wRutaRpt, wUrqCia, wCTRL_PCG, wFil_Ccos: String;
   xSQL, HenryParam: String;
   wActuaPresu: Boolean;
   wConsumo, ErrorCount, wAnchoSal, wAnchoIng: Integer;
   xFec_Sis, xHor_Sis, xFec_Emi, wReg_Porc: String;
   xReserva: Double;
   xSigueGrab: Boolean;

Procedure FiltraTabla(xxCds: TwwClientDataSet; xxArchivo, xxCampo, xxOrden: String; xxWhere: String = '');

Function DateS(): TDatetime; // devuelve fecha del servidor
Function BuscaQry(wPrv, wTabla, wCampos, wWhere, wResult: String): String;

Implementation

Uses ALM020;

{$R *.DFM}

Function TDMALM.VerificaPeriodoVentas(sCia: String; dFecha: TDate): Boolean;
Var
   xSQL3: String;
Begin
   Result := False;
  // CONTROL DE FECHAS DE CUENTAS POR COBRAR
   xSQL3 := 'SELECT * FROM CXC312 '
      + 'WHERE CIAID=' + QuotedStr(sCia)
      + ' AND ''' + DateToStr(dFecha) + '''>=CNSPRICIE and ''' + DateToStr(dFecha) + '''<=CNSULTCIE '
      + 'ORDER BY CNSULTCIE DESC';

   cdsQry.Close;
   cdsQry.DataRequest(xSQL3);
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No Existe Periodo Operativo en Cuentas por Cobrar');
      exit;
   End
   Else
   Begin
      If cdsQry.fieldbyname('ESTVEN').AsString = 'C' Then
      Begin
         ShowMessage('No se puede Registrar Documento con Fecha ' + DateToStr(dFecha) + #13 + #13
            + 'Rango Desde ' + DateToStr(cdsQry.fieldbyname('CNSPRICIE').AsDateTime)
            + ' al ' + DateToStr(cdsQry.fieldbyname('CNSULTCIE').AsDateTime) + ' ya fue Cerrado');
         exit;
      End;
      Result := True;
   End;
End;

Function TDMALM.BuscaUltTGE(xPrv, xTabla, xCampo, xWhere: String): String;
Var
   xSQL: String;
Begin
   xSQL := '';
   xSQL := 'Select max(' + xCampo + ') as MaxNum from ' + xTabla;
   If length(xWhere) > 0 Then xSQL := xSQL + ' where ' + xWhere;
   cdsQry2.Close;
   cdsQry2.ProviderName := xPrv;
   cdsQry2.DataRequest(xSQL); //esta es la llamada remota al provider del servidor
   cdsQry2.Open;
   If (cdsQry2.FieldByName('MaxNum').Value = null)
      Or (trim(cdsQry2.FieldByName('MaxNum').AsString) = '') Then
      result := '1'
   Else
   Begin
      result := inttostr(strtoint(Trim(cdsQry2.FieldByName('MaxNum').AsString)) + 1);
   End;
End;

Function TDMALM.BuscaFecha(PTable, PKey: String; PVal: TDateTime): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'select * from ' + PTable + ' ';
   xSQL := xSQL + 'where ' + PKey + '= ' + wRepFuncDate + '''' + FORMATDATETIME(wFormatFecha, PVal) + '''' + ')';
   xSQL := UpperCase(xSQL);
   cdsQry2.Close;
   cdsQry2.ProviderName := 'dspTGE';
   cdsQry2.DataRequest(xSQL); //este es la llamada remota al provider del servidor
   cdsQry2.Open;
   If cdsQry2.RecordCount > 0 Then
      Result := True
   Else
      Result := False;
End;

Function TDMALM.BuscaCxCDoc(PCia, PDoc, PSerie, PNoDoc: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'Select CIAID '
      + '     from CXC301 '
      + '    Where CIAID='+quotedstr(PCia)
      + '      and DOCID='+quotedstr(PDoc)
      + '      and CCSERIE='+quotedstr(PSerie)
      + '      and CCNODOC='+quotedstr(PNoDoc);
   xSQL := UpperCase(xSQL);
   cdsQry.Close;
   cdsQry.ProviderName := 'dspTGE';
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.RecordCount > 0 Then
      result := True
   Else
      result := False;
End;

Function BuscaQry(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
Var
   xSQL: String;
Begin
{ wPrv    = Provider al que hace referencia el cdsQry
  wTabla  = Tabla en la que se va a hacer la búsqueda
  wCampos = Campos que va a considerar en el "select" de sentencia SQL
  wWhere  = Condicional de la búsqueda
  wResult = Resultado que entrega la búsqueda }
   wPrv := 'dspTGE';
   xSQL := 'SELECT ' + wCampos + ' FROM ' + wTabla;
   If length(wWhere) > 0 Then xSQL := xSQL + ' where ' + wWhere;
   xSQL := UpperCase(xSQL);
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;
   If Length(Trim(DMALM.cdsQry.FieldByName(wResult).AsString)) = 0 Then
      result := ''
   Else
      result := DMALM.cdsQry.FieldByName(wResult).AsString;
End;

Procedure TDMALM.GeneraContab(xxCia, xxTDiario, xxAnoMM, xxNoComp: String; xForma: TForm; xTipoC: String);
Var
   xSQL: String;
Begin
 ////  Contabilización en Linea: requiere que en el DM del módulo exista
  ////  cdsMOVCNT debe hacer referencia a la tabla CNT301

  //Para Verificar duplicados
   If xTipoC = 'C' Then
   Begin
      xSQL := 'SELECT CNTCOMPROB ' +
         'FROM CNT301 ' +
         'WHERE CIAID=' + quotedstr(xxCia) + ' ' +
         'AND CNTANOMM=' + quotedstr(xxAnoMM) + ' ' +
         'AND TDIARID=' + quotedstr(xxTDiario) + ' ' +
         'AND CNTCOMPROB=' + quotedstr(xxNoComp);
      cdsQry.Close;
      cdsQry.ProviderName := 'dspTGE';
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      If cdsQry.Recordcount > 0 Then
      Begin
         ShowMessage('Registro Existe en Contabilidad Compañía');
         Exit;
      End;
   End;
 //CreaPanel( xForma, 'Contabilizando' );

   Transferencia_CXP_a_CNT(xxCia, xxTDiario, xxAnoMM, xxNoComp, xTipoC);

   If SOLConta(xxCia, xxTDiario, xxAnoMM, xxNoComp, SRV_D, xTipoC, wModulo,
      cdsMovCNT, cdsNivel, cdsResultSet,
      DCOM1, xForma) Then
   Begin
    //Correcto
   End;

End;

Function DateS: TDatetime;
Var
   sSQL: String;
Begin
   sSQL := ' SELECT ' + DMALM.wRepFecServi + ' FECHA  FROM TGE901 ';
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(sSQL);
   DMALM.cdsQry.Open;
   Result := DMALM.cdsQry.fieldbyname('FECHA').AsDateTime;
End;

Procedure FiltraTabla(xxCds: TwwClientDataSet; xxArchivo, xxCampo, xxOrden: String; xxWhere: String);
Var
   xFiltro, xSQL2: String;
Begin
   DMALM.cdsAcceso.Filtered := False;
   DMALM.cdsAcceso.Filter := '';
   DMALM.cdsAcceso.Filter := 'NTabla=' + '''' + xxArchivo + '''';
   DMALM.cdsAcceso.Filtered := True;

   xFiltro := '';
   DMALM.cdsAcceso.First;
   While Not DMALM.cdsAcceso.Eof Do
   Begin
      If Length(xFiltro) = 0 Then
         xFiltro := xxCampo + '=' + '''' + DMALM.cdsAcceso.FieldByName('CODIGO').AsString + ''''
      Else
         xFiltro := xFiltro + ' OR ' + xxCampo + '=' + '''' + DMALM.cdsAcceso.FieldByName('CODIGO').AsString + '''';

      DMALM.cdsAcceso.Next;
   End;

   If Length(Trim(xFiltro)) > 0 Then
   Begin
      xSQL2 := 'SELECT * FROM ' + xxArchivo + ' WHERE (' + xFiltro + ') ';

      If Length(Trim(xxWhere)) > 0 Then
         xSQL2 := xSQL2 + ' AND (' + xxWhere + ') ';

      If Length(Trim(xxOrden)) > 0 Then
         xSQL2 := xSQL2 + ' ORDER BY ' + xxOrden;

      xxCds.Close;
      xxCds.DataRequest(xSQL2);
   End
   Else
   Begin
      xSQL2 := 'SELECT * FROM ' + xxArchivo;

      If Length(Trim(xxWhere)) > 0 Then
         xSQL2 := xSQL2 + ' WHERE ( ' + xxWhere + ' )';

      If Length(Trim(xxOrden)) > 0 Then
         xSQL2 := xSQL2 + ' ORDER BY ' + xxOrden;

      xxCds.Close;
      xxCds.DataRequest(xSQL2);
   End;
   xxCds.Open;
End;

Procedure TDMALM.cdsPost(xxCds: TwwClientDataSet);
Var
   i: integer;
Begin
   For i := 0 To xxCds.Fields.Count - 1 Do
   Begin
      If xxCds.Fields[i].ClassType = TStringField Then
      Begin
         If xxCds.Fields[i].AsString = '' Then
            xxCds.Fields[i].Clear;
      End;

      If xxCds.Fields[i].ClassType = TMemoField Then
      Begin
         If xxCds.Fields[i].AsString = '' Then
            xxCds.Fields[i].AsString := '.';
      End;
   End;
End;

Procedure TDMALM.AplicaDatos(wCDS: TClientDataSet; wNomArch: String);
Var
   Results, OwnerData: OleVariant;
Begin
   If (wCDS.ChangeCount > 0) Or (wCDS.Modified) Then
   Begin
      wCDS.CheckBrowseMode;
      Results := DCOM1.AppServer.AS_ApplyUpdates(wCDS.ProviderName, wcds.Delta, -1, ErrorCount, OwnerData);
      cdsResultSet.Data := Results;
      wCDS.Reconcile(Results);

   End;
End;

Procedure TDMALM.ControlTran(wControlError: Integer; wCDS: TClientDataSet; wNomArch: String);
Begin
// wControlError=1 errores en el SQL, entra a través del Except
// wControlError=9 para la grabación en línea
// wControlError=0 grabación a través de procesos batch, no actualiza físicamente
// wControlError=8 commit;

   If wControlError = 1 Then
   Begin
      Dcom1.AppServer.RetornaTransaccion;
      ErrorCount := 1;
      ShowMessage('Avise a su Proveedor de Software...( 1 )');
      Application.Terminate;
      Abort;
   End;

   If wControlError = 9 Then
   Begin
      If SRV_D = 'DB2400' Then
      Else
      Begin
         DCOM1.AppServer.IniciaTransaccion;
      End;
      ErrorCount := 0;
   End;

   If (wControlError = 0) Or (wControlError = 9) Then
   Begin
      If wNomArch <> '' Then
      Begin
         If ErrorCount = 0 Then
            AplicaDatos(wCDS, wNomArch);
      End
      Else
      Begin
         If ErrorCount = 0 Then //and ((cdsReqs.ChangeCount > 0) or (cdsReqs.Modified)) then
            AplicaDatos(cdsReqs, 'REQS');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDReqs, 'DREQS');
         If ErrorCount = 0 Then
            AplicaDatos(cdsNIA, 'NIA');
         If ErrorCount = 0 Then // Kdx
            AplicaDatos(cdsKDX, 'KDX');
         If ErrorCount = 0 Then
            AplicaDatos(cdsCNS, 'CNS');
         If ErrorCount = 0 Then // STK
            AplicaDatos(cdsSTK, 'STK');
         If ErrorCount = 0 Then
            AplicaDatos(cdsOCNIA, 'OCNIA');
         If ErrorCount = 0 Then
            AplicaDatos(cdsNIS, 'NIA');
         If ErrorCount = 0 Then
            AplicaDatos(cdsArti, 'ARTI');
         If ErrorCount = 0 Then // ArtiStk
            AplicaDatos(cdsArtiStk, 'ARTI');
         If ErrorCount = 0 Then // ParaRepo
            AplicaDatos(cdsParaRepo, 'PARAREPO');
         If ErrorCount = 0 Then
            AplicaDatos(cdsEArti, 'EARTI');
         If ErrorCount = 0 Then
            AplicaDatos(cdsQArti, 'QARTI');
         If ErrorCount = 0 Then
            AplicaDatos(cdsMGrupo, 'MGRUPO');
         If ErrorCount = 0 Then
            AplicaDatos(cdsGrupos, 'GRUPOS');
         If ErrorCount = 0 Then
            AplicaDatos(cdsUsuarios, 'USUARIOS');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDOCATT, 'DOCATT');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDOCATT2, 'DOCATT2');
         If ErrorCount = 0 Then
            AplicaDatos(cdsCIERRE, 'CIERRE');
         If ErrorCount = 0 Then
            AplicaDatos(cdsCnt300, 'CNT300');
         If ErrorCount = 0 Then
            AplicaDatos(cdsAsiento, 'ASIENTO');
         If ErrorCount = 0 Then
            AplicaDatos(cdsCnt301, 'CNT301');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDAsiento, 'DASIENTO');
         If ErrorCount = 0 Then
            AplicaDatos(cdsAjuSal, 'AJUSAL');
         If ErrorCount = 0 Then
            AplicaDatos(cdsSaldos, 'SALDOS');
         If ErrorCount = 0 Then
            AplicaDatos(cdsKDXSerie, 'KDXSERIE');
         If ErrorCount = 0 Then
            AplicaDatos(cdsPadre, 'PADRE');
         If ErrorCount = 0 Then
            AplicaDatos(cdsHijo, 'HIJO');
         If ErrorCount = 0 Then
            AplicaDatos(cdsNieto, 'NIETO');
         If ErrorCount = 0 Then
            AplicaDatos(cdsSobrino, 'SOBRINO');
         If ErrorCount = 0 Then
            AplicaDatos(cdsCInventario, 'XX');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDInventario, 'XX');
      End;
   End;

   If wControlError = 9 Then
   Begin
      wControlError := 8;
   End;

   If wControlError = 8 Then
      If ErrorCount = 0 Then
         If SRV_D = 'DB2400' Then
         Else
         Begin
            DCOM1.AppServer.GrabaTransaccion;
         End;
   If ErrorCount > 0 Then
   Begin
      If SRV_D = 'DB2400' Then
      Else
      Begin
         DCOM1.AppServer.RetornaTransaccion;
      End;
      ShowMessage('Avise a su Proveedor de Software de OASIS');
      Application.Terminate;
      Abort;
   End;
End;

Procedure TDMALM.ExecSQL(Const cSQL: String);
Begin
   Try
      DCOM1.AppServer.EjecutaSQL(cSQL);
   Except
   End;
End;

Function TDMALM.MaxValue(Const sDetail: String; CD: TDataSet): String;
Var
   iMx: LongInt;
   dsI, dsE: Boolean;
   bmk: TBookMark;
Begin

   iMx := 0;
   bmk := Nil;
   dsI := CD.State = dsInsert;
   dsE := CD.State = dsEdit;

   If CD.RecordCount > 0 Then
   Begin
      If dsE Then bmk := CD.GetBookmark;
      If dsI Or dsE Then CD.Cancel;
      CD.DisableControls;
      CD.First;
      While Not CD.Eof Do
      Begin
         If CD.FieldByName(sDetail).isNull Then
            iMx := 0
         Else
            If CD.FieldByName(sDetail).AsInteger > iMx Then
               iMx := CD.FieldByName(sDetail).AsInteger;
         CD.Next;
      End;
      CD.EnableControls;
      If dsI Then
         CD.Insert
      Else
         If dsE Then CD.Edit;
      If dsE Then
      Begin
         CD.GotoBookmark(bmk);
         CD.FreeBookmark(bmk);
      End;
   End;
   Result := IntToStr(iMx + 1);
End;

Function TDMALM.MaxArt(Const sCIA: String): String;
Var
   sART: String;
Begin
   sART := 'CIAID=''' + sCIA + '''';
   If sCIA = '04' Then
      result := MaxSQLArt04('TGE205', 'ARTID', sART)
   Else
      result := MaxSQL('TGE205', 'ARTID', sART);
End;

Function TDMALM.MaxSQLArt04(Const sTabla, sMxCampo, sCondicion: String): String;
Var
   sSQL, sWhere: String;
Begin
   sWhere := 'WHERE ' + NotLetras(sMxCampo);
   If Length(Trim(sCondicion)) > 0 Then
      sWhere := sWhere + ' AND ' + sCondicion + ' AND ARTID like (''43%'')';

   sSQL := 'SELECT MAX(NVL(' + SMXCAMPO + ',''0'')) AS X FROM ' + sTabla + ' ' + sWhere;

   cdsSql.Close;
   cdsSQL.DataRequest(sSQL);
   cdsSQL.Open;
   If cdsSQL.FieldByName('X').IsNull Then
      result := '1'
   Else
      //result := IntToStr(cdsSQL.FieldByName('X').AsInteger + 1);
      result := FloatToStr(cdsSQL.FieldByName('X').AsFloat + 1);
End;

Function TDMALM.MaxSQL(Const sTabla, sMxCampo, sCondicion: String): String;
Var
   sSQL, sWhere: String;
Begin
   sWhere := 'WHERE ' + NotLetras(sMxCampo);
   If Length(Trim(sCondicion)) > 0 Then
      sWhere := sWhere + ' AND ' + sCondicion;

   sSQL := 'SELECT MAX(NVL(' + SMXCAMPO + ',''0'')) AS X FROM ' + sTabla + ' ' + sWhere;

   cdsSql.Close;
   cdsSQL.DataRequest(sSQL);
   cdsSQL.Open;
   If cdsSQL.FieldByName('X').IsNull Then
      result := '1'
   Else
      //result := IntToStr(cdsSQL.FieldByName('X').AsInteger + 1);
      result := FloatToStr(cdsSQL.FieldByName('X').AsFloat + 1);
End;

Function TDMALM.StrZero(wNumero: String; wLargo: Integer): String;
Var
   i: integer;
   s: String;
Begin
   s := '';
   For i := 1 To wLargo Do
      s := s + '0';
   s := s + trim(wNumero);
   result := copy(s, length(s) - (wLargo - 1), wLargo);
End;

Function TDMALM.IsExistRqs(Const sCIA, sLOCID, sALMID, sRqs: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + '''' + sCIA + '''' + ' AND RQSID =' + '''' + sRqs + ''' AND LOCID=''' + sLOCID + ''' AND ALMID=''' + sALMID + '''';
   result := length(DisplayDescrip('prvTGE', 'LOG308', 'RQSID', sSQL, 'RQSId')) > 0;
End;

Function TDMALM.IsExistSol(Const sCIA, sSol: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + '''' + sCIA + '''' + ' and SCCID =' + '''' + sSol + '''';
   result := length(DisplayDescrip('prvTGE', 'LOG302', 'SCCID', sSQL, 'SCCID')) > 0;
End;

Function TDMALM.IsExistProf(Const sCIA, sPRF, sPRFP: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + '''' + sCIA + '''' + ' and PROFID =' + '''' + sPRF + '''' + ' and PROFNPROV =' + '''' + sPRFP + '''';
   result := length(DisplayDescrip('prvTGE', 'LOG312', 'PROFNPROV', sSQL, 'PROFNPROV')) > 0;
End;

Function TDMALM.MaxSCC(Const sCIA: String): String;
Begin
   result := MaxSQL('LOG302', 'SCCID', 'CIAID=' + '''' + sCIA + '''');
End;

Function TDMALM.MaxPROF(Const sCIA: String): String;
Begin
   result := MaxSQL('LOG312', 'PROFID', 'CIAID=' + '''' + sCIA + '''');
End;

Procedure TDMALM.MultiOpen(Const CDS: Array Of TwwClientDataSet);
Var
   iX: Integer;
Begin
   For iX := 0 To High(CDS) Do
      If Not CDS[iX].Active Then
      Begin
         CDS[iX].Open;
      End;
End;

Procedure TDMALM.MultiClose(Const CDS: Array Of TwwClientDataSet);
Var
   iX: Integer;
Begin
   For iX := 0 To High(CDS) Do
      If CDS[iX].Active Then
      Begin
         CDS[iX].Close;
      End;
End;

Function TDMALM.MaxORD(Const sCIA: String): String;
Begin
   result := MaxSQL('LOG304', 'ODCID', 'CIAID=' + '''' + sCIA + '''');
End;

Function TDMALM.IsExistORD(Const sCIA, sORD: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + '''' + sCIA + '''' + ' and ORDID =' + '''' + sORD + '''';
   result := length(DisplayDescrip('prvTGE', 'LOG304', 'ORDID', sSQL, 'ORDID')) > 0;
End;

Function TDMALM.IsExistART(Const sCIA, sART: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + '''' + sCIA + '''' + ' and ARTID =' + '''' + sART + '''';
   result := length(DisplayDescrip('prvTGE', 'TGE205', 'ARTID', sSQL, 'ARTID')) > 0;
End;

Function TDMALM.IsExistNISA(Const sCIA, sALM, sTIP, sNISA: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=''' + sCIA + ''' and ALMID =''' + sALM + ''' and NISATIP=''' + sTIP + ''' and  NISAID=''' + sNISA + '''';
   result := (length(DisplayDescrip('prvTGE', 'LOG314', 'NISAID', sSQL, 'NISAID')) > 0);
End;

Function TDMALM.MaxNIS(Const sCIA, sALM: String): String;
Begin
   result := MaxSQL('LOG314', 'NISAID',
      'CIAID=' + quotedstr(sCIA)
      + ' and ALMID=' + quotedstr(sALM)
      + ' and NISATIP=' + quotedstr('SALIDA')
      + ' and length(NISAID)=' + inttostr(wAnchoSal)); // tipo Doc. local
End;

Function TDMALM.MaxNIA(Const sCIA, sALM: String): String;
Var
   xSQL, xNumero: String;
Begin
   result := MaxSQL('LOG314', 'NISAID', 'CIAID=''' + sCIA + ''' AND ALMID=''' + sALM + ''' AND NISATIP=''INGRESO'' ');

   xSQL := 'Select to_char(sysdate,''YYYY'') ANO from DUAL';
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;

   If (strtoint(result) = 1) Or (copy(result, 1, 4) <> DMALM.cdsQry.FieldByName('ANO').AsString) Then
   Begin
      If DMALM.cdsQry.FieldByName('ANO').AsString >= '2017' Then
      Begin
         xNumero := DMALM.cdsQry.FieldByName('ANO').AsString + '0001';
         result := xNumero;
      End;
   End;
End;

Function TDMALM.MaxAjuS(Const sCIA, sALM, sTIN, sLOC, sTDA: String): String;
Begin
   result := MaxSQL('LOG314', 'NISAID', 'CIAID=''' + sCIA +
      ''' AND ALMID=''' + sALM + ''' and NISATIP=''SALIDA''' +
      'AND TDAID=''' + sTDA + ''' AND LOCID=''' + sLOC + '''');
End;

Function TDMALM.MaxAjuE(Const sCIA, sALM, sTIN, sLOC, sTDA: String): String;
Begin
   result := MaxSQL('LOG314', 'NISAID', 'CIAID=''' + sCIA +
      ''' and ALMID=''' + sALM + ''' and NISATIP=''INGRESO''' +
      'and TDAID=''' + sTDA + ''' and LOCID=''' + sLOC + '''');
End;

Procedure TDMALM.dClose;
Begin
   MultiClose([cdsArti, cdsCCost,
      cdsCIA,
         cdsGArti,
         cdsUMed,
         cdsUser,
         cdsLEntrega,
         cdsArtPend,
         cdsProv,
         cdsFAB,
         cdsClnArti, cdsQARTI,
         cdsNIS, cdsKDX,
         cdsALM, cdsTDOC,
         cdsSTK, cdsCNS,
         cdsEUNMED, cdsNIA,
         cdsTDNISA, cdsLKTRAN,
         cdsLOC, cdsClient,
         cdsConceptoAlm, cdsLKLOC,
         cdsLKALM
         ]);
End;

Procedure TDMALM.dOpen;
Begin
   MultiOpen([cdsArti,
      cdsCCost,
         cdsCIA,
         cdsGArti,
         cdsUMed,
         cdsUser,
         cdsLEntrega,
         cdsArtPend,
         cdsProv,
         cdsFAB,
         cdsClnArti,
         cdsQARTI,
         cdsNIS,
         cdsKDX,
         cdsALM,
         cdsTDOC,
         cdsSTK,
         cdsCNS,
         cdsEUNMED,
         cdsNIA,
         cdsTDNISA,
         cdsLKTRAN,
         cdsLOC,
         cdsClient,
         cdsConceptoAlm,
         cdsLKLOC,
         cdsLKALM
         ]);
End;

// Hacer la operacion de Num1/Num2, y devuelve el cociente y el resto

Procedure TDMALM.CocienteResto(Num1, Num2: double; Var Cociente, Resto: double);
Begin
   Cociente := 0;
   Resto := 0;
   While (Num1 >= Num2) Do
   Begin
      If Num2 = 0 Then exit;
      Cociente := Cociente + 1;
      Num1 := Num1 - Num2;
   End;
   Resto := Num1;
End;

Procedure TDMALM.CocienteRestoFalta(Num1, Num2: double; Var Cociente, Resto: double);
Begin
   Cociente := 0;
   Resto := 0;
   While (Num1 < 0) Do
   Begin
      Cociente := Cociente - 1;
      Num1 := NUm1 + Num2;
   End;
   Resto := Num1;
End;

Function TDMALM.PeriodoAnterior(Periodo: String): String;
Var
   Y, M: word;
Begin
   Y := StrToInt(copy(Periodo, 1, 4));
   M := StrToInt(copy(Periodo, 5, 2));
   If M = 1 Then
   Begin
      Y := Y - 1;
      M := 12;
   End
   Else
      M := M - 1;
   Result := FormatPeriodo(Y, M);
End;

Function TDMALM.FormatPeriodo(Y, M: Word): String;
Var
   Mes: String;
Begin
   If M > 9 Then
      Mes := IntToStr(M)
   Else
      Mes := '0' + IntToStr(M);
   Result := IntToStr(Y) + Mes;
End;

Procedure TDMALM.ActualizaEstadoOC(sCIA: String);
Var
   sODC, sSQL: String;
   xNumItemsOC, xItemsAtendOC, xItemsParcOC: Integer;
Begin
   cdsOCNIA.First;
   While Not cdsOCNIA.Eof Do
   Begin
      sODC := cdsOCNIA.FieldByName('ODCID').AsString;

   // contar el # de items que tiene la orden
      cdsSQL.Close;
      sSQL := ' Select '
         + '    nvl(sum(1),0) NUMITEMS_OC, '
         + '    nvl(sum(case when ODCEST=''ATENDIDO'' then 1 else 0 end),0) ITEMSATEND_OC, '
         + '    nvl(sum(case when ODCEST=''PARCIAL'' then 1 else 0 end),0) ITEMSPARC_OC '
         + '   from LOG305 '
         + '  where CIAID=' + quotedstr(sCIA)
         + '    and ODCID=' + quotedstr(sODC);
      cdsSQL.DataRequest(sSQL);
      cdsSQL.Open;
      xNumItemsOC := cdsSQL.FieldByName('NUMITEMS_OC').AsInteger;
      xItemsAtendOC := cdsSQL.FieldByName('ITEMSATEND_OC').AsInteger;
      xItemsParcOC := cdsSQL.FieldByName('ITEMSPARC_OC').AsInteger;

      If xNumItemsOC = xItemsAtendOC Then
      Begin
    // la orden ha sido atendida totalmente
         sSQL := ' update LOG304 '
            + '    set ODCEST=''ATENDIDO'' '
            + '  where CIAID=' + quotedstr(sCIA)
            + '    and ODCID=' + quotedstr(sODC);
      End
      Else
         If (xItemsParcOC > 0) Or (xItemsAtendOC > 0) Then
         Begin
         // la orden ha sido atendida parcialmente
            sSQL := ' UPDATE LOG304 '
               + '    SET ODCEST=''PARCIAL'' '
               + '  where CIAID=' + quotedstr(sCIA)
               + '    and ODCID=' + quotedstr(sODC);
         End;
      ExecSQL(sSQL);
      cdsOCNIA.Next;
   End;
End;

Procedure TDMALM.ActualizaOC(sCIA: String; Contenido: Double);
Var
   fCNAT, {fCNT, fCTA,} fCTS: Double;
   fCNATg, fCNATu, fCTSg, fCTSu: Double;
   fCINgresada: Double;
   xSQL, sODCID, sDODCID: String;
Begin
   sODCID := cdsKDX.FieldByName('ODCID').AsString;
   sDODCID := cdsKDX.FieldByName('DODCID').AsString;

   xSQL := 'SELECT * FROM LOG305 WHERE CIAID=' + quotedstr(sCIA) +
      ' AND ODCID=' + quotedstr(sODCID) +
      ' AND DODCID=' + quotedstr(sDODCID);
   cdsDOCATT2.Close;
   cdsDOCATT2.DataRequest(xSQL);
   cdsDOCATT2.Open;
   If cdsDOCATT2.RecordCount = 0 Then
   Begin
      MessageDlg(' Error buscando en la Orden de Compra ' + #13 + sCIA + ';' + sODCID + ';' + sDODCID, mtError, [mbOk], 0);
      exit;
   End;

   fCTS := cdsDOCATT2.FieldByName('DODCCSLD').AsFloat * Contenido + cdsDOCATT2.FieldByName('DODCCSLDU').AsFloat;
   FCNAT := cdsDOCATT2.FieldByName('DODCCATE').AsFloat * Contenido + cdsDOCATT2.FieldByName('DODCCATEU').AsFloat;

   fCIngresada := cdsKDX.FieldByName('KDXCNTG').AsFloat * Contenido + cdsKDX.FieldByName('KDXCNTU').AsFloat;

   fCNAT := fCNAT + fCIngresada;
   fCTS := fCTS - fCIngresada;

   CocienteResto(fCNAT, Contenido, fCNATg, fCNATu);
   CocienteResto(fCTS, Contenido, fCTSg, fCTSu);

   cdsDOCATT2.Edit;
   cdsDOCATT2.FieldByName('DODCCATE').AsFloat := fCNATg;
   cdsDOCATT2.FieldByName('DODCCATEU').AsFloat := fCNATu;
   cdsDOCATT2.FieldByName('DODCCSLD').AsFloat := fCTSg;
   cdsDOCATT2.FieldByName('DODCCSLDU').AsFloat := fCTSu;

   If fCTS <= 0 Then
      cdsDOCATT2.FieldByName('ODCEST').AsString := 'ATENDIDO'
   Else
      cdsDOCATT2.FieldByName('ODCEST').AsString := 'PARCIAL';
End;

Procedure TDMALM.ControlStock(sCIA, sALM, sLOC, sTIN, sArt, Ano, Mes: String; Contenido: Double; IngSal: Char);
Var
   CantidadG, CantidadU: Double;
   PrecioG, PrecioU: Double;
   STKSANTG, STKSANTU: Double;
   CantidadActG, CantidadActU, MontoActG, MontoActU, MontoContenido: Double;
   CntGFName, CntUFName, MntGFName, MntUFName, xSQL: String;
   SumaResta: Char;
Begin
   PrecioG := 0;
   PrecioU := 0;
   SumaResta := 'S';
   If IngSal = 'S' Then
   Begin
  //En el caso de las salidas, los precios se toma del precio de costo promedio del maestro de articulos
      PrecioG := cdsArtiStk.FieldByName('ARTCPROG').AsFloat;
      PrecioU := cdsArtiStk.FieldByName('ARTCPROU').AsFloat;
      SumaResta := 'R';
      cdsKDX.Edit;
      cdsKDX.FieldByName('ARTPCG').AsString := floatToStr(FRound(PrecioG, 15, 5));
      cdsKDX.FieldByName('ARTPCU').AsString := floatToStr(FRound(PrecioU, 15, 5));
      cdsKDX.Post;
   End;
   If IngSal = 'E' Then
   Begin
      IngSal := 'S';
  //En el caso de las salidas, los precios se toma del precio de costo promedio del maestro de articulos
      PrecioG := cdsArtiStk.FieldByName('ARTPCG').AsFloat;
      PrecioU := cdsArtiStk.FieldByName('ARTPCU').AsFloat;
      SumaResta := 'R';
      cdsKDX.Edit;
      cdsKDX.FieldByName('ARTPCG').AsString := floatToStr(FRound(PrecioG, 15, 5));
      cdsKDX.FieldByName('ARTPCU').AsString := floatToStr(FRound(PrecioU, 15, 5));
      cdsKDX.Post;
   End;
   If IngSal = 'I' Then
   Begin
  //En el caso de los ingresos, los precios se toma del precio de ingreso de la nota
      PrecioG := cdsKDX.FieldByName('ARTPCG').AsFloat;
      PrecioU := cdsKDX.FieldByName('ARTPCU').AsFloat;
      SumaResta := 'S';
   End;

   If IngSal = 'N' Then // Sirve para Insertar cuando no tiene mov. en el año
   Begin
      CantidadG := cdsKDX.FieldByName('STKSACTG').AsFloat;
      CantidadU := cdsKDX.FieldByName('STKSACTU').AsFloat;
   End
   Else
   Begin
      CantidadG := cdsKDX.FieldByName('KDXCNTG').AsFloat;
      CantidadU := cdsKDX.FieldByName('KDXCNTU').AsFloat;

      cdsKDX.Edit;
      cdsKDX.FieldByName('NISSIT').AsString := 'ACEPTADO';
      cdsKDX.FieldByName('ARTTOTALG').AsString := floatToStr(FRound(CantidadG * PrecioG, 15, 5));
      cdsKDX.FieldByName('ARTTOTALU').AsString := floatToStr(FRound(CantidadU * PrecioU, 15, 5));
      cdsKDX.FieldByName('ARTTOTAL').AsString := floatToStr(FRound(cdsKDX.FieldByName('ARTTOTALG').AsFloat + cdsKDX.FieldByName('ARTTOTALU').AsFloat, 15, 5));
      cdsPost(cdsKDX);

   End;
   STKSANTG := 0;
   STKSANTU := 0;
   CantidadActG := 0;
   CantidadActU := 0;
   MontoActG := 0;
   MontoActU := 0;

   CntGFName := 'STK' + IngSal + 'SG' + Mes;
   CntUFName := 'STK' + IngSal + 'SU' + Mes;
   MntGFName := 'STK' + IngSal + 'MG' + Mes;
   MntUFName := 'STK' + IngSal + 'MU' + Mes;

   If DMALM.cdsSTK.IndexFieldNames <> 'STKANO;CIAID;LOCID;TINID;ALMID;ARTID' Then
      DMALM.cdsSTK.IndexFieldNames := 'STKANO;CIAID;LOCID;TINID;ALMID;ARTID';

   cdsSTK.SetKey;
   cdsSTK.fieldbyname('STKANO').AsString := ANO;
   cdsSTK.fieldbyname('CIAID').AsString := sCIA;
   cdsSTK.fieldbyname('LOCID').AsString := sLOC;
   cdsSTK.fieldbyname('TINID').AsString := sTIN;
   cdsSTK.fieldbyname('ALMID').AsString := sALM;
   cdsSTK.fieldbyname('ARTID').AsString := sART;
   If Not cdsSTK.Gotokey Then
   Begin
      xSQL := 'CIAID=' + QuotedStr(sCIA) + ' AND LOCID=' + QuotedStr(sLOC) + ' AND ' +
         'TINID=' + QuotedStr(sTIN) + ' AND ALMID=' + QuotedStr(sALM) + ' AND ' +
         'ARTID=' + QuotedStr(sART) + ' AND STKANO=' + QuotedStr(InttoStr(StrtoInt(ANO) - 1));
      displaydescrip('prvTGE', 'LOG316', 'CIAID, LOCID, TINID, ALMID, ' +
         'STKSACTG, STKSACTU, ' +
         'STKTSG12, STKISG12, STKSSG12, ' +
         'STKTSU12, STKISU12, STKSSU12, ' +
         'STKTMG12, STKIMG12, STKSMG12, ' +
         'STKTMU12, STKIMU12, STKSMU12', xSQL, 'STKSACTG');
  // Guardar los saldos finales del año anterior para despues asignarlos a los
  // saldos iniciales del nuevo registro
      If cdsQry.RecordCount > 0 Then
      Begin
         STKSANTG := cdsQry.FieldByName('STKSACTG').AsFloat;
         STKSANTU := cdsQry.FieldByName('STKSACTU').AsFloat;
      End;

      Try
         cdsSTK.Insert;
         cdsSTK.FieldbyName('CIAID').AsString := sCIA;
         cdsSTK.FieldbyName('LOCID').AsString := sLOC;
         cdsSTK.FieldbyName('TINID').AsString := sTIN;
         cdsSTK.FieldbyName('ALMID').AsString := sALM;
         cdsSTK.FieldbyName('STKANO').AsString := Ano;
         cdsSTK.FieldbyName('ARTID').AsString := sART;
         cdsSTK.FieldByName('STKSANTG').AsFloat := FRound(STKSANTG, 15, 5);
         cdsSTK.FieldByName('STKSANTU').AsFloat := FRound(STKSANTU, 15, 5);
         cdsSTK.FieldByName('STKSACTG').AsFloat := FRound(STKSANTG, 15, 5);
         cdsSTK.FieldByName('STKSACTU').AsFloat := FRound(STKSANTU, 15, 5);
         cdsSTK.FieldByName('STKRACTG').AsFloat := xReserva;
         cdsSTK.FieldByName('ARTDES').AsString := cdsArtiStk.FieldByName('ARTDES').AsString;
      Except
         xSQL := ' ';
      End;
      cdsSTK.FieldbyName('GRARID').AsString := cdsArtiStk.FieldbyName('GRARID').AsString;
      cdsSTK.FieldbyName('ARTCONT').AsFloat := cdsArtiStk.FieldbyName('ARTCONT').AsFloat;
      cdsSTK.FieldbyName('UNMIDG').AsString := cdsArtiStk.FieldbyName('UNMIDG').AsString;
      cdsSTK.FieldbyName('UNMIDU').AsString := cdsArtiStk.FieldbyName('UNMIDU').AsString;
      cdsSTK.FieldbyName('FABID').AsString := cdsArtiStk.FieldbyName('FABID').AsString;
      cdsSTK.FieldbyName('ARTSPRO').AsString := cdsArtiStk.FieldbyName('ARTSPRO').AsString;
      cdsSTK.FieldbyName('ARTSCA').AsString := cdsArtiStk.FieldbyName('ARTSCA').AsString;
      cdsSTK.FieldbyName('ARTPARA').AsString := cdsArtiStk.FieldbyName('ARTPARA').AsString;
      cdsSTK.FieldbyName('ARTSNA').AsString := cdsArtiStk.FieldbyName('ARTSNA').AsString;
      cdsSTK.FieldbyName('ARTFUC').AsDateTime := cdsArtiStk.FieldbyName('ARTFUC').AsDateTime;
      cdsSTK.FieldbyName('TMONID').AsString := cdsArtiStk.FieldbyName('TMONID').AsString;
      cdsSTK.FieldbyName('ARTCRGO').AsString := cdsArtiStk.FieldbyName('ARTCRGO').AsString;
      cdsSTK.FieldbyName('ARTACTIVO').AsString := cdsArtiStk.FieldbyName('ARTACTIVO').AsString;
      cdsSTK.FieldbyName('CUENTAID').AsString := cdsArtiStk.FieldbyName('CUENTAID').AsString;
      cdsSTK.FieldbyName('FAMID').AsString := cdsArtiStk.FieldbyName('FAMID').AsString;
      cdsSTK.FieldbyName('SFAMID').AsString := cdsArtiStk.FieldbyName('SFAMID').AsString;
      cdsSTK.FieldbyName('CLASEID').AsString := cdsArtiStk.FieldbyName('CLASEID').AsString;
      cdsSTK.FieldbyName('SCLASEID').AsString := cdsArtiStk.FieldbyName('SCLASEID').AsString;
      cdsSTK.FieldByName('STKTSG01').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG01').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU01').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU01').AsFloat := 0;
      If (STKSANTG > 0) Or (STKSANTU > 0) Then
      Begin
         If Contenido > 1 Then
         Begin
            If (cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat) >= cdsSTK.FieldbyName('ARTCONT').AsFloat) Then
            Begin
               If cdsQry.FieldByName('STKSSU12').AsFloat > cdsQry.FieldByName('STKISU12').AsFloat Then
               Begin
     //	Se Determina el Precio Unitario
                  If cdsQry.FieldByName('STKSSG12').AsFloat > 0 Then
                     MontoContenido := cdsQry.FieldByName('STKSMG12').AsFloat / cdsQry.FieldByName('STKSSG12').AsFloat
                  Else
                     MontoContenido := cdsQry.FieldByName('STKIMG12').AsFloat / cdsQry.FieldByName('STKISG12').AsFloat;
                  cdsQry.Edit;

     // Cantidades
                  cdsQry.FieldByName('STKISG12').AsFloat := cdsQry.FieldByName('STKISG12').AsFloat - 1;
                  cdsQry.FieldByName('STKISU12').AsFloat := cdsQry.FieldByName('STKISU12').AsFloat + Contenido;
     // Montos
                  MontoContenido := FRound(MontoContenido, 15, 5);
                  cdsQry.FieldByName('STKSMG12').AsString := floatToStr(FRound(cdsQry.FieldByName('STKSMG12').AsFloat + MontoContenido, 15, 5));
                  cdsQry.FieldByName('STKIMU12').AsString := floatToStr(FRound(cdsQry.FieldByName('STKIMU12').AsFloat + MontoContenido, 15, 5));
                  cdsQry.Post;
               End;
            End;
         End;
         cdsSTK.FieldByName('STKTSG01').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG01').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU01').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU01').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));
      End;
      cdsSTK.FieldByName('STKISG01').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG01').AsFloat := 0;
      cdsSTK.FieldByName('STKIMG01').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG01').AsFloat := 0;
      cdsSTK.FieldByName('STKISU01').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU01').AsFloat := 0;
      cdsSTK.FieldByName('STKIMU01').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU01').AsFloat := 0;
      cdsSTK.FieldByName('STKTSG02').AsString := cdsSTK.FieldByName('STKTSG01').AsString;
      cdsSTK.FieldByName('STKISG02').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG02').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG02').AsString := cdsSTK.FieldByName('STKTMG01').AsString;
      cdsSTK.FieldByName('STKIMG02').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG02').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU02').AsString := cdsSTK.FieldByName('STKTSU01').AsString;
      cdsSTK.FieldByName('STKISU02').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU02').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU02').AsString := cdsSTK.FieldByName('STKTMU01').AsString;
      cdsSTK.FieldByName('STKIMU02').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU02').AsFloat := 0;
      cdsSTK.FieldByName('STKTSG03').AsString := cdsSTK.FieldByName('STKTSG01').AsString;
      cdsSTK.FieldByName('STKISG03').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG03').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG03').AsString := cdsSTK.FieldByName('STKTMG01').AsString;
      cdsSTK.FieldByName('STKIMG03').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG03').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU03').AsString := cdsSTK.FieldByName('STKTSU01').AsString;
      cdsSTK.FieldByName('STKISU03').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU03').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU03').AsString := cdsSTK.FieldByName('STKTMU01').AsString;
      cdsSTK.FieldByName('STKIMU03').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU03').AsFloat := 0;
      cdsSTK.FieldByName('STKTSG04').AsString := cdsSTK.FieldByName('STKTSG01').AsString;
      cdsSTK.FieldByName('STKISG04').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG04').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG04').AsString := cdsSTK.FieldByName('STKTMG01').AsString;
      cdsSTK.FieldByName('STKIMG04').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG04').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU04').AsString := cdsSTK.FieldByName('STKTSU01').AsString;
      cdsSTK.FieldByName('STKISU04').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU04').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU04').AsString := cdsSTK.FieldByName('STKTMU01').AsString;
      cdsSTK.FieldByName('STKIMU04').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU04').AsFloat := 0;
      cdsSTK.FieldByName('STKTSG05').AsString := cdsSTK.FieldByName('STKTSG01').AsString;
      cdsSTK.FieldByName('STKISG05').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG05').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG05').AsString := cdsSTK.FieldByName('STKTMG01').AsString;
      cdsSTK.FieldByName('STKIMG05').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG05').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU05').AsString := cdsSTK.FieldByName('STKTSU01').AsString;
      cdsSTK.FieldByName('STKISU05').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU05').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU05').AsString := cdsSTK.FieldByName('STKTMU01').AsString;
      cdsSTK.FieldByName('STKIMU05').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU05').AsFloat := 0;
      cdsSTK.FieldByName('STKTSG06').AsString := cdsSTK.FieldByName('STKTSG01').AsString;
      cdsSTK.FieldByName('STKISG06').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG06').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG06').AsString := cdsSTK.FieldByName('STKTMG01').AsString;
      cdsSTK.FieldByName('STKIMG06').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG06').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU06').AsString := cdsSTK.FieldByName('STKTSU01').AsString;
      cdsSTK.FieldByName('STKISU06').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU06').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU06').AsString := cdsSTK.FieldByName('STKTMU01').AsString;
      cdsSTK.FieldByName('STKIMU06').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU06').AsFloat := 0;
      cdsSTK.FieldByName('STKTSG07').AsString := cdsSTK.FieldByName('STKTSG01').AsString;
      cdsSTK.FieldByName('STKISG07').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG07').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG07').AsString := cdsSTK.FieldByName('STKTMG01').AsString;
      cdsSTK.FieldByName('STKIMG07').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG07').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU07').AsString := cdsSTK.FieldByName('STKTSU01').AsString;
      cdsSTK.FieldByName('STKISU07').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU07').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU07').AsString := cdsSTK.FieldByName('STKTMU01').AsString;
      cdsSTK.FieldByName('STKIMU07').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU07').AsFloat := 0;
      cdsSTK.FieldByName('STKTSG08').AsString := cdsSTK.FieldByName('STKTSG01').AsString;
      cdsSTK.FieldByName('STKISG08').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG08').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG08').AsString := cdsSTK.FieldByName('STKTMG01').AsString;
      cdsSTK.FieldByName('STKIMG08').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG08').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU08').AsString := cdsSTK.FieldByName('STKTSU01').AsString;
      cdsSTK.FieldByName('STKISU08').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU08').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU08').AsString := cdsSTK.FieldByName('STKTMU01').AsString;
      cdsSTK.FieldByName('STKIMU08').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU08').AsFloat := 0;
      cdsSTK.FieldByName('STKTSG09').AsString := cdsSTK.FieldByName('STKTSG01').AsString;
      cdsSTK.FieldByName('STKISG09').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG09').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG09').AsString := cdsSTK.FieldByName('STKTMG01').AsString;
      cdsSTK.FieldByName('STKIMG09').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG09').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU09').AsString := cdsSTK.FieldByName('STKTSU01').AsString;
      cdsSTK.FieldByName('STKISU09').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU09').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU09').AsString := cdsSTK.FieldByName('STKTMU01').AsString;
      cdsSTK.FieldByName('STKIMU09').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU09').AsFloat := 0;
      cdsSTK.FieldByName('STKTSG10').AsString := cdsSTK.FieldByName('STKTSG01').AsString;
      cdsSTK.FieldByName('STKISG10').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG10').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG10').AsString := cdsSTK.FieldByName('STKTMG01').AsString;
      cdsSTK.FieldByName('STKIMG10').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG10').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU10').AsString := cdsSTK.FieldByName('STKTSU01').AsString;
      cdsSTK.FieldByName('STKISU10').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU10').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU10').AsString := cdsSTK.FieldByName('STKTMU01').AsString;
      cdsSTK.FieldByName('STKIMU10').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU10').AsFloat := 0;
      cdsSTK.FieldByName('STKTSG11').AsString := cdsSTK.FieldByName('STKTSG01').AsString;
      cdsSTK.FieldByName('STKISG11').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG11').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG11').AsString := cdsSTK.FieldByName('STKTMG01').AsString;
      cdsSTK.FieldByName('STKIMG11').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG11').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU11').AsString := cdsSTK.FieldByName('STKTSU01').AsString;
      cdsSTK.FieldByName('STKISU11').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU11').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU11').AsString := cdsSTK.FieldByName('STKTMU01').AsString;
      cdsSTK.FieldByName('STKIMU11').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU11').AsFloat := 0;
      cdsSTK.FieldByName('STKTSG12').AsString := cdsSTK.FieldByName('STKTSG01').AsString;
      cdsSTK.FieldByName('STKISG12').AsFloat := 0;
      cdsSTK.FieldByName('STKSSG12').AsFloat := 0;
      cdsSTK.FieldByName('STKTMG12').AsString := cdsSTK.FieldByName('STKTMG01').AsString;
      cdsSTK.FieldByName('STKIMG12').AsFloat := 0;
      cdsSTK.FieldByName('STKSMG12').AsFloat := 0;
      cdsSTK.FieldByName('STKTSU12').AsString := cdsSTK.FieldByName('STKTSU01').AsString;
      cdsSTK.FieldByName('STKISU12').AsFloat := 0;
      cdsSTK.FieldByName('STKSSU12').AsFloat := 0;
      cdsSTK.FieldByName('STKTMU12').AsString := cdsSTK.FieldByName('STKTMU01').AsString;
      cdsSTK.FieldByName('STKIMU12').AsFloat := 0;
      cdsSTK.FieldByName('STKSMU12').AsFloat := 0;
      cdsSTK.FieldbyName('STKSFISG').AsFloat := 0;
      cdsSTK.FieldbyName('STKSFISU').AsFloat := 0;
      cdsSTK.FieldbyName('STKSMAXG').AsFloat := 0;
      cdsSTK.FieldbyName('STKSMAXU').AsFloat := 0;
      cdsSTK.FieldbyName('STKSMING').AsFloat := 0;
      cdsSTK.FieldbyName('STKSMINU').AsFloat := 0;

      If IngSal = 'N' Then // Sirve para Insertar cuando no tiene mov. en el año
      Begin
         cdsSTK.FieldByName('STKTSG02').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG02').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU02').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU02').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));

         cdsSTK.FieldByName('STKTSG03').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG03').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU03').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU03').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));

         cdsSTK.FieldByName('STKTSG04').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG04').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU04').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU04').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));

         cdsSTK.FieldByName('STKTSG05').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG05').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU05').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU05').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));

         cdsSTK.FieldByName('STKTSG06').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG06').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU06').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU06').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));

         cdsSTK.FieldByName('STKTSG07').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG07').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU07').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU07').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));

         cdsSTK.FieldByName('STKTSG08').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG08').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU08').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU08').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));

         cdsSTK.FieldByName('STKTSG09').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG09').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU09').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU09').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));

         cdsSTK.FieldByName('STKTSG10').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG10').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU10').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU10').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));

         cdsSTK.FieldByName('STKTSG11').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG11').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU11').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU11').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));

         cdsSTK.FieldByName('STKTSG12').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMG12').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTSU12').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 5));
         cdsSTK.FieldByName('STKTMU12').AsString := floatToStr(FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 5));
      End;

      cdsPost(cdsSTK);
      cdsSTK.Post;
   End
   Else
   Begin
      If IngSal <> 'N' Then // Sirve para Insertar cuando no tiene mov. en el año
      Begin
         CantidadActG := cdsSTK.FieldByName(CntGFName).AsFloat; // STKISG03
         CantidadActU := cdsSTK.FieldByName(CntUFName).AsFloat; // STKISU03
         MontoActG := cdsSTK.FieldByName(MntGFName).AsFloat; // STKIMG03
         MontoActU := cdsSTK.FieldByName(MntUFName).AsFloat; // STKIMU03
      End;
   End;

   If IngSal <> 'N' Then // Sirve para Insertar cuando no tiene mov. en el año
   Begin
      cdsSTK.Edit;

  // aqui calcula los totales Ingresos y Salidas de las columnas del mes del LOG316
      ActualizaCantidadMonto(CantidadG, CantidadU, Contenido, 'S', PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU);

      cdsSTK.FieldByName(CntGFName).AsString := floatToStr(FRound(CantidadActG, 15, 5));
      cdsSTK.FieldByName(CntUFName).AsString := floatToStr(FRound(CantidadActU, 15, 5));
      cdsSTK.FieldByName(MntGFName).AsString := floatToStr(FRound(MontoActG, 15, 5));
      cdsSTK.FieldByName(MntUFName).AsString := floatToStr(FRound(MontoActU, 15, 5));

  // aqui calcula los totales Ingresos y Salidas en general del LOG316
      CantidadActG := cdsSTK.FieldByName('STKSACTG').AsFloat;
      CantidadActU := cdsSTK.FieldByName('STKSACTU').AsFloat;

      ActualizaCantidad(CantidadG, CantidadU, Contenido, SumaResta, CantidadActG, CantidadActU);

      cdsSTK.FieldByName('STKSACTG').AsString := floatToStr(FRound(CantidadActG, 15, 5));
      cdsSTK.FieldByName('STKSACTU').AsString := floatToStr(FRound(CantidadActU, 15, 5));

      If Contenido > 1 Then
         cdsSTK.FieldByName('STKMACTG').AsString := floatToStr(FRound(CantidadActG * PrecioU * Contenido, 15, 4))
      Else
         cdsSTK.FieldByName('STKMACTG').AsString := floatToStr(FRound(CantidadActG * PrecioG, 15, 5));
      cdsSTK.FieldByName('STKMACTU').AsString := floatToStr(FRound(CantidadActU * PrecioU, 15, 5));
      cdsPost(cdsSTK);
      cdsSTK.Post;
   End
   Else
   Begin
      cdsSTK.Edit;
      CantidadActG := cdsSTK.FieldByName('STKSACTG').AsFloat;
      CantidadActU := cdsSTK.FieldByName('STKSACTU').AsFloat;

      cdsSTK.FieldByName('STKSACTG').AsString := floatToStr(FRound(CantidadActG, 15, 5));
      cdsSTK.FieldByName('STKSACTU').AsString := floatToStr(FRound(CantidadActU, 15, 5));
      cdsSTK.FieldByName('STKMACTG').AsString := floatToStr(FRound(CantidadActG * PrecioU * Contenido, 15, 5)); // 41 * 0.5031 * 48
      cdsSTK.FieldByName('STKMACTU').AsString := floatToStr(FRound(CantidadActU * PrecioU, 15, 5)); // CONTROL DE STOCK
      cdsSTK.FieldByName('STKRACTG').AsString := floatToStr(xReserva);
   End;

End;

{ Actualiza las cantidades y montos de los articulos a nivel de empresa }
{ INP: Kardex (detalle de la nota), cdsKDX
 OUP: Maestro de Artículo, cdsArt}

Procedure TDMALM.ActualizaArticulo(sCIA, sArt: String; Contenido: Double; IngSal: Char);
Var
   CantidadActG, CantidadActU, MontoActG, MontoActU: Double;
   CantidadG, CantidadU, PrecioG, PrecioU: Double;
   SumaResta: Char;
Begin
   If (IngSal <> 'S') And (IngSal <> 'I') And (IngSal <> 'E') Then
   Begin
      showMessage('Error en parámetro para actualizar Maestro de Artículos');
      exit;
   End;

   If IngSal = 'S' Then
   Begin
      PrecioG := FRound(cdsArtiStk.FieldByName('ARTCPROG').AsFloat, 15, 5);
      PrecioU := FRound(cdsArtiStk.FieldByName('ARTCPROU').AsFloat, 15, 5);
      SumaResta := 'R';
   End;
   If IngSal = 'E' Then
   Begin
      PrecioG := FRound(cdsArtiStk.FieldByName('ARTPCG').AsFloat, 15, 5);
      PrecioU := FRound(cdsArtiStk.FieldByName('ARTPCU').AsFloat, 15, 5);
      SumaResta := 'R';
   End;
   If IngSal = 'I' Then
   Begin
      PrecioG := cdsKDX.FieldByName('ARTPCG').AsFloat;
      PrecioU := cdsKDX.FieldByName('ARTPCU').AsFloat;
      SumaResta := 'S';
   End;
   CantidadG := cdsKDX.FieldByName('KDXCNTG').AsFloat;
   CantidadU := cdsKDX.FieldByName('KDXCNTU').AsFloat;

   CantidadActG := cdsArtiStk.FieldByName('ARTCNTG').AsFloat;
   CantidadActU := cdsArtiStk.FieldByName('ARTCNTU').AsFloat;
   MontoActG := cdsArtiStk.FieldByName('ARTMNTG').AsFloat;
   MontoActU := cdsArtiStk.FieldByName('ARTMNTU').AsFloat;

   If IngSal = 'E' Then
   Begin
      IngSal := 'S';
      ActualizaCantidadMontoDev(CantidadG, CantidadU, Contenido, SumaResta, PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU);
      IngSal := 'E'
   End
   Else
   Begin
      ActualizaCantidadMonto(CantidadG, CantidadU, Contenido, SumaResta, PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU);
   End;

   cdsArtiStk.edit;
   cdsArtiStk.FieldByName('ARTCNTG').AsString := floatToStr(FRound(CantidadActG, 15, 5));
   cdsArtiStk.FieldByName('ARTCNTU').AsString := floatToStr(FRound(CantidadActU, 15, 5));
   cdsArtiStk.FieldByName('ARTMNTG').AsString := floatToStr(FRound(MontoActG, 15, 5));
   cdsArtiStk.FieldByName('ARTMNTU').AsString := floatToStr(FRound(MontoActU, 15, 5));
   If (cdsArtiStk.FieldByName('ARTMNTG').AsFloat = 0) And (cdsArtiStk.FieldByName('ARTCNTG').AsFloat = 0) Then
      cdsArtiStk.FieldByName('ARTCPROG').AsFloat := 0
   Else
      cdsArtiStk.FieldByName('ARTCPROG').AsString := floatToStr(FRound(cdsArtiStk.FieldByName('ARTMNTG').AsFloat / cdsArtiStk.FieldByName('ARTCNTG').AsFloat, 15, 5));

   cdsArtiStk.FieldByName('ARTCPROU').AsString := floatToStr(FRound(PrecioU, 15, 5));
   cdsSTK.Edit;
   cdsSTK.FieldByName('STKMACTG').AsString := floatToStr(FRound(MontoActG, 15, 5));
   cdsSTK.FieldByName('STKMACTU').AsString := floatToStr(FRound(PrecioU, 15, 5));

   If IngSal = 'E' Then
   Begin
      IngSal := 'S';
      cdsArtiStk.FieldByName('ARTPCG').AsString := floatToStr(FRound(cdsArtiStk.FieldByName('COSTOANT').AsFloat, 15, 5));
   End;

   If IngSal = 'I' Then
   Begin
      If (cdsKDX.FieldByName('TRIID').AsString = '01') Or (cdsKDX.FieldByName('TRIID').AsString = '02') Or
         (cdsKDX.FieldByName('TRIID').AsString = '09') Or (cdsKDX.FieldByName('TRIID').AsString = '11') Or
         (cdsKDX.FieldByName('TRIID').AsString = '16') Then
      Begin
         cdsArtiStk.FieldByName('COSTOANT').AsString := floatToStr(FRound(cdsArtiStk.FieldByName('ARTPCG').AsFloat, 15, 5));
         cdsArtiStk.FieldByName('ARTFUC').AsDateTime := cdsKDX.FieldByName('NISAFREG').AsDateTime;
         cdsArtiStk.FieldByName('ARTPCG').AsString := floatToStr(FRound(cdsKDX.FieldByName('ARTPCG').AsFloat, 15, 5));
         cdsArtiStk.FieldByName('ARTPCU').AsString := floatToStr(FRound(cdsKDX.FieldByName('ARTPCU').AsFloat, 15, 5));
         cdsArtiStk.FieldByName('ARTFUPRC').AsDateTime := cdsKDX.FieldByName('NISAFREG').AsDateTime;
      End;
   End;
   cdsArtiStk.FieldByName('ARTFUMV').AsDateTime := cdsKDX.FieldByName('NISAFREG').AsDateTime;
End;

{ Actualiza el flag de estado a aceptado para el actual registro de la nota de Ingreso }

Procedure TDMALM.ActualizaSituacion(IngSal: Char);
Begin
   If IngSal = 'I' Then
   Begin
      cdsNIA.Edit;
      cdsNIA.FieldByName('NISSIT').AsString := 'ACEPTADO'; // Aceptado
      cdsNIA.Post;
   End
   Else
   Begin
      cdsNIS.Edit;
      cdsNIS.FieldByName('NISSIT').AsString := 'ACEPTADO'; // Aceptado
      cdsNIS.Post;
   End;
End;

Procedure TDMALM.ActualizaCantidadMonto(CantidadG, CantidadU, Contenido: double; SumaResta: Char;
   Var PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU: Double);
Var
   CantidadUT, AcarreoG, MontoAcarreo, xTotalPlata, xCantTotalU: Double;
Begin
 // En el caso de resta, invertimos el signo de las cantidades
   If (SumaResta = 'R') Then
   Begin
      CantidadG := -CantidadG;
      CantidadU := -CantidadU;
   End;
   If SumaResta = 'S' Then
   Begin
      xTotalPlata := MontoActG + MontoActU + PrecioG * CantidadG + PrecioU * CantidadU;
      xCantTotalU := CantidadActG * Contenido + CantidadActU + CantidadG * Contenido + CantidadU;
      If xCantTotalU > 0 Then
      Begin
         PrecioU := xTotalPlata / xCantTotalU;
         PrecioU := FRound(PrecioU, 15, 5);
      End;
   End;
   CantidadUT := CantidadActU + CantidadU;
   AcarreoG := 0;
   MontoAcarreo := 0;
   If SumaResta = 'S' Then
      CocienteResto(CantidadUT, Contenido, AcarreoG, CantidadU)
   Else
   Begin
      CocienteRestoFalta(CantidadUT, Contenido, AcarreoG, CantidadU);
   End;
   MontoAcarreo := AcarreoG * PrecioU * Contenido;
   CantidadActG := CantidadActG + CantidadG + AcarreoG;
   CantidadActU := CantidadU;

   If SumaResta = 'S' Then
   Begin
      PrecioG := 0;
      If Contenido > 1 Then
         PrecioG := PrecioU * Contenido
      Else
         If CantidadActG > 0 Then
            PrecioG := PrecioU;
   End;

   MontoActG := CantidadActG * PrecioG;
   MontoActU := CantidadU * PrecioU;

   If Contenido = 1 Then
      PrecioU := 0;
End;

Procedure TDMALM.ActualizaCantidadMontoDev(CantidadG, CantidadU, Contenido: double; SumaResta: Char;
   Var PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU: Double);
Var
   CantidadUT, AcarreoG, MontoAcarreo, xTotalPlata, xCantTotalU: Double;
Begin
 // En el caso de resta, invertimos el signo de las cantidades
   If (SumaResta = 'R') Then
   Begin
      CantidadG := -CantidadG;
      CantidadU := -CantidadU;
   End;
   If SumaResta = 'S' Then
   Begin
      xTotalPlata := MontoActG + MontoActU + PrecioG * CantidadG + PrecioU * CantidadU;
      xCantTotalU := CantidadActG * Contenido + CantidadActU + CantidadG * Contenido + CantidadU;
      If xCantTotalU > 0 Then
      Begin
         PrecioU := xTotalPlata / xCantTotalU;
         PrecioU := FRound(PrecioU, 15, 5);
      End;
   End;
   CantidadUT := CantidadActU + CantidadU;
   AcarreoG := 0;
   MontoAcarreo := 0;
   If SumaResta = 'S' Then
      CocienteResto(CantidadUT, Contenido, AcarreoG, CantidadU)
   Else
   Begin
      CocienteRestoFalta(CantidadUT, Contenido, AcarreoG, CantidadU);
   End;
   MontoAcarreo := AcarreoG * PrecioU * Contenido;
   CantidadActG := CantidadActG + CantidadG + AcarreoG;
   CantidadActU := CantidadU;

   If SumaResta = 'S' Then
   Begin
      PrecioG := 0;
      If Contenido > 1 Then
         PrecioG := PrecioU * Contenido
      Else
         If CantidadActG > 0 Then
            PrecioG := PrecioU;
   End;

   MontoActG := MontoActG + (CantidadG * PrecioG);
   MontoActU := CantidadU * PrecioU;

   If Contenido = 1 Then
      PrecioU := 0;
End;

Procedure TDMALM.ActualizaCantidad(CantidadG, CantidadU, Contenido: double; SumaResta: Char;
   Var CantidadActG, CantidadActU: Double);
Var
   CantidadUT: Double;
   AcarreoG: Double;
Begin
 // En el caso de resta, inverimos el signo de las cantidades
   If (SumaResta = 'R') Then
   Begin
      CantidadG := -CantidadG;
      CantidadU := -CantidadU;
   End;

   CantidadUT := CantidadActU + CantidadU;
   If SumaResta = 'S' Then
      CocienteResto(CantidadUT, Contenido, AcarreoG, CantidadU)
   Else
      CocienteRestoFalta(CantidadUT, Contenido, AcarreoG, CantidadU);
   CantidadActG := CantidadActG + CantidadG + AcarreoG;
   CantidadActU := CantidadU;
End;

/////////////////////////////////////////////////////////////////////////
//                                                                     //
//   Actualiza Saldos Inicales Generales y Unitarios de Stock y Monto  //
//                                                								     //
/////////////////////////////////////////////////////////////////////////

Procedure TDMALM.SaldosIniciales(sCIA, sArt, xAnoMes: String; sContenido, sPrecio: Double);
Var
   xMes: Integer;
   xPrestUniG, xPrestUniU, xPrestPrecio: double;
Begin
   xMes := StrtoInt(copy(xAnoMes, 5, 2));
   cdsstk.Edit; //  SALDOS INICIALES

   If sContenido > 1 Then
   Begin
 // Saldos Iniciales de Febrero
      If XMes <= 1 Then
      Begin
         xPrestUniG := 0; // Acarreo a descontar de la cantidad general
         xPrestUniU := 0; // Contenido del artículo a prestar a la cantidad unitaria
         xPrestPrecio := 0; // Precio a considerar en acarreo
         If cdsSTK.FieldByName('STKSSU01').AsFloat > (cdsSTK.FieldByName('STKTSU01').AsFloat + cdsSTK.FieldByName('STKISU01').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG02').AsFloat := FRound(cdsSTK.FieldByName('STKTSG01').AsFloat
            + cdsSTK.FieldByName('STKISG01').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG01').AsFloat, 15, 4);

         cdsSTK.FieldByName('STKTSU02').AsFloat := FRound(cdsSTK.FieldByName('STKTSU01').AsFloat
            + cdsSTK.FieldByName('STKISU01').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU01').AsFloat, 15, 4);

         cdsSTK.FieldByName('STKTMG02').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSG02').AsFloat * sPrecio, 15, 5));
         cdsSTK.FieldByName('STKTMU02').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSU02').AsFloat * (sPrecio / sContenido), 15, 5));
      End;
 // Saldos Iniciales de Marzo
      If XMes <= 2 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU02').AsFloat >
            (cdsSTK.FieldByName('STKTSU02').AsFloat + cdsSTK.FieldByName('STKISU02').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG03').AsFloat := FRound(cdsSTK.FieldByName('STKTSG02').AsFloat
            + cdsSTK.FieldByName('STKISG02').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG02').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU03').AsFloat := FRound(cdsSTK.FieldByName('STKTSU02').AsFloat
            + cdsSTK.FieldByName('STKISU02').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU02').AsFloat, 15, 4);

         cdsSTK.FieldByName('STKTMG03').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSG03').AsFloat * sPrecio, 15, 5));
         cdsSTK.FieldByName('STKTMU03').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSU03').AsFloat * (sPrecio / sContenido), 15, 5));
      End;
 // Saldos Iniciales de Abril
      If XMes <= 3 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU03').AsFloat >
            (cdsSTK.FieldByName('STKTSU03').AsFloat + cdsSTK.FieldByName('STKISU03').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG04').AsFloat := FRound(cdsSTK.FieldByName('STKTSG03').AsFloat
            + cdsSTK.FieldByName('STKISG03').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG03').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU04').AsFloat := FRound(cdsSTK.FieldByName('STKTSU03').AsFloat
            + cdsSTK.FieldByName('STKISU03').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU03').AsFloat, 15, 4);

         cdsSTK.FieldByName('STKTMG04').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSG04').AsFloat * sPrecio, 15, 5));
         cdsSTK.FieldByName('STKTMU04').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSU04').AsFloat * (sPrecio / sContenido), 15, 5));
      End;
 // Saldos Iniciales de Mayo
      If XMes <= 4 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU04').AsFloat >
            (cdsSTK.FieldByName('STKTSU04').AsFloat + cdsSTK.FieldByName('STKISU04').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG05').AsFloat := FRound(cdsSTK.FieldByName('STKTSG04').AsFloat
            + cdsSTK.FieldByName('STKISG04').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG04').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU05').AsFloat := FRound(cdsSTK.FieldByName('STKTSU04').AsFloat
            + cdsSTK.FieldByName('STKISU04').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU04').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG05').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSG05').AsFloat * sPrecio, 15, 5));
         cdsSTK.FieldByName('STKTMU05').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSU05').AsFloat * (sPrecio / sContenido), 15, 5));
      End;
 // Saldos Iniciales de Junio
      If XMes <= 5 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU05').AsFloat >
            (cdsSTK.FieldByName('STKTSU05').AsFloat + cdsSTK.FieldByName('STKISU05').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG06').AsFloat := FRound(cdsSTK.FieldByName('STKTSG05').AsFloat
            + cdsSTK.FieldByName('STKISG05').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG05').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU06').AsFloat := FRound(cdsSTK.FieldByName('STKTSU05').AsFloat
            + cdsSTK.FieldByName('STKISU05').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU05').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG06').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSG06').AsFloat * sPrecio, 15, 5));
         cdsSTK.FieldByName('STKTMU06').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSU06').AsFloat * (sPrecio / sContenido), 15, 5));
      End;
 // Saldos Iniciales de Julio
      If XMes <= 6 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU06').AsFloat >
            (cdsSTK.FieldByName('STKTSU06').AsFloat + cdsSTK.FieldByName('STKISU06').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG07').AsFloat := FRound(cdsSTK.FieldByName('STKTSG06').AsFloat
            + cdsSTK.FieldByName('STKISG06').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG06').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU07').AsFloat := FRound(cdsSTK.FieldByName('STKTSU06').AsFloat
            + cdsSTK.FieldByName('STKISU06').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU06').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG07').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSG07').AsFloat * sPrecio, 15, 5));
         cdsSTK.FieldByName('STKTMU07').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSU07').AsFloat * (sPrecio / sContenido), 15, 5));
      End;
 // Saldos Iniciales de Agosto
      If XMes <= 7 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU07').AsFloat >
            (cdsSTK.FieldByName('STKTSU07').AsFloat + cdsSTK.FieldByName('STKISU07').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG08').AsFloat := FRound(cdsSTK.FieldByName('STKTSG07').AsFloat
            + cdsSTK.FieldByName('STKISG07').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG07').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU08').AsFloat := FRound(cdsSTK.FieldByName('STKTSU07').AsFloat
            + cdsSTK.FieldByName('STKISU07').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU07').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG08').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSG08').AsFloat * sPrecio, 15, 5));
         cdsSTK.FieldByName('STKTMU08').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSU08').AsFloat * (sPrecio / sContenido), 15, 5));
      End;
 // Saldos Iniciales de Setiembre
      If XMes <= 8 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU08').AsFloat >
            (cdsSTK.FieldByName('STKTSU08').AsFloat + cdsSTK.FieldByName('STKISU08').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG09').AsFloat := FRound(cdsSTK.FieldByName('STKTSG08').AsFloat
            + cdsSTK.FieldByName('STKISG08').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG08').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU09').AsFloat := FRound(cdsSTK.FieldByName('STKTSU08').AsFloat
            + cdsSTK.FieldByName('STKISU08').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU08').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG09').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSG09').AsFloat * sPrecio, 15, 5));
         cdsSTK.FieldByName('STKTMU09').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSU09').AsFloat * (sPrecio / sContenido), 15, 5));
      End;
 // Saldos Iniciales de Octubre
      If XMes <= 9 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU09').AsFloat >
            (cdsSTK.FieldByName('STKTSU09').AsFloat + cdsSTK.FieldByName('STKISU09').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG10').AsFloat := FRound(cdsSTK.FieldByName('STKTSG09').AsFloat
            + cdsSTK.FieldByName('STKISG09').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG09').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU10').AsFloat := FRound(cdsSTK.FieldByName('STKTSU09').AsFloat
            + cdsSTK.FieldByName('STKISU09').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU09').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG10').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSG10').AsFloat * sPrecio, 15, 5));
         cdsSTK.FieldByName('STKTMU10').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSU10').AsFloat * (sPrecio / sContenido), 15, 5));
      End;
 // Saldos Iniciales de Noviembre
      If XMes <= 10 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU10').AsFloat >
            (cdsSTK.FieldByName('STKTSU10').AsFloat + cdsSTK.FieldByName('STKISU10').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG11').AsFloat := FRound(cdsSTK.FieldByName('STKTSG10').AsFloat
            + cdsSTK.FieldByName('STKISG10').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG10').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU11').AsFloat := FRound(cdsSTK.FieldByName('STKTSU10').AsFloat
            + cdsSTK.FieldByName('STKISU10').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU10').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG11').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSG11').AsFloat * sPrecio, 15, 5));
         cdsSTK.FieldByName('STKTMU11').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSU11').AsFloat * (sPrecio / sContenido), 15, 5));
      End;
 // Saldos Iniciales de Diciembre
      If XMes <= 11 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU11').AsFloat >
            (cdsSTK.FieldByName('STKTSU11').AsFloat + cdsSTK.FieldByName('STKISU11').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG12').AsFloat := FRound(cdsSTK.FieldByName('STKTSG11').AsFloat
            + cdsSTK.FieldByName('STKISG11').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG11').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU12').AsFloat := FRound(cdsSTK.FieldByName('STKTSU11').AsFloat
            + cdsSTK.FieldByName('STKISU11').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU11').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG12').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSG12').AsFloat * sPrecio, 15, 5));
         cdsSTK.FieldByName('STKTMU12').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTSU12').AsFloat * (sPrecio / sContenido), 15, 5));
      End;
   End
   Else
   Begin // si el contenido del artículo ARTCONT=1
      If XMes <= 1 Then
      Begin
         cdsSTK.FieldByName('STKTSG02').AsFloat := FRound(cdsSTK.FieldByName('STKTSG01').AsFloat
            + cdsSTK.FieldByName('STKISG01').AsFloat
            - cdsSTK.FieldByName('STKSSG01').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG02').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTMG01').AsFloat
            + cdsSTK.FieldByName('STKIMG01').AsFloat
            - cdsSTK.FieldByName('STKSMG01').AsFloat, 15, 5));

      End;

      If XMes <= 2 Then
      Begin
         cdsSTK.FieldByName('STKTSG03').AsFloat := FRound(cdsSTK.FieldByName('STKTSG02').AsFloat
            + cdsSTK.FieldByName('STKISG02').AsFloat
            - cdsSTK.FieldByName('STKSSG02').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG03').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTMG02').AsFloat
            + cdsSTK.FieldByName('STKIMG02').AsFloat
            - cdsSTK.FieldByName('STKSMG02').AsFloat, 15, 5));
      End;

      If XMes <= 3 Then
      Begin
         cdsSTK.FieldByName('STKTSG04').AsFloat := FRound(cdsSTK.FieldByName('STKTSG03').AsFloat
            + cdsSTK.FieldByName('STKISG03').AsFloat
            - cdsSTK.FieldByName('STKSSG03').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG04').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTMG03').AsFloat
            + cdsSTK.FieldByName('STKIMG03').AsFloat
            - cdsSTK.FieldByName('STKSMG03').AsFloat, 15, 5));
      End;
      If XMes <= 4 Then
      Begin
         cdsSTK.FieldByName('STKTSG05').AsFloat := FRound(cdsSTK.FieldByName('STKTSG04').AsFloat
            + cdsSTK.FieldByName('STKISG04').AsFloat
            - cdsSTK.FieldByName('STKSSG04').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG05').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTMG04').AsFloat
            + cdsSTK.FieldByName('STKIMG04').AsFloat
            - cdsSTK.FieldByName('STKSMG04').AsFloat, 15, 5));
      End;

      If XMes <= 5 Then
      Begin
         cdsSTK.FieldByName('STKTSG06').AsFloat := FRound(cdsSTK.FieldByName('STKTSG05').AsFloat
            + cdsSTK.FieldByName('STKISG05').AsFloat
            - cdsSTK.FieldByName('STKSSG05').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG06').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTMG05').AsFloat
            + cdsSTK.FieldByName('STKIMG05').AsFloat
            - cdsSTK.FieldByName('STKSMG05').AsFloat, 15, 5));
      End;

      If XMes <= 6 Then
      Begin
         cdsSTK.FieldByName('STKTSG07').AsFloat := FRound(cdsSTK.FieldByName('STKTSG06').AsFloat
            + cdsSTK.FieldByName('STKISG06').AsFloat
            - cdsSTK.FieldByName('STKSSG06').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG07').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTMG06').AsFloat
            + cdsSTK.FieldByName('STKIMG06').AsFloat
            - cdsSTK.FieldByName('STKSMG06').AsFloat, 15, 5));
      End;

      If XMes <= 7 Then
      Begin
         cdsSTK.FieldByName('STKTSG08').AsFloat := FRound(cdsSTK.FieldByName('STKTSG07').AsFloat
            + cdsSTK.FieldByName('STKISG07').AsFloat
            - cdsSTK.FieldByName('STKSSG07').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG08').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTMG07').AsFloat
            + cdsSTK.FieldByName('STKIMG07').AsFloat
            - cdsSTK.FieldByName('STKSMG07').AsFloat, 15, 5));
      End;

      If XMes <= 8 Then
      Begin
         cdsSTK.FieldByName('STKTSG09').AsFloat := FRound(cdsSTK.FieldByName('STKTSG08').AsFloat
            + cdsSTK.FieldByName('STKISG08').AsFloat
            - cdsSTK.FieldByName('STKSSG08').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG09').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTMG08').AsFloat
            + cdsSTK.FieldByName('STKIMG08').AsFloat
            - cdsSTK.FieldByName('STKSMG08').AsFloat, 15, 5));
      End;

      If XMes <= 9 Then
      Begin
         cdsSTK.FieldByName('STKTSG10').AsFloat := FRound(cdsSTK.FieldByName('STKTSG09').AsFloat
            + cdsSTK.FieldByName('STKISG09').AsFloat
            - cdsSTK.FieldByName('STKSSG09').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG10').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTMG09').AsFloat
            + cdsSTK.FieldByName('STKIMG09').AsFloat
            - cdsSTK.FieldByName('STKSMG09').AsFloat, 15, 5));
      End;

      If XMes <= 10 Then
      Begin
         cdsSTK.FieldByName('STKTSG11').AsFloat := FRound(cdsSTK.FieldByName('STKTSG10').AsFloat
            + cdsSTK.FieldByName('STKISG10').AsFloat
            - cdsSTK.FieldByName('STKSSG10').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG11').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTMG10').AsFloat
            + cdsSTK.FieldByName('STKIMG10').AsFloat
            - cdsSTK.FieldByName('STKSMG10').AsFloat, 15, 5));
      End;

      If XMes <= 11 Then
         cdsSTK.FieldByName('STKTSG12').AsFloat := FRound(cdsSTK.FieldByName('STKTSG11').AsFloat
            + cdsSTK.FieldByName('STKISG11').AsFloat
            - cdsSTK.FieldByName('STKSSG11').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG12').AsString := floatToStr(FRound(cdsSTK.FieldByName('STKTMG11').AsFloat
         + cdsSTK.FieldByName('STKIMG11').AsFloat
         - cdsSTK.FieldByName('STKSMG11').AsFloat, 15, 5));
   End;
   cdsPost(cdsSTK);

   cdsstk.Post; //  SALDOS INICIALES
End;

Procedure TDMALM.cdsSaldosCalcFields(DataSet: TDataSet);
Begin
   cdsSaldos.FieldByName('CSTOCKFISG').Value := cdsSaldos.FieldByName('STKSACTG').value - cdsSaldos.FieldByName('STKSFISG').value;
   cdsSaldos.FieldByName('CSTOCKFISU').value := cdsSaldos.FieldByName('STKSACTU').value - cdsSaldos.FieldByName('STKSFISU').value;
End;

Function TDMALM.DesEncripta(wPalabra: String): String;
Var
   xLargoPal, i, j: integer;
   xReal, xEncriptado1, xEncriptado2, xEncriptado3, xEncriptado4,
      xEncriptado5, xNuevaPal, xEncriptado: String;
   xTiene: boolean;
Begin
   xReal := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1 := '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2 := '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3 := '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4 := 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5 := ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal := length(wPalabra);
   xNuevaPal := '';
   i := 1;
   While i <= xLargoPal Do
   Begin
      j := 1;
      xTiene := False;
      If (i = 1) Or (i = 11) Or (i = 21) Or (i = 31) Then xEncriptado := xEncriptado1;
      If (i = 2) Or (i = 12) Or (i = 22) Or (i = 32) Then xEncriptado := xEncriptado2;
      If (i = 3) Or (i = 13) Or (i = 23) Or (i = 33) Then xEncriptado := xEncriptado3;
      If (i = 4) Or (i = 14) Or (i = 24) Or (i = 34) Then xEncriptado := xEncriptado4;
      If (i = 5) Or (i = 15) Or (i = 25) Or (i = 35) Then xEncriptado := xEncriptado5;
      If (i = 6) Or (i = 16) Or (i = 26) Or (i = 36) Then xEncriptado := xEncriptado1;
      If (i = 7) Or (i = 17) Or (i = 27) Or (i = 37) Then xEncriptado := xEncriptado2;
      If (i = 8) Or (i = 18) Or (i = 28) Or (i = 38) Then xEncriptado := xEncriptado3;
      If (i = 9) Or (i = 19) Or (i = 29) Or (i = 39) Then xEncriptado := xEncriptado4;
      If (i = 10) Or (i = 20) Or (i = 30) Or (i = 40) Then xEncriptado := xEncriptado5;
      While j <= length(xReal) Do
      Begin
         If copy(wPalabra, i, 1) = copy(xEncriptado, j, 1) Then
         Begin
            xNuevaPal := xNuevaPal + copy(xReal, j, 1);
            xTiene := True;
         End;
         j := j + 1;
      End;
      If Not xTiene Then xNuevaPal := xNuevaPal + copy(wPalabra, i, 1);
      i := i + 1;
   End;
   result := xNuevaPal;
End;

Function TDMALM.Encripta(wPalabra: String): String;
Var
   xLargoPal, i, j: integer;
   xReal, xEncriptado1, xEncriptado2, xEncriptado3, xEncriptado4,
      xEncriptado5, xNuevaPal, xEncriptado: String;
   xTiene: boolean;
Begin
   xReal := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1 := '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2 := '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3 := '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4 := 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5 := ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal := length(wPalabra);
   xNuevaPal := '';
   i := 1;
   While i <= xLargoPal Do
   Begin
      j := 1;
      xTiene := False;
      If (i = 1) Or (i = 11) Or (i = 21) Or (i = 31) Then xEncriptado := xEncriptado1;
      If (i = 2) Or (i = 12) Or (i = 22) Or (i = 32) Then xEncriptado := xEncriptado2;
      If (i = 3) Or (i = 13) Or (i = 23) Or (i = 33) Then xEncriptado := xEncriptado3;
      If (i = 4) Or (i = 14) Or (i = 24) Or (i = 34) Then xEncriptado := xEncriptado4;
      If (i = 5) Or (i = 15) Or (i = 25) Or (i = 35) Then xEncriptado := xEncriptado5;
      If (i = 6) Or (i = 16) Or (i = 26) Or (i = 36) Then xEncriptado := xEncriptado1;
      If (i = 7) Or (i = 17) Or (i = 27) Or (i = 37) Then xEncriptado := xEncriptado2;
      If (i = 8) Or (i = 18) Or (i = 28) Or (i = 38) Then xEncriptado := xEncriptado3;
      If (i = 9) Or (i = 19) Or (i = 29) Or (i = 39) Then xEncriptado := xEncriptado4;
      If (i = 10) Or (i = 20) Or (i = 30) Or (i = 40) Then xEncriptado := xEncriptado5;
      While j <= length(xReal) Do
      Begin
         If copy(wPalabra, i, 1) = copy(xReal, j, 1) Then
         Begin
            xNuevaPal := xNuevaPal + copy(xEncriptado, j, 1);
            xTiene := True;
         End;
         j := j + 1;
      End;
      If Not xTiene Then xNuevaPal := xNuevaPal + copy(wPalabra, i, 1);
      i := i + 1;
   End;
   result := xNuevaPal;
End;

Procedure TDMALM.AccesosUsuarios(xxModulo, xxUsuario, xxTipo, xxForma: String);
Begin
   If Trim(cdsUsuarios.FieldByName('GRUPOID').AsString) = '' Then
   Begin
      If cdsUsuarios.IndexFieldNames <> 'USERID' Then
         cdsUsuarios.IndexFieldNames := 'USERID';
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByName('USERID').AsString := xxUsuario;
      If Not cdsUsuarios.GotoKey Then
         Exit;
   End;
   cdsGrupos.Filter := '';

   If xxTipo = '1' Then
   Begin
      cdsGrupos.Filter := 'GRUPOID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'MODULOID=' + '''' + xxModulo + '''' + ' and '
         + 'TIPO=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;

   If xxTipo = '2' Then
   Begin
      cdsGrupos.Filter := 'GRUPOID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'MODULOID=' + '''' + xxModulo + '''' + ' and '
         + 'FORMA=' + '''' + xxForma + '''' + ' and '
         + 'TIPO=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;
End;

Procedure TDMALM.AccesosUsuariosR(xxModulo, xxUsuario, xxTipo: String; xxForma: TForm);
Begin
   If Trim(cdsUsuarios.FieldByname('GRUPOID').AsString) = '' Then
   Begin
      If cdsUsuarios.IndexFieldNames <> 'USERID' Then
         cdsUsuarios.IndexFieldNames := 'USERID';
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByname('USERID').AsString := xxUsuario;
      If Not cdsUsuarios.GotoKey Then Exit;
   End;

   cdsGrupos.Filter := '';
   If xxTipo = '1' Then
   Begin
      cdsGrupos.Filter := 'GrupoID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;

      If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;

      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;

   If xxTipo = '2' Then
   Begin
      cdsGrupos.Filter := 'GrupoID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Forma=' + '''' + xxForma.Name + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;

      If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;

      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;
End;

Function TDMALM.BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
Var
   ic: Integer;
Begin
   Result := Nil;
   For ic := 0 To xForm.ComponentCount - 1 Do
   Begin
      If xForm.Components[ic].Name = xNombre Then
         Result := TControl(xForm.Components[ic]);
   End;
End;

Function TDMALM.RecuperarDatos(xTabla, xCampos, xWhere: String): Boolean;
Var
   xSQL: String;
Begin
   cdsQry.active := False;
   cdsQry.ProviderName := 'prvLOG';
   xSQL := 'SELECT ' + xCampos + ' FROM ' + xTabla + ' WHERE ' + xWhere;
   cdsQry.DataRequest(xSQL);
   cdsQry.active := True;

   If cdsQry.RecordCount = 0 Then
      Result := False
   Else
      Result := True;
End;

Function TDMALM.MaxAju: String;
Begin
   Result := MaxSQL('LOG102', 'INVCORR', '');
End;

Procedure TDMALM.AbreCierraCDS(xxCds: Array Of TwwClientDataSet; xxNom: Array Of String; xBool: Boolean);
Var
   iX: integer;
Begin
   For ix := 0 To High(xxCds) Do
   Begin
      xxCds[iX].Close;
      xxCds[iX].DataRequest('Select * from ' + xxNom[iX]);
      xxCds[iX].Active := xBool;
   End;
End;

Procedure TDMALM.FiltraCDS(xxCds: TwwClientDataSet; xxSQL: String);
Begin
   If Length(xxSQL) > 0 Then
   Begin
      xxCds.Close;
      xxCds.DataRequest(xxSQL);
   End;
   xxCds.Open;
End;

Function TDMALM.CountFor(cds: TwwClientDataSet; sCondicion: String): LongInt;
Var
   cdsClone: TwwClientDataSet;
   bmk: TBookmark;
Begin
   bmk := cds.GetBookmark;
 //result := 0;
   cdsClone := TwwClientDataSet.Create(Nil);
   Try
      cdsClone.CloneCursor(cds, True);
      cdsClone.Filtered := False;
      cdsClone.Filter := sCondicion;
      cdsClone.Filtered := True;
      result := cdsClone.RecordCount;
   Finally
      cdsClone.Free;
   End;
   cds.GotoBookmark(bmk);
   cds.FreeBookmark(bmk);
End;

Function TDMALM.MaxReqs(Const sCIA, sLOC, sALM: String): String;
Var
   sCND: String;
Begin
   sCND := 'CIAID=''' + sCIA + ''' AND ALMID=''' + sALM + ''' AND LOCID=''' + sLOC + '''';
   result := MaxSQL('LOG308', 'RQSID', sCND);
End;

Function TDMALM.MaxReqA(Const sCIA, sLOC: String): String;
Var
   sWhere: String;
Begin
   sWhere := 'CIAID=''' + sCIA + ''' AND LOCID=''' + sLOC + '''';
   result := MaxSQL('LOG308', 'RQSID', sWhere);
End;

//procedure TDMALM.LongdeCampo(xxCampo : String) : Integer
//begin
//  result:=0;
//end;

Function TDMALM.IsExistRqsM(Const sCIA, sLOC, sRQS: String): Boolean;
Var
   sWhere: String;
Begin
   sWhere := 'CIAID=''' + sCIA + ''' AND RQSID =''' + sRQS + ''' AND LOCID=''' + sLOC + '''';
   result := length(DisplayDescrip('prvTGE', 'LOG308', 'RQSID', sWhere, 'RQSID')) > 0;
End;

Procedure TDMALM.ppRptNotaSE(sSQL, sCIA, sLOC, sTIN, sALM, sTDO, sNIN, sTip: String);
Var
   xTipo, xProv: String;
Begin
   If sTIP = 'SALIDA' Then
      xTipo := 'S'
   Else
      If sTIP = 'INGRESO' Then
         xTipo := 'I';

   xProv := DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');

   sSQL := 'SELECT B.CIADES, B.CIARUC, B.CIATLF, B.CIAFAX, B.CIADIRE, A.CCOSID, T.CCOSDES, ' +
      'C.PROV, C.PROVDES, C.PROVDIR, C.PROVTELF, C.PROVREPR, C.PROVRUC, C.PROVFAX, ' +
      'D.TMONABR, E.TRIDES, F.ALMDES, G.ALMDES ALMDESORI, A.NISASOLIC, ' +
      'A.NISAID, A.NISAFDOC, A.NISANDOC, H.DOCDES, A.NISAFREG, A.NISAOBS, I.USERNOM, J.TINDES, ' +
      // vhndema 20050428  - SE AÑADIO LA TABLA TGE157 - DOC DE ALMACEN
   'A.TDAID, S.TDADES, A.NISSIT ' +
      'FROM LOG314 A, TGE101 B, TGE201 C, TGE103 D, TGE208 E, TGE151 F, TGE151 G, TGE110 H, ' +
      'TGE002 I, TGE152 J, TGE203 T, TGE157 S ' +
      'WHERE A.CIAID=' + QuotedStr(sCIA) + ' ' +
      'AND A.LOCID=' + QuotedStr(sLOC) + ' ' +
      'AND A.TINID=' + QuotedStr(sTIN) + ' ' +
      'AND A.ALMID=' + QuotedStr(sALM) + ' ' +
      'AND A.TDAID=' + QuotedStr(sTDO) + ' ' +
      'AND A.NISAID=' + QuotedStr(sNIN) + ' ' +
      'AND NISATIP=' + QuotedStr(sTIP) + ' ' +
      'AND A.CIAID = B.CIAID(+) ' +
      'AND A.PROV  = C.PROV(+) AND C.CLAUXID(+)= NVL(A.CLAUXID,' + QuotedStr(xProv) + ') ' +
      'AND A.TMONID= D.TMONID(+) ' +
      'AND A.TRIID = E.TRIID(+) AND E.TRISGT=' + QuotedStr(xTipo) + ' ' +
      'AND A.CIAID = F.CIAID(+) AND A.LOCID=F.LOCID(+) AND A.TINID=F.TINID(+) AND A.ALMID=F.ALMID(+) ' +
      'AND A.CIAID = G.CIAID(+) AND A.LOCID=G.LOCID(+) AND A.TINID=G.TINID(+) AND A.ALMORIID=G.ALMID(+) ' +
      'AND A.DOCID = H.DOCID(+) AND H.REFALM(+)=' + quotedStr('S') + ' ' +
      'AND A.NISAUSER = I.USERID(+) AND I.MODULOID(+) = ''' + wModulo + ''' ' +
      'AND A.CIAID = J.CIAID(+) AND A.TINID=J.TINID(+) ' +
      'AND A.CCOSID = T.CCOSID(+) ' +
      'AND A.TDAID=S.TDAID';

   cdsQry.DisableControls;
   cdsQry.Close;
   cdsQry.ProviderName := 'prvLOG';
   cdsQry.DataRequest(sSQL);
   cdsQry.Open;
   cdsQry.EnableControls;

   sSQL := 'SELECT A.COSREPO,A.KDXID, A.GRARID, A.ARTID, A.ARTDES, C.UNMABR, '
      + 'CASE WHEN NVL(A.KDXCNTU,0)=0 THEN A.KDXCNTG ELSE A.KDXCNTU END KDXCNT, '
      + 'CASE WHEN NVL(A.ARTPCU,0) =0 THEN A.ARTPCG ELSE  A.ARTPCU END ARTPC, '
      + 'CASE WHEN NVL(A.KDXCNTU,0)=0 THEN A.KDXCNTG * A.ARTPCG ELSE  A.KDXCNTU * A.ARTPCU END TOTAL, '
      + 'CASE WHEN ' + wReplacCeros + '(A.UNMIDU,''XX'') =  ''XX'' THEN A.UNMIDG ELSE A.UNMIDU END UNMID, '
      + 'DECODE(A.TMONID,' + QuotedStr(DMALM.wTMonExt) + ', NVL(A.ARTPCG,0), NVL(COSREPO,0)) COSTOMN, '
      + 'DECODE(A.TMONID,' + QuotedStr(DMALM.wTMonExt) + ', NVL(A.ARTPCG,0)*NVL(KDXCNTG,0), NVL(COSREPO,0)*NVL(KDXCNTG,0)) SUBTMN '
      + 'FROM LOG315 A, TGE205 B, TGE130 C '
      + 'WHERE A.CIAID= ' + QuotedStr(sCIA) + ' AND A.LOCID=' + QuotedStr(sLOC) + ' '
      + 'AND A.TINID=' + QuotedStr(sTIN) + ' AND A.ALMID=' + QuotedStr(sALM) + ' '
      + 'AND A.TDAID=' + QuotedStr(sTDO) + ' AND A.NISAID=' + QuotedStr(sNIN) + ' '
      + 'AND A.NISATIP=' + QuotedStr(sTIP) + ' '
      + 'AND A.CIAID = B.CIAID(+) AND A.ARTID = B.ARTID(+) '
      + 'AND A.UNMIDG= C.UNMID(+) ORDER BY KDXID';
   cdsSQL.Close;
   cdsSQL.DataRequest(sSQL);
   cdsSQL.Open;

   sSQL := 'SELECT X.* ' +
      'FROM LOG315 A, LOG332 X ' +
      'WHERE A.CIAID= ' + QuotedStr(sCIA) + ' ' +
      'AND A.LOCID=' + QuotedStr(sLOC) + ' ' +
      'AND A.TINID=' + QuotedStr(sTIN) + ' ' +
      'AND A.ALMID=' + QuotedStr(sALM) + ' ' +
      'AND A.TDAID=' + QuotedStr(sTDO) + ' ' +
      'AND A.NISAID=' + QuotedStr(sNIN) + ' ' +
      'AND A.NISATIP=' + QuotedStr(sTIP) + ' ' +
      'AND A.CIAID=X.CIAID AND A.LOCID=X.LOCID ' +
      'AND A.TINID=X.TINID AND A.ALMID=X.ALMID ' +
      'AND A.TDAID=X.TDAID2 AND TRIM(A.NISAID)=X.FACSERIE||X.NFAC ' +
      'AND TRIM(A.ARTID)=X.ARTID(+)';
   cdsSobrino.DisableControls;
   cdsSobrino.filter := '';
   cdsSobrino.filtered := False;
   cdsSobrino.Close;
   cdsSobrino.DataRequest(sSQL);

   cdsSobrino.MasterSource := dsSQL;
   cdsSobrino.MasterFields := 'ARTID';
   cdsSobrino.IndexFieldNames := 'ARTID';

   cdsSobrino.Open;
   cdsSobrino.EnableControls;
End;

Function TDMALM.UltimoNum(wPrv, wTabla, wCampo, wWhere: String): String;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT MAX(' + wCampo + ') ULTNUM FROM ' + wTabla;
   If length(wWhere) > 0 Then xSQL := xSQL + ' WHERE ' + wWhere;
   cdsQry.Close;
   cdsQry.ProviderName := wPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.FieldbyName('ULTNUM').AsString = null Then
      result := '1'
   Else
      result := inttostr(cdsQry.FieldbyName('ULTNUM').asInteger + 1);
End;

// Estos Procesos son para la Actualización por Articulos - Fin

Procedure TDMALM.GeneraContabilidad(xxCia, xxTDiario, xxAnoMM, xxNoComp: String; xForma: TForm; xxModulo: String);
Var
   xSQL: String;
Begin
   xSql := 'SELECT * FROM oaCONFIG';
   cdsqry.Close;
   cdsqry.datarequest(xSql);
   cdsQry.Open;
   If cdsqry.fieldbyname('SRV_DB').AsString = 'DB2400' Then
   Begin
      wDBFunc01 := 'RRN(CAJA304)';
      wDBFunc02 := 'RRN(CNT301)';
   End
   Else
   Begin
      wDBFunc01 := 'Int(Rand()*1000000)';
      wDBFunc02 := 'Int(Rand()*1000000)';
   End;

   CreaPanel(xForma, 'Contabilizando');
   If Contabiliza(xxCia, xxTDiario, xxAnoMM, xxNoComp) Then
      PanelMsg('Asiento Contabilizando Final', 0);
   pnlConta.Free;
End;

Procedure TDMALM.CreaPanel(xForma: TForm; xMensaje: String);
Begin
   pnlConta := TPanel.Create(xForma);
   pbConta := TProgressBar.Create(Nil);
   pbConta.Width := 205;
   pbConta.Top := 72;
   pbConta.Left := 48;
   pbConta.Min := 0;
   pbConta.Max := 6;
   pbConta.Parent := pnlConta;
   pnlConta.Alignment := taCenter;
   pnlConta.BringToFront;
   pnlConta.Width := 300;
   pnlConta.Height := 100;
   pnlConta.Top := xForma.Height - 380;
   pnlConta.Left := strtoInt(FloattoStr(FRound((((xForma.Width - 100)) / 2) - 100, 3, 0)));
   pnlConta.Parent := xForma;
   pnlConta.BevelInner := bvRaised;
   pnlConta.BevelOuter := bvRaised;
   pnlConta.BevelWidth := 3;
   pnlConta.Font.Name := 'Times New Roman';
   pnlConta.Font.Style := [fsBold, fsItalic];
   pnlConta.Font.Size := 12;
   pnlConta.Caption := xMensaje;
   pbConta.Position := 1;
   pnlConta.Refresh;
End;

Function TDMALM.FRound(xReal: double; xEnteros, xDecimal: Integer): double;
Var
   xNum: String;
   code: Integer;
   xNReal: double;
Begin
   xNum := Floattostrf(xReal, ffFixed, xEnteros, xDecimal);
   Val(xNum, xNReal, code);
   Result := xNReal;
End;

Procedure TDMALM.PanelMsg(xMensaje: String; xProc: Integer);
Begin
   If xProc > 0 Then
   Begin
      pbConta.Position := 0;
      pbConta.Min := 0;
      pbConta.Max := xProc;
   End;
   pnlConta.Caption := xMensaje;
   If xProc = 0 Then pbConta.Position := pbConta.Position + 1;
   pnlConta.Refresh;
End;

Procedure TDMALM.TransferiraCNT(pCIAID, pECANOMM, pTDIARID, pECNOCOMP, pMod: String);
Begin
//

End;

Function TDMALM.Contabiliza(xCia, xTDiario, xAnoMM, xNoComp: String): Boolean;
Var
   xSQL, xNREG: String;
   xNumT: Integer;
Begin
   PanelMsg('Generando Asientos Automaticos', 0);

   xSQL := 'INSERT INTO CNT301 ( '
      + 'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
      + 'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
      + 'CNTDH, CCOSID, '
      + 'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
      + 'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
      + 'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
      + 'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
      + 'CNTDEBEMN, CNTDEBEME, '
      + 'CNTHABEMN, CNTHABEME, CNTREG ) ' //WMC0201 CNTREG
      + 'SELECT CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTANO, CNT301.CNTANOMM, CNT301.CNTLOTE, B.CTAAUT1,'
      + 'CNT301.CLAUXID, CNT301.AUXID, CNT301.CNTMODDOC, CNT301.DOCID, CNT301.CNTSERIE, CNT301.CNTNODOC, CNT301.CNTGLOSA,'
      + 'CNT301.CNTDH, '
      + 'DECODE( D.CTA_CCOS,''S'' , CNT301.CCOSID , '''' ) CCOSID, '
      + 'CNT301.CNTTCAMBIO, CNT301.CNTMTOORI, CNT301.CNTMTOLOC, CNT301.CNTMTOEXT, CNT301.CNTFEMIS, CNT301.CNTFVCMTO, '
      + 'CNT301.CNTFCOMP, CNT301.CNTESTADO, ''S'', ''S'', '
      + '''' + wUsuario + '''' + ', TO_DATE(''' + FORMATDATETIME(wFormatFecha, Date) + '''' + '), SYSDATE, '
      + 'CNT301.CNTMM, CNT301.CNTDD, CNT301.CNTTRI, CNT301.CNTSEM, CNT301.CNTSS, CNT301.CNTAATRI, CNT301.CNTAASEM, '
      + 'CNT301.CNTAASS, CNT301.TMONID, D.CTAABR, CNT301.TDIARDES, CNT301.AUXDES, CNT301.DOCDES, C.CCOSABR, '
      + 'CNT301.CNTMM, CNT301.CNTDD, CNT301.CNTTRI, CNT301.CNTSEM, CNT301.CNTSS, CNT301.CNTAATRI, CNT301.CNTAASEM, '
      + 'CNT301.CNTAASS, CNT301.TMONID, D.CTAABR, CNT301.TDIARDES, CNT301.AUXDES, CNT301.DOCDES, C.CCOSABR, '
      + 'DECODE(CNT301.CNTDH, ''H'', CNT301.CNTMTOLOC, 0 ), '
      + 'DECODE(CNT301.CNTDH, ''H'', CNT301.CNTMTOEXT, 0 ), '
      + 'DECODE(CNT301.CNTDH, ''D'', CNT301.CNTMTOLOC, 0 ), '
      + 'DECODE(CNT301.CNTDH, ''D'', CNT301.CNTMTOEXT, 0 ) '
      + 'FROM CNT301, TGE202 B, TGE202 D, TGE203 C  '
      + 'WHERE CNT301.CIAID =' + '''' + xCia + '''' + ' AND '
      + 'CNT301.TDIARID =' + '''' + xTDiario + '''' + ' AND '
      + 'CNT301.CNTANOMM =' + '''' + xAnoMM + '''' + ' AND '
      + 'CNT301.CNTCOMPROB=' + '''' + xNoComp + '''' + ' AND '
      + 'CNT301.CIAID=B.CIAID AND CNT301.CUENTAID=B.CUENTAID AND B.CTAAUT1 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0  AND '
      + 'CNT301.CIAID=D.CIAID AND B.CTAAUT1=D.CUENTAID AND B.CTAAUT1 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0 '
      + 'AND CNT301.CCOSID=C.CCOSID(+) ';
   Try
      DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;
   PanelMsg('Generando Asientos Automaticos', 0);

   xSQL := 'INSERT INTO CNT301 ( '
      + 'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
      + 'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
      + 'CNTDH, CCOSID, '
      + 'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
      + 'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
      + 'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
      + 'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
      + 'CNTDEBEMN, CNTDEBEME, '
      + 'CNTHABEMN, CNTHABEME, CNTREG ) '
      + 'SELECT CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTANO, CNT301.CNTANOMM, CNT301.CNTLOTE, B.CTAAUT2,'
      + 'CNT301.CLAUXID, CNT301.AUXID, CNT301.CNTMODDOC, CNT301.DOCID, CNT301.CNTSERIE, CNT301.CNTNODOC,CNT301.CNTGLOSA, '
      + 'DECODE(CNT301.CNTDH, ''D'', ''H'', ''D'' ) AS DH, '
      + 'DECODE(D.CTA_CCOS, ''S'', CNT301.CCOSID , '''' ) CCOSID, '
      + 'CNT301.CNTTCAMBIO, CNT301.CNTMTOORI, CNT301.CNTMTOLOC, CNT301.CNTMTOEXT, CNT301.CNTFEMIS, CNT301.CNTFVCMTO, '
      + 'CNT301.CNTFCOMP, CNT301.CNTESTADO, ''S'', ''S'', '
      + '''' + wUsuario + '''' + ', ' + wRepFuncDate + '''' + FORMATDATETIME(wFormatFecha, Date) + '''' + '), ' + wRepHorServi + ', '
      + 'CNT301.CNTMM, CNT301.CNTDD, CNT301.CNTTRI, CNT301.CNTSEM, CNT301.CNTSS, CNT301.CNTAATRI, CNT301.CNTAASEM, '
      + 'CNT301.CNTAASS, CNT301.TMONID, D.CTAABR, CNT301.TDIARDES, CNT301.AUXDES, CNT301.DOCDES, C.CCOSABR,'
      + 'DECODE(CNT301.CNTDH, ''D'' , CNT301.CNTMTOLOC , 0 ), '
      + 'DECODE(CNT301.CNTDH, ''D'' , CNT301.CNTMTOEXT , 0 ), '
      + 'DECODE(CNT301.CNTDH, ''H'' , CNT301.CNTMTOLOC , 0 ), '
      + 'DECODE(CNT301.CNTDH, ''H'' , CNT301.CNTMTOEXT , 0 ), 0 '
      + 'FROM CNT301, TGE202 B, TGE202 D, TGE203 C '
      + 'WHERE  CNT301.CIAID     =' + '''' + xCia + '''' + ' AND '
      + 'CNT301.TDIARID   =' + '''' + xTDiario + '''' + ' AND '
      + 'CNT301.CNTANOMM  =' + '''' + xAnoMM + '''' + ' AND '
      + 'CNT301.CNTCOMPROB=' + '''' + xNoComp + '''' + ' AND '
      + 'CNT301.CIAID=B.CIAID AND CNT301.CUENTAID=B.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0 AND '
      + 'CNT301.CIAID=D.CIAID AND B.CTAAUT2=D.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0 '
      + 'AND CNT301.CCOSID=C.CCOSID(+)';
   Try
      DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

 /// Añade CNTNREG
   Filtracds(cdsMovCNT1, 'SELECT * FROM CNT301 WHERE '
      + 'CIAID=' + '''' + xCia + '''' + ' AND '
      + 'TDIARID=' + '''' + xTDiario + '''' + ' AND '
      + 'CNTANOMM=' + '''' + xAnoMM + '''' + ' AND '
      + 'CNTCOMPROB=' + '''' + xNoComp + '''');

   xNumT := 0;
   cdsMovCNT1.First;
   While Not cdsMovCNT1.Eof Do
   Begin
      xNumT := xNumT + 1;
      cdsMovCNT1.Edit;
      cdsMovCNT1.FieldByName('CNTREG').AsInteger := xNumT;
      cdsMovCNT1.Post;
      cdsMovCNT1.Next;
   End;
   cdsMovCNT1.ApplyUpdates(0);
   PanelMsg('Generando Cabecera de Contabilidad', 0);

  // Genera Cabecera de Contabilidad
   xSQL := 'INSERT INTO CNT300 ';
   xSQL := xSQL + '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, ';
   xSQL := xSQL + 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
   xSQL := xSQL + 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
   xSQL := xSQL + 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
   xSQL := xSQL + 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
   xSQL := xSQL + 'CNTTS, DOCMOD ) ';

   xSQL := xSQL + 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, ';
   xSQL := xSQL + '''M:''' + '||A.CNTMODDOC||' + ''' D:''' + '||A.TDIARID||' + ''' P:''' + '||A.CNTANOMM||' + ''' C:''' + '||A.CNTCOMPROB, ';

   xSQL := xSQL + 'SUM( DECODE(A.FLAGVAR,''T'', A.CNTTCAMBIO , 0 ) ), ';

   xSQL := xSQL + 'A.CNTFCOMP, ''P'', ''S'', ';
   xSQL := xSQL + '''' + wUsuario + '''' + ', ' + wRepFecServi + ', ' + wRepHorServi + ', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
   xSQL := xSQL + 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, '' '', ';
   xSQL := xSQL + 'A.TDIARDES, ';
   xSQL := xSQL + 'SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME), ';
   xSQL := xSQL + '''' + Copy(wTipoCambioUsar, 6, 2) + '''' + ', A.CNTMODDOC ';
   xSQL := xSQL + 'FROM CNT301 A ';
   xSQL := xSQL + 'WHERE A.CIAID=' + '''' + xCia + '''' + ' AND ';
   xSQL := xSQL + 'A.TDIARID=' + '''' + xTDiario + '''' + ' AND ';
   xSQL := xSQL + 'A.CNTANOMM=' + '''' + xAnoMM + '''' + ' AND ';
   xSQL := xSQL + 'A.CNTCOMPROB=' + '''' + xNoComp + '''' + ' ';
   xSQL := xSQL + 'GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, ';
   xSQL := xSQL + 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI,  ';
   xSQL := xSQL + 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, ';
   xSQL := xSQL + 'A.TDIARDES, A.CNTMODDOC';
   Try
      DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;
  //ErrorMsg('ff', 'hny');
   GeneraEnLinea401(xCia, xTDiario, xAnoMM, xNoComp);
   Result := True;
End;

Procedure TDMALM.GeneraEnLinea401(xxxCia, xxxDiario, xxxAnoMM,
   xxxNoComp: String);
Var
   xCtaPrin, xClAux, xCuenta, xAuxDes, xAno, xMes, xDH, xSQL: String;
   xMov, xAux, xCCos, xCCoDes, xCtaDes, xFLAux, xFLCCo, xNivel: String;
   xDigitos, xDigAnt: Integer;
   xImpMN, xImpME: Double;
Begin
   xAno := Copy(xxxAnoMM, 1, 4);
   xMes := Copy(xxxAnoMM, 5, 2);

   PanelMsg('Generando Resultados', 0);

   Filtracds(cdsMovCNT1, 'Select * from CNT301 Where '
      + 'CIAID=' + '''' + xxxCia + '''' + ' AND '
      + 'TDIARID=' + '''' + xxxDiario + '''' + ' AND '
      + 'CNTANOMM=' + '''' + xxxAnoMM + '''' + ' AND '
      + 'CNTCOMPROB=' + '''' + xxxNoComp + '''');

   PanelMsg('Generando Resultados', cdsMovCNT1.RecordCount + 1);

   cdsMovCNT1.First;
   While Not cdsMovCNT1.Eof Do
   Begin

      PanelMsg('Generando Resultados', 0);

      xCtaPrin := cdsMovCNT1.FieldByName('CUENTAID').AsString;
      xDH := cdsMovCNT1.FieldByName('CNTDH').AsString;
      xImpMN := cdsMovCNT1.FieldByName('CNTMTOLOC').AsFloat;
      xImpME := cdsMovCNT1.FieldByName('CNTMTOEXT').AsFloat;
      xClAux := cdsMovCNT1.FieldByName('CLAUXID').AsString;
      xAux := cdsMovCNT1.FieldByName('AUXID').AsString;
      xAuxDes := cdsMovCNT1.FieldByName('AUXDES').AsString;
      xCCos := cdsMovCNT1.FieldByName('CCOSID').AsString;
      xCCoDes := cdsMovCNT1.FieldByName('CCOSDES').AsString;
      xDigAnt := 0;
      cdsNivel.First;
      While Not cdsNivel.EOF Do
      Begin

         xDigitos := cdsNivel.fieldbyName('Digitos').AsInteger;
         xCuenta := Trim(Copy(xCtaPrin, 1, xDigitos));
         xNivel := cdsNivel.fieldbyName('Nivel').AsString;

         xSQL := 'Select CTAABR, CTA_MOV, CTA_AUX, CTA_CCOS from TGE202'
            + ' where CIAID=' + '''' + xxxCia + ''''
            + ' and CUENTAID=' + '''' + xCuenta + '''';
         cdsQry2.Close;

         cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
         cdsQry2.Open;
         xCtaDes := '';
         xMov := '';
         If cdsQry2.RecordCount > 0 Then
         Begin
            xCtaDes := cdsQry2.FieldByName('CTAABR').AsString;
            xMov := cdsQry2.FieldByName('CTA_MOV').AsString;
            xFlAux := cdsQry2.FieldByName('CTA_AUX').AsString;
            xFlCCo := cdsQry2.FieldByName('CTA_CCOS').AsString;
         End;

         If cdsNivel.fieldbyName('Signo').AsString = '=' Then
            If Length(xCuenta) = xDigitos Then
            Else
               Break;
         If cdsNivel.fieldbyName('Signo').AsString = '<=' Then
            If (Length(xCuenta) <= xDigitos) And (Length(xCuenta) > xDigAnt) Then
            Else
               Break;
         If cdsNivel.fieldbyName('Signo').AsString = '>=' Then
            If Length(xCuenta) >= xDigitos Then
            Else
               Break;

         If Not CuentaExiste(xxxCia, xAno, xCuenta, '', '') Then
         Begin
            InsertaMov(xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
               xCtaDes, '', '', xNivel, xImpMN, xImpME);
         End
         Else
         Begin
            ActualizaMov(xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
               xCtaDes, '', '', xNivel, xImpMN, xImpME);
         End;
         xDigAnt := cdsNivel.fieldbyName('Digitos').AsInteger;
         cdsNivel.Next;
      End;

      ///////////////////////////
      //   Si Tiene Auxiliar   //
      ///////////////////////////
      If xFlAux = 'S' Then
      Begin
         If Not CuentaExiste(xxxCia, xAno, xCuenta, xAux, '') Then
         Begin
            InsertaMov(xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, '', xDH, xMov,
               xCtaDes, xAuxDes, '', xNivel, xImpMN, xImpME);
         End
         Else
         Begin
            ActualizaMov(xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, '', xDH, xMov,
               xCtaDes, xAuxDes, '', xNivel, xImpMN, xImpME);
         End;
      End;

      ///////////////////////////
      //   Si Tiene C.Costo    //
      ///////////////////////////
      If xFlCCo = 'S' Then
      Begin
         If Not CuentaExiste(xxxCia, xAno, xCuenta, xAux, xCCos) Then
         Begin
            InsertaMov(xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, xCCos, xDH, xMov,
               xCtaDes, xAuxDes, xCCoDes, xNivel, xImpMN, xImpME);
         End
         Else
         Begin
            ActualizaMov(xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, xCCos, xDH, xMov,
               xCtaDes, xAuxDes, xCCoDes, xNivel, xImpMN, xImpME);
         End;
      End;

      cdsMovCNT1.Next;
   End;
End;

Function TDMALM.CuentaExiste(xxxxCia, xxxxAno, xxxxCuenta, xxxxAux,
   xxxxCCos: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'Select COUNT(*) TOTREG from CNT401 '
      + 'Where CIAID=' + '''' + xxxxCia + '''' + ' and '
      + 'ANO=' + '''' + xxxxAno + '''' + ' and '
      + 'CUENTAID=' + '''' + xxxxCuenta + '''' + ' and '
      + 'AUXID=' + '''' + xxxxAux + '''' + ' and '
      + 'CCOSID=' + '''' + xxxxCCos + '''';
   cdsQry2.Close;
   cdsQry2.DataRequest(xSQL);
   cdsQry2.Open;
   If cdsQry2.fieldbyName('TOTREG').asInteger > 0 Then
      Result := True
   Else
      Result := False;
End;

Procedure TDMALM.InsertaMov(cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto,
   cDH, cMov, cCtaDes, cAuxDes, cCCoDes, cNivel: String; nImpMN,
   nImpME: Double);
Var
   cMes, cAno, cSQL, cMesT: String;
   nMes: Integer;
Begin
   cAno := Copy(cAnoMM, 1, 4);
   cMes := Copy(cAnoMM, 5, 2);

   cSQL := 'Insert into CNT401( CIAID, ANO, CUENTAID, CLAUXID, AUXID, '
      + ' CCOSID, CTADES, AUXDES, CCODES, TIPO ';

   If cDH = 'D' Then cSQL := cSQL + ', DEBEMN' + cMes + ', DEBEME' + cMes;
   If cDH = 'H' Then cSQL := cSQL + ', HABEMN' + cMes + ', HABEME' + cMes;

   For nMes := (strtoInt(cMes) + 1) To 13 Do
   Begin
      cMesT := StrZero(IntToStr(nMes), 2);
      cSQL := cSQL + ', SALDMN' + cMesT;
      cSQL := cSQL + ', SALDME' + cMesT;
   End;
   cSQL := cSQL + ' ) ';
   cSQL := cSQL + 'Values( ' + '''' + cCia + '''' + ', ' + '''' + cAno + '''' + ', '
      + '''' + cCuenta + '''' + ', ' + '''' + cClAux + '''' + ', '
      + '''' + cAux + '''' + ', ' + '''' + cCCosto + '''' + ', '
      + '''' + cCtaDes + '''' + ', ' + '''' + cAuxDes + '''' + ', '
      + '''' + cCCoDes + '''' + ', ' + '''' + cNivel + '''' + ', '
      + FloatToStr(nImpMN) + ', '
      + FloatToStr(nImpME) + ' ';

   For nMes := (strtoInt(cMes) + 1) To 13 Do
   Begin
      cMesT := StrZero(IntToStr(nMes), 2);
      If cDH = 'D' Then
         cSQL := cSQL + ', +'
      Else
         cSQL := cSQL + ', -';
      cSQL := cSQL + FloatToStr(nImpMN) + ' ';
      If cDH = 'D' Then
         cSQL := cSQL + ', +'
      Else
         cSQL := cSQL + ', -';
      cSQL := cSQL + FloatToStr(nImpME) + ' ';
   End;

   cSQL := cSQL + ' ) ';

   DCOM1.AppServer.EjecutaSQL(cSQL);
End;

Procedure TDMALM.ActualizaMov(cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto,
   cDH, cMov, cCtaDes, cAuxDes, cCCoDes, cNivel: String; nImpMN,
   nImpME: Double);
Var
   cMes, cAno, cSQL, cMesT: String;
   nMes: Integer;
Begin
   cAno := Copy(cAnoMM, 1, 4);
   cMes := Copy(cAnoMM, 5, 2);

   cSQL := 'Update CNT401 Set CTADES =' + '''' + cCtaDes + '''' + ', '
      + 'AUXDES =' + '''' + cAuxDes + '''' + ', '
      + 'CCODES =' + '''' + cCCoDes + '''' + ', '
      + 'TIPO   =' + '''' + cNivel + '''' + ', ';

   If cDH = 'D' Then
   Begin
      cSQL := cSQL + '  DEBEMN' + cMes + '=' +
         '( ' + wReplacCeros + '(DEBEMN' + cMes + ',0)+' + '(' + FloatToStr(nImpMN) + ') ) ';
      cSQL := cSQL + ', DEBEME' + cMes + '=' +
         '( ' + wReplacCeros + '(DEBEME' + cMes + ',0)+' + '(' + FloatToStr(nImpME) + ') ) ';
   End;
   If cDH = 'H' Then
   Begin
      cSQL := cSQL + '  HABEMN' + cMes + '=' +
         '( ' + wReplacCeros + '(HABEMN' + cMes + ',0)+' + '(' + FloatToStr(nImpMN) + ') ) ';
      cSQL := cSQL + ', HABEME' + cMes + '=' +
         '( ' + wReplacCeros + '(HABEME' + cMes + ',0)+' + '(' + FloatToStr(nImpME) + ') ) ';
   End;

   For nMes := (strtoInt(cMes) + 1) To 13 Do
   Begin
      cMesT := StrZero(IntToStr(nMes), 2);

      cSQL := cSQL + ', SALDMN' + cMesT + '=';
      cSQL := cSQL + '( ' + wReplacCeros + '(SALDMN' + cMesT + ',0)';
      If cDH = 'D' Then
         cSQL := cSQL + '+'
      Else
         cSQL := cSQL + '-';
      cSQL := cSQL + '(' + FloatToStr(nImpMN) + ') ) ';

      cSQL := cSQL + ', SALDME' + cMesT + '=';
      cSQL := cSQL + '( ' + wReplacCeros + '(SALDME' + cMesT + ',0)';
      If cDH = 'D' Then
         cSQL := cSQL + '+'
      Else
         cSQL := cSQL + '-';
      cSQL := cSQL + '(' + FloatToStr(nImpME) + ') ) ';
   End;

   cSQL := cSQL + 'Where CIAID=   ' + '''' + cCia + '''' + ' and '
      + 'ANO=     ' + '''' + cAno + '''' + ' and '
      + 'CUENTAID=' + '''' + cCuenta + '''' + ' and '
      + 'CLAUXID= ' + '''' + cClAux + '''' + ' and '
      + 'AUXID=   ' + '''' + cAux + '''' + ' and '
      + 'CCOSID=  ' + '''' + cCCosto + '''';

   DCOM1.AppServer.EjecutaSQL(cSQL);
End;

Procedure TDMALM.Tiempo(wwFecha1, wwFecha2: TDateTime; Var wwAnos, wwMeses, wwDias: Integer);
Var
   wAno1, wMes1, wDia1: Word;
   wAno2, wMes2, wDia2: Word;
Begin
   wwAnos := 0;
   wwMeses := 0;
   wwDias := 0;
   If (wwFecha2 - wwFecha1) > 0 Then
   Begin
   // devuelve años, meses y días entre dos fechas
      DecodeDate(wwFecha1, wAno1, wMes1, wDia1);
      DecodeDate(wwFecha2, wAno2, wMes2, wDia2);
      If wDia2 < wDia1 Then
      Begin
         Case wMes2 Of
            1, 3, 5, 7,
               8, 10, 12:
               Begin
                  wwDias := 31 + wDia2 - wDia1;
               End;
            4, 6, 9, 11:
               Begin
                  wwDias := 30 + wDia2 - wDia1;
               End;
         Else
            Begin
               If (wAno1 Mod 4) = 0 Then
                  wwDias := 29 + wDia2 - wDia1
               Else
               Begin
                  wwDias := 28 + wDia2 - wDia1;
               End;
            End;
         End;
         wMes2 := wMes2 - 1;
      End
      Else
      Begin
         wwDias := wDia2 - wDia1;
      End;
   // CALCULO DE MESES EN EL RANGO
      If wMes2 < wMes1 Then
      Begin
         wwMeses := 12 + wMes2 - wMes1;
         wAno2 := wAno2 - 1;
      End
      Else
      Begin
         wwMeses := wMes2 - wMes1;
      End;
   // CALCULO DE ANUALIDADES DEL RANGO
      wwAnos := wAno2 - wAno1;
   End; // si fecha2>fecha1
End;

Procedure TDMALM.cdsParaRepoReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(DataSet, UpdateKind, E);
End;

Function TDMALM.NotLetras(xCampo: String): String;
Begin
   Result := xCampo + ' NOT like (''%A%'') AND ' + xCampo + ' NOT like (''%B%'') AND ' + xCampo + ' NOT like (''%C%'') ' +
      'AND ' + xCampo + ' NOT like (''%D%'') AND ' + xCampo + ' NOT like (''%E%'') AND ' + xCampo + ' NOT like (''%F%'') ' +
      'AND ' + xCampo + ' NOT like (''%G%'') AND ' + xCampo + ' NOT like (''%H%'') AND ' + xCampo + ' NOT like (''%I%'') ' +
      'AND ' + xCampo + ' NOT like (''%J%'') AND ' + xCampo + ' NOT like (''%K%'') AND ' + xCampo + ' NOT like (''%L%'') ' +
      'AND ' + xCampo + ' NOT like (''%M%'') AND ' + xCampo + ' NOT like (''%N%'') AND ' + xCampo + ' NOT like (''%O%'') ' +
      'AND ' + xCampo + ' NOT like (''%P%'') AND ' + xCampo + ' NOT like (''%Q%'') AND ' + xCampo + ' NOT like (''%R%'') ' +
      'AND ' + xCampo + ' NOT like (''%S%'') AND ' + xCampo + ' NOT like (''%T%'') AND ' + xCampo + ' NOT like (''%U%'') ' +
      'AND ' + xCampo + ' NOT like (''%V%'') AND ' + xCampo + ' NOT like (''%W%'') AND ' + xCampo + ' NOT like (''%X%'') ' +
      'AND ' + xCampo + ' NOT like (''%Y%'') AND ' + xCampo + ' NOT like (''%Z%'') AND ' + wReplacCeros + '(' + xCampo + ',''VAC'') <> ''VAC'' ';
End;

Function TDMALM.DisplayDescrip(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
Var
   xSQL: String;
Begin
   xSQL := '';
   xSQL := 'SELECT ' + wCampos + ' FROM ' + wTabla;
   If length(wWhere) > 0 Then
      xSQL := xSQL + ' WHERE ' + wWhere;
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   result := cdsQry.FieldByName(wResult).Asstring;
End;

Function TDMALM.BuscaUltFecha(xPrv, xTabla, xCampo, xWhere: String): TDate;
Var
   xSQL: String;
   Y, M, D: Word;
Begin
   xSQL := 'SELECT MAX(' + xCampo + ') AS MAXFECHA FROM ' + xTabla;
   If length(xWhere) > 0 Then
      xSQL := xSQL + ' WHERE ' + xWhere;
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If Length(Trim(cdsQry.FieldByName('MAXFECHA').AsString)) = 0 Then
   Begin
      DecodeDate(Date, Y, M, D);
      result := StrToDate('01/' + inttostr(M) + '/' + InttoStr(Y)) - 1;
   End
   Else
   Begin
      result := (cdsQry.FieldByName('MAXFECHA').AsDateTime);
   End;
End;

Procedure TDMALM.Accesos;
Begin
 // buscar xCDS en Referencias y se toma ZArchivo
   FiltraTabla(cdsCia, 'TGE101', 'CIAID', 'CIAID');
   FiltraTabla(cdsTDoc, 'TGE110', 'DOCID', 'DOCID');
   FiltraTabla(cdsTMoneda, 'TGE103', 'TMONID', 'TMONID');
   FiltraTabla(cdsCCost, 'TGE203', 'CCOSID', 'CCOSID');
End;

Procedure TDMALM.AbrirCDS(xxCds: TwwClientDataSet);
Begin
   xxCds.Open;
End;

Procedure TDMALM.AbrirTabla(xxTabla: TwwTable);
Begin
   xxTabla.Open;
End;

Procedure TDMALM.ActualizaCantidadMontoCIM(CantidadG, CantidadU, Contenido: double; SumaResta: Char;
   Var PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU: Double);
Var
   CantidadUT, AcarreoG, MontoAcarreo, xTotalPlata, xCantTotalU: Double;
   PrecioAntG, PrecioAntU, CantNew, CantAntU: double;
   CantGCIM, CantUCIM, MontoGCIM, MontoUCIM: double;
Begin
   CantNew := 0;
   PrecioAntG := PrecioG;
   PrecioAntU := PrecioU;
   CantAntU := CantidadU;

   CantidadUT := CantidadActU + CantidadU;
   AcarreoG := 0;
   MontoAcarreo := 0;
   If SumaResta = 'S' Then
      CocienteResto(CantidadUT, Contenido, AcarreoG, CantidadU)
   Else
   Begin
      CocienteRestoFalta(CantidadUT, Contenido, AcarreoG, CantidadU);
   End;
   If SumaResta = 'S' Then
   Begin
      CantNew := 0;
      CantNew := (CantidadG * Contenido + CantAntU);

      MontoActG := MontoActG + MontoActU + (CantNew * PrecioAntU);
      MontoActU := CantAntU * PrecioAntU;
   End
   Else
      If SumaResta = 'R' Then
      Begin
         CantNew := 0;
         CantNew := (CantidadG * Contenido + CantAntU);

         MontoActG := MontoActG + MontoActU - (CantNew * PrecioAntU);
         MontoActU := CantidadU * PrecioAntU;
      End;

   If MontoActU > 0 Then
      MontoActG := MontoActG - MontoActU;

   //PARA CANTIDADES
   CantidadU := CantAntU;
   If (SumaResta = 'R') Then
   Begin
      CantidadG := -CantidadG;
      CantidadU := -CantidadU;
   End;
   If SumaResta = 'S' Then
   Begin
      xCantTotalU := CantidadActG * Contenido + CantidadActU + CantidadG * Contenido + CantidadU;
   End;
   CantidadUT := CantidadActU + CantidadU;
   AcarreoG := 0;

   If SumaResta = 'S' Then
      CocienteResto(CantidadUT, Contenido, AcarreoG, CantidadU)
   Else
   Begin
      CocienteRestoFalta(CantidadUT, Contenido, AcarreoG, CantidadU);
   End;
   CantidadActG := CantidadActG + CantidadG + AcarreoG;
   CantidadActU := CantidadU;
End;

Procedure TDMALM.SaldosInicialesCLG(sCIA, sArt, xAnoMes: String; sContenido, sPrecio: Double);
Var
   xMes: Integer;
   xPrestUniG, xPrestUniU, xPrestPrecio: double;
   Y1, M1, D1: word;
   xM: String;
Begin
   xMes := StrtoInt(copy(xAnoMes, 5, 2));
   If cdsSTK.State In [dsEdit, dsInsert] Then
      cdsSTK.Post;
   cdsstk.Edit; //  SALDOS INICIALES

   If sContenido > 1 Then
   Begin
 // Saldos Iniciales de Febrero
      If XMes <= 1 Then
      Begin
         xPrestUniG := 0; // Acarreo a descontar de la cantidad general
         xPrestUniU := 0; // Contenido del artículo a prestar a la cantidad unitaria
         xPrestPrecio := 0; // Precio a considerar en acarreo
         If cdsSTK.FieldByName('STKSSU01').AsFloat > (cdsSTK.FieldByName('STKTSU01').AsFloat + cdsSTK.FieldByName('STKISU01').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG02').AsFloat := FRound(cdsSTK.FieldByName('STKTSG01').AsFloat
            + cdsSTK.FieldByName('STKISG01').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG01').AsFloat, 15, 4);

         cdsSTK.FieldByName('STKTSU02').AsFloat := FRound(cdsSTK.FieldByName('STKTSU01').AsFloat
            + cdsSTK.FieldByName('STKISU01').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU01').AsFloat, 15, 4);

         cdsSTK.FieldByName('STKTMG02').AsFloat := FRound(cdsSTK.FieldByName('STKTMG01').AsFloat
            + cdsSTK.FieldByName('STKIMG01').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG01').AsFloat, 15, 4);

         cdsSTK.FieldByName('STKTMU02').AsFloat := FRound(cdsSTK.FieldByName('STKTMU01').AsFloat
            + cdsSTK.FieldByName('STKIMU01').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU01').AsFloat, 15, 4);
      End;
 // Saldos Iniciales de Marzo
      If XMes <= 2 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU02').AsFloat >
            (cdsSTK.FieldByName('STKTSU02').AsFloat + cdsSTK.FieldByName('STKISU02').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG03').AsFloat := FRound(cdsSTK.FieldByName('STKTSG02').AsFloat
            + cdsSTK.FieldByName('STKISG02').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG02').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU03').AsFloat := FRound(cdsSTK.FieldByName('STKTSU02').AsFloat
            + cdsSTK.FieldByName('STKISU02').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU02').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG03').AsFloat := FRound(cdsSTK.FieldByName('STKTMG02').AsFloat
            + cdsSTK.FieldByName('STKIMG02').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG02').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU03').AsFloat := FRound(cdsSTK.FieldByName('STKTMU02').AsFloat
            + cdsSTK.FieldByName('STKIMU02').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU02').AsFloat, 15, 4);
      End;
 // Saldos Iniciales de Abril
      If XMes <= 3 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU03').AsFloat >
            (cdsSTK.FieldByName('STKTSU03').AsFloat + cdsSTK.FieldByName('STKISU03').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG04').AsFloat := FRound(cdsSTK.FieldByName('STKTSG03').AsFloat
            + cdsSTK.FieldByName('STKISG03').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG03').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU04').AsFloat := FRound(cdsSTK.FieldByName('STKTSU03').AsFloat
            + cdsSTK.FieldByName('STKISU03').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU03').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG04').AsFloat := FRound(cdsSTK.FieldByName('STKTMG03').AsFloat
            + cdsSTK.FieldByName('STKIMG03').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG03').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU04').AsFloat := FRound(cdsSTK.FieldByName('STKTMU03').AsFloat
            + cdsSTK.FieldByName('STKIMU03').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU03').AsFloat, 15, 4);
      End;
 // Saldos Iniciales de Mayo
      If XMes <= 4 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU04').AsFloat >
            (cdsSTK.FieldByName('STKTSU04').AsFloat + cdsSTK.FieldByName('STKISU04').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG05').AsFloat := FRound(cdsSTK.FieldByName('STKTSG04').AsFloat
            + cdsSTK.FieldByName('STKISG04').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG04').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU05').AsFloat := FRound(cdsSTK.FieldByName('STKTSU04').AsFloat
            + cdsSTK.FieldByName('STKISU04').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU04').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG05').AsFloat := FRound(cdsSTK.FieldByName('STKTMG04').AsFloat
            + cdsSTK.FieldByName('STKIMG04').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG04').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU05').AsFloat := FRound(cdsSTK.FieldByName('STKTMU04').AsFloat
            + cdsSTK.FieldByName('STKIMU04').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU04').AsFloat, 15, 4);
      End;
 // Saldos Iniciales de Junio
      If XMes <= 5 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU05').AsFloat >
            (cdsSTK.FieldByName('STKTSU05').AsFloat + cdsSTK.FieldByName('STKISU05').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG06').AsFloat := FRound(cdsSTK.FieldByName('STKTSG05').AsFloat
            + cdsSTK.FieldByName('STKISG05').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG05').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU06').AsFloat := FRound(cdsSTK.FieldByName('STKTSU05').AsFloat
            + cdsSTK.FieldByName('STKISU05').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU05').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG06').AsFloat := FRound(cdsSTK.FieldByName('STKTMG05').AsFloat
            + cdsSTK.FieldByName('STKIMG05').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG05').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU06').AsFloat := FRound(cdsSTK.FieldByName('STKTMU05').AsFloat
            + cdsSTK.FieldByName('STKIMU05').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU05').AsFloat, 15, 4);
      End;
 // Saldos Iniciales de Julio
      If XMes <= 6 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU06').AsFloat >
            (cdsSTK.FieldByName('STKTSU06').AsFloat + cdsSTK.FieldByName('STKISU06').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG07').AsFloat := FRound(cdsSTK.FieldByName('STKTSG06').AsFloat
            + cdsSTK.FieldByName('STKISG06').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG06').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU07').AsFloat := FRound(cdsSTK.FieldByName('STKTSU06').AsFloat
            + cdsSTK.FieldByName('STKISU06').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU06').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG07').AsFloat := FRound(cdsSTK.FieldByName('STKTMG06').AsFloat
            + cdsSTK.FieldByName('STKIMG06').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG06').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU07').AsFloat := FRound(cdsSTK.FieldByName('STKTMU06').AsFloat
            + cdsSTK.FieldByName('STKIMU06').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU06').AsFloat, 15, 4);
      End;
 // Saldos Iniciales de Agosto
      If XMes <= 7 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU07').AsFloat >
            (cdsSTK.FieldByName('STKTSU07').AsFloat + cdsSTK.FieldByName('STKISU07').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG08').AsFloat := FRound(cdsSTK.FieldByName('STKTSG07').AsFloat
            + cdsSTK.FieldByName('STKISG07').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG07').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU08').AsFloat := FRound(cdsSTK.FieldByName('STKTSU07').AsFloat
            + cdsSTK.FieldByName('STKISU07').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU07').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG08').AsFloat := FRound(cdsSTK.FieldByName('STKTMG07').AsFloat
            + cdsSTK.FieldByName('STKIMG07').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG07').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU08').AsFloat := FRound(cdsSTK.FieldByName('STKTMU07').AsFloat
            + cdsSTK.FieldByName('STKIMU07').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU07').AsFloat, 15, 4);
      End;
 // Saldos Iniciales de Setiembre
      If XMes <= 8 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU08').AsFloat >
            (cdsSTK.FieldByName('STKTSU08').AsFloat + cdsSTK.FieldByName('STKISU08').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG09').AsFloat := FRound(cdsSTK.FieldByName('STKTSG08').AsFloat
            + cdsSTK.FieldByName('STKISG08').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG08').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU09').AsFloat := FRound(cdsSTK.FieldByName('STKTSU08').AsFloat
            + cdsSTK.FieldByName('STKISU08').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU08').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG09').AsFloat := FRound(cdsSTK.FieldByName('STKTMG08').AsFloat
            + cdsSTK.FieldByName('STKIMG08').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG08').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU09').AsFloat := FRound(cdsSTK.FieldByName('STKTMU08').AsFloat
            + cdsSTK.FieldByName('STKIMU08').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU08').AsFloat, 15, 4);
      End;
 // Saldos Iniciales de Octubre
      If XMes <= 9 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU09').AsFloat >
            (cdsSTK.FieldByName('STKTSU09').AsFloat + cdsSTK.FieldByName('STKISU09').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG10').AsFloat := FRound(cdsSTK.FieldByName('STKTSG09').AsFloat
            + cdsSTK.FieldByName('STKISG09').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG09').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU10').AsFloat := FRound(cdsSTK.FieldByName('STKTSU09').AsFloat
            + cdsSTK.FieldByName('STKISU09').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU09').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG10').AsFloat := FRound(cdsSTK.FieldByName('STKTMG09').AsFloat
            + cdsSTK.FieldByName('STKIMG09').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG09').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU10').AsFloat := FRound(cdsSTK.FieldByName('STKTMU09').AsFloat
            + cdsSTK.FieldByName('STKIMU09').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU09').AsFloat, 15, 4);
      End;
 // Saldos Iniciales de Noviembre
      If XMes <= 10 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU10').AsFloat >
            (cdsSTK.FieldByName('STKTSU10').AsFloat + cdsSTK.FieldByName('STKISU10').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG11').AsFloat := FRound(cdsSTK.FieldByName('STKTSG10').AsFloat
            + cdsSTK.FieldByName('STKISG10').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG10').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU11').AsFloat := FRound(cdsSTK.FieldByName('STKTSU10').AsFloat
            + cdsSTK.FieldByName('STKISU10').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU10').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG11').AsFloat := FRound(cdsSTK.FieldByName('STKTMG10').AsFloat
            + cdsSTK.FieldByName('STKIMG10').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG10').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU11').AsFloat := FRound(cdsSTK.FieldByName('STKTMU10').AsFloat
            + cdsSTK.FieldByName('STKIMU10').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU10').AsFloat, 15, 4);
      End;
 // Saldos Iniciales de Diciembre
      If XMes <= 11 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU11').AsFloat >
            (cdsSTK.FieldByName('STKTSU11').AsFloat + cdsSTK.FieldByName('STKISU11').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG12').AsFloat := FRound(cdsSTK.FieldByName('STKTSG11').AsFloat
            + cdsSTK.FieldByName('STKISG11').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG11').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU12').AsFloat := FRound(cdsSTK.FieldByName('STKTSU11').AsFloat
            + cdsSTK.FieldByName('STKISU11').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU11').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG12').AsFloat := FRound(cdsSTK.FieldByName('STKTMG11').AsFloat
            + cdsSTK.FieldByName('STKIMG11').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG11').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU12').AsFloat := FRound(cdsSTK.FieldByName('STKTMU11').AsFloat
            + cdsSTK.FieldByName('STKIMU11').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU11').AsFloat, 15, 4);

         DecodeDate(cdsKDX.FieldByName('NISAFREG').AsDateTime, Y1, M1, D1);
         M1 := M1 + 1;
         If M1 > 12 Then
            M1 := 12;

         If M1 < 10 Then
            xM := '0' + Floattostr(M1)
         Else
            xM := Floattostr(M1);

         cdsSTK.FieldByName('STKSACTG').AsFloat := FRound((cdsSTK.FieldByName('STKTSG' + xM).AsFloat + cdsSTK.FieldByName('STKISG' + xM).AsFloat) - cdsSTK.FieldByName('STKSSG' + xM).AsFloat, 15, 4);
         cdsSTK.FieldByName('STKSACTU').AsFloat := FRound((cdsSTK.FieldByName('STKTSU' + xM).AsFloat + cdsSTK.FieldByName('STKISU' + xM).AsFloat) - cdsSTK.FieldByName('STKSSU' + xM).AsFloat, 15, 4);
         cdsSTK.FieldByName('STKMACTG').AsFloat := FRound((cdsSTK.FieldByName('STKTMG' + xM).AsFloat + cdsSTK.FieldByName('STKIMG' + xM).AsFloat) - cdsSTK.FieldByName('STKSMG' + xM).AsFloat, 15, 4);
         cdsSTK.FieldByName('STKMACTU').AsFloat := FRound((cdsSTK.FieldByName('STKTMU' + xM).AsFloat + cdsSTK.FieldByName('STKIMU' + xM).AsFloat) - cdsSTK.FieldByName('STKSMU' + xM).AsFloat, 15, 4);
      End;
   End
   Else
   Begin // si el contenido del artículo ARTCONT=1
      If XMes <= 1 Then
      Begin
         cdsSTK.FieldByName('STKTSG02').AsFloat := FRound(cdsSTK.FieldByName('STKTSG01').AsFloat
            + cdsSTK.FieldByName('STKISG01').AsFloat
            - cdsSTK.FieldByName('STKSSG01').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG02').AsFloat := FRound(cdsSTK.FieldByName('STKTMG01').AsFloat
            + cdsSTK.FieldByName('STKIMG01').AsFloat
            - cdsSTK.FieldByName('STKSMG01').AsFloat, 15, 4);
      End;

      If XMes <= 2 Then
      Begin
         cdsSTK.FieldByName('STKTSG03').AsFloat := FRound(cdsSTK.FieldByName('STKTSG02').AsFloat
            + cdsSTK.FieldByName('STKISG02').AsFloat
            - cdsSTK.FieldByName('STKSSG02').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG03').AsFloat := FRound(cdsSTK.FieldByName('STKTMG02').AsFloat
            + cdsSTK.FieldByName('STKIMG02').AsFloat
            - cdsSTK.FieldByName('STKSMG02').AsFloat, 15, 4);
      End;

      If XMes <= 3 Then
      Begin
         cdsSTK.FieldByName('STKTSG04').AsFloat := FRound(cdsSTK.FieldByName('STKTSG03').AsFloat
            + cdsSTK.FieldByName('STKISG03').AsFloat
            - cdsSTK.FieldByName('STKSSG03').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG04').AsFloat := FRound(cdsSTK.FieldByName('STKTMG03').AsFloat
            + cdsSTK.FieldByName('STKIMG03').AsFloat
            - cdsSTK.FieldByName('STKSMG03').AsFloat, 15, 4);
      End;
      If XMes <= 4 Then
      Begin
         cdsSTK.FieldByName('STKTSG05').AsFloat := FRound(cdsSTK.FieldByName('STKTSG04').AsFloat
            + cdsSTK.FieldByName('STKISG04').AsFloat
            - cdsSTK.FieldByName('STKSSG04').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG05').AsFloat := FRound(cdsSTK.FieldByName('STKTMG04').AsFloat
            + cdsSTK.FieldByName('STKIMG04').AsFloat
            - cdsSTK.FieldByName('STKSMG04').AsFloat, 15, 4);
      End;

      If XMes <= 5 Then
      Begin
         cdsSTK.FieldByName('STKTSG06').AsFloat := FRound(cdsSTK.FieldByName('STKTSG05').AsFloat
            + cdsSTK.FieldByName('STKISG05').AsFloat
            - cdsSTK.FieldByName('STKSSG05').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG06').AsFloat := FRound(cdsSTK.FieldByName('STKTMG05').AsFloat
            + cdsSTK.FieldByName('STKIMG05').AsFloat
            - cdsSTK.FieldByName('STKSMG05').AsFloat, 15, 4);
      End;

      If XMes <= 6 Then
      Begin
         cdsSTK.FieldByName('STKTSG07').AsFloat := FRound(cdsSTK.FieldByName('STKTSG06').AsFloat
            + cdsSTK.FieldByName('STKISG06').AsFloat
            - cdsSTK.FieldByName('STKSSG06').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG07').AsFloat := FRound(cdsSTK.FieldByName('STKTMG06').AsFloat
            + cdsSTK.FieldByName('STKIMG06').AsFloat
            - cdsSTK.FieldByName('STKSMG06').AsFloat, 15, 4);
      End;

      If XMes <= 7 Then
      Begin
         cdsSTK.FieldByName('STKTSG08').AsFloat := FRound(cdsSTK.FieldByName('STKTSG07').AsFloat
            + cdsSTK.FieldByName('STKISG07').AsFloat
            - cdsSTK.FieldByName('STKSSG07').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG08').AsFloat := FRound(cdsSTK.FieldByName('STKTMG07').AsFloat
            + cdsSTK.FieldByName('STKIMG07').AsFloat
            - cdsSTK.FieldByName('STKSMG07').AsFloat, 15, 4);
      End;

      If XMes <= 8 Then
      Begin
         cdsSTK.FieldByName('STKTSG09').AsFloat := FRound(cdsSTK.FieldByName('STKTSG08').AsFloat
            + cdsSTK.FieldByName('STKISG08').AsFloat
            - cdsSTK.FieldByName('STKSSG08').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG09').AsFloat := FRound(cdsSTK.FieldByName('STKTMG08').AsFloat
            + cdsSTK.FieldByName('STKIMG08').AsFloat
            - cdsSTK.FieldByName('STKSMG08').AsFloat, 15, 4);
      End;

      If XMes <= 9 Then
      Begin
         cdsSTK.FieldByName('STKTSG10').AsFloat := FRound(cdsSTK.FieldByName('STKTSG09').AsFloat
            + cdsSTK.FieldByName('STKISG09').AsFloat
            - cdsSTK.FieldByName('STKSSG09').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG10').AsFloat := FRound(cdsSTK.FieldByName('STKTMG09').AsFloat
            + cdsSTK.FieldByName('STKIMG09').AsFloat
            - cdsSTK.FieldByName('STKSMG09').AsFloat, 15, 4);
      End;

      If XMes <= 10 Then
      Begin
         cdsSTK.FieldByName('STKTSG11').AsFloat := FRound(cdsSTK.FieldByName('STKTSG10').AsFloat
            + cdsSTK.FieldByName('STKISG10').AsFloat
            - cdsSTK.FieldByName('STKSSG10').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG11').AsFloat := FRound(cdsSTK.FieldByName('STKTMG10').AsFloat
            + cdsSTK.FieldByName('STKIMG10').AsFloat
            - cdsSTK.FieldByName('STKSMG10').AsFloat, 15, 4);
      End;

      If XMes <= 11 Then
         cdsSTK.FieldByName('STKTSG12').AsFloat := FRound(cdsSTK.FieldByName('STKTSG11').AsFloat
            + cdsSTK.FieldByName('STKISG11').AsFloat
            - cdsSTK.FieldByName('STKSSG11').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG12').AsFloat := FRound(cdsSTK.FieldByName('STKTMG11').AsFloat
         + cdsSTK.FieldByName('STKIMG11').AsFloat
         - cdsSTK.FieldByName('STKSMG11').AsFloat, 15, 4);

    //////////////////////////////////////////////////////////////
      DecodeDate(cdsKDX.FieldByName('NISAFREG').AsDateTime, Y1, M1, D1);
      M1 := M1 + 1;
      If M1 > 12 Then
         M1 := 12;

      If M1 < 10 Then
         xM := '0' + Floattostr(M1)
      Else
         xM := Floattostr(M1);

      cdsSTK.FieldByName('STKSACTG').AsFloat := FRound((cdsSTK.FieldByName('STKTSG' + xM).AsFloat + cdsSTK.FieldByName('STKISG' + xM).AsFloat) - cdsSTK.FieldByName('STKSSG' + xM).AsFloat, 15, 4);
      cdsSTK.FieldByName('STKMACTG').AsFloat := FRound((cdsSTK.FieldByName('STKTMG' + xM).AsFloat + cdsSTK.FieldByName('STKIMG' + xM).AsFloat) - cdsSTK.FieldByName('STKSMG' + xM).AsFloat, 15, 4);
    //////////////////////////////////////////////////////////////

   End;
   cdsstk.Post; //  SALDOS INICIALES
End;

Procedure TDMALM.ActualizaArticuloCIM(sCIA, sArt: String; Contenido: Double; IngSal: Char);
Var
   CantidadActG, CantidadActU, MontoActG, MontoActU: Double;
   CantidadG, CantidadU, PrecioG, PrecioU: Double;
   SumaResta: Char;
Begin
   If (IngSal <> 'S') And (IngSal <> 'I') Then
   Begin
      showMessage('Error en parámetro para actualizar Maestro de Artículos');
      exit;
   End;

   If IngSal = 'S' Then
   Begin
      PrecioG := FRound(cdsArtiStk.FieldByName('ARTCPROG').AsFloat, 15, 4);
      PrecioU := FRound(cdsArtiStk.FieldByName('ARTCPROU').AsFloat, 15, 4);
      SumaResta := 'R';
   End
   Else
   Begin
      PrecioG := cdsKDX.FieldByName('ARTPCG').AsFloat;
      PrecioU := cdsKDX.FieldByName('ARTPCU').AsFloat;
      SumaResta := 'S';
   End;
   CantidadG := cdsKDX.FieldByName('KDXCNTG').AsFloat;
   CantidadU := cdsKDX.FieldByName('KDXCNTU').AsFloat;

   CantidadActG := cdsArtiStk.FieldByName('ARTCNTG').AsFloat;
   CantidadActU := cdsArtiStk.FieldByName('ARTCNTU').AsFloat;
   MontoActG := cdsArtiStk.FieldByName('ARTMNTG').AsFloat;
   MontoActU := cdsArtiStk.FieldByName('ARTMNTU').AsFloat;

   ActualizaCantidadMonto(CantidadG, CantidadU, Contenido, SumaResta, PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU);

   cdsArtiStk.edit;
   cdsArtiStk.FieldByName('ARTCNTG').AsFloat := FRound(CantidadActG, 15, 4);
   cdsArtiStk.FieldByName('ARTCNTU').AsFloat := FRound(CantidadActU, 15, 4);
   cdsArtiStk.FieldByName('ARTMNTG').AsFloat := FRound(MontoActG, 15, 4);
   cdsArtiStk.FieldByName('ARTMNTU').AsFloat := FRound(MontoActU, 15, 4);

   cdsArtiStk.FieldByName('ARTCPROG').AsFloat := FRound(PrecioG, 15, 4);
   cdsArtiStk.FieldByName('ARTCPROU').AsFloat := FRound(PrecioU, 15, 4);
   cdsSTK.Edit;
   cdsSTK.FieldByName('STKMACTG').AsFloat := FRound(cdsSTK.FieldByName('STKSACTG').AsFloat * PrecioG, 15, 4); // 41 * 0.5031 * 48
   cdsSTK.FieldByName('STKMACTU').AsFloat := FRound(cdsSTK.FieldByName('STKSACTU').AsFloat * PrecioU, 15, 4);
   cdsSTK.Post;

   If IngSal = 'I' Then
   Begin
      cdsArtiStk.FieldByName('ARTFUC').AsDateTime := cdsKDX.FieldByName('NISAFREG').AsDateTime;
      If cdsKDX.FieldByName('NISAFREG').AsDateTime > cdsArtiStk.FieldByName('ARTFUPRC').AsDateTime Then
      Begin
         cdsArtiStk.FieldByName('ARTPCG').AsFloat := FRound(cdsKDX.FieldByName('ARTPCG').AsFloat, 15, 4);
         cdsArtiStk.FieldByName('ARTPCU').AsFloat := FRound(cdsKDX.FieldByName('ARTPCU').AsFloat, 15, 4);
         cdsArtiStk.FieldByName('ARTFUPRC').AsDateTime := cdsKDX.FieldByName('NISAFREG').AsDateTime;
      End;
   End;
   cdsArtiStk.FieldByName('ARTFUMV').AsDateTime := cdsKDX.FieldByName('NISAFREG').AsDateTime;

   cdsArtiStk.post;
End;

Procedure TDMALM.ActualizaRQUS(sCIA: String; Contenido: Double);
Var
   fCNAT, fCTS: Double;
   fCNATg, fCNATu, fCTSg, fCTSu: Double;
   fCINgresada: Double;
   xSQL, sODCID, sDODCID, sCCOSTO: String;
Begin
   sODCID := cdsKDX.FieldByName('KDXNREQ').AsString;
   sDODCID := cdsKDX.FieldByName('DODCID').AsString;
   sCCOSTO := cdsKDX.FieldByName('CCOSID').AsString;

   xSQL := 'SELECT * FROM LOG307 WHERE CIAID=' + quotedstr(sCIA) +
      ' AND URQID=' + quotedstr(sODCID) +
      ' AND DURQID=' + quotedstr(sDODCID) +
      ' AND CCOSID=' + quotedstr(sCCOSTO);

   cdsDOCATT2.Close;
   cdsDOCATT2.DataRequest(xSQL);
   cdsDOCATT2.Open;
   If cdsDOCATT2.RecordCount = 0 Then
   Begin
      MessageDlg(' Error buscando en la Requerimiento ' + #13 + sCIA + ';' + sODCID + ';' + sDODCID, mtError, [mbOk], 0);
      exit;
   End;

   fCTS := cdsDOCATT2.FieldByName('DURQCNSLG').AsFloat * Contenido + cdsDOCATT2.FieldByName('DURQCNSLU').AsFloat;
   FCNAT := cdsDOCATT2.FieldByName('DURQCNATG').AsFloat * Contenido + cdsDOCATT2.FieldByName('DURQCNATU').AsFloat;

   fCIngresada := cdsKDX.FieldByName('KDXCNTG').AsFloat * Contenido + cdsKDX.FieldByName('KDXCNTU').AsFloat;

   fCNAT := fCNAT + fCIngresada;
   fCTS := fCTS - fCIngresada;

   CocienteResto(fCNAT, Contenido, fCNATg, fCNATu);
   CocienteResto(fCTS, Contenido, fCTSg, fCTSu);

   cdsDOCATT2.Edit;
   cdsDOCATT2.FieldByName('DURQCNATG').AsFloat := fCNATg;
   cdsDOCATT2.FieldByName('DURQCNATU').AsFloat := fCNATu;
   cdsDOCATT2.FieldByName('DURQCNSLG').AsFloat := fCTSg;
   cdsDOCATT2.FieldByName('DURQCNSLU').AsFloat := fCTSu;

   If fCTS <= 0 Then
      cdsDOCATT2.FieldByName('DURQEST').AsString := 'ATENDIDO'
   Else
      cdsDOCATT2.FieldByName('DURQEST').AsString := 'PARCIAL';

End;

Procedure TDMALM.ActualizaEstadoRQUS(sCIA: String);
Var
   sODC, sLOC, sCOS, sSQL: String;
   iNTT, iATT, iPTT: Integer;
Begin
   cdsOCNIA.First;
   While Not cdsOCNIA.Eof Do
   Begin
      sODC := cdsOCNIA.FieldByName('URQID').AsString;
      sLOC := cdsOCNIA.FieldByName('LOCID').AsString;
      sCOS := cdsOCNIA.FieldByName('CCOSID').AsString;
    // contar el # de items que tiene la orden
      cdsSQL.Close;
      sSQL := ' SELECT COUNT(URQID) AS NTT FROM LOG307' +
         ' WHERE CIAID=' + Quotedstr(sCIA) + ' AND LOCID=''' + sLOC + '''' +
         ' AND CCOSID=' + Quotedstr(sCOS) + ' AND URQID=''' + sODC + '''';
      cdsSQL.DataRequest(sSQL);
      cdsSQL.Open;

      iNTT := cdsSQL.FieldByName('NTT').AsInteger;
    // contar el # de items atendidos que tiene la orden
      cdsSQL.Close;
      sSQL := ' SELECT COUNT(DURQEST) AS ATT FROM LOG307' +
         ' WHERE CIAID=''' + sCIA + ''' AND LOCID=''' + sLOC + '''' +
         ' AND CCOSID=''' + sCOS + ''' AND URQID=''' + sODC + '''' +
         ' AND DURQEST=''ATENDIDO''';
      cdsSQL.DataRequest(sSQL);
      cdsSQL.Open;

      iATT := cdsSQL.FieldByName('ATT').AsInteger;
    // contar el # de items atendidos parcialmente que tiene la orden
      cdsSQL.Close;
      sSQL := ' SELECT COUNT(DURQEST) AS PTT FROM LOG307' +
         ' WHERE CIAID=''' + sCIA + ''' AND LOCID=''' + sLOC + '''' +
         ' AND CCOSID=''' + sCOS + ''' AND URQID=''' + sODC + '''' +
         ' AND DURQEST=''PARCIAL''';
      cdsSQL.DataRequest(sSQL);
      cdsSQL.Open;
      iPTT := cdsSQL.FieldByName('PTT').AsInteger;
      If iNTT = iATT Then
      Begin
    // la orden ha sido atendida totalmente
         sSQL := ' UPDATE LOG306 SET URQEST=''ATENDIDO'' WHERE ' +
            ' CIAID=''' + sCIA + ''' AND LOCID=''' + sLOC + '''' +
            ' AND CCOSID=''' + sCOS + ''' AND URQID=''' + sODC + '''';

      End
      Else
         If (iPTT > 0) Or (iATT > 0) Then
         Begin
    // la orden ha sido atendida parcialmente
            sSQL := ' UPDATE LOG306 SET URQEST=''PARCIAL'' WHERE ' +
               ' CIAID=''' + sCIA + ''' AND LOCID=''' + sLOC + '''' +
               ' AND CCOSID=''' + sCOS + ''' AND URQID=''' + sODC + '''';
         End;
      Try
         DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         ControlTran(1, Nil, ''); //ROLLBACK
      End;

      cdsOCNIA.Next;
   End;
End;

Function TDMALM.AnoNumDoc(Flag, Num, Ano: String): String;
Begin

   If Flag = 'S' Then
   Begin
      If copy(Num, 1, 4) = Ano Then
         Num := Num
      Else
         Num := Ano + '0001'
   End
   Else
      Num := Num;
   Result := Num;
End;

Function TDMALM.OperClientDataSet(ClientDataSet: TwwClientDataSet; Expression, Condicion: String): Double;
Var
   cdsClone: TwwClientDataSet;
   bmk: TBookmark;
   Agg: TAggregate;
Begin
   result := 0;
   If trim(Expression) = '' Then
      Exit;
   bmk := ClientDataSet.GetBookmark;
   cdsClone := TwwClientDataSet.Create(Nil);
   Try
      cdsClone.CloneCursor(ClientDataSet, True);
      Agg := cdsClone.Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := Expression;
      Agg.Active := True;
      If Trim(Condicion) <> '' Then
      Begin
         cdsClone.Filtered := False;
         cdsClone.Filter := Condicion;
         cdsClone.Filtered := True;
      End;
      If cdsClone.Aggregates.Items[cdsClone.Aggregates.IndexOf('OPER')].Value <> NULL Then
         result := cdsClone.Aggregates.Items[cdsClone.Aggregates.IndexOf('OPER')].Value;
      cdsClone.Aggregates.Clear;
      ClientDataSet.GotoBookmark(bmk);
      ClientDataSet.FreeBookmark(bmk);
   Finally
      cdsClone.Free;
   End;
End;

Procedure TDMALM.Transferencia_CXP_a_CNT(xCia, xTDia, xAAMM, xNoComp, xTipoC: String);
Var
   xSQL, xWhere: String;
   xNombreBoton: String;
   cdsDetCxPx {, cdsDetCxP2}: TwwClientDataSet;
   xContR: Integer;
   xTOTMG, xTOTTO, xxTCambio: Double;
   D, M, Y: Word;
   sTCambio, sFecha, sVeid, xSQLON, xTCtaD, xTCtaH: String;
   NISAANO, NISAMES, NISADIA, NISAANOMES, NISATRIM, NISASEM, NISASS, NISAAATRI, NISAAASEM, NISAAASS, NISANOMM: String;
Begin

   Screen.Cursor := CrHourGlass;
   xSQLON := '';
   sVeid := DisplayDescrip('prvTGE', 'CXC203', 'VEID', 'VEFCORP=' + quotedstr('S'), 'VEID');

   xSQL := 'SELECT ' + wRepFuncChar + wRepFecServi + ', ' + QuotedStr(wFormatFecha) + ') "FECHA", ' + wRepFecServi + ' HORA FROM DUAL';

   cdsPeriodo.Close;
   cdsPeriodo.DataRequest(xSQL);
   cdsPeriodo.Open;
   xFec_Sis := cdsPeriodo.FieldByName('FECHA').AsString;
   xHor_Sis := cdsPeriodo.FieldByName('HORA').AsString;

   sTCambio := CalcTipoCambio(wTMonExt, StrtoDate(xFec_Sis), wTipoCambioUsar);

   sFecha := FormatDateTime(wFormatFecha, StrtoDate(xFec_Sis));
   xSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
   FiltraCDS(cdsPeriodo, xSQL);

   DecodeDate(StrtoDate(xFec_Sis), Y, M, D);

   NISAANO := IntToStr(Y);
   NISAMES := strzero(IntToStr(M), 2);
   NISADIA := strzero(IntToStr(D), 2);
   NISAANOMES := IntToStr(Y) + strzero(IntToStr(M), 2);
   NISATRIM := cdsPeriodo.fieldbyName('FECTRIM').asString;
   NISASEM := cdsPeriodo.fieldbyName('FECSEM').asString;
   NISASS := cdsPeriodo.fieldbyName('FECSS').asString;
   NISAAATRI := cdsPeriodo.fieldbyName('FECAATRI').asString;
   NISAAASEM := cdsPeriodo.fieldbyName('FECAASEM').asString;
   NISAAASS := cdsPeriodo.fieldbyName('FECAASS').asString;
   NISANOMM := IntToStr(Y) + strzero(IntToStr(M), 2);

   If wDinCtbl = 'FORM' Then
   Begin
      cdsHijo.First;
      While Not cdsHijo.Eof Do
      Begin
         xSQL := 'TRIID=' + quotedstr(cdsHijo.FieldByName('TRIID').AsString);
         DisplayDescrip('prvTGE', 'TGE208', 'TRIDES, TRISGT', xSQL, 'TRIDES');

         If cdsQry.FieldByName('TRISGT').AsString = 'I' Then
         Begin
            xTCtaD := 'D.DEBE';
            xTCtaH := 'D.HABER';
         End
         Else
            If cdsQry.FieldByName('TRISGT').AsString = 'S' Then
            Begin
               xTCtaD := 'D.HABER';
               xTCtaH := 'D.DEBE';
            End;

         If Length(Trim(xSQLON)) > 0 Then
            xSQLON := xSQLON + ' UNION ALL ';

         xSQL := 'SELECT ' + QuotedStr(xCia) + ' CIAID, T.TRISGT, DET.TRIID TRIEQUI, T.TRIDES, DET.GRARID, L.GRARDES DCPGLOSA, ' +
            xTCtaD + ' CUENTAID, D.GRUPO, D.SGRUPO, C.TMONID, X.CIADES, ' +
            'CASE WHEN C.TMONID=' + QuotedStr(wTMonLoc) + ' THEN ' + //'SUM(DET.KDXCNTG*DET.ARTPCG) ELSE 0 END TOTDEBE, '+
            'SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) ELSE ' +
            'SUM(CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) END TOTDEBE, ' +
            '0.00 TOTHABER, ''S'' FLAG, ''D'' DCPDH, ' + QuotedStr(xTDia) + ' TDIARID, ' + QuotedStr(xNoComp) + ' CPNOREG, ' +
            QuotedStr(xAAMM) + ' DCPANOMM, ' + QuotedStr(wModulo) + ' MODULO, CTA_AUX, CTA_CCOS, CTA_DOC, ' +
            sTCambio + ' CPTCAMPR, ' + wRepFecServi + ' CPFEMIS, ' + wRepFecServi + ' CPFVCMTO, ' +
            wRepFecServi + ' DCPFCOM, ''I'' DCPESTDO, ' + wRepFecServi + ' FECHA, ' + wRepHorServi + ' HORA, ' +
            '''' + NISAANO + ''' DCPANOC, ''' + NISAMES + ''' DCPMM, ' +
            '''' + NISADIA + ''' DCPDD, ''' + NISATRIM + ''' DCPTRI, ''' + NISASEM + ''' DCPSEM, ''' + NISASS + ''' DCPSS, ''' + NISAANOMES + ''' DCPANOMES, ' +
            '''' + NISAAATRI + ''' DCPAATRI, ''' + NISAAASEM + ''' DCPAASEM, ''' + NISAAASS + ''' DCPAASS, ' +
            'P.CTAABR, S.TDIARABR, ''S'' CNTCUADRE, ''000'' DCPLOTE, ' +
            '0.00 DCPMOORI, 0.00 DCPMOLOC, 0.00 DCPMOEXT, ' +
            '0.00 CPPRORORI, 0.00 CPPRORMOLOC, 0.00 CPPRORMOEXT ' +
            'FROM LOG315 DET ' +
            'LEFT JOIN TGE205 ART ON (DET.CIAID=ART.CIAID AND DET.ARTID=ART.ARTID) ' +
            'LEFT JOIN TGE208 T ON (T.TRIID=DET.TRIID) ' +
            'LEFT JOIN TGE101 X ON (X.CIAID=DET.CIAID) ' +
            'LEFT JOIN TGE131 L ON (L.CIAID=DET.CIAID AND L.GRARID=DET.GRARID) ';

         If cdsPadre.FieldByName('FLGCORP').AsString = 'S' Then
            xSQL := xSQL +
               'LEFT JOIN FAC303 GUIA ON (DET.CIAID=GUIA.CIAID AND DET.NISAID=GUIA.SERIENGUIA AND DET.TRIID=GUIA.TRIID) ';
         xSQL := xSQL +
            'INNER JOIN LOG205 D ON (D.CIAID=DET.CIAID AND D.TRIID=DET.TRIID AND D.TINID=DET.TINID AND D.GRARID=DET.GRARID) ' +
            'LEFT JOIN LOG204 C ON (C.CIAID=D.CIAID AND C.ASIENTO=D.ASIENTO AND C.GRUPO=D.GRUPO AND C.SGRUPO=D.SGRUPO AND C.TRIID=D.TRIID) ' +
            'LEFT JOIN LOG203 E ON (E.CIAID=D.CIAID AND E.ASIENTO=D.ASIENTO) ' +
            'LEFT JOIN TGE202 P ON (P.CIAID=D.CIAID AND P.CUENTAID=' + xTCtaD + ') ' +
            'LEFT JOIN TGE104 S ON (S.TDIARID=' + QuotedStr(xTDia) + ') ' +
            'WHERE DET.CIAID=' + QuotedStr(cdsPadre.FieldByName('CIAID').AsString) + ' ' +
            'AND MONTH(DET.NISAFREG)=' + IntToStr(StrToInt(copy(xAAMM, 5, 2))) + ' ' +
            'AND YEAR(DET.NISAFREG)=' + IntToStr(StrToInt(copy(xAAMM, 1, 4))) + ' ' +
            'AND COALESCE(DET.NISSIT,'''')=''ACEPTADO'' ' +
            'AND DET.TRIID=' + QuotedStr(cdsHijo.FieldByName('TRIID').AsString) + ' ';
         If cdsPadre.FieldByName('FLGCORP').AsString = 'S' Then
            xSQL := xSQL +
               'AND GUIA.VEID=' + Quotedstr(sVeid) + ' ';

         xSQL := xSQL +
            'AND C.CIAID=' + QuotedStr(cdsHijo.FieldByName('CIAID').AsString) + ' ' +
            'AND C.ASIENTO=' + QuotedStr(cdsHijo.FieldByName('ASIENTO').AsString) + ' ' +
            'AND C.GRUPO=' + QuotedStr(cdsHijo.FieldByName('GRUPO').AsString) + ' ' +
            'AND C.SGRUPO=' + QuotedStr(cdsHijo.FieldByName('SGRUPO').AsString) + ' ' +
            'AND C.TINID=' + QuotedStr(cdsHijo.FieldByName('TINID').AsString) + ' ' +
            'AND C.TRIID=' + QuotedStr(cdsHijo.FieldByName('TRIID').AsString) + ' ' +
            'GROUP BY T.TRISGT, DET.TRIID, T.TRIDES, DET.GRARID, L.GRARDES, ' + xTCtaD + ', D.GRUPO, D.SGRUPO, ' +
            'C.TMONID, X.CIADES, CTA_AUX, CTA_CCOS, CTA_DOC, P.CTAABR, S.TDIARABR ' +

         'UNION ALL ' +

         'SELECT ' + QuotedStr(xCia) + ' CIAID, T.TRISGT, DET.TRIID TRIEQUI, T.TRIDES, ''ZZ'' GRARID, C.DESCRIP||'' - ''||RTRIM(M.MESDESL)||' + QuotedStr(' - ' + copy(xAAMM, 1, 4)) + ' ' +
            'DCPGLOSA, ' + xTCtaH + ' CUENTAID, D.GRUPO, D.SGRUPO, C.TMONID, X.CIADES, 0.00 TOTDEBE, ' +
            'CASE WHEN C.TMONID=' + QuotedStr(wTMonLoc) + ' THEN ' +
            'SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) ELSE ' +
            'SUM(CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) END TOTHABER, ' +
            '''S'' FLAG, ''H'' DCPDH, ' + QuotedStr(xTDia) + ' TDIARID, ' + QuotedStr(xNoComp) + ' CPNOREG, ' +
            QuotedStr(xAAMM) + ' DCPANOMM, ' + QuotedStr(wModulo) + ' MODULO, CTA_AUX, CTA_CCOS, CTA_DOC, ' +
            sTCambio + ' CPTCAMPR, ' + wRepFecServi + ' CPFEMIS, ' + wRepFecServi + ' CPFVCMTO, ' +
            wRepFecServi + ' DCPFCOM, ''I'' DCPESTDO, ' + wRepFecServi + ' FECHA, ' + wRepHorServi + ' HORA, ' +
            '''' + NISAANO + ''' DCPANOC, ''' + NISAMES + ''' DCPMM, ' +
            '''' + NISADIA + ''' DCPDD, ''' + NISATRIM + ''' DCPTRI, ''' + NISASEM + ''' DCPSEM, ''' + NISASS + ''' DCPSS, ''' + NISAANOMES + ''' DCPANOMES, ' +
            '''' + NISAAATRI + ''' DCPAATRI, ''' + NISAAASEM + ''' DCPAASEM, ''' + NISAAASS + ''' DCPAASS, ' +
            'P.CTAABR, S.TDIARABR, ''S'' CNTCUADRE, ''000'' DCPLOTE, ' +

         '0.00 DCPMOORI, 0.00 DCPMOLOC, 0.00 DCPMOEXT, ' +
            '0.00 CPPRORORI, 0.00 CPPRORMOLOC, 0.00 CPPRORMOEXT ' +

         'FROM LOG315 DET ' +
            'LEFT JOIN TGE205 ART ON (DET.CIAID=ART.CIAID AND DET.ARTID=ART.ARTID) ' +
            'LEFT JOIN TGE208 T ON (T.TRIID=DET.TRIID) ' +
            'LEFT JOIN TGE101 X ON (X.CIAID=DET.CIAID) ' +
            'LEFT JOIN TGE131 L ON (L.CIAID=DET.CIAID AND L.GRARID=DET.GRARID) ';
         If cdsPadre.FieldByName('FLGCORP').AsString = 'S' Then
            xSQL := xSQL +
               'LEFT JOIN FAC303 GUIA ON (DET.CIAID=GUIA.CIAID AND DET.NISAID=GUIA.SERIENGUIA AND DET.TRIID=GUIA.TRIID) ';
         xSQL := xSQL +
            'LEFT JOIN TGE181 M ON (M.MESIDR=' + QuotedStr(copy(xAAMM, 5, 2)) + ') ' +
            'INNER JOIN LOG205 D ON (D.CIAID=DET.CIAID AND D.TRIID=DET.TRIID AND D.TINID=DET.TINID AND D.GRARID=DET.GRARID) ' +
            'LEFT JOIN LOG204 C ON (C.CIAID=D.CIAID AND C.ASIENTO=D.ASIENTO AND C.GRUPO=D.GRUPO AND C.SGRUPO=D.SGRUPO AND C.TRIID=D.TRIID) ' +
            'LEFT JOIN LOG203 E ON (E.CIAID=D.CIAID AND E.ASIENTO=D.ASIENTO) ' +
            'LEFT JOIN TGE202 P ON (P.CIAID=D.CIAID AND P.CUENTAID=' + xTCtaH + ') ' +
            'LEFT JOIN TGE104 S ON (S.TDIARID=' + QuotedStr(xTDia) + ') ' +
            'WHERE DET.CIAID=' + QuotedStr(cdsPadre.FieldByName('CIAID').AsString) + ' ' +
            'AND MONTH(DET.NISAFREG)=' + IntToStr(StrToInt(copy(xAAMM, 5, 2))) + ' ' +
            'AND YEAR(DET.NISAFREG)=' + IntToStr(StrToInt(copy(xAAMM, 1, 4))) + ' ' +
            'AND COALESCE(DET.NISSIT,'''')=''ACEPTADO'' ' +
            'AND DET.TRIID=' + QuotedStr(cdsHijo.FieldByName('TRIID').AsString) + ' ';
         If cdsPadre.FieldByName('FLGCORP').AsString = 'S' Then
            xSQL := xSQL +
               'AND GUIA.VEID=' + Quotedstr(sVeid) + ' ';
         xSQL := xSQL +
            'AND C.CIAID=' + QuotedStr(cdsHijo.FieldByName('CIAID').AsString) + ' ' +
            'AND C.ASIENTO=' + QuotedStr(cdsHijo.FieldByName('ASIENTO').AsString) + ' ' +
            'AND C.GRUPO=' + QuotedStr(cdsHijo.FieldByName('GRUPO').AsString) + ' ' +
            'AND C.SGRUPO=' + QuotedStr(cdsHijo.FieldByName('SGRUPO').AsString) + ' ' +
            'AND C.TINID=' + QuotedStr(cdsHijo.FieldByName('TINID').AsString) + ' ' +
            'AND C.TRIID=' + QuotedStr(cdsHijo.FieldByName('TRIID').AsString) + ' ' +
            'GROUP BY T.TRISGT, DET.TRIID, T.TRIDES, C.DESCRIP, M.MESDESL, ' + xTCtaH + ', D.GRUPO, D.SGRUPO, C.TMONID, X.CIADES, ' +
            'CTA_AUX, CTA_CCOS, CTA_DOC, P.CTAABR, S.TDIARABR';

         xSQLON := xSQLON + xSQL;
         cdsHijo.Next;
      End;
   End
   Else
      If wDinCtbl = 'TOOL' Then
      Begin
         xSQL := 'SELECT ' +
            'DET.CIAID, T.TRISGT, DET.TRIID TRIEQUI, T.TRIDES, DET.GRARID, L.GRARDES DCPGLOSA, D.HABER CUENTAID, D.ASIENTO, ' +
            'D.GRUPO, D.SGRUPO, C.TMONID, X.CIADES, ' +
            'CASE WHEN C.TMONID=' + QuotedStr(wTMonLoc) + ' THEN ' +
            'SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) ELSE ' +
            'SUM(CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) END TOTDEBE, ' +
            '0.00 TOTHABER, ''S'' FLAG, ''D'' DCPDH, ' + QuotedStr(xTDia) + ' TDIARID, ' + QuotedStr(xNoComp) + ' CPNOREG, ' +
            QuotedStr(xAAMM) + ' DCPANOMM, ' + QuotedStr(wModulo) + ' MODULO, CTA_AUX, CTA_CCOS, CTA_DOC, ' +
            sTCambio + ' CPTCAMPR, ' + wRepFecServi + ' CPFEMIS, ' + wRepFecServi + ' CPFVCMTO, ' +
            wRepFecServi + ' DCPFCOM, ''I'' DCPESTDO, ' + wRepFecServi + ' FECHA, ' + wRepHorServi + ' HORA, ' +
            '''' + NISAANO + ''' DCPANOC, ''' + NISAMES + ''' DCPMM, ' +
            '''' + NISADIA + ''' DCPDD, ''' + NISATRIM + ''' DCPTRI, ''' + NISASEM + ''' DCPSEM, ''' + NISASS + ''' DCPSS, ''' + NISAANOMES + ''' DCPANOMES, ' +
            '''' + NISAAATRI + ''' DCPAATRI, ''' + NISAAASEM + ''' DCPAASEM, ''' + NISAAASS + ''' DCPAASS, ' +
            'P.CTAABR, S.TDIARABR, ''S'' CNTCUADRE, ''000'' DCPLOTE, ' +
            '0.00 DCPMOORI, 0.00 DCPMOLOC, 0.00 DCPMOEXT, ' +
            '0.00 CPPRORORI, 0.00 CPPRORMOLOC, 0.00 CPPRORMOEXT ' +
            'FROM LOG315 DET ' +
            'LEFT JOIN TGE205 ART ON (DET.CIAID=ART.CIAID AND DET.TINID=ART.TINID AND DET.ARTID=ART.ARTID) ' +
            'LEFT JOIN TGE208 T ON (T.TRIID=DET.TRIID) ' +
            'LEFT JOIN TGE101 X ON (X.CIAID=DET.CIAID) ' +
            'LEFT JOIN TGE131 L ON (L.CIAID=DET.CIAID AND L.GRARID=DET.GRARID) ' +
            'INNER JOIN LOG205 D ON (D.CIAID=DET.CIAID AND D.TRIID=DET.TRIID AND D.TINID=DET.TINID AND D.GRARID=DET.GRARID) ' +
            'LEFT JOIN LOG204 C ON (C.CIAID=D.CIAID AND C.ASIENTO=D.ASIENTO AND C.GRUPO=D.GRUPO AND C.SGRUPO=D.SGRUPO AND C.TINID=D.TINID AND C.TRIID=D.TRIID) ' +
            'LEFT JOIN LOG203 E ON (E.CIAID=D.CIAID AND E.ASIENTO=D.ASIENTO) ' +
            'LEFT JOIN TGE202 P ON (P.CIAID=D.CIAID AND P.CUENTAID=D.HABER) ' +
            'LEFT JOIN TGE104 S ON (S.TDIARID=' + QuotedStr(xTDia) + ') ' +
            'WHERE DET.CIAID=' + QuotedStr(cdsPadre.FieldByName('CIAID').AsString) + ' ' +
            'AND MONTH(DET.NISAFREG)=' + IntToStr(StrToInt(copy(xAAMM, 5, 2))) + ' ' +
            'AND YEAR(DET.NISAFREG)=' + IntToStr(StrToInt(copy(xAAMM, 1, 4))) + ' ' +
            'AND COALESCE(DET.NISSIT,'''')=''ACEPTADO'' ' +
            'GROUP BY DET.CIAID, T.TRISGT, DET.TRIID, T.TRIDES, DET.GRARID, L.GRARDES, D.HABER, D.ASIENTO, ' +
            'D.GRUPO, D.SGRUPO, C.TMONID, X.CIADES, CTA_AUX, CTA_CCOS, CTA_DOC, P.CTAABR, S.TDIARABR ' +

         'UNION ALL ' +

         'SELECT ' +
            'DET.CIAID CIAID, T.TRISGT, DET.TRIID TRIEQUI, T.TRIDES, ''ZZ'' GRARID, C.DESCRIP||'' - ''||RTRIM(M.MESDESL)||' + QuotedStr(' - ' + copy(xAAMM, 1, 4)) + ' DCPGLOSA, ' +
            'D.DEBE CUENTAID, D.ASIENTO, D.GRUPO, D.SGRUPO, C.TMONID, X.CIADES, 0.00 TOTDEBE, ' +
            'CASE WHEN C.TMONID=' + QuotedStr(wTMonLoc) + ' THEN ' +
            'SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) ELSE ' +
            'SUM(CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) END TOTHABER, ' +
            '''S'' FLAG, ''H'' DCPDH, ' + QuotedStr(xTDia) + ' TDIARID, ' + QuotedStr(xNoComp) + ' CPNOREG, ' +
            QuotedStr(xAAMM) + ' DCPANOMM, ' + QuotedStr(wModulo) + ' MODULO, CTA_AUX, CTA_CCOS, CTA_DOC, ' +
            sTCambio + ' CPTCAMPR, ' + wRepFecServi + ' CPFEMIS, ' + wRepFecServi + ' CPFVCMTO, ' +
            wRepFecServi + ' DCPFCOM, ''I'' DCPESTDO, ' + wRepFecServi + ' FECHA, ' + wRepHorServi + ' HORA, ' +
            '''' + NISAANO + ''' DCPANOC, ''' + NISAMES + ''' DCPMM, ' +
            '''' + NISADIA + ''' DCPDD, ''' + NISATRIM + ''' DCPTRI, ''' + NISASEM + ''' DCPSEM, ''' + NISASS + ''' DCPSS, ''' + NISAANOMES + ''' DCPANOMES, ' +
            '''' + NISAAATRI + ''' DCPAATRI, ''' + NISAAASEM + ''' DCPAASEM, ''' + NISAAASS + ''' DCPAASS, ' +
            'P.CTAABR, S.TDIARABR, ''S'' CNTCUADRE, ''000'' DCPLOTE, ' +
            '0.00 DCPMOORI, 0.00 DCPMOLOC, 0.00 DCPMOEXT, ' +
            '0.00 CPPRORORI, 0.00 CPPRORMOLOC, 0.00 CPPRORMOEXT ' +

         'FROM LOG315 DET ' +
            'LEFT JOIN TGE205 ART ON (DET.CIAID=ART.CIAID AND DET.ARTID=ART.ARTID) ' +
            'LEFT JOIN TGE208 T ON (T.TRIID=DET.TRIID) LEFT JOIN TGE101 X ON (X.CIAID=DET.CIAID) ' +
            'LEFT JOIN TGE131 L ON (L.CIAID=DET.CIAID AND L.GRARID=DET.GRARID) ' +
            'LEFT JOIN TGE181 M ON (M.MESIDR=' + QuotedStr(copy(xAAMM, 5, 2)) + ') ' +
            'INNER JOIN LOG205 D ON (D.CIAID=DET.CIAID AND D.TRIID=DET.TRIID AND D.TINID=DET.TINID AND D.GRARID=DET.GRARID) ' +
            'LEFT JOIN LOG204 C ON (C.CIAID=D.CIAID AND C.ASIENTO=D.ASIENTO AND C.GRUPO=D.GRUPO AND C.SGRUPO=D.SGRUPO AND C.TRIID=D.TRIID) ' +
            'LEFT JOIN LOG203 E ON (E.CIAID=D.CIAID AND E.ASIENTO=D.ASIENTO) ' +
            'LEFT JOIN TGE202 P ON (P.CIAID=D.CIAID AND P.CUENTAID=D.DEBE) ' +
            'LEFT JOIN TGE104 S ON (S.TDIARID=' + QuotedStr(xTDia) + ') ' +
            'WHERE DET.CIAID=' + QuotedStr(cdsPadre.FieldByName('CIAID').AsString) + ' ' +
            'AND MONTH(DET.NISAFREG)=' + IntToStr(StrToInt(copy(xAAMM, 5, 2))) + ' ' +
            'AND YEAR(DET.NISAFREG)=' + IntToStr(StrToInt(copy(xAAMM, 1, 4))) + ' ' +
            'AND COALESCE(DET.NISSIT,'''')=''ACEPTADO'' ' +
            'GROUP BY DET.CIAID, T.TRISGT, DET.TRIID, T.TRIDES, C.DESCRIP, M.MESDESL, D.DEBE, D.ASIENTO, D.GRUPO, D.SGRUPO, ' +
            'C.TMONID, X.CIADES, CTA_AUX, CTA_CCOS, CTA_DOC, P.CTAABR, S.TDIARABR';

         xSQLON := xSQLON + xSQL;
      End;

   cdsDetCxPx := TwwClientDataSet.Create(Self);
   cdsDetCxPx.RemoteServer := DCOM1;
   cdsDetCxPx.ProviderName := 'dspUltTGE';

   cdsDetCxPx.DataRequest(xSQLON);
   Exit;
   cdsDetCxPx.Open;

   cdsDetCxPx.First;
   cdsDetCxPx.DisableControls;
   While Not cdsDetCxPx.Eof Do
   Begin
      cdsDetCxPx.Edit;

      If cdsDetCxPx.FieldByName('DCPDH').AsString = 'D' Then
      Begin
         cdsDetCxPx.FieldByName('DCPMOORI').AsFloat := cdsDetCxPx.FieldByName('TOTDEBE').AsFloat;
         cdsDetCxPx.FieldByName('DCPMOLOC').AsFloat := cdsDetCxPx.FieldByName('TOTDEBE').AsFloat;
         cdsDetCxPx.FieldByName('DCPMOEXT').AsFloat := cdsDetCxPx.FieldByName('TOTDEBE').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat;

         cdsDetCxPx.FieldByName('CPPRORORI').AsFloat := cdsDetCxPx.FieldByName('TOTDEBE').AsFloat;
         cdsDetCxPx.FieldByName('CPPRORMOLOC').AsFloat := cdsDetCxPx.FieldByName('TOTDEBE').AsFloat;
         cdsDetCxPx.FieldByName('CPPRORMOEXT').AsFloat := cdsDetCxPx.FieldByName('TOTDEBE').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat;

      End
      Else
         If cdsDetCxPx.FieldByName('DCPDH').AsString = 'H' Then
         Begin
            cdsDetCxPx.FieldByName('DCPMOORI').AsFloat := cdsDetCxPx.FieldByName('TOTHABER').AsFloat;
            cdsDetCxPx.FieldByName('DCPMOLOC').AsFloat := cdsDetCxPx.FieldByName('TOTHABER').AsFloat;
            cdsDetCxPx.FieldByName('DCPMOEXT').AsFloat := cdsDetCxPx.FieldByName('TOTHABER').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat;

            cdsDetCxPx.FieldByName('CPPRORORI').AsFloat := cdsDetCxPx.FieldByName('TOTHABER').AsFloat;
            cdsDetCxPx.FieldByName('CPPRORMOLOC').AsFloat := cdsDetCxPx.FieldByName('TOTHABER').AsFloat;
            cdsDetCxPx.FieldByName('CPPRORMOEXT').AsFloat := cdsDetCxPx.FieldByName('TOTHABER').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat;
         End;

      cdsDetCxPx.Post;
      cdsDetCxPx.Next;
   End;
   cdsDetCxPx.First;
   cdsDetCxPx.EnableControls;

   If xTipoC = 'C' Then
   Begin
      Try
         xSQL := 'DELETE  FROM CNT311 ' +
            'WHERE CIAID=' + QuotedStr(xCia) + ' ' +
            'AND TDIARID=' + QuotedStr(xTDia) + ' ' +
            'AND CNTANOMM=' + QuotedStr(xAAMM) + ' ' +
            'AND CNTCOMPROB=' + QuotedStr(xNoComp);
         DCOM1.AppServer.IniciaTransaccion;
         DCOM1.AppServer.EjecutaSQL(xSQL);
         DCOM1.AppServer.GrabaTransaccion;
      Except
         DCOM1.AppServer.RegresaTransaccion;
      End;
   End;

   If (xTipoC = 'C') Or (xTipoC = 'P') Or (xTipoC = 'BP') Then
      Filtracds(cdsMovCNT, 'SELECT * FROM CNT311 ' +
         'WHERE CIAID=' + QuotedStr(xCia) + ' ' +
         'AND TDIARID=' + QuotedStr(xTDia) + ' ' +
         'AND CNTANOMM=' + QuotedStr(xAAMM) + ' ' +
         'AND CNTCOMPROB=' + QuotedStr(xNoComp));

   If xTipoC = 'B' Then
      Filtracds(cdsMovCNT, 'SELECT * FROM CNT301 WHERE ' +
         'CIAID=' + '''' + xCia + '''' + ' AND ' +
         'TDIARID=' + '''' + xTDia + '''' + ' AND ' +
         'CNTANOMM=' + '''' + xAAMM + '''');

   xTOTMG := 0;
   xTOTTO := 0;
   If (cdsCia.FieldByName('IGVSN').AsString = '2') And
      (cdsDetCxPx.FieldByName('TMONID').AsString = wTMonExt) Then
   Begin
      xWhere := 'TMONID=' + '''' + wTMonExt + '''' +
         'AND FECHA=' + wRepFuncDate + '''' + FORMATDATETIME(wFormatFecha, cdsDetCxPx.FieldByName('DCPFCOM').AsDateTime) + ''')';
      DisplayDescrip('prvTGE', 'TGE107', '*', xWhere, 'TMONID');

      xxTCambio := cdsQry.fieldbyname('TCAMVXC').AsFloat;
      If xxTCambio = 0 Then
      Begin
         xxTCambio := cdsQry.fieldbyname('TCAMVXV').AsFloat;
         If xxTCambio = 0 Then
            xxTCambio := cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat;
      End;

      cdsDetCxPx.First;
      While Not cdsDetCxPx.EOF Do
      Begin
         If cdsDetCxPx.FieldByName('TIPDET').AsString = 'MG' Then
         Begin
            If cdsDetCxPx.FieldByName('CPPRORORI').AsFloat >= 0 Then
            Begin
               If cdsDetCxPx.FieldByName('DCPDH').AsString = 'D' Then
                  XTOTMG := FRound(XTOTMG + FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat, 15, 2), 15, 2)
               Else
                  XTOTMG := FRound(XTOTMG - FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat, 15, 2), 15, 2)
            End
            Else
            Begin
               If cdsReporte.FieldByName('DCPDH').AsString = 'D' Then
                  XTOTMG := FRound(XTOTMG + FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat, 15, 2), 15, 2)
               Else
                  XTOTMG := FRound(XTOTMG - FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat, 15, 2), 15, 2)
            End;
         End;

         If cdsDetCxPx.FieldByName('TIPDET').AsString = 'TO' Then
         Begin
            If cdsDetCxPx.FieldByName('CPPRORORI').AsFloat >= 0 Then
            Begin
               If cdsDetCxPx.FieldByName('DCPDH').AsString = 'D' Then
                  XTOTTO := FRound(XTOTTO + FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat, 15, 2), 15, 2)
               Else
                  XTOTTO := FRound(XTOTTO - FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat, 15, 2), 15, 2)
            End
            Else
            Begin
               If cdsDetCxPx.FieldByName('DCPDH').AsString = 'D' Then
                  XTOTTO := FRound(XTOTTO + FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat, 15, 2), 15, 2)
               Else
                  XTOTTO := FRound(XTOTTO - FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat, 15, 2), 15, 2)
            End;
         End;
         cdsDetCxPx.Next;
      End;
   End;

   xContR := 0;
   cdsDetCxPx.First;
   While Not cdsDetCxPx.EOF Do
   Begin
      cdsMovCNT.Insert;
      cdsMovCNT.FieldByName('CIAID').AsString := cdsDetCxPx.FieldByName('CIAID').AsString;
      cdsMovCNT.FieldByName('TDIARID').AsString := cdsDetCxPx.FieldByName('TDIARID').AsString;
      cdsMovCNT.FieldByName('CNTANOMM').AsString := cdsDetCxPx.FieldByName('DCPANOMM').AsString;
      cdsMovCNT.FieldByName('CNTCOMPROB').AsString := cdsDetCxPx.FieldByName('CPNOREG').AsString;
      cdsMovCNT.FieldByName('CUENTAID').AsString := cdsDetCxPx.FieldByName('CUENTAID').AsString;

      //INICIO HPC_201302_ALM
      {If cdsDetCxPx.FieldByName('CTA_AUX').AsString = 'S' Then
      Begin
      //cdsMovCNT.FieldByName('CLAUXID').AsString  	:=cdsDetCxPx.FieldByName('CLAUXID').AsString;
      //cdsMovCNT.FieldByName('AUXID').AsString    	:=cdsDetCxPx.FieldByName('DCPAUXID').AsString;
      //cdsMovCNT.FieldByName('AUXDES').AsString   	:=cdsDetCxPx.FieldByName('PROVABR').AsString;
      End;}

      {If cdsDetCxPx.FieldByName('CTA_CCOS').AsString = 'S' Then
      Begin
      //cdsMovCNT.FieldByName('CCOSID').AsString   	:=cdsDetCxPx.FieldByName('CCOSID').AsString;
      //cdsMovCNT.FieldByName('CCOSDES').AsString  	:=cdsDetCxPx.FieldByName('CCOSABR').AsString;
      End;}

      {If cdsDetCxPx.FieldByName('CTA_DOC').AsString = 'S' Then
      Begin
      //cdsMovCNT.FieldByName('DOCID').AsString    	:=cdsDetCxPx.FieldByName('DOCID').AsString;
      //cdsMovCNT.FieldByName('CNTSERIE').AsString 	:=cdsDetCxPx.FieldByName('CPSERIE').AsString;
      //cdsMovCNT.FieldByName('CNTNODOC').AsString 	:=cdsDetCxPx.FieldByName('CPNODOC').AsString;
      //cdsMovCNT.FieldByName('DOCDES').AsString   	:=cdsDetCxPx.FieldByName('DOCABR').AsString;
      End;}
      //FINAL HPC_201302_ALM

      cdsMovCNT.FieldByName('CNTMODDOC').AsString := cdsDetCxPx.FieldByName('MODULO').AsString;
      cdsMovCNT.FieldByName('CNTGLOSA').AsString := Trim(cdsDetCxPx.FieldByName('DCPGLOSA').AsString);
      cdsMovCNT.FieldByName('CNTDH').AsString := cdsDetCxPx.FieldByName('DCPDH').AsString;

      If cdsCia.FieldByName('IGVSN').AsString = '2' Then
      Begin
      //if cdsDetCxPx.FieldByName('TIPDET').AsString='MG' then
      //	cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat:=cdsDetCxPx.FieldByName('CPTCAMPR').AsString
      //else
      //	cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat:=xxTCambio;
      End
      Else
      Begin
         cdsMovCNT.FieldByName('CNTTCAMBIO').AsString := cdsDetCxPx.FieldByName('CPTCAMPR').AsString;
      End;

      If cdsDetCxPx.FieldByName('CPPRORORI').AsFloat >= 0 Then
      Begin
         cdsMovCNT.FieldByName('CNTMTOORI').AsFloat := FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat := FRound(cdsDetCxPx.FieldByName('CPPRORMOLOC').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat := FRound(cdsDetCxPx.FieldByName('CPPRORMOEXT').AsFloat, 15, 2);
      End
      Else
      Begin
         cdsMovCNT.FieldByName('CNTMTOORI').AsFloat := FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat := FRound(cdsDetCxPx.FieldByName('DCPMOLOC').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat := FRound(cdsDetCxPx.FieldByName('DCPMOEXT').AsFloat, 15, 2);
      End;

      cdsMovCNT.FieldByName('CNTFEMIS').AsDateTime := cdsDetCxPx.FieldByName('CPFEMIS').AsDateTime;
      cdsMovCNT.FieldByName('CNTFVCMTO').AsDateTime := cdsDetCxPx.FieldByName('CPFVCMTO').AsDateTime;
      cdsMovCNT.FieldByName('CNTFCOMP').AsDateTime := cdsDetCxPx.FieldByName('DCPFCOM').AsdateTime;
      cdsMovCNT.FieldByName('CNTESTADO').AsString := cdsDetCxPx.FieldByName('DCPESTDO').AsString;
      cdsMovCNT.FieldByName('CNTUSER').AsString := wUsuario;
      cdsMovCNT.FieldByName('CNTFREG').AsDateTime := cdsDetCxPx.FieldByName('FECHA').AsDateTime;
      cdsMovCNT.FieldByName('CNTHREG').AsDateTime := cdsDetCxPx.FieldByName('HORA').AsDateTime;
      cdsMovCNT.FieldByName('CNTMM').AsString := cdsDetCxPx.FieldByName('DCPMM').AsString;
      cdsMovCNT.FieldByName('CNTDD').AsString := cdsDetCxPx.FieldByName('DCPDD').AsString;
      cdsMovCNT.FieldByName('CNTTRI').AsString := cdsDetCxPx.FieldByName('DCPTRI').AsString;
      cdsMovCNT.FieldByName('CNTSEM').AsString := cdsDetCxPx.FieldByName('DCPSEM').AsString;
      cdsMovCNT.FieldByName('CNTANO').AsString := cdsDetCxPx.FieldByName('DCPANOC').AsString;
      cdsMovCNT.FieldByName('CNTSS').AsString := cdsDetCxPx.FieldByName('DCPSS').AsString;
      cdsMovCNT.FieldByName('CNTAATRI').AsString := cdsDetCxPx.FieldByName('DCPAATRI').AsString;
      cdsMovCNT.FieldByName('CNTAASEM').AsString := cdsDetCxPx.FieldByName('DCPAASEM').AsString;
      cdsMovCNT.FieldByName('CNTAASS').AsString := cdsDetCxPx.FieldByName('DCPAASS').AsString;
      cdsMovCNT.FieldByName('TMONID').AsString := cdsDetCxPx.FieldByName('TMONID').AsString;
      cdsMovCNT.FieldByName('CNTCUADRE').AsString := cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
      cdsMovCNT.FieldByName('CTADES').AsString := cdsDetCxPx.FieldByName('CTAABR').AsString;
      cdsMovCNT.FieldByName('TDIARDES').AsString := cdsDetCxPx.FieldByName('TDIARABR').AsString;
      cdsMovCNT.FieldByName('CNTLOTE').AsString := cdsDetCxPx.FieldByName('DCPLOTE').AsString;

      If cdsDetCxPx.FieldByName('DCPDH').AsString = 'D' Then
      Begin
         cdsMovCNT.FieldByName('CNTDEBEMN').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTDEBEME').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTHABEMN').AsFloat := 0;
         cdsMovCNT.FieldByName('CNTHABEME').AsFloat := 0;
         If cdsCia.FieldByName('IGVSN').AsString = '2' Then
         Begin
            If cdsDetCxPx.FieldByName('TMONID').AsString = wTMonExt Then
            Begin
               If cdsDetCxPx.FieldByName('TIPDET').AsString = 'TO' Then
               Begin
                  cdsMovCNT.FieldByName('CNTDEBEME').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat, 15, 2);
                  cdsMovCNT.FieldByName('CNTDEBEMN').AsFloat := 0;
               End
               Else
               Begin
                  cdsMovCNT.FieldByName('CNTDEBEMN').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat, 15, 2);
                  cdsMovCNT.FieldByName('CNTDEBEME').AsFloat := 0;
               End;
            End;
         End;
      End;

      If cdsDetCxPx.FieldByName('DCPDH').AsString = 'H' Then
      Begin
         cdsMovCNT.FieldByName('CNTHABEMN').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTHABEME').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTDEBEMN').AsFloat := 0;
         cdsMovCNT.FieldByName('CNTDEBEME').AsFloat := 0;
         If cdsCia.FieldByName('IGVSN').AsString = '2' Then
         Begin
            If cdsDetCxPx.FieldByName('TMONID').AsString = wTMonExt Then
            Begin
               If cdsDetCxPx.FieldByName('TIPDET').AsString = 'TO' Then
               Begin
                  cdsMovCNT.FieldByName('CNTHABEME').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat, 15, 2);
                  cdsMovCNT.FieldByName('CNTHABEMN').AsFloat := 0;
               End
               Else
               Begin
                  cdsMovCNT.FieldByName('CNTHABEMN').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat, 15, 2);
                  cdsMovCNT.FieldByName('CNTHABEME').AsFloat := 0;
               End;
            End;
         End
      End;

      xContR := xContR + 1;
      cdsMovCNT.FieldByName('CNTREG').AsFloat := xContR;
      cdsMovCNT.FieldByName('MODULO').AsString := wModulo;
      cdsPost(cdsMovCNT);
      cdsDetCxPx.Next;
   End;

   If (cdsCia.FieldByName('IGVSN').AsString = '2') And
      (cdsDetCxPx.FieldByName('TMONID').AsString = wTMonExt) Then
   Begin
      If XTOTMG > 0 Then
      Begin
         cdsMovCNT.Insert;
         cdsMovCNT.FieldByName('CIAID').AsString := cdsDetCxPx.FieldByName('CIAID').AsString;
         cdsMovCNT.FieldByName('TDIARID').AsSTring := cdsDetCxPx.FieldByName('TDIARID').AsString;
         cdsMovCNT.FieldByName('CNTANOMM').AsString := cdsDetCxPx.FieldByName('DCPANOMM').AsString;
         cdsMovCNT.FieldByName('CNTCOMPROB').AsString := cdsDetCxPx.FieldByName('CPNOREG').AsString;
         cdsMovCNT.FieldByName('CUENTAID').AsString := '1918090000000000';

         cdsMovCNT.FieldByName('CNTMODDOC').Value := cdsDetCxPx.FieldByName('MODULO').AsString;
         cdsMovCNT.FieldByName('CNTGLOSA').Value := 'CAMBIOS';
         cdsMovCNT.FieldByName('CNTDH').Value := 'H';

         cdsMovCNT.FieldByName('CNTTCAMBIO').Value := cdsDetCxPx.FieldByName('CPTCAMPR').AsString;

         cdsMovCNT.FieldByName('CNTMTOORI').Value := XTOTMG;
         cdsMovCNT.FieldByName('CNTMTOLOC').Value := FRound(XTOTMG * cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTMTOEXT').Value := XTOTMG;

         cdsMovCNT.FieldByName('CNTFEMIS').Value := cdsDetCxPx.FieldByName('CPFEMIS').AsString;
         cdsMovCNT.FieldByName('CNTFVCMTO').Value := cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
         cdsMovCNT.FieldByName('CNTFCOMP').Value := cdsDetCxPx.FieldByName('DCPFCOM').AsString;
         cdsMovCNT.FieldByName('CNTESTADO').Value := cdsDetCxPx.FieldByName('DCPESTDO').AsString;
         cdsMovCNT.FieldByName('CNTUSER').Value := wUsuario;
         cdsMovCNT.FieldByName('CNTFREG').Value := cdsDetCxPx.FieldByName('FECHA').AsDateTime;
         cdsMovCNT.FieldByName('CNTHREG').Value := cdsDetCxPx.FieldByName('HORA').AsDateTime;

         cdsMovCNT.FieldByName('CNTMM').Value := cdsDetCxPx.FieldByName('DCPMM').AsString;
         cdsMovCNT.FieldByName('CNTDD').Value := cdsDetCxPx.FieldByName('DCPDD').AsString;
         cdsMovCNT.FieldByName('CNTTRI').Value := cdsDetCxPx.FieldByName('DCPTRI').AsString;
         cdsMovCNT.FieldByName('CNTSEM').Value := cdsDetCxPx.FieldByName('DCPSEM').AsString;
         cdsMovCNT.FieldByName('CNTANO').Value := cdsDetCxPx.FieldByName('DCPANOC').AsString;
         cdsMovCNT.FieldByName('CNTSS').Value := cdsDetCxPx.FieldByName('DCPSS').AsString;
         cdsMovCNT.FieldByName('CNTAATRI').Value := cdsDetCxPx.FieldByName('DCPAATRI').AsString;
         cdsMovCNT.FieldByName('CNTAASEM').Value := cdsDetCxPx.FieldByName('DCPAASEM').AsString;
         cdsMovCNT.FieldByName('CNTAASS').Value := cdsDetCxPx.FieldByName('DCPAASS').AsString;

         cdsMovCNT.FieldByName('TMONID').Value := cdsDetCxPx.FieldByName('TMONID').AsString;
         cdsMovCNT.FieldByName('CNTCUADRE').Value := cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
         cdsMovCNT.FieldByName('CTADES').Value := cdsDetCxPx.FieldByName('CTAABR').AsString;
         cdsMovCNT.FieldByName('TDIARDES').Value := cdsDetCxPx.FieldByName('TDIARABR').AsString;
         cdsMovCNT.FieldByName('CNTLOTE').Value := cdsDetCxPx.FieldByName('DCPLOTE').AsString;
         cdsMovCNT.FieldByName('MODULO').Value := 'CXP';

         cdsMovCNT.FieldByName('CNTHABEMN').Value := FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTHABEME').Value := 0;
         cdsMovCNT.FieldByName('CNTDEBEMN').Value := 0;
         cdsMovCNT.FieldByName('CNTDEBEME').Value := 0;

         xContR := xContR + 1;
         cdsMovCNT.FieldByName('CNTREG').Value := xContR;
         cdsMovCNT.FieldByName('MODULO').AsString := wModulo;
         cdsPost(cdsMovCNT);
      End
      Else
      Begin
         cdsMovCNT.Insert;
         cdsMovCNT.FieldByName('CIAID').Value := cdsDetCxPx.FieldByName('CIAID').AsString;
         cdsMovCNT.FieldByName('TDIARID').Value := cdsDetCxPx.FieldByName('TDIARID').AsString;
         cdsMovCNT.FieldByName('CNTANOMM').Value := cdsDetCxPx.FieldByName('DCPANOMM').AsString;
         cdsMovCNT.FieldByName('CNTCOMPROB').Value := cdsDetCxPx.FieldByName('CPNOREG').AsString;
         cdsMovCNT.FieldByName('CUENTAID').Value := '1918090000000000';
         cdsMovCNT.FieldByName('CNTMODDOC').Value := cdsDetCxPx.FieldByName('MODULO').AsString;
         cdsMovCNT.FieldByName('CNTGLOSA').Value := 'CAMBIOS';
         cdsMovCNT.FieldByName('CNTDH').Value := 'D';
         cdsMovCNT.FieldByName('CNTTCAMBIO').Value := cdsDetCxPx.FieldByName('CPTCAMPR').AsString;
         cdsMovCNT.FieldByName('CNTMTOORI').Value := XTOTMG * (-1);
         cdsMovCNT.FieldByName('CNTMTOLOC').Value := FRound(XTOTMG * (-1) * cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTMTOEXT').Value := XTOTMG * (-1);
         cdsMovCNT.FieldByName('CNTFEMIS').Value := cdsDetCxPx.FieldByName('CPFEMIS').AsString;
         cdsMovCNT.FieldByName('CNTFVCMTO').Value := cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
         cdsMovCNT.FieldByName('CNTFCOMP').Value := cdsDetCxPx.FieldByName('DCPFCOM').AsString;
         cdsMovCNT.FieldByName('CNTESTADO').Value := cdsDetCxPx.FieldByName('DCPESTDO').AsString;
         cdsMovCNT.FieldByName('CNTUSER').Value := wUsuario;
         cdsMovCNT.FieldByName('CNTFREG').Value := cdsDetCxPx.FieldByName('FECHA').AsDateTime;
         cdsMovCNT.FieldByName('CNTHREG').Value := cdsDetCxPx.FieldByName('HORA').AsDateTime;
         cdsMovCNT.FieldByName('CNTMM').Value := cdsDetCxPx.FieldByName('DCPMM').AsString;
         cdsMovCNT.FieldByName('CNTDD').Value := cdsDetCxPx.FieldByName('DCPDD').AsString;
         cdsMovCNT.FieldByName('CNTTRI').Value := cdsDetCxPx.FieldByName('DCPTRI').AsString;
         cdsMovCNT.FieldByName('CNTSEM').Value := cdsDetCxPx.FieldByName('DCPSEM').AsString;
         cdsMovCNT.FieldByName('CNTANO').Value := cdsDetCxPx.FieldByName('DCPANOC').AsString;
         cdsMovCNT.FieldByName('CNTSS').Value := cdsDetCxPx.FieldByName('DCPSS').AsString;
         cdsMovCNT.FieldByName('CNTAATRI').Value := cdsDetCxPx.FieldByName('DCPAATRI').AsString;
         cdsMovCNT.FieldByName('CNTAASEM').Value := cdsDetCxPx.FieldByName('DCPAASEM').AsString;
         cdsMovCNT.FieldByName('CNTAASS').Value := cdsDetCxPx.FieldByName('DCPAASS').AsString;
         cdsMovCNT.FieldByName('TMONID').Value := cdsDetCxPx.FieldByName('TMONID').AsString;
         cdsMovCNT.FieldByName('CNTCUADRE').Value := cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
         cdsMovCNT.FieldByName('CTADES').Value := cdsDetCxPx.FieldByName('CTAABR').AsString;
         cdsMovCNT.FieldByName('TDIARDES').Value := cdsDetCxPx.FieldByName('TDIARABR').AsString;
         cdsMovCNT.FieldByName('CNTLOTE').Value := cdsDetCxPx.FieldByName('DCPLOTE').AsString;
         cdsMovCNT.FieldByName('CNTDEBEMN').Value := FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTDEBEME').Value := 0;
         cdsMovCNT.FieldByName('CNTHABEMN').Value := 0;
         cdsMovCNT.FieldByName('CNTHABEME').Value := 0;
         xContR := xContR + 1;
         cdsMovCNT.FieldByName('CNTREG').Value := xContR;
         cdsMovCNT.FieldByName('MODULO').AsString := wModulo;
         cdsPost(cdsMovCNT);
      End;

      If XTOTTO > 0 Then
      Begin
         cdsMovCNT.Insert;
         cdsMovCNT.FieldByName('CIAID').Value := cdsDetCxPx.FieldByName('CIAID').AsString;
         cdsMovCNT.FieldByName('TDIARID').Value := cdsDetCxPx.FieldByName('TDIARID').AsString;
         cdsMovCNT.FieldByName('CNTANOMM').Value := cdsDetCxPx.FieldByName('DCPANOMM').AsString;
         cdsMovCNT.FieldByName('CNTCOMPROB').Value := cdsDetCxPx.FieldByName('CPNOREG').AsString;
         cdsMovCNT.FieldByName('CUENTAID').Value := '2928090000000000';
         cdsMovCNT.FieldByName('CNTMODDOC').Value := cdsDetCxPx.FieldByName('MODULO').AsString;
         cdsMovCNT.FieldByName('CNTGLOSA').Value := 'CONVERSIONES';
         cdsMovCNT.FieldByName('CNTDH').Value := 'H';
         cdsMovCNT.FieldByName('CNTTCAMBIO').Value := xxTCambio;
         cdsMovCNT.FieldByName('CNTMTOORI').Value := XTOTTO;
         cdsMovCNT.FieldByName('CNTMTOLOC').Value := FRound(XTOTTO * cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTMTOEXT').Value := XTOTTO;
         cdsMovCNT.FieldByName('CNTFEMIS').Value := cdsDetCxPx.FieldByName('CPFEMIS').AsString;
         cdsMovCNT.FieldByName('CNTFVCMTO').Value := cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
         cdsMovCNT.FieldByName('CNTFCOMP').Value := cdsDetCxPx.FieldByName('DCPFCOM').AsString;
         cdsMovCNT.FieldByName('CNTESTADO').Value := cdsDetCxPx.FieldByName('DCPESTDO').AsString;
         cdsMovCNT.FieldByName('CNTUSER').Value := wUsuario;
         cdsMovCNT.FieldByName('CNTFREG').Value := cdsDetCxPx.FieldByName('FECHA').AsDateTime;
         cdsMovCNT.FieldByName('CNTHREG').Value := cdsDetCxPx.FieldByName('HORA').AsDateTime;
         cdsMovCNT.FieldByName('CNTMM').Value := cdsDetCxPx.FieldByName('DCPMM').AsString;
         cdsMovCNT.FieldByName('CNTDD').Value := cdsDetCxPx.FieldByName('DCPDD').AsString;
         cdsMovCNT.FieldByName('CNTTRI').Value := cdsDetCxPx.FieldByName('DCPTRI').AsString;
         cdsMovCNT.FieldByName('CNTSEM').Value := cdsDetCxPx.FieldByName('DCPSEM').AsString;
         cdsMovCNT.FieldByName('CNTANO').Value := cdsDetCxPx.FieldByName('DCPANOC').AsString;
         cdsMovCNT.FieldByName('CNTSS').Value := cdsDetCxPx.FieldByName('DCPSS').AsString;
         cdsMovCNT.FieldByName('CNTAATRI').Value := cdsDetCxPx.FieldByName('DCPAATRI').AsString;
         cdsMovCNT.FieldByName('CNTAASEM').Value := cdsDetCxPx.FieldByName('DCPAASEM').AsString;
         cdsMovCNT.FieldByName('CNTAASS').Value := cdsDetCxPx.FieldByName('DCPAASS').AsString;
         cdsMovCNT.FieldByName('TMONID').Value := cdsDetCxPx.FieldByName('TMONID').AsString;
         cdsMovCNT.FieldByName('CNTCUADRE').Value := cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
         cdsMovCNT.FieldByName('CTADES').Value := cdsDetCxPx.FieldByName('CTAABR').AsString;
         cdsMovCNT.FieldByName('TDIARDES').Value := cdsDetCxPx.FieldByName('TDIARABR').AsString;
         cdsMovCNT.FieldByName('CNTLOTE').Value := cdsDetCxPx.FieldByName('DCPLOTE').AsString;
         cdsMovCNT.FieldByName('CNTHABEMN').Value := 0; //cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat;
         cdsMovCNT.FieldByName('CNTHABEME').Value := FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTDEBEMN').Value := 0;
         cdsMovCNT.FieldByName('CNTDEBEME').Value := 0;
         xContR := xContR + 1;
         cdsMovCNT.FieldByName('CNTREG').Value := xContR;
         cdsMovCNT.FieldByName('MODULO').AsString := wModulo;
         cdsPost(cdsMovCNT);
      End
      Else
      Begin
         cdsMovCNT.Insert;
         cdsMovCNT.FieldByName('CIAID').Value := cdsDetCxPx.FieldByName('CIAID').AsString;
         cdsMovCNT.FieldByName('TDIARID').Value := cdsDetCxPx.FieldByName('TDIARID').AsString;
         cdsMovCNT.FieldByName('CNTANOMM').Value := cdsDetCxPx.FieldByName('DCPANOMM').AsString;
         cdsMovCNT.FieldByName('CNTCOMPROB').Value := cdsDetCxPx.FieldByName('CPNOREG').AsString;
         cdsMovCNT.FieldByName('CUENTAID').Value := '2928090000000000';
         cdsMovCNT.FieldByName('CNTMODDOC').Value := cdsDetCxPx.FieldByName('MODULO').AsString;
         cdsMovCNT.FieldByName('CNTGLOSA').Value := 'CONVERSIONES';
         cdsMovCNT.FieldByName('CNTDH').Value := 'D';
         cdsMovCNT.FieldByName('CNTTCAMBIO').Value := xxTCambio;
         cdsMovCNT.FieldByName('CNTMTOORI').Value := XTOTTO * (-1);
         cdsMovCNT.FieldByName('CNTMTOLOC').Value := FRound(XTOTTO * (-1) * cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTMTOEXT').Value := XTOTTO * (-1);
         cdsMovCNT.FieldByName('CNTFEMIS').Value := cdsDetCxPx.FieldByName('CPFEMIS').AsString;
         cdsMovCNT.FieldByName('CNTFVCMTO').Value := cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
         cdsMovCNT.FieldByName('CNTFCOMP').Value := cdsDetCxPx.FieldByName('DCPFCOM').AsString;
         cdsMovCNT.FieldByName('CNTESTADO').Value := cdsDetCxPx.FieldByName('DCPESTDO').AsString;
         cdsMovCNT.FieldByName('CNTUSER').Value := wUsuario;
         cdsMovCNT.FieldByName('CNTFREG').Value := cdsDetCxPx.FieldByName('FECHA').AsDateTime;
         cdsMovCNT.FieldByName('CNTHREG').Value := cdsDetCxPx.FieldByName('HORA').AsDateTime;
         cdsMovCNT.FieldByName('CNTMM').Value := cdsDetCxPx.FieldByName('DCPMM').AsString;
         cdsMovCNT.FieldByName('CNTDD').Value := cdsDetCxPx.FieldByName('DCPDD').AsString;
         cdsMovCNT.FieldByName('CNTTRI').Value := cdsDetCxPx.FieldByName('DCPTRI').AsString;
         cdsMovCNT.FieldByName('CNTSEM').Value := cdsDetCxPx.FieldByName('DCPSEM').AsString;
         cdsMovCNT.FieldByName('CNTANO').Value := cdsDetCxPx.FieldByName('DCPANOC').AsString;
         cdsMovCNT.FieldByName('CNTSS').Value := cdsDetCxPx.FieldByName('DCPSS').AsString;
         cdsMovCNT.FieldByName('CNTAATRI').Value := cdsDetCxPx.FieldByName('DCPAATRI').AsString;
         cdsMovCNT.FieldByName('CNTAASEM').Value := cdsDetCxPx.FieldByName('DCPAASEM').AsString;
         cdsMovCNT.FieldByName('CNTAASS').Value := cdsDetCxPx.FieldByName('DCPAASS').AsString;
         cdsMovCNT.FieldByName('TMONID').Value := cdsDetCxPx.FieldByName('TMONID').AsString;
         cdsMovCNT.FieldByName('CNTCUADRE').Value := cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
         cdsMovCNT.FieldByName('CTADES').Value := cdsDetCxPx.FieldByName('CTAABR').AsString;
         cdsMovCNT.FieldByName('TDIARDES').Value := cdsDetCxPx.FieldByName('TDIARABR').AsString;
         cdsMovCNT.FieldByName('CNTLOTE').Value := cdsDetCxPx.FieldByName('DCPLOTE').AsString;

         cdsMovCNT.FieldByName('CNTDEBEMN').Value := 0; //cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat;
         cdsMovCNT.FieldByName('CNTDEBEME').Value := FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTHABEMN').Value := 0;
         cdsMovCNT.FieldByName('CNTHABEME').Value := 0;

         xContR := xContR + 1;
         cdsMovCNT.FieldByName('CNTREG').Value := xContR;
         cdsMovCNT.FieldByName('MODULO').AsString := wModulo;
         cdsPost(cdsMovCNT);
      End
   End;
   AplicaDatos(cdsMovCNT, 'MOVCNT');
End;

Function TDMALM.GrabaUltimoRegistro(xAutoNum, xCia, xTDiario, xAno, xMes: String; xNumUsu: Integer): String;
Begin
   If xAutoNum <> 'N' Then
   Begin
      xSQL := '';
      xSQL := 'SELECT NUMERO FROM TGE301 ' +
         'WHERE CIAID=''' + xCia + ''' ' +
         'AND TDIARID=''' + xTDiario + ''' ';

      If (xAutoNum = 'A') Or (xAutoNum = 'M') Then
         xSQL := xSQL + ' AND ANO=''' + xAno + ''' ';

      If xAutoNum = 'M' Then
         xSQL := xSQL + 'AND MES=''' + xMes + '''';

      xSQL := UpperCase(xSQL);
      cdsULTTGE.Close;
      cdsULTTGE.DataRequest(xSQL); // Llamada remota al provider del servidor
      cdsULTTGE.Open;

      If cdsULTTGE.FieldByName('NUMERO').Value = null Then
      Begin
         Result := IntToStr(xNumUsu);
         xSQL := 'INSERT INTO TGE301( CIAID, TDIARID';
         If (xAutoNum = 'A') Or (xAutoNum = 'M') Then
            xSQL := xSQL + ', ANO';
         If xAutoNum = 'M' Then
            xSQL := xSQL + ', MES';

         xSQL := xSQL + ', NUMERO) VALUES (''' + xCia + ''', ''' + xTDiario + '''';

         If (xAutoNum = 'A') Or (xAutoNum = 'M') Then
            xSQL := xSQL + ',''' + xAno + '''';
         If xAutoNum = 'M' Then
            xSQL := xSQL + ',''' + xMes + '''';

         xSQL := xSQL + ', ' + Result + ')';
         xSQL := UpperCase(xSQL);
         DCOM1.AppServer.EjecutaSQL(xSQL);
      End
      Else
      Begin
         Result := IntToStr(xNumUsu);
         xSQL := 'UPDATE TGE301 SET NUMERO=' + Result + ' ';
         xSQL := xSQL + 'WHERE CIAID=' + '''' + xCia + '''' + ' AND TDIARID=' + '''' + xTDiario + '''';
         If (xAutoNum = 'A') Or (xAutoNum = 'M') Then
            xSQL := xSQL + ' AND ANO=' + '''' + xAno + '''';
         If xAutoNum = 'M' Then
            xSQL := xSQL + ' AND MES=' + '''' + xMes + '''';
         xSQL := UpperCase(xSQL);
         DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
   End;
End;

Function TDMALM.UltimoRegistro(xAutoNum, xCia, xTDiario, xAno, xMes: String): String;
Begin
   If xAutoNum <> 'N' Then
   Begin
      xSQL := '';
      xSQL := 'SELECT NUMERO FROM TGE301 WHERE CIAID=''' + xCia + ''' ' +
         'AND TDIARID=''' + xTDiario + '''';

      If (xAutoNum = 'A') Or (xAutoNum = 'M') Then xSQL := xSQL + ' and Ano=' + '''' + xAno + '''';
      If xAutoNum = 'M' Then xSQL := xSQL + ' and Mes=' + '''' + xMes + '''';
      xSQL := UpperCase(xSQL);
      cdsULTTGE.Close;
      cdsULTTGE.DataRequest(xSQL); // Llamada remota al provider del servidor
      cdsULTTGE.Open;
      If cdsULTTGE.FieldByName('NUMERO').Value = null Then
         result := '1'
      Else
      Begin
         result := inttostr(cdsULTTGE.FieldByName('NUMERO').Value + 1);
      End;
   End
   Else
      result := '';
End;

Function TDMALM.CalcTipoCambio(sMoneda: String; dtFecha: tdatetime; sCampo: String): String;
Var
   sSQL: String;
Begin
   result := '';
   If dtFecha = 0 Then exit;
   If trim(sMoneda) = '' Then exit;

   sSQL := 'SELECT ' + sCampo + ' FROM TGE107 WHERE TMONID=' + quotedStr(sMoneda);
   sSQL := sSQL + ' AND FECHA=(' + quotedStr(formatdatetime(wFormatFecha, dtFecha)) + ')';
   cdsSQL.close;
   cdsSQL.DataRequest(sSQL);
   cdsSQL.open;
   result := cdsSQL.fieldbyName(sCampo).asString;
End;

Procedure TDMALM.InsertaLOG316(sCIA, sALM, sLOC, sTIN, sArt, Ano,
   Mes: String; Contenido: Double; IngSal: Char);
Var
   CantidadG, CantidadU: Double;
   PrecioG, PrecioU: Double;
   STKSANTG, STKSANTU: Double;
   CantidadActG, CantidadActU, MontoActG, MontoActU, MontoContenido: Double;
   CntGFName, CntUFName, MntGFName, MntUFName, xSQL: String;
   SumaResta: Char;
Begin
   If IngSal = 'N' Then // Sirve para Insertar cuando no tiene mov. en el año
   Begin
      CantidadG := 0;
      CantidadU := 0;
   End;

   STKSANTG := 0;
   STKSANTU := 0;
   CantidadActG := 0;
   CantidadActU := 0;
   MontoActG := 0;
   MontoActU := 0;

   CntGFName := 'STK' + IngSal + 'SG' + Mes;
   CntUFName := 'STK' + IngSal + 'SU' + Mes;
   MntGFName := 'STK' + IngSal + 'MG' + Mes;
   MntUFName := 'STK' + IngSal + 'MU' + Mes;

   xSQL := 'CIAID=' + QuotedStr(sCIA) + ' AND LOCID=' + QuotedStr(sLOC) + ' AND ' +
      'TINID=' + QuotedStr(sTIN) + ' AND ALMID=' + QuotedStr(sALM) + ' AND ' +
      'ARTID=' + QuotedStr(sART) + ' AND STKANO=' + QuotedStr(InttoStr(StrtoInt(ANO) - 1));
   displaydescrip('prvTGE', 'LOG316', 'CIAID, LOCID, TINID, ALMID, ' + 'STKSACTG, STKSACTU, ' +
      'STKTSG12, STKISG12, STKSSG12, ' +
      'STKTSU12, STKISU12, STKSSU12, ' +
      'STKTMG12, STKIMG12, STKSMG12, ' +
      'STKTMU12, STKIMU12, STKSMU12', xSQL, 'STKSACTG');

   If cdsQry.RecordCount > 0 Then
   Begin
      STKSANTG := cdsQry.FieldByName('STKSACTG').AsFloat;
      STKSANTU := cdsQry.FieldByName('STKSACTU').AsFloat;
   End;

   cdsSTK.Insert;
   cdsSTK.FieldbyName('CIAID').AsString := sCIA;
   cdsSTK.FieldbyName('LOCID').AsString := sLOC;
   cdsSTK.FieldbyName('TINID').AsString := sTIN;
   cdsSTK.FieldbyName('ALMID').AsString := sALM;
   cdsSTK.FieldbyName('STKANO').AsString := Ano;
   cdsSTK.FieldbyName('ARTID').AsString := sART;

   cdsSTK.FieldByName('STKSANTG').AsFloat := FRound(STKSANTG, 15, 4);
   cdsSTK.FieldByName('STKSANTU').AsFloat := FRound(STKSANTU, 15, 4);

   cdsSTK.FieldByName('STKSACTG').AsFloat := FRound(STKSANTG, 15, 4);
   cdsSTK.FieldByName('STKSACTU').AsFloat := FRound(STKSANTU, 15, 4);

   cdsSTK.FieldByName('STKRACTG').AsFloat := xReserva;
   cdsSTK.FieldByName('ARTDES').AsString := cdsArtiStk.FieldByName('ARTDES').AsString;
   cdsSTK.FieldbyName('GRARID').AsString := cdsArtiStk.FieldbyName('GRARID').AsString;
   cdsSTK.FieldbyName('ARTCONT').AsFloat := cdsArtiStk.FieldbyName('ARTCONT').AsFloat;
   cdsSTK.FieldbyName('UNMIDG').AsString := cdsArtiStk.FieldbyName('UNMIDG').AsString;
   cdsSTK.FieldbyName('UNMIDU').AsString := cdsArtiStk.FieldbyName('UNMIDU').AsString;
   cdsSTK.FieldbyName('FABID').AsString := cdsArtiStk.FieldbyName('FABID').AsString;
   cdsSTK.FieldbyName('ARTSPRO').AsString := cdsArtiStk.FieldbyName('ARTSPRO').AsString;
   cdsSTK.FieldbyName('ARTSCA').AsString := cdsArtiStk.FieldbyName('ARTSCA').AsString;
   cdsSTK.FieldbyName('ARTPARA').AsString := cdsArtiStk.FieldbyName('ARTPARA').AsString;
   cdsSTK.FieldbyName('ARTSNA').AsString := cdsArtiStk.FieldbyName('ARTSNA').AsString;
   cdsSTK.FieldbyName('ARTFUC').AsDateTime := cdsArtiStk.FieldbyName('ARTFUC').AsDateTime;
   cdsSTK.FieldbyName('TMONID').AsString := cdsArtiStk.FieldbyName('TMONID').AsString;
   cdsSTK.FieldbyName('ARTCRGO').AsString := cdsArtiStk.FieldbyName('ARTCRGO').AsString;
   cdsSTK.FieldbyName('ARTACTIVO').AsString := cdsArtiStk.FieldbyName('ARTACTIVO').AsString;
   cdsSTK.FieldbyName('CUENTAID').AsString := cdsArtiStk.FieldbyName('CUENTAID').AsString;
   cdsSTK.FieldbyName('FAMID').AsString := cdsArtiStk.FieldbyName('FAMID').AsString;
   cdsSTK.FieldbyName('SFAMID').AsString := cdsArtiStk.FieldbyName('SFAMID').AsString;
// Inicio HPC_201601_ALM
// Cambios del Maestro para incluir Clase y SubClase
   cdsSTK.FieldbyName('CLASEID').AsString := cdsArtiStk.FieldbyName('CLASEID').AsString;
   cdsSTK.FieldbyName('SCLASEID').AsString := cdsArtiStk.FieldbyName('SCLASEID').AsString;
// Fin HPC_201601_ALM
   cdsSTK.FieldByName('STKTSG01').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG01').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU01').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU01').AsFloat := 0;
   If (STKSANTG > 0) Or (STKSANTU > 0) Then
   Begin
      cdsSTK.FieldByName('STKTSG01').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG01').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU01').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU01').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);
   End;
   cdsSTK.FieldByName('STKISG01').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG01').AsFloat := 0;
   cdsSTK.FieldByName('STKIMG01').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG01').AsFloat := 0;
   cdsSTK.FieldByName('STKISU01').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU01').AsFloat := 0;
   cdsSTK.FieldByName('STKIMU01').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU01').AsFloat := 0;

   cdsSTK.FieldByName('STKTSG02').AsFloat := cdsSTK.FieldByName('STKTSG01').AsFloat;
   cdsSTK.FieldByName('STKISG02').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG02').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG02').AsFloat := cdsSTK.FieldByName('STKTMG01').AsFloat;
   cdsSTK.FieldByName('STKIMG02').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG02').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU02').AsFloat := cdsSTK.FieldByName('STKTSU01').AsFloat;
   cdsSTK.FieldByName('STKISU02').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU02').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU02').AsFloat := cdsSTK.FieldByName('STKTMU01').AsFloat;
   cdsSTK.FieldByName('STKIMU02').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU02').AsFloat := 0;

   cdsSTK.FieldByName('STKTSG03').AsFloat := cdsSTK.FieldByName('STKTSG01').AsFloat;
   cdsSTK.FieldByName('STKISG03').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG03').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG03').AsFloat := cdsSTK.FieldByName('STKTMG01').AsFloat;
   cdsSTK.FieldByName('STKIMG03').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG03').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU03').AsFloat := cdsSTK.FieldByName('STKTSU01').AsFloat;
   cdsSTK.FieldByName('STKISU03').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU03').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU03').AsFloat := cdsSTK.FieldByName('STKTMU01').AsFloat;
   cdsSTK.FieldByName('STKIMU03').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU03').AsFloat := 0;

   cdsSTK.FieldByName('STKTSG04').AsFloat := cdsSTK.FieldByName('STKTSG01').AsFloat;
   cdsSTK.FieldByName('STKISG04').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG04').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG04').AsFloat := cdsSTK.FieldByName('STKTMG01').AsFloat;
   cdsSTK.FieldByName('STKIMG04').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG04').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU04').AsFloat := cdsSTK.FieldByName('STKTSU01').AsFloat;
   cdsSTK.FieldByName('STKISU04').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU04').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU04').AsFloat := cdsSTK.FieldByName('STKTMU01').AsFloat;
   cdsSTK.FieldByName('STKIMU04').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU04').AsFloat := 0;

   cdsSTK.FieldByName('STKTSG05').AsFloat := cdsSTK.FieldByName('STKTSG01').AsFloat;
   cdsSTK.FieldByName('STKISG05').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG05').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG05').AsFloat := cdsSTK.FieldByName('STKTMG01').AsFloat;
   cdsSTK.FieldByName('STKIMG05').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG05').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU05').AsFloat := cdsSTK.FieldByName('STKTSU01').AsFloat;
   cdsSTK.FieldByName('STKISU05').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU05').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU05').AsFloat := cdsSTK.FieldByName('STKTMU01').AsFloat;
   cdsSTK.FieldByName('STKIMU05').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU05').AsFloat := 0;

   cdsSTK.FieldByName('STKTSG06').AsFloat := cdsSTK.FieldByName('STKTSG01').AsFloat;
   cdsSTK.FieldByName('STKISG06').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG06').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG06').AsFloat := cdsSTK.FieldByName('STKTMG01').AsFloat;
   cdsSTK.FieldByName('STKIMG06').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG06').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU06').AsFloat := cdsSTK.FieldByName('STKTSU01').AsFloat;
   cdsSTK.FieldByName('STKISU06').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU06').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU06').AsFloat := cdsSTK.FieldByName('STKTMU01').AsFloat;
   cdsSTK.FieldByName('STKIMU06').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU06').AsFloat := 0;

   cdsSTK.FieldByName('STKTSG07').AsFloat := cdsSTK.FieldByName('STKTSG01').AsFloat;
   cdsSTK.FieldByName('STKISG07').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG07').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG07').AsFloat := cdsSTK.FieldByName('STKTMG01').AsFloat;
   cdsSTK.FieldByName('STKIMG07').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG07').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU07').AsFloat := cdsSTK.FieldByName('STKTSU01').AsFloat;
   cdsSTK.FieldByName('STKISU07').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU07').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU07').AsFloat := cdsSTK.FieldByName('STKTMU01').AsFloat;
   cdsSTK.FieldByName('STKIMU07').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU07').AsFloat := 0;

   cdsSTK.FieldByName('STKTSG08').AsFloat := cdsSTK.FieldByName('STKTSG01').AsFloat;
   cdsSTK.FieldByName('STKISG08').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG08').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG08').AsFloat := cdsSTK.FieldByName('STKTMG01').AsFloat;
   cdsSTK.FieldByName('STKIMG08').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG08').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU08').AsFloat := cdsSTK.FieldByName('STKTSU01').AsFloat;
   cdsSTK.FieldByName('STKISU08').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU08').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU08').AsFloat := cdsSTK.FieldByName('STKTMU01').AsFloat;
   cdsSTK.FieldByName('STKIMU08').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU08').AsFloat := 0;

   cdsSTK.FieldByName('STKTSG09').AsFloat := cdsSTK.FieldByName('STKTSG01').AsFloat;
   cdsSTK.FieldByName('STKISG09').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG09').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG09').AsFloat := cdsSTK.FieldByName('STKTMG01').AsFloat;
   cdsSTK.FieldByName('STKIMG09').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG09').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU09').AsFloat := cdsSTK.FieldByName('STKTSU01').AsFloat;
   cdsSTK.FieldByName('STKISU09').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU09').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU09').AsFloat := cdsSTK.FieldByName('STKTMU01').AsFloat;
   cdsSTK.FieldByName('STKIMU09').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU09').AsFloat := 0;

   cdsSTK.FieldByName('STKTSG10').AsFloat := cdsSTK.FieldByName('STKTSG01').AsFloat;
   cdsSTK.FieldByName('STKISG10').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG10').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG10').AsFloat := cdsSTK.FieldByName('STKTMG01').AsFloat;
   cdsSTK.FieldByName('STKIMG10').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG10').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU10').AsFloat := cdsSTK.FieldByName('STKTSU01').AsFloat;
   cdsSTK.FieldByName('STKISU10').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU10').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU10').AsFloat := cdsSTK.FieldByName('STKTMU01').AsFloat;
   cdsSTK.FieldByName('STKIMU10').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU10').AsFloat := 0;

   cdsSTK.FieldByName('STKTSG11').AsFloat := cdsSTK.FieldByName('STKTSG01').AsFloat;
   cdsSTK.FieldByName('STKISG11').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG11').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG11').AsFloat := cdsSTK.FieldByName('STKTMG01').AsFloat;
   cdsSTK.FieldByName('STKIMG11').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG11').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU11').AsFloat := cdsSTK.FieldByName('STKTSU01').AsFloat;
   cdsSTK.FieldByName('STKISU11').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU11').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU11').AsFloat := cdsSTK.FieldByName('STKTMU01').AsFloat;
   cdsSTK.FieldByName('STKIMU11').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU11').AsFloat := 0;

   cdsSTK.FieldByName('STKTSG12').AsFloat := cdsSTK.FieldByName('STKTSG01').AsFloat;
   cdsSTK.FieldByName('STKISG12').AsFloat := 0;
   cdsSTK.FieldByName('STKSSG12').AsFloat := 0;
   cdsSTK.FieldByName('STKTMG12').AsFloat := cdsSTK.FieldByName('STKTMG01').AsFloat;
   cdsSTK.FieldByName('STKIMG12').AsFloat := 0;
   cdsSTK.FieldByName('STKSMG12').AsFloat := 0;
   cdsSTK.FieldByName('STKTSU12').AsFloat := cdsSTK.FieldByName('STKTSU01').AsFloat;
   cdsSTK.FieldByName('STKISU12').AsFloat := 0;
   cdsSTK.FieldByName('STKSSU12').AsFloat := 0;
   cdsSTK.FieldByName('STKTMU12').AsFloat := cdsSTK.FieldByName('STKTMU01').AsFloat;
   cdsSTK.FieldByName('STKIMU12').AsFloat := 0;
   cdsSTK.FieldByName('STKSMU12').AsFloat := 0;

   cdsSTK.FieldbyName('STKSFISG').AsFloat := 0;
   cdsSTK.FieldbyName('STKSFISU').AsFloat := 0;
   cdsSTK.FieldbyName('STKSMAXG').AsFloat := 0;
   cdsSTK.FieldbyName('STKSMAXU').AsFloat := 0;
   cdsSTK.FieldbyName('STKSMING').AsFloat := 0;
   cdsSTK.FieldbyName('STKSMINU').AsFloat := 0;

   If IngSal = 'N' Then // Sirve para Insertar cuando no tiene mov. en el año
   Begin
      cdsSTK.FieldByName('STKTSG02').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG02').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU02').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU02').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);

      cdsSTK.FieldByName('STKTSG03').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG03').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU03').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU03').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);

      cdsSTK.FieldByName('STKTSG04').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG04').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU04').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU04').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);

      cdsSTK.FieldByName('STKTSG05').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG05').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU05').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU05').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);

      cdsSTK.FieldByName('STKTSG06').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG06').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU06').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU06').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);

      cdsSTK.FieldByName('STKTSG07').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG07').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU07').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU07').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);

      cdsSTK.FieldByName('STKTSG08').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG08').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU08').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU08').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);

      cdsSTK.FieldByName('STKTSG09').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG09').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU09').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU09').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);

      cdsSTK.FieldByName('STKTSG10').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG10').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU10').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU10').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);

      cdsSTK.FieldByName('STKTSG11').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG11').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU11').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU11').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);

      cdsSTK.FieldByName('STKTSG12').AsFloat := FRound(cdsQry.FieldByName('STKTSG12').AsFloat + (cdsQry.FieldByName('STKISG12').AsFloat - cdsQry.FieldByName('STKSSG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMG12').AsFloat := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + (cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTSU12').AsFloat := FRound(cdsQry.FieldByName('STKTSU12').AsFloat + (cdsQry.FieldByName('STKISU12').AsFloat - cdsQry.FieldByName('STKSSU12').AsFloat), 15, 4);
      cdsSTK.FieldByName('STKTMU12').AsFloat := FRound(cdsQry.FieldByName('STKTMU12').AsFloat + (cdsQry.FieldByName('STKIMU12').AsFloat - cdsQry.FieldByName('STKSMU12').AsFloat), 15, 4);
   End;

   cdsPost(cdsSTK);
   cdsSTK.Post;
   cdsSTK.Edit;
   CantidadActG := cdsSTK.FieldByName('STKSACTG').AsFloat;
   CantidadActU := cdsSTK.FieldByName('STKSACTU').AsFloat;
   cdsSTK.FieldByName('STKSACTG').AsFloat := FRound(CantidadActG, 15, 4);
   cdsSTK.FieldByName('STKSACTU').AsFloat := FRound(CantidadActU, 15, 4);
   cdsSTK.FieldByName('STKMACTG').AsFloat := FRound(CantidadActG * PrecioU * Contenido, 15, 4); // 41 * 0.5031 * 48
   cdsSTK.FieldByName('STKMACTU').AsFloat := FRound(CantidadActU * PrecioU, 15, 4); // CONTROL DE STOCK
   cdsSTK.FieldByName('STKRACTG').AsFloat := xReserva;
   cdsSTK.ApplyUpdates(0);
End;

Procedure TDMALM.cdsCInventarioReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(DataSet, UpdateKind, E);
End;

Procedure TDMALM.cdsDInventarioReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(DataSet, UpdateKind, E);
End;

Procedure TDMALM.cdsKDXSerieReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(DataSet, UpdateKind, E);
End;

Procedure TDMALM.ActualizaRequerimiento(sCIA, sLoc, sTipoAdq, sCCos, sArtid: String; dCantAtendida: double);
Var
   xEstado, xSQL: String;
   dCantidadAtendidaxArticulo: double;
   dSaldoxArticulo: double;
   bsigue: boolean;
Begin
   xSQL := ' SELECT A.CIAID,A.LOCID,A.CCOSID,A.URQID,DURQID,B.URQEST, B.URQESTUSR, B.URQFREG,A.ARTID, A.DURQCNAG,A.DURQCNATG,A.DURQCNSLG ' +
      ' FROM LOG307 A , LOG306 B ' +
      ' WHERE (B.CIAID=A.CIAID AND B.LOCID=A.LOCID AND B.CCOSID=A.CCOSID AND B.URQID=A.URQID) ' +
      ' AND A.CIAID=' + QuotedStr(sCia) + ' AND A.LOCID=' + QuotedStr(sLoc) + ' AND B.TIPOADQ=' + QuotedStr(sTipoAdq) +
      ' AND A.CCOSID=' + QuotedStr(sCCos) + ' AND ARTID=' + QuotedStr(sArtid) +
      ' AND B.URQEST=''ACEPTADO'' AND (B.URQESTUSR=''AUTORIZADO'' OR B.URQESTUSR=''PARCIAL'') ' +
      ' AND DURQCNSLG>0 ORDER BY URQFECHA ';
   cdsQry2.Close;
   cdsQry2.Filter := '';
   cdsQry2.Filtered := False;
   cdsQry2.IndexFieldNames := '';
   cdsQry2.DataRequest(xSQL);
   cdsQry2.Open;
   If cdsQry2.RecordCount > 0 Then
   Begin
      cdsQry2.First;
      bsigue := True;
      While bSigue Do
      Begin
         dSaldoxArticulo := cdsQry2.FieldByName('DURQCNSLG').AsFloat;
         If dSaldoxArticulo >= dCantAtendida Then
         Begin
            dCantidadAtendidaxArticulo := dCantAtendida;
            bSigue := False;
         End
         Else
         Begin
            dCantidadAtendidaxArticulo := dSaldoxArticulo;
            bSigue := True;
            dCantAtendida := dCantAtendida - dCantidadAtendidaxArticulo;
         End;
         dSaldoxArticulo := dSaldoxArticulo - dCantAtendida;
      // EJECUTA LA ACTUALIZACION DEL DETALLE DE REQUERIMIENTO
         xSQL := 'UPDATE LOG307 ' +
            ' SET DURQCNATG=' + wReplacCeros + '(DURQCNATG,0)+' + FloatToStr(dCantidadAtendidaxArticulo) + ', ' +
            ' DURQCNSLG=' + wReplacCeros + '(DURQCNAG,0)-(' + wReplacCeros + '(DURQCNATG,0)+' + FloatToStr(dCantidadAtendidaxArticulo) + ') ' +
            ' WHERE CIAID=' + QuotedStr(sCia) + ' AND LOCID=' + QuotedStr(sLoc) +
            ' AND CCOSID=' + QuotedStr(sCCos) + ' AND ARTID=' + QuotedStr(sArtid) +
            ' AND URQID=' + QuotedStr(cdsQry2.FieldByName('URQID').AsString) +
            ' AND DURQID=' + QuotedStr(cdsQry2.FieldByName('DURQID').AsString);
         Try
            DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            showMessage('Error 1');
         End;

      // EJECUTA LA ACTUALIZACION DE LA CABECERA DE REQUERIMIENTO
         xSQL := ' SELECT SUM(A.DURQCNAG) DURQCNAG,SUM(A.DURQCNATG) DURQCNATG,SUM(A.DURQCNSLG) DURQCNSLG ' +
            ' FROM LOG307 A , LOG306 B ' +
            ' WHERE (B.CIAID=A.CIAID AND B.LOCID=A.LOCID AND B.CCOSID=A.CCOSID AND B.URQID=A.URQID) ' +
            ' AND A.CIAID=' + QuotedStr(sCia) + ' AND A.LOCID=' + QuotedStr(sLoc) +
            ' AND B.TIPOADQ=' + QuotedStr(sTipoAdq) + ' AND A.CCOSID=' + QuotedStr(sCCos) +
            ' AND A.URQID=' + QuotedStr(cdsQry2.FieldByName('URQID').AsString) +
            ' AND B.URQEST=''ACEPTADO'' AND (B.URQESTUSR=''AUTORIZADO'' OR B.URQESTUSR=''PARCIAL'') ' +
            ' GROUP BY A.CIAID,A.LOCID,A.CCOSID,A.URQID,B.URQEST, B.URQESTUSR, B.URQFREG ';
         cdsQry.Close;
         cdsQry.DataRequest(xSQL);
         cdsQry.Open;
         If cdsQry.RecordCount > 0 Then
         Begin
            If cdsQry.FieldByName('DURQCNSLG').AsFloat = 0 Then
            Begin
               xEstado := 'ATENDIDO';
            End;
            If (cdsQry.FieldByName('DURQCNSLG').AsFloat > 0) And (cdsQry.FieldByName('DURQCNSLG').AsFloat < cdsQry.FieldByName('DURQCNAG').AsFloat) Then
            Begin
               xEstado := 'PARCIAL';
            End;
         End;
         xSQL := ' UPDATE LOG306 A SET A.URQESTUSR=' + quotedStr(xEstado) +
            ' WHERE A.CIAID=' + QuotedStr(sCia) + ' AND A.LOCID=' + QuotedStr(sLoc) +
            ' AND A.TIPOADQ=' + QuotedStr(sTipoAdq) + ' AND A.CCOSID=' + QuotedStr(sCCos) +
            ' AND A.URQID=' + QuotedStr(cdsQry2.FieldByName('URQID').AsString);

         Try
            DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            showMessage('Error 2');
         End;

         cdsQry2.Next;
         If cdsQry2.EOF Then
            bSigue := False;
      End;
   End;
End;

Procedure TDMALM.ControlStockJCC(sCIA, sALM, sLOC, sTIN, sArt, Ano, Mes: String;
   IngSal: Char; xCantg, xMontg: double);
Var
   xCampoCant, xCampoMonto: String;
Begin
   xCampoCant := 'STK' + IngSal + 'SG' + Mes;
   xCampoMonto := 'STK' + IngSal + 'MG' + Mes;
   cdsSTK.Edit;
   cdsSTK.FieldByName(xCampoCant).AsFloat := cdsSTK.FieldByName(xCampoCant).AsFloat
      + xCantg;
   cdsSTK.FieldByName(xCampoMonto).AsFloat := cdsSTK.FieldByName(xCampoMonto).AsFloat
      + (xCantG * xMontG);
   If IngSal = 'S' Then
   Begin
 // En el caso de las salidas, los precios se toma del precio de costo promedio del maestro de articulos
      cdsKDX.Edit;
      cdsKDX.FieldByName('ARTPCG').AsFloat := xMontG;
      cdsKDX.FieldByName('ARTTOTALG').AsFloat := FRound(xCantG * xMontG, 15, 4);
      cdsKDX.FieldByName('ARTTOTAL').AsFloat := FRound(xCantG * xMontG, 15, 4);
      cdsKDX.Post;
   End;
End;

Procedure TDMALM.SaldosInicialesJCC(sCIA, sArt, xAnoMes: String; sContenido,
   sPrecio: Double);
Var
   xMes: Integer;
   sMes: String;
   xPrestUniG, xPrestUniU, xPrestPrecio: double;
Begin
   xMes := StrtoInt(copy(xAnoMes, 5, 2));
   sMes := copy(xAnoMes, 5, 2);
   cdsstk.Edit; //  SALDOS INICIALES

   If XMes <= 1 Then
   Begin
      cdsSTK.FieldByName('STKTSG02').AsFloat := FRound(cdsSTK.FieldByName('STKTSG01').AsFloat
         + cdsSTK.FieldByName('STKISG01').AsFloat
         - cdsSTK.FieldByName('STKSSG01').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG02').AsFloat := FRound(cdsSTK.FieldByName('STKTMG01').AsFloat
         + cdsSTK.FieldByName('STKIMG01').AsFloat
         - cdsSTK.FieldByName('STKSMG01').AsFloat, 15, 4);
   End;

   If XMes <= 2 Then
   Begin
      cdsSTK.FieldByName('STKTSG03').AsFloat := FRound(cdsSTK.FieldByName('STKTSG02').AsFloat
         + cdsSTK.FieldByName('STKISG02').AsFloat
         - cdsSTK.FieldByName('STKSSG02').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG03').AsFloat := FRound(cdsSTK.FieldByName('STKTMG02').AsFloat
         + cdsSTK.FieldByName('STKIMG02').AsFloat
         - cdsSTK.FieldByName('STKSMG02').AsFloat, 15, 4);
   End;

   If XMes <= 3 Then
   Begin
      cdsSTK.FieldByName('STKTSG04').AsFloat := FRound(cdsSTK.FieldByName('STKTSG03').AsFloat
         + cdsSTK.FieldByName('STKISG03').AsFloat
         - cdsSTK.FieldByName('STKSSG03').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG04').AsFloat := FRound(cdsSTK.FieldByName('STKTMG03').AsFloat
         + cdsSTK.FieldByName('STKIMG03').AsFloat
         - cdsSTK.FieldByName('STKSMG03').AsFloat, 15, 4);
   End;
   If XMes <= 4 Then
   Begin
      cdsSTK.FieldByName('STKTSG05').AsFloat := FRound(cdsSTK.FieldByName('STKTSG04').AsFloat
         + cdsSTK.FieldByName('STKISG04').AsFloat
         - cdsSTK.FieldByName('STKSSG04').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG05').AsFloat := FRound(cdsSTK.FieldByName('STKTMG04').AsFloat
         + cdsSTK.FieldByName('STKIMG04').AsFloat
         - cdsSTK.FieldByName('STKSMG04').AsFloat, 15, 4);
   End;

   If XMes <= 5 Then
   Begin
      cdsSTK.FieldByName('STKTSG06').AsFloat := FRound(cdsSTK.FieldByName('STKTSG05').AsFloat
         + cdsSTK.FieldByName('STKISG05').AsFloat
         - cdsSTK.FieldByName('STKSSG05').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG06').AsFloat := FRound(cdsSTK.FieldByName('STKTMG05').AsFloat
         + cdsSTK.FieldByName('STKIMG05').AsFloat
         - cdsSTK.FieldByName('STKSMG05').AsFloat, 15, 4);
   End;

   If XMes <= 6 Then
   Begin
      cdsSTK.FieldByName('STKTSG07').AsFloat := FRound(cdsSTK.FieldByName('STKTSG06').AsFloat
         + cdsSTK.FieldByName('STKISG06').AsFloat
         - cdsSTK.FieldByName('STKSSG06').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG07').AsFloat := FRound(cdsSTK.FieldByName('STKTMG06').AsFloat
         + cdsSTK.FieldByName('STKIMG06').AsFloat
         - cdsSTK.FieldByName('STKSMG06').AsFloat, 15, 4);
   End;

   If XMes <= 7 Then
   Begin
      cdsSTK.FieldByName('STKTSG08').AsFloat := FRound(cdsSTK.FieldByName('STKTSG07').AsFloat
         + cdsSTK.FieldByName('STKISG07').AsFloat
         - cdsSTK.FieldByName('STKSSG07').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG08').AsFloat := FRound(cdsSTK.FieldByName('STKTMG07').AsFloat
         + cdsSTK.FieldByName('STKIMG07').AsFloat
         - cdsSTK.FieldByName('STKSMG07').AsFloat, 15, 4);
   End;

   If XMes <= 8 Then
   Begin
      cdsSTK.FieldByName('STKTSG09').AsFloat := FRound(cdsSTK.FieldByName('STKTSG08').AsFloat
         + cdsSTK.FieldByName('STKISG08').AsFloat
         - cdsSTK.FieldByName('STKSSG08').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG09').AsFloat := FRound(cdsSTK.FieldByName('STKTMG08').AsFloat
         + cdsSTK.FieldByName('STKIMG08').AsFloat
         - cdsSTK.FieldByName('STKSMG08').AsFloat, 15, 4);
   End;

   If XMes <= 9 Then
   Begin
      cdsSTK.FieldByName('STKTSG10').AsFloat := FRound(cdsSTK.FieldByName('STKTSG09').AsFloat
         + cdsSTK.FieldByName('STKISG09').AsFloat
         - cdsSTK.FieldByName('STKSSG09').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG10').AsFloat := FRound(cdsSTK.FieldByName('STKTMG09').AsFloat
         + cdsSTK.FieldByName('STKIMG09').AsFloat
         - cdsSTK.FieldByName('STKSMG09').AsFloat, 15, 4);
   End;

   If XMes <= 10 Then
   Begin
      cdsSTK.FieldByName('STKTSG11').AsFloat := FRound(cdsSTK.FieldByName('STKTSG10').AsFloat
         + cdsSTK.FieldByName('STKISG10').AsFloat
         - cdsSTK.FieldByName('STKSSG10').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG11').AsFloat := FRound(cdsSTK.FieldByName('STKTMG10').AsFloat
         + cdsSTK.FieldByName('STKIMG10').AsFloat
         - cdsSTK.FieldByName('STKSMG10').AsFloat, 15, 4);
   End;

   If XMes <= 11 Then
      cdsSTK.FieldByName('STKTSG12').AsFloat := FRound(cdsSTK.FieldByName('STKTSG11').AsFloat
         + cdsSTK.FieldByName('STKISG11').AsFloat
         - cdsSTK.FieldByName('STKSSG11').AsFloat, 15, 4);
   cdsSTK.FieldByName('STKTMG12').AsFloat := FRound(cdsSTK.FieldByName('STKTMG11').AsFloat
      + cdsSTK.FieldByName('STKIMG11').AsFloat
      - cdsSTK.FieldByName('STKSMG11').AsFloat, 15, 4);

   cdsSTK.FieldByName('STKSACTG').AsFloat := FRound(cdsSTK.FieldByName('STKTSG' + sMes).AsFloat + cdsSTK.FieldByName('STKISG' + sMes).AsFloat - cdsSTK.FieldByName('STKSSG' + sMes).AsFloat, 15, 4);
   cdsSTK.FieldByName('STKSACTU').AsFloat := FRound(cdsSTK.FieldByName('STKTSU' + sMes).AsFloat + cdsSTK.FieldByName('STKISU' + sMes).AsFloat - cdsSTK.FieldByName('STKSSU' + sMes).AsFloat, 15, 4);
   cdsSTK.FieldByName('STKMACTG').AsFloat := FRound(cdsSTK.FieldByName('STKTMG' + sMes).AsFloat + cdsSTK.FieldByName('STKIMG' + sMes).AsFloat - cdsSTK.FieldByName('STKSMG' + sMes).AsFloat, 15, 4);
   cdsSTK.FieldByName('STKMACTU').AsFloat := FRound(cdsSTK.FieldByName('STKTMU' + sMes).AsFloat + cdsSTK.FieldByName('STKIMU' + sMes).AsFloat - cdsSTK.FieldByName('STKSMU' + sMes).AsFloat, 15, 4);

   cdsPost(cdsSTK);
   cdsstk.Post; //  SALDOS INICIALES
End;

Procedure TDMALM.GeneraContabilizacion(xxCia, xxTDiario, xxAnoMM, xxNoComp, xxPerCNT: String; xForma: TForm; xTipoC: String);
Var
   xSQL: String;
Begin
   Transferencia_CXP_a_CNT_Almacen(xxCia, xxTDiario, xxAnoMM, xxNoComp, xxPerCNT, xTipoC);
End;

Procedure TDMALM.Transferencia_CXP_a_CNT_Almacen(xCia, xTDia, xAAMM, xNoComp, xPerCNT, xTipoC: String; xxAuto: String = '');
Var
   xSQL, xWhere: String;
   xNombreBoton: String;
   cdsDetCxPx {, cdsDetCxP2}: TwwClientDataSet;
   xContR: Integer;
   xTOTMG, xTOTTO, xxTCambio: Double;
   D, M, Y: Word;
   sTCambio, sFecha, xTCtaD, xTCtaH: String;
   NISAANO, NISAMES, NISADIA, NISAANOMES, NISATRIM, NISASEM, NISASS, NISAAATRI, NISAAASEM, NISAAASS, NISANOMM: String;
   sCiaDes, sAutoNum, xxNoReg: String;
   xSQLCta, xMesAct, xFechaCNT: String;
Begin

   If xAAMM = xPerCNT Then
   Begin
      xFec_Sis := cdsQry2.FieldByName('NISAFREG').AsString;
      xHor_Sis := cdsQry2.FieldByName('NISAHREG').AsString;
      xFec_Emi := cdsQry2.FieldByName('NISAFREG').AsString;
   End
   Else
   Begin
      xMesAct := Copy(xPerCNT, 5, 2);
      If xMesAct < '12' Then
         xFechaCNT := datetostr(strtodate('01/' + strzero(IntToStr(strtoint(xMesAct) + 1), 2) + '/' + Copy(xPerCNT, 1, 4)) - 1)
      Else
      Begin
        // xFechaCNT := '31/12/' + '/' + Copy(xPerCNT, 1, 4);
         xFechaCNT := '01/12/' + Copy(xPerCNT, 1, 4);
      End;
      xFec_Sis := xFechaCNT;
      xHor_Sis := cdsQry2.FieldByName('NISAHREG').AsString;
      xFec_Emi := cdsQry2.FieldByName('NISAFREG').AsString;
   End;

   sTCambio := CalcTipoCambio(wTMonExt, StrtoDate(xFec_Sis), 'TCAM' + wTipoCambioUsar);

   sFecha := FormatDateTime(wFormatFecha, StrtoDate(xFec_Sis));
   xSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
   FiltraCDS(cdsPeriodo, xSQL);

   DecodeDate(StrtoDate(xFec_Sis), Y, M, D);

   NISAANO := IntToStr(Y);
   NISAMES := strzero(IntToStr(M), 2);
   NISADIA := strzero(IntToStr(D), 2);
   NISAANOMES := IntToStr(Y) + strzero(IntToStr(M), 2);
   NISATRIM := cdsPeriodo.fieldbyName('FECTRIM').asString;
   NISASEM := cdsPeriodo.fieldbyName('FECSEM').asString;
   NISASS := cdsPeriodo.fieldbyName('FECSS').asString;
   NISAAATRI := cdsPeriodo.fieldbyName('FECAATRI').asString;
   NISAAASEM := cdsPeriodo.fieldbyName('FECAASEM').asString;
   NISAAASS := cdsPeriodo.fieldbyName('FECAASS').asString;
   NISANOMM := IntToStr(Y) + strzero(IntToStr(M), 2);

   If xxAuto = '' Then
   Begin
     // TGE208: TRANSACCION
      xSQL := 'SELECT NVL(G.CIADEST,''XX'') CIADEST,' + QuotedStr(xCia) + ' CIAID,' + QuotedStr(xTDia) + ' TDIARID, ' + QuotedStr(xAAMM) + ' DCPANOMM, ' +
         QuotedStr(xNoComp) + ' CPNOREG, ' +
         'CASE WHEN C.TRIID IN (''14'',''08'') THEN B.CTADEBE ELSE J.CUENTAID END CUENTAID, ' +
         'G.CUENTAID CUENTAID2,E.CTADES,' + QuotedStr(wModulo) + ' MODULO,E.CTADES DCPGLOSA,H.CTADES DCPGLOSA2,''D'' DCPDH,' +
         sTCambio + ' CPTCAMPR,0 DCPMOORI,0 DCPMOLOC,0 DCPMOEXT,' + QuotedStr(xFec_Emi) + ' CPFEMIS,' + QuotedStr(xFec_Emi) + ' CPFVCMTO, ' +
         QuotedStr(xFec_Sis) + ' DCPFCOM,''I'' DCPESTDO, ' + wRepFecServi + ' FECHA, ' + wRepHorServi + ' HORA, ' +
         QuotedStr(NISAANO) + ' DCPANOC, ' + QuotedStr(NISAMES) + ' DCPMM, ' +
         QuotedStr(NISADIA) + ' DCPDD, ' + QuotedStr(NISATRIM) + ' DCPTRI, ' + QuotedStr(NISASEM) + ' DCPSEM, ' + QuotedStr(NISASS) + ' DCPSS, ' + QuotedStr(NISAANOMES) + ' DCPANOMES, ' +
         QuotedStr(NISAAATRI) + ' DCPAATRI, ' + QuotedStr(NISAAASEM) + ' DCPAASEM, ' + QuotedStr(NISAAASS) + ' DCPAASS, ' +
         QuotedStr(wTMonLoc) + ' TMONID,''N'' CNTCUADRE, E.CTADES, E.CTA_CCOS,H.CTA_CCOS CTA_CCOS2, C.CCOSID, G.CCOSDES, F.TDIARDES,' + QuotedStr(cdsQry2.FieldByName('CIAID').AsString + cdsQry2.FieldByName('ALMID').AsString) +
         ' DCPLOTE,0 TOTDEBE,SUM(ROUND(A.KDXCNTG*A.ARTPCG,2)) TOTHABER, ' +
         '0 CPPRORORI, 0 CPPRORMOLOC, 0 CPPRORMOEXT,C.TDAID,C.NISAID,C.TINID,B.TRIABR,E.CTA_DOC,B.TRISGT, B.TRIID ' +
         ' FROM LOG315 A, TGE208 B, TGE169 J, LOG314 C, TGE131 D, TGE202 E, TGE104 F, TGE203 G, TGE202 H ' +
         ' WHERE A.CIAID=' + QuotedStr(xCia) + ' AND A.KDXANOMM=' + QuotedStr(xAAMM) +
         ' AND C.ALMID=' + QuotedStr(cdsQry2.FieldByName('ALMID').AsString) + ' AND C.TDAID=' + QuotedStr(cdsQry2.FieldByName('TDAID').AsString) +
         ' AND C.TINID=' + QuotedStr(cdsQry2.FieldByName('TINID').AsString) + ' AND C.NISAID=' + QuotedStr(cdsQry2.FieldByName('NISAID').AsString) +
         '  AND A.CIAID=J.CIAID(+) AND A.TINID=J.TINID(+) AND A.GRARID=J.GRARID(+) AND A.FAMID=J.FAMID(+) ' +
         ' AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' ' +
         ' AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID AND A.ALMID=C.ALMID AND A.NISAID=C.NISAID AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID ' +
         ' AND A.CIAID=D.CIAID AND A.TINID=D.TINID AND A.GRARID=D.GRARID ' +
         ' AND A.CIAID=E.CIAID AND D.CUENTAID=E.CUENTAID(+) ' +
         ' AND F.TDIARID=' + QuotedStr(xTDia) + ' AND A.CCOSID=G.CCOSID(+) ' + //AND G.CCOSCIAS LIKE '+QuotedStr('%'+xCia+'%')+
         ' AND ' + QuotedStr(xCia) + '=H.CIAID(+) AND G.CUENTAID=H.CUENTAID(+) ' +
         ' GROUP BY J.CUENTAID,E.CTADES,H.CTADES,H.CTA_CCOS,E.CTA_CCOS,C.CCOSID,G.CCOSDES,F.TDIARDES,C.TDAID,C.NISAID,C.TINID,B.TRIABR,E.CTA_DOC,B.TRISGT, G.CUENTAID, G.CIADEST, C.TRIID, B.CTADEBE, B.TRIID   ';
      xSQL := xSQL + ' UNION ALL ' +
     // TGE131: LINEA
      'SELECT NVL(G.CIADEST,''XX'') CIADEST,' + QuotedStr(xCia) + ' CIAID,' + QuotedStr(xTDia) + ' TDIARID, ' + QuotedStr(xAAMM) + ' DCPANOMM, ' +
         QuotedStr(xNoComp) + ' CPNOREG, D.CUENTAID, D.CUENTAHAB CUENTAID2, E.CTADES,' + QuotedStr(wModulo) + ' MODULO, E.CTADES DCPGLOSA, H.CTADES DCPGLOSA2,''H'' DCPDH,' +
         sTCambio + ' CPTCAMPR,0 DCPMOORI,0 DCPMOLOC,0 DCPMOEXT,' + QuotedStr(xFec_Emi) + ' CPFEMIS,' + QuotedStr(xFec_Emi) + ' CPFVCMTO, ' +
         QuotedStr(xFec_Sis) + ' DCPFCOM,''I'' DCPESTDO, ' + wRepFecServi + ' FECHA, ' + wRepHorServi + ' HORA, ' +
         QuotedStr(NISAANO) + ' DCPANOC, ' + QuotedStr(NISAMES) + ' DCPMM, ' +
         QuotedStr(NISADIA) + ' DCPDD, ' + QuotedStr(NISATRIM) + ' DCPTRI, ' + QuotedStr(NISASEM) + ' DCPSEM, ' + QuotedStr(NISASS) + ' DCPSS, ' + QuotedStr(NISAANOMES) + ' DCPANOMES, ' +
         QuotedStr(NISAAATRI) + ' DCPAATRI, ' + QuotedStr(NISAAASEM) + ' DCPAASEM, ' + QuotedStr(NISAAASS) + ' DCPAASS, ' +
         QuotedStr(wTMonLoc) + ' TMONID,''N'' CNTCUADRE, E.CTADES, E.CTA_CCOS,H.CTA_CCOS CTA_CCOS2,C.CCOSID, G.CCOSDES, F.TDIARDES,' + quotedStr(cdsQry2.FieldByName('CIAID').AsString + cdsQry2.FieldByName('ALMID').AsString) +
         ' DCPLOTE,SUM(ROUND(A.KDXCNTG*A.ARTPCG,2)) TOTDEBE,0 TOTHABER, ' +
         '0 CPPRORORI, 0 CPPRORMOLOC, 0 CPPRORMOEXT,C.TDAID,C.NISAID,C.TINID,B.TRIABR,E.CTA_DOC,B.TRISGT, B.TRIID ' +
         ' FROM LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE202 E, TGE104 F,TGE203 G, TGE202 H ' +
         ' WHERE A.CIAID=' + QuotedStr(xCia) + ' AND A.KDXANOMM=' + QuotedStr(xAAMM) +
         ' AND C.ALMID=' + QuotedStr(cdsQry2.FieldByName('ALMID').AsString) + ' AND C.TDAID=' + QuotedStr(cdsQry2.FieldByName('TDAID').AsString) +
         ' AND C.TINID=' + QuotedStr(cdsQry2.FieldByName('TINID').AsString) + ' AND C.NISAID=' + QuotedStr(cdsQry2.FieldByName('NISAID').AsString) +
         ' AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' ' +
         ' AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID AND A.ALMID=C.ALMID AND A.NISAID=C.NISAID AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID ' +
         ' AND A.CIAID=D.CIAID AND A.TINID=D.TINID AND A.GRARID=D.GRARID ' +
         ' AND A.CIAID=E.CIAID AND D.CUENTAID=E.CUENTAID(+) ' +
         ' AND F.TDIARID=' + QuotedStr(xTDia) + ' AND A.CCOSID=G.CCOSID(+) ' + //AND G.CCOSCIAS LIKE '+QuotedStr('%'+xCia+'%')+
         ' AND A.CIAID=H.CIAID AND D.CUENTAID=H.CUENTAID(+) ' +
         ' GROUP BY B.CUENTAID, D.CUENTAHAB, E.CTADES,H.CTADES,H.CTA_CCOS,E.CTA_CCOS,C.CCOSID,G.CCOSDES,F.TDIARDES,C.TDAID,C.NISAID,C.TINID,B.TRIABR,E.CTA_DOC,B.TRISGT,G.CIADEST, D.CUENTAID, B.TRIID ';
   End
   Else
   Begin
   //ASIENTO AUTOMATICO
     // TGE208: TRANSACCION
      xSQL := 'SELECT ''XX'' CIADEST,' + QuotedStr(xCia) + ' CIAID,' + QuotedStr(xTDia) + ' TDIARID, ' + QuotedStr(xAAMM) + ' DCPANOMM, ' +
         QuotedStr(xNoComp) + ' CPNOREG, ' +
         'CASE WHEN B.TRIID IN (''17'',''20'',''03'') AND ' + QuotedStr(xCia) + ' NOT IN (''01'',''02'',''03'',''04'',''05'',''15'') THEN max(B.CTADEBE) ' +
         '     WHEN B.TRIID IN (''17'',''20'',''03'') AND ' + QuotedStr(xCia) + '     IN (''03'',''04'',''05'',''15'') THEN MAX(j.CUENTAid) ' +
         '     ELSE B.CUENTAID ' +
         'END CUENTAID, ' +
         'G.CUENTAID CUENTAID2, ' +
         'CASE WHEN B.TRIID IN (''17'',''20'',''03'') AND ' + QuotedStr(xCia) + ' NOT IN (''01'',''02'',''03'',''04'',''05'',''15'') THEN (select ctades from tge202 where ciaid=''02'' and cuentaid=B.CTADEBE) ' +
         '     WHEN B.TRIID IN (''17'',''20'',''03'') AND ' + QuotedStr(xCia) + '     IN (''03'',''04'',''05'',''15'') THEN (select ctades from tge202 where ciaid=''02'' and cuentaid=D.CUENTAHAB) ' +
         '     ELSE (select ctades from tge202 where ciaid=''02'' and cuentaid=B.CUENTAID) ' +
         'END CTADES, ' +
         QuotedStr(wModulo) + ' MODULO, ' +
         'CASE WHEN B.TRIID IN (''17'',''20'',''03'') AND ' + QuotedStr(xCia) + ' NOT IN (''01'',''02'',''03'',''04'',''05'',''15'') THEN (select ctades from tge202 where ciaid=''02'' and cuentaid=B.CTADEBE) ' +
         '     WHEN B.TRIID IN (''17'',''20'',''03'') AND ' + QuotedStr(xCia) + '     IN (''03'',''04'',''05'',''15'') THEN (select ctades from tge202 where ciaid=''02'' and cuentaid=D.CUENTAHAB) ' +
         '     ELSE (select ctades from tge202 where ciaid=''02'' and cuentaid=B.CUENTAID) ' +
         'END DCPGLOSA, ' +
         'H.CTADES DCPGLOSA2,''D'' DCPDH,' +
         sTCambio + ' CPTCAMPR,0 DCPMOORI,0 DCPMOLOC,0 DCPMOEXT,' + QuotedStr(xFec_Emi) + ' CPFEMIS,' + QuotedStr(xFec_Emi) + ' CPFVCMTO, ' +
         QuotedStr(xFec_Sis) + ' DCPFCOM,''I'' DCPESTDO, ' + wRepFecServi + ' FECHA, ' + wRepHorServi + ' HORA, ' +
         QuotedStr(NISAANO) + ' DCPANOC, ' + QuotedStr(NISAMES) + ' DCPMM, ' +
         QuotedStr(NISADIA) + ' DCPDD, ' + QuotedStr(NISATRIM) + ' DCPTRI, ' + QuotedStr(NISASEM) + ' DCPSEM, ' + QuotedStr(NISASS) + ' DCPSS, ' + QuotedStr(NISAANOMES) + ' DCPANOMES, ' +
         QuotedStr(NISAAATRI) + ' DCPAATRI, ' + QuotedStr(NISAAASEM) + ' DCPAASEM, ' + QuotedStr(NISAAASS) + ' DCPAASS, ' +
         QuotedStr(wTMonLoc) + ' TMONID,''N'' CNTCUADRE, E.CTADES, E.CTA_CCOS,H.CTA_CCOS CTA_CCOS2, C.CCOSID, G.CCOSDES, F.TDIARDES,' + QuotedStr(cdsQry2.FieldByName('CIAID').AsString + cdsQry2.FieldByName('ALMID').AsString) +
         ' DCPLOTE,0 TOTDEBE,SUM(ROUND(A.KDXCNTG*A.ARTPCG,2)) TOTHABER, ' +
         '0 CPPRORORI, 0 CPPRORMOLOC, 0 CPPRORMOEXT,C.TDAID,C.NISAID,C.TINID,B.TRIABR,E.CTA_DOC,B.TRISGT, B.TRIID ' +
         ' FROM LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE202 E,TGE104 F, TGE203 G, TGE202 H, TGE169 J ' +
         ' WHERE A.CIAID=' + QuotedStr(cdsQry2.FieldByName('CIAID').AsString) + ' AND A.KDXANOMM=' + QuotedStr(xAAMM) +
         ' AND C.ALMID=' + QuotedStr(cdsQry2.FieldByName('ALMID').AsString) + ' AND C.TDAID=' + QuotedStr(cdsQry2.FieldByName('TDAID').AsString) +
         ' AND C.TINID=' + QuotedStr(cdsQry2.FieldByName('TINID').AsString) + ' AND C.NISAID=' + QuotedStr(cdsQry2.FieldByName('NISAID').AsString) +
         ' AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' ' +
         ' AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID AND A.ALMID=C.ALMID AND A.NISAID=C.NISAID AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID ' +
         ' AND A.CIAID=D.CIAID AND A.TINID=D.TINID AND A.GRARID=D.GRARID ' +
         ' AND A.CIAID=E.CIAID AND B.CUENTAID=E.CUENTAID(+) ' +
         ' AND F.TDIARID=' + QuotedStr(xTDia) + ' AND A.CCOSID=G.CCOSID(+) ' + //AND G.CCOSCIAS LIKE '+QuotedStr('%'+xCia+'%')+
         ' AND ' + QuotedStr(xCia) + '=H.CIAID(+) AND G.CUENTAID=H.CUENTAID(+) ' +
         '  AND A.CIAID=J.CIAID(+) AND A.TINID=J.TINID(+) AND A.GRARID=J.GRARID(+) AND A.FAMID=J.FAMID(+) ' +
         ' GROUP BY B.CUENTAID,E.CTADES,H.CTADES,H.CTA_CCOS,E.CTA_CCOS,C.CCOSID,G.CCOSDES,F.TDIARDES,C.TDAID,C.NISAID,C.TINID,B.TRIABR,E.CTA_DOC,B.TRISGT, G.CUENTAID, B.TRIID, B.CTADEBE, D.CUENTAHAB ';
      xSQL := xSQL + ' UNION ALL ' +
     // TGE131: LINEA
      'SELECT ''XX'' CIADEST,' + QuotedStr(xCia) + ' CIAID,' + QuotedStr(xTDia) + ' TDIARID, ' + QuotedStr(xAAMM) + ' DCPANOMM, ' +
         QuotedStr(xNoComp) + ' CPNOREG, B.CTAHABER CUENTAID,D.CUENTAID CUENTAID2,H.CTADES,' + QuotedStr(wModulo) + ' MODULO,E.CTADES DCPGLOSA,H.CTADES DCPGLOSA2,''H'' DCPDH,' +
         sTCambio + ' CPTCAMPR,0 DCPMOORI,0 DCPMOLOC,0 DCPMOEXT,' + QuotedStr(xFec_Emi) + ' CPFEMIS,' + QuotedStr(xFec_Emi) + ' CPFVCMTO, ' +
         QuotedStr(xFec_Sis) + ' DCPFCOM,''I'' DCPESTDO, ' + wRepFecServi + ' FECHA, ' + wRepHorServi + ' HORA, ' +
         QuotedStr(NISAANO) + ' DCPANOC, ' + QuotedStr(NISAMES) + ' DCPMM, ' +
         QuotedStr(NISADIA) + ' DCPDD, ' + QuotedStr(NISATRIM) + ' DCPTRI, ' + QuotedStr(NISASEM) + ' DCPSEM, ' + QuotedStr(NISASS) + ' DCPSS, ' + QuotedStr(NISAANOMES) + ' DCPANOMES, ' +
         QuotedStr(NISAAATRI) + ' DCPAATRI, ' + QuotedStr(NISAAASEM) + ' DCPAASEM, ' + QuotedStr(NISAAASS) + ' DCPAASS, ' +
         QuotedStr(wTMonLoc) + ' TMONID,''N'' CNTCUADRE, E.CTADES, E.CTA_CCOS,H.CTA_CCOS CTA_CCOS2,C.CCOSID, G.CCOSDES, F.TDIARDES,' + quotedStr(cdsQry2.FieldByName('CIAID').AsString + cdsQry2.FieldByName('ALMID').AsString) +
         ' DCPLOTE,SUM(ROUND(A.KDXCNTG*A.ARTPCG,2)) TOTDEBE,0 TOTHABER, ' +
         '0 CPPRORORI, 0 CPPRORMOLOC, 0 CPPRORMOEXT,C.TDAID,C.NISAID,C.TINID,B.TRIABR,E.CTA_DOC,B.TRISGT, B.TRIID ' +
         ' FROM LOG315 A, TGE208 B, LOG314 C, TGE131 D, TGE202 E,TGE104 F,TGE203 G, TGE202 H ' +
         ' WHERE A.CIAID=' + QuotedStr(cdsQry2.FieldByName('CIAID').AsString) + ' AND A.KDXANOMM=' + QuotedStr(xAAMM) +
         ' AND C.ALMID=' + QuotedStr(cdsQry2.FieldByName('ALMID').AsString) + ' AND C.TDAID=' + QuotedStr(cdsQry2.FieldByName('TDAID').AsString) +
         ' AND C.TINID=' + QuotedStr(cdsQry2.FieldByName('TINID').AsString) + ' AND C.NISAID=' + QuotedStr(cdsQry2.FieldByName('NISAID').AsString) +
         ' AND A.TRIID=B.TRIID AND A.TDAID=B.TDAID AND B.TRIASIEN=''S'' ' +
         ' AND A.CIAID=C.CIAID AND A.LOCID=C.LOCID AND A.TINID=C.TINID AND A.ALMID=C.ALMID AND A.NISAID=C.NISAID AND A.NISATIP=C.NISATIP AND A.TDAID=C.TDAID AND A.TRIID=C.TRIID ' +
         ' AND A.CIAID=D.CIAID AND A.TINID=D.TINID AND A.GRARID=D.GRARID ' +
         ' AND A.CIAID=E.CIAID AND D.CUENTAID=E.CUENTAID(+) ' +
         ' AND F.TDIARID=' + QuotedStr(xTDia) + ' AND A.CCOSID=G.CCOSID(+) ' + //AND G.CCOSCIAS LIKE '+QuotedStr('%'+xCia+'%')+
         ' AND A.CIAID=H.CIAID AND B.CTAHABER=H.CUENTAID(+) ' +
         ' GROUP BY B.CTAHABER,D.CUENTAID,E.CTADES,H.CTADES,H.CTA_CCOS,E.CTA_CCOS,C.CCOSID,G.CCOSDES,F.TDIARDES,C.TDAID,C.NISAID,C.TINID,B.TRIABR,E.CTA_DOC,B.TRISGT, B.TRIID ';
   End;
   cdsDetCxPx := TwwClientDataSet.Create(Self);
   cdsDetCxPx.RemoteServer := DCOM1;
   cdsDetCxPx.ProviderName := 'dspUltTGE';
   cdsDetCxPx.Close;
   cdsDetCxPx.DataRequest(xSQL);
   cdsDetCxPx.Open;
  {
  if ( cdsDetCxPx.FieldByname('CIADEST').AsString='04' ) or
     ( cdsDetCxPx.FieldByname('CIADEST').AsString='05' ) or
     ( cdsDetCxPx.FieldByname('CIADEST').AsString='07' ) or
     ( cdsDetCxPx.FieldByname('CIADEST').AsString='08' ) or
     ( cdsDetCxPx.FieldByname('CIADEST').AsString='10' ) or
     ( cdsDetCxPx.FieldByname('CIADEST').AsString='15' ) or
     ( cdsDetCxPx.FieldByname('CIADEST').AsString='18' ) THEN
     ShowMessage( cdsDetCxPx.FieldByname('NISAID').AsString);
  }
   cdsDetCxPx.First;
   cdsDetCxPx.DisableControls;
   While Not cdsDetCxPx.Eof Do
   Begin
      cdsDetCxPx.Edit;

      If cdsDetCxPx.FieldByName('TRISGT').AsString = 'S' Then
      Begin
         If cdsDetCxPx.FieldByName('DCPDH').AsString = 'H' Then
         Begin
            cdsDetCxPx.FieldByName('DCPMOORI').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat, 15, 2);
            cdsDetCxPx.FieldByName('DCPMOLOC').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat, 15, 2);
            cdsDetCxPx.FieldByName('DCPMOEXT').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat, 15, 2);

            cdsDetCxPx.FieldByName('CPPRORORI').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat, 15, 2);
            cdsDetCxPx.FieldByName('CPPRORMOLOC').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat, 15, 2);
            cdsDetCxPx.FieldByName('CPPRORMOEXT').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat, 15, 2);
         End
         Else
            If cdsDetCxPx.FieldByName('DCPDH').AsString = 'D' Then
            Begin
               cdsDetCxPx.FieldByName('DCPMOORI').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat, 15, 2);
               cdsDetCxPx.FieldByName('DCPMOLOC').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat, 15, 2);
               cdsDetCxPx.FieldByName('DCPMOEXT').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat, 15, 2);

               cdsDetCxPx.FieldByName('CPPRORORI').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat, 15, 2);
               cdsDetCxPx.FieldByName('CPPRORMOLOC').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat, 15, 2);
               cdsDetCxPx.FieldByName('CPPRORMOEXT').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat, 15, 2);
            End;
      End;

      If cdsDetCxPx.FieldByName('TRISGT').AsString = 'I' Then
      Begin
         If cdsDetCxPx.FieldByName('DCPDH').AsString = 'D' Then
         Begin
            cdsDetCxPx.FieldByName('DCPMOORI').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat, 15, 2);
            cdsDetCxPx.FieldByName('DCPMOLOC').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat, 15, 2);
            cdsDetCxPx.FieldByName('DCPMOEXT').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat, 15, 2);

            cdsDetCxPx.FieldByName('CPPRORORI').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat, 15, 2);
            cdsDetCxPx.FieldByName('CPPRORMOLOC').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat, 15, 2);
            cdsDetCxPx.FieldByName('CPPRORMOEXT').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTHABER').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat, 15, 2);
            cdsDetCxPx.FieldByName('DCPDH').AsString := 'H';
         End
         Else
            If cdsDetCxPx.FieldByName('DCPDH').AsString = 'H' Then
            Begin
               cdsDetCxPx.FieldByName('DCPMOORI').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat, 15, 2);
               cdsDetCxPx.FieldByName('DCPMOLOC').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat, 15, 2);
               cdsDetCxPx.FieldByName('DCPMOEXT').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat, 15, 2);

               cdsDetCxPx.FieldByName('CPPRORORI').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat, 15, 2);
               cdsDetCxPx.FieldByName('CPPRORMOLOC').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat, 15, 2);
               cdsDetCxPx.FieldByName('CPPRORMOEXT').AsFloat := FRound(cdsDetCxPx.FieldByName('TOTDEBE').AsFloat / cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat, 15, 2);
               cdsDetCxPx.FieldByName('DCPDH').AsString := 'D';
            End;
      End;

      cdsDetCxPx.Post;
      cdsDetCxPx.Next;
   End;
   cdsDetCxPx.First;
   cdsDetCxPx.EnableControls;

   If (xTipoC = 'C') Or (xTipoC = 'P') Or (xTipoC = 'BP') Then
      Filtracds(cdsMovCNT, 'SELECT * FROM CNT311 ' +
         'WHERE CIAID=' + QuotedStr(xCia) + ' ' +
         ' AND TDIARID=' + QuotedStr(xTDia) + ' ' +
         ' AND CNTANOMM=' + QuotedStr(xPerCNT) + ' ' +
         ' AND CNTCOMPROB=' + QuotedStr(xNoComp));

   If xTipoC = 'B' Then
      Filtracds(cdsMovCNT, 'SELECT * FROM CNT301 WHERE ' +
         'CIAID=' + '''' + xCia + '''' + ' AND ' +
         'TDIARID=' + '''' + xTDia + '''' + ' AND ' +
         'CNTANOMM=' + '''' + xPerCNT + '''');
   xTOTMG := 0;
   xTOTTO := 0;

   xSQLCta := 'Select Cuentaid, CTA_CCOS from TGE202 '
      + 'WHERE CIAID=''' + cdsDetCxPx.FieldByName('CIAID').AsString + '''';
   cdsQry4.Close;
   cdsQry4.DataRequest(xSQLCta);
   cdsQry4.Open;
   cdsQry4.IndexFieldNames := 'CUENTAID';

   xContR := 0;
   cdsDetCxPx.First;
   While Not cdsDetCxPx.EOF Do
   Begin
      cdsMovCNT.Insert;
      cdsMovCNT.FieldByName('CIAID').AsString := cdsDetCxPx.FieldByName('CIAID').AsString;
      cdsMovCNT.FieldByName('TDIARID').AsString := cdsDetCxPx.FieldByName('TDIARID').AsString;
      cdsMovCNT.FieldByName('CNTANOMM').AsString := xPerCNT;
      cdsMovCNT.FieldByName('CNTCOMPROB').AsString := cdsDetCxPx.FieldByName('CPNOREG').AsString;

      If cdsDetCxPx.FieldByName('CIAID').AsString = '05' Then
         cdsMovCNT.FieldByName('CUENTAID').AsString := cdsDetCxPx.FieldByName('CUENTAID').AsString;

      If cdsDetCxPx.FieldByName('CIADEST').AsString = 'XX' Then
      Begin
         If xxAuto = 'S' Then
         Begin
            cdsMovCNT.FieldByName('CNTGLOSA').AsString := Trim(cdsDetCxPx.FieldByName('DCPGLOSA').AsString);

            If (cdsDetCxPx.FieldByName('DCPDH').AsString = 'D') And
               (cdsMovCNT.FieldByName('CIAID').AsString = '05') Then
               cdsMovCNT.FieldByName('CUENTAID').AsString := cdsDetCxPx.FieldByName('CUENTAID').AsString
            Else
               cdsMovCNT.FieldByName('CUENTAID').AsString := cdsDetCxPx.FieldByName('CUENTAID').AsString;
            cdsQry4.SetKey;
            cdsQry4.FieldByName('CUENTAID').AsString := cdsDetCxPx.FieldByName('CUENTAID').AsString;
            cdsQry4.GotoKey;
         End
         Else
         Begin
            cdsMovCNT.FieldByName('CNTGLOSA').AsString := Trim(cdsDetCxPx.FieldByName('DCPGLOSA').AsString);
            If cdsDetCxPx.FieldByName('DCPDH').AsString = 'D' Then
               cdsMovCNT.FieldByName('CUENTAID').AsString := cdsDetCxPx.FieldByName('CUENTAID').AsString
            Else
            Begin
               If Copy(cdsDetCxPx.FieldByName('CUENTAID2').AsString, 1, 1) = '3' Then
                  cdsMovCNT.FieldByName('CUENTAID').AsString := cdsDetCxPx.FieldByName('CUENTAID').AsString
               Else
                  cdsMovCNT.FieldByName('CUENTAID').AsString := cdsDetCxPx.FieldByName('CUENTAID2').AsString;
            End;
            cdsQry4.SetKey;
            cdsQry4.FieldByName('CUENTAID').AsString := cdsDetCxPx.FieldByName('CUENTAID').AsString;
            cdsQry4.GotoKey;
         End;
      End
      Else
      Begin
         cdsMovCNT.FieldByName('CNTGLOSA').AsString := Trim(cdsDetCxPx.FieldByName('DCPGLOSA2').AsString);
         cdsMovCNT.FieldByName('CUENTAID').AsString := cdsDetCxPx.FieldByName('CUENTAID2').AsString;
         cdsQry4.SetKey;
         cdsQry4.FieldByName('CUENTAID').AsString := cdsDetCxPx.FieldByName('CUENTAID2').AsString;
         cdsQry4.GotoKey;
      End;

      If cdsQry4.FieldByName('CTA_CCOS').AsString = 'S' Then
      Begin
         cdsMovCNT.FieldByName('CCOSID').AsString := cdsDetCxPx.FieldByName('CCOSID').AsString;
         cdsMovCNT.FieldByName('CCOSDES').AsString := cdsDetCxPx.FieldByName('CCOSDES').AsString;
      End;

      cdsMovCNT.FieldByName('AUXDES').AsString := cdsDetCxPx.FieldByName('TRIABR').AsString;
      If cdsDetCxPx.FieldByName('CTA_DOC').AsString = 'S' Then
      Begin
         cdsMovCNT.FieldByName('DOCID').AsString := cdsDetCxPx.FieldByName('TDAID').AsString;
         cdsMovCNT.FieldByName('CNTSERIE').AsString := cdsDetCxPx.FieldByName('TINID').AsString;
         cdsMovCNT.FieldByName('CNTNODOC').AsString := cdsDetCxPx.FieldByName('NISAID').AsString;
         cdsMovCNT.FieldByName('DOCDES').AsString := cdsDetCxPx.FieldByName('TRIABR').AsString;
      End;
      cdsMovCNT.FieldByName('CNTMODDOC').AsString := cdsDetCxPx.FieldByName('MODULO').AsString;
      cdsMovCNT.FieldByName('CNTDH').AsString := cdsDetCxPx.FieldByName('DCPDH').AsString;

      cdsMovCNT.FieldByName('CNTTCAMBIO').AsString := cdsDetCxPx.FieldByName('CPTCAMPR').AsString;

      cdsMovCNT.FieldByName('CNTMTOORI').AsFloat := FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat, 15, 2);
      cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat := FRound(cdsDetCxPx.FieldByName('DCPMOLOC').AsFloat, 15, 2);
      cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat := FRound(cdsDetCxPx.FieldByName('DCPMOEXT').AsFloat, 15, 2);

      cdsMovCNT.FieldByName('CNTFEMIS').AsDateTime := cdsDetCxPx.FieldByName('CPFEMIS').AsDateTime;
      cdsMovCNT.FieldByName('CNTFVCMTO').AsDateTime := cdsDetCxPx.FieldByName('CPFVCMTO').AsDateTime;
      cdsMovCNT.FieldByName('CNTFCOMP').AsDateTime := cdsDetCxPx.FieldByName('DCPFCOM').AsdateTime;
      cdsMovCNT.FieldByName('CNTESTADO').AsString := cdsDetCxPx.FieldByName('DCPESTDO').AsString;
      cdsMovCNT.FieldByName('CNTUSER').AsString := wUsuario;
      cdsMovCNT.FieldByName('CNTFREG').AsDateTime := cdsDetCxPx.FieldByName('FECHA').AsDateTime;
      cdsMovCNT.FieldByName('CNTHREG').AsDateTime := cdsDetCxPx.FieldByName('HORA').AsDateTime;
      cdsMovCNT.FieldByName('CNTMM').AsString := cdsDetCxPx.FieldByName('DCPMM').AsString;
      cdsMovCNT.FieldByName('CNTDD').AsString := cdsDetCxPx.FieldByName('DCPDD').AsString;
      cdsMovCNT.FieldByName('CNTTRI').AsString := cdsDetCxPx.FieldByName('DCPTRI').AsString;
      cdsMovCNT.FieldByName('CNTSEM').AsString := cdsDetCxPx.FieldByName('DCPSEM').AsString;
      cdsMovCNT.FieldByName('CNTANO').AsString := cdsDetCxPx.FieldByName('DCPANOC').AsString;
      cdsMovCNT.FieldByName('CNTSS').AsString := cdsDetCxPx.FieldByName('DCPSS').AsString;
      cdsMovCNT.FieldByName('CNTAATRI').AsString := cdsDetCxPx.FieldByName('DCPAATRI').AsString;
      cdsMovCNT.FieldByName('CNTAASEM').AsString := cdsDetCxPx.FieldByName('DCPAASEM').AsString;
      cdsMovCNT.FieldByName('CNTAASS').AsString := cdsDetCxPx.FieldByName('DCPAASS').AsString;
      cdsMovCNT.FieldByName('TMONID').AsString := cdsDetCxPx.FieldByName('TMONID').AsString;
      cdsMovCNT.FieldByName('CNTCUADRE').AsString := cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
      cdsMovCNT.FieldByName('CTADES').AsString := cdsDetCxPx.FieldByName('CTADES').AsString;
      cdsMovCNT.FieldByName('TDIARDES').AsString := cdsDetCxPx.FieldByName('TDIARDES').AsString;
      cdsMovCNT.FieldByName('CNTLOTE').AsString := cdsDetCxPx.FieldByName('DCPLOTE').AsString;

      If cdsDetCxPx.FieldByName('DCPDH').AsString = 'D' Then
      Begin
         cdsMovCNT.FieldByName('CNTDEBEMN').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTDEBEME').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTHABEMN').AsFloat := 0;
         cdsMovCNT.FieldByName('CNTHABEME').AsFloat := 0;
      End;

      If cdsDetCxPx.FieldByName('DCPDH').AsString = 'H' Then
      Begin
         cdsMovCNT.FieldByName('CNTHABEMN').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTHABEME').AsFloat := FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat, 15, 2);
         cdsMovCNT.FieldByName('CNTDEBEMN').AsFloat := 0;
         cdsMovCNT.FieldByName('CNTDEBEME').AsFloat := 0;
      End;
      xContR := xContR + 1;
      cdsMovCNT.FieldByName('CNTREG').AsFloat := xContR;

      cdsMovCNT.FieldByName('MODULO').AsString := wModulo;
      cdsPost(cdsMovCNT);

      cdsDetCxPx.Next;
   End;
   AplicaDatos(cdsMovCNT, 'MOVCNT');

   cdsQry4.IndexFieldNames := '';

   sCiaDes := cdsDetCxPx.FieldByName('CIADEST').AsString;
   cdsDetCxPx.Free;
   If (sCiaDes <> 'XX') And (length(trim(sCiaDes)) > 0) Then
   Begin
      Transferencia_CXP_a_CNT_Almacen(sCiaDes, xTDia, xAAMM, cdsMovCNT.FieldByName('CNTCOMPROB').AsString, xPerCNT, 'P', 'S');
   End;
End;

Procedure TDMALM.ActualizaLOG336(sCIA, sLOC, sTIN, sArt, Ano, Mes,
   IngSal: String; fMonto: double);
Var
   sSQL: String;
   sNexMes: String;
   iMes: integer;
   xMontoDelAnnoPasado: double;
Begin
   cdsSTKMto.SetKey;
   cdsSTKMto.fieldbyname('STKANO').AsString := ANO;
   cdsSTKMto.fieldbyname('CIAID').AsString := sCIA;
   cdsSTKMto.fieldbyname('LOCID').AsString := sLOC;
   cdsSTKMto.fieldbyname('TINID').AsString := sTIN;
   cdsSTKMto.fieldbyname('ARTID').AsString := sART;
   If Not cdsSTKMto.Gotokey Then
   Begin
      sSQL := 'CIAID=' + QuotedStr(sCIA) + ' AND LOCID=' + QuotedStr(sLOC) + ' AND ' +
         'TINID=' + QuotedStr(sTIN) + ' AND ARTID=' + QuotedStr(sART) +
         ' AND STKANO=' + QuotedStr(InttoStr(StrtoInt(ANO) - 1));
      displaydescrip('prvTGE', 'LOG336', 'CIAID, LOCID, TINID, ' +
         'STKMSACTG,STKTMG12, STKIMG12, STKSMG12', sSQL, 'STKMACTG');
      If cdsQry.RecordCount > 0 Then
      Begin
         xMontoDelAnnoPasado := FRound(cdsQry.FieldByName('STKTMG12').AsFloat + cdsQry.FieldByName('STKIMG12').AsFloat - cdsQry.FieldByName('STKSMG12').AsFloat, 15, 4);
      End
      Else
      Begin
         xMontoDelAnnoPasado := 0;
      End;
     //INSERTAR EL REGISTRO EN EL LOG336 PORQUE NO LO ENCONTRO
      cdsSTKMto.Insert;
      cdsSTKMto.FieldbyName('CIAID').AsString := sCIA;
      cdsSTKMto.FieldbyName('LOCID').AsString := sLOC;
      cdsSTKMto.FieldbyName('TINID').AsString := sTIN;
      cdsSTKMto.FieldbyName('STKANO').AsString := Ano;
      cdsSTKMto.FieldbyName('ARTID').AsString := sART;

      cdsSTKMto.FieldByName('STKMANTG').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKMACTG').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('ARTDES').AsString := cdsArtiStk.FieldByName('ARTDES').AsString;

      cdsSTKMto.FieldbyName('GRARID').AsString := cdsArtiStk.FieldbyName('GRARID').AsString;

      cdsSTKMto.FieldByName('STKTMG01').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG01').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG01').AsFloat := 0;
      cdsSTKMto.FieldByName('STKTMG02').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG02').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG02').AsFloat := 0;
      cdsSTKMto.FieldByName('STKTMG03').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG03').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG03').AsFloat := 0;
      cdsSTKMto.FieldByName('STKTMG04').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG04').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG04').AsFloat := 0;
      cdsSTKMto.FieldByName('STKTMG05').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG05').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG05').AsFloat := 0;
      cdsSTKMto.FieldByName('STKTMG06').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG06').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG06').AsFloat := 0;
      cdsSTKMto.FieldByName('STKTMG07').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG07').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG07').AsFloat := 0;
      cdsSTKMto.FieldByName('STKTMG08').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG08').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG08').AsFloat := 0;
      cdsSTKMto.FieldByName('STKTMG09').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG09').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG09').AsFloat := 0;
      cdsSTKMto.FieldByName('STKTMG10').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG10').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG10').AsFloat := 0;
      cdsSTKMto.FieldByName('STKTMG11').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG11').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG11').AsFloat := 0;
      cdsSTKMto.FieldByName('STKTMG12').AsFloat := xMontoDelAnnoPasado;
      cdsSTKMto.FieldByName('STKIMG12').AsFloat := 0;
      cdsSTKMto.FieldByName('STKSMG12').AsFloat := 0;
      cdsSTKMto.Post;
   End;
   cdsSTKMto.Edit;
   If IngSal = 'I' Then
   Begin
      cdsSTKMto.FieldByName('STKIMG' + Mes).AsFloat := cdsSTKMto.FieldByName('STKIMG' + Mes).AsFloat + fMonto;
   End;
   If IngSal = 'S' Then
   Begin
      cdsSTKMto.FieldByName('STKSMG' + Mes).AsFloat := cdsSTKMto.FieldByName('STKSMG' + Mes).AsFloat + fMonto;
   End;
   iMes := StrToInt(Mes);
   While iMes < 12 Do
   Begin

      iMes := iMes + 1;
   End;

   cdsSTKMto.Post;

End;

Procedure TDMALM.DisminuyeForma(Sender: TObject);
Begin
End;

Function TDMALM.NombreMes(wwMes: integer): String;
Begin
   Case wwMes Of
      1: result := 'Enero';
      2: result := 'Febrero';
      3: result := 'Marzo';
      4: result := 'Abril';
      5: result := 'Mayo';
      6: result := 'Junio';
      7: result := 'Julio';
      8: result := 'Agosto';
      9: result := 'Setiembre';
      10: result := 'Octubre';
      11: result := 'Noviembre';
      12: result := 'Diciembre';
   End;
End;

Procedure TDMALM.ActualizaFiltro(wwFiltro: TMant; wwCdsLee: TwwClientDataSet;
   wwAccion: String);
Var
   i: integer;
Begin
// wFiltro : Es el Filtro que va a actualizar
// wCDsLee : Es el cds que contiene la información a actualizar
// wAccion : 'A' = Adición/Inserción/Nuevo Item
//           'M' = Actualización del Registro
//           'E' = Eliminación del Registro

   If wwAccion = 'E' Then
   Begin
      wwFiltro.FMant.cds2.Delete;
   End;

   If wwAccion = 'A' Then
   Begin
      wwFiltro.FMant.cds2.Append;
   End;

   If wwAccion = 'M' Then
   Begin
      wwFiltro.FMant.cds2.Edit;
   End;

   If (wwAccion = 'A') Or (wwAccion = 'M') Then
   Begin
      For i := 0 To wwCdsLee.FieldCount - 1 Do
      Begin
         wwFiltro.FMant.cds2.FieldByName(wwCdsLee.Fields[i].FieldName).Value :=
            wwCdsLee.FieldByName(wwCdsLee.Fields[i].FieldName).Value;
      End;
      wwFiltro.FMant.cds2.Post;
   End;
End;

Procedure TDMALM.DataModuleCreate(Sender: TObject);
Var
   ssql, xWhere, xSQL2, wIgv: String;
   inifile: TIniFile;
   D, M, Y: WORD;
Begin
   Screen.Cursor := crHourGlass;
   DCOM1.Connected := False;

   If ParamStr(1) = '' Then
   Begin
      inifile := TIniFile.Create(ExtractFilePath(application.ExeName) + '\oaCfg.ini');
      DCOM1.Address := IniFile.ReadString('TCPIP', 'ADDRESS', '');
      wSRV := IniFile.ReadString('MOTOR', 'NAME', '');
   End;

   Try
      DCOM1.Connected := true;
   Except
     // por no realizar la conexion
      SHOWMESSAGE('ERROR de Conexión.');
      Exit;
   End;

   Try
      cIP := DMALM.ObtenerIpdeNetbios(DMALM.computerName);
   Except
      ShowMessage('ERROR de Conexión.');
      DCOM1.Connected := False;
      Exit;
   End;

   decodedate(Date, Y, M, D);
   FCtrlAcceso := TFCtrlAcceso.Create(Application);
   wModulo := 'ALM';
   FCtrlAcceso.wDCOM1 := DCOM1;
   Screen.Cursor := crHourGlass;

   FCtrlAcceso.ShowModal;

   If FCtrlAcceso.cAccesoSistema = 'S' Then
   Begin
      wUsuario := FCtrlAcceso.dbeUsuario.Text;
      FCtrlAcceso.free;
   End
   Else
   Begin
      DCOM1.Connected := False;
      FCtrlAcceso.free;
      sClose := '1';
      Exit;
   End;

   If Not AccesosModulo Then
   Begin
      DCOM1.Connected := False;
      Screen.Cursor := CrDefault;
      Exit;
   End
   Else
   Begin

         xSQL2 := 'Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, B.OBJETO, B.FORMA, C.GRUPOADM '
            + 'From TGE007 A, TGE001 B, TGE003 C '
            + 'WHERE A.USERID=''' + wUsuario + ''' '
            + 'AND A.GRUPOID=B.GRUPOID(+) and B.MODULOID=''' + wModulo + ''''
            + 'AND A.GRUPOID=C.GRUPOID(+)';
      cdsUsuarios.Close;
      cdsUsuarios.DataRequest(xSQL2);
      cdsUsuarios.Open;

      wGrupo := cdsUsuarios.FieldByName('GRUPOID').AsString;

      cdsMGrupo.Open;
      cdsGrupos.Open;
      xSQL2 := 'Select * from TGE004 '
         + 'where MODULOID=' + quotedstr(wModulo)
         + '  and USERID=' + quotedstr(wUsuario);
      cdsAcceso.Close;
      cdsAcceso.DataRequest(xSQL2);
      cdsAcceso.Open;

      wAnchoSal := 8;
      wAnchoIng := 8;
      xReserva := 0;

      DisplayDescrip('prvTGE', 'oaCONFIG_ANT', '*', '', 'SRV_DB');
      SRV_E := cdsqry.fieldbyname('SRV_EQUIP').AsString;
      SRV_D := cdsqry.fieldbyname('SRV_DB').AsString;
      SRV_V := cdsqry.fieldbyname('SRV_VERS').AsString;
      wAnchoArt := cdsqry.fieldbyname('NDIG_ARTIC').AsInteger;
      wAnchoPro := cdsqry.fieldbyname('NDIG_PROV').AsInteger;
      wRptCia := cdsqry.fieldbyname('RPTCIA').AsString;
      wUrqCia := cdsQry.FieldByName('URQCIA').AsString;
      wIgv := cdsqry.fieldbyname('NISA_IGV').AsString;
      wCTRL_PCG := cdsqry.fieldbyname('CTRL_PCG').AsString;
      wConsumo := cdsqry.fieldbyname('RQSCONSUMO').AsInteger;

      If cdsQry.fieldbyname('SRV_PRESU').AsString = 'S' Then
         wActuaPresu := true
      Else
         wActuaPresu := false;

      DisplayDescrip('prvTGE', 'OAREGLAS', '*', 'VRN_MODULO=''ALM''', 'VRN_MODULO');
      wReg_Porc := cdsqry.fieldbyname('VRN_PORCAD').AsString;
      wFil_Ccos := cdsQry.FieldByName('VRN_CCOSCIA').AsString;
      wKDXSerie := cdsQry.FieldByName('VRN_FLAGNSERIE').AsString;
      wLote := cdsQry.FieldByName('VRN_LOTE').AsString;
      wTipoCambioUsar := cdsQry.FieldByName('VRN_TCAM').AsString;

      wRutaRpt := 'RTMS\ALMSG\' + wRptCia;

  // ****************************************************************************************************
  // Configuración Minima

      If Length(Trim(FloattoStr(Y))) <> 4 Then
      Begin
         ErrorMsg('Error', 'Configure el Formato de Fecha de Windows, en el Panel de Control');
         Application.Terminate;
         Exit;
      End;

      If (Trim(wIgv) <> 'S') And (Trim(wIgv) <> 'N') Then
      Begin
         ErrorMsg('Error', 'Faltan Datos en el File oaConfig, Usted no Puede Continuar');
         Application.Terminate;
         Exit;
      End;

      If Length(Trim(wRptCia)) = 0 Then // Incoresa, Dema, JCP, Mibco
      Begin
         ErrorMsg('Error', 'Falta Completar Data en oaCONFIG');
         Application.Terminate;
         Exit;
      End;

  // Configuración Minima
  // ****************************************************************************************************

      cdsUsuarios.Open;
      cdsMGrupo.Open;
      cdsGrupos.Open;
      cdsAcceso.Open;

   // Inicio HPC_201604_ALM
   // inicializa variable para controlar accesos del grupo del perfil de usuario
      wAdmin := cdsUsuarios.fieldbyname('GrupoAdm').AsString;
   // Fin HPC_201604_ALM

      wMonedaNac := DisplayDescrip('prvTGE', 'TGE103', 'TMONID', 'TMON_LOC=' + quotedStr('L'), 'TMONID');
      wMonedaExt := DisplayDescrip('prvTGE', 'TGE103', 'TMONID', 'TMON_LOC=' + quotedStr('E'), 'TMONID');

      If wIgv = 'N' Then
         wCredFiscal := False
      Else
         If wIgv = 'S' Then
            wCredFiscal := True;

      wFormatFecha := 'DD-MM-YYYY';
      wReplacCeros := 'NVL';
      wRepFecServi := 'SYSDATE';
      wRepHorServi := 'SYSDATE';
      wRepFuncDate := 'TO_DATE(';
      wRepFuncChar := 'TO_CHAR(';
      wRepTimeServi := 'CURRENT TIME';

      sSQL := 'TMon_Loc=' + '''' + 'E' + '''';
      wTMonExt := displaydescrip('prvSQL', 'TGE103', 'TMonId', sSQL, 'TMonId');
      sSQL := 'TMon_Loc=' + '''' + 'L' + '''';
      wTMonLoc := displaydescrip('prvSQL', 'TGE103', 'TMonId', sSQL, 'TMonId');
   End;

   sSQL := 'select * from TGE110 WHERE REFALM=''S''';
   cdsTDOC.DataRequest(sSQL);

End;

Procedure TDMALM.RecalculaSaldosAlmacen(cCia, cAno: String);
Var
   xSQL, xSQL1, xSQL2, cWhereAlmA, cWhereAlmC: String;
Begin

   cWhereAlmA := '';
   cWhereAlmC := '';
   If cCia = '04' Then
   Begin
      cWhereAlmA := ' and not a.almid in (''12'',''13'') ';
      cWhereAlmC := ' and not c.almid in (''12'',''13'') ';
   End;

 // vhndema - Buscar Articulos con Stock Descuadrado
   xSQL1 := 'SELECT C.CIAID, C.ARTID, C.TINID, C.ALMID, MAX(nvl(C.STKSACTG,0)) SALDO_ACTUAL, MAX( NVL(C.STKTSG01,0) ) SIN, SUM( NVL(ING,0) ) ING, '
      + 'SUM( NVL(SAL,0)) SAL, MAX( NVL(C.STKTSG01,0) )+SUM( NVL(MOV,0) ) SACT, '
      + 'MAX( NVL(C.STKTSG01,0)) SI01, '
      + 'SUM( NVL(I01,0) ) I01, SUM( NVL(S01,0) ) S01, '
      + 'MAX( NVL(STKTSG01,0) ) + SUM( NVL(I01,0) ) - SUM( NVL(S01,0) ) SI02, '
      + 'SUM( NVL(I02,0) ) I02, SUM( NVL(S02,0) ) S02, '
      + 'MAX( NVL(STKTSG01,0) ) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) SI03, '
      + 'SUM(NVL(I03,0)) I03, SUM(NVL(S03,0)) S03, '
      + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) SI04, '
      + 'SUM(NVL(I04,0)) I04, SUM(NVL(S04,0)) S04, '
      + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) SI05, '
      + 'SUM(NVL(I05,0)) I05, SUM(NVL(S05,0)) S05, '
      + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) SI06, '
      + 'SUM(NVL(I06,0)) I06, SUM(NVL(S06,0)) S06, '
      + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
      + ' + SUM(NVL(I06,0))-SUM( NVL(S06,0) ) SI07, '
      + 'SUM(NVL(I07,0)) I07, SUM(NVL(S07,0)) S07, '
      + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
      + ' + SUM(NVL(I06,0))-SUM(NVL(S06,0)) + SUM(NVL(I07,0))-SUM(NVL(S07,0)) SI08, '
      + 'SUM(NVL(I08,0)) I08, SUM(NVL(S08,0)) S08, '
      + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
      + ' + SUM(NVL(I06,0))-SUM(NVL(S06,0)) + SUM(NVL(I07,0))-SUM(NVL(S07,0)) + SUM(NVL(I08,0))-SUM(NVL(S08,0)) SI09, '
      + 'SUM(NVL(I09,0)) I09, SUM(NVL(S09,0)) S09, '
      + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
      + ' + SUM(NVL(I06,0))-SUM(NVL(S06,0)) + SUM(NVL(I07,0))-SUM(NVL(S07,0)) + SUM(NVL(I08,0))-SUM(NVL(S08,0)) + SUM(NVL(I09,0))-SUM(NVL(S09,0)) SI10, '
      + 'SUM(NVL(I10,0)) I10, SUM(NVL(S10,0)) S10, '
      + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
      + ' + SUM(NVL(I06,0))-SUM(NVL(S06,0)) + SUM(NVL(I07,0))-SUM(NVL(S07,0)) + SUM(NVL(I08,0))-SUM(NVL(S08,0)) + SUM(NVL(I09,0))-SUM(NVL(S09,0)) + SUM(NVL(I10,0))-SUM(NVL(S10,0)) SI11, '
      + 'SUM(NVL(I11,0)) I11, SUM(NVL(S11,0)) S11, '
      + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
      + ' + SUM(NVL(I06,0))-SUM(NVL(S06,0)) + SUM(NVL(I07,0))-SUM(NVL(S07,0)) + SUM(NVL(I08,0))-SUM(NVL(S08,0)) + SUM(NVL(I09,0))-SUM(NVL(S09,0)) + SUM(NVL(I10,0))-SUM(NVL(S10,0)) '
      + ' + SUM(NVL(I11,0))-SUM(NVL(S11,0)) SI12, '
      + 'SUM(NVL(I12,0)) I12, SUM(NVL(S12,0)) S12, '
      + 'MAX(NVL(STKTSG01,0)) + '
      + 'SUM(NVL(I01,0)) - SUM(NVL(S01,0)) + SUM(NVL(I02,0)) - SUM(NVL(S02,0)) + SUM(NVL(I03,0)) - SUM(NVL(S03,0)) + SUM(NVL(I04,0)) - SUM(NVL(S04,0)) + '
      + 'SUM(NVL(I05,0)) - SUM(NVL(S05,0)) + SUM(NVL(I06,0)) - SUM(NVL(S06,0)) + SUM(NVL(I07,0)) - SUM(NVL(S07,0)) + SUM(NVL(I08,0)) - SUM(NVL(S08,0)) + '
      + 'SUM(NVL(I09,0)) - SUM(NVL(S09,0)) + SUM(NVL(I10,0)) - SUM(NVL(S10,0)) + SUM(NVL(I11,0)) - SUM(NVL(S11,0)) + SUM(NVL(I12,0)) - SUM(NVL(S12,0)) SALDO '
      + 'FROM LOG316 C, ( ';

   xSQL2 := 'Select A.CIAID, A.ARTDES, A.TINID, A.ALMID, A.NISATIP, A.NISAFREG, A.NISAID, ARTID, KDXCNTG, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' THEN KDXCNTG ELSE (-1)*KDXCNTG END MOV, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' THEN KDXCNTG ELSE 0 END ING, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  THEN KDXCNTG ELSE 0 END SAL, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''01'' THEN KDXCNTG ELSE 0 END I01, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''01'' THEN KDXCNTG ELSE 0 END S01, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''02'' THEN KDXCNTG ELSE 0 END I02, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''02'' THEN KDXCNTG ELSE 0 END S02, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''03'' THEN KDXCNTG ELSE 0 END I03, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''03'' THEN KDXCNTG ELSE 0 END S03, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''04'' THEN KDXCNTG ELSE 0 END I04, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''04'' THEN KDXCNTG ELSE 0 END S04, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''05'' THEN KDXCNTG ELSE 0 END I05, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''05'' THEN KDXCNTG ELSE 0 END S05, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''06'' THEN KDXCNTG ELSE 0 END I06, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''06'' THEN KDXCNTG ELSE 0 END S06, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''07'' THEN KDXCNTG ELSE 0 END I07, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''07'' THEN KDXCNTG ELSE 0 END S07, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''08'' THEN KDXCNTG ELSE 0 END I08, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''08'' THEN KDXCNTG ELSE 0 END S08, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''09'' THEN KDXCNTG ELSE 0 END I09, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''09'' THEN KDXCNTG ELSE 0 END S09, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''10'' THEN KDXCNTG ELSE 0 END I10, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''10'' THEN KDXCNTG ELSE 0 END S10, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''11'' THEN KDXCNTG ELSE 0 END I11, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''11'' THEN KDXCNTG ELSE 0 END S11, '
      + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''12'' THEN KDXCNTG ELSE 0 END I12, '
      + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''12'' THEN KDXCNTG ELSE 0 END S12  '
      + 'From log315 A, log314 b '
      + 'Where a.ciaid=''' + cCia + ''' ' + cWhereAlmA
      + 'and a.nissit=''ACEPTADO'' '
      + 'and a.ciaid=b.ciaid and a.tinid=b.tinid and a.almid=b.almid and a.nisatip=b.nisatip '
      + 'and a.tdaid=b.tdaid and a.nisaid=b.nisaid '
      + 'and b.nissit=''ACEPTADO'' '
      + 'and b.nisafreg>=''01/01/' + cAno + ''' and b.nisafreg<=''31/12/' + cAno + ''''
      + 'ORDER BY A.ARTID, A.NISAFREG, A.KDXHREG '
      + ' ) A '
      + 'WHERE C.stkano=''' + cAno + ''' '
      + 'and C.ciaid=''' + cCia + ''' ' + cWhereAlmC
      + 'and a.ciaid(+)=c.ciaid and a.tinid(+)=c.tinid and a.almid(+)=c.almid and a.artid(+)=c.artid  '
      + 'GROUP BY C.CIAID, C.ARTID, C.TINID, C.ALMID '
      + 'HAVING MAX(nvl(C.STKSACTG,0))<>MAX(nvl(C.STKTSG01,0))+SUM(nvl(MOV,0))';
   xSQL := xSQL1 + xSQL2;
   cdsStockErr.Close;
   cdsStockErr.DataRequest(xSQL);
   cdsStockErr.Open;

 // vhndema - Recalcular Stock de Articulos descuadrados
   cdsStockErr.First;
   While Not cdsStockErr.Eof Do
   Begin

      xSQL1 := 'SELECT C.CIAID, C.ARTID, C.TINID, C.ALMID, MAX( NVL(C.STKTSG01,0) ) SIN, SUM( NVL(ING,0) ) ING, '
         + 'SUM( NVL(SAL,0)) SAL, MAX( NVL(C.STKTSG01,0) )+SUM( NVL(MOV,0) ) SACT, '
         + 'MAX( NVL(C.STKTSG01,0)) SI01, '
         + 'SUM( NVL(I01,0) ) I01, SUM( NVL(S01,0) ) S01, '
         + 'MAX( NVL(STKTSG01,0) ) + SUM( NVL(I01,0) ) - SUM( NVL(S01,0) ) SI02, '
         + 'SUM( NVL(I02,0) ) I02, SUM( NVL(S02,0) ) S02, '
         + 'MAX( NVL(STKTSG01,0) ) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) SI03, '
         + 'SUM(NVL(I03,0)) I03, SUM(NVL(S03,0)) S03, '
         + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) SI04, '
         + 'SUM(NVL(I04,0)) I04, SUM(NVL(S04,0)) S04, '
         + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) SI05, '
         + 'SUM(NVL(I05,0)) I05, SUM(NVL(S05,0)) S05, '
         + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) SI06, '
         + 'SUM(NVL(I06,0)) I06, SUM(NVL(S06,0)) S06, '
         + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
         + ' + SUM(NVL(I06,0))-SUM( NVL(S06,0) ) SI07, '
         + 'SUM(NVL(I07,0)) I07, SUM(NVL(S07,0)) S07, '
         + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
         + ' + SUM(NVL(I06,0))-SUM(NVL(S06,0)) + SUM(NVL(I07,0))-SUM(NVL(S07,0)) SI08, '
         + 'SUM(NVL(I08,0)) I08, SUM(NVL(S08,0)) S08, '
         + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
         + ' + SUM(NVL(I06,0))-SUM(NVL(S06,0)) + SUM(NVL(I07,0))-SUM(NVL(S07,0)) + SUM(NVL(I08,0))-SUM(NVL(S08,0)) SI09, '
         + 'SUM(NVL(I09,0)) I09, SUM(NVL(S09,0)) S09, '
         + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
         + ' + SUM(NVL(I06,0))-SUM(NVL(S06,0)) + SUM(NVL(I07,0))-SUM(NVL(S07,0)) + SUM(NVL(I08,0))-SUM(NVL(S08,0)) + SUM(NVL(I09,0))-SUM(NVL(S09,0)) SI10, '
         + 'SUM(NVL(I10,0)) I10, SUM(NVL(S10,0)) S10, '
         + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
         + ' + SUM(NVL(I06,0))-SUM(NVL(S06,0)) + SUM(NVL(I07,0))-SUM(NVL(S07,0)) + SUM(NVL(I08,0))-SUM(NVL(S08,0)) + SUM(NVL(I09,0))-SUM(NVL(S09,0)) + SUM(NVL(I10,0))-SUM(NVL(S10,0)) SI11, '
         + 'SUM(NVL(I11,0)) I11, SUM(NVL(S11,0)) S11, '
         + 'MAX(NVL(STKTSG01,0)) + SUM(NVL(I01,0))-SUM(NVL(S01,0)) + SUM(NVL(I02,0))-SUM(NVL(S02,0)) + SUM(NVL(I03,0))-SUM(NVL(S03,0)) + SUM(NVL(I04,0))-SUM(NVL(S04,0)) + SUM(NVL(I05,0))-SUM(NVL(S05,0)) '
         + ' + SUM(NVL(I06,0))-SUM(NVL(S06,0)) + SUM(NVL(I07,0))-SUM(NVL(S07,0)) + SUM(NVL(I08,0))-SUM(NVL(S08,0)) + SUM(NVL(I09,0))-SUM(NVL(S09,0)) + SUM(NVL(I10,0))-SUM(NVL(S10,0)) '
         + ' + SUM(NVL(I11,0))-SUM(NVL(S11,0)) SI12, '
         + 'SUM(NVL(I12,0)) I12, SUM(NVL(S12,0)) S12, '
         + 'MAX(NVL(STKTSG01,0)) + '
         + 'SUM(NVL(I01,0)) - SUM(NVL(S01,0)) + SUM(NVL(I02,0)) - SUM(NVL(S02,0)) + SUM(NVL(I03,0)) - SUM(NVL(S03,0)) + SUM(NVL(I04,0)) - SUM(NVL(S04,0)) + '
         + 'SUM(NVL(I05,0)) - SUM(NVL(S05,0)) + SUM(NVL(I06,0)) - SUM(NVL(S06,0)) + SUM(NVL(I07,0)) - SUM(NVL(S07,0)) + SUM(NVL(I08,0)) - SUM(NVL(S08,0)) + '
         + 'SUM(NVL(I09,0)) - SUM(NVL(S09,0)) + SUM(NVL(I10,0)) - SUM(NVL(S10,0)) + SUM(NVL(I11,0)) - SUM(NVL(S11,0)) + SUM(NVL(I12,0)) - SUM(NVL(S12,0)) SALDO '
         + 'FROM LOG316 C, ( ';

      xSQL2 := 'Select A.CIAID, A.ARTDES, A.TINID, A.ALMID, A.NISATIP, A.NISAFREG, A.NISAID, ARTID, KDXCNTG, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' THEN KDXCNTG ELSE (-1)*KDXCNTG END MOV, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' THEN KDXCNTG ELSE 0 END ING, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  THEN KDXCNTG ELSE 0 END SAL, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''01'' THEN KDXCNTG ELSE 0 END I01, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''01'' THEN KDXCNTG ELSE 0 END S01, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''02'' THEN KDXCNTG ELSE 0 END I02, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''02'' THEN KDXCNTG ELSE 0 END S02, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''03'' THEN KDXCNTG ELSE 0 END I03, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''03'' THEN KDXCNTG ELSE 0 END S03, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''04'' THEN KDXCNTG ELSE 0 END I04, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''04'' THEN KDXCNTG ELSE 0 END S04, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''05'' THEN KDXCNTG ELSE 0 END I05, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''05'' THEN KDXCNTG ELSE 0 END S05, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''06'' THEN KDXCNTG ELSE 0 END I06, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''06'' THEN KDXCNTG ELSE 0 END S06, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''07'' THEN KDXCNTG ELSE 0 END I07, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''07'' THEN KDXCNTG ELSE 0 END S07, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''08'' THEN KDXCNTG ELSE 0 END I08, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''08'' THEN KDXCNTG ELSE 0 END S08, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''09'' THEN KDXCNTG ELSE 0 END I09, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''09'' THEN KDXCNTG ELSE 0 END S09, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''10'' THEN KDXCNTG ELSE 0 END I10, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''10'' THEN KDXCNTG ELSE 0 END S10, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''11'' THEN KDXCNTG ELSE 0 END I11, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''11'' THEN KDXCNTG ELSE 0 END S11, '
         + 'CASE WHEN A.NISATIP=''INGRESO'' AND TO_CHAR(A.NISAFREG,''MM'')=''12'' THEN KDXCNTG ELSE 0 END I12, '
         + 'CASE WHEN A.NISATIP=''SALIDA''  AND TO_CHAR(A.NISAFREG,''MM'')=''12'' THEN KDXCNTG ELSE 0 END S12  '
         + 'From log315 A, log314 b '
         + 'Where a.ciaid=''' + cdsStockErr.FieldByname('CIAID').AsString + ''' '
         + 'and a.tinid=''' + cdsStockErr.FieldByname('TINID').AsString + ''' '
         + 'and a.almid=''' + cdsStockErr.FieldByname('ALMID').AsString + ''' '
         + 'and a.artid=''' + cdsStockErr.FieldByName('ARTID').AsString + ''' '
         + 'and a.nissit=''ACEPTADO'' '
         + 'and a.ciaid=b.ciaid and a.tinid=b.tinid and a.almid=b.almid and a.nisatip=b.nisatip '
         + 'and a.tdaid=b.tdaid and a.nisaid=b.nisaid '
         + 'and b.nissit=''ACEPTADO'' '
         + 'and b.nisafreg>=''01/01/' + cAno + ''' and b.nisafreg<=''31/12/' + cAno + ''''
         + 'ORDER BY A.ARTID, A.NISAFREG, A.KDXHREG '
         + ' ) A '
         + 'WHERE C.stkano=''' + cAno + ''' '
         + 'and C.ciaid=''' + cdsStockErr.FieldByname('CIAID').AsString + ''' '
         + 'and C.tinid=''' + cdsStockErr.FieldByname('TINID').AsString + ''' '
         + 'and C.almid=''' + cdsStockErr.FieldByname('ALMID').AsString + ''' '
         + 'and C.artid=''' + cdsStockErr.FieldByName('ARTID').AsString + ''' '
         + 'and a.ciaid(+)=c.ciaid and a.tinid(+)=c.tinid and a.almid(+)=c.almid and a.artid(+)=c.artid  '
         + 'GROUP BY C.CIAID, C.ARTID, C.TINID, C.ALMID ';
      xSQL := xSQL1 + xSQL2;
      cdsStock.Close;
      cdsStock.DataRequest(xSQL);
      cdsStock.Open;

      xSQL := 'Update LOG316 set '
         + 'STKISG01=' + cdsStock.FieldByname('I01').AsString + ', '
         + 'STKSSG01=' + cdsStock.FieldByname('S01').AsString + ', '
         + 'STKTSG02=' + cdsStock.FieldByname('SI02').AsString + ', '
         + 'STKISG02=' + cdsStock.FieldByname('I02').AsString + ', '
         + 'STKSSG02=' + cdsStock.FieldByname('S02').AsString + ', '
         + 'STKTSG03=' + cdsStock.FieldByname('SI03').AsString + ', '
         + 'STKISG03=' + cdsStock.FieldByname('I03').AsString + ', '
         + 'STKSSG03=' + cdsStock.FieldByname('S03').AsString + ', '
         + 'STKTSG04=' + cdsStock.FieldByname('SI04').AsString + ', '
         + 'STKISG04=' + cdsStock.FieldByname('I04').AsString + ', '
         + 'STKSSG04=' + cdsStock.FieldByname('S04').AsString + ', '
         + 'STKTSG05=' + cdsStock.FieldByname('SI05').AsString + ', '
         + 'STKISG05=' + cdsStock.FieldByname('I05').AsString + ', '
         + 'STKSSG05=' + cdsStock.FieldByname('S05').AsString + ', '
         + 'STKTSG06=' + cdsStock.FieldByname('SI06').AsString + ', '
         + 'STKISG06=' + cdsStock.FieldByname('I06').AsString + ', '
         + 'STKSSG06=' + cdsStock.FieldByname('S06').AsString + ', '
         + 'STKTSG07=' + cdsStock.FieldByname('SI07').AsString + ', '
         + 'STKISG07=' + cdsStock.FieldByname('I07').AsString + ', '
         + 'STKSSG07=' + cdsStock.FieldByname('S07').AsString + ', '
         + 'STKTSG08=' + cdsStock.FieldByname('SI08').AsString + ', '
         + 'STKISG08=' + cdsStock.FieldByname('I08').AsString + ', '
         + 'STKSSG08=' + cdsStock.FieldByname('S08').AsString + ', '
         + 'STKTSG09=' + cdsStock.FieldByname('SI09').AsString + ', '
         + 'STKISG09=' + cdsStock.FieldByname('I09').AsString + ', '
         + 'STKSSG09=' + cdsStock.FieldByname('S09').AsString + ', '
         + 'STKTSG10=' + cdsStock.FieldByname('SI10').AsString + ', '
         + 'STKISG10=' + cdsStock.FieldByname('I10').AsString + ', '
         + 'STKSSG10=' + cdsStock.FieldByname('S10').AsString + ', '
         + 'STKTSG11=' + cdsStock.FieldByname('SI11').AsString + ', '
         + 'STKISG11=' + cdsStock.FieldByname('I11').AsString + ', '
         + 'STKSSG11=' + cdsStock.FieldByname('S11').AsString + ', '
         + 'STKTSG12=' + cdsStock.FieldByname('SI12').AsString + ', '
         + 'STKISG12=' + cdsStock.FieldByname('I12').AsString + ', '
         + 'STKSSG12=' + cdsStock.FieldByname('S12').AsString + ', '
         + 'STKSACTG=' + cdsStock.FieldByname('SALDO').AsString + ' '
         + 'Where ciaid=''' + cdsStock.FieldByname('CIAID').AsString + ''' '
         + 'and stkano=''' + cAno + ''' '
         + 'and tinid=''' + cdsStock.FieldByname('TINID').AsString + ''' '
         + 'and almid=''' + cdsStock.FieldByname('ALMID').AsString + ''' '
         + 'and artid=''' + cdsStock.FieldByname('ARTID').AsString + '''';

      Try
         cdsStockAct.Close;
         cdsStockAct.DataRequest(xSQL);
         cdsStockAct.Execute;
      Except
      End;

      cdsStockErr.Next;
   End;

End;

Function TDMALM.FiltraCiaPorUsuario(cdsCiaUser: TwwClientDataSet): String;
Var
   cFilter: String;
Begin
   cFilter := '';
   cdsCiaUser.First;
   While Not cdsCiaUser.Eof Do
   Begin
      If cFilter = '' Then
         cFilter := ' CIAID IN ( ''' + cdsCiaUser.FieldByName('CIAID').AsString + ''''
      Else
         cFilter := cFilter + ', ''' + cdsCiaUser.FieldByName('CIAID').AsString + '''';

      cdsCiaUser.Next;
   End;

   If cFilter <> '' Then
      cFilter := cFilter + ' ) ';

   Result := cFilter;
End;

Procedure TDMALM.cdsCnt301ReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(DataSet, UpdateKind, E);
End;

Procedure TDMALM.cdsCnt300ReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(DataSet, UpdateKind, E);
End;

Procedure TDMALM.HojaExcel(Tit: String; TDs: TDataSource; TDb: TDBGrid);
Var
   Lcid, C, CH, CH1, I, W, X, Y, TotHoja: Integer;
   Bk: TBookmarkStr;
   Tabla: Variant;
   L, A: OleVariant;
   HH: Extended;
Begin
   If Not TDs.DataSet.Active Then Exit;
   If TDs.DataSet.RecordCount = 0 Then Exit;

   Lcid := GetUserDefaultLCID;
   C := TDb.Columns.Count;
   CH := 1;
   If TDs.DataSet.RecordCount > 15100 Then
   Begin
      HH := TDs.DataSet.RecordCount / 15100;
      CH := Trunc(HH);
      If Frac(HH) > 0 Then CH := CH + 1;
   End;

   ExcelApp.Visible[Lcid] := True;
   ExcelApp.Caption := 'Consultas en EXCEL';
   ExcelBook.ConnectTo(ExcelApp.Workbooks.Add(1, Lcid));
   If CH > 1 Then
   Begin
      ExcelBook.Worksheets.Add(NULL, NULL, (CH - 1), NULL, Lcid);
      For I := 1 To CH Do
      Begin
         WS.ConnectTo(ExcelBook.Worksheets[I] As _Worksheet);
         WS.Name := Tit + '_' + IntToStr(I);
      End;
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);
   If CH = 1 Then WS.Name := Tit;
   ExcelApp.ScreenUpdating[Lcid] := False;
   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);
      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         WS.Range[L, L].Value2 := TDb.Columns[I].Title.Caption;
      End;
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);

   CH1 := 1;
   W := 2;
   I := 1;
   Y := 1;
   TotHoja := 0;
   TDs.DataSet.DisableControls;
   Bk := TDs.DataSet.Bookmark;

   Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
   TDs.DataSet.First;
   While Not TDs.DataSet.Eof Do
   Begin
      For X := 0 To (C - 1) Do
         Tabla[Y, X] := TDs.DataSet.Fields[X].AsString;
      If Y = 5000 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I + 1, C]].Value2 := Tabla;
         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;

         Y := 0;
         W := I + 2;
      End;
      Inc(Y, 1);
      Inc(I, 1);
      Inc(TotHoja, 1);
      If TotHoja = 15100 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I, C]].Value2 := Tabla;

         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;

         CH1 := CH1 + 1;
         WS.ConnectTo(ExcelBook.Worksheets[CH1] As _Worksheet);
         WS.Activate(Lcid);

         Y := 1;
         W := 2;
         I := 1;
         TotHoja := 0;
      End;
      Application.ProcessMessages;
      TDs.DataSet.Next;
   End;
   CH1 := I;
   Try
      WS.Range['A' + IntToStr(W), WS.Cells.Item[CH1, C]].Value2 := Tabla;
   Finally
      Tabla := Unassigned;
   End;

   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);

      SetLength(FormatCel, C + 1);
      FormatosCeldas(C, TDs);
      For I := 1 To C Do
      Begin
         L := WS.Cells.Item[1, I];
         WS.Range[L, L].EntireColumn.NumberFormat := FormatCel[I];
      End;

      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         Y := TDs.DataSet.Fields[I].DisplayWidth;
         If Length(TDb.Columns[I].Title.Caption) > Y Then
            Y := Length(TDb.Columns[I].Title.Caption);
         WS.Range[L, L].EntireColumn.ColumnWidth := Y + 2;
         If TDb.Columns[I].Alignment = taLeftJustify Then A := 2;
         If TDb.Columns[I].Alignment = taCenter Then A := 3;
         If TDb.Columns[I].Alignment = taRightJustify Then A := 4;
         WS.Range[L, L].EntireColumn.HorizontalAlignment := A;
      End;

      L := WS.Cells.Item[1, C];
      WS.Range['A1', L].HorizontalAlignment := 3;
      WS.Range['A1', L].Interior.Color := clMaroon;
      WS.Range['A1', L].Font.Color := clWhite;
      WS.Range['A1', L].Font.Bold := True;

      If CH = 1 Then
         W := TDs.DataSet.RecordCount + 1
      Else
         If (CH > 1) And (X < CH) Then
            W := 15101
         Else
            If (CH > 1) And (X = CH) Then W := CH1;

      WS.PageSetup.PrintGridlines := True;
      WS.PageSetup.PrintTitleRows := '1:1';

      WS.DefaultInterface.Set_DisplayAutomaticPageBreaks(Lcid, True);
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);

   ExcelApp.ScreenUpdating[Lcid] := True;

   TDs.DataSet.EnableControls;
   TDs.DataSet.Bookmark := Bk;

End;

Procedure TDMALM.FormatosCeldas(N: Integer; TDs: TDataSource);
Var
   I: Integer;
   F: TFieldDef;
Begin
   For I := 1 To N Do
   Begin
      F := TDs.DataSet.FieldDefs.Items[I - 1];
      Case F.DataType Of
         ftString: FormatCel[I] := DMALM.StrZero('0', Length(TDs.DataSet.Fields[I - 1].AsString));
         ftDate: FormatCel[I] := 'dd/mm/yyyy';
         ftDateTime: FormatCel[I] := 'dd/mm/yyyy';
         ftTimeStamp: FormatCel[I] := 'dd/mm/yyyy';
         ftUnknown: FormatCel[I] := DMALM.StrZero('0', Length(TDs.DataSet.Fields[I - 1].AsString));
      Else
         FormatCel[I] := Null;
      End;
   End;

End;

Function TDMALM.ObtenerIpdeNetbios(Host: String): String;
Var
   WSAData: TWSADATA;
   HostEnt: phostent;
Begin
   Result := '';
   If WSAStartup(MAKEWORD(1, 1), WSADATA) = 0 Then
   Begin
      HostEnt := gethostbyname(PChar(Host));
      If HostEnt <> Nil Then
         Result := String(inet_ntoa(PInAddr(HostEnt.h_addr_list^)^));
      WSACleanup;
   End;
End;

Function TDMALM.ComputerName: String;
Var
   Buffer: Array[0..100] Of Char;
   MaxSize: Cardinal;
Begin
   MaxSize := SizeOf(Buffer);
   If Not GetComputerName(@Buffer, MaxSize) Then
      Raise Exception.Create('No puedo determinar el nombre de la máquina');
   Result := StrPas(@Buffer);
End;

Function TDMALM.AccesosModulo: Boolean;
Var
   xSQL: String;
   xfecfin: TDate;
   xdiasexppass: Integer;
   xdiasfaltantes: Integer;
   xdiasduracpass: Integer;
   xpassact, xctrl_ip, xingresa: String;
Begin
// busca en tabla DE USUARIO (TGE006) para determinar que es un usuario de base de datos
   xSQL := 'select FECEXP, OFDESID, nvl(CTRL_IP,''S'') CTRL_IP, '
      + '       TO_DATE(nvl(FECINI_PWD,sysdate-30)) FECINI_PWD, '
      + '       TO_DATE(nvl(FECFIN_PWD, sysdate-1)) FECFIN_PWD, '
      + '       nvl(DIASEXP_PWD,7) DIASEXP_PWD,'
      + '       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD '
      + 'from TGE006 '
      + 'where USERID = ' + QuotedStr(wUsuario);
   cdsQry.Close;
   cdsQry.DataRequest(xSql);
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      Showmessage('Usuario no reconocido para el uso de Aplicaciones');
      Result := False;
      Exit;
   End;

// valida que contraseña en control de aplicaciones (TGE006), no haya expirado
   If (cdsQry.FieldByName('FECEXP').AsDateTime > 0) And
      (cdsQry.FieldByName('FECEXP').AsDateTime < Date) Then
   Begin
      Showmessage('Usuario ha caducado para el uso de Aplicaciones');
      Result := False;
      Exit;
   End;
   xfecfin := cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   xdiasexppass := cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass := cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;

   wOfiId := cdsQry.FieldByName('OFDESID').AsString;
   xctrl_ip := cdsQry.FieldByName('CTRL_IP').AsString;
   widepc := computerName;

// determina que el usuario tenga acceso al módulo
// busca en tabla TGE006 para determinar que es un usuario de base de datos y de la aplicación
   xSQL := 'Select USUARIOS.USERID, USUARIOS.USERNOM, USUARIOGRUPO.GRUPOID, '
      + '       GRUPOS.GRUPODES, GRUPOS.GRUPOADM, ACCESOGRUPO.MODULOID, '
      + '       ACCESOGRUPO.TIPO, ACCESOGRUPO.OBJETO, ACCESOGRUPO.FORMA '
      + 'From TGE006 USUARIOS, TGE007 USUARIOGRUPO, TGE003 GRUPOS, TGE001 ACCESOGRUPO '
      + 'where USUARIOS.USERID=' + quotedstr(wUsuario) // -- TGE006 USUARIOS
      + '  and USUARIOGRUPO.USERID=USUARIOS.USERID' // -- TGE007 USUARIOGRUPO
      + '  and GRUPOS.GRUPOID=USUARIOGRUPO.GRUPOID' // -- TGE003 GRUPOS
      + '  and ACCESOGRUPO.GRUPOID=USUARIOGRUPO.GRUPOID '
      + '  and ACCESOGRUPO.MODULOID=' + quotedstr(wModulo)
      + '  and ACCESOGRUPO.TIPO=''0'' '; // TGE001 ACCESOGRUPO
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No tiene Acceso al Sistema de Inventarios');
      Result := False;
      Exit;
   End;

// Identifica si el usuario puede ejecutar los sistemas de cualquier maquina
// o solo de las máquina que se le han asignado
   xingresa := 'N';
   If xctrl_ip = 'S' Then
   Begin
      xSQL := 'SELECT IP_ASIGNADO FROM TGE010 WHERE USERID = ' + QuotedStr(DMALM.wUsuario);
      cdsQry.Close;
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      While Not cdsQry.Eof Do
      Begin
         If cdsQry.FieldByName('IP_ASIGNADO').AsString = cIP Then xingresa := 'S';
         cdsQry.Next;
      End;
   End;
   If (xingresa = 'N') And (xctrl_ip = 'S') Then
   Begin
      Showmessage('Usuario no autorizado para ingresar de este equipo');
      Result := False;
      Exit;
   End;

// DETERMINA NRO DE IDENTIFICADOR PARA GRABAR EN ARCHIVO LOG DE ACCESOS
// SE DETERMINA EN BASE A LA FECHA+HORA DE INGRESO A LA BASE DE DATOS
   xSQL := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') IDE, SYSDATE FECHORCON FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   ideconex := cdsQry.FieldByName('IDE').AsString;
   fechorcon := cdsQry.FieldByName('FECHORCON').AsString;

// ENVIA PARAMETROS DE LA PC DEL USUARIO HACIA LA APLICACION SERVIDOR
   DCOM1.AppServer.ConexionON(wUsuario, cIP, wModulo, ideconex, fechorcon, widepc);

// controla caducidad de contraseña
   xSQL := 'SELECT TO_DATE(' + QuotedStr(DateToStr(xfecfin)) + ') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;

   xdiasfaltantes := cdsQry.FieldByName('DIASFALTANTE').AsInteger; // dias que faltan
   If xdiasfaltantes <= xdiasexppass Then
   Begin
      If xdiasfaltantes <= 0 Then
         MessageDlg('SU CONTRASEÑA HA CADUCADO, DEBE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
      Else
         If xdiasfaltantes = 1 Then
            MessageDlg('!!! FALTA 1 DíA PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡' + chr(13)
               + '            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0)
         Else
            MessageDlg('!!! FALTAN ' + IntToStr(xdiasfaltantes) + ' DÍAS PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡' + chr(13)
               + '            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0);
   End;
   If xdiasfaltantes <= 0 Then
   Begin
      Result := False;
      Exit;
   End;

   Result := True;

End;

Function TDMALM.fg_VerificaVersion(wgVersion: String): Boolean;
Var
   xsSQL: String;
Begin
   Result := False;
   xsSQL := 'SELECT * FROM TGE600 WHERE CODIGO = ' + QuotedStr(wModulo);
   cdsQry.Close;
   cdsQry.DataRequest(xsSQL);
   cdsQry.Open;
   If Trim(wgVersion) = Trim(cdsQry.FieldByName('VERSION').AsString) Then
      Result := True
   Else
      Result := False;
End;

//INICIO HPC_201302_ALM
//Verifica si el tipo de inventario esta habilitado

Function TDMALM.VerificaTipInventario(vCiaid: String; vTINID: String): Boolean;
Var
   xsql: String;
Begin

   Xsql := 'Select  HABILITADO from tge152 Where Ciaid=''' + vCiaid + ''' And Tinid=''' + vTinid + ''' and NVL(Habilitado,''S'')=''S'' ';
   cdsQry.Close;
   cdsQry.DataRequest(Xsql);
   cdsQry.Open;
   If cdsQry.RecordCount > 0 Then
      Result := True
   Else
      Result := False;

End;
//FINAL HPC_201302_ALM

// Inicio HPC_201306_ALM

Procedure TDMALM.AnalizaStockRepos;
Var
   xSQL, vCia: String;
   xFultproc, xFVencido: Tdate;
   xDiasVal: Integer;
Begin
// Almacén a consultar Articulos de reposición
   xSQL := 'Select CODIGO '
      + '  from TGE004 '
      + ' Where NTABLA=''TGE101'' and USERID=''' + wUsuario + ''' and MODULOID=''ALM'' ';
   cdsQry5.Close;
   cdsQry5.DataRequest(xsql);
   cdsQry5.Open;
   If cdsQry5.Eof Then
   Begin
      ShowMessage('El USUARIO ' + Trim(wUsuario) + ' NO TIENE ASIGNADO UNA COMPAÑIA UNICA PARA LA CONSULTA DE ARTÍCULOS DE REPOSICION');
      cdsQry5.EmptyDataSet;
   End
   Else
   Begin
   // Verifica si la informacion ya vencio emite un mesage para ejecutar el proceso
      vCia := cdsQry5.FieldByname('CODIGO').AsString;
      xSQL := 'Select CIAID, DIASVAL, FECULTPRO, USUARIO, FREG, ACTIVO, to_date(SYSDATE) FHOY '
         + '  From ALM_PAR_EVAL_STK_REPOSICION A '
         + ' Where CIAID=''' + vCia + ''' and ACTIVO=''S'' ';
      cdsQry5.Close;
      cdsQry5.DataRequest(xSQL);
      cdsQry5.Open;
      xFultproc := cdsQry5.FieldByname('FECULTPRO').AsDateTime;
      xDiasVal := cdsQry5.FieldByname('DIASVAL').AsInteger;
      xFVencido := xFultproc + xDiasVal;
      If (XFVencido <= cdsQry5.FieldByName('fhoy').AsDateTime) Then
      Begin
         ShowMessage(' !! ADVERTENCIA ¡¡, LA CONSULTA DE ARTICULOS PARA REPOSICION YA ESTA VENCIDA, DEBE GENERARLA NUEVAMENTE');
         cdsQry5.EmptyDataSet;
      End
      Else
      Begin
         xSQL := 'Select B.TINABR,A.ARTID,C.ARTDES,A.STKACT,A.STKREP,C.ARTCNTG,A.CRITICO,'
            + '       case when A.STKREP<C.ARTCNTG then C.ARTCNTG else 0 end REPUESTO '
            + '  From ALM_STK_REPOSICION A,TGE152 B,TGE205 C '
            + ' Where A.CIAID=''' + vCia + ''' AND '
            + '       A.CIAID=B.CIAID AND A.TINID=B.TINID AND '
            + '       A.CIAID=C.CIAID AND A.TINID=C.TINID AND A.ARTID=C.ARTID '
            + ' Order by B.TINABR,C.ARTDES ';
         cdsQry5.Close;
         cdsQry5.DataRequest(xSQL);
         cdsQry5.Open;
      End;
   End;
End;
//Final HPC_201306_ALM

// Inicio HPC_201505_ALM

Function TDMALM.FiltraAlmPorUsuario(wsUsuario: String): String;
Begin
   xSQL := 'select CODIGO from TGE004 '
      + '    where USERID = ' + quotedstr(wsUsuario)
      + '      and MODULOID = ''ALM''  '
      + '      and NTABLA = ''TGE151'' ';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   result := '';
   While Not cdsQry.EOF Do
   Begin
      If length(result) > 0 Then
         result := result + ' or ALMID=' + quotedstr(cdsQry.FieldByName('CODIGO').AsString)
      Else
         result := '(ALMID=' + quotedstr(cdsQry.FieldByName('CODIGO').AsString);
      cdsQry.Next;
   End;
   If length(result) > 0 Then
      result := result + ')';
   cdsQry.Close;
End;
// Fin HPC_201505_ALM

// Inicio HPC_201604_ALM

Function TDMALM.wf_AccesoOpcion(wOpcion: String): Boolean;
Begin
   xSQL := 'Select OBJETO '
      + '     from TGE001 '
      + '    where GRUPOID=' + quotedstr(DMALM.wGrupo)
      + '      and MODULOID=' + quotedstr(DMALM.wModulo)
      + '      and TIPO=' + quotedstr('1')
      + '      and OBJETO=' + quotedstr(wOpcion);
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;
   If DMALM.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No tiene Acceso a esta Opción');
      result := False;
   End
   Else
   Begin
      result := True;
   End;
End;
// Fin HPC_201604_ALM

End.

