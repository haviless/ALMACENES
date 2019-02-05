Unit ALM303;
// HPC_201602_ALM 30/04/2016 Entrega a Calidad
{ pjsv Agosto 2000}

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ComCtrls, wwdblook, Mask, wwdbedit, ExtCtrls, Mant,
   ControlGridDisp, db, ppProd, ppClass, ppReport, ppComm, ppRelatv,
   ppCache, ppDB, ppDBPipe, ppBands, ppPrnabl, ppCtrls, ppVar, ppViewr;

Type
   TFContInve = Class(TForm)
      PgStock: TPageControl;
      pgtsStock: TTabSheet;
      pgts2: TTabSheet;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      ppDBPVerifica: TppDBPipeline;
      ppRpVerifica: TppReport;
      TabSheet3: TTabSheet;
      bbValoriza: TSpeedButton;
      bbKardex: TSpeedButton;
      BitBtn1: TSpeedButton;
      bbVerNumI: TSpeedButton;
      bbIngreso: TSpeedButton;
      bbSalida: TSpeedButton;
      bbDetMov: TSpeedButton;
      bbAjuste: TSpeedButton;
      BitBtn2: TSpeedButton;
      BitBtn3: TSpeedButton;
      BitBtn5: TSpeedButton;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      pplblTit1: TppLabel;
      ppLblAl: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      SpeedButton1: TSpeedButton;
      sbtnAsiAlm: TSpeedButton;
      sbtnAsiAju: TSpeedButton;
      Procedure bbIniClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure bbValorizaClick(Sender: TObject);
      Procedure bbKardexClick(Sender: TObject);
      Procedure bbAjusteClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure bbIngresoClick(Sender: TObject);
      Procedure bbSalidaClick(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure bbDetMovClick(Sender: TObject);
      Procedure bbVerNumIClick(Sender: TObject);
      Procedure ppRpVerificaBeforePrint(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure BitBtn5Click(Sender: TObject);
      Procedure ppRpVerificaPreviewFormCreate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure sbtnAsiAlmClick(Sender: TObject);
      Procedure SpeedButton1Click(Sender: TObject);
      Procedure sbtnAsiAjuClick(Sender: TObject);
   Private
    { Private declarations }
      xPanel: TPanel;
      xLabel: TLabel;
      Procedure CreaMensaje;
   Public
    { Public declarations }
      Procedure OnEditNIA(Sender: TObject; MantFields: TFields);
      Procedure OnEditNIS(Sender: TObject; MantFields: TFields);
   End;

Var
   FContInve: TFContInve;
   xwhere: String; //contiene el contenido del where del filtro del componente
   vPestbtn: String; // 0 = Ingreso; 1 = Salida;

Implementation
Uses ALM303_1, ALMDM1, ALM001, ALM410, ALM303_2, ALM310, ALM303_3,
   ALM303_4, ALM303_5, ALM305, ALM306, ALM306A, ALM416;
{$R *.DFM}

Procedure TFContInve.bbIniClick(Sender: TObject);
Begin
   Showmessage('99');
End;

Procedure TFContInve.FormCreate(Sender: TObject);
Begin
   dm1.cdsTipCam.Open;
   dm1.cdsTMoneda.open;
   PgStock.ActivePageIndex := 0;
End;

{ carga la ventana de valorización }

Procedure TFContInve.bbValorizaClick(Sender: TObject);
Var
   xsql: String;
   iX: integer;
Begin
   Screen.Cursor := crHourGlass;
   CreaMensaje;
   xwhere := '';
  { carga la sentencia que se halla ejecutado en el grid del mantenimiento }
   xsql := Mtx1.FMant.SQL;
   For iX := 0 To Length(xsql) Do
   Begin
     { si hubiera en la sentencia algún WHERE lo carga }
      If copy(xsql, iX, 5) = 'WHERE' Then
      Begin
         xwhere := copy(xsql, iX + 6, length(xsql));
         break;
      End;
   End;
   FStockVal := TFStockVal.Create(Self);
   Screen.Cursor := crDefault;
   xPanel.Visible := false;
   xLabel.Free;
   xPanel.Free;
   FStockVal.ShowModal;
   FStockVal.Free;
End;

{carga el KArdex }

Procedure TFContInve.bbKardexClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   FCalculoKardex := TFCalculoKardex.Create(self);
   Screen.Cursor := crDefault;
   FCalculoKardex.ShowModal;
   FCalculoKardex.Free;
End;

Procedure TFContInve.bbAjusteClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
  //** 15/03/2001 - pjsv
   CreaMensaje;
  //**
   DM1.cdsNIA.Close;
   DM1.cdsNIA.DataRequest('SELECT * FROM LOG314 WHERE LOG314.NISATIP=''INGRESO''');
   DM1.cdsNIA.Open;

   DM1.cdsTDNISA.Close;
   DM1.cdsTDNISA.DataRequest('SELECT * FROM TGE157 WHERE TDATIP=''INGRESO'' AND TDAAJUSTE=''S''');
   DM1.cdsTDNISA.Open;

   DM1.cdsOCNIA.Close;
   DM1.cdsOCNIA.DataRequest('SELECT * FROM LOG318');
   DM1.cdsOCNIA.MasterSource := DM1.dsNIA;
   DM1.cdsOCNIA.MasterFields := 'CIAID;ALMID;TDAID;NISAID';
   DM1.cdsOCNIA.IndexFieldNames := 'CIAID;ALMID;TDAID;NISAID';
   DM1.cdsOCNIA.Open;

   dm1.cdsKDX.Close;
   dm1.cdsKDX.DataRequest('SELECT * FROM LOG315 WHERE NISATIP=''INGRESO'' ORDER BY KDXID ');
   dm1.cdsKDX.MasterSource := dm1.dsNIA;
   dm1.cdsKDX.MasterFields := 'CIAID;ALMID;NISAID;TDAID';
   dm1.cdsKDX.IndexFieldNames := 'CIAID;ALMID;NISAID;TDAID';
   dm1.cdsKDX.Open;

   dm1.cdsSTK.Close;
   dm1.cdsSTK.MasterSource := DM1.dsNIA;
   dm1.cdsSTK.MasterFields := 'CIAID;ALMID';
   dm1.cdsSTK.IndexFieldNames := 'CIAID;ALMID';
   dm1.cdsSTK.Open;

   dm1.cdsEUNMED.Close;
   dm1.cdsEUNMED.MasterSource := DM1.dsARTI;
   dm1.cdsEUNMED.MasterFields := 'UNMIDU';
   dm1.cdsEUNMED.IndexFieldNames := 'UNMID';
   dm1.cdsEUNMED.Open;

   dm1.cdsDOCATT.Close;
   dm1.cdsDOCATT.DataRequest('SELECT * FROM LOG305');
   dm1.cdsDOCATT.MasterSource := DM1.dsOCNIA;
   dm1.cdsDOCATT.MasterFields := 'CIAID;ODCID';
   dm1.cdsDOCATT.IndexFieldNames := 'CIAID;ODCID';
   dm1.cdsDOCATT.Open;

   dm1.cdsLOC.Close;
   dm1.cdsLOC.MasterSource := DM1.dsCIA;
   dm1.cdsLOC.MasterFields := 'CIAID';
   dm1.cdsLOC.IndexFieldNames := 'CIAID';
   dm1.cdsLOC.Open;

   dm1.cdsALM.Close;
   dm1.cdsALM.MasterSource := DM1.dsLOC;
   dm1.cdsALM.MasterFields := 'CIAID;LOCID';
   dm1.cdsALM.IndexFieldNames := 'CIAID;LOCID';
   dm1.cdsALM.Open;

   dm1.cdsLOC.open;
   dm1.cdsALM.open;
   dm1.cdsTDNISA.open;
   dm1.cdsTRAN.open;
   dm1.cdsCCOST.open;
   dm1.cdsPROV.open;
   dm1.cdsTDOC.open;
   dm1.cdsSTK.Open;
   dm1.cdscIA.Open;
   FAjustesI := TFAjustesI.Create(self);
   If DM1.cdsNIA.State In [dsInsert, dsEdit] Then
      DM1.cdsNIA.Cancel;
   DM1.cdsNIA.Insert;
   FAjustesI.dblcCIA.Enabled := True;
   FAjustesI.dblcLOC.Enabled := True;
   FAjustesI.dblcTALM.Enabled := True;
   FAjustesI.dblcTDA.Enabled := True;
   FAjustesI.dbeNumNISA.Enabled := True;

   FAjustesI.edNOrdC.Clear;
   FAjustesI.dbeProv.Clear;
   Screen.Cursor := crDefault;
 //** 15/03/2001 - pjsv
   xPanel.Visible := false;
   xLabel.Free;
   xPanel.Free;
 //**
   FAjustesI.ShowModal;
   FAjustesI.free;
   dm1.cdsSTK.close;
   dm1.cdsLOC.close;
   dm1.cdsALM.close;
   dm1.cdsTDNISA.close;
   dm1.cdsTRAN.close;
   dm1.cdsCCOST.close;
   dm1.cdsPROV.close;
   dm1.cdsTDOC.close;
End;

Procedure TFContInve.BitBtn2Click(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
  //** 15/03/2001 - pjsv
   CreaMensaje;
  //**
   DM1.cdsNIS.Close;
   DM1.cdsNIS.DataRequest('SELECT * FROM LOG314 WHERE NISATIP=''SALIDA''');
   DM1.cdsNIS.Open;

   DM1.cdsTDNISA.Close;
   DM1.cdsTDNISA.DataRequest('SELECT * FROM TGE157 WHERE TDATIP=''SALIDA'' AND TDAAJUSTE=''S''');
   DM1.cdsTDNISA.Open;

   DM1.cdsKDX.Close;
   DM1.cdsKDX.DataRequest('SELECT * FROM LOG315 WHERE NISATIP=''SALIDA'' ORDER BY KDXID ');
   DM1.cdsKDX.MasterSource := dm1.dsNIS;
   DM1.cdsKDX.MasterFields := 'CIAID;ALMID;NISAID;TDAID';
   DM1.cdsKDX.IndexFieldNames := 'CIAID;ALMID;NISAID;TDAID';
   DM1.cdsKDX.Open;

   DM1.cdsSTK.Close;
   DM1.cdsSTK.MasterSource := dm1.dsNIS;
   DM1.cdsSTK.MasterFields := 'CIAID;ALMID';
   DM1.cdsSTK.IndexFieldNames := 'CIAID;ALMID';
   DM1.cdsSTK.Open;

   DM1.cdsEUNMED.Close;
   DM1.cdsEUNMED.MasterSource := dm1.dsARTI;
   DM1.cdsEUNMED.MasterFields := 'UNMIDU';
   DM1.cdsEUNMED.IndexFieldNames := 'UNMID';
   DM1.cdsEUNMED.Open;

   DM1.cdsLOC.Close;
   DM1.cdsLOC.MasterSource := dm1.dsCIA;
   DM1.cdsLOC.MasterFields := 'CIAID';
   DM1.cdsLOC.IndexFieldNames := 'CIAID';
   DM1.cdsLOC.Open;

   DM1.cdsALM.Close;
   DM1.cdsALM.MasterSource := dm1.dsLOC;
   DM1.cdsALM.MasterFields := 'CIAID;LOCID';
   DM1.cdsALM.IndexFieldNames := 'CIAID;LOCID';
   DM1.cdsALM.Open;

   dm1.cdsLOC.open;
   dm1.cdsALM.open;
   dm1.cdsTDNISA.open;
   dm1.cdsTRAN.open;
   dm1.cdsCCOST.open;
   dm1.cdsPROV.open;
   dm1.cdsTDOC.open;
   dm1.cdsSTK.Open;
   FAjustesS := TFAjustesS.create(self);
   If DM1.cdsNIS.State In [dsInsert, dsEdit] Then DM1.cdsNIS.Cancel;
   DM1.cdsNIS.Insert;
   FAjustesS.dblcCIA.Enabled := True;
   FAjustesS.dblcTALM.Enabled := True;
   FAjustesS.dbeNumNISA.Enabled := True;
   FAjustesS.Adiciona;
   Screen.Cursor := crDefault;
  //** 15/03/2001 - pjsv
   xPanel.Visible := false;
   xLabel.Free;
   xPanel.Free;
  //**
   FAjustesS.ShowModal;
   FAjustesS.free;
   dm1.cdsLOC.Close;
   dm1.cdsALM.Close;
   dm1.cdsTDNISA.Close;
   dm1.cdsTRAN.Close;
   dm1.cdsCCOST.close;
   dm1.cdsPROV.Close;
   dm1.cdsTDOC.Close;
   dm1.cdsSTK.Close;
End;

{ carga movimientos  }

Procedure TFContInve.BitBtn1Click(Sender: TObject);
Begin
   Screen.Cursor := crHourglass;
   FSQLMovAlmacen := TFSQLMovAlmacen.Create(self);
   Screen.Cursor := crDefault;
   FSQLMovAlmacen.ShowModal;
   FSQLMovAlmacen.free;
End;

Procedure TFContInve.bbIngresoClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
  //** 15/03/2001 - pjsv
   CreaMensaje;
  //**
   With DM1 Do
   Begin
     {with cdsNIA do
     begin
       Close;
//       DataRequest('SELECT LOG314.*,TGE201.PROVDES FROM LOG314,TGE201 WHERE LOG314.NISATIP=''INGRESO'' AND LOG314.PROV=TGE201.PROV' );
       DataRequest('SELECT * FROM LOG314 WHERE LOG314.NISATIP=''INGRESO''' );
       Open;
     end;}

      With cdsTDNISA Do
      Begin
         Close;
         DataRequest('SELECT * FROM TGE157 WHERE TDATIP=''INGRESO''');
         Open;
      End;
      With cdsOCNIA Do
      Begin
         Close;
         DataRequest('SELECT * FROM LOG318');
         MasterSource := dsNIA;
         MasterFields := 'CIAID;ALMID;TDAID;NISAID';
         IndexFieldNames := 'CIAID;ALMID;TDAID;NISAID';
         Open;
      End;
     {with cdsKDX do
     begin
       Close;
       DataRequest('SELECT * FROM LOG315 WHERE NISATIP=''INGRESO''');
       MasterSource    := dsNIA;
       MasterFields    := 'CIAID;ALMID;NISAID;TDAID';
       IndexFieldNames := 'CIAID;ALMID;NISAID;TDAID';
       Open;
     end;
     with cdsSTK do
     begin
       Close;
       MasterSource    := dsNIA;
       MasterFields    := 'CIAID;ALMID';
       IndexFieldNames := 'CIAID;ALMID';
       Open;
     end;}
      With cdsEUNMED Do
      Begin
         Close;
         MasterSource := dsARTI;
         MasterFields := 'UNMIDU';
         IndexFieldNames := 'UNMID';
         Open;
      End;
      With cdsDOCATT Do
      Begin
         Close;
         DataRequest('SELECT * FROM LOG305');
         MasterSource := dsOCNIA;
         MasterFields := 'CIAID;ODCID';
         IndexFieldNames := 'CIAID;ODCID';
         Open;
      End;
      With cdsLOC Do
      Begin
         Close;
         MasterSource := dsCIA;
         MasterFields := 'CIAID';
         IndexFieldNames := 'CIAID';
         Open;
      End;
      With cdsALM Do
      Begin
         Close;
         MasterSource := dsLOC;
         MasterFields := 'CIAID;LOCID';
         IndexFieldNames := 'CIAID;LOCID';
         Open;
      End;
   End;

   FMovAlmE := TFMovAlmE.create(self);
   FMovAlmE.Visible := false;
//  FMovAlm.dbeProv.DataField := 'PROVDES';
   Mtx := TMant.Create(Self);
   Try
      Mtx.Admin := DM1.wAdmin;
      Mtx.Module := dm1.wModulo;
      Mtx.DComC := DM1.DCOM1;
      Mtx.User := DM1.wUsuario;
      Mtx.TableName := 'LOG314';
      Mtx.ClientDataSet := DM1.cdsNIA;
      Mtx.ControlGridDisp := Fprincipal.cgdPrincipal;
      Mtx.OnInsert := Nil;
      Mtx.Titulo := 'Movimientos de Ingreso';
      Mtx.OnEdit := OnEditNIA;
      Mtx.OnShow := Nil;
      Mtx.OnCreateMant := Nil;
      Mtx.Filter := 'NISATIP=''INGRESO''';
      Mtx.SectionName := 'ALMContaInveIng';
      Mtx.FileNameIni := '\oaALM.INI';
      Mtx.NoVisible.Clear;
      Screen.Cursor := crDefault;
      xPanel.Visible := false;
      xLabel.Free;
      xPanel.Free;
      Mtx.Execute;
   Finally
      Screen.Cursor := crDefault;
      Mtx.Filter := '';
      Mtx.Free;
      FMovAlmE.Free;
   End;

End;

Procedure TFContInve.bbSalidaClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
  //** 15/03/2001 - pjsv
   CreaMensaje;
  //**
   With DM1 Do
   Begin
   {with cdsNIS do
    begin
     Close;
     DataRequest('SELECT * FROM LOG314 WHERE NISATIP=''SALIDA''');
     Open;
    end;}
      With cdsTDNISA Do
      Begin
         Close;
         DataRequest('SELECT * FROM TGE157 WHERE TDATIP=''SALIDA''');
         Open;
      End;
   {with cdsKDX do
    begin
     Close;
     DataRequest('SELECT * FROM LOG315 WHERE NISATIP=''SALIDA''');
     MasterSource    := dsNIS;
     MasterFields    := 'CIAID;ALMID;NISAID;TDAID';
     IndexFieldNames := 'CIAID;ALMID;NISAID;TDAID';
     Open;
    end;
   with cdsSTK do
    begin
     Close;
     MasterSource    := dsNIS;
     MasterFields    := 'CIAID;ALMID';
     IndexFieldNames := 'CIAID;ALMID';
     Open;
    end;
   with cdsEUNMED do
    begin
     Close;
     MasterSource    := dsARTI;
     MasterFields    := 'UNMIDU';
     IndexFieldNames := 'UNMID';
     Open;
    end;}
      With cdsLOC Do
      Begin
         Close;
         MasterSource := dsCIA;
         MasterFields := 'CIAID';
         IndexFieldNames := 'CIAID';
         Open;
      End;
      With cdsALM Do
      Begin
         Close;
         MasterSource := dsLOC;
         MasterFields := 'CIAID;LOCID';
         IndexFieldNames := 'CIAID;LOCID';
         Open;
      End;
   End;

   FMovAlmS := TFMovAlms.create(self);
   FMovAlmS.Visible := false;
   Mtx := TMant.Create(Self);
   Try
      Mtx.Admin := DM1.wAdmin;
      Mtx.Module := dm1.wModulo;
      Mtx.DComC := DM1.DCOM1;
      Mtx.User := DM1.wUsuario;
      Mtx.TableName := 'LOG314';
      Mtx.ClientDataSet := DM1.cdsNIS;
      Mtx.ControlGridDisp := fprincipal.cgdPrincipal;
      Mtx.OnEdit := OnEditNIS;
      Mtx.OnInsert := Nil;
      Mtx.Titulo := 'Movimientos de Salida';
      Mtx.OnShow := Nil;
      Mtx.OnCreateMant := Nil;
      Mtx.Filter := 'NISATIP=''SALIDA''';
      Mtx.SectionName := 'ALMContaInveSal';
      Mtx.FileNameIni := '\oaALM.INI';
      Mtx.NoVisible.Clear;
      Screen.Cursor := crDefault;
      xPanel.Visible := false;
      xLabel.Free;
      xPanel.Free;
      Mtx.Execute;
   Finally
      Mtx.Filter := '';
      Mtx.Free;
      FMovAlmS.Free;
   End;
End;

Procedure TFContInve.OnEditNIA(Sender: TObject; MantFields: TFields);
Var
   sCIA, sLOC, sALM, sNIS, sTDO, sSQL: String;
Begin
   If DM1.cdsNIA.RecordCount = 0 Then
   Begin
      showmessage('Error, No existen registros a editar');
      exit;
   End;
   With MantFields Do
   Begin
      sCIA := FieldByName('CIAID').AsString;
      sLOC := FieldByName('LOCID').AsString;
      sALM := FieldByName('ALMID').AsString;
      sNIS := FieldByName('NISAID').AsString;
      sTDO := FieldByName('TDAID').AsString;
   End;
  {with DM1 do
  begin
     cdsNIA.Data :=  Mtx.ClientDataSet.Data;
     cdsNIA.Locate ('CIAID;LOCID;ALMID;NISAID;TDAID',VarArrayOf([sCIA, sLOC, sALM, sNIS, sTDO]),[]);
  end;}
   With DM1.cdsTRAN Do
   Begin
      Close;
      sSQL := 'SELECT * FROM TGE208 WHERE TDAID=''' + sTDO + '''';
      DataRequest(sSQL);
      Open;
   End;
   FMovAlmE.ShowModal;
  //Mtx.ClientDataSet.Data := DM1.cdsNIA.Data;
  //Mtx.RefreshFilter;
End;

Procedure TFContInve.OnEditNIS(Sender: TObject; MantFields: TFields);
Var
   sCIA, sLOC, sALM, sNIS, sTDO, sSQL, sTIP, sXSQL: String;
Begin
   If DM1.cdsNIS.RecordCount = 0 Then
   Begin
      Showmessage('Error, No existen registros a editar');
      exit;
   End;
   With MantFields Do
   Begin
      sCIA := FieldByName('CIAID').AsString;
      sLOC := FieldByName('LOCID').AsString;
      sALM := FieldByName('ALMID').AsString;
      sNIS := FieldByName('NISAID').AsString;
      sTDO := FieldByName('TDAID').AsString;
      sTIP := FieldByName('NISATIP').AsString;
   End;
  {with DM1 do
  begin
    sXSQL := Mtx.FMant.SQL;
    cdsNIS.Close;
    cdsNIS.DataRequest(sXSQL);
    cdsNIS.Open;
    sXSQL := 'SELECT * FROM LOG314 WHERE'+
              '     CIAID='''+sCIA+''''+
              ' AND LOCID='''+sLOC+''''+
              ' AND ALMID='''+sALM+''''+
              ' AND NISAID='''+sNIS+''''+
              ' AND TDAID='''+sTDO+''''+
              ' AND NISATIP=''SALIDA''';

     cdsNIS.Close;
     cdsNIS.DataRequest(sXSQL);
     cdsNIS.Open;
  end;}
   With DM1.cdsTRAN Do
   Begin
      Close;
      sSQL := 'SELECT * FROM TGE208 WHERE TDAID=''' + sTDO + '''';
      DataRequest(sSQL);
      Open;
   End;
   FMovAlmS.ShowModal;
  //Mtx.ClientDataSet.Data := DM1.cdsNIS.Data;
  //Mtx.RefreshFilter;

End;

Procedure TFContInve.bbDetMovClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
  //** 15/03/2001 - pjsv
   CreaMensaje;
  //**
   FDetMov := TFDetMov.create(self);
   FDetMov.Visible := false;
   Mtx := TMant.Create(Self);
   Try
      Mtx.Admin := DM1.wAdmin;
      Mtx.Module := dm1.wModulo;
      Mtx.DComC := DM1.DCOM1;
      Mtx.User := DM1.wUsuario;
      Mtx.TableName := 'LOG315';
      Mtx.ClientDataSet := DM1.cdsKDX;
      Mtx.ControlGridDisp := fprincipal.cgdPrincipal;
      Mtx.OnEdit := Nil; //OnEditNIS;
      Mtx.OnInsert := Nil;
      Mtx.Titulo := 'Detalles de Movimiento de Almacén';
      Mtx.OnShow := Nil;
      Mtx.OnCreateMant := Nil;
      Mtx.Filter := ''; //'NISATIP=''SALIDA''';
      Mtx.SectionName := 'ALMContaInveDet';
      Mtx.FileNameIni := '\oaALM.INI';
      Mtx.NoVisible.Clear;
      Screen.Cursor := crDefault;
      xPanel.Visible := false;
      xLabel.Free;
      xPanel.Free;
      Mtx.Execute;
   Finally
      Mtx.Filter := '';
      Mtx.Free;
      FDetMov.Free;
   End;
End;

{ para hallar los numeros que faltaran en notas de I y S por
  CIA, ALM, LOC,TDAID Y NISATIP}

Procedure TFContInve.bbVerNumIClick(Sender: TObject);
Var
 { cdsVeriResul contiene las notas faltantes }
   xsql: String; { para el displaydescrip }
 { cdsVerinum, cdsVericlon contienen la misma data, sólo que el primero lo
   uso para sacar la CIAID,ALMID,LOCID,TDAID,NISATIP y el segundo lo uso
   para filtrar }
   ssql: String; {para armar mi sentencias en cdsVeriNum,cdsVeriClon}
 { variables con los datos respectivos a CIAID,ALMID,LOCID,TDAID,NISATIP}
   vcia, valm, vloc, vdoc, vnot: String;
   iX, vcon: integer; { contadores }
Begin
   Screen.Cursor := crHourGlass;
   { limpio el cdsVeriResul }
   dm1.cdsVeriResul.Open;
   dm1.cdsVeriResul.first;
   While Not dm1.cdsVeriResul.eof Do
      dm1.cdsVeriResul.Delete;
   { carga el cdsVeriNum }
   ssql := '';
   ssql := 'SELECT LOG314.CIAID, LOG314.LOCID, LOG314.ALMID, ' +
      'LOG314.TDAID, LOG314.NISATIP, LOG314.NISAID ' +
      'FROM LOG314 ' +
      'WHERE ' + DM1.NotLetras('NISAID') +
      'ORDER BY CIAID, LOCID, ALMID, TDAID, NISATIP, NISAID';
   dm1.cdsVeriNum.Close;
   dm1.cdsVeriNum.ProviderName := 'prvVeriNum';
   dm1.cdsVeriNum.DataRequest(sSQL);
   dm1.cdsVeriNum.Open;
   dm1.cdsVeriNum.First;
   vcia := '';
   valm := '';
   vloc := '';
   vdoc := '';
   vnot := '';
   { recorre el cdsVeriNum y compara las variables con los datos respectivos}
   While Not dm1.cdsVeriNum.eof Do
   Begin
     { compara }
      If (vcia <> dm1.cdsVeriNum.fieldbyname('CIAID').AsString) Or
         (valm <> dm1.cdsVeriNum.fieldbyname('ALMID').AsString) Or
         (vloc <> dm1.cdsVeriNum.fieldbyname('LOCID').AsString) Or
         (vdoc <> dm1.cdsVeriNum.fieldbyname('TDAID').AsString) Or
         (vnot <> dm1.cdsVeriNum.fieldbyname('NISATIP').AsString) Then
      Begin
         vcon := 0;
       { asigna los valores y carga el cdsVeriClon con los datos
         filtrados }
         vcia := dm1.cdsVeriNum.fieldbyname('CIAID').AsString;
         valm := dm1.cdsVeriNum.fieldbyname('ALMID').AsString;
         vloc := dm1.cdsVeriNum.fieldbyname('LOCID').AsString;
         vdoc := dm1.cdsVeriNum.fieldbyname('TDAID').AsString;
         vnot := dm1.cdsVeriNum.fieldbyname('NISATIP').AsString;
         SSQL := 'SELECT LOG314.CIAID, LOG314.LOCID, LOG314.ALMID, ' +
            'LOG314.TDAID, LOG314.NISATIP, LOG314.NISAID ' +
            'FROM LOG314 ' +
            'WHERE LOG314.CIAID=' + quotedstr(VCIA) + ' AND LOG314.LOCID=' + quotedstr(VLOC) + ' ' +
            'AND LOG314.ALMID=' + quotedstr(VALM) + ' AND LOG314.TDAID=' + quotedstr(VDOC) + ' ' +
            'AND LOG314.NISATIP=' + quotedstr(VNOT) + ' ' +
            'AND ' + dm1.NotLetras('NISAID') +
            'ORDER BY CIAID, LOCID, ALMID, TDAID, NISATIP, NISAID';
         dm1.cdsVeriClon.Close;
         dm1.cdsVeriClon.DataRequest(sSQL);
         dm1.cdsVeriClon.Open;
         dm1.cdsVeriClon.First;
       { recorre la tabla }
         While Not dm1.cdsVeriClon.eof Do
         Begin
            vcon := vcon + 1;
         { compara el contador con el numero }
            If dm1.StrZero(IntToStr(vcon), 8) <> dm1.cdsVeriClon.fieldbyname('NISAID').AsString Then
            Begin
           { si son <>, recorre el hueco }
               For iX := vcon To StrToInt(dm1.cdsVeriClon.fieldbyname('NISAID').AsString) - 1 Do
               Begin
                  dm1.cdsVeriResul.Insert;
                  xsql := '';
                  xsql := 'CIAID=' + quotedstr(dm1.cdsVeriClon.fieldbyname('CIAID').AsString);
                  dm1.cdsVeriResul.FieldByName('CIADES').AsString := dm1.DisplayDescrip('prvCIA', 'TGE101', '*', xsql, 'CIAABR');
                  xsql := '';
                  xsql := 'LOCID=' + quotedstr(dm1.cdsVeriClon.fieldbyname('LOCID').AsString);
                  dm1.cdsVeriResul.FieldByName('LOCDES').AsString := dm1.DisplayDescrip('prvLOC', 'TGE126', '*', xsql, 'LOCABR');
                  xsql := '';
                  xsql := 'ALMID=' + quotedstr(dm1.cdsVeriClon.fieldbyname('ALMID').AsString);
                  dm1.cdsVeriResul.FieldByName('ALMDES').AsString := dm1.DisplayDescrip('prvALM', 'TGE151', '*', xsql, 'ALMABR');
                  xsql := '';
                  xsql := 'TDAID=' + quotedstr(dm1.cdsVeriClon.fieldbyname('TDAID').AsString);
                  dm1.cdsVeriResul.FieldByName('TDAID').AsString := dm1.DisplayDescrip('prvTDNISA', 'TGE157', '*', xsql, 'TDAABR');
                  dm1.cdsVeriResul.FieldByName('NISATIP').AsString := dm1.cdsVeriClon.fieldbyname('NISATIP').AsString;
                  dm1.cdsVeriResul.FieldByName('NISAID').AsString := dm1.StrZero(IntTostr(iX), 5);
                  dm1.cdsVeriResul.post;
               End;
               vcon := StrToInt(dm1.cdsVeriClon.fieldbyname('NISAID').AsString); //vclon+1;
            End;
            dm1.cdsVeriClon.Next;
         End;
      End;
      dm1.cdsVeriNum.Next;
   End;
   Screen.Cursor := crDefault;
  //** 15/03/2001 - pjsv
   If DM1.cdsVeriResul.recordcount = 0 Then
   Begin
      ErrorMsg(Caption, ' La Verifcación se a Realizado Correctamente, No Existen Datos Incorectos ');
      Exit;
   End;
   ppRpVerifica.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RelacionNotas.Rtm';
   ppRpVerifica.template.LoadFromFile;
  //**
   ppRpVerifica.Print;
End;

Procedure TFContInve.ppRpVerificaBeforePrint(Sender: TObject);
Begin
   pplblTit1.Left := (ppRpVerifica.PrinterSetup.PaperWidth / 2) - (pplblTit1.Width / 2);
End;

Procedure TFContInve.BitBtn3Click(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
  //** 15/03/2001 - pjsv
   CreaMensaje;
  //**
  //** 14/03/2001 - pjsv
   dm1.cdsKDX.Open; {detalle de mov. LOG315}
  //**

   FGenAsi := TFGenAsi.Create(self);
  //** 15/03/2001 - pjsv
   xPanel.Visible := false;
   xLabel.Free;
   xPanel.Free;
  //**

   Screen.Cursor := crDefault;
   Try
      FGenAsi.ShowModal;
   Finally
      FGenAsi.Free;
   End;
End;

Procedure TFContInve.BitBtn5Click(Sender: TObject);
Var
   ssql: String;
Begin
   Screen.Cursor := crHourGlass;
  //** 15/03/2001 - pjsv
   CreaMensaje;
  //**
   dm1.cdsAsiento.open;
   If dm1.cdsAsiento.RecordCount <> 0 Then
   Begin
      ssql := '';
      ssql := 'SELECT * FROM CNT300 WHERE CNT300.CNTANOMM=' + QUOTEDSTR(dm1.cdsAsiento.fieldbyname('CNTANOMM').AsString) +
         ' AND CNT300.CNTGLOSA=' + QUOTEDSTR(dm1.cdsAsiento.fieldbyname('CNTGLOSA').AsString);
      dm1.cdsCnt300.close;
      dm1.cdsCnt300.DataRequest(ssql);
      dm1.cdsCnt300.open;
      If dm1.cdsCnt300.RecordCount = 0 Then
      Begin
         dm1.cdsAsiento.first;
      {graba cabecera del asiento al CNT300}
         While Not dm1.cdsAsiento.Eof Do
         Begin
            dm1.cdsCnt300.insert;
            dm1.cdsCnt300.fieldbyname('CIAID').AsString := dm1.cdsAsiento.fieldbyname('CIAID').AsString;
            dm1.cdsCnt300.fieldbyname('TDIARID').AsString := dm1.cdsAsiento.fieldbyname('TDIARID').AsString;
            dm1.cdsCnt300.fieldbyname('CNTCOMPROB').AsString := dm1.cdsAsiento.fieldbyname('CNTCOMPROB').AsString;
            dm1.cdsCnt300.fieldbyname('CNTANOMM').AsString := dm1.cdsAsiento.fieldbyname('CNTANOMM').AsString;
            dm1.cdsCnt300.fieldbyname('CNTTCAMBIO').AsString := dm1.cdsAsiento.fieldbyname('CNTTCAMBIO').AsString;
            dm1.cdsCnt300.fieldbyname('CNTFCOMP').AsString := dm1.cdsAsiento.fieldbyname('CNTFCOMP').AsString;
            dm1.cdsCnt300.fieldbyname('CNTESTADO').AsString := dm1.cdsAsiento.fieldbyname('CNTESTADO').AsString;
            dm1.cdsCnt300.fieldbyname('CNTCUADRE').AsString := dm1.cdsAsiento.fieldbyname('CNTCUADRE').AsString;
            dm1.cdsCnt300.fieldbyname('CNTFAUTOM').AsString := dm1.cdsAsiento.fieldbyname('CNTFAUTOM').AsString;
            dm1.cdsCnt300.fieldbyname('CNTUSER').AsString := dm1.cdsAsiento.fieldbyname('CNTUSER').AsString;
            dm1.cdsCnt300.fieldbyname('CNTFREG').AsString := dm1.cdsAsiento.fieldbyname('CNTFREG').AsString;
            dm1.cdsCnt300.fieldbyname('CNTHREG').AsString := dm1.cdsAsiento.fieldbyname('CNTHREG').AsString;
            dm1.cdsCnt300.fieldbyname('CNTANO').AsString := dm1.cdsAsiento.fieldbyname('CNTANO').AsString;
            dm1.cdsCnt300.fieldbyname('CNTMM').AsString := dm1.cdsAsiento.fieldbyname('CNTMM').AsString;
            dm1.cdsCnt300.fieldbyname('CNTDD').AsString := dm1.cdsAsiento.fieldbyname('CNTDD').AsString;
            dm1.cdsCnt300.fieldbyname('CNTTRI').AsString := dm1.cdsAsiento.fieldbyname('CNTTRI').AsString;
            dm1.cdsCnt300.fieldbyname('CNTSEM').AsString := dm1.cdsAsiento.fieldbyname('CNTSEM').AsString;
            dm1.cdsCnt300.fieldbyname('CNTSS').AsString := dm1.cdsAsiento.fieldbyname('CNTSS').AsString;
            dm1.cdsCnt300.fieldbyname('CNTAATRI').AsString := dm1.cdsAsiento.fieldbyname('CNTAATRI').AsString;
            dm1.cdsCnt300.fieldbyname('CNTAASEM').AsString := dm1.cdsAsiento.fieldbyname('CNTAASEM').AsString;
            dm1.cdsCnt300.fieldbyname('CNTAASS').AsString := dm1.cdsAsiento.fieldbyname('CNTAASS').AsString;
            dm1.cdsCnt300.fieldbyname('TMONID').AsString := dm1.cdsAsiento.fieldbyname('TMONID').AsString;
            dm1.cdsCnt300.fieldbyname('TDIARDES').AsString := dm1.cdsAsiento.fieldbyname('TDIARDES').AsString;
            dm1.cdsCnt300.fieldbyname('CNTDEBEMN').AsString := dm1.cdsAsiento.fieldbyname('CNTDEBEMN').AsString;
            dm1.cdsCnt300.fieldbyname('CNTDEBEME').AsString := dm1.cdsAsiento.fieldbyname('CNTDEBEME').AsString;
            dm1.cdsCnt300.fieldbyname('CNTHABEMN').AsString := dm1.cdsAsiento.fieldbyname('CNTHABEMN').AsString;
            dm1.cdsCnt300.fieldbyname('CNTHABEME').AsString := dm1.cdsAsiento.fieldbyname('CNTHABEME').AsString;
            dm1.cdsCnt300.fieldbyname('CNTTS').AsString := dm1.cdsAsiento.fieldbyname('CNTTS').AsString;
            dm1.cdsCnt300.fieldbyname('CNTGLOSA').AsString := dm1.cdsAsiento.fieldbyname('CNTGLOSA').AsString;
        //dm1.ControlTran;
            DM1.ControlTran(0, Nil, '');
        //dm1.cdsCnt300.post;
        //dm1.cdsCnt300.ApplyUpdates(0);
            dm1.cdsAsiento.next;
         End;
         dm1.cdsAsiento.first;
         While Not dm1.cdsAsiento.eof Do
            dm1.cdsAsiento.delete;
      //dm1.ControlTran;
         DM1.ControlTran(0, Nil, '');
      //dm1.cdsAsiento.ApplyUpdates(0);
         dm1.cdsAsiento.close;
         dm1.cdsCnt300.close;
      { graba detalle del asiento al CNT301}
         dm1.cdsDAsiento.open;
         dm1.cdsDAsiento.first;
         dm1.cdsCnt301.open;
         While Not dm1.cdsDAsiento.eof Do
         Begin
            dm1.cdsCnt301.insert;
            dm1.cdsCnt301.fieldbyname('CIAID').AsString := dm1.cdsDAsiento.fieldbyname('CIAID').AsString;
            dm1.cdsCnt301.fieldbyname('TDIARID').AsString := dm1.cdsDAsiento.fieldbyname('TDIARID').AsString;
            dm1.cdsCnt301.fieldbyname('CNTCOMPROB').AsString := dm1.cdsDAsiento.fieldbyname('CNTCOMPROB').AsString;
            dm1.cdsCnt301.fieldbyname('CNTANO').AsString := dm1.cdsDAsiento.fieldbyname('CNTANO').AsString;
            dm1.cdsCnt301.fieldbyname('CNTANOMM').AsString := dm1.cdsDAsiento.fieldbyname('CNTANOMM').AsString;
            dm1.cdsCnt301.fieldbyname('CUENTAID').AsString := dm1.cdsDAsiento.fieldbyname('CUENTAID').AsString;
            dm1.cdsCnt301.fieldbyname('CLAUXID').AsString := dm1.cdsDAsiento.fieldbyname('CLAUXID').AsString;
            dm1.cdsCnt301.fieldbyname('AUXID').AsString := dm1.cdsDAsiento.fieldbyname('AUXID').AsString;
            dm1.cdsCnt301.fieldbyname('CNTGLOSA').AsString := dm1.cdsDAsiento.fieldbyname('CNTGLOSA').AsString;
            dm1.cdsCnt301.fieldbyname('CNTDH').AsString := dm1.cdsDAsiento.fieldbyname('CNTDH').AsString;
            dm1.cdsCnt301.fieldbyname('CCOSID').AsString := dm1.cdsDAsiento.fieldbyname('CCOSID').AsString;
            dm1.cdsCnt301.fieldbyname('CNTTCAMBIO').AsString := dm1.cdsDAsiento.fieldbyname('CNTTCAMBIO').AsString;
            dm1.cdsCnt301.fieldbyname('CNTMTOORI').AsString := dm1.cdsDAsiento.fieldbyname('CNTMTOORI').AsString;
            dm1.cdsCnt301.fieldbyname('CNTMTOLOC').AsString := dm1.cdsDAsiento.fieldbyname('CNTMTOLOC').AsString;
            dm1.cdsCnt301.fieldbyname('CNTMTOEXT').AsString := dm1.cdsDAsiento.fieldbyname('CNTMTOEXT').AsString;
            dm1.cdsCnt301.fieldbyname('CNTFEMIS').AsString := dm1.cdsDAsiento.fieldbyname('CNTFEMIS').AsString;
            dm1.cdsCnt301.fieldbyname('CNTFCOMP').AsString := dm1.cdsDAsiento.fieldbyname('CNTFCOMP').AsString;
            dm1.cdsCnt301.fieldbyname('CNTESTADO').AsString := dm1.cdsDAsiento.fieldbyname('CNTESTADO').AsString;
            dm1.cdsCnt301.fieldbyname('CNTCUADRE').AsString := dm1.cdsDAsiento.fieldbyname('CNTCUADRE').AsString;
            dm1.cdsCnt301.fieldbyname('CNTUSER').AsString := dm1.cdsDAsiento.fieldbyname('CNTUSER').AsString;
            dm1.cdsCnt301.fieldbyname('CNTFREG').AsString := dm1.cdsDAsiento.fieldbyname('CNTFREG').AsString;
            dm1.cdsCnt301.fieldbyname('CNTHREG').AsString := dm1.cdsDAsiento.fieldbyname('CNTHREG').Asstring;
            dm1.cdsCnt301.fieldbyname('CNTMM').AsString := dm1.cdsDAsiento.fieldbyname('CNTMM').AsString;
            dm1.cdsCnt301.fieldbyname('CNTDD').AsString := dm1.cdsDAsiento.fieldbyname('CNTDD').AsString;
            dm1.cdsCnt301.fieldbyname('CNTTRI').AsString := dm1.cdsDAsiento.fieldbyname('CNTTRI').AsString;
            dm1.cdsCnt301.fieldbyname('CNTSEM').AsString := dm1.cdsDAsiento.fieldbyname('CNTSEM').AsString;
            dm1.cdsCnt301.fieldbyname('CNTSS').AsString := dm1.cdsDAsiento.fieldbyname('CNTSS').AsString;
            dm1.cdsCnt301.fieldbyname('CNTAATRI').AsString := dm1.cdsDAsiento.fieldbyname('CNTAATRI').AsString;
            dm1.cdsCnt301.fieldbyname('CNTAASEM').AsString := dm1.cdsDAsiento.fieldbyname('CNTAASEM').AsString;
            dm1.cdsCnt301.fieldbyname('CNTAASS').AsString := dm1.cdsDAsiento.fieldbyname('CNTAASS').AsString;
            dm1.cdsCnt301.fieldbyname('TMONID').AsString := dm1.cdsDAsiento.fieldbyname('TMONID').AsString;
            dm1.cdsCnt301.fieldbyname('TDIARDES').AsString := dm1.cdsDAsiento.fieldbyname('TDIARDES').AsString;
            dm1.cdsCnt301.fieldbyname('CTADES').AsString := dm1.cdsDAsiento.fieldbyname('CTADES').AsString;
            dm1.cdsCnt301.fieldbyname('CNTDEBEMN').AsString := dm1.cdsDAsiento.fieldbyname('CNTDEBEMN').AsString;
            dm1.cdsCnt301.fieldbyname('CNTDEBEME').AsString := dm1.cdsDAsiento.fieldbyname('CNTDEBEME').AsString;
            dm1.cdsCnt301.fieldbyname('CNTHABEMN').AsString := dm1.cdsDAsiento.fieldbyname('CNTHABEMN').AsString;
            dm1.cdsCnt301.fieldbyname('CNTHABEME').AsString := dm1.cdsDAsiento.fieldbyname('CNTHABEME').AsString;
            dm1.cdsCnt301.fieldbyname('CNTPAGADO').AsString := dm1.cdsDAsiento.fieldbyname('CNTPAGADO').AsString;
        //dm1.ControlTran;
            DM1.ControlTran(0, Nil, '');
        //dm1.cdsCnt301.POST;
        //dm1.cdsCnt301.ApplyUpdates(0);
            dm1.cdsDAsiento.next;
         End;
         dm1.cdsDAsiento.first;
         While Not dm1.cdsDAsiento.eof Do
            dm1.cdsDAsiento.delete;
      //dm1.ControlTran;
         DM1.ControlTran(0, Nil, '');
      //dm1.cdsDAsiento.ApplyUpdates(0);
         dm1.cdsDAsiento.close;
         dm1.cdsCnt301.close;
         errormsg('Aviso', 'Se termino la Transferencia');
      End
      Else
      Begin
         errormsg('Error', 'Ya existe un registro con el mismo periodo');
         dm1.cdsAsiento.open;
         dm1.cdsAsiento.first;
         While Not dm1.cdsAsiento.eof Do
            dm1.cdsAsiento.delete;
      //dm1.ControlTran;
         DM1.ControlTran(0, Nil, '');
      //dm1.cdsAsiento.ApplyUpdates(0);
         dm1.cdsDAsiento.open;
         dm1.cdsDAsiento.first;
         While Not dm1.cdsDAsiento.eof Do
            dm1.cdsDAsiento.delete;
      //dm1.ControlTran;
         DM1.ControlTran(0, Nil, '');
      //dm1.cdsDAsiento.ApplyUpdates(0);
         exit;
      End;
   End
   Else
   Begin
      xPanel.Visible := false;
      xLabel.Free;
      xPanel.Free;
      errormsg('Error', 'No existen registros para Transferir');
      Screen.Cursor := crDefault;
      exit;
   End;
   Screen.Cursor := crDefault;
  //** 15/03/2001 - pjsv
   xPanel.Visible := false;
   xLabel.Free;
   xPanel.Free;
  //**
End;

Procedure TFContInve.ppRpVerificaPreviewFormCreate(Sender: TObject);
Begin
   ppRpVerifica.PreviewForm.ClientHeight := 500;
   ppRpVerifica.PreviewForm.ClientWidth := 650;
   TppViewer(ppRpVerifica.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

//** 15/03/2001 - pjsv

Procedure TFContInve.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;
//**

//** 15/03/2001 - pjsv // crea un panel con su mensaje sobre el Tman

Procedure TFContInve.CreaMensaje;
Begin
   xPanel := TPanel.Create(Application);
   xPanel.Parent := Mtx1.FMant;
   xPanel.Top := (Screen.Height Div 2) - (xPanel.Height Div 2);
   xPanel.Left := (Screen.width Div 2) - (xPanel.Width Div 2);
   xPanel.Color := $009BBFBA;
   xLabel := TLabel.Create(xPanel);
   xLabel.parent := xPanel;
   xLabel.Align := alClient;
   xLabel.Font.Name := 'Comic Sans MS';
   xLabel.Font.Size := 12;
   xLabel.Font.Color := clNavy;
   xLabel.Font.Style := [fsBold];
   xLabel.Alignment := taCenter;
   xLabel.Layout := tlCenter;
   xLabel.Caption := 'Procesando...';
   xLabel.Visible := true;
   xLabel.Refresh;
   xPanel.Visible := true;
   xPanel.Refresh;
End;

Procedure TFContInve.sbtnAsiAlmClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   FGenAsiAlm := TFGenAsiAlm.Create(self);
   Screen.Cursor := crDefault;
   Try
      FGenAsiAlm.ShowModal;
   Finally
      FGenAsiAlm.Free;
   End;
End;

Procedure TFContInve.SpeedButton1Click(Sender: TObject);
Var
   ssql: String;
Begin
   Screen.Cursor := crHourGlass;
  //** 15/03/2001 - pjsv
   CreaMensaje;
  //**
   dm1.cdsAsiento.open;
   If dm1.cdsAsiento.RecordCount <> 0 Then
   Begin
      ssql := '';
      ssql := 'SELECT * FROM CNT300 WHERE CNT300.CNTANOMM=' + QUOTEDSTR(dm1.cdsAsiento.fieldbyname('CNTANOMM').AsString) +
         ' AND CNT300.CNTGLOSA=' + QUOTEDSTR(dm1.cdsAsiento.fieldbyname('CNTGLOSA').AsString);
      dm1.cdsCnt300.close;
      dm1.cdsCnt300.DataRequest(ssql);
      dm1.cdsCnt300.open;
      If dm1.cdsCnt300.RecordCount = 0 Then
      Begin
         dm1.cdsAsiento.first;
      {graba cabecera del asiento al CNT300}
         While Not dm1.cdsAsiento.Eof Do
         Begin
            dm1.cdsCnt300.insert;
            dm1.cdsCnt300.fieldbyname('CIAID').AsString := dm1.cdsAsiento.fieldbyname('CIAID').AsString;
            dm1.cdsCnt300.fieldbyname('TDIARID').AsString := dm1.cdsAsiento.fieldbyname('TDIARID').AsString;
            dm1.cdsCnt300.fieldbyname('CNTCOMPROB').AsString := dm1.cdsAsiento.fieldbyname('CNTCOMPROB').AsString;
            dm1.cdsCnt300.fieldbyname('CNTANOMM').AsString := dm1.cdsAsiento.fieldbyname('CNTANOMM').AsString;
            dm1.cdsCnt300.fieldbyname('CNTTCAMBIO').AsString := dm1.cdsAsiento.fieldbyname('CNTTCAMBIO').AsString;
            dm1.cdsCnt300.fieldbyname('CNTFCOMP').AsString := dm1.cdsAsiento.fieldbyname('CNTFCOMP').AsString;
            dm1.cdsCnt300.fieldbyname('CNTESTADO').AsString := dm1.cdsAsiento.fieldbyname('CNTESTADO').AsString;
            dm1.cdsCnt300.fieldbyname('CNTCUADRE').AsString := dm1.cdsAsiento.fieldbyname('CNTCUADRE').AsString;
            dm1.cdsCnt300.fieldbyname('CNTFAUTOM').AsString := dm1.cdsAsiento.fieldbyname('CNTFAUTOM').AsString;
            dm1.cdsCnt300.fieldbyname('CNTUSER').AsString := dm1.cdsAsiento.fieldbyname('CNTUSER').AsString;
            dm1.cdsCnt300.fieldbyname('CNTFREG').AsString := dm1.cdsAsiento.fieldbyname('CNTFREG').AsString;
            dm1.cdsCnt300.fieldbyname('CNTHREG').AsString := dm1.cdsAsiento.fieldbyname('CNTHREG').AsString;
            dm1.cdsCnt300.fieldbyname('CNTANO').AsString := dm1.cdsAsiento.fieldbyname('CNTANO').AsString;
            dm1.cdsCnt300.fieldbyname('CNTMM').AsString := dm1.cdsAsiento.fieldbyname('CNTMM').AsString;
            dm1.cdsCnt300.fieldbyname('CNTDD').AsString := dm1.cdsAsiento.fieldbyname('CNTDD').AsString;
            dm1.cdsCnt300.fieldbyname('CNTTRI').AsString := dm1.cdsAsiento.fieldbyname('CNTTRI').AsString;
            dm1.cdsCnt300.fieldbyname('CNTSEM').AsString := dm1.cdsAsiento.fieldbyname('CNTSEM').AsString;
            dm1.cdsCnt300.fieldbyname('CNTSS').AsString := dm1.cdsAsiento.fieldbyname('CNTSS').AsString;
            dm1.cdsCnt300.fieldbyname('CNTAATRI').AsString := dm1.cdsAsiento.fieldbyname('CNTAATRI').AsString;
            dm1.cdsCnt300.fieldbyname('CNTAASEM').AsString := dm1.cdsAsiento.fieldbyname('CNTAASEM').AsString;
            dm1.cdsCnt300.fieldbyname('CNTAASS').AsString := dm1.cdsAsiento.fieldbyname('CNTAASS').AsString;
            dm1.cdsCnt300.fieldbyname('TMONID').AsString := dm1.cdsAsiento.fieldbyname('TMONID').AsString;
            dm1.cdsCnt300.fieldbyname('TDIARDES').AsString := dm1.cdsAsiento.fieldbyname('TDIARDES').AsString;
            dm1.cdsCnt300.fieldbyname('CNTDEBEMN').AsString := dm1.cdsAsiento.fieldbyname('CNTDEBEMN').AsString;
            dm1.cdsCnt300.fieldbyname('CNTDEBEME').AsString := dm1.cdsAsiento.fieldbyname('CNTDEBEME').AsString;
            dm1.cdsCnt300.fieldbyname('CNTHABEMN').AsString := dm1.cdsAsiento.fieldbyname('CNTHABEMN').AsString;
            dm1.cdsCnt300.fieldbyname('CNTHABEME').AsString := dm1.cdsAsiento.fieldbyname('CNTHABEME').AsString;
            dm1.cdsCnt300.fieldbyname('CNTTS').AsString := dm1.cdsAsiento.fieldbyname('CNTTS').AsString;
            dm1.cdsCnt300.fieldbyname('CNTGLOSA').AsString := dm1.cdsAsiento.fieldbyname('CNTGLOSA').AsString;
        //dm1.ControlTran;
            DM1.ControlTran(0, Nil, '');
        //dm1.cdsCnt300.post;
        //dm1.cdsCnt300.ApplyUpdates(0);
            dm1.cdsAsiento.next;
         End;
         dm1.cdsAsiento.first;
         While Not dm1.cdsAsiento.eof Do
            dm1.cdsAsiento.delete;
      //dm1.ControlTran;
         DM1.ControlTran(0, Nil, '');
      //dm1.cdsAsiento.ApplyUpdates(0);
         dm1.cdsAsiento.close;
         dm1.cdsCnt300.close;
      { graba detalle del asiento al CNT301}
         dm1.cdsDAsiento.open;
         dm1.cdsDAsiento.first;
         dm1.cdsCnt301.open;
         While Not dm1.cdsDAsiento.eof Do
         Begin
            dm1.cdsCnt301.insert;
            dm1.cdsCnt301.fieldbyname('CIAID').AsString := dm1.cdsDAsiento.fieldbyname('CIAID').AsString;
            dm1.cdsCnt301.fieldbyname('TDIARID').AsString := dm1.cdsDAsiento.fieldbyname('TDIARID').AsString;
            dm1.cdsCnt301.fieldbyname('CNTCOMPROB').AsString := dm1.cdsDAsiento.fieldbyname('CNTCOMPROB').AsString;
            dm1.cdsCnt301.fieldbyname('CNTANO').AsString := dm1.cdsDAsiento.fieldbyname('CNTANO').AsString;
            dm1.cdsCnt301.fieldbyname('CNTANOMM').AsString := dm1.cdsDAsiento.fieldbyname('CNTANOMM').AsString;
            dm1.cdsCnt301.fieldbyname('CUENTAID').AsString := dm1.cdsDAsiento.fieldbyname('CUENTAID').AsString;
            dm1.cdsCnt301.fieldbyname('CLAUXID').AsString := dm1.cdsDAsiento.fieldbyname('CLAUXID').AsString;
            dm1.cdsCnt301.fieldbyname('AUXID').AsString := dm1.cdsDAsiento.fieldbyname('AUXID').AsString;
            dm1.cdsCnt301.fieldbyname('CNTGLOSA').AsString := dm1.cdsDAsiento.fieldbyname('CNTGLOSA').AsString;
            dm1.cdsCnt301.fieldbyname('CNTDH').AsString := dm1.cdsDAsiento.fieldbyname('CNTDH').AsString;
            dm1.cdsCnt301.fieldbyname('CCOSID').AsString := dm1.cdsDAsiento.fieldbyname('CCOSID').AsString;
            dm1.cdsCnt301.fieldbyname('CNTTCAMBIO').AsString := dm1.cdsDAsiento.fieldbyname('CNTTCAMBIO').AsString;
            dm1.cdsCnt301.fieldbyname('CNTMTOORI').AsString := dm1.cdsDAsiento.fieldbyname('CNTMTOORI').AsString;
            dm1.cdsCnt301.fieldbyname('CNTMTOLOC').AsString := dm1.cdsDAsiento.fieldbyname('CNTMTOLOC').AsString;
            dm1.cdsCnt301.fieldbyname('CNTMTOEXT').AsString := dm1.cdsDAsiento.fieldbyname('CNTMTOEXT').AsString;
            dm1.cdsCnt301.fieldbyname('CNTFEMIS').AsString := dm1.cdsDAsiento.fieldbyname('CNTFEMIS').AsString;
            dm1.cdsCnt301.fieldbyname('CNTFCOMP').AsString := dm1.cdsDAsiento.fieldbyname('CNTFCOMP').AsString;
            dm1.cdsCnt301.fieldbyname('CNTESTADO').AsString := dm1.cdsDAsiento.fieldbyname('CNTESTADO').AsString;
            dm1.cdsCnt301.fieldbyname('CNTCUADRE').AsString := dm1.cdsDAsiento.fieldbyname('CNTCUADRE').AsString;
            dm1.cdsCnt301.fieldbyname('CNTUSER').AsString := dm1.cdsDAsiento.fieldbyname('CNTUSER').AsString;
            dm1.cdsCnt301.fieldbyname('CNTFREG').AsString := dm1.cdsDAsiento.fieldbyname('CNTFREG').AsString;
            dm1.cdsCnt301.fieldbyname('CNTHREG').AsString := dm1.cdsDAsiento.fieldbyname('CNTHREG').Asstring;
            dm1.cdsCnt301.fieldbyname('CNTMM').AsString := dm1.cdsDAsiento.fieldbyname('CNTMM').AsString;
            dm1.cdsCnt301.fieldbyname('CNTDD').AsString := dm1.cdsDAsiento.fieldbyname('CNTDD').AsString;
            dm1.cdsCnt301.fieldbyname('CNTTRI').AsString := dm1.cdsDAsiento.fieldbyname('CNTTRI').AsString;
            dm1.cdsCnt301.fieldbyname('CNTSEM').AsString := dm1.cdsDAsiento.fieldbyname('CNTSEM').AsString;
            dm1.cdsCnt301.fieldbyname('CNTSS').AsString := dm1.cdsDAsiento.fieldbyname('CNTSS').AsString;
            dm1.cdsCnt301.fieldbyname('CNTAATRI').AsString := dm1.cdsDAsiento.fieldbyname('CNTAATRI').AsString;
            dm1.cdsCnt301.fieldbyname('CNTAASEM').AsString := dm1.cdsDAsiento.fieldbyname('CNTAASEM').AsString;
            dm1.cdsCnt301.fieldbyname('CNTAASS').AsString := dm1.cdsDAsiento.fieldbyname('CNTAASS').AsString;
            dm1.cdsCnt301.fieldbyname('TMONID').AsString := dm1.cdsDAsiento.fieldbyname('TMONID').AsString;
            dm1.cdsCnt301.fieldbyname('TDIARDES').AsString := dm1.cdsDAsiento.fieldbyname('TDIARDES').AsString;
            dm1.cdsCnt301.fieldbyname('CTADES').AsString := dm1.cdsDAsiento.fieldbyname('CTADES').AsString;
            dm1.cdsCnt301.fieldbyname('CNTDEBEMN').AsString := dm1.cdsDAsiento.fieldbyname('CNTDEBEMN').AsString;
            dm1.cdsCnt301.fieldbyname('CNTDEBEME').AsString := dm1.cdsDAsiento.fieldbyname('CNTDEBEME').AsString;
            dm1.cdsCnt301.fieldbyname('CNTHABEMN').AsString := dm1.cdsDAsiento.fieldbyname('CNTHABEMN').AsString;
            dm1.cdsCnt301.fieldbyname('CNTHABEME').AsString := dm1.cdsDAsiento.fieldbyname('CNTHABEME').AsString;
            dm1.cdsCnt301.fieldbyname('CNTPAGADO').AsString := dm1.cdsDAsiento.fieldbyname('CNTPAGADO').AsString;
        //dm1.ControlTran;
            DM1.ControlTran(0, Nil, '');
        //dm1.cdsCnt301.POST;
        //dm1.cdsCnt301.ApplyUpdates(0);
            dm1.cdsDAsiento.next;
         End;
         dm1.cdsDAsiento.first;
         While Not dm1.cdsDAsiento.eof Do
            dm1.cdsDAsiento.delete;
      //dm1.ControlTran;
         DM1.ControlTran(0, Nil, '');
      //dm1.cdsDAsiento.ApplyUpdates(0);
         dm1.cdsDAsiento.close;
         dm1.cdsCnt301.close;
         errormsg('Aviso', 'Se termino la Transferencia');
      End
      Else
      Begin
         errormsg('Error', 'Ya existe un registro con el mismo periodo');
         dm1.cdsAsiento.open;
         dm1.cdsAsiento.first;
         While Not dm1.cdsAsiento.eof Do
            dm1.cdsAsiento.delete;
      //dm1.ControlTran;
         DM1.ControlTran(0, Nil, '');
      //dm1.cdsAsiento.ApplyUpdates(0);
         dm1.cdsDAsiento.open;
         dm1.cdsDAsiento.first;
         While Not dm1.cdsDAsiento.eof Do
            dm1.cdsDAsiento.delete;
      //dm1.ControlTran;
         DM1.ControlTran(0, Nil, '');
      //dm1.cdsDAsiento.ApplyUpdates(0);
         exit;
      End;
   End
   Else
   Begin
      errormsg('Error', 'No existen registros para Transferir');
      Screen.Cursor := crDefault;
      exit;
   End;
   Screen.Cursor := crDefault;
  //** 15/03/2001 - pjsv
   xPanel.Visible := false;
   xLabel.Free;
   xPanel.Free;
  //**

End;

Procedure TFContInve.sbtnAsiAjuClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   FGenAsiES := TFGenAsiES.Create(self);
   Screen.Cursor := crDefault;
   Try
      FGenAsiES.ShowModal;
   Finally
      FGenAsiES.Free;
   End;

End;

End.

