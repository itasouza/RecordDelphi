unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
   //conjunto de vari�veis
   TDADOS  = Record
     id:Integer;
     nome, email, sexo:String;
end;

type
   //conjunto de vari�veis
   TDADOS_CLIENTE  = Record
     id:Integer;
     nome, email, sexo:String;
end;


type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure BitBtn1Click(Sender: TObject);
    //adicionar dados
    procedure AdicionarDados(d : TDADOS);
  private
    { Private declarations }
    //declara a vari�vel com o tipo do record
    //neste caso grava sempre o �ltimo registro
    Dados :TDADOS;
    CLIENTE :TDADOS_CLIENTE;

    //array para adicionar os dados
    //neste caso grava v�rios registros
    arDados : Array of TDADOS;


  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.AdicionarDados(d: TDADOS);
begin
  SetLength(arDados,Length(arDados)+1);
  arDados[Length(arDados)-1] := D;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
   //gravando record

   Dados.id   := Dados.id + 1;
   Dados.nome := Edit1.Text;
   Dados.email:= Edit2.Text;
   Dados.sexo := Edit3.Text;
   AdicionarDados(Dados);

   //limpar campos
   Edit1.Text := '';
   Edit2.Text := '';
   Edit3.Text := '';


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    //leitura do record (neste caso o �ltimo)
    Label1.Caption := IntToStr(Dados.id);
    Edit1.Text := Dados.nome;
    Edit2.Text := Dados.email;
    Edit3.Text := Dados.sexo;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
  var
  s:TStringList;
  i:Integer;
begin
    //leitura de v�rios registros inseridos no record
   for i:= 0 to Pred(length(arDados)) do
    begin
       Memo1.Lines.Add(IntToStr(arDados[i].id) + '-' + arDados[i].nome +
                                                 '-' + arDados[i].sexo +
                                                 '-' + arDados[i].email);
    end;

end;

end.
