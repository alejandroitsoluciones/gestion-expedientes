object Opc_Com_Form: TOpc_Com_Form
  Left = 0
  Top = 0
  Caption = 'Opc_Com_Form'
  ClientHeight = 182
  ClientWidth = 503
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 119
    Height = 15
    Caption = 'Nombre De Comisi'#243'n'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 108
    Height = 15
    Caption = 'Nombre Encargado'
  end
  object Label3: TLabel
    Left = 16
    Top = 96
    Width = 107
    Height = 15
    Caption = 'Apellido Encargado'
  end
  object Nom_Com_Edit: TEdit
    Left = 141
    Top = 13
    Width = 347
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object Nom_E_Edit: TEdit
    Left = 141
    Top = 53
    Width = 347
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object Apell_E_Edit: TEdit
    Left = 141
    Top = 93
    Width = 347
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object Button1: TButton
    Left = 16
    Top = 143
    Width = 75
    Height = 25
    Caption = '&Guardar'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 143
    Width = 75
    Height = 25
    Caption = '&Guardar'
    TabOrder = 3
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 97
    Top = 143
    Width = 75
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 4
    OnClick = Button3Click
  end
end
