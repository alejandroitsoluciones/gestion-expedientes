object Bus_Exp_Form: TBus_Exp_Form
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Busqueda De Expedientes'
  ClientHeight = 572
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 788
    Height = 54
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 17
      Width = 69
      Height = 15
      Caption = 'N'#250'mero Exp'
    end
    object SpeedButton1: TSpeedButton
      Left = 430
      Top = 14
      Width = 75
      Height = 23
      Caption = '&B'#250'squeda'
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 247
      Top = 17
      Width = 21
      Height = 15
      Caption = 'A'#241'o'
    end
    object Num_Edit: TEdit
      Left = 91
      Top = 14
      Width = 150
      Height = 23
      NumbersOnly = True
      TabOrder = 0
    end
    object Ano_Edit: TEdit
      Left = 274
      Top = 14
      Width = 150
      Height = 23
      NumbersOnly = True
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 386
    Width = 788
    Height = 130
    Align = alBottom
    Caption = 'Datos Expediente'
    TabOrder = 1
    object Label3: TLabel
      Left = 271
      Top = 24
      Width = 80
      Height = 15
      Caption = 'Fecha Iniciado'
    end
    object Label4: TLabel
      Left = 39
      Top = 64
      Width = 60
      Height = 15
      Caption = 'Referencia'
    end
    object Label5: TLabel
      Left = 513
      Top = 24
      Width = 104
      Height = 15
      Caption = 'Cantidad De Folios'
    end
    object Label6: TLabel
      Left = 398
      Top = 64
      Width = 81
      Height = 15
      Caption = 'Observaciones'
    end
    object Label7: TLabel
      Left = 16
      Top = 24
      Width = 129
      Height = 15
      Caption = 'Numero De Expediente'
    end
    object Fecha_Ini_Exp_DBEdit: TDBEdit
      Left = 367
      Top = 21
      Width = 100
      Height = 23
      DataField = 'fecha_ini_exp'
      DataSource = ModuloDatos.UniDataSourceBusExp
      Enabled = False
      TabOrder = 0
    end
    object Folios_DBEdit: TDBEdit
      Left = 633
      Top = 21
      Width = 100
      Height = 23
      DataField = 'cantidad_folios'
      DataSource = ModuloDatos.UniDataSourceBusExp
      Enabled = False
      TabOrder = 1
    end
    object Referencia_DBMemo: TDBMemo
      Left = 151
      Top = 64
      Width = 200
      Height = 55
      DataField = 'referencia_exp'
      DataSource = ModuloDatos.UniDataSourceBusExp
      Enabled = False
      TabOrder = 2
    end
    object Observaciones_DBMemo: TDBMemo
      Left = 535
      Top = 64
      Width = 200
      Height = 55
      DataField = 'observaciones_exp'
      DataSource = ModuloDatos.UniDataSourceBusExp
      Enabled = False
      TabOrder = 3
    end
    object Num_Exp_DBEdit: TDBEdit
      Left = 161
      Top = 21
      Width = 81
      Height = 23
      DataField = 'num_exp'
      DataSource = ModuloDatos.UniDataSourceBusExp
      Enabled = False
      TabOrder = 4
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 788
    Height = 317
    Align = alClient
    DataSource = ModuloDatos.UniDataSourceBusExp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Microsoft Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_comision'
        Title.Alignment = taCenter
        Title.Caption = 'Comisi'#243'n'
        Width = 528
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fecha_movimiento_1'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha De Movimiento'
        Visible = True
      end>
  end
  object GroupBox3: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 522
    Width = 788
    Height = 47
    Align = alBottom
    TabOrder = 3
    object Button1: TButton
      Left = 10
      Top = 11
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
