unit ufmFiring;

interface
{$I mega.inc}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, dxdbtrel, Mask, RXCtrls,
  ExtCtrls, Db, FIBDataSet, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit,
  uTypes, pFIBDataSet, RxLookup, Variants, Menus,
  {$ifdef USE_EHLIB_V4}GridsEh, {$else} Grids, {$endif} DBGridEh,
  cxLookAndFeelPainters, cxGraphics, XSBuiltIns, cxCalendar, dxSkinsCore,
  dxSkinsDefaultPainters, cxLookAndFeels, ComCtrls, dxCore, cxDateUtils,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  DBAxisGridsEh;

type
  TFiring = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel2: TPanel;
    RxLabel2: TRxLabel;
    Label8: TLabel;
    DateEdit1: TcxDateEdit;
    Panel5: TPanel;
    RxLabel4: TRxLabel;
    DBGridEh1: TDBGridEh;
    qrErrors: TMegaDataSet;
    dsErrors: TDataSource;
    qrErrorsOERR: TIntegerField;
    qrErrorsOERR_MESS: TFIBStringField;
    Panel3: TPanel;
    RxLabel3: TRxLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit4: TEdit;
    Panel4: TPanel;
    RxLabel5: TRxLabel;
    cxButton2: TcxButton;
    cxComboBox1: TcxComboBox;
    Label14: TLabel;
    DateEdit2: TcxDateEdit;
    cxButton3: TcxButton;
    Label3: TLabel;
    Edit2: TEdit;
    Label7: TLabel;
    Edit3: TEdit;
    cxButton1: TcxButton;
    Label15: TLabel;
    Edit5: TEdit;
    Label16: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    qrSP: TMegaDataSet;
    dsSP: TDataSource;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure cxButton3Click(Sender: TObject);

  private
    { Private declarations }
    lKod_r:integer;
    lKod_Dep:Integer;
    wStr:WideString;
  public
    { Public declarations }
     constructor Create (AOwner: TComponent; iKod_Dk: Double;
        iName_Dk: String; iName_Dol: String; iName_Region: String; iKod_Dol,iKod_R,iKod_Dep: Integer);
  end;

var
  Firing: TFiring;
  Kod_Dk : Double;

implementation

uses MainData, ReportInventarCardOS, uConst, bphremployeefiring, bposmoving,
     uZpConst, uMegaIntf, uZpUtils;

{$R *.DFM}

constructor TFiring.Create(AOwner: TComponent; iKod_Dk: Double;
  iName_Dk, iName_Dol, iName_Region: String;
  iKod_Dol,iKod_R,iKod_Dep: Integer);
var
  dd, mm, yyyy: word;
begin
  inherited Create(AOwner);
  Kod_Dk := iKod_Dk;


  DateEdit1.Date := date;
  RxDBLookupCombo1.Enabled:=iKod_Dol<>1191;
  Edit5.Enabled:=RxDBLookupCombo1.Enabled;
{  if not (iKod_Dol in [21]) then
  begin
    DecodeDate(IntfIBCommon.GetServerDate, yyyy, mm, dd);
    if (dd in [1..10]) then
      DateEdit1.Date := GetLastDayPrevMonth(IntfIBCommon.GetServerDate)
  end;}
  DateEdit1.Enabled := (caZpChangeDateR in ZpUser.UserAccsess);
  DateEdit2.Date := DateEdit1.Date;

  Label2.Caption := iName_Dk;
  Label6.Caption := FloatToStr(Kod_Dk);
  Label5.Caption := iName_Dol;
  Label13.Caption := iName_Region;
  lKod_r:=iKod_R;
  lKod_Dep:=iKod_Dep;
end;

procedure TFiring.cxButton1Click(Sender: TObject);
var
  ZP_RECID:integer;
  s:string;
  aTypeReg:integer;
