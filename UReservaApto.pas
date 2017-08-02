unit UReservaApto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxCurrencyEdit, Vcl.StdCtrls, dxGDIPlusClasses, Vcl.Buttons, UFunctions,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxDBEdit, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinLilian, dxSkinOffice2007Black, dxSkinOffice2010Black,
  dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue;

type
  TF_reservaApto = class(TF_baseTelaSimples)
    pnlControle: TPanel;
    btnSalvar: TSpeedButton;
    pnlDados: TPanel;
    imgEntraHospede: TImage;
    lblCodCli: TLabel;
    lblCliente: TLabel;
    btnPesquisar: TSpeedButton;
    lblQtdAtuldos: TLabel;
    lblQtdCriancas: TLabel;
    lblQtdPagantes: TLabel;
    lblQtdDNormal: TLabel;
    lblVlrDNormal: TLabel;
    lblDtaReserva: TLabel;
    lblHoraReserva: TLabel;
    lblPrevisaoEntrada: TLabel;
    lblPlaca: TLabel;
    lblModelo: TLabel;
    lblMarca: TLabel;
    lblVlrGDNormal: TLabel;
    lblQtdDExtras: TLabel;
    lblVlrDExtra: TLabel;
    lblVlrGDExtra: TLabel;
    lblSutTotDiarias: TLabel;
    lblTGDiarias: TLabel;
    btnCadVeiculos: TSpeedButton;
    lblApto: TLabel;
    edtCodCli: TcxCurrencyEdit;
    edtCliente: TcxTextEdit;
    edtQtdAdultos: TcxCurrencyEdit;
    edtQtdCriancas: TcxCurrencyEdit;
    edtQtdPagantes: TcxCurrencyEdit;
    edtQtdDNormal: TcxCurrencyEdit;
    edtVlrDNormal: TcxCurrencyEdit;
    edtVlrGDNormal: TcxCurrencyEdit;
    edtQtdDExtra: TcxCurrencyEdit;
    edtVlrDExtra: TcxCurrencyEdit;
    edtVlrGDExtra: TcxCurrencyEdit;
    edtSubTDiarias: TcxCurrencyEdit;
    edtVlrTDiarias: TcxCurrencyEdit;
    dtaReserva: TcxDateEdit;
    dtaPrevisaoEntrada: TcxDateEdit;
    edtModeloVeiculo: TcxTextEdit;
    edtMarcaVeiculo: TcxTextEdit;
    edtPlaca: TcxMaskEdit;
    edtApto: TcxCurrencyEdit;
    QRY_calculaDiarias: TFDQuery;
    QRY_calculaDiariasCAT_CODCATEGORIA: TIntegerField;
    QRY_calculaDiariasCAT_CATEGORIA: TStringField;
    QRY_calculaDiariasCAT_ATPESSOAS: TIntegerField;
    QRY_calculaDiariasCAT_VALORDIARIA1: TBCDField;
    QRY_calculaDiariasCAT_VALORDIARIA2: TBCDField;
    QRY_qtdPessoasCategoria: TFDQuery;
    QRY_qtdPessoasCategoriaCAT_CODCATEGORIA: TIntegerField;
    QRY_qtdPessoasCategoriaCAT_CATEGORIA: TStringField;
    QRY_qtdPessoasCategoriaCAT_ATPESSOAS: TIntegerField;
    QRY_qtdPessoasCategoriaCAT_VALORDIARIA1: TBCDField;
    QRY_qtdPessoasCategoriaCAT_VALORDIARIA2: TBCDField;
    QRY_veiculos: TFDQuery;
    QRY_veiculosVEI_CODIGO: TIntegerField;
    QRY_veiculosVEI_MODELO: TStringField;
    QRY_veiculosVEI_MARCA: TStringField;
    QRY_veiculosVEI_LINHA: TStringField;
    QRY_veiculosVEI_PLACA: TStringField;
    QRY_veiculosVEI_COR: TStringField;
    hraReserva: TcxCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtQtdPagantesExit(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtVlrDNormalExit(Sender: TObject);
    procedure edtVlrDExtraExit(Sender: TObject);
    procedure edtPlacaExit(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var reservaHospede, cadVeiculo, libera: String;
  end;

var
  F_reservaApto: TF_reservaApto;

implementation

{$R *.dfm}

uses UDMRackApto, UDMConexao, UMsg, UDMHospedes, UPesquisaHospedes,
  USenhaLiberacao, UCheckIn;

procedure TF_reservaApto.btnPesquisarClick(Sender: TObject);
begin
  inherited;
//  reservaHospede := 'S';
  CriaFormDestroy(TF_pesquisaHospede, F_pesquisaHospede);
end;

procedure TF_reservaApto.btnSalvarClick(Sender: TObject);
var hReserva : TTime;
begin
  inherited;
  try
    if F_dmHospedes = nil then begin
      Application.CreateForm(TF_dmHospedes, F_dmHospedes);
    end;

    hReserva := Time;

    {se nao fizer isso, corre o risto de gravar a reserva duas vezes visto que o codigo ainda fica na Qry}
    F_dmHospedes.QRY_reservaApto.Close;
    F_dmHospedes.QRY_reservaApto.Open();

    {se o atendende demorar gravar, atualiza a data e a hora.}
    hraReserva.Text             := TimeToStr(hReserva);
    dtaReserva.Date             := Date;

    if (StrToInt(edtCodCli.Text) <= 0) or (StrToInt(edtQtdPagantes.Text) <= 0) then begin
      TF_msg.Mensagem('Faltam algumas informações do Hóspede! O Nome do Hósdede ou a Qtd. de Pagantes são obrigatórios.','I',[mbOk]);
      edtCliente.SetFocus;
      exit;
    end;

    if Situacao = 'LIVRE' then begin
      try
        F_dmConexao.FDConn.StartTransaction;   {inicia a transação}

        hraReserva.Text             := TimeToStr(hReserva); {atualiza a hora. se o funcionario demorar clicar no salvar}

        F_dmHospedes.QRY_reservaApto.Open();
        F_dmHospedes.QRY_reservaApto.Append;

        F_dmHospedes.QRY_reservaAptoENT_CODAPARTAMENTO.AsInteger           := StrToInt(CodApartamento);
        F_dmHospedes.QRY_reservaAptoENT_CODHOSPEDE.AsInteger               := StrToInt(edtCodCli.Text);

        F_dmHospedes.QRY_reservaAptoENT_DATARESERVA.AsDateTime             := dtaReserva.Date;

        F_dmHospedes.QRY_reservaAptoENT_HORARESERVA.AsDateTime             := Time;
        F_dmHospedes.QRY_reservaAptoENT_QTDADULTOS.AsInteger               := StrToInt(edtQtdAdultos.Text);
        F_dmHospedes.QRY_reservaAptoENT_QTDCRIANCAS.AsInteger              := StrToInt(edtQtdCriancas.Text);
        F_dmHospedes.QRY_reservaAptoENT_QTDPAGANTES.AsInteger              := StrToInt(edtQtdPagantes.Text);
        F_dmHospedes.QRY_reservaAptoENT_VLR_DIARIA_NORMAL.AsCurrency       := edtVlrDNormal.Value;
        F_dmHospedes.QRY_reservaAptoENT_VLR_DIARIA_EXTRA.AsCurrency        := edtVlrDExtra.Value;
        F_dmHospedes.QRY_reservaAptoENT_QTD_DIARIA_NORMAL.AsInteger        := StrToInt(edtQtdDNormal.Text);
        F_dmHospedes.QRY_reservaAptoENT_VLR_G_DIARIA_NORMAL.AsCurrency     := edtVlrGDNormal.Value;
        F_dmHospedes.QRY_reservaAptoENT_VLR_G_DIARIA_EXTRA.AsCurrency      := edtVlrGDExtra.Value;
        F_dmHospedes.QRY_reservaAptoENT_QTD_DIARIA_EXTRA.AsInteger         := StrToInt(edtQtdDExtra.Text);
        F_dmHospedes.QRY_reservaAptoENT_VLR_G_DIARIA_EXTRA.AsCurrency      := edtVlrGDExtra.Value;
        F_dmHospedes.QRY_reservaAptoENT_DATAPREVISAOEFETIVAR.AsDateTime    := dtaPrevisaoEntrada.Date;
        F_dmHospedes.QRY_reservaAptoENT_PLACA.AsString                     := edtPlaca.Text;
        F_dmHospedes.QRY_reservaAptoENT_MODELOVEICULO.AsString             := edtModeloVeiculo.Text;
        F_dmHospedes.QRY_reservaAptoENT_MARCAVEICULO.AsString              := edtMarcaVeiculo.Text;
        F_dmHospedes.QRY_reservaAptoENT_USUARIORESERVOU.AsInteger          := 1; {pegar o logado}
        F_dmHospedes.QRY_reservaAptoENT_FILIAL.AsString                    := '1'; {pegar a filial logada}
        F_dmHospedes.QRY_reservaAptoENT_STATUS.AsString                    := 'RESERVADO'; {NA TABELA HOTENTRAHOSPEDE}

        {19-05-2017}
        F_dmHospedes.QRY_reservaAptoENT_VLR_TOTAL_DIARIAS.AsCurrency       := edtVlrTDiarias.Value;
        F_dmHospedes.QRY_reservaAptoENT_QTD_TOTAL_DIARIAS.AsInteger        := StrToInt(edtSubTDiarias.Text);

        F_dmHospedes.QRY_reservaApto.Post;
        F_dmHospedes.QRY_reservaApto.ApplyUpdates();

        {pega o codigo de entrada para atualizar a tabela hotApartamento}
          with F_dmRackApto.QRY_codEntrada do begin
            Close;
            SQL.Clear;
            SQL.Add('select * from hotentrahospede where ent_codapartamento = :codApto and ent_datasaida is null');
            ParamByName('codApto').Value := CodApartamento;
            Open();
          end;

          {Atualiza a tabela hotApartamento colocando o código de entrada}
          with F_dmRackApto.QRY_atualizaApto do begin
            Close;
            SQL.Clear;
            SQL.Add('update hotApartamento set apa_codEntrada = :codEntrada where apa_codapartamento = :codApto');
            ParamByName('codEntrada').Value := F_dmRackApto.QRY_codEntradaENT_CODENTRADA.AsInteger;
            ParamByName('codApto').Value := CodApartamento;
            ExecSQL;
          end;

          {Atualiza o status do apto na tabela hotApartamento}
          with F_dmRackApto.QRY_atualizaApto do begin
            Close;
            SQL.Clear;
            SQL.Add('update hotApartamento set apa_situacao = :situacao where apa_codapartamento = :codApto');
            ParamByName('situacao').Value := 'RESERVADO';
            ParamByName('codApto').Value := CodApartamento;
            ExecSQL;
          end;

        F_dmConexao.FDConn.Commit;  {se tudo der certo, commita a transação}

        OrdenaLista; {atualiza a lista}

        TF_msg.Mensagem('Apto Reservado com sucesso.','I',[mbOk]);

        Self.Close; {fecha o form para o cliente nao salvar novamente}
        if F_checkIn <> nil then begin
          F_checkIn.Close;
        end;

      except on e:Exception do
        begin
          F_dmConexao.FDConn.Rollback;
          TF_msg.Mensagem('Erro na Reserva do Apto. Verifique os dados de entrada corretamente.','I',[mbOk]);
          exit;
        end;
      end;
    End
    else begin
      TF_msg.Mensagem('Esse Apto ja foi Reservado. Obrigado!','I',[mbOk]);
      Self.Close;
      exit;
    end;
  finally
    FreeAndNil(F_dmHospedes);
  end;
end;

procedure TF_reservaApto.edtClienteExit(Sender: TObject);
begin
  inherited;
  {sair do cliente}
  if (edtCliente.Text = '') or (edtCodCli.Text = '0') then begin
    TF_msg.Mensagem('Cliente inválido ou em Branco.','I',[mbOk]);
    TcxTextEdit(Sender).SetFocus;
    btnPesquisar.Click;
  end;
end;

procedure TF_reservaApto.edtPlacaExit(Sender: TObject);
begin{pesquisa pela placa}
  inherited;
  if edtPlaca.Text = '   -    ' then begin
    exit;
  end
  else begin
    QRY_veiculos.Close;
    QRY_veiculos.Params[0].Value := '%'+ edtPlaca.Text + '%';
    QRY_veiculos.Open();

    if QRY_veiculos.RecordCount > 0 then begin
      edtPlaca.Text               := QRY_veiculosVEI_PLACA.AsString;
      edtModeloVeiculo.Text       := QRY_veiculosVEI_MODELO.AsString;
      edtMarcaVeiculo.Text        := QRY_veiculosVEI_MARCA.AsString;
    end
    else begin
      TF_msg.Mensagem('Veículo não encontrado. Favor, faça o cadastro.','I',[mbOk]);
      edtPlaca.Clear;
      edtPlaca.SetFocus;
      btnCadVeiculos.Click;
      exit;
    end;
  end;
end;

procedure TF_reservaApto.edtQtdPagantesExit(Sender: TObject);
begin
  inherited;
{sair do qtdPagantes}
  if ENumerico2(edtQtdPagantes.Text) = True then begin
    {faz as regras}
    if edtQtdPagantes.Value < 1 then begin
      TF_msg.Mensagem('Valor inválido! Favor, informar um valor maior ou igual a 1.','I',[mbOk]);
      TcxTextEdit(Sender).SetFocus;
      exit;
    end;

    QRY_qtdPessoasCategoria.Close;
    QRY_qtdPessoasCategoria.Params[0].Value := CodApartamento;
    QRY_qtdPessoasCategoria.Open();

    {qtd. diarias extras e normais}
    if edtQtdPagantes.Value > QRY_qtdPessoasCategoriaCAT_ATPESSOAS.AsInteger then begin      {QRY_qtdPessoasCategoria era 1 por padrão}
      edtQtdDExtra.Value        := (edtQtdPagantes.Value - QRY_qtdPessoasCategoriaCAT_ATPESSOAS.AsInteger);  {qtd. diarias extras}
      edtQtdDNormal.Value       := (edtQtdPagantes.Value - edtQtdDExtra.Value); {qtd. diarias normais}

      edtVlrGDNormal.Value      := edtVlrDNormal.Value; // edtQtdDNormal.Value * edtVlrDNormal.Value; {vlr. geral. diarias normais}
      edtVlrGDExtra.Value       := edtQtdDExtra.Value  * edtVlrDExtra.Value;  {vlr. geral. diarias extras}

      edtSubTDiarias.Value      := edtQtdDNormal.Value + edtQtdDExtra.Value; {tot. geral. diarias}
      edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
    end
    else begin
      edtQtdDExtra.Value        := 0;  {qtd. diarias extras}
      edtQtdDNormal.Value       := edtQtdPagantes.Value; {qtd. diarias normais}

      edtVlrGDNormal.Value      := edtVlrDNormal.Value; // edtQtdDNormal.Value * edtVlrDNormal.Value; {vlr. geral. diarias normais}
      edtVlrGDExtra.Value       := edtQtdDExtra.Value  * edtVlrDExtra.Value;  {vlr. geral. diarias extras}

      edtSubTDiarias.Value      := edtQtdDNormal.Value + edtQtdDExtra.Value; {tot. geral. diarias}
      edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
    end;

  end
  else begin
    {bloqueia}
    TF_msg.Mensagem('Valor inválido!','I',[mbOk]);
    TcxCurrencyEdit(Sender).SetFocus;
  end;
end;

procedure TF_reservaApto.edtVlrDExtraExit(Sender: TObject);
begin{saindo da extra}
  inherited;
  {verificar se o percentual do desconto é menor que o valor definido no parametro de desconto}
  if edtVlrDExtra.Value < 0 then begin
    TF_msg.Mensagem('Desconto incorreto.','E',[mbOk]);
    TcxCurrencyEdit(Sender).SetFocus;
    exit;
  end;

  if edtVlrDExtra.Value < F_dmRackApto.QRY_rackAptoCAT_VALORDIARIA2.AsCurrency then begin
    if TF_msg.Mensagem('Desconto maior que o permitido. Deseja fazer a liberação?','Q',[mbSim, mbNao]) then begin
      CriaFormDestroy(TF_senhaLiberacao, F_senhaLiberacao);

      if libera = 'S' then begin
        edtVlrGDExtra.Value       := edtQtdDExtra.Value * edtVlrDExtra.Value; {vlr. geral. diarias extras}
        edtSubTDiarias.Value      := edtQtdDNormal.Value + edtQtdDExtra.Value; {tot. geral. diarias}
        edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
        exit;
      end
      else begin
        edtVlrDExtra.Value        := F_dmRackApto.QRY_rackAptoCAT_VALORDIARIA2.AsCurrency;
        edtVlrGDExtra.Value       := edtQtdDExtra.Value * edtVlrDExtra.Value; {vlr. geral. diarias extras}
        edtSubTDiarias.Value      := edtQtdDNormal.Value + edtQtdDExtra.Value; {tot. geral. diarias}
        edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
        exit;
      end;
    end;

    {so cai se nao fazer nada}
    edtVlrDExtra.Value        := F_dmRackApto.QRY_rackAptoCAT_VALORDIARIA2.AsCurrency;
    edtVlrGDExtra.Value       := edtQtdDExtra.Value * edtVlrDExtra.Value; {vlr. geral. diarias extras}
    edtSubTDiarias.Value      := edtQtdDNormal.Value + edtQtdDExtra.Value; {tot. geral. diarias}
    edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
  end
  else begin
    edtVlrGDExtra.Value       := edtQtdDExtra.Value * edtVlrDExtra.Value; {vlr. geral. diarias extras}
    edtSubTDiarias.Value      := edtQtdDNormal.Value + edtQtdDExtra.Value; {tot. geral. diarias}
    edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
  end;
end;

procedure TF_reservaApto.edtVlrDNormalExit(Sender: TObject);
begin{saindo da normal}
  inherited;
  {verificar se o percentual do desconto é menor que o valor definido no parametro de desconto}
  if edtVlrDNormal.Value < 0 then begin
    TF_msg.Mensagem('Desconto incorreto.','E',[mbOk]);
    TcxCurrencyEdit(Sender).SetFocus;
    exit;
  end;

  if edtVlrDNormal.Value < F_dmRackApto.QRY_rackAptoCAT_VALORDIARIA1.AsCurrency then begin
    if TF_msg.Mensagem('Desconto maior que o permitido. Deseja fazer a liberação?','Q',[mbSim, mbNao]) then begin
      CriaFormDestroy(TF_senhaLiberacao, F_senhaLiberacao);

      if libera = 'S' then begin
        edtVlrGDNormal.Value      := edtQtdDNormal.Value * edtVlrDNormal.Value; {vlr. geral. diarias normais}
        edtSubTDiarias.Value      := edtQtdDNormal.Value + edtQtdDExtra.Value; {tot. geral. diarias}
        edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
        exit;
      end
      else begin
        edtVlrDNormal.Value       := F_dmRackApto.QRY_rackAptoCAT_VALORDIARIA1.AsCurrency;
        edtVlrGDNormal.Value      := edtQtdDNormal.Value * edtVlrDNormal.Value; {vlr. geral. diarias normais}
        edtSubTDiarias.Value      := edtQtdDNormal.Value + edtQtdDExtra.Value; {tot. geral. diarias}
        edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
        exit;
      end;
    end;

    {so cai se nao fazer nada}
    edtVlrDNormal.Value       := F_dmRackApto.QRY_rackAptoCAT_VALORDIARIA1.AsCurrency;
    edtVlrGDNormal.Value      := edtQtdDNormal.Value * edtVlrDNormal.Value; {vlr. geral. diarias normais}
    edtSubTDiarias.Value      := edtQtdDNormal.Value + edtQtdDExtra.Value; {tot. geral. diarias}
    edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
  end
  else begin
    edtVlrGDNormal.Value      := edtQtdDNormal.Value * edtVlrDNormal.Value; {vlr. geral. diarias normais}
    edtSubTDiarias.Value      := edtQtdDNormal.Value + edtQtdDExtra.Value; {tot. geral. diarias}
    edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
  end;
end;

procedure TF_reservaApto.FormCreate(Sender: TObject);
begin
  inherited;
  if F_dmHospedes = nil then begin
    Application.CreateForm(TF_dmHospedes, F_dmHospedes);
  end;
end;

procedure TF_reservaApto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then begin
    btnPesquisar.Click;
  end;
end;

procedure TF_reservaApto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0,0); //mais rápido
  end;
end;

procedure TF_reservaApto.FormShow(Sender: TObject);
var hReserva : TTime;
begin
  inherited;

  hReserva := Time;

  hraReserva.Text             := TimeToStr(hReserva);
  dtaReserva.Date             := Date;
  dtaPrevisaoEntrada.Date     := Date;
  edtCliente.SelStart         := Length(edtCliente.Text);

  If Situacao = 'LIVRE' Then
  Begin
    edtApto.Text                := Apartamento; //F_dmRackApto.QRY_rackAptoAPA_APARTAMENTO.AsString;
    edtVlrDNormal.Value         := F_dmRackApto.QRY_rackAptoCAT_VALORDIARIA1.AsCurrency;
    edtVlrDExtra.Value          := F_dmRackApto.QRY_rackAptoCAT_VALORDIARIA2.AsCurrency;
  End;

  //Vamos fazer o calculo das diárias baseado no apto escolhido
  with QRY_calculaDiarias do begin
    Close;
    SQL.Clear;
    SQL.Add('select ct.* from hotcategoria ct');
    SQL.Add('inner join hotapartamento ap');
    SQL.Add('on (ct.cat_codcategoria = ap.apa_codcategoria)');
    SQL.Add('where ap.apa_codapartamento = :codApto');
    ParamByName('codApto').Value := CodApartamento;
    Open();
  end;

end;

end.
