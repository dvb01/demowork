unit demo.Example.Run;

interface
uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Types,
  System.Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  AmSystemBase,
  AmSystemObject,
  AmPanel,
  AmFormModal,
  AmUserType,
  AmUserScale,
  AmControls,
  demo.Types,
  demo.Consts,
  demo.Example.Types,
  demo.Example.ExecuteCmd;

  type
   TdExampleRunBaseClass = class of TdExampleRunBase;

   TdExampleRunBase = class abstract (TAmComponent)
     private
      function TerminatedGet: boolean;
     protected
      Cmd:TdExampleExecuteCmd;
      property Terminated: boolean read TerminatedGet;
      function TimerStart(Proc:TNotifyEvent;Prm:TObject):TObject;

      procedure Run_Module_PhotoCollage;virtual;abstract;
      procedure Run_Module_ScrollBoxPto;virtual;abstract;
      procedure Run_Module_WebSocket;virtual;
      procedure Run_Module_WebSocket_Local;virtual;abstract;
      procedure Run_Module_WebSocket_Remote;virtual;abstract;
      procedure Run_Module_ApiVk;virtual;abstract;
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
        procedure Run_Module_ScrollBoxPto;override;
        procedure Run_Module_WebSocket_Local;override;
        procedure Run_Module_WebSocket_Remote;override;
        procedure Run_Module_WebSocket_Client(Url:string);

        procedure Run_Module_ApiVk;override;
     public
      constructor Create(AOwner:TComponent);override;
      destructor Destroy;override;
   end;

   TdExampleRunPlayer = class (TdExampleRunSimple)
     private
       FPanelLock:TAmLayout;
       FCursor:TdPanelExampleCursor;
       FButAbort:TdButAbortExample;
       FButAbortClicked:boolean;
       procedure ButAbortClick(S:TObject);
       procedure MainFormResize(S:TObject);
       function GetPoint(C:TControl):TPoint;
     protected
       function GetThreadTerminated():boolean; override;
       function CallMove(C:TControl;EffectClick:boolean;Caption:string):boolean;
       procedure Run_Module_PhotoCollage;override;
       procedure Run_Module_ScrollBoxPto;override;
       procedure Run_Module_WebSocket_Local;override;
       procedure Run_Module_WebSocket_Remote;override;
       procedure Run_Module_WebSocket_Client(Url:string);
       procedure Run_Module_WebSocket_MessageServerToClient(Text:string);
       procedure Run_Module_WebSocket_MessageServerToClient_FormModal(Prm:TObject);
       procedure Run_Module_ApiVk;override;
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
  raise Exception.Create('Error TdExampleRunBase.Create уже была запущена одна анимация');
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

function TdExampleRunBase.TerminatedGet: boolean;
begin
 Result:=self.GetThreadTerminated;
end;


function TdExampleRunBase.TimerStart(Proc: TNotifyEvent; Prm: TObject): TObject;
begin
  Result:= TdTimerExampleRun.Create(self);
  TdTimerExampleRun(Result).Start(Proc,Prm);
end;

procedure TdExampleRunBase.Run;
var P:TWinControl;
begin
    // определение какой имеено пример запустить
    P:=FormMain.PanelShowCurrent;
    if P = FormMain.P_PhotoCollage then
      Run_Module_PhotoCollage
    else if P = FormMain.P_ScrollBoxPto then
      Run_Module_ScrollBoxPto
    else if P = FormMain.P_WebSocket then
      Run_Module_WebSocket
    else if P = FormMain.P_ApiVk then
      Run_Module_ApiVk
    else
    AmDialog.ShowTimeOut('','Для этого модуля еще не написан код примера',5000);
end;

procedure TdExampleRunBase.Run_Module_WebSocket;
begin
    case FormWs.ExampleCasePanelShow of
        1:Run_Module_WebSocket_Local;
        2:Run_Module_WebSocket_Remote;
    end;
end;

{ TdExampleRunPlayer }

