unit UFormasPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.StdCtrls, dxGDIPlusClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons,
  acPNG, AdvEdit, UFunctions, AdvMoneyEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxCurrencyEdit,
  FireDAC.Phys.SQLiteVDataSet, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, frxClass, frxDBSet,
  frxExportPDF, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinLilian,
  dxSkinOffice2007Black, dxSkinOffice2010Black, dxSkinVisualStudio2013Blue,
  dxSkinXmas2008Blue;

type
  TF_formasPgto = class(TF_baseTelaSimples)
    pnlFechamento: TPanel;
    lblCodEntrada: TLabel;
    pnlRodape: TPanel;
    lblCodHospedagem: TLabel;
    pnlFormasPgto: TPanel;
    imgPdv: TImage;
    pnlTotais: TPanel;
    pnlTotaisValores: TPanel;
    pnlTotaisResultado: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    QRY_TVCompra: TFDQuery;
    QRY_pmto: TFDQuery;
    QRY_pmtoPMT_ID: TIntegerField;
    QRY_pmtoPMT_NOTA_VENDA: TStringField;
    QRY_pmtoPMT_JUROS: TBCDField;
    QRY_pmtoPMT_BLOQUEIO: TIntegerField;
    QRY_pmtoPMT_LIMITE: TIntegerField;
    QRY_pmtoPMT_HORARIO: TTimeField;
    QRY_pmtoPMT_HORARIO2: TTimeField;
    QRY_pmtoPMT_ETIQUETA: TStringField;
    QRY_pmtoPMT_PRECOS: TStringField;
    QRY_pmtoPMT_MENSCUPOM1: TStringField;
    QRY_pmtoPMT_MENSCUPOM2: TStringField;
    QRY_pmtoPMT_MENSAVEND1: TStringField;
    QRY_pmtoPMT_DESCVISTA: TBCDField;
    QRY_pmtoPMT_DESCPRAZO: TBCDField;
    QRY_pmtoPMT_DESCCHEQUE: TBCDField;
    QRY_pmtoPMT_DESCCARTAO: TBCDField;
    QRY_pmtoPMT_DESCTIKET: TBCDField;
    QRY_pmtoPMT_DESCOUTRAS: TBCDField;
    QRY_pmtoPMT_ESTOQUE_NEG: TStringField;
    QRY_pmtoPMT_VALOR_CMV: TStringField;
    QRY_pmtoPMT_BARRA: TStringField;
    QRY_pmtoPMT_VLRHORA: TBCDField;
    QRY_pmtoPMT_VLRHORAG: TBCDField;
    QRY_pmtoPMT_ADM: TBCDField;
    QRY_pmtoPMT_LIBERA: TStringField;
    QRY_pmtoPMT_SENHADES: TStringField;
    QRY_pmtoPMT_PROMISSORIA: TStringField;
    QRY_pmtoPMT_ENCERRADO: TDateField;
    QRY_pmtoPMT_CXVISTA: TIntegerField;
    QRY_pmtoPMT_CXVISTABANCO: TIntegerField;
    QRY_pmtoPMT_CXPRAZO: TIntegerField;
    QRY_pmtoPMT_CXPRAZOBANCO: TIntegerField;
    QRY_pmtoPMT_CXCHEQUE: TIntegerField;
    QRY_pmtoPMT_CXCHEQUEBANCO: TIntegerField;
    QRY_pmtoPMT_CXCARTAO: TIntegerField;
    QRY_pmtoPMT_CXCARTAOBANCO: TIntegerField;
    QRY_pmtoPMT_CXDVISTA: TIntegerField;
    QRY_pmtoPMT_CXDVISTABANCO: TIntegerField;
    QRY_pmtoPMT_ENTRADA: TIntegerField;
    QRY_pmtoPMT_BANCOENTRADA: TIntegerField;
    QRY_pmtoPMT_CXRECPRAZO: TIntegerField;
    QRY_pmtoPMT_CXRECCHEQUE: TIntegerField;
    QRY_pmtoPMT_CXRECCARTAO: TIntegerField;
    QRY_pmtoPMT_CXRECCOMPRE: TIntegerField;
    QRY_pmtoPMT_CXJUROS: TIntegerField;
    QRY_pmtoPMT_CXDESCONTO: TIntegerField;
    QRY_pmtoPMT_CALCULADO: TDateField;
    QRY_pmtoPMT_GERADO: TDateField;
    QRY_pmtoPMT_ATCLIENTE: TDateField;
    QRY_pmtoPMT_GERAPAGAR: TStringField;
    QRY_pmtoPMT_CXCOMPRA: TIntegerField;
    QRY_pmtoPMT_CXCOMPRABANCO: TIntegerField;
    QRY_pmtoPMT_CXCOMPRABANCOP: TIntegerField;
    QRY_pmtoPMT_CXCOMPRABANCOV: TIntegerField;
    QRY_pmtoPMT_CXTRANSF: TIntegerField;
    QRY_pmtoPMT_CXTRANSFBANCO: TIntegerField;
    QRY_pmtoPMT_CXOUTRAS: TIntegerField;
    QRY_pmtoPMT_CXOUTRASBANCO: TIntegerField;
    QRY_pmtoPMT_ICMSCOMPRA: TIntegerField;
    QRY_pmtoPMT_PISCOMPRA: TIntegerField;
    QRY_pmtoPMT_COFCOMPRA: TIntegerField;
    QRY_pmtoPMT_ICMSBANCO: TIntegerField;
    QRY_pmtoPMT_RECEITAS: TIntegerField;
    QRY_pmtoPMT_JUROSPAGOS: TIntegerField;
    QRY_pmtoPMT_CXSVISTA: TIntegerField;
    QRY_pmtoPMT_CXSPRAZO: TIntegerField;
    QRY_pmtoPMT_CXSCHEQUE: TIntegerField;
    QRY_pmtoPMT_CXSCARTAO: TIntegerField;
    QRY_pmtoPMT_TIPOOS: TIntegerField;
    QRY_pmtoPMT_INATIVO: TIntegerField;
    QRY_pmtoPMT_CXRDEVOLVIDO: TIntegerField;
    QRY_pmtoPMT_CXRPORDEVOL: TIntegerField;
    QRY_pmtoPMT_CXRPORDEVOLC: TIntegerField;
    QRY_pmtoPMT_CXRPORDEVOLX: TIntegerField;
    QRY_pmtoPMT_CXPDUPLICATA: TIntegerField;
    QRY_pmtoPMT_FORMULA: TStringField;
    QRY_pmtoPMT_CVENDANT: TIntegerField;
    QRY_pmtoPMT_BCVENDANT: TIntegerField;
    QRY_pmtoPMT_BDVENDANT: TIntegerField;
    QRY_pmtoPMT_DVENDANT: TIntegerField;
    QRY_pmtoPMT_HOJE: TDateField;
    QRY_pmtoPMT_GLOBAL: TStringField;
    QRY_pmtoPMT_NOTAESTOQUE: TStringField;
    QRY_pmtoPMT_NOTATODAS: TStringField;
    QRY_pmtoPMT_NOTACAIXA: TStringField;
    QRY_pmtoPMT_COMPCAIXA: TStringField;
    QRY_pmtoPMT_COMPESTOQUE: TStringField;
    QRY_pmtoPMT_ESPERA: TBCDField;
    QRY_pmtoPMT_ATRASO: TBCDField;
    QRY_pmtoPMT_GIRO: TBCDField;
    QRY_pmtoPMT_CARTEIRA: TIntegerField;
    QRY_pmtoPMT_MULTA: TBCDField;
    QRY_pmtoPMT_DESCONTO: TBCDField;
    QRY_pmtoPMT_TAXACOBRANCA: TBCDField;
    QRY_pmtoPMT_COMISSAO: TBCDField;
    QRY_pmtoPMT_VLRMINIMO: TBCDField;
    QRY_pmtoPMT_SONOCAIXA: TStringField;
    QRY_pmtoPMT_PROVCOFINS: TIntegerField;
    QRY_pmtoPMT_PROVCONTSOC: TIntegerField;
    QRY_pmtoPMT_PROVICMS: TIntegerField;
    QRY_pmtoPMT_PROVISSQN: TIntegerField;
    QRY_pmtoPMT_PROVPIS: TIntegerField;
    QRY_pmtoPMT_PROVCOMISSAO: TIntegerField;
    QRY_pmtoPMT_PROVDECIMO: TIntegerField;
    QRY_pmtoPMT_PROVFERIAS: TIntegerField;
    QRY_pmtoPMT_PROVFGTS: TIntegerField;
    QRY_pmtoPMT_PROVINSS: TIntegerField;
    QRY_pmtoPMT_PROVSALARIO: TIntegerField;
    QRY_pmtoPMT_PERCINSS: TBCDField;
    QRY_pmtoPMT_PERCFGTS: TBCDField;
    QRY_pmtoPMT_PERCCONTS: TBCDField;
    QRY_pmtoPMT_ISSQN: TBCDField;
    QRY_pmtoPMT_VEICULO: TStringField;
    QRY_pmtoPMT_SERVICO: TStringField;
    QRY_pmtoPMT_BALANCAPRECO: TStringField;
    QRY_pmtoPMT_BALANCAPESO: TStringField;
    QRY_pmtoPMT_BALANCAPROD: TStringField;
    QRY_pmtoPMT_CXFINANC: TIntegerField;
    QRY_pmtoPMT_CXFINANCBANCO: TIntegerField;
    QRY_pmtoPMT_CXRECFINANC: TIntegerField;
    QRY_pmtoPMT_CXRPORDEVOLF: TIntegerField;
    QRY_pmtoPMT_COMPBOLETO: TStringField;
    QRY_pmtoPMT_PARCELAS: TSmallintField;
    QRY_pmtoPMT_ICMSBASE: TBCDField;
    QRY_pmtoPMT_CUSTOVENDA: TIntegerField;
    QRY_pmtoPMT_CUSTODEVOL: TIntegerField;
    QRY_pmtoPMT_TIPODESCONTO: TStringField;
    QRY_pmtoPMT_GERARCHEQUE: TStringField;
    QRY_pmtoPMT_MCASADA: TBCDField;
    QRY_pmtoPMT_VENDACASADA: TStringField;
    QRY_pmtoPMT_BOLETO: TStringField;
    QRY_pmtoPMT_PONTOS: TBCDField;
    QRY_pmtoPMT_ORDENOTA: TStringField;
    QRY_pmtoPMT_LUCROREAL: TStringField;
    QRY_pmtoPMT_CLIENTEVISTA: TIntegerField;
    QRY_pmtoPMT_IMPREFERENCIA: TStringField;
    QRY_pmtoPMT_CLIENTECHPRE: TIntegerField;
    QRY_pmtoPMT_PRAZOPARCELAS: TSmallintField;
    QRY_pmtoPMT_USABARRA: TStringField;
    QRY_pmtoPMT_NUMERONOTA: TStringField;
    QRY_pmtoPMT_REGIMEDER: TStringField;
    QRY_pmtoPMT_BANDAG: TStringField;
    QRY_pmtoPMT_SETOR: TStringField;
    QRY_pmtoPMT_NFE: TStringField;
    QRY_pmtoPMT_ATULIZAR: TStringField;
    QRY_pmtoPMT_NOMEORCAMENTO: TStringField;
    QRY_pmtoPMT_PROMOCAOPRAZO: TStringField;
    QRY_pmtoPMT_LOTE: TStringField;
    QRY_pmtoPMT_SENHA: TStringField;
    QRY_pmtoPMT_CXDESCJUROS: TIntegerField;
    QRY_pmtoPMT_TAXASDOLAR: TStringField;
    QRY_pmtoPMT_CLIENTECARTAO: TIntegerField;
    QRY_pmtoPMT_LINHAOS: TStringField;
    QRY_pmtoPMT_SENHAREC: TStringField;
    QRY_pmtoPMT_PRODUCAO: TStringField;
    QRY_pmtoPMT_ICMSDEVOL: TIntegerField;
    QRY_pmtoPMT_PISDEVOL: TIntegerField;
    QRY_pmtoPMT_CONFINSDEVOL: TIntegerField;
    QRY_pmtoPMT_MESCUPOM3: TStringField;
    QRY_pmtoPMT_MESCUPOM4: TStringField;
    QRY_pmtoPMT_DESCARTAO: TIntegerField;
    QRY_pmtoPMT_PROVISAO: TMemoField;
    QRY_pmtoPMT_LOGOUT: TBCDField;
    QRY_pmtoPMT_CODIGOPRECO: TStringField;
    QRY_pmtoPMT_MUDAREC: TStringField;
    QRY_pmtoPMT_PRODDVS: TIntegerField;
    QRY_pmtoPMT_PORTACHEQ: TStringField;
    QRY_pmtoPMT_CABCLIENTEPAGINA: TStringField;
    QRY_pmtoPMT_PRZNEGOCIA: TIntegerField;
    QRY_pmtoPMT_CXTIKET: TIntegerField;
    QRY_pmtoPMT_CXCARTAOD: TIntegerField;
    QRY_pmtoPMT_CXSANGRIA: TIntegerField;
    QRY_pmtoPMT_CXSUPRIM: TIntegerField;
    QRY_pmtoPMT_SERVPADRAO: TIntegerField;
    QRY_pmtoPMT_GERARCC: TStringField;
    QRY_pmtoPMT_GERARCD: TStringField;
    QRY_pmtoPMT_BAIXARECDEVOL: TStringField;
    QRY_pmtoPMT_UNDMEDIDA: TBCDField;
    QRY_pmtoPMT_ADICIONALVENDAPRO: TStringField;
    QRY_pmtoPMT_IMPRIMEDIRETO: TStringField;
    QRY_pmtoPMT_VLHORABRINQ: TBCDField;
    QRY_pmtoPMT_VLHORABRINQ1: TBCDField;
    QRY_pmtoPMT_REPLPDV: TStringField;
    QRY_pmtoPMT_DATACARGA: TDateField;
    QRY_pmtoPMT_IMETROBANDAG: TStringField;
    QRY_pmtoPMT_COMISSAOPRAZO: TBCDField;
    QRY_pmtoPMT_COMISSAOCHEQUE: TBCDField;
    QRY_pmtoPMT_COMISSAOCARTAO: TBCDField;
    QRY_pmtoPMT_COMISSAOCARTAOD: TBCDField;
    QRY_pmtoPMT_ADTOSERV: TIntegerField;
    QRY_pmtoPMT_PGADTOSERV: TIntegerField;
    QRY_pmtoPMT_NUMEROOS: TStringField;
    QRY_banco: TFDQuery;
    QRY_bancoBAN_CODIGO: TIntegerField;
    QRY_bancoBAN_NOME: TStringField;
    QRY_bancoBAN_COMISSAO: TBCDField;
    QRY_bancoBAN_CADASTRO: TDateField;
    QRY_bancoBAN_HORA: TTimeField;
    QRY_bancoBAN_FOTO: TBlobField;
    QRY_bancoBAN_OPECAIXA: TIntegerField;
    QRY_bancoBAN_CODACBR: TSmallintField;
    edtVista: TcxCurrencyEdit;
    edtChVista: TcxCurrencyEdit;
    edtChPre: TcxCurrencyEdit;
    edtCCredito: TcxCurrencyEdit;
    edtCDebito: TcxCurrencyEdit;
    edtPrazo: TcxCurrencyEdit;
    edtDiferenca: TcxCurrencyEdit;
    edtTotal: TcxCurrencyEdit;
    imgPdvTotais: TImage;
    pnlDetalhe: TPanel;
    pnlMaster: TPanel;
    lblMaster: TLabel;
    lblDetalhe: TLabel;
    TB_prazo: TFDMemTable;
    TB_prazoPr_operacao: TStringField;
    TB_prazoPr_documento: TStringField;
    TB_prazoPr_valor: TCurrencyField;
    TB_prazoPr_dias: TIntegerField;
    TB_prazoPr_vcmto: TDateField;
    TB_prazoPr_docRecibo: TStringField;
    DS_prazo: TDataSource;
    TB_CHPre: TFDMemTable;
    DS_CHPre: TDataSource;
    TB_CCredito: TFDMemTable;
    DS_CCredito: TDataSource;
    DS_CHVista: TDataSource;
    TB_CHVista: TFDMemTable;
    TB_CHPreChp_valor: TCurrencyField;
    TB_CCreditoCc_valor: TCurrencyField;
    lblDinheiro1: TLabel;
    lblDinheiro2: TLabel;
    lblChVista1: TLabel;
    lblChVista2: TLabel;
    lblChPre1: TLabel;
    lblChPre2: TLabel;
    lblCCredito1: TLabel;
    lblCCredito2: TLabel;
    lblCDebito1: TLabel;
    lblCDebito2: TLabel;
    lblPrazo1: TLabel;
    lblPrazo2: TLabel;
    QRY_mvCaixa: TFDQuery;
    TB_vista: TFDMemTable;
    QRY_mvEstoque3: TFDQuery;
    QRY_mvEstoque3ME3_DOCTO: TStringField;
    QRY_mvEstoque3ME3_OPERACAO: TSmallintField;
    QRY_mvEstoque3ME3_DINHEIRO: TBCDField;
    QRY_mvEstoque3ME3_CHEQUE: TBCDField;
    QRY_mvEstoque3ME3_CHEQUEPRE: TBCDField;
    QRY_mvEstoque3ME3_CARTAOCREDITO: TBCDField;
    QRY_mvEstoque3ME3_CARTAODEBITO: TBCDField;
    QRY_mvEstoque3ME3_PRAZO: TBCDField;
    QRY_mvEstoque3ME3_TIKECT: TBCDField;
    QRY_mvEstoque3ME3_CONVENIO: TBCDField;
    QRY_mvEstoque3ME3_OUTRAS: TBCDField;
    QRY_mvEstoque3ME3_TROCO: TBCDField;
    QRY_mvEstoque3ME3_REPLICPDV: TStringField;
    QRY_mvEstoque3ME3_ID: TLargeintField;
    QRY_mvEstoque3ME3_FATURA: TStringField;
    QRY_mvEstoque3ME3_CAIXAIMP: TStringField;
    QRY_mvEstoque3ME3_FILIAL: TIntegerField;
    QRY_mvEstoque3ME3_TIPOVENDACOMPRA: TIntegerField;
    QRY_mvEstoque3ME3_OBSERVACAO: TStringField;
    QRY_TVCompraCTM_CODIGO: TIntegerField;
    QRY_TVCompraCTM_COPDEBI: TIntegerField;
    QRY_TVCompraCTM_COPCRED: TIntegerField;
    QRY_TVCompraTVC_ID: TIntegerField;
    TB_CDebito: TFDMemTable;
    QRY_prazo: TFDQuery;
    QRY_prazoPRA_ID: TIntegerField;
    QRY_prazoPRA_DOCTO: TStringField;
    QRY_prazoPRA_TIPO: TStringField;
    QRY_prazoPRA_VALOR: TBCDField;
    QRY_prazoPRA_VENCIMENTO: TDateField;
    QRY_prazoPRA_EMISSAO: TDateField;
    QRY_prazoPRA_PRAZO: TSmallintField;
    QRY_prazoPRA_TIPODOC: TStringField;
    QRY_prazoPRA_DOCUMENTO: TStringField;
    QRY_prazoPRA_VALORFINAN: TBCDField;
    QRY_prazoPRA_QUANPARCELA: TIntegerField;
    QRY_prazoPRA_HISTORICOPAGTO: TIntegerField;
    QRY_prazoPRA_DATAREAJUSTE: TDateField;
    QRY_prazoPRA_BANCO: TIntegerField;
    QRY_prazoPRA_TVCID: TIntegerField;
    QRY_prazoPRA_VENCFIXO: TStringField;
    QRY_prazoPRA_REPLICPDV: TStringField;
    QRY_prazoPRA_FILIAL: TIntegerField;
    QRY_prazoPRA_QUANTPARCELAS: TIntegerField;
    QRY_prazoPRA_EMITENTE: TStringField;
    QRY_prazoPRA_CPFCNPJ: TStringField;
    QRY_prazoPRA_NUMBANCO: TStringField;
    QRY_prazoPRA_AGENCIA: TStringField;
    QRY_prazoPRA_CONTACORRENTE: TStringField;
    QRY_receber1: TFDQuery;
    QRY_receber2: TFDQuery;
    QRY_receber1RC1_DOCREC: TStringField;
    QRY_receber1RC1_CONTROLE: TSmallintField;
    QRY_receber1RC1_PARCELA: TSmallintField;
    QRY_receber1RC1_SETOR: TStringField;
    QRY_receber1RC1_FILIAL: TIntegerField;
    QRY_receber1RC1_TIPOREC: TStringField;
    QRY_receber1RC1_VAREJO: TStringField;
    QRY_receber1RC1_EMISSAO: TDateField;
    QRY_receber1RC1_VALORTOTAL: TBCDField;
    QRY_receber1RC1_CLIENTE: TIntegerField;
    QRY_receber1RC1_VLRPRODUTO: TBCDField;
    QRY_receber1RC1_VLRSERVICO: TBCDField;
    QRY_receber1RC1_CUSTOVENDA: TBCDField;
    QRY_receber1RC1_VENDEDOR: TIntegerField;
    QRY_receber1RC1_COMISSAO: TBCDField;
    QRY_receber1RC1_COMCAIXA: TIntegerField;
    QRY_receber1RC1_CCOPCAIXA: TIntegerField;
    QRY_receber1RC1_DCOPCAIXA: TIntegerField;
    QRY_receber1RC1_HISTORICO1: TStringField;
    QRY_receber1RC1_HISTORICO2: TStringField;
    QRY_receber1RC1_LANCAIXA: TSmallintField;
    QRY_receber1RC1_MVESTOQUE1: TStringField;
    QRY_receber1RC1_GRUPO: TIntegerField;
    QRY_receber1RC1_DIGITADO: TDateField;
    QRY_receber1RC1_PERDIDA: TStringField;
    QRY_receber1RC1_FINANCIADO: TStringField;
    QRY_receber1RC1_NFISCAL: TStringField;
    QRY_receber1RC1_VEICULO: TIntegerField;
    QRY_receber1RC1_FATORVALOR: TBCDField;
    QRY_receber1RC1_FATORTAXA: TFMTBCDField;
    QRY_receber1RC1_DATAREQUIS: TDateField;
    QRY_receber1RC1_ENDERECO: TIntegerField;
    QRY_receber1RC1_TIPODOCUMENTO: TIntegerField;
    QRY_receber1RC1_REPLICPDV: TStringField;
    QRY_receber1RC1_DOCTOEXTERNO: TIntegerField;
    QRY_receber1RC1_AGRUPA: TStringField;
    QRY_receber1RC1_CHAVEAGRUPA: TStringField;
    QRY_receber1RC1_DATAREAJUSTE: TDateField;
    QRY_receber1RC1_REAJUSTADO: TStringField;
    QRY_receber1RC1_USERPERD: TIntegerField;
    QRY_receber1RC1_NUMCOO: TStringField;
    QRY_receber1RC1_VENDAOS: TStringField;
    QRY_receber1RC1_CENTROCUSTO: TIntegerField;
    QRY_receber2RC2_ID: TIntegerField;
    QRY_receber2RC2_DOCREC: TStringField;
    QRY_receber2RC2_CONTROLE: TSmallintField;
    QRY_receber2RC2_PARCELA: TSmallintField;
    QRY_receber2RC2_VENCIMENTO: TDateField;
    QRY_receber2RC2_VALOR: TBCDField;
    QRY_receber2RC2_BANCO: TIntegerField;
    QRY_receber2RC2_HAVER: TBCDField;
    QRY_receber2RC2_SALDO: TBCDField;
    QRY_receber2RC2_DATABASE: TDateField;
    QRY_receber2RC2_MORADIA: TBCDField;
    QRY_receber2RC2_CNPJCPF: TStringField;
    QRY_receber2RC2_NOMEMITE: TStringField;
    QRY_receber2RC2_BANCOEMI: TStringField;
    QRY_receber2RC2_AGENCIA: TStringField;
    QRY_receber2RC2_CONTACOR: TStringField;
    QRY_receber2RC2_DATABAIXA: TDateField;
    QRY_receber2RC2_VLRRECEBIDO: TBCDField;
    QRY_receber2RC2_RECIBO: TStringField;
    QRY_receber2RC2_DEVOLUCAO: TStringField;
    QRY_receber2RC2_CHEQUE: TStringField;
    QRY_receber2RC2_OBSERVACAO: TStringField;
    QRY_receber2RC2_STATUS: TStringField;
    QRY_receber2RC2_COMCAIXA: TIntegerField;
    QRY_receber2RC2_CCOPCAIXA: TIntegerField;
    QRY_receber2RC2_DCOPCAIXA: TIntegerField;
    QRY_receber2RC2_HISTORICO1: TStringField;
    QRY_receber2RC2_HISTORICO2: TStringField;
    QRY_receber2RC2_LANCAIXA: TSmallintField;
    QRY_receber2RC2_COMISSAO: TBCDField;
    QRY_receber2RC2_VENCORIGEM: TDateField;
    QRY_receber2RD2_ADICIONAL: TBCDField;
    QRY_receber2RC2_MOTIVO: TStringField;
    QRY_receber2RC2_MARCAR: TStringField;
    QRY_receber2RC2_BOLETO: TStringField;
    QRY_receber2RC2_BOLETOP: TIntegerField;
    QRY_receber2RC2_FILIALREC: TIntegerField;
    QRY_receber2RC2_NUMEROCH: TStringField;
    QRY_receber2RC2_DOCVENDA: TStringField;
    QRY_receber2RC2_VISTA: TStringField;
    QRY_receber2RC2_TIPODOC: TStringField;
    QRY_receber2RC2_HORABAIXA: TTimeField;
    QRY_receber2RC2_DATAREAJUSTE: TDateField;
    QRY_receber2RC2_REPLICPDV: TStringField;
    QRY_receber2RC2_AGRUPA: TStringField;
    QRY_receber2RC2_CHAVEAGRUPA: TStringField;
    QRY_receber2RC2_DATARECEB: TDateField;
    QRY_receber2RC2_TOLERAJURO: TIntegerField;
    QRY_receber2RC2_TIPODOCUMENTO: TIntegerField;
    QRY_receber2RC2_DATABANCO: TDateField;
    QRY_receber2RC2_USUFATURA: TIntegerField;
    QRY_receber2RC2_DATAFATURA: TDateField;
    QRY_receber2RC2_HORAFATURA: TTimeField;
    QRY_receber2RC2_CAIXAIMP: TStringField;
    QRY_receber2RC2_BANCOCONTA: TIntegerField;
    QRY_receber2RC2_CAIXAIMPR: TStringField;
    QRY_receber2RC2_USUFATURAR: TIntegerField;
    QRY_receber2RC2_RECEBIDOFATURA: TIntegerField;
    QRY_receber2RC2_USUFATURAG: TIntegerField;
    QRY_receber2RC2_DATAFATURAG: TDateField;
    QRY_receber2RC2_HORAFATURAG: TTimeField;
    QRY_receber2RC2_CAIXAIMPG: TStringField;
    QRY_receber2RC2_NOMUSUFATURAR: TStringField;
    QRY_receber2RC2_MOEDA: TStringField;
    QRY_receber2RC2_FILIAL: TIntegerField;
    QRY_receber2RC2_ORGPROTEC: TIntegerField;
    QRY_receber2RC2_PATHIMAGEM: TStringField;
    QRY_mvCaixaMCX_ID: TIntegerField;
    QRY_mvCaixaMCX_DATA: TDateField;
    QRY_mvCaixaMCX_NUMERO: TSmallintField;
    QRY_mvCaixaMCX_DOCTO: TStringField;
    QRY_mvCaixaMCX_VENCIMENTO: TDateField;
    QRY_mvCaixaMCX_CONTABIL: TStringField;
    QRY_mvCaixaMCX_NOMINAL: TStringField;
    QRY_mvCaixaMCX_CREDEB: TStringField;
    QRY_mvCaixaMCX_VINCULA: TIntegerField;
    QRY_mvCaixaMCX_ENCERRA: TStringField;
    QRY_mvCaixaMCX_HISTORICO1: TStringField;
    QRY_mvCaixaMCX_HISTORICO2: TStringField;
    QRY_mvCaixaMCX_VALOR: TBCDField;
    QRY_mvCaixaMCX_COMCAIXA: TIntegerField;
    QRY_mvCaixaMCX_COPCAIXAD: TIntegerField;
    QRY_mvCaixaMCX_COPCAIXAC: TIntegerField;
    QRY_mvCaixaMCX_CARDEX: TIntegerField;
    QRY_mvCaixaMCX_CARDEXDC: TStringField;
    QRY_mvCaixaMCX_SETOR: TStringField;
    QRY_mvCaixaMCX_FUNCIONARIO: TIntegerField;
    QRY_mvCaixaMCX_RECIBO: TStringField;
    QRY_mvCaixaMCX_MVESTOQUE1: TStringField;
    QRY_mvCaixaMCX_CAIXAIMP: TStringField;
    QRY_mvCaixaMCX_VEICULO: TIntegerField;
    QRY_mvCaixaMCX_CARTAOFIL: TStringField;
    QRY_mvCaixaMCX_CAIXA: TStringField;
    QRY_mvCaixaMCX_NDELETE: TStringField;
    QRY_mvCaixaMCX_EFETIVADO: TStringField;
    QRY_mvCaixaMCX_DEPROD: TIntegerField;
    QRY_mvCaixaMCX_FILIAL: TIntegerField;
    QRY_mvCaixaMCX_FORNECEDOR: TIntegerField;
    QRY_mvCaixaMCX_EMITENTE: TStringField;
    QRY_mvCaixaMCX_ENDEMITENTE: TStringField;
    QRY_mvCaixaMCX_CPFEMITENTE: TStringField;
    QRY_mvCaixaMCX_RGEMITENTE: TStringField;
    QRY_mvCaixaMCX_DATADIG: TDateField;
    QRY_mvCaixaMCX_USUARIO: TIntegerField;
    QRY_mvCaixaMCX_TIPOVENDAPDV: TStringField;
    QRY_mvCaixaMCX_REPLICPDV: TStringField;
    QRY_mvCaixaMCX_CLIENTE: TIntegerField;
    QRY_mvCaixaMCX_USUFATURA: TIntegerField;
    QRY_mvCaixaMCX_DATAFATURA: TDateField;
    QRY_mvCaixaMCX_HORAFATURA: TTimeField;
    QRY_mvCaixaMCX_MOEDA: TStringField;
    QRY_mvCaixaMCX_PORCENTOCARDEX: TBCDField;
    QRY_mvCaixaMCX_CENTROCUSTO: TIntegerField;
    QRY_mvCaixaMCX_PATHIMAGEM: TStringField;
    QRY_TVCompraTVC_DESCRICAO: TStringField;
    QRY_TVCompraTVC_TEF: TStringField;
    QRY_TVCompraTVC_TARIFA: TBCDField;
    QRY_TVCompraTVC_OPECAIXA: TIntegerField;
    QRY_TVCompraTVC_DEBITO: TIntegerField;
    QRY_TVCompraTVC_CREDITO: TIntegerField;
    QRY_TVCompraTVC_ESPECIAL: TStringField;
    QRY_TVCompraTVC_LETRA: TStringField;
    QRY_TVCompraTVC_DESCONTO: TBCDField;
    QRY_TVCompraTVC_GERAREC: TStringField;
    QRY_TVCompraTVC_CLIENTE: TIntegerField;
    QRY_TVCompraTVC_TIPOVENDA: TStringField;
    QRY_TVCompraTVC_PONTOSFIDEL: TBCDField;
    QRY_TVCompraTVC_PRAZOPARCELA: TIntegerField;
    QRY_TVCompraTVC_NUMEROPARCELA: TIntegerField;
    QRY_TVCompraTVC_DESCONTOATACADO: TBCDField;
    QRY_TVCompraTVC_ATACADO: TStringField;
    QRY_TVCompraTVC_TIPODOCREC: TStringField;
    QRY_TVCompraTVC_CARTAOCREDEB: TStringField;
    QRY_TVCompraTVC_MOEDA: TStringField;
    QRY_TVCompraTVC_TIPODOCUMENTO: TIntegerField;
    QRY_TVCompraTIP_NOME: TStringField;
    QRY_TVCompra2: TFDQuery;
    QRY_TVCompra2TVC_ID: TIntegerField;
    QRY_TVCompra2TVC_DESCRICAO: TStringField;
    QRY_TVCompra2TVC_TEF: TStringField;
    QRY_TVCompra2TVC_TARIFA: TBCDField;
    QRY_TVCompra2TVC_OPECAIXA: TIntegerField;
    QRY_TVCompra2TVC_DEBITO: TIntegerField;
    QRY_TVCompra2TVC_CREDITO: TIntegerField;
    QRY_TVCompra2TVC_ESPECIAL: TStringField;
    QRY_TVCompra2TVC_LETRA: TStringField;
    QRY_TVCompra2TVC_DESCONTO: TBCDField;
    QRY_TVCompra2TVC_GERAREC: TStringField;
    QRY_TVCompra2TVC_CLIENTE: TIntegerField;
    QRY_TVCompra2TVC_TIPOVENDA: TStringField;
    QRY_TVCompra2TVC_PONTOSFIDEL: TBCDField;
    QRY_TVCompra2TVC_PRAZOPARCELA: TIntegerField;
    QRY_TVCompra2TVC_NUMEROPARCELA: TIntegerField;
    QRY_TVCompra2TVC_DESCONTOATACADO: TBCDField;
    QRY_TVCompra2TVC_ATACADO: TStringField;
    QRY_TVCompra2TVC_TIPODOCREC: TStringField;
    QRY_TVCompra2TVC_CARTAOCREDEB: TStringField;
    QRY_TVCompra2TVC_MOEDA: TStringField;
    QRY_TVCompra2TVC_TIPODOCUMENTO: TIntegerField;
    QRY_TVCompraTIP_ID: TIntegerField;
    TB_prazoPr_banco: TIntegerField;
    TB_vistaDin_data: TDateField;
    TB_vistaDin_valor: TCurrencyField;
    TB_CHVistaChv_numCheque: TIntegerField;
    TB_CHVistaChv_nomeBanco: TStringField;
    TB_CHVistaChv_NumBanco: TIntegerField;
    TB_CHVistaChv_cpfCnpj: TStringField;
    TB_CHVistaChv_numAgencia: TStringField;
    TB_CHVistaChv_numCCorrente: TStringField;
    TB_CHVistaChv_nomeEmitente: TStringField;
    TB_CHVistaChv_valor: TCurrencyField;
    TB_CDebitoCd_valor: TCurrencyField;
    TB_CDebitoCd_data: TDateField;
    TB_CCreditoCc_dias: TIntegerField;
    TB_CCreditoCc_vcmto: TDateField;
    TB_CCreditoCc_operacao: TStringField;
    TB_CCreditoCc_documento: TStringField;
    TB_CCreditoCc_banco: TStringField;
    edtDesconto: TcxCurrencyEdit;
    edtPercentual: TcxCurrencyEdit;
    lblValorSemDesconto: TLabel;
    lblVlrSDscto: TLabel;
    frxDB_proConsumido: TfrxDBDataset;
    frxDB_filial: TfrxDBDataset;
    TB_CHPreChp_vcmto: TDateField;
    TB_CHPreChp_dias: TIntegerField;
    TB_CHPreChp_numCheque: TStringField;
    TB_CHPreChp_nomeBanco: TStringField;
    TB_CHPreChp_numBanco: TIntegerField;
    TB_CHPreChp_cpfCnpj: TStringField;
    TB_CHPreChp_numAgencia: TStringField;
    TB_CHPreChp_numCCorrente: TStringField;
    TB_CHPreChp_nomeEmitente: TStringField;
    TB_CHPreChp_bancoCiec: TIntegerField;
    frxReportCI: TfrxReport;
    frxDB_fechaHospede: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxDB_TB_prazo: TfrxDBDataset;
    frxDB_TB_CHPre: TfrxDBDataset;
    frxDB_TB_CHVista: TfrxDBDataset;
    frxDB_TB_CDebito: TfrxDBDataset;
    frxDB_TB_CCredito: TfrxDBDataset;
    frxDB_TB_vista: TfrxDBDataset;
    QRY_hotentraHospede: TFDQuery;
    frxReportSI: TfrxReport;
    QRY_hotentraHospedeENT_CODENTRADA: TIntegerField;
    QRY_hotentraHospedeENT_CODAPARTAMENTO: TIntegerField;
    QRY_hotentraHospedeENT_CODHOSPEDE: TIntegerField;
    QRY_hotentraHospedeENT_DATAENTRADA: TDateField;
    QRY_hotentraHospedeENT_QTD_DIARIA_NORMAL: TIntegerField;
    QRY_hotentraHospedeENT_QTD_DIARIA_EXTRA: TIntegerField;
    QRY_hotentraHospedeENT_VLR_G_DIARIA_EXTRA: TBCDField;
    QRY_hotentraHospedeENT_VLR_G_DIARIA_NORMAL: TBCDField;
    QRY_hotentraHospedeENT_VLR_DIARIA_EXTRA: TBCDField;
    QRY_hotentraHospedeENT_DATASAIDA: TDateField;
    QRY_hotentraHospedeENT_HORASAIDA: TTimeField;
    QRY_hotentraHospedeENT_TOT_GERAL_BAR: TBCDField;
    QRY_hotentraHospedeENT_TOT_GERAL_DIARIAS: TBCDField;
    QRY_hotentraHospedeENT_TOT_GERAL_LICAGAO: TStringField;
    QRY_hotentraHospedeENT_VLR_TOTAL_DIARIAS: TBCDField;
    QRY_hotentraHospedeENT_QTD_TOTAL_DIARIAS: TIntegerField;
    QRY_hotentraHospedeENT_PREVISAO: TDateField;
    QRY_hotentraHospedeENT_DESCACRESCGERAL: TBCDField;
    QRY_hotentraHospedeENT_TOTALPAGO: TBCDField;
    QRY_hotentraHospedeENT_QTDADULTOS: TIntegerField;
    QRY_hotentraHospedeENT_QTDCRIANCAS: TIntegerField;
    QRY_hotentraHospedeENT_QTDPAGANTES: TIntegerField;
    QRY_hotentraHospedeENT_PLACA: TStringField;
    QRY_hotentraHospedeENT_MODELOVEICULO: TStringField;
    QRY_hotentraHospedeENT_MARCAVEICULO: TStringField;
    QRY_hotentraHospedeENT_FILIAL: TStringField;
    QRY_hotentraHospedeENT_VLR_DIARIA_NORMAL: TBCDField;
    QRY_hotentraHospedeENT_DATARESERVA: TDateField;
    QRY_hotentraHospedeENT_HORARESERVA: TTimeField;
    QRY_hotentraHospedeENT_USUARIORESERVOU: TIntegerField;
    QRY_hotentraHospedeENT_DATAEFETIVARESERVA: TDateField;
    QRY_hotentraHospedeENT_STATUS: TStringField;
    QRY_hotentraHospedeENT_DATAPREVISAOEFETIVAR: TDateField;
    QRY_hotentraHospedeENT_HORAENTRADA: TTimeField;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtVistaExit(Sender: TObject);
    procedure edtPrazoExit(Sender: TObject);
    procedure edtChVistaExit(Sender: TObject);
    procedure edtChPreExit(Sender: TObject);
    procedure edtCCreditoExit(Sender: TObject);
    procedure edtCDebitoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtPercentualExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    // procedure CalculaDiferenca(Sender: TObject; FPgto:Integer);
    procedure CalculaDiferenca(Sender: TObject);
    procedure somaDif();
  public
    { Public declarations }
  var
    TipoPgto, FpgtoControle: Integer;
    VlrParcelar: Double;
    // FpgtoControle : String;   //FpgtoControle para filtrar as formas de pagamentos
  end;

