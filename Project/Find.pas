unit Find;

interface
function find24(_a,_b,_c,_d:integer):string;
implementation
uses System.SysUtils;
const
  s : array[1..4] of char = ('+','-','¡Á','¡Â');
var
  a             : array[1..4] of integer;
  i,j,k,l,x,y,z : integer;
  ans:string;

function cal (m : extended; o : integer; n : extended) : extended;
begin
  case o of
    1 : cal := m+n;
    2 : cal := m-n;
    3 : cal := m*n;
    4 : if n = 0 then cal := 1e+38 else cal := m/n;
  end;
end;

function solve:boolean;
begin
  Result:=False;
  if abs((cal(cal(cal(a[i],x,a[j]),y,a[k]),z,a[l]))-24) < 0.001 then begin
   ans:='(('+inttostr(a[i])+s[x]+inttostr(a[j])+')'+s[y]+inttostr(a[k])+')'+s[z]+inttostr(a[l])+' = 24';exit(true);end;
  if abs(cal(cal(a[i],x,cal(a[j],y,a[k])),z,a[l])-24) < 0.001 then begin
   ans:='('+IntToStr(a[i])+s[x]+'('+IntToStr(a[j])+s[y]+IntToStr(a[k])+'))'+s[z]+IntToStr(a[l])+' = 24';exit(true);end;
  if abs((cal(cal(a[i],x,a[j]),y,cal(a[k],z,a[l])))-24) < 0.001 then begin
   ans:='('+IntToStr(a[i])+s[x]+IntToStr(a[j])+')'+s[y]+'('+IntToStr(a[k])+s[z]+IntToStr(a[l])+') = 24';exit(true);end;
  if abs((cal(a[i],x,cal(a[j],y,cal(a[k],z,a[l]))))-24) < 0.001 then begin
   ans:=IntToStr(a[i])+s[x]+'('+IntToStr(a[j])+s[y]+'('+IntToStr(a[k])+s[z]+IntToStr(a[l])+')) = 24';exit(true);end;
  if abs(cal(a[i],x,cal(cal(a[j],y,a[k]),z,a[l]))-24) < 0.001 then begin
   ans:=IntToStr(a[i])+s[x]+'(('+IntToStr(a[j])+s[y]+IntToStr(a[k])+')'+s[z]+IntToStr(a[l])+') = 24';exit(true);end;
end;

function find24(_a,_b,_c,_d:integer):string;
begin
  ans:='';
  a[1]:=_a;
  a[2]:=_b;
  a[3]:=_c;
  a[4]:=_d;

  Result:='';

  for i := 1 to 4 do
    for j := 1 to 4 do
      for k := 1 to 4 do
        for l := 1 to 4 do
          if [i,j,k,l] = [1..4] then
            for x := 1 to 4 do
              for y := 1 to 4 do
                for z := 1 to 4 do if solve then
                begin
                  ans:=StringReplace (ans, '11', 'J', [rfReplaceAll]);
                  ans:=StringReplace (ans, '12', 'Q', [rfReplaceAll]);
                  ans:=StringReplace (ans, '13', 'K', [rfReplaceAll]);
                  ans:=StringReplace (ans, '1', 'A', [rfReplaceAll]);
                  ans:=StringReplace (ans, 'A0', '10', [rfReplaceAll]); //ÐÞ¸´
                  Exit(ans);
                end;
end;

end.
