Unit ALM225;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Mask, wwdbedit, wwdbdatetimepicker, ExtCtrls,
   wwdblook, MsgDlgs;

Type
   TFGuiaNumAnula = Class(TForm)
      Z2bbtnGraba: TBitBtn;
      Z2bbtnSalir: TBitBtn;
      Panel1: TPanel;
      lblTit1: TLabel;
      lblTit2: TLabel;
      Panel2: TPanel;
      lblTit3: TLabel;
      dbeNumGuia: TwwDBEdit;
      dblcompania: TwwDBLookupCombo;
      edtCompania: TEdit;
      Panel3: TPanel;
      Label1: TLabel;
      edtSerie: TwwDBEdit;
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure dbeNumGuiaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcompaniaExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
      Procedure fg_GetSerieNumero(wgCompania: String; Var wgSerie: String; Var wgNumero: String);
      Procedure fg_GrabarGuiaRemision(wgCompania, wg_Serie, wgNumero: String);
      Function fg_ExisteGuiaRemision(wgCompania, wg_Serie, wgNumero: String): Boolean;
      Function fg_Anular_Numero(wsCompania, wsSerie, wsNumero: String): Boolean;
   Public
    { Public declarations }
      xsGuiaRemCompania: String;
   End;

Var
   FGuiaNumAnula: TFGuiaNumAnula;

Implementation

{$R *.dfm}

Uses ALMDM1, ALM220;

Procedure TFGuiaNumAnula.Z2bbtnGrabaClick(Sender: TObject);
Begin
   If Question(Caption, 'Este Proceso: ' + #13 + #13 +
      'Acepta la Guia de Remisión ' + #13 + #13 + #13 + 'Desea Continuar ') Then
   Begin
      fg_GrabarGuiaRemision(dblcompania.Text, edtSerie.Text, dbeNumGuia.Text);
      Close;
   End;
End;

Procedure TFGuiaNumAnula.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin
   //FiltraTabla( DMALM.cdsCIA,   'TGE101', 'CIAID','CIAID');

   dblcompania.LookupTable := DMALM.cdsCIA;
   dblcompania.LookupField := 'CIAID';
  (*xSQL:='SELECT MAX(NVL(SUBSTR(NUMGUIA,2,7),''0'')) AS NUM FROM LOG_GUI_REM '
       +'Where CIAID='''  +DMALM.cdsCnt300.FieldByName('CIAID').AsString  +''' '
       +  'and SERGUIA='''+DMALM.cdsCnt300.FieldByName('SERGUIA').AsString+''' '
       +  'and SUBSTR(NUMGUIA,1,1)<>''I''';

  DMALM.cdsTGE.Close;
  DMALM.cdsTGE.DataRequest(xSQL);
  DMALM.cdsTGE.Open;

 if DMALM.cdsTGE.FieldByName('NUM').IsNull then
     dbeNumGuia.Text:='0000001'
 else
     dbeNumGuia.Text:=DMALM.StrZero( IntToStr( DMALM.cdsTGE.FieldByName('NUM').AsInteger+1 ), 7 );

  DMALM.cdsCnt300.Edit;
  DMALM.cdsCnt300.FieldByName('FECGUIA').AsDateTime:=DateS;
  //DMALM.cdsCnt300.Post;
  *)
End;

Procedure TFGuiaNumAnula.Z2bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFGuiaNumAnula.dbeNumGuiaExit(Sender: TObject);
Begin
   dbeNumGuia.Text := DMALM.StrZero(IntToStr(StrToInt(dbeNumGuia.Text)), 7);
End;

Procedure TFGuiaNumAnula.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFGuiaNumAnula.dblcompaniaExit(Sender: TObject);
Var
   xsSerie, xsNumero: String;
Begin
   xsSerie := '';
   xsNumero := '';
   edtCompania.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcompania.Text), 'CIADES');
   fg_GetSerieNumero(dblcompania.Text, xsSerie, xsNumero);
   If xsNumero <> '' Then
   Begin
      edtSerie.Text := xsSerie;
      dbeNumGuia.Text := xsNumero;
      dbeNumGuia.SetFocus;
   End;
End;

Procedure TFGuiaNumAnula.fg_GetSerieNumero(wgCompania: String; Var wgSerie: String; Var wgNumero: String);
Var
   xsSql: String;
