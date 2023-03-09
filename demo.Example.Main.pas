unit demo.Example.Main;

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
 // AmHookApp,
  AmPtScrollBoxOptimized,
  demo.Types,
  demo.Consts,
  demo.Example.Types,
  demo.Example.Run;

 type


  TdExample = class (TComponent)
    private
      FPanelExample:TdPanelExample;
      FListRegistryNoShow:TList;
      procedure MainFormResize(S:TObject);
      procedure AppicationHook(var Msg: TMsg; var Handled: Boolean);
      procedure PanelHideCheckHandle(Handle:Cardinal);

      procedure PanelHide;
      procedure PanelShow;
      function PanelShowingGet: boolean;
      function PanelGet: TControl;
      procedure PanelClick(Sender:TObject);
      function  ExampleDialogCanAnimation:boolean;
      procedure ExampleStart;
      procedure ExampleRun(AClass:TdExampleRunBaseClass);
      procedure ExampleRunGetTerminated(S:Tobject;var IsNeedBreak:boolean);
    protected

    public
      property PanelShowing: boolean read PanelShowingGet;
      procedure PanelShowCheck(APanelShowing:TWinControl);
      procedure PanelInRegistry(W:TWinControl);
      procedure PanelOutRegistry(W:TWinControl);
      procedure PanelHideCheck(IsRegistry:boolean);
      procedure PanelAlignCustomize(var NewLeft, NewTop, NewWidth, NewHeight: Integer; var AlignRect: TRect; AlignInfo: TAlignInfo);
      property Panel: TControl read PanelGet;
      constructor Create(AOwner:TComponent);override;
      destructor Destroy;override;
  end;

implementation
uses demo.Main.Form,demo.Main.Main;
type
 TLocWinControl = class (TWinControl);


var FExample:TdExample=nil;
function Form:TFormMain;
begin
   if FExample <> nil then
   Result:=FExample.Owner as TFormMain
   else Result:=nil;
end;

{ TdExample }



constructor TdExample.Create(AOwner: TComponent);
begin
  if FExample <> nil then
  raise Exception.Create('Error TdExample.Create дубликат');
  inherited Create(AOwner as TFormMain);
  FExample:=self;
  FListRegistryNoShow:=TList.Create;
  FPanelExample:=TdPanelExample.Create(self);
  FPanelExample.Width:= 108;
  FPanelExample.Height:= 41;
  FPanelExample.SetSubComponent(true);
  FPanelExample.Parent:= AOwner as TFormMain;
  FPanelExample.OnClick:= PanelClick;
  AmHookAppication.Subscribe(self,AppicationHook);
  Form.OnResizeSub(MainFormResize);
end;

destructor TdExample.Destroy;
begin
  Form.OnResizeUnSub(MainFormResize);
  AmHookAppication.UnSubscribe(self,AppicationHook);
  PanelHide;
  FreeAndNil(FListRegistryNoShow);
  FExample:=nil;
  inherited;
end;

procedure TdExample.MainFormResize(S:TObject);
begin
    if FPanelExample.Visible then
    FPanelExample.AlignBoundsCenter;
end;


function  TdExample.ExampleDialogCanAnimation:boolean;
var P:TWinControl;
begin
    P:=Form.PanelShowCurrent;
    Result:= P <> Form.P_Main;
    Result:= Result and amDialog.Confirm('С анимацией?');
   // Result := Result and amDialog.Confirm('Программу нельзя будет закрыть 30 сек. пока проигрывается анимация.  Вы согласны?');
end;

procedure TdExample.ExampleStart;
begin
  if ( Form = nil )
  or (Form.PanelShowCurrent = nil)
  or (Form.PanelShowCurrent = Form.P_Main) then
   exit;

  DemoMain.AppCloseLock;
  try
   if ExampleDialogCanAnimation then
      ExampleRun(TdExampleRunPlayer)
   else ExampleRun(TdExampleRunSimple);
  finally
   DemoMain.AppCloseUnLock;
  end;
end;

procedure TdExample.ExampleRun(AClass:TdExampleRunBaseClass);
var R:TdExampleRunBase;
begin
   R:=AClass.Create(self);
   try
      R.OnGetThreadTerminated:= ExampleRunGetTerminated;
      R.Run;
   finally
     R.Free;
   end;
end;

procedure TdExample.ExampleRunGetTerminated(S:Tobject;var IsNeedBreak:boolean);
begin
  IsNeedBreak:=DemoMain.AppCloseTerminated;
end;

procedure TdExample.AppicationHook(var Msg: TMsg; var Handled: Boolean);
begin
  if AmControlSup.MessageIsCancelModeClickLB(Msg.message) then
  PanelHideCheckHandle(Msg.hwnd);
end;


procedure TdExample.PanelHideCheckHandle(Handle:Cardinal);
var Panel,ButtonBack:TWinControl;
begin
  if (Handle = TLocWinControl(FPanelExample).Handle) then
   exit;
  if (Form.StackPanelCount <= 0) then
  begin
     PanelHide;
     exit;
  end;
  Form.PanelShowCurrentPairGet(Panel,ButtonBack);
  if (ButtonBack<>nil)
  and (Handle <> TLocWinControl(ButtonBack).WindowHandle) then
  PanelInRegistry(Panel);
  PanelHide;
end;

procedure TdExample.PanelInRegistry(W:TWinControl);
begin
   if (FListRegistryNoShow <> nil)
   and (W <> nil)
   and (FListRegistryNoShow.IndexOf(W) < 0) then
   FListRegistryNoShow.Add(W);
end;

procedure TdExample.PanelOutRegistry(W:TWinControl);
begin
   if (FListRegistryNoShow <> nil)
   and (W <> nil)then
   FListRegistryNoShow.Remove(W);
end;

procedure TdExample.PanelShowCheck(APanelShowing:TWinControl);
begin
   if (FListRegistryNoShow <> nil)
   and (APanelShowing <> nil)
   and (APanelShowing <> Form.P_Main)
   and (FListRegistryNoShow.IndexOf(APanelShowing) < 0) then
    PanelShow;
end;

procedure  TdExample.PanelHideCheck(IsRegistry:boolean);
 var Panel:TWinControl;
begin
   if (FListRegistryNoShow <> nil) then
   begin
         if IsRegistry then
         begin
            Panel:=Form.PanelShowCurrent;
            if  (FListRegistryNoShow.IndexOf(Panel) < 0) then
            FListRegistryNoShow.Add(Panel);
         end;
   end;
  PanelHide;
end;

procedure TdExample.PanelShow;
begin
   FPanelExample.Visible:=true;
   FPanelExample.BringToFront;
end;

procedure TdExample.PanelAlignCustomize(var NewLeft, NewTop, NewWidth,
  NewHeight: Integer; var AlignRect: TRect; AlignInfo: TAlignInfo);
begin
   FPanelExample.AlignCustomize(NewLeft,NewTop,NewWidth,NewHeight,AlignRect,AlignInfo);
end;

procedure TdExample.PanelClick(Sender:TObject);
begin
   ExampleStart;
end;

function TdExample.PanelGet: TControl;
begin
   Result:= FPanelExample;
end;

procedure TdExample.PanelHide;
begin
  FPanelExample.Visible:=false;
end;


function TdExample.PanelShowingGet: boolean;
begin
 Result:= FPanelExample.Visible;
end;








end.
