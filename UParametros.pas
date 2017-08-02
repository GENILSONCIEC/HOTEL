unit UParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TF_parametros = class(TF_baseTelaSimples)
    pnlControle: TPanel;
    btnGravar: TSpeedButton;
    PGC_parametro: TPageControl;
    tabBasica: TTabSheet;
    gbxDiarias: TGroupBox;
    lblHoraVencimentoDiarias: TLabel;
    DTP_horaDiaria: TDateTimePicker;
    gbxTelefone: TGroupBox;
    lblMinutoTelefone: TLabel;
    edtVlrMinuto: TEdit;
    tabDois: TTabSheet;
    gbxApto: TGroupBox;
    lblColunas: TLabel;
    lblLinhas: TLabel;
    lblTotApto: TLabel;
    lblTotal: TLabel;
    edtColunas: TEdit;
    edtLinhas: TEdit;
    btnGravarApto: TButton;
    QRY_qtdApto: TFDQuery;
    QRY_qtdAptoPA_COLUNA: TSingleField;
    QRY_qtdAptoPA_LINHAS: TSingleField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtLinhasExit(Sender: TObject);
    procedure edtColunasChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarAptoClick(Sender: TObject);
    procedure edtLinhasChange(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtVlrMinutoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_parametros: TF_parametros;

implementation

{$R *.dfm}

uses UDMParametro, UFunctions, UMsg, UDMConexao;

procedure TF_parametros.btnGravarAptoClick(Sender: TObject);
begin //qtd de apto
  inherited;
  if Parametro = True then begin
    //insert
    with F_dmParametro.QRY_parametro do begin
    Close;
    SQL.Clear;
    SQL.Add('insert into HOTPARAMETRO (PA_COLUNA, PA_LINHAS)');
    SQL.Add('values (:PA_COLUNA, :PA_LINHAS)');
    ParamByName('PA_COLUNA').Value := edtColunas.Text;
    ParamByName('PA_LINHAS').Value := edtLinhas.Text;
    ExecSQL;
  end;

  TF_msg.Mensagem('Configurações salvas com sucesso!','I',[mbOk]);
  end
  else begin
    //update
    with F_dmParametro.QRY_parametro do begin
      Close;
      SQL.Clear;
      SQL.Add('update HOTPARAMETRO');
      SQL.Add('set PA_COLUNA = :PA_COLUNA,');
      SQL.Add('PA_LINHAS = :PA_LINHAS');
      ParamByName('PA_COLUNA').Value := edtColunas.Text;
      ParamByName('PA_LINHAS').Value := edtLinhas.Text;
      ExecSQL;
    end;

    TF_msg.Mensagem('Dados atualizado com sucesso!','I',[mbOk]);
  end;
end;

procedure TF_parametros.btnGravarClick(Sender: TObject);
begin //parametros gerais
  inherited;
  if Parametro = True then begin
      //insert
      with F_dmParametro.QRY_parametro do begin
      Close;
      SQL.Clear;
      SQL.Add('insert into HOTPARAMETRO (PA_HORADIARIA, PA_MINUTOFONE)');
      SQL.Add('values (:PA_HORADIARIA, :PA_MINUTOFONE)');
      ParamByName('PA_HORADIARIA').Value := DTP_horaDiaria.Time;
      ParamByName('PA_MINUTOFONE').Value := edtVlrMinuto.Text;
      ExecSQL;
    end;

    TF_msg.Mensagem('Configurações salvas com sucesso!','I',[mbOk]);
    end
    else begin
      //update

      if validaParametro = True then begin
        with F_dmParametro.QRY_parametro do begin
          Close;
          SQL.Clear;
          SQL.Add('update HOTPARAMETRO');
          SQL.Add('set PA_HORADIARIA = :PA_HORADIARIA, PA_MINUTOFONE = :PA_MINUTOFONE');
          ParamByName('PA_HORADIARIA').Value := TimeToStr(DTP_horaDiaria.Time);
          ParamByName('PA_MINUTOFONE').Value := edtVlrMinuto.Text;
          ExecSQL;
        end;
      end
      else begin
        exit;
      end;

      TF_msg.Mensagem('Dados atualizado com sucesso!','I',[mbOk]);
    end;

end;

procedure TF_parametros.edtColunasChange(Sender: TObject);
begin
  inherited;
  if edtColunas.Text = '0' then begin
    TF_msg.Mensagem('Valor não pode ser zero. Informar um valor maior ou igual a 1','I',[mbOk]);
    edtColunas.Clear;
    edtColunas.SetFocus;
    exit;
  end;

  if Length(edtColunas.Text) >= 1 then begin
    edtLinhas.Visible := True;
  end
  else begin
    edtLinhas.Visible := False;
  end;
end;

procedure TF_parametros.edtLinhasChange(Sender: TObject);
begin
  inherited;
  if Length(edtLinhas.Text) >= 1 then begin
    btnGravarApto.Visible := True;
  end
  else begin
    btnGravarApto.Visible := False;
  end;
end;

procedure TF_parametros.edtLinhasExit(Sender: TObject);
var
  totApto, colunas, linhas:Double;
begin
  inherited;

  if edtLinhas.Text = '' then begin
    TF_msg.Mensagem('Favor, informar um valor maior ou igual a 1','E',[mbOk]);
    edtLinhas.Clear;
    edtLinhas.SetFocus;
    exit;
  end;

  colunas := StrToFloat(edtColunas.Text);
  linhas  := StrToFloat(edtLinhas.Text);

  if linhas = 0 then begin
    TF_msg.Mensagem('Favor, não informe zero. Informe um valor maior ou igual a 1!','E',[mbOk]);
    edtLinhas.Clear;
    edtLinhas.SetFocus;
    exit;
  end;

  totApto := colunas * linhas;
  lblTotal.Caption := FloatToStr(totApto);
end;

procedure TF_parametros.edtVlrMinutoChange(Sender: TObject);
begin
  inherited;
  //valor do minuto do telefone
  if Length(edtVlrMinuto.Text) >= 1 then begin
    if ENumerico2(edtVlrMinuto.Text) then begin
      //passa de boa
    end
    else begin
      TF_msg.Mensagem('Opção inválida. Favor, informar um valor válido.','C',[mbOk]);
      edtVlrMinuto.Clear;
    end;
  end;  //fim do tamanho do campo
end;

procedure TF_parametros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  F_dmParametro.Destroy;
end;

procedure TF_parametros.FormCreate(Sender: TObject);
begin
  inherited;//cria o dmParametro
  if F_dmParametro = nil then begin
    Application.CreateForm(TF_dmParametro, F_dmParametro);
  end;

end;

procedure TF_parametros.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then begin
    Key := #0;
    //SendMessage(Handle, WM_NEXTDLGCTL, 0,0);  //mais lento
    Perform(WM_NEXTDLGCTL, 0,0); //mais rápido
  end;
end;

procedure TF_parametros.FormShow(Sender: TObject);
begin
  inherited;

  with QRY_qtdApto do begin
    Close;
    SQL.Clear;
    SQL.Add('select PA_COLUNA, PA_LINHAS from HOTPARAMETRO ');
    Open();
  end;

  if QRY_qtdApto.RecordCount >= 1 then begin
    lblTotal.Caption := FloatToStr(QRY_qtdAptoPA_COLUNA.Value * QRY_qtdAptoPA_LINHAS.Value);
  end;

  PGC_parametro.ActivePage := tabBasica;

  //joga os valores do banco nos campos nos parametros gerais
  if Parametro = False then begin
    DTP_horaDiaria.Time := StrToTime(F_dmParametro.QRY_parametroPA_HORADIARIA.AsString);
    edtVlrMinuto.Text := F_dmParametro.QRY_parametroPA_MINUTOFONE.AsString;
  end;
end;

end.
