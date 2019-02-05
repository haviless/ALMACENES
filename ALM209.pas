Unit ALM209;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
   wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
   Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin, ppCtrls, ppBands,
   ppVar, ppStrtch, ppMemo, ppPrnabl, ppClass, ppProd, ppReport, ppComm,
   ppRelatv, ppCache, ppDB, ppDBPipe, ppViewr, Spin, MsgDlgs;

  //Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  //ExtCtrls, StdCtrls, wwdblook;

Type
   TFCierreAnual = Class(TForm)
      pnlBoton: TPanel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      dbgCierreAno: TwwDBGrid;
      chkInser: TCheckBox;
      pnlCab: TPanel;
      lblCia: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      BitBtn1: TBitBtn;
      Label1: TLabel;

      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcCIANotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure FormCreate(Sender: TObject);

   Private
    { Private declarations }
      Procedure ActSaldosAnual;
      Procedure InsertaCostoPromNuevoAnio;
      Procedure SQLCierreAnual;
   Public
    { Public declarations }
   End;

Var
   FCierreAnual: TFCierreAnual;
   sSQL, xSQL: String;

Implementation

//uses ALMDM1, ALM001;
Uses ALMDM1, oaIN3000;

{$R *.DFM}

{ TFCierreAnual }

Procedure TFCierreAnual.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFCierreAnual.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TDBMemo Then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCierreAnual.Z2bbtnRegCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFCierreAnual.Z2bbtnRegOkClick(Sender: TObject);
Var
   xCia, xLoc, xTin, xAlm, xAno: String;
Begin
   If Not Question(Caption, ' Este Proceso ' + #13 + #13 +
      ' Realiza el Cierre Anual de las opciones Seleccionadas ' + #13 + #13 +
      ' Desea Continuar ') Then
   Begin
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   DMALM.cdsClient.First;
   While Not DMALM.cdsClient.Eof Do
   Begin
      If (Length(Trim(DMALM.cdsClient.FieldByName('USUARIO').AsString)) = 0) And
         (DMALM.cdsClient.FieldByName('VBUENO').AsString = 'S') Then
      Begin
         xCia := QuotedStr(DMALM.cdsClient.FieldByname('CIAID').AsString);
         xLoc := QuotedStr(DMALM.cdsClient.FieldByname('LOCID').AsString);
         xTin := QuotedStr(DMALM.cdsClient.FieldByname('TINID').AsString);
         xAlm := QuotedStr(DMALM.cdsClient.FieldByname('ALMID').AsString);
         xAno := QuotedStr(DMALM.cdsClient.FieldByname('STKANO').AsString);
         Try
            ActSaldosAnual;
            InsertaCostoPromNuevoAnio;
            sSQL := 'INSERT INTO LOG329( '
               + 'CIAID, LOCID, TINID, ALMID, STKANOCIE, FCIERRE, HCIERRE, USUARIO) '
               + 'VALUES '
               + '(' + xCia + ', ' + xLoc + ', ' + xTin + ', ' + xAlm + ', ' + xAno + ', ' + DMALM.wRepFecServi + ', '
               + DMALM.wRepHorServi + ', ' + QuotedStr(DMALM.wUsuario) + ')';
            DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except

         End;
      End;
      DMALM.cdsClient.Next;
   End;

// refresca el grid del archivo de cierres que se ve en la pantalla
   SQLCierreAnual;

   Screen.Cursor := crDefault;
End;

Procedure TFCierreAnual.InsertaCostoPromNuevoAnio;
Var
   xSQL: String;
   xNueAno: integer;
