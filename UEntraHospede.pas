unit UEntraHospede;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons,

  //units declaradas
  UFunctions, Vcl.Samples.Spin, Vcl.ComCtrls, DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxGDIPlusClasses,
  Vcl.DBCtrls, Vcl.Mask, frxClass, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxCurrencyEdit, dxCore, cxDateUtils,
  cxMaskEdit, cxDropDownEdit, cxCalendar, frxDBSet, UDMFilial, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinLilian, dxSkinOffice2007Black,
  dxSkinOffice2010Black, dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue,
  Vcl.Grids, Vcl.DBGrids, cxDBEdit, JvExComCtrls, JvDateTimePicker,
  JvDBDateTimePicker, RzDTP, RzDBDTP, cxSpinEdit;

type
  TF_entraHospede = class(TF_baseTelaSimples)
    pnlControle: TPanel;
    btnSalvar: TSpeedButton;
    QRY_calculaDiarias: TFDQuery;
    QRY_calculaDiariasCAT_CODCATEGORIA: TIntegerField;
    QRY_calculaDiariasCAT_CATEGORIA: TStringField;
    QRY_calculaDiariasCAT_ATPESSOAS: TIntegerField;
    QRY_calculaDiariasCAT_VALORDIARIA1: TBCDField;
    QRY_calculaDiariasCAT_VALORDIARIA2: TBCDField;
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
    lblDtaEntrada: TLabel;
    lblHoraEntrada: TLabel;
    lblPrevisaoSaida: TLabel;
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
    edtApto: TcxCurrencyEdit;
    lblApto: TLabel;
    QRY_veiculos: TFDQuery;
    QRY_veiculosVEI_CODIGO: TIntegerField;
    QRY_veiculosVEI_MODELO: TStringField;
    QRY_veiculosVEI_MARCA: TStringField;
    QRY_veiculosVEI_LINHA: TStringField;
    QRY_veiculosVEI_PLACA: TStringField;
    QRY_veiculosVEI_COR: TStringField;
    frxDB_entraHospede: TfrxDBDataset;
    frxReport: TfrxReport;
    frxDB_filial: TfrxDBDataset;
    frxDB_hospede: TfrxDBDataset;
    frxDB_veiculo: TfrxDBDataset;
    frxDB_apto: TfrxDBDataset;
    QRY_qtdPessoasCategoria: TFDQuery;
    QRY_qtdPessoasCategoriaCAT_ATPESSOAS: TIntegerField;
    QRY_qtdPessoasCategoriaCAT_CODCATEGORIA: TIntegerField;
    QRY_qtdPessoasCategoriaCAT_CATEGORIA: TStringField;
    QRY_qtdPessoasCategoriaCAT_VALORDIARIA1: TBCDField;
    QRY_qtdPessoasCategoriaCAT_VALORDIARIA2: TBCDField;
    btnAdd: TSpeedButton;
    DBGridHospedesAdd: TDBGrid;
    DS_hotEntraHospede2: TDataSource;
    DS_hotEntraHospede: TDataSource;
    edtQtdLimite: TcxCurrencyEdit;
    lblQtdLimite: TLabel;
    imgBackRodape: TImage;
    edtCodCli: TcxDBCurrencyEdit;
    edtQtdAdultos: TcxDBCurrencyEdit;
    edtQtdCriancas: TcxDBCurrencyEdit;
    edtQtdPagantes: TcxDBCurrencyEdit;
    edtQtdDNormal: TcxDBCurrencyEdit;
    edtVlrDNormal: TcxDBCurrencyEdit;
    edtVlrGDNormal: TcxDBCurrencyEdit;
    edtQtdDExtra: TcxDBCurrencyEdit;
    edtVlrDExtra: TcxDBCurrencyEdit;
    edtVlrGDExtra: TcxDBCurrencyEdit;
    edtSubTDiarias: TcxDBCurrencyEdit;
    edtVlrTDiarias: TcxDBCurrencyEdit;
    dtaEntrada: TcxDBDateEdit;
    edtHoraEntrada: TcxDBCurrencyEdit;
    dtaPrevisaoSaida: TcxDBDateEdit;
    edtPlaca: TcxDBMaskEdit;
    edtModeloVeiculo: TcxDBTextEdit;
    edtMarcaVeiculo: TcxDBTextEdit;
    edtCliente: TcxTextEdit;
    frxDB_hotEntraHospede2: TfrxDBDataset;
    btnAddHospede: TSpeedButton;
    btnDelete: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscaHospedesClick(Sender: TObject);
    procedure btnCadVeiculoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtQtdPagantesExit(Sender: TObject);
    procedure dddExit(Sender: TObject);
    procedure btnCadVeiculosClick(Sender: TObject);
    procedure edtPlacaExit(Sender: TObject);
    procedure edtVlrDNormalExit(Sender: TObject);
    procedure edtVlrDExtraExit(Sender: TObject);
    procedure edtQtdAdultosExit(Sender: TObject);
    procedure btnAddHospedeClick(Sender: TObject);
    procedure DS_hotEntraHospede2DataChange(Sender: TObject; Field: TField);
    procedure edtClienteExit(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCache(Sender: TObject);
  public
    { Public declarations }
//    var entraHospede, cadVeiculo, libera: String;
    var libera, addHospede: String;
  end;

var
  F_entraHospede: TF_entraHospede;

implementation

{$R *.dfm}

uses UDMRackApto, UDMHospedes, UDMConexao, URackApto, UMsg, UPesquisaHospedes,
  UCadVeiculos, UBaseCadastro, USenhaLiberacao, UCheckIn;

procedure TF_entraHospede.LimparCache(Sender: TObject);
begin  {Procedure para limpar o cache depois de gravar para nao inserir vários}
  F_dmHospedes.QRY_entraHospede.CommitUpdates();
  F_dmHospedes.QRY_entraHospede2.CommitUpdates();
end;

procedure TF_entraHospede.btnAddHospedeClick(Sender: TObject);
begin  {busca hospedes - os Hóspedes que serão adicionados}
  inherited;

  {verificar se o record count da grid é maior que a qtd de adultos}

  if DS_hotEntraHospede2.DataSet.RecordCount = (edtQtdAdultos.Value - 1) then begin
    TF_msg.Mensagem('Limite máximo de Hóspedes já adicionado.','C',[mbOk]);
    exit;
  end
  else begin
    addHospede := 'AD';
    CriaFormDestroy(TF_pesquisaHospede, F_pesquisaHospede);
  end;
end;

procedure TF_entraHospede.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  {busca hospedes - 1º Hóspede}
//  entraHospede := 'S';  não está usando.
  addHospede := 'N';
  CriaFormDestroy(TF_pesquisaHospede, F_pesquisaHospede);
end;

procedure TF_entraHospede.btnCadVeiculosClick(Sender: TObject);
begin
  inherited;
//  cadVeiculo := 'S'; não está usando.
  CriaFormDestroy(TF_cadVeiculos, F_cadVeiculos);
end;

procedure TF_entraHospede.btnDeleteClick(Sender: TObject);
begin
  inherited;
  DS_hotEntraHospede2.DataSet.Delete;
end;

procedure TF_entraHospede.btnBuscaHospedesClick(Sender: TObject);
begin
  inherited;
  CriaFormDestroy(TF_pesquisaHospede, F_pesquisaHospede);
end;

procedure TF_entraHospede.btnCadVeiculoClick(Sender: TObject);
begin
  inherited;
  CriaFormDestroy(TF_cadVeiculos, F_cadVeiculos);
end;

procedure TF_entraHospede.btnSalvarClick(Sender: TObject);
var
  I: Integer;
begin //salva o hospede dando entrada dele no apartamento
  inherited;

  {se o atendende demorar gravar, atualiza a data e a hora.}
  edtHoraEntrada.Text := FormatDateTime('hh.mm.ss', Time);
  dtaEntrada.Date     := Date;

  if StrToInt(edtCodCli.Text) <= 0 then begin
    TF_msg.Mensagem('Faltam algumas informações do Hóspede! O Nome do Hósdede é um campo Obrigatório.','I',[mbOk]);
    edtCliente.SetFocus;
    exit;
  end;

  if StrToInt(edtQtdAdultos.Text) <= 0 then begin
    TF_msg.Mensagem('Faltam algumas informações do Hóspede! A Qtd. de Adultos é um campo Obrigatório.','I',[mbOk]);
    edtQtdAdultos.SetFocus;
    exit;
  end;

  if StrToInt(edtQtdPagantes.Text) <= 0 then begin
    TF_msg.Mensagem('Faltam algumas informações do Hóspede! A Qtd. de Pagantes é um campo Obrigatório.','I',[mbOk]);
    edtQtdPagantes.SetFocus;
    exit;
  end;

  if F_dmHospedes.QRY_EntraHospede2.RecordCount < (edtQtdAdultos.Value - 1) then begin{ - 1 visto qeu 1 já é o primeiro escolhido}
   if TF_msg.Mensagem('Falta informar hospedes na hospedagem. Deseja continuar sem adicionar?','C',[mbSim, mbNao]) then begin
    {passa direto - Clicou no sim}
   end
   else begin
    {para para adicionar os hóspedes corretamente - Clicou no não}
      {btnAdd.Click; - Abrirá o form para pesquisar novos hóspedes}
     exit;
   end;
  end;

  {essa msg vai sair. Está aqui somente para teste.}


  //exit;

  if Situacao = 'LIVRE' then begin
    try
      F_dmConexao.FDConn.StartTransaction;   {inicia a transação}

      edtHoraEntrada.Text := FormatDateTime('hh.mm.ss', Time); {atualiza a hora. se o funcionario demorar clicar no salvar}

      {$REGION 'CodigoAntigo'}

//      select * from hotaddhospede where ent_codentrada2 = :ent_codentrada
//      select * from hotentrahospede2  where ent_codentrada2 = :ent_codentrada


      F_dmHospedes.QRY_entraHospede.Edit;

      F_dmHospedes.QRY_entraHospedeENT_CODAPARTAMENTO.AsInteger           := StrToInt(CodApartamento);
      F_dmHospedes.QRY_entraHospedeENT_CODHOSPEDE.AsInteger               := StrToInt(edtCodCli.Text);

      F_dmHospedes.QRY_entraHospedeENT_DATAENTRADA.AsDateTime             := dtaEntrada.Date;
      F_dmHospedes.QRY_entraHospedeENT_HORAENTRADA.AsDateTime             := Time;

      F_dmHospedes.QRY_entraHospedeENT_QTDADULTOS.AsInteger               := StrToInt(edtQtdAdultos.Text);
      F_dmHospedes.QRY_entraHospedeENT_QTDCRIANCAS.AsInteger              := StrToInt(edtQtdCriancas.Text);
      F_dmHospedes.QRY_entraHospedeENT_QTDPAGANTES.AsInteger              := StrToInt(edtQtdPagantes.Text);

      F_dmHospedes.QRY_entraHospedeENT_QTD_DIARIA_NORMAL.AsInteger        := StrToInt(edtQtdDNormal.Text);
      F_dmHospedes.QRY_entraHospedeENT_QTD_DIARIA_EXTRA.AsInteger         := StrToInt(edtQtdDExtra.Text);

      F_dmHospedes.QRY_entraHospedeENT_VLR_DIARIA_NORMAL.AsCurrency       := edtVlrDNormal.Value;
      F_dmHospedes.QRY_entraHospedeENT_VLR_DIARIA_EXTRA.AsCurrency        := edtVlrDExtra.Value;


      F_dmHospedes.QRY_entraHospedeENT_VLR_G_DIARIA_NORMAL.AsCurrency     := edtVlrGDNormal.Value;
      F_dmHospedes.QRY_entraHospedeENT_VLR_G_DIARIA_EXTRA.AsCurrency      := edtVlrGDExtra.Value;
//
//      {19-05-2017}
      F_dmHospedes.QRY_entraHospedeENT_VLR_TOTAL_DIARIAS.AsCurrency       := edtVlrTDiarias.Value;
      F_dmHospedes.QRY_entraHospedeENT_QTD_TOTAL_DIARIAS.AsInteger        := StrToInt(edtSubTDiarias.Text);

      F_dmHospedes.QRY_entraHospedeENT_PREVISAO.AsDateTime                := dtaPrevisaoSaida.Date;
      F_dmHospedes.QRY_entraHospedeENT_PLACA.AsString                     := edtPlaca.Text;
      F_dmHospedes.QRY_entraHospedeENT_MODELOVEICULO.AsString             := edtModeloVeiculo.Text;
      F_dmHospedes.QRY_entraHospedeENT_MARCAVEICULO.AsString              := edtMarcaVeiculo.Text;

      {$ENDREGION}

      F_dmHospedes.QRY_entraHospedeENT_FILIAL.AsString                    := '1'; {pegar a filial logada}
      F_dmHospedes.QRY_entraHospedeENT_STATUS.AsString                    := 'OCUPADO';  {NA TABELA ENTRA HOSPDE}


      F_dmHospedes.FDSchemaAdapterEntraHospede.ApplyUpdates(0); {dá o ApplyUpdates nas duas tabelas}

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

        with F_dmRackApto.QRY_atualizaApto do begin
          Close;
          SQL.Clear;
          SQL.Add('update hotApartamento set apa_situacao = :situacao where apa_codapartamento = :codApto');
          ParamByName('situacao').Value := 'OCUPADO';  {NA TABELA HOTAPARTAMENTO - NÃO SAO A MESMA COISA}
          ParamByName('codApto').Value := CodApartamento;
          ExecSQL;
        end;

      F_dmConexao.FDConn.Commit;  {se tudo der certo, commita a transação}

      OrdenaLista; {atualiza a lista}

      TF_msg.Mensagem('Hóspede hospedado com Sucesso!','I',[mbOk]);

        {Verifica se existe o Relatório}
        if not FileExists(ExtractFilePath(Application.ExeName) + 'RelFR3\EntraHospedes.fr3') then begin
          TF_msg.Mensagem('Arquivo "EntraHospedes.fr3" na Pasta "RelFR3" não encontrado. Favor, contate o Suporte','I',[mbOk]);
          Self.Close; {fecha o form para o cliente nao salvar novamente}
          exit;
        end
        else begin  {Se existe, prepara e passa para o frxReport}
          frxReport.PrepareReport();
          frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + 'RelFR3\EntraHospedes.fr3');

          {passa os valores para o relatorio de abertura}
          frxReport.Variables['nApto']          := Apartamento;
          frxReport.Variables['vlrDExtras']     := edtVlrDExtra.Value;
          frxReport.Variables['vlrDNormais']    := edtVlrDNormal.Value;
          frxReport.Variables['qtdDExtras']     := edtQtdDExtra.Value;
          frxReport.Variables['qtdDNormais']    := edtQtdDNormal.Value;
          frxReport.Variables['tGeral']         := edtVlrTDiarias.Value;

          {Verifica se existe a imagem do Logo}
          if ( FileExists(ExtractFilePath(Application.ExeName) + '\imgs\logoRelatorios\logoCliente.jpg') ) then begin
              TfrxPictureView(frxReport.FindComponent('imgLogo')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
                  '\imgs\logoRelatorios\logoCliente.jpg');
          end
          else begin
              TF_msg.Mensagem('Logomarca do Relatório não encontrada. Favor, colocar uma imagem "logoCliente.jpg" na pasta' +
                '"\imgs\logoRelatorios" nos tamanhos: 400px x 300px.','I',[mbOk]);
          end;

          {Por fim, imprime o relatório}
          frxReport.ShowReport();
        end;



      if ( FileExists(ExtractFilePath(Application.ExeName) + '\imgs\logoRelatorios\logoCliente.jpg') ) then begin
        TfrxPictureView(frxReport.FindComponent('imgLogo')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
          '\imgs\logoRelatorios\logoCliente.jpg');
      end
      else begin
        TF_msg.Mensagem('Logomarca do Relatório não encontrada. Favor, colocar uma imagem "logoCliente.jpg" na pasta' +
                        '"\imgs\logoRelatorios" nos tamanhos: 400px x 300px.','I',[mbOk]);
      end;

      if F_checkIn <> nil then begin
        F_checkIn.Close;
      end;

      Self.Close; {fecha o form para o cliente nao salvar novamente}

    except on e:Exception do
      begin
        F_dmConexao.FDConn.Rollback;
        TF_msg.Mensagem('Erro na entrada do Hóspede. Verifique os dados de entrada corretamente.','I',[mbOk]);
        exit;
      end;
    end;
  End
  else begin
    TF_msg.Mensagem('Já foi dado entrada nesse Apartamento. Obrigado!','I',[mbOk]);
    Self.Close;
    exit;
  end;   {fim do bloco LIVRE}