var
  F_formasPgto: TF_formasPgto;

implementation

{$R *.dfm}

uses UFechaHospedes, UDMHospedes, UDMConexao, UParcelamento, UMsg,
  UPesquisaFormasPgto, UDMFilial, UDMCadApto, UDMProdutosApto, UDMRackApto,
  UCheckIn, UFechaApto;

procedure TF_formasPgto.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if TF_msg.Mensagem('Deseja mesmo cancelar a operação?','Q',[mbSim,mbNao]) then begin
    Self.Close;
  end;
end;

procedure TF_formasPgto.btnSalvarClick(Sender: TObject);
var
  contador: Integer;
begin
  inherited;
  { Salvando as informações no banco de dados }

  contador := TB_vista.RecordCount + TB_prazo.RecordCount + TB_CHPre.RecordCount
    + TB_CHVista.RecordCount + TB_CDebito.RecordCount + TB_CCredito.RecordCount;

  if contador > 0 then
  begin
    try

      F_dmConexao.FDConn.StartTransaction;

      if TB_vista.RecordCount > 0 then
      begin
        { Cadastro da Tabela a Vista: MovCaixa, MvEstoque3 }
{$REGION 'QRY_vista'}
{$REGION 'MovCaixa'}
        { 1ª Tabela - MovCaixa } // ok
        QRY_mvCaixa.Open();
        QRY_mvCaixa.Append;

        // foi passado os dados do tipovendacompra manualmente

        TB_vista.First;
        while not TB_vista.Eof do
        begin
          QRY_mvCaixaMCX_DATA.AsDateTime := Now;
          QRY_mvCaixaMCX_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'DIN';
          QRY_mvCaixaMCX_CONTABIL.AsInteger := 2; // default
          QRY_mvCaixaMCX_VINCULA.AsInteger := 51; // default
          QRY_mvCaixaMCX_HISTORICO1.AsString := 'FECHAMENTO A VISTA / DINHEIRO';
          QRY_mvCaixaMCX_HISTORICO2.AsString := 'PAGAMENTO COM DINHEIRO';
          QRY_mvCaixaMCX_VALOR.AsCurrency := TB_vistaDin_valor.AsCurrency;
          QRY_mvCaixaMCX_COMCAIXA.AsInteger := 1;
          QRY_mvCaixaMCX_COPCAIXAD.AsInteger := 5;
          QRY_mvCaixaMCX_COPCAIXAC.AsInteger := 200;
          QRY_mvCaixaMCX_SETOR.AsString := '03';
          QRY_mvCaixaMCX_NDELETE.AsString := 'N';
          QRY_mvCaixaMCX_EFETIVADO.AsString := 'S';
          QRY_mvCaixaMCX_FILIAL.AsInteger := 1; // pegar a filial logada
          QRY_mvCaixaMCX_MOEDA.AsString := 'DIN';
          QRY_mvCaixaMCX_PORCENTOCARDEX.AsFloat := 0;
          QRY_mvCaixaMCX_CENTROCUSTO.AsString := '1';
          // ver a possibilidade de escolher o centro e custo
          QRY_mvCaixaMCX_CLIENTE.AsInteger :=
            F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsInteger;
          TB_vista.Next;
        end;
        if QRY_mvCaixaMCX_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MOVCAIXA', QRY_mvCaixaMCX_ID) then
          begin
            abort;
          end;
        end;
        // 3º insere os dados
        QRY_mvCaixaMCX_ID.AsInteger := F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvCaixa.Post;
        QRY_mvCaixa.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvCaixa.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.

