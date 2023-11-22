unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, SynEdit, SynCompletion, SynHighlighterJScript, SynHighlighterAny,
  SynHighlighterMulti, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    fontsize: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SaveDialog1: TSaveDialog;
    SynCompletion1: TSynCompletion;
    CodeEditor: TSynEdit;
    SynJScriptSyn1: TSynJScriptSyn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
     ShowMessage('Goto Tools Folder And Drag JS File On validjs.exe');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  OutputFile: TextFile;
  FileName: string;
  Content: string;
begin
  SaveDialog1.Create(nil);
  SaveDialog1.Title:='Save JS File';
  SaveDialog1.Filter:='JavaScript Files (*.js)|*.js';
  if SaveDialog1.Execute then
  begin
    FileName := SaveDialog1.FileName;


    AssignFile(OutputFile, FileName);
    Rewrite(OutputFile);


    Content := CodeEditor.Lines.Text;


    Write(OutputFile, Content);


    CloseFile(OutputFile);

    ShowMessage('File saved successfully!');
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  InputFile: TextFile;
  FileName: string;
  Content: string;
  Line: string;
begin
     OpenDialog1.Create(nil);
     OpenDialog1.Title:='Open A JavaScript File';
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

         CodeEditor.Lines.Text := Content;

         ShowMessage('File opened successfully!');
     end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  CodeEditor.Text:='Somethings Not Right. If You Got This Message Again Goto Tools Folder And Run GPT4CodeGen.exe Manually';
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  NewFontSize: Integer;
begin

  if TryStrToInt(fontsize.Text, NewFontSize) then
  begin

    CodeEditor.Font.Size := NewFontSize;
  end
  else
  begin

    ShowMessage('Invalid font size');
  end;
end;

procedure TForm1.RadioButton1Change(Sender: TObject);
begin
  CodeEditor.Color:=clWhite;
  Form1.Color:= clWhite;
  CodeEditor.Font.Color:=clBlack;
  SynJScriptSyn1.CommentAttri.Foreground:=clGreen;
end;

procedure TForm1.RadioButton2Change(Sender: TObject);
begin
  CodeEditor.Color:=clGray;
  Form1.Color:= clGray;
  CodeEditor.Font.Color:=clWhite;
  SynJScriptSyn1.CommentAttri.Foreground:=clLime;
end;



end.

