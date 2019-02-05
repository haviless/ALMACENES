Unit ALM306;
// HPC_201602_ALM 30/04/2016 Entrega a Calidad
//
{31/08/2000 pjsv }
Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Mask, wwdbedit, Wwdbspin, ExtCtrls, Buttons, wwdblook, db, ComCtrls,
   Grids, Wwdbigrd, Wwdbgrid, DBClient;

Type
   TFGenAsi = Class(TForm)
      pnlCabecera: TPanel;
      Label8: TLabel;
      dblcCia: TwwDBLookupCombo;
      dbeCia: TwwDBEdit;
      lblTipComp: TLabel;
      dblcTipDir: TwwDBLookupCombo;
      dbeTipComp: TwwDBEdit;
      Label1: TLabel;
      Label2: TLabel;
      dbseMes: TwwDBSpinEdit;
      Label3: TLabel;
      dbseAnio: TwwDBSpinEdit;
      Label4: TLabel;
      dtpFCambio: TDateTimePicker;
      lblCambio: TLabel;
      dbeTipCam: TwwDBEdit;
      cbItemTCam: TComboBox;
      lblTipCam: TLabel;
      dbeMoneda: TwwDBEdit;
      dblcMoneda: TwwDBLookupCombo;
      Label5: TLabel;
      bbGenera: TBitBtn;
      bbCierra: TBitBtn;
      pnlDetalle: TPanel;
      Label6: TLabel;
      dbgAsientoE: TwwDBGrid;
      Label7: TLabel;
      dbgAsientoS: TwwDBGrid;
      bbGraba: TBitBtn;
      bbModi: TBitBtn;
      bbsalir: TBitBtn;
      Procedure FormActivate(Sender: TObject);
      Procedure dblcTipDirChange(Sender: TObject);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dtpFCambioChange(Sender: TObject);
      Procedure dblcTipDirExit(Sender: TObject);
      Procedure cbItemTCamChange(Sender: TObject);
      Procedure bbGeneraClick(Sender: TObject);
      Procedure bbGrabaClick(Sender: TObject);
      Procedure dblcCiaChange(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dtpFCambioExit(Sender: TObject);
      Procedure bbModiClick(Sender: TObject);
      Procedure bbsalirClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcMonedaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);

   Private
    { Private declarations }
      validaCL: String;
      vanomes, vmes, vdia: String;
//   vtothabd,vtothabs,vtotdebd,vtotdebs,
      vtotals, vtotald, vdebes, vhabers, vdebed, vhaberd: real;
      vyear, vmonth, vday: word;
      vCargaCta: String;
      Procedure JalaTipCam;
      Procedure Limpia;
   Public
    { Public declarations }
   End;

Var
   FGenAsi: TFGenAsi;

Implementation
Uses ALMDM1;
{$R *.DFM}

Procedure TFGenAsi.FormActivate(Sender: TObject);
Var
   ssql: String;
Begin
    {setea la bariable validaCL}
   validaCL := 'L';

    { abre Client}
   dm1.cdsTMoneda.Open; { tipo de moneda}
   dm1.cdsTRAN.open; {transaccion}
//    dm1.cdsCia.Open;     {compañia}
    //** 14/03/2001 - pjsv
//    dm1.cdsTDiario.open; { tipo de diario}
    //**
   dm1.cdsAsiento.open; { cabecera del asiento LOG321}
   dm1.cdsDAsiento.open; { detalle del asiento LOG322 }
   dm1.cdsPeriodo.open; { periodos, semestres, etc.. TGE114 }

   dm1.cdsTMoneda.First;
   ssql := '';
    //** 14/03/2001 - pjsv - se cambia por la TGE208 tipo de transacccion
    //ssql := 'SELECT * FROM TGE104 WHERE TDIARMAN=''I'' ORDER BY TDIARID';
    //dm1.cdsTDiario.close;
    //dm1.cdsTDiario.DataRequest(ssql);
    //dm1.cdsTDiario.open;
    //dm1.cdsTDiario.first;
   ssql := 'SELECT * FROM TGE208 WHERE TRISGT=''I'' ORDER BY TRIID';
   dm1.cdsTran.close;
   dm1.cdsTran.DataRequest(ssql);
   dm1.cdsTran.open;
   dm1.cdsTran.first;
    //**
    { descodifica el date del sistema}
   DecodeDate(date(), vyear, vmonth, vday);
   dbseMes.Value := vmonth;
   dbseAnio.Value := vyear;
    { setea los controles }
   vcargacta := '';
   dblcCia.text := dm1.cdsCia.fieldbyname('CIAID').AsString;
   dblcCiaChange(Nil);
   dbeMoneda.Text := '';
   dbeTipComp.Text := '';
   dtpFCambio.DateTime := Date();
    //** 14/03/2001 - pjsv
    //dblcTipDir.Text := dm1.cdsTDiario.fieldbyname('TDIARID').AsString;
   dblcTipDir.Text := dm1.cdsTran.fieldbyname('TRIID').AsString;
    //**
   cbItemTCam.ItemIndex := 0;
   dblcMoneda.Text := dm1.cdsTMoneda.fieldbyname('TMONID').AsString;
   dblcMoneda.OnExit(self);
   pnlDetalle.enabled := false;
   pnlCabecera.enabled := True;
End;

Procedure TFGenAsi.dblcTipDirChange(Sender: TObject);
Begin
   dbeTipComp.Text := dm1.cdsTRAN.fieldbyname('TRIDES').AsString;
End;

Procedure TFGenAsi.dblcNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFGenAsi.dblcTipDirExit(Sender: TObject);
Begin
   If dblcTipdir.text = '' Then
   Begin
      errormsg('Error', 'Debe de escoger un Tipo de Comprobante');
      dblcTipDir.setfocus;
   End;
End;

Procedure TFGenAsi.dtpFCambioChange(Sender: TObject);
Begin
   dbeTipCam.text := '';
   If (dm1.strZero(dbseMes.text, 2) = copy(DateTostr(dtpFCambio.date), 4, 2)) Or
      (dbseAnio.text = copy(DateTostr(dtpFCambio.date), 7, 4)) Then
      JalaTipCam;
End;

Procedure TFGenAsi.cbItemTCamChange(Sender: TObject);
Begin
   dbeTipCam.text := '';
   JalaTipCam;
End;

Procedure TFGenAsi.JalaTipCam;
Var
   sfecha, ssql: String;
Begin
   //** 15/03/2001 - pjsv
   sFecha := formatdatetime(dm1.wFormatFecha, dtpFCambio.Date);
   ssql := 'FECHA=' + quotedstr(sFecha);
   //**
   Case cbItemTCam.ItemIndex Of
      0: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVBC', ssql, 'TCAMVBC');
      1: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVBV', ssql, 'TCAMVBV');
      2: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVPC', ssql, 'TCAMVPC');
      3: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVPV', ssql, 'TCAMVPV');
      4: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVOC', ssql, 'TCAMVOC');
      5: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVOV', ssql, 'TCAMVOV');
      6: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVXC', ssql, 'TCAMVXC');
      7: dbeTipCam.Text := dm1.DisplayDescrip('prvTGE', 'TGE107', 'TCAMVXV', ssql, 'TCAMVXV');
   End;
   If dbeTipCam.text = '' Then
   Begin
      dbeTipCam.text := '0.00';
      bbGenera.enabled := false;
   End
   Else
      bbGenera.enabled := true;
End;

Procedure TFGenAsi.bbGeneraClick(Sender: TObject);
Var
   xsql, ssql: String;
   vcuen, vcia, vloc, valm, vart, vnisatip: String;