{$ENDREGION}
{$REGION 'MvEstoque3'}
        { 2ª Tabela - MvEstoque3 } // ok
        QRY_mvEstoque3.Open();
        QRY_mvEstoque3.Append;

        TB_vista.First;
        while not TB_vista.Eof do
        begin
          QRY_mvEstoque3ME3_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'DIN';;
          QRY_mvEstoque3ME3_OPERACAO.AsString := '5';
          QRY_mvEstoque3ME3_DINHEIRO.AsCurrency := TB_vistaDin_valor.AsCurrency;
          QRY_mvEstoque3ME3_CHEQUE.AsCurrency := 0;
          QRY_mvEstoque3ME3_CHEQUEPRE.AsCurrency := 0;
          QRY_mvEstoque3ME3_CARTAOCREDITO.AsCurrency := 0;
          QRY_mvEstoque3ME3_CARTAODEBITO.AsCurrency := 0;
          QRY_mvEstoque3ME3_PRAZO.AsCurrency := 0;
          QRY_mvEstoque3ME3_FILIAL.AsInteger := 1;
          QRY_mvEstoque3ME3_TIPOVENDACOMPRA.AsInteger := 1;
          // default VISTA (DINHEIRO)
          QRY_mvEstoque3ME3_OBSERVACAO.AsString := 'VISTA (DINHEIRO)';
          TB_vista.Next;
        end;
        if QRY_mvEstoque3ME3_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MVESTOQUE3', QRY_mvEstoque3ME3_ID) then
          begin
            abort;
          end;
        end;

        // 3º insere os dados
        QRY_mvEstoque3ME3_ID.AsInteger :=
          F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvEstoque3.Post;
        QRY_mvEstoque3.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvEstoque3.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.

