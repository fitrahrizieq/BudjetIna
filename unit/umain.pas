unit uMain;

{$mode objfpc}{$H+}

{$I conf.inc}

interface

uses
  Classes, SysUtils, FileUtil, PrintersDlgs, Forms, Controls, Graphics, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Menus, ActnList, ValEdit, ExpandPanels;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    acsExit: TAction;
    acsKoneksi: TAction;
    acsLogin: TAction;
    acsPrinter: TAction;
    acrSKPD: TAction;
    acrKodrek: TAction;
    acrProgram: TAction;
    acrKegiatan: TAction;
    acdPendapatan: TAction;
    acbAbout: TAction;
    acbHelp: TAction;
    acRefreshdata: TAction;
    acdBTL: TAction;
    acdLS: TAction;
    acdPembiayaan: TAction;
    acr: TAction;
    actPengguna: TAction;
    actDatabase: TAction;
    actlist1: TActionList;
    imgTop: TImage;
    lblApp1: TLabel;
    lblApp2: TLabel;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MyRollOut1: TMyRollOut;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    pm3: TPopupMenu;
    pm4: TPopupMenu;
    pm5: TPopupMenu;
    pm6: TPopupMenu;
    pm7: TPopupMenu;
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
    valInfo: TValueListEditor;
    procedure acsExitExecute(Sender: TObject);
    procedure acsLoginExecute(Sender: TObject);
    procedure acsPrinterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MyRollOut1Collapse(Sender: TObject);
    procedure MyRollOut1Expand(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uDm, udmrpt, ufrmLogin, uEngine;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  caption:=Application.Title;
  stsBar.Panels[0].Text:=FormatDateTime('DD MMMM YYYY',Now);
  stsBar.Panels[1].Text:=FormatDateTime('hh:nn:ss',Now);
  stsBar.Panels[2].Text:=Format('User: %s',[Pengguna.UserName]);
  stsBar.Panels[3].Text:=Format('Tahun: %d',[Pengguna.Tahun]);
  lblApp1.caption:='Aplikasi Anggaran';
  lblApp2.caption:='#FariqSoft@2014';
  MyRollOut1.Button.Caption:='<<';
  MyRollOut1.Collapsed:=true;
  valInfo.InsertRow('Jml SKPD','',true);
  valInfo.InsertRow('Total Anggaran','',true);
  valInfo.InsertRow('Pendapatan','',true);
  valInfo.InsertRow('B.T.L','',true);
  valInfo.InsertRow('L.S','',true);
  valInfo.InsertRow('Pembiayaan','',true);
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin

end;

procedure TfrmMain.MyRollOut1Collapse(Sender: TObject);
begin
  MyRollOut1.Button.Caption:='<<';
end;

procedure TfrmMain.MyRollOut1Expand(Sender: TObject);
begin
  MyRollOut1.Button.Caption:='Informasi';
end;

procedure TfrmMain.acsExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.acsLoginExecute(Sender: TObject);
begin

  {$IFNDEF DEVELOP}
  if acsLogin.tag=1 then
  begin
      if MessageDlg('Logoff dari aplikasi?', mtConfirmation, [mbYes,MbNo], 0)=mrYes then
        begin
          //ShellExecute(Handle, nil, PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
          Application.Terminate;
        end;
  end;
  if TFrmLogin.Execute = false then
    Application.Terminate;
  {$ELSE}
    if TFrmLogin.Execute then
    begin
      stsBar.Panels[2].Text:=Format('User: %s',[Pengguna.UserName]);
      stsBar.Panels[3].Text:=Format('Tahun: %d',[Pengguna.Tahun]);
    end;
  {$ENDIF}
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