Begin
   xsSQL := 'SELECT SERIEID FROM FAC103 A WHERE CIAID=' + QuotedStr(wgCompania) + ' AND FLAGV=' + QuotedStr('G');
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xsSQL);
   DMALM.cdsQry.Open;

   If DMALM.cdsQry.FieldByName('SERIEID').AsString = '' Then
   Begin
      ShowMessage('Error : No existe Serie para Guia de Remision');
      Close;
      Exit;
   End;
   wgSerie := DMALM.cdsQry.FieldByName('SERIEID').AsString;
   //número
   xsSQL := 'SELECT MAX(NVL(SUBSTR(NUMGUIA,2,7),' + QuotedStr('0') + ')) AS NUM FROM LOG_GUI_REM '
      + ' WHERE CIAID=' + QuotedStr(dblcompania.Text)
      + ' AND SERGUIA=' + QuotedStr(wgSerie)
      + ' AND SUBSTR(NUMGUIA,1,1)<>' + QuotedStr('I');

   DMALM.cdsTGE.Close;
   DMALM.cdsTGE.DataRequest(xsSql);
   DMALM.cdsTGE.Open;

   If DMALM.cdsTGE.FieldByName('NUM').IsNull Then
      wgNumero := '0000001'
   Else
      wgNumero := DMALM.StrZero(IntToStr(DMALM.cdsTGE.FieldByName('NUM').AsInteger + 1), 7);

End;

Procedure TFGuiaNumAnula.fg_GrabarGuiaRemision(wgCompania, wg_Serie, wgNumero: String);
Begin
   If fg_ExisteGuiaRemision(wgCompania, wg_Serie, wgNumero) Then
   Begin
      ShowMessage('Numero de Guia ya fue Usado');
   End;
   If fg_Anular_Numero(wgCompania, wg_Serie, wgNumero) Then
   Begin
      Try
         //bbtnFiltraClick(Self);
         ShowMessage('Número de Guía Remisión Anulada');
      Except
         ShowMessage('Error al Grabar');
      End
   End
   Else
   Begin
      ShowMessage('Error al Grabar');
   End;
End;

Function TFGuiaNumAnula.fg_ExisteGuiaRemision(wgCompania, wg_Serie, wgNumero: String): Boolean;
Var
   xsSQL: String;
Begin
   xsSQL := 'SELECT NUMGUIA FROM LOG_GUI_REM '
      + 'WHERE CIAID=' + QuotedStr(wgCompania) + ' AND SERGUIA=' + QuotedStr(wg_Serie) + ' AND NUMGUIA=' + QuotedStr(wgNumero);

   DMALM.cdsTGE.Close;
   DMALM.cdsTGE.DataRequest(xsSQL);
   DMALM.cdsTGE.Open;

   If DMALM.cdsTGE.RecordCount <= 0 Then
      Result := False
   Else
      Result := True;
End;

Function TFGuiaNumAnula.fg_Anular_Numero(wsCompania, wsSerie, wsNumero: String): Boolean;
Var
   xsSQL: String;
Begin
   Result := False;

   xsSQL := 'Select * from LOG_GUI_REM '
      + 'Where CIAID=' + QuotedStr(wsCompania)
      + 'and SERGUIA=' + QuotedStr(wsSerie)
      + 'and NUMGUIA=' + QuotedStr(wsNumero);
   DMALM.cdsCnt300.Close;
   DMALM.cdsCnt300.DataRequest(xsSQL);
   DMALM.cdsCnt300.Open;

   DMALM.cdsCnt300.Insert;
   DMALM.cdsCnt300.FieldByName('CIAID').AsString := wsCompania;
   DMALM.cdsCnt300.FieldByName('FECGUIA').AsDateTime := DateS;
   DMALM.cdsCnt300.FieldByName('SERGUIA').AsString := wsSerie;
   DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString := wsNumero;
   DMALM.cdsCnt300.FieldByName('USUARIO').AsString := DMALM.wUsuario;
   DMALM.cdsCnt300.FieldByName('FECREGGUIA').AsDateTime := DateS + SysUtils.Time;
   DMALM.cdsCnt300.FieldByName('ESTADO').AsString := 'ANULADO';
   DMALM.cdsCnt300.FieldByName('FECANUGUIA').AsDateTime := Date + SysUtils.Time;
   DMALM.cdsCnt300.FieldByName('GUIAANOMES').AsString := Copy(DMALM.cdsCnt300.FieldByName('FECGUIA').AsString, 7, 4) + Copy(DMALM.cdsCnt300.FieldByName('FECGUIA').AsString, 4, 2);
   DMALM.cdsPost(DMALM.cdsCnt300);
   DMALM.cdsCnt300.Post;

   If DMALM.cdsCnt300.ApplyUpdates(0) > 0 Then
   Begin
      DMALM.cdsCnt300.Close;
      ShowMessage('Error al Grabar');
      Exit;
   End;

   Result := true;
End;

Procedure TFGuiaNumAnula.FormShow(Sender: TObject);
Begin
   dblcompania.Text := xsGuiaRemCompania;
   dblcompaniaExit(dblcompania);
   dblcompania.Enabled := False;
End;

End.