{$ENDREGION}
{$ENDREGION}
      end;

      if TB_CHVista.RecordCount > 0 then
      begin
        { Cadastro da Tabela Cheque a Vista: MovCaixa, MvEstoque3 - Por enquanto não vai gerar o Receber dele não. }
{$REGION 'QRY_chVista'}
{$REGION 'MovCaixa'}
        { 1ª Tabela - MovCaixa } // ok
        QRY_mvCaixa.Open();
        QRY_mvCaixa.Append;

        // foi passado os dados do tipovendacompra manualmente

        TB_CHVista.First;
        while not TB_CHVista.Eof do
        begin
          QRY_mvCaixaMCX_DATA.AsDateTime := Now;
          QRY_mvCaixaMCX_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CHV';
          QRY_mvCaixaMCX_CONTABIL.AsInteger := 2; // default
          QRY_mvCaixaMCX_VINCULA.AsInteger := 51; // default
          QRY_mvCaixaMCX_HISTORICO1.AsString :=
            'FECHAMENTO A VISTA / (CHEQUE VISTA)';
          QRY_mvCaixaMCX_HISTORICO2.AsString := 'PAGAMENTO COM CHEQUE VISTA';
          QRY_mvCaixaMCX_VALOR.AsCurrency := TB_CHVistaChv_valor.AsCurrency;
          QRY_mvCaixaMCX_COMCAIXA.AsInteger := 1;
          QRY_mvCaixaMCX_COPCAIXAD.AsInteger := 5;
          QRY_mvCaixaMCX_COPCAIXAC.AsInteger := 200;
          QRY_mvCaixaMCX_SETOR.AsString := '03';
          QRY_mvCaixaMCX_NDELETE.AsString := 'N';
          QRY_mvCaixaMCX_EFETIVADO.AsString := 'S';
          QRY_mvCaixaMCX_FILIAL.AsInteger := 1; // pegar a filial logada
          QRY_mvCaixaMCX_MOEDA.AsString := 'CHV';
          QRY_mvCaixaMCX_PORCENTOCARDEX.AsFloat := 0;
          QRY_mvCaixaMCX_CENTROCUSTO.AsString := '1';
          // ver a possibilidade de escolher o centro e custo
          QRY_mvCaixaMCX_CLIENTE.AsInteger :=
            F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsInteger;
          TB_CHVista.Next;
        end;
        if QRY_mvCaixaMCX_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MOVCAIXA', QRY_mvCaixaMCX_ID) then
          begin
            abort;
          end;
        end;
        // 3º insere os dados
        QRY_mvCaixaMCX_ID.AsInteger :=
          F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvCaixa.Post;
        QRY_mvCaixa.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvCaixa.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$REGION 'MvEstoque3'}
        { 2ª Tabela - MvEstoque3 } // ok
        QRY_mvEstoque3.Open();
        QRY_mvEstoque3.Append;

        TB_CHVista.First;
        while not TB_CHVista.Eof do
        begin
          QRY_mvEstoque3ME3_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CHV';
          QRY_mvEstoque3ME3_OPERACAO.AsString := '5';
          QRY_mvEstoque3ME3_DINHEIRO.AsCurrency := 0;
          QRY_mvEstoque3ME3_CHEQUE.AsCurrency := TB_CHVistaChv_valor.AsCurrency;
          QRY_mvEstoque3ME3_CHEQUEPRE.AsCurrency := 0;
          QRY_mvEstoque3ME3_CARTAOCREDITO.AsCurrency := 0;
          QRY_mvEstoque3ME3_CARTAODEBITO.AsCurrency := 0;
          QRY_mvEstoque3ME3_PRAZO.AsCurrency := 0;
          QRY_mvEstoque3ME3_FILIAL.AsInteger := 1;
          QRY_mvEstoque3ME3_TIPOVENDACOMPRA.AsInteger := 1;
          // default VISTA (CHEQUE A VISTA É DINHEIRO)
          QRY_mvEstoque3ME3_OBSERVACAO.AsString := 'VISTA (CHEQUE VISTA)';
          TB_CHVista.Next;
        end;
        if QRY_mvEstoque3ME3_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MVESTOQUE3', QRY_mvEstoque3ME3_ID) then
          begin
            abort;
          end;
        end;

        // 3º insere os dados
        QRY_mvEstoque3ME3_ID.AsInteger :=
          F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvEstoque3.Post;
        QRY_mvEstoque3.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvEstoque3.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.

{$ENDREGION}
{$ENDREGION}
      end;

      if TB_CHPre.RecordCount > 0 then
      begin
        { Cadastro da Tabela Cheque Pré: MovCaixa, MvEstoque3, Prazo, Receber1, Receber2 }
{$REGION 'QRY_chequePre'}
{$REGION 'MovCaixa'}
        { 1ª Tabela - MovCaixa } // ok
        QRY_mvCaixa.Open();
        QRY_mvCaixa.Append;

        with QRY_TVCompra do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select tv.*, cm.ctm_codigo, cm.ctm_copdebi, cm.ctm_copcred, td.tip_id, td.tip_nome from comcaixa cm');
          SQL.Add('inner join tipovendacompra tv');
          SQL.Add('on (tv.tvc_opecaixa = cm.ctm_codigo)');
          SQL.Add('inner join tipodocumento td');
          SQL.Add('  on (tv.tvc_tipodocumento = td.tip_id)');
          SQL.Add('where tv.tvc_id = :TvcId');
          ParamByName('TvcId').Value := 3;
          Open();
        end;

        TB_CHPre.First;
        while not TB_CHPre.Eof do
        begin
          QRY_mvCaixaMCX_DATA.AsDateTime := Now;
          QRY_mvCaixaMCX_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CHP';;
          QRY_mvCaixaMCX_CONTABIL.AsInteger := 2; // default
          QRY_mvCaixaMCX_VINCULA.AsInteger := 51; // default
          QRY_mvCaixaMCX_HISTORICO1.AsString := 'CHEQUE PRÉ (CHP)';
          QRY_mvCaixaMCX_HISTORICO2.AsString := QRY_TVCompraTIP_NOME.AsString;
          QRY_mvCaixaMCX_VALOR.AsCurrency := (TB_CHPreChp_valor.AsCurrency * TB_CHPre.RecordCount);
          QRY_mvCaixaMCX_COMCAIXA.AsInteger := QRY_TVCompraTVC_ID.AsInteger;
          QRY_mvCaixaMCX_COPCAIXAD.AsInteger := QRY_TVCompraCTM_COPDEBI.AsInteger;
          QRY_mvCaixaMCX_COPCAIXAC.AsInteger := QRY_TVCompraCTM_COPCRED.AsInteger;
          QRY_mvCaixaMCX_SETOR.AsString := '03';
          QRY_mvCaixaMCX_NDELETE.AsString := 'N';
          QRY_mvCaixaMCX_EFETIVADO.AsString := 'S';
          QRY_mvCaixaMCX_FILIAL.AsInteger := 1; // pegar a filial logada
          QRY_mvCaixaMCX_MOEDA.AsString := 'CHP';
          QRY_mvCaixaMCX_PORCENTOCARDEX.AsFloat := 0;
          QRY_mvCaixaMCX_CENTROCUSTO.AsString := '1';
          // ver a possibilidade de escolher o centro e custo
          QRY_mvCaixaMCX_CLIENTE.AsInteger := F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsInteger;
          TB_CHPre.Next;
        end;
        if QRY_mvCaixaMCX_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MOVCAIXA', QRY_mvCaixaMCX_ID) then
          begin
            abort;
          end;
        end;
        // 3º insere os dados
        QRY_mvCaixaMCX_ID.AsInteger := F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvCaixa.Post;
        QRY_mvCaixa.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvCaixa.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$REGION 'MvEstoque3'}
        { 2ª Tabela - MvEstoque3 } // ok
        QRY_mvEstoque3.Open();
        QRY_mvEstoque3.Append;

        TB_CHPre.First;
        while not TB_CHPre.Eof do
        begin
          QRY_mvEstoque3ME3_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CHP';;
          QRY_mvEstoque3ME3_OPERACAO.AsString := '5';
          QRY_mvEstoque3ME3_DINHEIRO.AsCurrency := 0;
          QRY_mvEstoque3ME3_CHEQUE.AsCurrency := 0;
          QRY_mvEstoque3ME3_CHEQUEPRE.AsCurrency := (TB_CHPreChp_valor.AsCurrency * TB_CHPre.RecordCount);
          QRY_mvEstoque3ME3_CARTAOCREDITO.AsCurrency := 0;
          QRY_mvEstoque3ME3_CARTAODEBITO.AsCurrency := 0;
          QRY_mvEstoque3ME3_PRAZO.AsCurrency := 0;
          QRY_mvEstoque3ME3_FILIAL.AsInteger := 1;
          QRY_mvEstoque3ME3_TIPOVENDACOMPRA.AsInteger := QRY_TVCompraCTM_CODIGO.AsInteger;
          QRY_mvEstoque3ME3_OBSERVACAO.AsString := 'CHEQUE PRÉ (CHP)';
          TB_CHPre.Next;
        end;
        if QRY_mvEstoque3ME3_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MVESTOQUE3', QRY_mvEstoque3ME3_ID) then
          begin
            abort;
          end;
        end;

        // 3º insere os dados
        QRY_mvEstoque3ME3_ID.AsInteger := F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvEstoque3.Post;
        QRY_mvEstoque3.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvEstoque3.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$REGION 'Prazo'}
        { 3ª Tabela - Prazo } // ok

        TB_CHPre.First;
        while not TB_CHPre.Eof do
        begin
          QRY_prazo.Open();
          QRY_prazo.Append;

          QRY_prazoPRA_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CHP';
          QRY_prazoPRA_TIPO.AsString := '2'; // default
          QRY_prazoPRA_VALOR.AsCurrency := TB_CHPreChp_valor.AsCurrency;
          QRY_prazoPRA_VENCIMENTO.AsDateTime := TB_CHPreChp_vcmto.AsDateTime;
          QRY_prazoPRA_EMISSAO.AsDateTime := Now;
          QRY_prazoPRA_PRAZO.AsInteger := TB_CHPreChp_dias.AsInteger;
          QRY_prazoPRA_TIPODOC.AsString := QRY_TVCompraTVC_TIPODOCREC.AsString;
          QRY_prazoPRA_BANCO.AsInteger := TB_CHPreChp_bancoCiec.AsInteger;
          QRY_prazoPRA_TVCID.AsInteger := QRY_TVCompraTVC_ID.AsInteger;
          QRY_prazoPRA_REPLICPDV.AsString := '2'; // ver com lindomar a lógica
          QRY_prazoPRA_FILIAL.AsInteger := 1; // opção de pegar a filial logada
          QRY_prazoPRA_QUANTPARCELAS.AsInteger := TB_CHPre.RecordCount;

          { essa verificação tem que ser >= 0 - sempre vai ser 0, porém coloquei o maior para nao ter erros. }
          if QRY_prazoPRA_ID.AsInteger >= 0 then
          begin
            if not F_dmConexao.GeraChave('PRAZO', QRY_prazoPRA_ID) then
            begin
              abort;
            end;
          end;

          QRY_prazoPRA_ID.AsInteger := F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
          QRY_prazo.Post;

          TB_CHPre.Next;
        end;

        QRY_prazo.ApplyUpdates(0);
        QRY_prazo.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.

{$ENDREGION}
{$REGION 'Receber1'}
        { 4ª Tabela - Receber1 }
        QRY_receber1.Open();
        QRY_receber1.Append;

        TB_CHPre.First;
        while not TB_CHPre.Eof do
        begin
          QRY_receber1RC1_DOCREC.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CHP';
          QRY_receber1RC1_CONTROLE.AsInteger := 40; // QRY_TVCompraTVC_ID.AsInteger;
          QRY_receber1RC1_PARCELA.AsInteger := TB_CHPre.RecordCount;
          QRY_receber1RC1_SETOR.AsString := '03'; // default
          QRY_receber1RC1_FILIAL.AsInteger := 1; // ver opção de pegar filial logada
          QRY_receber1RC1_TIPOREC.AsString := IntToStr(QRY_TVCompraTIP_ID.AsInteger);
          QRY_receber1RC1_EMISSAO.AsDateTime := Now;
          QRY_receber1RC1_VALORTOTAL.AsCurrency := TB_CHPreChp_valor.AsCurrency * TB_CHPre.RecordCount;
          QRY_receber1RC1_CLIENTE.AsInteger := F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsInteger;
          QRY_receber1RC1_VLRPRODUTO.AsCurrency := 0;
          QRY_receber1RC1_VLRSERVICO.AsCurrency := 0;
          QRY_receber1RC1_CUSTOVENDA.AsCurrency := 0;
          QRY_receber1RC1_VENDEDOR.AsInteger := 1; // pegar o id do usuário logado
          QRY_receber1RC1_COMISSAO.AsCurrency := 0;
          QRY_receber1RC1_COMCAIXA.AsInteger := QRY_TVCompraCTM_CODIGO.AsInteger;
          QRY_receber1RC1_CCOPCAIXA.AsInteger := QRY_TVCompraCTM_COPCRED.AsInteger; // plano conta crédito
          QRY_receber1RC1_DCOPCAIXA.AsInteger := QRY_TVCompraCTM_COPDEBI.AsInteger; // plano conta débito
          QRY_receber1RC1_HISTORICO1.AsString := 'VENDA CHEQUE PRÉ (CHP)';
          QRY_receber1RC1_HISTORICO2.AsString := QRY_TVCompraTIP_NOME.AsString;
          QRY_receber1RC1_MVESTOQUE1.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger);
          QRY_receber1RC1_GRUPO.AsInteger := 1; // default
          QRY_receber1RC1_DIGITADO.AsDateTime := Now;
          QRY_receber1RC1_FATORVALOR.AsCurrency := 0;
          QRY_receber1RC1_TIPODOCUMENTO.AsInteger := QRY_TVCompraTIP_ID.AsInteger;
          TB_CHPre.Next;
        end;

        // 3º insere os dados
        QRY_receber1.Post;
        QRY_receber1.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_receber1.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$REGION 'Receber2'}
        { 5ª Tabela - Receber2 }
        TB_CHPre.First;
        while not TB_CHPre.Eof do
        begin
          QRY_receber2.Open();
          QRY_receber2.Append;

          QRY_receber2RC2_DOCREC.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CHP';;
          QRY_receber2RC2_CONTROLE.AsInteger := 40; // QRY_TVCompraTVC_ID.AsInteger;
          QRY_receber2RC2_PARCELA.AsInteger := TB_CHPre.RecordCount;
          QRY_receber2RC2_VENCIMENTO.AsDateTime := TB_CHPreChp_vcmto.AsDateTime;
          QRY_receber2RC2_VALOR.AsCurrency := TB_CHPreChp_valor.AsCurrency;
          QRY_receber2RC2_BANCO.AsInteger := TB_CHPreChp_bancoCiec.AsInteger;
          QRY_receber2RC2_HAVER.AsCurrency := 0;
          QRY_receber2RC2_SALDO.AsCurrency := TB_CHPreChp_valor.AsCurrency;
          QRY_receber2RC2_DATABASE.AsDateTime := TB_CHPreChp_vcmto.AsDateTime;
          QRY_receber2RC2_MORADIA.AsCurrency := 0;
          QRY_receber2RC2_FILIAL.AsInteger := 1; // ver opção de pegar filial logada

          { essa verificação tem que ser >= 0 - sempre vai ser 0, porém coloquei o maior para nao ter erros. }
          if QRY_receber2RC2_ID.AsInteger >= 0 then
          begin
            if not F_dmConexao.GeraChave('RECEBER2', QRY_receber2RC2_ID) then
            begin
              abort;
            end;
          end;

          QRY_receber2RC2_ID.AsInteger := F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
          QRY_receber2.Post;

          TB_CHPre.Next;
        end;

        QRY_receber2.ApplyUpdates(0);
        QRY_receber2.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$ENDREGION}
      end;

      if TB_CCredito.RecordCount > 0 then
      begin
        { Cadastro da Tabela Cartão de Crédito: MovCaixa, MvEstoque3, Prazo, Receber1, Receber2 }
{$REGION 'QRY_CCredito'}
{$REGION 'MovCaixa'}
        { 1ª Tabela - MovCaixa } // ok
        QRY_mvCaixa.Open();
        QRY_mvCaixa.Append;

        with QRY_TVCompra do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select tv.*, cm.ctm_codigo, cm.ctm_copdebi, cm.ctm_copcred, td.tip_id, td.tip_nome from comcaixa cm');
          SQL.Add('inner join tipovendacompra tv');
          SQL.Add('on (tv.tvc_opecaixa = cm.ctm_codigo)');
          SQL.Add('inner join tipodocumento td');
          SQL.Add('  on (tv.tvc_tipodocumento = td.tip_id)');
          SQL.Add('where tv.tvc_id = :TvcId');
          ParamByName('TvcId').Value := 4;
          Open();
        end;

        TB_CCredito.First;
        while not TB_CCredito.Eof do
        begin
          QRY_mvCaixaMCX_DATA.AsDateTime := Now;
          QRY_mvCaixaMCX_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CCR';
          QRY_mvCaixaMCX_CONTABIL.AsInteger := 2; // default
          QRY_mvCaixaMCX_VINCULA.AsInteger := 51; // default
          QRY_mvCaixaMCX_HISTORICO1.AsString := 'CARTÃO DE CÉDITO (CCR)';
          QRY_mvCaixaMCX_HISTORICO2.AsString := QRY_TVCompraTIP_NOME.AsString;
          QRY_mvCaixaMCX_VALOR.AsCurrency := (TB_CCreditoCc_valor.AsCurrency * TB_CCredito.RecordCount);
          QRY_mvCaixaMCX_COMCAIXA.AsInteger := QRY_TVCompraTVC_ID.AsInteger;
          QRY_mvCaixaMCX_COPCAIXAD.AsInteger := QRY_TVCompraCTM_COPDEBI.AsInteger;
          QRY_mvCaixaMCX_COPCAIXAC.AsInteger := QRY_TVCompraCTM_COPCRED.AsInteger;
          QRY_mvCaixaMCX_SETOR.AsString := '03';
          QRY_mvCaixaMCX_NDELETE.AsString := 'N';
          QRY_mvCaixaMCX_EFETIVADO.AsString := 'S';
          QRY_mvCaixaMCX_FILIAL.AsInteger := 1; // pegar a filial logada
          QRY_mvCaixaMCX_MOEDA.AsString := 'CCR';
          QRY_mvCaixaMCX_PORCENTOCARDEX.AsFloat := 0;
          QRY_mvCaixaMCX_CENTROCUSTO.AsString := '1'; // ver a possibilidade de escolher o centro e custo
          QRY_mvCaixaMCX_CLIENTE.AsInteger := F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsInteger;
          TB_CCredito.Next;
        end;
        if QRY_mvCaixaMCX_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MOVCAIXA', QRY_mvCaixaMCX_ID) then
          begin
            abort;
          end;
        end;
        // 3º insere os dados
        QRY_mvCaixaMCX_ID.AsInteger := F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvCaixa.Post;
        QRY_mvCaixa.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvCaixa.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$REGION 'MvEstoque3'}
        { 2ª Tabela - MvEstoque3 } // ok
        QRY_mvEstoque3.Open();
        QRY_mvEstoque3.Append;

        TB_CCredito.First;
        while not TB_CCredito.Eof do
        begin
          QRY_mvEstoque3ME3_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CCR';
          QRY_mvEstoque3ME3_OPERACAO.AsString := '5';
          QRY_mvEstoque3ME3_DINHEIRO.AsCurrency := 0;
          QRY_mvEstoque3ME3_CHEQUE.AsCurrency := 0;
          QRY_mvEstoque3ME3_CHEQUEPRE.AsCurrency := 0;
          QRY_mvEstoque3ME3_CARTAOCREDITO.AsCurrency := (TB_CCreditoCc_valor.AsCurrency * TB_CCredito.RecordCount);
          QRY_mvEstoque3ME3_CARTAODEBITO.AsCurrency := 0;
          QRY_mvEstoque3ME3_PRAZO.AsCurrency := 0;
          QRY_mvEstoque3ME3_FILIAL.AsInteger := 1;
          QRY_mvEstoque3ME3_TIPOVENDACOMPRA.AsInteger := QRY_TVCompraCTM_CODIGO.AsInteger;
          QRY_mvEstoque3ME3_OBSERVACAO.AsString := 'CARTÃO DE CRÉDITO (CCR)';
          TB_CCredito.Next;
        end;
        if QRY_mvEstoque3ME3_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MVESTOQUE3', QRY_mvEstoque3ME3_ID) then
          begin
            abort;
          end;
        end;

        // 3º insere os dados
        QRY_mvEstoque3ME3_ID.AsInteger := F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvEstoque3.Post;
        QRY_mvEstoque3.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvEstoque3.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$REGION 'Prazo'}
        { 3ª Tabela - Prazo } // ok

        TB_CCredito.First;
        while not TB_CCredito.Eof do
        begin
          QRY_prazo.Open();
          QRY_prazo.Append;

          QRY_prazoPRA_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CCR';
          QRY_prazoPRA_TIPO.AsString := '2'; // default
          QRY_prazoPRA_VALOR.AsCurrency := TB_CCreditoCc_valor.AsCurrency;
          QRY_prazoPRA_VENCIMENTO.AsDateTime := TB_CCreditoCc_vcmto.AsDateTime;
          QRY_prazoPRA_EMISSAO.AsDateTime := Now;
          QRY_prazoPRA_PRAZO.AsInteger := TB_CCreditoCc_dias.AsInteger;
          QRY_prazoPRA_TIPODOC.AsString := QRY_TVCompraTVC_TIPODOCREC.AsString;
          QRY_prazoPRA_BANCO.AsInteger := StrToInt(TB_CCreditoCc_banco.AsString);
          QRY_prazoPRA_TVCID.AsInteger := QRY_TVCompraTVC_ID.AsInteger;
          QRY_prazoPRA_REPLICPDV.AsString := '2'; // ver com lindomar a lógica
          QRY_prazoPRA_FILIAL.AsInteger := 1; // opção de pegar a filial logada
          QRY_prazoPRA_QUANTPARCELAS.AsInteger := TB_CCredito.RecordCount;

          { essa verificação tem que ser >= 0 - sempre vai ser 0, porém coloquei o maior para nao ter erros. }
          if QRY_prazoPRA_ID.AsInteger >= 0 then
          begin
            if not F_dmConexao.GeraChave('PRAZO', QRY_prazoPRA_ID) then
            begin
              abort;
            end;
          end;

          QRY_prazoPRA_ID.AsInteger := F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
          QRY_prazo.Post;

          TB_CCredito.Next;
        end;

        QRY_prazo.ApplyUpdates(0);
        QRY_prazo.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.

