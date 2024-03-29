﻿unit demo.Module.WebSocket.Form;

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
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,

  IdContext,
  IdSSLOpenSSL,
  ES.BaseControls,
  ES.Layouts,

  AmSystemBase,
  AmSystemObject,
  AmUserType,
  AmUserScale,
  AmLayBase,
  AmPanel,
  AmPtPanel,
  AmEdit,
  AmCheckBox,
  AmButton,
  AmFormModal,
  AmFormBased,
  AmListBox,
  AmComboBox,
  AmScrollBarTypes,
  AmControls,
  AmMemo,

  AmWs.HandlerIO,
  AmWs.Prt.Crt,
  AmWs.Client.Http.BaseAbstract,
  AmWs.Client.Http.Base,
  AmWs.Client.Http.Crt,
  AmWs.Server.Http.Base,
  AmWs.Server.Context.Base,
  AmWs.ReadWrite.Std1,
  AmWs.ReadWrite.Base,
  AmWs.ReadWrite.WebSocket,
  AmWs.ReadWrite.Crt,
  AmWs.Server.Http.Crt,
  AmWs.Server.Dos,

  demo.Module.WebSocket.Baza,
  demo.Module.WebSocket.Types;

type

  TFormWebSocket = class(TAmFormBase)
    SbThemeClient: TAmScrollBarThemeLink;
    P_Client_UrlListPanel: TAmLayout;
    P_Client_UrlList: TAmListBox;
    P_Main: TAmLayout;
    P_Client: TAmLayout;
    P_ClientTop: TAmLayout;
    Label1: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    P_Client_Class: TAmComboBox;
    P_Client_Url: TAmEdit;
    P_Client_Ssl: TAmCheckBox;
    P_Client_Proxy: TAmEdit;
    P_Client_Connect: TAmButton;
    P_Client_SendOpen: TAmButton;
    P_Client_UrlListOpen: TAmButton;
    P_Client_Log: TAmMemo;
    P_Server: TAmLayout;
    P_Spliter: TAmLayout;
    AmLayout1: TAmLayout;
    Label6: TLabel;
    Label7: TLabel;
    P_Server_Ssl: TAmCheckBox;
    P_Server_Run: TAmButton;
    P_Server_Log: TAmMemo;
    Label5: TLabel;
    P_Server_SocketClass: TAmComboBox;
    P_Server_Port: TAmEdit;
    Label10: TLabel;
    P_Server_ClientList: TAmComboBox;
    P_Server_SendMessageToClient: TAmButton;
    SbThemeServer: TAmScrollBarThemeLink;
    P_Client_SendPanel: TAmLayout;
    P_Client_SendMessageText: TAmMemo;
    Label4: TLabel;
    P_Client_SendPing: TAmButton;
    P_Client_SendText: TAmButton;
    P_Client_SendFile: TAmButton;
    P_Server_SendPanel: TAmLayout;
    Label9: TLabel;
    P_Server_SendMessageText: TAmMemo;
    P_Server_SendText: TAmButton;
    P_Example_CasePanel: TAmLayout;
    Label11: TLabel;
    P_Example_Local: TAmButton;
    P_Example_Remote: TAmButton;
    procedure P_Client_UrlListOpenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure SettingChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure P_Client_ClassDropDown(Sender: TObject);
    procedure P_Client_ConnectClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    function P_MainAlignInsertBefore(Sender: TWinControl;
      C1, C2: TControl): Boolean;
    procedure P_MainAlignPosition(Sender: TWinControl; Control: TControl;
      var NewLeft, NewTop, NewWidth, NewHeight: Integer; var AlignRect: TRect;
      AlignInfo: TAlignInfo);
    procedure P_SpliterMoveWindow(Sender: TObject);
    procedure P_SpliterBeforeMoveSized(Sender: TObject);
    procedure P_Server_ClientListChangeIndex(Sender: TObject; Index: Integer);
    procedure P_Server_RunClick(Sender: TObject);
    procedure P_Server_SocketClassDropDown(Sender: TObject);
    procedure P_Client_SendOpenClick(Sender: TObject);
    procedure P_Client_SendFileClick(Sender: TObject);
    procedure P_Client_SendPingClick(Sender: TObject);
    procedure P_Client_SendTextClick(Sender: TObject);
    procedure P_Client_UrlListChangeSelect(Sender: TObject);
    procedure P_Server_SendMessageToClientClick(Sender: TObject);
    procedure P_Server_SendTextClick(Sender: TObject);
    procedure P_Example_LocalClick(Sender: TObject);
    procedure P_Example_RemoteClick(Sender: TObject);
  private
    { Private declarations }
    FSettingLock: Integer;
    FWsClient: TAmWsClientHttpBase;
    FWsServer: TAmWsServerHttpBase;
    FSpliterControlInit: Boolean;
    FServerSelectPair: TdWsClientPairCs;
    FExampleCasePanelShowResult: Integer;
    FWasMsgClient: Boolean;

    procedure WsClientConnect;
    procedure WsClientDisconnect;
    procedure WsClientLog(Sender: TObject; const Text: string;
      exception: exception = nil);
    procedure WsClientPing(S: TObject; str: string; int: int64);
    procedure WsClientPong(S: TObject; str: string; int: int64);
    procedure WsClientMsg(ParentClient: TAmWsClientHttpBaseUser;
      const Text: string);
    procedure WsClientDisconnected(Sender: TObject);
    procedure WsClientConnectedHeadAfterRead(Sender: TObject);
    procedure WsClientCanWriteEx(Sender: TObject);
    procedure WsClientCanRead(Sender: TObject);
    procedure ClientUpdateStatusConnent;
    procedure ClientUpdateUserConnent;
    procedure ClientLogCall(From: string; IsMsg: Boolean; msg: string);
    procedure ClientLogBack(P: IAmPostCustom);
    Procedure ClientLogMemo(From, msg: string; IsMsg: Boolean);
    procedure ClientSendMessage(FileName: string; SourceString: string;
      IsPing: Boolean);

    procedure WsServerConnect;
    procedure WsServerDisconnect;

    procedure WsServerIOHandlerSSLGetPassword(var Password: String);
    procedure WsServerLog(Sender: TObject; const Text: string;
      exception: exception = nil);
    procedure WsServerCanWriteEx(Sender: TObject; Ctx: TAmWsServerCtx_Base);
    procedure WsServerClientConnect(AContext: TIdContext);

    procedure WsServerClientDisconnect(AContext: TIdContext);
    procedure WsServerException(AContext: TIdContext; AException: exception);
    procedure WsServerClientNewMessage(Sender: TObject;
      const AContext: TAmWsServerCtx_Base; const aText: string);

    procedure ServerUpdateStatusRun;
    procedure ServerUpdateRun;

    procedure ServerChangedListClientCall(IsAdder: Boolean; PeerIP: string;
      PeerPort: Integer);
    procedure ServerChangedListClientBack(P: IAmPostCustom);
    procedure ServerChangedListClient(IsAdder: Boolean; PeerIP: string;
      PeerPort: Integer);

    procedure ServerLogCall(From: string; msg: string);
    procedure ServerLogBack(P: IAmPostCustom);
    Procedure ServerLogMemo(From, msg: string);
    procedure ServerSendMessageToClient(Client: TdWsClientPair; Text: string);

    procedure SettingLoad;
    procedure FormIn;
    procedure FormOut;
    function ClientActiveGet: Boolean;
    function ServerActiveGet: Boolean;
    function ClientWasMsgGet: Boolean;
    procedure ClientWasMsgSet(const Value: Boolean);
  public
    { Public declarations }
    function ExampleCasePanelShow: Integer;
    property ServerActive: Boolean read ServerActiveGet;
    property ClientActive: Boolean read ClientActiveGet;
    property ClientWasMsg: Boolean read ClientWasMsgGet write ClientWasMsgSet;
    procedure BeforeMainFormClose;
  end;

