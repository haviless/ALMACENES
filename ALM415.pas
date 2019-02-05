Unit ALM415;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, DB, Grids, Wwdbigrd, Wwdbgrid, ppCtrls,
   ppVar, ppPrnabl, ppClass, ppDB, ppBands, ppCache, ppDBPipe, ppComm,
   ppRelatv, ppProd, ppReport, ppViewr, wwdblook, MsgDlgs;

Type
   TFToolConAnno = Class(TForm)
      pnlTool: TPanel;
      pnlCabecera: TPanel;
      bbtOk: TBitBtn;
      Label1: TLabel;
      dblcCia: TwwDBLookupCombo;
      Label2: TLabel;
      dblcGrpArti: TwwDBLookupCombo;
      rgPeriodo: TRadioGroup;
      Label3: TLabel;
      dblcLocalidad: TwwDBLookupCombo;
      Label4: TLabel;
      dblcTipInv: TwwDBLookupCombo;
      Timer1: TTimer;
      Procedure FormActivate(Sender: TObject);
      Procedure bbtOkClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcTipInvExit(Sender: TObject);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      sWhere: String;
   End;

Var
   FToolConAnno: TFToolConAnno;
   xAccesoBotones: Boolean;

Implementation
Uses oaIN4000, ALMDM1;

{$R *.DFM}

Procedure TFToolConAnno.FormActivate(Sender: TObject);
Begin
   dblcCia.SetFocus;
End;

Procedure TFToolConAnno.bbtOkClick(Sender: TObject);
Var
   scad3: String;
   nAno: Integer;
