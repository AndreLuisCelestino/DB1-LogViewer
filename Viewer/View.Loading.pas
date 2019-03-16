unit View.Loading;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TDisplayMessage = (dmLoading, dmUpdating);

  TfLoading = class(TForm)
    PanelLoading: TPanel;
    LabelMessage: TLabel;
  public
    constructor Create(const aDisplayMessage: TDisplayMessage); reintroduce;
  end;

implementation

{$R *.dfm}

{ TfLoading }

constructor TfLoading.Create(const aDisplayMessage: TDisplayMessage);
var
  lMessage: string;
begin
  inherited Create(nil);

  case aDisplayMessage of
    dmLoading: lMessage := 'Carregando...';
    dmUpdating: lMessage := 'Atualizando...';
  end;

  LabelMessage.Caption := lMessage;
  Self.Show;
  Application.ProcessMessages;
end;

end.