{$ENDREGION}
{$REGION 'Receber1'}
        { 4ª Tabela - Receber1 }
        QRY_receber1.Open();
        QRY_receber1.Append;

        TB_CCredito.First;
        while not TB_CCredito.Eof do
        begin
          QRY_receber1RC1_DOCREC.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CCR';
          QRY_receber1RC1_CONTROLE.AsInteger := 40; // QRY_TVCompraTVC_ID.AsInteger;
          QRY_receber1RC1_PARCELA.AsInteger := TB_CCredito.RecordCount;
          QRY_receber1RC1_SETOR.AsString := '03'; // default
          QRY_receber1RC1_FILIAL.AsInteger := 1; // ver opção de pegar filial logada
          QRY_receber1RC1_TIPOREC.AsString := IntToStr(QRY_TVCompraTIP_ID.AsInteger);
          QRY_receber1RC1_EMISSAO.AsDateTime := Now;
          QRY_receber1RC1_VALORTOTAL.AsCurrency := TB_CCreditoCc_valor.AsCurrency * TB_CCredito.RecordCount;
          QRY_receber1RC1_CLIENTE.AsInteger := F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsInteger;
          QRY_receber1RC1_VLRPRODUTO.AsCurrency := 0;
          QRY_receber1RC1_VLRSERVICO.AsCurrency := 0;
          QRY_receber1RC1_CUSTOVENDA.AsCurrency := 0;
          QRY_receber1RC1_VENDEDOR.AsInteger := 1; // pegar o id do usuário logado
          QRY_receber1RC1_COMISSAO.AsCurrency := 0;
          QRY_receber1RC1_COMCAIXA.AsInteger := QRY_TVCompraCTM_CODIGO.AsInteger;
          QRY_receber1RC1_CCOPCAIXA.AsInteger := QRY_TVCompraCTM_COPCRED.AsInteger; // plano conta crédito
          QRY_receber1RC1_DCOPCAIXA.AsInteger := QRY_TVCompraCTM_COPDEBI.AsInteger; // plano conta débito
          QRY_receber1RC1_HISTORICO1.AsString := 'VENDA CHEQUE PRÉ (CHP)';
          QRY_receber1RC1_HISTORICO2.AsString := QRY_TVCompraTIP_NOME.AsString;
          QRY_receber1RC1_MVESTOQUE1.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger);
          QRY_receber1RC1_GRUPO.AsInteger := 1; // default
          QRY_receber1RC1_DIGITADO.AsDateTime := Now;
          QRY_receber1RC1_FATORVALOR.AsCurrency := 0;
          QRY_receber1RC1_TIPODOCUMENTO.AsInteger := QRY_TVCompraTIP_ID.AsInteger;
          TB_CCredito.Next;
        end;

        // 3º insere os dados
        QRY_receber1.Post;
        QRY_receber1.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_receber1.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$REGION 'Receber2'}
        { 5ª Tabela - Receber2 }
        TB_CCredito.First;
        while not TB_CCredito.Eof do
        begin
          QRY_receber2.Open();
          QRY_receber2.Append;

          QRY_receber2RC2_DOCREC.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CCR';
          QRY_receber2RC2_CONTROLE.AsInteger := 40; // QRY_TVCompraTVC_ID.AsInteger;
          QRY_receber2RC2_PARCELA.AsInteger := TB_CCredito.RecordCount;
          QRY_receber2RC2_VENCIMENTO.AsDateTime := TB_CCreditoCc_vcmto.AsDateTime;
          QRY_receber2RC2_VALOR.AsCurrency := TB_CCreditoCc_valor.AsCurrency;
          QRY_receber2RC2_BANCO.AsInteger := StrToInt(TB_CCreditoCc_banco.AsString);
          QRY_receber2RC2_HAVER.AsCurrency := 0;
          QRY_receber2RC2_SALDO.AsCurrency := TB_CCreditoCc_valor.AsCurrency;
          QRY_receber2RC2_DATABASE.AsDateTime := TB_CCreditoCc_vcmto.AsDateTime;
          QRY_receber2RC2_MORADIA.AsCurrency := 0;
          QRY_receber2RC2_FILIAL.AsInteger := 1; // ver opção de pegar filial logada

          { essa verificação tem que ser >= 0 - sempre vai ser 0, porém coloquei o maior para nao ter erros. }
          if QRY_receber2RC2_ID.AsInteger >= 0 then
          begin
            if not F_dmConexao.GeraChave('RECEBER2', QRY_receber2RC2_ID) then
            begin
              abort;
            end;
          end;

          QRY_receber2RC2_ID.AsInteger := F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
          QRY_receber2.Post;

          TB_CCredito.Next;
        end;

        QRY_receber2.ApplyUpdates(0);
        QRY_receber2.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$ENDREGION}
      end;

      if TB_CDebito.RecordCount > 0 then
      begin
        { Cadastro da Tabela a Cartao de Debito: MovCaixa, MvEstoque3 }
{$REGION 'QRY_CDebito'}
{$REGION 'MovCaixa'}
        { 1ª Tabela - MovCaixa } // ok
        QRY_mvCaixa.Open();
        QRY_mvCaixa.Append;

        TB_CDebito.First;
        while not TB_CDebito.Eof do
        begin
          QRY_mvCaixaMCX_DATA.AsDateTime := Now;
          QRY_mvCaixaMCX_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CCD';
          QRY_mvCaixaMCX_CONTABIL.AsInteger := 2; // default
          QRY_mvCaixaMCX_VINCULA.AsInteger := 51; // default
          QRY_mvCaixaMCX_HISTORICO1.AsString :=
            'FECHAMENTO A VISTA / (CARTAO DEBITO)';
          QRY_mvCaixaMCX_HISTORICO2.AsString :=
            'PAGAMENTO COM CARTAO DE DEBITO';
          QRY_mvCaixaMCX_VALOR.AsCurrency := TB_CDebitoCd_valor.AsCurrency;
          QRY_mvCaixaMCX_COMCAIXA.AsInteger := 1;
          QRY_mvCaixaMCX_COPCAIXAD.AsInteger := 5;
          QRY_mvCaixaMCX_COPCAIXAC.AsInteger := 200;
          QRY_mvCaixaMCX_SETOR.AsString := '03';
          QRY_mvCaixaMCX_NDELETE.AsString := 'N';
          QRY_mvCaixaMCX_EFETIVADO.AsString := 'S';
          QRY_mvCaixaMCX_FILIAL.AsInteger := 1; // pegar a filial logada
          QRY_mvCaixaMCX_MOEDA.AsString := 'CDB';
          QRY_mvCaixaMCX_PORCENTOCARDEX.AsFloat := 0;
          QRY_mvCaixaMCX_CENTROCUSTO.AsString := '1';
          // ver a possibilidade de escolher o centro e custo
          QRY_mvCaixaMCX_CLIENTE.AsInteger :=
            F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsInteger;
          TB_CDebito.Next;
        end;
        if QRY_mvCaixaMCX_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MOVCAIXA', QRY_mvCaixaMCX_ID) then
          begin
            abort;
          end;
        end;
        // 3º insere os dados
        QRY_mvCaixaMCX_ID.AsInteger :=
          F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvCaixa.Post;
        QRY_mvCaixa.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvCaixa.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$REGION 'MvEstoque3'}
        { 2ª Tabela - MvEstoque3 } // ok
        QRY_mvEstoque3.Open();
        QRY_mvEstoque3.Append;

        TB_CDebito.First;
        while not TB_CDebito.Eof do
        begin
          QRY_mvEstoque3ME3_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'CCD';
          QRY_mvEstoque3ME3_OPERACAO.AsString := '5';
          QRY_mvEstoque3ME3_DINHEIRO.AsCurrency := 0;
          QRY_mvEstoque3ME3_CHEQUE.AsCurrency := 0;
          QRY_mvEstoque3ME3_CHEQUEPRE.AsCurrency := 0;
          QRY_mvEstoque3ME3_CARTAOCREDITO.AsCurrency := 0;
          QRY_mvEstoque3ME3_CARTAODEBITO.AsCurrency :=
            TB_CDebitoCd_valor.AsCurrency;
          QRY_mvEstoque3ME3_PRAZO.AsCurrency := 0;
          QRY_mvEstoque3ME3_FILIAL.AsInteger := 1;
          QRY_mvEstoque3ME3_TIPOVENDACOMPRA.AsInteger := 1;
          // default VISTA (CHEQUE A VISTA É DINHEIRO)
          QRY_mvEstoque3ME3_OBSERVACAO.AsString := 'VISTA (CARTAO DE DEBITO)';
          TB_CDebito.Next;
        end;
        if QRY_mvEstoque3ME3_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MVESTOQUE3', QRY_mvEstoque3ME3_ID) then
          begin
            abort;
          end;
        end;

        // 3º insere os dados
        QRY_mvEstoque3ME3_ID.AsInteger :=
          F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvEstoque3.Post;
        QRY_mvEstoque3.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvEstoque3.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.

