unit UTransferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TF_transferencia = class(TF_baseTelaSimples)
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    pnlDados: TPanel;
    pnlDadosHospede: TPanel;
    pnlNomeHospede: TPanel;
    pnlAptosOcupados: TPanel;
    pnlProdutosConsumidos: TPanel;
    lblNomeHospede: TLabel;
    DBGridAptosOcupados: TDBGrid;
    pnlAptosOcupados2: TPanel;
    lblAptosOcupados: TLabel;
    pnlProdutosConsumidos2: TPanel;
    lblProdutosConsumidos: TLabel;
    pnlAptosDisponiveis2: TPanel;
    lbl: TLabel;
    pnlAptosDisponiveis: TPanel;
    pnlAptosDisponiveis3: TPanel;
    pnlValores: TPanel;
    gbxDiarias: TGroupBox;
    lblTitulo: TLabel;
    DS_aptosOcupados: TDataSource;
    DS_aptosConsumo: TDataSource;
    DS_aptosDisponiveis: TDataSource;
    DBGridAptosDisponiveis: TDBGrid;
    DBGridProdutosConsumidos: TDBGrid;
    btnTransfere: TSpeedButton;
    btnFocus: TButton;
    lblTotalConsumo: TLabel;
    lblVlrConsumo: TLabel;
    lblVlrDiarias: TLabel;
    lblTotalDiarias: TLabel;
    QRY_pegaDados: TFDQuery;
    QRY_pegaDadosENT_CODENTRADA: TIntegerField;
    QRY_pegaDadosENT_CODAPARTAMENTO: TIntegerField;
    QRY_pegaDadosENT_CODHOSPEDE: TIntegerField;
    QRY_pegaDadosENT_DATAENTRADA: TDateField;
    QRY_pegaDadosENT_QTD_DIARIA_NORMAL: TIntegerField;
    QRY_pegaDadosENT_QTD_DIARIA_EXTRA: TIntegerField;
    QRY_pegaDadosENT_VLR_G_DIARIA_EXTRA: TBCDField;
    QRY_pegaDadosENT_VLR_G_DIARIA_NORMAL: TBCDField;
    QRY_pegaDadosENT_VLR_DIARIA_EXTRA: TBCDField;
    QRY_pegaDadosENT_DATASAIDA: TDateField;
    QRY_pegaDadosENT_HORASAIDA: TTimeField;
    QRY_pegaDadosENT_TOT_GERAL_BAR: TBCDField;
    QRY_pegaDadosENT_TOT_GERAL_DIARIAS: TBCDField;
    QRY_pegaDadosENT_TOT_GERAL_LICAGAO: TStringField;
    QRY_pegaDadosENT_VLR_TOTAL_DIARIAS: TBCDField;
    QRY_pegaDadosENT_QTD_TOTAL_DIARIAS: TIntegerField;
    QRY_pegaDadosENT_PREVISAO: TDateField;
    QRY_pegaDadosENT_DESCACRESCGERAL: TBCDField;
    QRY_pegaDadosENT_TOTALPAGO: TBCDField;
    QRY_pegaDadosENT_QTDADULTOS: TIntegerField;
    QRY_pegaDadosENT_QTDCRIANCAS: TIntegerField;
    QRY_pegaDadosENT_QTDPAGANTES: TIntegerField;
    QRY_pegaDadosENT_PLACA: TStringField;
    QRY_pegaDadosENT_MODELOVEICULO: TStringField;
    QRY_pegaDadosENT_MARCAVEICULO: TStringField;
    QRY_pegaDadosENT_FILIAL: TStringField;
    QRY_pegaDadosENT_VLR_DIARIA_NORMAL: TBCDField;
    QRY_pegaDadosENT_DATARESERVA: TDateField;
    QRY_pegaDadosENT_HORARESERVA: TTimeField;
    QRY_pegaDadosENT_USUARIORESERVOU: TIntegerField;
    QRY_pegaDadosENT_DATAEFETIVARESERVA: TDateField;
    QRY_pegaDadosENT_STATUS: TStringField;
    QRY_pegaDadosENT_DATAPREVISAOEFETIVAR: TDateField;
    QRY_pegaDadosENT_HORAENTRADA: TTimeField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridAptosOcupadosCellClick(Column: TColumn);
    procedure btnTransfereClick(Sender: TObject);
    procedure DBGridAptosDisponiveisCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    var aptoOcupado, aptoDisponivel: String;

    procedure GetProdutosConsumidos;
    procedure GetHospedes;
    procedure GetAptosOcupados;
    procedure GetAptosDisponiveis;
  end;

