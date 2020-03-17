unit FExpedientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TExpedientes_Form = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button3: TButton;
    Label2: TLabel;
    Com_ComboBox: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    MasOpciones1: TMenuItem;
    AdjuntarExpedientes1: TMenuItem;
    DeshacerConjuntoDeExp1: TMenuItem;
    Button4: TButton;
    BuscarExpedientes1: TMenuItem;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure ExpedientePorComision(ComisionA, Estado : Integer);
    procedure ExpedientePendiente(Estado, Comision : Integer);
    procedure Button3Click(Sender: TObject);
    procedure AdjuntarExpedientes1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DeshacerConjuntoDeExp1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Com_ComboBoxClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BuscarExpedientes1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ComisionActual : Integer;
    ID_Expediente : Integer;
  end;

var
  Expedientes_Form: TExpedientes_Form;

implementation

{$R *.dfm}

uses MDatos, FAdjuntar_Exp, FBaja_Adj_Exp, FExpedente_Pendiente, FDetalle_Exp,
  FMovimiento, FBusExp, FHistorialMovExp, FResolucion;

procedure TExpedientes_Form.AdjuntarExpedientes1Click(Sender: TObject);
begin
 if ID_Expediente <> 0 then
 begin
    with ModuloDatos.UniQueryValidarExp_Adj do
    begin
      SQL.Clear;
      SQL.Add('SELECT id_exp, num_exp FROM expediente WHERE id_exp IN (SELECT id_cabecera FROM adjunto WHERE id_cabecera = :E)');
      ParamByName('E').AsInteger := ID_Expediente;
      Open;
    end;
    if ModuloDatos.UniQueryValidarExp_Adj.RecordCount <> 0 then
    begin
      ShowMessage('El Expediente Seleccionado Ya Es Cabecera. Elija Otro Expediente De La Grilla.');
    end
    else
    begin
      with ModuloDatos.UniQueryValidarExp_Adj do
      begin
        SQL.Clear;
        SQL.Add('SELECT id_exp, num_exp FROM expediente WHERE id_exp IN (SELECT id_adjunto FROM adjunto WHERE id_adjunto = :EX)');
        ParamByName('EX').AsInteger := ID_Expediente;
        Open;
      end;
      if ModuloDatos.UniQueryValidarExp_Adj.RecordCount <> 0 then
      begin
        ShowMessage('El Expediente Seleccionado Ya Esta Adjunto. Elija Otro Expediente De La Grilla.');
      end
      else
      begin
        Adj_Exp_Form := TAdj_Exp_Form.Create(Self);

        with ModuloDatos.UniQuerySelect1ExpedientesDisponibles do
        begin
          SQL.Clear;
          SQL.Add('SELECT num_exp, fecha_ini_exp, referencia_exp, observaciones_exp, tipo_exp, codigo_org, nombre_org ');
          SQL.Add('FROM expediente INNER JOIN tipo_expediente INNER JOIN organismos ');
          SQL.Add('WHERE expediente.id_tipo_exp = tipo_expediente.id_tipo_exp AND expediente.id_org = organismos.id_org ');
          SQL.Add('AND expediente.id_exp like :ID');
          ParamByName('ID').AsInteger := ID_Expediente;
          Open;

          Adj_Exp_Form.Num_Exp_Edit.Text := IntToStr(Fields.FieldByName('num_exp').AsInteger);
          Adj_Exp_Form.Fecha_Exp_Edit.Text := DateTimeToStr(Fields.FieldByName('fecha_ini_exp').AsDateTime);
          Adj_Exp_Form.Ref_Memo.Lines.Text := Fields.FieldByName('referencia_exp').AsString;
          Adj_Exp_Form.Obs_Memo.Lines.Text := Fields.FieldByName('observaciones_exp').AsString;
          Adj_Exp_Form.T_Exp_Edit.Text := Fields.FieldByName('tipo_exp').AsString;
          Adj_Exp_Form.Cod_Edit.Text := IntToStr(Fields.FieldByName('codigo_org').AsInteger);
          Adj_Exp_Form.Organismo_Edit.Text := Fields.FieldByName('nombre_org').AsString;
        end;

        Adj_Exp_Form.ShowModal;
      end;
    end;
 end
 else
 begin
   ShowMessage('Seleccione Algun Expediente De La Grilla.');
 end;
