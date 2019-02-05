Unit ALM313;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   ALM313
// Formulario           :   FDetalleInventario
// Fecha de Creación    :
// Autor                :   Equipo de Desarrollo
// Objetivo             :   Ingreso de Articulos para Inventario
// HPC_201404_ALM   24/10/2014 Unificación de módulos de Inventarios
//                  13/11/2014 Reordenamiento de sangría del Formulario
//                             Ajustes para Toma de Inventario 2014Nov
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Wwdbdlg, wwdblook, ExtCtrls, DB, Mask, wwdbedit, oaVariables;

Type
   TFDetalleInventario = Class(TForm)
      pnlTool: TPanel;
      lblCia: TLabel;
      lblLoc: TLabel;
      Label1: TLabel;
      lblAlm: TLabel;
      Label2: TLabel;
      Label10: TLabel;
      Label4: TLabel;
      lblCnpEgr: TLabel;
      Label5: TLabel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TEdit;
      dblcLOC: TwwDBLookupCombo;
      dbeLOC: TEdit;
      dblcTIN: TwwDBLookupCombo;
      dbeTIN: TEdit;
      dbeALM: TEdit;
      dblcTALM: TwwDBLookupCombo;
      edtLinea: TEdit;
      edtFamilia: TEdit;
      dblcdArticulo: TwwDBLookupComboDlg;
      bbtnOk: TBitBtn;
      dblcdLinea: TwwDBLookupComboDlg;
      dblcdFamilia: TwwDBLookupComboDlg;
      dblcdSFamilia: TwwDBLookupComboDlg;
      edtSFamilia: TEdit;
      dbeArticulo: TEdit;
      dbeUnMidG: TEdit;
      Label3: TLabel;
      dbeToInId: TEdit;
      Label6: TLabel;
      dbeSTKAno: TEdit;
      bbtnCancel: TBitBtn;
      Label7: TLabel;
      Label8: TLabel;
      dbeCntG: TwwDBEdit;
      dbeCntU: TwwDBEdit;
      Timer1: TTimer;
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure dblcdLineaExit(Sender: TObject);
      Procedure dblcdFamiliaExit(Sender: TObject);
      Procedure dblcdSFamiliaExit(Sender: TObject);
      Procedure dblcdArticuloExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnCancelClick(Sender: TObject);
      Procedure FiltraArticulo;
      Procedure LimpiaControles;
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure dbeCntGKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcdArticuloEnter(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FDetalleInventario: TFDetalleInventario;
   xAccesoBotones: Boolean;

Implementation

Uses ALMDM1, oaIN5000;

{$R *.DFM}

Procedure TFDetalleInventario.NotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFDetalleInventario.dblcCIAExit(Sender: TObject);
Var
   xSQL: String;
Begin
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.Text), 'CIADES');
   xSQL := 'SELECT * FROM TGE126 WHERE CIAID=' + quotedstr(dblcCIA.text);
   DMALM.cdsLOC.Close;
   DMALM.cdsLOC.DataRequest(xSQL);
   DMALM.cdsLOC.open;
End;

Procedure TFDetalleInventario.dblcLOCExit(Sender: TObject);
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeLoc.Text := DMALM.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', xSQL, 'LOCDES');

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE152 WHERE ' + xSQL;
   DMALM.cdsTINID.Close;
   DMALM.cdsTINID.DataRequest(xSQL);
   DMALM.cdsTINID.open;
End;

Procedure TFDetalleInventario.dblcTINExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeTIN.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE151 WHERE ' + xSQL;
   DMALM.cdsALM.Close;
   DMALM.cdsALM.DataRequest(xSQL);
   DMALM.cdsALM.open;

   xSQL := 'SELECT * FROM TGE131 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text);
   DMALM.cdsGArti.Close;
   DMALM.cdsGArti.DataRequest(xSQL);
   DMALM.cdsGArti.Open;
End;

