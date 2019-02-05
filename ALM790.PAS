Unit ALM790;

// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, wwdblook, ExtCtrls,
   wwdbdatetimepicker, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache,
   ppDB, ppDBPipe, ppCtrls, ppVar, ppPrnabl, ppBands;

Type
   TFArticulos = Class(TForm)
      dbgArticulo: TwwDBGrid;
      gbTodos: TGroupBox;
      bbtnMarcar: TBitBtn;
      chkTodos: TCheckBox;
      Z2bbtnSOCOK1: TBitBtn;
      lblGrArtID: TLabel;
      dblcGrpArti: TwwDBLookupCombo;
      Bevel1: TBevel;
      dbdtpFecha: TwwDBDateTimePicker;
      Bevel2: TBevel;
      Z1bbtnDesactivar: TBitBtn;
      ppDBDesactivar: TppDBPipeline;
      ppRDesactivar: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      pplblFecha: TppLabel;
      pplblCiaid: TppLabel;
      pplblCiaDes: TppLabel;
      pplbltinid: TppLabel;
      pplblTinDes: TppLabel;
      ppLabel15: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText9: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText1: TppDBText;
      ppDBText8: TppDBText;
      ppLabel7: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      Procedure FormActivate(Sender: TObject);
      Procedure bbtnMarcarClick(Sender: TObject);
      Procedure Z2bbtnSOCOK1Click(Sender: TObject);
      Procedure chkTodosClick(Sender: TObject);
      Procedure Z1bbtnDesactivarClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FArticulos: TFArticulos;

Implementation

Uses ALMDM1, ALM780;

{$R *.DFM}

Procedure TFArticulos.FormActivate(Sender: TObject);
Begin
   dbgArticulo.DataSource := DM1.dsQry4;
   dbdtpFecha.Date := Date;
End;

Procedure TFArticulos.bbtnMarcarClick(Sender: TObject);
Begin
   If chkTodos.Checked = false Then
      If Length(Trim(dblcGrpArti.text)) = 0 Then
      Begin
         ErrorMsg(Caption, 'Grupo de Articulo inválido...');
         Exit;
      End;

   Screen.Cursor := crhourGlass;
   DM1.cdsQry4.Filtered := false;
   DM1.cdsQry4.Filter := 'MOSTRAR=''S''';
   DM1.cdsQry4.Filtered := true;

   DM1.cdsQry4.DisableControls;
   DM1.cdsQry4.First;
   While Not DM1.cdsQry4.Eof Do
   Begin
      If chkTodos.Checked Then
      Begin
         DM1.cdsQry4.Edit;
         DM1.cdsQry4.FieldByName('FLAG').AsString := 'S';
         DM1.cdsQry4.Post;
      End
      Else
      Begin
         If DM1.cdsQry4.FieldByName('GRARID').AsString = dblcGrpArti.text Then
         Begin
            DM1.cdsQry4.Edit;
            DM1.cdsQry4.FieldByName('FLAG').AsString := 'S';
            DM1.cdsQry4.Post;
         End
         Else
         Begin
            DM1.cdsQry4.Edit;
            DM1.cdsQry4.FieldByName('FLAG').AsString := 'N';
            DM1.cdsQry4.Post;
         End;
      End;
      DM1.cdsQry4.Next
   End;
   DM1.cdsQry4.Filter := 'MOSTRAR=''S'' AND FLAG=''S'' ';
   DM1.cdsQry4.Filtered := true;
   DM1.cdsQry4.EnableControls;
   Screen.Cursor := crDefault;
End;

Procedure TFArticulos.Z2bbtnSOCOK1Click(Sender: TObject);
Var
   xSQL: String;
Begin

   If dbdtpFecha.Date = 0 Then
   Begin
      ErrorMsg(Caption, 'Ingrese Fecha de Desactivación');
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   DM1.cdsQry4.DisableControls;
   DM1.cdsQry4.First;
   While Not DM1.cdsQry4.Eof Do
   Begin
      If DM1.cdsQry4.FieldByName('FLAG').AsString = 'S' Then
      Begin
         xSQL := ' UPDATE TGE205 SET ARTEST=''A'' ' +
            ' WHERE CIAID=' + Quotedstr(DM1.cdsQry4.FieldByName('CIAID').AsString) +
            ' AND TINID=' + Quotedstr(DM1.cdsQry4.FieldByName('TINID').AsString) +
            ' AND ARTID=' + Quotedstr(DM1.cdsQry4.FieldByName('ARTID').AsString);
         Try
            DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
         End;
      End;
      DM1.cdsQry4.Next;
   End;
   Screen.Cursor := crDefault;
   Showmessage('Articulos Desactivados');
   DM1.cdsQry4.EnableControls;

End;

Procedure TFArticulos.chkTodosClick(Sender: TObject);
Begin
   If chkTodos.Checked = false Then
   Begin
      lblGrArtID.Visible := true;
      dblcGrpArti.Visible := true;
      dblcGrpArti.Text := '';
      DM1.cdsGArti.Open;
      DM1.cdsGArti.Filter := '';
      DM1.cdsGArti.Filtered := false;
      DM1.cdsGArti.Filter := ' CIAID=' + Quotedstr(FToolArticulo.dblcCIA.Text) +
         ' AND TINID=' + Quotedstr(FToolArticulo.dblcTIN.Text);
      DM1.cdsGArti.Filtered := True;

   End
   Else
   Begin
      lblGrArtID.Visible := false;
      dblcGrpArti.Visible := false;
      DM1.cdsGArti.Close
   End;

End;

Procedure TFArticulos.Z1bbtnDesactivarClick(Sender: TObject);
Begin
   ppDBDesactivar.DataSource := DM1.dsQry4;
   ppRDesactivar.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RepArticuloSinMov.Rtm';
   ppRDesactivar.Template.LoadFromFile;
   pplblCiaid.Caption := FToolArticulo.dblcCIA.Text;
   pplblCiaDes.Caption := FToolArticulo.dbeCIA.Text;
   pplblTinid.Caption := FToolArticulo.dblcTIN.Text;
   pplblTinDes.Caption := FToolArticulo.dbeTIN.Text;
   pplblFecha.Caption := Datetostr(dbdtpFecha.date);
   ppRDesactivar.Print;

End;

End.

