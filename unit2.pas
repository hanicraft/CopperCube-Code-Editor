unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);

  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }
uses
  Unit1, Unit3;

procedure TForm2.Button1Click(Sender: TObject);
begin
     if RadioButton1.Checked = True then
     begin
          Form1.Show;
          Form2.Hide;
     end
     else begin
          Form3.Show;
          Form2.Hide;
     end;
end;

end.

