unit FMovimiento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TMov_Form = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Timer1: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox2Select(Sender: TObject);
    procedure CtrlExp (Exp1,Exp2 : Integer);
    procedure MovCab (Cab1 : Integer);
    procedure MovAdj (Cab2 : Integer);
    procedure QCab (Cab3 : Integer);
    procedure QAdj (Cab4 : Integer);
    procedure InsertMov (Fecha_Y_Hora : TDateTime; ComAct, ComAnt, ID_Exp : Integer);
    procedure UpdateExpMov (Exp, Estado : Integer);
    procedure UpdateFolios(Cant, Exp : Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    F1, F2 : Integer;
    ComisionActualMov, ComisionAnteriorMov : Integer;
    Mensaje, Cabecera, Adjunto : Integer;
    Fecha_Hora : TDateTime;
  end;

var
  Mov_Form: TMov_Form;

implementation

{$R *.dfm}

uses MDatos, FExpedientes, FControlFolios;

procedure TMov_Form.Button1Click(Sender: TObject);
var
  I : Integer;
begin
  //Verifica que la comision actual se la misma a la que el usuario pertentece.
  if ComisionActualMov <> 0 then
  begin
    //Verifica que el movimiento se realice a una comision distinta a la que el usuario pertenece.
    if ComisionAnteriorMov <> ComisionActualMov then
    begin
      //Ciclo for para ejecutar definitivamente el movimiento de exp.
      for I := 1 to StringGrid2.RowCount do
      begin
        //Comprueba que la fila del StringGrid sea distinta de vacia para evitar la inserccion de tuplas vacias.
        if not StringGrid2.Cells[0,I].IsEmpty then
        begin
          //Llamada al procedimiento insert para insertar datos en la tabla movimiento.
          InsertMov(Fecha_Hora,ComisionActualMov,ComisionAnteriorMov,StrToInt(StringGrid2.Cells[0,I]));
          //Llamada al procedimiento update para actualizar el campo estado_pen_acp a 0 para que aparezca en la comision destino como pendiente.
          UpdateExpMov(StrToInt(StringGrid2.Cells[0,I]),0);
          //Llamada al procedimiento update para actualizar la cantidad de folios.
          UpdateFolios(StrToInt(StringGrid2.Cells[2,I]),StrToInt(StringGrid2.Cells[0,I]));
          {Consultas para generar reporte de movimiento}
          //Consultas para saber comisiones anteriores y actual.
          with ModuloDatos.UniQueryConsulta1_Report do
          begin
            SQL.Clear;
            SQL.Add('SELECT m1.id_exp, nombre_comision FROM comision INNER JOIN movimiento AS m1 ON id_comision = m1.id_comision_anterior WHERE m1.id_exp = :Exp1 AND m1.fecha_movimiento IN (SELECT max(fecha_movimiento) FROM movimiento AS m2 WHERE m1.id_exp = m2.id_exp)');
            ParamByName('Exp1').AsInteger := StrToInt(StringGrid2.Cells[0,I]);
            Open;
            Active := True;
          end;
          with ModuloDatos.UniQueryConsulta2_Report do
          begin
            SQL.Clear;
            SQL.Add('SELECT m1.id_exp, nombre_comision FROM comision INNER JOIN movimiento AS m1 ON id_comision = m1.id_comision_actual WHERE m1.id_exp = :Exp2 AND m1.fecha_movimiento IN (SELECT max(fecha_movimiento) FROM movimiento AS m2 WHERE m1.id_exp = m2.id_exp)');
            ParamByName('Exp2').AsInteger := StrToInt(StringGrid2.Cells[0,I]);
            Open;
            Active := True;
          end;
        end;
      end;
      //Comprueba que el resultado de las consultas anteriores sean distinto de 0.
      if (ModuloDatos.UniQueryMov.RowsAffected <> 0) and (ModuloDatos.UniQueryUpdateExpMov.RowsAffected <> 0) then
      begin
        //Actualiza el Query de expedientes disponibles (Actualiza la grilla.)
        ModuloDatos.UniQueryExpedientesDisponibles.Refresh;
        //Actualiza el label con la cantidad de expedientes disponibles
        Expedientes_Form.Label4.Caption := IntToStr(ModuloDatos.UniQueryExpedientesDisponibles.RecordCount);
        //Actualiza el Query de expedientes pendientes (Actualiza la grilla.)
        ModuloDatos.UniQueryExp_Pendientes.Refresh;
        //Se ejecuta la consulta con los datos del expediente, iniciador.
        with ModuloDatos.UniQueryConsulta3_Report do
        begin
          SQL.Clear;
          SQL.Add('SELECT m.id_exp, num_exp, fecha_ini_exp, m.fecha_movimiento, referencia_exp, observaciones_exp, tipo_exp, estado_exp.estado_exp, codigo_org, nombre_org, cantidad_folios, iniciador.*, tipo_iniciador.tipo_ini FROM movimiento as m INNER JOIN expediente ');
          SQL.Add('INNER JOIN tipo_expediente INNER JOIN estado_exp INNER JOIN organismos INNER JOIN iniciador INNER JOIN tipo_iniciador INNER JOIN ini_x_exp WHERE m.id_exp = expediente.id_exp AND expediente.id_tipo_exp = tipo_expediente.id_tipo_exp ');
          SQL.Add('AND expediente.id_estado_exp = estado_exp.id_estado_exp AND expediente.id_org = organismos.id_org AND expediente.id_exp = ini_x_exp.id_exp AND iniciador.id_ini = ini_x_exp.id_ini AND iniciador.id_tipo_ini = tipo_iniciador.id_tipo_ini ');
          SQL.Add('AND expediente.estado_pen_acp = 0 AND m.id_comision_actual = :Com AND m.fecha_movimiento = (SELECT max(fecha_movimiento) ');
          SQl.Add('FROM movimiento as m2 WHERE m.id_exp = m2.id_exp) ORDER BY expediente.id_exp');
          ParamByName('Com').AsInteger := ComisionActualMov;
          Open;
          Active := True;
        end;
        ShowMessage('El Movimiento Fue Satisfactorio.');
        //Preparacion y demostracion de reporte.
        ModuloDatos.Report_Movimiento.PrepareReport();
        ModuloDatos.Report_Movimiento.ShowReport();
      end;
    end
    else
    begin
      ShowMessage('Elija Una Comision Destino Distinta A La Que Pertenece.');
    end;
  end
  else
  begin
    ShowMessage('Elija Una Comision Destino.');
  end;
end;

procedure TMov_Form.Button2Click(Sender: TObject);
begin
  Mov_Form.Close;
end;

procedure TMov_Form.ComboBox1Click(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
  0:
    begin
      ComisionAnteriorMov := 1;
    end;
  1:
    begin
      ComisionAnteriorMov := 2;
    end;
  2:
    begin
      ComisionAnteriorMov := 3;
    end;
  3:
    begin
      ComisionAnteriorMov := 4;
    end;
  4:
    begin
      ComisionAnteriorMov := 5;
    end;
  5:
    begin
      ComisionAnteriorMov := 6;
    end;
  6:
    begin
      ComisionAnteriorMov := 7;
    end;
  7:
    begin
      ComisionAnteriorMov := 8;
    end;
  8:
    begin
      ComisionAnteriorMov := 9;
    end;
  9:
    begin
      ComisionAnteriorMov := 10;
    end;
  10:
    begin
      ComisionAnteriorMov := 11;
    end;
  11:
    begin
      ComisionAnteriorMov := 12;
    end;
  12:
    begin
      ComisionAnteriorMov := 13;
    end;
  13:
    begin
      ComisionAnteriorMov := 15;
    end;
  end;
end;

procedure TMov_Form.ComboBox2Select(Sender: TObject);
begin
  case ComboBox2.ItemIndex of
  0:
    begin
      ComisionActualMov := 1;
    end;
  1:
    begin
      ComisionActualMov := 2;
    end;
  2:
    begin
      ComisionActualMov := 3;
    end;
  3:
    begin
      ComisionActualMov := 4;
    end;
  4:
    begin
      ComisionActualMov := 5;
    end;
  5:
    begin
      ComisionActualMov := 6;
    end;
  6:
    begin
      ComisionActualMov := 7;
    end;
  7:
    begin
      ComisionActualMov := 8;
    end;
  8:
    begin
      ComisionActualMov := 9;
    end;
  9:
    begin
      ComisionActualMov := 10;
    end;
  10:
    begin
      ComisionActualMov := 11;
    end;
  11:
    begin
      ComisionActualMov := 12;
    end;
  12:
    begin
      ComisionActualMov := 13;
    end;
  13:
    begin
      ComisionActualMov := 14;
    end;
  end;
end;

procedure TMov_Form.CtrlExp(Exp1, Exp2: Integer);
begin
  //Verifica si es un Exp. Adjunto.
  with ModuloDatos.UniQuerySelect1Mov do
  begin
    SQL.Clear;
    SQL.Add('SELECT expediente.num_exp, adjunto.id_cabecera, adjunto.id_adjunto FROM adjunto INNER JOIN expediente ON adjunto.id_adjunto = expediente.id_exp WHERE expediente.id_exp = :Adj');
    ParamByName('Adj').AsInteger := Exp1;
    Open;
  end;
  //Verifica si es un Exp Cabecera.
  with ModuloDatos.UniQuerySelect2Mov do
  begin
    SQL.Clear;
    SQL.Add('SELECT expediente.num_exp, adjunto.id_cabecera, adjunto.id_adjunto FROM adjunto INNER JOIN expediente ON adjunto.id_cabecera = expediente.id_exp WHERE expediente.id_exp = :Cab');
    ParamByName('Cab').AsInteger := Exp2;
    Open;
  end;
end;

procedure TMov_Form.FormActivate(Sender: TObject);
begin
  //Se Carga el StringGrid1 con los expedientes disponibles.
  with ModuloDatos.UniQueryMovimiento_Pases do
  begin
    SQL.Clear;
    SQL.Add('SELECT m.id_exp, num_exp, fecha_ini_exp, m.fecha_movimiento, referencia_exp, observaciones_exp, tipo_exp, estado_exp.estado_exp, codigo_org, nombre_org, cantidad_folios ');
    SQL.Add('FROM movimiento as m INNER JOIN expediente INNER JOIN tipo_expediente INNER JOIN estado_exp INNER JOIN organismos ');
    SQL.Add('WHERE m.id_exp = expediente.id_exp AND expediente.id_tipo_exp = tipo_expediente.id_tipo_exp ');
    SQL.Add('AND expediente.id_estado_exp = estado_exp.id_estado_exp AND expediente.id_org = organismos.id_org AND expediente.estado_pen_acp = :ETD AND m.id_comision_actual = :COM_A ');
    SQL.Add('AND m.fecha_movimiento = (SELECT max(fecha_movimiento) FROM movimiento as m2 WHERE m.id_exp = m2.id_exp) ORDER BY expediente.id_exp');
    ParamByName('ETD').AsInteger := 1;
    ParamByName('COM_A').AsInteger := Expedientes_Form.ComisionActual;
    Open;
    Active := True;
     //Llenado de StringGrid.
     while not Eof do
     begin
       StringGrid1.Cells[0,StringGrid1.RowCount-1] := IntToStr(ModuloDatos.UniQueryMovimiento_Pases.Fields.FieldByName('id_exp').AsInteger);
       StringGrid1.Cells[1,StringGrid1.RowCount-1] := IntToStr(ModuloDatos.UniQueryMovimiento_Pases.Fields.FieldByName('num_exp').AsInteger);
       StringGrid1.Cells[2,StringGrid1.RowCount-1] := IntToStr(ModuloDatos.UniQueryMovimiento_Pases.Fields.FieldByName('cantidad_folios').AsInteger);
       StringGrid1.Cells[3,StringGrid1.RowCount-1] := ModuloDatos.UniQueryMovimiento_Pases.Fields.FieldByName('referencia_exp').AsString;
       StringGrid1.Cells[4,StringGrid1.RowCount-1] := DateTimeToStr(ModuloDatos.UniQueryMovimiento_Pases.Fields.FieldByName('fecha_ini_exp').AsDateTime);
       StringGrid1.RowCount := StringGrid1.RowCount + 1;
       Next;
     end;
  end;

  //Creacion de columnas de StringGrid
  StringGrid1.Cells[0,0] := 'ID';
  StringGrid1.Cells[1,0] := 'Numero Exp';
  StringGrid1.Cells[2,0] := 'Cantidad Folios';
  StringGrid1.Cells[3,0] := 'Referencia';
  StringGrid1.Cells[4,0] := 'Fecha Iniciado';

  StringGrid2.Cells[0,0] := 'ID';
  StringGrid2.Cells[1,0] := 'Numero Exp';
  StringGrid2.Cells[2,0] := 'Cantidad Folios';
  StringGrid2.Cells[3,0] := 'Referencia';
  StringGrid2.Cells[4,0] := 'Fecha Iniciado';
  StringGrid2.Cells[5,0] := 'Folio Ant.';
  //Inicializacion de variable en 0.
  ComisionActualMov := 0;
end;

procedure TMov_Form.InsertMov(Fecha_Y_Hora: TDateTime; ComAct, ComAnt,
  ID_Exp: Integer);
begin
  with ModuloDatos.UniQueryMov do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO movimiento (fecha_movimiento, id_exp, id_comision_actual, id_comision_anterior) ');
    SQL.Add('VALUES (:F, :EXP, :COM_ACTUAL, :COM_ANTERIOR)');
    ParamByName('F').AsDateTime := Fecha_Y_Hora;
    ParamByName('EXP').AsInteger := ID_Exp;
    ParamByName('COM_ACTUAL').AsInteger := ComAct;
    ParamByName('COM_ANTERIOR').AsInteger := ComAnt;
    ExecSQL;
  end;
end;

procedure TMov_Form.MovAdj(Cab2: Integer);
var
  I, J, Expediente : Integer;
begin
  {Instrucciones para
  Mover los Adjuntos.}
  with ModuloDatos.UniQueryMovAdjunto do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM adjunto WHERE id_cabecera = :Exp');
    ParamByName('Exp').AsInteger := Cab2;
    Open;
  end;

  while not ModuloDatos.UniQueryMovAdjunto.Eof do
  begin
    Expediente := ModuloDatos.UniQueryMovAdjunto.Fields.FieldByName('id_adjunto').AsInteger;
    for I := 1 to StringGrid1.RowCount do
    begin
      if not (StringGrid1.Cells[0,I].IsEmpty) and (StrToInt(StringGrid1.Cells[0,I]) = Expediente) then
      begin
        Ctrl_Folios_Form := TCtrl_Folios_Form.Create(Self);
        Ctrl_Folios_Form.Label2.Caption := StringGrid1.Cells[1,I];
        Ctrl_Folios_Form.Label6.Caption := StringGrid1.Cells[4,I];
        Ctrl_Folios_Form.Ctrl_F_Edit.Text := StringGrid1.Cells[2,I];
        Ctrl_Folios_Form.ShowModal;
        StringGrid2.Cells[0,StringGrid2.RowCount-1]:= StringGrid1.Cells[0,I];
        StringGrid2.Cells[1,StringGrid2.RowCount-1]:= StringGrid1.Cells[1,I];
        StringGrid2.Cells[3,StringGrid2.RowCount-1]:= StringGrid1.Cells[3,I];
        StringGrid2.Cells[4,StringGrid2.RowCount-1]:= StringGrid1.Cells[4,I];
        StringGrid2.Cells[5,StringGrid2.RowCount-1]:= StringGrid1.Cells[2,I];
        StringGrid2.RowCount:=StringGrid2.RowCount+1;

        for J := I to StringGrid1.RowCount-1 do
        begin
          StringGrid1.Cells[0,J]:= StringGrid1.Cells[0,J+1];
          StringGrid1.Cells[1,J]:= StringGrid1.Cells[1,J+1];
          StringGrid1.Cells[2,J]:= StringGrid1.Cells[2,J+1];
          StringGrid1.Cells[3,J]:= StringGrid1.Cells[3,J+1];
          StringGrid1.Cells[4,J]:= StringGrid1.Cells[4,J+1];
        end;
        StringGrid1.RowCount := StringGrid1.RowCount-1;
      end;
    end;
	ModuloDatos.UniQueryMovAdjunto.Next;
  end;
end;

procedure TMov_Form.MovCab(Cab1: Integer);
var
 I, J: Integer;
begin
{Instrucciones para mover los cabeceras}
  for I := 1 to StringGrid1.RowCount do
  begin
    if not (StringGrid1.Cells[0,I].IsEmpty) and (StrToInt(StringGrid1.Cells[0,I]) = Cab1) then
    begin
        Ctrl_Folios_Form := TCtrl_Folios_Form.Create(Self);
        Ctrl_Folios_Form.Label2.Caption := StringGrid1.Cells[1,I];
        Ctrl_Folios_Form.Label6.Caption := StringGrid1.Cells[4,I];
        Ctrl_Folios_Form.Ctrl_F_Edit.Text := StringGrid1.Cells[2,I];
        Ctrl_Folios_Form.ShowModal;
        StringGrid2.Cells[0,StringGrid2.RowCount-1]:= StringGrid1.Cells[0,I];
        StringGrid2.Cells[1,StringGrid2.RowCount-1]:= StringGrid1.Cells[1,I];
        StringGrid2.Cells[3,StringGrid2.RowCount-1]:= StringGrid1.Cells[3,I];
        StringGrid2.Cells[4,StringGrid2.RowCount-1]:= StringGrid1.Cells[4,I];
        StringGrid2.Cells[5,StringGrid2.RowCount-1]:= StringGrid1.Cells[2,I];
        StringGrid2.RowCount:=StringGrid2.RowCount+1;

      for J := I to StringGrid1.RowCount-1 do
      begin
        StringGrid1.Cells[0,J]:= StringGrid1.Cells[0,J+1];
        StringGrid1.Cells[1,J]:= StringGrid1.Cells[1,J+1];
        StringGrid1.Cells[2,J]:= StringGrid1.Cells[2,J+1];
        StringGrid1.Cells[3,J]:= StringGrid1.Cells[3,J+1];
        StringGrid1.Cells[4,J]:= StringGrid1.Cells[4,J+1];
      end;
      StringGrid1.RowCount := StringGrid1.RowCount-1;
    end;
  end;
end;

procedure TMov_Form.QAdj(Cab4: Integer);
var
 I, J, Expediente : Integer;
begin
{Instrucciones para Quitar los Adjuntos.}
  with ModuloDatos.UniQueryMovAdjunto do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM adjunto WHERE id_cabecera = :Exp');
    ParamByName('Exp').AsInteger := Cab4;
    Open;
  end;

  while not ModuloDatos.UniQueryMovAdjunto.Eof do
  begin
    Expediente := ModuloDatos.UniQueryMovAdjunto.Fields.FieldByName('id_adjunto').AsInteger;
    for I := 1 to StringGrid2.RowCount do
    begin
      if not (StringGrid2.Cells[0,I].IsEmpty) and (StrToInt(StringGrid2.Cells[0,I]) = Expediente) then
      begin
        StringGrid1.Cells[0,StringGrid1.RowCount-1]:= StringGrid2.Cells[0,I];
        StringGrid1.Cells[1,StringGrid1.RowCount-1]:= StringGrid2.Cells[1,I];
        StringGrid1.Cells[2,StringGrid1.RowCount-1]:= StringGrid2.Cells[5,I];
        StringGrid1.Cells[3,StringGrid1.RowCount-1]:= StringGrid2.Cells[3,I];
        StringGrid1.Cells[4,StringGrid1.RowCount-1]:= StringGrid2.Cells[4,I];
        StringGrid1.RowCount:=StringGrid1.RowCount+1;

        for J := I to StringGrid1.RowCount-1 do
        begin
          StringGrid2.Cells[0,J]:= StringGrid2.Cells[0,J+1];
          StringGrid2.Cells[1,J]:= StringGrid2.Cells[1,J+1];
          StringGrid2.Cells[2,J]:= StringGrid2.Cells[2,J+1];
          StringGrid2.Cells[3,J]:= StringGrid2.Cells[3,J+1];
          StringGrid2.Cells[4,J]:= StringGrid2.Cells[4,J+1];
          StringGrid2.Cells[5,J]:= StringGrid2.Cells[5,J+1];
        end;
        StringGrid2.RowCount := StringGrid2.RowCount-1;
      end;
    end;
	ModuloDatos.UniQueryMovAdjunto.Next;
  end;

end;

procedure TMov_Form.QCab(Cab3: Integer);
var
 I, J : Integer;
begin
{Instruncciones para quitar los cabeceras}
  for I := 1 to StringGrid2.RowCount do
  begin
    if not (StringGrid2.Cells[0,I].IsEmpty) and (StrToInt(StringGrid2.Cells[0,I]) = Cab3) then
    begin
      StringGrid1.Cells[0,StringGrid1.RowCount-1]:= StringGrid2.Cells[0,I];
      StringGrid1.Cells[1,StringGrid1.RowCount-1]:= StringGrid2.Cells[1,I];
      StringGrid1.Cells[2,StringGrid1.RowCount-1]:= StringGrid2.Cells[5,I];
      StringGrid1.Cells[3,StringGrid1.RowCount-1]:= StringGrid2.Cells[3,I];
      StringGrid1.Cells[4,StringGrid1.RowCount-1]:= StringGrid2.Cells[4,I];
      StringGrid1.RowCount:=StringGrid1.RowCount+1;

      for J := I to StringGrid1.RowCount-1 do
      begin
        StringGrid2.Cells[0,J]:= StringGrid2.Cells[0,J+1];
        StringGrid2.Cells[1,J]:= StringGrid2.Cells[1,J+1];
        StringGrid2.Cells[2,J]:= StringGrid2.Cells[2,J+1];
        StringGrid2.Cells[3,J]:= StringGrid2.Cells[3,J+1];
        StringGrid2.Cells[4,J]:= StringGrid2.Cells[4,J+1];
        StringGrid2.Cells[5,J]:= StringGrid2.Cells[5,J+1];
      end;
      StringGrid2.RowCount := StringGrid2.RowCount-1;
    end;
  end;
end;

procedure TMov_Form.SpeedButton1Click(Sender: TObject);
var
 ID_Exp, I, J : Integer;
begin
  F1:=StringGrid1.Row;
  //Controla que la fila no este vacia y que la fila sea distinto de 0.
  if not (StringGrid1.Cells[0,F1].IsEmpty) and (F1 <> 0) then
  begin
    //Se guarda en variables el valor de la fila.
    Cabecera := StrToInt(StringGrid1.Cells[0,F1]); Adjunto := StrToInt(StringGrid1.Cells[0,F1]);
    //Llamado al procedimiento para controla si se trata de un expediente cabecera o adjunto.
    CtrlExp(Cabecera, Adjunto);
    //Se fija si algunos de los Query del procedimiento anterior es distinto de vacio.
    if ModuloDatos.UniQuerySelect1Mov.IsEmpty then
    begin
      if ModuloDatos.UniQuerySelect2Mov.IsEmpty then
      begin
        //En caso de que ambos Query sean vacios se pasa al control de folios.
        Ctrl_Folios_Form := TCtrl_Folios_Form.Create(Self);
        Ctrl_Folios_Form.Label2.Caption := StringGrid1.Cells[1,F1];
        Ctrl_Folios_Form.Label6.Caption := StringGrid1.Cells[4,F1];
        Ctrl_Folios_Form.Ctrl_F_Edit.Text := StringGrid1.Cells[2,F1];
        Ctrl_Folios_Form.ShowModal;
        //Una vez controlados los folios se pasa los datos a la otra grilla.
        StringGrid2.Cells[0,StringGrid2.RowCount-1]:= StringGrid1.Cells[0,F1];
        StringGrid2.Cells[1,StringGrid2.RowCount-1]:= StringGrid1.Cells[1,F1];
        StringGrid2.Cells[3,StringGrid2.RowCount-1]:= StringGrid1.Cells[3,F1];
        StringGrid2.Cells[4,StringGrid2.RowCount-1]:= StringGrid1.Cells[4,F1];
        StringGrid2.Cells[5,StringGrid2.RowCount-1]:= StringGrid1.Cells[2,F1];
        StringGrid2.RowCount:=StringGrid2.RowCount+1;

        for J := F1 to StringGrid1.RowCount-1 do
        begin
          StringGrid1.Cells[0,J]:= StringGrid1.Cells[0,J+1];
          StringGrid1.Cells[1,J]:= StringGrid1.Cells[1,J+1];
          StringGrid1.Cells[2,J]:= StringGrid1.Cells[2,J+1];
          StringGrid1.Cells[3,J]:= StringGrid1.Cells[3,J+1];
          StringGrid1.Cells[4,J]:= StringGrid1.Cells[4,J+1];
        end;
        StringGrid1.RowCount := StringGrid1.RowCount-1;
      end
      else
      begin
        //Se muestra un mensaje para advertir que es un cabecera.
        Mensaje := MessageDlg('Este Expediente Es Cabecera ¿Desea Mover Todo El Grupo De Expedientes?',mtConfirmation,[mbYes, mbNo],0);
        //En caso de que haga clic en Si entonces.
        if Mensaje = mrYes then
        begin
          //Se asigna el valor de la consulta a una variable
          ID_Exp := ModuloDatos.UniQuerySelect2Mov.Fields.FieldByName('id_cabecera').AsInteger;
          //Llamado al procedimiento para mover cabecera.
          MovCab(ID_Exp);
          //Llamado al procedimiento para mover los adjuntos de ese cabecera.
          MovAdj(ID_Exp);
        end;
      end;
    end
    else
    begin
      Mensaje := MessageDlg('Este Expediente Es Adjunto ¿Desea Mover Todo El Grupo De Expedientes?',mtConfirmation,[mbYes, mbNo],0);
      if Mensaje = mrYes then
      begin
        ID_Exp := ModuloDatos.UniQuerySelect1Mov.Fields.FieldByName('id_cabecera').AsInteger;
        MovCab(ID_Exp);
        MovAdj(ID_Exp);
      end;
    end;
  end;
end;

procedure TMov_Form.SpeedButton2Click(Sender: TObject);
var
 ID_Exp, I, J : Integer;
begin
  F2:=StringGrid2.Row;
  if not (StringGrid2.Cells[0,F2].IsEmpty) and (F2 <> 0) then
    begin
      Cabecera := StrToInt(StringGrid2.Cells[0,F2]); Adjunto := StrToInt(StringGrid2.Cells[0,F2]);
      CtrlExp(Cabecera, Adjunto);
      if ModuloDatos.UniQuerySelect1Mov.IsEmpty then
      begin
        if ModuloDatos.UniQuerySelect2Mov.IsEmpty then
        begin
          StringGrid1.Cells[0,StringGrid1.RowCount-1]:= StringGrid2.Cells[0,F2];
          StringGrid1.Cells[1,StringGrid1.RowCount-1]:= StringGrid2.Cells[1,F2];
          StringGrid1.Cells[2,StringGrid1.RowCount-1]:= StringGrid2.Cells[5,F2];
          StringGrid1.Cells[3,StringGrid1.RowCount-1]:= StringGrid2.Cells[3,F2];
          StringGrid1.Cells[4,StringGrid1.RowCount-1]:= StringGrid2.Cells[4,F2];
          StringGrid1.RowCount:=StringGrid1.RowCount+1;

          for J := F1 to StringGrid1.RowCount-1 do
          begin
            StringGrid2.Cells[0,J]:= StringGrid2.Cells[0,J+1];
            StringGrid2.Cells[1,J]:= StringGrid2.Cells[1,J+1];
            StringGrid2.Cells[2,J]:= StringGrid2.Cells[2,J+1];
            StringGrid2.Cells[3,J]:= StringGrid2.Cells[3,J+1];
            StringGrid2.Cells[4,J]:= StringGrid2.Cells[4,J+1];
            StringGrid2.Cells[5,J]:= StringGrid2.Cells[5,J+1];
          end;
          StringGrid2.RowCount := StringGrid2.RowCount-1;
        end
        else
        begin
          Mensaje := MessageDlg('Este Expediente Es Cabecera ¿Desea Mover Todo El Grupo De Expedientes?',mtConfirmation,[mbYes, mbNo],0);
          if Mensaje = mrYes then
          begin
            ID_Exp := ModuloDatos.UniQuerySelect2Mov.Fields.FieldByName('id_cabecera').AsInteger;
            QCab(ID_Exp);
            QAdj(ID_Exp);
          end;
        end;
      end
      else
      begin
        Mensaje := MessageDlg('Este Expediente Es Adjunto ¿Desea Mover Todo El Grupo De Expedientes?',mtConfirmation,[mbYes, mbNo],0);
        if Mensaje = mrYes then
        begin
          ID_Exp := ModuloDatos.UniQuerySelect1Mov.Fields.FieldByName('id_cabecera').AsInteger;
          QCab(ID_Exp);
          QAdj(ID_Exp);
        end;
      end;
    end;
end;

procedure TMov_Form.Timer1Timer(Sender: TObject);
begin
  Fecha_Hora := (Now);
end;

procedure TMov_Form.UpdateExpMov(Exp, Estado: Integer);
begin
  with ModuloDatos.UniQueryUpdateExpMov do
  begin
    SQL.Clear;
    SQL.Add('UPDATE expediente SET estado_pen_acp = :ESTADO WHERE id_exp = :EXP');
    ParamByName('ESTADO').AsInteger := Estado;
    ParamByName('EXP').AsInteger := Exp;
    ExecSQL;
  end;
end;

procedure TMov_Form.UpdateFolios(Cant, Exp: Integer);
begin
  with ModuloDatos.UniQueryUpdateFolios do
  begin
    SQL.Clear;
    SQL.Add('UPDATE expediente SET cantidad_folios = :CANTIDAD WHERE id_exp = :EXP');
    ParamByName('CANTIDAD').AsInteger := Cant;
    ParamByName('EXP').AsInteger := Exp;
    ExecSQL;
  end;
end;

end.