var
  F_transferencia: TF_transferencia;

implementation

{$R *.dfm}

uses UDMConexao, UFunctions, UMsg, UDMTransferencia, UDMRackApto, UCheckIn,
  UDMHospedes, URackApto;

procedure TF_transferencia.btnTransfereClick(Sender: TObject);
begin
  inherited;
  {Transferencia}
  if aptoOcupado = ''then begin
    TF_msg.Mensagem('Favor, escolha um Apto já ocupado para Transferir.','I',[mbOk]);
    DBGridAptosOcupados.SetFocus;
    exit;
  end;

  if aptoDisponivel = '' then begin
    TF_msg.Mensagem('Favor, escolha um Apto Livre para Transferir.','I',[mbOk]);
    DBGridAptosDisponiveis.SetFocus;
    exit;
  end;

  {Aqui, caso da certo acima, faz a transferência. Deverá pedir a senha}

  {pega os dados para update e insert baseado no apto selecionado no click acima}
  with QRY_pegaDados do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from hotentrahospede where ent_codentrada = :codEntrada');
    Params[0].Value := F_dmTransferencia.QRY_aptosOcupadosENT_CODENTRADA.AsInteger;
    Open();
  end;


  try
    F_dmConexao.FDConn.StartTransaction;   {inicia a transação}

    F_dmTransferencia.QRY_InsertHotTransferencia.Open();
    F_dmTransferencia.QRY_InsertHotTransferencia.Append;

    {passa os dados para a tabela transferencia}

    F_dmTransferencia.QRY_InsertHotTransferenciaTR_APTO_ANTERIOR.AsInteger              := QRY_pegaDadosENT_CODAPARTAMENTO.AsInteger;
    F_dmTransferencia.QRY_InsertHotTransferenciaTR_NOVO_APTO.AsInteger                  := F_dmTransferencia.QRY_aptosDisponiveisAPA_CODAPARTAMENTO.AsInteger;
    F_dmTransferencia.QRY_InsertHotTransferenciaTR_HRA_TRANSFERENCIA.AsDateTime         := Time;
    F_dmTransferencia.QRY_InsertHotTransferenciaTR_DTA_TRANSFERENCIA.AsDateTime         := Date;
    F_dmTransferencia.QRY_InsertHotTransferenciaTR_HISTORICO.AsString                   := 'TRANSFERENCIA DO APTO: '+F_dmTransferencia.QRY_aptosOcupadosAPA_APARTAMENTO.AsString
                                                                                              +' PARA O APTO: '+F_dmTransferencia.QRY_aptosDisponiveisAPA_APARTAMENTO.AsString;
    F_dmTransferencia.QRY_InsertHotTransferenciaTR_USUARIO_TRANSFERIU.AsInteger         := 1; {pegar o user logado do sistema}
    F_dmTransferencia.QRY_InsertHotTransferenciaTR_COD_HOSPEDAGEM.AsInteger             := QRY_pegaDadosENT_CODENTRADA.AsInteger;
    F_dmTransferencia.QRY_InsertHotTransferenciaTR_VLR_DIARIA_N_ANTERIOR.AsCurrency     := F_checkIn.vlrDNormal.Value;
    F_dmTransferencia.QRY_InsertHotTransferenciaTR_VLR_DIARIA_E_ANTERIOR.AsCurrency     := F_checkIn.vlrDExtra.Value;
  //F_dmTransferencia.QRY_InsertHotTransferenciaTR_VLR_CONSUMO_ANTERIOR.AsCurrency      := QRY_pegaDadosENT_TOT_GERAL_BAR.AsCurrency;
  //F_dmTransferencia.QRY_InsertHotTransferenciaTR_VLR_OUTROS.AsCurrency                := QRY_pegaDadosENT_TOT_GERAL_OUTROS.ASCurrency;
  //F_dmTransferencia.QRY_InsertHotTransferenciaTR_QTD_DIARIA_N_ANTERIOR.AsString       :=
    F_dmTransferencia.QRY_InsertHotTransferenciaTR_QTD_DIARIA_N_ANTERIOR.Value          := F_checkIn.edtQtdDNormal.Value;
    F_dmTransferencia.QRY_InsertHotTransferenciaTR_QTD_DIARIA_E_ANTERIOR.Value          := F_checkIn.edtQtdDExtra.Value;

    {verificar se quer cobrar esse valor ou não. O cliente poderá mudar de apto sem que ele queira visto que as vezes foi por problemas. se isso acontecer
     o hotel deverá manter os valores anterior para ele.}

    F_dmTransferencia.QRY_InsertHotTransferenciaTR_VLR_GERAL_DIARIAS_ANTERIOR.Value     := (F_checkIn.vlrDNormal.Value * F_checkIn.edtQtdDNormal.Value)
                                                                                                  + (F_checkIn.vlrDExtra.Value * F_checkIn.edtQtdDExtra.Value);
    F_dmTransferencia.QRY_InsertHotTransferenciaTR_COD_HOSPEDE.AsInteger                := F_checkIn.codHospede;

    if F_dmTransferencia.QRY_aptosOcupadosENT_STATUS.AsString = 'RESERVADO' then begin
      F_dmTransferencia.QRY_InsertHotTransferenciaTR_DTA_RESERVA_ANTERIOR.AsDateTime      := QRY_pegaDadosENT_DATARESERVA.AsDateTime;
      F_dmTransferencia.QRY_InsertHotTransferenciaTR_HRA_RESERVA_ANTERIOR.AsDateTime      := QRY_pegaDadosENT_HORARESERVA.AsDateTime;
    end
    else begin
      F_dmTransferencia.QRY_InsertHotTransferenciaTR_DTA_HOSPEDAGEM_ANTERIOR.AsDateTime   := QRY_pegaDadosENT_DATAENTRADA.AsDateTime;
      F_dmTransferencia.QRY_InsertHotTransferenciaTR_HRA_HOSPEDAGEM_ANTERIOR.AsDateTime   := QRY_pegaDadosENT_HORAENTRADA.AsDateTime;
    end;

    F_dmTransferencia.QRY_InsertHotTransferencia.Post;

    {Update o Status do Apto. Transferido}
    with F_dmTransferencia.QRY_updateHotAptos do begin
      Close;
      SQL.Clear;
      SQL.Add('update HOTAPARTAMENTO');
      SQL.Add('set APA_SITUACAO = :situacao');
      SQL.Add('where (APA_CODAPARTAMENTO = :codApto)  ');
      ParamByName('situacao').Value       := 'LIVRE';
      ParamByName('codApto').Value        := F_dmTransferencia.QRY_aptosOcupadosAPA_CODAPARTAMENTO.AsInteger;
      ExecSQL;
    end;

    {Update o Status do Novo Apto. Transferido}
    if F_dmTransferencia.QRY_aptosOcupadosENT_STATUS.AsString = 'RESERVADO' then begin
      with F_dmTransferencia.QRY_updateHotAptos do begin
        Close;
        SQL.Clear;
        SQL.Add('update HOTAPARTAMENTO');
        SQL.Add('set APA_SITUACAO = :situacao');
        SQL.Add('where (APA_CODAPARTAMENTO = :codApto)  ');
        ParamByName('situacao').Value       := 'RESERVADO';
        ParamByName('codApto').Value        := F_dmTransferencia.QRY_aptosDisponiveisAPA_CODAPARTAMENTO.AsInteger;
        ExecSQL;
      end;
    end
    else begin
      with F_dmTransferencia.QRY_updateHotAptos do begin
        Close;
        SQL.Clear;
        SQL.Add('update HOTAPARTAMENTO');
        SQL.Add('set APA_SITUACAO = :situacao, APA_CODENTRADA = :codEntrada');
        SQL.Add('where (APA_CODAPARTAMENTO = :codApto)  ');
        ParamByName('situacao').Value       := 'OCUPADO';
        ParamByName('codEntrada').Value     := F_dmTransferencia.QRY_aptosOcupadosENT_CODENTRADA.AsInteger;
        ParamByName('codApto').Value        := F_dmTransferencia.QRY_aptosDisponiveisAPA_CODAPARTAMENTO.AsInteger;
        ExecSQL;
      end;
    end;

    {Update o Status da Reserva}
    with F_dmTransferencia.QRY_updateHotEntraHospede do begin
      {Mudar o codigo do Apto, mudar os valores das diarias normais e extra, qtd diaria normal e extra mantem a mesma por enquanto,
       ent_vlr_total_diarias (valor total das diárias) recalcular. ex: pga a qtd de normais que é 1 e multiplica pelo valor da nova diaria. faz o mesmo com
        as extras. pega a qtd de diarias extras que é a mesma e multiplica pelo novo valor da diaria extra. e soma as duas e grava no total.
         qtd total de diarias é a mesma. Atualizar o ent_vlr_g_diaria_normal e extra.}


