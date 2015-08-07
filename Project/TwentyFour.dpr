program TwentyFour;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Find in 'Find.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.soPortrait, TFormOrientation.soInvertedPortrait];
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
