unit UPesquisaRegiao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisa, Data.DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxGDIPlusClasses;

type
  TF_pesquisaRegiao = class(TF_basePesquisa)
    QRY_pesquisaRegiao: TFDQuery;
    DS_pesquisaRegiao: TDataSource;
    QRY_pesquisaRegiaoREG_CODIGO: TIntegerField;
    QRY_pesquisaRegiaoREG_NOME: TStringField;
    QRY_pesquisaRegiaoEST_SIGLA: TStringField;
    imgBack: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pesquisaRegiao: TF_pesquisaRegiao;

implementation

{$R *.dfm}

uses UDMConexao, UFunctions, UCadHospedesFJ;

procedure TF_pesquisaRegiao.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  if F_cadHospedesFJ.tipoFJ = 'F' then begin
    F_cadHospedesFJ.edtRegiao.Text := QRY_pesquisaRegiaoREG_CODIGO.AsString;
    F_cadHospedesFJ.edtCidade.Text := QRY_pesquisaRegiaoREG_NOME.AsString;
    F_cadHospedesFJ.edtUF.Text     := QRY_pesquisaRegiaoEST_SIGLA.AsString;
    Self.Close;
  end
  else begin
    F_cadHospedesFJ.edtRegiaoJ.Text := QRY_pesquisaRegiaoREG_CODIGO.AsString;
    F_cadHospedesFJ.edtCidadeJ.Text := QRY_pesquisaRegiaoREG_NOME.AsString;
    F_cadHospedesFJ.edtUFJ.Text     := QRY_pesquisaRegiaoEST_SIGLA.AsString;
    Self.Close;
  end;
end;

procedure TF_pesquisaRegiao.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  if Length(edtPesquisa.Text) > 2 then begin
    QRY_pesquisaRegiao.Close;
    QRY_pesquisaRegiao.Params[0].AsString := '%'+ edtPesquisa.Text +'%';
    QRY_pesquisaRegiao.Open();
  end;
end;

procedure TF_pesquisaRegiao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QRY_pesquisaRegiao.Close;
end;

procedure TF_pesquisaRegiao.FormShow(Sender: TObject);
begin
  inherited;
  ArredondaCantos(edtPesquisa);
  QRY_pesquisaRegiao.Open();
end;

end.
