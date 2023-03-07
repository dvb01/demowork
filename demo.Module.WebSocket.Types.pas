unit demo.Module.WebSocket.Types;

interface
   uses
     Classes,SysUtils,
     AmSystemBase,
     AmSystemObject,
     AmUserType,
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
     AmWs.Server.Dos;

 const
   LIST_CLASS_WEBSOCKET_CLIENT : array[0..2] of TAmWsClientHttpBaseClass =
                     (TAmWsClientHttpStd1,TAmWsClientHttpWebSocket,TAmWsClientHttpCrt);
   LIST_CLASS_WEBSOCKET_SERVER : array[0..2] of TAmWsServerCtx_Class =
                     (TAmWsServerCtx_Std1,TAmWsServerCtx_WebSocket,TAmWsServerCtx_Crt);
  type
   dWebSocketHelper = class
     class procedure ClassClientToList(L:TStrings;NeedSetObject:boolean);
     class procedure ClassServerToList (L:TStrings;NeedSetObject:boolean);
     class function  ClientGetClass(ValueClassName:string):TAmWsClientHttpBaseClass; overload;
     class function  ClientGetClass(ValueClass:Pointer):TAmWsClientHttpBaseClass; overload;
     class function  ServerGetClass(ValueClassName:string):TAmWsServerCtx_Class;overload;
     class function  ServerGetClass(ValueClass:Pointer):TAmWsServerCtx_Class; overload;
     class function  PairValue(Value:string; var  Ip: string; var  Port:integer):boolean;
   end;

   TdWsClientPair  = record
  private
    function ValuePairGet: string;
    procedure ValuePairSet(const Value: string);
    function IsValidGet: boolean;
     public
      Ip:string;
      Port:integer;
      function Cmp(AIp:string;APort:integer):boolean;overload;
      function Cmp(Source:TdWsClientPair):boolean;overload;
      property ValuePair: string read ValuePairGet write ValuePairSet;
      procedure Clear;
      property IsValid: boolean read IsValidGet;
   end;
   TdWsClientPairCs = class (TAmObjectCs)
    private
     FPair: TdWsClientPair;
     function PairGet: TdWsClientPair;
    public
     function Cmp(AIp:string;APort:integer):boolean;overload;
     function Cmp(Source:TdWsClientPair):boolean;overload;
     procedure NewPairSetter(ValuePair:string);overload;
     procedure NewPairSetter(APair:TdWsClientPair);overload;
     property Pair: TdWsClientPair read PairGet;
     constructor Create;
   end;

implementation

{ dWebSocketHelper }

class procedure dWebSocketHelper.ClassClientToList(L: TStrings;NeedSetObject:boolean);
var
  I: Integer;
begin
  L.BeginUpdate;
  try
    L.Clear;
    for I := 0 to length(LIST_CLASS_WEBSOCKET_CLIENT)-1 do
    if NeedSetObject then
    L.AddObject(LIST_CLASS_WEBSOCKET_CLIENT[i].ClassName,TObject(LIST_CLASS_WEBSOCKET_CLIENT[i]))
    else L.AddObject(LIST_CLASS_WEBSOCKET_CLIENT[i].ClassName,nil);
  finally
    L.EndUpdate;
  end;
end;

class procedure dWebSocketHelper.ClassServerToList(L: TStrings;NeedSetObject:boolean);
var
  i: Integer;
begin
  L.BeginUpdate;
  try
     L.Clear;
    for I := 0 to length(LIST_CLASS_WEBSOCKET_SERVER)-1 do
    if NeedSetObject then
    L.AddObject(LIST_CLASS_WEBSOCKET_SERVER[i].ClassName,TObject(LIST_CLASS_WEBSOCKET_SERVER[i]))
    else L.AddObject(LIST_CLASS_WEBSOCKET_SERVER[i].ClassName,nil);
  finally
    L.EndUpdate;
  end;
end;

class function dWebSocketHelper.ClientGetClass(ValueClassName:string):TAmWsClientHttpBaseClass;
var i:integer;
begin
    Result:=nil;
   if (ValueClassName = '') then
     exit;
    ValueClassName:=  LowerCase(ValueClassName);
    for I := 0 to length(LIST_CLASS_WEBSOCKET_CLIENT)-1 do
    if ValueClassName = LowerCase(LIST_CLASS_WEBSOCKET_CLIENT[i].ClassName) then
      exit(LIST_CLASS_WEBSOCKET_CLIENT[i]);
end;

