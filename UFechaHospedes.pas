unit UFechaHospedes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls, UFunctions, Vcl.Imaging.pngimage, DateUtils,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, JvExExtCtrls, JvExtComponent, JvPanel, JvExStdCtrls,
  JvEdit, dxGDIPlusClasses, sPanel, AdvPanel, RzPanel, frxClass, frxDBSet,
  frxDesgn, frxExportPDF, frxExportXLS, acPNG, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxCurrencyEdit, cxDateUtils,
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinLilian, dxSkinOffice2007Black,
  dxSkinOffice2010Black, dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue;

type
  TF_fechaHospedes = class(TF_baseTelaSimples)
    gbxData: TGroupBox;
    gbxDadosHospede: TGroupBox;
    lblDescricaoApto: TLabel;
    lblHospede: TLabel;
    lblDataEnt: TLabel;
    lblVlrDiaria: TLabel;
    pnlDados: TPanel;
    PGC_fechaHospede: TPageControl;
    tabApto: TTabSheet;
    tabBar: TTabSheet;
    tabDiversos: TTabSheet;
    gbxTotais: TGroupBox;
    lblTotExtras: TLabel;
    gbxNormal: TGroupBox;
    lblVlrGeralBar: TLabel;
    lblVlrGeralOutros: TLabel;
    pnlControle: TPanel;
    btnFormasPgto: TSpeedButton;
    DTP_horaParametro: TDateTimePicker;
    DBG_produtos: TDBGrid;
    QRY_proConsumidos: TFDQuery;
    QRY_proConsumidosME2_DOCTO: TStringField;
    QRY_proConsumidosME2_OPERACAO: TSmallintField;
    QRY_proConsumidosME2_DATA: TDateField;
    QRY_proConsumidosME2_QUATIDADE: TBCDField;
    QRY_proConsumidosME2_VLRUNIT: TBCDField;
    QRY_proConsumidosME2_PRONOME: TStringField;
    QRY_proConsumidosME2_DESCONTO: TBCDField;
    QRY_proConsumidosME2_FUNCIONARIO: TIntegerField;
    QRY_proConsumidosME2_COMPLEMENTO: TStringField;
    QRY_proConsumidosME2_PRODUTO: TIntegerField;
    DS_proConsumidos: TDataSource;
    QRY_proConsumidosvlrTotal: TAggregateField;
    QRY_proConsumidosVLR_TOTAL: TCurrencyField;
    imgBackground: TImage;
    lblCodHospede: TLabel;
    lblNomeHospede: TLabel;
    lblApto: TLabel;
    lblDtaEntrada: TLabel;
    DTP_dataEntrada: TDateTimePicker;
    DTP_dataSaida: TDateTimePicker;
    lblVlrDiariaExtra: TLabel;
    lblQtdDiariaExtra: TLabel;
    lblQtdDiariaNormal: TLabel;
    lblHoraEntrada: TLabel;
    lblHraEntrada: TLabel;
    lblTotNormais: TLabel;
    lblTotGeralDiarias: TLabel;
    rgpTolerancia: TRadioGroup;
    pnlTGeral: TPanel;
    lblTotalGeral: TLabel;
    edtVlrDiariaNormal: TcxCurrencyEdit;
    edtQtdDiariasNormais: TcxCurrencyEdit;
    edtVlrDiariaExtra: TcxCurrencyEdit;
    edtQtdDiariaExtra: TcxCurrencyEdit;
    edtTDNormais: TcxCurrencyEdit;
    edtTDExtras: TcxCurrencyEdit;
    edtTGDiarias: TcxCurrencyEdit;
    edtTGBar: TcxCurrencyEdit;
    edtTGOutros: TcxCurrencyEdit;
    edtTGeral: TcxCurrencyEdit;
    gbx: TGroupBox;
    Panel1: TPanel;
    lblData: TLabel;
    lblDtaSaida: TLabel;
    dtaEntrada: TLabel;
    DtaSaida: TLabel;
    Horaparametro: TLabel;
    DTP_horaEntrada: TDateTimePicker;
    HoraEntrada: TLabel;
    DTP_horaSaida: TDateTimePicker;
    HoraSaida: TLabel;
    procedure FormShow(Sender: TObject);
    procedure rgpToleranciaClick(Sender: TObject);
    procedure QRY_proConsumidosCalcFields(DataSet: TDataSet);
    procedure btnFormasPgtoClick(Sender: TObject);
    procedure PGC_fechaHospedeDrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_fechaHospedes: TF_fechaHospedes;

implementation

{$R *.dfm}

uses UDMRackApto, UDMHospedes, UDMCadApto, UDMParametro, UDMConexao, UDMFilial,
  UFormasPgto;

procedure TF_fechaHospedes.btnFormasPgtoClick(Sender: TObject);
begin
  inherited;
  //frxReport.ShowReport();
  CriaFormDestroy(TF_formasPgto, F_formasPgto);
end;

