unit UMovIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, Data.DB,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, Vcl.StdCtrls,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, cxPC, Vcl.Buttons,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinLilian,
  dxSkinOffice2007Black, dxSkinOffice2010Black, dxSkinVisualStudio2013Blue,
  dxSkinXmas2008Blue;

type
  TF_movIO = class(TForm)
    DS_entrada: TDataSource;
    DS_saida: TDataSource;
    pnlGeral: TPanel;
    pnlDados: TPanel;
    pagMov: TcxPageControl;
    tabEntrada: TcxTabSheet;
    DBGrid_entrada: TDBGrid;
    pnlEntra: TPanel;
    btnImprimeEntrada: TSpeedButton;
    tabSaida: TcxTabSheet;
    DBGrid_saida: TDBGrid;
    pnlSaida: TPanel;
    pnlTopo: TPanel;
    pnlFechar: TPanel;
    btnMaximizar: TSpeedButton;
    btnFechar: TSpeedButton;
    btnImprimeSaida: TSpeedButton;
    pnlResultado: TPanel;
    edtVlrNSaida: TcxCurrencyEdit;
    edtVlrESaida: TcxCurrencyEdit;
    lblVlrESaida: TLabel;
    lblVlrGSaida: TLabel;
    imgSaida: TImage;
    pnlResultadoEntrada: TPanel;
    lblGNormal: TLabel;
    edtVlrGNormal: TcxCurrencyEdit;
    lblGExtra: TLabel;
    edtVlrGExtra: TcxCurrencyEdit;
    imgResultado: TImage;
    lblTitulo: TLabel;
    imgPesquisa: TImage;
    imgData: TImage;
    lblDtaIni: TLabel;
    lblDtaFinal: TLabel;
    btnPesquisar: TButton;
    edtPesquisa: TcxTextEdit;
    dtaInicio: TcxDateEdit;
    dtaFinal: TcxDateEdit;
    edtTotalSaida: TcxCurrencyEdit;
    lblTotalGSaida: TLabel;
    edtTGeral: TcxCurrencyEdit;
    lblTGeral: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMaximizarClick(Sender: TObject);
    procedure pnlTopoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGrid_entradaCellClick(Column: TColumn);
    procedure DBGrid_saidaCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_movIO: TF_movIO;

implementation

{$R *.dfm}

uses UDMMovEntradaSaida, UMsg;

procedure TF_movIO.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TF_movIO.btnMaximizarClick(Sender: TObject);
begin{maximizar - restaurar}
  if IsZoomed(F_movIO.Handle) then begin
    F_movIO.WindowState := wsNormal;
  end
  else begin
    F_movIO.WindowState := wsMaximized;
  end;
end;

procedure TF_movIO.btnPesquisarClick(Sender: TObject);
begin {inicio da entrada}

