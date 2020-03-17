object Asig_Com_Form: TAsig_Com_Form
  Left = 0
  Top = 0
  Caption = 'Asignacion De Comision'
  ClientHeight = 437
  ClientWidth = 563
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 557
    Height = 41
    Align = alTop
    Caption = 'Comisiones'
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 557
    Height = 336
    Align = alClient
    DataSource = ModuloDatos.UniDataSourceAsigComision
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
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
        Width = 518
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 392
    Width = 557
    Height = 42
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Asignar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 97
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 272
    Top = 224
  end
end
