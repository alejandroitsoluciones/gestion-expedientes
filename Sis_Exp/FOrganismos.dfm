object Org_Form: TOrg_Form
  Left = 0
  Top = 0
  Caption = 'Organismos'
  ClientHeight = 463
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 696
    Height = 78
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 128
      Height = 15
      Caption = 'Nombre De Organismo'
    end
    object Nombre_Org_Edit: TEdit
      Left = 150
      Top = 29
      Width = 187
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = Nombre_Org_EditChange
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 402
    Width = 696
    Height = 58
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Elegir'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 96
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 87
    Width = 696
    Height = 309
    Align = alClient
    DataSource = ModuloDatos.UniDataSourceOrganismos
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
        Title.Caption = 'Codigo'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_org'
        Title.Alignment = taCenter
        Title.Caption = 'Nombre De Organismo'
        Width = 500
        Visible = True
      end>
  end
end
