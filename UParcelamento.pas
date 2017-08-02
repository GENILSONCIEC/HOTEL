unit UParcelamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  acPNG, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, RzEdit, RzBtnEdt, Vcl.ComCtrls,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Async, FireDAC.DApt, UFunctions, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxCurrencyEdit, cxPC, JvExExtCtrls,
  JvExtComponent, JvCaptionPanel, System.DateUtils, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinLilian, dxSkinOffice2007Black,
  dxSkinOffice2010Black, dxSkinVisualStudio2013Blue, dxSkinXmas2008Blue;

type
  TF_parcelamento = class(TF_baseTelaSimples)
    pnlTopo: TPanel;
    imgParcelamento: TImage;
    lblTipoParcelamento: TLabel;
    pnlRodape: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlInformacoes: TPanel;
    lblBanco: TLabel;
    edtBanco: TRzButtonEdit;
    lblQtdParcelas: TLabel;
    lblIntDias: TLabel;
    edtIntervDias: TEdit;
    btnGerar: TSpeedButton;
    btnExcluir: TSpeedButton;
    pnlGrid: TPanel;
    edtTotalParcelar: TcxCurrencyEdit;
    pagControl: TcxPageControl;
    tabPrazo: TcxTabSheet;
    tabCHVista: TcxTabSheet;
    tabCHPre: TcxTabSheet;
    tabCCredito: TcxTabSheet;
    DBGrid_prazo: TDBGrid;
    DBGrid_chVista: TDBGrid;
    DBGrid_chPre: TDBGrid;
    DBGrid_cCredito: TDBGrid;
    btnCheque: TSpeedButton;
    pnlCheque: TJvCaptionPanel;
    lblNCheque: TLabel;
    lblNomeBanco: TLabel;
    lblNumeroBanco: TLabel;
    lblCPFCNPJ: TLabel;
    lblAgencia: TLabel;
    lblConcaCorrente: TLabel;
    Label53: TLabel;
    btnOk: TSpeedButton;
    btnCancelarCh: TSpeedButton;
    edtEmitente: TEdit;
    edtContaCorrente: TEdit;
    edtAgencia: TEdit;
    edtNCheque: TEdit;
    edtCPFCNPJ: TEdit;
    edtNBanco: TEdit;
    edtNomeBanco: TEdit;
    edtCodBanco: TEdit;
    DTA_DataEmissao: TDateTimePicker;
    lbl: TLabel;
    edtQtdParcelas: TcxCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure edtBancoButtonClick(Sender: TObject);
    procedure btnChequeClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarChClick(Sender: TObject);
    procedure edtBancoExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure pnlChequeButtonClick(Sender: TObject; Button: TJvCapBtnStyle);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_chPreDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_parcelamento: TF_parcelamento;

implementation

{$R *.dfm}

uses UFormasPgto, UPesquisaBanco, UMsg, UDMHospedes;

procedure TF_parcelamento.btnCancelarChClick(Sender: TObject);
begin
  inherited;
  pnlCheque.Visible := False;
end;

procedure TF_parcelamento.btnCancelarClick(Sender: TObject);
begin
  inherited;
  //cancelar
 if MessageBox(Application.Handle, Pchar('Deseja mesmo cancelar essa operação?'),
   Pchar('CIEC'), MB_YESNO + MB_ICONQUESTION) = IDYES then begin
    if F_formasPgto.TB_prazo.RecordCount > 0 then begin
      F_formasPgto.TB_prazo.EmptyDataSet;
    end;

    if F_formasPgto.TB_CHPre.RecordCount > 0 then begin
      F_formasPgto.TB_CHPre.EmptyDataSet;
    end;

    if F_formasPgto.TB_CHVista.RecordCount > 0 then begin
      F_formasPgto.TB_CHVista.EmptyDataSet;
    end;

    if F_formasPgto.TB_CCredito.RecordCount > 0 then begin
      F_formasPgto.TB_CCredito.EmptyDataSet;
    end;
    Self.Close;
   end;
end;

