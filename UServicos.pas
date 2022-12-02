unit UServicos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Ani;

type
  TFormServicos = class(TForm)
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
    Layout1: TLayout;
    LayoutMenu: TLayout;
    ImageFechar: TImage;
    ani_bt_fechar: TFloatAnimation;
    Layout2: TLayout;
    Layout3: TLayout;
    Image1: TImage;
    Label1: TLabel;
    RoundRect1: TRoundRect;
    Image6: TImage;
    Layout4: TLayout;
    img_entregas_ativo: TImage;
    img_servicos_des: TImage;
    img_servicos_atv: TImage;
    Ly_Entregas: TLayout;
    LyDriver: TLayout;
    img_driver_ativo: TImage;
    img_drive_des: TImage;
    img_drive_atv: TImage;
    Label2: TLabel;
    LyCentral: TLayout;
    Image3: TImage;
    Image4: TImage;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure img_entregas_ativoClick(Sender: TObject);
    procedure img_driver_ativoClick(Sender: TObject);
    procedure ImageHomeClick(Sender: TObject);
    procedure ImageContaClick(Sender: TObject);
    procedure ImageFecharClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormServicos: TFormServicos;

implementation

{$R *.fmx}

uses TelaInicial, UMenuInicial, UConta;

procedure TFormServicos.ImageContaClick(Sender: TObject);
begin
    if not Assigned(FormConta) then
    Application.CreateForm(TFormConta, FormConta);
    FormConta.Show
end;

procedure TFormServicos.ImageFecharClick(Sender: TObject);
begin
    Close;

end;

procedure TFormServicos.ImageHomeClick(Sender: TObject);
begin
 if not Assigned(FormMenu) then
    Application.CreateForm(TFormMenu, FormMenu);
    FormMenu.Show
end;

procedure TFormServicos.img_driver_ativoClick(Sender: TObject);
begin
    if img_driver_ativo.Tag = 1 then

 // Receita...
    begin
        img_driver_ativo.Bitmap := img_drive_atv.Bitmap;
        img_driver_ativo.Tag := -1;
        ShowMessage('Shark Drive Ativado');

    end
    else
    begin
        img_driver_ativo.Bitmap := img_drive_des.Bitmap;
        img_driver_ativo.Tag := 1;
          //ShowMessage('Entregas Desativado');
    end;

end;

procedure TFormServicos.img_entregas_ativoClick(Sender: TObject);
begin
 if img_entregas_ativo.Tag = 1 then

 // Receita...
    begin
        img_entregas_ativo.Bitmap := img_servicos_atv.Bitmap;
        img_entregas_ativo.Tag := -1;
        ShowMessage('Entregas Ativado');

    end
    else
    begin
        img_entregas_ativo.Bitmap := img_servicos_des.Bitmap;
        img_entregas_ativo.Tag := 1;
          //ShowMessage('Entregas Desativado');
    end;

end;



end.
