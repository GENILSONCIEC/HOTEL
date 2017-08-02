unit UCadApto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxGDIPlusClasses, Vcl.Mask,
  Vcl.DBCtrls, System.UITypes, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinLilian,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, cxDBEdit;

type
  TF_cadApto = class(TF_baseTelaSimples)
    pnlControle: TPanel;
    btnDeletar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnNovo: TSpeedButton;
    DS_cadApto: TDataSource;
    btnLocalizar: TSpeedButton;
    pnlCad: TPanel;
    btnCategoria: TSpeedButton;
    lblCategoria: TLabel;
    lblApto: TLabel;
    imgBack: TImage;
    pnlDados: TPanel;
    DBG_dados: TDBGrid;
    DS_verApto: TDataSource;
    edtApto: TcxDBTextEdit;
    edtMarca: TcxDBLookupComboBox;
    DS_verCategoria: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCategoriaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DS_cadAptoStateChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBG_dadosCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_cadApto: TF_cadApto;

implementation

{$R *.dfm}

uses UDMCadApto, UBuscaCategoria, UDMConexao, UMsg;

procedure TF_cadApto.btnCancelarClick(Sender: TObject);
begin //cancelar
  inherited;
  F_dmCadApto.QRY_cadApto.Cancel;
end;

procedure TF_cadApto.btnCategoriaClick(Sender: TObject);
begin
  inherited;
 btnEditar.Click;
  if F_buscaCategoria = nil then begin
    F_buscaCategoria := TF_buscaCategoria.Create(Self);
    F_buscaCategoria.ShowModal;
  end;

end;

procedure TF_cadApto.btnDeletarClick(Sender: TObject);
begin //Deletar
  inherited;
  if TF_msg.Mensagem('Deseja mesmo apagar esse Apto?','I',[mbSim, mbNao]) then
  begin
    F_dmCadApto.QRY_cadApto.Delete;
    F_dmCadApto.QRY_cadApto.ApplyUpdates();
  end;
end;

procedure TF_cadApto.btnEditarClick(Sender: TObject);
begin //editar
  inherited;
  F_dmCadApto.QRY_cadApto.Edit;
end;

procedure TF_cadApto.btnNovoClick(Sender: TObject);
begin  //novo
  inherited;
  F_dmCadApto.QRY_verCategoria.Open();
  F_dmCadApto.QRY_cadApto.Open();
  F_dmCadApto.QRY_cadApto.Append;
    edtApto.SetFocus;
end;

procedure TF_cadApto.btnSalvarClick(Sender: TObject);
begin
  inherited;
  F_dmCadApto.QRY_cadApto.Post;
  F_dmCadApto.QRY_cadApto.ApplyUpdates(0);
end;

procedure TF_cadApto.DBG_dadosCellClick(Column: TColumn);
begin
  inherited;
  F_dmCadApto.QRY_cadApto.Open();
  F_dmCadApto.QRY_cadApto.Locate('apa_codapartamento', F_dmCadApto.QRY_verAptoAPA_CODAPARTAMENTO.Value, []);
  F_dmCadApto.QRY_cadApto.Edit;
end;

procedure TF_cadApto.DS_cadAptoStateChange(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  btnNovo.Enabled := not (DS_cadApto.State in [dsInsert, dsEdit]);
  btnEditar.Enabled := btnNovo.Enabled and (DS_cadApto.DataSet.RecordCount > 0);
  btnDeletar.Enabled := btnEditar.Enabled;
  btnLocalizar.Enabled := btnNovo.Enabled;
  btnSalvar.Enabled := DS_cadApto.State in [dsInsert, dsEdit];
  btnCancelar.Enabled := btnSalvar.Enabled;
  for i := 0 to ComponentCount -1 do
    if Components[i].Tag > 0 then
      TControl(Components[i]).Enabled := DS_cadApto.State in [dsInsert, dsEdit];
end;

procedure TF_cadApto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  F_dmCadApto.Destroy;
end;

procedure TF_cadApto.FormCreate(Sender: TObject);
begin
  inherited;
  if F_dmCadApto = nil then begin
    Application.CreateForm(TF_dmCadApto, F_dmCadApto);
  end;
end;

procedure TF_cadApto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then begin
    btnCategoria.Click;
  end;
end;

procedure TF_cadApto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then begin
    Key := #0;
    //SendMessage(Handle, WM_NEXTDLGCTL, 0,0);  //mais lento
    Perform(WM_NEXTDLGCTL, 0,0); //mais rápido
  end;
end;

procedure TF_cadApto.FormShow(Sender: TObject);
begin
  inherited;
  if F_dmCadApto = nil then begin
    Application.CreateForm(TF_dmCadApto, F_dmCadApto);
  end;

  with F_dmCadApto.QRY_verApto do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from hotapartamento order by APA_CODAPARTAMENTO');
    Open();
  end;
end;

end.
