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
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  ES.BaseControls,
  ES.Layouts,
  AmLayBase,
  AmHookProc,
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
  AmLayCursor,
  AmGraphic.Canvas.Help,
  AmPtScrollBoxOptimized,
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
    public
      constructor Create(AOwner:TComponent);override;
      destructor Destroy;override;
      procedure AlignBoundsCenter;
      procedure AlignBoundsCustom;

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




  {

procedure MakeRounded(Control: TWinControl);
var
  R: TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    R := ClientRect;
    rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 20, 20);
    Perform(EM_GETRECT, 0, lParam(@r));
    InflateRect(r, - 5, - 5);
    Perform(EM_SETRECTNP, 0, lParam(@r));
    SetWindowRgn(Handle, rgn, True);
    Invalidate;
  end;
end;
  }




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
  inherited;
  TransparentLevel:=255;
end;

procedure TdPanelExample.MouseLeave;
begin
  inherited;
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

end.
