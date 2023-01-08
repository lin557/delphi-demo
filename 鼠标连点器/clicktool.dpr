program clicktool;

uses
  Vcl.Forms,
  uFrmClick in 'souce\uFrmClick.pas' {FrmClick},
  uWorkThead in 'souce\uWorkThead.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmClick, FrmClick);
  Application.Run;
end.
