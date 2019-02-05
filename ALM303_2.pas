Unit ALM303_2;
// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface
Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Wwdbdlg, wwdbdatetimepicker, StdCtrls, DBCtrls, Mask, wwdbedit, Buttons,
   wwdblook, ExtCtrls, db, Wwdbigrd, Grids, Wwdbgrid, dbiProcs, Variants;

Type
   TFAjustesI = Class(TForm)
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
      pnlDetalleG: TPanel;
      dbgDReqs: TwwDBGrid;
      Z2dbgDReqsIButton: TwwIButton;
      stxTitulo1: TPanel;
      pnlOC: TPanel;
      bvl2: TBevel;
      Z2bbtnSOCOK: TBitBtn;
      Z2bbtnSOCCA: TBitBtn;
      dbgOrdComp: TwwDBGrid;
      dbgOrdCompIButton: TwwIButton;
      stxTitulo3: TPanel;
      pnlSELOC: TPanel;
      bvl1: TBevel;
      lblORC: TLabel;
      lbl: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Z2bbtnSOCOK1: TBitBtn;
      Z2bbtnSOCCA1: TBitBtn;
      dblcdSODC: TwwDBLookupComboDlg;
      dbeF1: TwwDBEdit;
      dbeF2: TwwDBEdit;
      dbeF3: TwwDBEdit;
      stxTitulo4: TPanel;
      pnlDetalleA: TPanel;
      bvlDetalle: TBevel;
      lblItem: TLabel;
      lblArti: TLabel;
      blUnimedU: TLabel;
      Label9: TLabel;
      blUnimedG: TLabel;
      Label13: TLabel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      dbeItem: TwwDBEdit;
      dbeArti: TwwDBEdit;
      dbcldArti: TwwDBLookupComboDlg;
      dbeCantidadU: TwwDBEdit;
      stxTitulo2: TPanel;
      wwDBLookupCombo1: TwwDBLookupCombo;
      wwDBEdit2: TwwDBEdit;
      dbePrecioG: TwwDBEdit;
      dbeCantidadG: TwwDBEdit;
      dbePrecioU: TwwDBEdit;
      pnlControl: TPanel;
      Z2bbtnRegresa: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      Z2bbtnAceptar: TBitBtn;
      Label1: TLabel;
      dblcTIN: TwwDBLookupCombo;
      dbeTIN: TEdit;
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcExist(Sender: TObject);
      Procedure dblcNISAChange(Sender: TObject);
      Procedure dblcTDAChange(Sender: TObject);
      Procedure dblcTransacChange(Sender: TObject);
      Procedure dbmObsKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcdTDOCChange(Sender: TObject);
      Procedure Z2bbtnBorrarClick(Sender: TObject);
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure Z2dbgDReqsIButtonClick(Sender: TObject);
      Procedure dbcldArtiChange(Sender: TObject);
      Procedure dbePrecioGChange(Sender: TObject);
      Procedure dbePrecioUChange(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z2bbtnSOCOKClick(Sender: TObject);
      Procedure Z2bbtnSOCCAClick(Sender: TObject);
      Procedure Z2bbtnSOCOK1Click(Sender: TObject);
      Procedure Z2bbtnSOCCA1Click(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure Z2bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnAceptarClick(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure dblcTDAExit(Sender: TObject);
      Procedure dblcTransacExit(Sender: TObject);
      Procedure dblcdCCExit(Sender: TObject);
      Procedure dblcdTDOCExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormActivate(Sender: TObject);
   Private
    { Private declarations }
      iEstado: Integer;
      SelectOC: Integer;
      vFam, vSubFam, vTinid: String;
      Procedure ConfiguraNota(Sender: TObject);
      Procedure OnOffCabecera(Value: Boolean);
      Procedure Init(Sender: TObject);
      Procedure AsigDat;
      Function IsClose(Const sCIA, sLOC, sALM: String;
         Const dFEC: TDateTime; Var MaxFecha: TDateTime): Boolean;
      Procedure btnDetalle;
      Procedure OnOffDetalle(Value: Boolean);
      Function EHandlerError(Ex: Exception): Boolean;
      Procedure dcCIA;
      Procedure dcALM;
      Procedure dcTDA;
      Procedure dcLOC;
      Procedure nOrds;
      Procedure dsOCNIADataChange(Sender: TObject; Field: TField);
      Procedure lblEstado;
      Procedure ControlStock(sCIA, sALM, sLOC, sArt, Ano, Mes: String; Contenido: Double; IngSal: Char);
      Procedure ControlStock1(sCIA, sALM, sLOC, sArt, Ano, Mes: String; Contenido: Double; IngSal: Char);
      Procedure ActualizaOC(sCIA: String; Contenido: Double);
      Procedure ActualizaArticulo(sCIA, sArt: String; Contenido: Double; IngSal: Char);
      Procedure ActualizaCantidad(CantidadG, CantidadU, Contenido: double; SumaResta: Char;
         Var CantidadActG, CantidadActU: Double);
      Procedure CocienteResto(Num1, Num2: double; Var Cociente, Resto: double);
      Procedure CocienteRestoFalta(Num1, Num2: double; Var Cociente, Resto: double);
   Public
    { Public declarations }
   End;

Var
   FAjustesI: TFAjustesI;

Implementation

Uses ALMDM1, ALM207;

{$R *.DFM}

Procedure TFAjustesI.FormCreate(Sender: TObject);
Var
   ssql: String;
Begin
   ssql := '';
   ssql := 'Select * FROM TGE208 WHERE TRISGT=''I'' AND TRITMOV=''C''';
   dm1.cdsTRAN.Close;
   dm1.cdsTRAN.DataRequest(ssql);
   dm1.cdsTRAN.Open;

   dbcldArti.OnNotInList := dblcNotInList;
   dblcdCC.OnNotInList := dblcNotInList;
   dblcdTDOC.OnNotInList := dblcNotInList;
   dblcdProv.OnNotInList := dblcNotInList;

   DM1.dsOCNIA.OnDataChange := dsOCNIADataChange; // Establecer el filtro...

// Selección de Ordenes de compra G
//---------------------------------
   pnlOC.Left := 193;
   pnlOC.Top := 148;

// Selección de Ordenes de compra P
//---------------------------------
   pnlSELOC.Left := 230;
   pnlSELOC.Top := 217;

// Detalle de Artículos
//---------------------------------
   pnlDetalleA.Left := 210;
   pnlDetalleA.Top := 217;
End;

Procedure TFAjustesI.FormShow(Sender: TObject);
Begin
   If (dm1.cdsNia.FieldByName('NISSIT').AsString = 'ACEPTADO') Then
   Begin
      OnOffCabecera(False); //Activar la cabecera
      OnOffDetalle(True); //Desactivar el panel de detalle
   End
   Else
      Init(Sender);

   dbeProv.Clear;
   If (Not dm1.cdsNIA.FieldByName('PROV').IsNull) And (trim(dm1.cdsNIA.FieldByName('PROV').AsString) <> '') Then
      If dm1.RecuperarDatos('TGE201', '*', 'PROV=''' + dm1.cdsNIA.FieldByName('PROV').AsString + ''' ') Then
         dbeProv.Text := dm1.cdsQry.fieldbyname('PROVDES').AsString
End;

Procedure TFAjustesI.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   If DM1.cdsNIA.State In [dsEdit, dsInsert] Then
      DM1.cdsNIA.Cancel;
   If DM1.cdsNIA.ChangeCount > 0 Then
      DM1.cdsNIA.CancelUpdates;
   DM1.cdsTRAN.Filtered := False;
   DM1.dsOCNIA.OnDataChange := Nil;
   btnDetalle;
   If pnlDetallea.Visible Then
   Begin
      Z2bbtnRegCanc.OnClick(Nil);
   End;
   If pnlCabecera.Enabled Then
      pnlCabecera.SetFocus
   Else
      pnlDetalleG.SetFocus;
End;

Procedure TFAjustesI.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFAjustesI.dblcExist(Sender: TObject);
Var
   bRq: Boolean;
Begin
   If TwwDBCustomLookupCombo(Sender).DataSource <> Nil Then
      bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;
   If (bRq) And (trim(TwwDBCustomLookupCombo(Sender).Text) = '') Then
      TwwDBCustomLookupCombo(Sender).DropDown;
//  ConfiguraNota(nil);
   dbdtpFNS.Date := Date;
End;

Procedure TFAjustesI.dblcNISAChange(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTIN, sTDA, sLOC: String;
Begin
   If Not showing Then Exit;
   If Not (DM1.cdsNIA.State In [dsInsert, dsEdit]) Then exit;
   sCIA := dblcCIA.Text;
   sALM := dblcTALM.Text;
   sTDA := dblcTDA.Text;
   sLOC := dblcLOC.Text;
   sTIN := dblcLOC.Text;
   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sLOC = '') Or (sTIN = '') Then Exit;
   If DM1.cdsNIA.State In [dsInsert] Then
   Begin
      sNUM := DM1.StrZero(DM1.MaxNIA(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoIng);
      DM1.cdsNIA.FieldByName('NISAID').AsString := sNUM;
      dbeNumNISA.Text := sNUM;
   End
   Else
   Begin
      sNUM := DM1.cdsNIA.FieldByName('NISAID').AsString;
      dbeNumNISA.Text := sNUM;
   End;
   dm1.cdsArti.Filtered := False;
   If (dm1.cdsArti.filter <> 'CIAID=''' + sCIA + '''') Or (dm1.cdsArti.Filtered = False) Then
   Begin
      dm1.cdsArti.Filter := 'CIAID = ''' + sCIA + '''';
      dm1.cdsArti.Filtered := True;
   End;
End;

Procedure TFAjustesI.dblcTDAChange(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTIN, sLOC, sTDA, sSQL: String;
Begin
   If Not dm1.cdsTDNISA.Locate('TDAID', VararrayOf([TCustomedit(Sender).text]), []) Then
      Exit;
   If Not (DM1.cdsNIA.State In [dsInsert, dsEdit]) Then exit;
   If Not DM1.cdsNIA.Modified Then Exit;
   sCIA := dblcCIA.Text;
   sALM := dblcTALM.Text;
   sTDA := dblcTDA.Text;
   sLOC := dblcLOC.Text;
   sTIN := dblcTIN.Text;
   If (trim(sCIA) = '') Or (trim(sALM) = '') Or (trim(sTDA) = '') Or (trim(sLOC) = '') Or (trim(sTIN) = '') Then
      Exit;
   sNUM := DM1.StrZero(DM1.MaxNIA(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoIng);
   If DM1.cdsNIA.State In [dsInsert, dsEdit] Then
   Begin
      DM1.cdsNIA.FieldByName('TRIID').Clear;
      DM1.cdsNIA.FieldByName('CCOSID').Clear;
      DM1.cdsNIA.FieldByName('PROV').Clear;
   End;
   dblcTransac.Clear;
   dbeTransac.Clear;
   dblcdCC.Clear;
   dbeCC.Clear;
   dblcdProv.Clear;
   dbeProv.Clear;
   If DM1.cdsNIA.State In [dsInsert] Then
   Begin
  {{23/08/2000 pjsv;
  sólo se filtra la transacción TRISGT='S' y TRITMOV='C'; esto se hace en el
    create del Forms
    with DM1.cdsTRAN do
    begin
     Close ;
      sSQL := 'SELECT * FROM TGE208 WHERE TDAID='''+dblcTDA.Text+'''';
      DataRequest(sSQL) ;
      Open ;
    end;}
      DM1.cdsConceptoAlm.Close;
      sSQL := 'SELECT * FROM TGE168 WHERE CALTIPO=''' + dm1.cdsTDNISA.fieldByName('tdatip').AsString + '''';
      DM1.cdsConceptoAlm.DataRequest(sSQL);
      DM1.cdsConceptoAlm.Open;
   End;

   If DM1.cdsNIA.State In [dsInsert] Then
   Begin
      DM1.cdsNIA.FieldByName('NISAID').AsString := sNUM;
      dbeNumNISA.Text := sNUM;
   End
   Else
      dbeNumNISA.Text := sNUM;
End;

Procedure TFAjustesI.dblcTransacChange(Sender: TObject);
Begin
   ConfiguraNota(Nil);
End;

Procedure TFAjustesI.ConfiguraNota(Sender: TObject);
Var
   P, C, OC: Boolean;
   sSQL, sNUM, sCIA, sTIN, sALM, sLOC, sTDA: String;
Begin
   sSQL := 'TRIID=''' + dblcTransac.Text + '''' + ' AND TRISGT=''I''';
   C := (Trim(DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRICC', sSQL, 'TRICC')) = 'S');
   P := (Trim(DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRIPV', sSQL, 'TRIPV')) = 'S');
   OC := (Trim(DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRIOC', sSQL, 'TRIOC')) = 'S');
  {C :=  ( DM1.cdsTRAN.FieldByName('TRICC').AsString = 'S' );
  P :=  ( DM1.cdsTRAN.FieldByName('TRIPV').AsString = 'S' );
  OC := ( DM1.cdsTRAN.FieldByName('TRIOC').AsString = 'S' );}
   DM1.cdsNIA.FieldByName('CCOSID').Required := C;
   DM1.cdsNIA.FieldByName('PROV').Required := P;
   DM1.cdsNIA.FieldByName('ODCID').Required := OC;
   dblcdCC.Enabled := C;
   lblCC.Enabled := C;
   dblcdProv.Enabled := P;
   lblProv.Enabled := P;
   lblNOC.Enabled := OC;
   edNOrdC.Enabled := OC;
   btnOC.Enabled := OC;
   sCIA := dblcCIA.Text;
   sALM := dblcTALM.Text;
   sTDA := dblcTDA.Text;
   sLOC := dblcLOC.Text;
   sTIN := dblcTIN.Text;
   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sLOC = '') Or (sTIN = '') Then Exit;
   sNUM := DM1.StrZero(DM1.MaxNIA(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoIng);
End;

Procedure TFAjustesI.dbmObsKeyPress(Sender: TObject; Var Key: Char);
Var
   sC: String;
Begin
   sC := Key;
   sC := Uppercase(sC);
   Key := sC[1];
End;

Procedure TFAjustesI.dblcdTDOCChange(Sender: TObject);
Var
   bValue: Boolean;
Begin
   bValue := Not (dblcdTDOC.Text = '');
   lblFDoc.Enabled := bValue;
   lblNDoc.Enabled := bValue;
   dbeNDoc.Enabled := bValue;
   dbdtpFDoc.Enabled := bValue;
End;

Procedure TFAjustesI.Z2bbtnBorrarClick(Sender: TObject);
Begin
   If DM1.cdsNIA.State In [dsInsert, dsEdit] Then
   Begin
      Z2bbtnOK.Enabled := False;
      DM1.cdsNIA.Cancel;
      OnOffCabecera(False); //Desactivar el panel de Cabecera
      DM1.cdsNIA.Insert;
      Init(Nil);
   End;
End;

Procedure TFAjustesI.Z2bbtnOKClick(Sender: TObject);
Var
   sCIA, sALM, sLOC, sSQL: String;
   dFEC, xFEC: TDateTime;
   D, M, Y: Word;
Begin
   If DM1.cdsNIA.State In [dsInsert, dsEdit] Then
   Try
      AsigDat; // asignar los datos predeterminados
    {preguntar si el mes no ha sido cerrado para poder grabar, en todo caso
    se debe cambiar la fecha de nota de ingreso.}
      sCIA := DM1.cdsNIA.FieldByName('CIAID').AsString;
      sALM := DM1.cdsNIA.FieldByName('ALMID').AsString;
      dFEC := DM1.cdsNIA.FieldByName('NISAFREG').AsDateTime;
      sLOC := DM1.cdsNIA.FieldByName('LOCID').AsString;
      DecodeDate(dFEC, Y, M, D);
      If Not IsClose(sCIA, sLOC, sALM, dFEC, xFEC) Then
      Begin
         ErrorMsg(' Error', 'No se puede registrar la nota de ingreso al' +
            ' ' + DM1.strzero(IntToStr(D), 2) + ' de ' + LongMonthNames[M] + ' del ' + IntToStr(Y) + ' ' + #13 +
            ' La fecha ya se halla cerrada...');
         btnDetalle;
         Exit; { salir no se denbe actualizar los datos de los registros }
      End;
      sSQL := 'TRIID=''' + dblcTransac.Text + '''' + ' AND TRISGT=''I''';
      If Trim(DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRIOC', sSQL, 'TRIOC')) = 'S' Then
         DM1.cdsNIA.FieldByName('ODCID').AsString := 'S'
      Else
         DM1.cdsNIA.FieldByName('ODCID').AsString := 'N';
      DM1.cdsNIA.Post;
      OnOffCabecera(False); //Desactivar el panel de Cabecera
      OnOffDetalle(True); //Activar el panel de detalle
      pnlDetalleG.SetFocus;
      Z2bbtnCanc2.Enabled := True;
   Except
      On E: Exception Do
         If Not EHandlerError(E) Then Raise;
   End;
End;

Procedure TFAjustesI.OnOffCabecera(Value: Boolean);
Begin
  // ....................... activar cabecera de requisición ...................
   pnlCabecera.Enabled := Value;
   Z2bbtnBorrar.Enabled := Value;
   Z2bbtnOK.Enabled := Value;
End;

Procedure TFAjustesI.Init(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTIN, sTDA, sLOC: String;
Begin
//   lblEstado ;
   OnOffCabecera(True); //Activar la cabecera
   OnOffDetalle(False); //Desactivar el panel de detalle
   btnDetalle;
   If DM1.cdsNIA.State In [dsInsert] Then
   Begin
      dcCIA;
      dcTDA;
      dcLOC;
      dcALM;
      sCIA := DM1.cdsNIA.FieldByName('CIAID').AsString;
      sALM := DM1.cdsNIA.FieldByName('ALMID').AsString;
      sTDA := DM1.cdsNIA.FieldByName('TDAID').AsString;
      sLOC := DM1.cdsNIA.FieldByName('LOCID').AsString;
      sTIN := DM1.cdsNIA.FieldByName('TINID').AsString;
      dblcTDAChange(Nil);
      sNUM := DM1.StrZero(DM1.MaxNIA(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoIng);
      DM1.cdsNIA.FieldByName('NISAID').AsString := sNUM;
   End
   Else
   Begin
      nOrds;
      If Visible Then
      Begin
         dblcNISAChange(Nil);
         dblcTransacChange(Nil);
      End;
   End;
End;

Procedure TFAjustesI.AsigDat;
Var
   sSQL: String;
   D, M, Y: Word;
Begin
  // --> Asignar datos de cabecera de requisición
   If DM1.cdsNIA.State In [dsInsert, dsEdit] Then
   Begin
      If DM1.cdsNIA.FieldbyName('NISAFREG').IsNull Then
         DM1.cdsNIA.FieldbyName('NISAFREG').AsDateTime := Date;
      DecodeDate(DM1.cdsNIA.FieldbyName('NISAFREG').AsDateTime, Y, M, D);
      DM1.cdsNIA.FieldbyName('NISATIP').AsString := 'INGRESO';

      sSQL := 'TRIID=''' + dblcTransac.Text + '''' + ' AND TRISGT=''I''';
      DM1.cdsNIA.FieldByName('NISTMOV').AsString := DM1.DisplayDescrip('prvLOG', 'TGE208', 'TRITMOV', sSQL, 'TRITMOV');
      If Trim(DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRIOC', sSQL, 'TRIOC')) = 'S' Then
         DM1.cdsNIA.FieldByName('ODCID').AsString := 'S'
      Else
         DM1.cdsNIA.FieldByName('ODCID').AsString := 'N';

      If (DM1.cdsNIA.State In [dsInsert]) And (DM1.cdsNIA.FieldbyName('NISAObs').IsNull) Then
         DM1.cdsNIA.FieldbyName('NISAObs').AsString := '   '; // colocar datos en blanco o algo
   End;
End;

Function TFAjustesI.IsClose(Const sCIA, sLOC, sALM: String;
   Const dFEC: TDateTime; Var MaxFecha: TDateTime): Boolean;
Var
   sSQL, Value, Dias: String;
   Y, M, D: Word;
   vmasdia: Tdate;
Begin
   result := False;
   DecodeDate(dFEC, Y, M, D);
   sSQL := 'CIAID=''' + SCIA + ''' AND ALMID =''' + sALM + ''' AND LOCID =''' + sLOC + ''' ';
          //' AND CNSULTCIE <= DATE('''+FormatDateTime(dm1.wFormatFecha,dFEC)+''') '+
         //' AND CNSULTCIE >= DATE(DAYS('''+FormatDateTime(dm1.wFormatFecha,dFEC)+''')- CNSFRECU)';
   Value := DM1.DisplayDescrip('prvTGE', 'LOG317', ' MAX(CNSULTCIE) AS F', sSQL, 'F');
   sSQL := sSQL + ' AND CNSULTCIE = DATE(''' + FormatDateTime(dm1.wFormatFecha, strtodate(value)) + ''') ';
   Dias := DM1.DisplayDescrip('prvTGE', 'LOG317', 'CNSFRECU', sSQL, 'CNSFRECU');
   vmasdia := strtoint(Dias) + strtodate(value);
   If (strtodate(value) <= dFEC) And
      (vmasdia >= dFEC) Then
  //if Value<>'' then
   Begin
      MaxFecha := StrToDate(Value);
      result := True;
   End;
End;

Procedure TFAjustesI.btnDetalle;
Var
   bDummy1: Boolean;
Begin
   bDummy1 := (DM1.cdsKDX.RecordCount > 0) And
      ((DM1.cdsNIA.ChangeCount > 0) Or
      (DM1.cdsKDX.ChangeCount > 0) Or
      (DM1.cdsNIA.Modified) Or
      (DM1.cdsKDX.Modified));

  // bDummy2 :=  (DM1.cdsKDX.RecordCount>0);

   Z2bbtnGraba.Enabled := bDummy1;
   Z2bbtnCanc2.Enabled := bDummy1;
   Z2bbtnNuevo.Enabled := (DM1.cdsKDX.ChangeCount = 0) And (DM1.cdsNIA.ChangeCount = 0);
End;

Procedure TFAjustesI.OnOffDetalle(Value: Boolean);
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

   If Value Then
   Begin
      Z2bbtnNuevo.SetFocus;
   End;
   btnDetalle;
End;

Function TFAjustesI.EHandlerError(Ex: Exception): Boolean;
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

Procedure TFajustesI.dcCIA;
Var
   sCIA: String;
   sState: TDataSetState;
Begin
   sState := DM1.cdsNIA.State;
   DM1.cdsCIA.First;

   sCIA := trim(DM1.cdsCIA.FieldByName('CIAID').AsString);

   If (sState = dsInsert) And Not (DM1.cdsNIA.State In [dsInsert]) Then DM1.cdsNIA.Insert;

   If (sState = dsEdit) And Not (DM1.cdsNIA.State In [dsEdit]) Then DM1.cdsNIA.Edit;

   dblcCIA.Enabled := (DM1.cdsCIA.RecordCount > 1);

   If Not dblcCIA.Enabled Then
      DM1.cdsNIA.FieldByName('CIAID').AsString := sCIA;

   If length(dblcCia.Text) > 0 Then
      dblcCIA.OnExit(Self);
End;

Procedure TFAjustesI.dcALM;
Var
   sALM: String;
   sState: TDataSetState;

Begin
   sState := DM1.cdsNIA.State;
   DM1.cdsALM.First;
   sALM := trim(DM1.cdsALM.FieldByName('ALMID').AsString);

   If (sState = dsInsert) And Not (DM1.cdsNIA.State In [dsInsert]) Then DM1.cdsNIA.Insert;
   If (sState = dsEdit) And Not (DM1.cdsNIA.State In [dsEdit]) Then DM1.cdsNIA.Edit;

   dblcTALM.Enabled := (DM1.cdsALM.RecordCount > 1);
   If Not dblcTALM.Enabled Then
      DM1.cdsNIA.FieldByName('ALMID').AsString := sALM;
   If length(dblcTALM.Text) > 0 Then
      dblcTALM.OnExit(Self);
End;

Procedure TFAjustesI.dcTDA;
Var
   sTDA: String;
   sState: TDataSetState;
Begin
   sState := DM1.cdsNIA.State;
   DM1.cdsTDNISA.First;

   sTDA := trim(DM1.cdsTDNISA.FieldByName('TDAID').AsString);

   If (sState = dsInsert) And Not (DM1.cdsNIA.State In [dsInsert]) Then
      DM1.cdsNIA.Insert;

   If (sState = dsEdit) And Not (DM1.cdsNIA.State In [dsEdit]) Then
      DM1.cdsNIA.Edit;

   dblcTDA.Enabled := (DM1.cdsTDNISA.RecordCount > 1);
   If Not dblcTDA.Enabled Then
   Begin
      DM1.cdsNIA.FieldByName('TDAID').AsString := sTDA;
      dblcTDAChange(Nil);
   End;
   If length(dblcTDA.Text) > 0 Then
      dblcTDA.OnExit(Self);
End;

Procedure TFAjustesI.dcLOC;
Var
   sLOC: String;
   sState: TDataSetState;
Begin
   sState := DM1.cdsNIA.State;
   DM1.cdsLOC.First;
   sLOC := trim(DM1.cdsLOC.FieldByName('LOCID').AsString);
   If (sState = dsInsert) And Not (DM1.cdsNIA.State In [dsInsert]) Then DM1.cdsNIA.Insert;
   If (sState = dsEdit) And Not (DM1.cdsNIA.State In [dsEdit]) Then DM1.cdsNIA.Edit;

   dblcLOC.Enabled := (DM1.cdsLOC.RecordCount > 1);
   If Not dblcLOC.Enabled Then
   Begin
      DM1.cdsNIA.FieldByName('LOCID').AsString := sLOC;
   End;
   If length(dblcLoc.Text) > 0 Then
      dblcLOC.OnExit(Self);
End;

Procedure TFAjustesI.nOrds;
Var
   sODCIDs, sCIA,
      sALM, sTDA,
      sNISAID: String;
   bCIA,
      bALM, bTDA,
      bNISAID: Boolean;
Begin
   sCIA := DM1.cdsNIA.FieldByName('CIAID').AsString;
   sALM := DM1.cdsNIA.FieldByName('ALMID').AsString;
   sTDA := DM1.cdsNIA.FieldByName('TDAID').AsString;
   sNISAID := DM1.cdsNIA.FieldByName('NISAID').AsString;

   sODCIDs := '';
   DM1.cdsOCNIA.First;
   While Not DM1.cdsOCNIA.Eof Do
   Begin
      bCIA := sCIA = DM1.cdsOCNIA.FieldByName('CIAID').AsString;
      bALM := sALM = DM1.cdsOCNIA.FieldByName('ALMID').AsString;
      bTDA := sTDA = DM1.cdsOCNIA.FieldByName('TDAID').AsString;
      bNISAID := sNISAID = DM1.cdsOCNIA.FieldByName('NISAID').AsString;
      If bCIA And bALM And bTDA And bNISAID Then
         sODCIDs := DM1.cdsOCNIA.FieldByName('ODCID').AsString + ';' + sODCIDs;
      DM1.cdsOCNIA.Next;
   End;
   edNOrdC.Text := sODCIDs;
End;

Procedure TFAjustesI.dsOCNIADataChange(Sender: TObject; Field: TField);
Var
   sCIA, sODCID, sART: String;
Begin
   sODCID := DM1.cdsOCNIA.FieldByName('ODCID').AsString;
   sCIA := DM1.cdsOCNIA.FieldByName('CIAID').AsString;
   sART := dbcldArti.Text;
   If sART = '' Then Exit; // no ejecutar el filtro
   DM1.cdsDOCATT.Filtered := False;
   DM1.cdsDOCATT.Filter := 'CIAID=''' + sCIA + ''' AND ARTID=''' + sART + ''' AND ODCID=''' + sODCID + '''';
   DM1.cdsDOCATT.Filtered := True;
End;

Procedure TFAjustesI.Z2dbgDReqsIButtonClick(Sender: TObject);
Begin
   iEstado := 0;
  //dbeCntS.Text := '0'; // cantidad saliente
   dbePrecioG.Text := '0'; //
   dbePrecioU.Text := '0'; //
   dbcldArti.Clear;
   dbeArti.Clear;

   dbeItem.Text := DM1.StrZero(DM1.MaxValue('KDXID', DM1.cdsKDX), 5);
   SelectOC := 0;
   pnlDetallea.BringToFront;
   pnlDetalleA.Visible := True;
   OnOffDetalle(False); // Desactivar el panel de detalle
   btnDetalle;
End;

Procedure TFAjustesI.dbcldArtiChange(Sender: TObject);
Var
   ConUnitaria: Boolean;
   PrecioGChangeE, PrecioUChangeE: TNotifyEvent;
Begin
   dbeArti.Text := DM1.cdsArti.FieldByName('ARTDES').AsString;
   ConUnitaria := (DM1.cdsArti.FieldByName('ArtCont').Value <> 1);
   dbePrecioU.Enabled := ConUnitaria;
   dbeCantidadU.Enabled := ConUnitaria;
   vFam := DM1.cdsArti.FieldByName('FAMID').AsString;
   vSubFam := DM1.cdsArti.FieldByName('SFAMID').AsString;
   vTinid := DM1.cdsArti.FieldByName('TINID').AsString;

   PrecioGChangeE := dbePrecioG.OnChange;
   PrecioUChangeE := dbePrecioU.OnChange;
   dbePrecioG.OnChange := Nil;
   dbePrecioU.OnChange := Nil;

   SelectOC := 0;
   If (Not DM1.cdsNIA.FieldByName('ODCID').Required) Then
   Begin
//		dbePrecioG.Text := dm1.cdsArti.FieldByName('ARTPCG').Asstring;
//		dbePrecioU.Text := dm1.cdsArti.FieldByName('ARTPCU').Asstring;
   End;
   dbePrecioG.OnChange := PrecioGChangeE;
   dbePrecioU.OnChange := PrecioUChangeE;
End;

Procedure TFAjustesI.dbePrecioGChange(Sender: TObject);
Var
   Precio: Double;
Begin
   Precio := StrToFloat(dbePrecioG.text);
   If (dm1.cdsArti.FieldByName('ARTCONT').AsInteger > 1) Then
      dbePrecioU.Text := FloatToStr(Precio / dm1.cdsArti.FieldByName('ARTCONT').AsFloat);
End;

Procedure TFAjustesI.dbePrecioUChange(Sender: TObject);
Var
   Precio: Double;
Begin
   Precio := StrToFloat(dbePrecioU.text);
   If VarIsNull(precio) Then precio := 0;
   dbePrecioG.Text := FloatToStr(Precio * dm1.cdsArti.FieldByName('ARTCONT').AsFloat);
End;

Procedure TFAjustesI.Z2bbtnRegOkClick(Sender: TObject);
Var
   sCIA, sART, sALM, sLOC, sNISA, sSQL, sPRV, sTDA, sTmp, CadResult: String;
   dFECHAR: TDateTime;
   ReqOC, bExiste: Boolean;
   D, M, Y: Word;
   sP: Array[0..14] Of Char;
   fSum: Double;
   Esta: Boolean;
   Mes: String;
   Contenido, CantidadArt: Double;
   PrecioGChangeE, PrecioUChangeE: TNotifyEvent;
   sODCID: String;
   sODCIDSel: String;
   sDODCIDSel: String;
Begin
 //ReqOC := DM1.cdsNIA.FieldByName('ODCID').Required;
   ReqOC := (dm1.cdsNIA.FieldByName('ODCID').Asstring = 'S');
 {if ( (not ReqOC) and (StrToFloat(fRegNtaE.dbeCantidadG.Text) = 0)  and (StrToFloat(fRegNtaE.dbeCantidadU.Text) = 0)   ) then
  begin
   ErrorMsg('Error','La cantidad Ingresada no puede ser CERO!!!');
    exit;
 end;}
   Esta := False;
   sART := dbcldArti.Text; // sART := DM1.cdsArti.FieldByName('ARTID').AsString;
   If sART = '' Then
   Begin
      ErrorMsg('Error', 'El código del Artículo es Obligatorio');
      dbcldArti.SetFocus;
      Exit;
   End;
  // Siempre que el oc es requerido, verificar que los articulos existan en las
  // ordenes de compra pendientes por
  // proveedor o las ordenes de compra a la cual se le quiere dar atención
  //----------------------------------------------------------------------------
   sODCID := '';
   sCIA := dm1.cdsNIA.FieldByName('CIAID').AsString;
   sALM := dm1.cdsNIA.FieldByName('ALMID').AsString;
   sNISA := dm1.cdsNIA.FieldByName('NISAID').AsString;
   sTDA := dm1.cdsNIA.FieldByName('TDAID').AsString;
   dFECHAR := dm1.cdsNIA.FieldByName('NISAFREG').AsDateTime;
   sLOC := dm1.cdsNIA.FieldByName('LOCID').AsString;

  //if DM1.cdsNIA.FieldByName('ODCID').Required Then
   If DM1.cdsNIA.FieldByName('ODCID').Asstring = 'S' Then
   Begin
      sPRV := DM1.cdsNIA.FieldByName('PROV').AsString;
      DM1.cdsOCNIA.First;
      While Not DM1.cdsOCNIA.eof Do
      Begin
         sODCID := DM1.cdsOCNIA.FieldByName('ODCID').AsString;
         sCIA := DM1.cdsOCNIA.FieldByName('CIAID').AsString;
         sSQL := 'CIAID=''' + sCIA + ''' and ODCID=''' + sODCID + ''' and ARTID =''' + sART + '''';
         If length(DM1.DisplayDescrip('prvTGE', 'LOG305', '*', sSQL, 'ARTID')) = 0 Then
         Begin
       //ErrorMsg( 'Error','El Artículo no se halla en ninguna Orden de Compra');
        //Exit;
         End
         Else
         Begin
            Esta := True;
        //break;
         End;
         DM1.cdsOCNIA.Next;
      End;
      If Not Esta Then
      Begin
         ErrorMsg('Error', 'El Artículo no se halla en ninguna Orden de Compra');
         Exit;
      End;
    // aqui se debe sumarizar los articulos y verificar que el articulo ingresado
    // sea menor o igual a la suma
      fSum := 0;
      Contenido := dm1.cdsArti.FieldByName('ARTCONT').AsFloat;
    //DM1.cdsOCNIA.DisableControls;
      DM1.cdsOCNIA.First;
      While Not DM1.cdsOCNIA.eof Do
      Begin
         sODCID := DM1.cdsOCNIA.FieldByName('ODCID').AsString;
         sCIA := DM1.cdsOCNIA.FieldByName('CIAID').AsString;
         sSQL := 'CIAID=''' + sCIA + ''' and ODCID=''' + sODCID + ''' and ARTID =''' + sART + '''';
         CadResult := 'SUM(DODCCNTG * ' + FloatToStr(Contenido) + ' + DODCCNTU) AS xSUM';
         sTmp := DM1.DisplayDescrip('prvTGE', 'LOG305', CadResult, sSQL, 'xSUM');
         DM1.dsOCNIA.OnDataChange := dsOCNIADataChange;
         If length(sTmp) > 0 Then
         Begin
            fSum := fSum + StrToFloat(sTmp);
         End;
         DM1.cdsOCNIA.Next;
      End;
      CantidadArt := StrToFloat(dbeCantidadG.Text) * Contenido + StrToFloat(dbeCantidadU.Text);
      If CantidadArt > fSum Then
      Begin
         If Not Question('Confirmar', 'La cantidad a ingresar excede al total de articulo !!!!' +
            'desea dar ingreso al articulo ?...') Then
            Exit;
      End;
      DM1.cdsOCNIA.First;

      If (SelectOC = 0) Then
      Begin
         SelectOC := 1;
         Application.CreateForm(TFArtAtt, FArtAtt);
         Try
            pnlDetalleA.Visible := False; // solo si tenemos ordenes.
            If FArtAtt.ShowModal = mrCancel Then
            Begin
               OnOffDetalle(True); // Activar Detalle
               pnlDetalleA.Visible := False;
               btnDetalle;
               Exit;
            End;
         Except
            FArtAtt.Free;
         End;
      //El odcid seleccionado durante FArtAtt
         sODCIDSel := DM1.cdsOCNIA.FieldByName('ODCID').AsString;
         sDODCIDSel := DM1.cdsDOCATT.FieldByName('DODCID').AsString;
         PrecioGChangeE := dbePrecioG.OnChange;
         PrecioUChangeE := dbePrecioU.OnChange;
         dbePrecioG.OnChange := Nil;
         dbePrecioU.OnChange := Nil;
         dbePrecioG.text := FloatToStr(DM1.cdsDOCATT.FieldByName('DODCPUNG').AsFloat);
         dbePrecioU.text := FloatToStr(DM1.cdsDOCATT.FieldByName('DODCPUNU').AsFloat);
         dbeCantidadG.Text := FloatToStr(DM1.cdsDOCATT.FieldByName('DODCCSLDG').AsFloat);
         dbeCantidadU.Text := FloatToStr(DM1.cdsDOCATT.FieldByName('DODCCSLDU').AsFloat);
         dbePrecioG.OnChange := PrecioGChangeE;
         dbePrecioU.OnChange := PrecioUChangeE;
         pnlDetalleA.BringToFront;
         pnlDetalleA.Visible := True;
         exit;
      End
      Else
         SelectOc := 0; // Resetea el flag, guarda los datos y oculta el pnl

      pnlDetalleA.BringToFront;
      pnlDetalleA.Visible := True; // solo si tenemos ordenes.

      If dbeCantidadG.Text = '' Then dbeCantidadG.Text := '0';
      If dbeCantidadU.Text = '' Then dbeCantidadU.Text := '0';

      If (StrToFloat(dbeCantidadG.Text) = 0) And (StrToFloat(dbeCantidadU.Text) = 0) Then
      Begin
         ErrorMsg('Error', 'La cantidad ingresada no puede ser CERO');
         Exit;
      End;

      sCIA := DM1.cdsNIA.FieldByName('CIAID').AsString;
      sALM := DM1.cdsNIA.FieldByName('ALMID').AsString;
      sNISA := DM1.cdsNIA.FieldByName('NISAID').AsString;
      sTDA := DM1.cdsNIA.FieldByName('TDAID').AsString;
      dFECHAR := DM1.cdsNIA.FieldByName('NISAFREG').AsDateTime;

      sLOC := DM1.cdsNIA.FieldByName('LOCID').AsString;

    //sState  := DM1.cdsKDX.State;

      If iEstado = 0 Then
      Begin
         bExiste := DM1.cdsKDX.Locate('CIAID;ALMID;ARTID;TDAID;NISAID;LOCID;ODCID',
            VarArrayOf([sCIA, sALM, sART, sTDA, sNISA, sLOC, sODCID]), [])
      End
      Else
         bExiste := False;

    //{ /*28-junio-2000 */
      If bExiste Then // localizar el valor....
      Begin
         ErrorMsg('Error', 'No pueden existir artículos duplicados...');
         Exit; // salir del procedimiento
      End
   End
   Else
   Begin
  //ampliación de william manrique  para validar que no se
  //ingresen detalles en caso de no ser con orden de compra
  //wmc17082000
      If iEstado = 0 Then
      Begin
         bExiste := DM1.cdsKDX.Locate('CIAID;ALMID;ARTID;TDAID;NISAID;LOCID',
            VarArrayOf([sCIA, sALM, sART, sTDA, sNISA, sLOC]), [])
      End
      Else
         bExiste := False;

    //{ /*28-junio-2000 */
      If bExiste Then // localizar el valor....
      Begin
         ErrorMsg('Error', 'No pueden existir artículos duplicados...');
         Exit; // salir del procedimiento
      End
   End;
 {Guardar los datos del detalle }
   If iEstado = 0 Then
      DM1.cdsKDX.Insert
   Else
      DM1.cdsKDX.Edit;
{+----------------------------------------------------------------------------+
 |                     GENERANDO MOVIMIENTO DEL ARTICULO                      |
 |     1. Insertar o adicionar registros del movieiento de los artículos      |
 +----------------------------------------------------------------------------+}

   If DM1.cdsKDX.State In [dsInsert, dsEdit] Then
   Begin
      Try
         DM1.cdsKDX.FieldByName('KDXID').AsString := dbeItem.Text;
         DM1.cdsKDX.FieldByName('CIAID').AsString := sCIA;
         DM1.cdsKDX.FieldByName('LOCID').AsString := sLOC;
         DM1.cdsKDX.FieldByName('ALMID').AsString := sALM;
         DM1.cdsKDX.FieldByName('TDAID').AsString := sTDA;
         DM1.cdsKDX.FieldByName('NISAID').AsString := DM1.cdsNIA.FieldByName('NISAID').AsString;
         DM1.cdsKDX.FieldByName('ARTID').AsString := sART;
         DM1.cdsKDX.FieldByName('KDXFREG').AsDateTime := dFECHAR;
         DM1.cdsKDX.FieldByName('KDXPEDIDOG').AsFloat := 0;
         DM1.cdsKDX.FieldByName('KDXPEDIDOU').AsFloat := 0;
         DM1.cdsKDX.FieldByName('KDXCNTG').AsFloat := 0; //StrToFloat(dbeCantidadG.Text);
         DM1.cdsKDX.FieldByName('KDXCNTU').AsFloat := 0; //StrToFloat(dbeCantidadU.Text);
         DM1.cdsKDX.FieldByName('GRARID').AsString := DM1.cdsARTI.FieldByName('GRARID').AsString;
         DM1.cdsKDX.FieldByName('ARTCONT').AsFloat := DM1.cdsARTI.FieldByName('ARTCONT').AsFloat;
         DM1.cdsKDX.FieldByName('UNMIDG').AsString := DM1.cdsARTI.FieldByName('UNMIDG').AsString;
         DM1.cdsKDX.FieldByName('UNMIDU').AsString := DM1.cdsARTI.FieldByName('UNMIDU').AsString;
         DM1.cdsKDX.FieldByName('FABID').AsString := DM1.cdsARTI.FieldByName('FABID').AsString;
         DM1.cdsKDX.FieldByName('ARTSPRO').AsString := DM1.cdsARTI.FieldByName('ARTSPRO').AsString;
         DM1.cdsKDX.FieldByName('ARTSCA').AsString := DM1.cdsARTI.FieldByName('ARTSCA').AsString;
         DM1.cdsKDX.FieldByName('ARTPARA').AsString := DM1.cdsARTI.FieldByName('ARTPARA').AsString;
         DM1.cdsKDX.FieldByName('ARTSNA').AsString := DM1.cdsARTI.FieldByName('ARTSNA').AsString;

         Contenido := dm1.cdsArti.FieldByName('ARTCONT').AsFloat;
         DM1.cdsKDX.FieldbyName('ARTDES').AsString := dbeArti.Text;
         DM1.cdsKDX.FieldByName('ARTPCG').AsFloat := StrToFloat(dbePrecioG.text); // cdsARTI.FieldByName('ARTPCU').AsFloat;
         DM1.cdsKDX.FieldByName('ARTPCU').AsFloat := StrToFloat(dbePrecioU.Text);

      // FieldByName('ARTPVU').AsFloat     := cdsARTI.FieldByName('ARTPVU').AsFloat;
      // FieldByName('ARTPVG').AsFloat     := cdsARTI.FieldByName('ARTPVG').AsFloat;

         DM1.cdsKDX.FieldByName('ARTFUC').AsDateTime := DM1.cdsARTI.FieldByName('ARTFUC').AsDateTime;
         DM1.cdsKDX.FieldByName('TMONID').AsString := DM1.cdsARTI.FieldByName('TMONID').AsString;
         DM1.cdsKDX.FieldByName('ARTCRGO').AsFloat := DM1.cdsARTI.FieldByName('ARTCRGO').AsFloat;
         DM1.cdsKDX.FieldByName('ARTACTIVO').AsString := DM1.cdsARTI.FieldByName('ARTACTIVO').AsString;
         DM1.cdsKDX.FieldByName('CUENTAID').AsString := DM1.cdsARTI.FieldByName('CUENTAID').AsString;
         DM1.cdsKDX.FieldByName('PROV').AsString := DM1.cdsNIA.FieldByName('PROV').AsString;
         DM1.cdsKDX.FieldByName('DOCID').AsString := DM1.cdsNIA.FieldByName('DOCID').AsString;
         DM1.cdsKDX.FieldByName('TRIID').AsString := DM1.cdsNIA.FieldByName('TRIID').AsString;
         DM1.cdsKDX.FieldByName('CCOSID').AsString := DM1.cdsNIA.FieldByName('CCOSID').AsString;
         DM1.cdsKDX.FieldByName('ODCID').AsString := sODCIDSel;
         DM1.cdsKDX.FieldByName('DODCID').AsString := sDODCIDSel;
         DM1.cdsKDX.FieldByName('NISATIP').AsString := DM1.cdsNIA.FieldByName('NISATIP').AsString;
         DM1.cdsKDX.FieldByName('NISASOLIC').AsString := DM1.cdsNIA.FieldByName('NISASOLIC').AsString;
         DM1.cdsKDX.FieldByName('NISAFREG').AsDateTime := DM1.cdsNIA.FieldByName('NISAFREG').AsDateTime;
         DM1.cdsKDX.FieldByName('NISANDOC').AsString := DM1.cdsNIA.FieldByName('NISANDOC').AsString;
         DM1.cdsKDX.FieldByName('NISAFDOC').AsDateTime := DM1.cdsNIA.FieldByName('NISAFDOC').AsDateTime;
         DM1.cdsKDX.FieldByName('CALID').AsString := DM1.cdsConceptoAlm.FieldByName('CALID').Asstring;

         DecodeDate(Now, Y, M, D);
         dbiGetNetUserName(sP);
         DM1.cdsKDX.FieldbyName('KDXUser').AsString := sP; // por el momento nada no se sabe nada del usuario
         DM1.cdsKDX.FieldbyName('KDXAno').AsString := IntToStr(Y);
         DM1.cdsKDX.FieldbyName('KDXMM').AsString := DM1.strzero(IntToStr(M), 2);
         DM1.cdsKDX.FieldbyName('KDXDD').AsString := DM1.strzero(IntToStr(D), 2);
         DM1.cdsKDX.FieldbyName('KDXTri').AsString := '';
         DM1.cdsKDX.FieldbyName('KDXSem').AsString := '';
         DM1.cdsKDX.FieldbyName('KDXSS').AsString := '';
         DM1.cdsKDX.FieldbyName('KDXAnoMM').AsString := IntToStr(Y) + dm1.strzero(IntToStr(M), 2);
         DM1.cdsKDX.FieldbyName('KDXAATri').AsString := '';
         DM1.cdsKDX.FieldbyName('KDXAASem').AsString := '';
         DM1.cdsKDX.FieldbyName('KDXAASS').AsString := '';
         DM1.cdsKDX.FieldbyName('KDXFReg').AsDateTime := Date;
         DM1.cdsKDX.FieldbyName('KDXHReg').AsDateTime := SysUtils.Time;
         DM1.cdsKDX.FieldbyName('FlagVar').AsString := '';
         DM1.cdsKDX.Post;
         Mes := DM1.StrZero(IntToStr(M), 2);

         OnOffDetalle(True); // Activar Detalle
         pnlDetalleA.Visible := False;
         btnDetalle;
      Except
         On E: Exception Do EHandlerError(E);
      End;
   End;
End;

Procedure TFAjustesI.Z2bbtnRegCancClick(Sender: TObject);
Begin
   If DM1.cdsNIA.State In [dsInsert, dsEdit] Then
      DM1.cdsNIA.Cancel;
   OnOffDetalle(True); // activar detalle
   pnlDetalleA.Visible := False;
End;

Procedure TFAjustesI.Z2bbtnSOCOKClick(Sender: TObject);
Begin
   pnlCabecera.Enabled := True;
   pnlControl.Enabled := True;
   pnlDetalleG.Enabled := True;
{-------------------------------------------------------------------------------
  aqui se construye la cadena que se muestra fuera en el número de OC
}
   nOrds;
   pnlOC.Visible := False;
   btnOc.SetFocus;
End;

Procedure TFAjustesI.Z2bbtnSOCCAClick(Sender: TObject);
Begin
   pnlCabecera.Enabled := True;
   pnlControl.Enabled := True;
   pnlDetalleG.Enabled := True;
// -----------------------------------------------------------------------------
   pnlOC.Visible := False;
End;

Procedure TFAjustesI.Z2bbtnSOCOK1Click(Sender: TObject);
Var
   sCIA, sALM,
      sTDA, sODCID,
      sNISAID, sPRV,
      sFPAGOID: String;
   dFECHA: TDateTime;
   bExiste: Boolean;
   fTG: Double;
Begin
   sCIA := DM1.cdsNIA.FieldByName('CIAID').AsString;
   sALM := DM1.cdsNIA.FieldByName('ALMID').AsString;
   sTDA := DM1.cdsNIA.FieldByName('TDAID').AsString;
   sNISAID := DM1.cdsNIA.FieldByName('NISAID').AsString;
   sPRV := DM1.cdsNIA.FieldByName('PROV').AsString;
   sODCID := dblcdSODC.Text;

   If (iEstado = 0) Then //and (cdsOCNIA.RecordCount>0)
   Begin
      bExiste := DM1.cdsOCNIA.Locate('CIAID;ALMID;TDAID;ODCID;NISAID', VarArrayOf([sCIA, sALM, sTDA, sODCID, sNISAID]), []);
   End
   Else
      bExiste := False;

   If bExiste Then // localizar el valor....
   Begin
      ErrorMsg('Error', 'No pueden existir Ordenes de Compra duplicadas...');
      Exit; // salir del procedimiento
   End;

   If iEstado = 0 Then
      DM1.cdsOCNIA.Insert
   Else
      DM1.cdsOCNIA.Edit;

   dFECHA := DM1.cdsOrdComp.FieldByName('ODCFEOC').AsDateTime;
   sFPAGOID := DM1.cdsOrdComp.FieldByName('FPAGOID').AsString;
   fTG := DM1.cdsOrdComp.FieldByName('ODCTOTALG').AsFloat;

   DM1.cdsOCNIA.FieldByName('NISAID').AsString := sNISAID;
   DM1.cdsOCNIA.FieldByName('CIAID').AsString := sCIA;
   DM1.cdsOCNIA.FieldByName('ALMID').AsString := sALM;
   DM1.cdsOCNIA.FieldByName('TDAID').AsString := sTDA;
   DM1.cdsOCNIA.FieldByName('ODCID').AsString := sODCID;
   DM1.cdsOCNIA.FieldByName('ODCFEOC').AsDateTime := dFECHA;
   DM1.cdsOCNIA.FieldByName('FPAGOID').AsString := sFPAGOID;
   DM1.cdsOCNIA.FieldByName('ODCTOTALG').AsFloat := fTG;
   DM1.cdsOCNIA.FieldByName('PROV').AsString := sPRV;

   DM1.cdsOCNIA.Post;
   pnlOC.Enabled := True;
   pnlSELOC.Visible := False;
End;

Procedure TFAjustesI.Z2bbtnSOCCA1Click(Sender: TObject);
Begin
   DM1.cdsOCNIA.Cancel;
   pnlOC.Enabled := True;
   pnlSELOC.Visible := False;
End;

Procedure TFAjustesI.Z2bbtnNuevoClick(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTIN, sTDA, sLOC: String;
Begin
   OnOffCabecera(True);
   OnOffDetalle(False);
   lblEstado;
   dblcCIA.Enabled := True;
   dbeNumNISA.Enabled := True;
   dblcTALM.Enabled := True;
   DM1.cdsNIA.Insert;
   If DM1.cdsNIA.State In [dsInsert] Then
   Begin
      dcCIA;
      dcALM;
      dcTDA;
      dcLOC;
      sCIA := DM1.cdsNIA.FieldByName('CIAID').AsString;
      sALM := DM1.cdsNIA.FieldByName('ALMID').AsString;
      sTDA := DM1.cdsNIA.FieldByName('TDAID').AsString;
      sLOC := DM1.cdsNIA.FieldByName('LOCID').AsString;
      sTIN := DM1.cdsNIA.FieldByName('TINID').AsString;
      dblcTDAChange(Nil);
      sNUM := DM1.StrZero(DM1.MaxNIA(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoIng);
      DM1.cdsNIA.FieldByName('NISAID').AsString := sNUM;
      edNOrdC.Clear;
   End;
   btnDetalle;
End;

Procedure TFAjustesI.lblEstado;
Begin
 //fds
End;

Procedure TFAjustesI.Z2bbtnGrabaClick(Sender: TObject);
Var
   sCIA, sALM, sLOC: String;
Begin
   sCIA := DM1.cdsNIA.FieldByName('CIAID').AsString;
   sALM := DM1.cdsNIA.FieldByName('ALMID').AsString;
  //dFEC := cdsNIA.FieldByName('NISAFREG').AsDateTime;
   sLOC := DM1.cdsNIA.FieldByName('LOCID').AsString;
  //dm1.ControlTran;
   DM1.ControlTran(0, Nil, '');
  //AplicaDatos([cdsNIA, cdsKDX, cdsCNS, cdsSTK, cdsOCNIA, cdsDOCATT ]);
  {cdsNIA = LOG314, cdsKDX = LOG315; cdsSTK = LOG316}
   btnDetalle;
   Z2bbtnAceptar.Enabled := True;
End;

Procedure TFAjustesI.Z2bbtnCanc2Click(Sender: TObject);
Begin
   DM1.cdsNIA.CancelUpdates;
   DM1.cdsKDX.CancelUpdates;
   Z2bbtnNuevoClick(Nil);
End;

Procedure TFAjustesI.Z2bbtnRegresaClick(Sender: TObject);
Begin
   DM1.cdsNIA.Edit;
   OnOffCabecera(True);
   OnOffDetalle(False);
End;

Procedure TFAjustesI.Z2bbtnAceptarClick(Sender: TObject);
Var
   dFECHAR: TDateTime;
   Y, M, D: Word;
   Ano, Mes: String;
   Contenido: Double;
   sSQL, sCIA, sART, sALM, sLOC, sTIN: String;
   ValorOc: Variant;
   OC: Boolean;
Begin
   If (dm1.cdsNia.State In [dsInsert, dsEdit]) Then
   Begin
      ErrorMsg('Observación', 'Primero Guarda las modificaciones');
      Exit;
   End;
   If (dm1.cdsNia.FieldByName('NISSIT').AsString = 'ACEPTADO') Then
   Begin
      ErrorMsg('Observación', 'La nota ya ha sido aceptado');
      exit;
   End;
   Screen.Cursor := crHourGlass;
   dFECHAR := dm1.cdsNIA.FieldByName('NISAFREG').AsDateTime;
   sCIA := dm1.cdsNIA.FieldByName('CIAID').AsString;
   sALM := dm1.cdsNIA.FieldByName('ALMID').AsString;
   sLOC := dm1.cdsNIA.FieldByName('LOCID').AsString;
   sTIN := dm1.cdsNIA.FieldByName('TINID').AsString;
   sSQL := 'TRIID=''' + dblcTransac.Text + '''' + ' AND TRISGT=''I''';
   ValorOC := DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRIOC', sSQL, 'TRIOC');
   OC := ValorOc = 'S';
   DecodeDate(dFECHAR, Y, M, D);
   Ano := IntToStr(Y);
   Mes := DM1.StrZero(IntToStr(M), 2);
   dm1.cdsKDX.first;
   While Not dm1.cdsKDX.Eof Do
   Begin
      sArt := dm1.cdsKDX.FieldByName('ARTID').AsString;
      If dm1.cdsArti.Locate('ciaid;artid', VarArrayOf([sCIA, sArt]), []) Then
      Begin
         Contenido := dm1.cdsArti.FieldByName('ARTCONT').AsFloat;
         ControlStock1(sCIA, sALM, sLOC, sArt, Ano, Mes, Contenido, 'I');
     {por ahora no se utilizará el método de fong
      if OC then ActualizaOC(sCIA, Contenido);
      ControlStock(sCIA, sALM, sLOC, sArt, Ano, Mes, Contenido, 'I');
      ActualizaArticulo(sCIA, sArt, Contenido, 'I');}
      End
      Else
         ErrorMsg('Error Grave', 'No se encuentra el articulo ' + sCIA + sArt);
      dm1.cdsKDX.next;
   End;
   dm1.ActualizaSituacion('I'); //SE PUSO EL APPLYUPDATES(0) EN EL PROC.
   If OC Then
   Begin
      If (dm1.cdsDOCATT2.ChangeCount > 0) Or (dm1.cdsDOCATT2.Modified) Then
         dm1.AplicaDatos(dm1.cdsDOCATT2, 'DOCATT');
   End;
   //DM1.cdsDOCATT2.ApplyUpdates(0);
  //dm1.ControlTran;
   DM1.ControlTran(0, Nil, '');
  //dm1.cdsARTI.ApplyUpdates(0);
  //dm1.cdsSTK.ApplyUpdates(0);
 //dm1.cdsNIA.ApplyUpdates(0);
   If OC Then dm1.ActualizaEstadoOC(sCIA);
   Z2bbtnAceptar.Enabled := False;
   Screen.Cursor := crDefault;
End;
  { Hacer el control de stock, debido a una aceptacion de una nota de Ingreso }
  {OUT: Control de stock, LOG316, cdsStk
   INP: Kardex(detalle de la nota), cdsKDX}
  { Mes es de forma mm}

Procedure TFAjustesI.ControlStock(sCIA, sALM, sLOC, sArt, Ano, Mes: String; Contenido: Double; IngSal: Char);
Var
   CantidadG, CantidadU: Double;
   PrecioG, PrecioU: Double;
   STKSANTG, STKSANTU: Double;
   CantidadActG, CantidadActU, MontoActG, MontoActU: Double;
   CntGFName, CntUFName, MntGFName, MntUFName: String;
   SumaResta: Char;
Begin
   CntGFName := 'STK' + IngSal + 'SG' + Mes;
   CntUFName := 'STK' + IngSal + 'SU' + Mes;
   MntGFName := 'STK' + IngSal + 'MG' + Mes;
   MntUFName := 'STK' + IngSal + 'MU' + Mes;

   If IngSal = 'S' Then
   Begin
   //En el caso de las salidas, los precios se toma del precio de costo promedio del maestro de articulo;
      PrecioG := dm1.cdsArti.FieldByName('ARTCPROG').AsFloat; //cdsArti.FieldByName('ARTMNTG').AsFloat / cdsArti.FieldByName('ARTCNTG').AsFloat;
      PrecioU := dm1.cdsArti.FieldByName('ARTCPROU').AsFloat; //cdsArti.FieldByName('ARTMNTU').AsFloat / cdsArti.FieldByName('ARTCNTU').AsFloat;
      SumaResta := 'R';
   End
   Else
   Begin
      PrecioG := dm1.cdsKDX.FieldByName('ARTPCG').AsFloat;
      PrecioU := dm1.cdsKDX.FieldByName('ARTPCU').AsFloat;
      SumaResta := 'S';
   End;

   CantidadG := dm1.cdsKDX.FieldByName('KDXCNTG').AsFloat;
   CantidadU := dm1.cdsKDX.FieldByName('KDXCNTU').AsFloat;

   If Not dm1.cdsSTK.Locate('CIAID;ALMID;ARTID;STKANO;LOCID', VarArrayOf([sCIA, sALM, sART, Ano, sLOC]), []) Then
   Begin
      dm1.cdsSTK.Locate('CIAID;ALMID;ARTID;STKANO;LOCID',
         VarArrayOf([sCIA, sALM, sART, IntToStr(StrToInt(Ano) - 1), sLOC]), []);
    //Guardar los saldos finales del año anterior para despues asignarlos a los
    //saldos iniciales del nuevo registro
      STKSANTG := dm1.cdsSTK.FieldByName('STKSACTG').AsFloat;
      STKSANTU := dm1.cdsSTK.FieldByName('STKSACTU').AsFloat;

      dm1.cdsSTK.Insert;
      dm1.cdsSTK.FieldbyName('CIAID').AsString := sCIA;
      dm1.cdsSTK.FieldbyName('LOCID').AsString := sLOC;
      dm1.cdsSTK.FieldbyName('ALMID').AsString := sALM;
      dm1.cdsSTK.FieldbyName('STKANO').AsString := Ano;
      dm1.cdsSTK.FieldbyName('ARTID').AsString := sART;

      dm1.cdsSTK.FieldbyName('STKSANTG').AsFloat := STKSANTG;
      dm1.cdsSTK.FieldbyName('STKSANTU').AsFloat := STKSANTU;

      dm1.cdsSTK.FieldByName('STKSACTG').AsFloat := STKSANTG;
      dm1.cdsSTK.FieldByName('STKSACTU').AsFloat := STKSANTU;

      dm1.cdsSTK.FieldbyName('GRARID').AsString := dm1.cdsKDX.FieldbyName('GRARID').AsString;
      dm1.cdsSTK.FieldbyName('ARTCONT').AsFloat := dm1.cdsKDX.FieldbyName('ARTCONT').AsFloat;
      dm1.cdsSTK.FieldbyName('UNMIDG').AsString := dm1.cdsKDX.FieldbyName('UNMIDG').AsString;
      dm1.cdsSTK.FieldbyName('UNMIDU').AsString := dm1.cdsKDX.FieldbyName('UNMIDU').AsString;
      dm1.cdsSTK.FieldbyName('FABID').AsString := dm1.cdsKDX.FieldbyName('FABID').AsString;
      dm1.cdsSTK.FieldbyName('ARTSPRO').AsString := dm1.cdsKDX.FieldbyName('ARTSPRO').AsString;
      dm1.cdsSTK.FieldbyName('ARTSCA').AsString := dm1.cdsKDX.FieldbyName('ARTSCA').AsString;
      dm1.cdsSTK.FieldbyName('ARTPARA').AsString := dm1.cdsKDX.FieldbyName('ARTPARA').AsString;
      dm1.cdsSTK.FieldbyName('ARTSNA').AsString := dm1.cdsKDX.FieldbyName('ARTSNA').AsString;
      dm1.cdsSTK.FieldbyName('ARTFUC').AsDateTime := dm1.cdsKDX.FieldbyName('ARTFUC').AsDateTime;
      dm1.cdsSTK.FieldbyName('TMONID').AsString := dm1.cdsKDX.FieldbyName('TMONID').AsString;
      dm1.cdsSTK.FieldbyName('ARTCRGO').AsString := dm1.cdsKDX.FieldbyName('ARTCRGO').AsString;
      dm1.cdsSTK.FieldbyName('ARTACTIVO').AsString := dm1.cdsKDX.FieldbyName('ARTACTIVO').AsString;
      dm1.cdsSTK.FieldbyName('CUENTAID').AsString := dm1.cdsKDX.FieldbyName('CUENTAID').AsString;
      dm1.cdsSTK.FieldbyName('TINID').AsString := dm1.cdsKDX.FieldbyName('TINID').AsString;

      CantidadActG := 0;
      CantidadActU := 0;
      MontoActG := 0;
      MontoActU := 0;
   End
   Else
   Begin
      dm1.cdsSTK.Edit;
      CantidadActG := dm1.cdsSTK.FieldByName(CntGFName).AsFloat;
      CantidadActU := dm1.cdsSTK.FieldByName(CntUFName).AsFloat;
      MontoActG := dm1.cdsSTK.FieldByName(MntGFName).AsFloat;
      MontoActU := dm1.cdsSTK.FieldByName(MntUFName).AsFloat;
   End;
   DM1.ActualizaCantidadMonto(CantidadG, CantidadU, Contenido, 'S', PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU);
   DM1.cdsSTK.FieldByName(CntGFName).AsFloat := CantidadActG;
   DM1.cdsSTK.FieldByName(CntUFName).AsFloat := CantidadActU;
   DM1.cdsSTK.FieldByName(MntGFName).AsFloat := MontoActG;
   DM1.cdsSTK.FieldByName(MntUFName).AsFloat := MontoActU;

   CantidadActG := dm1.cdsSTK.FieldByName('STKSACTG').AsFloat;
   CantidadActU := dm1.cdsSTK.FieldByName('STKSACTU').AsFloat;

   ActualizaCantidad(CantidadG, CantidadU, Contenido, SumaResta,
      CantidadActG, CantidadActU);
   dm1.cdsSTK.FieldByName('STKSACTG').AsFloat := CantidadActG;
   dm1.cdsSTK.FieldByName('STKSACTU').AsFloat := CantidadActU;
   dm1.cdsSTK.Post;
End;

Procedure TFAjustesI.ActualizaOC(sCIA: String; Contenido: Double);
Var
   fCNAT, fCNT, fCTS: Double;
   fCNATg, fCNATu, fCTSg, fCTSu: Double;
   fCINgresada: Double;
   sODCID, sDODCID: String;
Begin
// -----------------------------------------------------------------------------

   sODCID := dm1.cdsKDX.FieldByName('ODCID').AsString;
   sDODCID := dm1.cdsKDX.FieldByName('DODCID').AsString;

   If Not dm1.cdsDOCATT2.Locate('CIAID;ODCID;DODCID',
      VarArrayOf([sCIA, sODCID, sDODCID]), []) Then
   Begin
      MessageDlg('Error buscando' + #13 + sCIA + ';' + sODCID + ';' + sDODCID
         , mtError, [mbOk], 0);
      exit;
   End;

   fCNT := dm1.cdsDOCATT2.FieldByName('DODCCNTG').AsFloat * Contenido + DM1.cdsDOCATT2.FieldByName('DODCCNTU').AsFloat;
   fCTS := dm1.cdsDOCATT2.FieldByName('DODCCSLDG').AsFloat * Contenido + DM1.cdsDOCATT2.FieldByName('DODCCSLDU').AsFloat;
   FCNAT := dm1.cdsDOCATT2.FieldByName('DODCCATEG').AsFloat * Contenido + DM1.cdsDOCATT2.FieldByName('DODCCATEU').AsFloat;

   fCIngresada := dm1.cdsKDX.FieldByName('KDXCNTG').AsFloat * Contenido + dm1.cdsKDX.FieldByName('KDXCNTU').AsFloat;

  //if fCIngresada > fCTS then
  //    ErrorMsg('Ojo','La cantidad Ingresada excede al saldo !!!');
   fCNAT := fCNAT + fCIngresada;
   fCTS := fCTS - fCIngresada;

   dm1.CocienteResto(fCNAT, Contenido, fCNATg, fCNATu);
   dm1.CocienteResto(fCTS, Contenido, fCTSg, fCTSu);
   DM1.cdsDOCATT2.Edit;
   DM1.cdsDOCATT2.FieldByName('DODCCATEG').AsFloat := fCNATg;
   DM1.cdsDOCATT2.FieldByName('DODCCATEU').AsFloat := fCNATu;
   DM1.cdsDOCATT2.FieldByName('DODCCSLDG').AsFloat := fCTSg;
   DM1.cdsDOCATT2.FieldByName('DODCCSLDU').AsFloat := fCTSu;

   If fCTS <= 0 Then
      DM1.cdsDOCATT2.FieldByName('ODCEST').AsString := 'ATENDIDO'
   Else
      DM1.cdsDOCATT2.FieldByName('ODCEST').AsString := 'PARCIAL';

   dm1.cdsDOCATT2.Post;
End;

{ Actualiza las cantidades y montos de los articulos a nivel de empresa }
{ INP: Kardex (detalle de la nota), cdsKDX
  OUP: Maestro de Artículo, cdsArt
}

Procedure TFAjustesI.ActualizaArticulo(sCIA, sArt: String; Contenido: Double; IngSal: Char);
Var
   CantidadG, CantidadU: Double;
   PrecioG, PrecioU: Double;
   SumaResta: Char;
   CantidadActG, CantidadActU, MontoActG, MontoActU: Double;
Begin
   If IngSal = 'S' Then
   Begin
      PrecioG := dm1.cdsArti.FieldByName('ARTCPROG').AsFloat;
      PrecioU := dm1.cdsArti.FieldByName('ARTCPROU').AsFloat;
      SumaResta := 'R';
   End
   Else
   Begin
      PrecioG := dm1.cdsKDX.FieldByName('ARTPCG').AsFloat;
      PrecioU := dm1.cdsKDX.FieldByName('ARTPCU').AsFloat;
      SumaResta := 'S';
   End;
   CantidadG := dm1.cdsKDX.FieldByName('KDXCNTG').AsFloat;
   CantidadU := dm1.cdsKDX.FieldByName('KDXCNTU').AsFloat;

   dm1.cdsArti.edit;
   CantidadActG := dm1.cdsArti.FieldByName('ARTCNTG').AsFloat;
   CantidadActU := dm1.cdsArti.FieldByName('ARTCNTU').AsFloat;
   MontoActG := dm1.cdsArti.FieldByName('ARTMNTG').AsFloat;
   MontoActU := dm1.cdsArti.FieldByName('ARTMNTU').AsFloat;

   DM1.ActualizaCantidadMonto(CantidadG, CantidadU, Contenido, SumaResta, PrecioG, PrecioU,
      CantidadActG, CantidadActU, MontoActG, MontoActU);
   dm1.cdsArti.FieldByName('ARTCNTG').AsFloat := CantidadActG;
   dm1.cdsArti.FieldByName('ARTCNTU').AsFloat := CantidadActU;
   dm1.cdsArti.FieldByName('ARTMNTG').AsFloat := MontoActG;
   dm1.cdsArti.FieldByName('ARTMNTU').AsFloat := MontoActU;
   If (dm1.cdsArti.FieldByName('ARTCNTG').AsFloat <> 0) Then
      dm1.cdsArti.FieldByName('ARTCPROG').AsFloat := dm1.cdsArti.FieldByName('ARTMNTG').AsFloat / dm1.cdsArti.FieldByName('ARTCNTG').AsFloat;
   If dm1.cdsArti.FieldByName('ARTCNTU').AsFloat <> 0 Then
      dm1.cdsArti.FieldByName('ARTCPROU').AsFloat := dm1.cdsArti.FieldByName('ARTMNTU').AsFloat / dm1.cdsArti.FieldByName('ARTCNTU').AsFloat;

   If dm1.cdsCia.FieldByName('CIAACPRC').AsString = 'S' Then
   Begin
      If dm1.cdsKDX.FieldByName('NISAFREG').AsDateTime > dm1.cdsArti.FieldByName('ARTFUPRC').AsDateTime Then
      Begin
         dm1.cdsArti.FieldByName('ARTPCG').AsFloat := dm1.cdsKDX.FieldByName('ARTPCG').AsFloat;
         dm1.cdsArti.FieldByName('ARTPCU').AsFloat := dm1.cdsKDX.FieldByName('ARTPCU').AsFloat;
      End;
   End;
   dm1.cdsArti.post;
End;

Procedure TFAjustesI.ActualizaCantidad(CantidadG, CantidadU, Contenido: double; SumaResta: Char;
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

// Hacer la operacion de Num1/Num2, y devuelve el cociente y el resto

Procedure TFAjustesI.CocienteResto(Num1, Num2: double; Var Cociente, Resto: double);
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

{
// Falta Num1 unidades, Num1 es un numero con signo, negativo indica falta
 ejm: Num1 = -3 , Num2 = 12
 ==> -3 = (-1)*12 + 9, Cociente = -1 Resto = 9
 ejm: Num1 = -25, Num2 = 12
  ==> -25 = (-3)*12 + 11, Cociente = -3, Resto = 11
}

Procedure TFAjustesI.CocienteRestoFalta(Num1, Num2: double; Var Cociente, Resto: double);
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

Procedure TFAjustesI.ControlStock1(sCIA, sALM, sLOC, sArt, Ano, Mes: String; Contenido: Double; IngSal: Char);
Var
  //CantidadG, CantidadU	: Double;
  //PrecioG, PrecioU  : Double;
 //STKSANTG,STKSANTU					: Double;
  {CantidadActG, CantidadActU, }MontoActG, MontoActU: Double;
   CntGFName, CntUFName, MntGFName, MntUFName: String;
  //SumaResta : Char;
   vmonto: integer;
Begin
   CntGFName := 'STK' + IngSal + 'SG' + Mes;
   CntUFName := 'STK' + IngSal + 'SU' + Mes;
   MntGFName := 'STK' + IngSal + 'MG' + Mes;
   MntUFName := 'STK' + IngSal + 'MU' + Mes;
   If IngSal = 'S' Then
      vmonto := 0 - StrToInt(dbePrecioG.Text)
   Else
      vmonto := StrToInt(dbePrecioG.Text);
   If dm1.cdsSTK.Locate('CIAID;ALMID;ARTID;STKANO;LOCID', VarArrayOf([sCIA, sALM, sART, Ano, sLOC]), []) Then
   Begin
      dm1.cdsSTK.Edit;
      MontoActG := dm1.cdsSTK.FieldByName(MntGFName).AsFloat;
      MontoActU := dm1.cdsSTK.FieldByName(MntUFName).AsFloat;
   End;
   If MontoActG <> 0 Then
   Begin
      MontoActG := MontoActG + vmonto;
      dm1.cdsSTK.FieldByName('STKMACTG').AsFloat := dm1.cdsSTK.FieldByName('STKMACTG').AsFloat + vmonto;
   End;
   If MontoActU <> 0 Then
   Begin
      MontoActU := MontoActU + vmonto;
      dm1.cdsSTK.FieldByName('STKMACTU').AsFloat := dm1.cdsSTK.FieldByName('STKMACTU').AsFloat + vmonto;
   End;
   If dm1.cdsSTK.State = dsBrowse Then // OJO Revisar
      dm1.cdsSTK.Edit;
   dm1.cdsSTK.FieldByName(MntGFName).AsFloat := MontoActG;
   dm1.cdsSTK.FieldByName(MntUFName).AsFloat := MontoActU;
   dm1.cdsSTK.FieldByName('TINID').AsString := vTinid;
   dm1.cdsSTK.FieldByName('FAMID').AsString := vFam;
   dm1.cdsSTK.FieldByName('SFAMID').AsString := vSubFam;
   dm1.cdsSTK.Post;
  //end;
End;

Procedure TFAjustesI.dblcCIAExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
   dbeCIA.Text := DM1.DisplayDescrip('prvLOG', 'TGE101', 'CIADES', xWhere, 'CIADES');
   If dbeCia.Text = '' Then
      ShowMessage('Falta Compañia');
End;

Procedure TFAjustesI.dblcLOCExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'LOCID=' + quotedstr(dblcLOC.Text);
   dbeLOC.Text := DM1.DisplayDescrip('prvLOG', 'TGE126', 'LOCDES', xWhere, 'LOCDES');
   If dbeLoc.Text = '' Then
      ShowMessage('Falta Localidad');
End;

Procedure TFAjustesI.dblcTALMExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'ALMID=' + quotedstr(dblcTAlm.Text);
   dbeALM.Text := DM1.DisplayDescrip('prvLOG', 'TGE151', 'ALMDES', xWhere, 'ALMDES');
   If dbeALM.Text = '' Then
      ShowMessage('Falta Almacen');
End;

Procedure TFAjustesI.dblcTDAExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'TDAID=' + quotedstr(dblcTDA.Text);
   dbeTDNISA.Text := DM1.DisplayDescrip('prvLOG', 'TGE157', 'TDADES', xWhere, 'TDADES');
   If dbeTDNISA.Text = '' Then
      ShowMessage('Falta Tipo de Documento');
End;

Procedure TFAjustesI.dblcTransacExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'TRIID=' + quotedstr(dblcTransac.Text);
   dbeTRANSAC.Text := DM1.DisplayDescrip('prvLOG', 'TGE208', 'TRIDES', xWhere, 'TRIDES');
   If dbeTRANSAC.Text = '' Then
      ShowMessage('Falta Transacción');
End;

Procedure TFAjustesI.dblcdCCExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CCOSID=' + quotedstr(dblcdCC.Text);
   dbeCC.Text := DM1.DisplayDescrip('prvLOG', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES');
   If dbeCC.Text = '' Then
      ShowMessage('Falta Centro de Costo');
End;

Procedure TFAjustesI.dblcdTDOCExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'DOCID=' + quotedstr(dblcdTDOC.Text);
   dbeTDOC.Text := DM1.DisplayDescrip('prvLOG', 'TGE110', 'DOCDES', xWhere, 'DOCDES');
   If dbeTDoc.Text = '' Then
      ShowMessage('Falta Documento de Referencia');
End;

//** 15/03/2001 - pjsv

Procedure TFAjustesI.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;
//**

Procedure TFAjustesI.FormActivate(Sender: TObject);
Var
   xsql: String;
Begin
  //** 05/04/2001 - pjsv
   xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
   DM1.cdsCCost.Close;
   DM1.cdsCCost.DataRequest(xsql);
   DM1.cdsCCost.open;
  //**

End;

End.

