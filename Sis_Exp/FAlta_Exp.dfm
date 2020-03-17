object N_Expediente_Form: TN_Expediente_Form
  Left = 0
  Top = 0
  Caption = 'Agregar Nuevo Expediente'
  ClientHeight = 520
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 769
    Height = 182
    Align = alTop
    Caption = 'Datos De Expediente'
    TabOrder = 0
    ExplicitWidth = 298
    object Label1: TLabel
      Left = 31
      Top = 24
      Width = 129
      Height = 15
      Caption = 'N'#250'mero De Expediente'
    end
    object Label2: TLabel
      Left = 301
      Top = 24
      Width = 85
      Height = 15
      BiDiMode = bdLeftToRight
      Caption = 'Fecha De Inicio'
      ParentBiDiMode = False
    end
    object Label3: TLabel
      Left = 519
      Top = 24
      Width = 104
      Height = 15
      Caption = 'Cantidad De Folios'
    end
    object Label4: TLabel
      Left = 16
      Top = 57
      Width = 67
      Height = 15
      Caption = 'Organismos'
    end
    object Label5: TLabel
      Left = 335
      Top = 57
      Width = 60
      Height = 15
      Caption = 'Referencia'
    end
    object Label6: TLabel
      Left = 557
      Top = 57
      Width = 81
      Height = 15
      Caption = 'Observaciones'
    end
    object Label7: TLabel
      Left = 16
      Top = 123
      Width = 108
      Height = 15
      Caption = 'Tipo De Expediente'
    end
    object SpeedButton3: TSpeedButton
      Left = 301
      Top = 78
      Width = 24
      Height = 23
      Caption = #191'?'
      OnClick = SpeedButton3Click
    end
    object Num_Exp_Edit: TEdit
      Left = 166
      Top = 21
      Width = 129
      Height = 23
      TabOrder = 5
    end
    object Fecha_Ini_Exp_Edit: TEdit
      Left = 392
      Top = 21
      Width = 121
      Height = 23
      TabOrder = 6
    end
    object Cant_Exp_Edit: TEdit
      Left = 629
      Top = 21
      Width = 121
      Height = 23
      NumbersOnly = True
      TabOrder = 0
    end
    object Tipo_Exp_ComboBox: TComboBox
      Left = 20
      Top = 144
      Width = 309
      Height = 23
      Style = csDropDownList
      CharCase = ecUpperCase
      TabOrder = 4
      OnSelect = Tipo_Exp_ComboBoxSelect
      Items.Strings = (
        'ORDENANZA'
        'DECLARACION'
        'RESOLUCION'
        'INFORMES'
        'CONDONACION'
        'PROYECTO'
        'EXPEDIENTE')
    end
    object Ref_Exp_Memo: TMemo
      Left = 335
      Top = 78
      Width = 210
      Height = 89
      CharCase = ecUpperCase
      Lines.Strings = (
        'SIN ESPECIFICAR')
      TabOrder = 2
    end
    object Obs_Exp_Memo: TMemo
      Left = 559
      Top = 78
      Width = 210
      Height = 89
      CharCase = ecUpperCase
      Enabled = False
      Lines.Strings = (
        'SIN ESPECIFICAR')
      TabOrder = 3
    end
    object Num_Org_Edit: TEdit
      Left = 16
      Top = 78
      Width = 59
      Height = 23
      NumbersOnly = True
      TabOrder = 1
      OnChange = Num_Org_EditChange
    end
    object Nom_Org_Edit: TEdit
      Left = 81
      Top = 78
      Width = 214
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 191
    Width = 769
    Height = 106
    Align = alTop
    Caption = 'Datos De Iniciador'
    TabOrder = 1
    ExplicitWidth = 298
    object Label8: TLabel
      Left = 38
      Top = 32
      Width = 45
      Height = 15
      Caption = 'Nombre'
    end
    object Label9: TLabel
      Left = 216
      Top = 32
      Width = 44
      Height = 15
      Caption = 'Apellido'
    end
    object Label10: TLabel
      Left = 393
      Top = 32
      Width = 21
      Height = 15
      Caption = 'DNI'
    end
    object Label11: TLabel
      Left = 547
      Top = 32
      Width = 52
      Height = 15
      Caption = 'Direcci'#243'n'
    end
    object Label12: TLabel
      Left = 22
      Top = 67
      Width = 33
      Height = 15
      Caption = 'Barrio'
    end
    object Label13: TLabel
      Left = 191
      Top = 67
      Width = 93
      Height = 15
      Caption = 'Tipo De Iniciador'
    end
    object Nombre_Ini_Edit: TEdit
      Left = 89
      Top = 29
      Width = 121
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
    end
    object Apellido_Ini_Edit: TEdit
      Left = 266
      Top = 29
      Width = 121
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
    end
    object DNI_Edit: TEdit
      Left = 420
      Top = 29
      Width = 121
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 2
    end
    object Direccion_Ini_Edit: TEdit
      Left = 605
      Top = 29
      Width = 121
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 3
    end
    object Barrio_Ini_Edit: TEdit
      Left = 64
      Top = 64
      Width = 121
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 4
    end
    object Tipo_Ini_Edit: TEdit
      Left = 290
      Top = 64
      Width = 121
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 5
    end
    object Button1: TButton
      Left = 560
      Top = 64
      Width = 75
      Height = 25
      Caption = '&Buscar'
      TabOrder = 6
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 641
      Top = 64
      Width = 104
      Height = 25
      Caption = '&A'#241'adir Iniciador'
      TabOrder = 7
      Visible = False
      OnClick = Button2Click
    end
  end
  object GroupBox3: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 303
    Width = 769
    Height = 145
    Align = alTop
    Caption = 'Concejales'
    TabOrder = 2
    Visible = False
    ExplicitWidth = 298
    object SpeedButton1: TSpeedButton
      Left = 372
      Top = 56
      Width = 23
      Height = 22
      Caption = '>>'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 372
      Top = 84
      Width = 23
      Height = 22
      Caption = '<<'
      OnClick = SpeedButton2Click
    end
    object StringGrid1: TStringGrid
      Left = 2
      Top = 17
      Width = 320
      Height = 126
      Align = alLeft
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      ColWidths = (
        55
        110
        110)
      RowHeights = (
        24
        24)
    end
    object StringGrid2: TStringGrid
      Left = 447
      Top = 17
      Width = 320
      Height = 126
      Align = alRight
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 1
      ExplicitLeft = -24
      ColWidths = (
        54
        109
        116)
      RowHeights = (
        24
        24)
    end
  end
  object GroupBox4: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 454
    Width = 769
    Height = 63
    Align = alTop
    Caption = 'Opciones'
    TabOrder = 3
    ExplicitWidth = 298
    object Button3: TButton
      Left = 8
      Top = 27
      Width = 75
      Height = 25
      Caption = '&Guardar'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 8
      Top = 27
      Width = 75
      Height = 25
      Caption = '&Guardar'
      TabOrder = 1
      Visible = False
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 89
      Top = 27
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 2
      OnClick = Button5Click
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 384
    Top = 264
  end
end