Begin
   xNueAno := StrToInt(DMALM.cdsClient.FieldByname('STKANO').AsString) + 1;

   xSQL := ' INSERT INTO LOG330(CIAID,TINID,ARTID,STKANO) '
      + ' SELECT A.CIAID,A.TINID,A.ARTID ,' + Quotedstr(Floattostr(xNueAno))
      + ' FROM  LOG316 A '
      + ' WHERE ( A.STKANO=' + Quotedstr(Floattostr(xNueAno))
      + ' AND A.CIAID=' + Quotedstr(DMALM.cdsClient.FieldByname('CIAID').AsString)
      + ' AND A.TINID=' + Quotedstr(DMALM.cdsClient.FieldByname('TINID').AsString)
      + ' ) '
      + ' AND A.ARTID NOT IN( SELECT B.ARTID FROM LOG330  B '
      + ' WHERE  B.CIAID=' + Quotedstr(DMALM.cdsClient.FieldByname('CIAID').AsString)
      + ' AND B.TINID=' + Quotedstr(DMALM.cdsClient.FieldByname('TINID').AsString)
      + ' AND B.STKANO=' + Quotedstr(Floattostr(xNueAno))
      + ' AND B.ARTID=A.ARTID)';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

End;

Procedure TFCierreAnual.ActSaldosAnual;
Var
   wCia, wLoc, wTin, wAlm, wAno: String;
   wNueAno: Integer;
Begin
   wCia := QuotedStr(DMALM.cdsClient.FieldByname('CIAID').AsString);
   wLoc := QuotedStr(DMALM.cdsClient.FieldByname('LOCID').AsString);
   wTin := QuotedStr(DMALM.cdsClient.FieldByname('TINID').AsString);
   wAlm := QuotedStr(DMALM.cdsClient.FieldByname('ALMID').AsString);
   wAno := DMALM.cdsClient.FieldByname('STKANO').AsString;
   wNueAno := StrToInt(wAno) + 1;
   wAno := QuotedStr(wAno);

   If False Then