{Passa os valores para as variáveis}
  edtVlrGNormal.Value   := 0;
  edtVlrGExtra.Value    := 0;
  edtTGeral.Value       := 0;

  edtVlrNSaida.Value    := 0;
  edtVlrESaida.Value    := 0;
  edtTotalSaida.Value   := 0;

 F_dmMovimentacao.QRY_movEntrada.Close;
 F_dmMovimentacao.QRY_movSaida.Close;

 if pagMov.ActivePage = tabEntrada then begin
   {$REGION 'Entrada'}
     if edtPesquisa.Text = '' then begin

      edtVlrGNormal.Value   := 0;
      edtVlrGExtra.Value    := 0;
      edtTGeral.Value       := 0;

      {pesquisa entre as datas ignorando o cliente}
      with F_dmMovimentacao.QRY_movEntrada do begin
        Close;
        SQL.Clear;
        SQL.Add('select cl.cli_razao, eh.* from hotentrahospede eh');
        SQL.Add('inner join cliente cl on (eh.ent_codhospede = cl.cli_codigo)');
        SQL.Add('where eh.ent_datasaida is null  and eh.ent_dataentrada between :dtaIni and :dtaFin order by 1');
        ParamByName('dtaIni').Value := dtaInicio.Date;
        ParamByName('dtaFin').Value := dtaFinal.Date;
        Open();
      end;
      DS_entrada.DataSet.First;
      while not DS_entrada.DataSet.Eof do begin
        edtVlrGNormal.Value  := edtVlrGNormal.Value + (F_dmMovimentacao.QRY_movEntradaENT_VLR_DIARIA_NORMAL.AsCurrency * F_dmMovimentacao.QRY_movEntradaENT_QTD_DIARIA_NORMAL.AsInteger);
        edtVlrGExtra.Value   := edtVlrGExtra.Value + (F_dmMovimentacao.QRY_movEntradaENT_VLR_DIARIA_EXTRA.AsCurrency * F_dmMovimentacao.QRY_movEntradaENT_QTD_DIARIA_EXTRA.AsInteger);
        DS_entrada.DataSet.Next;
      end;
        edtTGeral.Value := edtVlrGNormal.Value + edtVlrGExtra.Value;
     end

     else begin

      edtVlrGNormal.Value   := 0;
      edtVlrGExtra.Value    := 0;
      edtTGeral.Value       := 0;

      {pesquisa entre as datas e pelo cliente digitado}
      with F_dmMovimentacao.QRY_movEntrada do begin
        Close;
        SQL.Clear;
        SQL.Add('select cl.cli_razao, eh.* from hotentrahospede eh');
        SQL.Add('inner join cliente cl on (eh.ent_codhospede = cl.cli_codigo)');
        SQL.Add('where eh.ent_datasaida is null  and en.ent_dataentrada between :dtaIni and :dtaFin');
        SQL.Add('and cl.cli_razao like :nomeCliente order by 1');
        ParamByName('dtaIni').Value      := dtaInicio.Date;
        ParamByName('dtaFin').Value      := dtaFinal.Date;
        ParamByName('nomeCliente').Value := '%' + edtPesquisa.Text + '%';
        Open();
      end;
      DS_entrada.DataSet.First;
      while not DS_entrada.DataSet.Eof do begin
        edtVlrGNormal.Value  := edtVlrGNormal.Value + (F_dmMovimentacao.QRY_movEntradaENT_VLR_DIARIA_NORMAL.AsCurrency * F_dmMovimentacao.QRY_movEntradaENT_QTD_DIARIA_NORMAL.AsInteger);
        edtVlrGExtra.Value   := edtVlrGExtra.Value + (F_dmMovimentacao.QRY_movEntradaENT_VLR_DIARIA_EXTRA.AsCurrency * F_dmMovimentacao.QRY_movEntradaENT_QTD_DIARIA_EXTRA.AsInteger);
        DS_entrada.DataSet.Next;
      end;
        edtTGeral.Value := edtVlrGNormal.Value + edtVlrGExtra.Value;
     end;
     if F_dmMovimentacao.QRY_movEntrada.RecordCount < 1 then begin
        TF_msg.Mensagem('Não foi encontrado movimento nesse período.','I',[mbOk]);
      edtPesquisa.SetFocus;
     end;
   {$ENDREGION}
 end {inicio da saida}
 else begin
   {$REGION 'Saida'}
     if edtPesquisa.Text = '' then begin

      edtVlrNSaida.Value    := 0;
      edtVlrESaida.Value    := 0;
      edtTotalSaida.Value   := 0;

      {pesquisa entre as datas ignorando o cliente}
      with F_dmMovimentacao.QRY_movSaida do begin
        Close;
        SQL.Clear;
        SQL.Add('select cl.cli_razao, eh.* from hotentrahospede eh');
        SQL.Add('inner join cliente cl on (eh.ent_codhospede = cl.cli_codigo)');
        SQL.Add('where eh.ent_datasaida is not null  and eh.ent_datasaida between :dtaIni and :dtaFin order by 1');
        ParamByName('dtaIni').Value := dtaInicio.Date;
        ParamByName('dtaFin').Value := dtaFinal.Date;
        Open();
      end;
      DS_saida.DataSet.First;
      while not DS_saida.DataSet.Eof do begin
        edtVlrNSaida.Value   := edtVlrNSaida.Value + (F_dmMovimentacao.QRY_movSaidaENT_VLR_DIARIA_NORMAL.AsCurrency * F_dmMovimentacao.QRY_movSaidaENT_QTD_DIARIA_NORMAL.AsInteger);
        edtVlrESaida.Value   := edtVlrESaida.Value + (F_dmMovimentacao.QRY_movSaidaENT_VLR_DIARIA_EXTRA.AsCurrency * F_dmMovimentacao.QRY_movSaidaENT_QTD_DIARIA_EXTRA.AsInteger);
        DS_saida.DataSet.Next;
      end;

      edtTotalSaida.Value := edtVlrNSaida.Value + edtVlrESaida.Value;

     end
     else begin

      edtVlrNSaida.Value    := 0;
      edtVlrESaida.Value    := 0;
      edtTotalSaida.Value   := 0;

      {pesquisa entre as datas e pelo cliente digitado}
      with F_dmMovimentacao.QRY_movSaida do begin
        Close;
        SQL.Clear;
        SQL.Add('select cl.cli_razao, eh.* from hotentrahospede eh');
        SQL.Add('inner join cliente cl on (eh.ent_codhospede = cl.cli_codigo)');
        SQL.Add('where eh.ent_datasaida is not null and eh.ent_datasaida between :dtaIni and :dtaFin');
        SQL.Add('and cl.cli_razao like :nomeCliente order by 1');
        ParamByName('dtaIni').Value      := dtaInicio.Date;
        ParamByName('dtaFin').Value      := dtaFinal.Date;
        ParamByName('nomeCliente').Value := '%' + edtPesquisa.Text + '%';
        Open();
      end;
      DS_saida.DataSet.First;
      while not DS_saida.DataSet.Eof do begin
        edtVlrNSaida.Value   := edtVlrNSaida.Value + (F_dmMovimentacao.QRY_movSaidaENT_VLR_DIARIA_NORMAL.AsCurrency * F_dmMovimentacao.QRY_movSaidaENT_QTD_DIARIA_NORMAL.AsInteger);
        edtVlrESaida.Value   := edtVlrESaida.Value + (F_dmMovimentacao.QRY_movSaidaENT_VLR_DIARIA_EXTRA.AsCurrency * F_dmMovimentacao.QRY_movSaidaENT_QTD_DIARIA_EXTRA.AsInteger);
        DS_saida.DataSet.Next;
      end;
      edtTotalSaida.Value := edtVlrNSaida.Value + edtVlrESaida.Value;
     end;

     if F_dmMovimentacao.QRY_movSaida.RecordCount < 1 then begin
        TF_msg.Mensagem('Não foi encontrado movimento nesse período.','I',[mbOk]);
      edtPesquisa.SetFocus;
     end;
   {$ENDREGION}
 end;
