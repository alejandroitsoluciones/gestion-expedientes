unit FSesion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TSesion_Form = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Usuario_Edit: TEdit;
    Clave_Edit: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Comision : Integer;
    Usuario : Integer;
  end;

var
  Sesion_Form: TSesion_Form;

implementation

{$R *.dfm}

uses MDatos, FPrincipal, FMovimiento;

procedure TSesion_Form.Button1Click(Sender: TObject);
begin
  //Confirma que los campos de inicio de sesion no esten vacios.
  if (Usuario_Edit.Text <> '') and (Clave_Edit.Text <> '') then
  begin
    try
      //Conexion con servidor y base de datos.
      ModuloDatos.UniConnectionConcejo.Username := Usuario_Edit.Text;
      ModuloDatos.UniConnectionConcejo.Password := Clave_Edit.Text;
      ModuloDatos.UniConnectionConcejo.Server := 'localhost';
      ModuloDatos.UniConnectionConcejo.Database := 'concejo_';
      ModuloDatos.UniConnectionConcejo.Port := 3306;
      ModuloDatos.UniConnectionConcejo.Connected := True;
      //Se asegura que la conexion fue exitosa.
      if ModuloDatos.UniConnectionConcejo.Connected = True then
      begin
        ShowMessage('Bienvenido Al Sistema.');
        //Consulta para la validacion de usuario en la base de datos.
        with ModuloDatos.UniQuerySesion1 do
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM usuario_usuario WHERE dni = :NUM');
          ParamByName('NUM').AsString := Usuario_Edit.Text;
          Open;
        end;
          if ModuloDatos.UniQuerySesion1.RecordCount <> 0 then
          begin
            //Se extrae de la consulta anterior la comision a la que el usuario pertenece y el tipo de usuario.
            Comision := ModuloDatos.UniQuerySesion1.Fields.FieldByName('id_comision').AsInteger;
            Usuario := ModuloDatos.UniQuerySesion1.Fields.FieldByName('usuario').AsInteger;
            //Bloque case que restringe el acceso al menu principal.
            case Comision of
            1:
              begin
                //Se crea el formulario principal.
                Principal_Form := TPrincipal_Form.Create(Self);
                //Se asigna al label el nombre del usuario extraido de la consulta anterior
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                //Averigua si es usuario administrador, bloquea o desbloquea la opcion en el menu "Usuarios".
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                //Restricciones de menu en funcion al usuario.
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            2:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            3:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            4:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            5:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            6:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            7:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            8:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            9:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            10:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            11:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            12:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            13:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[0].Items[0].Enabled := False;
              end;
            14:
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
                if Usuario <> 0 then
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := True;
                end
                else
                begin
                  Principal_Form.MainMenu1.Items.Items[1].Enabled := False;
                end;
                Principal_Form.MainMenu1.Items.Items[0].Items[1].Enabled := False;
                Principal_Form.MainMenu1.Items.Items[0].Items[2].Enabled := False;
              end;
            15://Usuario administrador.
              begin
                Principal_Form := TPrincipal_Form.Create(Self);
                Principal_Form.Label2.Caption := ModuloDatos.UniQuerySesion1.Fields.FieldByName('nombre').AsString;
              end;
            end;
          end;
        //Se cierra el formulario de sesion.
        Sesion_Form.DestroyWindowHandle;
        //Se muestra el formulario principal creado anteriormente.
        Principal_Form.ShowModal;
      end;
     except
     //En caso excepcion al conectar con el servidor y base de datos la aplicacion muestra el mensaje de error.
      on E: Exception do
      begin
        Application.MessageBox('Error Al Iniciar Sesion. Usuario o Contraseña Invalida','Error');
        Usuario_Edit.Clear;
        Clave_Edit.Clear;
      end;
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Que Los Campos No Esten Vacios.');
  end;
end;

procedure TSesion_Form.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TSesion_Form.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    Clave_Edit.PasswordChar := #0
  else
    Clave_Edit.PasswordChar := '*';
end;

procedure TSesion_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
