unit demo.Main.Form;

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

  JsonDataObjects,

  AmUserType,
  AmUserScale,
  AmLayBase,
  AmFormModal,
  AmPanel,
  AmButton,
  AmPtPanel,
  AmPtControl,
  AmSystemBase,
  AmSystemObject,
  AmLogTo,
  AmScrollBarTypes,
  AmControlClasses,
  AmGraphic.Help,
  AmListBox,
  AmGraphic.Controls,
  AmControls,
 // AmHookApp,
  AmPtScrollBoxOptimized,
  AmFormJsonResponse,
  AmMemo,
  AmEdit,
  AmCheckBox,
  AmComboBox,
  AmHookProc,

  AmVk.Api.Base,
  AmVk.Api.ObjVk,
  AmVk.Api.EnumTypes,
  AmVk.Api.ObjResponse,
  AmVk.Api.Cmd,
  uAmVkHttp,

  demo.Types,
  demo.Consts,
  demo.Example.Main,
  demo.Module.ApiVk.Baza;


type
  TFormMain = class(TForm)
    LayMain: TAmLayout;
    P_Main: TAmPanel;
    PMain_PanRight: TAmLayout;
    PMain_PanClient: TAmLayout;
    PanGalaryMenu: TPtPanel;
    PanGalaryMenu_PhotoCollage: TAmButton;
    AmButton4: TAmButton;
    AmLayout7: TAmLayout;
    AmLayout1: TAmLayout;
    PanGalaryMenu_WebTraficAnalize: TAmButton;
    PanGalaryMenu_WebSocket: TAmButton;
    PanGalaryMenu_PhotoEditor: TAmButton;
    PanGalaryMenu_ApiVk: TAmButton;
    PanGalaryMenu_ApiTelegram: TAmButton;
    PanGalaryMenu_HttpAnalizer: TAmButton;
    PanGalaryMenu_Threads: TAmButton;
    PanGalaryMenu_ScrollBoxPto: TAmButton;
    AmButton3: TAmButton;
    AmButton5: TAmButton;
    AmButton6: TAmButton;
    AmButton1: TAmButton;
    AmButton2: TAmButton;
    AmButton7: TAmButton;
    AmButton8: TAmButton;
    P_PhotoCollage: TAmPanel;
    Label1: TLabel;
    Label2: TLabel;
    P_PhotoCollage_LayClient: TAmLayout;
    P_PhotoCollage_Collage: TAmImageCollage;
    P_PhotoCollage_Back: TAmButton;
    SbTheme: TAmScrollBarThemeLink;
    P_ApiVk: TAmPanel;
    Label3: TLabel;
    Label4: TLabel;
    AmLayout3: TAmLayout;
    AmLayout4: TAmLayout;
    P_ApiVk_Back: TAmButton;
    P_ApiVk_LoadDefaultCode: TAmButton;
    AmLayout5: TAmLayout;
    P_ApiVk_MemoLog: TAmMemo;
    P_ApiVk_EditorClientBack: TAmLayout;
    P_ApiVk_EditorClient: TAmLayout;
    P_ApiVk_ScriptRun: TAmButton;
    P_ApiVk_SettingOpen: TAmButton;
    P_ApiVk_Setting_Popup: TAmLayout;
    P_ApiVk_Setting_TextCodeAutoSave: TAmCheckBox;
    P_ApiVk_Setting_TokenApiVk: TAmEdit;
    Label5: TLabel;
    P_ApiVk_Setting_HideFormResponse: TAmCheckBox;
    P_ApiVk_TextCodeSave: TAmButton;
    P_WebSocket: TAmPanel;
    Label7: TLabel;
    P_WebSocket_Back: TAmButton;
    P_ScrollBoxPto: TAmPanel;
    Label6: TLabel;
    Label8: TLabel;
    AmLayout6: TAmLayout;
    AmLayout9: TAmLayout;
    AmLayout10: TAmLayout;
    P_ScrollBoxPto_Back: TAmButton;
    P_ScrollBoxPto_Panel: TPtPanel;
    AmLayout8: TAmLayout;
    AmLayout12: TAmLayout;
    Label9: TLabel;
    P_ScrollBoxPto_Add: TAmButton;
    P_ScrollBoxPto_Clear: TAmButton;
    Label10: TLabel;
    P_ScrollBoxPto_Delete: TAmButton;
    P_ScrollBoxPto_ScrollPosValue: TAmEdit;
    Label11: TLabel;
    P_ScrollBoxPto_ScrollPos: TAmButton;
    P_ScrollBoxPto_Log: TAmMemo;
    P_ScrollBoxPto_DeleteIndexValue: TAmEdit;
    P_ScrollBoxPto_AddCountValue: TAmEdit;
    P_ScrollBoxPto_ScrollPosIsAnimated: TAmCheckBox;
    AmLayout13: TAmLayout;
    P_PhotoCollage_FileList: TAmListBoxMyFiles;
    AmLayout11: TAmLayout;
    P_PhotoCollage_FileAdd: TAmButton;
    P_PhotoCollage_FileListClear: TAmButton;
    P_PhotoCollage_CollageSaveToFile: TAmButton;
    P_PhotoCollage_ParserCollage: TAmButton;
    P_PhotoCollage_ExampleShow: TAmButton;

    procedure FormCreate(Sender: TObject);
    procedure PanelCustomBack(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure P_PhotoCollage_FileAddClick(Sender: TObject);
    procedure PanGalaryMenu_PhotoCollageClick(Sender: TObject);
    procedure P_PhotoCollage_FileListClearClick(Sender: TObject);
    procedure P_PhotoCollage_CollageSaveToFileClick(Sender: TObject);
    procedure P_PhotoCollage_FileListClickClose(Sender: TObject; Index: Integer;
      var CanDelete: Boolean);
    procedure P_PhotoCollage_ParserCollageClick(Sender: TObject);
    procedure PanGalaryMenu_ApiVkClick(Sender: TObject);
    procedure P_ApiVk_BackClick(Sender: TObject);
    procedure P_ApiVk_SettingOpenClick(Sender: TObject);
    procedure P_ApiVk_LoadDefaultCodeClick(Sender: TObject);
    procedure P_ApiVk_ScriptRunClick(Sender: TObject);
    procedure P_ApiVk_ChangeSetting(Sender:TObject);
    procedure P_ApiVk_TextCodeSaveClick(Sender: TObject);
    procedure PanGalaryMenu_WebSocketClick(Sender: TObject);
    procedure P_WebSocket_BackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PanGalaryMenu_ScrollBoxPtoClick(Sender: TObject);
    procedure P_ScrollBoxPto_BackClick(Sender: TObject);
    procedure P_ScrollBoxPto_AddClick(Sender: TObject);
    procedure P_ScrollBoxPto_EditNumberCheckEditCheckNewText(Sender: TObject;
      var CanContinue: Boolean);
    procedure P_ScrollBoxPto_DeleteClick(Sender: TObject);
    procedure P_ScrollBoxPto_ClearClick(Sender: TObject);
    procedure P_ScrollBoxPto_ScrollPosClick(Sender: TObject);
    procedure FormAlignPosition(Sender: TWinControl; Control: TControl;
      var NewLeft, NewTop, NewWidth, NewHeight: Integer; var AlignRect: TRect;
      AlignInfo: TAlignInfo);
    procedure FormResize(Sender: TObject);
    procedure P_PhotoCollage_ExampleShowClick(Sender: TObject);
  private
    { Private declarations }
    FOnResizeEvent:IAmEventMethod<TNotifyEvent>;
    FClosingProcess:boolean;
    FExample:TdExample;//demo.Example.TdExample; кнопка пример и анимация заполнения настроек пользователя
    FChangeSettingLock:integer;
    FStackPanel:TdStackPanel;
    FScrollBoxPtoCounterId:Cardinal;
    ScrollBoxPto:TPtoScrollBox;

    function ModifedTextCodeEditorCanSave(AutoSave,NeedConfirm:boolean):boolean;
    function ModifedTextCodeEditorReset(AsSaved:boolean):boolean;
    procedure ModifedTextCodeEditorCheck(NeedConfirm:boolean);
    function FormCodeEditorCheck:boolean;
    procedure PanelOpen(Control:TAmPanel);
    Procedure PanelClose;
    function PanelShowCurrentGet: TAmPanel;
    procedure P_ApiVk_TextCodeSaveEvent(Sender: TObject);
    procedure P_ApiVk_HttpLogEvent(Sender:Tobject;const Msg:string; E:Exception=nil);
    procedure P_ApiVk_NewResponseEvent(Sender:TObject;Base:TAmVkApiResponseBase);
    procedure P_ApiVk_TextCodeSaving;
    function StackPanelCountGet: integer;
    function PanelShowCurrentButtonBackGet: TAmButton;
  public
    { Public declarations }
    property PanelShowCurrent: TAmPanel read PanelShowCurrentGet;
    property PanelShowCurrentButtonBack: TAmButton read PanelShowCurrentButtonBackGet;
    property StackPanelCount:integer read  StackPanelCountGet;
    procedure PanelShowCurrentPairGet(var Panel,ButtonBack:TWinControl);
    procedure OnResizeSub(Event:TNotifyEvent);
    procedure OnResizeUnSub(Event:TNotifyEvent);
    procedure PhotoCollage_FileAddList(L:TStrings);
    property ClosingProcess: boolean read FClosingProcess;
  end;

var
  FormMain: TFormMain;

implementation
   uses demo.Main.Main,
   demo.FormHideControls,
   demo.Module.WebSocket.Form;
{$R *.dfm}

procedure TFormMain.FormAlignPosition(Sender: TWinControl; Control: TControl;
  var NewLeft, NewTop, NewWidth, NewHeight: Integer; var AlignRect: TRect;
  AlignInfo: TAlignInfo);
begin
  if (FExample<>nil) and (Control = FExample.Panel) then
  FExample.PanelAlignCustomize(NewLeft,NewTop,NewWidth,NewHeight,AlignRect,AlignInfo);
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

   if DemoMain.AppCloseLockCount>0 then
   begin
     CanClose:=false;
     if not AmDialog.Confirm('Есть не завещенные процессы в приложении. Закрыть ли программу принудительно?') then
     exit;
     FClosingProcess:=true;
     exit;
   end;
   FClosingProcess:=true;
   CanClose:=true;
   if (FormWebSocket <> nil)
   and FormWebSocket.Showing then
   FormWebSocket.Hide;
   ModifedTextCodeEditorCheck(true);
   LogMain.BeforeDestoyLockNewMsg;
   TAmObjectNotify.Default.SendMessage(AmOperation.MainFormClose,0,0);
   DemoMainDestroy;
   FreeAndNil(FExample);
   FreeAndNil(FStackPanel);
   FOnResizeEvent:=nil;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
   AmUserType.AmSystemInfo.ReportMemory(true);
   FClosingProcess:=false;
   P_ApiVk_MemoLog.Text:='';
   FChangeSettingLock:=0;
   FStackPanel:=TdStackPanel.Create;
   P_Main.Visible:=true;
   FStackPanel.Push(P_Main);


   FScrollBoxPtoCounterId:=0;
   ScrollBoxPto:=TPtoScrollBox.Create;
   ScrollBoxPto.Name:='ScrollBoxPto';
   ScrollBoxPto.Align.Align:=TptAlign.Client;
   ScrollBoxPto.Parent:=  P_ScrollBoxPto_Panel.PtControl;
   ScrollBoxPto.BarV.AThemeLink:= SbTheme;
   ScrollBoxPto.BarH.AThemeLink:= SbTheme;
  // ScrollBoxPto.Color:=clblack;
  // ScrollBoxPto.OnLog:=log;
   FOnResizeEvent:= AmEventMethod.New<TNotifyEvent>;
   DemoMainCreate;
   FExample:= TdExample.Create(self);
end;



procedure TFormMain.FormResize(Sender: TObject);
begin
  FOnResizeEvent.Invoke(self);
end;

procedure TFormMain.OnResizeSub(Event: TNotifyEvent);
begin
   FOnResizeEvent.Add(Event);
end;

procedure TFormMain.OnResizeUnSub(Event: TNotifyEvent);
begin
  FOnResizeEvent.Remove(Event);
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  if FormWebSocket.Parent <> P_WebSocket then
  begin
    FormWebSocket.BorderStyle:=TFormBorderStyle.bsNone;
    FormWebSocket.Align:=alClient;
    FormWebSocket.Parent := P_WebSocket;
  end;
end;


procedure TFormMain.PanelCustomBack(Sender: TObject);
var O:TObject;
begin
   O:=(Sender as TControl).Parent as TAmPanel;
   if O <> nil then
   PanelClose;
end;

procedure TFormMain.PanelOpen(Control: TAmPanel);
begin
     FStackPanel.Peek.Visible:=false;
     FExample.PanelHideCheck(false);
     FStackPanel.Push(Control);
     Control.Visible:=true;
     FExample.PanelShowCheck(Control);
end;

procedure TFormMain.PanelClose;
begin
   if FStackPanel.Count <= 1 then exit;
   FExample.PanelHideCheck(false);
   FStackPanel.Pop.Visible:=false;
   FStackPanel.Peek.Visible:=true;
   FExample.PanelShowCheck(FStackPanel.Peek);
end;

procedure TFormMain.PanelShowCurrentPairGet(var Panel,ButtonBack:TWinControl);
var i:integer;
    C:TControl;
begin
   Panel:=PanelShowCurrent;
    if (Panel <> nil) and (Panel <> P_Main) then
     for I := 0 to Panel.ControlCount-1 do
     begin
        C:= Panel.Controls[i];
       if ( C is TAmButton ) and ( C.Name = Panel.Name + '_Back' ) then
       begin
         ButtonBack:= C as TWinControl;
         exit;
       end;
     end;
end;

function TFormMain.PanelShowCurrentButtonBackGet: TAmButton;
var Panel,ButtonBack:TWinControl;
begin
    PanelShowCurrentPairGet(Panel,ButtonBack);
    Result:= ButtonBack as TAmButton;
end;

function TFormMain.PanelShowCurrentGet: TAmPanel;
begin
    if FStackPanel.Count>0 then
    Result:= FStackPanel.Peek as TAmPanel
    else Result:=nil;
end;

function TFormMain.ModifedTextCodeEditorCanSave(AutoSave,NeedConfirm:boolean): boolean;
begin
   Result:=false;
   if DemoMain.FormCodeEditor <> nil then
   begin
     Result:= DemoMain.FormCodeEditor.Editor.Modified;
     if Result then
     begin
        if not AutoSave and NeedConfirm then
         Result:= AmDialog.Confirm('Сохранить изменения в редакторе кода?');
     end;
   end;
end;
function TFormMain.ModifedTextCodeEditorReset(AsSaved:boolean):boolean;
begin
  Result:=false;
  if DemoMain.FormCodeEditor <> nil then
  begin
    Result:= DemoMain.FormCodeEditor.Editor.Modified;
    DemoMain.FormCodeEditor.Editor.Modified:=false;
    if AsSaved then
     DemoMain.FormCodeEditor.Editor.MarkModifiedLinesAsSaved
     else
     DemoMain.FormCodeEditor.Editor.ResetModificationIndicator;
  end;
end;



procedure TFormMain.ModifedTextCodeEditorCheck(NeedConfirm:boolean);
var b:boolean;
begin
   if FStackPanel.Peek = P_ApiVk then
   begin
      b:= DemoMain.ObjBaza.Setting.ModuleApiVk.TextCodeAutoSave;
     if ModifedTextCodeEditorCanSave(b,NeedConfirm) then
     P_ApiVk_TextCodeSaving;
   end;

end;

function TFormMain.FormCodeEditorCheck:boolean;
begin
    Result:= DemoMain.FormCodeEditor <> nil ;
   if not Result  then
     showmessage('Форма редактора кода еще не была создана попробуйте через 5 секунд.');
end;



procedure TFormMain.PanGalaryMenu_ApiVkClick(Sender: TObject);
var Setting:TdModuleApiVkBazaSetting;
    S:string;
begin
    if not FormCodeEditorCheck then exit;
    if DemoMain.FormCodeEditor.IsPopapModal then
    begin
       showmessage('Необходимо сначало закрыть редактор кода и попробовать еще раз!');
       exit;
    end;
    Setting:= DemoMain.ObjBaza.Setting.ModuleApiVk;
    inc(FChangeSettingLock);
    try
      DemoMain.VkHttpCheckCreate;
      DemoMain.VkHttp.Api.OnLog:=  P_ApiVk_HttpLogEvent;
      DemoMain.VkHttp.Api.OnNewReponse:=  P_ApiVk_NewResponseEvent;
      DemoMain.VkHttp.Api.Token:=   Setting.TokenApiVk;

      DemoMain.FormCodeEditor.ListVar.Add('VkHttp','TAmVkHttp','uAmVkHttp',DemoMain.VkHttpPVar);
      if DemoMain.FormCodeEditor.Parent <> P_ApiVk_EditorClient then
      begin
        DemoMain.FormCodeEditor.BorderStyle:=TFormBorderStyle.bsNone;
        DemoMain.FormCodeEditor.Align:=alClient;
        DemoMain.FormCodeEditor.Parent := P_ApiVk_EditorClient;
        DemoMain.FormCodeEditor.MemoConsole.Height:= AmScaleV(75);
      end;
      DemoMain.FormCodeEditor.Show;

      if not  Setting.TextCodeWasDefaultSetter then
      begin
       Setting.TextCodeWasDefaultSetter:=true;
       DemoMain.FormCodeEditor.TextCode:= SCRIPT_API_VK_DEFAULT;
      end
      else
      begin
        S:= Setting.TextCode;
        if S = '' then
          DemoMain.FormCodeEditor.TextCode:= SCRIPT_API_VK_DEFAULT
        else
          DemoMain.FormCodeEditor.TextCode:= S;
      end;
      P_ApiVk_Setting_TextCodeAutoSave.Checked:=    Setting.TextCodeAutoSave;
      P_ApiVk_Setting_TokenApiVk.EditText:=         Setting.TokenApiVk;
      P_ApiVk_Setting_HideFormResponse.Checked :=   Setting.HideFormResponse;

      DemoMain.FormCodeEditor.OnSaveTextCodeSub(P_ApiVk_TextCodeSaveEvent);

      ModifedTextCodeEditorReset(false);
      PanelOpen(P_ApiVk);
    finally
      dec(FChangeSettingLock);
    end;
end;

procedure TFormMain.P_ApiVk_BackClick(Sender: TObject);
begin
  DemoMain.VkHttp.Api.OnLog:=  nil;
  DemoMain.VkHttp.Api.OnNewReponse:= nil;
  ModifedTextCodeEditorCheck(true);
  DemoMain.FormCodeEditor.OnSaveTextCodeUnSub(P_ApiVk_TextCodeSaveEvent);
  DemoMain.FormCodeEditor.ListVar.Clear;
  DemoMain.VkHttpDestoy;
  DemoMain.FormCodeEditor.Hide;
  PanelCustomBack(Sender);
end;

procedure TFormMain.P_ApiVk_ChangeSetting(Sender:TObject);
var Setting:TdModuleApiVkBazaSetting;
begin
    if FChangeSettingLock>0 then exit;
    inc(FChangeSettingLock);
    try
      Setting:= DemoMain.ObjBaza.Setting.ModuleApiVk;
      if Sender = P_ApiVk_Setting_TextCodeAutoSave then
       Setting.TextCodeAutoSave:= P_ApiVk_Setting_TextCodeAutoSave.Checked
      else if Sender = P_ApiVk_Setting_TokenApiVk then
      begin
        Setting.TokenApiVk:= P_ApiVk_Setting_TokenApiVk.EditText;
        if DemoMain.VkHttp<>nil then
        DemoMain.VkHttp.Api.Token:=   Setting.TokenApiVk;
      end
      else if Sender = P_ApiVk_Setting_HideFormResponse then
        Setting.HideFormResponse:= P_ApiVk_Setting_HideFormResponse.Checked

    finally
      dec(FChangeSettingLock);
    end;
 //
end;

procedure TFormMain.P_ApiVk_LoadDefaultCodeClick(Sender: TObject);
var Setting:TdModuleApiVkBazaSetting;
begin
  if not FormCodeEditorCheck then exit;
  Setting:= DemoMain.ObjBaza.Setting.ModuleApiVk;
  inc(FChangeSettingLock);
  try
    Setting.TextCodeWasDefaultSetter:=false;
    Setting.TextCode:='';
    DemoMain.FormCodeEditor.TextCode:= SCRIPT_API_VK_DEFAULT;
    ModifedTextCodeEditorReset(false);
  finally
    dec(FChangeSettingLock);
  end;
end;

procedure TFormMain.P_ApiVk_ScriptRunClick(Sender: TObject);
begin
   if not FormCodeEditorCheck then exit;
   DemoMain.FormCodeEditor.CompileAndRun;
end;

procedure TFormMain.P_ApiVk_SettingOpenClick(Sender: TObject);
begin
  FormModal.ShowModal(P_ApiVk_Setting_Popup);
end;

procedure TFormMain.P_ApiVk_TextCodeSaveClick(Sender: TObject);
begin
     P_ApiVk_TextCodeSaving;
end;

procedure TFormMain.P_ApiVk_TextCodeSaving;
begin
     if not FormCodeEditorCheck then exit;
     DemoMain.ObjBaza.Setting.ModuleApiVk.TextCode:= DemoMain.FormCodeEditor.TextCode;
     ModifedTextCodeEditorReset(true);
end;

procedure TFormMain.P_ApiVk_TextCodeSaveEvent(Sender: TObject);
begin
   ModifedTextCodeEditorCheck(false);
end;

procedure TFormMain.P_ApiVk_HttpLogEvent(Sender:Tobject;const Msg:string; E:Exception=nil);
begin
    // тестовые запросы со скрипта выполняются в главном потоке синхр не требуется
    if not  AmPotId.IsMain then  exit;
     P_ApiVk_MemoLog.Lines.Add(Msg);
end;

procedure  TFormMain.P_ApiVk_NewResponseEvent(Sender:TObject;Base:TAmVkApiResponseBase);
var
     Form:TFormJsonResponse;
      procedure LocLog(s:string);
      begin
        P_ApiVk_HttpLogEvent(Sender,s,nil);
      end;
      procedure LocResponceToLog;
      begin
           LocLog('URL : '+Base.Link);

           if Base.isGood then
            LocLog('RESULT : TRUE')
           else
            LocLog('RESULT : FALSE');


           LocLog('ERROR : '+Base.GetError);
           LocLog('ResultText : '+Base.ResultText);
           LocLog('STACKTRACE : '+Base.ErrorCode.StackTraceAM);
      end;
begin
     if not  AmPotId.IsMain then  exit;
     LocResponceToLog;

     if DemoMain.ObjBaza.Setting.ModuleApiVk.HideFormResponse then exit;

     Form:=AmFormViewField.New;
     Form.CloseAction := TCloseAction.caFree;
     Form.Show;
     Form.ViewUPD(Base.ResultText,Base,[TAmVkApiCmdBase,TAmVkApiMetod,TAmVkApiResponseBase],[TAmVkApiCmdBase]);
end;



procedure TFormMain.PanGalaryMenu_WebSocketClick(Sender: TObject);
begin

  if FormWebSocket = nil  then
  begin
   showmessage('Форма WebSocket еще недоступна попробуйте через 5 сек.');
   exit;
  end;
  if FormWebSocket.Parent <> P_WebSocket then
  begin
    FormWebSocket.BorderStyle:=TFormBorderStyle.bsNone;
    FormWebSocket.Align:=alClient;
    FormWebSocket.Parent := P_WebSocket;
  end;
  FormWebSocket.Visible:=true;

  PanelOpen(P_WebSocket);

   //P_WebSocket
end;

procedure TFormMain.P_WebSocket_BackClick(Sender: TObject);
begin
   FormWebSocket.Hide;
   PanelClose();
end;

function TFormMain.StackPanelCountGet: integer;
begin
  if FStackPanel<>nil then
  Result:= FStackPanel.Count
  else Result:=0;
end;

procedure TFormMain.PanGalaryMenu_PhotoCollageClick(Sender: TObject);
begin
    PanelOpen(P_PhotoCollage);
end;

procedure TFormMain.P_PhotoCollage_CollageSaveToFileClick(Sender: TObject);
var S:string;
P:TPicture;
begin
   P:= P_PhotoCollage_Collage.Convector.Picture;
   if (P.Graphic <> nil)
   and not P.Graphic.Empty then
   begin
    if not AmDialog.SaveDialogFile('',S,AmFile.LocalPath,'bmp') then exit;
    if S ='' then  exit;
    P.SaveToFile(s);
    AmDialog.OpenFileShellSelect(s,false);
   end;
end;

procedure TFormMain.P_PhotoCollage_ExampleShowClick(Sender: TObject);
begin
 FExample.PanelOutRegistry(P_PhotoCollage);
 FExample.PanelShowCheck(P_PhotoCollage);
end;

procedure TFormMain.P_PhotoCollage_FileAddClick(Sender: TObject);
var L:TStringlist;
begin

  L:=TStringlist.Create;
  try
    if not AmDialog.OpenDialogFileMulti('',L,'') then exit;
    PhotoCollage_FileAddList(L);
  finally
    L.Free;
  end;
end;

procedure TFormMain.PhotoCollage_FileAddList(L:TStrings);
var ItemLb:TAmLbItemMyFile;
i:integer;
begin
    P_PhotoCollage_FileList.Items.BeginUpdate;
    try
       for I := 0 to L.Count-1  do
       begin
          ItemLb:=P_PhotoCollage_FileList.ObjectItemAdd();
          ItemLb.FileName:= L[i];
          ItemLb.NameRu:= AmFileBase.ExtractName(L[i]);
          ItemLb.ButtonCloseVisible:=true;
       end;
    finally
      P_PhotoCollage_FileList.Items.EndUpdate;
    end;
    P_PhotoCollage_Collage.Convector.AddFiles(L);
end;

procedure TFormMain.P_PhotoCollage_FileListClearClick(Sender: TObject);
begin
   P_PhotoCollage_FileList.Clear;
   P_PhotoCollage_Collage.cClear;
end;

procedure TFormMain.P_PhotoCollage_FileListClickClose(Sender: TObject;
  Index: Integer; var CanDelete: Boolean);
begin
    CanDelete:=true;
    P_PhotoCollage_Collage.Convector.Delete(Index);
end;




procedure TFormMain.P_PhotoCollage_ParserCollageClick(Sender: TObject);
 var Proc:TFormJsonResponseOnShowForm;
begin
  Proc:= procedure (Form:TFormJsonResponse)
    var J:TJsonObject;
    type
      // новый type т.к AmRecordHlp.ToJsonField парсит только record или object
      TRec = record
       List:TArray<TAmCollageItem>;
      end;


var Rec:TRec;
   begin
       Form.Page.ActivePage:= Form.TabRecord;
       Rec.List:= P_PhotoCollage_Collage.Convector.ArrayItemsHack;
       J:=AmRecordHlp.ToJsonField(Rec,10,true,[],[]);
       try
         amjson.ToNode(Form.ViewRecordResponse,J,false);
       finally
         J.free;
       end;
   end;
   AmFormViewField.Show(Proc);

end;


procedure TFormMain.PanGalaryMenu_ScrollBoxPtoClick(Sender: TObject);
begin
  PanelOpen(P_ScrollBoxPto);
end;



procedure TFormMain.P_ScrollBoxPto_BackClick(Sender: TObject);
begin
  PanelClose();
end;

procedure TFormMain.P_ScrollBoxPto_ClearClick(Sender: TObject);
var ms:TdDiagnosticTime;
S:string;
begin
  ms.Start;
  ScrollBoxPto.Box.BazaList.ClearBaza;
  S:= ms.Stop;
  P_ScrollBoxPto_Log.Lines.Add('Удаление всех елементов заняло:'+S);
end;

procedure TFormMain.P_ScrollBoxPto_DeleteClick(Sender: TObject);
var i:integer;
begin
  i:= AmInt(P_ScrollBoxPto_DeleteIndexValue.EditText.Replace(' ',''),-1);
  if (i>=0) and (i< ScrollBoxPto.Box.BazaList.CountBaza) then
  ScrollBoxPto.Box.BazaList.ItemsBaza[i].Free;
end;

procedure TFormMain.P_ScrollBoxPto_EditNumberCheckEditCheckNewText(Sender: TObject;
  var CanContinue: Boolean);
begin
   AmEditHlp.TextSpaceNumber(Sender as TAmEdit,CanContinue);
end;

procedure TFormMain.P_ScrollBoxPto_ScrollPosClick(Sender: TObject);
var I:Int64;
var ms:TdDiagnosticTime;
S:string;
B:boolean;
Time:Cardinal;
begin
   ms.Start;
   B:=P_ScrollBoxPto_ScrollPosIsAnimated.Checked;
   Time:=amIf.Car(B,200,0);
   I:=  amInt64Max(P_ScrollBoxPto_ScrollPosValue.EditText.Replace(' ',''),0);
   ScrollBoxPto.Box.BazaScrollJumpToPos(I,Time);
   S:= ms.Stop(dMs,amIf.Car(B,200,0));
   P_ScrollBoxPto_Log.Lines.Add('Скролинг занял :'+S);
   P_ScrollBoxPto_ScrollPosValue.EditText:= ScrollBoxPto.Box.BazaPosition.ToString;
end;

procedure TFormMain.P_ScrollBoxPto_AddClick(Sender: TObject);
var i:integer;
  B:TPtoBaza;
  c:integer;
  ms:TdDiagnosticTime;
  S:string;

  function LocGetCount:integer;
   var c:integer;
   s:string;
  begin
      s:= P_ScrollBoxPto_AddCountValue.EditText.Replace(' ','');
      c:=amIntMax(s);
     if c>2000000 then
      c:= 2000000;
     Result:= min(3000000 - ScrollBoxPto.Box.BazaList.CountBaza,c);
  end;
begin

  c:= LocGetCount;
  P_ScrollBoxPto_AddCountValue.EditText:= c.ToString;
  ms.Start;
  ScrollBoxPto.Box.BazaScrollLock;
  try

     for I := 0 to c -1  do
     begin
        inc(FScrollBoxPtoCounterId);
        B:=TPtoBaza.Create();
        B.Size:=TSize.Create(math.RandomRange(100,250),math.RandomRange(100,300));
        B.TextTest:='Name'+FScrollBoxPtoCounterId.ToString;
       // if random(100)<50 then
        //B.Offset:=10;
        B.ColorTest:=AmColorConvert2.RandomColorL(177);
        B.Box:= ScrollBoxPto.Box;
     end;

  finally
    ScrollBoxPto.Box.BazaScrollUnLock;
  end;
  S:= ms.Stop;
  P_ScrollBoxPto_Log.Lines.Add('Добавление елементов заняло:'+S);
end;

end.
