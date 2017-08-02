unit ULancaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, UFunctions,
  Vcl.Mask, RzEdit, RzDBEdit, RzDBBnEd, JvExMask, JvToolEdit, JvBaseEdits,
  RzBtnEdt, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxCurrencyEdit,
  dxGDIPlusClasses, cxMaskEdit, cxButtonEdit, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinLilian, dxSkinOffice2007Black,
  dxSkinOffice2010Black, dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue;

type
  TF_lancaProdutos = class(TForm)
    pnlGeral: TPanel;
    pnlAdm: TPanel;
    lblCodEntrada: TLabel;
    lblCodH: TLabel;
    lblNumCli: TLabel;
    lblNomeCliente: TLabel;
    lblCodC: TLabel;
    lblNomeC: TLabel;
    pnlLancamento: TPanel;
    lblCodigoP: TLabel;
    lblProduto: TLabel;
    lblVlr: TLabel;
    lblQtd: TLabel;
    lblSubTotal: TLabel;
    lblObs: TLabel;
    pnlRodape: TPanel;
    pnlDados: TPanel;
    pnlItensAdd: TPanel;
    lblItens: TLabel;
    DBG_itensHospede: TDBGrid;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLocalizar: TSpeedButton;
    DS_cadMV2: TDataSource;
    v: TImage;
    edtObservacao: TcxTextEdit;
    edtCodPro: TcxButtonEdit;
    edtProduto: TcxTextEdit;
    edtSubTotal: TcxCurrencyEdit;
    edtVlrUnit: TcxCurrencyEdit;
    edtQtd: TcxCurrencyEdit;
    btnAdd: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtQtdExit(Sender: TObject);
    procedure edtCodProPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DS_cadMV2StateChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtProdutoPropertiesChange(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtCodProExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_lancaProdutos: TF_lancaProdutos;

implementation

{$R *.dfm}

uses UDMRackApto, UDMProdutosApto, UPesquisaProdutos, UDMHospedes, UDMConexao,
  UMsg;

procedure TF_lancaProdutos.btnAddClick(Sender: TObject);
begin  //Adiciona os produtos na tabela temporária
  DS_cadMV2.DataSet.Append;
  F_dmProdutosApto.QRY_cadMV2ME2_DOCTO.AsString                 := CodEntrada;
  F_dmProdutosApto.QRY_cadMV2ME2_OPERACAO.AsInteger             := 10;
  F_dmProdutosApto.QRY_cadMV2ME2_DATA.AsDateTime                := Now;
  F_dmProdutosApto.QRY_cadMV2ME2_QUATIDADE.AsFloat              := edtQtd.Value;
  F_dmProdutosApto.QRY_cadMV2ME2_VLRUNIT.AsFloat                := edtVlrUnit.Value;
  F_dmProdutosApto.QRY_cadMV2ME2_PRONOME.AsString               := edtProduto.Text;
  F_dmProdutosApto.QRY_cadMV2ME2_VLRTOTAL.AsFloat               := edtSubTotal.Value;
  F_dmProdutosApto.QRY_cadMV2ME2_DESCONTO.AsFloat               := 0;
  F_dmProdutosApto.QRY_cadMV2ME2_FUNCIONARIO.AsInteger          := 1; //vem do user logado
  F_dmProdutosApto.QRY_cadMV2ME2_COMPLEMENTO.AsString           := edtObservacao.Text;
  F_dmProdutosApto.QRY_cadMV2ME2_PRODUTO.AsInteger              := StrToInt(edtCodPro.Text); {grava o id do produto}
  F_dmProdutosApto.QRY_cadMV2ME2_BOMBA.AsString                 := CodApartamento;   {grava o id do Apto}


  //coloca a chave nos itens

  {Esse bloco abaico comentado está mais organizado que o que está usando.}
  if F_dmProdutosApto.QRY_cadMV2ME2_ID.AsInteger < 1 then begin
    if not F_dmConexao.GeraChave('MVESTOQUE2', F_dmProdutosApto.QRY_cadMV2ME2_ID) then
    begin
      abort;
    end;
  end;

  edtObservacao.Clear;
  edtSubTotal.Clear;
  edtQtd.Clear;
  edtVlrUnit.Clear;
  edtProduto.Clear;
  edtCodPro.Clear;
  edtCodPro.SetFocus;

end;

procedure TF_lancaProdutos.btnCancelarClick(Sender: TObject);
begin
  DS_cadMV2.DataSet.Cancel;
end;

procedure TF_lancaProdutos.btnDeletarClick(Sender: TObject);
begin
  if TF_msg.Mensagem('Deseja mesmo apagar esse produto?','I',[mbSim, mbNao]) then begin
    DS_cadMV2.DataSet.Delete;
    F_dmProdutosApto.QRY_cadMV2.ApplyUpdates(0);
  end;
end;

procedure TF_lancaProdutos.btnSalvarClick(Sender: TObject);
begin

//==================================== Cria a Venda para o Hospede - btnSalvar =======================================
  if temVenda = True then begin
    //Já tem a venda

  try

  F_dmConexao.FDConn.StartTransaction;
  DS_cadMV2.DataSet.Post; {post e applyUpdates são dados aqui e não na hora que insere os ítens.}
  F_dmProdutosApto.QRY_cadMV2.ApplyUpdates();
  F_dmConexao.FDConn.Commit;

  TF_msg.Mensagem('Produto lançado com sucesso!','I',[mbOk]);

  {se gravar e ao mesmo tempo inserir outro produto dá erro. por isso fecho e abro para garantir que nao vai da}
  DS_cadMV2.DataSet.Close;
  DS_cadMV2.DataSet.Open;

    except on e:Exception do begin
      F_dmProdutosApto.QRY_cadMV2ME2_ID.Clear;
      F_dmConexao.FDConn.Rollback;
      showMessage('Erro '+e.Message);
    end;
  end;

    AtualizaGridProdutosApto;

  end
  else begin
    //cria uma venda baseada no código de entrada do apto escolhido.
    with F_dmProdutosApto.QRY_cadOS1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into oservico1(OS1_DOCTOS, OS1_TIPOOS, OS1_SETOR, OS1_TIPOVENDA, OS1_DATABERTA, OS1_HORABERTA,' +
            'OS1_CLIENTE, OS1_NOMCLI, OS1_RECLAMA1, OS1_TOTPARCELA, OS1_CONSULTOR, OS1_VENDEDOR, OS1_ANDAMENTO,' +
            'OS1_CONFIGURACAO, OS1_COR, OS1_EQUIPAMENTO, OS1_FILIAL, OS1_STATUS)');
    SQL.Add('values (:OS1_DOCTOS, :OS1_TIPOOS, :OS1_SETOR, :OS1_TIPOVENDA,' +
            ':OS1_DATABERTA, :OS1_HORABERTA,:OS1_CLIENTE, :OS1_NOMCLI, :OS1_RECLAMA1,' +
            ':OS1_TOTPARCELA, :OS1_CONSULTOR, :OS1_VENDEDOR, :OS1_ANDAMENTO, :OS1_CONFICUARACAO,' +
            ':OS1_COR, :OS1_EQUIPAMENTO, :OS1_FILIAL, :OS1_STATUS)');

      ParamByName('OS1_DOCTOS').Value     := CodEntrada;
      ParamByName('OS1_TIPOOS').Value     := 1;  //padrão (clientes)
      ParamByName('OS1_SETOR').Value      := '02'; //padrão (assistência)
      ParamByName('OS1_TIPOVENDA').Value  := 'V'; //padrão (vista)
      ParamByName('OS1_DATABERTA').Value  := Date;
      ParamByName('OS1_HORABERTA').Value  := Now;
      ParamByName('OS1_CLIENTE').Value    := F_dmProdutosApto.QRY_pegaHospedeCLI_CODIGO.Value;
      ParamByName('OS1_NOMCLI').Value     := F_dmProdutosApto.QRY_pegaHospedeCLI_RAZAO.AsString;
      ParamByName('OS1_RECLAMA1').Value   := edtObservacao.Text;

      ParamByName('OS1_TOTPARCELA').Value    := 1;  //tot. parcelas (um é o padrão)
      ParamByName('OS1_CONSULTOR').Value     := 1;  //o mesmo vendedor
      ParamByName('OS1_VENDEDOR').Value      := 1;  //código do vendedor
      ParamByName('OS1_ANDAMENTO').Value     := 'A'; //está em andamento
      ParamByName('OS1_CONFICUARACAO').Value := '0'; //padrão do ciec

      ParamByName('OS1_COR').Value := '1'; //padrão
      ParamByName('OS1_EQUIPAMENTO').Value := '1'; //padrão
      ParamByName('OS1_FILIAL').Value := '1'; //padrão
      ParamByName('OS1_STATUS').Value := '';
      ExecSQL;
    end;
    F_dmProdutosApto.QRY_cadMV2.ApplyUpdates(); //para gravar os itens que foram lançados quando nao tinha a venda
    TF_msg.Mensagem('Produto lançado com sucesso!','I',[mbOk]);
  end;
end;

procedure TF_lancaProdutos.DS_cadMV2StateChange(Sender: TObject);
var i: Integer;
begin {habilita ou desabilita os botões de controle do formulário}
  btnNovo.Enabled := not (DS_cadMV2.State in [dsInsert, dsEdit]);
  btnEditar.Enabled := btnNovo.Enabled and (DS_cadMV2.DataSet.RecordCount > 0);
  btnDeletar.Enabled := btnEditar.Enabled;
  btnLocalizar.Enabled := btnNovo.Enabled;
  btnSalvar.Enabled := DS_cadMV2.State in [dsInsert, dsEdit];
  btnCancelar.Enabled := btnSalvar.Enabled;
  for i := 0 to ComponentCount -1 do
    if Components[i].Tag > 0 then
      TControl(Components[i]).Enabled := DS_cadMV2.State in [dsInsert, dsEdit];
end;

procedure TF_lancaProdutos.edtCodProExit(Sender: TObject);
begin
  if ENumerico(edtCodPro.Text) then begin
   if edtCodPro.Text = '' then begin
    exit;
    end
    else begin
    with F_dmProdutosApto.QRY_produtos do begin
      Close;
      SQL.Clear;
      SQL.Add('select pro_codigo, pro_nomecompleto, pro_embalagem, pro_venda, pro_vendapra from produto');
      SQL.Add('where pro_codigo = :codigo');
      ParamByName('codigo').Value := edtCodPro.Text;

      Open();

      if RecordCount = 0 then begin
        TF_msg.Mensagem('Produto não encontrado.','I',[mbOk]);
        edtCodPro.SetFocus;
        exit;
      end
        else begin
          edtProduto.Text     := F_dmProdutosApto.QRY_produtosPRO_NOMECOMPLETO.AsString;
          edtVlrUnit.Value    := F_dmProdutosApto.QRY_produtosPRO_VENDA.AsCurrency;
          edtQtd.SetFocus;
        end;
      end; //fim do width
    end;
  end
  else begin
    TF_msg.Mensagem('Valor inválido. Favor, informar um número para o código do Produto.','I',[mbOk]);
    TcxButtonEdit(Sender).SetFocus;
    exit;
  end;
end;

procedure TF_lancaProdutos.edtCodProPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  CriaFormDestroy(TF_pesquisaProdutos, F_pesquisaProdutos);
end;

procedure TF_lancaProdutos.edtObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then begin
    if Length(edtObservacao.Text) > 3 then begin
      btnAddClick(Sender);//adiciona os produtos ao precionar enter
    end;
  end;
end;

procedure TF_lancaProdutos.edtProdutoPropertiesChange(Sender: TObject);
begin
  if Length(edtProduto.Text) > 3 then begin
    btnAdd.Visible := True;
  end
  else begin
    btnAdd.Visible := False;
  end;
end;

procedure TF_lancaProdutos.edtQtdExit(Sender: TObject);
begin
  if (TcxCurrencyEdit(Sender).Value <= 0) or (TcxCurrencyEdit(Sender).Text = '') then begin
    TF_msg.Mensagem('Quantidade inválida.','I',[mbOk]);
    TcxCurrencyEdit(Sender).SetFocus;
    exit;
  end
  else begin
    edtSubTotal.Value := edtVlrUnit.Value * edtQtd.Value;
  end;
end;

procedure TF_lancaProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DS_cadMV2.DataSet.State in [dsInsert] then begin
    if not TF_msg.Mensagem('Existem produtos para serem gravados. Deseja mesmo cancelar todos?','Q',[mbSim,mbNao]) then begin
      CanClose := False;
    end;
  end;
end;

procedure TF_lancaProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then begin
    Self.Close;
  end;

  if key = VK_F4 then begin
    btnCancelar.Click;
  end;

  if key = VK_F5 then begin
    btnSalvar.Click;
  end;

  if key = VK_F6 then begin
    btnDeletar.Click;
  end;

end;

procedure TF_lancaProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    //SendMessage(Handle, WM_NEXTDLGCTL, 0,0);  //mais lento
    Perform(WM_NEXTDLGCTL, 0,0); //mais rápido
  end;
end;

procedure TF_lancaProdutos.FormShow(Sender: TObject);
begin  //onShow
  if Livre = False then begin  //se for falso é pq já foi ocupado
    lblCodH.Caption := '00' + CodEntrada;
  end;

  //pegando o hospede
  if F_dmProdutosApto = nil then begin
    Application.CreateForm(TF_dmProdutosApto, F_dmProdutosApto);
  end;

  with F_dmProdutosApto.QRY_pegaHospede do begin
    Close;
    SQL.Clear;
    SQL.Add('select cl.cli_codigo, cl.cli_razao, cl.cli_fanta from cliente cl');
    SQL.Add('inner join hotentrahospede eh on  (cl.cli_codigo = eh.ent_codhospede)');
    SQL.Add('where eh.ent_codapartamento = :codApto and eh.ent_datasaida is null');
    ParamByName('codApto').Value := CodApartamento;
    Open();
  end;

    lblCodC.Caption    := '00' + IntToStr(F_dmProdutosApto.QRY_pegaHospedeCLI_CODIGO.Value);
    lblNomeC.Caption   := F_dmProdutosApto.QRY_pegaHospedeCLI_RAZAO.AsString;

    DS_cadMV2.DataSet.Open;  //abre a qry_cadMV2 que lista também os ítens

    with F_dmProdutosApto.QRY_cadMV2 do begin
      Close;
      SQL.Clear;
      SQL.Add('select ME2_ID, ME2_DOCTO, ME2_OPERACAO, ME2_DATA, ME2_QUATIDADE, ME2_VLRUNIT,');
      SQL.Add('ME2_PRONOME, ME2_VLRTOTAL, ME2_DESCONTO, ME2_FUNCIONARIO, ME2_COMPLEMENTO, ME2_PRODUTO,');
      SQL.Add('ME2_BOMBA from mvestoque2 WHERE ME2_DOCTO = :codEntrada');
      ParamByName('codEntrada').Value := CodEntrada;
      Open();
    end;
end;

end.
