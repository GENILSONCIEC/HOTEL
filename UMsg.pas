unit UMsg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

//Declarada por mim
type
  TMyButtons = (mbSim, mbNao, mbOk);

type
  TF_msg = class(TForm)
    pnlPrincipal: TPanel;
    gbx: TGroupBox;
    pnlControle: TPanel;
    pnlBotao: TPanel;
    btnFechar: TSpeedButton;
    pnlImgAlert: TPanel;
    pnlMensagem: TPanel;
    lblMensagem: TLabel;
    pnlBotoes: TPanel;
    pnlPropaganda: TPanel;
    lblPropaganda: TLabel;
    imgTitulo: TImage;
    btnOK: TBitBtn;
    btnSim: TBitBtn;
    btnNao: TBitBtn;
    imgDeletar: TImage;
    imgQuestao: TImage;
    imgCuidado: TImage;
    imgInformacao: TImage;
    imgErro: TImage;
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imgTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Mensagem(Texto: String; Tipo: Char; Botoes: array of TMyButtons): Boolean;
  end;

var
  F_msg: TF_msg;

const
  LeftButtons : array[0..2] of integer = (258, 178, 97);    //serve para posicionar os botoes
  Titulo : String = 'CIEC';

implementation

{$R *.dfm}

class function TF_msg.Mensagem(Texto: String; Tipo: Char;
  Botoes: array of TMyButtons): Boolean;
var
  i: Integer;
  frm :TF_msg;
begin
  frm := TF_msg.Create(nil);

  try
    frm.lblMensagem.Caption := Texto;
    frm.Caption := TITULO;

    for i:=0 to Length(Botoes)-1 do
    begin
      case (Botoes[i]) of
        mbOk: begin
                frm.BtnOK.Visible := True;
//                frm.BtnOK.Left := LEFTBUTTONS[i];  (a forma de baixo fica melhor)
                frm.btnOK.Align := alRight;
                frm.btnOK.AlignWithMargins := True;
              end;
        mbSim: begin
                 frm.btnSim.Visible := True;
//                 frm.btnSim.Left := LEFTBUTTONS[i];
                frm.btnSim.Align := alRight;
                frm.btnSim.AlignWithMargins := True;
               end;
        mbNao: begin
                 frm.BtnNao.Visible := True;
//                 frm.BtnNao.Left := LEFTBUTTONS[i];
                frm.BtnNao.Align := alRight;
                frm.BtnNao.AlignWithMargins := True;
               end;
        else begin
          frm.BtnOK.Visible := True;
//          frm.BtnOK.Left := LEFTBUTTONS[i];
            frm.BtnOK.Align := alRight;
            frm.BtnOK.AlignWithMargins := True;
        end;
      end;
    end;

    case (Tipo) of
      'I': frm.imgInformacao.Visible := True;   //Informação
      'D': frm.imgDeletar.Visible := True;      //Deletar
      'Q': frm.imgQuestao.Visible := True;      //Questão
      'C': frm.imgCuidado.Visible := True;      //Cuidado
      'E': frm.imgErro.Visible := True;         //Erro
      else
        frm.imgInformacao.Visible := True;
    end;

    frm.ShowModal;

    case (frm.ModalResult) of
      mrOk, mrYes : result := True;
      else
        result := False;
    end;

  finally
    if (frm<>nil) then
      FreeAndNil(frm);
  end;
end;


procedure TF_msg.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TF_msg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin//desabilitando o Alt + F4
  if (ssAlt in Shift) and (Key = VK_F4) then begin
    Key := 0;
  end;
end;

procedure TF_msg.imgTituloMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);   {move o form sem as bordas}
const
   sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
