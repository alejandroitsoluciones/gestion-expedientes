object Organismos_Form: TOrganismos_Form
  Left = 0
  Top = 0
  Caption = 'Organismos'
  ClientHeight = 491
  ClientWidth = 765
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
    Width = 759
    Height = 70
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 128
      Height = 15
      Caption = 'Nombre De Organismo'
    end
    object N_Org_Edit: TEdit
      Left = 160
      Top = 21
      Width = 150
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = N_Org_EditChange
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 432
    Width = 759
    Height = 56
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 1
    object Button1: TButton
      Left = 10
      Top = 20
      Width = 75
      Height = 25
      Caption = '&Nuevo'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 91
      Top = 20
      Width = 75
      Height = 25
      Caption = '&Modificar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 172
      Top = 20
      Width = 75
      Height = 25
      Caption = '&Eliminar'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 253
      Top = 20
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
    Top = 79
    Width = 759
    Height = 347
    Align = alClient
    DataSource = ModuloDatos.UniDataSourceABMOrganismos
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
        FieldName = 'id_org'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'codigo_org'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo De Organismo'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_org'
        Title.Alignment = taCenter
        Title.Caption = 'Nombre De Organismo'
        Width = 515
        Visible = True
      end>
  end
end
