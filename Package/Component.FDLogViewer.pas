unit Component.FDLogViewer;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFDLogViewer = class(TFDMemTable)
  private
    // Class Fields
    FLogFileName: string;
    FCounter: integer;
    FStringListFile: TStringList;
    FStringListLine: TStringList;
    FShowOnlySQL: boolean;
    FIgnoreServerDMLog: boolean;

    // DataSet Fields
    FFieldType: TField;
    FFieldDatabase: TField;
    FFieldUser: TField;
    FFieldIP: TField;
    FFieldClass: TField;
    FFieldMethod: TField;
    FFieldSQL: TField;
    FFieldDateTime: TField;
    FFieldError: TField;

    // private functions
    function GetType: string;
    function GetDateTime: string;
    function GetError: string;
    function GetClass: string;

    // private procedures
    procedure AppendLineToDataSet;
    procedure AssignFields;
    procedure DefineFields;
    procedure LoadFile;
    procedure Initialize;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    // public functions
    function IsServerDMClass(const aClassName: string): boolean;
    function IsErrorLine: boolean;
    function IsSQLEmpty: boolean;
    function CopyValue(const aField: string): string;
    function GetSQL: string;
    function GetRecordCounter: string;

    // public procedures
    procedure LoadLog;
    procedure ReloadLog;
    procedure RemoveFilter;
    procedure ResetCounter;
    procedure SetLogFilter(const aFilter: string);

    // properties
    property LogFileName: string read FLogFileName write FLogFileName;
    property ShowOnlySQL: boolean read FShowOnlySQL write FShowOnlySQL;
    property IgnoreServerDMLog: boolean read FIgnoreServerDMLog write FIgnoreServerDMLog;
  end;

procedure Register;

const
  POSITION_TYPE = 5;
  POSITION_DATABASE = 6;
  POSITION_USER = 9;
  POSITION_IP = 10;
  POSITION_DATE = 11;
  POSITION_TIME = 12;
  POSITION_CLASS = 13;
  POSITION_METHOD = 14;
  POSITION_SQL = 15;

implementation

uses
  Dialogs;

procedure Register;
begin
  RegisterComponents('LogViewer', [TFDLogViewer]);
end;

{ TFDLogViewer }

procedure TFDLogViewer.AppendLineToDataSet;
var
  lCounter: integer;
begin
  Self.Append;
  FFieldType.AsString := FStringListLine[POSITION_TYPE];
  FFieldDatabase.AsString := FStringListLine[POSITION_DATABASE];
  FFieldUser.AsString := FStringListLine[POSITION_USER];
  FFieldIP.AsString := FStringListLine[POSITION_IP];
  FFieldDateTime.AsString := GetDateTime;
  FFieldClass.AsString := FStringListLine[POSITION_CLASS];
  FFieldMethod.AsString := FStringListLine[POSITION_METHOD];

  FFieldSQL.AsString := FStringListLine[POSITION_SQL];
  for lCounter := Succ(POSITION_SQL) to Pred(FStringListLine.Count) do
  begin
    FFieldSQL.AsString := FFieldSQL.AsString + ';' + FStringListLine[lCounter];
  end;

  FFieldError.AsString := GetError;
  Self.Post;
end;

procedure TFDLogViewer.AssignFields;
begin
  FFieldType := Self.FieldByName('Type');
  FFieldDatabase := Self.FieldByName('Database');
  FFieldUser := Self.FieldByName('User');
  FFieldIP := Self.FieldByName('IP');
  FFieldClass := Self.FieldByName('Class');
  FFieldMethod := Self.FieldByName('Method');
  FFieldSQL := Self.FieldByName('SQL');
  FFieldDateTime := Self.FieldByName('DateTime');
  FFieldError := Self.FieldByName('Error');
end;

function TFDLogViewer.CopyValue(const aField: string): string;
begin
  result := Self.FieldByName(aField).AsString.Trim;
end;

constructor TFDLogViewer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Initialize;
  DefineFields;
  AssignFields;
end;

