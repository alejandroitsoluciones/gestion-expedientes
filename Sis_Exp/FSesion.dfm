object Sesion_Form: TSesion_Form
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Inicio De Sesion'
  ClientHeight = 165
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 31
    Top = 19
    Width = 43
    Height = 15
    Caption = 'Usuario'
  end
  object Label2: TLabel
    Left = 21
    Top = 58
    Width = 63
    Height = 15
    Caption = 'Contrase'#241'a'
  end
  object Usuario_Edit: TEdit
    Left = 99
    Top = 16
    Width = 150
    Height = 23
    NumbersOnly = True
    TabOrder = 0
  end
  object Clave_Edit: TEdit
    Left = 99
    Top = 55
    Width = 150
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 99
    Top = 84
    Width = 150
    Height = 17
    Caption = 'Ver Contrase'#241'a'
    TabOrder = 2
    OnClick = CheckBox1Click
  end
  object Button1: TButton
    Left = 21
    Top = 120
    Width = 75
    Height = 25
    Caption = '&Iniciar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 173
    Top = 120
    Width = 75
    Height = 25
    Caption = '&Salir'
    TabOrder = 4
    OnClick = Button2Click
  end
end
