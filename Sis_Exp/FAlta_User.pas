unit FAlta_User;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAlta_User_Form = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Nombre_U_Edit: TEdit;
    Host_Edit: TEdit;
    Clave_Edit: TEdit;
    Confirm_Clave_Edit: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Nombre_Edit: TEdit;
    Apellido_Edit: TEdit;
    DNI_Edit: TEdit;
    Tipo_U_ComboBox: TComboBox;
    Com_ComboBox: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DNI_EditChange(Sender: TObject);
    procedure DatosUsuario(Nombre, Apellido, DNI : String; Tipo, Comision : Integer);
    procedure FormActivate(Sender: TObject);
    procedure Tipo_U_ComboBoxSelect(Sender: TObject);
    procedure Com_ComboBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Type_User : Integer;
    ComisionUser : Integer;
  end;

var
  Alta_User_Form: TAlta_User_Form;

implementation

{$R *.dfm}

uses MDatos, FSesion;

procedure TAlta_User_Form.Button1Click(Sender: TObject);
begin
  //Comprueba que las claves sean iguales.
  if Clave_Edit.Text = Confirm_Clave_Edit.Text then
  begin
    //Llamado al procedimiento que guarda los datos en la tabla usuario_usuario.
    DatosUsuario(Nombre_Edit.Text,Apellido_Edit.Text,DNI_Edit.Text,Type_User,ComisionUser);
    //Verifica que se hayan guardado los datos en la tabla usuario_usuario.
    if ModuloDatos.UniQueryNuevo_Usuario.RowsAffected <> 0 then
    begin
      {Sentencia SQL para crear usuario en el motor de base de datos.}
      with ModuloDatos.UniQueryCreate_User do
      begin
        SQL.Clear;
        SQL.Add('CREATE USER '''+Nombre_U_Edit.Text+'''@'''+Host_Edit.Text+''' IDENTIFIED BY '''+Clave_Edit.Text+''' ');
        Execute;
      end;
      {Sentecia SQL para asignar permisos al usuario creado anteriormente.}
      with ModuloDatos.UniQueryGrant_User do
      begin
        SQL.Clear;
        SQL.Add('GRANT SELECT, INSERT, UPDATE, DELETE ');
        SQL.Add('ON concejo_.* ');
        SQL.Add('TO '''+Nombre_U_Edit.Text+'''@'''+Host_Edit.Text+'''');
        Execute;
      end;
    end;
  end
  else//En caso de que las contraseñas no sean iguales entonces.
  begin
    ShowMessage('Las Contraseñas No Coiciden. Intente Nuevamente');
    Clave_Edit.Clear;
    Confirm_Clave_Edit.Clear;
  end;
end;

procedure TAlta_User_Form.Button2Click(Sender: TObject);
begin
  Alta_User_Form.Close;
end;

procedure TAlta_User_Form.Com_ComboBoxClick(Sender: TObject);
begin
  {Casos de creacion de usuario donde
  automaticamente se le asigna una comision.}
  {Explicacion: Un usuario administrador que pertenece a una comisión desea crear un
  usuario. El usuario creado debe pertener a la misma comision a la que pertenece el
  usuario administrador de esa comision.}
  case Com_ComboBox.ItemIndex of
  0:
    begin
      ComisionUser := 1;
    end;
  1:
    begin
      ComisionUser := 2;
    end;
  2:
    begin
      ComisionUser := 3;
    end;
  3:
    begin
      ComisionUser := 4;
    end;
  4:
    begin
      ComisionUser := 5;
    end;
  5:
    begin
      ComisionUser := 6;
    end;
  6:
    begin
      ComisionUser := 7;
    end;
  7:
    begin
      ComisionUser := 8;
    end;
  8:
    begin
      ComisionUser := 9;
    end;
  9:
    begin
      ComisionUser := 10;
    end;
  10:
    begin
      ComisionUser := 11;
    end;
  11:
    begin
      ComisionUser := 12;
    end;
  12:
    begin
      ComisionUser := 13;
    end;
  end;
end;

procedure TAlta_User_Form.DatosUsuario(Nombre, Apellido, DNI: String; Tipo,
  Comision: Integer);
begin
  {Instrucciones para la inserccion de datos a la tabla usuario_usuario.}
  with ModuloDatos.UniQueryNuevo_Usuario do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO usuario_usuario (nombre, apellido, dni, usuario, id_comision) ');
    SQL.Add('VALUES (:NOM, :APELL, :DNI, :USER, :COMISION)');
    ParamByName('NOM').AsString := Nombre;
    ParamByName('APELL').AsString := Apellido;
    ParamByName('DNI').AsString := DNI;
    ParamByName('USER').AsInteger := Tipo;
    ParamByName('COMISION').AsInteger := Comision;
    ExecSQL;
  end;
end;

procedure TAlta_User_Form.DNI_EditChange(Sender: TObject);
begin
  Nombre_U_Edit.Text := DNI_Edit.Text;
end;

procedure TAlta_User_Form.FormActivate(Sender: TObject);
begin
  {Casos de creacion de usuario donde
  automaticamente se le asigna una comision.}
  {Explicacion: Un usuario administrador que pertenece a una comisión desea crear un
  usuario. El usuario creado debe pertener a la misma comision a la que pertenece el
  usuario administrador de esa comision.}
  case Sesion_Form.Comision of
  1:
    begin
      Com_ComboBox.ItemIndex := 0;
      Com_ComboBox.OnClick(Sender);
    end;
  2:
    begin
      Com_ComboBox.ItemIndex := 1;
      Com_ComboBox.OnClick(Sender);
    end;
  3:
    begin
      Com_ComboBox.ItemIndex := 2;
      Com_ComboBox.OnClick(Sender);
    end;
  4:
    begin
      Com_ComboBox.ItemIndex := 3;
      Com_ComboBox.OnClick(Sender);
    end;
  5:
    begin
      Com_ComboBox.ItemIndex := 4;
      Com_ComboBox.OnClick(Sender);
    end;
  6:
    begin
      Com_ComboBox.ItemIndex := 5;
      Com_ComboBox.OnClick(Sender);
    end;
  7:
    begin
      Com_ComboBox.ItemIndex := 6;
      Com_ComboBox.OnClick(Sender);
    end;
  8:
    begin
      Com_ComboBox.ItemIndex := 7;
      Com_ComboBox.OnClick(Sender);
    end;
  9:
    begin
      Com_ComboBox.ItemIndex := 8;
      Com_ComboBox.OnClick(Sender);
    end;
  10:
    begin
      Com_ComboBox.ItemIndex := 9;
      Com_ComboBox.OnClick(Sender);
    end;
  11:
    begin
      Com_ComboBox.ItemIndex := 10;
      Com_ComboBox.OnClick(Sender);
   end;
  12:
    begin
      Com_ComboBox.ItemIndex := 11;
      Com_ComboBox.OnClick(Sender);
    end;
  13:
    begin
      Com_ComboBox.ItemIndex := 12;
      Com_ComboBox.OnClick(Sender);
    end;
  14:
    begin
      Com_ComboBox.ItemIndex := 13;
      Com_ComboBox.OnClick(Sender);
    end;
  end;
end;

procedure TAlta_User_Form.Tipo_U_ComboBoxSelect(Sender: TObject);
begin
  {Casos de tipo de usuarios.}
  {Explicacion: Un usuario administrador que pertenece a una comision, unicamente
  puede crear usuarios comunes.}
  case Tipo_U_ComboBox.ItemIndex of
  0:
    begin
      Type_User := 0;
    end;
  end;
end;

end.
