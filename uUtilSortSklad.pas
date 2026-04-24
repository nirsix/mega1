// ------------------------------------
// project : Megapolis Money
// --
// module  : вспомогательные процедуры для сортировочного склада
// author  : Бехтеренко Брий (byv@megapol.zp.ua)
// --
// created       : 19.09.2003
// last modified :
// ------------------------------------

unit uUtilSortSklad;
interface

uses
  Windows,
  sysutils,
  forms, //for application.mainform
  controls,

  uTypes,
  uUtils,
  uConst,
  uTAUtils,
  uMegaIntf,
  pFIBProps;

type
 TSortNakl = record
              RecID  : integer;
              BaseID : integer;
              DocNumber : integer;
              srtRecid : integer;
              srtBaseid: integer;
            end;
type
    TSortNaklArray = array of TSortNakl;
  function IsSortSklad:boolean; // Проверка наличия сортировочного склада.

   // Проверка партии на проведение.
  function IsPartyProv( ADate :TDate; aBaseID,aCFO, LotNumber, lotkind : integer ) : boolean;
  function IsPartyProv2( ADate :TDate; aBaseID,aCFO, LotNumber, lotkind : integer ) : boolean; overload;
  function IsPartyProv2(Nakl_Recid, Nakl_Baseid : integer; ADate :TDate ) : boolean; overload;
  function IsFirstSortNakl(ADate :TDate; aBaseID, LotNumber : integer; alphaID :integer) : boolean;
  function IsFirstSortNaklOld(ADate :TDate; aBaseID, LotNumber : integer) : boolean;
  // проставляем SORT_LOT.IS_PROV
  procedure  MakePartyProv  (Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer; Nakl_RecId,Nakl_BaseID : integer);
  procedure  MakePartyUnProv(Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer);

  function  GetSortNakl(Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer; alphaID :integer ) : TSortNakl;
  function  GetSortNaklArray(Tran : TMegaTransaction;  ADate :TDate; aBaseID, LotNumber : integer) : TSortNaklArray;
  function  GetSortNaklOld( ADate :TDate; aBaseID, LotNumber : integer) : TSortNakl;
  function  GetSchetDelay : TTime;
  function  CanConvertSchet(aRecID, aBaseID : integer) : boolean;
  function  GetSortLot_PdvNakl ( ADate :TDate; aBaseID, LotNumber : integer ) : string;
  function  CheckSortLot_PdvNakl ( ADate :TDate; aBaseID, LotNumber : integer ) : boolean;
  function  GetMobPacketStatus : integer;
  procedure SetMobPacketStatus (Status : integer);
  function  CanDoOtkat : boolean;
  Procedure MakeLinkDoc(Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer; Nakl_RecID, Nalk_BaseID : integer);
  Procedure MakeLinkDocNew(Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer; Nakl_RecID, Nalk_BaseID : integer; alphaID :integer );
  Procedure BlockSortNakl (Tran : TMegaTransaction; Nakl_RecID, Nalk_BaseID : integer);
  function  GetUnProvNakl (Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer ) : string;
  function  GetUnProvTTNPlanNakl(Tran : TMegaTransaction; ADate :TDate; aBaseID, aNumber : integer ) : string;
  function  IsNaklInSortParty ( Nakl_RecID, Nalk_BaseID : integer) : string;
  function IsSortNakl ( Nakl_RecID, Nalk_BaseID : integer) : integer;
  function  CheckMinSum(Tran : TMegaTransaction; ADate :TDate; aBaseID, aNumber : integer) : string;
  //проверка на фиксацию в ЕГАИС
  function  GetCheckEGAIS (Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer ) : string;
  function  CheckCntPerWeek(Tran : TMegaTransaction;  aRecid,aBaseID : integer ) : integer;
Var
 ASort_Nakl_RecID,
 ASort_Nakl_BaseID,ADocNumber : integer;


// SortNakl : TSortNakl;

implementation
uses uMegaDSSortingLot;

function IsSortSklad:boolean;
const
 sQuerytext = ' SELECT SBP.PARAMVALUE FROM SYS_BASE_PARAMS SBP '#13#10  +
              ' where sbp.paramname=''SORT_SKLAD'' '#13#10+
              ' ';
var
  q: TMegaQuery;
  LocalTransaction: TMegaTransaction;
begin
  LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
  q:= TMegaQuery.Create(Application.MainForm);
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;
    MegaExecQuery(q);

   try
    Result := q.FieldByName('PARAMVALUE').AsInteger = 1;
   except
    Result := False;
   end;
  finally
    q.Free;
    LocalTransaction.Free;
  end;
end;

function  CheckMinSum(Tran : TMegaTransaction; ADate :TDate; aBaseID, aNumber : integer) : string;
const
sQueryText =
'  select '#13#10+
'   tpp.plandate plandate, '#13#10+
'   tpp.plannumber plannumber, '#13#10+
'   tpp.Baseid BASEID,  '#13#10+
'   dn.DOCNUMBER,dn.summa '#13#10+
' from TTN_PLAN_POSITIONS tpp   '#13#10+
' left join doc_nakl dn on dn.RECID = tpp.NAKL_RECID and dn.BASEID = tpp.NAKL_BASEID '#13#10+
' left join delivery_location dl on (dl.formtype=1 and dl.docrecno=dn.recid and dl.baseid=dn.baseid) '#13#10+
' where tpp.plandate =   :PLANDATE '#13#10+
'   and tpp.plannumber = :PLANNUMBER '#13#10+
'   and tpp.baseid =     :BASEID  '#13#10+
'   and not dn.RECID is NULL  '#13#10+
'   and ((SELECT RESULT FROM CHECK_DOC_MIN_SUM(dn.dk_to,dn.operdate,dl.outlet_recid,dl.outlet_baseid,dn.group_oper,dn.kod_oper,null,null,null,tpp.plandate,tpp.plannumber,tpp.baseid)) = 1)';