procedure TFDLogViewer.DefineFields;
begin
  with Self.FieldDefs do
  begin
    Add('Type', ftString, 10);
    Add('Database', ftString, 20);
    Add('User', ftString, 50);
    Add('IP', ftString, 20);
    Add('Class', ftString, 100);
    Add('Method', ftString, 100);
    Add('SQL', ftString, 30000);
    Add('DateTime', ftString, 20);
    Add('Error', ftString, 1);
  end;
  Self.CreateDataSet;

  Self.FilterOptions := [foCaseInsensitive];
  Self.LogChanges := False;
end;

destructor TFDLogViewer.Destroy;
begin
  FStringListLine.Free;
  FStringListFile.Free;
  inherited;
end;

function TFDLogViewer.GetClass: string;
begin
  result := FStringListLine[POSITION_CLASS];
end;

function TFDLogViewer.GetDateTime: string;
begin
  result := Format('%s  %s', [FStringListLine[POSITION_DATE],
    Copy(FStringListLine[POSITION_TIME], 0, 8)]);
end;

function TFDLogViewer.GetError: string;
begin
  result := EmptyStr;

  if (GetType.Equals('SAIDA')) and (not FStringListLine[POSITION_SQL].IsEmpty) then
    result := 'S';
end;

function TFDLogViewer.GetRecordCounter: string;
begin
  result := Format('%d / %d', [Self.RecNo, Self.RecordCount]);
end;

function TFDLogViewer.GetSQL: string;
begin
  result := FFieldSQL.AsString;
end;

function TFDLogViewer.GetType: string;
begin
  result := FStringListLine[POSITION_TYPE];
end;

procedure TFDLogViewer.Initialize;
begin
  FStringListFile := TStringList.Create;
  FStringListLine := TStringList.Create;

  Self.FCounter := 0;
  Self.FShowOnlySQL := False;
  Self.FLogFileName := EmptyStr;
  Self.Filter := '(1 = 1)';
  Self.Filtered := True;

  FStringListLine.Delimiter := ';';
  FStringListLine.StrictDelimiter := True;
end;

function TFDLogViewer.IsServerDMClass(const aClassName: string): boolean;
begin
  result := aClassName.Contains('TFPGSERVIDORDM') or aClassName.Contains('TFSGSERVIDORDM');
end;

function TFDLogViewer.IsErrorLine: boolean;
begin
  result := FFieldError.AsString = 'S';
end;

function TFDLogViewer.IsSQLEmpty: boolean;
begin
  result := FFieldSQL.AsString.IsEmpty;
end;

procedure TFDLogViewer.LoadFile;
var
  lFileStream: TFileStream;
begin
  lFileStream := TFileStream.Create(FLogFileName, fmOpenRead or fmShareDenyNone);
  try
    FStringListFile.LoadFromStream(lFileStream);
  finally
    lFileStream.Free;
  end;
end;

procedure TFDLogViewer.LoadLog;
var
  lCounter: integer;
  lOriginalAfterScroll: TDataSetNotifyEvent;
begin
  if FLogFileName.IsEmpty then
    Exit;

  LoadFile;

  if FCounter = Pred(FStringListFile.Count) then
    Exit;

  lOriginalAfterScroll := Self.AfterScroll;
  Self.AfterScroll := nil;
  Self.DisableControls;
  try
    for lCounter := FCounter to Pred(FStringListFile.Count) do
    begin
      FStringListLine.DelimitedText := FStringListFile[lCounter];

      if FShowOnlySQL and (not GetType.Equals('SQL')) then
        Continue;

      if FIgnoreServerDMLog and IsServerDMClass(GetClass.ToUpper) then
        Continue;

      AppendLineToDataSet;
    end;
  finally
    Self.AfterScroll := lOriginalAfterScroll;
    Self.EnableControls;
    Self.Last;
  end;
  FCounter := Pred(FStringListFile.Count);
end;

procedure TFDLogViewer.ReloadLog;
begin
  Self.EmptyDataSet;
  FCounter := 0;
  LoadLog;
end;

procedure TFDLogViewer.RemoveFilter;
begin
  Self.Filter := '(1 = 1)';
  Self.Last;
end;

procedure TFDLogViewer.ResetCounter;
begin
  FCounter := 0;
end;

procedure TFDLogViewer.SetLogFilter(const aFilter: string);
begin
  Self.Filter := '(1 = 1)' + aFilter;
  Self.Filtered := True;
  Self.Last;
end;

end.