//         verificar campos desnecessarios na tabela hotentrahospede

      Close;
      SQL.Clear;
      SQL.Add('update hotentrahospede set ent_codapartamento = :codApto, ent_dataentrada = :dtaEntrada, ent_horaentrada = :hraEntrada, ');
      SQL.Add('ent_vlr_diaria_extra = :vlrDiariaExtra,  ent_vlr_g_diaria_extra = :vlrGDExtra, ent_vlr_g_diaria_normal = :vlrGDNormal, ');
      SQL.Add('ent_vlr_diaria_normal = :vlrDNormal');
      SQL.Add('where ent_codentrada = :codEntrada');

      ParamByName('codApto').Value          := F_dmTransferencia.QRY_aptosDisponiveisAPA_CODAPARTAMENTO.AsInteger;
      ParamByName('dtaEntrada').Value       := Date;
      ParamByName('hraEntrada').Value       := Time;
      ParamByName('vlrDiariaExtra').Value   := F_dmTransferencia.QRY_aptosDisponiveisCAT_VALORDIARIA2.AsCurrency;
      ParamByName('vlrGDExtra').Value       := 0;
      ParamByName('vlrGDNormal').Value      := 0;
      ParamByName('vlrDNormal').Value       := F_dmTransferencia.QRY_aptosDisponiveisCAT_VALORDIARIA1.AsCurrency;
      ParamByName('codEntrada').Value       := F_dmTransferencia.QRY_aptosOcupadosENT_CODENTRADA.AsInteger;
      ExecSQL;
    end;

    {Update o Status da Reserva}
    if F_dmTransferencia.QRY_aptosOcupadosENT_STATUS.AsString = 'RESERVADO' then begin
      with F_dmTransferencia.QRY_updateHotEntraHospede do begin
        Close;
        SQL.Clear;
        SQL.Add('update hotentrahospede set ent_status = ''RESERVADO'' where ent_codentrada = :codEntrada');
        ParamByName('codEntrada').Value := F_dmTransferencia.QRY_aptosOcupadosENT_CODENTRADA.AsInteger;
        ExecSQL;
      end;
    end
    else begin
      with F_dmTransferencia.QRY_updateHotEntraHospede do begin
        Close;
        SQL.Clear;
        SQL.Add('update hotentrahospede set ent_status = ''OCUPADO'' where ent_codentrada = :codEntrada');
        ParamByName('codEntrada').Value := F_dmTransferencia.QRY_aptosOcupadosENT_CODENTRADA.AsInteger;
        ExecSQL;
      end;
    end;



    F_dmTransferencia.QRY_InsertHotTransferencia.ApplyUpdates(0);
