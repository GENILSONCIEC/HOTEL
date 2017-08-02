inherited F_noticias: TF_noticias
  Caption = 'Not'#237'cias do Ciec'
  ClientHeight = 482
  ClientWidth = 1000
  WindowState = wsMaximized
  OnCreate = FormCreate
  ExplicitWidth = 1006
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 18
  inherited pnlGeral: TPanel
    Width = 1000
    Height = 482
    ExplicitWidth = 1000
    ExplicitHeight = 482
    object WebBrowser: TWebBrowser
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 980
      Height = 462
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 300
      ExplicitHeight = 150
      ControlData = {
        4C00000049650000C02F00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
end