var q: TMegaQuery;
begin
 Result := '';
 if IntfMegaDBCommon.GetParam('CHECK_MIN_SUM_PLAN', '0')='1' then
 begin
   q:= TMegaQuery.Create(Application.MainForm);
    try
      q.Database:= IntfDBProvider.GetDB;
      q.Transaction:=Tran;
      q.SQL.Text:=sQueryText;

      q.ParamByName('PLANDATE').AsDateTime:=ADate;
      q.ParamByName('PLANNUMBER').AsInteger := aNumber;
      q.ParamByName('BASEID').AsInteger := aBaseID;

      MegaExecQuery(q);
      while not q.EOF do
      begin
        if Result <>'' then
          Result := Result +', ';
        Result := Result + q.FN('DOCNUMBER').AsString;
        q.Next;
      end;
    finally
      q.Free;
    end;
 end
end;


function IsPartyProv( ADate :TDate; aBaseID,aCFO, LotNumber, lotkind : integer ) : boolean;
const
 sQuerytext = ' select NAKL_RECID from SORT_LOT  '+
              ' where LOTDATE = :LOTDATE and LOTNUMBER = :LOTNUMBER '+
              ' and BASEID=:BASEID '+
              ' and CFO=:CFO '+
              ' and kind=:lotkind '+
              '';
var
  q: TMegaQuery;
  LocalTransaction: TMegaTransaction;
begin
  LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
  q:= TMegaQuery.Create(Application.MainForm);
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;

    MegaQueryParam(q,'LOTDATE').AsDateTime:=ADate;
    MegaQueryParam(q,'LOTNUMBER').AsInteger := LotNumber;
    MegaQueryParam(q,'BASEID').AsInteger := aBaseID;
    MegaQueryParam(q,'CFO').AsInteger := aCFO;
    MegaQueryParam(q,'lotkind').AsInteger := lotkind;
    MegaExecQuery(q);

    Result := not (q.Fields[0].asInteger = 0 );

  finally
    q.Free;
    LocalTransaction.Free;
  end;

end;

function GetSortNakl(Tran : TMegaTransaction;  ADate :TDate; aBaseID, LotNumber : integer; alphaID :integer ) : TSortNakl;
const
 sQuerytext = ' select sl.NAKL_RECID,sl.NAKL_BASEID,dn.docnumber,sl.recid,sl.baseid from SORT_LOT sl '+
              ' left join DOC_NAKL DN on (dn.recid=sl.nakl_recid and dn.baseid=sl.nakl_baseid)'+
              ' where sl.LOTDATE = :LOTDATE and sl.LOTNUMBER = :LOTNUMBER '+
              ' and sl.BASEID=:BASEID '+
              '';
 sQueryTextNew =  'select dn.recid NAKL_RECID,dn.baseid NAKL_BASEID,dn.docnumber,sl.recid,sl.baseid '+
 ' from sort_lot sl '+
 ' left join GET_LINKED_DOCS_NEW(31,sl.recid,sl.baseid,null,null) gl on (1=1) '+
 ' left join doc_nakl dn on (dn.recid=gl.linked_recid and dn.baseid=gl.linked_baseid and gl.linked_formtype=1 '+
 ' and  exists (select * from alpha_master am where am.baseid=:baseid and am.id=:id '+
 ' and ((am.group_oper=dn.group_oper and am.kod_oper = dn.kod_oper) '+
 ' or (am.pp_group_oper=dn.group_oper and am.pp_kod_oper = dn.kod_oper) ))) '+
 ' where sl.lotdate= :LOTDATE and sl.lotnumber=:LOTNUMBER and sl.baseid = :BASEID ';
var
  q: TMegaQuery;
  //LocalTransaction: TMegaTransaction;
begin
  //LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
  q:= TMegaQuery.Create(Application.MainForm);
  try
    //LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    //LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=Tran;

    q.SQL.Text:=sQueryTextNew;

    MegaQueryParam(q,'LOTDATE').AsDateTime:=ADate;
    MegaQueryParam(q,'LOTNUMBER').AsInteger := LotNumber;
    MegaQueryParam(q,'BASEID').AsInteger := aBaseID;
    MegaQueryParam(q,'ID').AsInteger := alphaID;
    MegaExecQuery(q);

//  Пока делаем возврат параметров так.
    ASort_Nakl_RecID  := q.FieldByName('NAKL_RECID').asInteger;
    ASort_Nakl_BaseID := q.FieldByName('NAKL_BASEID').asInteger;
    ADocNumber := q.FieldByName('docnumber').asInteger;
    Result.RecID := q.FieldByName('NAKL_RECID').asInteger;
    Result.BaseID:= q.FieldByName('NAKL_BASEID').asInteger;
    Result.DocNumber:= q.FieldByName('docnumber').asInteger;
    Result.srtRecid := q.FieldByName('recid').asInteger;
    Result.srtBaseid := q.FieldByName('baseid').asInteger;
  finally
    q.Free;
    //LocalTransaction.Free;
  end;
end;

function GetSortNaklArray(Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer ) : TSortNaklArray;
const
 sQueryTextNew =  'select dn.recid NAKL_RECID,dn.baseid NAKL_BASEID,dn.docnumber,sl.recid,sl.baseid '+
 ' from sort_lot sl '+
 ' left join GET_LINKED_DOCS_NEW(31,sl.recid,sl.baseid,null,null) gl on (1=1) '+
 ' left join doc_nakl dn on (dn.recid=gl.linked_recid and dn.baseid=gl.linked_baseid and gl.linked_formtype=1) '+
 ' where sl.lotdate= :LOTDATE and sl.lotnumber=:LOTNUMBER and sl.BASEID=:BASEID ';
var
  q: TMegaQuery;
  //LocalTransaction: TMegaTransaction;
  sortNakl:TSortNakl;
  n:integer;