var
  FormWebSocket: TFormWebSocket;

implementation

uses demo.Main.Main, demo.FormHideControls;
{$R *.dfm}

function TFormWebSocket.ExampleCasePanelShow: Integer;
begin
  FExampleCasePanelShowResult := 0;
  FormModal.ShowModal(P_Example_CasePanel);
  Result := FExampleCasePanelShowResult;
end;

procedure TFormWebSocket.P_Example_LocalClick(Sender: TObject);
var
  F: TAmFormBase;
begin
  FExampleCasePanelShowResult := 1;
  F := FormModal.ActiveFormBaseGet;
  if (F <> nil) and (P_Example_CasePanel.Parent = F) then
    F.Close;
end;

procedure TFormWebSocket.P_Example_RemoteClick(Sender: TObject);
var
  F: TAmFormBase;
begin
  FExampleCasePanelShowResult := 2;
  F := FormModal.ActiveFormBaseGet;
  if (F <> nil) and (P_Example_CasePanel.Parent = F) then
    F.Close;
end;

function TFormWebSocket.ServerActiveGet: Boolean;
begin
  Result := Assigned(FWsServer) and FWsServer.Active;
end;

procedure TFormWebSocket.BeforeMainFormClose;
begin
  FormOut;
  if FormWebSocket.Showing then
    FormWebSocket.Hide;
end;

function TFormWebSocket.ClientActiveGet: Boolean;
begin
  Result := Assigned(FWsClient) and FWsClient.UserConnected
end;

procedure TFormWebSocket.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WsClientDisconnect;
end;

procedure TFormWebSocket.FormCreate(Sender: TObject);
begin
  FWasMsgClient := false;
  FExampleCasePanelShowResult := 0;
  FSpliterControlInit := false;
  FSettingLock := 0;
  FWsClient := nil;
  P_Client_Log.Text := '';
  P_Server_Log.Text := '';
  P_Client_Log.AutoScrollWithAdd := true;
  P_Server_ClientList.DropResetSession := true;
  FServerSelectPair := TdWsClientPairCs.Create;
  ServerUpdateStatusRun;
end;

procedure TFormWebSocket.FormDestroy(Sender: TObject);
begin
  WsClientDisconnect;
  FreeAndNil(FServerSelectPair);
end;

procedure TFormWebSocket.FormHide(Sender: TObject);
begin
  FormOut;
end;

procedure TFormWebSocket.FormIn;
begin
  SettingLoad;
end;

procedure TFormWebSocket.FormOut;
begin
  WsClientDisconnect;
  WsServerDisconnect;
end;

procedure TFormWebSocket.FormShow(Sender: TObject);
begin
  FormIn;
end;

procedure TFormWebSocket.SettingLoad;
var
  Client: TdModuleWebSocketClientSetting;
  Server: TdModuleWebSocketServerSetting;
