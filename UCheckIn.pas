unit UCheckIn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.ButtonGroup, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.Buttons, ULancaProdutos,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinLilian, dxSkinOffice2007Black, dxSkinOffice2010Black,
  dxSkinsDefaultPainters, dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue,
  cxTextEdit, dxGDIPlusClasses, cxCurrencyEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, DateUtils, Vcl.ComCtrls,
  frxClass, frxDBSet;

type
  TF_checkIn = class(TF_baseTelaSimples)
    pnl: TPanel;
    pnlControle: TPanel;
    pnlGroup1: TPanel;
    btnEntra: TSpeedButton;
    btnFechaApto: TSpeedButton;
    btnReserva: TSpeedButton;
    pnlGrupo2: TPanel;
    btnTransferencia: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnCancelaReserva: TSpeedButton;
    btnHaver: TSpeedButton;
    btnEfetivar: TSpeedButton;
    pnlInfo: TPanel;
    lblInfo: TLabel;
    pnlControleGerencial: TPanel;
    edtHospede: TcxTextEdit;
    lblHospede: TLabel;
    lblDtaHospedagem: TLabel;
    dtaHospedagem: TcxTextEdit;
    lblHoraHospedagem: TLabel;
    hraHospedagem: TcxTextEdit;
    lblVlrDiariaNormal: TLabel;
    lblVlrDiariaExtra: TLabel;
    lblVlrConsumo: TLabel;
    lblTotal: TLabel;
    imgBack: TImage;
    vlrDNormal: TcxCurrencyEdit;
    vlrDExtra: TcxCurrencyEdit;
    vlrConsumo: TcxCurrencyEdit;
    vlrTotal: TcxCurrencyEdit;
    QRY_proConsumidos: TFDQuery;
    QRY_proConsumidosME2_DOCTO: TStringField;
    QRY_proConsumidosME2_OPERACAO: TSmallintField;
    QRY_proConsumidosME2_DATA: TDateField;
    QRY_proConsumidosME2_QUATIDADE: TBCDField;
    QRY_proConsumidosME2_VLRUNIT: TBCDField;
    QRY_proConsumidosME2_PRONOME: TStringField;
    QRY_proConsumidosME2_DESCONTO: TBCDField;
    QRY_proConsumidosME2_FUNCIONARIO: TIntegerField;
    QRY_proConsumidosME2_COMPLEMENTO: TStringField;
    QRY_proConsumidosME2_PRODUTO: TIntegerField;
    QRY_proConsumidosVLR_TOTAL: TCurrencyField;
    QRY_proConsumidosvlrTotal: TAggregateField;
    lblQtdDNormal: TLabel;
    lblQtdDExtra: TLabel;
    edtQtdDNormal: TcxCurrencyEdit;
    edtQtdDExtra: TcxCurrencyEdit;
    hSaida: TDateTimePicker;
    hParametro: TDateTimePicker;
    lblHSaida: TLabel;
    lblhParametro: TLabel;
    QRY_reserva: TFDQuery;
    QRY_reservaENT_CODENTRADA: TIntegerField;
    QRY_reservaENT_CODAPARTAMENTO: TIntegerField;
    QRY_reservaENT_CODHOSPEDE: TIntegerField;
    QRY_reservaENT_DATAENTRADA: TDateField;
    QRY_reservaENT_QTD_DIARIA_NORMAL: TIntegerField;
    QRY_reservaENT_QTD_DIARIA_EXTRA: TIntegerField;
    QRY_reservaENT_VLR_G_DIARIA_EXTRA: TBCDField;
    QRY_reservaENT_VLR_G_DIARIA_NORMAL: TBCDField;
    QRY_reservaENT_VLR_DIARIA_EXTRA: TBCDField;
    QRY_reservaENT_DATASAIDA: TDateField;
    QRY_reservaENT_HORASAIDA: TTimeField;
    QRY_reservaENT_TOT_GERAL_BAR: TBCDField;
    QRY_reservaENT_TOT_GERAL_DIARIAS: TBCDField;
    QRY_reservaENT_TOT_GERAL_LICAGAO: TStringField;
    QRY_reservaENT_VLR_TOTAL_DIARIAS: TBCDField;
    QRY_reservaENT_QTD_TOTAL_DIARIAS: TIntegerField;
    QRY_reservaENT_PREVISAO: TDateField;
    QRY_reservaENT_DESCACRESCGERAL: TBCDField;
    QRY_reservaENT_TOTALPAGO: TBCDField;
    QRY_reservaENT_QTDADULTOS: TIntegerField;
    QRY_reservaENT_QTDCRIANCAS: TIntegerField;
    QRY_reservaENT_QTDPAGANTES: TIntegerField;
    QRY_reservaENT_PLACA: TStringField;
    QRY_reservaENT_MODELOVEICULO: TStringField;
    QRY_reservaENT_MARCAVEICULO: TStringField;
    QRY_reservaENT_FILIAL: TStringField;
    QRY_reservaENT_VLR_DIARIA_NORMAL: TBCDField;
    QRY_reservaENT_DATARESERVA: TDateField;
    QRY_reservaENT_HORARESERVA: TTimeField;
    QRY_reservaENT_USUARIORESERVOU: TIntegerField;
    QRY_reservaENT_DATAEFETIVARESERVA: TDateField;
    QRY_reservaENT_STATUS: TStringField;
    QRY_reservaENT_DATAPREVISAOEFETIVAR: TDateField;
    QRY_reservaENT_HORAENTRADA: TTimeField;
    QRY_reservaCLI_CODIGO: TIntegerField;
    QRY_reservaCLI_RAZAO: TStringField;
    QRY_reservaCLI_FANTA: TStringField;
    pnlGrupo3: TPanel;
    btnCancelaHospedagem: TSpeedButton;
    btnVerHospedes: TSpeedButton;
    btnReimprimir: TSpeedButton;
    frxDB_filial: TfrxDBDataset;
    frxReport: TfrxReport;
    frxDB_reimprime: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure btnEntraClick(Sender: TObject);
    procedure btnFechaAptoClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnEfetivarClick(Sender: TObject);
    procedure btnReservaClick(Sender: TObject);
    procedure btnCancelaReservaClick(Sender: TObject);
    procedure btnTransferenciaClick(Sender: TObject);
    procedure btnCancelaHospedagemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVerHospedesClick(Sender: TObject);
    procedure btnReimprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure FechaHospede;
  public
    { Public declarations }
    var codHospede: Integer;
        qTransferencia: Double;
  end;

