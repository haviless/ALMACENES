Unit ALM270;

// Inicio Uso Estándares:   01/08/2011
// Unidad               :   ALM270
// Formulario           :   FRegArti
// Fecha de Creación    :
// Autor                :   Equipo de Desarrollo
// Objetivo             :   Ventana de Mantenimiento del Maestro de artículos
//

// Actualizaciones      :
// HPC_201202_ALM  12/11/2012  Se implementó validaciones al campo Afecto a IGV
//                             para evitar los errores en INFODEM
// HPC_201302_ALM  19/04/2013  Se implementa la restricción en el tipo de inventario
// HPC_201306_ALM  01/09/2013  -	Se acondiciona para ingresar directamente el punto de reposición que servirá para determinar si el artículo está dentro del límite para su reposición
// HPC_201403_ALM  15/09/2014  Se graba como parámetro fijo el Campo Contenido=1
// HPC_201504_ALM  27/08/2015  En el Maestro de Articulos no se puede desactivar mientras sea un activo fijo con movimientos
//                             vale decir que exista Stock en el Maestro y aún se este procesando el traslado de activo fijo.
// HPC_201601_ALM 04/04/2016   Cambios del Maestro para incluir Clase y SubClase
// HPC_201603_ALM 12/05/2016   Cambios del Maestro para Indicador de Discontinuo y etiqueta en formulario
// HPC_201604_ALM 20/05/2016   DAF_2016000116 Se añade actualizacion de campo FLAGVAR como Indicador que es precio editable en Ventas
//                20/05/2016   Se regulariza actualización de Componentes y Equivalentes en grabación general.
// HPC_201606_ALM 25/07/2016   Cambios en descripción de artículo.
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
   wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
   Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin, ComCtrls, wwclient, Variants,
   oaVariables, msgdlgs;

Type
   TFRegArti = Class(TForm)
      Z2bbtnRegresa: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      pgArti: TPageControl;
      tsGeneral: TTabSheet;
      tsComponent: TTabSheet;
      tsEquals: TTabSheet;
      pnlCabecera: TPanel;
      lblCIA: TLabel;
      dblcCIA: TwwDBLookupCombo;
      lblNSolCot: TLabel;
      dbeCodArti: TwwDBEdit;
      lblDescrip: TLabel;
      dbeDescrip: TwwDBEdit;
      dbeAbrev: TwwDBEdit;
      lblAbre: TLabel;
      bvlBox1: TBevel;
      Z2bbtnCOk: TBitBtn;
      Z2bbtnBorrar: TBitBtn;
      dblcUMedG: TwwDBLookupCombo;
      dbeUMedG: TwwDBEdit;
      dbgDArti: TwwDBGrid;
      Z2dbgDReqsIButton: TwwIButton;
      bvlCAJA0: TBevel;
      dbgEQ: TwwDBGrid;
      Z2dbgDEQIButton: TwwIButton;
      bvlCAJA1: TBevel;
      lblGRUPO: TLabel;
      dblcTINID: TwwDBLookupCombo;
      lblTMON: TLabel;
      lblGrArtID: TLabel;
      dblcGrpArti: TwwDBLookupCombo;
      dbeGrpArti: TwwDBEdit;
      lblFAM: TLabel;
      dblcFAM: TwwDBLookupCombo;
      dblcSUBFAM: TwwDBLookupCombo;
      lblSUBFAM: TLabel;
      bvlCAJA2: TBevel;
      lblUMG: TLabel;
      lblPRESEN: TLabel;
      dbePRESEN: TwwDBEdit;
      lblFECADQ: TLabel;
      dbdtpFECADQ: TwwDBDateTimePicker;
      lblFECVEN: TLabel;
      dbdtpFECVEN: TwwDBDateTimePicker;
      lblLOTE: TLabel;
      dbeLOTE: TwwDBEdit;
      lblNSERIE: TLabel;
      dbeNSERIE: TwwDBEdit;
      lblCTACON: TLabel;
      dbeTINID: TwwDBEdit;
      dbeFAM: TwwDBEdit;
      dbeSFAM: TwwDBEdit;
      dbcbAFijo: TDBCheckBox;
      tsParRep: TTabSheet;
      wwDBGrid1: TwwDBGrid;
      Bevel4: TBevel;
      lblFCOMPRA: TLabel;
      dbeFCompra: TwwDBEdit;
      lblFULTPRE: TLabel;
      dbeFUMov: TwwDBEdit;
      Label1: TLabel;
      dbeFUPrecio: TwwDBEdit;
      lblVALORI: TLabel;
      lblSOCKACT: TLabel;
      dbeSAG: TwwDBEdit;
      dbeVALG: TwwDBEdit;
      lblCPROMEDIO: TLabel;
      dbeCPROMG: TwwDBEdit;
      lblUSUARIO: TLabel;
      dbeUsuario: TwwDBEdit;
      lblFUSUARIO: TLabel;
      dbeFRegistro: TwwDBEdit;
      lblHUSUARIO: TLabel;
      dbeHRegistro: TwwDBEdit;
      Bevel3: TBevel;
      lblCodBar: TLabel;
      dbeCodBar: TwwDBEdit;
      TabSheet1: TTabSheet;
      lblPCOSTOG: TLabel;
      dbePCOSTOG: TwwDBEdit;
      lblPVENTAG: TLabel;
      dbePVENTAG: TwwDBEdit;
      dbcbDCTG: TDBCheckBox;
      dbcbIGV: TDBCheckBox;
      dbcbIsc: TDBCheckBox;
      lblCRGO: TLabel;
      dbeCRGO: TwwDBEdit;
      dbeCtaCon: TwwDBEdit;
      Label4: TLabel;
      dbeFUVenta: TwwDBEdit;
      dbeCIA: TEdit;
      pnlDetalleA: TPanel;
      bvlCAJA6: TBevel;
      lblArti: TLabel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      stxTitulo2: TStaticText;
      dbeArti: TwwDBEdit;
      dbcldArti: TwwDBLookupComboDlg;
      Bevel1: TBevel;
      Bevel2: TBevel;
      dbeSMaxG: TwwDBEdit;
      dbeSMinG: TwwDBEdit;
      dbeSCRep: TwwDBEdit;
      Label6: TLabel;
      lblStkMax: TLabel;
      lblStkMin: TLabel;
      lblStkRep: TLabel;
      dbeSRepG: TwwDBEdit;
      Bevel5: TBevel;
      Label7: TLabel;
      Label8: TLabel;
      edtNow: TEdit;
      edtDiasSMov: TEdit;
      Bevel6: TBevel;
      lblCiVida: TLabel;
      dbeCExis: TwwDBEdit;
      dbcbNSerie: TDBCheckBox;
      Z2bbtnOK: TBitBtn;
      Label9: TLabel;
      dbcbEst: TDBCheckBox;
      dbcbInc: TDBCheckBox;
      dbeComision: TwwDBEdit;
      Label10: TLabel;
      Label11: TLabel;
      Label12: TLabel;
      dblcdMarca: TwwDBLookupComboDlg;
      edtMarca: TEdit;
      dblcdArtTipo: TwwDBLookupComboDlg;
      Label13: TLabel;
      edtTipArt: TEdit;
      Label14: TLabel;
      dbeModelo: TwwDBEdit;
      Label15: TLabel;
      dbeCaracteristicas: TwwDBEdit;
      dbcbObsequio: TDBCheckBox;
      DBCheckBox1: TDBCheckBox;
      dbcbExo: TDBCheckBox;
      bbtnBuscar: TBitBtn;
      dbcCargServ: TDBCheckBox;
      lblTMONEDA: TLabel;
      dblcTMoneda: TwwDBLookupCombo;
      dbeTMoneda: TwwDBEdit;
      lblProv: TLabel;
      dblcdProv: TwwDBLookupComboDlg;
      dbeProv: TEdit;
      dbrdProcede: TDBRadioGroup;
      lblFAB: TLabel;
      dblcFAB: TwwDBLookupCombo;
      dbeFAB: TEdit;
      lblPArancel: TLabel;
      dbePArancel: TwwDBEdit;
      Label2: TLabel;
      Label3: TLabel;
//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
      dblcClase: TwwDBLookupCombo;
      dbeClase: TwwDBEdit;
      dblcSClase: TwwDBLookupCombo;
      dbeSClase: TwwDBEdit;
//  Fin HPC_201601_ALM
      chkCRITICO: TDBCheckBox;
// Inicio HPC_201603_ALM
// Se agrega indicador de Discontinuo y Etiqueta en Formulario
      Label5: TLabel;
      dblcContinuidad: TwwDBLookupCombo;
      edtcodeti: TEdit;
      Label16: TLabel;
    cbEditaPrecio: TCheckBox;
