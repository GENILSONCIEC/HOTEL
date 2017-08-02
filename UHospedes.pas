unit UHospedes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  RzPanel, JvExStdCtrls, JvGroupBox, dxGDIPlusClasses, Vcl.Mask, Vcl.DBCtrls,
  sPageControl, Vcl.DBActns, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.Buttons, sEdit, RzEdit,
  RzBtnEdt, JvDateTimePicker, JvDBDateTimePicker, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxDBEdit, RzDBEdit, RzDBBnEd,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TF_hospede = class(TForm)
    pnlGeral: TPanel;
    sPGHospedes: TsPageControl;
    sTConsulta: TsTabSheet;
    pnlConsulta: TPanel;
    lblConsulta: TLabel;
    edtPesquisar: TEdit;
    pnlControle: TPanel;
    pnlDados: TPanel;
    sTCadastro: TsTabSheet;
    imgBack: TImage;
    pnlCadastro: TPanel;
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    pnlDadosCad: TPanel;
    ACM_cadastro: TActionManager;
    actNovo: TDataSetInsert;
    actDeletar: TDataSetDelete;
    actEditar: TDataSetEdit;
    actSalvar: TDataSetPost;
    actCancelar: TDataSetCancel;
    DS_cadConHospedes: TDataSource;
    btnNovo: TSpeedButton;
    btnNovoAcoes: TSpeedButton;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnDeletar: TSpeedButton;
    pnlDadosFisico: TPanel;
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblApelido: TLabel;
    edtApelido: TDBEdit;
    lblDtaNascimento: TLabel;
    DT_dtaNascimento: TJvDBDateTimePicker;
    lblSexo: TLabel;
    DBC_sexo: TDBComboBox;
    lblEstadoCivil: TLabel;
    DBB_estadoCivil: TDBComboBox;
    rdoF: TRadioButton;
    rdoJ: TRadioButton;
    lblCpf: TLabel;
    edtCpf: TDBEdit;
    lblRgIe: TLabel;
    edtRgIe: TDBEdit;
    lblNaturalidade: TLabel;
    edtNaturalidade: TDBEdit;
    lblNacionalidade: TLabel;
    edtNacionalidade: TDBEdit;
    lblEmail: TLabel;
    edtEmail: TDBEdit;
    lblProfissao: TLabel;
    DBC_profissao: TDBComboBox;
    lblNomePai: TLabel;
    edtNomePai: TDBEdit;
    lblFonePai: TLabel;
    edtFonePai: TDBEdit;
    lblNomeMae: TLabel;
    edtNomeMae: TDBEdit;
    lblFoneMae: TLabel;
    edtFoneMae: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    lblCelular: TLabel;
    edtCelular: TDBEdit;
    RzDBRegiao: TRzDBButtonEdit;
    lblRegiao: TLabel;
    lblCidade: TLabel;
    edtCidade: TDBEdit;
    lblEstado: TLabel;
    edtEstado: TDBEdit;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblComplemento: TLabel;
    edtComplemento: TDBEdit;
    lblNumero: TLabel;
    edtNumero: TDBEdit;
    pnlDadosJuridico: TPanel;
    lblRazao: TLabel;
    lblFantasia: TLabel;
    lblCnpj: TLabel;
    lblIe: TLabel;
    lblEmailJ: TLabel;
    lblContato1: TLabel;
    lblFoneContato1: TLabel;
    lblContato2: TLabel;
    lblFoneContato2: TLabel;
    lblFone: TLabel;
    lblCelularJ: TLabel;
    lblRegiaoJ: TLabel;
    lblCidadeJ: TLabel;
    lblEstadoJ: TLabel;
    lblEnderecoJ: TLabel;
    lblComplementoJ: TLabel;
    lblNumeroJ: TLabel;
    edtRazao: TDBEdit;
    edtFantasia: TDBEdit;
    edtCnpj: TDBEdit;
    edtIe: TDBEdit;
    edtEmailJ: TDBEdit;
    edtContato1: TDBEdit;
    edtTelContato1: TDBEdit;
    edtContato2: TDBEdit;
    edtTelContato2: TDBEdit;
    edtFone: TDBEdit;
    edtCelularJ: TDBEdit;
    RzRegiaoJ: TRzDBButtonEdit;
    edtCidadeJ: TDBEdit;
    edtEstadoJ: TDBEdit;
    edtEnderecoJ: TDBEdit;
    edtComplementoJ: TDBEdit;
    edtNumeroJ: TDBEdit;
    QRY_regiao: TFDQuery;
    QRY_regiaoREG_CODIGO: TIntegerField;
    QRY_regiaoREG_NOME: TStringField;
    QRY_regiaoEST_SIGLA: TStringField;
    QRY_entidade: TFDQuery;
    QRY_entidadeENT_CHAVE: TIntegerField;
    edtCodigo: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnNovoClick(Sender: TObject);
    procedure RzDBRegiaoButtonClick(Sender: TObject);
    procedure rdoJClick(Sender: TObject);
    procedure rdoFClick(Sender: TObject);
    procedure RzRegiaoJKeyPress(Sender: TObject; var Key: Char);
    procedure RzDBRegiaoKeyPress(Sender: TObject; var Key: Char);
    procedure actSalvarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_hospede: TF_hospede;

