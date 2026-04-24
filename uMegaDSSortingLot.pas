// ------------------------------------
// project : Megapolis Money
// --
// module  : набор данных - партия для сотрировочного склада
// author  : Dmitry Lutsenko (lutsenko_d@yahoo.com)
// --
// created       :
// last modified :
// ------------------------------------
unit uMegaDSSortingLot;

interface
//
{$i 'Mega.inc'}

uses
  sysUtils, Windows, Classes, Controls, Forms, db, rxStrUtils, variants, uConst,
  uTypes, uMegaRDataSet, uMegaIntf, uUtils, uUtilSortSklad, Dialogs,
  uMegaDSAlphaParams, uGlobalVars, uMegaDSDocNakl, fbMegaUtils, liUtils;

type

  TMegaDSSortingLot = class(TMegaRDataSet)
  private
    FLotDate: TDateTime;
    FBaseID: integer;
    FCFO: integer;
    _MaxMetod:integer;
    FLotKind: Integer;

    function GetFieldBaseID: TIntegerField;
    function GetFieldCFO: TIntegerField;
    function GetFieldLotDate: TDateTimeField;
    function GetFieldLotNumber: TIntegerField;
    function GetFieldNaklBaseid: TIntegerField;
    function GetFieldNaklRecid: TIntegerField;
    function GetFieldCreateTime: TStringField;
    function GetFieldIS_PROV: TIntegerField;
    function GetFieldKind: TIntegerField;

  protected
    procedure SetQueryText; virtual;
    procedure DoAfterInsert; override;
    procedure InternalOpen; override;

    function GetMaxLotNumber: integer;
    function GetNewLotNumber: integer;
  public
    property FieldBaseID: TIntegerField read GetFieldBaseID;
    property FieldCFO: TIntegerField read GetFieldCFO;
    property FieldLotNumber: TIntegerField read GetFieldLotNumber;
    property FieldLotDate: TDateTimeField read GetFieldLotDate;

    property FieldNaklRecid  : TIntegerField read GetFieldNaklRecid;
    property FieldNaklBaseid : TIntegerField read GetFieldNaklBaseid;
    property FieldCreateTime : TStringField  read GetFieldCreateTime;
    property FieldIS_PROV    : TIntegerField read GetFieldIS_PROV;
    property FieldKind       : TIntegerField read GetFieldKind;

    constructor Create(aOwner: TComponent); override;

    procedure MakeParty(SortSkladVer: Integer = -1);
    procedure UnMakeParty(SortSkladVer: Integer = -1);

    procedure UpdateAllOldNakl(aAlphaParams: TMegaDSAlphaParams);
    procedure UpdateOldNakl(aAlphaParams: TMegaDSAlphaParams; aOldOperNumber: integer; aNewOperNumber: integer );
    procedure CommonUpdateNakl(aOldOper, aNewOper: TOperID);

    // используются в версии сорт. склада, где накладные не проводятся
    // а ставится тьолько SORT_LOT.IS_PROV
    procedure CreateSortingNakl2(aAlphaParams: TMegaDSAlphaParams);
    procedure CreateCorrectSortingNakl(aAlphaParams: TMegaDSAlphaParams);

    procedure ProcessMakePartyDetail(aMasterRecId,aMasterBaseId:Integer);
    procedure ProcessUnMakePartyDetail(aMasterRecId,aMasterBaseId:Integer);

    procedure RemakeDocs;
    procedure RemakeSortingLotNakl;
    procedure ReMakeDocsInParty;
    procedure RemakeDocs2(OnlyUnMake : Boolean; OnlyClient : Boolean);
    procedure TriggerOFFSetValue(OnlyClient : Boolean; aTriggerOFF : integer); // PROV_DOC_NEW/DELETE_PROV_DOC_NEW


    procedure BackAllOldNaklOper(aAlphaParams: TMegaDSAlphaParams);
    procedure DeleteSortingNakl;

    // procedure MakeReturns;
    function  GetUnMakedReturnsCount: integer;
    procedure UpdateSortNakl;
    procedure CreateReturnDoc(aDocParams: TMegaQuery);
    procedure SetReturnNaklRecid(aRecid: integer; aBaseID: integer);

    procedure Open(aLotDate: TDate; aBaseID: integer; aCFO: integer = -1; lot_kind: integer = 0); overload;
    procedure Add;
    procedure SetMaxMetod(m:integer);
  end;

//  0  - сорт накладные без проводок, на клиента - не меняют опрацию
//  1  - сорт накладные с проводками, на клиента - меняют опрацию(альфа-параметры)
//  2  - сорт накладные с проводками(создаются в сегодн. числе), на клиента - меняют опрацию(альфа-параметры)
//  3  - ---//--- при откате операции на клиентских накладных не меняются
//     - проводки на сорт. накладных не удаляются
//  4  - ---//--- + корректировки создаются в сегодняшнем числе
// 999 - Сортировка для подотчёта
function GetSortSkladVer : integer;


implementation

uses
  {$ifdef RX_LIB_2_7_7}
  rxDateUtil,
  {$else}
  DateUtil,
  {$endif}
  DateUtils, DBClient, uMegaObjDocNakl;

var
  _SortSkladVer: Integer = -1;
{ TMegaDSSortingLot }

function GetSortSkladVer : integer;
begin
  //  0  - сорт накладные без проводок, на клиента - не меняют опрацию
  //  1  - сорт накладные с проводками, на клиента - меняют опрацию(альфа-параметры)
  //  2  - сорт накладные с проводками(создаются в сегодн. числе), на клиента - меняют опрацию(альфа-параметры)
  //  3  - ---//--- при откате операции на клиентских накладных не меняются
  //     - проводки на сорт. накладных не удаляются
  //  4  - ---//--- + корректировки создаются в сегодняшнем числе
  // 999 - Сортировка для подотчёта
  result:= _SortSkladVer;
  if result = -1 then
    result := StrToInt(IntfMegaDBCommon.GetParam('SORT_SKLAD_NEW','0'));
end;

procedure TMegaDSSortingLot.Add;
begin
  Insert;
  Post;
end;

procedure TMegaDSSortingLot.BackAllOldNaklOper(
  aAlphaParams: TMegaDSAlphaParams);
begin
  //!!! связано с методом UpdateAllOldNakl
  UpdateOldNakl(aAlphaParams, 3, 2);
  UpdateOldNakl(aAlphaParams, 5, 4);
  UpdateOldNakl(aAlphaParams, 7, 6);
  UpdateOldNakl(aAlphaParams, 9, 8);
  UpdateOldNakl(aAlphaParams, 11, 10);
  UpdateOldNakl(aAlphaParams, 13, 12);
end;

procedure TMegaDSSortingLot.CommonUpdateNakl(aOldOper, aNewOper: TOperID);
const
  sQueryText =
    ' update doc_nakl dn '#13#10+
    ' set '#13#10+
    '   GROUP_OPER  = :NEW_GROUP_OPER, '#13#10+
    '   KOD_OPER    = :NEW_KOD_OPER '#13#10+
    ' where '#13#10+
    '   exists '#13#10+
    '   (select * '#13#10+
    '    from SORT_LOT_POSITIONS slp '#13#10+
    '    where slp.baseid      = :BASEID '#13#10+
    '      and slp.lotdate     = :LOTDATE '#13#10+
    '      and slp.lotnumber   = :LOTNUMBER '#13#10+
    '      and slp.nakl_recid  = dn.RECID '#13#10+
    '      and slp.nakl_baseid = dn.baseid '#13#10+
    '   ) '#13#10+
    '   and GROUP_OPER = :OLD_GROUP_OPER '#13#10+
    '   and KOD_OPER   = :OLD_KOD_OPER '#13#10+
    '';

var
  q: TMegaQuery;
begin
  q:= TMegaQuery.Create(Self);
  try
    q.Database:= Database;
    q.Transaction:= UpdateTransaction;

    q.SQL.Text:= sQueryText;

    MegaQueryParam(q, 'NEW_GROUP_OPER').AsInteger := aNewOper.GroupOper;
    MegaQueryParam(q, 'NEW_KOD_OPER').AsInteger   := aNewOper.KodOper;

    MegaQueryParam(q, 'BASEID').AsInteger         := FieldBaseid.AsInteger;
    MegaQueryParam(q, 'LOTDATE').AsDateTime       := FieldLotDate.AsDateTime;
    MegaQueryParam(q, 'LOTNUMBER').AsInteger      := FieldLotNumber.AsInteger;

    MegaQueryParam(q, 'OLD_GROUP_OPER').AsInteger := aOldOper.GroupOper;
    MegaQueryParam(q, 'OLD_KOD_OPER').AsInteger   := aOldOper.KodOper;


    MegaExecQuery(q);
  finally
    q.Free;
  end;
end;

constructor TMegaDSSortingLot.Create(aOwner: TComponent);
begin
  inherited;
  SetQueryText;
  _MaxMetod:=-1;
end;

procedure TMegaDSSortingLot.SetMaxMetod(m:integer);
begin
   _MaxMetod:=m;
end;

procedure TMegaDSSortingLot.CreateReturnDoc(aDocParams: TMegaQuery);
const
  sQueryText =
    ' INSERT '#13#10+
    ' INTO DOC_NAKL_POS (DOCRECNO, KOD_MATER, KOLICH) '#13#10+
    '     SELECT DISTINCT '#13#10+
    '       __RECID__, '#13#10+
    '       KOD_MATER, '#13#10+
    '       SUM(KOLICH) '#13#10+
    '     from sort_lot_return_pos slrp '#13#10+
    '     where slrp.lotdate   = :LOTDATE '#13#10+
    '       and slrp.lotnumber = :LOTNUMBER '#13#10+
    '       and slrp.baseid    = :BASEID '#13#10+
    '       and slrp.return_nakl_recid is null '#13#10+
    '     GROUP BY KOD_MATER '#13#10+
    '     HAVING SUM(KOLICH) <> 0 '#13#10+
    '';
var
  q: TMegaQuery;
  NaklForm: IMegaDocNaklForm;
begin
  NaklForm:= IntfMegaFormFactory.OpenDocument(
    Self,
    aDocParams.FieldByName('NEW_DOCTYPE').AsString, 0, 0,
    FieldLotDate.AsDateTime);


  NaklForm.SetNotSetOtsr(True);
  NaklForm.SetNoOtsr(True);

  NaklForm.SetGroupOper(aDocParams.FieldByName('NEW_GR_OPER').AsInteger);
  NaklForm.SetKodOper  (aDocParams.FieldByName('NEW_KOD_OPER').AsInteger);

  NaklForm.SetPriceType(iptZak);

  NaklForm.NaklPost;

  q:= NaklForm.GetQuery;

  q.Close;
  q.SQL.Text:= ReplaceStr(sQueryText , '__RECID__', IntToStr(NaklForm.GetRecID));

  MegaQueryParam(q, 'BASEID').AsInteger         := FieldBaseid.AsInteger;
  MegaQueryParam(q, 'LOTDATE').AsDateTime       := FieldLotDate.AsDateTime;
  MegaQueryParam(q, 'LOTNUMBER').AsInteger      := FieldLotNumber.AsInteger;

  MegaExecQuery(q);

  NaklForm.GetDocPos.Close;
  NaklForm.GetDocPos.Open;

  NaklForm.NaklEdit;
  NaklForm.DoAfterPost;

  AlphaStarted := True;
  try
    NaklForm.SetPriceType(iptAverageExact);
  finally
    AlphaStarted:= False;
  end;

  NaklForm.GetTransaction.CommitRetaining;

  SetReturnNaklRecid(NaklForm.GetRecID, intfMegaDBCommon.GetBaseid);

  UpdateTransaction.CommitRetaining;

//  Edit;
//  FieldNaklRecid.asInteger  := NaklForm.GetRecID;
//  FieldNaklBaseID.AsInteger := intfMegaDBCommon.GetBaseid;
//  FieldCreateTime.ASString  := TimeToStr(Time);
//  Post;

  NaklForm.Close;
end;

procedure TMegaDSSortingLot.DeleteSortingNakl;
const
  sQuerytext =
    'delete from doc_nakl where RECID = :RECID and BASEID = :BASEID';
var
  q: TMegaQuery;
  lNaklRecID: integer;
  lNaklBaseID: integer;
begin
  lNaklRecID:= FieldNaklRecid.AsInteger;
  lNaklBAseID:= FieldNaklBaseid.AsInteger;

  Edit;
  FieldNaklRecid.Clear;
  FieldNaklBaseid.Clear;
  Post;

  q:= TmegaQuery.Create(Self);
  try
    q.DataBase    := DataBase;
    q.Transaction := UpdateTransaction;
    q.SQL.Text    := sQueryText;
    MegaQueryParam(q, 'RECID').AsInteger:= lNaklRecID;
    MegaQueryParam(q, 'BASEID').AsInteger:= lNaklBaseID;
    MegaExecQuery(q);
  finally
    q.Free;
  end;
end;

procedure TMegaDSSortingLot.DoafterInsert;
begin
  inherited;
  MegaDataSetField(Self, 'LOTDATE').AsDateTime := FLotDate;
  MegaDataSetField(Self, 'BASEID').AsInteger   := FBaseID;
  MegaDataSetField(Self, 'CFO').AsInteger      := FCFO;
  MegaDataSetField(Self, 'KIND').AsInteger := FLotKind;
  MegaDataSetField(Self, 'LOTNUMBER').AsInteger:= GetNewLotNumber;
end;

function TMegaDSSortingLot.GetFieldBaseID: TIntegerField;
begin
  Result:= TIntegerField(FieldByName('BASEID'));
end;

function TMegaDSSortingLot.GetFieldCFO: TIntegerField;
begin
  Result:= TIntegerField(FieldByName('CFO'));
end;

function TMegaDSSortingLot.GetFieldCreateTime: TStringField;
begin
  Result:= TStringField(FieldByName('CREATE_TIME'));
end;

function TMegaDSSortingLot.GetFieldLotDate: TDateTimeField;
begin
  Result:= TDateTimeField(FieldByName('LOTDATE'));
end;

function TMegaDSSortingLot.GetFieldLotNumber: TIntegerField;
begin
  Result:= TIntegerField(FieldByName('LOTNUMBER'));
end;

function TMegaDSSortingLot.GetFieldNaklBaseid: TIntegerField;
begin
  Result:= TIntegerField(FieldByName('NAKL_BASEID'));
end;

function TMegaDSSortingLot.GetFieldNaklRecid: TIntegerField;
begin
  Result:= TIntegerField(FieldByName('NAKL_RECID'));
end;

function TMegaDSSortingLot.GetFieldIS_PROV: TIntegerField;
begin
  Result:= TIntegerField(FieldByName('IS_PROV'));
end;

function TMegaDSSortingLot.GetFieldKind: TIntegerField;
begin
  Result:= TIntegerField(FieldByName('KIND'));
end;

function TMegaDSSortingLot.GetMaxLotNumber: integer;
const
  sQueryText =
    ' select max(sl.lotnumber) maxnumber '#13#10+
    ' from SORT_LOT sl '#13#10+
    ' where sl.LOTDATE = :LOTDATE '#13#10+
    '   and sl.BASEID = :BASEID '#13#10+
    '   and sl.lotnumber between :b_n and :e_n';
var
  q: TMegaQuery;
begin
  result:=-1;
  q:= TmegaQuery.Create(Self);
  try
    q.DataBase:= DataBase;
    q.Transaction:= Transaction;
    q.SQL.Text:= sQueryText;
    MegaQueryParam(q, 'LOTDATE').AsDateTime:= FLotDate;
    MegaQueryParam(q, 'BASEID').AsInteger:= FBaseID;
    if _MaxMetod<>-1 then begin
      MegaQueryParam(q, 'b_n').AsInteger:= _MaxMetod;
      MegaQueryParam(q, 'e_n').AsInteger:= _MaxMetod+9;
      MegaExecQuery(q);
      Result:= MegaQueryField(q, 'MAXNUMBER').AsInteger;
      q.Close;
      if Result=_MaxMetod+9 then Result:=-1
      else if Result=0 then Result:=_MaxMetod-1;
    end;
    if result=-1 then begin
     MegaQueryParam(q, 'b_n').AsInteger:= 0;
     MegaQueryParam(q, 'e_n').AsInteger:= MaxInt;
     MegaExecQuery(q);
     Result:= MegaQueryField(q, 'MAXNUMBER').AsInteger;
    end;
  finally
    q.Free;
  end;
end;

