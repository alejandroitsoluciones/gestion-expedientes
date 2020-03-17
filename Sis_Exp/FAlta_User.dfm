object Alta_User_Form: TAlta_User_Form
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Nuevo Usuario'
  ClientHeight = 350
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    527
    350)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 176
    Width = 142
    Height = 15
    Caption = 'Nombre De Usuario (DNI)'
  end
  object Label2: TLabel
    Left = 24
    Top = 210
    Width = 25
    Height = 15
    Caption = 'Host'
  end
  object Label3: TLabel
    Left = 24
    Top = 242
    Width = 63
    Height = 15
    Caption = 'Contrase'#241'a'
  end
  object Label4: TLabel
    Left = 24
    Top = 275
    Width = 120
    Height = 15
    Caption = 'Confirmar Contrase'#241'a'
  end
  object Label5: TLabel
    Left = 24
    Top = 8
    Width = 45
    Height = 15
    Caption = 'Nombre'
  end
  object Label6: TLabel
    Left = 24
    Top = 40
    Width = 44
    Height = 15
    Caption = 'Apellido'
  end
  object Label7: TLabel
    Left = 24
    Top = 72
    Width = 21
    Height = 15
    Caption = 'DNI'
  end
  object Label8: TLabel
    Left = 24
    Top = 104
    Width = 89
    Height = 15
    Caption = 'Tipo De Usuario'
  end
  object Label9: TLabel
    Left = 24
    Top = 136
    Width = 52
    Height = 15
    Caption = 'Comisi'#243'n'
  end
  object Nombre_U_Edit: TEdit
    Left = 184
    Top = 173
    Width = 320
    Height = 23
    Enabled = False
    NumbersOnly = True
    TabOrder = 5
  end
  object Host_Edit: TEdit
    Left = 184
    Top = 207
    Width = 320
    Height = 23
    TabOrder = 6
  end
  object Clave_Edit: TEdit
    Left = 184
    Top = 239
    Width = 320
    Height = 23
    PasswordChar = '*'
    TabOrder = 7
  end
  object Confirm_Clave_Edit: TEdit
    Left = 184
    Top = 272
    Width = 320
    Height = 23
    PasswordChar = '*'
    TabOrder = 8
  end
  object Button1: TButton
    Left = 24
    Top = 312
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Guardar'
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 105
    Top = 312
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Cancelar'
    TabOrder = 10
    OnClick = Button2Click
  end
  object Nombre_Edit: TEdit
    Left = 184
    Top = 5
    Width = 320
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object Apellido_Edit: TEdit
    Left = 184
    Top = 34
    Width = 320
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object DNI_Edit: TEdit
    Left = 184
    Top = 69
    Width = 320
    Height = 23
    CharCase = ecUpperCase
    NumbersOnly = True
    TabOrder = 2
    OnChange = DNI_EditChange
  end
  object Tipo_U_ComboBox: TComboBox
    Left = 184
    Top = 101
    Width = 320
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    TabOrder = 3
    OnSelect = Tipo_U_ComboBoxSelect
    Items.Strings = (
      'COMUN')
  end
  object Com_ComboBox: TComboBox
    Left = 184
    Top = 133
    Width = 320
    Height = 23
    Style = csDropDownList
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 4
    OnClick = Com_ComboBoxClick
    Items.Strings = (
      'LEGISLACION GENERAL'
      'HACIEDA, PRESUPUESTO Y CUENTAS'
      'OBRAS PUBLICAS Y URBANISMO'
      'SERVICIOS PUBLICOS, ACTIVIDADES COMERCIALES Y PRIVATIZACIONES'
      'TRANSITO, TRANSPORTE Y SEGURIDAD VIAL'
      'ACCION SOCIAL Y BECAS'
      'CULTURA, EDUCACION Y PRENSA'
      'DEPORTE, TURISMO Y RECREACION'
      'MEDIO AMBIENTE, HIGIENE Y SEGURIDAD'
      'SALUD Y NINEZ'
      
        'ASUNTOS VECINALES, ORGANIZACIONES COMINITARIAS Y DEFENZA DEL CON' +
        'SUMIDOR'
      'DERECHOS HUMANOS Y GARANTIAS CONSTITUCIONALES'
      'COMERCIO INTERNACIONAL')
  end
end
