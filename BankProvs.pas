unit BankProvs;

interface

uses
  SysUtils,
  Classes,
  IdMessage,
  StrUtils,
  RXShell,
  RegExpr,
  RXStrUtils,
  Variants,
  DB,
  uMegaIntf,
  uMegaObjDocProv,
  uMegaDB,
  uMegaIB,
  MoneyData,
  wsAccountTrans, SOAPHTTPClient, XSBuiltIns, uTypes;

  procedure SaveProv;

Implementation

procedure SaveProv;
var
  lSc: integer;
  BankProv: TMegaObjDocProv;
  sN: string;
  lCFOCount, lObr, lIns, lErr, prRecords: integer;
  aProvsDK, from_kod, to_kod, no_insert: string;
  from_kod_d: double;
  StartTime: TDateTime;
  lLast: boolean;
  hnd: THandle;
  is_sub: boolean;
  re: TRegExpr;
  ws: IAccountingTransaction;
  xsdt: TXSDateTime;    res: integer;
  DocType: string;
  GroupOper, KodOper: Integer;
  DebtorFrom: Double;
  fProv: Boolean;
  // SubRoutines
  function GetKOdFromN_P(s: string): string;
  var
    i: integer;
    re: TRegExpr;
  begin
    Result:='';
    re:=TRegExpr.Create;
    try
      re.Expression:='\d{6,}';
      if re.Exec(s) then Result:=re.Match[0];
      if Result<>'' then
      begin
        DM.qrW.Close;
        DM.qrW.SQL.Text:='select count(*) as cnt from sprav_dk where kod_dk ='+Result;
        DM.qrW.ExecQuery;
        if DM.qrW.FieldByName('cnt').AsInteger=0 then Result:='';
        DM.qrW.Close;
      end;
    finally
      re.Free;
    end;
  end;

  procedure GetParamForProv(aBank: Integer; aSchetFrom, aSchetTo: string; isDt: Integer; var Doctype: string; var GroupOper, KodOper: integer);
  const cSql = ' select pr_bo.group_oper, pr_bo.kod_oper, pr_bo.doctype, pr_bo.balance_kod ' + #13#10 +
               ' from GET_BANK_OPER(:bank, :sc, :from_sc, :to_sc, :is_dt) pr_bo ';
  var qr: TMegaQuery;
  begin
    qr:= TMegaQuery.Create(nil);
    qr.Database:= DM.Money;
    qr.Transaction:= DM.trMoney;
    try
      qr.SQL.Text:= cSql;
      qr.ParamByName('bank').AsInteger:= aBank;
      qr.ParamByName('sc').AsString:= '';
      qr.ParamByName('from_sc').AsString:= aSchetFrom;
      qr.ParamByName('to_sc').AsString:= aSchetTo;
      qr.ParamByName('is_dt').AsInteger:= isDt;
      qr.ExecQuery;
      if not qr.FieldByName('group_oper').IsNull then
       begin
         DocType:= qr.FieldByName('doctype').AsString;
         GroupOper:= qr.FieldByName('group_oper').AsInteger;
         KodOper:= qr.FieldByName('kod_oper').AsInteger;;
       end
      else
       DocType:= '';
      qr.Close;
    finally
      qr.Free;
    end;
  end;

  // Судя по всему раньше в платеже указывали саба, и если мы его находили - создавалась проводка именно на саба
  function GetSubDKFromNP(aNP, aKodDK: string): string;
  var
    i: integer;
    re: TRegExpr;
  begin
    Result:='';
    re:=TRegExpr.Create;
    try
      re.Expression:='\d+';
      if re.Exec(aNP) then Result:=re.Match[0];
      if Result<>'' then
      begin
        DM.qrPVW.Close;
        DM.qrPVW.SQL.Text:='select count(*) as cnt from sprav_dk where kod_dk =' + aKodDK + Result + ' and parent = ' + aKodDK;
        try
          DM.qrPVW.ExecQuery;
          if DM.qrPVW.FieldByName('cnt').AsInteger=0 then
            Result:=''
          else
            Result := aKodDK + Result;
          DM.qrPVW.Close;
        except
          on E: Exception do begin
