object Detalle_Exp_Form: TDetalle_Exp_Form
  Left = 0
  Top = 0
  ClientHeight = 615
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 758
    Height = 33
    Align = alTop
    BorderStyle = bsSingle
    Caption = 'Detalles De Expedientes'
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 42
    Width = 758
    Height = 279
    Align = alTop
    DataSource = ModuloDatos.UniDataSourceDetalle_Exp
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
        Width = 293
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
        Width = 102
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
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 327
    Width = 758
    Height = 34
    Align = alTop
    BorderStyle = bsSingle
    Caption = 'Iniciadores De Expediente'
    TabOrder = 3
  end
  object DBGrid2: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 367
    Width = 758
    Height = 176
    Align = alClient
    DataSource = ModuloDatos.UniDataSourceDetalle_Exp_Ini
    Enabled = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
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
        Title.Caption = 'Numero Exp'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'adjunto'
        Title.Alignment = taCenter
        Title.Caption = 'Iniciador'
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
        Title.Caption = 'Direccion'
        Width = 275
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'barrio_ini'
        Title.Alignment = taCenter
        Title.Caption = 'Barrio'
        Width = 182
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
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 549
    Width = 758
    Height = 63
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 4
    object Button1: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