begin
//  LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
  q:= TMegaQuery.Create(Application.MainForm);
  try
    //LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    //LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=Tran;

    q.SQL.Text:=sQueryTextNew;

    MegaQueryParam(q,'LOTDATE').AsDateTime:=ADate;
    MegaQueryParam(q,'LOTNUMBER').AsInteger := LotNumber;
    MegaQueryParam(q,'BASEID').AsInteger := aBaseID;
    MegaExecQuery(q);
    n:=0;
    SetLength(result, n);

    while not q.eof do
    begin
       sortNakl.RecID := q.FieldByName('NAKL_RECID').asInteger;
       sortNakl.BaseID:= q.FieldByName('NAKL_BASEID').asInteger;
       sortNakl.DocNumber:= q.FieldByName('docnumber').asInteger;
       sortNakl.srtRecid := q.FieldByName('recid').asInteger;
       sortNakl.srtBaseid := q.FieldByName('baseid').asInteger;
       inc(n);
       SetLength(result, n);
       result[n-1]:=sortNakl;
       q.next;
    end;
  finally
    q.Free;
    //LocalTransaction.Free;
  end;
end;

function GetSortNaklOld( ADate :TDate; aBaseID, LotNumber : integer ) : TSortNakl;
const
 sQuerytext = ' select sl.NAKL_RECID,sl.NAKL_BASEID,dn.docnumber,sl.recid,sl.baseid from SORT_LOT sl '+
              ' left join DOC_NAKL DN on (dn.recid=sl.nakl_recid and dn.baseid=sl.nakl_baseid)'+
              ' where sl.LOTDATE = :LOTDATE and sl.LOTNUMBER = :LOTNUMBER '+
              ' and sl.BASEID=:BASEID '+
              '';
 sQueryTextNew =  'select dn.recid NAKL_RECID,dn.baseid NAKL_BASEID,dn.docnumber,sl.recid,sl.baseid '+
 ' from sort_lot sl '+
 ' left join GET_LINKED_DOCS_NEW(31,sl.recid,sl.baseid,null,null) gl on (1=1) '+
 ' left join doc_nakl dn on (dn.recid=gl.linked_recid and dn.baseid=gl.linked_baseid and gl.linked_formtype=1) '+
 ' where sl.lotdate= :LOTDATE and sl.lotnumber=:LOTNUMBER and sl.baseid = :BASEID '+
 ' and  exists (select * from alpha_master am where am.baseid=:baseid and am.id=:id '+
 ' and ((am.group_oper=dn.group_oper and am.kod_oper = dn.kod_oper) '+
 ' or (am.pp_group_oper=dn.group_oper and am.pp_kod_oper = dn.kod_oper) ))';
var
  q: TMegaQuery;
  LocalTransaction: TMegaTransaction;
begin
  LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
  q:= TMegaQuery.Create(Application.MainForm);
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;

    MegaQueryParam(q,'LOTDATE').AsDateTime:=ADate;
    MegaQueryParam(q,'LOTNUMBER').AsInteger := LotNumber;
    MegaQueryParam(q,'BASEID').AsInteger := aBaseID;
//    MegaQueryParam(q,'ID').AsInteger := alphaID;
    MegaExecQuery(q);

//  Пока делаем возврат параметров так.
    ASort_Nakl_RecID  := q.FieldByName('NAKL_RECID').asInteger;
    ASort_Nakl_BaseID := q.FieldByName('NAKL_BASEID').asInteger;
    ADocNumber := q.FieldByName('docnumber').asInteger;
    Result.RecID := q.FieldByName('NAKL_RECID').asInteger;
    Result.BaseID:= q.FieldByName('NAKL_BASEID').asInteger;
    Result.DocNumber:= q.FieldByName('docnumber').asInteger;
    Result.srtRecid := q.FieldByName('recid').asInteger;
    Result.srtBaseid := q.FieldByName('baseid').asInteger;
  finally
    q.Free;
    LocalTransaction.Free;
  end;
end;

function GetSchetDelay : TTime;
const
 sQueryText = ' SELECT SBP.PARAMVALUE FROM SYS_BASE_PARAMS SBP '#13#10  +
              ' where sbp.paramname=''SCHET_DELAY'' '#13#10+
              ' ';
var
  q: TMegaQuery;
  LocalTransaction: TMegaTransaction;
//  Delay_Min  : TTime;
begin
  LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
  q:= TMegaQuery.Create(Application.MainForm);
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;
    MegaExecQuery(q);

   try
    Result := StrToDateTime(q.FieldByName('PARAMVALUE').AsString);
   except
    Result := StrToTime(aaDelayMinutes);
   end;
  finally
    q.Free;
    LocalTransaction.Free;
  end;

end;

function CanConvertSchet(aRecID, aBaseID : integer) : boolean;
const
 sQueryText = ' SELECT SBP.PARAMVALUE FROM SYS_BASE_PARAMS SBP '#13#10  +
              ' where sbp.paramname=''SCHET_DELAY'' '#13#10+
              ' ';
 sQueryText1= ' select max(DATE_TIME) from sys_protokol sp '#13#10  +
              ' where sp.table_name=''DOC_SCHET'' '#13#10  +
              ' and ( sp.change_type=''I'' or (sp.change_type=''U'' )) '#13#10  +
              ' and sp.date_time between :DT1 and :DT2 '#13#10  +
              ' and ( sp.new_id like :RECID and sp.new_id like :BASEID_STR ) '#13#10  +
              ' and sp.user_name=''MOB_PACKET'' '#13#10+
              ' and sp.baseid = :BASEID '#13#10 +
              '';
var
  q: TMegaQuery;
  LocalTransaction: TMegaTransaction;
  Delay_Min  : TTime;
begin
  LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
  q:= TMegaQuery.Create(Application.MainForm);
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;
    MegaExecQuery(q);

   try
    Delay_Min  := StrToDateTime(q.FieldByName('PARAMVALUE').AsString);
   except
    Delay_Min := StrToTime(aaDelayMinutes);
   end;

    if (IntfIBCommon.GetServerDateTime-Delay_Min)<(IntfIBCommon.GetServerDate+StrToDateTime(IntfMegaDBCommon.GetParam('TIME_NOT_CHECK_DELAY', '16:00:00')) {StrToDateTime('15:00:00')})
     then // Проверка на выход за время 16:00
      begin
       // Выборка из Sys_Protokol
       q.Close;
       q.SQL.Text:=sQueryText1;
       MegaQueryParam(q,'BASEID').AsInteger :=aBaseID;
       MegaQueryParam(q,'DT1').AsDateTime :=IntfIBCommon.GetServerDate;
       MegaQueryParam(q,'DT2').AsDateTime :=IntfIBCommon.GetServerDate+1;
       MegaQueryParam(q,'RECID').AsString :=IntToStr(aRecID)+'|%';
       MegaQueryParam(q,'BASEID_STR').AsString :='%|'+IntToStr(aBaseID);
       MegaExecQuery(q);

       if (q.FieldByName('MAX').AsDateTime+Delay_Min)>IntfIBCommon.GetServerDateTime then Result:=False
        else Result := True;
      end
     else Result := True;

  finally
    q.Free;
    LocalTransaction.Free;
  end;

