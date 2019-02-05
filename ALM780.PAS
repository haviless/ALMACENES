Unit ALM780;

// HPC_201602_ALM 30/04/2016 Entrega a Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Mask, wwdbedit, Buttons, ExtCtrls, wwdblook;

Type
   TFToolArticulo = Class(TForm)
      pnl: TPanel;
      Z1bbtnArt: TBitBtn;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      lblCia: TLabel;
      dbeMes: TwwDBEdit;
      lblMes: TLabel;
      Label2: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      Label4: TLabel;
      dblcTIN: TwwDBLookupCombo;
      dbeTIN: TEdit;
      lblFecha: TLabel;
      Procedure Z1bbtnArtClick(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolArticulo: TFToolArticulo;

Implementation

{$R *.DFM}
Uses ALMDM1, ALM790;

Procedure TFToolArticulo.Z1bbtnArtClick(Sender: TObject);
Var
   xSQL: String;
   xDias: double;
   Y, M, D: word;
Begin
   If length(Trim(dblcCIA.text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Ingrese Compañia');
      Exit;
   End;

   If length(Trim(dbeCIA.text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Compañia inválida...');
      Exit;
   End;

   If length(Trim(dblcTIN.text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Ingrese Tipo de Inventario');
      Exit;
   End;

   If length(Trim(dbeTIN.text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Tipo de Inventario inválido...');
      Exit;
   End;

   If length(Trim(dbeMes.text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Nro. de meses inválido...');
      Exit;
   End;

   DecodeDate(Date, Y, M, D);
   xDias := strtofloat(dbeMes.text) * 30;
   Screen.Cursor := crhourGlass;
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      xSQL := ' SELECT '' '' FLAG,A.CIAID,A.TINID,A.GRARID,B.GRARDES,A.ARTID,A.ARTDES,A.UNMIDG,' +
         ' A.ARTFUMV,CASE WHEN A.ARTEST=''H'' THEN ''HABIL'' ELSE ''ANULADO'' END SITUACION, ' +
         ' A.ARTFADQ,A.ARTSPRO,'' '' MOSTRAR ' +
         ' FROM TGE205 A LEFT JOIN TGE131  B ON B.CIAID=A.CIAID AND B.TINID=A.TINID AND B.GRARID=A.GRARID' +
         ' WHERE A.CIAID=' + Quotedstr(dblcCIA.text) + ' AND A.TINID=' + Quotedstr(dblcTIN.text) +
         ' AND DAYS(CURRENT DATE)-DAYS(A.ARTFUMV)>=' + '' + Floattostr(xDias) + '' +
         ' AND COALESCE(A.ARTEST,'''')=''H'' ' +
         ' ORDER BY A.CIAID,A.GRARID,A.ARTID'
   Else
      If (SRV_D = 'ORACLE') Then
         xSQL := ' SELECT '' '' FLAG,A.CIAID,A.TINID,A.GRARID,B.GRARDES,A.ARTID,A.ARTDES,A.UNMIDG, A.ARTFUMV,' +
            ' CASE WHEN A.ARTEST=''H'' THEN ''HABIL'' ELSE ''ANULADO'' END SITUACION,  A.ARTFADQ,' +
            ' A.ARTSPRO,'' '' MOSTRAR ' +
            ' FROM TGE205 A ,TGE131 B ' +
            ' WHERE ' +
            ' B.CIAID=A.CIAID(+) AND B.TINID=A.TINID(+) AND B.GRARID=A.GRARID(+) ' +
            ' AND A.CIAID=' + Quotedstr(dblcCIA.text) + ' AND A.TINID=' + Quotedstr(dblcTIN.text) +
            ' AND  (TO_NUMBER(TO_CHAR(SYSDATE,''DD'')) - ' +
            ' TO_NUMBER(TO_CHAR(A.ARTFUMV,''DD'')) )>=' + '' + Floattostr(xDias) + '' +
            ' AND NVL(A.ARTEST,'''')=''H'' ' +
            ' ORDER BY A.CIAID,A.GRARID,A.ARTID  ';

   DM1.cdsQry4.IndexFieldNames := '';
   DM1.cdsQry4.Filter := '';
   DM1.cdsQry4.Filtered := false;
   DM1.cdsQry4.Close;
   DM1.cdsQry4.DataRequest(xSQL);
   DM1.cdsQry4.Open;

   xSQL := ' SELECT CIAID,TINID,GRARID,ARTID ' +
      ' FROM LOG316 ' +
      ' WHERE STKANO=' + Quotedstr(floattostr(Y)) +
      ' AND CIAID=' + Quotedstr(dblcCIA.text) + ' AND TINID=' + Quotedstr(dblcTIN.text) +
      ' AND ' + DM1.wReplacCeros + '(STKSACTG,0)+' + DM1.wReplacCeros + '(STKSACTU,0)=0 ';

   DM1.cdsQry6.IndexFieldNames := '';
   DM1.cdsQry6.Filter := '';
   DM1.cdsQry6.Filtered := false;
   DM1.cdsQry6.Close;
   DM1.cdsQry6.DataRequest(xSQL);
   DM1.cdsQry6.Open;
   DM1.cdsQry6.IndexFieldNames := 'CIAID;TINID;ARTID';

   DM1.cdsQry4.First;
   While Not DM1.cdsQry4.Eof Do
   Begin
      DM1.cdsQry6.SetKey;
      DM1.cdsQry6.FieldByName('CIAID').AsString := DM1.cdsQry4.FieldByName('CIAID').AsString;
      DM1.cdsQry6.FieldByName('TINID').AsString := DM1.cdsQry4.FieldByName('TINID').AsString;
      DM1.cdsQry6.FieldByName('ARTID').AsString := DM1.cdsQry4.FieldByName('ARTID').AsString;
      If DM1.cdsQry6.GotoKey Then
      Begin
         DM1.cdsQry4.Edit;
         DM1.cdsQry4.FieldByName('MOSTRAR').AsString := 'S';
         DM1.cdsQry4.Post;
      End
      Else
      Begin
         DM1.cdsQry4.Edit;
         DM1.cdsQry4.FieldByName('MOSTRAR').AsString := 'N';
         DM1.cdsQry4.Post;
      End;
      DM1.cdsQry4.Next;
   End;

   DM1.cdsQry4.Filtered := false;
   DM1.cdsQry4.Filter := 'MOSTRAR=''S''';
   DM1.cdsQry4.Filtered := true;

   Screen.Cursor := crDefault;
   If DM1.cdsQry4.RecordCount = 0 Then
      Raise exception.Create('no existen Datos a Mostrar');

   FArticulos := TFArticulos.create(self);
   FArticulos.visible := true;

End;

Procedure TFToolArticulo.dblcCIAExit(Sender: TObject);
Begin
   lblFecha.caption := datetostr((Date));
   dbeCia.text := DM1.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.text), 'CIADES');
End;

Procedure TFToolArticulo.dblcTINExit(Sender: TObject);
Begin
   dbeTIN.Text := DM1.cdsTINID.fieldbyname('TINDES').AsString;
End;

End.

