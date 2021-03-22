unit UnitT8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, Grids, Spin;

type
  TArr = array of array of integer;
  TMainForm = class(TForm)
    Open: TOpenDialog;
    Save: TSaveDialog;
    Menu: TMainMenu;
    Fail: TMenuItem;
    Prog: TMenuItem;
    Comp: TMenuItem;
    Openn: TMenuItem;
    Savee: TMenuItem;
    SaveAs: TMenuItem;
    Exitt: TMenuItem;
    ClearWin: TMenuItem;
    HelpMe: TMenuItem;
    Grid: TStringGrid;
    Str: TLabel;
    Stb: TLabel;
    StrE: TSpinEdit;
    StbE: TSpinEdit;
    procedure ExittClick(Sender: TObject);
    procedure OpennClick(Sender: TObject);
    procedure SaveeClick(Sender: TObject);
    procedure SaveAsClick(Sender: TObject);
    procedure ClearWinClick(Sender: TObject);
    procedure HelpMeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure StrEChange(Sender: TObject);
    procedure StbEChange(Sender: TObject);
    procedure CompClick(Sender: TObject);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Arr: TArr;
  m,n: integer; {m- строки, n- столбцы}

implementation

uses UnitOut; {Модальная форма для ответа}

{$R *.dfm}

procedure TMainForm.ExittClick(Sender: TObject);
  begin
    Close;
  end; {ExittClick}

procedure TMainForm.OpennClick(Sender: TObject);
var
  TF: TextFile;
  i,j: integer;
begin
  if not Grid.Visible
    then ShowMessage('Ошибка. Задайте размер матрицы')
    else
      if Open.Execute
        then
          begin
            AssignFile(TF,Open.FileName);
            Reset(TF);
            for i:=0 to m-1 do
              begin
                for j:=0 to n-1 do
                  begin
                    read(TF,Arr[i,j]);
                    Grid.Cells[j,i]:=IntToStr(Arr[i,j]);
                  end; {for j}
                readln(TF);
              end; {for i}
            CloseFile(TF);
          end {if Open}
  end; {OpennClick}

procedure TMainForm.SaveAsClick(Sender: TObject);
  var
    TF: TextFile;
    i,j: integer;
  begin
    if not Grid.Visible
      then ShowMessage('Ошибка. Нечего сохранять')
      else
        if Save.Execute
          then
            begin
              AssignFile(TF,Save.FileName);
              Rewrite(TF);
              for i:=0 to m-1 do
                begin
                  for j:=0 to n-1 do
                    if Grid.Cells[j,i]=''
                      then write(TF,0,' ')
                      else write(TF,Grid.Cells[j,i],' ');
                  writeln(TF);
                end; {for i}
              CloseFile(TF);
            end; {if Save}
  end; {SaveAsClick}

procedure TMainForm.SaveeClick(Sender: TObject);
  var
    TF: TextFile;
    i,j: integer;
  begin
    if not Grid.Visible
      then ShowMessage('Ошибка. Нечего сохранять')
      else
        if Open.FileName=''
          then SaveAsClick(Sender)
          else
            begin
              AssignFile(TF,Open.FileName);
              Rewrite(TF);
              for i:=0 to m-1 do
                begin
                  for j:=0 to n-1 do
                    if Grid.Cells[j,i]=''
                      then write(TF,0,' ')
                      else write(TF,Grid.Cells[j,i],' ');
                  writeln(TF);
                end; {for i}
              CloseFile(TF);
            end; {if Open}
  end; {SaveeClick}

procedure TMainForm.ClearWinClick(Sender: TObject);
  var
    i,j: integer;
  begin
    for i:=0 to m-1 do
      for j:=0 to n-1 do
        Grid.Cells[j,i]:='';
  end; {ClearWinClick}

procedure TMainForm.HelpMeClick(Sender: TObject);
  begin
    ShowMessage('Задана матрица m x n. Исключить из неё одинаковые строки');
  end; {HelpMeClick}

procedure TMainForm.FormActivate(Sender: TObject);
  begin
    m:=1;
    n:=1;
    SetLength(Arr,m,n);
  end; {FormActivate}

procedure TMainForm.StrEChange(Sender: TObject);
  begin
    m:=StrE.Value;
    Grid.RowCount:=m;
    SetLength(Arr,m,n);
    Grid.Height:=25*m+1;
    Grid.Visible:=true;
  end; {StrEChange}

procedure TMainForm.StbEChange(Sender: TObject);
  begin
    n:=StbE.Value;
    Grid.ColCount:=n;
    SetLength(Arr,m,n);
    Grid.Width:=65*n+1;
    Grid.Visible:=true;
  end; {StbEChange}

procedure ArrToGrid(var Arr:TArr; var Grid:TStringGrid; var m,n:integer);
  var
    i,j:integer;
  begin
    Grid.RowCount:=m;
    Grid.ColCount:=n;
    Grid.Width:=65*n+1;
    Grid.Height:=25*m+1;
    for i:=0 to m-1 do
      for j:=0 to n-1 do
        Grid.Cells[j,i]:=IntToStr(Arr[i,j]);
  end; {ArrToGrid}

procedure GridToArr(var Arr:TArr; var Grid:TStringGrid; var m,n:integer);
  var
    i,j:integer;
  begin
    SetLength(Arr,m,n);
    for i:=0 to m-1 do
      for j:=0 to n-1 do
        if Grid.Cells[j,i]=''
          then Arr[i,j]:=0
          else Arr[i,j]:=StrToInt(Grid.Cells[j,i]);
  end; {GridToArr}

{Функция Compare сравнивает строки Str1 и Str2 матрицы Arr}
function Compare (var Str1,Str2: array of integer; var n: integer): boolean;
  var
    j: integer;
    Same: boolean;
  begin
    j:=0;
    Same:=true;
    while (j<n) and Same do
      if Str1[j]=Str2[j]
        then inc(j)
        else Same:=false;
    Compare:=Same;
  end; {Compare}

procedure TMainForm.CompClick(Sender: TObject);
  var
    i,j,q,m1: integer;
  begin
    if not Grid.Visible
      then ShowMessage('Ошибка. Задайте размер матрицы')
      else
        begin
          GridToArr(Arr,Grid,m,n);
          i:=0;
          m1:=m;
          while (i<m1-1) do
            if Compare(Arr[i],Arr[i+1],n)
              then
                begin
                  {Удаляем строку i+1}
                  for j:=i+1 to m1-2 do
                    for q:=0 to n-1 do
                      Arr[j,q]:=Arr[j+1,q];
                  dec(m1);
                end
              else inc(i);
          FOut:=TFOut.Create(Self);
          ArrToGrid(Arr,FOut.Output,m1,n);
          FOut.ShowModal;
        end; {if not Grid}
  end; {CompClick}

procedure TMainForm.GridKeyPress(Sender: TObject; var Key: Char);
  begin
    if not(((Key>='0') and (Key<='9')) or (Key=#8) or (Key='-'))
      then Key:=#0;
  end; {GridKeyPress}

end.
