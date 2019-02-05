Unit ALM810;

// Actualizaciones
// HPC_201502_ALM 20/06/2015 Ajustes al Movimientos de Almacén
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, StdCtrls, Buttons, Mask,
   wwdbedit, wwdblook;

Type
   TFRevisaPrecios = Class(TForm)
      pcRevisaPrecios: TPageControl;
      tsListaArticulos: TTabSheet;
      tsConsultaMovs: TTabSheet;
      tsArreglaMovs: TTabSheet;
      dbgListaArticulos: TwwDBGrid;
      dbgConsultaMovs: TwwDBGrid;
      dbgArreglaMovs: TwwDBGrid;
      Z2bbtnGraba: TBitBtn;
      BitBtn2: TBitBtn;
      dbgOCompra: TwwDBGrid;
      lblCia: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      lblNroRegistros: TLabel;
      edtMonto: TEdit;
      lblMonto: TLabel;
      BitBtn1: TBitBtn;
      Procedure FormCreate(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure dbgListaArticulosDblClick(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure dbgArreglaMovsDblClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FRevisaPrecios: TFRevisaPrecios;
   xSQL: String;

Implementation

Uses ALMDM1;

{$R *.dfm}

Procedure TFRevisaPrecios.FormCreate(Sender: TObject);
Begin
   pcRevisaPrecios.ActivePageIndex := 0;

   xSQL := 'select CIAID, CIADES from TGE101 ';
   DMALM.cdsCia.Close;
   DMALM.cdsCia.DataRequest(xSQL);
   DMALM.cdsCia.Open;

   dblcCIA.LookupTable := DMALM.cdsCIA;
   dblcCIA.LookUpField := 'CIAID';
End;

Procedure TFRevisaPrecios.BitBtn2Click(Sender: TObject);
Begin
// artículos que tienen Precio de Origen diferente a Precio Promedio
   xSQL := 'select distinct ARTID, ARTDES '
      + '  from (Select LOG315.*, TGE208.TRIPV '
      + '          from LOG315, TGE208, TGE205 '
      + '         where LOG315.CIAID=' + quotedstr(dblcCIA.Text)
      + '           and LOG315.NISATIP=''INGRESO'' '
      + '           and TGE208.TRIID=LOG315.TRIID and TGE208.TRIPV=''S'' '
      + '           and TGE205.CIAID=LOG315.CIAID and TGE205.ARTID=LOG315.ARTID '
      + '           and LOG315.ARTPCG<>LOG315.ARTMORIPCG '
      + '           and TGE205.ARTEST=''H'' '
      + '           and TGE205.ARTCNTG>0 '
      + '         )';
   DMALM.cdsQry2.Close;
   DMALM.cdsQry2.DataRequest(xSQL);
   DMALM.cdsQry2.Open;
   lblNroRegistros.Caption := inttostr(DMALM.cdsQry2.RecordCount) + ' Registros';
   dbgListaArticulos.DataSource := DMALM.dsQry2;
End;

Procedure TFRevisaPrecios.dbgListaArticulosDblClick(Sender: TObject);
Begin
   xSQL := 'select LOG315.ARTID, LOG315.NISAFREG, LOG315.ALMID, LOG315.NISATIP, LOG315.TRIID, '
      + '       LOG315.TMONID, LOG315.ARTPCG, LOG315.ARTMORIPCG, '
      + '       LOG315.KDXCNTG, TGE208.TRIPV, TGE208.TRIDES, LOG315.NISSIT '
      + '  from LOG315, TGE208 '
      + ' where LOG315.CIAID=' + quotedstr(dblcCIA.Text)
      + '   and LOG315.ARTID=' + quotedstr(DMALM.cdsQry2.FieldByName('ARTID').AsString)
      + '   and TGE208.TRIID(+)=LOG315.TRIID '
      + ' Order By LOG315.NISAFREG ';
   DMALM.cdsQry3.Close;
   DMALM.cdsQry3.DataRequest(xSQL);
   DMALM.cdsQry3.Open;
   DMALM.cdsQry3.IndexFieldNames := 'NISAFREG';
   dbgConsultaMovs.DataSource := DMALM.dsQry3;

   xSQL := 'Select LOG305.*, LOG304.TMONID, LOG304.ODCTCAMB '
      + '  from LOG305, LOG304 '
      + ' where LOG305.CIAID=' + quotedstr(dblcCIA.Text)
      + '   and LOG305.ARTID=' + quotedstr(DMALM.cdsQry2.FieldByName('ARTID').AsString)
      + '   and LOG304.CIAID=LOG305.CIAID '
      + '   and LOG304.ODCID=LOG305.ODCID ';
   DMALM.cdsQry4.Close;
   DMALM.cdsQry4.DataRequest(xSQL);
   DMALM.cdsQry4.Open;
   dbgOCompra.DataSource := DMALM.dsQry4;

   xSQL := 'select LOG315.ARTID, LOG315.NISAFREG, LOG315.ALMID, LOG315.NISATIP, LOG315.TRIID, '
      + '       LOG315.TMONID, LOG315.ARTPCG, LOG315.ARTMORIPCG, '
      + '       LOG315.KDXCNTG, LOG315.NISSIT, LOG315.NISAID '
      + '  from LOG315 '
      + ' where LOG315.CIAID=' + quotedstr(dblcCIA.Text)
      + '   and LOG315.ARTID=' + quotedstr(DMALM.cdsQry2.FieldByName('ARTID').AsString)
      + '   and LOG315.NISSIT=''ACEPTADO'' '
      + ' Order By LOG315.NISAFREG, NISATIP, TRIID ';
   DMALM.cdsQry5.Close;
   DMALM.cdsQry5.DataRequest(xSQL);
   DMALM.cdsQry5.Open;
   DMALM.cdsQry5.IndexFieldNames := 'NISAFREG; NISATIP; TRIID';
   dbgArreglaMovs.DataSource := DMALM.dsQry5;
End;

Procedure TFRevisaPrecios.Z2bbtnGrabaClick(Sender: TObject);
Begin
   If DMALM.cdsQry5.Recordcount = 0 Then exit;

   DMALM.DCOM1.AppServer.IniciaTransaccion;
   DMALM.cdsQry5.First;
   While Not DMALM.cdsQry5.EOF Do
   Begin
      xSQL := ' Update LOG315 '
         + '    Set TMONID=' + quotedstr(DMALM.cdsQry5.FieldByName('TMONID').AsString) + ', '
         + '        ARTPCG=' + floattostr(DMALM.cdsQry5.FieldByName('ARTPCG').AsFloat) + ', '
         + '        ARTMORIPCG=' + floattostr(DMALM.cdsQry5.FieldByName('ARTMORIPCG').AsFloat)
         + '  where CIAID=' + quotedstr(dblcCIA.Text)
         + '    and ALMID=' + quotedstr(DMALM.cdsQry5.FieldByName('ALMID').AsString)
         + '    and NISATIP=' + quotedstr(DMALM.cdsQry5.FieldByName('NISATIP').AsString)
         + '    and NISAID=' + quotedstr(DMALM.cdsQry5.FieldByName('NISAID').AsString)
         + '    and ARTID=' + quotedstr(DMALM.cdsQry5.FieldByName('ARTID').AsString);
      Try
         DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al actualizar Datos en la Nota ');
         DMALM.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         exit;
      End;
      DMALM.cdsQry5.Next;
   End;

   xSQL := 'Begin DB2ADMIN.SP_ALM_REGENERA_STOCK(' + quotedstr(dblcCIA.Text) + ',' + quotedstr(DMALM.cdsQry5.FieldByName('ARTID').AsString) + '); End;';
   DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);

   DMALM.DCOM1.AppServer.GrabaTransaccion;
   ShowMessage('ok');
End;

Procedure TFRevisaPrecios.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMALM.cdsQry2.Filter := '';
   DMALM.cdsQry3.Filter := '';
   DMALM.cdsQry4.Filter := '';
   DMALM.cdsQry5.Filter := '';

   DMALM.cdsQry2.Filtered := False;
   DMALM.cdsQry3.Filtered := False;
   DMALM.cdsQry4.Filtered := False;
   DMALM.cdsQry5.Filtered := False;

   DMALM.cdsQry2.IndexFieldNames := '';
   DMALM.cdsQry3.IndexFieldNames := '';
   DMALM.cdsQry4.IndexFieldNames := '';
   DMALM.cdsQry5.IndexFieldNames := '';

   DMALM.cdsQry2.Close;
   DMALM.cdsQry3.Close;
   DMALM.cdsQry4.Close;
   DMALM.cdsQry5.Close;

   Action := caFree;
End;

Procedure TFRevisaPrecios.dblcCIAExit(Sender: TObject);
Begin
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.Text), 'CIADES');
   If length(dbeCia.Text) = 0 Then
   Begin
      ShowMessage('Debe indicar la Cía correctamente');
      exit;
   End;
End;

Procedure TFRevisaPrecios.FormShow(Sender: TObject);
Begin
   dblcCIA.SetFocus;
End;

Procedure TFRevisaPrecios.BitBtn1Click(Sender: TObject);
Begin
   DMALM.cdsQry5.First;
   While Not DMALM.cdsQry5.EOF Do
   Begin
      DMALM.cdsQry5.Edit;
      DMALM.cdsQry5.FieldByName('ARTPCG').AsFloat := strtofloat(edtMonto.Text);
      DMALM.cdsQry5.FieldByName('ARTMORIPCG').AsFloat := strtofloat(edtMonto.Text);
      DMALM.cdsQry5.Next;
   End;
End;

Procedure TFRevisaPrecios.dbgArreglaMovsDblClick(Sender: TObject);
Begin
   edtMonto.Text := floattostr(DMALM.cdsQry5.FieldByName('ARTPCG').AsFloat);
End;

End.

