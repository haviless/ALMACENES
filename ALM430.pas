Unit ALM430;

// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, wwdbdatetimepicker, Mask, wwdbedit, Wwdbdlg, wwdblook,
   ExtCtrls, Wwdbigrd, Grids, Wwdbgrid, db, DBCtrls, ppDB, ppBands, ppCtrls,
   ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppCache,
   ppDBPipe, GridControl, ppViewr, Variants, ppTypes;

Type
   TFAlmacen = Class(TForm)
      pnlDetalle: TPanel;
      dbgDetFac: TwwDBGrid;
      btnActReg: TwwIButton;
      pnlPie: TPanel;
      bbtnCalc: TBitBtn;
      Z2bbtnCancela: TBitBtn;
      pnlEstado: TPanel;
      lblDespacho: TLabel;
      lblActivo: TLabel;
      lblAcepta: TLabel;
      Label14: TLabel;
      lblReserva: TLabel;
      Z2bbtnOk: TBitBtn;
      lblInicial: TLabel;
      pnlRegistro: TPanel;
      Label5: TLabel;
      Label6: TLabel;
      lblUMAC: TLabel;
      lblUMAT: TLabel;
      stTitulo: TStaticText;
      dbeCantAc: TwwDBEdit;
      dbeCantAt: TwwDBEdit;
      bbtnRegOk: TBitBtn;
      bbtnRegCanc: TBitBtn;
      ppDBPipeline1: TppDBPipeline;
      bbtnOrdenDespacho: TBitBtn;
      Label1: TLabel;
      dblcdArticulo: TwwDBLookupComboDlg;
      edtArticulo: TEdit;
      edtPedido: TEdit;
      ppRepOrden: TppReport;
      ppHeaderBand3: TppHeaderBand;
      ppShape2: TppShape;
      pplblCia: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppLabel64: TppLabel;
      ppLine10: TppLine;
      ppLabel68: TppLabel;
      ppLabel77: TppLabel;
      pplblCopia2: TppLabel;
      ppLabel92: TppLabel;
      pplblZona: TppLabel;
      ppLabel94: TppLabel;
      pplbRucCia: TppLabel;
      pplblDirEmp: TppLabel;
      ppLabel101: TppLabel;
      ppLabel102: TppLabel;
      ppLabel103: TppLabel;
      pplblEmail: TppLabel;
      pplblPaginaWeb: TppLabel;
      pplblServ: TppLabel;
      ppDBText9: TppDBText;
      ppLabel65: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel66: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppLabel67: TppLabel;
      ppSystemVariable8: TppSystemVariable;
      ppLabel82: TppLabel;
      pplblUsuario: TppLabel;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      ppdbtClieId: TppDBText;
      ppLabel75: TppLabel;
      ppLabel78: TppLabel;
      pplblVendedor: TppLabel;
      pplblLugarEntrega: TppLabel;
      ppLabel86: TppLabel;
      ppLabel88: TppLabel;
      pplblCCom: TppLabel;
      ppLabel91: TppLabel;
      ppdbtDcto1: TppDBText;
      ppLabel61: TppLabel;
      pplblZonaD: TppLabel;
      ppdbtClieDes: TppDBText;
      ppdbtClieDir: TppDBText;
      ppLine1: TppLine;
      ppdbClieRUC: TppDBText;
      ppDetailBand3: TppDetailBand;
      ppdbtArtId: TppDBText;
      ppdbtArtDes: TppDBText;
      ppdbtUM: TppDBText;
      ppvCantEnt: TppVariable;
      ppvCantFrac: TppVariable;
      ppFooterBand3: TppFooterBand;
      ppLine11: TppLine;
      ppLabel108: TppLabel;
      pplbRuc2: TppLabel;
      ppLine12: TppLine;
      ppLabel110: TppLabel;
      ppLabel111: TppLabel;
      ppLabel112: TppLabel;
      pplblPorCia: TppLabel;
      ppLabel114: TppLabel;
      ppdbtClientePie: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      Procedure EstadoDeForma(xxModo: Integer; xMovEstado, xMovLibera: String);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnCalcClick(Sender: TObject);
      Procedure ppVTotaLCalc(Sender: TObject; Var Value: Variant);
      Procedure ppVIgvCalc(Sender: TObject; Var Value: Variant);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);

      Procedure Z2bbtnImpHojaClick(Sender: TObject);
      Procedure Z2bbtnCancelClick(Sender: TObject);
      Procedure Z2bbtnOkClick(Sender: TObject);
      Procedure dbgDetFacDblClick(Sender: TObject);
      Procedure bbtnRegCancClick(Sender: TObject);
      Procedure bbtnRegOkClick(Sender: TObject);
      Procedure dbeCantAtExit(Sender: TObject);
      Procedure bbtnOrdenDespachoClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure ppRepOrdenPreviewFormCreate(Sender: TObject);
      Procedure ppRepOrdenPrintingComplete(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
  { Private declarations }
      xxCantXAAnt: double;
      Procedure GeneraHojaTrabajo(xxCIa, xxLocal, xxClie, xxClieRuc, xxNPedido, xxOpen, xxVar, xxArt, xxFin: String; xxCantP, xxCantS: double; xxFlag: boolean);

   Public
  { Public declarations }
   End;

Var
   FAlmacen: TFAlmacen;
   xFlgImp: Boolean;

Implementation

Uses ALMDM1, oaIN4000;

{$R *.DFM}

Procedure TFAlmacen.EstadoDeForma(xxModo: Integer; xMovEstado, xMovLibera: String);
Begin
   pnlDetalle.Enabled := False;
   dbgDetFac.enabled := false;
   dbgDetFac.ReadOnly := True;
   btnActReg.Enabled := False;
   pnlPie.Refresh;
   pnlPie.Enabled := False;
   Z2bbtnCancela.Enabled := False;
   Z2bbtnOk.Enabled := False;
   lblActivo.Visible := False;
   lblAcepta.Visible := False;
   lblDespacho.Visible := False;
   lblReserva.Visible := False; //Reservado
   lblInicial.Visible := false;
   pnlRegistro.Visible := false;

   If xxModo = 1 Then // cuando va hacia la cabecera
   Begin // cuando el foco esta en el Detalle
      If (xMovEstado = 'P') Then // si ya esta grabado//08/08
      Begin
         pnlDetalle.Enabled := True;
         dbgDetFac.Enabled := true;
         dbgDetFac.ReadOnly := true;
         btnActReg.Enabled := false;
         pnlPie.Enabled := True;
         z2bbtnOk.Enabled := true;
         Z2bbtnCancela.Enabled := True;
         lblActivo.Visible := True;
      End;
      If (xMovEstado = 'D') Then
      Begin
         pnlDetalle.Enabled := True;
         dbgDetFac.Enabled := true;
         pnlPie.Enabled := True;
         Z2bbtnOk.Enabled := false;
         Z2bbtnCancela.Enabled := true;
         lblAcepta.Visible := false;
         lblInicial.Visible := false;
         lblDespacho.Visible := true;
      End;
   End;
   If DMALM.wModo = 'C' Then
   Begin // Si Entra Solo Para Consulta
      pnlDetalle.Enabled := False;
      dbgDetFac.ReadOnly := True;
      btnActReg.Enabled := False;

      pnlPie.Refresh;
      pnlPie.Enabled := False;
      If DMALM.wAdmin = 'G' Then
      Begin
         pnlPie.Enabled := True;
      End
      Else
      Begin
         Z2bbtnCancela.Enabled := False;
      End;
      pnlPie.Refresh;
   End;
End;

Procedure TFAlmacen.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   If DMALM.cdsMovFac.Active Then
      DMALM.cdsMovFac.Close;
   DMALM.cdsDetFac.CancelUpdates;
   DMALM.cdsDetFac.Close;
   DMALM.cdsQry4.Close;
   lblAcepta.Visible := False;
   lblInicial.Visible := false;
   Mtx4000.RefreshFilter;
   xxCantXAAnt := 0;
 //Close;
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   //FVariables.w_IN_Registro := False;
   Action := CAFree;
End;

Procedure TFAlmacen.bbtnCalcClick(Sender: TObject);
Begin
   WinExec('C:\windows\calc.exe', 1); // Executa Aplicación
End;

Procedure TFAlmacen.ppVTotaLCalc(Sender: TObject; Var Value: Variant);
Begin
   value := DMALM.cdsMovFac.fieldbyname('PEDTOTMO').Asfloat;
End;

Procedure TFAlmacen.ppVIgvCalc(Sender: TObject; Var Value: Variant);
Begin
   value := DMALM.FRound((DMALM.cdsMovFac.fieldbyname('PEDTOTMO').Asfloat - (DMALM.cdsDetFac.fieldbyname('DPedMtoMo').AsFloat + DMALM.cdsDetFac.fieldbyname('DPedDctoMO').AsFloat)), 15, 2);
End;

Procedure TFAlmacen.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFAlmacen.Z2bbtnImpHojaClick(Sender: TObject);
Var
   xSQL: String;
   Filtro: String;
Begin
//
End;

Procedure TFAlmacen.GeneraHojaTrabajo(xxCIa, xxLocal, xxClie, xxClieRuc, xxnPedido, xxOpen, xxVar, xxArt, xxFin: String; xxCantP, xxCantS: double; xxFlag: boolean);
Var
   xInt, xEtapa, xSolu: String;
   xCia, xclie, xPedido: String;
   xFiltro: String;
Begin
 //if (DMALM.wModo = 'A') then begin
   If (xxOpen = 'S') Or Not DMALM.cdsHojaT.Active Then
   Begin
      xFiltro := 'HOJTID=' + '''' + xxNPedido + '''' + ' and ' +
         'PEDIDO=' + '''' + xxNPedido + '''';
      DMALM.Filtracds(DMALM.cdsHojaT, 'SELECT * FROM FAC309 WHERE ' + xFiltro);
      DMALM.Filtracds(DMALM.cdsDHojaT, 'SELECT * FROM FAC310 WHERE ' + xFiltro);

      If DMALM.cdsHojaT.RecordCount = 0 Then
      Begin
         DMALM.cdsHojaT.Insert;
         DMALM.cdsHojaT.fieldbyname('PEDFECHA').AsDatetime := Date;
         DMALM.cdsHojaT.fieldbyname('HOJTFECREG').value := Date;
         DMALM.cdsHojaT.fieldbyname('HOJTHORREG').AsDatetime := time;
      End
      Else
         DMALM.cdsHojaT.Edit;
      DMALM.cdsHojaT.fieldbyname('PEDIDO').AsString := xxNPedido;
      DMALM.cdsHojaT.fieldbyname('HOJTID').AsString := xxNPedido;
      DMALM.cdsHojaT.Post;
   End;

   If (DMALM.cdsDHojaT.recordcount = 0) Then
   Begin
      DMALM.cdsDHojaT.Insert;
      DMALM.cdsDHojaT.fieldbyname('PEDIDO').AsString := xxNPedido;
      DMALM.cdsDHojaT.fieldbyname('HOJTID').AsString := xxNPedido;
      DMALM.cdsDHojaT.fieldbyname('HOJTESTADO').AsString := 'I';

      DMALM.cdsDHojaT.fieldbyname('INTID').AsString := DMALM.DisplayDescrip('prvSQL', 'FAC113', 'INTID, INTDES, ETAPAID', 'INTVAR=' + quotedstr(xxVar), 'INTID');
      DMALM.cdsDHojaT.fieldbyname('INTDES').AsString := DMALM.cdsQry.fieldbyname('INTDES').AsString;
      DMALM.cdsDHojaT.fieldbyname('ETAPAID').AsString := DMALM.cdsQry.fieldbyname('ETAPAID').AsString;
      DMALM.cdsDHojaT.fieldbyname('HOJTFECREG').value := Date;
      DMALM.cdsDHojaT.fieldbyname('HOJTHORREG').value := time;

      If (xxFlag = true) Then
      Begin //Interrupcion Activada
         xSolu := DMALM.DisplayDescrip('prvSQL', 'FAC114', 'SOLUID, SOLUDES', 'SOLUFLAG=''P''', 'SOLUID');
         DMALM.cdsDHojaT.fieldbyname('SOLUID').AsString := xSolu; // Con problemas
         DMALM.cdsDHojaT.fieldbyname('SOLUFID').AsString := xSolu; // Este campo serbira para almacenar la solución final
         DMALM.cdsDHojaT.fieldbyname('SOLUDES').AsString := DMALM.cdsQry.fieldbyname('SOLUDES').AsString; // Este campo servira para almacenar la solución final
      End
      Else
      Begin
         xSolu := DMALM.DisplayDescrip('prvSQL', 'FAC114', 'SOLUID, SOLUDES', 'SOLUFLAG=''A''', 'SOLUID');
         DMALM.cdsDHojaT.fieldbyname('SOLUID').AsString := xSolu; // Aceptados
         DMALM.cdsDHojaT.fieldbyname('SOLUFID').AsString := xSolu; // Este campo serbira para almacenar la solución final
         DMALM.cdsDHojaT.fieldbyname('SOLUDES').AsString := DMALM.cdsQry.fieldbyname('SOLUDES').AsString; // Este campo servira para almacenar la solución final
      End;
      DMALM.cdsDHojaT.Post;
   End //if recordcount =0
   Else
      If (DMALM.cdsDHojaT.recordcount > 0) Then
      Begin
         xCia := xxCia;
         xClie := xxClie;
         xPedido := xxNPedido;
         xInt := DMALM.DisplayDescrip('prvSQL', 'FAC113', 'INTID', 'INTVAR=' + QuotedStr(xxVar), 'INTID');

         If DMALM.cdsDHojaT.Locate('CiaId;ClieId;Pedido;IntId', VarArrayOf([xcia, xclie, xpedido, xInt]), [loCaseInsensitive]) Then
         Begin
            DMALM.cdsDHojaT.Edit;
            If (DMALM.cdsHojaT.fieldbyname('HOJTESTADO').AsString = 'P') Then ;
            DMALM.cdsDHojaT.fieldbyname('HOJTESTADO').AsString := 'P';
            If (xxFin = 'S') Then
            Begin
               DMALM.cdsDHojaT.fieldbyname('HOJTFECSOL').value := Date;
               DMALM.cdsDHojaT.fieldbyname('HOJTHORSOL').value := time;
            End;
            DMALM.cdsDHojaT.Post;
         End
         Else
         Begin
            DMALM.cdsDHojaT.Insert;
            DMALM.cdsDHojaT.fieldbyname('CIAID').AsString := xxCia;
            DMALM.cdsDHojaT.fieldbyname('LOCID').AsString := xxLocal;
            DMALM.cdsDHojaT.fieldbyname('PEDIDO').AsString := xxNPedido;
            DMALM.cdsDHojaT.fieldbyname('HOJTID').AsString := xxNPedido;
            DMALM.cdsDHojaT.fieldbyname('CLIEID').AsString := xxClie;
            DMALM.cdsDHojaT.fieldbyname('CLIERUC').AsString := xxClieRuc;
            DMALM.cdsDHojaT.fieldbyname('HOJTESTADO').AsString := 'I';

            DMALM.cdsDHojaT.fieldbyname('INTID').AsString := DMALM.DisplayDescrip('prvSQL', 'FAC113', 'INTID, INTDES, ETAPAID', 'INTVAR=' + quotedstr(xxVar), 'INTID');
            DMALM.cdsDHojaT.fieldbyname('INTDES').AsString := DMALM.cdsQry.fieldbyname('INTDES').AsString;
            DMALM.cdsDHojaT.fieldbyname('ETAPAID').AsString := DMALM.cdsQry.fieldbyname('ETAPAID').AsString;
            DMALM.cdsDHojaT.fieldbyname('HOJTFECREG').value := Date;
            DMALM.cdsDHojaT.fieldbyname('HOJTHORREG').value := time;
            If (xxFlag = true) Then
            Begin //Interrupcion Activada
               DMALM.cdsDHojaT.fieldbyname('SOLUID').AsString := DMALM.DisplayDescrip('prvSQL', 'FAC114', 'SOLUID, SOLUDES', 'SOLUFLAG=''P''', 'SOLUID');
               ; // Con problemas
               DMALM.cdsDHojaT.fieldbyname('SOLUFID').AsString := DMALM.cdsDHojaT.fieldbyname('SOLUID').AsString; // Este campo serVira para almacenar la solución final
               DMALM.cdsDHojaT.fieldbyname('SOLUDES').AsString := DMALM.cdsQry.fieldbyname('SOLUDES').AsString; // Este campo serVira para almacenar la solución final
            End
            Else
            Begin
               xSolu := DMALM.DisplayDescrip('prvSQL', 'FAC114', 'SOLUID, SOLUDES', 'SOLUFLAG=''A''', 'SOLUID');
               DMALM.cdsDHojaT.fieldbyname('SOLUID').AsString := xSolu; // Aceptados
               DMALM.cdsDHojaT.fieldbyname('SOLUFID').AsString := xSolu; // Este campo serbira para almacenar la solución final
               DMALM.cdsDHojaT.fieldbyname('SOLUDES').AsString := DMALM.cdsQry.fieldbyname('SOLUDES').AsString; // Este campo servira para almacenar la solución final
            End;
            DMALM.cdsDHojaT.Post;
         End;
      End;
End;

Procedure TFAlmacen.Z2bbtnCancelClick(Sender: TObject);
Begin
   close;
End;

Procedure TFAlmacen.Z2bbtnOkClick(Sender: TObject);
Var
   sSQL: String;
   sCia, SLocal, sClie, sClieRuc, sNPedido, sArt: String;
   fCant: double;
Begin
   If MessageDlg('Pasar el Pedido a Despacho' + chr(13) + '      ¿ Esta Seguro ?      ',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      exit;

   DMALM.cdsDetFac.DisableControls;
   DMALM.cdsDetFac.First;
   sCia := DMALM.cdsDetFac.fieldbyname('CIAID').AsString;
   sLocal := DMALM.cdsDetFac.fieldbyname('LOCID').AsString;
   sClie := DMALM.cdsDetFac.fieldbyname('CLIEID').AsString;
   sClieRuc := DMALM.cdsDetFac.fieldbyname('CLIERUC').AsString;
   sNPedido := DMALM.cdsDetFac.fieldbyname('PEDIDO').AsString;
   While Not DMALM.cdsDetFac.Eof Do
   Begin
      sArt := DMALM.cdsDetFac.fieldbyname('ARTID').AsString;
      fCant := DMALM.cdsDetFac.FieldByName('DPEDCANTXA').AsFloat;
      sSQL := 'UPDATE FAC302 SET DPEDESTADO=''DESPACHO'',DPEDCANTXA= ' + floattostr(fCant) + ' '
         + 'WHERE PEDIDO=' + quotedstr(sNPedido) + ' AND ARTID=' + quotedstr(sArt);
      DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      DMALM.cdsDetFac.Next;
   End;
   DMALM.cdsDetFac.EnableControls;
   GeneraHojaTrabajo(sCia, sLocal, sClie, sClieRuc, sNPedido, 'N', 'AM', '', 'S', 0, 0, false); //Registro de Interrupcion de Atencion en Almacen
   GeneraHojaTrabajo(sCia, sLocal, sClie, sClieRuc, sNPedido, 'N', 'AD', '', 'N', 0, 0, false); //Registro de Interrupcion de Atención en despacho

   Z2bbtnOk.Enabled := false;
   sSQL := ' UPDATE FAC301 SET PEDESTADO= ''DESPACHO'' '
      + ', ESTVENTAS=''N'',ESTALM=''N'', ESTDESP=''S'' '
      + ', ESTGUIA=''N'',ESTFACT=''N'' '
      + ' WHERE PEDIDO=' + quotedstr(DMALM.cdsDetFac.fieldbyname('PEDIDO').AsString) + ' '
      + 'AND CLIEID=' + quotedstr(DMALM.cdsDetFac.fieldbyname('CLIEID').AsString);
   DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);

   DMALM.cdsHojaT.Edit;
   DMALM.cdsHojaT.fieldbyname('HOJHOR').AsDateTime := Time;
   DMALM.cdsHojaT.Post;

   DMALM.cdsDHojaT.Edit;
   DMALM.cdsDHojaT.fieldbyname('DHOJHOR').AsDateTime := Time;
   DMALM.cdsDHojaT.Post;

   DMALM.AplicaDatos(DMALM.cdsHojaT, 'HOJAT');
   DMALM.AplicaDatos(DMALM.cdsDHojaT, 'DHOJAT');
   ShowMessage('Pedido Procesado');
End;

Procedure TFAlmacen.dbgDetFacDblClick(Sender: TObject);
Begin
   pnlRegistro.Visible := true;
   If DMALM.cdsDetFac.recordcount > 0 Then
   Begin
      pnlDetalle.Enabled := False;
      pnlPie.Enabled := False;
      pnlRegistro.Visible := True;
      pnlRegistro.SetFocus;
      DMALM.cdsDetFac.Edit;
      If DMALM.cdsQry4.FieldByName('DPEDSIT').AsString = 'ATENDIDO' Then
      Begin
         showmessage('El Articulo ya fue Atendido...');
         exit;
      End
      Else
         dbeCantAt.Enabled := true;
      dblcdArticulo.Text := DMALM.cdsQry4.fieldbyname('ARTID').AsString;
      edtArticulo.Text := DMALM.cdsQry4.fieldbyname('ARTDES').AsString;
      edtPedido.text := DMALM.cdsQry4.fieldbyname('PEDIDO').AsString;
      dbeCantAc.Text := floattostr(DMALM.cdsQry4.fieldbyname('DPEDCANTAC').AsFloat);
      lblUMAC.Caption := DMALM.cdsQry4.fieldbyname('UNMIDO').AsString;
      dbeCantAt.text := floattostr(DMALM.cdsQry4.fieldbyname('DPEDCANTXA').AsFloat); //Cant x Atender
      lblUMAT.Caption := DMALM.cdsQry4.fieldbyname('UNMIDO').AsString;
      xxCantXAAnt := DMALM.cdsQry4.fieldbyname('DPEDCANTXA').AsFloat;
   End;
End;

Procedure TFAlmacen.bbtnRegCancClick(Sender: TObject);
Begin
   pnlRegistro.Visible := False;
   pnlDetalle.Enabled := True;
   pnlPie.Enabled := True;
End;

Procedure TFAlmacen.bbtnRegOkClick(Sender: TObject);
Var
   xFiltro, xEstado, xSQL: String;
   sAlmacen: String;
   wAno, wMes, wDia: word;
   xStock, xReserva, xReserva0,
      xNuevaCant: double;
Begin
 /////Validaciones
   DMALM.cdsDetFac.Setkey;
   DMALM.cdsDetFac.FieldByName('PEDIDO').AsString := edtPedido.text;
   DMALM.cdsDetFac.FieldByName('ARTID').AsString := dblcdArticulo.Text;
   If DMALM.cdsDetFac.GotoKey Then
   Begin
      DecodeDate(DMALM.cdsDetFac.FieldByName('PEDFECHA').AsDatetime, wAno, wMes, wDia);
      If length(dbeCantAt.text) = 0 Then
      Begin
         showmessage('Ingrese la cantidad a Atender...');
         exit;
         dbeCantAt.SetFocus;
      End;
      If strtofloat(dbeCantAt.text) < 0 Then
      Begin
         showmessage('Ingrese Cantidad mayor o igual a cero...');
         dbeCantAt.SetFocus;
         exit;
      End;
      pnlDetalle.Enabled := true;
      pnlRegistro.Visible := true;
      xNuevaCant := 0;
      If xxCantXAAnt <> strtofloat(dbeCantAt.text) Then
      Begin
         xNuevaCant := strtofloat(dbeCantAt.text) - xxCantXAAnt;
         xFiltro := '';
         xEstado := 'G';
         sAlmacen := DMALM.cdsDetFac.FieldByName('ALMID').AsString;
         xSQL := 'SELECT STKSACTG,STKRACTG FROM LOG316';
         xSQL := xSQL + ' WHERE CIAID =' + quotedstr(DMALM.cdsDetFac.FieldByName('CIAID').AsString);
         xSQL := xSQL + ' AND ALMID =' + quotedstr(DMALM.cdsDetFac.FieldByName('ALMID').AsString);
         xSQL := xSQL + ' AND ARTID =' + quotedstr(dblcdArticulo.text);
         xSQL := xSQL + ' AND STKANO =' + '''' + inttostr(wAno) + '''';
         DMALM.cdsQry1.Close;
         DMALM.cdsQry1.DataRequest(xSQL);
         DMALM.cdsQry1.Open;
         If DMALM.cdsQry1.Recordcount > 0 Then
         Begin
            xStock := DMALM.cdsQry1.FieldByName('STKSACTG').AsFloat; // Stock Fisico
            xReserva := DMALM.cdsQry1.FieldByName('STKRACTG').AsFloat; // Stock Reservado
            xReserva0 := DMALM.cdsQry1.FieldByName('STKRACTG').AsFloat; // Stock Reservado
         End;

         xReserva := xReserva - xxCantXAAnt + strtofloat(dbeCantAt.text);
         If xReserva > xStock Then xReserva := xStock;
         xReserva := xReserva - xReserva0;

         If xReserva < xNuevaCant Then
         Begin
            Showmessage('La Nueva Cantidad por Atender excede el Stock Disponible');
            dbeCantAt.SetFocus;
            exit;
         End;
         xFiltro := 'Update LOG316 Set STKRACTG =' + DMALM.wReplacCeros + '(STKRACTG,0)' + '+' + floattostr(xReserva)
            + ' Where ARTID = ' + quotedstr(dblcdArticulo.text)
            + ' AND STKANO =' + quotedstr(inttostr(wAno))
            + ' AND ALMID =' + quotedstr(DMALM.cdsDetFac.FieldByName('ALMID').AsString);
         DMALM.DCOM1.AppServer.EjecutaSQL(xFiltro);
         DMALM.cdsDetFac.edit;
         DMALM.cdsDetFac.fieldbyname('DPEDCANTRE').AsFloat := DMALM.cdsDetFac.fieldbyname('DPEDCANTRE').AsFloat + xReserva;
         DMALM.cdsDetFac.fieldbyname('DPEDCANTXA').AsFloat := DMALM.cdsDetFac.fieldbyname('DPEDCANTRE').AsFloat;
         DMALM.cdsQry4.Edit;
         DMALM.cdsQry4.fieldbyname('DPEDCANTRE').AsFloat := DMALM.cdsDetFac.fieldbyname('DPEDCANTRE').AsFloat + xReserva;
         DMALM.cdsQry4.fieldbyname('DPEDCANTXA').AsFloat := DMALM.cdsDetFac.fieldbyname('DPEDCANTRE').AsFloat;
         DMALM.cdsQry4.fieldbyname('STKSACTG').AsFloat := DMALM.cdsQry4.fieldbyname('STKSACTG').AsFloat + xReserva;
         DMALM.cdsQry4.Post;
      End;
      DMALM.AplicaDatos(DMALM.cdsDetFac, 'DETFAC');

      pnlRegistro.visible := false;
      pnlPie.enabled := true;
   End
   Else
   Begin
      Showmessage('Codigo errado');
      exit;
   End;
End;

Procedure TFAlmacen.dbeCantAtExit(Sender: TObject);
Begin
   If Not bbtnRegCanc.Focused Then
   Begin
      If length(dbeCantAt.text) = 0 Then
      Begin
         showmessage('Ingrese la cantidad a Atender...');
         dbeCantAt.SetFocus;
         exit;
      End;

      If strtofloat(dbeCantAt.text) < 0 Then
      Begin
         showmessage('Ingrese Cantidad mayor o igual a cero...');
         dbeCantAt.SetFocus;
         exit;
      End;

      If (strtofloat(dbeCantAc.text) < strtofloat(dbeCantAt.text)) Then
      Begin
         showmessage('La Cant.x Atender no puede ser Mayor que la Cant. Aceptada!!!');
         dbeCantAt.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFAlmacen.bbtnOrdenDespachoClick(Sender: TObject);
Var
   xSQL, xWhere: String;
   xZona, xSectorDes, xCZipId, xCZipDes, xZonaVtaId, xZonaVtaDes: String;
Begin
 // Si se modifica, hacerlo tambien en el Fact773
   xFlgImp := False;
   ppRepOrden.template.fileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\OrdenDespacho.rtm';
   ppRepOrden.template.LoadFromFile;

   xSQL := 'SELECT * FROM FAC301 '
      + 'WHERE PEDIDO =' + quotedstr(DMALM.cdsKdx.FieldByName('PEDIDO').AsString);
   DMALM.cdsMovFac.Filter := '';
   DMALM.cdsMovFac.Filtered := False;
   DMALM.cdsMovFac.IndexFieldNames := '';
   DMALM.cdsMovFac.Close;
   DMALM.cdsMovFac.DataRequest(xSQL);
   DMALM.cdsMovFac.Open;
   If DMALM.cdsMovFac.recordcount = 0 Then
   Begin
      showmessage('No se encontraron datos para Imprimir');
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'SELECT FAC302.CIAID, FAC302.CLIEID, TGE204.CLIERUC, TGE204.CLIEDES, TGE204.CLIEDIR, TGE204.CLIETELF, '
         + 'FAC302.PEDIDO, FAC302.DPEDFREG, FAC302.GRARID, FAC302.ARTID, FAC302.ARTDES, '
         + 'FAC302.DPEDDCTO1, FAC302.UNMIDO, FAC302.DPEDSALDO, FAC302.DPEDCANTAC, FAC302.DPEDITEM, FAC302.UNMIDG, '
         + 'FAC302.DPEDCANTXA, (LOG316.STKSACTG-LOG316.STKRACTG) STKSACTG '
         + 'FROM FAC302 '
         + 'LEFT OUTER JOIN TGE204 ON (FAC302.CIAID=TGE204.CIAID AND FAC302.CLIEID=TGE204.CLIEID) '
         + 'LEFT OUTER JOIN LOG316 ON (FAC302.CIAID=LOG316.CIAID AND FAC302.ALMID=LOG316.ALMID AND FAC302.ARTID=LOG316.ARTID) '
         + 'WHERE FAC302.CIAID =' + quotedstr(DMALM.cdsMovFac.FieldByName('CIAID').AsString) + ' '
         + 'AND FAC302.CLIEID =' + quotedstr(DMALM.cdsMovFac.FieldByName('CLIEID').AsString) + ' '
         + 'AND FAC302.PEDIDO =' + quotedstr(DMALM.cdsMovFac.FieldByName('PEDIDO').AsString) + ' '
         + 'AND DPEDARTIAN=' + quotedstr('N') + ' '
         + 'AND DPEDCANTXA>0 '
         + 'ORDER BY DPEDITEM';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         xSQL := 'SELECT FAC302.CIAID, FAC302.CLIEID, TGE204.CLIERUC, TGE204.CLIEDES, TGE204.CLIEDIR, TGE204.CLIETELF, '
            + 'FAC302.PEDIDO, FAC302.DPEDFREG, FAC302.GRARID, FAC302.ARTID, FAC302.ARTDES, '
            + 'FAC302.DPEDDCTO1, FAC302.UNMIDO, FAC302.DPEDSALDO, FAC302.DPEDCANTAC, FAC302.DPEDITEM, FAC302.UNMIDG, '
            + 'FAC302.DPEDCANTXA, (LOG316.STKSACTG-LOG316.STKRACTG) STKSACTG '
            + 'FROM FAC302, TGE204, LOG316 '
            + 'WHERE FAC302.CIAID =' + quotedstr(DMALM.cdsMovFac.FieldByName('CIAID').AsString)
            + 'AND FAC302.CLIEID =' + quotedstr(DMALM.cdsMovFac.FieldByName('CLIEID').AsString)
            + 'AND FAC302.PEDIDO =' + quotedstr(DMALM.cdsMovFac.FieldByName('PEDIDO').AsString)
            + 'AND DPEDARTIAN=' + quotedstr('N')
            + 'AND DPEDCANTXA>0'
            + 'AND FAC302.CIAID=TGE204.CIAID AND FAC302.CLIEID=TGE204.CLIEID '
            + 'AND FAC302.CIAID=LOG316.CIAID AND FAC302.ALMID=LOG316.ALMID AND FAC302.ARTID=LOG316.ARTID '
            + 'ORDER BY DPEDITEM';
      End;

   DMALM.cdsDetFac.Close;
   DMALM.cdsDetFac.DataRequest(xSQL);
   DMALM.cdsDetFac.Open;

   xWhere := 'CIAID=' + quotedstr(DMALM.cdsDetFac.fieldbyname('CIAID').AsString);
   pplblCia.Caption := DMALM.DisplayDescrip('prvSQL', 'TGE101', '*', xWhere, 'CIADES');
   pplbRucCia.caption := DMALM.cdsQry.FieldByName('CIARUC').AsString;
   pplblDirEmp.Caption := DMALM.cdsQry.FieldByName('CIADIRE').AsString;
 //pplblEMail.Caption     := 'ventas@incoresa.com.pe';
 //pplblPaginaWeb.CAption := 'www.Incoresa.com.pe';
   pplblServ.Caption := DMALM.cdsQry.FieldByName('CIATLF').AsString;

   pplblUsuario.caption := DMALM.cdsMovFac.fieldbyname('PEDUSER').AsString;

   xCZipId := DMALM.cdsMovFac.FieldByName('ZIPID').AsString;

   xWhere := 'ZIPID=' + quotedstr(xCZipId);
   xCZipDes := DMALM.DisplayDescrip('prvSQL', 'TGE122', 'ZIPDES', xWhere, 'ZIPDES');

   xZonaVtaId := DMALM.cdsMovFac.FieldByName('ZONVTAID').AsString;

   xWhere := 'ZVTAID=' + quotedstr(xZonaVtaId);
   xZonaVtaDes := DMALM.DisplayDescrip('prvSQL', 'FAC106', 'ZVTADES,TVTAID', xWhere, 'ZVTADES');

   xWhere := 'TVTAID=' + quotedstr(DMALM.cdsQry.fieldbyname('TVTAID').AsString);
   xSectorDes := DMALM.DisplayDescrip('prvSQL', 'FAC105', 'TVTADES', xWhere, 'TVTADES');

   pplblLugarEntrega.Caption := DMALM.cdsMovFac.FieldByName('PEDDIRENT').AsString + ' ' + xCZipDes;
   pplblZona.caption := xZonaVtaDes + ' - ' + xSectorDes;
   pplblZonaD.caption := xZonaVtaDes + ' - ' + xSectorDes;
   xWhere := 'CIAID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('CIAID').AsString)
      + ' and SCOMERID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('TIPVTAID').AsString)
      + ' and CCOMERID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('FPAGOID').AsString);
   pplblCCom.Caption := DMALM.DisplayDescrip('prvSQL', 'TGE180', 'DCCOMDES', xWhere, 'DCCOMDES');

   xWhere := 'CIAID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('CIAID').AsString)
      + ' and VEID=' + quotedstr(DMALM.cdsMovFac.fieldbyname('VEID').AsString);
   pplblVendedor.Caption := DMALM.cdsMovFac.fieldbyname('VEID').AsString + ' ' +
      DMALM.DisplayDescrip('prvSQL', 'CXC203', 'VENOMBRES', xWhere, 'VENOMBRES');
   pplblPorCia.Caption := 'Por:' + pplblCia.Caption;
   pplbRuc2.Caption := pplbRucCia.caption;

   ppDBPipeline1.DataSource := DMALM.dsDetFac;
   Screen.Cursor := crDefault;
   ppRepOrden.Print;
   ppRepOrden.Stop;
   If xFlgImp Then
   Begin
      DMALM.cdsKDX.Edit;
      DMALM.cdsKDX.FieldByName('PEDIMP').AsFloat := DMALM.cdsKDX.FieldByName('PEDIMP').AsFloat + 1;
      DMALM.cdsKDX.Post;
   End;
 //DMALM.ControlTran;
   DMALM.ControlTran(0, Nil, '');
End;

Procedure TFAlmacen.FormActivate(Sender: TObject);
Var
   xwhere: String;
Begin
 // Si El Password es del Administrador
   If DMALM.wAdmin = 'G' Then
   Begin
      DMALM.wModo := 'C';
   End;
   Z2bbtnOk.Enabled := true;
   xxCantXAAnt := 0;
End;

Procedure TFAlmacen.ppRepOrdenPreviewFormCreate(Sender: TObject);
Begin
   ppRepOrden.PreviewForm.ClientHeight := 500;
   ppRepOrden.PreviewForm.ClientWidth := 650;
   TppViewer(ppRepOrden.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFAlmacen.ppRepOrdenPrintingComplete(Sender: TObject);
Begin
   xFlgImp := True;
End;

Procedure TFAlmacen.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
End;

End.

