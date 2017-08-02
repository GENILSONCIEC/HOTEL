unit UPesquisaBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisa, Data.DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TF_pesquisaBanco = class(TF_basePesquisa)
    DS_banco: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBG_dadosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pesquisaBanco: TF_pesquisaBanco;

implementation

{$R *.dfm}

uses UFormasPgto, UParcelamento;

procedure TF_pesquisaBanco.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  F_parcelamento.edtBanco.Text := F_formasPgto.QRY_bancoBAN_NOME.AsString;
  F_parcelamento.edtCodBanco.Text := IntToStr(F_formasPgto.QRY_bancoBAN_CODIGO.Value);

  F_parcelamento.edtBanco.SetFocus;
  F_parcelamento.edtBanco.SelStart := 0;

  Self.Close;
end;

procedure TF_pesquisaBanco.DBG_dadosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then begin
    btnSelecionarClick(Sender);
  end;
end;

procedure TF_pesquisaBanco.FormShow(Sender: TObject);
begin
  inherited;
  F_formasPgto.QRY_banco.Open();
end;

end.
