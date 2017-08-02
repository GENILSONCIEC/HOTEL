unit UProdutosApto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  CalcEdit, AdvPanel, AdvGlowButton, AdvOfficeImage, RzLabel, TFlatPanelUnit,
  dxGDIPlusClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TF_produtosApto = class(TF_baseTelaSimples)
    gbxCabecalho: TGroupBox;
    lblCodEntrada: TLabel;
    edtCodEntrada: TEdit;
    lblDataLcto: TLabel;
    DTP_dtaLcto: TDateTimePicker;
    lblHoraLcto: TLabel;
    DTP_horaLcto: TDateTimePicker;
    lblNumCli: TLabel;
    edtCodCli: TEdit;
    lblNomeCliente: TLabel;
    edtNomeCliente: TEdit;
    pnlControle: TPanel;
    btnGravar: TSpeedButton;
    gbxDados: TGroupBox;
    DBG_itens: TDBGrid;
    btnNovo: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    lblCodPro: TLabel;
    edtCodPro: TEdit;
    lblNomeProduto: TLabel;
    edtNomeProduto: TEdit;
    btnPesquiarProduto: TSpeedButton;
    lblVlrUnit: TLabel;
    edtVlrUnit: TEdit;
    lblQtd: TLabel;
    edtQtd: TEdit;
    lblVlrTotal: TLabel;
    edtVlrTotal: TEdit;
    lblObservacao: TLabel;
    mmoObservacao: TMemo;
    btnAddItens: TButton;
    DS_listaProdutosMV2: TDataSource;
    imgBackground: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquiarProdutoClick(Sender: TObject);
    procedure btnAddItensClick(Sender: TObject);
    procedure edtQtdExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_produtosApto: TF_produtosApto;

implementation

{$R *.dfm}

uses UFunctions, URackApto, UDMRackApto, UDMHospedes, UDMProdutosApto,
  UPesquisaProdutos, UMsg;

procedure TF_produtosApto.btnAddItensClick(Sender: TObject);
begin
  inherited;
//  try
//  //comando
//  except
//    on E: Exception do
//   ShowMessage('O erro é: '+E.Message);
//  end;

  //1º atualiza a chave da entidade
  with F_dmProdutosApto.QRY_entidade do begin
    Close;
    SQL.Clear;
    SQL.Add('update ENTIDADE');
    SQL.Add('set ENT_CHAVE = ENT_CHAVE + 1');
    SQL.Add('where (ENT_CODIGO = :ENT_CODIGO)');
    ParamByName('ENT_CODIGO').Value := 'MVESTOQUE2';
    ExecSQL
  end;

  //2º seleciona a chave da entidade
  with F_dmProdutosApto.QRY_entidade do begin
    Close;
    SQL.Clear;
    SQL.Add('Select ENT_CHAVE from ENTIDADE where ENT_CODIGO = :PENT_CODIGO');
    ParamByName('PENT_CODIGO').Value := 'MVESTOQUE2';
    Open();
  end;

  //3º insere o item no mvestoque2
  with F_dmProdutosApto.QRY_cadMV2 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into MVESTOQUE2(ME2_ID, ME2_DOCTO, ME2_OPERACAO, ME2_DATA, ME2_QUATIDADE, ME2_VLRUNIT,' +
            'ME2_PRONOME, ME2_VLRTOTAL, ME2_COMPLEMENTO, ME2_PRODUTO)');
    SQL.Add('values (:ME2_ID, :ME2_DOCTO, :ME2_OPERACAO, :ME2_DATA, :ME2_QUATIDADE, :ME2_VLRUNIT,' +
            ':ME2_PRONOME, :ME2_VLRTOTAL, :ME2_COMPLEMENTO, :ME2_PRODUTO)');

    ParamByName('ME2_ID').Value          := F_dmProdutosApto.QRY_entidadeENT_CHAVE.Value;
    ParamByName('ME2_DOCTO').Value       := CodEntrada;
    ParamByName('ME2_OPERACAO').Value    := 10;
    ParamByName('ME2_DATA').Value        := Now;
    ParamByName('ME2_QUATIDADE').Value   := edtQtd.Text;
    ParamByName('ME2_VLRUNIT').Value     := StrToCurr(edtVlrUnit.Text);
    ParamByName('ME2_PRONOME').Value     := edtNomeProduto.Text;
    ParamByName('ME2_VLRTOTAL').Value    := StrToCurr(edtVlrTotal.Text);
    //ParamByName('ME2_DESCONTO').Value    := edtDesconto.text;
    //ParamByName('ME2_FUNCIONARIO').Value := user.logged;
    ParamByName('ME2_COMPLEMENTO').Value := mmoObservacao.Text;
    ParamByName('ME2_PRODUTO').Value     := StrToInt(edtCodPro.Text);
    ExecSQL;
  end;

  TF_msg.Mensagem('Produto adicionado com sucesso!','I',[mbOk]);

  edtCodPro.Clear;
  edtNomeProduto.Clear;
  edtVlrUnit.Clear;
  edtVlrTotal.Clear;
  mmoObservacao.Clear;
  edtQtd.Text := '1';
  edtCodPro.SetFocus;

  AtualizaGridProdutosApto;


end;

procedure TF_produtosApto.btnExcluirClick(Sender: TObject);
begin //excluir
  inherited;

end;

procedure TF_produtosApto.btnNaoClick(Sender: TObject);
begin
  inherited;
  //não
end;

procedure TF_produtosApto.btnSimClick(Sender: TObject);
begin
  inherited;
  //sim
end;

procedure TF_produtosApto.btnPesquiarProdutoClick(Sender: TObject);
begin
  inherited;
  CriaFormDestroy(TF_pesquisaProdutos, F_pesquisaProdutos);