begin
  Client := DemoMain.ObjBaza.Setting.ModuleWebSocketClient;
  Server := DemoMain.ObjBaza.Setting.ModuleWebSocketServer;
  inc(FSettingLock);
  try
    P_Client_Class.ItemValueSelected(Client.SocketClass, true);
    P_Client_Url.EditText := Client.Url;
    P_Client_Proxy.EditText := Client.Proxy;
    P_Client_Ssl.Checked := Client.Ssl;

    P_Server_SocketClass.ItemValueSelected(Server.SocketClass, true);
    P_Server_Port.EditText := Server.Port.ToString;
    P_Server_Ssl.Checked := Server.Ssl;

  finally
    dec(FSettingLock);
  end;
end;

procedure TFormWebSocket.SettingChange(Sender: TObject);
var
  Client: TdModuleWebSocketClientSetting;
  Server: TdModuleWebSocketServerSetting;
begin
  Client := DemoMain.ObjBaza.Setting.ModuleWebSocketClient;
  Server := DemoMain.ObjBaza.Setting.ModuleWebSocketServer;

  if FSettingLock > 0 then
    exit;
  inc(FSettingLock);
  try
    if Sender = P_Client_Class then
      Client.SocketClass := P_Client_Class.ItemCaption

    else if Sender = P_Client_Url then
      Client.Url := P_Client_Url.EditText

    else if Sender = P_Client_Proxy then
      Client.Url := P_Client_Proxy.EditText

    else if Sender = P_Client_Ssl then
      Client.Ssl := P_Client_Ssl.Checked

    else if Sender = P_Server_SocketClass then
      Server.SocketClass := P_Server_SocketClass.ItemCaption

    else if Sender = P_Server_Port then
      Server.Port := AmInt(P_Server_Port.EditText, 0)

    else if Sender = P_Server_Ssl then
      Server.Ssl := P_Server_Ssl.Checked
  finally
    dec(FSettingLock);
  end;
end;

procedure TFormWebSocket.P_Client_ClassDropDown(Sender: TObject);
begin
  dWebSocketHelper.ClassClientToList(P_Client_Class.Items, false);
end;

procedure TFormWebSocket.P_Client_ConnectClick(Sender: TObject);
begin
  ClientUpdateUserConnent;
end;

procedure TFormWebSocket.P_Client_SendFileClick(Sender: TObject);
var
  S: string;
begin
  if not AmDialog.OpenDialogFile('', S, '') then
    exit;
  ClientSendMessage(S, '', false);
end;

procedure TFormWebSocket.P_Client_SendOpenClick(Sender: TObject);
begin
  FormModal.ShowModal(P_Client_SendPanel);
end;

procedure TFormWebSocket.P_Client_SendPingClick(Sender: TObject);
begin
  ClientSendMessage('', '', true);
end;

procedure TFormWebSocket.P_Client_SendTextClick(Sender: TObject);
begin
  ClientSendMessage('', P_Client_SendMessageText.Text, false);
end;

procedure TFormWebSocket.P_Client_UrlListChangeSelect(Sender: TObject);
var
  P: TAmFormModal;
begin
  P := FormModalActive;
  if (P <> nil) and (P_Client_UrlListPanel.Parent = P) then
    P.Close;
end;

procedure TFormWebSocket.P_Client_UrlListOpenClick(Sender: TObject);
begin
  P_Client_UrlList.ItemIndex := -1;
  FormModal.ShowModal(P_Client_UrlListPanel);
  if P_Client_UrlList.ItemIndex >= 0 then
    P_Client_Url.EditText := P_Client_UrlList.ItemIndexCaption;

end;

procedure TFormWebSocket.P_Server_ClientListChangeIndex(Sender: TObject;
  Index: Integer);
begin
  if Index >= 0 then
    FServerSelectPair.NewPairSetter(P_Server_ClientList.ItemCaption)
  else
    FServerSelectPair.NewPairSetter('');
end;

procedure TFormWebSocket.P_Server_RunClick(Sender: TObject);
begin
  ServerUpdateRun;
end;

procedure TFormWebSocket.P_Server_SendMessageToClientClick(Sender: TObject);
begin
  FormModal.ShowModal(P_Server_SendPanel);
end;

procedure TFormWebSocket.P_Server_SendTextClick(Sender: TObject);
begin
  ServerSendMessageToClient(FServerSelectPair.Pair,
    P_Server_SendMessageText.Text);
end;

procedure TFormWebSocket.P_Server_SocketClassDropDown(Sender: TObject);
begin
  dWebSocketHelper.ClassServerToList(P_Server_SocketClass.Items, false);
end;

procedure TFormWebSocket.P_SpliterBeforeMoveSized(Sender: TObject);
begin
  FSpliterControlInit := true;
end;

procedure TFormWebSocket.P_SpliterMoveWindow(Sender: TObject);
begin
  P_Spliter.SetBounds(min(P_Main.Width - P_Spliter.Width - AmScaleV(50),
    max(0, P_Spliter.Left)), 0, P_Spliter.Width, P_Main.Height);
end;

function TFormWebSocket.P_MainAlignInsertBefore(Sender: TWinControl;
  C1, C2: TControl): Boolean;
begin
  Result := C1.Margins.ControlLeft < C2.Margins.ControlLeft;
end;

procedure TFormWebSocket.P_MainAlignPosition(Sender: TWinControl;
  Control: TControl; var NewLeft, NewTop, NewWidth, NewHeight: Integer;
  var AlignRect: TRect; AlignInfo: TAlignInfo);
