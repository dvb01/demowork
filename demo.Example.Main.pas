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
  demo.Example.Types,
  demo.Example.Run;

type

  /// воспроизведение примера и имитация движения курсора
  /// 1. при открытии панели (клик на панель галереи с главного окна программы)
  /// выполняется
  /// а) скрытие пред. панели
  /// DemoMain.ExampleControl.PanelHideCheck(false);
  /// false = не регистрировать панель как просмотренную
  /// что бы в будущем при повторном заходе показать кнопку примера заново
  ///
  /// б) DemoMain.ExampleControl.PanelShowCheck(Control);
  /// проверяется та панель которую открываем. показать ли на ней кнопку примера
  ///
  /// 2. При клики на кнопку примера  TdExample.ButRunClick  ///
  /// Скрывается кнопка примера
  /// Проверка возможности запуска примера
  /// Блокируется форма от неожиданного закрытия программы  DemoMain.AppCloseLock;
  ///
  /// 3. Происходит запуск воспроизведения примера TdExample.ExampleRun
  ///
  /// 4. Создается один из наследников базового класса TdExampleRunBase с модуля demo.Example.Run
  ///
  /// их всего 2 (с анимацией, подсказками или быстрый пример)
  /// TdExampleRunBase содержит ссылку на класс который выполняеет примитивные команды,
  /// это класс находится в demo.Example.ExecuteCmd
  /// TdExampleRunSimple - быстрый пример
  /// TdExampleRunPlayer - пример с воспроизведением
  ///
  /// Если создается класс TdExampleRunPlayer то на форме появится блокирующая панель  FPanelLock
  /// почти прозрачная которая не позволит изменять настройки при запущеном примере
  /// создастся курсор который Window.SetParent(Handle,0); FCursor
  /// создастся кнопка отмены воспроизведения  FButAbort
  /// класс подпишется на события формы о изменении размера
  ///
  /// 5.  выполнение кода переходит в модуль demo.Example.Run TdExampleRunBase.Run virtual;
  /// по текущей открытой панели на форме определяется, какой имеено пример нужно запустить
  /// допустим Run_Module_PhotoCollage
  /// при запуске Run_Module_PhotoCollage
  /// а) выравнивание  FPanelLock  FButAbort FCursor
  /// б) выполнение действий
  /// 6) после выполнения класс TdExampleRunBase удаляется
  /// вместе с ним удаляется FPanelLock  FButAbort FCursor
  /// Пользователь может уже изменять настройки программы сам
  /// 7) Разблокируется форма DemoMain.AppCloseUnLock;
  /// что бы можно было закрыть программу без всплывающих окон
  /// 8) Кнопка примера появляется на экране (для повтора)
  ///
  ///
  ///
  /// При любом стороннем клике кнопка воспроизведение примера скрывается
  /// кроме: клик на саму кнопку, клик на кнопку "Назад"
  /// если кнопка скрывается по причине стороннего клика
  /// то текущая отображаемая панель регистрируется как не требующая примера
  /// procedure TdExample.AppicationHook(var Msg: TMsg; var Handled: Boolean);
  /// в демо нет сохранения на каких панелях кнопка примера не должна показываться
  /// после перезапуска программы кнопка воспроизведение примера будет видна
  /// на всех панелях
  ///
  ///
  ///

  TdExample = class(TComponent)
  private
    FButRun: TdButRunExample;
    FListRegistryNoShow: TList;
    FExampleStarted: integer;
    FLossFocusApp: boolean;

    procedure MainFormResize(S: TObject);
    procedure AppicationHook(var Msg: TMsg; var Handled: boolean);
    function AppicationHookWindow(var Msg: TMessage): boolean;
    procedure PanelHideCheckHandle(Handle: Cardinal);

    procedure ButRunHide;
    procedure ButRunShow;
    function ButRunShowingGet: boolean;
    function ButRunGet: TControl;
    procedure ButRunClick(Sender: TObject);
    function ExampleDialogCanAnimation: boolean;
    procedure ExampleStart;
    procedure ExampleRun(AClass: TdExampleRunBaseClass);
    procedure ExampleRunGetTerminated(S: TObject; var IsNeedBreak: boolean);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ButRun: TControl read ButRunGet;
    property ButRunShowing: boolean read ButRunShowingGet;
    procedure PanelShowCheck(APanelShowing: TWinControl);
    procedure PanelInRegistry(W: TWinControl);
    procedure PanelOutRegistry(W: TWinControl);
    procedure PanelHideCheck(IsRegistry: boolean);
    property ExampleStarted: integer read FExampleStarted;
  end;

implementation

uses demo.Main.Form, demo.Main.Main;

type
  TLocWinControl = class(TWinControl);

var
  FExample: TdExample = nil;

function Form: TFormMain;
begin
  if FExample <> nil then
    Result := FExample.Owner as TFormMain
  else
    Result := nil;
end;

{ TdExample }

