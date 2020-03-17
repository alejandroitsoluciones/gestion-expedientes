unit FOrganismo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TOrganismos_Form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    N_Org_Edit: TEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure N_Org_EditChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_ORG : Integer;
  end;

var
  Organismos_Form: TOrganismos_Form;

implementation

{$R *.dfm}

uses MDatos, FAlta_Mod_Org;

procedure TOrganismos_Form.Button1Click(Sender: TObject);
begin
  Opc_Org_Form := TOpc_Org_Form.Create(Self);
  Opc_Org_Form.Caption := 'Nuevo Organismo';
  Opc_Org_Form.ShowModal;
end;

procedure TOrganismos_Form.Button2Click(Sender: TObject);
begin
  if ID_ORG <> 0 then
  begin
    Opc_Org_Form := TOpc_Org_Form.Create(Self);
    Opc_Org_Form.Caption := 'Modificar Organismo';

    with ModuloDatos.UniQuerySelect1Org do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM organismos WHERE id_org = :ID');
      ParamByName('ID').AsInteger := ID_ORG;
      Open;
    end;

    Opc_Org_Form.Cod_Edit.Text := IntToStr(ModuloDatos.UniQuerySelect1Org.Fields.FieldByName('codigo_org').AsInteger);
    Opc_Org_Form.Nom_Edit.Text := ModuloDatos.UniQuerySelect1Org.Fields.FieldByName('nombre_org').AsString;
    Opc_Org_Form.Button1.Visible := False;
    Opc_Org_Form.Button2.Visible := True;
    Opc_Org_Form.ShowModal;
  end
  else
  begin
    ShowMessage('Elija Un Organismo De La Grilla.');
  end;
end;

procedure TOrganismos_Form.Button3Click(Sender: TObject);
begin
  if ID_ORG <> 0 then
  begin
    with ModuloDatos.UniQueryDeleteOrganismo do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM organismos WHERE id_org = :ID');
      ParamByName('ID').AsInteger := ID_ORG;
      ExecSQL;
    end;

    if ModuloDatos.UniQueryDeleteOrganismo.RowsAffected <> 0 then
    begin
      ModuloDatos.UniQueryOrganismos.Refresh;
      ShowMessage('Se Elimino Correctamente El Organismo.');
    end
    else
    begin
      ShowMessage('Error Al Eliminar El Organismo.');
    end;
  end
  else
  begin
    ShowMessage('Elija Un Organismo De La Grilla Para Eliminar.');
  end;
end;

procedure TOrganismos_Form.Button4Click(Sender: TObject);
begin
  Organismos_Form.Close;
end;

procedure TOrganismos_Form.DBGrid1CellClick(Column: TColumn);
begin
  ID_ORG := ModuloDatos.UniQueryOrganismos.Fields.FieldByName('id_org').AsInteger;
end;

procedure TOrganismos_Form.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ID_ORG := ModuloDatos.UniQueryOrganismos.Fields.FieldByName('id_org').AsInteger;
end;

procedure TOrganismos_Form.FormActivate(Sender: TObject);
begin
  ID_ORG := 0;
  with ModuloDatos.UniQueryOrganismos do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM organismos');
    Open;
  end;
end;

procedure TOrganismos_Form.N_Org_EditChange(Sender: TObject);
begin
  if N_Org_Edit.Text = '' then
  begin
    DBGrid1.DataSource := ModuloDatos.UniDataSourceABMOrganismos;
  end
  else
  begin
    with ModuloDatos.UniQueryBusquedaOrganismos do
    begin
      SQL.Clear;
      SQL.Text := 'SELECT * FROM organismos WHERE nombre_org like '+QuotedStr(N_Org_Edit.Text+'%')+'';
      Open;
      Active := True;
    end;
    DBGrid1.DataSource := ModuloDatos.UniDataSourceBusquedaOrganismos;
  end;
end;

end.