Begin
   DecodeDate(Date, Y, M, D);
   If dblcCia.text = '' Then
   Begin
      ErrorMsg(Caption, ' Debe Escoger una Compañia ');
      dblcCia.SetFocus;
      exit;
   End;

   If dblcLocalidad.text = '' Then
   Begin
      ErrorMsg(Caption, ' Debe Escoger una Localidad ');
      dblcLocalidad.SetFocus;
      exit;
   End;

   If dblcTipInv.text = '' Then
   Begin
      ErrorMsg(Caption, ' Debe Escoger un Tipo de Inventario ');
      dblcTipInv.SetFocus;
      exit;
   End;

   If dblcGrpArti.text = '' Then
   Begin
      ErrorMsg(Caption, ' Debe Escoger una Linea ó Grupo ');
      dblcGrpArti.SetFocus;
      exit;
   End;

   sWhere := ' AND NISATIP=''SALIDA'' '
      + ' AND LOG315.CIAID=' + quotedStr(dblcCia.text)
      + ' AND LOG315.TINID=' + quotedStr(dblcTipInv.text);

   If dblcLocalidad.text <> '' Then
      sWhere := sWhere + ' AND LOG315.LOCID=' + quotedStr(dblcLocalidad.text);

   If dblcGrpArti.text <> '' Then
      sWhere := sWhere + ' AND LOG315.GRARID=' + quotedStr(dblcGrpArti.text);

   If rgPeriodo.ItemIndex = 1 Then //Mensual
   Begin
      scad3 := 'SELECT 0 ANO_4,' //A' + IntToStr(Y)+', '
         + '       0 ANO_3,' //A' + IntToStr(Y - 1)+', '
         + '       0 ANO_2,' //A' + IntToStr(Y - 2)+', '
         + '       0 ANO_1,' //A' + IntToStr(Y - 3)+', '
         + '       ARTID ARTICULO, '
         + '       ARTDES DESCRIPCION, '
         + '       UNMIDG, '
         + '       UNMGDES U_MEDIDA, '
         + '       UNMIDU, UNMUDES, '
         + '       SUM(ENE) ENE, SUM(FEB) FEB, SUM(MAR) MAR, SUM(ABR) ABR, '
         + '       SUM(MAY) MAY, SUM(JUN) JUN, SUM(JUL) JUL, SUM(AGO) AGO, '
         + '       SUM(SEPT) SEPT, SUM(OCT) OCT, SUM(NOV) NOV, SUM(DIC) DIC '
         + '  FROM (SELECT ARTID, ARTDES, UNMIDG, UG.UNMDES UNMGDES, UNMIDU, '
         + '               UU.UNMDES UNMUDES, '
         + '               CASE WHEN KDXMM=''01'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END ENE, '
         + '               CASE WHEN KDXMM=''02'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END FEB, '
         + '               CASE WHEN KDXMM=''03'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END MAR, '
         + '               CASE WHEN KDXMM=''04'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END ABR, '
         + '               CASE WHEN KDXMM=''05'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END MAY, '
         + '               CASE WHEN KDXMM=''06'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END JUN, '
         + '               CASE WHEN KDXMM=''07'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END JUL, '
         + '               CASE WHEN KDXMM=''08'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END AGO, '
         + '               CASE WHEN KDXMM=''09'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END SEPT, '
         + '               CASE WHEN KDXMM=''10'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END OCT, '
         + '               CASE WHEN KDXMM=''11'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END NOV, '
         + '               CASE WHEN KDXMM=''12'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END DIC '
         + '          FROM LOG315,TGE130 UU, TGE130 UG '
         + '         WHERE (LOG315.UNMIDU=UU.UNMID(+)) AND (LOG315.UNMIDG=UG.UNMID(+)) '
         + sWhere
         + '           AND KDXANO=' + quotedStr(IntToStr(Y))
         + '         GROUP BY ARTID,ARTDES,UNMIDG,UG.UNMDES,UNMIDU,UU.UNMDES,KDXMM) X '
         + ' GROUP BY ARTID,ARTDES,UNMIDG,UNMGDES,UNMIDU,UNMUDES ';
   End
   Else //Anual
   Begin
      nAno := 4;
      scad3 := 'SELECT 0 ENE, 0 FEB, 0 MAR, 0 ABR, 0 MAY, 0 JUN, 0 JUL, 0 AGO, '
         + '       0 SEPT, 0 OCT, 0 NOV, 0 DIC, '
         + '       ARTID ARTICULO, ARTDES DESCRIPCION, UNMIDG, UNMGDES U_MEDIDA, '
         + '       UNMIDU, UNMUDES, '
         + '       SUM(A1) ANO_' + IntToStr(nAno) + ','
         + '       SUM(A2) ANO_' + IntToStr(nAno - 1) + ','
         + '       SUM(A3) ANO_' + IntToStr(nAno - 2) + ','
         + '       SUM(A4) ANO_' + IntToStr(nAno - 3)
         + '  FROM (SELECT ARTID, ARTDES, UNMIDG, UG.UNMDES UNMGDES, UNMIDU, '
         + '               UU.UNMDES UNMUDES, '
         + '               CASE WHEN KDXANO=' + quotedStr(IntToStr(Y)) + '   THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A1, '
         + '               CASE WHEN KDXANO=' + quotedStr(IntToStr(Y - 1)) + ' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A2, '
         + '               CASE WHEN KDXANO=' + quotedStr(IntToStr(Y - 2)) + ' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A3, '
         + '               CASE WHEN KDXANO=' + quotedStr(IntToStr(Y - 3)) + ' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A4 '
         + '          FROM LOG315,TGE130 UU,TGE130 UG '
         + '         WHERE (LOG315.UNMIDU=UU.UNMID(+)) AND (LOG315.UNMIDG=UG.UNMID(+)) ' + sWhere
         + '           AND KDXANO<=' + quotedStr(IntToStr(Y))
         + '           AND KDXANO>=' + quotedStr(IntToStr(Y - 3))
         + '         GROUP BY ARTID,ARTDES,UNMIDG,UG.UNMDES,UNMIDU,UU.UNMDES,KDXANO) X '
         + ' GROUP BY ARTID,ARTDES,UNMIDG,UNMGDES,UNMIDU,UNMUDES';
   End;

   Mtx4000.NoVisible.Clear;
   If rgPeriodo.ItemIndex = 0 Then
   Begin
      Mtx4000.NoVisible.Add('ENE');
      Mtx4000.NoVisible.Add('FEB');
      Mtx4000.NoVisible.Add('MAR');
      Mtx4000.NoVisible.Add('ABR');
      Mtx4000.NoVisible.Add('MAY');
      Mtx4000.NoVisible.Add('JUN');
      Mtx4000.NoVisible.Add('JUL');
      Mtx4000.NoVisible.Add('AGO');
      Mtx4000.NoVisible.Add('SEPT');
      Mtx4000.NoVisible.Add('OCT');
      Mtx4000.NoVisible.Add('NOV');
      Mtx4000.NoVisible.Add('DIC');
      Mtx4000.NoVisible.Add('UNMIDG');
      Mtx4000.NoVisible.Add('UNMIDU');
      Mtx4000.NoVisible.Add('UNMUDES');
   End
   Else
   Begin
    //Mtx4000.NoVisible.Add('A'+IntToStr(Y));
    //Mtx4000.NoVisible.Add('A'+IntToStr(Y-1));
    //Mtx4000.NoVisible.Add('A'+IntToStr(Y-2));
    //Mtx4000.NoVisible.Add('A'+IntToStr(Y-3));
      Mtx4000.NoVisible.Add('ANO_4'); // + IntToStr(nAno));
      Mtx4000.NoVisible.Add('ANO_3'); // + IntToStr(nAno - 1));
      Mtx4000.NoVisible.Add('ANO_2'); // + IntToStr(nAno - 2));
      Mtx4000.NoVisible.Add('ANO_1'); // + IntToStr(nAno - 3));
      Mtx4000.NoVisible.Add('UNMIDG');
      Mtx4000.NoVisible.Add('UNMIDU');
      Mtx4000.NoVisible.Add('UNMUDES');
   End;

   Mtx4000.UsuarioSQL.Clear;
   Mtx4000.UsuarioSQL.Add(scad3);
   Mtx4000.NewQuery;

   Mtx4000.RefreshDisplay;
End;

Procedure TFToolConAnno.dblcCiaExit(Sender: TObject);
Begin
   DMALM.cdsLOC.Filtered := False;
   DMALM.cdsLOC.Filter := 'CIAID=''' + dblcCIA.Text + '''';
   DMALM.cdsLOC.Filtered := True;

   DMALM.cdsTINID.Filtered := False;
   DMALM.cdsTINID.Filter := 'CIAID=''' + dblcCIA.Text + '''';
   DMALM.cdsTINID.Filtered := True;
End;

Procedure TFToolConAnno.dblcTipInvExit(Sender: TObject);
Begin
   DMALM.cdsGArti.Filtered := False;
   DMALM.cdsGArti.Filter := 'CIAID=' + quotedStr(dblcCIA.Text) + ' AND TINID=' + quotedStr(dblcTipInv.Text);
   DMALM.cdsGArti.Filtered := True;
End;

Procedure TFToolConAnno.dblcNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFToolConAnno.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolConAnno';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FToolConAnno);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

End.

