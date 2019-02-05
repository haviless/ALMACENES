Unit ALM270_REP;

// Actualizaciones:
// HPC_201306_ALM   Creación del formulario
//                  Ricardo Medina Zavaleta
//                  01/09/2013
//                  Visualización/Generación de stock para Reposición
// HPC_201701_ALM 23/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ppBands, ppCache,
   ppClass, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
   ppEndUsr, ExtCtrls, ppCtrls, ppVar, ppPrnabl, ppParameter, DB, DBClient,
   DBGrids;

Type
   TFStockReposicion = Class(TForm)
      GroupBox1: TGroupBox;
      dbgReposicion: TwwDBGrid;
      BitBtn1: TBitBtn;
      BitBtn2: TBitBtn;
      BitBtn3: TBitBtn;
      BitBtn4: TBitBtn;
      DBP1: TppBDEPipeline;
      RepRepos: TppReport;
      chkdiseno: TCheckBox;
      PDES1: TppDesigner;
      Panel1: TPanel;
      Label1: TLabel;
      edtCia: TEdit;
      Label2: TLabel;
      edtUltFecProc: TEdit;
      Label3: TLabel;
      EdtUsuProc: TEdit;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppShape1: TppShape;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLabel3: TppLabel;
      ppLabel6: TppLabel;
      ppLabel5: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel4: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText7: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      pplUltimaFecProc: TppLabel;
      DTGDATA: TDBGrid;
      chkCRITICO: TCheckBox;
      Procedure BitBtn2Click(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure BitBtn4Click(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure chkCRITICOClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      vcia: String;
   End;

Var
   FStockReposicion: TFStockReposicion;

Implementation

Uses ALMDM1;

{$R *.dfm}

Procedure TFStockReposicion.BitBtn2Click(Sender: TObject);
Var
   xsql, xsql2: String;
Begin

   If DMALM.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No existe información para Imprimir');
      exit;
   End;

   DMALM.cdsQry.DisableControls;
   DBP1.DataSource := DMALM.dsQry;
   pplUltimaFecProc.Caption := edtUltFecProc.Text;

   If chkdiseno.Checked Then
   Begin
      PDES1.ShowModal;
   End
   Else
   Begin
      RepRepos.Print;
      RepRepos.Stop;
   End;
   DMALM.cdsQry.EnableControls;

End;

Procedure TFStockReposicion.BitBtn3Click(Sender: TObject);
Var
   xsql: String;
Begin

   xsql := 'Begin SP_ALM_ARTICULOS_REPOSICION(''' + vcia + ''',''' + Trim(DMALM.wUsuario) + '''); End; ';
   DMALM.DCOM1.AppServer.EjecutaSQL(xsql);
   ShowMessage('Proceso Concluyo');
   FormShow(SELF);

   If DMALM.cdsGArti.RecordCount = 0 Then
   Begin
      edtCia.Text := vcia;
      edtCia.Color := $00B9FFFF;
      edtUltFecProc.Color := clred;
      EdtUsuProc.Color := clRed;
   End
   Else
   Begin
      edtCia.Text := DMALM.cdsGArti.FieldByname('CIAID').AsString;
      EdtUltFecProc.Text := DMALM.cdsGArti.FieldByname('FECULTPRO').AsString;
      EdtUsuProc.Text := DMALM.cdsGArti.FieldByname('USUARIO').AsString;
      edtCia.Color := $00B9FFFF;
      edtUltFecProc.Color := $00B9FFFF;
      EdtUsuProc.Color := $00B9FFFF;
   End;

End;

Procedure TFStockReposicion.FormShow(Sender: TObject);
Var
   xSQL, Xusuario: String;
   XFultproc, XFVencido: tDate;
   XDiasVal: Integer;
Begin

//Datos de la ultima evaluciación
   xSQL := 'Select CIAID, DIASVAL, FECULTPRO, USUARIO, FREG, ACTIVO, to_date(SYSDATE) FHOY '
      + '  from ALM_PAR_EVAL_STK_REPOSICION A '
      + ' Where CIAID=''' + vCia + ''' and  ACTIVO=''S'' ';
   DMALM.cdsGArti.Close;
   DMALM.cdsGArti.DataRequest(Xsql);
   DMALM.cdsGArti.Open;
   Xusuario := DMALM.cdsGArti.FieldByname('Usuario').AsString;
   XFultproc := DMALM.cdsGArti.FieldByname('Fecultpro').AsDateTime;
   XDiasVal := DMALM.cdsGArti.FieldByname('Diasval').AsInteger;
   XFVencido := XFultproc + XDiasVal;

   If (DMALM.cdsGArti.RecordCount = 0) Or
      (XFVencido <= DMALM.cdsGArti.FieldByName('fhoy').AsDateTime) Then
   Begin
      edtCia.Text := vcia;
      edtCia.Color := $00B9FFFF;
      edtUltFecProc.Color := clred;
      EdtUsuProc.Color := clRed;
   End
   Else
   Begin
      edtCia.Text := DMALM.cdsGArti.FieldByname('CIAID').AsString;
      EdtUltFecProc.Text := DMALM.cdsGArti.FieldByname('FECULTPRO').AsString;
      EdtUsuProc.Text := DMALM.cdsGArti.FieldByname('USUARIO').AsString;
      edtCia.Color := $00B9FFFF;
      edtUltFecProc.Color := $00B9FFFF;
      EdtUsuProc.Color := $00B9FFFF;
   End;

   dbgReposicion.Selected.clear;
   dbgReposicion.Selected.Add('TINABR'#9'15'#9'Tip.Invent.');
   dbgReposicion.Selected.Add('ARTID'#9'10'#9'Artículo');
   dbgReposicion.Selected.Add('ARTDES'#9'31'#9'Descripción');
   dbgReposicion.Selected.Add('STKACT'#9'5'#9' Actual(*) '#9'F'#9'Stock');
   dbgReposicion.Selected.Add('STKREP'#9'5'#9' Minimo '#9'F'#9'Stock');
   dbgReposicion.Selected.Add('REPUESTO'#9'5'#9' Repuesto '#9'F'#9'Stock');
   dbgReposicion.Selected.Add('CRITICO'#9'1'#9'Critico');

   xSQL := 'Select B.TINABR,A.ARTID,C.ARTDES,A.STKACT,A.STKREP,C.ARTCNTG,A.CRITICO,'
      + '       case when A.STKREP<C.ARTCNTG then C.ARTCNTG else 0 end REPUESTO '
      + '  From ALM_STK_REPOSICION A,TGE152 B,TGE205 C '
      + ' Where A.CIAID=''' + vcia + ''' AND '
      + '       A.CIAID=B.CIAID AND A.TINID=B.TINID AND '
      + '       A.CIAID=C.CIAID AND A.TINID=C.TINID AND A.ARTID=C.ARTID '
      + ' Order by B.TINABR,C.ARTDES ';
   DMALM.cdsQry.Close;
   DMALM.cdsQry.DataRequest(xsql);
   DMALM.cdsQry.Open;
   dbgReposicion.DataSource := DMALM.dsQry;
End;

Procedure TFStockReposicion.FormCreate(Sender: TObject);
Var
   xsql: String;
Begin
   xsql := 'Select CODIGO from TGE004 ' +
      'Where NTABLA=''TGE101'' and USERID=''' + DMALM.wUsuario + ''' and MODULOID=''ALM'' ';
   DMALM.cdsQry1.Close;
   DMALM.cdsQry1.DataRequest(xsql);
   DMALM.cdsQry1.Open;
   vcia := DMALM.cdsQry1.Fieldbyname('CODIGO').AsString;
End;

Procedure TFStockReposicion.BitBtn4Click(Sender: TObject);
Begin

   If DMALM.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No existe información para generar Excel');
      exit;
   End;

   Try
      DMALM.HojaExcel('Reposicion', DMALM.dsQry, DTGDATA);
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;

End;

Procedure TFStockReposicion.BitBtn1Click(Sender: TObject);
Begin
   FStockReposicion.Close;
   Close;
End;

Procedure TFStockReposicion.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMALM.cdsQry.Close;
   DMALM.cdsQry.IndexFieldNames := '';
   DMALM.cdsQry.Filter := '';
   DMALM.cdsQry.Filtered := False;

   DMALM.cdsQry1.Close;
   DMALM.cdsQry1.IndexFieldNames := '';
   DMALM.cdsQry1.Filter := '';
   DMALM.cdsQry1.Filtered := False;

   DMALM.cdsGArti.Close;
   DMALM.cdsGArti.IndexFieldNames := '';
   DMALM.cdsGArti.Filter := '';
   DMALM.cdsGArti.Filtered := False;
End;

Procedure TFStockReposicion.chkCRITICOClick(Sender: TObject);
Begin
   If chkCRITICO.Checked Then
   Begin
      DMALM.cdsQry.Filter := ' CRITICO=''S'' ';
      DMALM.cdsQry.Filtered := True;
   End
   Else
   Begin
      DMALM.cdsQry.Filter := '';
      DMALM.cdsQry.Filtered := False;
   End;
End;

End.

