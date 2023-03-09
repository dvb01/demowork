unit demo.FormHideControls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, AmEdit, AmCheckBox,
  AmButton, Vcl.StdCtrls, AmMemo, ES.BaseControls, ES.Layouts, AmLayBase,
  AmPanel;

type
  TFormHideControls = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ViewRecordResponse: TTreeView;
    TabSheet3: TTabSheet;
    P_WebSocket: TAmPanel;
    Label6: TLabel;
    Label7: TLabel;
    AmLayout6: TAmLayout;
    AmLayout8: TAmLayout;
    AmMemo1: TAmMemo;
    AmLayout9: TAmLayout;
    AmLayout10: TAmLayout;
    AmLayout11: TAmLayout;
    AmButton9: TAmButton;
    AmButton10: TAmButton;
    AmButton11: TAmButton;
    AmButton12: TAmButton;
    P_WebSocket_Back: TAmButton;
    AmLayout12: TAmLayout;
    Label8: TLabel;
    AmCheckBox1: TAmCheckBox;
    AmEdit1: TAmEdit;
    AmCheckBox2: TAmCheckBox;
    P_PanelSimpleExample: TAmPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHideControls: TFormHideControls;

implementation

{$R *.dfm}

end.
