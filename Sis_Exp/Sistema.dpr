program Sistema;

uses
  Vcl.Forms,
  FSesion in 'FSesion.pas' {Sesion_Form},
  MDatos in 'MDatos.pas' {ModuloDatos: TDataModule},
  FPrincipal in 'FPrincipal.pas' {Principal_Form},
  Vcl.Themes,
  Vcl.Styles,
  FNuevo_Exp in 'FNuevo_Exp.pas' {Exp_Nuevo_Form},
  FIniciador in 'FIniciador.pas' {Ini_Form},
  FAlta_Exp in 'FAlta_Exp.pas' {N_Expediente_Form},
  FAlta_Ini in 'FAlta_Ini.pas' {N_Ini_Form},
  FAsig_Com in 'FAsig_Com.pas' {Asig_Com_Form},
  FComision in 'FComision.pas' {Comisiones_Form},
  FAlta_Mod_Com in 'FAlta_Mod_Com.pas' {Opc_Com_Form},
  FExpedientes in 'FExpedientes.pas' {Expedientes_Form},
  FAdjuntar_Exp in 'FAdjuntar_Exp.pas' {Adj_Exp_Form},
  FMovimiento in 'FMovimiento.pas' {Mov_Form},
  FBaja_Adj_Exp in 'FBaja_Adj_Exp.pas' {Del_Adj_Exp_Form},
  FExpedente_Pendiente in 'FExpedente_Pendiente.pas' {Exp_Pen_Form},
  FOrganismos in 'FOrganismos.pas' {Org_Form},
  FDetalle_Exp in 'FDetalle_Exp.pas' {Detalle_Exp_Form},
  FAlta_User in 'FAlta_User.pas' {Alta_User_Form},
  FBusExp in 'FBusExp.pas' {Bus_Exp_Form},
  FHistorialMovExp in 'FHistorialMovExp.pas' {Historial_Mov_Form},
  FControlFolios in 'FControlFolios.pas' {Ctrl_Folios_Form},
  FOrganismo in 'FOrganismo.pas' {Organismos_Form},
  FAlta_Mod_Org in 'FAlta_Mod_Org.pas' {Opc_Org_Form},
  FResolucion in 'FResolucion.pas' {Resolucion_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TSesion_Form, Sesion_Form);
  Application.CreateForm(TModuloDatos, ModuloDatos);
  Application.CreateForm(TDetalle_Exp_Form, Detalle_Exp_Form);
  Application.CreateForm(TAlta_User_Form, Alta_User_Form);
  Application.CreateForm(TBus_Exp_Form, Bus_Exp_Form);
  Application.CreateForm(THistorial_Mov_Form, Historial_Mov_Form);
  Application.CreateForm(TCtrl_Folios_Form, Ctrl_Folios_Form);
  Application.CreateForm(TOrganismos_Form, Organismos_Form);
  Application.CreateForm(TOpc_Org_Form, Opc_Org_Form);
  Application.CreateForm(TResolucion_Form, Resolucion_Form);
  Application.Run;
end.
