unit ufmReturnsMake;
                                                   
interface                                                    

uses
  Windows, Messages, SysUtils, Classes, Graphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxTextEdit, frxClass, frxExportXLS, FIBDataSet, pFIBDataSet,
  uMegaRDataSet, DBClient, ActnList, uMegaCustomDialog, uMegaSelectDK,
  FIBQuery, pFIBQuery, uTypes, FIBDatabase, pFIBDatabase, uMegaCustomSelectDB,
  uMegaComboSelect, uMegaSelBalance, uMegaCustomSelect, uMegaPeriodPanel2,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit,
  cxButtonEdit, cxLabel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxCheckBox, StdCtrls, cxButtons,
  Controls, ExtCtrls, uMegaForms,Forms,dialogs, cxSpinEdit, cxDBEdit,
  {$IFDEF RX_LIB_2_7_7}rxPlacemnt,{$ELSE}Placemnt,{$endif}
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  cxCalendar, cxLookAndFeels, IBCustomDataSet, cxNavigator, ComCtrls, dxCore,
  cxDateUtils;

type
  TfmReturnsMake = class(TMegaForm)
    pn_bottom: TPanel;
    pn_bottom_right: TPanel;
    btnClose: TcxButton;
    tr: TMegaTransaction;
    qr: TMegaQuery;
    cxGrid: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    pn_filters: TPanel;
    Panel1: TPanel;
    edSelDK: TcxButtonEdit;
    mselDK: TMegaSelDKDialog;
    ActionList1: TActionList;
    actRefresh: TAction;
    actClose: TAction;
    dsMain: TDataSource;
    cdsMain: TClientDataSet;
    cdsMainRECID: TIntegerField;
    cdsMainBaseID: TIntegerField;
    cdsMainOPERDATE: TDateField;
    cdsMainDOCTYPE: TStringField;
    cdsMainDOCNUMBER: TIntegerField;
    cdsMainKOD_MATER: TFloatField;
    cdsMainNAME_MATER: TStringField;
    cdsMainKOD_EAN: TFloatField;
    cdsMainADDRESS: TStringField;
    cdsMainKOLICH: TFloatField;
    cdsMainPRICE: TFloatField;
    cxView: TcxGridDBBandedTableView;
    cxViewRECID: TcxGridDBBandedColumn;
    cxViewBASEID: TcxGridDBBandedColumn;
    cxViewOPERDATE: TcxGridDBBandedColumn;
    cxViewDOCTYPE: TcxGridDBBandedColumn;
    cxViewDOCNUMBER: TcxGridDBBandedColumn;
    cxViewKOD_MATER: TcxGridDBBandedColumn;
    cxViewNAME_MATER: TcxGridDBBandedColumn;
    cxViewADDRESS: TcxGridDBBandedColumn;
    cxViewKOLICH: TcxGridDBBandedColumn;
    cxViewSUMMA: TcxGridDBBandedColumn;
    cdsMainKOLICH_MY: TFloatField;
    cxViewKOLICH_MY: TcxGridDBBandedColumn;
    cdsMainPRICE_PDV: TFloatField;
    cdsMainSCHET: TStringField;
    cxViewSCHET: TcxGridDBBandedColumn;
    cxViewSUMMA_PDV: TcxGridDBBandedColumn;
    cxLabel1: TcxLabel;
    edFilterNaklNumber: TcxTextEdit;
    cxLabel2: TcxLabel;
    fs: TFormStorage;
    pnCreateNakl: TPanel;
    qrMain: TMegaQuery;
    qrTT: TMegaDataSet;
    dsTT: TDataSource;
    qrTTRECID: TFIBIntegerField;
    qrTTBASEID: TFIBIntegerField;
    cmbTT: TcxLookupComboBox;
    actFullReturn: TAction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleSelected: TcxStyle;
    actCreateNewNakl: TAction;
    cxButton2: TcxButton;
    qrKodGroupOper: TMegaDataSet;
    dsqrKodGroupOper: TDataSource;
    qrKodGroupOperGROUP_OPER: TFIBIntegerField;
    qrKodGroupOperKOD_OPER: TFIBIntegerField;
    qrKodGroupOperNAME: TFIBStringField;
    actClearFullReturn: TAction;
    btnRefresh: TcxButton;
    cxViewSUMMA_MY: TcxGridDBBandedColumn;
    cdsMainSUMMA_MY: TFloatField;
    SelPeriod: TMegaPeriodPanel2;
    SelBalance: TMegaSelBalance;
    lbSelDK: TcxLabel;
    cxLabel3: TcxLabel;
    edFilterMaterName: TcxTextEdit;
    cxLabel6: TcxLabel;
    qrTTADDRESS: TFIBStringField;
    cdsNaklDistinct: TClientDataSet;
    cdsNaklDistinctRECID: TIntegerField;
    cdsNaklDistinctBASEID: TIntegerField;
    cdsNaklDistinctSCHET: TStringField;
    btnClearFilter: TcxButton;
    cxLabel4: TcxLabel;
    actFocusNaklFilter: TAction;
    actFocusMaterFilter: TAction;
    pmDocs: TPopupMenu;
    miOpenNakl: TMenuItem;
    miSep1: TMenuItem;
    miOpenLinkDocs: TMenuItem;
    Panel2: TPanel;
    btnFilterOnlyWithCounts: TcxButton;
    Panel3: TPanel;
    btnClearFullReturn: TcxButton;
    btnFullReturn: TcxButton;
    chbBoy: TcxCheckBox;
    edNotes: TcxTextEdit;
    cxLabel5: TcxLabel;
    qrGetOstatok: TMegaQuery;
    chbReturnsControl: TcxCheckBox;
    lbSaldo: TcxLabel;
    lbNaklNumber: TcxLabel;
    edNaklNumber: TcxTextEdit;
    btnOtlozLoad: TcxButton;
    btnOtlozSave: TcxButton;
    actClearFilter: TAction;
    Panel4: TPanel;
    cxLabel7: TcxLabel;
    chbPrintKorNN: TcxCheckBox;
    chbPrintPriemAct: TcxCheckBox;
    cxLabel8: TcxLabel;
    sePrintNaklCount: TcxSpinEdit;
    cdsMainIS_KOMISS_MATER: TIntegerField;
    cdsNaklDistinctIS_KOMISS_MATER: TIntegerField;
    cxViewIS_KOMISS_MATER: TcxGridDBBandedColumn;
    cxStyleContentEven: TcxStyle;
    cxStyleContentOdd: TcxStyle;
    chbChangePriceOper: TcxCheckBox;
    edNaklDate: TcxDateEdit;
    cxLabel9: TcxLabel;
    chbPodotchet: TcxCheckBox;
    actBoy: TAction;
    actPodotchet: TAction;
    cxLabel10: TcxLabel;
    qrCauseSprav: TMegaDataSet;
    qrCauseSpravCAUSEID: TFIBIntegerField;
    qrCauseSpravNAME: TFIBStringField;
    dsCauseSprav: TDataSource;
    edReturnCauseId: TcxLookupComboBox;
    cdsNaklDistinctDOCNUMBER: TIntegerField;
    cdsNaklDistinctoperdate: TDateField;
    chkMarkDown: TcxCheckBox;
    cdsMainBALANCE_KOD: TIntegerField;
    cdsNaklDistinctbalance_kod: TIntegerField;
    cxViewKOD_EAN: TcxGridDBBandedColumn;
    qrCauseSpravType: TMegaDataSet;
    FIBIntegerField1: TFIBIntegerField;
    FIBStringField1: TFIBStringField;
    dsCauseSpravType: TDataSource;
    edReturnTypeId: TcxLookupComboBox;
    cxLabel11: TcxLabel;
    qrCauseSpravTypePos: TMegaDataSet;
    FIBIntegerField2: TFIBIntegerField;
    qrCauseSpravTypePosOPERKOD: TIntegerField;
    qrCauseSpravTypePosOPERGROUP: TIntegerField;
    qrCauseSpravTypePosDOCTYPE: TStringField;
    qrCauseSpravTypePosFIELDDK: TFloatField;
    qrCauseSpravTypePosACCOUNT: TStringField;
    qrCauseSpravTypePosBALANCE: TIntegerField;
    lbExperitorDK: TcxLabel;
    lbPerevDK: TcxLabel;
    cdsMainKOD_OPER: TIntegerField;
    cdsMainGROUP_OPER: TIntegerField;
    cdsNaklDistinctKOD_OPER: TIntegerField;
    cdsNaklDistinctGROUP_OPER: TIntegerField;
    mExpeditorDK: TMegaSelDKDialog;
    edExperitorDK: TcxButtonEdit;
    edPerevDK: TcxButtonEdit;
    mPerevDK: TMegaSelDKDialog;
    cmbTTDK: TcxLookupComboBox;
    qrTTDK: TMegaDataSet;
    qrTTDKRECID: TFIBIntegerField;
    qrTTDKBASEID: TFIBIntegerField;
    qrTTDKADDRESS: TFIBStringField;
    dsTTDK: TDataSource;
    edStiker: TcxTextEdit;
    lbStiker: TcxLabel;
    lbZayavka: TcxLabel;
    edZayavka: TcxTextEdit;
    cdsMainDATE_ROZLIVA: TDateField;
    cxViewDATE_ROZLIVA: TcxGridDBBandedColumn;
    cdsMainINVOCE_NUMBER: TIBStringField;
    cxViewINVOCE_NUMBER: TcxGridDBBandedColumn;
    cdsMainREGID_FORM_A: TStringField;
    cdsMainREGID_FORM_B: TStringField;
    cxViewREGID_FORM_A: TcxGridDBBandedColumn;
    cxViewREGID_FORM_B: TcxGridDBBandedColumn;
    qrCauseSpravTypeNEED_MORE_DOC: TFIBIntegerField;
    MegaSelBalance1: TMegaSelBalance;
    qrCauseSpravTypeIS_SEL_BALANCE: TFIBIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEdit1PropertiesButtonClick1(Sender: TObject;
      AButtonIndex: Integer);
    procedure actRefreshExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actFullReturnExecute(Sender: TObject);
    //procedure actCreateNewNaklExecute(Sender: TObject);
    procedure actCreateNewNaklExecuteNew(Sender: TObject);
    procedure SelBalanceChange(Sender: TObject);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure edFilterNaklNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFilterMaterNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actFocusNaklFilterExecute(Sender: TObject);
    procedure actFocusMaterFilterExecute(Sender: TObject);
    procedure miOpenNaklClick(Sender: TObject);
    procedure miOpenLinkDocsClick(Sender: TObject);
    procedure btnFilterOnlyWithCountsClick(Sender: TObject);
    procedure cxViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cdsMainBeforePost(DataSet: TDataSet);
    procedure chbReturnsControlClick(Sender: TObject);
    procedure btnOtlozSaveClick(Sender: TObject);
    procedure btnOtlozLoadClick(Sender: TObject);
    procedure actClearFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   // procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edPerevDKPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edReturnTypeIdPropertiesChange(Sender: TObject);
    procedure edSelDKEnter(Sender: TObject);
  private
    KOD_DK,KOD_EXP_DK,KOD_PER_DK : double;
    DKSaldo : double;
    FilterNum,FilterMater : string;
    FilterOnlyWithCount : boolean;
    // если возврат загружен из временной таблицы,то по созданию накладных удаляем его
    ReturnIsLoadedFromTable : boolean;


    { Private declarations }
    procedure updateDKName;
    procedure SetFilter;

    procedure CreateCDS;
    procedure LoadCDS;
    procedure LoadGrid;

    procedure CheckSaldo;
    procedure updateDKExpName;
    procedure updateDKPerevName;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent;
                       AKOD_DK: Double   ;
                       ABalance: integer = 0;
                       ADATE_FROM: TDate = 0;
                       ADATE_TILL: TDate = 0 ); overload;
    procedure AddReturnCause(aRECID, aBASEID : integer;aKodDk:double=0);
  end;

function isReturnNakl(aGROUP_OPER,aKOD_OPER: integer) : boolean;
function isNeedCheckSaldoForReturn(aGROUP_OPER,aKOD_OPER: integer) : boolean;
function isReturnsControl : boolean;
function CheckDKDolg(aRECID,aBASEID: integer; aBalance: integer; aSchet: string;
         aDatabase: TFIBDatabase; aTransaction: TFIBTransaction; aOwner:TComponent=nil;
         aKOD_DK:double = 0; aOPERDATE:TDate = 0 ) : double;


implementation

uses Variants, rxStrUtils, DateUtils, MoneyData, umegaintf, uConst, uUtils,
     uMegaObjDocNakl, uMegaDSDocNakl, udmMegaReports, DocList, ufmLinkedDocs,
     ReestrData, udmPrintInternalDoc, PrintRetNakl2, liUtils;

{$R *.DFM}

constructor TfmReturnsMake.Create( AOwner: TComponent;
                                   AKOD_DK: Double   ;
                                   ABalance: integer = 0;
                                   ADATE_FROM: TDate = 0;
                                   ADATE_TILL: TDate = 0 ); 
begin // конструктор с KOD_DK //
  Create(AOwner);

  // подставляю баланс
  if ABalance <> 0 then
    SelBalance.Value := IntToStr(ABalance);

  // подставляю период
  if (ADATE_FROM <> 0) and (ADATE_TILL<>0) then
  begin
    SelPeriod.TillDate := ADATE_TILL;
    SelPeriod.FromDate := ADATE_FROM;
  end;

  // открываю форму сразу с выбранным дебитором
  if aKOD_DK <> 0 then
    KOD_DK := aKOD_DK;

  updateDKName;
end;

constructor TfmReturnsMake.Create(AOwner: TComponent);
begin
  // главный конструктор //
  inherited Create(AOwner);
  // открываю датасеты //
  KOD_DK := 0;
  KOD_EXP_DK:=0;KOD_PER_DK:=0;
  tr.StartTransaction;

  // в каком периоде открываю документы
  SelPeriod.TillDate := Date;
  SelPeriod.FromDate := IncMonth(StartOfTheMonth(Date),-1);

  // в каком балансе смотрим накладные
  SelBalance.Open;
  SelBalance.Value := Format('%d',[IntfMegaCommon.GetMainFirmBalanceKod]);

  megaSelBalance1.Open;

  // справочник причин возвратов
  qrCauseSprav.Active := true;

  //справочник причин типов возврата
 if IntfMegaDBCommon.GetCountry = iccRussia then
   begin
     //edExperitorDK.Visible:=True;
     edPerevDK.Visible:=True;
     lbExperitorDK.Caption:='Экспедитор';
     lbPerevDK.Visible:=True;
     cmbTTDK.Visible:=False;
     lbZayavka.Visible:=False;
     edZayavka.Visible:=False;
     edStiker.Visible:=False;
     lbStiker.Visible:=False;
   end
   else
    begin
      //edExperitorDK.Visible:=False;
      edPerevDK.Visible:=False;
      lbExperitorDK.Caption:='Дебитор\Экспедитор';
      lbPerevDK.Visible:=False;
      cmbTTDK.Visible:=True;

    end;
 try
 qrCauseSpravType.Active := true;

    except
    end;
  // коды/ группы операций
  qrKodGroupOper.Open;

  // галочка "контролировать остатки и сальдо"
  chbReturnsControl.Visible := GetCurrentUserRightsFor(
        'SET_PARAM_RETURNS_POS_CONTROL','', false,false,false,true,false);
  if chbReturnsControl.Visible then
  try
    chbReturnsControl.checked := IntfMegaDBCommon.GetParam('RETURNS_POS_CONTROL','0')='1';
  except
    MessageDlg('Отсутствует параметр "RETURNS_POS_CONTROL" в параметрах базы'#13#10+
               'Обратитесь в отдел поддержки пользователей',mtError,[mbOk],0);
  end;

end;

procedure TfmReturnsMake.actClearFilterExecute(Sender: TObject);
begin
  // очищаю фильтры
  FilterNum := '';
  FilterMater := '';
  FilterOnlyWithCount := false;

  cxView.DataController.Filter.Root.Clear;
end;

procedure TfmReturnsMake.actCloseExecute(Sender: TObject);
begin // закрыть форму
  Close;
end;

procedure TfmReturnsMake.actFocusMaterFilterExecute(Sender: TObject);
begin
  edFilterMaterName.SetFocus;
end;

procedure TfmReturnsMake.actFocusNaklFilterExecute(Sender: TObject);
begin
  edFilterNaklNumber.SetFocus;
end;

procedure TfmReturnsMake.actFullReturnExecute(Sender: TObject);
var
  i,SelCount : integer;
  SelAll : boolean;
  rec : tcxCustomGridRecord;
  lbm: TBookMarkStr;
begin
  // полный возврат
  SelCount := 0;
  for i := 0 to cxview.ViewData.RecordCount - 1 do
    if cxview.ViewData.Records[i].Selected then
      begin
        inc(SelCount);
        if SelCount >= 2  then
          break;
      end;
  SelAll := SelCount <= 1;

  try
  lbm:= cdsMain.Bookmark;
  cdsMain.DisableControls;

  for i := 0 to cxview.ViewData.RecordCount - 1 do
   if SelAll or cxview.ViewData.Records[i].Selected then
    begin
      rec := cxview.ViewData.Records[i];
      cdsMain.Locate('RECID;BASEID;KOD_MATER;SCHET',
          VarArrayOf([rec.Values[cxViewRECID.Index],
                      rec.Values[cxViewBASEID.Index],
                      rec.Values[cxViewKOD_MATER.Index],
                      rec.Values[cxViewSCHET.Index]  ]),[]);
      cdsMain.Edit;
      if Sender = actFullReturn then
        cdsMainKOLICH_MY.AsInteger := cdsMainKOLICH.AsInteger
       else
        cdsMainKOLICH_MY.AsInteger := 0;
      cdsMain.Post;
      cdsMain.Next;
    end;
  finally
  cdsMain.Bookmark:= lbm;
  cdsMain.EnableControls;
  end;
end;

procedure TfmReturnsMake.actRefreshExecute(Sender: TObject);
var
  OldCursor : TCursor;
begin // обновить
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  cxGrid.Visible := false;
  try
    CreateCDS;
    LoadCDS;
    LoadGrid;
    CheckSaldo;
    ReturnIsLoadedFromTable := false;
    edNaklNumber.Text := '';

    cxView.Bands[1].ApplyBestFit();
  finally
    Screen.Cursor := OldCursor;
    cxGrid.Visible := true;
  end;
end;

procedure TfmReturnsMake.AddReturnCause(aRECID, aBASEID: integer;aKodDk:double=0);
begin // добавляю причину возврата
  try
    qr.Close;
    qr.SQL.Text :=
      '  DELETE FROM RETURN_CAUSE                                    '#13#10+
      '  WHERE RECID = :RECID                                        '#13#10+
      '    and BASEID = :BASEID;                                     ';
    qr.ParamByName('RECID').asInteger := aRECID;
    qr.ParamByName('BASEID').asInteger := aBASEID;
    qr.ExecQuery;
    qr.Close;
    qr.SQL.Text :=
      'INSERT INTO RETURN_CAUSE(RECID, BASEID, CAUSE, NOTE, ACTDATE, KOD_DK )'#13#10+
      'SELECT                                                        '#13#10+
      '      dn.RECID,                                               '#13#10+
      '      dn.BASEID,                                              '#13#10+
      '      cast(:CAUSE as INTEGER),                                '#13#10+
      '      cast(:NOTE as VARCHAR(255)),                            '#13#10+
      '      dn.OPERDATE                                             '#13#10+
      '      , :KOD_DK                                               '#13#10+
      'from doc_nakl dn                                              '#13#10+
      '  WHERE dn.RECID = :RECID                                     '#13#10+
      '    and dn.BASEID = :BASEID;                                  ';
    qr.ParamByName('RECID').asInteger := aRECID;
    qr.ParamByName('BASEID').asInteger := aBASEID;
    if aKodDk<>0 then
       qr.ParamByName('KOD_DK').AsFloat := aKodDk
    else
       qr.ParamByName('KOD_DK').AsVariant := null;
    if VarIsNull(edReturnCauseId.EditValue) then
      raise Exception.Create('Необходимо указать причину возврата!');

    qr.ParamByName('CAUSE').asInteger := edReturnCauseId.EditValue;
    qr.ParamByName('NOTE').asString := edNotes.Text;
    qr.ExecQuery;
    qr.Close;
    qr.transaction.CommitRetaining;
  except
    on E:Exception do
    begin
      MessageDlg('Возникли ошибки при проставлении причин возвратов!'#13#10+
                 'Необходимо зайти в "Аналитика" - "Контроль возвратов"'#13#10+
                 'и указать причины вручную'#13#10+#13#10+
                 'текст ошибки:'+e.Message, mtError, [mbOk], 0);
    end;

  end