class function  dWebSocketHelper.ClientGetClass(ValueClass:Pointer):TAmWsClientHttpBaseClass;
var i:integer;
begin
    Result:=nil;
    if (ValueClass = nil) then
     exit;
    for I := 0 to length(LIST_CLASS_WEBSOCKET_CLIENT)-1 do
    if ValueClass = LIST_CLASS_WEBSOCKET_CLIENT[i] then
      exit(LIST_CLASS_WEBSOCKET_CLIENT[i]);


    if  AmSys.InternalIsValidClass(ValueClass)
    and TClass(ValueClass).InheritsFrom(TAmWsClientHttpBase)  then
      Result:=TAmWsClientHttpBaseClass(ValueClass);
end;

class function dWebSocketHelper.PairValue(Value: string; var  Ip: string; var  Port: integer): boolean;
var A:TArray<string>;
begin
    Port:=0;
    Ip:='';
    Result:=false;
    if Pos(':', Value) <> 0 then
    begin
       A:=  Value.Split([':']);
       Port:= AmInt(A[1],0);
       if Port<=0 then
       begin
         Port:=0;
        exit;
       end;
       Result:= AmReg.GetValue('\d{2,3}\.\d{1,3}\.\d{1,3}',A[0]) <> '';
       if Result  then
        Ip:= A[0];
       if not Result then
       Port:=0;
    end;
end;

class function  dWebSocketHelper.ServerGetClass(ValueClass:Pointer):TAmWsServerCtx_Class;
var i:integer;
begin
  Result:= nil;
  if (ValueClass = nil) then
     exit;

  for I := 0 to length(LIST_CLASS_WEBSOCKET_SERVER)-1 do
  if ValueClass = LIST_CLASS_WEBSOCKET_SERVER[i] then
    exit(LIST_CLASS_WEBSOCKET_SERVER[i]);


  if AmSys.InternalIsValidClass(ValueClass)
  and TClass(ValueClass).InheritsFrom(TAmWsServerCtx_Base)  then
    Result:=TAmWsServerCtx_Class(ValueClass);
end;

class function dWebSocketHelper.ServerGetClass(ValueClassName:string):TAmWsServerCtx_Class;
var i:integer;
begin
  Result:=nil;
  if (ValueClassName = '') then
     exit;
  ValueClassName:=LowerCase(ValueClassName);
  for I := 0 to length(LIST_CLASS_WEBSOCKET_SERVER)-1 do
  if ValueClassName = LowerCase(LIST_CLASS_WEBSOCKET_SERVER[i].ClassName) then
    exit(LIST_CLASS_WEBSOCKET_SERVER[i]);
end;

{ TdWsClientPairCs }

constructor TdWsClientPairCs.Create;
begin
 inherited;
 FPair.Clear;
end;


function TdWsClientPairCs.Cmp(Source: TdWsClientPair): boolean;
begin
  Lock;
  try
    Result:= FPair.Cmp(Source);
  finally
   UnLock;
  end;
end;

function TdWsClientPairCs.Cmp(AIp: string; APort: integer): boolean;
begin
  Lock;
  try
    Result:= FPair.Cmp(AIp,APort);
  finally
   UnLock;
  end;
end;


procedure TdWsClientPairCs.NewPairSetter(ValuePair: string);
begin
  Lock;
  try
    FPair.ValuePairSet(ValuePair);
  finally
   UnLock;
  end;
end;

procedure TdWsClientPairCs.NewPairSetter(APair: TdWsClientPair);
begin
  Lock;
  try
    FPair := APair;
  finally
   UnLock;
  end;
end;

function TdWsClientPairCs.PairGet: TdWsClientPair;
begin
  Lock;
  try
    Result:=FPair;
    // Result.Ip:= FPair.Ip;
    // Result.Port:= FPair.Port;
  finally
   UnLock;
  end;
end;

{ TdWsClientPair }

procedure TdWsClientPair.Clear;
begin
   AmRecordHlp.RecFinal(self);
end;

function TdWsClientPair.Cmp(AIp: string; APort: integer): boolean;
begin
   Result:= (APort = Port) and (AIp = Ip);
end;

function TdWsClientPair.Cmp(Source: TdWsClientPair): boolean;
begin
   Result:= Cmp(Source.Ip,Source.Port);
end;

function TdWsClientPair.IsValidGet: boolean;
begin
   Result:= ValuePair <>'';
end;

function TdWsClientPair.ValuePairGet: string;
var AIp:string;
    APort:integer;
begin
   Result:=  Ip+':'+Port.tostring;
   if not dWebSocketHelper.PairValue(Result,AIp,APort) then
     Result:='';
end;

procedure TdWsClientPair.ValuePairSet(const Value: string);
begin
   dWebSocketHelper.PairValue(Value,Ip,Port);
end;

end.