Procedure TFDetalleInventario.dblcTALMExit(Sender: TObject);
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIn.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALM.text);
   dbeALM.text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');
End;

Procedure TFDetalleInventario.dblcdLineaExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If bbtnCancel.Focused Then exit;

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) + ' AND GRARID=' + quotedstr(dblcdLinea.text);

   If Length(DMALM.DisplayDescrip('prvTGE', 'TGE131', 'GRARDES', xSQL, 'GRARDES')) > 0 Then
   Begin
      edtLinea.text := DMALM.cdsQry.FieldByName('GRARDES').AsString;
      xSQL := 'SELECT * FROM TGE169 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedStr(dblcTIN.text) + ' AND GRARID=' + quotedStr(dblcdLinea.text);
      DMALM.Filtracds(DMALM.cdsFam, xSql);
      xSQL := 'SELECT * FROM TGE170 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedStr(dblcTIN.text) + ' AND GRARID=' + quotedStr(dblcdLinea.text);
      DMALM.Filtracds(DMALM.cdsSUBFAM, xSql);
   End
   Else
   Begin
      xSQL := 'SELECT * FROM TGE169 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedStr(dblcTIN.text);
      DMALM.Filtracds(DMALM.cdsFam, xSql);
      xSQL := 'SELECT * FROM TGE170 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedStr(dblcTIN.text);
      DMALM.Filtracds(DMALM.cdsSUBFAM, xSql);
      edtLinea.text := '';
   End;
End;

Procedure TFDetalleInventario.dblcdFamiliaExit(Sender: TObject);
Begin
   If bbtnCancel.Focused Then exit;

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
      ' AND GRARID=' + quotedstr(DMALM.cdsFAM.FieldByName('GRARID').AsString) + ' AND FAMID=' + quotedstr(dblcdFamilia.text);

   If Length(DMALM.DisplayDescrip('prvTGE', 'TGE169', 'GRARID,FAMDES', xSQL, 'FAMDES')) > 0 Then
   Begin
      edtFamilia.text := DMALM.cdsQry.FieldByName('FAMDES').AsString;
      dblcdLinea.text := DMALM.cdsQry.FieldByName('GRARID').AsString;
      xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
         ' AND GRARID=' + quotedstr(DMALM.cdsFAM.FieldByName('GRARID').AsString);
      edtLinea.text := DMALM.DisplayDescrip('prvTGE', 'TGE131', 'GRARDES', xSQL, 'GRARDES');
      xSQL := 'SELECT * FROM TGE170 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
         ' AND GRARID=' + quotedstr(DMALM.cdsFAM.FieldByName('GRARID').AsString) + ' AND FAMID=' + quotedstr(dblcdFamilia.text);
      DMALM.Filtracds(DMALM.cdsSUBFAM, xSql);
   End
   Else
   Begin
      If dblcdLinea.text = '' Then
         xSQL := 'SELECT * FROM TGE170 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text)
      Else
         xSQL := 'SELECT * FROM TGE170 WHERE CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
            ' AND GRARID=' + quotedstr(dblcdLinea.text);
      DMALM.Filtracds(DMALM.cdsSUBFAM, xSql);
      edtFamilia.text := '';
   End;
End;

