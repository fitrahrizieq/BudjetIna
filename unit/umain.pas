unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, PrintersDlgs, Forms, Controls, Graphics, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Menus, ActnList;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    acsExit: TAction;
    acsKoneksi: TAction;
    acsLogin: TAction;
    acsPrinter: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    actlist1: TActionList;
    imgTop: TImage;
    lblApp1: TLabel;
    lblApp2: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    pm3: TPopupMenu;
    pm4: TPopupMenu;
    pm5: TPopupMenu;
    pm6: TPopupMenu;
    PrinterSetupDialog1: TPrinterSetupDialog;
    stsBar: TStatusBar;
    Timer1: TTimer;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    procedure acsExitExecute(Sender: TObject);
    procedure acsPrinterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uDm;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  caption:=Application.Title;
  stsBar.Panels[0].Text:=FormatDateTime('DD MMMM YYYY',Now);
  stsBar.Panels[1].Text:=FormatDateTime('hh:nn:ss',Now);
  lblApp1.caption:='Aplikasi Anggaran';
  lblApp2.caption:='#FariqSoft@2014';
end;

procedure TfrmMain.acsExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.acsPrinterExecute(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  stsBar.Panels[1].Text:=FormatDateTime('hh:nn:ss',Now);
  stsBar.Panels[0].Text:=FormatDateTime('DD MMMM YYYY',Now);
end;

end.