begin
  aTypeReg:=IntfMegaDBCommon.GetType_Reg(lKod_r);
  if lKod_Dep=0 then aTypeReg:=-1;

  if lKod_Dep<>0 then
  if DM.IsRussiaReg(lKod_R) {and (aTypeReg=3)} then begin
     DM.SetQueryROExecute('select TO_CHP from ZP_DEPARTAMENTS_INFO(null,'+IntToStr(lKod_Dep)+')');
     if DM.QueryRO.Fields[0].AsInteger=1 then
        aTypeReg:=-1;
  end;

  if aTypeReg>=0 then
  try
  DM.SetQueryROExecute('select FIRE from ZP_ACTION_BLOCK where type_reg='+IntToStr(aTypeReg));
  if not DM.QueryRO.Fields[0].IsNull
//  if (not(caZpAdmin in ZpUser.UserAccsess))and
//     (aTypeReg =0)
      then begin
         ShowMessage('С '+DM.QueryRO.Fields[0].asString+' увольнение сотрудников происходит только через бизнес-процесс.');
         abort;
      end;
  finally
    DM.QueryRO.Close;
  end;

  if (DateEdit2.Date = 0) then
  begin
    MessageDlg('Не указана дата!', mtError, [mbOK], 0);
    DateEdit2.SetFocus;
    Exit;
  end;
  DM.RefreshUserInfo;
                          //[216, 231, 232, 230, 215, 217, 218]
  if aTypeReg>=0 then
  if not ((aTypeReg in [1,2])or (ZpUser.isRus)) then
    if (Edit1.Text = '') then
    begin
      MessageDlg('Не проставлен номер приказа!', mtError, [mbOK], 0);
      Edit1.SetFocus;
      Exit;
    end;
                           //[216, 231, 232, 230, 215, 217, 218]
  if aTypeReg>=0 then
  if (aTypeReg<>2)and (not ZpUser.isRus) then
    if DateEdit1.Date <> DateEdit2.Date then
    with DM do
    try
      QueryRO.Close;
      QueryRO.SQL.Text := 'SELECT COUNT(*) FROM ZP_DK_TO_DISCHARGE zdtc '+
                ' where zdtc.DATEU = :DATE and zdtc.STATUS = -2 and kod_dk = :kod_dk';
      QueryRO.Params.ByName['DATE'].AsDateTime := DateEdit2.Date;
      QueryRO.Params.ByName['KOD_DK'].AsDouble := Kod_Dk;
      QueryRO.ExecQuery;

      if QueryRO.Fields[0].AsInteger = 0 then
      begin
       if (RxDBLookupCombo1.Enabled) and (qrSP.FieldByName('OLD_DAY').AsInteger=1) then
       //and(RxDBLookupCombo1.KeyValue=22) //если причина увольнения "СМЕРТЬ"
        begin
          if Application.MessageBox('Дата приказа и дата увольнения не совпадают!','Продолжить?',MB_YESNO+MB_ICONWARNING)=ID_NO then
            exit;
        end
        else begin
          MessageDlg('Дата приказа и дата увольнения должны совпадать!', mtError, [mbOK], 0);
          Exit;
        end;
      end;
    finally
      QueryRO.Close;
    end;

  if aTypeReg>=0 then
    if RxDBLookupCombo1.Enabled and (RxDBLookupCombo1.Value='') then
    begin
      MessageDlg('Укажите реальную причину увольнения !', mtError, [mbOK], 0);
      Exit;
    end;
      //aKod_R  in [216, 225, 231, 230, 232]