constructor TdExampleRunPlayer.Create(AOwner:TComponent);
begin
  inherited;
   FButAbortClicked:=false;
   FButAbort:=TdButAbortExample.Create(self);
   FButAbort.OnClick:= ButAbortClick;
   FButAbort.Parent:=  FormMain;
   FButAbort.Visible:=true;

   FPanelLock:=TAmLayout.Create(Self);
   FPanelLock.TransparentLevel:=10;
   FPanelLock.BevelOuter:=bvnone;
   FPanelLock.Parent:= FormMain;


   FCursor:= TdPanelExampleCursor.Create(self);
   FCursor.Color:= $008080FF;
   FCursor.TransparentLvl:=220;
   FCursor.PenSize:=5;
   FCursor.CursorShow;
   FormMain.OnResizeSub(MainFormResize);
   MainFormResize(self);
end;

destructor TdExampleRunPlayer.Destroy;
begin
   FormMain.OnResizeUnSub(MainFormResize);
   FreeAndNil(FPanelLock);
   FreeAndNil(FCursor);
   FreeAndNil(FButAbort);
  inherited;
end;

function  TdExampleRunPlayer.GetThreadTerminated():boolean;
begin
    Result:= FButAbortClicked or inherited  GetThreadTerminated;
end;

procedure TdExampleRunPlayer.ButAbortClick(S:TObject);
begin
   FButAbortClicked:=true;
end;

procedure TdExampleRunPlayer.MainFormResize(S: TObject);
begin
   FPanelLock.SetBounds(0,0,FormMain.Width,FormMain.Height);
   FPanelLock.BringToFront;

   FButAbort.AlignBoundsCustom;
   FButAbort.BringToFront;
end;

function TdExampleRunPlayer.GetPoint(C:TControl):TPoint;
begin
   Result:= Cmd.GetPoint(C);
end;



function TdExampleRunPlayer.CallMove(C:TControl;EffectClick:boolean;Caption:string):boolean;
var
  I: Integer;
begin
   for I := 0 to 2 do
   begin
     Result:=Cmd.MouseMove(FCursor.CursorLayer,GetPoint(C),120);
     if not Result or self.Terminated then exit;
   end;

   Result:=Cmd.Delay(500);
   if not Result then
   exit;

   if EffectClick and not Cmd.MouseClick(FCursor.CursorLayer,$008080FF,$00AAF170) then
   exit(false);

   if (Caption<>'') and not Cmd.ShowMessage(Caption,C,2000) then
    exit(false);
   Result:=true;
end;

procedure TdExampleRunPlayer.Run_Module_ApiVk;
var R:boolean;
S:string;
begin
   MainFormResize(self);
   Cmd.MouseTo(FCursor.CursorLayer,GetPoint(FormMain));
   if DemoMain.FormCodeEditor.Parent <> FormMain.P_ApiVk_EditorClient then
   exit;
   S:='Мини IDE c компилятором и редактором кода, позволяет встраивать новый opcode в текущее приложение.';
   R:= CallMove(DemoMain.FormCodeEditor,true,'');
   if not R then exit;
   R:= Cmd.ShowMessage(S,DemoMain.FormCodeEditor,8000);
   if not R then exit;
   S:='Компилятор не является родным и до BDS ему далеко.'+
   #13#10+'В редактор уже вставлен код примера. Он получает данных о пользователе Vk. Вам нужно в настройках указать токен аккаунта вк и запустить скрипт. ';
   R:= Cmd.ShowMessage(S,DemoMain.FormCodeEditor,15000);
   if not R then exit;
   S:='Далее указаный код скомпилируется и запустится к контекте потока который вызвал компиляцию. В этой демке это главный поток приложения. ';
   R:= Cmd.ShowMessage(S,DemoMain.FormCodeEditor,12000);
   if not R then exit;
   S:='Также вы можете написать свой код или погулять по объектам вызывая подсказку кода через точку. ';
   R:= Cmd.ShowMessage(S,DemoMain.FormCodeEditor,8000);
   if not R then exit;

   R:= CallMove(DemoMain.FormCodeEditor.ButLoadDefault,true,'');
   if not R then exit;
   S:='Нажав сюда вы загрузите другой пример, который считает суммы и создает модальные формы. ';
   R:= Cmd.ShowMessage(S,DemoMain.FormCodeEditor.ButLoadDefault,9000);
   if not R then exit;

   R:= CallMove(FormMain.P_ApiVk_SettingOpen,true,'');
   if not R then exit;
   S:='Нажмите сюда если хотите указать токен вк. ';
   R:= Cmd.ShowMessage(S,FormMain.P_ApiVk_SettingOpen,7000);
   if not R then exit;

   R:= CallMove(FormMain.P_ApiVk_LoadDefaultCode,true,'');
   if not R then exit;
   S:='Загрузить в редактор пример по умолчанию (Получение информации о пользователе вк). ';
   R:= Cmd.ShowMessage(S,FormMain.P_ApiVk_LoadDefaultCode,7000);
   if not R then exit;

   R:= CallMove(FormMain.P_ApiVk_TextCodeSave,true,'');
   if not R then exit;
   S:='Сохраните свой код локально. При повторных запусках загрузится именно ваш код. ';
   R:= Cmd.ShowMessage(S,FormMain.P_ApiVk_TextCodeSave,7000);
   if not R then exit;
