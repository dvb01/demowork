unit demo.Example.ExecuteCmd;

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
  AmControlClasses,
  AmPanel,
  AmButton,
  AmPtPanel,
  AmPtControl,
  AmSystemBase,
  AmSystemObject,
  AmLogTo,
  AmMemo,
  AmMenu,
  AmEdit,
  AmCheckBox,
  AmFormModal,
  AmComboBox,
  AmScrollBarTypes,
  AmUserType,
  AmUserScale,
  AmGraphic.Help,
  AmListBox,
  AmGraphic.Controls,
  AmControls,
  AmHookApp,
  AmPtScrollBoxOptimized,
  demo.Types,
  demo.Consts,
  demo.Example.Types;

  type
   PdExampleSCPrm =^TdExampleSCPrm;
   TdExampleSCPrm = record
     TimeOutMs:Cardinal;
     Pos:TPoint;
     ShowControl:TWinControl;
     procedure Init;
     procedure  PosToCenterControlSet(C:TControl);
   end;

   TdExampleExecuteCmd = class (TAmObject)
     private
      FSCLocal:TAmPopupControl;
      function TerminatedGet: boolean;
    protected
      property Terminated: boolean read TerminatedGet;
      function ShowControlCustom(Prm:PdExampleSCPrm):boolean;
      function ShowControlCustomExp(P:TAmPopupControl;Prm:PdExampleSCPrm):boolean;
    public
       function GetBoundsScreen(C:TControl):TAmBounds;
       function GetPoint(C:TControl):TPoint;

      function ShowControl(Prm:PdExampleSCPrm):boolean;
      function ShowMessage(AText:string;ScreenPos:TPoint;TimeOutMs:Cardinal):boolean; overload;
      function ShowMessage(AText:string;ScreenPos:TControl;TimeOutMs:Cardinal):boolean; overload;


      //SC  ShowControl с  внешним управлением
      function  SC_Create:TComponent;
      procedure SC_Show(Handle:TComponent;Prm:PdExampleSCPrm);
      procedure SC_CanCloseSet(Handle:TComponent;Value:boolean);
      procedure SC_Hide(Handle:TComponent);
      procedure SC_Free(Handle:TComponent);

      function MouseTo(C:TControl;P:TPoint):boolean;
      function MousePos(C:TControl):TPoint;
      function MouseMove(C:TControl;P:TPoint;Speed:byte):boolean;
      function MouseClick(C:TControl;col,col2:TColor):boolean;
      function DelayStd:boolean;
      function Delay(Ms:Cardinal):boolean;
      function ButtonClick(B:TAmButton):boolean;
      function ComboBoxSetIndex(C:TAmComboBox;Index:integer):boolean;
      function ComboBoxSetText(C:TAmComboBox;Text:string):boolean;
      function EditSetText(C:TAmEdit;Text:string):boolean;
      function MemoSetText(C:TAmMemo;Text:string):boolean;
      function CheckBoxSet(C:TAmCheckBox;Value:boolean):boolean;
      constructor Create();
      destructor Destroy;override;
   end;
implementation

{ dExampleExecuteCmd }
   type
    TLocControl = class (TControl);

constructor TdExampleExecuteCmd.Create;
begin
  inherited;
  FSCLocal:=nil;
end;

destructor TdExampleExecuteCmd.Destroy;
begin
   if FSCLocal<>nil then
   FreeAndNil(FSCLocal);
  inherited;
end;

