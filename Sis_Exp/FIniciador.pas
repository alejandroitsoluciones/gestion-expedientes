unit FIniciador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TIni_Form = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Buscar_I_Edit: TEdit;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Buscar_I_EditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_Tipo_Ini, ID_Ini : Integer;
  end;

var
  Ini_Form: TIni_Form;

implementation

{$R *.dfm}

uses FAlta_Ini, MDatos, FAlta_Exp;

procedure TIni_Form.Buscar_I_EditChange(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
  0:
    begin
      if Buscar_I_Edit.Text = '' then
      begin
        DBGrid1.DataSource := ModuloDatos.UniDataSourceIniciador;
      end
      else
      begin
        with ModuloDatos.UniQueryBusIniciador do
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM iniciador INNER JOIN tipo_iniciador ON iniciador.id_tipo_ini = tipo_iniciador.id_tipo_ini WHERE iniciador.nombre_ini like :Bus ');
          ParamByName('Bus').AsString := Buscar_I_Edit.Text+'%';
          Open;
        end;
        DBGrid1.DataSource := ModuloDatos.UniDataSourceBusIniciador;
      end;
    end;
  1:
    begin
      if Buscar_I_Edit.Text = '' then
      begin
        DBGrid1.DataSource := ModuloDatos.UniDataSourceIniciador;
      end
      else
      begin
        with ModuloDatos.UniQueryBusIniciador do
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM iniciador INNER JOIN tipo_iniciador ON iniciador.id_tipo_ini = tipo_iniciador.id_tipo_ini WHERE iniciador.apellido_ini like :Bus ');
          ParamByName('Bus').AsString := Buscar_I_Edit.Text+'%';
          Open;
        end;
        DBGrid1.DataSource := ModuloDatos.UniDataSourceBusIniciador;
      end;
    end;
  2:
    begin
      if Buscar_I_Edit.Text = '' then
      begin
        DBGrid1.DataSource := ModuloDatos.UniDataSourceIniciador;
      end
      else
      begin
        with ModuloDatos.UniQueryBusIniciador do
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM iniciador INNER JOIN tipo_iniciador ON iniciador.id_tipo_ini = tipo_iniciador.id_tipo_ini WHERE iniciador.barrio_ini like :Bus ');
          ParamByName('Bus').AsString := Buscar_I_Edit.Text+'%';
          Open;
        end;
        DBGrid1.DataSource := ModuloDatos.UniDataSourceBusIniciador;
      end;
    end;
  end;
end;

procedure TIni_Form.Button1Click(Sender: TObject);
begin
  N_Ini_Form := TN_Ini_Form.Create(Self);
  N_Ini_Form.ShowModal;
end;

procedure TIni_Form.Button2Click(Sender: TObject);
begin
  if ID_Ini <> 0 then
  begin
    with ModuloDatos.UniQuerySelect1Iniciador do
    begin
      SQL.Clear;
      SQL.Add('SELECT id_ini, nombre_ini, apellido_ini, dni_ini, direccion_ini, barrio_ini, tipo_ini FROM iniciador INNER JOIN tipo_iniciador WHERE iniciador.id_tipo_ini = tipo_iniciador.id_tipo_ini AND id_ini = :INICIADOR');
      ParamByName('INICIADOR').AsInteger := ID_Ini;
      Open;

      N_Expediente_Form.Nombre_Ini_Edit.Text := Fields.FieldByName('nombre_ini').AsString;
      N_Expediente_Form.Apellido_Ini_Edit.Text := Fields.FieldByName('apellido_ini').AsString;
      N_Expediente_Form.DNI_Edit.Text := Fields.FieldByName('dni_ini').AsString;
      N_Expediente_Form.Direccion_Ini_Edit.Text := Fields.FieldByName('direccion_ini').AsString;
      N_Expediente_Form.Barrio_Ini_Edit.Text := Fields.FieldByName('barrio_ini').AsString;
      N_Expediente_Form.Tipo_Ini_Edit.Text := Fields.FieldByName('tipo_ini').AsString;
    end;
      if (ID_Tipo_Ini = 2) and (N_Expediente_Form.T_Exp = 6) then
      begin
        N_Expediente_Form.Button2.Visible := True;
      end;
    Ini_Form.Close;
  end
  else
  begin
    ShowMessage('Elija Un Iniciador De La Grilla.');
  end;
end;

procedure TIni_Form.Button3Click(Sender: TObject);
begin
  if ID_Ini <> 0 then
  begin
    N_Ini_Form := TN_Ini_Form.Create(Self);
    N_Ini_Form.Caption := 'Modificar Iniciador';
    with ModuloDatos.UniQuerySelectIni do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM iniciador WHERE id_ini = :ID');
      ParamByName('ID').AsInteger := ID_Ini;
      Open;
      ID_Tipo_Ini := Fields.FieldByName('id_tipo_ini').AsInteger;
    end;

    N_Ini_Form.DNI_Edit.Text := ModuloDatos.UniQuerySelectIni.Fields.FieldByName('dni_ini').AsString;
    N_Ini_Form.Nombre_Edit.Text := ModuloDatos.UniQuerySelectIni.Fields.FieldByName('nombre_ini').AsString;
    N_Ini_Form.Apellido_Edit.Text := ModuloDatos.UniQuerySelectIni.Fields.FieldByName('apellido_ini').AsString;
    N_Ini_Form.Direccion_Edit.Text := ModuloDatos.UniQuerySelectIni.Fields.FieldByName('direccion_ini').AsString;
    N_Ini_Form.Barrio_Edit.Text := ModuloDatos.UniQuerySelectIni.Fields.FieldByName('barrio_ini').AsString;

    case ID_Tipo_Ini of
    1:
      begin
        N_Ini_Form.Tipo_Ini_ComboBox.ItemIndex := 0;
        N_Ini_Form.Tipo_Ini_ComboBox.Enabled := False;
        N_Ini_Form.Nombre_Edit.Enabled := True;
        N_Ini_Form.Apellido_Edit.Enabled := True;
        N_Ini_Form.DNI_Edit.Enabled := True;
        N_Ini_Form.Direccion_Edit.Enabled := True;
        N_Ini_Form.Barrio_Edit.Enabled := True;
      end;
    2:
      begin
        N_Ini_Form.Tipo_Ini_ComboBox.ItemIndex := 1;
        N_Ini_Form.Nombre_Edit.Enabled := True;
        N_Ini_Form.Apellido_Edit.Enabled := True;
        N_Ini_Form.DNI_Edit.Text := 'SIN ESPECIFICAR';
        N_Ini_Form.DNI_Edit.Enabled := False;
        N_Ini_Form.Direccion_Edit.Text := 'SIN ESPECIFICAR';
        N_Ini_Form.Direccion_Edit.Enabled := False;
        N_Ini_Form.Barrio_Edit.Text := 'SIN ESPECIFICAR';
        N_Ini_Form.Barrio_Edit.Enabled := False;
        N_Ini_Form.Tipo_Ini_ComboBox.Enabled := False;
      end;
    3:
      begin
        N_Ini_Form.Tipo_Ini_ComboBox.ItemIndex := 2;
        N_Ini_Form.Nombre_Edit.Enabled := True;
        N_Ini_Form.Apellido_Edit.Enabled := True;
        N_Ini_Form.DNI_Edit.Text := 'SIN ESPECIFICAR';
        N_Ini_Form.DNI_Edit.Enabled := False;
        N_Ini_Form.Direccion_Edit.Enabled := True;
        N_Ini_Form.Barrio_Edit.Enabled := True;
        N_Ini_Form.Tipo_Ini_ComboBox.Enabled := False;
      end;
    4:
      begin
        N_Ini_Form.Tipo_Ini_ComboBox.ItemIndex := 3;
        N_Ini_Form.Nombre_Edit.Text := 'SIN ESPECIFICAR';
        N_Ini_Form.Nombre_Edit.Enabled := False;
        N_Ini_Form.Apellido_Edit.Text := 'SIN ESPECIFICAR';
        N_Ini_Form.Apellido_Edit.Enabled := False;
        N_Ini_Form.DNI_Edit.Text := 'SIN ESPECIFICAR';
        N_Ini_Form.DNI_Edit.Enabled := False;
        N_Ini_Form.Direccion_Edit.Text := 'SIN ESPECIFICAR';
        N_Ini_Form.Direccion_Edit.Enabled := False;
        N_Ini_Form.Barrio_Edit.Enabled := True;
        N_Ini_Form.Tipo_Ini_ComboBox.Enabled := False;
      end;
    end;
    N_Ini_Form.Button1.Visible := False;
    N_Ini_Form.Button3.Visible := True;
    N_Ini_Form.ShowModal;
  end
  else
  begin
    ShowMessage('Elija Un Iniciador De La Grilla Para Modificar.');
  end;
end;

procedure TIni_Form.DBGrid1CellClick(Column: TColumn);
begin
  ID_Ini := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_ini').AsInteger;
  N_Expediente_Form.Ini_Ini := ID_Ini;
  ID_Tipo_Ini := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_tipo_ini').AsInteger;
end;

procedure TIni_Form.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ID_Ini := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_ini').AsInteger;
    N_Expediente_Form.Ini_Ini := ID_Ini;
    ID_Tipo_Ini := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_tipo_ini').AsInteger;
end;

procedure TIni_Form.FormActivate(Sender: TObject);
begin
  ModuloDatos.UniQueryIniciador.Active := True;
  ID_Ini := 0;
end;

end.
