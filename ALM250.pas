Unit ALM250;
// HPC_201602_ALM 30/04/2016: Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, ComCtrls, Mask, wwdbedit, wwdblook, DBCtrls, Grids,
   Wwdbigrd, Wwdbgrid, Buttons, DB, wwdbdatetimepicker, ppCache, ppDB,
   ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCtrls,
   ppPrnabl, ppVar, ppViewr, ppTypes, MsgDlgs;

Type
   TFMaesProv = Class(TForm)
      ppReporte: TppReport;
      ppdbReporte: TppDBPipeline;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLine1: TppLine;
      ppSystemVariable1: TppSystemVariable;
      ppLabel6: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc1: TppDBCalc;
      ppLabel2: TppLabel;
      ppLine2: TppLine;
      Panel1: TPanel;
      pcMaestro: TPageControl;
      tbshMaestro: TTabSheet;
      Panel3: TPanel;
      Label4: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      Label18: TLabel;
      Label21: TLabel;
      Label22: TLabel;
      Label23: TLabel;
      Label25: TLabel;
      Label26: TLabel;
      Label27: TLabel;
      Label28: TLabel;
      Label29: TLabel;
      Label3: TLabel;
      Label5: TLabel;
      Label1: TLabel;
      Label9: TLabel;
      Label12: TLabel;
      Label16: TLabel;
      Label17: TLabel;
      Label19: TLabel;
      Label20: TLabel;
      Label24: TLabel;
      Label30: TLabel;
      Label40: TLabel;
      Label41: TLabel;
      Label44: TLabel;
      dbeProv: TwwDBEdit;
      dbeRazSoc: TwwDBEdit;
      dbeAbr: TwwDBEdit;
      dbeTelef: TwwDBEdit;
      dbeFax: TwwDBEdit;
      dbeMail: TwwDBEdit;
      dbeRuc: TwwDBEdit;
      dbeDirCom: TwwDBEdit;
      dbeGirador: TwwDBEdit;
      dbeRepre: TwwDBEdit;
      dblcPais: TwwDBLookupCombo;
      dblcDeparta: TwwDBLookupCombo;
      dblcProvinc: TwwDBLookupCombo;
      dblcDistrito: TwwDBLookupCombo;
      dbeMax: TwwDBEdit;
      dbeMin: TwwDBEdit;
      dblcSecEco: TwwDBLookupCombo;
      Z2bbtnOK: TBitBtn;
      Z2bbtnCancel: TBitBtn;
      dbeLugPag: TwwDBEdit;
      dblcClAux: TwwDBLookupCombo;
      dblcGiro: TwwDBLookupCombo;
      dblcClasif: TwwDBLookupCombo;
      Z2bbtnNuevo: TBitBtn;
      dbeClAux: TEdit;
      dbeGiro: TEdit;
      dbeClasif: TEdit;
      dbeSecEco: TEdit;
      dbePais: TEdit;
      dbeDeparta: TEdit;
      dbeProvinc: TEdit;
      dbeDistrito: TEdit;
      dbeDNI: TwwDBEdit;
      dblctipper: TwwDBLookupCombo;
      dbetipper: TEdit;
      dbenombres: TwwDBEdit;
      dbeapepat: TwwDBEdit;
      dbeapemat: TwwDBEdit;
      wwDBEdit1: TwwDBEdit;
      Z2bbtnPrint: TBitBtn;
      dbeNomCom: TwwDBEdit;
      dbesnombres: TwwDBEdit;
      dblcProced: TwwDBLookupCombo;
      edtProced: TEdit;
      TabSheet2: TTabSheet;
      Label32: TLabel;
      dbgMiembros: TwwDBGrid;
      wwDBGrid2IButton: TwwIButton;
      pnlMiembros: TPanel;
      Label31: TLabel;
      Label33: TLabel;
      Label34: TLabel;
      Label35: TLabel;
      Label36: TLabel;
      Label37: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      dbeMiembro: TwwDBEdit;
      dbeNombre: TwwDBEdit;
      dblcOcupac: TwwDBLookupCombo;
      dbeOcupac: TwwDBEdit;
      wwDBEdit11: TwwDBEdit;
      wwDBEdit16: TwwDBEdit;
      wwDBEdit20: TwwDBEdit;
      Z2bbtnCancel2: TBitBtn;
      Z2bbtnOK2: TBitBtn;
      wwDBDateTimePicker1: TwwDBDateTimePicker;
      tbshTipProv: TTabSheet;
      dbgTipProv: TwwDBGrid;
      wwDBGrid1IButton: TwwIButton;
      pnlTipProv: TPanel;
      DBText1: TDBText;
      DBText2: TDBText;
      lblTipprov: TLabel;
      Label2: TLabel;
      Label6: TLabel;
      Label15: TLabel;
      Panel5: TPanel;
      Z2bbtnOKTP: TBitBtn;
      Z2bbtnCancelTP: TBitBtn;
      Z2bbtnNuevoTP: TBitBtn;
      dblcTipProv: TwwDBLookupCombo;
      tbshLinea: TTabSheet;
      dbgProvLinea: TwwDBGrid;
      dbgBbtnLinea: TwwIButton;
      pnlProvLinea: TPanel;
      DBText3: TDBText;
      DBText4: TDBText;
      Label42: TLabel;
      Label43: TLabel;
      lblGrArtID: TLabel;
      lblLineaDesc: TLabel;
      Panel6: TPanel;
      BitBtn1: TBitBtn;
      BitBtn2: TBitBtn;
      BitBtn3: TBitBtn;
      dblcGrpArti: TwwDBLookupCombo;
      Procedure wwDBGrid2IButtonClick(Sender: TObject);
      Procedure dbgMiembrosDblClick(Sender: TObject);
      Procedure Z2bbtnCancel2Click(Sender: TObject);
      Procedure Z2bbtnOK2Click(Sender: TObject);
      Procedure Regresa2;
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Z2bbtnCancelClick(Sender: TObject);
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure dblcOcupacChange(Sender: TObject);
      Procedure dblcOcupacExit(Sender: TObject);
      Procedure dbeMiembroExit(Sender: TObject);
      Procedure dbeProvExit(Sender: TObject);
      Procedure dblcGiroExit(Sender: TObject);
      Procedure dblcClasifExit(Sender: TObject);
      Procedure dblcPaisExit(Sender: TObject);
      Procedure dblcDepartaExit(Sender: TObject);
      Procedure dblcProvincExit(Sender: TObject);
      Procedure dblcDistritoExit(Sender: TObject);
      Procedure dblcSecEcoExit(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure dblcClAuxExit(Sender: TObject);
      Procedure wwDBGrid1IButtonClick(Sender: TObject);
      Procedure dbgTipProvDblClick(Sender: TObject);
      Procedure Z2bbtnCancelTPClick(Sender: TObject);
      Procedure Z2bbtnOKTPClick(Sender: TObject);
      Procedure dblcTipProvExit(Sender: TObject);
      Procedure pcMaestroEnter(Sender: TObject);
      Procedure dbeRazSocExit(Sender: TObject);
      Procedure dbeRucExit(Sender: TObject);
      Procedure dblctipperExit(Sender: TObject);

      Procedure dbenombresExit(Sender: TObject);
      Procedure dbeapepatExit(Sender: TObject);
      Procedure dbeapematExit(Sender: TObject);
      Procedure Z2bbtnPrintClick(Sender: TObject);
      Procedure ppReportePreviewFormCreate(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure dblcGrpArtiExit(Sender: TObject);
      Procedure dbgBbtnLineaClick(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure dbgTipProvKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgProvLineaKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgProvLineaDblClick(Sender: TObject);
      Procedure dbesnombresExit(Sender: TObject);
      Procedure dblcProcedExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
   Private
    { Private declarations }
      wModif: String;
   Public
    { Public declarations }
      xFlagRuc: String;
      Procedure RegistroNuevo;
   End;

Var
   FMaesProv: TFMaesProv;

Implementation

{$R *.DFM}

Uses ALMDM1, oaIN2000;

Procedure TFMaesProv.RegistroNuevo;
Begin
   dbePais.Text := '';
   dbeDeparta.Text := '';
   ;
   dbeProvinc.Text := '';
   dbeDistrito.Text := '';
   dbeGiro.Text := '';
   dbeClasif.Text := '';
   dbeSecEco.Text := '';
   dbeTipPer.Text := '';
   DMALM.cdsProv.Insert;
  {
  if DMALM.wAnchoProv = 0 then
   DMALM.cdsProv.FieldByName('PROV').AsString := StrZero(DMALM.MaxProv(DMALM.cdsProv.FieldByName('CLAUXID').AsString),DMALM.wAnchoProv);
  }
   wModif := 'N';
   dblcClAux.Enabled := True;
   dbeProv.Enabled := True;
   dblcClAux.SetFocus;
End;

Procedure TFMaesProv.wwDBGrid2IButtonClick(Sender: TObject);
Begin
   If (DMALM.wModo = 'A') And (length(dbeProv.Text) = 0) Then
      Raise Exception.Create(' Proovedor no Registrado ');
   pnlMiembros.Visible := True;
   dbgMiembros.Enabled := False;

   dbeMiembro.Text := '';
   dbeMiembro.Setfocus;
End;

Procedure TFMaesProv.dbgMiembrosDblClick(Sender: TObject);
Begin
   //if DMALM.cdsMiemEmpre.RecordCount=0 Then Exit;

   pnlMiembros.Visible := True;
   pnlMiembros.SetFocus;
   dbgMiembros.Enabled := False;
   dbeMiembro.Enabled := False;
   //DMALM.cdsMiemEmpre.Edit;
End;

Procedure TFMaesProv.Z2bbtnCancel2Click(Sender: TObject);
Begin
   //if DMALM.cdsMiemEmpre.State=dsInsert then DMALM.cdsMiemEmpre.Delete;
   Regresa2;
End;

Procedure TFMaesProv.Z2bbtnOK2Click(Sender: TObject);
Var
   xWhere, xMiembro: String;
Begin
   xWhere := 'PROV=' + '''' + dbeProv.Text + '''' + ' AND MIEMID = ' + '''' + dbeMiembro.Text + '''';
//   xMiembro:=BuscaQry('prvTGE','TGE210','*',xWhere,'MIEMID');
   If (DMALM.wModo = 'A') And (xMiembro = dbeMiembro.Text) Then
      Raise Exception.Create(' Miembro ya Registrado ');

   If length(dbeNombre.Text) = 0 Then
      Raise Exception.Create(' Nombre no Registrado ');

   Screen.Cursor := crHourGlass;

   //DMALM.cdsMiemEmpre.ApplyUpdates(0);
   Regresa2;

   Screen.Cursor := crDefault;
End;

Procedure TFMaesProv.Regresa2;
Begin
   dbgMiembros.Enabled := True;
   pnlMiembros.Visible := False;
   dbeMiembro.Enabled := True;
   dbgMiembros.Setfocus;
End;

Procedure TFMaesProv.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   pcMaestro.ActivePageIndex := 0;
   DMALM.cdsprov.CancelUpdates;
   DMALM.cdsTipProv.Close;
   DMALM.cdsQry6.Close;
   DMALM.cdsQry6.MasterSource := Nil;
   DMALM.cdsQry6.MasterFields := '';
   DMALM.cdsQry6.IndexFieldNames := '';
   {FVariables.w_IN_Registro := False;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas-1;}
   If DMALM.wTipoAdicion = 'xFiltro' Then
   Begin
      DMALM.ActualizaFiltro(Mtx2000, DMALM.cdsprov, DMALM.wModo);
   End;
   Action := CAFree;
End;

Procedure TFMaesProv.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   End;
End;

Procedure TFMaesProv.Z2bbtnCancelClick(Sender: TObject);
Begin
   If DMALM.cdsProv.State = dsInsert Then
      DMALM.cdsprov.Cancel;
   //DMALM.cdsprov.CancelUpdates;
   //DMALM.cdsProv.Delete;
   Close;
End;

Procedure TFMaesProv.Z2bbtnOKClick(Sender: TObject);
Var
   xWhere, xProve, SQLFiltro, xSQL: String;
Begin
   If (DMALM.wModo = 'A') And (dblcClAux.Enabled) Then
   Begin
      xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' and PROV=''' + dbeProv.Text + '''';
//    xProve:=BuscaQry('prvTGE','TGE201','*',xWhere,'PROV');
      If xProve = dbeProv.Text Then
         Raise Exception.Create('Proveedor ya Registrado ');
      dblcClAux.Enabled := False;
      dbeProv.Enabled := False;
   End;

   Screen.Cursor := crHourGlass;

  // Actualiza Flag de Retención IGV
  //JCC 26/06/2002

   xSQL := 'Select RUC from CXP203 where RUC=' + quotedstr(DMALM.cdsProv.fieldbyname('PROVRUC').AsString);
   DMALM.cdsQry2.Close;

   DMALM.cdsQry2.Filter := '';
   DMALM.cdsQry2.IndexFieldNames := '';
   DMALM.cdsQry2.DataRequest(xSQL);
   DMALM.cdsQry2.Open;
   If DMALM.cdsQry2.RecordCount > 0 Then
      DMALM.cdsProv.fieldbyname('PROVRETIGV').AsString := 'N'
   Else
      DMALM.cdsProv.fieldbyname('PROVRETIGV').AsString := 'S';
   DMALM.cdsQry2.Close;
   DMALM.cdsQry2.Filter := '';
   DMALM.cdsQry2.IndexFieldNames := '';

   SQLFiltro := 'SELECT * FROM  TGE201 WHERE '
      + ' CLAUXID  =''' + dblcClAux.Text + ''' and '
      + ' PROV =''' + dbeProv.Text + ''' ';
   DMALM.cdsProv.DataRequest(SQLFiltro);

   DMALM.cdsProv.ApplyUpdates(0);
  //DMALM.ControlTran;
  //DMALM.AplicaDatos(DMALM.cdsProv, 'PROV' );

//  DMALM.GrabaAuxConta( DMALM.cdsProv );

   Screen.Cursor := crDefault;
   ShowMessage('Grabación Exitosa');

   If DMALM.wModo = 'A' Then
      Z2bbtnNuevo.Enabled := True;
End;

Procedure TFMaesProv.dblcOcupacChange(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'OCUPID = ' + '''' + dblcOcupac.Text + '''';
//   dbeOcupac.Text:=BuscaQry('prvTGE','RRHH101','*',xWhere,'OCUPDES');
End;

Procedure TFMaesProv.dblcOcupacExit(Sender: TObject);
Begin
   If length(dbeOcupac.Text) = 0 Then
   Begin
      ShowMessage('Falta Ocupación');
      dblcOcupac.SetFocus;
   End;
End;

Procedure TFMaesProv.dbeMiembroExit(Sender: TObject);
Begin
   If length(dbeMiembro.Text) = 0 Then
   Begin
      ShowMessage('Falta Miembro');
      dbeMiembro.SetFocus;
   End;
End;

Procedure TFMaesProv.dbeProvExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If length(Trim(dbeProv.Text)) = 0 Then
   Begin
      ShowMessage('Falta Provedor');
      dbeProv.SetFocus;
      Exit;
   End;
   //** 06/06/2001 - pjsv, se setea el ancho con la variable wAnchoProv el DMALM, antes estaba a 8
   {
  if DMALM.wAnchoProv = 0 then
  begin
   Exit;
  end;
  }
//	DMALM.cdsprov.FieldByName('PROV').AsString:=StrZero(Trim(dbeProv.Text),DMALM.wAnchoProv);
   //**
   xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' and PROV=''' + dbeProv.Text + '''';
   BuscaQry('prvTGE', 'TGE201', 'PROV', xWhere, 'PROV');
   If DMALM.cdsQry.RecordCount > 0 Then
   Begin
      If Question('Confirmar', ' Proveedor ya Existe ' + #13 + #13 +
         ' Desea adicionar el Código Automaticamente ') Then
      Begin
      //** 06/06/2001 - pjsv, se setea el ancho con la variable wAnchoProv el DMALM, antes estaba a 8
//      DMALM.cdsProv.FieldByName('PROV').AsString := DMALM.StrZero(DMALM.MaxProv(DMALM.cdsProv.FieldByName('CLAUXID').AsString),DMALM.wAnchoProv);
      //**
         dbeRazSoc.SetFocus;
      End
      Else
         dbeProv.SetFocus;
   End;
End;

Procedure TFMaesProv.dblcGiroExit(Sender: TObject);
Var
   xWhere: String;
Begin
 //   if Length( dblcGiro.Text )=0 then Exit;
   xWhere := 'GIROID=''' + dblcGiro.Text + '''';
   dbeGiro.Text := BuscaQry('prvTGE', 'TGE116', '*', xWhere, 'GIRODES');
End;

Procedure TFMaesProv.dblcClasifExit(Sender: TObject);
Var
   xWhere: String;
Begin
//   if Length( dblcClasif.Text )=0 then Exit;
   xWhere := 'CLASIFID=''' + dblcClasif.Text + '''';
   dbeClasif.Text := BuscaQry('prvTGE', 'TGE132', '*', xWhere, 'CLASIFDES');
End;

Procedure TFMaesProv.dblcPaisExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If length(dblcPais.Text) = 0 Then exit;
   xWhere := 'PAISID = ' + '''' + dblcPais.Text + '''';
   dbePais.Text := DMALM.DisplayDescrip('prvTGE', 'TGE118', '*', xWhere, 'PAISDES');
   If Length(dbePais.Text) = 0 Then
   Begin
      ShowMessage('Código de País No Existe');
      dblcPais.Text := '';
      dblcPais.SetFocus;
      exit;
   End;

   If DMALM.cdsQry.FieldByName('FNACIONAL').AsString <> 'S' Then
   Begin
      dblcDeparta.Enabled := False;
      dblcProvinc.Enabled := False;
      dblcDistrito.Enabled := False;
      DMALM.cdsProv.FieldByName('DPTOID').AsString := '';
      DMALM.cdsProv.FieldByName('CIUDID').AsString := '';
      DMALM.cdsProv.FieldByName('CLIECZIP').AsString := '';
      dbeDeparta.Text := '';
      dbeProvinc.Text := '';
      dbeDistrito.Text := '';
   End
   Else
   Begin
      dblcDeparta.Enabled := True;
      dblcProvinc.Enabled := True;
      dblcDistrito.Enabled := True;
   End;
End;

Procedure TFMaesProv.dblcDepartaExit(Sender: TObject);
Begin
   If length(dblcDeparta.Text) = 0 Then exit;

   DMALM.cdsDpto.SetKey;
   DMALM.cdsDpto.FieldByName('DPTOID').AsString := dblcDeparta.Text;
   If Not DMALM.cdsDpto.GotoKey Then
   Begin
      ShowMessage('Código de Departamento No Existe');
      dblcDeparta.Text := '';
      dblcDeparta.SetFocus;
      exit;
   End;
   dbeDeparta.Text := DMALM.cdsDpto.FieldByName('DPTODES').AsString;
   DMALM.cdsProvinc.Filter := 'DPTOID=' + quotedstr(dblcDeparta.Text);
   DMALM.cdsProvinc.Filtered := True;
   DMALM.cdsProvinc.First;
End;

Procedure TFMaesProv.dblcProvincExit(Sender: TObject);
Begin
   If length(dblcProvinc.Text) = 0 Then exit;

   DMALM.cdsProvinc.SetKey;
   DMALM.cdsProvinc.FieldByName('CIUDID').AsString := dblcProvinc.Text;
   If Not DMALM.cdsProvinc.GotoKey Then
   Begin
      ShowMessage('Código de Provincia No Existe');
      dblcProvinc.Text := '';
      dblcProvinc.SetFocus;
      exit;
   End;
   dbeProvinc.Text := DMALM.cdsProvinc.FieldByName('CIUDDES').AsString;

   DMALM.cdsDistrito.Filter := 'DPTOID=' + quotedstr(dblcDeparta.Text)
      + ' and CIUDID=' + quotedstr(dblcProvinc.Text);
   DMALM.cdsDistrito.Filtered := True;
   DMALM.cdsDistrito.First;
End;

Procedure TFMaesProv.dblcDistritoExit(Sender: TObject);
Begin
   If length(dblcDistrito.Text) = 0 Then exit;

   DMALM.cdsDistrito.SetKey;
   DMALM.cdsDistrito.FieldByName('ZIPID').AsString := dblcDistrito.Text;
   If Not DMALM.cdsDistrito.GotoKey Then
   Begin
      ShowMessage('Código de Distrito No Existe');
      dblcDistrito.Text := '';
      dblcDistrito.SetFocus;
      exit;
   End;
   dbeDistrito.Text := DMALM.cdsDistrito.FieldByName('ZIPDES').AsString;

End;

Procedure TFMaesProv.dblcSecEcoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'SECECOID = ' + '''' + dblcSecEco.Text + '''';
   dbeSecEco.Text := BuscaQry('prvTGE', 'TGE163', '*', xWhere, 'SECECODES');
End;

Procedure TFMaesProv.Z2bbtnNuevoClick(Sender: TObject);
Begin
//   DMALM.Filtracds( DMALM.cdsProv,'Select * from TGE201 Where PROV=''''' );
   RegistroNuevo;
   Z2bbtnNuevo.Enabled := False;
End;

Procedure TFMaesProv.dblcClAuxExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Z2bbtnCancel.Focused Then exit;
   If length(dblcClAux.Text) = 0 Then
   Begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Clase Auxiliar');
   End;
   xWhere := 'CLAUXID = ' + '''' + dblcClAux.Text + '''';
   dbeClAux.Text := BuscaQry('prvTGE', 'TGE102', '*', xWhere, 'CLAUXDES');
   xFlagRuc := DMALM.cdsQry.FieldByName('CLAUXRUC').AsString;
End;

Procedure TFMaesProv.wwDBGrid1IButtonClick(Sender: TObject);
Begin
   If DMALM.cdsProv.FieldByName('CLAUXID').AsString = '' Then
   Begin
      ErrorMsg(Caption, 'Inserte Datos Principales del Proveedor');
      exit;
   End;
   lblTipprov.Caption := '';
   pnlTipProv.Visible := True;

   DMALM.cdsQry6.Insert;
   DMALM.cdsQry6.FieldByName('CLAUXID').AsString := dblcClAux.Text;
   DMALM.cdsQry6.FieldByName('CLAUXDES').AsString := dbeClAux.Text;
   DMALM.cdsQry6.FieldByName('PROV').AsString := dbeProv.Text;
   DMALM.cdsQry6.FieldByName('PROVDES').AsString := dbeRazSoc.Text;
End;

Procedure TFMaesProv.dbgTipProvDblClick(Sender: TObject);
Begin
   If Length(Trim(dblcTipProv.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'El Tipo de Proveedor no Puede Estar en Blanco');
      Exit;
   End;
   lblTipprov.Caption := '';
   DMALM.cdsQry6.Edit;
  //DMALM.cdsMTipProv.FieldByName('CLAUXID').AsString:=dblcClAux.Text;
   DMALM.cdsQry6.FieldByName('CLAUXDES').AsString := dbeClAux.Text;
  //DMALM.cdsMTipProv.FieldByName('PROV').AsString:=dbeProv.Text;
   DMALM.cdsQry6.FieldByName('PROVDES').AsString := dbeRazSoc.Text;
   lblTipprov.Caption := DMALM.cdsQry6.FieldByName('TIPPROVDES').AsString;
   pnlTipProv.Visible := True;
End;

Procedure TFMaesProv.Z2bbtnCancelTPClick(Sender: TObject);
Begin
   DMALM.cdsQry6.Cancel;
   pnlTipProv.Visible := False;
End;

Procedure TFMaesProv.Z2bbtnOKTPClick(Sender: TObject);
Begin
   If Length(Trim(dblcTipProv.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'El Tipo de Proveedor no Puede Estar en Blanco');
      Exit;
   End;
   DMALM.cdsQry6.FieldByName('TIPPROVDES').AsString := lblTipprov.Caption;
   DMALM.AplicaDatos(DMALM.cdsQry6, 'MTIPPROV');

   pnlTipProv.Visible := False;
End;

Procedure TFMaesProv.dblcTipProvExit(Sender: TObject);
Begin
   lblTipprov.Caption := DMALM.DisplayDescrip('prvSQL', 'TGE134', 'TIPPROVDES', 'TIPPROVID=' + quotedStr(dblcTipProv.text), 'TIPPROVDES');
End;

Procedure TFMaesProv.pcMaestroEnter(Sender: TObject);
Begin
   If pcMaestro.ActivePage = tbshMaestro Then
      DMALM.cdsQry6.Cancel;
End;

Procedure TFMaesProv.dbeRazSocExit(Sender: TObject);
Begin
   If DMALM.wModo = 'A' Then
   Begin
      DMALM.cdsprov.edit;
      DMALM.cdsprov.fieldByName('PROVGIRA').AsString := dbeRazSoc.Text;
      dbeGirador.Text := DMALM.CDSPROV.FieldByName('PROVGIRA').AsString;

      DMALM.cdsprov.fieldByName('PROVNOMCOM').AsString := dbeRazSoc.Text;
      dbeNomCom.Text := DMALM.CDSPROV.FieldByName('PROVNOMCOM').AsString;
   End;
End;

Procedure TFMaesProv.dbeRucExit(Sender: TObject);
Var
   xWhere: String;
   xMsg: String;
Begin
  //xWhere:='CLAUXID='''+dblcClAux.Text+''' and PROV='''+dbeProv.Text+'''';
   xWhere := 'PROVRUC=' + quotedstr(dbeRuc.Text) + ' AND PROV<>' + quotedstr(dbeprov.text); // +' AND CLAUXID='''+dblcClAux.Text+'''';
   BuscaQry('prvTGE', 'TGE201', 'PROVRUC,PROV,PROVDES', xWhere, 'PROV');
   If DMALM.cdsQry.RecordCount > 0 Then
   Begin
      xMsg := '';
      While Not DMALM.cdsQry.Eof Do
      Begin
         xMsg := xMsg + 'Proveedor: ' + DMALM.cdsQry.FieldByName('PROV').AsString + '  '
            + Trim(DMALM.cdsQry.FieldByName('PROVDES').AsString) + #13 + #13;
         DMALM.cdsQry.Next;
      End;
  //dbeDNI.SetFocus;
      dbeRuc.SetFocus;
      ShowMessage('            R.U.C. ya Fue Registrado       ' + #13 + #13 + xMsg)
   End;
End;

Procedure TFMaesProv.dblctipperExit(Sender: TObject);
Var
   cad, xWhere: String;
Begin
   If Z2bbtnCancel.Focused Then exit;
   If length(dblctipper.Text) = 0 Then
   Begin
      dblctipper.SetFocus;
      Raise Exception.Create('Falta Tipo de Persona');
   End;
   xWhere := 'TIPPERID=''' + dblcTipPer.Text + '''';
   dbeTipPer.Text := BuscaQry('prvTGE', 'TGE109', '*', xWhere, 'TIPPERDES');

   If DMALM.cdsQry.fieldbyname('TIPPERS').AsString = 'S' Then //Persona Natural
   Begin
      cad := '';
      If length(trim(dbeapepat.text)) > 0 Then
         cad := cad + trim(dbeapepat.text);
      If length(trim(dbeapemat.text)) > 0 Then
         cad := cad + ' ' + trim(dbeapemat.text);
      If length(trim(dbenombres.text)) > 0 Then
         cad := cad + ' ' + trim(dbenombres.text);
      If length(trim(dbesnombres.text)) > 0 Then
         cad := cad + ' ' + trim(dbesnombres.text);

      DMALM.cdsProv.fieldbyname('PROVDES').AsString := cad;
      DMALM.cdsProv.fieldbyname('PROVABR').AsString := '';
      dbenombres.enabled := true;
      dbeapepat.enabled := true;
      dbeapemat.enabled := true;
      dberazsoc.enabled := false;
      dbeabr.enabled := false;
   End
   Else
   Begin
      DMALM.cdsProv.fieldbyname('PROVNOMBRE').AsString := '';
      DMALM.cdsProv.fieldbyname('PROVNOMBRE1').AsString := '';
      DMALM.cdsProv.fieldbyname('PROVAPEPAT').AsString := '';
      DMALM.cdsProv.fieldbyname('PROVAPEMAT').AsString := '';
      dbenombres.enabled := false;
      dbeapepat.enabled := false;
      dbeapemat.enabled := false;
      dberazsoc.enabled := true;
      dbeabr.enabled := true;
   End;
End;

Procedure TFMaesProv.dbenombresExit(Sender: TObject);
Var
   cad: String;
Begin
   cad := '';
   If length(trim(dbeapepat.text)) > 0 Then
      cad := cad + trim(dbeapepat.text);
   If length(trim(dbeapemat.text)) > 0 Then
      cad := cad + ' ' + trim(dbeapemat.text);
   If length(trim(dbenombres.text)) > 0 Then
      cad := cad + ' ' + trim(dbenombres.text);
   If length(trim(dbesnombres.text)) > 0 Then
      cad := cad + ' ' + trim(dbesnombres.text);
   DMALM.cdsProv.fieldbyname('PROVDES').AsString := cad;
   DMALM.cdsProv.fieldbyname('PROVNOMCOM').AsString := cad;
  //	DMALM.cdsProv.fieldbyname('PROVDES').AsString:=+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
//	DMALM.cdsProv.fieldbyname('PROVNOMCOM').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);

//	DMALM.cdsProv.fieldbyname('PROVDES').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
//	DMALM.cdsProv.fieldbyname('PROVNOMCOM').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
End;

Procedure TFMaesProv.dbeapepatExit(Sender: TObject);
Var
   cad: String;
Begin
   cad := '';
   If length(trim(dbeapepat.text)) > 0 Then
      cad := cad + trim(dbeapepat.text);
   If length(trim(dbeapemat.text)) > 0 Then
      cad := cad + ' ' + trim(dbeapemat.text);
   If length(trim(dbenombres.text)) > 0 Then
      cad := cad + ' ' + trim(dbenombres.text);
   If length(trim(dbesnombres.text)) > 0 Then
      cad := cad + ' ' + trim(dbesnombres.text);
   DMALM.cdsProv.fieldbyname('PROVDES').AsString := cad;
   DMALM.cdsProv.fieldbyname('PROVNOMCOM').AsString := cad;
  //	DMALM.cdsProv.fieldbyname('PROVDES').AsString:=+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
//	DMALM.cdsProv.fieldbyname('PROVNOMCOM').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
//	DMALM.cdsProv.fieldbyname('PROVDES').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
//	DMALM.cdsProv.fieldbyname('PROVNOMCOM').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
End;

Procedure TFMaesProv.dbeapematExit(Sender: TObject);
Var
   cad: String;
Begin
   cad := '';
   If length(trim(dbeapepat.text)) > 0 Then
      cad := cad + trim(dbeapepat.text);
   If length(trim(dbeapemat.text)) > 0 Then
      cad := cad + ' ' + trim(dbeapemat.text);
   If length(trim(dbenombres.text)) > 0 Then
      cad := cad + ' ' + trim(dbenombres.text);
   If length(trim(dbesnombres.text)) > 0 Then
      cad := cad + ' ' + trim(dbesnombres.text);
   DMALM.cdsProv.fieldbyname('PROVDES').AsString := cad;
   DMALM.cdsProv.fieldbyname('PROVNOMCOM').AsString := cad;
//  DMALM.cdsProv.fieldbyname('PROVDES').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
//	DMALM.cdsProv.fieldbyname('PROVNOMCOM').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
End;

Procedure TFMaesProv.Z2bbtnPrintClick(Sender: TObject);
Var
   sSQL: String;
Begin
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'SELECT A.CLAUXID, A.PROV, A.TIPPROVID, B.TIPPROVDES, C.PROVDES, C.PROVRUC, C.PROVDIR, C.PROVTELF ' +
         'FROM LOG201 A ' +
         'LEFT JOIN TGE134 B ON (A.TIPPROVID = B.TIPPROVID) ' +
         'LEFT JOIN TGE201 C ON (C.CLAUXID = ' + QuotedStr(dblcClAux.Text) + ' AND C.PROV=A.PROV) ' +
         'WHERE A.CLAUXID=' + QuotedStr(dblcClAux.Text) + ' ' +
         'AND A.PROV=' + QuotedStr(dbeProv.Text) + ' ' +
         'ORDER BY TIPPROVID';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'SELECT A.CLAUXID, A.PROV, A.TIPPROVID, B.TIPPROVDES, C.PROVDES, C.PROVRUC,  C.PROVDIR, C.PROVTELF ' +
            'FROM LOG201 A, TGE134 B, TGE201 C ' +
            'WHERE A.CLAUXID=' + QuotedStr(dblcClAux.Text) +
            'AND A.PROV=' + QuotedStr(dbeProv.Text) + ' ' +
            'AND A.TIPPROVID = B.TIPPROVID(+) ' +
            'AND C.CLAUXID = ' + QuotedStr(dblcClAux.Text) + ' ' +
            'AND C.PROV=A.PROV(+) ' +
            'ORDER BY TIPPROVID';
      End;
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Modulo De Compras', 'No Existe Información a Mostrar');
      Exit;
   End;

   ppReporte.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RepTipProv.rtm';
   ppReporte.Template.LoadFromFile;
   ppReporte.Print;
   ppReporte.Stop;
End;

Procedure TFMaesProv.ppReportePreviewFormCreate(Sender: TObject);
Begin
   ppReporte.PreviewForm.ClientHeight := 500;
   ppReporte.PreviewForm.ClientWidth := 650;
   tppviewer(ppReporte.PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFMaesProv.BitBtn1Click(Sender: TObject);
Begin

   If Length(Trim(dblcGrpArti.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'El Grupo de Línea no Puede Estar en Blanco');
      Exit;
   End;
   DMALM.cdsQry5.FieldByName('GRARID').AsString := dblcGrpArti.text;
   DMALM.cdsQry5.FieldByName('GRARDES').AsString := lblLineaDesc.Caption;
   DMALM.AplicaDatos(DMALM.cdsQry5, 'PROVLINEA');

   pnlProvLinea.Visible := False;
End;

Procedure TFMaesProv.dblcGrpArtiExit(Sender: TObject);
Begin
   lblLineaDesc.Caption := DMALM.DisplayDescrip('prvSQL', 'TGE131', 'GRARDES', 'GRARID=' + quotedStr(dblcGrpArti.text), 'GRARDES');
End;

Procedure TFMaesProv.dbgBbtnLineaClick(Sender: TObject);
Begin
   If DMALM.cdsProv.FieldByName('CLAUXID').AsString = '' Then
   Begin
      ErrorMsg(Caption, 'Inserte Datos Principales del Proveedor');
      exit;
   End;

   lblLineaDesc.Caption := '';
   pnlProvLinea.Visible := True;
   DMALM.cdsQry5.Insert;
   DMALM.cdsQry5.FieldByName('CLAUXID').AsString := dblcClAux.Text;
   DMALM.cdsQry5.FieldByName('CLAUXDES').AsString := dbeClAux.Text;
   DMALM.cdsQry5.FieldByName('PROV').AsString := dbeProv.Text;
   DMALM.cdsQry5.FieldByName('PROVDES').AsString := dbeRazSoc.Text;

End;

Procedure TFMaesProv.BitBtn2Click(Sender: TObject);
Begin
   DMALM.cdsQry5.Cancel;
   pnlProvLinea.Visible := False;

End;

Procedure TFMaesProv.dbgTipProvKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg(' ¿ Eliminar Registro ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMALM.cdsQry6.Delete;
         DMALM.AplicaDatos(DMALM.cdsQry6, 'MTIPPROV');
      End
   End;
End;

Procedure TFMaesProv.dbgProvLineaKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg(' ¿ Eliminar Registro ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMALM.cdsQry5.Delete;
         DMALM.AplicaDatos(DMALM.cdsQry5, 'PROVLINEA');
      End;
   End;
End;

Procedure TFMaesProv.dbgProvLineaDblClick(Sender: TObject);
Begin
   If Length(Trim(dblcTipProv.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'El Tipo de Proveedor no Puede Estar en Blanco');
      Exit;
   End;
   lblLineaDesc.Caption := '';
   DMALM.cdsQry5.Edit;
   lblLineaDesc.Caption := DMALM.cdsQry5.FieldByName('GRARDES').AsString;
   pnlProvLinea.Visible := True;
End;

Procedure TFMaesProv.dbesnombresExit(Sender: TObject);
Var
   cad: String;
Begin
   cad := '';
   If length(trim(dbeapepat.text)) > 0 Then
      cad := cad + trim(dbeapepat.text);
   If length(trim(dbeapemat.text)) > 0 Then
      cad := cad + ' ' + trim(dbeapemat.text);
   If length(trim(dbenombres.text)) > 0 Then
      cad := cad + ' ' + trim(dbenombres.text);
   If length(trim(dbesnombres.text)) > 0 Then
      cad := cad + ' ' + trim(dbesnombres.text);
   DMALM.cdsProv.fieldbyname('PROVDES').AsString := cad;
   DMALM.cdsProv.fieldbyname('PROVNOMCOM').AsString := cad;
  //	DMALM.cdsProv.fieldbyname('PROVDES').AsString:=+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
//	DMALM.cdsProv.fieldbyname('PROVNOMCOM').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
End;

Procedure TFMaesProv.dblcProcedExit(Sender: TObject);
Begin
   edtProced.Text := '';
   If length(dblcProced.Text) > 0 Then
   Begin
      DMALM.cdsQry3.IndexFieldNames := 'ID';
      DMALM.cdsQry3.SetKey;
      DMALM.cdsQry3.FieldByName('ID').AsString := dblcProced.Text;
      If Not DMALM.cdsQry3.GotoKey Then
      Begin
         ShowMessage('Procedencia no definida');
         dblcProced.SetFocus;
         exit;
      End;
      edtProced.Text := DMALM.cdsQry3.FieldByName('DESCRIP').AsString;
   End;
End;

Procedure TFMaesProv.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
   pcMaestro.ActivePageIndex := 0;
   Z2bbtnNuevo.Enabled := False;

   If DMALM.wModo = 'A' Then
   Begin
      RegistroNuevo;
   End
   Else
   Begin
      wModif := 'S';
      DMALM.cdsProv.Edit;
      dblcClAuxExit(Sender);
      dblcTipPerExit(Sender);
      dblcPaisExit(Sender);
      dblcDepartaExit(Sender);
      dblcProvincExit(Sender);
      dblcDistritoExit(Sender);
      dblcGiroExit(Sender);
      dblcClasifExit(Sender);
      dblcSecEcoExit(Sender);
      dblcProcedExit(Sender);
      dblcClAux.Enabled := False;
      dbeProv.Enabled := False;
      dbeRuc.SetFocus;
   End;
End;

Procedure TFMaesProv.FormCreate(Sender: TObject);
Begin
   FiltraTabla(DMALM.cdsSecEco, 'TGE163', 'SECECOID', 'SECECOID');
   dblcSecEco.LookupTable := DMALM.cdsSecEco;
   dblcSecEco.LookupField := 'SECECOID';

   FiltraTabla(DMALM.cdsGiro, 'TGE116', 'GIROID', 'GIROID');
   dblcGiro.LookupTable := DMALM.cdsGiro;
   dblcGiro.LookupField := 'GIROID';

   FiltraTabla(DMALM.cdsClasif, 'TGE132', 'CLASIFID', 'CLASIFID');
   dblcClasif.LookupTable := DMALM.cdsClasif;
   dblcClasif.LookupField := 'CLASIFID';

//   FiltraTabla( DMALM.cdsBanco,   'TGE105', 'BANCOID','BANCOID');
//   FiltraTabla( DMALM.cdsSitua,   'CXC104', 'SITUAID','SITUAID');

   FiltraTabla(DMALM.cdsTipProv, 'TGE134', 'TIPPROVID', 'TIPPROVID');
   dblcTipProv.LookupTable := DMALM.cdsTipProv;
   dblcTipProv.LookupField := 'TIPPROVID';

   FiltraTabla(DMALM.cdsClAux, 'TGE102', 'CLAUXID', 'CLAUXID');
   dblcClAux.LookupTable := DMALM.cdsClAux;
   dblcClAux.LookupField := 'CLAUXID';

   FiltraTabla(DMALM.cdsGArti, 'TGE131', 'GRARID', 'GRARID');
   dblcGrpArti.LookupTable := DMALM.cdsGArti;
   dblcGrpArti.LookupField := 'GRARID';

   FiltraTabla(DMALM.cdsTipPer, 'TGE109', 'TIPPERID', 'TIPPERID');
   dblcTipPer.LookupTable := DMALM.cdsTipPer;
   dblcTipPer.LookupField := 'TIPPERID';

   //DMALM.cdsNivel.IndexFieldNames:='Nivel';
   dbetipper.Text := '';
   pcMaestro.ActivePageIndex := 0;
   Z2bbtnNuevo.Enabled := False;

   //DMALM.cdsTipProv.Open;
   DMALM.cdsQry6.Close;
   DMALM.cdsQry6.DataRequest('SELECT * FROM LOG201');
   DMALM.cdsQry6.MasterSource := DMALM.dsProv;
   DMALM.cdsQry6.MasterFields := 'CLAUXID;PROV';
   DMALM.cdsQry6.IndexFieldNames := 'CLAUXID;PROV';
   DMALM.cdsQry6.Open;

   //CIM 20/11/2002

   DMALM.cdsQry5.Close;
   DMALM.cdsQry5.DataRequest('SELECT * FROM LOG202');
   DMALM.cdsQry5.MasterSource := DMALM.dsProv;
   DMALM.cdsQry5.MasterFields := 'CLAUXID;PROV';
   DMALM.cdsQry5.IndexFieldNames := 'CLAUXID;PROV';
   DMALM.cdsQry5.Open;
   dbgProvLinea.DataSource := DMALM.dsQry5;

   xSQL := 'Select * from TGE829';
   DMALM.cdsQry3.IndexFieldNames := '';
   DMALM.cdsQry3.Filter := '';
   DMALM.cdsQry3.Filtered := False;
   DMALM.cdsQry3.Close;
   DMALM.cdsQry3.datarequest(xSQL);
   DMALM.cdsQry3.Open;
   dblcProced.LookupTable := DMALM.cdsQry3;
   dblcProced.LookupField := 'ID';
   dblcProced.Selected.Clear;
   dblcProced.Selected.Add('ID'#9'3'#9'Id'#9'F');
   dblcProced.Selected.Add('DESCRIP'#9'30'#9'Procedencia'#9'F');

End;

End.

