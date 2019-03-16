unit View.Monitor;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Samples.Spin, Vcl.ComCtrls, Vcl.Menus,System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ActnCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Component.FDLogViewer, Vcl.WinXCtrls, FireDAC.Stan.StorageBin, SynEdit,
  SynMemo, SynEditHighlighter, SynHighlighterSQL, SQL.Formatter, Utils.Options,
  Vcl.DBCtrls, Component.DBGridLog, FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.ImageList,
  Vcl.ImgList, Vcl.ToolWin, System.Threading;

type
  TfMonitor = class(TForm)
    ActionClearCache: TAction;
    ActionClearLog: TAction;
    ActionManager: TActionManager;
    ActionOpenFile: TAction;
    ActionOpenLast: TAction;
    ActionReloadLog: TAction;
    ActionToolBar: TActionToolBar;
    BevelSeparator1: TBevel;
    BevelSeparator2: TBevel;
    CheckBoxAutoUpdate: TCheckBox;
    ComboBoxDateFormat: TComboBox;
    DataSource: TDataSource;
    DataSourceFilter: TDataSource;
    DBGrid: TDBGrid;
    DBGridFilter: TDBGridLog;
    DBNavigator: TDBNavigator;
    EditSQLFilter: TEdit;
    FDMemTableFilter: TFDMemTable;
    FDMemTableFilterClass: TStringField;
    FDMemTableFilterDatabase: TStringField;
    FDMemTableFilterDateTime: TStringField;
    FDMemTableFilterError: TStringField;
    FDMemTableFilterIP: TStringField;
    FDMemTableFilterMethod: TStringField;
    FDMemTableFilterType: TStringField;
    FDMemTableFilterUser: TStringField;
    GroupBoxAutoUpdate: TGroupBox;
    GroupBoxLog: TGroupBox;
    GroupBoxShortCuts: TGroupBox;
    GroupBoxSQL: TGroupBox;
    GroupBoxVisual: TGroupBox;
    ImageList: TImageList;
    LabelAlt1: TLabel;
    LabelAlt2: TLabel;
    LabelAlt3: TLabel;
    LabelClearFilters: TLabel;
    LabelClearLog: TLabel;
    LabelCopyColumnValue: TLabel;
    LabelCopyMethodName: TLabel;
    LabelCopySQL: TLabel;
    LabelCtrlC: TLabel;
    LabelCtrlL: TLabel;
    LabelCtrlM: TLabel;
    LabelCtrlO: TLabel;
    LabelCtrlQ: TLabel;
    LabelCtrlU: TLabel;
    LabelDateFormat: TLabel;
    LabeledEditClass: TLabeledEdit;
    LabeledEditDatabase: TLabeledEdit;
    LabeledEditDateTime: TLabeledEdit;
    LabeledEditIP: TLabeledEdit;
    LabeledEditMethod: TLabeledEdit;
    LabeledEditUser: TLabeledEdit;
    LabelF4: TLabel;
    LabelF5: TLabel;
    LabelFilterSQL: TLabel;
    LabelForceToDateFunctionInfo: TLabel;
    LabelIgnoreBasicLogInfo: TLabel;
    LabelInterval: TLabel;
    LabelOpenFile: TLabel;
    LabelOpenLast: TLabel;
    LabelReloadLog: TLabel;
    LabelRowSelectInfo: TLabel;
    LabelShowLogTab: TLabel;
    LabelShowOnlySQLInfo: TLabel;
    LabelShowOptionsTab: TLabel;
    LabelShowSQLTab: TLabel;
    LabelUpdateReminder: TLabel;
    LabelURL: TLabel;
    LogViewer: TFDLogViewer;
    MenuItemCopyColumnValue: TMenuItem;
    MenuItemCopyMethodName: TMenuItem;
    MenuItemCopySQL: TMenuItem;
    PageControl: TPageControl;
    PanelDBGridFilter: TPanel;
    PanelFilterSQL: TPanel;
    PanelGrid: TPanel;
    PanelOptions: TPanel;
    PanelSQL: TPanel;
    PanelSQLTab: TPanel;
    PanelUpdateReminder: TPanel;
    PopupMenu: TPopupMenu;
    RadioGroupStyles: TRadioGroup;
    SpinEditInterval: TSpinEdit;
    Splitter: TSplitter;
    StatusBarDetails: TStatusBar;
    SynMemoSQL: TSynMemo;
    SynMemoTab: TSynMemo;
    SynSQLSyn: TSynSQLSyn;
    TabSheetLog: TTabSheet;
    TabSheetOptions: TTabSheet;
    TabSheetSQL: TTabSheet;
    TimerAutoUpdate: TTimer;
    ToggleSwitchForceToDateFunction: TToggleSwitch;
    ToggleSwitchHighlightErrors: TToggleSwitch;
    ToggleSwitchIgnoreServerDMLog: TToggleSwitch;
    ToggleSwitchRowSelect: TToggleSwitch;
    ToggleSwitchShowBottomPanel: TToggleSwitch;
    ToggleSwitchShowLineNumbers: TToggleSwitch;
    ToggleSwitchShowOnlySQL: TToggleSwitch;
    ToggleSwitchStartMaximized: TToggleSwitch;
    ToggleSwitchStayOnTop: TToggleSwitch;
    FDMemTableFilterLine: TIntegerField;
    MenuItemSeparator2: TMenuItem;
    MenuItemExportData: TMenuItem;
    LabelNewVersionAvailable: TLabel;
    MenuItemSeparator1: TMenuItem;
    MenuItemSetBookmark: TMenuItem;
    MenuItemGoToBookmark: TMenuItem;
    procedure ActionClearCacheExecute(Sender: TObject);
    procedure ActionClearLogExecute(Sender: TObject);
    procedure ActionOpenFileExecute(Sender: TObject);
    procedure ActionOpenLastExecute(Sender: TObject);
    procedure ActionReloadLogExecute(Sender: TObject);
    procedure CheckBoxAutoUpdateClick(Sender: TObject);
    procedure ComboBoxDateFormatChange(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridFilterColEnter(Sender: TObject);
    procedure DBGridFilterColResize(Sender: TObject);
    procedure DBGridFilterColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGridFilterKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure EditSQLFilterKeyPress(Sender: TObject; var Key: Char);
    procedure FDMemTableFilterErrorSetText(Sender: TField; const Text: string);
    procedure FDMemTableFilterTypeSetText(Sender: TField; const Text: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure LabelForceToDateFunctionInfoClick(Sender: TObject);
    procedure LabelIgnoreBasicLogInfoClick(Sender: TObject);
    procedure LabelRowSelectInfoClick(Sender: TObject);
    procedure LabelShowOnlySQLInfoClick(Sender: TObject);
    procedure LabelURLClick(Sender: TObject);
    procedure LogViewerAfterScroll(DataSet: TDataSet);
    procedure MenuItemCopyColumnValueClick(Sender: TObject);
    procedure MenuItemCopyMethodNameClick(Sender: TObject);
    procedure MenuItemCopySQLClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure RadioGroupStylesClick(Sender: TObject);
    procedure SpinEditIntervalChange(Sender: TObject);
    procedure SplitterMoved(Sender: TObject);
    procedure TabSheetSQLShow(Sender: TObject);
    procedure TimerAutoUpdateTimer(Sender: TObject);
    procedure ToggleSwitchForceToDateFunctionClick(Sender: TObject);
    procedure ToggleSwitchHighlightErrorsClick(Sender: TObject);
    procedure ToggleSwitchIgnoreServerDMLogClick(Sender: TObject);
    procedure ToggleSwitchRowSelectClick(Sender: TObject);
    procedure ToggleSwitchShowBottomPanelClick(Sender: TObject);
    procedure ToggleSwitchShowLineNumbersClick(Sender: TObject);
    procedure ToggleSwitchShowOnlySQLClick(Sender: TObject);
    procedure ToggleSwitchStartMaximizedClick(Sender: TObject);
    procedure ToggleSwitchStayOnTopClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LabelNewVersionAvailableClick(Sender: TObject);
    procedure MenuItemSetBookmarkClick(Sender: TObject);
    procedure MenuItemGoToBookmarkClick(Sender: TObject);
    procedure MenuItemExportDataClick(Sender: TObject);
  private
    // grid sync
    FGridWindowProc: Pointer;
    FGridSaveWindowProc: Pointer;

    // class fields
    FLoadingOptionsOnStartup: boolean;
    FSQLFormatter: TSQLFormatter;
    FLastDirectory: string;
    FCurrentFile: string;

    FHighlightErrorsEvent: TDrawColumnCellEvent;
    FHighlightBookmarkEvent: TDrawColumnCellEvent;

    // event handlers
    procedure OnDrawColumnCellHighlightError(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure OnDrawColumnCellHighlightBookmark(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure OnBeforeInsertAbort(DataSet: TDataSet);

    // grid sync
    procedure GetGridWindowProcData;
    procedure GridCustomWindowProc(var Msg: TMessage);

    // private functions
    function GetExportedFileName: string;
    function IsFileNameValid: boolean;
    function IsContentValid: boolean;
    function IsXMLFile: boolean;
    function OpenFile: string;
    function ExtractDateTimeFromFileName: string;

    // private procedures
    procedure AddFilterEmptyLine;
    procedure AssignGridDrawEvent;
    procedure BuildFilter;
    procedure CallUpdateChecking;
    procedure ClearFilters;
    procedure CheckForNewVersion;
    procedure CopyColumnValue;
    procedure CopyMethodName;
    procedure DeleteFolder(const aFolderName: string);
    procedure GetMostRecentLog;
    procedure LoadRecordDetails;
    procedure LoadLastDirectory(aOptions: TOptions);
    procedure LoadLog;
    procedure LoadLogOnTimer;
    procedure LoadOptions;
    procedure LoadDatePreferences(const aDateFormatFromINI: string);
    procedure LoadPreferences(aOptions: TOptions);
    procedure LoadSelectedStyle(const aSelectedStyle: string);
    procedure LoadSQLBottomPanel;
    procedure LoadSQLTab;
    procedure LoadPickLists;
    procedure LoadWindowParams(aOptions: TOptions);
    procedure ManageTimer;
    procedure OpenSQLTab;
    procedure SaveOption(const aKey: string; const aValue: string);
    procedure SetBookmark;
    procedure ShowInfoMessage(const aMessage: string);
    procedure ShowRecordInfo;
  end;

var
  fMonitor: TfMonitor;

implementation

uses
  VCL.Themes, ShellAPI, ClipBrd, Utils.Constants, Utils.Helpers, View.Loading,
  System.UITypes, StrUtils, Utils.Updater;

{$R *.dfm}

function TfMonitor.OpenFile: string;
var
  lOpenDialog: TOpenDialog;
begin
  lOpenDialog := TOpenDialog.Create(nil);
  try
    lOpenDialog.InitialDir := FLastDirectory;
    lOpenDialog.Filter := 'Log de métodos do servidor|spLogMetodoServidor*.txt|Arquivos TXT|*.txt|Arquivos XML|*.xml';
    lOpenDialog.DefaultExt := 'txt';

    if not lOpenDialog.Execute then
      Exit;

     result := Trim(lOpenDialog.FileName);
  finally
    lOpenDialog.Free;
  end;
end;

procedure TfMonitor.ActionOpenLastExecute(Sender: TObject);
begin
  LogViewer.ResetCounter;
  GetMostRecentLog;
  BuildFilter;
end;

procedure TfMonitor.ActionOpenFileExecute(Sender: TObject);
var
  lFileName: string;
begin
  lFileName := OpenFile;

  if lFileName.IsEmpty then
    Exit;

  FCurrentFile := lFileName;
  FLastDirectory := ExtractFilePath(FCurrentFile);
  SaveOption(sLAST_DIRECTORY, FLastDirectory);

  StatusBarDetails.Panels[0].Text := FCurrentFile;
  StatusBarDetails.Panels[1].Text := ExtractDateTimeFromFileName;

  LogViewer.ResetCounter;
  LoadLog;
  BuildFilter;
end;

procedure TfMonitor.ActionReloadLogExecute(Sender: TObject);
begin
  LogViewer.ReloadLog;
end;

procedure TfMonitor.AddFilterEmptyLine;
begin
  FDMemTableFilter.Open;
  FDMemTableFilter.AppendRecord([]);
  FDMemTableFilter.BeforeInsert := OnBeforeInsertAbort;
end;

procedure TfMonitor.ActionClearCacheExecute(Sender: TObject);
begin
  DeleteFolder('Cache');
  DeleteFolder('cfgs');
  DeleteFolder('cfgs_srv');
  DeleteFolder('cfgs_usr');
end;

procedure TfMonitor.ActionClearLogExecute(Sender: TObject);
begin
  LogViewer.EmptyDataSet;
  StatusBarDetails.Panels[2].Text := EmptyStr;
  SynMemoSQL.Lines.Clear;
end;

procedure TfMonitor.AssignGridDrawEvent;
begin
  FHighlightBookmarkEvent := OnDrawColumnCellHighlightBookmark;

  FHighlightErrorsEvent := nil;
  if ToggleSwitchHighlightErrors.IsOn then
    FHighlightErrorsEvent := OnDrawColumnCellHighlightError;
end;

procedure TfMonitor.BuildFilter;
var
  lBuilderFilter: TStringBuilder;
  lField: TField;
  lBookmark: TBookmark;

  function GetFilterString(const aFilter: string): string;
  begin
    result := QuotedStr('%' + aFilter.Trim + '%');
  end;

begin
  lBookmark := LogViewer.GetBookmark;

  if FDMemTableFilter.State in dsEditModes then
    FDMemTableFilter.Post;

  lBuilderFilter := TStringBuilder.Create;
  try
    for lField in FDMemTableFilter.Fields do
    begin
      if not lField.AsString.IsEmpty then
      begin
        lBuilderFilter
          .Append(' and ')
          .Append(lField.FieldName)
          .Append(' like ')
          .Append(GetFilterString(lField.AsString));
      end;
    end;

    if not Trim(EditSQLFilter.Text).IsEmpty then
    begin
      lBuilderFilter.Append(Format(' and SQL like %s',
        [GetFilterString(EditSQLFilter.Text)]));
    end;

    LogViewer.SetLogFilter(lBuilderFilter.ToString);
  finally
    lBuilderFilter.Free;

    if LogViewer.BookmarkValid(lBookmark) then
      LogViewer.GotoBookmark(lBookmark);
  end;
end;

procedure TfMonitor.OpenSQLTab;
begin
  PageControl.ActivePage := TabSheetSQL;
end;

procedure TfMonitor.PopupMenuPopup(Sender: TObject);
begin
  MenuItemCopyColumnValue.Visible := not ToggleSwitchRowSelect.IsOn;
end;

procedure TfMonitor.RadioGroupStylesClick(Sender: TObject);
var
  lStyleName: string;
begin
  lStyleName := RadioGroupStyles.Items[RadioGroupStyles.ItemIndex];
  TStyleManager.SetStyle(lStyleName);
  SaveOption(sSELECTED_STYLE, lStyleName);
end;

function TfMonitor.GetExportedFileName: string;
var
  lSaveDialog: TSaveDialog;
begin
  result := EmptyStr;
  lSaveDialog := TSaveDialog.Create(nil);
  try
    lSaveDialog.Filter := 'Arquivo XML|*.xml';
    lSaveDialog.DefaultExt := 'xml';

    if lSaveDialog.Execute then
      result := lSaveDialog.FileName;
  finally
    lSaveDialog.Free;
  end;
end;

procedure TfMonitor.GetGridWindowProcData;
begin
  FGridWindowProc := MakeObjectInstance(GridCustomWindowProc);
  FGridSaveWindowProc := Pointer(GetWindowLong(DBGrid.Handle, GWL_WNDPROC));
  SetWindowLong(DBGrid.Handle, GWL_WNDPROC, LongInt(FGridWindowProc));
end;

procedure TfMonitor.GetMostRecentLog;
var
  lSearchRec: TSearchRec;
  lFileTime: TFileTime;
  lFileName: string;
begin
  if FindFirst(FLastDirectory + 'spLogMetodoServidor*.txt', faNormal, lSearchRec) <> 0 then
    Exit;

  lFileTime.dwLowDateTime := 0;
  lFileTime.dwHighDateTime := 0;

  repeat
    if CompareFileTime(lSearchRec.FindData.ftCreationTime, lFileTime) = 1 then
    begin
      lFileTime := lSearchRec.FindData.ftCreationTime;
      lFileName := lSearchRec.Name;
    end;
  until FindNext(lSearchRec) <> 0;

  FindClose(lSearchRec);

  FCurrentFile := FLastDirectory + lFileName.Trim;
  StatusBarDetails.Panels[0].Text := FCurrentFile;
  StatusBarDetails.Panels[1].Text := ExtractDateTimeFromFileName;

  LoadLog;
end;

procedure TfMonitor.GridCustomWindowProc(var Msg: TMessage);
begin
  Msg.Result := CallWindowProc(FGridSaveWindowProc, DBGrid.Handle, Msg.Msg, Msg.WParam, Msg.LParam);
  if Msg.Msg = WM_HSCROLL then
    DBGridFilter.Perform(Msg.Msg, Msg.WParam, Msg.LParam);
end;

procedure TfMonitor.LabelURLClick(Sender: TObject);
begin
  ShellExecute(Self.WindowHandle, 'open',
    'https://colabore.softplan.com.br/display/~andre.celestino/LogViewer', nil, nil, SW_SHOWNORMAL);
end;

procedure TfMonitor.LabelIgnoreBasicLogInfoClick(Sender: TObject);
begin
  ShowInfoMessage(
    'Ignora os métodos da classe TfpgServidorDM e TfsgServidorDM,' + sLineBreak +
    'como "Login", "LoginInterno" e "AutenticarUsuario".');
end;

procedure TfMonitor.LabelNewVersionAvailableClick(Sender: TObject);
var
  lUpdater: TUpdater;
begin
  lUpdater := TUpdater.Create;
  try
    lUpdater.UpdateApplication;
  finally
    lUpdater.Free;
  end;
end;

procedure TfMonitor.LabelRowSelectInfoClick(Sender: TObject);
begin
  ShowInfoMessage(
    'Ao habilitar essa opção, a cópia do valor da coluna (Ctrl + Q) ficará indisponível.');
end;

procedure TfMonitor.LabelShowOnlySQLInfoClick(Sender: TObject);
begin
  ShowInfoMessage(
    'Ignora os logs do tipo "ENTRADA", "SAIDA" e "AVISO".' + sLineBreak +
    'Atenção: Ao habilitar essa opção, os erros de metadados não serão exibidos!');
end;

procedure TfMonitor.LabelForceToDateFunctionInfoClick(Sender: TObject);
begin
  ShowInfoMessage('A função "to_date" normalmente é utilizada em SQLs do banco de dados Oracle.');
end;

procedure TfMonitor.LoadDatePreferences(const aDateFormatFromINI: string);
var
  lDateFormat: string;
begin
  lDateFormat := IfThen(aDateFormatFromINI.IsEmpty, sDEFAULT_DATE_FORMAT, aDateFormatFromINI);
  ComboBoxDateFormat.ItemIndex := ComboBoxDateFormat.Items.IndexOf(lDateFormat);
  FSQLFormatter.DateFormat := lDateFormat;
end;

procedure TfMonitor.LoadLastDirectory(aOptions: TOptions);
begin
  FLastDirectory := aOptions.ReadValue(sLAST_DIRECTORY);

  if FLastDirectory.IsEmpty then
    FLastDirectory := sDEFAULT_DIRECTORY;
end;

procedure TfMonitor.LoadRecordDetails;
begin
  LabeledEditDatabase.Text := LogViewer.FieldByName('Database').AsString;
  LabeledEditUser.Text := LogViewer.FieldByName('User').AsString;
  LabeledEditIP.Text := LogViewer.FieldByName('IP').AsString;
  LabeledEditDateTime.Text := LogViewer.FieldByName('DateTime').AsString;
  LabeledEditClass.Text := LogViewer.FieldByName('Class').AsString;
  LabeledEditMethod.Text := LogViewer.FieldByName('Method').AsString;
end;

procedure TfMonitor.LoadLog;
var
  fLoading: TfLoading;
begin
  if not IsFileNameValid then
    Exit;

  if not IsContentValid then
    Exit;

  TimerAutoUpdate.Enabled := False;
  LogViewer.EmptyDataSet;
  SynMemoSQL.Lines.Clear;

  if IsXMLFile then
  begin
    LogViewer.LoadXMLFile(FCurrentFile);
    Exit;
  end;

  fLoading := TfLoading.Create(dmLoading);
  try
    Application.ProcessMessages;
    LogViewer.LogFileName := FCurrentFile;
    LogViewer.LoadLog;
  finally
    fLoading.Free;
  end;

  ShowRecordInfo;
  ManageTimer;
  LoadSQLBottomPanel;
end;

procedure TfMonitor.LoadLogOnTimer;
begin
  if not IsFileNameValid then
    Exit;

  LogViewer.LoadLog;
end;

procedure TfMonitor.LoadOptions;
var
  lOptions: TOptions;
begin
  FLoadingOptionsOnStartup := True;
  lOptions := TOptions.Create;
  try
    LoadPreferences(lOptions);
    LoadWindowParams(lOptions);
    LoadLastDirectory(lOptions);
  finally
    lOptions.Free;
    FLoadingOptionsOnStartup := False;
  end;
end;

procedure TfMonitor.LoadPreferences(aOptions: TOptions);
begin
  CheckBoxAutoUpdate.Checked := aOptions.ReadEnabled(sAUTO_UPDATE_ENABLED);
  SpinEditInterval.Value := StrToIntDef(aOptions.ReadValue(nAUTO_UPDATE_INTERVAL), 1);
  ToggleSwitchShowOnlySQL.Active := aOptions.ReadEnabled(sSHOW_ONLY_SQL);
  ToggleSwitchHighlightErrors.Active := aOptions.ReadEnabled(sHIGHLIGHT_ERRORS);
  ToggleSwitchShowBottomPanel.Active := aOptions.ReadEnabled(sSHOW_BOTTOM_PANEL);
  ToggleSwitchIgnoreServerDMLog.Active := aOptions.ReadEnabled(sIGNORE_BASIC_LOG);
  ToggleSwitchRowSelect.Active := aOptions.ReadEnabled(sROW_SELECT);
  ToggleSwitchStayOnTop.Active := aOptions.ReadEnabled(sSTAY_ON_TOP);
  ToggleSwitchShowLineNumbers.Active := aOptions.ReadEnabled(sSHOW_LINE_NUMBERS);
  ToggleSwitchForceToDateFunction.Active := aOptions.ReadEnabled(sFORCE_TODATE_FUNCTION);
  LoadSelectedStyle(aOptions.ReadValue(sSELECTED_STYLE));
  LoadDatePreferences(aOptions.ReadValue(sDATE_FORMAT));
end;

procedure TfMonitor.LoadSelectedStyle(const aSelectedStyle: string);
var
  lStyleName: string;
begin
  lStyleName := IfThen(aSelectedStyle.IsEmpty, sDEFAULT_STYLE, aSelectedStyle);
  RadioGroupStyles.ItemIndex := RadioGroupStyles.Items.IndexOf(lStyleName);
  TStyleManager.SetStyle(lStyleName);
end;

procedure TfMonitor.LoadSQLBottomPanel;
begin
  if not ToggleSwitchShowBottomPanel.IsOn then
    Exit;

  SynMemoSQL.Lines.Clear;

  if LogViewer.IsSQLEmpty then
    Exit;

  SynMemoSQL.Lines.Text := LogViewer.GetSQL.Replace('  ', sSPACE, [rfReplaceAll]);
end;

procedure TfMonitor.LoadSQLTab;
begin
  SynMemoTab.Lines.Clear;

  if LogViewer.IsSQLEmpty then
  Exit;

  try
    SynMemoTab.Lines.Text := FSQLFormatter.FormatSQL(LogViewer.GetSQL);
    LoadRecordDetails;
  except
    MessageDlg('A SQL possui algum erro de sintaxe :(', mtWarning, [mbOK], 0);
  end;
end;

procedure TfMonitor.LoadPickLists;
begin
  with DBGridFilter.Columns[nTYPE_COLUMN].PickList do
  begin
    Add(EmptyStr);
    Add('ENTRADA');
    Add('AVISO');
    Add('SAIDA');
    Add('SQL');
  end;

  with DBGridFilter.Columns[nERROR_COLUMN].PickList do
  begin
    Add(EmptyStr);
    Add('S');
  end;
end;

procedure TfMonitor.LoadWindowParams(aOptions: TOptions);
var
  lValue: string;
begin
  lValue := aOptions.ReadValue(nSQL_BOTTOM_PANEL_HEIGHT);
  if not lValue.IsEmpty then
    PanelSQL.Height := lValue.ToInteger;

  ToggleSwitchStartMaximized.Active := aOptions.ReadEnabled(sSTART_MAXIMIZED);
  if ToggleSwitchStartMaximized.IsOn then
  begin
    Self.WindowState := wsMaximized;
    Exit;
  end;

  lValue := aOptions.ReadValue(nHEIGHT);
  if not lValue.IsEmpty then
    Self.Height := lValue.ToInteger;

  lValue := aOptions.ReadValue(nWIDTH);
  if not lValue.IsEmpty then
    Self.Width := lValue.ToInteger;

  lValue := aOptions.ReadValue(nLEFT);
  if not lValue.IsEmpty then
    Self.Left := lValue.ToInteger;

  lValue := aOptions.ReadValue(nTOP);
  if not lValue.IsEmpty then
    Self.Top := lValue.ToInteger;
end;

procedure TfMonitor.CallUpdateChecking;
var
  lUpdater: TUpdater;
begin
  lUpdater := TUpdater.Create;
  try
    LabelNewVersionAvailable.Visible := lUpdater.CheckForNewVersion;
  finally
    lUpdater.Free;
  end;
end;

procedure TfMonitor.CheckBoxAutoUpdateClick(Sender: TObject);
var
  lEnable: boolean;
begin
  lEnable := CheckBoxAutoUpdate.Checked;
  LabelInterval.Enabled := lEnable;
  SpinEditInterval.Enabled := lEnable;
  TimerAutoUpdate.Enabled := lEnable;
  SaveOption(sAUTO_UPDATE_ENABLED, lEnable.ToString);
end;

procedure TfMonitor.CheckForNewVersion;
var
  Task: ITask;
begin
  Task := TTask.Create(CallUpdateChecking);
  Task.Start;
end;

procedure TfMonitor.ClearFilters;
var
  lField: TField;
begin
  FDMemTableFilter.Edit;

  for lField in FDMemTableFilter.Fields do
    lField.Clear;

  EditSQLFilter.Clear;
  BuildFilter;
end;

procedure TfMonitor.ManageTimer;
begin
  TimerAutoUpdate.Interval := SpinEditInterval.Value * 1000;
  TimerAutoUpdate.Enabled := CheckBoxAutoUpdate.Checked;
end;

procedure TfMonitor.ComboBoxDateFormatChange(Sender: TObject);
begin
  FSQLFormatter.DateFormat := ComboBoxDateFormat.Text;
  SaveOption(sDATE_FORMAT, ComboBoxDateFormat.Text);
end;

procedure TfMonitor.CopyColumnValue;
var
  lFieldName: string;
begin
  lFieldName := DBGrid.SelectedField.FieldName;
  Clipboard.AsText := LogViewer.CopyValue(lFieldName);
end;

procedure TfMonitor.CopyMethodName;
var
  lMethodName: string;
  lStartPosition: integer;
  lEndPosition: integer;
begin
  lMethodName := LogViewer.FieldByName('Method').AsString;

  if Pos('Consulta (', lMethodName) = 0 then
  begin
    CopyColumnValue;
    Exit;
  end;

  lStartPosition := Pos('(', lMethodName);
  lEndPosition := Pos(')', lMethodName);
  Clipboard.AsText := Copy(lMethodName, Succ(lStartPosition), Pred(lEndPosition - lStartPosition));
end;

procedure TfMonitor.DBGridDblClick(Sender: TObject);
begin
  OpenSQLTab;
end;

procedure TfMonitor.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  if Assigned(FHighlightErrorsEvent) then
    FHighlightErrorsEvent(Sender, Rect, DataCol, Column, State);

  If Assigned(FHighlightBookmarkEvent) then
    FHighlightBookmarkEvent(Sender, Rect, DataCol, Column, State);
end;

procedure TfMonitor.DBGridFilterColEnter(Sender: TObject);
var
  lFieldName: string;
begin
  lFieldName := DBGridFilter.SelectedField.FieldName.ToUpper;
  if (lFieldName.Equals('TYPE')) or (lFieldName.Equals('ERROR')) then
    DBGridFilter.EditorMode := True;
end;

procedure TfMonitor.DBGridFilterColResize(Sender: TObject);
var
  Counter: integer;
begin
  for Counter := 0 to Pred(DBGridFilter.Columns.Count) do
    DBGrid.Columns[Counter].Width := DBGridFilter.Columns[Counter].Width;
end;

procedure TfMonitor.DBGridFilterColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  Counter: integer;
begin
  for Counter := 0 to Pred(DBGridFilter.Columns.Count) do
  begin
    DBGrid.Columns[Counter].FieldName := DBGridFilter.Columns[Counter].FieldName;
    DBGrid.Columns[Counter].Width := DBGridFilter.Columns[Counter].Width;
  end;
end;

procedure TfMonitor.DBGridFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    BuildFilter;
  end;
end;

procedure TfMonitor.DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl, ssShift]) and (Key = 49) then
    SetBookmark;

  if (Shift = [ssCtrl]) and (Key = 49) then
    LogViewer.UseBookMark;
end;

procedure TfMonitor.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    OpenSQLTab;
  end;
end;

procedure TfMonitor.DeleteFolder(const aFolderName: string);
var
  lCurrentPath: string;
  lCacheFolder: string;
  lCommand: string;
begin
  lCurrentPath := ExtractFilePath(FCurrentFile);
  lCacheFolder := Format('%s%s', [lCurrentPath, aFolderName]);
  lCommand := Format('cmd.exe /c rmdir /s /q %s', [lCacheFolder]);
  WinExec(PAnsiChar(ansistring(lCommand)), 0);
end;

procedure TfMonitor.EditSQLFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    BuildFilter;
  end;
end;

function TfMonitor.ExtractDateTimeFromFileName: string;
var
  lDateTime: TStringBuilder;
  lSplitPosition: integer;
  lSubString: string;
begin
  lSplitPosition := Pos('spLogMetodoServidor', FCurrentFile);

  if lSplitPosition = 0 then
    Exit;

  lSubString := Copy(FCurrentFile, lSplitPosition, FCurrentFile.Length);

  lDateTime := TStringBuilder.Create;
  try
    lDateTime
      .Append(Copy(lSubString, 29, 2)).Append('/')
      .Append(Copy(lSubString, 26, 2)).Append('/')
      .Append(Copy(lSubString, 21, 4))
      .Append(sSPACE).Append(sSPACE)
      .Append(Copy(lSubString, 32, 2)).Append(':')
      .Append(Copy(lSubString, 35, 2)).Append(':')
      .Append(Copy(lSubString, 38, 2));

    result := 'Data/Hora do Log:  ' + lDateTime.ToString;
  finally
    lDateTime.Free;
  end;
end;

procedure TfMonitor.OnBeforeInsertAbort(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfMonitor.OnDrawColumnCellHighlightError(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  if LogViewer.IsErrorLine then
  begin
    DBGrid.Canvas.Brush.Color := $00B9B9FF;
    DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfMonitor.OnDrawColumnCellHighlightBookmark(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.FieldName.ToUpper.Equals('LINE') then
  begin
    if LogViewer.IsBookmarkedLine then
    begin
      DBGrid.Canvas.Brush.Color := clMoneyGreen;
      DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TfMonitor.ShowInfoMessage(const aMessage: string);
begin
  MessageDlg(aMessage, mtInformation, [mbOK], 0);
end;

procedure TfMonitor.ShowRecordInfo;
begin
  if LogViewer.IsEmpty then
  begin
    StatusBarDetails.Panels[2].Text := EmptyStr;
    Exit;
  end;

  StatusBarDetails.Panels[2].Text := LogViewer.GetRecordCounter;
end;

procedure TfMonitor.SpinEditIntervalChange(Sender: TObject);
begin
  TimerAutoUpdate.Interval := SpinEditInterval.Value * 1000;
end;

procedure TfMonitor.SplitterMoved(Sender: TObject);
begin
  SaveOption(nSQL_BOTTOM_PANEL_HEIGHT, PanelSQL.Height.ToString);
end;

function TfMonitor.IsContentValid: boolean;
var
  lFileStream: TFileStream;
  lStringListFile: TStringList;
  lStringListLine: TStringList;
begin
  if IsXMLFile then
    Exit(True);

  lFileStream := TFileStream.Create(FCurrentFile, fmOpenRead or fmShareDenyNone);
  lStringListFile := TStringList.Create;
  lStringListLine := TStringList.Create;
  try
    lStringListFile.LoadFromStream(lFileStream);

    lStringListLine.Delimiter := ';';
    lStringListLine.StrictDelimiter := True;
    lStringListLine.DelimitedText := lStringListFile[0];
    result := lStringListLine.Count >= 16;
  finally
    lStringListLine.Free;
    lStringListFile.Free;
    lFileStream.Free;
  end;

  if not result then
  begin
    LogViewer.EmptyDataSet;
    SynMemoSQL.Lines.Clear;
    StatusBarDetails.Panels[0].Text := EmptyStr;
    StatusBarDetails.Panels[1].Text := EmptyStr;

    MessageDlg('Arquivo de log inválido.', mtWarning, [mbOK], 0);
  end;
end;

function TfMonitor.IsFileNameValid: boolean;
begin
  result := False;

  if FCurrentFile.Trim.IsEmpty then
    Exit;

  if not FileExists(FCurrentFile) then
    Exit;

  result := True;
end;

function TfMonitor.IsXMLFile: boolean;
begin
  result := ExtractFileExt(FCurrentFile).ToUpper.Equals('.XML');
end;

procedure TfMonitor.FDMemTableFilterErrorSetText(Sender: TField; const Text: string);
begin
  Sender.AsString := Text;
  BuildFilter;
end;

procedure TfMonitor.FDMemTableFilterTypeSetText(Sender: TField; const Text: string);
begin
  Sender.AsString := Text;
  BuildFilter;
end;

procedure TfMonitor.FormClose(Sender: TObject; var Action: TCloseAction);
var
  lOptions: TOptions;
begin
  lOptions := TOptions.Create;
  try
    lOptions.SaveOption(nHEIGHT, Self.Height.ToString);
    lOptions.SaveOption(nWIDTH, Self.Width.ToString);
    lOptions.SaveOption(nLEFT, Self.Left.ToString);
    lOptions.SaveOption(nTOP, Self.Top.ToString);
  finally
    lOptions.Free;
  end;
end;

procedure TfMonitor.FormCreate(Sender: TObject);
begin
  FSQLFormatter := TSQLFormatter.Create;
  FDMemTableFilter.LogChanges := False;

  AddFilterEmptyLine;
  LoadOptions;
  LoadPickLists;
  AssignGridDrawEvent;
  GetGridWindowProcData;
end;

procedure TfMonitor.FormDestroy(Sender: TObject);
begin
  FSQLFormatter.Free;
  inherited;
end;

procedure TfMonitor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = 49) then
    PageControl.ActivePage := TabSheetLog;

  if (Shift = [ssAlt]) and (Key = 50) then
    PageControl.ActivePage := TabSheetSQL;

  if (Shift = [ssAlt]) and (Key = 51) then
    PageControl.ActivePage := TabSheetOptions;

  if Key = VK_F4 then
    ClearFilters;
end;

procedure TfMonitor.FormShow(Sender: TObject);
begin
  GetMostRecentLog;
  CheckForNewVersion;
end;

procedure TfMonitor.SaveOption(const aKey: string; const aValue: string);
var
  lOptions: TOptions;
begin
  if FLoadingOptionsOnStartup then
    Exit;

  lOptions := TOptions.Create;
  try
    lOptions.SaveOption(aKey, aValue);
  finally
    lOptions.Free;
  end;
end;

procedure TfMonitor.SetBookmark;
begin
  LogViewer.SetBookmark;
  DBGrid.Refresh;
end;

procedure TfMonitor.LogViewerAfterScroll(DataSet: TDataSet);
begin
  ShowRecordInfo;
  LoadSQLBottomPanel;

  if PageControl.ActivePage = TabSheetSQL then
    LoadSQLTab;
end;

procedure TfMonitor.MenuItemCopyColumnValueClick(Sender: TObject);
begin
  CopyColumnValue;
end;

procedure TfMonitor.MenuItemCopyMethodNameClick(Sender: TObject);
begin
  CopyMethodName;
end;

procedure TfMonitor.MenuItemCopySQLClick(Sender: TObject);
begin
  SynMemoTab.Lines.Text := FSQLFormatter.FormatSQL(LogViewer.GetSQL);
  Clipboard.AsText := SynMemoTab.Lines.Text;
end;

procedure TfMonitor.MenuItemExportDataClick(Sender: TObject);
var
  lMemTable: TFDLogViewer;
  lFileName: string;
begin
  lFileName := GetExportedFileName;

  if lFileName.IsEmpty then
    Exit;

  lMemTable := TFDLogViewer.Create(nil);
  try
    lMemTable.CopyDataSet(LogViewer, [coRestart, coAppend]);
    lMemTable.SaveToFile(lFileName);
  finally
    lMemTable.Free;
  end;
end;

procedure TfMonitor.MenuItemGoToBookmarkClick(Sender: TObject);
begin
  LogViewer.UseBookMark;
end;

procedure TfMonitor.MenuItemSetBookmarkClick(Sender: TObject);
begin
  SetBookmark;
end;

procedure TfMonitor.TabSheetSQLShow(Sender: TObject);
begin
  LoadSQLTab;
end;

procedure TfMonitor.TimerAutoUpdateTimer(Sender: TObject);
begin
  LoadLogOnTimer;
end;

procedure TfMonitor.ToggleSwitchHighlightErrorsClick(Sender: TObject);
var
  lEnable: boolean;
begin
  lEnable := ToggleSwitchHighlightErrors.IsOn;
  SaveOption(sHIGHLIGHT_ERRORS, lEnable.ToString);
  AssignGridDrawEvent;
end;

procedure TfMonitor.ToggleSwitchIgnoreServerDMLogClick(Sender: TObject);
var
  lEnable: boolean;
begin
  lEnable := ToggleSwitchIgnoreServerDMLog.IsOn;
  SaveOption(sIGNORE_BASIC_LOG, lEnable.ToString);
  LogViewer.IgnoreServerDMLog := lEnable;

  if FCurrentFile.Trim.IsEmpty then
    Exit;

  LogViewer.ResetCounter;
  LoadLog;
end;

procedure TfMonitor.ToggleSwitchRowSelectClick(Sender: TObject);
var
  lEnable: boolean;
begin
  lEnable := ToggleSwitchRowSelect.IsOn;
  SaveOption(sROW_SELECT, lEnable.ToString);

  LabelCtrlQ.Enabled := not lEnable;
  LabelCopySQL.Enabled := not lEnable;

  DBGrid.Options := DBGrid.Options - [dgRowSelect];
  if lEnable then
    DBGrid.Options := DBGrid.Options + [dgRowSelect];
end;

procedure TfMonitor.ToggleSwitchShowLineNumbersClick(Sender: TObject);
var
  lEnable: boolean;
begin
  lEnable := ToggleSwitchShowLineNumbers.IsOn;
  SynMemoSQL.Gutter.Visible := lEnable;
  SynMemoTab.Gutter.Visible := lEnable;
  SaveOption(sSHOW_LINE_NUMBERS, lEnable.ToString);
end;

procedure TfMonitor.ToggleSwitchShowBottomPanelClick(Sender: TObject);
var
  lEnable: boolean;
begin
  lEnable := ToggleSwitchShowBottomPanel.IsOn;
  PanelSQL.Visible := lEnable;
  Splitter.Visible := lEnable;
  SaveOption(sSHOW_BOTTOM_PANEL, lEnable.ToString);

  if lEnable then
    LoadSQLBottomPanel;
end;

procedure TfMonitor.ToggleSwitchShowOnlySQLClick(Sender: TObject);
var
  lEnable: boolean;
begin
  lEnable := ToggleSwitchShowOnlySQL.IsOn;
  SaveOption(sSHOW_ONLY_SQL, lEnable.ToString);
  LogViewer.ShowOnlySQL := lEnable;

  if FCurrentFile.Trim.IsEmpty then
    Exit;

  LogViewer.ResetCounter;
  LoadLog;
end;

procedure TfMonitor.ToggleSwitchStartMaximizedClick(Sender: TObject);
begin
  SaveOption(sSTART_MAXIMIZED, ToggleSwitchStartMaximized.IsOn.ToString);
end;

procedure TfMonitor.ToggleSwitchStayOnTopClick(Sender: TObject);
var
  lEnable: boolean;
begin
  lEnable := ToggleSwitchStayOnTop.IsOn;
  SaveOption(sSTAY_ON_TOP, lEnable.ToString);

  Self.FormStyle := fsNormal;
  if lEnable then
    Self.FormStyle := fsStayOnTop;
end;

procedure TfMonitor.ToggleSwitchForceToDateFunctionClick(Sender: TObject);
var
  lEnable: boolean;
begin
  lEnable := ToggleSwitchForceToDateFunction.IsOn;
  FSQLFormatter.UseToDateFunction := lEnable;
  LabelDateFormat.Enabled := not lEnable;
  ComboBoxDateFormat.Enabled := not lEnable;
  SaveOption(sFORCE_TODATE_FUNCTION, lEnable.ToString);

  if FCurrentFile.Trim.IsEmpty then
    Exit;

  LoadSQLTab;
end;

end.