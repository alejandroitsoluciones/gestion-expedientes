unit FExpedente_Pendiente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TExp_Pen_Form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Timer1: TTimer;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Acp_Exp (Exp : Integer);
    procedure Rchzr_Exp (Expediente : Integer);
    procedure Rechazar (Ex, ComAct, ComAnt : Integer; FH : TDateTime);
    procedure ComisionAnteriorSelect(Exp_ : Integer);
    procedure Ctrl (Exp1, Exp2 : Integer);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Mensaje1, Mensaje2, Expediente, Com : Integer;
    Fecha_Hora : TDateTime;
    ID_Exp : array[0..100] of Integer;
    Cab, Adj : Integer;
  end;

var
  Exp_Pen_Form: TExp_Pen_Form;

implementation

{$R *.dfm}

uses MDatos, FExpedientes;

procedure TExp_Pen_Form.Acp_Exp(Exp: Integer);
begin
  with ModuloDatos.UniQueryAcp_Expedientes do
  begin
    SQL.Clear;
    SQL.Add('UPDATE expediente SET estado_pen_acp = 1 WHERE id_exp = :EXPEDIENTE');
    ParamByName('EXPEDIENTE').AsInteger := Exp;
    ExecSQL;
    end;
end;

procedure TExp_Pen_Form.Button1Click(Sender: TObject);
var
  I1, I2, I3, I4 : Integer;
