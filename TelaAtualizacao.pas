unit TelaAtualizacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.JSON;

type
  TFormAtual = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    LayoutFundo: TLayout;
    Layout3: TLayout;
    Image1: TImage;
    Layout4: TLayout;
    LayoutUpdate: TLayout;
    Layout1: TLayout;
    rect_botao: TRectangle;
    lb_atualizar: TLabel;
    Layout2: TLayout;
    img_seta: TImage;
    lbl_titulo: TLabel;
    lbl_texto: TLabel;
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure OnFinishUpdate(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
     versao_app:string;
     versao_server:string;
  end;

var
  FormAtual: TFormAtual;

implementation

{$R *.fmx}

uses TelaInicial, TelaLogin, uFormat, uOpenURL;

procedure TFormAtual.FormCreate(Sender: Tobject);
begin
  versao_app := '1.0';
  versao_server := '0.0';
end;

procedure TFormAtual.FormShow(Sender: TObject);
  var
  t:TThread;
  begin
    t := TThread.CreateAnonymousThread(
    procedure
    var
      JsonObj: TJSONObject;
      begin
        sleep(2000);
        try
          RESTRequest1.Execute;
        except
          on ex: Exception do
          begin
            raise Exception.Create('Erro ao acessar o servidor' + ex.Message);
            exit
          end;
        end;
        try
          JsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes
            (RESTRequest1.Response.JSONValue.ToString), 0) as TJSONObject;

          versao_server := TJSONObject(JsonObj).GetValue('Versao').Value;
        finally
        JsonObj.disposeof;
        end;
      end);
    t.OnTerminate := OnFinishUpdate;
    t.Start;
  end;


  procedure TFormAtual.OnFinishUpdate(Sender: TObject);
  begin

    if Assigned(TThread(Sender).FatalException) then
      begin
        showmessage(Exception(TThread(Sender).FatalException).Message);
        exit;
      end;

     if versao_app < versao_server then
     begin
       Layout1.Visible := false
     end;

  end;



procedure TFormAtual.btnAtualizarClick(Sender: TObject);
begin
  var
    url: string;
  begin
    {$IFDEF ANDROID}
      url :='';
    {$ELSE}
      url := '';
    {$ENDIF}
      OpenURL(url, False);
      Application.Terminate;
  end;
end;

end.

