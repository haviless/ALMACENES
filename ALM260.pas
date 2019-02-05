Unit ALM260;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
   wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
   Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, wwclient, Wwdotdot, Wwdbcomb,
   GridControl, ppDB, ppDBPipe, ppCtrls, ppBands, ppStrtch, ppMemo, ppViewr,
   ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppVar,
   ppEndUsr, Variants, ppTypes, MsgDlgs;

Type
   TFRegReqs = Class(TForm)
      pnlCabecera: TPanel;
      dblcCIA: TwwDBLookupCombo;
      Z2bbtnOK: TBitBtn;
      Z2bbtnBorrar: TBitBtn;
      dbeNumRqs: TwwDBEdit;
      dbeSolic: TwwDBEdit;
      dblcdCCos: TwwDBLookupComboDlg;
      dbdtpFReqs: TwwDBDateTimePicker;
      dbdtpFAnten: TwwDBDateTimePicker;
      dbeAtorizado: TwwDBEdit;
      dbeAprobado: TwwDBEdit;
      dbmObs: TDBMemo;
      pnlDetalleG: TPanel;
      stxTitulo1: TStaticText;
      dbgDReqs: TwwDBGrid;
      pnlDetalleA: TPanel;
      stxTitulo2: TStaticText;
      pnlEstado: TPanel;
      Label4: TLabel;
      Bevel1: TBevel;
      Z2dbgDReqsIButton: TwwIButton;
      edtInsTec: TwwDBEdit;
      pnlBotones: TPanel;
      Z2bbtnRegresa: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnAnula: TBitBtn;
      Z2bbtnAcepta: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      btxtEstado: TDBText;
      dblcPRIO: TwwDBLookupCombo;
      dblcLOC: TwwDBLookupCombo;
      dblcObra: TwwDBLookupCombo;
      dbePrior: TwwDBEdit;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      pnlDetalleB: TPanel;
      Z2bbtnRegOk2: TBitBtn;
      Z2bbtnRegCanc2: TBitBtn;
      dbeItem1: TwwDBEdit;
      dbeItem: TwwDBEdit;
      dbcldArti: TwwDBLookupComboDlg;
      dbeCNTS: TwwDBEdit;
      dbeCNTA: TwwDBEdit;
      dblcUNMID: TwwDBLookupCombo;
      dbcbFLAG: TwwDBComboBox;
      edtARTDES: TEdit;
      stxTitulo3: TStaticText;
      dblcTRqs: TwwDBLookupCombo;
      dblcTipoCompra: TwwDBLookupCombo;
      dbeCant: TwwDBEdit;
      dblcUnMed: TwwDBLookupCombo;
      edtUNMID: TEdit;
      edtTipoCompra: TEdit;
      dbeTRqs: TEdit;
      edtUMedReq: TEdit;
      lblTexto: TLabel;
      Z2bbtnPrint: TBitBtn;
      pprOCPE: TppReport;
      ppDBCab: TppDBPipeline;
      ppdbOC: TppDBPipeline;
      edtLoc: TEdit;
      edtCia: TEdit;
      edtObra: TEdit;
      dbmObservacion: TMemo;
      lblTipPre: TLabel;
      dblcTipPre: TwwDBLookupCombo;
      lblPresu: TLabel;
      dblcdPresup: TwwDBLookupComboDlg;
      dbeTipPre: TwwDBEdit;
      edtPresup: TEdit;
      pnlActualizando: TPanel;
      lblActualizando: TLabel;
      lblObra: TLabel;
      ppReport1: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand2: TppFooterBand;
      dbeCCostos: TEdit;
      ppHeaderBand4: TppHeaderBand;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLabel1: TppLabel;
      ppLine4: TppLine;
      ppLabel12: TppLabel;
      ppLine5: TppLine;
      ppShape9: TppShape;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppDBText58: TppDBText;
      ppDBText8: TppDBText;
      ppLabel2: TppLabel;
      ppDBText5: TppDBText;
      ppLabel9: TppLabel;
      ppDBText1: TppDBText;
      ppLabel7: TppLabel;
      ppDBText6: TppDBText;
      ppLabel8: TppLabel;
      ppDBText7: TppDBText;
      ppLabel10: TppLabel;
      ppDBText70: TppDBText;
      ppDetailBand4: TppDetailBand;
      ppDBText60: TppDBText;
      ppDBText62: TppDBText;
      ppDBText63: TppDBText;
      ppDBText4: TppDBText;
      ppdbtConsumo: TppDBText;
      ppDBMemo1: TppDBMemo;
      ppFooterBand1: TppFooterBand;
      ppDBText2: TppDBText;
      ppLine1: TppLine;
      ppLabel4: TppLabel;
      ppDBText3: TppDBText;
      ppLine2: TppLine;
      ppLabel5: TppLabel;
      ppLine3: TppLine;
      ppLabel6: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLine6: TppLine;
      ppLabel3: TppLabel;
      ppDBMemo2: TppDBMemo;
      ppLabel11: TppLabel;
      ppDBText9: TppDBText;
      ppDesigner1: TppDesigner;
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure Z2bbtnBorrarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure Z2bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure Z2bbtnAnulaClick(Sender: TObject);
      Procedure Z2dbgDReqsIButtonClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure dbgDReqsKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure dbgDReqsDblClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
{27/07/2000 se quito el control
  procedure dblcUMedChange(Sender: TObject);}
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcExist(Sender: TObject);
      Procedure dbeNumRqsExit(Sender: TObject);
      Procedure dbdtpFReqsExit(Sender: TObject);
      Procedure dblcTipoCompraExit(Sender: TObject);
      Procedure dblcdCCosExit(Sender: TObject);
      Procedure dblcTRqsExit(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dbcldArtiExit(Sender: TObject);
      Procedure dbcbFLAGExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Z2bbtnPrintClick(Sender: TObject);
      Procedure dblcPRIOExit(Sender: TObject);
      Procedure pprOCPEPreviewFormCreate(Sender: TObject);
      Procedure dblcTipPreExit(Sender: TObject);
      Procedure dblcdPresupExit(Sender: TObject);
      Procedure dbeNumRqsKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
   Private
  { Private declarations }
      iEstado: Integer; // 0 En Insercion, 1 Edicion
      sTipoRQS: String; // Solo tiene tres valores Requisicion x (C)ompras (S)ervicios (A)ctivos Fijos
      xPresu: String; //'S' = si tiene presupuesto, N = no tiene presupuesto

      Procedure dcCIA;
  //procedure dcALM;
      Procedure dcLOC;
      Procedure dcNUM;
      Procedure AsigDat;
      Procedure btnDetalle;
      Procedure OnOffDetalle(Value: Boolean);
      Procedure OnOffCabecera(Value: Boolean);

  //procedure cSetFocus ( Sender: TObject ; const sMsg : String);
      Function EHandlerError(Ex: Exception): Boolean;
  //function ValidaCantidad(VCantidad : string) : Bool;
      Procedure ConsumoPro(pArtid, pCiaId, pUnidad: String);
      Procedure ConsumoTotal(pArtid, pCiaId, pUnidad: String);
   Public
  { Public declarations }
      xValorX: String;
      xReqAut: String;
      xReqLec: String;
      Procedure ppReportRQS(sCIA, sLOC, sRQS: String);
   End;

Var
   FRegReqs: TFRegReqs;
   vunmid: String;
   xPriInser: String;
   SQLFiltro: String;
   xOrdElim, wSQL: String;
   Punt: TBookmark;
   xTotal: Double;

Implementation

Uses ALMDM1, oaIN3000;

{$R *.DFM}

Procedure TFRegReqs.Z2bbtnOKClick(Sender: TObject);
Var
   xPasa: Integer;
   sSQL: String;
Begin
   xPasa := 0;

   DMALM.DisplayDescrip('prvSQL', 'TGE203', 'CCOSDES, ' + DMALM.wReplacCeros + '(CCOSMOV,''N'') CCOSMOV', 'CCOSID=' + quotedStr(dblcdCCos.text), 'CCOSDES');
   If DMALM.cdsQry.FieldByName('CCOSMOV').ASString = 'N' Then
   Begin
      dbeCCostos.Text := '';
      ErrorMsg(Caption, ' Solo puede Seleccionar un Codigo de C. Costo de Ultimo Nivel ');
      Exit;
   End;

  //** 15/06/2001 - pjsv
  //** si la CIA. tiene presupuesto en el oaConfig como 'S' y no tiene presupuesto asignado
  //** no debe de permitir pasar
   If (wActuaPresu) And (xPresu = 'N') Then
   Begin
      ErrorMsg(Caption, ' No tiene Presupuesto, Usted no puede Continuar ');
      Exit;
   End;
  //**

   If xPriInser = 'A' Then
   Begin
      If Not DMALM.cdsReqs.FieldByName('CIAID').IsNull Then
      Begin
         If DMALM.IsExistRqsM(DMALM.cdsReqs.FieldByName('CIAID').AsString,
            DMALM.cdsReqs.FieldByName('LOCID').AsString,
            DMALM.cdsReqs.FieldByName('RQSID').AsString) Then
         Begin
            xPasa := 1;
         End
         Else
            xPasa := 0;
      End
      Else
      Begin
         ErrorMsg('Error', 'Ingrese la Compañia ..... ');
         Exit;
      End;
   End;

   If xPasa = 1 Then
   Begin
      If Question('Confirmar', 'Ya existe Requisición con el Nº  ' +
         dbeNumRqs.Text + #13 + #13 +
         'Desea volver a Genera el Nuevo Nº de la Requisición y Continuar ' + #13 + #13) Then
      Begin
         dcNUM;
      //sNumORD := DMALM.StrZero( DMALM.MaxORD(trim(dblccia.Text)),8);
   //DMALM.cdsReqs.fieldbyName('RQSID').asString := sNumOrd;
         xPasa := 0;
      End;
   End;
   If xPasa = 1 Then
   Begin
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   If DMALM.cdsReqs.State In [dsInsert, dsEdit] Then
   Begin
      AsigDat; // asignar los datos predeterminados
      If Length(trim(dbmObs.text)) = 0 Then
         DMALM.cdsReqs.fieldbyname('RQSOBS').AsString := '.';
      DMALM.cdsReqs.Post;

      SQLFiltro := 'SELECT * FROM LOG308 ' +
         'WHERE CIAID=''' + dblcCIA.Text + ''' ' +
         'AND LOCID=''' + dblcLOC.Text + ''' ' +
         'AND RQSID=''' + dbeNumRqs.Text + '''';
      DMALM.cdsReqs.DataRequest(SQLFiltro);

      sSQL := 'SELECT * FROM LOG309 ' +
         'WHERE CIAID=''' + dblcCIA.Text + ''' ' +
         'AND LOCID=''' + dblcLOC.Text + ''' ' +
         'AND RQSID=''' + dbeNumRqs.Text + ''' ' +
         'ORDER BY CIAID, LOCID, RQSID, DRQSID';

      DMALM.cdsDReqs.DisableControls;
      DMALM.cdsDReqs.Close;
      DMALM.cdsDReqs.DataRequest(sSQL);
      DMALM.cdsDReqs.Open;
      DMALM.cdsDReqs.EnableControls;

      sSQL := 'SELECT * FROM TGE205 A ' +
         'WHERE A.CIAID= ''' + dblcCIA.Text + '''';
      DMALM.cdsArti.Close;
      DMALM.cdsArti.DataRequest(sSQL);
      DMALM.cdsArti.Open;

      xPriInser := '';

    //if SRV_D = 'ORACLE' then
      //Punt:=DMALM.cdsReqs.GetBookmark;

  //DMALM.ControlTran;
      DMALM.ControlTran(9, DMALM.cdsReqs, 'REQS');
    {if SRV_D = 'ORACLE' then
    begin
      DMALM.cdsReqs.GotoBookmark(Punt);
      DMALM.cdsReqs.FreeBookmark(Punt);
    end;}

      If DMALM.wModo = 'A' Then
      Begin
         xOrdElim := DMALM.cdsReqs.FieldbyName('RQSID').AsString; // Si no graba podre borrar
      End;
   End
   Else
      sTipoRQS := DMALM.cdsReqs.FieldByName('TIPOADQ').AsString;

   OnOffCabecera(False); //Desactivar el panel de Cabecera
   OnOffDetalle(True); //Activar el panel de detalle
   btnDetalle;
   Z2dbgDReqsIButton.Enabled := (trim(DMALM.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL');
   Screen.Cursor := crDefault;
   If xReqAut = 'S' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMALM.cdsReqAut.First;
      While Not DMALM.cdsReqAut.Eof Do
      Begin
         DMALM.cdsDReqs.Insert;
         DMALM.cdsDReqs.FieldByName('DRQSID').AsString := DMALM.StrZero(DMALM.MaxValue('DRQSID', DMALM.cdsDReqs), 3);
         DMALM.cdsDReqs.FieldByName('CIAID').AsString := dblcCIA.Text;
         DMALM.cdsDReqs.FieldByName('RQSID').AsString := dbeNumRqs.Text;
         DMALM.cdsDReqs.FieldByName('LOCID').AsString := dblcLOC.Text;
         DMALM.cdsDReqs.FieldByName('ARTID').AsString := DMALM.cdsReqAut.FieldByName('ARTID').AsString;
         DMALM.cdsDReqs.FieldByName('UNMIDG').AsString := DMALM.cdsReqAut.FieldByName('UNMIDG').AsString;
         DMALM.cdsDReqs.FieldByName('RQSFLAGUM').AsString := 'G';
         DMALM.cdsDReqs.FieldByName('TIPOADQ').asString := dblcTipoCompra.Text;
         DMALM.cdsDReqs.FieldByName('RQSFREG').AsDateTime := DMALM.cdsReqs.FieldByName('RQSFREG').AsDateTime;
         DMALM.cdsDReqs.FieldByName('RQSFATE').AsDateTime := DMALM.cdsReqs.FieldByName('RQSFATE').AsDateTime;
         DMALM.cdsDReqs.FieldByName('PRIOID').AsString := DMALM.cdsReqs.FieldByName('PRIOID').AsString;
         DMALM.cdsDReqs.FieldByName('RQSEST').AsString := DMALM.cdsReqs.FieldByName('RQSEST').AsString;
         DMALM.cdsDReqs.FieldByName('TRQSID').AsString := dblcTRqs.Text;
         DMALM.cdsDReqs.FieldByName('DRQSCNSG').AsFloat := DMALM.cdsReqAut.FieldByName('STKSCPE').AsFloat;
         DMALM.cdsDReqs.FieldByName('DRQSCNSU').AsFloat := 0;
         DMALM.cdsDReqs.FieldByName('DRQSCNAG').AsFloat := DMALM.cdsReqAut.FieldByName('STKSCPE').AsFloat;
         DMALM.cdsDReqs.FieldByName('DRQSCNAU').AsFloat := 0;
         DMALM.cdsDReqs.FieldByName('DRQSOBS').asString := DMALM.cdsReqAut.FieldByName('ARTDES').AsString;
         DMALM.cdsDReqs.Post;
         DMALM.cdsReqAut.Next;
      End;
      Screen.Cursor := crDefault;
      Exit;
   End;
   Screen.Cursor := crDefault;
   If DMALM.wModo = 'A' Then
      Z2dbgDReqsIButton.Click;
 //pnlDetalleG.SetFocus;
End;

Procedure TFRegReqs.Z2bbtnBorrarClick(Sender: TObject);
Begin
   DMALM.cdsReqs.CancelUpdates;
   If DMALM.wModo = 'A' Then
   Begin
      DMALM.cdsReqs.Insert;
  //FormCreate(nil);
  //OnOffCabecera(True);
  //OnOffDetalle(False);
  //DMALM.cdsDReqs.CancelUpdates;
   End;
 //FormShow(Sender);
End;

Procedure TFRegReqs.AsigDat;
Var
   D, M, Y: Word;
   sFecha, sSQL: String;
Begin
 // --> Asignar datos de cabecera de requisición
   If DMALM.cdsReqs.State In [dsInsert, dsEdit] Then
   Begin
      If Length(dblcCia.Text) = 0 Then Raise Exception.Create('Falta Registrar Compañía...');
      If Length(dblcLOC.Text) = 0 Then Raise Exception.Create('Falta Registrar Localidad...');
      If Length(dbeNumRqs.Text) = 0 Then Raise Exception.Create('Falta Registrar No.Requisición...');
      If Length(dblcTipoCompra.Text) = 0 Then Raise Exception.Create('Falta Registrar Tipo de Compra...');
      If dbdtpFReqs.Date = 0 Then Raise Exception.Create('Falta Registrar Fecha de Requisición...');
      If Length(dblcPRIO.Text) = 0 Then Raise Exception.Create('Falta Registrar Prioridad...');
      If dbdtpFAnten.Date = 0 Then Raise Exception.Create('Falta Registrar Fecha de Requisición...');
      If Length(dblcTRqs.Text) = 0 Then Raise Exception.Create('Falta Registrar Tipo Requisición...');
      If dbdtpFReqs.Date > dbdtpFAnten.date Then Raise Exception.Create('La Fecha de Atención debe ser mayor' + #13 + ' a la Fecha de Requisición...');
      If trim(dbeCCostos.Text) = '' Then Raise Exception.Create('Falta Registrar Centro de Costo...');

      DecodeDate(dbdtpFReqs.Date, Y, M, D);
      If Length(Trim(DMALM.cdsReqs.FieldbyName('RQSOBS').AsString)) = 0 Then
         DMALM.cdsReqs.FieldbyName('RQSOBS').AsString := '.';

      If DMALM.cdsReqs.State In [dsInsert] Then
      Begin
         DMALM.cdsReqs.FieldbyName('RQSEST').AsString := 'INICIAL';
         sFecha := formatdatetime(DMALM.wFormatFecha, Date);
         sSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
         DMALM.FiltraCDS(DMALM.cdsPeriodo, sSQL);
         DMALM.cdsReqs.FieldbyName('RQSANO').AsString := IntToStr(Y);
         DMALM.cdsReqs.FieldbyName('RQSMM').AsString := DMALM.strzero(IntToStr(M), 2);
         DMALM.cdsReqs.FieldbyName('RQSDD').AsString := DMALM.strzero(IntToStr(D), 2);
         DMALM.cdsReqs.FieldbyName('RQSTRI').AsString := DMALM.cdsPeriodo.fieldbyName('FECTRIM').asString;
         DMALM.cdsReqs.FieldbyName('RQSSEM').AsString := DMALM.cdsPeriodo.fieldbyName('FECSEM').asString;
         DMALM.cdsReqs.FieldbyName('RQSANOMM').AsString := IntToStr(Y) + DMALM.strzero(IntToStr(M), 2);
         DMALM.cdsReqs.FieldbyName('RQSSS').AsString := DMALM.cdsPeriodo.fieldbyName('FECSS').asString;
         DMALM.cdsReqs.FieldbyName('RQSAATRI').AsString := DMALM.cdsPeriodo.fieldbyName('FECAATRI').asString;
         DMALM.cdsReqs.FieldbyName('RQSAASEM').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASEM').asString;
         DMALM.cdsReqs.FieldbyName('RQSAASS').AsString := DMALM.cdsPeriodo.fieldbyName('FECAASS').asString;

         DMALM.cdsReqs.FieldbyName('RQSUSER').AsString := DMALM.wUsuario;
         DMALM.cdsReqs.FieldbyName('RQSFREG').AsDateTime := Date;
         DMALM.cdsReqs.FieldbyName('RQSHREG').AsDateTime := SysUtils.Time;
      End;

      sTipoRQS := DMALM.DisplayDescrip('prvSQL', 'TGE142', 'TIPOADQ', 'TRQSID=' + quotedStr(dblcTRqs.text), 'TIPOADQ');
      DMALM.cdsReqs.FieldbyName('TIPOADQ').asString := dblcTipoCompra.text; //sTipoRQS;
   End;
End;

Procedure TFRegReqs.FormCreate(Sender: TObject);
//var
 //sSQL : string;
Begin
   dblcdCCos.OnNotInList := dblcNotInList;
   OnOffCabecera(True); //Activar la cabecera
   OnOffDetalle(False); //Desactivar el panel de detalle
End;

Procedure TFRegReqs.Z2bbtnRegresaClick(Sender: TObject);
Begin
   If DMALM.cdsDReqs.RecordCount = 0 Then
   Begin
      dblcdCCos.Enabled := True;
      dblcPRIO.Enabled := True;
      dblcTipoCompra.Enabled := True;
   End
   Else
   Begin
      dblcdCCos.Enabled := False;
      dblcPRIO.Enabled := False;
      dblcTipoCompra.Enabled := False;
   End;
   DMALM.dsReqs.Edit;
   DMALM.wModo := 'M';
   OnOffCabecera(True);
   OnOffDetalle(False);
End;

Procedure TFRegReqs.Z2bbtnGrabaClick(Sender: TObject);
Begin
   Try
      Screen.Cursor := crHourGlass;
  //DMALM.ControlTran;
      DMALM.ControlTran(9, DMALM.cdsDReqs, 'DREQS'); //AplicaDatos([cdsReqs,cdsDReqs]);
      btnDetalle;
      DMALM.wModo := '';
      xOrdElim := ''; // Si graba YA NO podre borrar
      Z2bbtnGraba.Enabled := False;
   Finally
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFRegReqs.Z2bbtnCanc2Click(Sender: TObject);
Begin
   DMALM.cdsDReqs.CancelUpdates;
   If (DMALM.wModo = 'A') And
      (trim(DMALM.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL') And
      (DMALM.cdsReqs.FieldbyName('RQSVISADOR').IsNull) And
      (Length(Trim(xOrdElim)) > 0) Then
   Begin
      DMALM.cdsDReqs.First;
      While Not DMALM.cdsDReqs.Eof Do
         DMALM.cdsDReqs.Delete;
  //sSQL:='DELETE FROM LOG309 WHERE RQSID='''+xOrdElim+'''';
  //DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      DMALM.cdsReqs.Delete;
  //DMALM.ControlTran;
      DMALM.ControlTran(9, DMALM.cdsReqs, 'REQS'); //AplicaDatos([cdsReqs,cdsDReqs]);
      DMALM.ControlTran(9, DMALM.cdsDReqs, 'DREQS'); //AplicaDatos([cdsReqs,cdsDReqs]);
      DMALM.wModo := '';
   End;
   OnOffCabecera(True);
   OnOffDetalle(False);
   Close;
End;

Procedure TFRegReqs.Z2bbtnAceptaClick(Sender: TObject);
Begin
   If (trim(DMALM.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL') And
      (DMALM.cdsDReqs.RecordCount > 0) Then // inicial...
   Begin
      If Not Question('Confirmar', 'Esta Seguro de Aceptar La Requisición ' + #13 + #13 +
         DMALM.cdsReqs.FieldByName('RQSID').AsString + '  -  ' + #13 +
         #13 + ' Desea Continuar ') Then
      Begin
         Exit;
      End;
      Try
         Screen.Cursor := crHourGlass;
         If DMALM.cdsReqs.State In [dsBrowse] Then
         Begin
            DMALM.cdsReqs.Edit;
            DMALM.cdsReqs.FieldbyName('RQSEST').AsString := 'ACEPTADO';
            DMALM.cdsReqs.FieldByName('RQSACEPFREG').AsDateTime := Date;

            DMALM.cdsReqs.FieldByName('RQSACEPHREG').AsDateTime := Date + SysUtils.Time;

            DMALM.cdsReqs.Post;

            DMALM.cdsReqs.DataRequest('SELECT * FROM LOG308 WHERE CIAID=''' + dblcCIA.Text + ''' AND LOCID=''' + dblcLOC.Text + ''' AND RQSID=''' + dbeNumRqs.Text + '''');

            DMALM.cdsDReqs.First;
            While Not DMALM.cdsDReqs.Eof Do
            Begin
               DMALM.cdsDReqs.Edit;
               DMALM.cdsDReqs.FieldbyName('RQSEST').AsString := 'ACEPTADO';
               DMALM.cdsDReqs.Post;
               DMALM.cdsDReqs.Next;
            End;
    //DMALM.ControlTran;
            DMALM.ControlTran(9, DMALM.cdsReqs, 'REQS');
            DMALM.ControlTran(9, DMALM.cdsDReqs, 'DREQS');
            Z2dbgDReqsIButton.enabled := False;
    //DMALM.cdsReqs.ApplyUpdates(0);
    //DMALM.cdsDReqs.ApplyUpdates(0);
         End;
      Finally
         Screen.Cursor := crDefault;
      End;
   End;
   btnDetalle;
End;

{Function  TFRegReqs.wPreUni : integer;
var
 wConta : Integer;
begin
 wConta := 0;
  DMALM.cdsDReqs.DisableControls;
  DMALM.cdsDReqs.First;
  while not DMALM.cdsDReqs.Eof do
  begin
    if DMALM.cdsDReqs.FieldByName('DPROFPUNG').AsFloat = 0.0 then
     wConta:=wConta+1;
   DMALM.cdsDReqs.Next;
  end;
  DMALM.cdsDReqs.First;
  DMALM.cdsDReqs.EnableControls;
  if wConta > 0 then
   ErrorMsg(Caption, ' Al menos uno de los Campos de Precio Unitario esta en Blanco '+#13+#13+
                  'Verifique !!! ');
 Result:= wConta;
end;}

Procedure TFRegReqs.Z2bbtnAnulaClick(Sender: TObject);
Begin
   If (trim(DMALM.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL') And
      (DMALM.cdsDReqs.RecordCount > 0) Then
   Begin
      If DMALM.cdsReqs.State In [dsBrowse] Then
      Begin
         DMALM.cdsReqs.Edit;
         DMALM.cdsReqs.FieldbyName('RQSEST').AsString := 'ANULADO';
         DMALM.cdsReqs.Post;
      End;
      DMALM.cdsDReqs.First;
      While Not DMALM.cdsDReqs.Eof Do
      Begin
         DMALM.cdsDReqs.Edit;
         DMALM.cdsDReqs.FieldbyName('RQSEST').AsString := 'ANULADO';
         DMALM.cdsDReqs.Post;
         DMALM.cdsDReqs.Next;
      End;
  //DMALM.ControlTran;
      DMALM.ControlTran(9, DMALM.cdsReqs, 'REQS');
      DMALM.ControlTran(9, DMALM.cdsDReqs, 'DREQS');
  //DMALM.cdsReqs.ApplyUpdates(0);
   End;
   btnDetalle;
End;

Procedure TFRegReqs.Z2dbgDReqsIButtonClick(Sender: TObject);
Var
   sMax: String;
Begin
   Screen.Cursor := crHourGlass;
   edtUNMID.Text := '';
   dbcbFLAG.Text := '';
   dblcUNMID.Text := '';
   edtUMedReq.Text := '';
   dbeCNTS.Text := '';
   iEstado := 0;
   vunmid := '';
   pnlBotones.Enabled := False;

   sMax := DMALM.StrZero(DMALM.MaxValue('DRQSID', DMALM.cdsDReqs), 3);

   If (sTipoRQS = 'S') Or (sTipoRQS = 'A') Then
   Begin
      dbmObservacion.Clear;
      pnlDetalleB.Visible := True;
      dbeItem1.Text := sMax;
      If sTipoRQS = 'S' Then
      Begin
         stxTitulo3.caption := 'Detalle de Requisición x Servicios';
         lblTexto.Caption := ' Servicio ';
         dbeCant.Text := '1';
         dblcUnMed.Text := '';
         dblcUnMed.Text := DMALM.DisplayDescrip('prvSQL', 'TGE130', 'UNMID', 'UNMSERV=''S''', 'UNMID');
         edtUNMID.Text := DMALM.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID=''' + dblcUnMed.Text + '''', 'UNMDES');
         dbmObservacion.SetFocus;
      End
      Else
      Begin
         stxTitulo3.caption := 'Detalle de Requisición x Compra de Activo Fijo';
         lblTexto.Caption := ' Activo Fijo ';
         dbeCant.Text := '1';
         dblcUnMed.Text := '';
         dblcUnMed.Text := DMALM.DisplayDescrip('prvSQL', 'TGE130', 'UNMID', 'UNMSERV=''S''', 'UNMID');
         edtUNMID.Text := DMALM.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID=''' + dblcUnMed.Text + '''', 'UNMDES');
         dbeCant.Enabled := true;
         dbeCant.SetFocus;
      End;
   End
   Else
      If (sTipoRQS = 'C') Then
      Begin
         dbeItem.Text := sMax;
         dbcbFLAG.Text := 'G';
         pnlDetalleA.Visible := True;
         dbcldArti.Enabled := True;
         dbcldArti.SetFocus;
         dbeCNTS.Enabled := True;
         dbeItem.Text := sMax;
         dbeCNTS.text := '';
         dbeCNTA.text := '';
         dbcldArti.text := '';
         edtARTDES.text := '';
         dblcUNMID.text := '';
         dbcbFLAG.Value := '';
      End;
   OnOffDetalle(False);
   dbgDReqs.Enabled := False;
   Screen.Cursor := crDefault;
End;

Procedure TFRegReqs.Z2bbtnRegOkClick(Sender: TObject);
Var
   sCIAID, sRQSID, sARTID, sALMID, sLOCID: String;
   bExiste: Boolean;
Begin
   dbgDReqs.Enabled := True;
   If DMALM.cdsReqs.FieldbyName('RQSEST').AsString <> 'INICIAL' Then
   Begin
      If (sTipoRQS = 'S') Or (sTipoRQS = 'A') Then
      Begin
         dbeCant.Enabled := True;
         dblcUnMed.Enabled := True;
         pnlDetalleB.Visible := False;
      End
      Else
      Begin
         dbcldArti.Enabled := true;
         dblcUNMID.Enabled := true;
         dbcbFLAG.Enabled := true;
         dbeCNTS.Enabled := true;
         pnlDetalleA.Visible := False;
      End;
      ErrorMsg(Caption, ' Sin Modificar ');
      Exit;
   End;

   If sTipoRQS = 'C' Then
   Begin
      If trim(edtARTDES.Text) = '' Then
      Begin
         ErrorMsg(Caption, ' Articulo no Existe ');
         dbcldArti.SetFocus;
         Exit;
      End;
      If trim(dbeCNTS.Text) = '' Then
      Begin
         ErrorMsg(Caption, ' La cantidad no puede estar en blanco ');
         dbeCNTS.SetFocus;
         Exit;
      End;
      If strtofloat(dbeCNTS.Text) <= 0 Then
      Begin
         ErrorMsg(Caption, ' La cantidad tiene ser mayor a cero ');
         dbeCNTS.SetFocus;
         Exit;
      End;
   End
   Else // Servicio - Activo Fijo
   Begin
      If trim(dblcUnMed.Text) = '' Then
      Begin
         ErrorMsg(Caption, 'La unidad de medida no puede estar en blanco');
         dblcUnMed.SetFocus;
         Exit;
      End;
      If trim(dbeCant.Text) = '' Then
      Begin
         ErrorMsg(Caption, 'La Cantidad no puede estar en blanco');
         dbeCant.SetFocus;
         Exit;
      End;
      If strtofloat(dbeCant.Text) <= 0 Then
      Begin
         ErrorMsg(Caption, 'La Cantidad tiene ser mayor a cero');
         dbeCant.SetFocus;
         Exit;
      End;

      If trim(dbmObservacion.Text) = '' Then
      Begin
         If sTipoRQS = 'S' Then
            ErrorMsg(Caption, 'No existe Información para el servicio a prestar ');
         If sTipoRQS = 'A' Then
            ErrorMsg(Caption, 'No existe Información para el Activo Fijo ');
         dbmObservacion.SetFocus;
         Exit;
      End;
   End;
   sCIAID := DMALM.cdsReqs.FieldByName('CIAID').AsString;
   sRQSID := DMALM.cdsReqs.FieldByName('RQSID').AsString;
   sLOCID := DMALM.cdsReqs.FieldByName('LOCID').AsString;
   sALMID := DMALM.cdsReqs.FieldByName('ALMID').AsString;
   sARTID := dbcldArti.Text;
   If sTipoRQS = 'C' Then
   Begin

      If iEstado = 0 Then
         bExiste := DMALM.cdsDReqs.Locate('CIAID;RQSID;ARTID', VarArrayOf([sCIAID, sRQSID, sARTID]), [])
      Else
         bExiste := False;
      If bExiste Then
      Begin
         ErrorMsg('Error', 'No pueden existir artículos duplicados' + #13 +
            'en un detalle de Registro de Requisición ');
         Exit;
      End;

      If dbcldArti.Text = '' Then
      Begin
         ErrorMsg('Error', 'El Código del Artículo es Obligatorio.....');
         dbcldArti.SetFocus;
         Exit;
      End;
      If Length(dbeCntS.Text) = 0 Then
      Begin
         ErrorMsg('Error', 'La Cantidad pedida debe ser mayor que cero...');
         Exit;
      End;
      If StrToFloat(dbeCntS.Text) <= 0 Then
      Begin
         ErrorMsg('Error', 'La Cantidad pedida debe ser mayor que cero...');
         DMALM.cdsDReqs.Cancel;
         Exit;
      End;
   End;
 {Guardar los datos del detalle }
   If (iEstado = 0) And (DMALM.cdsDReqs.state <> dsInsert) Then
      DMALM.cdsDReqs.Insert
   Else
      If (iEstado = 1) And (DMALM.cdsDReqs.state <> dsEdit) Then
         DMALM.cdsDReqs.Edit;

   If DMALM.cdsDReqs.State In [dsInsert, dsEdit] Then
   Begin
      Try
         DMALM.cdsDReqs.FieldByName('CIAID').AsString := dblcCIA.Text;
         DMALM.cdsDReqs.FieldByName('RQSID').AsString := dbeNumRqs.Text;
         DMALM.cdsDReqs.FieldByName('LOCID').AsString := dblcLOC.Text;
         DMALM.cdsDReqs.FieldByName('CCOSID').AsString := dblcdCCos.Text;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         If sTipoRQS = 'C' Then
         Begin
            DMALM.cdsDReqs.FieldByName('ARTID').AsString := dbcldArti.Text;

            wSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' AND ARTID=' + QuotedStr(DMALM.cdsDReqs.FieldByName('ARTID').AsString);
            DMALM.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, TINID, GRARID, FAMID, SFAMID', wSQL, 'ARTID');

            DMALM.cdsDReqs.FieldByName('TINID').AsString := DMALM.cdsQry.FieldByName('TINID').AsString;
            DMALM.cdsDReqs.FieldByName('GRARID').AsString := DMALM.cdsQry.FieldByName('GRARID').AsString;
            DMALM.cdsDReqs.FieldByName('FAMID').AsString := DMALM.cdsQry.FieldByName('FAMID').AsString;
            DMALM.cdsDReqs.FieldByName('SFAMID').AsString := DMALM.cdsQry.FieldByName('SFAMID').AsString;
         End
         Else
            If (sTipoRQS = 'A') Or (sTipoRQS = 'S') Then
               DMALM.cdsDReqs.FieldByName('ARTID').AsString := dbeItem1.Text;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         DMALM.cdsDReqs.FieldByName('RQSFLAGUM').AsString := dbcbFLAG.text;
         If sTipoRQS <> 'C' Then
            DMALM.cdsDReqs.FieldByName('RQSFLAGUM').AsString := 'G';
   { La información se guardará en los campos G. o U. dependiendo del Flag}
         If sTipoRQS = 'C' Then
         Begin
            If DMALM.cdsDReqs.FieldByName('RQSFLAGUM').AsString = 'G' Then
            Begin
               DMALM.cdsDReqs.FieldByName('DRQSID').AsString := dbeItem.Text;
               DMALM.cdsDReqs.FieldByName('UNMIDG').AsString := dblcUNMID.Text; //vunmid;
               DMALM.cdsDReqs.FieldByName('DRQSCNSG').AsString := dbeCntS.Text;
               DMALM.cdsDReqs.FieldByName('DRQSCNAG').AsString := dbeCntA.Text;
            End
            Else
            Begin
               DMALM.cdsDReqs.FieldByName('DRQSID').AsString := dbeItem.Text;
               DMALM.cdsDReqs.FieldByName('UNMIDU').AsString := dblcUNMID.Text; //vunmid;
               DMALM.cdsDReqs.FieldByName('DRQSCNSU').AsString := dbeCntS.Text;
               DMALM.cdsDReqs.FieldByName('DRQSCNAU').AsString := dbeCntA.Text;
            End;
         End
         Else
         Begin // Henry
            DMALM.cdsDReqs.FieldByName('DRQSID').AsString := dbeItem1.Text;
            DMALM.cdsDReqs.FieldByName('UNMIDG').AsString := dblcUnMed.Text; //vunmid;
            DMALM.cdsDReqs.FieldByName('DRQSCNSG').AsString := dbeCant.Text;
    //DMALM.cdsDReqs.FieldByName('DRQSCNAG').AsString:= dbeCntA.Text;
         End;

         DMALM.cdsDReqs.FieldByName('TIPOADQ').asString := sTipoRQS;
   // ------------------ Igualar los valores de la Requisición --------------------
         DMALM.cdsDReqs.FieldByName('RQSFREG').AsDateTime := DMALM.cdsReqs.FieldByName('RQSFREG').AsDateTime;
         DMALM.cdsDReqs.FieldByName('RQSFATE').AsDateTime := DMALM.cdsReqs.FieldByName('RQSFATE').AsDateTime;
         DMALM.cdsDReqs.FieldByName('PRIOID').AsString := DMALM.cdsReqs.FieldByName('PRIOID').AsString;
         DMALM.cdsDReqs.FieldByName('RQSEST').AsString := DMALM.cdsReqs.FieldByName('RQSEST').AsString;
         DMALM.cdsDReqs.FieldByName('TRQSID').AsString := DMALM.cdsReqs.FieldByName('TRQSID').AsString;
         If DMALM.cdsDReqs.FieldByName('DRQSCNSG').IsNull Then DMALM.cdsDReqs.FieldByName('DRQSCNSG').AsFloat := 0;
         If DMALM.cdsDReqs.FieldByName('DRQSCNSU').IsNull Then DMALM.cdsDReqs.FieldByName('DRQSCNSU').AsFloat := 0;
         If DMALM.cdsDReqs.FieldByName('DRQSCNAG').IsNull Then DMALM.cdsDReqs.FieldByName('DRQSCNAG').AsFloat := 0;
         If DMALM.cdsDReqs.FieldByName('DRQSCNAU').IsNull Then DMALM.cdsDReqs.FieldByName('DRQSCNAU').AsFloat := 0;
         If sTipoRQS = 'C' Then
            DMALM.cdsDReqs.FieldByName('DRQSOBS').asString := edtARTDES.Text
         Else
            DMALM.cdsDReqs.FieldByName('DRQSOBS').asString := dbmObservacion.Text;

         DMALM.cdsDReqs.FieldbyName('RQSANO').AsString := DMALM.cdsReqs.FieldbyName('RQSANO').AsString;
         DMALM.cdsDReqs.FieldbyName('RQSMES').AsString := DMALM.cdsReqs.FieldbyName('RQSMM').AsString;
         DMALM.cdsDReqs.FieldbyName('RQSDIA').AsString := DMALM.cdsReqs.FieldbyName('RQSDD').AsString;
         DMALM.cdsDReqs.FieldbyName('RQSTRIM').AsString := DMALM.cdsReqs.FieldbyName('RQSTRI').AsString;
         DMALM.cdsDReqs.FieldbyName('RQSSEM').AsString := DMALM.cdsReqs.FieldbyName('RQSSEM').AsString;
         DMALM.cdsDReqs.FieldbyName('RQSANOMES').AsString := DMALM.cdsReqs.FieldbyName('RQSANOMM').AsString;
         DMALM.cdsDReqs.FieldbyName('RQSSS').AsString := DMALM.cdsReqs.FieldbyName('RQSSS').AsString;
         DMALM.cdsDReqs.FieldbyName('RQSAATRI').AsString := DMALM.cdsReqs.FieldbyName('RQSAATRI').AsString;
         DMALM.cdsDReqs.FieldbyName('RQSAASEM').AsString := DMALM.cdsReqs.FieldbyName('RQSAASEM').AsString;
         DMALM.cdsDReqs.FieldbyName('RQSAASS').AsString := DMALM.cdsReqs.FieldbyName('RQSAASS').AsString;
         DMALM.cdsDReqs.FieldByName('RQSUSER').AsString := DMALM.wUsuario;

         DMALM.cdsDReqs.Post;
   //DMALM.ControlTran;
         OnOffDetalle(True); // activar detalle
         btnDetalle;
         Z2bbtnGraba.Enabled := true;
         If (iEstado = 0) And (DMALM.cdsDReqs.state <> dsInsert) Then
            Z2dbgDReqsIButton.Click
         Else
            If (iEstado = 1) And (DMALM.cdsDReqs.state <> dsEdit) Then
               If (sTipoRQS = 'S') Or (sTipoRQS = 'A') Then
                  pnlDetalleB.Visible := False
               Else
                  pnlDetalleA.Visible := False;
      Except
         On E: Exception Do
            If Not EHandlerError(E) Then Raise;
      End;
   End;
End;

Procedure TFRegReqs.Z2bbtnRegCancClick(Sender: TObject);
Begin
   If DMALM.cdsDReqs.State In [dsInsert, dsEdit] Then
      DMALM.cdsDReqs.Cancel;

   OnOffDetalle(True); // activar detalle
   If (sTipoRQS = 'S') Or (sTipoRQS = 'A') Then
   Begin
      dbeCant.Enabled := True;
      dblcUnMed.Enabled := True;
      pnlDetalleB.Visible := False;
   End
   Else
      pnlDetalleA.Visible := False;
   btnDetalle;
   pnlBotones.Enabled := True;
   Z2bbtnGraba.Enabled := true;
   dbgDReqs.Enabled := True;
End;

Procedure TFRegReqs.OnOffCabecera(Value: Boolean);
Begin
  // ----------------------  activar cabecera de requisición -------------------
   pnlCabecera.Enabled := Value;
   Z2bbtnBorrar.Enabled := Value;
   Z2bbtnOK.Enabled := Value;
End;

Procedure TFRegReqs.OnOffDetalle(Value: Boolean);
Begin
  //----------------  activar detalle de requisición ---------------
   If Value Then
      stxTitulo1.Color := clHighlight
   Else
      stxTitulo1.Color := clGray;
 //  pnlBotones.Enabled   := Value;
 //  pnlDetalleG.Enabled  := Value;
   Z2bbtnRegresa.Enabled := Value;
   Z2bbtnCanc2.Enabled := Value;
   Z2bbtnGraba.Enabled := Value;
   Z2bbtnAcepta.Enabled := Value;
   Z2bbtnAnula.Enabled := Value;
 //  Z2bbtnNuevo.Enabled  := Value;
End;

Procedure TFRegReqs.btnDetalle;
Var
   bDummy1, bDummy2: Boolean;
Begin
   bDummy1 := ((DMALM.cdsDReqs.ChangeCount > 0) Or (DMALM.cdsReqs.ChangeCount > 0) Or
      (DMALM.cdsDReqs.Modified) Or (DMALM.cdsReqs.Modified));
   bDummy2 := True;
   If trim(DMALM.cdsReqs.FieldbyName('RQSEST').AsString) <> 'INICIAL' Then
   Begin
      OnOffCabecera(False);
      OnOffDetalle(False);
      bDummy2 := False;
   End
   Else
   Begin
      If Not pnlDetalleG.Enabled Then
         bDummy2 := False
      Else
         If trim(DMALM.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL' Then
            bDummy2 := Not bDummy1;
   End;
   Z2bbtnGraba.Enabled := bDummy2;
   Z2bbtnAnula.Enabled := bDummy2;
   Z2bbtnAcepta.Enabled := bDummy2;
   Z2bbtnCanc2.Enabled := bDummy1 Or bDummy2;
   Z2bbtnRegresa.Enabled := bDummy1 Or bDummy2;
 //08/11/2000  Z2bbtnNuevo.Enabled  := False;
 //  bDummy3 := False;
 //  if wModo='A' then bDummy3 := not bDummy1;
 //08/11/2000  Z2bbtnNuevo.Enabled:= bDummy3;
 //Z2dbgDReqsIButton.Enabled:= ( trim(DMALM.cdsReqs.FieldbyName('RqsEst').AsString) = 'INICIAL' );
End;

Procedure TFRegReqs.Z2bbtnNuevoClick(Sender: TObject);
Begin
   If (DMALM.wModo = 'A') And
      (trim(DMALM.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL') And
      (DMALM.cdsReqs.FieldbyName('RQSVISADOR').IsNull) And
      (Length(Trim(xOrdElim)) > 0) Then
   Begin
  //sSQL:='DELETE FROM LOG309 WHERE RQSID='''+xOrdElim+'''';
    //DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      DMALM.cdsDReqs.First;
      While Not DMALM.cdsDReqs.Eof Do
         DMALM.cdsDReqs.Delete;
      DMALM.cdsReqs.Delete;
  //DMALM.ControlTran;
      DMALM.ControlTran(9, DMALM.cdsReqs, 'REQS');
      DMALM.ControlTran(9, DMALM.cdsDReqs, 'DREQS');
      DMALM.wModo := '';
   End;
   OnOffCabecera(True);
   OnOffDetalle(False);
  //dblcCIA.Enabled  :=True;
   dbeNumRqs.Enabled := True;
   dblcTipoCompra.Enabled := True;
   dblcTRqs.Enabled := True;

   DMALM.cdsReqs.Insert;
   DMALM.wModo := 'A';
   dcCIA;
   dcLOC;
//  dcALM;
   dcNUM;
   DMALM.cdsReqs.fieldbyname('PRIOID').AsString := 'M';
   If SRV_D = 'ORACLE' Then
      DMALM.cdsReqs.fieldbyname('PRIOID').AsString := 'N';
   DMALM.cdsReqs.fieldbyname('RQSFREQ').AsDateTime := date;
   DMALM.cdsReqs.fieldbyname('RQSFATE').AsDateTime := date;
   DMALM.cdsReqs.FieldByName('RQSEST').AsString := 'INICIAL';
   dbeCCostos.Text := '';
   dbeTRqs.Text := '';
   edtObra.Text := '';
   edtTipoCompra.Text := '';
   dbeTipPre.Text := '';
   edtPresup.Text := '';
   dbeNumRqs.SetFocus;
End;

Procedure TFRegReqs.dbgDReqsKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
   If (Key = $4D) And (ssCtrl In Shift) Then //^N
      dbgDReqsDblClick(Nil);
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If trim(DMALM.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL' Then
      Begin
         If xValorX <> 'X' Then // Este Control (xValorX) sirve para que no elimine registros cuando viene
         Begin // de la opcion ¨ Depuracion Requisiciones Pendientes ¨ // Ojo
            If DMALM.cdsDReqs.RecordCount > 0 Then
               DMALM.cdsDReqs.Delete;
            If DMALM.cdsDReqs.RecordCount > 0 Then
            Begin
               dblcTipoCompra.Enabled := false;
               dblcTRqs.Enabled := false;
            End
            Else
            Begin
               dblcTipoCompra.Enabled := true;
               dblcTRqs.Enabled := true;
            End;
         End;
   //DMALM.ControlTran; ESTABA
      End
      Else
         ErrorMsg('Error', 'No se puede borrar...');
   End;
   btnDetalle;
   If DMALM.cdsReqs.FieldByName('RQSEST').AsString <> 'ACEPTADO' Then
      If xValorX <> 'X' Then // Este Control (xValorX) sirve para que no elimine registros cuando viene
         Z2bbtnGraba.Enabled := True; // de la opcion ¨ Depuracion Requisiciones Pendientes ¨ // Ojo
End;

Procedure TFRegReqs.dbgDReqsDblClick(Sender: TObject);
Var
   sSQL, sEST: String;
Begin
   If DMALM.cdsDReqs.RecordCount = 0 Then
   Begin
      ErrorMsg(Caption, ' No Existen Registros a Editar ');
      Exit;
   End;
 //if length(Trim(sTipoRQS)) = 0 then
   //sTipoRQS := DMALM.cdsReqs.FieldByName('TIPOADQ').asString;
   OnOffDetalle(False); // Desactivar el panel de detalle
   iEstado := 1;

   If (sTipoRQS = 'S') Or (sTipoRQS = 'A') Then
   Begin
      If DMALM.cdsDReqs.FieldByName('RQSFLAGUM').AsString = 'G' Then
      Begin
         dbeCant.Text := DMALM.cdsDReqs.FieldByName('DRQSCNSG').AsString;
         dblcUnMed.text := DMALM.cdsDReqs.FieldByName('UNMIDG').AsString;
      End
      Else
      Begin
         dbeCant.Text := DMALM.cdsDReqs.FieldByName('DRQSCNSU').AsString;
         dblcUnMed.text := DMALM.cdsDReqs.FieldByName('UNMIDU').AsString;
      End;
      dbeItem1.Text := DMALM.cdsDReqs.FieldByName('DRQSID').AsString;
      dbmObservacion.Text := DMALM.cdsDReqs.FieldByName('DRQSOBS').AsString;
      sSQL := 'UNMID=' + QuotedStr(dblcUnMed.text);
      edtUNMID.Text := DMALM.displaydescrip('prvSQL', 'TGE130', 'UNMDES', sSQL, 'UNMDES');
      dblcExist(dblcUnMed);
   End
   Else
      If (sTipoRQS = 'C') Then
      Begin
         If DMALM.cdsDReqs.FieldByName('RQSFLAGUM').AsString = 'G' Then
         Begin
            dbeCNTS.Text := DMALM.cdsDReqs.FieldByName('DRQSCNSG').AsString;
            dbeCNTA.Text := DMALM.cdsDReqs.FieldByName('DRQSCNAG').AsString;
            dblcUNMID.text := DMALM.cdsDReqs.FieldByName('UNMIDG').AsString;
         End
         Else
         Begin
            dbeCNTS.Text := DMALM.cdsDReqs.FieldByName('DRQSCNSU').AsString;
            dbeCNTA.Text := DMALM.cdsDReqs.FieldByName('DRQSCNAU').AsString;
            dblcUNMID.text := DMALM.cdsDReqs.FieldByName('UNMIDU').AsString;
         End;
         dbeItem.Text := DMALM.cdsDReqs.FieldByName('DRQSID').AsString;
         dbcldArti.Text := DMALM.cdsDReqs.FieldByName('ARTID').AsString;
         edtARTDES.Text := DMALM.cdsDReqs.FieldByName('DRQSOBS').AsString;
         dbcbFLAG.value := DMALM.cdsDReqs.FieldByName('RQSFLAGUM').AsString;
         sSQL := 'UNMID=' + QuotedStr(dblcUnMed.text);
         edtUNMID.Text := DMALM.displaydescrip('prvSQL', 'TGE130', 'UNMDES', sSQL, 'UNMDES');
         dblcExist(dblcUNMID);
      End;
   sEST := trim(DMALM.cdsReqs.FieldbyName('RQSEst').AsString);
   If sEST = 'INICIAL' Then
   Begin
      If (sTipoRQS = 'S') Or (sTipoRQS = 'A') Then
      Begin
         pnlDetalleB.Visible := True; // Activar el panel de Mantenimiento
         If sTipoRQS = 'S' Then
         Begin
            stxTitulo3.caption := 'Detalle de Requisición x Servicios';
            lblTexto.Caption := ' Servicio ';
            If iEstado = 0 Then
               dbeCant.text := '1'; //DMALM.cdsDReqs.fieldbyname('DRQSCNSG').AsInteger:=1;
    //dbeCant.Enabled:=false;
        //dblcEdblcUnMed.SetFocus;
         End
         Else
         Begin
            stxTitulo3.caption := 'Detalle de Requisición x Compra de Activo Fijo';
            lblTexto.Caption := ' Activo Fijo ';
            dbeCant.Enabled := true;
            dbeCant.SetFocus;
         End;
      End
      Else
         If (sTipoRQS = 'C') Then
         Begin
            sSQL := 'ARTID=' + '''' + DMALM.cdsDReqs.FieldByName('ARTID').AsString + '''';
            If DMALM.displaydescrip('prvSQL', 'TGE205', 'ARTCONT', sSQL, 'ARTCONT') = '1' Then
            Begin
               dbcbFLAG.Enabled := false;
               dblcUNMID.Enabled := false;
            End
            Else
            Begin
               dbcbFLAG.Enabled := true;
               dblcUNMID.Enabled := False;
            End;
            dbcbFLAG.OnExit(Sender);
            pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
         End;
      DMALM.cdsDReqs.Edit;
   End
   Else
   Begin
      ErrorMsg('Error', 'Solo se pueden hacer cambios cuando la' + #13 +
         'Requisición se halla en modo inicial...');
      exit;
      If (sTipoRQS = 'S') Or (sTipoRQS = 'A') Then
      Begin
         dbeCant.Enabled := false;
         dblcUnMed.Enabled := false;
         pnlDetalleB.Visible := True;
      End
      Else
      Begin
         dbcldArti.Enabled := false;
         sSQL := 'ARTID=' + quotedstr(uppercase(dbcldArti.Text)); // quotedstr(DMALM.cdsArti.FieldByName('ARTID').AsString);
         edtARTDES.Text := DMALM.displaydescrip('prvSQL', 'TGE205', 'ARTDES', sSQL, 'ARTDES');
         dblcUNMID.Enabled := false;
         dbcbFLAG.Enabled := false;
         dbeCNTS.Enabled := false;
         pnlDetalleA.Visible := True;
      End;
   End;

   If sEST = 'ATENDIDO' Then
   Begin
      dbeCntS.Color := clWindow;
      dbeCntA.Enabled := False;
   End;
   dbgDReqs.Enabled := False;
  // btnDetalle;
End;

Procedure TFRegReqs.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   xValorX := '';
   If DMALM.cdsReqs.State In [dsEdit, dsInsert] Then DMALM.cdsReqs.Cancel;
   If DMALM.cdsDReqs.State In [dsEdit, dsInsert] Then DMALM.cdsDReqs.Cancel;
   If DMALM.cdsReqs.ChangeCount > 0 Then DMALM.cdsReqs.CancelUpdates;
   If DMALM.cdsDReqs.ChangeCount > 0 Then DMALM.cdsDReqs.CancelUpdates;
   If (DMALM.wModo = 'A') And
      (trim(DMALM.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL') And
      (DMALM.cdsReqs.FieldbyName('RQSVISADOR').IsNull) And
      (Length(Trim(xOrdElim)) > 0) Then
   Begin
  //sSQL:='DELETE FROM LOG309 WHERE RQSID='''+xOrdElim+'''';
    //DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      DMALM.cdsDReqs.First;
      While Not DMALM.cdsDReqs.Eof Do
         DMALM.cdsDReqs.Delete;
      DMALM.cdsReqs.Delete;
         //DMALM.ControlTran;
      DMALM.ControlTran(9, DMALM.cdsReqs, 'REQS');
      DMALM.ControlTran(9, DMALM.cdsDReqs, 'DREQS');
      DMALM.wModo := '';
   End;

   DMALM.wModo := '';
  //   btnDetalle;
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   //FVariables.w_IN_Registro := False;
   If DMALM.wTipoAdicion = 'xFiltro' Then
   Begin
      DMALM.ActualizaFiltro(mtx3000, DMALM.cdsReqs, DMALM.wModo);
   End;
   Action := CAFree;
End;

{procedure TFRegReqs.cSetFocus(Sender: TObject; const sMsg: String);
begin
  if TCustomEdit(Sender).Text='' then
  begin
    ErrorMsg('Error',sMsg);
    TCustomEdit(Sender).SetFocus;
  end;
end;}

Function TFRegReqs.EHandlerError(Ex: Exception): Boolean;
Var
   a, b: Integer;
   s1, s2: String;
Begin
   Result := true;
   If Ex.Message = 'Key violation.' Then
      ErrorMsg('Error', 'No pueden existir registros duplicados.. ')
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

Procedure TFRegReqs.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegReqs.dblcExist(Sender: TObject);
Var
   ssql: String;
Begin
   If sender = dblcCIA Then
   Begin
      edtCia.text := DMALM.DisplayDescrip('prvSQL', 'TGE101', 'CIADES', 'CIAID=' + quotedStr(dblcCIA.text), 'CIADES');

      DMALM.cdsLOC.Filtered := False;
      DMALM.cdsLOC.Filter := 'CIAID=''' + dblcCIA.Text + '''';
      DMALM.cdsLOC.Filtered := True;

      If wFil_Ccos = 'S' Then
      Begin
         DMALM.FiltraCDS(DMALM.cdsCCost, 'SELECT * FROM TGE203 WHERE CCOSACT<>''N'' AND CCOSCIAS LIKE ''%' + dblcCIA.Text + '%'' ORDER BY CCOSID'); // WHERE CCOSMOV=''S''');
     //DMALM.cdsCCost.Filtered := False;
     //DMALM.cdsCCost.Filter   := 'CCOSCIAS='''+dblcCIA.Text+'''';
     //DMALM.cdsCCost.Filtered := True;
      End;

      If wActuaPresu Then
      Begin
         DMALM.cdsParPre.Filtered := False;
         DMALM.cdsParPre.Filter := 'CIAID=''' + dblcCIA.Text + '''';
         DMALM.cdsParPre.Filtered := True;
      End;

  { DMALM.cdsALM.Filtered := False;
  DMALM.cdsALM.Filter   := 'CIAID='''+dblcCIA.Text+''' AND LOCID='''+dblcLOC.Text+'''';
  DMALM.cdsALM.Filtered := True;}
      dcLOC;
  //dcALM;
      dcNUM;
      exit;
   End;
   If sender = dblcLOC Then
   Begin
      sSQL := 'CIAID=' + quotedStr(dblcCIA.text) + ' AND LOCID=' + quotedStr(dblcLOC.text);
      edtLoc.text := DMALM.DisplayDescrip('prvSQL', 'TGE126', 'LOCDES', sSQL, 'LOCDES');
  {DMALM.cdsALM.Filtered := False;
  DMALM.cdsALM.Filter   := 'CIAID='''+dblcCIA.Text+''' AND LOCID='''+dblcLOC.Text+'''';
  DMALM.cdsALM.Filtered := True;
    dcALM;}
      dcNUM;
      exit;
   End;
   If sender = dblcObra Then
   Begin
      sSQL := 'OBRAID=' + quotedStr(dblcObra.text);
      edtObra.text := DMALM.DisplayDescrip('prvSQL', 'TGE213', 'OBRADES', sSQL, 'OBRADES');
      exit;
   End;

   If sender = dblcUnMed Then
   Begin
      ssql := 'UNMID=' + quotedStr(dblcUnMed.Text);
      edtUNMID.text := DMALM.displaydescrip('prvSQL', 'TGE130', 'UNMDES', ssql, 'UNMDES');
      exit;
   End;
   If sender = dblcUNMID Then
   Begin
      ssql := 'UNMID=' + quotedStr(dblcUNMID.Text);
      edtUMedReq.text := DMALM.displaydescrip('prvSQL', 'TGE130', 'UNMDES', ssql, 'UNMDES');
      If dblcUNMID.Text <> '' Then
         vunmid := dblcUNMID.Text //vunmid;
      Else
         vunmid := '';
      exit;
   End;
End;

Procedure TFRegReqs.dbeNumRqsExit(Sender: TObject);
Var
   sSQL, sCIAID, sLOCID, sRQSID: String;
Begin
   If DMALM.wModo <> 'A' Then Exit;
   If length(trim(dbeNumRqs.Text)) = 0 Then
      dcNUM;
   sCIAID := dblcCIA.Text;
   sLOCID := dblcLOC.Text;
   sRQSID := dbeNumRqs.Text;
   If DMALM.IsExistRqsM(sCIAID, sLOCID, sRQSID) Then
   Begin
      ErrorMsg('Error', 'Ya existe una requisión con ' + #13 +
         'el mismo número ... ' + DMALM.cdsReqs.FieldByName('RQSID').AsString);
      dcNUM;
    //dbeNumRqs.SetFocus;
      Exit;
   End;

   sSQL := 'SELECT * FROM LOG309 ' +
      'WHERE CIAID=''' + sCIAID + ''' ' +
      'AND LOCID=''' + sLOCID + ''' ' +
      'AND RQSID=''' + sRQSID + ''' ' +
      'ORDER BY CIAID, LOCID, RQSID, DRQSID';

   DMALM.cdsDReqs.Close;
   DMALM.cdsDReqs.DataRequest(sSQL);
   DMALM.cdsDReqs.Open;
End;

Procedure TFRegReqs.dcCIA;
Var
   sCIA: String;
Begin
   DMALM.cdsCIA.First;
   sCIA := trim(DMALM.cdsCIA.FieldByName('CIAid').AsString);
   If DMALM.cdsReqs.State In [dsInsert] Then
      DMALM.cdsReqs.FieldByName('CIAID').AsString := sCIA
   Else
      dblcCIA.Text := sCIA;

//  dblcCIA.OnExit(dblcCIA);

   edtCia.text := DMALM.DisplayDescrip('prvSQL', 'TGE101', 'CIADES', 'CIAID=' + quotedStr(dblcCIA.text), 'CIADES');

   DMALM.cdsLOC.Filtered := False;
   DMALM.cdsLOC.Filter := 'CIAID=''' + dblcCIA.Text + '''';
   DMALM.cdsLOC.Filtered := True;

   dblcCIA.Enabled := DMALM.cdsCIA.RecordCount > 1;
End;

Procedure TFRegReqs.dbdtpFReqsExit(Sender: TObject);
Begin
   If dbdtpFReqs.Text = '' Then
      dbdtpFReqs.Field.AsDateTime := Date;
End;

{procedure TFRegReqs.dcALM;
begin
  dcNUM;
end;}

Procedure TFRegReqs.dcLOC;
Var
   sLOC, sSQL: String;
Begin
   If DMALM.cdsLOC.Active = False Then
   Begin
      DMALM.cdsLOC.Open;
      sSQL := 'SELECT * FROM TGE126 WHERE CIAID=''' + dblcCIA.Text + '''';
      DMALM.cdsLOC.DataRequest(sSQL);
      DMALM.cdsLOC.Open;
   End;
   DMALM.cdsLOC.First;
   sLOC := trim(DMALM.cdsLOC.FieldByName('LOCID').AsString);
   If DMALM.cdsReqs.State In [dsInsert] Then
      DMALM.cdsReqs.FieldByName('LOCID').AsString := sLOC
   Else
      dblcLOC.Text := sLOC;

   sSQL := 'CIAID=' + quotedStr(dblcCIA.text) + ' AND LOCID=' + quotedStr(dblcLOC.text);
   edtLoc.text := DMALM.DisplayDescrip('prvSQL', 'TGE126', 'LOCDES', sSQL, 'LOCDES');
 //  dblcLOC.OnExit(dblcLOC);
   dblcLOC.Enabled := DMALM.cdsLOC.RecordCount > 1;
End;

Procedure TFRegReqs.dcNUM;
Begin
   If DMALM.cdsReqs.State In [dsInsert] Then
   Begin
      dbeNumRqs.Text := DMALM.StrZero(DMALM.MaxReqA(dblcCIA.Text, dblcLOC.Text), 8);
      DMALM.cdsReqs.FieldByName('RQSID').AsString := dbeNumRqs.Text;
   End;
End;

Procedure TFRegReqs.dblcTipoCompraExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If Z2bbtnBorrar.Focused Or Z2bbtnOK.Focused Then Exit;
   dblcTRqs.Text := '';
   dbeTRqs.Text := '';
   edtTipoCompra.Text := '';
   If dblcTipoCompra.Text = '' Then
   Begin
      ErrorMsg(Caption, 'Tiene que seleccionar un tipo de Solicitud');
      dblcTipoCompra.SetFocus;
      Exit;
   End;
   sSQL := 'TIPOADQ=' + QuotedStr(dblcTipoCompra.Text);
   edtTipoCompra.Text := DMALM.DisplayDescrip('prvSQL', 'TGE173', 'TIPADQDES', sSQL, 'TIPADQDES');
   If edtTipoCompra.Text <> '' Then
   Begin
      sSQL := 'SELECT * FROM TGE142 WHERE TIPOADQ=' + quotedStr(dblcTipoCompra.text);
      DMALM.cdsTRqs.Close;
      DMALM.cdsTRqs.DataRequest(sSQL);
      DMALM.cdsTRqs.Open;
      DMALM.cdsTRqs.First;
      If (DMALM.cdsTRqs.RecordCount = 1) And (DMALM.wModo = 'A') Then
      Begin
         DMALM.cdsReqs.FieldByName('TRQSID').AsString := DMALM.cdsTRqs.FieldByName('TRQSID').AsString;
      End;
    //dblcTRqs.SetFocus;
    //dblcTRqs.Text := DMALM.cdsTRqs.fieldbyName('TRQSID').asString;
    //dblcTRqs.DropDown;
   End;
End;

Procedure TFRegReqs.dblcdCCosExit(Sender: TObject);
Var
   xSql, xWhere, xParPres, xTipPres: String;
Begin
   xPresu := 'N';
   If dblcCIA.Focused Then Exit;
   If dblcLOC.Focused Then Exit;
   If dblcTipoCompra.Focused Then Exit;
   If dblcTRqs.Focused Then Exit;

  //dbeCCostos.Text := DMALM.DisplayDescrip('prvSQL','TGE203','CCOSDES','CCOSID='+quotedStr(dblcdCCos.text),'CCOSDES');

   DMALM.DisplayDescrip('prvSQL', 'TGE203', 'CCOSDES, ' + DMALM.wReplacCeros + '(CCOSMOV,''N'') CCOSMOV', 'CCOSID=' + quotedStr(dblcdCCos.text), 'CCOSDES');
   If DMALM.cdsQry.FieldByName('CCOSMOV').ASString = 'N' Then
   Begin
      dbeCCostos.Text := '';
      ErrorMsg(Caption, ' Solo puede Seleccionar un Codigo de C. Costo de Ultimo Nivel ');
      Exit;
   End;
   dbeCCostos.Text := DMALM.cdsQry.FieldByName('CCOSDES').ASString;

   If dblcdCCos.Text = '' Then Exit;
   If wActuaPresu Then
   Begin
      Try
         If DMALM.wModo = 'A' Then
         Begin
            Screen.Cursor := crHourGlass;
            pnlActualizando.Visible := True;
            pnlActualizando.Refresh;
            lblActualizando.Caption := 'Buscando Partidas Presupuestales...';
            lblActualizando.Refresh;
            xWhere := 'CCOSID=' + quotedstr(dblcdCCos.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
            If Length(DMALM.DisplayDescrip('prvTGE', 'PPRES301', 'CCOSID', xWhere, 'CCOSID')) > 0 Then
            Begin
               xPresu := 'S';
               xSql := 'SELECT CIAID, CCOSID, PARPRESID, TIPPRESID FROM PPRES301 WHERE CCOSID=' + quotedstr(dblcdCCos.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
               DMALM.cdsSQL.Close;
               DMALM.cdsSQL.DataRequest(xSql);
               DMALM.cdsSQL.open;
               DMALM.cdsSQL.First;
               xParPres := 'SELECT * FROM PPRES201 WHERE CIAID=' + quotedstr(dblcCIA.text);
               xTipPres := 'SELECT * FROM PPRES101 WHERE';
               DMALM.cdsParPre.IndexFieldNames := 'CIAID;PARPRESID;PARPRESMOV';
               DMALM.cdsTipPre.IndexFieldNames := 'TIPPRESID';
               While Not DMALM.cdsSQL.Eof Do
               Begin
                  DMALM.cdsParPre.SetKey;
                  DMALM.cdsParPre.FieldByName('CIAID').AsString := DMALM.cdsSQL.fieldbyname('CIAID').Asstring;
                  DMALM.cdsParPre.FieldByName('PARPRESID').AsString := DMALM.cdsSQL.fieldbyname('PARPRESID').Asstring;
                  DMALM.cdsParPre.FieldByName('PARPRESMOV').AsString := 'S';
                  If DMALM.cdsParPre.GotoKey Then
                     xParPres := xParPres + ' AND PARPRESID =' + quotedstr(DMALM.cdsSQL.fieldbyname('PARPRESID').Asstring);
                  DMALM.cdsTipPre.SetKey;
  //           DMALM.cdsTipPre.FieldByName('CIAID').AsString := DMALM.cdsSQL.fieldbyname('CIAID').Asstring;
                  DMALM.cdsTipPre.FieldByName('TIPPRESID').AsString := DMALM.cdsSQL.fieldbyname('TIPPRESID').Asstring;
                  If DMALM.cdsTipPre.GotoKey Then
                     If Length(xTipPres) > 28 Then
                        xTipPres := xTipPres + ' AND TIPPRESID =' + quotedstr(DMALM.cdsSQL.fieldbyname('TIPPRESID').Asstring)
                     Else
                        xTipPres := xTipPres + ' TIPPRESID =' + quotedstr(DMALM.cdsSQL.fieldbyname('TIPPRESID').Asstring);
                  DMALM.cdsSQL.Next;
               End;
               DMALM.cdsParPre.Close;
               DMALM.cdsParPre.DataRequest(xParPres);
               DMALM.cdsParPre.Open;
               DMALM.cdsTipPre.Close;
               DMALM.cdsTipPre.DataRequest(xTipPres);
               DMALM.cdsTipPre.Open;
            End
            Else
            Begin
               showmessage('Centro de Costo No tiene Partida Presupuestal');
               xPresu := 'N';
            End;
         End;
      Finally
         pnlActualizando.Visible := False;
         Screen.Cursor := crDefault;
      End;
   End;
End;

Procedure TFRegReqs.dblcTRqsExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'TRQSID=' + QuotedStr(dblcTRqs.Text) + ' AND TIPOADQ=' + QuotedStr(dblcTipoCompra.Text);
   dbeTRqs.Text := DMALM.DisplayDescrip('prvSQL', 'TGE142', 'TRQSDES', sSQL, 'TRQSDES');
End;

Procedure TFRegReqs.FormActivate(Sender: TObject);
Var
   sSQL: String;
Begin
  //** 14/06/2001 - pjsv - Para Presupuestos
   OnOffCabecera(True); //Activar la cabecera
   OnOffDetalle(False); //Desactivar el panel de detalle
   If dblcCIA.Enabled Then
      dblcCIA.SetFocus;
   Z2dbgDReqsIButton.Enabled := (trim(DMALM.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL');
   pnlDetalleA.Visible := False;
   pnlDetalleB.Visible := False;
   dblcTipPre.Visible := wActuaPresu;
   dblcdPresup.Visible := wActuaPresu;
   If wActuaPresu Then
   Begin
      dbmObs.Width := 514;
      dbmObs.Left := 280;
      DMALM.cdsParPre.Open;
      DMALM.cdsTipPre.Open;
   End
   Else
   Begin
      dbmObs.Width := 748;
      dbmObs.Left := 24;
      DMALM.cdsParPre.Close;
      DMALM.cdsTipPre.Close;
   End;
  //dblcTipoCompra.SetFocus;
   lblTipPre.Visible := wActuaPresu;
   lblPresu.Visible := wActuaPresu;
   dbeTipPre.Visible := wActuaPresu;
   edtPresup.Visible := wActuaPresu;

   DMALM.FiltraCDS(DMALM.cdsCCost, 'SELECT * FROM TGE203 WHERE CCOSACT<>''N'' ORDER BY CCOSID'); // WHERE CCOSMOV=''S''');

   pnlDetalleA.Visible := False;
   pnlDetalleB.Visible := False;
   edtCia.Text := '';
   edtLoc.Text := '';
   edtObra.Text := '';
   dbePrior.Text := '';
   xOrdElim := '';
   edtTipoCompra.Text := '';
   dbeTRqs.Text := '';
   dbeCCostos.Text := '';
   dbeTipPre.Text := '';
   edtPresup.Text := '';

   If DMALM.cdsReqs.State In [dsInsert] Then
   Begin
      dcCIA;
      dcLOC;
      dcNUM;
//    dcALM;
      DMALM.cdsReqs.FieldByName('RQSEST').AsString := 'INICIAL';
      DMALM.cdsReqs.fieldbyname('RQSFREQ').AsDateTime := date;
      DMALM.cdsReqs.fieldbyname('PRIOID').AsString := 'M';
      If SRV_D = 'ORACLE' Then
         DMALM.cdsReqs.fieldbyname('PRIOID').AsString := 'N';

      DMALM.cdsReqs.fieldbyname('RQSFATE').AsDateTime := date;
   End;
   dblcPRIO.OnExit(sender);
   If (DMALM.wModo <> 'A') Then //and (DMALM.cdsReqs.fieldbyname('SCCEST').asString<>'ACEPTADO') then
   Begin
      btnDetalle;
      dblcTipoCompra.OnExit(sender);
      dblcCIA.OnExit(dblcCIA);
      dblcLOC.OnExit(dblcLOC);
      dblcObra.OnExit(dblcObra);
      dblcdCCos.OnExit(sender);
      dblcObra.OnExit(sender);
      sSQL := 'TRQSID=' + QuotedStr(dblcTRqs.Text);
      dbeTRqs.Text := DMALM.DisplayDescrip('prvSQL', 'TGE142', 'TRQSDES', sSQL, 'TRQSDES');
      sTipoRQS := DMALM.cdsReqs.FieldByName('TIPOADQ').asString;
      dblcTRqs.OnExit(sender);
   End;

   If DMALM.wModo = 'A' Then
   Begin
      xPriInser := 'A';
      dblcTipoCompra.Enabled := True;
      dblcTRqs.Enabled := True;
      dblcdCCos.Enabled := True;
      dblcPRIO.Enabled := True;
   End
   Else
   Begin
      xPriInser := '';
      If DMALM.cdsDReqs.RecordCount > 0 Then
      Begin
         dblcTipoCompra.Enabled := False;
         dblcTRqs.Enabled := False;
         dblcdCCos.Enabled := False;
         dblcPRIO.Enabled := False;
      End
      Else
      Begin
         dblcTipoCompra.Enabled := True;
         dblcTRqs.Enabled := True;
         dblcdCCos.Enabled := True;
         dblcPRIO.Enabled := True;
      End;
   End;
   sSQL := 'SELECT * FROM LOG309 ' +
      'WHERE CIAID=''' + dblcCIA.Text + ''' ' +
      'AND LOCID=''' + dblcLOC.Text + ''' ' +
      'AND RQSID=''' + dbeNumRqs.Text + ''' ' +
      'ORDER BY CIAID, LOCID, RQSID, DRQSID';
   DMALM.cdsDReqs.Close;
   DMALM.cdsDReqs.MasterSource := Nil;
   DMALM.cdsDReqs.MasterFields := '';
   DMALM.cdsDReqs.IndexFieldNames := '';
   DMALM.cdsDReqs.DataRequest(sSQL);
   DMALM.cdsDReqs.Open;

   If xReqLec = 'S' Then
   Begin
      OnOffCabecera(False); //Desactivar el panel de Cabecera
      OnOffDetalle(False); //Activar el panel de detalle
      Z2bbtnNuevo.Enabled := False;
   End;
End;

Procedure TFRegReqs.dbcldArtiExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If Z2bbtnRegCanc.Focused Then
      Exit;
   edtARTDES.clear;
   If dbcldArti.Text <> '' Then
   Begin
      sSQL := 'CIAID=' + QuotedStr(dblcCIA.text) + ' AND ARTID=' + quotedstr(uppercase(dbcldArti.Text)); // quotedstr(DMALM.cdsArti.FieldByName('ARTID').AsString);
      edtARTDES.Text := DMALM.displaydescrip('prvSQL', 'TGE205', 'ARTDES', sSQL, 'ARTDES');
   End
   Else
      edtARTDES.Clear;
  {por defecto toma el código de la UNMID General para mostrarlo }
  //dblcUNMID.Text:=DMALM.cdsArti.FieldByName('UNMIDG').AsString;
  //DMALM.cdsDReqs.FieldByName('UNMIDG').AsString:=DMALM.cdsArti.FieldByName('UNMIDG').AsString;
  //DMALM.cdsDReqs.FieldByName('RQSFLAGUM').AsString := 'G';
   dbcbFLAG.Text := 'G';
   dblcUNMID.Text := DMALM.cdsArti.FieldByName('UNMIDG').AsString;
   sSQL := 'UNMID=' + '''' + DMALM.cdsArti.FieldByName('UNMIDG').AsString + '''';
   edtUMedReq.Text := DMALM.displaydescrip('prvSQL', 'TGE130', 'UNMDES', sSQL, 'UNMDES');
   If DMALM.cdsArti.FieldByName('ARTCONT').AsString = '1' Then
   Begin
      dbcbFLAG.Enabled := false;
      dblcUNMID.Enabled := false;
   End
   Else
   Begin
      dbcbFLAG.Enabled := true;
      dblcUNMID.Enabled := False;
   End;
   dbeCNTS.SetFocus;
End;

Procedure TFRegReqs.dbcbFLAGExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'ARTID=' + '''' + dbcldArti.Text + '''';
   If dbcbFLAG.Text = 'G' Then
   Begin
      dblcUNMID.Text := DMALM.displaydescrip('prvSQL', 'TGE205', 'UNMIDG', sSQL, 'UNMIDG');
   End
   Else
      If dbcbFLAG.Text = 'U' Then
      Begin
         dblcUNMID.Text := DMALM.displaydescrip('prvSQL', 'TGE205', 'UNMIDU', sSQL, 'UNMIDU');
      End;
   sSQL := 'UNMID=' + '''' + dblcUNMID.Text + '''';
   edtUMedReq.Text := DMALM.displaydescrip('prvSQL', 'TGE130', 'UNMDES', sSQL, 'UNMDES');

 {if length(dblcUNMID.Text) > 0 then
   dbeCNTS.SetFocus
  else
   dblcUNMID.SetFocus;}
End;

Procedure TFRegReqs.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If Self.ActiveControl Is TMemo Then Exit;
      If self.ActiveControl Is TDBMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRegReqs.Z2bbtnPrintClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   If DMALM.cdscia.FieldByName('CIASUGRQ').AsString = 'S' Then
   Begin
      pprOCPE.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\Requisicion.rtm';
      pprOCPE.Template.LoadFromFile;
   End
   Else
   Begin
      pprOCPE.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\Requisicion.rtm';
      pprOCPE.Template.LoadFromFile;
   End;
 //pprOCPE.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\Requisicion.Rtm';
 //pprOCPE.Template.LoadFromFile;
   ppReportRQS(DMALM.cdsReqs.FieldByName('CIAID').AsString,
      DMALM.cdsReqs.FieldByName('LOCID').AsString,
      DMALM.cdsReqs.FieldByName('RQSID').AsString);
   ppDBCab.DataSource := DMALM.dsQry;
   ppdbOC.DataSource := DMALM.dsSQL;
   DMALM.cdsSQL.First;
   While Not DMALM.cdsSQL.eof Do
   Begin
  //ConsumoPro(DMALM.cdsSQL.fieldbyname('ARTID').AsString,dblcCIA.text,DMALM.cdsSQL.fieldbyname('UNIDAD').AsString);
      ConsumoTotal(DMALM.cdsSQL.fieldbyname('ARTID').AsString, dblcCIA.text, DMALM.cdsSQL.fieldbyname('UNIDAD').AsString);
      DMALM.cdsSQL.edit;

  //DMALM.cdsSQL.fieldbyname('CONSUMO').value := DMALM.cdsConsumo.fieldbyname('CONSUMO').value;
      DMALM.cdsSQL.fieldbyname('CONSUMO').AsFloat := xTotal;

      DMALM.cdsSQL.next;
   End;
   DMALM.cdsSQL.First;
   Screen.Cursor := crDefault;
   //ppdesigner1.Report:=pprOCPE;
   //ppdesigner1.Show;

   pprOCPE.Print;
   pprOCPE.Stop;
   ppDBCab.DataSource := Nil;
   ppdbOC.DataSource := Nil;
End;

Procedure TFRegReqs.ppReportRQS(sCIA, sLOC, sRQS: String);
Var
   sSQL: String;
Begin
 //sCIA := DMALM.cdsReqs.FieldByName('CIAID').AsString;
 //sLOC := DMALM.cdsReqs.FieldByName('LOCID').AsString;
 //sRQS := DMALM.cdsReqs.FieldByName('RQSID').AsString;
   sSQL := 'SELECT ' +
      'CASE WHEN A.RQSEST=''ANULADO'' OR A.RQSEST=''DEPURADO'' THEN A.RQSEST ELSE NULL END RQSEST, ' +
      'B.CIADES, B.CIARUC, B.CIATLF, B.CIAFAX, B.CIADIRE, A.RQSFREQ, ' +
      'A.RQSOBS, A.RQSID, A.CCOSID, E.CCOSDES, F.USERNOM USUARIO, G.USERNOM VISADO, ' +
      'A.RQSSOLI, A.RQSAUTOR, C.OBRADES, D.PRIODES, H.TIPADQDES ' +
      'FROM LOG308 A, TGE101 B, TGE213 C, TGE155 D, TGE203 E, TGE002 F, TGE002 G, TGE173 H ' +
      'WHERE A.CIAID = ''' + sCIA + ''' ' +
      'AND A.RQSID=''' + sRQS + ''' ' +
      'AND A.LOCID=''' + sLOC + ''' ' +
      'AND A.CIAID=B.CIAID(+) ' +
      'AND A.OBRAID=C.OBRAID(+) ' +
      'AND A.PRIOID=D.PRIOID(+) ' +
      'AND A.CCOSID=E.CCOSID(+) ' +
      'AND A.RQSUSER=F.USERID(+) ' +
      'AND A.RQSVISADOR=G.USERID(+) ' +
      'AND F.MODULOID=' + QuotedStr(DMALM.wModulo) + ' ' +
      'AND A.TIPOADQ=H.TIPOADQ';
   DMALM.cdsQry.DisableControls;
   DMALM.cdsQry.Close;
   DMALM.cdsQry.ProviderName := 'prvLOG';
   DMALM.cdsQry.DataRequest(sSQL);
   DMALM.cdsQry.Open;
   DMALM.cdsQry.EnableControls;
   sSQL := 'SELECT ';
   sSQL := sSQL + 'DRQSID, A.ARTID, DRQSOBS ARTDES, UM2.UNMABR, 0 AS CONSUMO, ';
   sSQL := sSQL + 'CASE WHEN NVL(A.RQSFLAGUM,''XX'')=''XX'' THEN ''G'' ELSE A.RQSFLAGUM END AS UNIDAD, ';
   sSQL := sSQL + 'CASE WHEN NVL(DRQSCNSU,0) = 0 THEN  DRQSCNSG ELSE  DRQSCNSU END AS CANTIDA, ';
   sSQL := sSQL + 'CASE WHEN NVL(UM3.ARTMNTG,0)= 0 THEN 0 ELSE NVL(UM3.ARTMNTG,0) / NVL(DRQSCNSG,0)  END AS MONTOG, ';
   sSQL := sSQL + 'CASE WHEN NVL(UM3.ARTMNTU,0)= 0 THEN 0 ELSE NVL(UM3.ARTMNTU,0) / NVL(DRQSCNSU,0) END  AS MONTOU ';
   sSQL := sSQL + 'FROM LOG309 A, TGE130 UM2, TGE130 UM1, TGE205 UM3 ';
   sSQL := sSQL + 'WHERE A.CIAID =''' + sCIA + ''' ';
   sSQL := sSQL + 'AND A.LOCID  =''' + sLOC + ''' ';
   sSQL := sSQL + 'AND A.RQSID  =''' + sRQS + ''' ';
   sSQL := sSQL + 'AND A.UNMIDG = UM2.UNMID(+) ';
   sSQL := sSQL + 'AND A.UNMIDU = UM1.UNMID(+) ';
   sSQL := sSQL + 'AND A.ARTID  = UM3.ARTID(+) ';
   sSQL := sSQL + 'AND A.CIAID  = UM3.CIAID(+) ';
   sSQL := sSQL + 'AND A.TINID  = UM3.TINID(+) ';
   sSQL := sSQL + 'ORDER BY A.CIAID, A.LOCID, A.RQSID, A.DRQSID';
   DMALM.cdsSQL.DisableControls;
   DMALM.cdsSQL.Close;
   DMALM.cdsSQL.DataRequest(sSQL);
   DMALM.cdsSQL.Open;
   DMALM.cdsSQL.EnableControls;
End;

Procedure TFRegReqs.dblcPRIOExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'PRIOID=' + QuotedStr(dblcPRIO.Text);
   dbePrior.Text := DMALM.DisplayDescrip('prvSQL', 'TGE155', 'PRIODES', sSQL, 'PRIODES');
End;

Procedure TFRegReqs.pprOCPEPreviewFormCreate(Sender: TObject);
Begin
   pprOCPE.PreviewForm.ClientHeight := 500;
   pprOCPE.PreviewForm.ClientWidth := 650;
   tppviewer(pprOCPE.PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFRegReqs.ConsumoPro(pArtid, pCiaId, pUnidad: String);
Var
   anio, mes, dia: Word;
   xDife, xMes, xMesAnt, xAniAnt: Integer;
   xI: integer;
   xsql: String;
Begin
   DecodeDate(dbdtpFReqs.Date, anio, mes, Dia);
   xMesant := 0;
   xAniant := 0;
   xsql := '';
   xDife := Mes - wConsumo;
   If xDife < 0 Then
   Begin
      xAniant := anio - 1;
      xMesant := 13 + xDife;
   End;
   xsql := 'SELECT * FROM LOG316 WHERE CIAID=' + quotedstr(pCiaId) + ' AND ARTID=' + quotedstr(pArtid);
   DMALM.cdsQry6.Close;
   DMALM.cdsQry6.DataRequest(xsql);
   DMALM.cdsQry6.open;
   DMALM.cdsQry6.IndexFieldNames := 'STKANO';
   xTotal := 0;
 // cuando se retrocede un año
   If xAniant <> 0 Then
   Begin
      DMALM.cdsQry6.SetKey;
      DMALM.cdsQry6.FieldByName('STKANO').AsString := FloatToStr(xAniAnt);
      If DMALM.cdsQry6.GotoKey Then
      Begin
         For xI := xMesant To 12 Do
         Begin
            xTotal := xTotal + DMALM.cdsQry6.FieldByName('STKSS' + pUnidad + DMALM.strzero(IntToStr(Xi), 2)).AsFloat;
         End;
      End;
   End;
  //** para el año actual
   DMALM.cdsQry6.SetKey;
   DMALM.cdsQry6.FieldByName('STKANO').AsString := FloatToStr(Anio);
   If DMALM.cdsQry6.GotoKey Then
   Begin
      If xDife <= 0 Then
         xMes := 1
      Else
         xMes := Mes - xDife;
      For xI := xMes To Mes Do
      Begin
         xTotal := xTotal + DMALM.cdsQry6.FieldByName('STKSS' + pUnidad + DMALM.strzero(IntToStr(Xi), 2)).AsFloat;
      End;
   End;
   xTotal := xTotal / wConsumo;
//**
End;

Procedure TFRegReqs.dblcTipPreExit(Sender: TObject);
Begin
   If Length(dblcTipPre.Text) = 0 Then
   Begin
      Raise exception.Create('Falta Tipo de Presupuesto');
      Exit;
   End;
   dbeTipPre.text := DMALM.DisplayDescrip('prvTGE', 'PPRES101', 'TIPPRESDES', 'TIPPRESID=' + quotedstr(dblcTipPre.text), 'TIPPRESDES');
End;

Procedure TFRegReqs.dblcdPresupExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'PARPRESID=' + quotedstr(dblcdPresup.Text) + ' AND CIAID=''' + dblcCIA.Text + '''';
   edtPresup.Text := DMALM.DisplayDescrip('PPRES201', 'PPRES201', 'PARPRESDES', xSQL, 'PARPRESDES');
   If Length(edtPresup.text) = 0 Then
   Begin
      Raise exception.Create('Falta Partida Presupuestal');
      dblcdPresup.SetFocus;
   End;
End;

Procedure TFRegReqs.dbeNumRqsKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In [' ', 'a'..'z',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '.', '-', '_'] Then
      Key := #0;
End;

Procedure TFRegReqs.ConsumoTotal(pArtid, pCiaId, pUnidad: String);
Var
   sSQL: String;
   anio, mes, dia: word;
Begin
   DecodeDate(dbdtpFReqs.Date, anio, mes, Dia);

   sSQL := ' SELECT SUM(B.KDXCNTG) TOTAL ' +
      ' FROM LOG314 A, LOG315 B' +
      ' WHERE A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.TINID=B.TINID AND A.ALMID=B.ALMID' +
      ' AND A.NISATIP=B.NISATIP AND A.NISAID=B.NISAID AND A.TDAID=B.TDAID AND A.TRIID=B.TRIID' +
      ' AND A.CIAID=' + QuotedStr(pCiaId) + ' AND A.NISATIP=''SALIDA'' AND B.ARTID=' + QuotedStr(pArtid) +
      ' AND A.CCOSID=' + QuotedStr(dblcdCCos.text) + ' AND A.NISSIT=''ACEPTADO'' ' +
      ' AND A.NISAFREG>=' + QuotedStr('01/01/' + IntToStr(anio)) + ' AND A.NISAFREG<=' + QuotedStr(DateToStr(dbdtpFReqs.Date));

   DMALM.cdsQry6.Close;
   DMALM.cdsQry6.DataRequest(sSql);
   DMALM.cdsQry6.open;
   xTotal := DMALM.cdsQry6.FieldByName('TOTAL').AsFloat;
End;

Procedure TFRegReqs.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
   FiltraTabla(DMALM.cdsCia, 'TGE101', 'CIAID', '');
End;

Initialization
   registerclasses([TLabel])
End.

