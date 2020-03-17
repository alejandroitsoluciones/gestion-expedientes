object Historial_Mov_Form: THistorial_Mov_Form
  Left = 0
  Top = 0
  ClientHeight = 542
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 41
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 85
    Width = 766
    Height = 236
    Align = alTop
    DataSource = ModuloDatos.UniDataSourceHistMovExp
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
        FieldName = 'fecha_movimiento'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha De Movimiento De Expediente'
        Width = 240
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_comision'
        Title.Alignment = taCenter
        Title.Caption = 'Historial De Comisiones '
        Width = 486
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 475
    Width = 766
    Height = 64
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 3
    object Button1: TButton
      Left = 11
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 92
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 772
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 13
      Width = 135
      Height = 15
      Caption = 'N'#250'mero De Expedientes'
    end
    object Num_Exp_Edit: TEdit
      Left = 155
      Top = 10
      Width = 150
      Height = 23
      NumbersOnly = True
      TabOrder = 0
      OnChange = Num_Exp_EditChange
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 324
    Width = 772
    Height = 41
    Align = alTop
    BorderStyle = bsSingle
    Caption = 'Datos De Iniciadores'
    TabOrder = 4
  end
  object DBGrid2: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 368
    Width = 766
    Height = 101
    Align = alClient
    DataSource = ModuloDatos.UniDataSourceDetalle_Exp_Ini
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
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
        Title.Caption = 'N'#250'mero Exp'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'adjunto'
        Title.Alignment = taCenter
        Title.Caption = 'Adjunto'
        Visible = True
      end
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
        FieldName = 'direccion_ini'
        Title.Alignment = taCenter
        Title.Caption = 'Direcci'#243'n'
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
