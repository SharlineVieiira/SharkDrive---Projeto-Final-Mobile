unit TelaInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Menus, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.Objects, FMX.Edit, FMX.Layouts, FMX.ListBox,
  FMX.DateTimeCtrls, FMX.Gestures, FMX.Maps, System.Sensors, System.Permissions,
  System.Sensors.Components, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.Ani;

type
  TFormInicial = class(TForm)
    TabControl: TTabControl;
    TabItem1: TTabItem;
    Layout1: TLayout;
    Text1: TText;
    EditPlaca: TEdit;
    EditDescricao: TEdit;
    EditTanque: TEdit;
    EditGasolina: TEdit;
    EditDiesel: TEdit;
    EditEtanol: TEdit;
    Image1: TImage;
    Text8: TText;
    Text9: TText;
    Text10: TText;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    ChangeTabAction3: TChangeTabAction;
    LocationSensor1: TLocationSensor;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Layout3: TLayout;
    Image5: TImage;
    EditGasolinaAdt: TEdit;
    TabItem2: TTabItem;
    Rectangle5: TRectangle;
    LyButtom: TLayout;
    RectAnimation2: TRectAnimation;
    RecMapa: TRectangle;
    MapView2: TMapView;
    RectAnimation3: TRectAnimation;
    Layout5: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    textTempo: TText;
    textConsumo: TText;
    textDistancia: TText;
    Layout6: TLayout;
    editDestino: TEdit;
    editOrigem: TEdit;
    Layout8: TLayout;
    Image9: TImage;
    LyTop: TLayout;
    Layout7: TLayout;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    

    procedure EditTanqueTyping(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    //procedure btnCalculaClick(Sender: TObject);
    procedure EditEtanolTyping(Sender: TObject);
    procedure EditGasolinaTyping(Sender: TObject);
    procedure EditGasolinaAdtTyping(Sender: TObject);
    procedure EditDieselTyping(Sender: TObject);

    procedure Image9Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInicial: TFormInicial;

implementation

{$R *.fmx}

uses TelaLogin,  uFormat, TelaAtualizacao, UDM, uOpenURL, json
{$IFDEF ANDROID}
      , Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.Os
{$ENDIF}
      , UMenuInicial;



//procedure TFormInicial.btnCalculaClick(Sender: TObject);
//var
//  retorno: TJSONObject;
//  prows: TJSONPair;
//  arrayr: TJSONArray;
//  orows: TJSONObject;
//  arraye: TJSONArray;
//  oelementos: TJSONObject;
//  oduracao, odistancia: TJSONObject;
//
//  distancia_str, duracao_str: string;
//  distancia_int, duracao_int: integer;
//begin
//  RESTRequest1.Resource :=
//    'json?origins={origem}&destinations={destino}&mode=driving&language=pt-BR&key=AIzaSyAwjnJzF57fQddVy_dL8yTC01Zw7ufVuY8';
//  RESTRequest1.Params.AddUrlSegment('origem', editOrigem.Text);
//  RESTRequest1.Params.AddUrlSegment('destino', editDestino.Text);
//  RESTRequest1.Execute;
//
//  retorno := RESTRequest1.Response.JSONValue as TJSONObject;
//
//  if retorno.GetValue('status').Value <> 'OK' then
//  begin
//    showmessage('Ocorreu um erro ao calcular a viagem.');
//    exit;
//  end;
//
//  prows := retorno.Get('rows');
//  arrayr := prows.JSONValue as TJSONArray;
//  orows := arrayr.Items[0] as TJSONObject;
//  arraye := orows.GetValue('elements') as TJSONArray;
//  oelementos := arraye.Items[0] as TJSONObject;
//
//  odistancia := oelementos.GetValue('distance') as TJSONObject;
//  oduracao := oelementos.GetValue('duration') as TJSONObject;
//
//  distancia_str := odistancia.GetValue('text').Value;
//  distancia_int := odistancia.GetValue('value').Value.ToInteger;
//
//  duracao_str := oduracao.GetValue('text').Value;
//  duracao_int := oduracao.GetValue('value').Value.ToInteger;
//
//  textDistancia.Text := distancia_str;
//  textTempo.Text := duracao_str;
//
//end;




procedure TFormInicial.EditDieselTyping(Sender: TObject);
begin
       Formatar(EditDiesel, TFormato.Money)
end;

procedure TFormInicial.EditEtanolTyping(Sender: TObject);
begin
 Formatar(EditEtanol, TFormato.Money);
end;

procedure TFormInicial.EditGasolinaAdtTyping(Sender: TObject);
begin
     Formatar(EditGasolinaAdt, TFormato.Money);
end;

procedure TFormInicial.EditGasolinaTyping(Sender: TObject);
begin
     Formatar(EditGasolina, TFormato.Money);
end;

procedure TFormInicial.EditTanqueTyping(Sender: TObject);
begin
  Formatar(EditTanque, TFormato.Personalizado, '##,##')
end;

procedure TFormInicial.FormCreate(Sender: TObject);
  begin

    MapView2.MapType := TMapType.Normal;

    {$IFDEF ANDROID}
    var
      APermissaoGPS: string;
    {$ENDIF}
    begin
      {$IFDEF ANDROID}
        APermissaoGPS := JStringToString
          (TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);

      PermissionsService.RequestPermissions([APermissaoGPS],
        Procedure(const APermissions: TArray<string>;
          const AGrantResults: TArray<TPermissionStatus>)
          begin
            if (Length(AGrantResults) = 1) and
              (AGrantResults[0] = TPermissionStatus.Granted) then
              LocationSensor1.Active := True
            else
              LocationSensor1.Active := False
        end);
     {$ENDIF}
     end;
end;






procedure TFormInicial.Image9Click(Sender: TObject);
var
  retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  orows: TJSONObject;
  arraye: TJSONArray;
  oelementos: TJSONObject;
  oduracao, odistancia: TJSONObject;

  distancia_str, duracao_str: string;
  distancia_int, duracao_int: integer;

   valor : double;
begin
  RESTRequest1.Resource :=
    'json?origins={origem}&destinations={destino}&mode=driving&language=pt-BR&key=AIzaSyAwjnJzF57fQddVy_dL8yTC01Zw7ufVuY8';
  RESTRequest1.Params.AddUrlSegment('origem', editOrigem.Text);
  RESTRequest1.Params.AddUrlSegment('destino', editDestino.Text);
  RESTRequest1.Execute;

  retorno := RESTRequest1.Response.JSONValue as TJSONObject;

  if retorno.GetValue('status').Value <> 'OK' then
  begin
    showmessage('Ocorreu um erro ao calcular a viagem.');
   exit;
  end;

  prows := retorno.Get('rows');
  arrayr := prows.JSONValue as TJSONArray;
  orows := arrayr.Items[0] as TJSONObject;
  arraye := orows.GetValue('elements') as TJSONArray;
  oelementos := arraye.Items[0] as TJSONObject;

  odistancia := oelementos.GetValue('distance') as TJSONObject;
  oduracao := oelementos.GetValue('duration') as TJSONObject;

  distancia_str := odistancia.GetValue('text').Value;
  distancia_int := odistancia.GetValue('value').Value.ToInteger;

  duracao_str := oduracao.GetValue('text').Value;
  duracao_int := oduracao.GetValue('value').Value.ToInteger;

  textDistancia.Text := distancia_str;
    textTempo.Text := duracao_str;

     valor := (distancia_int /12) * (5);
        textConsumo.Text := 'R$ ' + FormatFloat('##,#', valor);
end;


procedure TFormInicial.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
var
  MyMarker: TMapMarkerDescriptor;
  posicao: TMapCoordinate;

  begin
    
    MapView2.Location := TMapCoordinate.Create(NewLocation.Latitude,
      NewLocation.Longitude);
    posicao.Latitude := NewLocation.Latitude;
    posicao.Longitude := NewLocation.Longitude;
    MyMarker := TMapMarkerDescriptor.Create(posicao, 'Estou aqui!');
    MyMarker.Draggable := true;
    MyMarker.Visible := true;
    MyMarker.Snippet := 'Eu';

    MapView2.AddMarker(MyMarker);
    //Label3.Text := NewLocation.Latitude.ToString().Replace(',', '.');
    //Label4.Text := NewLocation.Longitude.ToString().Replace(',', '.');

  end;

end.