{$ENDREGION}
{$ENDREGION}
      end;

      if TB_prazo.RecordCount > 0 then
      begin
        { Cadastro da Tabela prazo: MovCaixa, MvEstoque3, Prazo, Receber1, Receber2 }
{$REGION 'QRY_prazo'}
{$REGION 'MovCaixa'}
        { 1ª Tabela - MovCaixa } // ok
        QRY_mvCaixa.Open();
        QRY_mvCaixa.Append;

        with QRY_TVCompra do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select tv.*, cm.ctm_codigo, cm.ctm_copdebi, cm.ctm_copcred, td.tip_id, td.tip_nome from comcaixa cm');
          SQL.Add('inner join tipovendacompra tv');
          SQL.Add('on (tv.tvc_opecaixa = cm.ctm_codigo)');
          SQL.Add('inner join tipodocumento td');
          SQL.Add('  on (tv.tvc_tipodocumento = td.tip_id)');
          SQL.Add('where tv.tvc_id = :TvcId');
          ParamByName('TvcId').Value := 2;
          Open();
        end;

        TB_prazo.First;
        while not TB_prazo.Eof do
        begin
          QRY_mvCaixaMCX_DATA.AsDateTime := Now;
          QRY_mvCaixaMCX_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'PRA';
          QRY_mvCaixaMCX_CONTABIL.AsInteger := 2; // default
          QRY_mvCaixaMCX_VINCULA.AsInteger := 51; // default
          QRY_mvCaixaMCX_HISTORICO1.AsString := 'VENDA PRAZO (NOTA)';
          QRY_mvCaixaMCX_HISTORICO2.AsString := QRY_TVCompraTIP_NOME.AsString;
          QRY_mvCaixaMCX_VALOR.AsCurrency :=
            (TB_prazoPr_valor.AsCurrency * TB_prazo.RecordCount);
          QRY_mvCaixaMCX_COMCAIXA.AsInteger := QRY_TVCompraTVC_ID.AsInteger;
          QRY_mvCaixaMCX_COPCAIXAD.AsInteger :=
            QRY_TVCompraCTM_COPDEBI.AsInteger;
          QRY_mvCaixaMCX_COPCAIXAC.AsInteger :=
            QRY_TVCompraCTM_COPCRED.AsInteger;
          QRY_mvCaixaMCX_SETOR.AsString := '03';
          QRY_mvCaixaMCX_NDELETE.AsString := 'N';
          QRY_mvCaixaMCX_EFETIVADO.AsString := 'S';
          QRY_mvCaixaMCX_FILIAL.AsInteger := 1; // pegar a filial logada
          QRY_mvCaixaMCX_MOEDA.AsString := 'PRA';
          QRY_mvCaixaMCX_PORCENTOCARDEX.AsFloat := 0;
          QRY_mvCaixaMCX_CENTROCUSTO.AsString := '1';
          // ver a possibilidade de escolher o centro e custo
          QRY_mvCaixaMCX_CLIENTE.AsInteger :=
            F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsInteger;
          TB_prazo.Next;
        end;
        if QRY_mvCaixaMCX_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MOVCAIXA', QRY_mvCaixaMCX_ID) then
          begin
            abort;
          end;
        end;
        // 3º insere os dados
        QRY_mvCaixaMCX_ID.AsInteger :=
          F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvCaixa.Post;
        QRY_mvCaixa.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvCaixa.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$REGION 'MvEstoque3'}
        { 2ª Tabela - MvEstoque3 } // ok
        QRY_mvEstoque3.Open();
        QRY_mvEstoque3.Append;

        TB_prazo.First;
        while not TB_prazo.Eof do
        begin
          QRY_mvEstoque3ME3_DOCTO.AsString := (TB_prazoPr_documento.AsString) + 'PRA';
          QRY_mvEstoque3ME3_OPERACAO.AsString := TB_prazoPr_operacao.AsString;
          QRY_mvEstoque3ME3_DINHEIRO.AsCurrency := 0;
          QRY_mvEstoque3ME3_CHEQUE.AsCurrency := 0;
          QRY_mvEstoque3ME3_CHEQUEPRE.AsCurrency := 0;
          QRY_mvEstoque3ME3_CARTAOCREDITO.AsCurrency := 0;
          QRY_mvEstoque3ME3_CARTAODEBITO.AsCurrency := 0;
          QRY_mvEstoque3ME3_PRAZO.AsCurrency := (TB_prazoPr_valor.AsCurrency * TB_prazo.RecordCount);
          QRY_mvEstoque3ME3_FILIAL.AsInteger := 1;
          QRY_mvEstoque3ME3_TIPOVENDACOMPRA.AsInteger :=
            QRY_TVCompraCTM_CODIGO.AsInteger;
          QRY_mvEstoque3ME3_OBSERVACAO.AsString := 'PRAZO (NOTA)';
          TB_prazo.Next;
        end;
        if QRY_mvEstoque3ME3_ID.AsInteger < 1 then
        begin
          if not F_dmConexao.GeraChave('MVESTOQUE3', QRY_mvEstoque3ME3_ID) then
          begin
            abort;
          end;
        end;

        // 3º insere os dados
        QRY_mvEstoque3ME3_ID.AsInteger :=
          F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
        QRY_mvEstoque3.Post;
        QRY_mvEstoque3.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_mvEstoque3.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$REGION 'Prazo'}
        { 3ª Tabela - Prazo } // ok

        TB_prazo.First;
        while not TB_prazo.Eof do
        begin
          QRY_prazo.Open();
          QRY_prazo.Append;

          QRY_prazoPRA_DOCTO.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'PRA';
          QRY_prazoPRA_TIPO.AsString := '2'; // default
          QRY_prazoPRA_VALOR.AsCurrency := TB_prazoPr_valor.AsCurrency;
          QRY_prazoPRA_VENCIMENTO.AsDateTime := TB_prazoPr_vcmto.AsDateTime;
          QRY_prazoPRA_EMISSAO.AsDateTime := Now;
          QRY_prazoPRA_PRAZO.AsInteger := TB_prazoPr_dias.AsInteger;
          QRY_prazoPRA_TIPODOC.AsString := QRY_TVCompraTVC_TIPODOCREC.AsString;
          QRY_prazoPRA_BANCO.AsInteger := StrToInt(TB_prazoPr_banco.AsString);
          QRY_prazoPRA_TVCID.AsInteger := QRY_TVCompraTVC_ID.AsInteger;
          QRY_prazoPRA_REPLICPDV.AsString := '2'; // ver com lindomar a lógica
          QRY_prazoPRA_FILIAL.AsInteger := 1; // opção de pegar a filial logada
          QRY_prazoPRA_QUANTPARCELAS.AsInteger := TB_prazo.RecordCount;

          { essa verificação tem que ser >= 0 - sempre vai ser 0, porém coloquei o maior para nao ter erros. }
          if QRY_prazoPRA_ID.AsInteger >= 0 then
          begin
            if not F_dmConexao.GeraChave('PRAZO', QRY_prazoPRA_ID) then
            begin
              abort;
            end;
          end;

          QRY_prazoPRA_ID.AsInteger :=
            F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
          QRY_prazo.Post;

          TB_prazo.Next;
        end;

        QRY_prazo.ApplyUpdates(0);
        QRY_prazo.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.

{$ENDREGION}
{$REGION 'Receber1'}
        { 4ª Tabela - Receber1 }
        QRY_receber1.Open();
        QRY_receber1.Append;

        TB_prazo.First;
        while not TB_prazo.Eof do
        begin
          QRY_receber1RC1_DOCREC.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'PRA';
          QRY_receber1RC1_CONTROLE.AsInteger := 40;
          // QRY_TVCompraTVC_ID.AsInteger;
          QRY_receber1RC1_PARCELA.AsInteger := TB_prazo.RecordCount;
          QRY_receber1RC1_SETOR.AsString := '03'; // default
          QRY_receber1RC1_FILIAL.AsInteger := 1;
          // ver opção de pegar filial logada
          QRY_receber1RC1_TIPOREC.AsString :=
            IntToStr(QRY_TVCompraTIP_ID.AsInteger);
          QRY_receber1RC1_EMISSAO.AsDateTime := Now;
          QRY_receber1RC1_VALORTOTAL.AsCurrency := TB_prazoPr_valor.AsCurrency *
            TB_prazo.RecordCount;
          QRY_receber1RC1_CLIENTE.AsInteger :=
            F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsInteger;
          QRY_receber1RC1_VLRPRODUTO.AsCurrency := 0;
          QRY_receber1RC1_VLRSERVICO.AsCurrency := 0;
          QRY_receber1RC1_CUSTOVENDA.AsCurrency := 0;
          QRY_receber1RC1_VENDEDOR.AsInteger := 1;
          // pegar o id do usuário logado
          QRY_receber1RC1_COMISSAO.AsCurrency := 0;
          QRY_receber1RC1_COMCAIXA.AsInteger :=
            QRY_TVCompraCTM_CODIGO.AsInteger;
          QRY_receber1RC1_CCOPCAIXA.AsInteger :=
            QRY_TVCompraCTM_COPCRED.AsInteger; // plano conta crédito
          QRY_receber1RC1_DCOPCAIXA.AsInteger :=
            QRY_TVCompraCTM_COPDEBI.AsInteger; // plano conta débito
          QRY_receber1RC1_HISTORICO1.AsString := 'VENDA PRAZO (NOTA)';
          QRY_receber1RC1_HISTORICO2.AsString := QRY_TVCompraTIP_NOME.AsString;
          QRY_receber1RC1_MVESTOQUE1.AsString :=
            IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger);
          QRY_receber1RC1_GRUPO.AsInteger := 1; // default
          QRY_receber1RC1_DIGITADO.AsDateTime := Now;
          QRY_receber1RC1_FATORVALOR.AsCurrency := 0;
          QRY_receber1RC1_TIPODOCUMENTO.AsInteger :=
            QRY_TVCompraTIP_ID.AsInteger;
          TB_prazo.Next;
        end;

        // 3º insere os dados
        QRY_receber1.Post;
        QRY_receber1.ApplyUpdates(0);
        // F_dmConexao.FDConn.Commit;
        QRY_receber1.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$REGION 'Receber2'}
        { 5ª Tabela - Receber2 }
        TB_prazo.First;
        while not TB_prazo.Eof do
        begin
          QRY_receber2.Open();
          QRY_receber2.Append;

          QRY_receber2RC2_DOCREC.AsString := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger) + 'PRA';
          QRY_receber2RC2_CONTROLE.AsInteger := 40;
          // QRY_TVCompraTVC_ID.AsInteger;
          QRY_receber2RC2_PARCELA.AsInteger := TB_prazo.RecordCount;
          QRY_receber2RC2_VENCIMENTO.AsDateTime := TB_prazoPr_vcmto.AsDateTime;
          QRY_receber2RC2_VALOR.AsCurrency := TB_prazoPr_valor.AsCurrency;
          QRY_receber2RC2_BANCO.AsInteger := TB_prazoPr_banco.AsInteger;
          QRY_receber2RC2_HAVER.AsCurrency := 0;
          QRY_receber2RC2_SALDO.AsCurrency := TB_prazoPr_valor.AsCurrency;
          QRY_receber2RC2_DATABASE.AsDateTime := TB_prazoPr_vcmto.AsDateTime;
          QRY_receber2RC2_MORADIA.AsCurrency := 0;
          QRY_receber2RC2_FILIAL.AsInteger := 1;
          // ver opção de pegar filial logada

          { essa verificação tem que ser >= 0 - sempre vai ser 0, porém coloquei o maior para nao ter erros. }
          if QRY_receber2RC2_ID.AsInteger >= 0 then
          begin
            if not F_dmConexao.GeraChave('RECEBER2', QRY_receber2RC2_ID) then
            begin
              abort;
            end;
          end;

          QRY_receber2RC2_ID.AsInteger :=
            F_dmConexao.QRY_entidadeENT_CHAVE.AsInteger;
          QRY_receber2.Post;

          TB_prazo.Next;
        end;

        QRY_receber2.ApplyUpdates(0);
        QRY_receber2.EmptyDataSet;
        // toda vez que trabalha com cache update tem que fazer isso.
{$ENDREGION}
{$ENDREGION}
      end;

{$REGION 'QRY_hotEntraHospede'}
     with QRY_hotentraHospede do begin
      Close;
      SQL.Clear;

      SQL.Add('update HOTENTRAHOSPEDE set ENT_DATASAIDA = :dSaida, ENT_HORASAIDA = :hSaida, ENT_TOT_GERAL_DIARIAS = :qtdDiaria,');

      SQL.Add('ENT_STATUS = :status, ENT_VLR_G_DIARIA_EXTRA = :vlrGDExtra, ENT_VLR_G_DIARIA_NORMAL = :vlrGDNormal,');
      SQL.Add('ENT_QTD_DIARIA_NORMAL = :qtdDNormal, ENT_QTD_DIARIA_EXTRA = :qtdDExtra, ENT_VLR_TOTAL_DIARIAS = :vlrTDiarias,');
      SQL.Add('ENT_QTD_TOTAL_DIARIAS = :qtdTDiarias');
      SQL.Add('where ent_codentrada = :codEntrada');

      ParamByName('dSaida').Value       := Now;
      ParamByName('hSaida').Value       := Time;
      ParamByName('qtdDiaria').Value    := (F_fechaApto.edtQtdDNormal.Value + F_fechaApto.edtQtdDExtra.Value);
      ParamByName('codEntrada').Value   := F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.Value;
      ParamByName('status').Value       := 'FECHADO'; {NA TABELA HOTENTRAHOSPEDE}

      ParamByName('vlrGDExtra').Value       := F_fechaApto.edtVlrGExtra.Value;
      ParamByName('vlrGDNormal').Value      := F_fechaApto.edtVlrGNormal.Value;
      ParamByName('qtdDNormal').Value       := F_fechaApto.edtQtdDNormal.Value;
      ParamByName('qtdDExtra').Value        := F_fechaApto.edtQtdDExtra.Value;
      ParamByName('vlrTDiarias').Value      := F_fechaApto.edtVlrGDiarias.Value;
      ParamByName('qtdTDiarias').Value      := F_fechaApto.edtQtdDNormal.Value + F_fechaApto.edtQtdDExtra.Value;
      ExecSQL;
     end;
{$ENDREGION}

{$REGION 'QRY_hotApartamento'}
      with F_dmCadApto.QRY_cadApto do begin
        Close;
        SQL.Clear;
        SQL.Add('update HOTAPARTAMENTO set apa_situacao = :apSituacao');
        SQL.Add('where apa_codapartamento = :codApartamento');
        ParamByName('apSituacao').Value       := 'LIVRE';
        ParamByName('codApartamento').Value   := CodApartamento;
        ExecSQL;
      end;
{$ENDREGION}

