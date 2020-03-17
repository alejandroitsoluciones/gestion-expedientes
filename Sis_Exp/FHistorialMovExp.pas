unit FHistorialMovExp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  THistorial_Mov_Form = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Num_Exp_Edit: TEdit;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Num_Exp_EditChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Historial_Mov_Form: THistorial_Mov_Form;

implementation

{$R *.dfm}

uses FExpedientes, MDatos;

procedure THistorial_Mov_Form.Button1Click(Sender: TObject);
begin
  Historial_Mov_Form.Close;
end;

procedure THistorial_Mov_Form.Button2Click(Sender: TObject);
begin
  ModuloDatos.FRXReport_Hist.PrepareReport();
  ModuloDatos.FRXReport_Hist.ShowReport();
end;

procedure THistorial_Mov_Form.Num_Exp_EditChange(Sender: TObject);
begin
  if Num_Exp_Edit.Text <> '' then
  begin
    with ModuloDatos.UniQueryHistMovExp do
    begin
      SQL.Clear;
      SQL.Add('SELECT e.id_exp, e.num_exp, m.id_exp, m.fecha_movimiento, c.nombre_comision FROM movimiento AS m INNER JOIN comision AS c ON c.id_comision = m.id_comision_actual INNER JOIN expediente AS e ON m.id_exp = e.id_exp ');
      SQL.Add('WHERE m.id_exp = :ID_EXP GROUP BY c.nombre_comision ORDER BY m.fecha_movimiento');
      ParamByName('ID_EXP').AsInteger := StrToInt(Num_Exp_Edit.Text);
      Open;
      Active := True;
    end;
    with ModuloDatos.UniQueryDetalle_Exp_Ini do
    begin
      SQL.Clear;
      SQL.Add('SELECT num_exp, nombre_ini, apellido_ini, direccion_ini, barrio_ini, tipo_ini, adjunto ');
      SQL.Add('FROM expediente INNER JOIN iniciador INNER JOIN tipo_iniciador INNER JOIN adjunto_ini INNER JOIN ini_x_exp ');
      SQL.Add('WHERE expediente.id_exp = ini_x_exp.id_exp AND iniciador.id_tipo_ini = tipo_iniciador.id_tipo_ini AND iniciador.id_ini = ini_x_exp.id_ini AND adjunto_ini.id_adjunto = ini_x_exp.id_adjunto AND expediente.id_exp = :PARAMETRO');
      ParamByName('PARAMETRO').AsInteger := StrToInt(Num_Exp_Edit.Text);
      Open;
      Active := True;
    end;
  end
  else
  begin
    Num_Exp_Edit.Text := IntToStr(0);
  end;
end;

end.
