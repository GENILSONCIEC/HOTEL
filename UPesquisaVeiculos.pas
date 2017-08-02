unit UPesquisaVeiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisa, Data.DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxGDIPlusClasses;

type
  TF_pesquisaVeiculos = class(TF_basePesquisa)
    QRY_locVeiculos: TFDQuery;
    DS_locVeiculos: TDataSource;
    QRY_locVeiculosVEI_CODIGO: TIntegerField;
    QRY_locVeiculosVEI_MODELO: TStringField;
    QRY_locVeiculosVEI_MARCA: TStringField;
    QRY_locVeiculosVEI_LINHA: TStringField;
    QRY_locVeiculosVEI_PLACA: TStringField;
    QRY_locVeiculosVEI_COR: TStringField;
    imgBack: TImage;
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBG_dadosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FIdSelecionado: Integer;
  public
    { Public declarations }
    property IdSelecionado: Integer read FIdSelecionado;
  end;

var
  F_pesquisaVeiculos: TF_pesquisaVeiculos;

implementation

{$R *.dfm}

uses UDMConexao, UCadVeiculos;

procedure TF_pesquisaVeiculos.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  FIdSelecionado := QRY_locVeiculos.FieldByName('VEI_CODIGO').AsInteger;
  Close;
end;

procedure TF_pesquisaVeiculos.DBG_dadosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then begin
    btnSelecionar.Click;
  end;
end;

procedure TF_pesquisaVeiculos.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if key = #13 then begin
    with QRY_locVeiculos do begin
      Close;
      SQL.Clear;
      SQL.Add('select * from hotveiculos where vei_placa like :placa');
      ParamByName('placa').Value := '%' + edtPesquisa.Text + '%';
      Open();
    end;

    if QRY_locVeiculos.RecordCount > 0 then
      DBG_dados.SetFocus;
  end
  else begin
    if Length(edtPesquisa.Text) >= 2 then begin
      with QRY_locVeiculos do begin
      Close;
      SQL.Clear;
      SQL.Add('select * from hotveiculos where vei_placa like :placa');
      ParamByName('placa').Value := '%' + edtPesquisa.Text + '%';
      Open();
    end;

    if QRY_locVeiculos.RecordCount > 0 then
      if key = #13 then
        DBG_dados.SetFocus;
    end;
  end;
end;

procedure TF_pesquisaVeiculos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  F_cadVeiculos.idVeiculo := FIdSelecionado;
  QRY_locVeiculos.Destroy;
end;

end.