Procedure TFDetalleInventario.dblcdSFamiliaExit(Sender: TObject);
Begin
   If bbtnCancel.Focused Then exit;

   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
      ' AND GRARID=' + quotedstr(DMALM.cdsSUBFAM.FieldByName('GRARID').AsString) + ' AND FAMID=' + quotedstr(DMALM.cdsSUBFAM.FieldByName('FAMID').AsString) +
      ' AND SFAMID=' + quotedstr(dblcdSFamilia.text);

   If Length(DMALM.DisplayDescrip('prvTGE', 'TGE170', 'GRARID,FAMID,SFAMDES', xSQL, 'SFAMDES')) > 0 Then
   Begin
      edtSFamilia.text := DMALM.cdsQry.FieldByName('SFAMDES').AsString;
      dblcdLinea.text := DMALM.cdsQry.FieldByName('GRARID').AsString;
      dblcdFamilia.text := DMALM.cdsQry.FieldByName('FAMID').AsString;
      xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
         ' AND GRARID=' + quotedstr(dblcdLinea.text);
      edtLinea.text := DMALM.DisplayDescrip('prvTGE', 'TGE131', 'GRARDES', xSQL, 'GRARDES');
      xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + quotedstr(dblcTIN.text) +
         ' AND GRARID=' + quotedstr(dblcdLinea.text) + ' AND FAMID=' + QuotedStr(dblcdFamilia.text);
      edtFamilia.text := DMALM.DisplayDescrip('prvTGE', 'TGE169', 'FAMDES', xSQL, 'FAMDES');
   End
   Else
   Begin
      edtSFamilia.text := '';
   End;
End;

Procedure TFDetalleInventario.dblcdArticuloExit(Sender: TObject);
Begin
   If bbtnCancel.Focused Then exit;

   DMALM.cdsArti.Setkey;
   DMALM.cdsArti.FieldByName('ARTID').AsString := dblcdArticulo.Text;
   If DMALM.cdsArti.GotoKey Then
   Begin
      dbeArticulo.text := DMALM.cdsArti.FieldByName('ARTDES').AsString;
      dbeUnMidG.text := DMALM.cdsArti.FieldByName('UNMIDG').AsString;
      dblcdLinea.text := DMALM.cdsArti.FieldByName('GRARID').AsString;
      dblcdFamilia.text := DMALM.cdsArti.FieldByName('FAMID').AsString;
      dblcdSFamilia.text := DMALM.cdsArti.FieldByName('SFAMID').AsString;

      xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + QuotedStr(dblcTIN.text) + ' AND GRARID=' + QuotedStr(dblcdLinea.text);
      edtLinea.text := DMALM.DisplayDescrip('prvTGE', 'TGE131', 'GRARDES', xSQL, 'GRARDES');

      xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + QuotedStr(dblcTIN.text) + ' AND GRARID=' + QuotedStr(dblcdLinea.text) + ' AND FAMID=' + QuotedStr(dblcdFamilia.text);
      edtFamilia.text := DMALM.DisplayDescrip('prvTGE', 'TGE169', 'FAMDES', xSQL, 'FAMDES');

      xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND TINID=' + QuotedStr(dblcTIN.text) + ' AND GRARID=' + QuotedStr(dblcdLinea.text) + ' AND FAMID=' + QuotedStr(dblcdFamilia.text) + ' AND SFAMID=' + QuotedStr(dblcdSFamilia.text);
      edtSFamilia.text := DMALM.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', xSQL, 'SFAMDES');

   End
   Else
   Begin
      ShowMessage('Articulo No existe!');
      dblcdArticulo.SetFocus;
      exit;
   End;
End;

Procedure TFDetalleInventario.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin
   LimpiaControles;
End;

Procedure TFDetalleInventario.bbtnCancelClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFDetalleInventario.FiltraArticulo;
Var
   xSQL: String;
Begin
   xSQL := ' SELECT * FROM TGE205 WHERE CIAID=' + QuotedStr(dblcCIA.text) + ' AND TINID=' + QuotedStr(dblcTIN.text);
   If dblcdLinea.text <> '' Then
      xSQL := xSQL + ' AND GRARID=' + QuotedStr(dblcdLinea.text);
   If dblcdFamilia.text <> '' Then
      xSQL := xSQL + ' AND FAMID=' + QuotedStr(dblcdFamilia.text);
   If dblcdSFamilia.text <> '' Then
      xSQL := xSQL + ' AND SFAMID=' + QuotedStr(dblcdSFamilia.text);

   DMALM.cdsArti.Filter := '';
   DMALM.cdsArti.Filtered := False;
   DMALM.cdsArti.Close;
