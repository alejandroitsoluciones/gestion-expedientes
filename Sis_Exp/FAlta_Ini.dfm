object N_Ini_Form: TN_Ini_Form
  Left = 0
  Top = 0
  Caption = 'Agregar Nuevo Iniciador'
  ClientHeight = 216
  ClientWidth = 455
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
    Left = 15
    Top = 61
    Width = 45
    Height = 15
    Caption = 'Nombre'
  end
  object Label2: TLabel
    Left = 238
    Top = 61
    Width = 44
    Height = 15
    Caption = 'Apellido'
  end
  object Label3: TLabel
    Left = 275
    Top = 16
    Width = 21
    Height = 15
    Caption = 'DNI'
  end
  object Label4: TLabel
    Left = 10
    Top = 103
    Width = 52
    Height = 15
    Caption = 'Direcci'#243'n'
  end
  object Label5: TLabel
    Left = 21
    Top = 143
    Width = 33
    Height = 15
    Caption = 'Barrio'
  end
  object Label6: TLabel
    Left = 10
    Top = 18
    Width = 93
    Height = 15
    Caption = 'Tipo De Iniciador'
  end
  object Nombre_Edit: TEdit
    Left = 66
    Top = 58
    Width = 121
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object Apellido_Edit: TEdit
    Left = 321
    Top = 58
    Width = 121
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object DNI_Edit: TEdit
    Left = 320
    Top = 13
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 1
  end
  object Direccion_Edit: TEdit
    Left = 66
    Top = 100
    Width = 377
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object Barrio_Edit: TEdit
    Left = 66
    Top = 140
    Width = 377
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object Tipo_Ini_ComboBox: TComboBox
    Left = 109
    Top = 15
    Width = 145
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    TabOrder = 0
    OnSelect = Tipo_Ini_ComboBoxSelect
    Items.Strings = (
      'PARTICULAR'
      'CONCEJAL'
      'CENTRO VECINAL'
      'VECINOS')
  end
  object Button1: TButton
    Left = 8
    Top = 180
    Width = 75
    Height = 25
    Caption = '&Guardar'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 107
    Top = 180
    Width = 75
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 180
    Width = 75
    Height = 25
    Caption = '&Guardar'
    TabOrder = 6
    Visible = False
    OnClick = Button3Click
  end
end
