unit demo.Example.Run;

interface
uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Types,
  Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  ES.BaseControls,
  ES.Layouts,
  AmLayBase,
  AmPanel,
  AmButton,
  AmPtPanel,
  AmPtControl,
  AmSystemBase,
  AmSystemObject,
  AmLogTo,
  AmMemo,
  AmEdit,
  AmCheckBox,
  AmFormModal,
  AmComboBox,
  AmScrollBarTypes,
  AmUserType,
  AmUserScale,
  AmControlClasses,
  AmGraphic.Help,
  AmListBox,
  AmGraphic.Controls,
  AmControls,
  AmHookApp,
  AmPtScrollBoxOptimized,
  demo.Types,
  demo.Consts,
  demo.Example.Types,
  demo.Example.ExecuteCmd;

  type
   TdExampleRunBaseClass = class of TdExampleRunBase;

   TdExampleRunBase = class abstract (TAmComponent)
     private
     protected
      Cmd:TdExampleExecuteCmd;
      procedure Run_Module_PhotoCollage;virtual;abstract;
     public
      constructor Create(AOwner:TComponent); override;
      destructor Destroy;override;
      procedure Run;virtual;
      procedure BeforeDestruction; override;
   end;
   TdExampleRunSimple = class (TdExampleRunBase)
     private
     protected
        procedure Run_Module_PhotoCollage;override;
        procedure Run_Module_PhotoCollage_LoadFile;
     public
      constructor Create(AOwner:TComponent);override;
      destructor Destroy;override;
   end;

   TdExampleRunPlayer = class (TdExampleRunSimple)
     private
       FPanelLock:TAmLayout;
       FCursor:TdPanelExampleCursor;
       procedure MainFormResize(S:TObject);
       function GetBoundsAtForm(F:TForm;C:TControl):TAmBounds;
       function CursorMoveToControl(F:TForm;C:TControl):boolean;
       function CursorEffectClick:boolean;
       function TerminatedGet: boolean;
     protected
        procedure Run_Module_PhotoCollage;override;
        property Terminated: boolean read TerminatedGet;
     public
      constructor Create(AOwner:TComponent);override;
      destructor Destroy;override;
   end;


implementation
uses
     demo.Main.Main,
     demo.Example.Main,
     demo.Main.Form,
     demo.Module.WebSocket.Form;
var  FCurrentRun:TdExampleRunBase = nil;// проигрывание анимации только по очереди
function FormMain:TFormMain;
begin
   Result:= demo.Main.Form.FormMain;
end;
function FormWs:TFormWebSocket;
begin
   Result:= FormWebSocket;
end;



{ TdExampleRunBase }



constructor TdExampleRunBase.Create(AOwner:TComponent);
begin
  if FCurrentRun <> nil then
  raise Exception.Create('Error TdExampleRunBase.Create уже была защена одна анимация');
  inherited Create(AOwner);
  FCurrentRun:=self;
  Cmd:=TdExampleExecuteCmd.Create;
  Cmd.OnGetThreadTerminated:=self.GetThreadTerminatedProc;
end;

destructor TdExampleRunBase.Destroy;
begin
  FreeAndNil(Cmd);
  inherited;
end;

procedure TdExampleRunBase.BeforeDestruction;
begin
  if FCurrentRun <> self then
   raise Exception.Create('Error TdExampleRunBase.BeforeDestruction FCurrentRun <> self');
  FCurrentRun:=nil;
  inherited;
end;

procedure TdExampleRunBase.Run;
var P:TWinControl;
begin
    P:=FormMain.PanelShowCurrent;
    if P = FormMain.P_PhotoCollage then
      Run_Module_PhotoCollage
end;

{ TdExampleRunPlayer }

constructor TdExampleRunPlayer.Create(AOwner:TComponent);
begin
  inherited;
   FPanelLock:=TAmLayout.Create(Self);
   FPanelLock.TransparentLevel:=20;
   FPanelLock.BevelOuter:=bvnone;
   FPanelLock.Parent:= FormMain;


   FCursor:= TdPanelExampleCursor.Create(self);
   FCursor.Color:=clred;
   FCursor.TransparentLevel:=220;
   FCursor.BevelOuter:=bvnone;
   FCursor.Color:=$008080FF;
   FCursor.SetBounds(FormMain.Width div 2 - 15,FormMain.Height div 2 - 15,30,30);
   FCursor.Parent:= FormMain;
   FormMain.OnResizeSub(MainFormResize);
   MainFormResize(self);
