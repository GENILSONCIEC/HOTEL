unit UFechaApto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  dxGDIPlusClasses, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Data.DB, Vcl.Grids,
  Vcl.DBGrids, cxPC, cxClasses, dxSkinsForm, dxSkinsCore, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinLilian, dxSkinOffice2007Black,
  dxSkinOffice2010Black, dxSkinsDefaultPainters, dxSkinVisualStudio2013Blue,
  dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils, cxCurrencyEdit,
  cxTextEdit, cxRadioGroup, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DateUtils;

type
  TF_fechaApto = class(TF_baseTelaSimples)
    pnlTopo: TPanel;
    pnlDados: TPanel;
    pnlRodape: TPanel;
    imgTopo: TImage;
    lblHospede: TLabel;
    lblDtaEntrada: TLabel;
    lblHraEntrada: TLabel;
    lblDtaSaida: TLabel;
    lblHraSaida: TLabel;
    lblApto: TLabel;
    edtHospede: TcxTextEdit;
    edtDtaEntrada: TcxDateEdit;
    edtHraEntrada: TcxCurrencyEdit;
    edtDtaSaida: TcxDateEdit;
    edtHraSaida: TcxCurrencyEdit;
    edtApto: TcxTextEdit;
    pgcFechaApto: TcxPageControl;
    tabApto: TcxTabSheet;
    tabBarConsumo: TcxTabSheet;
    tabOutros: TcxTabSheet;
    pnlFechaApto: TPanel;
    lblVlrDNormal: TLabel;
    lblQtdDNormal: TLabel;
    edtQtdDNormal: TcxCurrencyEdit;
    edtVlrDNormal: TcxCurrencyEdit;
    edtVlrDExtra: TcxCurrencyEdit;
    edtQtdDExtra: TcxCurrencyEdit;
    lblVlrDExtra: TLabel;
    lblQtdDExtra: TLabel;
    lblVlrGNormal: TLabel;
    edtVlrGNormal: TcxCurrencyEdit;
    edtVlrGExtra: TcxCurrencyEdit;
    lblVlrGExtra: TLabel;
    lblVlrGDiarias: TLabel;
    lblVlrGBar: TLabel;
    lblVlrGOutros: TLabel;
    edtVlrGDiarias: TcxCurrencyEdit;
    edtVlrGBar: TcxCurrencyEdit;
    edtVlrGOutros: TcxCurrencyEdit;
    lblTotFatura: TLabel;
    edtVlrTFatura: TcxCurrencyEdit;
    lblHraViraDiaria: TLabel;
    edtHraMudarDiaria: TcxCurrencyEdit;
    edtHraAtual: TcxCurrencyEdit;
    edtHoraExcedida: TcxCurrencyEdit;
    lblHraAtual: TLabel;
    lblTempoExcedido: TLabel;
    lblToleraExcedente: TLabel;
    rbSim: TcxRadioButton;
    rbNao: TcxRadioButton;
    btnFormasPgto: TSpeedButton;
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
    QRY_proConsumidosVLR_TOTAL: TCurrencyField;
    QRY_proConsumidosvlrTotal: TAggregateField;
    hraParametro: TDateTimePicker;
    lblHraParametro: TLabel;
    hraSaida: TDateTimePicker;
    lblHraSaidas: TLabel;
    lblInfoHorario: TLabel;
    DS_produtosConsumidos: TDataSource;
    DBG_produtos: TDBGrid;
    btnTeveTransferencia: TSpeedButton;
    imgFechaApto: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnFormasPgtoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnTeveTransferenciaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var TotDExtra, TotDNormal: Double;
  end;

var
  F_fechaApto: TF_fechaApto;

implementation

{$R *.dfm}

uses UDMHospedes, UDMFilial, UDMCadApto, UDMRackApto, UFunctions, UMsg,
  UDMParametro, UDMConexao, UFormasPgto, UCheckIn;

