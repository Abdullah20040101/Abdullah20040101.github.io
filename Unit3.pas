unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a: string;

implementation

uses Unit4;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  DataModule4.Zkategori.SQL.Clear;
  DataModule4.Zkategori.SQL.Add('insert into kategori values(null,"' + Edit1.text+ '")');
  DataModule4.Zkategori.ExecSQl;

  DataModule4.Zkategori.SQL.Clear;
  DataModule4.Zkategori.SQL.Add('select * from kategori');
  DataModule4.Zkategori.open;
  ShowMessage('Data Berhasil Disimpan!');
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  DataModule4.Zkategori.SQL.Clear;
  DataModule4.Zkategori.SQL.Add('update kategori set nama="' + Edit1.text +
    '" where id= "' + a + '"');
  DataModule4.Zkategori.ExecSQl;

  DataModule4.Zkategori.SQL.Clear;
  DataModule4.Zkategori.SQL.Add('select * from kategori');
  DataModule4.Zkategori.open;
  ShowMessage('Data Berhasil Diupdate!');

end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  DataModule4.Zkategori.SQL.Clear;
  DataModule4.Zkategori.SQL.Add('delete from kategori where id="' + a + '"');
  DataModule4.Zkategori.ExecSQl;

  DataModule4.Zkategori.SQL.Clear;
  DataModule4.Zkategori.SQL.Add('select * from kategori');
  DataModule4.Zkategori.open;
  ShowMessage('Data Berhasil Didelete!');
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
  Edit1.Text := DataModule4.Zkategori.Fields[1].AsString;
  a := dataModule4.Zkategori.Fields[0].AsString;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  if (application.MessageBox('Anda Yakin akan keluar', 'Informasi', MB_YESNO) =
    IDYES) then
    close
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
with DataModule4.Dskategori.DataSet do
  begin
    if Locate('nama', Edit2.Text, []) then
    begin
      ShowMessage('Data ditemukan.');
    end
    else
    begin
      ShowMessage('Data tidak ditemukan.');
    end;
  end;
end;

end.

