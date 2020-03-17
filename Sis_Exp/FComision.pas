unit FComision;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TComisiones_Form = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Bus_Com_Edit: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Bus_Com_EditChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Mensaje, ID_Com : Integer;
  end;

var
  Comisiones_Form: TComisiones_Form;

implementation

{$R *.dfm}

uses MDatos, FAlta_Mod_Com;

procedure TComisiones_Form.Bus_Com_EditChange(Sender: TObject);
begin
  if Bus_Com_Edit.Text = '' then
  begin
    DBGrid1.DataSource := ModuloDatos.UniDataSourceComisiones;
  end
  else
  begin
    with ModuloDatos.UniQuerySelect1Comision do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM comision WHERE nombre_comision like :BUSQUEDA');
      ParamByName('BUSQUEDA').AsString := Bus_Com_Edit.Text + '%';
      Open;
    end;
    DBGrid1.DataSource := ModuloDatos.UniDataSourceSelect1Comision;
  end;
end;

procedure TComisiones_Form.Button1Click(Sender: TObject);
begin
  Opc_Com_Form := TOpc_Com_Form.Create(Self);
  Opc_Com_Form.Caption := 'Nueva Comision';
  Opc_Com_Form.ShowModal;
end;

procedure TComisiones_Form.Button2Click(Sender: TObject);
begin
  if ID_Com <> 0 then
  begin
    Opc_Com_Form := TOpc_Com_Form.Create(Self);
    Opc_Com_Form.Caption := 'Modificar Comision';

    with ModuloDatos.UniQuerySelectComision do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM comision WHERE id_comision = :COM');
      ParamByName('COM').AsInteger := ID_Com;
      Open;

      Opc_Com_Form.Nom_Com_Edit.Text := Fields.FieldByName('nombre_comision').AsString;
      Opc_Com_Form.Nom_E_Edit.Text := Fields.FieldByName('nombre_encargado_comision').AsString;
      Opc_Com_Form.Apell_E_Edit.Text := Fields.FieldByName('apellido_encargado_comision').AsString;
    end;

    Opc_Com_Form.Button1.Visible := False;
    Opc_Com_Form.Button2.Visible := True;

    Opc_Com_Form.ShowModal;
  end
  else
  begin
    ShowMessage('Seleccione Una Comision De La Grilla Para Modificar.');
  end;
end;

procedure TComisiones_Form.Button3Click(Sender: TObject);
begin
  if ID_Com <> 0 then
  begin
    Mensaje := MessageDlg('¿Esta Seguro De Eliminar La Comision? - Si Elimina Esta Comision Se Perderan El Historial De Expedientes Que Pasaron Por Esta Comision Y Los Que Estan Actualmente En Ella',mtConfirmation,[mbYes, mbNo],0);
    if Mensaje = mrYes then
    begin
      with ModuloDatos.UniQueryDeleteComision do
      begin
        SQL.Clear;
        SQL.Add('DELETE FROM comision WHERE id_comision = :ID');
        ParamByName('ID').AsInteger := ID_Com;
        ExecSQL;
      end;
      if ModuloDatos.UniQueryDeleteComision.RowsAffected <> 0 then
      begin
        ModuloDatos.UniTableComisiones.Refresh;
        ShowMessage('Se Elimino Correctamente La Comision.');
      end
      else
      begin
        ShowMessage('Error Al Eliminar La Comision.');
      end;
    end;
  end
  else
  begin
    ShowMessage('Elija Una Comision De La Grilla Para Eliminar.');
  end;
end;

procedure TComisiones_Form.Button4Click(Sender: TObject);
begin
  Comisiones_Form.Close;
end;

procedure TComisiones_Form.DBGrid1CellClick(Column: TColumn);
begin
  ID_Com := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_comision').AsInteger;
end;

procedure TComisiones_Form.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ID_Com := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_comision').AsInteger;
end;

procedure TComisiones_Form.FormActivate(Sender: TObject);
begin
  ModuloDatos.UniTableComisiones.Active := True;
  ID_Com := 0;
end;

end.
