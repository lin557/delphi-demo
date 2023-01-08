unit uFrmClick;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,

  uWorkThead, Vcl.StdCtrls;

type
  TFrmClick = class(TForm)
    TrackSpeed: TTrackBar;
    LblSpeed: TLabel;
    PnlMain: TPanel;
    Label2: TLabel;
    RadioOne: TRadioButton;
    RadioDouble: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TrackSpeedChange(Sender: TObject);
  private
    { Private declarations }
    FWork: TWorkThead;
    FAatom: Atom;
    procedure DoTimer(Sender: TObject);
    procedure HotKey(var Msg: TMessage); message WM_HOTKEY;
  public
    { Public declarations }
  end;

var
  FrmClick: TFrmClick;

implementation

{$R *.dfm}

procedure TFrmClick.DoTimer(Sender: TObject);
begin
  mouse_event (MOUSEEVENTF_LEFTDOWN or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0 );
  if RadioDouble.Checked then
    mouse_event (MOUSEEVENTF_LEFTDOWN or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0 );
end;

procedure TFrmClick.FormCreate(Sender: TObject);
begin
  FWork := TWorkThead.Create;
  FWork.OnTimer := DoTimer;
  Self.KeyPreview := true;
  FAatom := GlobalAddAtom('MYHOTKEY1');               //全局热键ID
  RegisterHotKey(Handle, FAatom, 0, VK_F11);    //注册F9热键
end;

procedure TFrmClick.FormDestroy(Sender: TObject);
begin
  UnRegisterHotKey(Handle, FAatom); //反注册全局热键
  GlobalDeleteAtom(FAatom);
  FWork.Free;
end;

procedure TFrmClick.HotKey(var Msg: TMessage);
begin
  if Msg.LParamHi = VK_F11 then // 假设热键为 ALT+F9
  begin
    FWork.Intervel := TrackSpeed.Position;
    FWork.Enabled := not FWork.Enabled;
    TrackSpeed.Enabled := not FWork.Enabled;
  end;
end;

procedure TFrmClick.TrackSpeedChange(Sender: TObject);
var
  fRate: Double;
begin
  FWork.Intervel := TrackSpeed.Position;

  fRate := 1000 / FWork.Intervel;
  LblSpeed.Caption := Format('速度: %f 次/秒', [fRate]);
end;

end.
