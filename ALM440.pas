Unit ALM440;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, wwdblook, ExtCtrls, Spin, Mask, wwdbedit,
   Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, Mant;

Type
   TFConsumoAnualCCos = Class(TForm)
      pnl1: TPanel;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      Z2bbtnAcepta: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      lblTInv: TLabel;
      dblcTIN: TwwDBLookupCombo;
      edtTIN: TEdit;
      lblAlm: TLabel;
      dblcTALM: TwwDBLookupCombo;
      edtALM: TEdit;
      lblAno: TLabel;
      speAno: TSpinEdit;
      rgNivelConsulta: TRadioGroup;
      rgArticulos: TRadioGroup;
      Procedure FormCreate(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure rgNivelConsultaClick(Sender: TObject);
      Procedure dblcTINEnter(Sender: TObject);
      Procedure dblcTALMEnter(Sender: TObject);
      Procedure dblcCiaEnter(Sender: TObject);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FConsumoAnualCCos: TFConsumoAnualCCos;

Implementation

Uses ALMDM1;

{$R *.dfm}

Procedure TFConsumoAnualCCos.FormCreate(Sender: TObject);
Var
   wAno, wMes, wDia: Word;
Begin
// Compañía
   dblcCIA.LookupTable := DMALM.cdsCIA;
   dblcCIA.LookupField := 'CIAID';
// Tipo de Inventario
   dblcTIN.LookupTable := DMALM.cdsTINID;
   dblcTIN.LookupField := 'TINID';
// Almacén
   dblcTALM.LookupTable := DMALM.cdsALM;
   dblcTALM.LookupField := 'ALMID';
// Año de la fecha del Servidor
   decodedate(DateS, wAno, wMes, wDia);
   speAno.Value := wAno;
// Parámetros de la Consulta
   rgNivelConsulta.ItemIndex := 0;
// Datos de los Artículos
   rgArticulos.Visible := False;
End;

Procedure TFConsumoAnualCCos.dblcCiaExit(Sender: TObject);
Begin
   If Z2bbtnCanc2.Focused Then Exit;

   If DMALM.cdsCIA.IndexFieldNames <> 'CIAID' Then
      DMALM.cdsCIA.IndexFieldNames := 'CIAID';

   DMALM.cdsCIA.SetKey;
   DMALM.cdsCIA.FieldByName('CIAID').AsString := dblcCia.Text;
   If Not DMALM.cdsCIA.GotoKey Then
   Begin
      ShowMessage('Codigo digitado no está en la relación de Compañías, reintente');
      dblcCia.SetFocus;
      exit;
   End;
   edtCia.Text := DMALM.cdsCIA.FieldByName('CIADES').AsString;
End;

Procedure TFConsumoAnualCCos.dblcTINExit(Sender: TObject);
Begin
   If Z2bbtnCanc2.Focused Then Exit;

   If DMALM.cdsTINID.IndexFieldNames <> 'TINID' Then
      DMALM.cdsTINID.IndexFieldNames := 'TINID';

   DMALM.cdsTINID.SetKey;
   DMALM.cdsTINID.FieldByName('TINID').AsString := dblcTIN.Text;
   If Not DMALM.cdsTINID.GotoKey Then
   Begin
      ShowMessage('Codigo digitado no está en la relación de Tipos de Inventario, reintente');
      dblcTIN.SetFocus;
      exit;
   End;
   edtTIN.Text := DMALM.cdsTINID.FieldByName('TINDES').AsString;
End;

Procedure TFConsumoAnualCCos.dblcTALMExit(Sender: TObject);
Begin
   If Z2bbtnCanc2.Focused Then Exit;

   If DMALM.cdsALM.IndexFieldNames <> 'ALMID' Then
      DMALM.cdsALM.IndexFieldNames := 'ALMID';

   DMALM.cdsALM.SetKey;
   DMALM.cdsALM.FieldByName('ALMID').AsString := dblcTALM.Text;
   If Not DMALM.cdsALM.GotoKey Then
   Begin
      ShowMessage('Codigo digitado no está en la relación de Almacenes, reintente');
      dblcTALM.SetFocus;
      exit;
   End;
   edtALM.Text := DMALM.cdsALM.FieldByName('ALMDES').AsString;
End;

Procedure TFConsumoAnualCCos.rgNivelConsultaClick(Sender: TObject);
Begin
   If rgNivelConsulta.ItemIndex = 4 Then
      rgArticulos.Visible := True
   Else
   Begin
      rgArticulos.Visible := False;
   End;
End;

Procedure TFConsumoAnualCCos.dblcTINEnter(Sender: TObject);
Begin
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Debe elegir antes una Compañía');
      dblcCia.SetFocus;
      exit;
   End;
   If DMALM.cdsTINID.Active = False Then
      FiltraTabla(DMALM.cdsTINID, 'TGE152', 'TINID', 'TINID', 'CIAID=' + quotedstr(dblcCia.Text));
End;

Procedure TFConsumoAnualCCos.dblcTALMEnter(Sender: TObject);
Var
   xWhere: String;
Begin
   If length(edtTIN.Text) = 0 Then
   Begin
      ShowMessage('Debe elegir antes el Tipo de Inventario');
      dblcTIN.SetFocus;
      exit;
   End;
   If DMALM.cdsALM.Active = False Then
   Begin
      xWhere := 'CIAID=' + quotedstr(dblcCia.Text)
         + ' and TINID=' + quotedstr(dblcTIN.Text);
      FiltraTabla(DMALM.cdsALM, 'TGE151', 'ALMID', 'ALMID', xWhere);
   End;
End;

Procedure TFConsumoAnualCCos.dblcCiaEnter(Sender: TObject);
Begin
   If DMALM.cdsCIA.Active = False Then
      FiltraTabla(DMALM.cdsCIA, 'TGE101', 'CIAID', 'CIAID');
End;

Procedure TFConsumoAnualCCos.Z2bbtnAceptaClick(Sender: TObject);
Var
   xSQL, xCampos, xCamposTit, xTipoSuma: String;
   Mtx4440: TMant;
Begin
   {
         select MOV.CCOSID,CCOS.CCOSDES,MOV.GRARID,LINEA.GRARDES,MOV.FAMID,FAMIL.FAMDES,
                MOV.SFAMID,SFAMIL.SFAMDES,MOV.ARTID,ART.ARTDES,ART.UNMIDG,
                sum(case when to_char(NISAFREG,'MM')='01' then KDXCNTG else 0 end) ENE,
                sum(case when to_char(NISAFREG,'MM')='02' then KDXCNTG else 0 end) FEB,
                sum(case when to_char(NISAFREG,'MM')='03' then KDXCNTG else 0 end) MAR,
                sum(case when to_char(NISAFREG,'MM')='04' then KDXCNTG else 0 end) ABR,
                sum(case when to_char(NISAFREG,'MM')='05' then KDXCNTG else 0 end) MAY,
                sum(case when to_char(NISAFREG,'MM')='06' then KDXCNTG else 0 end) JUN,
                sum(case when to_char(NISAFREG,'MM')='07' then KDXCNTG else 0 end) JUL,
                sum(case when to_char(NISAFREG,'MM')='08' then KDXCNTG else 0 end) AGO,
                sum(case when to_char(NISAFREG,'MM')='09' then KDXCNTG else 0 end) SEP,
                sum(case when to_char(NISAFREG,'MM')='10' then KDXCNTG else 0 end) OCT,
                sum(case when to_char(NISAFREG,'MM')='11' then KDXCNTG else 0 end) NOV,
                sum(case when to_char(NISAFREG,'MM')='12' then KDXCNTG else 0 end) DIT,
                sum(KDXCNTG) TOT
         from LOG315 MOV, TGE208 TRANSAC, TGE203 CCOS, TGE131 LINEA, TGE169 FAMIL, TGE170 SFAMIL, TGE205 ART
         where MOV.CIAID='02'
           and MOV.TINID='20'  -- TGE152
           and MOV.ALMID='01'  -- TGE151
           and MOV.NISATIP='SALIDA'
           and to_char(MOV.NISAFREG,'YYYY')='2004'
           and TRANSAC.TRIID=MOV.TRIID
           and nvl(TRANSAC.TRICC,'N')='S'
           and nvl(TRANSAC.TRITMOV,'N')='N'
           and CCOS.CCOSID=MOV.CCOSID
           and LINEA.CIAID(+)=MOV.CIAID and LINEA.TINID(+)=MOV.TINID and LINEA.GRARID(+)=MOV.GRARID
           and FAMIL.CIAID(+)=MOV.CIAID and FAMIL.TINID(+)=MOV.TINID and FAMIL.GRARID(+)=MOV.GRARID and FAMIL.FAMID(+)=MOV.FAMID
           and SFAMIL.CIAID(+)=MOV.CIAID and SFAMIL.TINID(+)=MOV.TINID and SFAMIL.GRARID(+)=MOV.GRARID
                    and SFAMIL.FAMID(+)=MOV.FAMID and SFAMIL.SFAMID(+)=MOV.SFAMID
           and ART.CIAID(+)=MOV.CIAID and ART.ARTID(+)=MOV.ARTID
         group by MOV.CCOSID,CCOS.CCOSDES,MOV.GRARID,LINEA.GRARDES,MOV.FAMID,FAMIL.FAMDES,
                  MOV.SFAMID,SFAMIL.SFAMDES,MOV.ARTID,ART.ARTDES,ART.UNMIDG
         order by MOV.CCOSID,CCOS.CCOSDES,MOV.GRARID,LINEA.GRARDES,MOV.FAMID,FAMIL.FAMDES,
                  MOV.SFAMID,SFAMIL.SFAMDES,MOV.ARTID,ART.ARTDES,ART.UNMIDG
   }
   xTipoSuma := 'ARTTOTALG';
   If rgNivelConsulta.ItemIndex = 4 Then
   Begin
      If (rgArticulos.ItemIndex = 0) Or (rgArticulos.ItemIndex = 3) Then
         xTipoSuma := 'KDXCNTG';
   End;

   xCamposTit := '''' + dblcCia.Text + ''' CIAID, '
      + '''' + edtCia.Text + ''' CIADES, '
      + '''' + dblcTIN.Text + ''' TINID, '
      + '''' + edtTIN.Text + ''' TINDES, '
      + '''' + dblcTALM.Text + ''' ALMID, '
      + '''' + edtALM.Text + ''' ALMDES, '
      + '''' + speANO.Text + ''' PERIODO, ';
   xCampos := 'MOV.CCOSID, CCOS.CCOSDES';
   If rgNivelConsulta.ItemIndex > 0 Then
   Begin
      xCampos := xCampos + ',MOV.GRARID,LINEA.GRARDES';
      If rgNivelConsulta.ItemIndex > 1 Then
      Begin
         xCampos := xCampos + ',MOV.FAMID,FAMIL.FAMDES';
         If rgNivelConsulta.ItemIndex > 2 Then
         Begin
            xCampos := xCampos + ',MOV.SFAMID,SFAMIL.SFAMDES';
            If rgNivelConsulta.ItemIndex > 3 Then
            Begin
               xCampos := xCampos + ',MOV.ARTID, ART.ARTDES, ART.UNMIDG';
            End;
         End;
      End;
   End;

   xSQL := 'Select ' + xCampos + ', ' + xCamposTit
      + '   sum(case when to_char(NISAFREG,''MM'')=''01'' then ' + xTipoSuma + ' else 0 end) ENE, '
      + '   sum(case when to_char(NISAFREG,''MM'')=''02'' then ' + xTipoSuma + ' else 0 end) FEB, '
      + '   sum(case when to_char(NISAFREG,''MM'')=''03'' then ' + xTipoSuma + ' else 0 end) MAR, '
      + '   sum(case when to_char(NISAFREG,''MM'')=''04'' then ' + xTipoSuma + ' else 0 end) ABR, '
      + '   sum(case when to_char(NISAFREG,''MM'')=''05'' then ' + xTipoSuma + ' else 0 end) MAY, '
      + '   sum(case when to_char(NISAFREG,''MM'')=''06'' then ' + xTipoSuma + ' else 0 end) JUN, '
      + '   sum(case when to_char(NISAFREG,''MM'')=''07'' then ' + xTipoSuma + ' else 0 end) JUL, '
      + '   sum(case when to_char(NISAFREG,''MM'')=''08'' then ' + xTipoSuma + ' else 0 end) AGO, '
      + '   sum(case when to_char(NISAFREG,''MM'')=''09'' then ' + xTipoSuma + ' else 0 end) SEP, '
      + '   sum(case when to_char(NISAFREG,''MM'')=''10'' then ' + xTipoSuma + ' else 0 end) OCT, '
      + '   sum(case when to_char(NISAFREG,''MM'')=''11'' then ' + xTipoSuma + ' else 0 end) NOV, '
      + '   sum(case when to_char(NISAFREG,''MM'')=''12'' then ' + xTipoSuma + ' else 0 end) DIC, '
      + '   sum(' + xTipoSuma + ') TOT '
      + 'from LOG315 MOV, TGE208 TRANSAC, TGE203 CCOS ';
   If rgNivelConsulta.ItemIndex > 0 Then
   Begin
      xSQL := xSQL + ', TGE131 LINEA ';
      If rgNivelConsulta.ItemIndex > 1 Then
      Begin
         xSQL := xSQL + ', TGE169 FAMIL ';
         If rgNivelConsulta.ItemIndex > 2 Then
         Begin
            xSQL := xSQL + ', TGE170 SFAMIL ';
            If rgNivelConsulta.ItemIndex > 3 Then
            Begin
               xSQL := xSQL + ', TGE205 ART ';
            End;
         End;
      End;
   End;
   xSQL := xSQL
      + 'where MOV.CIAID=' + quotedstr(dblcCia.Text)
      + '  and MOV.TINID=' + quotedstr(dblcTIN.Text)
      + '  and MOV.ALMID=' + quotedstr(dblcTALM.Text)
      + '  and MOV.NISATIP=''SALIDA'' '
      + '  and to_char(MOV.NISAFREG,''YYYY'')=' + quotedstr(speAno.Text)
      + '  and TRANSAC.TRIID=MOV.TRIID '
      + '  and nvl(TRANSAC.TRICC,''N'')=''S'' '
      + '  and nvl(TRANSAC.TRITMOV,''N'')=''N'' '
      + '  and CCOS.CCOSID=MOV.CCOSID ';
   If rgNivelConsulta.ItemIndex > 0 Then
   Begin
      xSQL := xSQL + ' and LINEA.CIAID(+)=MOV.CIAID and LINEA.TINID(+)=MOV.TINID and LINEA.GRARID(+)=MOV.GRARID ';
      If rgNivelConsulta.ItemIndex > 1 Then
      Begin
         xSQL := xSQL + ' and FAMIL.CIAID(+)=MOV.CIAID and FAMIL.TINID(+)=MOV.TINID '
            + ' and FAMIL.GRARID(+)=MOV.GRARID and FAMIL.FAMID(+)=MOV.FAMID ';
         If rgNivelConsulta.ItemIndex > 2 Then
         Begin
            xSQL := xSQL + ' and SFAMIL.CIAID(+)=MOV.CIAID and SFAMIL.TINID(+)=MOV.TINID '
               + ' and SFAMIL.GRARID(+)=MOV.GRARID and SFAMIL.FAMID(+)=MOV.FAMID '
               + ' and SFAMIL.SFAMID(+)=MOV.SFAMID ';
            If rgNivelConsulta.ItemIndex > 3 Then
            Begin
               xSQL := xSQL + ' and ART.CIAID(+)=MOV.CIAID and ART.ARTID(+)=MOV.ARTID ';
            End;
         End;
      End;
   End;
   xSQL := xSQL + ' group by ' + xCampos
      + ' order by ' + xCampos;
   xSQL := 'select * from (' + xSQL + ' ) SOLVISTA';
//////////////////////////////////////////
   Mtx4440 := TMant.Create(Application);
   Try
      Mtx4440.Admin := DMALM.wAdmin;
      Mtx4440.User := DMALM.wUsuario;
      Mtx4440.ClientDataSet := DMALM.cdsDetMov;
      Mtx4440.DComC := DMALM.DCom1;
      Mtx4440.FileNameIni := '\oaALM.INI';
      Mtx4440.Filter := '';
      Mtx4440.Module := DMALM.wModulo;
      If rgNivelConsulta.ItemIndex = 0 Then // sólo Montos por Centros de Costo
      Begin
         Mtx4440.SectionName := 'ConsAnuxCCos';
         Mtx4440.TableName := 'VWALMCONSUMOANUAL_0';
         Mtx4440.Titulo := 'Consumo Anual por Centros de Costo';
      End
      Else
      Begin
         If rgNivelConsulta.ItemIndex = 1 Then // detallado por Montos de C.Costo+Línea
         Begin
            Mtx4440.SectionName := 'ConsAnuxCCosLin';
            Mtx4440.TableName := 'VWALMCONSUMOANUAL_1';
            Mtx4440.Titulo := 'Consumo Anual por C.Costo y Línea';
         End
         Else
         Begin
            If rgNivelConsulta.ItemIndex = 2 Then // detallado por Montos de C.Costo+Línea+Familia
            Begin
               Mtx4440.SectionName := 'ConsAnuxCCosLinFam';
               Mtx4440.TableName := 'VWALMCONSUMOANUAL_2';
               Mtx4440.Titulo := 'Consumo Anual por C.Costo,Línea y Fam.';
            End
            Else
            Begin
               If rgNivelConsulta.ItemIndex = 3 Then // detallado por Montos de C.Costo+Línea+Familia+SubFamilia
               Begin
                  Mtx4440.SectionName := 'AnuxCCosLinFamSFa';
                  Mtx4440.TableName := 'VWALMCONSUMOANUAL_3';
                  Mtx4440.Titulo := 'Cons.Anual x C.Costo,Línea,Fam.y SubFam';
               End
               Else // detallado por C.Costo+Línea+Familia+SubFamilia+Artículo
               Begin
                  Mtx4440.SectionName := 'AnuxCCosLinFamSFaArt';
                  Mtx4440.TableName := 'VWALMCONSUMOANUAL_4';
                  Mtx4440.Titulo := 'Cons.Anual x C.Costo y Artículo';
               End;
            End;
         End;
      End;
      Mtx4440.OnCreateMant := Nil;
      Mtx4440.OnEdit := Nil;
      Mtx4440.OnInsert := Nil;
      Mtx4440.OnDelete := Nil;
      Mtx4440.OnShow := Nil;
      Mtx4440.UsuarioSQL.Add(xSQL);
      Mtx4440.NoVisible.Clear;
      Mtx4440.OnCierra := DMALM.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx4440.Execute;
   Finally
   End
//////////////////////////////////////////
//   DMALM.FiltraCDS(DMALM.cdsQry4,xSQL);
//   dbgConsumoAnual.DataSource:= DMALM.dsQry4;
//   dbgConsumoAnual.RefreshDisplay;
End;

Procedure TFConsumoAnualCCos.Z2bbtnCanc2Click(Sender: TObject);
Begin
   Close;
End;

Procedure TFConsumoAnualCCos.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMALM.cdsALM.IndexFieldNames := '';
   Action := CAFree;
End;

Procedure TFConsumoAnualCCos.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFConsumoAnualCCos.FormShow(Sender: TObject);
Begin
   DMALM.AccesosUsuarios(DMALM.wModulo, DMALM.wUsuario, '2', Screen.ActiveForm.Name);
End;

End.

