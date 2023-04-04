unit demo.Main.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  JsonDataObjects,
  math,
  DateUtils,
  AmHookProc,
  AmSystemBase,
  AmSystemObject,
  AmUserType,
  AmList,
  AmHttp,
  AmHandleObject,
  AmJsonBaza,
  AmLogTo,
  AmPaxCodeEditor,
  AmPax,

  AmVk.Api.Base,
  AmVk.Api.ObjVk,
  AmVk.Api.EnumTypes,
  AmVk.Api.ObjResponse,
  AmVk.Api.Cmd,
  uAmVkHttp,

  demo.Example.Main,
  demo.Module.ApiVk.Baza,
  demo.Module.WebSocket.Baza;

// текущий модуль подключатся только в  uses после  implementation

type

  // класс настроек модулей пользователя
  // при расширении функционала настроек
  // добавить сюда новый property
  TdBazaSetting = class(TJsonBazaObjCustom)
  private
    FModuleApiVk: TdModuleApiVkBazaSetting;
    FModuleWebSocketClient: TdModuleWebSocketClientSetting;
    FModuleWebSocketServer: TdModuleWebSocketServerSetting;
    function ModuleApiVkGet: TdModuleApiVkBazaSetting;
    function ModuleWebSocketClientGet: TdModuleWebSocketClientSetting;
    function ModuleWebSocketServerGet: TdModuleWebSocketServerSetting;
  public
    constructor Create(AObj: TJsonObject);
    destructor Destroy; Override;
    property ModuleApiVk: TdModuleApiVkBazaSetting read ModuleApiVkGet;
    property ModuleWebSocketClient: TdModuleWebSocketClientSetting read ModuleWebSocketClientGet;
    property ModuleWebSocketServer: TdModuleWebSocketServerSetting read ModuleWebSocketServerGet;
  end;

  // главный класс настроек пользователя
  TdMainBaza = class(TAmObjectCs)
  private
    FSetting: TdBazaSetting;
    function SettingGet: TdBazaSetting;
    function PathSettingGet: string;
  protected
    FObj: TJsonObject;
    procedure CreateNewPath(APath: string);
  public
    constructor Create();
    destructor Destroy; Override;
    procedure SaveToFile; overload;
    property PathSetting: string read PathSettingGet;
    procedure SaveToFile(AFileName: string); overload;
    property Setting: TdBazaSetting read SettingGet;
  end;

  // текущий модуль может отправлять следующие уведомления всей программе
  // каждую константу нужно зарегистрировать в  initialization
  demoOperation = class(AmOperation)
  const
    User = AmOperation.User + 7000;

  const
    Create = User + 1;

  const
    Destroy = User + 2;
  end;

  // главный класс программы
  // все сторонние модули-переменные, которым требуется глобальная видимость добавляются сюда
  // за исключением классов настроек
  TdMain = class(TAmObjectNotify)
  const
    MainPathLog = 'set\log\';
    ws_ssl_server_key_fn = 'set\ws\serverk.key';
    ws_ssl_server_crt_fn = 'set\ws\serverc.crt';
    ws_ssl_server_root_fn = 'set\ws\serverr.pem';
  private
    FObjBaza: TdMainBaza;
    FFormCodeEditor: TFormPaxCodeEditor;
    FVkHttp: TAmVkHttp;
    FExampleControl: TdExample;
    // demo.Example.TdExample; кнопка-пример воспроизведение анимации заполнения настроек пользователя
    FAppCloseLockCount: integer;
    function ObjBazaGet: TdMainBaza;
    function FormCodeEditorGet: TFormPaxCodeEditor;
    function VkHttpGet: TAmVkHttp;
    procedure FormCodeEditorCreateBack(P: IAmPostCustom);
    procedure FormCodeEditorCreateCall;
    function VkHttpPVarGet: Pointer;
    procedure VkHttpApiTokenChange(ApiCmdBase: TObject);
    procedure ResToFile();
    function AppCloseLockCountGet: integer;
    function AppCloseTerminatedGet: boolean;
  protected
    procedure Notification(Source: TAmObjectNotify; Msg: TAmOperation;
      W, L: Cardinal); override;
  public
    constructor Create(AFormMain: TForm);
    destructor Destroy; override;
    class function wsSllServerCheckFile: boolean;
    property ObjBaza: TdMainBaza read ObjBazaGet;
    property FormCodeEditor: TFormPaxCodeEditor read FormCodeEditorGet;
    property VkHttp: TAmVkHttp read VkHttpGet;
    property VkHttpPVar: Pointer read VkHttpPVarGet;
    property ExampleControl: TdExample read FExampleControl;
    procedure VkHttpCheckCreate;
    procedure VkHttpCreate;
    procedure VkHttpDestoy;

    // блокировка закрытия главной формы
    // блокировать при начале выполнения сложных продолжительный действий
    // при их окончании заблокировать
    procedure AppCloseLock;
    procedure AppCloseUnLock;
    property AppCloseLockCount: integer read AppCloseLockCountGet;

    // только для главного потока приложения
    // true когда пользователь хочет закрыть программу
    property AppCloseTerminated: boolean read AppCloseTerminatedGet;
  end;