// Fin HPC_201603_ALM
      Procedure dblcNotInListOr(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcNotInListDe(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dbeCodArtiExit(Sender: TObject);
      Procedure Z2bbtnCOkClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure Z2bbtnBorrarClick(Sender: TObject);
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure Z2bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z2dbgDReqsIButtonClick(Sender: TObject);
      Procedure dbgDArtiDblClick(Sender: TObject);
      Procedure dbgDArtiKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure Z2dbgDEQIButtonClick(Sender: TObject);
      Procedure dblcTINIDExit(Sender: TObject);
      Procedure dblcGrpArtiExit(Sender: TObject);
      Procedure dbcldArtiExit(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcFABExit(Sender: TObject);
      Procedure dblcUMedGExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcFAMExit(Sender: TObject);
      Procedure dblcSUBFAMExit(Sender: TObject);
      Procedure dblcCLASEExit(Sender: TObject);
      Procedure dblcSCLASEExit(Sender: TObject);      
      Procedure dblcUMedUExit(Sender: TObject);
      Procedure dblcTMonedaExit(Sender: TObject);
      Procedure dblcTINIDEnter(Sender: TObject);
      Procedure dbgEQKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure dbeSMaxGExit(Sender: TObject);
      Procedure dbeSMinGExit(Sender: TObject);
      Procedure dbeSRepGExit(Sender: TObject);
      Procedure dbeCExisExit(Sender: TObject);
      Procedure dbeSCRepExit(Sender: TObject);
      Procedure dblcGrpArtiEnter(Sender: TObject);
      Procedure dblcFAMEnter(Sender: TObject);
      Procedure dblcSUBFAMEnter(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcdMarcaExit(Sender: TObject);
      Procedure dblcdArtTipoExit(Sender: TObject);
      Procedure dbeModeloExit(Sender: TObject);
      Procedure dbeCaracteristicasExit(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure dbcldArtiEnter(Sender: TObject);
      Procedure bbtnBuscarClick(Sender: TObject);
//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
      Procedure dblcCLASEEnter(Sender: TObject);
      Procedure dblcSCLASEEnter(Sender: TObject);
//  Fin HPC_201601_ALM


   Private
  { Private declarations }
      iEstado: Integer;
      pgEstado: Boolean;
      xCrea: bool;
// Inicio HPC_201603_ALM
// Se agrega indicador de discontinuo
      wTINID, wGRARID, wFAMID, wSFAMID, wCLASEID, wSCLASEID, wDISCONTINUO : String;
// Fin HPC_201603_ALM
      wUNMIDG, wUNMIDU, wTMONID, wARTSPRO: String;
      wARTCONT: real;

      Procedure OnOffCabecera(Value: Boolean);
      Procedure OnOffDetalle(Value: Boolean);
      Procedure btnDetalle;
      Function EHandlerError(Ex: Exception): Boolean;
      Procedure CargaUsuario; { carga usuario, fecha y hora}
      Procedure CancelaNuevo;
      Procedure CapturarValores;
      Function VerificaCambios: boolean;

      Function DescripcionArticulo: String;
      Procedure ActivaCompania04(cEstado: String);
      Function fg_ValidaIgvArticulo: Boolean;

   Public
  { Public declarations }

   End;

Var
   FRegArti: TFRegArti;
   xTinven, xDesArt, xIdFam, xIdSfam, sSQL: String;
//Inicio HPC_201601_ALM
//Cambios del Maestro para incluir Clase y SubClase
   xIdClase, xIdSClase: String;
//Fin HPC_201601_ALM

Implementation

Uses ALMDM1, oaIN2000, ALM272;

{$R *.DFM}

Procedure TFRegArti.dblcNotInListOr(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegArti.dblcNotInListDe(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegArti.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMALM.cdsQry.Close;
   DMALM.cdsQry.IndexFieldNames := '';
   DMALM.cdsQry.Filter := '';
   DMALM.cdsQry.Filtered := False;

   DMALM.cdsQry1.Close;
   DMALM.cdsQry1.IndexFieldNames := '';
   DMALM.cdsQry1.Filter := '';
   DMALM.cdsQry1.Filtered := False;

   DMALM.cdsGArti.Close;
   DMALM.cdsGArti.IndexFieldNames := '';
   DMALM.cdsGArti.Filter := '';
   DMALM.cdsGArti.Filtered := False;

   DMALM.cdsArti.CancelUpdates;
   Action := CAFree;
End;

Procedure TFRegArti.dbeCodArtiExit(Sender: TObject);
Begin
   If length(Trim(dbeCodArti.Text)) = 0 Then
   Begin
      ErrorMsg('Inventarios', ' Falta Código de Articulo ');
      dbeCodArti.SetFocus;
      Exit;
   End;
   If DMALM.cdsARTI.State In [dsInsert] Then
   Begin
      If DMALM.wAnchoArt > 0 Then
         DMALM.cdsArti.fieldbyname('ARTID').AsString := DMALM.StrZero(dbeCodArti.Text, DMALM.wAnchoArt);
      If DMALM.IsExistART(DMALM.cdsARTI.FieldByName('CIAID').AsString,
         DMALM.cdsARTI.FieldByName('ARTID').AsString) Then
      Begin
         ErrorMsg('Error', 'Ya existe un Artículo con el mismo ' + #13 +
            'código ... ' + DMALM.cdsARTI.FieldByName('ARTID').AsString);
         If DMALM.wAnchoArt > 0 Then
            DMALM.cdsArti.fieldbyname('ARTID').AsString := DMALM.StrZero(DMALM.MaxArt(dblcCIA.Text), DMALM.wAnchoArt);
         dbeCodArti.SetFocus;
      End
      Else
         If DMALM.wAnchoArt > 0 Then
            DMALM.cdsArti.fieldbyname('ARTID').AsString := DMALM.StrZero(dbeCodArti.Text, DMALM.wAnchoArt);
   End;

End;

Procedure TFRegArti.Z2bbtnCOkClick(Sender: TObject);
Var
   sSQL, xCIA, xART: String;

Begin
   If length(dbeCia.text) = 0 Then
   Begin
      ShowMessage('Registre Código de Compañía');
      dblcCia.SetFocus;
      exit;
   End;

   If length(dbeCodArti.Text) = 0 Then
   Begin
      ShowMessage('Registre Código de Artículo');
      dbeCodArti.SetFocus;
      exit;
   End;

{
   If dblcCIA.text = '04' Then
   Begin
      If length(edtMarca.Text) = 0 Then
      Begin
         ShowMessage('Registre la Marca');
         dblcdMarca.SetFocus;
         exit;
      End;
      If length(edtTipArt.Text) = 0 Then
      Begin
         ShowMessage('Registre el Tipo de Artículo');
         dblcdArtTipo.SetFocus;
         exit;
      End;
   End;
}

   If length(dbeDescrip.text) = 0 Then
   Begin
      ShowMessage('Registre la Descripción del Artículo');
      If dbeDescrip.Enabled Then
         dbeDescrip.SetFocus;
      exit;
   End;

   If length(dbeAbrev.text) = 0 Then
   Begin
      ShowMessage('Registre la Descripción Abreviada del Artículo');
      dbeAbrev.SetFocus;
      exit;
   End;

   Screen.Cursor := crhourGlass;
   OnOffCabecera(False);
   OnOffDetalle(True);
   xCIA := dblcCIA.Text;
   xART := dbeCODARTI.Text;

// Componentes
   sSQL := 'Select CIAID, TINID, ARTID, EARTID, EARTDES, EARTABR '
      +    '  from TGE206 '
      +    ' where CIAID=' + quotedstr(xCIA)
      +    '   and ARTID=' + quotedstr(xART);
   DMALM.cdsEARTI.Close;
   DMALM.cdsEARTI.DataRequest(sSQL);
   DMALM.cdsEARTI.Open;

// Equivalentes
   sSQL := 'Select CIAID, TINID, ARTID, QARTID, QARTDES, QARTABR '
      +    '  from TGE207 '
      +    ' where CIAID=' + quotedstr(xCIA)
      +    '   and ARTID=' + quotedstr(xART);
   DMALM.cdsQARTI.Close;
   DMALM.cdsQARTI.DataRequest(sSQL);
   DMALM.cdsQARTI.Open;

   pgArti.ActivePage := tsGeneral;
   tsGeneral.Enabled := True;
   pgEstado := False;

   If DMALM.wModo = 'M' Then
   Begin
      dblcTINID.SetFocus;

      If DMALM.cdsArti.FieldByName('ARTSPRO').AsString = 'NACIONAL' Then
         dbrdProcede.ItemIndex := 0
      Else
      Begin
         dbrdProcede.ItemIndex := 1;
      End;
   End
   Else
   Begin
      If dblcCia.text = '05' Then
         DMALM.cdsArti.fieldbyname('ARTIGV').AsString := 'N'
      Else
         DMALM.cdsArti.fieldbyname('ARTIGV').AsString := 'S';

//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
      If dblcdArtTipo.Text <> '' Then
      Begin
         sSQL := 'Select CIAID, TINID, GRARID, FAMID, SFAMID, CLASEID, SCLASEID, count(*) NUMREG '
            +    '  from TGE205 '
            +    ' where CIAID='+quotedstr(xCIA)
            +    '   and TIPART='+quotedstr(dblcdArtTipo.Text)
            +    ' group by CIAID, TINID, GRARID, FAMID, SFAMID, CLASEID, SCLASEID '
            +    ' order by COUNT(*) DESC';
         DMALM.cdsQry8.Close;
         DMALM.cdsQry8.DataRequest(sSQL);
         DMALM.cdsQry8.Open;

         xCrea := True;
         DMALM.cdsArti.FieldByName('TINID').AsString := DMALM.cdsQry8.FieldByName('TINID').AsString;
         dbeTINID.text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', 'CIAID=' + quotedstr(dblcCIA.text) + 'AND TINID=' + quotedstr(dblcTINID.text), 'TINDES');

         DMALM.cdsArti.FieldByName('GRARID').AsString := DMALM.cdsQry8.FieldByName('GRARID').AsString;
         sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + 'AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + '''';
         dbeGrpArti.text := DMALM.DisplayDescrip('prvTGE', 'TGE131', 'GRARDES', sSQL, 'GRARDES');

         DMALM.cdsArti.FieldByName('FAMID').AsString := DMALM.cdsQry8.FieldByName('FAMID').AsString;
         sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + 'AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text);
         dbeFAM.text := DMALM.DisplayDescrip('prvTGE', 'TGE169', 'FAMDES', sSQL, 'FAMDES');

         DMALM.cdsArti.FieldByName('SFAMID').AsString := DMALM.cdsQry8.FieldByName('SFAMID').AsString;
         sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + 'AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text);
         dbeSFAM.text := DMALM.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', sSQL, 'SFAMDES');

         DMALM.cdsArti.FieldByName('CLASEID').AsString := DMALM.cdsQry8.FieldByName('CLASEID').AsString;
         sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + 'AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text) + ' AND CLASEID=' + quotedstr(dblcCLASE.text);
         dbeCLASE.text := DMALM.DisplayDescrip('prvTGE', 'ALM_CLASE_ART', 'CLASEDES', sSQL, 'CLASEDES');

         DMALM.cdsArti.FieldByName('SCLASEID').AsString := DMALM.cdsQry8.FieldByName('SCLASEID').AsString;
         sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + 'AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text) + ' AND CLASEID=' + quotedstr(dblcCLASE.text) + ' AND SCLASEID=' + quotedstr(dblcSCLASE.text);
         dbeSCLASE.text := DMALM.DisplayDescrip('prvTGE', 'ALM_SCLASE_ART', 'SCLASEDES', sSQL, 'SCLASEDES');

         xCrea := False;

// Inicio HPC_201603_ALM
// Se agrega indicador de discontinuo
         DMALM.cdsArti.FieldByName('DISCONTINUO').AsString := 'N';
         dblcContinuidad.text := 'N';
         dblcContinuidad.enabled := false;
// Fin HPC_201603_ALM

//  Fin HPC_201601_ALM

      End
      Else
   End;
   dblcTINID.SetFocus;
// Inicio HPC_201603_ALM
// Se agrega Etiqueta en Formulario
   edtcodeti.text := dblcGrpArti.text+ dblcFAM.text +'-' +xART;
// Fin HPC_201603_ALM

   Screen.Cursor := crDefault;
End;

Procedure TFRegArti.dblcTINIDExit(Sender: TObject);
Begin

   If xCrea Then exit;

   If (Length(dblcTINID.text) <= 0) And (DMALM.cdsTINID.RecordCount > 0) Then
   Begin
      ErrorMsg('Error', 'Debe de escoger un Tipo' + #13 + ' de Inventario');
   End;

// Se restringe la modificación e inserción  del tipo de  inventario
   If ((Length(trim(wTINID)) = 0) And (Not DMALM.VerificaTipInventario(dblcCIA.Text, dblcTINID.Text))) Or
      ((Length(trim(wTINID)) > 0) And (trim(wTINID) <> trim(dblcTINID.Text)) And
      (Not DMALM.VerificaTipInventario(dblcCIA.Text, wTINID))) Then
   Begin
      ErrorMsg('Inventarios', 'El Tipo de Inventario ' + trim(wTINID) + ' está DESHABILITADO');
      dblcTINID.Text := wTINID;
      If (Length(trim(wTINID)) = 0) Then dbeTINID.Text := '';
      dblcTINID.SetFocus;
      exit;
   End;

// Líneas o Grupos
   sSQL := 'select * '
      +    '  from TGE131 '
      +    ' where CIAID=' + quotedstr(dblcCia.text)
      +    '   and TINID=' + quotedstr(dblcTINID.text);
   DMALM.cdsGArti.Close;
   DMALM.cdsGARTI.DataRequest(sSQL);
   DMALM.cdsGArti.Open;
   DMALM.cdsGArti.IndexFieldNames := 'GRARID';
   dblcGrpArti.LookupTable := DMALM.cdsGArti;
   dblcGrpArti.LookupField := 'GRARID';

   If DMALM.cdsArti.FieldByName('TINID').AsString <> xTinven Then
   Begin
      dbeTINID.Text := DMALM.cdsTINID.fieldbyname('TINDES').AsString;
      dblcGrpArti.Text := '';
      dbeGrpArti.Clear;
      dblcFAM.Clear;
      dbeFAM.Clear;
      dblcSUBFAM.Clear;
      dbeSFAM.Clear;
      dbeCtaCon.Text := DMALM.cdsTINID.fieldbyname('CUENTAID').AsString;
//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
      dblcCLASE.Clear;
      dbeCLASE.Clear;
      dblcSCLASE.Clear;
      dbeSCLASE.Clear;
//  Fin HPC_201601_ALM

   End;
End;

Procedure TFRegArti.dblcGrpArtiExit(Sender: TObject);
Begin
   If xCrea Then exit;
   If (Length(dblcGrpArti.text) <= 0) And (DMALM.cdsGArti.RecordCount > 0) Then
   Begin
      ErrorMsg('Error', 'Debe de escoger un ' + #13 + 'Grupo o Línea');
      dblcGrpArti.SETFOCUS;
      exit;
   End;
   dbeFAM.text := '' ;
   dblcFAM.text := '';

   dbeSFAM.text := '' ;
   dblcSUBFAM.text := '';

// Inicio HPC_201601_ALM
// Cambios del Maestro para incluir Clase y SubClase
   dbeCLASE.text := '';
   dblcClase.text := '';
   dbeSCLASE.text := '';
   dblcSClase.text := '';
// Fin HPC_201601_ALM

// Inicio HPC_201603_ALM
// Se agrega Etiqueta en Formulario
   edtcodeti.text := dblcGrpArti.text+ dblcFAM.text + '-' + dbeCodArti.text;
// Fin HPC_201603_ALM

   If dblcGrpArti.Text <> '' Then
   Begin
      sSQL := 'CIAID=' + quotedstr(dblcCIA.text)
         +    ' and GRARID=' + quotedstr(dblcGrpArti.text)
         +    ' and TINID =' + quotedstr(dblcTINID.text);
      dbeGrpArti.text := DMALM.DisplayDescrip('prvTGE', 'TGE131', 'GRARDES', sSQL, 'GRARDES');
      If length(Trim(DMALM.DisplayDescrip('prvTGE', 'TGE131', 'CUENTAID', sSQL, 'CUENTAID'))) > 0 Then
         dbeCtaCon.Text := DMALM.DisplayDescrip('prvTGE', 'TGE131', 'CUENTAID', sSQL, 'CUENTAID'); //DMALM.cdsGArti.fieldbyname('CUENTAID').AsString;
   // Familias
      sSQL := 'Select * '
         +    '  from TGE169 '
         +    ' where CIAID=' + quotedstr(dblcCia.text)
         +    '   and TINID=' + quotedstr(dblcTINID.text)
         +    '   and GRARID=' + quotedstr(dblcGrpArti.text);
      DMALM.cdsFAM.Close;
      DMALM.cdsFAM.DataRequest(sSQL);
      DMALM.cdsFAM.Open;
      DMALM.cdsFAM.IndexFieldNames := 'FAMID';
      dblcFAM.LookupTable := DMALM.cdsFAM;
      dblcFAM.LookupField := 'FAMID';
   End;
End;

Procedure TFRegArti.OnOffCabecera(Value: Boolean);
Begin
  // ....................... activar cabecera de requisición ...................
   pnlCabecera.Enabled := Value;
   tsGeneral.Enabled := Value;
   Z2bbtnCOk.Enabled := Value;
   If value Then
   Begin
      pgArti.Enabled := False;
   End
   Else
      pgArti.Enabled := Value;
End;

Procedure TFRegArti.OnOffDetalle(Value: Boolean);
Begin
  // ....................... activar detalle de requisición ....................

   If value Then
   Begin
      pgArti.Enabled := True;
   End
   Else
      pgArti.Enabled := Value;

   Z2bbtnBorrar.Enabled := Value;
   Z2bbtnOK.Enabled := Value;
   Z2bbtnRegresa.Enabled := value;
   Z2bbtnCanc2.Enabled := value;
   If (Z2bbtnOK.Enabled = true) Or (Z2bbtnCOk.Enabled = true) Then
      Z2bbtnGraba.Enabled := false;
   If (Z2bbtnOK.Enabled = false) And (Z2bbtnCOk.Enabled = false) Then
      Z2bbtnGraba.Enabled := true;
   If (Z2bbtnGraba.Enabled = true) Or (Z2bbtnCOk.Enabled = true) Then
      Z2bbtnNuevo.Enabled := false;
   If (Z2bbtnGraba.Enabled = false) And (Z2bbtnCOk.Enabled = false) Then
      Z2bbtnNuevo.Enabled := true;

End;

Procedure TFRegArti.btnDetalle;
Var
   bDummy1: Boolean;
Begin
   bDummy1 := (DMALM.cdsEArti.RecordCount > 0) Or
      (DMALM.cdsArti.ChangeCount > 0) Or
      (DMALM.cdsArti.Modified) Or
      (DMALM.cdsEArti.ChangeCount > 0) Or
      (DMALM.cdsEArti.Modified) Or
      (DMALM.cdsQArti.ChangeCount > 0) Or
      (DMALM.cdsQArti.Modified);

   Z2bbtnGraba.Enabled := bDummy1;
   Z2bbtnCanc2.Enabled := bDummy1;
   Z2bbtnRegresa.Enabled := bDummy1;
End;

Procedure TFRegArti.Z2bbtnBorrarClick(Sender: TObject);
Begin
   If DMALM.cdsArti.State In [dsInsert, dsEdit] Then
   Begin
      DMALM.cdsArti.FieldByName('TINID').AsString := '';
      DMALM.cdsArti.FieldByName('GRARID').AsString := '';
      DMALM.cdsArti.FieldByName('FAMID').AsString := '';
      DMALM.cdsArti.FieldByName('SFAMID').AsString := '';
//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
      DMALM.cdsArti.FieldByName('CLASEID').AsString := '';
      DMALM.cdsArti.FieldByName('SCLASEID').AsString := '';
//  Fin HPC_201601_ALM
      DMALM.cdsArti.FieldByName('UNMIDG').AsString := '';
      DMALM.cdsArti.FieldByName('ARTDCTG').AsString := 'N';
      dbcbDCTG.Checked := False;
      DMALM.cdsArti.FieldByName('ARTPCG').Value := null;
      DMALM.cdsArti.FieldByName('ARTPVG').Value := null;
      DMALM.cdsArti.FieldByName('ARTCONT').AsFloat := 1;
      DMALM.cdsArti.FieldByName('TMONID').AsString := '';
      DMALM.cdsArti.FieldByName('ARTCRGO').Value := null;
//      DMALM.cdsArti.FieldByName('UNMIDU').AsString := '';
//      DMALM.cdsArti.FieldByName('ARTDCTU').AsString := 'N';
//      dbcbDCTU.Checked := False;
//      DMALM.cdsArti.FieldByName('ARTPCU').AsFloat := 0.00;
//      DMALM.cdsArti.FieldByName('ARTPVU').AsFloat := 0.00;
      DMALM.cdsArti.FieldByName('ARTSPRO').AsString := 'NACIONAL';
      dbrdProcede.ItemIndex := 0;
      DMALM.cdsArti.FieldByName('FABID').asString := '';
      DMALM.cdsArti.FieldByName('ARTPRE').asString := '';
      DMALM.cdsArti.FieldByName('ARTACTIVO').AsString := 'STOCK';
      DMALM.cdsArti.FieldByName('ARTEST').AsString := 'H';
      DMALM.cdsArti.FieldByName('ARTFLAGINC').AsString := 'N';
      DMALM.cdsArti.FieldByName('FNSERIE').AsString := 'N';
      dbcbAFijo.Checked := False;
      dbcbNSerie.Checked := False;
      dbcbInc.Checked := False;
      DMALM.cdsArti.FieldByName('ARTIGV').AsString := 'N';
      dbcbIGV.Checked := false;
      DMALM.cdsArti.FieldByName('ARTPARA').asString := '';
      DMALM.cdsArti.FieldByName('ARTLOTE').asString := '';
      DMALM.cdsArti.FieldByName('ARTNSER').asString := '';
      DMALM.cdsArti.FieldByName('ARTFUC').Value := null;
      DMALM.cdsArti.FieldByName('ARTFUC').Value := null;
      DMALM.cdsArti.FieldByName('CUENTAID').Value := null;
      DMALM.cdsArti.FieldByName('ARTFUC').Value := null;
      DMALM.cdsArti.FieldByName('ARTFUMV').Value := null;
      DMALM.cdsArti.FieldByName('ARTFUPRC').Value := null;
      DMALM.cdsArti.FieldByName('ARTCNTG').Value := null;
      DMALM.cdsArti.FieldByName('ARTCNTU').Value := null;
      DMALM.cdsArti.FieldByName('ARTMNTG').Value := null;
      DMALM.cdsArti.FieldByName('ARTCPROG').Value := null;
      DMALM.cdsArti.FieldByName('ARTCPROU').Value := null;
      DMALM.cdsArti.FieldByName('STKSMAXG').AsFloat := 0.00;
      DMALM.cdsArti.FieldByName('STKSMAXU').AsFloat := 0.00;
      DMALM.cdsArti.FieldByName('STKSMING').AsFloat := 0.00;
      DMALM.cdsArti.FieldByName('STKSMINU').AsFloat := 0.00;
      DMALM.cdsArti.FieldByName('STKSPREG').AsFloat := 0.00;
      DMALM.cdsArti.FieldByName('STKSPREU').AsFloat := 0.00;
      dbeCodBar.text := '';
   End;
End;

Procedure TFRegArti.Z2bbtnOKClick(Sender: TObject);
Var
   sSQL: String;
   xSQL: String; // HPC_201504_ALM
   bMovimiento: Boolean;
Begin

   If Length(Trim(DMALM.cdsArti.FieldByName('TINID').AsString)) = 0 Then
   Begin
      ErrorMsg('Inventarios', 'Falta Tipo de Inventario');
      Exit;
   End;

   If Length(Trim(DMALM.cdsArti.FieldByName('GRARID').AsString)) = 0 Then
   Begin
      ErrorMsg('Inventarios', 'Falta Línea de Producto');
      Exit;
   End;

   If wUrqCia = 'S' Then
      If Length(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) = 0 Then
      Begin
         ErrorMsg('Inventarios', 'Falta Familia');
         Exit;
      End;

   If wUrqCia = 'S' Then
      If Length(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString)) = 0 Then
      Begin
         ErrorMsg('Inventarios', 'Falta Sub - Familia');
         Exit;
      End;

{   If dblcCIA.Text = '04' Then
      If Length(Trim(DMALM.cdsArti.FieldByName('PROV').AsString)) = 0 Then
      Begin
         ErrorMsg('Inventarios', 'Es Necesario que Ingrese el Proveedor');
         Exit;
      End;
}
   If Not fg_ValidaIgvArticulo Then
   Begin
      Exit;
   End;

   xSQL := 'Select * '
      +    '  from TGE205 '
      +    ' where CIAID=' + quotedstr(DMALM.cdsArti.FieldByName('CIAID').AsString)
      +    '   and ARTID=' + quotedStr(DMALM.cdsArti.FieldByName('ARTID').AsString);
   DMALM.cdsQry8.Close;
   DMALM.cdsQry8.DataRequest(xSQL);
   DMALM.cdsQry8.Open;

   If (DMALM.cdsQry8.Recordcount > 0) Then
   Begin
   // Si se trata de Desactivar un Activo Fijo
      If (Trim(DMALM.cdsQry8.FieldByName('ARTACTIVO').AsString) = 'ACTIVO') And (dbcbEst.Checked = False) Then
      Begin

         If (DMALM.cdsQry8.FieldByName('ARTCNTG').AsFloat) > 0 Then
         Begin
            ErrorMsg('Inventarios', 'Activo No se puede desactivar mientras exista Stock ');
            dbcbEst.Checked := True;
            Exit;
         End;

         xSQL := 'Select * '
            +    '  from LOG332 '
            +    ' where CIAID=' + quotedstr(DMALM.cdsArti.FieldByName('CIAID').AsString)
            +    '   and ARTID=' + quotedStr(DMALM.cdsArti.FieldByName('ARTID').AsString)
            +    '   and ESTADOID NOT IN ( ''A'') ';
         DMALM.cdsQry6.Close;
         DMALM.cdsQry6.DataRequest(xSQL);
         DMALM.cdsQry6.Open;
         If (DMALM.cdsQry6.Recordcount > 0) Then
         Begin
            ErrorMsg('Error', 'existen registros para traslados, verifique!');
            dbcbEst.Checked := True;
            exit;
         End;

      End;
   End;

   If DMALM.cdsArti.State In [dsInsert, dsEdit] Then
   Try
      Screen.Cursor := crHourGlass;

      If (DMALM.wModo = 'M') And (VerificaCambios) Then
      Begin
         sSQL := 'Select STKFIN MOVI '
            +    '  from LOG319 '
            +    ' where CIAID=' + quotedstr(DMALM.cdsArti.FieldByName('CIAID').AsString)
            +    '   and ARTID=' + quotedStr(DMALM.cdsArti.FieldByName('ARTID').AsString);
         {
         sSQL := 'SELECT STKANO, ARTID, SUM(' + DMALM.wReplacCeros + '(STKISG01,0)+' + DMALM.wReplacCeros + '(STKSSG01,0)+' + DMALM.wReplacCeros + '(STKISG02,0)+' +
            '' + DMALM.wReplacCeros + '(STKSSG02,0)+' + DMALM.wReplacCeros + '(STKISG03,0)+' + DMALM.wReplacCeros + '(STKSSG03,0)+' + DMALM.wReplacCeros + '(STKISG04,0)+' +
            '' + DMALM.wReplacCeros + '(STKSSG04,0)+' + DMALM.wReplacCeros + '(STKISG05,0)+' + DMALM.wReplacCeros + '(STKSSG05,0)+' + DMALM.wReplacCeros + '(STKISG06,0)+' +
            '' + DMALM.wReplacCeros + '(STKSSG06,0)+' + DMALM.wReplacCeros + '(STKISG07,0)+' + DMALM.wReplacCeros + '(STKSSG07,0)+' + DMALM.wReplacCeros + '(STKISG08,0)+' +
            '' + DMALM.wReplacCeros + '(STKSSG08,0)+' + DMALM.wReplacCeros + '(STKISG09,0)+' + DMALM.wReplacCeros + '(STKSSG09,0)+' + DMALM.wReplacCeros + '(STKISG10,0)+' +
            '' + DMALM.wReplacCeros + '(STKSSG10,0)+' + DMALM.wReplacCeros + '(STKISG11,0)+' + DMALM.wReplacCeros + '(STKSSG11,0)+' + DMALM.wReplacCeros + '(STKISG12,0)+' +
            '' + DMALM.wReplacCeros + '(STKSSG12,0)+' + DMALM.wReplacCeros + '(STKISU01,0)+' + DMALM.wReplacCeros + '(STKSSU01,0)+' +
            '' + DMALM.wReplacCeros + '(STKISU02,0)+' + DMALM.wReplacCeros + '(STKSSU02,0)+' + DMALM.wReplacCeros + '(STKISU03,0)+' + DMALM.wReplacCeros + '(STKSSU03,0)+' +
            '' + DMALM.wReplacCeros + '(STKISU04,0)+' + DMALM.wReplacCeros + '(STKSSU04,0)+' + DMALM.wReplacCeros + '(STKISU05,0)+' + DMALM.wReplacCeros + '(STKSSU05,0)+' +
            '' + DMALM.wReplacCeros + '(STKISU06,0)+' + DMALM.wReplacCeros + '(STKSSU06,0)+' + DMALM.wReplacCeros + '(STKISU07,0)+' + DMALM.wReplacCeros + '(STKSSU07,0)+' +
            '' + DMALM.wReplacCeros + '(STKISU08,0)+' + DMALM.wReplacCeros + '(STKSSU08,0)+' + DMALM.wReplacCeros + '(STKISU09,0)+' + DMALM.wReplacCeros + '(STKSSU09,0)+' +
            '' + DMALM.wReplacCeros + '(STKISU10,0)+' + DMALM.wReplacCeros + '(STKSSU10,0)+' + DMALM.wReplacCeros + '(STKISU11,0)+' + DMALM.wReplacCeros + '(STKSSU11,0)+' +
            '' + DMALM.wReplacCeros + '(STKISU12,0)+' + DMALM.wReplacCeros + '(STKSSU12,0)) MOVI ' +
            'FROM LOG316 ' +
            'WHERE ARTID=' + QuotedStr(DMALM.cdsArti.FieldByName('ARTID').AsString) + ' ' +
            'GROUP BY STKANO, ARTID ORDER BY STKANO DESC';
         }
         DMALM.cdsQry5.Close;
         DMALM.cdsQry5.DataRequest(sSQL);
         DMALM.cdsQry5.Open;
         DMALM.cdsQry5.First;
         bMovimiento := (DMALM.cdsQry5.recordcount > 0);
         {
         If (Not bMovimiento) And (DMALM.cdsQry5.recordcount > 1) Then
         Begin
            DMALM.cdsQry5.Next;
            bMovimiento := (DMALM.cdsQry5.FieldByName('MOVI').AsFloat > 0);
         End;
         }
         If bMovimiento Then
         Begin
            screen.Cursor := crdefault;
            Raise Exception.Create('No se puede modificar el artículo, por tener movimientos');
         End;
      End;

//      DMALM.cdsArti.FieldByName('DISCONTINUO').AsString := 'N';
      DMALM.cdsArti.FieldByName('ARTCONT').AsString := '1';

//      If dbcbDCTU.Checked = false Then
//         DMALM.cdsArti.FieldByName('ARTDCTU').AsString := 'N';
      If DMALM.cdsArti.FieldByName('ARTACTIVO').IsNull Then
         DMALM.cdsArti.FieldByName('ARTACTIVO').AsString := 'STOCK';

      If DMALM.cdsArti.FieldByName('ARTEST').IsNull Then
         DMALM.cdsArti.FieldByName('ARTEST').AsString := 'H';

      If DMALM.cdsArti.FieldByName('ARTFLAGINC').IsNull Then
         DMALM.cdsArti.FieldByName('ARTFLAGINC').AsString := 'N';

      If DMALM.cdsArti.FieldByName('FNSERIE').IsNull Then
         DMALM.cdsArti.FieldByName('FNSERIE').AsString := 'N';

      If DMALM.cdsArti.FieldByName('ARTDCTG').IsNull Then
         DMALM.cdsArti.FieldByName('ARTDCTG').AsString := 'N';
      If DMALM.cdsArti.FieldByName('ARTDCTU').IsNull Then
         DMALM.cdsArti.FieldByName('ARTDCTU').AsString := 'N';
      If DMALM.cdsArti.FieldByName('ARTIGV').IsNull Then
         DMALM.cdsArti.FieldByName('ARTIGV').AsString := 'N';

      If chkCRITICO.Checked Then
         DMALM.cdsArti.FieldByName('CRITICO').AsString := 'S'
      Else
         DMALM.cdsArti.FieldByName('CRITICO').AsString := 'N';

   // Inicio HPC_201604_ALM
   // define valor de campo FLAGVAR para indicar si es Precio Editable o no
      if cbEditaPrecio.Checked then
         DMALM.cdsArti.FieldByName('FLAGVAR').AsString := 'E'
      else
         DMALM.cdsArti.FieldByName('FLAGVAR').AsString := '';

      pgEstado := True; // puede cambiar de pagina
   //   DMALM.cdsPost(DMALM.cdsArti);
      DMALM.cdsArti.Post;
   // Fin HPC_201604_ALM

      OnOffDetalle(False); //Desactivar el panel de detalle
      btnDetalle;

      pgArti.Enabled := True;
      If (DMALM.cdsArti.ChangeCount = 0) And (Not DMALM.cdsArti.Modified) Then
      Begin
         Z2bbtnCanc2.Enabled := True;
         Z2bbtnCOk.Enabled := true;
         pnlCabecera.Enabled := True;
      End;
      Screen.Cursor := CrDefault;
   Except
      On E: Exception Do
         If Not EHandlerError(E) Then Raise;
   End;
End;

Procedure TFRegArti.Z2bbtnRegresaClick(Sender: TObject);
Begin
   DMALM.cdsArti.Edit;
   OnOffCabecera(True);
   OnOffDetalle(False);

   If DMALM.cdsCIA.RecordCount > 1 Then
      If dblcCIA.Enabled = true Then
         dblcCIA.SetFocus
      Else
         If dbeCodArti.Enabled Then
            dbeCodArti.SetFocus
         Else
            If dbeDescrip.Enabled Then
               dbeDescrip.SetFocus
            Else
               dbeAbrev.SetFocus;

   pgArti.ActivePage := tsGeneral;

End;

Procedure TFRegArti.Z2bbtnCanc2Click(Sender: TObject);
Begin
   CancelaNuevo;
   Close;
End;

Procedure TFRegArti.Z2bbtnGrabaClick(Sender: TObject);
Var
   sSQL, xArt, xWhere: String;
   bFlag: boolean;
Begin
// Inicio HPC_201604_ALM
// Fuerza a que se ejecute boton Z2bbtnOK
   if Z2bbtnOK.Enabled then
      Z2bbtnOKClick(Sender);
// Fin HPC_201603_ALM

   bFlag := false;

   If Not fg_ValidaIgvArticulo Then
   Begin
      Exit;
   End;
   Try
      Screen.Cursor := CrHourGlass;
      sSQL := 'SELECT * FROM TGE205 WHERE ARTID=''' + dbeCodArti.Text + '''';
      DMALM.cdsArti.DataRequest(sSQl);

      DMALM.DCOM1.AppServer.IniciaTransaccion;
      If DMALM.wModo <> 'M' Then
      Begin
// Inicio HPC_201603_ALM
// Se agrega indicador de discontinuo
         sSQL := 'Insert into TGE205(CIAID, TINID, ARTID, GRARID, FAMID, SFAMID, ARTDES, ARTABR, UNMIDG, ARTCONT, '
            + '                      FABID, ARTSPRO, ARTPCU, ARTPCG, ARTPVU, ARTPVG, ARTFUC, TMONID, ARTACTIVO, '
            + '                      ARTCNTG, ARTCNTU, ARTMNTG, ARTMNTU, ARTCPROU, ARTCPROG, ARTFUPRC, ARTNSER, '
            + '                      ARTFVEN, ARTDCTG, ARTDCTU, ARTLOTE, ARTIGV, ARTFUMV, CCUSER, CCFREG, CCHREG, '
            + '                      ARTISC, ARTVENTA, ARTFADQ, STKSMAX, STKSMIN, STKSPRE, STKSCPE, ARTCVIDA, FNSERIE, '
            + '                      FLAGVAR, PROVUFMOV, ARTEST, ARTCOMVTA, ARTFLAGINC,  MARCA, MODELO, COLOR, TIPART, '
            + '                      PROV, CARART, OBSEQUIO, CONCESION, COSTOANT, CONSIGNACION,  ART_IGV_EXO, CRITICO, '
            + '                      FLGSERV, CLASEID, SCLASEID, DISCONTINUO)'
            + '   Values('
            +            quotedstr(DMALM.cdsArti.FieldByName('CIAID').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('TINID').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTID').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('GRARID').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('FAMID').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('SFAMID').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTDES').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTABR').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('UNMIDG').AsString)+','
            +            inttostr(1)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('FABID').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTSPRO').AsString)+','
            +            inttostr(0)+','
            +            floattostr(DMALM.cdsArti.FieldByName('ARTPCG').Asfloat)+','
            +            inttostr(0)+','
            +            floattostr(DMALM.cdsArti.FieldByName('ARTPVG').Asfloat)+','
            +            quotedstr(datetostr(DMALM.cdsArti.FieldByName('ARTFUC').AsDateTime))+','
            +            quotedstr(DMALM.cdsArti.FieldByName('TMONID').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTACTIVO').AsString)+','
            +            inttostr(DMALM.cdsArti.FieldByName('ARTCNTG').AsInteger)+','
            +            inttostr(0)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTMNTG').AsString)+','
            +            inttostr(0)+','
            +            inttostr(0)+','
            +            floattostr(DMALM.cdsArti.FieldByName('ARTCPROG').Asfloat)+','
            +            quotedstr(datetostr(DMALM.cdsArti.FieldByName('ARTFUPRC').AsDateTime))+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTNSER').AsString)+','
            +            quotedstr(datetostr(DMALM.cdsArti.FieldByName('ARTFVEN').AsDateTime))+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTDCTG').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTDCTU').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTLOTE').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTIGV').AsString)+','
            +            quotedstr(datetostr(DMALM.cdsArti.FieldByName('ARTFUMV').AsDateTime))+','
            +            quotedstr(DMALM.cdsArti.FieldByName('CCUSER').AsString)+','
            +            ' trunc(sysdate),'
            +            ' sysdate,'
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTISC').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTVENTA').AsString)+','
            +            quotedstr(datetostr(DMALM.cdsArti.FieldByName('ARTFADQ').AsDateTime))+','
            +            floattostr(DMALM.cdsArti.FieldByName('STKSMAX').Asfloat)+','
            +            floattostr(DMALM.cdsArti.FieldByName('STKSMIN').Asfloat)+','
            +            floattostr(DMALM.cdsArti.FieldByName('STKSPRE').Asfloat)+','
            +            floattostr(DMALM.cdsArti.FieldByName('STKSCPE').Asfloat)+','
            +            floattostr(DMALM.cdsArti.FieldByName('ARTCVIDA').Asfloat)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('FNSERIE').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('FLAGVAR').AsString)+','
            +            quotedstr(datetostr(DMALM.cdsArti.FieldByName('PROVUFMOV').AsDateTime))+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTEST').AsString)+','
            +            floattostr(DMALM.cdsArti.FieldByName('ARTCOMVTA').Asfloat)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ARTFLAGINC').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('MARCA').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('MODELO').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('COLOR').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('TIPART').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('PROV').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('CARART').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('OBSEQUIO').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('CONCESION').AsString)+','
            +            floattostr(DMALM.cdsArti.FieldByName('COSTOANT').Asfloat)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('CONSIGNACION').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('ART_IGV_EXO').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('CRITICO').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('FLGSERV').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('CLASEID').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('SCLASEID').AsString)+','
            +            quotedstr(DMALM.cdsArti.FieldByName('DISCONTINUO').AsString)+')'
      End
      Else
      Begin
         sSQL := 'Update TGE205 '
            + '      Set TINID= '   +quotedstr(DMALM.cdsArti.FieldByName('TINID').AsString)+','
            + '          GRARID= '  +quotedstr(DMALM.cdsArti.FieldByName('GRARID').AsString)+','
            + '          FAMID= '   +quotedstr(DMALM.cdsArti.FieldByName('FAMID').AsString)+','
            + '          SFAMID= '  +quotedstr(DMALM.cdsArti.FieldByName('SFAMID').AsString)+','
            + '          ARTDES= '  +quotedstr(DMALM.cdsArti.FieldByName('ARTDES').AsString)+','
            + '          ARTABR= '  +quotedstr(DMALM.cdsArti.FieldByName('ARTABR').AsString)+','
            + '          UNMIDG= '  +quotedstr(DMALM.cdsArti.FieldByName('UNMIDG').AsString)+','
            + '          ARTCONT= ' +inttostr(1)+','
            + '          FABID= '   +quotedstr(DMALM.cdsArti.FieldByName('FABID').AsString)+','
            + '          ARTSPRO= ' +quotedstr(DMALM.cdsArti.FieldByName('ARTSPRO').AsString)+','
            + '          ARTPCU= '  +inttostr(0)+','
            + '          ARTPCG= '  +floattostr(DMALM.cdsArti.FieldByName('ARTPCG').Asfloat)+','
            + '          ARTPVU= '  +inttostr(0)+','
            + '          ARTPVG= '  +floattostr(DMALM.cdsArti.FieldByName('ARTPVG').Asfloat)+','
            + '          ARTFUC= '  +quotedstr(datetostr(DMALM.cdsArti.FieldByName('ARTFUC').AsDateTime))+','
            + '          TMONID= '  +quotedstr(DMALM.cdsArti.FieldByName('TMONID').AsString)+','
            + '          ARTACTIVO= ' +quotedstr(DMALM.cdsArti.FieldByName('ARTACTIVO').AsString)+','
            + '          ARTCNTG= ' +  inttostr(DMALM.cdsArti.FieldByName('ARTCNTG').AsInteger)+','
            + '          ARTCNTU= ' +  inttostr(0)+','
            + '          ARTMNTG= ' +  quotedstr(DMALM.cdsArti.FieldByName('ARTMNTG').AsString)+','
            + '          ARTMNTU= ' +  inttostr(0)+','
            + '          ARTCPROU= ' + inttostr(0)+','
            + '          ARTCPROG= ' + floattostr(DMALM.cdsArti.FieldByName('ARTCPROG').Asfloat)+','
            + '          ARTFUPRC= ' + quotedstr(datetostr(DMALM.cdsArti.FieldByName('ARTFUPRC').AsDateTime))+','
            + '          ARTNSER= '  + quotedstr(DMALM.cdsArti.FieldByName('ARTNSER').AsString)+','
            + '          ARTFVEN= '  + quotedstr(datetostr(DMALM.cdsArti.FieldByName('ARTFVEN').AsDateTime))+','
            + '          ARTDCTG= '  + quotedstr(DMALM.cdsArti.FieldByName('ARTDCTG').AsString)+','
            + '          ARTDCTU= '  + quotedstr(DMALM.cdsArti.FieldByName('ARTDCTU').AsString)+','
            + '          ARTLOTE= '  + quotedstr(DMALM.cdsArti.FieldByName('ARTLOTE').AsString)+','
            + '          ARTIGV= '   + quotedstr(DMALM.cdsArti.FieldByName('ARTIGV').AsString)+','
            + '          ARTFUMV= '  + quotedstr(datetostr(DMALM.cdsArti.FieldByName('ARTFUMV').AsDateTime))+','
            + '          CCUSER= '   + quotedstr(DMALM.cdsArti.FieldByName('CCUSER').AsString)+','
            + '          CCFREG= '   + ' trunc(sysdate),'
            + '          CCHREG= '   + ' sysdate,'
            + '          ARTISC= '   + quotedstr(DMALM.cdsArti.FieldByName('ARTISC').AsString)+','
            + '          ARTVENTA= ' + quotedstr(DMALM.cdsArti.FieldByName('ARTVENTA').AsString)+','
            + '          ARTFADQ= '  + quotedstr(datetostr(DMALM.cdsArti.FieldByName('ARTFADQ').AsDateTime))+','
            + '          STKSMAX= '  + floattostr(DMALM.cdsArti.FieldByName('STKSMAX').Asfloat)+','
            + '          STKSMIN= '  + floattostr(DMALM.cdsArti.FieldByName('STKSMIN').Asfloat)+','
            + '          STKSPRE= '  + floattostr(DMALM.cdsArti.FieldByName('STKSPRE').Asfloat)+','
            + '          STKSCPE= '  + floattostr(DMALM.cdsArti.FieldByName('STKSCPE').Asfloat)+','
            + '          ARTCVIDA= ' + floattostr(DMALM.cdsArti.FieldByName('ARTCVIDA').Asfloat)+','
            + '          FNSERIE= '  + quotedstr(DMALM.cdsArti.FieldByName('FNSERIE').AsString)+','
            + '          FLAGVAR= '  + quotedstr(DMALM.cdsArti.FieldByName('FLAGVAR').AsString)+','
            + '          PROVUFMOV= ' + quotedstr(datetostr(DMALM.cdsArti.FieldByName('PROVUFMOV').AsDateTime))+','
            + '          ARTEST= '    + quotedstr(DMALM.cdsArti.FieldByName('ARTEST').AsString)+','
            + '          ARTCOMVTA= ' + floattostr(DMALM.cdsArti.FieldByName('ARTCOMVTA').Asfloat)+','
            + '          ARTFLAGINC= ' + quotedstr(DMALM.cdsArti.FieldByName('ARTFLAGINC').AsString)+','
            + '          MARCA= '    + quotedstr(DMALM.cdsArti.FieldByName('MARCA').AsString)+','
            + '          MODELO= '   + quotedstr(DMALM.cdsArti.FieldByName('MODELO').AsString)+','
            + '          COLOR= '    + quotedstr(DMALM.cdsArti.FieldByName('COLOR').AsString)+','
            + '          TIPART= '   + quotedstr(DMALM.cdsArti.FieldByName('TIPART').AsString)+','
            + '          PROV= '     + quotedstr(DMALM.cdsArti.FieldByName('PROV').AsString)+','
            + '          CARART= '   + quotedstr(DMALM.cdsArti.FieldByName('CARART').AsString)+','
            + '          OBSEQUIO= ' + quotedstr(DMALM.cdsArti.FieldByName('OBSEQUIO').AsString)+','
            + '          CONCESION= ' + quotedstr(DMALM.cdsArti.FieldByName('CONCESION').AsString)+','
            + '          COSTOANT= '  + floattostr(DMALM.cdsArti.FieldByName('COSTOANT').Asfloat)+','
            + '          CONSIGNACION= ' + quotedstr(DMALM.cdsArti.FieldByName('CONSIGNACION').AsString)+','
            + '          ART_IGV_EXO= ' + quotedstr(DMALM.cdsArti.FieldByName('ART_IGV_EXO').AsString)+','
            + '          CRITICO= '  + quotedstr(DMALM.cdsArti.FieldByName('CRITICO').AsString)+','
            + '          FLGSERV= '  + quotedstr(DMALM.cdsArti.FieldByName('FLGSERV').AsString)+','
            + '          CLASEID= '  + quotedstr(DMALM.cdsArti.FieldByName('CLASEID').AsString)+','
            + '          SCLASEID= '    + quotedstr(DMALM.cdsArti.FieldByName('SCLASEID').AsString)+','
            + '          DISCONTINUO= ' + quotedstr(DMALM.cdsArti.FieldByName('DISCONTINUO').AsString)
            + '    where CIAID=' + quotedstr(DMALM.cdsArti.FieldByName('CIAID').AsString)
            + '      and ARTID=' + quotedstr(DMALM.cdsArti.FieldByName('ARTID').AsString);
// Fin HPC_201603_ALM
      End;
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         ShowMessage('No se pudo actualizar el Maestro de Artículos');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

   // Inicio HPC_201604_ALM
   // Actualiza Componentes
   // borra de la tabla física Componentes anteriormente grabados
      sSQL := 'Select CIAID, TINID, ARTID, EARTID, EARTDES, EARTABR '
         +    '  from TGE206 '
         +    ' where CIAID=' + quotedstr(DMALM.cdsArti.FieldByName('CIAID').AsString)
         +    '   and ARTID=' + quotedstr(DMALM.cdsArti.FieldByName('ARTID').AsString);
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(sSQL);
      DMALM.cdsQry.Open;
      if DMALM.cdsQry.RecordCount>0 then
      Begin
         sSQL := 'Delete from TGE206 '
            +    ' where CIAID=' + quotedstr(DMALM.cdsArti.FieldByName('CIAID').AsString)
            +    '   and ARTID=' + quotedstr(DMALM.cdsArti.FieldByName('ARTID').AsString);
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except
            ShowMessage('No se pudo eliminar los componentes antes de actualizar');
            DMALM.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      End;

      If DMALM.cdsEARTI.RecordCount>0 then
      Begin
         DMALM.cdsEARTI.First;
         While not DMALM.cdsEARTI.EOF do
         Begin
            xSQL := 'Insert into TGE206(CIAID, TINID, ARTID, EARTID, EARTDES, EARTABR) '
               + '   Values('+quotedstr(DMALM.cdsEARTI.FieldByName('CIAID').AsString)+','
               +              quotedstr(DMALM.cdsEARTI.FieldByName('TINID').AsString)+','
               +              quotedstr(DMALM.cdsEARTI.FieldByName('ARTID').AsString)+','
               +              quotedstr(DMALM.cdsEARTI.FieldByName('EARTID').AsString)+','
               +              quotedstr(DMALM.cdsEARTI.FieldByName('EARTDES').AsString)+','
               +              quotedstr(DMALM.cdsEARTI.FieldByName('EARTABR').AsString)+')';
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               ShowMessage('No se pudo actualizar los Componentes');
               DMALM.DCOM1.AppServer.RetornaTransaccion;
               exit;
            End;
         End;
      End;

   // Actualiza Equivalentes
   // borra de la tabla física Componentes anteriormente grabados
      sSQL := 'Select CIAID, TINID, ARTID, QARTID, QARTDES, QARTABR '
         +    '  from TGE207 '
         +    ' where CIAID=' + quotedstr(DMALM.cdsArti.FieldByName('CIAID').AsString)
         +    '   and ARTID=' + quotedstr(DMALM.cdsArti.FieldByName('ARTID').AsString);
      DMALM.cdsQry.Close;
      DMALM.cdsQry.DataRequest(sSQL);
      DMALM.cdsQry.Open;
      if DMALM.cdsQry.RecordCount>0 then
      Begin
         sSQL := 'Delete from TGE207 '
            +    ' where CIAID=' + quotedstr(DMALM.cdsArti.FieldByName('CIAID').AsString)
            +    '   and ARTID=' + quotedstr(DMALM.cdsArti.FieldByName('ARTID').AsString);
         Try
            DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except
            ShowMessage('No se pudo eliminar los Equivalentes antes de actualizar');
            DMALM.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      End;

      If DMALM.cdsQARTI.RecordCount>0 then
      Begin
         DMALM.cdsQARTI.First;
         While not DMALM.cdsEARTI.EOF do
         Begin
            xSQL := 'Insert into TGE207(CIAID, TINID, ARTID, QARTID, QARTDES, QARTABR) '
               + '   Values('+quotedstr(DMALM.cdsQARTI.FieldByName('CIAID').AsString)+','
               +              quotedstr(DMALM.cdsQARTI.FieldByName('TINID').AsString)+','
               +              quotedstr(DMALM.cdsQARTI.FieldByName('ARTID').AsString)+','
               +              quotedstr(DMALM.cdsQARTI.FieldByName('QARTID').AsString)+','
               +              quotedstr(DMALM.cdsQARTI.FieldByName('QARTDES').AsString)+','
               +              quotedstr(DMALM.cdsQARTI.FieldByName('QARTABR').AsString)+')';
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               ShowMessage('No se pudo actualizar los artículos Equivalentes');
               DMALM.DCOM1.AppServer.RetornaTransaccion;
               exit;
            End;
         End;
      End;

      // DMALM.ControlTran(9, DMALM.cdsEArti, 'EARTI');
      // DMALM.ControlTran(9, DMALM.cdsQArti, 'QARTI');
   // Fin HPC_201604_ALM

      DMALM.DCOM1.AppServer.GrabaTransaccion;
      DMALM.wModo := 'M';

      If DMALM.wTipoAdicion = 'xFiltro' Then
      Begin
         DMALM.ActualizaFiltro(Mtx2000, DMALM.cdsArti, DMALM.wModo);
      End;

      If DMALM.wModo = 'M' Then
      Begin
         If (xDesArt <> Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) Or
            (xIdFam <> Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) Or
            (xIdSfam <> Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString)) Then
         Begin
            sSQL := 'Update FAC201 '
               +    '   set ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ', '
               +    '       FAMID  = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', '
               +    '       SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString)) + ' '
               +    ' where CIAID =' + quotedstr(dblcCIA.Text)
               +    '   and TINID =' + quotedstr(dblcTINID.Text)
               +    '   and ARTID =' + quotedstr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               xWhere := ' CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
               xArt := DMALM.DisplayDescrip('prvTGE', 'FAC201', 'ARTID', xWhere, 'ARTID');
               If length(Trim(xArt)) > 0 Then
                  Information(Caption, 'Es necesario que vuelva a Grabar' + #13'No se Actualizaron los Datos en la Lista Precios');
            End;

            sSQL := 'Update FAC302 '
               +    '   set ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ', '
               +    '       FAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', '
               +    '       SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString)) + ' '
               +    ' where CIAID=' + QuotedStr(dblcCIA.Text)
               +    '   and TINID=' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID=' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'Update FAC304 '
               +    '   set ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ', '
               +    '       FAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', '
               +    '       SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString)) + ' '
               +    ' where CIAID = ' + QuotedStr(dblcCIA.Text)
               +    '   and TINID = ' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID = ' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'Update FAC306 '
               +    '   set ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ', '
               +    '       FAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', '
               +    '       SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString)) + ' '
               +    ' where CIAID = ' + QuotedStr(dblcCIA.Text)
               +    '   and TINID = ' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID = ' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'Update FAC310 '
               +    '   set ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString))
               +    ' where CIAID = ' + QuotedStr(dblcCIA.Text)
               +    '   and TINID = ' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID = ' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'Update FAC312 '
               +    '   set ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ', '
               +    '       FAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', '
               +    '       SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString)) + ' '
               +    ' where CIAID = ' + QuotedStr(dblcCIA.Text)
               +    '   and TINID = ' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID = ' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'Update LOG303 '
               +    '   set FAMID  = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', '
               +    '       SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString))
               +    ' where CIAID = ' + QuotedStr(dblcCIA.Text)
               +    '   and TINID = ' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID = ' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'Update LOG305 '
               +    '   set FAMID  = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', '
               +    '       SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString))
               +    ' where CIAID = ' + QuotedStr(dblcCIA.Text)
               +    '   and TINID = ' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID = ' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'Update LOG307 '
               +    '   set FAMID  = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', '
               +    '       SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString)) + ', '
               +    '       SFAMDES= ' + QuotedStr(Trim(dbeSFAM.Text))
               +    ' where CIAID = ' + QuotedStr(dblcCIA.Text)
               +    '   and TINID = ' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID = ' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'Update LOG309 '
               +    '   set FAMID  = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', '
               +    '       SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString)) + ' '
               +    ' where CIAID = ' + QuotedStr(dblcCIA.Text)
               +    '   and TINID = ' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID = ' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'Update LOG313 '
               +    '   set FAMID  = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', '
               +    '       SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString))
               +    ' where CIAID = ' + QuotedStr(dblcCIA.Text)
               +    '   and TINID = ' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID = ' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'Update LOG315 '
               +    '   set ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ', '
               +    '       FAMID  = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', '
               +    '       SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString))
               +    ' where CIAID = ' + QuotedStr(dblcCIA.Text)
               +    '   and TINID = ' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID = ' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'Update LOG316 '
               +    '   set ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString))
               +    ' where CIAID = ' + QuotedStr(dblcCIA.Text)
               +    '   and TINID = ' + QuotedStr(dblcTINID.Text)
               +    '   and ARTID = ' + QuotedStr(dbeCodArti.Text);
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               xWhere := ' CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
               xArt := DMALM.DisplayDescrip('prvTGE', 'LOG316', 'ARTID', xWhere, 'ARTID');
               If length(Trim(xArt)) > 0 Then
                  Information(Caption, 'Es necesario que vuelva a Grabar' + #13'No se Actualizaron los Datos en el Kardex');
            End;

            sSQL := 'UPDATE LOG320 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG323 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG326 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG327 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ', ' +
               'FAMID  = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except

            End;
            sSQL := 'UPDATE LOG328 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ', ' +
               'FAMID  = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE TGE206 SET ' +
               'EARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND EARTID=''' + dbeCodArti.Text + '''';
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE TGE207 SET ' +
               'QARTDES = ' + QuotedStr(Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND QARTID=''' + dbeCodArti.Text + '''';
            Try
               DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;
         End;
      End;
      xDesArt := Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString);
      xIdFam := Trim(DMALM.cdsArti.FieldByName('FAMID').AsString);
      xIdSfam := Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString);
//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
      xIdClase := Trim(DMALM.cdsArti.FieldByName('CLASEID').AsString);
      xIdSclase := Trim(DMALM.cdsArti.FieldByName('SCLASEID').AsString);
//  Fin HPC_201601_ALM
      pgEstado := True;
      pgArti.ActivePage := tsGeneral;
      onoffdetalle(False);
      btnDetalle;
      Z2bbtnNuevo.Enabled := true;
      Z2bbtnCOk.Enabled := true;
      Z2bbtnGraba.Enabled := false;
      pnlCabecera.Enabled := True;
   Finally
      Screen.Cursor := CrDefault;

   End;
End;

Procedure TFRegArti.Z2bbtnNuevoClick(Sender: TObject);
Begin
   DMALM.wModo := 'A';
   dbrdProcede.ItemIndex := 0; { inicializo el Radio a Nacional}
   dbeTINID.Text := '';
   dbeFAM.Text := '';
   dbeSFAM.Text := '';
   dbeUMedG.Text := '';
//   dbeUMedU.Text := '';
   dbeGrpArti.Text := '';
   dbeCIA.Text := '';
   dbeTMoneda.Text := '';
   dbeFAB.Text := '';
   edtDiasSMov.Text := '';
   xDesArt := '';
   xIdFam := '';
   xIdSfam := '';
// Inicio HPC_201601_ALM
// Cambios del Maestro para incluir Clase y SubClase
   xIdClase := '';
   xIdSClase := '';
// Fin HPC_201601_ALM

   OnOffCabecera(True);
   OnOffDetalle(False);

   dblcCIA.Enabled := True;
   dbeCodArti.Enabled := True;
   If DMALM.cdsArti.State <> dsInsert Then
      DMALM.cdsArti.Insert;
   DMALM.cdsArti.FieldByName('ARTCONT').Value := 1;
   DMALM.cdsArti.FieldByName('ARTSPRO').AsString := 'NACIONAL';
   DMALM.cdsArti.FieldByName('ARTFADQ').AsDateTime := Now;
   {inicializo a 0.00 los datos de parametro de reposición}
   DMALM.cdsArti.FieldByName('ARTCNTG').value := 0.00;
   DMALM.cdsArti.FieldByName('ARTCNTU').value := 0.00;
   DMALM.cdsArti.FieldByName('ARTMNTG').value := 0.00;
   DMALM.cdsArti.FieldByName('ARTMNTU').value := 0.00;
   DMALM.cdsArti.FieldByName('ARTCPROG').value := 0.00;
   DMALM.cdsArti.FieldByName('ARTCPROU').value := 0.00;
   DMALM.cdsArti.FieldByName('ARTPCG').value := 0.00;
   DMALM.cdsArti.FieldByName('ARTPCU').value := 0.00;
   DMALM.cdsArti.FieldByName('ARTPVG').value := 0.00;
   DMALM.cdsArti.FieldByName('ARTPVU').value := 0.00;

   DMALM.cdsArti.FieldByName('ARTACTIVO').AsString := 'STOCK';
   DMALM.cdsArti.FieldByName('FNSERIE').AsString := 'N';
   DMALM.cdsArti.FieldByName('ARTEST').AsString := 'H';
   DMALM.cdsArti.FieldByName('ARTFLAGINC').AsString := 'N';
   DMALM.cdsArti.FieldByName('OBSEQUIO').AsString := 'N';
   DMALM.cdsArti.FieldByName('CONSIGNACION').AsString := 'N';
   DMALM.cdsArti.FieldByName('UNMIDG').AsString := DMALM.DisplayDescrip('prvSQL', 'TGE130', 'UNMID', 'UNMSERV=''S''', 'UNMID');
   dblcUMedGExit(dblcUMedG);

   dbcbAFijo.Checked := False;
   dbcbNSerie.Checked := False;
   dbcbInc.Checked := False;

   DMALM.cdsArti.FieldByName('STKSMAX').AsFloat := 0.00;
   DMALM.cdsArti.FieldByName('STKSMIN').AsFloat := 0.00;
   DMALM.cdsArti.FieldByName('STKSPRE').AsFloat := 0.00;
   DMALM.cdsArti.FieldByName('STKSCPE').AsFloat := 0.00;

   pgEstado := False;
   CargaUsuario;
   If DMALM.cdsCIA.RecordCount > 1 Then
      dblcCIA.SetFocus
   Else
   Begin
      DMALM.cdsArti.fieldbyname('CIAID').AsString := DMALM.cdsCIA.fieldbyname('CIAID').AsString;
      dblcCiaExit(Nil);
      dbeCodArti.SetFocus;
      If DMALM.wAnchoArt > 0 Then
         DMALM.cdsArti.fieldbyname('ARTID').AsString := DMALM.StrZero(DMALM.MaxArt(dblcCIA.Text), DMALM.wAnchoArt);
   End;
End;

Procedure TFRegArti.dbcldArtiExit(Sender: TObject);
Var
   wSQL: String;
Begin
   wSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' AND ARTID=' + QuotedStr(dbcldArti.Text);
   dbeArti.Text := DMALM.DisplayDescrip('prvSQL', 'TGE205', 'ARTDES', wSQL, 'ARTDES');
End;

Procedure TFRegArti.Z2bbtnRegOkClick(Sender: TObject);
Var
   sCIAID, sARTID, sXARTID, sXTINID, sARTDES, sARTABR, xF: String;
   bExiste: Boolean;
   cds: TwwClientDataSet;
Begin
   If Length(Trim(dbeArti.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Articulo no Existe');
      Exit;
   End;

   If Length(Trim(dbeArti.Text)) > 0 Then
   Begin
      sCIAID := DMALM.cdsArti.FieldByName('CIAID').AsString;
      sARTID := DMALM.cdsArti.FieldByName('ARTID').AsString;
      sXTINID := DMALM.cdsKDXTemp.FieldByName('TINID').AsString;
      sARTDES := DMALM.cdsKDXTemp.FieldByName('ARTDES').AsString;
      sARTABR := DMALM.cdsKDXTemp.FieldByName('ARTABR').AsString;
      sXARTID := dbcldArti.Text;
      cds := Nil;
      If pgArti.ActivePage = tsComponent Then
      Begin
         xF := 'E';
         cds := DMALM.cdsEArti;
      End
      Else
         If pgArti.ActivePage = tsEquals Then
         Begin
            xF := 'Q';
            cds := DMALM.cdsQArti;
         End;
      If iEstado = 0 Then
         bExiste := cds.Locate('CIAID;TINID;ARTID;' + xF + 'ARTID', VarArrayOf([sCIAID, sXTINID, sARTID, sXARTID]), [])
      Else
      Begin
         bExiste := False;
      End;
      If bExiste Then
      Begin
         ErrorMsg('Error', 'No pueden existir Artículos Duplicados');
         Exit;
      End;
      If iEstado = 0 Then
         cds.Insert
      Else
         cds.Edit;
      If cds.State In [dsInsert, dsEdit] Then
      Begin
         Try
            cds.FieldByName('CIAID').AsString := sCIAID;
            cds.FieldByName('ARTID').AsString := sARTID;
            cds.FieldByName('TINID').AsString := sXTINID;
            cds.FieldByName(xF + 'ARTID').AsString := dbcldArti.Text;
            cds.FieldByName(xF + 'ARTDES').AsString := sARTDES;
            cds.FieldByName(xF + 'ARTABR').AsString := sARTABR;
            cds.Post;
            OnOffDetalle(True);
            pnlDetalleA.Visible := False;
            btnDetalle;
            pgArti.Enabled := True;
         Except
            On E: Exception Do EHandlerError(E);
         End;
      End;
      pnlDetalleA.Visible := False;
   End;
End;

Procedure TFRegArti.Z2bbtnRegCancClick(Sender: TObject);
Begin
   If DMALM.cdsEARTI.State In [dsInsert, dsEdit] Then
      DMALM.cdsEARTI.Cancel;
   OnOffDetalle(True); // activar detalle
   pnlDetalleA.Visible := False;
End;

Function TFRegArti.EHandlerError(Ex: Exception): Boolean;
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

{ procesos de Componentes }

Procedure TFRegArti.Z2dbgDReqsIButtonClick(Sender: TObject);
Begin
   iEstado := 0;
   dbcldArti.Text := '';
   dbeArti.Text := '';
   pnlDetalleA.Left := 181;
   pnlDetalleA.Top := 284;
   pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
   pnlDetalleA.BringToFront;
   pgArti.Enabled := False;
   btnDetalle;
End;

Procedure TFRegArti.dbgDArtiDblClick(Sender: TObject);
Var
   cds: TwwClientDataSet;
   xF: String;
Begin
   cds := Nil;
   If pgArti.ActivePage = tsComponent Then
   Begin
      xF := 'E';
      cds := DMALM.cdsEArti;
   End
   Else
      If pgArti.ActivePage = tsEquals Then
      Begin
         xF := 'Q';
         cds := DMALM.cdsQArti;
      End;

   If cds.RecordCount = 0 Then Exit;

   OnOffDetalle(False); // Desactivar el panel de detalle
   pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
   pnlDetalleA.BringToFront;
   DMALM.cdsArti.Edit;

   dbcldArti.Text := cds.FieldByName('EARTID').AsString;
   dbeArti.Text := cds.FieldByName('EARTDES').AsString;
   iEstado := 1;
   btnDetalle;
End;

Procedure TFRegArti.dbgDArtiKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (Key = $4D) And (ssCtrl In Shift) Then
   Begin
      dbgDArtiDblClick(Nil);
   End;

   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If pgArti.ActivePage = tsComponent Then
         If DMALM.cdsEArti.RecordCount > 0 Then DMALM.cdsEArti.Delete;

      If pgArti.ActivePage = tsEquals Then
         If DMALM.cdsQArti.RecordCount > 0 Then DMALM.cdsQArti.Delete;
   End;
   btnDetalle;
End;

Procedure TFRegArti.Z2dbgDEQIButtonClick(Sender: TObject);
Begin
   iEstado := 0;
   dbcldArti.Text := '';
   dbeArti.Text := '';
   pnlDetalleA.Left := 181;
   pnlDetalleA.Top := 284;
   pnlDetalleA.BringToFront;
   pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
   pgArti.Enabled := False;
   btnDetalle;
End;

Procedure TFRegArti.CargaUsuario;
Begin
   DMALM.cdsArti.FieldByName('CCUSER').AsString := DMALM.wUsuario;
   DMALM.cdsarti.FieldByName('CCFREG').AsDateTime := Now;
   DMALM.cdsArti.FieldByName('CCHREG').AsDateTime := Now;
End;

Procedure TFRegArti.CancelaNuevo;
Begin
   If (DMALM.cdsArti.Modified) Or (DMALM.cdsArti.ChangeCount > 0) Then
      DMALM.cdsArti.CancelUpdates;

   If (DMALM.cdsEArti.Modified) Or (DMALM.cdsEArti.ChangeCount > 0) Then
      DMALM.cdsEArti.CancelUpdates;

   If (DMALM.cdsQArti.Modified) Or (DMALM.cdsQArti.ChangeCount > 0) Then
      DMALM.cdsQArti.CancelUpdates;
End;

Procedure TFRegArti.dblcCIAExit(Sender: TObject);
Var
   sSQL: String;
Begin
   dbeCia.text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES,FLGSERV', 'CIAID=' + quotedstr(dblcCIA.text), 'CIADES');
   If length(dbeCia.text) = 0 Then
   Begin
      ShowMessage('Registre Código de Compañía');
      dblcCia.SetFocus;
      exit;
   End;

   If dblcCIA.text = '04' Then
      ActivaCompania04('A')
   Else
      ActivaCompania04('I');

// Tipo de Inventario
   sSQL := 'Select TINID, TINDES, TINABR, CUENTAID, TINVENTAS, HABILITADO, CODINVDEF '
      +    '  from TGE152 '
      +    ' where CIAID=' + QuotedStr(dblcCia.text)
      +    '   and HABILITADO=''S'' ';
   DMALM.cdsTINID.Close;
   DMALM.cdsTINID.DataRequest(sSQL);
   DMALM.cdsTINID.Open;

   If DMALM.wModo = 'A' Then
   Begin
      If DMALM.wAnchoArt > 0 Then
         DMALM.cdsArti.fieldbyname('ARTID').AsString := DMALM.StrZero(DMALM.MaxArt(dblcCIA.Text), DMALM.wAnchoArt);
   End;

   If DMALM.cdsQRY.fieldbyname('FLGSERV').AsString = 'S' Then
      dbcCargServ.Enabled := True
   Else
      dbcCargServ.Enabled := False;


// Inicio HPC_201604_ALM
// Inicializa Variable de Edición de Precio de Venta
   cbEditaPrecio.Checked := (DMALM.cdsArti.FieldByName('FLAGVAR').AsString = 'E');
   cbEditaPrecio.Enabled := True;
// Fin HPC_201604_ALM

End;

Procedure TFRegArti.dblcFABExit(Sender: TObject);
Begin
   dbeFab.text := DMALM.DisplayDescrip('prvTGE', 'TGE150', 'FABDES', 'FABID=' + quotedstr(dblcFAB.text), 'FABDES');
End;

Procedure TFRegArti.dblcUMedGExit(Sender: TObject);
Begin
   dbeUMedG.text := DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMDES', 'UNMID=' + quotedstr(dblcUMedG.text), 'UNMDES');
   If DMALM.wModo = 'M' Then
      If length(dbeUMedG.text) = 0 Then
      Begin
         ShowMessage('Registre Unidad de Medida');
         dblcUMedG.SetFocus;
         exit;
      End;
End;

Procedure TFRegArti.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRegArti.dblcFAMExit(Sender: TObject);
Begin
   If (dblcGrpArti.text = '') Then
   Begin
      DMALM.cdsFAM.Close;
      ErrorMsg('Error', 'Debe de Escoger una Grupo o Línea');
      dblcGrpArti.SetFocus;
      exit;
   End;
// Inicio HPC_201603_ALM
// Se agrega Etiqueta en Formulario
   edtcodeti.text := dblcGrpArti.text+ dblcFAM.text + '-' + dbeCodArti.text;
// Fin HPC_201603_ALM

   If dblcFAM.Text <> '' Then
   Begin
      dbeSFAM.text := '' ;
      dblcSUBFAM.text := '';

//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
      dbeCLASE.text := '';
      dblcClase.text := '';
      dbeSCLASE.text := '';
      dblcSClase.text := '';
//  Fin HPC_201601_ALM

      sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + 'AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text);
      dbeFAM.text := DMALM.DisplayDescrip('prvTGE', 'TGE169', 'FAMDES', sSQL, 'FAMDES');
      If length(Trim(DMALM.DisplayDescrip('prvTGE', 'TGE169', 'CUENTAID', sSQL, 'CUENTAID'))) > 0 Then
         dbeCtaCon.Text := DMALM.DisplayDescrip('prvTGE', 'TGE169', 'CUENTAID', sSQL, 'CUENTAID'); //DMALM.cdsFAM.fieldbyname('CUENTAID').AsString;
   // Sub-Familias
      sSQL := 'select * from TGE170 '
         + 'where CIAID=' + quotedstr(dblcCia.text)
         + '  and TINID=' + quotedstr(dblcTINID.text)
         + '  and GRARID=' + quotedstr(dblcGrpArti.text)
         + '  and FAMID=' + quotedstr(dblcFAM.text);
      DMALM.cdsSUBFAM.Close;
      DMALM.cdsSUBFAM.DataRequest(sSQL);
      DMALM.cdsSUBFAM.Open;
      DMALM.cdsSUBFAM.IndexFieldNames := 'SFAMID';
      dblcSUBFAM.LookupTable := DMALM.cdsSUBFAM;
      dblcSUBFAM.LookupField := 'SFAMID';
   End;
End;

Procedure TFRegArti.dblcSUBFAMExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If (dblcGrpArti.text = '') Then
   Begin
      DMALM.cdsSUBFAM.Close;
      ErrorMsg('Error', 'Debe de Escoger un Grupo o Linea ');
      exit;
   End;

   If (dblcFAM.text = '') Then
   Begin
      If wUrqCia = 'S' Then
      Begin
         DMALM.cdsSUBFAM.Close;
         ErrorMsg('Error', 'Debe de Escoger un Familia');
         exit;
      End;
   End;

   If dblcSUBFAM.Text <> '' Then
   Begin
//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
      dbeCLASE.text := '';
      dblcClase.text := '';
      dbeSCLASE.text := '';
      dblcSClase.text := '';
      sSQL := 'CIAID=''' + dblcCIA.Text + ''' AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text);
      dbeSFAM.text := DMALM.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', sSQL, 'SFAMDES');
      If length(Trim(DMALM.DisplayDescrip('prvTGE', 'TGE170', 'CUENTAID', sSQL, 'CUENTAID'))) > 0 Then
         dbeCtaCon.Text := DMALM.DisplayDescrip('prvTGE', 'TGE170', 'CUENTAID', sSQL, 'CUENTAID');
   // Clases
      sSQL := 'select * from ALM_CLASE_ART '
         + 'where CIAID=' + quotedstr(dblcCia.text)
         + '  and TINID=' + quotedstr(dblcTINID.text)
         + '  and GRARID=' + quotedstr(dblcGrpArti.text)
         + '  and FAMID=' + quotedstr(dblcFAM.text)
         + '  and SFAMID=' + quotedstr(dblcSUBFAM.text);
      DMALM.cdsCLASE.Close;
      DMALM.cdsCLASE.DataRequest(sSQL);
      DMALM.cdsCLASE.Open;
      DMALM.cdsCLASE.IndexFieldNames := 'CLASEID';
      dblcCLASE.LookupTable := DMALM.cdsCLASE;
      dblcCLASE.LookupField := 'CLASEID';
   End;
//  Fin HPC_201601_ALM


End;

//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
Procedure TFRegArti.dblcCLASEExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If (dblcGrpArti.text = '') Then
   Begin
      DMALM.cdsCLASE.Close;
      ErrorMsg('Error', 'Debe de Escoger un Grupo o Linea ');
      exit;
   End;

   If (dblcFAM.text = '') Then
   Begin
      If wUrqCia = 'S' Then
      Begin
         DMALM.cdsCLASE.Close;
         ErrorMsg('Error', 'Debe de Escoger una Familia');
         exit;
      End;
   End;

   If (dblcSUBFAM.text = '') Then
   Begin
      If wUrqCia = 'S' Then
      Begin
         DMALM.cdsCLASE.Close;
         ErrorMsg('Error', 'Debe de Escoger una SubFamilia');
         exit;
      End;
   End;

   If dblcCLASE.Text <> '' Then
   Begin
      dbeSCLASE.text := '';
      dblcSClase.text := '';
      sSQL := 'CIAID=''' + dblcCIA.Text + ''' AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text) + ' AND CLASEID=' + quotedstr(dblcCLASE.text);
      dbeCLASE.text := DMALM.DisplayDescrip('prvTGE', 'ALM_CLASE_ART', 'CLASEDES', sSQL, 'CLASEDES');
   // Sub-Clases
      sSQL := 'select * from ALM_SCLASE_ART '
         + 'where CIAID=' + quotedstr(dblcCia.text)
         + '  and TINID=' + quotedstr(dblcTINID.text)
         + '  and GRARID=' + quotedstr(dblcGrpArti.text)
         + '  and FAMID=' + quotedstr(dblcFAM.text)
         + '  and SFAMID=' + quotedstr(dblcSUBFAM.text)
         + '  and CLASEID=' + quotedstr(dblcClase.text);
      DMALM.cdsSCLASE.Close;
      DMALM.cdsSCLASE.DataRequest(sSQL);
      DMALM.cdsSCLASE.Open;
      DMALM.cdsSCLASE.IndexFieldNames := 'SCLASEID';
      dblcSCLASE.LookupTable := DMALM.cdsSCLASE;
      dblcSCLASE.LookupField := 'SCLASEID';
   End;
End;


Procedure TFRegArti.dblcSCLASEExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If (dblcGrpArti.text = '') Then
   Begin
      DMALM.cdsCLASE.Close;
      ErrorMsg('Error', 'Debe de Escoger un Grupo o Linea ');
      exit;
   End;

   If (dblcFAM.text = '') Then
   Begin
      If wUrqCia = 'S' Then
      Begin
         DMALM.cdsCLASE.Close;
         ErrorMsg('Error', 'Debe de Escoger una Familia');
         exit;
      End;
   End;

   If (dblcSUBFAM.text = '') Then
   Begin
      If wUrqCia = 'S' Then
      Begin
         DMALM.cdsCLASE.Close;
         ErrorMsg('Error', 'Debe de Escoger una SubFamilia');
         exit;
      End;
   End;

   If dblcSCLASE.Text <> '' Then
   Begin
      sSQL := 'CIAID=''' + dblcCIA.Text + ''' AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text) + ' AND CLASEID=' + quotedstr(dblcCLASE.text)  + ' AND SCLASEID=' + quotedstr(dblcSCLASE.text) ;
      dbeSCLASE.text := DMALM.DisplayDescrip('prvTGE', 'ALM_SCLASE_ART', 'SCLASEDES', sSQL, 'SCLASEDES');
   End;
End;

//  Fin HPC_201601_ALM



Procedure TFRegArti.dblcUMedUExit(Sender: TObject);
Begin
//   dbeUMedU.text := DMALM.DisplayDescrip('prvTGE', 'TGE130', 'UNMDES', 'UNMID=' + quotedstr(dblcUMedU.text), 'UNMDES');
End;

Procedure TFRegArti.dblcTMonedaExit(Sender: TObject);
Begin
   dbeTMoneda.text := DMALM.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', 'TMONID=' + quotedStr(dblcTMoneda.text), 'TMONDES');
End;

Procedure TFRegArti.dblcTINIDEnter(Sender: TObject);
Begin
   xTinven := dblcTINID.text;
End;

Procedure TFRegArti.CapturarValores;
Begin
   wTINID   := DMALM.cdsArti.FieldByName('TINID').Asstring;
   wGRARID  := DMALM.cdsArti.FieldByName('GRARID').Asstring;
   wFAMID   := DMALM.cdsArti.FieldByName('FAMID').Asstring;
   wSFAMID  := DMALM.cdsArti.FieldByName('SFAMID').Asstring;
// Inicio HPC_201601_ALM
// Cambios del Maestro para incluir Clase y SubClase
   wCLASEID := DMALM.cdsArti.FieldByName('CLASEID').Asstring;
   wSCLASEID:= DMALM.cdsArti.FieldByName('SCLASEID').Asstring;
// Fin HPC_201601_ALM
// Inicio HPC_201603_ALM
// Se agrega indicador de discontinuo
   wDISCONTINUO := DMALM.cdsArti.FieldByName('DISCONTINUO').Asstring;
// Fin HPC_201603_ALM
   wARTCONT := DMALM.cdsArti.FieldByName('ARTCONT').AsFloat;
   wUNMIDG  := DMALM.cdsArti.FieldByName('UNMIDG').Asstring;
   wUNMIDU  := DMALM.cdsArti.FieldByName('UNMIDU').Asstring;
   wTMONID  := DMALM.cdsArti.FieldByName('TMONID').Asstring;
   wARTSPRO := DMALM.cdsArti.FieldByName('ARTSPRO').Asstring;
End;

Function TFRegArti.VerificaCambios: boolean;
Begin
   If (DMALM.cdsArti.FieldByName('TINID').Asstring <> wTINID) (*Or
      (DMALM.cdsArti.FieldByName('GRARID').Asstring <> wGRARID) Or
      (DMALM.cdsArti.FieldByName('ARTCONT').AsFloat <> wARTCONT) Or
      (DMALM.cdsArti.FieldByName('UNMIDG').Asstring <> wUNMIDG) Or
      (DMALM.cdsArti.FieldByName('UNMIDU').Asstring <> wUNMIDU) Or
      (DMALM.cdsArti.FieldByName('TMONID').Asstring <> wTMONID) Or
      (DMALM.cdsArti.FieldByName('ARTSPRO').Asstring <> wARTSPRO) *) Then
   Begin
      result := True;
   End
   Else
   Begin
      result := False;
   End;
End;

Procedure TFRegArti.dbgEQKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (Key = $4D) And (ssCtrl In Shift) Then
   Begin
      dbgDArtiDblClick(Nil);
   End;

   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If pgArti.ActivePage = tsComponent Then
         If DMALM.cdsEArti.RecordCount > 0 Then DMALM.cdsEArti.Delete;

      If pgArti.ActivePage = tsEquals Then
         If DMALM.cdsQArti.RecordCount > 0 Then DMALM.cdsQArti.Delete;
   End;
   btnDetalle;
End;

Procedure TFRegArti.dbeSMaxGExit(Sender: TObject);
Begin
   If Length(Trim(dbeSMaxG.Text)) = 0 Then
      DMALM.cdsArti.FieldByName('STKSMAX').AsFloat := 0;

   If StrToFloat(StringReplace(dbeSMaxG.Text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg(Caption, 'Cantidad no Puede Ser Negativa');
      dbeSMaxG.SetFocus;
      Exit;
   End;

   If StrToFloat(StringReplace(dbeSMaxG.Text, ',', '', [rfReplaceAll])) < StrToFloat(StringReplace(dbeSMinG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'Stock Maximo no Puede ser Menor al Stock Minimo');
      dbeSMaxG.SetFocus;
      Exit;
   End;
End;

Procedure TFRegArti.dbeSMinGExit(Sender: TObject);
Begin
   If Length(Trim(dbeSMinG.Text)) = 0 Then
      DMALM.cdsArti.FieldByName('STKSMIN').AsFloat := 0;

   If StrToFloat(StringReplace(dbeSMinG.Text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg(Caption, 'Cantidad no Puede Ser Negativa');
      dbeSMinG.SetFocus;
      Exit;
   End;

   If StrToFloat(StringReplace(dbeSMinG.Text, ',', '', [rfReplaceAll])) > StrToFloat(StringReplace(dbeSMaxG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'Stock Minimo no Puede ser Mayor al Stock Maximo');
      dbeSMinG.SetFocus;
      Exit;
   End;
End;

Procedure TFRegArti.dbeSRepGExit(Sender: TObject);
Begin
   If Length(Trim(dbeSRepG.Text)) = 0 Then
      DMALM.cdsArti.FieldByName('STKSPRE').AsFloat := 0;

   If StrToFloat(StringReplace(dbeSRepG.Text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg(Caption, 'Cantidad no Puede Ser Negativa');
      dbeSRepG.SetFocus;
      Exit;
   End;

End;

Procedure TFRegArti.dbeSCRepExit(Sender: TObject);
Var
   xCant: Double;
Begin
   If Length(Trim(dbeSCRep.Text)) = 0 Then
      DMALM.cdsArti.FieldByName('STKSCPE').AsFloat := 0;

   If StrToFloat(StringReplace(dbeSCRep.Text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg(Caption, 'Cantidad no Puede Ser Negativa');
      dbeSCRep.SetFocus;
      Exit;
   End;

   If StrToFloat(StringReplace(dbeSCRep.Text, ',', '', [rfReplaceAll])) = 0 Then
   Begin
      ErrorMsg(Caption, 'Cantidad debe ser Mayor a Cero');
      dbeSCRep.SetFocus;
      Exit;
   End;

   xCant := StrToFloat(StringReplace(dbeSMaxG.Text, ',', '', [rfReplaceAll])) - StrToFloat(StringReplace(dbeSMinG.Text, ',', '', [rfReplaceAll]));

   If xCant < StrToFloat(StringReplace(dbeSCRep.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'La Cantidad a Reponer no Puede ser Mayor a ' + FloattoStr(xCant));
      dbeSCRep.SetFocus;
      Exit;
   End;

End;

Procedure TFRegArti.dbeCExisExit(Sender: TObject);
Begin
   If Length(Trim(dbeCExis.Text)) = 0 Then
      DMALM.cdsArti.FieldByName('ARTCVIDA').AsFloat := 0;

   If StrToFloat(dbeCExis.Text) < 0 Then
   Begin
      ErrorMsg(Caption, 'Cantidad no Puede Ser Negativa');
      dbeCExis.SetFocus;
      Exit;
   End;
End;

Procedure TFRegArti.dblcGrpArtiEnter(Sender: TObject);
Begin
   sSQL := 'SELECT * FROM TGE131 WHERE ' +
      'CIAID=' + quotedstr(dblcCIA.text) + ' ' +
      'AND TINID =' + quotedstr(dblcTINID.text) + ' ' +
      'ORDER BY CIAID, TINID, GRARID';
   DMALM.cdsGArti.Close;
   DMALM.cdsGArti.DataRequest(sSQL);
   DMALM.cdsGArti.Open;
End;

Procedure TFRegArti.dblcFAMEnter(Sender: TObject);
Begin
   sSQL := 'SELECT * FROM TGE169 WHERE ' +
      'CIAID=' + quotedstr(dblcCIA.text) + ' ' +
      'AND TINID=' + quotedstr(dblcTINID.text) + ' ' +
      'AND GRARID=' + QuotedStr(dblcGrpArti.text);
   DMALM.cdsFAM.Close;
   DMALM.cdsFAM.DataRequest(sSQL);
   DMALM.cdsFAM.Open;
End;

Procedure TFRegArti.dblcSUBFAMEnter(Sender: TObject);
Begin
   sSQL := 'SELECT * FROM TGE170 WHERE ' +
      ' CIAID=' + QuotedStr(dblcCIA.text) +
      ' AND GRARID=' + QuotedStr(dblcGrpArti.text) +
      ' AND TINID=' + QuotedStr(dblcTINID.text) +
      ' AND FAMID=' + QuotedStr(dblcFAM.text);
   DMALM.cdsSUBFAM.Close;
   DMALM.cdsSUBFAM.DataRequest(sSQL);
   DMALM.cdsSUBFAM.Open;
End;

//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
Procedure TFRegArti.dblcCLASEEnter(Sender: TObject);
Begin
   sSQL := 'SELECT * FROM ALM_CLASE_ART WHERE ' +
      ' CIAID=' + QuotedStr(dblcCIA.text) +
      ' AND GRARID=' + QuotedStr(dblcGrpArti.text) +
      ' AND TINID=' + QuotedStr(dblcTINID.text) +
      ' AND FAMID=' + QuotedStr(dblcFAM.text) +
      ' AND SFAMID=' + QuotedStr(dblcSUBFAM.text);
   DMALM.cdsCLASE.Close;
   DMALM.cdsCLASE.DataRequest(sSQL);
   DMALM.cdsCLASE.Open;
End;

Procedure TFRegArti.dblcSCLASEEnter(Sender: TObject);
Begin
   sSQL := 'SELECT * FROM ALM_SCLASE_ART WHERE ' +
      ' CIAID=' + QuotedStr(dblcCIA.text) +
      ' AND GRARID=' + QuotedStr(dblcGrpArti.text) +
      ' AND TINID=' + QuotedStr(dblcTINID.text) +
      ' AND FAMID=' + QuotedStr(dblcFAM.text) +
      ' AND SFAMID=' + QuotedStr(dblcSUBFAM.text) +
      ' AND CLASEID=' + QuotedStr(dblcCLASE.text);
   DMALM.cdsSCLASE.Close;
   DMALM.cdsSCLASE.DataRequest(sSQL);
   DMALM.cdsSCLASE.Open;
End;
// Fin HPC_201601_ALM


Procedure TFRegArti.FormCreate(Sender: TObject);
Begin
// Compañía
   FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');
   dblcCIA.LookupTable := DMALM.cdsCIA;
   dblcCIA.LookupField := 'CIAID';
   dblcCIA.DataSource := DMALM.dsArti;
   dblcCIA.DataField := 'CIAID';
   dblcCIA.Selected.clear;
   dblcCIA.Selected.Add('CIAID'#9'5'#9'Compañía');
   dblcCIA.Selected.Add('CIADES'#9'15'#9'Nombre Compañía');

// Código de Artículo
   dbeCodArti.DataSource := DMALM.dsArti;
   dbeCodArti.DataField := 'ARTID';

// Marca de Artículo
   FiltraTabla(DMALM.cdsMarca, 'ALM_MAR_ART', 'MARCA', 'MARCA');
   DMALM.cdsMarca.IndexFieldNames := 'MARDES';
   dblcdMarca.LookupTable := DMALM.cdsMarca;
   dblcdMarca.LookupField := 'MARCA';
   dblcdMarca.DataSource := DMALM.dsArti;
   dblcdMarca.DataField := 'MARCA';

// Tipo de Artículo
   FiltraTabla(DMALM.cdsTipArt, 'ALM_TIP_ART', 'TIPART', 'TIPART');
   DMALM.cdsTipArt.IndexfieldNames := 'TIPART';
   dblcdArtTipo.LookupTable := DMALM.cdsTipArt;
   dblcdArtTipo.LookupField := 'TIPART';
   dblcdArtTipo.DataSource := DMALM.dsArti;
   dblcdArtTipo.DataField := 'TIPART';

// Modelo
   dbeModelo.DataSource := DMALM.dsArti;
   dbeModelo.DataField := 'MODELO';

// Características
   dbeCaracteristicas.DataSource := DMALM.dsArti;
   dbeCaracteristicas.DataField := 'CARART';

// Descripción de Articulo
   dbeDescrip.DataSource := DMALM.dsArti;
   dbeDescrip.DataField := 'ARTDES';

// Descripción Abreviada
   dbeAbrev.DataSource := DMALM.dsArti;
   dbeAbrev.DataField := 'ARTABR';

// Tipo de Inventarios
   dblcTINID.LookupTable := DMALM.cdsTINID;
   dblcTINID.LookupField := 'TINID';
   dblcTINID.DataSource := DMALM.dsArti;
   dblcTINID.DataField := 'TINID';

// Línea/Grupo Inventarios
   dblcGrpArti.LookupTable := DMALM.cdsGArti;
   dblcGrpArti.LookupField := 'GRARID';
   dblcGrpArti.DataSource := DMALM.dsArti;
   dblcGrpArti.DataField := 'GRARID';
   //dbeAbrev.DataField := 'ARTABR';

// Familia
   dblcFAM.DataSource := DMALM.dsArti;
   dbeAbrev.DataField := 'ARTABR';

// Sub-Familia
   dblcSUBFAM.DataSource := DMALM.dsArti;
   dbeAbrev.DataField := 'ARTABR';

// Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
// Clase
   dblcClase.LookupTable := DMALM.cdsCLASE;
   dblcClase.LookupField := 'CLASEID';
   dblcClase.DataSource := DMALM.dsArti;
   dblcClase.DataField := 'CLASEID';
   dbeAbrev.DataField := 'ARTABR';
// SubClase
   dblcSclase.LookupTable := DMALM.cdsSCLASE;
   dblcSclase.LookupField := 'SCLASEID';
   dblcSclase.DataSource := DMALM.dsArti;
   dblcSclase.DataField := 'SCLASEID';
// Fin HPC_201601_ALM

// Unidades de Medida
   FiltraTabla(DMALM.cdsUMed, 'TGE130', 'UNMID', 'UNMID');
   dblcUMedG.LookupTable := DMALM.cdsUMed;
   dblcUMedG.LookupField := 'UNMID';
  // dblcUMedU.LookupTable := DMALM.cdsUMed;
  // dblcUMedU.LookupField := 'UNMID';

// Moneda
   FiltraTabla(DMALM.cdsTMoneda, 'TGE103', 'TMONID', 'TMONID');
   dblcTMoneda.LookupTable := DMALM.cdsTMoneda;
   dblcTMoneda.LookupField := 'TMONID';

// Fabricantes
   FiltraTabla(DMALM.cdsFAB, 'TGE150', 'FABID', 'FABID');
   dblcFAB.LookupTable := DMALM.cdsFAB;
   dblcFAB.LookupField := 'FABID';

   DMALM.cdsSobrino.Close;
   DMALM.cdsSobrino.DataRequest('SELECT ARTID, ARTDES, ARTPCG FROM TGE205');
   DMALM.cdsSobrino.FetchOnDemand := False;
   DMALM.cdsSobrino.PacketRecords := 20;
   DMALM.cdsSobrino.FetchOnDemand := True;
   DMALM.cdsSobrino.IndexFieldNames := 'ARTID';
   DMALM.cdsSobrino.Open;

   DMALM.cdsArti.FetchOnDemand := False;
   DMALM.cdsArti.PacketRecords := -1;
   DMALM.cdsArti.FetchOnDemand := True;
   DMALM.cdsArti.Open;
   DMALM.cdsClnArti.CloneCursor(DMALM.cdsArti, True);

// Inicio HPC_201603_ALM
// Se agrega indicador de discontinuo
   xSQL := 'Select VALOR from TGE801';
   DMALM.cdsQry2.Close;
   DMALM.cdsQry2.DataRequest(xSQL);
   DMALM.cdsQry2.Open;
   dblcContinuidad.LookupTable := DMALM.cdsQry2;
   dblcContinuidad.LookupField := 'VALOR';
   dblcContinuidad.DataSource := DMALM.dsArti;
   dblcContinuidad.DataField := 'DISCONTINUO';
   dblcContinuidad.Selected.clear;
 //  dblcContinuidad.Selected.Add('VALOR'#9'15'#9'Discontinuo');
// Fin HPC_201603_ALM

   ActivaCompania04('R');
End;

Procedure TFRegArti.FormShow(Sender: TObject);
Var
   sSQL: String;
   Ano, Mes, Dia: Integer;
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
   xcrea := True;
   xcrea := false;
   xDesArt := '';
   xIdFam := '';
   xIdSfam := '';
// Inicio HPC_201601_ALM
// Cambios del Maestro para incluir Clase y SubClase
   xIdClase := '';
   xIdSClase := '';
// Fin HPC_201601_ALM


   edtNow.Text := DatetoStr(Now);

// Inicio HPC_201603_ALM
// Se agrega Etiqueta en Formulario
   edtcodeti.text := dblcGrpArti.text+ dblcFAM.text +'-' + dbeCodArti.text;
// Fin HPC_201603_ALM
   
   If DMALM.cdsArti.FieldByName('ARTFUMV').AsDateTime > 0 Then
   Begin
      DMALM.Tiempo(DMALM.cdsArti.FieldByName('ARTFUMV').AsDateTime, Now, Ano, Mes, Dia);
      edtDiasSMov.Text := InttoStr(Ano) + ' Años ' + InttoStr(Mes) + ' Meses ' + InttoStr(Dia) + ' Dias';
   End
   Else
      edtDiasSMov.Text := ' Sin Movimiento ';

   If DMALM.wModo = 'M' Then
      CapturarValores;

   OnOffCabecera(True);
   OnOffDetalle(False);
   pgArti.ActivePage := tsGeneral;

   If DMALM.wModo = 'A' Then
      Z2bbtnNuevo.Click;

   If DMALM.wModo = 'M' Then
   Begin

      If dblcCIA.text = '04' Then
         ActivaCompania04('A')
      Else
         ActivaCompania04('I');

      DMALM.cdsArti.Edit;
      xDesArt := Trim(DMALM.cdsArti.FieldByName('ARTDES').AsString);
      xIdFam := Trim(DMALM.cdsArti.FieldByName('FAMID').AsString);
      xIdSfam := Trim(DMALM.cdsArti.FieldByName('SFAMID').AsString);
//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
      xIdClase := Trim(DMALM.cdsArti.FieldByName('CLASEID').AsString);
      xIdSclase := Trim(DMALM.cdsArti.FieldByName('SCLASEID').AsString);
//  Fin HPC_201601_ALM

      dblcCiaExit(Nil);

      dbeTINID.text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', 'CIAID=' + quotedstr(dblcCIA.text) + 'AND TINID=' + quotedstr(dblcTINID.text), 'TINDES');
      sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + 'AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + '''';
      dbeGrpArti.text := DMALM.DisplayDescrip('prvTGE', 'TGE131', 'GRARDES', sSQL, 'GRARDES');
      sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + 'AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text);
      dbeFAM.text := DMALM.DisplayDescrip('prvTGE', 'TGE169', 'FAMDES', sSQL, 'FAMDES');
      sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + 'AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text);
      dbeSFAM.text := DMALM.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', sSQL, 'SFAMDES');
//  Inicio HPC_201601_ALM
//  Cambios del Maestro para incluir Clase y SubClase
      sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + 'AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text) + ' AND CLASEID=' + quotedstr(dblcCLASE.text);
      dbeCLASE.text := DMALM.DisplayDescrip('prvTGE', 'ALM_CLASE_ART', 'CLASEDES', sSQL, 'CLASEDES');
      sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + 'AND GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text) + ' AND CLASEID=' + quotedstr(dblcCLASE.text) + ' AND SCLASEID=' + quotedstr(dblcSCLASE.text);
      dbeSCLASE.text := DMALM.DisplayDescrip('prvTGE', 'ALM_SCLASE_ART', 'SCLASEDES', sSQL, 'SCLASEDES');

      sSQL := 'CIAID=' + quotedstr(dblcCIA.text)
         + ' AND GRARID=' + quotedstr(dblcGrpArti.text)
         + ' AND TINID =' + quotedstr(dblcTINID.text)
         + ' AND FAMID=' + quotedstr(dblcFAM.text)
         + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text)
         + ' AND CLASEID=' + quotedstr(dblcClase.text)
         + ' AND SCLASEID=' + quotedstr(dblcSClase.text);

//  Fin HPC_201601_ALM

      edtTipArt.text := DMALM.DisplayDescrip('prvTGE', 'ALM_TIP_ART', 'TIPARTDES', 'TIPART=' + quotedstr(dblcdArtTipo.text), 'TIPARTDES');
      edtMarca.text := DMALM.DisplayDescrip('prvTGE', 'ALM_MAR_ART', 'MARDES', 'MARCA=' + quotedstr(dblcdMarca.text), 'MARDES');
      dbeProv.text := DMALM.DisplayDescrip('prvTGE', 'TGE201', 'CLAUXID,PROVDES', 'PROV=' + quotedstr(dblcdProv.text), 'PROVDES');

      dblcFABExit(Nil);
      dblcUMedGExit(Nil);
      dblcUMedUExit(Nil);
      dblcTMonedaExit(Nil);
      dblcCIA.Enabled := false;
      dbeCodArti.Enabled := False;

      OnOffCabecera(True);

      If dblcCIA.text = '04' Then
         dbeAbrev.SetFocus
      Else
         dbeDescrip.SetFocus;
   End;
End;

Function TFRegArti.DescripcionArticulo: String;
Var
   cad: String;
Begin
   cad := '';
   If length(Trim(dblcdArtTipo.Text)) > 0 Then
      cad := cad + Trim(edtTipArt.Text);
// Inicio HPC_201606_ALM
   If length(Trim(dblcdMarca.Text)) > 0 Then
//      cad := cad + ' - ' + Trim(edtMarca.Text);
      cad := cad + ' ' + Trim(edtMarca.Text);
//   If length(Trim(dbeModelo.Text)) > 0 Then
//      cad := cad + ' / ' + Trim(dbeModelo.Text);
   If length(Trim(dbeCaracteristicas.Text)) > 0 Then
//      cad := cad + ' - ' + Trim(dbeCaracteristicas.Text);
      cad := cad + ' ' + Trim(dbeCaracteristicas.Text);
//Fin HPC_201606_ALM      
   Result := cad;
End;

Procedure TFRegArti.ActivaCompania04(cEstado: String);
Begin
   If cEstado = 'A' Then // Para activación de Datos de Compañías <> 04 DM Plaza
   Begin
      dblcdMarca.Enabled := True;
      dblcdArtTipo.Enabled := True;
      dbeModelo.Enabled := True;
      dbeCaracteristicas.Enabled := True;
      dbeDescrip.Enabled := False;
      dbeAbrev.Enabled := True;
      bbtnBuscar.Visible := True;
   End;

   If cEstado = 'I' Then // Para activación de Datos de Compañías <> 04
   Begin
      dblcdMarca.Enabled := False;
      dblcdArtTipo.Enabled := False;
      dbeModelo.Enabled := False;
      dbeCaracteristicas.Enabled := False;
      dbeDescrip.Enabled := True;
      dbeAbrev.Enabled := True;
      bbtnBuscar.Visible := False;
   End;

   If cEstado = 'R' Then // Para Inicio del Formulario
   Begin
      dblcdMarca.Enabled := False;
      dblcdArtTipo.Enabled := False;
      dbeModelo.Enabled := False;
      dbeCaracteristicas.Enabled := False;
      dbeDescrip.Enabled := False;
      dbeAbrev.Enabled := False;
      bbtnBuscar.Visible := False;
   End;
End;

Procedure TFRegArti.dblcdMarcaExit(Sender: TObject);
Begin
   edtMarca.text := DMALM.DisplayDescrip('prvTGE', 'ALM_MAR_ART', 'MARDES', 'MARCA=' + quotedstr(dblcdMarca.text), 'MARDES');

   DMALM.cdsArti.FieldByName('ARTDES').AsString := DescripcionArticulo;
End;

Procedure TFRegArti.dblcdArtTipoExit(Sender: TObject);
Begin
   edtTipArt.text := DMALM.DisplayDescrip('prvTGE', 'ALM_TIP_ART', 'TIPARTDES', 'TIPART=' + quotedstr(dblcdArtTipo.text), 'TIPARTDES');

   DMALM.cdsArti.FieldByName('ARTDES').AsString := DescripcionArticulo;
End;

Procedure TFRegArti.dbeModeloExit(Sender: TObject);
Begin
   DMALM.cdsArti.FieldByName('ARTDES').AsString := DescripcionArticulo;
End;

Procedure TFRegArti.dbeCaracteristicasExit(Sender: TObject);
Begin
   DMALM.cdsArti.FieldByName('ARTDES').AsString := DescripcionArticulo;
End;

Procedure TFRegArti.dblcdProvExit(Sender: TObject);
Begin
   dbeProv.text := DMALM.DisplayDescrip('prvTGE', 'TGE201', 'CLAUXID,PROVDES', 'PROV=' + quotedstr(dblcdProv.text), 'PROVDES');
End;

Procedure TFRegArti.dbcldArtiEnter(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select CIAID, TINID, ARTID, ARTDES, ARTABR '
      +    '  from TGE205 '
      +    ' where CIAID='+quotedstr(dblcCIA.Text);
   DMALM.cdsKDXTemp.Close;
   DMALM.cdsKDXTemp.DataRequest(xSQL);
   DMALM.cdsKDXTemp.Open;

   dbcldArti.LookupTable := DMALM.cdsKDXTemp;
   dbcldArti.LookupField := 'ARTID';
End;

Procedure TFRegArti.bbtnBuscarClick(Sender: TObject);
Begin
   If dblcCIA.text <> '04' Then Exit;
   Try
      Try
         FBuscaCodigo := TFBuscaCodigo.create(self);
         FBuscaCodigo.ShowModal;
      Except
      End;
   Finally
      FBuscaCodigo.Free;
   End;
End;

Function TFRegArti.fg_ValidaIgvArticulo: Boolean;
Var
   xsMensaje: String;
Begin
   Result := True;
   If (dbcbIGV.Checked) And (dbcbExo.Checked) Then
   Begin
      ShowMessage('Si el campo [Afecto a IGV] está seleccionado' + chr(13)
         +        ' entonces el campo [Exonerado de Igv] debe estar desmarcado');
      Result := False;
      Exit;
   End;

   If (DMALM.cdsArti.FieldByName('CIAID').AsString = '05') Then
   Begin
      If (DMALM.cdsArti.FieldByName('TINID').AsString = '20') And
         (DMALM.cdsArti.FieldByName('GRARID').AsString = '07') And
         (dbcbIGV.Checked) Then
      Begin
         xsMensaje := 'La casilla AFECTO IGV está seleccionada.' + chr(13) +
            'Los artículos que pertenecen a la Línea:' + chr(13) +
            dblcGrpArti.Text + '-' + dbeGrpArti.Text + chr(13) +
            'normalmente no tienen IGV.' + chr(13) +
            '¿Deseas continuar de todas maneras?';
         If MessageDlg(xsMensaje, mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Begin
            Result := False;
            Exit;
         End;

      End;
   End;
   Result := True;
End;


End.