begin
  if Control = P_Spliter then
  begin
    if Control.Left < Control.Width then
      NewLeft := Control.Width;
    if Control.Left + Control.Width + AmScaleV(50) > AlignRect.Width then
      NewLeft := AlignRect.Width - (Control.Width + AmScaleV(50));
  end;

  if not FSpliterControlInit then
  begin
    if Control = P_Client then
    begin
      NewLeft := 0;
      NewTop := 0;
      NewWidth := AlignRect.Width div 2 - P_Spliter.Width div 2;
      NewHeight := AlignRect.Height;

    end
    else if Control = P_Server then
    begin
      NewLeft := AlignRect.Width div 2 + P_Spliter.Width div 2 + 3;
      NewTop := 0;
      NewWidth := AlignRect.Width div 2 - P_Spliter.Width div 2 - 6;
      NewHeight := AlignRect.Height;
    end
    else if Control = P_Spliter then
    begin
      NewLeft := AlignRect.Width div 2 - P_Spliter.Width div 2;
      NewTop := 0;
      NewHeight := AlignRect.Height;
    end;
  end
  else
  begin
    if Control = P_Client then
    begin
      NewLeft := 0;
      NewTop := 0;
      NewWidth := P_Spliter.Left;
      NewHeight := AlignRect.Height;
      NewWidth := min(NewWidth, AlignRect.Width - P_Spliter.Width -
        AmScaleV(50));
    end
    else if Control = P_Server then
    begin
      NewLeft := P_Spliter.Left + P_Spliter.Width + 3;
      NewTop := 0;
      NewWidth := AlignRect.Width - (P_Spliter.Left + P_Spliter.Width) - 6;
      NewHeight := AlignRect.Height;
    end
    else if Control = P_Spliter then
      NewHeight := AlignRect.Height;
  end;

end;

procedure TFormWebSocket.WsServerConnect;
var
  AClass: TAmWsServerCtx_Class;
begin
  WsServerDisconnect;
  if P_Server_Ssl.Checked then
  begin
    if not TdMain.wsSllServerCheckFile then
    begin
      showmessage('Не найдены файлы Ssl .key .crt .pem');
      exit;
    end;
  end;
  AClass := dWebSocketHelper.ServerGetClass(P_Server_SocketClass.ItemCaption);
  if AClass = nil then
  begin
    showmessage('Укажите класс сервера');
    exit;
  end;
  FWsServer := TAmWsServerHttpBase.Create(self);
  FWsServer.OnCanWriteEx := WsServerCanWriteEx;
  FWsServer.OnConnect := WsServerClientConnect;
  FWsServer.OnDisconnect := WsServerClientDisconnect;
  FWsServer.OnException := WsServerException;
  FWsServer.OnNewMessageTest1 := WsServerClientNewMessage;
  FWsServer.OnLog := WsServerLog;
  FWsServer.ParamServer.ClassCtx := AClass;
  FWsServer.ParamServer.DefaultPort := AmInt(P_Server_Port.EditText, 5756);
  FWsServer.ParamServer.SLL_1_0 := P_Server_Ssl.Checked;
  FWsServer.ParamServer.SLL_1_1 := P_Server_Ssl.Checked;
  FWsServer.ParamServer.SLL_1_2 := P_Server_Ssl.Checked;

  if P_Server_Ssl.Checked then
  begin
    FWsServer.ParamServer.ProcOnGetPassword := WsServerIOHandlerSSLGetPassword;
    FWsServer.ParamServer.KeyFile := AmFile.LocalPath +
      TdMain.ws_ssl_server_key_fn;
    FWsServer.ParamServer.CertFile := AmFile.LocalPath +
      TdMain.ws_ssl_server_crt_fn;
    FWsServer.ParamServer.RootCertFile := AmFile.LocalPath +
      TdMain.ws_ssl_server_root_fn;
  end;

  FWsServer.ParamServer.CanNewMessageEventTest := true;
  FWsServer.ParamServerUpdate;
  FWsServer.Active := true;
  ServerLogMemo('SERVER', 'Port:' + FWsServer.DefaultPort.ToString);
  ServerLogMemo('SERVER', 'ClassContext:' +
    FWsServer.ParamServer.ClassCtx.ClassName);
  ServerUpdateStatusRun;
end;

procedure TFormWebSocket.WsServerDisconnect;
begin
  P_Server_ClientList.Items.Clear;
  P_Server_ClientList.ItemCaption := '';
  if FWsServer <> nil then
  begin
    FWsServer.Active := false;
    FreeAndNil(FWsServer);
  end;
  ServerUpdateStatusRun;
end;

procedure TFormWebSocket.WsServerIOHandlerSSLGetPassword(var Password: String);
begin
  Password := 'aaaa';
end;

procedure TFormWebSocket.WsServerLog(Sender: TObject; const Text: string;
  exception: exception = nil);
begin
  ServerLogCall('SERVER', Text);
end;

procedure TFormWebSocket.WsServerCanWriteEx(Sender: TObject;
  Ctx: TAmWsServerCtx_Base);
begin
  ServerChangedListClientCall(true, Ctx.Binding.PeerIP, Ctx.Binding.PeerPort);
  ServerLogCall('SERVER', 'Client CanWrite ' + Ctx.Binding.PeerIP + ':' +
    AmStr(Ctx.Binding.PeerPort));
end;

procedure TFormWebSocket.WsServerClientConnect(AContext: TIdContext);
begin
end;

