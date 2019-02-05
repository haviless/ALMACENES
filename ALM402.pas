Unit ALM402;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Mant, Mask, wwdbedit, StdCtrls, wwdblook, Buttons, wwDialog, wwidlg, Db,
   DBClient, wwclient, Wwdbdlg, ExtCtrls, MsgDlgs;

Type
   TFUbicacion = Class(TForm)
      pnlPrincipal: TPanel;
      lblArticulo: TLabel;
      dbeArti: TwwDBEdit;
      Label1: TLabel;
      edtUMedG: TwwDBEdit;
      Label2: TLabel;
      wwDBEdit2: TwwDBEdit;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      pnlIngreso: TPanel;
      lblSGen: TLabel;
      dblcUbicacion: TwwDBLookupCombo;
      Label3: TLabel;
      wwDBEdit3: TwwDBEdit;
      edtUMed: TEdit;
      dbeUbicacion: TEdit;
      Procedure bbtnCancClick(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure dbeUbicacionExit(Sender: TObject);
      Procedure dblcUbicacionExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormActivate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure edtUMedGExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      WhereSQL: String;
      TipoProceso: char;
   End;

Var
   FUbicacion: TFUbicacion;

Implementation

//uses ALMDM1, ALM001;
Uses ALMDM1, oaIN2000;

{$R *.DFM}

Procedure TFUbicacion.bbtnCancClick(Sender: TObject);
Begin
   DMALM.cdsSaldos.CancelUpdates;
   Close;
End;

Procedure TFUbicacion.bbtnOkClick(Sender: TObject);
Var
   xWhe, sSQL, sCIA, slOC, sALM, sUBI: String;
Begin
   If Length(Trim(dbeUbicacion.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, ' El Campo Ubicación No Existe ');
      DMALM.cdsSaldos.CancelUpdates;
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   If TipoProceso = 'B' Then
   Begin
      sSQL := 'UPDATE LOG316 SET ';
      sSQL := sSQL + ' UBID=' + quotedStr(trim(dblcUbicacion.Text))
         + 'WHERE CIAID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('CIAID').AsString)
         + '  AND LOCID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('LOCID').AsString)
         + '  AND TINID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('TINID').AsString)
         + '  AND ALMID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('ALMID').AsString)
         + '  AND ARTID=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('ARTID').AsString)
         + '  AND STKANO=' + QuotedStr(Mtx2000.FMant.cds2.FieldByName('STKANO').AsString);
//    if WhereSQL <> '' then
//      sSQL := sSQL + ' '+WhereSQL;
      DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
//  	Mtx.RefreshFilter;
      close;
      exit;
   End;
   DMALM.cdsSaldos.Post;
{
  sSQL:='SELECT * FROM LOG316 WHERE ARTID='''+dbeArti.Text+'''';
  DMALM.cdsSaldos.DataRequest(sSQl);
  //DMALM.ControlTran;
  DMALM.ControlTran( 0, nil, '' );
  DMALM.cdsSaldos.Next;
}
   Mtx2000.FMant.cds2.Next;

   sCIA := Mtx2000.FMant.cds2.FieldByName('CIAID').AsString;
   sLOC := Mtx2000.FMant.cds2.FieldByName('LOCID').AsString;
   sALM := Mtx2000.FMant.cds2.FieldByName('ALMID').AsString;
   sUBI := Mtx2000.FMant.cds2.FieldByName('UBID').AsString;
   sSQL := 'CIAID=''' + sCIA + ''' AND LOCID= ''' + sLOC + ''' AND ALMID=''' + sALM + ''' AND UBID=''' + sUBI + '''';
   dbeUbicacion.Text := DMALM.DisplayDescrip('prvLOG', 'LOG103', 'UBIDES', sSQL, 'UBIDES');

   xWhe := 'CIAID=''' + sCIA + ''' AND LOCID= ''' + sLOC + ''' AND ALMID=''' + sALM + '''';
   sSQL := 'SELECT * FROM LOG103 WHERE ' + xWhe + ' ORDER BY UBID';
   DMALM.FiltraCDS(DMALM.cdsUbicacion, sSQL);

   edtUMedG.OnExit(edtUMedG);
   Screen.Cursor := crDefault;
End;

Procedure TFUbicacion.dbeUbicacionExit(Sender: TObject);
//var  wmod, wres : double;
Begin
   If DMALM.cdsSaldos.FieldByName('STKSFISU').value > DMALM.cdsSaldos.FieldByName('ARTCONT').value Then
   Begin
    //while wmod > 1 then
      Begin
      //wmod:=DMALM.cdsSaldosSTKSFISU.value / DMALM.cdsSaldosARTCONT.value;
      //wres:=DMALM.cdsSaldosSTKSFISU.value div DMALM.cdsSaldosARTCONT.value;
      End;
   End;
End;

Procedure TFUbicacion.dblcUbicacionExit(Sender: TObject);
Var
   sSQL, sCIA, slOC, sALM, sUBI: String;
Begin
   If bbtnCanc.Focused Then exit;
   If trim(dblcUbicacion.Text) = '' Then
   Begin
      dbeUbicacion.Text := '';
      Exit;
   End;
   sCIA := DMALM.cdsSaldos.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsSaldos.FieldByName('LOCID').AsString;
   sALM := DMALM.cdsSaldos.FieldByName('ALMID').AsString;
   sUBI := DMALM.cdsSaldos.FieldByName('UBID').AsString;
   sSQL := 'CIAID=''' + sCIA + ''' AND LOCID= ''' + sLOC + ''' AND ALMID=''' + sALM + ''' AND UBID=''' + sUBI + '''';
   dbeUbicacion.Text := DMALM.DisplayDescrip('prvLOG', 'LOG103', 'UBIDES', sSQL, 'UBIDES');
End;

Procedure TFUbicacion.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMALM.cdsUbicacion.close;
   //FVariables.w_IN_Registro := False;
//   FVariables.w_Num_Formas := FVariables.w_Num_Formas-1;
//   Action := CAFree;
End;

Procedure TFUbicacion.FormActivate(Sender: TObject);
Var
   xWhe, sSQL, sCIA, slOC, sALM, sUBI: String;
Begin
  //sSQL := 'SELECT * FROM LOG103 WHERE CIAID = ''' + DMALM.cdsSaldos.fieldbyname('CIAID').AsString +
 //                             ''' AND LOCID = ''' + DMALM.cdsSaldos.fieldbyname('LOCID').AsString +
 //                             ''' AND ALMID = ''' + DMALM.cdsSaldos.fieldbyname('ALMID').AsString +''' ';

   sCIA := DMALM.cdsSaldos.FieldByName('CIAID').AsString;
   sLOC := DMALM.cdsSaldos.FieldByName('LOCID').AsString;
   sALM := DMALM.cdsSaldos.FieldByName('ALMID').AsString;
   sUBI := DMALM.cdsSaldos.FieldByName('UBID').AsString;

   xWhe := 'CIAID=''' + sCIA + ''' AND LOCID= ''' + sLOC + ''' AND ALMID=''' + sALM + '''';
   sSQl := 'SELECT * FROM LOG103 WHERE ' + xWhe + ' ORDER BY UBID';
   DMALM.FiltraCDS(DMALM.cdsUbicacion, sSQL);

   sSQL := 'CIAID=''' + sCIA + ''' AND LOCID= ''' + sLOC + ''' AND ALMID=''' + sALM + ''' AND UBID=''' + sUBI + '''';
   dbeUbicacion.Text := DMALM.DisplayDescrip('prvLOG', 'LOG103', 'UBIDES', sSQL, 'UBIDES');
   edtUMedG.OnExit(edtUMedG);
   dblcUbicacion.SetFocus;
End;

Procedure TFUbicacion.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFUbicacion.edtUMedGExit(Sender: TObject);
Begin
   edtUMed.Text := DMALM.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID=''' + edtUMedG.Text + '''', 'UNMDES');
End;

Procedure TFUbicacion.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
End;

End.

