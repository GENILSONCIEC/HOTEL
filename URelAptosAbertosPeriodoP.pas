unit URelAptosAbertosPeriodoP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBaseRelatorios, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinLilian, dxSkinOffice2007Black, dxSkinOffice2010Black,
  dxSkinsDefaultPainters, dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, dxGDIPlusClasses,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.StdCtrls;

type
  TF_RelAptosAbertosPeriodoP = class(TF_baseRelatorios)
    pnlDatas: TPanel;
    imgBack: TImage;
    lblDtaFinal: TLabel;
    lblDtaIinicio: TLabel;
    dtaFinal: TcxDateEdit;
    dtaInicio: TcxDateEdit;
    procedure btnGerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RelAptosAbertosPeriodoP: TF_RelAptosAbertosPeriodoP;

implementation

{$R *.dfm}

uses UDMRelatorios, UMsg, URelatoriosSwitch;

procedure TF_RelAptosAbertosPeriodoP.btnGerarClick(Sender: TObject);
begin
  inherited;
  with F_dmRelatorios.QRY_relAptosAbertosPeriodo do begin
    Close;
    SQL.Clear;
    SQL.Add('select cl.cli_razao, eh.*, ap.apa_apartamento, ct.cat_categoria from hotentrahospede eh');
    SQL.Add(' inner join cliente cl on (eh.ent_codhospede = cl.cli_codigo)');
    SQL.Add(' inner join hotapartamento ap on (eh.ent_codapartamento = ap.apa_codapartamento)');
    SQL.Add(' inner join hotcategoria ct on (ap.apa_codcategoria = ct.cat_codcategoria)');
    SQL.Add(' where eh.ent_dataentrada between :dtaIni and :dtaFin   order by ct.cat_categoria');
    Params[0].Value   := dtaInicio.Date;
    Params[1].Value   := dtaFinal.Date;
    Open();
  end;

  if F_dmRelatorios.QRY_relAptosAbertosPeriodo.RecordCount < 1 then begin
    TF_msg.Mensagem('Não há Aptos. Abertos nesse período!','I',[mbOk]);
    dtaInicio.SetFocus;
  end
  else begin
    {apenas fecha o form - e alimenta as variáveis das datas}

    F_relatoriosSwitch.DtaIni := '';
    F_relatoriosSwitch.DtaIni := '';

    F_relatoriosSwitch.DtaIni := dtaInicio.Date;
    F_relatoriosSwitch.DtaFin := dtaFinal.Date;

    Self.Close;

  end;
end;

procedure TF_RelAptosAbertosPeriodoP.FormShow(Sender: TObject);
begin
  inherited;
  dtaInicio.Date  := StrToDate('01/01/1900');
  dtaFinal.Date   := Date;

  dtaInicio.SetFocus;
end;

end.