end;

function GetSortLot_PdvNakl ( ADate :TDate; aBaseID, LotNumber : integer ) : string;
const
 sQueryText = ' select slp.NAKL_RECID,slp.NAKL_BASEID, '#13#10  +
              '       dn.docnumber, '#13#10  +
              '       dn.operdate '#13#10 +
              ' from sort_lot_positions slp '#13#10  +
              ' inner join doc_nakl dn on (dn.recid=slp.nakl_recid and dn.baseid=slp.nakl_baseid) '#13#10  +
              ' inner join pdv_nakl pn on (pn.nakl_recid=dn.recid and pn.nakl_baseid=dn.baseid) '#13#10  +
              ' where slp.lotdate= :LOTDATE and slp.lotnumber=:LOTNUMBER '#13#10  +
              ' and slp.baseid=:BASEID '#13#10  +
              ' and ( myround(dn.summa,0.001)<> myround(pn.summa,0.001)) '#13#10+
              ' ';
var
  q: TMegaQuery;
  LocalTransaction: TMegaTransaction;
begin
 LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
 q:= TMegaQuery.Create(Application.MainForm);
 Result := '';
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;

    q.ParamByName('LOTDATE').AsDateTime:=ADate;
    q.ParamByName('LOTNUMBER').AsInteger := LotNumber;
    q.ParamByName('BASEID').AsInteger := aBaseID;

    MegaExecQuery(q);

    while not q.EOF do
     begin
      if Result<>'' then Result := Result+', '+ q.FieldByName('docnumber').AsString
       else Result := Result+ q.FieldByName('docnumber').AsString;
      q.Next;
     end;


  finally
    q.Free;
    LocalTransaction.Free;
  end;


end;

function CheckSortLot_PdvNakl ( ADate :TDate; aBaseID, LotNumber : integer ) : boolean;
const
 sQueryText = ' delete from pdv_nakl where exists  ( '#13#10  +
              ' select * from sort_lot_positions slp '#13#10  +
              ' inner join doc_nakl dn on (dn.recid=slp.nakl_recid and dn.baseid=slp.nakl_baseid) '#13#10  +
              ' inner join pdv_nakl pn on (pn.nakl_recid=dn.recid and pn.nakl_baseid=dn.baseid) '#13#10  +
              ' where slp.lotdate= :LOTDATE and slp.lotnumber=:LOTNUMBER '#13#10  +
              ' and slp.baseid=:BASEID '#13#10  +
              ' and ( myround(dn.summa,0.001)<> myround(pn.summa,0.001)) '#13#10+
              ' ) ';
 sMsg       = 'Не соответвие накладных налоговым накладным! № ';
 sMsg_1     = #13#10+'Удалить налоговые накладные? ';
var s, msg : string;
    q: TMegaQuery;
    LocalTransaction: TMegaTransaction;
begin
 Result := True;
 LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
 q:= TMegaQuery.Create(Application.MainForm);

 s:= GetSortLot_PdvNakl(ADate, aBaseID, LotNumber);
 if s<>'' then
  begin
    msg := sMsg + s + sMsg_1;
    if IDYES=MessageBox(Application.Handle,PChar(msg),'Внимание!',MB_YESNO+MB_ICONERROR+MB_APPLMODAL)
     then  begin
            try
              LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
              LocalTransaction.StartTransaction;
              q.Database:= IntfDBProvider.GetDB;
              q.Transaction:=LocalTransaction;

              q.SQL.Text:=sQueryText;
              q.ParamByName('LOTDATE').AsDateTime:=ADate;
              q.ParamByName('LOTNUMBER').AsInteger := LotNumber;
              q.ParamByName('BASEID').AsInteger := aBaseID;

              MegaExecQuery(q);
            finally
              q.Free;
              LocalTransaction.Free;
            end;

            Result := true;
           end
   else Result := false;

  end;
end;

function  GetMobPacketStatus : integer;
const
 sQueryText = ' SELECT SBP.PARAMVALUE FROM SYS_BASE_PARAMS SBP '#13#10  +
              ' where sbp.paramname=''MOBPACKETFORBIDDEN'' '#13#10+
              ' ';
var
  q: TMegaQuery;
  LocalTransaction: TMegaTransaction;
begin
 LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
 q:= TMegaQuery.Create(Application.MainForm);

  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;

    MegaExecQuery(q);

    Result := q.FieldByName('PARAMVALUE').Asinteger;

  finally
    q.Free;
    LocalTransaction.Free
  end;

end;

procedure SetMobPacketStatus (Status : integer);
const
 sQueryText = ' update SYS_BASE_PARAMS  '#13#10  +
              ' set paramvalue=:VALUE, PARAMDESCR = ''NOW'' '#13#10  +
              ' where paramname=''MOBPACKETFORBIDDEN'' '#13#10+
              ' ';
var
  q: TMegaQuery;
  LocalTransaction: TMegaTransaction;
begin
 LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
 q:= TMegaQuery.Create(Application.MainForm);

  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;

    q.ParamByName('VALUE').asInteger :=Status;

    MegaExecQuery(q);

  finally
    q.Free;
    LocalTransaction.Free
  end;
end;

