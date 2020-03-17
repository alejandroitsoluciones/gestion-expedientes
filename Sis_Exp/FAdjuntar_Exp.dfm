object Adj_Exp_Form: TAdj_Exp_Form
  Left = 0
  Top = 0
  Caption = 'Adjuntar Expedientes'
  ClientHeight = 549
  ClientWidth = 1026
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
    Width = 1020
    Height = 190
    Align = alTop
    Caption = 'Expediente Cabecera'
    TabOrder = 4
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 129
      Height = 15
      Caption = 'N'#250'mero De Expediente'
    end
    object Label2: TLabel
      Left = 278
      Top = 32
      Width = 80
      Height = 15
      Caption = 'Fecha Iniciado'
    end
    object Label3: TLabel
      Left = 16
      Top = 59
      Width = 60
      Height = 15
      Caption = 'Referencia'
    end
    object Label4: TLabel
      Left = 463
      Top = 58
      Width = 81
      Height = 15
      Caption = 'Observaciones'
    end
    object Label5: TLabel
      Left = 504
      Top = 32
      Width = 108
      Height = 15
      Caption = 'Tipo De Expediente'
    end
    object Label6: TLabel
      Left = 745
      Top = 32
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object Label7: TLabel
      Left = 16
      Top = 133
      Width = 61
      Height = 15
      Caption = 'Organismo'
    end
    object Num_Exp_Edit: TEdit
      Left = 151
      Top = 29
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 0
    end
    object Fecha_Exp_Edit: TEdit
      Left = 364
      Top = 29
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object T_Exp_Edit: TEdit
      Left = 618
      Top = 29
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 2
    end
    object Cod_Edit: TEdit
      Left = 790
      Top = 29
      Width = 60
      Height = 23
      Enabled = False
      TabOrder = 3
    end
    object Ref_Memo: TMemo
      Left = 16
      Top = 80
      Width = 441
      Height = 47
      Enabled = False
      TabOrder = 4
    end
    object Obs_Memo: TMemo
      Left = 463
      Top = 80
      Width = 388
      Height = 47
      Enabled = False
      Lines.Strings = (
        '')
      TabOrder = 5
    end
    object Organismo_Edit: TEdit
      Left = 16
      Top = 154
      Width = 834
      Height = 23
      Enabled = False
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 488
    Width = 1020
    Height = 58
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 3
    object Button1: TButton
      Left = 90
      Top = 21
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button4: TButton
      Left = 9
      Top = 21
      Width = 75
      Height = 25
      Caption = '&Guardar'
      TabOrder = 0
      OnClick = Button4Click
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 196
    Width = 466
    Height = 289
    Align = alLeft
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      49
      114
      109
      110
      69)
  end
  object StringGrid2: TStringGrid
    Left = 543
    Top = 196
    Width = 483
    Height = 289
    Align = alRight
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 2
    OnSelectCell = StringGrid2SelectCell
    ColWidths = (
      55
      121
      113
      116
      66)
  end
  object Panel1: TPanel
    Left = 466
    Top = 196
    Width = 77
    Height = 289
    Align = alClient
    TabOrder = 1
    DesignSize = (
      77
      289)
    object Button2: TButton
      Left = 13
      Top = 86
      Width = 50
      Height = 50
      Anchors = []
      Caption = '>'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 13
      Top = 162
      Width = 50
      Height = 50
      Anchors = []
      Caption = '<'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
end