var
  F_checkIn: TF_checkIn;

implementation

{$R *.dfm}

uses UFunctions, UDMRackApto, UDMHospedes, UMsg, UEntraHospede, UFechaHospedes,
  UReservaApto, UEfetivaReserva, UCancelaReserva, UPrincipal, UDMConexao,
  UDMParametro, UTransferencia, UFechaApto, UCancelaHospedagem, UVerHospedes,
  UDMRelatorios, UDMFilial;

procedure TF_checkIn.btnCancelaHospedagemClick(Sender: TObject);
var hEntrada1, hSaida1, hLimite1: String;
    hEntrada2, hSaida2, hLimite2: TTime;
    hEResult, hSResult, hLResult, hTotal: Real;
begin
  inherited;
  {cancela hospedagem}

  //esta com erros - verificar as tabelas entrahospede e entrahospede2 questao do status e do codigo de hospedagem

  try
    if F_dmParametro = nil then begin
      Application.CreateForm(TF_dmParametro, F_dmParametro);
    end;

    with F_dmParametro.QRY_parametro do begin
      Close;
      SQL.Clear;
      SQL.Add('select * from hotparametro');
      Open();
    end;

    hSaida.Time := Now;

    {Se não fizer isso, tem que fechar o form e abrir novamente}
    FechaHospede; {Procedure fecha Hospede}

    {converte para string - para eliminar os milisegundos}
    hEntrada1    := TimeToStr(F_dmHospedes.QRY_FechaHospedeENT_HORAENTRADA.AsDateTime);
    hSaida1      := TimeToStr(hSaida.Time);
    hLimite1     := TimeToStr(F_dmParametro.QRY_parametroPA_HRALIMITE.AsDateTime);

    {converte para TTime}
    hEntrada2 :=((StrToTime(hEntrada1) * 1440) / 60);
    hSaida2   :=((StrToTime(hSaida1)   * 1440) / 60);
    hLimite2  :=((StrToTime(hLimite1)  * 1440) / 60);

    {agora recebe os valores convertidos para tipo: Real}
    hEResult := hEntrada2;
    hSResult := hSaida2;
    hLResult := hLimite2;

    hTotal   := (hEResult - hSResult) * -1; {Total recebe o resultado de entrada - saida}

    if F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.AsDateTime = Date then begin

      {verificar se já foi lançado produtos. Caso sim, não é permitido. Deverá fecha a hospedagem}


      if hTotal < hLResult then begin
        CriaFormDestroy(TF_cancelaHospedagem, F_cancelaHospedagem);
      end
      else begin
        TF_msg.Mensagem('Cliente já passou do horário máximo permitido para Cancelar. Favor, Fatura a Hospedagem.','I',[mbOk]);
        exit;
      end;
    end
    else begin
      TF_msg.Mensagem('Não permitido o Cancelamento visto que o Cliente não entrou Hoje! Favor, Faturar a Hospedagem.','I',[mbOk]);
      exit;
    end;
  finally
    F_dmParametro.Free;
  end;

  {Regras: Verificar se a data de entrada é igual a de hoje. se não for não e permitido. so cancela no dia que entrou
   verificar se já houve consumo de alguma coisa, caso já tenha nao e permitido também.
   verificar quantas horas já passaram. caso tenha X horas que vem do parametro, também nao e permitido}
