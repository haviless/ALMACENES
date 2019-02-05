Unit ALM730;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   ALM730
// Formulario           :   FToolMant
// Fecha de Creación    :
// Autor                :   Equipo de Desarrollo
// Objetivo             :   Mantenimiento de Inventario Fisico
//HPC_201404_ALM   24/10/2014 Unificación de módulos de Inventarios
// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ComCtrls, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppBands,
   ppClass, ppProd, ppReport, ppCtrls, ppPrnabl, ppVar, ppviewr, Mant,
   ExtCtrls, StdCtrls, wwdblook, Db, DBClient, wwclient, Wwdbdlg, ppEndUsr,
   ppTypes, oaVariables, MsgDlgs;

Type
   TFToolMant = Class(TForm)
      ppdbTomInv: TppDBPipeline;
      pprTomaInv: TppReport;
      ppdbResulInv: TppDBPipeline;
      pprResulInv: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppLine5: TppLine;
      ppLabel35: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel7: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel8: TppLabel;
      ppLabel10: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel50: TppLabel;
      ppLabel52: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      ppVariable1: TppVariable;
      ppFooterBand2: TppFooterBand;
      pnlOpciones: TPanel;
      lblCia: TLabel;
      lblLoc: TLabel;
      Label1: TLabel;
      lblAlm: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      dblcLOC: TwwDBLookupCombo;
      dbeLOC: TEdit;
      dblcTIN: TwwDBLookupCombo;
      dbeTIN: TEdit;
      dblcTALM: TwwDBLookupCombo;
      dbeALM: TEdit;
      Panel1: TPanel;
      pgcTool: TPageControl;
      tbshReportes: TTabSheet;
      Z1sbTomaInv: TSpeedButton;
      Z1sbResulInv: TSpeedButton;
      tbshAjustes: TTabSheet;
      Z1sbASalida: TSpeedButton;
      SpeedButton1: TSpeedButton;
      spdAceptar: TSpeedButton;
      dblcdTomaInv: TwwDBLookupComboDlg;
      Label2: TLabel;
      bdeObs: TEdit;
      Z1sbSeleccionaArticulos: TSpeedButton;
      ppDesigner1: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel1: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppsyvPag: TppSystemVariable;
      ppsyvfecha: TppSystemVariable;
      ppsyvHora: TppSystemVariable;
      pplblTitulo: TppLabel;
      ppLine3: TppLine;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel9: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppdbtArtId: TppDBText;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText7: TppDBText;
      pplblArtId: TppLabel;
      ppDBText11: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppDBText13: TppDBText;
      ppLabel11: TppLabel;
      ppDBText17: TppDBText;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppDBText18: TppDBText;
      ppLabel12: TppLabel;
      ppDBText19: TppDBText;
      ppGroupFooterBand3: TppGroupFooterBand;
      Timer1: TTimer;
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure Z1sbTomaInvClick(Sender: TObject);
      Procedure Z1sbResulInvClick(Sender: TObject);
      Procedure pprTomaInvPreviewFormCreate(Sender: TObject);
      Procedure pprResulInvPreviewFormCreate(Sender: TObject);
      Procedure Z1sbAIngresoClick(Sender: TObject);
      Procedure Z1sbASalidaClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure ActSaldos;
      Procedure SpeedButton1Click(Sender: TObject);
      Procedure ppVariable1Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable2Calc(Sender: TObject; Var Value: Variant);
      Procedure ppHeaderBand1BeforePrint(Sender: TObject);
      Procedure ppHeaderBand2BeforePrint(Sender: TObject);
      Procedure spdAceptarClick(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcdTomaInvExit(Sender: TObject);
      Procedure Z1sbSeleccionaArticulosClick(Sender: TObject);
      Procedure dblcCIAEnter(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolMant: TFToolMant;
   xAccesoBotones: Boolean;

Implementation
Uses ALMDM1, ALM201IN, oaIN5000, ALM203, ALM301; //, ALM501;

{$R *.DFM}

Procedure TFToolMant.Z1sbTomaInvClick(Sender: TObject);
Var
   x10: integer;
Begin
   Screen.Cursor := crHourGlass;
   pprTomaInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\TomaInv.Rtm';
   pprTomaInv.Template.LoadFromFile;

   xSQL := 'SELECT TGE131.GRARDES, TGE169.FAMDES, TGE170.SFAMDES, LOG316.*, TGE130.UNMABR FROM LOG334 LOG316, TGE130, TGE131, TGE169, TGE170  ' +
      'WHERE TOINID=' + QuotedStr(dblcdTomaInv.text) +
      ' AND LOG316.UNMIDG=TGE130.UNMID ' +
      ' AND LOG316.CIAID=TGE131.CIAID(+) AND LOG316.TINID=TGE131.TINID(+) AND LOG316.GRARID=TGE131.GRARID(+) ' +
      ' AND LOG316.CIAID=TGE169.CIAID(+) AND LOG316.TINID=TGE169.TINID(+) AND LOG316.GRARID=TGE169.GRARID(+) AND LOG316.FAMID=TGE169.FAMID(+) ' +
      ' AND LOG316.CIAID=TGE170.CIAID(+) AND LOG316.TINID=TGE170.TINID(+) AND LOG316.GRARID=TGE170.GRARID(+) AND LOG316.FAMID=TGE170.FAMID(+) AND LOG316.SFAMID=TGE170.SFAMID(+) ' +
      ' ORDER BY LOG316.CIAID, LOG316.TINID, LOG316.GRARID, LOG316.FAMID, LOG316.SFAMID, LOG316.ARTID ';

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQl);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros en la Toma de Inventario');
   End;

   pprTomaInv.Print;
   pprTomaInv.Stop;
  //ppDesigner1.Show;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;

End;

Procedure TFToolMant.Z1sbResulInvClick(Sender: TObject);
Var
   CadSql, xWhere, xOrder: String;
   iX, iY: integer;
Begin
   Screen.Cursor := crHourGlass;
   pprResulInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResulInv.Rtm';
   pprResulInv.Template.LoadFromFile;

   CadSql := Mtx5000.FMant.SQL;
   For iX := 0 To Length(CadSql) Do
   Begin
      If copy(CadSql, iX, 5) = 'WHERE' Then
      Begin
         xwhere := copy(CadSql, iX + 6, length(CadSql));
         break;
      End;
   End;

   CadSql := xWhere;
   xOrder := '';
   iX := length(xWhere);
   For iY := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iY, 8) = 'ORDER BY' Then
      Begin
         xWhere := copy(xWhere, 1, iY - 2);
         iX := iX - length(xWhere);
         xOrder := copy(CadSql, iY, iX);
         break;
      End;
   End;

   xSQL := 'SELECT LOG316.*, TGE130.UNMABR FROM LOG334 LOG316, TGE130 ' +
      ' WHERE LOG316.CIAID=' + QuotedStr(dblcCIA.text) +
      ' AND LOG316.LOCID=' + QuotedStr(dblcLOC.text) +
      ' AND LOG316.TINID=' + QuotedStr(dblcTIN.text) +
      ' AND LOG316.ALMID=' + QuotedStr(dblcTALM.text) +
      ' AND LOG316.TOINID=' + QuotedStr(dblcdTomaInv.text) +
      ' AND LOG316.UNMIDG=TGE130.UNMID ';

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQl);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;

   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros');
   End;

   pprResulInv.Print;
   pprResulInv.Stop;