implementation

{$R *.dfm}

uses UDMHospedes, UFunctions, UPesquisaRegiao, UDMConexao, UMsg;

procedure TF_hospede.actSalvarExecute(Sender: TObject);
begin
   if DS_cadConHospedes.DataSet.State in [dsEdit] then begin
     DS_cadConHospedes.DataSet.Post;
   end
   else begin
    //1º atualiza a chave da entidade
      with QRY_entidade do begin
        Close;
        SQL.Clear;
        SQL.Add('update ENTIDADE');
        SQL.Add('set ENT_CHAVE = ENT_CHAVE + 1');
        SQL.Add('where (ENT_CODIGO = :ENT_CODIGO)');
        ParamByName('ENT_CODIGO').Value := 'CLIENTE';
        ExecSQL
      end;

      //2º seleciona a chave da entidade
      with QRY_entidade do begin
        Close;
        SQL.Clear;
        SQL.Add('Select ENT_CHAVE from ENTIDADE where ENT_CODIGO = :PENT_CODIGO');
        ParamByName('PENT_CODIGO').Value := 'CLIENTE';
        Open();
      end;

      //3º insere o cliente
      F_dmHospedes.QRY_conCadHospedesCLI_CODIGO.Value := QRY_entidadeENT_CHAVE.Value;
      DS_cadConHospedes.DataSet.Post;
      F_dmHospedes.QRY_conCadHospedes.ApplyUpdates()
   end;
end;

procedure TF_hospede.btnNovoClick(Sender: TObject);
begin
  F_dmHospedes.QRY_conCadHospedes.Open();
  btnNovoAcoes.Click;

    if F_dmHospedes.QRY_conCadHospedes.State in [dsEdit,dsInsert] then begin
      btnNovo.Enabled := False;
    end;
end;

procedure TF_hospede.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin //fecha no esc
  if key = VK_ESCAPE then begin
    Self.Close;
  end;
end;

procedure TF_hospede.FormShow(Sender: TObject);
  var img: String;
begin

  //Físico
  pnlDadosFisico.Width := 990;
  pnlDadosFisico.Height := 420;
  pnlDadosFisico.Top := 0;
  pnlDadosFisico.Left := 0;

  //cria o dm hospedes
  if F_dmHospedes = nil then begin
    Application.CreateForm(TF_dmHospedes, F_dmHospedes);
  end;

  sPGHospedes.ActivePage := sTConsulta;

  img := ExtractFilePath(Application.ExeName) + '\imgs\backGround\bg1.png';
  imgBack.Picture.LoadFromFile(img);
//
//  //pg_cadastro --> guia cadastro
//  img3 := ExtractFilePath(Application.ExeName) + '\imgs\backGround\bg1.png';
//  imgBackCad.Picture.LoadFromFile(img3);
//
//  PG_hospedes.ActivePage := tabConsulta;
end;

