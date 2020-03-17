object Expedientes_Form: TExpedientes_Form
  Left = 0
  Top = 0
  Caption = 'Expedientes Disponibles'
  ClientHeight = 512
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 897
    Height = 46
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 52
      Height = 15
      Caption = 'Comisi'#243'n'
    end
    object Label3: TLabel
      Left = 640
      Top = 16
      Width = 139
      Height = 15
      Caption = 'Cantidad De Expedientes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 795
      Top = 9
      Width = 6
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Com_ComboBox: TComboBox
      Left = 74
      Top = 13
      Width = 551
      Height = 23
      Style = csDropDownList
      CharCase = ecUpperCase
      TabOrder = 0
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
        'COMERCIO INTERNACIONAL'
        'MESA DE ENTRADA'
        'ADMINISTRADOR(INFORMATICA)')
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 448
    Width = 897
    Height = 61
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 2
    DesignSize = (
      897
      61)
    object Button1: TButton
      Left = 8
      Top = 24
      Width = 121
      Height = 25
      Caption = '&Mover Expedientes'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 357
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 135
      Top = 24
      Width = 121
      Height = 25
      Caption = '&Ver Exp Pendientes'
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button2: TButton
      Left = 262
      Top = 24
      Width = 89
      Height = 25
      Caption = '&Resoluci'#243'n'
      TabOrder = 3
      OnClick = Button2Click
    end
    object GroupBox3: TGroupBox
      Left = 552
      Top = 11
      Width = 334
      Height = 42
      Anchors = [akRight]
      Caption = 'Referencias'
      TabOrder = 4
      object Label1: TLabel
        Left = 19
        Top = 16
        Width = 15
        Height = 15
        AutoSize = False
        Color = clNavy
        ParentColor = False
        Transparent = False
      end
      object Label5: TLabel
        Left = 40
        Top = 16
        Width = 118
        Height = 15
        Caption = 'Expediente Cabecera'
      end
      object Label6: TLabel
        Left = 192
        Top = 16
        Width = 15
        Height = 15
        AutoSize = False
        Color = clGreen
        ParentColor = False
        Transparent = False
      end
      object Label7: TLabel
        Left = 213
        Top = 16
        Width = 106
        Height = 15
        Caption = 'Expediente Adjunto'
      end
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 55
    Width = 897
    Height = 387
    Align = alClient
    DataSource = ModuloDatos.UniDataSourceExpedientesDisponibles
    DefaultDrawing = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Microsoft Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
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
        FieldName = 'fecha_movimiento'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Movimiento'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'referencia_exp'
        Title.Alignment = taCenter
        Title.Caption = 'Referencia'
        Width = 149
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tipo_exp'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo De Exp'
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
  object MainMenu1: TMainMenu
    Left = 448
    Top = 264
    object MasOpciones1: TMenuItem
      Caption = 'M'#225's &Opciones'
      object BuscarExpedientes1: TMenuItem
        Caption = '&Buscar Expedientes'
        OnClick = BuscarExpedientes1Click
      end
      object AdjuntarExpedientes1: TMenuItem
        Caption = '&Adjuntar Expedientes'
        OnClick = AdjuntarExpedientes1Click
      end
      object DeshacerConjuntoDeExp1: TMenuItem
        Caption = '&Deshacer Conjunto De Exp'
        OnClick = DeshacerConjuntoDeExp1Click
      end
    end
  end
end
