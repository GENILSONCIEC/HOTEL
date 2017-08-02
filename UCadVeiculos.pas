unit UCadVeiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList, Vcl.ActnMan,
  Vcl.Grids, Vcl.DBGrids, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxGDIPlusClasses,
  Vcl.Buttons, dxSkinLilian;

type
  TF_cadVeiculos = class(TF_baseTelaSimples)
    pnlDados: TPanel;
    lblCodigo: TLabel;
    lblModelo: TLabel;
    lblMarca: TLabel;
    lblLinha: TLabel;
    lblPlaca: TLabel;
    lblCor: TLabel;
    edtCodigo: TcxDBTextEdit;
    edtModelo: TcxDBTextEdit;
    edtMarca: TcxDBLookupComboBox;
    edtPlaca: TcxDBMaskEdit;
    edtCor: TcxDBLookupComboBox;
    edtLinha: TcxDBLookupComboBox;
    imgBack: TImage;
    pnlControle: TPanel;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnLocalizar: TSpeedButton;
    QRY_conVeiculo: TFDQuery;
    QRY_conVeiculoVEI_CODIGO: TIntegerField;
    QRY_conVeiculoVEI_MODELO: TStringField;
    QRY_conVeiculoVEI_MARCA: TStringField;
    QRY_conVeiculoVEI_LINHA: TStringField;
    QRY_conVeiculoVEI_PLACA: TStringField;
    QRY_conVeiculoVEI_COR: TStringField;
    QRY_linha: TFDQuery;
    QRY_marca: TFDQuery;
    DS_linha: TDataSource;
    DS_marca: TDataSource;
    QRY_cores: TFDQuery;
    DS_cores: TDataSource;
    QRY_verVeiculoEntraHospede: TFDQuery;
    QRY_verVeiculoEntraHospedeENT_PLACA: TStringField;
    QRY_incGenerator: TFDQuery;
    QRY_cadVeiculos: TFDQuery;
    DS_cadVeiculos: TDataSource;
    QRY_cadVeiculosVEI_CODIGO: TIntegerField;
    QRY_cadVeiculosVEI_MODELO: TStringField;
    QRY_cadVeiculosVEI_MARCA: TStringField;
    QRY_cadVeiculosVEI_LINHA: TStringField;
    QRY_cadVeiculosVEI_PLACA: TStringField;
    QRY_cadVeiculosVEI_COR: TStringField;
    procedure DS_cadVeiculoStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure QRY_cadVeiculosNewRecord(DataSet: TDataSet);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtPlacaExit(Sender: TObject);
    procedure edtCorEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
//    function incGen(NomeGenerator:String):Integer;
    var idVeiculo : Integer;
  end;

var
  F_cadVeiculos: TF_cadVeiculos;

implementation

{$R *.dfm}

uses UDMConexao, UMsg, UFunctions, UPesquisaVeiculos, UEntraHospede;

procedure TF_cadVeiculos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  QRY_cadVeiculos.Cancel;
end;

procedure TF_cadVeiculos.btnDeletarClick(Sender: TObject);
begin
  inherited;

  {verifica se o veículo já foi colocado na hospedagem. Se sim, nao deixa apagar.}

  if edtCodigo.Text = '' then begin
    TF_msg.Mensagem('Não há veículo selecionado para ser excluído.','I',[mbOk]);
    exit;
  end
  else begin
    if TF_msg.Mensagem('Deseja mesmo excluir esse Veículo?','Q',[mbSim, mbNao]) then begin

      with QRY_verVeiculoEntraHospede do begin
        Close;
        SQL.Clear;
        SQL.Add('select ent_placa from hotentrahospede where ent_placa = :placa');
        ParamByName('placa').Value := edtPlaca.Text;
        Open();
      end;

      if QRY_verVeiculoEntraHospede.RecordCount > 0 then begin
        TF_msg.Mensagem('Esse veículo não poderá ser apagado. Já foi movimentado na Hospedagem.','I',[mbOk]);
        exit;
      end;

     QRY_cadVeiculos.Delete;
     QRY_cadVeiculos.ApplyUpdates(0);
     TF_msg.Mensagem('Veículo excluído com Sucesso!','I',[mbOk]);
    end;
  end;
end;

procedure TF_cadVeiculos.btnEditarClick(Sender: TObject);
begin
  inherited;
  QRY_cadVeiculos.Edit;
end;

procedure TF_cadVeiculos.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  CriaFormDestroy(TF_pesquisaVeiculos, F_pesquisaVeiculos);
  {if F_pesquisaVeiculos.IdSelecionado > 0 then}

  {pega o id já selecionado no pesquisaVeiculos e busca baseado nele. ver um codigo mais lindo para isso}

  if idVeiculo > 0 then begin
    with QRY_cadVeiculos do begin
      Close;
      SQL.Clear;
      SQL.Add('select * from hotveiculos where vei_codigo = :codigo');
      ParamByName('codigo').Value := idVeiculo;
      Open();
    end;
  end;
