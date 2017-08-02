unit UMovEntradaSaidasPeriodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBaseCadastro, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxPC, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxTextEdit,
  cxCurrencyEdit, Vcl.StdCtrls, dxGDIPlusClasses;

type
  TF_movEntradasSaidas = class(TForm)
    pnlTopo: TPanel;
    pagMov: TcxPageControl;
    tabEntrada: TcxTabSheet;
    tabSaida: TcxTabSheet;
    DBGrid_entrada: TDBGrid;
    DS_entrada: TDataSource;
    DS_saida: TDataSource;
    DBGrid_saida: TDBGrid;
    pnlEntra: TPanel;
    imgResultado: TImage;
    lblGNormal: TLabel;
    lblGExtra: TLabel;
    edtVlrGNormal: TcxCurrencyEdit;
    edtVlrGExtra: TcxCurrencyEdit;
    pnlSaida: TPanel;
    imgSaida: TImage;
    lblVlrGSaida: TLabel;
    lblVlrESaida: TLabel;
    edtVlrNSaida: TcxCurrencyEdit;
    edtVlrESaida: TcxCurrencyEdit;
    btnImprimeEntrada: TSpeedButton;
    btnImprimeSaida: TSpeedButton;
    pnlFechar: TPanel;
    btnMinimizar: TSpeedButton;
    btnMaximizar: TSpeedButton;
    btnFechar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_movEntradasSaidas: TF_movEntradasSaidas;

implementation

{$R *.dfm}

uses UDMMovEntradaSaida;

procedure TF_movEntradasSaidas.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TF_movEntradasSaidas.FormShow(Sender: TObject);
begin
  if F_dmMovimentacao = nil then begin
    Application.CreateForm(TF_dmMovimentacao, F_dmMovimentacao);
  end;

  {Abre os DataSets}
  DS_entrada.DataSet.Open();
  DS_saida.DataSet.Open();

  {Passa os valores para as variáveis}
  edtVlrGNormal.Value  := 0;
  edtVlrGExtra.Value := 0;

  DS_entrada.DataSet.First;
  while not DS_entrada.DataSet.Eof do begin
    edtVlrGNormal.Value  := edtVlrGNormal.Value + F_dmMovimentacao.QRY_movEntradaENT_VLR_DIARIA_NORMAL.AsCurrency;
    edtVlrGExtra.Value   := edtVlrGExtra.Value + F_dmMovimentacao.QRY_movEntradaENT_VLR_DIARIA_EXTRA.AsCurrency;
    DS_entrada.DataSet.Next;
  end;
end;

end.