procedure TFormWebSocket.WsServerClientDisconnect(AContext: TIdContext);
begin
  ServerChangedListClientCall(false, AContext.Binding.PeerIP,
    AContext.Binding.PeerPort);
  ServerLogCall('SERVER', 'Client Disconnected ' + AContext.Binding.PeerIP + ':'
    + AmStr(AContext.Binding.PeerPort));
end;

procedure TFormWebSocket.WsServerException(AContext: TIdContext;
  AException: exception);
begin
  ServerLogCall('SERVER ERROR', AException.Message);
end;

procedure TFormWebSocket.WsServerClientNewMessage(Sender: TObject;
  const AContext: TAmWsServerCtx_Base; const aText: string);
begin
  if FServerSelectPair.Cmp(AContext.Binding.PeerIP, AContext.Binding.PeerPort)
  then
    ServerLogCall('CLIENT SELECT (' + FServerSelectPair.Pair.ValuePair + ') NewMessage', aText)
  else
    ServerLogCall('CLIENT(' + FServerSelectPair.Pair.ValuePair + ') NewMessage', '');
end;

procedure TFormWebSocket.ServerLogCall(From: string; msg: string);
var
  P: IAmPostProc;
begin
  P := AmPostMsg.PostProc0New;
  P.ProcObj := ServerLogBack;
  P.ArgAdd(From);
  P.ArgAdd(msg);
  P.PostMessage;
end;

procedure TFormWebSocket.ServerLogBack(P: IAmPostCustom);
begin
  ServerLogMemo(P.Arg[0].AsString, P.Arg[1].AsString);
end;

Procedure TFormWebSocket.ServerLogMemo(From, msg: string);
begin
  P_Server_Log.Lines.Add('[' + TDateTime(now).ToString + '][' + From +'] : ' + msg);
end;

procedure TFormWebSocket.ServerChangedListClientCall(IsAdder: Boolean;
  PeerIP: string; PeerPort: Integer);
var
  P: IAmPostProc;
begin
  P := AmPostMsg.PostProc0New;
  P.ProcObj := ServerChangedListClientBack;
  P.ArgAdd(IsAdder);
  P.ArgAdd(PeerIP);
  P.ArgAdd(PeerPort);
  P.PostMessage;
end;

procedure TFormWebSocket.ServerChangedListClientBack(P: IAmPostCustom);
begin
  ServerChangedListClient(P.Arg[0].AsBoolean, P.Arg[1].AsString,
    P.Arg[2].AsInteger);
end;

procedure TFormWebSocket.ServerChangedListClient(IsAdder: Boolean;
  PeerIP: string; PeerPort: Integer);
var
  L: TStrings;
  I: Integer;
  LPeerPort: Integer;
  LPeerIP: string;
  procedure LocDelete(Index: Integer);
  begin
    if P_Server_ClientList.ItemIndex = Index then
      P_Server_ClientList.ItemCaption := '';
    L.Delete(Index);
  end;

begin

  if IsAdder then
    P_Server_ClientList.Items.Add(PeerIP + ':' + PeerPort.ToString)
  else
  begin
    L := P_Server_ClientList.Items;
    for I := L.Count - 1 downto 0 do
    begin
      if dWebSocketHelper.PairValue(L[I], LPeerIP, LPeerPort) then
      begin
        if (LPeerPort = PeerPort) and (LPeerIP = PeerIP) then
          LocDelete(I);
      end
      else
        LocDelete(I);
    end;
    P_Server_ClientList.ItemIndex := -1;
  end;
end;

procedure TFormWebSocket.ServerUpdateStatusRun;
var
  b: Boolean;
begin
  b := Assigned(FWsServer) and FWsServer.Active;
  if b then
    AmUserType.TamResource.LoadToPicture(P_Server_Run.Ico.Picture,
      'Image_Ws_Stop')
  else
    AmUserType.TamResource.LoadToPicture(P_Server_Run.Ico.Picture,
      'Image_Ws_Start');
end;

procedure TFormWebSocket.ServerUpdateRun;
begin
  if Assigned(FWsServer) and FWsServer.Active then
    WsServerDisconnect
  else
    WsServerConnect;
end;

procedure TFormWebSocket.ServerSendMessageToClient(Client: TdWsClientPair;
  Text: string);
var
  Ctx: TAmWsServerCtx_Base;
  param: TAmIoMsgParamWrite_Base;
  ReturnIsCtx: Boolean;
  ReturnSend: Boolean;
  S: string;
