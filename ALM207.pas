Unit ALM207;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, wwdblook,
   Wwdbdlg, Mask, wwdbedit, MsgDlgs;

Type
   TFArtAtt = Class(TForm)
      dbgODCATT: TwwDBGrid;
      stxTitulo6: TStaticText;
      dbgODARTT: TwwDBGrid;
      Bevel1: TBevel;
      Z2bbtnOAOK: TBitBtn;
      Z2bbtnOACancel: TBitBtn;
      pnlAttArt: TPanel;
      Bevel2: TBevel;
      Label6: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      StaticText1: TStaticText;
      Z2bbtnATTOK: TBitBtn;
      Z2bbtnATTCancel: TBitBtn;
      dbeItem: TwwDBEdit;
      dblkdlgArti: TwwDBLookupComboDlg;
      dbeCNTA: TwwDBEdit;
      wwDBEdit1: TwwDBEdit;
      Procedure dbgODARTTDblClick(Sender: TObject);
      Procedure dbcldArtiChange(Sender: TObject);
      Procedure dblcExist(Sender: TObject);
      Procedure Z2bbtnOACancelClick(Sender: TObject);
      Procedure Z2bbtnATTOKClick(Sender: TObject);
      Procedure Z2bbtnATTCancelClick(Sender: TObject);
      Procedure Z2bbtnOAOKClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FArtAtt: TFArtAtt;

Implementation

Uses ALMDM1, ALM203;

{$R *.DFM}

Procedure TFArtAtt.dbgODARTTDblClick(Sender: TObject);
Begin
{
  fCnt := DMALM.cdsDOCATT.FieldByName('DODCCNT').AsFloat;
  fCns := DMALM.cdsDOCATT.FieldByName('DODCCSLD').AsFloat;
  fCna := DMALM.cdsDOCATT.FieldByName('DODCCATE').AsFloat;

  if fCns = 0 then
  begin
    ErrorMsg('Error','El articulo ya ha sido atendido...');
    Exit;
  end;

  if fCna > 0 then
  begin
    fCnt := fCns;
  end;
   //dbeCNTA.Text := Format('%8.2f',[fCnt]);

  pnlAttArt.Visible := True;
  DMALM.cdsDOCATT.Edit;
  DMALM.cdsDOCATT.FieldByName('DODCCATE').AsFloat := fCnt;
  }
   Z2bbtnOAOKClick(Sender);
End;

Procedure TFArtAtt.dbcldArtiChange(Sender: TObject);

Begin
 // buscar si existe en algunas de las ordenes de compra, sino existe no debe
 // permitir el registro del artículo
 //-----------------------------------------------------------------------------
End;

Procedure TFArtAtt.dblcExist(Sender: TObject);
Var
   bRq: Boolean;
Begin
   If TwwDBCustomLookupCombo(Sender).DataSource <> Nil Then
      bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;

   If (bRq) And (trim(TwwDBCustomLookupCombo(Sender).Text) = '') Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFArtAtt.Z2bbtnOACancelClick(Sender: TObject);
Begin
   ModalResult := mrCancel;
//  ---- procesar todo lo que necesites
End;

Procedure TFArtAtt.Z2bbtnATTOKClick(Sender: TObject);
Var
   fCNT, fCTA, fCTS: Double;
Begin
   fCNT := DMALM.cdsDOCATT.FieldByName('DODCCNT').AsFloat;
   fCTS := DMALM.cdsDOCATT.FieldByName('DODCCSLD').AsFloat;

   If dbeCNTA.Text = '' Then dbeCNTA.Text := '0';

   If StrToFloat(dbeCNTA.Text) = 0 Then
   Begin
      ErrorMsg('Error', 'La cantidad a atender no puede ser CERO!!!');
      Exit;
   End;

   If StrToFloat(dbeCNTA.Text) > fCNT Then
   Begin
      ErrorMsg('Error', 'La cantidad a atender no puede ser mayor que la cantidad solicitada!!!');
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   DMALM.cdsDOCATT.FieldByName('DODCCATE').AsFloat := StrToFloat(dbeCNTA.Text);
   fCTA := DMALM.cdsDOCATT.FieldByName('DODCCATE').AsFloat;
   fCTS := fCNT - fCTA;

   If fCTS = 0 Then
      DMALM.cdsDOCATT.FieldByName('ODCEST').AsString := 'ATENDIDO'
   Else
      DMALM.cdsDOCATT.FieldByName('ODCEST').AsString := 'PARCIAL';

   DMALM.cdsDOCATT.FieldByName('DODCCSLD').AsFloat := fCTS;
   pnlAttArt.Visible := False;
   DMALM.cdsDOCATT.Post;
   Screen.Cursor := crDefault;
End;

Procedure TFArtAtt.Z2bbtnATTCancelClick(Sender: TObject);
Begin
   pnlAttArt.Visible := False;
   DMALM.cdsDOCATT.Cancel;
End;

Procedure TFArtAtt.Z2bbtnOAOKClick(Sender: TObject);
Var
   fCNAT, fCNT, {fCTA,} fCTS: Double;
  //fCNATg, fCNATu, fCTSg, fCTSu : Double;
   fCINgresada, Contenido: Double;
Begin
   Screen.Cursor := crHourGlass;
   Contenido := DMALM.cdsArti.FieldByName('ARTCONT').AsFloat;
   fCNT := DMALM.cdsDOCATT.FieldByName('DODCCNT').AsFloat * Contenido + DMALM.cdsDOCATT.FieldByName('DODCCNTU').AsFloat;
   fCTS := DMALM.cdsDOCATT.FieldByName('DODCCSLD').AsFloat * Contenido + DMALM.cdsDOCATT.FieldByName('DODCCSLDU').AsFloat;
   FCNAT := DMALM.cdsDOCATT.FieldByName('DODCCATE').AsFloat * Contenido + DMALM.cdsDOCATT.FieldByName('DODCCATEU').AsFloat;

   fCIngresada := strToFloat(fRegNtaE.dbeCantidadG.text) * Contenido + strToFloat(fRegNtaE.dbeCantidadU.text);

   If fCIngresada > fCTS Then
      ErrorMsg('Ojo', 'La cantidad Ingresada excede al saldo !!!');
   pnlAttArt.Visible := False;
   Screen.Cursor := crDefault;
   ModalResult := mrOK;
End;

Procedure TFArtAtt.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
End;

End.

