unit USenhaLiberacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, dxGDIPlusClasses;

type
  TF_senhaLiberacao = class(TF_baseTelaSimples)
    PLogin: TPanel;
    imgBack: TImage;
    LbSenha: TLabel;
    btOK: TBitBtn;
    BtCancela: TBitBtn;
    pnlTopo: TPanel;
    imgTop: TImage;
    lblTitulo: TLabel;
    edtSenha: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure BtCancelaClick(Sender: TObject);
    procedure imgBackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    var libera: String;
  end;

var
  F_senhaLiberacao: TF_senhaLiberacao;

implementation

{$R *.dfm}

uses UPrincipal, UEntraHospede, UDMParametro, UMsg, UFunctions, UEfetivaReserva,
  UReservaApto;

procedure TF_senhaLiberacao.BtCancelaClick(Sender: TObject);
begin
  inherited;
  F_entraHospede.libera := 'N';
  Self.Close;
end;

procedure TF_senhaLiberacao.btOKClick(Sender: TObject);
begin
  inherited;
  with F_dmParametro.QRY_parametroCiec do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from parametro');
    Open();
  end;

  if edtSenha.Text = TrimRight(F_dmParametro.QRY_parametroCiecPMT_SENHADES.AsString) then begin
    if F_entraHospede <> nil then begin
      F_entraHospede.libera := 'S';
      Self.Close;
    end;
    if F_reservaApto <> nil then begin
      F_reservaApto.libera := 'S';
      Self.Close;
    end;
    if F_efetivaReserva <> nil then begin
      F_efetivaReserva.libera := 'S';
      Self.Close;
    end;
  end
  else begin
    TF_msg.Mensagem('Senha incorreta! Chame seu supervisor.','E',[mbOk]);
    TEdit(Sender).SetFocus;
    exit;
  end;
end;

procedure TF_senhaLiberacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then begin
    Key := #0;
    //SendMessage(Handle, WM_NEXTDLGCTL, 0,0);  //mais lento
    Perform(WM_NEXTDLGCTL, 0,0); //mais rápido
  end;
end;

procedure TF_senhaLiberacao.FormShow(Sender: TObject);
begin
  inherited;
  edtSenha.SetFocus;

  if F_dmParametro = nil then begin
    Application.CreateForm(TF_dmParametro, F_dmParametro);
  end;
end;

procedure TF_senhaLiberacao.imgBackMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer); {move o form sem as bordas}
const
  sc_DragMove = $f012;
begin
  inherited;
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
