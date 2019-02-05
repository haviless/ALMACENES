Unit oaIN6000;

// ACTUALIZACIONES:
// HPC_201401_ALM 19/06/2014 Cambio de Versión a 20140623083000
// HPC_201604_ALM 19/05/2016 Añade Control de Acceso por Grupo de Usuario
// HPC_201606_ALM 01/08/2016 Cambio de Version a 20160801100000
// HPC_201607_ALM 08/08/2016 Cambio de Version a 20160818083000
// HPC_201608_ALM 22/09/2016 Cambio de Version a 20160923083000
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, ExtCtrls, StdCtrls, Buttons, Wwdbigrd;

Type
   TFINContabilidad = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }
      Procedure PGridShow(Sender: TObject);
      Procedure MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);

   // Contabilidad de Inventarios

   // Contabilización por Líneas y Transacciones
   End;

Procedure INContabiliza; stdcall; // Contabilización por Líneas y Transacciones
Procedure INVerificaVersion; stdcall;

Exports
   INContabiliza,
   INVerificaVersion;

Var
   FINContabilidad: TFINContabilidad;
   mtx5000, mtx5001, mtx5002: TMant;
   D, M, Y: Word;

Implementation

{$R *.dfm}
Uses ALMDM1, ALM504;
// ALM504 FContab, Contabilización por Líneas y Transacciones

Procedure TFINContabilidad.PGridShow(Sender: TObject);
Var
   i: Integer;
   MGrid: TMant;
Begin
   MGrid := TMant(Sender);
   For i := 0 To MGrid.FMant.ComponentCount - 1 Do
   Begin
      If MGrid.FMant.Components[i].ClassName = 'TPanel' Then
         TPanel(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
  // para botones
      If MGrid.FMant.Components[i].ClassName = 'TButton' Then
         TButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
  // para bitbuttons
      If MGrid.FMant.Components[i].ClassName = 'TBitBtn' Then
         TBitBtn(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
  // para speedbuttons
      If MGrid.FMant.Components[i].ClassName = 'TSpeedButton' Then
         TSpeedButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
  // Boton de Grid
      If MGrid.FMant.Components[i].ClassName = 'TwwIButton' Then
         TwwIButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
  // para la forma
      MGrid.FMant.onMouseMove := MueveMouse;
   End;
//  DMALM.AccesosUsuariosR(DMALM.wModulo, DMALM.wUsuario,'2', MGrid.FMant );
End;

Procedure TFINContabilidad.MueveMouse(xObjeto: TObject; Shift: TShiftState; X,
   Y: Integer);
Var
   xComponente: String;
   xForma: TForm;
Begin
   xForma := Screen.ActiveForm;
   xComponente := xForma.Name;

   If xObjeto Is TForm Then
   Else
   Begin
      xComponente := xComponente + '.' + TControl(xObjeto).Name;
      DMALM.wObjetoForma := xForma.Name;
      DMALM.wObjetoNombr := TControl(xObjeto).Name;
      If Copy(DMALM.wObjetoNombr, 2, 1) = '2' Then
         DMALM.wObjetoDescr := DMALM.wObjetoDesPr + ' - ' + TControl(xObjeto).Hint
      Else
      Begin
         DMALM.wObjetoDescr := TControl(xObjeto).Hint;
      End;
   End;
End;

//////////////////////////////////////////////////////////
// CONTABILIZACIÓN POR LÍNEAS Y TRANSACCIONES
//////////////////////////////////////////////////////////

Procedure INContabiliza;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201604_ALM
// Añade Control de Acceso por Grupo de Usuario
   If Not DMALM.wf_AccesoOpcion('3020601') Then Exit;
// Fin HPC_201604_ALM

   FContab := TFContab.Create(Application);
   Try
      FContab.ActiveMDIChild;
   Finally
   End;
End;

Procedure INVerificaVersion;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   FINContabilidad := TFINContabilidad.Create(Application);
   If DMALM.fg_VerificaVersion(FINContabilidad.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.

