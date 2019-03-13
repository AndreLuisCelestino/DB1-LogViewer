program LogViewer;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  View.Monitor in 'View.Monitor.pas' {fMonitor},
  View.Loading in 'View.Loading.pas' {fLoading},
  Utils.Options in '..\Utils\Utils.Options.pas',
  Utils.Helpers in '..\Utils\Utils.Helpers.pas',
  Utils.Constants in '..\Utils\Utils.Constants.pas',
  SQL.Formatter in '..\Utils\SQL.Formatter.pas',
  Utils.Updater in '..\Utils\Utils.Updater.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'DB1 Log Viewer';
  Application.CreateForm(TfMonitor, fMonitor);
  ReportMemoryLeaksOnShutdown := True;
  Application.Run;
end.
