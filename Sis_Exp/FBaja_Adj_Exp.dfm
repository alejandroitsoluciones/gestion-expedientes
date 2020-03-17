object Del_Adj_Exp_Form: TDel_Adj_Exp_Form
  Left = 0
  Top = 0
  Caption = 'Deshacer Grupos De Expedientes'
  ClientHeight = 612
  ClientWidth = 752
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
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 42
    Width = 746
    Height = 279
    Align = alTop
    DataSource = ModuloDatos.UniDataSourceSelect1Adj
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
        Title.Caption = 'Numero De Expediente'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'referencia_exp'
        Title.Alignment = taCenter
        Title.Caption = 'Referencia'
        Width = 251
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tipo_exp'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo De Expediente'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 550
    Width = 746
    Height = 59
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Deshacer'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 96
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 746
    Height = 33
    Align = alTop
    Caption = 'Expedientes Cabeceras'
    TabOrder = 2
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 327
    Width = 746
    Height = 32
    Align = alTop
    Caption = 'Expedientes Adjuntados'
    TabOrder = 3
  end
  object DBGrid2: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 365
    Width = 746
    Height = 179
    Align = alClient
    DataSource = ModuloDatos.UniDataSourceSelect2Adj
    Enabled = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Microsoft Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'num_exp'
        Title.Alignment = taCenter
        Title.Caption = 'Numero De Expediente'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'referencia_exp'
        Title.Alignment = taCenter
        Title.Caption = 'Referencia'
        Width = 327
        Visible = True
      end>
  end
end