end;

procedure TfmReturnsMake.btnFilterOnlyWithCountsClick(Sender: TObject);
begin
  FilterOnlyWithCount := not FilterOnlyWithCount;

  SetFilter;
end;

procedure TfmReturnsMake.cdsMainBeforePost(DataSet: TDataSet);
begin
  if IntfMegaAccessManager.GetUserName = 'PETC_O' then
    exit;

  if cdsMainKOLICH_MY.AsFloat <> 0 then
  begin
  
    // контролирую, чтобы количество в возврате не превышало количество в накладной
    if cdsMainKOLICH.AsFloat < cdsMainKOLICH_MY.AsFloat then
    begin
      MessageDlg('Количество в возврате не должно превышать'#13#10+
                 'количество в расходной накладной', mtInformation, [mbOk], 0 );
      if not (cdsMain.State in [dsEdit,dsInsert]) then
        cdsMain.Edit;
      cdsMainKOLICH_MY.AsFloat := cdsMainKOLICH.AsFloat;
    end;
    
    // контролирую, чтобы количество в возврате было больше 0
    if cdsMainKOLICH_MY.AsFloat < 0 then
    begin
      MessageDlg('Количество в возврате не может быть отрицательным', mtInformation, [mbOk], 0 );
      if not (cdsMain.State in [dsEdit,dsInsert]) then
        cdsMain.Edit;
      cdsMainKOLICH_MY.AsFloat := 0;
    end;
    
  end;
end;

procedure TfmReturnsMake.cdsMainCalcFields(DataSet: TDataSet);
begin
  // колькулирую общую сумму в возвратной накладной
  cdsMainSUMMA_MY.AsFloat := cdsMainKOLICH_MY.AsFloat * cdsMainPRICE.AsFloat;
end;

procedure TfmReturnsMake.chbReturnsControlClick(Sender: TObject);
begin
  qr.Close;
  qr.SQL.Text := 'SELECT * FROM SET_PARAM_RETURNS_POS_CONTROL(:APARAMVALUE)';
  if chbReturnsControl.checked then
    qr.ParamByName('APARAMVALUE').AsInteger := 1
   else
    qr.ParamByName('APARAMVALUE').AsInteger := 0;
  qr.ExecQuery;
  qr.Close;
  qr.Transaction.CommitRetaining;
end;

procedure TfmReturnsMake.btnOtlozLoadClick(Sender: TObject);
const
  sqlSelect =
    'SELECT KOLICH               '#13#10+
    'FROM RETURNS_MAKE           '#13#10+
    'WHERE RECID = :RECID        '#13#10+
    '  and BASEID = :BASEID      '#13#10+
    '  and SCHET   = :SCHET      '#13#10+
    '  and KOD_MATER = :KOD_MATER';
var
  lbm: TBookMarkStr;
begin
  lbm:= cdsMain.Bookmark;
  cdsMain.First;
  while not cdsMain.Eof do
  begin
    qr.SQL.Text := sqlSelect;
    qr.ParamByName('RECID').AsInteger  := cdsMainRECID.AsInteger;
    qr.ParamByName('BASEID').AsInteger := cdsMainBaseID.AsInteger;
    qr.ParamByName('SCHET').AsString   := cdsMainSCHET.AsString;
    qr.ParamByName('KOD_MATER').AsFloat:= cdsMainKOD_MATER.AsInteger;
    qr.ExecQuery;
    if (not qr.FN('KOLICH').IsNull) and
       (qr.FN('KOLICH').AsInteger <> 0) then
    begin
      cdsMain.Edit;
      cdsMainKOLICH_MY.AsInteger := qr.FN('KOLICH').AsInteger;
      cdsMain.Post;
    end;
    qr.Close;

    cdsMain.Next;
  end;
  cdsMain.Bookmark:= lbm;
  MessageDlg('Возврат загружен.',mtInformation,[mbOk],0);
  ReturnIsLoadedFromTable := true;

end;

procedure TfmReturnsMake.btnOtlozSaveClick(Sender: TObject);
const
  sqlDeleteOLD =
    'DELETE FROM RETURNS_MAKE                '#13#10+
    'WHERE DATE_SAVE < ADDMONTH(''TODAY'',-1)';
  sqlInsert =
    'INSERT INTO RETURNS_MAKE ( RECID, BASEID, SCHET, KOD_MATER, KOLICH)'#13#10+
    'VALUES ( :RECID, :BASEID, :SCHET, :KOD_MATER, :KOLICH)             ';
  sqlDelete =
    'DELETE FROM RETURNS_MAKE    '#13#10+
    'WHERE RECID = :RECID        '#13#10+
    '  and BASEID = :BASEID      '#13#10+
    '  and SCHET   = :SCHET      '#13#10+
    '  and KOD_MATER = :KOD_MATER';
var
  lbm: TBookMarkStr;
begin
  lbm:= cdsMain.Bookmark;
  qr.Close;
  qr.SQL.Text := sqlDeleteOLD;
  qr.ExecQuery;
  qr.Close;

  cdsMain.First;
  while not cdsMain.Eof do
  begin
    qr.SQL.Text := sqlDelete;
    qr.ParamByName('RECID').AsInteger  := cdsMainRECID.AsInteger;
    qr.ParamByName('BASEID').AsInteger := cdsMainBaseID.AsInteger;
    qr.ParamByName('SCHET').AsString   := cdsMainSCHET.AsString;
    qr.ParamByName('KOD_MATER').AsFloat:= cdsMainKOD_MATER.AsInteger;
    qr.ExecQuery;
    qr.Close;

    if cdsMainKOLICH_MY.AsInteger > 0 then
    begin
      qr.SQL.Text := sqlInsert;
      qr.ParamByName('RECID').AsInteger  := cdsMainRECID.AsInteger;
      qr.ParamByName('BASEID').AsInteger := cdsMainBaseID.AsInteger;
      qr.ParamByName('SCHET').AsString   := cdsMainSCHET.AsString;
      qr.ParamByName('KOD_MATER').AsFloat:= cdsMainKOD_MATER.AsInteger;
      qr.ParamByName('KOLICH').AsInteger := cdsMainKOLICH_MY.AsInteger;
      qr.ExecQuery;
      qr.Close;
    end;

    cdsMain.Next;
  end;
  qr.Transaction.CommitRetaining;
  cdsMain.Bookmark:= lbm;
  MessageDlg('Возврат отложен.',mtInformation,[mbOk],0);
end;

{procedure TfmReturnsMake.cxButton2Click(Sender: TObject);
begin
if IntfMegaDBCommon.GetCountry = iccRussia then
begin

   chbBoy.Visible:=False;
   chbPodotchet.Visible:=False;
   chbChangePriceOper.Visible:=False;
   edReturnTypeId.Visible:=True;
   edExperitorDK.Visible:=True;
   edPerevDK.Visible:=True;
   actCreateNewNaklExecuteNew(Sender);
  end
  else
    begin
      chbBoy.Visible:=True;
      chbPodotchet.Visible:=True;
      chbChangePriceOper.Visible:=True;
      edReturnTypeId.Visible:=False;
      edExperitorDK.Visible:=False;
      edPerevDK.Visible:=False;
      actCreateNewNaklExecute(Sender);
    end;
end;}
procedure TfmReturnsMake.edPerevDKPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
if KOD_PER_DK <> 0 then
    mPerevDK.KodDK:= KOD_PER_DK;
  if mPerevDK.ExecuteAsControlPopUp(edPerevDK) then
    begin
      KOD_PER_DK:= mPerevDK.KodDK;
      updateDKPerevName;
    end;
  self.Activate;

end;
procedure TfmReturnsMake.edReturnTypeIdPropertiesChange(Sender: TObject);
const
  sGetKODPer= 'select dtn.dk_to'#13#10+
              'from doc_trans_nakl_pos dtnp'#13#10+
              'inner join  doc_trans_nakl dtn on (dtn.recid = dtnp.docrecno and  dtn.baseid = dtnp.baseid)'#13#10+
              'where dtnp.nakl_recid = :PARENT_RECID and dtnp.nakl_baseid = :PARENT_BASEID;';

begin
  if (edReturnTypeId.EditValue=12) THEN
   begin
     cdsMain.First;
     if  not cdsMain.Eof then
       begin
         qr.Close;
         qr.SQL.Text:= sGetKODPer;
         qr.ParamByName('PARENT_RECID').AsInteger := cdsMainRECID.AsInteger;
         qr.ParamByName('PARENT_BASEID').AsInteger := cdsMainBaseID.AsInteger;
         qr.ExecQuery;
         KOD_PER_DK  := qr.FieldByName('dk_to').AsFloat;
       end;
      if KOD_PER_DK <> 0 then
         mPerevDK.KodDK:= KOD_PER_DK;
         KOD_PER_DK:=0;
      if mPerevDK.ExecuteAsControlPopUp(edPerevDK) then
        begin
          KOD_PER_DK:= mPerevDK.KodDK;
          updateDKPerevName;
        end;
      self.Activate;
    end;
  qrCauseSpravType.Filtered:= false;
  qrCauseSpravType.Filter:= ' typeid=' + VarToStr(edReturnTypeId.EditValue);
  qrCauseSpravType.Filtered:= true;
  if (qrCauseSpravType.FieldByName('IS_SEL_BALANCE').AsInteger = 1) then
   MegaselBalance1.visible:= true
  else
   MegaselBalance1.visible:= false;
  qrCauseSpravType.Filtered:= false;
  qrCauseSpravType.Filter:= '' ;
end;

procedure TfmReturnsMake.edSelDKEnter(Sender: TObject);
begin
if KOD_DK = 0 then
  begin
    cxButtonEdit1PropertiesButtonClick1(Self,0);
  end;
end;

procedure TfmReturnsMake.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 if KOD_EXP_DK <> 0 then
    mExpeditorDK.KodDK:= KOD_EXP_DK;
  if mExpeditorDK.ExecuteAsControlPopUp(edExperitorDK) then
    begin
      KOD_EXP_DK := mExpeditorDK.KodDK;
      updateDKExpName;
    end;
  self.Activate;
end;

procedure TfmReturnsMake.cxButtonEdit1PropertiesButtonClick1(Sender: TObject;AButtonIndex: Integer);
begin
  if KOD_DK <> 0 then
    mSelDK.KodDK:= KOD_DK;
  if mSelDK.ExecuteAsControlPopUp(edSelDK) then
    begin
      KOD_DK := mselDK.KodDK;
      updateDKName;
    end;
  self.Activate;
end;

procedure TfmReturnsMake.cxViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DELETE then
  begin
  if not (cdsMain.State in [dsEdit,dsInsert]) then
    cdsMain.Edit;
    cdsMainKOLICH_MY.Asinteger := 0;
    cdsMain.Post;
    Key := 0;
    keybd_event( VK_DOWN,  VK_DOWN, KEYEVENTF_EXTENDEDKEY OR 0, 0 );
    keybd_event( VK_DOWN,  VK_DOWN, KEYEVENTF_EXTENDEDKEY OR KEYEVENTF_KEYUP, 0);
  end;
  if Key=VK_RETURN then
  begin
  if not (cdsMain.State in [dsEdit,dsInsert]) then
    cdsMain.Edit;
    cdsMainKOLICH_MY.Asinteger := cdsMainKOLICH.Asinteger;
    cdsMain.Post;
    Key := 0;
    // переходим на след. строку 
    keybd_event( VK_DOWN,  VK_DOWN, KEYEVENTF_EXTENDEDKEY OR 0, 0 );
    keybd_event( VK_DOWN,  VK_DOWN, KEYEVENTF_EXTENDEDKEY OR KEYEVENTF_KEYUP, 0);
  end;
end;

procedure TfmReturnsMake.edFilterMaterNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_RETURN then
  begin
    // фильтр по номеру накладной
    if edFilterMaterName.Text<>'' then
      FilterMater := edFilterMaterName.Text
     else
      FilterMater := '';

    SetFilter;
  end;
end;

procedure TfmReturnsMake.edFilterNaklNumberKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
  begin
    // фильтр по номеру накладной
    if edFilterNaklNumber.Text<>'' then
      FilterNum := edFilterNaklNumber.Text
     else
      FilterNum := '';

    SetFilter;
  end;
end;



procedure TfmReturnsMake.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfmReturnsMake.FormCreate(Sender: TObject);
begin
  edNaklDate.Date := Date;
  cxViewREGID_FORM_A.Visible:=IsRussia;
  cxViewREGID_FORM_B.Visible:=IsRussia;
end;

procedure TfmReturnsMake.CreateCDS;
begin
  // очистка сдс-ки
  cdsMain.DisableControls;

  if cdsMain.Active then
    cdsMain.EmptyDataSet;
  cdsMain.Close;
  cdsMain.CreateDataSet;

  cdsMain.Active := true;
end;

procedure TfmReturnsMake.LoadCDS;
const
  sSQL =