//  if DM.UseWebService then
//  if DM.IsRussiaReg(lKod_R) then begin
     //убрал проверку поскольку все ведется теперь в мани. (Дереза Д.)
     {try
       if GetReportInventarCardOSSoap(true).HasMOL_OS_ByMoneyCode(Kod_Dk) then begin
          MessageDlg('Невозможно уволить сотрудника т.к. на нём имеются основные средства в 1С V8 УПП Рус!',mtError,[mbCancel],0);
          exit;
       end;
     except
       on E: Exception do begin
        MessageDlg('Не удалось проверить наличие ОС в 1С V8 УПП Рус!'#13#10+E.Message,mtError,[mbCancel],0);
        exit;
       end;
     end; }
//  end;

  qrErrors.Close;
  qrErrors.SelectSQL.Text := 'select * from zp_check_fire(:kod_dk, :dater)';
  qrErrors.Params.ByName['kod_dk'].AsDouble := Kod_Dk;
  qrErrors.Params.ByName['dater'].AsDateTime := DateEdit2.Date;
  qrErrors.Open;
  if qrErrors.Fields[0].AsInteger <> 0 then exit;

  with DM do
  try
    SharedQuery.Close;
    SharedQuery.SQL.Text := 'SELECT OERR,ZP_RECID FROM ZP_FIRE(:IKOD_DK, :IDATER, :IREASON, :IGROUND, :INUMBER, :IDATEP, :IREASON_REAL, :IREASON_REAL_PRIM,:INUM_ORDER_ADD)';
    SharedQuery.Params.ByName['ikod_dk'].AsDouble := Kod_Dk;
    SharedQuery.Params.ByName['idater'].AsDateTime := DateEdit2.Date;
    SharedQuery.Params.ByName['ireason'].AsString := Edit2.Text;
    SharedQuery.Params.ByName['iground'].AsString := Edit3.Text;
    if RxDBLookupCombo1.Enabled then
    begin
      SharedQuery.Params.ByName['IREASON_REAL'].AsInteger:=strtoint(RxDBLookupCombo1.Value);
      SharedQuery.Params.ByName['IREASON_REAL_PRIM'].AsString := trim(Edit5.Text);
    end
    else begin
      SharedQuery.Params.ByName['IREASON_REAL'].AsVariant:=null;
      SharedQuery.Params.ByName['IREASON_REAL_PRIM'].AsVariant:=null;
    end;    // (ZpUser.UserCFO in [216, 231, 230, 232, 215, 217, 218])
    SharedQuery.Params.ByName['inumber'].AsInteger := StrToIntDef(Edit1.Text,0);
    SharedQuery.Params.ByName['INUM_ORDER_ADD'].AsString := Edit4.Text;
    SharedQuery.Params.ByName['idatep'].AsDateTime := DateEdit1.Date;
    SharedQuery.ExecQuery;
    if SharedQuery.Fields[0].AsInteger <> 0 then
    begin
      CloseTransaction(SharedQuery.Transaction);
      MessageDlg('Во время процедуры увольнения произошли ошибки!'+#13+#10+'Проверьте правильность входных данных!', mtError, [mbOK], 0);
      Exit;
    end;
    ZP_RECID:=SharedQuery.Fields[1].AsInteger;
    if UseWebService then
    try
      with GetBPOSMovingSoap(true) do begin
         wStr:=GetNumbersOfActiveProcessesWhereUserByLinkIsSenderOrReceiverAsString(Kod_Dk);
         s:=Utf8ToAnsi(wStr);
         if s<>'' then begin
           CloseTransaction(SharedQuery.Transaction);
           ShowMessage('По сотруднику есть незавершённые бизнес-процессы по перемещению OC в 1С-веб интерфейсе! Номера процессов :'#13#10+s);
           exit;
         end;
      end;
      with GetBPHREmployeeFiringSoap(true) do begin
        StartProcess2(Kod_Dk,Label2.Caption,ZP_RECID,DateTimeToXSDateTime(DateEdit2.Date,false));
      end;
    except
      on E:Exception do begin
         CloseTransaction(SharedQuery.Transaction);
         ShowMessage('Возникла ошибка в системе интеграции:'#13#10+E.Message);
         exit;
      end;
    end;
    CloseTransaction(SharedQuery.Transaction,true);
  except
     CloseTransaction(SharedQuery.Transaction);
     raise;
  end;
  MessageDlg('Процедура увольнения успешно завершена!', mtInformation, [mbOK], 0);
  Close;
end;

procedure TFiring.cxButton2Click(Sender: TObject);
var
  Sign: integer;
  Mess: string;
  fi: boolean;
begin
  case  cxComboBox1.ItemIndex of
    0: Sign := 0;
    1: Sign := -1;
    2: Sign := -2;
  end;
  with DM do
  try 
  QueryRO.Close;
  QueryRO.SQL.Text := 'SELECT count(*) FROM ZP_DK_TO_DISCHARGE zdtd where zdtd.KOD_DK=:KOD_DK '+
        ' and zdtd.STATUS = :STATUS';
  QueryRO.Params.ByName['KOD_DK'].AsDouble := Kod_Dk;
  QueryRO.Params.ByName['STATUS'].AsInteger := Sign;
  QueryRO.ExecQuery;
  fi := (QueryRO.Fields[0].AsInteger = 0);
  if fi
   then Mess:='Поставить пометку "готов к увольнению" на сотрудника ?'
   else Mess:='Сотрудник УЖЕ готов к увольнению. Снять пометку "готов к увольнению" ?';

  if (MessageDlg(Mess, mtConfirmation, [mbYes,mbNo], 0) = mrNo) then exit;

  if fi then
  begin
    SharedQuery.Close;
    SharedQuery.SQL.Text:='INSERT INTO ZP_DK_TO_DISCHARGE(DATEP, KOD_DK, STATUS, DATEU) VALUES (''today'', :KOD_DK, :STATUS, :DATEU)';
    SharedQuery.Params.ByName['KOD_DK'].AsDouble := Kod_Dk;
    SharedQuery.Params.ByName['STATUS'].AsInteger := Sign;
    SharedQuery.Params.ByName['DATEU'].AsDateTime := DateEdit2.Date;
    SharedQuery.ExecQuery;
  end
  else begin
    SharedQuery.Close;
    SharedQuery.SQL.Text:='DELETE FROM ZP_DK_TO_DISCHARGE zdtd where zdtd.KOD_DK=:KOD_DK and zdtd.STATUS = :STATUS';
    SharedQuery.Params.ByName['KOD_DK'].AsDouble := Kod_Dk;
    SharedQuery.Params.ByName['STATUS'].AsInteger := Sign;
    SharedQuery.ExecQuery;
  end;
  CloseTransaction(SharedQuery.Transaction,true);
  finally
    CloseTransaction(SharedQuery.Transaction);
    QueryRO.Close;
  end;
  if fi then
    Mess:='Пометка "готов к увольнению" установлена.'
  else
    Mess:='Пометка "готов к увольнению" снята.';
  MessageDlg(Mess, mtInformation, [mbOK], 0);

end;

procedure TFiring.FormCreate(Sender: TObject);
begin
  cxComboBox1.ItemIndex := 0;
  cxButton1.Enabled := (caZpDelSotr in ZpUser.UserAccsess);
  cxButton2.Enabled := (caZpPomUvoln in ZpUser.UserAccsess);
  qrSp.Open;
  TIntegerField(qrSp.FieldByName('KOD_DISCHARGE')).DisplayWidth:=4;
end;

procedure TFiring.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  AFont.Color := clRed
end;

procedure TFiring.cxButton3Click(Sender: TObject);
var s:string;
begin
  qrErrors.Close;
  qrErrors.SelectSQL.Text := 'select * from zp_check_fire(:kod_dk, :dater)';
  qrErrors.Params.ByName['kod_dk'].AsDouble := Kod_Dk;
  qrErrors.Params.ByName['dater'].AsDateTime := DateEdit1.Date;
  qrErrors.Open;

    try
      with GetBPOSMovingSoap(true) do begin
         wStr:=GetNumbersOfActiveProcessesWhereUserByLinkIsSenderOrReceiverAsString(Kod_Dk);
         s:=Utf8ToAnsi(wStr);
         if s<>'' then begin
           ShowMessage('По сотруднику есть незавершённые бизнес-процессы по перемещению OC в 1С-веб интерфейсе! Номера процессов :'#13#10+s);
           exit;
         end;
      end;
    except
      on E:Exception do begin
         ShowMessage('Возникла ошибка в системе интеграции:'#13#10+E.Message);
         exit;
      end;
    end;
  //убрал вызов так как учет ведется в Мани говорил с Куликом( Дереза Д. 17.06.2011)
  {if DM.IsRussiaReg(aKod_R) then begin
     try
       with GetReportInventarCardOSSoap(true) do
        if HasMOL_OS_ByMoneyCode(Kod_Dk) then begin 
           MessageDlg('Невозможно уволить сотрудника т.к. на нём имеются основные средства в 1С V8 УПП Рус!',mtError,[mbCancel],0);
           exit;
        end;
     except
       on E: Exception do begin
        MessageDlg('Не удалось проверить наличие ОС в 1С V8 УПП Рус!'#13#10+E.Message,mtError,[mbCancel],0);
        exit;
       end;
     end;
  end; }

end;

end.