function CanDoOtkat : boolean;
const
 sQueryText = ' SELECT su.KOD_DK, (SELECT DOLJN '#13#10  +
              ' FROM ZP_PERSONAL ZP where zp.KOD_DK=su.KOD_DK and zp.DATER= '#13#10  +
              '(SELECT max(DATER) FROM ZP_PERSONAL ZP1 where zp1.KOD_DK=su.KOD_DK)) DOLJN '#13#10  +
              ' FROM SYS_USERS su where su.NAME=:USERNAME '#13#10  +
              ' ';
var q: TMegaQuery;
    LocalTransaction: TMegaTransaction;
begin
  LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
  q:= TMegaQuery.Create(Application.MainForm);
  Result := false;
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;

    q.ParamByName('USERNAME').AsString :=IntfMegaAccessManager.GetUserName;

    MegaExecQuery(q);
    if (q.FieldByName('DOLJN').Asinteger = 1323) or ( q.FieldByName('DOLJN').Asinteger = 1327)
        then Result := True;
//    Result := ( q.FieldByName('DOLJN').Asinteger = 1323 );   { старший оператор или старший бухгалтер }
  finally
    q.Free;
    LocalTransaction.Free
  end;

end;

function IsPartyProv2( ADate :TDate; aBaseID,aCFO, LotNumber, lotkind : integer ) : boolean;
const
  sQueryText = ' select sl.is_prov from sort_lot sl '#13#10  +
               ' where sl.lotdate = :LOTDATE '#13#10  +
               ' and sl.lotnumber = :LOTNUMBER '#13#10  +
               ' and sl.CFO    =    :CFO '#13#10   +
               ' and sl.baseid =    :BASEID '#13#10 +
               ' and sl.kind =      :lotkind '#13#10 ;
var
  q: TMegaQuery;
  LocalTransaction: TMegaTransaction;
begin
 LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
 q:= TMegaQuery.Create(Application.MainForm);
 Result := false;
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;

    q.ParamByName('LOTDATE').AsDateTime:=ADate;
    q.ParamByName('LOTNUMBER').AsInteger := LotNumber;
    q.ParamByName('BASEID').AsInteger := aBaseID;
    q.ParamByName('CFO').AsInteger := aCFO;
    q.ParamByName('lotkind').AsInteger := lotkind;

    MegaExecQuery(q);
    if not (q.Fields[0].asInteger = 0 ) then Result := True;
  finally
    q.Free;
    LocalTransaction.Free
  end;
end;

function IsPartyProv2(Nakl_Recid, Nakl_Baseid : integer; ADate :TDate ) : boolean;
const sQueryText= ' select sl.is_prov '#13#10  +
                  '  from sort_lot_positions slp '#13#10  +
                  '  inner join sort_lot sl on (sl.baseid=slp.baseid and sl.lotdate=slp.lotdate and sl.lotnumber=slp.lotnumber) '#13#10  +
                  ' where slp.nakl_recid = :NAKL_RECID '#13#10  +
                  '  and slp.nakl_baseid = :NAKL_BASEID '#13#10  +
                  '  and slp.lotdate = :LOTDATE '#13#10;
var q: TMegaQuery;
    LocalTransaction: TMegaTransaction;
begin
 LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
 q:= TMegaQuery.Create(Application.MainForm);
 Result := false;
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;

    q.ParamByName('LOTDATE').AsDateTime:=ADate;
    q.ParamByName('NAKL_RECID').AsInteger := Nakl_Recid;
    q.ParamByName('NAKL_BASEID').AsInteger := Nakl_Baseid;

    MegaExecQuery(q);
    if not (q.Fields[0].asInteger = 0 ) then Result := True;
  finally
    q.Free;
    LocalTransaction.Free
  end;
end;

procedure  MakePartyProv  (Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer; Nakl_RecId,Nakl_BaseID : integer);
const sQueryText= 'update sort_lot sl '#13#10  +
                  ' set sl.is_prov = :PROV '#13#10 ;
 sQueryText_Nakl= ' ,NAKL_RECID = :NAKL_RECID, NAKL_BASEID = :NAKL_BASEID ';
 sQueryText_Tail= ' where sl.lotdate = :LOTDATE '#13#10  +
                  '  and sl.lotnumber = :LOTNUMBER '#13#10  +
                  '  and sl.baseid =    :BASEID '#13#10 ;
 sQueryText_StateNakl = 'update doc_nakl dn set state=1 where exists (select * from sort_lot_positions slp '+
' where slp.lotdate=:lotdate and slp.lotnumber=:lotnumber and slp.baseid=:baseid and slp.nakl_recid=dn.recid '+
' and slp.nakl_baseid=dn.baseid and 1=(select kind from sort_lot sl where sl.lotdate=:lotdate and sl.lotnumber=:lotnumber and sl.baseid=:baseid )) ';
var q: TMegaQuery;
begin
 q:= TMegaQuery.Create(Application.MainForm);
  try
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=Tran;

    q.Close;
    //ставим на накладных state=1
    q.SQL.Text:= sQueryText_StateNakl;
    q.ParamByName('LOTDATE').AsDateTime:=ADate;
    q.ParamByName('LOTNUMBER').AsInteger := LotNumber;
    q.ParamByName('BASEID').AsInteger := aBaseID;
    MegaExecQuery(q);

    if Nakl_RecId=0 then q.SQL.Text:=sQueryText + sQueryText_Tail
     else q.SQL.Text:=sQueryText + sQueryText_Nakl + sQueryText_Tail;

    q.ParamByName('PROV').AsInteger:=1;
    q.ParamByName('LOTDATE').AsDateTime:=ADate;
    q.ParamByName('LOTNUMBER').AsInteger := LotNumber;
    q.ParamByName('BASEID').AsInteger := aBaseID;
    if Nakl_RecId<>0 then
     begin
      q.ParamByName('NAKL_RECID').AsInteger := Nakl_RecID;
      q.ParamByName('NAKL_BASEID').AsInteger:= Nakl_BaseID;
     end;

    MegaExecQuery(q);
    q.Close;


  finally
    q.Free;
  end;

