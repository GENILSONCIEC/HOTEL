unit UPesquisaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisa, Vcl.ExtCtrls, Data.DB,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, dxGDIPlusClasses;

type
  TF_pesquisaProdutos = class(TF_basePesquisa)
    DS_produtos: TDataSource;
    imgBack: TImage;
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBG_dadosKeyPress(Sender: TObject; var Key: Char);
    procedure DBG_dadosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pesquisaProdutos: TF_pesquisaProdutos;

implementation

{$R *.dfm}

uses UMsg, UDMProdutosApto, ULancaProdutos;

procedure TF_pesquisaProdutos.btnSelecionarClick(Sender: TObject);
begin //selecionar o produto
  inherited;
  F_lancaProdutos.edtCodPro.Text         := F_dmProdutosApto.QRY_produtosPRO_CODIGO.AsString;
  F_lancaProdutos.edtProduto.Text        := F_dmProdutosApto.QRY_produtosPRO_NOMECOMPLETO.AsString;
  F_lancaProdutos.edtVlrUnit.Text        := F_dmProdutosApto.QRY_produtosPRO_VENDA.AsString;
  Self.Close;
  F_lancaProdutos.edtVlrUnit.SetFocus;
end;

procedure TF_pesquisaProdutos.DBG_dadosDblClick(Sender: TObject);
begin
  inherited;
  btnSelecionar.Click;
end;

procedure TF_pesquisaProdutos.DBG_dadosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then begin
    btnSelecionar.Click;
  end;
end;

procedure TF_pesquisaProdutos.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//Fazendo a busca - consulta (ao precionar enter)
  if key = #13 then begin
    if Length(edtPesquisa.Text) = 0 then begin
      TF_msg.Mensagem('Campo Produto não poderá ficar em branco. Favor, digita alguma coisa!','I',[mbOk]);
      edtPesquisa.Clear;
      edtPesquisa.SetFocus;
      exit;
    end
    else begin
        with F_dmProdutosApto.QRY_produtos do begin
          Close;
          SQL.Clear;
          SQL.Add('select pro_codigo, pro_nomecompleto, pro_embalagem, pro_venda, pro_vendapra from produto');
          SQL.Add('where pro_nomecompleto like :nomeProduto');
          ParamByName('nomeProduto').Value := '%' + edtPesquisa.Text + '%';

          Open();

          if RecordCount = 0 then begin
          TF_msg.Mensagem('Produto não encontrado.','I',[mbOk]);
          edtPesquisa.Clear;
          exit;
          end;
        end; //fim do width
      end;
    DBG_dados.SetFocus;
  end; //fim do key press
end;

procedure TF_pesquisaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  F_dmProdutosApto.QRY_produtos.SQL.Clear; //para limpar a pesquisa da grid
end;

procedure TF_pesquisaProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  if F_dmProdutosApto = nil then begin
    Application.CreateForm(TF_dmProdutosApto, F_dmProdutosApto);
  end;
end;

end.
