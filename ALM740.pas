Unit ALM740;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ToolWin, ComCtrls, Buttons, ExtCtrls, Math, StdCtrls, wwdblook, ppDB,
   ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppComm,
   ppRelatv, ppProd, ppReport, ppEndUsr, MsgDlgs;

Type
   TFToolParaRepo = Class(TForm)
      pnlPRep: TPanel;
      lblCia: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      Label1: TLabel;
      dblcTIN: TwwDBLookupCombo;
      dbeTIN: TEdit;
      lblAlm: TLabel;
      dblcTALM: TwwDBLookupCombo;
      dbeALM: TEdit;
      Z2bbtnRegOk: TBitBtn;
      cb1: TControlBar;
      spbAct: TSpeedButton;
      spbNor: TSpeedButton;
      spbParRepAut: TSpeedButton;
      ToolBar2: TToolBar;
      spb1: TSpeedButton;
      spb2: TSpeedButton;
      spb3: TSpeedButton;
      lblLoc: TLabel;
      dblcLOC: TwwDBLookupCombo;
      dbeLOC: TEdit;
      Bevel1: TBevel;
      Z1ParamRep: TBitBtn;
      ppRParamRep: TppReport;
      ppDBParamRep: TppDBPipeline;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel7: TppLabel;
      ppLabel5: TppLabel;
      ppLabel8: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      pplblUser: TppLabel;
      ppLine1: TppLine;
      pplblCia: TppLabel;
      ppLabel4: TppLabel;
      ppLabel10: TppLabel;
      ppLabel6: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppFooterBand1: TppFooterBand;
      Timer1: TTimer;
      ppd1: TppDesigner;
      Procedure spbActClick(Sender: TObject);
      Procedure spbParRepAutClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure Z1ParamRepClick(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
      Function ExtracWhere4SQL(sSQL: String): String;
   Public
    { Public declarations }
      Procedure ActSaldos;
      Procedure Edita(sARTID: String);

   End;

Var
   FToolParaRepo: TFToolParaRepo;
   sSQL, xSQL: String;
   xAccesoBotones: Boolean;

Implementation

//uses ALMDM1, ALM401, ALM001, ALM210;
Uses ALMDM1, oaIN2000, ALM401, ALM210;

{$R *.DFM}

{ TFToolParaRepo }

Procedure TFToolParaRepo.ActSaldos;
Begin
   DMALM.cdsParaRepo.Close;
   DMALM.cdsParaRepo.DataRequest(Mtx2000.FMant.SQL);
   DMALM.cdsParaRepo.Open;
End;

Procedure TFToolParaRepo.Edita(sARTID: String);
Var
   cTipo: char;
   sWhere: String;
Begin
   If spbNor.Down Then
      cTipo := 'N' // Uno por Uno
   Else
      cTipo := 'B'; // Update a todo el CDS
   sWhere := '';

   sWhere := 'SELECT * FROM TGE205 '
      + 'WHERE CIAID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('CIAID').AsString)
      + '  AND TINID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('TINID').AsString)
      + '  AND ARTID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('ARTID').AsString);

   DMALM.cdsArti.Close;
   DMALM.cdsArti.DataRequest(sWhere);
   DMALM.cdsArti.Open;

   DMALM.cdsArti.Edit;

   If spb1.Down Then
   Begin
      If cTipo = 'N' Then
      Begin
         FParRepos.pnlIngreso.Height := 189;
         FParRepos.pnlIngreso.Left := 0;
         FParRepos.pnlIngreso.Top := 114;
         FParRepos.pnlIngreso.Width := 225;
      End
      Else
      Begin
         sWhere := ExtracWhere4SQL(Mtx2000.FMant.SQL);
         FParRepos.whereSQL := sWhere;
         FParRepos.pnlIngreso.Height := 187;
         FParRepos.pnlIngreso.Left := 0;
         FParRepos.pnlIngreso.Top := 12;
         FParRepos.pnlIngreso.Width := 414;
      End;
      FParRepos.TipoProceso := cTipo;
      FParRepos.ShowModal; //ALM401
   End;
End;

Function TFToolParaRepo.ExtracWhere4SQL(sSQL: String): String;
Var
   sWhere: String;
   nPosWhere: integer;
   nPosGroupBy, nPosOrderBy: integer;
   nMin: integer;
Begin
   nMin := 0;
   nPosWhere := Pos('WHERE ', sSQL);
   If nPosWhere = 0 Then
   Begin
      result := '';
      exit;
   End;

   nPosGroupBy := Pos('GROUP BY', sSQL);
   nPosOrderBy := Pos('ORDER BY', sSQL);
   If (nPosGroupBy > 0) And (nPosOrderBy > 0) Then
      nMin := length(sSQL) - Min(nPosGroupBy, nPosOrderBy) + 1
   Else
      If (nPosGroupBy = 0) And (nPosOrderBy = 0) Then
         nMin := length(sSQL) - nPosWhere + 1
      Else
      Begin
         If nPosGroupBy = 0 Then
            nMin := length(sSQL) - nPosOrderBy + 3;
         If nPosOrderBy = 0 Then
            nMin := length(sSQL) - nPosGroupBy + 3;
      End;
   If nPosWhere > 0 Then
      sWhere := copy(sSQL, nPosWhere, nMin);
   result := trim(sWhere);
End;

Procedure TFToolParaRepo.spbActClick(Sender: TObject);
Begin
{	if (DMALM.cdsArti.RecNo <= 0) and
    (DMALM.cdsArti.eof) then}

   If (Mtx2000.FMant.cds2.RecNo <= 0) And
      (mtx2000.FMant.cds2.eof) Then
   Begin
      Information(Caption, 'No Existen Registros a Procesar');
      spbAct.Down := false;
      spbNor.Down := true;
      exit;
   End;
  {if application.MessageBox(
      'Todas las operaciones se realizaran sobre todos los registros,' +chr(10)+chr(13)+'                 ¿Aun desea Continuar?                       ',
      'Advertencia', MB_YESNO) = IDNO then
  begin}
   If Not Question(Caption, 'Todas las Operaciones se realizaran sobre todos los Registros,' + #13 + #13 +
      'Desea Continuar') Then
   Begin
      spbAct.Down := false;
      spbNor.Down := true;
   End
   Else
   Begin
      FINMaestros.OnEditParaRepo(Sender, Nil);
   End;
End;

Procedure TFToolParaRepo.spbParRepAutClick(Sender: TObject);
Begin
   If (mtx2000.Fmant.cds2.RecNo <= 0) And
      (mtx2000.Fmant.cds2.eof) Then
   Begin
      Information(Caption, 'No Existen Registros a Procesar');
      spbAct.Down := false;
      spbParRepAut.Down := false;
      spbNor.Down := true;
      exit;
   End;

   Screen.Cursor := crHourGlass;
   Try
      Application.CreateForm(TFParRepAuto, FParRepAuto);
      Screen.Cursor := crDefault;
      FParRepAuto.ShowModal;
   Finally
      FParRepAuto.Free;
   End;
End;

Procedure TFToolParaRepo.Z2bbtnRegOkClick(Sender: TObject);
Begin
   If Length(Trim(dblcTALM.Text)) = 0 Then
   Begin
      sSQL := 'SELECT * FROM TGE205 '
         + 'WHERE TGE205.CIAID=' + QuotedStr(dblcCIA.Text)
         + ' AND TGE205.TINID=' + QuotedStr(dblcTIN.Text);
   End
   Else
   Begin
      sSQL := 'SELECT * FROM TGE205 '
         + 'WHERE TGE205.CIAID=' + QuotedStr(dblcCIA.Text)
         + ' AND TGE205.TINID=' + QuotedStr(dblcTIN.Text);
//        'AND ALMID='+QuotedStr(dblcTALM.Text);
   End;

   mtx2000.UsuarioSQL.Clear;
   mtx2000.FMant.wTabla := 'TGE205';
   mtx2000.UsuarioSQL.Add(sSQL);
   mtx2000.NewQuery;
  //mtx2000.FMant.dbgFiltro.SelectedList.clear;
End;

Procedure TFToolParaRepo.dblcCIAExit(Sender: TObject);
Var
   sCIA: String;
Begin
   sCIA := dblcCIA.Text;
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(sCIA), 'CIADES');

   xSQL := 'SELECT * FROM TGE126 WHERE CIAID=' + quotedstr(dblcCIA.text);
   DMALM.cdsLOC.Close;
   DMALM.cdsLOC.DataRequest(xSQL);
   DMALM.cdsLOC.open;
