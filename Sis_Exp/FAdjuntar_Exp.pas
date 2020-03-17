unit FAdjuntar_Exp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TAdj_Exp_Form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Num_Exp_Edit: TEdit;
    Fecha_Exp_Edit: TEdit;
    T_Exp_Edit: TEdit;
    Cod_Edit: TEdit;
    Ref_Memo: TMemo;
    Obs_Memo: TMemo;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Organismo_Edit: TEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Button4: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure GuardarAdjuntoExp (Cabecera, Adjunto : Integer);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    F1, F2, Exp : Integer;
  end;

var
  Adj_Exp_Form: TAdj_Exp_Form;

implementation

{$R *.dfm}

uses MDatos, FExpedientes;

procedure TAdj_Exp_Form.Button1Click(Sender: TObject);
begin
  Adj_Exp_Form.Close;
end;

procedure TAdj_Exp_Form.Button2Click(Sender: TObject);
var
  I : Integer;
begin
  StringGrid2.Cells[0,StringGrid2.RowCount-1]:= StringGrid1.Cells[0,F1];
  StringGrid2.Cells[1,StringGrid2.RowCount-1]:= StringGrid1.Cells[1,F1];
  StringGrid2.Cells[2,StringGrid2.RowCount-1]:= StringGrid1.Cells[2,F1];
  StringGrid2.Cells[3,StringGrid2.RowCount-1]:= StringGrid1.Cells[3,F1];
  StringGrid2.Cells[4,StringGrid2.RowCount-1]:= StringGrid1.Cells[4,F1];
  StringGrid2.RowCount := StringGrid2.RowCount+1;

  if not StringGrid1.Cells[0,F1].IsEmpty then
  begin
    for I := F1 to StringGrid1.RowCount-1 do
      begin
        StringGrid1.Cells[0,I]:= StringGrid1.Cells[0,I+1];
        StringGrid1.Cells[1,I]:= StringGrid1.Cells[1,I+1];
        StringGrid1.Cells[2,I]:= StringGrid1.Cells[2,I+1];
        StringGrid1.Cells[3,I]:= StringGrid1.Cells[3,I+1];
        StringGrid1.Cells[4,I]:= StringGrid1.Cells[4,I+1];
      end;
    StringGrid1.RowCount := StringGrid1.RowCount-1;
  end
  else
  begin
    ShowMessage('Elija Una Tupla o Fila Con Datos.');
  end;
end;

procedure TAdj_Exp_Form.Button3Click(Sender: TObject);
var
  I : Integer;
begin
  StringGrid1.Cells[0,StringGrid1.RowCount-1]:= StringGrid2.Cells[0,F2];
  StringGrid1.Cells[1,StringGrid1.RowCount-1]:= StringGrid2.Cells[1,F2];
  StringGrid1.Cells[2,StringGrid1.RowCount-1]:= StringGrid2.Cells[2,F2];
  StringGrid1.Cells[3,StringGrid1.RowCount-1]:= StringGrid2.Cells[3,F2];
  StringGrid1.Cells[4,StringGrid1.RowCount-1]:= StringGrid2.Cells[4,F2];
  StringGrid1.RowCount := StringGrid1.RowCount+1;

  if not StringGrid2.Cells[0,F2].IsEmpty then
  begin
    for I := F2 to StringGrid1.RowCount-1 do
      begin
        StringGrid2.Cells[0,I]:= StringGrid2.Cells[0,I+1];
        StringGrid2.Cells[1,I]:= StringGrid2.Cells[1,I+1];
        StringGrid2.Cells[2,I]:= StringGrid2.Cells[2,I+1];
        StringGrid2.Cells[3,I]:= StringGrid2.Cells[3,I+1];
        StringGrid2.Cells[3,I]:= StringGrid2.Cells[4,I+1];
      end;
    StringGrid2.RowCount := StringGrid2.RowCount-1;
  end
  else
  begin
    ShowMessage('Elija Una Tupla o Fila Con Datos.');
  end;
end;