function TMegaDSSortingLot.GetNewLotNumber: integer;
begin
  Result:= GetMaxLotNumber + 1;
end;

function TMegaDSSortingLot.GetUnMakedReturnsCount: integer;
const
  sQueryText =
    ' select Count(*) cnt '#13#10+
    ' from sort_lot_return_pos slrp '#13#10+
    ' where slrp.lotdate   = :LOTDATE '#13#10+
    '   and slrp.lotnumber = :LOTNUMBER '#13#10+
    '   and slrp.baseid    = :BASEID '#13#10+
    '   and slrp.return_nakl_recid is null '#13#10+
    '';

var
  q: TMegaQuery;
begin
  q:= TMegaQuery.Create(Self);
  try
    q.DataBase:= Database;
    q.Transaction:= UpdateTransaction;

    q.SQL.Text:= sQueryText;

    q.ParamByName('Lotdate').AsDateTime:= FieldLotDate.AsDateTime;
    q.ParamByName('LOTNUMBER').AsInteger:= FieldLotNumber.AsInteger;
    q.ParamByName('BASEID').AsInteger:= FieldBaseID.AsInteger;

    MegaExecQuery(q);

    Result:= q.FieldByName('cnt').AsInteger;
  finally
    q.Free;
  end;
end;

procedure TMegaDSSortingLot.InternalOpen;
begin
  ParamByName('LOTDATE').AsDateTime:= FLOTDate;
  ParamByName('BASEID').AsInteger:= FBaseID;
  ParamByName('CFO').AsInteger:= FCFO;
  ParamByName('LOT_KIND').AsInteger:= FLotKind;
  inherited;
end;

procedure TMegaDSSortingLot.MakeParty(SortSkladVer: Integer);
const
  sqlGetAlphaMaster =
    'SELECT                          '#13#10+
    'am.ID,            am.BASEID,    '#13#10+
    'am.ORDERNUM,      am.NAME,      '#13#10+
    'am.DOCTYPE,       am.PRICE,     '#13#10+
    'am.GROUP_OPER,    am.KOD_OPER,  '#13#10+
    'am.BEGINDATE,     am.ENDDATE,   '#13#10+
    'am.CREATE_NAKL,   am.PP_BALANCE,'#13#10+
    'am.ALPHA_DK_FROM, am.ALPHA_DK_TO'#13#10+
    'FROM ALPHA_MASTER am            '#13#10+
    'WHERE am.baseid=:baseid         '#13#10+
    '  AND am.create_nakl=3          '#13#10+
    'ORDER BY                        '#13#10+
    '  am.ordernum                   ';
var
  lAlphaParams: TMegaDSAlphaParams;
  qr : TMegaQuery;
  tm1,tm2 : integer;