//  DMALM.cdsArti.FetchOnDemand:=False;
//  DMALM.cdsArti.PacketRecords:=50;
//  DMALM.cdsArti.FetchOnDemand:=True;

   DMALM.cdsArti.ProviderName := 'prvArti';
   DMALM.cdsArti.DataRequest(xSQL);
   DMALM.cdsArti.Open;
   DMALM.cdsArti.IndexFieldNames := 'ARTID';
   dbeArticulo.text := '';
   dbeUnMidG.text := '';
End;

Procedure TFDetalleInventario.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFDetalleInventario.LimpiaControles;
Begin
   DMALM.cdsDInventario.FieldByName('TOINID').AsString := DMALM.cdsCInventario.FieldByName('TOINID').AsString;
   DMALM.cdsDInventario.FieldByName('STKANO').AsString := DMALM.cdsCInventario.FieldByName('STKANO').AsString;
   DMALM.cdsDInventario.FieldByName('CIAID').AsString := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   DMALM.cdsDInventario.FieldByName('LOCID').AsString := DMALM.cdsCInventario.FieldByName('LOCID').AsString;
   DMALM.cdsDInventario.FieldByName('TINID').AsString := DMALM.cdsCInventario.FieldByName('TINID').AsString;
   DMALM.cdsDInventario.FieldByName('ALMID').AsString := DMALM.cdsCInventario.FieldByName('ALMID').AsString;
   dbeToInId.text := DMALM.cdsCInventario.FieldByName('TOINID').AsString;
   dbeSTKAno.text := DMALM.cdsCInventario.FieldByName('STKANO').AsString;
   FiltraTabla(DMALM.cdsCia, 'TGE101', 'CIAID', 'CIAID');
   dblcCIA.text := DMALM.cdsCInventario.FieldByName('CIAID').AsString;
   dblcCIAExit(Nil);
   dblcLOC.text := DMALM.cdsCInventario.FieldByName('LOCID').AsString;
   dblcLOCExit(Nil);
   dblcTIN.text := DMALM.cdsCInventario.FieldByName('TINID').AsString;
   dblcTINExit(Nil);
   dblcTALM.text := DMALM.cdsCInventario.FieldByName('ALMID').AsString;
   dblcTALMExit(Nil);
   dbeArticulo.text := '';
   dbeUnMidG.text := '';
   dblcdLinea.text := '';
   edtLinea.text := '';
   dblcdFamilia.text := '';
   edtFamilia.text := '';
   dblcdSFamilia.text := '';
   edtSFamilia.text := '';
   dblcdArticulo.text := '';
   dbeArticulo.text := '';
   dbeCntG.text := '0';
   dbeCntU.text := '0';
End;

Procedure TFDetalleInventario.FormCloseQuery(Sender: TObject;
   Var CanClose: Boolean);
Begin
   DMALM.cdsDInventario.CancelUpdates;
End;

