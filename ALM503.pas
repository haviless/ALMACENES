Unit ALM503;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   ALM503
// Formulario           :   FToolTomaInventario
// Fecha de Creación    :
// Autor                :   Equipo de Desarrollo
// Objetivo             :   Barra de tareas consultas de Toma deInventario
// HPC_201404_ALM   24/10/2014 Unificación de módulos de Inventarios
//                  13/11/2014 Reordenamiento de Formulario
//                             Ajustes para Toma de Inventario 2014Nov
// HPC_201502_ALM   19/06/2015 Ajustes a la creación de la Cabecera de la Toma de Inventarios
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
//Inicio HPC_201404_ALM
   StdCtrls, wwdblook, Buttons, ExtCtrls, Db, oaVariables, Mask, wwdbedit,
   wwdbdatetimepicker;
//Inicio HPC_201404_ALM

Type
   TFTomaInventario = Class(TForm)
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
      Label2: TLabel;
      dbeObs: TEdit;
      bbtnOk: TBitBtn;
      Timer1: TTimer;
//Inicio HPC_201404_ALM
      lblFechaToma: TLabel;
      dtpFechaToma: TwwDBDateTimePicker;
      dbeAnoMesToma: TwwDBEdit;
      lblAnoMes: TLabel;
//Final HPC_201404_ALM
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTINExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure LimpiaControles;
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FTomaInventario: TFTomaInventario;
   xAccesoBotones: Boolean;
   xSQL: String; // HPC_201502_ALM

Implementation

Uses ALMDM1, oaIN5000;

{$R *.DFM}

Procedure TFTomaInventario.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFTomaInventario.NotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFTomaInventario.dblcCIAExit(Sender: TObject);
Begin
   dbeCia.Text := DMALM.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.Text), 'CIADES');
   If Length(dbeCia.text) = 0 Then
   Begin
      dblcCIA.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   End;

   FiltraTabla(DMALM.cdsLoc, 'TGE126', 'LOCID', 'LOCID', 'CIAID=' + quotedstr(dblcCIA.text));
End;

Procedure TFTomaInventario.dblcLOCExit(Sender: TObject);
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeLoc.Text := DMALM.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', xSQL, 'LOCDES');
   If Length(dbeLoc.Text) = 0 Then
   Begin
      dblcLOC.Text;
   End;

   xSQL := 'SELECT * FROM TGE152 WHERE CIAID=' + quotedstr(dblcCIA.text);
   DMALM.cdsTINID.Close;
   DMALM.cdsTINID.DataRequest(xSQL);
   DMALM.cdsTINID.open;
End;

Procedure TFTomaInventario.dblcTINExit(Sender: TObject);
Begin
   dbeTIN.Text := DMALM.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', 'TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text), 'TINDES');
   If Length(dbeTIN.Text) = 0 Then
   Begin
      dblcTIN.SetFocus;
      Raise Exception.Create('Ingrese Tipo de Inventario');
   End;
//Inicio HPC_201404_ALM
//   xSQL := 'SELECT * FROM TGE151 WHERE LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIN.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' ORDER BY ALMID ';
   xSQL := 'Select CIAID, LOCID, TINID, ALMID, ALMDES, ALMABR, TDIARID, CIUID, ALMVTA, '
      + '       ALMDIR, ALMTELF, ALMFAX, ALMEMAIL, ALMRESP, CUENTAID, FLAGVAR, '
      + '       ALMENVIACIA, ALMACTIVOF, ACTIVO, TIE_ID '
      + '  from TGE151 '
      + ' Where LOCID=' + quotedstr(dblcLOC.text)
      + '   and TINID=' + quotedstr(dblcTIN.text)
      + '   and CIAID=' + quotedstr(dblcCIA.text)
      + '   and ACTIVO=''S'' '
      + ' Order by ALMID ';
//Final HPC_201404_ALM
   DMALM.cdsALM.Close;
   DMALM.cdsALM.DataRequest(xSQL);
   DMALM.cdsALM.open;
End;

Procedure TFTomaInventario.dblcTALMExit(Sender: TObject);
Begin
//Inicio HPC_201404_ALM
// dbeALM.text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIn.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALM.text), 'ALMDES');
   dbeALM.text := DMALM.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTIn.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALM.text) + ' and activo=''S''', 'ALMDES');
//Final HPC_201404_ALM
   If Length(dbeALM.text) = 0 Then
   Begin
      dblcTALM.SetFocus;
      Raise Exception.Create('Ingrese Almacén');
   End;
End;

Procedure TFTomaInventario.bbtnOkClick(Sender: TObject);
Var
   a, m, d: word;
