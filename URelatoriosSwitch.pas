unit URelatoriosSwitch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBaseRelatoriosSwitch, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxPC,
  Vcl.ButtonGroup, Vcl.Menus, cxButtons, System.ImageList, Vcl.ImgList, Data.DB,
  cxClasses, cxCustomData, cxStyles, cxEdit, cxCustomPivotGrid, cxPivotGrid,
  cxDBPivotGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, UFunctions, Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet, uImportExcel, ComObj,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, dxSkinLilian, StrUtils, System.DateUtils,
  cxCurrencyEdit, frxExportXLSX, frxExportPDF, frxExportHTMLDiv, frxExportText,
  frxExportCSV, frxExportDOCX, frxExportXLS; {Unit tem que ser inserida}

type
  TF_relatoriosSwitch = class(TF_baseRelatorioSwitch)
    lblTitulo: TLabel;
    pgcRelarorios: TcxPageControl;
    tbsAptos: TcxTabSheet;
    tbsCaixa: TcxTabSheet;
    pnlRelAptos: TPanel;
    pnlControleAptos: TPanel;
    pnlConteudoAptos: TPanel;
    btnAptos: TButton;
    ppmAptos: TPopupMenu;
    o1: TMenuItem;
    F1: TMenuItem;
    R1: TMenuItem;
    btnReimpressao: TButton;
    ppmReimpressao: TPopupMenu;
    E1: TMenuItem;
    S1: TMenuItem;
    R2: TMenuItem;
    DS_AptosLivres: TDataSource;
    DS_AptosAbertosPeriodo: TDataSource;
    DS_AptosReservados: TDataSource;
    ImageList20: TImageList;
    ImageList36: TImageList;
    btnImprimir: TSpeedButton;
    btnHospedes: TButton;
    ppmHospedes: TPopupMenu;
    N11: TMenuItem;
    lblTituloRelatorio: TLabel;
    lblTRelatorio: TLabel;
    frxDB_aptosLivres: TfrxDBDataset;
    frxReport: TfrxReport;
    ImportExcel: TImportExcel;
    frxDB_filial: TfrxDBDataset;
    tbsQGDiarias: TcxTabSheet;
    DS_QGDiarias: TDataSource;
    lblMes: TLabel;
    lblAno: TLabel;
    edtNomePlanilha: TcxTextEdit;
    lblNomePlanilha: TLabel;
    btnExportar: TSpeedButton;
    btnGerar: TSpeedButton;
    cxGridExporte: TcxGrid;
    gridQGDiaria: TcxGridDBTableView;
    cxGridExporteLevel: TcxGridLevel;
    edtApto: TcxGridDBColumn;
    edtDtaEnt: TcxGridDBColumn;
    edtVlr: TcxGridDBColumn;
    cxStyleHeader: TcxStyleRepository;
    cxStyle: TcxStyle;
    cxStyle1: TcxStyle;
    DBGridAptosLivres: TcxGrid;
    aptLivres: TcxGridDBTableView;
    cxGridLevelApLivre: TcxGridLevel;
    apLApto: TcxGridDBColumn;
    apLSituacao: TcxGridDBColumn;
    apLCategoria: TcxGridDBColumn;
    apLQtdPessoas: TcxGridDBColumn;
    apLVlrDNormal: TcxGridDBColumn;
    apLVlrDExtra: TcxGridDBColumn;
    DBGridAptosAbertosPeriodo: TcxGrid;
    aptAbertosPeriodo: TcxGridDBTableView;
    apAPCodEnt: TcxGridDBColumn;
    apAPCliCodigo: TcxGridDBColumn;
    apAPCliRazao: TcxGridDBColumn;
    apAPDtaEntrada: TcxGridDBColumn;
    apAPHraEntrada: TcxGridDBColumn;
    apAPVlrDNormal: TcxGridDBColumn;
    cxGridLevelApAbP: TcxGridLevel;
    apAPVlrDExtra: TcxGridDBColumn;
    apAPStatus: TcxGridDBColumn;
    apAPApto: TcxGridDBColumn;
    apAPCategoria: TcxGridDBColumn;
    DBGridAptosReservados: TcxGrid;
    aptReservados: TcxGridDBTableView;
    apRCodEntrada: TcxGridDBColumn;
    apRCodHospede: TcxGridDBColumn;
    apRCliRazao: TcxGridDBColumn;
    apRDtaReserva: TcxGridDBColumn;
    apRHraReserva: TcxGridDBColumn;
    apRStatus: TcxGridDBColumn;
    apRApto: TcxGridDBColumn;
    apRVlrDNormal: TcxGridDBColumn;
    apRVlrDExtra: TcxGridDBColumn;
    cxGridLevelApReser: TcxGridLevel;
    apRCategoria: TcxGridDBColumn;
    frxDB_aptosAbertosPeriodo: TfrxDBDataset;
    frxDB_aptosReservadosPeriodo: TfrxDBDataset;
    edtMes: TcxComboBox;
    edtAno: TcxCurrencyEdit;
    dtaAno: TDateTimePicker;
    frxXLSExport: TfrxXLSExport;
    frxDOCXExport: TfrxDOCXExport;
    frxCSVExport: TfrxCSVExport;
    frxSimpleTextExport: TfrxSimpleTextExport;
    frxHTML5DivExport: TfrxHTML5DivExport;
    frxPDFExport: TfrxPDFExport;
    frxXLSXExport: TfrxXLSXExport;
    procedure o1Click(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure pgcRelaroriosChange(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtMesEnter(Sender: TObject);
    procedure edtAnoExit(Sender: TObject);
    procedure edtMesExit(Sender: TObject);
  private
    { Private declarations }
    procedure OcultaGrid;
    procedure ImprimeRelatorio;
  public
    { Public declarations }
    var
     DtaIni, DtaFin: Variant;
  end;

var
  F_relatoriosSwitch: TF_relatoriosSwitch;

const
  REL_APTOS = 'Rel. " Aptos " N�: ';

implementation

{$R *.dfm}

uses UDMConexao, UDMRelatorios, UMsg, URelAptosReservadosP,
  URelAptosAbertosPeriodoP, URelAptosFechadosPeriodoP;

{Imprime o relatorio da grid ativa}
procedure TF_relatoriosSwitch.ImprimeRelatorio;
 var i: integer;
 begin
  with Screen.ActiveForm do begin
    for i := 0 to ComponentCount -1 do begin
      if (Components[i] is TcxGrid) then begin
        if (Components[i] as TcxGrid).Align = alClient then begin
          {chama o relatorio - Verifica se existe. Caso n�o exista da a msg.}
          if not FileExists(ExtractFilePath(Application.ExeName) + 'RelFR3\'+(Components[i] as TcxGrid).Hint) then begin
            TF_msg.Mensagem('Arquivo "'+VarToStr((Components[i] as TcxGrid).Hint)+'" n�o encontrado. Favor, Chame o Suporte.','I',[mbOk]);
            exit;
          end
          else begin
            frxReport.PrepareReport();
            frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + 'RelFR3\'+(Components[i] as TcxGrid).Hint);

            if ( FileExists(ExtractFilePath(Application.ExeName) + '\imgs\logoRelatorios\logoCliente.jpg') ) then begin
              TfrxPictureView(frxReport.FindComponent('imgLogo')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
                '\imgs\logoRelatorios\logoCliente.jpg');
            end
            else begin
              TF_msg.Mensagem('Logomarca do Relat�rio n�o encontrada. Favor, colocar uma imagem "logoCliente.jpg" na pasta' +
                              '"\imgs\logoRelatorios" nos tamanhos: 400px x 300px.','I',[mbOk]);
            end;

            frxReport.Variables['dtaIni'] := DtaIni;
            frxReport.Variables['dtaFin'] := DtaFin;

            frxReport.ShowReport();

          end;
        end;
      end;
	  end;
  end;
 end;

{Oculta a grid do formulario.}
procedure TF_relatoriosSwitch.OcultaGrid;
var i: Integer;
begin
for i := F_relatoriosSwitch.ComponentCount -1 downto 0 do
  begin
    if (F_relatoriosSwitch.Components[i] is TcxGrid) then begin
      (F_relatoriosSwitch.Components[i] as TcxGrid).Visible := False;
      (F_relatoriosSwitch.Components[i] as TcxGrid).Align   := alNone;
    end;
  end;
end;

procedure TF_relatoriosSwitch.pgcRelaroriosChange(Sender: TObject);
begin  {deixa o bot�o exporta o quadro de di�rias para excel visivel true}
  inherited;
  if pgcRelarorios.ActivePage = tbsQGDiarias then begin
    pnlTopo.Visible     := True;
    edtMes.SetFocus;
    dtaAno.Date := Date;   {pega o ano e fica invis�vel}
    edtAno.Value := YearOf(dtaAno.Date);
    cxGridExporte.Align := alClient;
    cxGridExporte.Visible := True;
    pnlRodape.Visible := False;
  end
  else begin
    pnlTopo.Visible     := False;
    pnlRodape.Visible := True;
  end;
end;

procedure TF_relatoriosSwitch.btnGerarClick(Sender: TObject);
var DiasF: Integer;
begin
  inherited;

  edtNomePlanilha.SetFocus; {Como o bot�o btnGravar n�o receber foco, se o ponteiro estiver no campo edtAno, ele n�o sai de l�.
    consequentemente o evento onExit daquele componente n�o ser� acionado. Para isto foi adicionado esse bot�o que for�ar�
     a sa�da do componente.}

  if edtAno.Focused then
    exit;

  If IsLeapYear(StrToInt(edtAno.Text)) then begin
    if (edtMes.ItemIndex + 1) = 2 then
      DiasF := 29
  end
  else begin
    if (edtMes.ItemIndex + 1) = 2 then
        DiasF := 28
      else  if (edtMes.ItemIndex + 1) in [4,6,9,11] then
        DiasF := 30
      else DiasF := 31;
  end;

  with F_dmRelatorios.QRY_QGDiarias do begin
    Close;
    SQL.Clear;
    SQL.Add('select he.ent_codapartamento, ha.apa_apartamento, he.ent_dataentrada,');
    SQL.Add('   Extract(day from he.ent_dataentrada),  sum(he.ent_vlr_total_diarias) from hotentrahospede he');
    SQL.Add('   inner join hotapartamento ha on (he.ent_codapartamento = ha.apa_codapartamento)');
    SQL.Add('    where ent_dataentrada between :dtaIni and :dtaFin');
    SQL.Add('    group by he.ent_codapartamento, ha.apa_apartamento, he.ent_dataentrada');
    ParamByName('dtaIni').Value     := StrToDate('01/0'+ IntToStr(edtMes.ItemIndex+1)+'/'+CurrToStr(edtAno.Value));
    ParamByName('dtaFin').Value     := StrToDate(IntToStr(DiasF)+'/0'+ IntToStr(edtMes.ItemIndex+1)+'/'+CurrToStr(edtAno.Value));
    Open();
  end;

  if F_dmRelatorios.QRY_QGDiarias.RecordCount < 1 then begin
    TF_msg.Mensagem('N�o teve movimento de Apartamentos nesse M�s.','I',[mbOk]);
  end;

end;

procedure TF_relatoriosSwitch.btnExportarClick(Sender: TObject);
var
  PLANILHA : Variant;
  Linha, nColuna, i, nApto, nDados: Integer;
Begin
 inherited;
 {verifica se tem dados para exportar - Gouveia}
 if F_dmRelatorios.QRY_QGDiarias.RecordCount = 0 then begin
    TF_msg.Mensagem('N�o h� dados para Exportar. Favor, preencha o intervalo de datas e clica no bot�o Gerar.','I',[mbOk]);
  exit;
 end;

 { QRY_consulta -----> minha query  }
 F_dmRelatorios.QRY_QGDiarias.Filtered := False;
 PLANILHA := CreateOleObject('Excel.Application');
 PLANILHA.Caption := 'CIEC HOTELARIA';
 PLANILHA.Visible := False;

// PLANILHA.WorkBooks.add(1); {cria uma planilha do zero}
 PLANILHA.Workbooks.Open(ExtractFilePath(Application.ExeName) + 'ModeloPlanilha\QGERAL.xlsx');  {abre uma planilha pronta - Modelo}

  { TITULO DAS COLUNAS  }
  {primeiro n�mero � a posi��o das colunas. Segundo � a posi��o das linhas - M�todo din�mico - Novo}
  with F_dmRelatorios.QRY_nApto do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from hotapartamento order by 1');
    Open();
  end;

  {qtd. de apto do sistema}
  for i := 1 to F_dmRelatorios.QRY_nApto.RecordCount do begin

    {essa linha enuera os aptos. de um at� n}
//    PLANILHA.Cells[7, i + 2] := 'APTO: '+ IntToStr(i);

    PLANILHA.Cells[7, i + 2] := 'APTO: '+ F_dmRelatorios.QRY_nAptoAPA_APARTAMENTO.AsString;
    F_dmRelatorios.QRY_nApto.Next;   {se a primeira linha tiver ativa, n�o precisa dessa}

  end;

//  PLANILHA.Cells[5, F_dmRelatorios.QRY_nApto.RecordCount + 1] := 'TOTAL';   {para esse exemplo n�o precisa}
  F_dmRelatorios.QRY_QGDiarias.DisableControls;

  { PRRENCHIMENTO DAS C�LULAS COM OS VALORES DOS CAMPOS DA TABELA  }
   Try
    {Pega os valores dos aptos nos dias que o cliente escolheu}

      {J� foi pego quando clicou em gerar. Se nao, aqui deveria ter um select}

    {s� funciona se os ids dos aptos estiverem certinhos. se algum tiver faltando, d� errado.

      solu��o: impedir que o apto seja apagado. apenas inativado.
    }

      F_dmRelatorios.QRY_nApto.First;
      while not F_dmRelatorios.QRY_nApto.Eof  do
      begin
          nColuna := F_dmRelatorios.QRY_nAptoAPA_CODAPARTAMENTO.AsInteger + 2;
          F_dmRelatorios.QRY_QGDiarias.First; {se nao fizer isso, n�o grava duas vezes seguida. Gouveia}
          While not F_dmRelatorios.QRY_QGDiarias.Eof do
          Begin
            if F_dmRelatorios.QRY_QGDiariasENT_CODAPARTAMENTO.AsInteger = F_dmRelatorios.QRY_nAptoAPA_CODAPARTAMENTO.AsInteger then
            begin
              Linha := (F_dmRelatorios.QRY_QGDiariasEXTRACT.AsInteger) + 7;  {posi��o inicial da linha}
              PLANILHA.Cells[Linha, nColuna] := F_dmRelatorios.QRY_QGDiariasSUM.AsCurrency;
            end;
            F_dmRelatorios.QRY_QGDiarias.Next;
          end;
       F_dmRelatorios.QRY_nApto.Next;
      End;

   {Implementa��o para salvar a planilha - Gouveia}
   if edtNomePlanilha.Text = '' then begin
    TF_msg.Mensagem('Aten��o! O Nome da Planilha � Obrigat�rio. Preencha-o e clica novamente no bot�o Exportar.','C',[mbOk]);
    edtNomePlanilha.SetFocus;
    exit;
   end
   else begin

     PLANILHA.ActiveWorkBook.SaveAs(ExtractFilePath(Application.ExeName) + 'ModeloPlanilha\'+ edtNomePlanilha.Text + '.xlsx');
     PLANILHA.ActiveWorkBook.Close; {Fecha o modelo da planilha pronta}

     {abre uma planilha pronta}
     PLANILHA.Workbooks.Open(ExtractFilePath(Application.ExeName) + 'ModeloPlanilha\'+ edtNomePlanilha.Text + '.xlsx');
     PLANILHA.Columns.AutoFit;
     PLANILHA.Visible := True;
   end;

   Finally
      F_dmRelatorios.QRY_QGDiarias.EnableControls;
  //    PLANILHA := Unassigned;    {original}
        PLANILHA := Null;
  //    PLANILHA := EmptyParam;
  //    FreeAndNil(PLANILHA);
   end; { TRY   }
end;

procedure TF_relatoriosSwitch.btnImprimirClick(Sender: TObject);
begin
  inherited;

  ImprimeRelatorio;

end;

procedure TF_relatoriosSwitch.E1Click(Sender: TObject);
begin
  inherited;
  {Rel. Reimpress�o '1 - Entrada'}
end;

procedure TF_relatoriosSwitch.edtAnoExit(Sender: TObject);
begin
  inherited;
  if edtAno.Text = '' then begin
    TF_msg.Mensagem('Ano n�o pode ficar vazio. Favor, informe um ano v�lido.','C',[mbOk]);
    TcxCurrencyEdit(Sender).SetFocus;
    exit;
  end;

  if Length(edtAno.Text) <> 4 then begin
    TF_msg.Mensagem('Formato digitado n�o � um Ano v�lido. Favor, digitar uma informa��o v�lida.','C',[mbOk]);
    TcxCurrencyEdit(Sender).SetFocus;
    exit;
  end;

end;

procedure TF_relatoriosSwitch.edtMesEnter(Sender: TObject);
begin
  inherited;
  if Length((Sender as TcxComboBox).Text) = 0 then begin
  //    SendMessage((Sender as TcxDBComboBox).Handle, CB_SHOWDROPDOWN, 1, 0);
    TcxComboBox(Sender).DroppedDown := True;
  end;
end;

procedure TF_relatoriosSwitch.edtMesExit(Sender: TObject);
begin
  inherited;
  if pgcRelarorios.ActivePage = tbsQGDiarias then begin
    if edtMes.Text = '' then begin
      TF_msg.Mensagem('M�s � um campo obrigat�rio! Favor, escolha um M�s.','C',[mbOk]);
      TcxComboBox(Sender).SetFocus;
      exit;
    end;
  end;
end;

procedure TF_relatoriosSwitch.F1Click(Sender: TObject);
begin
  inherited;
  {Rel. Aptos '2 - Abertos no Per�odo'}
    lblTituloRelatorio.Caption := TMenuItem(Sender).Caption;

    CriaFormDestroy(TF_RelAptosAbertosPeriodoP, F_RelAptosAbertosPeriodoP);

    OcultaGrid;

    DBGridAptosAbertosPeriodo.Visible := True;
    DBGridAptosAbertosPeriodo.Align   := alClient;

end;

procedure TF_relatoriosSwitch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(F_dmRelatorios);
end;

procedure TF_relatoriosSwitch.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then begin
    Key := #0;
    //SendMessage(Handle, WM_NEXTDLGCTL, 0,0);  //mais lento
    Perform(WM_NEXTDLGCTL, 0,0); //mais r�pido
  end;
end;

procedure TF_relatoriosSwitch.FormShow(Sender: TObject);
begin
  inherited;
  pgcRelarorios.ActivePage := tbsAptos;

  if F_dmRelatorios = nil then begin
    Application.CreateForm(TF_dmRelatorios, F_dmRelatorios);
  end;

  F_dmRelatorios.QRY_QGDiarias.Open();
  F_dmRelatorios.QRY_nApto.Open();

end;

procedure TF_relatoriosSwitch.N11Click(Sender: TObject);
begin
  inherited;
  {Rel. Hospedes '1 - Historico clientes'}
end;

procedure TF_relatoriosSwitch.o1Click(Sender: TObject);
begin
  inherited;
  {Rel. Aptos '1 - Livres'}

    lblTituloRelatorio.Caption := TMenuItem(Sender).Caption;

    OcultaGrid;

    with F_dmRelatorios.QRY_relAptosLivres do begin
      Close;
      SQL.Clear;
      SQL.Add('select ap.*, ct.* from hotapartamento ap');
      SQL.Add('    inner join hotcategoria ct on   (ap.apa_codcategoria = ct.cat_codcategoria)');
      SQL.Add('    where ap.apa_situacao = :situacao order by ct.cat_categoria');
      ParamByName('situacao').Value := 'LIVRE';
      Open();
    end;

    DBGridAptosLivres.Visible := True;
    DBGridAptosLivres.Align   := alClient;

    if F_dmRelatorios.QRY_relAptosLivres.RecordCount < 1 then begin
      TF_msg.Mensagem('N�o h� Aptos. Livres! Todos est�o Ocupados.','I',[mbOk]);
    end;

end;

procedure TF_relatoriosSwitch.R1Click(Sender: TObject);
begin
  inherited;
  {Rel. Aptos '3 - Reservados'}

  lblTituloRelatorio.Caption := TMenuItem(Sender).Caption;

  CriaFormDestroy(TF_RelAptosReservadosP, F_RelAptosReservadosP);

  OcultaGrid;

  DBGridAptosReservados.Visible := True;
  DBGridAptosReservados.Align   := alClient;

end;

procedure TF_relatoriosSwitch.R2Click(Sender: TObject);
begin
  inherited;
  {Rel. Reimpress�o '3 - Reserva'}
end;

procedure TF_relatoriosSwitch.S1Click(Sender: TObject);
begin
  inherited;
  {Rel. Reimpress�o '2 - Sa�da'}
end;

end.
