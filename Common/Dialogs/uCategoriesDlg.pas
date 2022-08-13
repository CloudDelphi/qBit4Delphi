unit uCategoriesDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uqBitObject, uqBitAPI, uqBitAPITypes,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TqBitCatDlg = class(TForm)
    LBCat: TListBox;
    EditName: TEdit;
    EditPath: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    BtnSelect: TButton;
    BtnCancel: TButton;
    LblDefault: TLabel;
    BtnClose: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LBCatClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LBCatDblClick(Sender: TObject);
    procedure EditPathChange(Sender: TObject);
  private
    { Private declarations }
    FCatList: TqBitCategoriesType;
    procedure Refresh(SelCat: string);
    function ShowModal: Integer; override;
  public
    { Public declarations }
    qBit: TqBitObject;
    Selected: TqBitCategoryType;
    function ShowAsModal(qB: TqBitObject; SelectMode: Boolean = True): TModalResult;
  end;

var
  qBitCatDlg: TqBitCatDlg;

implementation

{$R *.dfm}

{ TCategoriesDlg }

procedure TqBitCatDlg.BtnSelectClick(Sender: TObject);
begin
  FreeAndNil(Selected);
  ModalResult := mrNone;
  if LBCat.ItemIndex = -1 then Exit;
  Selected := TqBitCategoryType(FCatList.Fcategories.Items[ LBCat.Items[LBCat.ItemIndex] ]).Clone as TqBitCategoryType;
  ModalResult := mrOK;
end;

procedure TqBitCatDlg.Button1Click(Sender: TObject);
var
  Temp: TqBitTorrentBaseType;
begin
  if Trim(EditName.Text) = '' then Exit;
  if FCatList.Fcategories.TryGetValue(EditName.Text, Temp) then
  begin
    if qBit.EditCategory(EditName.Text, EditPath.Text) then
      Refresh(EditName.Text);
  end else begin
    if qBit.AddNewCategory(EditName.Text, EditPath.Text) then
      Refresh(EditName.Text);
  end;
end;

procedure TqBitCatDlg.Button2Click(Sender: TObject);
var
  Temp: TqBitTorrentBaseType;
begin
  if FCatList.Fcategories.TryGetValue(EditName.Text, Temp) then
  begin
    if qBit.RemoveCategories(EditName.Text) then
      Refresh('');
  end;
end;

procedure TqBitCatDlg.EditPathChange(Sender: TObject);
begin
  LblDefault.Visible := EditPath.Text = '';
end;

procedure TqBitCatDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FCatList);
end;

procedure TqBitCatDlg.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Selected);
end;

procedure TqBitCatDlg.FormShow(Sender: TObject);
begin
  FCatList := qBit.GetAllCategories;
  if FCatList = nil then
  begin
    Self.ModalResult := mrCancel;
    PostMessage(Handle, WM_CLOSE, 0, 0);
    Exit;
  end;
  Refresh('');
end;

procedure TqBitCatDlg.LBCatClick(Sender: TObject);
begin
  if LBCat.ItemIndex = -1 then Exit;
  BtnSelect.Enabled := True;
  var ActiveCat := TqBitCategoryType(FCatList.Fcategories.Items[ LBCat.Items[LBCat.ItemIndex] ]);
  EditName.Text := ActiveCat.Fname;
  EditPath.Text := ActiveCat.FsavePath;
end;

procedure TqBitCatDlg.LBCatDblClick(Sender: TObject);
begin
  BtnSelectClick(Self);
end;

procedure TqBitCatDlg.Refresh(SelCat: string);
begin
  FCatList.Free;
  FCatList := qBit.GetAllCategories;
  LBCat.Clear;
  LBCat.Sorted := True;
  for var Cat in FCatList.Fcategories do
    LBCat.Items.Add(Cat.Key);
  LBCat.ItemIndex :=  LBCat.Items.IndexOf(SelCat);

  //BtnSelect.Enabled := LBCat.ItemIndex <> -1
end;

function TqBitCatDlg.ShowModal: Integer;
begin
  ShowMessage('Please Call qBitCatDlg.ShowAsModal instead of ShowModal...');
  Result := mrNone;
end;

function TqBitCatDlg.ShowAsModal(qB: TqBitObject; SelectMode: Boolean): TModalResult;
begin
  qBit := qB;

  // UI Buttons
  BtnSelect.Visible := SelectMode;
  BtnCancel.Visible := SelectMode;
  BtnClose.Visible := not SelectMode;
  if SelectMode then
  begin

  end else begin
  end;

  Result := inherited ShowModal;
end;

end.