procedure TAdj_Exp_Form.Button4Click(Sender: TObject);
var
  I1 : Integer;
begin
  for I1 := 1 to StringGrid2.RowCount do
  begin
    if not StringGrid2.Cells[0,I1].IsEmpty then
    begin
      GuardarAdjuntoExp(Expedientes_Form.ID_Expediente,StrToInt(StringGrid2.Cells[0,I1]));
      StringGrid2.RowCount := StringGrid2.RowCount -1;
    end;
  end;
  if ModuloDatos.UniQueryInsertAdj.RowsAffected <> 0 then
  begin
    ModuloDatos.UniQueryExpedientesDisponibles.Refresh;
    ShowMessage('Se Ha Creado El Conjunto De Expedientes Correctamente.');
    Adj_Exp_Form.Close;
  end;
end;

procedure TAdj_Exp_Form.FormActivate(Sender: TObject);
begin
  StringGrid1.Cells[0,0] := 'ID';
  StringGrid1.Cells[1,0] := 'Numero Exp';
  StringGrid1.Cells[2,0] := 'Cantidad Folios';
  StringGrid1.Cells[3,0] := 'Fecha Iniciado';
  StringGrid1.Cells[4,0] := 'Cod';

  StringGrid2.Cells[0,0] := 'ID';
  StringGrid2.Cells[1,0] := 'Numero Exp';
  StringGrid2.Cells[2,0] := 'Cantidad Folios';
  StringGrid2.Cells[3,0] := 'Fecha Iniciado';
  StringGrid2.Cells[4,0] := 'Cod';

  with ModuloDatos.UniQueryExp_Adj_Add do
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
    SQL.Add('WHERE e.estado_pen_acp = 1 ');
    SQL.Add('AND m1.id_comision_actual = :COMISION ');
    SQL.Add('AND m1.fecha_movimiento = (SELECT max(fecha_movimiento) FROM movimiento AS m2 WHERE m1.id_exp = m2.id_exp) ');
    SQL.Add('AND e.id_exp NOT IN (SELECT id_cabecera FROM adjunto) ');
    SQL.Add('AND e.id_exp NOT IN (SELECT id_adjunto FROM adjunto) ');
    SQL.Add('AND e.id_exp <> :CABECERA_SELECT ');
    SQL.Add('ORDER BY e.id_exp');
    ParamByName('COMISION').AsInteger := Expedientes_Form.ComisionActual;
    ParamByName('CABECERA_SELECT').AsInteger := Expedientes_Form.ID_Expediente;
    Open;

   while not Eof do
   begin
     StringGrid1.Cells[3,StringGrid1.RowCount-1] := DateTimeToStr(Fields.FieldByName('fecha_ini_exp').AsDateTime);
     StringGrid1.Cells[2,StringGrid1.RowCount-1] := IntToStr(Fields.FieldByName('cantidad_folios').AsInteger);
     StringGrid1.Cells[4,StringGrid1.RowCount-1] := IntToStr(Fields.FieldByName('codigo_org').AsInteger);
     StringGrid1.Cells[1,StringGrid1.RowCount-1] := IntToStr(Fields.FieldByName('num_exp').AsInteger);
     StringGrid1.Cells[0,StringGrid1.RowCount-1] := IntToStr(Fields.FieldByName('id_exp').AsInteger);
     StringGrid1.RowCount := StringGrid1.RowCount + 1;
     Next;
   end;
  end;
end;

procedure TAdj_Exp_Form.GuardarAdjuntoExp(Cabecera, Adjunto: Integer);
begin
  with ModuloDatos.UniQueryInsertAdj do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO adjunto (id_cabecera, id_adjunto) ');
    SQL.Add('VALUES (:EXP_CAB, :EXP_ADJ)');
    ParamByName('EXP_CAB').AsInteger := Cabecera;
    ParamByName('EXP_ADJ').AsInteger := Adjunto;
    ExecSQL;
  end;
end;

procedure TAdj_Exp_Form.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  F1 := ARow;
end;

procedure TAdj_Exp_Form.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  F2 := ARow;
end;

end.