end;

procedure TF_checkIn.btnCancelaReservaClick(Sender: TObject);
begin
  inherited;
    {cancela reserva}
    if Livre = False then begin
      if Situacao = 'RESERVADO' then begin
       CriaFormDestroy(TF_cancelaReserva, F_cancelaReserva);
      end
      else begin
        TF_msg.Mensagem('Esse Apto Não poderá ser Cancelado a Reserva, visto que não está Reservado.','I',[mbOk]);
        exit;
      end;
    end
    else begin
      TF_msg.Mensagem('Esse Apto Não poderá ser Cancelado a Reserva, visto que não está Reservado.','I',[mbOk]);
    end;
end;

procedure TF_checkIn.btnEfetivarClick(Sender: TObject);
begin
  inherited;
  {efetivar a reserva}
    if Livre = False then begin
      if Situacao = 'RESERVADO' then begin
       CriaFormDestroy(TF_efetivaReserva, F_efetivaReserva);
      end
      else begin
        TF_msg.Mensagem('Esse Apto Não poderá ser efetivado, visto que já está Hospedado.','I',[mbOk]);
        exit;
      end;
    end
    else begin
      TF_msg.Mensagem('Esse Apto Não poderá ser efetivado, visto que não está Reservado.','I',[mbOk]);
    end;
end;

procedure TF_checkIn.btnEntraClick(Sender: TObject);
begin
  inherited;
  //entra hospedes (check-in)
  if Livre = True then begin
    CriaFormDestroy(TF_entraHospede, F_entraHospede);
  end
  else begin
    TF_msg.Mensagem('Esse Apartamento está ocupado. Favor, escolher um Apto Livre!','I',[mbOk]);
  end;

//  F_principal.UserControl.Log('Salva o Log');
//  F_principal.UserControl.Log('Salva o Log',1);

end;

procedure TF_checkIn.btnFechaAptoClick(Sender: TObject);
begin //fecha hospedes
  inherited;
  if Livre = False then begin
    if Situacao = 'OCUPADO' then begin
//      CriaFormDestroy(TF_fechaHospedes, F_fechaHospedes);
      CriaFormDestroy(TF_fechaApto, F_fechaApto);
    end
    else begin
      TF_msg.Mensagem('Esse Apartamento não poderá ser fechado.','I',[mbOk]);
    end;
  end
  else begin
    TF_msg.Mensagem('Esse Apartamento está Vazio. Favor, escolher um Apto Ocupado para Fechar!','I',[mbOk]);
  end;
end;

