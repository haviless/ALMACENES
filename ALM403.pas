Unit ALM403;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Mant, Mask, wwdbedit, StdCtrls, wwdblook, Buttons, wwDialog, wwidlg, Db,
   DBClient, wwclient, Wwdbdlg, ExtCtrls;

Type
   TFSaldosInic = Class(TForm)
      pnlPrincipal: TPanel;
      lblArticulo: TLabel;
      dbeDescripcion: TwwDBEdit;
      Label1: TLabel;
      wwDBEdit1: TwwDBEdit;
      Label2: TLabel;
      wwDBEdit2: TwwDBEdit;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      pnlIngreso: TPanel;
      lblSGen: TLabel;
      dbeStkInicG: TwwDBEdit;
      lblSUni: TLabel;
      dbeMontoG: TwwDBEdit;
      Label3: TLabel;
      Label4: TLabel;
      dbeMontoU: TwwDBEdit;
      dbeStkInicU: TwwDBEdit;
      Label5: TLabel;
      wwDBEdit3: TwwDBEdit;
      Procedure bbtnCancClick(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure dbeMontoGExit(Sender: TObject);
      Procedure dbeStkInicUExit(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      WhereSQL: String;
      TipoProceso: char;
   End;

Var
   FSaldosInic: TFSaldosInic;

Implementation

Uses ALMDM1;

{$R *.DFM}

Procedure TFSaldosInic.bbtnCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFSaldosInic.bbtnOkClick(Sender: TObject);
Var
   sSQL: String;
Begin
   If TipoProceso = 'B' Then
   Begin
      Screen.Cursor := crHourGlass;
      sSQL := 'UPDATE LOG316 SET ';
      If trim(dbeStkInicG.text) = '' Then dbeStkInicG.text := '0';
      sSQL := sSQL + 'STKSANTG=' + dbeStkInicG.text;
      If trim(dbeMontoG.text) = '' Then dbeMontoG.text := '0';
      sSQL := sSQL + ', STKMANTG=' + dbeMontoG.text;
      If trim(dbeStkInicU.text) = '' Then dbeStkInicU.text := '0';
      sSQL := sSQL + ', STKSANTU=0, STKMANTU=0';
      If WhereSQL = '' Then
         sSQL := sSQL + ' ' + WhereSQL + ' WHERE ARTCONT=1'
      Else
         sSQL := sSQL + ' ' + WhereSQL + ' AND ARTCONT=1';
      DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);

      sSQL := 'UPDATE LOG316 SET ';
      If trim(dbeStkInicU.text) = '' Then dbeStkInicU.text := '0';
      sSQL := sSQL + ' STKSANTU=' + dbeStkInicU.text;
      If trim(dbeMontoU.text) = '' Then dbeMontoU.text := '0';
      sSQL := sSQL + ', STKMANTU=' + dbeMontoU.text;
      If WhereSQL = '' Then
         sSQL := sSQL + ' ' + WhereSQL + ' WHERE ARTCONT>1'
      Else
         sSQL := sSQL + ' ' + WhereSQL + ' AND ARTCONT>1';
      DMALM.DCOM1.AppServer.EjecutaSQL(SSQL);
      DMALM.cdsSaldos.Cancel;
      close;
      Screen.Cursor := crDefault;
      exit;
   End;
  {
  if (dbeGeneal.Text <> '') and
     (dbeUnitario.Text <> '') then
  begin
    ErrorMsg(Caption, ' Solo uno de los campos puede tener valor ');
    abort;
  end;}
   Screen.Cursor := crHourGlass;
  //DMALM.ControlTran;
   DMALM.ControlTran(0, Nil, '');
  //DMALM.cdsSaldos.Post;
  //DMALM.cdsSaldos.ApplyUpdates(0);
   DMALM.cdsSaldos.Next;
   If DMALM.cdsSaldos.FieldByName('ARTCONT').Value = 1 Then
   Begin
      dbeStkInicU.Enabled := False;
      dbeMOntoU.Enabled := False;
   End
   Else
   Begin
      dbeStkInicU.Enabled := True;
      dbeMontoU.Enabled := True;
   End;
   If Not DMALM.cdssaldos.eof Then
   Begin
      DMALM.cdsSaldos.Edit;
      dbeStkInicG.SetFocus;
   End
   Else
      close;
   Screen.Cursor := crDefault;
End;

Procedure TFSaldosInic.dbeMontoGExit(Sender: TObject);
//var  wmod, wres : double;
Begin
   If bbtnCanc.Focused Then exit;
   If trim((sender As TwwDBEdit).text) < '0' Then
   Begin
      (sender As TwwDBEdit).text := '0'
   End;
   If DMALM.cdsSaldos.FieldByName('STKSFISU').value > DMALM.cdsSaldos.FieldByName('ARTCONT').value Then
   Begin
    //while wmod > 1 then
      Begin
      //wmod:=DMALM.cdsSaldosSTKSFISU.value / DMALM.cdsSaldosARTCONT.value;
      //wres:=DMALM.cdsSaldosSTKSFISU.value div DMALM.cdsSaldosARTCONT.value;
      End;
   End;
End;

Procedure TFSaldosInic.dbeStkInicUExit(Sender: TObject);
Begin
   If bbtnCanc.Focused Then exit;
   If trim((sender As TwwDBEdit).text) < '0' Then
   Begin
      (sender As TwwDBEdit).text := '0'
   End;
End;

Procedure TFSaldosInic.FormActivate(Sender: TObject);
Begin
   If TipoProceso = 'N' Then
   Begin
      If DMALM.cdsSaldos.FieldByName('ARTCONT').Value = 1 Then
      Begin
         dbeStkInicU.Enabled := False;
         dbeMOntoU.Enabled := False;
      End
      Else
      Begin
         dbeStkInicU.Enabled := True;
         dbeMontoU.Enabled := True;
      End;
   End
   Else
   Begin
      dbeStkInicU.Enabled := True;
      dbeMontoU.Enabled := True;
   End;
   dbeStkInicG.SetFocus;
End;

Procedure TFSaldosInic.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFSaldosInic.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   //FVariables.w_IN_Registro := False;
End;

Procedure TFSaldosInic.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
End;

End.

