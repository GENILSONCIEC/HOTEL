unit UHospedeDoApto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit;

type
  TF_hospedeDoApto = class(TF_baseTelaSimples)
    edtCliente: TcxTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_hospedeDoApto: TF_hospedeDoApto;

implementation

{$R *.dfm}

end.
