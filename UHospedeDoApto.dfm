inherited F_hospedeDoApto: TF_hospedeDoApto
  Caption = 'H'#243'spede do Apto'
  ClientHeight = 147
  ClientWidth = 534
  Position = poDefault
  ExplicitWidth = 540
  ExplicitHeight = 176
  PixelsPerInch = 96
  TextHeight = 18
  inherited pnlGeral: TPanel
    Width = 534
    Height = 147
    object edtCliente: TcxTextEdit
      Left = 31
      Top = 42
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      Style.BorderStyle = ebsNone
      Style.Color = clSkyBlue
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Verdana'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Text = 'CLIENTE'
      Width = 242
    end
  end
end