//    F_dmTransferencia.QRY_updateHotAptos.ApplyUpdates(0);


    F_dmConexao.FDConn.Commit;  {se tudo der certo, commita a transação}
    TF_msg.Mensagem('Apto Transferido com sucesso.','I',[mbOk]);

      {Tem que fazer isso para não inserir novamente}

//    F_dmTransferencia.QRY_InsertHotTransferencia.SQL.Clear;
//    F_dmTransferencia.QRY_InsertHotTransferencia.Close;

    F_checkIn.Close;
    Self.Close;
    OrdenaLista;

    {limpa para não ficar com dados antigo na memória}
    aptoOcupado     := '';
    aptoDisponivel  := '';

    {Faz um Refresh nas grids: Ocupados, Disponíveis e na grid Produtos.}
    GetAptosOcupados;
    GetAptosDisponiveis;

    btnFocus.SetFocus;  {so serve para o foco sair da grid.}

  except on e:Exception do
    begin
      F_dmConexao.FDConn.Rollback;
      TF_msg.Mensagem('Erro na Transferência do Apto. Verifique os Aptos corretamente.','I',[mbOk]);
      exit;
    end;
  end;










end;

procedure TF_transferencia.DBGridAptosDisponiveisCellClick(Column: TColumn);
begin   {ao clicar na grid dos disponiveis}
  inherited;
  aptoDisponivel := F_dmTransferencia.QRY_aptosDisponiveisAPA_APARTAMENTO.AsString;