end;

procedure TExpedientes_Form.BuscarExpedientes1Click(Sender: TObject);
begin
  Historial_Mov_Form := THistorial_Mov_Form.Create(Self);
  Historial_Mov_Form.Panel1.Caption := 'Busqueda De Expedientes';
  Historial_Mov_Form.ShowModal;
end;

procedure TExpedientes_Form.Button1Click(Sender: TObject);
begin
  Mov_Form := TMov_Form.Create(Self);

  case ComisionActual of
  1:
    begin
      Mov_Form.ComboBox1.ItemIndex := 0;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  2:
    begin
      Mov_Form.ComboBox1.ItemIndex := 1;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  3:
    begin
      Mov_Form.ComboBox1.ItemIndex := 2;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  4:
    begin
      Mov_Form.ComboBox1.ItemIndex := 3;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  5:
    begin
      Mov_Form.ComboBox1.ItemIndex := 4;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  6:
    begin
      Mov_Form.ComboBox1.ItemIndex := 5;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  7:
    begin
      Mov_Form.ComboBox1.ItemIndex := 6;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  8:
    begin
      Mov_Form.ComboBox1.ItemIndex := 7;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  9:
    begin
      Mov_Form.ComboBox1.ItemIndex := 8;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  10:
    begin
      Mov_Form.ComboBox1.ItemIndex := 9;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  11:
    begin
      Mov_Form.ComboBox1.ItemIndex := 10;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  12:
    begin
      Mov_Form.ComboBox1.ItemIndex := 11;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  13:
    begin
      Mov_Form.ComboBox1.ItemIndex := 12;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  15:
    begin
      Mov_Form.ComboBox1.ItemIndex := 13;
      Mov_Form.ComboBox1.OnClick(Sender);
      Mov_Form.ComboBox1.Enabled := False;
    end;
  end;

  Mov_Form.ShowModal;
end;

procedure TExpedientes_Form.Button2Click(Sender: TObject);
begin
  if ID_Expediente <> 0 then
  begin
    with ModuloDatos.UniQueryResolucion do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM expediente WHERE id_exp = :ID');
      ParamByName('ID').AsInteger := ID_Expediente;
      Open;

      Resolucion_Form := TResolucion_Form.Create(Self);
      Resolucion_Form.Num_Exp_Edit.Text := IntToStr(Fields.FieldByName('num_exp').AsInteger);
      Resolucion_Form.Fecha_Edit.Text := DateTimeToStr(Fields.FieldByName('fecha_ini_exp').AsDateTime);
      Resolucion_Form.Folios_Edit.Text := IntToStr(Fields.FieldByName('cantidad_folios').AsInteger);
      Resolucion_Form.Ref_Memo.Lines.Text := Fields.FieldByName('referencia_exp').AsString;
      Resolucion_Form.Obs_Memo.Lines.Text := Fields.FieldByName('observaciones_exp').AsString;
    end;

    Resolucion_Form.ShowModal;

  end
  else
  begin
    ShowMessage('Eligir Un Expediente De La Grilla');
  end;
end;

procedure TExpedientes_Form.Button3Click(Sender: TObject);
begin
  Expedientes_Form.Close;
end;

procedure TExpedientes_Form.Button4Click(Sender: TObject);
begin
  Exp_Pen_Form := TExp_Pen_Form.Create(Self);
  case ComisionActual of
  1:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 0;
    end;
  2:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 1;
    end;
  3:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 2;
    end;
  4:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 3;
    end;
  5:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 4;
    end;
  6:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 5;
    end;
  7:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 6;
    end;
  8:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 7;
    end;
  9:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 8;
    end;
  10:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 9;
    end;
  11:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 10;
    end;
  12:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 11;
    end;
  13:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 12;
    end;
  14:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 13;
    end;
  15:
    begin
      Exp_Pen_Form.ComboBox1.ItemIndex := 14;
    end;
  end;
  Exp_Pen_Form.ShowModal;
end;

