Unit ALM501;

// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Mask, wwdbedit, Wwdbspin, StdCtrls, wwdblook, ExtCtrls, Db, DBClient,
   wwclient, Buttons, DBCtrls, Mant, ComCtrls;

Type
   TFInvFisico = Class(TForm)
      pnlOpciones: TPanel;
      lblCia: TLabel;
      lblLoc: TLabel;
      Label1: TLabel;
      lblAlm: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      dblcLOC: TwwDBLookupCombo;
      dbeLOC: TEdit;
      dblcTIN: TwwDBLookupCombo;
      dbeTIN: TEdit;
      dblcTALM: TwwDBLookupCombo;
      dbeALM: TEdit;
      pnlBoton: TPanel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;

      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
   Private
    { Private declarations }
      Procedure PegaPanelTool(Sender: TObject);
   Public
    { Public declarations }
      Procedure OnEditINV(Sender: TObject; MantFields: TFields);
   End;

Var
   FInvFisico: TFInvFisico;
   xSQL: String;

Implementation

Uses ALMDM1, oaIN5000, ALM300, Alm730;

{$R *.DFM}

Procedure TFInvFisico.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFInvFisico.dblcCIAExit(Sender: TObject);
Var
   sCIA: String;
Begin
   sCIA := dblcCIA.Text;
   dbeCia.Text := DM1.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(sCIA), 'CIADES');

   xSQL := 'SELECT * FROM TGE126 WHERE CIAID=' + quotedstr(dblcCIA.text);
   DM1.cdsLOC.Close;
   DM1.cdsLOC.DataRequest(xSQL);
   DM1.cdsLOC.open;
End;

Procedure TFInvFisico.dblcLOCExit(Sender: TObject);
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeLoc.Text := DM1.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE152 WHERE ' + xSQL;
   DM1.cdsTINID.Close;
   DM1.cdsTINID.DataRequest(xSQL);
   DM1.cdsTINID.open;
End;

Procedure TFInvFisico.dblcTINExit(Sender: TObject);
Begin
   xSQL := 'TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeTIN.Text := DM1.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE151 WHERE ' + xSQL + ' ORDER BY ALMID';
   DM1.cdsALM.Close;
   DM1.cdsALM.DataRequest(xSQL);
   DM1.cdsALM.open;
End;

Procedure TFInvFisico.dblcTALMExit(Sender: TObject);
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIn.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALM.text);
   dbeALM.text := DM1.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');
End;

Procedure TFInvFisico.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TDBMemo Then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFInvFisico.Z2bbtnRegCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFInvFisico.Z2bbtnRegOkClick(Sender: TObject);
Var
   xWhere: String;
Begin
 {f not Question(Caption, ' Este Proceso: '+#13+
              ' Realiza el Cierre Anual de las opciones Seleccionadas '+#13+#13+
              ' Desea Continuar ') then
 begin
  Exit;
 end;}
   If Length(Trim(dbeCIA.Text)) = 0 Then
      Raise Exception.Create(' La Compañia no Existe ');

   If Length(Trim(dblcLOC.Text)) = 0 Then
      Raise Exception.Create(' La Localidad no Existe ');

   If Length(Trim(dblcTIN.Text)) = 0 Then
      Raise Exception.Create(' El Tipo de Inventario no Existe ');

   If Length(Trim(dblcTALM.Text)) = 0 Then
      Raise Exception.Create(' El Almacen no Existe ');

   Screen.Cursor := crHourGlass;
   xWhere := 'LOG316.CIAID=' + QuotedStr(dblcCIA.Text) +
      ' AND LOG316.LOCID=' + QuotedStr(dblcLOC.Text) +
      ' AND LOG316.TINID=' + QuotedStr(dblcTIN.Text) +
      ' AND LOG316.ALMID=' + QuotedStr(dblcTALM.Text);
   Application.CreateForm(TFInventario, FInventario);
   FToolMant := TFToolMant.Create(Self); // forma con botones  <=========
   FToolMant.Visible := False; //                    <=========
   Mtx := TMant.Create(Self);
   Try
      Mtx.OnCreateMant := PegaPanelTool;
      Mtx.User := DM1.wUsuario;
      Mtx.DComC := DM1.DCOM1;
      Mtx.TableName := 'LOG316';
      Mtx.Titulo := 'Inventario Físico del Almacen ' + dbeALM.Text;
      Mtx.ClientDataSet := DM1.cdsSaldos;
      Mtx.ControlGridDisp := FPrincipal.cgdPrincipal;
      Mtx.OnEdit := OnEditINV;
      Mtx.OnDelete := Nil;
      Mtx.OnShow := Nil; //OnShowINV;
      Mtx.Filter := xWhere;
      Mtx.SectionName := 'ALMInventarios';
      Mtx.FileNameIni := '\oaALM.INI';
      Mtx.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx.Execute;
   Finally
      Screen.Cursor := crDefault;
      Mtx.Free;
   End;
   FToolMant.Free;
End;

Procedure TFInvFisico.PegaPanelTool(Sender: TObject);
Var
   pg: TPageControl;
   pl: TPanel;
Begin
   pg := FToolMant.pgcTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   //pg.Height   := 55;
   pl.Height := pg.Height + 5;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFInvFisico.OnEditINV(Sender: TObject; MantFields: TFields);
Var
   sARTID: String;
   xCont: double;
Begin
  //FToolMant.ActSaldos;
   If DM1.cdsSaldos.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No existen registros a editar');
      exit;
   End;
   sARTID := MantFields.FieldByName('ARTID').AsString;
  //borrar cim 02/01/2003
   FInventario.dbeUnitario.text := '0';
   FInventario.dbeGeneal.text := '0';

   xCont := strtofloat(dm1.DisplayDescrip('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + quotedstr(DM1.cdsSaldos.fieldbyname('UNMIDG').AsString), 'EUNMEQ'));
   If DM1.cdsSaldos.fieldbyname('STKSFISG').AsFloat - trunc(DM1.cdsSaldos.fieldbyname('STKSFISG').AsFloat) > 0 Then
   Begin
      FInventario.dbeUnitario.text := floattostr(DM1.FRound(((DM1.cdsSaldos.fieldbyname('STKSFISG').AsFloat - trunc(DM1.cdsSaldos.fieldbyname('STKSFISG').AsFloat)) * xCont), 15, 0));
      FInventario.dbeGeneal.text := floattostr(trunc(DM1.cdsSaldos.fieldbyname('STKSFISG').AsFloat));
   End
   Else
      FInventario.dbeGeneal.text := floattostr(DM1.cdsSaldos.fieldbyname('STKSFISG').AsFloat);

  //dm1.cdsSaldos.Data :=  Mtx.ClientDataSet.Data;
  //dm1.cdsSaldos.Locate ('ARTID',VarArrayOf([sARTID]),[]);
   DM1.cdsSaldos.Edit;
   FInventario.ShowModal;
  //Mtx.ClientDataSet.Data := DM1.cdsSaldos.Data;
  //Mtx.RefreshFilter;
End;

End.

