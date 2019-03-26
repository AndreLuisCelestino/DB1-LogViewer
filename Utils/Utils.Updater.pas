unit Utils.Updater;

interface

uses
  IdFTP;

type
  TUpdater = class
  private
    FApplicationPath: string;

    function GetLocalFileDate: TDateTime;
    procedure ConnectToFTP(var aIdFTP: TIdFTP);
    procedure GetApplicationPath;
    procedure ReplaceFiles(const aOldFile, aNewFile: string);
  public
    function CheckForNewVersion: boolean;
    procedure UpdateApplication;
  end;

implementation

uses
  System.SysUtils, System.Classes, System.UITypes, Winapi.Windows, VCL.Dialogs,
  IdFTPList, ShellAPI, VCL.Forms, View.Loading, IdFTPCommon;

{ TUpdate }

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
  RenameFile(PWideChar(lOldFilePath), PWideChar(lNewFilePath));
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
    ConnectToFTP(lIdFTP);
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

procedure TUpdater.ConnectToFTP(var aIdFTP: TIdFTP);
begin
  aIdFTP.Passive := True;
  aIdFTP.TransferType := ftBinary;
  aIdFTP.Host := 'ftp.alternasistema.info';
  aIdFTP.Username := 'u947802498.alterna';
  aIdFTP.Password := 'ftp#alterna2018';
  aIdFTP.Connect;
  aIdFTP.ChangeDir('/logviewer');
end;

procedure TUpdater.UpdateApplication;
var
  lLoadingForm: TfLoading;
  lIdFTP: TIdFTP;
begin
  lIdFTP := TIdFTP.Create(nil);
  lLoadingForm := TfLoading.Create(dmUpdating);
  try
    GetApplicationPath;
    ConnectToFTP(lIdFTP);

    DeleteFile(PWideChar(FApplicationPath + 'LogViewerNew.exe'));
    DeleteFile(PWideChar(FApplicationPath + 'LogViewerBKP.exe'));

    lIdFTP.Get('LogViewer.exe', FApplicationPath + 'LogViewerNew.exe', True, False);

    ReplaceFiles('LogViewer.exe', 'LogViewerBKP.exe');
    ReplaceFiles('LogViewerNew.exe', 'LogViewer.exe');

    lLoadingForm.Close;
    MessageDlg('O LogViewer será reiniciado!', mtInformation, [mbOK], 0);

    ShellExecute(Application.Handle, nil, PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
    Application.Terminate;
  finally
    lLoadingForm.Free;
    lIdFTP.Free;
  end;
end;

end.
