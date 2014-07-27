unit ufrmLogin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons;

type

  { TfrmLogin }

  TfrmLogin = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    e1: TEdit;
    e2: TEdit;
    imgTop: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    FPassesThrough: Integer;
    function tryit: Boolean;
  public
    { public declarations }
    class function Execute : boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.lfm}

{ TfrmLogin }

class function TFrmLogin.Execute: boolean;
 begin
   with TFrmLogin.Create(nil) do
   try
     //ResetPengguna;
     Result := ShowModal = mrOk;
   finally
     Free;
   end;
 end;

function TfrmLogin.tryit: Boolean;
begin
  //Result := True;
  //with DM.qry1 do
  //begin
  //  Close;SQL.Clear;Params.Clear;
  //  SQL.Add('select UserAktif from tblpengguna where UserID=:p1 and UserPwd=:p2 and UserDelete=0');
  //  Params[0].AsString:=edtUser.Text;
  //  Params[1].AsString:=edtPass.Text;
  //  Open;
  //  if not Eof then
  //  begin
  //    if FieldByName('UserAktif').AsInteger=1 then Result := true else Result := false;
  //  end
  //  else
  //    Result := false;
  //end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  e1.Text:='';
  e2.Text:='';

end;

procedure TfrmLogin.BitBtn1Click(Sender: TObject);
begin
   If TryIt = False then
      inc(FPassesThrough)
   else
   begin
      //Pengguna.UserName := edtUser.Text;
      //Pengguna.Password:=edtPass.Text;
      //Pengguna.TahunId:= cbb2.EditValue;
      //
      //with DM.qry1 do
      //begin
      //  Close;SQL.Clear;Params.Clear;
      //  SQL.Add('select Tahun from tblTahun where Tahun_id=:p1 ');
      //  Params[0].AsInteger:=cbb2.EditValue;
      //  Open;
      //  if not Eof then
      //     Pengguna.Tahun:=FieldbyName('Tahun').AsInteger;
        //end;
      ModalResult := mrOK;
   end;

   if FPassesThrough > 3 then begin
       MessageDlg('Invalid Credentials Provided!', mtError, [mbOK], 0);
       ModalResult := mrAbort;
   end;
end;

end.

