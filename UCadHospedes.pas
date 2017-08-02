unit UCadHospedes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBaseCadastro, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, RzEdit, RzDBEdit, RzDBBnEd,
  AdvMetroButton, AdvSmoothPanel, AdvSmoothExpanderPanel, Vcl.ComCtrls, RzDTP,
  RzDBDTP, AdvDateTimePicker, AdvDBDateTimePicker, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TF_cadHospede = class(TF_baseCadastro)
    pnlFisicoJuridico: TPanel;
    lblCodigo: TLabel;
    edtCodigo: TDBEdit;
    lblRazao: TLabel;
    edtRazao: TDBEdit;
    lblFantasia: TLabel;
    edtFantasia: TDBEdit;
    lblRegiao: TLabel;
    lblCidae: TLabel;
    edtCidade: TDBEdit;
    lblEstado: TLabel;
    edtEstado: TDBEdit;
    edtRegiao: TRzDBButtonEdit;
    DS_cadastroRegiao: TDataSource;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    lblCep: TLabel;
    edtCep: TDBEdit;
    lblEmail: TLabel;
    edtEmail: TDBEdit;
    lblFone: TLabel;
    edtFone: TDBEdit;
    lblCelular: TLabel;
    edtCelular: TDBEdit;
    lblDtaNascimento: TLabel;
    dtpNascimento: TRzDBDateTimePicker;
    lblEstadoCivil: TLabel;
    cbxEstadoCivil: TDBComboBox;
    lblNaturalidade: TLabel;
    edtNaturalidade: TDBEdit;
    lblNacionalidade: TLabel;
    edtNacionalidade: TDBEdit;
    lblProfissao: TLabel;
    cbxProfissao: TDBComboBox;
    lblLocalTrabalo: TLabel;
    edtLocalTrabalho: TDBEdit;
    lblParente1: TLabel;
    edtParente1: TDBEdit;
    lblNumero: TLabel;
    edtNumero: TDBEdit;
    lblFoneParente1: TLabel;
    edtFoneParente1: TDBEdit;
    lblParente2: TLabel;
    edtParente2: TDBEdit;
    lblFoneParente2: TLabel;
    edtFoneParente2: TDBEdit;
    lblSite: TLabel;
    edtSite: TDBEdit;
    lblObservacao: TLabel;
    mmoObservacao: TDBMemo;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtRegiaoExit(Sender: TObject);
    procedure cbxSexoEnter(Sender: TObject);
    procedure rdoJClick(Sender: TObject);
    procedure rdoFClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_cadHospede: TF_cadHospede;

implementation

{$R *.dfm}

uses UDMHospedes, UMsg, UDMConexao;


procedure TF_cadHospede.btnCancelarClick(Sender: TObject);
begin  //cancelar
  inherited;
  DS_cadastro.DataSet.Cancel;
end;

procedure TF_cadHospede.btnDeletarClick(Sender: TObject);
begin //deletar
  inherited;
  if MessageBox(Application.Handle, Pchar('Deseja mesmo apagar este Registro?'),
   Pchar('CIEC'), MB_YESNO + MB_ICONQUESTION) = IDYES then begin
    DS_cadastro.DataSet.Delete;
    F_dmHospedes.QRY_cadHospede.ApplyUpdates()
   end
   else begin
     abort;
   end;
end;

procedure TF_cadHospede.btnEditarClick(Sender: TObject);
begin   //editar
  inherited;
  DS_cadastro.DataSet.Edit;
end;

procedure TF_cadHospede.btnNovoClick(Sender: TObject);
begin //novo
  inherited;
  DS_cadastro.DataSet.Append;  //coloca a tabela cliente em edição
//  if edtCpf.CanFocus then
//    edtCpf.SetFocus;
end;

procedure TF_cadHospede.btnSalvarClick(Sender: TObject);
begin //salvar
  inherited;
try

  F_dmConexao.FDConn.StartTransaction;   //inicia a transação


//  if rdoF.Checked = True then begin
//    F_dmHospedes.QRY_cadHospedeCLI_TIPOFJ.AsString := 'F';
//  end
//  else begin
//    F_dmHospedes.QRY_cadHospedeCLI_TIPOFJ.AsString := 'J';
//  end;

  F_dmHospedes.QRY_cadHospedeCLI_SEGUIMENTO.Value         := 1;
  F_dmHospedes.QRY_cadHospedeCLI_CONTRIBUINTE.AsString    := '9';
  F_dmHospedes.QRY_cadHospedeCLI_PAIS.Value               := 1058;
  F_dmHospedes.QRY_cadHospedeCLI_COPCAIXA.Value           := 0;
  F_dmHospedes.QRY_cadHospedeCLI_ATIVO.AsString           := 'A';
  F_dmHospedes.QRY_cadHospedeCLI_CLIENTEENQUETE.Value     := 1;
  F_dmHospedes.QRY_cadHospedeCLI_GOVERNO.AsString         := 'N';
  F_dmHospedes.QRY_cadHospedeCLI_CONSFINAL.AsString       := '1';
  F_dmHospedes.QRY_cadHospedeCLI_TIPOEND.Value            := 1;
  F_dmHospedes.QRY_cadHospedeCLI_SETOR.Value              := 1;

   //gera chave (se for nulo ou menor que 0 gera. caso já exista,não gera)
   if (F_dmHospedes.QRY_cadHospedeCLI_CODIGO.IsNull) or (F_dmHospedes.QRY_cadHospedeCLI_CODIGO.AsInteger <=0) then begin

    if not F_dmConexao.GeraChave('CLIENTE',F_dmHospedes.QRY_cadHospedeCLI_CODIGO) then begin
      abort;
    end;
   end;

  //3º insere o cliente
  F_dmHospedes.QRY_cadHospedeCLI_CODIGO.Value := F_dmConexao.QRY_entidadeENT_CHAVE.Value;

  DS_cadastro.DataSet.Post;
  F_dmHospedes.QRY_cadHospede.ApplyUpdates();

  F_dmConexao.FDConn.Commit;     //se der certo, comita a transação

    except on e:Exception do begin
      F_dmHospedes.QRY_cadHospedeCLI_CODIGO.Clear; //limpa para poder pegar novamente
      F_dmConexao.FDConn.Rollback;   //se der erro, aborta a transação
      showMessage('Erro '+e.Message);
    end;
  end;
