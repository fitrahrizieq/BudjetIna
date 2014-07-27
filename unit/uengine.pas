unit uEngine;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,IniFiles,Forms;

type
  TPengguna = class
    UserID        : Integer;
    UserName      : String;
    GroupID       : Integer;
    Password      : String;
    TahunId       :Integer;
    Tahun         :Integer;
  end;

  TDatabaseSetting = class
    UserName    : String;
    Password    : String;
    ServerName    : String;
    DBName     : String;
  end;

function       properCase(sBuffer: string):string;
procedure      SplitString (const Delimiter: Char; Input: string; const Strings: TStrings) ;
function       SplitString2 (const Delimiter: Char; Input: string; const arrN:Integer ): string ;
function       AddLeadingZeroes(const aNumber, Length : integer) : string;
procedure      WriteConfig(section, Ident, value: string);
function       ReadConfig(section, Ident: string): string;

var
  MyiniFile            :  TIniFile;
  AppPath: String;
  AppName: String;
  Pengguna  : TPengguna;
  DbSetting :TDatabaseSetting;

procedure ResetPengguna;

implementation

uses strUtils;


procedure ResetPengguna;
begin
  with Pengguna do
  begin
    UserID      := 0;
    UserName    := '';
    GroupID     :=  1;
    Password    := '';
    TahunId     :=0;
    Tahun       :=0;
  end;
end;

function properCase(sBuffer: string):string;
var
    iLen, iIndex: integer;
begin
    iLen := Length(sBuffer);
    sBuffer:= Uppercase(MidStr(sBuffer, 1, 1)) + Lowercase(MidStr(sBuffer,2, iLen));
    for iIndex := 0 to iLen do
    begin
      if MidStr(sBuffer, iIndex, 1) = ' ' then
          sBuffer := MidStr(sBuffer, 0, iIndex) + Uppercase(MidStr(sBuffer, iIndex + 1, 1)) + Lowercase(MidStr(sBuffer, iIndex + 2, iLen));
    end;
    Result := sBuffer;
end;


procedure SplitString (const Delimiter: Char; Input: string; const Strings: TStrings);
begin
   Assert(Assigned(Strings));
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.DelimitedText := Input;
end;

function SplitString2 (const Delimiter: Char; Input: string; const arrN:Integer ):string ;
var
  astringList:TStringList;
begin
  astringList:=TStringList.Create;
  Result:='';
  try
     Assert(Assigned(astringList)) ;
     astringList.Clear;
     astringList.Delimiter := Delimiter;
     astringList.DelimitedText := '"' + StringReplace(Input, Delimiter, '"' + Delimiter + '"', [rfReplaceAll]) + '"' ; //Input;
     Result :=astringList[arrN];
   finally
     astringList.Free;
   end;

end;

function AddLeadingZeroes(const aNumber, Length : integer) : string;
begin
   result := SysUtils.Format('%.*d', [Length, aNumber]) ;
end;

function  ReadConfig(section, Ident: string): string;
var
  inif : TINIFile;
begin
  inif   := TINIFile.Create(AppPath + 'Config.app');
  result := inif.ReadString(section, Ident, '');
  inif.free;
end;

procedure WriteConfig(section, Ident, value: string);
var
  inif : TINIFile;
begin
  inif   := TINIFile.Create(AppPath + 'Config.app');
  inif.WriteString(section, Ident, value);
  inif.free;
end;

initialization
  Pengguna  := TPengguna.Create;
  DbSetting := TDatabaseSetting.Create;
  AppPath   := ExtractFilePath(Application.ExeName);
  AppName   := Application.Exename;
  MyIniFile := TIniFile.Create(AppPath + 'Koneksi.ini');

end.

