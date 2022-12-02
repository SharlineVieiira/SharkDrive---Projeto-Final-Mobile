unit UConta;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.Objects, FMX.Layouts;

type
  TFormConta = class(TForm)
    LayoutMenu: TLayout;
    ImageFechar: TImage;
    ani_bt_fechar: TFloatAnimation;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Image1: TImage;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RecOpcoes: TRectangle;
    RecProp: TRectangle;
    Rectangle7: TRectangle;
    Layout5: TLayout;
    Image5: TImage;
    RoundRect1: TRoundRect;
    Image6: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Layout6: TLayout;
    Image7: TImage;
    Label7: TLabel;
    Layout8: TLayout;
    Image9: TImage;
    Label9: TLabel;
    Layout7: TLayout;
    Image8: TImage;
    Label8: TLabel;
    RecMenu: TRectangle;
    Layout9: TLayout;
    ImageHome: TImage;
    Label10: TLabel;
    Layout10: TLayout;
    ImageConta: TImage;
    Label11: TLabel;
    Layout11: TLayout;
    ImageAtv: TImage;
    Label12: TLabel;
    Layout12: TLayout;
    ImageServicos: TImage;
    Label13: TLabel;
    Layout13: TLayout;
    procedure ImageFecharClick(Sender: TObject);
    procedure ImageHomeClick(Sender: TObject);
    procedure ImageServicosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConta: TFormConta;

implementation

{$R *.fmx}

uses UMenuInicial, UServicos;

procedure TFormConta.ImageFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TFormConta.ImageHomeClick(Sender: TObject);
begin
    if not Assigned(FormMenu) then
    Application.CreateForm(TFormMenu, FormMenu);
    FormMenu.Show


end;

procedure TFormConta.ImageServicosClick(Sender: TObject);
begin
    if not Assigned(FormServicos) then
    Application.CreateForm(TFormServicos, FormServicos);
    FormServicos.Show
end;

end.