function TdExampleExecuteCmd.MouseMove(C: TControl; P: TPoint;Speed:byte): boolean;
var
   PixInc:integer;
   ms:Cardinal;
   function Loc:boolean;
   var
     Start,Stop:TPoint;
     a,b,d:double;
     sideX:boolean;
   begin

        Start:=MousePos(C);
        Stop:= P;


        //a * x + b = y
        // Start.Y = a * Start.X  + b
        // Stop.Y = a * Stop.X  + b

        //Stop.Y -  Start.Y  = a * Stop.X  -  a * Start.X  + b - b;
        //Stop.Y -  Start.Y  = a( Stop.X - Start.X);
        // a =  (Stop.Y -  Start.Y) / ( Stop.X - Start.X);
        d:= Stop.X - Start.X;
        if d = 0 then
        d:=0.001;

        a :=  (Stop.Y -  Start.Y) / d;
        if a = 0  then
        a:=0.001;

        b:=  Start.Y - a * Start.X;

       //  (P.Y - b) / a = P.X  ;

        P:=Start;
        sideX:=  abs(Stop.Y - Start.Y ) < abs(Stop.X - Start.X);

        while not self.Terminated do
        begin
          if sideX then
          begin
             if Start.X < Stop.X then
             begin
               if  P.X >= Stop.X  then
                break;
               inc(P.X,PixInc);
               P.X:= min(P.X,Stop.X);
             end
             else
             begin
               if  P.X <= Stop.X  then
                break;
               dec(P.X,PixInc);
               P.X:= max(P.X,Stop.X);
             end;

             P.Y :=  Round((a * P.X)  + b);
             MouseTo(C,P);
          end
          else
          begin

             if Start.Y < Stop.Y then
             begin
               if  P.Y >= Stop.Y  then
               break;
               inc(P.Y,PixInc);
               P.Y:= min(P.Y,Stop.Y);
             end
             else
             begin
               if  P.Y <= Stop.Y  then
               break;
               dec(P.Y,PixInc);
               P.Y:= max(P.Y,Stop.Y);
             end;

             P.X:=  Round((P.Y - b) / a);
             MouseTo(C,P);
          end;
          Delay(ms);
        end;
        Result:= not self.Terminated;

   end;
begin
    if Speed<1 then
    Speed:=1;
    // max speed 800 px/sec  при маштабе 100%
    PixInc:= round((Speed * 100 / 255) * (AmScaleV(800) /100));
    ms := max(1000 div 50,5);
    PixInc:= max(PixInc div  Integer(ms),1);
    Result:= Loc;
end;

function TdExampleExecuteCmd.MouseTo(C: TControl; P: TPoint): boolean;
begin
  P.X:= P.X - C.Width div 2;
  P.Y:= P.Y - C.Height div 2;
  C.SetBounds(P.X,P.Y,C.Width,C.Height);
  Result:=true;
end;



function TdExampleExecuteCmd.SC_Create: TComponent;
begin
   Result:= TAmPopupControl.Create(nil);
   TAmPopupControl(Result).CanResize:=true;
   TAmPopupControl(Result).PopupAnimate:=  waCENTER;
   TAmPopupControl(Result).PopupAnimateTime:=70;
   TAmPopupControl(Result).PopupPaddingSize:=AmScaleV(10);
   TAmPopupControl(Result).PopupColor:=$00582E25;
   TAmPopupControl(Result).PopupTransparentLvl:=220;
   TAmPopupControl(Result).CanMove:=true;
   TAmPopupControl(Result).PopupCanClose:=false;
end;

procedure TdExampleExecuteCmd.SC_Free(Handle: TComponent);
begin
    if Handle<>nil then
    (Handle as TAmPopupControl).Free;
end;

procedure TdExampleExecuteCmd.SC_Hide(Handle: TComponent);
begin
   (Handle as TAmPopupControl).PopupClose;
end;

procedure TdExampleExecuteCmd.SC_Show(Handle: TComponent;Prm:PdExampleSCPrm);
begin
   (Handle as TAmPopupControl).PopupControl:= Prm.ShowControl;
   (Handle as TAmPopupControl).PopupOpen(Prm.Pos.X-Prm.ShowControl.Width div 2,Prm.Pos.Y-Prm.ShowControl.Height div 2);
end;

