Unit ALM502;

// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, ExtCtrls, wwdblook, Mask,
   wwdbedit, oaContabiliza,

   DBClient, MConnect, Db, Wwdatsrc, wwclient, DBTables, Wwquery,
   comctrls, RecError, Wwtable, Wwdbdlg, Wwdbspin, ppEndUsr, ppCache,
   ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls,
   ppPrnabl, ppBands, ppViewr, Spin, ppVar;
{UPDATE LOG205 SET
DEBE=(SELECT CUENTAID FROM TGE131 WHERE TGE131.CIAID=LOG205.CIAID AND TGE131.TINID=LOG205.TINID AND TGE131.GRARID=LOG205.GRARID),
HABER=(SELECT CUENTAHAB FROM TGE131 WHERE TGE131.CIAID=LOG205.CIAID AND TGE131.TINID=LOG205.TINID AND TGE131.GRARID=LOG205.GRARID)
}

Type
   TFRegDinCtbl = Class(TForm)
      pnlPadre: TPanel;
      pnlNieto: TPanel;
      dbgNieto: TwwDBGrid;
      Z2dbgNieto: TwwIButton;
      stxTitulo1: TPanel;
      pnlControl: TPanel;
      Z2bbtnRegNieto: TBitBtn;
      Z2bbtnGrabaNieto: TBitBtn;
      lblCia: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      dbeAsiento: TwwDBEdit;
      dbeDescripP: TwwDBEdit;
      Label1: TLabel;
      Label2: TLabel;
      Z2bbtnOK: TBitBtn;
      pnlHijo: TPanel;
      dbgHijo: TwwDBGrid;
      Z2dbgHijo: TwwIButton;
      Panel3: TPanel;
      Panel4: TPanel;
      Z2bbtnRegHijo: TBitBtn;
      Z2bbtnGrabaHijo: TBitBtn;
      pnlDetHijo: TPanel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      lblTransacc: TLabel;
      dblcTransac: TwwDBLookupCombo;
      dbeTransac: TwwDBEdit;
      lblPRESEN: TLabel;
      dbeSGrupo: TwwDBEdit;
      Label3: TLabel;
      dbeGrupo: TwwDBEdit;
      Label4: TLabel;
      dbeDescrip: TwwDBEdit;
      lblTMONEDA: TLabel;
      dblcTMoneda: TwwDBLookupCombo;
      dbeTMoneda: TwwDBEdit;
      chkICorp: TCheckBox;
      Panel1: TPanel;
      pnlDetNieto: TPanel;
      Label7: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label11: TLabel;
      Z2bbtnRegOkN: TBitBtn;
      Z2bbtnRegCancN: TBitBtn;
      dblcTransacN: TwwDBLookupCombo;
      dbeTransacN: TwwDBEdit;
      dbeSGrupoN: TwwDBEdit;
      dbeGrupoN: TwwDBEdit;
      dblcTMonedaN: TwwDBLookupCombo;
      dbeTMonedaN: TwwDBEdit;
      chkICorpN: TCheckBox;
      Panel5: TPanel;
      lblTMON: TLabel;
      dblcTINID: TwwDBLookupCombo;
      dbeTINID: TwwDBEdit;
      lblGrArtID: TLabel;
      dbeGrpArti: TwwDBEdit;
      Label5: TLabel;
      Label6: TLabel;
      dbeCtaDebe: TwwDBEdit;
      dbeCtaHaber: TwwDBEdit;
      Label10: TLabel;
      dblcTINIDN: TwwDBLookupCombo;
      dbeTINIDN: TwwDBEdit;
      dblcGrpArti: TwwDBLookupComboDlg;
      dbeDesCtaDebe: TEdit;
      dbeDesCtaHaber: TEdit;
      Label12: TLabel;
      Label13: TLabel;
      dbeDesCtaDebeCab: TEdit;
      dbeDesCtaHaberCab: TEdit;
      dbeCtaDebeCab: TwwDBLookupComboDlg;
      dbeCtaHaberCab: TwwDBLookupComboDlg;
      Label14: TLabel;
      Label15: TLabel;
      Z1sbDinCtbl: TBitBtn;
      ppReporte: TppReport;
      ppData: TppDBPipeline;
      Diseno: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLabel1: TppLabel;
      ppDBText1: TppDBText;
      dbseMes: TSpinEdit;
      dbseAno: TSpinEdit;
      chkICorpP: TCheckBox;
      Label16: TLabel;
      Memo1: TMemo;
      Z2bbtnContab: TBitBtn;
      Z2bbtnPreview: TBitBtn;
      pprPreview: TppReport;
      Z2bbtnSalir: TBitBtn;
      BitBtn1: TBitBtn;
      ppHeaderBand2: TppHeaderBand;
      pplblCiades: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel6: TppLabel;
      pplblTDiario: TppLabel;
      pplblDiarioDes: TppLabel;
      ppLabel9: TppLabel;
      pplblNoCompro: TppLabel;
      ppLabel15: TppLabel;
      pplblProveedor: TppLabel;
      ppLabel43: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      pplblGlosaDes: TppLabel;
      ppLabel50: TppLabel;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppLabel59: TppLabel;
      ppLabel60: TppLabel;
      pplblCodProv: TppLabel;
      pplblTipoCamb: TppDBText;
      ppLabel62: TppLabel;
      ppDBText15: TppDBText;
      ppLabel63: TppLabel;
      ppDBText16: TppDBText;
      ppLabel64: TppLabel;
      pplblDesEstado: TppLabel;
      ppLabel66: TppLabel;
      ppLabel67: TppLabel;
      ppLabel68: TppLabel;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      ppLabel71: TppLabel;
      ppLabel72: TppLabel;
      ppLabel73: TppLabel;
      pplblMontoImporte: TppLabel;
      ppLabel75: TppLabel;
      ppLabel76: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppLabel77: TppLabel;
      ppLabel78: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLabel79: TppLabel;
      ppLabel80: TppLabel;
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormActivate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure Z2bbtnRegHijoClick(Sender: TObject);
      Procedure Z2bbtnRegNietoClick(Sender: TObject);
      Procedure Z2bbtnGrabaHijoClick(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure Z2dbgHijoClick(Sender: TObject);
      Procedure dbgHijoDblClick(Sender: TObject);
      Procedure Z2dbgNietoClick(Sender: TObject);
      Procedure dbgNietoDblClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure dblcTransacExit(Sender: TObject);
      Procedure dblcTMonedaExit(Sender: TObject);
      Procedure Z2bbtnRegOkNClick(Sender: TObject);
      Procedure Z2bbtnRegCancNClick(Sender: TObject);
      Procedure dblcTransacNExit(Sender: TObject);
      Procedure dblcTMonedaNExit(Sender: TObject);
      Procedure dblcTINIDExit(Sender: TObject);
      Procedure Z2bbtnGrabaNietoClick(Sender: TObject);
      Procedure dblcTINIDNExit(Sender: TObject);
      Procedure dblcGrpArtiExit(Sender: TObject);
      Procedure dbgHijoKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure dbeCtaDebeExit(Sender: TObject);
      Procedure dbeCtaHaberExit(Sender: TObject);
      Procedure dbgNietoKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure dbeCtaDebeCabExit(Sender: TObject);
      Procedure dbeCtaHaberCabExit(Sender: TObject);
      Procedure dbseMesExit(Sender: TObject);
      Procedure Z1sbDinCtblClick(Sender: TObject);
      Procedure ppReportePreviewFormCreate(Sender: TObject);
      Procedure dblcGrpArtiDropDown(Sender: TObject);
      Procedure Z2bbtnPreviewClick(Sender: TObject);
      Procedure pprPreviewPreviewFormCreate(Sender: TObject);
   Private
  { Private declarations }
      iEstado: String;
      Procedure Centrala(Var m: TWMWINDOWPOSCHANGED); Message WM_WINDOWPOSCHANGING;

   Public
  { Public declarations }
      wOperacion: String; //'ADD' or 'MOD'
      Function AsientoCuadra: Boolean;
   End;

Var
   FRegDinCtbl: TFRegDinCtbl;
   sSQL, xSQL: String;
   sCIA, sASI, xFlag: String;
   xFac, xImpAmort, xTotFac: Double;
   xTAutoNum, xTAno, xTMes, xxNoReg: String;

   xTipDet: String;
   xDCPH: String;
   xDCPMOORI, xDCPMOLOC, xDCPMOEXT: double;
   xIGVPORI, xIGVPLOC, xIGVPEXT: double; //Calculo del Igv Prorrateado
   xTIGVPORI, xTIGVPLOC, xTIGVPEXT: double; // total igv
   xTotGOri, xTotGLoc, xTotGExt: double; //Total de debe sin IGV
   xDTotOri, xDTotLoc, xDTotExt: double; //Total de debe
   xPTotOri, xPTotLoc, xPTotExt: double; //Total de Gastos menos Igv Prorrateado
   xPDifIgvOri, xPDifIgvLoc, xPDifIgvExt: double; //Total de Gastos menos Igv Prorrateado

Implementation

Uses ALMDM1, ALM001;

{$R *.DFM}

Procedure TFRegDinCtbl.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
    //if self.ActiveControl Is TDBMemo then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRegDinCtbl.Z2bbtnOKClick(Sender: TObject);
Var
   xI: Double;
   xxxF: String;
Begin
   If Length(Trim(dblcCIA.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Compañia no Valido');
      Exit;
   End;

   If Length(Trim(dbeCIA.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Codigo de Compañia no Valido');
      Exit;
   End;

   If Length(Trim(dbeAsiento.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Asiento no Valido');
      Exit;
   End;

   If Length(Trim(dbeDescripP.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Descripción No valido');
      Exit;
   End;

   If wOperacion = 'ADD' Then
   Begin
      xSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
         'AND ASIENTO=' + QuotedStr(dbeAsiento.Text);

      xI := DM1.OperClientDataSet(dm1.cdsPadre, 'COUNT(CIAID)', xSQL);

      If xI > 0 Then
      Begin
         ErrorMsg(Caption, 'Registro Duplicado');
         Exit;
      End;
   End;

   Screen.Cursor := crHourGlass;
   If DM1.cdsPadre.State = dsInsert Then
   Begin
      dm1.cdsPadre.FieldByName('USUARIO').AsString := DM1.wUsuario;
      dm1.cdsPadre.FieldByName('FREG').AsDateTime := Date;
      dm1.cdsPadre.FieldByName('HREG').AsDateTime := Time;
   End;

   If chkICorpP.Checked Then
      xxxF := 'S'
   Else
      xxxF := 'N';

   If xFlag <> xxxF Then
   Begin
      If chkICorpP.Checked Then
         DM1.cdsPadre.FieldByName('FLGCORP').AsString := 'S'
      Else
         DM1.cdsPadre.FieldByName('FLGCORP').AsString := 'N';
   End;
   If dm1.cdsPadre.State <> dsBrowse Then
      dm1.cdsPadre.Post;

   xSQL := 'SELECT * FROM LOG203 ' +
      'WHERE CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
      'AND ASIENTO=' + QuotedStr(dbeAsiento.Text);
   dm1.cdsPadre.DataRequest(xSQL);

   DM1.ControlTran(0, Nil, '');

   DM1.cdsTINID.Close;
   DM1.cdsTINID.DataRequest('SELECT * FROM TGE152 WHERE CIAID=' + QuotedStr(dblcCIA.Text));
   DM1.cdsTINID.Open;

   DM1.cdsNia.Close;
   DM1.cdsNia.DataRequest('SELECT * FROM TGE202 WHERE CIAID=' + QuotedStr(dblcCia.Text));
   DM1.cdsNia.Open;

   dbeCtaDebeCab.Selected.clear;
   dbeCtaDebeCab.Selected.Add('CUENTAID'#9'15'#9'Cuenta');
   dbeCtaDebeCab.Selected.Add('CTADES'#9'50'#9'Descripción');
   dbeCtaDebeCab.Selected.Add('CTA_MOV'#9'6'#9'Cta. Mov.');
   dbeCtaDebeCab.Selected.Add('CTA_DET'#9'6'#9'Cta. Det.');
 //dbeCtaDebeCab.RedrawGrid;

   DM1.cdsNis.Close;
   DM1.cdsNis.DataRequest('SELECT * FROM TGE202 WHERE CIAID=' + QuotedStr(dblcCia.Text));
   DM1.cdsNis.Open;

   dbeCtaHaberCab.Selected.clear;
   dbeCtaHaberCab.Selected.Add('CUENTAID'#9'15'#9'Cuenta');
   dbeCtaHaberCab.Selected.Add('CTADES'#9'50'#9'Descripción');
   dbeCtaHaberCab.Selected.Add('CTA_MOV'#9'6'#9'Cta. Mov.');
   dbeCtaHaberCab.Selected.Add('CTA_DET'#9'6'#9'Cta. Det.');
 //dbeCtaHaberCab.RedrawGrid;

   pnlPadre.Enabled := False;
   pnlHijo.Enabled := True;
   pnlNieto.Enabled := True;

   If wOperacion = 'ADD' Then
      Z2dbgHijo.Click;
   Screen.Cursor := crDefault;
End;

Procedure TFRegDinCtbl.dblcCIAExit(Sender: TObject);
Begin
   dbeCia.Text := DM1.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.Text), 'CIADES');
End;

Procedure TFRegDinCtbl.FormActivate(Sender: TObject);
Begin
   xFlag := DM1.cdsPadre.FieldByName('FLGCORP').AsString;
 //DecodeDate(Date, Y, M, D);
 //dbseMes.Text:=dm1.StrZero(FloattoStr(M),2);
 //dbseAno.Text:=FloattoStr(Y);

   pnlPadre.Enabled := True;
   pnlHijo.Enabled := False;
   pnlNieto.Enabled := False;

   pnlDetHijo.Visible := False;
   pnlDetNieto.Visible := False;

   dbeCIA.Text := '';

   If wOperacion = 'MOD' Then
   Begin
      dblcCIA.Enabled := False;
      dbeAsiento.Enabled := False;
      dblcCIAExit(Nil);
      If DM1.cdsPadre.FieldByName('FLGCORP').AsString = 'S' Then
         chkICorpP.Checked := True
      Else
         chkICorpP.Checked := False;
      dbeDescripP.SetFocus;
   End
   Else
      If wOperacion = 'ADD' Then
      Begin
         dblcCIA.Enabled := True;
         dbeAsiento.Enabled := True;
         chkICorp.Checked := False;
         dblcCIA.SetFocus;
      End;

   xSQL := 'SELECT * FROM LOG204 ' +
      'WHERE CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
      'AND ASIENTO=' + QuotedStr(dbeAsiento.Text);
   dm1.cdsHijo.Close;
   dm1.cdsHijo.DataRequest(xSQL);
   dm1.cdsHijo.Open;

   dbgHijo.Selected.Clear;
   dbgHijo.Selected.Add('GRUPO'#9'5'#9'Grupo'#9'F');
   dbgHijo.Selected.Add('SGRUPO'#9'5'#9'Sub~Grupo'#9'F');
   dbgHijo.Selected.Add('TRIID'#9'5'#9'Trans.'#9'F');
   dbgHijo.Selected.Add('TINID'#9'5'#9'Tipo~Inv.'#9'F');
   dbgHijo.Selected.Add('DESCRIP'#9'42'#9'Descripción'#9'F');
   dbgHijo.Selected.Add('FLGCORP'#9'5'#9'Ind~Corpor'#9'F');
   dbgHijo.Selected.Add('TMONID'#9'6'#9'Tipo~Moneda'#9'F');
   dbgHijo.Selected.Add('DEBE'#9'13'#9'Debe'#9'F');
   dbgHijo.Selected.Add('HABER'#9'13'#9'Haber'#9'F');
   dbgHijo.RedrawGrid;

   xSQL := 'SELECT * FROM LOG205 ' +
      'WHERE CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
      'AND ASIENTO=' + QuotedStr(dbeAsiento.Text);
   dm1.cdsNieto.Close;
   dm1.cdsNieto.MasterSource := dm1.dsHijo;
   dm1.cdsNieto.MasterFields := 'CIAID;ASIENTO;GRUPO;SGRUPO;TRIID';
   dm1.cdsNieto.IndexFieldNames := 'CIAID;ASIENTO;GRUPO;SGRUPO;TRIID;GRARID';

   dm1.cdsNieto.DataRequest(xSQL);
   dm1.cdsNieto.Open;

   dbgNieto.Selected.Clear;
   dbgNieto.Selected.Add('GRUPO'#9'3'#9'Grupo'#9'F');
   dbgNieto.Selected.Add('SGRUPO'#9'5'#9'Sub~Grupo'#9'F');
   dbgNieto.Selected.Add('TRIID'#9'4'#9'Trans.'#9'F');
   dbgNieto.Selected.Add('TINID'#9'4'#9'Tipo~Inv.'#9'F');
   dbgNieto.Selected.Add('GRARID'#9'5'#9'Linea'#9'F');
   dbgNieto.Selected.Add('GRARDES'#9'40'#9'Linea'#9'F');
   dbgNieto.Selected.Add('FLGCORP'#9'5'#9'Ind~Corpor'#9'F');
   dbgNieto.Selected.Add('TMONID'#9'4'#9'Tipo~Mon'#9'F');
   dbgNieto.Selected.Add('DEBE'#9'13'#9'Debe'#9'F');
   dbgNieto.Selected.Add('HABER'#9'13'#9'Haber'#9'F');
   dbgNieto.RedrawGrid;

End;

Procedure TFRegDinCtbl.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   wOperacion := '';

   If DM1.cdsPadre.State In [dsEdit, dsInsert] Then
      DM1.cdsPadre.Cancel;
   If DM1.cdsPadre.ChangeCount > 0 Then
      DM1.cdsPadre.CancelUpdates;

   DM1.cdsNia.Close;
   DM1.cdsNia.DataRequest('SELECT * FROM LOG314 WHERE CIAID=''XX''');

   DM1.cdsNis.Close;
   DM1.cdsNis.DataRequest('SELECT * FROM LOG314 WHERE CIAID=''CC''');

   dm1.cdsNieto.Close;
   dm1.cdsNieto.MasterSource := Nil;
   dm1.cdsNieto.MasterFields := '';
   dm1.cdsNieto.IndexFieldNames := '';
End;

Procedure TFRegDinCtbl.Z2bbtnRegHijoClick(Sender: TObject);
Begin
   pnlPadre.Enabled := True;
   pnlhijo.Enabled := False;
   dm1.cdsPadre.Edit;
End;

Procedure TFRegDinCtbl.Z2bbtnRegNietoClick(Sender: TObject);
Begin
  //pnlNieto.Enabled:=True;
   pnlPadre.Enabled := True;
   pnlhijo.Enabled := False;
   pnlHijo.Enabled := False;
End;

Procedure TFRegDinCtbl.Z2bbtnGrabaHijoClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   xSQL := 'SELECT * FROM LOG204 ' +
      'WHERE CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
      'AND ASIENTO=' + QuotedStr(dbeAsiento.Text);
   dm1.cdsHijo.DataRequest(xSQL);

   xSQL := 'SELECT * FROM LOG205 ' +
      'WHERE CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
      'AND ASIENTO=' + QuotedStr(dbeAsiento.Text);
   dm1.cdsNieto.DataRequest(xSQL);

   DM1.ControlTran(0, Nil, '');

  {xSQL:='SELECT * FROM LOG205 '+
     'WHERE CIAID='+QuotedStr(dblcCIA.Text)+' '+
        'AND ASIENTO='+QuotedStr(dbeAsiento.Text);
  dm1.cdsNieto.Close;
  dm1.cdsNieto.DataRequest(xSQL);
  dm1.cdsNieto.Open;
 dbgNieto.Selected.Clear;
 dbgNieto.Selected.Add('GRUPO'#9'3'#9'Grupo'#9'F');
 dbgNieto.Selected.Add('SGRUPO'#9'5'#9'Sub~Grupo'#9'F');
 dbgNieto.Selected.Add('TRIID'#9'4'#9'Transacción'#9'F');
 dbgNieto.Selected.Add('TINID'#9'4'#9'Tipo~Inv.'#9'F');
 dbgNieto.Selected.Add('GRARID'#9'5'#9'Linea'#9'F');
 dbgNieto.Selected.Add('GRARDES'#9'32'#9'Linea'#9'F');
 dbgNieto.Selected.Add('FLGCORP'#9'5'#9'Ind~Corpor'#9'F');
 dbgNieto.Selected.Add('TMONID'#9'6'#9'Tipo~Moneda'#9'F');
 dbgNieto.Selected.Add('DEBE'#9'14'#9'Debe'#9'F');
 dbgNieto.Selected.Add('HABER'#9'14'#9'Haber'#9'F');
 dbgNieto.RedrawGrid;}

   pnlPadre.Enabled := False;
   pnlHijo.Enabled := True;
   pnlNieto.Enabled := True;
   Screen.Cursor := crDefault;
End;

Procedure TFRegDinCtbl.Z2bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFRegDinCtbl.Z2dbgHijoClick(Sender: TObject);
Begin
   iEstado := 'ADICIONA';
   pnlDetHijo.Height := 403;
   pnlDetHijo.Left := 135;
   pnlDetHijo.Top := 173;
   pnlDetHijo.Width := 527;
   pnlDetHijo.Visible := True;
   pnlHijo.Enabled := False;
   pnlNieto.Enabled := False;

   dbeGrupo.Text := '';
   dbeSGrupo.Text := '';
   dblcTINIDN.Text := '';
   dbeTINIDN.Text := '';
   dblcTransac.Text := '';
   dbeTransac.Text := '';
   dbeDescrip.Text := '';
   chkICorp.Checked := False;
   dblcTMoneda.Text := '';
   dbeTMoneda.Text := '';
   dbeCtaDebeCab.Text := '';
   dbeDesCtaDebeCab.Text := '';
   dbeCtaHaberCab.Text := '';
   dbeDesCtaHaberCab.Text := '';

   dbeGrupo.Enabled := True;
   dbeSGrupo.Enabled := True;
   dblcTransac.Enabled := True;
   dblcTINIDN.Enabled := True;

   dbeCtaDebeCab.Enabled := False;
   dbeCtaHaberCab.Enabled := False;

   dbeGrupo.SetFocus;
End;

Procedure TFRegDinCtbl.dbgHijoDblClick(Sender: TObject);
Begin
   If dm1.cdsHijo.RecordCount = 0 Then
   Begin
      Information(Caption, 'No Existen Registros a Editar');
      Exit;
   End;

   iEstado := 'MODIFICA';
   pnlDetHijo.Height := 403;
   pnlDetHijo.Left := 135;
   pnlDetHijo.Top := 173;
   pnlDetHijo.Width := 527;
   pnlDetHijo.Visible := True;
   pnlHijo.Enabled := False;
   pnlNieto.Enabled := False;

   dbeGrupo.Text := DM1.cdsHijo.FieldByName('GRUPO').AsString;
   dbeSGrupo.Text := DM1.cdsHijo.FieldByName('SGRUPO').AsString;
   dblcTINIDN.Text := DM1.cdsHijo.FieldByName('TINID').AsString;
   dblcTINIDNExit(Nil);
   dbeCtaDebeCab.Text := DM1.cdsHijo.FieldByName('DEBE').AsString;
   dbeCtaHaberCab.Text := DM1.cdsHijo.FieldByName('HABER').AsString;
   dblcTransac.Text := DM1.cdsHijo.FieldByName('TRIID').AsString;
   dblcTransacExit(Nil);

   dbeGrupo.Enabled := False;
   dbeSGrupo.Enabled := False;
   dblcTransac.Enabled := False;
   dblcTINIDN.Enabled := False;

   dbeDescrip.Text := dm1.cdsHijo.FieldByName('DESCRIP').AsString;
   If dm1.cdsHijo.FieldByName('FLGCORP').AsString = 'S' Then
      chkICorp.Checked := True
   Else
      chkICorp.Checked := False;
   dblcTMoneda.Text := dm1.cdsHijo.FieldByName('TMONID').AsString;
   dblcTMonedaExit(Nil);
End;

Procedure TFRegDinCtbl.Z2dbgNietoClick(Sender: TObject);
Begin
   If dm1.cdsHijo.RecordCount = 0 Then
   Begin
      ErrorMsg(caption, ' No Puede Ingresar La Linea ');
      Exit;
   End;

   iEstado := 'ADICIONA';
   pnlDetNieto.Height := 393;
   pnlDetNieto.Left := 134;
   pnlDetNieto.Top := 1;
   pnlDetNieto.Width := 530;
   pnlDetNieto.Visible := True;
   pnlNieto.Enabled := False;
   pnlHijo.Enabled := False;

   dbeGrupoN.Text := dm1.cdsHijo.FieldByName('GRUPO').AsString;
   dbeSGrupoN.Text := dm1.cdsHijo.FieldByName('SGRUPO').AsString;
   dblcTransacN.Text := dm1.cdsHijo.FieldByName('TRIID').AsString;
   dblcTINID.Text := dm1.cdsHijo.FieldByName('TINID').AsString;
   dbeTINID.Text := '';
   dblcGrpArti.Text := '';
   dbeGrpArti.Text := '';
   If dm1.cdsHijo.FieldByName('FLGCORP').AsString = 'S' Then
      chkICorpN.Checked := True
   Else
      chkICorpN.Checked := False;
   dblcTMonedaN.Text := dm1.cdsHijo.FieldByName('TMONID').AsString;
   dbeCtaDebe.Text := '';
   dbeCtaHaber.Text := '';
   dbeDesCtaDebe.Text := '';
   dbeDesCtaHaber.Text := '';

   dbeGrupoN.Enabled := False;
   dbeSGrupoN.Enabled := False;
   dblcTransacN.Enabled := False;
   dblcTINID.Enabled := False;
   chkICorpN.Enabled := False;
   dblcTMonedaN.Enabled := False;
   dbeCtaDebe.Enabled := False;
   dbeCtaHaber.Enabled := False;

   dblcTransacNExit(Nil);
   dblcTMonedaNExit(Nil);
   dblcTINIDExit(Nil);
   dblcGrpArti.SetFocus;
End;

Procedure TFRegDinCtbl.dbgNietoDblClick(Sender: TObject);
Begin
   If dm1.cdsNieto.RecordCount = 0 Then
   Begin
      Information(Caption, 'No Existen Registros a Editar');
      Exit;
   End;

   iEstado := 'MODIFICA';
   pnlDetNieto.Height := 393;
   pnlDetNieto.Left := 134;
   pnlDetNieto.Top := 1;
   pnlDetNieto.Width := 530;
   pnlDetNieto.Visible := True;
   pnlNieto.Enabled := False;
   pnlHijo.Enabled := False;

   dbeGrupoN.Text := dm1.cdsNieto.FieldByName('GRUPO').AsString;
   dbeSGrupoN.Text := dm1.cdsNieto.FieldByName('SGRUPO').AsString;
   dblcTransacN.Text := dm1.cdsNieto.FieldByName('TRIID').AsString;
   dblcTransacNExit(Nil);
   dblcTINID.Text := dm1.cdsNieto.FieldByName('TINID').AsString;
   dblcTINIDExit(Nil);
   dblcGrpArti.Text := dm1.cdsNieto.FieldByName('GRARID').AsString;
   dbeGrpArti.Text := dm1.cdsNieto.FieldByName('GRARDES').AsString;
   If dm1.cdsNieto.FieldByName('FLGCORP').AsString = 'S' Then
      chkICorpN.Checked := True
   Else
      chkICorpN.Checked := False;
   dblcTMonedaN.Text := dm1.cdsNieto.FieldByName('TMONID').AsString;
   dblcTMonedaNExit(Nil);

   dbeCtaDebe.Text := dm1.cdsNieto.FieldByName('DEBE').AsString;
   dbeCtaHaber.Text := dm1.cdsNieto.FieldByName('HABER').AsString;
   dbeCtaDebeExit(Nil);
   dbeCtaHaberExit(Nil);

   dbeGrupoN.Enabled := False;
   dbeSGrupoN.Enabled := False;
   dblcTransacN.Enabled := False;
   dblcTINID.Enabled := False;
   chkICorpN.Enabled := False;
   dblcTMonedaN.Enabled := False;
   dbeCtaDebe.Enabled := False;
   dbeCtaHaber.Enabled := False;
End;

Procedure TFRegDinCtbl.Z2bbtnRegOkClick(Sender: TObject);
Var
   xI: Double;
   xFlagDH: String;
Begin
   If Length(Trim(dbeTINIDN.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Tipo de Inventario No valido');
      Exit;
   End;

   If Length(Trim(dbeTransac.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Tipo de Transacción No valido');
      Exit;
   End;

   If Length(Trim(dbeTMoneda.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Tipo de Moneda No valido');
      Exit;
   End;

   xSQL := 'TRIID=' + quotedstr(dblcTransac.Text);
   DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRISGT', xSQL, 'TRISGT');

   If dm1.cdsQry.FieldByName('TRISGT').AsString = 'I' Then
   Begin
      xFlagDH := 'H';
      If Length(Trim(dbeCtaHaberCab.Text)) = 0 Then
      Begin
         ErrorMsg(Caption, 'La Cuenta Haber No Existe');
         Exit;
      End;

      If Length(Trim(dbeDesCtaHaberCab.Text)) = 0 Then
      Begin
         ErrorMsg(Caption, 'La Cuenta Haber No Es Correcta');
         Exit;
      End;
   End
   Else
      If dm1.cdsQry.FieldByName('TRISGT').AsString = 'S' Then
      Begin
         xFlagDH := 'D';
         If Length(Trim(dbeCtaDebeCab.Text)) = 0 Then
         Begin
            ErrorMsg(Caption, 'La Cuenta Debe No Existe');
            Exit;
         End;

         If Length(Trim(dbeDesCtaDebeCab.Text)) = 0 Then
         Begin
            ErrorMsg(Caption, 'La Cuenta Debe No Es Correcta');
            Exit;
         End;
      End;

   Screen.Cursor := crHourGlass;
   If iEstado = 'ADICIONA' Then
   Begin
      xSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
         'AND ASIENTO=' + QuotedStr(dbeAsiento.Text) + ' ' +
         'AND GRUPO=' + QuotedStr(dbeGrupo.Text) + ' ' +
         'AND SGRUPO=' + QuotedStr(dbeSGrupo.Text) + ' ' +
         'AND TRIID=' + QuotedStr(dblcTransac.Text) + ' ' +
         'AND TINID=' + QuotedStr(dblcTINIDN.Text);

      xI := DM1.OperClientDataSet(dm1.cdsHijo, 'COUNT(TINID)', xSQL);
      If xI > 0 Then
      Begin
         Screen.Cursor := crDefault;
         ErrorMsg(Caption, 'Registro Duplicado');
         Exit;
      End;
      DM1.cdsHijo.Insert;
   End
   Else
      If iEstado = 'MODIFICA' Then
         DM1.cdsHijo.Edit;

   DM1.cdsHijo.FieldByName('CIAID').AsString := dblcCIA.Text;
   DM1.cdsHijo.FieldByName('ASIENTO').AsString := dbeAsiento.Text;
   DM1.cdsHijo.FieldByName('GRUPO').AsString := dbeGrupo.Text;
   DM1.cdsHijo.FieldByName('SGRUPO').AsString := dbeSGrupo.Text;
   DM1.cdsHijo.FieldByName('TINID').AsString := dblcTINIDN.Text;
   DM1.cdsHijo.FieldByName('TRIID').AsString := dblcTransac.Text;
   DM1.cdsHijo.FieldByName('DESCRIP').AsString := dbeDescrip.Text;
   If chkICorp.Checked Then
      DM1.cdsHijo.FieldByName('FLGCORP').AsString := 'S'
   Else
      DM1.cdsHijo.FieldByName('FLGCORP').AsString := 'N';
   DM1.cdsHijo.FieldByName('TMONID').AsString := dblcTMoneda.Text;
   DM1.cdsHijo.FieldByName('DEBE').AsString := dbeCtaDebeCab.Text;
   DM1.cdsHijo.FieldByName('HABER').AsString := dbeCtaHaberCab.Text;

   DM1.cdsHijo.FieldByName('USUARIO').AsString := dm1.wUsuario;
   DM1.cdsHijo.FieldByName('FREG').AsDateTime := Date;
   DM1.cdsHijo.FieldByName('HREG').AsDateTime := Time;

   DM1.cdsHijo.Post;

   DM1.cdsNieto.DisableControls;
   DM1.cdsNieto.First;
   While Not DM1.cdsNieto.EOF Do
   Begin
      DM1.cdsNieto.Edit;
      If xFlagDH = 'D' Then
         DM1.cdsNieto.FieldByName('DEBE').AsString := DM1.cdsHijo.FieldByName('DEBE').AsString
      Else
         DM1.cdsNieto.FieldByName('HABER').AsString := DM1.cdsHijo.FieldByName('HABER').AsString;

      DM1.cdsNieto.FieldByName('TMONID').AsString := DM1.cdsHijo.FieldByName('TMONID').AsString;
      DM1.cdsNieto.FieldByName('FLGCORP').AsString := DM1.cdsHijo.FieldByName('FLGCORP').AsString;
      DM1.cdsNieto.Post;
      DM1.cdsNieto.Next;
   End;
   DM1.cdsNieto.First;
   DM1.cdsNieto.EnableControls;

   pnlHijo.Enabled := True;
   pnlNieto.Enabled := True;
   pnlDetHijo.Visible := False;
   Screen.Cursor := crDefault;
End;

Procedure TFRegDinCtbl.Z2bbtnRegCancClick(Sender: TObject);
Begin
   pnlHijo.Enabled := True;
   pnlNieto.Enabled := True;
   pnlDetHijo.Visible := False;
End;

Procedure TFRegDinCtbl.dblcTransacExit(Sender: TObject);
Begin
   xSQL := 'TRIID=' + quotedstr(dblcTransac.Text); //+' AND TRISGT=''I''';
   DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRIDES, TRISGT', xSQL, 'TRIDES');

   dbeTransac.Text := dm1.cdsQry.FieldByName('TRIDES').AsString;
   If dm1.cdsQry.FieldByName('TRISGT').AsString = 'I' Then
   Begin
      dbeCtaHaberCab.Enabled := True;
      dbeCtaDebeCab.Clear;
      dbeCtaDebeCab.Enabled := False;
   End
   Else
      If dm1.cdsQry.FieldByName('TRISGT').AsString = 'S' Then
      Begin
         dbeCtaHaberCab.Clear;
         dbeCtaHaberCab.Enabled := False;
         dbeCtaDebeCab.Enabled := True;
      End;
   dbeDesCtaDebeCab.Text := '';
   dbeDesCtaHabercab.Text := '';
   dbeCtaDebeCabExit(Nil);
   dbeCtaHaberCabExit(Nil);
End;

Procedure TFRegDinCtbl.dblcTMonedaExit(Sender: TObject);
Begin
   dbeTMoneda.text := DM1.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', 'TMONID=' + quotedStr(dblcTMoneda.text), 'TMONDES');
End;

Procedure TFRegDinCtbl.Z2bbtnRegOkNClick(Sender: TObject);
Begin
   If Length(Trim(dbeGrpArti.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Linea de Producto No valido');
      Exit;
   End;

   If Length(Trim(dbeCtaDebe.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'La Cuenta Debe No Existe para Esta Linea de Producto');
      Exit;
   End;

   If Length(Trim(dbeDesCtaDebe.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'La Cuenta Debe No Es Correcta, Verifique en la Tabla de Lineas');
      Exit;
   End;

   If Length(Trim(dbeCtaHaber.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'La Cuenta Haber No Existe para Esta Linea de Producto');
      Exit;
   End;

   If Length(Trim(dbeDesCtaHaber.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'La Cuenta Haber No Es Correcta, Verifique en la Tabla de Lineas');
      Exit;
   End;

   If iEstado = 'ADICIONA' Then
      dm1.cdsNieto.Insert
   Else
      If iEstado = 'MODIFICA' Then
         dm1.cdsNieto.Edit;

   dm1.cdsNieto.FieldByName('CIAID').AsString := dblcCIA.Text;
   dm1.cdsNieto.FieldByName('ASIENTO').AsString := dbeAsiento.Text;
   dm1.cdsNieto.FieldByName('GRUPO').AsString := dbeGrupoN.Text;
   dm1.cdsNieto.FieldByName('SGRUPO').AsString := dbeSGrupoN.Text;
   dm1.cdsNieto.FieldByName('TRIID').AsString := dblcTransacN.Text;
   dm1.cdsNieto.FieldByName('TINID').AsString := dblcTINID.Text;
   dm1.cdsNieto.FieldByName('GRARID').AsString := dblcGrpArti.Text;
   dm1.cdsNieto.FieldByName('GRARDES').AsString := dbeGrpArti.Text;
   If chkICorp.Checked Then
      dm1.cdsNieto.FieldByName('FLGCORP').AsString := 'S'
   Else
      dm1.cdsNieto.FieldByName('FLGCORP').AsString := 'N';
   dm1.cdsNieto.FieldByName('TMONID').AsString := dblcTMonedaN.Text;
   dm1.cdsNieto.FieldByName('DEBE').AsString := dbeCtaDebe.Text;
   dm1.cdsNieto.FieldByName('HABER').AsString := dbeCtaHaber.Text;
   dm1.cdsNieto.FieldByName('USUARIO').AsString := dm1.wUsuario;
   dm1.cdsNieto.FieldByName('FREG').AsDateTime := Date;
   dm1.cdsNieto.FieldByName('HREG').AsDateTime := Time;

   dm1.cdsNieto.Post;
   pnlNieto.Enabled := True;
   pnlHijo.Enabled := True;
   pnlDetNieto.Visible := False;
   If iEstado = 'ADICIONA' Then
      Z2dbgNieto.Click;
End;

Procedure TFRegDinCtbl.Z2bbtnRegCancNClick(Sender: TObject);
Begin
   pnlNieto.Enabled := True;
   pnlHijo.Enabled := True;
   pnlDetNieto.Visible := False;
End;

Procedure TFRegDinCtbl.dblcTransacNExit(Sender: TObject);
Begin
   xSQL := 'TRIID=' + quotedstr(dblcTransac.Text); //+' AND TRISGT=''I''';
   dbeTransacn.Text := DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRIDES', xSQL, 'TRIDES');
End;

Procedure TFRegDinCtbl.dblcTMonedaNExit(Sender: TObject);
Begin
   dbeTMonedaN.text := DM1.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', 'TMONID=' + quotedStr(dblcTMonedaN.text), 'TMONDES');
End;

Procedure TFRegDinCtbl.dblcTINIDExit(Sender: TObject);
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + QuotedStr(dblcTINID.text);
   dbeTINID.text := DM1.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

   xSQL := 'SELECT * FROM TGE131 ' +
      'WHERE CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
      'AND TINID=' + QuotedStr(dblcTINID.Text);
   DM1.cdsGArti.Close;
   DM1.cdsGArti.DataRequest(xSQL);

   dblcGrpArti.Selected.clear;
   dblcGrpArti.Selected.Add('GRARID'#9'15'#9'Id');
   dblcGrpArti.Selected.Add('GRARDES'#9'50'#9'Linea');

   DM1.cdsGArti.Open;
End;

Procedure TFRegDinCtbl.Z2bbtnGrabaNietoClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   xSQL := 'SELECT * FROM LOG204 ' +
      'WHERE CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
      'AND ASIENTO=' + QuotedStr(dbeAsiento.Text);
   dm1.cdsHijo.DataRequest(xSQL);

   xSQL := 'SELECT * FROM LOG205 ' +
      'WHERE CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
      'AND ASIENTO=' + QuotedStr(dbeAsiento.Text);
   dm1.cdsNieto.DataRequest(xSQL);

   DM1.ControlTran(0, Nil, '');
   Screen.Cursor := crDefault;
End;

Procedure TFRegDinCtbl.dblcTINIDNExit(Sender: TObject);
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + QuotedStr(dblcTINIDN.text);
   dbeTINIDN.text := DM1.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');

  {xSQL:='SELECT * FROM TGE131 '+
     'WHERE CIAID='+QuotedStr(dblcCIA.Text)+' '+
        'AND TINID='+QuotedStr(dblcTINID.Text);
  DM1.cdsGArti.Close;
  DM1.cdsGArti.DataRequest(xSQL);
  DM1.cdsGArti.Open;}
End;

Procedure TFRegDinCtbl.dblcGrpArtiExit(Sender: TObject);
Var
   xI: Double;
Begin
   If Z2bbtnRegCancN.Focused Then Exit;

   If iEstado = 'ADICIONA' Then
   Begin
      xSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
         'AND ASIENTO=' + QuotedStr(dbeAsiento.Text) + ' ' +
         'AND GRUPO=' + QuotedStr(dbeGrupoN.Text) + ' ' +
         'AND SGRUPO=' + QuotedStr(dbeSGrupoN.Text) + ' ' +
         'AND TRIID=' + QuotedStr(dblcTransacN.Text) + ' ' +
         'AND GRARID=' + QuotedStr(dblcGrpArti.Text);

      xI := DM1.OperClientDataSet(dm1.cdsNieto, 'COUNT(GRARID)', xSQL);

      If xI > 0 Then
      Begin
         ErrorMsg(Caption, 'Linea No Puede estar Duplicada');
         dblcGrpArti.SetFocus;
         Exit;
      End;
   End;

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + QuotedStr(dblcTINID.text) + ' AND GRARID=' + QuotedStr(dblcGrpArti.text);
   DM1.DisplayDescrip('prvTGE', 'TGE131', 'CUENTAID, GRARDES', xSQL, 'GRARDES');
   dbeGrpArti.Text := dm1.cdsQry.FieldByName('GRARDES').AsString;
   dbeCtaDebe.Text := dm1.cdsQry.FieldByName('CUENTAID').AsString;
   dbeCtaHaber.Text := dm1.cdsQry.FieldByName('CUENTAID').AsString;

   xSQL := 'TRIID=' + quotedstr(dblcTransacN.Text);
   DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRISGT', xSQL, 'TRISGT');

   If dm1.cdsQry.FieldByName('TRISGT').AsString = 'I' Then
      dbeCtaHaber.Text := dm1.cdsHijo.FieldByName('HABER').AsString
   Else
      If dm1.cdsQry.FieldByName('TRISGT').AsString = 'S' Then
         dbeCtaDebe.Text := dm1.cdsHijo.FieldByName('DEBE').AsString;

   dbeCtaDebeExit(Nil);
   dbeCtaHaberExit(Nil);
End;

Procedure TFRegDinCtbl.dbgHijoKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If DM1.cdsHijo.RecordCount = 0 Then
      Begin
         ErrorMsg('Error', 'No Existen Registros a Eliminar');
         exit;
      End;

      Screen.Cursor := crHourGlass;
      sCIA := DM1.cdsPadre.FieldByName('CIAID').AsString;
      sASI := DM1.cdsPadre.FieldByName('ASIENTO').AsString;

      sSQL := 'SELECT * FROM LOG205 ' +
         'WHERE CIAID=' + QuotedStr(sCIA) + ' ' +
         'AND ASIENTO=' + QuotedStr(sASI) + ' ' +
         'AND GRUPO=' + QuotedStr(DM1.cdsHijo.FieldByName('GRUPO').AsString) + ' ' +
         'AND SGRUPO=' + QuotedStr(DM1.cdsHijo.FieldByName('SGRUPO').AsString) + ' ' +
         'AND TRIID=' + QuotedStr(DM1.cdsHijo.FieldByName('TRIID').AsString) + ' ' +
         'AND TINID=' + QuotedStr(DM1.cdsHijo.FieldByName('TINID').AsString);

      dm1.cdsSQL.Close;
      dm1.cdsSQL.DataRequest(sSQL);
      dm1.cdsSQL.Open;

      Screen.Cursor := crDefault;
      If dm1.cdsSQL.RecordCount > 0 Then
         Information(Caption, ' Esta Dinamica Contable Contiene Lineas ');

      If Question('Confirmar', 'Esta Seguro de Eliminar Esta Dinamica Contable' + #13 + #13 +
         'Asiento Nº   ' + DM1.cdsHijo.FieldByName('ASIENTO').AsString + #13 +
         'Descripción  ' + DM1.cdsHijo.FieldByName('DESCRIP').AsString + #13 +
         'Grupo  			' + DM1.cdsHijo.FieldByName('GRUPO').AsString + #13 +
         'Sub-Grupo 		' + DM1.cdsHijo.FieldByName('SGRUPO').AsString + #13 +
         'Transacción  ' + DM1.cdsHijo.FieldByName('TRIID').AsString + #13 +
         #13 + ' Desea Continuar ') Then
      Begin
         Screen.Cursor := crHourGlass;
         Try
            sSQL := 'DELETE FROM LOG205 ' +
               'WHERE CIAID=' + QuotedStr(sCIA) + ' ' +
               'AND ASIENTO=' + QuotedStr(sASI) + ' ' +
               'AND GRUPO=' + QuotedStr(DM1.cdsHijo.FieldByName('GRUPO').AsString) + ' ' +
               'AND SGRUPO=' + QuotedStr(DM1.cdsHijo.FieldByName('SGRUPO').AsString) + ' ' +
               'AND TRIID=' + QuotedStr(DM1.cdsHijo.FieldByName('TRIID').AsString) + ' ' +
               'AND TINID=' + QuotedStr(DM1.cdsHijo.FieldByName('TINID').AsString);
            DM1.DCOM1.AppServer.EjecutaQry(sSQL);
         Except
         End;
         xBorrar := '1';
         dm1.cdsHijo.Delete;
         DM1.ControlTran(0, Nil, '');
         xBorrar := '0';
         Screen.Cursor := crDefault;
      End;
   End;
End;

Procedure TFRegDinCtbl.dbeCtaDebeExit(Sender: TObject);
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND CUENTAID=' + QuotedStr(dbeCtaDebe.Text);
   dbeDesCtaDebe.Text := DM1.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', xSQL, 'CTADES');
End;

Procedure TFRegDinCtbl.dbeCtaHaberExit(Sender: TObject);
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND CUENTAID=' + QuotedStr(dbeCtaHaber.Text);
   dbeDesCtaHaber.Text := DM1.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', xSQL, 'CTADES');
End;

Procedure TFRegDinCtbl.dbgNietoKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If DM1.cdsNieto.RecordCount = 0 Then
      Begin
         ErrorMsg('Error', 'No Existen Registros a Eliminar');
         exit;
      End;

      Screen.Cursor := crHourGlass;
      xBorrar := '1';
      dm1.cdsNieto.Delete;
      DM1.ControlTran(0, Nil, '');
      xBorrar := '0';
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFRegDinCtbl.dbeCtaDebeCabExit(Sender: TObject);
Begin
   If Z2bbtnRegCanc.Focused Then Exit;
   If Length(Trim(dbeCtaDebeCab.Text)) = 0 Then
   Begin
      dbeDesCtaDebeCab.Text := '';
      Exit;
   End;
   xSQL := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND CUENTAID=' + QuotedStr(dbeCtaDebeCab.Text) + ' ' +
      'AND CTA_MOV=''S'' AND CTA_DET=''S''';
   dbeDesCtaDebeCab.Text := DM1.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', xSQL, 'CTADES');
   If Length(Trim(dbeDesCtaDebeCab.Text)) = 0 Then
      ErrorMsg(Caption, 'la Cuenta Seleccionada No es de Movimiento y Detalle');
End;

Procedure TFRegDinCtbl.dbeCtaHaberCabExit(Sender: TObject);
Begin
   If Z2bbtnRegCanc.Focused Then Exit;
   If Length(Trim(dbeCtaHaberCab.Text)) = 0 Then
   Begin
      dbeDesCtaHaberCab.Text := '';
      Exit;
   End;
   xSQL := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND CUENTAID=' + QuotedStr(dbeCtaHaberCab.Text) + ' ' +
      'AND CTA_MOV=''S'' AND CTA_DET=''S''';
   dbeDesCtaHaberCab.Text := DM1.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', xSQL, 'CTADES');
   If Length(Trim(dbeDesCtaHaberCab.Text)) = 0 Then
      ErrorMsg(Caption, 'la Cuenta Seleccionada No es de Movimiento ni de Detalle');
End;

Procedure TFRegDinCtbl.dbseMesExit(Sender: TObject);
Begin
   dbseMes.Text := DM1.StrZero(dbseMes.Text, 2);
End;

Procedure TFRegDinCtbl.Z1sbDinCtblClick(Sender: TObject);
Var
   sVeid, xSQLON, xTCtaD, xTCtaH: String;
Begin
   Screen.Cursor := CrHourGlass;
   xSQLON := '';
   dbseMes.Text := DM1.StrZero(dbseMes.Text, 2);
   sVeid := DM1.DisplayDescrip('prvTGE', 'CXC203', 'VEID', 'VEFCORP=' + quotedstr('S'), 'VEID');

   dm1.cdsHijo.First;
   While Not dm1.cdsHijo.Eof Do
   Begin
      xSQL := 'TRIID=' + quotedstr(dm1.cdsHijo.FieldByName('TRIID').AsString);
      DM1.DisplayDescrip('prvTGE', 'TGE208', 'TRIDES, TRISGT', xSQL, 'TRIDES');

      If dm1.cdsQry.FieldByName('TRISGT').AsString = 'I' Then
      Begin
         xTCtaD := 'D.DEBE';
         xTCtaH := 'D.HABER';
      End
      Else
         If dm1.cdsQry.FieldByName('TRISGT').AsString = 'S' Then
         Begin
            xTCtaD := 'D.HABER';
            xTCtaH := 'D.DEBE';
         End;

      If Length(Trim(xSQLON)) > 0 Then
         xSQLON := xSQLON + ' UNION ALL ';

      xSQL := 'SELECT T.TRISGT, DET.TRIID TRIEQUI, T.TRIDES, DET.GRARID, L.GRARDES, ' + xTCtaD + ' CUENTA, D.GRUPO, D.SGRUPO, C.TMONID, X.CIADES, ' +
         'CASE WHEN C.TMONID=' + QuotedStr(DM1.wTMonLoc) + ' THEN ' +
     //'SUM(DET.KDXCNTG*DET.ARTPCG) ELSE 0 END TOTDEBE, '+
      'SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) ELSE ' +
         'SUM(CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) END TOTDEBE, ' +
         '0.00 TOTHABER, ''S'' FLAG, ''D'' DCPDH ' +
         'FROM LOG315 DET ' +
         'LEFT JOIN TGE205 ART ON (DET.CIAID=ART.CIAID AND DET.ARTID=ART.ARTID) ' +
         'LEFT JOIN TGE208 T ON (T.TRIID=DET.TRIID) ' +
         'LEFT JOIN TGE101 X ON (X.CIAID=DET.CIAID) ' +
         'LEFT JOIN TGE131 L ON (L.CIAID=DET.CIAID AND L.GRARID=DET.GRARID) ';

      If DM1.cdsPadre.FieldByName('FLGCORP').AsString = 'S' Then
         xSQL := xSQL +
            'LEFT JOIN FAC303 GUIA ON (DET.CIAID=GUIA.CIAID AND DET.NISAID=GUIA.SERIENGUIA AND DET.TRIID=GUIA.TRIID) ';
      xSQL := xSQL +
         'INNER JOIN LOG205 D ON (D.CIAID=DET.CIAID AND D.TRIID=DET.TRIID AND D.TINID=DET.TINID AND D.GRARID=DET.GRARID) ' +
         'LEFT JOIN LOG204 C ON (C.CIAID=D.CIAID AND C.ASIENTO=D.ASIENTO AND C.GRUPO=D.GRUPO AND C.SGRUPO=D.SGRUPO AND C.TRIID=D.TRIID) ' +
         'WHERE DET.CIAID=' + QuotedStr(dm1.cdsPadre.FieldByName('CIAID').AsString) + ' ' +
         'AND MONTH(DET.NISAFREG)=' + IntToStr(StrToInt(dbseMes.Text)) + ' ' +
         'AND YEAR(DET.NISAFREG)=' + IntToStr(StrToInt(dbseAno.Text)) + ' ' +
         'AND COALESCE(DET.NISSIT,'''')=''ACEPTADO'' ' +
         'AND DET.TRIID=' + QuotedStr(dm1.cdsHijo.FieldByName('TRIID').AsString) + ' ';
      If DM1.cdsPadre.FieldByName('FLGCORP').AsString = 'S' Then
         xSQL := xSQL +
            'AND GUIA.VEID=' + Quotedstr(sVeid) + ' ';

      xSQL := xSQL +
         'AND C.CIAID=' + QuotedStr(dm1.cdsHijo.FieldByName('CIAID').AsString) + ' ' +
         'AND C.ASIENTO=' + QuotedStr(dm1.cdsHijo.FieldByName('ASIENTO').AsString) + ' ' +
         'AND C.GRUPO=' + QuotedStr(dm1.cdsHijo.FieldByName('GRUPO').AsString) + ' ' +
         'AND C.SGRUPO=' + QuotedStr(dm1.cdsHijo.FieldByName('SGRUPO').AsString) + ' ' +
         'AND C.TINID=' + QuotedStr(dm1.cdsHijo.FieldByName('TINID').AsString) + ' ' +
         'AND C.TRIID=' + QuotedStr(dm1.cdsHijo.FieldByName('TRIID').AsString) + ' ' +
         'GROUP BY T.TRISGT, DET.TRIID, T.TRIDES, DET.GRARID, L.GRARDES, ' + xTCtaD + ', D.GRUPO, D.SGRUPO, C.TMONID, X.CIADES ' +

      'UNION ALL ' +

      'SELECT T.TRISGT, DET.TRIID TRIEQUI, T.TRIDES, ''ZZ'' GRARID, C.DESCRIP||'' - ''||RTRIM(M.MESDESL)||' + QuotedStr(' - ' + dbseAno.Text) + ' ' +
         'GRARDES, ' + xTCtaH + ' CUENTA, D.GRUPO, D.SGRUPO, C.TMONID, X.CIADES, 0.00 TOTDEBE, ' +
         'CASE WHEN C.TMONID=' + QuotedStr(DM1.wTMonLoc) + ' THEN ' +
     //'SUM(DET.KDXCNTG*DET.ARTPCG) ELSE 0 END TOTHABER, '+
      'SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) ELSE ' +
         'SUM(CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN DET.KDXCNTG*DET.ARTPCG ELSE 0 END) END TOTHABER, ' +
         '''S'' FLAG, ''H'' DCPDH ' +
         'FROM LOG315 DET ' +
         'LEFT JOIN TGE205 ART ON (DET.CIAID=ART.CIAID AND DET.ARTID=ART.ARTID) ' +
         'LEFT JOIN TGE208 T ON (T.TRIID=DET.TRIID) ' +
         'LEFT JOIN TGE101 X ON (X.CIAID=DET.CIAID) ' +
         'LEFT JOIN TGE131 L ON (L.CIAID=DET.CIAID AND L.GRARID=DET.GRARID) ';
      If DM1.cdsPadre.FieldByName('FLGCORP').AsString = 'S' Then
         xSQL := xSQL +
            'LEFT JOIN FAC303 GUIA ON (DET.CIAID=GUIA.CIAID AND DET.NISAID=GUIA.SERIENGUIA AND DET.TRIID=GUIA.TRIID) ';
      xSQL := xSQL +
         'LEFT JOIN TGE181 M ON (M.MESIDR=' + QuotedStr(dbseMes.Text) + ') ' +
         'INNER JOIN LOG205 D ON (D.CIAID=DET.CIAID AND D.TRIID=DET.TRIID AND D.TINID=DET.TINID AND D.GRARID=DET.GRARID) ' +
         'LEFT JOIN LOG204 C ON (C.CIAID=D.CIAID AND C.ASIENTO=D.ASIENTO AND C.GRUPO=D.GRUPO AND C.SGRUPO=D.SGRUPO AND C.TRIID=D.TRIID) ' +
         'WHERE DET.CIAID=' + QuotedStr(dm1.cdsPadre.FieldByName('CIAID').AsString) + ' ' +
         'AND MONTH(DET.NISAFREG)=' + IntToStr(StrToInt(dbseMes.Text)) + ' ' +
         'AND YEAR(DET.NISAFREG)=' + IntToStr(StrToInt(dbseAno.Text)) + ' ' +
         'AND COALESCE(DET.NISSIT,'''')=''ACEPTADO'' ' +
         'AND DET.TRIID=' + QuotedStr(dm1.cdsHijo.FieldByName('TRIID').AsString) + ' ';
      If DM1.cdsPadre.FieldByName('FLGCORP').AsString = 'S' Then
         xSQL := xSQL +
            'AND GUIA.VEID=' + Quotedstr(sVeid) + ' ';
      xSQL := xSQL +
         'AND C.CIAID=' + QuotedStr(dm1.cdsHijo.FieldByName('CIAID').AsString) + ' ' +
         'AND C.ASIENTO=' + QuotedStr(dm1.cdsHijo.FieldByName('ASIENTO').AsString) + ' ' +
         'AND C.GRUPO=' + QuotedStr(dm1.cdsHijo.FieldByName('GRUPO').AsString) + ' ' +
         'AND C.SGRUPO=' + QuotedStr(dm1.cdsHijo.FieldByName('SGRUPO').AsString) + ' ' +
         'AND C.TINID=' + QuotedStr(dm1.cdsHijo.FieldByName('TINID').AsString) + ' ' +
         'AND C.TRIID=' + QuotedStr(dm1.cdsHijo.FieldByName('TRIID').AsString) + ' ' +
         'GROUP BY T.TRISGT, DET.TRIID, T.TRIDES, C.DESCRIP, M.MESDESL, ' + xTCtaH + ', D.GRUPO, D.SGRUPO, C.TMONID, X.CIADES';

      xSQLON := xSQLON + xSQL;
      dm1.cdsHijo.Next;
   End;

   DM1.cdsReporte.Close;
 //Memo1.Text:=xSQLON + 'ORDER BY GRUPO, GRARID';
   dm1.cdsReporte.DataRequest(xSQLON); // +	'ORDER BY GRUPO, GRARID');
   dm1.cdsReporte.Open;

   dm1.cdsReporte.IndexFieldNames := 'GRUPO;SGRUPO;GRARID';

   If dm1.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := CrDefault;
      ErrorMsg(Caption, 'No Existe Informacin a Mostrar');
      Exit;
   End;

   ppData.DataSource := DM1.dsReporte;

   ppReporte.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DinamicaCtbl.rtm';
   ppReporte.Template.LoadFromFile;
   Screen.Cursor := CrDefault;
 //Diseno.Report:=ppReporte;
 //Diseno.Show;
   ppReporte.Print;
   ppReporte.Stop;

   ppData.DataSource := Nil;
   dm1.cdsReporte.IndexFieldNames := '';
End;

Procedure TFRegDinCtbl.ppReportePreviewFormCreate(Sender: TObject);
Begin
   ppReporte.PreviewForm.ClientHeight := 500;
   ppReporte.PreviewForm.ClientWidth := 650;
   TppViewer(ppReporte.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFRegDinCtbl.dblcGrpArtiDropDown(Sender: TObject);
Begin
   If DM1.cdsGArti.IndexFieldNames <> 'GRARDES' Then
      DM1.cdsGArti.IndexFieldNames := 'GRARDES';
End;

// Inicio de Preview

Procedure TFRegDinCtbl.Z2bbtnPreviewClick(Sender: TObject);
Var
   xSQL, mes, ano, xwhere, MONABR: String;
   TMoneda, mesdes, TDiario: String;
   xTotHaber: DOUBLE;
Begin
   wDinCtbl := 'FORM';
   If DM1.wAdmin = 'G' Then Exit;

   dm1.cdsReporte.IndexFieldNames := '';
   dbseMes.Text := DM1.StrZero(dbseMes.Text, 2);
   xTMes := dbseMes.Text;
   xTAno := dbseAno.Text;

  //if not AsientoCuadra then
   //raise exception.Create('Error : Asiento No Cuadra ');

   xTAutoNum := DM1.DisplayDescrip('prvTGE', 'TGE104', 'AUTONUM', 'TDIARID=' + quotedstr('ZZ'), 'AUTONUM');
   xxNoReg := DM1.UltimoRegistro(xTAutoNum, dblcCia.Text, 'ZZ', xTAno, xTMes);
  //xxNoReg		:= DM1.GrabaUltimoRegistro( xTAutoNum,dblcCia.Text,'ZZ',xTAno,xTMes,StrToInt(xxNoReg) );
   xxNoReg := dm1.StrZero(xxNoReg, 10);

   TDiario := 'ZZ';

  //if DM1.cdsMovCxP.fieldbyname('CP_CONTA').AsString <> 'S' then
   Begin
      xSQL := 'DELETE FROM CNT311 ' +
         'WHERE CIAID=' + quotedstr(dblcCia.text) + ' ' +
         'AND CNTANOMM=' + quotedstr(dbseAno.text + dbseMes.Text) + ' ' +
         'AND TDIARID=' + quotedstr('ZZ') + ' ' +
         'AND CNTCOMPROB=' + quotedstr(dbseAno.text);
      Try
         DM1.DCOM1.AppServer.EjecutaQry(xSql);
      Except
      End;

      xSQL := 'DELETE FROM CNT310 ' +
         'WHERE CIAID=' + quotedstr(dblcCia.text) + ' ' +
         'AND CNTANOMM=' + quotedstr(dbseAno.text + dbseMes.Text) + ' ' +
         'AND TDIARID=' + quotedstr(dbseAno.text) + ' ' +
         'AND CNTCOMPROB=' + quotedstr(dbseAno.text);
      Try
         DM1.DCOM1.AppServer.EjecutaQry(xSql);
      Except
      End;

      DM1.GeneraContab(dblcCia.Text, TDiario, dbseAno.text + dbseMes.Text, xxNoReg, Self, 'P');

    // Se Transfiere la Data Generada en el SOLContabiliza
      dm1.cdsReporte.Data := dm1.cdsMovCNT.data;

      ppData.DataSource := dm1.dsReporte;

      ppReporte.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AlmVoucher.rtm';
      ppReporte.Template.LoadFromFile;

    //pplblDesEstado.caption:='Previo';
      xSQL := 'SELECT CNTGLOSA FROM CNT310 WHERE CIAID=' + quotedstr(dblcCia.text) + ' ' +
         'AND CNTANOMM=' + quotedstr(dbseAno.text + dbseMes.Text) + ' ' +
         'AND TDIARID=' + quotedstr(dbseAno.text) + ' ' +
         'AND CNTCOMPROB=' + quotedstr(dbseAno.text);
      DM1.cdsQry5.close;
      DM1.cdsQry5.ProviderName := 'dspUltTGE';
      DM1.cdsQry5.DataRequest(xsql);
      DM1.cdsQry5.Open;

      pplblTipoCamb.Caption := DM1.CalcTipoCambio(dm1.wTMonExt, StrtoDate(xFec_Sis), dm1.wTipoCambioUsar);

      mes := dbseMes.text;
      ano := dbseAno.text;

      xWhere := 'MESIDR=''' + mes + '''';
      mesdes := DM1.DisplayDescrip('dspTGE', 'TGE181', 'MESDESL', XWHERE, 'MESDESL');

    //pplblAnoMes.Caption  :=mesdes+' '+ano;
      pplblNoCompro.Caption := xxNoReg;
      pplblDesEstado.caption := 'Previo';
   End;

  {if DM1.cdsMovCxP.fieldbyname('CP_CONTA').AsString = 'S' then
  begin
   xsql:='SELECT * FROM CNT301 '
        +'WHERE CIAID='+quotedstr(dblcCia.text) +' AND '
         +'CNTANOMM='+quotedstr(dbseAno.text+dbseMes.Text) +' AND '
         +'TDIARID='+quotedstr(dbseAno.text) +' AND '
         +'CNTCOMPROB='+quotedstr(dbseAno.text)
         +' order by CNT301.CNTREG';
    dm1.cdsCxP.Close;
    dm1.cdsCxP.DataRequest(xSQL);
    dm1.cdsCxP.Open;

    ppdbpPreview.DataSource := dm1.dsCxP;

    pprPreview.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPVoucher.rtm' ;
    pprPreview.template.LoadFromFile ;

    mes:=copy(dm1.cdsCxP.fieldbyname('CNTANOMM').asstring,5,2);
    ano:=copy(dm1.cdsCxP.fieldbyname('CNTANOMM').asstring,1,4);

    xWhere := 'MESIDR='''+mes+'''';
    mesdes := DM1.DisplayDescrip('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');
    pplblAnoMes.Caption  :=mesdes+' '+ano;

    pplblDesEstado.caption:='Contabilizado';
 end;}

  {TMoneda := 'DM1.DisplayDescrip('dspTGE','TGE103','TMON_LOC','TMONID='+quotedstr(dblcTMon.text),'TMON_LOC');
  MONABR:= DM1.DisplayDescrip('dspTGE','TGE103','TMONABR','TMONID='+quotedstr(dblcTMon.text),'TMONABR');

  If TMoneda = 'L' then
  begin
     pplblMonedaDoc.Visible := false;
     ppdbMtoExt.Visible:= false;
     pplblCntTCambio.Visible:= false;
     ppdbCntTCambio.Visible:= false;
  end;}

  // DM1.cdsDetCxP.DisableControls;
   xTotHaber := 0;
   DM1.cdsReporte.First;
   While Not DM1.cdsReporte.Eof Do
   Begin
      If DM1.cdsReporte.FieldByName('CNTDH').AsString = 'H' Then
         xTotHaber := xTotHaber + DM1.FRound(DM1.cdsReporte.Fieldbyname('CNTMTOORI').AsFloat, 15, 2);
      DM1.cdsReporte.Next;
   End;
   DM1.cdsReporte.First;
   pplblMontoImporte.Caption := MONABR + ' ' + FloatToStrF(xTotHaber, ffNumber, 15, 2);

  //pplblMonedaDoc.Caption:= MONABR;
   pplblCiades.Caption := dbeCIA.text;
  //pplblCodProv.Caption 	:= dblcdProv.Text;
   pplblDiarioDes.Caption := DM1.DisplayDescrip('prvSQL', 'TGE104', 'TDIARDES', 'TDIARID=' + QuotedStr(TDiario), 'TDIARDES');
   pplblTDiario.Caption := TDiario;
  //pplblTipoCamb.Caption 	:= pplblTipoCamb.Caption;
  //pplblNoCompro.Caption 	:= meNoReg.text ;
   pplblProveedor.Caption := '';
   pplblCodProv.Caption := '';
  //pplblMonedaDes.caption  := DM1.DisplayDescrip('dspTGE','TGE103','TMONDES','TMONID='+quotedstr(dblcTMon.text),'TMONDES');
   pplblGlosaDes.caption := '';

  //DM1.cdsCxP.IndexFieldNames:='CNTREG';
   Screen.Cursor := crDefault;
 //Diseno.Report:=ppReporte;
 //Diseno.Show;
   pprPreview.Print;
   pprPreview.Stop;
   ppData.DataSource := Nil;

  {DM1.cdsCxP.IndexFieldNames:='';
  DM1.cdsCxP.Close;
  DM1.cdsMovCnt.Close;}
End;

Function TFRegDinCtbl.AsientoCuadra: Boolean;
Var
   xTotDebe, xTotHaber: double;
   xCampoD, xCampoH: String;
Begin
   xTotDebe := 0;
   xTotHaber := 0;
  //if DM1.cdsMovCxP.fieldbyname('TMONID').AsString=DM1.wTMonLoc then
   xCampoD := 'TOTDEBE';
  //else
   xCampoH := 'TOTHABER';

 //DM1.cdsDetCxP.DisableControls;
   DM1.cdsReporte.First;
   While Not DM1.cdsReporte.Eof Do
   Begin
      If DM1.cdsReporte.FieldByName('DCPDH').AsString = 'D' Then
         xTotDebe := xTotDebe + dm1.FRound(DM1.cdsReporte.Fieldbyname(xCampoD).AsFloat, 15, 2)
      Else
      Begin
         xTotHaber := xTotHaber + dm1.FRound(DM1.cdsReporte.Fieldbyname(xCampoH).AsFloat, 15, 2);
      End;
      DM1.cdsReporte.Next;
   End;
   DM1.cdsReporte.First;
 //DM1.cdsDetCxP.EnableControls;

   xTotFac := dm1.FRound(xTotHaber, 15, 2);

   Result := dm1.FRound(xTotDebe, 15, 2) = dm1.FRound(xTotHaber, 15, 2);

End;

Procedure TFRegDinCtbl.pprPreviewPreviewFormCreate(Sender: TObject);
Begin
   pprPreview.PreviewForm.ClientHeight := 500;
   pprPreview.PreviewForm.ClientWidth := 650;
   TppViewer(pprPreview.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFRegDinCtbl.Centrala(Var m: TWMWINDOWPOSCHANGED);
Begin
   m.windowpos.x := (Screen.Width - Width) Div 2; {Left/Posicion X}
   m.windowpos.y := (Screen.Height - Height) Div 2; {Left/Posicion X}
End;

End.

