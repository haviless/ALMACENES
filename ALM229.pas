Unit ALM229;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : ALM229
//Formulario               : FToolGuiaRemisionRequerimiento
//Fecha de Creación        : 13/08/2012
//Autor                    : Abelardo Sulca Palomino
//Objetivo                 : ToolBar de Guías de Remisión por Requerimiento de Usuario
//
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Mant, DB, Wwdbigrd, Dialogs, ExtCtrls, StdCtrls, Buttons;

Type
   TFToolGuiaRemisionRequerimiento = Class(TForm)
      pnlAct: TPanel;
   Private
    { Private declarations }
   Public
    { Public declarations }
      Procedure fg_EditarGuiRemisionRequerimiento(Sender: TObject; MantFields: TFields);
   End;

Var
   FToolGuiaRemisionRequerimiento: TFToolGuiaRemisionRequerimiento;

Implementation
Uses ALMDM1, ALM223, ALM220;
{$R *.dfm}

Procedure TFToolGuiaRemisionRequerimiento.fg_EditarGuiRemisionRequerimiento(Sender: TObject; MantFields: TFields);
Var
   xsSQL: String;
Begin
   If DMALM.cdsGuiaRemRequerimiento.RecordCount <= 0 Then
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
   If Mtx3010.FMant.cds2.FieldByName('URQEST').AsString <> 'ACEPTADO' Then
   Begin
      ShowMessage('El Traslado tiene que estar Aceptado');
      Exit;
   End;
   xsSQL := 'SELECT * FROM LOG306  '
      + ' WHERE LOG306.CIAID =  ' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('CIAID').AsString)
      + ' AND LOG306.LOCID =  ' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('LOCID').AsString)
      + ' AND LOG306.CCOSID =  ' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('CCOSID').AsString)
      + ' AND LOG306.URQID =  ' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('URQID').AsString);

   DMALM.cdsNIS.Close;
   DMALM.cdsNIS.DataRequest(xsSQL);
   DMALM.cdsNIS.Open;

   xsSql := 'Select * from LOG_GUI_REM '
      + 'Where CIAID=' + Quotedstr(Mtx3010.FMant.cds2.FieldByName('CIAID').AsString)
      + 'and NISAID=' + QuotedStr(Mtx3010.FMant.cds2.FieldByName('URQID').AsString)
      + 'and ESTADO<>''ANULADO'' '
      + 'Order by SERGUIA, NUMGUIA';
   DMALM.cdsMovCNT.Close;
   DMALM.cdsMovCNT.DataRequest(xsSql);
   DMALM.cdsMovCNT.Open;

   cFActivo := 'S';
   If DMALM.cdsMovCNT.RecordCount > 0 Then
   Begin
      ShowMessage('Traslado Tiene Generada(s) Guia(s) de Remisión');
      Try
         DMALM.wModoGuia := 'M';
         FGuiaRemisionALM := TFGuiaRemisionALM.Create(Self);
         FGuiaRemisionALM.xsCompania := Mtx3010.FMant.cds2.FieldByName('CIAID').AsString;
         FGuiaRemisionALM.xsOrigen := 'RU';
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
         FGuiaRemisionALM.xsOrigen := 'RU';
         FGuiaRemisionALM.ShowModal;
      Finally
         FGuiaRemisionALM.Free;
      End;
   End;
End;
End.

