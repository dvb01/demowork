unit demo.Example.Types;

interface
uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  AmPanel,
  AmSystemBase,
  AmSystemObject,
  AmUserType,
  AmUserScale,
  AmControlClasses,
  AmGraphic.Help,
  AmGraphic.Canvas.Help,
  AmHookApp,
  AmLayCursor,
  demo.Types,
  demo.Consts;

  type
  TdPanelExample = class (TAmPanel)
    private
      FWasFocus:boolean;
      procedure SetPosFerst;
    protected
      procedure SetParent(W:TWinControl);override;
      procedure VisibleChanging;override;
      procedure MouseLeave;override;
      procedure MouseEnter;override;
      procedure MouseEnterTransparentLevel;virtual;
      procedure MouseLeaveTransparentLevel;virtual;
      procedure AlignBoundsCenter;
      procedure AlignBoundsBottom;
    public
      constructor Create(AOwner:TComponent);override;
      destructor Destroy;override;

      procedure AlignBoundsCustom;virtual;
  end;
  TdButRunExample = class (TdPanelExample)
   public
     constructor Create(AOwner:TComponent);override;
  end;
  TdButAbortExample = class (TdPanelExample)
   private
   protected
      procedure MouseEnterTransparentLevel;override;
      procedure MouseLeaveTransparentLevel;override;
   public
     constructor Create(AOwner:TComponent);override;
     procedure AlignBoundsCustom;override;
  end;

  TdPanelExampleCursor = class (TAmCursorImit)
    private
    FCursorColor: TColor;
    procedure CursorColorSet(const Value: TColor);
    protected
      procedure Paint(Sender:TObject;Canvas:TCanvas;Rect:TRect;Var CanContinue:boolean);override;
    public
      constructor Create(AOwner:TComponent);override;
    published
  end;

  TdTimerExampleRun = class(TTimer)
   private
     FProc:TNotifyEvent;
     FPrm:TObject;
    procedure TimerEvent(S:TObject);
   public
     procedure Start(Proc:TNotifyEvent;Prm:TObject);
     constructor Create(AOwner:TComponent);override;
  end;









implementation



{ TdPanelExample }



constructor TdPanelExample.Create(AOwner: TComponent);
begin
  inherited;
  FWasFocus:=false;
  Width := 330;
  Height := 127;
  Font.Charset := DEFAULT_CHARSET;
  Font.Color := clWhite;
  Font.Height := -16;
  Font.Name := 'Tahoma';
  Font.Style := [];
  ParentFont := False;
  BevelWidth := 3;
  GrandientOpt.Active := True;
  GrandientOpt.Kind := amgrRadial;
  GrandientOpt.Color1 := $00408000;
  GrandientOpt.Color2 := $00AEBF17;
  GrandientOpt.Radius := 440;
  ColorBolder := $0080FF00;
  ColorBolder2 := $0080FF00;
  TransparentLevel := 220;
  VisibleTyp := waBLEND;
  VisibleDelay := 70;
  VisibleCountFrame := 10;
  Caption:='Пример';
  self.Visible:=false;
  self.Align:=alCustom;

end;

destructor TdPanelExample.Destroy;
begin

  inherited;
end;

procedure TdPanelExample.MouseEnter;
begin
  MouseEnterTransparentLevel;
  inherited MouseEnter;
end;

procedure TdPanelExample.MouseEnterTransparentLevel;
begin
   TransparentLevel:=255;
end;

procedure TdPanelExample.MouseLeave;
begin
  MouseLeaveTransparentLevel;
  inherited MouseLeave;
end;

procedure TdPanelExample.MouseLeaveTransparentLevel;
begin
   TransparentLevel:=220;
end;

procedure TdPanelExample.SetParent(W: TWinControl);
begin
  inherited;
  if (W<>nil) and not  FWasFocus then
  begin
    FWasFocus:=true;
    SetPosFerst;
    AlignBoundsCustom;
  end;
end;

procedure TdPanelExample.SetPosFerst;
begin

end;

procedure TdPanelExample.AlignBoundsBottom;
begin
   if (Parent = nil) then exit;
   self.SetBounds(
         Parent.Width div 2 - self.Width div 2,
         (Parent.Height - Parent.Height div 10) - self.Height ,
         Width,
         Height);
end;

procedure TdPanelExample.AlignBoundsCenter;
begin
   if (Parent = nil) then exit;
   self.SetBounds(
         Parent.Width div 2 - self.Width div 2,
         Parent.Height div 2 - self.Height div 2,
         Width,
         Height);
end;

procedure TdPanelExample.AlignBoundsCustom;
begin
    AlignBoundsCenter;
end;

procedure TdPanelExample.VisibleChanging;
begin
  inherited;
  if not Visible then
  AlignBoundsCustom;
end;


{ TdButRunExample }

constructor TdButRunExample.Create(AOwner: TComponent);
begin
  inherited;
  Width:= 108;
  Height:= 41;
end;

{ TdButAbortExample }



constructor TdButAbortExample.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  GrandientOpt.Active := True;
  GrandientOpt.Color1 := $002E2E81;
  GrandientOpt.Color2 := $005360FD;
  GrandientOpt.Radius := 440;
  ColorBolder := $008080FF;
  ColorBolder2 := $008080FF;
  TransparentLevel := 120;
  self.Caption:='Отмена';
  Width:= 108;
  Height:= 41;
end;

procedure TdButAbortExample.AlignBoundsCustom;
begin
  AlignBoundsBottom;
end;

procedure TdButAbortExample.MouseEnterTransparentLevel;
begin
  TransparentLevel:=255;
end;

procedure TdButAbortExample.MouseLeaveTransparentLevel;
begin
  TransparentLevel:=120;
end;

{ TdPanelExampleCursor }




constructor TdPanelExampleCursor.Create(AOwner: TComponent);
begin
  inherited;
  //Color:=$008080FF;;
  //Color:=clgray;
  //self.TransparentColor:=clgray;
  //self.TransparentLevel:=120;
  //self.BevelOuter:=bvNone;
  //self.IsDrawHelper:=false;
end;


procedure TdPanelExampleCursor.CursorColorSet(const Value: TColor);
begin
  FCursorColor := Value;
end;

procedure TdPanelExampleCursor.Paint(Sender:TObject;Canvas:TCanvas;Rect:TRect;Var CanContinue:boolean);
begin
 //Canvas.Brush.Color:= clred;
 //Canvas.Brush.Style:=bsSolid;
 //Canvas.FillRect(self.ClientRect);
 //AmGraphicCanvasHelp.CanvasPaintCircleMark(Canvas,self.ClientRect,clgreen,5,5);
end;



{ TdTimerExampleRun }

constructor TdTimerExampleRun.Create(AOwner: TComponent);
begin
  inherited;
  self.Interval:=50;
  self.OnTimer:= TimerEvent;
  self.Enabled:=false;
end;

procedure TdTimerExampleRun.Start(Proc: TNotifyEvent;Prm:TObject);
begin
   FProc:=Proc;
   FPrm:=Prm;
   self.Enabled:=true;
end;

procedure TdTimerExampleRun.TimerEvent(S: TObject);
begin
   self.Enabled:=false;
   if Assigned(FProc) then
   FProc(FPrm);
end;

end.
