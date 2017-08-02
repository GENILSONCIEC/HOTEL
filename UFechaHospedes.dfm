inherited F_fechaHospedes: TF_fechaHospedes
  Caption = 'Fechamento de H'#243'spedes'
  ClientHeight = 503
  ClientWidth = 1027
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1033
  ExplicitHeight = 532
  PixelsPerInch = 96
  TextHeight = 18
  object imgBackground: TImage [0]
    Left = 0
    Top = 0
    Width = 1027
    Height = 503
    Align = alClient
    Center = True
    Stretch = True
    ExplicitLeft = 464
    ExplicitTop = 216
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  inherited pnlGeral: TPanel
    Width = 1027
    Height = 503
    ExplicitWidth = 1027
    ExplicitHeight = 503
    object gbxData: TGroupBox
      Left = 3
      Top = 0
      Width = 1018
      Height = 67
      TabOrder = 0
      object lblData: TLabel
        Left = 7
        Top = 7
        Width = 150
        Height = 18
        Caption = 'Dta / Hra - Sa'#237'da'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDtaSaida: TLabel
        Left = 7
        Top = 28
        Width = 56
        Height = 23
        Caption = '0000'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clHotLight
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dtaEntrada: TLabel
        Left = 300
        Top = 39
        Width = 108
        Height = 18
        Caption = 'Data entrada'
        Visible = False
      end
      object DtaSaida: TLabel
        Left = 423
        Top = 39
        Width = 89
        Height = 18
        Caption = 'Data saida'
        Visible = False
      end
      object Horaparametro: TLabel
        Left = 556
        Top = 39
        Width = 128
        Height = 18
        Caption = 'Hora parametro'
        Visible = False
      end
      object HoraEntrada: TLabel
        Left = 699
        Top = 39
        Width = 107
        Height = 18
        Caption = 'Hora entrada'
        Visible = False
      end
      object HoraSaida: TLabel
        Left = 842
        Top = 38
        Width = 88
        Height = 18
        Caption = 'Hora saida'
        Visible = False
      end
      object DTP_horaEntrada: TDateTimePicker
        Left = 699
        Top = 7
        Width = 137
        Height = 26
        Date = 42671.709627534720000000
        Time = 42671.709627534720000000
        Kind = dtkTime
        TabOrder = 0
        Visible = False
      end
      object DTP_horaSaida: TDateTimePicker
        Left = 842
        Top = 7
        Width = 137
        Height = 26
        Date = 42671.709627534720000000
        Time = 42671.709627534720000000
        Kind = dtkTime
        TabOrder = 1
        Visible = False
      end
    end
    object gbxDadosHospede: TGroupBox
      Left = 3
      Top = 70
      Width = 1018
      Height = 117
      TabOrder = 1
      object lblDescricaoApto: TLabel
        Left = 97
        Top = 3
        Width = 47
        Height = 18
        Alignment = taRightJustify
        Caption = 'Apto:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblHospede: TLabel
        Left = 61
        Top = 29
        Width = 83
        Height = 18
        Alignment = taRightJustify
        Caption = 'H'#243'spede:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDataEnt: TLabel
        Left = 26
        Top = 56
        Width = 118
        Height = 18
        Alignment = taRightJustify
        Caption = 'Dta. Entrada:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblVlrDiaria: TLabel
        Left = 652
        Top = 3
        Width = 154
        Height = 18
        Alignment = taRightJustify
        Caption = 'Vlr. Di'#225'ria Normal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCodHospede: TLabel
        Left = 150
        Top = 27
        Width = 56
        Height = 23
        Caption = '2020'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clHotLight
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblNomeHospede: TLabel
        Left = 219
        Top = 27
        Width = 117
        Height = 23
        Caption = '-------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clHotLight
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblApto: TLabel
        Left = 150
        Top = 1
        Width = 56
        Height = 23
        Caption = '1010'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clHotLight
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblDtaEntrada: TLabel
        Left = 150
        Top = 54
        Width = 56
        Height = 23
        Caption = '3030'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clHotLight
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblVlrDiariaExtra: TLabel
        Left = 652
        Top = 57
        Width = 139
        Height = 18
        Alignment = taRightJustify
        Caption = 'Vlr. Di'#225'ria Extra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblQtdDiariaExtra: TLabel
        Left = 843
        Top = 57
        Width = 147
        Height = 18
        Alignment = taRightJustify
        Caption = 'Qtd. Di'#225'ria Extra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblQtdDiariaNormal: TLabel
        Left = 843
        Top = 3
        Width = 162
        Height = 18
        Alignment = taRightJustify
        Caption = 'Qtd. Di'#225'ria Normal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblHoraEntrada: TLabel
        Left = 25
        Top = 80
        Width = 119
        Height = 18
        Alignment = taRightJustify
        Caption = 'Hra. Entrada:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblHraEntrada: TLabel
        Left = 150
        Top = 76
        Width = 56
        Height = 23
        Caption = '4040'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clHotLight
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object edtVlrDiariaNormal: TcxCurrencyEdit
        Left = 652
        Top = 24
        EditValue = 0.000000000000000000
        Properties.EditFormat = 'R$ ,0.00'
        Style.BorderStyle = ebsNone
        Style.Color = clBtnFace
        Style.TextColor = clHotLight
        TabOrder = 0
        Width = 154
      end
      object edtQtdDiariasNormais: TcxCurrencyEdit
        Left = 843
        Top = 25
        EditValue = 0.000000000000000000
        Properties.DisplayFormat = ',0.00'
        Properties.EditFormat = ' ,0.00'
        Style.BorderStyle = ebsNone
        Style.Color = clBtnFace
        Style.TextColor = clHotLight
        TabOrder = 1
        Width = 154
      end
      object edtVlrDiariaExtra: TcxCurrencyEdit
        Left = 652
        Top = 75
        EditValue = 0.000000000000000000
        Properties.EditFormat = 'R$ ,0.00'
        Style.BorderStyle = ebsNone
        Style.Color = clBtnFace
        Style.TextColor = clHotLight
        TabOrder = 2
        Width = 154
      end
      object edtQtdDiariaExtra: TcxCurrencyEdit
        Left = 843
        Top = 75
        EditValue = 0.000000000000000000
        Properties.DisplayFormat = ',0.00'
        Properties.EditFormat = ' ,0.00'
        Style.BorderStyle = ebsNone
        Style.Color = clBtnFace
        Style.TextColor = clHotLight
        TabOrder = 3
        Width = 154
      end
    end
    object pnlDados: TPanel
      Left = 3
      Top = 199
      Width = 1022
      Height = 234
      BevelOuter = bvNone
      TabOrder = 2
      object PGC_fechaHospede: TPageControl
        Left = 0
        Top = 0
        Width = 1022
        Height = 234
        ActivePage = tabBar
        Align = alClient
        TabOrder = 0
        OnDrawTab = PGC_fechaHospedeDrawTab
        object tabApto: TTabSheet
          Caption = 'Apartamento'
          object gbxTotais: TGroupBox
            Left = 3
            Top = 0
            Width = 174
            Height = 201
            TabOrder = 0
            object lblTotExtras: TLabel
              Left = 8
              Top = 56
              Width = 127
              Height = 18
              Alignment = taRightJustify
              Caption = '$ Extra - Total'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblTotNormais: TLabel
              Left = 8
              Top = 6
              Width = 151
              Height = 18
              Alignment = taRightJustify
              Caption = '$ Normais - Total'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblTotGeralDiarias: TLabel
              Left = 8
              Top = 131
              Width = 123
              Height = 18
              Alignment = taRightJustify
              Caption = '$ T. G. Di'#225'rias'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtTDNormais: TcxCurrencyEdit
              Left = 8
              Top = 25
              EditValue = 0.000000000000000000
              Style.BorderStyle = ebsNone
              Style.Color = clWhite
              Style.TextColor = clHotLight
              TabOrder = 0
              Width = 134
            end
            object edtTDExtras: TcxCurrencyEdit
              Left = 8
              Top = 76
              EditValue = 0.000000000000000000
              Style.BorderStyle = ebsNone
              Style.Color = clWhite
              Style.TextColor = clHotLight
              TabOrder = 1
              Width = 134
            end
            object edtTGDiarias: TcxCurrencyEdit
              Left = 8
              Top = 151
              EditValue = 0.000000000000000000
              Style.BorderStyle = ebsNone
              Style.Color = clWhite
              Style.TextColor = clHotLight
              TabOrder = 2
              Width = 134
            end
          end
          object gbxNormal: TGroupBox
            Left = 179
            Top = 0
            Width = 225
            Height = 201
            TabOrder = 1
            object lblVlrGeralBar: TLabel
              Left = 11
              Top = 6
              Width = 126
              Height = 18
              Alignment = taRightJustify
              Caption = '$ Geral do Bar'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblVlrGeralOutros: TLabel
              Left = 11
              Top = 56
              Width = 128
              Height = 18
              Alignment = taRightJustify
              Caption = '$ Geral Outros'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object pnlTGeral: TPanel
              Left = 2
              Top = 121
              Width = 221
              Height = 78
              Align = alBottom
              Color = clActiveBorder
              ParentBackground = False
              TabOrder = 0
              object lblTotalGeral: TLabel
                Left = 9
                Top = 4
                Width = 150
                Height = 25
                Alignment = taRightJustify
                Caption = '$ Total Geral'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edtTGeral: TcxCurrencyEdit
                Left = 2
                Top = 35
                EditValue = 0.000000000000000000
                ParentFont = False
                Style.BorderStyle = ebsNone
                Style.Color = clActiveBorder
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -27
                Style.Font.Name = 'Verdana'
                Style.Font.Style = []
                Style.TextColor = clHotLight
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 215
              end
            end
            object edtTGBar: TcxCurrencyEdit
              Left = 12
              Top = 25
              EditValue = 0.000000000000000000
              Properties.EditFormat = ',0.00'
              Style.BorderStyle = ebsNone
              Style.Color = clWhite
              Style.TextColor = clHotLight
              TabOrder = 1
              Width = 134
            end
            object edtTGOutros: TcxCurrencyEdit
              Left = 12
              Top = 76
              EditValue = 0.000000000000000000
              Style.BorderStyle = ebsNone
              Style.Color = clWhite
              Style.TextColor = clHotLight
              TabOrder = 2
              Width = 134
            end
          end
          object rgpTolerancia: TRadioGroup
            Left = 727
            Top = 43
            Width = 248
            Height = 102
            Caption = 'Toler'#226'ncia?'
            Color = clAppWorkSpace
            Columns = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ItemIndex = 1
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ParentBackground = False
            ParentColor = False
            ParentFont = False
            TabOrder = 2
            Visible = False
            OnClick = rgpToleranciaClick
          end
          object gbx: TGroupBox
            Left = 408
            Top = 0
            Width = 297
            Height = 201
            TabOrder = 3
            object Panel1: TPanel
              Left = 2
              Top = 20
              Width = 293
              Height = 179
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
            end
          end
        end
        object tabBar: TTabSheet
          Caption = 'Bar / Consumo'
          ImageIndex = 1
          object DBG_produtos: TDBGrid
            Left = 0
            Top = 0
            Width = 1014
            Height = 201
            Align = alClient
            DataSource = DS_proConsumidos
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -16
            TitleFont.Name = 'Verdana'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'ME2_PRODUTO'
                Title.Caption = 'COD. PRO'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ME2_PRONOME'
                Title.Caption = 'PRODUTO'
                Width = 350
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ME2_QUATIDADE'
                Title.Caption = 'QTD'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ME2_VLRUNIT'
                Title.Caption = '$ UNIT'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ME2_DESCONTO'
                Title.Caption = '( - ) DES'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLR_TOTAL'
                Title.Caption = '$ TOTAL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ME2_DATA'
                Title.Caption = 'DATA'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ME2_COMPLEMENTO'
                Title.Caption = 'OBSERVA'#199#195'O'
                Width = 450
                Visible = True
              end>
          end
        end
        object tabDiversos: TTabSheet
          Caption = 'Outros'
          ImageIndex = 2
        end
      end
    end
    object pnlControle: TPanel
      Left = 0
      Top = 436
      Width = 1027
      Height = 67
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      object btnFormasPgto: TSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 166
        Height = 61
        Align = alLeft
        Caption = 'F3 - Fatura'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Glyph.Data = {
          361B0000424D361B000000000000360000002800000030000000300000000100
          180000000000001B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF2F1F0CCC9C6ABA6A1938E887E7770736D646E
          655D6E655D736D647E7770938E88ABA6A1CDCAC7F2F1F1FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F3F3C0BDB989827C6A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A615989827DC1BDBAF4F4F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EF
          EEADA8A37065606A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596F685E
          AEA9A5F1F0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFCFCFCBBB7B36F685E6A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596F6761BDB9B5FCFCFCFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E8E7847F776A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A6159888179EBE9E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFD0CDCA6F67616A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A6159706A60D2
          CFCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3BFBC6960586A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A6159696058C5C2BFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3BFBC6A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A6159C6C2BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFD0CDCA6B625A6A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596C635BD3D0CEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E7E66F67616A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A6159736863ECEBEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFBFBFB857C786A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A615989827CFDFD
          FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B5B26A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A6159BFBBB7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          EFEEED7065606A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159706A
          60F2F1F1FFFFFFFFFFFFFFFFFFFFFFFFABA6A16A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A6159B0ABA7FFFFFFFFFFFFFFFFFFF3F3F2
          6D675F6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596F6761F6F5F5FFFFFFFFFFFFBFBBB86A61596A61596A61596A61596A61596A
          61596A61596A61596A61596C655977775A77775A77775A77775A77775A77775A
          77775A77775A77775A77775A77775A77775A77775A77775A77775A77775A7777
          5A77775A77775A77775A74735A6A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A6159C3C0BDFFFFFFFFFFFF88807B
          6A61596A61596A61596A61596A61596A61596A61596A61596A615991A25CAFD4
          5FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAF
          D45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45F797A5A
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61598C867FFFFFFFF1F0EF6A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A615994A85DB2D564E1EFC3E0EFC2DDEDBBDDEDBBDDEDBB
          DDEDBBDDEDBBDDEDBBDDEDBBDDEDBBDDEDBBDDEDBBDDEDBBDDEDBBDDEDBBDDED
          BBDFEEBDE1EFC3D2E7A6AFD45F7D815A73705A6A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596B625AF4F3F3CBC8C56A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A615994A85DB3D6
          67FFFFFFEBF4D6AFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAF
          D45FAFD45FAFD45FAFD45FAFD45FAFD45FB7D970FDFEFCE7F2D0AFD45F89955C
          A8C85F6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A6159CFCCCAAAA5A06A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A615994A85DB3D667DFEEBEB3D667AFD45FAFD45FAFD45F
          AFD45FAFD45FCDE49CF1F7E2F1F6E2E7F2D0BDDB7BAFD45FAFD45FAFD45FAFD4
          5FAFD45FB8D971DFEEC1AFD45F8B975BA9CA5E7F855A80855B6A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A6159ADA8A4938C876A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A615994A85DB3D6
          67D7E9AFAFD45FAFD45FAFD45FAFD45FAFD45FD1E6A3FEFEFCD8EAB1BFDD80F5
          FAEBFAFCF6B9DA74AFD45FAFD45FAFD45FAFD45FAFD45FDDEDBCAFD45F8B975B
          A9CA5E92A45C93A55D6A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A6159968F8A7E746D6A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A615994A85DB3D667D7E9AFAFD45FC1DE83F7FBEFEAF4D4
          B1D562F8FBF1FFFFFFE7F2D0DBEBB6C6E08DFFFFFFDCECB9BFDD7FF6FAEDECF5
          D8B2D665AFD45FDDEDBCAFD45F8B975BA9CA5E92A45C93A55D6A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A6159817A71746C626A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A615994A85DB3D6
          67D7E9AFAFD45FDCECB9FFFFFFFFFFFFC1DD82FFFFFFFFFFFFD3E7A7B8D972E3
          F0C7FFFFFFE7F2CFDAEBB4FFFFFFFFFFFFC1DE83AFD45FDDEDBCAFD45F8B975B
          A9CA5E92A45C93A55D6A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A6159776D686D625A6A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A615994A85DB3D667D7E9AFAFD45FBDDB7BEFF6DEE1EFC3
          B0D460F6FAECFCFEFAB2D666E8F3D2F2F8E5FFFFFFD9EBB4BBDB77EEF6DCE3F0
          C8B1D562AFD45FDDEDBCAFD45F8B975BA9CA5E92A45C93A55D6A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61597065606A625C6A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A615994A85DB3D6
          67D7E9AFAFD45FAFD45FAFD45FAFD45FAFD45FCBE396FFFFFEECF5DABFDC7EEE
          F6DCF7FBEFB6D86DAFD45FAFD45FAFD45FAFD45FAFD45FDDEDBCAFD45F8B975B
          A9CA5E92A45C93A55D6A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596D675F746C626A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A615994A85DB3D667E3F0C7B7D86FAFD45FAFD45FAFD45F
          AFD45FAFD45FC5E08CE8F3D1EEF5DCE0EEC0B8D971AFD45FAFD45FAFD45FAFD4
          5FAFD45FBFDD7FE1EEC3AFD45F8B975BA9CA5E92A45C93A55D6A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A6159776F657C756E6A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A615994A85DB3D6
          67FFFFFFEFF6DEB1D563B1D563B1D563B1D563B1D563B1D563B1D563B1D563B1
          D563B1D563B1D563B1D563B1D563B1D563BCDB78FEFFFEE7F2D0AFD45F8B975B
          A9CA5E92A45C93A55D6A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A6159817772928C866A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A615994A85DB1D563D7EAAFD7EAAFD7EAAFD7EAAFD7EAAF
          D7EAAFD7EAAFD7EAAFD7EAAFD7EAAFD7EAAFD7EAAFD7EAAFD7EAAFD7EAAFD7EA
          AFD7EAAFD7EAAFCBE397AFD45F8B975BA9CA5E92A45C93A55D6A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A6159968F8AA9A49F6A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61598E9D5CAFD4
          5FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAF
          D45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAFD45FAED35F868F5B
          A9CA5E92A45C93A55D6A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A6159ADA8A3CAC7C46A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A62596E68597E825A92A35C92A35C92A35C92A35C
          92A35C92A35C92A35C92A35C92A35C92A35C92A35C92A35C92A35C92A35C92A3
          5C92A35C92A35C92A35C91A25C98AD5DA9CA5E92A45C93A55D6A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A6159CECBC8F0EFEE6A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          597F855A97AB5D97AB5D97AB5D97AB5D97AB5D97AB5D97AB5D97AB5D97AB5D97
          AB5D97AB5D97AB5D97AB5D97AB5D97AB5D97AB5D97AB5D97AB5D97AB5D97AB5D
          8D9B5C92A45C93A55D6A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A6159F3F3F2FFFFFF877F796A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A6159A1BD5EADD15EADD15E
          ADD15EADD15EADD15EADD15EADD15EADD15EADD15EADD15EADD15EADD15EADD1
          5EADD15EADD15EADD15EADD15EADD15EADD15EAFD35F92A45C6A61596A61596A
          61596A61596A61596A61596A61596A61596A61598B847DFFFFFFFFFFFFBEBAB6
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A615973705A78785A78785A78785A78785A78785A78785A78785A78
          785A78785A78785A78785A78785A78785A78785A78785A78785A78785A78785A
          78785A78785A6F69596A61596A61596A61596A61596A61596A61596A61596A61
          596A6159C2BEBBFFFFFFFFFFFFF3F2F16F665C6A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596F685EF4F4F3FFFFFFFFFFFFFFFFFF
          A9A49F6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          59AEA9A5FFFFFFFFFFFFFFFFFFFFFFFFEEEDEC6F665C6A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596F6761F1F0EFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB7B3AF6A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159BCB8
          B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFA847B766A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A6159877F79FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE7E6E47065606A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A6159726761EAE9E8FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCAC86B625A6A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A6159696058D0CDCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFC0BDB96A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A6159C3C0BDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0
          BDB96B625A6A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A615969
          6058C3C0BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECBC86F685E6A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596F6761D0CDCBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE8E6E5837D756A61596A61596A61596A61596A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596A61596A61596A61596A6159857C78E9E7E6FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFAB8B3B06D67
          5F6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A6159
          6A6159706560B9B5B2FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEDECA9A49F6F665C6A61596A61596A6159
          6A61596A61596A61596A61596A61596A61596A61596A61596A61596A61596A61
          596A61596A61596A61596A61596D675FABA6A1EFEEEDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF3F2F1BEBAB786807A6A61596A61596A61596A61596A61596A61596A
          61596A61596A61596A61596A61596A61596A61596A615988807BBFBBB7F3F3F2
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EFEE
          CAC7C4A9A49F928C867E746D746C626D625A6D625A746C627E746D938C87AAA5
          A0CBC8C5F1F0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        OnClick = btnFormasPgtoClick
      end
    end
    object DTP_horaParametro: TDateTimePicker
      Left = 561
      Top = 7
      Width = 137
      Height = 26
      Date = 42671.709627534720000000
      Time = 42671.709627534720000000
      Kind = dtkTime
      TabOrder = 4
      Visible = False
    end
    object DTP_dataEntrada: TDateTimePicker
      Left = 294
      Top = 7
      Width = 117
      Height = 26
      Date = 42674.470325138890000000
      Time = 42674.470325138890000000
      Enabled = False
      TabOrder = 5
      Visible = False
    end
    object DTP_dataSaida: TDateTimePicker
      Left = 428
      Top = 7
      Width = 127
      Height = 26
      Date = 42779.715192986110000000
      Time = 42779.715192986110000000
      TabOrder = 6
      Visible = False
    end
  end
  object QRY_proConsumidos: TFDQuery
    OnCalcFields = QRY_proConsumidosCalcFields
    AggregatesActive = True
    Connection = F_dmConexao.FDConn
    SQL.Strings = (
      
        'select ME2_DOCTO, ME2_OPERACAO, ME2_DATA, ME2_QUATIDADE, ME2_VLR' +
        'UNIT,'
      
        'ME2_PRONOME, ME2_VLRTOTAL, ME2_DESCONTO, ME2_FUNCIONARIO, ME2_CO' +
        'MPLEMENTO, ME2_PRODUTO from mvestoque2')
    Left = 368
    Top = 128
    object QRY_proConsumidosME2_DOCTO: TStringField
      FieldName = 'ME2_DOCTO'
      Origin = 'ME2_DOCTO'
      Required = True
      FixedChar = True
      Size = 12
    end
    object QRY_proConsumidosME2_OPERACAO: TSmallintField
      FieldName = 'ME2_OPERACAO'
      Origin = 'ME2_OPERACAO'
      Required = True
    end
    object QRY_proConsumidosME2_DATA: TDateField
      FieldName = 'ME2_DATA'
      Origin = 'ME2_DATA'
    end
    object QRY_proConsumidosME2_QUATIDADE: TBCDField
      Alignment = taCenter
      FieldName = 'ME2_QUATIDADE'
      Origin = 'ME2_QUATIDADE'
      Precision = 18
      Size = 3
    end
    object QRY_proConsumidosME2_VLRUNIT: TBCDField
      Alignment = taLeftJustify
      FieldName = 'ME2_VLRUNIT'
      Origin = 'ME2_VLRUNIT'
      currency = True
      Precision = 18
    end
    object QRY_proConsumidosME2_PRONOME: TStringField
      FieldName = 'ME2_PRONOME'
      Origin = 'ME2_PRONOME'
      FixedChar = True
      Size = 70
    end
    object QRY_proConsumidosME2_DESCONTO: TBCDField
      Alignment = taLeftJustify
      FieldName = 'ME2_DESCONTO'
      Origin = 'ME2_DESCONTO'
      currency = True
      Precision = 18
    end
    object QRY_proConsumidosME2_FUNCIONARIO: TIntegerField
      FieldName = 'ME2_FUNCIONARIO'
      Origin = 'ME2_FUNCIONARIO'
    end
    object QRY_proConsumidosME2_COMPLEMENTO: TStringField
      FieldName = 'ME2_COMPLEMENTO'
      Origin = 'ME2_COMPLEMENTO'
      Size = 500
    end
    object QRY_proConsumidosME2_PRODUTO: TIntegerField
      Alignment = taCenter
      FieldName = 'ME2_PRODUTO'
      Origin = 'ME2_PRODUTO'
      DisplayFormat = '0000'
    end
    object QRY_proConsumidosVLR_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VLR_TOTAL'
      Calculated = True
    end
    object QRY_proConsumidosvlrTotal: TAggregateField
      FieldName = 'vlrTotal'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(me2_vlrtotal)'
    end
  end
  object DS_proConsumidos: TDataSource
    DataSet = QRY_proConsumidos
    Left = 488
    Top = 128
  end
end
