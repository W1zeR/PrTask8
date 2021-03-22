unit UnitOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TFOut = class(TForm)
    Output: TStringGrid;
    OK: TButton;
    SaveRes: TSaveDialog;
    procedure OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOut: TFOut;

implementation

uses UnitT8;

{$R *.dfm}

procedure TFOut.OKClick(Sender: TObject);
  var
    TF: TextFile;
    i,j: integer;
  begin
    if MessageDlg('Сохранить результат?',mtConfirmation,[mbYes,mbNo],0)=mrYes
      then
        if SaveRes.Execute
          then
            begin
              AssignFile(TF,SaveRes.FileName);
              Rewrite(TF);
              for i:=0 to Output.RowCount-1 do
                begin
                  for j:=0 to Output.ColCount-1 do
                    if Output.Cells[j,i]=''
                      then write(TF,0,' ')
                      else write(TF,Output.Cells[j,i],' ');
                  writeln(TF);
                end; {for i}
              CloseFile(TF);
            end; {if Save}
    FOut.Close;
  end; {OKClick}

end.
