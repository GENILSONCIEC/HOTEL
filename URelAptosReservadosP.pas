unit URelAptosReservadosP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBaseRelatorios, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinLilian, dxSkinOffice2007Black, dxSkinOffice2010Black,
  dxSkinsDefaultPainters, dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue,
  dxGDIPlusClasses, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TF_RelAptosReservadosP = class(TF_baseRelatorios)
    pnlDatas: TPanel;
    dtaFinal: TcxDateEdit;
    dtaInicio: TcxDateEdit;
    imgBack: TImage;
    lblDtaFinal: TLabel;
    lblDtaIinicio: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RelAptosReservadosP: TF_RelAptosReservadosP;

implementation

{$R *.dfm}

uses URelatoriosSwitch, UDMRelatorios, UMsg;

procedure TF_RelAptosReservadosP.btnGerarClick(Sender: TObject);
begin
  inherited;
  with F_dmRelatorios.QRY_relAptosReservados do begin
    Close;
    SQL.Clear;
    SQL.Add('select eh.*, ap.*, cl.cli_razao, cl.cli_fanta, ct.* from hotentrahospede eh');
    SQL.Add('        inner join hotapartamento ap on (eh.ent_codapartamento = ap.apa_codapartamento)');
    SQL.Add('        inner join hotcategoria ct on (ap.apa_codcategoria = ct.cat_codcategoria)');
    SQL.Add('        inner join cliente cl on (eh.ent_codhospede = cl.cli_codigo)');
    SQL.Add('        where ent_datareserva between :dtaIni and :dtaFin');// and ent_status = :status');
    Params[0].Value      := dtaInicio.Date;
    Params[1].Value      := dtaFinal.Date;
//    Params[2].Value      := 'RESERVADO';
    Open();
  end;

  if F_dmRelatorios.QRY_relAptosReservados.RecordCount < 1 then begin
    TF_msg.Mensagem('Não há Aptos. Reservados nesse período!','I',[mbOk]);
    dtaInicio.SetFocus;
  end
  else begin

    F_relatoriosSwitch.DtaIni := '';
    F_relatoriosSwitch.DtaFin := '';

    F_relatoriosSwitch.DtaIni := dtaInicio.Date;
    F_relatoriosSwitch.DtaFin := dtaFinal.Date;

    Self.Close;
  end;
end;

procedure TF_RelAptosReservadosP.FormShow(Sender: TObject);
begin
  inherited;
  {Show}
  dtaInicio.Date := StrToDate('01/01/1900');
  dtaFinal.Date  := Date;
end;

end.