end;

procedure TF_entraHospede.dddExit(Sender: TObject);
begin
  inherited;
  {sair do cliente}
  if (edtCliente.Text = '') or (edtCodCli.Text = '0') then begin
    TF_msg.Mensagem('Cliente inválido ou em Branco.','I',[mbOk]);
    TcxTextEdit(Sender).SetFocus;
    btnPesquisar.Click;
  end;
end;

procedure TF_entraHospede.DS_hotEntraHospede2DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if DS_hotEntraHospede2.DataSet.RecordCount > 0 then begin
    btnDelete.Visible := True;
  end
  else begin
    btnDelete.Visible := False;
  end;
end;

procedure TF_entraHospede.edtClienteExit(Sender: TObject);
begin
  inherited;
  if edtCliente.Text = '' then begin
    TF_msg.Mensagem('Cliente não pode ficar em braco. Favor, escolha um Cliente.','I',[mbOk]);
    TcxTextEdit(Sender).SetFocus;
    btnPesquisar.Click;
    exit;
  end;
end;

procedure TF_entraHospede.edtPlacaExit(Sender: TObject);
begin  {pesquisa pela placa}
  inherited;
  try
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
  finally
    QRY_veiculos.Close;
  end;
end;


procedure TF_entraHospede.edtQtdAdultosExit(Sender: TObject);
begin
  inherited;
  {sair do qtdAdultos}
  if ENumerico2(edtQtdAdultos.Text) = True then begin
    {faz as regras}
    if edtQtdAdultos.Value < 1 then begin
      TF_msg.Mensagem('Valor inválido! Favor, informar um valor maior ou igual a 1.','I',[mbOk]);
      TcxTextEdit(Sender).SetFocus;
      exit;
    end;

    if edtQtdAdultos.Value > 1 then begin
      DBGridHospedesAdd.Visible := True;
      btnAddHospede.Visible := True;
    end
    else begin
      DBGridHospedesAdd.Visible := False;
      btnAddHospede.Visible := False;
    end;

  end
  else begin
    {bloqueia}
    TF_msg.Mensagem('Valor inválido!','I',[mbOk]);
    TcxCurrencyEdit(Sender).SetFocus;
  end;



