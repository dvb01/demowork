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
  demo.Example.Types;

  type
   TdExampleExecuteCmd = class (TAmObject)
  private
    function TerminatedGet: boolean;
    protected
      property Terminated: boolean read TerminatedGet;
    public
      function MouseTo(C:TControl;P:TPoint):boolean;
      function MouseToCenterParent(C:TControl):boolean;
      function MousePos(C:TControl):TPoint;
      function MouseMove(C:TControl;P:TPoint;Speed:byte):boolean;
      function MouseClick(C:TControl;col,col2:TColor):boolean;
      function DelayStd:boolean;
      function Delay(Ms:Cardinal):boolean;
      function ButtonClick(B:TAmButton):boolean;
      function ComboBoxSetIndex(C:TAmComboBox;Index:integer):boolean;
      function ComboBoxSetText(C:TAmComboBox;Text:string):boolean;
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
end;

destructor TdExampleExecuteCmd.Destroy;
begin

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
    PixInc:= max(PixInc div  ms,1);
    Result:= Loc;
end;

function TdExampleExecuteCmd.MouseTo(C: TControl; P: TPoint): boolean;
begin
  P.X:= P.X - C.Width div 2;
  P.Y:= P.Y - C.Height div 2;
  C.SetBounds(P.X,P.Y,C.Width,C.Height);
  Result:=true;
end;

function TdExampleExecuteCmd.MouseToCenterParent(C:TControl):boolean;
begin
   Result:= MouseTo(C,C.Parent.ClientRect.CenterPoint);
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
     //ShowMessage(inttostr(GetTickCount));
  end;
  Result:=true;
end;



end.