end;
procedure MakePartyUnProv(Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer);
const sQueryText= 'update sort_lot sl '#13#10  +
                  ' set   sl.is_prov = :PROV '#13#10  +
                  ' where sl.lotdate = :LOTDATE '#13#10  +
                  '  and sl.lotnumber = :LOTNUMBER '#13#10  +
                  '  and sl.baseid =    :BASEID '#13#10 ;
var q: TMegaQuery;
begin

 q:= TMegaQuery.Create(Application.MainForm);
 q.Options:=[qoStartTransaction];
  try
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=Tran;

    q.SQL.Text:=sQueryText;

    q.ParamByName('PROV').AsInteger:=0;
    q.ParamByName('LOTDATE').AsDateTime:=ADate;
    q.ParamByName('LOTNUMBER').AsInteger := LotNumber;
    q.ParamByName('BASEID').AsInteger := aBaseID;

    MegaExecQuery(q);
    q.Close;
  finally
    q.Free;
  end;
end;

function IsFirstSortNakl(ADate :TDate; aBaseID, LotNumber : integer; alphaID :integer) : boolean;
const sQueryText = ' select sl.NAKL_RECID from sort_lot sl '#13#10  +
                   ' where sl.lotdate = :LOTDATE '#13#10  +
                   ' and sl.lotnumber = :LOTNUMBER '#13#10  +
                   ' and sl.baseid =    :BASEID '#13#10 ;

var q: TMegaQuery;
    LocalTransaction: TMegaTransaction;
    MainSortNakl : TSortNakl;
begin
 LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
 q:= TMegaQuery.Create(Application.MainForm);
 Result := false;
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;

    q.ParamByName('LOTDATE').AsDateTime:=ADate;
    q.ParamByName('LOTNUMBER').AsInteger := LotNumber;
    q.ParamByName('BASEID').AsInteger := aBaseID;

    //MegaExecQuery(q);

    MainSortNakl := GetSortNakl(LocalTransaction,ADate, aBaseID, LotNumber,alphaID);
    if (MainSortNakl.Recid<>0) then Result := true;
    //if (q.Fields[0].asInteger <> 0 ) then Result := true;
  finally
    q.Free;
    LocalTransaction.Free;
  end;

end;

function IsFirstSortNaklOld(ADate :TDate; aBaseID, LotNumber : integer) : boolean;
const sQueryText = ' select sl.NAKL_RECID from sort_lot sl '#13#10  +
                   ' where sl.lotdate = :LOTDATE '#13#10  +
                   ' and sl.lotnumber = :LOTNUMBER '#13#10  +
                   ' and sl.baseid =    :BASEID '#13#10 ;

var q: TMegaQuery;
    LocalTransaction: TMegaTransaction;
    MainSortNakl : TSortNakl;
begin
 LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
 q:= TMegaQuery.Create(Application.MainForm);
 Result := false;
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;

    q.ParamByName('LOTDATE').AsDateTime:=ADate;
    q.ParamByName('LOTNUMBER').AsInteger := LotNumber;
    q.ParamByName('BASEID').AsInteger := aBaseID;

    MegaExecQuery(q);

    //MainSortNakl := GetSortNakl(ADate, aBaseID, LotNumber,alphaID);
    //if (MainSortNakl.Recid<>0) then Result := true;
    if (q.Fields[0].asInteger <> 0 ) then Result := true;
  finally
    q.Free;
    LocalTransaction.Free;
  end;

end;
Procedure MakeLinkDoc(Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer; Nakl_RecID, Nalk_BaseID : integer);
const sQueryText= ' insert into link_doc_opl  '#13#10  +
                  ' (PARENT_RECID, PARENT_BASEID, OPL_RECID, OPL_BASEID, OPL_FORM_TYPE) '#13#10+
                  ' values '#13#10  +
                  ' (:PARENT_RECID, :PARENT_BASEID, :OPL_RECID, :OPL_BASEID,1) '#13#10+
                  ' ';
const sQueryTextNew= ' execute procedure MAKE_DOC_LINKED(:PARENT_RECID, :PARENT_BASEID, :PARENT_FORM_TYPE, :DOC_RECID, :DOC_BASEID,'#13#10+
                  ' :DOC_FORM_TYPE);';

var q: TMegaQuery;
  MainSortNakl : TSortNakl;
begin
 q:= TMegaQuery.Create(Application.MainForm);
  try
    MainSortNakl := GetSortNaklOld(ADate, aBaseID, LotNumber);
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=Tran;

    q.SQL.Text:=sQueryText;

    q.ParamByName('PARENT_RECID').AsInteger := MainSortNakl.RecID;
    q.ParamByName('PARENT_BASEID').AsInteger := MainSortNakl.BaseID;
    q.ParamByName('OPL_RECID').AsInteger  := Nakl_RecID;
    q.ParamByName('OPL_BASEID').AsInteger := Nalk_BaseID;
    //q.ParamByName('OPL_FORM_TYPE').AsInteger := 1;
    MegaExecQuery(q);
  finally
    q.Free;
  end;

end;

Procedure MakeLinkDocNew(Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer; Nakl_RecID, Nalk_BaseID : integer; alphaID :integer);
const sQueryText= ' insert into link_doc_opl  '#13#10  +
                  ' (PARENT_RECID, PARENT_BASEID, OPL_RECID, OPL_BASEID, OPL_FORM_TYPE) '#13#10+
                  ' values '#13#10  +
                  ' (:PARENT_RECID, :PARENT_BASEID, :OPL_RECID, :OPL_BASEID,1) '#13#10+
                  ' ';
const sQueryTextNew= ' execute procedure MAKE_DOC_LINKED(:PARENT_RECID, :PARENT_BASEID, :PARENT_FORM_TYPE, :DOC_RECID, :DOC_BASEID,'#13#10+
                  ' :DOC_FORM_TYPE);';

var q: TMegaQuery;
  MainSortNakl : TSortNakl;