end;

procedure TF_entraHospede.edtQtdPagantesExit(Sender: TObject);
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
      edtQtdDNormal.Value       := 1;// (edtQtdPagantes.Value - edtQtdDExtra.Value); {qtd. diarias normais}

      edtVlrGDNormal.Value      := edtVlrDNormal.Value; // edtQtdDNormal.Value * edtVlrDNormal.Value; {vlr. geral. diarias normais}
      edtVlrGDExtra.Value       := edtQtdDExtra.Value  * edtVlrDExtra.Value;  {vlr. geral. diarias extras}

      edtSubTDiarias.Value      := edtQtdDExtra.Value + edtQtdDNormal.Value;// edtQtdDNormal.Value + edtQtdDExtra.Value; {tot. geral. diarias}
      edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
    end
    else begin
      edtQtdDExtra.Value        := 0;  {qtd. diarias extras}
      edtQtdDNormal.Value       := 1; //edtQtdPagantes.Value; {qtd. diarias normais}

      edtVlrGDNormal.Value      := edtVlrDNormal.Value; // edtQtdDNormal.Value * edtVlrDNormal.Value; {vlr. geral. diarias normais}
      edtVlrGDExtra.Value       := edtQtdDExtra.Value  * edtVlrDExtra.Value;  {vlr. geral. diarias extras}

      edtSubTDiarias.Value      := edtQtdDExtra.Value + edtQtdDNormal.Value; {tot. geral. diarias}
      edtVlrTDiarias.Value      := edtVlrGDNormal.Value + edtVlrGDExtra.Value; {vlr. geral. diarias}
    end;

  end
  else begin
    {bloqueia}
    TF_msg.Mensagem('Valor inválido!','I',[mbOk]);
    TcxCurrencyEdit(Sender).SetFocus;
  end;
