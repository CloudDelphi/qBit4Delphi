unit uSimple;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uqBitObject, uqBitAPI, uqBitAPITypes,
  Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    qB: TqBitObject;
    qBMain: TqBitMainDataType;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses uSelectServer;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qBMain.Free;
  qB.Free;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 if SelectServerDlg.ShowModal = mrOk then
 begin
  var Server := SelectServerDlg.GetServer;
  qB := TqBitObject.Connect(
    Server.FHP,
    Server.FUN,
    Server.FPW
  );
  if not assigned(qB) then
  begin
    showMessage('Cannot connect to : ' + Server.FHP);
  end;
  qBMain :=qB.GetMainData(0); // >> Full Data
  Timer1.Interval := qBMain.Fserver_state.Frefresh_interval; // The update interval is defined by the server
  Timer1.Enabled := True;
 end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  var Update := qb.GetMainData(qBMain.Frid); // >> Get The Data since the last getMain;
  qBMain.Merge(Update); // we merge the update : qBMain is now up to date
  Update.Free;
  ////////////////  Few Properties...
  Caption := Format('Torrents : %d', [qBMain.Ftorrents.Count]);
  Caption := Caption + ' / ';
  Caption := Caption + Format('Dl : %s KiB/s', [qBMain.Fserver_state.Fdl_info_speed div 1024 ]);
  Caption := Caption + ' / ';
  Caption := Caption + Format('Up : %s KiB/s', [qBMain.Fserver_state.FUp_info_speed div 1024 ]);
end;

end.