constructor TdExample.Create(AOwner: TComponent);
begin
  if FExample <> nil then
    raise Exception.Create('Error TdExample.Create дубликат');
  inherited Create(AOwner as TFormMain);
  FExample := self;
  FExampleStarted := 0;
  FLossFocusApp := false;
  FListRegistryNoShow := TList.Create;
  FButRun := TdButRunExample.Create(self);
  FButRun.Parent := AOwner as TFormMain;
  FButRun.OnClick := ButRunClick;
  AmHookAppication.Subscribe(self, AppicationHook);
  AmHookAppication.HookWindowSubscribe(AppicationHookWindow);
  Form.OnResizeSub(MainFormResize);
end;

destructor TdExample.Destroy;
begin
  Form.OnResizeUnSub(MainFormResize);
  AmHookAppication.UnSubscribe(self, AppicationHook);
  AmHookAppication.HookWindowUnSubscribe(AppicationHookWindow);
  ButRunHide;
  FreeAndNil(FListRegistryNoShow);
  FExample := nil;
  inherited;
end;

procedure TdExample.MainFormResize(S: TObject);
begin
  if FButRun.Visible then
    FButRun.AlignBoundsCustom;
end;

function TdExample.ExampleDialogCanAnimation: boolean;
var
  P: TWinControl;
begin
  P := Form.PanelShowCurrent;
  Result := P <> Form.P_Main;
  Result := Result and amDialog.Confirm('С анимацией?');
end;

procedure TdExample.ExampleStart;
begin
  if (Form = nil) or (Form.PanelShowCurrent = nil) or
    (Form.PanelShowCurrent = Form.P_Main) or (FExampleStarted > 0) then
    exit;
  ButRunHide;
  try
    FLossFocusApp := false;
    DemoMain.AppCloseLock;
    try
      inc(FExampleStarted);
      try
        if ExampleDialogCanAnimation then
          ExampleRun(TdExampleRunPlayer)
        else
          ExampleRun(TdExampleRunSimple);
      finally
        dec(FExampleStarted);
      end;
    finally
      DemoMain.AppCloseUnLock;
    end;
  finally
    ButRunShow;
  end;
end;

procedure TdExample.ExampleRun(AClass: TdExampleRunBaseClass);
var
  R: TdExampleRunBase;
begin
  R := AClass.Create(self);
  try
    R.OnGetThreadTerminated := ExampleRunGetTerminated;
    R.Run;
  finally
    R.Free;
  end;
end;

procedure TdExample.ExampleRunGetTerminated(S: TObject;
  var IsNeedBreak: boolean);
begin
  IsNeedBreak := FLossFocusApp or DemoMain.AppCloseTerminated;
end;

procedure TdExample.AppicationHook(var Msg: TMsg; var Handled: boolean);
begin
  if ButRunShowing and AmControlSup.MessageIsCancelModeClickLB(Msg.message) then
    PanelHideCheckHandle(Msg.hwnd);
end;

function TdExample.AppicationHookWindow(var Msg: TMessage): boolean;
begin
  Result := false;
  if (FExampleStarted > 0)
  and AmControlSup.MessageIsLossFocusApplication(0, Msg) then
    FLossFocusApp := true;
end;

procedure TdExample.PanelHideCheckHandle(Handle: Cardinal);
var
  Panel, ButtonBack: TWinControl;
begin
  if (Handle = TLocWinControl(FButRun).Handle) then
    exit;
  if (Form.StackPanelCount <= 0) then
  begin
    ButRunHide;
    exit;
  end;
  Form.PanelShowCurrentPairGet(Panel, ButtonBack);
  if (ButtonBack <> nil)
  and (Handle <> TLocWinControl(ButtonBack).WindowHandle)then
    PanelInRegistry(Panel);
  ButRunHide;
end;

procedure TdExample.PanelInRegistry(W: TWinControl);
begin
  if (FListRegistryNoShow <> nil) and (W <> nil) and
    (FListRegistryNoShow.IndexOf(W) < 0) then
    FListRegistryNoShow.Add(W);
end;

procedure TdExample.PanelOutRegistry(W: TWinControl);
begin
  if (FListRegistryNoShow <> nil) and (W <> nil) then
    FListRegistryNoShow.Remove(W);
end;

procedure TdExample.PanelShowCheck(APanelShowing: TWinControl);
begin
  if (FListRegistryNoShow <> nil)
  and (APanelShowing <> nil)
  and (APanelShowing <> Form.P_Main)
  and (FListRegistryNoShow.IndexOf(APanelShowing) < 0) then
    ButRunShow;
end;

procedure TdExample.PanelHideCheck(IsRegistry: boolean);
var
  Panel: TWinControl;
begin
  if (FListRegistryNoShow <> nil) then
  begin
    if IsRegistry then
    begin
      Panel := Form.PanelShowCurrent;
      if (FListRegistryNoShow.IndexOf(Panel) < 0) then
        FListRegistryNoShow.Add(Panel);
    end;
  end;
  ButRunHide;
end;

procedure TdExample.ButRunShow;
begin
  FButRun.Visible := true;
  FButRun.BringToFront;
end;

procedure TdExample.ButRunClick(Sender: TObject);
begin
  ExampleStart;
end;

function TdExample.ButRunGet: TControl;
begin
  Result := FButRun;
end;

procedure TdExample.ButRunHide;
begin
  FButRun.Visible := false;
end;

function TdExample.ButRunShowingGet: boolean;
begin
  Result := FButRun.Visible;
end;

end.
