unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.TabControl, FMX.Layouts, FMX.Objects,find, FMX.Ani, FMX.Memo,
  FMX.ScrollBox, FMX.Controls.Presentation;

type
  TForm_main = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    GridPanelLayout1: TGridPanelLayout;
    Panel1: TPanel;
    Text1: TText;
    Panel2: TPanel;
    Text2: TText;
    Panel3: TPanel;
    Text3: TText;
    Panel4: TPanel;
    Text4: TText;
    GridPanelLayout2: TGridPanelLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button_Delete: TButton;
    GridPanelLayout3: TGridPanelLayout;
    Panel5: TPanel;
    Text5: TText;
    Panel6: TPanel;
    Text6: TText;
    Panel7: TPanel;
    Text7: TText;
    Panel8: TPanel;
    Text8: TText;
    Button_GenerateQuestion: TButton;
    Button_ShowAnswer: TButton;
    Panel_ans: TPanel;
    Text_ans: TText;
    Button_ans: TButton;
    FloatAnimation_ans: TFloatAnimation;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    StyleBook1: TStyleBook;
    Layout4: TLayout;
    CalloutPanel1: TCalloutPanel;
    Image1: TImage;
    Panel9: TPanel;
    Text9: TText;
    Text10: TText;
    Text11: TText;
    Button_vbox: TButton;
    Image_vbox: TImage;
    Text_vbox: TText;
    Button_github: TButton;
    Image_github: TImage;
    Text_github: TText;
    Button_osc: TButton;
    Image_osc: TImage;
    Text_osc: TText;
    Text13: TText;
    Text12: TText;
    procedure Button_ShowAnswerClick(Sender: TObject);
    procedure Button_GenerateQuestionClick(Sender: TObject);
    procedure NumberButtonClick(Sender: TObject);
    procedure Button_DeleteClick(Sender: TObject);
    procedure Button_ansClick(Sender: TObject);
    procedure FloatAnimation_ansFinish(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_vboxClick(Sender: TObject);
    procedure Button_githubClick(Sender: TObject);
    procedure Button_oscClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

uses

 IdURI,
{$IFDEF ANDROID}
  Androidapi.Helpers, FMX.Helpers.Android, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App, Androidapi.JNI.Net, Androidapi.JNI.JavaTypes
{$ENDIF ANDROID}

{$IFDEF MSWINDOWS}
  Winapi.ShellAPI, Winapi.Windows
{$ENDIF MSWINDOWS}

{$IFDEF IOS}
    Macapi.Helpers, iOSapi.Foundation, FMX.Helpers.iOS
{$ENDIF IOS}
    ;


var P1_n:array[1..4]of integer;
    P1_ans:string;

    p2_n:array[1..4]of integer;
    p:integer;

    p2:boolean;

{$R *.fmx}

//###############################################################################

procedure SetText(_value:integer;_Text:TText);
begin
  _Text.font.Size:=50;
  case _value of
  0:_Text.Text:='?';
  1:_Text.Text:='A';
  11:_Text.Text:='J';
  12:_Text.Text:='Q';
  13:_Text.Text:='K';
  10:begin _Text.Text:='10';_Text.font.Size:=30;end;
  else _Text.Text:=inttostr(_value);
  end;
end;

procedure showans(_ans:string);
begin
  with Form_main do
  begin
    Text_ans.Text := _ans;
    Panel_ans.Visible := True;
    TabControl1.Enabled := False;
    FloatAnimation_ans.Inverse := False;
    FloatAnimation_ans.Enabled := True;
    FloatAnimation_ans.Start;
  end;
end;


procedure OpenUrl(_url:string);
var
{$IFDEF ANDROID}
  Intent: JIntent;
{$ENDIF ANDROID}

{$IFDEF IOS}
  NSU: NSUrl;
{$ENDIF IOS}
begin
{$IFDEF MSWINDOWS}
  ShellExecute(0, 'OPEN', PChar(_url), '', '', SW_SHOWNORMAL);
{$ENDIF MSWINDOWS}

{$IFDEF IOS}
  NSU   := StrToNSUrl(TIdURI.URLEncode(_url));
  if SharedApplication.canOpenURL(NSU) then
  begin
    SharedApplication.openUrl(NSU);
  end;
{$ENDIF IOS}

{$IFDEF ANDROID}
  Intent := TJIntent.Create;
  Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
  Intent.setData(StrToJURI(_url));
  TAndroidHelper.Activity.startActivity(Intent);
{$ENDIF ANDROID}
end;
//-------------------------------------------------------------------------------

procedure TForm_main.Button_GenerateQuestionClick(Sender: TObject);
var i:integer;
begin
  repeat
    randomize;
    P1_ans := '';
    for i := 1 to 4 do P1_n[i]:=random(13)+1;
    P1_ans := find24(P1_n[1],P1_n[2],P1_n[3],P1_n[4]);
  until (P1_ans<>'');

  SetText(P1_n[1],Text5);
  SetText(P1_n[2],Text6);
  SetText(P1_n[3],Text7);
  SetText(P1_n[4],Text8);

  Button_ShowAnswer.Enabled := True;
end;

procedure TForm_main.Button_ShowAnswerClick(Sender: TObject);
begin
  showans(P1_ans);
end;

//###############################################################################

procedure TForm_main.Button_DeleteClick(Sender: TObject);
begin
  if p=1 then SetText(0,Text1);
  if p=2 then SetText(0,Text2);
  if p=3 then SetText(0,Text3);
  if p=4 then SetText(0,Text4);
  p:=p-1;
    if p=0 then Form_main.Button_Delete.Enabled:=False
      else Form_main.Button_Delete.Enabled:=True;

end;

procedure TForm_main.Button_ansClick(Sender: TObject);
begin
  TabControl1.Enabled:=true;
  FloatAnimation_ans.Inverse:=true;
  FloatAnimation_ans.Enabled:=True;
  FloatAnimation_ans.Start;
end;

procedure push(i:integer);
var text:TText;
    ans:string;
begin
  p:=p+1;
  P2_n[p]:=i;
  case P of
    1:Text := Form_main.Text1;
    2:Text := Form_main.Text2;
    3:Text := Form_main.Text3;
    4:Text := Form_main.Text4;
  end;

  SetText(P2_n[p],Text);
  text:=nil;

  if p=4 then
  begin
    ans:=find24(P2_n[1],P2_n[2],P2_n[3],P2_n[4]);
    if ans='' then ans:='нч╫Б';

    p2 := true;
    showans(ans);
  end;

  if p=0 then Form_main.Button_Delete.Enabled:=False
    else Form_main.Button_Delete.Enabled:=True;
end;

procedure TForm_main.NumberButtonClick(Sender: TObject);
begin
  push(StrToInt(Copy((Sender as TButton).Name,7,maxint)))
end;

procedure TForm_main.FloatAnimation_ansFinish(Sender: TObject);
begin
  if FloatAnimation_ans.Inverse then Panel_ans.Visible:=False;
  if p2 and FloatAnimation_ans.Inverse then
  begin
    p:=0;
    SetText(0,Text1);
    SetText(0,Text2);
    SetText(0,Text3);
    SetText(0,Text4);

    if p=0 then Form_main.Button_Delete.Enabled:=False
      else Form_main.Button_Delete.Enabled:=True;
  end;
end;

procedure TForm_main.FormCreate(Sender: TObject);
begin
  FMX.Types.GlobalDisableFocusEffect := True;
  TabControl1.Index := 0;
end;

procedure TForm_main.Button_vboxClick(Sender: TObject);
begin
  OpenUrl('http://vbox.vlabpro.com/');
end;

procedure TForm_main.Button_githubClick(Sender: TObject);
begin
  OpenUrl('https://github.com/CaviarChen/24Points');
end;

procedure TForm_main.Button_oscClick(Sender: TObject);
begin
  OpenUrl('http://git.oschina.net/CaviarChen/x24Points');
end;

end.