procedure TF_parcelamento.btnChequeClick(Sender: TObject);
begin
  inherited;
   //obriga a escolha do banco (btnCheque)
  if edtBanco.Text = '' then begin
    TF_msg.Mensagem('O Banco é Obrigatório!','I',[mbOk]);
    edtBancoButtonClick(Sender);
    exit;
  end
  else begin
    edtNomeBanco.Text := edtBanco.Text;
  end;
  pnlCheque.Visible := True;
  edtNCheque.SetFocus;
end;

procedure TF_parcelamento.btnExcluirClick(Sender: TObject);
begin //exclui as parcelas

    //prazo
   if F_formasPgto.TipoPgto = 2 then begin
    if F_formasPgto.TB_prazo.RecordCount > 0 then begin
      F_formasPgto.TB_prazo.EmptyDataSet;
      TF_msg.Mensagem('Parcelas excluidas com sucesso!','I',[mbOk]);
      edtQtdParcelas.SetFocus;
    end
    else begin
      TF_msg.Mensagem('Não há parcelas para Cancelar!','I',[mbOk]);
      abort;
    end;
  end;

  //ccredito
  if F_formasPgto.TipoPgto = 4 then begin
    if F_formasPgto.TB_CCredito.RecordCount > 0 then begin
      F_formasPgto.TB_CCredito.EmptyDataSet;
      TF_msg.Mensagem('Parcelas excluidas com sucesso!','I',[mbOk]);
      edtQtdParcelas.SetFocus;
    end
    else begin
      TF_msg.Mensagem('Não há parcelas para Cancelar!','I',[mbOk]);
      abort;
    end;
  end;

  //cpre
  if F_formasPgto.TipoPgto = 3 then begin
    if F_formasPgto.TB_CHPre.RecordCount > 0 then begin
      F_formasPgto.TB_CHPre.EmptyDataSet;
      TF_msg.Mensagem('Parcelas excluidas com sucesso!','I',[mbOk]);
      edtQtdParcelas.SetFocus;
    end
    else begin
      TF_msg.Mensagem('Não há parcelas para Cancelar!','I',[mbOk]);
      abort;
    end;
  end;
end;

//Gerar parcelas
procedure TF_parcelamento.btnGerarClick(Sender: TObject);
Var TotParcelas, ParcelaAtual, Dias : Integer;       {prazo}
    TotParcelasCC, ParcelaAtualCC, DiasCC : Integer; {cartao de credito}
    TotParcelasCP, ParcelaAtualCP, DiasCP : Integer; {cheque pre}