procedure TF_fechaHospedes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    FreeAndNil(F_dmHospedes);
    FreeAndNil(F_dmFilial);
    FreeAndNil(F_dmCadApto);
end;

procedure TF_fechaHospedes.FormCreate(Sender: TObject);
begin
  inherited;
  PGC_fechaHospede.OwnerDraw := True; //para mudar as cores dos títulos do page control
end;

procedure TF_fechaHospedes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then begin
    btnFormasPgto.Click;
  end;
end;

procedure TF_fechaHospedes.FormShow(Sender: TObject);
begin   {onShow}
  inherited;

  lblDtaSaida.Caption    := FormatDateTime('dd/mm/yyyy | hh:mm:ss', Now); //data atual (data da saída)
  PGC_fechaHospede.ActivePage := tabApto;

  //pega o apto
    if F_dmCadApto = nil then begin
      Application.CreateForm(TF_dmCadApto, F_dmCadApto);
    end;

    with F_dmCadApto.QRY_cadApto do begin
      Close;
      SQL.Clear;
      SQL.Add('select * from hotapartamento where apa_codapartamento = :codApto');
      ParamByName('codApto').Value := CodApartamento;
      Open();
    end;
    lblApto.Caption := F_dmCadApto.QRY_cadAptoAPA_APARTAMENTO.AsString;

    //carrega a filial
    if F_dmFilial = nil then begin
      Application.CreateForm(TF_dmFilial, F_dmFilial);
    end;

    with F_dmFilial.QRY_filial do begin
      Close;
      SQL.Clear;
      SQL.Add('select fil_codigo, fil_razao, fil_fanta, fil_cidade, fil_fone, fil_cnpj, fil_endereco, fil_estado from filial');
      Open();
      end;

  //pega o hospede  (baseado no cod. apto)
    if F_dmHospedes = nil then begin
      Application.CreateForm(TF_dmHospedes, F_dmHospedes);
    end;

    with F_dmHospedes.QRY_FechaHospede do begin
      Close;
      SQL.Clear;
      SQL.Add('select cl.cli_codigo, cl.cli_razao, cl.cli_fanta,eh.ent_codapartamento, eh.ent_codentrada,');
      SQL.Add('eh.ent_dataentrada, eh.ent_horaentrada, eh.ent_qtd_diaria_extra, eh.ent_vlr_diaria_extra,');
      SQL.Add('eh.ent_vlr_diaria_normal, eh.ent_qtd_diaria_normal from cliente cl');
      SQL.Add('inner join hotentrahospede eh on (cl.cli_codigo = eh.ent_codhospede)');
      SQL.Add('where eh.ent_codapartamento = :codApto and eh.ent_datasaida is null');
      ParamByName('codApto').Value := CodApartamento;
      Open();
    end;

    //Pega a data e a hora de entrada
    lblDtaEntrada.Caption := DateToStr(F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.Value); //data e hora de entrada do hospede
    lblHraEntrada.Caption := F_dmHospedes.QRY_FechaHospedeENT_HORAENTRADA.AsString; //hora de entrada do hospede

    with F_dmParametro.QRY_parametro do begin
      Close;
      SQL.Clear;
      SQL.Add('select * from hotparametro');
      Open();
    end;

    //para comparar com a hora de saida
    DTP_horaParametro.Time := F_dmParametro.QRY_parametroPA_HORADIARIA.AsDateTime; //var oculta para auxiliar no calculo

    //cabeçalho com dados dos hospedes

    lblCodHospede.Caption            := F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsString;
    lblNomeHospede.Caption           := F_dmHospedes.QRY_FechaHospedeCLI_RAZAO.AsString;
    DTP_dataEntrada.Date             := F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.AsDateTime;
    DTP_horaEntrada.Time             := StrToTime(F_dmHospedes.QRY_FechaHospedeENT_HORAENTRADA.AsString);
    edtVlrDiariaNormal.Value         := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_NORMAL.AsCurrency;

    //pegando os dados da saida
    DTP_dataSaida.Date               := Date; //data atual
    DTP_horaSaida.DateTime           := Now; //hora atual


    {validar se a data de saída é a data de entrada. caso seja, entra em todo o bloco abaixo. caso nao seja, colocar
    um else begin abaixo do bloco de código.}

    {Obs: edtQtdDiariasNormais não poderá ser F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_NORMAL.AsInteger visto que
     as vezes na categoria, o cliente pode definir que a quantidade de pessoas por Apto é por exemplo 3. Nesse caso o
     sistema grava 3 no banco de dados. Isso quer dizer que os tres pagam apenas uma diária. por isso o resultaado é
     sempre 1. Se passarma 10 dias, são 10 diárias e não 10 * 3 que daria 30. Por isso tem que definir apenas 1.

     calculo: 1 * qtdDias que ficou. 1 * 10 = 10 logo, 10 * valor da diaria normal = total.

     14-06-2014}

    if (DaysBetween(DTP_dataEntrada.Date,DTP_dataSaida.Date) <= 1) then begin
      {passa as quantidades}
      edtQtdDiariaExtra.Value       := F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger;
      edtQtdDiariasNormais.Value    := 1;{F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_NORMAL.AsInteger;}

      {passa os valores e multiplica - extras}
      edtVlrDiariaExtra.Value  := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_EXTRA.AsCurrency;
      edtTDExtras.Value := edtVlrDiariaExtra.Value * edtQtdDiariaExtra.Value;

      {passa os valores e multiplica - normais}
      edtTDNormais.Value  := edtQtdDiariasNormais.Value * F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_NORMAL.AsCurrency;
    end
    else begin
      //========================fazendo o calculo das diárias extras======================================

      {se for > que 0 então é pq tem na base. logo, faz os calculos}
      if F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger > 1 then begin
        //verificação para calcular as diárias extras
        DTP_horaSaida.Time := Now();
        if TimeToStr(DTP_horaSaida.Time) <= TimeToStr(DTP_horaParametro.Time) then
        begin
          edtQtdDiariaExtra.Value := DaysBetween(DTP_dataEntrada.Date,DTP_dataSaida.Date)
          * F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger;
        end
        else begin
          edtQtdDiariaExtra.Value := (DaysBetween(DTP_dataEntrada.Date,DTP_dataSaida.Date)
            * F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger)
                + F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger;
        end;
      end;
      //valor das diárias extras
      edtVlrDiariaExtra.Value  := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_EXTRA.AsCurrency;

      if edtQtdDiariaExtra.Value > 0 then begin
        //total das diárias extras
        edtTDExtras.Value := edtVlrDiariaExtra.Value * edtQtdDiariaExtra.Value;
      end
      else begin
        edtTDExtras.Value := 0;
      end;


      //=================================== fazendo o calculo das diárias normais=================================

      //verificação para calcular as diárias normais
      DTP_horaSaida.Time := Now();
      if TimeToStr(DTP_horaSaida.Time) <= TimeToStr(DTP_horaParametro.Time) then
      begin
        edtQtdDiariasNormais.Value := DaysBetween(DTP_dataEntrada.Date,DTP_dataSaida.Date);
      end
      else begin
        edtQtdDiariasNormais.Value := ( DaysBetween(DTP_dataEntrada.Date,DTP_dataSaida.Date)
          * 1) + 1;//F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_NORMAL.AsInteger;
      end;

      //tot. das diárias normais (valores)
      edtTDNormais.Value  := edtQtdDiariasNormais.Value * F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_NORMAL.AsCurrency;
    end;

  //pega o bar (produtos consumidos)
    with QRY_proConsumidos do begin
      Close;
      SQL.Clear;
      SQL.Add('select ME2_DOCTO, ME2_OPERACAO, ME2_DATA, ME2_QUATIDADE, ME2_VLRUNIT,');
      SQL.Add('ME2_PRONOME, ME2_VLRTOTAL, ME2_DESCONTO, ME2_FUNCIONARIO, ME2_COMPLEMENTO, ME2_PRODUTO from mvestoque2');
      SQL.Add('where me2_docto = :codEntrada');
      ParamByName('codEntrada').Value := CodEntrada;
      Open();
    end;

    //essa validação é se não consumir nada, não da erros.
    if QRY_proConsumidos.RecordCount > 0 then begin
      edtTGBar.Value := QRY_proConsumidosvlrTotal.AsVariant;
    end;

    edtTGDiarias.Value := edtTDNormais.Value + edtTDExtras.Value;

  //======================valores da lavanderia e outros================================

  //soma o total geral
  edtTGeral.Value := (edtTGDiarias.Value + edtTGBar.Value + edtTGOutros.Value);     //total geral