end;



procedure TF_produtosApto.edtQtdExit(Sender: TObject);
var
  vlrUnit, qtd, vlrTotal : Double;
begin //calcula o valor total
  inherited;
  vlrUnit   := StrToFloat(edtVlrUnit.Text);
  qtd       := StrToFloat(edtQtd.Text);
  vlrTotal  := vlrUnit * qtd;
  //ShowMessage(FloatToStr(vlrTotal));
  edtVlrTotal.Text := FloatToStr(vlrTotal);
end;

procedure TF_produtosApto.FormClose(Sender: TObject; var Action: TCloseAction);
begin //onClose
  inherited;
  F_dmProdutosApto.Destroy;
  F_dmHospedes.Destroy;
end;

procedure TF_produtosApto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then begin
    btnPesquiarProduto.Click;
  end;
end;

procedure TF_produtosApto.FormShow(Sender: TObject);
var img : String;
begin  //onShow
  inherited;

  img := ExtractFilePath(Application.ExeName) + '\imgs\backGround\bg1.png';
  imgBackground.Picture.LoadFromFile(img);



  DBG_itens.Columns[0].Width := 90;

  if F_dmProdutosApto = nil then begin
      Application.CreateForm(TF_dmProdutosApto, F_dmProdutosApto);  //dmProdutos
  end;

  if Livre = False then                           //se for falso, é pq já está ocupado.
    begin
    DTP_dtaLcto.Date := Now;
    DTP_horaLcto.Time := Now;
    edtCodEntrada.Text := CodEntrada;

    //pega o hospede
    try
      if F_dmHospedes = nil then begin
        Application.CreateForm(TF_dmHospedes, F_dmHospedes); //dmHospedes
      end;

      with F_dmHospedes.QRY_FechaHospede do begin
        Close;
        SQL.Clear;
        SQL.Add('select cl.cli_codigo, cl.cli_razao, cl.cli_fanta,eh.ent_codapartamento, eh.ent_codentrada,');
        SQL.Add('eh.ent_dataentrada, eh.ent_horaentrada, eh.ent_qtdextra, eh.ent_vlrextra, eh.ent_vlrnormal,');
        SQL.Add('eh.ent_qtdnormal from cliente cl');
        SQL.Add('inner join hotentrahospede eh');
        SQL.Add('on (cl.cli_codigo = eh.ent_codhospede)');
        SQL.Add('where eh.ent_codapartamento = :codApto and eh.ent_datasaida is null');
        ParamByName('codApto').Value :=  CodApartamento;

        Open();
      end;

      edtCodCli.Text := F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsString;
      edtNomeCliente.Text := F_dmHospedes.QRY_FechaHospedeCLI_RAZAO.AsString;

    finally
      //F_dmHospedes.Destroy; //(não pode destruir aqui!)
    end;
  end;

  //=============================================CRIA A VENDA PARA O HOSPEDE==================================
  if temVenda = True then begin

    //já tem venda


    AtualizaGridProdutosApto;


  end
  else begin
    //cria uma venda baseada no código de entrada do apto escolhido.
    with F_dmProdutosApto.QRY_cadOS1 do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into oservico1(OS1_DOCTOS, OS1_TIPOOS, OS1_SETOR, OS1_TIPOVENDA, OS1_DATABERTA, OS1_HORABERTA,' +
            'OS1_CLIENTE, OS1_NOMCLI, OS1_RECLAMA1, OS1_TOTPARCELA, OS1_CONSULTOR, OS1_VENDEDOR, OS1_ANDAMENTO,' +
            'OS1_CONFIGURACAO)');
    SQL.Add('values (:OS1_DOCTOS, :OS1_TIPOOS, :OS1_SETOR, :OS1_TIPOVENDA,' +
            ':OS1_DATABERTA, :OS1_HORABERTA,:OS1_CLIENTE, :OS1_NOMCLI, :OS1_RECLAMA1,' +
            ':OS1_TOTPARCELA, :OS1_CONSULTOR, :OS1_VENDEDOR, :OS1_ANDAMENTO, :OS1_CONFICUARACAO)');

      ParamByName('OS1_DOCTOS').Value     := CodEntrada;
      ParamByName('OS1_TIPOOS').Value     := 1;  //padrão (clientes)
      ParamByName('OS1_SETOR').Value      := '02'; //padrão (assistência)
      ParamByName('OS1_TIPOVENDA').Value  := 'V'; //padrão (vista)
      ParamByName('OS1_DATABERTA').Value  := Date;
      ParamByName('OS1_HORABERTA').Value  := Now;
      ParamByName('OS1_CLIENTE').Value    := F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsString;
      ParamByName('OS1_NOMCLI').Value     := F_dmHospedes.QRY_FechaHospedeCLI_RAZAO.AsString;
      ParamByName('OS1_RECLAMA1').Value   := mmoObservacao.Text;

      ParamByName('OS1_TOTPARCELA').Value    := 1;  //tot. parcelas (um é o padrão)
      ParamByName('OS1_CONSULTOR').Value     := 1;  //o mesmo vendedor
      ParamByName('OS1_VENDEDOR').Value      := 1;  //código do vendedor
      ParamByName('OS1_ANDAMENTO').Value     := 'A'; //está em andamento
      ParamByName('OS1_CONFICUARACAO').Value  := '0'; //padrão do ciec

      ExecSQL;
    end;

    //faz um select da tabela oservico1 onde o os1_docto = codEntrada - recuperando a venda;
    if temVenda = True then begin
      ShowMessage('Conseguiu criar a venda. Agra é só add os ítens.');
      AtualizaGridProdutosApto;
      exit;
    end;
  end;
end;

end.
