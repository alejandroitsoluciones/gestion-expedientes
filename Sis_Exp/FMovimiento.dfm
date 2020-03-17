object Mov_Form: TMov_Form
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Movimiento - Pases De Expedientes'
  ClientHeight = 546
  ClientWidth = 1169
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
  DesignSize = (
    1169
    546)
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 564
    Top = 2
    Width = 40
    Height = 472
    Anchors = [akTop, akBottom]
    BevelEdges = [beTop, beBottom]
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 207
      Width = 23
      Height = 22
      Caption = '>'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 8
      Top = 279
      Width = 23
      Height = 22
      Caption = '<'
      OnClick = SpeedButton2Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 2
    Width = 550
    Height = 84
    Anchors = [akRight]
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 172
      Height = 15
      Caption = 'Comisi'#243'n Actual De Expediente'
    end
    object ComboBox1: TComboBox
      Left = 3
      Top = 40
      Width = 545
      Height = 23
      Style = csDropDownList
      TabOrder = 0
      OnClick = ComboBox1Click
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
        'COMERCIO INTERNACIONAL'
        'ADMINISTRADOR(INFORMATICA)')
    end
  end
  object GroupBox2: TGroupBox
    Left = 610
    Top = 2
    Width = 551
    Height = 84
    Anchors = [akRight]
    TabOrder = 2
    object Label2: TLabel
      Left = 20
      Top = 19
      Width = 102
      Height = 15
      Caption = 'Comisi'#243'n A Mover '
    end
    object ComboBox2: TComboBox
      Left = 3
      Top = 40
      Width = 545
      Height = 23
      Style = csDropDownList
      TabOrder = 0
      OnSelect = ComboBox2Select
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
        'COMERCIO INTERNACIONAL'
        'MESA DE ENTRADA')
    end
  end
  object GroupBox3: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 480
    Width = 1163
    Height = 63
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 3
    object Button1: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Guardar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 97
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 92
    Width = 550
    Height = 382
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 4
    ColWidths = (
      44
      84
      97
      166
      93)
  end
  object StringGrid2: TStringGrid
    Left = 610
    Top = 92
    Width = 551
    Height = 382
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 5
    ColWidths = (
      46
      88
      100
      131
      96
      70)
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 568
    Top = 128
  end
end