procedure TdExampleExecuteCmd.SC_CanCloseSet(Handle:TComponent;Value:boolean);
begin
  (Handle as TAmPopupControl).PopupCanClose:=Value;
end;

function TdExampleExecuteCmd.ShowControlCustom(Prm:PdExampleSCPrm):boolean;
var P: TAmPopupControl;
begin
   if FSCLocal = nil  then
   begin
    FSCLocal:=  SC_Create as TAmPopupControl;
    P:= FSCLocal;
   end
   else if FSCLocal.IsShow then
     P :=  SC_Create as TAmPopupControl
   else
    P:= FSCLocal;
   try
     Result:= ShowControlCustomExp(P,Prm);
   finally
     if P <> FSCLocal then
     P.Free;
   end;
end;


function TdExampleExecuteCmd.ShowControlCustomExp(P:TAmPopupControl;Prm:PdExampleSCPrm):boolean;
begin
   SC_CanCloseSet(P,false);
   SC_Show(P,Prm);
   try
      Result:= Delay(Prm.TimeOutMs);
   finally
     SC_CanCloseSet(P,true);
     SC_Hide(P);
   end;
end;

function TdExampleExecuteCmd.ShowControl(Prm:PdExampleSCPrm): boolean;
begin
   Result:= ShowControlCustom(Prm);
end;

function TdExampleExecuteCmd.ShowMessage(AText:string;ScreenPos:TControl;TimeOutMs:Cardinal):boolean;
var Prm:TdExampleSCPrm;
begin
     Prm.Init;
     Prm.PosToCenterControlSet(ScreenPos);
     Result:= ShowMessage(AText,Prm.Pos,TimeOutMs);
end;

function TdExampleExecuteCmd.ShowMessage(AText:string;ScreenPos:TPoint; TimeOutMs: Cardinal): boolean;
var C:TAmLayOut;
R:TRect;
Prm:TdExampleSCPrm;
Canvas:TBitMap;
begin
   C:=TAmLayOut.Create(nil);
   try
      C.BevelOuter:=bvnone;
      C.Caption:=  AText;
      C.Font.Size:=10;
      C.Font.Color:=clwhite;
      C.Color:=  $00582E25;
      C.Caption:= AText;
      C.CaptionOpt.WordBreak:=true;
      C.CaptionOpt.PosH:= tvphLeft;
      C.CaptionOpt.PosV:= tvpvTop;
      C.CaptionOpt.Offset.Left:=AmScaleV(5);
      C.CaptionOpt.Offset.Top:=AmScaleV(5);
      C.CaptionOpt.SingeLine:=false;


       R:=Rect(0,0,AmScaleV(500),AmScaleV(100));
       Canvas:=  TBitMap.Create;
       Canvas.Canvas.Font:=  C.Font;
       try
         R.Height:= Winapi.Windows.DrawTextW(
                              Canvas.Canvas.Handle,
                              AText,
                              Length(AText), R,
                              DT_LEFT  or DT_WORDBREAK or DT_CALCRECT);
       finally
         Canvas.Free;
       end;

      C.SetBounds(0,0,
         min (AmScaleV(500),R.Width + AmScaleV(5)*2),
         min( Screen.Height-AmScaleV(50)  , AmScaleV(R.Height)+AmScaleV(5)*2)
      );

      Prm.Init;
      Prm.TimeOutMs:= TimeOutMs;
      Prm.Pos:= ScreenPos;
      Prm.ShowControl:=C;
      Result:=ShowControl(@Prm);
   finally
     C.Free;
   end;
end;


function TdExampleExecuteCmd.MousePos(C:TControl):TPoint;
begin
  Result :=Point(C.Left + C.Width div 2,C.Top + C.Height div 2);
end;

