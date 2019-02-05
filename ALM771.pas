Unit ALM771;
//*********************************************************
// CREADO POR       : Abelardo Sulca Palomino
// Nº HPP           : HPP_201103_ALM
// FECHA CREACION   : 21/03/2011
// DESCRIPCION      : Ventana que permite ingresar los criterios de
//                    consulta para el reporte de Activos Fijos Por Nº de Salida de Almacén
//*********************************************************
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, wwdbdatetimepicker, Buttons, ppEndUsr, ppProd,
   ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCache,
   ppCtrls, ppPrnabl, ppParameter, ppVar;

Type
   TFRptActivosSinSalida = Class(TForm)
      lblFechaTras: TLabel;
      Label1: TLabel;
      Label2: TLabel;
      wwDBDateTimePicker_Desde: TwwDBDateTimePicker;
      wwDBDateTimePicker_Hasta: TwwDBDateTimePicker;
      RadioButton_SinSalida: TRadioButton;
      RadioButton_SalidaInicial: TRadioButton;
      Z2bbtnImprime: TBitBtn;
      ppDBPipeline_ActivosSinSalida: TppDBPipeline;
      ppReport_ActivosSinSalida: TppReport;
      ppDesigner_ActivosSinSalida: TppDesigner;
      Label3: TLabel;
      GroupBox1: TGroupBox;
      RadioButton_PorCodigoBarra: TRadioButton;
      RadioButton_PorCodigoArticulo: TRadioButton;
      RadioButton_PorDescripcion: TRadioButton;
      RadioButton_SalidaAceptado: TRadioButton;
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FRptActivosSinSalida: TFRptActivosSinSalida;
   xSQL: String;
Implementation

Uses ALMDM1;
{$R *.dfm}

Procedure TFRptActivosSinSalida.Z2bbtnImprimeClick(Sender: TObject);
Var
   ls_sql_ExistsSalida, ls_sql_EstadoSalida, ls_sql_SalidaInicial: String;
   ls_rpt_titulo, ls_filtro_fecha: String;
   ls_sql_oderBy: String;
