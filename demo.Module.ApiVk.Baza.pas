unit demo.Module.ApiVk.Baza;

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
  TdModuleApiVkBazaSetting = class (TJsonBazaObjCustom)
  private
    function IsInitGet: boolean;
    procedure IsInitSet(const Value: boolean);
    function TextCodeAutoSaveGet: boolean;
    procedure TextCodeAutoSaveSet(const Value: boolean);
    function TextCodeGet: string;
    procedure TextCodeSet(const Value: string);
    function TextCodeWasDefaultSetterGet: boolean;
    procedure TextCodeWasDefaultSetterSet(const Value: boolean);
    function TokenApiVkGet: string;
    procedure TokenApiVkSet(const Value: string);
    function HideFormResponseGet: boolean;
    procedure HideFormResponseSet(const Value: boolean);
  public
    property IsInit: boolean read IsInitGet write IsInitSet;
    property TextCodeWasDefaultSetter: boolean read TextCodeWasDefaultSetterGet write TextCodeWasDefaultSetterSet;
    property TextCode: string read TextCodeGet write TextCodeSet;
    property TokenApiVk: string read TokenApiVkGet write TokenApiVkSet;
    property TextCodeAutoSave: boolean read TextCodeAutoSaveGet write TextCodeAutoSaveSet;
    property HideFormResponse: boolean read HideFormResponseGet write HideFormResponseSet;
    constructor Create(AObj:TJsonObject);
    destructor  Destroy;Override;
  end;


implementation

{ TdModuleApiVkBazaSetting }

constructor TdModuleApiVkBazaSetting.Create(AObj: TJsonObject);
begin
   inherited;
end;

destructor TdModuleApiVkBazaSetting.Destroy;
begin

  inherited;
end;

function TdModuleApiVkBazaSetting.HideFormResponseGet: boolean;
begin
    Result:= self.ObjGetB('HideFormResponse');
end;

procedure TdModuleApiVkBazaSetting.HideFormResponseSet(const Value: boolean);
begin
    ObjSetB('HideFormResponse',Value);
end;

function TdModuleApiVkBazaSetting.IsInitGet: boolean;
begin
   Result:= self.ObjGetB('IsInit');
end;

procedure TdModuleApiVkBazaSetting.IsInitSet(const Value: boolean);
begin
   ObjSetB('IsInit',Value);
end;

function TdModuleApiVkBazaSetting.TextCodeAutoSaveGet: boolean;
begin
   Result:= self.ObjGetB('TextCodeAutoSave');
end;

procedure TdModuleApiVkBazaSetting.TextCodeAutoSaveSet(const Value: boolean);
begin
   ObjSetB('TextCodeAutoSave',Value);
end;

function TdModuleApiVkBazaSetting.TextCodeGet: string;
begin
   Result:= self.ObjGetStr('TextCode');
end;

procedure TdModuleApiVkBazaSetting.TextCodeSet(const Value: string);
begin
   ObjSetStr('TextCode',Value);
end;

function TdModuleApiVkBazaSetting.TextCodeWasDefaultSetterGet: boolean;
begin
  Result:= self.ObjGetB('TextCodeWasDefaultSetter');
end;

procedure TdModuleApiVkBazaSetting.TextCodeWasDefaultSetterSet(
  const Value: boolean);
begin
   ObjSetB('TextCodeWasDefaultSetter',Value);
end;

function TdModuleApiVkBazaSetting.TokenApiVkGet: string;
//var S:string;
begin
   Result:= self.ObjGetStr('TokenApiVk');
   //if Result<>'' then  S:=Result;TAmCrtResourceData.DecodeWithClassCrt_String(S,Result);
end;

procedure TdModuleApiVkBazaSetting.TokenApiVkSet(const Value: string);
//var S:string;
begin
   //if Value <> '' then S:=Value; TAmCrtResourceData.EncodeWithClassCrt_String(Value,S); Value:=S;
   self.ObjSetStr('TokenApiVk',Value);
end;

end.
