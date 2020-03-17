object Ctrl_Folios_Form: TCtrl_Folios_Form
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Control De Folios'
  ClientHeight = 161
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 23
    Top = 20
    Width = 88
    Height = 15
    Caption = 'N'#250'mero De Exp'
  end
  object Label2: TLabel
    Left = 128
    Top = 20
    Width = 3
    Height = 15
  end
  object Label5: TLabel
    Left = 180
    Top = 20
    Width = 123
    Height = 15
    Caption = 'Fecha De Iniciado Exp'
  end
  object Label6: TLabel
    Left = 313
    Top = 20
    Width = 3
    Height = 15
  end
  object Label7: TLabel
    Left = 68
    Top = 67
    Width = 94
    Height = 15
    Caption = 'Control De Folios'
  end
  object Ctrl_F_Edit: TEdit
    Left = 168
    Top = 64
    Width = 150
    Height = 23
    NumbersOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 162
    Top = 121
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 1
    OnClick = Button1Click
  end
end