End;

Procedure TFToolMant.ActSaldos;
Begin
   DMALM.cdsSaldos.Close;
   DMALM.cdsSaldos.DataRequest(Mtx5000.FMant.SQL);
   DMALM.cdsSaldos.Open;
  //DMALM.cdsSQL.Close;
  //DMALM.cdsSQL.DataRequest(CadSql);
  //DMALM.cdsSQL.Open;
  //DMALM.cdsSaldos.Filtered:=False;
  //DMALM.cdsSaldos.Filter:=FPrincipal.Mtx.FMant.SQL;       //   FMant.cds1.Filter;
  //DMALM.cdsSaldos.Filtered:=true;
End;

Procedure TFToolMant.pprTomaInvPreviewFormCreate(Sender: TObject);
Begin
   pprTomaInv.PreviewForm.ClientHeight := 500;
   pprTomaInv.PreviewForm.ClientWidth := 650;
   TppViewer(pprTomaInv.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolMant.pprResulInvPreviewFormCreate(Sender: TObject);
Begin
   pprResulInv.PreviewForm.ClientHeight := 500;
   pprResulInv.PreviewForm.ClientWidth := 650;
   TppViewer(pprResulInv.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolMant.Z1sbAIngresoClick(Sender: TObject);
Begin
   FRegNtaE := TFRegNtaE.Create(Self);
   Try
      DMALM.cdsNIA.Insert;
      FRegNtaE.ShowModal;
   Finally
      FRegNtaE.free
   End;
End;

Procedure TFToolMant.Z1sbASalidaClick(Sender: TObject);
Var
   CadSql, {xWhere,} xOrder: String;
   iX, iY: integer;
Begin

   xSQL := 'SELECT LOG316.* FROM LOG334 LOG316 ' +
      ' WHERE LOG316.CIAID=' + QuotedStr(dblcCIA.text) +
      ' AND LOG316.LOCID=' + QuotedStr(dblcLOC.text) +
      ' AND LOG316.TINID=' + QuotedStr(dblcTIN.text) +
      ' AND LOG316.ALMID=' + QuotedStr(dblcTALM.text) +
      ' AND LOG316.TOINID=' + QuotedStr(dblcdTomaInv.text);

   DMALM.cdsDInventario.Close;
   DMALM.cdsDInventario.DataRequest(xSQl);
   DMALM.cdsDInventario.Open;

   If DMALM.cdsDInventario.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros');
   End;

   FMovAlmSalEnt := TFMovAlmSalEnt.Create(Self);
  //DMALM.cdsKDX.Open;
   Try
      FMovAlmSalEnt.dtpAjuSal.date := dateS;

      CadSql := Mtx5000.FMant.SQL;
      For iX := 0 To Length(CadSql) Do
      Begin
         If copy(CadSql, iX, 5) = 'WHERE' Then
         Begin
            xwhere := copy(CadSql, iX + 6, length(CadSql));
            break;
         End;
      End;

      CadSql := xWhere;
      xOrder := '';
      iX := length(xWhere);
      For iY := 0 To Length(xWhere) Do
      Begin
         If copy(xWhere, iY, 8) = 'ORDER BY' Then
         Begin
            xWhere := copy(xWhere, 1, iY - 2);
            iX := iX - length(xWhere);
            xOrder := copy(CadSql, iY, iX);
            break;
         End;
      End;

      FMovAlmSalEnt.ShowModal; // ALM301
   Finally
      DMALM.cdsMAlmCab.Close;
      FMovAlmSalEnt.free;
   End;
End;

Procedure TFToolMant.FormCreate(Sender: TObject);
Begin
   pgcTool.ActivePage := tbshReportes;
End;

Procedure TFToolMant.SpeedButton1Click(Sender: TObject);
Var
   CadSql, xWhere, xOrder: String;
   iX, iY: integer;
Begin
// sacar backup y limpiar fisg, fisu
   If Question('', 'Esta Seguro de Inicializar los Stock Físicos a ceros ' + #13 + #13 + ' Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;

      CadSql := Mtx5000.FMant.SQL;
      For iX := 0 To Length(CadSql) Do
      Begin
         If copy(CadSql, iX, 5) = 'WHERE' Then
         Begin
            xwhere := copy(CadSql, iX + 6, length(CadSql));
            break;
         End;
      End;

      CadSql := xWhere;
      xOrder := '';
      iX := length(xWhere);
      For iY := 0 To Length(xWhere) Do
      Begin
         If copy(xWhere, iY, 8) = 'ORDER BY' Then
         Begin
            xWhere := copy(xWhere, 1, iY - 2);
            iX := iX - length(xWhere);
            xOrder := copy(CadSql, iY, iX);
            break;
         End;
      End;

      CadSql := 'UPDATE LOG316 SET STKSFISG = 0, STKSFISU = 0, STKINV = ''N'' WHERE ' + xWhere;
      DMALM.ExecSQL(CadSql);
      Mtx5000.RefreshFilter;
      Screen.Cursor := crDefault;
    //DMALM.cdsSaldos.Close;
    //DMALM.cdsSaldos.Open;
   End;
End;

Procedure TFToolMant.ppVariable1Calc(Sender: TObject; Var Value: Variant);
Begin
  //Value:=DMALM.cdsReporte.FieldByName('STKSACTG').AsFloat-DMALM.cdsReporte.FieldByName('STKSFISG').AsFloat
   Value := DMALM.cdsReporte.FieldByName('STKSFISG').AsFloat - DMALM.cdsReporte.FieldByName('STKSACTG').AsFloat
End;

Procedure TFToolMant.ppVariable2Calc(Sender: TObject; Var Value: Variant);
Begin
  //Value:=DMALM.cdsReporte.FieldByName('STKSACTU').AsFloat-DMALM.cdsReporte.FieldByName('STKSFISU').AsFloat
   Value := DMALM.cdsReporte.FieldByName('STKSFISU').AsFloat - DMALM.cdsReporte.FieldByName('STKSACTU').AsFloat
End;

Procedure TFToolMant.ppHeaderBand1BeforePrint(Sender: TObject);
Begin
   ppLabel29.Text := dbeCIA.Text;
   ppLabel31.Text := dbeLOC.Text;
   ppLabel30.Text := dbeTIN.Text;
   ppLabel32.Text := dbeALM.Text;
End;

Procedure TFToolMant.ppHeaderBand2BeforePrint(Sender: TObject);
Begin
   ppLabel42.Text := dbeCIA.Text;
   ppLabel44.Text := dbeLOC.Text;
   ppLabel43.Text := dbeTIN.Text;
   ppLabel45.Text := dbeALM.Text;
End;

Procedure TFToolMant.spdAceptarClick(Sender: TObject);
Var
   sSQL: String;
Begin
   If Length(Trim(dbeCIA.Text)) = 0 Then
      Raise Exception.Create(' La Compañia no Existe ');

   If Length(Trim(dblcLOC.Text)) = 0 Then
      Raise Exception.Create(' La Localidad no Existe ');

   If Length(Trim(dblcTIN.Text)) = 0 Then
      Raise Exception.Create(' El Tipo de Inventario no Existe ');

   If Length(Trim(dblcTALM.Text)) = 0 Then
      Raise Exception.Create(' El Almacen no Existe ');

   If Length(Trim(dblcdTomaInv.text)) = 0 Then
      Raise Exception.Create('Ingrese Toma de Inventario');

   sSQL := 'SELECT * FROM LOG316 ' +
      'WHERE LOG316.CIAID=' + QuotedStr(dblcCIA.Text) + ' ' +
      'AND LOG316.LOCID=' + QuotedStr(dblcLOC.Text) + ' ' +
      'AND LOG316.TINID=' + QuotedStr(dblcTIN.Text) + ' ' +
      'AND LOG316.ALMID=' + QuotedStr(dblcTALM.Text);

   Mtx5000.UsuarioSQL.Clear;
   Mtx5000.FMant.wTabla := 'LOG316';
   Mtx5000.UsuarioSQL.Add(sSQL);
   Mtx5000.NewQuery;
  //Mtx.FMant.dbgFiltro.SelectedList.clear;
End;

Procedure TFToolMant.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFToolMant.dblcCIAExit(Sender: TObject);
Begin
   xSQL := dblcCIA.Text;
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(xSQL), 'CIADES');

   xSQL := 'SELECT * FROM TGE126 WHERE CIAID=' + quotedstr(dblcCIA.text);
   DMALM.cdsLOC.Close;
   DMALM.cdsLOC.DataRequest(xSQL);
   DMALM.cdsLOC.open;
End;

Procedure TFToolMant.dblcLOCExit(Sender: TObject);
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeLoc.Text := DMALM.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE152 WHERE ' + xSQL;
   DMALM.cdsTINID.Close;
   DMALM.cdsTINID.DataRequest(xSQL);
   DMALM.cdsTINID.open;
End;

Procedure TFToolMant.dblcTINExit(Sender: TObject);
Begin
   xSQL := 'TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeTIN.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE151 WHERE ' + xSQL + ' ORDER BY ALMID';
   DMALM.cdsALM.Close;
   DMALM.cdsALM.DataRequest(xSQL);
   DMALM.cdsALM.open;

End;

Procedure TFToolMant.dblcTALMExit(Sender: TObject);
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIn.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALM.text);
   dbeALM.text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');
   DMALM.cdsCInventario.Close;
   DMALM.cdsCInventario.DataRequest('SELECT * FROM LOG333 WHERE CIAID=' + QuotedStr(dblcCIA.text) +
      ' AND LOCID=' + QuotedStr(dblcLOC.text) +
      ' AND TINID=' + QuotedStr(dblcTIN.text) +
      ' AND ALMID=' + QuotedStr(dblcTALM.text) + ' AND TOINESTADO<>''ACEPTADO'' ');
   DMALM.cdsCInventario.Open;
End;

Procedure TFToolMant.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
    //if self.ActiveControl Is TDBMemo then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFToolMant.dblcdTomaInvExit(Sender: TObject);
Begin
   bdeObs.text := DMALM.DisplayDescrip('prvTGE', 'LOG333', 'TOINOBS', 'TOINID=' + quotedstr(dblcdTomaInv.Text), 'TOINOBS');
   If Length(bdeObs.text) = 0 Then
   Begin
      Raise Exception.Create('Ingrese Toma de Inventario');
   End;
End;

Procedure TFToolMant.Z1sbSeleccionaArticulosClick(Sender: TObject);
Var
   CadSql, xWhere, xOrder: String;
   iX, iY: integer;
   sSQL: String;
   x10: integer;
Begin
   xSQL := ' SELECT * FROM LOG333 WHERE TOINID=' + QuotedStr(dblcdTomaInv.text);
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;
   If DMALM.cdsReporte.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existe Toma de Inventario');
   End;

   xSQL := ' SELECT * FROM LOG334 WHERE TOINID=' + QuotedStr(dblcdTomaInv.text);
   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(xSQL);
   DMALM.cdsReporte.Open;

   If Mtx5000.FMant.cds2.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No hay ningun registro');
   End;

   If DMALM.cdsReporte.RecordCount > 0 Then
   Begin
      If Not Question('Confirmar', 'La Toma de Inventario Contiene Data, Desea volver a generarla ' + #13 + #13) Then
      Begin
         Screen.Cursor := crDefault;
         exit;
      End
      Else
      Begin
         Screen.Cursor := crHourGlass;
         xSQL := 'DELETE FROM LOG334 WHERE TOINID=' + QuotedStr(dblcdTomaInv.text);
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
   End;

   Screen.Cursor := crHourGlass;
   CadSql := Mtx5000.FMant.SQL;
   For iX := 0 To Length(CadSql) Do
   Begin
      If copy(CadSql, iX, 5) = 'WHERE' Then
      Begin
         xwhere := copy(CadSql, iX + 6, length(CadSql));
         break;
      End;
   End;

   CadSql := xWhere;
   xOrder := '';
   iX := length(xWhere);
   For iY := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iY, 8) = 'ORDER BY' Then
      Begin
         xWhere := copy(xWhere, 1, iY - 2);
         iX := iX - length(xWhere);
         xOrder := copy(CadSql, iY, iX);
         break;
      End;
   End;

   pprTomaInv.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\TomaInv.Rtm';
   pprTomaInv.Template.LoadFromFile;

   sSQL := 'INSERT INTO LOG334 (' +
      'TOINID,STKANO,CIAID,LOCID,TINID,ALMID,GRARID,FAMID,SFAMID,ARTID,ARTCONT,UNMIDG,UNMIDU, ' +
      'FABID,ARTSPRO,ARTSCA,ARTPARA,ARTSNA,ARTFUC,TMONID,STKINV,ARTCRGO,ARTACTIVO,CUENTAID, ' +
      'STKSACTG,STKSACTU,STKMACTG,STKMACTU,STKSFISG,STKSFISU,STKSMAXG,STKSMING,STKSMAXU,STKSMINU, ' +
      'STKPUPED,STKLOTEC,STKRACTG,STKRACTU,ARTDES ' +
      ')' +
      ' SELECT ' + QuotedStr(dblcdTomaInv.text) +
      ' TOINID,STKANO,CIAID,LOCID,TINID,ALMID,GRARID,FAMID,SFAMID,ARTID,ARTCONT,UNMIDG,UNMIDU, ' +
      'FABID,ARTSPRO,ARTSCA,ARTPARA,ARTSNA,ARTFUC,TMONID,STKINV,ARTCRGO,ARTACTIVO,CUENTAID, ' +
      'STKSACTG,STKSACTU,STKMACTG,STKMACTU,STKSFISG,STKSFISU,STKSMAXG,STKSMING,STKSMAXU,STKSMINU, ' +
      'STKPUPED,STKLOTEC,STKRACTG,STKRACTU,ARTDES ' +
      ' FROM LOG316 WHERE ' + xWhere;

   DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);

   sSQL := 'SELECT TGE131.GRARDES, TGE169.FAMDES, TGE170.SFAMDES, LOG316.*, TGE130.UNMABR FROM LOG334 LOG316, TGE130, TGE131, TGE169, TGE170  ' +
      'WHERE TOINID=' + QuotedStr(dblcdTomaInv.text) + ' AND ' + xWhere + ' ' +
      ' AND LOG316.UNMIDG=TGE130.UNMID ' +
      ' AND LOG316.CIAID=TGE131.CIAID(+) AND LOG316.TINID=TGE131.TINID(+) AND LOG316.GRARID=TGE131.GRARID(+) ' +
      ' AND LOG316.CIAID=TGE169.CIAID(+) AND LOG316.TINID=TGE169.TINID(+) AND LOG316.GRARID=TGE169.GRARID(+) AND LOG316.FAMID=TGE169.FAMID(+) ' +
      ' AND LOG316.CIAID=TGE170.CIAID(+) AND LOG316.TINID=TGE170.TINID(+) AND LOG316.GRARID=TGE170.GRARID(+) AND LOG316.FAMID=TGE170.FAMID(+) AND LOG316.SFAMID=TGE170.SFAMID(+) ' +
      ' ORDER BY LOG316.CIAID, LOG316.TINID, LOG316.GRARID, LOG316.FAMID, LOG316.SFAMID, LOG316.ARTID ';
//  if length(xOrder)>0 then sSQL:=sSQL+xOrder;

   DMALM.cdsReporte.Close;
   DMALM.cdsReporte.DataRequest(sSQL);
   DMALM.cdsReporte.Open;
   Screen.Cursor := crDefault;
   pprTomaInv.Print;
   pprTomaInv.Stop;

   ppDesigner1.Show;
   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;

End;

Procedure TFToolMant.dblcCIAEnter(Sender: TObject);
Begin
   If Not DMALM.cdsCIA.Active Then
      FiltraTabla(DMALM.cdsCia, 'TGE101', 'CIAID', 'CIAID');
End;

Procedure TFToolMant.Timer1Timer(Sender: TObject);
Begin
   FVariables.w_NombreForma := 'FToolMant';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolMant);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

End.