end;

procedure TdExampleRunPlayer.Run_Module_PhotoCollage;
var R:boolean;
begin
   MainFormResize(self);
   Cmd.MouseTo(FCursor.CursorLayer,GetPoint(FormMain));



   R:= CallMove(FormMain.P_PhotoCollage_FileListClear,true,'Очистить список файлов');
   if not R then exit;
   R:= Cmd.ButtonClick(FormMain.P_PhotoCollage_FileListClear) and  Cmd.Delay(500);
   if not  R then
   exit;



   R:= CallMove(FormMain.P_PhotoCollage_FileAdd,true,'Добавить новые файлы');
   if not R then exit;
   Run_Module_PhotoCollage_LoadFile;
   R:= Cmd.Delay(500);
   if not R then
   exit;

   R:= CallMove(FormMain.P_PhotoCollage_FileList,false,'При необходимости удалить не нужные файлы');
   if not R then exit;

   R:= CallMove(FormMain.P_PhotoCollage_Collage,false,'Посмотреть результат');
   if not R then exit;

   R:= CallMove(FormMain.P_PhotoCollage_CollageSaveToFile,false,'При необходимости сохранить картинку');
   if not R then exit;

    R:= CallMove(FormMain.P_PhotoCollage_ParserCollage,false,'Посмотреть поля объекта');
   if not R then exit;

    R:= CallMove(FormMain.P_PhotoCollage_ExampleShow,false,'Воспроизвести подсказку заново');
   if not R then exit;
end;

procedure TdExampleRunPlayer.Run_Module_ScrollBoxPto;
var R:boolean;
S:string;
begin
   MainFormResize(self);
   Cmd.MouseTo(FCursor.CursorLayer,GetPoint(FormMain));

   R:= CallMove(FormMain.P_ScrollBoxPto_Clear,true,'Очистить список');
   if not R then exit;
   R:= Cmd.ButtonClick(FormMain.P_ScrollBoxPto_Clear) and  Cmd.Delay(500);
   if not  R then
   exit;


   R:= CallMove(FormMain.P_ScrollBoxPto_AddCountValue,true,'Указать кол-во добавляемых элементов');
   if not R then exit;
   R:= Cmd.EditSetText(FormMain.P_ScrollBoxPto_AddCountValue,'500000') and  Cmd.Delay(500);
   if not  R then
   exit;

   R:= CallMove(FormMain.P_ScrollBoxPto_Add,true,'Добавить элементы в ScrollBox');
   if not R then exit;
   R:= Cmd.ButtonClick(FormMain.P_ScrollBoxPto_Add) and  Cmd.Delay(500);
   if not  R then
   exit;

   R:= CallMove(FormMain.P_ScrollBoxPto_Panel,false,'');
   if not R then exit;

   S:='Протестируйте ScrollBox!'+#13#10+
   '1. Изменяйте размер элементов.'  +#13#10+
   '2. Перетаскивайте элементы.'  +#13#10+
   '3. Скрольте выбирая скрости прокрутки.'  +#13#10+
   #13#10+
   'Откройте окно настроек скрол бара, нажав на него ПКМ.';
   R:= Cmd.ShowMessage(S,FormMain.P_ScrollBoxPto_Panel,12000);
   if not R then exit;
