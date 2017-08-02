unit UFJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TF_fj = class(TF_baseTelaSimples)
    btnF: TSpeedButton;
    btnJ: TSpeedButton;
    procedure btnFClick(Sender: TObject);
    procedure btnJClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var conFJ: String;
  end;

var
  F_fj: TF_fj;

implementation

{$R *.dfm}

uses UFunctions, UCadHospedesFJ;

procedure TF_fj.btnFClick(Sender: TObject);
begin  {física}
  inherited;
  conFJ := 'F';
  CriaFormDestroy(TF_cadHospedesFJ, F_cadHospedesFJ);

end;

procedure TF_fj.btnJClick(Sender: TObject);
begin {jurídica}
  inherited;
  conFJ := 'J';
  CriaFormDestroy(TF_cadHospedesFJ, F_cadHospedesFJ);
end;

end.