//   if chkInser.Checked = False then
   Begin
    // actualización de las articulos que se encuentran en la tabla se saldos
      sSQL := 'UPDATE LOG316 A SET (STKTSG01, STKTSU01, STKTMG01, STKTMU01, STKSACTG, STKSACTU) = ' +
         '(SELECT ' +
         DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)),' +
         DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), ' +
         DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), ' +
         DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)),' +
         DMALM.wReplacCeros + '(STKSACTG,0), ' + DMALM.wReplacCeros + '(STKSACTU,0)' +
         'FROM LOG316 B ' +
         'WHERE B.CIAID=A.CIAID ' +
         'AND B.LOCID=A.LOCID ' +
         'AND B.TINID=A.TINID ' +
         'AND B.ALMID=A.ALMID ' +
         'AND B.STKANO=' + wAno + ' ' +
         'AND B.ARTID=A.ARTID) ' +

      'WHERE EXISTS ( ' +
         'SELECT B.ARTID ' +
         'FROM LOG316 B ' +
         'WHERE B.CIAID=A.CIAID ' +
         'AND B.LOCID=A.LOCID ' +
         'AND B.TINID=A.TINID ' +
         'AND B.ALMID=A.ALMID ' +
         'AND B.STKANO=' + wAno + ' ' +
         'AND B.ARTID=A.ARTID )' +
         ' AND A.CIAID=' + wCia +
         ' AND A.LOCID=' + wLoc +
         ' AND A.TINID=' + wTin +
         ' AND A.ALMID=' + wAlm +
         ' AND A.STKANO=' + QuotedStr(InttoStr(wNueAno));
      Try
   //      DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
   End;

 // Insercion de las articulos que no se encuentran en la tabla se saldos
   sSQL := 'INSERT INTO LOG316 ( ' +
      'CIAID, LOCID, TINID, ALMID, STKANO, GRARID, FAMID, SFAMID, ARTID, ARTCONT, UNMIDG, UNMIDU, UBID, FABID, ARTSPRO, ' +
      'ARTSCA, ARTPARA, ARTSNA, ARTFUC, TMONID, ARTCRGO, ARTACTIVO, CUENTAID, STKSANTG, STKSANTU, STKMANTG, STKMANTU, ' +

   'STKTSG01, STKISG01, STKSSG01, STKTMG01, STKIMG01, STKSMG01, STKTSU01, STKISU01, STKSSU01, STKTMU01, STKIMU01, STKSMU01, ' +
      'STKTSG02, STKISG02, STKSSG02, STKTMG02, STKIMG02, STKSMG02, STKTSU02, STKISU02, STKSSU02, STKTMU02, STKIMU02, STKSMU02, ' +
      'STKTSG03, STKISG03, STKSSG03, STKTMG03, STKIMG03, STKSMG03, STKTSU03, STKISU03, STKSSU03, STKTMU03, STKIMU03, STKSMU03, ' +
      'STKTSG04, STKISG04, STKSSG04, STKTMG04, STKIMG04, STKSMG04, STKTSU04, STKISU04, STKSSU04, STKTMU04, STKIMU04, STKSMU04, ' +
      'STKTSG05, STKISG05, STKSSG05, STKTMG05, STKIMG05, STKSMG05, STKTSU05, STKISU05, STKSSU05, STKTMU05, STKIMU05, STKSMU05, ' +
      'STKTSG06, STKISG06, STKSSG06, STKTMG06, STKIMG06, STKSMG06, STKTSU06, STKISU06, STKSSU06, STKTMU06, STKIMU06, STKSMU06, ' +
      'STKTSG07, STKISG07, STKSSG07, STKTMG07, STKIMG07, STKSMG07, STKTSU07, STKISU07, STKSSU07, STKTMU07, STKIMU07, STKSMU07, ' +
      'STKTSG08, STKISG08, STKSSG08, STKTMG08, STKIMG08, STKSMG08, STKTSU08, STKISU08, STKSSU08, STKTMU08, STKIMU08, STKSMU08, ' +
      'STKTSG09, STKISG09, STKSSG09, STKTMG09, STKIMG09, STKSMG09, STKTSU09, STKISU09, STKSSU09, STKTMU09, STKIMU09, STKSMU09, ' +
      'STKTSG10, STKISG10, STKSSG10, STKTMG10, STKIMG10, STKSMG10, STKTSU10, STKISU10, STKSSU10, STKTMU10, STKIMU10, STKSMU10, ' +
      'STKTSG11, STKISG11, STKSSG11, STKTMG11, STKIMG11, STKSMG11, STKTSU11, STKISU11, STKSSU11, STKTMU11, STKIMU11, STKSMU11, ' +
      'STKTSG12, STKISG12, STKSSG12, STKTMG12, STKIMG12, STKSMG12, STKTSU12, STKISU12, STKSSU12, STKTMU12, STKIMU12, STKSMU12, ' +
      'STKSACTG, STKSACTU, STKMACTG, STKMACTU, STKSFISG, STKSFISU, STKSMAXG, STKSMING, STKSMAXU, STKSMINU, ' +
      'STKINV, STKPUPED, STKLOTEC, STKRACTG, STKRACTU, ARTDES ) ' +

   'SELECT ' +
      'A.CIAID, A.LOCID, A.TINID, A.ALMID, ' + QuotedStr(InttoStr(wNueAno)) + ', A.GRARID, A.FAMID, A.SFAMID, A.ARTID, A.ARTCONT, A.UNMIDG, A.UNMIDU, A.UBID, A.FABID, A.ARTSPRO, ' +
      'A.ARTSCA, A.ARTPARA, A.ARTSNA, A.ARTFUC, A.TMONID, A.ARTCRGO, A.ARTACTIVO, A.CUENTAID, A.STKSANTG, A.STKSANTU, A.STKMANTG, A.STKMANTU, ' +
      DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ';
   xSQL := DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ' +
      DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ' +
      DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ' +
      DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ' +
      DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ' +
      DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ' +
      DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ' +
      DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ' +
      DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ' +
      DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ' +
      DMALM.wReplacCeros + '(STKTSG12,0) + (' + DMALM.wReplacCeros + '(STKISG12,0) - ' + DMALM.wReplacCeros + '(STKSSG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMG12,0) + (' + DMALM.wReplacCeros + '(STKIMG12,0) - ' + DMALM.wReplacCeros + '(STKSMG12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTSU12,0) + (' + DMALM.wReplacCeros + '(STKISU12,0) - ' + DMALM.wReplacCeros + '(STKSSU12,0)), 0, 0, ' + DMALM.wReplacCeros + '(STKTMU12,0) + (' + DMALM.wReplacCeros + '(STKIMU12,0) - ' + DMALM.wReplacCeros + '(STKSMU12,0)), 0, 0, ' +

   DMALM.wReplacCeros + '(STKSACTG,0), ' + DMALM.wReplacCeros + '(STKSACTU,0), ' +
      DMALM.wReplacCeros + '(STKMACTG,0), ' + DMALM.wReplacCeros + '(STKMACTU,0), ' +
      '0, 0, 0, 0, 0, 0, ' +
      '''N'',  STKPUPED, STKLOTEC, STKRACTG, STKRACTU, ARTDES ' +
      'FROM LOG316 A ' +
      'WHERE A.CIAID=' + wCia +
      ' AND A.LOCID=' + wLoc +
      ' AND A.TINID=' + wTin +
      ' AND A.ALMID=' + wAlm +
      ' AND A.STKANO=' + wAno +
      ' AND A.ARTID NOT IN ( ' +
      'SELECT B.ARTID FROM LOG316 B ' +
      'WHERE B.CIAID=' + wCia +
      ' AND B.LOCID=' + wLoc +
      ' AND B.TINID=' + wTin +
      ' AND B.ALMID=' + wAlm +
      ' AND B.STKANO=' + QuotedStr(InttoStr(wNueAno)) +
      ' AND B.ARTID=A.ARTID)';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(sSQL + xSQL);
   Except
   End;

End;

// ------------------------------------------Anterior---------------------------------------------------
{procedure TFCierreAnual.ActSaldosAnual;
var
 sArt, xSQL, wCia, wLoc, wTin, wAlm, wAno : String;
  sDesde, sHasta : String;
  wNueAno : Integer;
  Contenido : Double;
begin
  wCia:=QuotedStr(DMALM.cdsClient.FieldByname('CIAID').AsString);
  wLoc:=QuotedStr(DMALM.cdsClient.FieldByname('LOCID').AsString);
  wTin:=QuotedStr(DMALM.cdsClient.FieldByname('TINID').AsString);
  wAlm:=QuotedStr(DMALM.cdsClient.FieldByname('ALMID').AsString);
  wAno:=DMALM.cdsClient.FieldByname('STKANO').AsString;
 wNueAno:=StrToInt(wAno)+1;
  wAno:=QuotedStr(wAno);
 // actualización de las articulos que se encuentran en la tabla se saldos
 sSQL := 'UPDATE LOG316 A SET (STKTSG01, STKTSU01, STKTMG01, STKTMU01, STKSACTG, STKSACTU) = '+
     '(SELECT '+
          'STKTSG12 + (STKISG12 - STKSSG12), STKTSU12 + (STKISU12 - STKSSU12), '+
          'STKTMG12 + (STKIMG12 - STKSMG12), STKTMU12 + (STKIMU12 - STKSMU12), STKSACTG, STKSACTU '+
     'FROM LOG316 B '+
     'WHERE B.CIAID=A.CIAID '+
     'AND B.LOCID=A.LOCID '+
     'AND B.TINID=A.TINID '+
     'AND B.ALMID=A.ALMID '+
     'AND B.STKANO='+wAno+' '+
     'AND B.ARTID=A.ARTID) '+
     'WHERE EXISTS ( '+
     'SELECT B.ARTID '+
     'FROM LOG316 B '+
     'WHERE B.CIAID=A.CIAID '+
     'AND B.LOCID=A.LOCID '+
     'AND B.TINID=A.TINID '+
     'AND B.ALMID=A.ALMID '+
     'AND B.STKANO='+wAno+' '+
     'AND B.ARTID=A.ARTID )'+
          ' AND A.CIAID='+wCia+
          ' AND A.LOCID='+wLoc+
          ' AND A.TINID='+wTin+
          ' AND A.ALMID='+wAlm+
     ' AND A.STKANO='+QuotedStr(InttoStr(wNueAno));
  Try
  DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
  Except
  end;
 // Insercion de las articulos que no se encuentran en la tabla se saldos
 sSQL := 'INSERT INTO LOG316 ( '+
      'CIAID, LOCID, TINID, ALMID, STKANO, GRARID, FAMID, SFAMID, ARTID, ARTCONT, UNMIDG, UNMIDU, UBID, FABID, ARTSPRO, '+
          'ARTSCA, ARTPARA, ARTSNA, ARTFUC, TMONID, ARTCRGO, ARTACTIVO, CUENTAID, STKSANTG, STKSANTU, STKMANTG, STKMANTU, '+
          'STKTSG01, STKISG01, STKSSG01, STKTMG01, STKIMG01, STKSMG01, STKTSU01, STKISU01, STKSSU01, STKTMU01, STKIMU01, STKSMU01, '+
          'STKTSG02, STKISG02, STKSSG02, STKTMG02, STKIMG02, STKSMG02, STKTSU02, STKISU02, STKSSU02, STKTMU02, STKIMU02, STKSMU02, '+
          'STKTSG03, STKISG03, STKSSG03, STKTMG03, STKIMG03, STKSMG03, STKTSU03, STKISU03, STKSSU03, STKTMU03, STKIMU03, STKSMU03, '+
          'STKTSG04, STKISG04, STKSSG04, STKTMG04, STKIMG04, STKSMG04, STKTSU04, STKISU04, STKSSU04, STKTMU04, STKIMU04, STKSMU04, '+
          'STKTSG05, STKISG05, STKSSG05, STKTMG05, STKIMG05, STKSMG05, STKTSU05, STKISU05, STKSSU05, STKTMU05, STKIMU05, STKSMU05, '+
          'STKTSG06, STKISG06, STKSSG06, STKTMG06, STKIMG06, STKSMG06, STKTSU06, STKISU06, STKSSU06, STKTMU06, STKIMU06, STKSMU06, '+
          'STKTSG07, STKISG07, STKSSG07, STKTMG07, STKIMG07, STKSMG07, STKTSU07, STKISU07, STKSSU07, STKTMU07, STKIMU07, STKSMU07, '+
          'STKTSG08, STKISG08, STKSSG08, STKTMG08, STKIMG08, STKSMG08, STKTSU08, STKISU08, STKSSU08, STKTMU08, STKIMU08, STKSMU08, '+
          'STKTSG09, STKISG09, STKSSG09, STKTMG09, STKIMG09, STKSMG09, STKTSU09, STKISU09, STKSSU09, STKTMU09, STKIMU09, STKSMU09, '+
          'STKTSG10, STKISG10, STKSSG10, STKTMG10, STKIMG10, STKSMG10, STKTSU10, STKISU10, STKSSU10, STKTMU10, STKIMU10, STKSMU10, '+
          'STKTSG11, STKISG11, STKSSG11, STKTMG11, STKIMG11, STKSMG11, STKTSU11, STKISU11, STKSSU11, STKTMU11, STKIMU11, STKSMU11, '+
          'STKTSG12, STKISG12, STKSSG12, STKTMG12, STKIMG12, STKSMG12, STKTSU12, STKISU12, STKSSU12, STKTMU12, STKIMU12, STKSMU12, '+
          'STKSACTG, STKSACTU, STKMACTG, STKMACTU, STKSFISG, STKSFISU, STKSMAXG, STKSMING, STKSMAXU, STKSMINU, '+
          'STKINV, STKPUPED, STKLOTEC, STKRACTG, STKRACTU, ARTDES ) '+
     'SELECT '+
          'A.CIAID, A.LOCID, A.TINID, A.ALMID, '+QuotedStr(InttoStr(wNueAno))+', A.GRARID, A.FAMID, A.SFAMID, A.ARTID, A.ARTCONT, A.UNMIDG, A.UNMIDU, A.UBID, A.FABID, A.ARTSPRO, '+
          'A.ARTSCA, A.ARTPARA, A.ARTSNA, A.ARTFUC, A.TMONID, A.ARTCRGO, A.ARTACTIVO, A.CUENTAID, A.STKSANTG, A.STKSANTU, A.STKMANTG, A.STKMANTU, '+
          'STKTSG12 + (STKISG12 - STKSSG12), 0, 0, STKTMG12 + (STKIMG12 - STKSMG12), 0, 0, STKTSU12 + (STKISU12 - STKSSU12), 0, 0, STKTMU12 + (STKIMU12 - STKSMU12), 0, 0, '+
          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '+
          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '+
          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '+
          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '+
          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '+
          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '+
          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '+
          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '+
          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '+
          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '+
          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '+
          'STKSACTG, STKSACTU, 0, 0, 0, 0, 0, 0, 0, 0, '+
          '''N'',  STKPUPED, STKLOTEC, STKRACTG, STKRACTU, ARTDES '+
          'FROM LOG316 A '+
          'WHERE A.CIAID='+wCia+
          ' AND A.LOCID=' +wLoc+
          ' AND A.TINID=' +wTin+
          ' AND A.ALMID=' +wAlm+
          ' AND A.STKANO='+wAno+
          ' AND A.ARTID NOT IN ( '+
          'SELECT B.ARTID FROM LOG316 B '+
          'WHERE B.CIAID='+wCia+
          ' AND B.LOCID=' +wLoc+
          ' AND B.TINID=' +wTin+
          ' AND B.ALMID=' +wAlm+
          ' AND B.STKANO='+QuotedStr(InttoStr(wNueAno))+
          ' AND B.ARTID=A.ARTID)';
  Try
  DMALM.DCOM1.AppServer.EjecutaSQL(sSQL);
  Except
  end;

  xSQL := 'SELECT * FROM LOG316 '+
          'WHERE CIAID='+wCia+
          ' AND LOCID=' +wLoc+
          ' AND TINID=' +wTin+
          ' AND ALMID=' +wAlm+
          ' AND STKANO='+QuotedStr(InttoStr(wNueAno));
 DMALM.cdsSTK.close;
 DMALM.cdsSTK.DataRequest(xSQL);
 DMALM.cdsSTK.Open;
 DMALM.cdsSTK.IndexFieldNames:='STKANO;CIAID;LOCID;TINID;ALMID;ARTID';

  sDesde   :=quotedStr(formatdatetime(DMALM.wFormatFecha,StrToDate('01/01/'+InttoStr(wNueAno))));
 sHasta   :=quotedStr(formatdatetime(DMALM.wFormatFecha,StrtoDate('31/01/'+InttoStr(wNueAno))));

 xSQL := 'SELECT * FROM LOG315 WHERE NISAFREG>='+sDesde+' AND NISAFREG<='+sHasta+' AND '+DMALM.wReplacCeros+'(NISSIT,''S'')<>''INICIAL''';

  DMALM.cdsKdx.close;
  DMALM.cdsKdx.DataRequest(xSQL);
  DMALM.cdsKdx.Open;
  DMALM.cdsKdx.IndexFieldNames:='ARTID;NISAFREG;NISATIP';

  DMALM.cdsKDX.first;
  while not DMALM.cdsKDX.Eof do
  begin
    sArt := DMALM.cdsKDX.FieldByName('ARTID').AsString;
    xSQL:='SELECT ARTID, ARTCONT, ARTMNTG, ARTMNTU, ARTFUPRC, ARTCNTG, '
         +'ARTCNTU, ARTCPROG, ARTCPROU, ARTPCU, ARTPCG, ARTFUMV, ARTFUC '
         +'FROM TGE205 '
         +'WHERE CIAID='+quotedstr(wCIA)+' AND ARTID='+quotedstr(sART)+' AND TINID='+quotedstr(wTIN);
    DMALM.cdsArtiStk.Close;
    DMALM.cdsArtiStk.DataRequest(xSQL);
    DMALM.cdsArtiStk.Open;
    if DMALM.cdsArtiStk.RecordCount = 1 then
    begin
      Contenido := DMALM.cdsArtiStk.FieldByName('ARTCONT').AsFloat;
      DMALM.SaldosIniciales(wCIA, sArt, InttoStr(wNueAno)+'01', Contenido, DMALM.cdsArtiStk.fieldbyname('ARTCPROG').AsFloat);
      DMALM.ControlTran;
    end;
    DMALM.cdsKDX.next;
  end;
