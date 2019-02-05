Unit ALM204;
//HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, wwdbdatetimepicker, Mask, wwdbedit, StdCtrls, wwdblook,
   ComCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, DB, DBCtrls;

Type
   TFCierreO = Class(TForm)
      pcCierre: TPageControl;
      tsCierre: TTabSheet;
      Bevel1: TBevel;
      Label1: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      pnlDA: TPanel;
      lblCIA: TLabel;
      Label2: TLabel;
      Label6: TLabel;
      dbeALM: TwwDBEdit;
      dbeCIA: TwwDBEdit;
      dbeLOC: TwwDBEdit;
      dbeFrecu: TwwDBEdit;
      dbeUltFec: TwwDBEdit;
      dbeActFec: TwwDBEdit;
      dblcCIA: TwwDBLookupCombo;
      dblcLOC: TwwDBLookupCombo;
      dblcALM: TwwDBLookupCombo;
      Panel1: TPanel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      wwDBGrid1: TwwDBGrid;
      Label5: TLabel;
      dblcTIN: TwwDBLookupCombo;
      dbeTIN: TEdit;
      Z2bbtnSalir: TBitBtn;

      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);

      Procedure FormCreate(Sender: TObject);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcALMExit(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcTINExit(Sender: TObject);
      Procedure dbeFrecuExit(Sender: TObject);
      Procedure dblcLOCEnter(Sender: TObject);
      Procedure dblcTINEnter(Sender: TObject);
      Procedure dblcALMEnter(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
   Private
  { Private declarations }
      xCrea: bool;
      Procedure nuevafecha;
   Public
  { Public declarations }
   End;

Var
   FCierreO: TFCierreO;
   xPasa: integer;

Implementation

Uses ALMDM1;

{$R *.DFM}

Procedure TFCierreO.FormCreate(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'SELECT * FROM LOG317'
      + ' ORDER BY CIAID, LOCID, TINID, ALMID, CNSULTCIE';
   DM1.cdsCierre.Close;
   DM1.cdsCierre.DataRequest(sSQL);
   DM1.cdsCierre.Open;
   dm1.cdsCIA.Open;
   dm1.cdsLOC.Open;
   dm1.cdsALM.Open;
   dbeFrecu.Text := '';
   dbeUltFec.Text := '';
   dbeActFec.Text := '';
   dblcCIA.Text := '';
   dblcLOC.Text := '';
   dblcALM.Text := '';
   dbeCIA.Text := '';
   dbeLOC.Text := '';
   dbeALM.Text := '';
   pcCierre.ActivePage := tsCierre;
End;

Procedure TFCierreO.FormActivate(Sender: TObject);
Begin
   xcrea := True;
   xPasa := 0;
   dblcCIA.setfocus;
   xcrea := false;
End;

Procedure TFCierreO.Z2bbtnRegCancClick(Sender: TObject);
Begin
   If DM1.cdsCIERRE.State In [dsInsert, dsEdit] Then
      DM1.cdsCIERRE.Cancel;
  //FCierreO.Close;
End;

Procedure TFCierreO.Z2bbtnRegOkClick(Sender: TObject);
Var
   Nro: Double;
   Ncode: Integer;
Begin
   val(dbeFrecu.Text, Nro, Ncode);
   If (nCode <> 0) Or (dbeUltFec.text = '') Or (dbeActFec.text = '') Then
   Begin
      ErrorMsg('Error', 'Faltan Datos');
      Exit;
   End;
   If Question(Caption, 'Este Proceso: ' + #13 + #13 +
      ' Realiza el Cierre ' + #13 +
      '  ' + #13 + #13 +
      '        Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;
      dm1.cdsCIERRE.Insert;
      dm1.cdsCIERRE.fieldbyname('CIAID').AsString := dblcCIA.text;
      dm1.cdsCIERRE.fieldbyname('LOCID').AsString := dblcLOC.text;
      dm1.cdsCIERRE.fieldbyname('TINID').AsString := dblcTIN.text;
      dm1.cdsCIERRE.fieldbyname('ALMID').AsString := dblcALM.text;
      dm1.cdsCIERRE.fieldbyname('CNSFRECU').AsString := dbeFrecu.text;
      dm1.cdsCIERRE.fieldbyname('CNSPRICIE').AsString := dbeUltFec.text;
      dm1.cdsCIERRE.fieldbyname('CNSULTCIE').AsString := dbeActFec.text;
  //dm1.ControlTran;
      DM1.ControlTran(0, Nil, '');
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFCierreO.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If xPasa = 1 Then Exit;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFCierreO.dblcCIAExit(Sender: TObject);
Var
   ssql: String;
Begin
   If xCrea Then exit;
   dblcLOC.Text := '';
   dbeLOC.Text := '';
   dblcTIN.Text := '';
   dbeTIN.Text := '';
   dblcALM.Text := '';
   dbeALM.Text := '';
   dbeUltFec.Text := '';
   dbeActFec.Text := '';
   dbeFrecu.Text := '';

   If dblcCIA.Text <> '' Then
   Begin
      Screen.Cursor := crHourGlass;
      ssql := '';
      ssql := 'SELECT * FROM TGE126 WHERE CIAID=' + quotedstr(dblcCIA.Text) + ' ORDER BY CIAID,LOCID';
      dm1.cdsLOC.Close;
      dm1.cdsLOC.DataRequest(ssql);
      dm1.cdsLOC.Open;
      dbeCia.Text := DM1.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.Text), 'CIADES');
      Screen.Cursor := crDefault;
      dblcLOC.setfocus;
   End
   Else
      If dm1.cdsCIA.RecordCount > 0 Then
      Begin
         ErrorMsg('Error', 'Debe de escoger una Compañia');
      End;
End;

Procedure TFCierreO.dblcLOCExit(Sender: TObject);
Var
   xSQL, sSQL: String;
Begin
   If xCrea Then exit;
   If xPasa = 1 Then Exit;

   dblcTIN.Text := '';
   dbeTIN.Text := '';
   dblcALM.Text := '';
   dbeALM.Text := '';
   dbeFrecu.Text := '';
   dbeUltFec.Text := '';
   dbeActFec.Text := '';

   If dblcLOC.text <> '' Then
   Begin
      Screen.Cursor := crHourGlass;
      ssql := '';
      ssql := 'SELECT * FROM TGE152 WHERE CIAID=' + quotedstr(dblcCIA.Text) + ' ORDER BY CIAID,TINID';
      dm1.cdsTINID.Close;
      dm1.cdsTINID.DataRequest(ssql);
      dm1.cdsTINID.Open;

      xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
      dbeLoc.Text := DM1.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');
      Screen.Cursor := crDefault;
      dblcTIN.setfocus;
   End
   Else
      If dm1.cdsLOC.RecordCount > 0 Then
      Begin
         ErrorMsg('Error', 'Debe de escoger una Localidad');
      End;
End;

Procedure TFCierreO.dblcALMExit(Sender: TObject);
Var
   xSQL, sSQL: String;
Begin
   If xCrea Then exit;
   If xPasa = 1 Then Exit;
   If dblcALM.Text <> '' Then
   Begin
      Screen.Cursor := crHourGlass;
      dbeFrecu.Text := '';
      dbeUltFec.Text := '';
      dbeActFec.Text := '';

      xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIn.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcALM.text);
      dbeALM.text := DM1.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');
      sSQL := 'SELECT * FROM LOG317 WHERE LOG317.CIAID=' + QUOTEDSTR(dblcCIA.Text) +
         ' AND LOG317.LOCID=' + QUOTEDSTR(dblcLOC.Text) + ' AND LOG317.ALMID=' + QUOTEDSTR(dblcALM.Text) + ' AND LOG317.TINID=' + QUOTEDSTR(dblcTIN.Text) +
         ' ORDER BY CIAID,LOCID,TINID,ALMID,CNSULTCIE';
      dm1.cdsCIERRE.Close;
      dm1.cdsCIERRE.DataRequest(sSQL);
      dm1.cdsCIERRE.Open;
      Screen.Cursor := crDefault;
      If dm1.cdsCIERRE.RecordCount = 0 Then
      Begin
         ErrorMsg('Error', 'No Existe Frecuencia de Cierre');
         dbeFrecu.SetFocus;
      End
      Else
      Begin
         If (dblcALM.Text <> '') Then
         Begin
            Screen.Cursor := crHourGlass;
            dm1.cdsCIERRE.Last;
            dbeFrecu.Text := dm1.cdsCIERRE.fieldbyname('CNSFRECU').AsString;
            dbeUltFec.Text := dm1.cdsCIERRE.fieldbyname('CNSULTCIE').AsString;
            Nuevafecha;
            Screen.Cursor := crDefault;
            dbeFrecu.SetFocus;
         End;
      End;
   End
   Else
      If dm1.cdsALM.RecordCount > 0 Then
      Begin
         ErrorMsg('Error', 'Debe de escoger un Almacén');
      End;
End;

Procedure TFCierreO.nuevafecha;
Var
 //ix : integer;
 {vfecult,}vmasdia: Tdate;
 //vyear,vmonth,vday : word;
   y, m, d: word;
 //vyear1,vmonth1,vday1 : word;
Begin
   If Length(Trim(dbeUltFec.Text)) = 0 Then
   Begin
      DecodeDate(Date, y, m, d);
      dbeUltFec.Text := '01/' + DM1.strzero(IntToStr(M), 2) + '/' + FloattoStr(y);
   End;
   vmasdia := StrToInt(dbeFrecu.Text) + StrToDate(dbeUltFec.Text);
 {vfecult := StrToDate(dbeUltFec.Text);
 DecodeDate(vmasdia,vyear,vmonth,vday);
 DecodeDate(vfecult,vyear1,vmonth1,vday1);
 if vyear = vyear1 then
  dbeActFec.text := DateToStr(vmasdia)
 else
 begin
  ix := 1;
  repeat
   vmasdia := (StrToInt(dbeFrecu.Text)-iX) + StrToDate(dbeUltFec.Text);
   DecodeDate(vmasdia,vyear,vmonth,vday);
   DecodeDate(vfecult,vyear1,vmonth1,vday1);
   iX := iX+1;
  until vyear = vyear1;
  dbeActFec.text := DateToStr(vmasdia);
 end;}
   dbeActFec.text := DateToStr(vmasdia);
End;

Procedure TFCierreO.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  //dm1.cdsCIA.close;
   dm1.cdsALM.close;
   dm1.cdsLOC.close;
   If dm1.cdsCIERRE.State = dsInsert Then
      dm1.cdsCIERRE.cancel;
   dm1.cdsCIERRE.close;
   xCrea := True;
End;

Procedure TFCierreO.dblcTINExit(Sender: TObject);
Var
   xSQL, sSQL: String;
Begin
   If xCrea Then exit;
   If xPasa = 1 Then Exit;
   dblcALM.Text := '';
   dbeALM.Text := '';
   dbeFrecu.Text := '';
   dbeUltFec.Text := '';
   dbeActFec.Text := '';
   If dblcLOC.text <> '' Then
   Begin
      Screen.Cursor := crHourGlass;
      ssql := '';
  //xSQL:='LOCID='+quotedstr(dblcLOC.text)+' AND TINID='+quotedstr(dblcTIn.text)+' AND CIAID='+quotedstr(dblcCIA.text)+' AND ALMID='+quotedstr(dblcALM.text);
      ssql := 'SELECT * FROM TGE151 WHERE CIAID=' + quotedstr(dblcCIA.Text) + ' AND LOCID=' + quotedstr(dblcLOC.Text) + ' AND TINID=' + quotedstr(dblcTIn.text) + ' ORDER BY CIAID,LOCID,ALMID';
      dm1.cdsALM.Close;
      dm1.cdsALM.DataRequest(ssql);
      dm1.cdsALM.Open;

      xSQL := 'TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
      dbeTIN.Text := DM1.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');
      Screen.Cursor := crDefault;
      dblcALM.setfocus;
   End
   Else
      If dm1.cdsTINID.RecordCount > 0 Then
      Begin
         ErrorMsg('Error', 'Debe de escoger una Tipo de Inventario');
      End;
End;

Procedure TFCierreO.dbeFrecuExit(Sender: TObject);
Var
   Nro: Double;
   Ncode: Integer;
Begin
   val(dbeFrecu.Text, Nro, Ncode);
   If nCode <> 0 Then
   Begin
      ErrorMsg(Caption, ' Frecuencia no Valida ');
      Exit
   End;
   If (strtoFloat(dbeFrecu.Text) > 0) Or
      (strtoFloat(dbeFrecu.Text) < 32) Then
      Nuevafecha
End;

Procedure TFCierreO.dblcLOCEnter(Sender: TObject);
Begin
   If dblcCIA.Text = '' Then
   Begin
      ErrorMsg(Caption, ' Debe Escoger una Compañia ');
      xPasa := 1;
   End
   Else
      xPasa := 0;
End;

Procedure TFCierreO.dblcTINEnter(Sender: TObject);
Begin
   If dblcLOC.Text = '' Then
   Begin
      ErrorMsg(Caption, ' Debe Escoger una Localidad ');
      xPasa := 1;
   End
   Else
      xPasa := 0;
End;

Procedure TFCierreO.dblcALMEnter(Sender: TObject);
Begin
   If dblcTIN.Text = '' Then
   Begin
      ErrorMsg(Caption, ' Debe Escoger un Tipo de Invemtario ');
      xPasa := 1;
   End
   Else
      xPasa := 0;
End;

Procedure TFCierreO.Z2bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFCierreO.wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
   State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
 {if  = 0 then
   ABrush.color := clwhite
  else
   ABrush.Color := $00C0FFFF;  {Or try clYellow}

  //	if highlight then Afont.color := clblack;

End;

Procedure TFCierreO.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

End.

