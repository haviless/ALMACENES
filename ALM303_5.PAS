Unit ALM303_5;
// HPC_201602_ALM 30/04/2016 Entrega a Calidad
//
{ 22/08/2000 pjsv }
Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
   wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
   Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin;

Type
   TFAjustesS = Class(TForm)
      pnlCabecera: TPanel;
      dblcCIA: TwwDBLookupCombo;
      lblCIA: TLabel;
      Z2bbtnOK: TBitBtn;
      Z2bbtnBorrar: TBitBtn;
      dbeNumNISA: TwwDBEdit;
      lblNumNS: TLabel;
      dbmObs: TDBMemo;
      lblObs: TLabel;
      pnlDetalleG: TPanel;
      dbgDReqs: TwwDBGrid;
      dbeCIA: TwwDBEdit;
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
      dbeALM: TwwDBEdit;
      Label2: TLabel;
      dbdtpFNS: TwwDBDateTimePicker;
      lblFReg: TLabel;
      lblTDocumento: TLabel;
      dbeTDOC: TwwDBEdit;
      lblNDoc: TLabel;
      dbeNDoc: TwwDBEdit;
      lblFDoc: TLabel;
      dbdtpFDoc: TwwDBDateTimePicker;
      dbeSolic: TwwDBEdit;
      lblSolic: TLabel;
      dblcdTDOC: TwwDBLookupComboDlg;
      dbePrecioG: TwwDBEdit;
      lblTransacc: TLabel;
      dblcTransac: TwwDBLookupCombo;
      dbeTransac: TwwDBEdit;
      lblCC: TLabel;
      dblcdCC: TwwDBLookupComboDlg;
      dbeCC: TwwDBEdit;
      dblcdProv: TwwDBLookupComboDlg;
      lblProv: TLabel;
      dbeProv: TwwDBEdit;
      Label7: TLabel;
      dblcTDA: TwwDBLookupCombo;
      dbeTDNISA: TwwDBEdit;
      Bevel2: TBevel;
      Label3: TLabel;
      dblcLOC: TwwDBLookupCombo;
      dbeLOC: TwwDBEdit;
      stxTitulo2: TPanel;
      stxTitulo1: TPanel;
      lblSerie: TLabel;
      dbeSerie: TwwDBEdit;
      Label6: TLabel;
      deObra: TwwDBEdit;
      Label8: TLabel;
      dbeLote: TwwDBEdit;
      Label9: TLabel;
      dbePO: TwwDBEdit;
      Label10: TLabel;
      dbeNP: TwwDBEdit;
      Label11: TLabel;
      dblcLOCOri: TwwDBLookupCombo;
      Label12: TLabel;
      dbeLOCOri: TwwDBEdit;
      dblcTALMOri: TwwDBLookupCombo;
      dbeALMOri: TwwDBEdit;
      blUnimedG: TLabel;
      blUnimedU: TLabel;
      dbePrecioU: TwwDBEdit;
      dbeCantidadU: TwwDBEdit;
      Z2bbtnAceptar: TBitBtn;
      Z2bbtnRegresa: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      lblEstado: TLabel;
      Label4: TLabel;
      dblcTInv: TwwDBLookupCombo;
      dbeTinv: TEdit;
      Label5: TLabel;
      dblcTINOri: TwwDBLookupCombo;
      dbeTINOri: TEdit;
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
      Procedure dbgDReqsKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgDReqsDblClick(Sender: TObject);
      Procedure dbeNumNISAExit(Sender: TObject);
      Procedure dbmObsKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbcldArtiChange(Sender: TObject);
      Procedure dblcExist(Sender: TObject);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcNISAChange(Sender: TObject);
      Procedure dblcTransacChange(Sender: TObject);
      Procedure dbeCantidadGExit(Sender: TObject);
      Procedure dblcdCCChange(Sender: TObject);
      Procedure dblcdTDOCChange(Sender: TObject);
      Procedure dblcTDAChange(Sender: TObject);
      Procedure Z2bbtnAceptarClick(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure dblcTDAExit(Sender: TObject);
      Procedure dblcTransacExit(Sender: TObject);
      Procedure dblcLOCOriEnter(Sender: TObject);
      Procedure dblcdCCExit(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure dblcdTDOCExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormActivate(Sender: TObject);
   Private
    { Private declarations }
      iEstado: Integer;
      vFam, vSubFam, vTinid: String;
      Procedure AsigDat;

      Procedure dcCIA;
      Procedure dcALM;
      Procedure dcTDA;
      Procedure dcLOC;

      Procedure OnOffDetalle(Value: Boolean);
      Procedure OnOffCabecera(Value: Boolean);
      Procedure btnDetalle;
      Function EHandlerError(Ex: Exception): Boolean;
      Function IsClose(Const sCIA, sALM, sLOC: String;
         Const dFEC: TDateTime; Var MaxFecha: TDateTime): Boolean;
      Procedure Init(Sender: TObject);
      Procedure GeneraIngresoTrans();
      Procedure ActivaBotones(pnl: TPanel; xFlag: Boolean);
      Procedure ControlStock1(sCIA, sALM, sLOC, sArt, Ano, Mes: String; Contenido: Double; IngSal: Char);
   Public
    { Public declarations }
      Procedure Edita;
      Procedure Adiciona;
   End;

Var
   FAjustesS: TFAjustesS;

Implementation

Uses ALMDM1, ALM303;

{$R *.DFM}

Procedure TFAjustesS.Z2bbtnOKClick(Sender: TObject);
Var
   sCIA, sALM, sLOC: String;
   dFEC, xFEC: TDateTime;
   D, M, Y: Word;

Begin
   If DM1.cdsNIS.State In [dsInsert, dsEdit] Then
   Try
      AsigDat; // asignar los datos predeterminados

     { preguntar si el mes no ha sido cerrado para poder grabar, en todo caso
       se debe cambiar la fecha de nota de salida.
     --------------------------------------------------------------------------}
      sCIA := DM1.cdsNIS.FieldByName('CIAID').AsString;
      sALM := DM1.cdsNIS.FieldByName('ALMID').AsString;
      dFEC := DM1.cdsNIS.FieldByName('NISAFREG').AsDateTime;
      sLOC := DM1.cdsNIS.FieldByName('LOCID').AsString;

      DecodeDate(dFEC, Y, M, D);

      If Not IsClose(sCIA, sLOC, sALM, dFEC, xFEC) Then
      Begin
         ErrorMsg('Error', 'No se puede registrar la nota de salida al' +
            ' ' + DM1.strzero(IntToStr(D), 2) + ' de ' + LongMonthNames[M] + ' del ' + IntToStr(Y) + ' ' + #13 +
            'La fecha ya se halla cerrada...');
         btnDetalle;
         Exit;
         { salir no se denbe actualizar los datos de los registros }
      End;

      DM1.cdsNIS.Post;

      OnOffCabecera(False); //Desactivar el panel de Cabecera
      OnOffDetalle(True); //Activar el panel de detalle

      pnlDetalleG.SetFocus;
      Z2bbtnCanc2.Enabled := True;
      //
      Z2bbtnRegresa.Enabled := true;
      If Z2bbtnNuevo.Visible Then
         Z2bbtnCanc2.Enabled := False
      Else
         Z2bbtnCanc2.Enabled := True;
      Z2bbtnGraba.Enabled := true;

      Z2bbtnAceptar.Enabled := false;
      Z2bbtnNuevo.Enabled := false;
      //
   Except
      On E: Exception Do
         If Not EHandlerError(E) Then Raise;
   End;
End;

Procedure TFAjustesS.Z2bbtnBorrarClick(Sender: TObject);
Begin
 //REVISAR
   Exit;
   If DM1.cdsNIS.State In [dsInsert, dsEdit] Then
   Begin
      Z2bbtnOK.Enabled := False;
      DM1.cdsNIS.Cancel;
      OnOffCabecera(False); //Desactivar el panel de Cabecera
      DM1.cdsNIS.Insert;
      Init(Nil);
   End;
End;

Procedure TFAjustesS.AsigDat;
Var
   D, M, Y: Word;
Begin
 // --> Asignar datos de cabecera de requisición
   If DM1.cdsNIS.State In [dsInsert, dsEdit] Then
   Begin
      DecodeDate(Now, Y, M, D);
      If DM1.cdsNIS.FieldbyName('NISAFREG').IsNull Then
         DM1.cdsNIS.FieldbyName('NISAFREG').AsDateTime := Date;

      DM1.cdsNIS.FieldbyName('NISATIP').AsString := 'SALIDA';
  //puesto por wmc
      DM1.cdsNIS.fieldbyname('NISSIT').AsString := 'INICIAL';
      If (DM1.cdsNIS.State In [dsInsert]) And (DM1.cdsNIS.FieldbyName('NISAObs').IsNull) Then
         DM1.cdsNIS.FieldbyName('NISAObs').AsString := '.'; // colocar datos en blanco o algo
                                                       //dbiGetNetUserName(sP);
   End;
End;

Procedure TFAjustesS.FormCreate(Sender: TObject);
Var
   ssql: String;
Begin
   ssql := '';
   ssql := 'Select * FROM TGE208 WHERE TRISGT=''S'' AND TRITMOV=''C''';
   dm1.cdsTRAN.Close;
   dm1.cdsTRAN.DataRequest(ssql);
   dm1.cdsTRAN.Open;
 //wmc1708  Init(Sender);
   dbcldArti.OnNotInList := dblcNotInList;
   dblcdCC.OnNotInList := dblcNotInList;
   dblcdTDOC.OnNotInList := dblcNotInList;
   dblcdProv.OnNotInList := dblcNotInList;
End;

Procedure TFAjustesS.Z2bbtnRegresaClick(Sender: TObject);
Begin
   DM1.cdsNIS.Edit;
   OnOffCabecera(True);
   OnOffDetalle(False);
   ActivaBotones(pnlDetalleG, False);
End;

Procedure TFAjustesS.Z2bbtnGrabaClick(Sender: TObject);
Var
   sCIA, sALM, sLOC: String;

Begin
   sCIA := DM1.cdsNIS.FieldByName('CIAID').AsString;
   sALM := DM1.cdsNIS.FieldByName('ALMID').AsString;
   sLOC := DM1.cdsNIS.FieldByName('LOCID').AsString;
  //dm1.ControlTran;
   DM1.ControlTran(0, Nil, '');
   btnDetalle;
 //wmc1808
   lblEstado.Caption := 'INICIAL';
   Z2bbtnRegresa.Enabled := true;
   Z2bbtnCanc2.Enabled := False;
   Z2bbtnGraba.Enabled := False;
   Z2bbtnAceptar.Enabled := True;
   Z2bbtnNuevo.Enabled := True;
  //cdsNIS.ApplyUpdates(0);
  //cdsKDX.ApplyUpdates(0);
  //cdsCNS.ApplyUpdates(0);
  //cdsSTK.ApplyUpdates(0);
  //Genera una nota de Ingreso por concepto de Transferencia
 //GeneraIngresoTrans();
  { Aqui se deben actualizar los saldos corespondientes a los artículos
  ---------------------------------------------------------------------------
  Si no existen registros en stock sobre el articulo se debe insertar el
  articulo con su saldo  año anterior 0  y el mes corespondiente procesado
  en la cantidad de ingreso
  sería bueno saber, para no perder tiempo quien registra la nota de salida,
  si es un usuario común o el almacenero para no perder tiempo en la
  actualización del stock al momento de guardar. Lo mas sencillo sería
  pasarle un identificador a la forma para saber si es un REQUERIMIENTO oZ2bbtnAceptar
  --------------------------------------------------------------------------- }
  {DecodeDate(dFEC,Y, M, D);
  sLART := '';
  sANO := IntToStr(Y);
  cdsKDX.First;
  while not cdsKDX.Eof do
  begin
    DecodeDate( cdsKDX.FieldByName('NISAFREG').AsDateTime, Y, M, D);
    if (sANO = IntToStr(Y)) and (cdsKDX.FieldByName('KDXSALIDA').AsFloat > 0) then
    begin
      sART  := cdsKDX.FieldByName('ARTID').AsString;
      sLART := sLART + ' (ARTID = '''+sART+''') OR';
    end;
  cdsKDX.Next;
  end;
  //Actualizar si existen articulos atendidos
  if sLART <> '' then
  begin
   sLART := copy (sLART, 1,length(sLART)-3); // quitar el último OR
    SaldosArt(sCIA, sALM, sANO, sLOC, sLART);       // actualizar saldos
  end;}
End;

Procedure TFAjustesS.Z2bbtnCanc2Click(Sender: TObject);
Begin
 //Revisar
   exit;
   DM1.cdsNIS.CancelUpdates;
   DM1.cdsKDX.CancelUpdates;
   Z2bbtnNuevoClick(Nil);
End;

Procedure TFAjustesS.Z2dbgDReqsIButtonClick(Sender: TObject);
Begin
   iEstado := 0;
   dbcldArti.Clear;
   dbeArti.Clear;
   dbePrecioG.text := '0';
   dbePrecioU.text := '0';
 //dbeCantidadG.text:= '0';
 //dbeCantidadU.text:= '0';
   dbeItem.Text := DM1.StrZero(DM1.MaxValue('KDXID', DM1.cdsKDX), 3);
   pnlDetalleA.Visible := True;
   pnlDetalleA.BringToFront;
   OnOffDetalle(False); // Desactivar el panel de detalle
   btnDetalle;
End;

Procedure TFAjustesS.Z2bbtnRegOkClick(Sender: TObject);
Var
   sCIA, sART, sALM,
      sNISA, sTDA, sLOC: String;
   dFECHAR: TDateTime;
   bExiste: Boolean;
   D, M, Y: Word;
   sP: Array[0..14] Of Char;
   PrecioG, PrecioU, CantidadG, CantidadU, SaldoG, SaldoU, Contenido: Double;
Begin
   sART := dbcldArti.Text;
   Contenido := dm1.cdsArti.FieldByName('ARTCONT').AsFloat;
   If sART = '' Then
   Begin
      ErrorMSg('Error', 'El código del artículo es obligatorio');
      dbcldArti.SetFocus;
      Exit;
   End;
   If dbePrecioG.Text = '' Then dbePrecioG.Text := '0';
   If dbePrecioU.Text = '' Then dbePrecioU.Text := '0';
 {23/08/2000 pjsv; se desactiva porque sólo se necesita el ajuste
  if dbeCantidadG.Text = '' then dbeCantidadG.Text := '0';
  if dbeCantidadU.Text = '' then dbeCantidadU.Text := '0';
  CantidadG := StrToFloat(dbeCantidadG.Text);
  CantidadU := StrToFloat(dbeCantidadU.Text);}
   PrecioG := StrToFloat(dbePrecioG.Text);
   PrecioU := StrToFloat(dbePrecioU.Text);
 {23/08/2000 pjsv; se desactiva porque sólo se necesita el ajuste
  if CantidadG * Contenido + CantidadU > PedidoG * Contenido + PedidoU then
  begin
   ErrorMsg('Error','La cantidad atendida no puede ser mayor a la Pedida');
    Exit;
  end;}
 {23/08/2000 pjsv; se agrego}
   If (PrecioG = 0) And (PrecioU = 0) Then
   Begin
      ErrorMsg('Error', 'El ajuste no puede ser CERO');
      Exit;
   End;
   sCIA := DM1.cdsNIS.FieldByName('CIAID').AsString;
   sALM := DM1.cdsNIS.FieldByName('ALMID').AsString;
   dFECHAR := DM1.cdsNIS.FieldByName('NISAFREG').AsDateTime;
   sNISA := DM1.cdsNIS.FieldByName('NISAID').AsString;
   sTDA := DM1.cdsNIS.FieldByName('TDAID').AsString;
   sLOC := DM1.cdsNIS.FieldByName('LOCID').AsString;
   If iEstado = 0 Then
   Begin
      bExiste := DM1.cdsKDX.Locate('CIAID;ALMID;ARTID;NISAID;TDAID;LOCID',
         VarArrayOf([sCIA, sALM, sART, sNISA, sTDA, sLOC]), [])
   End
   Else
      bExiste := False;
   If bExiste Then // localizar el valor....
   Begin
      ErrorMsg('Error', 'No pueden existir artículos duplicados...');
      Exit; // salir del procedimiento
   End;
   DecodeDate(dFECHAR, Y, M, D);
   If Not DM1.cdsSTK.Locate('CIAID;ALMID;ARTID;STKANO;LOCID',
      VarArrayOf([sCIA, sALM, sART, IntToStr(Y), sLOC]), []) Then
   Begin
   // si no existe el articulo salir del procedimiento
    //ErrorMsg('Error','No se puede dar salida...'#13'el artículo no existe en STOCK!!!');
    //Exit;
   End;
  {Guardar los datos del detalle }
   Screen.Cursor := crHourGlass;
   If iEstado = 0 Then
      DM1.cdsKDX.Insert
   Else
      DM1.cdsKDX.Edit;
 {+----------------------------------------------------------------------------+
  |                     GENERANDO MOVIMIENTO DEL ARTICULO                      |
  |     1. Insertar o adicionar registros del movimiento de los artículos      |
  +----------------------------------------------------------------------------+}
   If DM1.cdsKDX.State In [dsInsert, dsEdit] Then
   Begin
      Try
         DM1.cdsKDX.FieldByName('KDXID').AsString := dbeItem.Text;
         DM1.cdsKDX.FieldByName('CIAID').AsString := sCIA;
         DM1.cdsKDX.FieldByName('ALMID').AsString := sALM;
         DM1.cdsKDX.FieldByName('ARTID').AsString := sART;
         DM1.cdsKDX.FieldByName('TDAID').AsString := sTDA;
         DM1.cdsKDX.FieldByName('LOCID').AsString := sLOC;
         DM1.cdsKDX.FieldByName('KDXFREG').AsDateTime := dFECHAR;
      //FieldByName('KDXPEDIDOG').AsFloat  := PedidoG;
      //FieldByName('KDXPEDIDOU').AsFloat  := PedidoU;
      //FieldByName('KDXCNTG').AsFloat  := CantidadG;
      //FieldByName('KDXCNTU').AsFloat  := CantidadU;
      //dm1.CocienteResto(PedidoG*Contenido+PedidoU,CantidadG*Contenido+CantidadU,SaldoG,SaldoU);
      //FieldByName('KDXSALDOG').AsFloat   := SaldoG;
      //FieldByName('KDXSALDOU').AsFloat   := SaldoU;
         DM1.cdsKDX.FieldByName('LKARTDES').AsString := DM1.cdsARTI.FieldByName('ARTDES').AsString;
         DM1.cdsKDX.FieldByName('ARTDES').AsString := DM1.cdsARTI.FieldByName('ARTDES').AsString;
      //  FieldByName('ARTABR').AsString     := cdsARTI.FieldByName('ARTABR').AsString;
         DM1.cdsKDX.FieldByName('GRARID').AsString := DM1.cdsARTI.FieldByName('GRARID').AsString;
         DM1.cdsKDX.FieldByName('ARTCONT').AsFloat := DM1.cdsARTI.FieldByName('ARTCONT').AsFloat;
         DM1.cdsKDX.FieldByName('UNMIDG').AsString := DM1.cdsARTI.FieldByName('UNMIDG').AsString;
         DM1.cdsKDX.FieldByName('UNMIDU').AsString := DM1.cdsARTI.FieldByName('UNMIDU').AsString;
         DM1.cdsKDX.FieldByName('FABID').AsString := DM1.cdsARTI.FieldByName('FABID').AsString;
         DM1.cdsKDX.FieldByName('ARTSPRO').AsString := DM1.cdsARTI.FieldByName('ARTSPRO').AsString;
         DM1.cdsKDX.FieldByName('ARTSCA').AsString := DM1.cdsARTI.FieldByName('ARTSCA').AsString;
         DM1.cdsKDX.FieldByName('ARTPARA').AsString := DM1.cdsARTI.FieldByName('ARTPARA').AsString;
         DM1.cdsKDX.FieldByName('ARTSNA').AsString := DM1.cdsARTI.FieldByName('ARTPARA').AsString;
      // El costo de la salida toma el costo promedio actual
      // Eso me sirve para el caso de transferencia
      // En realidad, el costo de salida real, lo determina recien en el momento de
      // aceptar la nota de salida
         DM1.cdsKDX.FieldByName('ARTPCU').AsFloat := StrToFloat(dbePrecioU.text); //cdsARTI.FieldByName('ARTCPROU').AsFloat;
         DM1.cdsKDX.FieldByName('ARTPCG').AsFloat := StrToFloat(dbePrecioG.text); //cdsARTI.FieldByName('ARTCPROG').AsFloat;
         DM1.cdsKDX.FieldByName('ARTPVU').AsFloat := DM1.cdsARTI.FieldByName('ARTPVU').AsFloat;
         DM1.cdsKDX.FieldByName('ARTPVG').AsFloat := DM1.cdsARTI.FieldByName('ARTPVG').AsFloat;
         DM1.cdsKDX.FieldByName('ARTFUC').AsDateTime := DM1.cdsARTI.FieldByName('ARTFUC').AsDateTime;
         DM1.cdsKDX.FieldByName('TMONID').AsString := DM1.cdsARTI.FieldByName('TMONID').AsString;
         DM1.cdsKDX.FieldByName('ARTCRGO').AsFloat := DM1.cdsARTI.FieldByName('ARTCRGO').AsFloat;
         DM1.cdsKDX.FieldByName('ARTACTIVO').AsString := DM1.cdsARTI.FieldByName('ARTACTIVO').AsString;
         DM1.cdsKDX.FieldByName('CUENTAID').AsString := DM1.cdsARTI.FieldByName('CUENTAID').AsString;
         DM1.cdsKDX.FieldByName('PROV').AsString := DM1.cdsNIS.FieldByName('PROV').AsString;
         DM1.cdsKDX.FieldByName('DOCID').AsString := DM1.cdsNIS.FieldByName('DOCID').AsString;
         DM1.cdsKDX.FieldByName('TRIID').AsString := DM1.cdsNIS.FieldByName('TRIID').AsString;
         DM1.cdsKDX.FieldByName('CCOSID').AsString := DM1.cdsNIS.FieldByName('CCOSID').AsString;
         DM1.cdsKDX.FieldByName('ODCID').AsString := DM1.cdsNIS.FieldByName('ODCID').AsString;
         DM1.cdsKDX.FieldByName('NISAID').AsString := DM1.cdsNIS.FieldByName('NISAID').AsString;
         DM1.cdsKDX.FieldByName('NISATIP').AsString := DM1.cdsNIS.FieldByName('NISATIP').AsString;
         DM1.cdsKDX.FieldByName('NISASOLIC').AsString := DM1.cdsNIS.FieldByName('NISASOLIC').AsString;
         DM1.cdsKDX.FieldByName('NISAFREG').AsDateTime := DM1.cdsNIS.FieldByName('NISAFREG').AsDateTime;
         DM1.cdsKDX.FieldByName('NISANDOC').AsString := DM1.cdsNIS.FieldByName('NISANDOC').AsString;
         DM1.cdsKDX.FieldByName('NISAFDOC').AsDateTime := DM1.cdsNIS.FieldByName('NISAFDOC').AsDateTime;
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
     {crear articulos de stock si no existe el articulo correspondiente}
         OnOffDetalle(True); // Activar Detalle
         pnlDetalleA.Visible := False;
         btnDetalle;
   //wmc1808
         If Z2bbtnNuevo.Visible Then
            Z2bbtnCanc2.Enabled := False
         Else
            Z2bbtnCanc2.Enabled := True;
         Z2bbtnGraba.Enabled := true;
         Z2bbtnAceptar.Enabled := false;
         Z2bbtnNuevo.Enabled := false;
   //
      Except
         On E: Exception Do EHandlerError(E);
      End;
   End;
   Screen.Cursor := crDefault;
End;

Procedure TFAjustesS.Z2bbtnRegCancClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   If DM1.cdsKDX.State In [dsInsert, dsEdit] Then
      DM1.cdsKDX.Cancel;
   OnOffDetalle(True); // activar detalle
   pnlDetalleA.Visible := False;
   Screen.Cursor := crDefault;
End;

Procedure TFAjustesS.OnOffCabecera(Value: Boolean);
Begin
  // ....................... activar cabecera de requisición ...................
   pnlCabecera.Enabled := Value;
   Z2bbtnBorrar.Enabled := Value;
   Z2bbtnOK.Enabled := Value;
End;

Procedure TFAjustesS.OnOffDetalle(Value: Boolean);
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

{  wmc1808
   if Value then
   begin
    Z2bbtnNuevo.SetFocus;
   end;
}
   btnDetalle;
End;

Procedure TFAjustesS.btnDetalle;
Var
   bDummy1: Boolean;
Begin
   bDummy1 := (DM1.cdsKDX.RecordCount > 0) And
      ((DM1.cdsNIS.ChangeCount > 0) Or
      (DM1.cdsKDX.ChangeCount > 0) Or
      (DM1.cdsNIS.Modified) Or
      (DM1.cdsKDX.Modified));
   Z2bbtnGraba.Enabled := bDummy1;
   Z2bbtnCanc2.Enabled := bDummy1;
   Z2bbtnNuevo.Enabled := (DM1.cdsKDX.ChangeCount = 0) And (DM1.cdsNIS.ChangeCount = 0);
End;

Procedure TFAjustesS.Z2bbtnNuevoClick(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTIN, sTDA, sLOC: String;
Begin
 //Revisar
   Exit;
   OnOffCabecera(True);
   OnOffDetalle(False);
   dblcCIA.Enabled := True;
   dbeNumNISA.Enabled := True;
   dblcTALM.Enabled := True;

   DM1.cdsNIS.Insert;
   If DM1.cdsNIS.State In [dsInsert] Then
   Begin
      dcCIA;
      dcALM;
      dcTDA;
      dcLOC;
      sCIA := DM1.cdsNIS.FieldByName('CIAID').AsString;
      sALM := DM1.cdsNIS.FieldByName('ALMID').AsString;
      sTDA := DM1.cdsNIS.FieldByName('TDAID').AsString;
      sLOC := DM1.cdsNIS.FieldByName('LOCID').AsString;
      sTIN := DM1.cdsNIS.FieldByName('TINID').AsString;
      dblcTDAChange(Nil);
      sNUM := DM1.StrZero(DM1.MaxNIS(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoSal);
      DM1.cdsNIS.FieldByName('NISAID').AsString := sNUM; //marks
   End;
   btnDetalle;
End;

Procedure TFAjustesS.dbgDReqsKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
   If (Key = $4D) And (ssCtrl In Shift) Then
   Begin
      dbgDReqsDblClick(Nil);
   End;

   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      DM1.cdsKDX.Delete;
   End;
   btnDetalle;
End;

Procedure TFAjustesS.dbgDReqsDblClick(Sender: TObject);
Begin
   OnOffDetalle(False); // Desactivar el panel de detalle
   dbeItem.Text := DM1.cdsKDX.FieldByName('KDXID').AsString;
   dbcldArti.Text := DM1.cdsKDX.FieldByName('ARTID').AsString;
 {23/08/2000 pjsv, por ser sólo ajuste
  dbeCantidadG.Text     := FieldByName('KDXCNTG').AsString;
  dbeCantidadU.Text     := FieldByName('KDXCNTU').AsString;
  dbePedidoG.Text     := FieldByName('KDXPEDIDOG').AsString;
  dbePedidoU.Text     := FieldByName('KDXPEDIDOU').AsString;}
  //dblcTransac.Text := FieldByName('TRIID').AsString;
  //dblcdCC.Text     := FieldByName('CIAID').AsString;

   DM1.cdsARTI.Locate('ARTID', dbcldArti.Text, []);
   pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
   pnlDetalleA.BringToFront;

   iEstado := 1;
   btnDetalle;
End;

Procedure TFAjustesS.dbeNumNISAExit(Sender: TObject);
Var
   iVal, iCod: Integer;
   sNUM, sCIA, sALM, sTIN, sTDA, sLOC, sTIP: String;
Begin
   Val(dbeNumNISA.Text, iVal, iCod);
   sCIA := dblcCIA.Text; //FieldByName('CIAID').AsString;
   sALM := dblcTALM.Text; //FieldByName('ALMID').AsString;
   sTDA := dblcTALM.Text; //FieldByName('TDAID').AsString;
   sLOC := dblcLOC.Text; //FieldByName('LOCID').AsString;
   sTIN := dblcTInv.Text; //FieldByName('LOCID').AsString;
   sNUM := dbeNumNISA.Text; //FieldByName('NISAID').AsString;
   sTIP := 'SALIDA';
   If (iCod = 0) And (DM1.IsExistNISA(sCIA, sALM, sLOC, sTDA, sNUM, sTIP, sTIN)) Then
   Begin
      ErrorMsg('Error', 'Ya existe una nota de salida' + #13 +
         'con el mismo número ... ' + sNUM);
      sNUM := DM1.StrZero(DM1.MaxNIS(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoSal);
      dbeNumNISA.Text := sNUM;
    //FieldByName('NISAID').AsString := sNUM;
   End
   Else
   Begin
      sNUM := DM1.StrZero(DM1.MaxNIS(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoSal);
      dbeNumNISA.Text := sNUM;
    //FieldByName('NISAID').AsString := sNUM;
   End;
End;

Procedure TFAjustesS.dbmObsKeyPress(Sender: TObject; Var Key: Char);
Var
   sC: String;
Begin
   sC := Key;
   sC := Uppercase(sC);
   Key := sC[1];
End;

Procedure TFAjustesS.FormShow(Sender: TObject);
Begin
//WMC1708  Init(Sender);
//añadido por wmc
   FAjustesS.dblcTransacChange(Nil);
End;

Procedure TFAjustesS.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   If DM1.cdsNIS.State In [dsEdit, dsInsert] Then
      DM1.cdsNIS.Cancel;
   If (DM1.cdsNIS.ChangeCount > 0) Or (DM1.cdsNIS.Modified) Then
      DM1.cdsNIS.CancelUpdates;
   btnDetalle;
  //adicion de william manrique cautín
   If pnlDetallea.Visible Then
      Z2bbtnRegCanc.OnClick(Nil);

   If pnlCabecera.Enabled Then
      pnlCabecera.SetFocus
   Else
      pnlDetalleG.SetFocus;
 //perform(CM_DialogKey,VK_TAB,0) ;
End;

Function TFAjustesS.EHandlerError(Ex: Exception): Boolean;
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

Procedure TFAjustesS.dbcldArtiChange(Sender: TObject);
Var
   ConUnitaria: Boolean;
Begin
   dbeArti.Text := DM1.cdsArti.FieldByName('ARTDES').AsString;
   ConUnitaria := (DM1.cdsArti.FieldByName('ArtCont').ASINTEGER <> 1);
   dbePrecioG.Enabled := (Not ConUnitaria);
   dbePrecioU.Enabled := ConUnitaria;
   vFam := DM1.cdsArti.FieldByName('FAMID').AsString;
   vSubFam := DM1.cdsArti.FieldByName('SFAMID').AsString;
   vTinid := DM1.cdsArti.FieldByName('TINID').AsString;
 {23/08/2000 pjsv
  dbePedidoG.Enabled := (NOT ConUnitaria);
  dbePedidoU.Enabled := ConUnitaria;
  dbeCantidadG.Enabled := NOT ConUnitaria;
  dbeCantidadU.Enabled := ConUnitaria;}
End;

Procedure TFAjustesS.dblcExist(Sender: TObject);
Var
   bRq: Boolean;
Begin
   If Not showing Then
      Exit;
   If TwwDBCustomLookupCombo(Sender).DataSource <> Nil Then
      bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;

   If (bRq) And (trim(TwwDBCustomLookupCombo(Sender).Text) = '') Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFAjustesS.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

{ Verificar si existe fecha de cierre para la salida de articulos
 -------------------------------------------------------------------------------}

Function TFAjustesS.IsClose(Const sCIA, sALM, sLOC: String;
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

Procedure TFAjustesS.dblcNISAChange(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTIN, sTDA, sLOC: String;
Begin
   If Not showing Then
      Exit;
   If Not (DM1.cdsNIS.State In [dsInsert, dsEdit]) Then exit;
   sCIA := dblcCIA.Text; //DM1.cdsNIS.FieldByName('CIAID').AsString;
   sALM := dblcTALM.Text; //DM1.cdsNIS.FieldByName('ALMID').AsString;
   sLOC := dblcLOC.Text;
   sTIN := dblcTInv.Text;
   sTDA := dblcTDA.Text; //DM1.cdsNIS.FieldByName('TDAID').AsString;
   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sLOC = '') Then
   Begin
      Exit;
   End;
   sNUM := DM1.StrZero(DM1.MaxNIS(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoSal);
   If DM1.cdsNIS.State In [dsInsert] Then
   Begin
      DM1.cdsNIS.FieldByName('NISAID').AsString := sNUM;
      dbeNumNISA.Text := sNUM;
   End
   Else
   Begin
      dbeNumNISA.Text := sNUM;
   End;
End;

Procedure TFAjustesS.Init(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTDA, sTIN, sLOC: String;
Begin
 //wmc1708   lblEstado;
   OnOffCabecera(True); //Activar la cabecera
   OnOffDetalle(False); //Desactivar el panel de detalle
   btnDetalle;

   If DM1.cdsNIS.State In [dsInsert] Then
   Begin
      dcCIA;
      dcTDA;
      dcLOC;
      dcALM;

      sCIA := DM1.cdsNIS.FieldByName('CIAID').AsString;
      sALM := DM1.cdsNIS.FieldByName('ALMID').AsString;
      sTDA := DM1.cdsNIS.FieldByName('TDAID').AsString;
      sLOC := DM1.cdsNIS.FieldByName('LOCID').AsString;
      sTIN := DM1.cdsNIS.FieldByName('TINID').AsString;
      dblcTDAChange(Nil);

      sNUM := DM1.StrZero(DM1.MaxNIS(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoSal);
      DM1.cdsNIS.FieldByName('NISAID').AsString := sNUM;
   End
   Else
      If showing Then
      Begin
         dblcNISAChange(Nil);
         dblcTransacChange(Nil);
      //dblcTDAChange(nil);
      End;
End;

Procedure TFAjustesS.dblcTransacChange(Sender: TObject);
Var
   P, C, T: Boolean;
   sSQL: String;
Begin
   If Not showing Then
      Exit;
   sSQL := 'TRIID=''' + dblcTransac.Text + '''' + ' AND TRISGT=''S''';
   C := (Trim(DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRICC', sSQL, 'TRICC')) = 'S');
   P := (Trim(DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRIPV', sSQL, 'TRIPV')) = 'S');
   T := (Trim(DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRITMOV', sSQL, 'TRITMOV')) = 'T');

   DM1.cdsNIS.FieldByName('CCOSID').Required := C;
   DM1.cdsNIS.FieldByName('PROV').Required := P;

   dblcdCC.Enabled := C;
   lblCC.Enabled := C;

   dblcdProv.Enabled := P;
   lblProv.Enabled := P;

   dblcLOCOri.Enabled := T;
   dbeLOCOri.Enabled := T;
   dblcTALMOri.Enabled := T;
   dbeALMOri.Enabled := T;
End;

Procedure TFAjustesS.dbeCantidadGExit(Sender: TObject);
Var
   sCIA, sALM, sART,
      sLOC: String;
   Y, M, D: Word;
   fSTK, Contenido: Double;
Begin
  // verificar si existe suficientes articulos en STOCK para poder atender el
  // requerimiento
  // tomar el articulo, compañía, almacén y verificar si se halla en stock
  // en el mes anterior correspondiente
   If (StrToFloat(dbeCantidadG.Text) = 0) And (StrToFloat(dbeCantidadG.Text) = 0) Then
      Exit;
   sCIA := DM1.cdsNIS.FieldByName('CIAID').AsString;
   sALM := DM1.cdsNIS.FieldByName('ALMID').AsString;
   sART := DM1.cdsARTI.FieldByName('ARTID').AsString;
   sLOC := DM1.cdsNIS.FieldByName('LOCID').AsString;
   DecodeDate(DM1.cdsNIS.FieldByName('NISAFREG').AsDateTime, Y, M, D);
  //sART := FieldByName('ARTID').AsString;
   sART := dbcldArti.Text;
   If DM1.cdsSTK.Locate('CIAID;ALMID;ARTID;STKANO;LOCID', VarArrayOf([sCIA, sALM, sART, IntToStr(Y), sLOC]), []) Then
   Begin
      Contenido := DM1.cdsArti.FieldByName('artcont').AsFloat;
      fSTK := DM1.cdsSTK.FieldByName('STKSACTG').AsFloat * Contenido + DM1.cdsSTK.FieldByName('STKSACTU').AsFloat;

      If fSTK <= 0 Then
      Begin
         ErrorMsg('Error', 'El Stock del producto se halla en CERO !!!');
         dbeCantidadG.SetFocus;
         Exit;
      End;
      If StrToFloat(dbeCantidadG.Text) * Contenido + StrToFloat(dbeCantidadU.Text) > fSTK Then
      Begin
         ErrorMsg('Error', 'La cantidad a dar salida excede a la cantidad en stock !!!');
         dbeCantidadG.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFAjustesS.dblcdCCChange(Sender: TObject);
Begin
   dbeCC.Text := DM1.cdsCCost.FieldByName('CIADES').AsString;
End;

Procedure TFAjustesS.dcCIA;
Var
   sCIA: String;
   sState: TDataSetState;
Begin

   sState := DM1.cdsNIS.State;
   DM1.cdsCIA.First;

   sCIA := trim(DM1.cdsCIA.FieldByName('CIAID').AsString);

   If (sState = dsInsert) And Not (DM1.cdsNIS.State In [dsInsert]) Then DM1.cdsNIS.Insert;

   If (sState = dsEdit) And Not (DM1.cdsNIS.State In [dsEdit]) Then DM1.cdsNIS.Edit;

   dblcCIA.Enabled := (DM1.cdsCIA.RecordCount > 1);

   If Not dblcCIA.Enabled Then
      DM1.cdsNIS.FieldByName('CIAID').AsString := sCIA;
   If length(dblcCia.Text) > 0 Then
      dblcCIA.OnExit(Self);
End;

Procedure TFAjustesS.dcALM;
Var
   sALM: String;
   sState: TDataSetState;
Begin
   sState := DM1.cdsNIS.State;
   DM1.cdsALM.First;
   sALM := trim(DM1.cdsALM.FieldByName('ALMID').AsString);

   If (sState = dsInsert) And Not (DM1.cdsNIS.State In [dsInsert]) Then DM1.cdsNIS.Insert;
   If (sState = dsEdit) And Not (DM1.cdsNIS.State In [dsEdit]) Then DM1.cdsNIS.Edit;

   dblcTALM.Enabled := (DM1.cdsALM.RecordCount > 1);
   If Not dblcTALM.Enabled Then
      DM1.cdsNIS.FieldByName('ALMID').AsString := sALM;
   If length(dblcTALM.Text) > 0 Then
      dblcTALM.OnExit(Self);
End;

Procedure TFAjustesS.dcLOC;
Var
   sLOC: String;
   sState: TDataSetState;
Begin
   sState := DM1.cdsNIS.State;
   DM1.cdsLOC.First;
   sLOC := trim(DM1.cdsLOC.FieldByName('LOCID').AsString);

   If (sState = dsInsert) And Not (DM1.cdsNIS.State In [dsInsert]) Then DM1.cdsNIS.Insert;
   If (sState = dsEdit) And Not (DM1.cdsNIS.State In [dsEdit]) Then DM1.cdsNIS.Edit;

   dblcLOC.Enabled := (DM1.cdsLOC.RecordCount > 1);
   If Not dblcLOC.Enabled Then
      DM1.cdsNIS.FieldByName('LOCID').AsString := sLOC;
   If length(dblcLoc.Text) > 0 Then
      dblcLOC.OnExit(Self);
End;

Procedure TFAjustesS.dcTDA;
Var
   sTDA: String;
   sState: TDataSetState;
Begin
   sState := DM1.cdsNIS.State;
   DM1.cdsTDNISA.First;

   sTDA := trim(DM1.cdsTDNISA.FieldByName('TDAID').AsString);

   If (sState = dsInsert) And Not (DM1.cdsNIS.State In [dsInsert]) Then DM1.cdsNIS.Insert;

   If (sState = dsEdit) And Not (DM1.cdsNIS.State In [dsEdit]) Then DM1.cdsNIS.Edit;

   dblcTDA.Enabled := (DM1.cdsTDNISA.RecordCount > 1);
   If Not dblcTDA.Enabled Then
   Begin
      DM1.cdsNIS.FieldByName('TDAID').AsString := sTDA;
   End;
   If length(dblcTDA.Text) > 0 Then
      dblcTDA.OnExit(Self);
End;

Procedure TFAjustesS.dblcdTDOCChange(Sender: TObject);
Var
   bValue: Boolean;
Begin
   bValue := Not (dblcdTDOC.Text = '');
   lblFDoc.Enabled := bValue;
   lblNDoc.Enabled := bValue;
   lblSerie.Enabled := bValue;
   dbeNDoc.Enabled := bValue;
   dbdtpFDoc.Enabled := bValue;
   dbeSerie.Enabled := bValue;
End;

Procedure TFAjustesS.dblcTDAChange(Sender: TObject);
Var
   sNUM, sCIA, sALM, sLOC, sTIN, sTDA, sSQL: String;
Begin
   If Not showing Then
      exit;
   If Not (DM1.cdsNIS.State In [dsInsert, dsEdit]) Then exit;
   If Not DM1.cdsNIS.Modified Then Exit;
   sCIA := dblcCIA.Text; //DM1.cdsNIS.FieldByName('CIAID').AsString;
   sALM := dblcTALM.Text; //DM1.cdsNIS.FieldByName('ALMID').AsString;
   sTDA := dblcTDA.Text; //DM1.cdsNIS.FieldByName('TDAID').AsString;
   sLOC := dblcLOC.Text; //DM1.cdsNIS.FieldByName('TDAID').AsString;
   sTIN := dblcTInv.Text; //DM1.cdsNIS.FieldByName('TDAID').AsString;
   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sLOC = '') Or (sTIN = '') Then
   Begin
      Exit;
   End;
   sNUM := DM1.StrZero(DM1.MaxNIS(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoSal);
   If DM1.cdsNIS.State In [dsInsert, dsEdit] Then
   Begin
      DM1.cdsNIS.FieldByName('TRIID').Clear;
      DM1.cdsNIS.FieldByName('CCOSID').Clear;
      DM1.cdsNIS.FieldByName('PROV').Clear;
   End;
   dblcTransac.Clear;
   dbeTransac.Clear;
   dblcdCC.Clear;
   dbeCC.Clear;
   dblcdProv.Clear;
   dbeProv.Clear;
  {23/08/2000 pjsv;
  sólo se filtra la transacción TRISGT='S' y TRITMOV='C'; esto se hace en el
  create del Forms
  if State in [dsInsert] then
  with DM1.cdsTRAN do
  begin
  Close;
  sSQL := 'SELECT * FROM TGE208 WHERE TDAID='''+dblcTDA.Text+'''';
  DataRequest(sSQL);
  Open;
  end;}
   If DM1.cdsNIS.State In [dsInsert] Then
   Begin
      DM1.cdsNIS.FieldByName('NISAID').AsString := sNUM;
      dbeNumNISA.Text := sNUM;
   End
   Else
   Begin
      dbeNumNISA.Text := sNUM;
   End;
End;

Procedure TFAjustesS.Z2bbtnAceptarClick(Sender: TObject);
Var
   dFECHAR: TDateTime;
   Y, M, D: Word;
   Ano, Mes: String;
   Contenido: Double;
   sCIA, sART, sALM, sLOC: String;
Begin
   If (dm1.cdsNis.FieldByName('NISSIT').AsString = 'ACEPTADO') Then
   Begin
      ErrorMsg('Observación', 'La nota ya ha sido aceptado');
      exit;
   End;
   dFECHAR := dm1.cdsNIS.FieldByName('NISAFREG').AsDateTime;
   sCIA := dm1.cdsNIS.FieldByName('CIAID').AsString;
   sALM := dm1.cdsNIS.FieldByName('ALMID').AsString;
   sLOC := dm1.cdsNIS.FieldByName('LOCID').AsString;
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
      { 23/08/2000
     dm1.ControlStock(sCIA, sALM, sLOC, sArt, Ano, Mes, Contenido, 'S');
    dm1.ActualizaArticulo(sCIA, sArt, Contenido, 'S');}
         ControlStock1(sCIA, sALM, sLOC, sArt, Ano, Mes, Contenido, 'S');
      End
      Else
         ErrorMsg('Error Grave', 'No se encuentra el articulo ' + sCIA + sArt);
      dm1.cdsKDX.next;
   End;
   dm1.ActualizaSituacion('S'); //SE PUSO EL APPLYUPDATES(0) EN EL PROC.
  //dm1.ControlTran;
   DM1.ControlTran(0, Nil, '');
  //dm1.cdsARTI.ApplyUpdates(0);
  //dm1.cdsSTK.ApplyUpdates(0);
 //dm1.cdsNIS.ApplyUpdates(0);
   ActivaBotones(pnlDetalleG, False);
   Z2bbtnNuevo.Enabled := True;
   lblEstado.Caption := 'ACEPTADO';
End;

Procedure TFAjustesS.GeneraIngresoTrans();
Var
   sCIA, sALM, sTDA, sTIN, sLOC, sNIS: String;
   sTINs, sALMs, sTDAs, sLOCs, sNISs: String;
   sSQL: String;
   sP: Array[0..14] Of Char;
Begin
   If DM1.cdsNIA.State In [dsInsert, dsEdit] Then DM1.cdsNIA.Cancel;
   DM1.cdsNIA.Insert;

   sCIA := DM1.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := dblcLOCOri.Text;
   sALM := dblcTALMOri.Text;
   sTIN := dblcTINOri.Text;
   sTDA := DM1.cdsTRAN.FieldByName('TRITDODES').AsString;
   DM1.cdsNIS.FieldByName('TDAID').AsString;

   sNIS := DM1.StrZero(DM1.MaxNIA(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoIng);
   DM1.cdsNIA.FieldByName('NISAID').AsString := sNIS;
   DM1.cdsNIA.FieldByName('CIAID').AsString := sCIA;
   DM1.cdsNIA.FieldByName('ALMID').AsString := sALM;
   DM1.cdsNIA.FieldByName('TDAID').AsString := sTDA;
   DM1.cdsNIA.FieldByName('LOCID').AsString := sLOC;

   DM1.cdsNIA.FieldByName('TRIID').AsString := DM1.cdsTRAN.FieldByName('TRITRDES').AsString;
   DM1.cdsNIA.FieldByName('LOCORIID').AsString := DM1.cdsNIS.FieldByName('LOCID').AsString;
   DM1.cdsNIA.FieldByName('ALMORIID').AsString := DM1.cdsNIS.FieldByName('ALMID').AsString;
   DM1.cdsNIA.FieldByName('NISAORIID').AsString := DM1.cdsNIS.FieldByName('NISAID').AsString;
   DM1.cdsNIA.FieldbyName('NISATIP').AsString := 'INGRESO';
   DM1.cdsNIA.FieldByName('NISAFREG').AsString := DM1.cdsNIS.FieldByName('NISAFREG').AsString;
   DM1.cdsNIA.FieldByName('prov').required := False;
   DM1.cdsNIA.FieldByName('CCOSID').required := False;
  //dm1.ControlTran;
   DM1.ControlTran(0, Nil, '');
  //cdsNIA.Post;
  //cdsNIA.ApplyUpdates(0);

   sALMs := DM1.cdsKDX.FieldByName('ALMID').AsString;
   sTDAs := DM1.cdsKDX.FieldByName('TDAID').AsString;
   sLOCs := DM1.cdsKDX.FieldByName('LOCID').AsString;
   sNISs := DM1.cdsKDX.FieldByName('NISAID').AsString;
   sTINs := DM1.cdsKDX.FieldByName('TINID').AsString;
   dbiGetNetUserName(sP);
   sSQL :=
      ' insert into log315' +
      '(CIAID, LOCID, TINID, ALMID, TDAID, NISAID,' +
      'KDXID, NISATIP,ARTID , GRARID, ARTCONT, UNMIDG,' +
      'UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA,' +
      'ARTPCU, ARTPCG, ARTPVU, ARTPVG, ARTFUC, TMONID, ARTCRGO, ARTACTIVO,' +
      'CUENTAID, TINID,' +
      'NISAFREG,KDXPEDIDOG,KDXPEDIDOU, KDXCNTG, KDXCNTU,KDXSALDOG,KDXSALDOU,' +
      'KDXUSER, KDXFREG, KDXHREG, KDXANO, KDXMM,' +
      'KDXDD,KDXTRI,KDXSEM,KDXSS,KDXANOMM,KDXAATRI,KDXAASEM,KDXAASS,' +
      'FLAGVAR,CALID)' +
      ' select ' +
      '''' + sCIA + ''',''' + sLOC + ''',''' + sTIN + ''',''' + sALM + ''',''' + sTDA + ''',''' + sNIS + ''',' +
      'KDXID, ''INGRESO'', ARTID , GRARID, ARTCONT, UNMIDG,' +
      'UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA,' +
      'ARTPCU, ARTPCG, ARTPVU, ARTPVG, ARTFUC, TMONID, ARTCRGO, ARTACTIVO,' +
      'CUENTAID, TINID,' +
      'NISAFREG, 0, 0, KDXCNTG, KDXCNTU, 0,0,' +
      '''' + sP + '''' + ', KDXFREG, KDXHREG, KDXANO, KDXMM,' +
      'KDXDD,KDXTRI,KDXSEM,KDXSS,KDXANOMM,KDXAATRI,KDXAASEM,KDXAASS,' +
      'FLAGVAR,CALID' +
      ' from LOG315' +
      ' where' +
      ' CIAID = ''' + sCIA + '''' +
      ' and LOCID = ''' + sLOCs + '''' +
      ' and ALMID = ''' + sALMs + '''' +
      ' and TDAID = ''' + sTDAs + '''' +
      ' and TINID = ''' + sTINs + '''' +
      ' and NISAID = ''' + sNISs + '''';
   DM1.ExecSQL(sSQL);
End;

Procedure TFAjustesS.Adiciona;
Var
   sNUM, sCIA, sTIN, sALM, sTDA, sLOC, sSQL: String;
Begin
   Z2bbtnNuevo.Visible := True;
   lblestado.Caption := 'INICIAL';
   dcCIA;
   dcTDA;
   dcLOC;
   dcALM;

   sCIA := DM1.cdsNIS.FieldByName('CIAID').AsString;
   sALM := DM1.cdsNIS.FieldByName('ALMID').AsString;
   sTDA := DM1.cdsNIS.FieldByName('TDAID').AsString;
   sLOC := DM1.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DM1.cdsNIS.FieldByName('TINID').AsString;
   OnOffCabecera(True); //Activar la cabecera
   OnOffDetalle(False); //Desactivar el panel de detalle
   ActivaBotones(pnlDetalleG, False);
 //wmc1808     dblcTDAChange(nil) ;
   If (trim(sCIA) = '') Or (trim(sALM) = '') Or (trim(sTDA) = '') Or (trim(sLOC) = '') Then
      Exit;

   sNUM := DM1.StrZero(DM1.MaxNIS(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoSal);
   If DM1.cdsNIS.State In [dsInsert, dsEdit] Then
   Begin
      DM1.cdsNIS.FieldByName('TRIID').Clear;
      DM1.cdsNIS.FieldByName('CCOSID').Clear;
      DM1.cdsNIS.FieldByName('PROV').Clear;
   End;

   dblcTransac.Clear;
   dbeTransac.Clear;
   dblcdCC.Clear;
   dbeCC.Clear;
   dblcdProv.Clear;
   dbeProv.Clear;
   DM1.cdsNIS.FieldByName('NISAID').AsString := sNUM;
 {23/08/2000 pjsv; sólo se filtra por  TDATIP = 'SALIDA' y
  TDAAJUSTE = 'S'
  if State in [dsInsert] then
  with DM1.cdsTRAN do
  begin
   Close;
   sSQL := 'SELECT * FROM TGE208 WHERE TDAID='''+dblcTDA.Text+'''';
   DataRequest(sSQL);
   Open;
  end;}
  //wmc1808     sNUM := DM1.StrZero(DM1.MaxNIS( sCIA, sALM, sLOC, sTDA ),wAnchoSal) ;
End;

Procedure TFAjustesS.Edita;
Begin
 //wmc1708   lblEstado ;
   Z2bbtnNuevo.Visible := False;
   If dm1.cdsNIS.FieldByName('NISSIT').AsString = 'ACEPTADO' Then
   Begin
      OnOffCabecera(False); //Activar la cabecera
      OnOffDetalle(True); //Desactivar el panel de detalle
      lblEstado.Caption := dm1.cdsNIS.FieldByName('NISSIT').AsString;
      ActivaBotones(pnlDetalleG, False);
   End
   Else
   Begin
      OnOffCabecera(True); //Activar la cabecera
      ActivaBotones(pnlDetalleG, false);
      OnOffDetalle(False); //Desactivar el panel de detalle
      lblEstado.Caption := 'INICIAL';
   End;
End;

Procedure TFAjustesS.ActivaBotones(pnl: TPanel; xFlag: Boolean);
Var
   i: Integer;
Begin
   For i := 0 To pnl.ControlCount - 1 Do
   Begin
      If pnl.controls[i] Is tbitbtn Then
         TBitBtn(pnl.controls[i]).enabled := xFlag;
   End;
End;

Procedure TFAjustesS.ControlStock1(sCIA, sALM, sLOC, sArt, Ano, Mes: String; Contenido: Double; IngSal: Char);
Var
  //CantidadG, CantidadU	: Double;
  //PrecioG, PrecioU  : Double;
 //STKSANTG,STKSANTU					: Double;
  {CantidadActG, CantidadActU,}MontoActG, MontoActU: Double;
   CntGFName, CntUFName, MntGFName, MntUFName: String;
   SumaResta: Char;
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
   dm1.cdsSTK.FieldByName(MntGFName).AsFloat := MontoActG;
   dm1.cdsSTK.FieldByName(MntUFName).AsFloat := MontoActU;

   dm1.cdsSTK.FieldByName('TINID').AsString := vTinid;
   dm1.cdsSTK.FieldByName('FAMID').AsString := vFam;
   dm1.cdsSTK.FieldByName('SFAMID').AsString := vSubFam;
   dm1.cdsSTK.Post;
End;

Procedure TFAjustesS.dblcCIAExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
   dbeCIA.Text := DM1.DisplayDescrip('prvLOG', 'TGE101', 'CIADES', xWhere, 'CIADES');
   If dbeCia.Text = '' Then
      ShowMessage('  Falta Compañia  ');
End;

Procedure TFAjustesS.dblcLOCExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'LOCID=' + quotedstr(dblcLOC.Text);
   dbeLOC.Text := DM1.DisplayDescrip('prvLOG', 'TGE126', 'LOCDES', xWhere, 'LOCDES');
   If dbeLoc.Text = '' Then
      ShowMessage('Falta Localidad');
End;

Procedure TFAjustesS.dblcTALMExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'ALMID=' + quotedstr(dblcTAlm.Text);
   dbeALM.Text := DM1.DisplayDescrip('prvLOG', 'TGE151', 'ALMDES', xWhere, 'ALMDES');
   If dbeALM.Text = '' Then
      ShowMessage('  Falta Almacen  ');
End;

Procedure TFAjustesS.dblcTDAExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'TDAID=' + quotedstr(dblcTDA.Text);
   dbeTDNISA.Text := DM1.DisplayDescrip('prvLOG', 'TGE157', 'TDADES', xWhere, 'TDADES');
   If dbeTDNISA.Text = '' Then
      ShowMessage('Falta Tipo de Documento');
End;

Procedure TFAjustesS.dblcTransacExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'TRIID=''' + dblcTransac.Text + '''' + ' AND TRISGT=''S''';
   dbeTRANSAC.Text := DM1.DisplayDescrip('prvLOG', 'TGE208', 'TRIDES', xWhere, 'TRIDES');
   If dbeTRANSAC.Text = '' Then
      ShowMessage('Falta Transacción');
End;

Procedure TFAjustesS.dblcLOCOriEnter(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'LOCID=' + quotedstr(dblcLOC.Text);
   dbeLOC.Text := DM1.DisplayDescrip('prvLOG', 'TGE126', 'LOCDES', xWhere, 'LOCDES');
   If dbeLoc.Text = '' Then
      ShowMessage('  Falta Localidad  ');
End;

Procedure TFAjustesS.dblcdCCExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CCOSID=' + quotedstr(dblcdCC.Text);
   dbeCC.Text := DM1.DisplayDescrip('prvLOG', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES');
   If dbeCC.Text = '' Then
      ShowMessage('Falta Centro de Costo');
End;

Procedure TFAjustesS.dblcdProvExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CLIEID=' + quotedstr(dblcdPROV.Text);
   dbePROV.Text := DM1.DisplayDescrip('prvLOG', 'TGE204', 'CLIEDES', xWhere, 'CLIEDES');
   If dbePROV.Text = '' Then
      ShowMessage('Falta Cliente');
End;

Procedure TFAjustesS.dblcdTDOCExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'DOCID=' + quotedstr(dblcdTDOC.Text);
   dbeTDOC.Text := DM1.DisplayDescrip('prvLOG', 'TGE110', 'DOCDES', xWhere, 'DOCDES');
   If dbeTDoc.Text = '' Then
      ShowMessage('Falta Documento de Referencia');
End;

//** 15/03/2001 - pjav

Procedure TFAjustesS.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;
//**

Procedure TFAjustesS.FormActivate(Sender: TObject);
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

