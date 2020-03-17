unit FBaja_Adj_Exp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TDel_Adj_Exp_Form = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid2: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_EXP : Integer;
  end;

var
  Del_Adj_Exp_Form: TDel_Adj_Exp_Form;

implementation

{$R *.dfm}

uses MDatos, FExpedientes;

procedure TDel_Adj_Exp_Form.Button1Click(Sender: TObject);
begin
  if ID_EXP <> 0 then
  begin
    with ModuloDatos.UniQueryDeleteAdj do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM adjunto WHERE id_cabecera = :ID_CAB');
      ParamByName('ID_CAB').AsInteger := ID_EXP;
      ExecSQL;
    end;

    if ModuloDatos.UniQueryDeleteAdj.RowsAffected <> 0 then
    begin
      ModuloDatos.UniQuerySelect2Adj.Refresh;
      ModuloDatos.UniQuerySelect1Adj.Refresh;
      ModuloDatos.UniQueryExpedientesDisponibles.Refresh;
      ShowMessage('Se Ha Eliminado El Grupo De Expedientes Satisfactoriamente.');
      Del_Adj_Exp_Form.Close;
    end
    else
    begin
      ShowMessage('Error Al Eliminar.');
    end;
  end
  else
  begin
    ShowMessage('Elija Un Expediente De La Grilla De Expedientes Cabeceras.');
  end;
end;

procedure TDel_Adj_Exp_Form.Button2Click(Sender: TObject);
begin
  Del_Adj_Exp_Form.Close;
end;

procedure TDel_Adj_Exp_Form.DBGrid1CellClick(Column: TColumn);
begin
  ID_EXP := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_exp').AsInteger;

  with ModuloDatos.UniQuerySelect2Adj do
  begin
    SQL.Clear;
    SQL.Add('SELECT id_exp, num_exp, referencia_exp, id_adjunto FROM adjunto INNER JOIN expediente WHERE id_cabecera = :CAB AND adjunto.id_adjunto = expediente.id_exp;');
    ParamByName('CAB').AsInteger := ID_EXP;
    Open;
  end;
end;

procedure TDel_Adj_Exp_Form.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    ID_EXP := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_exp').AsInteger;

    with ModuloDatos.UniQuerySelect2Adj do
    begin
      SQL.Clear;
      SQL.Add('SELECT id_exp, num_exp, referencia_exp, id_adjunto FROM adjunto INNER JOIN expediente WHERE id_cabecera = :CAB AND adjunto.id_adjunto = expediente.id_exp;');
      ParamByName('CAB').AsInteger := ID_EXP;
      Open;
    end;
  end;
end;

procedure TDel_Adj_Exp_Form.FormActivate(Sender: TObject);
begin
  with ModuloDatos.UniQuerySelect1Adj do
  begin
    SQL.Clear;
    SQL.Add('SELECT e.id_exp, num_exp, referencia_exp, tipo_exp, id_cabecera FROM expediente as e ');
    SQL.Add('INNER JOIN adjunto INNER JOIN tipo_expediente INNER JOIN movimiento as m1');
    SQL.Add('WHERE e.id_exp = adjunto.id_cabecera AND e.id_tipo_exp = tipo_expediente.id_tipo_exp AND ');
    SQL.Add('e.id_exp = m1.id_exp AND m1.id_comision_actual = :Com AND m1.fecha_movimiento IN ');
    SQL.Add('(SELECT max(fecha_movimiento) FROM movimiento as m2 WHERE m1.id_exp = m2.id_exp) GROUP BY adjunto.id_cabecera');
    ParamByName('Com').AsInteger := Expedientes_Form.ComisionActual;
    Open;
    Active := True;
  end;
end;

end.
