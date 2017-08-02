unit URackApto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCGrids, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Data.DB, Vcl.DBCtrls,

  //units declaradas
  UFunctions, dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxCurrencyEdit, cxTextEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, UCBase, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinLilian, dxSkinOffice2007Black,
  dxSkinOffice2010Black, dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue,
  uImportExcel;

type
  TF_rackApto = class(TForm)
    DBCtrlGrid: TDBCtrlGrid;
    pnlControle: TPanel;
    btnFechar: TSpeedButton;
    lblDescricao: TLabel;
    DS_rackApto: TDataSource;
    pnlBtnRodape: TPanel;
    pnlPropaganda: TPanel;
    lblCiec: TLabel;
    lblCiecFone: TLabel;
    btnCheckIn: TSpeedButton;
    pnlFundo: TPanel;
    pnlApto: TPanel;
    txtApto: TDBText;
    pnlImg: TPanel;
    pnlValores: TPanel;
    lblDiaria: TLabel;
    txtDiaria: TDBText;
    lblExtra: TLabel;
    txtExtra: TDBText;
    txtCategoria: TDBText;
    imgApto: TImage;
    pnlDetalheHospede: TPanel;
    pnlTopo: TPanel;
    imgTitulo: TImage;
    pnlBotao: TPanel;
    btnFecharPainel: TSpeedButton;
    pnlRodapePainel: TPanel;
    lblPropaganda: TLabel;
    pnlDadosPainel: TPanel;
    edtCliente: TcxTextEdit;
    edtCodCli: TcxCurrencyEdit;
    lblCodCli: TLabel;
    lblCliente: TLabel;
    lblDtaEntrada: TLabel;
    lblHoraEntrada: TLabel;
    edtHoraEntrada: TcxCurrencyEdit;
    imgBack: TImage;
    dtaEntrada: TcxCurrencyEdit;
    UCControls: TUCControls;
    pnlUsuarioLogado: TPanel;
    lblUserLogado: TLabel;
    lblImpressoraPadrao: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBCtrlGridPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure DS_rackAptoDataChange(Sender: TObject; Field: TField);
    procedure btnCheckInClick(Sender: TObject);
    procedure pnlFundoClick(Sender: TObject);
    procedure DBCtrlGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imgAptoClick(Sender: TObject);
    procedure btnFecharPainelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_rackApto: TF_rackApto;

implementation

{$R *.dfm}

uses UDMRackApto, UEntraHospede, UDMParametro, UFechaHospedes, UMsg,UCheckIn, ULancaProdutos,
UReservaApto, UEfetivaReserva,
  UDMHospedes, UPrincipal;

procedure TF_rackApto.btnCheckInClick(Sender: TObject);
begin
  {quando ativar essa tela, tratar os botões principalmente não deixar fechar aptos que estao apenas reservados.}
  CriaFormDestroy(TF_checkIn, F_checkIn);
end;

procedure TF_rackApto.btnFecharClick(Sender: TObject);
begin
  F_rackApto.Close;
end;

procedure TF_rackApto.btnFecharPainelClick(Sender: TObject);
begin
  {tem que dar um clean em todos os componentes do painel}
  edtCodCli.Clear;
  edtCliente.Clear;
  dtaEntrada.Clear;
  edtHoraEntrada.Clear;
  pnlDetalheHospede.Visible := False;
end;

procedure TF_rackApto.DBCtrlGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var contador : Integer;
begin  //Não deixa passar do último registro apertando seta para direita
  if key = VK_RIGHT then begin
   contador := F_dmRackApto.QRY_rackApto.RecordCount - 1;
    if DBCtrlGrid.PanelIndex = contador then begin
      TF_msg.Mensagem('Esse é o último Apartamento do sistema. Não poderá avançar!','I',[mbOk]);
      Abort;
    end;
  end;
end;

procedure TF_rackApto.DBCtrlGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
 Var NomeImg : String;
