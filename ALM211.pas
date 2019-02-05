Unit ALM211;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ppDB, ppDBPipe,
   ppBands, ppCache, ppClass, ppComm, ppRelatv, ppProd, ppReport, ppCtrls,
   ppPrnabl, ppVar;

Type
   TFPProy = Class(TForm)
      pnlBoton: TPanel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      dbgProy: TwwDBGrid;
      ppRParamRep: TppReport;
      ppDBParamRep: TppDBPipeline;
      Z1Imprimir: TBitBtn;
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
      Procedure FormActivate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z1ImprimirClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FPProy: TFPProy;

Implementation

//uses ALMDM1,ALM001,ALM740;
Uses ALMDM1, oaIN2000, ALM740;

{$R *.DFM}

Procedure TFPProy.FormActivate(Sender: TObject);
Begin
   dbgProy.Selected.clear;
   dbgProy.Selected.Add('CIAID'#9'3'#9'Cia');
   dbgProy.Selected.Add('TINID'#9'3'#9'Tipo~Inv.');
   dbgProy.Selected.Add('ARTID'#9'9'#9'Id~Articulo');
   dbgProy.Selected.Add('STKSMAX'#9'10'#9'Stock~Maximo');
   dbgProy.Selected.Add('STKSMIN'#9'10'#9'Stock~Minimo');
   dbgProy.Selected.Add('ARTPCU'#9'10'#9'Sumatoria');
   dbgProy.Selected.Add('STKSPRE'#9'10'#9'Punto~Reposición');
   dbgProy.Selected.Add('STKSCPE'#9'10'#9'Cantidad~Pedir');
End;

Procedure TFPProy.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End
End;

Procedure TFPProy.Z2bbtnRegCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFPProy.Z1ImprimirClick(Sender: TObject);
Begin
   ppDBParamRep.DataSource := DMALM.dsTMP;

   ppRParamRep.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ParametroProyectadoMov.Rtm';
   ppRParamRep.Template.LoadFromFile;

   pplblCia.Caption := FToolParaRepo.dbeCIA.text;
   ppRParamRep.Print;
End;

Procedure TFPProy.Z2bbtnRegOkClick(Sender: TObject);
Begin
   DMALM.cdsArti.DisableControls;
   DMALM.cdsArti.First;
   While Not DMALM.cdsArti.Eof Do
   Begin
      DMALM.cdsTMP.SetKey;
      DMALM.cdsTMP.FieldByName('CIAID').AsString := DMALM.cdsArti.FieldByName('CIAID').AsString;
      DMALM.cdsTMP.FieldByName('TINID').AsString := DMALM.cdsArti.FieldByName('TINID').AsString;
      DMALM.cdsTMP.FieldByName('GRARID').AsString := DMALM.cdsArti.FieldByName('GRARID').AsString;
      DMALM.cdsTMP.FieldByName('ARTID').AsString := DMALM.cdsArti.FieldByName('ARTID').AsString;
      If DMALM.cdsTMP.GotoKey Then
      Begin
         DMALM.cdsArti.Edit;
         DMALM.cdsArti.FieldByName('STKSMAX').AsFloat := DMALM.cdsTMP.FieldByName('STKSMAX').AsFloat;
         DMALM.cdsArti.FieldByName('STKSMIN').AsFloat := DMALM.cdsTMP.FieldByName('STKSMIN').AsFloat;
         DMALM.cdsArti.FieldByName('STKSPRE').AsFloat := DMALM.cdsTMP.FieldByName('STKSPRE').AsFloat;
         DMALM.cdsArti.FieldByName('STKSCPE').AsFloat := DMALM.cdsTMP.FieldByName('STKSCPE').AsFloat;
         DMALM.cdsArti.Post;
      End;
      DMALM.AplicaDatos(DMALM.cdsArti, 'ARTI');
      DMALM.cdsArti.Next;
   End;

   DMALM.cdsArti.EnableControls;

End;

Procedure TFPProy.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
End;

End.

