program NOXMon;
uses
  {$IFDEF FASTMM4}
  FastMM4,
  {$ENDIF }

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

  // use project search path : ..\..\API;..\..\Common;..\..\Common\Dialogs;..\..\Common\uCountryFlags

  Vcl.Forms,
  uNOXMon in 'uNOXMon.pas' {NOXMonDlg},

  uqBitAddServerDlg, uqBitSelectServerDlg;

{$R *.res}
begin
  {$IFNDEF FASTMM4} {$IFDEF DEBUG} ReportMemoryLeaksOnShutdown := True; {$ENDIF} {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TNOXMonDlg, NOXMonDlg);
  Application.CreateForm(TqBitSelectServerDlg, qBitSelectServerDlg);
  Application.CreateForm(TqBitAddServerDlg, qBitAddServerDlg);
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

  {$IFNDEF FASTMM4} {$IFDEF DEBUG} ReportMemoryLeaksOnShutdown := True; {$ENDIF} {$ENDIF}

