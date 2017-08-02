unit UCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxGDIPlusClasses, Vcl.Mask,
  Vcl.DBCtrls, Vcl.DBActns, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan;

type
  TF_categoria = class(TF_baseTelaSimples)
    pnlControle: TPanel;
    pnlGrid: TPanel;
    DBG_dados: TDBGrid;
    pnlCadastro: TPanel;
    DS_cadCategoria: TDataSource;
    lblCategoria: TLabel;
    edtCategoria: TDBEdit;
    lblQtdPessoas: TLabel;
    edtQtdPessoas: TDBEdit;
    lblVlrDiaria: TLabel;
    edtVlrDiaria: TDBEdit;
    lblVlrDiariaExtra: TLabel;
    edtVlrDiariaExtra: TDBEdit;
    ACM_categoria: TActionManager;
    actNovo: TDataSetInsert;
    actDeletar: TDataSetDelete;
    actEditar: TDataSetEdit;
    actCancelar: TDataSetCancel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnDeletar: TSpeedButton;
    actAtualizar: TDataSetRefresh;
    imgBack: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBG_dadosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_categoria: TF_categoria;

implementation

{$R *.dfm}

uses UDMCategoria, UDMConexao, UMsg;

procedure TF_categoria.DBG_dadosDblClick(Sender: TObject);
begin
  inherited;
  //editar

 // F_dmCategoria.QRY_cadConCategoria.Locate('CAT_CODCATEGORIA', QRY_mostraCategoriaCAT_CODCATEGORIA,[]);

  //ClienteDataSet1.Locate('SUA_COLUNA', edit1.text, [];
end;

procedure TF_categoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  F_dmCategoria.Destroy;
end;

procedure TF_categoria.FormCreate(Sender: TObject);
begin
  inherited;
  if F_dmCategoria = nil then begin
    Application.CreateForm(TF_dmCategoria, F_dmCategoria);
  end;
end;

procedure TF_categoria.FormShow(Sender: TObject);
begin
  inherited;
  F_dmCategoria.QRY_cadConCategoria.Open();
end;

end.
