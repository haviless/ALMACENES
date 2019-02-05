Unit ALM272;

// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons;

Type
   TFBuscaCodigo = Class(TForm)
      dbgCodigos: TwwDBGrid;
      bbtnSel: TBitBtn;
      Procedure FormShow(Sender: TObject);
      Procedure dbgCodigosDblClick(Sender: TObject);
      Procedure bbtnSelClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FBuscaCodigo: TFBuscaCodigo;

Implementation

{$R *.dfm}

Uses ALMDM1, ALM270;

Procedure TFBuscaCodigo.FormShow(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'select a.ciaid Cia, Grupo, max( artid )+1 codigo, count(*) registros From '
      + '( select ciaid, substr(artid,1,4) grupo from tge205 a '
      + ' where ciaid=''' + FRegArti.dblcCIA.Text + ''' '
      + ' and marca=''' + FRegArti.dblcdMarca.Text + ''' '
      + ' group by ciaid, substr(artid,1,4) ) a, tge205 b '
      + 'where a.ciaid=b.ciaid(+) '
      + ' and a.grupo=substr(b.artid,1,4) '
      + 'group by a.ciaid, grupo '
      + 'order by registros desc ';
   DMALM.cdsQry8.Close;
   DMALM.cdsQry8.DataRequest(sSQL);
   DMALM.cdsQry8.Open;

   dbgCodigos.DataSource := DMALM.dsQry8;

End;

Procedure TFBuscaCodigo.dbgCodigosDblClick(Sender: TObject);
Begin
   bbtnSelClick(self);
End;

Procedure TFBuscaCodigo.bbtnSelClick(Sender: TObject);
Begin
   DMALM.cdsArti.fieldbyname('ARTID').AsString := DMALM.StrZero(DMALM.cdsQry8.FieldByname('codigo').AsString, DMALM.wAnchoArt);
   Close;
End;

Procedure TFBuscaCodigo.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

End.