end;

procedure TdExampleRunPlayer.Run_Module_WebSocket_Local;
var R:boolean;
S:string;
begin
   MainFormResize(self);
   Cmd.MouseTo(FCursor.CursorLayer,GetPoint(FormWs));


   R:= CallMove(FormWs.P_Server_Run,true,'Остановить, запустить сервер');
   if not R then exit;

   if FormWs.ServerActive then
   R:= Cmd.ButtonClick(FormWs.P_Server_Run) and  Cmd.Delay(500);
   if not  R then
   exit;


   R:= CallMove(FormWs.P_Server_SocketClass,true,'Выбрать класс сокета');
   if not R then exit;
   R:= Cmd.ComboBoxSetIndex(FormWs.P_Server_SocketClass,1) and  Cmd.Delay(500);
   if not  R then
   exit;

   R:= CallMove(FormWs.P_Server_Port,true,'Указать порт сервера');
   if not R then exit;
   R:= Cmd.EditSetText(FormWs.P_Server_Port,'5756') and  Cmd.Delay(500);
   if not  R then
   exit;

   R:= CallMove(FormWs.P_Server_Ssl,true,'');
   if not R then exit;
   S:='Использовать ли SSL шифрование между сервером и клиентами';
   R:=Cmd.ShowMessage(S,FormWs.P_Server_Ssl,4000);
   if not R then exit;

   R:= Cmd.CheckBoxSet(FormWs.P_Server_Ssl,true) and  Cmd.Delay(500);
   if not  R then
   exit;

   R:= CallMove(FormWs.P_Server_Run,true,'Запустить сервер');
   if not R then exit;

   if FormWs.ServerActive then
   R:= Cmd.ButtonClick(FormWs.P_Server_Run) and  Cmd.Delay(500);
   if not  R then
   exit;

   if not FormWs.ServerActive then
   R:= Cmd.ButtonClick(FormWs.P_Server_Run) and  Cmd.Delay(500);
   if not  R then
   exit;

   R:= CallMove(FormWs.P_Server_Log,false,'');
   if not R then exit;

   S:= 'В логах указан порт и класс сервера'+#13#10+
   'На этот порт можно подключится клиентам';
   R:=Cmd.ShowMessage(S,FormWs.P_Server_Log,8000);
   if not R then exit;





   R:= CallMove(FormWs,false,'Сейчас настроим клиент');
   if not R then exit;
   Run_Module_WebSocket_Client('https://127.0.0.1:5756');
   if self.Terminated then exit;

   Run_Module_WebSocket_MessageServerToClient('Привет я сервер!');
end;

procedure TdExampleRunPlayer.Run_Module_WebSocket_MessageServerToClient(Text:string);
var R:boolean;
T:TObject;
PrmStr:PString;
begin

   if FormWs.P_Server_ClientList.Items.Count<0 then
   exit;

   R:= CallMove(FormWs,false,'Отправим сообщение клиенту');
   if not R then exit;

   R:= CallMove(FormWs.P_Server_ClientList,true,'Выбрать клиента для отправки сообщения');
   if not R then exit;
   R:= Cmd.ComboBoxSetIndex(FormWs.P_Server_ClientList,0) and  Cmd.Delay(500);
   if not  R then
   exit;

   R:= CallMove(FormWs.P_Server_SendMessageToClient,true,'Открыть окно редактора сообщения');
   if not R then exit;

   // вызов модальной формы без потери котроля анимацией
   New(PrmStr);
   try
     PrmStr^:= Text;
     T:=  TimerStart(Run_Module_WebSocket_MessageServerToClient_FormModal,TObject(PrmStr));
     try
       R:= Cmd.ButtonClick(FormWs.P_Server_SendMessageToClient);
       if not R then
       exit;
     finally
        T.Free;
     end;
   finally
      Dispose(PrmStr);
   end;

end;