begin
  if not Assigned(FWsServer) or not FWsServer.Active or
    (FWsServer.ParamServer.ClassCtx = nil) or not Client.IsValid or
    (length(Text) = 0) then
  begin
    S := '';
    if not Client.IsValid then
      S := #13#10 + 'Выберите из списка подключеных клиентов' + #13#10 +
        ' клиента, которому нужно отправить сообщение.';
    AmDialog.ShowTimeOut('',
      'Сообщение не отправлено! Нет соединения или параметры назначения пусты.'
      + S, 10000);
    exit;
  end;

  ReturnIsCtx := true;
  ReturnSend := false;
  // нужно создать соответствующий класс параметров для текущего класса контекста
  param := FWsServer.ParamServer.ClassCtx.ClassReadWrite.ClassParamWrite.Create;
  param.msg_Stream := TMemoryStream.Create;
  try
    // строку в стрим
    AmStream.StrToSteam(param.msg_Stream, Text);
    param.xIsValid := true;
    param.msgSize := param.msg_Stream.Size;

    if param is TAmIoMsgParamWrite_WebSocket then
      TAmIoMsgParamWrite_WebSocket(param).CodeType := wdcText
      // указание что отправляем текст по вебсокету
    else if param is TAmIoMsgParamWrite_Crt then
    begin
      TAmIoMsgParamWrite_Crt(param).Prt.xCmd := TAmWsPrtCrt.TCmd.None;
      TAmIoMsgParamWrite_Crt(param).Prt.xRequest := TAmWsPrtCrt.TRequest.cPost;
      TAmIoMsgParamWrite_Crt(param).Prt.xData := TAmWsPrtCrt.TData.dString;
      TAmIoMsgParamWrite_Crt(param).Prt.xFile := TAmWsPrtCrt.TFile.None;
    end;

    // отправка в сокет

    FWsServer.Contexts.LockList;
    try
      Ctx := FWsServer.hpGetCxtByIpPort(Client.Ip, Client.Port);
      if not Assigned(Ctx) or not Ctx.Connected then
      begin
        ReturnIsCtx := false;
        exit(); // не нашли
      end;
      // отправляем в очередь потока write
      ReturnSend := FWsServer.SendParam(Ctx, param, true) <> 0;

      // что не ноль то уже хорошо
      // >0 отправлено в поток
      // <0 ошибка но удаление параметров будет как с потока
      // =0 напортачили с параметрами или чето не так делаете
      // еще могут быть exception они появляются когда что то очень серьезное

      // ReturnSend = false нужно удалить параметры тут же.
      // они не придут через postmessage и не удалятся сами в потоке write

    finally
      FWsServer.Contexts.UnlockList;
    end;
  finally
    if not ReturnSend then
      param.Free;
    if not ReturnIsCtx then
      showmessage('Такого клиента больше нет ' + Client.ValuePair);
  end;

end;

procedure TFormWebSocket.ClientUpdateStatusConnent;
var
  b: Boolean;
begin
  b := Assigned(FWsClient) and FWsClient.UserConnected;
  P_Client_Connect.Caption := AmIf.Bool(b, 'Отключится', 'Подключится');
end;

procedure TFormWebSocket.ClientUpdateUserConnent;
begin
  if Assigned(FWsClient) and FWsClient.UserConnected then
    WsClientDisconnect
  else
    WsClientConnect;
end;

function TFormWebSocket.ClientWasMsgGet: Boolean;
begin
  Result := AmAtomic.Getter(FWasMsgClient);
end;

procedure TFormWebSocket.ClientWasMsgSet(const Value: Boolean);
begin
  AmAtomic.Setter(FWasMsgClient, Value)
end;

procedure TFormWebSocket.WsClientConnect;
var
  AClass: TAmWsClientHttpBaseClass;
begin
  if Assigned(FWsClient) then
  begin
    if FWsClient.UserConnected then
    begin
      showmessage('Double Connect');
      exit;
    end;
  end;

  AClass := dWebSocketHelper.ClientGetClass(P_Client_Class.ItemCaption);
  if not Assigned(AClass) or (AClass = TAmWsClientHttpBase) or
    not AClass.InheritsFrom(TAmWsClientHttpBase) then
  begin
    showmessage
      ('Не выбран класс сокета класс должен быть больше TAmWsClientHttpBase');
    exit;
  end;
  FWsClient := AClass.Create(self);

  // выполняется в томже потоке что и конект  1 раз после конект  готов запускать поток чтения
  FWsClient.OnConnectedHeadAfterRead := WsClientConnectedHeadAfterRead;

  // выполняется в потоке чтения 1 раз после конект готов писать читать
  // если не срабатывает событие  OnCanWriteExThr значит сервер не отвечает на пинг при конекте
  // обычно серваки должны эт делать может соедининение плохое или прокси не знает такой протокол
  // если вы точно знаете что все норм тогда используйте обычный OnCanWriteThr без проверки сервера
  FWsClient.OnCanReadThr := WsClientCanRead;
  FWsClient.OnCanWriteExThr := WsClientCanWriteEx; // c проверкой сервера
  // FWs.OnCanWriteThr:= WSCanWriteEx;//без проверки

  FWsClient.OnLog := WsClientLog;
  FWsClient.OnDisconnected := WsClientDisconnected;
  FWsClient.OnPingCustom := WsClientPing;
  FWsClient.OnPongCustom := WsClientPong;

  // на практике эти события редко используются но они есть
  {
    begin
    FWs.OnWriteBeforeMsg:= WSWriteBeforeMsg;
    FWs.OnWriteAfterMsg:=  WSWriteAfterMsg;
    FWs.OnWriteProcessMsg:=WSWriteProcessMsg;
    end;

    begin
    FWs.OnReadBeforeMsg:= WSReadBeforeMsg;
    FWs.OnReadAfterMsg:=  WSReadAfterMsg;
    FWs.OnReadProcessMsg:= WSReadProcessMsg;
    end;
  }

  FWsClient.ReconnectIsNeed := true;
  // задаем через какое время в сек чекать соединение и переподключаться
  // смотрите  TAmWsClientHttpBaseReconnect.SupConProc что бы понять логику ReconnectCheckSeconds
  // важно выбрать такое время что  больше  частоты приема сообщений от сервера пинг эт тоже сообщение
  // если пройдено больше времени с последнего сообщения а сообщений новых нет эт один из пунктов выполнить Reconnect

  // << поставил побольше т.к не знаю к какому серверу буду подключатся. разные серверы = разная частотность пинга

  FWsClient.ReconnectCheckSeconds := 210;



  // SSL.IsSll = true тогда перед коннект создастся  наследник TIdSSLIOHandlerSocketOpenSSL  = TAmIoClientSSL
  // отредактировать его можно в событии WS.OnCreateIOHandler
  // см. TAmWsClientHttpBaseCustom.CreateIOHandler

  // sslvTLSv1,sslvTLSv1_1,sslvTLSv1_2  с другими видами шифрования лучше не работать  они ж устаревшие

  FWsClient.Ssl.SLL_1_0 := P_Client_Ssl.Checked;
  FWsClient.Ssl.SLL_1_1 := P_Client_Ssl.Checked;
  FWsClient.Ssl.SLL_1_2 := P_Client_Ssl.Checked;


  // ------------------------------------------------------------------------

  { прокси указывать не обязательно }
  FWsClient.Proxy.FormatDefault := FWsClient.Proxy.CONST_FORMAT_PROXY_2;
  FWsClient.Proxy.ProxyString := P_Client_Proxy.EditText;
  FWsClient.Proxy.Types := FWsClient.Proxy.StrToVersion('VerHttps');
  FWsClient.Proxy.TypIpVersion := FWsClient.Proxy.StrToVersionIp('IPv4');
  // -------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  // каждое сообщение (если это текст и если в классе протокола можно понять что это текст) будет проходить через буффер
  FWsClient.Buffer.setting_active := true;
  // в std1 каждое в websocket только текст
  FWsClient.Buffer.setting_is_clear_onreconect := true;
  FWsClient.Buffer.setting_rejim := wsbo_None;
  FWsClient.Buffer.OnNewMsgString := WsClientMsg;
  // посмотрите  Ws.Buffer там есть описание

  // WS.Connected имеется соединение
  // WS.UserConnected юзер хочет что бы соединение поддерживалось
  FWsClient.Connect(P_Client_Url.EditText);
  // даж если не  подключится то у нас настроен Reconnect
  ClientUpdateStatusConnent;