procedure TF_checkIn.btnProdutosClick(Sender: TObject);
begin
  inherited;
  //Produtos apto (verifica se ele está aberto. caso não esteja, não deixa lançar.
  if Livre = False then begin
    if Situacao = 'OCUPADO' then begin
      CriaFormDestroy(TF_lancaProdutos, F_lancaProdutos);
    end
    else begin
      TF_msg.Mensagem('Não pode lançar venda de produtos em um Apto que não esteja ocupado.','C',[mbOk]);
    end;
  end
  else begin
    TF_msg.Mensagem('Não pode lançar venda de produtos em um Apto aberto.','C',[mbOk]);
    exit;
  end;
end;

procedure TF_checkIn.btnReimprimirClick(Sender: TObject);
begin
  inherited;

  if F_dmRelatorios = nil then begin
    Application.CreateForm(TF_dmRelatorios, F_dmRelatorios);
  end;

  try

  with F_dmRelatorios.QRY_reimprimeFaturaEntrada do begin
    Close;
    SQL.Clear;
    SQL.Add('select ap.apa_apartamento, cl.cli_razao, eh.ent_dataentrada, eh.ent_horaentrada, eh.ent_previsao,');
    SQL.Add('   eh.ent_placa, eh.ent_modeloveiculo, eh.ent_marcaveiculo, eh.ent_qtd_diaria_normal,');
    SQL.Add('   eh.ent_vlr_diaria_normal, eh.ent_qtd_diaria_extra, eh.ent_vlr_diaria_extra  from hotentrahospede eh');
    SQL.Add('    inner join hotapartamento ap on (eh.ent_codapartamento = ap.apa_codapartamento)');
    SQL.Add('    inner join cliente cl on (eh.ent_codhospede = cl.cli_codigo)');
    SQL.Add('    where ap.apa_apartamento = :apto and eh.ent_status <> :status');
    ParamByName('apto').Value := F_dmRackApto.QRY_rackAptoAPA_APARTAMENTO.AsString;
    ParamByName('status').Value := 'CANCELADO'; {pega só os que não forem cancelados}
    Open();
  end;

  if F_dmRelatorios.QRY_reimprimeFaturaEntrada.RecordCount > 0 then begin
    if not FileExists(ExtractFilePath(Application.ExeName) + 'RelFR3\ReimpressaoEntradaHospedes.fr3') then begin
      TF_msg.Mensagem('Arquivo "ReimpressaoEntradaHospedes.fr3" na Pasta "RelFR3" não encontrado. Favor, contate o Suporte','I',[mbOk]);
      exit;
    end
    else begin
      frxReport.PrepareReport();
      frxReport.ShowReport();
    end;
  end
  else begin
    TF_msg.Mensagem('Não há relatório para imprimir com esse Apto. Favor, reveja qual Apto deseja imprimir.','I',[mbOk]);
    exit;
  end;
  finally
    FreeAndNil(F_dmRelatorios);
  end;
end;

procedure TF_checkIn.btnReservaClick(Sender: TObject);
begin
  inherited;
  if Livre = True then begin
    CriaFormDestroy(TF_reservaApto, F_reservaApto);
  end
  else begin
    TF_msg.Mensagem('Não poderá Reservar esse Apto! Favor, escolher um Apto Livre.','I',[mbOk]);
  end;
end;

procedure TF_checkIn.btnTransferenciaClick(Sender: TObject);
begin
  inherited;
  {Transferencia}
  if Livre = False then begin
    CriaFormDestroy(TF_transferencia, F_transferencia);
  end;
end;

procedure TF_checkIn.btnVerHospedesClick(Sender: TObject);
begin {Ver Hospedes}
  inherited;
  CriaFormDestroy(TF_verHospedes, F_verHospedes);
end;

