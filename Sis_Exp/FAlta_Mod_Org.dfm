object Opc_Org_Form: TOpc_Org_Form
  Left = 0
  Top = 0
  Caption = 'Opc_Org_Form'
  ClientHeight = 156
  ClientWidth = 452
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
    Left = 26
    Top = 24
    Width = 122
    Height = 15
    Caption = 'Codigo De Organismo'
  end
  object Label2: TLabel
    Left = 26
    Top = 72
    Width = 128
    Height = 15
    Caption = 'Nombre De Organismo'
  end
  object Cod_Edit: TEdit
    Left = 176
    Top = 21
    Width = 250
    Height = 23
    Alignment = taCenter
    CharCase = ecUpperCase
    NumbersOnly = True
    TabOrder = 0
  end
  object Nom_Edit: TEdit
    Left = 176
    Top = 69
    Width = 250
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object Button1: TButton
    Left = 26
    Top = 120
    Width = 75
    Height = 25
    Caption = '&Guardar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 26
    Top = 120
    Width = 75
    Height = 25
    Caption = '&Guardar'
    TabOrder = 3
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 107
    Top = 120
    Width = 75
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 4
    OnClick = Button3Click
  end
end