end;

procedure TF_cadVeiculos.btnNovoClick(Sender: TObject);
begin
  inherited;
  QRY_cadVeiculos.Append;
//  if edtModelo.CanFocus then
    edtModelo.SetFocus;
end;

procedure TF_cadVeiculos.btnSalvarClick(Sender: TObject);
begin
  inherited;
  QRY_cadVeiculos.Edit;
  QRY_cadVeiculos.Post;
  QRY_cadVeiculos.ApplyUpdates(0);

//  idVeiculo := StrToInt(edtCodigo.Text); {F_pesquisaVeiculos.IdSelecionado; - tem que salvar}

  {verifica se foi gravado pelo F_entraHospede}
  if F_entraHospede <> nil then begin
    F_entraHospede.edtPlaca.Text          := edtPlaca.Text;
    F_entraHospede.edtModeloVeiculo.Text  := edtModelo.Text;
    F_entraHospede.edtMarcaVeiculo.Text   := edtMarca.Text;
    Self.Close;
  end;
end;

procedure TF_cadVeiculos.DS_cadVeiculoStateChange(Sender: TObject);
var i: Integer;
begin  //habilita ou desabilita os botões de controle do formulário
  btnNovo.Enabled := not (DS_cadVeiculos.State in [dsInsert, dsEdit]);
  btnEditar.Enabled := btnNovo.Enabled and (DS_cadVeiculos.DataSet.RecordCount > 0);
  btnDeletar.Enabled := btnEditar.Enabled;
  btnLocalizar.Enabled := btnNovo.Enabled;
  btnSalvar.Enabled := DS_cadVeiculos.State in [dsInsert, dsEdit];
  btnCancelar.Enabled := btnSalvar.Enabled;
  for i := 0 to ComponentCount -1 do
    if Components[i].Tag > 0 then
      TControl(Components[i]).Enabled := DS_cadVeiculos.State in [dsInsert, dsEdit];
end;

procedure TF_cadVeiculos.edtCorEnter(Sender: TObject);
begin
  inherited;
  if Length((Sender as TcxDBLookupComboBox).Text) = 0 then begin
  //    SendMessage((Sender as TcxDBComboBox).Handle, CB_SHOWDROPDOWN, 1, 0);
    TcxDBLookupComboBox(Sender).DroppedDown := True;
  end;
end;

procedure TF_cadVeiculos.edtPlacaExit(Sender: TObject);
begin
  inherited;
  if QRY_cadVeiculos.State in [dsInsert] then begin
      if Length(edtPlaca.Text) < 8 then begin
        TF_msg.Mensagem('Placa incorreta. Favor, digite uma placa válida','I',[mbOk]);
        TcxDBDateEdit(Sender).SetFocus;
        exit;
      end;

      with QRY_conVeiculo do begin
        Close;
        SQL.Clear;
        SQL.Add('select * from hotveiculos where vei_placa = :placa');
        ParamByName('placa').Value := edtPlaca.Text;
        Open();
      end;

      if QRY_conVeiculo.RecordCount > 0 then begin
        TF_msg.Mensagem('Já existe um veículo cadastrado com essa Placa. Favor, faça uma consulta.','I',[mbOk]);
        TcxDBDateEdit(Sender).SetFocus;
        exit;
      end;
    end;
end;

procedure TF_cadVeiculos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TF_cadVeiculos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then begin
    Key := #0;
    //SendMessage(Handle, WM_NEXTDLGCTL, 0,0);  //mais lento
    Perform(WM_NEXTDLGCTL, 0,0); //mais rápido
  end;
end;

procedure TF_cadVeiculos.FormShow(Sender: TObject);
begin
  inherited;
  QRY_cadVeiculos.Open();
  QRY_marca.Open();
  QRY_linha.Open();
  QRY_cores.Open();

end;

{não precisa mais dessa função. Usa apenas o cacheupdate}
//function TF_cadVeiculos.incGen(NomeGenerator: String): Integer;
//begin
// {incrementa generator}
// with QRY_incGenerator do begin
//   Close;
//   SQL.Clear;
//   SQL.Add('select gen_id(GEN_HOTVEICULOS_ID,1) from rdb$database');
//   Open();
//
//   {sem o result, fica um valor gigante}
//   Result := QRY_incGenerator.Fields.Fields[0].AsInteger;
//   Close;
// end;
//end;

procedure TF_cadVeiculos.QRY_cadVeiculosNewRecord(DataSet: TDataSet);
begin
  inherited;
  {não usa mais esse comando. Gero o Generate com o cacheupdate}
//   QRY_cadVeiculosVEI_CODIGO.AsInteger := incGen('GEN_HOTVEICULOS_ID');
end;

end.