end;

procedure TF_transferencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(F_dmTransferencia);
end;

procedure TF_transferencia.DBGridAptosOcupadosCellClick(Column: TColumn);
//var vlrTotal: Double;
begin   {ao clicar na grid dos ocupados}
//  inherited;
  aptoOcupado    := IntToStr(F_dmTransferencia.QRY_aptosOcupadosENT_CODENTRADA.AsInteger);
//  {Pega os produtos consumidos baseado no apto. clicado}
//  GetProdutosConsumidos;

//============================================deverá rever esses calculos=============================================.


//  {soma os totais dos produtos}
//  if F_dmTransferencia.QRY_aptosConsumo.RecordCount > 0 then begin
//    vlrTotal := 0;
//    F_dmTransferencia.QRY_aptosConsumo.First;
//    while not F_dmTransferencia.QRY_aptosConsumo.Eof do begin
//      vlrTotal := vlrTotal + F_dmTransferencia.QRY_aptosConsumoME2_VLRTOTAL.AsVariant;
//      F_dmTransferencia.QRY_aptosConsumo.Next;
//    end;
//    lblTotalConsumo.Caption := FloatToStrF(vlrTotal, ffCurrency, 10,2);
//  end
//  else begin
//    lblTotalConsumo.Caption := FloatToStrF(0, ffCurrency, 10,2);
//  end;
//
//  {Soma os totais das diárias}
//  lblTotalDiarias.Caption := FloatToStrF(F_dmTransferencia.QRY_aptosOcupados, ffCurrency, 10,2);
end;

procedure TF_transferencia.FormShow(Sender: TObject);
begin     {OnShow}
  inherited;
  {inicia vazio para nao correr o risco de ter lixo de memória nas variáveis}