procedure TdExampleRunPlayer.Run_Module_WebSocket_MessageServerToClient_FormModal(Prm:TObject);
var R:boolean;
    Frm:TAmFormModal;
    S:string;
begin
     Frm:=  FormModalActive;
     if Frm = nil then   exit;
     Frm.CanCloseForm:=false;
     try
       if FormWs.P_Server_SendPanel.Parent <>  Frm then
       exit;


       R:= CallMove(FormWs.P_Server_SendMessageText,false,'Написать сообщение выбранному клиенту');
       if not R then exit;
       if FormWs.P_Server_SendPanel.Parent <>  Frm then
       exit;

       Cmd.MemoSetText(FormWs.P_Server_SendMessageText,string(PString(Prm)^));
       if not R then
       exit;
       if FormWs.P_Server_SendPanel.Parent <>  Frm then
       exit;

       R:= CallMove(FormWs.P_Server_SendText,true,'Отправить');
       if not R then exit;
       if FormWs.P_Server_SendPanel.Parent <>  Frm then
       exit;

       FormWs.ClientWasMsg:=false;
       R:= Cmd.ButtonClick(FormWs.P_Server_SendText);
       if not R then
       exit;
       if FormWs.P_Server_SendPanel.Parent <>  Frm then
       exit;
       R:= Cmd.Delay(200);
       if not R then exit;
       if FormWs.ClientWasMsg then S:='Клиент получил сообщение'
       else                        S:='Клиенту не удалось получить сообщение';
       R:= CallMove(FormWs.P_Client_Log,true,S);
       if not R then exit;

     finally
        Frm.CanCloseForm:=true;
        if FormWs.P_Server_SendPanel.Parent =   Frm then
        Frm.Close;
     end;
end;

procedure TdExampleRunPlayer.Run_Module_WebSocket_Remote;
begin
   MainFormResize(self);
   Cmd.MouseTo(FCursor.CursorLayer,GetPoint(FormWs));
    Run_Module_WebSocket_Client('https://stream.binance.com:9443/stream?streams=btcusdt@kline_15m');
end;
procedure TdExampleRunPlayer.Run_Module_WebSocket_Client(Url:string);
var R:boolean;
S:string;
begin


   R:= CallMove(FormWs.P_Client_Connect,true,'');
   if not R then exit;
   S:='Остановить, запустить клиент.';
   R:=Cmd.ShowMessage(S,FormWs.P_Client_Connect,5000);
   if not R then exit;
   if FormWs.ClientActive then
   R:= Cmd.ButtonClick(FormWs.P_Client_Connect) and  Cmd.Delay(500);
   if not  R then
   exit;



   R:= CallMove(FormWs.P_Client_Class,true,'Выбрать класс сокета');
   if not R then exit;
   S:='На сервере и клиенте они должны совпадать';
   R:=Cmd.ShowMessage(S,FormWs.P_Client_Class,3000);
   if not R then exit;
   R:= Cmd.ComboBoxSetIndex(FormWs.P_Client_Class,1) and  Cmd.Delay(500);
   if not  R then
   exit;

   R:= CallMove(FormWs.P_Client_Url,true,'Указать url подключения');
   if not R then exit;
   R:= Cmd.EditSetText(FormWs.P_Client_Url,Url) and  Cmd.Delay(500);
   if not  R then
   exit;
   R:= CallMove(FormWs.P_Client_UrlListOpen,true,'Можно выбрать url из списка');
   if not R then exit;



   R:= CallMove(FormWs.P_Client_Ssl,true,'');
   if not R then exit;
   S:='Требует ли сервер SSL шифрование';
   R:=Cmd.ShowMessage(S,FormWs.P_Client_Ssl,3000);
   if not R then exit;
   R:=Cmd.CheckBoxSet(FormWs.P_Client_Ssl,true);
   if not R then exit;

   R:= CallMove(FormWs.P_Client_Connect,true,'Запустить клиент');
   if not R then exit;
   if FormWs.ClientActive then
   R:= Cmd.ButtonClick(FormWs.P_Client_Connect) and  Cmd.Delay(500);
   if not  R then
   exit;
   if not FormWs.ClientActive then
   R:= Cmd.ButtonClick(FormWs.P_Client_Connect) and  Cmd.Delay(500);
   if not  R then
   exit;


   R:= CallMove(FormWs.P_Client_Log,false,'');
   if not R then exit;

   S:= 'Если клиенту не удалось подключится можете попробовать:'+#13#10+
   '1. Нажать отключится а затем подключится'+#13#10+
   '2. Убрать галочку Ssl шифрование'+#13#10+
   '3. Поменять класс сокета.';
   R:=Cmd.ShowMessage(S,FormWs.P_Client_Log,10000);
   if not R then exit;

   S:='После удачного запуска клиент и сервер могут отправлять друг другу сообщения';
   R:=Cmd.ShowMessage(S,FormWs.P_Client_Log,5000);
   if not R then exit;
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

