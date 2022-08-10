unit uIPAPIDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    LinkLabel2: TLinkLabel;
    procedure Button1Click(Sender: TObject);
    procedure LinkLabel2LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses uIP_API, uqBitUtils, ShellAPI;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin

  var IP := TIP_API.FromURL(Self.LabeledEdit1.Text);
  if IP = nil then Exit;

  Memo1.Clear;
  var Props := GetRTTIReadableValues(IP, TIP_API);
  for var Prop in Props do
    Memo1.Lines.Add('  ' + Prop.Key + ' : ' +  varToStr(Prop.Value));
  Props.Free;

  IP.Free;
end;

procedure TForm2.LinkLabel2LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(0, 'Open', PChar(Link), PChar(''), nil, SW_SHOWNORMAL);
end;

end.
