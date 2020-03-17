unit MDatos;

interface

uses
  System.SysUtils, System.Classes, UniProvider, MySQLUniProvider, Data.DB,
  DBAccess, Uni, MemDS, frxClass, frxDBSet, frxExportPDF, DADump, UniDump;

type
  TModuloDatos = class(TDataModule)
    UniConnectionConcejo: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    UniQuerySesion: TUniQuery;
    UniQueryInsertExp_Rec_Expedientes: TUniQuery;
    UniQuerySelect1Expedientes: TUniQuery;
    UniQueryInsertMov_Rec_Expedientes: TUniQuery;
    UniQuerySelect2Expedientes: TUniQuery;
    UniQueryInsertIniciador: TUniQuery;
    UniQueryIniciador: TUniQuery;
    UniDataSourceIniciador: TUniDataSource;
    UniQuerySelect1Iniciador: TUniQuery;
    UniQueryConcejales: TUniQuery;
    UniQueryExpedientesNuevos: TUniQuery;
    UniDataSourceExpedientesNuevos: TUniDataSource;
    UniQueryInsertExp: TUniQuery;
    UniQueryInsertIni_X_Exp: TUniQuery;
    UniQueryInsertMovimiento: TUniQuery;
    UniQuerySelect2Expediente: TUniQuery;
    UniQueryAsigComision: TUniQuery;
    UniDataSourceAsigComision: TUniDataSource;
    UniQueryUpdateExpediente: TUniQuery;
    UniQueryDeleteExpedientesNuevos: TUniQuery;
    UniQueryBusNExpedientes: TUniQuery;
    UniDataSourceBusNExpedientes: TUniDataSource;
    UniDataSourceComisiones: TUniDataSource;
    UniTableComisiones: TUniTable;
    UniTableComisionesid_comision: TIntegerField;
    UniTableComisionesnombre_comision: TStringField;
    UniTableComisionesnombre_encargado_comision: TStringField;
    UniTableComisionesapellido_encargado_comision: TStringField;
    UniQueryInsertComision: TUniQuery;
    UniQuerySelectComision: TUniQuery;
    UniQueryUpdateComision: TUniQuery;
    UniQuerySelect1Comision: TUniQuery;
    UniDataSourceSelect1Comision: TUniDataSource;
    UniQueryExpedientesDisponibles: TUniQuery;
    UniDataSourceExpedientesDisponibles: TUniDataSource;
    UniQuerySelect1ExpedientesDisponibles: TUniQuery;
    UniQueryExp_Adj_Add: TUniQuery;
    UniQueryInsertAdj: TUniQuery;
    UniQueryAdj: TUniQuery;
    UniDataSourceAdj: TUniDataSource;
    UniQueryDeleteAdj: TUniQuery;
    UniQuerySelect1Adj: TUniQuery;
    UniQuerySelect2Adj: TUniQuery;
    UniDataSourceSelect1Adj: TUniDataSource;
    UniDataSourceSelect2Adj: TUniDataSource;
    UniQueryExp_Pendientes: TUniQuery;
    UniDataSourceExp_Pendientes: TUniDataSource;
    UniQueryAcp_Expedientes: TUniQuery;
    UniQueryBusOrg: TUniQuery;
    UniTableOrganismos: TUniTable;
    UniDataSourceOrganismos: TUniDataSource;
    UniDataSourceBusOrg: TUniDataSource;
    UniQueryExp_Pendientes_Rechazar: TUniQuery;
    UniQueryDetalle_Exp: TUniQuery;
    UniQueryDetalle_Exp_Ini: TUniQuery;
    UniDataSourceDetalle_Exp: TUniDataSource;
    UniDataSourceDetalle_Exp_Ini: TUniDataSource;
    UniQuerySelect1IniXExp: TUniQuery;
    UniQuerySelect2IniXExp: TUniQuery;
    UniQuerySelect1Exp_Rechazar: TUniQuery;
    UniQueryUpdate_Estado_Rechazar: TUniQuery;
    UniQueryValidarExp_Adj: TUniQuery;
    UniQueryInsertUser: TUniQuery;
    UniQuerySesion1: TUniQuery;
    UniQueryUpdateIni: TUniQuery;
    UniQuerySelectIni: TUniQuery;
    UniQueryBusIniciador: TUniQuery;
    UniDataSourceBusIniciador: TUniDataSource;
    UniQueryMovimiento_Pases: TUniQuery;
    UniQueryComboBox_Movimiento: TUniQuery;
    UniQueryMovCabecera: TUniQuery;
    UniQueryMovAdjunto: TUniQuery;
    UniQuerySelect1Mov: TUniQuery;
    UniQuerySelect2Mov: TUniQuery;
    UniQueryMov: TUniQuery;
    UniQueryUpdateExpMov: TUniQuery;
    UniQueryNuevo_Usuario: TUniQuery;
    UniQueryCreate_User: TUniQuery;
    UniQueryGrant_User: TUniQuery;
    FRXDBDataset_Movimiento1: TfrxDBDataset;
    UniQueryConsulta1_Report: TUniQuery;
    UniQueryConsulta2_Report: TUniQuery;
    FRXDBDataset_Movimiento2: TfrxDBDataset;
    FRXDBDataset_Movimiento3: TfrxDBDataset;
    UniQueryConsulta3_Report: TUniQuery;
    FRXDBDataset_Movimiento4: TfrxDBDataset;
    UniQueryBusExp: TUniQuery;
    UniDataSourceBusExp: TUniDataSource;
    UniQueryHistMovExp: TUniQuery;
    UniDataSourceHistMovExp: TUniDataSource;
    UniQueryUpdateFolios: TUniQuery;
    UniQueryOrganismos: TUniQuery;
    UniQueryBusquedaOrganismos: TUniQuery;
    UniDataSourceABMOrganismos: TUniDataSource;
    UniDataSourceBusquedaOrganismos: TUniDataSource;
    UniQueryInsertOrganismo: TUniQuery;
    UniQueryUpdateOrganismo: TUniQuery;
    UniQueryDeleteOrganismo: TUniQuery;
    UniQuerySelect1Org: TUniQuery;
    UniQueryDeleteComision: TUniQuery;
    UniQuerySelect3Mov: TUniQuery;
    UniQuerySelect4Mov: TUniQuery;
    UniQuerySelect5Mov: TUniQuery;
    FRXDBDataset_Historial: TfrxDBDataset;
    FRXReport_Hist: TfrxReport;
    Report_Movimiento: TfrxReport;
    UniQuerySelectExp: TUniQuery;
    FRXDBDataset_Exp: TfrxDBDataset;
    FRXReport_Exp: TfrxReport;
    UniQuerySelectIniReport: TUniQuery;
    frxDBDataset_Ini: TfrxDBDataset;
    UniQueryResolucion: TUniQuery;
    UniQueryUpdateResolucion: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModuloDatos: TModuloDatos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


end.