begin
  //Controla que se haya seleccionado un expediente de la grilla.
  if Expediente <> 0 then
  begin
    //Llamado al procedimiento para controlar el expediente si se trata de un cabecera o adjunto.
    Ctrl(Expediente,Expediente);
    //Confirma si el seleccionado es un adjunto
    if ModuloDatos.UniQuerySelect3Mov.RecordCount <> 0 then
    begin
      //Se guarda en una variable el id de cabecera de la consulta anterior.
      Cab := ModuloDatos.UniQuerySelect3Mov.Fields.FieldByName('id_cabecera').AsInteger;
      //Ciclo for que se usa para llenar el vector que va a contener los id de adjunto correspondientes al anterior cabecera.
      for I1 := 0 to ModuloDatos.UniQuerySelect3Mov.RecordCount-1 do
      begin
        ID_Exp[I1] := ModuloDatos.UniQuerySelect3Mov.Fields.FieldByName('id_adjunto').AsInteger;
      end;
    end
    else
    begin
      //Confirma si el seleccionado es un cabecera.
      if ModuloDatos.UniQuerySelect4Mov.RecordCount <> 0 then
      begin
        //Se guarda en una variable el id de cabecera de la consulta anterior.
        Cab := ModuloDatos.UniQuerySelect4Mov.Fields.FieldByName('id_cabecera').AsInteger;
        //Consulta que se realiza para sacar los adjuntos del cabecera de la consulta anterior.
        with ModuloDatos.UniQuerySelect5Mov do
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM adjunto WHERE id_cabecera = :Exp');
          ParamByName('Exp').AsInteger := Cab;
          Open;
        end;
        //Ciclo for que se usa para llenar el vector que va a contener los id de adjunto correspondientes al anterior cabecera.
        for I2 := 0 to ModuloDatos.UniQuerySelect5Mov.RecordCount-1 do
        begin
          ID_Exp[I2] := ModuloDatos.UniQuerySelect5Mov.Fields.FieldByName('id_adjunto').AsInteger;
        end;
      end;
    end;
    //Confirma que el expediente seleccionado no es ni cabecera ni adjunto entonces.
    if (ModuloDatos.UniQuerySelect3Mov.RecordCount = 0) and (ModuloDatos.UniQuerySelect4Mov.RecordCount = 0) then
    begin
      //Llamado al procedimiento para aceptar el expediente.
      Acp_Exp(Expediente);
      //Controla que se haya aceptado correctamente.
      if ModuloDatos.UniQueryAcp_Expedientes.RowsAffected <> 0 then
      begin
        //Actualiza el Query expedientes pendientes (Actualiza la grilla.)
        ModuloDatos.UniQueryExp_Pendientes.Refresh;
        //Actualiza el Query de expedientes disponibles (Actualiza la grilla.)
        ModuloDatos.UniQueryExpedientesDisponibles.Refresh;
        //Actualiza la cantidad de expedientes disponibles en el label
        Expedientes_Form.Label4.Caption := IntToStr (ModuloDatos.UniQueryExpedientesDisponibles.RecordCount);
        ShowMessage('Se Acepto Correctamente El Expediente.');
      end
      else
      begin
        ShowMessage('Error Al Aceptar.');
      end;
    end
    else
    begin
      if ModuloDatos.UniQuerySelect3Mov.RecordCount <> 0 then
      begin
        //En caso de que sea adjunto se realiza la pregunta para que el usuario decida si acepta o no.
        Mensaje1 := MessageDlg('Este Expediente Forma Parte De Un Conjunto De Expedientes (Adjunto). ¿Desea Aceptarlos?',mtConfirmation,[mbYes, mbNo],0);
        //En caso de que si los acepte entonces.
        if Mensaje1 = mrYes then
        begin
          //Llamado al procedimiento para aceptar el expediente.
          Acp_Exp(Cab);
          //Ciclo for para aceptar los expedientes adjuntos al cabecera.
          for I3 := 0 to ModuloDatos.UniQuerySelect3Mov.RecordCount-1 do
          begin
            //Llamado al procedimiento anterior dentro del ciclo.
            Acp_Exp(ID_Exp[I3]);
          end;
          //Comprueba que se hayan aceptado los expedientes.
          if ModuloDatos.UniQueryAcp_Expedientes.RowsAffected <> 0 then
          begin
            //Actualiza el Query expedientes pendientes (Actualiza la grilla.)
            ModuloDatos.UniQueryExp_Pendientes.Refresh;
            //Actualiza el Query de expedientes disponibles (Actualiza la grilla.)
            ModuloDatos.UniQueryExpedientesDisponibles.Refresh;
            //Actualiza la cantidad de expedientes disponibles en el label
            Expedientes_Form.Label4.Caption := IntToStr (ModuloDatos.UniQueryExpedientesDisponibles.RecordCount);
            ShowMessage('Se Acepto Correctamente El Expediente.');
          end
          else
          begin
            ShowMessage('Error Al Aceptar.');
          end;
        end;
      end
      else
      begin
        if ModuloDatos.UniQuerySelect4Mov.RecordCount <> 0 then
        begin
          //En caso de que sea cabecera se realiza la pregunta para que el usuario decida si acepta o no.
          Mensaje2 := MessageDlg('Este Expediente Forma Parte De Un Conjunto De Expedientes (Cabecera). ¿Desea Aceptarlos?',mtConfirmation,[mbYes, mbNo],0);
          //En caso de que si los acepte entonces.
          if Mensaje2 = mrYes then
          begin
            //Llamado al procedimiento para aceptar el expediente.
            Acp_Exp(Cab);
            //Ciclo for para aceptar los expedientes adjuntos al cabecera.
            for I4 := 0 to ModuloDatos.UniQuerySelect4Mov.RecordCount-1 do
            begin
              //Llamado al procedimiento anterior dentro del ciclo.
              Acp_Exp(ID_Exp[I4]);
            end;
            //Comprueba que se hayan aceptado los expedientes.
            if ModuloDatos.UniQueryAcp_Expedientes.RowsAffected <> 0 then
            begin
              //Actualiza el Query expedientes pendientes (Actualiza la grilla.)
              ModuloDatos.UniQueryExp_Pendientes.Refresh;
              //Actualiza el Query de expedientes disponibles (Actualiza la grilla.)
              ModuloDatos.UniQueryExpedientesDisponibles.Refresh;
              //Actualiza la cantidad de expedientes disponibles en el label
              Expedientes_Form.Label4.Caption := IntToStr (ModuloDatos.UniQueryExpedientesDisponibles.RecordCount);
              ShowMessage('Se Acepto Correctamente El Expediente.');
            end
            else
            begin
              ShowMessage('Error Al Aceptar.');
            end;
          end;
        end;
      end;
    end;
  end
  else
  begin
    ShowMessage('Seleccione Un Expediente De La Grilla Para Aceptar.');
  end;
end;

procedure TExp_Pen_Form.Button2Click(Sender: TObject);
begin
  Exp_Pen_Form.Close;
  Expediente := 0;
end;