{FEcha Hospede}
procedure TF_checkIn.FechaHospede;
begin
  if F_dmHospedes = nil then begin
    Application.CreateForm(TF_dmHospedes, F_dmHospedes);
  end;

  with F_dmHospedes.QRY_FechaHospede do begin
    Close;
    SQL.Clear;
    SQL.Add('select cl.cli_codigo, cl.cli_razao, cl.cli_fanta,eh.ent_codapartamento, eh.ent_codentrada,');
    SQL.Add('eh.ent_dataentrada, eh.ent_horaentrada, eh.ent_qtd_diaria_extra, eh.ent_vlr_diaria_extra,');
    SQL.Add('eh.ent_vlr_diaria_normal, eh.ent_qtd_diaria_normal from cliente cl');
    SQL.Add('inner join hotentrahospede eh on (cl.cli_codigo = eh.ent_codhospede)');
    SQL.Add('where eh.ent_codapartamento = :codApto and eh.ent_datasaida is null and eh.ent_status <> :status');
    ParamByName('codApto').Value := CodApartamento;
    ParamByName('status').Value  := 'CANCELADO'; {se nao tiver, da erro quando o apto for reservado e depois cancelado}
    Open();
  end;
end;

procedure TF_checkIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(F_dmHospedes);
  FreeAndNil(F_dmParametro);
end;

