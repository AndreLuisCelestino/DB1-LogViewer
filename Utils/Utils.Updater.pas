unit Utils.Updater;

interface

uses
  IdFTP;

type
  TUpdater = class
  private
    FApplicationPath: string;

    function GetLocalFileDate: TDateTime;
    procedure CreateBackup;
    procedure GetApplicationPath;
    procedure ReplaceFiles(const aOldFile, aNewFile: string);
    procedure RestoreBackup;
    procedure SetServerProperties(var aIdFTP: TIdFTP);
  public
    function CheckForNewVersion: boolean;
    procedure UpdateApplication;
  end;

implementation

uses
  System.SysUtils, System.Classes, System.Threading, System.UITypes, Winapi.Windows, VCL.Dialogs,
  IdFTPList, ShellAPI, VCL.Forms, View.Loading, IdFTPCommon;

{ TUpdater }

procedure TUpdater.CreateBackup;
begin
  ReplaceFiles('LogViewer.exe', 'LogViewerBKP.exe');
end;

procedure TUpdater.GetApplicationPath;
begin
  FApplicationPath := ExtractFilePath(Application.ExeName);
end;

function TUpdater.GetLocalFileDate: TDateTime;
begin
  FileAge(Application.ExeName, result);
end;

procedure TUpdater.ReplaceFiles(const aOldFile, aNewFile: string);
var
  lOldFilePath, lNewFilePath: string;
begin
  lOldFilePath := FApplicationPath + aOldFile;
  lNewFilePath := FApplicationPath + aNewFile;

  DeleteFile(PWideChar(lNewFilePath));
  RenameFile(PWideChar(lOldFilePath), PWideChar(lNewFilePath));
end;

procedure TUpdater.RestoreBackup;
begin
  if not FileExists(FApplicationPath + 'LogViewer.exe') then
    ReplaceFiles('LogViewerBKP.exe', 'LogViewer.exe');
end;

function TUpdater.CheckForNewVersion: boolean;
var
  lFile: TCollectionItem;
  lIdFTPListItem: TIdFTPListItem;
  lIdFTP: TIdFTP;
begin
  result := False;

  lIdFTP := TIdFTP.Create(nil);
  try
    SetServerProperties(lIdFTP);

    lIdFTP.Connect;
    lIdFTP.ChangeDir('/logviewer');
    lIdFTP.List(nil, EmptyStr, True);

    for lFile in lIdFTP.DirectoryListing do
    begin
      lIdFTPListItem := (lFile as TIdFTPListItem);

      if not lIdFTPListItem.FileName.ToUpper.Equals('LOGVIEWER.EXE') then
        Continue;

      result := GetLocalFileDate < lIdFTPListItem.ModifiedDate;
    end;
  finally
    lIdFTP.Disconnect;
    lIdFTP.Free;
  end;
end;

procedure TUpdater.SetServerProperties(var aIdFTP: TIdFTP);
begin
  aIdFTP.Passive := True;
  aIdFTP.TransferType := ftBinary;
  aIdFTP.Host := 'ftp.alternasistema.info';
  aIdFTP.Username := 'u947802498.alterna';
  aIdFTP.Password := 'ftp#alterna2018';
end;

procedure TUpdater.UpdateApplication;
var
  lLoadingForm: TfLoading;
  lIdFTP: TIdFTP;
begin
  lIdFTP := TIdFTP.Create(nil);
  lLoadingForm := TfLoading.Create(dmUpdating);
  try
    try
      GetApplicationPath;
      SetServerProperties(lIdFTP);
      lIdFTP.Connect;
      lIdFTP.ChangeDir('/logviewer');

      lIdFTP.Get('LogViewer.exe', FApplicationPath + 'LogViewerNew.exe', True, False);
      CreateBackup;
      ReplaceFiles('LogViewerNew.exe', 'LogViewer.exe');

      lLoadingForm.Close;
      MessageDlg('O LogViewer será reiniciado!', mtInformation, [mbOK], 0);
    except
      RestoreBackup;
    end;

    ShellExecute(Application.Handle, nil, PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
    Application.Terminate;
  finally
    lLoadingForm.Free;
    lIdFTP.Free;
  end;
end;

end.
