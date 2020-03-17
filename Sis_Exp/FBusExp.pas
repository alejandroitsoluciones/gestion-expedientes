unit FBusExp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask;

type
  TBus_Exp_Form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Num_Edit: TEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Ano_Edit: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Fecha_Ini_Exp_DBEdit: TDBEdit;
    Folios_DBEdit: TDBEdit;
    Referencia_DBMemo: TDBMemo;
    Observaciones_DBMemo: TDBMemo;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    Button1: TButton;
    Label7: TLabel;
    Num_Exp_DBEdit: TDBEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  {public}
    { Public declarations }
    TExp : Integer;
  end;

var
  Bus_Exp_Form: TBus_Exp_Form;

implementation

{$R *.dfm}

uses MDatos;

procedure TBus_Exp_Form.Button1Click(Sender: TObject);
begin
  Bus_Exp_Form.Close;
end;

procedure TBus_Exp_Form.SpeedButton1Click(Sender: TObject);
begin
  if (Num_Edit.Text <> '') and (Ano_Edit.Text <> '') then
  begin
    with ModuloDatos.UniQueryBusExp do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM expediente AS e INNER JOIN movimiento AS m ON e.id_exp = m.id_exp INNER JOIN comision AS c1 INNER JOIN movimiento as m1 ON c1.id_comision = m1.id_comision_anterior ');
      SQL.Add('INNER JOIN comision AS c2 INNER JOIN movimiento AS m2 ON c2.id_comision = m2.id_comision_actual WHERE e.id_exp = :NUM AND YEAR(e.fecha_ini_exp) = :ANO GROUP BY c1.nombre_comision');
      ParamByName('NUM').AsInteger := StrToInt(Num_Edit.Text);
      ParamByName('ANO').AsInteger := StrToInt(Ano_Edit.Text);
      Open;
      Active := True;
    end;

    if ModuloDatos.UniQueryBusExp.IsEmpty then
    begin
      ShowMessage('No Se Encontraron Resultados En La Busqueda. Intente Nuevamente.');
    end;
  end
  else
  begin
    ShowMessage('Complete Todos Los Parametros Para Realizar Una Búsqueda Efectiva.');
  end;
end;

end.

