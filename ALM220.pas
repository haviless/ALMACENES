Unit ALM220;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : ALM220
//Formulario               : FGuiaRemisionALM
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Genera las Guías de Remisión

//Actualización
// HPC_201202_ALM 13/08/2012: -  Se implementó la funcionalidad que permite registrar
//                              Guías de Remisión desde Requerimientos de Usuario
// HPC_201310_ALM  14/12/2013 -  Se modifico el numero de Guia de Remision inicial con un numero temporal
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
// HPC_201803_ALM 12/06/2018 Se mejora el número de Guia

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Wwdbdlg, StdCtrls, DBCtrls,
   Mask, wwdbedit, wwdbdatetimepicker, wwdblook, Buttons, fcButton,
   fcImgBtn, fcShapeBtn, ppBands, ppCache, ppClass, ppEndUsr, ppProd,
   ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppPrnabl, ppCtrls,
   ppStrtch, ppMemo, ppParameter, StrContainer, MsgDlgs;

Type
   TFGuiaRemisionALM = Class(TForm)
      pnlCab: TPanel;
      pnlBoton: TPanel;
      lblFReg: TLabel;
      dbdtpFNS: TwwDBDateTimePicker;
      Label1: TLabel;
      dtpFectra: TwwDBDateTimePicker;
      lblObs: TLabel;
      dbmObs: TDBMemo;
      Label21: TLabel;
      dblcdProvinc: TwwDBLookupComboDlg;
      Label22: TLabel;
      Label23: TLabel;
      dblcdDistrito: TwwDBLookupComboDlg;
      Label11: TLabel;
      dbeDirCom: TwwDBEdit;
      dbeDeparta: TwwDBEdit;
      dbeProvinc: TwwDBEdit;
      dbeDistrito: TwwDBEdit;
      Label10: TLabel;
      dbeRazSoc: TwwDBEdit;
      dblcdCC: TwwDBLookupComboDlg;
      Label27: TLabel;
      dbeRuc: TwwDBEdit;
      Label2: TLabel;
      dbeTraNom: TwwDBEdit;
      Label3: TLabel;
      dbeTraRuc: TwwDBEdit;
      Label4: TLabel;
      dbeTraPla: TwwDBEdit;
      Label7: TLabel;
      Bevel1: TBevel;
      Bevel2: TBevel;
      Bevel3: TBevel;
      dbeCC: TwwDBEdit;
      lblCC: TLabel;
      dbgDReqs: TwwDBGrid;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnAceptar: TBitBtn;
      Panel3: TPanel;
      dbeEstado: TwwDBEdit;
      Label5: TLabel;
      Z2bbtnSalir: TBitBtn;
      Z2bbtnPrint: TBitBtn;
      ppdbDet: TppBDEPipeline;
      ppr1: TppReport;
      ppd1: TppDesigner;
      ppdbCab: TppDBPipeline;
      Label6: TLabel;
      dbeDirOri: TwwDBEdit;
      ppdbOtros: TppDBPipeline;
      dbgGuia: TwwDBGrid;
      dbgDetalle: TwwDBGrid;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppDBMemo1: TppDBMemo;
      ppDBText18: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLabel1: TppLabel;
      Panel2: TPanel;
      lblCIA: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      lblTI: TLabel;
      dbeTinId: TwwDBEdit;
      dbeNisaId: TwwDBEdit;
      lblDoc: TLabel;
      Z2bbtnOK: TBitBtn;
      scFile: TStrContainer;
      sdGraba: TSaveDialog;
      bbtnExp: TfcShapeBtn;
      bbtnNumero: TBitBtn;
      bbtnAnular: TBitBtn;
      dblcDeparta: TwwDBLookupComboDlg;
      pnlArticulo: TPanel;
      edtDetItem: TwwDBEdit;
      edtDetArticulo: TwwDBEdit;
      edtDetDescripcion: TwwDBEdit;
      edtDetCantidad: TwwDBEdit;
      dblcDetUnidMedida: TwwDBLookupCombo;
      edtUnidMedida: TwwDBEdit;
      stxTitulo3: TStaticText;
      Label8: TLabel;
      Label9: TLabel;
      Label12: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      btnDetGrabar: TBitBtn;
      btnDetCancelar: TBitBtn;
   // Inicio HPC_201310_ALM
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      sbDiseno: TSpeedButton;
      cbDiseno: TCheckBox;
   // Fin HPC_201310_ALM
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnAceptarClick(Sender: TObject);
      Procedure Z2bbtnPrintClick(Sender: TObject);
      Procedure dblcDepartaExit(Sender: TObject);
      Procedure dblcdProvincExit(Sender: TObject);
      Procedure dblcdDistritoExit(Sender: TObject);
      Procedure dblcdDistritoEnter(Sender: TObject);
      Procedure dblcdProvincEnter(Sender: TObject);
      Procedure dblcdCCExit(Sender: TObject);
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure dbgGuiaRowChanged(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnExpClick(Sender: TObject);
      Procedure bbtnNumeroClick(Sender: TObject);
      Procedure bbtnAnularClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure btnDetCancelarClick(Sender: TObject);
      Procedure btnDetGrabarClick(Sender: TObject);
      Procedure dbgDetalleDblClick(Sender: TObject);
      Procedure dbgDReqsDblClick(Sender: TObject);
      Procedure sbDisenoClick(Sender: TObject);
   Private
    { Private declarations }
      cNumGuiaN: String;
      cSerie: String;
      cDptoId: String;
      cCiudId: String;
      cZipId: String;
      cDireec: String;
      cRazSoc: String;
      cDesRuc: String;
      cDocIde: String;
      cTraNom: String;
      cTraRuc: String;
      cTraPla: String;
      cObsGui: String;
      Function MaxSQL(Const sTabla, sMxCampo, sCondicion: String): String;
      Function AperturaTablas: Boolean;
      Procedure InsertaGuiaRemisionALM;
      Procedure InsertaGuiaRemisionAF;
      Procedure InsertaGuiaRemisionRU;
      Function InsertaDetalleAF: Boolean;
      Function InsertaDetalleALM: Boolean;
      Function InsertaDetalleRU: Boolean;
      Function GrabaGuiaRemision: Boolean;
      Procedure AsignaValoresGuia;
      Procedure CapturaValoresGuia;
      Function Numero_y_AceptaGuia: Boolean;
      Function Cambia_Numero: Boolean;
  //INICIO HPC_201310_ALM
      Function NumGuia(xCiaid: String): String;
  //FINAL HPC_201310_ALM
      Procedure fg_InicializaPanel;
      Procedure fg_RecuperaDetGuia(wgCompania, wgSerieGuia,
         wgNumGuia: String);
   Public
    { Public declarations }
      xsOrigen: String;
      xsCompania: String;
      Function ExisteGuiaRemision(cCia, cSer, cNum: String): Boolean;
   End;

Var
   fNumOk: Boolean;
   FGuiaRemisionALM: TFGuiaRemisionALM;

Implementation

{$R *.dfm}

Uses ALMDM1, ALM224, oaIN3000, ALM222;

Function TFGuiaRemisionALM.MaxSQL(Const sTabla, sMxCampo, sCondicion: String): String;
Var
   sSQL, sWhere: String;
Begin
   sWhere := ' Where ' + sCondicion;

   sSQL := 'SELECT MAX(NVL(' + SMXCAMPO + ',''0'')) AS X FROM ' + sTabla + ' ' + sWhere;

   DMALM.cdsQry1.Close;
   DMALM.cdsQry1.DataRequest(sSQL);
   DMALM.cdsQry1.Open;
   If DMALM.cdsQry1.FieldByName('X').IsNull Then
      result := '1'
   Else
      result := IntToStr(DMALM.cdsQry1.FieldByName('X').AsInteger + 1);
End;

Procedure TFGuiaRemisionALM.InsertaGuiaRemisionALM;
Begin
   DMALM.cdsCnt300.Insert;
   DMALM.cdsCnt300.FieldByName('CIAID').AsString := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   DMALM.cdsCnt300.FieldByName('FECGUIA').AsDateTime := Date;
   DMALM.cdsCnt300.FieldByName('SERGUIA').AsString := cSerie;
  //INICIO HPC_201310_ALM
  //DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString     :=DMALM.cdsNIS.FieldByName('NISAID').AsString;
   DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString := NumGuia(DMALM.cdsNIS.FieldByName('CIAID').AsString);
  //FINAL HPC_201310_ALM
   DMALM.cdsCnt300.FieldByName('GUIAFECTRA').AsDateTime := Date;
   DMALM.cdsCnt300.FieldByName('USUARIO').AsString := DMALM.wUsuario;
   DMALM.cdsCnt300.FieldByName('CCOSID').AsString := DMALM.cdsNIS.FieldByName('CCOSID').AsString;

   DMALM.cdsCnt300.FieldByName('TRIID').AsString := DMALM.cdsNIS.FieldByName('TRIID').AsString;
   DMALM.cdsCnt300.FieldByName('LOCID').AsString := DMALM.cdsNIS.FieldByName('LOCID').AsString;
   DMALM.cdsCnt300.FieldByName('TINID').AsString := DMALM.cdsNIS.FieldByName('TINID').AsString;
   DMALM.cdsCnt300.FieldByName('ALMID').AsString := DMALM.cdsNIS.FieldByName('ALMID').AsString;
   DMALM.cdsCnt300.FieldByName('TDAID').AsString := DMALM.cdsNIS.FieldByName('TDAID').AsString;
   DMALM.cdsCnt300.FieldByName('NISAID').AsString := DMALM.cdsNIS.FieldByName('NISAID').AsString;
   DMALM.cdsCnt300.FieldByName('NISATIP').AsString := DMALM.cdsNIS.FieldByName('NISATIP').AsString;

   DMALM.cdsCnt300.FieldByName('TRANNOM').AsString := 'UNIVERSAL SUPPORT & SERVICES SAC.';
   DMALM.cdsCnt300.FieldByName('TRANRUC').AsString := '20505129751';
   DMALM.cdsCnt300.FieldByName('ORIGEN').AsString := 'NS';
End;

Procedure TFGuiaRemisionALM.InsertaGuiaRemisionAF;
Begin
   DMALM.cdsCnt300.Insert;
   DMALM.cdsCnt300.FieldByName('CIAID').AsString := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   DMALM.cdsCnt300.FieldByName('FECGUIA').AsDateTime := Date;
   DMALM.cdsCnt300.FieldByName('SERGUIA').AsString := cSerie;
  //INICIO HPC_201310_ALM
  //DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString     :=DMALM.cdsNIS.FieldByName('NUMDOC').AsString;
   DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString := NumGuia(DMALM.cdsNIS.FieldByName('CIAID').AsString);
  //FINAL HPC_201310_ALM
   DMALM.cdsCnt300.FieldByName('GUIAFECTRA').AsDateTime := Date;
   DMALM.cdsCnt300.FieldByName('USUARIO').AsString := DMALM.wUsuario;
   DMALM.cdsCnt300.FieldByName('NISAID').AsString := DMALM.cdsNIS.FieldByName('NUMDOC').AsString;
   DMALM.cdsCnt300.FieldByName('TRANNOM').AsString := 'UNIVERSAL SUPPORT & SERVICES SAC.';
   DMALM.cdsCnt300.FieldByName('TRANRUC').AsString := '20505129751';
   DMALM.cdsCnt300.FieldByName('RAZSOC').AsString := DMALM.cdsNIS.FieldByName('NOMAUT_D').AsString;
   DMALM.cdsCnt300.FieldByName('ORIGEN').AsString := 'AF';

End;

Procedure TFGuiaRemisionALM.InsertaGuiaRemisionRU;
Begin
   DMALM.cdsCnt300.Insert;
   DMALM.cdsCnt300.FieldByName('CIAID').AsString := DMALM.cdsNIS.FieldByName('CIAID').AsString;
   DMALM.cdsCnt300.FieldByName('FECGUIA').AsDateTime := Date;
   DMALM.cdsCnt300.FieldByName('SERGUIA').AsString := cSerie;
  //INICIO HPC_201310_ALM
  //DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString   :=DMALM.cdsNIS.FieldByName('URQID').AsString;
   DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString := NumGuia(DMALM.cdsNIS.FieldByName('CIAID').AsString);
  //FINAL HPC_201310_ALM

   DMALM.cdsCnt300.FieldByName('GUIAFECTRA').AsDateTime := Date;
   DMALM.cdsCnt300.FieldByName('USUARIO').AsString := DMALM.wUsuario;
   DMALM.cdsCnt300.FieldByName('NISAID').AsString := DMALM.cdsNIS.FieldByName('URQID').AsString;
   DMALM.cdsCnt300.FieldByName('TRANNOM').AsString := 'UNIVERSAL SUPPORT & SERVICES SAC.';
   DMALM.cdsCnt300.FieldByName('TRANRUC').AsString := '20505129751';
   DMALM.cdsCnt300.FieldByName('ORIGEN').AsString := 'RU';

End;

Procedure TFGuiaRemisionALM.AsignaValoresGuia;
Begin
   DMALM.cdsCnt300.FieldByName('DPTOID').AsString := cDptoId;
   DMALM.cdsCnt300.FieldByName('CIUDID').AsString := cCiudId;
   DMALM.cdsCnt300.FieldByName('ZIPID').AsString := cZipId;
   DMALM.cdsCnt300.FieldByName('DIRECC').AsString := cDireec;
   DMALM.cdsCnt300.FieldByName('RAZSOC').AsString := cRazSoc;
   DMALM.cdsCnt300.FieldByName('DESRUC').AsString := cDesRuc;
   DMALM.cdsCnt300.FieldByName('DOCIDE').AsString := cDocIde;
   DMALM.cdsCnt300.FieldByName('TRANNOM').AsString := cTraNom;
   DMALM.cdsCnt300.FieldByName('TRANRUC').AsString := cTraRuc;
   DMALM.cdsCnt300.FieldByName('TRANPLA').AsString := cTraPla;
   DMALM.cdsCnt300.FieldByName('OBSGUIA').AsString := cObsGui;
End;

Function TFGuiaRemisionALM.AperturaTablas: Boolean;
Var
   xSQL: String;
Begin

// DEPARTAMENTOS
   xSQL := 'SELECT SUBSTR(UBIGEOID,1,2) DPTOID,UBIGEODPTO DPTODES '
      + 'FROM TGE147 '
      + 'WHERE UBIGEOPROV IS NULL and SUBSTR(UBIGEOID,1,2)<>''00'' '
      + 'ORDER BY UBIGEOID';
   If Not DMALM.cdsDpto.Active Then
      DMALM.FiltraCds(DMALM.cdsDpto, xSQL);
   DMALM.cdsDpto.IndexFieldNames := 'DPTOID';

   dblcDeparta.Selected.clear;
   dblcDeparta.Selected.Add('DPTOID'#9'06'#9'Código');
   dblcDeparta.Selected.Add('DPTODES'#9'30'#9'Departamento');

// PROVINCIAS
   xSQL := 'SELECT SUBSTR(UBIGEOID,1,2) DPTOID, SUBSTR(UBIGEOID,3,2) CIUDID,UBIGEOPROV CIUDDES '
      + 'FROM TGE147 '
      + 'WHERE UBIGEOPROV IS NOT NULL AND UBIGEODIST IS NULL';
   If Not DMALM.cdsProvinc.Active Then
      DMALM.FiltraCds(DMALM.cdsProvinc, xSQL);
   DMALM.cdsProvinc.IndexFieldNames := 'CIUDID';

// DISTRITO
   xSQL := 'SELECT SUBSTR(UBIGEOID,1,2) DPTOID, SUBSTR(UBIGEOID,3,2) CIUDID,SUBSTR(UBIGEOID,5,2) ZIPID,UBIGEODIST ZIPDES '
      + 'FROM TGE147 '
      + 'WHERE UBIGEOPROV IS NOT NULL AND UBIGEODIST IS NOT NULL';
   If Not DMALM.cdsDistrito.Active Then
      DMALM.FiltraCds(DMALM.cdsDistrito, xSQL);
   DMALM.cdsDistrito.IndexFieldNames := 'ZIPID';
// Inicio HPC_201803_ALM
// Reporte por Fondo Editorial
   FiltraTabla(DMALM.cdsCCost, 'TGE203', 'CCOSID', 'CCOSID');
   dblcdCC.DataSource := DMALM.dsCnt300;
   dblcdCC.LookupTable := DMALM.cdsCCost;

// Fin HPC_201803_ALM

   xSQL := 'select SERIEID from FAC103 A '
      + 'WHERE CIAID=''' + xsCompania + ''' and FLAGV=''G''';

   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xSQL);
   DMALM.cdsQry.Open;

   If DMALM.cdsQry.FieldByName('SERIEID').AsString = '' Then
   Begin
      ShowMessage('Error : No existe Serie para Guia de Remision');
      Close;
      Exit;
   End;
   cSerie := DMALM.cdsQry.FieldByName('SERIEID').AsString;

   Result := True;
End;

Procedure TFGuiaRemisionALM.Z2bbtnGrabaClick(Sender: TObject);
Var
   xSQL: String;
   xMes: String;
Begin
   If DMALM.cdsCnt300.FieldByName('ESTADO').AsString = '' Then
   Begin
      ShowMessage('Debe Generar Guia(s) de Remisión');
      Exit;
   End;

   xMes := Copy(DMALM.cdsCnt300.FieldByName('FECGUIA').AsString, 7, 4) + Copy(DMALM.cdsCnt300.FieldByName('FECGUIA').AsString, 4, 2);

   DMALM.cdsCnt300.Edit;
   DMALM.cdsCnt300.FieldByName('FECREGGUIA').AsDateTime := Date + SysUtils.Time;
   DMALM.cdsPost(DMALM.cdsCnt300);
   DMALM.cdsCnt300.Post;

   xSQL := 'Select * from LOG_GUI_REM '
      + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
      + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
      + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
   DMALM.cdsCnt300.DataRequest(xSQL);

   If DMALM.cdsCnt300.ApplyUpdates(0) > 0 Then
   Begin
      ShowMessage('Error al Grabar');
      Close;
   End;

   If DMALM.cdsCnt300.RecordCount > 1 Then
   Begin

      CapturaValoresGuia;

      DMALM.cdsCnt300.First;
      While Not DMALM.cdsCnt300.Eof Do
      Begin

         DMALM.cdsCnt300.Edit;
         AsignaValoresGuia;
         DMALM.cdsCnt300.FieldByName('FECREGGUIA').AsDateTime := Date + SysUtils.Time;
         DMALM.cdsPost(DMALM.cdsCnt300);
         DMALM.cdsCnt300.Post;

         xSQL := 'Select * from LOG_GUI_REM '
            + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
            + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
            + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
         DMALM.cdsCnt300.DataRequest(xSQL);

         If DMALM.cdsCnt300.ApplyUpdates(0) > 0 Then
         Begin
            ShowMessage('Error al Grabar');
            Close;
         End;

         DMALM.cdsCnt300.Next;
      End;
   End;
   Z2bbtnAceptar.Enabled := True;
   ShowMessage('Guia Grabada');
End;

Procedure TFGuiaRemisionALM.Z2bbtnAceptarClick(Sender: TObject);
Begin
   Try
      fNumOk := False;
      FGuiaNum := TFGuiaNum.Create(Self);
      FGuiaNum.ShowModal;
   Finally
      If fNumOk Then
      Begin
         cNumGuiaN := FGuiaNum.dbeNumGuia.Text;
         If Numero_y_AceptaGuia Then
         Begin
            Try
               DMALM.ControlTran(8, Nil, ''); //COMMIT
               ShowMessage('Guia Aceptada');
            Except
               DMALM.ControlTran(1, Nil, ''); //ROLLBACK
            End
         End
         Else
         Begin
            DMALM.ControlTran(1, Nil, ''); //ROLLBACK
         End;
      End;
      FGuiaNum.Free;
   End;
End;

Function TFGuiaRemisionALM.Numero_y_AceptaGuia: Boolean;
Var
   xSQL: String;
Begin
   Result := False;

   CapturaValoresGuia;

   pnlCab.Enabled := False;

   ErrorCount := 0;
   DMALM.DCOM1.AppServer.IniciaTransaccion;

   DMALM.cdsCnt300.First;
   While Not DMALM.cdsCnt300.Eof Do
   Begin
      DMALM.cdsCnt300.Edit;
      AsignaValoresGuia;

      DMALM.cdsCnt300.FieldByName('ESTADO').AsString := 'ACEPTADO';
      DMALM.cdsCnt300.FieldByName('FECREGGUIA').AsDateTime := DateS + SysUtils.Time;
      DMALM.cdsCnt300.FieldByName('FECGUIA').AsDateTime := DateS;
      DMALM.cdsPost(DMALM.cdsCnt300);
      DMALM.cdsCnt300.Post;

      xSQL := 'Select * from LOG_GUI_REM '
         + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
         + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
         + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
      DMALM.cdsCnt300.DataRequest(xSQL);

      If DMALM.cdsCnt300.ApplyUpdates(0) > 0 Then
      Begin
         ShowMessage('Error al Grabar');
         Exit;
      End;

      If ExisteGuiaRemision(DMALM.cdsCnt300.FieldByName('CIAID').AsString,
         DMALM.cdsCnt300.FieldByName('SERGUIA').AsString, cNumGuiaN) Then
      Begin
         ShowMessage('Numero de Guia ya fue Usado');
         Exit;
      End;

      xSQL := 'Update LOG_GUI_DET SET NUMGUIA=''' + cNumGuiaN + ''' '
         + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
         + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
         + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      DMALM.cdsTGE.Execute;

      xSQL := 'Update LOG_GUI_REM SET NUMGUIA=''' + cNumGuiaN + ''' '
         + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
         + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
         + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
      DMALM.cdsTGE.Close;
      DMALM.cdsTGE.DataRequest(xSQL);
      Try
         DMALM.cdsTGE.Execute;
      Except
         ShowMessage('Numero de Guia ya fue Usado');
         Exit;
      End;

      cNumGuiaN := DMALM.StrZero(IntToStr(StrToInt(cNumGuiaN) + 1), 7);

      DMALM.cdsCnt300.Next;
   End;

   If xsOrigen = 'AF' Then
   Begin
      xSQL := 'Select * from LOG_GUI_REM '
         + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
         + 'and NISAID=''' + DMALM.cdsCnt300.FieldByName('NISAID').AsString + ''' '
         + 'and ESTADO<>''ANULADO'' '
         + 'Order by SERGUIA, NUMGUIA';
   End
   Else
      If xsOrigen = 'NS' Then
      Begin
         xSQL := 'Select * from LOG_GUI_REM '
            + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
            + 'and TINID=''' + DMALM.cdsCnt300.FieldByName('TINID').AsString + ''' '
            + 'and NISAID=''' + DMALM.cdsCnt300.FieldByName('NISAID').AsString + ''' '
            + 'and ESTADO<>''ANULADO'' '
            + 'Order by SERGUIA, NUMGUIA';
      End
      Else
         If xsOrigen = 'RU' Then
         Begin
            xSQL := ' Select * from LOG_GUI_REM '
               + ' Where CIAID=' + QuotedStr(DMALM.cdsCnt300.FieldByName('CIAID').AsString)
               + ' and NISAID=' + Quotedstr(DMALM.cdsCnt300.FieldByName('NISAID').AsString)
               + ' and ESTADO<>' + QuotedStr('ANULADO')
               + ' Order by SERGUIA, NUMGUIA';

         End;
   DMALM.cdsCnt300.Close;
   DMALM.cdsCnt300.DataRequest(xSQL);
   DMALM.cdsCnt300.Open;

   dbgGuiaRowChanged(Self);

   Z2bbtnGraba.Enabled := False;
   Z2bbtnAceptar.Enabled := False;
   Z2bbtnPrint.Enabled := True;
   bbtnAnular.Enabled := True;
   bbtnExp.Enabled := True;
   bbtnNumero.Enabled := True;
   Result := True;
End;

Procedure TFGuiaRemisionALM.Z2bbtnPrintClick(Sender: TObject);
Var
   x10: Integer;
   xSQL: String;
Begin

   If DMALM.cdsCnt300.FieldByName('ESTADO').AsString <> 'ACEPTADO' Then
   Begin
      ShowMessage('Para Imprimir Guia(s) deben estar Aceptadas');
      Exit;
   End;
// Inicio HPC_201803_ALM
// Reporte por Fondo Editorial
   if (DMALM.cdsCnt300.FieldByName('CIAID').AsString ='21') and (DMALM.cdsCnt300.FieldByName('TRIID').AsString='21') then
   begin
       xSQL := 'Select A.*, B.DPTODES, C.CIUDDES, D.ZIPDES, E.TRIDES '
          + 'From LOG_GUI_REM A, TGE158 B, TGE121 C, TGE122 D,(SELECT TGE208.* FROM TGE208 WHERE TGE208.TRISGT = ' + QuotedStr('S') + ')  E '
          + 'Where A.CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
          + 'and A.SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
          + 'and A.NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + ''' '
          + 'and A.DPTOID=B.DPTOID(+) '
          + 'and A.DPTOID=C.DPTOID(+) AND A.CIUDID=C.CIUDID(+) '
          + 'and A.DPTOID=D.DPTOID(+) AND A.CIUDID=D.CIUDID(+) AND A.ZIPID=D.ZIPID(+) '
          + 'and A.TRIID=E.TRIID(+)';
       DMALM.cdsQry8.Close;
       DMALM.cdsQry8.DataRequest(xSQL);
       DMALM.cdsQry8.Open;

       ppdbOtros.DataSource := DMALM.dsQry8;
       ppdbCab.DataSource := DMALM.dsQry8;
       ppdbDet.DataSource := DMALM.dsCnt301;
       ppr1.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\GuiaRemisionEditorial.rtm';
       ppr1.Template.LoadFromFile;
   end
   else if (DMALM.cdsCnt300.FieldByName('CIAID').AsString ='21') and (DMALM.cdsCnt300.FieldByName('TRIID').AsString='03') then
   begin
       xSQL := 'Select A.*, B.DPTODES, C.CIUDDES, D.ZIPDES, E.TRIDES '
          + 'From LOG_GUI_REM A, TGE158 B, TGE121 C, TGE122 D,(SELECT TGE208.* FROM TGE208 WHERE TGE208.TRISGT = ' + QuotedStr('S') + ')  E '
          + 'Where A.CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
          + 'and A.SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
          + 'and A.NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + ''' '
          + 'and A.DPTOID=B.DPTOID(+) '
          + 'and A.DPTOID=C.DPTOID(+) AND A.CIUDID=C.CIUDID(+) '
          + 'and A.DPTOID=D.DPTOID(+) AND A.CIUDID=D.CIUDID(+) AND A.ZIPID=D.ZIPID(+) '
          + 'and A.TRIID=E.TRIID(+)';
       DMALM.cdsQry8.Close;
       DMALM.cdsQry8.DataRequest(xSQL);
       DMALM.cdsQry8.Open;

       ppdbOtros.DataSource := DMALM.dsQry8;
       ppdbCab.DataSource := DMALM.dsQry8;
       ppdbDet.DataSource := DMALM.dsCnt301;
       ppr1.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\GuiaRemisionEditorial03.rtm';
       ppr1.Template.LoadFromFile;
   end
   else
   begin
       xSQL := 'Select A.*, B.DPTODES, C.CIUDDES, D.ZIPDES, E.TRIDES '
          + 'From LOG_GUI_REM A, TGE158 B, TGE121 C, TGE122 D,(SELECT TGE208.* FROM TGE208 WHERE TGE208.TRISGT = ' + QuotedStr('S') + ')  E '
          + 'Where A.CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
          + 'and A.SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
          + 'and A.NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + ''' '
          + 'and A.DPTOID=B.DPTOID(+) '
          + 'and A.DPTOID=C.DPTOID(+) AND A.CIUDID=C.CIUDID(+) '
          + 'and A.DPTOID=D.DPTOID(+) AND A.CIUDID=D.CIUDID(+) AND A.ZIPID=D.ZIPID(+) '
          + 'and A.TRIID=E.TRIID(+)';
       DMALM.cdsQry8.Close;
       DMALM.cdsQry8.DataRequest(xSQL);
       DMALM.cdsQry8.Open;

       ppdbOtros.DataSource := DMALM.dsQry8;
       ppdbCab.DataSource := DMALM.dsQry8;
       ppdbDet.DataSource := DMALM.dsCnt301;
       ppr1.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\GuiaRemision.rtm';
       ppr1.Template.LoadFromFile;
   end;
// Fin HPC_201803_ALM
   Screen.Cursor := crDefault;

 //INICIO HPC_201310_ALM
   If cbDiseno.Checked Then
   Begin
      ppd1.ShowModal;
   End
   Else
   Begin
      ppr1.Print;
      ppr1.Stop;

      x10 := Self.ComponentCount - 1;
      While x10 >= 0 Do
      Begin
         If Self.Components[x10].ClassName = 'TppGroup' Then
         Begin
            Self.Components[x10].Free;
         End;
         x10 := x10 - 1;
      End;
      ppdbOtros.DataSource := Nil;
      DMALM.cdsQry8.Close;
   End;
  //FINAL HPC_201310_ALM
End;

Procedure TFGuiaRemisionALM.dblcDepartaExit(Sender: TObject);
Begin
   If length(dblcDeparta.Text) = 0 Then exit;

   DMALM.cdsDpto.IndexFieldNames := 'DPTOID';
   DMALM.cdsDpto.SetKey;
   DMALM.cdsDpto.FieldByName('DPTOID').AsString := dblcDeparta.Text;
   If Not DMALM.cdsDpto.GotoKey Then
   Begin
      ShowMessage('Código de Departamento No Existe');
      dblcDeparta.Text := '';
      dblcDeparta.SetFocus;
      exit;
   End;
   dbeDeparta.Text := DMALM.cdsDpto.FieldByName('DPTODES').AsString;
   DMALM.cdsProvinc.Filter := 'DPTOID=' + quotedstr(dblcDeparta.Text);
   DMALM.cdsProvinc.Filtered := True;
   DMALM.cdsProvinc.First;
End;

Procedure TFGuiaRemisionALM.dblcdProvincExit(Sender: TObject);
Begin
   If length(dblcDProvinc.Text) = 0 Then exit;

   DMALM.cdsProvinc.IndexFieldNames := 'CIUDID';
   DMALM.cdsProvinc.SetKey;
   DMALM.cdsProvinc.FieldByName('CIUDID').AsString := dblcDProvinc.Text;
   If Not DMALM.cdsProvinc.GotoKey Then
   Begin
      ShowMessage('Código de Provincia No Existe');
      dblcdProvinc.Text := '';
      dblcdProvinc.SetFocus;
      exit;
   End;
   dbeProvinc.Text := DMALM.cdsProvinc.FieldByName('CIUDDES').AsString;

   DMALM.cdsDistrito.Filter := 'DPTOID=' + quotedstr(dblcDeparta.Text)
      + ' and CIUDID=' + quotedstr(dblcdProvinc.Text);
   DMALM.cdsDistrito.Filtered := True;
   DMALM.cdsDistrito.First;
End;

Procedure TFGuiaRemisionALM.dblcdDistritoExit(Sender: TObject);
Begin
   If length(dblcdDistrito.Text) = 0 Then exit;

   DMALM.cdsDistrito.IndexFieldNames := 'ZIPID';
   DMALM.cdsDistrito.SetKey;
   DMALM.cdsDistrito.FieldByName('ZIPID').AsString := dblcdDistrito.Text;
   If Not DMALM.cdsDistrito.GotoKey Then
   Begin
      ShowMessage('Código de Distrito No Existe');
      dblcdDistrito.Text := '';
      dblcdDistrito.SetFocus;
      exit;
   End;
   dbeDistrito.Text := DMALM.cdsDistrito.FieldByName('ZIPDES').AsString;
End;

Procedure TFGuiaRemisionALM.dblcdDistritoEnter(Sender: TObject);
Begin
   If dblcDeparta.Text = '' Then
   Begin
      dblcDeparta.Setfocus;
      Exit;
   End;
   If dblcdProvinc.Text = '' Then
   Begin
      dblcdProvinc.Setfocus;
      Exit;
   End;
End;

Procedure TFGuiaRemisionALM.dblcdProvincEnter(Sender: TObject);
Begin
   If dblcDeparta.Text = '' Then
   Begin
      dblcDeparta.Setfocus;
      Exit;
   End;
End;

Procedure TFGuiaRemisionALM.dblcdCCExit(Sender: TObject);
Begin
   dbeCC.text := DMALM.DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', 'CCOSID=' + quotedstr(dblcdCC.text), 'CCOSDES');
End;

Procedure TFGuiaRemisionALM.Z2bbtnOKClick(Sender: TObject);
Begin
   If DMALM.cdsCnt300.FieldByName('ESTADO').AsString = 'INICIAL' Then
   Begin
      ShowMessage('Guia(s) de Remisión ya fueron Generadas');
      Exit;
   End;

   If dbeRazSoc.text = '' Then
   Begin
      ShowMessage('Ingresar la Razón Social del Destinatario');
      Exit;
   End;

   If dbeRuc.text = '' Then
   Begin
      ShowMessage('Ingresar el R.U.C./D.N.I. del Destinatario');
      Exit;
   End;

   If dblcDeparta.text = '' Then
   Begin
      ShowMessage('Ingresar Departamento');
      Exit;
   End;

   If dblcdProvinc.text = '' Then
   Begin
      ShowMessage('Ingresar la Provincia');
      Exit;
   End;

   If dblcdDistrito.text = '' Then
   Begin
      ShowMessage('Ingresar El Distrito del Destinatario');
      Exit;
   End;

   If dbeDirCom.text = '' Then
   Begin
      ShowMessage('Ingresar la Dirección del Destinatario');
      Exit;
   End;

   If dbeTraNom.text = '' Then
   Begin
      ShowMessage('Ingresar el Nombre del Transportista');
      Exit;
   End;

   ErrorCount := 0;
   DMALM.DCOM1.AppServer.IniciaTransaccion;

   If Not GrabaGuiaRemision Then
   Begin
      DMALM.ControlTran(1, Nil, ''); //ROLLBACK
      ShowMessage('Error al Grabar Número de Guía de Remisión. Intente Nuevamente.');
      Close;
   End;

   If xsOrigen = 'AF' Then // si Origen es Activo Fijo
   Begin
      If Not InsertaDetalleAF Then
      Begin
         DMALM.ControlTran(1, Nil, ''); //ROLLBACK
         ShowMessage('Error al Grabar Número de Guía de Remisión. Intente Nuevamente.');
         Close;
      End;
   End
   Else
      If xsOrigen = 'NS' Then
      Begin
         If Not InsertaDetalleALM Then
         Begin
            DMALM.ControlTran(1, Nil, ''); //ROLLBACK
            ShowMessage('Error al Grabar Número de Guía de Remisión. Intente Nuevamente.');
            Close;
         End;
      End
      Else
         If xsOrigen = 'RU' Then
         Begin
            If Not InsertaDetalleRU Then
            Begin
               DMALM.ControlTran(1, Nil, ''); //ROLLBACK
               ShowMessage('Error al Grabar Número de Guía de Remisión. Intente Nuevamente.');
               Close;
            End;
         End;

   DMALM.cdsCnt300.First;

   DMALM.ControlTran(8, Nil, ''); //COMMIT

   dbgGuiaRowChanged(Self);

   dbgDetalle.Visible := True;
   dbgDReqs.Visible := False;

   Z2bbtnOK.Visible := False;
   Z2bbtnAceptar.Enabled := True;
   DMALM.wModoGuia := 'M';
   ShowMessage('Guia de Remisión Generada');

End;

Function TFGuiaRemisionALM.GrabaGuiaRemision: Boolean;
Var
   xSQL: String;
   xMes, cNumGuia: String;
Begin
   Result := False;
   xMes := Copy(DMALM.cdsCnt300.FieldByName('FECGUIA').AsString, 7, 4) + Copy(DMALM.cdsCnt300.FieldByName('FECGUIA').AsString, 4, 2);

   xSQL := 'SELECT MAX(NVL(SUBSTR(NUMGUIA,2,7),''0'')) AS NUM FROM LOG_GUI_REM '
      + 'Where CIAID=''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' '
      + 'and SERGUIA=''' + cSerie + ''' AND SUBSTR(NUMGUIA,1,1)=''I''';
   DMALM.cdsTGE.Close;
   DMALM.cdsTGE.DataRequest(xSQL);
   DMALM.cdsTGE.Open;

   If DMALM.cdsTGE.FieldByName('NUM').IsNull Then
      cNumGuia := 'I000001'
   Else
      cNumGuia := 'I' + DMALM.StrZero(IntToStr(DMALM.cdsTGE.FieldByName('NUM').AsInteger + 1), 6);

   DMALM.cdsCnt300.Edit;
   DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString := cNumGuia;

   DMALM.cdsCnt300.FieldByName('FECREGGUIA').AsDateTime := Date + SysUtils.Time;
   DMALM.cdsCnt300.FieldByName('ESTADO').AsString := 'INICIAL';
   DMALM.cdsCnt300.FieldByName('GUIAANOMES').AsString := xMes;
   DMALM.cdsPost(DMALM.cdsCnt300);
   DMALM.cdsCnt300.Post;

   xSQL := 'Select A.*, ROWID from LOG_GUI_REM '
      + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
      + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
      + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
   DMALM.cdsCnt300.DataRequest(xSQL);

   If DMALM.cdsCnt300.ApplyUpdates(0) > 0 Then
      Exit;

   CapturaValoresGuia;

   Result := True;
End;

Procedure TFGuiaRemisionALM.CapturaValoresGuia;
Begin
   cDptoId := DMALM.cdsCnt300.FieldByName('DPTOID').AsString;
   cCiudId := DMALM.cdsCnt300.FieldByName('CIUDID').AsString;
   cZipId := DMALM.cdsCnt300.FieldByName('ZIPID').AsString;
   cDireec := DMALM.cdsCnt300.FieldByName('DIRECC').AsString;
   cRazSoc := DMALM.cdsCnt300.FieldByName('RAZSOC').AsString;
   cDesRuc := DMALM.cdsCnt300.FieldByName('DESRUC').AsString;
   cDocIde := DMALM.cdsCnt300.FieldByName('DOCIDE').AsString;
   cTraNom := DMALM.cdsCnt300.FieldByName('TRANNOM').AsString;
   cTraRuc := DMALM.cdsCnt300.FieldByName('TRANRUC').AsString;
   cTraPla := DMALM.cdsCnt300.FieldByName('TRANPLA').AsString;
   cObsGui := DMALM.cdsCnt300.FieldByName('OBSGUIA').AsString;
End;

Function TFGuiaRemisionALM.InsertaDetalleALM: Boolean;
Var
   xSQL: String;
   iCont: Integer;
Begin
   Result := False;
// Inicio HPC_201803_ALM
// Se adiciona información de precio de ventas
   xSQL := 'Select A.CIAID, A.SERGUIA, A.NUMGUIA, A.ITEM, A.ARTID, A.UNMIDG, A.CANTIDAD, '
      + 'A.ACFSERIE, A.MARCA, A.MODELO, A.CODBAR, A.ORDEN, A.ARTDES, TO_CHAR(C.PREVEN,''9999999.999'') PREVEN, '
      + 'TO_CHAR((A.CANTIDAD * C.PREVEN),''9999999.999'') TOTAL, TO_CHAR(C.LPREBASGMO,''9999999.999'') LPREBASGMO, TO_CHAR((A.CANTIDAD * C.LPREBASGMO),''9999999.999'') TOTALCOS '
      + 'from LOG_GUI_DET A, (SELECT CIAID,ARTID,TLISTAID,PREVEN,LPREBASGMO FROM FAC201 WHERE CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' AND TLISTAID=''LNO'') C '
      + 'Where A.CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
      + 'and A.SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
      + 'and A.NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + ''' '
      + 'AND A.CIAID = C.CIAID(+) AND A.ARTID = C.ARTID(+) ' ;
   DMALM.cdsCnt301.Close;
   DMALM.cdsCnt301.DataRequest(xSQL);
   DMALM.cdsCnt301.Open;
// Fin HPC_201803_ALM

   xSQL := 'SELECT A.*, B.ACFSERIE, B.MARCA, B.MODELO, B.CODBAR, B.ITEM '
      + 'FROM LOG315 A, LOG332 B '
      + 'WHERE A.CIAID =''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
      + 'AND A.LOCID =''' + DMALM.cdsCnt300.FieldByName('LOCID').AsString + ''' '
      + 'AND A.TINID =''' + DMALM.cdsCnt300.FieldByName('TINID').AsString + ''' '
      + 'AND A.ALMID =''' + DMALM.cdsCnt300.FieldByName('ALMID').AsString + ''' '
      + 'AND A.TDAID =''' + DMALM.cdsCnt300.FieldByName('TDAID').AsString + ''' '
      + 'AND A.NISATIP=''' + DMALM.cdsCnt300.FieldByName('NISATIP').AsString + ''' '
      + 'AND A.NISAID=''' + DMALM.cdsCnt300.FieldByName('NISAID').AsString + ''' '
      + 'and A.CIAID=B.CIAID(+) and A.ALMID=B.ALMID(+) AND A.TINID=B.TINID(+) '
      + 'and A.TDAID=B.TDAID2(+) and A.NISAID=B.NFAC(+) AND A.ARTID=B.ARTID(+) '
      + 'ORDER BY A.KDXID, B.ITEM, A.ARTID';
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(xSQL);
   DMALM.cdsKDX.Open;

   iCont := 0;
   DMALM.cdsKDX.first;
   While Not DMALM.cdsKDX.Eof Do
   Begin
      iCont := iCont + 1;
      DMALM.cdsCnt301.Insert;
      DMALM.cdsCnt301.FieldByName('CIAID').AsString := DMALM.cdsCnt300.FieldByName('CIAID').AsString;
      DMALM.cdsCnt301.FieldByName('SERGUIA').AsString := DMALM.cdsCnt300.FieldByName('SERGUIA').AsString;
      DMALM.cdsCnt301.FieldByName('NUMGUIA').AsString := DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString;
      DMALM.cdsCnt301.FieldByName('ITEM').AsString := DMALM.StrZero(IntToStr(iCont), 3);
      DMALM.cdsCnt301.FieldByName('ARTID').AsString := DMALM.cdsKDX.FieldByName('ARTID').AsString;
      DMALM.cdsCnt301.FieldByName('UNMIDG').AsString := DMALM.cdsKDX.FieldByName('UNMIDG').AsString;
      DMALM.cdsCnt301.FieldByName('CANTIDAD').AsString := DMALM.cdsKDX.FieldByName('KDXCNTG').AsString;
      DMALM.cdsCnt301.FieldByName('ACFSERIE').AsString := DMALM.cdsKDX.FieldByName('ACFSERIE').AsString;
      DMALM.cdsCnt301.FieldByName('MARCA').AsString := DMALM.cdsKDX.FieldByName('MARCA').AsString;
      DMALM.cdsCnt301.FieldByName('MODELO').AsString := DMALM.cdsKDX.FieldByName('MODELO').AsString;
      DMALM.cdsCnt301.FieldByName('CODBAR').AsString := DMALM.cdsKDX.FieldByName('CODBAR').AsString;
      DMALM.cdsCnt301.FieldByName('ARTDES').AsString := DMALM.cdsKDX.FieldByName('ARTDES').AsString;
      DMALM.cdsCnt301.FieldByName('ORDEN').AsString := DMALM.cdsKDX.FieldByName('ITEM').AsString;
      DMALM.cdsCnt301.Post;
      DMALM.cdsKDX.Next;

      If (iCont >= 25) Or (DMALM.cdsKDX.Eof) Then
      Begin
         If DMALM.cdsCnt301.ApplyUpdates(0) > 0 Then
         Begin
            ShowMessage('Error al Grabar Detalle');
            Close;
         End;

         If Not DMALM.cdsKDX.Eof Then
         Begin
            iCont := 0;
            InsertaGuiaRemisionALM;
            AsignaValoresGuia;

            If Not GrabaGuiaRemision Then
            Begin
               ShowMessage('Error al Grabar Número de Guía de Remisión. Intente Nuevamente.');
               Close;
            End;
// Inicio HPC_201803_ALM
// Se adiciona información de precio de ventas
            xSQL := 'Select A.CIAID, A.SERGUIA, A.NUMGUIA, A.ITEM, A.ARTID, A.UNMIDG, A.CANTIDAD, '
               + 'A.ACFSERIE, A.MARCA, A.MODELO, A.CODBAR, A.ORDEN, A.ARTDES, TO_CHAR(C.PREVEN,''9999999.999'') PREVEN, '
               + 'TO_CHAR((A.CANTIDAD * C.PREVEN),''9999999.999'') TOTAL, TO_CHAR(C.LPREBASGMO,''9999999.999'') LPREBASGMO, TO_CHAR((A.CANTIDAD * C.LPREBASGMO),''9999999.999'') TOTALCOS  '
               + 'from LOG_GUI_DET A, (SELECT CIAID,ARTID,TLISTAID,PREVEN,LPREBASGMO FROM FAC201 WHERE CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' AND TLISTAID=''LNO'') C '
               + 'Where A.CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
               + 'and A.SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
               + 'and A.NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + ''' '
               + 'AND A.CIAID = C.CIAID(+) AND A.ARTID = C.ARTID(+) ' ;
            DMALM.cdsCnt301.Close;
            DMALM.cdsCnt301.DataRequest(xSQL);
            DMALM.cdsCnt301.Open;
// Fin HPC_201803_ALM
         End;
      End;
   End;
   Result := True;
End;

Function TFGuiaRemisionALM.InsertaDetalleAF: Boolean;
Var
   xSQL: String;
   iCont: Integer;
Begin
   Result := False;
   xSQL := 'Select CIAID, SERGUIA, NUMGUIA, ITEM, ARTID, UNMIDG, CANTIDAD, '
      + 'ACFSERIE, MARCA, MODELO, CODBAR, ORDEN ,ARTDES '
      + 'from LOG_GUI_DET '
      + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
      + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
      + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
   DMALM.cdsCnt301.Close;
   DMALM.cdsCnt301.DataRequest(xSQL);
   DMALM.cdsCnt301.Open;

   xSQL := 'SELECT ARTCODBAR ARTID, ACFSERIE, ACFMARCA MARCA, ACFMODELO MODELO, ARTCODBAR CODBAR, '
      + 'ACFDES ARTDES, ''UND'' UNMIDG, 1 KDXCNTG, ROWNUM ITEM '
      + 'FROM ACF321 A '
      + 'WHERE A.NUMDOC =''' + DMALM.cdsNIS.FieldByName('NUMDOC').AsString + ''' '
      + 'ORDER BY ROWNUM';
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(xSQL);
   DMALM.cdsKDX.Open;

   iCont := 0;
   DMALM.cdsKDX.first;
   While Not DMALM.cdsKDX.Eof Do
   Begin
      iCont := iCont + 1;
      DMALM.cdsCnt301.Insert;
      DMALM.cdsCnt301.FieldByName('CIAID').AsString := DMALM.cdsCnt300.FieldByName('CIAID').AsString;
      DMALM.cdsCnt301.FieldByName('SERGUIA').AsString := DMALM.cdsCnt300.FieldByName('SERGUIA').AsString;
      DMALM.cdsCnt301.FieldByName('NUMGUIA').AsString := DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString;
      DMALM.cdsCnt301.FieldByName('ITEM').AsString := DMALM.StrZero(IntToStr(iCont), 3);
      DMALM.cdsCnt301.FieldByName('ARTID').AsString := DMALM.cdsKDX.FieldByName('ARTID').AsString;
      DMALM.cdsCnt301.FieldByName('UNMIDG').AsString := DMALM.cdsKDX.FieldByName('UNMIDG').AsString;
      DMALM.cdsCnt301.FieldByName('CANTIDAD').AsString := DMALM.cdsKDX.FieldByName('KDXCNTG').AsString;
      DMALM.cdsCnt301.FieldByName('ACFSERIE').AsString := DMALM.cdsKDX.FieldByName('ACFSERIE').AsString;
      DMALM.cdsCnt301.FieldByName('MARCA').AsString := DMALM.cdsKDX.FieldByName('MARCA').AsString;
      DMALM.cdsCnt301.FieldByName('MODELO').AsString := DMALM.cdsKDX.FieldByName('MODELO').AsString;
      DMALM.cdsCnt301.FieldByName('CODBAR').AsString := DMALM.cdsKDX.FieldByName('CODBAR').AsString;
      DMALM.cdsCnt301.FieldByName('ARTDES').AsString := DMALM.cdsKDX.FieldByName('ARTDES').AsString;
      DMALM.cdsCnt301.FieldByName('ORDEN').AsString := DMALM.cdsKDX.FieldByName('ITEM').AsString;
      DMALM.cdsCnt301.Post;
      DMALM.cdsKDX.Next;

      If (iCont >= 25) Or (DMALM.cdsKDX.Eof) Then
      Begin
         If DMALM.cdsCnt301.ApplyUpdates(0) > 0 Then
         Begin
            ShowMessage('Error al Grabar Detalle');
            Close;
         End;

         If Not DMALM.cdsKDX.Eof Then
         Begin
            iCont := 0;
            InsertaGuiaRemisionAF;
            AsignaValoresGuia;

            If Not GrabaGuiaRemision Then
            Begin
               ShowMessage('Error al Grabar Número de Guía de Remisión. Intente Nuevamente.');
               Close;
            End;

            xSQL := 'Select CIAID, SERGUIA, NUMGUIA, ITEM, ARTID, UNMIDG, CANTIDAD, '
               + 'ACFSERIE, MARCA, MODELO, CODBAR, ORDEN, ARTDES '
               + 'from LOG_GUI_DET '
               + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
               + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
               + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
            DMALM.cdsCnt301.Close;
            DMALM.cdsCnt301.DataRequest(xSQL);
            DMALM.cdsCnt301.Open;
         End;
      End;
   End;
   Result := True;
End;

Function TFGuiaRemisionALM.InsertaDetalleRU: Boolean;
Var
   xSQL: String;
   iCont: Integer;
Begin
   Result := False;
   xSQL := 'Select CIAID, SERGUIA, NUMGUIA, ITEM, ARTID, UNMIDG, CANTIDAD, '
      + 'ACFSERIE, MARCA, MODELO, CODBAR, ORDEN, ARTDES '
      + 'from LOG_GUI_DET '
      + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
      + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
      + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
   DMALM.cdsCnt301.Close;
   DMALM.cdsCnt301.DataRequest(xSQL);
   DMALM.cdsCnt301.Open;

   iCont := 0;
   DMALM.cdsKDX.first;
   While Not DMALM.cdsKDX.Eof Do
   Begin
      iCont := iCont + 1;
      DMALM.cdsCnt301.Insert;
      DMALM.cdsCnt301.FieldByName('CIAID').AsString := DMALM.cdsCnt300.FieldByName('CIAID').AsString;
      DMALM.cdsCnt301.FieldByName('SERGUIA').AsString := DMALM.cdsCnt300.FieldByName('SERGUIA').AsString;
      DMALM.cdsCnt301.FieldByName('NUMGUIA').AsString := DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString;
      DMALM.cdsCnt301.FieldByName('ITEM').AsString := DMALM.StrZero(IntToStr(iCont), 3);
      DMALM.cdsCnt301.FieldByName('ARTID').AsString := DMALM.cdsKDX.FieldByName('ARTID').AsString;
      DMALM.cdsCnt301.FieldByName('UNMIDG').AsString := DMALM.cdsKDX.FieldByName('UNMIDG').AsString;
      DMALM.cdsCnt301.FieldByName('CANTIDAD').AsString := DMALM.cdsKDX.FieldByName('KDXCNTG').AsString;
      DMALM.cdsCnt301.FieldByName('ARTDES').AsString := DMALM.cdsKDX.FieldByName('ARTDES').AsString;
      DMALM.cdsCnt301.FieldByName('ORDEN').AsString := DMALM.cdsKDX.FieldByName('ITEM').AsString;
      DMALM.cdsCnt301.Post;
      DMALM.cdsKDX.Next;

      If (iCont >= 25) Or (DMALM.cdsKDX.Eof) Then
      Begin
         If DMALM.cdsCnt301.ApplyUpdates(0) > 0 Then
         Begin
            ShowMessage('Error al Grabar Detalle');
            Close;
         End;

         If Not DMALM.cdsKDX.Eof Then
         Begin
            iCont := 0;
            InsertaGuiaRemisionAF;
            AsignaValoresGuia;

            If Not GrabaGuiaRemision Then
            Begin
               ShowMessage('Error al Grabar Número de Guía de Remisión. Intente Nuevamente.');
               Close;
            End;

            xSQL := 'Select CIAID, SERGUIA, NUMGUIA, ITEM, ARTID, UNMIDG, CANTIDAD, '
               + 'ACFSERIE, MARCA, MODELO, CODBAR, ORDEN, ARTDES '
               + 'from LOG_GUI_DET '
               + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
               + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
               + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
            DMALM.cdsCnt301.Close;
            DMALM.cdsCnt301.DataRequest(xSQL);
            DMALM.cdsCnt301.Open;
         End;
      End;
   End;
   Result := True;
End;

Procedure TFGuiaRemisionALM.dbgGuiaRowChanged(Sender: TObject);
Var
   xSQL: String;
Begin
   fg_RecuperaDetGuia(DMALM.cdsCnt300.FieldByName('CIAID').AsString,
      DMALM.cdsCnt300.FieldByName('SERGUIA').AsString,
      DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString);
End;

Procedure TFGuiaRemisionALM.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMALM.cdsCnt300.IndexFieldNames := '';
   DMALM.cdsCnt301.IndexFieldNames := '';
End;

Procedure TFGuiaRemisionALM.dblcCIAExit(Sender: TObject);
Begin
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.Text), 'CIADES');
End;

Procedure TFGuiaRemisionALM.Z2bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Function TFGuiaRemisionALM.ExisteGuiaRemision(cCia, cSer, cNum: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT NUMGUIA FROM LOG_GUI_REM '
      + 'Where CIAID=''' + cCia + ''' and SERGUIA=''' + cSer + ''' and NUMGUIA=''' + cNum + '''';

   DMALM.cdsTGE.Close;
   DMALM.cdsTGE.DataRequest(xSQL);
   DMALM.cdsTGE.Open;

   If DMALM.cdsTGE.RecordCount <= 0 Then
      Result := False
   Else
      Result := True;
End;

Procedure TFGuiaRemisionALM.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFGuiaRemisionALM.bbtnExpClick(Sender: TObject);
Var
   xSQL: String;
   xLinea: String;
Begin
   If Not sdGraba.Execute Then Exit;

   xSQL := 'SELECT LOG315.*, LOG315.KDXID ITEM FROM LOG315 '
      + 'WHERE CIAID =''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
      + 'AND LOCID =''' + DMALM.cdsCnt300.FieldByName('LOCID').AsString + ''' '
      + 'AND TINID =''' + DMALM.cdsCnt300.FieldByName('TINID').AsString + ''' '
      + 'AND ALMID =''' + DMALM.cdsCnt300.FieldByName('ALMID').AsString + ''' '
      + 'AND TDAID =''' + DMALM.cdsCnt300.FieldByName('TDAID').AsString + ''' '
      + 'AND NISATIP=''' + DMALM.cdsCnt300.FieldByName('NISATIP').AsString + ''' '
      + 'AND NISAID=''' + DMALM.cdsCnt300.FieldByName('NISAID').AsString + ''' '
      + 'ORDER BY KDXID';
   DMALM.cdsKDX.Close;
   DMALM.cdsKDX.DataRequest(xSQL);
   DMALM.cdsKDX.Open;

   DMALM.cdsKDX.First;

   scFile.Lines.Clear;

   xLinea := 'CIA|TIN|N.SALIDA|ITEM|ARTICULO|DESCRIPCION|U.MED|CANTIDAD';
   scFile.Lines.Add(xLinea);
   While Not DMALM.cdsKDX.Eof Do
   Begin
      xLinea := '';
      xLinea := xLinea + DMALM.cdsKDX.FieldByName('CIAID').AsString + '|';
      xLinea := xLinea + DMALM.cdsKDX.FieldByName('TINID').AsString + '|';
      xLinea := xLinea + DMALM.cdsKDX.FieldByName('NISAID').AsString + '|';
      xLinea := xLinea + DMALM.cdsKDX.FieldByName('KDXID').AsString + '|';
      xLinea := xLinea + DMALM.cdsKDX.FieldByName('ARTID').AsString + '|';
      xLinea := xLinea + DMALM.cdsKDX.FieldByName('ARTDES').AsString + '|';
      xLinea := xLinea + DMALM.cdsKDX.FieldByName('UNMIDG').AsString + '|';
      xLinea := xLinea + StringReplace(FloattoStrF(DMALM.cdsKDX.FieldByName('KDXCNTG').AsFloat, ffNumber, 12, 2), ',', '', [rfreplaceall]) + '|';
      scFile.Lines.Add(xLinea);
      DMALM.cdsKDX.Next;
   End;

   scFile.Lines.SaveToFile(sdGraba.FileName);

   ShowMessage('Archivo Grabado');
End;

Procedure TFGuiaRemisionALM.bbtnNumeroClick(Sender: TObject);
Var
   xSQL: String;
Begin
   Try
      fNumOk := False;
      FGuiaNum := TFGuiaNum.Create(Self);
      FGuiaNum.ShowModal;
   Finally
      If fNumOk Then
      Begin
         cNumGuiaN := FGuiaNum.dbeNumGuia.Text;
         If Cambia_Numero Then
         Begin
            Try
               DMALM.ControlTran(8, Nil, ''); //COMMIT
               xSQL := 'Select * from LOG_GUI_REM '
                  + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
                  + 'and TINID=''' + DMALM.cdsCnt300.FieldByName('TINID').AsString + ''' '
                  + 'and NISAID=''' + DMALM.cdsCnt300.FieldByName('NISAID').AsString + ''' '
                  + 'and ESTADO<>''ANULADO'' '
                  + 'Order by SERGUIA, NUMGUIA';
               DMALM.cdsCnt300.Close;
               DMALM.cdsCnt300.DataRequest(xSQL);
               DMALM.cdsCnt300.Open;
// Inicio HPC_201803_ALM
// Se modifica debido a la implementación de Guia de Remisión para Fondo Editorial
               xSQL := 'Select A.CIAID, A.SERGUIA, A.NUMGUIA, A.ITEM, A.ARTID, A.UNMIDG, A.CANTIDAD,CASE WHEN CODBAR IS NULL THEN A.CANTIDAD ELSE 1 END CANTIDAD_REP, C.ARTDES, '
                  + 'A.ACFSERIE, A.MARCA, A.MODELO, A.CODBAR, A.ORDEN, A.ARTDES, '''' PREVEN, '''' TOTAL '
                  + 'From LOG_GUI_DET A, LOG_GUI_REM B, TGE205 C '
                  + 'Where A.CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
                  + 'and A.SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
                  + 'and A.NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + ''' '
                  + 'and A.CIAID=B.CIAID AND A.SERGUIA=B.SERGUIA AND A.NUMGUIA=B.NUMGUIA '
                  + 'and A.CIAID=C.CIAID AND B.TINID=C.TINID AND A.ARTID=C.ARTID';
               DMALM.cdsCnt301.Close;
               DMALM.cdsCnt301.DataRequest(xSQL);
               DMALM.cdsCnt301.Open;
// Fin HPC_201803_ALM
               Z2bbtnGraba.Enabled := False;
               Z2bbtnAceptar.Enabled := False;
               Z2bbtnPrint.Enabled := True;
               bbtnAnular.Enabled := True;
               bbtnExp.Enabled := True;

               ShowMessage('Guia Aceptada');
            Except
               DMALM.ControlTran(1, Nil, ''); //ROLLBACK
            End
         End
         Else
         Begin
            DMALM.ControlTran(1, Nil, ''); //ROLLBACK
         End;
      End;
      FGuiaNum.Free;
   End;
End;

Function TFGuiaRemisionALM.Cambia_Numero: Boolean;
Var
   xSQL: String;
Begin
   Result := False;

   If ExisteGuiaRemision(DMALM.cdsCnt300.FieldByName('CIAID').AsString,
      DMALM.cdsCnt300.FieldByName('SERGUIA').AsString,
      cNumGuiaN) Then
   Begin
      ShowMessage('Numero de Guia ya fue Usado');
      Exit;
   End;

   ErrorCount := 0;
   DMALM.DCOM1.AppServer.IniciaTransaccion;

   xSQL := 'Update LOG_GUI_DET SET NUMGUIA=''' + cNumGuiaN + ''' '
      + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
      + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
      + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
   DMALM.cdsTGE.Close;
   DMALM.cdsTGE.DataRequest(xSQL);
   DMALM.cdsTGE.Execute;

   xSQL := 'Update LOG_GUI_REM SET NUMGUIA=''' + cNumGuiaN + ''', FECREGGUIA=SYSDATE '
      + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
      + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
      + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
   DMALM.cdsTGE.Close;
   DMALM.cdsTGE.DataRequest(xSQL);
   Try
      DMALM.cdsTGE.Execute;
   Except
      ShowMessage('Numero de Guia ya fue Usado');
      Exit;
   End;

   Result := True;
End;

Procedure TFGuiaRemisionALM.bbtnAnularClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If Not Question(Caption, 'Este Proceso: ' + #13 + #13 +
      'Anula la Guia de Remisión ' + #13 + #13 + #13 + 'Desea Continuar ') Then
   Begin
      Exit;
   End;

   DMALM.cdsCnt300.First;
   While Not DMALM.cdsCnt300.Eof Do
   Begin
      DMALM.cdsCnt300.Edit;
      DMALM.cdsCnt300.FieldByName('ESTADO').AsString := 'ANULADO';
      DMALM.cdsCnt300.FieldByName('FECANUGUIA').AsDateTime := Date + SysUtils.Time;
      DMALM.cdsPost(DMALM.cdsCnt300);
      DMALM.cdsCnt300.Post;

      xSQL := 'Select * from LOG_GUI_REM '
         + 'Where CIAID=''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
         + 'and SERGUIA=''' + DMALM.cdsCnt300.FieldByName('SERGUIA').AsString + ''' '
         + 'and NUMGUIA=''' + DMALM.cdsCnt300.FieldByName('NUMGUIA').AsString + '''';
      DMALM.cdsCnt300.DataRequest(xSQL);

      If DMALM.cdsCnt300.ApplyUpdates(0) > 0 Then
         ShowMessage('Error al Grabar');

      DMALM.cdsCnt300.Next;
   End;

   If (xsOrigen = 'AF') Or (xsOrigen = 'RU') Then // si Origen es Activo Fijo
   Begin
      xSQL := 'Select * from LOG_GUI_REM '
         + 'Where CIAID=''' + DMALM.cdsMovCNT.FieldByName('CIAID').AsString + ''' '
         + 'and NISAID=''' + DMALM.cdsMovCNT.FieldByName('NISAID').AsString + ''' '
         + 'and ESTADO=''ANULADO'' '
         + 'Order by SERGUIA, NUMGUIA';
   End
   Else
      If xsOrigen = 'NS' Then
      Begin
         xSQL := 'Select * from LOG_GUI_REM '
            + 'Where CIAID=''' + DMALM.cdsMovCNT.FieldByName('CIAID').AsString + ''' '
            + 'and TINID=''' + DMALM.cdsMovCNT.FieldByName('TINID').AsString + ''' '
            + 'and NISAID=''' + DMALM.cdsMovCNT.FieldByName('NISAID').AsString + ''' '
            + 'and ESTADO=''ANULADO'' '
            + 'Order by SERGUIA, NUMGUIA';
      End;
   DMALM.cdsCnt300.Close;
   DMALM.cdsCnt300.DataRequest(xSQL);
   DMALM.cdsCnt300.Open;

   Z2bbtnGraba.Enabled := False;
   Z2bbtnAceptar.Enabled := False;
   Z2bbtnPrint.Enabled := False;
   bbtnAnular.Enabled := False;
   bbtnExp.Enabled := False;
End;

Procedure TFGuiaRemisionALM.FormActivate(Sender: TObject);
Begin
   If DMALM.wModoGuia = 'A' Then
      dbeRazSoc.SetFocus;

End;

Procedure TFGuiaRemisionALM.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin
   If xsCompania = '' Then
   Begin
      xsCompania := DMALM.cdsMovCNT.FieldByName('CIAID').AsString;
   End;

   If xsOrigen = 'AF' Then // si Origen es Activo Fijo
   Begin
      lblDoc.Caption := 'Traslado Activo';
      dbeTinId.Visible := False;
      lblTI.Visible := False;
   End
   Else
      If xsOrigen = 'NS' Then
      Begin
         lblDoc.Caption := 'Nota de Salida';
         dbeTinId.Visible := True;
         lblTI.Visible := True;
      End
      Else
         If xsOrigen = 'RU' Then
         Begin
            lblDoc.Caption := 'Req Usuario';
            dbeTinId.Visible := True;
            lblTI.Visible := True;

         End;

   If Not AperturaTablas Then Exit;

   DMALM.cdsCnt300.IndexFieldNames := 'SERGUIA;NUMGUIA';
   DMALM.cdsCnt301.IndexFieldNames := 'ITEM';

   If DMALM.wModoGuia = 'A' Then
   Begin
      pnlCab.Enabled := True;
      Z2bbtnOK.Visible := True;
      Z2bbtnGraba.Enabled := True;
      Z2bbtnAceptar.Enabled := False;
      Z2bbtnPrint.Enabled := False;
      bbtnAnular.Enabled := False;
      bbtnExp.Enabled := False;
      bbtnNumero.Enabled := False;

      xSQL := 'Select * from LOG_GUI_REM '
         + 'Where CIAID=''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' '
         + 'and SERGUIA=''XYZ'' and NUMGUIA=''XYZ''';
      DMALM.cdsCnt300.Close;
      DMALM.cdsCnt300.DataRequest(xSQL);
      DMALM.cdsCnt300.Open;

      dbgDetalle.Visible := False;
      dbgDReqs.Visible := True;

      If xsOrigen = 'AF' Then
      Begin
         InsertaGuiaRemisionAF;
         dbeCC.Text := DMALM.DisplayDescrip('prvSQL', 'TGE203', 'CCOSMOV,CCOSDES', 'CCOSID=' + quotedStr(dblcdCC.text), 'CCOSDES');
         dbeCIA.text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.text), 'CIADES');
         xSQL := 'SELECT LPAD(ROWNUM,3,''0'') KDXID, LPAD(ROWNUM,3,''0'') ITEM, ARTCODBAR ARTID, ACFDES ARTDES, ''UND'' UNMIDG, '
            + '1 KDXCNTG, A.* '
            + 'FROM ACF321 A '
            + 'WHERE NUMDOC =''' + DMALM.cdsNIS.FieldByName('NUMDOC').AsString + ''' '
            + 'ORDER BY ROWNUM';
         DMALM.cdsKDX.Close;
         DMALM.cdsKDX.DataRequest(xSQL);
         DMALM.cdsKDX.Open;
      End
      Else
         If xsOrigen = 'RU' Then
         Begin
            InsertaGuiaRemisionRU;
            dbeCC.Text := DMALM.DisplayDescrip('prvSQL', 'TGE203', 'CCOSMOV,CCOSDES', 'CCOSID=' + quotedStr(dblcdCC.text), 'CCOSDES');
            dbeCIA.text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.text), 'CIADES');

            xSQL := 'SELECT A.ARTID ARTID,NULL ACFSERIE, NULL MARCA, NULL MODELO, NULL CODBAR, '
               + 'A.DURQOBS ARTDES, A.UNMIDG UNMIDG, A.DURQCNSG KDXCNTG, LPAD(ROWNUM,3,' + QuotedStr('0') + ') ITEM '

            + ' FROM LOG307 A '
               + ' WHERE A.CIAID =' + QuotedStr(DMALM.cdsNIS.FieldByName('CIAID').AsString)
               + ' AND A.LOCID = ' + QuotedStr(DMALM.cdsNIS.FieldByName('LOCID').AsString)
               + ' AND A.CCOSID = ' + QuotedStr(DMALM.cdsNIS.FieldByName('CCOSID').AsString)
               + ' AND A.URQID = ' + QuotedStr(DMALM.cdsNIS.FieldByName('URQID').AsString)
               + ' ORDER BY A.DURQID';
            DMALM.cdsKDX.Close;
            DMALM.cdsKDX.DataRequest(xSQL);
            DMALM.cdsKDX.Open;
         End
         Else
            If xsOrigen = 'NS' Then // si Origen es Nota de Salida
            Begin
               InsertaGuiaRemisionALM;
               dbeCC.Text := DMALM.DisplayDescrip('prvSQL', 'TGE203', 'CCOSMOV,CCOSDES', 'CCOSID=' + quotedStr(dblcdCC.text), 'CCOSDES');
               dbeCIA.text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.text), 'CIADES');

               xSQL := 'SELECT A.*, A.KDXID ITEM FROM LOG315 A '
                  + 'WHERE A.CIAID =''' + DMALM.cdsCnt300.FieldByName('CIAID').AsString + ''' '
                  + 'AND A.LOCID =''' + DMALM.cdsCnt300.FieldByName('LOCID').AsString + ''' '
                  + 'AND A.TINID =''' + DMALM.cdsCnt300.FieldByName('TINID').AsString + ''' '
                  + 'AND A.ALMID =''' + DMALM.cdsCnt300.FieldByName('ALMID').AsString + ''' '
                  + 'AND A.TDAID =''' + DMALM.cdsCnt300.FieldByName('TDAID').AsString + ''' '
                  + 'AND A.NISATIP=''' + DMALM.cdsCnt300.FieldByName('NISATIP').AsString + ''' '
                  + 'AND A.NISAID=''' + DMALM.cdsCnt300.FieldByName('NISAID').AsString + ''' '
                  + 'ORDER BY A.KDXID';
               DMALM.cdsKDX.Close;
               DMALM.cdsKDX.DataRequest(xSQL);
               DMALM.cdsKDX.Open;
            End;
   End
   Else
   Begin

      If DMALM.cdsMovCNT.FieldByName('ESTADO').AsString = 'ANULADO' Then
         xSQL := 'Select * from LOG_GUI_REM '
            + 'Where CIAID=''' + DMALM.cdsMovCNT.FieldByName('CIAID').AsString + ''' '
            + 'and SERGUIA=''' + DMALM.cdsMovCNT.FieldByName('SERGUIA').AsString + ''' '
            + 'and NUMGUIA=''' + DMALM.cdsMovCNT.FieldByName('NUMGUIA').AsString + ''' '
            + 'Order by SERGUIA, NUMGUIA'
      Else
      Begin
         If xsOrigen = 'AF' Then
         Begin
            xSQL := 'Select * from LOG_GUI_REM '
               + 'Where CIAID=''' + DMALM.cdsMovCNT.FieldByName('CIAID').AsString + ''' '
               + 'and NISAID=''' + DMALM.cdsMovCNT.FieldByName('NISAID').AsString + ''' '
               + 'and ESTADO=''' + DMALM.cdsMovCNT.FieldByName('ESTADO').AsString + ''' '
               + 'Order by SERGUIA, NUMGUIA';
         End
         Else
            If xsOrigen = 'NS' Then
            Begin
               xSQL := 'Select * from LOG_GUI_REM '
                  + 'Where CIAID=''' + DMALM.cdsMovCNT.FieldByName('CIAID').AsString + ''' '
                  + 'and TINID=''' + DMALM.cdsMovCNT.FieldByName('TINID').AsString + ''' '
                  + 'and NISAID=''' + DMALM.cdsMovCNT.FieldByName('NISAID').AsString + ''' '
                  + 'and ESTADO=''' + DMALM.cdsMovCNT.FieldByName('ESTADO').AsString + ''' '
                  + 'Order by SERGUIA, NUMGUIA';
            End
            Else
               If xsOrigen = 'RU' Then
               Begin
                  xSQL := 'Select * from LOG_GUI_REM '
                     + 'Where CIAID=''' + DMALM.cdsMovCNT.FieldByName('CIAID').AsString + ''' '
                     + 'and NISAID=''' + DMALM.cdsMovCNT.FieldByName('NISAID').AsString + ''' '
                     + 'and ESTADO=''' + DMALM.cdsMovCNT.FieldByName('ESTADO').AsString + ''' '
                     + 'Order by SERGUIA, NUMGUIA';

               End;
         fg_RecuperaDetGuia(DMALM.cdsMovCNT.FieldByName('CIAID').AsString,
            DMALM.cdsMovCNT.FieldByName('SERGUIA').AsString,
            DMALM.cdsMovCNT.FieldByName('NUMGUIA').AsString);

      End;

      DMALM.cdsCnt300.Close;
      DMALM.cdsCnt300.DataRequest(xSQL);
      DMALM.cdsCnt300.Open;

      dblcCIAExit(Self);
      dblcDepartaExit(Self);
      dblcdProvincExit(Self);
      dblcdDistritoExit(Self);
      dblcdCCExit(Self);

      Z2bbtnOK.Visible := False;
      Z2bbtnGraba.Enabled := True;
      bbtnAnular.Enabled := True;
      bbtnExp.Enabled := False;
      bbtnNumero.Enabled := False;
      If DMALM.cdsCnt300.FieldByName('ESTADO').AsString = 'INICIAL' Then
      Begin
         pnlCab.Enabled := True;
         Z2bbtnAceptar.Enabled := True;
         Z2bbtnPrint.Enabled := False;
      End;
      If DMALM.cdsCnt300.FieldByName('ESTADO').AsString = 'ACEPTADO' Then
      Begin
         pnlCab.Enabled := False;
         Z2bbtnGraba.Enabled := False;
         Z2bbtnAceptar.Enabled := False;
         Z2bbtnPrint.Enabled := True;
         bbtnAnular.Enabled := True;
         bbtnExp.Enabled := True;
         bbtnNumero.Enabled := True;
      End;
      If DMALM.cdsCnt300.FieldByName('ESTADO').AsString = 'ANULADO' Then
      Begin
         pnlCab.Enabled := False;
         Z2bbtnAceptar.Enabled := False;
         Z2bbtnPrint.Enabled := False;
         Z2bbtnGraba.Enabled := False;
      End;

      dbgDetalle.Visible := True;
      dbgDReqs.Visible := False;
   End;
   fg_InicializaPanel;
End;

Procedure TFGuiaRemisionALM.fg_InicializaPanel;
Begin
   edtDetItem.Enabled := False;
   edtDetArticulo.Enabled := False;
   dblcDetUnidMedida.Enabled := False;
   edtDetCantidad.Enabled := False;
   pnlArticulo.Left := 272;
   pnlArticulo.Top := 304;

   If DMALM.wModoGuia = 'A' Then
   Begin
      edtDetItem.DataSource := DMALM.dsKDX;
      edtDetItem.DataField := 'ITEM';
      edtDetArticulo.DataSource := DMALM.dsKDX;
      edtDetArticulo.DataField := 'ARTID';
      dblcDetUnidMedida.DataSource := DMALM.dsKDX;
      dblcDetUnidMedida.DataField := 'UNMIDG';
      edtDetCantidad.DataSource := DMALM.dsKDX;
      edtDetCantidad.DataField := 'KDXCNTG';
      edtDetDescripcion.DataSource := DMALM.dsKDX;
      edtDetDescripcion.DataField := 'ARTDES';
      edtDetDescripcion.Enabled := True;
   End
   Else
   Begin
      edtDetItem.DataSource := DMALM.dsCnt301;
      edtDetItem.DataField := 'ITEM';
      edtDetArticulo.DataSource := DMALM.dsCnt301;
      edtDetArticulo.DataField := 'ARTID';
      dblcDetUnidMedida.DataSource := DMALM.dsCnt301;
      dblcDetUnidMedida.DataField := 'UNMIDG';
      edtDetCantidad.DataField := '';
      edtDetCantidad.DataSource := DMALM.dsCnt301;
      edtDetCantidad.DataField := 'CANTIDAD';
      edtDetDescripcion.DataSource := DMALM.dsCnt301;
      edtDetDescripcion.DataField := 'ARTDES';
      If dbeEstado.Text <> 'INICIAL' Then
      Begin
         edtDetDescripcion.Enabled := False;
      End
      Else
      Begin
         edtDetDescripcion.Enabled := True;
      End;
   End;

End;

Procedure TFGuiaRemisionALM.btnDetCancelarClick(Sender: TObject);
Begin

   pnlArticulo.Visible := False;
   If DMALM.wModoGuia = 'M' Then
   Begin
      fg_RecuperaDetGuia(DMALM.cdsCnt301.FieldByName('CIAID').AsString,
         DMALM.cdsCnt301.FieldByName('SERGUIA').AsString,
         DMALM.cdsCnt301.FieldByName('NUMGUIA').AsString);
   End;
End;

Procedure TFGuiaRemisionALM.btnDetGrabarClick(Sender: TObject);
Var
   xsSql: String;
Begin
   pnlArticulo.Visible := False;
   If DMALM.wModoGuia = 'M' Then
   Begin
      xsSql := ' UPDATE LOG_GUI_DET SET ARTDES = ' + QuotedStr(DMALM.cdsCnt301.FieldByName('ARTDES').AsString) +
         ' WHERE CIAID = ' + QuotedStr(DMALM.cdsCnt301.FieldByName('CIAID').AsString) +
         ' AND SERGUIA = ' + QuotedStr(DMALM.cdsCnt301.FieldByName('SERGUIA').AsString) +
         ' AND NUMGUIA = ' + QuotedStr(DMALM.cdsCnt301.FieldByName('NUMGUIA').AsString) +
         ' AND ITEM = ' + QuotedStr(DMALM.cdsCnt301.FieldByName('ITEM').AsString);
      DMALM.DCOM1.AppServer.EjecutaSQL(xsSql);
      fg_RecuperaDetGuia(DMALM.cdsCnt301.FieldByName('CIAID').AsString,
         DMALM.cdsCnt301.FieldByName('SERGUIA').AsString,
         DMALM.cdsCnt301.FieldByName('NUMGUIA').AsString);

   End;
End;

Procedure TFGuiaRemisionALM.dbgDetalleDblClick(Sender: TObject);
Begin
   If (xsOrigen = 'RU') And (dbeEstado.Text <> 'ACEPTADO') And (dbeEstado.Text <> 'ANULADO') Then
   Begin
      fg_InicializaPanel;
      pnlArticulo.Visible := True;
      edtUnidMedida.Text := DMALM.displaydescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID = ' + QuotedStr(dblcDetUnidMedida.Text), 'UNMDES');
   End;
End;

Procedure TFGuiaRemisionALM.dbgDReqsDblClick(Sender: TObject);
Begin
   If (xsOrigen = 'RU') And (dbeEstado.Text <> 'ACEPTADO') And (dbeEstado.Text <> 'ANULADO') Then
   Begin
      fg_InicializaPanel;
      pnlArticulo.Visible := True;
      edtUnidMedida.Text := DMALM.displaydescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID = ' + QuotedStr(dblcDetUnidMedida.Text), 'UNMDES');
   End;
End;

Procedure TFGuiaRemisionALM.fg_RecuperaDetGuia(wgCompania, wgSerieGuia,
   wgNumGuia: String);
Var
   xsSql: String;
Begin
// Inicio HPC_201803_ALM
// Se modifica debido a la implementación de Guia Fondo Editorial
   xsSql := 'SELECT A.CIAID, A.SERGUIA, A.NUMGUIA, A.ITEM, A.ARTID, A.UNMIDG, A.CANTIDAD, A.ARTDES, '
      + ' A.ACFSERIE, A.MARCA, A.MODELO, A.CODBAR, A.ORDEN, '
      + ' CASE WHEN CODBAR IS NULL THEN A.CANTIDAD ELSE 1 END CANTIDAD_REP '
      + ' , TO_CHAR(D.PREVEN,''9999999.999'') PREVEN, TO_CHAR((A.CANTIDAD * D.PREVEN),''9999999.999'') TOTAL, TO_CHAR(D.LPREBASGMO,''9999999.999'') LPREBASGMO, TO_CHAR((A.CANTIDAD * D.LPREBASGMO),''9999999.999'') TOTALCOS '
      + ' FROM LOG_GUI_DET A, LOG_GUI_REM B , (SELECT CIAID,ARTID,TLISTAID,PREVEN,LPREBASGMO FROM FAC201 WHERE CIAID=' + QuotedStr(wgCompania) + ' AND TLISTAID=''LNO'') D '
      + ' WHERE A.CIAID=' + QuotedStr(wgCompania)
      + ' AND A.SERGUIA=' + QuotedStr(wgSerieGuia)
      + ' AND A.NUMGUIA=' + QuotedStr(wgNumGuia)
      + ' AND A.CIAID=B.CIAID AND A.SERGUIA=B.SERGUIA AND A.NUMGUIA=B.NUMGUIA '
      + ' AND A.CIAID = D.CIAID(+) AND A.ARTID = D.ARTID(+) ' ;
   DMALM.cdsCnt301.Close;
   DMALM.cdsCnt301.DataRequest(xsSql);
   DMALM.cdsCnt301.Open;
// Fin HPC_201803_ALM
End;

//INICIO HPC_201310_ALM
//TOMA EL ULTIMO NUMERO DE GUIA DE REMISION

Function TFGuiaRemisionALM.NumGuia(xCiaid: String): String;
Var
   xQql: String;
   xNumguiaSig: String;
Begin
   xQql := 'Select max(NUMGUIA) ultiGuia '
      + 'From  LOG_GUI_REM '
      + 'Where CIAID=''' + DMALM.cdsNIS.FieldByName('CIAID').AsString + ''' '
      + '  and ESTADO<>''ANULADO'' '
      + '  and substr(NUMGUIA,1,1) in (''I'') ';
   DMALM.cdsTMP.Close;
   DMALM.cdsTMP.DataRequest(xQql);
   DMALM.cdsTMP.Open;
// Inicio HPC_201803_ALM
// Se mejora el número de Guia
   if DMALM.cdsTMP.FieldByName('ultiGuia').IsNull then
   begin
      xNumguiaSig := 'I' + DMALM.StrZero('1', 6);
   end
   else
   begin
      xNumguiaSig := 'I' + DMALM.StrZero(IntToStr(StrtoInt(copy(DMALM.cdsTMP.FieldByname('ultiGuia').AsString, 2, 7)) + 1), 6);
   end;
// Fin HPC_201803_ALM
   Result := xNumguiaSig;
End;
//FINAL HPC_201310_ALM

//INICIO HPC_201310_ALM

Procedure TFGuiaRemisionALM.sbDisenoClick(Sender: TObject);
Begin
   cbDiseno.Checked := Not cbDiseno.Checked;
End;
//FINAL HPC_201310_ALM

End.

