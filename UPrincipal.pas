unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Comp.Client, FireDAC.Phys.SQLiteVDataSet, System.DateUtils,

  {units}
  UFunctions, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.ImageList, Vcl.ImgList,
  UCDataConnector, UCFireDACConn, UCBase;

type
  TF_principal = class(TForm)
    stbPrincipal: TStatusBar;
    pnlPrincipal: TPanel;
    pnlControle: TPanel;
    pnlBackground: TPanel;
    pnlVersao: TPanel;
    lblTitulo: TLabel;
    lblVersao: TLabel;
    pnlBotoes: TPanel;
    btnHospedes: TSpeedButton;
    btnApto: TSpeedButton;
    btnCategoria: TSpeedButton;
    btnEntrada: TSpeedButton;
    btnProduto: TSpeedButton;
    btnCaixa: TSpeedButton;
    mmPrincipal: TMainMenu;
    Sistema1: TMenuItem;
    btnVendas: TSpeedButton;
    acmPrincipal: TActionManager;
    actHospedes: TAction;
    actApto: TAction;
    actCategoria: TAction;
    actReserva: TAction;
    actProdutos: TAction;
    actVendas: TAction;
    actCaixa: TAction;
    Configuraes1: TMenuItem;
    Sair1: TMenuItem;
    actParametro: TAction;
    actSair: TAction;
    imgLogo: TImage;
    C1: TMenuItem;
    V1: TMenuItem;
    actVeiculos: TAction;
    M1: TMenuItem;
    actTransferencia: TAction;
    N1: TMenuItem;
    c2: TMenuItem;
    actCiec: TAction;
    pnl: TPanel;
    btnFechar: TSpeedButton;
    lblTitulociec: TLabel;
    R1: TMenuItem;
    M2: TMenuItem;
    M3: TMenuItem;
    actMovDia: TAction;
    ImageList20: TImageList;
    actAptoLivre: TAction;
    actAptoOcupado: TAction;
    actAptoFechadoDia: TAction;
    actAptoAbertoDia: TAction;
    H1: TMenuItem;
    A3: TMenuItem;
    C3: TMenuItem;
    P1: TMenuItem;
    actFatEntrada: TAction;
    actFatSaida: TAction;
    btnMaximizar: TSpeedButton;
    btnMinimizar: TSpeedButton;
    U1: TMenuItem;
    C4: TMenuItem;
    A4: TMenuItem;
    L1: TMenuItem;
    actCadUser: TAction;
    actAlterarSenha: TAction;
    actLogOff: TAction;
    TimerLogin: TTimer;
    UserControl: TUserControl;
    UCFireDACConn: TUCFireDACConn;
    btnMovimentoEntrada: TSpeedButton;
    M4: TMenuItem;
    actMovimentoEntrada: TAction;
    TimerHoraAtual: TTimer;
    actAptoReservado: TAction;
    btnRelatorios: TSpeedButton;
    actRelatoriosSwitch: TAction;
    pnlRodape: TPanel;
    lblDicas: TLabel;
    lblAno: TLabel;
    lblTVersao: TLabel;
    lblTAno: TLabel;
    dtaAno: TDateTimePicker;
    lblDtaAno: TLabel;
    procedure actAptoExecute(Sender: TObject);
    procedure actCategoriaExecute(Sender: TObject);
    procedure actReservaExecute(Sender: TObject);
    procedure actProdutosExecute(Sender: TObject);
    procedure actVendasExecute(Sender: TObject);
    procedure actHospedesExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actVeiculosExecute(Sender: TObject);
    procedure actCiecExecute(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnMaximizarClick(Sender: TObject);
    procedure TimerLoginTimer(Sender: TObject);
    procedure actMovimentoEntradaExecute(Sender: TObject);
    procedure UserControlLoginSucess(Sender: TObject; IdUser: Integer; Usuario,
      Nome, Senha, Email: string; Privileged: Boolean);
    procedure UserControlStartApplication(Sender: TObject);
    procedure TimerHoraAtualTimer(Sender: TObject);
    procedure actRelatoriosSwitchExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCaixaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    Valor : string;
    { Public declarations }
  end;

var
  F_principal: TF_principal;

implementation

{$R *.dfm}

uses URackApto, UParametros, UCategoria, UCadApto, UMsg,
  UCadVeiculos, UTransferencia, UNoticias, UCaixa, UDMConexao,
  UMovimentacaoDia, UFJ, URelAptosFechadosPeriodoP, URelReimprimeEntrada,
  UConexaoINI, UMovIO, URelatoriosSwitch, UDMHospedes;

procedure TF_principal.actAptoExecute(Sender: TObject);
begin
  //apto
  CriaFormDestroy(TF_cadApto, F_cadApto);
end;

procedure TF_principal.actCaixaExecute(Sender: TObject);
begin
{caixa}
end;

procedure TF_principal.actCategoriaExecute(Sender: TObject);
begin
  //categoria
  CriaFormDestroy(TF_categoria, F_categoria);
end;

procedure TF_principal.actCiecExecute(Sender: TObject);
begin
//ciec notícias
//  CriaFormDestroy(TF_noticias, F_noticias);
end;

procedure TF_principal.actHospedesExecute(Sender: TObject);
begin
  //hospedes (cadastro)
  CriaFormDestroy(TF_fj, F_fj);
end;

procedure TF_principal.actMovimentoEntradaExecute(Sender: TObject);
begin
  {Movimento de Entrada - Grid}
//  CriaFormDestroy(TF_movIO, F_movIO);
end;

procedure TF_principal.actProdutosExecute(Sender: TObject);
begin
  //produtos
end;

procedure TF_principal.actRelatoriosSwitchExecute(Sender: TObject);
begin
  {Switch Relatórios}
  CriaFormDestroy(TF_relatoriosSwitch, F_relatoriosSwitch);
end;

procedure TF_principal.actReservaExecute(Sender: TObject);
begin
  //reserva
  CriaFormDestroy(TF_rackApto, F_rackApto);
end;

procedure TF_principal.actSairExecute(Sender: TObject);
begin //sair da aplicação
  if (TF_msg.Mensagem('Deseja encerrar a aplicação?','Q',[mbSim, mbNao])) then
    Application.Terminate;
end;

procedure TF_principal.actVeiculosExecute(Sender: TObject);
begin
  //veículos
  CriaFormDestroy(TF_cadVeiculos, F_cadVeiculos);
end;

procedure TF_principal.actVendasExecute(Sender: TObject);
begin
  //vendas
end;

procedure TF_principal.btnMaximizarClick(Sender: TObject);
begin  {maximizar - restaurar}
  if IsZoomed(F_principal.Handle) then begin
    F_principal.WindowState := wsNormal;
  end
  else begin
    F_principal.WindowState := wsMaximized;
  end;
end;

procedure TF_principal.btnMinimizarClick(Sender: TObject);
begin  {minimizar}
  Application.Minimize;
end;

procedure TF_principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {para não dar os erros de memoria caso só abra o cliente e fecha.}
  UCFireDACConn.Destroy;
  FreeAndNil(F_dmHospedes);
end;

procedure TF_principal.FormShow(Sender: TObject);
var img : String;
begin

  {pega a versao do sistema}
  lblVersao.Caption := VersaoExe;

  {pega o ano que o sistema está executando}
  dtaAno.Date       := Date;
  lblAno.Caption    := IntToStr(YearOf(dtaAno.Date));

  img := ExtractFilePath(Application.ExeName) + '\imgs\logo\logo.png';
  imgLogo.Picture.LoadFromFile(img);

  with F_dmConexao.QRY_filial do begin
    Close;
    SQL.Clear;
    SQL.Add('select fil_codigo, fil_razao, fil_fanta, fil_cidade, fil_fone, fil_cnpj, fil_endereco,');
    SQL.Add('fil_estado from filial where fil_codigo = 1');
    Open();
  end;

  lblTitulociec.Caption := 'LICENCIADO PARA: '+F_dmConexao.QRY_filialFIL_RAZAO.AsString;

    stbPrincipal.Panels[4].Text := F_dmConexao.FDConn.Params.Database;
    stbPrincipal.Panels[5].Text := 'Impressora Padrão: '+ GetImpressoraPadrao;

end;

procedure TF_principal.TimerHoraAtualTimer(Sender: TObject);
begin
  stbPrincipal.Panels[1].Text := 'Data Atual: '+DateToStr(Date);
  stbPrincipal.Panels[2].Text := 'Hora Atual: '+TimeToStr(Now);
end;

procedure TF_principal.TimerLoginTimer(Sender: TObject);
begin
  TimerLogin.Enabled := False;
  UserControl.StartLogin;
end;

procedure TF_principal.UserControlLoginSucess(Sender: TObject; IdUser: Integer;
  Usuario, Nome, Senha, Email: string; Privileged: Boolean);
begin
  stbPrincipal.Panels[0].Text := 'Usuário: '+UserControl.CurrentUser.UserName;
end;

procedure TF_principal.UserControlStartApplication(Sender: TObject);
begin
  stbPrincipal.Panels[3].Text := 'Máquina: '+UserControl.GetLocalComputerName;
end;

end.
