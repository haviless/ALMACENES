Unit ALM227;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : ALM227
//Formulario               : FToolGuiaRemisionSalida
//Fecha de Creación        : 13/08/2012
//Autor                    : Abelardo Sulca Palomino
//Objetivo                 : ToolBar de Guías de Remisión por Salidas
//
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Mant, DB, Wwdbigrd, Dialogs, ExtCtrls, StdCtrls, Buttons;

Type
   TFToolGuiaRemisionSalida = Class(TForm)
      pnlAct: TPanel;
   Private
    { Private declarations }
   Public
    { Public declarations }
      Procedure fg_EditarGuiRemisionSalida(Sender: TObject; MantFields: TFields);
     //Procedure fg_AdicionarGuiRemision(Sender : TObject; MantFields: TFields);
   End;

Var
   FToolGuiaRemisionSalida: TFToolGuiaRemisionSalida;

Implementation
Uses ALMDM1, ALM223, ALM220;
{$R *.dfm}

Procedure TFToolGuiaRemisionSalida.fg_EditarGuiRemisionSalida(Sender: TObject; MantFields: TFields);
Var
   xsSQL: String;
Begin
   If DMALM.cdsGuiaRemSalida.RecordCount <= 0 Then
   Begin
      ShowMessage('No exiten Nota(s) de Salida para Generar Guía de Remisión');
      Exit;
   End;
   (*If DMALM.cdsGuiaRemSalida.FieldByName('CIAID').AsString<>cCiaGuia then
   Begin
      ShowMessage('Guia de Remisión solo se usa para Compañía '+cCiaGuia);
      Exit;
   End;*)
   //If DMALM.cdsGuiaRemSalida.FieldByName('NISSIT').AsString<>'ACEPTADO' Then
   If Mtx3010.FMant.cds2.FieldByName('NISSIT').AsString <> 'ACEPTADO' Then
   Begin
      ShowMessage('Notas de Salida tiene que estar Aceptada');
      Exit;
   End;

   xSQL := 'SELECT * FROM LOG314 ' +
      ' WHERE CIAID = ' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('CIAID').AsString) +
      ' AND LOCID = ' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('LOCID').AsString) +
      ' AND TINID = ' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('TINID').AsString) +
      ' AND ALMID = ' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('ALMID').AsString) +
      ' AND NISATIP = ' + QuotedStr('SALIDA') +
      ' AND NISAID = ' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('NISAID').AsString);

   DMALM.cdsNIS.Close;
   DMALM.cdsNIS.DataRequest(xSQL);
   DMALM.cdsNIS.Open;

   xsSql := 'Select * from LOG_GUI_REM '
      + 'Where CIAID=' + Quotedstr(Mtx3010.FMant.cds2.FieldByName('CIAID').AsString)
      + 'and TINID=' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('TINID').AsString)
      + 'and NISAID=' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('NISAID').AsString)
      + 'and ESTADO<>''ANULADO'' '
      + 'Order by SERGUIA, NUMGUIA';
   DMALM.cdsMovCNT.Close;
   DMALM.cdsMovCNT.DataRequest(xsSql);
   DMALM.cdsMovCNT.Open;

   cFActivo := 'N';
   If DMALM.cdsMovCNT.RecordCount > 0 Then
   Begin
      ShowMessage('Nota de Salida Tiene Generada(s) Guia(s) de Remisión');
      Try
         DMALM.wModoGuia := 'M';
         FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
         FGuiaRemisionALM.xsCompania := Mtx3010.FMant.cds2.FieldByName('CIAID').AsString;
         FGuiaRemisionALM.xsOrigen := 'NS';
         FGuiaRemisionALM.ShowModal;
      Finally
         FGuiaRemisionALM.Free;
      End;
   End
   Else
   Begin
      Try
         DMALM.wModoGuia := 'A';
         FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
         FGuiaRemisionALM.xsCompania := Mtx3010.FMant.cds2.FieldByName('CIAID').AsString;
         FGuiaRemisionALM.xsOrigen := 'NS';
         FGuiaRemisionALM.ShowModal;
      Finally
         FGuiaRemisionALM.Free;
      End;
   End;
End;

End.

