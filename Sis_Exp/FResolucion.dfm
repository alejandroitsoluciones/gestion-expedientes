object Resolucion_Form: TResolucion_Form
  Left = 0
  Top = 0
  Caption = 'Resoluci'#243'n'
  ClientHeight = 362
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    702
    362)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 88
    Height = 15
    Caption = 'N'#250'mero De Exp'
  end
  object Label2: TLabel
    Left = 232
    Top = 8
    Width = 99
    Height = 15
    Caption = 'Fecha De Iniciado'
  end
  object Label3: TLabel
    Left = 472
    Top = 8
    Width = 104
    Height = 15
    Caption = 'Cantidad De Folios'
  end
  object Label4: TLabel
    Left = 8
    Top = 40
    Width = 60
    Height = 16
    Caption = 'Referencia'
  end
  object Label5: TLabel
    Left = 8
    Top = 184
    Width = 81
    Height = 16
    Caption = 'Observaciones'
  end
  object Label6: TLabel
    Left = 112
    Top = 40
    Width = 38
    Height = 15
    Caption = 'Estado'
  end
  object Num_Exp_Edit: TEdit
    Left = 112
    Top = 5
    Width = 100
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    NumbersOnly = True
    TabOrder = 0
  end
  object Fecha_Edit: TEdit
    Left = 352
    Top = 5
    Width = 100
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 1
  end
  object Folios_Edit: TEdit
    Left = 592
    Top = 5
    Width = 100
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    NumbersOnly = True
    TabOrder = 2
  end
  object Ref_Memo: TMemo
    Left = 8
    Top = 66
    Width = 684
    Height = 100
    CharCase = ecUpperCase
    Enabled = False
    Lines.Strings = (
      '')
    TabOrder = 3
  end
  object Obs_Memo: TMemo
    Left = 8
    Top = 216
    Width = 686
    Height = 100
    Lines.Strings = (
      '')
    TabOrder = 4
  end
  object Estado_ComboBox: TComboBox
    Left = 178
    Top = 37
    Width = 175
    Height = 23
    TabOrder = 5
    OnSelect = Estado_ComboBoxSelect
    Items.Strings = (
      'APROBADO'
      'RECHAZADO')
  end
  object Button1: TButton
    Left = 8
    Top = 329
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Guardar'
    TabOrder = 6
    OnClick = Button1Click
    ExplicitTop = 349
  end
  object Button2: TButton
    Left = 89
    Top = 329
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Cerrar'
    TabOrder = 7
    OnClick = Button2Click
    ExplicitTop = 349
  end
end
