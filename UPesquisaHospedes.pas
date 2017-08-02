unit UPesquisaHospedes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisa, Data.DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TF_pesquisaHospede = class(TF_basePesquisa)
    DS_conCadHospedes: TDataSource;
    imgBackground: TImage;
    btnCadHospede: TSpeedButton;
    lblVoltarPesquisa: TLabel;
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBG_dadosKeyPress(Sender: TObject; var Key: Char);
    procedure DBG_dadosDblClick(Sender: TObject);
    procedure btnCadHospedeClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pesquisaHospede: TF_pesquisaHospede;

implementation

{$R *.dfm}

uses UDMHospedes, UMsg, UEntraHospede, UCadHospedesFJ, UFunctions, UFJ,
  UEfetivaReserva, UReservaApto;

procedure TF_pesquisaHospede.btnCadHospedeClick(Sender: TObject);
begin
  inherited;
  CriaFormDestroy(TF_fj, F_fj);
end;

procedure TF_pesquisaHospede.btnSelecionarClick(Sender: TObject);
var cpf_cnpj: string;
begin
  inherited;
  {Dados vai para entra hospedes}
  if F_entraHospede <> nil then begin

    {aqui joga na grid dos hospedes que serao adicionados à hospedagem}
    if F_entraHospede.addHospede = 'AD' then begin
      F_dmHospedes.QRY_EntraHospede2.Insert;
      F_dmHospedes.QRY_EntraHospede2ENT_CODHOSPEDE2.AsInteger := F_dmHospedes.QRY_conCadHospedesCLI_CODIGO.AsInteger;
      F_dmHospedes.QRY_EntraHospede2ENT_RAZAO2.AsString       := F_dmHospedes.QRY_conCadHospedesCLI_RAZAO.AsString;
      F_dmHospedes.QRY_EntraHospede2.Post;
      Self.Close;
      exit;
    end
    else begin
      F_entraHospede.edtCodCli.Value     := F_dmHospedes.QRY_conCadHospedesCLI_CODIGO.AsInteger;
      F_entraHospede.edtCliente.Text     := F_dmHospedes.QRY_conCadHospedesCLI_RAZAO.AsString;
      F_entraHospede.edtCliente.SelStart := Length(F_entraHospede.edtCliente.Text); //faz o cursor ir para o final do edit
      Self.Close;
      exit;   {se nao tiver, dá access violation no entra hospedes}
    end;


  end;

  {Dados vai para entra reservaApto}
  if F_reservaApto <> nil then begin
    F_reservaApto.edtCodCli.Value     := F_dmHospedes.QRY_conCadHospedesCLI_CODIGO.AsInteger;
    F_reservaApto.edtCliente.Text     := F_dmHospedes.QRY_conCadHospedesCLI_RAZAO.AsString;
    F_reservaApto.edtCliente.SelStart := Length(F_reservaApto.edtCliente.Text); //faz o cursor ir para o final do edit
    Self.Close;
    exit;   {se nao tiver, dá access violation no entra hospedes}
  end;

  F_dmHospedes.QRY_cadHospede.Close;
  F_dmHospedes.QRY_cadHospede.Params[0].AsInteger := F_dmHospedes.QRY_conCadHospedesCLI_CODIGO.AsInteger;
  F_dmHospedes.QRY_cadHospede.Open();

  cpf_cnpj := F_dmHospedes.QRY_conCadHospedesCLI_CNPJ.AsString;   {variável}

  {Dados vai para cadHospedesFJ}
  if Length(cpf_cnpj) <= 14 then begin
    F_cadHospedesFJ.pg.ActivePage := F_cadHospedesFJ.tbsFisica;
    F_cadHospedesFJ.Height := 558;
    F_cadHospedesFJ.edtRegiao.Text := IntToStr(F_dmHospedes.QRY_conCadHospedesCLI_REGIAO.AsInteger);
    F_cadHospedesFJ.edtCPF.SetFocus;
    Self.Close;
  end
  else begin
    F_cadHospedesFJ.pg.ActivePage := F_cadHospedesFJ.tbsJuridica;
    F_cadHospedesFJ.Height := 558;
    F_cadHospedesFJ.edtRegiaoJ.Text := IntToStr(F_dmHospedes.QRY_conCadHospedesCLI_REGIAO.AsInteger);
    F_cadHospedesFJ.edtCNPJ.SetFocus;
    Self.Close;
  end;
end;

procedure TF_pesquisaHospede.DBG_dadosDblClick(Sender: TObject);
begin
  inherited;
  btnSelecionar.Click;
end;

procedure TF_pesquisaHospede.DBG_dadosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then begin
    btnSelecionar.Click;
  end;
end;

procedure TF_pesquisaHospede.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//Fazendo a busca - consulta (ao precionar enter)
  if key = #13 then begin
    if Length(edtPesquisa.Text) = 0 then begin
      TF_msg.Mensagem('Campo Hóspede não pode ficar em branco. Favor, digite algo para ser pesquisado!','I',[mbOk]);
      edtPesquisa.Clear;
      edtPesquisa.SetFocus;
      exit;
    end
    else begin
        with F_dmHospedes.QRY_conCadHospedes do begin
          Close;
          SQL.Clear;
          SQL.Add('select CLI_CODIGO, CLI_RAZAO, CLI_FANTA, CLI_ENDERECO, CLI_COMPLEM, CLI_BAIRRO,');
          SQL.Add('CLI_CIDADE, CLI_CEP, CLI_EMAIL, CLI_FONES,');
          SQL.Add('CLI_CELULAR2, CLI_REGIAO, CLI_TIPOFJ, CLI_IERG, CLI_NACISM, CLI_ESTCIVIL, CLI_NATURALIDADE,');
          SQL.Add('CLI_NACIONALIDADE, CLI_PROFISSAO, CLI_LOCALTRAB, CLI_PARENTE1, CLI_PARENTE2, ');
          SQL.Add('CLI_FONEPAR1, CLI_FONEPAR2, CLI_CNPJ, CLI_OBSERVACAO, CLI_SETOR, CLI_NUMERO, CLI_PAIS,');
          SQL.Add('CLI_CONSFINAL, CLI_SEGUIMENTO, CLI_CLIENTEENQUETE,  CLI_GOVERNO, CLI_SEXO, CLI_ESTADO from cliente');
          SQL.Add('where cli_razao like :pesquisa');

          ParamByName('pesquisa').Value := edtPesquisa.Text + '%';

          Open();

          if RecordCount = 0 then begin
          TF_msg.Mensagem('Cliente não encontrado.','I',[mbOk]);
          edtPesquisa.Clear;
          exit;
          end;
        end; //fim do width
      end;
    DBG_dados.SetFocus;
  end; //fim do key press
end;

procedure TF_pesquisaHospede.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F1 then begin
    edtPesquisa.Clear;
    edtPesquisa.SetFocus;
  end;
end;

procedure TF_pesquisaHospede.FormShow(Sender: TObject);
begin
  inherited;
  F_dmHospedes.QRY_conCadHospedes.SQL.Clear;
end;

end.