// xn,xm : REal;
Begin
   Screen.Cursor := crHourGlass;
   vdebed := 0;
   vhaberd := 0;
   vtotald := 0;
   vdebes := 0;
   vhabers := 0;
   vtotals := 0;
   dm1.cdsQry.DisableControls;
   vmes := dm1.StrZero(dbseMes.Text, 2);
   vdia := copy(DateTostr(dtpFCambio.date), 1, 2);
   vanomes := dbseAnio.Text + vmes;
  { asiento por ingreso }
   xsql := '';
   xsql := 'SELECT LOG315.CIAID, LOG315.LOCID, LOG315.ALMID, LOG315.TDAID,' +
      ' LOG315.ARTID, LOG315.NISATIP, LOG315.NISAID, LOG315.KDXID,' +
          // 15/03/2001 - pjsv
   ' ' + dm1.wReplacCeros + '(LOG315.ARTPCU,0.00) AS ARTPCU, ' + dm1.wReplacCeros + '(LOG315.ARTPCG,0.00) AS ARTPCG, LOG315.CUENTA2ID, LOG315.KDXCVTAS,' +
          //**
   ' TGE205.CUENTAID, LOG315.TMONID,LOG315.CCOSID' +
      ' FROM LOG315,TGE205' +
      ' WHERE LOG315.ARTID = TGE205.ARTID AND KDXANOMM=' + QUOTEDSTR(VANOMES) +
      ' AND LOG315.NISATIP=''INGRESO''' +
      ' ORDER BY CIAID,LOCID,ALMID,NISATIP,CUENTA2ID,CUENTAID';
   dm1.cdsEjecuta.Close;
   dm1.cdsEjecuta.ProviderName := 'prvEjecuta';
   dm1.cdsEjecuta.DataRequest(xsql);
   dm1.cdsEjecuta.open;

   ssql := '';
  //** 15/03/2001 - pjsv
   ssql := 'SELECT ''               '' AS CUENTA, ''  '' AS CIAID, ''  '' AS LOCID,' +
      ' ''  '' AS ALMID, ''  '' AS TDAID, ''  '' AS ARTID, ''  '' AS NISATIP,' +
      ' ''  '' AS KDXID, ''               '' AS CUENTA2ID, ''               '' AS CUENTAID, ''     '' KDXCVTAS,' +
      ' 0.00 AS ARTPCU, 0.00 AS ARTPCG,0.00 AS DEBES,0.00 AS HABERS,' +
      ' 0.00 AS DEBED,0.00 AS HABERD,0.00 AS TOTAL1, 0.00 AS TOTAL2,' +
      ' '' '' AS DH, ''          '' AS CCOSID, ''  '' AS TMONID' +
      '  FROM TGE901';
  //**
   dm1.cdsTGE.Close;
   dm1.cdsTGE.ProviderName := 'prvTGE';
   dm1.cdsTGE.DataRequest(ssql);
   dm1.cdsTGE.open;
   TNumericField(dm1.cdsTGE.FieldByName('DEBES')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsTGE.FieldByName('DEBED')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsTGE.FieldByName('HABERS')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsTGE.FieldByName('HABERD')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsTGE.FieldByName('ARTPCU')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsTGE.FieldByName('ARTPCG')).DisplayFormat := '###,###,##0.00';
   dm1.cdsTGE.first;
   While Not dm1.cdsTGE.eof Do
      dm1.cdsTGE.Delete;
  {CALCULAR entradas }
   vcia := '';
   vloc := '';
   valm := '';
   vart := '';
   vnisatip := '';
   vcuen := '';
   dm1.cdsEjecuta.First;
   While Not dm1.cdsEjecuta.eof Do
   Begin
      If (vcia <> TRIM(dm1.cdsEjecuta.fieldbyname('CIAID').AsString)) Or
         (vLoc <> TRIM(dm1.cdsEjecuta.fieldbyname('LOCID').AsString)) Then
      Begin
         vcia := TRIM(dm1.cdsEjecuta.fieldbyname('CIAID').AsString);
         vloc := TRIM(dm1.cdsEjecuta.fieldbyname('LOCID').AsString);
         xsql := '';
         xsql := 'SELECT LOG315.CIAID, LOG315.LOCID, LOG315.ALMID, LOG315.TDAID,' +
            ' LOG315.ARTID, LOG315.NISATIP, LOG315.NISAID, LOG315.KDXID,' +
            ' ' + dm1.wReplacCeros + '(LOG315.ARTPCU,0.00) AS ARTPCU, ' + dm1.wReplacCeros + '(LOG315.ARTPCG,0.00) AS ARTPCG, LOG315.CUENTA2ID, LOG315.KDXCVTAS,' +
            ' TGE205.CUENTAID, LOG315.TMONID,LOG315.CCOSID' +
            ' FROM LOG315,TGE205' +
            ' WHERE LOG315.ARTID = TGE205.ARTID AND KDXANOMM=' + QUOTEDSTR(VANOMES) +
            ' AND LOG315.NISATIP=''INGRESO'' AND LOG315.CIAID=' + QUOTEDSTR(VCIA) +
            ' AND LOG315.LOCID=' + QUOTEDSTR(VLOC) +
            ' ORDER BY CIAID,LOCID,ALMID,NISATIP,CUENTA2ID,CUENTAID';
         dm1.cdsSQL1.Close;
         dm1.cdsSQL1.ProviderName := 'prvSQL1';
         dm1.cdsSQL1.DataRequest(xsql);
         dm1.cdsSQL1.open;
         dm1.cdsSQL1.first;
         vcuen := '';
         While Not dm1.cdsSQL1.eof Do
         Begin
            If vcuen <> TRIM(dm1.cdsSQL1.fieldbyname('CUENTAID').AsString) Then
            Begin
               dm1.cdsTGE.Insert;
               dm1.cdsTGE.fieldbyname('CIAID').AsString := dm1.cdsSQL1.fieldbyname('CIAID').AsString;
               dm1.cdsTGE.fieldbyname('LOCID').AsString := dm1.cdsSQL1.fieldbyname('LOCID').AsString;
               dm1.cdsTGE.fieldbyname('ALMID').AsString := dm1.cdsSQL1.fieldbyname('ALMID').AsString;
               dm1.cdsTGE.fieldbyname('ARTID').AsString := dm1.cdsSQL1.fieldbyname('ARTID').AsString;
               dm1.cdsTGE.fieldbyname('NISATIP').AsString := dm1.cdsSQL1.fieldbyname('NISATIP').AsString;
               dm1.cdsTGE.fieldbyname('TDAID').AsString := dm1.cdsSQL1.fieldbyname('TDAID').AsString;
               dm1.cdsTGE.fieldbyname('KDXID').AsString := dm1.cdsSQL1.fieldbyname('KDXID').AsString;
               dm1.cdsTGE.fieldbyname('CUENTAID').AsString := dm1.cdsSQL1.fieldbyname('CUENTAID').AsString;
               dm1.cdsTGE.fieldbyname('KDXCVTAS').AsString := dm1.cdsSQL1.fieldbyname('KDXCVTAS').AsString;
               dm1.cdsTGE.fieldbyname('ARTPCU').AsString := dm1.cdsSQL1.fieldbyname('ARTPCU').AsString;
               dm1.cdsTGE.fieldbyname('ARTPCG').AsString := dm1.cdsSQL1.fieldbyname('ARTPCG').AsString;
               If validaCL = 'C' Then
                  dm1.cdsTGE.fieldbyname('CUENTA').AsString := TRIM(dm1.cdsSQL1.fieldbyname('CUENTAID').AsString);
               If validaCL = 'L' Then
                  dm1.cdsTGE.fieldbyname('CUENTA').AsString := TRIM(dm1.cdsSQL1.fieldbyname('CUENTAID').AsString) + TRIM(vloc);
               dm1.cdsTGE.fieldbyname('CCOSID').AsString := TRIM(dm1.cdsSQL1.fieldbyname('CCOSID').AsString);
               dm1.cdsTGE.fieldbyname('TMONID').AsString := TRIM(dm1.cdsSQL1.fieldbyname('TMONID').AsString);
            End
            Else
               dm1.cdsTGE.Edit;

            If (vcuen <> TRIM(dm1.cdsSQL1.fieldbyname('CUENTAID').AsString)) Then
            Begin
               vcuen := TRIM(dm1.cdsSQL1.fieldbyname('CUENTAID').AsString);
               If dblcMoneda.text = DM1.wMonedaNac Then { soles (Moneda Nacional)}
               Begin
                  If (dm1.cdsSQL1.fieldbyname('TMONID').AsString = dblcMoneda.text) Or (dm1.cdsSQL1.fieldbyname('TMONID').AsString = '') Then
                  Begin
                     vhabers := dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value; // ojo * /
                     vhaberd := (dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value) / StrToFloat(dbeTipCam.text);
                  End
                  Else
                  Begin
                     vhabers := (dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value) * StrToFloat(dbeTipCam.text);
                     vhaberd := dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value;
                  End;
               End;
               If dblcMoneda.text = DM1.wMonedaExt Then { dolares (Moneda Extranjera)}
               Begin
                  If dm1.cdsSQL1.fieldbyname('TMONID').AsString = dblcMoneda.text Then
                  Begin
                     vhaberd := dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value;
                     vhabers := (dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value) * StrToFloat(dbeTipCam.text);
                  End
                  Else
                  Begin
                     vhaberd := (dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value) / StrToFloat(dbeTipCam.text);
                     vhabers := dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value;
                  End;
               End;
            End
            Else
            Begin
               If dblcMoneda.text = DM1.wMonedaNac Then { soles (Moneda Nacional)}
               Begin
                  If (dm1.cdsSQL1.fieldbyname('TMONID').AsString = dblcMoneda.text) Or (dm1.cdsSQL1.fieldbyname('TMONID').AsString = '') Then
                  Begin
                     vhabers := vhabers + dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value; //ojo  / *
                     vhaberd := vhaberd + (dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value) / StrToFloat(dbeTipCam.text);
                  End
                  Else
                  Begin
                     vhabers := vhabers + (dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value) * StrToFloat(dbeTipCam.text);
                     vhaberd := vhaberd + dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value;
                  End;
               End;
               If dblcMoneda.text = DM1.wMonedaExt Then { dolares (Moneda Extranjera)}
               Begin
                  If dm1.cdsSQL1.fieldbyname('TMONID').AsString = dblcMoneda.text Then
                  Begin
                     vhaberd := vhaberd + dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value;
                     vhabers := vhabers + (dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value) * StrToFloat(dbeTipCam.text);
                  End
                  Else
                  Begin
                     vhaberd := vhaberd + (dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value) / StrToFloat(dbeTipCam.text);
                     vhabers := vhabers + dm1.cdsSQL1.fieldbyname('ARTPCU').value + dm1.cdsSQL1.fieldbyname('ARTPCG').value;
                  End;
               End;
            End;

            dm1.cdsTGE.fieldbyname('HABERS').value := vhabers;
            dm1.cdsTGE.fieldbyname('HABERD').value := vhaberd;
            dm1.cdsTGE.fieldbyname('DEBES').value := 0.00;
            dm1.cdsTGE.fieldbyname('DEBED').value := 0.00;
            dm1.cdsTGE.fieldbyname('DH').value := 'H';
            dm1.cdsTGE.Post;
            dm1.cdsSQL1.next;
         End;
         dm1.cdsTGE.first;
         While Not dm1.cdsTGE.eof Do
         Begin
            vtotald := vtotald + dm1.cdsTGE.fieldbyname('HABERD').value;
            vtotals := vtotals + dm1.cdsTGE.fieldbyname('HABERS').value;
            dm1.cdsTGE.next;
         End;
         dm1.cdsTGE.Insert;
         dm1.cdsTGE.fieldbyname('CIAID').AsString := dm1.cdsSQL1.fieldbyname('CIAID').AsString;
         dm1.cdsTGE.fieldbyname('LOCID').AsString := dm1.cdsSQL1.fieldbyname('LOCID').AsString;
         dm1.cdsTGE.fieldbyname('ALMID').AsString := dm1.cdsSQL1.fieldbyname('ALMID').AsString;
         If validaCL = 'C' Then
            dm1.cdsTGE.fieldbyname('CUENTA').AsString := TRIM(dm1.cdsSQL1.fieldbyname('CUENTA2ID').AsString);
         If validaCL = 'L' Then
            dm1.cdsTGE.fieldbyname('CUENTA').AsString := TRIM(dm1.cdsSQL1.fieldbyname('CUENTA2ID').AsString) + TRIM(vloc);
         dm1.cdsTGE.fieldbyname('DEBED').value := vtotald;
         dm1.cdsTGE.fieldbyname('DEBES').value := vtotals;
         dm1.cdsTGE.fieldbyname('HABERD').value := '0';
         dm1.cdsTGE.fieldbyname('HABERS').value := '0';
         dm1.cdsTGE.fieldbyname('DH').value := 'D';
         dm1.cdsTGE.Post;
         dm1.cdsEjecuta.next;
      End
      Else
         dm1.cdsEjecuta.next;
   End;
   dbgAsientoE.Selected.clear;
   dbgAsientoE.Selected.Add('CUENTA'#9'15'#9'Cuenta');
   If dblcMoneda.text = DM1.wMonedaNac Then { soles (Moneda Nacional)}
   Begin
      dbgAsientoE.Selected.Add('DEBES'#9'15'#9'Debe');
      dbgAsientoE.Selected.Add('HABERS'#9'15'#9'Haber');
   End;
   If dblcMoneda.text = DM1.wMonedaExt Then { dolares (Moneda Extranjera)}
   Begin
      dbgAsientoE.Selected.Add('DEBED'#9'15'#9'Debe');
      dbgAsientoE.Selected.Add('HABERD'#9'15'#9'Haber');
   End;
   dbgAsientoE.DataSource := dm1.dsTGE;

  { asiento por salida }
   xsql := '';
   xsql := 'SELECT LOG315.CIAID, LOG315.LOCID, LOG315.ALMID, LOG315.TDAID,' +
      ' LOG315.ARTID, LOG315.NISATIP, LOG315.NISAID, LOG315.KDXID,' +
      ' ' + dm1.wReplacCeros + '(LOG315.ARTPVU,0.00) AS ARTPVU, ' + dm1.wReplacCeros + '(LOG315.ARTPVG,0.00) AS ARTPVG, LOG315.CUENTA2ID, LOG315.KDXCVTAS,' +
      ' TGE205.CUENTAID, LOG315.TMONID,LOG315.CCOSID' +
      ' FROM LOG315,TGE205' +
      ' WHERE LOG315.ARTID = TGE205.ARTID AND KDXANOMM=' + QUOTEDSTR(VANOMES) +
      ' AND LOG315.NISATIP=''SALIDA''' +
      ' ORDER BY CIAID,LOCID,ALMID,NISATIP,CUENTA2ID,CUENTAID';
   dm1.cdsEjecuta.Close;
   dm1.cdsEjecuta.ProviderName := 'prvEjecuta';
   dm1.cdsEjecuta.DataRequest(xsql);
   dm1.cdsEjecuta.open;
   ssql := '';
  //** 15/03/2001 - pjsv - la tabla TGE901 es una tabla tonta
   ssql := 'SELECT ''               '' AS CUENTA, ''  '' AS CIAID, ''  '' AS LOCID,' +
      ' ''  '' AS ALMID, ''  '' AS TDAID, ''  '' AS ARTID, ''  '' AS NISATIP,' +
      ' ''  '' AS KDXID, ''               '' AS CUENTA2ID, ''               '' AS CUENTAID, ''     '' KDXCVTAS,' +
      ' 0.00 AS ARTPVU, 0.00 AS ARTPVG,0.00 AS DEBES,0.00 AS HABERS,' +
      ' 0.00 AS DEBED,0.00 AS HABERD,0.00 AS TOTAL1, 0.00 AS TOTAL2,' +
      ' '' '' AS DH, ''          '' AS CCOSID, ''  '' AS TMONID' +
      '  FROM TGE901';
  //**
   dm1.cdsAsientoS.Close;
   dm1.cdsAsientoS.ProviderName := 'prvSQL1';
   dm1.cdsAsientoS.DataRequest(ssql);
   dm1.cdsAsientoS.open;
   TNumericField(dm1.cdsAsientoS.FieldByName('DEBES')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsAsientoS.FieldByName('DEBED')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsAsientoS.FieldByName('HABERS')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsAsientoS.FieldByName('HABERD')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsAsientoS.FieldByName('ARTPVU')).DisplayFormat := '###,###,##0.00';
   TNumericField(dm1.cdsAsientoS.FieldByName('ARTPVG')).DisplayFormat := '###,###,##0.00';
   dm1.cdsAsientoS.first;
   While Not dm1.cdsAsientoS.eof Do
      dm1.cdsAsientoS.Delete;
  {CALCULAR salidas }
   vcia := '';
   vloc := '';
   valm := '';
   vart := '';
   vnisatip := '';
   vcuen := '';
   vtotald := 0;
   vtotals := 0;
   dm1.cdsEjecuta.First;
   While Not dm1.cdsEjecuta.eof Do
   Begin
      If (vcia <> TRIM(dm1.cdsEjecuta.fieldbyname('CIAID').AsString)) Or
         (vloc <> TRIM(dm1.cdsEjecuta.fieldbyname('LOCID').AsString)) Then
      Begin
         vcia := TRIM(dm1.cdsEjecuta.fieldbyname('CIAID').AsString);
         vloc := TRIM(dm1.cdsEjecuta.fieldbyname('LOCID').AsString);
         xsql := '';
         xsql := 'SELECT LOG315.CIAID, LOG315.LOCID, LOG315.ALMID, LOG315.TDAID,' +
            ' LOG315.ARTID, LOG315.NISATIP, LOG315.NISAID, LOG315.KDXID,' +
            ' ' + dm1.wReplacCeros + '(LOG315.ARTPVU,0.00) AS ARTPVU, ' + dm1.wReplacCeros + '(LOG315.ARTPVG,0.00) AS ARTPVG, LOG315.CUENTA2ID, LOG315.KDXCVTAS,' +
            ' TGE205.CUENTAID, LOG315.TMONID,LOG315.CCOSID' +
            ' FROM LOG315,TGE205' +
            ' WHERE LOG315.ARTID = TGE205.ARTID AND KDXANOMM=' + QUOTEDSTR(VANOMES) +
            ' AND LOG315.NISATIP=''SALIDA'' AND LOG315.CIAID=' + QUOTEDSTR(VCIA) +
            ' AND LOG315.LOCID=' + QUOTEDSTR(VLOC) +
            ' ORDER BY CIAID,LOCID,ALMID,NISATIP,CUENTA2ID,CUENTAID';
         dm1.cdsSQL1.Close;
         dm1.cdsSQL1.ProviderName := 'prvSQL1';
         dm1.cdsSQL1.DataRequest(xsql);
         dm1.cdsSQL1.open;
         dm1.cdsSQL1.first;
         vcuen := '';
         While Not dm1.cdsSQL1.eof Do
         Begin
            If vcuen <> TRIM(dm1.cdsSQL1.fieldbyname('CUENTAID').AsString) Then
            Begin
               dm1.cdsAsientoS.Insert;
               dm1.cdsAsientoS.fieldbyname('CIAID').AsString := dm1.cdsSQL1.fieldbyname('CIAID').AsString;
               dm1.cdsAsientoS.fieldbyname('LOCID').AsString := dm1.cdsSQL1.fieldbyname('LOCID').AsString;
               dm1.cdsAsientoS.fieldbyname('ALMID').AsString := dm1.cdsSQL1.fieldbyname('ALMID').AsString;
               dm1.cdsAsientoS.fieldbyname('ARTID').AsString := dm1.cdsSQL1.fieldbyname('ARTID').AsString;
               dm1.cdsAsientoS.fieldbyname('NISATIP').AsString := dm1.cdsSQL1.fieldbyname('NISATIP').AsString;
               dm1.cdsAsientoS.fieldbyname('TDAID').AsString := dm1.cdsSQL1.fieldbyname('TDAID').AsString;
               dm1.cdsAsientoS.fieldbyname('KDXID').AsString := dm1.cdsSQL1.fieldbyname('KDXID').AsString;
               dm1.cdsAsientoS.fieldbyname('CUENTAID').AsString := dm1.cdsSQL1.fieldbyname('CUENTAID').AsString;
               dm1.cdsAsientoS.fieldbyname('KDXCVTAS').AsString := dm1.cdsSQL1.fieldbyname('KDXCVTAS').AsString;
               dm1.cdsAsientoS.fieldbyname('ARTPVU').AsString := dm1.cdsSQL1.fieldbyname('ARTPVU').AsString;
               dm1.cdsAsientoS.fieldbyname('ARTPVG').AsString := dm1.cdsSQL1.fieldbyname('ARTPVG').AsString;
               If validaCL = 'C' Then
                  dm1.cdsAsientoS.fieldbyname('CUENTA').AsString := TRIM(dm1.cdsSQL1.fieldbyname('CUENTAID').AsString);
               If validaCL = 'L' Then
                  dm1.cdsAsientoS.fieldbyname('CUENTA').AsString := TRIM(dm1.cdsSQL1.fieldbyname('CUENTAID').AsString) + TRIM(vloc);
               dm1.cdsAsientoS.fieldbyname('CCOSID').AsString := TRIM(dm1.cdsSQL1.fieldbyname('CCOSID').AsString);
               dm1.cdsAsientoS.fieldbyname('TMONID').AsString := TRIM(dm1.cdsSQL1.fieldbyname('TMONID').AsString);
            End
            Else
               dm1.cdsAsientoS.Edit;
            If (vcuen <> TRIM(dm1.cdsSQL1.fieldbyname('CUENTAID').AsString)) Then
            Begin
               vcuen := TRIM(dm1.cdsSQL1.fieldbyname('CUENTAID').AsString);
               If dblcMoneda.text = DM1.wMonedaNac Then { soles (Moneda Nacional)}
                  If (dm1.cdsSQL1.fieldbyname('TMONID').AsString = dblcMoneda.text) Or (dm1.cdsSQL1.fieldbyname('TMONID').AsString = '') Then
                  Begin
                     vdebes := dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value;
                     vdebed := (dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value) / StrToFloat(dbeTipCam.text);
                  End
                  Else
                  Begin
                     vdebes := (dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value) * StrToFloat(dbeTipCam.text);
                     vdebed := dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value;
                  End;
               If dblcMoneda.text = DM1.wMonedaExt Then { dolares (Moneda Extranjera)}
                  If dm1.cdsSQL1.fieldbyname('TMONID').AsString = dblcMoneda.text Then
                  Begin
                     vdebed := dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value;
                     vdebes := (dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value) * StrToFloat(dbeTipCam.text);
                  End
                  Else
                  Begin
                     vdebed := (dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value) / StrToFloat(dbeTipCam.text);
                     vdebes := dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value;
                  End;
            End
            Else
            Begin
               If dblcMoneda.text = DM1.wMonedaNac Then { soles (Moneda Nacional)}
                  If (dm1.cdsSQL1.fieldbyname('TMONID').AsString = dblcMoneda.text) Or (dm1.cdsSQL1.fieldbyname('TMONID').AsString = '') Then
                  Begin
                     vdebes := vhabers + dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value;
                     vdebed := vhaberd + (dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value) / StrToFloat(dbeTipCam.text);
                  End
                  Else
                  Begin
                     vdebes := vhabers + (dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value) * StrToFloat(dbeTipCam.text);
                     vdebed := vhaberd + dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value;
                  End;
               If dblcMoneda.text = DM1.wMonedaExt Then { dolares (Moneda Extranjera)}
                  If dm1.cdsSQL1.fieldbyname('TMONID').AsString = dblcMoneda.text Then
                  Begin
                     vdebed := vhaberd + dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value;
                     vdebes := vhabers + (dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value) * StrToFloat(dbeTipCam.text);
                  End
                  Else
                  Begin
                     vdebed := vhaberd + (dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value) / StrToFloat(dbeTipCam.text);
                     vdebes := vhabers + dm1.cdsSQL1.fieldbyname('ARTPVU').value + dm1.cdsSQL1.fieldbyname('ARTPVG').value;
                  End;
            End;
            dm1.cdsAsientoS.fieldbyname('HABERS').value := 0.00;
            dm1.cdsAsientoS.fieldbyname('HABERD').value := 0.00;
            dm1.cdsAsientoS.fieldbyname('DEBES').value := vdebes;
            dm1.cdsAsientoS.fieldbyname('DEBED').value := vdebed;
            dm1.cdsAsientoS.fieldbyname('DH').value := 'D';
            dm1.cdsAsientoS.Post;
            dm1.cdsSQL1.next;
         End;
         dm1.cdsAsientoS.first;
         While Not dm1.cdsAsientoS.eof Do
         Begin
            vtotald := vtotald + dm1.cdsAsientoS.fieldbyname('DEBED').value;
            vtotals := vtotals + dm1.cdsAsientoS.fieldbyname('DEBES').value;
            dm1.cdsAsientoS.next;
         End;
         dm1.cdsAsientoS.Insert;
         dm1.cdsAsientoS.fieldbyname('CIAID').AsString := dm1.cdsSQL1.fieldbyname('CIAID').AsString;
         dm1.cdsAsientoS.fieldbyname('LOCID').AsString := dm1.cdsSQL1.fieldbyname('LOCID').AsString;
         dm1.cdsAsientoS.fieldbyname('ALMID').AsString := dm1.cdsSQL1.fieldbyname('ALMID').AsString;
         If validaCL = 'C' Then
            dm1.cdsAsientoS.fieldbyname('CUENTA').AsString := TRIM(dm1.cdsSQL1.fieldbyname('CUENTA2ID').AsString);
         If validaCL = 'L' Then
            dm1.cdsAsientoS.fieldbyname('CUENTA').AsString := TRIM(dm1.cdsSQL1.fieldbyname('CUENTA2ID').AsString) + TRIM(vloc);
         dm1.cdsAsientoS.fieldbyname('HABERD').value := vtotald;
         dm1.cdsAsientoS.fieldbyname('HABERS').value := vtotals;
         dm1.cdsAsientoS.fieldbyname('DEBED').value := '0';
         dm1.cdsAsientoS.fieldbyname('DEBES').value := '0';
         dm1.cdsAsientos.fieldbyname('DH').value := 'H';
         dm1.cdsAsientoS.Post;
         dm1.cdsEjecuta.next;
      End
      Else
         dm1.cdsEjecuta.next;
   End;
   dbgAsientoS.Selected.clear;
   dbgAsientoS.Selected.Add('CUENTA'#9'15'#9'Cuenta');
   If dblcMoneda.text = DM1.wMonedaNac Then { soles (Moneda Nacional)}
   Begin
      dbgAsientoS.Selected.Add('DEBES'#9'15'#9'Debe');
      dbgAsientoS.Selected.Add('HABERS'#9'15'#9'Haber');
   End;
   If dblcMoneda.text = DM1.wMonedaExt Then { dolares (Moneda Extranjera)}
   Begin
      dbgAsientoS.Selected.Add('DEBED'#9'15'#9'Debe');
      dbgAsientoS.Selected.Add('HABERD'#9'15'#9'Haber');
   End;
   dbgAsientoS.DataSource := dm1.dsAsientoS;
   dm1.cdsQry.EnableControls;
   pnlDetalle.enabled := true;
   pnlCabecera.enabled := false;
   Screen.Cursor := crDefault;
End;

Procedure TFGenAsi.bbGrabaClick(Sender: TObject);
Var
   sFecha, vprecio: String;
   vcia: String;
   ssql: String;
 // vcuentaid : string;
  //sfecha : string;
Begin
   Screen.Cursor := crHourGlass;
   vprecio := '';
   dm1.cdsTGE.DisableControls;
   dm1.cdsAsientoS.DisableControls;

   vcia := '';
  { client de la cabecera del Asiento (LOG321) }
   While Not dm1.cdsAsiento.eof Do
      dm1.cdsAsiento.delete;
   dm1.cdsTGE.First;
   While Not dm1.cdsTGE.eof Do
   Begin
      If vcia <> dm1.cdsTGE.fieldbyname('CIAID').AsString Then
         dm1.cdsAsiento.Insert
      Else
         dm1.cdsAsiento.Edit;
      vcia := dm1.cdsTGE.fieldbyname('CIAID').AsString;
      dm1.cdsAsiento.fieldbyname('CIAID').AsString := vcia;
      dm1.cdsAsiento.fieldbyname('TDIARID').AsString := dblcTipDir.text;
      dm1.cdsAsiento.fieldbyname('CNTCOMPROB').AsString := '99999'; {siempre}
      dm1.cdsAsiento.fieldbyname('CNTANOMM').AsString := vanomes;
      dm1.cdsAsiento.fieldbyname('CNTTCAMBIO').AsString := dbeTipCam.text;
      dm1.cdsAsiento.fieldbyname('CNTFCOMP').AsString := DateToStr(dtpFCambio.date);
      dm1.cdsAsiento.fieldbyname('CNTESTADO').AsString := 'P';
      dm1.cdsAsiento.fieldbyname('CNTCUADRE').AsString := 'S';
      dm1.cdsAsiento.fieldbyname('CNTFAUTOM').AsString := 'S';
      dm1.cdsAsiento.fieldbyname('CNTUSER').AsString := DM1.wUsuario;

      dm1.cdsAsiento.fieldbyname('CNTFREG').value := Now;
      dm1.cdsAsiento.fieldbyname('CNTHREG').value := Now;
    //** 15/03/2001 - pjsv
      sFecha := formatdatetime(dm1.wFormatFecha, dtpFCambio.DateTime);
      ssql := 'FECHA=' + quotedStr(sFecha);
    //**
      dm1.cdsAsiento.fieldbyname('CNTANO').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECANO', ssql, 'FECANO');
      dm1.cdsAsiento.fieldbyname('CNTMM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECMES', ssql, 'FECMES');
      dm1.cdsAsiento.fieldbyname('CNTDD').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECDIA', ssql, 'FECDIA');
      dm1.cdsAsiento.fieldbyname('CNTTRI').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECTRIM', ssql, 'FECTRIM');
      dm1.cdsAsiento.fieldbyname('CNTSEM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECSEM', ssql, 'FECSEM');
      dm1.cdsAsiento.fieldbyname('CNTSS').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECSS', ssql, 'FECSS');
      dm1.cdsAsiento.fieldbyname('CNTAATRI').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAATRI', ssql, 'FECAATRI');
      dm1.cdsAsiento.fieldbyname('CNTAASEM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAASEM', ssql, 'FECAASEM');
      dm1.cdsAsiento.fieldbyname('CNTAASS').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAASS', ssql, 'FECAASS');
      dm1.cdsAsiento.fieldbyname('TMONID').AsString := dblcMoneda.Text;
      ssql := '';
      ssql := 'TDIARID=' + quotedStr(dblcTipDir.Text);
      dm1.cdsAsiento.fieldbyname('TDIARDES').AsString := dm1.displaydescrip('prvTDiario', 'TGE104', 'TDIARDES', ssql, 'TDIARDES');
                                                                                                    //*
      dm1.cdsAsiento.fieldbyname('CNTDEBEMN').AsString := dm1.cdsTGE.fieldbyname('DEBES').AsString;
      dm1.cdsAsiento.fieldbyname('CNTDEBEME').AsString := dm1.cdsTGE.fieldbyname('DEBED').AsString;
      dm1.cdsAsiento.fieldbyname('CNTHABEMN').AsString := dm1.cdsTGE.fieldbyname('HABERS').AsString;
      dm1.cdsAsiento.fieldbyname('CNTHABEME').AsString := dm1.cdsTGE.fieldbyname('HABERD').AsString;
      dm1.cdsAsiento.fieldbyname('CNTTS').AsString := cbItemTCam.text;
      dm1.cdsAsiento.fieldbyname('CNTGLOSA').AsString := 'ASIENTO DE ALMACEN';
    //dm1.ControlTran;
      DM1.ControlTran(0, Nil, '');
    //dm1.cdsAsiento.post;
    //dm1.cdsAsiento.ApplyUpdates(0);
      dm1.cdsTGE.next;
   End;

   dm1.cdsAsientoS.First;
   While Not dm1.cdsAsientoS.eof Do
   Begin
      If vcia <> dm1.cdsAsientoS.fieldbyname('CIAID').AsString Then
         dm1.cdsAsiento.Insert
      Else
         dm1.cdsAsiento.Edit;
      vcia := dm1.cdsAsientoS.fieldbyname('CIAID').AsString;
      dm1.cdsAsiento.fieldbyname('CIAID').AsString := vcia;
      dm1.cdsAsiento.fieldbyname('TDIARID').AsString := dblcTipDir.text;
      dm1.cdsAsiento.fieldbyname('CNTCOMPROB').AsString := '99999'; {siempre}
      dm1.cdsAsiento.fieldbyname('CNTANOMM').AsString := vanomes;
      dm1.cdsAsiento.fieldbyname('CNTTCAMBIO').AsString := dbeTipCam.text;
      dm1.cdsAsiento.fieldbyname('CNTFCOMP').AsString := DateToStr(dtpFCambio.date);
      dm1.cdsAsiento.fieldbyname('CNTESTADO').AsString := 'P';
      dm1.cdsAsiento.fieldbyname('CNTCUADRE').AsString := 'S';
      dm1.cdsAsiento.fieldbyname('CNTFAUTOM').AsString := 'S';
      dm1.cdsAsiento.fieldbyname('CNTUSER').AsString := DM1.wUsuario;
  //    sfecha := '';
  //    sFecha := formatdatetime(dm1.wFormatFecha,Now);
      dm1.cdsAsiento.fieldbyname('CNTFREG').AsDateTime := now; //StrToDate(sFecha);
      dm1.cdsAsiento.fieldbyname('CNTHREG').AsDateTime := Now;
    //** 15/03/2001 - pjsv
      sFecha := formatdatetime(dm1.wFormatFecha, dtpFCambio.DateTime);
      ssql := 'FECHA=' + quotedStr(sFecha);
    //**
      dm1.cdsAsiento.fieldbyname('CNTANO').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECANO', ssql, 'FECANO');
      dm1.cdsAsiento.fieldbyname('CNTMM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECMES', ssql, 'FECMES');
      dm1.cdsAsiento.fieldbyname('CNTDD').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECDIA', ssql, 'FECDIA');
      dm1.cdsAsiento.fieldbyname('CNTTRI').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECTRIM', ssql, 'FECTRIM');
      dm1.cdsAsiento.fieldbyname('CNTSEM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECSEM', ssql, 'FECSEM');
      dm1.cdsAsiento.fieldbyname('CNTSS').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECSS', ssql, 'FECSS');
      dm1.cdsAsiento.fieldbyname('CNTAATRI').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAATRI', ssql, 'FECAATRI');
      dm1.cdsAsiento.fieldbyname('CNTAASEM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAASEM', ssql, 'FECAASEM');
      dm1.cdsAsiento.fieldbyname('CNTAASS').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAASS', ssql, 'FECAASS');
      dm1.cdsAsiento.fieldbyname('TMONID').AsString := dblcMoneda.Text;
      ssql := '';
      ssql := 'TDIARID=' + quotedStr(dblcTipDir.Text);
      dm1.cdsAsiento.fieldbyname('TDIARDES').AsString := dm1.displaydescrip('prvTDiario', 'TGE104', 'TDIARDES', ssql, 'TDIARDES');
      dm1.cdsAsiento.fieldbyname('CNTDEBEMN').AsString := dm1.cdsAsientoS.fieldbyname('DEBES').AsString;
      dm1.cdsAsiento.fieldbyname('CNTDEBEME').AsString := dm1.cdsAsientoS.fieldbyname('DEBED').AsString;
      dm1.cdsAsiento.fieldbyname('CNTHABEMN').AsString := dm1.cdsAsientoS.fieldbyname('HABERS').AsString;
      dm1.cdsAsiento.fieldbyname('CNTHABEME').AsString := dm1.cdsAsientoS.fieldbyname('HABERD').AsString;
      dm1.cdsAsiento.fieldbyname('CNTTS').AsString := cbItemTCam.text;
    //dm1.ControlTran;
      DM1.ControlTran(0, Nil, '');
    //dm1.cdsAsiento.post;
    //dm1.cdsAsiento.ApplyUpdates(0);
      dm1.cdsAsientoS.next;
   End;
  {graba detalle LOG322 }
   dm1.cdsDAsiento.first;
   While Not dm1.cdsDAsiento.Eof Do
      dm1.cdsDAsiento.delete;
  { por INGRESO}
   dm1.cdsTGE.first;
   While Not dm1.cdsTGE.eof Do
   Begin
      dm1.cdsDAsiento.insert;
      dm1.cdsDAsiento.fieldbyname('CIAID').AsString := vcia;
      dm1.cdsDAsiento.fieldbyname('TDIARID').AsString := dblcTipDir.text;
      dm1.cdsDAsiento.fieldbyname('CNTCOMPROB').AsString := '99999'; {siempre}
    //** 15/03/2001 - pjsv
      sFecha := formatdatetime(dm1.wFormatFecha, dtpFCambio.Date);
      ssql := 'FECHA=' + quotedStr(sFecha);
    //**
      dm1.cdsDAsiento.fieldbyname('CNTANO').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECANO', ssql, 'FECANO');
      dm1.cdsDAsiento.fieldbyname('CNTANOMM').AsString := vanomes;
      dm1.cdsDAsiento.fieldbyname('CUENTAID').AsString := dm1.cdsTGE.fieldbyname('CUENTA').AsString;
      ssql := '';
      ssql := 'CUENTAID=' + quotedstr(dm1.cdsTGE.fieldbyname('CUENTA').AsString);
      If dm1.DisplayDescrip('prvPCUENTA', 'TGE202', 'CTACLAUX', ssql, 'CTACLAUX') = '' Then
         dm1.cdsDAsiento.fieldbyname('CLAUXID').AsString := '99'
      Else
         dm1.cdsDAsiento.fieldbyname('CLAUXID').AsString := dm1.DisplayDescrip('prvPCUENTA', 'TGE202', 'CTACLAUX', ssql, 'CTACLAUX');
      If dm1.DisplayDescrip('prvPCUENTA', 'TGE202', 'CTA_AUX', ssql, 'CTA_AUX') = 'N' Then //*
         dm1.cdsDAsiento.fieldbyname('AUXID').AsString := '999999'
      Else
         dm1.cdsDAsiento.fieldbyname('AUXID').AsString := 'S';
      dm1.cdsDAsiento.fieldbyname('CNTGLOSA').AsString := 'ASIENTO ALMACENES INGRESO';
      dm1.cdsDAsiento.fieldbyname('CNTDH').AsString := dm1.cdsTGE.fieldbyname('DH').AsString;
      dm1.cdsDAsiento.fieldbyname('CCOSID').AsString := dm1.cdsTGE.fieldbyname('CCOSID').AsString;
      dm1.cdsDAsiento.fieldbyname('CNTTCAMBIO').AsString := dbeTipCam.text;
      If (dm1.cdsTGE.fieldbyname('ARTPCU').AsString = '0') Or (dm1.cdsTGE.fieldbyname('ARTPCU').AsString = '') Then
         vprecio := dm1.cdsTGE.fieldbyname('ARTPCG').AsString
      Else
         vprecio := dm1.cdsTGE.fieldbyname('ARTPCU').AsString;
      If vprecio = '' Then
         vprecio := '0';
      dm1.cdsDAsiento.fieldbyname('CNTMTOORI').AsString := vprecio; //dm1.cdsTGE.fieldbyname('ARTPCG').AsString
      If dm1.cdsTGE.fieldbyname('TMONID').AsString = DM1.wMonedaNac Then { soles (Moneda Nacional)}
      Begin
         dm1.cdsDAsiento.fieldbyname('CNTMTOLOC').AsString := vprecio;
         dm1.cdsDAsiento.fieldbyname('CNTMTOEXT').value := StrToInt(vprecio) / StrToFloat(dbeTipCam.text);
      End;
      If dm1.cdsTGE.fieldbyname('TMONID').AsString = DM1.wMonedaExt Then { dolares (Moneda Extranjera)}
      Begin
         dm1.cdsDAsiento.fieldbyname('CNTMTOLOC').AsString := vprecio;
         dm1.cdsDAsiento.fieldbyname('CNTMTOEXT').value := StrToInt(vprecio) * StrToFloat(dbeTipCam.text);
      End;
      dm1.cdsDAsiento.fieldbyname('CNTFEMIS').AsDateTime := dtpFCambio.DateTime; //StrToDate(sFecha);
      dm1.cdsDAsiento.fieldbyname('CNTFCOMP').AsDateTime := dtpFCambio.DateTime; //StrToDate(sFecha);
      dm1.cdsDAsiento.fieldbyname('CNTESTADO').AsString := 'I'; // siempre
      dm1.cdsDAsiento.fieldbyname('CNTCUADRE').AsString := 'S'; //seimpre
      dm1.cdsDAsiento.fieldbyname('CNTUSER').AsString := DM1.wUsuario;
      dm1.cdsDAsiento.fieldbyname('CNTFREG').AsDateTime := dtpFCambio.DateTime; //StrToDate(sFecha);
      dm1.cdsDAsiento.fieldbyname('CNTHREG').value := now;
    //** 15/03/2001 - pjsv
      sFecha := formatdatetime(dm1.wFormatFecha, dtpFCambio.Date);
      ssql := 'FECHA=' + quotedStr(sFecha);
    //**
      dm1.cdsDAsiento.fieldbyname('CNTMM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECMES', ssql, 'FECMES');
      dm1.cdsDAsiento.fieldbyname('CNTDD').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECDIA', ssql, 'FECDIA');
      dm1.cdsDAsiento.fieldbyname('CNTTRI').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECTRIM', ssql, 'FECTRIM');
      dm1.cdsDAsiento.fieldbyname('CNTSEM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECSEM', ssql, 'FECSEM');
      dm1.cdsDAsiento.fieldbyname('CNTSS').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECSS', ssql, 'FECSS');
      dm1.cdsDAsiento.fieldbyname('CNTAATRI').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAATRI', ssql, 'FECAATRI');
      dm1.cdsDAsiento.fieldbyname('CNTAASEM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAASEM', ssql, 'FECAASEM');
      dm1.cdsDAsiento.fieldbyname('CNTAASS').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAASS', ssql, 'FECAASS');
      dm1.cdsDAsiento.fieldbyname('TMONID').AsString := dblcMoneda.Text;
      ssql := '';
      ssql := 'TDIARID=' + quotedStr(dblcTipDir.Text);
      dm1.cdsDAsiento.fieldbyname('TDIARDES').AsString := dm1.displaydescrip('prvTDiario', 'TGE104', 'TDIARDES', ssql, 'TDIARDES');
      ssql := '';
      ssql := 'CUENTAID=' + quotedStr(dm1.cdsTGE.fieldbyname('CUENTA').AsString);
      dm1.cdsDAsiento.fieldbyname('CTADES').AsString := dm1.displaydescrip('prvPCUENTA', 'TGE202', 'CTADES', ssql, 'CTADES');
      dm1.cdsDAsiento.fieldbyname('CNTDEBEMN').AsString := dm1.cdsTGE.fieldbyname('DEBES').AsString;
      dm1.cdsDAsiento.fieldbyname('CNTDEBEME').AsString := dm1.cdsTGE.fieldbyname('DEBED').AsString;
      dm1.cdsDAsiento.fieldbyname('CNTHABEMN').AsString := dm1.cdsTGE.fieldbyname('HABERS').AsString;
      dm1.cdsDAsiento.fieldbyname('CNTHABEME').AsString := dm1.cdsTGE.fieldbyname('HABERD').AsString;
      dm1.cdsDAsiento.fieldbyname('CNTPAGADO').AsString := 'S'; // siempre
    //dm1.ControlTran;
      DM1.ControlTran(0, Nil, '');
    //dm1.cdsDAsiento.POST;
    //dm1.cdsDAsiento.ApplyUpdates(0);
      dm1.cdstge.Next;
   End;
  { por SALIDA}
   dm1.cdsAsientoS.first;
   While Not dm1.cdsAsientoS.eof Do
   Begin
      dm1.cdsDAsiento.insert;
      dm1.cdsDAsiento.fieldbyname('CIAID').AsString := vcia;
      dm1.cdsDAsiento.fieldbyname('TDIARID').AsString := dblcTipDir.text;
      dm1.cdsDAsiento.fieldbyname('CNTCOMPROB').AsString := '99999'; //siempre
    //** 15/03/2001 - pjsv
      sFecha := formatdatetime(dm1.wFormatFecha, dtpFCambio.Date);
      ssql := 'FECHA=' + quotedStr(sFecha);
    //**
      dm1.cdsDAsiento.fieldbyname('CNTANO').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECANO', ssql, 'FECANO');
      dm1.cdsDAsiento.fieldbyname('CNTANOMM').AsString := vanomes;
      dm1.cdsDAsiento.fieldbyname('CUENTAID').AsString := dm1.cdsAsientoS.fieldbyname('CUENTA').AsString;
      ssql := '';
      ssql := 'CUENTAID=' + quotedstr(dm1.cdsAsientoS.fieldbyname('CUENTA').AsString);
      If dm1.DisplayDescrip('prvPCUENTA', 'TGE202', 'CTACLAUX', ssql, 'CTACLAUX') = '' Then
         dm1.cdsDAsiento.fieldbyname('CLAUXID').AsString := '99'
      Else
         dm1.cdsDAsiento.fieldbyname('CLAUXID').AsString := dm1.DisplayDescrip('prvPCUENTA', 'TGE202', 'CTACLAUX', ssql, 'CTACLAUX');
      If dm1.DisplayDescrip('prvPCUENTA', 'TGE202', 'CTA_AUX', ssql, 'CTA_AUX') = 'N' Then
         dm1.cdsDAsiento.fieldbyname('AUXID').AsString := '999999'
      Else
         dm1.cdsDAsiento.fieldbyname('AUXID').AsString := 'S';
      dm1.cdsDAsiento.fieldbyname('CNTGLOSA').AsString := 'ASIENTO ALMACENES SALIDA';
      dm1.cdsDAsiento.fieldbyname('CNTDH').AsString := dm1.cdsAsientoS.fieldbyname('DH').AsString;
      dm1.cdsDAsiento.fieldbyname('CCOSID').AsString := dm1.cdsAsientoS.fieldbyname('CCOSID').AsString;
      dm1.cdsDAsiento.fieldbyname('CNTTCAMBIO').AsString := dbeTipCam.text;
      If (dm1.cdsAsientoS.fieldbyname('ARTPVU').AsString = '0') Or (dm1.cdsAsientoS.fieldbyname('ARTPVU').AsString = '') Then
         vprecio := dm1.cdsAsientoS.fieldbyname('ARTPVG').AsString
      Else
         vprecio := dm1.cdsAsientoS.fieldbyname('ARTPVU').AsString;
      If vprecio = '' Then
         vprecio := '0';
      dm1.cdsDAsiento.fieldbyname('CNTMTOORI').AsString := vprecio;
      If dm1.cdsAsientoS.fieldbyname('TMONID').AsString = DM1.wMonedaNac Then { soles (Moneda Nacional)}
      Begin
         dm1.cdsDAsiento.fieldbyname('CNTMTOLOC').AsString := vprecio;
         dm1.cdsDAsiento.fieldbyname('CNTMTOEXT').value := StrToInt(vprecio) / StrToFloat(dbeTipCam.text);
      End;
      If dm1.cdsAsientoS.fieldbyname('TMONID').AsString = DM1.wMonedaExt Then { dolares (Moneda Extranjera)}
      Begin
         dm1.cdsDAsiento.fieldbyname('CNTMTOLOC').AsString := vprecio;
         dm1.cdsDAsiento.fieldbyname('CNTMTOEXT').value := StrToInt(vprecio) * StrToFloat(dbeTipCam.text);
      End;
      dm1.cdsDAsiento.fieldbyname('CNTFEMIS').AsDateTime := dtpFCambio.DateTime; //strToDate(sFecha);
      dm1.cdsDAsiento.fieldbyname('CNTFCOMP').AsDateTime := dtpFCambio.DateTime; //strToDate(sFecha);
      dm1.cdsDAsiento.fieldbyname('CNTESTADO').AsString := 'I'; // siempre
      dm1.cdsDAsiento.fieldbyname('CNTCUADRE').AsString := 'S'; //seimpre
      dm1.cdsDAsiento.fieldbyname('CNTUSER').AsString := DM1.wUsuario;
      dm1.cdsDAsiento.fieldbyname('CNTFREG').AsDateTime := dtpFCambio.DateTime; //strToDate(sFecha);
      dm1.cdsDAsiento.fieldbyname('CNTHREG').value := now;
    //** 15/03/2001 - pjsv
      sFecha := formatdatetime(dm1.wFormatFecha, dtpFCambio.DateTime);
      ssql := 'FECHA=' + quotedStr(sFecha);
    //**
      dm1.cdsDAsiento.fieldbyname('CNTMM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECMES', ssql, 'FECMES');
      dm1.cdsDAsiento.fieldbyname('CNTDD').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECDIA', ssql, 'FECDIA');
      dm1.cdsDAsiento.fieldbyname('CNTTRI').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECTRIM', ssql, 'FECTRIM');
      dm1.cdsDAsiento.fieldbyname('CNTSEM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECSEM', ssql, 'FECSEM');
      dm1.cdsDAsiento.fieldbyname('CNTSS').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECSS', ssql, 'FECSS');
      dm1.cdsDAsiento.fieldbyname('CNTAATRI').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAATRI', ssql, 'FECAATRI');
      dm1.cdsDAsiento.fieldbyname('CNTAASEM').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAASEM', ssql, 'FECAASEM');
      dm1.cdsDAsiento.fieldbyname('CNTAASS').AsString := dm1.displaydescrip('prvPeriodo', 'TGE114', 'FECAASS', ssql, 'FECAASS');
      dm1.cdsDAsiento.fieldbyname('TMONID').AsString := dblcMoneda.Text;
      ssql := '';
      ssql := 'TDIARID=' + quotedStr(dblcTipDir.Text);
      dm1.cdsDAsiento.fieldbyname('TDIARDES').AsString := dm1.displaydescrip('prvTDiario', 'TGE104', 'TDIARDES', ssql, 'TDIARDES');
      ssql := '';
      ssql := 'CUENTAID=' + quotedStr(dm1.cdsAsientoS.fieldbyname('CUENTA').AsString);
      dm1.cdsDAsiento.fieldbyname('CTADES').AsString := dm1.displaydescrip('prvPCUENTA', 'TGE202', 'CTADES', ssql, 'CTADES');
      dm1.cdsDAsiento.fieldbyname('CNTDEBEMN').AsString := dm1.cdsAsientoS.fieldbyname('DEBES').AsString;
      dm1.cdsDAsiento.fieldbyname('CNTDEBEME').AsString := dm1.cdsAsientoS.fieldbyname('DEBED').AsString;
      dm1.cdsDAsiento.fieldbyname('CNTHABEMN').AsString := dm1.cdsAsientoS.fieldbyname('HABERS').AsString;
      dm1.cdsDAsiento.fieldbyname('CNTHABEME').AsString := dm1.cdsAsientoS.fieldbyname('HABERD').AsString;
      dm1.cdsDAsiento.fieldbyname('CNTPAGADO').AsString := 'S'; // siempre
    //dm1.ControlTran;
      DM1.ControlTran(0, Nil, '');
    //dm1.cdsDAsiento.POST;
    //dm1.cdsDAsiento.ApplyUpdates(0);
      dm1.cdsAsientoS.Next;
   End;
   dm1.cdsTGE.EnableControls;
   dm1.cdsAsientoS.EnableControls;
   bbGraba.Enabled := false;
   bbModi.Enabled := false;
   vcargacta := '';
   Screen.Cursor := crDefault;
End;

Procedure TFGenAsi.dblcCiaChange(Sender: TObject);
Var
   ssql: String;
Begin
   If dblcCia.text <> '' Then
   Begin
      dbeCia.Text := dm1.cdsCIA.fieldbyname('CIADES').asString;
      ssql := '';
      ssql := 'SELECT * FROM TGE126 WHERE CIAID=' + QUOTEDSTR(dblcCia.Text);
      dm1.cdsLOC.Close;
      dm1.cdsLOC.DataRequest(ssql);
      dm1.cdsLOC.Open;
//    dblcLoc.Text := dm1.cdsLOC.fieldbyname('LOCID').AsString;
   End
   Else
      dbeCia.Text := '';
End;

Procedure TFGenAsi.dblcCiaExit(Sender: TObject);
Begin
   If dblcCia.text = '' Then
   Begin
      errormsg('Error', 'Debe de escoger una Compañia');
      dblcCia.setfocus;
   End;
End;

Procedure TFGenAsi.dtpFCambioExit(Sender: TObject);
Begin
 { descodifica el date del sistema}
   If (dm1.strZero(dbseMes.text, 2) <> copy(DateTostr(dtpFCambio.date), 4, 2)) Or (dbseAnio.text <> copy(DateTostr(dtpFCambio.date), 7, 4)) Then
   Begin
      errormsg('Error', 'La fecha debe de estar dentro' + #13 + 'del Mes y Año del Período');
      dtpFCambio.setfocus;
      dtpFCambio.DateTime := date();
   End;
End;

Procedure TFGenAsi.bbModiClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   Limpia;
   vcargacta := '';
   pnlDetalle.enabled := false;
   pnlCabecera.enabled := True;
   Screen.Cursor := crDefault;
End;

Procedure TFGenAsi.Limpia;
Begin
   dm1.cdsTGE.first;
   While Not dm1.cdsTGE.eof Do
      dm1.cdsTGE.delete;
   dm1.cdsAsientoS.first;
   While Not dm1.cdsAsientoS.eof Do
      dm1.cdsAsientoS.delete;
End;

Procedure TFGenAsi.bbsalirClick(Sender: TObject);
Begin
   FGenAsi.Close;
End;

Procedure TFGenAsi.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   dm1.cdsTMoneda.Close; { tipo de moneda}
   dm1.cdsTRAN.Close; {transaccion}
   dm1.cdsKDX.Close; {detalle de mov. LOG315}
//  dm1.cdsCia.Close;     {compañia}
  //** 14/03/2001 - pjsv
  //dm1.cdsTDiario.Close; { tipo de diario}
  //*
   dm1.cdsAsiento.Close; { cabecera del asiento LOG321}
   dm1.cdsDAsiento.Close; { detalle del asiento LOG322 }
   dm1.cdsPeriodo.Close; { periodos, semestres, etc.. TGE114 }
End;

Procedure TFGenAsi.dblcMonedaExit(Sender: TObject);
Begin
   dbeTipCam.text := '';
   dbeMoneda.Text := dm1.cdsTMoneda.fieldbyname('TMONDES').AsString;
   JalaTipCam;
End;

//** 15/03/2001 - pjsv

Procedure TFGenAsi.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;
//**

End.

