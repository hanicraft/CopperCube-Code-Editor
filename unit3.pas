unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  SynEdit, SynCompletion, SynHighlighterJScript, SynHighlighterLua,
  SynHighlighterVBScript;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SynCompletion1: TSynCompletion;
    SynEdit1: TSynEdit;
    SynJScriptSyn1: TSynJScriptSyn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.Button2Click(Sender: TObject);
var
  InputFile: TextFile;
  FileName: string;
  Content: string;
  Line: string;
begin
     OpenDialog1.Create(nil);
     OpenDialog1.Title:='Open A CopperLicht File';
     if OpenDialog1.Execute then
     begin
         FileName := OpenDialog1.FileName;

         AssignFile(InputFile, FileName);
         Reset(InputFile);

         Content := '';
         while not Eof(InputFile) do
         begin
           ReadLn(InputFile, Line);
           Content := Concat(Content, Line, sLineBreak);
         end;

         CloseFile(InputFile);

         SynEdit1.Lines.Text := Content;

         ShowMessage('File opened successfully!');
     end;

end;

procedure TForm3.Button3Click(Sender: TObject);
begin
     ShowMessage('Goto Tools Folder And Drag JS File On validjs.exe');
end;

procedure TForm3.Button1Click(Sender: TObject);
var
  OutputFile: TextFile;
  FileName: string;
  Content: string;
begin
  SaveDialog1.Create(nil);
  SaveDialog1.Title:='Save CopperLicht File';
  SaveDialog1.Filter:='CopperLicht Files (*.js)|*.js';
  if SaveDialog1.Execute then
  begin
    FileName := SaveDialog1.FileName;


    AssignFile(OutputFile, FileName);
    Rewrite(OutputFile);


    Content := SynEdit1.Lines.Text;


    Write(OutputFile, Content);


    CloseFile(OutputFile);

    ShowMessage('File saved successfully!');
  end;

end;

end.