procedure TF_hospede.rdoFClick(Sender: TObject);
begin
  //Físico
  pnlDadosJuridico.Visible := False;
  pnlDadosFisico.Visible := True;
  pnlDadosFisico.Width := 990;
  pnlDadosFisico.Height := 420;
  pnlDadosFisico.Top := 0;
  pnlDadosFisico.Left := 0;
end;

procedure TF_hospede.rdoJClick(Sender: TObject);
begin
  //Jurídico
  pnlDadosFisico.Visible := False;
  pnlDadosJuridico.Visible := True;
  pnlDadosJuridico.Width := 990;
  pnlDadosJuridico.Height := 420;
  pnlDadosJuridico.Top := 0;
  pnlDadosJuridico.Left := 0;
end;

procedure TF_hospede.RzDBRegiaoButtonClick(Sender: TObject);
begin
  CriaFormDestroy(TF_pesquisaRegiao, F_pesquisaRegiao);
end;

procedure TF_hospede.RzDBRegiaoKeyPress(Sender: TObject; var Key: Char);
begin
//funciona se o cliente já souber o código da região ao cadastrar. (Físico)
  if key = #13 then begin
    if Length(RzDBRegiao.Text) > 0 then begin
      with QRY_regiao do begin
        Close;
        SQL.Clear;
        SQL.Add('select r.reg_codigo, r.reg_nome, e.est_sigla from regiao r');
        SQL.Add(' inner join estado e on (r.reg_coduf = e.est_id)');
        SQL.Add(' where r.reg_codigo = :codigo');
        ParamByName('codigo').Value := RzDBRegiao.Text;
        Open();
      end;

      if QRY_regiao.RecordCount > 0 then begin
        edtCidadeJ.Text := QRY_regiaoREG_NOME.AsString;
        edtEstadoJ.Text := QRY_regiaoEST_SIGLA.AsString;
        edtCidade.Text := QRY_regiaoREG_NOME.AsString;
        edtEstado.Text := QRY_regiaoEST_SIGLA.AsString;
      end
      else begin
        TF_msg.Mensagem('Região / Cidade não encontrada!','I',[mbOk]);
        RzDBRegiao.Clear;
        RzDBRegiao.SetFocus;
        Abort;
      end;
    end
    else begin
      TF_msg.Mensagem('Favor, digitar o código da Região / Cidade!','I',[mbOk]);
    end;
  end;
end;

procedure TF_hospede.RzRegiaoJKeyPress(Sender: TObject; var Key: Char);
begin
  //funciona se o cliente já souber o código da região ao cadastrar. (Jurídico)
  if key = #13 then begin
    if Length(RzRegiaoJ.Text) > 0 then begin
      with QRY_regiao do begin
        Close;
        SQL.Clear;
        SQL.Add('select r.reg_codigo, r.reg_nome, e.est_sigla from regiao r');
        SQL.Add(' inner join estado e on (r.reg_coduf = e.est_id)');
        SQL.Add(' where r.reg_codigo = :codigo');
        ParamByName('codigo').Value := RzRegiaoJ.Text;
        Open();
      end;

      if QRY_regiao.RecordCount > 0 then begin
        edtCidadeJ.Text := QRY_regiaoREG_NOME.AsString;
        edtEstadoJ.Text := QRY_regiaoEST_SIGLA.AsString;
        edtCidade.Text := QRY_regiaoREG_NOME.AsString;
        edtEstado.Text := QRY_regiaoEST_SIGLA.AsString;
      end
      else begin
        TF_msg.Mensagem('Região / Cidade não encontrada!','I',[mbOk]);
        RzRegiaoJ.Clear;
        RzRegiaoJ.SetFocus;
        Abort;
      end;
    end
    else begin
      TF_msg.Mensagem('Favor, digitar o código da Região / Cidade!','I',[mbOk]);
    end;
  end;
end;

end.