procedure TExp_Pen_Form.Button3Click(Sender: TObject);
var
  I1, I2, I3, I4 : Integer;
begin
  if Expediente <> 0 then
  begin
    Ctrl(Expediente,Expediente);
    if ModuloDatos.UniQuerySelect3Mov.RecordCount <> 0 then
    begin
      Cab := ModuloDatos.UniQuerySelect3Mov.Fields.FieldByName('id_cabecera').AsInteger;
      for I1 := 0 to ModuloDatos.UniQuerySelect3Mov.RecordCount-1 do
      begin
        ID_Exp[I1] := ModuloDatos.UniQuerySelect3Mov.Fields.FieldByName('id_adjunto').AsInteger;
      end;
    end
    else
    begin
      if ModuloDatos.UniQuerySelect4Mov.RecordCount <> 0 then
      begin
        Cab := ModuloDatos.UniQuerySelect4Mov.Fields.FieldByName('id_cabecera').AsInteger;
        with ModuloDatos.UniQuerySelect5Mov do
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM adjunto WHERE id_cabecera = :Exp');
          ParamByName('Exp').AsInteger := Cab;
          Open;
        end;
        for I2 := 0 to ModuloDatos.UniQuerySelect5Mov.RecordCount-1 do
        begin
          ID_Exp[I2] := ModuloDatos.UniQuerySelect5Mov.Fields.FieldByName('id_adjunto').AsInteger;
        end;
      end;
    end;
    if (ModuloDatos.UniQuerySelect3Mov.RecordCount = 0) and (ModuloDatos.UniQuerySelect4Mov.RecordCount = 0) then
    begin
      Acp_Exp(Expediente);
      if ModuloDatos.UniQueryAcp_Expedientes.RowsAffected <> 0 then
      begin
        ModuloDatos.UniQueryExp_Pendientes.Refresh;
        ModuloDatos.UniQueryExpedientesDisponibles.Refresh;
        Expedientes_Form.Label4.Caption := IntToStr (ModuloDatos.UniQueryExpedientesDisponibles.RecordCount);
        ShowMessage('Se Acepto Correctamente El Expediente.');
      end
      else
      begin
        ShowMessage('Error Al Aceptar.');
      end;
    end
    else
    begin
      if ModuloDatos.UniQuerySelect3Mov.RecordCount <> 0 then
      begin
        Mensaje1 := MessageDlg('Este Expediente Forma Parte De Un Conjunto De Expedientes (Adjunto). ¿Desea Rechazarlos?',mtConfirmation,[mbYes, mbNo],0);
        if Mensaje1 = mrYes then
        begin
          ComisionAnteriorSelect(Cab);
          Rchzr_Exp(Cab);
          Rechazar(Cab,Com,Expedientes_Form.ComisionActual,Fecha_Hora);
          for I3 := 0 to ModuloDatos.UniQuerySelect3Mov.RecordCount-1 do
          begin
           Rchzr_Exp(ID_Exp[I3]);
          end;
          if ModuloDatos.UniQueryUpdate_Estado_Rechazar.RowsAffected <> 0 then
          begin
            ModuloDatos.UniQueryExp_Pendientes.Refresh;
            ModuloDatos.UniQueryExpedientesDisponibles.Refresh;
            Expedientes_Form.Label4.Caption := IntToStr (ModuloDatos.UniQueryExpedientesDisponibles.RecordCount);
            ShowMessage('Se Acepto Correctamente El Expediente.');
          end
          else
          begin
            ShowMessage('Error Al Aceptar.');
          end;
        end;
      end
      else
      begin
        if ModuloDatos.UniQuerySelect4Mov.RecordCount <> 0 then
        begin
          Mensaje2 := MessageDlg('Este Expediente Forma Parte De Un Conjunto De Expedientes (Cabecera). ¿Desea Rechazarlos?',mtConfirmation,[mbYes, mbNo],0);
          if Mensaje2 = mrYes then
          begin
            ComisionAnteriorSelect(Cab);
            Rchzr_Exp(Cab);
            Rechazar(Cab,Com,Expedientes_Form.ComisionActual,Fecha_Hora);
            for I4 := 0 to ModuloDatos.UniQuerySelect4Mov.RecordCount-1 do
            begin
              Rchzr_Exp(ID_Exp[I4]);
            end;
            if ModuloDatos.UniQueryUpdate_Estado_Rechazar.RowsAffected <> 0 then
            begin
              ModuloDatos.UniQueryExp_Pendientes.Refresh;
              ModuloDatos.UniQueryExpedientesDisponibles.Refresh;
              Expedientes_Form.Label4.Caption := IntToStr (ModuloDatos.UniQueryExpedientesDisponibles.RecordCount);
              ShowMessage('Se Acepto Correctamente El Expediente.');
            end
            else
            begin
              ShowMessage('Error Al Aceptar.');
            end;
          end;
        end;
      end;
    end;
  end
  else
  begin
    ShowMessage('Seleccione Un Expediente De La Grilla Para Aceptar.');
  end;