procedure TExpedientes_Form.Com_ComboBoxClick(Sender: TObject);
begin
  case Com_ComboBox.ItemIndex of
  0:
    begin
      ComisionActual := 1;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  1:
    begin
      ComisionActual := 2;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  2:
    begin
      ComisionActual := 3;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  3:
    begin
      ComisionActual := 4;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  4:
    begin
      ComisionActual := 5;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  5:
    begin
      ComisionActual := 6;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  6:
    begin
      ComisionActual := 7;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  7:
    begin
      ComisionActual := 8;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  8:
    begin
      ComisionActual := 9;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  9:
    begin
      ComisionActual := 10;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  10:
    begin
      ComisionActual := 11;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  11:
    begin
      ComisionActual := 12;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  12:
    begin
      ComisionActual := 13;
      ExpedientePorComision(ComisionActual,1);
      ExpedientePendiente(0,ComisionActual);
    end;
  13:
    begin
      ComisionActual := 14;
      ExpedientePorComision(ComisionActual,1);
      //Caso de excepcion para evitar repeticion de vistas en interfaces.<
      with ModuloDatos.UniQueryExp_Pendientes do
      begin
        SQL.Clear;
        SQL.Add('SELECT m1.id_exp, e.num_exp, e.fecha_ini_exp, m1.fecha_movimiento, e.referencia_exp, e.observaciones_exp, ti.tipo_exp, ee.estado_exp, o.codigo_org, o.nombre_org, e.cantidad_folios ');
        SQL.Add('FROM movimiento AS m1 ');
        SQL.Add('INNER JOIN expediente AS e ');
        SQL.Add('ON m1.id_exp = e.id_exp ');
        SQL.Add('INNER JOIN tipo_expediente AS ti ');
        SQL.Add('ON e.id_tipo_exp = ti.id_tipo_exp ');
        SQL.Add('INNER JOIN estado_exp AS ee ');
        SQL.Add('ON e.id_estado_exp = ee.id_estado_exp ');
        SQL.Add('INNER JOIN organismos AS o ');
        SQL.Add('ON e.id_org = o.id_org ');
        SQL.Add('WHERE e.estado_pen_acp = :ETD ');
        SQL.Add('AND e.id_estado_exp = 4');
        SQL.Add('AND m1.id_comision_actual = :COM_A ');
        SQL.Add('AND m1.fecha_movimiento = (SELECT max(fecha_movimiento) FROM movimiento AS m2 WHERE m1.id_exp = m2.id_exp) ');
        SQL.Add('ORDER BY e.id_exp');
        ParamByName('ETD').AsInteger := 0;
        ParamByName('COM_A').AsInteger := ComisionActual;
        Open;
        Active := True;
      end;
    end;
  end;
end;

procedure TExpedientes_Form.DBGrid1CellClick(Column: TColumn);
begin
  ID_Expediente := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_exp').AsInteger;
end;

procedure TExpedientes_Form.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  I : Integer;
begin
  with ModuloDatos.UniQuerySelect1IniXExp do
  begin
    SQL.Clear;
    SQL.Add('SELECT id_exp, num_exp, referencia_exp, tipo_exp, id_cabecera FROM expediente INNER JOIN adjunto ');
    SQL.Add('INNER JOIN tipo_expediente WHERE expediente.id_exp = adjunto.id_cabecera ');
    SQL.Add('AND expediente.id_tipo_exp = tipo_expediente.id_tipo_exp GROUP BY adjunto.id_cabecera');
    Open;
  end;

  for I := 1 to ModuloDatos.UniQuerySelect1IniXExp.RecordCount do
  begin
    if (ModuloDatos.UniQueryExpedientesDisponibles.Fields.FieldByName('id_exp').AsInteger =
    ModuloDatos.UniQuerySelect1IniXExp.Fields.FieldByName('id_exp').AsInteger)
    then
    begin
      DBGrid1.Canvas.Brush.Color := clNavy;
    end;
    ModuloDatos.UniQuerySelect1IniXExp.Next;
  end;

    with ModuloDatos.UniQuerySelect1IniXExp do
  begin
    SQL.Clear;
    SQL.Add('SELECT id_exp, num_exp, referencia_exp, tipo_exp, id_cabecera FROM expediente INNER JOIN adjunto ');
    SQL.Add('INNER JOIN tipo_expediente WHERE expediente.id_exp = adjunto.id_adjunto ');
    SQL.Add('AND expediente.id_tipo_exp = tipo_expediente.id_tipo_exp');
    Open;
  end;

  for I := 1 to ModuloDatos.UniQuerySelect1IniXExp.RecordCount do
  begin
    if (ModuloDatos.UniQueryExpedientesDisponibles.Fields.FieldByName('id_exp').AsInteger =
    ModuloDatos.UniQuerySelect1IniXExp.Fields.FieldByName('id_exp').AsInteger)
    then
    begin
      DBGrid1.Canvas.Brush.Color := clGreen;
    end;
    ModuloDatos.UniQuerySelect1IniXExp.Next;
  end;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TExpedientes_Form.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ID_Expediente := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_exp').AsInteger;