end;

destructor TdExampleRunPlayer.Destroy;
begin
   FormMain.OnResizeUnSub(MainFormResize);
   FreeAndNil(FPanelLock);
   FreeAndNil(FCursor);
  inherited;
end;

function TdExampleRunPlayer.GetBoundsAtForm(F: TForm; C: TControl): TAmBounds;
var P:TPoint;
begin
   P:=C.ClientToParent(Point(0,0),F);
   Result.BoundsControlSet(C);
   Result.Left:= P.X;
   Result.Top:=  P.Y;
end;

procedure TdExampleRunPlayer.MainFormResize(S: TObject);
begin
   FPanelLock.SetBounds(0,0,FormMain.Width,FormMain.Height);
   FPanelLock.BringToFront;
   FCursor.BringToFront;
end;

function TdExampleRunPlayer.CursorMoveToControl(F:TForm;C:TControl):boolean;
var B:TAmBounds;
begin
   B:=GetBoundsAtForm(F,C);
   Result:=Cmd.MouseMove(FCursor,B.Rect.CenterPoint,100);
   if not Result or self.Terminated then exit(false);   

   B:=GetBoundsAtForm(F,C);
   Cmd.MouseMove(FCursor,B.Rect.CenterPoint,100);
   if not Result or self.Terminated then exit(false);

   B:=GetBoundsAtForm(F,C);
   Cmd.MouseMove(FCursor,B.Rect.CenterPoint,100);
   if not Result or self.Terminated then exit(false);
   Result:=true;
end;

function TdExampleRunPlayer.CursorEffectClick:boolean;
begin
   Result:= Cmd.MouseClick(FCursor,$008080FF,$00AAF170);
end;

procedure TdExampleRunPlayer.Run_Module_PhotoCollage;
begin
   MainFormResize(self);
   Cmd.MouseToCenterParent(FCursor);

   if not CursorMoveToControl(FormMain,FormMain.P_PhotoCollage_FileListClear) then
   exit;
   if not Cmd.Delay(500) then
   exit;
   if not CursorEffectClick then
   exit;
   Cmd.ButtonClick(FormMain.P_PhotoCollage_FileListClear);
   if not Cmd.Delay(500) then
   exit;


   if not CursorMoveToControl(FormMain,FormMain.P_PhotoCollage_FileAdd) then
    exit;
   if not Cmd.Delay(500) then
    exit;
   if not CursorEffectClick then
   exit;
   Run_Module_PhotoCollage_LoadFile;
   if not Cmd.Delay(500) then
    exit;

   if not CursorMoveToControl(FormMain,FormMain.P_PhotoCollage_FileList) then
    exit;
   if not Cmd.Delay(1000) then
    exit;


   if not CursorMoveToControl(FormMain,FormMain.P_PhotoCollage_Collage) then
    exit;
   if not Cmd.Delay(1000) then
    exit;
end;

function TdExampleRunPlayer.TerminatedGet: boolean;
begin
 Result:=self.GetThreadTerminated;
end;




{ TdExampleRunSimple }

constructor TdExampleRunSimple.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TdExampleRunSimple.Destroy;
begin
  inherited;
end;

procedure TdExampleRunSimple.Run_Module_PhotoCollage;
begin
  Cmd.ButtonClick(FormMain.P_PhotoCollage_FileListClear);
  Cmd.delay(100);
  Run_Module_PhotoCollage_LoadFile;
end;

procedure TdExampleRunSimple.Run_Module_PhotoCollage_LoadFile;
var L:TStringlist;
    Path:string;
    procedure LocLoad(IndivRes,Fn:string);
    begin
      TamResource.SaveToFile(IndivRes,Fn);
      L.Add(Fn);
    end;
begin
  Path:= AmFile.LocalPath+'set\PhotoCollage\Cache\';
  AmFile.DirAddNew(Path);
  L:=TStringlist.Create;
  try
    LocLoad('Image_send1',Path+'1.png');
    LocLoad('Image_send2',Path+'2.png');
    LocLoad('Image_send3',Path+'3.png');
    LocLoad('Image_Ws_Start',Path+'4.png');
    LocLoad('Image_Ws_Stop',Path+'5.png');
    FormMain.PhotoCollage_FileAddList(L);
  finally
    L.Free;
  end;
end;

end.