end;

procedure TFormWebSocket.WsClientDisconnect;
begin
  if FWsClient = nil then
    exit;

  FWsClient.Close;
  FreeAndNil(FWsClient);
  ClientUpdateStatusConnent;
end;

procedure TFormWebSocket.WsClientConnectedHeadAfterRead(Sender: TObject);
begin
  // поток чтения еще не запущен
  // параметры чтения уже созданы они одни и не удаляются до close
  // указание что не вести статистику о скорости и данных
  FWsClient.ReadWrite.bsReadParam.xStatistics.IsNeed := false;
end;

procedure TFormWebSocket.WsClientCanWriteEx(Sender: TObject);
begin
  ClientLogCall('CLIENT', false, 'CanWriteEx');
end;

procedure TFormWebSocket.WsClientCanRead(Sender: TObject);
begin
  ClientLogCall('CLIENT', false, 'CanRead');
end;

procedure TFormWebSocket.WsClientMsg(ParentClient: TAmWsClientHttpBaseUser;
  const Text: string);
begin
  ClientWasMsg := true;
  ClientLogCall('MSG EVENT', true, Text);
end;

procedure TFormWebSocket.WsClientDisconnected(Sender: TObject);
begin
  ClientLogCall('CLIENT', false, 'Disconnected');
end;

procedure TFormWebSocket.WsClientLog(Sender: TObject; const Text: string;
  exception: exception = nil);
begin
  ClientLogCall('LOG', false, Text);
end;

procedure TFormWebSocket.WsClientPing(S: TObject; str: string; int: int64);
begin
  ClientLogCall('MSG', false, 'PING ' + str);
end;

procedure TFormWebSocket.WsClientPong(S: TObject; str: string; int: int64);
begin
  ClientLogCall('MSG', false, 'PONG ' + str);
end;

procedure TFormWebSocket.ClientLogCall(From: string; IsMsg: Boolean;
  msg: string);
var
  P: IAmPostProc;
begin
  P := AmPostMsg.PostProc0New;
  P.ProcObj := ClientLogBack;
  P.ArgAdd(From);
  P.ArgAdd(IsMsg);
  P.ArgAdd(msg);
  P.PostMessage;
end;

procedure TFormWebSocket.ClientLogBack(P: IAmPostCustom);
begin
  ClientLogMemo(P.Arg[0].AsString, P.Arg[2].AsString, P.Arg[1].AsBoolean);
end;

Procedure TFormWebSocket.ClientLogMemo(From, msg: string; IsMsg: Boolean);
begin
  P_Client_Log.Lines.Add('[' + TDateTime(now).ToString + '][' + From + '] : ' + msg);
end;

procedure TFormWebSocket.ClientSendMessage(FileName: string; SourceString: string; IsPing: Boolean);
var
  param: TAmIoMsgParamWrite_Base;
  ClassParam: TAmIoMsgParamWrite_Class;
  ResponseSendMessageToThread: Integer;