Begin
   DecodeDate(DMALM.cdsQry2.FieldByName('TOINFEC').AsDateTime, a, m, d);
   DMALM.cdsCInventario.Append;
   DMALM.cdsCInventario.FieldByName('STKANO').AsString := IntToStr(a);
   DMALM.cdsCInventario.FieldByName('CIAID').AsString := dblcCIA.text;
   DMALM.cdsCInventario.FieldByName('LOCID').AsString := dblcLOC.text;
   DMALM.cdsCInventario.FieldByName('TINID').AsString := dblcTIN.text;
   DMALM.cdsCInventario.FieldByName('ALMID').AsString := dblcTALM.text;
   DMALM.cdsCInventario.FieldByName('TOINID').AsString := DMALM.StrZero(DMALM.MaxSQL('LOG333', 'TOINID', ''), 10);
   DMALM.cdsCInventario.FieldByName('TOINFEC').AsDateTime := DMALM.cdsQry2.FieldByName('TOINFEC').AsDateTime;
   DMALM.cdsCInventario.FieldByName('TOINUSER').AsString := DMALM.wUsuario;
   DMALM.cdsCInventario.FieldByName('TOINOBS').AsString := dbeObs.text;
   DMALM.cdsCInventario.FieldByName('TOINESTADO').AsString := 'INICIAL';
   DMALM.cdsCInventario.FieldByName('TOINANOMM').AsString := DMALM.cdsQry2.FieldByName('TOINANOMM').AsString;

// Inicio HPC_201502_ALM
   xSQL := 'Insert into LOG333(STKANO, CIAID, LOCID, TINID, ALMID, TOINID, TOINFEC, '
      + '                   TOINUSER, TOINOBS, TOINESTADO, TOINANOMM) '
      + 'Values('
      + quotedstr(DMALM.cdsCInventario.FieldByName('STKANO').AsString) + ','
      + quotedstr(DMALM.cdsCInventario.FieldByName('CIAID').AsString) + ','
      + quotedstr(DMALM.cdsCInventario.FieldByName('LOCID').AsString) + ','
      + quotedstr(DMALM.cdsCInventario.FieldByName('TINID').AsString) + ','
      + quotedstr(DMALM.cdsCInventario.FieldByName('ALMID').AsString) + ','
      + quotedstr(DMALM.cdsCInventario.FieldByName('TOINID').AsString) + ','
      + quotedstr(datetostr(DMALM.cdsCInventario.FieldByName('TOINFEC').AsDateTime)) + ','
      + quotedstr(DMALM.cdsCInventario.FieldByName('TOINUSER').AsString) + ','
      + quotedstr(DMALM.cdsCInventario.FieldByName('TOINOBS').AsString) + ','
      + quotedstr(DMALM.cdsCInventario.FieldByName('TOINESTADO').AsString) + ','
      + quotedstr(DMALM.cdsCInventario.FieldByName('TOINANOMM').AsString) + ')';
   Try
      DMALM.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo añadir la Cabecera de la Toma de Inventario');
      exit;
   End;
// Fin HPC_201502_ALM

   LimpiaControles;
   DMALM.cdsQry2.Close;
   Close;
End;

Procedure TFTomaInventario.LimpiaControles;
Begin
   dblcCIA.text := '';
   dbeCIA.text := '';
   dblcLOC.text := '';
   dbeLOC.text := '';
   dblcTIN.text := '';
   dbeTIN.text := '';
   dblcTALM.text := '';
   dbeALM.text := '';
   dbeObs.text := '';
End;

Procedure TFTomaInventario.FormShow(Sender: TObject);
Begin
   FiltraTabla(DMALM.cdsCia, 'TGE101', 'CIAID', 'CIAID');
End;

Procedure TFTomaInventario.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   If DMALM.wTipoAdicion = 'xFiltro' Then
   Begin
      DMALM.ActualizaFiltro(mtx5000, DMALM.cdsCInventario, DMALM.wModo);
   End;
   Action := CAFree;
End;

Procedure TFTomaInventario.Timer1Timer(Sender: TObject);
Begin
//Inicio HPC_201404_alm
   FVariables.w_NombreForma := 'FTomaInventario';
//Final HPC_201404_alm
   If (DMALM.wAdmin = 'G') Or (DMALM.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario, '2', FTomaInventario);
      xAccesoBotones := True;
//Inicio HPC_201404_alm
      xSQL := 'select trunc(sysdate) TOINFEC, to_char(sysdate,''YYYYMM'') TOINANOMM from DUAL';
      DMALM.cdsQry2.Close;
      DMALM.cdsQry2.DataRequest(xSQL);
      DMALM.cdsQry2.Open;
      dtpFechaToma.DataSource := DMALM.dsQry2;
      dtpFechaToma.DataField := 'TOINFEC';
      dbeAnoMesToma.DataSource := DMALM.dsQry2;
      dbeAnoMesToma.DataField := 'TOINANOMM';
      dblcCIA.SetFocus;
//Final HPC_201404_alm
   End;
   Timer1.Destroy;
End;

End.