{$REGION 'QRY_fechaOs'}

     {atualizando a os}
      if F_dmProdutosApto = nil then begin
        Application.CreateForm(TF_dmProdutosApto, F_dmProdutosApto);
      end;

      with F_dmProdutosApto.QRY_updateOS1 do begin
        Close;
        SQL.Clear;
        SQL.Add('update OSERVICO1 set OS1_DATFECHAD = :dtaFecha, OS1_HORAFECHA = :hraFecha, OS1_TOTPROD = :totProd,');
        SQL.Add('OS1_CLIFATURA = :idCliente, OS1_STATUS = :status, OS1_COMISSAO = :comissao');
        SQL.Add('where OS1_DOCTOS = :docOs');

        ParamByName('dtaFecha').Value           := Now;
        ParamByName('hraFecha').Value           := Time;
        ParamByName('totProd').Value            := F_fechaApto.edtVlrGBar.Value;
        ParamByName('idCliente').Value          := F_dmHospedes.QRY_FechaHospedeCLI_CODIGO.AsInteger;
        ParamByName('status').Value             := '*';
        ParamByName('comissao').Value           := 0;
        ParamByName('docOs').Value              := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger);
        ExecSQL;
      end;
{$ENDREGION}

      {Verifica se foi apropriado tudo}
      if edtDiferenca.Value > 0 then begin
        TF_msg.Mensagem('Total faturado é menor do que o Total Geral.', 'I', [mbOk]);
        exit;
      end;

      TF_msg.Mensagem('Fechamento efetuado com Sucesso!', 'I', [mbOk]);

      OrdenaLista; {para atualizar a lista novamente}


      F_dmConexao.FDConn.Commit;
      // se todas derem certo, comita. caso alguma dar erro, não comita.

      {mostra o relatório depois de comitar}
      if F_fechaApto.QRY_proConsumidos.RecordCount > 0 then begin
        frxReportCI.Variables['qtdCredito']     := QuotedStr(IntToStr(TB_CCredito.RecordCount));
        frxReportCI.Variables['qtdChPre']       := QuotedStr(IntToStr(TB_CHPre.RecordCount));
        frxReportCI.Variables['qtdPrazo']       := QuotedStr(IntToStr(TB_prazo.RecordCount));

        frxReportCI.Variables['vlrConsumo']     := QuotedStr(CurrToStr(F_fechaApto.edtVlrGBar.Value));
        frxReportCI.Variables['vlrDExtras']     := QuotedStr(CurrToStr(F_fechaApto.edtVlrGExtra.Value));
        frxReportCI.Variables['vlrDNormais']    := QuotedStr(CurrToStr(F_fechaApto.edtVlrGNormal.Value));
        frxReportCI.Variables['qtdDExtras']     := QuotedStr(FloatToStr(F_fechaApto.edtQtdDExtra.Value));
        frxReportCI.Variables['qtdDNormais']    := QuotedStr(FloatToStr(F_fechaApto.edtQtdDNormal.Value));
        frxReportCI.Variables['tGeral']         := QuotedStr(CurrToStr(edtTotal.Value)); {pega desse formulario mesmo}
        frxReportCI.Variables['nApto']          := QuotedStr(F_fechaApto.edtApto.Text);

        {Verifica se existe. Caso não exista da a msg.}
        if not FileExists(ExtractFilePath(Application.ExeName) + 'RelFR3\FechaHospedeComItens.fr3') then begin
          TF_msg.Mensagem('Arquivo "FechaHospedeComItens.fr3" na Pasta "RelFR3" não encontrado. Favor, contate o Suporte','I',[mbOk]);
          exit;
        end
      else begin
        frxReportCI.PrepareReport();
        {só não deu certo pq eu nao passei o arquivo para o frxReportCI
         ex: frxReportCI.LoadFromFile(ExtractFilePath(Application.ExeName) + 'RelFR3\FechaHospedeComItens.fr3'));}
        frxReportCI.ShowReport();
      end;
  end

  else begin
    {Verifica se existe. Caso não exista da a msg.}
    frxReportSI.Variables['qtdCredito']     := QuotedStr(IntToStr(TB_CCredito.RecordCount));
    frxReportSI.Variables['qtdChPre']       := QuotedStr(IntToStr(TB_CHPre.RecordCount));
    frxReportSI.Variables['qtdPrazo']       := QuotedStr(IntToStr(TB_prazo.RecordCount));

    frxReportSI.Variables['vlrConsumo']     := QuotedStr(CurrToStr(F_fechaApto.edtVlrGBar.Value));
    frxReportSI.Variables['vlrDExtras']     := QuotedStr(CurrToStr(F_fechaApto.edtVlrGExtra.Value));
    frxReportSI.Variables['vlrDNormais']    := QuotedStr(CurrToStr(F_fechaApto.edtVlrGNormal.Value));
    frxReportSI.Variables['qtdDExtras']     := QuotedStr(FloatToStr(F_fechaApto.edtQtdDExtra.Value));
    frxReportSI.Variables['qtdDNormais']    := QuotedStr(FloatToStr(F_fechaApto.edtQtdDNormal.Value));
    frxReportSI.Variables['tGeral']         := QuotedStr(CurrToStr(edtTotal.Value)); {pega desse formulario mesmo}
    frxReportSI.Variables['nApto']          := QuotedStr(F_fechaApto.edtApto.Text);

    if not FileExists(ExtractFilePath(Application.ExeName) + 'RelFR3\FechaHospedeSemItens.fr3') then begin
      TF_msg.Mensagem('Arquivo "FechaHospedeSemItens.fr3" na Pasta "RelFR3" não encontrado. Favor, contate o Suporte','I',[mbOk]);
      exit;
    end
    else begin
      frxReportSI.PrepareReport();
      frxReportSI.ShowReport();
    end;
  end;

      { se não fizer isso, o cara pode gravar várias vezes clicando no salvar. }
      if TB_prazo.RecordCount > 0 then
        TB_prazo.EmptyDataSet;
      if TB_vista.RecordCount > 0 then
        TB_vista.EmptyDataSet;
      if TB_CHPre.RecordCount > 0 then
        TB_CHPre.EmptyDataSet;
      if TB_CHVista.RecordCount > 0 then
        TB_CHVista.EmptyDataSet;
      if TB_CCredito.RecordCount > 0 then
        TB_CCredito.EmptyDataSet;
      if TB_CDebito.RecordCount > 0 then
        TB_CDebito.EmptyDataSet;

    except
      on e: Exception do
      begin
        F_dmConexao.FDConn.Rollback;
        ShowMessage('Erro ' + e.Message);
      end;
    end;
  end
  else
  begin
    TF_msg.Mensagem('Não há nada para Salvar!', 'I', [mbOk]);
  end;


  F_fechaApto.Close;
  if F_checkIn <> nil then begin
    F_checkIn.Close;
  end;

  Self.Close; {fecha o form ao terminar}

end;

procedure TF_formasPgto.CalculaDiferenca(Sender: TObject);
begin // Calcula diferença
  { ============================ acrescentei esse bloco de código 09-03-2017 ============================================= }

  { Essa  QRY_TVCompra2 só serve exclusivamente para esse local. Se usasse a mesma da gravação, o valor a vista viria nulo
    visto que o join com a tabela tipodocumento forçaria a vir vazio. }

    {$REGION 'TVCompra2'}
  with QRY_TVCompra2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tipovendacompra');
    SQL.Add('  where tvc_id = :idFormaPgto');
    ParamByName('idFormaPgto').Value := FpgtoControle;
    // vem do exit do componente
    Open();
  end;

  TipoPgto := QRY_TVCompra2TVC_ID.AsInteger;
  // ShowMessage(IntToStr(TipoPgto));     //- depuração
    {$ENDREGION}
  { ================================================================================================================= }
    {$REGION 'Tratamento'}
   somaDif();

  if edtDiferenca.EditValue < -0.5 then    {tolerancia de meio centavo}
  begin
    TF_msg.Mensagem('Valor informado excede ao total da nota ou a diferença!', 'I', [mbOk]);
    TcxCurrencyEdit(Sender).SetFocus;
    exit;
  end;

    {$ENDREGION}
  if (TipoPgto = 2) or (TipoPgto = 3) or (TipoPgto = 4) or (TipoPgto = 7) then
  begin
    case TipoPgto of
      {$REGION 'Prazo2'}
      2:
        begin
        TB_prazo.Open;

          if TcxCurrencyEdit(Sender).Value < 0 then begin
            TF_msg.Mensagem('Não é permitido valores menor que 0.','I',[mbOk]);
            TcxCurrencyEdit(Sender).SetFocus;
            exit;
          end;

          if TcxCurrencyEdit(Sender).Value = 0 then begin
            if TB_prazo.RecordCount > 0 then begin
              if TF_msg.Mensagem('Deseja apagar essa forma de Pagamento?','Q', [mbSim, mbNao]) then begin
              {sim}
                TB_prazo.EmptyDataSet;
                lblPrazo1.Visible := False;
                lblPrazo2.Visible := False;

                 somaDif();

              end
              else begin
              {não}
                lblPrazo1.Visible := True;
                lblPrazo2.Visible := True;

                TcxCurrencyEdit(Sender).Value := TB_prazo.RecordCount * TB_prazoPr_valor.AsCurrency;

                somaDif();
                exit;
              end; {fim da msg}
            end; {fim do dataset > 0}
          end;  {fim do edit = 0}

          if TcxCurrencyEdit(Sender).Value > 0 then begin
            if TB_prazo.RecordCount > 0 then begin
            if TF_msg.Mensagem('Deseja modificar o valor do pagamento a Prazo?','Q', [mbSim, mbNao]) then begin
              {sim}
                TB_prazo.EmptyDataSet;
                VlrParcelar := edtPrazo.Value;
                CriaFormDestroy(TF_parcelamento, F_parcelamento);

                somaDif();

                  lblPrazo1.Visible := True;
                  lblPrazo2.Visible := True;
                  lblPrazo2.Caption := IntToStr(TB_prazo.RecordCount) + ' x de ' +
                     FloatToStrF(TB_prazoPr_valor.AsCurrency, ffCurrency, 10, 2);

              end
              else begin
              {não}
                lblPrazo1.Visible := True;
                lblPrazo2.Visible := True;
                lblPrazo2.Caption := IntToStr(TB_prazo.RecordCount) + ' x de ' +
                  FloatToStrF(TB_prazoPr_valor.AsCurrency, ffCurrency, 10, 2);

                  TcxCurrencyEdit(Sender).Value := TB_prazo.RecordCount * TB_prazoPr_valor.AsCurrency;

                  somaDif();
              end; {fim da msg}
            end {fim do recordcount > 0}
            else begin
              TB_prazo.Edit;
              VlrParcelar := edtPrazo.Value;
              CriaFormDestroy(TF_parcelamento, F_parcelamento);

              {verificar se a tabla tem alguma coisa}
              if TB_prazo.RecordCount > 0 then begin
                lblPrazo1.Visible := True;
                lblPrazo2.Visible := True;
                lblPrazo2.Caption := IntToStr(TB_prazo.RecordCount) + ' x de ' +
                  FloatToStrF(TB_prazoPr_valor.AsCurrency, ffCurrency, 10, 2);

                somaDif();
              end
              else begin
                lblPrazo1.Visible := False;
                lblPrazo2.Visible := False;
                TcxCurrencyEdit(Sender).Value := 0;

                somaDif();
              end;
            end; {fim do else do recordcount > 0}
          end;  {fim do edit > 0}
        end; {fim do case 2}
      {$ENDREGION}
      {$REGION 'ChequePre3'}
      3:
        begin
          // cheque-pre
          TB_CHPre.Open;

          if TcxCurrencyEdit(Sender).Value < 0 then begin
            TF_msg.Mensagem('Não é permitido valores menor que 0.','I',[mbOk]);
            TcxCurrencyEdit(Sender).SetFocus;
            exit;
          end;

          if TcxCurrencyEdit(Sender).Value = 0 then begin
            if TB_CHPre.RecordCount > 0 then begin
              if TF_msg.Mensagem('Deseja apagar essa forma de Pagamento?','Q', [mbSim, mbNao]) then begin
              {sim}
                TB_CHPre.EmptyDataSet;
                lblChPre1.Visible := False;
                lblChPre2.Visible := False;

                somaDif();

              end
              else begin
              {não}
                lblChPre1.Visible := True;
                lblChPre2.Visible := True;

                TcxCurrencyEdit(Sender).Value := TB_CHPre.RecordCount * TB_CHPreChp_valor.AsCurrency;

                somaDif();
                 exit;
              end; {fim da msg}
            end; {fim do dataset > 0}
          end;  {fim do edit = 0}

          if TcxCurrencyEdit(Sender).Value > 0 then begin
            if TB_CHPre.RecordCount > 0 then begin
            if TF_msg.Mensagem('Deseja modificar o valor do pagamento com Cheque Pré?','Q', [mbSim, mbNao]) then begin
              {sim}
                TB_CHPre.EmptyDataSet;
                VlrParcelar := edtChPre.Value;
                CriaFormDestroy(TF_parcelamento, F_parcelamento);

                somaDif();

                  lblChPre1.Visible := True;
                  lblChPre2.Visible := True;
                  lblChPre2.Caption := IntToStr(TB_CHPre.RecordCount) + ' x de ' +
                  FloatToStrF(TB_CHPreChp_valor.AsCurrency, ffCurrency, 10, 2);

              end
              else begin
              {não}
                lblChPre1.Visible := True;
                lblChPre2.Visible := True;
                lblChPre2.Caption := IntToStr(TB_CHPre.RecordCount) + ' x de ' +
                  FloatToStrF(TB_CHPreChp_valor.AsCurrency, ffCurrency, 10, 2);

                  TcxCurrencyEdit(Sender).Value := TB_CHPre.RecordCount * TB_CHPreChp_valor.AsCurrency;

                somaDif();
              end; {fim da msg}
            end {fim do recordcount > 0}
            else begin
              TB_CHPre.Edit;
              VlrParcelar := edtChPre.Value;
              CriaFormDestroy(TF_parcelamento, F_parcelamento);

              {verificar se a tabla tem alguma coisa}
              if TB_CHPre.RecordCount > 0 then begin
                lblChPre1.Visible := True;
                lblChPre2.Visible := True;
                lblChPre2.Caption := IntToStr(TB_CHPre.RecordCount) + ' x de ' +
                  FloatToStrF(TB_CHPreChp_valor.AsCurrency, ffCurrency, 10, 2);

                somaDif();
              end
              else begin
                lblChPre1.Visible := False;
                lblChPre2.Visible := False;
                TcxCurrencyEdit(Sender).Value := 0;

                somaDif();
              end;
            end; {fim do else do recordcount > 0}
          end;  {fim do edit > 0}
        end; {fim do case 3}
      {$ENDREGION}
      {$REGION 'CCredito4'}
      4:
        begin
          // cartao credito
          TB_CCredito.Open;

          if TcxCurrencyEdit(Sender).Value < 0 then begin
            TF_msg.Mensagem('Não é permitido valores menor que 0.','I',[mbOk]);
            TcxCurrencyEdit(Sender).SetFocus;
            exit;
          end;

          if TcxCurrencyEdit(Sender).Value = 0 then begin
            if TB_CCredito.RecordCount > 0 then begin
              if TF_msg.Mensagem('Deseja apagar essa forma de Pagamento?','Q', [mbSim, mbNao]) then begin
              {sim}
                TB_CCredito.EmptyDataSet;
                lblCCredito1.Visible := False;
                lblCCredito2.Visible := False;

                somaDif();

              end
              else begin
              {não}
                lblCCredito1.Visible := True;
                lblCCredito2.Visible := True;

                TcxCurrencyEdit(Sender).Value := TB_CCredito.RecordCount * TB_CCreditoCc_valor.AsCurrency;

                somaDif();
                  exit;
              end; {fim da msg}
            end; {fim do dataset > 0}
          end;  {fim do edit = 0}

          if TcxCurrencyEdit(Sender).Value > 0 then begin
            if TB_CCredito.RecordCount > 0 then begin
            if TF_msg.Mensagem('Deseja modificar o valor do pagamento com Cartão de Crédito?','Q', [mbSim, mbNao]) then begin
              {sim}
                TB_CCredito.EmptyDataSet;
                VlrParcelar := edtCCredito.Value;
                CriaFormDestroy(TF_parcelamento, F_parcelamento);

                somaDif();

                  lblCCredito1.Visible := True;
                  lblCCredito2.Visible := True;
                  lblCCredito2.Caption := IntToStr(TB_CCredito.RecordCount) + ' x de ' +
                  FloatToStrF(TB_CCreditoCc_valor.AsCurrency, ffCurrency, 10, 2);

              end
              else begin
              {não}
                lblCCredito1.Visible := True;
                lblCCredito2.Visible := True;
                lblCCredito2.Caption := IntToStr(TB_CCredito.RecordCount) + ' x de ' +
                  FloatToStrF(TB_CCreditoCc_valor.AsCurrency, ffCurrency, 10, 2);

                  TcxCurrencyEdit(Sender).Value := TB_CCredito.RecordCount * TB_CCreditoCc_valor.AsCurrency;

                 somaDif();
              end; {fim da msg}
            end {fim do recordcount > 0}
            else begin
              TB_CCredito.Edit;
              VlrParcelar := edtCCredito.Value;
              CriaFormDestroy(TF_parcelamento, F_parcelamento);

              {verificar se a tabla tem alguma coisa}
              if TB_CCredito.RecordCount > 0 then begin
                lblCCredito1.Visible := True;
                lblCCredito2.Visible := True;
                lblCCredito2.Caption := IntToStr(TB_CCredito.RecordCount) + ' x de ' +
                  FloatToStrF(TB_CCreditoCc_valor.AsCurrency, ffCurrency, 10, 2);

                somaDif();
              end
              else begin
                lblCCredito1.Visible := False;
                lblCCredito2.Visible := False;
                TcxCurrencyEdit(Sender).Value := 0;

                somaDif();
              end;
            end; {fim do else do recordcount > 0}
          end;  {fim do edit > 0}
        end; {fim do case 4}
      {$ENDREGION}
      {$REGION 'ChequeVista7'}
      7:
        begin
          TB_CHVista.Open;

          if TcxCurrencyEdit(Sender).Value < 0 then begin
            TF_msg.Mensagem('Não é permitido valores menor que 0.','I',[mbOk]);
            TcxCurrencyEdit(Sender).SetFocus;
            exit;
          end;

          if TcxCurrencyEdit(Sender).Value = 0 then begin
            if TB_CHVista.RecordCount > 0 then begin
              if TF_msg.Mensagem('Deseja apagar essa forma de Pagamento?','Q', [mbSim, mbNao]) then begin
              {sim}
                TB_CHVista.EmptyDataSet;
                lblChVista1.Visible := False;
                lblChVista2.Visible := False;

                edtDiferenca.Value := edtTotal.Value - (edtVista.Value + edtChVista.Value + edtChPre.Value +
                  edtCCredito.Value + edtCDebito.Value + edtPrazo.Value);

              end
              else begin
              {não}
                lblChVista1.Visible := True;
                lblChVista2.Visible := True;

                TcxCurrencyEdit(Sender).Value := TB_CHVista.RecordCount * TB_CHVistaChv_valor.AsCurrency;

                somaDif();
                  exit;
              end; {fim da msg}
            end; {fim do dataset > 0}
          end;  {fim do edit = 0}

          if TcxCurrencyEdit(Sender).Value > 0 then begin
            if TB_CHVista.RecordCount > 0 then begin
            if TF_msg.Mensagem('Deseja modificar o valor do pagamento com Cheque à Vista?','Q', [mbSim, mbNao]) then begin
              {sim}
                TB_CHVista.EmptyDataSet;
                VlrParcelar := edtChVista.Value;
                CriaFormDestroy(TF_parcelamento, F_parcelamento);

                somaDif();

                  lblChVista1.Visible := True;
                  lblChVista2.Visible := True;
                  lblChVista2.Caption := IntToStr(TB_CHVista.RecordCount) + ' x de ' +
                  FloatToStrF(TB_CHVistaChv_valor.AsCurrency, ffCurrency, 10, 2);

              end
              else begin
              {não}
                lblChVista1.Visible := True;
                lblChVista2.Visible := True;
                lblChVista2.Caption := IntToStr(TB_CHVista.RecordCount) + ' x de ' +
                  FloatToStrF(TB_CHVistaChv_valor.AsCurrency, ffCurrency, 10, 2);

                  TcxCurrencyEdit(Sender).Value := TB_CHVista.RecordCount * TB_CHVistaChv_valor.AsCurrency;

                somaDif();
              end; {fim da msg}
            end {fim do recordcount > 0}
            else begin
              TB_CHVista.Edit;
              VlrParcelar := edtChVista.Value;
              CriaFormDestroy(TF_parcelamento, F_parcelamento);

              {verificar se a tabla tem alguma coisa}
              if TB_CHVista.RecordCount > 0 then begin
                lblChVista1.Visible := True;
                lblChVista2.Visible := True;
                lblChVista2.Caption := IntToStr(TB_CHVista.RecordCount) + ' x de ' +
                  FloatToStrF(TB_CHVistaChv_valor.AsCurrency, ffCurrency, 10, 2);

                somaDif();
              end
              else begin
                lblChVista1.Visible := False;
                lblChVista2.Visible := False;
                TcxCurrencyEdit(Sender).Value := 0;

                somaDif();
              end;
            end; {fim do else do recordcount > 0}
          end;  {fim do edit > 0}
        end; {fim do case 7}
      {$ENDREGION}
    end; // fim do case of
  end // fim do if inicial TipoPgto
  else
  begin
    // se nao precisar abrir as parcelas, eu entro aqui
    case TipoPgto of
      {$REGION 'Vista1'}
      1:
        begin
          // dinheiro
          TB_vista.Open;
          if TcxCurrencyEdit(Sender).Value < 0 then
          begin
            TF_msg.Mensagem('Valor inválido. Somente valores positivos.',
              'I', [mbOk]);
            TcxCurrencyEdit(Sender).SetFocus;
            exit;
          end;

          if TcxCurrencyEdit(Sender).Value = 0 then
          begin
            { verifica se o tb_vista já tem valores }
            if TB_vista.RecordCount > 0 then
            begin
              { se sim, pergunta se quer apagar. }
              if TF_msg.Mensagem('Deseja apagar essa forma de Pagamento?', 'Q', [mbSim, mbNao]) then
              begin
                TB_vista.EmptyDataSet; { limpa }
                lblDinheiro1.Visible := False;
                lblDinheiro2.Visible := False;

                somaDif();
                exit;
              end

              else begin
                edtVista.Value := TB_vistaDin_valor.AsCurrency;

                somaDif();

                exit;
              end; {fim da mensagem para apagar}

            end

            else  begin
              lblDinheiro1.Visible := False;
              lblDinheiro2.Visible := False;

                somaDif();

              exit;
            end; { fim do TB_vista.RecordCount > 0 }
          end  {fim da condição se o valor for igual a zero e já tiver valores}


          else begin { se for > que 0  visto que já foi tratado quando é menor }
          if TB_vista.RecordCount > 0 then
            begin
              if TF_msg.Mensagem('Já existe essa forma de Pagamento. Deseja mudar?', 'Q', [mbSim, mbNao]) then
              begin
                TB_vista.EmptyDataSet;
                TB_vista.Append;

                TB_vistaDin_valor.AsCurrency := edtVista.Value;
                TB_vistaDin_data.AsDateTime := Now;
                TB_vista.Post;

                lblDinheiro1.Visible := True;
                lblDinheiro2.Visible := True;
                lblDinheiro2.Caption := IntToStr(TB_vista.RecordCount) + ' x de ' + FloatToStrF(TB_vistaDin_valor.Value,
                  ffCurrency, 10, 2);

                somaDif();
                exit;
              end
              else begin
                edtVista.Value := TB_vistaDin_valor.AsCurrency;

                somaDif();
                exit;
              end;
            end
            else begin
              TB_vista.EmptyDataSet;
              TB_vista.Append;

              TB_vistaDin_valor.AsCurrency := edtVista.Value;
              TB_vistaDin_data.AsDateTime := Now;
              TB_vista.Post;

              lblDinheiro1.Visible := True;
              lblDinheiro2.Visible := True;
              lblDinheiro2.Caption := IntToStr(TB_vista.RecordCount) + ' x de '
                + FloatToStrF(TB_vistaDin_valor.Value, ffCurrency, 10, 2);

                somaDif();

            end;
          end; { fim do TcxCurrencyEdit }

        end; { fim do case }
      {$ENDREGION}
      {$REGION 'CDebito5'}
      5:
        begin
          // cartao debito
          TB_CDebito.Open;
          if TcxCurrencyEdit(Sender).Value < 0 then
          begin
            TF_msg.Mensagem('Valor inválido. Somente valores positivos.','I', [mbOk]);
            TcxCurrencyEdit(Sender).SetFocus;
            exit;
          end;

          if TcxCurrencyEdit(Sender).Value = 0 then
          begin
            { verifica se o TB_CDebito já tem valores }
            if TB_CDebito.RecordCount > 0 then
            begin
              { se sim, pergunta se quer apagar. }
              if TF_msg.Mensagem('Deseja apagar essa forma de Pagamento?', 'Q',[mbSim, mbNao]) then
              begin
                TB_CDebito.EmptyDataSet; { limpa }
                lblCDebito1.Visible := False;
                lblCDebito2.Visible := False;

                somaDif();

                exit;
              end
              else
              begin
                edtCDebito.Value := TB_CDebitoCd_valor.AsCurrency;

                somaDif();

                exit;
              end;
            end
            else
            begin
              lblCDebito1.Visible := False;
              lblCDebito2.Visible := False;

               somaDif();

              exit;
            end; { fim do recordcount }
          end
          else
          begin { se for > que 0  visto que já foi tratado quando é menor }
            if TB_CDebito.RecordCount > 0 then
            begin
              if TF_msg.Mensagem
                ('Já existe essa forma de Pagamento. Deseja mudar?', 'Q',[mbSim, mbNao]) then
              begin
                TB_CDebito.EmptyDataSet;
                TB_CDebito.Append;

                TB_CDebitoCd_valor.AsCurrency := edtCDebito.Value;
                TB_CDebitoCd_data.AsDateTime := Now;
                TB_CDebito.Post;

                lblCDebito1.Visible := True;
                lblCDebito2.Visible := True;
                lblCDebito2.Caption := IntToStr(TB_CDebito.RecordCount) + ' x de ' + FloatToStrF(TB_CDebitoCd_valor.Value,
                  ffCurrency, 10, 2);

                somaDif();

                exit;
              end
              else
              begin
                edtCDebito.Value := TB_CDebitoCd_valor.AsCurrency;

                somaDif();

                exit;
              end;
            end
            else
            begin
              TB_CDebito.EmptyDataSet;
              TB_CDebito.Append;

              TB_CDebitoCd_valor.AsCurrency := edtCDebito.Value;
              TB_CDebitoCd_data.AsDateTime := Now;
              TB_CDebito.Post;

              lblCDebito1.Visible := True;
              lblCDebito2.Visible := True;
              lblCDebito2.Caption := IntToStr(TB_CDebito.RecordCount) + ' x de '
                + FloatToStrF(TB_CDebitoCd_valor.Value, ffCurrency, 10, 2);

               somaDif();

            end;
          end; { fim do TcxCurrencyEdit }

        end; { fim do case }
        {$ENDREGION}
    end;
  end;
