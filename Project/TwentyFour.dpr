program TwentyFour;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form_main},
  Find in 'Find.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.soPortrait, TFormOrientation.soInvertedPortrait];
  Application.CreateForm(TForm_main, Form_main);
  Application.Run;
end.
