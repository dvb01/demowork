unit demo.Types;

interface
uses Winapi.Windows,
     Winapi.Messages,
     System.SysUtils,
     System.Variants,
     System.Classes,
     Vcl.Controls,
     Vcl.Dialogs,
     System.Generics.Collections,
     AmControlClasses,
     AmGraphic.Controls;

   type
     TdDiagnosticEnum = (dMs,dSec);
     TdDiagnosticTime = record
      private
       FStart:Int64;
      public
       procedure Start;
       function Stop(Enum:TdDiagnosticEnum=dMs;minus:cardinal=0):string;
     end;


     TdStackPanel = class (TStack<TWinControl>)
     end;

     TDemoCollageConvectorHackHelper = class helper for TAmCollageConvector
     private
       function ArrayItemsHackGet: TArray<TAmCollageItem>;
     public
       property ArrayItemsHack: TArray<TAmCollageItem> read ArrayItemsHackGet;

     end;



implementation




{ TDemoCollageConvectorHackHelper }

function TDemoCollageConvectorHackHelper.ArrayItemsHackGet: TArray<TAmCollageItem>;
var F:TAmCollageCollection;
begin
     with self do
      F:= FItems; // хак private field TAmCollageConvector.FItems
     Result:=TArray<TAmCollageItem>(F.ListInstance.List);
end;

{ TdDiagnosticTime }

procedure TdDiagnosticTime.Start;
begin
    FStart:=GetTickCount;
end;

function TdDiagnosticTime.Stop(Enum:TdDiagnosticEnum=dMs;minus:cardinal=0): string;
begin
   FStart:=GetTickCount  -  FStart;
   if FStart>minus then
     FStart:= FStart - minus
   else
     FStart:=0;

   if Enum = dMs then
     Result:= FStart.ToString +' ms'
   else
    Result:= (FStart div 1000).ToString +' sec';

end;

end.