end;

procedure TF_fechaHospedes.PGC_fechaHospedeDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin //ao mudar de aba do pagecontrol  //no onCreate do form tem que colocar: PGC_fechaHospede.OwnerDraw:=true;
  inherited;

  case TabIndex of
    0: Control.Canvas.Font.Color:=clgreen;
    1: Control.Canvas.Font.Color:=clred;
    2: Control.Canvas.Font.Color:=clblue;
  end;
  Control.Canvas.TextOut(Rect.left+5,Rect.top+3,PGC_fechaHospede.Pages[tabindex].Caption);
  PGC_fechaHospede.Pages[TabIndex].Font.Color:=Control.Canvas.Font.Color;
end;

procedure TF_fechaHospedes.QRY_proConsumidosCalcFields(DataSet: TDataSet);
begin
  inherited;
  QRY_proConsumidosVLR_TOTAL.Value := (QRY_proConsumidosME2_VLRUNIT.Value - QRY_proConsumidosME2_DESCONTO.Value) *
    QRY_proConsumidosME2_QUATIDADE.Value;
end;

procedure TF_fechaHospedes.rgpToleranciaClick(Sender: TObject);
begin
  inherited; //tolerância de saída
  if rgpTolerancia.ItemIndex=0 then begin
    ShowMessage('sim');
  end
  else begin
    ShowMessage('não');
  end;
end;

end.

