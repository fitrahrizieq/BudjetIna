unit udmrpt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LR_DBSet, LR_Class, LR_E_HTM, LR_E_CSV, LR_BarC,
  lr_e_pdf, uDm;

type

  { TDmRpt }

  TDmRpt = class(TDataModule)
    frBarCodeObject1: TfrBarCodeObject;
    frCSVExport1: TfrCSVExport;
    frDBDataSet1: TfrDBDataSet;
    frHTMExport1: TfrHTMExport;
    frReport1: TfrReport;
    frTNPDFExport1: TfrTNPDFExport;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DmRpt: TDmRpt;

implementation

{$R *.lfm}

end.

