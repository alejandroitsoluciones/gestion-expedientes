object Exp_Nuevo_Form: TExp_Nuevo_Form
  Left = 0
  Top = 0
  Caption = 'Expedientes Nuevos'
  ClientHeight = 530
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  KeyPreview = True
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
    Width = 764
    Height = 455
    Align = alClient
    Caption = 'Expedientes'
    TabOrder = 0
    ExplicitWidth = 761
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 103
      Width = 754
      Height = 347
      Align = alClient
      DataSource = ModuloDatos.UniDataSourceExpedientesNuevos
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
          Width = 146
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'observaciones_exp'
          Title.Alignment = taCenter
          Title.Caption = 'Observaciones'
          Width = 142
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'tipo_exp'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo De Expediente'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'estado_exp'
          Title.Alignment = taCenter
          Title.Caption = 'Estado'
          Width = 107
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'codigo_org'
          Title.Alignment = taCenter
          Title.Caption = 'Cod'
          Width = 46
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'nombre_org'
          Title.Alignment = taCenter
          Title.Caption = 'Nom. Organismo'
          Width = 339
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
    object GroupBox3: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 754
      Height = 77
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 751
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 129
        Height = 15
        Caption = 'N'#250'mero De Expediente'
      end
      object N_Exp_Edit: TEdit
        Left = 160
        Top = 29
        Width = 150
        Height = 23
        NumbersOnly = True
        TabOrder = 0
        OnChange = N_Exp_EditChange
      end
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 464
    Width = 764
    Height = 63
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 1
    ExplicitWidth = 761
    object Button1: TButton
      Left = 16
      Top = 24
      Width = 121
      Height = 25
      Caption = '&Nuevo Expediente'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 143
      Top = 24
      Width = 130
      Height = 25
      Caption = '&Eliminar Expediente'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 279
      Top = 24
      Width = 114
      Height = 25
      Caption = '&Asignar Comisi'#243'n'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 399
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 376
    Top = 272
    object MasOpciones1: TMenuItem
      Caption = '&M'#225's Opciones'
      object BuscarExpediente1: TMenuItem
        Caption = '&Buscar Expedientes'
        OnClick = BuscarExpediente1Click
      end
    end
  end
end
