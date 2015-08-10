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
    Button16: TButton;
    GridPanelLayout3: TGridPanelLayout;
    Panel5: TPanel;
    Text5: TText;
    Panel6: TPanel;
    Text6: TText;
    Panel7: TPanel;
    Text7: TText;
    Panel8: TPanel;
    Text8: TText;
    Button14: TButton;
    Button15: TButton;
    Panel_ans: TPanel;
    Text_ans: TText;
    Button_ans: TButton;
    FloatAnimation_ans: TFloatAnimation;
    StyleBook1: TStyleBook;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    procedure Button15Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button_ansClick(Sender: TObject);
    procedure FloatAnimation_ansFinish(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

var P1_n:array[1..4]of integer;
    P1_ans:string;

    p2_n:array[1..4]of integer;
    p:integer;

    p2:boolean;

{$R *.fmx}

//###############################################################################

procedure showans(_ans:string);
begin
  with Form_main do
  begin
    Text_ans.Text:=P1_ans;
    Panel_ans.Visible:=True;
    TabControl1.Enabled:=False;
    FloatAnimation_ans.Inverse:=False;
    FloatAnimation_ans.Enabled:=True;
    FloatAnimation_ans.Start;
  end;
end;

procedure TForm_main.Button14Click(Sender: TObject);
var i:integer;
begin
  repeat
    randomize;
    P1_ans:='';
    for i:=1 to 4 do P1_n[i]:=random(13)+1;
    P1_ans:=find24(P1_n[1],P1_n[2],P1_n[3],P1_n[4]);
  until (P1_ans<>'');

  Text5.font.Size:=50;
  case P1_n[1] of
  1:Text5.Text:='A';
  11:Text5.Text:='J';
  12:Text5.Text:='Q';
  13:Text5.Text:='K';
  10:begin Text5.Text:='10';Text5.font.Size:=30;end;
  else Text5.Text:=inttostr(P1_n[1]);
  end;

  Text6.font.Size:=50;
  case P1_n[2] of
  1:Text6.Text:='A';
  11:Text6.Text:='J';
  12:Text6.Text:='Q';
  13:Text6.Text:='K';
  10:begin Text6.Text:='10';Text6.font.Size:=30;end;
  else Text6.Text:=inttostr(P1_n[2]);
  end;

  Text7.font.Size:=50;
  case P1_n[3] of
  1:Text7.Text:='A';
  11:Text7.Text:='J';
  12:Text7.Text:='Q';
  13:Text7.Text:='K';
  10:begin Text7.Text:='10';Text7.font.Size:=30;end;
  else Text7.Text:=inttostr(P1_n[3]);
  end;

  Text8.font.Size:=50;
  case P1_n[4] of
  1:Text8.Text:='A';
  11:Text8.Text:='J';
  12:Text8.Text:='Q';
  13:Text8.Text:='K';
  10:begin Text8.Text:='10';Text8.font.Size:=30;end;
  else Text8.Text:=inttostr(P1_n[4]);
  end;

  Button15.Enabled:=True;
end;

procedure TForm_main.Button15Click(Sender: TObject);
begin

end;

//###############################################################################

procedure TForm_main.Button16Click(Sender: TObject);
begin
  if p=1 then begin Text1.font.Size:=50;Text1.Text:='?'; end;
  if p=2 then begin Text2.font.Size:=50;Text2.Text:='?'; end;
  if p=3 then begin Text3.font.Size:=50;Text3.Text:='?'; end;
  if p=4 then begin Text4.font.Size:=50;Text4.Text:='?'; end;
  p:=p-1;
    if p=0 then Form_main.Button16.Enabled:=False
      else Form_main.Button16.Enabled:=True;

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
    1:Text:=Form_main.Text1;
    2:Text:=Form_main.Text2;
    3:Text:=Form_main.Text3;
    4:Text:=Form_main.Text4;
    end;



    Text.font.Size:=50;
    case P2_n[p] of
    1:Text.Text:='A';
    11:Text.Text:='J';
    12:Text.Text:='Q';
    13:Text.Text:='K';
    10:begin Text.Text:='10';text.font.Size:=30;end;
    else Text.Text:=inttostr(P2_n[p]);
    end;

    text:=nil;
    if p=4 then
      begin
        ans:=find24(P2_n[1],P2_n[2],P2_n[3],P2_n[4]);
        if ans='' then ans:='нч╫Б';

        p2:=true;

        showans(ans);


      end;

    if p=0 then Form_main.Button16.Enabled:=False
      else Form_main.Button16.Enabled:=True;



end;

procedure TForm_main.Button1Click(Sender: TObject);
begin
  push(1)
end;

procedure TForm_main.Button2Click(Sender: TObject);
begin
  push(2)
end;

procedure TForm_main.Button3Click(Sender: TObject);
begin
  push(3)
end;

procedure TForm_main.Button4Click(Sender: TObject);
begin
  push(4)
end;

procedure TForm_main.Button5Click(Sender: TObject);
begin
  push(5)
end;

procedure TForm_main.Button6Click(Sender: TObject);
begin
  push(6)
end;

procedure TForm_main.Button7Click(Sender: TObject);
begin
  push(7)
end;

procedure TForm_main.Button8Click(Sender: TObject);
begin
  push(8)
end;

procedure TForm_main.Button9Click(Sender: TObject);
begin
  push(9)
end;

procedure TForm_main.FloatAnimation_ansFinish(Sender: TObject);
begin
  if FloatAnimation_ans.Inverse then Panel_ans.Visible:=False;
  if p2 and FloatAnimation_ans.Inverse then
  begin
        p:=0;
        Form_main.Text1.font.Size:=50;
        Form_main.Text1.Text:='?';
        Form_main.Text2.font.Size:=50;
        Form_main.Text2.Text:='?';
        Form_main.Text3.font.Size:=50;
        Form_main.Text3.Text:='?';
        Form_main.Text4.font.Size:=50;
        Form_main.Text4.Text:='?';
    if p=0 then Form_main.Button16.Enabled:=False
      else Form_main.Button16.Enabled:=True;
  end;
end;

procedure TForm_main.Button10Click(Sender: TObject);
begin
  push(10)
end;

procedure TForm_main.Button11Click(Sender: TObject);
begin
  push(11)
end;

procedure TForm_main.Button12Click(Sender: TObject);
begin
  push(12)
end;

procedure TForm_main.Button13Click(Sender: TObject);
begin
  push(13)
end;

end.
