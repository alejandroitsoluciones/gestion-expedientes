unit FAsig_Com;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TAsig_Com_Form = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_Com : Integer;
    FechaH : TDateTime;
  end;

var
  Asig_Com_Form: TAsig_Com_Form;

implementation

{$R *.dfm}

uses MDatos, FNuevo_Exp;

procedure TAsig_Com_Form.Button1Click(Sender: TObject);
begin
  if ID_Com <> 0 then
  begin
    with ModuloDatos.UniQueryUpdateExpediente do
    begin
      SQL.Clear;
      SQL.Add('UPDATE expediente SET id_estado_exp = :ID_ESTADO, estado_pen_acp = :ESTADO WHERE id_exp = :EXP');
      ParamByName('ID_ESTADO').AsInteger := 4;
      ParamByName('ESTADO').AsInteger := 0;
      ParamByName('EXP').AsInteger := Exp_Nuevo_Form.ID_Exp;
      ExecSQL;
    end;

    if ModuloDatos.UniQueryUpdateExpediente.RowsAffected <> 0 then
    begin
      with ModuloDatos.UniQueryInsertMovimiento do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO movimiento (fecha_movimiento, id_exp, id_comision_actual, id_comision_anterior) ');
        SQL.Add('VALUES (:FECHA, :IDE, :COM_AC, :C_AN)');
        ParamByName('FECHA').AsDateTime := FechaH;
        ParamByName('IDE').AsInteger := Exp_Nuevo_Form.ID_Exp;
        ParamByName('C_AN').AsInteger := 14;
        ParamByName('COM_AC').AsInteger := ID_Com;
        ExecSQL;
      end;

      if ModuloDatos.UniQueryInsertMovimiento.RowsAffected <> 0 then
      begin
        ModuloDatos.UniQueryExpedientesNuevos.Refresh;
        ShowMessage('La Operacion Se Realizo Exitosamente.');
        ID_Com := 0;
        Exp_Nuevo_Form.ID_Exp := 0;
        Asig_Com_Form.Close;
      end;
    end;
  end
  else
  begin
    ShowMessage('Elija Una Comision De La Grilla.');
  end;
end;

procedure TAsig_Com_Form.Button2Click(Sender: TObject);
begin
  Asig_Com_Form.Close;
  ID_Com := 0;
  Exp_Nuevo_Form.ID_Exp := 0;
end;

procedure TAsig_Com_Form.DBGrid1CellClick(Column: TColumn);
begin
  ID_Com := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_comision').AsInteger;
end;

procedure TAsig_Com_Form.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ID_Com := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_comision').AsInteger;
end;

procedure TAsig_Com_Form.FormActivate(Sender: TObject);
begin
  ModuloDatos.UniQueryAsigComision.Open;
  ModuloDatos.UniQueryAsigComision.Active := True;
  ID_Com := 0;
end;

procedure TAsig_Com_Form.Timer1Timer(Sender: TObject);
begin
  FechaH := Now;
end;

end.
