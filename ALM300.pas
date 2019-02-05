Unit ALM300;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   ALM300
// Formulario           :   FInventario
// Fecha de Creación    :
// Autor                :   Equipo de Desarrollo
// Objetivo             :   Captura de Datos para Toma de Inventario
// HPC_201404_ALM   24/10/2014 Unificación de módulos de Inventarios
//                  13/11/2014 Reordenamiento de Formulario
//                             Ajustes para Toma de Inventario 2014Nov
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Mant, Mask, wwdbedit, StdCtrls, wwdblook, Buttons, wwDialog, wwidlg, Db,
   DBClient, wwclient, Wwdbdlg, ExtCtrls, MsgDlgs, fcImage, fcimageform, variants,
   Grids, Wwdbigrd, Wwdbgrid;

Type
   TFInventario = Class(TForm)
      pnlPrincipal: TPanel;
      lblArticulo: TLabel;
    //Inicio HPC_201404_ALM
    //dbeDescripcion: TwwDBEdit;
      dbeArtId: TwwDBEdit;
      Label1: TLabel;
    //wwDBEdit1: TwwDBEdit;
    //Label2: TLabel;
    //wwDBEdit2: TwwDBEdit;

      dbeUMed: TwwDBEdit;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      pnlIngreso: TPanel;
      lblSGen: TLabel;
    //dbeGeneral: TwwDBEdit;
      dbeStock: TwwDBEdit;
      Label3: TLabel;
    //wwDBEdit3: TwwDBEdit;
      dbeArtDes: TwwDBEdit;
      Panel1: TPanel;
      Label4: TLabel;
      dblcdArt: TwwDBLookupComboDlg;
      bbtnBuscar: TBitBtn;
    //BitBtn1: TBitBtn;
    //BitBtn2: TBitBtn;
      bbtnArtAnterior: TBitBtn;
      bbtnArtSiguiente: TBitBtn;
    //Final HPC_201404_ALM
      Panel2: TPanel;
      Label5: TLabel;
      dbgDetReg: TwwDBGrid;
      bbtnFilReg: TBitBtn;
      cbEstado: TCheckBox;
      Label6: TLabel;
      Procedure bbtnCancClick(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
  //Inicio HPC_201404_ALM
    //Procedure dbeUnitarioExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnBuscarClick(Sender: TObject);
    //Procedure BitBtn1Click(Sender: TObject);
    //Procedure BitBtn2Click(Sender: TObject);
      Procedure bbtnArtAnteriorClick(Sender: TObject);
      Procedure bbtnArtSiguienteClick(Sender: TObject);
      Procedure bbtnFilRegClick(Sender: TObject);
      Procedure dbgDetRegKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgDetRegCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dblcdArtCloseDialog(Dialog: TwwLookupDlg);
  //Final HPC_201404_ALM
   Private
    { Private declarations }
   Public
    { Public declarations }
      Procedure EditaArticulo;
   End;

Var
   FInventario: TFInventario;

Implementation

Uses ALMDM1, oaIN5000;

{$R *.DFM}

Procedure TFInventario.bbtnCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFInventario.bbtnOkClick(Sender: TObject);
Var
   xCont: double;
   xSQL, sEstado: String;
Begin
// Inicio HPC_201404_ALM
   Try
      If Length(trim(dbeStock.Text)) = 0 Then
      Begin
         dbeStock.Text := '0';
         ShowMessage('No se puede registrar valor NULO');
         Exit;
      End;
      If StrToInt(trim(dbeStock.Text)) < 0 Then
      Begin
         dbeStock.Text := '0';
         ShowMessage('No se puede registrar valor NEGATIVO');
         Exit;
      End;
   Except;
      dbeStock.Text := '0';
      ShowMessage('Error al registrar');
      Exit;
   End;
// Final HPC_201404_ALM
   Screen.Cursor := crHourGlass;

   If cbEstado.Checked Then
      sEstado := 'OK'
   Else
      sEstado := 'MAL ESTADO';

   Try
   // Inicio HPC_201404_ALM
      xSQL := 'Insert into DB2ADMIN.LOG_INV_DET_REG(TOINID, STKANO, CIAID, LOCID, TINID, ALMID, GRARID, '
         + '                                     FAMID, SFAMID, ARTID, ITEM, CANTIDAD, ESTADO, USUINV, FECINV) '
         + 'Values( '
         + QuotedStr(DMALM.cdsDInventario.FieldByName('TOINID').AsString) + ', '
         + QuotedStr(DMALM.cdsDInventario.FieldByName('STKANO').AsString) + ', '
         + QuotedStr(DMALM.cdsDInventario.FieldByName('CIAID').AsString) + ', '
         + QuotedStr(DMALM.cdsDInventario.FieldByName('LOCID').AsString) + ', '
         + QuotedStr(DMALM.cdsDInventario.FieldByName('TINID').AsString) + ', '
         + QuotedStr(DMALM.cdsDInventario.FieldByName('ALMID').AsString) + ', '
         + QuotedStr(DMALM.cdsDInventario.FieldByName('GRARID').AsString) + ', '
         + QuotedStr(DMALM.cdsDInventario.FieldByName('FAMID').AsString) + ', '
         + QuotedStr(DMALM.cdsDInventario.FieldByName('SFAMID').AsString) + ', '
         + QuotedStr(DMALM.cdsDInventario.FieldByName('ARTID').AsString) + ', '
         + '       ( select nvl(max(ITEM),0)+1 '
         + '           from DB2ADMIN.LOG_INV_DET_REG '
         + '          where CIAID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('CIAID').AsString)
         + '            and LOCID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('LOCID').AsString)
         + '            and TINID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('TINID').AsString)
         + '            and ALMID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('ALMID').AsString)
         + '            and ARTID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('ARTID').AsString)
         + '            and TOINID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('TOINID').AsString)
         + '            and STKANO=' + QuotedStr(DMALM.cdsDInventario.FieldByName('STKANO').AsString) + '), '
         + dbeStock.text + ', ''' + sEstado + ''', ''' + DMALM.wUsuario + ''', SYSDATE )';
   // Final HPC_201404_ALM
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

      bbtnFilRegClick(Self);
   // Inicio HPC_201404_ALM
      xSQL := 'Update LOG334 '
         + '   set STKSFISG=' + dbgDetReg.ColumnByName('CANTIDAD').FooterValue + ', STKINV=''S'', '
         + '       USUINV=' + quotedstr(DMALM.wUsuario) + ', FECINV=SYSDATE '
         + ' where CIAID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('CIAID').AsString)
         + '   and LOCID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('LOCID').AsString)
         + '   and TINID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('TINID').AsString)
         + '   and ALMID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('ALMID').AsString)
         + '   and ARTID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('ARTID').AsString)
         + '   and TOINID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('TOINID').AsString);
   // Final HPC_201404_ALM
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      mtx5001.FMant.cds2.Edit;
      mtx5001.FMant.cds2.FieldByName('STKSFISG').AsString := dbgDetReg.ColumnByName('CANTIDAD').FooterValue;
      mtx5001.FMant.cds2.Post;
   Except
      Close;
      Exit;
   End;

   EditaArticulo;

  //Inicio HPC_201404_ALM
   If MessageDlg('¿Continuar con el siguiente artículo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      bbtnArtSiguiente.Click;
   Screen.Cursor := crDefault;
  //Final HPC_201404_ALM

{  if mtx5001.FMant.cds2.eof then
     Close;

  xSQL:='SELECT * FROM LOG334 '
       +'WHERE CIAID='+QuotedStr(Mtx5001.FMant.cds2.FieldByName('CIAID').AsString)
       +'  AND LOCID='+QuotedStr(Mtx5001.FMant.cds2.FieldByName('LOCID').AsString)
       +'  AND TINID='+QuotedStr(Mtx5001.FMant.cds2.FieldByName('TINID').AsString)
       +'  AND ALMID='+QuotedStr(Mtx5001.FMant.cds2.FieldByName('ALMID').AsString)
       +'  AND TOINID='+QuotedStr(Mtx5001.FMant.cds2.FieldByName('TOINID').AsString)
       +'  AND ARTID='+quotedstr(Mtx5001.FMant.cds2.FieldByName('ARTID').AsString);
  DMALM.cdsDInventario.Close;
  DMALM.cdsDInventario.DataRequest(xSQL);
  DMALM.cdsDInventario.Open;

  if not DMALM.cdsDInventario.eof then
  begin
    //Inicio HPC_201404_ALM
     dbeStock.Text:='0';
     dbeStock.Text:=floattostr(DMALM.cdsDInventario.fieldbyname('STKSFISG').AsFloat);
     dbeStock.SetFocus;
    //Final HPC_201404_ALM
  end
  else
     close;
   Screen.Cursor := crDefault;
}
End;

//Inicio HPC_201404_ALM
{
Procedure TFInventario.dbeUnitarioExit(Sender: TObject);
Var
   wmod, wres: double;
Begin
   If DMALM.cdsDInventario.FieldByName('STKSFISU').value > DMALM.cdsDInventario.FieldByName('ARTCONT').value Then
   Begin

    //while wmod > 1 then
      Begin
      //wmod:=DMALM.cdsSaldosSTKSFISU.value / DMALM.cdsSaldosARTCONT.value;
      //wres:=DMALM.cdsSaldosSTKSFISU.value div DMALM.cdsSaldosARTCONT.value;
      End;
   End;
End;
}
//Final HPC_201404_ALM

Procedure TFInventario.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFInventario.FormShow(Sender: TObject);
Var
   xSQL: String; // HPC_201404_ALM
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
 //Inicio HPC_201404_ALM
   xSQL := 'select ARTID, ARTDES '
      + '  from LOG334 '
      + '  where CIAID=' + quotedstr(mtx5001.FMant.cds2.FieldByName('CIAID').AsString)
      + '   and TOINID=' + quotedstr(mtx5001.FMant.cds2.FieldByName('TOINID').AsString);
   DMALM.cdsQry2.Close;
   DMALM.cdsQry2.DataRequest(xSQL);
   DMALM.cdsQry2.Open;
   dblcdArt.lookUpTable := DMALM.cdsQry2;
   dblcdArt.lookUpField := 'ARTID';
 //Final HPC_201404_ALM
   bbtnFilRegClick(self);
   dbeStock.SetFocus;
End;

Procedure TFInventario.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   Action := CAFree;
End;

Procedure TFInventario.bbtnBuscarClick(Sender: TObject);
Begin
   mtx5001.FMant.cds2.First;
   mtx5001.FMant.cds2.Locate('ARTID', VarArrayOf([dblcdArt.Text]), []);
   EditaArticulo;
End;

//Inicio HPC_2014_04_ALM
//Procedure TFInventario.BitBtn1Click(Sender: TObject);

Procedure TFInventario.bbtnArtAnteriorClick(Sender: TObject);
Begin
   mtx5001.FMant.cds2.Prior;
   EditaArticulo;
End;
//Final HPC_2014_ALM

//Inicio HPC_2014_04_ALM
//Procedure TFInventario.BitBtn2Click(Sender: TObject);

Procedure TFInventario.bbtnArtSiguienteClick(Sender: TObject);
Begin
   mtx5001.FMant.cds2.Next;
   EditaArticulo;
End;
//Final HPC_2014_ALM

Procedure TFInventario.EditaArticulo;
Var
   sARTID, sSQL: String;
   xCont: double;
Begin
   If Mtx5001.FMant.cds2.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No existen registros a editar');
      exit;
   End;
//Inicio HPC_201404_ALM
   sSQL := 'SELECT * '
      + '  FROM LOG334 '
      + ' WHERE CIAID=' + QuotedStr(Mtx5001.FMant.cds2.FieldByName('CIAID').AsString)
      + '   AND LOCID=' + QuotedStr(Mtx5001.FMant.cds2.FieldByName('LOCID').AsString)
      + '   AND TINID=' + QuotedStr(Mtx5001.FMant.cds2.FieldByName('TINID').AsString)
      + '   AND ALMID=' + QuotedStr(Mtx5001.FMant.cds2.FieldByName('ALMID').AsString)
      + '   AND TOINID=' + QuotedStr(Mtx5001.FMant.cds2.FieldByName('TOINID').AsString)
      + '   AND ARTID=' + quotedstr(Mtx5001.FMant.cds2.FieldByName('ARTID').AsString);
//Final HPC_201404_ALM
   DMALM.cdsDInventario.Close;
   DMALM.cdsDInventario.DataRequest(sSQL);
   DMALM.cdsDInventario.Open;

   bbtnFilRegClick(self);
//Inicio HPC_201404_ALM
   dbeStock.text := '0';
   cbEstado.Checked := True;
   dbeStock.SetFocus;
//   Final HPC_201404_ALM
End;

Procedure TFInventario.bbtnFilRegClick(Sender: TObject);
Var
   xSQL: String;
   nCont: Integer;
Begin
//Inicio HPC_201404_ALM
{
   dbgDetReg.Selected.Clear;
   dbgDetReg.Selected.Add('ARTID'#9'9'#9'Articulo'#9'F');
   dbgDetReg.Selected.Add('ITEM'#9'4'#9'Item'#9'F');
   dbgDetReg.Selected.Add('CANTIDAD'#9'7'#9'Cantidad'#9'F');
   dbgDetReg.Selected.Add('ESTADO'#9'12'#9'Estado'#9'F');
   dbgDetReg.Selected.Add('USUINV'#9'15'#9'Usuario'#9'F');
   dbgDetReg.Selected.Add('FECINV'#9'21'#9'Fecha y Hora'#9'F');
}
   xSQL := 'Select CIAID, STKANO, TOINID, ARTID, ITEM, CANTIDAD, ESTADO, USUINV, FECINV, FLAGELIM '
      + '  from DB2ADMIN.LOG_INV_DET_REG '
      + ' where CIAID=' + QuotedStr(Mtx5001.FMant.cds2.FieldByName('CIAID').AsString)
      + '   and LOCID=' + QuotedStr(Mtx5001.FMant.cds2.FieldByName('LOCID').AsString)
      + '   and TINID=' + QuotedStr(Mtx5001.FMant.cds2.FieldByName('TINID').AsString)
      + '   and ALMID=' + QuotedStr(Mtx5001.FMant.cds2.FieldByName('ALMID').AsString)
      + '   and TOINID=' + QuotedStr(Mtx5001.FMant.cds2.FieldByName('TOINID').AsString)
      + '   and ARTID=' + quotedstr(Mtx5001.FMant.cds2.FieldByName('ARTID').AsString)
      + ' order by ITEM';
   DMALM.cdsQry8.Close;
   DMALM.cdsQry8.DataRequest(xSQL);
   DMALM.cdsQry8.Open;
   dbgDetReg.DataSource := DMALM.dsQry8;
//Final HPC_201404_ALM

   nCont := 0;
   While Not DMALM.cdsQry8.Eof Do
   Begin
//Inicio HPC_201404_ALM
      If DMALM.cdsQry8.fieldByname('FLAGELIM').AsString <> 'S' Then
         nCont := nCont + DMALM.cdsQry8.fieldByname('CANTIDAD').AsInteger;
      DMALM.cdsQry8.Next;
//Final HPC_201404_ALM
   End;
   dbgDetReg.ColumnByName('CANTIDAD').FooterValue := FloatToStrF(nCont, ffNumber, 15, 2);

   dbgDetReg.Selected.Clear;
   dbgDetReg.Selected.Add('ARTID'#9'9'#9'Articulo'#9'F');
   dbgDetReg.Selected.Add('ITEM'#9'4'#9'Item'#9'F');
   dbgDetReg.Selected.Add('CANTIDAD'#9'7'#9'Cantidad'#9'F');
   dbgDetReg.Selected.Add('ESTADO'#9'12'#9'Estado'#9'F');
   dbgDetReg.Selected.Add('USUINV'#9'15'#9'Usuario'#9'F');
   dbgDetReg.Selected.Add('FECINV'#9'21'#9'Fecha y Hora'#9'F');
// Inicio HPC_201404_ALM
   dbgDetReg.Selected.Add('FLAGELIM'#9'10'#9'Eliminado'#9'F');
   dbgDetReg.ApplySelected;
// Final HPC_201404_ALM
End;

// Inicio HPC_201404_ALM
// <<ELIMINACION>> de Registro

Procedure TFInventario.dbgDetRegKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('¿Pasar a condición de ELIMINADO a este Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         Try
            xSQL := 'Update DB2ADMIN.LOG_INV_DET_REG '
               + '   set FLAGELIM=''S'' '
               + ' where CIAID=' + quotedstr(DMALM.cdsQry8.FieldByName('CIAID').AsString)
               + '   and TOINID=' + QuotedStr(DMALM.cdsQry8.FieldByName('TOINID').AsString)
               + '   and STKANO=' + QuotedStr(DMALM.cdsQry8.FieldByName('STKANO').AsString)
               + '   and ARTID=' + QuotedStr(DMALM.cdsQry8.FieldByName('ARTID').AsString)
               + '   and ITEM=' + InttoStr(DMALM.cdsQry8.FieldByName('ITEM').AsInteger);
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

            bbtnFilRegClick(Self);

            xSQL := 'Update LOG334 '
               + '   set STKSFISG=' + dbgDetReg.ColumnByName('CANTIDAD').FooterValue + ', STKINV=''S'', '
               + '       USUINV=' + quotedstr(DMALM.wUsuario) + ', FECINV=SYSDATE '
               + ' where CIAID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('CIAID').AsString)
               + '   and LOCID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('LOCID').AsString)
               + '   and TINID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('TINID').AsString)
               + '   and ALMID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('ALMID').AsString)
               + '   and ARTID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('ARTID').AsString)
               + '   and TOINID=' + QuotedStr(DMALM.cdsDInventario.FieldByName('TOINID').AsString);
            DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
            mtx5001.FMant.cds2.Edit;
            mtx5001.FMant.cds2.FieldByName('STKSFISG').AsString := dbgDetReg.ColumnByName('CANTIDAD').FooterValue;
            mtx5001.FMant.cds2.Post;
         Except
            Close;
            Exit;
         End;
      End;
   End;
End;
// Final HPC_201404_ALM

//Inicio HPC_201404_ALM

Procedure TFInventario.dbgDetRegCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   If DMALM.cdsQry8.FieldByName('FLAGELIM').AsString = 'S' Then
   Begin
      AFont.Color := clGray;
    //AFont.Style := [fsBold];
    //ABrush.Color := clRed;
   End;
End;
//Final HPC_201404_ALM

//Inicio HPC_201404_ALM

Procedure TFInventario.dblcdArtCloseDialog(Dialog: TwwLookupDlg);
Begin
   dblcdArt.Text := DMALM.cdsQry2.FieldByName('ARTID').AsString;
   bbtnBuscarClick(Self);
End;
//Final HPC_201404_ALM

End.