Procedure TFDetalleInventario.bbtnOkClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If dbeArticulo.text = '' Then
   Begin
      dblcdArticulo.SetFocus;
      Raise Exception.Create('Ingrese Artículo');
   End;

   xSQL := 'STKANO=' + QuotedStr(DMALM.cdsCInventario.FieldByName('STKANO').AsString)
      + ' AND TOINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TOINID').AsString)
      + ' AND CIAID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('CIAID').AsString)
      + ' AND LOCID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('LOCID').AsString)
      + ' AND TINID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('TINID').AsString)
      + ' AND ALMID=' + QuotedStr(DMALM.cdsCInventario.FieldByName('ALMID').AsString)
      + ' AND ARTID=' + QuotedStr(dblcdArticulo.text);

   If Length(DMALM.DisplayDescrip('prvTGE', 'LOG334', 'ARTID', xSQL, 'ARTID')) > 0 Then
   Begin
      dblcdArticulo.SetFocus;
      Raise Exception.Create('El Artículo ' + dblcdArticulo.text + ' ' + dbeArticulo.text + ', ya existe en la Toma de Inventario');
   End;

   DMALM.cdsDInventario.FieldByName('GRARID').AsString := dblcdLinea.text;
   DMALM.cdsDInventario.FieldByName('FAMID').AsString := dblcdFamilia.text;
   DMALM.cdsDInventario.FieldByName('SFAMID').AsString := dblcdSFamilia.text;
   DMALM.cdsDInventario.FieldByName('ARTID').AsString := dblcdArticulo.text;
   DMALM.cdsDInventario.FieldByName('ARTCONT').AsFloat := DMALM.cdsArti.FieldByName('ARTCONT').AsFloat;
   DMALM.cdsDInventario.FieldByName('UNMIDG').AsString := DMALM.cdsArti.FieldByName('UNMIDG').AsString;
   DMALM.cdsDInventario.FieldByName('UNMIDU').AsString := DMALM.cdsArti.FieldByName('UNMIDU').AsString;
   DMALM.cdsDInventario.FieldByName('FABID').AsString := DMALM.cdsArti.FieldByName('FABID').AsString;
   DMALM.cdsDInventario.FieldByName('ARTSPRO').AsString := DMALM.cdsArti.FieldByName('ARTSPRO').AsString;
   DMALM.cdsDInventario.FieldByName('ARTSCA').AsString := DMALM.cdsArti.FieldByName('ARTSCA').AsString;
   DMALM.cdsDInventario.FieldByName('ARTPARA').AsString := DMALM.cdsArti.FieldByName('ARTPARA').AsString;
   DMALM.cdsDInventario.FieldByName('ARTSNA').AsString := DMALM.cdsArti.FieldByName('ARTSNA').AsString;
   DMALM.cdsDInventario.FieldByName('ARTFUC').AsDateTime := DMALM.cdsArti.FieldByName('ARTFUC').AsDateTime;
   DMALM.cdsDInventario.FieldByName('TMONID').AsString := DMALM.cdsArti.FieldByName('TMONID').AsString;
   DMALM.cdsDInventario.FieldByName('STKINV').AsString := 'N';
   DMALM.cdsDInventario.FieldByName('ARTCRGO').AsFloat := DMALM.cdsArti.FieldByName('ARTCRGO').AsFloat;
   DMALM.cdsDInventario.FieldByName('ARTACTIVO').AsString := DMALM.cdsArti.FieldByName('ARTACTIVO').AsString;
   DMALM.cdsDInventario.FieldByName('CUENTAID').AsString := DMALM.cdsArti.FieldByName('CUENTAID').AsString;
   DMALM.cdsDInventario.FieldByName('STKSACTG').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKSACTU').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKMACTG').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKMACTU').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKSFISG').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKSFISU').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKSMAXG').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKSMING').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKSMAXU').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKSMINU').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKPUPED').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKLOTEC').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKRACTG').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('STKRACTU').AsFloat := 0;
   DMALM.cdsDInventario.FieldByName('ARTDES').AsString := DMALM.cdsArti.FieldByName('ARTDES').AsString;
   DMALM.cdsDInventario.FieldByName('ARTADI').AsString := 'S';
   DMALM.AplicaDatos(DMALM.cdsDInventario, 'XX');
   ShowMessage('Registro Ingresado');

   DMALM.wModo := 'A';
   DMALM.cdsDInventario.Append;
   LimpiaControles;
End;

Procedure TFDetalleInventario.dbeCntGKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Not (Key In ['0'..'9']) Then
      If key <> #8 Then
         Key := #0;
End;

Procedure TFDetalleInventario.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   mtx5001.FMant.cds2.Refresh;

   Action := CAFree;
End;

Procedure TFDetalleInventario.dblcdArticuloEnter(Sender: TObject);
Begin
   If DMALM.cdsArti.Active = False Then
      FiltraArticulo;
End;

Procedure TFDetalleInventario.Timer1Timer(Sender: TObject);
Begin
   FVariables.w_NombreForma := 'FDetalleInventario';
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FDetalleInventario);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

End.