begin
  param := nil;
  if FWsClient = nil then
    exit;

  ResponseSendMessageToThread := 0;
  try
    if (FileName = '') and (SourceString = '') and not IsPing then
    begin
      showmessage('Нечего отправлять');
      exit;
    end;
    if not FWsClient.Connected then
    begin
      showmessage('Нет соединения');
      exit;
    end;

    ClassParam := FWsClient.hpClassParamWrite;
    // т.к WS это ссылка на базовый класс а базовый класс не может отправлять и принемать
    // то нужно узнать класс параметров какой именно Ws мы создали
    // это действие актуально только для этой демки
    // а в реальной реализации WS будет константным классом например WebSocket
    // hpClassParamWrite функция которая должная вернуть
    // класс своего параметра на запись выше TAmIoMsgParamWrite_Base
    // см так же           TAmIoMsgParam.GetClassWrite GetClassRead virtual;
    // TAmIoMsgParamRead_Base.GetClassWrite override;
    // TAmIoMsgParamRead_WebSocket.GetClassWrite override;

    if ClassParam = nil then
    begin
      showmessage('Нет класса параметров у текушего WS');
      exit;
    end;

    param := ClassParam.Create;
    param.xIsValid := true;
    param.xIsAbort := false;
    param.xStatistics.IsNeed := false;

    // дальше установим что именно отправляем  и Type того что отправляем
    if FileName <> '' then
    begin
      // если файл оч большой и сервак не умеет работать с большой памятью то будет out of memory на сервере и дисконект клиента
      // т.к по умолчанию стрим записывается в буффер проги сервера в этом примере а не на диск
      param.msg_File := FileName;
      if param is TAmIoMsgParamWrite_WebSocket then
        TAmIoMsgParamWrite_WebSocket(param).CodeType := wdcBinary
      else if param is TAmIoMsgParamWrite_Crt then
      begin
        TAmIoMsgParamWrite_Crt(param).Prt.xCmd := TAmWsPrtCrt.TCmd.None;
        TAmIoMsgParamWrite_Crt(param).Prt.xRequest :=
          TAmWsPrtCrt.TRequest.cUpload;
        TAmIoMsgParamWrite_Crt(param).Prt.xData := TAmWsPrtCrt.TData.dFile;
        TAmIoMsgParamWrite_Crt(param).Prt.xFile := TAmWsPrtCrt.TFile.Binary;
      end;

    end
    else if IsPing then
    begin
      param.msg_Str := SourceString;
      if param.msg_Str = '' then
        param.msg_Head := true;

      if param is TAmIoMsgParamWrite_WebSocket then
        TAmIoMsgParamWrite_WebSocket(param).CodeType := wdcPing
      else if param is TAmIoMsgParamWrite_Crt then
      begin
        TAmIoMsgParamWrite_Crt(param).Prt.xCmd := TAmWsPrtCrt.TCmd.Ping;
        TAmIoMsgParamWrite_Crt(param).Prt.xRequest :=
          TAmWsPrtCrt.TRequest.cPost;
        TAmIoMsgParamWrite_Crt(param).Prt.xData := TAmWsPrtCrt.TData.dNone;
        TAmIoMsgParamWrite_Crt(param).Prt.xFile := TAmWsPrtCrt.TFile.None;
      end;
    end
    else if SourceString <> '' then
    begin
      param.msg_Str := SourceString;
      if param is TAmIoMsgParamWrite_WebSocket then
        TAmIoMsgParamWrite_WebSocket(param).CodeType := wdcText
      else if param is TAmIoMsgParamWrite_Crt then
      begin
        TAmIoMsgParamWrite_Crt(param).Prt.xCmd := TAmWsPrtCrt.TCmd.None;
        TAmIoMsgParamWrite_Crt(param).Prt.xRequest :=
          TAmWsPrtCrt.TRequest.cPost;
        TAmIoMsgParamWrite_Crt(param).Prt.xData := TAmWsPrtCrt.TData.dString;
        TAmIoMsgParamWrite_Crt(param).Prt.xFile := TAmWsPrtCrt.TFile.None;
      end;
    end;




    // если мы хотим получать события об отправке настроим куда их присылать
    //
    {
      if FormBs.P_Box_IsEventWrite.Checked then
      begin
      // создаем визуальную панель
      Panel:=TSendPanel.Create(self);
      Panel.Parent:=BoxSend;
      Panel.ButAbort.OnClick:=SendPanelButAbortClick;



      Param.xStatistics.IsNeed:=true; // хочу знать статистику отправки этого сообщ.

      // настроим параметры что бы при окончании выполнения на форму пришло postmessage сообщение
      // procedure TForm2.WS_Write_Back(var Msg:TMessage);message CONST_WS_WRITE_BACK;
      Param.UseCallBack:=true;
      Param.HandleCallBack.hwnd:=self.Handle;
      Param.HandleCallBack.message:= CONST_WS_WRITE_BACK;
      // Param.HandleCallBack.wParam  свободный параметр
      // Param.HandleCallBack.lParam  здесь будет ссылка ввиде числа на сам Param
      // и когда придет это сообщение в  WS_Write_Back нужно удалить Param

      // обмениваемся ссылками на объект парметров и Vcl
      Panel.Param:= Param;//1 - панель имеет ссылку на параметры  что бы знать что отменять если нажмем Abort
      Param.xComponent:= Panel;//2  параметры имееют ссылку на панель что бы обновлять данные в визуалке



      end;
    }

    // отпрвляем в поток
    ResponseSendMessageToThread := FWsClient.SendParam(param, true);

  finally

    if ResponseSendMessageToThread = 0 then
    begin
      // даже в лист потока не было добавлены Param поэтому сразу FreeAndNil
      if Assigned(param) then
        FreeAndNil(param);
      showmessage('Не отправлено ошибка');
    end;
  end;

end;

end.
