unit FAlta_Exp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TN_Expediente_Form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Num_Exp_Edit: TEdit;
    Fecha_Ini_Exp_Edit: TEdit;
    Cant_Exp_Edit: TEdit;
    Label7: TLabel;
    Tipo_Exp_ComboBox: TComboBox;
    Ref_Exp_Memo: TMemo;
    Obs_Exp_Memo: TMemo;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Nombre_Ini_Edit: TEdit;
    Apellido_Ini_Edit: TEdit;
    DNI_Edit: TEdit;
    Direccion_Ini_Edit: TEdit;
    Barrio_Ini_Edit: TEdit;
    Tipo_Ini_Edit: TEdit;
    Button1: TButton;
    Button2: TButton;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Timer1: TTimer;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Num_Org_Edit: TEdit;
    Nom_Org_Edit: TEdit;
    SpeedButton3: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Tipo_Exp_ComboBoxSelect(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure GuardarIni_X_Exp (Iniciador, Adjunto : Integer);
    procedure GuardarExp (Fecha_Iniciado : TDateTime; Referencia, Observaciones : String; Numero_Expediente, Tipo_Exp, Estado_Exp, Estado, Org, Cant_Folios : Integer);
    procedure PrimerMovimiento (FechaYHora: TDateTime; ComActual, ComAnterior: Integer);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Num_Org_EditChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Fila1, Fila2, Ini_Ini, Ini, Fecha_,Org, T_Exp, Mensaje, Num_Exp, ID_Exp_Max, ID_Exp : Integer;
    Fecha, Fecha_Hora, Fecha_Ini_Exp : TDateTime;
    Hora : TTime
  end;

var
  N_Expediente_Form: TN_Expediente_Form;

implementation

{$R *.dfm}

uses MDatos, FIniciador, FOrganismos;

procedure TN_Expediente_Form.Button1Click(Sender: TObject);
begin
  Ini_Form := TIni_Form.Create(Self);
  Ini_Form.ShowModal;
end;

procedure TN_Expediente_Form.Button2Click(Sender: TObject);
begin
  Button3.Visible := False;
  Button4.Visible := True;

  StringGrid1.Cells[0,0]:= 'Cod';
  StringGrid1.Cells[1,0]:= 'Nombre';
  StringGrid1.Cells[2,0]:= 'Apellido';

  StringGrid2.Cells[0,0]:= 'Cod';
  StringGrid2.Cells[1,0]:= 'Nombre';
  StringGrid2.Cells[2,0]:= 'Apellido';

  with ModuloDatos.UniQueryConcejales do
  begin
    ParamByName('INICIADOR').AsInteger := Ini_Ini;
    Open;
    Execute;
    Active := True;
  end;
  if ModuloDatos.UniQueryConcejales.IsEmpty then
  begin
    ShowMessage('No Hay Resultado De Consulta.');
  end
  else
  begin
    while not ModuloDatos.UniQueryConcejales.Eof do
    begin
      StringGrid1.Cells[0,StringGrid1.RowCount-1] := IntToStr(ModuloDatos.UniQueryConcejales.Fields.FieldByName('id_ini').AsInteger);
      StringGrid1.Cells[1,StringGrid1.RowCount-1] := ModuloDatos.UniQueryConcejales.Fields.FieldByName('nombre_ini').AsString;
      StringGrid1.Cells[2,StringGrid1.RowCount-1] := ModuloDatos.UniQueryConcejales.Fields.FieldByName('apellido_ini').AsString;
      StringGrid1.RowCount := StringGrid1.RowCount + 1;
      ModuloDatos.UniQueryConcejales.Next;
    end;
    GroupBox3.Visible := True;
  end;
end;

procedure TN_Expediente_Form.Button3Click(Sender: TObject);
begin
  GuardarExp(Fecha,Ref_Exp_Memo.Lines.Text,Obs_Exp_Memo.Lines.Text,StrToInt(Num_Exp_Edit.Text),T_Exp,1,0,Org,StrToInt(Cant_Exp_Edit.Text));
  if ModuloDatos.UniQueryInsertExp.RowsAffected <> 0 then
  begin
    PrimerMovimiento(Fecha_Hora,14,14);
    if ModuloDatos.UniQueryInsertMovimiento.RowsAffected <> 0 then
    begin
      GuardarIni_X_Exp(Ini_Form.ID_Ini,1);
      if ModuloDatos.UniQueryInsertIni_X_Exp.RowsAffected <> 0 then
      begin
        ModuloDatos.UniQueryExpedientesNuevos.Refresh;
        with ModuloDatos.UniQuerySelectExp do
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM expediente WHERE num_exp = :Exp');
          ParamByName('Exp').AsInteger := StrToInt(Num_Exp_Edit.Text);
          Open;
          Active := True;
        end;
        with ModuloDatos.UniQuerySelectIniReport do
        begin
          SQL.Clear;
          SQL.Add('SELECT expediente.num_exp, iniciador.* FROM ini_x_exp INNER JOIN expediente ON ini_x_exp.id_exp = expediente.id_exp INNER JOIN iniciador ON ini_x_exp.id_ini = iniciador.id_ini WHERE expediente.num_exp = :PARAMETRO');
          ParamByName('PARAMETRO').AsInteger := StrToInt(Num_Exp_Edit.Text);
          Open;
          Active := True;
        end;
        if (ModuloDatos.UniQuerySelectExp.RecordCount <> 0) and
        (ModuloDatos.UniQuerySelectIniReport.RecordCount <> 0) then
        begin
          ModuloDatos.FRXReport_Exp.PrepareReport();
          ModuloDatos.FRXReport_Exp.ShowReport();
        end;
        ShowMessage('La Operacion Ha Sido Exitosa.');
        N_Expediente_Form.Close;
      end
      else
      begin
        ShowMessage('Error.');
      end;
    end;
  end;
end;

procedure TN_Expediente_Form.Button4Click(Sender: TObject);
var
  I3 : Integer;
begin
  //Llamada al procedimiento para insertar el dato en la tabla de expediente.
  GuardarExp(Fecha,Ref_Exp_Memo.Lines.Text,Obs_Exp_Memo.Lines.Text,StrToInt(Num_Exp_Edit.Text),T_Exp,1,0,Org,StrToInt(Cant_Exp_Edit.Text));
  //Confirma si se guardo el expediente.
  if ModuloDatos.UniQueryInsertExp.RowsAffected <> 0 then
  begin
    //Llamada al procedimiento para registrarlo en Mesa De Entrada.
    PrimerMovimiento(Fecha_Hora,14,14);
    //Confirma si se guardo el Movimiento.
    if ModuloDatos.UniQueryInsertMovimiento.RowsAffected <> 0 then
    begin
      //Llamada al procedimiento para relacionar el expediente con el iniciador. (datos que se guardan en tabla ini_x_exp).
      //Donde el iniciador es el principal.
      GuardarIni_X_Exp(Ini_Form.ID_Ini,1);
      //Confirma si se guardaron los datos en tabla ini_x_exp.
      if ModuloDatos.UniQueryInsertIni_X_Exp.RowsAffected <> 0 then
      begin
        //Ciclo for para agregar los iniciadores adjuntos
        for I3 := 1 to StringGrid2.RowCount-2 do
        begin
          //Llamado al procedimiento GuardarIni_X_Exp para que insertar los datos en tabla ini_x_exp
          GuardarIni_X_Exp(StrToInt(StringGrid2.Cells[0,I3]),2);
          //Se le resta la ultima fila al StringGrid.
          StringGrid2.RowCount := StringGrid2.RowCount -1;
        end;
        //Confirma si se ejecuto la insercion correctamente.
        if ModuloDatos.UniQueryInsertIni_X_Exp.RowsAffected <> 0 then
        begin
          //Refrescar el Query de Expedientes nuevos. (Actualiza los datos en la grilla de Expedientes nuevos.)
          ModuloDatos.UniQueryExpedientesNuevos.Refresh;
          {Reporte}
          //Se sacan los datos del expediente.
          with ModuloDatos.UniQuerySelectExp do
          begin
            SQL.Clear;
            SQL.Add('SELECT * FROM expediente WHERE num_exp = :Exp');
            ParamByName('Exp').AsInteger := StrToInt(Num_Exp_Edit.Text);
            Open;
            Active := True;
          end;
          //Consulta para sacar datos de los iniciadores adjuntos al expediente.
          with ModuloDatos.UniQuerySelectIniReport do
          begin
            SQL.Clear;
            SQL.Add('SELECT expediente.num_exp, iniciador.* FROM ini_x_exp INNER JOIN expediente ON ini_x_exp.id_exp = expediente.id_exp INNER JOIN iniciador ON ini_x_exp.id_ini = iniciador.id_ini WHERE expediente.num_exp = :PARAMETRO');
            ParamByName('PARAMETRO').AsInteger := StrToInt(Num_Exp_Edit.Text);
            Open;
            Active := True;
          end;
          //Confima que los Query anteores sean distinto de 0
          if (ModuloDatos.UniQuerySelectExp.RecordCount <> 0) and
          (ModuloDatos.UniQuerySelectIniReport.RecordCount <> 0) then
          begin
            //Se Prepara y Muestra el reporte.
            ModuloDatos.FRXReport_Exp.PrepareReport();
            ModuloDatos.FRXReport_Exp.ShowReport();
          end;
          ShowMessage('La Operacion Ha Sido Exitosa.');
          N_Expediente_Form.Close;
        end
        else
        begin
          ShowMessage('Error.');
        end;
      end
      else
      begin
        ShowMessage('Error, Ini 1');
      end;
    end
    else
    begin
      ShowMessage('Error, Mov');
    end;
  end
  else
  begin
    ShowMessage('Error, Exp');
  end;
end;

procedure TN_Expediente_Form.Button5Click(Sender: TObject);
begin
  N_Expediente_Form.Close;
end;

procedure TN_Expediente_Form.FormActivate(Sender: TObject);
var
  Dia1, Mes1, Año1, Dia2, Mes2, Año2 : Word;
begin
{-------------------------------------------------------------------------------}
  //Instrucciones para sacar el numero del ultimo expediente.
  with ModuloDatos.UniQuerySelect1Expedientes do
  begin
    SQL.Clear;
    SQL.Add('SELECT max(id_exp), max(num_exp) FROM expediente');
    Open;
    ID_Exp_Max := Fields.FieldByName('max(id_exp)').AsInteger;
    Num_Exp := Fields.FieldByName('max(num_exp)').AsInteger;
  end;

  with ModuloDatos.UniQuerySelect2Expedientes do
  begin
    SQL.Clear;
    SQL.Add('SELECT fecha_ini_exp FROM expediente WHERE id_exp = :ID_EXP');
    ParamByName('ID_EXP').AsInteger := ID_Exp_Max;
    Open;
    Fecha_Ini_Exp := Fields.FieldByName('fecha_ini_exp').AsDateTime;
  end;

  DecodeDate(Fecha_Ini_Exp, Año1, Mes1, Dia1);

  DecodeDate(Now, Año2, Mes2, Dia2);

  if Año1 < Año2 then
  begin
    Num_Exp := 1;
    Num_Exp_Edit.Text := IntToStr(Num_Exp);
  end
  else
  begin
    Num_Exp := Num_Exp + 1;
    Num_Exp_Edit.Text := IntToStr(Num_Exp);
  end;

  Num_Exp_Edit.Enabled := False;
  Fecha_Ini_Exp_Edit.Enabled := False;
{-------------------------------------------------------------------------------}
end;

procedure TN_Expediente_Form.GuardarExp(Fecha_Iniciado: TDateTime; Referencia,
  Observaciones: String; Numero_Expediente, Tipo_Exp, Estado_Exp, Estado, Org,
  Cant_Folios: Integer);
begin
  with ModuloDatos.UniQueryInsertExp do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO expediente (num_exp, fecha_ini_exp, referencia_exp, observaciones_exp, id_tipo_exp, id_estado_exp, estado_pen_acp, id_org, cantidad_folios) ');
    SQL.Add('VALUES (:NUM_EXP, :FECHA_INI_EXP, :REFERENCIA_EXP, :OBSERVACIONES_EXP, :ID_TIPO_EXP, :ID_ESTADO_EXP, :ESTADO_PEN_ACP, :ID_ORG, :CANTIDAD_FOLIOS)');
    ParamByName('NUM_EXP').AsInteger := Numero_Expediente;
    ParamByName('FECHA_INI_EXP').AsDate := Fecha_Iniciado;
    ParamByName('REFERENCIA_EXP').AsString := Referencia;
    ParamByName('OBSERVACIONES_EXP').AsString := Observaciones;
    ParamByName('ID_TIPO_EXP').AsInteger := Tipo_Exp;
    ParamByName('ID_ESTADO_EXP').AsInteger := Estado_Exp;
    ParamByName('ESTADO_PEN_ACP').AsInteger := Estado;
    ParamByName('ID_ORG').AsInteger := Org;
    ParamByName('CANTIDAD_FOLIOS').AsInteger := Cant_Folios;
    ExecSQL;
  end;
end;

procedure TN_Expediente_Form.GuardarIni_X_Exp(Iniciador, Adjunto: Integer);
var
  Exp : Integer;
begin
  with ModuloDatos.UniQuerySelect2Expedientes do
  begin
    SQL.Clear;
    SQL.Add('SELECT max(id_exp) FROM expediente');
    Open;
    Exp := Fields.FieldByName('max(id_exp)').AsInteger;
  end;

  with ModuloDatos.UniQueryInsertIni_X_Exp do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO ini_x_exp (id_ini, id_exp, id_adjunto) ');
    SQL.Add('VALUES (:INI, :EXP, :ADJ)');
    ParamByName('INI').AsInteger := Iniciador;
    ParamByName('EXP').AsInteger := Exp;
    ParamByName('ADJ').AsInteger := Adjunto;
    ExecSQL;
  end;
end;

procedure TN_Expediente_Form.Num_Org_EditChange(Sender: TObject);
begin
  //Instrucciones para la busqueda de organismos a travez del codigo de org.
  if Num_Org_Edit.Text = '' then
  begin
    Num_Org_Edit.Text := '135';
  end
  else
  begin
    with ModuloDatos.UniQueryBusOrg do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM organismos WHERE codigo_org like '+Num_Org_Edit.Text+'');
      Open;
      Nom_Org_Edit.Text := Fields.FieldByName('nombre_org').AsString;
      Org := Fields.FieldByName('id_org').AsInteger;
    end;
  end;
end;

procedure TN_Expediente_Form.PrimerMovimiento(FechaYHora: TDateTime; ComActual, ComAnterior: Integer);
var
  Expediente : Integer;
begin
  with ModuloDatos.UniQuerySelect2Expedientes do
  begin
    SQL.Clear;
    SQL.Add('SELECT max(id_exp) FROM expediente');
    Open;
    Expediente := Fields.FieldByName('max(id_exp)').AsInteger;
  end;

  with ModuloDatos.UniQueryInsertMovimiento do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO movimiento (fecha_movimiento, id_exp, id_comision_actual, id_comision_anterior) ');
    SQL.Add('VALUES (:FECHA_M, :ID_E, :COM_ACTUAL, :COM_ANTERIOR)');
    ParamByName('FECHA_M').AsDateTime := FechaYHora;
    ParamByName('ID_E').AsInteger := Expediente;
    ParamByName('COM_ACTUAL').AsInteger := ComActual;
    ParamByName('COM_ANTERIOR').AsInteger := ComAnterior;
    ExecSQL;
  end;
end;

procedure TN_Expediente_Form.SpeedButton1Click(Sender: TObject);
var
  I1 : Integer;
begin
  Fila1 := StringGrid1.Row;

  StringGrid2.Cells[0,StringGrid2.RowCount-1]:= StringGrid1.Cells[0,Fila1];
  StringGrid2.Cells[1,StringGrid2.RowCount-1]:= StringGrid1.Cells[1,Fila1];
  StringGrid2.Cells[2,StringGrid2.RowCount-1]:= StringGrid1.Cells[2,Fila1];
  StringGrid2.RowCount := StringGrid2.RowCount+1;

  if not (StringGrid1.Cells[0,Fila1].IsEmpty) and (Fila1 <> 0) then
  begin
    for I1 := Fila1 to StringGrid1.RowCount-1 do
      begin
        StringGrid1.Cells[0,I1]:= StringGrid1.Cells[0,I1+1];
        StringGrid1.Cells[1,I1]:= StringGrid1.Cells[1,I1+1];
        StringGrid1.Cells[2,I1]:= StringGrid1.Cells[2,I1+1];
      end;
    StringGrid1.RowCount := StringGrid1.RowCount-1;
  end;
end;

procedure TN_Expediente_Form.SpeedButton2Click(Sender: TObject);
var
  I2 : Integer;
begin
  Fila2 := StringGrid2.Row;

  StringGrid1.Cells[0,StringGrid1.RowCount-1]:= StringGrid2.Cells[0,Fila2];
  StringGrid1.Cells[1,StringGrid1.RowCount-1]:= StringGrid2.Cells[1,Fila2];
  StringGrid1.Cells[2,StringGrid1.RowCount-1]:= StringGrid2.Cells[2,Fila2];
  StringGrid1.RowCount := StringGrid1.RowCount+1;

  if not (StringGrid2.Cells[0,Fila2].IsEmpty) and (Fila2 <> 0) then
  begin
    for I2 := Fila2 to StringGrid1.RowCount-1 do
      begin
        StringGrid2.Cells[0,I2]:= StringGrid2.Cells[0,I2+1];
        StringGrid2.Cells[1,I2]:= StringGrid2.Cells[1,I2+1];
        StringGrid2.Cells[2,I2]:= StringGrid2.Cells[2,I2+1];
      end;
    StringGrid2.RowCount := StringGrid2.RowCount-1;
  end;
end;

procedure TN_Expediente_Form.SpeedButton3Click(Sender: TObject);
begin
  Org_Form := TOrg_Form.Create(Self);
  Org_Form.ShowModal;
end;

procedure TN_Expediente_Form.Timer1Timer(Sender: TObject);
begin
  Fecha_Ini_Exp_Edit.Text := DateToStr(Now);
  Fecha := (Now);
  Hora := (Now);
  Fecha_Hora := (Now);
end;

procedure TN_Expediente_Form.Tipo_Exp_ComboBoxSelect(Sender: TObject);
begin
  case Tipo_Exp_ComboBox.ItemIndex of
  0:
    begin
      T_Exp := 1;
    end;
  1:
    begin
      T_Exp := 2;
    end;
  2:
    begin
      T_Exp := 3;
    end;
  3:
    begin
      T_Exp := 4;
    end;
  4:
    begin
      T_Exp := 5;
    end;
  5:
    begin
      T_Exp := 6;
    end;
  6:
    begin
      T_Exp := 7;
    end;
  end;
end;

end.
