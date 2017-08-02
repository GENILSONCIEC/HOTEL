inherited F_pesquisaFormasPgto: TF_pesquisaFormasPgto
  Caption = 'Formas de Pagamentos'
  ClientHeight = 261
  ClientWidth = 717
  OnShow = FormShow
  ExplicitWidth = 723
  ExplicitHeight = 290
  PixelsPerInch = 96
  TextHeight = 18
  inherited pnl: TPanel
    Width = 717
    Height = 261
    ExplicitWidth = 725
    ExplicitHeight = 326
    inherited pnlPesquisa: TPanel
      Width = 717
      Visible = False
      ExplicitWidth = 725
    end
    inherited pnlDados: TPanel
      Width = 717
      Height = 141
      ExplicitWidth = 725
      ExplicitHeight = 206
      inherited DBG_dados: TDBGrid
        Width = 717
        Height = 141
        DataSource = DS_tipoVendaCompra
        OnKeyPress = DBG_dadosKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'TVC_ID'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TVC_DESCRICAO'
            Width = 300
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TVC_MOEDA'
            Title.Caption = 'MOEDA'
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TVC_TIPODOCUMENTO'
            Title.Caption = 'TIPO DOCUMENTO'
            Width = 200
            Visible = True
          end>
      end
    end
    inherited pnlControle: TPanel
      Top = 198
      Width = 717
      ExplicitTop = 263
      ExplicitWidth = 725
      inherited btnSelecionar: TSpeedButton
        OnClick = btnSelecionarClick
      end
    end
  end
  object QRY_tipoVendaCompra: TFDQuery
    Connection = F_dmConexao.FDConn
    SQL.Strings = (
      'select * from tipovendacompra')
    Left = 384
    Top = 208
    object QRY_tipoVendaCompraTVC_ID: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#211'DIGO'
      FieldName = 'TVC_ID'
      Origin = 'TVC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000'
    end
    object QRY_tipoVendaCompraTVC_DESCRICAO: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'TVC_DESCRICAO'
      Origin = 'TVC_DESCRICAO'
      Size = 40
    end
    object QRY_tipoVendaCompraTVC_TEF: TStringField
      FieldName = 'TVC_TEF'
      Origin = 'TVC_TEF'
      FixedChar = True
      Size = 1
    end
    object QRY_tipoVendaCompraTVC_TARIFA: TBCDField
      FieldName = 'TVC_TARIFA'
      Origin = 'TVC_TARIFA'
      Precision = 18
      Size = 2
    end
    object QRY_tipoVendaCompraTVC_OPECAIXA: TIntegerField
      FieldName = 'TVC_OPECAIXA'
      Origin = 'TVC_OPECAIXA'
    end
    object QRY_tipoVendaCompraTVC_DEBITO: TIntegerField
      FieldName = 'TVC_DEBITO'
      Origin = 'TVC_DEBITO'
    end
    object QRY_tipoVendaCompraTVC_CREDITO: TIntegerField
      FieldName = 'TVC_CREDITO'
      Origin = 'TVC_CREDITO'
    end
    object QRY_tipoVendaCompraTVC_ESPECIAL: TStringField
      FieldName = 'TVC_ESPECIAL'
      Origin = 'TVC_ESPECIAL'
      Size = 60
    end
    object QRY_tipoVendaCompraTVC_LETRA: TStringField
      FieldName = 'TVC_LETRA'
      Origin = 'TVC_LETRA'
      Size = 30
    end
    object QRY_tipoVendaCompraTVC_DESCONTO: TBCDField
      FieldName = 'TVC_DESCONTO'
      Origin = 'TVC_DESCONTO'
      Precision = 18
      Size = 2
    end
    object QRY_tipoVendaCompraTVC_GERAREC: TStringField
      FieldName = 'TVC_GERAREC'
      Origin = 'TVC_GERAREC'
      FixedChar = True
      Size = 1
    end
    object QRY_tipoVendaCompraTVC_CLIENTE: TIntegerField
      FieldName = 'TVC_CLIENTE'
      Origin = 'TVC_CLIENTE'
    end
    object QRY_tipoVendaCompraTVC_TIPOVENDA: TStringField
      FieldName = 'TVC_TIPOVENDA'
      Origin = 'TVC_TIPOVENDA'
      Size = 30
    end
    object QRY_tipoVendaCompraTVC_PONTOSFIDEL: TBCDField
      FieldName = 'TVC_PONTOSFIDEL'
      Origin = 'TVC_PONTOSFIDEL'
      Precision = 18
      Size = 2
    end
    object QRY_tipoVendaCompraTVC_PRAZOPARCELA: TIntegerField
      FieldName = 'TVC_PRAZOPARCELA'
      Origin = 'TVC_PRAZOPARCELA'
    end
    object QRY_tipoVendaCompraTVC_NUMEROPARCELA: TIntegerField
      FieldName = 'TVC_NUMEROPARCELA'
      Origin = 'TVC_NUMEROPARCELA'
    end
    object QRY_tipoVendaCompraTVC_DESCONTOATACADO: TBCDField
      FieldName = 'TVC_DESCONTOATACADO'
      Origin = 'TVC_DESCONTOATACADO'
      Precision = 18
      Size = 2
    end
    object QRY_tipoVendaCompraTVC_ATACADO: TStringField
      FieldName = 'TVC_ATACADO'
      Origin = 'TVC_ATACADO'
      FixedChar = True
      Size = 1
    end
    object QRY_tipoVendaCompraTVC_TIPODOCREC: TStringField
      FieldName = 'TVC_TIPODOCREC'
      Origin = 'TVC_TIPODOCREC'
      Size = 3
    end
    object QRY_tipoVendaCompraTVC_CARTAOCREDEB: TStringField
      FieldName = 'TVC_CARTAOCREDEB'
      Origin = 'TVC_CARTAOCREDEB'
      FixedChar = True
      Size = 1
    end
    object QRY_tipoVendaCompraTVC_MOEDA: TStringField
      FieldName = 'TVC_MOEDA'
      Origin = 'TVC_MOEDA'
      Size = 3
    end
    object QRY_tipoVendaCompraTVC_TIPODOCUMENTO: TIntegerField
      FieldName = 'TVC_TIPODOCUMENTO'
      Origin = 'TVC_TIPODOCUMENTO'
    end
  end
  object DS_tipoVendaCompra: TDataSource
    DataSet = QRY_tipoVendaCompra
    Left = 544
    Top = 208
  end
end
