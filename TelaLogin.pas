unit TelaLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.TabControl, FMX.Ani;

type
  TFormLogin = class(TForm)
    StyleBook1: TStyleBook;
    TabControl: TTabControl;
    FloatAnimation1: TFloatAnimation;
    TabLogin: TTabItem;
    Image1: TImage;
    layout_campos: TLayout;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Image2: TImage;
    edt_email: TEdit;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    Image3: TImage;
    edt_senha: TEdit;
    rect_botao: TRectangle;
    Label1: TLabel;
    Layout4: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TabConta: TTabItem;
    Image4: TImage;
    Layout1: TLayout;
    Layout5: TLayout;
    Rectangle3: TRectangle;
    Image5: TImage;
    edt_cad_email: TEdit;
    Layout6: TLayout;
    Rectangle4: TRectangle;
    Image6: TImage;
    edt_cad_senha: TEdit;
    Rectangle5: TRectangle;
    Label6: TLabel;
    Layout7: TLayout;
    Label7: TLabel;
    FloatAnimation4: TFloatAnimation;
    c_foto: TCircle;
    Label8: TLabel;
    TabFoto: TTabItem;
    Layout8: TLayout;
    img_foto: TImage;
    img_library: TImage;
    lbl_cancelar: TLabel;
    procedure rect_botaoClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.fmx}

uses  TelaInicial, uFormat, UDM, TelaAtualizacao, uOpenURL, UMenuInicial;


{procedure TForm1.BotaoLoginClick(Sender: TObject);
begin

  if not Assigned(Form3) then
    Application.CreateForm(TForm3, Form3);
  Form3.Show;

  //TelaInicial.Form3.Show;
  //TelaLogin.Form1.Hide;



end;     }


procedure TFormLogin.rect_botaoClick(Sender: TObject);
begin
 if not Assigned(FormInicial) then
    Application.CreateForm(TFormMenu, FormMenu);
    FormMenu.Show;


end;

end.
