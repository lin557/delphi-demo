unit uWorkThead;

interface

uses
  Winapi.Windows, System.Classes;

type
  TWorkThead = class(TThread)
  private
    FIntervel: Integer;
    FLast: Cardinal;
    FOnTimer: TNotifyEvent;
    FEnabled: Boolean;
    procedure DoWork();
  protected
    procedure Execute(); override;
  public
    constructor Create();
    destructor Destroy; override;

    property Intervel: Integer read FIntervel write FIntervel;
    property OnTimer: TNotifyEvent read FOnTimer write FOnTimer;
    property Enabled: Boolean read FEnabled write FEnabled;
  end;

implementation

{ TWorkThead }

constructor TWorkThead.Create();
begin
  inherited Create(False);
  FIntervel := 1000;
  FEnabled := False;
end;

destructor TWorkThead.Destroy;
begin
  Terminate;
  WaitForSingleObject(Self.Handle, 1000);
  inherited;
end;

procedure TWorkThead.DoWork;
begin
  if Assigned(OnTimer) then
    FOnTimer(Self);
end;

procedure TWorkThead.Execute;
var
  t: Cardinal;
begin
  inherited;
  while not Terminated do
  begin
    if FEnabled then
    begin
      t := GetTickCount;
      if t - FLast >= Cardinal(FIntervel) then
      begin
        DoWork;
        FLast := t;
      end else
      begin
        Sleep(1);
      end;
    end else
    begin
      Sleep(5);
    end;
  end;
end;

end.
