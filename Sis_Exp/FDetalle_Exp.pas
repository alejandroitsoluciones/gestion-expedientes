unit FDetalle_Exp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TDetalle_Exp_Form = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    GroupBox1: TGroupBox;
    Button1: TButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure InixExpSelect1 (Exp : Integer);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Expediente_Detalle : Integer;
  end;

var
  Detalle_Exp_Form: TDetalle_Exp_Form;

implementation

{$R *.dfm}

uses MDatos, FNuevo_Exp, FExpedientes;

procedure TDetalle_Exp_Form.Button1Click(Sender: TObject);
begin
  Detalle_Exp_Form.Close;
end;

procedure TDetalle_Exp_Form.DBGrid1CellClick(Column: TColumn);
begin
  Expediente_Detalle := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_exp').AsInteger;
  InixExpSelect1(Expediente_Detalle);
end;

procedure TDetalle_Exp_Form.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Expediente_Detalle := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_exp').AsInteger;
    InixExpSelect1(Expediente_Detalle);
end;

procedure TDetalle_Exp_Form.FormActivate(Sender: TObject);
begin
  with ModuloDatos.UniQueryDetalle_Exp do
  begin
    SQL.Clear;
    SQL.Add('SELECT id_exp, num_exp, fecha_ini_exp, referencia_exp, observaciones_exp, tipo_exp, estado_exp, codigo_org, nombre_org, cantidad_folios ');
    SQL.Add('FROM expediente INNER JOIN tipo_expediente INNER JOIN estado_exp INNER JOIN organismos WHERE expediente.id_tipo_exp = tipo_expediente.id_tipo_exp ');
    SQL.Add('AND expediente.id_estado_exp = estado_exp.id_estado_exp AND expediente.id_org = organismos.id_org AND estado_pen_acp = 0 ORDER BY expediente.id_exp');
    Open;
    Active := True;
  end;
end;

procedure TDetalle_Exp_Form.InixExpSelect1(Exp: Integer);
begin
  with ModuloDatos.UniQueryDetalle_Exp_Ini do
  begin
    SQL.Clear;
    SQL.Add('SELECT num_exp, nombre_ini, apellido_ini, direccion_ini, barrio_ini, tipo_ini, adjunto ');
    SQL.Add('FROM expediente INNER JOIN iniciador INNER JOIN tipo_iniciador INNER JOIN adjunto_ini INNER JOIN ini_x_exp ');
    SQL.Add('WHERE expediente.id_exp = ini_x_exp.id_exp AND iniciador.id_tipo_ini = tipo_iniciador.id_tipo_ini AND iniciador.id_ini = ini_x_exp.id_ini AND adjunto_ini.id_adjunto = ini_x_exp.id_adjunto AND expediente.id_exp = :PARAMETRO');
    ParamByName('PARAMETRO').AsInteger := Exp;
    Open;
    Active := True;
  end;
end;

end.
