unit ufmbase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, udmrpt, uDm;

type

  { Tfmbase }

  Tfmbase = class(TForm)
    btnClose: TBitBtn;
    pnlAtas: TPanel;
    pblBwh: TPanel;
    procedure btnCloseClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmbase: Tfmbase;

implementation

{$R *.lfm}

{ Tfmbase }

procedure Tfmbase.btnCloseClick(Sender: TObject);
begin
  close;
end;

end.

