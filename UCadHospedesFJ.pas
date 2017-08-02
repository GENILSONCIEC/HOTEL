unit UCadHospedesFJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBaseCadastro, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, cxPC, cxContainer, cxEdit, Vcl.StdCtrls,
  dxGDIPlusClasses, cxButtonEdit, cxDropDownEdit, cxDBEdit, cxTextEdit,
  cxMaskEdit, cxCalendar, ACBrBase, ACBrValidador, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinLilian, dxSkinOffice2007Black,
  dxSkinOffice2010Black, dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue;

type
  TF_cadHospedesFJ = class(TF_baseCadastro)
    pg: TcxPageControl;
    tbsFisica: TcxTabSheet;
    tbsJuridica: TcxTabSheet;
    dtaNascimento: TcxDBDateEdit;
    edtApelido: TcxDBTextEdit;
    edtBairro: TcxDBTextEdit;
    edtCelular: TcxDBMaskEdit;
    edtCep: TcxDBMaskEdit;
    edtCidade: TcxDBTextEdit;
    edtCodigo: TcxDBTextEdit;
    edtContato1: TcxDBTextEdit;
    edtContato2: TcxDBTextEdit;
    edtCPF: TcxDBMaskEdit;
    edtEmail: TcxDBTextEdit;
    edtEndereco: TcxDBTextEdit;
    edtEstCivil: TcxDBComboBox;
    edtFone: TcxDBMaskEdit;
    edtFoneC1: TcxDBMaskEdit;
    edtFoneC2: TcxDBMaskEdit;
    edtLocTrabalho: TcxDBTextEdit;
    edtNacionalidade: TcxDBTextEdit;
    edtNaturalidade: TcxDBTextEdit;
    edtNome: TcxDBTextEdit;
    edtNumero: TcxDBTextEdit;
    edtObs: TcxDBTextEdit;
    edtProfissao: TcxDBComboBox;
    edtRegiao: TcxButtonEdit;
    edtRG: TcxDBTextEdit;
    edtSexo: TcxDBComboBox;
    edtSite: TcxDBTextEdit;
    edtUF: TcxDBTextEdit;
    imgBack: TImage;
    lblApelido: TLabel;
    lblBairro: TLabel;
    lblCelular: TLabel;
    lblCep: TLabel;
    lblCidade: TLabel;
    lblCod: TLabel;
    lblContato1: TLabel;
    lblContato2: TLabel;
    lblCPF: TLabel;
    lblDtaNascimento: TLabel;
    lblEmail: TLabel;
    lblEndereco: TLabel;
    lblEstadoCivil: TLabel;
    lblFone: TLabel;
    lblFoneContato2: TLabel;
    lblFoneContato1: TLabel;
    lblLocTrabalho: TLabel;
    lblNacionalidade: TLabel;
    lblNaturalidade: TLabel;
    lblNome: TLabel;
    lblNumero: TLabel;
    lblObs: TLabel;
    lblProfissao: TLabel;
    lblRegiao: TLabel;
    lblRG: TLabel;
    lblSexo: TLabel;
    lblSite: TLabel;
    lblUF: TLabel;
    ACM_cadHospedeF: TActionManager;
    actRegiaoF: TAction;
    ACBrValidadorCPF: TACBrValidador;
    pnlJ: TPanel;
    dtaFundacao: TcxDBDateEdit;
    edtBairroJ: TcxDBTextEdit;
    edtCelularJ: TcxDBMaskEdit;
    edtCepJ: TcxDBMaskEdit;
    edtCidadeJ: TcxDBTextEdit;
    edtCNPJ: TcxDBMaskEdit;
    edtCodigoJ: TcxDBTextEdit;
    edtContato1J: TcxDBTextEdit;
    edtContato2J: TcxDBTextEdit;
    edtEmailJ: TcxDBTextEdit;
    edtEnderecoJ: TcxDBTextEdit;
    edtFantasia: TcxDBTextEdit;
    edtFoneJ: TcxDBMaskEdit;
    edtFoneC1J: TcxDBMaskEdit;
    edtFoneC2J: TcxDBMaskEdit;
    edtIE: TcxDBTextEdit;
    edtNumeroJ: TcxDBTextEdit;
    edtObsJ: TcxDBTextEdit;
    edtRazaoSocial: TcxDBTextEdit;
    edtRegiaoJ: TcxButtonEdit;
    edtSiteJ: TcxDBTextEdit;
    edtUFJ: TcxDBTextEdit;
    Image1: TImage;
    lblBairroJ: TLabel;
    lblCelularJ: TLabel;
    lblCepJ: TLabel;
    lblCidadeJ: TLabel;
    lblCJPJ: TLabel;
    lblCodJ: TLabel;
    lblContato1J: TLabel;
    lblContato2J: TLabel;
    lblDtaFundacao: TLabel;
    lblEmailJ: TLabel;
    lblEnderecoJ: TLabel;
    lblFantasia: TLabel;
    lblFoneJ: TLabel;
    lbllblFoneContato2J: TLabel;
    lblFoneContato1J: TLabel;
    lblIE: TLabel;
    lblNumeroJ: TLabel;
    lblObsJ: TLabel;
    lblRazaoSocial: TLabel;
    lblRegiaoJ: TLabel;
    lblSiteJ: TLabel;
    lblUFJ: TLabel;
    ACM_cadHospedeJ: TActionManager;
    actRegiaoJ: TAction;
    QRY_verificaCliente: TFDQuery;
    QRY_verificaClienteCLI_CODIGO: TIntegerField;
    QRY_verificaClienteCLI_CNPJ: TStringField;
    ACBrValidadorCNPJ: TACBrValidador;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtRegiaoExit(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtRegiaoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSexoEnter(Sender: TObject);
    procedure edtRegiaoJExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    var tipoFJ: String;
    codCliente: Integer;
  end;

var
  F_cadHospedesFJ: TF_cadHospedesFJ;

implementation

{$R *.dfm}

uses UDMConexao, UDMHospedes, UMsg, UFJ, UPesquisaHospedes, UFunctions,
  UPesquisaRegiao, UEntraHospede, UReservaApto;

procedure TF_cadHospedesFJ.btnCancelarClick(Sender: TObject);
begin {cancelar}
  inherited;
  DS_cadastro.DataSet.Cancel;
end;

procedure TF_cadHospedesFJ.btnDeletarClick(Sender: TObject);
begin {deletar}
  inherited;

end;

procedure TF_cadHospedesFJ.btnEditarClick(Sender: TObject);
begin {editar}
  inherited;
  DS_cadastro.DataSet.Edit;
end;

procedure TF_cadHospedesFJ.btnLocalizarClick(Sender: TObject);
begin {localizar}
  inherited;
  CriaFormDestroy(TF_pesquisaHospede, F_pesquisaHospede);
end;

procedure TF_cadHospedesFJ.btnNovoClick(Sender: TObject);
begin {novo}
  inherited;
    DS_cadastro.DataSet.Append;

    if tipoFJ = 'F' then begin
      pg.ActivePage := tbsFisica;
      Height := 558;
      if edtCPF.CanFocus then begin
        edtCPF.SetFocus;
      end;
    end
    else begin
      pg.ActivePage := tbsJuridica;
      Height := 558;
      if edtCNPJ.CanFocus then begin
        edtCNPJ.SetFocus;
      end;
    end;
end;

procedure TF_cadHospedesFJ.btnSalvarClick(Sender: TObject);
begin {salvar}
  inherited;
  if tipoFJ = 'F' then begin
    try
    F_dmConexao.FDConn.StartTransaction;

    {1º passa os dados}
    F_dmHospedes.QRY_cadHospedeCLI_REGIAO.AsInteger := StrToInt(edtRegiao.Text);
    F_dmHospedes.QRY_cadHospedeCLI_SEGUIMENTO.AsInteger     := 1;
    F_dmHospedes.QRY_cadHospedeCLI_CONTRIBUINTE.AsString    := '9';
    F_dmHospedes.QRY_cadHospedeCLI_PAIS.AsInteger           := 1058;
    F_dmHospedes.QRY_cadHospedeCLI_COPCAIXA.AsInteger       := 0;
    F_dmHospedes.QRY_cadHospedeCLI_ATIVO.AsString           := 'A';
    F_dmHospedes.QRY_cadHospedeCLI_CLIENTEENQUETE.AsInteger := 1;
    F_dmHospedes.QRY_cadHospedeCLI_GOVERNO.AsString         := 'N';
    F_dmHospedes.QRY_cadHospedeCLI_CONSFINAL.AsString       := '1';
    F_dmHospedes.QRY_cadHospedeCLI_TIPOEND.AsInteger        := 1;
    F_dmHospedes.QRY_cadHospedeCLI_SETOR.AsInteger          := 1;
    F_dmHospedes.QRY_cadHospedeCLI_TIPOFJ.AsString          := 'F';

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
  end
  else begin
    try
    F_dmConexao.FDConn.StartTransaction;

    {1º passa os dados}
    F_dmHospedes.QRY_cadHospedeCLI_REGIAO.AsInteger := StrToInt(edtRegiaoJ.Text);
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

  {verifica se o hóspede foi cadastrado pelo entraHospede - manda para a tela F_entraHospede}
  if F_entraHospede <> nil then begin
   if tipoFJ = 'F' then begin
      F_entraHospede.edtCodCli.Text  := edtCodigo.Text;
      F_entraHospede.edtCliente.Text := edtNome.Text;

      {fecha as telas abertas}
      F_fj.Close;
      F_pesquisaHospede.Close;
      Self.Close;
      exit;
     end
     else begin
      F_entraHospede.edtCodCli.Text  := edtCodigoJ.Text;
      F_entraHospede.edtCliente.Text := edtRazaoSocial.Text;

      {fecha as telas abertas}
      F_fj.Close;
      F_pesquisaHospede.Close;
      Self.Close;
      exit;
     end;
  end;

  {verifica se o hóspede foi cadastrado pelo reservaApto - manda para a tela F_reservaApto}
  if F_reservaApto <> nil then begin
   if tipoFJ = 'F' then begin
      F_reservaApto.edtCodCli.Text  := edtCodigo.Text;
      F_reservaApto.edtCliente.Text := edtNome.Text;

      {fecha as telas abertas}
      F_fj.Close;
      F_pesquisaHospede.Close;
      Self.Close;
      exit;
     end
     else begin
      F_reservaApto.edtCodCli.Text  := edtCodigoJ.Text;
      F_reservaApto.edtCliente.Text := edtRazaoSocial.Text;

      {fecha as telas abertas}
      F_fj.Close;
      F_pesquisaHospede.Close;
      Self.Close;
      exit;
     end;
  end;
end;

procedure TF_cadHospedesFJ.edtCNPJExit(Sender: TObject);
begin {saindo do cnpj}
  inherited;
  if F_dmHospedes.QRY_cadHospede.State in [dsInsert, dsEdit] then begin
    ACBrValidadorCNPJ.Documento := edtCNPJ.Text;
     if not ACBrValidadorCNPJ.Validar then
     begin
      TF_msg.Mensagem('CNPJ inválido. Favor, digite um número válido','I',[mbOk]);
      TcxDBMaskEdit(Sender).SetFocus;
      exit;
     end;
  end;

   {verifica se já existe o cliente físico}
   if F_dmHospedes.QRY_cadHospede.State in [dsInsert] then begin
     QRY_verificaCliente.Close;
     QRY_verificaCliente.Params[0].Value := edtCNPJ.Text;
     QRY_verificaCliente.Open();

     if QRY_verificaCliente.RecordCount > 0 then begin
       TF_msg.Mensagem('Já existe um cliente com esse CNPJ. Favor, informe outro CNPJ.','I',[mbOk]);
       TcxDBMaskEdit(Sender).SetFocus;
       exit;
     end;
   end;
end;

procedure TF_cadHospedesFJ.edtCPFExit(Sender: TObject);
begin  {saindo do cpf}
  inherited;
  if F_dmHospedes.QRY_cadHospede.State in [dsInsert, dsEdit] then begin
    ACBrValidadorCPF.Documento := edtCPF.Text;
     if not ACBrValidadorCPF.Validar then
     begin
      TF_msg.Mensagem('CPF inválido! Favor, digite um número válido.','I',[mbOk]);
      TcxDBMaskEdit(Sender).SetFocus;
      exit;
     end;
  end;

   {verifica se já existe o cliente físico}
   if F_dmHospedes.QRY_cadHospede.State in [dsInsert] then begin
     QRY_verificaCliente.Close;
     QRY_verificaCliente.Params[0].Value := edtCPF.Text;
     QRY_verificaCliente.Open();

     if QRY_verificaCliente.RecordCount > 0 then begin
       TF_msg.Mensagem('Já existe um cliente com esse CPF. Favor, informe outro CPF.','I',[mbOk]);
       TcxDBMaskEdit(Sender).SetFocus;
       exit;
     end;
   end;
end;

procedure TF_cadHospedesFJ.edtRegiaoExit(Sender: TObject);
begin
  inherited;
  {Saindo do regiaoFisica}
  if not (ENumerico(edtRegiao.Text)) then begin
    TF_msg.Mensagem('Campo aceita apenas valores numéricos Positivos. Favor, digita um número válido.','I',[mbOk]);
    TcxButtonEdit(Sender).SetFocus;
    exit;
  end;

  F_dmHospedes.QRY_cadHospedeRegiao.Close;
  F_dmHospedes.QRY_cadHospedeRegiao.Params[0].AsInteger := StrToInt(edtRegiao.Text);
  F_dmHospedes.QRY_cadHospedeRegiao.Open();

  if F_dmHospedes.QRY_cadHospedeRegiao.RecordCount > 0 then begin
    edtCidade.Text := F_dmHospedes.QRY_cadHospedeRegiaoREG_NOME.AsString;
    edtUF.Text     := F_dmHospedes.QRY_cadHospedeRegiaoREG_ESTADO.AsString;
  end
  else begin
    TF_msg.Mensagem('Cidade não encontrada.','I',[mbOk]);
    TcxButtonEdit(Sender).SetFocus;
    exit;
  end;

end;

procedure TF_cadHospedesFJ.edtRegiaoJExit(Sender: TObject);
begin
  inherited;
  {Saindo do regiaoFisica J}
  if not (ENumerico(edtRegiaoJ.Text)) then begin
    TF_msg.Mensagem('Campo aceita apenas valores numéricos Positivos. Favor, digita um número válido.','I',[mbOk]);
    TcxButtonEdit(Sender).SetFocus;
    exit;
  end;

  F_dmHospedes.QRY_cadHospedeRegiao.Close;
  F_dmHospedes.QRY_cadHospedeRegiao.Params[0].AsInteger := StrToInt(edtRegiaoJ.Text);
  F_dmHospedes.QRY_cadHospedeRegiao.Open();

  if F_dmHospedes.QRY_cadHospedeRegiao.RecordCount > 0 then begin
    edtCidadeJ.Text := F_dmHospedes.QRY_cadHospedeRegiaoREG_NOME.AsString;
    edtUFJ.Text     := F_dmHospedes.QRY_cadHospedeRegiaoREG_ESTADO.AsString;
  end
  else begin
    TF_msg.Mensagem('Cidade não encontrada.','I',[mbOk]);
    TcxButtonEdit(Sender).SetFocus;
    exit;
  end;
end;

procedure TF_cadHospedesFJ.edtRegiaoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin {regiao física}
  inherited;
  CriaFormDestroy(TF_pesquisaRegiao, F_pesquisaRegiao);
end;

procedure TF_cadHospedesFJ.edtSexoEnter(Sender: TObject);
begin
  inherited;
  if Length((Sender as TcxDBComboBox).Text) = 0 then begin
//    SendMessage((Sender as TcxDBComboBox).Handle, CB_SHOWDROPDOWN, 1, 0);
    TcxDBComboBox(Sender).DroppedDown := True;
  end;
end;

procedure TF_cadHospedesFJ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  {se o reserva também tivesse que imprimir o relatorio, daria erros. como ele nao precisa, não da erros.}
  {só coloca nil se o cadastro nao foi feito pelo entra hospede}
  if F_entraHospede = nil then begin
    FreeAndNil(F_dmHospedes);
  end;
end;

procedure TF_cadHospedesFJ.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then begin
    btnNovo.Click;
  end;

  if key = VK_F3 then begin
    btnEditar.Click;
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

  if key = VK_F7 then begin
    btnLocalizar.Click;
  end;
end;

procedure TF_cadHospedesFJ.FormShow(Sender: TObject);
begin
  inherited;

  pg.HideTabs := True; {oculta todas}
  tipoFJ := F_fj.conFJ; {passa o tipo que vem do F_fj}
  if tipoFJ = 'F' then begin
    pg.ActivePage := tbsFisica;
    Height := 558;
  end
  else begin
    pg.ActivePage := tbsJuridica;
    Height := 558;
  end;

  if F_dmHospedes = nil then begin
    Application.CreateForm(TF_dmHospedes, F_dmHospedes);
  end;
  F_dmHospedes.QRY_cadHospede.Open();
  F_dmHospedes.QRY_cadHospedeRegiao.Open();

end;

end.
