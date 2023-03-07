unit demo.Module.WebSocket.Baza;

interface
uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  JsonDataObjects,
  AmSystemBase,
  AmSystemObject,
  AmUserType,
  AmList,
  AmJsonBaza,
  AmCrypto.ResourceData;

  type
  TdModuleWebSocketClientSetting = class (TJsonBazaObjCustom)
  private
    function ProxyGet: string;
    procedure ProxySet(const Value: string);
    function SocketClassGet: string;
    procedure SocketClassSet(const Value: string);
    function SslGet: boolean;
    procedure SslSet(const Value: boolean);
    function TextMsgGet: string;
    procedure TextMsgSet(const Value: string);
    function UrlGet: string;
    procedure UrlSet(const Value: string);
  public
    property SocketClass: string read SocketClassGet write SocketClassSet;
    property Url: string read UrlGet write UrlSet;
    property Proxy: string read ProxyGet write ProxySet;
    property Ssl: boolean read SslGet write SslSet;
    property TextMsg: string read TextMsgGet write TextMsgSet;
    constructor Create(AObj:TJsonObject);
    destructor  Destroy;Override;
  end;

  TdModuleWebSocketServerSetting = class (TJsonBazaObjCustom)
  private
    function PortGet: integer;
    procedure PortSet(const Value: integer);
    function SocketClassGet: string;
    procedure SocketClassSet(const Value: string);
    function SslGet: boolean;
    procedure SslSet(const Value: boolean);
  public
    property SocketClass: string read SocketClassGet write SocketClassSet;
    property Port: integer read PortGet write PortSet;
    property Ssl: boolean read SslGet write SslSet;
    constructor Create(AObj:TJsonObject);
    destructor  Destroy;Override;
  end;
implementation

{ TdModuleWebSocketSetting }

constructor TdModuleWebSocketClientSetting.Create(AObj: TJsonObject);
begin
 inherited;
end;

destructor TdModuleWebSocketClientSetting.Destroy;
begin
  inherited;
end;

function TdModuleWebSocketClientSetting.ProxyGet: string;
begin
   Result:=self.ObjGetStr('Proxy');
end;

procedure TdModuleWebSocketClientSetting.ProxySet(const Value: string);
begin
  self.ObjSetStr('Proxy',Value);
end;

function TdModuleWebSocketClientSetting.SocketClassGet: string;
begin
   Result:=self.ObjGetStr('SocketClass');
end;

procedure TdModuleWebSocketClientSetting.SocketClassSet(const Value: string);
begin
   self.ObjSetStr('SocketClass',Value);
end;

function TdModuleWebSocketClientSetting.SslGet: boolean;
begin
  Result:=self.ObjGetB('Ssl');
end;

procedure TdModuleWebSocketClientSetting.SslSet(const Value: boolean);
begin
 self.ObjSetB('Ssl',Value);
end;

function TdModuleWebSocketClientSetting.TextMsgGet: string;
begin
   Result:=self.ObjGetStr('TextMsg');
end;

procedure TdModuleWebSocketClientSetting.TextMsgSet(const Value: string);
begin
   self.ObjSetStr('TextMsg',Value);
end;

function TdModuleWebSocketClientSetting.UrlGet: string;
begin
   Result:=self.ObjGetStr('Url');
end;

procedure TdModuleWebSocketClientSetting.UrlSet(const Value: string);
begin
   self.ObjSetStr('Url',Value);
end;

{ TdModuleWebSocketServerSetting }

constructor TdModuleWebSocketServerSetting.Create(AObj: TJsonObject);
begin
   inherited;
end;

destructor TdModuleWebSocketServerSetting.Destroy;
begin

  inherited;
end;

function TdModuleWebSocketServerSetting.PortGet: integer;
begin
   Result:=self.ObjGetInt('Port');
   if Result = 0 then
    Result:=5756;
end;

procedure TdModuleWebSocketServerSetting.PortSet(const Value: integer);
begin
  self.ObjSetInt('Port',Value);
end;

function TdModuleWebSocketServerSetting.SocketClassGet: string;
begin
   Result:=self.ObjGetStr('SocketClass');
end;

procedure TdModuleWebSocketServerSetting.SocketClassSet(const Value: string);
begin
  self.ObjSetStr('SocketClass',Value);
end;

function TdModuleWebSocketServerSetting.SslGet: boolean;
begin
  Result:=self.ObjGetB('Ssl');
end;

procedure TdModuleWebSocketServerSetting.SslSet(const Value: boolean);
begin
  self.ObjSetB('Ssl',Value);
end;

end.