Begin
   //se modifica el sql de acuerod a los criterios de consulta
   If RadioButton_SalidaInicial.Checked Then
   Begin
      ls_sql_ExistsSalida := ' AND EXISTS (SELECT LOG314.NISSIT  FROM LOG314 , LOG315   ';
      ls_sql_EstadoSalida := ' ';
      ls_sql_SalidaInicial := ' AND SALIDA.NISSIT_S = ' + quotedStr('INICIAL');
      ls_rpt_titulo := 'REPORTE ACTIVOS POR Nº DE SALIDA: SALIDA EN ESTADO INICIAL';
   End
   Else
      If RadioButton_SinSalida.Checked Then
      Begin
         ls_sql_ExistsSalida := ' AND NOT EXISTS (SELECT LOG314.NISSIT  FROM LOG314 , LOG315   ';
         ls_sql_EstadoSalida := ' ';
         ls_sql_SalidaInicial := ' ';
         ls_rpt_titulo := 'REPORTE ACTIVOS POR Nº DE SALIDA: ACTIVOS SIN SALIDA';
      End
      Else
      Begin
         ls_sql_ExistsSalida := ' AND EXISTS (SELECT LOG314.NISSIT  FROM LOG314 , LOG315   ';
         ls_sql_EstadoSalida := ' ';
         ls_sql_SalidaInicial := ' AND SALIDA.NISSIT_S = ' + quotedStr('ACEPTADO');
         ls_rpt_titulo := 'REPORTE ACTIVOS POR Nº DE SALIDA: SALIDA EN ESTADO ACEPTADO';
      End;

   //ordenado por
   If RadioButton_PorCodigoBarra.Checked Then
   Begin
      ls_sql_oderBy := ' ORDER BY LOG332.Codbar ';
   End
   Else
      If RadioButton_PorCodigoArticulo.Checked Then
      Begin
         ls_sql_oderBy := ' ORDER BY LOG332.Artid , LOG332.Codbar  ';
      End
      Else
      Begin
         ls_sql_oderBy := ' ORDER BY LOG332.Artdes  ';
      End;

   ls_filtro_fecha := 'Desde: ' + datetostr(wwDBDateTimePicker_Desde.date) + ' Hasta: ' + datetostr(wwDBDateTimePicker_Hasta.date);

   xSQL := ' SELECT LOG332.Codbar CODIGO_BARRA, LOG332.Artid CODIGO_ARTICULO, LOG332.Artdes DESCRIPCION_ARTICULO, ' +
      ' LOG332.Nisatip TIPO_INGRESO, ' +
      ' LOG332.NISAID NUMERO_INGRESO, ' +
      ' LOG332.Nifecha FECHA_INGRESO, ' +
      ' LOG332.Tdaid2 TIPO_SALIDA, ' +
      ' LOG332.Nfac NUMERO_SALIDA, ' +
      ' SALIDA.NISSIT_S ESTADO_SALIDA, ' +
      ' SALIDA.NISAFREG_S FECHA_SALIDA, ' +
      ' LOG332.Otrndoc NUMERO_TRASLADO, ' +
      ' TRASLADO.FECTRAS_1 FECHA_TRASLADO, ' +
      ' TRASLADO.LOCAL_D_1 COD_LOCALIDAD_DESTINO, ' +
      ' TRASLADO.LOCDES_D_1 DESC_LOCALIDAD_DESTINO, ' +
      QuotedStr(ls_filtro_fecha) + ' RANGO_FECHA, ' +
      QuotedStr(DMALM.wUsuario) + ' USUARIO_IMPRIME, ' +
      QuotedStr(ls_rpt_titulo) + ' REPORTE_TITULO ' +
      ' FROM LOG332, ' +
      '(SELECT  ACF321.ARTCODBAR ARTCODBAR_1, ACF320.NUMDOC NUMDOC_1, ' +
      ' ACF320.FECTRAS FECTRAS_1, ACF320.LOCAL_D LOCAL_D_1,  ' +
      ' ACF320.LOCDES_D  LOCDES_D_1  ' +
      ' FROM ACF320, ACF321  ' +
      ' WHERE ACF320.DOCREF = ACF321.DOCREF  ' +
      ' AND ACF320.NUMDOC = ACF321.NUMDOC) TRASLADO,  ' +
      ' (SELECT LOG314.CIAID  CIAID_S, ' +
      ' LOG314.LOCID  LOCID_S,  ' +
      ' LOG314.TINID  TINID_S,  ' +
      ' LOG314.ALMID  ALMID_S,   ' +
      ' LOG314.TDAID  TDAID_S,  ' +
      ' LOG314.NISAID NISAID_S,  ' +
      ' LOG315.ARTID ARTID_S,   ' +
      ' LOG314.NISSIT NISSIT_S,  ' +
      ' LOG314.NISAFREG NISAFREG_S  ' +
      ' FROM LOG314 , LOG315   ' +
      ' WHERE LOG314.CIAID = LOG315.CIAID  ' +
      ' AND LOG314.LOCID = LOG315.LOCID  ' +
      ' AND LOG314.TINID = LOG315.TINID   ' +
      ' AND LOG314.ALMID = LOG315.ALMID  ' +
      ' AND LOG314.TDAID = LOG315.TDAID   ' +
      ' AND LOG314.NISAID = LOG315.NISAID   ' +
      ' AND LOG314.NISATIP = LOG315.NISATIP   ' +
      ' AND LOG314.NISATIP = ' + quotedstr('SALIDA') + ') SALIDA  ' +
      ' WHERE LOG332.NISSIT = ' + quotedstr('ACEPTADO') + ' ' +
      ' AND LOG332.CODBAR = TRASLADO.ARTCODBAR_1(+)  ' +
      ' AND LOG332.Otrndoc = TRASLADO.NUMDOC_1(+)  ' +
      ' AND LOG332.CIAID = SALIDA.CIAID_S(+)  ' +
      ' AND LOG332.LOCID = SALIDA.LOCID_S(+)  ' +
      ' AND LOG332.TINID = SALIDA.TINID_S(+) ' +
      ' AND LOG332.ALMID = SALIDA.ALMID_S(+)  ' +
      ' AND LOG332.Tdaid2 = SALIDA.TDAID_S(+) ' +
      ' AND LOG332.Nfac = SALIDA.NISAID_S(+)  ' +
      ' AND LOG332.ARTID = SALIDA.ARTID_S(+)  ' +
      ls_sql_ExistsSalida + //' AND NOT EXISTS (SELECT LOG314.NISSIT  FROM LOG314 , LOG315   '+
      ' WHERE LOG314.CIAID = LOG315.CIAID    ' +
      ' AND LOG314.LOCID = LOG315.LOCID   ' +
      ' AND LOG314.TINID = LOG315.TINID    ' +
      ' AND LOG314.ALMID = LOG315.ALMID    ' +
      ' AND LOG314.TDAID = LOG315.TDAID    ' +
      ' AND LOG314.NISAID = LOG315.NISAID   ' +
      ' AND LOG314.NISATIP = LOG315.NISATIP    ' +
      ' AND LOG314.CIAID = LOG332.CIAID   ' +
      ' AND LOG314.LOCID = LOG332.LOCID    ' +
      ' AND LOG314.TINID = LOG332.TINID    ' +
      ' AND LOG314.ALMID = LOG332.ALMID    ' +
      ' AND LOG314.TDAID = LOG332.Tdaid2    ' +
      ' AND LOG314.NISAID = LOG332.Nfac   ' +
      ' AND LOG315.ARTID = LOG332.ARTID    ' +
      ls_sql_EstadoSalida + //AND LOG314.NISSIT = 'ACEPTADO'
      ' AND LOG314.NISATIP = ' + quotedstr('SALIDA') + ' ) ' +
      ' AND (LOG332.Nifecha >= TO_DATE(' + quotedStr(datetostr(wwDBDateTimePicker_Desde.date)) + ', ' + quotedStr('DD/MM/YYYY') + ')' +
      ' AND LOG332.Nifecha <= TO_DATE(' + quotedStr(datetostr(wwDBDateTimePicker_Hasta.date)) + ', ' + quotedStr('DD/MM/YYYY') + '))' +
      ls_sql_SalidaInicial + //AND SALIDA.NISSIT_S = 'INICIAL'
      ls_sql_oderBy;

   DMALM.cdsQry8.Close;
   DMALM.cdsQry8.DataRequest(xSQL);
   DMALM.cdsQry8.Open;
   If DMALM.cdsQry8.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppDBPipeline_ActivosSinSalida.DataSource := DMALM.dsQry8;
   ppReport_ActivosSinSalida.DataPipeline := ppDBPipeline_ActivosSinSalida;
   ppReport_ActivosSinSalida.Template.FileName := wRutaRpt + '\ActivosSinSalida.rtm';

   ppReport_ActivosSinSalida.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppDesigner_ActivosSinSalida.Report := ppReport_ActivosSinSalida ;
   //ppDesigner_ActivosSinSalida.ShowModal() ;
   ppReport_ActivosSinSalida.Print;

End;

Procedure TFRptActivosSinSalida.FormShow(Sender: TObject);
Begin
   wwDBDateTimePicker_Desde.Date := Now;
   wwDBDateTimePicker_Hasta.Date := Now;
End;

End.

