Unit oaIN0000;

// Actualizaciones:
// HPC_201606_ALM 01/08/2016 Cambio de Version a 20160801100000
// HPC_201607_ALM 08/08/2016 Cambio de Version a 20160818083000
// HPC_201608_ALM 22/09/2016 Cambio de Version a 20160923083000
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, mant, DB, DBClient, wwclient, StdCtrls;

Type
   TFINIni = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }
      MantHelp: TMant;
   End;

Procedure INDataModulo; stdcall;
Procedure INMantenimientoAccesos; stdcall;
Procedure INOpcionAccesos; stdcall;
Procedure INOpcionAccesosShow; stdcall;
Procedure INMantenimientoAyudaMant; stdcall;
Procedure INVerificaVersion; stdcall;

Exports
   INDataModulo,
   INMantenimientoAccesos,
   INOpcionAccesos,
   INOpcionAccesosShow,
   INMantenimientoAyudaMant,
   INVerificaVersion;

Var
   FINIni: TFINIni;

Implementation

{$R *.dfm}

Uses ALMDM1;

Procedure INDataModulo;
Begin
   Application.Initialize;
   Try
      If (DMALM = Nil) Or (DMALM.sClose = '1') Then
      Begin
         DMALM := TDMALM.Create(Application);
         If DMALM.sClose = '1' Then
         Begin
            DMALM.Free;
            DMALM := Nil;
         End;
      End;
   Finally
   End;
End;

Procedure INMantenimientoAccesos;
Begin
//
End;

Procedure INOpcionAccesos;
Begin
//
End;

Procedure INOpcionAccesosShow;
Begin
//
End;

Procedure INMantenimientoAyudaMant;
Begin
   FINIni := TFINIni.Create(Nil);
   FINIni.MantHelp := TMant.Create(Application);
   FINIni.MantHelp.Module := DMALM.wModulo;
   FINIni.MantHelp.Tipo := 'HELP';
   FINIni.MantHelp.Admin := 'N';
   FINIni.MantHelp.DComC := DMALM.DCOM1;
   FINIni.MantHelp.User := DMALM.wUsuario;
   FINIni.MantHelp.Execute;
End;

Procedure INVerificaVersion;
Begin
   If DMALM = Nil Then exit;
   If Not DMALM.DCOM1.Connected Then Exit;
   FINIni := TFINIni.Create(Application);
   If DMALM.fg_VerificaVersion(FINIni.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.