function TdExampleExecuteCmd.MouseClick(C:TControl;col,col2:TColor):boolean;
begin
    TLocControl(C).Color:= col;
    Delay(100);
    TLocControl(C).Color:= col2;
    Delay(100);
    TLocControl(C).Color:= col;
    Delay(100);
    TLocControl(C).Color:= col2;
    Delay(100);
    TLocControl(C).Color:= col;
    Delay(100);
    TLocControl(C).Color:= col2;
    Delay(100);
    TLocControl(C).Color:= col;
    Delay(100);
    TLocControl(C).Color:= col2;
    Delay(100);
    TLocControl(C).Color:= col;
    Delaystd;
    Result:= not self.Terminated;
end;

function TdExampleExecuteCmd.TerminatedGet: boolean;
begin
 Result:=self.GetThreadTerminated;
end;

function TdExampleExecuteCmd.ButtonClick(B: TAmButton):boolean;
begin
   Result:=true;
   if Assigned(B.OnClick) then
   B.OnClick(B)
   else Result:=false;
end;

function TdExampleExecuteCmd.ComboBoxSetIndex(C:TAmComboBox;Index:integer):boolean;
begin
  Result:=false;
  C.DropDown(true);
  if not DelayStd then exit;
  C.ItemIndex:=Index;
  if not DelayStd then exit;
  C.DropClose;
  Result:=true;
end;

function TdExampleExecuteCmd.ComboBoxSetText(C:TAmComboBox;Text:string):boolean;
begin
  Result:=false;
  C.DropDown(true);
  if not DelayStd then exit;
  C.DropListBox.ItemNewIndexCaption:=Text;
  C.ItemIndex:= C.DropListBox.ItemIndex;
  if not DelayStd then exit;
  C.DropClose;
  Result:=true;
end;

function TdExampleExecuteCmd.EditSetText(C:TAmEdit;Text:string):boolean;
var S:string;
i:integer;
begin
   Result:=false;
   C.EditText:='';
   S:='';
   for I := 1 to length(Text) do
   begin
     S:= S + Text[i];
     C.EditText:= S;
     if not delay(50) then exit;
   end;
   Result:= not self.Terminated;
end;

function TdExampleExecuteCmd.GetBoundsScreen(C: TControl): TAmBounds;
var P:TPoint;
begin
   P:=C.ClientToScreen(Point(0,0));
   Result.BoundsControlSet(C);
   Result.Left:= P.X;
   Result.Top:=  P.Y;
end;

function TdExampleExecuteCmd.GetPoint(C: TControl): TPoint;
begin
     Result:= GetBoundsScreen(C).Rect.CenterPoint;
end;

function TdExampleExecuteCmd.MemoSetText(C:TAmMemo;Text:string):boolean;
var S:string;
i:integer;
begin
   Result:=false;
   C.Text:='';
   S:='';
   for I := 1 to length(Text) do
   begin
     S:= S + Text[i];
     C.Text:= S;
     if not delay(10) then exit;
   end;
   Result:= not self.Terminated;
end;

function TdExampleExecuteCmd.CheckBoxSet(C:TAmCheckBox;Value:boolean):boolean;
begin
   C.Checked:= Value;
   Result:= not self.Terminated;
end;



function TdExampleExecuteCmd.DelayStd:boolean;
begin
   Result:= delay(math.RandomRange(500,1200));
end;

function TdExampleExecuteCmd.Delay(Ms: Cardinal): boolean;
var
  TheTime: Cardinal;
begin
  Result:=false;
  TheTime := GetTickCount + ms;
  while GetTickCount < TheTime do
  begin
     Application.ProcessMessages;
    if self.Terminated then
    exit;
    sleep(1);
     //ShowMessage(inttostr(GetTickCount));
  end;
  Result:=true;
end;



{ TdExampleSCPrm }

procedure TdExampleSCPrm.Init;
begin
 AmRecordHlp.RecFinal(self);
end;

procedure TdExampleSCPrm.PosToCenterControlSet(C: TControl);
begin
    Pos:= C.ClientToScreen(Point(C.Width div 2, C.Height div 2));
end;

end.
