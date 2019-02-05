Unit ALM202;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, wwdblook, Wwdbdlg, ExtCtrls, MsgDlgs;

Type
   TFActPCompra = Class(TForm)
      dblcdArti: TwwDBLookupComboDlg;
      edtArti: TEdit;
      dbePUnit: TEdit;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      lblArtPCompra: TLabel;
      lblPCompra: TLabel;
      Timer1: TTimer;
      Procedure dblcdArtiExit(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FActPCompra: TFActPCompra;
   xAccesoBotones: Boolean;

Implementation

Uses ALMDM1;

{$R *.DFM}

Procedure TFActPCompra.dblcdArtiExit(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   If Length(Trim(dblcdArti.Text)) <> DMALM.wAnchoArt Then
      dblcdArti.Text := DMALM.StrZero(dblcdArti.Text, DMALM.wAnchoArt);
   DMALM.cdsSobrino.SetKey;
   DMALM.cdsSobrino.FieldByname('ARTID').AsString := dblcdArti.Text;
   If Not DMALM.cdsSobrino.GotoKey Then
   Begin
      ErrorMsg(Caption, 'No Existe Articulo');
      edtArti.Text := '';
      dbePUnit.Text := '0';
      Screen.Cursor := crDefault;
      dblcdArti.SetFocus;
      Exit;
   End;
   edtArti.Text := DMALM.cdsSobrino.fieldbyname('ARTDES').AsString;
   dbePUnit.Text := Floattostr(DMALM.cdsSobrino.fieldbyname('ARTPCG').AsFloat);
   Screen.Cursor := crDefault;
End;

Procedure TFActPCompra.Z2bbtnRegOkClick(Sender: TObject);
Begin
   If Not Question(Caption, 'Esta Seguro de Ingresar el Precio de Costo' + #13 + #13 +
      'Desea Continuar') Then
      Exit;
   Screen.Cursor := crHourGlass;
   xSQL := 'UPDATE TGE205 SET ' +
      'ARTPCG=' + dbePUnit.Text + ' ' +
      'WHERE ARTID=' + QuotedStr(dblcdArti.Text);
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ErrorMsg(Caption, 'Error al Actualizar el Precio Costo');
   End;
   Screen.Cursor := crDefault;
   dbePUnit.clear;
   edtArti.Clear;
   dblcdArti.text := '';
   dblcdArti.SetFocus;
End;

Procedure TFActPCompra.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFActPCompra.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FActPCompra';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FActPCompra);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

End.