end;

procedure TF_cadHospede.cbxSexoEnter(Sender: TObject);
begin
  inherited;
//onEnter do TDBComboBox
  if Length((Sender as TDBComboBox).Text) = 0 then begin
    SendMessage((Sender as TDBComboBox).Handle, CB_SHOWDROPDOWN, 1, 0);
  end;
end;

procedure TF_cadHospede.edtRegiaoExit(Sender: TObject);
begin //ao sair do componente testa se a região está preenchida
  inherited;
 if edtRegiao.Text = '' then begin
  TF_msg.Mensagem('Código da Cidade não pode ficar em branco','I',[mbOk]);
  edtRegiao.SetFocus;
  abort;
 end
 else begin
    with F_dmHospedes.QRY_cadHospedeRegiao do begin
      Close;
      SQL.Clear;
      SQL.Add('select reg_codigo, reg_nome, reg_estado from regiao where reg_codigo = :reg_codigo');
      ParamByName('reg_codigo').Value := StrToInt(edtRegiao.Text);
      Open();
    end;
    if F_dmHospedes.QRY_cadHospedeRegiao.RecordCount <= 0 then begin
      TF_msg.Mensagem('Não foram encontradas cidade com esse codigo!', 'I', [mbOk]);
      edtRegiao.Clear;
      edtRegiao.SetFocus;
      abort;
    end
    else begin
      edtCidade.Text := F_dmHospedes.QRY_cadHospedeRegiaoREG_NOME.AsString;
      edtEstado.Text := F_dmHospedes.QRY_cadHospedeRegiaoREG_ESTADO.AsString;
    end;
  end;
end;

procedure TF_cadHospede.FormShow(Sender: TObject);
//var img : String;
begin   //onShow - cria o dmHospedes
  inherited;

//  img := ExtractFilePath(Application.ExeName) + '\imgs\backGround\bg1.png';
//  imgBackground.Picture.LoadFromFile(img);

  if F_dmHospedes = nil then begin
    Application.CreateForm(TF_dmHospedes, F_dmHospedes);
  end;
  F_dmHospedes.QRY_cadHospede.Open(); //abre a tabela cadHospedes
  F_dmHospedes.QRY_cadHospedeRegiao.Open(); //abre a tabela cadRegiao
end;

procedure TF_cadHospede.rdoFClick(Sender: TObject);
begin
  inherited;
  //Muda para Física
//  lblCpf.Caption              := 'CPF';
//  lblIeRg.Caption             := 'RG';
//  cbxSexo.Enabled             := True;
  lblRazao.Caption            := 'NOME';
  lblFantasia.Caption         := 'NOME POPULAR';
  lblDtaNascimento.Caption    := 'DTA. NASCIMENTO';
  cbxEstadoCivil.Enabled      := True;
  edtNaturalidade.Enabled     := True;
  cbxProfissao.Enabled        := True;
  edtLocalTrabalho.Enabled    := True;
  lblParente1.Caption         := 'PARENTE 1 / PAI';
  lblFoneParente1.Caption     := 'FONE PARENTE 1';
  lblParente2.Caption         := 'PARENTE 2 / MÃE';
  lblFoneParente2.Caption     := 'FONE PARENTE 2';
//  if edtCpf.CanFocus then
//    edtCpf.SetFocus;
end;

procedure TF_cadHospede.rdoJClick(Sender: TObject);
begin
  inherited;
  //Muda a tela para Jurídica
//  lblCpf.Caption              := 'CNPJ';
//  lblIeRg.Caption             := 'IE';
//  cbxSexo.Enabled             := False;
  lblRazao.Caption            := 'RAZÃO SOCIAL';
  lblFantasia.Caption         := 'NOME FANTASIA';
  lblDtaNascimento.Caption    := 'DTA. FUNDAÇÃO';
  cbxEstadoCivil.Enabled      := False;
  edtNaturalidade.Enabled     := False;
  cbxProfissao.Enabled        := False;
  edtLocalTrabalho.Enabled    := False;
  lblParente1.Caption         := 'NOME CONTATO 1';
  lblFoneParente1.Caption     := 'FONE CONTATO 1';
  lblParente2.Caption         := 'NOME CONTATO 2';
  lblFoneParente2.Caption     := 'FONE CONTATO 2';
//  if edtCpf.CanFocus then
//    edtCpf.SetFocus;
end;

end.