end;

procedure TF_formasPgto.edtCCreditoExit(Sender: TObject);
begin // ao sair do cartao de credito
  inherited;
  // FpgtoControle := 'CCR';
  FpgtoControle := 4;
  CalculaDiferenca(Sender);
end;

procedure TF_formasPgto.edtCDebitoExit(Sender: TObject);
begin // ao sair do cartao de debito
  inherited;
  // FpgtoControle := 'CDB';
  FpgtoControle := 5;
  CalculaDiferenca(Sender);
end;

procedure TF_formasPgto.edtChPreExit(Sender: TObject);
begin // ao sair do cheque pre
  inherited;
  // FpgtoControle := 'CHP';
  FpgtoControle := 3;
  CalculaDiferenca(Sender);
end;

procedure TF_formasPgto.edtChVistaExit(Sender: TObject);
begin // ao sair do cheque a vista
  inherited;
  // FpgtoControle := 'CHV';
  FpgtoControle := 7;
  CalculaDiferenca(Sender);
end;

procedure TF_formasPgto.edtDescontoExit(Sender: TObject);
begin
  inherited;
  { Saindo do valorDesconto }

  if (edtDesconto.Value < 0) or (edtDesconto.Value > F_fechaApto.edtVlrTFatura.Value)then begin
    TF_msg.Mensagem('Valor inválido! Favor, escolha um valor entre 0 e Total Geral', 'I', [mbOk]);
    TcxCurrencyEdit(Sender).SetFocus;
    exit;
  end
  else begin
    edtTotal.Value := (F_fechaApto.edtVlrTFatura.Value - edtDesconto.Value);
    edtPercentual.Value := edtDesconto.Value / F_fechaApto.edtVlrTFatura.Value * 100;

    edtDiferenca.Value := edtTotal.Value - (edtVista.Value + edtChVista.Value + edtChPre.Value +
      edtCCredito.Value + edtCDebito.Value + edtPrazo.Value);

  end;
end;

procedure TF_formasPgto.edtPercentualExit(Sender: TObject);
begin
  inherited;
  { saindo do porcentoDesconto }

  if (edtPercentual.Value < 0) or (edtPercentual.Value > 100) then
  begin
    TF_msg.Mensagem('Percentual inválido. Favor, informar um valor entre 0% e 100%','I', [mbOk]);
    TcxCurrencyEdit(Sender).SetFocus;
    abort;
  end
  else begin
    edtDesconto.Value := (F_fechaApto.edtVlrTFatura.Value * (edtPercentual.Value / 100));
    edtTotal.Value := (F_fechaApto.edtVlrTFatura.Value - edtDesconto.Value);

    edtDiferenca.Value := edtTotal.Value - (edtVista.Value + edtChVista.Value + edtChPre.Value +
      edtCCredito.Value + edtCDebito.Value + edtPrazo.Value);

  end;
end;

procedure TF_formasPgto.edtPrazoExit(Sender: TObject);
begin // ao sair do prazo
  inherited;
  // FpgtoControle := 'PRA';
  FpgtoControle := 2;
  CalculaDiferenca(Sender);
end;

procedure TF_formasPgto.edtVistaExit(Sender: TObject);
begin // ao sair do valor a vista
  inherited;
  // FpgtoControle := 'DIN';
  FpgtoControle := 1;
  CalculaDiferenca(Sender);
end;

procedure TF_formasPgto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  // Teclas de Atalho
  if Key = VK_F2 then
  begin
    edtVista.SetFocus;
  end;
  if Key = VK_F3 then
  begin
    edtChVista.SetFocus;
  end;
  if Key = VK_F4 then
  begin
    edtChPre.SetFocus;
  end;
  if Key = VK_F5 then
  begin
    edtCCredito.SetFocus;
  end;
  if Key = VK_F6 then
  begin
    edtCDebito.SetFocus;
  end;
  if Key = VK_F7 then
  begin
    edtPrazo.SetFocus;
  end;
  if Key = VK_F8 then
  begin
    btnSalvar.Click;
  end;
  if Key = VK_F9 then
  begin
    btnCancelar.Click;
  end;

  if Key = VK_F11 then begin
    edtDesconto.SetFocus;
  end;

  if Key = VK_F12 then begin
    edtPercentual.SetFocus;
  end;
end;

procedure TF_formasPgto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    // SendMessage(Handle, WM_NEXTDLGCTL, 0,0);  //mais lento
    Perform(WM_NEXTDLGCTL, 0, 0); // mais rápido
  end;
end;

procedure TF_formasPgto.FormShow(Sender: TObject);
begin // onshow
  inherited;
  QRY_banco.Open();
  QRY_pmto.Open();

  lblCodHospedagem.Caption := IntToStr(F_dmHospedes.QRY_FechaHospedeENT_CODENTRADA.AsInteger);

  edtTotal.Value := F_fechaApto.edtVlrTFatura.Value;

  lblVlrSDscto.Caption := FloatToStrF(F_fechaApto.edtVlrTFatura.Value, ffCurrency, 10, 2);

    edtPercentual.SetFocus;
end;

procedure TF_formasPgto.somaDif();
var diferenca, total, novoTotal, somaTudo: Double;
begin
  {validação da diferenca}
   total              := edtTotal.Value;
   somaTudo           := (edtVista.Value + edtChVista.Value + edtChPre.Value + edtCCredito.Value + edtCDebito.Value + edtPrazo.Value);
   novoTotal          := total - somaTudo;
   edtDiferenca.Value := novoTotal; {verificar a questao do desconto}
end;

end.


