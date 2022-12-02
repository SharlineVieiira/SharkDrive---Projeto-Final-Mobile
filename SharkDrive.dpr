program SharkDrive;

uses
  System.StartUpCopy,
  FMX.Forms,
  TelaLogin in 'TelaLogin.pas' {FormLogin},
  TelaInicial in 'TelaInicial.pas' {FormInicial},
  uFormat in 'uFormat.pas',
  TelaAtualizacao in 'TelaAtualizacao.pas' {FormAtual},
  uOpenURL in 'uOpenURL.pas',
  UDM in 'UDM.pas' {Form5},
  UMenuInicial in 'UMenuInicial.pas' {FormMenu},
  UConta in 'UConta.pas' {FormConta},
  UServicos in 'UServicos.pas' {FormServicos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormConta, FormConta);
  Application.CreateForm(TFormServicos, FormServicos);
  Application.Run;
end.
