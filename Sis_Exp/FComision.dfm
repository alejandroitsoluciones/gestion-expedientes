object Comisiones_Form: TComisiones_Form
  Left = 0
  Top = 0
  Caption = 'Comisiones'
  ClientHeight = 526
  ClientWidth = 776
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
    Width = 770
    Height = 46
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 15
      Width = 119
      Height = 15
      Caption = 'Nombre De Comisi'#243'n'
    end
    object Bus_Com_Edit: TEdit
      Left = 149
      Top = 12
      Width = 150
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = Bus_Com_EditChange
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 459
    Width = 770
    Height = 64
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Nueva'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 96
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Modificar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 176
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Eliminar'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 257
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 55
    Width = 770
    Height = 398
    Align = alClient
    DataSource = ModuloDatos.UniDataSourceComisiones
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
        Expanded = False
        FieldName = 'nombre_comision'
        Title.Alignment = taCenter
        Title.Caption = 'Nombre De Comisi'#243'n'
        Width = 516
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_encargado_comision'
        Title.Alignment = taCenter
        Title.Caption = 'Nombre Encargado'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'apellido_encargado_comision'
        Title.Alignment = taCenter
        Title.Caption = 'Apellido Encargado'
        Width = 64
        Visible = True
      end>
  end
end
