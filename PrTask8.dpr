program PrTask8;

uses
  Forms,
  UnitT8 in 'UnitT8.pas' {MainForm},
  UnitOut in 'UnitOut.pas' {FOut};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
