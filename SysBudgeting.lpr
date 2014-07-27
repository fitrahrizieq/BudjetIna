program SysBudgeting;

{$mode objfpc}{$H+}
{$I unit\conf.inc}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, pexpandpanels, printer4lazarus, lazreportpdfexport, zcomponent, uMain,
  uDm, udmrpt, ufmbase, ufrmLogin, uEngine;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  {$IFDEF DEVELOP}
    Pengguna.UserName:='superadmin';
    Pengguna.Password:='admin';
    Pengguna.TahunId:=65;  //2014
    Pengguna.Tahun:=2014;  //2014
    {$ENDIF}

  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDmRpt, DmRpt);
  Application.Run;
end.

