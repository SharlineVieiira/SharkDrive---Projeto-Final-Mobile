unit UMenuInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani;

type
  TFormMenu = class(TForm)
    LayoutPrincipal: TLayout;
    RecMenu: TRectangle;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout6: TLayout;
    RecTopo: TRectangle;
    ImageHome: TImage;
    ImageConta: TImage;
    ImageAtv: TImage;
    ImageServicos: TImage;
    LayoutMenu: TLayout;
    ImageDetMenu: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LbTitulo: TLabel;
    ani_bt_menu: TFloatAnimation;
    LayoutFundo: TLayout;
    RecFundo: TRectangle;
    ani_fundo: TFloatAnimation;
    Image1: TImage;
    LayoutFundoMenu: TLayout;
    RecMenuLat: TRectangle;
    Image2: TImage;
    RecSair: TRectangle;
    LbVeiculos: TLabel;
    RecVeiculos: TRectangle;
    LbSair: TLabel;
    ani_menuLat: TFloatAnimation;
    Layout1: TLayout;
    Switch1: TSwitch;
    procedure ImageDetMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RecFundoClick(Sender: TObject);
    procedure RecVeiculosClick(Sender: TObject);
    procedure ani_fundoFinish(Sender: TObject);
    procedure RecSairClick(Sender: TObject);
    procedure ImageContaClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure ImageServicosClick(Sender: TObject);
  private
    { Private declarations }

    procedure AbreMenu;
    procedure FechaMenu;
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

{$R *.fmx}

uses TelaInicial, TelaLogin, UConta, UServicos;

procedure TFormMenu.AbreMenu;
begin
    ani_bt_menu.Inverse := false;
    ani_bt_menu.Start;
    ImageDetMenu.Tag :=1;

     RecFundo.Visible := true;
    ani_fundo.Inverse := false;
    ani_fundo.Start;

     ani_menuLat.StartValue := 0 -  RecMenuLat.Width;
      ani_menuLat.StartValue := -175;
      ani_menuLat.Inverse := false;
      ani_menuLat.Start;

end;

procedure TFormMenu.ani_fundoFinish(Sender: TObject);
begin
      if ImageDetMenu.Tag =0 then
    RecFundo.Visible := false;
end;

procedure TFormMenu.FechaMenu;
begin
       ani_bt_menu.Inverse := true;
    ani_bt_menu.Start;
    ImageDetMenu.Tag :=0;

    ani_fundo.Inverse := true;
    ani_fundo.Start;

     ani_menuLat.Inverse := true;
      ani_menuLat.Start;


end;

procedure TFormMenu.FormShow(Sender: TObject);
begin
    ImageDetMenu.Tag :=0;
    RecMenuLat.Position.X := 0;
    RecMenuLat.Height := LayoutFundoMenu.Height;

   RecMenuLat.Position.X := 0 - RecMenuLat.Width;

   RecFundo.Visible := false;


end;

procedure TFormMenu.Image2Click(Sender: TObject);
begin
 if not Assigned(FormConta) then
    Application.CreateForm(TFormConta, FormConta);
    FormConta.Show
end;

procedure TFormMenu.ImageContaClick(Sender: TObject);
begin
   if not Assigned(FormConta) then
    Application.CreateForm(TFormConta, FormConta);
    FormConta.Show
end;

procedure TFormMenu.ImageDetMenuClick(Sender: TObject);
begin
    if ImageDetMenu.Tag =0
    then   AbreMenu
    else  FechaMenu;
end;



procedure TFormMenu.ImageServicosClick(Sender: TObject);
begin
  if not Assigned(FormServicos) then
    Application.CreateForm(TFormServicos, FormServicos);
    FormServicos.Show
end;

procedure TFormMenu.RecFundoClick(Sender: TObject);
begin
  FechaMenu;
end;

procedure TFormMenu.RecSairClick(Sender: TObject);
begin
    if not Assigned(FormLogin) then
    Application.CreateForm(TFormLogin, FormLogin);
    FormLogin.Show;
   ShowMessage('Obrigado por Utilizar o Shark Drive!');
   //ShowMessage('Boatos que no ultimo semestre não pode reprovar');

end;

procedure TFormMenu.RecVeiculosClick(Sender: TObject);
begin
if not Assigned(FormInicial) then
    Application.CreateForm(TFormInicial, FormInicial);
    FormInicial.Show;

end;

end.
