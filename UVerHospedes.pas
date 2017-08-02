unit UVerHospedes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinLilian, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TF_verHospedes = class(TF_baseTelaSimples)
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    pnlConteudo: TPanel;
    DBGridVerHospedes: TcxGrid;
    verHospedes: TcxGridDBTableView;
    cxGridLevelVH: TcxGridLevel;
    edtCodigo: TcxGridDBColumn;
    edtRazao: TcxGridDBColumn;
    DS_verEntraHospede2: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_verHospedes: TF_verHospedes;

implementation

{$R *.dfm}

uses UDMHospedes, UCheckIn, UDMRackApto, URackApto;

procedure TF_verHospedes.FormShow(Sender: TObject);
begin
  inherited;

  {verificar se o status é ocupado ou reservado}

  with F_dmHospedes.QRY_EntraHospede2 do begin
    Close;
    SQL.Clear;
    SQL.Add('select eh2.* from hotentrahospede eh inner join hotentrahospede2 eh2');
    SQL.Add(' on (eh.ent_codentrada = eh2.ent_codentrada2)');
    SQL.Add(' where eh.ent_codentrada = :codEntrada and eh.ent_status = :status');
    ParamByName('codEntrada').Value := StrToInt(CodEntrada);
    ParamByName('status').Value := 'OCUPADO';
    Open();
  end;
end;

end.
