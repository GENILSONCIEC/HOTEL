inherited F_pesquisaBanco: TF_pesquisaBanco
  Caption = 'Pesquisa Bancos'
  ClientHeight = 335
  ClientWidth = 588
  OnShow = FormShow
  ExplicitWidth = 594
  ExplicitHeight = 364
  PixelsPerInch = 96
  TextHeight = 18
  inherited pnl: TPanel
    Width = 588
    Height = 335
    ExplicitWidth = 588
    ExplicitHeight = 335
    inherited pnlPesquisa: TPanel
      Width = 588
      Visible = False
      ExplicitWidth = 588
      inherited lblPesquisa: TLabel
        Width = 137
        Caption = 'Nome do Banco'
        ExplicitWidth = 137
      end
      inherited edtPesquisa: TEdit
        Left = 183
        Width = 613
        ExplicitLeft = 183
        ExplicitWidth = 613
      end
    end
    inherited pnlDados: TPanel
      Width = 588
      Height = 215
      ExplicitWidth = 588
      ExplicitHeight = 215
      inherited DBG_dados: TDBGrid
        Width = 588
        Height = 215
        DataSource = DS_banco
        OnDblClick = btnSelecionarClick
        OnKeyPress = DBG_dadosKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'BAN_CODIGO'
            Title.Caption = 'C'#211'D.'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAN_NOME'
            Title.Caption = 'BANCO'
            Width = 400
            Visible = True
          end>
      end
    end
    inherited pnlControle: TPanel
      Top = 272
      Width = 588
      ExplicitTop = 272
      ExplicitWidth = 588
      inherited btnSelecionar: TSpeedButton
        Visible = True
        OnClick = btnSelecionarClick
      end
    end
  end
  object DS_banco: TDataSource
    DataSet = F_formasPgto.QRY_banco
    Left = 384
    Top = 208
  end
end
