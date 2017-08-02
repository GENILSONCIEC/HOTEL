unit UCancelaHospedagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, dxGDIPlusClasses, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TF_cancelaHospedagem = class(TF_baseTelaSimples)
    lblInfo: TLabel;
    btnSim: TBitBtn;
    btnNao: TBitBtn;
    imgBack: TImage;
    QRY_updateHotEntraHospede: TFDQuery;
    QRY_updateHotEntraHospedeENT_STATUS: TStringField;
    QRY_insertHotCancelados: TFDQuery;
    QRY_updateApto: TFDQuery;
    QRY_updateAptoAPA_CODAPARTAMENTO: TIntegerField;
    QRY_updateAptoAPA_SITUACAO: TStringField;
    QRY_insertHotCanceladosCAN_CODIGO: TIntegerField;
    QRY_insertHotCanceladosCAN_DTACANCELARESERVA: TDateField;
    QRY_insertHotCanceladosCAN_HRACANCELARESERVA: TTimeField;
    QRY_insertHotCanceladosCAN_DTACANCELAHOSPEDAGEM: TDateField;
    QRY_insertHotCanceladosCAN_HRACANCELAHOSPEDAGEM: TTimeField;
    QRY_insertHotCanceladosCAN_USUARIOCANCELARESERVA: TStringField;
    QRY_insertHotCanceladosCAN_USUARIOCANCELAHOSPEDAGEM: TStringField;
    QRY_insertHotCanceladosCAN_MOTIVOCANCELARESERVA: TStringField;
    QRY_insertHotCanceladosCAN_MOTIVOCANCELAHOSPEDAGEM: TStringField;
    QRY_insertHotCanceladosCAN_CODHOSPEDAGEMRESERVA: TIntegerField;
    QRY_insertHotCanceladosCAN_CODAPARTAMENTO: TIntegerField;
    QRY_insertHotCanceladosCAN_CODHOSPEDE: TIntegerField;
    QRY_insertHotCanceladosCAN_STATUS: TStringField;
    QRY_pegaHospede: TFDQuery;
    QRY_pegaHospedeENT_CODHOSPEDE: TIntegerField;
    QRY_pegaHospedeENT_CODAPARTAMENTO: TIntegerField;
    QRY_pegaHospedeENT_STATUS: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_cancelaHospedagem: TF_cancelaHospedagem;

implementation

{$R *.dfm}

uses UDMRackApto, UDMConexao, UDMHospedes, UMsg, UFunctions, UCheckIn;

procedure TF_cancelaHospedagem.btnNaoClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TF_cancelaHospedagem.btnSimClick(Sender: TObject);
begin
  inherited;
{Cancela Hospedagem}
  if Situacao = 'OCUPADO' then begin
    try
      F_dmConexao.FDConn.StartTransaction;   {inicia a transação}



      {Pega o hospede do apto - não precisa criar o F_dmHospede pq já está criado no form anterior.}

//        with F_dmHospedes.QRY_FechaHospede do begin
//          Close;
//          SQL.Clear;
//          SQL.Add('select cl.cli_codigo, cl.cli_razao, cl.cli_fanta,eh.ent_codapartamento, eh.ent_codentrada,');
//          SQL.Add('eh.ent_dataentrada, eh.ent_horaentrada, eh.ent_qtd_diaria_extra, eh.ent_vlr_diaria_extra,');
//          SQL.Add('eh.ent_vlr_diaria_normal, eh.ent_qtd_diaria_normal from cliente cl');
//          SQL.Add('inner join hotentrahospede eh on (cl.cli_codigo = eh.ent_codhospede)');
//          SQL.Add('where eh.ent_codapartamento = :codApto and eh.ent_status = :status');
//          ParamByName('codApto').Value := CodApartamento;
//          ParamByName('status').Value  := 'OCUPADO';
//          Open();
//        end;

        with QRY_pegaHospede do begin
          Close;
          SQL.Clear;
          SQL.Add('select ent_codhospede, ent_codapartamento, ent_status from hotentrahospede');
          SQL.Add('where ent_codapartamento = :codApto and ent_status = :status');
          ParamByName('codApto').Value := CodApartamento;
          ParamByName('status').Value  := 'OCUPADO';
          Open();
        end;

        {Insere a operação na tabela HotCancelados}
        QRY_insertHotCancelados.Open();
        QRY_insertHotCancelados.Append;

        QRY_insertHotCanceladosCAN_DTACANCELAHOSPEDAGEM.AsDateTime   := Date;
        QRY_insertHotCanceladosCAN_HRACANCELAHOSPEDAGEM.AsDateTime   := Time;
        QRY_insertHotCanceladosCAN_USUARIOCANCELARESERVA.AsString    := '1'; {pegar o logado}
        QRY_insertHotCanceladosCAN_CODHOSPEDAGEMRESERVA.AsInteger    := StrToInt(CodEntrada);
        QRY_insertHotCanceladosCAN_CODAPARTAMENTO.AsInteger          := StrToInt(CodApartamento);
        QRY_insertHotCanceladosCAN_CODHOSPEDE.AsInteger              := QRY_pegaHospedeENT_CODHOSPEDE.AsInteger;
        QRY_insertHotCanceladosCAN_STATUS.AsString                   := 'HOSPEDAGEM';
        QRY_insertHotCanceladosCAN_MOTIVOCANCELAHOSPEDAGEM.AsString  := 'CANCELAMENTO DA HOSPEDAGEM';
        QRY_insertHotCancelados.Post;
        QRY_insertHotCancelados.ApplyUpdates(0);


      with QRY_updateApto do begin
        Close;
        SQL.Clear;
        SQL.Add('update HOTAPARTAMENTO set APA_SITUACAO = :situacao where (APA_CODAPARTAMENTO = :codApto) ');
        Params[0].Value         := 'LIVRE';
        Params[1].Value         := CodApartamento;
        ExecSQL;
      end;

      with QRY_updateHotEntraHospede do begin
        Close;
        SQL.Clear;
        SQL.Add('update HOTENTRAHOSPEDE set ENT_STATUS = :status where (ENT_CODENTRADA = :codEntrada) ');
        Params[0].Value         := 'CANCELADO';
        Params[1].Value         := CodEntrada;
        ExecSQL;
      end;


      F_dmConexao.FDConn.Commit;  {se tudo der certo, commita a transação}
      TF_msg.Mensagem('Hospedagem Cancelada com sucesso.','I',[mbOk]);

      OrdenaLista;
      F_checkIn.Close;
      Self.Close;

    except on e:Exception do
      begin
        F_dmConexao.FDConn.Rollback;
        TF_msg.Mensagem('Erro ao cancelar a Hospedagem do Apartamento.','I',[mbOk]);
        exit;
      end;
    end;
  End
  else begin
    TF_msg.Mensagem('Esse Apto não está Ocupado. Obrigado!','I',[mbOk]);
    Self.Close;
    exit;
  end;
end;

procedure TF_cancelaHospedagem.FormShow(Sender: TObject);
begin
  inherited;
  F_cancelaHospedagem.Caption := 'Cancelar Hospedagem: Apartamento Nº '+F_dmRackApto.QRY_rackAptoAPA_APARTAMENTO.AsString;
  lblInfo.Caption          := 'Deseja mesmo Cancelar a Hospedagem do Apartamento Nº '
                  +F_dmRackApto.QRY_rackAptoAPA_APARTAMENTO.AsString + '?';
end;

end.