procedure TF_checkIn.FormShow(Sender: TObject);
var qDExtra, qDNormal: Double;
begin        {onShow}
  inherited;
  F_checkIn.Caption := 'Check-In: Apartamento Nº '+F_dmRackApto.QRY_rackAptoAPA_APARTAMENTO.AsString;
  lblInfo.Caption   := 'Check-In: Apartamento Nº '+F_dmRackApto.QRY_rackAptoAPA_APARTAMENTO.AsString;



  {Ocupado, Reservado = False | Livre = True}
  if Livre = False then begin
    if Situacao = 'OCUPADO' then begin
      {passa os dados do hospede}
      try

        if F_dmParametro = nil then begin
          Application.CreateForm(TF_dmParametro, F_dmParametro);
        end;

        FechaHospede; {Procedure fecha Hospede}

        {variavel global para ser usada na transferencia. lá precisa armazenar o código do hóspede e não quero fazer select novamente.}
        codHospede := F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsInteger;

        {pega o bar (produtos consumidos)}
        with QRY_proConsumidos do begin
          Close;
          SQL.Clear;
          SQL.Add('select ME2_DOCTO, ME2_OPERACAO, ME2_DATA, ME2_QUATIDADE, ME2_VLRUNIT,');
          SQL.Add('ME2_PRONOME, ME2_VLRTOTAL, ME2_DESCONTO, ME2_FUNCIONARIO, ME2_COMPLEMENTO, ME2_PRODUTO from mvestoque2');
          SQL.Add('where me2_docto = :codEntrada');
          ParamByName('codEntrada').Value := CodEntrada;
          Open();
        end;

        with F_dmParametro.QRY_parametro do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from hotparametro');
          Open();
        end;

        {produtos consumidos}
        if QRY_proConsumidos.RecordCount > 0 then begin
          vlrConsumo.Value := QRY_proConsumidosvlrTotal.AsVariant;
        end;

        {se a data do fechamento é igual a data da entrada}
        if F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.AsDateTime = Date then begin
          edtHospede.Text           := F_dmHospedes.QRY_FechaHospedeCLI_RAZAO.AsString;
          dtaHospedagem.Text        := DateTimeToStr(F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.AsDateTime);
          hraHospedagem.Text        := F_dmHospedes.QRY_FechaHospedeENT_HORAENTRADA.AsVariant;

          edtQtdDNormal.Value       := 1;//F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_NORMAL.AsInteger;
          edtQtdDExtra.Value        := F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger;

          vlrDNormal.Value          := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_NORMAL.AsCurrency;

          if F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger < 1 then begin
            vlrDExtra.Value := 0;
          end
          else begin
            vlrDExtra.Value           := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_EXTRA.AsCurrency;
          end;

          with F_dmConexao.QRY_saldoTransferencia do begin
            Close;
            SQL.Clear;
            SQL.Add('select * from hottransferencia where TR_COD_HOSPEDAGEM = :codHospedagem');
            ParamByName('codHospedagem').Value   := CodEntrada;
            Open();
          end;

          qTransferencia := 0;

          if F_dmConexao.QRY_saldoTransferencia.RecordCount > 0 then begin
            F_dmConexao.QRY_saldoTransferencia.First;
            while not F_dmConexao.QRY_saldoTransferencia.Eof do begin
              qTransferencia := F_dmConexao.QRY_saldoTransferenciaTR_VLR_GERAL_DIARIAS_ANTERIOR.AsCurrency + qTransferencia;
              F_dmConexao.QRY_saldoTransferencia.Next;
            end;
          end;


          vlrTotal.Value := ((vlrDNormal.Value * edtQtdDNormal.Value)  + (vlrDExtra.Value * edtQtdDExtra.Value)
                        + vlrConsumo.Value + qTransferencia);
        end

        {se a data do fechamento não for igual a data da entrada}
        else begin

          hSaida.Time       := Now();
          hParametro.Time   := F_dmParametro.QRY_parametroPA_HORADIARIA.AsDateTime;

          {se a hora do fechamento é menor ou igual a hora definida no parametro}
          if TimeToStr(hSaida.Time) <= TimeToStr(hParametro.Time)  then begin

            qDExtra  := DaysBetween(F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.AsDateTime,Date)
              * F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger;

            qDNormal := DaysBetween(F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.AsDateTime,Date)
              * 1;//F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_NORMAL.AsInteger;

            edtQtdDNormal.Value       := qDNormal;
            edtQtdDExtra.Value        := qDExtra;

            edtHospede.Text           := F_dmHospedes.QRY_FechaHospedeCLI_RAZAO.AsString;
            dtaHospedagem.Text        := DateTimeToStr(F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.AsDateTime);
            hraHospedagem.Text        := F_dmHospedes.QRY_FechaHospedeENT_HORAENTRADA.AsVariant;

            vlrDNormal.Value          := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_NORMAL.AsCurrency;

            if F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger < 1 then begin
              vlrDExtra.Value := 0;
            end
            else begin
              vlrDExtra.Value           := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_EXTRA.AsCurrency;
            end;

            vlrTotal.Value            := ((vlrDNormal.Value * edtQtdDNormal.Value)  + (vlrDExtra.Value * edtQtdDExtra.Value)
                     + vlrConsumo.Value);
          end

          {se a hora do fechamento for maior que a hora definida no parametro}
          else begin
            qDExtra  := ( DaysBetween(F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.AsDateTime,Date)
              * F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger) +
                       F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger;

            qDNormal := ( DaysBetween(F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.AsDateTime,Date)
              * 1) + 1;//F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_NORMAL.AsInteger;

            edtQtdDNormal.Value       := qDNormal;
            edtQtdDExtra.Value        := qDExtra;

            edtHospede.Text           := F_dmHospedes.QRY_FechaHospedeCLI_RAZAO.AsString;
            dtaHospedagem.Text        := DateTimeToStr(F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.AsDateTime);
            hraHospedagem.Text        := F_dmHospedes.QRY_FechaHospedeENT_HORAENTRADA.AsVariant;

            vlrDNormal.Value          := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_NORMAL.AsCurrency;

            if F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger < 1 then begin
              vlrDExtra.Value := 0;
            end
            else begin
              vlrDExtra.Value           := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_EXTRA.AsCurrency;
            end;
          end;

          with F_dmConexao.QRY_saldoTransferencia do begin
            Close;
            SQL.Clear;
            SQL.Add('select * from hottransferencia where TR_COD_HOSPEDAGEM = :codHospedagem');
            ParamByName('codHospedagem').Value   := CodEntrada;
            Open();
          end;

          qTransferencia := 0;

          if F_dmConexao.QRY_saldoTransferencia.RecordCount > 0 then begin
            F_dmConexao.QRY_saldoTransferencia.First;
            while not F_dmConexao.QRY_saldoTransferencia.Eof do begin
              qTransferencia := F_dmConexao.QRY_saldoTransferenciaTR_VLR_GERAL_DIARIAS_ANTERIOR.AsCurrency + qTransferencia;
              F_dmConexao.QRY_saldoTransferencia.Next;
            end;
          end;


          vlrTotal.Value := ((vlrDNormal.Value * qDNormal) + (vlrDExtra.Value * qDExtra) + vlrConsumo.Value + qTransferencia);
        end;

      finally