begin //botão gerar parcelas
inherited;
  //1º verificações
  if edtBanco.Text = '' then begin
    TF_msg.Mensagem('O Banco não pode ficar em Branco!','I',[mbOk]);
    edtBancoButtonClick(Sender);
    abort;
  end;

  if edtQtdParcelas.Value < 0 then begin
    TF_msg.Mensagem('QTD das parcelas não pode ser menor que 0','I',[mbOk]);
    edtQtdParcelas.SetFocus;
    abort;
  end;

  TotParcelas  := StrToInt(edtQtdParcelas.Text);
  ParcelaAtual := 0;
  Dias         := 0;

  TotParcelasCC  := StrToInt(edtQtdParcelas.Text);
  ParcelaAtualCC := 0;
  DiasCC         := 0;

  TotParcelasCP  := StrToInt(edtQtdParcelas.Text);
  ParcelaAtualCP := 0;
  DiasCP         := 0;

  case F_formasPgto.TipoPgto of
  2: begin
     //prazo
     {$REGION 'Prazo'}
       if F_formasPgto.TB_prazo.RecordCount > 0 then begin
        TF_msg.Mensagem('Já foi feito parcelamento. Favor, exclua e faça novamente!','I',[mbOk]);
        abort;
       end

        else begin
        while ParcelaAtual < TotParcelas  do begin
            ParcelaAtual                                 := ParcelaAtual + 1;
            Dias                                         := Dias + 30;
            F_formasPgto.TB_prazo.Append;
            F_formasPgto.TB_prazoPr_operacao.Value       := '5'; //default
            F_formasPgto.TB_prazoPr_documento.AsString   := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.Value);
            F_formasPgto.TB_prazoPr_valor.Value          := (edtTotalParcelar.Value / TotParcelas);
            F_formasPgto.TB_prazoPr_vcmto.Value          := IncMonth(Date, ParcelaAtual);
            F_formasPgto.TB_prazoPr_dias.Value           := Dias; //depois calcular
            F_formasPgto.TB_prazoPr_docRecibo.AsString   := IntToStr(F_formasPgto.TipoPgto);
            F_formasPgto.TB_prazoPr_banco.AsString       := edtCodBanco.Text;
            F_formasPgto.TB_prazo.Post;
          end;
        end;
     {$ENDREGION}
    end;
  4: begin
     //c. credito
     {$REGION 'CCredito'}
       if F_formasPgto.TB_CCredito.RecordCount > 0 then begin
        TF_msg.Mensagem('Já foi feito parcelamento. Favor, exclua e faça novamente!','I',[mbOk]);
        abort;
       end

        else begin
        while ParcelaAtualCC < TotParcelasCC  do begin
            ParcelaAtualCC                                  := ParcelaAtualCC + 1;
            DiasCC                                          := DiasCC + 30;
            F_formasPgto.TB_CCredito.Append;
            F_formasPgto.TB_CCreditoCc_operacao.AsString    := '5';
            F_formasPgto.TB_CCreditoCc_valor.AsCurrency     := (edtTotalParcelar.Value / TotParcelasCC);
            F_formasPgto.TB_CCreditoCc_dias.Value           := DiasCC;
            F_formasPgto.TB_CCreditoCc_vcmto.AsDateTime     := IncMonth(Date, ParcelaAtualCC);
            F_formasPgto.TB_CCreditoCc_banco.AsString       := edtCodBanco.Text;
            F_formasPgto.TB_CCreditoCc_documento.AsString   := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.Value);
            F_formasPgto.TB_CCredito.Post;
          end;
        end;
     {$ENDREGION}
    end;
  3: begin
     //cheque pre
     {$REGION 'CPre'}
     if F_formasPgto.TB_CHPre.RecordCount > 0 then begin
        TF_msg.Mensagem('Já foi feito parcelamento. Favor, exclua e faça novamente!','I',[mbOk]);
        abort;
       end

        else begin
        while ParcelaAtualCP < TotParcelasCP  do begin
            ParcelaAtualCP                                  := ParcelaAtualCP + 1;
            DiasCP                                          := DiasCP + 30;
            F_formasPgto.TB_CHPre.Append;
            F_formasPgto.TB_CHPreChp_valor.AsCurrency       := (edtTotalParcelar.Value / TotParcelasCP);
            F_formasPgto.TB_CHPreChp_vcmto.AsDateTime       := IncMonth(Date, ParcelaAtualCP);
            F_formasPgto.TB_CHPreChp_dias.AsInteger         := DiasCP;
            F_formasPgto.TB_CHPreChp_bancoCiec.AsInteger    := StrToInt(edtCodBanco.Text);
            F_formasPgto.TB_CHPre.Post;
          end;
        end;

     {$ENDREGION}
    end;
  end;
end;

procedure TF_parcelamento.btnOkClick(Sender: TObject);
begin
  inherited;
  {Validação dos Dados}
//      if (edtNCheque.Text = '') or (edtNomeBanco.Text = '') or (edtNBanco.Text = '')
//        or (edtCPFCNPJ.Text = '') or (edtAgencia.Text = '') or (edtContaCorrente.Text = '')
//          or (edtEmitente.Text = '')then begin
//            TF_msg.Mensagem('Falta preencher informações do Cheque','I',[mbOk]);
//            edtNCheque.SetFocus;
//            abort;
//      end;

  case F_formasPgto.TipoPgto of
  7: begin
    //cheque vista
    F_formasPgto.TB_CHVista.Open;

  if F_formasPgto.TB_CHVista.RecordCount > 0 then
    F_formasPgto.TB_CHVista.Edit
  else
    F_formasPgto.TB_CHVista.Append;
    F_formasPgto.TB_CHVistaChv_numCheque.AsInteger    := StrToInt(edtNCheque.Text);
    F_formasPgto.TB_CHVistaChv_nomeBanco.AsString     := edtNomeBanco.Text;
    F_formasPgto.TB_CHVistaChv_NumBanco.AsInteger     := StrToInt(edtNBanco.Text);
    F_formasPgto.TB_CHVistaChv_cpfCnpj.AsString       := edtCPFCNPJ.Text;
    F_formasPgto.TB_CHVistaChv_numAgencia.AsString    := edtAgencia.Text;
    F_formasPgto.TB_CHVistaChv_numCCorrente.AsString  := edtContaCorrente.Text;
    F_formasPgto.TB_CHVistaChv_nomeEmitente.AsString  := edtEmitente.Text;
    F_formasPgto.TB_CHVistaChv_valor.AsCurrency       := edtTotalParcelar.Value;
    F_formasPgto.TB_CHVista.Post;
    pnlCheque.Visible                                 := False;
  end;
  3: begin
     //cheque pre (verifiar a questão do cara gerar as parcelas ou preencher os dados do cheque)
     ShowMessage('pre');
    end;
  end;