end;

procedure TF_movIO.DBGrid_entradaCellClick(Column: TColumn);
begin {mostra o total da linha clicada - entrada}
  edtVlrGNormal.Value  := F_dmMovimentacao.QRY_movEntradaENT_VLR_DIARIA_NORMAL.AsCurrency * F_dmMovimentacao.QRY_movEntradaENT_QTD_DIARIA_NORMAL.AsInteger;
  edtVlrGExtra.Value   := F_dmMovimentacao.QRY_movEntradaENT_VLR_DIARIA_EXTRA.AsCurrency * F_dmMovimentacao.QRY_movEntradaENT_QTD_DIARIA_EXTRA.AsInteger;
  edtTGeral.Value      := edtVlrGNormal.Value + edtVlrGExtra.Value;
end;

procedure TF_movIO.DBGrid_saidaCellClick(Column: TColumn);
begin {mostra o total da linha clicada - saida}
  edtVlrNSaida.Value   := F_dmMovimentacao.QRY_movSaidaENT_VLR_DIARIA_NORMAL.AsCurrency * F_dmMovimentacao.QRY_movSaidaENT_QTD_DIARIA_NORMAL.AsInteger;
  edtVlrESaida.Value   := F_dmMovimentacao.QRY_movSaidaENT_VLR_DIARIA_EXTRA.AsCurrency * F_dmMovimentacao.QRY_movSaidaENT_QTD_DIARIA_EXTRA.AsInteger;
  edtTotalSaida.Value  := edtVlrNSaida.Value + edtVlrESaida.Value;
end;

procedure TF_movIO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(F_dmMovimentacao);
end;

procedure TF_movIO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then begin
    Self.Close;
  end;
end;

procedure TF_movIO.FormShow(Sender: TObject);
begin
  if F_dmMovimentacao = nil then begin
    Application.CreateForm(TF_dmMovimentacao, F_dmMovimentacao);
  end;

  pagMov.ActivePage := tabEntrada;

  {Informações controles}
  edtPesquisa.SetFocus;
  dtaInicio.Date := Now;
  dtaFinal.Date  := Now;

  {Abre os DataSets}
  DS_entrada.DataSet.Open();
  DS_saida.DataSet.Open();

  {Passa os valores para as variáveis}
  edtVlrGNormal.Value   := 0;
  edtVlrGExtra.Value    := 0;
  edtTGeral.Value       := 0;

  edtVlrNSaida.Value    := 0;
  edtVlrESaida.Value    := 0;
  edtTotalSaida.Value   := 0;
end;

procedure TF_movIO.pnlTopoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