procedure TdExampleRunSimple.Run_Module_ApiVk;
begin
  AmDialog.ShowTimeOut('','Для модуля ApiVk без анимации нечего настраивать. Включите пример с анимацией.',5000);
end;

procedure TdExampleRunSimple.Run_Module_PhotoCollage;
begin
  Cmd.ButtonClick(FormMain.P_PhotoCollage_FileListClear);
  Cmd.delay(50);
  Run_Module_PhotoCollage_LoadFile;
end;

procedure TdExampleRunSimple.Run_Module_ScrollBoxPto;
begin
   Cmd.ButtonClick(FormMain.P_ScrollBoxPto_Clear);
   Cmd.delay(50);
   Cmd.EditSetText(FormMain.P_ScrollBoxPto_AddCountValue,'500000');
   Cmd.delay(50);
   Cmd.EditSetText(FormMain.P_ScrollBoxPto_DeleteIndexValue,'0');
   Cmd.delay(50);
   Cmd.EditSetText(FormMain.P_ScrollBoxPto_ScrollPosValue,'0');
   Cmd.delay(50);
   Cmd.CheckBoxSet(FormMain.P_ScrollBoxPto_ScrollPosIsAnimated,false);
   Cmd.delay(50);
   Cmd.ButtonClick(FormMain.P_ScrollBoxPto_Add);

end;



procedure TdExampleRunSimple.Run_Module_WebSocket_Local;
begin
   if FormWs.ServerActive then
   Cmd.ButtonClick(FormWs.P_Server_Run);
   Cmd.Delay(50);
   if not Cmd.ComboBoxSetIndex(FormWs.P_Server_SocketClass,1)then exit;
   Cmd.Delay(50);
   if not Cmd.EditSetText(FormWs.P_Server_Port,'5756')then exit;
   Cmd.Delay(50);
   Cmd.CheckBoxSet(FormWs.P_Server_Ssl,true);
   Cmd.Delay(50);
   if FormWs.ServerActive then
   Cmd.ButtonClick(FormWs.P_Server_Run);
   Cmd.Delay(50);
   if not FormWs.ServerActive then
   Cmd.ButtonClick(FormWs.P_Server_Run);
   Cmd.Delay(50);
   Run_Module_WebSocket_Client('https://127.0.0.1:5756');
end;

procedure TdExampleRunSimple.Run_Module_WebSocket_Remote;
begin
    Run_Module_WebSocket_Client('https://stream.binance.com:9443/stream?streams=btcusdt@kline_15m');
end;

procedure TdExampleRunSimple.Run_Module_WebSocket_Client(Url:string);
begin
   if FormWs.ClientActive then
   Cmd.ButtonClick(FormWs.P_Client_Connect);
   Cmd.Delay(50);
   if not Cmd.ComboBoxSetIndex(FormWs.P_Client_Class,1)then exit;
   Cmd.Delay(50);
   if not Cmd.EditSetText(FormWs.P_Client_Url,Url) then exit;
   Cmd.Delay(50);
   Cmd.CheckBoxSet(FormWs.P_Client_Ssl,true);
   Cmd.Delay(50);
   if FormWs.ClientActive then
   Cmd.ButtonClick(FormWs.P_Client_Connect);
   if not FormWs.ClientActive then
   Cmd.ButtonClick(FormWs.P_Client_Connect);
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

