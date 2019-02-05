Unit oaIN1000;

// ACTUALIZACIONES:
// HPC_201506_CAJA 20/11/2015 Entrega al área de Control de Calidad
// HPC_201604_ALM  19/05/2016 Añade Control de Acceso por Grupo de Usuario
// HPC_201606_ALM 01/08/2016 Cambio de Version a 20160801100000
// HPC_201607_ALM 08/08/2016 Cambio de Version a 20160818083000  
// HPC_201608_ALM 22/09/2016 Cambio de Version a 20160923083000
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad
//                           reimplementa Control de Acceso por Grupo de Usuario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, ExtCtrls, StdCtrls, Buttons, Wwdbgrid, Wwdbigrd;

Type
   TFParametros = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }

   End;

Procedure INParametros; stdcall;
Procedure INVerificaVersion; stdcall;

Exports
   INParametros,
   INVerificaVersion;

Var
   FParametros: TFParametros;
   Mtx: TMant;

Implementation

{$R *.dfm}
Uses ALMDM1;

Procedure INParametros;
Var
   MRefe: TMant;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;

// Inicio HPC_201604_ALM
// Añade Control de Acceso por Grupo de Usuario
   If not DMALM.wf_AccesoOpcion('3020101') then Exit;
// Fin HPC_201604_ALM

   Application.Initialize;
   Try
      MRefe := TMant.Create(Application);
      MRefe.Module := DMALM.wModulo;
      MRefe.Admin := DMALM.wAdmin;
      MRefe.DComC := DMALM.DCOM1;
      MRefe.User := DMALM.wUsuario;
      MRefe.OnCierra := DMALM.DisminuyeForma;
      MRefe.Execute;
   Except
   End;
End;

Procedure INVerificaVersion;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   FParametros := TFParametros.Create(Application);
   If DMALM.fg_VerificaVersion(FParametros.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;
End.