end;

procedure TExpedientes_Form.DeshacerConjuntoDeExp1Click(Sender: TObject);
begin
  Del_Adj_Exp_Form := TDel_Adj_Exp_Form.Create(Self);
  Del_Adj_Exp_Form.ShowModal;
end;

procedure TExpedientes_Form.ExpedientePendiente(Estado, Comision: Integer);
begin
  with ModuloDatos.UniQueryExp_Pendientes do
  begin
    SQL.Clear;
    SQL.Add('SELECT m1.id_exp, e.num_exp, e.fecha_ini_exp, m1.fecha_movimiento, e.referencia_exp, e.observaciones_exp, ti.tipo_exp, ee.estado_exp, o.codigo_org, o.nombre_org, e.cantidad_folios ');
    SQL.Add('FROM movimiento AS m1 ');
    SQL.Add('INNER JOIN expediente AS e ');
    SQL.Add('ON m1.id_exp = e.id_exp ');
    SQL.Add('INNER JOIN tipo_expediente AS ti ');
    SQL.Add('ON e.id_tipo_exp = ti.id_tipo_exp ');
    SQL.Add('INNER JOIN estado_exp AS ee ');
    SQL.Add('ON e.id_estado_exp = ee.id_estado_exp ');
    SQL.Add('INNER JOIN organismos AS o ');
    SQL.Add('ON e.id_org = o.id_org ');
    SQL.Add('WHERE e.estado_pen_acp = :ETD ');
    SQL.Add('AND m1.id_comision_actual = :COM_A ');
    SQL.Add('AND m1.fecha_movimiento = (SELECT max(fecha_movimiento) FROM movimiento AS m2 WHERE m1.id_exp = m2.id_exp) ');
    SQL.Add('ORDER BY e.id_exp');
    ParamByName('ETD').AsInteger := Estado;
    ParamByName('COM_A').AsInteger := Comision;
    Open;
    Active := True;
  end;
end;

procedure TExpedientes_Form.ExpedientePorComision(ComisionA, Estado: Integer);
begin
  with ModuloDatos.UniQueryExpedientesDisponibles do
  begin
    SQL.Clear;
    SQL.Add('SELECT m1.id_exp, e.num_exp, e.fecha_ini_exp, m1.fecha_movimiento, e.referencia_exp, e.observaciones_exp, ti.tipo_exp, ee.estado_exp, o.codigo_org, o.nombre_org, e.cantidad_folios ');
    SQL.Add('FROM movimiento AS m1 ');
    SQL.Add('INNER JOIN expediente AS e ');
    SQL.Add('ON m1.id_exp = e.id_exp ');
    SQL.Add('INNER JOIN tipo_expediente AS ti ');
    SQL.Add('ON e.id_tipo_exp = ti.id_tipo_exp ');
    SQL.Add('INNER JOIN estado_exp AS ee ');
    SQL.Add('ON e.id_estado_exp = ee.id_estado_exp ');
    SQL.Add('INNER JOIN organismos AS o ');
    SQL.Add('ON e.id_org = o.id_org ');
    SQL.Add('WHERE e.estado_pen_acp = :ETD ');
    SQL.Add('AND m1.id_comision_actual = :COM_A ');
    SQL.Add('AND m1.fecha_movimiento = (SELECT max(fecha_movimiento) FROM movimiento AS m2 WHERE m1.id_exp = m2.id_exp) ');
    SQL.Add('ORDER BY e.id_exp');
    ParamByName('ETD').AsInteger := Estado;
    ParamByName('COM_A').AsInteger := ComisionA;
    Open;
    Active := True;
  end;

  Label4.Caption := IntToStr (ModuloDatos.UniQueryExpedientesDisponibles.RecordCount);

end;

procedure TExpedientes_Form.FormActivate(Sender: TObject);
begin
ID_Expediente := 0;
end;

end.
