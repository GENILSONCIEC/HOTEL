inherited F_verHospedes: TF_verHospedes
  Caption = 'Ver H'#243'spedes'
  ClientHeight = 486
  ClientWidth = 1033
  OnShow = FormShow
  ExplicitWidth = 1039
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 18
  inherited pnlGeral: TPanel
    Width = 1033
    Height = 486
    ExplicitWidth = 1033
    ExplicitHeight = 486
    object pnlTopo: TPanel
      Left = 0
      Top = 0
      Width = 1033
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnlRodape: TPanel
      Left = 0
      Top = 436
      Width = 1033
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
    end
    object pnlConteudo: TPanel
      Left = 0
      Top = 57
      Width = 1033
      Height = 379
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGridVerHospedes: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1027
        Height = 373
        Hint = 'AptosAbertosPeriodo.fr3'
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = cxcbsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Lilian'
        ExplicitLeft = 6
        ExplicitTop = 0
        object verHospedes: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Filter.Visible = True
          FilterBox.CustomizeDialog = False
          FindPanel.InfoText = 'Texto'
          DataController.DataSource = DS_verEntraHospede2
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Filter.AutoDataSetFilter = True
          DataController.Filter.TranslateLike = True
          DataController.MultiThreadedOptions.Filtering = bFalse
          DataController.MultiThreadedOptions.Sorting = bFalse
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              FieldName = 'ENT_CODHOSPEDE2'
              Column = edtCodigo
            end>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = 'Click aqui para definir um Filtro!'
          FilterRow.Visible = True
          NewItemRow.InfoText = 'Adicione uma nova linha!'
          OptionsCustomize.ColumnFiltering = False
          OptionsView.NoDataToDisplayInfoText = 'Sem Informa'#231#245'es!'
          OptionsView.Footer = True
          OptionsView.FooterMultiSummaries = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          OptionsView.Indicator = True
          object edtCodigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'ENT_CODHOSPEDE2'
            FooterAlignmentHorz = taCenter
            Options.Editing = False
            Width = 100
          end
          object edtRazao: TcxGridDBColumn
            Caption = 'Raz'#227'o'
            DataBinding.FieldName = 'ENT_RAZAO2'
            Options.Editing = False
            Width = 600
          end
        end
        object cxGridLevelVH: TcxGridLevel
          GridView = verHospedes
        end
      end
    end
  end
  object DS_verEntraHospede2: TDataSource
    DataSet = F_dmHospedes.QRY_EntraHospede2
    Left = 816
    Top = 80
  end
end
