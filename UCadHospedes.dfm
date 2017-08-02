inherited F_cadHospede: TF_cadHospede
  Caption = 'Cadastro de H'#243'spedes'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  inherited pnlGeral: TPanel
    inherited pnlControle: TPanel
      inherited btnEditar: TSpeedButton
        OnClick = btnEditarClick
      end
      inherited btnCancelar: TSpeedButton
        OnClick = btnCancelarClick
        ExplicitTop = 0
      end
      inherited btnSalvar: TSpeedButton
        OnClick = btnSalvarClick
      end
      inherited btnDeletar: TSpeedButton
        OnClick = btnDeletarClick
      end
      inherited btnNovo: TSpeedButton
        OnClick = btnNovoClick
        ExplicitLeft = 4
        ExplicitTop = -20
        ExplicitHeight = 52
      end
    end
    inherited pnlDados: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 1002
      Height = 439
      Color = clInactiveCaption
      ParentBackground = False
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 1002
      ExplicitHeight = 439
      object pnlFisicoJuridico: TPanel
        Left = 0
        Top = 0
        Width = 1002
        Height = 439
        Align = alClient
        ParentBackground = False
        TabOrder = 0
        object lblCodigo: TLabel
          Tag = 1
          Left = 7
          Top = 3
          Width = 45
          Height = 18
          Caption = 'C'#211'D.'
          FocusControl = edtCodigo
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblRazao: TLabel
          Tag = 1
          Left = 95
          Top = 3
          Width = 53
          Height = 18
          Caption = 'NOME'
          FocusControl = edtRazao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblFantasia: TLabel
          Tag = 1
          Left = 593
          Top = 3
          Width = 144
          Height = 18
          Caption = 'NOME POPULAR'
          FocusControl = edtFantasia
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblRegiao: TLabel
          Tag = 1
          Left = 7
          Top = 64
          Width = 71
          Height = 18
          Caption = 'REGI'#195'O'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCidae: TLabel
          Tag = 1
          Left = 95
          Top = 64
          Width = 69
          Height = 18
          Caption = 'CIDADE'
          FocusControl = edtCidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEstado: TLabel
          Tag = 1
          Left = 401
          Top = 64
          Width = 23
          Height = 18
          Caption = 'UF'
          FocusControl = edtEstado
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEndereco: TLabel
          Tag = 1
          Left = 474
          Top = 64
          Width = 98
          Height = 18
          Caption = 'ENDERE'#199'O'
          FocusControl = edtEndereco
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblBairro: TLabel
          Tag = 1
          Left = 783
          Top = 64
          Width = 72
          Height = 18
          Caption = 'BAIRRO'
          FocusControl = edtBairro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCep: TLabel
          Tag = 1
          Left = 84
          Top = 123
          Width = 35
          Height = 18
          Caption = 'CEP'
          FocusControl = edtCep
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEmail: TLabel
          Tag = 1
          Left = 204
          Top = 123
          Width = 56
          Height = 18
          Caption = 'EMAIL'
          FocusControl = edtEmail
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblFone: TLabel
          Tag = 1
          Left = 459
          Top = 123
          Width = 48
          Height = 18
          Caption = 'FONE'
          FocusControl = edtFone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCelular: TLabel
          Tag = 1
          Left = 625
          Top = 123
          Width = 81
          Height = 18
          Caption = 'CELULAR'
          FocusControl = edtCelular
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDtaNascimento: TLabel
          Tag = 1
          Left = 791
          Top = 123
          Width = 169
          Height = 18
          Caption = 'DTA. NASCIMENTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEstadoCivil: TLabel
          Tag = 1
          Left = 7
          Top = 186
          Width = 95
          Height = 18
          Caption = 'EST. CIVIL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNaturalidade: TLabel
          Tag = 1
          Left = 158
          Top = 186
          Width = 142
          Height = 18
          Caption = 'NATURALIDADE'
          FocusControl = edtNaturalidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNacionalidade: TLabel
          Tag = 1
          Left = 354
          Top = 186
          Width = 151
          Height = 18
          Caption = 'NACIONALIDADE'
          FocusControl = edtNacionalidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblProfissao: TLabel
          Tag = 1
          Left = 556
          Top = 186
          Width = 105
          Height = 18
          Caption = 'PROFISS'#195'O'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblLocalTrabalo: TLabel
          Tag = 1
          Left = 742
          Top = 186
          Width = 145
          Height = 18
          Caption = 'LOC. TRABALHO'
          FocusControl = edtLocalTrabalho
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblParente1: TLabel
          Tag = 1
          Left = 7
          Top = 242
          Width = 153
          Height = 18
          Caption = 'PARENTE 1 / PAI'
          FocusControl = edtParente1
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNumero: TLabel
          Tag = 1
          Left = 7
          Top = 123
          Width = 47
          Height = 18
          Caption = 'N'#218'M.'
          FocusControl = edtNumero
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblFoneParente1: TLabel
          Tag = 1
          Left = 312
          Top = 242
          Width = 153
          Height = 18
          Caption = 'FONE PARENTE 1'
          FocusControl = edtFoneParente1
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblParente2: TLabel
          Tag = 1
          Left = 478
          Top = 242
          Width = 159
          Height = 18
          Caption = 'PARENTE 2 / M'#195'E'
          FocusControl = edtParente2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblFoneParente2: TLabel
          Tag = 1
          Left = 784
          Top = 242
          Width = 153
          Height = 18
          Caption = 'FONE PARENTE 2'
          FocusControl = edtFoneParente2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblSite: TLabel
          Tag = 1
          Left = 7
          Top = 298
          Width = 42
          Height = 18
          Caption = 'SITE'
          FocusControl = edtSite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblObservacao: TLabel
          Tag = 1
          Left = 313
          Top = 298
          Width = 123
          Height = 18
          Caption = 'OBSERVA'#199#195'O'
          FocusControl = mmoObservacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCodigo: TDBEdit
          Left = 7
          Top = 23
          Width = 82
          Height = 26
          BorderStyle = bsNone
          CharCase = ecUpperCase
          DataField = 'CLI_CODIGO'
          DataSource = DS_cadastro
          Enabled = False
          TabOrder = 0
        end
        object edtRazao: TDBEdit
          Tag = 1
          Left = 95
          Top = 23
          Width = 492
          Height = 26
          BorderStyle = bsNone
          CharCase = ecUpperCase
          DataField = 'CLI_RAZAO'
          DataSource = DS_cadastro
          TabOrder = 1
        end
        object edtFantasia: TDBEdit
          Tag = 1
          Left = 593
          Top = 23
          Width = 400
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_FANTA'
          DataSource = DS_cadastro
          TabOrder = 2
        end
        object edtCidade: TDBEdit
          Left = 95
          Top = 87
          Width = 300
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_CIDADE'
          DataSource = DS_cadastro
          Enabled = False
          TabOrder = 4
        end
        object edtEstado: TDBEdit
          Left = 401
          Top = 88
          Width = 65
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_ESTADO'
          DataSource = DS_cadastro
          Enabled = False
          TabOrder = 5
        end
        object edtRegiao: TRzDBButtonEdit
          Tag = 1
          Left = 7
          Top = 87
          Width = 81
          Height = 26
          DataSource = DS_cadastro
          DataField = 'CLI_REGIAO'
          TabOrder = 3
          OnExit = edtRegiaoExit
          AltBtnWidth = 15
          ButtonWidth = 15
        end
        object edtEndereco: TDBEdit
          Tag = 1
          Left = 474
          Top = 88
          Width = 303
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_ENDERECO'
          DataSource = DS_cadastro
          TabOrder = 6
        end
        object edtBairro: TDBEdit
          Tag = 1
          Left = 783
          Top = 87
          Width = 210
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_BAIRRO'
          DataSource = DS_cadastro
          TabOrder = 7
        end
        object edtCep: TDBEdit
          Tag = 1
          Left = 84
          Top = 145
          Width = 114
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_CEP'
          DataSource = DS_cadastro
          TabOrder = 9
        end
        object edtEmail: TDBEdit
          Tag = 1
          Left = 204
          Top = 145
          Width = 251
          Height = 26
          CharCase = ecLowerCase
          DataField = 'CLI_EMAIL'
          DataSource = DS_cadastro
          TabOrder = 10
        end
        object edtFone: TDBEdit
          Tag = 1
          Left = 459
          Top = 145
          Width = 160
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_FONES'
          DataSource = DS_cadastro
          TabOrder = 11
        end
        object edtCelular: TDBEdit
          Tag = 1
          Left = 625
          Top = 145
          Width = 160
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_CELULAR2'
          DataSource = DS_cadastro
          TabOrder = 12
        end
        object dtpNascimento: TRzDBDateTimePicker
          Tag = 1
          Left = 791
          Top = 145
          Width = 186
          Height = 26
          Date = 42771.621057997680000000
          Format = ''
          Time = 42771.621057997680000000
          TabOrder = 13
          DataField = 'CLI_NACISM'
          DataSource = DS_cadastro
        end
        object cbxEstadoCivil: TDBComboBox
          Tag = 1
          Left = 7
          Top = 210
          Width = 145
          Height = 26
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'CLI_ESTCIVIL'
          DataSource = DS_cadastro
          Items.Strings = (
            'SOLTEIRO'
            'CASADO'
            'VI'#218'VO'
            'DISQUITADO'
            'OUTROS')
          TabOrder = 14
          OnEnter = cbxSexoEnter
        end
        object edtNaturalidade: TDBEdit
          Tag = 1
          Left = 158
          Top = 210
          Width = 190
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_NATURALIDADE'
          DataSource = DS_cadastro
          TabOrder = 15
        end
        object edtNacionalidade: TDBEdit
          Tag = 1
          Left = 354
          Top = 210
          Width = 196
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_NACIONALIDADE'
          DataSource = DS_cadastro
          TabOrder = 16
        end
        object cbxProfissao: TDBComboBox
          Tag = 1
          Left = 556
          Top = 210
          Width = 183
          Height = 26
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'CLI_PROFISSAO'
          DataSource = DS_cadastro
          Items.Strings = (
            'PROGRAMADOR'
            'PECUARISTA'
            'ARQUITETO'
            'ENGENHEIRO'
            'OUTROS')
          TabOrder = 17
          OnEnter = cbxSexoEnter
        end
        object edtLocalTrabalho: TDBEdit
          Tag = 1
          Left = 742
          Top = 210
          Width = 227
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_LOCALTRAB'
          DataSource = DS_cadastro
          TabOrder = 18
        end
        object edtParente1: TDBEdit
          Tag = 1
          Left = 7
          Top = 266
          Width = 300
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_PARENTE1'
          DataSource = DS_cadastro
          TabOrder = 19
        end
        object edtNumero: TDBEdit
          Tag = 1
          Left = 7
          Top = 145
          Width = 71
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_NUMERO'
          DataSource = DS_cadastro
          TabOrder = 8
        end
        object edtFoneParente1: TDBEdit
          Tag = 1
          Left = 312
          Top = 266
          Width = 160
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_FONEPAR1'
          DataSource = DS_cadastro
          TabOrder = 20
        end
        object edtParente2: TDBEdit
          Tag = 1
          Left = 478
          Top = 266
          Width = 300
          Height = 26
          CharCase = ecUpperCase
          DataField = 'CLI_PARENTE2'
          DataSource = DS_cadastro
          TabOrder = 21
        end
        object edtFoneParente2: TDBEdit
          Tag = 1
          Left = 784
          Top = 266
          Width = 160
          Height = 26
          DataField = 'CLI_FONEPAR2'
          DataSource = DS_cadastro
          TabOrder = 22
        end
        object edtSite: TDBEdit
          Tag = 1
          Left = 7
          Top = 319
          Width = 300
          Height = 26
          CharCase = ecLowerCase
          DataField = 'CLI_SITE'
          DataSource = DS_cadastro
          TabOrder = 23
        end
        object mmoObservacao: TDBMemo
          Tag = 1
          Left = 313
          Top = 319
          Width = 631
          Height = 26
          DataField = 'CLI_OBSERVACAO'
          DataSource = DS_cadastro
          TabOrder = 24
        end
      end
    end
  end
  inherited DS_cadastro: TDataSource
    DataSet = F_dmHospedes.QRY_cadHospede
    Left = 704
    Top = 384
  end
  object DS_cadastroRegiao: TDataSource
    DataSet = F_dmHospedes.QRY_cadHospedeRegiao
    Left = 784
    Top = 392
  end
end
