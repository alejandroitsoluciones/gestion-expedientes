object Ini_Form: TIni_Form
  Left = 0
  Top = 0
  Caption = 'Iniciadores'
  ClientHeight = 477
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
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
    Width = 697
    Height = 62
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 27
      Width = 38
      Height = 15
      Caption = 'Buscar'
    end
    object Buscar_I_Edit: TEdit
      Left = 72
      Top = 24
      Width = 121
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = Buscar_I_EditChange
    end
    object RadioGroup1: TRadioGroup
      AlignWithMargins = True
      Left = 205
      Top = 0
      Width = 487
      Height = 57
      Caption = 'Tipo De Busqueda'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'NOMBRE'
        'APELLIDO'
        'BARRIO')
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 408
    Width = 697
    Height = 66
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 24
      Width = 102
      Height = 25
      Caption = '&Nuevo Iniciador'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 243
      Top = 24
      Width = 101
      Height = 25
      Caption = '&Elegir Iniciador'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 124
      Top = 24
      Width = 113
      Height = 25
      Caption = '&Modificar Iniciador'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 697
    Height = 331
    Align = alClient
    DataSource = ModuloDatos.UniDataSourceIniciador
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
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
        FieldName = 'nombre_ini'
        Title.Alignment = taCenter
        Title.Caption = 'Nombre'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'apellido_ini'
        Title.Alignment = taCenter
        Title.Caption = 'Apellido'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dni_ini'
        Title.Alignment = taCenter
        Title.Caption = 'DNI'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'direccion_ini'
        Title.Alignment = taCenter
        Title.Caption = 'Direccion'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'barrio_ini'
        Title.Alignment = taCenter
        Title.Caption = 'Barrio'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tipo_ini'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Iniciador'
        Visible = True
      end>
  end
end