//            WriteToLogFile('  Ошибка при вызове функции GetSubDKFromNP: ' + E.Message);
            Result := '';
          end;
        end;
      end;
    finally
      re.Free;
      if Result = '' then Result := aKodDK;
    end;
  end;

  function GetDKCFO(aKod_dk: string; aMFO: string): Boolean;
  begin
     Result := False;
    DM.qrW.Close;
    try
      DM.qrW.SQL.Text:='select count(*) as cnt from sprav_dk sdk where sdk.parent='+trim(aKod_dk);
      DM.qrW.ExecQuery;
      Result := (DM.qrW.FieldByName('cnt').AsInteger <> 0);
      DM.qrW.Close;
      DM.qrW.SQL.Text:= 'select count(*) cnt from BANK_MFOCFO where MFO = ' + aMFO;
      DM.qrW.ExecQuery;
      Result := Result AND (DM.qrW.FieldByName('cnt').AsInteger <> 0);
    finally
      DM.qrW.Close;
    end;
  end;
  // End SubRoutine GetCFO

  function getDKF2(aKod_dk: string; n_p: string): String;
  var
    expr: TRegExpr;
    res: Boolean;
  begin
    res := False;
    expr:=TRegExpr.Create;
    try
      expr.Expression:='(\d+)';
      if expr.Exec(n_p) then
      repeat
        DM.qrW.Close;
        DM.qrW.SQL.Text:= 'select count(*) cnt from BANK_DKOPER_F2 where USER_ID = ' + expr.Match[1];
        DM.qrW.ExecQuery;
        Result := expr.Match[1];
        res := (DM.qrW.FieldByName('cnt').AsInteger > 0);
      until not ((expr.ExecNext) AND (not res));
    finally
      expr.Free;
      DM.qrW.Close;
    end;
    if not res then
      Result := '0';
  end;
  // End SubRoutine GetCFO

  function sabDK(akod_dk,sab_np: String): String;
  const
    Is_parent='select count(*) is_p from sprav_dk where kod_dk=%s and parent=%s';
  var
    Exp_sub:TRegExpr;
    lresult, iss_sab:string;
  begin
    try
        lResult:= akod_dk;
        is_sub:=false;
        Exp_sub:=TRegExpr.Create;
        Exp_sub.Expression:= '^.*(\d{5})\D*';
        Exp_sub.ModifierG := False;
        if Exp_sub.Exec(sab_np) then
        begin
             iss_sab:=Exp_sub.Match[1];
             DM.qrW.Close;
             DM.qrW.SQL.Text:=format(Is_parent,[lresult+iss_sab, lresult]);
             DM.qrW.ExecQuery;
             if DM.qrW.FieldByName('is_p').AsInteger>0 then
             begin
                  lresult:=lresult+iss_sab;
                  is_sub:=true;
             end;
        end;
    except
    on e:Exception do
      WriteToLogFile('  SubDK:' + e.Message);
    end;
    Exp_sub.Free;
    Result:=lresult;
  end;
  //End Function subDk

  function CheckKodDkBySchet(aSchet, aKod_dk: string): string;
    procedure GetDk;
    begin
      if (Length(aSchet) >14) then
       Result:= '0'
      else
       begin
        DM.qrW.Close;
      DM.qrW.SQL.Text:='select kod_dk from sprav_dk where PRIMARY_SCHET='+
        Trim(aSchet)+' or SECONDARY_SCHET='+Trim(aSchet) ;
      DM.qrW.ExecQuery;
      if DM.qrW.FieldByName('kod_dk').AsString<>''
       then Result:=DM.qrW.FieldByName('kod_dk').AsString
       else Result:='0';
       end;
    end;

    // End SubRoutine GetDK
  begin
    if (trim(aKod_dk)='') or (trim(aKod_dk)='0') then
      GetDk
    else
      begin
        DM.qrW.Close;
        DM.qrW.SQL.Text:='select count(*) as cnt from sprav_dk where kod_dk ='+Trim(aKod_dk);
        DM.qrW.ExecQuery;
        Result:=aKod_dk;
        if DM.qrW.FieldByName('cnt').AsInteger=0 then
          GetDk;
      end;
    DM.qrW.Close;
  end;
  //End Function CheckKodDKBySchet

  function CheckKodDkOnlySchet(aSchet: string): string;
  begin
     if (Length(aSchet) >14) then
       Result:= '0'
      else
       begin
    DM.qrW.Close;
    DM.qrW.SQL.Text:='select kod_dk from sprav_dk where PRIMARY_SCHET='+Trim(aSchet)+' or SECONDARY_SCHET='+Trim(aSchet);
    DM.qrW.ExecQuery;
    if DM.qrW.FieldByName('kod_dk').AsString<>''
    then Result:=DM.qrW.FieldByName('kod_dk').AsString
    else Result:='0';
       end;
  end;


  function IsInternalDk(kod_dk: string): boolean;
  var  qr1: TMegaQuery;
  begin
    qr1:= TMegaQuery.Create(nil);
    qr1.Database:= DM.Money;
    qr1.Transaction:= DM.trMoney;
    try
      qr1.SQL.Text:='select count(*) as cnt from bank_dkoper where kod_dk='+trim(kod_dk);
      qr1.ExecQuery;
      Result:=qr1.FieldByName('cnt').AsInteger <> 0;
      qr1.Close;
    finally
      qr1.Free;
    end;
  end;

  procedure CheckSubDk(var aKod_dk: string; aSchet: string);
  { Проверка на сабдебиторов }
  const
    lSQLsd = 'select sdk.KOD_DK, sdk.PRIMARY_SCHET, sdk1.KOD_DK OSN_KOD_DK, sdk1.PRIMARY_SCHET OSN_PRIMARY_SCHET from sprav_dk sdk' +
     ' left join sprav_dk sdk1 on (sdk1.KOD_DK=sdk.PARENT)' +
     ' where sdk.KOD_DK=%s and sdk.PRIMARY_SCHET=''%s'' and sdk.PARENT is not null';
    lSQLosn = 'SELECT sdk.kod_dk FROM SPRAV_DK sdk left join sprav_dk_bankschet sdb on (sdb.kod_dk = sdk.kod_dk) where sdk.PARENT=%s '+
      ' and ((sdb.schet_str=''%s'') or (sdb.SCHET_IBAN =''%s'' ) ) ' ;
  var qr1: TMegaQuery;
  begin
    qr1:= TMegaQuery.Create(nil);
    qr1.Database:= DM.Money;
    qr1.Transaction:= DM.trMoney;
    try
    // Проверка на сабдебитора и подмена его по условию
    if Length(aSchet) < 15 then
      begin
    qr1.Close;
    qr1.SQL.Text:=format(lSQLsd,[aKod_dk, aSchet]);
    qr1.ExecQuery;
    if (not qr1.FieldByName('kod_dk').IsNull) and (qr1.FieldByName('kod_dk').AsFloat<>0) then
    begin
      // клиент сабдебитор
      if qr1.FieldByName('PRIMARY_SCHET').AsString= qr1.FieldByName('OSN_PRIMARY_SCHET').AsString
      then
        // подменяем сабдебитора...
        aKod_dk:=trim(replacestr(qr1.FieldByName('OSN_KOD_DK').AsString,',','.'));
      exit;
    end;
      end;
    // проверяем основной - на счет сабдебитора
    qr1.Close;
    qr1.SQL.Text:=format(lSQLosn,[aKod_dk, aSchet, aSchet]);
    qr1.ExecQuery;
    if (not qr1.FieldByName('kod_dk').IsNull) and (qr1.FieldByName('kod_dk').AsFloat<>0) then
    begin
      // платят с основного, но подменяем на сабдебитора
      akod_dk:=trim(replacestr(qr1.FieldByName('kod_dk').AsString,',','.'));
    end;
    finally
      qr1.Free;
    end;
  end;
  // End procedure CheckSubDK

  procedure MakePPProvForPrivat;
  begin
    // Платежи на ЧП
    no_insert:='0';
    to_kod := CheckKodDkBySchet(trim(DM.qrSp.FieldByName('TO_SC').AsString),
        Trim(DM.qrSp.FieldByName('TO_KOD').AsString));
    // по умолчанию - конечный потребитель
    from_kod:=CheckKodDkBySchet(trim(DM.qrSp.FieldByName('FROM_SC').AsString),
        Trim(DM.qrSp.FieldByName('FROM_KOD').AsString));

    if from_kod = '0' then no_insert:='1';
    if to_kod = '0' then no_insert:='2';
    if not IsInternalDk(from_kod) then
    begin
      CheckSubDk(from_kod, trim(DM.qrSp.FieldByName('FROM_SC').AsString));
      // создаем проводку
      DM.qrW.Close;
      DM.qrW.SQL.Text :=
        'select bdo.group_oper, bdo.kod_oper, bdo.balance_kod, bdo.kod_dk, bdo.doctype '+
        'from bank_dkoper bdo where bdo.kod_dk= '+ to_kod;
      DM.qrW.ExecQuery;
      if DM.qrW.Eof then
        no_insert:='3';
      if no_insert='0' then
      begin
        if (DM.qrSp.FieldByName('PRVRECID').AsInteger=0) and
           (DM.qrSp.FieldByName('STATUS').AsInteger=0) then
          try
            BankProv.New(DM.qrW.FieldByName('doctype').AsString);
            BankProv.fieldGROUP_OPER.Value:= DM.qrW.FieldByName('group_oper').AsInteger;
            BankProv.fieldKOD_OPER.Value:= DM.qrW.FieldByName('kod_oper').AsInteger;
            if GetDKCFO(to_kod, DM.qrSp.FieldByName('MFO').AsString) then
            begin
              DM.qrW.Close;
              DM.qrW.SQL.Text:= 'select MFO, CFO, GROUP_OPER, KOD_OPER from BANK_MFOCFO where MFO = :MFO';
              DM.qrW.ParamByName('MFO').AsString := DM.qrSp.FieldByName('MFO').AsString;
              DM.qrW.ExecQuery;
              if not DM.qrW.Eof then
              begin
                BankProv.fieldGROUP_OPER.Value:= DM.qrW.FieldByName('group_oper').AsInteger;
                BankProv.fieldKOD_OPER.Value:= DM.qrW.FieldByName('kod_oper').AsInteger;
                BankProv.fieldCFO.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
                BankProv.fieldREG_BASEID.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
              end;
              lCFOCount := lCFOCount + 1;
            end;
            BankProv.fieldOPERDATE.Value:=strtodate(DM.qrSp.FieldByName('DATEP').AsString);
            BankProv.fieldDOCNUMBER.Value:=DM.qrSp.FieldByName('NUMP').AsInteger;
            BankProv.fieldDK_FROM.AsString:=from_kod;
            BankProv.fieldDK_TO.AsString:=to_kod;
            BankProv.fieldSUMMA1.Value:=DM.qrSp.FieldByName('SUMMAK').AsFloat;
            BankProv.fieldNOTES.Value:=DM.qrSp.FieldByName('NP').AsString;
            BankProv.Save;
            DM.qrSp.Edit;
            DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
            DM.qrSp.Post;
            BankProv.Close;
          except
            on e:Exception do
            begin
              BankProv.Close;
              no_insert:='4';
              WriteToLogFile('  ПриватБанк_ЧП:' + e.Message);
              WriteToLogFile('  Документ: '+DM.qrSp.FieldByName('DATEP').AsString+' №'+DM.qrSp.FieldByName('NUMP').AsString+' сумма: '+DM.qrSp.FieldByName('SUMMAK').AsString);
            end;
          end;
      end; //if no_insert = 0
      DM.qrSp.Edit;
      if no_insert='0' then
        DM.qrSp.FieldByName('STATUS').AsInteger:=5
      else
        DM.qrSp.FieldByName('STATUS').AsInteger:=2;
      DM.qrSp.Post;
    end //if not IsInternalDK
    else
      begin
        DM.qrSp.Edit;
        DM.qrSp.FieldByName('STATUS').AsInteger:=3;
        DM.qrSp.Post;
        no_insert:= '4'; //?
      end;
  end;

  function IsExistsKodDK(aKodDK: double): boolean;
  begin
    DM.qrW.Close;
    DM.qrW.SQL.Text:= 'select kod_dk from sprav_dk where kod_dk = ' + FloatToStr(aKodDK);
    DM.qrW.ExecQuery;
    result:= not DM.qrW.Eof;
  end;

  function ActualBalanceForFactoryProv(aKodDK: double):integer;
  begin
    DM.qrW.Close;
    DM.qrW.SQL.Text:= '  select first 1 gc.balance from get_calc_dk_balance_schet(1) gc '+
                      ' left join  dk_dolg_bi_otsr(dateadd(month,-2,cast(''today'' as date)),'+
                      'cast(''today'' as date),gc.BALANCE,gc.schet,:KOD_DK,1,300,''!'',null,'+
                      'null,-1) ddbi on 1=1 '+
                      ' order by ddbi.tmp_date nulls last ';//' + FloatToStr(aKodDK);
    DM.qrW.ParamByName('KOD_DK').asDouble:=aKodDK;
    DM.qrW.ExecQuery;
    result:= DM.qrW.FieldByName('balance').AsInteger;
  end;

  // Пришли из российских проводок
  function GetKodDK(aKodDK, aSchet: string): string;
  var
    lRecordsCount: Integer;
  begin
    DM.qrW.Close;
    DM.qrW.SQL.Text := 'select count(*) cnt from sprav_dk where kod_dk = ' + aKodDK;
    DM.qrW.ExecQuery;
    lRecordsCount := DM.qrW.FieldByName('cnt').AsInteger;
    Result := '';
    if ((lRecordsCount = 0) AND (aKodDK <> '0')) then
    begin
      DM.qrW.Close;
      DM.qrW.SQL.Text := 'select kod_dk from sprav_dk where nalog_number = ' + aKodDK;
      DM.qrW.ExecQuery;
      if DM.qrW.Eof then
        Result := ''
      else
        Result := DM.qrW.FieldByName('kod_dk').AsString;
    end;
    if (((lRecordsCount = 0)
         OR (aKodDK = '0'))
        AND (Result = '')) then
    begin
      DM.qrW.Close;
      DM.qrW.SQL.Text := 'select count(*) cnt from sprav_dk where group_dk = 30 AND ((primary_schet_str = ''' + aSchet + ''') OR  ( secondary_schet_str = ''' + aSchet + '''))';
      DM.qrW.ExecQuery;
      if (DM.qrW.FieldByName('cnt').AsInteger <> 0) then
      begin
        DM.qrW.Close;
        DM.qrW.SQL.Text := 'select kod_dk from sprav_dk where group_dk = 30 AND ((primary_schet_str = ''' + aSchet + ''') OR  ( secondary_schet_str = ''' + aSchet + '''))';
        DM.qrW.ExecQuery;
        if DM.qrW.Eof then
          Result := ''
        else
          Result := DM.qrW.FieldByName('kod_dk').AsString;
      end
      else
        begin
        DM.qrW.Close;
        DM.qrW.SQL.Text := 'select count(*) cnt from sprav_dk where primary_schet_str = ''' + aSchet + ''' OR secondary_schet_str = ''' + aSchet + '''';
        DM.qrW.ExecQuery;
        if (DM.qrW.FieldByName('cnt').AsInteger > 0) then
        begin
          DM.qrW.Close;
          DM.qrW.SQL.Text := 'select first 1 kod_dk from sprav_dk where primary_schet_str = ''' + aSchet + ''' OR secondary_schet_str = ''' + aSchet + '''';
          DM.qrW.ExecQuery;
          if DM.qrW.Eof then
            Result := ''
          else
            Result := DM.qrW.FieldByName('kod_dk').AsString;
        end;
      end;
    end
    else
      if Result ='' then
        Result := aKodDK;

    if Result = '' then
    begin
      DM.qrW.Close;
      DM.qrW.SQL.Text := 'select count(*) cnt from sprav_dk_bankschet where schet_str = ''' + aSchet + '''';
      DM.qrW.ExecQuery;
      if (DM.qrW.FieldByName('cnt').AsInteger <> 0) then
      begin
        DM.qrW.Close;
        DM.qrW.SQL.Text := 'select kod_dk from sprav_dk_bankschet where schet_str = ''' + aSchet + '''';
        DM.qrW.ExecQuery;
        Result := DM.qrW.FieldByName('kod_dk').AsString;
      end;
    end;
  end;

  function CheckDKMakeProv(aKodDK: String): Boolean;
  var
    re: TRegExpr;
  begin
    Result:=False;
    re:=TRegExpr.Create;
    try
      re.Expression:='(\d+)';
      if re.Exec(aProvsDK) then
        repeat
          Result := (re.Match[1] = aKodDK);
        until ((not re.ExecNext) OR (Result));
    finally
      re.Free;
    end;
  end;

  function GetDkFrom(DebtorCode:Double; Schet: string; Notes: string): Double;
  var from_kod, no_insert: string;
      qr: TMegaQuery;
  begin
    result:= DebtorCode; // если по примечанию не найдет, то подставляем банк
    from_kod:= '';
    qr:= TMegaQuery.Create(nil);
    qr.Database:= DM.Money;
    qr.Transaction:= DM.trMoney;
    try
      qr.SQL.Text:= 'select count(*) as cnt, max(group_dk) group_dk   from sprav_dk where kod_dk =' + FloatToStr(DebtorCode);
      qr.ExecQuery;
      if ((qr.FieldByName('cnt').AsInteger=0) or (qr.FieldByName('group_dk').AsInteger=200)) then  // Банк
     begin
       Notes:= ReplaceStr(Notes, ',', ', ');
       re:=TRegExpr.Create;
       try
         re.Expression := '\d{6,}';
         if (re.Exec(Trim(Notes))) then
          repeat
            no_insert:= '0';
            from_kod := re.Match[0];
            if length(re.Match[0])=27 then    // цифры от Iban пропускаем
             from_kod:= '';
            from_kod:=Trim(from_kod);
            if from_kod <> '' then
             begin
               qr.Close;
               qr.SQL.Text:='select count(*) as cnt from sprav_dk where kod_dk =' + from_kod;
               qr.ExecQuery;
               if qr.FieldByName('cnt').AsInteger=0 then from_kod := '';
               qr.Close;
             end;
            if from_kod='' then from_kod:='0';
            // if (from_kod <> '0') then
             //  if not IsInternalDk(from_kod) then
             //   CheckSubDk(from_kod, trim(Schet));
          until ((not re.ExecNext) OR (no_insert = '0'))
       finally
         re.Free
       end;
       if from_kod='' then from_kod:='0';
       if (from_kod <> '0') then
        result:= StrToFloat(from_kod);
     end
      else
        result:= DebtorCode;


    finally
       qr.Free;
     end;

  end;




begin
  try
    BankProv:=TMegaObjDocProv.Create(DM.Owner, DM.trMoney);
    try
      StartTime:=Now;
      lObr:=0;
      lIns:=0;
      lErr:=0;
      DM.qrSp.Close;
      DM.qrSp.SelectSQL.Text:= 'select bdoc.recid, bdoc.bank, bdoc.datep, bdoc.nump, bdoc.summak,bdoc.summad,bdoc.from_sc, bdoc.from_name, bdoc.from_kod, bdoc.to_sc, bdoc.to_name,bdoc.to_kod, bdoc.np, bdoc.status, bdoc.prvrecid, bdoc.mfo from bank_doc bdoc where bdoc.status=0';
      DM.qrSp.Open;

      DM.qrW.Close;
      DM.qrW.SQL.Text:='select count(*) from bank_doc bdoc where bdoc.status=0';
      DM.qrW.ExecQuery;
      prRecords:= DM.qrW.Fields[0].AsInteger;
      if (prRecords > 0) then
      begin
        lLast:=false;
        repeat
          try
          inc(lObr);
          if (DM.qrSp.FieldByName('FROM_KOD').AsString = DM.qrSp.FieldByName('TO_KOD').AsString) then
          begin
            DM.qrSp.Edit;
            DM.qrSp.FieldByName('STATUS').AsInteger:= 4; // (исключен из обработки, сумма - 0)
            DM.qrSp.Post;
          end
          else
          case DM.qrSp.FieldByName('BANK').AsInteger of
          1:{$REGION 'Банк Пивденный'}
            begin
              DocType:= '';
              //не делаем вставку на 0 грн, если плательщик - мы и если счета инкассации (кроме двух)
              if ((DM.qrSp.FieldByName('SUMMAK').AsFloat=0)
                  or (DM.qrSp.FieldByName('FROM_KOD').AsFloat = bPivd.DKTo))
                // по просьбе ОДЗ нужно создавать проводки по всем счетам инкассации
                // 01.04.2010
                 { OR ((Pos('2902',DM.qrSp.FieldByName('FROM_SC').AsString) = 1 )
                       ///  2 рахунки інкасації, які треба обробляти
                      and (DM.qrSp.FieldByName('FROM_SC').AsString <> '290229010200')
                      and (DM.qrSp.FieldByName('FROM_SC').AsString <> '29024900040017'))}
              then
              begin
                // нет необходимости делать вставку
                DM.qrSp.Edit;
                if (DM.qrSp.FieldByName('SUMMAK').AsFloat=0)
                then DM.qrSp.FieldByName('STATUS').AsInteger :=4 // (исключен из обработки, сумма - 0)
                else DM.qrSp.FieldByName('STATUS').AsInteger :=2; // (ошибка дк)
                DM.qrSp.Post;
              end else
              begin
                  //Проверяю на инкассацию
                DM.qrPVW.Close;
                DM.qrPVW.SQL.Text:='select FROM_SC, DOCTYPE, GROUPOPER, KODOPER, DK_FROM, DK_TO, CFO   from GET_BANK_INKASS('+ QuotedStr(Trim(DM.qrSp.FieldByName('FROM_SC').AsString))+','+ DM.qrSp.FieldByName('TO_KOD').AsString+')' ;
                DM.qrPVW.ExecQuery;
                if DM.qrPVW.Eof then //не инкассация
                begin
                  // проверим дебитора
                  // Сперва по счёту

{ ---------------- Changed by Kislaja.J in 07.02.2011 --------------- }
                  //from_kod := CheckKodDkOnlySchet(Trim(DM.qrSp.FieldByName('FROM_SC').AsString));
                  //if from_kod = '0'
                  //then from_kod := CheckKodDkBySchet(Trim(DM.qrSp.FieldByName('FROM_SC').AsString), DM.qrSp.FieldByName('FROM_KOD').AsString);

                  //if from_kod='0' then
                  from_kod_d:= DM.qrSP.FieldByName('FROM_KOD').AsFloat;
                  if (DM.qrSP.FieldByName('FROM_KOD').AsFloat = 0) or (not IsExistsKodDK(DM.qrSP.FieldByName('FROM_KOD').AsFloat)) then
{ ----------- End of changing by Kislaja.J in 07.02.2011 ----------- }
                  begin
                    DM.qrSp.Edit;
                    DM.qrSp.FieldByName('STATUS').AsInteger:=2; //дк не найден
                    inc(lErr);
                    DM.qrSp.Post;
                  end else
                  begin
                    // платежка на вставку...
                    try
                      if// (HasManufacturerPaymentsContract(StrToFloat(from_kod){BankProv.fieldDK_FROM.AsFloat}) and
                        ((DM.qrSp.FieldByName('TO_SC').AsString = '26004340728201') or
                         (DM.qrSp.FieldByName('TO_SC').AsString = '26005310039901')
                         )
                      then
                      begin
                        //если баланс 77
                       { if (ActualBalanceForFactoryProv(DM.qrSP.FieldByName('FROM_KOD').AsFloat)=77) then
                        begin
                          BankProv.New('Прв77');
                          BankProv.fieldGROUP_OPER.Value := 77361000;
                        end
                        else
                        begin
                          BankProv.New('Прв7');
                          BankProv.fieldGROUP_OPER.Value := 7361000;
                        end;

                        BankProv.fieldKOD_OPER.Value   := 685000;
                        BankProv.fieldDK_TO.AsFloat    := DM.qrSP.FieldByName('TO_KOD').AsFloat;
                       }

                        DM.qrSp.Edit;
                      //DM.qrSp.FieldByName('PRVRECID').AsInteger := BankProv.fieldRECID.AsInteger;
                        DM.qrSp.FieldByName('STATUS').AsInteger   := 4;
                        DM.qrSp.Post;
                      end
                      else
                      begin
                        if ((DM.qrSp.FieldByName('TO_SC').AsString = '26003310076201') or (DM.qrSp.FieldByName('TO_SC').AsString = '26006000022847')) then
                        begin
                          WriteToLogFile('GetParamForProv - 1');
                          GetParamForProv(1, DM.qrSp.FieldByName('FROM_SC').AsString, DM.qrSp.FieldByName('TO_SC').AsString, 0, DocType, GroupOper, KodOper);
                          if DocType <> '' then
                           begin
                             BankProv.New(DocType);
                             BankProv.fieldGROUP_OPER.Value:= GroupOper;// 7361000 ;
                             BankProv.fieldKOD_OPER.Value:= KodOper;  //311030  ;
                             BankProv.fieldCFO.AsInteger:= 3;
                             BankProv.fieldDK_TO.AsFloat:= 37310549;
                           end
                          else
                           begin
                             DM.qrSp.Edit;
                             DM.qrSp.FieldByName('STATUS').AsInteger:= 4;
                             DM.qrSp.Post;
                           end;
                        end
                        else
                        begin
                         { DocType:= bPivd.DocType;
                          BankProv.New(bPivd.DocType);
                          BankProv.fieldGROUP_OPER.Value := bPivd.GroupOper;
                          BankProv.fieldKOD_OPER.Value   := bPivd.KodOper;
                          BankProv.fieldDK_TO.AsFloat    := bPivd.DKTo;}
                           DocType:= '';
                           DM.qrSp.Edit;
                           DM.qrSp.FieldByName('STATUS').AsInteger:= 4;
                           DM.qrSp.Post;
                        end;
                      if DocType <> '' then
                      begin
                        BankProv.fieldOPERDATE.AsDateTime := strtodate(DM.qrSp.FieldByName('DATEP').AsString);
                        BankProv.fieldDOCNUMBER.AsInteger := DM.qrSp.FieldByName('NUMP').AsInteger;
                        BankProv.fieldDK_FROM.AsFloat     := DM.qrSP.FieldByName('FROM_KOD').AsFloat;
                        //StrToFloat(GetSubDKFromNP(DM.qrSp.FieldByName('NP').AsString, from_kod));
                        BankProv.fieldSUMMA1.AsFloat      := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                        BankProv.fieldNOTES.AsString      := DM.qrSp.FieldByName('NP').AsString;
                        if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value := 21;
                        BankProv.Save;
                        DM.qrSp.Edit;
                        DM.qrSp.FieldByName('PRVRECID').AsInteger := BankProv.fieldRECID.AsInteger;
                        DM.qrSp.FieldByName('STATUS').AsInteger   := 1;
                        DM.qrSp.Post;
                        BankProv.Close;
                        inc(lIns);
                        end;
                      end;
                    except
                      on E: Exception do
                      begin
                        WriteToLogFile('  Ошибка при создании проводки, банк Південний: ' + E.Message + #13#10 + floattostr(from_kod_d) );
                        DM.qrSp.Edit;
                        DM.qrSp.FieldByName('STATUS').AsInteger := 3;
                        inc(lErr);
                        DM.qrSp.Post;
                      end;
                    end;
                  end
                 end
                   else
                begin
                  {$REGION 'Инкассация'}
                  try
                    BankProv.New(DM.qrPVW.FieldByName('doctype').AsString);
                    BankProv.fieldOPERDATE.Value                                 := strtodate(DM.qrSp.FieldByName('DATEP').AsString);
                    BankProv.fieldDOCNUMBER.Value                                := DM.qrSp.FieldByName('NUMP').AsInteger;
                    BankProv.fieldGROUP_OPER.Value                               := DM.qrPVW.FieldByName('GROUPOPER').AsInteger;
                    BankProv.fieldKOD_OPER.Value                                 := DM.qrPVW.FieldByName('KODOPER').AsInteger;
                    BankProv.fieldDK_FROM.Value                                  := DM.qrSp.FieldByName('FROM_KOD').AsFloat;
                    BankProv.fieldDK_TO.Value                                    := bPivd.DKTo;
                    BankProv.fieldSUMMA1.Value                                   := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                    BankProv.fieldNOTES.Value                                    := DM.qrSp.FieldByName('NP').AsString;
                    BankProv.fieldCFO.Value                                      := DM.qrPVW.FieldByName('CFO').AsInteger;
                    BankProv.fieldREG_BASEID.Value                               := DM.qrPVW.FieldByName('CFO').AsInteger;
                    if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value := 21;
                    BankProv.fieldREG_BASEID.Value                               := DM.qrPVW.FieldByName('CFO').AsInteger;
                    BankProv.Save;
                    DM.qrSp.Edit;
                    DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                    DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                    DM.qrSp.Post;
                    BankProv.Close;
                    inc(lIns);
                  except
                    on e:Exception do
                    begin
                      WriteToLogFile('  Ошибка при создании проводки, банк Південний, инкассация: ' + E.Message);
                      DM.qrSp.Edit;
                      DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                      inc(lErr);
                      DM.qrSp.Post;
                    end;
                  end;
                  {$ENDREGION}
                end;
                end;
            end; // Банк Пивденный
            {$ENDREGION}

          2:{$REGION 'Индустриал'}
            begin
              if (DM.qrSp.FieldByName('SUMMAK').AsFloat=0) OR (DM.qrSp.FieldByName('FROM_KOD').AsInteger=bInd.DKTo) then
              begin
                // нет необходимости делать вставку
                DM.qrSp.Edit;
                DM.qrSp.FieldByName('STATUS').AsInteger:=4;
                DM.qrSp.Post;
              end
              else
                begin
                  // проверим дебитора
                  from_kod := sabDK(Trim(ReplaceStr(DM.qrSp.FieldByName('FROM_KOD').AsString,',','.')), DM.qrSp.FieldByName('NP').AsString);
                  DM.qrW.Close;
                  DM.qrW.SQL.Text:='select count(*) from SPRAV_DK where KOD_DK=' + from_kod;
                  DM.qrW.ExecQuery;
                  if DM.qrW.Fields[0].AsInteger=0 then
                  begin
                    // нет DK
                    DM.qrSp.Edit;
                    DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                    inc(lErr);
                    DM.qrSp.Post;
                  end
                  else
                    begin
                      // платежка на вставку...
                      try
                        BankProv.New(bInd.DocType);
                        BankProv.fieldOPERDATE.Value   := DM.qrSp.FieldByName('DATEP').AsDateTime;
                        BankProv.fieldDOCNUMBER.Value  := DM.qrSp.FieldByName('NUMP').AsInteger;
                        BankProv.fieldGROUP_OPER.Value := bInd.GroupOper;
                        BankProv.fieldKOD_OPER.Value   := bInd.KodOper;
                        BankProv.fieldDK_FROM.Value    := StrToFloat(from_kod);
                        BankProv.fieldDK_TO.Value      := bInd.DKTo;
                        BankProv.fieldSUMMA1.Value     := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                        BankProv.fieldNOTES.Value      := DM.qrSp.FieldByName('NP').AsString;
                        if dbParams.SendToRegions > 0 then BankProv.fieldSTATE.Value:=21;
                        BankProv.Save;
                        DM.qrSp.Edit;
                        DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                        DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                        DM.qrSp.Post;
                        BankProv.Close;
                        inc(lIns);
                      except
                        on e:Exception do
                        begin
                          WriteToLogFile('  Ошибка при создании проводки, банк Индустриал: ' + E.Message);
                          DM.qrSp.Edit;
                          DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                          inc(lErr);
                          DM.qrSp.Post;
                        end;
                      end;
                    end;
                end;
            end;  // ИндустриалБанк
            {$ENDREGION}

          3:{$REGION 'OTP'}
            begin
              if ((DM.qrSp.FieldByName('SUMMAK').AsFloat=0)
              OR ((DM.qrSp.FieldByName('TO_KOD').AsFloat <> 25484884)
              and (DM.qrSp.FieldByName('TO_KOD').AsFloat<>37310549))) then
              begin
                // нет необходимости делать вставку
                DM.qrSp.Edit;
                DM.qrSp.FieldByName('STATUS').AsInteger:=4;
                DM.qrSp.Post;
              end
              else
                begin
                  // проверим дебитора
                  DM.qrW.Close;
                  DM.qrW.SQL.Text:='select count(*) from SPRAV_DK where KOD_DK='+
                    ReplaceStr(DM.qrSp.FieldByName('FROM_KOD').AsString,',','.');
                  DM.qrW.ExecQuery;
                  if DM.qrW.Fields[0].AsInteger=0 then
                  begin
                    // нет DK
                    DM.qrSp.Edit;
                    DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                    inc(lErr);
                    DM.qrSp.Post;
                  end
                  else
                    begin
                      // платежка на вставку...
                      try
                        BankProv.New(bOTP.DocType);
                        BankProv.fieldOPERDATE.Value:=DM.qrSp.FieldByName('DATEP').AsDateTime;
                        BankProv.fieldDOCNUMBER.Value:=DM.qrSp.FieldByName('NUMP').AsInteger;
                        BankProv.fieldGROUP_OPER.Value:=bOTP.GroupOper;
                        BankProv.fieldKOD_OPER.Value:=bOTP.KodOper;
                        BankProv.fieldDK_FROM.Value:=DM.qrSp.FieldByName('FROM_KOD').AsFloat;
                        BankProv.fieldDK_TO.Value:=DM.qrSp.FieldByName('TO_KOD').AsFloat;
                        BankProv.fieldSUMMA1.Value:=DM.qrSp.FieldByName('SUMMAK').AsFloat;
                        BankProv.fieldNOTES.Value:=DM.qrSp.FieldByName('NP').AsString;
                        if dbParams.SendToRegions > 0 then
                          BankProv.fieldSTATE.Value:=21;
                        BankProv.Save;
                        DM.qrSp.Edit;
                        DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                        DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                        DM.qrSp.Post;
                        BankProv.Close;
                        inc(lIns);
                      except
                        on e:Exception do
                        begin
                          WriteToLogFile('  Ошибка при создании проводки, банк OTP: '+ E.Message);
                          DM.qrSp.Edit;
                          DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                          inc(lErr);
                          DM.qrSp.Post;
                        end;
                      end;
                    end;
                end;
            end;
            {$ENDREGIoN}

          4:{$REGION 'ПУМБ'}
            begin
              if ((DM.qrSp.FieldByName('SUMMAK').AsFloat=0) OR
              ((DM.qrSp.FieldByName('TO_KOD').AsFloat <> 25484884)
              and (DM.qrSp.FieldByName('TO_KOD').AsFloat<>37310549))) then
              begin
                // нет необходимости делать вставку
                DM.qrSp.Edit;
                DM.qrSp.FieldByName('STATUS').AsInteger:=4;
                DM.qrSp.Post;
              end
              else
                begin
                  // проверим дебитора
                  DM.qrW.Close;
                  DM.qrW.SQL.Text:='select count(*) from SPRAV_DK where KOD_DK='+
                    ReplaceStr(DM.qrSp.FieldByName('FROM_KOD').AsString,',','.');
                  DM.qrW.ExecQuery;
                  if DM.qrW.Fields[0].AsInteger=0 then
                  begin
                    // нет DK
                    DM.qrSp.Edit;
                    DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                    inc(lErr);
                    DM.qrSp.Post;
                  end
                  else
                    begin
                      // платежка на вставку...
                      try
                        BankProv.New(bFuib.DocType);
                        BankProv.fieldOPERDATE.Value:=DM.qrSp.FieldByName('DATEP').AsDateTime;
                        BankProv.fieldDOCNUMBER.Value:=DM.qrSp.FieldByName('NUMP').AsInteger;
                        BankProv.fieldGROUP_OPER.Value:=bFuib.GroupOper;
                        BankProv.fieldKOD_OPER.Value:=bFuib.KodOper;
                        BankProv.fieldDK_FROM.Value:=DM.qrSp.FieldByName('FROM_KOD').AsFloat;
                        BankProv.fieldDK_TO.Value:=DM.qrSp.FieldByName('TO_KOD').AsFloat;
                        BankProv.fieldSUMMA1.Value:=DM.qrSp.FieldByName('SUMMAK').AsFloat;
                        BankProv.fieldNOTES.Value:=DM.qrSp.FieldByName('NP').AsString;
                        if dbParams.SendToRegions > 0 then
                          BankProv.fieldSTATE.Value:=21;
                        BankProv.Save;
                        DM.qrSp.Edit;
                        DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                        DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                        DM.qrSp.Post;
                        BankProv.Close;
                        inc(lIns);
                      except
                        on e:Exception do
                        begin
                          WriteToLogFile('  Ошибка при создании проводки, банк ПУМБ: ' + E.Message);
                          DM.qrSp.Edit;
                          DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                          inc(lErr);
                          DM.qrSp.Post;
                        end;
                      end;
                    end;
                end;
            end;  // ПУМБ
            {$ENDREGION}

          5:{$REGION 'ПраймБанк'}
            begin
              DM.qrSp.Edit;
              DM.qrSp.FieldByName('STATUS').AsInteger:=4;
              DM.qrSp.Post;
            end;
            {$ENDREGION}

          6:{$REGION 'Аваль'}
            begin
              if (DM.qrSp.FieldByName('SUMMAK').AsFloat > 0) then
              begin
                //if ((HasManufacturerPaymentsContract(DM.qrSp.FieldByName('FROM_KOD').AsFloat)) or (DM.qrSp.FieldByName('TO_KOD').AsFloat = 32096432)) then
                //begin
                //  {$REGION 'Платежи на производителя. Признак - наличие документа (см. функцию). или получатель - Имидж Холдинг'}
                //  try
                //    if (ActualBalanceForFactoryProv(DM.qrSP.FieldByName('FROM_KOD').AsFloat)=77) then
                //    begin
                //      BankProv.New(bAval.DocType);
                //      BankProv.fieldGROUP_OPER.Value := 77361000;
                //    end
                //    else
                //    begin
                //      BankProv.New('Прв7');
                //       BankProv.fieldGROUP_OPER.Value := 7361000;
                //    end;
                //    BankProv.fieldOPERDATE.Value       := DM.qrSp.FieldByName('DATEP').AsDateTime;
                //    BankProv.fieldDOCNUMBER.Value      := DM.qrSp.FieldByName('NUMP').AsInteger;
                //    BankProv.fieldKOD_OPER.Value       := 685000; //bAval.KodOper;   //
                //    BankProv.fieldDK_FROM.Value        := DM.qrSp.FieldByName('FROM_KOD').AsFloat;
                //    BankProv.fieldDK_TO.Value          := DM.qrSp.FieldByName('TO_KOD').AsFloat;
                //    BankProv.fieldSUMMA1.Value         := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                //    BankProv.fieldNOTES.Value          := DM.qrSp.FieldByName('NP').AsString;
                //    if dbParams.SendToRegions > 0 then BankProv.fieldSTATE.Value:=21;
                //    BankProv.Save;
                //    DM.qrSp.Edit;
                //    DM.qrSp.FieldByName('PRVRECID').AsInteger := BankProv.fieldRECID.AsInteger;
                //    DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                //    DM.qrSp.Post;
                //   BankProv.Close;
                 //   inc(lIns);
                //  except
                //    on e:Exception do
                //    begin
                //      WriteToLogFile('  Ошибка при создании проводки, банк Аваль: ' + e.Message);
                 //     DM.qrSp.Edit;
                 //     DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                 //     inc(lErr);
                //      DM.qrSp.Post;
                //    end;
                //  end;
                //  {$ENDREGION}
                //end
                //else
//                if ((DM.qrSp.FieldByName('TO_KOD').AsFloat = 25484884) or (DM.qrSp.FieldByName('TO_KOD').AsFloat=37310549)) then
                if ((DM.qrSp.FieldByName('TO_KOD').AsFloat=37310549) and (DM.qrSp.FieldByName('FROM_KOD').AsFloat<>DM.qrSp.FieldByName('TO_KOD').AsFloat) and (DM.qrSp.FieldByName('TO_SC').AsString ='UA423808050000000026008419851' {'26008205517'}) and (DM.qrSp.FieldByName('FROM_KOD').AsFloat<>23794014)) then
                begin      //УДК
                  if (not IsExistsKodDK(DM.qrSP.FieldByName('FROM_KOD').AsFloat)) then
                   begin
                     DM.qrSp.Edit;
                     DM.qrSp.FieldByName('STATUS').AsInteger:=2; //дк не найден
                     inc(lErr);
                     DM.qrSp.Post;
                   end
                  else
                   begin
                   {$REGION 'Создание проводки'}
                   try
                     if  DM.qrSp.FieldByName('TO_KOD').AsFloat=37310549   then
                       BankProv.New('ППс7')
                     else
                       BankProv.New('ППс77');
                     BankProv.fieldOPERDATE.Value       := DM.qrSp.FieldByName('DATEP').AsDateTime;
                     BankProv.fieldDOCNUMBER.Value      := DM.qrSp.FieldByName('NUMP').AsInteger;
                     if  DM.qrSp.FieldByName('TO_KOD').AsFloat=37310549   then
                     begin
                       BankProv.fieldGROUP_OPER.Value     := 7361000;
                       BankProv.fieldKOD_OPER.Value       := 311040; //311013;
                     end
                     else
                     begin
                       BankProv.fieldGROUP_OPER.Value     := 77361000;
                       BankProv.fieldKOD_OPER.Value       := 311130;
                     end;
                     BankProv.fieldDK_FROM.Value        := DM.qrSp.FieldByName('FROM_KOD').AsFloat;
                     BankProv.fieldDK_TO.Value         := DM.qrSp.FieldByName('TO_KOD').AsFloat;
                     BankProv.fieldSUMMA1.Value         := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                     BankProv.fieldNOTES.Value          := DM.qrSp.FieldByName('NP').AsString;
  //                  BankProv.fieldCFO.AsInteger        := DM.qrW.FieldByName('CFO').AsInteger;
  //                  BankProv.fieldREG_BASEID.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
                     if dbParams.SendToRegions > 0 then BankProv.fieldSTATE.Value:=21;
                     BankProv.Save;
                     DM.qrSp.Edit;
                     DM.qrSp.FieldByName('PRVRECID').AsInteger := BankProv.fieldRECID.AsInteger;
                     DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                     DM.qrSp.Post;
                     BankProv.Close;
                     inc(lIns);
                   except
                     on e:Exception do
                     begin
                       WriteToLogFile('  Ошибка при создании проводки, банк Аваль: ' + e.Message);
                       DM.qrSp.Edit;
                       DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                       inc(lErr);
                       DM.qrSp.Post;
                     end;
                   end;
                  {$ENDREGION}
                   end;
                end
                else
                if (DM.qrSp.FieldByName('TO_KOD').AsFloat=32174761) then
                 begin //Полтава ЛВЗ
                   if (DM.qrSp.FieldByName('FROM_SC').AsString ='29020316519') then
                    begin
                      {$REGION 'поступлений со счета 29020316519'}
                      try
                        BankProv.New('ППс11');
                        BankProv.fieldOPERDATE.Value       := DM.qrSp.FieldByName('DATEP').AsDateTime;
                        BankProv.fieldDOCNUMBER.Value      := DM.qrSp.FieldByName('NUMP').AsInteger;
                        BankProv.fieldGROUP_OPER.Value     := 113330000;
                        BankProv.fieldKOD_OPER.Value       := 3110060;//40;
                        BankProv.fieldDK_FROM.Value        := DM.qrSp.FieldByName('FROM_KOD').AsFloat;
                        BankProv.fieldDK_TO.Value         := DM.qrSp.FieldByName('TO_KOD').AsFloat;
                        BankProv.fieldSUMMA1.Value         := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                        BankProv.fieldNOTES.Value          := DM.qrSp.FieldByName('NP').AsString;
  //                  BankProv.fieldCFO.AsInteger        := DM.qrW.FieldByName('CFO').AsInteger;
  //                  BankProv.fieldREG_BASEID.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
                        if dbParams.SendToRegions > 0 then BankProv.fieldSTATE.Value:=21;
                        BankProv.Save;
                        DM.qrSp.Edit;
                        DM.qrSp.FieldByName('PRVRECID').AsInteger := BankProv.fieldRECID.AsInteger;
                        DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                        DM.qrSp.Post;
                        BankProv.Close;
                        inc(lIns);
                      except
                        on e:Exception do
                         begin
                           WriteToLogFile('  Ошибка при создании проводки, банк Аваль, ЛВЗ Полтава: ' + e.Message);
                           DM.qrSp.Edit;
                           DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                           inc(lErr);
                           DM.qrSp.Post;
                         end;
                      end;
                      {$ENDREGION}
                    end
                   else
                    begin
                      if (not IsExistsKodDK(DM.qrSP.FieldByName('FROM_KOD').AsFloat)) then
                       begin
                         DM.qrSp.Edit;
                         DM.qrSp.FieldByName('STATUS').AsInteger:=2; //дк не найден
                         inc(lErr);
                         DM.qrSp.Post;
                       end
                      else
                      {$REGION 'От покупателя'}
                      try
                        BankProv.New('ППс11');
                        BankProv.fieldOPERDATE.Value       := DM.qrSp.FieldByName('DATEP').AsDateTime;
                        BankProv.fieldDOCNUMBER.Value      := DM.qrSp.FieldByName('NUMP').AsInteger;
                        BankProv.fieldGROUP_OPER.Value     := 11361000;
                        BankProv.fieldKOD_OPER.Value       := 3110060;//40;
                        BankProv.fieldDK_FROM.Value        := DM.qrSp.FieldByName('FROM_KOD').AsFloat;
                        BankProv.fieldDK_TO.Value         := DM.qrSp.FieldByName('TO_KOD').AsFloat;
                        BankProv.fieldSUMMA1.Value         := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                        BankProv.fieldNOTES.Value          := DM.qrSp.FieldByName('NP').AsString;
  //                  BankProv.fieldCFO.AsInteger        := DM.qrW.FieldByName('CFO').AsInteger;
  //                  BankProv.fieldREG_BASEID.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
                        if dbParams.SendToRegions > 0 then BankProv.fieldSTATE.Value:=21;
                        BankProv.Save;
                        DM.qrSp.Edit;
                        DM.qrSp.FieldByName('PRVRECID').AsInteger := BankProv.fieldRECID.AsInteger;
                        DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                        DM.qrSp.Post;
                        BankProv.Close;
                        inc(lIns);
                      except
                        on e:Exception do
                         begin
                           WriteToLogFile('  Ошибка при создании проводки, банк Аваль, ЛВЗ Полтава: ' + e.Message);
                           DM.qrSp.Edit;
                           DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                           inc(lErr);
                           DM.qrSp.Post;
                         end;
                      end;
                      {$ENDREGION}
                    end
                 end
                else
                 begin
                   // нет необходимости делать вставку
                   DM.qrSp.Edit;
                   DM.qrSp.FieldByName('STATUS').AsInteger:=4;
                   DM.qrSp.Post;
                 end
              end
              else // ((DM.qrSp.FieldByName('SUMMAK').AsFloat=0) OR (DM.qrSp.FieldByName('TO_KOD').AsFloat <> 25484884)) then
              begin
                // нет необходимости делать вставку
                DM.qrSp.Edit;
                DM.qrSp.FieldByName('STATUS').AsInteger:=4;
                DM.qrSp.Post;
              end;
            end;
            {$ENDREGION}

          8:{$REGION 'ПромИнвестБанк'}
            begin
              if ((DM.qrSp.FieldByName('SUMMAK').AsFloat <> 0)
              and ((DM.qrSp.FieldByName('TO_KOD').AsFloat = 25484884)
              or (DM.qrSp.FieldByName('TO_KOD').AsFloat=37310549))) then
              begin
                // проверим дебитора
                DM.qrW.Close;
//                DM.qrW.SQL.Text := 'select count(*) from SPRAV_DK where KOD_DK= :DK';
                DM.qrW.SQL.Text := 'select sb.cfo from sprav_bank sb where sb.mfo = :MFO';
//                  'select' + #13#10 +
//                  '  (select count(*) from SPRAV_DK where KOD_DK= :DK) CNT,'#13#10 +
//                  '  (select sb.cfo from sprav_bank sb where sb.mfo = :MFO) CFO'#13#10 +
//                  'from rdb$database';
//                DM.qrW.ParamByName('DK').AsFloat    := DM.qrSp.FieldByName('FROM_KOD').AsFloat;
                DM.qrW.ParamByName('MFO').AsInteger := DM.qrSp.FieldByName('MFO').AsInteger;
                DM.qrW.ExecQuery;
                if {(DM.qrW.FieldByName('CNT').AsInteger = 0) or} (DM.qrW.FieldByName('CFO').IsNull) then
                begin
                  DM.qrSp.Edit;
                  DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                  inc(lErr);
                  DM.qrSp.Post;
                end else
                begin
                  try
                    BankProv.New(bPIBinet.DocType);
                    BankProv.fieldOPERDATE.Value       := DM.qrSp.FieldByName('DATEP').AsDateTime;
                    BankProv.fieldDOCNUMBER.Value      := DM.qrSp.FieldByName('NUMP').AsInteger;
                    BankProv.fieldGROUP_OPER.Value     := bPibINET.GroupOper;
                    BankProv.fieldKOD_OPER.Value       := bPibINET.KodOper;
//                    BankProv.fieldDK_FROM.Value        := DM.qrSp.FieldByName('FROM_KOD').AsFloat;
//                    BankProv.fieldDK_TO.Value          := DM.qrSp.FieldByName('TO_KOD').AsFloat;
                    BankProv.fieldSUMMA1.Value         := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                    BankProv.fieldNOTES.Value          := DM.qrSp.FieldByName('NP').AsString;
                    BankProv.fieldCFO.AsInteger        := DM.qrW.FieldByName('CFO').AsInteger;
                    BankProv.fieldREG_BASEID.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
                    if dbParams.SendToRegions > 0 then BankProv.fieldSTATE.Value:=21;
                    BankProv.Save;
                    DM.qrSp.Edit;
                    DM.qrSp.FieldByName('PRVRECID').AsInteger := BankProv.fieldRECID.AsInteger;
                    DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                    DM.qrSp.Post;
                    BankProv.Close;
                    inc(lIns);
                  except
                    on e:Exception do
                    begin
                      WriteToLogFile('  Ошибка при создании проводки, банк ПИБ: ' + E.Message);
                      DM.qrSp.Edit;
                      DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                      inc(lErr);
                      DM.qrSp.Post;
                    end;
                  end;
                end;
              end else
              begin
                // нет необходимости делать проводку
                DM.qrSp.Edit;
                DM.qrSp.FieldByName('STATUS').AsInteger := 4;
                DM.qrSp.Post;
              end;
            end;
            {$ENDREGION}

          0:{$REGION 'ПриватБанк'}
            begin
              fProv:= False;
              if (((DM.qrSp.FieldByName('TO_KOD').AsString = '42735405') or (DM.qrSp.FieldByName('TO_KOD').AsString = '43178627') or (DM.qrSp.FieldByName('TO_KOD').AsString = '44364729') ) and (DM.qrSp.FieldByName('FROM_KOD').AsString <> '37310549') and (DM.qrSp.FieldByName('FROM_KOD').AsString <> DM.qrSp.FieldByName('TO_KOD').AsString)) then
               {$REGION 'ПриватБанк - ГСГ и ГСЕ'}
               begin     // ГСГ
                 DM.qrW.Close;
                            DM.qrW.SQL.Text := 'select bdo.group_oper, bdo.kod_oper, bdo.balance_kod, bdo.kod_dk, bdo.doctype '+
                                               'from bank_dkoper bdo where bdo.payment_type = 1 and bdo.kod_dk = ' + DM.qrSp.FieldByName('TO_KOD').AsString + ' and bdo.to_sc = ''' + trim(DM.qrSp.FieldByName('TO_SC').AsString)+'''';
                            DM.qrW.ExecQuery;
                            no_insert:='0';
                            if DM.qrW.Eof then no_insert:='3';
                            if no_insert='0' then
                            begin
                              if (DM.qrSp.FieldByName('PRVRECID').AsInteger=0) then
                              begin
                                sN:= Ansiuppercase( DM.qrSp.FieldByName('NP').AsString);
                                if ((POs('ВИРУЧ', sN)>0) or (POs('ВЫРУЧ', sN)>0))  then
                                 begin
                                   DebtorFrom := 0;
                                   DM.qrW.Close;
                                   DM.qrW.SQL.Text := 'select bdo.group_oper, bdo.kod_oper, bdo.balance_kod, bdo.kod_dk, bdo.doctype '+
                                               'from bank_dkoper bdo where bdo.payment_type = 0 and bdo.kod_dk = ' + DM.qrSp.FieldByName('TO_KOD').AsString + ' and bdo.to_sc = ''' + trim(DM.qrSp.FieldByName('TO_SC').AsString)+'''';
                                   DM.qrW.ExecQuery;
                                 end
                                else
                                 DebtorFrom:= GetDkFrom(StrToFloat(DM.qrSp.FieldByName('FROM_KOD').AsString), DM.qrSp.FieldByName('FROM_SC').AsString, DM.qrSp.FieldByName('NP').AsString);

                                if DM.qrW.Eof then no_insert:='3';
                                if no_insert='0' then
                                try
                                  //BankProv.New(bPrivat.KorpDocType);
                                  BankProv.New(DM.qrW.FieldByName('doctype').AsString);
                                  BankProv.fieldOPERDATE.Value   := strtodate(DM.qrSp.FieldByName('DATEP').AsString);
                                  BankProv.fieldDOCNUMBER.Value  := DM.qrSp.FieldByName('NUMP').AsInteger;
                                  BankProv.fieldGROUP_OPER.Value := DM.qrW.FieldByName('GROUP_OPER').AsInteger;  //bPrivat.KorpGroupOper;
                                  BankProv.fieldKOD_OPER.Value   := DM.qrW.FieldByName('KOD_OPER').AsInteger;    //bPrivat.KorpKodOper;

                                  BankProv.fieldDK_TO.AsString   := DM.qrSp.FieldByName('TO_KOD').AsString;
                                  BankProv.fieldSUMMA1.Value     := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                                  BankProv.fieldNOTES.Value      := DM.qrSp.FieldByName('NP').AsString;
                                  if (DebtorFrom = 0) then
                                  begin
                                    BankProv.fieldCFO.AsInteger := 3;
                                    BankProv.fieldREG_BASEID.AsInteger := 3;
                                  end
                                  else
                                   BankProv.fieldDK_FROM.Value := DebtorFrom;
                                  if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value:=21;
                                  BankProv.Save;
                                  DM.qrSp.Edit;
                                  DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                                  DM.qrSp.Post;
                                  BankProv.Close;
                                except
                                  on e:Exception do
                                  begin
                                    WriteToLogFile('  Ошибка при создании проводки, Приватбанк_ГСГ_ГСЕ: ' + E.Message);
                                    BankProv.Close;
                                    no_insert:='4';
                                  end;
                                end;
                              end;//if PRVRECID is null
                            end;
                            DM.qrSp.Edit;

                            if no_insert='0' then
                            begin
                             if (DebtorFrom = 0) then
                              DM.qrSp.FieldByName('STATUS').AsInteger:=1
                             else
                              DM.qrSp.FieldByName('STATUS').AsInteger:=5
                            end
                            else
                             DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                            DM.qrSp.Post;
               end
            {$ENDREGION}
              else
              begin
                if ((DM.qrSp.FieldByName('TO_KOD').AsString <> '37310549') or (Pos('3648',trim(DM.qrSp.FieldByName('TO_SC').AsString)) = 1) or (Pos('3648',trim(DM.qrSp.FieldByName('TO_SC').AsString)) = 16)) then
                begin
                  DM.qrSp.Edit;
                  DM.qrSp.FieldByName('STATUS').AsInteger:= 4;
                  DM.qrSp.Post;
                  inc(lIns);
                end
              else
               begin
                no_insert:='0';
                // только УДК
                if (    (Pos('20',DM.qrSp.FieldByName('FROM_SC').AsString)=1) or
                        (Pos('26',DM.qrSp.FieldByName('FROM_SC').AsString)=1) or
                        (Pos('20',DM.qrSp.FieldByName('FROM_SC').AsString)=16) or
                        (Pos('26',DM.qrSp.FieldByName('FROM_SC').AsString)=16)
                   ) then
                  begin
                    {$REGION 'Обработка счетов на 20 и 26'}
                    from_kod:=sabDK(CheckKodDkBySchet(trim(DM.qrSp.FieldByName('FROM_SC').AsString),
                            Trim(DM.qrSp.FieldByName('FROM_KOD').AsString)),DM.qrSp.FieldByName('NP').AsString);
                    to_kod:=CheckKodDkBySchet(trim(DM.qrSp.FieldByName('TO_SC').AsString),
                            Trim(DM.qrSp.FieldByName('TO_KOD').AsString));
                    //if from_kod = '0' then no_insert:='1';
                    if to_kod = '0' then no_insert:='2';
                   if from_kod <> '0' then
                    if (not ((IsInternalDk(from_kod)) AND (Pos('26',trim(DM.qrSp.FieldByName('FROM_SC').AsString)) <> 1) and (not((length(trim(DM.qrSp.FieldByName('FROM_SC').AsString))=29) and (Pos('26',trim(DM.qrSp.FieldByName('FROM_SC').AsString))=16))))) then
                    begin
                      if not is_sub then
                        CheckSubDk(from_kod, trim(DM.qrSp.FieldByName('FROM_SC').AsString));
                      // создаем проводку
                      DM.qrW.Close;
                      DM.qrW.SQL.Text:='select bdo.group_oper, bdo.kod_oper, bdo.balance_kod, bdo.kod_dk, bdo.doctype '+
                                       'from bank_dkoper bdo where bdo.payment_type=0 and bdo.kod_dk='+to_kod + ' and bdo.to_sc= ''' + DM.qrSp.FieldByName('TO_SC').AsString + '''';
                      DM.qrW.ExecQuery;
                      if DM.qrW.Eof then
                       begin
                         DM.qrW.Close;
                         DM.qrW.SQL.Text:='select bdo.group_oper, bdo.kod_oper, bdo.balance_kod, bdo.kod_dk, bdo.doctype '+
                                          'from bank_dkoper bdo where bdo.payment_type=0 and bdo.kod_dk='+to_kod;
                         DM.qrW.ExecQuery;
                         if DM.qrW.Eof then
                          no_insert:='3';
                       end;
                      if no_insert='0' then
                      begin
                        if (DM.qrSp.FieldByName('PRVRECID').AsInteger=0) and
                         (DM.qrSp.FieldByName('STATUS').AsInteger=0) then
                        begin
                          try
                            BankProv.New(DM.qrW.FieldByName('doctype').AsString);
                            BankProv.fieldOPERDATE.Value:=strtodate( DM.qrSp.FieldByName('DATEP').AsString);
                            BankProv.fieldDOCNUMBER.Value:=DM.qrSp.FieldByName('NUMP').AsInteger;
                            BankProv.fieldGROUP_OPER.Value:=DM.qrW.FieldByName('group_oper').AsInteger;
                            BankProv.fieldKOD_OPER.Value:=DM.qrW.FieldByName('kod_oper').AsInteger;
                            BankProv.fieldDK_FROM.AsString:=from_kod;
                            BankProv.fieldDK_TO.AsString:=to_kod;
                            BankProv.fieldSUMMA1.Value:=DM.qrSp.FieldByName('SUMMAK').AsFloat;
                            BankProv.fieldNOTES.Value:=DM.qrSp.FieldByName('NP').AsString;
                            if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value:=21;
                            BankProv.Save;
                            DM.qrSp.Edit;
                            DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                            DM.qrSp.Post;
                            BankProv.Close;
                            fProv:= true;
                          except
                            on e:Exception do
                            begin
                              WriteToLogFile('  Ошибка при создании проводки, Приватбанк: ' + E.Message);
                              BankProv.Close;
                              no_insert:='4';
                              WriteToLogFile('Документ: '+DM.qrSp.FieldByName('DATEP').AsString+' №'+DM.qrSp.FieldByName('NUMP').AsString+' сумма: '+DM.qrSp.FieldByName('SUMMAK').AsString);
                            end;
                          end;
                        end; //
                      end; //no_insert=0
                      DM.qrSp.Edit;
                      if no_insert='0' then
                      begin
                        DM.qrSp.FieldByName('STATUS').AsInteger   :=1;
                        inc(lIns);
                      end
                      else
                        begin
                          DM.qrSp.FieldByName('STATUS').AsInteger :=2;
                          inc(lErr);
                        end;
                      DM.qrSp.Post;
                    end
                    {$ENDREGION}
                  end;
                  // else
                  if (not fProv) then

                  begin
                    {$REGION 'обработка счетов на 29'}
                    if ((Pos('2902',trim(DM.qrSp.FieldByName('FROM_SC').AsString))=1) or (Pos('2902',trim(DM.qrSp.FieldByName('FROM_SC').AsString))=16)) then
                    begin
                      // корпоратив
                      // проверка наличия
                      re:=TRegExpr.Create;
                      try
                        re.Expression := '\d{6,}';
                        if (re.Exec(Trim(DM.qrSp.FieldByName('NP').AsString))) then
                        repeat
                          no_insert:= '0';
                          from_kod := re.Match[0];
                          if length(re.Match[0])=27 then    // цифры от Iban пропускаем
                           from_kod:= '';
                          if from_kod <> '' then
                          begin
                            DM.qrW.Close;
                            DM.qrW.SQL.Text:='select count(*) as cnt from sprav_dk where kod_dk =' + from_kod;
                            DM.qrW.ExecQuery;
                            if DM.qrW.FieldByName('cnt').AsInteger=0 then from_kod := '';
                            DM.qrW.Close;
                          end;
                          if from_kod='' then from_kod:='0';
                          to_kod := CheckKodDkBySchet(trim(DM.qrSp.FieldByName('TO_SC').AsString), Trim(DM.qrSp.FieldByName('TO_KOD').AsString));
                          //if from_kod = '0' then no_insert:='1';
                          if to_kod   = '0' then no_insert:='2';
                          // По этому надо сделать цикл.
                          if (from_kod <> '0') then
                           if not IsInternalDk(from_kod) then
                            begin
                              CheckSubDk(from_kod, trim(DM.qrSp.FieldByName('FROM_SC').AsString));
                              // создаем проводку
                              DM.qrW.Close;
                              DM.qrW.SQL.Text := 'select bdo.group_oper, bdo.kod_oper, bdo.balance_kod, bdo.kod_dk, bdo.doctype '+
                                               'from bank_dkoper bdo where bdo.payment_type = 1 and bdo.kod_dk = ' + to_kod + ' and bdo.to_sc = ''' + trim(DM.qrSp.FieldByName('TO_SC').AsString) + '''';
                              DM.qrW.ExecQuery;
                              if DM.qrW.Eof then no_insert:='3';
                              if no_insert='0' then
                              begin
                               if (DM.qrSp.FieldByName('PRVRECID').AsInteger=0) then
                                begin
                                  try
                                  //BankProv.New(bPrivat.KorpDocType);
                                    BankProv.New(DM.qrW.FieldByName('doctype').AsString);
                                    BankProv.fieldOPERDATE.Value   := strtodate(DM.qrSp.FieldByName('DATEP').AsString);
                                    BankProv.fieldDOCNUMBER.Value  := DM.qrSp.FieldByName('NUMP').AsInteger;
                                    BankProv.fieldGROUP_OPER.Value := DM.qrW.FieldByName('GROUP_OPER').AsInteger;  //bPrivat.KorpGroupOper;
                                    BankProv.fieldKOD_OPER.Value   := DM.qrW.FieldByName('KOD_OPER').AsInteger;    //bPrivat.KorpKodOper;
                                    BankProv.fieldDK_FROM.AsString := from_kod;
                                    BankProv.fieldDK_TO.AsString   := to_kod;
                                    BankProv.fieldSUMMA1.Value     := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                                    BankProv.fieldNOTES.Value      := DM.qrSp.FieldByName('NP').AsString;
                                    if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value:=21;
                                    BankProv.Save;
                                    DM.qrSp.Edit;
                                    DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                                    DM.qrSp.Post;
                                    BankProv.Close;
                                    fProv:= true;
                                  except
                                    on e:Exception do
                                    begin
                                       WriteToLogFile('  Ошибка при создании проводки, Приватбанк_корпоратив: ' + E.Message);
                                       BankProv.Close;
                                       no_insert:='4';
                                    end;
                                  end;
                                end;//if PRVRECID is null
                              end;
                            DM.qrSp.Edit;

                            if no_insert='0'
                            then DM.qrSp.FieldByName('STATUS').AsInteger:=5
                            else DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                            DM.qrSp.Post;
                          end
                          {else
                          begin
                            DM.qrSp.Edit;
                            DM.qrSp.FieldByName('STATUS').AsInteger := 3;
                            DM.qrSp.Post;
                            no_insert := '4'; //?
                          end;  }
                        until ((not re.ExecNext) OR (no_insert = '0'))
                        {else  // not Expression
                          if (((DM.qrSp.FieldByName('TO_KOD').AsString <> '25484884') and (DM.qrSp.FieldByName('TO_KOD').AsFloat<>37310549))
                          AND (CheckKodDkBySchet(trim(DM.qrSp.FieldByName('TO_SC').AsString), Trim(DM.qrSp.FieldByName('TO_KOD').AsString)) <> '25484884')
                          AND (CheckKodDkBySchet(trim(DM.qrSp.FieldByName('TO_SC').AsString), Trim(DM.qrSp.FieldByName('TO_KOD').AsString)) <> '37310549')) then
                            MakePPProvForPrivat // Check for 25484884
                          else
                          begin
                            no_insert:= '1';
                            DM.qrSp.Edit;
                            DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                            DM.qrSp.Post;
                          end; }
                      finally
                        re.Free;
                      end; // корпоратив
                      // Проверяю на платёж по Ф2
                      if ((not fProv) and (from_kod<>'0')) then
                      begin
                        to_kod:=CheckKodDkBySchet(trim(DM.qrSp.FieldByName('TO_SC').AsString),
                                Trim(DM.qrSp.FieldByName('TO_KOD').AsString));
                       // if from_kod = '0' then no_insert:='1';
                        if to_kod = '0'   then no_insert:='2';
                        DM.qrW.Close;
                        DM.qrW.SQL.Text := 'select group_dk from sprav_dk where kod_dk = ' + to_kod;
                        DM.qrW.ExecQuery;
                        if not DM.qrW.Eof then
                          if ((DM.qrW.FieldByName('group_dk').AsInteger = 2) AND (getDKF2(to_kod, Trim(DM.qrSp.FieldByName('NP').AsString)) <> '0' )) then
                          begin
                            DM.qrW.Close;
                            DM.qrW.SQL.Text:='select group_oper, kod_oper, balance_kod, kod_dk, doctype, cfo '+
                                             'from bank_dkoper_F2 where user_id='+getDKF2(to_kod, Trim(DM.qrSp.FieldByName('NP').AsString));
                            DM.qrW.ExecQuery;
                            if not DM.qrW.Eof then
                            try
                              BankProv.New(DM.qrW.FieldByName('doctype').AsString);
                              BankProv.fieldGROUP_OPER.Value     := DM.qrW.FieldByName('group_oper').AsInteger;
                              BankProv.fieldKOD_OPER.Value       := DM.qrW.FieldByName('kod_oper').AsInteger;
                              BankProv.fieldCFO.AsInteger        := DM.qrW.FieldByName('CFO').AsInteger;
                              BankProv.fieldREG_BASEID.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
                              BankProv.fieldOPERDATE.Value       := strtodate(DM.qrSp.FieldByName('DATEP').AsString);
                              BankProv.fieldDOCNUMBER.Value      := DM.qrSp.FieldByName('NUMP').AsInteger;
                              BankProv.fieldDK_FROM.AsString     := DM.qrW.FieldByName('KOD_DK').AsString;
                              BankProv.fieldDK_TO.AsString       := to_kod;
                              BankProv.fieldSUMMA1.Value         := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                              BankProv.fieldNOTES.Value          := DM.qrSp.FieldByName('NP').AsString;
                              BankProv.fieldREG_BASEID.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
                              if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value:=21;
                              BankProv.Save;
                              DM.qrSp.Edit;
                              DM.qrSp.FieldByName('STATUS').AsInteger:=10;
                              DM.qrSp.Post;
                              BankProv.Close;
                              fProv:= true;
                            except
                              on e:Exception do
                              begin
                                WriteToLogFile('  Ошибка при создании проводки, Приватбанк_ЧП: ' + E.Message);
                                BankProv.Close;
                                no_insert:='4';
                                WriteToLogFile('  Документ: '+DM.qrSp.FieldByName('DATEP').AsString+' №'+DM.qrSp.FieldByName('NUMP').AsString+' сумма: '+DM.qrSp.FieldByName('SUMMAK').AsString);
                              end;
                            end;
                          end; // Group DK = 2
                      end; // if no_insert = 0
                      // вторая проводка по Ф2
                      if ((no_insert = '0') OR (no_insert = '5'))
                      then inc(lIns)
                      else inc(lErr);
                      {$ENDREGION}
                    end;
                    if (not FProv) then
                    {$REGION 'инкассация'}
                    begin
                      DM.qrW.Close;
                      DM.qrW.SQL.Text:=format('SELECT DOCTYPE, GROUPOPER, KODOPER, DK_FROM, DK_TO, CFO FROM GET_BANK_INKASS("%s",%s)',
                       [trim(DM.qrSp.FieldByName('FROM_SC').AsString),trim(DM.qrSp.FieldByName('TO_KOD').AsString)]);
                      DM.qrW.ExecQuery;
                      if not DM.qrW.Eof then
                       begin
                         {$REGION 'Пытаемся сохранить проводку, ставим статус в банк_док, в зависимости от результата сохранения'}
                          no_insert:='0';
                          try
                            BankProv.New(DM.qrW.FieldByName('DOCTYPE').AsString);
                            BankProv.fieldOPERDATE.Value       := strtodate(DM.qrSp.FieldByName('DATEP').AsString);
                            BankProv.fieldDOCNUMBER.Value      := DM.qrSp.FieldByName('NUMP').AsInteger;
                            BankProv.fieldGROUP_OPER.Value     := DM.qrW.FieldByName('GROUPOPER').AsInteger;
                            BankProv.fieldKOD_OPER.Value       := DM.qrW.FieldByName('KODOPER').AsInteger;
                            BankProv.fieldSUMMA1.Value         := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                            BankProv.fieldNOTES.Value          := DM.qrSp.FieldByName('NP').AsString;
                            BankProv.fieldCFO.AsInteger        := DM.qrW.FieldByName('CFO').AsInteger;
                            BankProv.fieldREG_BASEID.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
                            if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value:=21;
                            BankProv.Save;
                            DM.qrSp.Edit;
                            DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                            DM.qrSp.Post;
                            BankProv.Close;
                            FProv:=true;
                         except
                            on e:Exception do
                             begin
                               WriteToLogFile('  Ошибка при создании проводки, Приватбанк_Инкассация: ' + E.Message);
                               BankProv.Close;
                               no_insert:= '3';
                               WriteToLogFile('  Документ: '+DM.qrSp.FieldByName('DATEP').AsString+' №'+DM.qrSp.FieldByName('NUMP').AsString+' сумма: '+DM.qrSp.FieldByName('SUMMAK').AsString);
                             end;
                         end;
                         if no_insert='0' then
                          begin
                            DM.qrSp.Edit;
                            DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                            DM.qrSp.Post;
                            inc(lIns);
                          end else
                           begin
                             DM.qrSp.Edit;
                             DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                             DM.qrSp.Post;
                             inc(lErr);
                           end;
                        {$ENDREGION}
                       end
                      else
                       begin
                         {$REGION 'Дебитор не найден в BAnk_Inkass, ставим статус'}
                         DM.qrSp.Edit;
                         DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                         DM.qrSp.Post;
                         inc(lErr);
                         {$ENDREGION}
                       end;
                    end;
                    {$ENDREGION}
            end;
           end;
              end;
              end;
              {$ENDREGION}
           {$REGION 'ПриватБанк - old'}
           { begin
              if (DM.qrSp.FieldByName('TO_KOD').AsString = '42735405') and ((DM.qrSp.FieldByName('FROM_KOD').AsString <> '42735405')) then
               begin     // ГСГ
                 DM.qrW.Close;
                            DM.qrW.SQL.Text := 'select bdo.group_oper, bdo.kod_oper, bdo.balance_kod, bdo.kod_dk, bdo.doctype '+
                                               'from bank_dkoper bdo where bdo.payment_type = 1 and bdo.kod_dk = ' + DM.qrSp.FieldByName('TO_KOD').AsString + ' and bdo.to_sc = ''' + trim(DM.qrSp.FieldByName('TO_SC').AsString)+'''';
                            DM.qrW.ExecQuery;
                            if DM.qrW.Eof then no_insert:='3';
                            if no_insert='0' then
                            begin
                              if (DM.qrSp.FieldByName('PRVRECID').AsInteger=0) then
                              begin
                                try
                                  //BankProv.New(bPrivat.KorpDocType);
                                  BankProv.New(DM.qrW.FieldByName('doctype').AsString);
                                  BankProv.fieldOPERDATE.Value   := strtodate(DM.qrSp.FieldByName('DATEP').AsString);
                                  BankProv.fieldDOCNUMBER.Value  := DM.qrSp.FieldByName('NUMP').AsInteger;
                                  BankProv.fieldGROUP_OPER.Value := DM.qrW.FieldByName('GROUP_OPER').AsInteger;  //bPrivat.KorpGroupOper;
                                  BankProv.fieldKOD_OPER.Value   := DM.qrW.FieldByName('KOD_OPER').AsInteger;    //bPrivat.KorpKodOper;
                                  BankProv.fieldDK_FROM.AsString := DM.qrSp.FieldByName('FROM_KOD').AsString;
                                  BankProv.fieldDK_TO.AsString   := DM.qrSp.FieldByName('TO_KOD').AsString;
                                  BankProv.fieldSUMMA1.Value     := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                                  BankProv.fieldNOTES.Value      := DM.qrSp.FieldByName('NP').AsString;
                                  if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value:=21;
                                  BankProv.Save;
                                  DM.qrSp.Edit;
                                  DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                                  DM.qrSp.Post;
                                  BankProv.Close;
                                except
                                  on e:Exception do
                                  begin
                                    WriteToLogFile('  Ошибка при создании проводки, Приватбанк_ГСГ: ' + E.Message);
                                    BankProv.Close;
                                    no_insert:='4';
                                  end;
                                end;
                              end;//if PRVRECID is null
                            end;
                            DM.qrSp.Edit;

                            if no_insert='0'
                            then DM.qrSp.FieldByName('STATUS').AsInteger:=5
                            else DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                            DM.qrSp.Post;
               end
              else
              begin
              //Проверяю на инкассацию
              DM.qrW.Close;
              DM.qrW.SQL.Text:=format('SELECT first 1 DOCTYPE, GROUPOPER, KODOPER, DK_FROM, DK_TO, CFO FROM GET_BANK_INKASS("%s" ,%s , "%s" )',
                [trim(DM.qrSp.FieldByName('FROM_SC').AsString),DM.qrSp.FieldByName('TO_KOD').AsString, DM.qrSp.FieldByName('TO_SC').AsString]);
              DM.qrW.ExecQuery;

              if ((DM.qrW.Eof)
              or ((DM.qrSp.FieldByName('TO_KOD').AsString <> '25484884')
              and (DM.qrSp.FieldByName('TO_KOD').AsFloat<>37310549))
              ) then
           //   $REGION 'НЕ инкассация'
               if ((((DM.qrSp.FieldByName('TO_KOD').AsString = '25484884') and (DM.qrSp.FieldByName('FROM_KOD').AsString = '25484884')) or ((DM.qrSp.FieldByName('TO_KOD').AsString = '37310549') and (DM.qrSp.FieldByName('FROM_KOD').AsString = '37310549'))) or (Pos('3648',trim(DM.qrSp.FieldByName('TO_SC').AsString)) = 1) or (Pos('3648',trim(DM.qrSp.FieldByName('TO_SC').AsString)) = 16)) then
                begin
                  DM.qrSp.Edit;
                  DM.qrSp.FieldByName('STATUS').AsInteger:= 4;
                  DM.qrSp.Post;
                  inc(lIns);
                end
              else
               begin
                no_insert:='0';
                if not((trim(DM.qrSp.FieldByName('TO_KOD').AsString) = bPrivat.KodToIgnore) AND
                       (trim(DM.qrSp.FieldByName('TO_SC').AsString) = bPrivat.ScToIgnore)
                       //добавил УДК
                       and (trim(DM.qrSp.FieldByName('TO_KOD').AsString) = '37310549')) then
                begin
                  if ( (
                        (Pos('20',DM.qrSp.FieldByName('FROM_SC').AsString)=1) or
                        (Pos('26',DM.qrSp.FieldByName('FROM_SC').AsString)=1) or
                        (Pos('20',DM.qrSp.FieldByName('FROM_SC').AsString)=16) or
                        (Pos('26',DM.qrSp.FieldByName('FROM_SC').AsString)=16)

                        )
                         AND
                       ((Trim(DM.qrSp.FieldByName('TO_KOD').AsString) = '25484884')
                       or (DM.qrSp.FieldByName('TO_KOD').AsFloat=37310549))

                       )
                  then
                  begin
//                    $REGION 'Обработка счетов на 20 и 26'
                    from_kod:=sabDK(CheckKodDkBySchet(trim(DM.qrSp.FieldByName('FROM_SC').AsString),
                            Trim(DM.qrSp.FieldByName('FROM_KOD').AsString)),DM.qrSp.FieldByName('NP').AsString);
                    to_kod:=CheckKodDkBySchet(trim(DM.qrSp.FieldByName('TO_SC').AsString),
                            Trim(DM.qrSp.FieldByName('TO_KOD').AsString));
                    if from_kod = '0' then no_insert:='1';
                    if to_kod = '0' then no_insert:='2';
                    if (not ((IsInternalDk(from_kod)) AND (Pos('26',trim(DM.qrSp.FieldByName('FROM_SC').AsString)) <> 1) and (not((length(trim(DM.qrSp.FieldByName('FROM_SC').AsString))=29) and (Pos('26',trim(DM.qrSp.FieldByName('FROM_SC').AsString))=16))))) then
                    begin
                      if not is_sub then
                        CheckSubDk(from_kod, trim(DM.qrSp.FieldByName('FROM_SC').AsString));
                      // создаем проводку
                      DM.qrW.Close;
                      DM.qrW.SQL.Text:='select bdo.group_oper, bdo.kod_oper, bdo.balance_kod, bdo.kod_dk, bdo.doctype '+
                                       'from bank_dkoper bdo where bdo.payment_type=0 and bdo.kod_dk='+to_kod + ' and bdo.to_sc= ''' + DM.qrSp.FieldByName('TO_SC').AsString + '''';
                      DM.qrW.ExecQuery;
                      if DM.qrW.Eof then
                       begin
                         DM.qrW.Close;
                         DM.qrW.SQL.Text:='select bdo.group_oper, bdo.kod_oper, bdo.balance_kod, bdo.kod_dk, bdo.doctype '+
                                          'from bank_dkoper bdo where bdo.payment_type=0 and bdo.kod_dk='+to_kod;
                         DM.qrW.ExecQuery;
                         if DM.qrW.Eof then
                          no_insert:='3';
                       end;
                      if no_insert='0' then
                      begin
                        if (DM.qrSp.FieldByName('PRVRECID').AsInteger=0) and
                         (DM.qrSp.FieldByName('STATUS').AsInteger=0) then
                        begin
                          try
                            BankProv.New(DM.qrW.FieldByName('doctype').AsString);
                            BankProv.fieldOPERDATE.Value:=strtodate( DM.qrSp.FieldByName('DATEP').AsString);
                            BankProv.fieldDOCNUMBER.Value:=DM.qrSp.FieldByName('NUMP').AsInteger;
                            BankProv.fieldGROUP_OPER.Value:=DM.qrW.FieldByName('group_oper').AsInteger;
                            BankProv.fieldKOD_OPER.Value:=DM.qrW.FieldByName('kod_oper').AsInteger;
                            BankProv.fieldDK_FROM.AsString:=from_kod;
                            BankProv.fieldDK_TO.AsString:=to_kod;
                            BankProv.fieldSUMMA1.Value:=DM.qrSp.FieldByName('SUMMAK').AsFloat;
                            BankProv.fieldNOTES.Value:=DM.qrSp.FieldByName('NP').AsString;
                            if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value:=21;
                            BankProv.Save;
                            DM.qrSp.Edit;
                            DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                            DM.qrSp.Post;
                            BankProv.Close;
                          except
                            on e:Exception do
                            begin
                              WriteToLogFile('  Ошибка при создании проводки, Приватбанк: ' + E.Message);
                              BankProv.Close;
                              no_insert:='4';
                              WriteToLogFile('Документ: '+DM.qrSp.FieldByName('DATEP').AsString+' №'+DM.qrSp.FieldByName('NUMP').AsString+' сумма: '+DM.qrSp.FieldByName('SUMMAK').AsString);
                            end;
                          end;
                        end; //
                      end; //no_insert=0
                      DM.qrSp.Edit;
                      if no_insert='0' then
                      begin
                        DM.qrSp.FieldByName('STATUS').AsInteger   :=1;
                        inc(lIns);
                      end
                      else
                        begin
                          DM.qrSp.FieldByName('STATUS').AsInteger :=2;
                          inc(lErr);
                        end;
                      DM.qrSp.Post;
                    end else
                    begin
                      DM.qrSp.Edit;
                      DM.qrSp.FieldByName('STATUS').AsInteger   :=3;
                      inc(lErr);
                      DM.qrSp.Post;
                    end;
//                    $ENDREGION
                  end else
                  begin
                    //$REGION 'обработка счетов на 29'
                    if ((Pos('2902',trim(DM.qrSp.FieldByName('FROM_SC').AsString))=1) or (Pos('2902',trim(DM.qrSp.FieldByName('FROM_SC').AsString))=16)) then
                    begin
                      // корпоратив
                      // проверка наличия
                      re:=TRegExpr.Create;
                      try
                        re.Expression := '\d{6,';
                     {   if (((DM.qrSp.FieldByName('TO_KOD').AsString = '25484884')
                        or (DM.qrSp.FieldByName('TO_KOD').AsFloat=37310549))
                        AND (re.Exec(Trim(DM.qrSp.FieldByName('NP').AsString)))) then
                        repeat
                          no_insert:= '0';
                          from_kod := re.Match[0];
                          if from_kod <> '' then
                          begin
                            DM.qrW.Close;
                            DM.qrW.SQL.Text:='select count(*) as cnt from sprav_dk where kod_dk =' + from_kod;
                            DM.qrW.ExecQuery;
                            if DM.qrW.FieldByName('cnt').AsInteger=0 then from_kod := '';
                            DM.qrW.Close;
                          end;
                          if from_kod='' then from_kod:='0';
                          to_kod := CheckKodDkBySchet(trim(DM.qrSp.FieldByName('TO_SC').AsString), Trim(DM.qrSp.FieldByName('TO_KOD').AsString));
                          if from_kod = '0' then no_insert:='1';
                          if to_kod   = '0' then no_insert:='2';
                          // По этому надо сделать цикл.
                          if not IsInternalDk(from_kod) then
                          begin
                            CheckSubDk(from_kod, trim(DM.qrSp.FieldByName('FROM_SC').AsString));
                            // создаем проводку
                            DM.qrW.Close;
                            DM.qrW.SQL.Text := 'select bdo.group_oper, bdo.kod_oper, bdo.balance_kod, bdo.kod_dk, bdo.doctype '+
                                               'from bank_dkoper bdo where bdo.payment_type = 1 and bdo.kod_dk = ' + to_kod + ' and bdo.to_sc = ''' + trim(DM.qrSp.FieldByName('TO_SC').AsString) + '''';
                            DM.qrW.ExecQuery;
                            if DM.qrW.Eof then no_insert:='3';
                            if no_insert='0' then
                            begin
                              if (DM.qrSp.FieldByName('PRVRECID').AsInteger=0) then
                              begin
                                try
                                  //BankProv.New(bPrivat.KorpDocType);
                                  BankProv.New(DM.qrW.FieldByName('doctype').AsString);
                                  BankProv.fieldOPERDATE.Value   := strtodate(DM.qrSp.FieldByName('DATEP').AsString);
                                  BankProv.fieldDOCNUMBER.Value  := DM.qrSp.FieldByName('NUMP').AsInteger;
                                  BankProv.fieldGROUP_OPER.Value := DM.qrW.FieldByName('GROUP_OPER').AsInteger;  //bPrivat.KorpGroupOper;
                                  BankProv.fieldKOD_OPER.Value   := DM.qrW.FieldByName('KOD_OPER').AsInteger;    //bPrivat.KorpKodOper;
                                  BankProv.fieldDK_FROM.AsString := from_kod;
                                  BankProv.fieldDK_TO.AsString   := to_kod;
                                  BankProv.fieldSUMMA1.Value     := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                                  BankProv.fieldNOTES.Value      := DM.qrSp.FieldByName('NP').AsString;
                                  if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value:=21;
                                  BankProv.Save;
                                  DM.qrSp.Edit;
                                  DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                                  DM.qrSp.Post;
                                  BankProv.Close;
                                except
                                  on e:Exception do
                                  begin
                                    WriteToLogFile('  Ошибка при создании проводки, Приватбанк_корпоратив: ' + E.Message);
                                    BankProv.Close;
                                    no_insert:='4';
                                  end;
                                end;
                              end;//if PRVRECID is null
                            end;
                            DM.qrSp.Edit;

                            if no_insert='0'
                            then DM.qrSp.FieldByName('STATUS').AsInteger:=5
                            else DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                            DM.qrSp.Post;
                          end else
                          begin
                            DM.qrSp.Edit;
                            DM.qrSp.FieldByName('STATUS').AsInteger := 3;
                            DM.qrSp.Post;
                            no_insert := '4'; //?
                          end;
                        until ((not re.ExecNext) OR (no_insert = '0'))
                        else  // not Expression
                          if (((DM.qrSp.FieldByName('TO_KOD').AsString <> '25484884') and (DM.qrSp.FieldByName('TO_KOD').AsFloat<>37310549))
                          AND (CheckKodDkBySchet(trim(DM.qrSp.FieldByName('TO_SC').AsString), Trim(DM.qrSp.FieldByName('TO_KOD').AsString)) <> '25484884')
                          AND (CheckKodDkBySchet(trim(DM.qrSp.FieldByName('TO_SC').AsString), Trim(DM.qrSp.FieldByName('TO_KOD').AsString)) <> '37310549')) then
                            MakePPProvForPrivat // Check for 25484884
                          else
                          begin
                            no_insert:= '1';
                            DM.qrSp.Edit;
                            DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                            DM.qrSp.Post;
                          end;
                      finally
                        re.Free;
                      end; // корпоратив
                      // Проверяю на платёж по Ф2
                      if no_insert = '0' then
                      begin
                        to_kod:=CheckKodDkBySchet(trim(DM.qrSp.FieldByName('TO_SC').AsString),
                                Trim(DM.qrSp.FieldByName('TO_KOD').AsString));
                        if from_kod = '0' then no_insert:='1';
                        if to_kod = '0'   then no_insert:='2';
                        DM.qrW.Close;
                        DM.qrW.SQL.Text := 'select group_dk from sprav_dk where kod_dk = ' + to_kod;
                        DM.qrW.ExecQuery;
                        if not DM.qrW.Eof then
                          if ((DM.qrW.FieldByName('group_dk').AsInteger = 2) AND (getDKF2(to_kod, Trim(DM.qrSp.FieldByName('NP').AsString)) <> '0' )) then
                          begin
                            DM.qrW.Close;
                            DM.qrW.SQL.Text:='select group_oper, kod_oper, balance_kod, kod_dk, doctype, cfo '+
                                             'from bank_dkoper_F2 where user_id='+getDKF2(to_kod, Trim(DM.qrSp.FieldByName('NP').AsString));
                            DM.qrW.ExecQuery;
                            if not DM.qrW.Eof then
                            try
                              BankProv.New(DM.qrW.FieldByName('doctype').AsString);
                              BankProv.fieldGROUP_OPER.Value     := DM.qrW.FieldByName('group_oper').AsInteger;
                              BankProv.fieldKOD_OPER.Value       := DM.qrW.FieldByName('kod_oper').AsInteger;
                              BankProv.fieldCFO.AsInteger        := DM.qrW.FieldByName('CFO').AsInteger;
                              BankProv.fieldREG_BASEID.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
                              BankProv.fieldOPERDATE.Value       := strtodate(DM.qrSp.FieldByName('DATEP').AsString);
                              BankProv.fieldDOCNUMBER.Value      := DM.qrSp.FieldByName('NUMP').AsInteger;
                              BankProv.fieldDK_FROM.AsString     := DM.qrW.FieldByName('KOD_DK').AsString;
                              BankProv.fieldDK_TO.AsString       := to_kod;
                              BankProv.fieldSUMMA1.Value         := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                              BankProv.fieldNOTES.Value          := DM.qrSp.FieldByName('NP').AsString;
                              BankProv.fieldREG_BASEID.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
                              if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value:=21;
                              BankProv.Save;
                              DM.qrSp.Edit;
                              DM.qrSp.FieldByName('STATUS').AsInteger:=10;
                              DM.qrSp.Post;
                              BankProv.Close;
                            except
                              on e:Exception do
                              begin
                                WriteToLogFile('  Ошибка при создании проводки, Приватбанк_ЧП: ' + E.Message);
                                BankProv.Close;
                                no_insert:='4';
                                WriteToLogFile('  Документ: '+DM.qrSp.FieldByName('DATEP').AsString+' №'+DM.qrSp.FieldByName('NUMP').AsString+' сумма: '+DM.qrSp.FieldByName('SUMMAK').AsString);
                              end;
                            end;
                          end; // Group DK = 2
                      end; // if no_insert = 0
                      // вторая проводка по Ф2
                      if ((no_insert = '0') OR (no_insert = '5'))
                      then inc(lIns)
                      else inc(lErr);
                      //$ENDREGION
                    end else
                    begin  // все остальніе счета тупо ставим в исключен из обработки
                      DM.qrSp.Edit;
                      DM.qrSp.FieldByName('STATUS').AsInteger := 4;
                      DM.qrSp.Post;
                      inc(lErr);
                    end;
                  end;
                end else  // if isKODDKToIgnore
                begin
                  DM.qrSp.Edit;
                  DM.qrSp.FieldByName('STATUS').AsInteger := 4;
                  DM.qrSp.Post;
                  inc(lErr);
                end;
              end
//              $ENDREGION
              else
//              $REGION 'инкассация'
              begin
                // Проверка на ЧП
                // Товариство з обмеженою відповідальністю "Торгівельний будинок "Мегаполіс"
                //--- сюда же не зайдет,учитывая условия выше!!! - зачем???? (Яна)
                if ((DM.qrSp.FieldByName('TO_KOD').AsString <> '25484884') and (DM.qrSp.FieldByName('TO_KOD').AsFloat<>37310549)) then
                begin
                  DM.qrW.Close;
                  DM.qrW.SQL.Text:=format('SELECT DOCTYPE, GROUPOPER, KODOPER, DK_FROM, DK_TO FROM GET_BANK_INKASS("%s",%s)',
                    [trim(DM.qrSp.FieldByName('FROM_SC').AsString),trim(DM.qrSp.FieldByName('TO_KOD').AsString)]);
                  DM.qrW.ExecQuery;
                end;

                if not DM.qrW.Eof then
                begin
                  //$REGION 'Пытаемся сохранить проводку, ставим статус в банк_док, в зависимости от результата сохранения'
                  no_insert:='0';
                  try
                    BankProv.New(DM.qrW.FieldByName('DOCTYPE').AsString);
                    BankProv.fieldOPERDATE.Value       := strtodate(DM.qrSp.FieldByName('DATEP').AsString);
                    BankProv.fieldDOCNUMBER.Value      := DM.qrSp.FieldByName('NUMP').AsInteger;
                    BankProv.fieldGROUP_OPER.Value     := DM.qrW.FieldByName('GROUPOPER').AsInteger;
                    BankProv.fieldKOD_OPER.Value       := DM.qrW.FieldByName('KODOPER').AsInteger;
                    BankProv.fieldSUMMA1.Value         := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                    BankProv.fieldNOTES.Value          := DM.qrSp.FieldByName('NP').AsString;
                    BankProv.fieldCFO.AsInteger        := DM.qrW.FieldByName('CFO').AsInteger;
                    BankProv.fieldREG_BASEID.AsInteger := DM.qrW.FieldByName('CFO').AsInteger;
                    if dbParams.SendToRegions = 1 then BankProv.fieldSTATE.Value:=21;
                    BankProv.Save;
                    DM.qrSp.Edit;
                    DM.qrSp.FieldByName('PRVRECID').AsInteger:=BankProv.fieldRECID.AsInteger;
                    DM.qrSp.Post;
                    BankProv.Close;
                  except
                    on e:Exception do
                    begin
                      WriteToLogFile('  Ошибка при создании проводки, Приватбанк_Инкассация: ' + E.Message);
                      BankProv.Close;
                      no_insert := '3';
                      WriteToLogFile('  Документ: '+DM.qrSp.FieldByName('DATEP').AsString+' №'+DM.qrSp.FieldByName('NUMP').AsString+' сумма: '+DM.qrSp.FieldByName('SUMMAK').AsString);
                    end;
                  end;

                  if no_insert='0' then
                  begin
                    DM.qrSp.Edit;
                    DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                    DM.qrSp.Post;
                    inc(lIns);
                  end else
                  begin
                    DM.qrSp.Edit;
                    DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                    DM.qrSp.Post;
                    inc(lErr);
                  end;
//                  $ENDREGION
                end else
                begin
                  //$REGION 'Дебитор не найден в BAnk_Inkass, ставим статус'
                  DM.qrSp.Edit;
                  DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                  DM.qrSp.Post;
                  inc(lErr);
                  //$ENDREGION
                end;
              end;
//              $ENDREGION
            end;
  //          $ENDREGION
  }
  {$ENDREGION}

          21:{$REGION 'Банк ФОРУМ'}
            begin
              if ((DM.qrSp.FieldByName('SUMMAK').AsFloat <> 0)
              and ((DM.qrSp.FieldByName('TO_KOD').AsFloat = 25484884)
               or (DM.qrSp.FieldByName('TO_KOD').AsFloat=37310549))) then
              begin
                // проверим дебитора
                DM.qrW.Close;
                DM.qrW.SQL.Text := 'select count(*) from SPRAV_DK where KOD_DK= :DK';
                DM.qrW.ParamByName('DK').AsString := ReplaceStr(DM.qrSp.FieldByName('FROM_KOD').AsString,',','.');
                DM.qrW.ExecQuery;
                if DM.qrW.Fields[0].AsInteger = 0 then
                begin
                  // нет DK
                  DM.qrSp.Edit;
                  DM.qrSp.FieldByName('STATUS').AsInteger:=2;
                  inc(lErr);
                  DM.qrSp.Post;
                end else
                begin
                    // платежка на вставку...
                  try
                    BankProv.New(bForum.DocType);
                    BankProv.fieldOPERDATE.Value   := DM.qrSp.FieldByName('DATEP').AsDateTime;
                    BankProv.fieldDOCNUMBER.Value  := DM.qrSp.FieldByName('NUMP').AsInteger;
                    BankProv.fieldGROUP_OPER.Value := bForum.GroupOper;
                    BankProv.fieldKOD_OPER.Value   := bForum.KodOper;
                    BankProv.fieldDK_FROM.Value    := DM.qrSp.FieldByName('FROM_KOD').AsFloat;
                    BankProv.fieldDK_TO.Value      := DM.qrSp.FieldByName('TO_KOD').AsFloat;
                    BankProv.fieldSUMMA1.Value     := DM.qrSp.FieldByName('SUMMAK').AsFloat;
                    BankProv.fieldNOTES.Value      := DM.qrSp.FieldByName('NP').AsString;
                    if dbParams.SendToRegions > 0 then BankProv.fieldSTATE.Value:=21;
                    BankProv.Save;
                    DM.qrSp.Edit;
                    DM.qrSp.FieldByName('PRVRECID').AsInteger := BankProv.fieldRECID.AsInteger;
                    DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                    DM.qrSp.Post;
                    BankProv.Close;
                    inc(lIns);
                  except
                    on e:Exception do
                    begin
                      WriteToLogFile('  Ошибка при создании проводки, банк Форум: ' + E.Message);
                      DM.qrSp.Edit;
                      DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                      inc(lErr);
                      DM.qrSp.Post;
                    end;
                  end;
                end;
              end else
              begin
                // обработка комиссии и какого-то говна
                // если не комиссия и не говно - значит говно
                if ((DM.qrSp.FieldByName('SUMMAD').AsFloat <> 0)
                    and (DM.qrSp.FieldByName('TO_KOD').AsFloat = 26337346))
                then
                begin
                  if ((DM.qrSp.FieldByName('TO_SC').AsString = '61145107018102')
                      or (DM.qrSP.FieldByName('TO_SC').AsString = '61109107018137')
                      or (DM.qrSp.FieldByName('TO_SC').AsString = '61105107018108'))
                  then
                    try
                      BankProv.New('МО77');
                      BankProv.fieldOPERDATE.Value       := DM.qrSp.FieldByName('DATEP').AsDateTime;
                      BankProv.fieldDOCNUMBER.Value      := DM.qrSp.FieldByName('NUMP').AsInteger;
                      BankProv.fieldGROUP_OPER.AsInteger := 77311160;
                      BankProv.fieldKOD_OPER.AsInteger   := 920000; 
                      BankProv.fieldDK_FROM.Value        := DM.qrSp.FieldByName('FROM_KOD').AsFloat;
                      BankProv.fieldDK_TO.Value          := DM.qrSp.FieldByName('TO_KOD').AsFloat; //26337346 ??? попробуем, если сломается - поставим сразу код
                      BankProv.fieldSUMMA1.Value         := DM.qrSp.FieldByName('SUMMAD').AsFloat;
                      BankProv.fieldNOTES.Value          := DM.qrSp.FieldByName('NP').AsString;
                      if dbParams.SendToRegions > 0 then BankProv.fieldSTATE.Value:=21;
                      BankProv.Save;
                      DM.qrSp.Edit;
                      DM.qrSp.FieldByName('PRVRECID').AsInteger := BankProv.fieldRECID.AsInteger;
                      DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                      DM.qrSp.Post;
                      BankProv.Close;
                      inc(lIns);
                    except
                      on e:Exception do
                      begin
                        WriteToLogFile('  Ошибка при создании проводки, банк Форум: ' + E.Message);
                        DM.qrSp.Edit;
                        DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                        inc(lErr);
                        DM.qrSp.Post;
                      end;
                    end
                  else
                    if ((DM.qrSp.FieldByName('TO_SC').AsString = '2902690005') or (DM.qrSP.FieldByName('TO_SC').AsString = '2900990000'))
                    then
                      try
                        BankProv.New('МО77');
                        BankProv.fieldOPERDATE.Value       := DM.qrSp.FieldByName('DATEP').AsDateTime;
                        BankProv.fieldDOCNUMBER.Value      := DM.qrSp.FieldByName('NUMP').AsInteger;
                        BankProv.fieldGROUP_OPER.AsInteger := 77311160;
                        BankProv.fieldKOD_OPER.AsInteger   := 685804; 
                        BankProv.fieldDK_FROM.Value        := DM.qrSp.FieldByName('FROM_KOD').AsFloat;
                        BankProv.fieldDK_TO.Value          := DM.qrSp.FieldByName('TO_KOD').AsFloat; //26337346 ??? попробуем, если сломается - поставим сразу код
                        BankProv.fieldSUMMA1.Value         := DM.qrSp.FieldByName('SUMMAD').AsFloat;
                        BankProv.fieldNOTES.Value          := DM.qrSp.FieldByName('NP').AsString;
                        if dbParams.SendToRegions > 0 then BankProv.fieldSTATE.Value:=21;
                        BankProv.Save;
                        DM.qrSp.Edit;
                        DM.qrSp.FieldByName('PRVRECID').AsInteger := BankProv.fieldRECID.AsInteger;
                        DM.qrSp.FieldByName('STATUS').AsInteger:=1;
                        DM.qrSp.Post;
                        BankProv.Close;
                        inc(lIns);
                      except
                        on e:Exception do
                        begin
                          WriteToLogFile('  Ошибка при создании проводки, банк Форум: ' + E.Message);
                          DM.qrSp.Edit;
                          DM.qrSp.FieldByName('STATUS').AsInteger:=3;
                          inc(lErr);
                          DM.qrSp.Post;
                        end;
                      end
                    else
                    begin
                      // нет необходимости делать вставку
                      DM.qrSp.Edit;
                      DM.qrSp.FieldByName('STATUS').AsInteger := 4;
                      DM.qrSp.Post;
                    end;                           
                end else  
                begin
                  // нет необходимости делать вставку
                  DM.qrSp.Edit;
                  DM.qrSp.FieldByName('STATUS').AsInteger := 4;
                  DM.qrSp.Post;
                end;      
              end;
            end;
            {$ENDREGION}

            30:{$REGION 'Сити-банк Америка'}
             begin
               xsdt:= TXSDateTime.Create();
               try
                 xsdt.AsDateTime := DM.qrSp.FieldByName('DATEP').AsDateTime;
                 try
                   ws:= GetIAccountingTransaction(false, '',nil);
                   if (DM.qrSp.FieldByName('SUMMAD').AsFloat > 0) then
                    res := ws.InsertProvFromBankStatement(xsdt, DM.qrSp.FieldByName('NUMP').AsInteger, DM.qrSp.FieldByName('SUMMAD').AsFloat, DM.qrSp.FieldByName('NP').AsString)
                    else
                    res := ws.InsertProvFromBankStatement(xsdt, DM.qrSp.FieldByName('NUMP').AsInteger, -DM.qrSp.FieldByName('SUMMAK').AsFloat, DM.qrSp.FieldByName('NP').AsString);
                   DM.qrSp.Edit;
                   DM.qrSp.FieldByName('PRVRECID').AsInteger:= res;
                   DM.qrSp.FieldByName('STATUS').AsInteger:= 1;
                   DM.qrSp.Post;
                 except
                   on e:Exception do
                    begin
                      DM.qrSp.Edit;
                      DM.qrSp.FieldByName('STATUS').AsInteger:= 0;
                      inc(lErr);
                      DM.qrSp.Post;
                      WriteToLogFile('  Ошибка при вызове метода создания проводки по СИТИ-БАНКУ: ' + E.Message);
                    end;
                 end;
               finally
                xsdt.Free;
               end;
             end;
          {$ENDREGION}

            {31: begin  // ссоздание проводки на триггере BANK_DOC
                  DM.qrSp.Edit;
                  DM.qrSp.FieldByName('STATUS').AsInteger := 4;
                  DM.qrSp.Post;
                end
             }

          else //  Все прочие, россия и тп.
            begin
              aProvsDK := IntfMegaDBCommon.GetParam('DK_MAKE_PROV', '71351080');
              try
                no_insert:='0';
                if DM.qrW.EOF then no_insert:='3';

                from_kod := GetKodDK(DM.qrSp.FieldByName('FROM_KOD').AsString, DM.qrSp.FieldByName('FROM_SC').AsString);
                to_kod   := GetKodDK(DM.qrSp.FieldByName('TO_KOD').AsString, DM.qrSp.FieldByName('TO_SC').AsString);

                if from_kod = '' then no_insert := '1';
                if to_kod   = '' then no_insert := '2';

                if not ((CheckDKMakeProv(from_kod)) OR (CheckDKMakeProv(to_kod)))
                then no_insert := '1';

                if no_insert='0' then
                begin
                  if (DM.qrSp.FieldByName('PRVRECID').AsInteger=0)
                     and (DM.qrSp.FieldByName('STATUS').AsInteger=0)
                     and (from_kod <> to_kod)
                     and (DM.qrSp.FieldByName('SUMMAK').AsFloat<>0)
                  then
                  begin
                  //
                  end else // if summak <> 0
                  begin
                    BankProv.Close;
                    no_insert:='2';
                    DM.qrSp.Edit;
                    DM.qrSp.FieldByName('STATUS').AsInteger := 4;
                    DM.qrSp.Post;
                    Inc(lErr);
                  end;
                end else // if no_insert = '0'
                begin
                  no_insert := '1';
                  DM.qrSp.Edit;
                  if DM.qrSp.FieldByName('SUMMAK').AsFloat <> 0
                  then DM.qrSp.FieldByName('STATUS').AsInteger := 2
                  else DM.qrSp.FieldByName('STATUS').AsInteger := 4;
                  DM.qrSp.Post;
                  Inc(lErr);
                end;
              finally
              end;
            end;  // Все прочие
          end; //CASE
           except
            on e:Exception do
             begin
               WriteToLogFile('  Ошибка при вызове метода SaveProv: ' + E.Message);
             end;
           end;

          DM.qrSp.Next;
          if DM.qrSp.Eof then lLast:=true;
          DM.qrSp.Transaction.CommitRetaining;

        until DM.qrSp.Eof and lLast;

        if DM.qrSp.Transaction.InTransaction then DM.qrSp.Transaction.CommitRetaining;

          WriteToLogFile('  Создание проводок завершено.'+#13+#10+
             '   Обработано документов '+inttostr(lObr)+'.'+#13+#10+
             '   Создано проводок '+inttostr(lIns)+'.'+#13+#10+
             '   Ошибок '+inttostr(lErr)+'.'+#13+#10+
             '   Затрачено времени '+timetostr(Now-StartTime)+'.');
      end
      else
        WriteToLogFile('  Нет документов для обработки!');
    finally
      BankProv.Free;
    end;
  except
    on e:Exception do
    begin
      WriteToLogFile('  Ошибка при вызове метода SaveProv: ' + E.Message);
      exit;
    end;
  end;
end;

end.
