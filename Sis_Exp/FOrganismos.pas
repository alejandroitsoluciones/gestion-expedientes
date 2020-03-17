unit FOrganismos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TOrg_Form = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Nombre_Org_Edit: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Nombre_Org_EditChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cod : Integer;
  end;

var
  Org_Form: TOrg_Form;

implementation

{$R *.dfm}

uses MDatos, FAlta_Exp;

procedure TOrg_Form.Button1Click(Sender: TObject);
begin
  if Cod <> 0 then
  begin
    N_Expediente_Form.Num_Org_Edit.Text := IntToStr(Cod);
    Org_Form.Close;
  end
  else
  begin
    ShowMessage('Elija Una Organizacion De La Grilla.');
  end;
end;

procedure TOrg_Form.Button2Click(Sender: TObject);
begin
  Org_Form.Close;
end;

procedure TOrg_Form.DBGrid1CellClick(Column: TColumn);
begin
  Cod := DBGrid1.DataSource.DataSet.Fields.FieldByName('codigo_org').AsInteger;
end;

procedure TOrg_Form.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Cod := DBGrid1.DataSource.DataSet.Fields.FieldByName('codigo_org').AsInteger;
end;

procedure TOrg_Form.FormActivate(Sender: TObject);
begin
  ModuloDatos.UniTableOrganismos.Active := True;
  Cod := 0;
end;

procedure TOrg_Form.Nombre_Org_EditChange(Sender: TObject);
begin
  if Nombre_Org_Edit.Text = '' then
  begin
    DBGrid1.DataSource := ModuloDatos.UniDataSourceOrganismos;
  end
  else
  begin
    with ModuloDatos.UniQueryBusOrg do
    begin
      SQL.Clear;
      SQL.Text := 'SELECT * FROM organismos WHERE nombre_org like '+QuotedStr(Nombre_Org_Edit.Text+'%')+'';
      Open;
      Active := True;
    end;
    DBGrid1.DataSource := ModuloDatos.UniDataSourceBusOrg;
  end;
end;

end.