begin  //Escolhe a Img do Apto (Situação)
//  If F_dmRackApto.QRY_rackAptoAPA_SITUACAO.Value = 'LIVRE' Then
//      NomeImg := ExtractFilePath( Application.ExeName ) + '\imgs\Apto\open.png'
//    Else
//      NomeImg := ExtractFilePath( Application.ExeName ) + '\imgs\Apto\closed.png';
//      imgApto.Picture.LoadFromFile(NomeImg);



If F_dmRackApto.QRY_rackAptoAPA_SITUACAO.Value = 'LIVRE' Then begin
  NomeImg := ExtractFilePath( Application.ExeName ) + '\imgs\Apto\livre.png'
end;

If F_dmRackApto.QRY_rackAptoAPA_SITUACAO.Value = 'OCUPADO' Then begin
  NomeImg := ExtractFilePath( Application.ExeName ) + '\imgs\Apto\ocupado.png';
end;

If F_dmRackApto.QRY_rackAptoAPA_SITUACAO.Value = 'RESERVADO' Then begin
  NomeImg := ExtractFilePath( Application.ExeName ) + '\imgs\Apto\reservado.png';
end;

  imgApto.Picture.LoadFromFile(NomeImg);
  DBCtrlGrid.SelectedColor := clRed; //jamais apaga essa porra.

end;

procedure TF_rackApto.pnlFundoClick(Sender: TObject);
begin //ao clicar em cada celula, pinta a mesma de vermelho
  DBCtrlGrid.SelectedColor := clYellow;
end;


procedure TF_rackApto.DS_rackAptoDataChange(Sender: TObject; Field: TField);
begin  //tira a barra de rolagem
  ShowScrollBar(F_rackApto.DBCtrlGrid.handle, SB_VERT, False);
end;

procedure TF_rackApto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_dmRackApto.Destroy;
  FreeAndNil(F_dmParametro);
  FreeAndNil(F_dmHospedes);
end;

procedure TF_rackApto.FormCreate(Sender: TObject);
begin//cria o dmRackApto
  if F_dmRackApto = nil then begin
    Application.CreateForm(TF_dmRackApto, F_dmRackApto);
  end;

  //cria o dmParametro
  if F_dmParametro = nil then begin
    Application.CreateForm(TF_dmParametro, F_dmParametro);
  end;

  {cria o dmHospedes}
  if F_dmHospedes = nil then begin
    Application.CreateForm(TF_dmHospedes, F_dmHospedes);
  end;
end;

procedure TF_rackApto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then begin
    if pnlDetalheHospede.Visible = True then begin
      btnFecharPainel.Click;
    end
    else begin
      Self.Close;
    end;
  end;

  if key = VK_F1 then begin
    btnCheckIn.Click;
  end;
end;

procedure TF_rackApto.FormShow(Sender: TObject);
var
  colunas, linhas:Integer;
begin
  lblUserLogado.Caption       := 'Usuário: '+ F_principal.UserControl.CurrentUser.UserName;
  lblImpressoraPadrao.Caption := 'Impressora Padrão: '+ GetImpressoraPadrao;
  with F_dmParametro.QRY_parametro do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from hotparametro');
    Open();
  end;

  if F_dmParametro.QRY_parametro.RecordCount > 0 then begin
    //coloca os parametros de linhas e colunas na grid
    colunas := StrToInt(F_dmParametro.QRY_parametroPA_COLUNA.AsString);
    linhas := StrToInt(F_dmParametro.QRY_parametroPA_LINHAS.AsString);

    DBCtrlGrid.ColCount := colunas;
    DBCtrlGrid.RowCount := linhas;

  end
  else begin
    DBCtrlGrid.ColCount := 8;  //colunas
    DBCtrlGrid.RowCount := 5;  //linhas
  end;

  OrdenaLista;  //ja tem o select no F_dmRackApto

end;

