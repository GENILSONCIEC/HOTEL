unit UCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  dxGDIPlusClasses, Vcl.Buttons;

type
  TF_caixa = class(TF_baseTelaSimples)
    img: TImage;
    pnlControle: TPanel;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnLocalizar: TSpeedButton;
    pnlConteudo: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_caixa: TF_caixa;

implementation

{$R *.dfm}

end.
