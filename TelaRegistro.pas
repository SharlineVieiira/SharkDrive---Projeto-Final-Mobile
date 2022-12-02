unit TelaRegistro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.Objects;

type
  TForm2 = class(TForm)
    BotaoLogin: TButton;
    Circle1: TCircle;
    EditSenha: TEdit;
    Image2: TImage;
    EditUsuario: TEdit;
    Image1: TImage;
    procedure BotaoLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses TelaInicial, TelaLogin, uFormat;

procedure TForm2.BotaoLoginClick(Sender: TObject);
begin

  if not Assigned(Form3) then
    Application.CreateForm(TForm3, Form3);
  Form3.Show;

  TelaInicial.Form3.show;
  TelaRegistro.Form2.hide;
end;

end.
