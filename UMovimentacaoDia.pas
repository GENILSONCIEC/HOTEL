unit UMovimentacaoDia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.ComCtrls, RzDTP, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, dxCore, cxDateUtils, Vcl.Buttons, frxClass, frxDBSet, Data.DB,
  Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList;

type
  TF_movDia = class(TF_baseTelaSimples)
    lblMovimentacao: TLabel;
    frxDB_movDiario: TfrxDBDataset;
    frxReport: TfrxReport;
    ImageList20: TImageList;
    gbxFechamento: TGroupBox;
    lblDtaInicial: TLabel;
    dtaInicial: TcxDateEdit;
    lblDtaFim: TLabel;
    dtaFinal: TcxDateEdit;
    btnGerar: TButton;
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_movDia: TF_movDia;

implementation

{$R *.dfm}

uses UDMRelatorios, UMsg;

procedure TF_movDia.btnGerarClick(Sender: TObject);
begin
  inherited;
//  if (dtaInicial.Text = '') or (dtaFinal.Text = '') then begin
//    TF_msg.Mensagem('Datas inválidas!','I',[mbOk]);
//    exit;
//  end;

//  with F_dmRelatorios.QRY_movDiario do begin
//    Close;
//    SQL.Clear;
//    SQL.Add('select * from movimento_caixa (:d1,:d2,1,1)');
//    ParamByName('d1').Value := dtaInicial.Date;
//    ParamByName('d2').Value := dtaFinal.Date;
//    Open();
//  end;
//
//  frxReport.ShowReport();
ShowMessage('Ainda não está pronto');
end;

end.