'    SELECT                                                                                                                       '#13#10+
'      dn.RECID,                                                                                                                  '#13#10+
'      dn.BASEID,                                                                                                                 '#13#10+
'      dn.OPERDATE,                                                                                                               '#13#10+
'      dn.DOCTYPE,                                                                                                                '#13#10+
'      dn.DOCNUMBER,                                                                                                              '#13#10+
'       dn.KOD_OPER,                                                                                                               '#13#10+
'       dn.GROUP_OPER,                                                                                                                '#13#10+
'      sm.KOD_MATER,                                                                                                              '#13#10+
'      sm.NAME_MATER,                                                                                                             '#13#10+
'      sm.KOD_EAN,                                                                                                             '#13#10+
'      sda.ADDRESS,                                                                                                               '#13#10+
'      (SELECT first 1 oj.KREDIT FROM OPER_JORNAL oj                                                                              '#13#10+
'        WHERE oj.DOCRECNO=dn.RECID                                                                                               '#13#10+
'          and oj.BASEID = dn.BASEID                                                                                              '#13#10+
'          and oj.FORMTYPE=1                                                                                                      '#13#10+
'          and oj.SUBDOCRECNO=dnp.RECID ) SCHET,                                                                                  '#13#10+
{'      ( CASE WHEN EXISTS (                                                                                                       '#13#10+
'          SELECT * from sprav_komis sk                                                                                           '#13#10+
'          where sk.KOD_MATER = sm.KOD_MATER)  and            '+
'   not (select kod_dk from GET_KOMIS_DK(sm.KOD_MATER,5,''today'',77,DN.CFO) )is NULL                                                                                         '#13#10+
'              THEN 1 ELSE 0 END ) IS_KOMISS_MATER,                                                                               '#13#10+}
'      (select result from CHECK_KOMIS_MATER(sm.KOD_MATER,5,''today'',77,dn.cfo)) IS_KOMISS_MATER,  '#13#10+
'      sum(dnp.KOLICH) KOLICH,                                                                                                    '#13#10+
'      sum(dnp.SUMMA)SUMMA,                                                                                                       '#13#10+
'      sum( case when sb.NDSINSUMMA = 0 then                                                                                      '#13#10+
'           dnp.SUMMA1*(1 + dn.NACENKA_/100)*(1+spdvgr.PDVGROUP_STAVKA/100)                                                       '#13#10+
'           else dnp.SUMMA1*(1 + dn.NACENKA_/100) end )SUMMA_PDV                                                                  '#13#10+
'           ,dn.balance_kod                                                                                                        '#13#10+
'           ,dnp.date_rozliva  DATE_ROZLIVA                                                                                       '#13#10+
'          ,dnp.invoce_number,ap.REGID_FORM_A, ap.REGID_FORM_B                                                                    '#13#10+
'    FROM doc_nakl dn                                                                                                             '#13#10+
'     LEFT JOIN SPRAV_BALANCE sb ON sb.BALANCE_KOD = dn.BALANCE_KOD                                                               '#13#10+
'     LEFT JOIN doc_nakl_pos dnp on dnp.docrecno=dn.recid and dnp.baseid=dn.baseid                                                '#13#10+
'     left join DOC_NAKL_POS_ADD_PROP ap on ap.RECID=dnp.recid and ap.BASEID=dnp.baseid and ap.kod_mater=dnp.kod_mater          '#13#10+
'     LEFT JOIN GET_PDV_STAVKA_BALANCE(dn.balance_kod, dn.operdate,dnp.PDV)  spdvgr on 1=1                                                         '#13#10+
'                                                                                                                                 '#13#10+
'      LEFT JOIN sprav_mater sm on sm.KOD_MATER = dnp.KOD_MATER                                                                   '#13#10+
'       LEFT JOIN delivery_location dl on dl.docrecno = dn.recid and dl.baseid = dn.baseid and dl.formtype = 1                    '#13#10+
'       LEFT JOIN sprav_trade_outlet sto on sto.recid = dl.outlet_recid and sto.baseid = dl.outlet_baseid                         '#13#10+
'       LEFT JOIN sprav_dk_address sda on (sda.recid = sto.addr_recid and sda.baseid = sto.addr_baseid)                           '#13#10+
'       LEFT JOIN sprav_nas_p snp on (snp.nas_p_id = sda.nas_p_id and snp.country_id = sda.country_id)                            '#13#10+
'                                                                                                                                 '#13#10+
'    where coalesce(dnp.KOLICH,0) > 0                                                                                             '#13#10+
'      /*CheckProv1*/                                                                                                             '#13#10+
'      and dn.BALANCE_KOD = :BALANCE_KOD                                                                                          '#13#10+
'      and (dn.DK_TO = :KOD_DK OR dn.DK_TO = (SELECT first 1 sdk_sub.PARENT from sprav_dk sdk_sub where sdk_sub.KOD_DK = :KOD_DK))'#13#10+
'      /*CheckDate*/                                                                                                              '#13#10+
'      /*CheckTT*/                                                                                                                '#13#10+
'    group by dn.RECID, dn.BASEID, dn.operdate,                                                                                   '#13#10+
'      dn.docnumber, dn.doctype, dnp.RECID,                                                                                       '#13#10+
'      sm.KOD_MATER, sm.NAME_MATER,sm.KOD_EAN, sda.ADDRESS , DN.CFO, dn.balance_kod,dn.KOD_OPER,dn.GROUP_OPER                     '#13#10+
'          , dnp.date_rozliva  ,dnp.invoce_number,ap.REGID_FORM_A, ap.REGID_FORM_B                                                '#13#10+
'                                                                                                                                 '#13#10+
'    UNION ALL                                                                                                                    '#13#10+
'                                                                                                                                 '#13#10+
'    SELECT                                                                                                                       '#13#10+
'      dn.RECID,                                                                                                                  '#13#10+
'      dn.BASEID,                                                                                                                 '#13#10+
'      dn.operdate,                                                                                                               '#13#10+
'      dn.doctype,                                                                                                                '#13#10+
'      dn.docnumber,                                                                                                              '#13#10+
'       dn.KOD_OPER,                                                                                                               '#13#10+
'       dn.GROUP_OPER,                                                                                                                '#13#10+
'      sm.KOD_MATER,                                                                                                              '#13#10+
'      sm.NAME_MATER,                                                                                                             '#13#10+
'      sm.KOD_EAN,                                                                                                                '#13#10+
'      sda.ADDRESS,                                                                                                               '#13#10+
'      (SELECT first 1 oj.KREDIT FROM OPER_JORNAL oj                                                                              '#13#10+
'        WHERE oj.DOCRECNO=dn_ret.RECID                                                                                           '#13#10+
'          and oj.BASEID = dn_ret.BASEID                                                                                          '#13#10+
'          and oj.FORMTYPE=1                                                                                                      '#13#10+
'          and oj.SUBDOCRECNO=dnp.RECID ) SCHET ,                                                                                 '#13#10+
{'      ( CASE WHEN EXISTS (                                                                                                       '#13#10+
'          SELECT * from sprav_komis sk                                                                                           '#13#10+
'          where sk.KOD_MATER = sm.KOD_MATER) and            '+
'   not (select kod_dk from GET_KOMIS_DK(sm.KOD_MATER,5,''today'',77,DN.CFO) )is NULL                                                 '#13#10+
'              THEN 1 ELSE 0 END ) IS_KOMISS_MATER,                                                                               '#13#10+}
'      (select result from CHECK_KOMIS_MATER(sm.KOD_MATER,5,''today'',77,dn.cfo)) IS_KOMISS_MATER,  '#13#10+
'      -sum(dnp.KOLICH)KOLICH,                                                                                                    '#13#10+
'      -sum(dnp.SUMMA)SUMMA,                                                                                                      '#13#10+
'      -sum( case when sb.NDSINSUMMA = 0 then                                                                                     '#13#10+
'           dnp.SUMMA1*(1 + dn_ret.NACENKA_/100)*(1+spdvgr.PDVGROUP_STAVKA/100)                                                   '#13#10+
'           else dnp.SUMMA1*(1 + dn_ret.NACENKA_/100) end )  SUMMA_PDV                                                            '#13#10+
'           ,dn.balance_kod                                                                                                       '#13#10+
'          ,dnp.date_rozliva  DATE_ROZLIVA                                                                                        '#13#10+
'          ,dnp.invoce_number,ap.REGID_FORM_A, ap.REGID_FORM_B                                                                    '#13#10+
'    FROM doc_nakl dn                                                                                                             '#13#10+
'      LEFT JOIN LINK_DOC_OPL opl on opl.PARENT_RECID=dn.RECID  and opl.PARENT_BASEID=dn.BASEID and opl.opl_form_type=1           '#13#10+
'      LEFT JOIN doc_nakl dn_ret on dn_ret.RECID=opl.OPL_RECID and dn_ret.baseid=opl.OPL_BASEID                                   '#13#10+
'      LEFT JOIN SPRAV_OPER so on so.GROUP_OPER=dn_ret.GROUP_OPER and so.KOD_OPER=dn_ret.KOD_OPER                                 '#13#10+
'      LEFT JOIN SPRAV_BALANCE sb ON sb.BALANCE_KOD = dn_ret.BALANCE_KOD                                                          '#13#10+
'       LEFT JOIN doc_nakl_pos dnp on dnp.DOCRECNO=opl.OPL_RECID and dnp.baseid=opl.OPL_BASEID                                    '#13#10+
'       left join DOC_NAKL_POS_ADD_PROP ap on ap.RECID=dnp.recid and ap.BASEID=dnp.baseid and ap.kod_mater=dnp.kod_mater          '#13#10+
'       LEFT JOIN GET_PDV_STAVKA_BALANCE(dn.balance_kod, dn.operdate,dnp.PDV)  spdvgr on 1=1                                      '#13#10+
'                                                                                                                                 '#13#10+
'       LEFT JOIN sprav_mater sm on sm.KOD_MATER = dnp.KOD_MATER                                                                  '#13#10+
'        LEFT JOIN delivery_location dl on dl.docrecno = dn.recid and dl.baseid = dn.baseid and dl.formtype = 1                   '#13#10+
'        LEFT JOIN sprav_trade_outlet sto on sto.recid = dl.outlet_recid and sto.baseid = dl.outlet_baseid                        '#13#10+
'        left join sprav_dk_address sda on (sda.recid = sto.addr_recid and sda.baseid = sto.addr_baseid)                          '#13#10+
'        left join sprav_nas_p snp on (snp.nas_p_id = sda.nas_p_id and snp.country_id = sda.country_id)                           '#13#10+
'                                                                                                                                 '#13#10+
'    where coalesce(dnp.KOLICH,0) > 0                                                                                             '#13#10+
'      /*CheckProv2*/                                                                                                             '#13#10+
'      and so.STATUS = 2 /* табличка sprav_oper_status - возврат от покупателя */                                                 '#13#10+
'      and dn.BALANCE_KOD = :BALANCE_KOD                                                                                          '#13#10+
'      and (dn.DK_TO = :KOD_DK OR dn.DK_TO = (SELECT first 1 sdk_sub.PARENT from sprav_dk sdk_sub where sdk_sub.KOD_DK = :KOD_DK))'#13#10+
'      /*CheckDate*/                                                                                                              '#13#10+
'      /*CheckTT*/                                                                                                                '#13#10+
'    group by dn.RECID, dn.BASEID,                                                                                                '#13#10+
'      dn.operdate, dn.docnumber, dn.doctype,                                                                                     '#13#10+
'      dn_ret.RECID, dn_ret.BASEID, dnp.RECID,                                                                                    '#13#10+
'      sm.KOD_MATER, sm.NAME_MATER,sm.KOD_EAN, sda.ADDRESS  , DN.CFO, dn.balance_kod,dn.KOD_OPER,dn.GROUP_OPER                    '#13#10+
'      , dnp.date_rozliva  ,dnp.invoce_number,ap.REGID_FORM_A, ap.REGID_FORM_B  ';

  sCheckProv1 =
' and (SELECT first 1 STATUS FROM CHECK_PROV_NAKL(1,dn.RECID, dn.BASEID)) = 1  '#13#10;
  sCheckProv2 =
' and (SELECT first 1 STATUS FROM CHECK_PROV_NAKL(1,dn_ret.RECID, dn_ret.BASEID)) = 1  '#13#10;

  sSQLWhereDate =
'      and dn.OPERDATE BETWEEN :DATE_FROM and :DATE_TILL               '#13#10;
  sSQLWhereTT =
'      and sto.RECID = :TT_RECID and sto.BASEID = :TT_BASEID           '#13#10;


var
  SQLText : string;
  TTArr : array of Variant;
  aLockate : boolean;
  aSCHET : string;
begin
  // переношу данные в сдс-ку
  qrMain.Close;

  SQLText := sSQL;

  // фильтр по дате
  SQLText := ReplaceStr(SQLText, '/*CheckDate*/', sSQLWhereDate);;

  // фильтр по ТТ
  if not VarIsNull(cmbTT.EditValue) then
  begin
    TTArr := cmbTT.EditValue;
    if (not VarIsNull(TTArr[0]))and(not VarIsNull(TTArr[1])) then
    begin
      SQLText := ReplaceStr(SQLText, '/*CheckTT*/', sSQLWhereTT);;
    end;
  end;

  // как бы и хорошо так сделать, но это не обязательно и добавляет тормоза
  if false then
    begin
      SQLText := ReplaceStr(SQLText, '/*CheckProv1*/', sCheckProv1);
      SQLText := ReplaceStr(SQLText, '/*CheckProv2*/', sCheckProv2);
    end;

  qrMain.SQL.Text := SQLText;

  // параметры
  try
  qrMain.ParamByName('BALANCE_KOD').AsInteger := StrToInt(SelBalance.Value);
  except
    MessageDlg('Необходимо указать баланс!',mtError,[mbOk],0);
    Exit;
  end;
  qrMain.ParamByName('KOD_DK').AsFloat := KOD_DK;
//  qrMain.ParamByName('MAIN_FIRM_DK').AsFloat := IntfMegaCommon.GetMainFirmDK;

  // фильтр по дате
  if true then
  begin
    qrMain.ParamByName('DATE_FROM').AsDate := SelPeriod.FromDate;
    qrMain.ParamByName('DATE_TILL').AsDate := SelPeriod.TillDate;
  end;
  // фильтр по ТТ
  if not VarIsNull(cmbTT.EditValue) then
  begin
    TTArr := cmbTT.EditValue;
    if (not VarIsNull(TTArr[0]))and(not VarIsNull(TTArr[1])) then
    begin
      qrMain.ParamByName('TT_RECID').AsInteger := TTArr[0];
      qrMain.ParamByName('TT_BASEID').AsInteger := TTArr[1];
    end;
  end;


  qrMain.ExecQuery;
//  qrMain.First;

  while not qrMain.Eof do
  begin

    // для 300-го берем только длг300-документы
    if (StrToInt(SelBalance.Value) = IntfMegaCommon.GetPPBalance) and
       (qrMain.FieldbyName('DOCTYPE').AsString <> 'длг300')then
    begin
      qrMain.Next;
      continue;
    end;

    // для 300-го боя не анализируем с какогосчета был возврат
    if (StrToInt(SelBalance.Value) = IntfMegaCommon.GetPPBalance) then
      aSCHET := '41/10'
     else
      try
        aSCHET := qrMain.FieldByName('SCHET').Value;
      except
        aSCHET := '';
      end;

   if(qrMain.FieldByName('SCHET').Value = '261/7') then
      aSCHET := '261/1';
   if(qrMain.FieldByName('SCHET').Value = '281/7') then
      aSCHET := '281/1';
   if(qrMain.FieldByName('SCHET').Value = '261/1') then
      aSCHET := '261/7';
   if(qrMain.FieldByName('SCHET').Value = '281/1') then
      aSCHET := '281/7';

    {aLockate := cdsMain.Locate('RECID;BASEID;KOD_MATER;SCHET',
       VarArrayOf([qrMain.FieldbyName('RECID').Value,
                   qrMain.FieldbyName('BASEID').Value,
                   qrMain.FieldbyName('KOD_MATER').Value,
                   aSCHET
                   ]), []);
     }
     if IntfMegaDBCommon.GetCountry = iccRussia then
        aLockate := cdsMain.Locate('DOCNUMBER;KOD_MATER;SCHET;DATE_ROZLIVA;INVOCE_NUMBER;REGID_FORM_A;REGID_FORM_B',
       VarArrayOf([qrMain.FieldbyName('DOCNUMBER').Value,
                   qrMain.FieldbyName('KOD_MATER').Value,
                   aSCHET,
                   qrMain.FieldbyName('DATE_ROZLIVA').Value,
                   qrMain.FieldbyName('INVOCE_NUMBER').Value,
                   qrMain.FieldbyName('REGID_FORM_A').Value,
                   qrMain.FieldbyName('REGID_FORM_B').Value
                   ]), [])
     else
      aLockate := cdsMain.Locate('DOCNUMBER;KOD_MATER;SCHET',
       VarArrayOf([qrMain.FieldbyName('DOCNUMBER').Value,
                   qrMain.FieldbyName('KOD_MATER').Value,
                   aSCHET
                   ]), []);
    if aLockate then
      begin
        cdsMain.Edit;
        cdsMainKOLICH.AsFloat := cdsMainKOLICH.AsFloat + qrMain.FieldByName('KOLICH').AsFloat;
        cdsMain.Post;

        if abs(cdsMainKOLICH.AsFloat) < 0.01 then
          cdsMain.Delete;
      end
     else
      begin
        cdsMain.Insert;
        cdsMainRECID.AsInteger     := qrMain.FieldByName('RECID').AsInteger;
        cdsMainBaseID.AsInteger    := qrMain.FieldByName('BASEID').AsInteger;
        cdsMainOPERDATE.AsDateTime := qrMain.FieldByName('OPERDATE').AsDateTime;
        cdsMainDOCTYPE.AsString    := qrMain.FieldByName('DOCTYPE').AsString;
        cdsMainDOCNUMBER.AsInteger := qrMain.FieldByName('DOCNUMBER').AsInteger;
        cdsMainKOD_MATER.AsFloat   := qrMain.FieldByName('KOD_MATER').AsFloat;
        cdsMainKOD_EAN.AsFloat     := qrMain.FieldByName('KOD_EAN').AsFloat;
        cdsMainIS_KOMISS_MATER.asInteger := qrMain.FieldByName('IS_KOMISS_MATER').asInteger;
        cdsMainNAME_MATER.AsString := qrMain.FieldByName('NAME_MATER').AsString;
        cdsMainADDRESS.AsString    := qrMain.FieldByName('ADDRESS').AsString;
        cdsMainSCHET.AsString      := qrMain.FieldByName('SCHET').AsString;  //aSCHET;
        cdsMainKOLICH.AsFloat      := qrMain.FieldByName('KOLICH').AsFloat;
        cdsMainPRICE.AsFloat       := qrMain.FieldByName('SUMMA').AsFloat /qrMain.FieldByName('KOLICH').AsFloat;
        cdsMainPRICE_PDV.AsFloat   := qrMain.FieldByName('SUMMA_PDV').AsFloat/qrMain.FieldByName('KOLICH').AsFloat;
        cdsMainBALANCE_KOD.AsInteger   := qrMain.FieldByName('BALANCE_KOD').asInteger;
        cdsMainKOD_OPER.AsInteger      := qrMain.FieldByName('KOD_OPER').asInteger;
        cdsMainGROUP_OPER.AsInteger    := qrMain.FieldByName('GROUP_OPER').asInteger;
        if not qrMain.FieldByName('DATE_ROZLIVA').IsNull then
           cdsMainDATE_ROZLIVA.AsDateTime := qrMain.FieldByName('DATE_ROZLIVA').AsDateTime;
        cdsMainINVOCE_NUMBER.AsString    := qrMain.FieldByName('INVOCE_NUMBER').AsString;
        cdsMainREGID_FORM_A.AsString     := qrMain.FieldByName('REGID_FORM_A').AsString;
        cdsMainREGID_FORM_B.AsString     := qrMain.FieldByName('REGID_FORM_B').AsString;
        cdsMain.Post;
      end;

    qrMain.Next;
  end;

//  qrMain.Close;
end;

procedure TfmReturnsMake.LoadGrid;
begin
  actClearFilter.Execute;

  // загружаю грид
  cdsMain.EnableControls;

  btnOtlozLoad.Enabled := true;
  btnOtlozSave.Enabled := true;
end;

procedure TfmReturnsMake.miOpenLinkDocsClick(Sender: TObject);
begin
  ShowLinkedDocs(cdsMainRECID.AsInteger,cdsMainBaseID.AsInteger, idvNakl);
end;

procedure TfmReturnsMake.miOpenNaklClick(Sender: TObject);
begin
  OpenDocument(self, cdsMainDOCTYPE.AsString,
               cdsMainRECID.AsInteger,cdsMainBaseID.AsInteger,
               cdsMainOPERDATE.AsDateTime);
end;

procedure TfmReturnsMake.SelBalanceChange(Sender: TObject);
begin
  // корректирующая накладная видна только для 77- баланса
  chbPrintKorNN.Visible := (StrToInt(SelBalance.Value) = IntfMegaCommon.GetMainFirmBalanceKod);
  chbPrintPriemAct.Visible := (StrToInt(SelBalance.Value) = IntfMegaCommon.GetMainFirmBalanceKod);
end;

procedure TfmReturnsMake.SetFilter;
var
  sFilterExp : string;
  col:TcxGridDBBandedColumn;
  i : integer;

  procedure AddFilter;
  var
    sFilter : string;
  begin
    sFilter:=col.DataBinding.FieldName+' like ''%'+sFilterExp+'%''';
    if StrPos(PChar(lowercase(cxView.DataController.Filter.FilterText)),
              PChar(lowercase(sFilter)))=nil then
      with cxView.DataController.Filter do
      begin
        Options:=[fcoCaseInsensitive];
        if sFilterExp<>'' then
          root.AddItem(col, foLike, '%'+sFilterExp+'%',
                       ''''+sFilterExp+'''');
        Active:=true;
      end;
  end;

begin
  try
  cxView.DataController.Filter.BeginUpdate;
  cxView.DataController.Filter.Root.Clear;

  // фильтр по номеру накладной
  col:=cxViewDOCNUMBER;
  sFilterExp := FilterNum;
  AddFilter;

  // фильтр по наименованию
  col:=cxViewNAME_MATER;
  sFilterExp := FilterMater;
  AddFilter;

  if FilterOnlyWithCount then
   with cxView.DataController.Filter do
    begin
      Options:=[fcoCaseInsensitive];
      root.AddItem(cxViewKOLICH_MY, foGreater, '0',
                     'Показать с цифрами');
      Active:=true;
    end;

  finally
  cxView.DataController.Filter.EndUpdate;
  end;

  cxGrid.SetFocus;
  cxViewKOLICH_MY.FocusWithSelection;

  // переводим курсор на первую запись и ставим на редактирование колонку с количеством
  // рогатенько конечно:)), но как по другому такое сделать не нашел, уж слишком этот cxGrid хитро-вы@@@@ый
  for I := 0 to 10 do
  begin
    keybd_event( VK_UP,  VK_UP, KEYEVENTF_EXTENDEDKEY OR 0, 0 );
    keybd_event( VK_UP,  VK_UP, KEYEVENTF_EXTENDEDKEY OR KEYEVENTF_KEYUP, 0);
  end;
  keybd_event( VK_SPACE, VK_SPACE, KEYEVENTF_EXTENDEDKEY OR 0, 0 );
  keybd_event( VK_SPACE, VK_SPACE, KEYEVENTF_EXTENDEDKEY OR KEYEVENTF_KEYUP, 0);


end;
procedure TfmReturnsMake.updateDKPerevName;
begin
  qr.Close;
  qr.SQL.Text := 'SELECT SHORTNAME_DK NAME  FROM sprav_dk  WHERE KOD_DK = :KOD_DK';
  qr.ParamByName('KOD_DK').AsFloat := KOD_PER_DK;
  qr.ExecQuery;
  edPerevDK.Text := qr.FieldByName('NAME').AsString;
  qr.Close;


end;
procedure TfmReturnsMake.updateDKExpName;
begin
  qr.Close;
  qr.SQL.Text := 'SELECT SHORTNAME_DK NAME  FROM sprav_dk  WHERE KOD_DK = :KOD_DK';
  qr.ParamByName('KOD_DK').AsFloat := KOD_EXP_DK;
  qr.ExecQuery;
  edExperitorDK.Text := qr.FieldByName('NAME').AsString;
  qr.Close;
  qrTTDK.Close;
  qrTTDK.ParamByName('KOD_DK').AsFloat := KOD_EXP_DK;
  qrTTDK.Open;

  cmbTTDK.EditValue := NULL;



end;
procedure TfmReturnsMake.updateDKName;
begin
  qr.Close;
  qr.SQL.Text := 'SELECT SHORTNAME_DK NAME  FROM sprav_dk  WHERE KOD_DK = :KOD_DK';
  qr.ParamByName('KOD_DK').AsFloat := KOD_DK;
  qr.ExecQuery;
  edSelDK.Text := qr.FieldByName('NAME').AsString;
  qr.Close;

  qrTT.Close;
  qrTT.ParamByName('KOD_DK').AsFloat := KOD_DK;
  qrTT.Open;

  cmbTT.EditValue := NULL;


end;

function isReturnNakl(aGROUP_OPER,aKOD_OPER: integer) : boolean;
const
  sSQLText =
    'SELECT so.STATUS               '#13#10+
    'FROM  SPRAV_OPER so            '#13#10+
    'WHERE so.GROUP_OPER=:GROUP_OPER'#13#10+
    '  AND so.KOD_OPER=:KOD_OPER    ';
begin
  // прверяю является ли накладная расходной
  DM.SharedQuery.Transaction.CommitRetaining;
  DM.SharedQuery.Close;
  DM.SharedQuery.SQL.Text := sSQLText;
  DM.SharedQuery.ParamByName('GROUP_OPER').AsInteger := aGROUP_OPER;
  DM.SharedQuery.ParamByName('KOD_OPER').AsInteger := aKOD_OPER;
  DM.SharedQuery.ExecQuery;

  Result := (not DM.SharedQuery.FN('STATUS').isNULL)
        and (DM.SharedQuery.FN('STATUS').AsInteger = 2);

  DM.SharedQuery.Transaction.CommitRetaining;
  DM.SharedQuery.Close;
end;

function isNeedCheckSaldoForReturn(aGROUP_OPER,aKOD_OPER: integer) : boolean;
begin
 {*пока контролирую только для этих, потом сделаю настр. табличку*}
 {92811001     77361000	От покупателя (ТОВ ТБ Мегаполіс)	на склад №1 ВОЗВРАТ (Цпд) ЧЕРЕЗ
  240001       77361000	От покупателя (ТОВ ТБ Мегаполіс)	на склад комисс.товара ВОЗВРАТ ЧЕРЕЗ (Цпд)
  240000       77361000	От покупателя (ТОВ ТБ Мегаполіс)	на склад комисс.товара ВОЗВРАТ (Цпд)
  92811000	   77361000	От покупателя (ТОВ ТБ Мегаполіс)	на склад №1 ВОЗВРАТ (Цпд)}
 {SELECT * FROM SPRAV_OPER
  WHERE (GROUP_OPER=77361000 and KOD_OPER=92811001)
     OR (GROUP_OPER=77361000 and KOD_OPER=92811000)
     OR (GROUP_OPER=77361000 and KOD_OPER=240000)
     OR (GROUP_OPER=77361000 and KOD_OPER=240001)  }
  result := (aGROUP_OPER = 77361000) and
    ((aKOD_OPER=92811001)or(aKOD_OPER=92811000)or(aKOD_OPER=240000)or(aKOD_OPER=240001) )
end;

function isReturnsControl : boolean;
const
  sSQLText =
    'SELECT PARAMVALUE                         '#13#10+
    'FROM SYS_BASE_PARAMS                      '#13#10+
    'WHERE PARAMNAME = ''RETURNS_POS_CONTROL'' ';
begin
  // прверяю есть ли на этом регионе контроль за возвратами
  // (параметр в sys_base_paramsax)
  DM.SharedQuery.Transaction.CommitRetaining;
  DM.SharedQuery.Close;
  DM.SharedQuery.SQL.Text := sSQLText;
  DM.SharedQuery.ExecQuery;

  Result := (not DM.SharedQuery.FN('PARAMVALUE').isNULL)
        and (DM.SharedQuery.FN('PARAMVALUE').AsInteger = 1);

  DM.SharedQuery.Transaction.CommitRetaining;
  DM.SharedQuery.Close;
end;

function CheckDKDolg(aRECID,aBASEID: integer; aBalance: integer; aSchet: string;
         aDatabase: TFIBDatabase; aTransaction: TFIBTransaction; aOwner:TComponent=nil;
         aKOD_DK:double = 0; aOPERDATE:TDate = 0 ) : double;
const
  sSQLNaklText =
    'SELECT dn.RECID, DN.BASEID, DN.OPERDATE,       '#13#10+
    '  DN.DOCTYPE, DN.DOCNUMBER, DN.DOCDATE,        '#13#10+
    '  DN.GROUP_OPER, DN.KOD_OPER,                  '#13#10+
    '  DN.DK_FROM, DN.DK_TO, DN.DK_C,               '#13#10+
    '  DN.KURS, DN.SUMMA, DN.SUMMA1, DN.KOLICH_,    '#13#10+
    '  DN.NOTES, DN.FORMAOPL_, DN.PRICETYPE_,       '#13#10+
    '  DN.BALANCE_KOD, DN.V, DN.V1, DN.NACENKA_,    '#13#10+
    '  DN.PRICE_FROM_VALYUTA, DN.STATE,             '#13#10+
    '  DN.TRIGGER_OFF, DN.OTSR, DN.TRANSPORT,       '#13#10+
    '  DN.CFO, DN.PRESENT, DN.SUFICS, DN.DOC_CREATE,'#13#10+
    '  DN.ADDR_FROM, DN.ADDR_TO, DN.NULL_F,         '#13#10+
    '  DN.DOC_CREATOR, DN.DOCNUMBER_STR,            '#13#10+
    '  DN.DATE_ACTUAL, DN.SOGL/*,                     '#13#10+
    '  (SELECT sum(dnp.SUMMA)                       '#13#10+
    '   FROM DOC_NAKL_POS dnp                       '#13#10+
    '   WHERE dnp.DOCRECNO = dn.RECID               '#13#10+
    '     and dnp.BASEID = dn.BASEID )SUMMA_POS*/     '#13#10+
    '  FROM DOC_NAKL dn                             '#13#10+
    ' WHERE dn.RECID =:RECID                        '#13#10+
    '   and dn.BASEID=:BASEID                       ';
  sSQLText =
    ' SELECT                            '#13#10+
    '   sum(SP.BEGIN_SUMMA) BEGIN_SUMMA,'#13#10+
    '   sum(SP.END_SUMMA) END_SUMMA     '#13#10+
    ' FROM  C_RASCHDK_QUERY(            '#13#10+
    '     :BALANCE,  :SCHET,            '#13#10+
    '     :BEGIN_DATE, :END_DATE,       '#13#10+
    '     NULL, :KOD_DK,                '#13#10+
    '     0, -1, -1 ) SP                ';
  sSQLTextR =
    ' SELECT                            '#13#10+
    '   sum(SP.BEGIN_SUMMA) BEGIN_SUMMA,'#13#10+
    '   sum(SP.END_SUMMA) END_SUMMA     '#13#10+
    ' FROM  RASCHDK_QUERY_CENTRE(       '#13#10+
    '     :BALANCE,  :SCHET,            '#13#10+
    '     :BEGIN_DATE, :END_DATE,       '#13#10+
    '     NULL, :KOD_DK,                '#13#10+
    '     0, -1, -1, :ENDDATE ) SP      ';
var
  qr: TMegaQuery;
  qrNakl: TMegaQuery;
  UseReestr : boolean;
  WD,DT,ED : TDateTime;
begin
  // если мы не знаем возвратную накладную, то ставим aKOD_DK <> 0
  // и смотрим сальдо по клиенту aKOD_DK на дату aOPERDATE

  // получаю долг клиента
  Result := 0;
  if aOwner = nil then
    aOwner := Application.MainForm;
  if aDatabase = nil then
    aDatabase := DM.Money;
  if aTransaction = nil then
    aTransaction := DM.Transaction;

  qr := TMegaQuery.Create(aOwner);
  qrNakl := TMegaQuery.Create(aOwner);

  try
    UseReestr := DMR.NeedGetDataFromReestr(aBalance, aSchet);
//    UseReestr := true;

    qrNakl.Database := aDatabase;
    qrNakl.Transaction := aTransaction;

    qrNakl.SQL.Text := sSQLNaklText;

    qrNakl.ParamByName('RECID').AsInteger  := aRECID ;
    qrNakl.ParamByName('BASEID').AsInteger := aBASEID;
    qrNakl.ExecQuery;
    if aKOD_DK = 0 then
    begin
      aKOD_DK := qrNakl.FN('DK_FROM').AsDouble;
      aOPERDATE := qrNakl.FN('OPERDATE').AsDate;
    end;

    // сальдо берем либо из реестра, либо из нормальной базы
    // накладную берем из нормальной базы
    if UseReestr then
    begin
      qr.Database := dmr.dbReestr;
      qr.Transaction := dmr.trReestr;
    end
    else
    begin
      qr.Database := aDatabase;
      qr.Transaction := aTransaction;
    end;

    if UseReestr then
      qr.SQL.Text := sSQLTextR
     else
      qr.SQL.Text := sSQLText;
    qr.ParamByName('BALANCE').AsInteger := aBalance ;
    qr.ParamByName('SCHET').AsString    := aSchet ;
    qr.ParamByName('KOD_DK').AsDouble   := aKOD_DK;

    if UseReestr then
    begin
      WD := DMR.GetWorkDate(aBalance, aSchet);
      ED := DMR.GetENDDate(aBalance, aSchet);

      if aOPERDATE>=WD then
        qr.ParambyName('BEGIN_DATE').AsDateTime:= aOPERDATE
       else
        qr.ParambyName('BEGIN_DATE').AsDateTime:= WD;

      qr.ParambyName('END_DATE').AsDateTime:= aOPERDATE;
      qr.ParambyName('ENDDATE').AsDateTime:=ED;
    end
    else
    begin
      qr.ParamByName('BEGIN_DATE').AsDate := aOPERDATE;
      qr.ParamByName('END_DATE').AsDate   := aOPERDATE;
    end;

    qr.ExecQuery;

    Result := qr.FN('END_SUMMA').AsDouble;

    // если все бралося из реестра, то добавляем еще из нормальной базы
    if UseReestr then
    begin
      qr.Close;
      qr.Database := aDatabase;
      qr.Transaction := aTransaction;
      qr.SQL.Text := sSQLTextR;
      
      qr.ParamByName('BALANCE').AsInteger := aBalance ;
      qr.ParamByName('SCHET').AsString    := aSchet ;
      qr.ParamByName('KOD_DK').AsDouble   := aKOD_DK;

      WD := DMR.GetWorkDate(aBalance, aSchet);
      ED := DMR.GetENDDate(aBalance, aSchet);
      if aOPERDATE>=WD then
        qr.ParambyName('BEGIN_DATE').AsDateTime:= aOPERDATE
       else
        qr.ParambyName('BEGIN_DATE').AsDateTime:= WD;
      qr.ParambyName('END_DATE').AsDateTime:= aOPERDATE;
      qr.ParambyName('ENDDATE').AsDateTime:=ED;

      qr.ExecQuery;

      Result := Result + qr.FN('END_SUMMA').AsDouble;
    end;
  finally
    qrNakl.Close;
    qrNakl.Free;
    qr.Close;
    qr.Free;
  end;
end;

procedure TfmReturnsMake.CheckSaldo;
begin
  // какое сальдо было у клиента на сегодня
  if StrToInt(SelBalance.Value) = IntfMegaCommon.GetMainFirmBalanceKod then
   begin
     lbSaldo.visible := true;
     DKSaldo := CheckDKDolg({RECID}0,{BASEID}0, StrToInt(SelBalance.Value), '361',
                  qrMain.Database, qrMain.Transaction, self,
                  KOD_DK, Date );
     lbSaldo.Caption := format('Сальдо составляет %8.2f' , [DKSaldo]) ;
   end
  else
   lbSaldo.visible := false;
end;


 procedure TfmReturnsMake.actCreateNewNaklExecuteNew(Sender: TObject);
const
  sqlInsDocPos =
  'INSERT INTO DOC_NAKL_POS (DOCRECNO, BASEID, KOD_MATER, KOLICH, SUMMA1, SUMMA,'#13#10+
  '       PDV, IND, IND_PRICE, IND_SUMMA, PARTY)                                '#13#10+
  'VALUES ( :DOCRECNO, :BASEID, :KOD_MATER, :KOLICH, :SUMMA1, :SUMMA,           '#13#10+
  '       :PDV, :IND, :IND_PRICE, :IND_SUMMA, :PARTY) returning RECID;';

  sqlInsDocPosAddProp =
  'insert into DOC_NAKL_POS_ADD_PROP(RECID, BASEID, REGID_FORM_A, REGID_FORM_B, KOD_MATER)'#13#10+
  'values (:RECID, :BASEID, :REGID_FORM_A, :REGID_FORM_B, :KOD_MATER)';

  sqlSelDocNaklPos =
  'SELECT dnp.KOLICH,dnp.SUMMA,dnp.SUMMA1, dn.KURS, ap.REGID_FORM_A, ap.REGID_FORM_B,                      '#13#10+
  '       dnp.PDV, dnp.IND, dnp.IND_PRICE, dnp.IND_SUMMA, dnp.PARTY,pp.sum_with_nds,pp.nds,dn.balance_kod  '#13#10+
  '  FROM DOC_NAKL_POS dnp                                                     '#13#10+
  '  left join DOC_NAKL_POS_ADD_PROP ap on ap.RECID=dnp.recid and ap.BASEID=dnp.baseid and ap.kod_mater=dnp.kod_mater '#13#10+
  '  LEFT JOIN DOC_NAKL dn on dn.RECID=dnp.DOCRECNO and dn.BASEID = dnp.BASEID '#13#10+
  '  left join pdv_pos(dnp.recid, dnp.baseid, 1) pp on (1=1)'#13#10+
  ' WHERE dnp.DOCRECNO = :RECID AND dnp.BASEID = :BASEID AND dnp.KOD_MATER = :KOD_MATER ';
  sGetKODPer= 'select dtn.dk_to'#13#10+
              'from doc_trans_nakl_pos dtnp'#13#10+
              'inner join  doc_trans_nakl dtn on (dtn.recid = dtnp.docrecno and  dtn.baseid = dtnp.baseid)'#13#10+
              'where dtnp.nakl_recid = :PARENT_RECID and dtnp.nakl_baseid = :PARENT_BASEID;';


var
  Nakl: TMegaObjDocNakl;
  OperKod,OperGroup,Balance,KORR,Cause: integer;
  DocType : string;
  DocInherited : Integer;
  i : integer;
  lbm: TBookMarkStr;
  OldCursor : TCursor;
  sum1 : double;
  firstcicle:boolean;
  TTArr : array of Variant;
  NaklBaseID,NaklRecID,TypeReturn, lRecID:Integer;

  listRECID, BASEID_S:string; //[gsa:19052020]

  ZMC:String;
  procedure destroyObjs;
  begin
    Nakl.Destroy;
    Nakl := nil;
  end;



  procedure PrepareNaklDistinctCDS;
  var
    SearchStr : string;
    SearchSchetOrKomisMat : Variant;
  begin
    // создаю сдс-ку в которой будут содержаться только номера накладных по кот. нужно делать возвраты
    if cdsNaklDistinct.Active then
      cdsNaklDistinct.EmptyDataSet;
    cdsNaklDistinct.Close;
    cdsNaklDistinct.CreateDataSet;
    listRECID:='';
    BASEID_S:='';
    cdsMain.First;
    while not cdsMain.Eof do
    begin
      if cdsMainKOLICH_MY.AsInteger > 0  then
      begin

      //  if (StrToInt(SelBalance.Value) <> IntfMegaCommon.GetPPBalance{ IntfMegaCommon.GetMainFirmBalanceKod}) then
        if (IntfMegaDBCommon.GetCountry = iccRussia) or((not firstcicle) and (IntfMegaDBCommon.GetCountry = iccUkraine)) then
        begin
          // для Мегаполиса все пытаемся запихнуть на комиссионный склад
          // если ценность находится в справочник комиссионеров
          SearchStr := ';IS_KOMISS_MATER';
          SearchSchetOrKomisMat := cdsMain.FieldbyName('IS_KOMISS_MATER').Value
        end
        else
        if (firstcicle) and (IntfMegaDBCommon.GetCountry = iccUkraine)  then
        begin
          SearchStr := ';SCHET';
          SearchSchetOrKomisMat := cdsMain.FieldbyName('SCHET').Value
        end;

        if not cdsNaklDistinct.Locate('RECID;BASEID' + SearchStr,
               VarArrayOf([cdsMain.FieldbyName('RECID').Value,
                           cdsMain.FieldbyName('BASEID').Value,
                           SearchSchetOrKomisMat ]), []) then
        begin
          cdsNaklDistinct.Insert;
          cdsNaklDistinct.FieldbyName('RECID').Value := cdsMain.FieldbyName('RECID').Value ;
          cdsNaklDistinct.FieldbyName('BASEID').Value:= cdsMain.FieldbyName('BASEID').Value;
          cdsNaklDistinct.FieldbyName('SCHET').Value := cdsMain.FieldbyName('SCHET').Value ;
          cdsNaklDistinct.FieldbyName('IS_KOMISS_MATER').Value := cdsMain.FieldbyName('IS_KOMISS_MATER').Value ;
          cdsNaklDistinct.FieldbyName('DOCNUMBER').Value := cdsMain.FieldbyName('DOCNUMBER').Value ;
          cdsNaklDistinct.FieldbyName('OPERDATE').Value := cdsMain.FieldbyName('OPERDATE').Value ;
          cdsNaklDistinct.FieldbyName('BALANCE_KOD').Value := cdsMain.FieldbyName('BALANCE_KOD').Value ;
          cdsNaklDistinct.FieldbyName('KOD_OPER').Value := cdsMain.FieldbyName('KOD_OPER').Value ;
          cdsNaklDistinct.FieldbyName('GROUP_OPER').Value := cdsMain.FieldbyName('GROUP_OPER').Value ;
          cdsNaklDistinct.Post;
        end;

  //      BASEID_S:=cdsMain.FieldbyName('BASEID').Value;
  //      listRECID:=listRECID+''+cdsMain.FieldbyName('RECID').AsString+','; //[gsa:19052020]
      end;
      cdsMain.next;
    end;
  end;

  procedure DeleteLoadedReturnFromTable(aRECID,aBASEID : integer);
  const
    sqlDelete =
      'DELETE FROM RETURNS_MAKE    '#13#10+
      'WHERE RECID = :RECID        '#13#10+
      '  and BASEID = :BASEID      ';
  begin
    qr.Close;
    qr.SQL.Text:= sqlDelete;
    qr.ParamByName('RECID').AsInteger  := aRECID;
    qr.ParamByName('BASEID').AsInteger := aBASEID;
    qr.ExecQuery;
    qr.Close;
  end;

  function GetDocType(aTypeID,aKodOper,aGroupOper,aNNakl : integer;aSchet:String):boolean;
  const
    sGetDocInherited = ' SELECT first 1 DOC_INHERITED FROM SPRAV_TDOC where DOCTYPE= :DOC_TYPE  ';
    sGetDocTypeByType=' Select first 1 KOD_OPER_NAK,GROUP_OPER_NAK,DOCTYPE,BALANCE,KORR,CAUSE  from SPRAV_RETURN_TYPE_DOC '#13#10+
                      '  WHERE TYPEID=:TYPEID AND coalesce(KOD_OPER,0)=:KOD_OPER '#13#10+
                      '  AND coalesce(GROUP_OPER,0)=:GROUP_OPER AND coalesce(N_NAKL,0)=:N_NAKL AND '#13#10+
                      '(coalesce(SCHET,'''')=:SCHET OR SCHET IS NULL) '#13#10+
                      ' and ((sel_balance = :BALANCE) or (:BALANCE=0) or coalesce(sel_balance,0)=0 ) '#13#10+
                      ' ORDER BY SCHET DESC ' ;

//ORDER BY ACCOUNT DESC';
  begin
    Result:=true;
    qr.Close;
    qr.SQL.Text:= sGetDocTypeByType;
    qr.ParamByName('TYPEID').AsInteger := aTypeID;
    qr.ParamByName('KOD_OPER').AsInteger := aKodOper;
    qr.ParamByName('GROUP_OPER').AsInteger := aGroupOper;
    qr.ParamByName('N_NAKL').AsInteger := aNNakl;
    qr.ParamByName('SCHET').AsString:= aSchet;
    if (MegaSelBalance1.Visible=true) then
     qr.ParamByName('BALANCE').AsInteger:= StrToInt(MegaSelBalance1.Value)
    else
      qr.ParamByName('BALANCE').AsInteger:= 0;
    qr.ExecQuery;
    OperKod  := qr.FN('KOD_OPER_NAK').AsInteger;
    OperGroup:= qr.FN('GROUP_OPER_NAK').AsInteger;
    DocType := qr.FN('DOCTYPE').AsString;
    Balance := qr.FN('BALANCE').AsInteger;
    Cause:= qr.FN('CAUSE').AsInteger;
    KORR:=qr.FN('KORR').AsInteger;
    if (OperKod<>0) and (OperGroup<>0)and(DocType<>'') then
      begin
        Result:=false;
      end else ShowMessage('Накладная для документа '+cdsNaklDistinctDOCNUMBER.AsString+' не создана, не найденны данные для создания в базе данных'#13#10+
                             'Group_oper='+cdsNaklDistinctGROUP_OPER.AsString+' Kod_oper='+cdsNaklDistinctKOD_OPER.AsString+' Тип='+IntToStr(TypeReturn)+' Счет='+cdsNaklDistinctSCHET.AsString+' Пор:'+IntToStr(aNNakl));


    DocInherited:=1;
  end;

  procedure LinkDocs(aK:Integer);
  const
    sInsertLinkDocNew =
    'SELECT result, error_descr                             '#13#10+
    '  FROM MAKE_DOC_LINKED(                                '#13#10+
    '    :PARENT_RECID,:PARENT_BASEID,                      '#13#10+
    '    (SELECT first 1 sd.DOC_INHERITED                   '#13#10+
    '      FROM DOC_NAKL dn                                 '#13#10+
    '      LEFT JOIN SPRAV_TDOC sd ON sd.DOCTYPE=dn.DOCTYPE '#13#10+
    '      WHERE dn.RECID = :PARENT_RECID                   '#13#10+
    '        AND dn.BASEID = :PARENT_BASEID),               '#13#10+
    '    :OPL_RECID,:OPL_BASEID, :DOC_INHERITED             '#13#10+
    '    )                                                  ';
    sInsertLinkDocOplQuery =
    ' insert into link_doc_opl                                             '#13#10+
    '  (PARENT_RECID, PARENT_BASEID, OPL_RECID, OPL_BASEID, OPL_FORM_TYPE) '#13#10+
    ' values                                                               '#13#10+
    '  (:PARENT_RECID, :PARENT_BASEID, :OPL_RECID, :OPL_BASEID, :DOC_INHERITED  )';
  begin
   
    try
      qr.Close;
      qr.SQL.Text:= sInsertLinkDocOplQuery;
     { if (edReturnTypeId.EditValue=12) and (aK=2) then
        begin
          qr.ParamByName('PARENT_RECID' ).AsInteger := NaklRecID;
          qr.ParamByName('PARENT_BASEID').AsInteger := NaklBaseID;
        end
          else
            begin }
              qr.ParamByName('PARENT_RECID' ).AsInteger := cdsNaklDistinctRECID.Asinteger;
              qr.ParamByName('PARENT_BASEID').AsInteger := cdsNaklDistinctBaseID.Asinteger;
           // end;
      qr.ParamByName('OPL_RECID'    ).AsInteger := Nakl.fieldRECID.AsInteger;
      qr.ParamByName('OPL_BASEID'   ).AsInteger := Nakl.FieldBaseID.AsInteger;
      qr.ParamByName('DOC_INHERITED').AsInteger := DocInherited;
      qr.ExecQuery;
      qr.Close;
    except
      on e:Exception do
        ShowMessage('невозможно связать документ с родительским:'#13#10+e.Message);
    end;
    try
      qr.Close;
      qr.SQL.Text:= sInsertLinkDocNew;
      { if (edReturnTypeId.EditValue=12) and (aK=2) then
        begin
          qr.ParamByName('PARENT_RECID' ).AsInteger := NaklRecID;
          qr.ParamByName('PARENT_BASEID').AsInteger := NaklBaseID;
        end
          else
            begin }
              qr.ParamByName('PARENT_RECID' ).AsInteger := cdsNaklDistinctRECID.Asinteger;
              qr.ParamByName('PARENT_BASEID').AsInteger := cdsNaklDistinctBaseID.Asinteger;
           // end;
      qr.ParamByName('OPL_RECID'    ).AsInteger := Nakl.fieldRECID.AsInteger;
      qr.ParamByName('OPL_BASEID'   ).AsInteger := Nakl.FieldBaseID.AsInteger;
      qr.ParamByName('DOC_INHERITED').AsInteger := DocInherited;
      qr.ExecQuery;
      qr.Close;
    except
      on e:Exception do
        ShowMessage('невозможно связать документ с родительским(2):'#13#10+e.Message);
    end;
  end;
  procedure LinkDocsNak;
  //select first 1 kod_ta
  //  from distr_select_tt_distr_info(:OPERDATE, null, null, null, null, null, :OUTLET_RECID, :OUTLET_BASEID)


  const

    sInsertLinkDocNew =
    'SELECT result, error_descr                             '#13#10+
    '  FROM MAKE_DOC_LINKED(                                '#13#10+
    '    :PARENT_RECID,:PARENT_BASEID,1,                    '#13#10+
    '    :DOC_RECID,:DOC_BASEID,1,0                           '#13#10+
    '    )                                                  ';
    sInsertDELIVERY_LOCATION =
    ' insert into DELIVERY_LOCATION                                            '#13#10+
    '  (FORMTYPE,BASEID,DOCRECNO,OUTLET_RECID,OUTLET_BASEID) '#13#10+
    ' values                                                               '#13#10+
    '  (1, :BASEID,:DOCRECNO,:OUTLET_RECID,:OUTLET_BASEID )';

    sInsertLinkDocOplQuery =
    ' insert into link_doc_opl                                             '#13#10+
    '  (PARENT_RECID, PARENT_BASEID, OPL_RECID, OPL_BASEID, OPL_FORM_TYPE) '#13#10+
    ' values                                                               '#13#10+
    '  (:PARENT_RECID, :PARENT_BASEID, :OPL_RECID, :OPL_BASEID, :DOC_INHERITED  )';
    sUpDateDeliveryLocation='update DELIVERY_LOCATION set RETURN_TYPE=1 where BASEID=:BASEID and DOCRECNO=:DOCRECNO ';

  begin
     if (TypeReturn in [7,8]) then
     try
       qr.Close;
       qr.SQL.Text:= sInsertLinkDocOplQuery;
       qr.ParamByName('PARENT_RECID' ).AsInteger := cdsNaklDistinctRECID.Asinteger;
       qr.ParamByName('PARENT_BASEID').AsInteger := cdsNaklDistinctBaseID.Asinteger;
       qr.ParamByName('OPL_RECID'    ).AsInteger := Nakl.fieldRECID.AsInteger;
       qr.ParamByName('OPL_BASEID'   ).AsInteger := Nakl.FieldBaseID.AsInteger;
       qr.ParamByName('DOC_INHERITED').AsInteger := DocInherited;
       qr.ExecQuery;
       qr.Close;
    except
      on e:Exception do
        ShowMessage('невозможно связать документ с родительским:'#13#10+e.Message);
    end
      else
        if (TypeReturn <> 27) then
        try
          qr.Close;
          qr.SQL.Text:= sInsertDELIVERY_LOCATION;
          qr.ParamByName('BASEID' ).AsInteger := Nakl.FieldBaseID.AsInteger;
          qr.ParamByName('DOCRECNO').AsInteger := Nakl.fieldRECID.AsInteger;
          qr.ParamByName('OUTLET_RECID').AsInteger := TTArr[0];
          qr.ParamByName('OUTLET_BASEID').AsInteger := TTArr[1];
          qr.ExecQuery;
          qr.Close;
        except
          on e:Exception do
            ShowMessage('невозможно связать документ с родительским:'#13#10+e.Message);
        end;

     if (TypeReturn in [7,8,21,22,23,24,27]) then
    try
      qr.Close;
      qr.SQL.Text:= sInsertLinkDocNew;
      qr.ParamByName('PARENT_RECID' ).AsInteger := cdsNaklDistinctRECID.Asinteger;
      qr.ParamByName('PARENT_BASEID').AsInteger := cdsNaklDistinctBaseID.Asinteger;
      qr.ParamByName('DOC_RECID'    ).AsInteger := Nakl.fieldRECID.AsInteger;
      qr.ParamByName('DOC_BASEID'   ).AsInteger := Nakl.FieldBaseID.AsInteger;
      qr.ExecQuery;
      qr.Close;
      qr.SQL.Text:= sUpDateDeliveryLocation;
      qr.ParamByName('BASEID' ).AsInteger := Nakl.FieldBaseID.AsInteger;
      qr.ParamByName('DOCRECNO').AsInteger := Nakl.fieldRECID.AsInteger;
      qr.ExecQuery;
      qr.Close;
      //ShowMessage(qr.FieldByName('error_descr').AsString);
    except
      on e:Exception do
        ShowMessage('невозможно связать документ с родительским(2):'#13#10+e.Message);
    end;
  end;
  procedure CreateKorrNN;
  const
    sCreateKorNakl = 'SELECT PDVNRECID,PDVNBASEID FROM MAKE_PDVN_K_CFO(:RECID, :BASEID, :NUM, :DT, -1, :DOC_INHERITED, :CFO  )';
  begin
    if (StrToInt(SelBalance.Value) <> IntfMegaCommon.GetPPBalance) then
    begin
      // создаю корректировочную налоговую накладную
      qr.Close;
      qr.SQL.Text:= sCreateKorNakl;
      qr.ParamByName('RECID').AsInteger := Nakl.FieldRECID.AsInteger;
      qr.ParamByName('BASEID').AsInteger:= Nakl.FieldBaseID.AsInteger;
      qr.ParamByName('NUM').AsInteger   := Nakl.FieldDOCNUMBER.AsInteger;
      qr.ParamByName('DT').AsDate       := Nakl.fieldOPERDATE.AsDateTime;
      qr.ParamByName('DOC_INHERITED').AsInteger:= DocInherited;
      qr.ParamByName('CFO').AsInteger   := Nakl.fieldCFO.AsInteger;
      qr.ExecQuery;
      if (qr.Fields[0].AsInteger = 0)and(qr.Fields[1].AsInteger = 0) then begin
         qr.Close;
         if qr.Transaction.InTransaction then
            qr.Transaction.RollbackRetaining;
         exit;
      end;
      qrMain.Transaction.CommitRetaining;
      // печатаю корректировочную НН
      if chbPrintKorNN.Checked then begin
(*        dmMegaReports.MyPrint(5,Date,
                              [qr.Fields[0].AsInteger,qr.Fields[1].AsInteger],2,
                              2,true{юзер выбирает сколько копий ему печатать});*)
        dmMegaReports.MyPrepareReport(5,Date,
                      [qr.Fields[0].AsInteger,qr.Fields[1].AsInteger,0,1,0],5,true,1);
        dmMegaReports.MyPrepareReport(5,Date,
                      [qr.Fields[0].AsInteger,qr.Fields[1].AsInteger,0,0,1],5,false,1);
        dmMegaReports.frxMain.PrintOptions.ShowDialog:=true;
        dmMegaReports.frxMain.Print; //юзер выбирает сколько копий ему печатать
      end;
      qr.Close;
    end;
  end;
  
  function NDSandLic(NDS:boolean):boolean;
  const
    sqlNDS='select USNO from SPRAV_DK WHERE KOD_DK=:KODDK';
    sqlLic='select count(*) as countofrec from delivery_location dl left join PROC_GET_DK_LICENSE(:KOD_DK, :OPERDATE,dl.outlet_recid,dl.outlet_baseid,1,3) pg on (1=1)'+
                 'where pg.doc_number is not null and  dl.docrecno = :RECID and dl.baseid = :BASEID ';
  var
   aRecID,aBaseID:Integer;
  begin
    Result := false;
    if NDS then
      begin
        qr.Close;
        qr.SQL.Text:= sqlNDS;
        qr.ParamByName('KODDK').AsFloat:=KOD_DK;
        qr.ExecQuery;
        if (qr.FieldByName('USNO').value =null) or(qr.FieldByName('USNO').AsInteger =0) then
          Result := true;

      end
        else
          begin
           qr.Close;
           qr.SQL.Text:= sqlLic;
           qr.ParamByName('RECID').AsInteger  := cdsNaklDistinctRECID.Asinteger;
           qr.ParamByName('BASEID').AsInteger := cdsNaklDistinctBaseID.Asinteger;
           qr.ParamByName('KOD_DK').AsFloat:=KOD_DK;
           qr.ParamByName('OPERDATE').AsDateTime:=cdsNaklDistinctoperdate.AsDateTime;
           qr.ExecQuery;
           if qr.FieldByName('countofrec').AsInteger>0 then  Result := true;
          end;
  end;
  function CreateNaklHead(aBalance : Integer;aK:Integer) : boolean;
  const
    sqlSelDocNakl =
    'SELECT dn.*, dtn.DK_C DK_C_FROM_TTN, dtn.DK_TO DK_TO_FROM_TTN, '#13#10+
    'sdk.SHORTNAME_DK, dgaai.KOD_TA TA_DK, dgaai.NAME_TA TA_NAME '#13#10+
    'FROM DOC_NAKL dn '#13#10+
    'LEFT JOIN SPRAV_DK sdk  ON sdk.KOD_DK=dn.DK_TO '#13#10+
    'LEFT JOIN DELIVERY_LOCATION dl ON dl.DOCRECNO=dn.RECID and dl.BASEID=dn.BASEID and dl.FORMTYPE=1 '#13#10+
    'LEFT JOIN distr_select_tt_distr_info(''today'',null,null,null, null,null,dl.outlet_recid,dl.outlet_baseid,dn.brand_case_id) dgaai ON 1=1 '#13#10+
    'LEFT JOIN DOC_TRANS_NAKL_POS dtnp on dtnp.NAKL_RECID = dn.RECID and dtnp.NAKL_BASEID = dn.BASEID '#13#10+
    'LEFT JOIN DOC_TRANS_NAKL dtn on dtn.RECID = dtnp.DOCRECNO and dtn.BASEID = dtnp.BASEID '#13#10+
    'WHERE dn.RECID = :RECID AND dn.BASEID = :BASEID ';
  sqlSenDocNumber='SELECT * from GET_NEW_DOCNUMBER(:FBASEID,:DOCTYPE,:FOPERDATE,:FORMTYPE,:CFO)';

  var
    i,DN : integer;

  begin
    Result := true;
     if ak=2 then
      begin
        qr.Close;
        qr.SQL.Text:= sqlSenDocNumber;
        qr.ParamByName('FBASEID').AsInteger  := cdsNaklDistinctBaseID.Asinteger;
        qr.ParamByName('DOCTYPE').AsString := DocType;
        qr.ParamByName('FOPERDATE').AsDate := edNaklDate.Date;
        qr.ParamByName('CFO').AsInteger  :=IntfMegaDBCommon.GetCFO;
        qr.ExecQuery;
        DN:=qr.FieldByName('DOCNUMBER').AsInteger;
      end;
    qr.Close;
    qr.SQL.Text:= sqlSelDocNakl;
    qr.ParamByName('RECID').AsInteger  := cdsNaklDistinctRECID.Asinteger;
    qr.ParamByName('BASEID').AsInteger := cdsNaklDistinctBaseID.Asinteger;
    qr.ExecQuery;

    Nakl.New(DocType);
    if IntfMegaDBCommon.GetCountry = iccUkraine then
      begin
        Nakl.fieldOPERDATE.AsDateTime := edNaklDate.Date;//Date;
        Nakl.fieldDOCDATE.AsDateTime  := edNaklDate.Date;
      end;
    Nakl.fieldGROUP_OPER.AsInteger:= OperGroup;
    Nakl.fieldKOD_OPER.AsInteger  := OperKod;

    if ak=2 then
      Nakl.fieldDOCNUMBER.AsInteger := DN
    else
      if (edNaklNumber.Text <> '') and TryStrToInt(edNaklNumber.Text, i) then
        Nakl.fieldDOCNUMBER.AsInteger := i
      else
        Nakl.fieldDOCNUMBER.AsInteger := qr.FieldByName('DOCNUMBER').AsInteger;
    Nakl.fieldBalanceKod.AsInteger:= aBalance;
    Nakl.fieldDK_FROM.AsFloat     := qr.FieldByName('DK_TO').AsFloat;
    Nakl.fieldDK_TO.AsFloat       := qr.FieldByName('DK_FROM').AsFloat;
    //В связи с анексией Крыма москалями и переходом там на рубль 18.06.2014
    if qr.FieldByName('CFO').AsInteger=200 then
      begin
        Nakl.fieldPriceFromValyuta.AsInteger:=qr.FieldByName('PRICE_FROM_VALYUTA').AsInteger;
        Nakl.fieldKurs.AsInteger:=qr.FieldByName('KURS').AsInteger;
        Nakl.fieldV.AsInteger:=qr.FieldByName('V').AsInteger;
        Nakl.fieldV1.AsInteger:=qr.FieldByName('V1').AsInteger;
      end;

    if (Balance = IntfMegaCommon.GetPPBalance) and (TypeReturn in [3,4]) and (IntfMegaDBCommon.GetCountry = iccUkraine) then
      begin // для боя по ЧП берем дебитора-"через" из ТТН
        if TypeReturn in [3] then
          Nakl.fieldDK_C.Value        := qr.FieldByName('DK_TO_FROM_TTN').AsFloat
          else
        Nakl.fieldDK_C.Value        := qr.FieldByName('DK_C_FROM_TTN').AsFloat;

        if qr.FieldByName('DK_C_FROM_TTN').IsNull then
        begin
          MessageDlg('Невозможно создать бой по накладной №'+
                     qr.FieldByName('DOCNUMBER').AsString+#13#10+
                     'Отсутствует ТТН.',mtError,[mbOk],0   );
          Result := false;
          exit;
        end;
      end
        else
          if (qr.FieldByName('DK_C').value <>null) then
            Nakl.fieldDK_C.value      := qr.FieldByName('DK_C').value;


    Nakl.fieldCFO.AsInteger       := IntfMegaDBCommon.GetCFO;//    qr.FieldByName('CFO').AsInteger;
    if (IntfMegaDBCommon.GetCountry = iccUkraine) then
      begin
        Nakl.fieldAddrFrom.AsInteger  := qr.FieldByName('ADDR_TO').AsInteger;
        Nakl.fieldAddrTo.AsInteger    := qr.FieldByName('ADDR_FROM').AsInteger;
      end;
    // тип цены - как в справочнике дебиторов
    Nakl.fieldPriceType.AsInteger := qr.FieldByName('PRICETYPE_').AsInteger;
    Nakl.fieldSTATE.AsInteger     := 2;
    Nakl.fieldNotes.AsString      := edNotes.Text;
  end;

  procedure UpdatePriceType;
  const
    sqlUptPriceType =
    'UPDATE DOC_NAKL dn SET                      '#13#10+
    '    dn.FORMAOPL_ =                          '#13#10+
    '       coalesce(( SELECT sdk.FORMA_OPL_     '#13#10+
    '          FROM SPRAV_DK sdk                 '#13#10+
    '          WHERE sdk.KOD_DK = dn.DK_FROM),1),'#13#10+
    '    dn.PRICETYPE_ =                         '#13#10+
    '        ( SELECT sdk.PRICE_TYPE             '#13#10+
    '          FROM SPRAV_DK sdk                 '#13#10+
    '          WHERE sdk.KOD_DK = dn.DK_FROM)    '#13#10+
    'WHERE dn.RECID = :RECID                     '#13#10+
    '  AND dn.BASEID = :BASEID                   ';
  begin
    qr.Close;
    qr.SQL.Text:= sqlUptPriceType;
    qr.ParamByName('RECID').AsInteger  := nakl.fieldRECID.AsInteger;
    qr.ParamByName('BASEID').AsInteger := nakl.fieldBASEID.AsInteger;
    qr.ExecQuery;
    qr.Close;
  end;
  procedure SetStiker(aRECID,aBASEID:Integer);
  const
   sqlStiker=' INSERT INTO STICKER(FORMTYPE, DOC_RECID, DOC_BASEID, NUMBER, ORDER_NUM, SEGMENT_NUM, ORDER_DATE)'#13#10+
             ' VALUES (1, :DOC_RECID, :DOC_BASEID, :NUMBER, :ORDER_NUM, :SEGMENT_NUM, ''TODAY'')';
  begin
    qr.Close;
    qr.SQL.Text:= sqlStiker;
    qr.ParamByName('DOC_RECID').AsInteger  := aRECID;
    qr.ParamByName('DOC_BASEID').AsInteger := aBASEID;
    qr.ParamByName('NUMBER').AsString  := edStiker.Text;
    qr.ParamByName('ORDER_NUM').AsString  := edZayavka.Text;
    qr.ParamByName('SEGMENT_NUM').AsString := '';
    qr.ExecQuery;
    qr.Close;

  end;

  procedure CreateNaklPoses(NULLSourcePos : boolean = true);
  var
    Expression1 : boolean;
    sumind,sumznc,sumwithnds,nds:double;
    //lRecID:Integer;
  begin
    qr.Close;
    cdsMain.First;
    while not cdsMain.Eof do
    begin
    if (IntfMegaDBCommon.GetCountry = iccRussia) or((not firstcicle) and (IntfMegaDBCommon.GetCountry = iccUkraine)) then
    // if (StrToInt(SelBalance.Value) = IntfMegaCommon.GetMainFirmBalanceKod) then
      begin
        // для Мегаполиса все пытаемся запихнуть на комиссионный склад
        // если ценность находится в справочник комиссионеров
        Expression1 := cdsMainIS_KOMISS_MATER.AsString = cdsNaklDistinctIS_KOMISS_MATER.AsString
      end
      else
      begin
        Expression1 := cdsMainSCHET.AsString = cdsNaklDistinctSCHET.AsString
      end;

      if (cdsMainKOLICH_MY.AsInteger > 0) and
         (cdsMainRECID.AsInteger = cdsNaklDistinctRECID.Asinteger) and
         (cdsMainBaseID.AsInteger = cdsNaklDistinctBaseID.Asinteger)and
         (Expression1) then
      begin
        sumind:=0;
        sumznc:=0;
        sum1:=0;    //[gsa:09092020] добавил зануление 
        if (ZMC<>'')then
          begin
                qr.Close;
                qr.SQL.Text:=' select dnp.kolich,dnp.summa,dnp.IND_SUMMA '#13#10+
                          ' from link_doc_opl ldo '#13#10+
                          ' left join doc_nakl dn on (dn.recid = ldo.opl_recid and dn.baseid = ldo.opl_baseid) '#13#10+
                          ' left join doc_nakl_pos dnp on (dnp.docrecno = ldo.opl_recid and dnp.baseid = ldo.opl_baseid and dnp.kod_mater=:KOD_MATER) '#13#10+
                          ' where ldo.parent_recid=:RECID  and ldo.parent_baseid=:BASEID and dn.doctype=:DOC_TYPE and dnp.kolich>=:KOLICH ';
                qr.Params.ByName['RECID'].AsInteger  := cdsMainRECID.Asinteger;
                qr.Params.ByName['BASEID'].AsInteger := cdsMainBaseID.Asinteger;
                qr.Params.ByName['KOD_MATER'].AsFloat:= cdsMainKOD_MATER.AsFloat;
                qr.ParamByName('DOC_TYPE').AsString := 'ЗМЦ'+SelBalance.Value;
                qr.Params.ByName['KOLICH'].AsFloat := cdsMainKOLICH.AsFloat;
                qr.ExecQuery;
                while not qr.Eof do
                  begin
                    if  qr.FieldByName('IND_SUMMA').AsFloat<>0 then
                      begin
                        sumznc:=sumznc+qr.FieldByName('summa').AsFloat/qr.FieldByName('KOLICH').AsFloat;
                        sumind:=sumind+qr.FieldByName('IND_SUMMA').AsFloat/qr.FieldByName('KOLICH').AsFloat;
                      end;
                    qr.Next;
                  end;
          end;
        qr.Close;
        qr.SQL.Text:= 'execute procedure set_context_variable(''CREATE_NAKL_AKCIA'',''1'')';
        qr.ExecQuery;

        qr.Close;
        qr.SQL.Text:= sqlSelDocNaklPos;
        qr.Params.ByName['RECID'].AsInteger  := cdsMainRECID.Asinteger;
        qr.Params.ByName['BASEID'].AsInteger := cdsMainBaseID.Asinteger;
        qr.Params.ByName['KOD_MATER'].AsFloat:= cdsMainKOD_MATER.AsFloat;
       
        qr.ExecQuery;
        Nakl.GetQuery.Close;
        Nakl.GetQuery.SQL.Text := sqlInsDocPos;
        Nakl.GetQuery.Params.ByName['DOCRECNO'].AsInteger:= Nakl.fieldRECID.AsInteger;
        Nakl.GetQuery.Params.ByName['BASEID'].AsInteger  := Nakl.FieldBaseID.AsInteger;
        Nakl.GetQuery.Params.ByName['KOD_MATER'].AsFloat := cdsMainKOD_MATER.AsFloat;
        Nakl.GetQuery.Params.ByName['KOLICH'].AsFloat    := cdsMainKOLICH_MY.AsFloat;

        if (firstcicle) or (not firstcicle and (TypeReturn in [23,24]) ) then
          begin
            sum1 := cdsMainKOLICH_MY.AsFloat*liUtils.iif(Nakl.FieldBalanceKOd.AsInteger=IntfMegaCommon.GetPPBalance,qr.FieldByName('sum_with_nds').AsFloat,qr.FieldByName('SUMMA1').AsFloat)/qr.FieldByName('KOLICH').AsFloat;
          end
            else
              begin
                if (TypeReturn in [7,21]) then sum1 := cdsMainKOLICH_MY.AsFloat*qr.FieldByName('sum_with_nds').AsFloat/qr.FieldByName('KOLICH').AsFloat;
                if (TypeReturn in [8,22]) then sum1 := cdsMainKOLICH_MY.AsFloat*(qr.FieldByName('sum_with_nds').AsFloat-qr.FieldByName('nds').AsFloat)/qr.FieldByName('KOLICH').AsFloat;
              end;
        sum1:=sum1+sumznc*cdsMainKOLICH_MY.AsFloat;
        Nakl.GetQuery.Params.ByName['SUMMA1'].AsFloat    := sum1;
        Nakl.GetQuery.Params.ByName['SUMMA'].AsFloat     := sum1 / qr.FieldByName('KURS').AsFloat;
        sum1 := cdsMainKOLICH_MY.AsFloat*((qr.FieldByName('IND_SUMMA').AsFloat)/qr.FieldByName('KOLICH').AsFloat+sumind);
        Nakl.GetQuery.Params.ByName['IND'].AsFloat       := qr.FieldByName('IND').AsFloat;
        Nakl.GetQuery.Params.ByName['IND_PRICE'].AsFloat := qr.FieldByName('IND_PRICE').AsFloat;
        Nakl.GetQuery.Params.ByName['IND_SUMMA'].AsFloat := sum1;
        //PDV, PARTY
        Nakl.GetQuery.Params.ByName['PDV'].AsString   := qr.FieldByName('PDV').AsString;
        Nakl.GetQuery.Params.ByName['PARTY'].AsString := qr.FieldByName('PARTY').AsString;

        Nakl.GetQuery.ExecQuery;
        lRecID:=Nakl.GetQuery.FieldByName('recid').AsInteger;
        if (qr.FieldByName('REGID_FORM_A').AsString<>'')or(qr.FieldByName('REGID_FORM_B').AsString<>'') then
        begin
           Nakl.GetQuery.Close;
           Nakl.GetQuery.SQL.Text := sqlInsDocPosAddProp;
           Nakl.GetQuery.Params.ByName['recid'].AsInteger   := lRecID;
           Nakl.GetQuery.Params.ByName['BASEID'].AsInteger  := Nakl.FieldBaseID.AsInteger;
           Nakl.GetQuery.Params.ByName['KOD_MATER'].AsFloat := cdsMainKOD_MATER.AsFloat;
           Nakl.GetQuery.Params.ByName['REGID_FORM_A'].AsString := qr.FieldByName('REGID_FORM_A').AsString;
           Nakl.GetQuery.Params.ByName['REGID_FORM_B'].AsString := qr.FieldByName('REGID_FORM_B').AsString;
           Nakl.GetQuery.ExecQuery;
        end;
        qr.Close;

        // проставляю в количестве нолики
        if NULLSourcePos then
        begin
          cdsMain.Edit;
          cdsMainKOLICH.AsFloat := cdsMainKOLICH.AsFloat - cdsMainKOLICH_MY.AsFloat;
          cdsMainKOLICH_MY.AsFloat := 0;
          cdsMain.Post;
        end;

      end;
      cdsMain.Next;
    end;
    //ShowMessage(mt);
    Nakl.Post;
    Nakl.Save;
  end;

  procedure UpdatePriceToDK(aRECID,aBASEID : integer; KOD_DK:double);
  const
    SQLSelDocNakl =
      'SELECT dn.OPERDATE, dn.PRICETYPE_,'#13#10+
      '   dn.BALANCE_KOD, dn.V1, dn.KURS,'#13#10+
      '   dn.CFO, dn.balance_kod         '#13#10+
      '  FROM DOC_NAKL dn                '#13#10+
      ' WHERE dn.RECID = :RECID          '#13#10+
      '   AND dn.BASEID = :BASEID        ';

    SQLUpdatePriceToDK =
      'UPDATE DOC_NAKL_POS dnp                                                    '#13#10+
      'SET                                                                        '#13#10+
      '  dnp.SUMMA = dnp.KOLICH*                                                  '#13#10+
      '    (SELECT first 1 gmp.PRICE                                              '#13#10+
      '     FROM C_GET_MATER_PRICE_TO_DK(dnp.KOD_MATER,                           '#13#10+
      '          :OPERDATE,:BALANCE_KOD,'''',:PRICETYPE_,:V1,:KOD_DK,:CFO) gmp ) ,'#13#10+
      '  dnp.SUMMA1 = dnp.KOLICH*:KURS*                                           '#13#10+
      '    (SELECT first 1 gmp.PRICE                                              '#13#10+
      '     FROM C_GET_MATER_PRICE_TO_DK(dnp.KOD_MATER,                           '#13#10+
      '          :OPERDATE,:BALANCE_KOD,'''',:PRICETYPE_,:V1,:KOD_DK,:CFO) gmp ) ,'#13#10+
  //    '  dnp.IND =                                                                '#13#10+
  //    '    (SELECT first 1 gmp.IND_                                               '#13#10+
  //    '     FROM C_GET_MATER_PRICE_TO_DK(dnp.KOD_MATER,                           '#13#10+
  //    '          :OPERDATE,:BALANCE_KOD,'''',:PRICETYPE_,:V1,:KOD_DK,:CFO) gmp ), '#13#10+
      '  dnp.IND_PRICE =0,                                                          '#13#10+
   //   '    (SELECT first 1 gmp.OLD_PRICE                                          '#13#10+
   //   '     FROM C_GET_MATER_PRICE_TO_DK(dnp.KOD_MATER,                           '#13#10+
   //   '          :OPERDATE,:IND_BALANCE,'''',:PRICETYPE_,:V1,:KOD_DK,:CFO) gmp ), '#13#10+
      //Так как ind_summa с ндс
      //'          :OPERDATE,:BALANCE_KOD,'''',:PRICETYPE_,:V1,:KOD_DK,:CFO) gmp ), '#13#10+
      '  dnp.IND_SUMMA = dnp.KOLICH*                                              '#13#10+
      '    (SELECT first 1 gmp.OLD_PRICE                                          '#13#10+
      '     FROM C_GET_MATER_PRICE_TO_DK(dnp.KOD_MATER,                           '#13#10+
     // '          :OPERDATE,:BALANCE_KOD,'''',:PRICETYPE_,:V1,:KOD_DK,:CFO) gmp )  '#13#10+
     //Так как ind_summa с ндс
      '          :OPERDATE,:IND_BALANCE,'''',:PRICETYPE_,:V1,:KOD_DK,:CFO) gmp )  '#13#10+
      '                                                                           '#13#10+
      'where dnp.DOCRECNO = :RECID                                                '#13#10+
      '  and dnp.BASEID   = :BASEID                                               ';
     SQLUpdatePriceToDK_NEW ='execute procedure update_nakl_pos(:RECID,:BASEID,:PRICETYPE_,:V1,:KURS,1)';
  var
    aOPERDATE  : TDate;
    aPRICETYPE_: integer;
    aV1        : integer;
    aKURS      : double;
    aCFO       : integer;
    aBalance   : integer;
  begin
    // проставляю все цены по накладной по дебиторской колонке
    try
      qr.Close;
      qr.SQL.Text:= SQLSelDocNakl;
      qr.ParamByName('RECID' ).AsInteger := aRECID;
      qr.ParamByName('BASEID').AsInteger := aBASEID;
      qr.ExecQuery;
      aOPERDATE   := qr.FN('OPERDATE').AsDate;
      aPRICETYPE_ := qr.FN('PRICETYPE_').AsInteger;
      aV1         := qr.FN('V1').AsInteger;
      aKURS       := qr.FN('KURS').AsDouble;
      aCFO        := qr.FN('CFO').AsInteger;
      aBalance    := qr.FN('balance_kod').AsInteger;
      // апдейчу цены
      qr.Close;
      qr.SQL.Text:= SQLUpdatePriceToDK_NEW;
      qr.ParamByName('RECID' ).AsInteger     := aRECID;
      qr.ParamByName('BASEID').AsInteger     := aBASEID;
     /// qr.ParamByName('KOD_DK').AsDouble      := KOD_DK;
     /// qr.ParamByName('OPERDATE').AsDate      := aOPERDATE;
      qr.ParamByName('PRICETYPE_').AsInteger := aPRICETYPE_;
      qr.ParamByName('V1').AsInteger         := aV1;
      qr.ParamByName('KURS').AsDouble        := aKURS;
     /// qr.ParamByName('CFO').AsInteger        := aCFO;
     // qr.ParamByName('BALANCE_KOD').AsInteger        := aBalance;
      //if edReturnTypeId.EditValue=23 then  qr.ParamByName('IND_BALANCE').AsInteger        := 7
     // else
     /// qr.ParamByName('IND_BALANCE').AsInteger        := IntfMegaCommon.GetPPBalance;
      qr.ExecQuery;
      qr.Close;

    except
      on e:Exception do
        ShowMessage('Не удалось установить цены в накладной по дебиторской колонке:'#13#10+e.Message);
    end;
  end;

  procedure UpdatePriceToCol(aRECID,aBASEID,aCol : integer);
  const
    SQLSelDocNakl =
      'SELECT dn.OPERDATE, dn.PRICETYPE_,'#13#10+
      '   dn.BALANCE_KOD, dn.V1, dn.KURS,'#13#10+
      '   dn.CFO                         '#13#10+
      '  FROM DOC_NAKL dn                '#13#10+
      ' WHERE dn.RECID = :RECID          '#13#10+
      '   AND dn.BASEID = :BASEID        ';
    SQLUpdatePriceToCol =
      'UPDATE DOC_NAKL_POS dnp                                                   '#13#10+
      'SET                                                                       '#13#10+
      '  dnp.SUMMA = dnp.KOLICH*                                                 '#13#10+
      '  (SELECT pc.PRICE                                                        '#13#10+
      '    FROM SPRAV_MATER sm                                                   '#13#10+
//      '    LEFT JOIN view_price_col pc on sm.kod_mater=pc.kod_mater and pc.COL = :COL '#13#10+
      '    LEFT JOIN SELECT_PRICE_COL(''today'',sm.kod_mater,:COL) pc on         '#13#10+
      '                        (sm.kod_mater is not null and pc.col=:COL)   '#13#10+
      '    WHERE sm.KOD_MATER = dnp.KOD_MATER   ) ,                              '#13#10+
      '  dnp.SUMMA1 = dnp.KOLICH*:KURS*                                          '#13#10+
      '  (SELECT pc.PRICE                                                        '#13#10+
      '    FROM SPRAV_MATER sm                                                   '#13#10+
//      '    LEFT JOIN view_price_col pc on sm.kod_mater=pc.kod_mater and pc.COL = :COL '#13#10+
      '    LEFT JOIN SELECT_PRICE_COL(''today'',sm.kod_mater,:COL) pc on         '#13#10+
      '                        (sm.kod_mater is not null and pc.col=:COL)   '#13#10+
      '    WHERE sm.KOD_MATER = dnp.KOD_MATER   ) ,                              '#13#10+
      '  dnp.IND = 0,                                                            '#13#10+
      '  dnp.IND_PRICE =                                                         '#13#10+
      '  (SELECT pc.PRICE                                                        '#13#10+
      '    FROM SPRAV_MATER sm                                                   '#13#10+
//      '    LEFT JOIN view_price_col pc on sm.kod_mater=pc.kod_mater and pc.COL = :COL '#13#10+
      '    LEFT JOIN SELECT_PRICE_COL(''today'',sm.kod_mater,:COL) pc on         '#13#10+
      '                        (sm.kod_mater is not null and pc.col=:COL)   '#13#10+
      '    WHERE sm.KOD_MATER = dnp.KOD_MATER   ) ,                              '#13#10+
      '  dnp.IND_SUMMA = dnp.KOLICH*                                             '#13#10+
      '  (SELECT pc.PRICE                                                        '#13#10+
      '    FROM SPRAV_MATER sm                                                   '#13#10+
//      '    LEFT JOIN view_price_col pc on sm.kod_mater=pc.kod_mater and pc.COL = :COL '#13#10+
      '    LEFT JOIN SELECT_PRICE_COL(''today'',sm.kod_mater,:COL) pc on         '#13#10+
      '                        (sm.kod_mater is not null and pc.col=:COL)   '#13#10+
      '    WHERE sm.KOD_MATER = dnp.KOD_MATER   )                                '#13#10+
      '                                                                          '#13#10+
      'where dnp.DOCRECNO = :RECID                                               '#13#10+
      '  and dnp.BASEID   = :BASEID                                              ';
  var
    aKURS      : double;
  begin
    // проставляю все цены по накладной по колонке
    try
      // апдейчу цены
      qr.Close;
      qr.SQL.Text:= SQLSelDocNakl;
      qr.ParamByName('RECID' ).AsInteger := aRECID;
      qr.ParamByName('BASEID').AsInteger := aBASEID;
      qr.ExecQuery;
      aKURS       := qr.FN('KURS').AsDouble;
      qr.Close;
      qr.SQL.Text:= SQLUpdatePriceToCol;
      qr.ParamByName('RECID' ).AsInteger     := aRECID;
      qr.ParamByName('BASEID').AsInteger     := aBASEID;
      qr.ParamByName('COL').AsInteger        := aCOL;
      qr.ParamByName('KURS').AsDouble        := aKURS;
      qr.ExecQuery;
      qr.Close;        
    except
      on e:Exception do
        ShowMessage('Не удалось установить цены в накладной по '+
                    IntToStr(aCOL)+' колонке:'#13#10+e.Message);
    end;
  end;

function GetReturnType(aRECID,aBASEID : integer):Integer;
const
  sQueryText =
    ' select '+
    ' coalesce(dtn.COST_EXT_EXPEDITION,0) COST '+
    ' from doc_trans_nakl_pos dtnp '+
    ' inner join  doc_trans_nakl dtn on (dtn.recid = dtnp.docrecno and  dtn.baseid = dtnp.baseid) '+
    ' left join sprav_dk sdk on (sdk.kod_dk = dtn.dk_to) '+
    ' where '+
    '     dtnp.nakl_recid = :nakl_recid '+
    ' and dtnp.nakl_baseid = :nakl_baseid ';
begin

  try
    qr.Close;
    qr.SQL.Text:= sQueryText;
    qr.ParamByName('nakl_recid' ).AsInteger := aRECID;
    qr.ParamByName('nakl_baseid').AsInteger := aBASEID;
    qr.ExecQuery;
    if qr.FN('COST').AsDouble>0 then Result:=3
    else Result:=4;

  except
    Result:=4;
  end;
end;
procedure SetPresent;// GetReturnType(aRECID,aBASEID : integer):Integer;
const
  sQueryText =
    ' select count(*) from GET_DK_NALOG_NUMBER(:DK_FROM,:DOCDATE) gn WHERE coalesce(NALOG_NUMBER,0)<>0 and coalesce(PDV_SVIDOCTVO,0)<>0 ';

begin
  if ((DocType='ПНк'+SelBalance.Value) and (IntfMegaDBCommon.GetCountry = iccUkraine)) then
    begin
      qr.Close;
      qr.SQL.Text:= sQueryText;
      qr.ParamByName('DK_FROM').AsFloat := Nakl.fieldDK_FROM.AsFloat;
      qr.ParamByName('DOCDATE').AsDateTime := Nakl.fieldOPERDATE.AsDateTime;
      qr.ExecQuery;
      if qr.Fields[0].AsInteger=0 then
        begin
           qr.Close;
           qr.SQL.Text:= 'execute procedure UPDATE_NAKL_PRESENT(1,:NAKL_RECID,:NAKL_BASEID,1); ';
           //'UPDATE DOC_NAKL SET PRESENT = 1 WHERE RECID = :NAKL_RECID and BASEID = :NAKL_BASEID ;';
           qr.ParamByName('NAKL_RECID').AsInteger := Nakl.fieldRECID.AsInteger;
           qr.ParamByName('NAKL_BASEID').AsInteger := Nakl.fieldBASEID.AsInteger;
           qr.ExecQuery;
           qr.transaction.CommitRetaining;
        end;
    end;
end;


var
checkRest262, checkRest282, RestKolich : double;
  NaklWholeSumm,NewDK_C,ZMCSumma : double;
  NaklListForPriemAct,ZMTDoc : String;
  dmPrintRetNakl : TdmPrintRetNakl2;
  KolNakl,K,Cicle,C:Integer;
  Res:Boolean;



begin

  ZMCSumma :=0;
  ZMC:='';
 { TypeReturn := StrToInt(VarToStr(edReturnTypeId.EditValue));
  if TypeReturn = 27 then   //[gsa:19092020]
  //if (qrCauseSpravType.FieldByName('NEED_MORE_DOC').AsInteger = 1) then
  //! нужно переделать на признак, если добавятся еще такие возвраты
     begin  // создаем дополнительные накладные - перенос с баланса на другой баланс
      listRecid:='3636748,3636749,';
      BASEID_S:='201';
      if (listRECID = '')  then
             begin
             ShowMessage('Error: Не получил список накладных, listRECID='+listRECID);
              Exit;
             end;
       qr.Transaction.Active := False;
     qr.Transaction.Active := True;
      qr.Close;
      qr.SQL.Text:='execute procedure CREATE_NAKL_FOR_RETURN(:TypeReturn,(:R),:B)';
      qr.ParamByName('R').Value:=listRECID;
      qr.ParamByName('B').AsInteger:=StrToInt(BASEID_S);
      qr.ParamByName('TypeReturn').Value:= TypeReturn ;
      qr.ExecProc;
      qr.Transaction.CommitRetaining;
      end;

   }

 if (IntfMegaDBCommon.GetCountry = iccUkraine) and ((edNotes.Text='') or (VarIsNull(edReturnCauseId.EditValue))) then
  begin
    if  (edNotes.Text='') then
     ShowMessage('Укажите примечание')
    else
     ShowMessage('Выберите тип возврата');
    Exit;
  end;
 if VarIsNull(edReturnTypeId.EditValue) then
  begin
    ShowMessage('Выберите тип возврата');
    Exit;
  end
 else
  {//*** Если числовое, то вернем значение}
  if VarIsOrdinal(edReturnTypeId.EditValue) then
   TypeReturn := StrToInt(VarToStr(edReturnTypeId.EditValue))
  else
   begin
     ShowMessage('Выберите тип возврата');
     Exit;
   end;
 if IntfMegaDBCommon.GetCountry = iccRussia then
  begin
    if (TypeReturn=11) AND (KOD_EXP_DK=0) then
     begin
       ShowMessage('Выберите Экспедитора');
       Exit;
     end;
    if (TypeReturn=14) then
     if (not NDSandLic(true)) then
      begin
        ShowMessage('Клиент не является плательщиком НДС');
        Exit;
      end;
    if (TypeReturn=15) then
     if (NDSandLic(true)) then
      begin
        ShowMessage('Клиент является плательщиком НДС');
        Exit;
      end;
   end
  else
   begin
     if (TypeReturn in [7,8,21,22,23,24]) then
      if ((KOD_EXP_DK=0) or VarIsNull(cmbTTDK.EditValue)) then
       begin
         ShowMessage('Выберите Дебитора');
         Exit;
       end
      else
       begin
         TTArr := cmbTTDK.EditValue;
         if (not VarIsNull(TTArr[0]))and(not VarIsNull(TTArr[1])) then
          begin
            qr.Close;
            qr.SQL.Text:='SELECT first 1 dga.kod_dk kod_ta '#13#10+
                         ' FROM distr_select_tt_distr_info(:OPERDATE, null, null, null, null, null, :OUTLET_RECID, :OUTLET_BASEID, null,null,null,null,null,null,null,null,null,null,1,0,null,1,null,1) dst '#13#10+
                         ' left join distr_get_area_agent_info(dst.area_id,dst.area_baseid,:OPERDATE) dga on (1=1) ';
            qr.ParamByName('OPERDATE').AsString := 'TODAY';
            qr.ParamByName('OUTLET_RECID').AsInteger := TTArr[0];
            qr.ParamByName('OUTLET_BASEID').AsInteger := TTArr[1];
            qr.ExecQuery;
            if (TypeReturn <> 27) then
             NewDK_C:= qr.FN('kod_ta').AsFloat;
          end
         else
          begin
            ShowMessage('Выберите Торговую точку');
            Exit;
          end
       end;
   end;
  //Проверяем ЗМЦ
  if IntfMegaDBCommon.GetCountry = iccUkraine then
   begin
     cdsMain.First;
     while not cdsMain.Eof do
      begin
       if (cdsMainKOLICH_MY.AsInteger > 0) and (cdsMainBALANCE_KOD.AsInteger=IntfMegaCommon.GetMainFirmBalanceKod) then
        begin
          ZMTDoc :='';
          qr.Close;
          qr.SQL.Text:= ' select DISTINCT dn_par.docnumber DN_PAR,dn_par.operdate OD_PAR,dn.docnumber DN,dn.operdate OD,dnp.kolich,dnp.summa,dnp.IND_SUMMA, sm.name_mater,dn.summa_doc_curr_nds,ldo.opl_recid,ldo.opl_baseid '#13#10+
                        ' from link_doc_opl ldo '#13#10+
                        ' left join doc_nakl dn on (dn.recid = ldo.opl_recid and dn.baseid = ldo.opl_baseid) '#13#10+
                        ' left join doc_nakl_pos dnp on (dnp.docrecno = dn.recid and dnp.baseid = dn.baseid and dnp.kod_mater=:KOD_MATER) '#13#10+
                        ' left join doc_nakl dn_par on (dn_par.recid = ldo.parent_recid and dn_par.baseid = ldo.parent_baseid) '#13#10+
                        ' left join doc_nakl_pos dnp_par on (dnp_par.docrecno = ldo.parent_recid and dnp_par.baseid = ldo.parent_baseid and dnp_par.kod_mater=:KOD_MATER) '#13#10+
                        ' left join sprav_mater sm on (sm.kod_mater=dnp.kod_mater) '#13#10+
                        ' where ldo.parent_recid=:RECID  and ldo.parent_baseid=:BASEID and dn.doctype=:DOC_TYPE and dnp.kolich>=:KOLICH ';
          qr.ParamByName('KOD_MATER').AsFloat := cdsMainKOD_MATER.AsFloat;
          qr.ParamByName('RECID').AsInteger := cdsMainRECID.AsInteger;
          qr.ParamByName('BASEID').AsInteger := cdsMainBaseID.AsInteger;
          qr.ParamByName('DOC_TYPE').AsString := 'ЗМЦ'+ SelBalance.Value;
          qr.ParamByName('KOLICH').AsFloat := cdsMainKOLICH.AsFloat;
          qr.ExecQuery;
          while not qr.Eof do
           begin
             if qr.FN('IND_SUMMA').AsFloat<>0 then
              begin
                if ZMTDoc= '' then
                 ZMTDoc:='По накладной №'+qr.FN('DN_PAR').AsString+ ' от '+qr.FN('OD_PAR').AsString+
                         ' по ценности '+qr.FN('name_mater').AsString+
                         '. существует ЗМЦ от '+ZMTDoc+qr.FN('OD').AsString+
                         '  ' +FloatToStr(qr.FN('summa_doc_curr_nds').AsFloat)+' грн.'
                else
                 ZMTDoc:=ZMTDoc+', '+qr.FN('OD').AsString+'  ' +FloatToStr(qr.FN('summa_doc_curr_nds').AsFloat)+' грн.';
                ZMCSumma:=ZMCSumma+cdsMainKOLICH_MY.AsInteger*qr.FN('IND_SUMMA').AsFloat/qr.FN('kolich').AsFloat;
              end;
              qr.Next;
           end;
          if ZMTDoc<> '' then ZMC:= ZMC + ZMTDoc+ #13#10;
        end;
       cdsMain.Next;
      end;
     if ZMC<>'' then
      if messageDlg(ZMC+'Возврат будет проведён с учётом изменения цены!',
                    mtConfirmation, [mbYes, mbNo],0 ) <> mrYes then
    exit;
   end;

  // считаем общую сумму возврата
  NaklWholeSumm := 0;
  cdsMain.First;
  while not cdsMain.Eof do
  begin
    if (cdsMainKOLICH_MY.AsInteger > 0) then
      NaklWholeSumm := NaklWholeSumm + cdsMainKOLICH_MY.AsFloat * cdsMainPRICE_PDV.AsFloat;

      cdsMain.Next;
  end;

  // уираю фильтр, подсчитываю общую сумму возврата и
  // переспрашиваю о намерениях пользователя,  а вдруг передумает
  actClearFilter.Execute;
  if messageDlg('Общая сумма возврата составляет:'#13#10+
                Format('%8.2f (с НДС)',[NaklWholeSumm+ZMCSumma])+#13#10+
                'Вы уверены что хотите создать данный возврат?',
                mtConfirmation, [mbYes, mbNo],0 )  <> mrYes then
    exit;


  try
  lbm:= cdsMain.Bookmark;
  cdsMain.DisableControls;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  NaklListForPriemAct := '(1=2)';// false or ....  or ....  or ....  or ....

  if sePrintNaklCount.Value > 0 then
     dmPrintRetNakl := TdmPrintRetNakl2.Create(Self);

   //если переброс с формы на фому то проходим два раза первый созаем расходные вторым возвраты
   if (TypeReturn in [7,8])
   then Cicle:=2 else Cicle:=1;
    if (TypeReturn in [21,22,23,24]) then
      begin
        PrepareNaklDistinctCDS;
        cdsNaklDistinct.First;
        K:=3;
         firstcicle:=False;
        if not GetDocType(TypeReturn,cdsNaklDistinctKOD_OPER.AsInteger,cdsNaklDistinctGROUP_OPER.AsInteger,K-1,cdsNaklDistinctSCHET.AsString) then
          begin
            Nakl := TMegaObjDocNakl.Create(qrMain.DataBase, qrMain.Transaction);
            if CreateNaklHead(Balance,k-1) then
              begin
                if (TypeReturn in [21,24]) then
                  Nakl.fieldDK_FROM.AsFloat:=  IntfMegaCommon.GetPPDK
                else  Nakl.fieldDK_FROM.AsFloat:=  IntfMegaCommon.GetMainFirmDK;

              //Nakl.fieldDK_FROM.AsFloat     := qr.FieldByName('DK_FROM').AsFloat;
                Nakl.fieldDK_TO.AsFloat       := KOD_EXP_DK;
                Nakl.fieldAddrFrom.AsInteger  := qr.FieldByName('ADDR_FROM').AsInteger;
                Nakl.fieldDK_C.value :=NewDK_C;
                Nakl.fieldOTSR.AsInteger:=0;
                LinkDocsNak;
                Nakl.Post;
                Nakl.Transaction.CommitRetaining;
                while not cdsNaklDistinct.Eof do
                  try
                     // добавляю позиции //
                    CreateNaklPoses(false);
                  finally
                    cdsNaklDistinct.Next;
                  end;
                Nakl.Transaction.CommitRetaining;
                UpdatePriceToDK(Nakl.fieldRECID.AsInteger, Nakl.fieldBASEID.AsInteger,KOD_EXP_DK);
                 // провожу //
                Nakl.MakeProv;
                qrMain.Transaction.CommitRetaining;
                // печатаю внутренний документ
                try
                  dmPrintInternalDoc := TdmPrintInternalDoc.Create(Self);
                  dmPrintInternalDoc.SetProperties(False,True,1);
                  dmPrintInternalDoc.DocNakl.Transaction := Nakl.Transaction;
                  dmPrintInternalDoc.DocPos.Transaction := Nakl.Transaction;
                  dmPrintInternalDoc.Sum.Transaction := Nakl.Transaction;
                  dmPrintInternalDoc.PrintInternal(Nakl.fieldRECID.AsInteger, Nakl.fieldBASEID.AsInteger);
                finally
                  dmPrintInternalDoc.Free;
                end;
               // удаляю обьект-нокладную ..
                destroyObjs;
              end
            else destroyObjs;
          end;
      end;
    firstcicle:=true;




  for C:=1 to Cicle do
   begin
        firstcicle:=not (( (TypeReturn in [7,8])) and (firstcicle));

        // создаю сдс-ку в которой будут содержаться только номера накладных по кот. нужно делать возвраты
        PrepareNaklDistinctCDS;

        cdsNaklDistinct.First;

      while not cdsNaklDistinct.Eof do
       begin
        try
          try
            Res:=True;K:=1;
            //KolNakl количество создаваемых накладных
            if ((TypeReturn =12)) then KolNakl:=2 else KolNakl:=1;
            //Используется в первом цикле (создание расходных накладных) при переброске с формы на форму
            if ((TypeReturn in [7,8]))and (not firstcicle)then
            begin
              KolNakl:=3;
              K:=3;
            end;
            if (TypeReturn in [3,4]) then TypeReturn:=GetReturnType(cdsNaklDistinctRECID.Asinteger,cdsNaklDistinctBaseID.Asinteger);


            while K<=KolNakl do
            begin
                if (TypeReturn =16)  then
                   if (not NDSandLic(false)) then
                   begin
                     ShowMessage('У клиента нет оптовой лицензии для документа '+cdsNaklDistinctDOCNUMBER.AsString);
                     Res:=false;
                     inc(k);
                     Continue;
                   end;
                   if IntfMegaDBCommon.GetCountry = iccRussia then
                   if GetDocType(TypeReturn,0,0,K-1,'') then
                   begin
                       Res:=false;
                       inc(k);
                       Continue;
                   end;
                   if IntfMegaDBCommon.GetCountry = iccUkraine then
                   if GetDocType(TypeReturn,cdsNaklDistinctKOD_OPER.AsInteger,cdsNaklDistinctGROUP_OPER.AsInteger,K-1,cdsNaklDistinctSCHET.AsString)then
                   begin
                      Res:=false;
                      inc(k);
                      Continue;
                   end;

            if not (((TypeReturn=2) or((TypeReturn in [8,22,24])and (firstcicle)))and(IntfMegaDBCommon.GetCountry = iccUkraine)) then
            begin
              Nakl := TMegaObjDocNakl.Create(qrMain.DataBase, qrMain.Transaction);
              if CreateNaklHead(Balance,k-1) then
                begin
                  if IntfMegaDBCommon.GetCountry = iccUkraine then
                    begin
                     // if Balance=IntfMegaCommon.GetMainFirmBalanceKod then Nakl.fieldDK_TO.AsFloat:= IntfMegaCommon.GetMainFirmDK;
                     // if Balance=IntfMegaCommon.GetPPBalance then  Nakl.fieldDK_TO.AsFloat:= IntfMegaCommon.GetPPDK;

                      if (TypeReturn in [3,4])and(balance=IntfMegaCommon.GetPPBalance)  then
                        begin
                          Nakl.fieldNotes.AsString:='бой №'+Nakl.fieldDOCNUMBER.AsString+' '+ edSelDK.Text;
                          if (K=2) then
                            begin
                              Nakl.fieldDK_TO.AsFloat := 1017;
                              Nakl.fieldDK_FROM.AsFloat := IntfMegaCommon.GetPPDK;
                              Nakl.fieldPriceType.AsInteger := iptSpecial;
                            end;
                        end;
                      if (TypeReturn in [3,4])and(balance=IntfMegaCommon.GetMainFirmBalanceKod)and(KolNakl=1)  then KolNakl:=2;
                      if (TypeReturn in [7,8])and (not firstcicle)then
                        begin

                          if (TypeReturn=7)then
                             Nakl.fieldDK_FROM.AsFloat:=  IntfMegaCommon.GetPPDK
                             else  Nakl.fieldDK_FROM.AsFloat:=  IntfMegaCommon.GetMainFirmDK;
                          Nakl.fieldDK_TO.AsFloat       := qr.FieldByName('DK_TO').AsFloat;
                          Nakl.fieldAddrTo.AsInteger    := qr.FieldByName('ADDR_TO').AsInteger;
                          Nakl.fieldDK_C.value :=NewDK_C;
                          Nakl.fieldOTSR.AsInteger:=0;
                        end;
                      if (TypeReturn in [21,22,23,24])and (not firstcicle)then
                        begin
                          Nakl.fieldDK_FROM.AsFloat     := qr.FieldByName('DK_FROM').AsFloat;
                          Nakl.fieldDK_TO.AsFloat       := KOD_EXP_DK;
                          Nakl.fieldAddrFrom.AsInteger  := qr.FieldByName('ADDR_FROM').AsInteger;
                          Nakl.fieldDK_C.value :=NewDK_C;
                          Nakl.fieldOTSR.AsInteger:=0;


                        end;
                    end;

                  if IntfMegaDBCommon.GetCountry = iccRussia then
                    begin
                      Nakl.fieldOPERDATE.AsDateTime := Date;
                      Nakl.fieldDOCDATE.AsDateTime  := cdsNaklDistinctoperdate.AsDateTime;
                      case TypeReturn of
                        11:Nakl.fieldDK_TO.AsFloat:= KOD_EXP_DK;
                        12:if k=1 then
                             begin
                               //ООО ТД Мегаполис
                               Nakl.fieldDK_TO.AsFloat       := IntfMegaCommon.GetMainFirmDK;
                               NaklBaseID:=Nakl.fieldBASEID.AsInteger;
                               NaklRecID:=Nakl.fieldRECID.AsInteger;
                             end
                               else
                                 if k=2 then
                                   begin
                                     Nakl.fieldDOCDATE.AsDateTime  := Date;
                                     //ООО ТД Мегаполис
                                     Nakl.fieldDK_FROM.AsFloat:=IntfMegaCommon.GetMainFirmDK;
                                     //Перевозчик
                                     if KOD_PER_DK<>0 then
                                       begin
                                        Nakl.fieldDK_TO.AsFloat:= KOD_PER_DK;
                                        Nakl.fieldDK_C.value:=KOD_PER_DK;
                                       end
                                         else
                                           begin
                                             qr.Close;
                                             qr.SQL.Text:= sGetKODPer;
                                             qr.ParamByName('PARENT_RECID').AsInteger := cdsNaklDistinctRECID.Asinteger;
                                             qr.ParamByName('PARENT_BASEID').AsInteger := cdsNaklDistinctBaseID.Asinteger;
                                             qr.ExecQuery;
                                             Nakl.fieldDK_TO.AsFloat  := qr.FieldByName('dk_to').AsFloat;
                                             Nakl.fieldDK_C.value:= qr.FieldByName('dk_to').AsFloat;
                                           end;


                                   end;
                        13:Nakl.fieldDK_TO.AsFloat       := IntfMegaCommon.GetMainFirmDK;
                        14,15,16:
                           begin
                              Nakl.fieldDOCDATE.AsDateTime  := edNaklDate.Date;
                              //ООО ТД Мегаполис
                              Nakl.fieldDK_TO.AsFloat       := IntfMegaCommon.GetMainFirmDK;
                           end;
                        17: Nakl.fieldDK_TO.AsFloat       := IntfMegaCommon.GetMainFirmDK;
                      end;
                    end;

                  // линкую //
                  if not(( TypeReturn in [7,8,21,22,23,24])and (not firstcicle))then
                  LinkDocs(k)
                  else LinkDocsNak;
                  Nakl.Post;
                  nakl.Transaction.CommitRetaining;
                  // добавляю позиции //
                  if ((TypeReturn=12) and (k=1))or
                     ((TypeReturn in [3,4])and(Balance=IntfMegaCommon.GetMainFirmBalanceKod)and (k=1)) or
                     ((TypeReturn in [7,8,21,22,23,24])and (not firstcicle))then
                      CreateNaklPoses(false)
                    else
                      CreateNaklPoses;//(false);
                    nakl.Transaction.CommitRetaining;
                    if ((TypeReturn in [7,8,21,22,23,24])and (not firstcicle)) or
                       ((TypeReturn in [3,4])and(balance=IntfMegaCommon.GetPPBalance)and(K=2))
                       then
                          UpdatePriceToDK(Nakl.fieldRECID.AsInteger, Nakl.fieldBASEID.AsInteger,KOD_EXP_DK);
                  // провожу //
                  Nakl.MakeProv;
                  SetPresent;

                  listRECID:=listRECID+''+IntToStr(Nakl.fieldRECID.AsInteger)+',';    //[gsa:22052020]
                  BASEID_S:=IntToStr(Nakl.fieldBASEID.AsInteger);                     //[gsa:22052020]

                  qrMain.Transaction.CommitRetaining;
                  if (KORR=1) then
                    begin
                      // создаю корректировочную налоговую накладную
                      CreateKorrNN;
                      qrMain.Transaction.CommitRetaining;
                    end;

                   if (TypeReturn in [1,2,5,6,9])or
                      ((TypeReturn in [3,4]) and (k=1)) or
                      ((TypeReturn in [7,8,21,22,23,24])and (k<>3))

                      then
                        begin
                          NaklListForPriemAct := NaklListForPriemAct +
                          'or((dn.RECID='+Nakl.fieldRECID.AsString+
                          ')and(dn.BASEID='+Nakl.fieldBASEID.AsString+'))';
                          if (edZayavka.Text<>'') and (edStiker.Text<>'') then
                            SetStiker(Nakl.fieldRECID.AsInteger,Nakl.fieldBASEID.AsInteger);

                        end;


                    if ((TypeReturn in [3,4]) and (k=2)) or
                    ((TypeReturn in [7,8,21,22,23,24])and (k=3))   then
                      // печатаю внутренний документ
                         try
                           dmPrintInternalDoc := TdmPrintInternalDoc.Create(Self);
                           dmPrintInternalDoc.SetProperties(False,True,1);
                           dmPrintInternalDoc.DocNakl.Transaction := Nakl.Transaction;
                           dmPrintInternalDoc.DocPos.Transaction := Nakl.Transaction;
                           dmPrintInternalDoc.Sum.Transaction := Nakl.Transaction;
                           dmPrintInternalDoc.PrintInternal(Nakl.fieldRECID.AsInteger, Nakl.fieldBASEID.AsInteger);
                         finally
                           dmPrintInternalDoc.Free;
                         end;


                  // причина возврата
                   if Cause>0 then
                     AddReturnCause(Nakl.fieldRECID.AsInteger, Nakl.fieldBASEID.AsInteger,KOD_EXP_DK);

                    // удаляю обьект-нокладную ..
                    destroyObjs;
                end
                  else
                    begin
                      //   cdsNaklDistinct.Next;
                      destroyObjs;
                       inc(k);
                      continue;
                    end;
             end
            else
              begin
                    //Возврат Ф2 на 300 баланс

                    //if (TypeReturn in [3])and(balance=IntfMegaCommon.GetPPBalance)  then KolNakl:=2;

                    Nakl := nil;
                    cdsMain.First;
                    while not cdsMain.Eof do
                    begin
                      if (cdsMainKOLICH_MY.AsInteger > 0) and
                         (cdsMainRECID.AsInteger = cdsNaklDistinctRECID.Asinteger) and
                         (cdsMainBaseID.AsInteger = cdsNaklDistinctBaseID.Asinteger)and
                         (cdsMainSCHET.AsString = cdsNaklDistinctSCHET.AsString) then
                      begin
                        // проверяю есть ли остаток на 262/282 счетах в балансе мегаполиса у ЧП

                        qrGetOstatok.Close;
                        qrGetOstatok.ParamByName('SCHET').AsString := '262';
              //          qrGetOstatok.ParamByName('CFO').AsString := '1';
                        qrGetOstatok.ParamByName('RECID').AsInteger := cdsNaklDistinctRECID.Asinteger;
                        qrGetOstatok.ParamByName('BASEID').AsInteger := cdsNaklDistinctBaseID.Asinteger;
                        qrGetOstatok.ParamByName('KOD_MATER').AsFloat := cdsMainKOD_MATER.AsFloat;
                        qrGetOstatok.ParamByName('BALANCE_KOD').AsInteger := IntfMegaCommon.GetMainFirmBalanceKod;
                        //qrGetOstatok.ParamByName('PPDK').AsFloat := IntfMegaCommon.GetPPDK;
                        qrGetOstatok.ParamByName('OPERDATE').AsString := 'TODAY';
                        qrGetOstatok.ExecQuery();
                        checkRest262 := qrGetOstatok.FieldByName('OSTATOK').AsFloat;
                        qrGetOstatok.Close;
                        qrGetOstatok.ParamByName('SCHET').AsString := '281/06';
                        //qrGetOstatok.ParamByName('CFO').AsString := '1';
                        qrGetOstatok.ParamByName('RECID').AsInteger := cdsNaklDistinctRECID.Asinteger;
                        qrGetOstatok.ParamByName('BASEID').AsInteger := cdsNaklDistinctBaseID.Asinteger;
                        qrGetOstatok.ParamByName('KOD_MATER').AsFloat := cdsMainKOD_MATER.AsFloat;
                        qrGetOstatok.ParamByName('BALANCE_KOD').AsInteger := IntfMegaCommon.GetMainFirmBalanceKod;
                        //qrGetOstatok.ParamByName('PPDK').AsFloat := IntfMegaCommon.GetPPDK;
                        qrGetOstatok.ParamByName('OPERDATE').AsString := 'TODAY';
                        qrGetOstatok.ExecQuery();
                        checkRest282 := qrGetOstatok.FieldByName('OSTATOK').AsFloat;
                        qrGetOstatok.Close;
                        //!!!!!!!!!!!!

                        // есть остаток и накладная не создана
                        if (Nakl=nil)and((checkRest262>0)or(checkRest282>0))  then
                        begin
                          // создание возвратной накладной
                          Nakl := TMegaObjDocNakl.Create(qrMain.DataBase, qrMain.Transaction);

                          // параметры исходной накладной
                          CreateNaklHead(Balance,0);//((StrToInt(SelBalance.Value)));

                          // линкую //
                          LinkDocs(0);

                          Nakl.Post;
              //            UpdatePriceType;
                        end;

                        if (checkRest262>0)and(cdsMainKOLICH_MY.AsFloat>0) then
                        begin
                          if checkRest262 > cdsMainKOLICH_MY.AsFloat then
                            RestKolich := cdsMainKOLICH_MY.AsFloat
                           else
                            RestKolich := checkRest262;

                          qr.SQL.Text:= sqlSelDocNaklPos;
                          qr.Params.ByName['RECID'].AsInteger  := cdsMainRECID.Asinteger;
                          qr.Params.ByName['BASEID'].AsInteger := cdsMainBaseID.Asinteger;
                          qr.Params.ByName['KOD_MATER'].AsFloat:= cdsMainKOD_MATER.AsFloat;

                          qr.ExecQuery;

                          Nakl.GetQuery.Close;
                          Nakl.GetQuery.SQL.Text := sqlInsDocPos;
                          Nakl.GetQuery.Params.ByName['DOCRECNO'].AsInteger:= Nakl.fieldRECID.AsInteger;
                          Nakl.GetQuery.Params.ByName['BASEID'].AsInteger  := Nakl.FieldBaseID.AsInteger;
                          Nakl.GetQuery.Params.ByName['KOD_MATER'].AsFloat := cdsMainKOD_MATER.AsFloat;
                          Nakl.GetQuery.Params.ByName['KOLICH'].AsFloat    := RestKolich;

                          sum1 := RestKolich*qr.FieldByName('SUMMA1').AsFloat/qr.FieldByName('KOLICH').AsFloat;
                          Nakl.GetQuery.Params.ByName['SUMMA1'].AsFloat    := sum1;
                          Nakl.GetQuery.Params.ByName['SUMMA'].AsFloat     := sum1 / qr.FieldByName('KURS').AsFloat;

                          sum1 := RestKolich*qr.FieldByName('IND_SUMMA').AsFloat/qr.FieldByName('KOLICH').AsFloat;
                          Nakl.GetQuery.Params.ByName['IND'].AsFloat       := qr.FieldByName('IND').AsFloat;
                          Nakl.GetQuery.Params.ByName['IND_PRICE'].AsFloat := qr.FieldByName('IND_PRICE').AsFloat;
                          Nakl.GetQuery.Params.ByName['IND_SUMMA'].AsFloat := sum1;
                          //PDV, PARTY
                          Nakl.GetQuery.Params.ByName['PDV'].AsString   := qr.FieldByName('PDV').AsString;
                          Nakl.GetQuery.Params.ByName['PARTY'].AsString := qr.FieldByName('PARTY').AsString;

                          Nakl.GetQuery.ExecQuery;

                          lRecID:=Nakl.GetQuery.FieldByName('recid').AsInteger;
                          if (qr.FieldByName('REGID_FORM_A').AsString<>'')or(qr.FieldByName('REGID_FORM_B').AsString<>'') then
                          begin
                             Nakl.GetQuery.Close;
                             Nakl.GetQuery.SQL.Text := sqlInsDocPosAddProp;
                             Nakl.GetQuery.Params.ByName['recid'].AsInteger   := lRecID;
                             Nakl.GetQuery.Params.ByName['BASEID'].AsInteger  := Nakl.FieldBaseID.AsInteger;
                             Nakl.GetQuery.Params.ByName['KOD_MATER'].AsFloat := cdsMainKOD_MATER.AsFloat;
                             Nakl.GetQuery.Params.ByName['REGID_FORM_A'].AsString := qr.FieldByName('REGID_FORM_A').AsString;
                             Nakl.GetQuery.Params.ByName['REGID_FORM_B'].AsString := qr.FieldByName('REGID_FORM_B').AsString;
                             Nakl.GetQuery.ExecQuery;
                          end;

                          qr.Close;

                          // проставляю в количестве нолики
                          cdsMain.Edit;
                          cdsMainKOLICH.AsFloat    := cdsMainKOLICH.AsFloat - RestKolich;
                          cdsMainKOLICH_MY.AsFloat := cdsMainKOLICH_MY.AsFloat - RestKolich;
                          cdsMain.Post;
                        end; // вставляю позицию для 28 счета

                        if (checkRest282>0)and(cdsMainKOLICH_MY.AsFloat>0) then
                        begin
                          if checkRest282 > cdsMainKOLICH_MY.AsFloat then
                            RestKolich := cdsMainKOLICH_MY.AsFloat
                           else
                            RestKolich := checkRest282;

                          qr.SQL.Text:= sqlSelDocNaklPos;
                          qr.Params.ByName['RECID'].AsInteger  := cdsMainRECID.Asinteger;
                          qr.Params.ByName['BASEID'].AsInteger := cdsMainBaseID.Asinteger;
                          qr.Params.ByName['KOD_MATER'].AsFloat:= cdsMainKOD_MATER.AsFloat;

                          qr.ExecQuery;

                          Nakl.GetQuery.Close;
                          Nakl.GetQuery.SQL.Text := sqlInsDocPos;
                          Nakl.GetQuery.Params.ByName['DOCRECNO'].AsInteger:= Nakl.fieldRECID.AsInteger;
                          Nakl.GetQuery.Params.ByName['BASEID'].AsInteger  := Nakl.FieldBaseID.AsInteger;
                          Nakl.GetQuery.Params.ByName['KOD_MATER'].AsFloat := cdsMainKOD_MATER.AsFloat;
                          Nakl.GetQuery.Params.ByName['KOLICH'].AsFloat    := RestKolich;

                          sum1 := RestKolich*qr.FieldByName('SUMMA1').AsFloat/qr.FieldByName('KOLICH').AsFloat;
                          Nakl.GetQuery.Params.ByName['SUMMA1'].AsFloat    := sum1;
                          Nakl.GetQuery.Params.ByName['SUMMA'].AsFloat     := sum1 / qr.FieldByName('KURS').AsFloat;

                          sum1 := RestKolich*qr.FieldByName('IND_SUMMA').AsFloat/qr.FieldByName('KOLICH').AsFloat;
                          Nakl.GetQuery.Params.ByName['IND'].AsFloat       := qr.FieldByName('IND').AsFloat;
                          Nakl.GetQuery.Params.ByName['IND_PRICE'].AsFloat := qr.FieldByName('IND_PRICE').AsFloat;
                          Nakl.GetQuery.Params.ByName['IND_SUMMA'].AsFloat := sum1;
                          //PDV, PARTY
                          Nakl.GetQuery.Params.ByName['PDV'].AsString   := qr.FieldByName('PDV').AsString;
                          Nakl.GetQuery.Params.ByName['PARTY'].AsString := qr.FieldByName('PARTY').AsString;

                          Nakl.GetQuery.ExecQuery;
                          qr.Close;

                          // проставляю в количестве нолики
                          cdsMain.Edit;
                          cdsMainKOLICH.AsFloat := cdsMainKOLICH.AsFloat - RestKolich;
                          cdsMainKOLICH_MY.AsFloat := cdsMainKOLICH_MY.AsFloat - RestKolich;
                          cdsMain.Post;
                          //
                        end; // вставляю позицию для 282 счета

                      end;
                      cdsMain.Next;
                    end;

                    // доделываем накладную, если есть
                    if Nakl <> nil  then
                    begin
                      qrMain.Transaction.CommitRetaining;

                      // провожу
                      Nakl.MakeProv;
                      qrMain.Transaction.CommitRetaining;


                      NaklListForPriemAct := NaklListForPriemAct +
                      'or((dn.RECID='+Nakl.fieldRECID.AsString+
                       ')and(dn.BASEID='+Nakl.fieldBASEID.AsString+'))';

                      // причина возврата
                      if Cause>0 then
                        AddReturnCause(Nakl.fieldRECID.AsInteger, Nakl.fieldBASEID.AsInteger,KOD_EXP_DK);

                      // удаляю обьект-нокладную
                      destroyObjs;
                    end;

                    RestKolich := 0;
                    cdsMain.First;
                    while not cdsMain.Eof do
                    begin
                      if (cdsMainKOLICH_MY.AsInteger > 0) and
                         (cdsMainRECID.AsInteger = cdsNaklDistinctRECID.Asinteger) and
                         (cdsMainBaseID.AsInteger = cdsNaklDistinctBaseID.Asinteger)and
                         (cdsMainSCHET.AsString = cdsNaklDistinctSCHET.AsString) then
                        begin
                          RestKolich := cdsMainKOLICH_MY.AsInteger;
                          Break;
                        end;

                      cdsMain.Next;
                    end;

                    if Nakl <> nil then //[gsa:09062020]
                        begin
                         listRECID:=listRECID+''+IntToStr(Nakl.fieldRECID.AsInteger)+',';    //[gsa:22052020]
                         BASEID_S:=IntToStr(Nakl.fieldBASEID.AsInteger);                     //[gsa:22052020]
                        end ;

                    // делаю еще одну накладную по оставшимся позициям, для которой не важен счет
                    if RestKolich > 0 then
                    begin
                            if GetDocType(TypeReturn,cdsNaklDistinctKOD_OPER.AsInteger,cdsNaklDistinctGROUP_OPER.AsInteger,1,cdsNaklDistinctSCHET.AsString)then
                              begin
                                Res:=false;
                                inc(k);
                                Continue;
                              end;
                      // создание возвратной накладной
                      Nakl := TMegaObjDocNakl.Create(qrMain.DataBase, qrMain.Transaction);

                      // параметры исходной накладной
                      if not CreateNaklHead(Balance,0) then
                      begin
                        cdsNaklDistinct.Next;
                        destroyObjs;
                        inc(k);
                        continue;
                      end;

                      // линкую //
                      LinkDocs(0);

                      Nakl.Post;

                      // добавляю позиции //
                      CreateNaklPoses;
                      qrMain.Transaction.CommitRetaining;

                      // провожу
                      Nakl.MakeProv;
                      qrMain.Transaction.CommitRetaining;


                      NaklListForPriemAct := NaklListForPriemAct +
                      'or((dn.RECID='+Nakl.fieldRECID.AsString+
                       ')and(dn.BASEID='+Nakl.fieldBASEID.AsString+'))';
                      // причина возврата
                      if Cause>0 then
                         AddReturnCause(Nakl.fieldRECID.AsInteger, Nakl.fieldBASEID.AsInteger,KOD_EXP_DK);

                      // удаляю обьект-нокладную
                      destroyObjs;
                    end;
                end;

          inc(K);
        end;

       except
          on E:Exception do
           begin
             Res:=false;
              MessageBox(0,
              PChar('Ошибка при создании возврата с накладной'#13#10+
                      '#'+cdsNaklDistinct.FieldByName('DOCNUMBER').AsString+
                      ' за '+cdsNaklDistinct.FieldByName('OPERDATE').AsString+#13#10+
                      E.Message),
              PChar(''),
              MB_ICONWARNING or MB_OK);
            end;
       end
      finally
       cdsNaklDistinct.Next;
      end;
    end; // по накладным
   end; //по циклам

   if TypeReturn = 27 then
     begin  // создаем дополнительные накладные - перенос с баланса на другой баланс
      if (listRECID = '')  then
       begin
         ShowMessage('Error: Не получил список накладных, listRECID='+listRECID);
         Exit;
       end;
      TTArr := cmbTTDK.EditValue;
      qr.Transaction.Active := False;
      qr.Transaction.Active := True;
      qr.Close;
      qr.SQL.Text:='execute procedure CREATE_NAKL_FOR_RETURN(:TypeReturn,(:R),:B, :outlet_recid, :outlet_baseid)';
      qr.ParamByName('R').Value:=listRECID;
      qr.ParamByName('B').AsInteger:=StrToInt(BASEID_S);
      qr.ParamByName('TypeReturn').Value:= TypeReturn;
      qr.ParamByName('outlet_recid').AsInteger:= TTArr[0];
      qr.ParamByName('outlet_baseid').AsInteger:= TTArr[1];
      qr.ExecProc;
      qr.Transaction.CommitRetaining;
     end;

    if sePrintNaklCount.Value > 0 then
     dmPrintRetNakl.Destroy;

  finally
    Screen.Cursor := OldCursor;
    cdsMain.Bookmark:= lbm;
    cdsMain.EnableControls;
  end;

  CheckSaldo;

  if (chbPrintPriemAct.Checked)and (StrToInt(SelBalance.Value) = IntfMegaCommon.GetMainFirmBalanceKod) then
   begin
     if IntfMegaAccessManager.GetUserRole = 'DEVELOPER' then
      dmMegaReports.MyDesign(91,Date,NaklListForPriemAct )
     else
      dmMegaReports.MyPrint(91,Date,NaklListForPriemAct );
   end;

  //Накладные созданы
  if Res then
   MessageDlg('Накладные успешно созданы!',mtInformation,[mbOk],0)
  else
   MessageDlg('Создание накладных завершено, но не все накладные созданы!',mtInformation,[mbOk],0)
end;


end.

