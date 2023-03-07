unit demo.Consts;

interface
uses
  Classes;




 const
  SCRIPT_API_VK_DEFAULT =
  '  uses '+#13#10+
  '  // Windows, Messages, SysUtils, Variants, Classes, Graphics, '+#13#10+
  '  //Controls,Forms,StdCtrls, '+#13#10+
  '  Dialogs, '+#13#10+
  '  //math, '+#13#10+
  '  //AmSystemBase,AmSystemObject, AmHttp, '+#13#10+
  '  //AmList, AmUserType, '+#13#10+
  '  AmListRtti,' +#13#10+
  '  AmVk.Api.Base, '+#13#10+
  '  AmVk.Api.ObjVk, '+#13#10+
  '  //AmVk.Api.EnumTypes, '+#13#10+
  '  AmVk.Api.ObjResponse, '+#13#10+
  '  AmVk.Api.Cmd, '+#13#10+
  '  uAmVkHttp; '+#13#10+
  ' '+#13#10+
  '    // напишите свой код и запустите его что бы попробовать api vk '+#13#10+
  '    // с помошью popup формы подсказки кода можно погулять по объектам '+#13#10+
  '    // если не видны типы то подключите модули '+#13#10+
  '    // VkHttp переменная для доспупа к vk '+#13#10+
  '    // VkHttp.Api для доступа vkapi по токену '+#13#10+
  '    // VkHttp создавать и удалять не нужно переменная сюда вынесена с внешней проги. '+#13#10+
  '    // Если текуший компилятор будет выделять память под большие строки то при очистке он не сможет их освободить '+#13#10+
  '    //а при закрытии главной программы будет сообщение об утечке памяти' +#13#10+
  ' '+#13#10+
  '   type '+#13#10+
  '     PAmVkApi_Obj_user   =  ^TAmVkApi_Obj_user; '+#13#10+
  ' '+#13#10+
  ' '+#13#10+
  ' '+#13#10+
  '   function UserToString(User:PAmVkApi_Obj_user):string; '+#13#10+
  '   begin '+#13#10+
  '     if User <> nil then '+#13#10+
  '        Result:= User.first_name +'' ''+User.last_name +'' : ''+User.bdate.ToString '+#13#10+
  '     else Result:=''Ответ от вк не получен!''; '+#13#10+
  '   end; '+#13#10+
  ' '+#13#10+
  ' '+#13#10+
  '   function GetUserWay1(IdVk:Int64):string; '+#13#10+
  '   var '+#13#10+
  '       Items:Pointer; '+#13#10+
  '       User:PAmVkApi_Obj_user; '+#13#10+
  '   begin '+#13#10+
  '       User:=nil; '+#13#10+
  '       VkHttp.Api.Users.P_get.Init; '+#13#10+
  '       if IdVk > 0  then '+#13#10+
  '       VkHttp.Api.Users.P_get.user_ids:= IdVk.ToString; '+#13#10+
  '       VkHttp.Api.Users.P_get.fields:=''bdate''; '+#13#10+
  '       VkHttp.Api.Users.M_get; '+#13#10+
  ' '+#13#10+
  '       if VkHttp.Api.Users.R_get.IsGood then '+#13#10+
  '       begin '+#13#10+
  ' '+#13#10+
  '         // компилятор с дженериками плохо ладит поэтому доспуп к листу '+#13#10+
  '         // нужно делать через прокладку  AmListVarRtti '+#13#10+
  '         Items:=@VkHttp.Api.Users.R_get.Response.users.List; '+#13#10+
  '         if AmListVarRtti.Count(Items) > 0 then '+#13#10+
  '            User := PAmVkApi_Obj_user(AmListVarRtti.Get(Items,0)); '+#13#10+
  '       end; '+#13#10+
  '       Result:= UserToString(User); '+#13#10+
  '   end; '+#13#10+
  ' '+#13#10+
  '   function GetUserWay2(IdVk:Int64):string; '+#13#10+
  '   var '+#13#10+
  '      User:PAmVkApi_Obj_user; '+#13#10+
  '   begin '+#13#10+
  '     User:=VkHttp.Api_User_Get(IdVk,''bdate''); '+#13#10+
  '     Result:=UserToString(User); '+#13#10+
  '   end; '+#13#10+
  ' '+#13#10+
  'begin '+#13#10+
  ' '+#13#10+
  ' '+#13#10+
  ' '+#13#10+
  '    //VkHttp.Api.token:=''''; '+#13#10+
  ' '+#13#10+
  '    if VkHttp.Api.token = '''' then '+#13#10+
  '    begin '+#13#10+
  '     Showmessage(''Токен не указан''); '+#13#10+
  '     exit; '+#13#10+
  '    end; '+#13#10+
  ' '+#13#10+
  '    Showmessage(GetUserWay1(0)); '+#13#10+
  'end. ';


implementation

end.
