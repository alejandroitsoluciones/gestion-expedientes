unit FAlta_Ini;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TN_Ini_Form = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Nombre_Edit: TEdit;
    Apellido_Edit: TEdit;
    DNI_Edit: TEdit;
    Direccion_Edit: TEdit;
    Barrio_Edit: TEdit;
    Tipo_Ini_ComboBox: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure GuardarDatosIni(Nombre, Apellido, DNI, Direccion, Barrio: String; ID_Tipo: Integer);
    procedure Tipo_Ini_ComboBoxSelect(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_Tipo : Integer;
  end;

var
  N_Ini_Form: TN_Ini_Form;

implementation

{$R *.dfm}

uses MDatos, FIniciador;

procedure TN_Ini_Form.Button1Click(Sender: TObject);
begin
  GuardarDatosIni(Nombre_Edit.Text,Apellido_Edit.Text,DNI_Edit.Text,Direccion_Edit.Text,Barrio_Edit.Text,ID_Tipo);
end;

procedure TN_Ini_Form.Button2Click(Sender: TObject);
begin
  N_Ini_Form.Close;
end;

procedure TN_Ini_Form.Button3Click(Sender: TObject);
begin

  with ModuloDatos.UniQueryUpdateIni do
  begin
    SQL.Clear;
    SQL.Add('UPDATE iniciador SET nombre_ini = :NOMBRE, apellido_ini = :APELLIDO, dni_ini = :DNI, direccion_ini = :DIRECCION, barrio_ini = :BARRIO WHERE id_ini = :ID');
    ParamByName('NOMBRE').AsString := Nombre_Edit.Text;
    ParamByName('APELLIDO').AsString := Apellido_Edit.Text;
    ParamByName('DNI').AsString := DNI_Edit.Text;
    ParamByName('DIRECCION').AsString := Direccion_Edit.Text;
    ParamByName('BARRIO').AsString := Barrio_Edit.Text;
    ParamByName('ID').AsInteger := Ini_Form.ID_Ini;
    ExecSQL;
  end;
  //Comprueba que se haya actualizado el iniciador.
  if ModuloDatos.UniQueryUpdateIni.RowsAffected <> 0 then
  begin
    ModuloDatos.UniQueryIniciador.Refresh;
    ShowMessage('El Iniciador Fue Modificado Correctamente.');
  end
  else
  begin
    ShowMessage('Error Al Actualizar.');
  end;
end;

procedure TN_Ini_Form.GuardarDatosIni(Nombre, Apellido, DNI, Direccion,
  Barrio: String; ID_Tipo: Integer);
begin
  with ModuloDatos.UniQueryInsertIniciador do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO iniciador (nombre_ini, apellido_ini, dni_ini, direccion_ini, barrio_ini, id_tipo_ini) VALUES (:NOMBRE, :APELLIDO, :DNI, :DIRECCION, :BARRIO, :ID_TIPO)');
    ParamByName('NOMBRE').AsString := Nombre;
    ParamByName('APELLIDO').AsString := Apellido;
    ParamByName('DNI').AsString := DNI;
    ParamByName('DIRECCION').AsString := Direccion;
    ParamByName('BARRIO').AsString := Barrio;
    ParamByName('ID_TIPO').AsInteger := ID_Tipo;
    ExecSQL;
  end;
  //Comprueba que se haya guardado el iniciador.
  if ModuloDatos.UniQueryInsertIniciador.RowsAffected <> 0 then
  begin
    ShowMessage('El Iniciador Fue Creado.');
    ModuloDatos.UniQueryIniciador.Refresh;
    N_Ini_Form.Close;
  end
  else
  begin
    ShowMessage('Error.');
  end;

end;

procedure TN_Ini_Form.Tipo_Ini_ComboBoxSelect(Sender: TObject);
begin
  {Casos en los que los campos se completan y bloquean automaticamente
  en funcion al tipo de iniciador.}
  case Tipo_Ini_ComboBox.ItemIndex of
  0:
    begin
      ID_Tipo := 1;
      Nombre_Edit.Enabled := True;
      Apellido_Edit.Enabled := True;
      DNI_Edit.Enabled := True;
      Direccion_Edit.Enabled := True;
      Barrio_Edit.Enabled := True;
    end;
  1:
    begin
      ID_Tipo := 2;
      Nombre_Edit.Enabled := True;
      Apellido_Edit.Enabled := True;
      DNI_Edit.Text := 'SIN ESPECIFICAR';
      DNI_Edit.Enabled := False;
      Direccion_Edit.Text := 'SIN ESPECIFICAR';
      Direccion_Edit.Enabled := False;
      Barrio_Edit.Text := 'SIN ESPECIFICAR';
      Barrio_Edit.Enabled := False;
    end;
  2:
    begin
      ID_Tipo := 3;
      Nombre_Edit.Enabled := True;
      Apellido_Edit.Enabled := True;
      DNI_Edit.Text := 'SIN ESPECIFICAR';
      DNI_Edit.Enabled := False;
      Direccion_Edit.Enabled := True;
      Barrio_Edit.Enabled := True;
    end;
  3:
    begin
      ID_Tipo := 4;
      Nombre_Edit.Text := 'SIN ESPECIFICAR';
      Nombre_Edit.Enabled := False;
      Apellido_Edit.Text := 'SIN ESPECIFICAR';
      Apellido_Edit.Enabled := False;
      DNI_Edit.Text := 'SIN ESPECIFICAR';
      DNI_Edit.Enabled := False;
      Direccion_Edit.Text := 'SIN ESPECIFICAR';
      Direccion_Edit.Enabled := False;
      Barrio_Edit.Enabled := True;
    end;
  end;
end;

end.