begin
 q:= TMegaQuery.Create(Application.MainForm);
  try
    MainSortNakl := GetSortNakl(Tran,ADate, aBaseID, LotNumber,alphaID);
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=Tran;

    q.SQL.Text:=sQueryTextNew;//sQueryText;

    q.ParamByName('PARENT_RECID').AsInteger := MainSortNakl.srtRecID;
    q.ParamByName('PARENT_BASEID').AsInteger := MainSortNakl.srtBaseID;
    q.ParamByName('PARENT_FORM_TYPE').AsInteger := 31;
    q.ParamByName('DOC_RECID').AsInteger  := Nakl_RecID;
    q.ParamByName('DOC_BASEID').AsInteger := Nalk_BaseID;
    q.ParamByName('DOC_FORM_TYPE').AsInteger := 1;
    MegaExecQuery(q);
  finally
    q.Free;
  end;

end;

Procedure BlockSortNakl (Tran : TMegaTransaction; Nakl_RecID, Nalk_BaseID : integer);
const sQueryText = ' UPDATE DOC_NAKL '#13#10+
                   ' set STATE=21 '#13#10+
                   ' WHERE RECID= :RECID and BASEID=:BASEID'+
                   ' '#13#10 ;
var q: TMegaQuery;
begin
 q:= TMegaQuery.Create(Application.MainForm);
  try
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=Tran;

    q.SQL.Text:=sQueryText;

    q.ParamByName('RECID').AsInteger :=  Nakl_RecID;
    q.ParamByName('BASEID').AsInteger := Nalk_BaseID;
    MegaExecQuery(q);
  finally
    q.Free;
  end;

end;

function GetUnProvTTNPlanNakl(Tran : TMegaTransaction; ADate :TDate; aBaseID, aNumber : integer ) : string;
const
sQueryText =
' select                                                                            '#13#10+
'   tpp.plandate plandate,                                                          '#13#10+
'   tpp.plannumber plannumber,                                                      '#13#10+
'   tpp.Baseid BASEID,                                                              '#13#10+
'   dn.DOCNUMBER                                                                    '#13#10+
' from TTN_PLAN_POSITIONS tpp                                                       '#13#10+
' left join doc_nakl dn on dn.RECID = tpp.NAKL_RECID and dn.BASEID = tpp.NAKL_BASEID'#13#10+
' where tpp.plandate =   :PLANDATE                                                  '#13#10+
'   and tpp.plannumber = :PLANNUMBER                                                '#13#10+
'   and tpp.baseid =     :BASEID                                                    '#13#10+
'   and not dn.RECID is NULL                                                        '#13#10+
'   and ((SELECT STATUS FROM CHECK_PROV_DOC_NEW(1,dn.RECID,dn.BASEID)) = -1)';

{[gsa] 04.03.2019 блокировака для ТТН  блокирует возможность работы с ТТН проставляеться в ЕГАИС в отправку, настройки...}
sQueryTextMS =
' select                                                                            '#13#10+
'   tpp.plandate plandate,                                                          '#13#10+
'   tpp.plannumber plannumber,                                                      '#13#10+
'   tpp.Baseid BASEID,                                                              '#13#10+
'   dn.DOCNUMBER                                                                    '#13#10+
' from TTN_PLAN_POSITIONS tpp                                                       '#13#10+
' left join doc_nakl dn on dn.RECID = tpp.NAKL_RECID and dn.BASEID = tpp.NAKL_BASEID'#13#10+
' where tpp.plandate =   :PLANDATE                                                  '#13#10+
'   and tpp.plannumber = :PLANNUMBER                                                '#13#10+
'   and tpp.baseid =     :BASEID                                                    '#13#10+
'   and not dn.RECID is NULL                                                        '#13#10+
'   and ((SELECT STATUS FROM CHECK_PROV_DOC_NEW(1,dn.RECID,dn.BASEID)) = -1)        '#13#10+
{[gsa] 04.03.2019 блокировака для ТТН  блокирует возможность работы с ТТН проставляеться в ЕГАИС в отправку, настройки...}
'   and ((select status from CHECK_FIX_EGAIS_TTN(1,dn.RECID,dn.BASEID)) = -1)';

var q: TMegaQuery;
begin
 Result := '';
 q:= TMegaQuery.Create(Application.MainForm);
  try
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=Tran;

//    if IntfMegaDBCommon.GetCountry=iccRussia  then
//       q.SQL.Text:=sQueryTextMs
//    else
       q.SQL.Text:=sQueryText;

    q.ParamByName('PLANDATE').AsDateTime:=ADate;
    q.ParamByName('PLANNUMBER').AsInteger := aNumber;
    q.ParamByName('BASEID').AsInteger := aBaseID;

    MegaExecQuery(q);
    while not q.EOF do
    begin
      if Result <>'' then
        Result := Result +', ';
      Result := Result + q.FN('DOCNUMBER').AsString;
      q.Next;
    end;
  finally
    q.Free;
  end;
end;

function GetUnProvNakl(Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer ) : string;
const
sQueryText=
  ' select dn.docnumber, slp.*                                                           '#13#10+
  ' from sort_lot_positions slp                                                          '#13#10+
  ' left join doc_nakl dn on (slp.nakl_recid = dn.recid and slp.nakl_baseid = dn.baseid) '#13#10+
  ' where slp.lotdate = :LOTDATE                                                         '#13#10+
  '   and slp.lotnumber = :LOTNUMBER                                                     '#13#10+
  '   and slp.BASEID = :BASEID                                                           '#13#10+
  '   and ((SELECT STATUS FROM CHECK_PROV_NAKL(1,slp.nakl_recid, slp.nakl_baseid)) = -1 )';

sQueryTextMs=
  ' select dn.docnumber, slp.*                                                              '#13#10+
  ' from sort_lot_positions slp                                                             '#13#10+
  ' left join doc_nakl dn on (slp.nakl_recid = dn.recid and slp.nakl_baseid = dn.baseid)    '#13#10+
  ' where slp.lotdate = :LOTDATE                                                            '#13#10+
  '   and slp.lotnumber = :LOTNUMBER                                                          '#13#10+
  '   and slp.BASEID = :BASEID                                                                '#13#10+
  '   and ((SELECT STATUS FROM CHECK_PROV_NAKL_SORT(1,slp.nakl_recid, slp.nakl_baseid)) = -1 )';

