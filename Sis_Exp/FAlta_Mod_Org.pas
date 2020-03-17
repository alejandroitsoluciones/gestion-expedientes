unit FAlta_Mod_Org;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TOpc_Org_Form = class(TForm)
    Label1: TLabel;
    Cod_Edit: TEdit;
    Label2: TLabel;
    Nom_Edit: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Opc_Org_Form: TOpc_Org_Form;

implementation

{$R *.dfm}

uses MDatos, FOrganismo;

procedure TOpc_Org_Form.Button1Click(Sender: TObject);
begin
  //Comprueba que los campos no esten vacios.
  if (Cod_Edit.Text <> '') and (Nom_Edit.Text <> '') then
  begin
    {Sentencia SQL que guarda los datos de nuevo organismo}
    with ModuloDatos.UniQueryInsertOrganismo do
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO organismos (codigo_org, nombre_org) VALUES (:COD, :NOMBRE)');
      ParamByName('COD').AsInteger := StrToInt(Cod_Edit.Text);
      ParamByName('NOMBRE').AsString := Nom_Edit.Text;
      ExecSQL;
    end;
    //Verifica que realmente se hayan guardado los datos.
    if ModuloDatos.UniQueryInsertOrganismo.RowsAffected <> 0 then
    begin
      //Actualiza el Query de organismos. (Actualiza la grilla.)
      ModuloDatos.UniQueryOrganismos.Refresh;
      ShowMessage('Se Registro Correctamente El Organismo.');
      Opc_Org_Form.Close;
    end
    else
    begin
      ShowMessage('Error Al Registrar El Organismo.');
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Completar Todos Los Campos.');
  end;
end;

procedure TOpc_Org_Form.Button2Click(Sender: TObject);
begin
  //Comprueba que los campos no esten vacios.
  if (Cod_Edit.Text <> '') and (Nom_Edit.Text <> '') then
  begin
    {Sentencia SQL que actualiza los datos de nuevo organismo}
    with ModuloDatos.UniQueryUpdateOrganismo do
    begin
      SQL.Clear;
      SQL.Add('UPDATE organismos SET codigo_org = :CODIGO, nombre_org = :NOMBRE WHERE id_org = :ID');
      ParamByName('CODIGO').AsInteger := StrToInt(Cod_Edit.Text);
      ParamByName('NOMBRE').AsString := Nom_Edit.Text;
      ParamByName('ID').AsInteger := Organismos_Form.ID_ORG;
      ExecSQL;
    end;
    //Verifica que realmente se hayan actualizado los datos.
    if ModuloDatos.UniQueryUpdateOrganismo.RowsAffected <> 0 then
    begin
      //Actualiza el Query de organismos. (Actualiza la grilla.)
      ModuloDatos.UniQueryOrganismos.Refresh;
      ShowMessage('Se Actualizaron Correctamente Los Datos.');
      Opc_Org_Form.Close;
    end
    else
    begin
      ShowMessage('Error Al Actualizar Los Datos.');
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Completar Todos Los Campos.');
  end;
end;

procedure TOpc_Org_Form.Button3Click(Sender: TObject);
begin
  Opc_Org_Form.Close;
end;

end.