end;}

Procedure TFCierreAnual.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
   //SQLCierreAnual;
End;

Procedure TFCierreAnual.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   //FVariables.w_IN_Registro := False;
   Action := CAFree;
End;

Procedure TFCierreAnual.SQLCierreAnual;
Begin
   sSQL := 'SELECT DISTINCT A.CIAID, A.LOCID, A.TINID, A.ALMID, STKANO, '
      + 'B.*, '' '' VBUENO, D.TINDES, C.ALMDES '
      + 'FROM LOG316 A, LOG329 B, TGE151 C, TGE152 D '
      + 'WHERE A.CIAID=''' + dblcCia.Text + ''' '
      + '  and A.CIAID=B.CIAID(+) '
      + '  AND A.LOCID=B.LOCID(+) '
      + '  AND A.TINID=B.TINID(+) '
      + '  AND A.ALMID=B.ALMID(+) '
      + '  AND A.STKANO=B.STKANOCIE(+) '
      + '  AND A.CIAID=C.CIAID(+) AND A.LOCID=C.LOCID(+) AND A.TINID=C.TINID(+) '
      + '  AND A.ALMID=C.ALMID(+) '
      + '  AND A.CIAID=D.CIAID(+) AND A.TINID=D.TINID(+) ';
   DMALM.cdsClient.Close;
   DMALM.cdsClient.DataRequest(sSQL);
   DMALM.cdsClient.Open;
   DMALM.cdsClient.IndexFieldNames := 'STKANO;CIAID;LOCID;TINID;ALMID';

   dbgCierreAno.DataSource := DMALM.dsClient;
   dbgCierreAno.Selected.Clear;
   dbgCierreAno.Selected.Add('CIAID'#9'4'#9'Cia'#9'T');
   dbgCierreAno.Selected.Add('LOCID'#9'4'#9'Loc'#9'T');
   dbgCierreAno.Selected.Add('TINID'#9'4'#9'T. Inv.'#9'T');
   dbgCierreAno.Selected.Add('ALMID'#9'4'#9'Alm.'#9'T');
   dbgCierreAno.Selected.Add('STKANO'#9'6'#9'Año'#9'T');
   dbgCierreAno.Selected.Add('FCIERRE'#9'18'#9'Fecha~Cierre'#9'T');
   dbgCierreAno.Selected.Add('HCIERRE'#9'18'#9'Hora~Cierre'#9'T');
   dbgCierreAno.Selected.Add('USUARIO'#9'20'#9'Usuario'#9'T');
   dbgCierreAno.Selected.Add('VBUENO'#9'5'#9'Check'#9'F');

End;

Procedure TFCierreAnual.dblcCIAExit(Sender: TObject);
Begin
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.Text), 'CIADES');
End;

Procedure TFCierreAnual.dblcCIANotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFCierreAnual.BitBtn1Click(Sender: TObject);
Begin
   SQLCierreAnual;
End;

Procedure TFCierreAnual.FormCreate(Sender: TObject);
Begin
   If DMALM.cdsCia.Active = False Then
      FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');

End;

End.

