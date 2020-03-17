unit FControlFolios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TCtrl_Folios_Form = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Ctrl_F_Edit: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ctrl_Folios_Form: TCtrl_Folios_Form;

implementation

{$R *.dfm}

uses FMovimiento;

procedure TCtrl_Folios_Form.Button1Click(Sender: TObject);
begin
  Mov_Form.StringGrid2.Cells[2,Mov_Form.StringGrid2.RowCount-1] := Ctrl_F_Edit.Text;
  Close;
end;

end.
