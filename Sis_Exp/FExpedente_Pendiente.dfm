object Exp_Pen_Form: TExp_Pen_Form
  Left = 0
  Top = 0
  Caption = 'Expedientes Pendientes'
  ClientHeight = 521
  ClientWidth = 872
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 866
    Height = 94
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 33
      Width = 52
      Height = 15
      Caption = 'Comisi'#243'n'
    end
    object ComboBox1: TComboBox
      Left = 74
      Top = 30
      Width = 635
      Height = 23
      Style = csDropDownList
      Enabled = False
      TabOrder = 0
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
        'MESA DE ENTRADA'
        'ADMINISTRADOR(INFORMATICA)')
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 448
    Width = 866
    Height = 70
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 32
      Width = 130
      Height = 25
      Caption = '&Aceptar Expediente'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 288
      Top = 32
      Width = 75
      Height = 25
      Caption = '&Volver Atr'#225's'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 144
      Top = 32
      Width = 138
      Height = 25
      Caption = '&Rechazar Expediente'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 103
    Width = 866
    Height = 339
    Align = alClient
    DataSource = ModuloDatos.UniDataSourceExp_Pendientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Microsoft Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'num_exp'
        Title.Alignment = taCenter
        Title.Caption = 'Numero Exp'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fecha_ini_exp'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Iniciado'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'referencia_exp'
        Title.Alignment = taCenter
        Title.Caption = 'Referencia'
        Width = 213
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tipo_exp'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Expediente'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'estado_exp'
        Title.Alignment = taCenter
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'codigo_org'
        Title.Alignment = taCenter
        Title.Caption = 'Cod'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_org'
        Title.Alignment = taCenter
        Title.Caption = 'Organismo'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cantidad_folios'
        Title.Alignment = taCenter
        Title.Caption = 'Cantidad De Folios'
        Visible = True
      end>
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 432
    Top = 264
  end
end
