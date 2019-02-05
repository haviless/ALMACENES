Unit ALM208;
// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ComCtrls, ppBands, ppClass, ppCtrls, ppReport, ppPrnabl,
   ppStrtch, ppSubRpt, ppCache, ppComm, ppRelatv, ppProd;

Type
   TFToolDetalleMovAlm = Class(TForm)
      pgcToolDetMovAlm: TPageControl;
      tbshReportes: TTabSheet;
      Z1sbIngreso: TSpeedButton;
      Z1sbSalida: TSpeedButton;
      SpeedButton1: TSpeedButton;
      ppReport1: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppSubReport2: TppSubReport;
      ppChildReport2: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppDBText1: TppDBText;
      ppLabel2: TppLabel;
      ppDBText3: TppDBText;
      ppDetailBand3: TppDetailBand;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppLabel3: TppLabel;
      ppDBText4: TppDBText;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppFooterBand2: TppFooterBand;
      ppDBText2: TppDBText;
      ppLabel1: TppLabel;
      Procedure Z1sbIngresoClick(Sender: TObject);
      Procedure Z1sbSalidaClick(Sender: TObject);
      Procedure SpeedButton1Click(Sender: TObject);
   Private
    { Private declarations }
      Procedure RQ(pNisatip: wideString);
   Public
    { Public declarations }
   End;

Var
   FToolDetalleMovAlm: TFToolDetalleMovAlm;

Implementation

Uses ALMDM1, ALM001;

{$R *.DFM}

Procedure TFToolDetalleMovAlm.Z1sbIngresoClick(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'SELECT * FROM LOG315 WHERE NISATIP=' + quotedstr('INGRESO');
   Mtx.UsuarioSQL.Clear;
   Mtx.UsuarioSQL.Add(sSQL);
   Mtx.NewQuery;

 //RQ(ssql);
End;

Procedure TFToolDetalleMovAlm.Z1sbSalidaClick(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'SELECT * FROM LOG315 WHERE NISATIP=' + quotedstr('SALIDA');

   Mtx.UsuarioSQL.Clear;
   Mtx.UsuarioSQL.Add(sSQL);
   Mtx.NewQuery;

 //RQ(ssql);
End;

Procedure TFToolDetalleMovAlm.SpeedButton1Click(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'SELECT * FROM LOG315 WHERE (NISATIP=' + quotedstr('SALIDA') + ' OR NISATIP=''INGRESO'')';
   Mtx.UsuarioSQL.Clear;
   Mtx.UsuarioSQL.Add(sSQL);
   Mtx.NewQuery;

 //RQ(ssql);
End;

Procedure TFToolDetalleMovAlm.RQ(pNisatip: wideString);
Var
   ssql, xwhere: String;
   iX: integer;
Begin
   xwhere := '';
 // carga la sentencia que se halla ejecutado en el grid del mantenimiento
   ssql := Mtx.FMant.SQL;
   For iX := 0 To Length(ssql) Do
 // si hubiera en la sentencia algún WHERE lo carga
      If copy(ssql, iX, 5) = 'WHERE' Then
      Begin
         xwhere := copy(ssql, iX + 6, length(ssql));
         break;
      End;
   If xwhere <> '' Then
      pNisatip := pNisatip + ' AND ' + xwhere;
   Screen.Cursor := crHourGlass;
   Mtx.ClientDataSet.Close;
   Mtx.ClientDataSet.DataRequest(pNisatip);
   Mtx.ClientDataSet.open;
   Mtx.RefreshDisplay;
   Screen.Cursor := crDefault;
End;

End.