end;

procedure TF_parcelamento.btnSalvarClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TF_parcelamento.DBGrid_chPreDblClick(Sender: TObject);
begin
  inherited; {painel cheque}
  pnlCheque.Visible := True;
end;

procedure TF_parcelamento.edtBancoButtonClick(Sender: TObject);
begin
  inherited;
  CriaFormDestroy(TF_pesquisaBanco, F_pesquisaBanco);
end;

procedure TF_parcelamento.edtBancoExit(Sender: TObject);
begin
  inherited;
  edtBanco.Text := TrimLeft(edtBanco.Text);
end;

procedure TF_parcelamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then begin
    btnGerar.Click;
  end;
  if key = VK_F3 then begin
    btnExcluir.Click;
  end;
  if key = VK_F4 then begin
   {só abre se for cheque vista ou pré.}
   if (F_formasPgto.TipoPgto = 3) or (F_formasPgto.TipoPgto = 7) then begin
    btnCheque.Click;
   end;
  end;
  if key = VK_F5 then begin
    btnSalvar.Click;
  end;
  if key = VK_F6 then begin
    btnCancelar.Click;
  end;
end;

procedure TF_parcelamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then begin
    Key := #0;
    //SendMessage(Handle, WM_NEXTDLGCTL, 0,0);  //mais lento
    Perform(WM_NEXTDLGCTL, 0,0); //mais rápido
  end;
end;

procedure TF_parcelamento.FormShow(Sender: TObject);
begin
  inherited;

  case F_formasPgto.TipoPgto of
    2: begin
      //prazo
      lblTipoParcelamento.Caption := 'Prazo (Nota)';
      edtTotalParcelar.Value := F_formasPgto.edtPrazo.Value;
      pagControl.Properties.HideTabs := True;
      pagControl.ActivePage := tabPrazo;

      edtBancoButtonClick(Sender); //para abrir o banco automaticamente
    end;
    3: begin
      //cheque pre
      lblTipoParcelamento.Caption := 'Cheque Pré';
      pagControl.Properties.HideTabs := True;
      pagControl.ActivePage := tabCHPre;
      btnCheque.Visible := True;

      edtBancoButtonClick(Sender); //para abrir o banco automaticamente
    end;
    4: begin
      //c. credito
      lblTipoParcelamento.Caption := 'Cr. Crédito';
      pagControl.Properties.HideTabs := True;
      pagControl.ActivePage := tabCCredito;

      edtBancoButtonClick(Sender); //para abrir o banco automaticamente
    end;
    7: begin
      //cheque vista
      lblTipoParcelamento.Caption := 'Cheque vista';
      pagControl.Properties.HideTabs := True;
      pagControl.ActivePage := tabCHVista;
      btnCheque.Visible := True;

      //desabilita os controles para não deixar parcelar o cheque a vista
      edtQtdParcelas.Visible      := False;
      edtIntervDias.Visible       := False;
      btnGerar.Visible            := False;
      btnExcluir.Visible          := False;
      lblQtdParcelas.Visible      := False;
      lblIntDias.Visible          := False;

      edtBancoButtonClick(Sender); //para abrir o banco automaticamente
    end;
  end;

  edtTotalParcelar.Value := F_formasPgto.VlrParcelar;  //pega o valor a parcelar
  edtBanco.SetFocus;
//    edtQtdParcelas.SetFocus;
end;

procedure TF_parcelamento.pnlChequeButtonClick(Sender: TObject;
  Button: TJvCapBtnStyle);
begin
  inherited;
  pnlCheque.Visible := False;
end;

end.


