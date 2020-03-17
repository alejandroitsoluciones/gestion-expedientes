unit FNuevo_Exp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Menus;

type
  TExp_Nuevo_Form = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    N_Exp_Edit: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    MainMenu1: TMainMenu;
    MasOpciones1: TMenuItem;
    BuscarExpediente1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N_Exp_EditChange(Sender: TObject);
    procedure DetallesDeExpedientes1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BuscarExpediente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_Exp : Integer;
  end;

var
  Exp_Nuevo_Form: TExp_Nuevo_Form;

implementation

{$R *.dfm}

uses MDatos, FAlta_Exp, FAsig_Com, FDetalle_Exp, FBusExp, FHistorialMovExp,
  FResolucion;

procedure TExp_Nuevo_Form.BuscarExpediente1Click(Sender: TObject);
begin
  Historial_Mov_Form := THistorial_Mov_Form.Create(Self);
  Historial_Mov_Form.Panel1.Caption := 'Busqueda De Expedientes';
  Historial_Mov_Form.ShowModal;
end;

procedure TExp_Nuevo_Form.Button1Click(Sender: TObject);
begin
  N_Expediente_Form := TN_Expediente_Form.Create(Self);
  N_Expediente_Form.ShowModal;
end;

procedure TExp_Nuevo_Form.Button2Click(Sender: TObject);
begin
  if ID_Exp <> 0 then
  begin
    with ModuloDatos.UniQueryDeleteExpedientesNuevos do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM expediente WHERE id_exp = :EXP');
      ParamByName('EXP').AsInteger := ID_Exp;
      ExecSQL;
    end;

    if ModuloDatos.UniQueryDeleteExpedientesNuevos.RowsAffected <> 0 then
    begin
      ShowMessage('Expediente Eliminado.');
      ModuloDatos.UniQueryExpedientesNuevos.Refresh;
    end;
  end
  else
  begin
    ShowMessage('Elija Un Expediente De La Grilla Para Eliminar');
  end;
end;

procedure TExp_Nuevo_Form.Button3Click(Sender: TObject);
begin
  if ID_Exp <> 0 then
  begin
    Asig_Com_Form := TAsig_Com_Form.Create(Self);
    Asig_Com_Form.ShowModal;
  end
  else
  begin
    ShowMessage('Elija Un Expediente De La Grilla Para Asignar A Una Comision');
  end;
end;

procedure TExp_Nuevo_Form.Button4Click(Sender: TObject);
begin
  Exp_Nuevo_Form.Close;
end;

procedure TExp_Nuevo_Form.DBGrid1CellClick(Column: TColumn);
begin
  ID_Exp := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_exp').AsInteger;
end;

procedure TExp_Nuevo_Form.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ID_Exp := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_exp').AsInteger;
end;

procedure TExp_Nuevo_Form.DetallesDeExpedientes1Click(Sender: TObject);
begin
 Detalle_Exp_Form := TDetalle_Exp_Form.Create(Self);
 Detalle_Exp_Form.ShowModal;
end;

procedure TExp_Nuevo_Form.FormActivate(Sender: TObject);
begin
  ID_Exp := 0;

  with ModuloDatos.UniQueryExpedientesNuevos do
  begin
    SQL.Clear;
    SQL.Add('SELECT m.id_exp, num_exp, fecha_ini_exp, m.fecha_movimiento, referencia_exp, observaciones_exp, tipo_exp, estado_exp.estado_exp, codigo_org, nombre_org, cantidad_folios ');
    SQL.Add('FROM movimiento as m INNER JOIN expediente INNER JOIN tipo_expediente INNER JOIN estado_exp INNER JOIN organismos ');
    SQL.Add('WHERE m.id_exp = expediente.id_exp AND expediente.id_tipo_exp = tipo_expediente.id_tipo_exp ');
    SQL.Add('AND expediente.id_estado_exp = estado_exp.id_estado_exp AND expediente.id_org = organismos.id_org AND expediente.estado_pen_acp = :ETD AND m.id_comision_actual = :COM_A ');
    SQL.Add('AND m.fecha_movimiento = (SELECT max(fecha_movimiento) FROM movimiento as m2 WHERE m.id_exp = m2.id_exp) ORDER BY expediente.id_exp');
    ParamByName('ETD').AsInteger := 0;
    ParamByName('COM_A').AsInteger := 14;
    Open;
    Active := True;
  end;
end;

procedure TExp_Nuevo_Form.N_Exp_EditChange(Sender: TObject);
begin
  if N_Exp_Edit.Text = '' then
  begin
    DBGrid1.DataSource := ModuloDatos.UniDataSourceExpedientesNuevos;
  end
  else
  begin
    with ModuloDatos.UniQueryBusNExpedientes do
    begin
      SQL.Clear;
      SQL.Add('SELECT e.id_exp, e.num_exp, e.fecha_ini_exp, e.referencia_exp, e.observaciones_exp, t.tipo_exp, ee.estado_exp, o.codigo_org, o.nombre_org, e.cantidad_folios FROM expediente AS e ');
      SQL.Add('INNER JOIN tipo_expediente AS t ON e.id_tipo_exp = t.id_tipo_exp INNER JOIN estado_exp AS ee ON e.id_estado_exp = ee.id_estado_exp INNER JOIN organismos AS o ON e.id_org = o.id_org ');
      SQL.Add('INNER JOIN movimiento AS m ON e.id_exp = m.id_exp WHERE m.id_comision_anterior = 14 AND m.id_comision_actual = 14 AND m.fecha_movimiento IN (SELECT max(fecha_movimiento) FROM movimiento AS m2 ');
      SQL.Add('WHERE m.id_exp = m2.id_exp) AND e.num_exp LIKE '+ QuotedStr(N_Exp_Edit.Text+'%')+'');
      Open;
    end;
    DBGrid1.DataSource := ModuloDatos.UniDataSourceBusNExpedientes;
  end;
end;

end.