End;

Procedure TFToolParaRepo.dblcLOCExit(Sender: TObject);
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeLoc.Text := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE152 WHERE ' + xSQL;
   DMALM.cdsTINID.Close;
   DMALM.cdsTINID.DataRequest(xSQL);
   DMALM.cdsTINID.open;
End;

Procedure TFToolParaRepo.dblcTINExit(Sender: TObject);
Begin
   xSQL := 'TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeTIN.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE151 WHERE ' + xSQL + ' ORDER BY ALMID';
   DMALM.cdsALM.Close;
   DMALM.cdsALM.DataRequest(xSQL);
   DMALM.cdsALM.open;
End;

Procedure TFToolParaRepo.dblcTALMExit(Sender: TObject);
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIn.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALM.text);
   dbeALM.text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');
End;

Procedure TFToolParaRepo.Z1ParamRepClick(Sender: TObject);
Var
   xSQL, xWhere: String;
   iX, iY: Integer;
   YH, MH, DH: word;
Begin
   // VHNDEMA

   DecodeDate(Date, YH, MH, DH);

   xSQL := Mtx2000.FMant.SQL;
   For iX := 0 To Length(xsql) Do
   Begin
      If copy(xSQL, iX, 5) = 'WHERE' Then
      Begin
         xwhere := copy(xSQL, iX + 6, length(xSQL));
         break;
      End;
   End;
   For iY := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iY, 8) = 'ORDER BY' Then
      Begin
         xwhere := copy(xWhere, 1, iY - 2);
         break;
      End;
   End;

