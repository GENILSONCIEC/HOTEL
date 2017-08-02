unit UCadHospedesJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBaseCadastro, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDBEdit, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzBtnEdt, cxButtonEdit, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar, ACBrBase,
  ACBrValidador;

type
  TF_cadHospedeJ = class(TF_baseCadastro)
    imgBack: TImage;
    edtCNPJ: TcxDBMaskEdit;
    lblCJPJ: TLabel;
    lblCod: TLabel;
    lblIE: TLabel;
    lblRazaoSocial: TLabel;
    lblFantasia: TLabel;
    edtCodigo: TcxDBTextEdit;
    edtIE: TcxDBTextEdit;
    edtRazaoSocial: TcxDBTextEdit;
    edtFantasia: TcxDBTextEdit;
    lblRegiao: TLabel;
    lblCidade: TLabel;
    lblUF: TLabel;
    lblEndereco: TLabel;
    lblBairro: TLabel;
    edtRegiao: TcxButtonEdit;
    ACM_cadHospedeJ: TActionManager;
    actRegiaoJ: TAction;
    edtCidade: TcxDBTextEdit;
    edtUF: TcxDBTextEdit;
    edtEndereco: TcxDBTextEdit;
    edtBairro: TcxDBTextEdit;
    lblNumero: TLabel;
    edtNumero: TcxDBTextEdit;
    edtCep: TcxDBMaskEdit;
    lblCep: TLabel;
    lblEmail: TLabel;
    lblFone: TLabel;
    lblCelular: TLabel;
    edtEmail: TcxDBTextEdit;
    edtFone: TcxDBMaskEdit;
    edtCelular: TcxDBMaskEdit;
    lblDtaFundacao: TLabel;
    lblContato1: TLabel;
    lblFoneContato1: TLabel;
    lblContato2: TLabel;
    lblFone2: TLabel;
    edtContato1: TcxDBTextEdit;
    edtFoneC1: TcxDBMaskEdit;
    edtContato2: TcxDBTextEdit;
    edtFoneC2: TcxDBMaskEdit;
    lblSite: TLabel;
    lblObs: TLabel;
    edtSite: TcxDBTextEdit;
    edtObs: TcxDBTextEdit;
    dtaFundacao: TcxDBDateEdit;
    ACBrValidador: TACBrValidador;
    procedure actRegiaoJExecute(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var CodCliente: Integer;
  end;

var
  F_cadHospedeJ: TF_cadHospedeJ;

implementation

{$R *.dfm}

uses UDMHospedes, UDMConexao, UMsg, UFunctions, UPesquisaHospedes;

procedure TF_cadHospedeJ.actRegiaoJExecute(Sender: TObject);
begin {Busca região Jurídica}
  inherited;
  ShowMessage('região jurídica');
end;

procedure TF_cadHospedeJ.btnCancelarClick(Sender: TObject);
begin
  inherited;
  DS_cadastro.DataSet.Cancel;
  if edtCNPJ.CanFocus then
    edtCNPJ.SetFocus;
end;

procedure TF_cadHospedeJ.btnDeletarClick(Sender: TObject);
begin {deletar}
  inherited;

end;

procedure TF_cadHospedeJ.btnEditarClick(Sender: TObject);
begin {editar}
  inherited;
  DS_cadastro.DataSet.Edit;
end;

procedure TF_cadHospedeJ.btnLocalizarClick(Sender: TObject);
begin  {localizar}
  inherited;
  CriaFormDestroy(TF_pesquisaHospede, F_pesquisaHospede);
end;

procedure TF_cadHospedeJ.btnNovoClick(Sender: TObject);
begin  {novo}
  inherited;
  DS_cadastro.DataSet.Append;
  if edtCNPJ.CanFocus then
    edtCNPJ.SetFocus;
end;

procedure TF_cadHospedeJ.btnSalvarClick(Sender: TObject);
begin{salvando o cliente}
  inherited;
  try
  F_dmConexao.FDConn.StartTransaction;

  {1º passa os dados}
  F_dmHospedes.QRY_cadHospedeCLI_REGIAO.AsInteger := StrToInt(edtRegiao.Text);
  F_dmHospedes.QRY_cadHospedeCLI_SEGUIMENTO.AsInteger     := 1;
  F_dmHospedes.QRY_cadHospedeCLI_CONTRIBUINTE.AsString    := '1';
  F_dmHospedes.QRY_cadHospedeCLI_PAIS.AsInteger           := 1058;
  F_dmHospedes.QRY_cadHospedeCLI_COPCAIXA.AsInteger       := 0;
  F_dmHospedes.QRY_cadHospedeCLI_ATIVO.AsString           := 'A';
  F_dmHospedes.QRY_cadHospedeCLI_CLIENTEENQUETE.AsInteger := 1;
  F_dmHospedes.QRY_cadHospedeCLI_GOVERNO.AsString         := 'N';
  F_dmHospedes.QRY_cadHospedeCLI_CONSFINAL.AsString       := '1';
  F_dmHospedes.QRY_cadHospedeCLI_TIPOEND.AsInteger        := 1;
  F_dmHospedes.QRY_cadHospedeCLI_SETOR.AsInteger          := 1;
  F_dmHospedes.QRY_cadHospedeCLI_TIPOFJ.AsString          := 'J';

  {2º gera a chave}
  if F_dmHospedes.QRY_cadHospede.State in [dsInsert] then begin
    if F_dmHospedes.QRY_cadHospedeCLI_CODIGO.AsInteger < 1 then
      begin
      if not F_dmConexao.GeraChave('CLIENTE', F_dmHospedes.QRY_cadHospedeCLI_CODIGO) then
        begin
          abort;
        end;
    end;

    {3º insere os dados - está aqui dentro caso seja edit, não passa aqui novamente. Só se for insert}
    F_dmHospedes.QRY_cadHospedeCLI_CODIGO.AsInteger := F_dmConexao.QRY_entidadeENT_CHAVE.Value;
  end;

  CodCliente := F_dmHospedes.QRY_cadHospedeCLI_CODIGO.AsInteger; {salvo o codigo para mostrar o cliente na tela.}

  DS_cadastro.DataSet.Post;
  F_dmHospedes.QRY_cadHospede.ApplyUpdates();
  F_dmConexao.FDConn.Commit;

  except on e:Exception do begin
      F_dmHospedes.QRY_cadHospedeCLI_CODIGO.Clear;
      F_dmConexao.FDConn.Rollback;
      {showMessage('Erro '+e.Message);}
      TF_msg.Mensagem('Não foi possível cadastrar o Hóspede. Verifique todos os campos e tente novamente','I',[mbOk]);
      exit;
    end;
  end;

  {Mostra o hóspede na tela}
  F_dmHospedes.QRY_cadHospede.Close;
  F_dmHospedes.QRY_cadHospede.Params[0].AsInteger := CodCliente;
  F_dmHospedes.QRY_cadHospede.Open();
end;

procedure TF_cadHospedeJ.edtCNPJExit(Sender: TObject);
begin
  inherited;
  ACBrValidador.Documento := edtCNPJ.Text;
  if not ACBrValidador.Validar then
  begin
    TF_msg.Mensagem('CNPJ inválido. Favor, digite um CNPJ válido.','I',[mbOk]);
    TcxDBMaskEdit(Sender).SetFocus;
    abort;
  end
end;

procedure TF_cadHospedeJ.FormShow(Sender: TObject);
begin
  inherited;
  if F_dmHospedes = nil then begin
    Application.CreateForm(TF_dmHospedes, F_dmHospedes);
  end;
  F_dmHospedes.QRY_cadHospede.Open();
  F_dmHospedes.QRY_cadHospedeRegiao.Open();

  F_dmHospedes.QRY_cadHospede.Close;
  F_dmHospedes.QRY_cadHospede.Params[0].AsInteger := 4114;
  F_dmHospedes.QRY_cadHospede.Open();
end;

end.