//        FreeAndNil(F_dmHospedes);
      end;
      {Fim Ocupado}
      btnEntra.Enabled            := False;
      btnEfetivar.Enabled         := False;
      btnReserva.Enabled          := False;
      btnCancelaReserva.Enabled   := False;
    end;

    if Situacao = 'RESERVADO' then begin
      {passa os dados referente a reserva - desabilita alguns botões}
      try
        if F_dmHospedes = nil then begin
          Application.CreateForm(TF_dmHospedes, F_dmHospedes);
        end;

        with QRY_reserva do begin
          Close;
          SQL.Clear;
          SQL.Add('select cl.cli_codigo, cl.cli_razao, cl.cli_fanta,eh.* from cliente cl');
          SQL.Add('inner join hotentrahospede eh on (cl.cli_codigo = eh.ent_codhospede)');
          SQL.Add('where eh.ent_codapartamento = :codApto and eh.ent_status = :status');
          ParamByName('status').Value := 'RESERVADO';
          ParamByName('codApto').Value := CodApartamento;
          Open();
        end;

        lblDtaHospedagem.Caption  := 'Dta. Reserva';
        lblHoraHospedagem.Caption := 'Hra. Reserva';

        if QRY_reservaENT_QTD_DIARIA_EXTRA.AsInteger > 0 then begin
          edtHospede.Text           := QRY_reservaCLI_RAZAO.AsString;
          dtaHospedagem.Text        := DateTimeToStr(QRY_reservaENT_DATARESERVA.AsDateTime);
          hraHospedagem.Text        := QRY_reservaENT_HORARESERVA.AsVariant;

          vlrDNormal.Value          := QRY_reservaENT_VLR_DIARIA_NORMAL.AsCurrency;
          vlrDExtra.Value           := QRY_reservaENT_VLR_DIARIA_EXTRA.AsCurrency;

          edtQtdDNormal.Value       := QRY_reservaENT_QTD_DIARIA_NORMAL.AsInteger;
          edtQtdDExtra.Value        := QRY_reservaENT_QTD_DIARIA_EXTRA.AsInteger;

          vlrTotal.Value            := vlrDNormal.Value + (vlrDExtra.Value * edtQtdDExtra.Value);
        end
        else begin
          edtHospede.Text           := QRY_reservaCLI_RAZAO.AsString;
          dtaHospedagem.Text        := DateTimeToStr(QRY_reservaENT_DATARESERVA.AsDateTime);
          hraHospedagem.Text        := QRY_reservaENT_HORARESERVA.AsVariant;

          vlrDNormal.Value          := QRY_reservaENT_VLR_DIARIA_NORMAL.AsCurrency;
          vlrDExtra.Value           := QRY_reservaENT_VLR_DIARIA_EXTRA.AsCurrency;

          edtQtdDNormal.Value       := QRY_reservaENT_QTD_DIARIA_NORMAL.AsInteger;
          edtQtdDExtra.Value        := QRY_reservaENT_QTD_DIARIA_EXTRA.AsInteger;

          vlrTotal.Value            := vlrDNormal.Value;
        end;
      finally
//        FreeAndNil(F_dmHospedes);
      end;
      {Fim do Reservado}
      btnEntra.Enabled              := False;
      btnFechaApto.Enabled          := False;
      btnProdutos.Enabled           := False;
      btnHaver.Enabled              := False;
      btnReserva.Enabled            := False;
      btnCancelaHospedagem.Enabled  := False;
    end;
  end {Livre = False}

  else begin
    {Aqui oculta o painel e diminui a altura do form - Apto: Livre | Desabilita alguns botões}
    pnlControleGerencial.Visible := False;
    F_checkIn.Height := 244;

    btnFechaApto.Enabled          := False;
    btnEfetivar.Enabled           := False;
    btnCancelaReserva.Enabled     := False;
    btnTransferencia.Enabled      := False;
    btnProdutos.Enabled           := False;
    btnHaver.Enabled              := False;
    btnCancelaHospedagem.Enabled  := False;
    btnVerHospedes.Enabled        := False;
    btnReimprimir.Enabled         := False;
  end;
end;

end.