begin
{ ----------------- Added by Lion in 04.04.2009 ---------------- }
   _SortSkladVer := SortSkladVer;
   try
{ ----------- End of addition by Lion in 04.04.2009 ----------- }
    // Установка признака проведенности партии.
    if IsPartyProv2(FieldLotDate.AsDateTime,FieldBASEID.AsInteger,
                    FieldCFO.AsInteger, FieldLotNumber.AsInteger, FieldKind.AsInteger) then
    begin
      raise Exception.Create('Операция отменена! Сортировочная накладная по данной партии уже создана!');
      Exit;
    end;

    if GetSortSkladVer in [3,4] Then
    begin
      try
        // "очень :)" Новая версия сортировочного скдада.
        qr := TMegaQuery.Create(self);
        qr.Database    := Database;
        qr.Transaction := UpdateTransaction;
        qr.SQL.Text:=' execute procedure SORT_LOT_PROV(:LOTDATE, :LOTNUMBER, :BASEID)';
        qr.ParamByName('LOTDATE').AsDate      := FieldLotDate.AsDateTime ;
        qr.ParamByName('LOTNUMBER').AsInteger := FieldLotNumber.AsInteger;
        qr.ParamByName('BASEID').AsInteger    := FieldBASEID.AsInteger   ;
        qr.ExecProc;
        qr.Close;
        qr.Transaction.CommitRetaining;
        qr.Destroy;
      except
        on e: Exception do
        begin
          UpdateTransaction.RollbackRetaining;
          Raise Exception.Create('Возникли ошибки при проведении сортировочной партии.'#13#10+E.Message);
        end;
      end;
    end
    else
    if GetSortSkladVer in [1,2] Then
    begin
      // Новая версия сортировочного скдада.
      lAlphaParams:= TMegaDSAlphaParams.Create(Self);
      try
        lAlphaParams.Database    := Database;
        lAlphaParams.Transaction := UpdateTransaction;
        lAlphaParams.SelectSQL.Text:=sqlGetAlphaMaster;//??
        lAlphaParams.OpenSortingWarehouseParam;

        RemakeDocs2(true,false);
        TriggerOFFSetValue(false,1);

         Edit;
         FieldIS_PROV.AsInteger := 0;
         Post;

         while not lAlphaParams.Eof do
          try
            ProcessMakePartyDetail( lAlphaParams.FieldByName('ID').Asinteger,
                                lAlphaParams.FieldByName('BASEID').Asinteger );
          finally
            lAlphaParams.Next;
          end;

         TriggerOFFSetValue(false,0);
         RemakeDocs2(false,false);

         // ставлю SORT_LOT.IS_PROV = 1 //
         Edit;
         FieldIS_PROV.AsInteger := 1;
         Post;
  //       MakePartyProv( TMegaTransaction(UpdateTransaction),FieldLotDate.AsDateTime,
  //                      FieldBASEID.AsInteger, FieldLotNumber.AsInteger,0,0);
         UpdateTransaction.CommitRetaining;

        lAlphaParams.Free;
      except
        on e: Exception do
        begin
          UpdateTransaction.RollbackRetaining;
          Raise Exception.Create('Возникли ошибки при проведении сорт партии.'#13#10+E.Message);
        end;
      end;
    end
    else
    begin
      // Старая версия сортировочного скдада.
      lAlphaParams:= TMegaDSAlphaParams.Create(Self);
      try
        lAlphaParams.Database    := Database;
        lAlphaParams.Transaction := UpdateTransaction;
        if GetSortSkladVer=999 then
          lAlphaParams.OpenSortingWhenAccount
        else
          lAlphaParams.OpenSortingWarehouseParam;

        try

         if IsFirstSortNaklOld( FieldLotDate.AsDateTime, FieldBASEID.AsInteger,
                             FieldLotNumber.AsInteger) then
           CreateCorrectSortingNakl(lAlphaParams)
          else
           CreateSortingNakl2(lAlphaParams);

         MakePartyProv( TMegaTransaction(UpdateTransaction),FieldLotDate.AsDateTime,
                        FieldBASEID.AsInteger, FieldLotNumber.AsInteger,0,0);
         UpdateTransaction.CommitRetaining;
        finally
        end;

      finally
        lAlphaParams.Free;
      end;
    end
{ ----------------- Added by Lion in 04.04.2009 ---------------- }
   finally
     _SortSkladVer:= -1;
   end;
{ ----------- End of addition by Lion in 04.04.2009 ----------- }
end;

procedure TMegaDSSortingLot.Open(aLotDate: TDate; aBaseID: integer; aCFO: integer; lot_kind: integer);
begin
  FLotDate:= aLotDate;
  FBaseID:= aBaseID;

  If aCFO <> -1 Then
    FCFO := aCFO
   Else
    FCFO := FBaseID;

  FLotKind:= lot_kind;

  Open;
end;

procedure TMegaDSSortingLot.RemakeDocs;
begin
  RemakeSortingLotNakl;
  ReMakeDocsInParty;
end;

procedure TMegaDSSortingLot.ReMakeDocsInParty;
const
  sQueryText =
    ' select '#13#10+
    '   dn.recid, '#13#10+
    '   dn.baseid '#13#10+
    ' from sort_lot_positions slp '#13#10+
    ' left join doc_nakl dn on (dn.recid = slp.nakl_recid and dn.baseid = slp.baseid) '#13#10+
    ' where '#13#10+
    '     slp.lotdate   = :LOTDATE '#13#10+
    ' and slp.lotnumber = :LOTNUMBER '#13#10+
    ' and slp.baseid    = :baseid '#13#10+
    '';
var
  q: TMegaDSDocNakl;
begin
  q:= TMegaDSDocNakl.Create(Self);
  try
    q.DataBase:= Database;
    q.Transaction:= UpdateTransaction;
    q.SelectSQL.Text:= sQueryText;


    q.ParamByName('BASEID').AsInteger         := FieldBaseid.AsInteger;
    q.ParamByName('LOTDATE').AsDateTime       := FieldLotDate.AsDateTime;
    q.ParamByName('LOTNUMBER').AsInteger      := FieldLotNumber.AsInteger;

    q.Open;

    q.RemakeProv;
  finally
    q.Free;
  end;
end;

procedure TMegaDSSortingLot.RemakeSortingLotNakl;
const
  sQueryText =
    ' select '#13#10+
    '   dn.recid, '#13#10+
    '   dn.baseid '#13#10+
    ' from doc_nakl dn '#13#10+
    ' where dn.recid = :NAKL_RECID '#13#10+
    ' and dn.baseid  = :NAKL_BASEID '#13#10+
    '';
var
  q: TMegaDSDocNakl;
  lTransaction: TMegaTransaction;
begin
  q:= TMegaDSDocNakl.Create(Self);
  lTransaction:= TMegaTransaction.Create(Self);
  try
    lTransaction.DefaultDatabase:= Database;

    q.DataBase:= Database;
    q.Transaction:= lTransaction;

    lTransaction.StartTransaction;

    q.SelectSQL.Text:= sQueryText;


    q.ParamByName('NAKL_RECID').AsInteger       := FieldNaklRecid.AsInteger;
    q.ParamByName('NAKL_BASEID').AsInteger      := FieldNaklBaseid.AsInteger;

    q.Open;

    q.RemakeProv;

    if lTransaction.InTransaction then lTransaction.Commit;
  finally
    q.Free;
    lTransaction.Free;
  end;
end;

procedure TMegaDSSortingLot.SetQueryText;
const
  sSelectAndRefreshPart =
    ' select           '#13#10+
    '   sl.lotdate,    '#13#10+
    '   sl.lotnumber,  '#13#10+
    '   sl.baseid,     '#13#10+
    '   sl.cfo,        '#13#10+
    '   sl.create_time,'#13#10+
    '   sl.nakl_recid, '#13#10+
    '   sl.nakl_baseid,'#13#10+
    '   sl.IS_PROV,    '#13#10+
    '   sl.KIND        '#13#10+
    ' from sort_lot sl '#13#10+
    '';

  sSelectSQL = sSelectAndRefreshPart +
    ' where '#13#10+
    '     sl.lotdate = :LOTDATE '#13#10+
    ' and sl.baseid  = :BASEID  '#13#10+
    ' and coalesce(sl.CFO, 0) = :CFO     '#13#10+
    ' and kind = :lot_kind '#13#10+
    '';

  sDeleteSQL =
    ' DELETE FROM SORT_LOT '#13#10+
    '  WHERE '#13#10+
    '          LOTDATE   = :OLD_LOTDATE   '#13#10+
    '      and LOTNUMBER = :OLD_LOTNUMBER '#13#10+
    '      and BASEID    = :OLD_BASEID    '#13#10+
    '';

  sInsertSQL =
    ' INSERT INTO SORT_LOT(  '#13#10+
    '     LOTDATE,     '#13#10+
    '     LOTNUMBER,   '#13#10+
    '     BASEID,      '#13#10+
    '     CFO,         '#13#10+
    '     CREATE_TIME, '#13#10+
    '     NAKL_RECID,  '#13#10+
    '     NAKL_BASEID, '#13#10+
    '     IS_PROV,     '#13#10+
    '     KIND         '#13#10+
    ' ) '#13#10+
    ' VALUES( '#13#10+
    '     :LOTDATE,    '#13#10+
    '     :LOTNUMBER,  '#13#10+
    '     :BASEID,     '#13#10+
    '     :CFO,        '#13#10+
    '     :CREATE_TIME,'#13#10+
    '     :NAKL_RECID, '#13#10+
    '     :NAKL_BASEID,'#13#10+
    '     :IS_PROV,    '#13#10+
    '     :LOT_KIND    '#13#10+
    ' ) '#13#10+
    '';

  sRefreshSQL = sSelectAndRefreshPart +
    '  WHERE '#13#10+
    '     ( '#13#10+
    '             sl.LOTDATE = :OLD_LOTDATE '#13#10+
    '      and sl.LOTNUMBER = :OLD_LOTNUMBER '#13#10+
    '      and sl.BASEID = :OLD_BASEID '#13#10+
    '     ) '#13#10+
    '';

  sUpdateSQL =
    ' UPDATE SORT_LOT SET '#13#10+
    '     CREATE_TIME = :CREATE_TIME, '#13#10+
    '     NAKL_RECID  = :NAKL_RECID,  '#13#10+
    '     NAKL_BASEID = :NAKL_BASEID, '#13#10+
    '     IS_PROV     = :IS_PROV,     '#13#10+
    '     KIND        = :LOT_KIND     '#13#10+
    '  WHERE '#13#10+
    '          LOTDATE   = :OLD_LOTDATE '#13#10+
    '      and LOTNUMBER = :OLD_LOTNUMBER '#13#10+
    '      and BASEID    = :OLD_BASEID '#13#10+
    '';

begin
  SelectSQL.Text:=sSelectSQL;
  RefreshSQL.Text:=sRefreshSQL;
  DeleteSQL.Text:=sDeleteSQL;
  InsertSQL.Text:=sInsertSQL;
  UpdateSQL.Text:=sUpdateSQL;
end;



procedure TMegaDSSortingLot.SetReturnNaklRecid(aRecid: integer; aBaseID: integer);
const
  sQueryText =
    ' update sort_lot_return_pos slrp '#13#10+
    ' set '#13#10+
    '     slrp.return_nakl_recid  = :NAKL_RECID, '#13#10+
    '     slrp.return_nakl_baseid = :NAKL_BASEID '#13#10+
    ' where slrp.lotdate   = :LOTDATE '#13#10+
    '   and slrp.lotnumber = :LOTNUMBER '#13#10+
    '   and slrp.baseid    = :BASEID '#13#10+
    '   and slrp.return_nakl_recid is null '#13#10+
    '';
var
  q: TMegaQuery;
begin
  q:= TMegaQuery.Create(Self);
  try
    q.DataBase:= Database;
    q.Transaction:= UpdateTransaction;

    q.SQL.Text:= sQueryText;

    q.ParamByName('Lotdate').AsDateTime:= FieldLotDate.AsDateTime;
    q.ParamByName('LOTNUMBER').AsInteger:= FieldLotNumber.AsInteger;
    q.ParamByName('BASEID').AsInteger:= FieldBaseID.AsInteger;
    q.ParamByName('NAKL_RECID').AsInteger:= aRecID;
    q.ParamByName('NAKL_BASEID').AsInteger:= aBaseID;

    MegaExecQuery(q);

  finally
    q.Free;
  end;
end;

procedure TMegaDSSortingLot.TriggerOFFSetValue(OnlyClient: Boolean;aTriggerOFF: integer);
var
  sNaklWhere : string;
  sNaklPosWhere : string;
  Procedure SetTriggerOFF(aRECID,aBASEID : integer);
//  Procedure SetTriggerOFF;
  var
    Q : TMegaQuery;
  begin
    Q := TMegaQuery.Create(self);
    Q.DataBase    := DataBase;
    Q.Transaction := UpdateTransaction;
    // накладная
    Q.SQL.Text    :=
        'UPDATE doc_nakl dn SET         '#13#10+
        '  dn.TRIGGER_OFF = :TRIGGER_OFF'#13#10+
//        ' where '+sNaklWhere;
        'where dn.RECID = :RECID        '#13#10+
        '  and dn.BASEID = :BASEID      ';
    Q.ParamByName('RECID').AsInteger    := aRECID;
    Q.ParamByName('BASEID').AsInteger   := aBASEID;
    Q.ParamByName('TRIGGER_OFF').AsInteger:= aTriggerOFF;
    Q.ExecQuery;
    Q.Close;
    // позиции
    Q.SQL.Text    :=
        'UPDATE DOC_NAKL_POS dnp SET     '#13#10+
        '  dnp.TRIGGER_OFF = :TRIGGER_OFF'#13#10+
//        ' where '+sNaklPosWhere;
        'where dnp.DOCRECNO = :RECID     '#13#10+
        '  and dnp.BASEID = :BASEID      ';
    Q.ParamByName('RECID').AsInteger    := aRECID;
    Q.ParamByName('BASEID').AsInteger   := aBASEID;
    Q.ParamByName('TRIGGER_OFF').AsInteger:= aTriggerOFF;
    Q.ExecQuery;
    Q.Close;
    Q.Destroy;
  end;
const
  cSelectNaklList =
'/* сортировочная накладная */                                                      '#13#10+
' select                                                                            '#13#10+
'   dn.RECID,                                                                       '#13#10+
'   dn.BASEID                                                                       '#13#10+
'                                                                                   '#13#10+
' from sort_lot sl                                                                  '#13#10+
'   LEFT JOIN get_linked_docs_new(31,sl.recid,sl.baseid, 0,0) gl on 1=1 and gl.LINKED_FORMTYPE = 1 '#13#10+
'   left join doc_nakl dn on                                                        '#13#10+
'   (dn.recid = gl.LINKED_RECID and dn.baseid = gl.LINKED_BASEID)                       '#13#10+
' where sl.lotdate   = :LOTDATE                                                     '#13#10+
'   and sl.lotnumber = :LOTNUMBER                                                   '#13#10+
'   and sl.baseid    = :BASEID                                                      '#13#10+
'                                                                                   '#13#10+
' union all                                                                         '#13#10+
'                                                                                   '#13#10+
'/* корр. сортировочная накладная */                                                '#13#10+
' select                                                                            '#13#10+
'   dn.RECID,                                                                       '#13#10+
'   dn.BASEID                                                                       '#13#10+
' from sort_lot sl                                                                  '#13#10+
'   LEFT JOIN get_linked_docs_new(31,sl.recid,sl.baseid, 0,0) gl on 1=1 and gl.LINKED_FORMTYPE = 1'#13#10+
'   LEFT JOIN LINK_DOC_OPL ldo ON gl.LINKED_RECID = ldo.parent_recid                  '#13#10+
'                             AND gl.LINKED_BASEID= ldo.parent_baseid                 '#13#10+
'   LEFT JOIN doc_nakl dn on dn.recid = ldo.opl_recid and dn.baseid = ldo.OPL_BASEID'#13#10+
' where sl.lotdate   = :LOTDATE                                                     '#13#10+
'   and sl.lotnumber = :LOTNUMBER                                                   '#13#10+
'   and sl.baseid    = :BASEID                                                      '#13#10+
'                                                                                   '#13#10+
' union all                                                                         ';

  cSelectNaklListClient =
'/* документы в партии */                                    '#13#10+
' select                                                     '#13#10+
'   dn.RECID,                                                '#13#10+
'   dn.BASEID                                                '#13#10+
' from sort_lot_positions slp                                '#13#10+
'   left join doc_nakl dn on                                 '#13#10+
'   (dn.recid = slp.nakl_recid and dn.baseid = slp.baseid)   '#13#10+
' where slp.lotdate   = :LOTDATE                             '#13#10+
'   and slp.lotnumber = :LOTNUMBER                           '#13#10+
'   and slp.baseid    = :BASEID                              ';

var
  Q : TMegaQuery;
begin
  // перепровожу документы как в списке док-в  PROV_DOC_NEW/DELETE_PROV_DOC_NEW
  Q := TMegaQuery.Create(self);
  Q.DataBase    := DataBase;
  Q.Transaction := UpdateTransaction;
  if OnlyClient then
    Q.SQL.Text  := cSelectNaklListClient
   else
    Q.SQL.Text := cSelectNaklList + cSelectNaklListClient;

  Q.ParamByName('BASEID').AsInteger         := FieldBaseid.AsInteger;
  Q.ParamByName('LOTDATE').AsDateTime       := FieldLotDate.AsDateTime;
  Q.ParamByName('LOTNUMBER').AsInteger      := FieldLotNumber.AsInteger;

  Q.ExecQuery;
  sNaklWhere := '';
  sNaklPosWhere:= '';

  if (aTriggerOFF = 1)or(aTriggerOFF = 0) then
  while not Q.Eof do
    begin
      if (Q.FieldByName('RECID').AsString<>'')and(Q.FieldByName('BASEID').AsString<>'') then
      begin
(*
        if sNaklWhere <> '' then
          sNaklWhere := sNaklWhere +' or '+#13#10;
        if sNaklPosWhere <> '' then
          sNaklPosWhere := sNaklPosWhere +' or '+#13#10;

        sNaklWhere := sNaklWhere + '(RECID='+Q.FieldByName('RECID').AsString+
                                   ' and BASEID ='+Q.FieldByName('BASEID').AsString+')';
        sNaklPosWhere := sNaklPosWhere + '(DOCRECNO='+Q.FieldByName('RECID').AsString+
                                   ' and BASEID ='+Q.FieldByName('BASEID').AsString+')';
*)
        SetTriggerOFF(Q.FieldByName('RECID').AsInteger,Q.FieldByName('BASEID').AsInteger);
      end;
      Q.Next;
    end;
//  SetTriggerOFF;

  Q.Close;
  Q.free;
end;

procedure TMegaDSSortingLot.UnMakeParty(SortSkladVer: Integer);
const
  sqlGetAlphaMaster =
    'SELECT                          '#13#10+
    'am.ID,            am.BASEID,    '#13#10+
    'am.ORDERNUM,      am.NAME,      '#13#10+
    'am.DOCTYPE,       am.PRICE,     '#13#10+
    'am.GROUP_OPER,    am.KOD_OPER,  '#13#10+
    'am.BEGINDATE,     am.ENDDATE,   '#13#10+
    'am.CREATE_NAKL,   am.PP_BALANCE,'#13#10+
    'am.ALPHA_DK_FROM, am.ALPHA_DK_TO'#13#10+
    'FROM ALPHA_MASTER am            '#13#10+
    'WHERE am.baseid=:baseid         '#13#10+
    '  AND am.create_nakl=3          '#13#10+
    'ORDER BY                        '#13#10+
    '  am.ordernum                   ';
var
  lAlphaParams: TMegaDSAlphaParams;
  qr : TMegaQuery;
begin
{ ----------------- Added by Lion in 04.04.2009 ---------------- }
  _SortSkladVer := SortSkladVer;
  try
{ ----------- End of addition by Lion in 04.04.2009 ----------- }
    if GetSortSkladVer in [3,4] Then
    begin
      try
        // "очень :)" Новая версия сортировочного скдада.
        qr := TMegaQuery.Create(self);
        qr.Database    := Database;
        qr.Transaction := UpdateTransaction;
        qr.SQL.Text:=' execute procedure SORT_LOT_UNPROV(:LOTDATE, :LOTNUMBER, :BASEID)';
        qr.ParamByName('LOTDATE').AsDate      := FieldLotDate.AsDateTime ;
        qr.ParamByName('LOTNUMBER').AsInteger := FieldLotNumber.AsInteger;
        qr.ParamByName('BASEID').AsInteger    := FieldBASEID.AsInteger   ;
        qr.ExecProc;
        qr.Close;
        qr.Transaction.Commit;
        qr.Destroy;
      except
        on e: Exception do
        begin
          UpdateTransaction.Rollback;
          Raise Exception.Create('Возникли ошибки при откате сортировочной партии.'#13#10+E.Message);
        end;
      end;
    end
    else
    if GetSortSkladVer in [1,2] Then
    begin
      // Новая версия сортировочного скдада.
      lAlphaParams:= TMegaDSAlphaParams.Create(Self);
      try
        lAlphaParams.Database    := Database;
        lAlphaParams.Transaction := UpdateTransaction;
        lAlphaParams.SelectSQL.Text:=sqlGetAlphaMaster;//??
        lAlphaParams.OpenSortingWarehouseParam;

         RemakeDocs2(true,false);
         TriggerOFFSetValue(false,1);

         // ставлю SORT_LOT.IS_PROV = 0 //
         Edit;
         FieldIS_PROV.AsInteger := 0;
         MakePartyUnProv (TMegaTransaction(UpdateTransaction),FieldLotDate.AsDateTime,
                          FieldBASEID.AsInteger, FieldLotNumber.AsInteger);

         Post;

         while not lAlphaParams.Eof do
          try
            //Идем по AlphaMaster, создавая накладные
            ProcessUnMakePartyDetail( lAlphaParams.FieldByName('ID').Asinteger,
                                lAlphaParams.FieldByName('BASEID').Asinteger );
          finally
            lAlphaParams.Next;
          end;

         TriggerOFFSetValue(false,0);
         RemakeDocs2(false,true);
         UpdateTransaction.Commit;

        lAlphaParams.Free;
      except
        on e: Exception do
        begin
          UpdateTransaction.RollbackRetaining;
          Raise Exception.Create('Возникли ошибки при проведении сорт партии.'#13#10+E.Message);
        end;
      end;
    end
    else
    begin
      // Новая версия сортировочного скдада.
      MakePartyUnProv (TMegaTransaction(UpdateTransaction), FieldLotDate.AsDateTime, FieldBASEID.AsInteger,
                                                     FieldLotNumber.AsInteger);
      try
        if GetSortSkladVer = 999 then
        begin
          { Удаляем сортировочные накладные }
          fbExecQuery(UpdateTransaction, 'DELETE FROM DOC_NAKL dn WHERE dn.recid = %d and dn.baseid = %d',
            [FieldNaklRecid.AsInteger, FieldNaklBaseid.AsInteger]);
        end;
      except
        Warning('Ошибка при удалении сортировочной накладной: '#13#10 + ExceptMsg);
      end;

      UpdateTransaction.Commit;
    end;
{ ----------------- Added by Lion in 04.04.2009 ---------------- }
  finally
    _SortSkladVer := -1;
  end;
{ ----------- End of addition by Lion in 04.04.2009 ----------- }
end;

procedure TMegaDSSortingLot.UpdateAllOldNakl(aAlphaParams: TMegaDSAlphaParams);
begin
  //!!! связано с методом BackAllOldNaklOper
  UpdateOldNakl(aAlphaParams, 2, 3);
  UpdateOldNakl(aAlphaParams, 4, 5);
  UpdateOldNakl(aAlphaParams, 6, 7);
  UpdateOldNakl(aAlphaParams, 8, 9);
  UpdateOldNakl(aAlphaParams, 10, 11);
  UpdateOldNakl(aAlphaParams, 12, 13);
end;

procedure TMegaDSSortingLot.UpdateOldNakl(aAlphaParams: TMegaDSAlphaParams; aOldOperNumber: integer; aNewOperNumber: integer );
var
  lOldOper: TOperID;
  lNewOper: TOperID;
begin

  lOldOper.GroupOper := aAlphaParams.FieldByName('A_GR_OPER'  + IntToStr(aOldOperNumber)).AsInteger;
  lOldOper.KodOper   := aAlphaParams.FieldByName('A_KOD_OPER' + IntToStr(aOldOperNumber)).AsInteger;

  lNewOper.GroupOper := aAlphaParams.FieldByName('A_GR_OPER'  + IntToStr(aNewOperNumber)).AsInteger;
  lNewOper.KodOper   := aAlphaParams.FieldByName('A_KOD_OPER' + IntToStr(aNewOperNumber)).AsInteger;

  CommonUpdateNakl(lOldOper, lNewOper);
end;

procedure TMegaDSSortingLot.UpdateSortNakl;
const
  sQueryText =
    ' update doc_nakl_pos dnp '#13#10+
    ' set '#13#10+
    '   dnp.kolich = dnp.kolich - '#13#10+
    '     (select sum(slrp.kolich) '#13#10+
    '      from sort_lot_return_pos slrp '#13#10+
    '      where slrp.kod_mater = dnp.kod_mater '#13#10+
    '        and slrp.return_nakl_recid is null '#13#10+
    '     ) '#13#10+
    ' where '#13#10+
    '     dnp.docrecno = :NAKL_RECID '#13#10+
    ' and dnp.baseid   = :NAKL_BASEID '#13#10+
    '';
var
  q: TMegaQuery;
begin
  q:= TMegaQuery.Create(self);
  try
    q.DataBase:= DataBase;
    q.Transaction:= UpdateTransaction;
    q.SQL.Text:= sQueryText;

    q.ParamByName('NAKL_RECID').asInteger  := FieldNaklRecid.AsInteger;
    q.ParamByName('NAKL_BASEID').asInteger := FieldNaklBaseid.AsInteger;

    MegaExecQuery(q);
  finally
    q.Free;
  end;
end;

procedure TMegaDSSortingLot.CreateSortingNakl2(aAlphaParams: TMegaDSAlphaParams);
const
  sQueryTextRecID = ' select * from new_doc_nakl '#13#10+
                    ' '#13#10 ;
  sQueryTextNakl =  ' INSERT INTO doc_nakl (RECID,BASEID, '#13#10  +
                    ' OPERDATE, '#13#10  +
                    ' DOCTYPE, DOCNUMBER,DOCDATE,'#13#10  +
                    ' GROUP_OPER,KOD_OPER, DK_FROM,DK_TO,DK_C,  KURS, SUMMA,SUMMA1, NOTES,'#13#10  +
                    ' KOLICH_,  FORMAOPL_,PRICETYPE_, '#13#10  +
                    ' BALANCE_KOD, V,V1, NACENKA_,PRICE_FROM_VALYUTA, '#13#10  +
                    ' STATE,TRIGGER_OFF,OTSR,TRANSPORT,CFO,PRESENT)  '#13#10  +
                    ' '#13#10  +
                    ' VALUES (:RECID,:BASEID, :DT,'#13#10  +
                    ' '#13#10  +
                    ' :DOCTYPE, :DOCNUMBER,:DT, '#13#10  +
                    ' :GROUP_OPER,:KOD_OPER, :DK_FROM,:DK_TO, NULL,1, '#13#10  +
                    ' :SUMMA,:SUMMA, '''', '#13#10  +
                    ' :KOLICH, 1,1,:BALANCE_KOD, '#13#10  +
                    ' :V,:V, 0,:V,'#13#10  +
                    ' :STATE, 0,NULL,0,:CFO,NULL)'#13#10  +
                    ' '#13#10 ;
  sQueryTextUpdate =' UPDATE DOC_NAKL '#13#10+
                    ' set STATE=20 '#13#10+
                    ' WHERE RECID= :RECID and BASEID=:BASEID'+
                    ' '#13#10 ;
  sQueryText =
    ' INSERT '#13#10+
    ' INTO DOC_NAKL_POS (DOCRECNO, KOD_MATER, KOLICH,PARTY) '#13#10+
    '     SELECT DISTINCT '#13#10+
    '       __RECID__, '#13#10+
    '       KOD_MATER, '#13#10+
    '       SUM(KOLICH), '#13#10+
    '       PARTY '#13#10+
    '     FROM DOC_NAKL_POS, DOC_NAKL dn '#13#10+
    '     WHERE DOC_NAKL_POS.DOCRECNO = DN.RECID '#13#10+
    '       AND DOC_NAKL_POS.BASEID = DN.BASEID '#13#10+
    '       AND exists '#13#10+
    '           (select * '#13#10+
    '            from SORT_LOT_POSITIONS slp '#13#10+
    '            where slp.baseid      = :BASEID '#13#10+
    '              and slp.lotdate     = :LOTDATE '#13#10+
    '              and slp.lotnumber   = :LOTNUMBER '#13#10+
    '              and slp.nakl_recid  = dn.RECID '#13#10+
    '              and slp.nakl_baseid = dn.baseid '#13#10+
    '           ) '#13#10+
    ' '#13#10+
    '     GROUP BY KOD_MATER,PARTY '#13#10+
    '     HAVING SUM(KOLICH) <> 0 '#13#10+
    '';
    sQueryStorageText =
    ' INSERT '#13#10+
    ' INTO DOC_NAKL_POS (DOCRECNO, KOD_MATER,DATE_ROZLIVA,INVOCE_NUMBER, KOLICH) '#13#10+
    '     SELECT DISTINCT '#13#10+
    '       __RECID__, '#13#10+
    '       KOD_MATER, '#13#10+
    '       DATE_ROZLIVA, '#13#10+
    '       INVOCE_NUMBER, '#13#10+
    '       SUM(KOLICH) '#13#10+
    '     FROM DOC_NAKL_POS, DOC_NAKL dn '#13#10+
    '     WHERE DOC_NAKL_POS.DOCRECNO = DN.RECID '#13#10+
    '       AND DOC_NAKL_POS.BASEID = DN.BASEID '#13#10+
    '       AND exists '#13#10+
    '           (select * '#13#10+
    '            from SORT_LOT_POSITIONS slp '#13#10+
    '            where slp.baseid      = :BASEID '#13#10+
    '              and slp.lotdate     = :LOTDATE '#13#10+
    '              and slp.lotnumber   = :LOTNUMBER '#13#10+
    '              and slp.nakl_recid  = dn.RECID '#13#10+
    '              and slp.nakl_baseid = dn.baseid '#13#10+
    '           ) '#13#10+
    ' '#13#10+
    '     GROUP BY KOD_MATER,DATE_ROZLIVA,INVOCE_NUMBER '#13#10+
    '     HAVING SUM(KOLICH) <> 0 '#13#10+
    '';
    sQueryStorageShip =
    '  EXECUTE BLOCK (                        '#13#10+
    ' BASEID integer = :BASEID,               '#13#10+
    ' LOTDATE date = :LOTDATE,                '#13#10+
    ' LOTNUMBER integer = :LOTNUMBER)         '#13#10+
    ' AS                                      '#13#10+
    '   declare variable doc_recid integer;   '#13#10+
    '   declare variable doc_baseid integer;  '#13#10+
    '   declare variable mater_count integer; '#13#10+
    ' begin                                   '#13#10+
    '   for select slp.nakl_recid, slp.nakl_baseid '#13#10+
    '     from SORT_LOT_POSITIONS slp         '#13#10+
    '     where slp.baseid      = :BASEID     '#13#10+
    '     and slp.lotdate     = :LOTDATE      '#13#10+
    '     and slp.lotnumber   = :LOTNUMBER    '#13#10+
    '     into :doc_recid,:doc_baseid         '#13#10+
    '   do                                    '#13#10+
    '     begin                                '#13#10+
    '       select count(*)  from get_storage_ship(:doc_recid,:doc_baseid,2)  '#13#10+
    '       into :mater_count;                 '#13#10+
    '     end                                   '#13#10+
    ' end                                        ';
var
  q: TMegaQuery;
  q1: TMegaQuery;
  tran : TMegaTransaction;

  NaklForm: IMegaDocNaklForm;
  DocNumber : integer;
  NaklRecID, NaklBaseID : integer;

begin

//  try
  q1:= TMegaQuery.Create(Application.MainForm);
  q1.Database:= IntfDBProvider.GetDB;
  q1.Transaction:=UpdateTransaction;

  // получаю recid baseid новой накладной: GEN_ID(DOC_NAKL_GEN, 1);
  q1.SQL.Text:=sQueryTextRecID;
  MegaExecQuery(q1);
  NaklRecID := q1.Fields[0].asInteger;
  NaklBaseID:= q1.Fields[1].asInteger;

  q1.Close;
  q1.SQL.Text :=
    ' SELECT Max(DOCNUMBER) FROM DOC_NAKL '+
    ' WHERE DOCTYPE = ''' + aAlphaParams.FieldByName('A_DOC1').AsString+''''+
    ' AND   EXTRACT(YEAR FROM OPERDATE) = ' + IntToStr(ExtractYear(fieldByName('LOTDATE').AsDateTime))+
    ' AND   OPERDATE > ''today''-7';
  MegaExecQuery(q1);
  DocNumber := q1.Fields[0].AsInteger + 1;

   // создаем сортировочную накладную
   q1.Close;
   q1.SQL.Text:=sQueryTextNakl;

   q1.ParamByName('RECID').AsInteger := NaklRecID;
   q1.ParamByName('BASEID').AsInteger := NaklBaseID;
   q1.ParamByName('DT').AsDateTime:=fieldByName('LOTDATE').AsDateTime;
   q1.ParamByName('DOCTYPE').AsString := aAlphaParams.FieldByName('A_DOC1').AsString;
   q1.ParamByName('DOCNUMBER').AsInteger := DocNumber;
   q1.ParamByName('GROUP_OPER').AsInteger := aAlphaParams.FieldByName('A_GR_OPER1').AsInteger;
   q1.ParamByName('KOD_OPER').AsInteger := aAlphaParams.FieldByName('A_KOD_OPER1').AsInteger;
   {$ifdef USE_IBX}
   q1.ParamByName('DK_FROM').AsFloat := IntfMegaCommon.GetMainFirmDK;
   q1.ParamByName('DK_TO').AsFloat := IntfMegaCommon.GetMainFirmDK;
   q1.ParamByName('SUMMA').AsFloat := 0;
   q1.ParamByName('KOLICH').AsFloat := 0;
   {$else}
   q1.ParamByName('DK_FROM').AsDouble := IntfMegaCommon.GetMainFirmDK;
   q1.ParamByName('DK_TO').AsDouble := IntfMegaCommon.GetMainFirmDK;
   q1.ParamByName('SUMMA').AsDouble := 0;
   q1.ParamByName('KOLICH').AsDouble := 0;
   {$endif}
   q1.ParamByName('BALANCE_KOD').AsInteger := ibcMP;
   q1.ParamByName('STATE').AsInteger := 0;
   q1.ParamByName('CFO').AsInteger := IntfMegaDBCommon.GetCFO;
   q1.ParamByName('V').AsInteger:=IntfMegaCommon.GetMainBalanceVal;

   MegaExecQuery(q1);


   if IntfMegaDBCommon.GetParam('STORAGE','0')='1'  then //Используется склад
     begin
       //выбираем ценности со склада для всех накладных в сортировке
        q1.Close;
        q1.SQL.Text:= sQueryStorageShip;
        q1.ParamByName('BASEID').AsInteger    := NaklBaseID;
        q1.ParamByName('LOTDATE').AsDateTime  := FieldLotDate.AsDateTime;
        q1.ParamByName('LOTNUMBER').AsInteger := FieldLotNumber.AsInteger;
        MegaExecQuery(q1);
     end;


   // Заполняем саму накладную! Позиции...

   q1.Close;
   if IntfMegaDBCommon.GetParam('STORAGE','0')='0'  then
     q1.SQL.Text:= ReplaceStr(sQueryText , '__RECID__', IntToStr(NaklRecID))
     else q1.SQL.Text:= ReplaceStr(sQueryStorageText , '__RECID__', IntToStr(NaklRecID));
   q1.ParamByName('BASEID').AsInteger    := NaklBaseID;
   q1.ParamByName('LOTDATE').AsDateTime  := FieldLotDate.AsDateTime;
   q1.ParamByName('LOTNUMBER').AsInteger := FieldLotNumber.AsInteger;

   MegaExecQuery(q1);

   // Ставим запрет на изменение сортировочной накладной
   BlockSortNakl( TMegaTransaction(UpdateTransaction),NaklRecID, NaklBaseID);

   // Устанавливаем признак проведения партии.
   MakePartyProv( TMegaTransaction(UpdateTransaction),
                  FieldLotDate.AsDateTime,  FieldBASEID.AsInteger,
                  FieldLotNumber.AsInteger, NaklRecID,NaklBaseID );
//  except
//
//  end;



//  NaklForm:= IntfMegaFormFactory.OpenDocument(
//    Self,
//    aAlphaParams.FieldByName('A_DOC1').AsString, 0, 0,
//    fieldByName('LOTDATE').AsDateTime);
//
//
//  NaklForm.SetNotSetOtsr(True);
//  NaklForm.SetNoOtsr(True);
//
//  NaklForm.SetGroupOper(aAlphaParams.FieldByName('A_GR_OPER1').AsInteger);
//  NaklForm.SetKodOper(aAlphaParams.FieldByName('A_KOD_OPER1').AsInteger);
//
//  NaklForm.SetPriceType(iptZak);
//
//  NaklForm.NaklPost;
//
//
//  q:= NaklForm.GetQuery;
//
//  q.Close;
//  q.SQL.Text:= ReplaceStr(sQueryText , '__RECID__', IntToStr(NaklForm.GetRecID));
//
//  MegaQueryParam(q, 'BASEID').AsInteger         := FieldBaseid.AsInteger;
//  MegaQueryParam(q, 'LOTDATE').AsDateTime       := FieldLotDate.AsDateTime;
//  MegaQueryParam(q, 'LOTNUMBER').AsInteger      := FieldLotNumber.AsInteger;
//
//  MegaExecQuery(q);
//
//  NaklForm.GetDocPos.Close;
//  NaklForm.GetDocPos.Open;
//
//  NaklForm.NaklEdit;
//  NaklForm.DoAfterPost;
//
//  AlphaStarted := True;
//  try
//    NaklForm.SetPriceType(iptAverageExact);
//  finally
//    AlphaStarted:= False;
//  end;
//
//  NaklForm.GetTransaction.CommitRetaining;
//  Transaction.CommitRetaining;
//
//  Edit;
//  FieldNaklRecid.asInteger  := NaklForm.GetRecID;
//  FieldNaklBaseID.AsInteger := intfMegaDBCommon.GetBaseid;
//  FieldCreateTime.ASString  := TimeToStr(Time);
//  Post;
//
//  NaklForm.Close;

end;

procedure TMegaDSSortingLot.CreateCorrectSortingNakl(aAlphaParams: TMegaDSAlphaParams);
const sQueryText = '';
  sQuerySortLot = ' SELECT DISTINCT '#13#10  +
                  ' KOD_MATER, '#13#10  +
                  '  case when coalesce(PARTY, ''-'') = '''' then ''-'' else coalesce(PARTY, ''-'') end as party, '#13#10  +
                  ' SUM(KOLICH)  '#13#10  +
                  ' FROM DOC_NAKL_POS, DOC_NAKL dn  '#13#10  +
                  ' WHERE DOC_NAKL_POS.DOCRECNO = DN.RECID  '#13#10  +
                  ' AND DOC_NAKL_POS.BASEID = DN.BASEID  '#13#10  +
                  ' AND exists(select * '#13#10  +
                  '            from SORT_LOT_POSITIONS slp  '#13#10  +
                  '            where slp.baseid      = :BASEID '#13#10  +
                  '              and slp.lotdate     = :LOTDATE '#13#10  +
                  '              and slp.lotnumber   = :LOTNUMBER '#13#10  +
                  '              and slp.nakl_recid  = dn.RECID '#13#10  +
                  '              and slp.nakl_baseid = dn.baseid )'#13#10  +
                  '      GROUP BY 1, 2  '#13#10  +
                  '     HAVING SUM(KOLICH) <> 0  '#13#10+
                  ' ';
   {sQuerySortLotStorage = ' SELECT DISTINCT '#13#10  +
                  ' KOD_MATER, DATE_ROZLIVA,INVOCE_NUMBER '#13#10  +
                   //' case when coalesce(PARTY, ''-'') = '''' then ''-'' else coalesce(PARTY, ''-'') end as party, '#13#10  +
                  ' SUM(KOLICH)  '#13#10  +
                  ' FROM DOC_NAKL_POS, DOC_NAKL dn  '#13#10  +
                  ' WHERE DOC_NAKL_POS.DOCRECNO = DN.RECID  '#13#10  +
                  ' AND DOC_NAKL_POS.BASEID = DN.BASEID  '#13#10  +
                  ' AND exists(select * '#13#10  +
                  '            from SORT_LOT_POSITIONS slp  '#13#10  +
                  '            where slp.baseid      = :BASEID '#13#10  +
                  '              and slp.lotdate     = :LOTDATE '#13#10  +
                  '              and slp.lotnumber   = :LOTNUMBER '#13#10  +
                  '              and slp.nakl_recid  = dn.RECID '#13#10  +
                  '              and slp.nakl_baseid = dn.baseid )'#13#10  +
                  '      GROUP BY 1, 2, 3  '#13#10  +
                  '     HAVING SUM(KOLICH) <> 0  '#13#10+
                  ' ';
                   }
  sQuerySortNakl= ' select distinct kod_mater, coalesce(PARTY, ''-'') as party,sum(dnp.kolich) '#13#10  +
                  ' from doc_nakl_pos dnp '#13#10  +
                  ' where ( dnp.docrecno = :DOCNUMBER '#13#10  +
                  '     and dnp.baseid = :BASEID) '#13#10  +
                  '  GROUP BY 1, 2 '#13#10  +
                  '  HAVING SUM(KOLICH) <> 0 '#13#10 +
                  '';
  {sQuerySortNaklStorage= ' select distinct kod_mater, DATE_ROZLIVA, INVOCE_NUMBER, sum(dnp.kolich) '#13#10  +
                  ' from doc_nakl_pos dnp '#13#10  +
                  ' where ( dnp.docrecno = :DOCNUMBER '#13#10  +
                  '     and dnp.baseid = :BASEID) '#13#10  +
                  '  GROUP BY 1, 2, 3 '#13#10  +
                  '  HAVING SUM(KOLICH) <> 0 '#13#10 +
                  '';
                      }
  sQueryLinkNakl= ' select distinct dnp.kod_mater, coalesce(dnp.party, ''-'') as party,sum(dnp.kolich) '#13#10  +
                  ' from link_doc_opl ldo  '#13#10  +
                  ' inner join doc_nakl_pos dnp on ( ldo.opl_recid =dnp.docrecno and ldo.parent_baseid= dnp.baseid) '#13#10  +
                  '  where ldo.parent_recid = :DOCNUMBER '#13#10  +
                  '    and ldo.parent_baseid= :BASEID '#13#10  +
                  '  GROUP BY 1, 2 '#13#10  +
                  '  HAVING SUM(KOLICH) <> 0 '#13#10 +
                  ' ';
  {sQueryLinkNaklStorage= ' select distinct dnp.kod_mater, DATE_ROZLIVA, INVOCE_NUMBER,sum(dnp.kolich) '#13#10  +
                  ' from link_doc_opl ldo  '#13#10  +
                  ' inner join doc_nakl_pos dnp on ( ldo.opl_recid =dnp.docrecno and ldo.parent_baseid= dnp.baseid) '#13#10  +
                  '  where ldo.parent_recid = :DOCNUMBER '#13#10  +
                  '    and ldo.parent_baseid= :BASEID '#13#10  +
                  '  GROUP BY 1, 2, 3 '#13#10  +
                  '  HAVING SUM(KOLICH) <> 0 '#13#10 +
                  ' ';}
  sQueryTextNakl =  ' INSERT INTO doc_nakl (RECID,BASEID, '#13#10  +
                    ' OPERDATE, '#13#10  +
                    ' DOCTYPE, DOCNUMBER,DOCDATE,'#13#10  +
                    ' GROUP_OPER,KOD_OPER, DK_FROM,DK_TO,DK_C,  KURS, SUMMA,SUMMA1, NOTES,'#13#10  +
                    ' KOLICH_,  FORMAOPL_,PRICETYPE_, '#13#10  +
                    ' BALANCE_KOD, V,V1, NACENKA_,PRICE_FROM_VALYUTA, '#13#10  +
                    ' STATE,TRIGGER_OFF,OTSR,TRANSPORT,CFO,PRESENT)  '#13#10  +
                    ' '#13#10  +
                    ' VALUES (:RECID,:BASEID, :DT,'#13#10  +
                    ' '#13#10  +
                    ' :DOCTYPE, :DOCNUMBER,:DT, '#13#10  +
                    ' :GROUP_OPER,:KOD_OPER, :DK_FROM,:DK_TO, NULL,1, '#13#10  +
                    ' :SUMMA,:SUMMA, '''', '#13#10  +
                    ' :KOLICH, 1,1,:BALANCE_KOD, '#13#10  +
                    ' :V,:V, 0,:V,'#13#10  +
                    ' :STATE, 0,NULL,0,:CFO,NULL)'#13#10  +
                    ' '#13#10 ;
  sQueryTextRecID = ' select * from new_doc_nakl '#13#10+
                    ' ';
  sQueryTextNaklPos=' INSERT INTO DOC_NAKL_POS (DOCRECNO, KOD_MATER, KOLICH,PARTY) '#13#10  +
                    ' values (:DOCRECNO, :KOD_MATER, :KOLICH, :PARTY) '#13#10+
                    ' ';
  sQueryStorageSortDelete ='DELETE FROM DOC_NAKL_POS dnp where (dnp.docrecno = :DOCNUMBER and dnp.baseid = :BASEID) ';

  sQueryStorageText =
    ' INSERT '#13#10+
    ' INTO DOC_NAKL_POS (DOCRECNO, KOD_MATER,DATE_ROZLIVA,INVOCE_NUMBER, KOLICH) '#13#10+
    '     SELECT DISTINCT '#13#10+
    '       __RECID__, '#13#10+
    '       KOD_MATER, '#13#10+
    '       DATE_ROZLIVA, '#13#10+
    '       INVOCE_NUMBER, '#13#10+
    '       SUM(KOLICH) '#13#10+
    '     FROM DOC_NAKL_POS, DOC_NAKL dn '#13#10+
    '     WHERE DOC_NAKL_POS.DOCRECNO = DN.RECID '#13#10+
    '       AND DOC_NAKL_POS.BASEID = DN.BASEID '#13#10+
    '       AND exists '#13#10+
    '           (select * '#13#10+
    '            from SORT_LOT_POSITIONS slp '#13#10+
    '            where slp.baseid      = :BASEID '#13#10+
    '              and slp.lotdate     = :LOTDATE '#13#10+
    '              and slp.lotnumber   = :LOTNUMBER '#13#10+
    '              and slp.nakl_recid  = dn.RECID '#13#10+
    '              and slp.nakl_baseid = dn.baseid '#13#10+
    '           ) '#13#10+
    ' '#13#10+
    '     GROUP BY KOD_MATER,DATE_ROZLIVA,INVOCE_NUMBER '#13#10+
    '     HAVING SUM(KOLICH) <> 0 '#13#10+
    '';
   sQueryStorageShip =
    '  EXECUTE BLOCK (                        '#13#10+
    ' BASEID integer = :BASEID,               '#13#10+
    ' LOTDATE date = :LOTDATE,                '#13#10+
    ' LOTNUMBER integer = :LOTNUMBER)         '#13#10+
    ' AS                                      '#13#10+
    '   declare variable doc_recid integer;   '#13#10+
    '   declare variable doc_baseid integer;  '#13#10+
    '   declare variable mater_count integer; '#13#10+
    ' begin                                   '#13#10+
    '   for select slp.nakl_recid, slp.nakl_baseid '#13#10+
    '     from SORT_LOT_POSITIONS slp         '#13#10+
    '     where slp.baseid      = :BASEID     '#13#10+
    '     and slp.lotdate     = :LOTDATE      '#13#10+
    '     and slp.lotnumber   = :LOTNUMBER    '#13#10+
    '     into :doc_recid,:doc_baseid         '#13#10+
    '   do                                    '#13#10+
    '     begin                                '#13#10+
    '       select count(*)  from get_storage_ship(:doc_recid,:doc_baseid, 2)  '#13#10+
    '       into :mater_count;                 '#13#10+
    '     end                                   '#13#10+
    ' end                                        ';


var cds :TClientDataSet;
    q: TMegaQuery;
    KOD_MATER : double;
    KOLICH : integer;
    SortNakl : TSortNakl;
  DocNumber : integer;
  NaklRecID, NaklBaseID : integer;
  isCorrectNakl : boolean;
begin
 //
 isCorrectNakl :=false;
 cds := TClientDataSet.Create(Self);
 q:= TMegaQuery.Create(Application.MainForm);
 q.Database:= IntfDBProvider.GetDB;
 q.Transaction:=UpdateTransaction;

 // датасет для сравнения
 try // finally
  if IntfMegaDBCommon.GetParam('STORAGE','0')='0'  then //Не используется артионный учет склада
  try
   with cds.FieldDefs.AddFieldDef do
    begin
      Name:='KOD_MATER';
      DataType:=ftFloat;
    end;
   with cds.FieldDefs.AddFieldDef do
    begin
      Name:='KOL_SORTPARTY';
      DataType:=ftInteger;
    end;
   with cds.FieldDefs.AddFieldDef do
    begin
      Name:='KOL_Nakl';
      DataType:=ftInteger;
    end;
   with cds.FieldDefs.AddFieldDef do
    begin
      Name:='DELTA';
      DataType:=ftInteger;
    end;
    with cds.FieldDefs.AddFieldDef do
    begin
      Name:='PARTY';
      DataType:=ftString;
      Size:=100;
    end;
   { if IntfMegaDBCommon.GetParam('STORAGE','0')='1'  then  //Используется склад
      begin
         with cds.FieldDefs.AddFieldDef do
          begin
            Name:='DATE_ROZLIVA';
            DataType:=ftDateTime;

          end;
        with cds.FieldDefs.AddFieldDef do
          begin
            Name:='INVOCE_NUMBER';
            DataType:=ftString;
            Size:=45;
          end;
      end;   }

  cds.CreateDataSet;
  // количество товара в сортировочной партии.
  q.Close;
  //if IntfMegaDBCommon.GetParam('STORAGE','0')='0'  then //Не используется склад
     q.SQL.Text := sQuerySortLot;
  //else q.SQL.Text := sQuerySortLotStorage;

  q.ParamByName('BASEID').AsInteger    := FieldBaseID.AsInteger;
  q.ParamByName('LOTDATE').AsDateTime  := FieldLotDate.AsDateTime;
  q.ParamByName('LOTNUMBER').AsInteger := FieldLotNumber.AsInteger;

  MegaExecQuery(q);
  //if IntfMegaDBCommon.GetParam('STORAGE','0')='0'  then  //Не используется склад
   // begin
      while not q.EOF do
        begin
          cds.Append;
          {$ifdef USE_IBX}
          cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsFloat;
          {$else}
          cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsDouble;
          {$endif}
          cds.FieldByName('KOL_SORTPARTY').AsInteger:= q.FieldByName('SUM').AsInteger;
          cds.FieldByName('PARTY').AsString:= q.FieldByName('PARTY').AsString;
          cds.FieldByName('KOL_Nakl').AsInteger:= 0;
          cds.FieldByName('DELTA').AsInteger:= 0;
          cds.Post;
          q.Next;
        end;
   { end
      else
        begin
          while not q.EOF do
            begin
              cds.Append;
              {$ifdef USE_IBX}
            //  cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsFloat;
            //  {$else}
            //  cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsDouble;
            //  {$endif}
            {  cds.FieldByName('KOL_SORTPARTY').AsInteger:= q.FieldByName('SUM').AsInteger;
              cds.FieldByName('DATE_ROZLIVA').AsDateTime:= q.FieldByName('DATE_ROZLIVA').AsDateTime;
              cds.FieldByName('INVOCE_NUMBER').AsString:= q.FieldByName('INVOCE_NUMBER').AsString;
              //cds.FieldByName('PARTY').AsString:= q.FieldByName('PARTY').AsString;
              cds.FieldByName('KOL_Nakl').AsInteger:= 0;
              cds.FieldByName('DELTA').AsInteger:= 0;
              cds.Post;
              q.Next;
            end;
        end;  }
  // количество товара по сортировочной накладной.
  SortNakl := GetSortNaklOld(FieldLotDate.AsDateTime,FieldBaseID.AsInteger,FieldLotNumber.AsInteger);
  q.Close;
  //if IntfMegaDBCommon.GetParam('STORAGE','0')='0'  then //Не используется склад
    q.SQL.Text := sQuerySortNakl;
   // else q.SQL.Text := sQuerySortNaklStorage;
  q.ParamByName('BASEID').AsInteger    := SortNakl.BaseID;
  q.ParamByName('DOCNUMBER').AsInteger := SortNakl.RecID;

  MegaExecQuery(q);
   //if IntfMegaDBCommon.GetParam('STORAGE','0')='0'  then //Не используется склад
    // begin
       while not q.EOF do
         begin
           {$ifdef USE_IBX}
           KOD_MATER := q.FieldByName('KOD_MATER').AsFloat;
           {$else}
           KOD_MATER := q.FieldByName('KOD_MATER').AsDouble;
           {$endif}
           KOLICH := q.FieldByName('SUM').AsInteger;
           if cds.Locate('KOD_MATER;PARTY',VarArrayOf([ KOD_MATER, q.FieldByName('PARTY').AsString ]),[loPartialKey])
             then begin
               cds.Edit;
               cds.FieldByName('KOL_Nakl').AsInteger := KOLICH;
               cds.Post;
              end
           else begin
                  cds.Append;
                  {$ifdef USE_IBX}
                  cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsFloat;
                  {$else}
                  cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsDouble;
                 {$endif}
                  cds.FieldByName('KOL_SORTPARTY').AsInteger:= 0;
                  cds.FieldByName('PARTY').AsString:= q.FieldByName('PARTY').AsString;
                  cds.FieldByName('KOL_Nakl').AsInteger:= KOLICH;
                  cds.FieldByName('DELTA').AsInteger:= 0;
                  cds.Post;
           end;
           q.Next;
         end;
   { end
      else
        begin
          while not q.EOF do
            begin
              {$ifdef USE_IBX}
             // KOD_MATER := q.FieldByName('KOD_MATER').AsFloat;
             // {$else}
             // KOD_MATER := q.FieldByName('KOD_MATER').AsDouble;
             // {$endif}
            {  KOLICH := q.FieldByName('SUM').AsInteger;
              if cds.Locate('KOD_MATER;DATE_ROZLIVA;INVOCE_NUMBER',VarArrayOf([ KOD_MATER, q.FieldByName('DATE_ROZLIVA').AsDateTime, q.FieldByName('INVOCE_NUMBER').AsString]),[loPartialKey])
                then begin
                  cds.Edit;
                  cds.FieldByName('KOL_Nakl').AsInteger := KOLICH;
                  cds.Post;
                end
                else begin
                       cds.Append;
                       {$ifdef USE_IBX}
                     //  cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsFloat;
                    //   {$else}
                    //   cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsDouble;
                    //   {$endif}
                  {     cds.FieldByName('KOL_SORTPARTY').AsInteger:= 0;
                       cds.FieldByName('DATE_ROZLIVA').AsDateTime:= q.FieldByName('DATE_ROZLIVA').AsDateTime;
                       cds.FieldByName('INVOCE_NUMBER').AsString:= q.FieldByName('INVOCE_NUMBER').AsString;
                       cds.FieldByName('KOL_Nakl').AsInteger:= KOLICH;
                       cds.FieldByName('DELTA').AsInteger:= 0;
                       cds.Post;
              end;
              q.Next;
            end;
        end; }

  // количество товара по связанным документам.
  q.Close;
  //if IntfMegaDBCommon.GetParam('STORAGE','0')='0'  then //Не используется склад
    q.SQL.Text := sQueryLinkNakl;
  //else q.SQL.Text := sQueryLinkNaklStorage;
  q.ParamByName('BASEID').AsInteger    := SortNakl.BaseID;
  q.ParamByName('DOCNUMBER').AsInteger := SortNakl.RecID;

  MegaExecQuery(q);
  //if IntfMegaDBCommon.GetParam('STORAGE','0')='0'  then //Не используется склад
    //begin
      while not q.EOF do
        begin
          {$ifdef USE_IBX}
          KOD_MATER := q.FieldByName('KOD_MATER').AsFloat;
          {$else}
          KOD_MATER := q.FieldByName('KOD_MATER').AsDouble;
          {$endif}
          KOLICH := q.FieldByName('SUM').AsInteger;
          if cds.Locate('KOD_MATER',VarArrayOf([ KOD_MATER ]),[loPartialKey])
          then begin
              cds.Edit;
              cds.FieldByName('KOL_Nakl').AsInteger := cds.FieldByName('KOL_Nakl').AsInteger + KOLICH;
              cds.Post;
              end
          else begin
                cds.Append;
                {$ifdef USE_IBX}
                cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsFloat;
                {$else}
                cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsDouble;
                {$endif}
                cds.FieldByName('KOL_SORTPARTY').AsInteger:= 0;
                cds.FieldByName('PARTY').AsString:= q.FieldByName('PARTY').AsString;
                cds.FieldByName('KOL_Nakl').AsInteger:= KOLICH;
                cds.FieldByName('DELTA').AsInteger:= 0;
                cds.Post;
               end;
          q.Next;
        end;
   { end
  else
    begin
      while not q.EOF do
        begin
          {$ifdef USE_IBX}
         // KOD_MATER := q.FieldByName('KOD_MATER').AsFloat;
         // {$else}
         // KOD_MATER := q.FieldByName('KOD_MATER').AsDouble;
         // {$endif}
         { KOLICH := q.FieldByName('SUM').AsInteger;
          if cds.Locate('KOD_MATER',VarArrayOf([ KOD_MATER ]),[loPartialKey])
          then begin
              cds.Edit;
              cds.FieldByName('KOL_Nakl').AsInteger := cds.FieldByName('KOL_Nakl').AsInteger + KOLICH;
              cds.Post;
              end
          else begin
                cds.Append;
                {$ifdef USE_IBX}
               // cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsFloat;
               // {$else}
             //   cds.FieldByName('KOD_MATER').AsFloat:=q.FieldByName('KOD_MATER').AsDouble;
             //   {$endif}
            {    cds.FieldByName('KOL_SORTPARTY').AsInteger:= 0;
                cds.FieldByName('PARTY').AsString:= q.FieldByName('PARTY').AsString;
                cds.FieldByName('KOL_Nakl').AsInteger:= KOLICH;
                cds.FieldByName('DELTA').AsInteger:= 0;
                cds.Post;
               end;
          q.Next;
        end;


    end   }
  // Вычисляем дельту по всем позициям.
  cds.First;
  while not cds.Eof do
   begin
    cds.Edit;
    cds.FieldByName('DELTA').AsInteger:= cds.FieldByName('KOL_SORTPARTY').AsInteger - cds.FieldByName('KOL_Nakl').AsInteger;
    if cds.FieldByName('DELTA').AsInteger<>0 then isCorrectNakl := true;
    cds.Post;
    cds.Next;
   end;

   if isCorrectNakl then begin

   q.Close;
   q.SQL.Text:=sQueryTextRecID;
   MegaExecQuery(q);

   NaklRecID := q.Fields[0].asInteger;
   NaklBaseID:= q.Fields[1].asInteger;

  q.Close;
  q.SQL.Text :=
    ' SELECT Max(DOCNUMBER) FROM DOC_NAKL '+
    ' WHERE DOCTYPE = ''' + aAlphaParams.FieldByName('A_DOC1').AsString+''''+
    ' AND   EXTRACT(YEAR FROM OPERDATE) = ' + IntToStr(ExtractYear(fieldByName('LOTDATE').AsDateTime))+
    ' AND   OPERDATE > ''today''-7';
  MegaExecQuery(q);
  DocNumber := q.Fields[0].AsInteger + 1;
   try
     q.Close;
     q.SQL.Text:=sQueryTextNakl;

     q.ParamByName('RECID').AsInteger := NaklRecID;
     q.ParamByName('BASEID').AsInteger := NaklBaseID;
     q.ParamByName('DT').AsDateTime:=fieldByName('LOTDATE').AsDateTime;
     q.ParamByName('DOCTYPE').AsString := aAlphaParams.FieldByName('A_DOC1').AsString;
     q.ParamByName('DOCNUMBER').AsInteger := DocNumber;
     q.ParamByName('GROUP_OPER').AsInteger := aAlphaParams.FieldByName('A_GR_OPER1').AsInteger;
     q.ParamByName('KOD_OPER').AsInteger := aAlphaParams.FieldByName('A_KOD_OPER1').AsInteger;
     {$ifdef USE_IBX}
     q.ParamByName('DK_FROM').AsFloat := IntfMegaCommon.GetMainFirmDK;
     q.ParamByName('DK_TO').AsFloat := IntfMegaCommon.GetMainFirmDK;
     q.ParamByName('SUMMA').AsFloat := 0.0;
     q.ParamByName('KOLICH').AsFloat := 0.0;
     {$else}
     q.ParamByName('DK_FROM').AsDouble := IntfMegaCommon.GetMainFirmDK;
     q.ParamByName('DK_TO').AsDouble := IntfMegaCommon.GetMainFirmDK;
     q.ParamByName('SUMMA').AsDouble := 0.0;
     q.ParamByName('KOLICH').AsDouble := 0.0;
     {$endif}
     q.ParamByName('BALANCE_KOD').AsInteger := IntfMegaCommon.GetCurActiveMainBalance;
     q.ParamByName('STATE').AsInteger := 0;
     q.ParamByName('CFO').AsInteger := IntfMegaDBCommon.GetCFO;//NaklBaseID;
     q.ParamByName('V').AsInteger:=IntfMegaCommon.GetMainBalanceVal;
     MegaExecQuery(q);
   except
    on E: Exception do begin
                        UpdateTransaction.RollbackRetaining;
                        Raise E;
                       end;

   end;
   q.Close;
   q.SQL.Text := sQueryTextNaklPos;

   cds.First;
   while not cds.Eof do
    begin
      if cds.FieldByName('DELTA').AsInteger <> 0 then
      begin
       q.Close;
       q.ParamByName('DOCRECNO').AsInteger := NaklRecID;
       {$ifdef USE_IBX}
       q.ParamByName('KOLICH').AsFloat := cds.FieldByName('DELTA').AsInteger;
       q.ParamByName('KOD_MATER').AsFloat := cds.FieldByName('KOD_MATER').AsFloat;
       if cds.FieldByName('PARTY').AsString = '-' then
         q.ParamByName('PARTY').AsVariant := null
       else
         q.ParamByName('PARTY').AsString := cds.FieldByName('PARTY').AsString;
       {$else}
       q.ParamByName('KOLICH').AsDouble := cds.FieldByName('DELTA').AsInteger;
       q.ParamByName('KOD_MATER').AsDouble := cds.FieldByName('KOD_MATER').AsFloat;
       if cds.FieldByName('PARTY').AsString = '-' then
         q.ParamByName('PARTY').AsVariant := null
       else
         q.ParamByName('PARTY').AsString := cds.FieldByName('PARTY').AsString;
       {$endif}
       MegaExecQuery(q);
      end;
      cds.Next;
    end;
  MakeLinkDoc( TMegaTransaction(UpdateTransaction) ,
                FieldLotDate.AsDateTime,FieldBaseID.AsInteger,
                FieldLotNumber.AsInteger,
                NaklRecID, NaklBaseID);

                         end; // if isCorrectNakl then begin

  BlockSortNakl( TMegaTransaction(UpdateTransaction),NaklRecID, NaklBaseID);
  except
    on E: Exception do begin
                        UpdateTransaction.RollbackRetaining;
                        Raise E;
                       end;

  end
    else
      begin
        SortNakl := GetSortNaklOld(FieldLotDate.AsDateTime,FieldBaseID.AsInteger,FieldLotNumber.AsInteger);
        //выбираем ценности со склада для всех накладных в сортировке
        q.Close;
        q.SQL.Text:= sQueryStorageShip;
        q.ParamByName('BASEID').AsInteger    := SortNakl.BaseID;
        q.ParamByName('LOTDATE').AsDateTime  := FieldLotDate.AsDateTime;
        q.ParamByName('LOTNUMBER').AsInteger := FieldLotNumber.AsInteger;
        MegaExecQuery(q);

        // удаляем все ценности ис сортировки
        q.Close;
        q.SQL.Text := sQueryStorageSortDelete;
        q.ParamByName('BASEID').AsInteger    := SortNakl.BaseID;
        q.ParamByName('DOCNUMBER').AsInteger := SortNakl.RecID;
        MegaExecQuery(q);

        // Заполняем саму накладную! Позиции...
        q.Close;
        q.SQL.Text:= ReplaceStr(sQueryStorageText , '__RECID__', IntToStr(SortNakl.RecID));
        q.ParamByName('BASEID').AsInteger    := SortNakl.BaseID;
        q.ParamByName('LOTDATE').AsDateTime  := FieldLotDate.AsDateTime;
        q.ParamByName('LOTNUMBER').AsInteger := FieldLotNumber.AsInteger;
        MegaExecQuery(q);
        q.Close;
        BlockSortNakl( TMegaTransaction(UpdateTransaction),SortNakl.RecID, SortNakl.BaseID);

      end;
 finally

  q.Free;
  cds.Free;
 end;
end;



procedure TMegaDSSortingLot.ProcessMakePartyDetail(aMasterRecId,  aMasterBaseId: Integer);
const
  sqlGetAlphaMasterID=
    'SELECT                                       '#13#10+
    '  am.ID, am.BASEID, am.ORDERNUM,              '#13#10+
    '  am.NAME, am.DOCTYPE, am.GROUP_OPER,          '#13#10+
    '  am.KOD_OPER, am.PRICE, am.BEGINDATE,          '#13#10+
    '  am.ENDDATE, am.CREATE_NAKL, am.ALPHA_DK_FROM,  '#13#10+
    '  am.ALPHA_DK_TO, am.PP_DOCTYPE, am.PP_GROUP_OPER,'#13#10+
    '  am.PP_KOD_OPER, am.PP_BALANCE, am.PP_PRICE, coalesce(am.RECALC_PRICE,0) RECALC_PRICE '#13#10+
    'FROM ALPHA_MASTER am                            '#13#10+
    'WHERE am.baseid=:bid                           '#13#10+
    '  AND am.id=:id                               ';

  sqlGetAlphaDetailID=
    'SELECT                              '#13#10+
    '  ad.SUBID, ad.BASEID, ad.MASTERID,  '#13#10+
    '  ad.DOCTYPE_FROM, ad.GROUP_OPER_FROM,'#13#10+
    '  ad.KOD_OPER_FROM, ad.DOCTYPE_TO,    '#13#10+
    '  ad.GROUP_OPER_TO, ad.KOD_OPER_TO,  '#13#10+
    '  ad.NOTE1, ad.NOTE2, ad.BALANCE_KOD '#13#10+
    'FROM ALPHA_DETAIL ad                '#13#10+
    'WHERE ad.masterid=:mid             '#13#10+
    '  AND ad.baseid=:bid              ';

  sqlUpdateNakl=
    ' UPDATE DOC_NAKL dn                  '#13#10+
    ' SET                                  '#13#10+
    '   dn.DOCTYPE         = :NEW_DOCTYPE,  '#13#10+
    '   dn.GROUP_OPER      = :NEW_GROUP_OPER,'#13#10+
    '   dn.KOD_OPER        = :NEW_KOD_OPER  '#13#10+
    ' WHERE dn.BALANCE_KOD = :BALANCE_KOD  '#13#10+
    '   and dn.DOCTYPE     = :OLD_DOCTYPE   '#13#10+
    '   AND dn.GROUP_OPER  = :OLD_GROUP_OPER '#13#10+
    '   AND dn.KOD_OPER    = :OLD_KOD_OPER    '#13#10+
    '   AND dn.CFO         = :CFO              '#13#10+
    '   AND EXISTS(                             '#13#10+
    '       SELECT * FROM SORT_LOT_POSITIONS slp'#13#10+
    '       WHERE slp.LOTNUMBER  = :LOTNUMBER   '#13#10+
    '         AND slp.lotdate    = :LOTDATE    '#13#10+
    '         AND slp.BASEID     = :BASEID    '#13#10+
    '         AND slp.NAKL_RECID = dn.RECID   '#13#10+
    '         AND slp.NAKL_BASEID= dn.BASEID )';

  sqlGetDocPosInsert =
    'INSERT INTO DOC_NAKL_POS (DOCRECNO, KOD_MATER,                     '#13#10+
    '       KOLICH, SUMMA, SUMMA1, IND, TRIGGER_OFF )                   '#13#10+
    'VALUES( :DOCRECNO, :KOD_MATER, :KOLICH, :SUMMA, :SUMMA1, :IND, 1 ) '#13#10;
  sQueryStorageShip =
    ' EXECUTE BLOCK (                        '#13#10+
    ' BASEID integer = :BASEID,               '#13#10+
    ' LOTDATE date = :LOTDATE,                '#13#10+
    ' LOTNUMBER integer = :LOTNUMBER)         '#13#10+
    ' AS                                      '#13#10+
    '   declare variable doc_recid integer;   '#13#10+
    '   declare variable doc_baseid integer;  '#13#10+
    '   declare variable mater_count integer; '#13#10+
    ' begin                                   '#13#10+
    '   for select slp.nakl_recid, slp.nakl_baseid '#13#10+
    '     from SORT_LOT_POSITIONS slp         '#13#10+
    '     where slp.baseid      = :BASEID     '#13#10+
    '     and slp.lotdate     = :LOTDATE      '#13#10+
    '     and slp.lotnumber   = :LOTNUMBER    '#13#10+
    '     into :doc_recid,:doc_baseid         '#13#10+
    '   do                                    '#13#10+
    '     begin                                '#13#10+
    '       select count(*)  from get_storage_ship(:doc_recid,:doc_baseid,2)  '#13#10+
    '       into :mater_count;                 '#13#10+
    '     end                                   '#13#10+
    ' end                                        ';

var dsAM,dsAD:TMegaDataSet;//DataSet для Master и Detail
    qUpdNakl:TMegaQuery;
    Nakl: TMegaObjDocNakl;
    PlusNaklExists, MinusNaklExists : boolean;
    strWhere:String;
    strAllPos:String;// Итоговый запрос на Insert всех позиций в консолидированную накладную
    cdsPos : TClientDataSet;

  procedure CreateCDS;
  const
    sqlGetDocPosSelect =
  'SELECT A.KOD_MATER,                                                                   '#13#10+
  '       A.KOLICH, A.SUMMA,                                                             '#13#10+
  '       A.SUMMA1, 0 IND, CASE WHEN A.KOLICH < 0 THEN 0 else 1 end OrdByNegativ         '#13#10+
  'FROM (                                                                                '#13#10+
  '     -- суммирую все позиции по накладным в партии                               '#13#10+
  '     SELECT dnp.KOD_MATER, dnp.KOLICH,dnp.SUMMA, dnp.SUMMA1                                                 '#13#10+
  '       FROM SORT_LOT_POSITIONS slp                                                                          '#13#10+
  '       LEFT JOIN DOC_NAKL dn on slp.NAKL_RECID = dn.RECID and slp.NAKL_BASEID= dn.BASEID and dn.CFO = :CFO  '#13#10+
  '       LEFT JOIN DOC_NAKL_POS dnp on                                                                        '#13#10+
  '           dnp.DOCRECNO = dn.RECID AND dnp.BASEID = dn.BASEID                                               '#13#10+
  '       WHERE slp.LOTNUMBER  = :LOTNUMBER                                                                    '#13#10+
  '         AND slp.lotdate    = :LOTDATE                                                                      '#13#10+
  '         AND slp.BASEID     = :BASEID                                                                       '#13#10+
  '       and exists (select * from alpha_detail ad where ad.masterid=:id and ad.baseid=:baseid and ((ad.group_oper_from=dn.group_oper and ad.kod_oper_from=dn.kod_oper) '#13#10+
  '       or (ad.group_oper_to=dn.group_oper and ad.kod_oper_to=dn.kod_oper) )) '#13#10+
  '     UNION ALL -- вычитаю позиции из главной сортировочной накладной                   '#13#10+
  '                                                                                      '#13#10+
  '     SELECT dnp.KOD_MATER, (-dnp.KOLICH)KOLICH, (-dnp.SUMMA)SUMMA, (-dnp.SUMMA1)SUMMA1'#13#10+
  '     FROM SORT_LOT sl                                                                 '#13#10+
  '     LEFT JOIN DOC_NAKL_POS dnp ON sl.NAKL_RECID = dnp.DOCRECNO                       '#13#10+
  '                               AND sl.NAKL_BASEID= dnp.BASEID                         '#13#10+
  '     WHERE sl.LOTNUMBER  = :LOTNUMBER                                                 '#13#10+
  '       AND sl.LOTDATE    = :LOTDATE                                                   '#13#10+
  '       AND sl.BASEID     = :BASEID                                                    '#13#10+
  '                                                                                      '#13#10+
  '    UNION ALL -- вычитаю позиции из корректировочных накладных                        '#13#10+
  '                                                                                      '#13#10+
  '     SELECT dnp.KOD_MATER, -(dnp.KOLICH), -(dnp.SUMMA), -(dnp.SUMMA1)                 '#13#10+
  '     FROM SORT_LOT sl                                                                 '#13#10+
  '     LEFT JOIN LINK_DOC_OPL ldo ON sl.NAKL_RECID = ldo.parent_recid                   '#13#10+
  '                               AND sl.NAKL_BASEID= ldo.parent_baseid                  '#13#10+
  '     LEFT JOIN DOC_NAKL dn ON ldo.opl_recid =dn.RECID                                 '#13#10+
  '                          AND ldo.OPL_BASEID= dn.BASEID                               '#13#10+
  '                          and dn.KOD_OPER   = :KOD_TDM_TO_SORT                        '#13#10+
  '                          and dn.GROUP_OPER = :GROUP_TDM_TO_SORT                      '#13#10+
  '     LEFT JOIN DOC_NAKL_POS dnp ON dn.RECID = dnp.docrecno                            '#13#10+
  '                               AND dn.BASEID= dnp.baseid                              '#13#10+
  '     WHERE sl.LOTNUMBER  = :LOTNUMBER                                                 '#13#10+
  '       AND sl.LOTDATE    = :LOTDATE                                                   '#13#10+
  '       AND sl.BASEID     = :BASEID                                                    '#13#10+
  '                                                                                      '#13#10+
  '    UNION ALL -- вычитаю позиции из обратных корректировочных накладных               '#13#10+
  '                                                                                      '#13#10+
  '     SELECT dnp.KOD_MATER, (dnp.KOLICH), (dnp.SUMMA), (dnp.SUMMA1)                    '#13#10+
  '     FROM SORT_LOT sl                                                                 '#13#10+
  '     LEFT JOIN LINK_DOC_OPL ldo ON sl.NAKL_RECID = ldo.parent_recid                   '#13#10+
  '                               AND sl.NAKL_BASEID= ldo.parent_baseid                  '#13#10+
  '     LEFT JOIN DOC_NAKL dn ON ldo.opl_recid =dn.RECID                                 '#13#10+
  '                          AND ldo.OPL_BASEID= dn.BASEID                               '#13#10+
  '                          and dn.KOD_OPER   = :KOD_SORT_TO_TDM                        '#13#10+
  '                          and dn.GROUP_OPER = :GROUP_SORT_TO_TDM                      '#13#10+
  '     LEFT JOIN DOC_NAKL_POS dnp ON dn.RECID = dnp.docrecno                            '#13#10+
  '                               AND dn.BASEID= dnp.baseid                              '#13#10+
  '     WHERE sl.LOTNUMBER  = :LOTNUMBER                                                 '#13#10+
  '       AND sl.LOTDATE    = :LOTDATE                                                   '#13#10+
  '       AND sl.BASEID     = :BASEID                                                    '#13#10+
  '     ) A                                                                              '#13#10+
  ' ORDER BY A.KOD_MATER, OrdByNegativ, A.KOLICH desc                                    ';


   sqlGetDocPosSelectNew = '  select KOD_MATER, KOLICH, SUMMA, SUMMA1, IND, ORDBYNEGATIV  '+
                         '  from GET_SORT_KOLICH_POS(:LOTNUMBER, :LOTDATE, :BASEID, :ID, :KOD_SORT_TO_TDM, :GROUP_SORT_TO_TDM, :KOD_TDM_TO_SORT, :GROUP_TDM_TO_SORT, :CFO) ';




  var
    qrPos:TMegaQuery;
    aNeedUpdate : boolean;
  begin

    qrPos := TMegaQuery.Create(self);
    qrPos.Database:=DataBase;
    qrPos.Transaction:=UpdateTransaction;
    qrPos.SQL.Text:=sqlGetDocPosSelectNew;//sqlGetDocPosSelect;
    qrPos.GoToFirstRecordOnExecute := true;
    qrPos.Prepare;
    qrPos.ParamByName('BASEID').AsInteger   := IntfMegaDBCommon.GetBaseID;
    qrPos.ParamByName('LOTNUMBER').AsInteger:= FieldLotNumber.AsInteger;
    qrPos.ParamByName('LOTDATE').AsDateTime := FieldLotDate.AsDateTime;
    qrPos.ParamByName('CFO').AsInteger      := FieldCFO.asInteger;
    qrPos.ParamByName('KOD_TDM_TO_SORT').AsInteger  := dsAM.FieldByName('KOD_OPER').AsInteger;
    qrPos.ParamByName('GROUP_TDM_TO_SORT').AsInteger:= dsAM.FieldByName('GROUP_OPER').AsInteger;
    qrPos.ParamByName('KOD_SORT_TO_TDM').AsInteger  := dsAM.FieldByName('PP_KOD_OPER').AsInteger;
    qrPos.ParamByName('GROUP_SORT_TO_TDM').AsInteger:= dsAM.FieldByName('PP_GROUP_OPER').AsInteger;
    qrPos.ParamByName('ID').AsInteger:= aMasterRecId;
    qrPos.ExecQuery;

    cdsPos := TClientDataSet.Create(Self);
    cdsPos.Close;
    cdsPos.Fields.Clear;
    cdsPos.FieldDefs.Clear;
    cdsPos.IndexDefs.Clear;
    with cdsPos.FieldDefs.AddFieldDef do
     begin
      DataType := ftFloat;
      Name := 'KOD_MATER';
     end;
    with cdsPos.FieldDefs.AddFieldDef do
     begin
      DataType := ftFloat;
      Name := 'KOLICH';
     end;
    with cdsPos.FieldDefs.AddFieldDef do
     begin
      DataType := ftFloat;
      Name := 'SUMMA';
     end;
    with cdsPos.FieldDefs.AddFieldDef do
     begin
      DataType := ftFloat;
      Name := 'SUMMA1';
     end;
    with cdsPos.FieldDefs.AddFieldDef do
     begin
      DataType := ftInteger;
      Name := 'IND';
     end;
    with cdsPos.IndexDefs.AddIndexDef do
     begin
      Fields := 'KOD_MATER';
      Name := 'idx_KOD_MATER';
     end;

    cdsPos.CreateDataSet;
    cdsPos.EmptyDataSet;

    while not qrPos.Eof do
    begin

      aNeedUpdate := false;
      if cdsPos.Locate('KOD_MATER',qrPos.FN('KOD_MATER').Value,[]) then
      begin
        // если такая ценность уже есть, то увеличиваем
        // ее количество до положитеьного а потом дробим
        // как в расходных накладных
  //      if cdsPos.FieldByName('KOLICH').AsFloat < 0 then
          aNeedUpdate := true;
      end;


      if aNeedUpdate then
      begin
        cdsPos.Edit;
        cdsPos.FieldByName('KOLICH').AsFloat := cdsPos.FieldByName('KOLICH').AsFloat +
                                                qrPos.FN('KOLICH').AsFloat;
        cdsPos.FieldByName('SUMMA').AsFloat  := cdsPos.FieldByName('SUMMA').AsFloat  +
                                                qrPos.FN('SUMMA').AsFloat;
        cdsPos.FieldByName('SUMMA1').AsFloat := cdsPos.FieldByName('SUMMA1').AsFloat +
                                                qrPos.FN('SUMMA1').AsFloat;
        cdsPos.FieldByName('IND').AsFloat    := qrPos.FN('IND').AsInteger;
        cdsPos.Post;
      end
      else
      begin
        cdsPos.Insert;
        cdsPos.FieldByName('KOD_MATER').AsFloat:= qrPos.FN('KOD_MATER').AsFloat;
        cdsPos.FieldByName('KOLICH').AsFloat := qrPos.FN('KOLICH').AsFloat;
        cdsPos.FieldByName('SUMMA').AsFloat  := qrPos.FN('SUMMA' ).AsFloat;
        cdsPos.FieldByName('SUMMA1').AsFloat := qrPos.FN('SUMMA1').AsFloat;
        cdsPos.FieldByName('IND').AsFloat    := qrPos.FN('IND'   ).AsInteger;
        cdsPos.Post;
      end;

      qrPos.Next;
    end;
    qrPos.Close;
    qrPos.Free;
  end;
begin
   try
    // строчка из Alpha_Master
    dsAM:=TMegaDataSet.Create(self);
    dsAM.DataBase:=DataBase;
    dsAM.Transaction:=UpdateTransaction;
    dsAM.SelectSQL.Text:=sqlGetAlphaMasterID;
    dsAM.Params.ByName['id'].AsInteger:=aMasterRecId;
    dsAM.Params.ByName['bid'].AsInteger:=aMasterBaseId;
    dsAM.Open;

    // меняю группу/код операции
    qUpdNakl:=TMegaQuery.Create(self);
    qUpdNakl.Database:=DataBase;
    qUpdNakl.Transaction:=UpdateTransaction;
    qUpdNakl.SQL.Text:=sqlUpdateNakl;

    // заполняю позиции
    CreateCDS;

    // проверяю есть ли положительные/отрицательные позиции
    PlusNaklExists := false;
    MinusNaklExists:= false;

    cdsPos.First;
    while not cdsPos.Eof do
    begin
      if cdsPos.FieldByName('KOLICH').AsFloat > 0 then
        PlusNaklExists := true;
      if cdsPos.FieldByName('KOLICH').AsFloat < 0 then
        MinusNaklExists := true;
      cdsPos.Next;
    end;

    (**!!!!*)

    if PlusNaklExists then
    begin
      // ***** Создание консолидированной накладной (баланс Мегаполиса) *****//
      Nakl := TMegaObjDocNakl.Create(DataBase, UpdateTransaction);

      Nakl.New(dsAM.FieldByName('DOCTYPE').AsString);

      if (GetSortSkladVer in [2,4]) then
        Nakl.fieldOPERDATE.AsDateTime := DateOf(IntfIBCommon.GetServerDate)
       else
        Nakl.fieldOPERDATE.AsDateTime := FieldLotDate.AsDateTime; // в будущем ч

      Nakl.fieldDOCDATE.AsDateTime  := Nakl.fieldOPERDATE.AsDateTime;
      Nakl.fieldGROUP_OPER.AsInteger:= dsAM.FieldByName('GROUP_OPER').AsInteger;
      Nakl.fieldKOD_OPER.AsInteger  := dsAM.FieldByName('KOD_OPER').AsInteger;
      Nakl.fieldDK_FROM.AsFloat     := dsAM.FieldByName('ALPHA_DK_FROM').AsFloat;
      Nakl.fieldDK_TO.AsFloat       := dsAM.FieldByName('ALPHA_DK_TO').AsFloat;
      Nakl.fieldDOCNUMBER.AsInteger := FieldLotNumber.AsInteger;

      Nakl.fieldCFO.AsInteger       := FieldCFO.asInteger;
      Nakl.fieldAddrFrom.AsInteger  := FieldCFO.asInteger;
      Nakl.fieldAddrTo.AsInteger    := FieldCFO.asInteger;
      Nakl.fieldBalanceKod.AsInteger:= IntfMegaCommon.GetMainFirmBalanceKod;

      if dsAM.FieldByName('PRICE').AsInteger = 0 then
        Nakl.fieldPriceType.AsInteger:= iptAverageExact
       else
        Nakl.fieldPriceType.AsInteger:= dsAM.FieldByName('PRICE').AsInteger;
      Nakl.fieldSTATE.AsInteger := 5;
      Nakl.Post;

      // добавляю позиции
      Nakl.GetQuery.Close;
      Nakl.GetQuery.SQL.Text := sqlGetDocPosInsert;
      cdsPos.First;
      // добавляю позиции
      while not cdsPos.Eof do
      begin
        if cdsPos.FieldByName('KOLICH').AsFloat > 0 then
        begin
          Nakl.GetQuery.Close;
          Nakl.GetQuery.ParamByName('DOCRECNO').AsInteger:= Nakl.fieldRECID.AsInteger;
          Nakl.GetQuery.ParamByName('KOD_MATER').AsFloat := cdsPos.FieldByName('KOD_MATER').AsFloat;
          Nakl.GetQuery.ParamByName('KOLICH').AsFloat    := cdsPos.FieldByName('KOLICH').AsFloat;
          Nakl.GetQuery.ParamByName('SUMMA').AsFloat     := cdsPos.FieldByName('SUMMA').AsFloat;
          Nakl.GetQuery.ParamByName('SUMMA1').AsFloat    := cdsPos.FieldByName('SUMMA1').AsFloat;
          Nakl.GetQuery.ParamByName('IND').AsInteger     := cdsPos.FieldByName('IND').AsInteger;
          Nakl.GetQuery.ExecQuery;
        end;

        cdsPos.Next;
      end;
      Nakl.Post;
      Nakl.Save;
      if (dsAM.FieldByName('RECALC_PRICE').AsInteger = 1) then
       Nakl.UpdatePrice;
      Nakl.Save;



            // IsFirstSortNakl
    //  if not IsFirstSortNakl( FieldLotDate.AsDateTime, FieldBASEID.AsInteger,
    //                          FieldLotNumber.AsInteger,aMasterRecId) then
      begin
         MakeLinkDocNew( TMegaTransaction(UpdateTransaction), FieldLotDate.AsDateTime,
                     FieldBaseID.AsInteger, FieldLotNumber.AsInteger, //
                     Nakl.fieldRECID.AsInteger, Nakl.FieldBaseID.AsInteger,aMasterRecId);
        //if not (self.State = dsEdit) then
       //   self.Edit;
       // FieldNaklRecid.AsInteger  := Nakl.fieldRECID.AsInteger;
      //  FieldNaklBaseid.AsInteger := Nakl.FieldBaseID.AsInteger;
       // self.Post;
      end;
      {else
      begin
        // связываю партию и накладную, чтобы,
        // вновь-созданная сортировочная накладная содержала только разницу
        MakeLinkDoc( TMegaTransaction(UpdateTransaction), FieldLotDate.AsDateTime,
                     FieldBaseID.AsInteger, FieldLotNumber.AsInteger, //
                     Nakl.fieldRECID.AsInteger, Nakl.FieldBaseID.AsInteger);
      end;}
      Nakl.Destroy;
      Nakl := nil;



    end; // PlusNaklExists


    // корректировка по "-"
    if MinusNaklExists then
    begin
      Nakl := TMegaObjDocNakl.Create(DataBase, UpdateTransaction);

      Nakl.New(dsAM.FieldByName('DOCTYPE').AsString);
      if (GetSortSkladVer in [2,4]) then
        Nakl.fieldOPERDATE.AsDateTime := DateOf(IntfIBCommon.GetServerDate)
       else
        Nakl.fieldOPERDATE.AsDateTime := FieldLotDate.AsDateTime; // в будущем ч

      Nakl.fieldDOCDATE.AsDateTime  := Nakl.fieldOPERDATE.AsDateTime;
      Nakl.fieldGROUP_OPER.AsInteger:= dsAM.FieldByName('PP_GROUP_OPER').AsInteger;
      Nakl.fieldKOD_OPER.AsInteger  := dsAM.FieldByName('PP_KOD_OPER').AsInteger;
      Nakl.fieldDK_FROM.AsFloat     := dsAM.FieldByName('ALPHA_DK_FROM').AsFloat;
      Nakl.fieldDK_TO.AsFloat       := dsAM.FieldByName('ALPHA_DK_TO').AsFloat;
      Nakl.fieldDOCNUMBER.AsInteger := FieldLotNumber.AsInteger;

      Nakl.fieldCFO.AsInteger       := FieldCFO.asInteger;
      Nakl.fieldAddrFrom.AsInteger  := FieldCFO.asInteger;
      Nakl.fieldAddrTo.AsInteger    := FieldCFO.asInteger;
      Nakl.fieldBalanceKod.AsInteger:= IntfMegaCommon.GetMainFirmBalanceKod;

      if dsAM.FieldByName('PRICE').AsInteger = 0 then
        Nakl.fieldPriceType.AsInteger:= iptAverageExact
       else
        Nakl.fieldPriceType.AsInteger:= dsAM.FieldByName('PRICE').AsInteger;
      Nakl.fieldSTATE.AsInteger := 5;

//      if IsFirstSortNakl( FieldLotDate.AsDateTime, FieldBASEID.AsInteger,
//                              FieldLotNumber.AsInteger) then
        Nakl.fieldNotes.AsString := 'Откат к сорт. партии №'+
             FieldLotNumber.asString+' за '+DateToStr(FieldLotDate.AsDateTime);
      Nakl.Post;

      // добавляю позиции
      Nakl.GetQuery.Close;
      Nakl.GetQuery.SQL.Text := sqlGetDocPosInsert;
      cdsPos.First;
      // добавляю позиции
      while not cdsPos.Eof do
      begin
        if cdsPos.FieldByName('KOLICH').AsFloat < 0 then
        begin
          Nakl.GetQuery.Close;
          Nakl.GetQuery.ParamByName('DOCRECNO').AsInteger:= Nakl.fieldRECID.AsInteger;
          Nakl.GetQuery.ParamByName('KOD_MATER').AsFloat := cdsPos.FieldByName('KOD_MATER').AsFloat;
          Nakl.GetQuery.ParamByName('KOLICH').AsFloat    := -cdsPos.FieldByName('KOLICH').AsFloat;
          Nakl.GetQuery.ParamByName('SUMMA').AsFloat     := -cdsPos.FieldByName('SUMMA').AsFloat;
          Nakl.GetQuery.ParamByName('SUMMA1').AsFloat    := -cdsPos.FieldByName('SUMMA1').AsFloat;
          Nakl.GetQuery.ParamByName('IND').AsInteger     := cdsPos.FieldByName('IND').AsInteger;
          Nakl.GetQuery.ExecQuery;
        end;

        cdsPos.Next;
      end;
      Nakl.Post;
      Nakl.Save;
      if (dsAM.FieldByName('RECALC_PRICE').AsInteger = 1) then
       Nakl.UpdatePrice;
      Nakl.Save;
  //    Nakl.Transaction.CommitRetaining;
  //    Nakl.MakeProv;

      // связываю партию и накладную, чтобы,
      // вновь-созданная сортировочная накладная содержала только разницу
    // if not IsFirstSortNakl( FieldLotDate.AsDateTime, FieldBASEID.AsInteger,
   //                           FieldLotNumber.AsInteger,aMasterRecId) then
      begin

        {if not (self.State = dsEdit) then
          self.Edit;
        FieldNaklRecid.AsInteger  := Nakl.fieldRECID.AsInteger;
        FieldNaklBaseid.AsInteger := Nakl.FieldBaseID.AsInteger;
        self.Post;}
       MakeLinkDocNew( TMegaTransaction(UpdateTransaction), FieldLotDate.AsDateTime,
           FieldBaseID.AsInteger, FieldLotNumber.AsInteger, //
           Nakl.fieldRECID.AsInteger, Nakl.FieldBaseID.AsInteger,aMasterRecId);

      end;
     { else
      begin
        // связываю партию и накладную, чтобы,
        // вновь-созданная сортировочная накладная содержала только разницу
        MakeLinkDoc( TMegaTransaction(UpdateTransaction), FieldLotDate.AsDateTime,
                       FieldBaseID.AsInteger, FieldLotNumber.AsInteger, //
                       Nakl.fieldRECID.AsInteger, Nakl.FieldBaseID.AsInteger);

      end;}
      Nakl.Destroy;
      Nakl := nil;
    end;
    (**)

    //строчка из Alpha_Deteil
    dsAD:=TMegaDataSet.Create(self);
    dsAD.DataBase:=database;
    dsAD.Transaction:=UpdateTransaction;
    dsAD.SelectSQL.Text:=sqlGetAlphaDetailID;
    dsAD.Params.ByName['mid'].AsInteger:=aMasterRecId;
    dsAD.Params.ByName['bid'].AsInteger:=aMasterBaseId;
    dsAD.Open;
    dsAD.First;
    while not dsAD.Eof do
    begin
      //апдейчу накладные
      qUpdNakl.ParamByName('NEW_DOCTYPE').AsString     := dsAD.FieldByName('DOCTYPE_TO').AsString;
      qUpdNakl.ParamByName('NEW_GROUP_OPER').AsInteger := dsAD.FieldByName('GROUP_OPER_TO').AsInteger;
      qUpdNakl.ParamByName('NEW_KOD_OPER').AsInteger   := dsAD.FieldByName('KOD_OPER_TO').AsInteger;
      qUpdNakl.ParamByName('OLD_DOCTYPE').AsString     := dsAD.FieldByName('DOCTYPE_FROM').AsString;
      qUpdNakl.ParamByName('OLD_GROUP_OPER').AsInteger := dsAD.FieldByName('GROUP_OPER_FROM').AsInteger;
      qUpdNakl.ParamByName('OLD_KOD_OPER').AsInteger   := dsAD.FieldByName('KOD_OPER_FROM').AsInteger;

      qUpdNakl.ParamByName('BALANCE_KOD').AsInteger    := dsAD.FieldByName('BALANCE_KOD').AsInteger;
      qUpdNakl.ParamByName('CFO').AsInteger            := FieldCFO.asInteger;
      qUpdNakl.ParamByName('LOTNUMBER').AsInteger      := FieldLotNumber.AsInteger;
      qUpdNakl.ParamByName('BASEID').AsInteger         := FieldBaseid.AsInteger;
      qUpdNakl.ParamByName('LOTDATE').AsDateTime       := FieldLotDate.AsDateTime;

      qUpdNakl.ExecQuery;
      qUpdNakl.Close;
      dsAD.Next;
    end; // not dsAD.Eof
    (*
    //***** Создание консолидированной накладной (баланс Частного Предпринмателя) *****//
    Nakl := TMegaObjDocNakl.Create(DataBase, Transaction);

    Nakl.New(dsAM.FieldByName('PP_DOCTYPE').AsString);
    Nakl.fieldOPERDATE.AsDateTime  := FieldLotDate.AsDateTime;
    Nakl.fieldDOCDATE.AsDateTime   := FieldLotDate.AsDateTime;
    Nakl.fieldGROUP_OPER.AsInteger := dsAM.FieldByName('PP_GROUP_OPER').AsInteger;
    Nakl.fieldKOD_OPER.AsInteger   := dsAM.FieldByName('PP_KOD_OPER').AsInteger;
    Nakl.fieldDK_FROM.Value        := dsAM.FieldByName('ALPHA_DK_FROM').AsFloat;
    Nakl.fieldDK_TO.Value          := dsAM.FieldByName('ALPHA_DK_TO').AsFloat;

    Nakl.fieldCFO.AsInteger     := IntfMegaDBCommon.GetCFO;
    Nakl.fieldAddrFrom.AsInteger:= IntfMegaDBCommon.GetCFO;
    Nakl.fieldAddrTo.AsInteger  := IntfMegaDBCommon.GetCFO;
    Nakl.fieldBalanceKod.AsInteger := dsAM.FieldByName('PP_BALANCE').AsInteger;

    if dsAM.FieldByName('PRICE').AsInteger = 0 then
      Nakl.fieldPriceType.AsInteger:= iptAverageExact
     else
      Nakl.fieldPriceType.AsInteger:= dsAM.FieldByName('PP_PRICE').AsInteger;
    Nakl.fieldSTATE.AsInteger := 0;
    Nakl.Post;

    // добавляю позиции
    Nakl.GetQuery.Close;
    Nakl.GetQuery.SQL.Text := sqlGetDocPosSumKolich;
    Nakl.GetQuery.Params.ByName['DOCRECNO'].AsInteger   := Nakl.fieldRECID.AsInteger;
    Nakl.GetQuery.Params.ByName['BASEID'].AsInteger     := Nakl.FieldBaseID.AsInteger;
    Nakl.GetQuery.Params.ByName['LOTNUMBER'].AsInteger  := FieldLotNumber.AsInteger;
    Nakl.GetQuery.Params.ByName['LOTDATE'].AsDateTime   := FieldLotDate.AsDateTime;
    Nakl.GetQuery.Params.ByName['BALANCE_KOD'].AsInteger:= dsAM.FieldByName('PP_BALANCE').AsInteger;
    Nakl.GetQuery.Params.ByName['CFO'].AsInteger        := IntfMegaDBCommon.GetCFO;
    Nakl.GetQuery.ExecQuery;
    Nakl.Post;
    Nakl.Save;

    Nakl.MakeProv;

    Nakl.Destroy;
    Nakl := nil;
    (***************)
     if IntfMegaDBCommon.GetParam('STORAGE','0')='1'  then //Используется склад
     begin
       //выбираем ценности со склада для всех накладных в сортировке
        qUpdNakl.Close;
        qUpdNakl.SQL.Text:= sQueryStorageShip;
        qUpdNakl.ParamByName('BASEID').AsInteger    := IntfMegaDBCommon.GetBaseID;
        qUpdNakl.ParamByName('LOTDATE').AsDateTime  := FieldLotDate.AsDateTime;
        qUpdNakl.ParamByName('LOTNUMBER').AsInteger := FieldLotNumber.AsInteger;
        qUpdNakl.ExecQuery;

     end;

   finally
    dsAM.Close;
    dsAD.Close;
    qUpdNakl.Close;
    dsAM.free;
    dsAD.free;
    qUpdNakl.Free;
   end;
end;

procedure TMegaDSSortingLot.ProcessUnMakePartyDetail(aMasterRecId,  aMasterBaseId: Integer);
const
  sqlGetAlphaMasterID=
    'SELECT                                            '#13#10+
    '  am.ID, am.BASEID, am.ORDERNUM,                  '#13#10+
    '  am.NAME, am.DOCTYPE, am.GROUP_OPER,             '#13#10+
    '  am.KOD_OPER, am.PRICE, am.BEGINDATE,            '#13#10+
    '  am.ENDDATE, am.CREATE_NAKL, am.ALPHA_DK_FROM,   '#13#10+
    '  am.ALPHA_DK_TO, am.PP_DOCTYPE, am.PP_GROUP_OPER,'#13#10+
    '  am.PP_KOD_OPER, am.PP_BALANCE, am.PP_PRICE      '#13#10+
    'FROM ALPHA_MASTER am                              '#13#10+
    'WHERE am.baseid=:bid                              '#13#10+
    '  AND am.id=:id                                   ';

  sqlGetAlphaDetailID=
    'SELECT                                '#13#10+
    '  ad.SUBID, ad.BASEID, ad.MASTERID,   '#13#10+
    '  ad.DOCTYPE_FROM, ad.GROUP_OPER_FROM,'#13#10+
    '  ad.KOD_OPER_FROM, ad.DOCTYPE_TO,    '#13#10+
    '  ad.GROUP_OPER_TO, ad.KOD_OPER_TO,   '#13#10+
    '  ad.NOTE1, ad.NOTE2, ad.BALANCE_KOD  '#13#10+
    'FROM ALPHA_DETAIL ad                  '#13#10+
    'WHERE ad.masterid=:mid                '#13#10+
    '  AND ad.baseid=:bid                  ';

  sqlUpdateNakl=
    ' UPDATE DOC_NAKL dn                        '#13#10+
    ' SET                                       '#13#10+
    '   dn.DOCTYPE         = :NEW_DOCTYPE,      '#13#10+
    '   dn.GROUP_OPER      = :NEW_GROUP_OPER,   '#13#10+
    '   dn.KOD_OPER        = :NEW_KOD_OPER      '#13#10+
    ' WHERE dn.BALANCE_KOD = :BALANCE_KOD       '#13#10+
    '   and dn.DOCTYPE     = :OLD_DOCTYPE       '#13#10+
    '   AND dn.GROUP_OPER  = :OLD_GROUP_OPER    '#13#10+
    '   AND dn.KOD_OPER    = :OLD_KOD_OPER      '#13#10+
    '   AND dn.CFO         = :CFO               '#13#10+
    '   AND EXISTS(                             '#13#10+
    '       SELECT * FROM SORT_LOT_POSITIONS slp'#13#10+
    '       WHERE slp.LOTNUMBER  = :LOTNUMBER   '#13#10+
    '         AND slp.lotdate    = :LOTDATE     '#13#10+
    '         AND slp.BASEID     = :BASEID      '#13#10+
    '         AND slp.NAKL_RECID = dn.RECID     '#13#10+
    '         AND slp.NAKL_BASEID= dn.BASEID )  ';

  sqlDelSortNakl =
    'DELETE FROM doc_nakl           '#13#10+
    'WHERE RECID = :NAKL_RECID '#13#10+
    '  AND BASEID= :NAKL_BASEID';

var dsAM,dsAD:TMegaDataSet;//DataSet для Master и Detail
    qUpdNakl:TMegaQuery;
    Nakl: TMegaObjDocNakl;
    strWhere:String;
    strAllPos:String;// Итоговый запрос на Insert всех позиций в консолидированную накладную
begin
   try

    //строчка из Alpha_Master
    dsAM:=TMegaDataSet.Create(self);
    dsAM.DataBase:=DataBase;
    dsAM.Transaction:=UpdateTransaction;
    dsAM.SelectSQL.Text:=sqlGetAlphaMasterID;
    dsAM.Params.ByName['id'].AsInteger:=aMasterRecId;
    dsAM.Params.ByName['bid'].AsInteger:=aMasterBaseId;
    dsAM.Open;

    //меняю группу/код операции
    qUpdNakl:=TMegaQuery.Create(self);
    qUpdNakl.Database:=DataBase;
    qUpdNakl.Transaction:=UpdateTransaction;
    qUpdNakl.SQL.Text:=sqlUpdateNakl;

    //строчка из Alpha_Deteil
    dsAD:=TMegaDataSet.Create(self);
    dsAD.DataBase:=database;
    dsAD.Transaction:=UpdateTransaction;
    dsAD.SelectSQL.Text:=sqlGetAlphaDetailID;
    dsAD.Params.ByName['mid'].AsInteger:=aMasterRecId;
    dsAD.Params.ByName['bid'].AsInteger:=aMasterBaseId;
    dsAD.Open;
    dsAD.First;
    while not dsAD.Eof do
    begin
      //апдейчу накладные
      qUpdNakl.ParamByName('OLD_DOCTYPE').AsString     := dsAD.FieldByName('DOCTYPE_TO').AsString;
      qUpdNakl.ParamByName('OLD_GROUP_OPER').AsInteger := dsAD.FieldByName('GROUP_OPER_TO').AsInteger;
      qUpdNakl.ParamByName('OLD_KOD_OPER').AsInteger   := dsAD.FieldByName('KOD_OPER_TO').AsInteger;
      qUpdNakl.ParamByName('NEW_DOCTYPE').AsString     := dsAD.FieldByName('DOCTYPE_FROM').AsString;
      qUpdNakl.ParamByName('NEW_GROUP_OPER').AsInteger := dsAD.FieldByName('GROUP_OPER_FROM').AsInteger;
      qUpdNakl.ParamByName('NEW_KOD_OPER').AsInteger   := dsAD.FieldByName('KOD_OPER_FROM').AsInteger;

      qUpdNakl.ParamByName('BALANCE_KOD').AsInteger    := dsAD.FieldByName('BALANCE_KOD').AsInteger;
      qUpdNakl.ParamByName('CFO').AsInteger            := FieldCFO.AsInteger;
      qUpdNakl.ParamByName('LOTNUMBER').AsInteger      := FieldLotNumber.AsInteger;
      qUpdNakl.ParamByName('BASEID').AsInteger         := FieldBaseid.AsInteger;
      qUpdNakl.ParamByName('LOTDATE').AsDateTime       := FieldLotDate.AsDateTime;

      qUpdNakl.ExecQuery;
      qUpdNakl.Close;
      dsAD.Next;
    end; // not dsAD.Eof

    //***** Удаление консолидированной накладной (баланс Мегаполиса) *****//
(** )
    qUpdNakl.SQL.Text := sqlDelSortNakl;
    qUpdNakl.ParamByName('NAKL_RECID').AsInteger  := FieldNaklRecid.AsInteger;
    qUpdNakl.ParamByName('NAKL_BASEID').AsInteger := FieldNaklBaseid.AsInteger;

    // ссылка на накладную
    if not (self.State = dsEdit) then
      self.Edit;
    FieldNaklRecid.AsVariant  := NULL;
    FieldNaklBaseid.AsVariant  := NULL;
    self.Post;

    // удаление
    qUpdNakl.ExecQuery;
    qUpdNakl.Close;
(**)
    //***** Удаление консолидированной накладной (баланс Частного Предпринмателя) *****//

   finally
    dsAM.Close;
    dsAD.Close;
    qUpdNakl.Close;
    dsAM.free;
    dsAD.free;
    qUpdNakl.Free;
   end;
end;

procedure TMegaDSSortingLot.RemakeDocs2(OnlyUnMake : Boolean; OnlyClient : Boolean);
  Procedure RemakeDoc(aRECID,aBASEID : integer);
  var
    Q : TMegaQuery;
  begin
    Q := TMegaQuery.Create(self);
    Q.DataBase    := DataBase;
    Q.Transaction := UpdateTransaction;
    Q.SQL.Text    :=
        'EXECUTE PROCEDURE DELETE_PROV_DOC_NEW(:RECID,:BASEID, '#13#10+
        '(SELECT first 1 std.DOC_INHERITED FROM SPRAV_TDOC std '#13#10+
        '   LEFT JOIN DOC_NAKL dn on dn.DOCTYPE = std.DOCTYPE  '#13#10+
        ' WHERE dn.RECID=:RECID and dn.BASEID=:BASEID) ,NULL,1)';
    Q.ParamByName('RECID').AsInteger    := aRECID;
    Q.ParamByName('BASEID').AsInteger   := aBASEID;
    Q.ExecQuery;
    Q.Close;
    Q.Destroy;

    if not OnlyUnMake then
    begin
      Q := TMegaQuery.Create(self);
      Q.DataBase    := DataBase;
      Q.Transaction := UpdateTransaction;
      Q.SQL.Text    := 'EXECUTE PROCEDURE PROV_DOC_NEW('+
          '(SELECT first 1 std.DOC_INHERITED FROM SPRAV_TDOC std '#13#10+
          '   LEFT JOIN DOC_NAKL dn on dn.DOCTYPE = std.DOCTYPE  '#13#10+
          ' WHERE dn.RECID=:RECID and dn.BASEID=:BASEID),'+
          ':RECID,:BASEID,NULL,NULL,NULL)';
      Q.ParamByName('RECID').AsInteger   := aRECID;
      Q.ParamByName('BASEID').AsInteger  := aBASEID;
      Q.ExecQuery;
      Q.Close;
      Q.Destroy;
    end;
  end;

const
  cSelectNaklList =
'/* сортировочная накладная */                                                      '#13#10+
' select                                                                            '#13#10+
'   dn.RECID,                                                                       '#13#10+
'   dn.BASEID                                                                       '#13#10+
'                                                                                   '#13#10+
' from sort_lot sl                                                                  '#13#10+
'   LEFT JOIN get_linked_docs_new(31,sl.recid,sl.baseid, 0,0) gl on 1=1 and gl.LINKED_FORMTYPE = 1 '#13#10+
'   left join doc_nakl dn on                                                        '#13#10+
'   (dn.recid = gl.LINKED_RECID and dn.baseid = gl.LINKED_BASEID)                       '#13#10+
' where sl.lotdate   = :LOTDATE                                                     '#13#10+
'   and sl.lotnumber = :LOTNUMBER                                                   '#13#10+
'   and sl.baseid    = :BASEID                                                      '#13#10+
'                                                                                   '#13#10+
' union all                                                                         '#13#10+
'                                                                                   '#13#10+
'/* корр. сортировочная накладная */                                                '#13#10+
' select                                                                            '#13#10+
'   dn.RECID,                                                                       '#13#10+
'   dn.BASEID                                                                       '#13#10+
' from sort_lot sl                                                                  '#13#10+
'   LEFT JOIN get_linked_docs_new(31,sl.recid,sl.baseid, 0,0) gl on 1=1 and gl.LINKED_FORMTYPE = 1'#13#10+
'   LEFT JOIN LINK_DOC_OPL ldo ON gl.LINKED_RECID = ldo.parent_recid                  '#13#10+
'                             AND gl.LINKED_BASEID= ldo.parent_baseid                 '#13#10+
'   LEFT JOIN doc_nakl dn on dn.recid = ldo.opl_recid and dn.baseid = ldo.OPL_BASEID'#13#10+
' where sl.lotdate   = :LOTDATE                                                     '#13#10+
'   and sl.lotnumber = :LOTNUMBER                                                   '#13#10+
'   and sl.baseid    = :BASEID                                                      '#13#10+
'                                                                                   '#13#10+
' union all                                                                         ';

  cSelectNaklListClient =
'/* документы в партии */                                    '#13#10+
' select                                                     '#13#10+
'   dn.RECID,                                                '#13#10+
'   dn.BASEID                                                '#13#10+
' from sort_lot_positions slp                                '#13#10+
'   left join doc_nakl dn on                                 '#13#10+
'   (dn.recid = slp.nakl_recid and dn.baseid = slp.baseid)   '#13#10+
' where slp.lotdate   = :LOTDATE                             '#13#10+
'   and slp.lotnumber = :LOTNUMBER                           '#13#10+
'   and slp.baseid    = :BASEID                              ';

var
  Q : TMegaQuery;
begin
  // перепровожу документы как в списке док-в  PROV_DOC_NEW/DELETE_PROV_DOC_NEW
  Q := TMegaQuery.Create(self);
  Q.DataBase    := DataBase;
  Q.Transaction := UpdateTransaction;
  if OnlyClient then
    Q.SQL.Text  := cSelectNaklListClient
   else
    Q.SQL.Text  := cSelectNaklList + cSelectNaklListClient;

  Q.ParamByName('BASEID').AsInteger         := FieldBaseid.AsInteger;
  Q.ParamByName('LOTDATE').AsDateTime       := FieldLotDate.AsDateTime;
  Q.ParamByName('LOTNUMBER').AsInteger      := FieldLotNumber.AsInteger;

  Q.ExecQuery;

  while not Q.Eof do
    begin
      RemakeDoc(Q.FieldByName('RECID').AsInteger,Q.FieldByName('BASEID').AsInteger);
      Q.Next;
    end;
  Q.Close;
  Q.free;
end;


end.


