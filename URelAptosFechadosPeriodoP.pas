unit URelAptosFechadosPeriodoP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBaseRelatorios, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, dxGDIPlusClasses, frxClass, frxExportPDF, frxDBSet,
  System.ImageList, Vcl.ImgList, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinLilian, dxSkinOffice2007Black, dxSkinOffice2010Black,
  dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue;

type
  TF_relAptosFechadosPeriodoP = class(TF_baseRelatorios)
    dtaInicio: TcxDateEdit;
    lblDtaIinicio: TLabel;
    lblDtaFinal: TLabel;
    dtaFinal: TcxDateEdit;
    imgBack: TImage;
    frxDB_aptosFechadosDia: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDB_filial: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_relAptosFechadosPeriodoP: TF_relAptosFechadosPeriodoP;

implementation

{$R *.dfm}

uses UDMRelatorios, UMsg, UDMConexao, URelatoriosSwitch;

procedure TF_relAptosFechadosPeriodoP.FormShow(Sender: TObject);
begin
  inherited;
  dtaInicio.Date := Date;
  dtaFinal.Date  := Date;
end;

end.

