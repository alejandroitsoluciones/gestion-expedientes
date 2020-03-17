unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Imaging.GIFImg, ShellAPI;

type
  TPrincipal_Form = class(TForm)
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Ayuda1: TMenuItem;
    Sesion1: TMenuItem;
    CerrarSesion1: TMenuItem;
    Expedientes1: TMenuItem;
    ExpedientesNuevos1: TMenuItem;
    Comisiones1: TMenuItem;
    ExpedientesDisponibles1: TMenuItem;
    Usuarios1: TMenuItem;
    NuevoUsuario1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    Image1: TImage;
    Organismos1: TMenuItem;
    ManualDeUsuario1: TMenuItem;
    Opciones1: TMenuItem;
    HacerBackUp1: TMenuItem;
    procedure CerrarSesion1Click(Sender: TObject);
    procedure ExpedientesNuevos1Click(Sender: TObject);
    procedure Comisiones1Click(Sender: TObject);
    procedure ExpedientesDisponibles1Click(Sender: TObject);
    procedure NuevoUsuario1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Organismos1Click(Sender: TObject);
    procedure ManualDeUsuario1Click(Sender: TObject);
    procedure HacerBackUp1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal_Form: TPrincipal_Form;

implementation

{$R *.dfm}

uses FSesion, FNuevo_Exp, FComision, FExpedientes, MDatos, FAlta_User,
  FOrganismo;

procedure TPrincipal_Form.CerrarSesion1Click(Sender: TObject);
begin
  ModuloDatos.UniConnectionConcejo.Disconnect;

  if ModuloDatos.UniConnectionConcejo.Connected = True then
  begin
    ShowMessage('Error Al Cerrar Sesion.');
  end
  else
  begin
    ShowMessage('Se Cerro Sesion Correctamente.');
    Principal_Form.DestroyWindowHandle;
    Sesion_Form := TSesion_Form.Create(Application);
    Sesion_Form.ShowModal;
  end;
end;

procedure TPrincipal_Form.Comisiones1Click(Sender: TObject);
begin
  Comisiones_Form := TComisiones_Form.Create(Self);
  Comisiones_Form.ShowModal;
end;

procedure TPrincipal_Form.ExpedientesDisponibles1Click(Sender: TObject);
begin
  Expedientes_Form := TExpedientes_Form.Create(Self);
  case Sesion_Form.Comision of
  1:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 0;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  2:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 1;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  3:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 2;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  4:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 3;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  5:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 4;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  6:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 5;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  7:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 6;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  8:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 7;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  9:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 8;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  10:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 9;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  11:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 10;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  12:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 11;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  13:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 12;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := False;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  14:
    begin
      Expedientes_Form.Com_ComboBox.ItemIndex := 13;
      Expedientes_Form.Com_ComboBox.OnClick(Sender);
      Expedientes_Form.Button2.Enabled := True;
      Expedientes_Form.Com_ComboBox.Enabled := False;
    end;
  end;
  Expedientes_Form.ShowModal;
end;

procedure TPrincipal_Form.ExpedientesNuevos1Click(Sender: TObject);
begin
  Exp_Nuevo_Form := TExp_Nuevo_Form.Create(Self);
  Exp_Nuevo_Form.ShowModal;
end;

procedure TPrincipal_Form.HacerBackUp1Click(Sender: TObject);
begin
  ShellExecute(Principal_Form.Handle,'OPEN','script_backup.bat', nil,'C:\Users\Alejandro\Desktop\Cosas Escritorio\Sist\Sis_Exp\Scripts',SW_SHOW);
end;

procedure TPrincipal_Form.ManualDeUsuario1Click(Sender: TObject);
begin
  //Temporalmente Quedara Con la Direccion De C:\Program Files (x86)\Sistema De Gestion y Seguimiento De Expedientes\Sis_Exp\HTML5ManualUsuario\public_html
  ShellExecute(Principal_Form.Handle,'OPEN','index.html', nil,'C:\Program Files (x86)\Sistema De Gestion y Seguimiento De Expedientes\Sis_Exp\HTML5ManualUsuario\public_html',SW_SHOW);
end;

procedure TPrincipal_Form.NuevoUsuario1Click(Sender: TObject);
begin
  Alta_User_Form := TAlta_User_Form.Create(Self);
  Alta_User_Form.ShowModal;
end;

procedure TPrincipal_Form.Organismos1Click(Sender: TObject);
begin
  Organismos_Form := TOrganismos_Form.Create(Self);
  Organismos_Form.ShowModal;
end;

procedure TPrincipal_Form.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(Now);
end;

end.
