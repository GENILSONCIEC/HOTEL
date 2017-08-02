unit UEfetivaReserva;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxCurrencyEdit, Vcl.StdCtrls, dxGDIPlusClasses, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxDBEdit, System.DateUtils, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinLilian, dxSkinOffice2007Black,
  dxSkinOffice2010Black, dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue;

type
  TF_efetivaReserva = class(TF_baseTelaSimples)
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
    lblDtaEfetivacao: TLabel;
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
    edtApto: TcxCurrencyEdit;
    QRY_qtdPessoasCategoria: TFDQuery;
    QRY_qtdPessoasCategoriaCAT_CODCATEGORIA: TIntegerField;
    QRY_qtdPessoasCategoriaCAT_CATEGORIA: TStringField;
    QRY_qtdPessoasCategoriaCAT_ATPESSOAS: TIntegerField;
    QRY_qtdPessoasCategoriaCAT_VALORDIARIA1: TBCDField;
    QRY_qtdPessoasCategoriaCAT_VALORDIARIA2: TBCDField;
    QRY_calculaDiarias: TFDQuery;
    QRY_calculaDiariasCAT_CODCATEGORIA: TIntegerField;
    QRY_calculaDiariasCAT_CATEGORIA: TStringField;
    QRY_calculaDiariasCAT_ATPESSOAS: TIntegerField;
    QRY_calculaDiariasCAT_VALORDIARIA1: TBCDField;
    QRY_calculaDiariasCAT_VALORDIARIA2: TBCDField;
    DS_efetivaReservaUpdate: TDataSource;
    edtCliente: TcxTextEdit;
    edtCodCli: TcxDBCurrencyEdit;
    edtQtdAdultos: TcxDBCurrencyEdit;
    edtQtdCriancas: TcxDBCurrencyEdit;
    edtQtdPagantes: TcxDBCurrencyEdit;
    edtQtdDNormal: TcxDBCurrencyEdit;
    edtVlrDNormal: TcxDBCurrencyEdit;
    edtVlrGDNormal: TcxDBCurrencyEdit;
    dtaReserva: TcxDBDateEdit;
    dtaEfetivacao: TcxDBDateEdit;
    edtQtdDExtra: TcxDBCurrencyEdit;
    edtVlrDExtra: TcxDBCurrencyEdit;
    edtVlrGDExtra: TcxDBCurrencyEdit;
    edtSubTDiarias: TcxDBCurrencyEdit;
    edtVlrTDiarias: TcxDBCurrencyEdit;
    edtPlaca: TcxDBMaskEdit;
    edtModeloVeiculo: TcxDBTextEdit;
    edtMarcaVeiculo: TcxDBTextEdit;
    hraEntrada: TcxDBCurrencyEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdPagantesExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var libera: String;
  end;

var
  F_efetivaReserva: TF_efetivaReserva;

implementation

{$R *.dfm}

uses UMsg, UFunctions, UDMConexao, UDMRackApto, UDMHospedes, UCheckIn;

procedure TF_efetivaReserva.btnSalvarClick(Sender: TObject);
var hEtrada : TTime;
begin
  inherited;
  {se o cliente atendende demorar muito para clicar no gravar, atualiza a data e a hora.}
  hEtrada := Time;
  hraEntrada.Text     := TimeToStr(hEtrada);
  dtaEfetivacao.Date  := Date;

  if Situacao = 'RESERVADO' then begin
    try
      F_dmConexao.FDConn.StartTransaction;   {inicia a transação}

        F_dmHospedes.QRY_efetivaReservaUpdate.Edit; {para já começar a edição}

        F_dmHospedes.QRY_efetivaReservaUpdateENT_STATUS.AsString        := 'OCUPADO';
        F_dmHospedes.QRY_efetivaReservaUpdateENT_HORAENTRADA.AsDateTime := hEtrada;
        F_dmHospedes.QRY_efetivaReservaUpdateENT_DATAENTRADA.AsDateTime := Date;
        F_dmHospedes.QRY_efetivaReservaUpdate.ApplyUpdates(0);

      {atualiza o apto}
      with F_dmHospedes.QRY_efetivaReservaUpdateApto do begin
        Close;
        SQL.Clear;
        SQL.Add('update HOTAPARTAMENTO');
        SQL.Add('set APA_SITUACAO = :situacao');
        SQL.Add('where (APA_CODAPARTAMENTO = :codApto)   ');
        ParamByName('situacao').Value     := 'OCUPADO';
        ParamByName('codApto').Value      := CodApartamento;
        ExecSQL;
      end;

      {faz update nas tabelas auxiliares}


      F_dmConexao.FDConn.Commit;  {se tudo der certo, commita a transação}
      OrdenaLista; {atualiza a lista}
      TF_msg.Mensagem('Hóspede hospedado com sucesso.','I',[mbOk]);

      Self.Close; {fecha o form para o cliente nao salvar novamente}
      if F_checkIn <> nil then begin
        F_checkIn.Close;
      end;

    except on e:Exception do
      begin
        F_dmConexao.FDConn.Rollback;
        TF_msg.Mensagem('Erro na Hospedagem do Hóspede. Verifique os dados de entrada corretamente.','I',[mbOk]);
        exit;
      end;
    end;
  End
  else begin
    TF_msg.Mensagem('Esse Apto Não foi reservado. Obrigado!','I',[mbOk]);
    Self.Close;
    exit;
  end;
end;

procedure TF_efetivaReserva.edtQtdPagantesExit(Sender: TObject);
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

procedure TF_efetivaReserva.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then begin
    btnPesquisar.Click;
  end;
end;

procedure TF_efetivaReserva.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0,0); //mais rápido
  end;
end;

procedure TF_efetivaReserva.FormShow(Sender: TObject);
var hEntrada : TTime;
begin
  inherited;

  if F_dmHospedes = nil then begin
    Application.CreateForm(TF_dmHospedes, F_dmHospedes);
  end;

  if Situacao = 'RESERVADO' then begin
    with F_dmHospedes.QRY_efetivaReserva do begin
      Close;
      SQL.Clear;
      SQL.Add('select cl.cli_codigo, cl.cli_razao, cl.cli_fanta, eh.* from cliente cl');
      SQL.Add('inner join hotentrahospede eh');
      SQL.Add('on (cl.cli_codigo = eh.ent_codhospede)');
      SQL.Add('where eh.ent_codapartamento = :codApto and eh.ent_datasaida is null');
      ParamByName('codApto').Value := CodApartamento;
      Open();
    end;

    F_dmHospedes.QRY_efetivaReservaUpdate.Close;
    F_dmHospedes.QRY_efetivaReservaUpdate.Params[0].Value := F_dmHospedes.QRY_efetivaReservaENT_CODENTRADA.AsInteger;
    F_dmHospedes.QRY_efetivaReservaUpdate.Open();

    F_dmHospedes.QRY_efetivaReservaUpdate.Edit; {coloca em edição para poder mudar.}

    hEntrada := Time;
    hraEntrada.Text     := TimeToStr(hEntrada);
    dtaEfetivacao.Date  := Date;

//    F_dmHospedes.QRY_efetivaReserva.Locate('cli_codigo', F_dmHospedes.QRY_efetivaReservaUpdateENT_CODHOSPEDE.AsInteger, []);

    {Apenas essas informações não serão dataWare}
    if F_dmHospedes.QRY_efetivaReserva.RecordCount > 0 then begin
      edtCliente.Text         := F_dmHospedes.QRY_efetivaReservaCLI_RAZAO.AsString;
      edtApto.Text            := Apartamento;
    end;
  end;
end;

end.
