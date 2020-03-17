unit FAlta_Mod_Com;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TOpc_Com_Form = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Nom_Com_Edit: TEdit;
    Nom_E_Edit: TEdit;
    Apell_E_Edit: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Opc_Com_Form: TOpc_Com_Form;

implementation

{$R *.dfm}

uses MDatos, FComision;

procedure TOpc_Com_Form.Button1Click(Sender: TObject);
begin
  if (Nom_Com_Edit.Text <> '') and (Nom_E_Edit.Text <> '') and (Apell_E_Edit.Text <> '') then
  begin
    {Sentencia SQL para agregar una nueva comision.}
    with ModuloDatos.UniQueryInsertComision do
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO comision (nombre_comision, nombre_encargado_comision, apellido_encargado_comision) ');
      SQL.Add('VALUES (:NOMBRE_COM, :NOMBRE_E, :APELLIDO_E)');
      ParamByName('NOMBRE_COM').AsString := Nom_Com_Edit.Text;
      ParamByName('NOMBRE_E').AsString := Nom_E_Edit.Text;
      ParamByName('APELLIDO_E').AsString := Apell_E_Edit.Text;
      ExecSQL;
    end;
    //Comprueba si la comision fue guardada correctamente.
    if ModuloDatos.UniQueryInsertComision.RowsAffected <> 0 then
    begin
      ModuloDatos.UniTableComisiones.Refresh;
      ShowMessage('La Comision Se Registro Correctamente.');
      Opc_Com_Form.Close;
    end
    else
    begin
      ShowMessage('Error.');
    end;
  end
  else
  begin
    ShowMessage('Debe Completar Todos Los Campos Para Crear Una Comisión');
  end;
end;

procedure TOpc_Com_Form.Button2Click(Sender: TObject);
begin
  if (Nom_Com_Edit.Text <> '') and (Nom_E_Edit.Text <> '') and (Apell_E_Edit.Text <> '') then
  begin
    {Sentecia SQL para modificar los datos de una comision.}
    with ModuloDatos.UniQueryUpdateComision do
    begin
      SQL.Clear;
      SQL.Add('UPDATE comision SET nombre_comision = :COMISION, nombre_encargado_comision = :N_ENCARGADO, apellido_encargado_comision = :A_ENCARGADO WHERE id_comision = :ID_COM');
      ParamByName('COMISION').AsString := Nom_Com_Edit.Text;
      ParamByName('N_ENCARGADO').AsString := Nom_E_Edit.Text;
      ParamByName('A_ENCARGADO').AsString := Apell_E_Edit.Text;
      ParamByName('ID_COM').AsInteger := Comisiones_Form.ID_Com;
      ExecSQL;
    end;
    //Comprueba si la comision fue actualizada correctamente.
    if ModuloDatos.UniQueryUpdateComision.RowsAffected <> 0 then
    begin
      ModuloDatos.UniTableComisiones.Refresh;
      ShowMessage('La Comision Ha Sido Modificada.');
      Opc_Com_Form.Close;
    end
    else
    begin
      ShowMessage('Error.');
    end;
  end
  else
  begin
    ShowMessage('Debe Completar Todos Los Campos Para Actualizar Una Comisión');
  end;
end;

procedure TOpc_Com_Form.Button3Click(Sender: TObject);
begin
  Opc_Com_Form.Close;
end;

end.
