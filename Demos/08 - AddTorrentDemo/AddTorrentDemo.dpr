program AddTorrentDemo;
uses

  {$IFDEF FASTMM4}
    FastMM4,  //  MPL 1.1, LGPL 2.1 (https://github.com/pleriche/FastMM4)
  {$ENDIF}

  {$IFDEF VER340}
    REST.Json.Types in '..\..\API\JSON\21\REST.Json.Types.pas',
    REST.JsonReflect in '..\..\API\JSON\21\REST.JsonReflect.pas',
    System.JSON in '..\..\API\JSON\21\System.JSON.pas',
    REST.Json in '..\..\API\JSON\21\REST.Json.pas',
  {$ENDIF }
  {$IFDEF VER350}
    REST.Json.Types in '..\..\API\JSON\22\REST.Json.Types.pas',
    REST.JsonReflect in '..\..\API\JSON\22\REST.JsonReflect.pas',
    System.JSON in '..\..\API\JSON\22\System.JSON.pas',
    REST.Json in '..\..\API\JSON\22\REST.Json.pas',
  {$ENDIF}
  uqBitAPITypes in '..\..\API\uqBitAPITypes.pas',
  uqBitAPI in '..\..\API\uqBitAPI.pas',
  uqBitObject in '..\..\API\uqBitObject.pas',

  Vcl.Forms,
  uAddTorrentDemo in 'uAddTorrentDemo.pas' {FrmAddTorrent},
  uqBitPatchChecker in '..\..\Common\uqBitPatchChecker.pas',
  uqBitFormat in '..\..\Common\uqBitFormat.pas',
  uqBitAddServerDlg in '..\..\Common\Dialogs\uqBitAddServerDlg.pas' {qBitAddServerDlg},
  uqBitAddTorrentDlg in '..\..\Common\Dialogs\uqBitAddTorrentDlg.pas' {qBitAddTorrentDlg},
  uTorrentReader in '..\..\Common\uTorrentReader.pas',
  uBEncode in '..\..\Common\uBEncode.pas',
  uCategoriesDlg in '..\..\Common\Dialogs\uCategoriesDlg.pas' {qBitCatDlg},
  uqBitUtils in '..\..\Common\uqBitUtils.pas',
  uqBitSelectServerDlg in '..\..\Common\Dialogs\uqBitSelectServerDlg.pas' {qBitSelectServerDlg};

{$R *.res}


begin
  {$IFNDEF FASTMM4}{$IFDEF DEBUG} ReportMemoryLeaksOnShutdown := True; {$ENDIF}{$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmAddTorrent, FrmAddTorrent);
  Application.CreateForm(TqBitAddServerDlg, qBitAddServerDlg);
  Application.CreateForm(TqBitSelectServerDlg, qBitSelectServerDlg);
  Application.CreateForm(TqBitCatDlg, qBitCatDlg);
  Application.CreateForm(TqBitAddServerDlg, qBitAddServerDlg);
  Application.CreateForm(TqBitAddTorrentDlg, qBitAddTorrentDlg);
  Application.CreateForm(TqBitCatDlg, qBitCatDlg);
  Application.Run;
end.

  // Place Holder :

  {$IFDEF FASTMM4}
    FastMM4,  //  MPL 1.1, LGPL 2.1 (https://github.com/pleriche/FastMM4)
  {$ENDIF}

  {$IFDEF VER340}
    REST.Json.Types in '..\..\API\JSON\21\REST.Json.Types.pas',
    REST.JsonReflect in '..\..\API\JSON\21\REST.JsonReflect.pas',
    System.JSON in '..\..\API\JSON\21\System.JSON.pas',
    REST.Json in '..\..\API\JSON\21\REST.Json.pas',
  {$ENDIF }
  {$IFDEF VER350}
    REST.Json.Types in '..\..\API\JSON\22\REST.Json.Types.pas',
    REST.JsonReflect in '..\..\API\JSON\22\REST.JsonReflect.pas',
    System.JSON in '..\..\API\JSON\22\System.JSON.pas',
    REST.Json in '..\..\API\JSON\22\REST.Json.pas',
  {$ENDIF}
  uqBitAPITypes in '..\..\API\uqBitAPITypes.pas',
  uqBitAPI in '..\..\API\uqBitAPI.pas',
  uqBitObject in '..\..\API\uqBitObject.pas',

  {$IFNDEF FASTMM4} {$IFDEF DEBUG} ReportMemoryLeaksOnShutdown := True; {$ENDIF}{$ENDIF}

