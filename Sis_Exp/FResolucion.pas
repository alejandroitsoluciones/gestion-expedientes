unit FResolucion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TResolucion_Form = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Num_Exp_Edit: TEdit;
    Fecha_Edit: TEdit;
    Folios_Edit: TEdit;
    Ref_Memo: TMemo;
    Obs_Memo: TMemo;
    Estado_ComboBox: TComboBox;
    Button1: TButton;
    Button2: TButton;
    procedure Estado_ComboBoxSelect(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Resolucion (R : String; Estado_, Exp : Integer);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Estado : Integer;

  end;

var
  Resolucion_Form: TResolucion_Form;

implementation

{$R *.dfm}

uses MDatos, FExpedientes;

procedure TResolucion_Form.Button1Click(Sender: TObject);
begin
  if (Estado <> 0) and (Obs_Memo.Lines.Text <> '') then
  begin
    Resolucion(Obs_Memo.Lines.Text,Estado,Expedientes_Form.ID_Expediente);
    if ModuloDatos.UniQueryUpdateResolucion.RowsAffected <> 0 then
    begin
      ShowMessage('La Resolución Fue Guardada Correctamente.');
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Elejir Un Estado o Completar Las Observaciones.');
  end;
end;

procedure TResolucion_Form.Button2Click(Sender: TObject);
begin
  Resolucion_Form.Close;
end;

procedure TResolucion_Form.Estado_ComboBoxSelect(Sender: TObject);
begin
  case Estado_ComboBox.ItemIndex of
  0:
    begin
      Estado := 2;
    end;
  1:
    begin
      Estado := 3;
    end;
  end;
end;

procedure TResolucion_Form.Resolucion(R : String; Estado_, Exp: Integer);
begin
  with ModuloDatos.UniQueryUpdateResolucion do
  begin
    SQL.Clear;
    SQL.Add('UPDATE expediente SET estado_exp = :EST, observaciones_exp = :RESOLUCION WHERE id_exp = :ID');
    ParamByName('EST').AsInteger := Estado_;
    ParamByName('RESOLUCION').AsString := R;
    ParamByName('ID').AsInteger := Exp;
    ExecSQL;
  end;
end;

end.
