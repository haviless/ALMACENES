Unit ALM401;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Mant, Mask, wwdbedit, StdCtrls, wwdblook, Buttons, wwDialog, wwidlg, Db,
   DBClient, wwclient, Wwdbdlg, ExtCtrls, MsgDlgs;

Type
   TFParRepos = Class(TForm)
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
      dbeStkMaxG: TwwDBEdit;
      lblSUni: TLabel;
      dbeStkMinG: TwwDBEdit;
      Label5: TLabel;
      Label6: TLabel;
      dbeStkPuped: TwwDBEdit;
      dbeStkLotec: TwwDBEdit;
      Label7: TLabel;
      wwDBEdit3: TwwDBEdit;
      edtUMed: TEdit;
      lblSAG: TLabel;
      lblSAU: TLabel;
      lblSOCKACT: TLabel;
      dbeSAG: TwwDBEdit;
      dbeSAU: TwwDBEdit;
      Label3: TLabel;
      dbeCVida: TwwDBEdit;
      Label4: TLabel;
      Procedure bbtnCancClick(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure edtUMedGExit(Sender: TObject);
      Procedure dbeStkMaxGExit(Sender: TObject);
      Procedure dbeStkMinGExit(Sender: TObject);
      Procedure dbeStkPupedExit(Sender: TObject);
      Procedure dbeStkLotecExit(Sender: TObject);
      Procedure dbeCVidaExit(Sender: TObject);
      Procedure ValidaNumeros(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
      Function Valida: Boolean;
      Procedure CargaDataSource;
   Public
    { Public declarations }
      WhereSQL: String;
      TipoProceso: char;
   End;

Var
   FParRepos: TFParRepos;

Implementation

//uses ALMDM1, ALM001;
//uses ALMDM1, oaIN1000;
Uses ALMDM1, oaIN2000;

{$R *.DFM}

Procedure TFParRepos.bbtnCancClick(Sender: TObject);
Begin
   DMALM.cdsArti.CancelUpdates;
   Close;
End;

Procedure TFParRepos.bbtnOkClick(Sender: TObject);
Var
   sSQL: String;
Begin
   If Not Valida Then Exit; // Valida que Cabecera Tenga Datos Correctos

   If TipoProceso = 'B' Then
   Begin
      Screen.Cursor := crHourGlass;
      sSQL := 'UPDATE TGE205 SET ';
      If trim(dbeStkMaxG.text) = '' Then dbeStkMaxG.text := '0';
      sSQL := sSQL + 'STKSMAX=' + dbeStkMaxG.text;
      If trim(dbeStkMinG.text) = '' Then dbeStkMinG.text := '0';
      sSQL := sSQL + ', STKSMIN=' + dbeStkMaxG.text;
      If trim(dbeStkPuped.text) = '' Then dbeStkPuped.text := '0';
      sSQL := sSQL + ', STKSPRE=' + dbeStkPuped.text;
      If trim(dbeStkLotec.text) = '' Then dbeStkLotec.text := '0';
      sSQL := sSQL + ', STKSCPE=' + dbeStkLotec.text;
      If trim(dbeCVida.text) = '' Then dbeCVida.text := '0';
      sSQL := sSQL + ', ARTCVIDA=' + dbeCVida.text;

      If WhereSQL = '' Then
         sSQL := sSQL + ' ' + WhereSQL // + ' WHERE ARTCONT=1'
      Else
         sSQL := sSQL + ' ' + WhereSQL; // + ' AND ARTCONT=1';
      DMALM.DCOM1.AppServer.EjecutaSQL(SSQL);
      Mtx2000.RefreshFilter;
      Screen.Cursor := crDefault;
      Close;
      Exit;
   End;

  {if (strtofloat(StringReplace(dbeStkPuped.Text,',','',[rfReplaceAll])) >= strtofloat(StringReplace(dbeStkMinG.Text,',','',[rfReplaceAll]))) and
     (strtofloat(StringReplace(dbeStkPuped.Text,',','',[rfReplaceAll])) <= strtofloat(StringReplace(dbeStkMaxG.Text,',','',[rfReplaceAll]))) then
  begin
  end
  else
  begin
    ErrorMsg(Caption, 'La Cantidad a Reponer no puede ser Mayor a la Cant. Max. y Menor a la Cant. Min. ');
    Exit;
  end;}

   Screen.Cursor := crHourGlass;
   DMALM.cdsArti.Post;

   sSQL := 'SELECT * FROM TGE205 WHERE ARTID=''' + dbeArti.Text + '''';
   DMALM.cdsArti.DataRequest(sSQl);

  //DMALM.ControlTran;
   DMALM.ControlTran(0, Nil, '');

   DMALM.cdsArti.Next;
   If Not DMALM.cdsArti.eof Then
   Begin
      DMALM.cdsArti.Edit;
      dbeStkMaxG.SetFocus;
   End
   Else
      Close;
   Screen.Cursor := crDefault;
End;

Function TFParRepos.Valida: Boolean;
Var
   xCant: double;
Begin
   Result := False;
   If StrToFloat(StringReplace(dbeStkMaxG.Text, ',', '', [rfReplaceAll])) < StrToFloat(StringReplace(dbeStkMinG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'la Cantidad Maxima No puede Ser Menor a la Cantidad Minima');
      Exit;
   End;

   If StrToFloat(StringReplace(dbeStkMinG.Text, ',', '', [rfReplaceAll])) > StrToFloat(StringReplace(dbeStkMaxG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'la Cantidad Minima No puede Ser Mayor a la Cantidad Maxima');
      Exit;
   End;

   If Length(Trim(dbeStkPuped.Text)) = 0 Then
      DMALM.cdsArti.FieldByName('STKSPRE').AsFloat := 0;

   If StrToFloat(StringReplace(dbeStkPuped.Text, ',', '', [rfReplaceAll])) < StrToFloat(StringReplace(dbeStkMinG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'El Punto de Reposición no puede ser Menor al Stock Minimo');
      Exit;
   End;

   If StrToFloat(StringReplace(dbeStkPuped.Text, ',', '', [rfReplaceAll])) > StrToFloat(StringReplace(dbeStkMaxG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'El Punto de Reposición no puede ser Mayor al Stock Maximo');
      Exit;
   End;

   If Length(Trim(dbeStkLotec.Text)) = 0 Then
      DMALM.cdsArti.FieldByName('STKSCPE').AsFloat := 0;

   If StrToFloat(StringReplace(dbeStkLotec.Text, ',', '', [rfReplaceAll])) = 0 Then
   Begin
      ErrorMsg(Caption, 'Cantidad debe ser Mayor a Cero');
      Exit;
   End;

   xCant := StrToFloat(StringReplace(dbeStkMaxG.Text, ',', '', [rfReplaceAll])) - StrToFloat(StringReplace(dbeStkMinG.Text, ',', '', [rfReplaceAll]));

   If xCant < StrToFloat(StringReplace(dbeStkLotec.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'La Cantidad a Reponer no Puede ser Mayor a ' + FloattoStr(xCant));
      Exit;
   End;
   Result := True;
End;

Procedure TFParRepos.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFParRepos.edtUMedGExit(Sender: TObject);
Begin
   edtUMed.Text := DMALM.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID=''' + edtUMedG.Text + '''', 'UNMDES');
End;

Procedure TFParRepos.dbeStkMaxGExit(Sender: TObject);
Begin
   If bbtnCanc.Focused Then exit;

   If StrToFloat(StringReplace(dbeStkMaxG.text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg(Caption, 'Ingrese una cantidad positiva');
      exit;
   End;

   If StrToFloat(StringReplace(dbeStkMaxG.Text, ',', '', [rfReplaceAll])) < StrToFloat(StringReplace(dbeStkMinG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'la Cantidad Maxima No puede Ser Menor a la Cantidad Minima');
      exit;
   End;

  {if (strtofloat(StringReplace(dbeStkPuped.Text,',','',[rfReplaceAll])) >= strtofloat(StringReplace(dbeStkMinG.Text,',','',[rfReplaceAll]))) and
     (strtofloat(StringReplace(dbeStkPuped.Text,',','',[rfReplaceAll])) <= strtofloat(StringReplace(dbeStkMaxG.Text,',','',[rfReplaceAll]))) then
  begin
  end
  else
  begin
    ErrorMsg(Caption, 'La Cantidad a Reponer no puede ser Mayor a la Cant. Max. y Menor a la Cant. Min. ');
    //dbeSRepG.SetFocus;
  end}
End;

Procedure TFParRepos.dbeStkMinGExit(Sender: TObject);
Begin
   If bbtnCanc.Focused Then exit;

   If StrToFloat(StringReplace(dbeStkMinG.text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg(Caption, 'Ingrese una cantidad positiva');
      exit;
   End;

   If StrToFloat(StringReplace(dbeStkMinG.Text, ',', '', [rfReplaceAll])) > StrToFloat(StringReplace(dbeStkMaxG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'la Cantidad Minima No puede Ser Mayor a la Cantidad Maxima');
      exit;
   End;

  {if trim((sender as TwwDBEdit).text) < '0' then
  begin
    (sender as TwwDBEdit).text := '0'
  end;}
End;

Procedure TFParRepos.dbeStkPupedExit(Sender: TObject);
Begin
   If bbtnCanc.Focused Then exit;

   If Length(Trim(dbeStkPuped.Text)) = 0 Then
      DMALM.cdsArti.FieldByName('STKSPRE').AsFloat := 0;

   If StrToFloat(StringReplace(dbeStkPuped.text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg(Caption, 'Ingrese una cantidad positiva');
      exit;
   End;

   If StrToFloat(StringReplace(dbeStkPuped.Text, ',', '', [rfReplaceAll])) < StrToFloat(StringReplace(dbeStkMinG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'El Punto de Reposición no puede ser Menor al Stock Minimo');
      exit;
   End;

   If StrToFloat(StringReplace(dbeStkPuped.Text, ',', '', [rfReplaceAll])) > StrToFloat(StringReplace(dbeStkMaxG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'El Punto de Reposición no puede ser Mayor al Stock Maximo');
      exit;
   End;

  {if (strtofloat(StringReplace(dbeStkPuped.Text,',','',[rfReplaceAll])) >= strtofloat(StringReplace(dbeStkMinG.Text,',','',[rfReplaceAll]))) and
     (strtofloat(StringReplace(dbeStkPuped.Text,',','',[rfReplaceAll])) <= strtofloat(StringReplace(dbeStkMaxG.Text,',','',[rfReplaceAll]))) then
  begin
  end
  else
  begin
    ErrorMsg(Caption, 'La Cantidad a Reponer no puede ser Mayor a la Cant. Max. y Menor a la Cant. Min. ');
    //dbeSRepG.SetFocus;
  end}
End;

Procedure TFParRepos.dbeStkLotecExit(Sender: TObject);
Var
   xCant: double;
Begin
   If bbtnCanc.Focused Then exit;

   If Length(Trim(dbeStkLotec.Text)) = 0 Then
      DMALM.cdsArti.FieldByName('STKSCPE').AsFloat := 0;

   If StrToFloat(StringReplace(dbeStkLotec.text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg(Caption, 'Ingrese una cantidad positiva');
      exit;
   End;

   xCant := StrToFloat(StringReplace(dbeStkMaxG.Text, ',', '', [rfReplaceAll])) - StrToFloat(StringReplace(dbeStkMinG.Text, ',', '', [rfReplaceAll]));

   If xCant < StrToFloat(StringReplace(dbeStkLotec.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg(Caption, 'La Cantidad a Reponer no Puede ser Mayor a ' + FloattoStr(xCant));
      exit;
   End;
End;

Procedure TFParRepos.dbeCVidaExit(Sender: TObject);
Begin
   If StrToFloat(StringReplace(dbeCVida.text, ',', '', [rfReplaceAll])) < 0 Then
      ErrorMsg(Caption, 'Ingrese una cantidad positiva');
End;

Procedure TFParRepos.ValidaNumeros(Sender: TObject; Var Key: Char);
Begin
   If key In ['-', '.'] Then
      Case key Of
         '-':
            If (length((sender As TwwDBEdit).Text) > 0) Then
               If ((pos('-', (sender As TwwDBEdit).Text) <> 0) Or
                  ((sender As TwwDBEdit).SelStart > 0))
                  And
                  ((sender As TwwDBEdit).SelLength <> length((sender As TwwDBEdit).Text)) Then key := #0;
         '.':
            If ((pos('.', (sender As TwwDBEdit).Text) <> 0) And
               (pos('.', (sender As TwwDBEdit).SelText) <> 0))
            Xor
               (pos('.', (sender As TwwDBEdit).Text) <> 0) Or
               ((length((sender As TwwDBEdit).Text) > 0) And
               ((sender As TwwDBEdit).Text[length((sender As TwwDBEdit).Text)] = '-')) Or
            ((sender As TwwDBEdit).SelLength = length((sender As TwwDBEdit).Text)) Or
               ((sender As TwwDBEdit).SelStart = 0) Then key := #0;
      End
   Else
      If Not (key In ['0'..'9', #8]) Then key := #0;
End;

Procedure TFParRepos.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
   edtUMedG.OnExit(edtUMedG);
   dbeStkMaxG.SetFocus;
End;

Procedure TFParRepos.FormCreate(Sender: TObject);
Begin
   CargaDataSource;
End;

Procedure TFParRepos.CargaDataSource;
Begin
   dbeArti.DataSource := DMALM.dsArti;
   edtUMedG.DataSource := DMALM.dsArti;
   wwDBEdit2.DataSource := DMALM.dsArti;
   wwDBEdit3.DataSource := DMALM.dsArti;
   dbeSAG.DataSource := DMALM.dsArti;
   dbeSAU.DataSource := DMALM.dsArti;
   dbeStkMaxG.DataSource := DMALM.dsArti;
   dbeStkMinG.DataSource := DMALM.dsArti;
   dbeStkPuped.DataSource := DMALM.dsArti;
   dbeStkLotec.DataSource := DMALM.dsArti;
   dbeCVida.DataSource := DMALM.dsArti;
End;

Procedure TFParRepos.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   //FVariables.w_IN_Registro := False;
//   FVariables.w_Num_Formas := FVariables.w_Num_Formas-1;
//   Action := CAFree;
End;

End.