procedure TF_fechaApto.btnFormasPgtoClick(Sender: TObject);
begin
  inherited;
  CriaFormDestroy(TF_formasPgto, F_formasPgto);
end;

procedure TF_fechaApto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then begin
    btnFormasPgto.Click;
  end;
end;

procedure TF_fechaApto.FormShow(Sender: TObject);
begin  {onShow}
  inherited;

  pgcFechaApto.ActivePage     := tabApto;
  edtDtaSaida.Date            := Date;
  edtHraSaida.Text            := FormatDateTime('hh:mm:ss', Time);

  hraSaida.Time               := Time; {var oculta para calculo}


  {pega o apto}
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

    edtApto.Text := F_dmCadApto.QRY_cadAptoAPA_APARTAMENTO.AsString;

    {carrega a filial}
    if F_dmFilial = nil then begin
      Application.CreateForm(TF_dmFilial, F_dmFilial);
    end;

    with F_dmFilial.QRY_filial do begin
      Close;
      SQL.Clear;
      SQL.Add('select fil_codigo, fil_razao, fil_fanta, fil_cidade, fil_fone, fil_cnpj, fil_endereco, fil_estado from filial');
      Open();
    end;

  {pega o hospede  (baseado no cod. apto)}
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

    {Pega a data e a hora de entrada}
    edtDtaEntrada.Date     := F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.Value; {data e hora de entrada do hospede}
    edtHraEntrada.Text     := F_dmHospedes.QRY_FechaHospedeENT_HORAENTRADA.AsString; {hora de entrada do hospede}

    with F_dmParametro.QRY_parametro do begin
      Close;
      SQL.Clear;
      SQL.Add('select * from hotparametro');
      Open();
    end;

    {para comparar com a hora de saida}
    hraParametro.Time      := F_dmParametro.QRY_parametroPA_HORADIARIA.AsDateTime; //var oculta para auxiliar no calculo
    edtHraMudarDiaria.Text := TimeToStr(hraParametro.Time);
    edtHraAtual.Text       := FormatDateTime('hh:mm:ss', Time);
    edtHoraExcedida.Text   := TimeToStr(hraSaida.Time - hraParametro.Time);

    {(HoursBetween(hraSaida.Time,hraParametro.Time))}

    {criar um campo na tabela parâmetro chamado: par_tolerancia do tipo Time para colocar quantas horas são toleradas}
    if HraSaida.Time <= hraParametro.Time then begin
      lblTempoExcedido.Caption  := 'Tempo Cre.';
      lblInfoHorario.Caption    := 'Está dentro do Horário! '+ edtHoraExcedida.Text;
      lblInfoHorario.Font.Color := clBlack;
    end
    else begin
      lblTempoExcedido.Caption  := 'Tempo Exc.';
      lblInfoHorario.Caption    := 'Excedeu o Horário! '+ edtHoraExcedida.Text;
      lblInfoHorario.Font.Color := clRed;
    end;


    {cabeçalho com dados dos hospedes}

    {lblCodHospede.Caption            := F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsString;}
    edtHospede.Text                  := F_dmHospedes.QRY_FechaHospedeCLI_RAZAO.AsString;
    edtDtaEntrada.Date               := F_dmHospedes.QRY_FechaHospedeENT_DATAENTRADA.AsDateTime;
    edtHraEntrada.Text               := F_dmHospedes.QRY_FechaHospedeENT_HORAENTRADA.AsString;




    {validar se a data de saída é a data de entrada. caso seja, entra em todo o bloco abaixo. caso nao seja, colocar
    um else begin abaixo do bloco de código.}

    {Obs: edtQtdDiariasNormais não poderá ser F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_NORMAL.AsInteger visto que
     as vezes na categoria, o cliente pode definir que a quantidade de pessoas por Apto é por exemplo 3. Nesse caso o
     sistema grava 3 no banco de dados. Isso quer dizer que os tres pagam apenas uma diária. por isso o resultaado é
     sempre 1. Se passarma 10 dias, são 10 diárias e não 10 * 3 que daria 30. Por isso tem que definir apenas 1.

     calculo: 1 * qtdDias que ficou. 1 * 10 = 10 logo, 10 * valor da diaria normal = total.

     14-06-2014}



    if (DaysBetween(edtDtaEntrada.Date,edtDtaSaida.Date) <= 1) then begin
      {passa as quantidades}
      edtQtdDExtra.Value            := F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger;
      edtQtdDNormal.Value           := 1;{F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_NORMAL.AsInteger;}

      {passa os valores e multiplica - extras}
      edtVlrDExtra.Value  := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_EXTRA.AsCurrency;
      edtVlrGExtra.Value  := edtQtdDExtra.Value * edtVlrDExtra.Value;
      TotDExtra           := edtVlrDExtra.Value * edtQtdDExtra.Value;

      {passa os valores e multiplica - normais}
      edtVlrDNormal.Value     := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_NORMAL.AsCurrency;
      edtVlrGNormal.Value     := edtVlrDNormal.Value * edtQtdDNormal.Value;
      TotDNormal              := edtVlrGNormal.Value;
    end
    else begin
      //========================fazendo o calculo das diárias extras======================================

      {se for > que 0 então é pq tem na base. logo, faz os calculos}
      if F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger > 1 then begin
        //verificação para calcular as diárias extras
        HraSaida.Time := Now();
        if HraSaida.Time <= hraParametro.Time then
        begin
          edtQtdDExtra.Value := DaysBetween(edtDtaEntrada.Date,edtDtaSaida.Date)
          * F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger;
        end
        else begin
          edtQtdDExtra.Value := (DaysBetween(edtDtaEntrada.Date,edtDtaSaida.Date)
            * F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger)
                + F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_EXTRA.AsInteger;
        end;
      end;
      //valor das diárias extras
      edtVlrDExtra.Value  := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_EXTRA.AsCurrency;

      if edtQtdDExtra.Value > 0 then begin
        //total das diárias extras
        edtVlrGExtra.Value  := edtQtdDExtra.Value * edtVlrDExtra.Value;
        TotDExtra           := edtVlrDExtra.Value * edtQtdDExtra.Value;
      end
      else begin
        TotDExtra := 0;
      end;


      //=================================== fazendo o calculo das diárias normais=================================

      //verificação para calcular as diárias normais
      hraSaida.Time := Now();
      if HraSaida.Time <= hraParametro.Time then
      begin
        edtQtdDNormal.Value := DaysBetween(edtDtaEntrada.Date,edtDtaSaida.Date);
      end
      else begin
        edtQtdDNormal.Value := (DaysBetween(edtDtaEntrada.Date,edtDtaSaida.Date)
          * 1) + 1;//F_dmHospedes.QRY_FechaHospedeENT_QTD_DIARIA_NORMAL.AsInteger;
      end;

      //tot. das diárias normais (valores)
      edtVlrDNormal.Value     := F_dmHospedes.QRY_FechaHospedeENT_VLR_DIARIA_NORMAL.AsCurrency;
      edtVlrGNormal.Value     := edtVlrDNormal.Value * edtQtdDNormal.Value;
      TotDNormal              := edtVlrGNormal.Value;
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
      edtVlrGBar.Value := QRY_proConsumidosvlrTotal.AsVariant;
    end;

    edtVlrGDiarias.Value := TotDNormal + TotDExtra;

  //======================valores da lavanderia e outros================================

  //soma o total geral
  edtVlrTFatura.Value := (edtVlrGDiarias.Value + edtVlrGBar.Value + edtVlrGOutros.Value)
       + F_checkIn.qTransferencia;     //total geral

  if F_checkIn.qTransferencia > 0 then begin
    btnTeveTransferencia.Visible := True;
  end

end;

procedure TF_fechaApto.btnTeveTransferenciaClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Veja as Transferencias');
end;

end.



