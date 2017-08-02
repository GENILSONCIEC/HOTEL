unit URelReimprimeEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBaseRelatorios, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxGDIPlusClasses,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, frxClass, frxDBSet,
  dxSkinLilian;

type
  TF_relReimprimeEntrada = class(TF_baseRelatorios)
    dtaFinal: TcxDateEdit;
    dtaInicio: TcxDateEdit;
    imgBack: TImage;
    lblDtaFinal: TLabel;
    lblDtaIinicio: TLabel;
    lblApto: TLabel;
    edtApto: TcxTextEdit;
    frxDB_filial: TfrxDBDataset;
    frxDB_reimprime: TfrxDBDataset;
    frxReport: TfrxReport;
    procedure btnGerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_relReimprimeEntrada: TF_relReimprimeEntrada;

implementation

{$R *.dfm}

uses UDMConexao, UDMRelatorios, UMsg;

procedure TF_relReimprimeEntrada.btnGerarClick(Sender: TObject);
begin
  inherited;
  if edtApto.Text = '' then begin
    TF_msg.Mensagem('Campo Apto não pode ficar vazio.','I',[mbOk]);
    edtApto.SetFocus;
    exit;
  end;

  F_dmRelatorios.QRY_reimprimeFaturaEntrada.Close;
  F_dmRelatorios.QRY_reimprimeFaturaEntrada.Params[0].Value := edtApto.Text;
  F_dmRelatorios.QRY_reimprimeFaturaEntrada.Open();

  if F_dmRelatorios.QRY_reimprimeFaturaEntrada.RecordCount > 0 then begin
    if not FileExists(ExtractFilePath(Application.ExeName) + 'RelFR3\ReimpressaoEntradaHospedes.fr3') then begin
      TF_msg.Mensagem('Arquivo "ReimpressaoEntradaHospedes.fr3" na Pasta "RelFR3" não encontrado. Favor, contate o Suporte','I',[mbOk]);
      exit;
    end
    else begin
      frxReport.PrepareReport();
      frxReport.ShowReport();
    end;
  end
  else begin
    TF_msg.Mensagem('Não há relatório para imprimir com esse Apto. Favor, reveja qual Apto deseja imprimir.','I',[mbOk]);
    edtApto.SetFocus;
    exit;
  end;
end;

procedure TF_relReimprimeEntrada.FormShow(Sender: TObject);
begin
  inherited;
  edtApto.SetFocus;

  if F_dmRelatorios = nil then begin
    Application.CreateForm(TF_dmRelatorios, F_dmRelatorios);
  end;
end;

end.
