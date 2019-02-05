Unit ALM224;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : ALM224
//Formulario               : FGuiaNum
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Para verificar el numero de  Guías de Remisión
//Modificado
// HPC_201310_ALM 14/12/2013: Se modifica el tamaño del formulario
// HPC_201401_ALM 01/07/2014: Se modifica el filtro  en el Select
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Mask, wwdbedit, wwdbdatetimepicker, ExtCtrls, MsgDlgs;

Type
   TFGuiaNum = Class(TForm)
      Z2bbtnGraba: TBitBtn;
      Z2bbtnSalir: TBitBtn;
      Panel1: TPanel;
      lblTit1: TLabel;
      lblTit2: TLabel;
      Panel2: TPanel;
      lblTit3: TLabel;
      dbeNumGuia: TwwDBEdit;
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure dbeNumGuiaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FGuiaNum: TFGuiaNum;

Implementation

{$R *.dfm}

Uses ALMDM1, ALM220;

Procedure TFGuiaNum.Z2bbtnGrabaClick(Sender: TObject);
Begin
   If Question(Caption, 'Este Proceso: ' + #13 + #13 +
      'Acepta la Guia de Remisión ' + #13 + #13 + #13 + 'Desea Continuar ') Then
   Begin
      fNumOk := True;
      Close;
   End;
End;

Procedure TFGuiaNum.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin

// Inicio HPC_201401_ALM
//xSQL:='SELECT MAX(NVL(SUBSTR(NUMGUIA,2,7),''0'')) AS NUM '
   xSQL := 'SELECT MAX(NVL(SUBSTR(NUMGUIA,1,7),''0'')) AS NUM '
      + '  From LOG_GUI_REM '
      + ' Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
      + '   and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
      + '   and SUBSTR(NUMGUIA,1,1)<>''I'' '
      + '   and length(NUMGUIA)=7';
// Final HPC_201401_ALM

   DMALM.cdsTGE.Close;
   DMALM.cdsTGE.DataRequest(xSQL);
   DMALM.cdsTGE.Open;

   If DMALM.cdsTGE.FieldByName('NUM').IsNull Then
      dbeNumGuia.Text := '0000001'
   Else
      dbeNumGuia.Text := DMALM.StrZero(IntToStr(DMALM.cdsTGE.FieldByName('NUM').AsInteger + 1), 7);

   DMALM.cdsCnt300.Edit;
   DMALM.cdsCnt300.FieldByName('FECGUIA').AsDateTime := DateS;
  //DMALM.cdsCnt300.Post;
End;

Procedure TFGuiaNum.Z2bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFGuiaNum.dbeNumGuiaExit(Sender: TObject);
Begin
   dbeNumGuia.Text := DMALM.StrZero(IntToStr(StrToInt(dbeNumGuia.Text)), 7);
End;

Procedure TFGuiaNum.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

End.

