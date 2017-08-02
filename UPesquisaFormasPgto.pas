unit UPesquisaFormasPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisa, Data.DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TF_pesquisaFormasPgto = class(TF_basePesquisa)
    QRY_tipoVendaCompra: TFDQuery;
    QRY_tipoVendaCompraTVC_ID: TIntegerField;
    QRY_tipoVendaCompraTVC_DESCRICAO: TStringField;
    QRY_tipoVendaCompraTVC_TEF: TStringField;
    QRY_tipoVendaCompraTVC_TARIFA: TBCDField;
    QRY_tipoVendaCompraTVC_OPECAIXA: TIntegerField;
    QRY_tipoVendaCompraTVC_DEBITO: TIntegerField;
    QRY_tipoVendaCompraTVC_CREDITO: TIntegerField;
    QRY_tipoVendaCompraTVC_ESPECIAL: TStringField;
    QRY_tipoVendaCompraTVC_LETRA: TStringField;
    QRY_tipoVendaCompraTVC_DESCONTO: TBCDField;
    QRY_tipoVendaCompraTVC_GERAREC: TStringField;
    QRY_tipoVendaCompraTVC_CLIENTE: TIntegerField;
    QRY_tipoVendaCompraTVC_TIPOVENDA: TStringField;
    QRY_tipoVendaCompraTVC_PONTOSFIDEL: TBCDField;
    QRY_tipoVendaCompraTVC_PRAZOPARCELA: TIntegerField;
    QRY_tipoVendaCompraTVC_NUMEROPARCELA: TIntegerField;
    QRY_tipoVendaCompraTVC_DESCONTOATACADO: TBCDField;
    QRY_tipoVendaCompraTVC_ATACADO: TStringField;
    QRY_tipoVendaCompraTVC_TIPODOCREC: TStringField;
    QRY_tipoVendaCompraTVC_CARTAOCREDEB: TStringField;
    QRY_tipoVendaCompraTVC_MOEDA: TStringField;
    QRY_tipoVendaCompraTVC_TIPODOCUMENTO: TIntegerField;
    DS_tipoVendaCompra: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBG_dadosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pesquisaFormasPgto: TF_pesquisaFormasPgto;

implementation

{$R *.dfm}

uses UDMConexao, UFormasPgto;

procedure TF_pesquisaFormasPgto.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  F_formasPgto.TipoPgto := QRY_tipoVendaCompra.FieldByName('TVC_ID').AsInteger;
  Self.Close;
end;

procedure TF_pesquisaFormasPgto.DBG_dadosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then begin
    btnSelecionarClick(Sender);
  end;
end;

procedure TF_pesquisaFormasPgto.FormShow(Sender: TObject);
begin
  inherited;
  QRY_tipoVendaCompra.Open();
  with QRY_tipoVendaCompra do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tipovendacompra where tvc_id = :idFormaPgto');
    ParamByName('idFormaPgto').Value := F_formasPgto.FpgtoControle;
    Open();
  end;
end;

end.
