unit UNoticias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePesquisaSimples, Vcl.ExtCtrls,
  Vcl.OleCtrls, SHDocVw, Activex;

type
  TF_noticias = class(TF_baseTelaSimples)
    WebBrowser: TWebBrowser;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure WBLoadHTML(WebBrowser: TWebBrowser; HTMLCode: string) ;
  end;

var
  F_noticias: TF_noticias;

implementation

procedure TF_noticias.WBLoadHTML(WebBrowser: TWebBrowser; HTMLCode: string) ;
var
   sl: TStringList;
   ms: TMemoryStream;
begin
   WebBrowser.Navigate('about:blank') ;
   while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

   if Assigned(WebBrowser.Document) then
   begin
     sl := TStringList.Create;
     try
       ms := TMemoryStream.Create;
       try
         sl.Text := HTMLCode;
         sl.SaveToStream(ms) ;
         ms.Seek(0, 0) ;
         (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms)) ;
       finally
         ms.Free;
       end;
     finally
       sl.Free;
     end;
   end;
end;

{$R *.dfm}

procedure TF_noticias.FormCreate(Sender: TObject);
//var
//  sHTML : string;
begin
//  inherited;
//  sHTML := '<a>Informação 1</a>' +
//           '<b>Informação 2</b>';
//  WBLoadHTML(WebBrowser,sHTML) ;

  WebBrowser.Navigate('www.ciec.com.br');
end;

end.