procedure DemoMainCreate(AFormMain: TForm);
procedure DemoMainDestroy;
function DemoMain: TdMain;

implementation

uses demo.Main.Form;

var
  FMain: TdMain = nil;

procedure DemoMainCreate(AFormMain: TForm);
begin
  if FMain <> nil then
    raise Exception.Create('Error DemoMainCreate  FMain <> nil');
  FMain := TdMain.Create(AFormMain);
  TAmObjectNotify.Default.SendMessage(demoOperation.Create, 0, 0);
end;

procedure DemoMainDestroy;
begin
  if Assigned(FMain) then
  begin
    TAmObjectNotify.Default.SendMessage(demoOperation.Destroy, 0, 0);
    FreeAndNil(FMain);
  end;
end;

function DemoMain: TdMain;
begin
  Result := AmAtomic.Getter<TdMain>(FMain);
end;

procedure LocAppCloseBackCheck(P: IAmPostCustom);
begin
  if (DemoMain <> nil) and (FormMain <> nil) and DemoMain.AppCloseTerminated
  then
    PostMessage(FormMain.Handle, WM_CLOSE, 0, 0);
end;
{ TdMain }

constructor TdMain.Create(AFormMain: TForm);
begin
  inherited Create;
  FFormCodeEditor := nil;
  FVkHttp := nil;
  Default.Subscribe(self);
  DefaultThread.Subscribe(self);
  FAppCloseLockCount := 0;
  AmFile.DirAddNew(AmFile.LocalPath + MainPathLog);
  AmFile.DirAddNew(AmFile.LocalPath + 'set\ws\');

  LogMain := TAmLogString.CreateLogCustom(nil,
    AmFile.LocalPath + MainPathLog + 'log.log', AmFile.LocalPath + MainPathLog + '\log.log',
    AmFile.LocalPath + MainPathLog + 'logErrorApp.log',
    AmFile.LocalPath + MainPathLog + 'logErrorCollector.log', nil);
  LogMain.Log('================================================================================');
  LogMain.Log('PROG START');
  OnLog := LogMain.LogProc;
  ResToFile;
  FObjBaza := TdMainBaza.Create;
  FObjBaza.OnLog := LogProc;
  FormCodeEditorCreateCall;
  FExampleControl := TdExample.Create(AFormMain);
end;

destructor TdMain.Destroy;
begin
  LogMain.BeforeDestoyLockNewMsg;
  if FormCodeEditor <> nil then
    FormCodeEditor.Hide;
  VkHttpDestoy;
  FreeAndNil(FObjBaza);
  LogMain.Log('PROG FINISH');
  LogMain.Log('');
  LogMain.Log('');
  FreeAndNil(FExampleControl);
  FreeAndNil(LogMain);
  inherited;
end;

procedure TdMain.AppCloseLock;
begin
  AmAtomic.Inc(FAppCloseLockCount);
end;

function TdMain.AppCloseLockCountGet: integer;
begin
  Result := AmAtomic.Getter(FAppCloseLockCount);
end;

procedure TdMain.AppCloseUnLock;
var
  R: integer;
  P: IAmPostProc;
begin
  R := AmAtomic.Dec(FAppCloseLockCount);
  if R = 0 then
  begin
    if AmPotId.IsMain then
      LocAppCloseBackCheck(nil)
    else
    begin
      P := AmPostMsg.PostProc0New;
      P.ProcStd := LocAppCloseBackCheck;
      P.PostMessage;
    end;
  end;
end;

function TdMain.AppCloseTerminatedGet: boolean;
begin
  Result := FormMain.ClosingProcess;
end;

procedure TdMain.Notification(Source: TAmObjectNotify; Msg: TAmOperation;
  W, L: Cardinal);
begin
  inherited;

end;

function TdMain.ObjBazaGet: TdMainBaza;
begin
  Result := AmAtomic.Getter<TdMainBaza>(FObjBaza);
end;

class function TdMain.wsSllServerCheckFile: boolean;
begin
  Result := AmFile.IsFile(AmFile.LocalPath + ws_ssl_server_key_fn)
   and AmFile.IsFile(AmFile.LocalPath + ws_ssl_server_crt_fn)
   and AmFile.IsFile(AmFile.LocalPath + ws_ssl_server_root_fn);
end;

procedure TdMain.ResToFile;
var
  S: string;
  procedure LocLoadFile(FnSave, IndivRes: string);
  begin
    if not AmFile.IsFile(FnSave) then
      TamResource.SaveToFile(IndivRes, FnSave);
  end;

begin
  S := AmFile.LocalPath;
  LocLoadFile(S + ws_ssl_server_key_fn, 'ws_ssl_server_key');
  LocLoadFile(S + ws_ssl_server_crt_fn, 'ws_ssl_server_crt');
  LocLoadFile(S + ws_ssl_server_root_fn, 'ws_ssl_server_root');
  LocLoadFile(S + 'libeay32.dll', 'libeay32');
  LocLoadFile(S + 'ssleay32.dll', 'ssleay32');
  LocLoadFile(S + 'libwebp.dll', 'libwebp');
end;

procedure TdMain.VkHttpApiTokenChange(ApiCmdBase: TObject);
begin
  // if ApiCmdBase is TAmVkApiCmdBase then
  // self.ObjBaza.Setting.ModuleApiVk.TokenApiVk:= TAmVkApiCmdBase(ApiCmdBase).Token;
end;

procedure TdMain.VkHttpCheckCreate;
begin
  if FVkHttp = nil then
    VkHttpCreate;
end;

procedure TdMain.VkHttpCreate;
begin
  VkHttpDestoy;
  FVkHttp := TAmVkHttp.CreateForApi(AmFile.LocalPath, '');
  FVkHttp.Api.OnTokenChanged := VkHttpApiTokenChange;
end;

procedure TdMain.VkHttpDestoy;
begin
  if Assigned(FVkHttp) then
    FreeAndNil(FVkHttp);
end;

function TdMain.VkHttpGet: TAmVkHttp;
begin
  Result := AmAtomic.Getter<TAmVkHttp>(FVkHttp);
end;

function TdMain.VkHttpPVarGet: Pointer;
begin
  Result := @FVkHttp;
end;

procedure TdMain.FormCodeEditorCreateBack(P: IAmPostCustom);
begin
  if Application.MainForm = nil then
  begin
    FormCodeEditorCreateCall;
    exit;
  end;
  FFormCodeEditor := AmPaxFormCodeEditor.New;
  FFormCodeEditor.Visible := false;
end;

procedure TdMain.FormCodeEditorCreateCall;
var
  P: IAmPostProc;
begin
  P := AmPostMsg.PostProc0New;
  P.ProcObj := FormCodeEditorCreateBack;
  P.PostMessage;
end;

function TdMain.FormCodeEditorGet: TFormPaxCodeEditor;
begin
  Result := FFormCodeEditor;
end;

{ TdMainBaza }

constructor TdMainBaza.Create;
begin
  inherited Create;
  CreateNewPath('set\');
  CreateNewPath('set\setting\');
  FObj := AmJson.LoadObjectFile(PathSetting + 'set.json');
  FSetting := TdBazaSetting.Create(FObj['Setting'].ObjectValue);
end;

procedure TdMainBaza.CreateNewPath(APath: string);
begin
  AmFile.DirAddNew(AmFile.LocalPath + APath);
end;

destructor TdMainBaza.Destroy;
begin
  SaveToFile;

  FreeAndNil(FSetting);
  FreeAndNil(FObj);
  inherited;
end;

function TdMainBaza.PathSettingGet: string;
begin
  Result := AmFile.LocalPath + 'set\setting\';
end;

procedure TdMainBaza.SaveToFile;
begin
  SaveToFile(PathSetting + 'set.json');
end;

procedure TdMainBaza.SaveToFile(AFileName: string);
begin
  Lock;
  try
    FObj.SaveToFile(AmFile.GetFullPathFile(AFileName), false);
  finally
    UnLock;
  end;
end;

function TdMainBaza.SettingGet: TdBazaSetting;
begin
  Result := AmAtomic.Getter<TdBazaSetting>(FSetting);
end;

{ TdBazaSetting }

constructor TdBazaSetting.Create(AObj: TJsonObject);
begin
  inherited;

  FModuleApiVk := TdModuleApiVkBazaSetting.Create
  (AObj['ModuleApiVk'].ObjectValue);

  FModuleWebSocketClient := TdModuleWebSocketClientSetting.Create
    (AObj['ModuleWebSocketClient'].ObjectValue);

  FModuleWebSocketServer := TdModuleWebSocketServerSetting.Create
    (AObj['ModuleWebSocketServer'].ObjectValue);

end;

destructor TdBazaSetting.Destroy;
begin
  FreeAndNil(FModuleApiVk);
  FreeAndNil(FModuleWebSocketClient);
  FreeAndNil(FModuleWebSocketServer);
  inherited;
end;

function TdBazaSetting.ModuleApiVkGet: TdModuleApiVkBazaSetting;
begin
  Result := AmAtomic.Getter<TdModuleApiVkBazaSetting>(FModuleApiVk);
end;

function TdBazaSetting.ModuleWebSocketClientGet: TdModuleWebSocketClientSetting;
begin
  Result := AmAtomic.Getter<TdModuleWebSocketClientSetting>
    (FModuleWebSocketClient);
end;

function TdBazaSetting.ModuleWebSocketServerGet: TdModuleWebSocketServerSetting;
begin
  Result := AmAtomic.Getter<TdModuleWebSocketServerSetting>
    (FModuleWebSocketServer);
end;

initialization

begin
  TAmObjectNotify.RegGlobalNew(demoOperation.User, 'demoOperation.User');
  TAmObjectNotify.RegGlobalNew(demoOperation.Create, 'demoOperation.Create');
  TAmObjectNotify.RegGlobalNew(demoOperation.Destroy, 'demoOperation.Destroy');
end;

end.