end;

procedure TExp_Pen_Form.ComisionAnteriorSelect(Exp_: Integer);
begin
  with ModuloDatos.UniQuerySelect1Exp_Rechazar do
  begin
    SQL.Clear;
    SQL.Add('SELECT m.id_exp, m.fecha_movimiento, m.id_comision_anterior FROM movimiento AS m ');
    SQL.Add('WHERE m.id_exp = :EXP AND m.fecha_movimiento = (SELECT max(fecha_movimiento) FROM movimiento AS m1 ');
    SQL.Add('WHERE m.id_exp = m1.id_exp)');
    ParamByName('EXP').AsInteger := Exp_;
    Open;
    Com := Fields.FieldByName('id_comision_anterior').AsInteger;
  end;
end;

procedure TExp_Pen_Form.Ctrl(Exp1, Exp2: Integer);
begin
  //Verifica Si Es Adjunto.
  with ModuloDatos.UniQuerySelect3Mov do
  begin
    SQL.Clear;
    SQL.Add('SELECT expediente.num_exp, adjunto.id_cabecera, adjunto.id_adjunto FROM adjunto INNER JOIN expediente ON adjunto.id_adjunto = expediente.id_exp WHERE expediente.id_exp = :Adj');
    ParamByName('Adj').AsInteger := Exp1;
    Open;
  end;
  //Verifica Si Es Cabecera.
  with ModuloDatos.UniQuerySelect4Mov do
  begin
    SQL.Clear;
    SQL.Add('SELECT expediente.num_exp, adjunto.id_cabecera, adjunto.id_adjunto FROM adjunto INNER JOIN expediente ON adjunto.id_cabecera = expediente.id_exp WHERE expediente.id_exp = :Cab');
    ParamByName('Cab').AsInteger := Exp2;
    Open;
  end;
end;

procedure TExp_Pen_Form.DBGrid1CellClick(Column: TColumn);
begin
  Expediente := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_exp').AsInteger;
end;

procedure TExp_Pen_Form.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  I: Integer;
begin
  if Key = #13 then
    Expediente := DBGrid1.DataSource.DataSet.Fields.FieldByName('id_exp').AsInteger;
end;

procedure TExp_Pen_Form.Rchzr_Exp(Expediente: Integer);
begin
  with ModuloDatos.UniQueryUpdate_Estado_Rechazar do
  begin
    SQL.Clear;
    SQL.Add('UPDATE expediente SET estado_pen_acp = 0 WHERE id_exp = :EXPEDIENTE');
    ParamByName('EXPEDIENTE').AsInteger := Expediente;
    ExecSQL;
  end;
end;

procedure TExp_Pen_Form.Rechazar(Ex, ComAct, ComAnt: Integer; FH: TDateTime);
begin
  with ModuloDatos.UniQueryExp_Pendientes_Rechazar do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO movimiento (fecha_movimiento, id_exp, id_comision_actual, id_comision_anterior) ');
    SQL.Add('VALUES (:FECHA_M, :ID_E, :COM_ACTUAL, :COM_ANTERIOR)');
    ParamByName('ID_E').AsInteger := Ex;
    ParamByName('FECHA_M').AsDateTime := FH;
    ParamByName('COM_ACTUAL').AsInteger := Com;
    ParamByName('COM_ANTERIOR').AsInteger := ComAct;
    ExecSQL;
  end;
end;

procedure TExp_Pen_Form.Timer1Timer(Sender: TObject);
begin
  Fecha_Hora := (Now);
end;

end.
