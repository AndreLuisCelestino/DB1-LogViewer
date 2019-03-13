unit View.Loading;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfLoading = class(TForm)
    PanelLoading: TPanel;
    LabelMessage: TLabel;
  public
    procedure ShowUpdateMessage;
  end;

var
  fLoading: TfLoading;

implementation

{$R *.dfm}

{ TfLoading }

procedure TfLoading.ShowUpdateMessage;
begin
  LabelMessage.Caption := 'Atualizando...';
  Self.Show;
  Application.ProcessMessages;
end;

end.