procedure TF_rackApto.imgAptoClick(Sender: TObject);
  var pt: TPoint;
       larg, posi, novaLargura: Integer;
begin {Mostra o hóspede que está naquele apto}
  try
    if F_dmHospedes = nil then begin
      Application.CreateForm(TF_dmHospedes, F_dmHospedes);
    end;

    if Livre = False then begin
      with F_dmHospedes.QRY_pnlDetalheHospedePanel do begin
        Close;
        SQL.Clear;
        SQL.Add('select cl.cli_codigo, cl.cli_razao, cl.cli_fanta,eh.ent_codapartamento, eh.ent_codentrada, eh.ent_dataentrada,');
        SQL.Add('eh.ent_horaentrada, eh.ent_qtd_diaria_extra, eh.ent_vlr_diaria_extra, eh.ent_vlr_diaria_normal, eh.ent_status, eh.ent_datareserva, eh.ent_horareserva,');
        SQL.Add('eh.ent_qtd_diaria_normal from cliente cl');
        SQL.Add('inner join hotentrahospede eh');
        SQL.Add('on (cl.cli_codigo = eh.ent_codhospede)');
        SQL.Add('where eh.ent_codapartamento = :codApto and (eh.ent_status = :status or eh.ent_status = :status2)');
        ParamByName('codApto').Value := CodApartamento;
        ParamByName('status').Value := 'OCUPADO';
        ParamByName('status2').Value := 'RESERVADO';
        Open();
      end;

      if F_dmHospedes.QRY_pnlDetalheHospedePanel.RecordCount > 0 then begin

        if F_dmHospedes.QRY_pnlDetalheHospedePanelENT_STATUS.AsString = 'OCUPADO' then begin
          edtCodCli.Text            := F_dmHospedes.QRY_pnlDetalheHospedePanelCLI_CODIGO.AsString;
          edtCliente.Text           := F_dmHospedes.QRY_pnlDetalheHospedePanelCLI_RAZAO.AsString;
          dtaEntrada.Text           := DateToStr(F_dmHospedes.QRY_pnlDetalheHospedePanelENT_DATAENTRADA.Value);
          edtHoraEntrada.Text       := TimeToStr(F_dmHospedes.QRY_pnlDetalheHospedePanelENT_HORAENTRADA.AsDateTime);
          lblDtaEntrada.Caption     := 'Data Entrada';
          lblHoraEntrada.Caption    := 'Hora Entrada';
        end
        else begin
          lblDtaEntrada.Caption     := 'Data Reserva';
          lblHoraEntrada.Caption    := 'Hora Reserva';
          edtCodCli.Text            := F_dmHospedes.QRY_pnlDetalheHospedePanelCLI_CODIGO.AsString;
          edtCliente.Text           := F_dmHospedes.QRY_pnlDetalheHospedePanelCLI_RAZAO.AsString;
          dtaEntrada.Text           := DateToStr(F_dmHospedes.QRY_pnlDetalheHospedePanelENT_DATARESERVA.Value);
          edtHoraEntrada.Text       := TimeToStr(F_dmHospedes.QRY_pnlDetalheHospedePanelENT_HORARESERVA.Value);
        end;

        GetCursorPos(pt);

        pnlDetalheHospede.Top     := pt.Y;  {altura}
      //  pnlDetalheHospede.Left    := pt.X;   {largura}
      //  pnlDetalheHospede.Visible := True;

        larg        := Screen.Width;   {largura da tela}
        posi        := pt.X;
        novaLargura := larg - posi;

        if novaLargura < pnlDetalheHospede.Width then begin
          pnlDetalheHospede.Left := (larg - pnlDetalheHospede.Width);
        end
        else begin
          pnlDetalheHospede.Left    := posi;
        end;

        {passa os dados para os componentes do painel}

        pnlDetalheHospede.Visible := True;
      end;
    end;
  finally
    FreeAndNil(F_dmHospedes);
  end;
end;

end.