{
SELECT TGE205.CIAID, TGE205.TINID, TGE205.GRARID, TGE205.FAMID, TGE205.SFAMID,
       TGE205.ARTID, LOG316.ALMID, SUM(LOG316.STKSACTG) STKSACTG,
       SUM(NVL(STKSMAX,0)) STKSMAX, SUM(NVL(STKSMIN,0)) STKSMIN, SUM(NVL(STKSPRE,0)) STKSPRE,
       SUM(NVL(STKSCPE,0)) STKSCPE, SUM(NVL(ARTPCU,0)) ARTPCU, SUM(NVL(ARTCNTG,0)) ARTCNTG
FROM TGE205, LOG316
WHERE TGE205.CIAID='04' AND TGE205.TINID='20'
  AND LOG316.STKANO(+)='2005' AND LOG316.ALMID='13'
  AND LOG316.CIAID(+)=TGE205.CIAID
  AND LOG316.ARTID(+)=TGE205.ARTID
GROUP BY TGE205.CIAID, TGE205.TINID, TGE205.GRARID, TGE205.FAMID, TGE205.SFAMID,
         TGE205.ARTID, LOG316.ALMID
  }
   xSQL := 'SELECT TGE205.CIAID, TGE205.TINID, TGE205.GRARID, TGE205.FAMID, TGE205.SFAMID, '
      + 'TGE205.ARTID, LOG316.ALMID, SUM(LOG316.STKSACTG) STKSACTG, '
      + 'SUM(NVL(STKSMAX,0)) STKSMAX, SUM(NVL(STKSMIN,0)) STKSMIN, SUM(NVL(STKSPRE,0)) STKSPRE, '
      + 'SUM(NVL(STKSCPE,0)) STKSCPE, SUM(NVL(ARTPCU,0)) ARTPCU, SUM(NVL(ARTCNTG,0)) ARTCNTG '
      + 'FROM TGE205, LOG316 ';
   If Length(xWhere) > 0 Then
      xSQL := xSQL + 'WHERE ' + xWhere + ' AND LOG316.STKANO=''' + InttoStr(YH) + ''' '
         + 'AND LOG316.ALMID LIKE ''' + dblcTALM.text + '%'' '
         + 'AND LOG316.CIAID=TGE205.CIAID AND LOG316.ARTID=TGE205.ARTID '
   Else
      xSQL := xSQL + 'WHERE LOG316.STKANO=''' + InttoStr(YH) + ''' '
         + 'AND LOG316.CIAID=TGE205.CIAID AND LOG316.ARTID=TGE205.ARTID ';

   xSQL := xSQL + 'GROUP BY TGE205.CIAID, TGE205.TINID, TGE205.GRARID, TGE205.FAMID, '
      + 'TGE205.SFAMID, TGE205.ARTID, LOG316.ALMID';

  //if DMALM.cdsArti.RecordCount>0 then
   If mtx2000.Fmant.cds2.RecordCount > 0 Then
   Begin
      //xSQL
      DMALM.cdsReporte.Close;
      DMALM.cdsReporte.DataRequest(xSQL);
      DMALM.cdsReporte.Open;

      ppDBParamRep.DataSource := DMALM.dsReporte;

      ppRParamRep.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ParametroProyectado.Rtm';
      ppRParamRep.Template.LoadFromFile;

      pplblCia.Caption := FToolParaRepo.dbeCIA.text;

      If DMALM.wUsuario = 'HNORIEGA' Then
         ppd1.ShowModal
      Else
         ppRParamRep.Print;
   End;
   // END VHNDEMA
End;

Procedure TFToolParaRepo.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolParaRepo';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolParaRepo);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

End.