//  aptoOcupado    := '';
//  aptoDisponivel := '';
//
//  {passa os valores das diarias e do consumo.}
//  lblTotalDiarias.Caption := FloatToStrF(F_checkIn.vlrTotal.Value, ffCurrency, 10,2);
//  lblTotalConsumo.Caption := FloatToStrF(F_checkIn.vlrConsumo.Value, ffCurrency, 10,2);


  if F_dmTransferencia = nil then begin
    Application.CreateForm(TF_dmTransferencia, F_dmTransferencia);
  end;

  {Pega o Hospede}
  GetHospedes;
  lblNomeHospede.Caption := 'HÓSPEDE: '+ F_dmTransferencia.QRY_hospedeCLI_RAZAO.AsString;

  {Pega os Aptos. Ocupados}
  GetAptosOcupados;

  {Pega os Aptos. Disponíveis}
  GetAptosDisponiveis;

  {Pega os produtos dos aptos}
  GetProdutosConsumidos;
end;

procedure TF_transferencia.GetAptosDisponiveis;
begin {GetAptosDisponiveis}
  with F_dmTransferencia.QRY_aptosDisponiveis do begin
    Close;
    SQL.Clear;
    SQL.Add('select ap.*, ct.cat_valordiaria1, ct.cat_valordiaria2, ct.cat_categoria  from hotapartamento ap inner join');
    SQL.Add('hotcategoria ct on (ap.apa_codcategoria = ct.cat_codcategoria) where apa_situacao = ''LIVRE''');
    SQL.Add('order by ct.cat_categoria');
    Open();
  end;
end;

procedure TF_transferencia.GetAptosOcupados;
begin {GetAptosOcupados}
  with F_dmTransferencia.QRY_aptosOcupados do begin
    Close;
    SQL.Clear;
    SQL.Add('select eh.ent_codentrada, ap.apa_apartamento, eh.ent_status, eh.ent_dataentrada, eh.ent_horaentrada,');
    SQL.Add('       ap.apa_codapartamento, eh.ent_horareserva, eh.ent_datareserva, eh.ent_codhospede from hotentrahospede eh');
    SQL.Add('       inner join hotapartamento ap on (eh.ent_codapartamento = ap.apa_codapartamento)');
    SQL.Add('       where eh.ent_codhospede = :codHospede and (eh.ent_status = :st1 or eh.ent_status = :st2)');
    ParamByName('codHospede').Value := F_dmTransferencia.QRY_hospedeCLI_CODIGO.AsInteger;  {pegar o codigo do Hospede que está hospedado no apto.}
    ParamByName('st1').Value     :=  'OCUPADO';
    ParamByName('st2').Value     :=  'RESERVADO';
    Open();
  end;
end;

procedure TF_transferencia.GetHospedes;
begin  {GetHospedes}
  with F_dmTransferencia.QRY_hospede do begin
    Close;
    SQL.Clear;
    SQL.Add('select cl.cli_codigo, cl.cli_razao, cl.cli_fanta from cliente cl');
    SQL.Add('    inner join hotentrahospede eh');
    SQL.Add('    on (cl.cli_codigo = eh.ent_codhospede)');
    SQL.Add('    where eh.ent_codapartamento = :codApto and eh.ent_status = :status');
    Params[0].Value := CodApartamento;
    Params[1].Value := 'OCUPADO';
    Open();
  end;
end;

procedure TF_transferencia.GetProdutosConsumidos;
begin  {GetProdutosConsumidos}
  with F_dmTransferencia.QRY_aptosConsumo do begin
    Close;
    SQL.Clear;
    SQL.Add('select ME2_DOCTO, ME2_OPERACAO, ME2_DATA, ME2_QUATIDADE, ME2_VLRUNIT,');
    SQL.Add('ME2_PRONOME, ME2_VLRTOTAL, ME2_DESCONTO, ME2_FUNCIONARIO, ME2_COMPLEMENTO, ME2_PRODUTO from mvestoque2');
    SQL.Add('where me2_docto = :codEntrada');
    ParamByName('codEntrada').Value := F_dmTransferencia.QRY_aptosOcupadosENT_CODENTRADA.AsInteger;
    Open();
  end;

  if F_dmTransferencia.QRY_aptosConsumo.RecordCount < 1 then begin
    F_dmTransferencia.QRY_aptosConsumo.Close;
  end;
end;

end.
