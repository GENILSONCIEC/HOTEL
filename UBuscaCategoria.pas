unit UBuscaCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, dxGDIPlusClasses;

type
  TF_buscaCategoria = class(TF_baseTelaSimples)
    pnlControle: TPanel;
    pnlPesquisa: TPanel;
    pnlDados: TPanel;
    lblTitulo: TLabel;
    edtPesquisar: TEdit;
    btnCadCategoria: TSpeedButton;
    btnSelecionar: TSpeedButton;
    DBG_consulta: TDBGrid;
    DS_categoria: TDataSource;
    imgBack: TImage;
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_buscaCategoria: TF_buscaCategoria;

implementation

{$R *.dfm}

uses UDMCategoria, UCadApto, UMsg;

procedure TF_buscaCategoria.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//Fazendo a busca - consulta (ao precionar enter)
  if key = #13 then begin
    with F_dmCategoria.QRY_cadConCategoria do begin
      Close;
      SQL.Clear;
      SQL.Add('select * from hotcategoria where cat_categoria like :categoria');
      ParamByName('categoria').Value := '%' + edtPesquisar.Text + '%';
      Open();
//          FetchAll;  mostrar todos pq o firedac mostra 52 por padrão

      if RecordCount = 0 then begin
        TF_msg.Mensagem('Categoria não encontrada','I',[mbOk]);
        TEdit(Sender).SetFocus;
        exit;
      end;
    end; //fim do width
  DBG_consulta.SetFocus;
  end; //fim do key press
end;

procedure TF_buscaCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(F_dmCategoria);
  F_buscaCategoria := nil;
end;

procedure TF_buscaCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  if F_dmCategoria = nil then begin
    Application.CreateForm(TF_dmCategoria, F_dmCategoria);
  end;
end;

procedure TF_buscaCategoria.FormShow(Sender: TObject);
begin
  inherited;
  DBG_consulta.Columns[0].Width := 80;
end;

end.
