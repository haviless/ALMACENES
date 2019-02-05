Unit ALM251;
// HPC_201602_ALM 30/04/2016: Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, Buttons, ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv,
   ppCache, ppDB, ppDBPipe, ppBands, ppPrnabl, ppCtrls, ppVar;

Type
   TFToolMaesProv = Class(TForm)
      pnlTools: TPanel;
      z1sbGiro: TSpeedButton;
      ppDesigner1: TppDesigner;
      ppRep: TppReport;
      ppDBPipeline1: TppDBPipeline;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppLabel6: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      Timer1: TTimer;
      Procedure z1sbGiroClick(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolMaesProv: TFToolMaesProv;
   xAccesoBotones: Boolean;

Implementation

Uses ALMDM1;

{$R *.DFM}

Procedure TFToolMaesProv.z1sbGiroClick(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := ' SELECT PROV,PROVDES,PROVRUC,TIPPROVID,TIPPROVDES FROM LOG201 ORDER BY TIPPROVID,PROV';
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;
   If DMALM.cdsReporte.RecordCount > 0 Then
   Begin
      ppRep.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\TipoProveedor.rtm';
      ppRep.Template.LoadFromFile;
    //ppDesigner1.Show;
      ppRep.Print;
   End
   Else
   Begin
      Raise Exception.Create('No existe registros que mostrar');
   End;
End;

Procedure TFToolMaesProv.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolMaesProv';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolMaesProv);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

End.