end;

procedure TF_entraHospede.edtVlrDExtraExit(Sender: TObject);
begin          {saindo da extra}
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

procedure TF_entraHospede.edtVlrDNormalExit(Sender: TObject);
begin        {saindo da normal}
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

procedure TF_entraHospede.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if F_dmHospedes <> nil then begin
    FreeAndNil(F_dmHospedes);
  end;

end;

procedure TF_entraHospede.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then begin
    btnPesquisar.Click;
  end;

  if key = VK_F3 then begin
    btnAddHospede.Click;
  end;

  if key = VK_F4 then begin
    btnDelete.Click;
  end;
end;

procedure TF_entraHospede.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0,0); //mais rápido
  end;
end;

procedure TF_entraHospede.FormShow(Sender: TObject);
begin
  inherited;

  edtCliente.SetFocus;

  if F_dmHospedes = nil then begin
    Application.CreateForm(TF_dmHospedes, F_dmHospedes);
  end;

  F_dmHospedes.QRY_entraHospede.Open();
  F_dmHospedes.QRY_entraHospede.Append;

  {Qry que add mais hóspedes à hospedagem}
  F_dmHospedes.QRY_EntraHospede2.Open();

  edtHoraEntrada.Text := FormatDateTime('hh.mm.ss', Time);
  dtaEntrada.Date     := Date;
  dtaPrevisaoSaida.Date     := Date + 1;
  edtCliente.SelStart := Length(edtCliente.Text);

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

  {Qtd. Limite no quarto}
  edtQtdLimite.Value := QRY_calculaDiariasCAT_ATPESSOAS.AsInteger;

  F_dmHospedes.FDSchemaAdapterEntraHospede.AfterApplyUpdate := LimparCache;

end;

end.

