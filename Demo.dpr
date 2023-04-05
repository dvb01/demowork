program Demo;

{$R *.dres}

uses
 // AMMMSTART,
  Vcl.Forms,
  AmUsertype,
  demo.Main.Form in 'demo.Main.Form.pas' {FormMain},
  demo.Main.Main in 'demo.Main.Main.pas',
  demo.Types in 'demo.Types.pas',
  demo.FormHideControls in 'demo.FormHideControls.pas' {FormHideControls},
  demo.Consts in 'demo.Consts.pas',
  demo.Module.ApiVk.Baza in 'demo.Module.ApiVk.Baza.pas',
  demo.Module.WebSocket.Form in 'demo.Module.WebSocket.Form.pas' {FormWebSocket},
  demo.Module.WebSocket.Baza in 'demo.Module.WebSocket.Baza.pas',
  demo.Module.WebSocket.Types in 'demo.Module.WebSocket.Types.pas',
  demo.Example.Main in 'demo.Example.Main.pas',
  demo.Example.Types in 'demo.Example.Types.pas',
  demo.Example.ExecuteCmd in 'demo.Example.ExecuteCmd.pas',
  demo.Example.Run in 'demo.Example.Run.pas';

{$R *.res}

begin
  AmUserType.AmSystemInfo.IsInitProgramSet;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormHideControls, FormHideControls);
  Application.CreateForm(TFormWebSocket, FormWebSocket);
  Application.Run;
end.
