unit URelAptosReservados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBaseRelatorios, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxGDIPlusClasses,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, frxClass, frxExportPDF,
  frxDBSet, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinLilian,
  dxSkinOffice2007Black, dxSkinOffice2010Black, dxSkinVisualStudio2013Blue,
  dxSkinXmas2008Blue;

type
  TF_relAptosReservados = class(TF_baseRelatorios)
    dtaFinal: TcxDateEdit;
    dtaInicio: TcxDateEdit;
    imgBack: TImage;
    lblDtaFinal: TLabel;
    lblDtaIinicio: TLabel;
    frxDB_filial: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDB_relAptosReservados: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_relAptosReservados: TF_relAptosReservados;

implementation

{$R *.dfm}

uses UDMRelatorios, UMsg, UDMConexao;

procedure TF_relAptosReservados.btnGerarClick(Sender: TObject);
begin
  inherited;
  try
    if F_dmRelatorios = nil then begin
      Application.CreateForm(TF_dmRelatorios, F_dmRelatorios);
    end;
    with F_dmRelatorios.QRY_relAptosReservados do begin
      Close;
      SQL.Clear;
      SQL.Add('select eh.*, ap.apa_apartamento, ct.cat_valordiaria1, ct.cat_valordiaria2 from hotentrahospede eh');
      SQL.Add('    inner join hotapartamento ap on (eh.ent_codapartamento = ap.apa_codapartamento)');
      SQL.Add('    inner join hotcategoria ct on (ap.apa_codcategoria = ct.cat_codcategoria)');
      SQL.Add('    where ent_datareserva between :dtaIni and :dtaFin and ent_status = :status');

      ParamByName('dtaIni').Value   := dtaInicio.Date;
      ParamByName('dtaFin').Value   := dtaFinal.Date;
      ParamByName('status').Value   := 'RESERVADO';
      Open();
    end;

    if F_dmRelatorios.QRY_relAptosReservados.RecordCount < 1 then begin
      TF_msg.Mensagem('Não há Aptos reservados nesse período.','I',[mbOk]);
      dtaInicio.SetFocus;
      exit;
    end;

    frxReport.ShowReport();
  finally
    FreeAndNil(F_dmRelatorios);
  end;
end;

procedure TF_relAptosReservados.FormShow(Sender: TObject);
begin
  inherited;
  dtaInicio.Date := Date;
  dtaFinal.Date  := Date;
end;

end.