var q: TMegaQuery;
begin
 Result := '';
 q:= TMegaQuery.Create(Application.MainForm);
  try
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=Tran;

    if IntfMegaDBCommon.GetCountry=iccRussia  then
       q.SQL.Text:=sQueryTextMs
    else
       q.SQL.Text:=sQueryText;

    q.ParamByName('LOTDATE').AsDateTime:=ADate;
    q.ParamByName('LOTNUMBER').AsInteger := LotNumber;
    q.ParamByName('BASEID').AsInteger := aBaseID;

    MegaExecQuery(q);
    while not q.EOF do
     begin
      if Result <>'' then Result := Result +', ' + q.Fields[0].AsString
       else Result := Result + q.Fields[0].AsString;
      q.Next;
     end;
  finally
    q.Free;
  end;
end;


function GetCheckEGAIS(Tran : TMegaTransaction; ADate :TDate; aBaseID, LotNumber : integer ) : string;
const
sQueryText=
  ' select dn.docnumber, slp.*                                                           '#13#10+
  ' from sort_lot_positions slp                                                          '#13#10+
  ' left join doc_nakl dn on (slp.nakl_recid = dn.recid and slp.nakl_baseid = dn.baseid) '#13#10+
  ' where slp.lotdate = :LOTDATE                                                         '#13#10+
  '   and slp.lotnumber = :LOTNUMBER                                                     '#13#10+
  '   and slp.BASEID = :BASEID                                                           '#13#10+
  '   and ((SELECT STATUS FROM CHECK_FIX_EGAIS(1,slp.nakl_recid, slp.nakl_baseid)) = -1 )';

sQueryTextMs=
  ' select dn.docnumber, slp.*                                                              '#13#10+
  ' from sort_lot_positions slp                                                             '#13#10+
  ' left join doc_nakl dn on (slp.nakl_recid = dn.recid and slp.nakl_baseid = dn.baseid)    '#13#10+
  ' where slp.lotdate = :LOTDATE                                                            '#13#10+
  '   and slp.lotnumber = :LOTNUMBER                                                          '#13#10+
  '   and slp.BASEID = :BASEID                                                                '#13#10+
  '   and ((SELECT STATUS FROM CHECK_FIX_EGAIS(1,slp.nakl_recid, slp.nakl_baseid)) = -1 )';

var q: TMegaQuery;
begin
 Result := '';
 q:= TMegaQuery.Create(Application.MainForm);
  try
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=Tran;

    if IntfMegaDBCommon.GetCountry=iccRussia  then
       q.SQL.Text:=sQueryTextMs
    else
       q.SQL.Text:=sQueryText;

    q.ParamByName('LOTDATE').AsDateTime:=ADate;
    q.ParamByName('LOTNUMBER').AsInteger := LotNumber;
    q.ParamByName('BASEID').AsInteger := aBaseID;

    MegaExecQuery(q);
    while not q.EOF do
     begin
      if Result <>'' then Result := Result +', ' + q.Fields[0].AsString
       else Result := Result + q.Fields[0].AsString;
      q.Next;
     end;
  finally
    q.Free;
  end;
end;

function CheckCntPerWeek(Tran : TMegaTransaction;  aRecid,aBaseID : integer ) : integer;
const
sQueryText=
  ' SELECT res FROM CHK_CNT_SHIP_PER_WEEK(:RECID, :BASEID)';
var q: TMegaQuery;
begin
 Result := 0;
 q:= TMegaQuery.Create(Application.MainForm);
  try
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=Tran;

    q.SQL.Text:=sQueryText;

    q.ParamByName('RECID').AsInteger:=aRecid;
    q.ParamByName('BASEID').AsInteger := aBaseID;

    MegaExecQuery(q);
    Result := q.Fields[0].AsInteger;
  finally
    q.Free;
  end;
end;

function IsNaklInSortParty ( Nakl_RecID, Nalk_BaseID : integer) : string;
const sQueryText = ' select slp.lotdate, slp.lotnumber '#13#10  +
                   ' from sort_lot_positions slp '#13#10  +
                   ' where slp.nakl_recid = :RECID '#13#10  +
                   '   and slp.nakl_baseid = :BASEID '#13#10 ;
var q: TMegaQuery;
    LocalTransaction: TMegaTransaction;
begin
 LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
 q:= TMegaQuery.Create(Application.MainForm);
 Result := '';
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;
    if GetSortSkladVer in [3,4] then
      q.SQL.Text:=q.SQL.Text+' and coalesce(slp.DELETED,0) = 0 '#13#10 ;


    q.ParamByName('RECID').AsInteger := Nakl_RecID;
    q.ParamByName('BASEID').AsInteger := Nalk_BaseID;

    MegaExecQuery(q);
    while not q.EOF do begin
      Result := Result +' № '+ q.Fields[1].AsString+' от '+ q.Fields[0].AsString;
      q.Next;
                       end;
  finally
    q.Free;
    LocalTransaction.Free;
  end;

end;

function IsSortNakl ( Nakl_RecID, Nalk_BaseID : integer) : integer;
const sQueryText = ' select IS_SORTING '#13#10  +
                   ' from IS_SORTING_NAKL(:RECID, :BASEID)'#13#10 ;
var q: TMegaQuery;
    LocalTransaction: TMegaTransaction;
begin
 LocalTransaction:= TMegaTransaction.Create(Application.MainForm);
 q:= TMegaQuery.Create(Application.MainForm);
 Result := 0;
  try
    LocalTransaction.DefaultDatabase:= IntfDBProvider.GetDB;
    LocalTransaction.StartTransaction;
    q.Database:= IntfDBProvider.GetDB;
    q.Transaction:=LocalTransaction;

    q.SQL.Text:=sQueryText;

    q.ParamByName('RECID').AsInteger := Nakl_RecID;
    q.ParamByName('BASEID').AsInteger := Nalk_BaseID;

    MegaExecQuery(q);
    while not q.EOF do begin
      Result := q.Fields[0].AsInteger;
      q.Next;
                       end;
  finally
    q.Free;
    LocalTransaction.Free;
  end;

end;

end.
