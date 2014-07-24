unit uDm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Controls, ZConnection, ZSqlMonitor, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    ImgLst16: TImageList;
    ImgLst32: TImageList;
    konDB: TZConnection;
    ZQuery1: TZQuery;
    ZSQLMonitor1: TZSQLMonitor;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.

