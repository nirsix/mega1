// ------------------------------------
// project : Megapolis Money
// --
// module  : план товарно-транспортных накладных
// author  : Dmitry Lutsenko (lutsenko_d@yahoo.com)
// --
// created       :
// last modified :
// ------------------------------------
unit ufmTTNPlan;

interface
{$i mega.inc}
uses
  Db,
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Dialogs,
  Forms,
  Menus,
  ExtCtrls,
  ActnList,
  {$IFDEF RX_LIB_2_7_7}rxToolEdit,rxPlacemnt,{$ELSE}ToolEdit,ufmSendMail,Placemnt,{$endif}
  Buttons,
  StdCtrls,
  ComCtrls,
  Mask,
  DBCtrls,
  Gauges,RegExpr,rxStrUtils,ComObj {$ifdef D6+},Variants {$endif},

  RXDBCtrl,
  RXCtrls,
  FIBDatabase,
  FIBDataSet,
  DBGridEh,
  FR_DSet,
  FR_DBSet,
  FR_Class,
  DBSumLst,
  cxButtons,

  uConst,
  uTypes,
  uUtils,
  uMegaIntf,
  uMegaSelectDK,
  uMegaDatePanel,
  uMegaDSTTNPlan,
  uMegaPopupSelect,
  uMegaCustomSelect,
  uMegaCustomDialog,
  uMegaSelTransporter,
  uMegaDSTTNPlanPositions,
  uMegaCustomSelectDB,
  uMegaComboSelect,
  uMegaSelTradeDelegate,
  uMegaForms, FIBQuery, RxLookup, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, cxPC, uMegaSelCarrier,
  uMegaRDataSet, pFIBQuery, pFIBDatabase, pFIBDataSet, dxBar, uUtilsEh,
  uMegaDSSortingLotPositions, uMegaDSSortingLot, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxMaskEdit, cxCalendar, cxTextEdit, uMegaSelCFO, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter, cxContainer,
  cxSpinEdit, cxLabel, cxDBLabel, cxCheckBox, frxClass, frxFIBComponents,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLookAndFeels, udmExportTTNToFile, ADODB, InvokeRegistry, TypInfo, WebServExp, WSDLBind,
  XMLSchema, WSDLPub, Rio, SOAPHTTPClient, frXMLExl, wsJointLogistic_V3, uJointLogistic, Types,
  cxShellBrowserDialog, cxNavigator, dxBarBuiltInMenu, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  TntDBCtrls, uMegaDSDocNakl, wsDocumentZayavkaNaTransport_V3 , uTocan
     
  ;

type
  TfmTTNPlan = class(TMegaForm)
    fdsNaklList2: TMegaDataSet;
    Transaction: TMegaTransaction;
    dxBarManager: TdxBarManager;
    fs: TFormStorage;
    al: TActionList;
    pnCenter: TPanel;
    pnTop: TPanel;
    MegaDatePanel: TMegaDatePanel;
    pnDocNakl: TPanel;
    Splitter1: TSplitter;
    PnPlan: TPanel;
    lb: TLabel;
    Label1: TLabel;
    pcTTNPlan: TcxPageControl;
    dxTabSheet1: TcxTabSheet;
    actPlanAdd: TAction;
    dxBarButton1: TdxBarButton;
    actPlanDelete: TAction;
    dxBarButton2: TdxBarButton;
    pnPlanItem: TPanel;
    pnPlanItemTop: TPanel;
    pnPlanItemBottom: TPanel;
    dsNaklList: TDataSource;
    fdsNaklList2RECID: TIntegerField;
    fdsNaklList2BASEID: TIntegerField;
    fdsNaklList2OPERDATE: TDateTimeField;
    fdsNaklList2DOCTYPE: TFIBStringField;
    fdsNaklList2DOCNUMBER: TIntegerField;
    fdsNaklList2GROUP_OPER: TIntegerField;
    fdsNaklList2KOD_OPER: TIntegerField;
    fdsNaklList2SUMMA1: TFloatField;
    fdsNaklList2DK_TO: TFloatField;
    fdsNaklList2DK_C: TFloatField;
    fdsNaklList2GROUP_NAME: TFIBStringField;
    fdsNaklList2NAME_OPER: TFIBStringField;
    fdsNaklList2SHORTNAME_DK_TO: TFIBStringField;
    fdsNaklList2SHORTNAME_DK_C: TFIBStringField;
    fdsNaklList2NAS_P_ID: TIntegerField;
    fdsNaklList2COUNTRY_ID: TIntegerField;
    fdsNaklList2NAS_P_NAME: TFIBStringField;
    fdsNaklList2ADDRESS: TFIBStringField;
    fdsNaklList2WEIGHT_TONN: TFloatField;
    fdsNaklList2TTN_NUMBER: TIntegerField;
    fdsNaklList2TTN_DOCTYPE: TFIBStringField;
    report: TMegaRDataSet;
    actNaklAdd: TAction;
    actNaklRemove: TAction;
    dsPlanPositions: TDataSource;
    actPlanRefresh: TAction;
    Label4: TLabel;
    edOutletCount: TEdit;
    pmNaklList: TPopupMenu;
    N1: TMenuItem;
    pmPlan: TPopupMenu;
    N2: TMenuItem;
    fdsNaklList2PLANNUMBER: TIntegerField;
    frReport: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    actReport: TAction;
    dxBarButton3: TdxBarButton;
    pnPlanHeader: TPanel;
    Splitter2: TSplitter;
    MegaSelTransporter: TMegaSelTransporter;
    MegaSelTruck: TMegaSelCarrier;
    MegaSelTrailer1: TMegaSelCarrier;
    MegaSelTrailer2: TMegaSelCarrier;
    dsPlan: TDataSource;
    MegaDSTTNPlan: TMegaDSTTNPlan;
    MegaDSTTNPlanPLANDATE: TDateTimeField;
    MegaDSTTNPlanPLANNUMBER: TIntegerField;
    MegaDSTTNPlanBASEID: TIntegerField;
    MegaDSTTNPlanTTN_RECID: TIntegerField;
    MegaDSTTNPlanTTN_BASEID: TIntegerField;
    MegaDSTTNPlanDOCTYPE: TFIBStringField;
    MegaDSTTNPlanROAD_LIST: TFIBStringField;
    MegaDSTTNPlanDK_FROM: TFloatField;
    MegaDSTTNPlanDK_TO: TFloatField;
    MegaDSTTNPlanCAR_SNUM: TFIBStringField;
    MegaDSTTNPlanCAR_TRAILER: TFIBStringField;
    MegaDSTTNPlanCAR_TRAILER2: TFIBStringField;
    MegaDSTTNPlanCAR_DRIVER: TFIBStringField;
    MegaDSTTNPlanDK_C: TFloatField;
    actPlanHeaderShow: TAction;
    pnPositions: TPanel;
    SpeedButton2: TcxButton;
    SpeedButton3: TcxButton;
    MegaDSTTNPlanPositions: TMegaDSTTNPlanPositions;
    MegaDSTTNPlanPositionsPLANDATE: TDateTimeField;
    MegaDSTTNPlanPositionsPLANNUMBER: TIntegerField;
    MegaDSTTNPlanPositionsBASEID: TIntegerField;
    MegaDSTTNPlanPositionsPOS_NUM: TIntegerField;
    MegaDSTTNPlanPositionsPOS_NUM_CITY: TIntegerField;
    MegaDSTTNPlanPositionsNAKL_RECID: TIntegerField;
    MegaDSTTNPlanPositionsNAKL_BASEID: TIntegerField;
    MegaDSTTNPlanPositionsOPERDATE: TDateTimeField;
    MegaDSTTNPlanPositionsDOCTYPE: TFIBStringField;
    MegaDSTTNPlanPositionsDOCNUMBER: TIntegerField;
    MegaDSTTNPlanPositionsGROUP_OPER: TIntegerField;
    MegaDSTTNPlanPositionsKOD_OPER: TIntegerField;
    MegaDSTTNPlanPositionsSUMMA1: TFloatField;
    MegaDSTTNPlanPositionsDK_TO: TFloatField;
    MegaDSTTNPlanPositionsDK_C: TFloatField;
    MegaDSTTNPlanPositionsGROUP_NAME: TFIBStringField;
    MegaDSTTNPlanPositionsNAME_OPER: TFIBStringField;
    MegaDSTTNPlanPositionsSHORTNAME_DK_TO: TFIBStringField;
    MegaDSTTNPlanPositionsSHORTNAME_DK_C: TFIBStringField;
    MegaDSTTNPlanPositionsNAS_P_ID: TIntegerField;
    MegaDSTTNPlanPositionsCOUNTRY_ID: TIntegerField;
    MegaDSTTNPlanPositionsNAS_P_NAME: TFIBStringField;
    MegaDSTTNPlanPositionsADDRESS: TFIBStringField;
    MegaDSTTNPlanPositionsWEIGHT_TONN: TFloatField;
    MegaDSTTNPlanPositionsTTN_NUMBER: TIntegerField;
    MegaDSTTNPlanPositionsTTN_DOCTYPE: TFIBStringField;
    actPlanPosUp: TAction;
    actPlanPosDown: TAction;
    SpeedButton4: TcxButton;
    SpeedButton5: TcxButton;
    SpeedButton6: TcxButton;
    SpeedButton7: TcxButton;
    SpeedButton1: TcxButton;
    actTTNCreate: TAction;
    dbcbType: TDBComboBox;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton8: TcxButton;
    actTTNDelete: TAction;
    fdsNaklList2CALC_OPERSTATUS: TFIBStringField;
    fdsNaklList2OPER_STATUS: TIntegerField;
    MegaDSTTNPlanPositionsOPER_STATUS: TIntegerField;
    MegaDSTTNPlanPositionsCALC_OPERSTATUS: TFIBStringField;
    fdsNaklList2KOLICH: TFloatField;
    MegaDSTTNPlanPositionsKOLICH: TFloatField;
    MegaDSTTNPlanPositionsPLACES_COUNT: TIntegerField;
    gridPlan: TDBGridEh;
    DBSumListTTNPlanPositions: TDBSumList;
    RxLabel9: TRxLabel;
    ceDK_C: TRxDBComboEdit;
    MegaSelDKDialogExpeditor: TMegaSelDKDialog;
    Label2: TLabel;
    dbedCAR_DRIVER: TDBEdit;
    MegaDSTTNPlanSHORTNAME_DK_C: TFIBStringField;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Label7: TLabel;
    Label3: TLabel;
    GaugeWeight: TGauge;
    Label8: TLabel;
    lbTonnage: TLabel;
    Label10: TLabel;
    lbPercent: TLabel;
    Label9: TLabel;
    lbNeedOutletCount: TLabel;
    Label11: TLabel;
    SpeedButton9: TcxButton;
    actTTNOpen: TAction;
    actRefreshData: TAction;
    dxBarButton4: TdxBarButton;
    actOpenNakl: TAction;
    N6: TMenuItem;
    actOpenNaklFromPlan: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    fdsNaklList2DELIV_TIME: TFIBStringField;
    fdsNaklList2DELIV_DATE: TDateTimeField;
    MegaDSTTNPlanPositionsDELIV_DATE: TDateTimeField;
    MegaDSTTNPlanPositionsDELIV_TIME: TFIBStringField;
    MegaDSTTNPlanPositionsBOX_COUNT: TFloatField;
    cxButton1: TcxButton;
    actFixMarshrut: TAction;
    fdsNaklList2BOX_COUNT: TFloatField;
    actRequest: TAction;
    dxBarButton5: TdxBarButton;
    cxButton2: TcxButton;
    qPlan_Count: TMegaQuery;
    fdsNaklList2N_TTN_MARSHRUT: TIntegerField;
    actNaclMAdd: TAction;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    actNaclRight: TAction;
    actNaclLeft: TAction;
    edTTN_Position: TRxDBLookupCombo;
    tblTTN_Migrat: TMegaDataSet;
    tblTTN_MigratPLANNUMBER: TIntegerField;
    MegaDSTTNPlanPositionsdesireddeliverytime: TFIBStringField;
    MegaDSTTNPlanPositionsRes_deliveryTime: TFIBStringField;
    fdsNaklList2Res_deliveryTime: TFIBStringField;
    fdsNaklList2desireddeliverytime: TFIBStringField;
    pnl_isTTNNAKL: TPanel;
    actTTNPrint: TAction;
    frTTNRep: TfrReport;
    frDBTTNPos: TfrDBDataSet;
    btnPrintTTN: TcxButton;
    btnDop: TcxButton;
    actDop_MarshrutsExecute: TAction;
    qrDop: TMegaQuery;
    Label12: TLabel;
    tran_Dop: TMegaTransaction;
    edDop: TEdit;
    gridNakl: TcxGrid;
    gridNaklLevel1: TcxGridLevel;
    gridNaklDBBandedTableView1: TcxGridDBBandedTableView;
    gridNaklDBBandedTableView1RECID: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1BASEID: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1OPERDATE: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1DOCTYPE: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1DOCNUMBER: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1CALC_OPERSTATUS: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1Res_deliveryTime: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1GROUP_OPER: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1KOD_OPER: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1DK_TO: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1DK_C: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1NAS_P_NAME: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1ADDRESS: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1WEIGHT_TONN: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1KOLICH: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1BOX_COUNT: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1SUMMA1: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1TTN_NUMBER: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1TTN_DOCTYPE: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1GROUP_NAME: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1NAME_OPER: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1SHORTNAME_DK_TO: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1SHORTNAME_DK_C: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1NAS_P_ID: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1COUNTRY_ID: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1N_TTN_MARSHRUT: TcxGridDBBandedColumn;
    lbPlod: TLabel;
    MegaDSTTNPlanPositionsBLANK_ID: TIntegerField;
    fdsNaklList2IS_HORECA: TIntegerField;
    MegaDSTTNPlanIS_HORECA: TIntegerField;
    cbDopHor: TCheckBox;
    actCreateSortLotCur: TAction;
    dxBarButton6: TdxBarButton;
    actPlanPosInfo: TAction;
    cxButton6: TcxButton;
    MegaDSTTNPlanPositionsinSortLot: TFIBIntegerField;
    MegaDSSortingLot: TMegaDSSortingLot;
    MegaDSSortingLotLOTDATE: TDateTimeField;
    MegaDSSortingLotLOTNUMBER: TIntegerField;
    MegaDSSortingLotBASEID: TIntegerField;
    MegaDSSortingLotCREATE_TIME: TMegaStringField;
    MegaDSSortingLotNAKL_RECID: TIntegerField;
    MegaDSSortingLotNAKL_BASEID: TIntegerField;
    MegaDSSortingLotPositions: TMegaDSSortingLotPositions;
    MegaDSSortingLotPositionsLOTDATE: TDateTimeField;
    MegaDSSortingLotPositionsLOTNUMBER: TIntegerField;
    MegaDSSortingLotPositionsBASEID: TIntegerField;
    MegaDSSortingLotPositionsNAKL_RECID: TIntegerField;
    MegaDSSortingLotPositionsNAKL_BASEID: TIntegerField;
    MegaDSSortingLotPositionsOPERDATE: TDateTimeField;
    MegaDSSortingLotPositionsDOCTYPE: TMegaStringField;
    MegaDSSortingLotPositionsDOCNUMBER: TIntegerField;
    MegaDSSortingLotPositionsGROUP_OPER: TIntegerField;
    MegaDSSortingLotPositionsKOD_OPER: TIntegerField;
    MegaDSSortingLotPositionsDK_FROM: TFloatField;
    MegaDSSortingLotPositionsDK_TO: TFloatField;
    MegaDSSortingLotPositionsDK_C: TFloatField;
    MegaDSSortingLotPositionsSUMMA1: TFloatField;
    MegaDSSortingLotPositionsKOLICH_: TFloatField;
    MegaDSSortingLotPositionsGROUP_NAME: TMegaStringField;
    MegaDSSortingLotPositionsNAME_OPER: TMegaStringField;
    MegaDSSortingLotPositionsSHORTNAME_DK_FROM: TMegaStringField;
    MegaDSSortingLotPositionsSHORTNAME_DK_TO: TMegaStringField;
    MegaDSSortingLotPositionsSHORTNAME_DK_C: TMegaStringField;
    dsMegaDSSortingLot: TDataSource;
    mTrans: TMegaTransaction;
    fdsNaklList2CATEGORY: TIntegerField;
    MegaDSSortingLotCFO: TIntegerField;
    MegaSelTradeDelegate: TMegaSelCFO;
    MegaDSSortingLotIS_PROV: TIntegerField;
    dxBarManagerBar3: TdxBar;
    btnCreateTempMarshrut: TdxBarButton;
    MegaDSTTNPlanIS_TEMP_MARSHRUT: TFIBSmallIntField;
    pn_MoveTempMarshr: TPanel;
    btnMoveTempMarshr: TcxButton;
    dtMoveTempMarshDate: TMegaDatePanel;
    lbMoveTempMarshNumber: TLabel;
    edMoveTempMarshNumber: TcxSpinEdit;
    qrTempMarsh: TMegaQuery;
    qrTempMarshUpd: TMegaQuery;
    actCreateTempMarshrut: TAction;
    fdsNaklList2KOD_CELL: TFIBStringField;
    gridNaklDBBandedTableView1KOD_CELL: TcxGridDBBandedColumn;
    actMoveSchetsToNakls: TAction;
    MegaDSTTNPlanPositionsKOD_CELL: TFIBStringField;
    fdsNaklList2VISITDATE: TFIBDateTimeField;
    fdsNaklList2VISITDATE2: TFIBDateTimeField;
    fdsNaklList2TYPE_NAME: TFIBStringField;
    gridNaklDBBandedTableView1VISITDATE: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1VISITDATE2: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1TYPE_NAME: TcxGridDBBandedColumn;
    fdsNaklList2DOC_CREATE: TFIBDateTimeField;
    gridNaklDBBandedTableView1DOC_CREATE: TcxGridDBBandedColumn;
    MegaDSTTNPlanRENT: TFIBFloatField;
    cxDBLabel1: TcxDBLabel;
    Label13: TLabel;
    DBSumListTTNPlan: TDBSumList;
    lbWholeRent: TLabel;
    MegaDSTTNPlanSUM_TTN_PDV: TFIBFloatField;
    MegaDSTTNPlanSUM_IN_NAKL: TFIBFloatField;
    actNaklAddSota: TAction;
    N9: TMenuItem;
    Label14: TLabel;
    cxDBLabel2: TcxDBLabel;
    MegaDSTTNPlanPositionsDISTANCE: TFIBFloatField;
    chbCheckRent: TcxCheckBox;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    actLinkTTtoSota: TAction;
    N13: TMenuItem;
    N14: TMenuItem;
    fdsNaklList2OUTLET_RECID: TFIBIntegerField;
    fdsNaklList2OUTLET_BASEID: TFIBIntegerField;
    MegaDSTTNPlanPositionsOUTLET_RECID: TFIBIntegerField;
    MegaDSTTNPlanPositionsOUTLET_BASEID: TFIBIntegerField;
    actLinkTTtoSotaNaklList: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    frxFIBComponents1: TfrxFIBComponents;
    actPrintShets: TAction;
    frxRepSchet: TfrxReport;
    fdsNaklList2POS_CNT: TIntegerField;
    MegaDSTTNPlanPositionsPOS_CNT: TIntegerField;
    gridNaklDBBandedTableView1POS_CNT: TcxGridDBBandedColumn;
    cxButton7: TcxButton;
    pmOrder: TPopupMenu;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    ActInsertNar: TAction;
    ActEditNar: TAction;
    actDelNar: TAction;
    MegaDSTTNPlanorder_recid: TIntegerField;
    MegaDSTTNPlanorder_baseid: TIntegerField;
    N18: TMenuItem;
    actPrintKompMarshrut: TAction;
    actPrintKomplOrder: TAction;
    N19: TMenuItem;
    N20: TMenuItem;
    actPrintPeriod: TAction;
    N21: TMenuItem;
    actPrintPeriodExpeditor: TAction;
    N22: TMenuItem;
    actPrintSvodAll: TAction;
    N23: TMenuItem;
    MegaDSTTNPlanPositionsORDER_RECID: TIntegerField;
    MegaDSTTNPlanPositionsORDER_BASEID: TIntegerField;
    MegaDSTTNPlanPositionsKOMPLEKTOVSCHIK: TStringField;
    MegaDSTTNPlanPositionscost_kg: TFloatField;
    MegaDSTTNPlanPositionscost_one_pos: TFloatField;
    MegaDSTTNPlanPositionscost_sku: TFloatField;
    MegaDSTTNPlanPositionscost_sum: TFloatField;
    N24: TMenuItem;
    C1: TMenuItem;
    actInsertNarSelNakl: TAction;
    actSelEditNar: TAction;
    actSelDelNar: TAction;
    N25: TMenuItem;
    N26: TMenuItem;
    actExportTTNPlanNaklsPosToExcel: TAction;
    btnTTNPlanExport: TcxButton;
    mdsTTNPlanNaklsPos: TMegaRDataSet;
    SaveDialog1: TSaveDialog;
    mdsTTNPlanNaklsPosGROUP_NAME: TFIBStringField;
    mdsTTNPlanNaklsPosKOD_EAN: TFIBFloatField;
    mdsTTNPlanNaklsPosNAME_MATER: TFIBStringField;
    mdsTTNPlanNaklsPosCOUNTINBOX: TFIBIntegerField;
    mdsTTNPlanNaklsPosED_IZM: TFIBStringField;
    mdsTTNPlanNaklsPosSUMMA: TFIBFloatField;
    mdsTTNPlanNaklsPosNDS: TFIBFloatField;
    mdsTTNPlanNaklsPosKOLICH: TFIBFloatField;
    mdsTTNPlanNaklsPosMAX_PRICE: TFIBFloatField;
    MegaDSSortingLotKIND: TIntegerField;
    cxLabel1: TcxLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    MegaDSTTNPlanNAS_P_FROM: TIntegerField;
    fdsDKFROMNasP: TMegaRDataSet;
    fdsDKFROMNasPKOD_DK: TFloatField;
    fdsDKFROMNasPNAS_P_ID: TIntegerField;
    fdsDKFROMNasPCOUNTRY_ID: TIntegerField;
    fdsDKFROMNasPNAS_P_NAME: TFIBStringField;
    dsDKFROMNasP: TDataSource;
    MegaDSTTNPlanPositionsDISTANCE_TT: TFloatField;
    cxButton8: TcxButton;
    actRecalcPos: TAction;
    actPrintNaklListInRout: TAction; // add new nirs 31_03_2026
    gridNaklDBBandedTableView1OPER_STATUS: TcxGridDBBandedColumn;
    MegaDSSortingLotPositionsMOB_ORDER_GUID: TFIBStringField;
    MegaDSSortingLotPositionsWORK_WITH_EDI: TFIBIntegerField;
    MegaDSSortingLotPositionsUSE_EDI_INVOICE: TFIBIntegerField;
    MegaDSSortingLotPositionsUSE_EDI_ORDRSP: TFIBIntegerField;
    MegaDSSortingLotPositionsUSE_EDI_DESADV: TFIBIntegerField;
    MegaDSSortingLotPositionsDOC_SUMMA: TFIBFloatField;
    fdsNaklList2PARENT_RECID: TIntegerField;
    fdsNaklList2PARENT_BASEID: TIntegerField;
    gridNaklDBBandedTableView1PLANNUMBER: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1DELIV_TIME: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1DELIV_DATE: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1IS_HORECA: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1desireddeliverytime: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1CATEGORY: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1OUTLET_RECID: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1OUTLET_BASEID: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1PARENT_RECID: TcxGridDBBandedColumn;
    gridNaklDBBandedTableView1PARENT_BASEID: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    Timer1: TTimer;
    mqAllowCrTTN: TMegaQuery;
    dxBarButton8: TdxBarButton;
    ppAntor: TPopupMenu;
    N31: TMenuItem;
    N32: TMenuItem;
    cbFilt: TComboBox;
    fdsNaklList2EXT_STRID: TFIBStringField;
    fdsNaklList2CUST_STRID: TFIBStringField;
    fdsNaklList2UNLOAD_TYP: TFIBIntegerField;
    fdsNaklList2ORD_TYP: TFIBIntegerField;
    fdsNaklList2CATEGORY_ID: TFIBIntegerField;
    fdsNaklList2ACTIVE_: TFIBIntegerField;
    fdsNaklList2OGRSUM1: TFIBFloatField;
    fdsNaklList2OGRSUM2: TFIBFloatField;
    fdsNaklList2SUM3: TFIBFloatField;
    fdsNaklList2SUM4: TFIBFloatField;
    fdsNaklList2ADDR: TFIBStringField;
    fdsNaklList2STR1: TFIBStringField;
    fdsNaklList2MAX_CAR: TFIBFloatField;
    fdsNaklList2MIN_CAR: TFIBFloatField;
    fdsNaklList2DELIV_DATE1: TFIBDateTimeField;
    fdsNaklList2RENTED: TFIBIntegerField;
    fdsNaklList2LATITUDE: TFIBFloatField;
    fdsNaklList2LONGITUDE: TFIBFloatField;
    fdsNaklList2TIME_UNLOAD: TFIBDateTimeField;
    Antor: TADOConnection;
    qInsertNakl: TADOQuery;
    qQuery: TADOQuery;
    dsRoute: TADODataSet;
    cxLabel2: TcxLabel;
    acCar: TAction;
    dxBarButton9: TdxBarButton;
    fdsNaklList2LPR: TFIBStringField;
    gridNaklDBBandedTableView1LPR: TcxGridDBBandedColumn;
    mQuery: TMegaQuery;
    mQuery1: TMegaQuery;
    dxBarButton10: TdxBarButton;
    acBP: TAction;
    actCreateSortLotAll: TAction;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton11: TdxBarButton;
    fdsNaklList2TIME_BEG: TDateTimeField;
    fdsNaklList2TIME_END: TDateTimeField;
    mgqryQuery2: TMegaQuery;
    fbfltfldMegaDSTTNPlanPositionsNUM_KM: TFIBFloatField;
    fbfltfldMegaDSTTNPlanNUM_KM: TFIBFloatField;
    fdsNaklList: TMegaRDataSet;
    fdsNaklListRECID: TIntegerField;
    fdsNaklListBASEID: TIntegerField;
    fdsNaklListOPERDATE: TDateTimeField;
    fdsNaklListDOCTYPE: TFIBStringField;
    fdsNaklListDOCNUMBER: TIntegerField;
    fdsNaklListGROUP_OPER: TIntegerField;
    fdsNaklListKOD_OPER: TIntegerField;
    fdsNaklListSUMMA1: TFloatField;
    fdsNaklListDK_TO: TFloatField;
    fdsNaklListDK_C: TFloatField;
    fdsNaklListGROUP_NAME: TFIBStringField;
    fdsNaklListNAME_OPER: TFIBStringField;
    fdsNaklListSHORTNAME_DK_TO: TFIBStringField;
    fdsNaklListSHORTNAME_DK_C: TFIBStringField;
    fdsNaklListNAS_P_ID: TIntegerField;
    fdsNaklListCOUNTRY_ID: TIntegerField;
    fdsNaklListNAS_P_NAME: TFIBStringField;
    fdsNaklListADDRESS: TFIBStringField;
    fdsNaklListWEIGHT_TONN: TFloatField;
    fdsNaklListTTN_NUMBER: TIntegerField;
    fdsNaklListTTN_DOCTYPE: TFIBStringField;
    fdsNaklListPLANNUMBER: TIntegerField;
    fdsNaklListOPER_STATUS: TIntegerField;
    fdsNaklListCALC_OPERSTATUS: TFIBStringField;
    fdsNaklListKOLICH: TFloatField;
    fdsNaklListDELIV_TIME: TFIBStringField;
    fdsNaklListDELIV_DATE: TDateTimeField;
    fdsNaklListBOX_COUNT: TFloatField;
    fdsNaklListN_TTN_MARSHRUT: TIntegerField;
    fdsNaklListIS_HORECA: TIntegerField;
    fdsNaklListRes_deliveryTime: TFIBStringField;
    fdsNaklListdesireddeliverytime: TFIBStringField;
    fdsNaklListCATEGORY: TIntegerField;
    fdsNaklListKOD_CELL: TFIBStringField;
    fdsNaklListVISITDATE: TFIBDateTimeField;
    fdsNaklListVISITDATE2: TFIBDateTimeField;
    fdsNaklListTYPE_NAME: TFIBStringField;
    fdsNaklListDOC_CREATE: TFIBDateTimeField;
    fdsNaklListOUTLET_RECID: TFIBIntegerField;
    fdsNaklListOUTLET_BASEID: TFIBIntegerField;
    fdsNaklListPOS_CNT: TIntegerField;
    fdsNaklListPARENT_RECID: TIntegerField;
    fdsNaklListEXT_STRID: TFIBStringField;
    fdsNaklListCUST_STRID: TFIBStringField;
    fdsNaklListUNLOAD_TYP: TFIBIntegerField;
    fdsNaklListORD_TYP: TFIBIntegerField;
    fdsNaklListCATEGORY_ID: TFIBIntegerField;
    fdsNaklListACTIVE_: TFIBIntegerField;
    fdsNaklListOGRSUM1: TFIBFloatField;
    fdsNaklListOGRSUM2: TFIBFloatField;
    fdsNaklListSUM3: TFIBFloatField;
    fdsNaklListSUM4: TFIBFloatField;
    fdsNaklListADDR: TFIBStringField;
    fdsNaklListSTR1: TFIBStringField;
    fdsNaklListMAX_CAR: TFIBFloatField;
    fdsNaklListMIN_CAR: TFIBFloatField;
    fdsNaklListDELIV_DATE1: TFIBDateTimeField;
    fdsNaklListRENTED: TFIBIntegerField;
    fdsNaklListLATITUDE: TFIBFloatField;
    fdsNaklListLONGITUDE: TFIBFloatField;
    fdsNaklListTIME_UNLOAD: TFIBDateTimeField;
    fdsNaklListPARENT_BASEID: TIntegerField;
    fdsNaklListLPR: TFIBStringField;
    fdsNaklListTIME_BEG: TDateTimeField;
    fdsNaklListTIME_END: TDateTimeField;
    MegaDSTTNPlanPositionsNOTES: TFIBStringField;
    ppMapXPlus: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    sQuery: TMegaQuery;
    MegaDSTTNPlanPositionsPLACES_NUM_KM: TFIBFloatField;
    MegaDSTTNPlanTMS: TFIBIntegerField;
    pmRinkai: TPopupMenu;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    mgrdtstTmpSelRinkai: TMegaRDataSet;
    dxBarButton12: TdxBarButton;
    HTTPRIO1: THTTPRIO;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
    cxButton9: TcxButton;
    frXMLExcelExport1: TfrXMLExcelExport;
    dxBarButton13: TdxBarButton;
    od: TOpenDialog;
    cxButton10: TcxButton;
    actExportJointLogistic: TAction;
    actExportJointLogisticAll: TAction;
    cxButton11: TcxButton;
    cxButton12: TcxButton;
    actSendJointLogistic: TAction;
    actSendJointLogisticAll: TAction;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    cxShellBrowserDialog1: TcxShellBrowserDialog;
    fdsNaklListDISTR: TFIBStringField;
    fdsNaklListTOWN: TFIBStringField;
    fdsNaklListSTREET: TFIBStringField;
    fdsNaklListHOUS: TFIBStringField;
    fdsNaklListCORP: TFIBStringField;
    MegaDSTTNPlanPositionsIS_FED_MARKA: TFIBIntegerField;
    fdsNaklListIS_FED_MARKA: TIntegerField;
    gridNaklDBBandedTableView1IS_FED_MARKA: TcxGridDBBandedColumn;
    MegaDSSortingLotPositionsIS_FED_MARKA: TIntegerField;
    gbCustomTonnage: TGroupBox;
    dsTonnag: TDataSource;
    dbtxtTonnag: TDBText;
    mgdTonnag1: TMegaDSDocNakl;
    fltfldDEBET_KOD_MATERMegaDSTTNPlanTONNAG: TFloatField;
    fltfldDEBET_KOD_MATERTonnag1TONNAGE: TFloatField;
    strngfldListsTonnag1DESCRIPTION: TStringField;
    cbbPriseTonazTONNAGE: TcxDBLookupComboBox;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    actExportNakl: TAction;
    actExportRoute: TAction;
    dxBarButton18: TdxBarButton;
    actImportFromTocan: TAction;
    dxBarButton19: TdxBarButton;
    actExportUpdateRoute: TAction;
    actExportCars: TAction;
    dxBarButton20: TdxBarButton;
    MegaDSTTNPlanPositionsPARENT_RECID: TFIBIntegerField;
    MegaDSTTNPlanPositionsPARENT_BASEID: TFIBIntegerField;
    CSV1: TMenuItem;
    fdsNaklListNOTES: TFIBStringField;
    gridNaklDBBandedTableView1NOTES: TcxGridDBBandedColumn;
    fdsNaklListFLAG_SAN: TIntegerField;
    gridNaklDBBandedTableView1FLAG_SAN: TcxGridDBBandedColumn;
    actTransitDate: TAction;
    N36: TMenuItem;
    MegaTranW: TMegaTransaction;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcTTNPlanChange(Sender: TObject);
    procedure actPlanAddExecute(Sender: TObject);
    procedure MegaDatePanelChange(Sender: TObject);
    procedure actPlanDeleteExecute(Sender: TObject);
    procedure actNaklAddExecute(Sender: TObject);
    procedure actNaklRemoveExecute(Sender: TObject);
    procedure actPlanRefreshExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actReportExecute(Sender: TObject);
    procedure MegaSelTransporterChange(Sender: TObject);
    procedure actPlanHeaderShowExecute(Sender: TObject);
    procedure actPlanPosUpExecute(Sender: TObject);
    procedure actPlanPosDownExecute(Sender: TObject);
    procedure actTTNCreateExecute(Sender: TObject);
    procedure actTTNDeleteExecute(Sender: TObject);
    procedure fdsNaklList2CalcFields(DataSet: TDataSet);
    procedure MegaDSTTNPlanPositionsCalcFields(DataSet: TDataSet);
    procedure MegaSelTruckChange(Sender: TObject);
    procedure gridPlanSortMarkingChanged(Sender: TObject);
    procedure gridPlanDblClick(Sender: TObject);
    procedure ceDK_CChange(Sender: TObject);
    procedure dbcbTypeChange(Sender: TObject);
    procedure actTTNOpenExecute(Sender: TObject);
    procedure actRefreshDataExecute(Sender: TObject);
    procedure actOpenNaklExecute(Sender: TObject);
    procedure actOpenNaklFromPlanExecute(Sender: TObject);
    procedure actRequestExecute(Sender: TObject);
    procedure MegaDSTTNPlanDOCTYPEChange(Sender: TField);
    procedure actFixMarshrutExecute(Sender: TObject);
    procedure actNaclMAddExecute(Sender: TObject);
    procedure actNaclRightExecute(Sender: TObject);
    procedure actNaclLeftExecute(Sender: TObject);
    procedure edTTN_PositionChange(Sender: TObject);
    procedure MegaSelTradeDelegateChange(Sender: TObject);
    procedure frReportGetValue(const ParName: String;
      var ParValue: Variant);
    procedure dbedCAR_DRIVERKeyPress(Sender: TObject; var Key: Char);
    procedure actTTNPrintExecute(Sender: TObject);
    procedure actDop_MarshrutsExecuteExecute(Sender: TObject);
    procedure gridNaklDBBandedTableView1DblClick(Sender: TObject);
    procedure gridPlanGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridPlanColumns33GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure actPlanPosInfoExecute(Sender: TObject);
    procedure actCreateSortLotCurUpdate(Sender: TObject);
    procedure actNaklRemoveUpdate(Sender: TObject);
    procedure actCreateSortLotCurExecute(Sender: TObject);
    procedure MegaDSTTNPlanAfterPost(DataSet: TDataSet);
    procedure actTTNCreateUpdate(Sender: TObject);
    procedure actTTNOpenUpdate(Sender: TObject);
    procedure actTTNDeleteUpdate(Sender: TObject);
    procedure actTTNPrintUpdate(Sender: TObject);
    procedure btnMoveTempMarshrClick(Sender: TObject);
    procedure actCreateTempMarshrutExecute(Sender: TObject);
    procedure actCreateTempMarshrutUpdate(Sender: TObject);
    procedure actMoveSchetsToNaklsExecute(Sender: TObject);
    procedure MegaDSTTNPlanAfterScroll(DataSet: TDataSet);
    procedure actNaklAddSotaExecute(Sender: TObject);
    procedure chbCheckRentClick(Sender: TObject);
    procedure actLinkTTtoSotaUpdate(Sender: TObject);
    procedure actLinkTTtoSotaExecute(Sender: TObject);
    procedure actLinkTTtoSotaNaklListUpdate(Sender: TObject);
    procedure actLinkTTtoSotaNaklListExecute(Sender: TObject);
    procedure actPrintShetsExecute(Sender: TObject);
    procedure frxRepSchetGetValue(const VarName: string; var Value: Variant);
    procedure ActInsertNarExecute(Sender: TObject);
    procedure ActEditNarExecute(Sender: TObject);
    procedure actDelNarExecute(Sender: TObject);
    procedure ActInsertNarUpdate(Sender: TObject);
    procedure ActEditNarUpdate(Sender: TObject);
    procedure actDelNarUpdate(Sender: TObject);
    procedure actPrintKompMarshrutExecute(Sender: TObject);
    procedure actPrintKomplOrderExecute(Sender: TObject);
    procedure actPrintPeriodExecute(Sender: TObject);
    procedure actPrintPeriodExpeditorExecute(Sender: TObject);
    procedure actPrintSvodAllExecute(Sender: TObject);
    procedure actInsertNarSelNaklExecute(Sender: TObject);
    procedure actSelEditNarExecute(Sender: TObject);
    procedure actSelDelNarExecute(Sender: TObject);
    procedure actExportTTNPlanNaklsPosToExcelExecute(Sender: TObject);
    procedure actRecalcPosExecute(Sender: TObject);
    procedure actPrintNaklListInRoutExecute(Sender: TObject); // add new nirs 31_03_2026
    procedure SetupPrintNaklInRout;                          // add new nirs 31_03_2026
    procedure cxDBLookupComboBox1PropertiesChange(Sender: TObject);
    procedure gridNaklDBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure N27Click(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure acCarExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure acBPExecute(Sender: TObject);
    procedure actCreateSortLotAllExecute(Sender: TObject);
    procedure actCreateSortLotAllUpdate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure dxBarButton12Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure dxBarButton13Click(Sender: TObject);
    procedure actExportJointLogisticExecute(Sender: TObject);
    procedure actExportJointLogisticAllExecute(Sender: TObject);
    procedure actSendJointLogisticExecute(Sender: TObject);
    procedure actSendJointLogisticAllExecute(Sender: TObject);
    procedure actExportRouteExecute(Sender: TObject);
    procedure actExportNaklExecute(Sender: TObject);
    procedure actImportFromTocanExecute(Sender: TObject);
    procedure actExportUpdateRouteExecute(Sender: TObject);
    procedure actExportCarsExecute(Sender: TObject);
    procedure CSV1Click(Sender: TObject);
    procedure actTransitDateExecute(Sender: TObject);
  private
    { Private declarations }
//    FSetTTNPlan: TMegaSetTTNPlan;
      is_newcrm:Boolean;
      fNotChangeNUM: boolean;
      FSelectedDate: TDateTime;

    procedure InitTTNPlanTabSheets;
    procedure InitNewTabSheet;

    procedure RefreshMinOutletCount;
    procedure IsTTNCreated;
    function  CanCreateTTN : boolean;

    procedure InitTTNPlanNaklsPosDataSet(aPlanDate:TDateTime; aPlanNumber:integer;aBaseid:integer);

    function AddNaklToEDIOrdRspFormingQueue(const NaklRecID, NaklBaseId: Integer; const NaklGUID: string; const NaklSumma: double): Integer;
    function AddNaklToEDIDesAdvFormingQueue(const NaklRecID, NaklBaseId: Integer; const NaklGUID: string; const NaklSumma: double): Integer;
    function AddNaklToEDIInvoiceFormingQueue(const NaklRecID, NaklBaseId: Integer; const NaklGUID: string; const NaklSumma: double): Integer;
    procedure ExportJointLogistic(paramRouteNumber: integer);
    procedure SendJointLogistic(paramRouteNumber: integer);
    procedure ConfirmButtonClick(Sender: TObject);
//    procedure TestDateInputForm;
    function ShowDateInputForm: TDateTime;
    procedure actNaklAddExecute_prev(Sender: TObject);
    procedure actNaklAddExecute_2025(Sender: TObject);
    function GetBalanceByNakl(aRecID, aBaseID: integer): integer;
  public
    isFirst:Boolean;
    MStart,MFinish:Integer;
    RoadList:TStringList;
    { Public declarations }
    procedure RefreshNaklList;
    function  fCreateSortLotCur(fShowMessage:boolean=true):Boolean;
    function  CanCreatSortLot(aShowMessage : boolean): boolean;

    procedure listTonnag;

  end;
  TRoute = class(TObject)
    ID: Integer;
    CFO:Integer;
    DocDate: string;
    CarID: string;
    Start: string;
    Finish: string;
    LengthPath: Double;
    MassaAuto: Double;
    ExpeditorID:Double;
    Cost:Double;
    DocRecID:Integer;
    DocBaseID:Integer;
    PorNumber:Integer;
    StartPoint:string;
    UnloadPoint:string;
    FinishPoint:string;
    Distance:Double;
    TTType:Integer;
    CarDriver:string;
    constructor Create(aID,aCFO, aDocDate, aCarID, aCarDriver, aStart, aFinish,aExpeditorID,aLengthPath,aMassaAuto,aCost,
        aPorNumber, aDocRecKey, aStartPoint, aUnloadPoint, aFinishPoint, aDistance, aTTType:string);
  end;
var
  fmTTNPlan: TfmTTNPlan;
  AntorEnable: integer;
  AntorIndex: string;
  ParamList:TstringList;
  FiltActive:integer;

  
implementation

uses
  MoneyData, ufmTTNMarshrut, uUtilSortSklad, DolgAnaliz, AAMake,
  ufmLogCells_AddTT, ufmDocOrderSkladPos, udmMegaReports, ufmSetPeriod,
  uExportExcel2, CommonModulesBusinessProcesses_V3, liUtils,
  wsDocumentEDIOrdRsp, wsDocumentEDIDesAdv, wsDocumentEDIInvoice, uDocumentEDI, Main, ufmTTNPlanCars,
  ufmMSelectCheckList,ufmSelectDir,ufmTTNRoadCheck,uDlgEnterPeriod, RinkaiPlan2, fbMegaUtils, SimpleXML, FileCtrl,
  XSBuiltIns,SendMail_TLB,ActiveX,ComServ,uMegaSendMail,
     {[gsa]03-06-2019 комментар в БП стал обезательным } UnitBDComment
     , ufmSendMail,
  PrintNakl2, Printers, frxPrinter, uPrintInternalDocHelper; // add new nirs 31_03_2026 print nakl in rout

{$R *.DFM}

const
 TTN_not_Exists = 'ТТН не создана';
 TTN_Exists = 'ТТН создана';
 c_IS_TEMP_MARSH_Caption = 'Временный мар-т';
 cnstZvirka = 'Звірка';

constructor TRoute.Create(aID,aCFO, aDocDate, aCarID, aCarDriver, aStart, aFinish,aExpeditorID,aLengthPath,aMassaAuto,aCost,
 aPorNumber, aDocRecKey, aStartPoint, aUnloadPoint, aFinishPoint, aDistance, aTTType:string);
var RecKey:string;
  Res:Char;
begin
  inherited Create;
  Res:=DecimalSeparator;
  ID:=StrToInt(aID);
  CFO:=StrToInt(ReplaceStr(aCFO,'''',''));
  DocDate:=ReplaceStr(aDocDate,'''','');
  CarID:=ReplaceStr(aCarID,'''','');
  CarDriver:=ReplaceStr(aCarDriver,'''','');
  Start:=ReplaceStr(aStart,'''','');
  Finish:=ReplaceStr(aFinish,'''','');

 if Res=',' then  LengthPath:=StrToFloat(ReplaceStr(ReplaceStr(aLengthPath,'.',Res),'''',''))
   else LengthPath:=StrToFloat(ReplaceStr(ReplaceStr(aLengthPath,',',Res),'''',''));
 if Res=',' then MassaAuto:=StrToFloat(ReplaceStr(ReplaceStr(aMassaAuto,'.',Res),'''',''))
 else MassaAuto:=StrToFloat(ReplaceStr(ReplaceStr(aMassaAuto,',',Res),'''',''));
  if Length(aExpeditorID)>0 then
    ExpeditorID:=StrToFloat(ReplaceStr(aExpeditorID,'''',''));
  Cost:=StrToFloat(ReplaceStr(aCost,'''',''));
  RecKey:=ReplaceStr(aDocRecKey,'''','');
  DocRecID:=StrToInt(Copy(RecKey,1,Length(RecKey)-3));
  DocBaseID:=StrToInt(Copy(RecKey,Length(RecKey)-2,3));
  PorNumber:=StrToInt(aPorNumber)-1;
  StartPoint:=aStartPoint;
  UnloadPoint:=aUnloadPoint;
  FinishPoint:=aFinishPoint;
  if Res=',' then Distance:=StrToFloat(ReplaceStr(ReplaceStr(aDistance,'.',Res),'''',''))
  else Distance:=StrToFloat(ReplaceStr(ReplaceStr(aDistance,',',Res),'''',''));
  if aTTType<>'' then
     TTType:=StrToInt(ReplaceStr(aTTType,'''',''))
  else
     TTType:=999;

end;
procedure TfmTTNPlan.FormDestroy(Sender: TObject);
begin
  fmTTNPlan:= nil;
end;

procedure TfmTTNPlan.FormCreate(Sender: TObject);
var
   connectString:string;
   mQuery: TMegaQuery; // add new nirs 25_11_2024
begin
  RoadList:= TStringList.Create;
  fNotChangeNUM:=false;
//  Transaction.Active:= True;

  MegaDatePanel.Date:= Date;
  MegaSelTradeDelegate.Open;
  MegaSelTradeDelegate.Value := IntToStr(IntfMegaDBCommon.GetCFO);

  actFixMarshrut.Enabled:=IntfMegaDBCommon.IsOffice;

// BEGIN add new nirs 25_11_2024
   if IsUkraine then begin
     mQuery := TMegaQuery.Create(Self);
     try
       mQuery.DataBase:= DM.Money;
       mQuery.Transaction:= DM.Transaction;
       mQuery.SQL.Text:= 'SELECT DOCTYPE FROM SPRAV_TTNDOC WHERE SHOW_IN_TTN_PLAN = 1';
       mQuery.ExecQuery;
       dbcbType.Items.Clear;
       while not mQuery.Eof do begin
         dbcbType.Items.Add(mQuery.FieldByName('DOCTYPE').AsString);
         mQuery.Next;
       end;
    finally
      mQuery.Free;
    end;
   end;
// END add new nirs 25_11_2024

   //Доверенность или ЛПР
   if IntfMegaDBCommon.GetCountry=iccRussia then
   begin
    gridNaklDBBandedTableView1LPR.Visible:=false;
   end;


{---Антор}
      AntorEnable:=0;
      if(IntfMegaDBCommon.GetParam('ANTOR', '0')='1') then
      begin
        AntorEnable:=1;
        AntorIndex:=IntfMegaDBCommon.GetParam('ANTOR_INDEX', '0');
        dxBarButton8.Visible:=ivAlways;
        cbFilt.Visible:=true;
       // ParamList:=TstringList.Create();
      //  ParamList.LoadFromFile('AntorI.ini');
        if  Antor.Connected then  Antor.Connected:=false;
       // if ParamList.Values['ANTOR_CONNECT']<>'' then
       //   Antor.ConnectionString:=ParamList.Values['ANTOR_CONNECT'];
       if (IntfMegaDBCommon.GetParam('ANTOR_DOMAIN', '0')='1') then
         begin
        connectString:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;'+
        'Initial Catalog=%s;Data Source=%s;Use Procedure for Prepare=1;'+
        'Auto Translate=True;Packet Size=4096;Workstation ID=OPO-TS;Use Encryption for Data=False;Tag with column collation when possible=False';
        connectString:=format(connectString,[IntfMegaDBCommon.GetParam('ANTOR_DATABASE', 'LMaster'),IntfMegaDBCommon.GetParam('ANTOR_SERVER', 'O-MSK-IT12M.khortitsa.com')]);
        end     else
        begin
        connectString:='Provider=SQLOLEDB.1;Password=tripusss;Persist Security Info='+
        'True;User ID=sa;Initial Catalog=%s;Data Source=%s;Use Procedure for Prepare=1;'+
        'Auto Translate=True;Packet Size=4096;Workstation ID=OPO-TS;Use Encryption for Data=False;Tag with column collation when possible=False';
        connectString:=format(connectString,[IntfMegaDBCommon.GetParam('ANTOR_DATABASE', 'LMaster'),IntfMegaDBCommon.GetParam('ANTOR_SERVER', 'O-MSK-IT12M.khortitsa.com')]);
        end;
        Antor.ConnectionString:= connectString;
        MainForm.InfoPanel.Visible:=true;
        MainForm.spInfo.Visible:=true;
        MainForm.reInfo.Lines.Add('База Антор ' +ReplaceStr(connectString,'tripusss','passw',false,true));
        if (IntfMegaDBCommon.GetParam('ANTOR_ONLY', '0')='1') then
         begin
           actNaklAdd.Enabled:= false;
           actNaklRemove.Enabled:= false;
         end;
      end;
      if(IntfMegaDBCommon.GetParam('MAPXPLUS', '0')='1') then
      begin
        AntorEnable:=1;
        dxBarButton8.Caption:='MapXPlus';
        dxBarButton8.Visible:=ivAlways;
        cbFilt.Visible:=true;
      end;

{---}

  MegaDSTTNPlanPositions.ParamByName('PosInSortLot').SetDefMacroValue;
  if IntfMegaDBCommon.IsOffice then
  begin
    actPrintPeriod.Enabled          := True;
    actPrintPeriod.Visible          := True;
    actPrintPeriodExpeditor.Visible := True;
    actPrintPeriodExpeditor.Enabled := True;

    MegaSelTradeDelegate.Value:= IntToStr(ibcMainBaseID);
    btnDop.Enabled:=true;
  end
  else
//    MegaDSTTNPlanPositions.ParamByName('PosInSortLot').asString:='(select count(*) from SORT_LOT_POSITIONS slp WHERE  slp.nakl_recid=tpp.nakl_recid and slp.nakl_baseid=tpp.nakl_baseid) ';
    MegaDSTTNPlanPositions.ParamByName('PosInSortLot').asString:='(select count(*) from SORT_LOT_POSITIONS slp WHERE  slp.nakl_recid=tpp.tn_recid and slp.nakl_baseid=tpp.tn_baseid) ';


  if MegaSelTradeDelegate.Value = '' then Exit; //Если не выбрано представительство

  if Owner <> nil then
    actRefreshData.Execute;

  fdsDKFROMNasP.ParamByName('DK_FROM').asFloat:= IntfMegaCommon.GetMainFirmDK;
  fdsDKFROMNasP.open;
  dtMoveTempMarshDate.Date := Date;

  // -- перепризначення btnPrintTTN: друк накладних по маршруту --
  // -- закоментувати рядок нижче для відновлення старої логіки   --
  SetupPrintNaklInRout; // add new nirs 31_03_2026

end;

procedure TfmTTNPlan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RoadList.Free;
  Action:= caFree;
end;

procedure TfmTTNPlan.InitTTNPlanTabSheets;
var
  i: integer;
  lTempEvent: TNotifyEvent;
  lTempEvent2: TNotifyEvent;

  lTempEventCarrier1: TNotifyEvent;
  lTempEventCarrier2: TNotifyEvent;
  lTempEventCarrier3: TNotifyEvent;

begin
  pnPlanItem.Hide;
  pnPlanItem.Parent:= self;

  lTempEvent:= pcTTNPlan.OnChange;
  pcTTNPlan.OnChange:= nil;

  lTempEvent2:= MegaSelTransporter.OnChange;
  MegaSelTransporter.OnChange:= nil;

  lTempEventCarrier1:= MegaSelTruck.OnChange;
  MegaSelTruck.OnChange:= nil;

  lTempEventCarrier2:= MegaSelTrailer1.OnChange;
  MegaSelTrailer1.OnChange:= nil;

  lTempEventCarrier3:= MegaSelTrailer2.OnChange;
  MegaSelTrailer2.OnChange:= nil;

  try
    for i:= pcTTNPlan.PageCount - 1 downto 0 do
    begin
      pcTTNPlan.Pages[i].Destroy;
    end;

    MegaDSTTNPlan.Close;
    MegaDSTTNPlan.Open(MegaDatePanel.Date, StrToInt(MegaSelTradeDelegate.Value));
    MegaDSTTNPlanPositions.dataSource:=nil;
   // MegaDSTTNPlanPositions.paramByName('country_id').asInteger:=IntfMegaDBCommon.GetCountry;
   // MegaDSTTNPlanPositions.Open;

    if not (MegaDSTTNPlan.EOF and MegaDSTTNPlan.BOF) then
    begin
      MegaDSTTNPlan.First;
      while not MegaDSTTNPlan.EOF do
      begin
       // actPlanRefresh.Execute;
        InitNewTabSheet;
        MegaDSTTNPlan.Next;
      end;
    end;
  finally
    MegaDSTTNPlanPositions.dataSource:= dsPlan;
    MegaDSTTNPlanPositions.paramByName('country_id').asInteger:=IntfMegaDBCommon.GetCountry;
     MegaDSTTNPlanPositions.Open;

    pcTTNPlan.OnChange:= lTempEvent;
    MegaSelTransporter.OnChange:= lTempEvent2;

    MegaSelTruck.OnChange:= lTempEventCarrier1;
    MegaSelTrailer1.OnChange:= lTempEventCarrier2;
    MegaSelTrailer2.OnChange:= lTempEventCarrier3;

  end;

  pcTTNPlanChange(Self);
end;

procedure TfmTTNPlan.pcTTNPlanChange(Sender: TObject);
begin //Изменение просматриваемых маршрутов
  if (MegaDSTTNPlan.State = dsInsert)
  or (MegaDSTTNPlan.State = dsEdit)
  then
    begin
    try
     MegaDSTTNPlan.Post;
    except
    on e: Exception do //[gsa]10062019 добавил для блокировки
      if e.Message <> '' then
      begin
        MessageDlg('Внимание!'+#13+#10+'<' + e.Message + '>''', mtWarning, [mbOK], 0);
        MegaDSTTNPlan.Cancel;
      end;
    end;
   end;

  if Assigned(pcTTNPlan.ActivePage) then  //Если есть открытая страница маршрутов
  begin
      if MegaDSTTNPlan.Active then  //Если таблица Маршрутов открыта
      begin //Выбрать в таблице Маршрутов соответствующую закладке запись
        fNotChangeNUM:=true;
        MegaDSTTNPlan.Locate('PLANNUMBER', pcTTNPlan.ActivePage.Tag, []);
        fNotChangeNUM:=false;
      end;//соответственно обновится таблица ПОЗИЦИЙ ТТН
    actPlanRefresh.Execute;
//    listTonnag;
    if (MegaDSTTNPlanPositions.WeightTonn<>0) and (MegaDSTTNPlan.TotalTonnage<>0) then
      lbPlod.Caption:=FloatToStrF(MegaDSTTNPlanPositions.WeightTonn/MegaDSTTNPlan.TotalTonnage*100, ffFixed, 15, 2)
     else
      lbPlod.Caption:='0';
    pnPlanItem.Parent:= pcTTNPlan.ActivePage;
    pnPlanItem.Show;
  end;
  IsTTNCreated;
end;

procedure TfmTTNPlan.actPlanAddExecute(Sender: TObject);
begin
  if (MegaDSTTNPlan.State = dsInsert)      //Добавление нового маршрута
  or (MegaDSTTNPlan.State = dsEdit)
  then MegaDSTTNPlan.Post;
  //Проверка на то какая база обновлённая или нет
   if (is_newcrm = true) then
   begin
   //Проверка на наличие записей на указанную дату
  qPlan_Count.close;
  qPlan_Count.SQL.Text:='SELECT * FROM ttn_plan'#13#10 +
  'WHERE Plandate='+QuotedStr(DateToStr(MegaDatePanel.Date))+
  ' and baseid='+MegaSelTradeDelegate.Value+
  ' and coalesce(IS_TEMP_MARSHRUT,0)<>1 ' ;
  qPlan_Count.ExecQuery;
  if (qPlan_Count.RecordCount>0) then
  begin
    ShowMessage('Маршруты уже созданы');
    Exit;
 end
 else if (qPlan_Count.RecordCount=0) then //Если на указанную дату маршруты не созданы
 begin
      MegaDSTTNPlanPositions.Close;
      qPlan_Count.Close;
      qPlan_Count.SQL.Text:='SELECT * '#13#10 +
      'FROM ttn_marshruts'#13#10 +
      'WHERE CFO='+ MegaSelTradeDelegate.Value;
      qPlan_Count.ExecQuery;
      while not qPlan_Count.EOF do
      begin
           MegaDSTTNPlanPositions.Close;
           MegaDSTTNPlan.Add;
           //Произвести редактирование записи тоесть поставить значения из ttn_marshruts
           //MegaDSTTNPlanPositions.Open;
           MegaDSTTNPlan.Edit;
           MegaDSTTNPlan.FieldByName('IS_HORECA').asInteger:=qPlan_Count.FieldByName('IS_HORECA').asInteger;
           MegaDSTTNPlan.Post;

           MegaDSTTNPlanPositions.Open;
           InitNewTabSheet;
           pcTTNPlanChange(Self);
           qPlan_Count.Next;
      end;
         actPlanRefresh.Execute;
         RefreshNaklList;
 end;
 Exit;
 end
 else //Если используется не обновлённая версия (is_newcrm = false)
  begin
    MegaDSTTNPlanPositions.Close;
    MegaDSTTNPlan.Add;
    MegaDSTTNPlanPositions.Open;

    InitNewTabSheet;

    pcTTNPlanChange(Self);
  end;
end;

procedure TfmTTNPlan.InitNewTabSheet;
var
  dxSheet: TcxTabSheet;
begin
  dxSheet:= TcxTabSheet.Create(Self);       //Организация на понели Закладок Маршрутов
  dxSheet.Tag:= MegaDSTTNPlanPLANNUMBER.AsInteger;
  dxSheet.Caption:= 'Маршрут '+MegaDSTTNPlanPLANNUMBER.AsString;
  if MegaDSTTNPlanIS_HORECA.Value=1 then dxSheet.Highlighted:=true;
  dxSheet.PageControl:= pcTTNPlan;
end;

procedure TfmTTNPlan.MegaDatePanelChange(Sender: TObject);
begin
//  actRefreshData.Execute;
//  MegaSelTradeDelegate.DateFrom:= MegaDatePanel.Date;
//  MegaSelTradeDelegate.Refresh;
end;

procedure TfmTTNPlan.actPlanDeleteExecute(Sender: TObject);
begin
  //
  pnPlanItem.Parent:= pnPlan;//nil;
  pnPlanItem.SendToBack;

  MegaDSTTNPlan.Delete;

  pcTTNPlan.Pages[pcTTNPlan.ActivePageIndex].Destroy;

  pcTTNPlanChange(Self);
end;

procedure TfmTTNPlan.RefreshNaklList;
var
  lOldRecID: integer;
  lOldBaseID, i: integer;
  strlist : TStringList;
begin  //Обновление таблицы  ТТН
  fdsNaklList.disablecontrols;
  try
    if fdsNaklList.Active then
    begin
      lOldRecID:= fdsNaklListRECID.AsInteger;
      lOldRecID:= fdsNaklListBASEID.AsInteger;
    end;

    fdsNaklList.Close;
    fdsNaklList.ParamByName('ADATE').AsDateTime:= MegaDatePanel.Date;
//    fdsNaklList.ParamByName('SHOW_RENT').AsInteger := byte(lbWholeRent.Enabled);
    fdsNaklList.ParamByName('BDATE').AsDateTime:= MegaDatePanel.Date;
    fdsNaklList.ParamByName('filt').AsInteger := cbFilt.ItemIndex;
    FiltActive:=cbFilt.ItemIndex;
    if MegaSelTradeDelegate.Value = '' then
    begin
      MegaSelTradeDelegate.ComboBox.SetFocus;
      raise Exception.Create('Выберите регион!');
    end;
    fdsNaklList.ParamByName('BASEID').AsInteger:= StrToInt(MegaSelTradeDelegate.Value);

    fdsNaklList.Open;
  finally
    fdsNaklList.EnableControls;
  end;

  fdsNaklList.Locate('RECID;BASEID', VarArrayOf([lOldRecid, lOldBaseID]), []);
  gridNaklDBBandedTableView1.DataController.ClearSelection;
end;

procedure TfmTTNPlan.Timer1Timer(Sender: TObject);
begin
MegaDatePanel.Refresh;
end;


procedure TfmTTNPlan.actNaklAddExecute(Sender: TObject);
begin
   actNaklAddExecute_prev(Sender);
 //  actNaklAddExecute_2025(Sender);
end;

// варіант тільки по одному вибраному
procedure TfmTTNPlan.actNaklAddExecute_prev(Sender: TObject);
var
  lbm: TBookMarkStr;
  aLG_CELL_CHECK_PLAN: boolean;
  PARENT_RECID, PARENT_BASEID: integer;
  dtype: string;
begin

  dtype := fdsNaklList.FieldByName('DOCTYPE').AsString;

  if FiltActive<>0 then exit;    //Антор
  lbm:= fdsNaklList.Bookmark;
  if fdsNaklList.EOF and fdsNaklList.BOF then //Проверка на наличие ТТН для добавления в
    raise Exception.Create('Нет накладных для добавления'); //текущий маршрут

  if (fdsNaklList.FieldByName('IS_HORECA').asInteger<>1)
    and (fdsNaklList.FieldByName('CATEGORY').asInteger<>1)
    and (MegaDSTTNPlan.FieldByName('IS_HORECA').AsInteger = 1) then
    raise Exception.Create('В маршрут хореки нельзя добавлять накладные не хорики');

  if dtype <> cnstZvirka then
  if fdsNaklListKOD_CELL.isNULL or (fdsNaklListKOD_CELL.AsString='') then
  begin
    try
      aLG_CELL_CHECK_PLAN := IntfMegaDBCommon.GetParam('LG_CELL_CHECK_PLAN', '0')='1';
    except
      aLG_CELL_CHECK_PLAN := false;
    end;
    if aLG_CELL_CHECK_PLAN then
    begin
      MessageDlg('Не задана логистическая сота по торговой точке.'#13#10+
                 'Необходимо привязать торговую точку к логистической соте.',
                 mtInformation, [mbOk], 0);
      actLinkTTtoSotaNaklList.Execute;
    end
  end;

  if MegaDSTTNPlan.FieldByName('TTN_RECID').AsInteger <> 0 then //???
   if MessageDlg('ТТН по маршруту уже создана.'+#13+#10+'Удалить данную ТТН и продолжить?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
   begin
     MegaDSTTNPlan.DeleteTTN(false);

     if Assigned(pcTTNPlan.ActivePage) then //Проверка на наличие активного МАРШРУТА
     begin
       if not MegaDSTTNPlanPositions.Active then
         MegaDSTTNPlanPositions.Open;

       MegaDSTTNPlanPositions.Add_2(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger, dtype);
       PARENT_RECID:= fdsNaklListRECID.asInteger;
       PARENT_BASEID:= fdsNaklListBASEID.AsInteger;
       fdsNaklList.Delete;
       // ищем подчиненные и запихиваем их тоже
       while fdsNaklList.Locate('PARENT_RECID;PARENT_BASEID', VarArrayOf([PARENT_RECID, PARENT_BASEID]), []) do
       begin
         MegaDSTTNPlanPositions.Add_2(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger, dtype);
          fdsNaklList.Delete;
       end;
     end
     else
     Raise Exception.Create('Создайте маршрут');
   end
   else
   begin
   end
  else
  begin
    if Assigned(pcTTNPlan.ActivePage) then
    begin
      if not MegaDSTTNPlanPositions.Active then
        MegaDSTTNPlanPositions.Open;
      MegaDSTTNPlanPositions.Last;
      MegaDSTTNPlanPositions.Add_2(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger, dtype);
      PARENT_RECID:= fdsNaklListRECID.asInteger;
      PARENT_BASEID:= fdsNaklListBASEID.AsInteger;
      fdsNaklList.Delete;
      // ищем подчиненные и запихиваем их тоже
      while fdsNaklList.Locate('PARENT_RECID;PARENT_BASEID', VarArrayOf([PARENT_RECID, PARENT_BASEID]), []) do
      begin
         MegaDSTTNPlanPositions.Add_2(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger, dtype);
         fdsNaklList.Delete;
      end;
    end
    else
    Raise Exception.Create('Создайте маршрут');

    //fdsNaklList.Delete;
    actPlanRefresh.Execute;

    fdsNaklList.Next;//Перейти на следующую неразмещённую ТТН
  end;
   //if fdsNaklList.EOF and fdsNaklList.BOF then //Проверка на наличие накладных
   //raise Exception.Create('Нет накладных для добавления');
   //if MegaDSTTNPlan.EOF and MegaDSTTNPlan.BOF then //Проверка на наличие маршрутов
   //raise Exception.Create('Нет маршрутов на текущую дату.');
        //fdsNaklList.DisableControls;
        //fdsNaklList.First;
        //while not fdsNaklList.Eof do  //Цикл который проходится по всем накладным
        //begin                       //организованным на текущую дату
             //MegaDSTTNPlan.Locate('PLANNUMBER', fdsNaklListN_TTN_MARSHRUT.Value, []);
             //if fdsNaklListN_TTN_MARSHRUT.Value=MegaDSTTNPlanPLANNUMBER.Value then
               //MegaDSTTNPlanPositions.Add(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger);
             //fdsNaklList.Next;
        //end;
        //fdsNaklList.EnableControls;
        //MegaDSTTNPlan.Next;
   //actPlanRefresh.Execute;
   //RefreshNaklList;
  fdsNaklList.Bookmark:= lbm;
 end;


// варіант з можливістю вибрати декілька SelectedRows "Звірка" і додати усі виділені
procedure TfmTTNPlan.actNaklAddExecute_2025(Sender: TObject);
var
  lbm, lbm2: TBookMarkStr;
  aLG_CELL_CHECK_PLAN: boolean;
  PARENT_RECID, PARENT_BASEID, NklRecID, NklBaseID, i: integer;
  dtype: string;
begin
  if gridNaklDBBandedTableView1.Controller.SelectedRowCount < 2 then begin
    actNaklAddExecute_prev(Sender);
    Exit;
  end;

  if gridNaklDBBandedTableView1.Controller.SelectedRowCount > 1 then
     if MessageDlg('Підтвердіть будь ласка: перенесення усіх виділених позицій типу "Звірка"? ', mtConfirmation, [mbYes,mbNo], 0) = mrNo then Exit;

  if FiltActive<>0 then exit;    //Антор
  lbm:= fdsNaklList.Bookmark;
  if fdsNaklList.EOF and fdsNaklList.BOF then //Проверка на наличие ТТН для добавления в
    raise Exception.Create('Нет накладных для добавления'); //текущий маршрут

  for i:= 0 to gridNaklDBBandedTableView1.Controller.SelectedRowCount - 1 do begin
    NklRecID := gridNaklDBBandedTableView1.Controller.SelectedRows[i].Values[gridNaklDBBandedTableView1RECID.Index];
    NklBaseID := gridNaklDBBandedTableView1.Controller.SelectedRows[i].Values[gridNaklDBBandedTableView1BASEID.Index];
    if not fdsNaklList.Locate('RECID;BASEID', VarArrayOf([NklRecID, NklBaseID]), []) then
      raise Exception.Create('Помилка проходу по виділеним позиціям в накладних! Спробуйте переміщувати тільки по одній позиції!');
    dtype := fdsNaklList.FieldByName('DOCTYPE').AsString;    
    if dtype <> cnstZvirka then 
      if MessageDlg('Увага! Документ з типом: ' +dtype+#13+#10+' Перемістити його?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then begin
        actPlanRefresh.Execute;
        fdsNaklList.Bookmark:= lbm;
        Exit;
      end;
    if (fdsNaklList.FieldByName('IS_HORECA').asInteger<>1)
      and (fdsNaklList.FieldByName('CATEGORY').asInteger<>1)
      and (MegaDSTTNPlan.FieldByName('IS_HORECA').AsInteger = 1) then
      raise Exception.Create('В маршрут хореки нельзя добавлять накладные не хорики');

    if fdsNaklListKOD_CELL.isNULL or (fdsNaklListKOD_CELL.AsString='') then
    begin
      try
        aLG_CELL_CHECK_PLAN := IntfMegaDBCommon.GetParam('LG_CELL_CHECK_PLAN', '0')='1';
      except
        aLG_CELL_CHECK_PLAN := false;
      end;
      if aLG_CELL_CHECK_PLAN then
      begin
        MessageDlg('Не задана логистическая сота по торговой точке.'#13#10+
                  'Необходимо привязать торговую точку к логистической соте.',
                  mtInformation, [mbOk], 0);
        actLinkTTtoSotaNaklList.Execute;
      end
    end;

    if MegaDSTTNPlan.FieldByName('TTN_RECID').AsInteger <> 0 then //???
    if MessageDlg('ТТН по маршруту уже создана.'+#13+#10+'Удалить данную ТТН и продолжить?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
   //   MegaDSTTNPlan.DeleteTTN(false); //d

      if Assigned(pcTTNPlan.ActivePage) then //Проверка на наличие активного МАРШРУТА
      begin
        if not MegaDSTTNPlanPositions.Active then
          MegaDSTTNPlanPositions.Open;

//        MegaDSTTNPlanPositions.Add_2(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger, dtype); //d
        PARENT_RECID:= fdsNaklListRECID.asInteger;
        PARENT_BASEID:= fdsNaklListBASEID.AsInteger;
//        fdsNaklList.Delete; //d
        lbm2:= fdsNaklList.Bookmark;
        // ищем подчиненные и запихиваем их тоже
        while fdsNaklList.Locate('PARENT_RECID;PARENT_BASEID', VarArrayOf([PARENT_RECID, PARENT_BASEID]), []) do
        begin
//          MegaDSTTNPlanPositions.Add_2(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger, dtype); //d
//          fdsNaklList.Delete; //d
        end;
        fdsNaklList.Bookmark:= lbm2;
      end
      else
      Raise Exception.Create('Создайте маршрут');
    end
    else
    begin
    end
    else
    begin
      if Assigned(pcTTNPlan.ActivePage) then
      begin
        if not MegaDSTTNPlanPositions.Active then
          MegaDSTTNPlanPositions.Open;
        MegaDSTTNPlanPositions.Last;
//        MegaDSTTNPlanPositions.Add_2(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger, dtype); d
        PARENT_RECID:= fdsNaklListRECID.asInteger;
        PARENT_BASEID:= fdsNaklListBASEID.AsInteger;
//        fdsNaklList.Delete; d
        lbm2:= fdsNaklList.Bookmark;
        // ищем подчиненные и запихиваем их тоже
        while fdsNaklList.Locate('PARENT_RECID;PARENT_BASEID', VarArrayOf([PARENT_RECID, PARENT_BASEID]), []) do
        begin
//          MegaDSTTNPlanPositions.Add_2(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger, dtype); // d
//          fdsNaklList.Delete; //d
        end;
        fdsNaklList.Bookmark:= lbm2;
      end
      else
      Raise Exception.Create('Создайте маршрут');

  //    actPlanRefresh.Execute;
  //    fdsNaklList.Next;//Перейти на следующую неразмещённую ТТН
    end;
//      fdsNaklList.Next;//Перейти на следующую неразмещённую ТТН //d
  end;
  actPlanRefresh.Execute;
  fdsNaklList.Bookmark:= lbm;
end;


procedure TfmTTNPlan.actNaklAddSotaExecute(Sender: TObject);
var
  aKOD_CELL : string;
  lbm: TBookMarkStr;
begin
  if FiltActive<>0 then exit; //Антор
  lbm:= fdsNaklList.Bookmark;
  if fdsNaklListKOD_CELL.IsNull then
    raise Exception.Create('У торговой точки отсутствуе привязка к соте');

  aKOD_CELL := fdsNaklListKOD_CELL.AsString;
  fdsNaklList.First;
  while not fdsNaklList.Eof do
  begin
    if(not fdsNaklListKOD_CELL.IsNull)and
      (fdsNaklListKOD_CELL.AsString = aKOD_CELL) then
    begin
       if (actNaklAdd.Enabled) then actNaklAdd.Execute;
    end
    else
    fdsNaklList.Next;
  end;

  fdsNaklList.Bookmark:= lbm;
end;

procedure TfmTTNPlan.actNaklRemoveExecute(Sender: TObject);
var
  lbm: TBookMarkStr;
  i, ttnRecid, NAKLRecID, NAKLBaseId, parent_recid, parent_baseid: integer;
begin  //Удаление НАКЛАДНОЙ из текущего маршрута
  //lbm:= MegaDSTTNPlanPositions.Bookmark;
 {
    [gsa] 26-03-2019 удалить ТТ с маршрута, сделал так
    что бы можно было удалить несколько ТТ с маршрута.
  }
 if gridPlan.SelectedRows.Count = 0 then
    begin
       Abort('Не выделено ни одной позиции.');
    end else begin

       for I := 0 to gridPlan.SelectedRows.Count - 1 do
       begin
       gridPlan.DataSource.DataSet.GotoBookmark(pointer(gridPlan.SelectedRows.Items[I]));

       ttnRecid:= MegaDSTTNPlan.FieldByName('TTN_RECID').AsInteger;
       NAKLRecID:= MegaDSTTNPlanPositionsNAKL_RECID.Asinteger;
       NAKLBaseId:= MegaDSTTNPlanPositionsNAKL_BASEID.Asinteger;

       if MegaDSTTNPlan.FieldByName('TTN_RECID').AsInteger <> 0 then
        if MessageDlg('ТТН по маршруту уже создана.'+#13+#10+'Удалить данную ТТН и продолжить?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
          begin
            MegaDSTTNPlan.DeleteTTN(false);

            PARENT_RECID:= MegaDSTTNPlanPositionsNAKL_RECID.Asinteger;
            PARENT_BASEID:= MegaDSTTNPlanPositionsNAKL_BASEID.Asinteger;
            MegaDSTTNPlanPositions.Delete;
            // ищем подчиненные и запихиваем их тоже
            while MegaDSTTNPlanPositions.Locate('PARENT_RECID;PARENT_BASEID', VarArrayOf([PARENT_RECID, PARENT_BASEID]), []) do
             begin
               //MegaDSTTNPlanPositions.Add(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger);
               MegaDSTTNPlanPositions.Delete;
             end;

            actPlanRefresh.Execute;
            RefreshNaklList;
          end
        else begin end
       else
        begin

          fdsNaklList.Insert;
          fdsNaklListRECID.Asinteger := MegaDSTTNPlanPositionsNAKL_RECID.Asinteger;
          fdsNaklListBASEID.Asinteger := MegaDSTTNPlanPositionsNAKL_BASEID.Asinteger;
          fdsNaklList.Post;

        //  fdsNaklList.Refresh;
          PARENT_RECID:= MegaDSTTNPlanPositionsNAKL_RECID.Asinteger;
          PARENT_BASEID:= MegaDSTTNPlanPositionsNAKL_BASEID.Asinteger;

//            MegaDSTTNPlanPositions.ParamByName('OLD_DOCTYPE').AsString := MegaDSTTNPlanPositions.FieldByName('DOCTYPE').AsString;
         MegaDSTTNPlanPositions.Delete;
          // ищем подчиненные и запихиваем их тоже
            while MegaDSTTNPlanPositions.Locate('PARENT_RECID;PARENT_BASEID', VarArrayOf([PARENT_RECID, PARENT_BASEID]), []) do
             begin
               //MegaDSTTNPlanPositions.Add(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger);
               fdsNaklList.Insert;
               fdsNaklListRECID.Asinteger := MegaDSTTNPlanPositionsNAKL_RECID.Asinteger;
               fdsNaklListBASEID.Asinteger := MegaDSTTNPlanPositionsNAKL_BASEID.Asinteger;
               fdsNaklList.Post;
               MegaDSTTNPlanPositions.Delete;
             end;
           fdsNaklList.Refresh;
        if MegaDSTTNPlanPositions.updatetransaction.inTransaction then
           MegaDSTTNPlanPositions.updatetransaction.commit;
           actPlanRefresh.Execute;
        end;
       end;
      //MegaDSTTNPlanPositions.Bookmark:= lbm;
    end

end;

procedure TfmTTNPlan.actPlanRefreshExecute(Sender: TObject);
var
  lMinPercent: double;
begin             //Обновление таблицы Позиции накладных
  MegaDSTTNPlanPositions.RefreshTransportInfo;

  lbTonnage.Caption:= FloatToStrF(MegaDSTTNPlan.TotalTonnage, ffFixed, 15, 2);

  GaugeWeight.MinValue:= 0;
  GaugeWeight.MaxValue:= Round(MegaDSTTNPlan.TotalTonnage*1000); //Тонаж машины по справочнику
  GaugeWeight.Progress:= Round(MegaDSTTNPlanPositions.WeightTonn*1000); //Загуженность машины

  edOutletCount.Text:= IntToStr(MegaDSTTNPlanPositions.OutletCount);

  lMinPercent:= 0;
  if ((dbcbType.Text = sttndtOutCome) or (dbcbType.Text = sttndtOutComeATO) or (dbcbType.Text = sttndtOutComeDISTR))  then
    lMinPercent:= StrToIntDef(IntfMegaDBCommon.GetParam(sMinTTNLoadingPercent, '80'), 80);
  if ((dbcbType.Text = sttndtCity) or (dbcbType.Text = sttndtCityCash)) then
    lMinPercent:= StrToIntDef(IntfMegaDBCommon.GetParam(sMinTTNLoadingPercentCity, '80'), 80);
  //Минимально допустимая загрузка машины взависимости от ТИПА документа
  lbPercent.Caption:= FloatToStrF(lMinPercent, ffFixed, 15, 2);


  RefreshMinOutletCount;
  // заполним ovner-а у автомобилей !!!
  MegaSelTruck.Owner := MegaSelTransporter.KodTransporter;
  MegaSelTrailer1.Owner := MegaSelTransporter.KodTransporter;
  MegaSelTrailer2.Owner := MegaSelTransporter.KodTransporter;

  // для временного маршрута открываем панельку, чтобы можно было его "оживить"
  pn_MoveTempMarshr.Visible := (not MegaDSTTNPlanIS_TEMP_MARSHRUT.IsNull) and (MegaDSTTNPlanIS_TEMP_MARSHRUT.AsInteger = 1);
end;

procedure TfmTTNPlan.actPrintKomplOrderExecute(Sender: TObject);
begin
   dmMegaReports.MyShow(77,Now(),(MegaDSTTNPlanPLANDATE.asString)+','+MegaDSTTNPlanBASEID.asString);
end;

procedure TfmTTNPlan.actPrintKompMarshrutExecute(Sender: TObject);
begin
   dmMegaReports.MyShow(76,Now(),(MegaDSTTNPlanPLANDATE.asString)+','+MegaDSTTNPlanBASEID.asString);
end;

procedure TfmTTNPlan.actPrintPeriodExecute(Sender: TObject);
var
  form: TfmSetPeriod;
begin
  form:= TfmSetPeriod.Create(nil);
  try
    form.MegaPeriodPanel.FromDate:= Date - 10;
    form.MegaPeriodPanel.TillDate:= Date;
    if form.ShowModal = mrOk then
    begin
      Application.Hint:= sahmWaitForReportForming;
      Application.ProcessMessages;
      try
        dmMegaReports.MyShow(78,Now(),DateToStr(form.MegaPeriodPanel.FromDate)+','+DateToStr(form.MegaPeriodPanel.TillDate)+','+MegaDSTTNPlanBASEID.asString);
      finally
        Application.Hint:= '';
      end;
    end;
  finally
    form.Free;
  end;
end;

procedure TfmTTNPlan.actPrintPeriodExpeditorExecute(Sender: TObject);
var
  form: TfmSetPeriod;
begin
  form:= TfmSetPeriod.Create(nil);
  try
    form.MegaPeriodPanel.FromDate:= Date - 10;
    form.MegaPeriodPanel.TillDate:= Date;
    if form.ShowModal = mrOk then
    begin
      Application.Hint:= sahmWaitForReportForming;
      Application.ProcessMessages;
      try
        dmMegaReports.MyShow(79,Now(),DateToStr(form.MegaPeriodPanel.FromDate)+','+DateToStr(form.MegaPeriodPanel.TillDate)+','+MegaDSTTNPlanBASEID.asString);
      finally
        Application.Hint:= '';
      end;
    end;
  finally
    form.Free;
  end;

end;

procedure TfmTTNPlan.actPrintShetsExecute(Sender: TObject);
begin
  frxRepSchet.PrepareReport(true);
  frxRepSchet.ShowPreparedReport;
end;

procedure TfmTTNPlan.actPrintSvodAllExecute(Sender: TObject);
var
  form: TfmSetPeriod;
begin
  form:= TfmSetPeriod.Create(nil);
  try
    form.MegaPeriodPanel.FromDate:= Date - 10;
    form.MegaPeriodPanel.TillDate:= Date;
    if form.ShowModal = mrOk then
    begin
      Application.Hint:= sahmWaitForReportForming;
      Application.ProcessMessages;
      try
        dmMegaReports.MyShow(73,Now(),DateToStr(form.MegaPeriodPanel.FromDate)+','+DateToStr(form.MegaPeriodPanel.TillDate)+','+MegaDSTTNPlanBASEID.asString);
      finally
        Application.Hint:= '';
      end;
    end;
  finally
    form.Free;
  end;
end;

procedure TfmTTNPlan.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Transaction.InTransaction then
     Transaction.Commit;
end;

procedure TfmTTNPlan.actReportExecute(Sender: TObject);
begin

  try
    report.ParamByName('PLANDATE').AsDateTime:= MegaDatePanel.Date;
    report.ParamByName('BASEID').AsInteger   := StrToInt(MegaSelTradeDelegate.Value);  //IntfMegaDBCommon.GetBaseID;

    report.Open;
    if IntfMegaAccessManager.GetUserRole='DEVELOPER' then
       frReport.DesignReport
    else
       frReport.ShowReport;

  finally
    report.Close;
  end;
end;

procedure TfmTTNPlan.MegaSelTransporterChange(Sender: TObject);
begin
  if not fNotChangeNUM then
  begin
    MegaSelTruck.NUM:= '';
    MegaSelTrailer1.NUM:= '';
    MegaSelTrailer2.NUM:= '';
  end;

  MegaSelTruck.Owner:= MegaSelTransporter.KodTransporter;
  MegaSelTrailer1.Owner:= MegaSelTransporter.KodTransporter;
  MegaSelTrailer2.Owner:= MegaSelTransporter.KodTransporter;
end;

procedure TfmTTNPlan.listTonnag;
var
  scr, dk_to, in_baseid,in_tonnage:string;
begin

    //-----[gsa] 31-05-2019 запрос на заполнения поля по весу в заголовке.
    if actPlanHeaderShow.Checked then
    begin
        //ttn_list_tonnage(:dk_to, :in_baseid, :in_tonnage)
        dk_to:= MegaDSTTNPlan.FieldByName('dk_to').AsString;
        in_tonnage:= lbTonnage.Caption; //CurrToStr(gridPlan.SumList.SumCollection[0].SumValue);
        in_baseid:= IntToStr(IntfMegaDBCommon.GetBaseID);


        if dk_to = '' then Exit;
        if in_baseid = '' then Exit;


        scr:='select owner, baseid, cast(tonnage as double precision) tonnage, ' +
             ' cost_km, cost_day, cost_km_por, activ, description,' +
             ' NO_VAT_RATE, NO_VAT_TARIFF, VAT_RATE,VAT_TARIFF,MILEAGE ' +
             ' from ttn_list_tonnage('+dk_to+', '+in_baseid+', '+ StringReplace(in_tonnage, ',', '.', [rfReplaceAll]) +') '+
             ' order by owner, tonnage';

         mgdTonnag1.Close;
         mgdTonnag1.SQLs.SelectSQL.Text:=scr;
         mgdTonnag1.Open();
    end;
   //-----END-------------------
end;


//------------------------------------------------------------------------------
procedure TfmTTNPlan.actPlanHeaderShowExecute(Sender: TObject);
begin
//
  actPlanHeaderShow.Checked:= not actPlanHeaderShow.Checked;
  pnPlanHeader.Visible:= actPlanHeaderShow.Checked;
  listTonnag;
end;

procedure TfmTTNPlan.actPlanPosUpExecute(Sender: TObject);
begin
//  gridPlan.ClearSelection;
  MegaDSTTNPlanPositions.MoveUp;
  MegaDSTTNPlanPositions.Prior;
//  gridPlan.FocusedNode.Selected:= true;
end;

procedure TfmTTNPlan.actPlanPosDownExecute(Sender: TObject);
begin
  MegaDSTTNPlanPositions.Next;
  MegaDSTTNPlanPositions.MoveUp;
end;

// BEGIN add new nirs 18_03_2025
// procedure TfmTTNPlan.actTransitDateExecute(Sender: TObject);
//  var
//    mQuery: TMegaQuery;
//    Selected: TDateTime;
// begin
//   // Selected := MegaDatePanel.Date + 2;
//    Selected := ShowDateInputForm;
//    if Selected <> 0 then begin
//      mQuery := TMegaQuery.Create(Self);
//     try
//     if fdsNaklList.Active then begin
//        MegaTranW.Active := True;
//        mQuery.DataBase:= DM.Money;
//        mQuery.Transaction:= MegaTranW;
//        mQuery.SQL.Text:= 'EXECUTE PROCEDURE SET_INKASS_DATE(:RECID, :BASEID, :DOCDATE)';
//        mQuery.ParamByName('RECID').AsInteger := fdsNaklListRECID.AsInteger;
//        mQuery.ParamByName('BASEID').AsInteger := fdsNaklListBASEID.AsInteger;
//        mQuery.ParamByName('DOCDATE').AsDateTime := Selected;
//        mQuery.ExecQuery;
//        MegaTranW.Commit;
//     end;
//     finally
//       mQuery.Free;
//     end;
//    end;
// end;


procedure TfmTTNPlan.actTransitDateExecute(Sender: TObject);
 var
   mQuery: TMegaQuery;
   Selected: TDateTime;
   NklRecID, NklBaseID, i: integer;
   lbm, lbm2: TBookMarkStr;
   dtype: string;
begin
  // Selected := MegaDatePanel.Date + 2;
   Selected := ShowDateInputForm;
   if Selected <> 0 then begin
     mQuery := TMegaQuery.Create(Self);
     if gridNaklDBBandedTableView1.Controller.SelectedRowCount > 1 then
       if MessageDlg('Підтвердіть будь ласка: перенесення Дати усіх виділених позицій типу "Звірка"? ', mtConfirmation, [mbYes,mbNo], 0) = mrNo then Exit;
    fdsNaklList.DisableControls;
    try
      mQuery.DataBase:= DM.Money;
      mQuery.Transaction:= MegaTranW;
      MegaTranW.Active := True;
     if fdsNaklList.Active then begin      
      for i:= 0 to gridNaklDBBandedTableView1.Controller.SelectedRowCount - 1 do begin
        NklRecID := gridNaklDBBandedTableView1.Controller.SelectedRows[i].Values[gridNaklDBBandedTableView1RECID.Index];
        NklBaseID := gridNaklDBBandedTableView1.Controller.SelectedRows[i].Values[gridNaklDBBandedTableView1BASEID.Index];
        if not fdsNaklList.Locate('RECID;BASEID', VarArrayOf([NklRecID, NklBaseID]), []) then
           raise Exception.Create('Помилка проходу по виділеним позиціям в накладних! Спробуйте переміщувати тільки по одній позиції!');
        dtype := fdsNaklList.FieldByName('DOCTYPE').AsString;
        if dtype <> cnstZvirka then begin
           MessageDlg('Увага! Документ з типом: ' +dtype+' перемістити в дату не можливо!',  mtInformation, [mbOk], 0);
           actPlanRefresh.Execute;
           fdsNaklList.Bookmark:= lbm;
           fdsNaklList.EnableControls;
           Exit;
        end;
        mQuery.SQL.Text:= 'EXECUTE PROCEDURE SET_INKASS_DATE(:RECID, :BASEID, :DOCDATE)';
        mQuery.ParamByName('RECID').AsInteger := fdsNaklListRECID.AsInteger;
        mQuery.ParamByName('BASEID').AsInteger := fdsNaklListBASEID.AsInteger;
        mQuery.ParamByName('DOCDATE').AsDateTime := Selected;
        mQuery.ExecQuery;
      end;
     end;
     MegaTranW.Commit;
    finally
      mQuery.Free;
      fdsNaklList.EnableControls;
    end;
   end;
end;


//-------------BEGIN it can be deleted!!!
// procedure TfmTTNPlan.TestDateInputForm;
// var
//   Selected: TDateTime;
// begin
//   // Call the function and get the selected date
//   Selected := ShowDateInputForm;
//   // Show the selected date or a message if none was selected
//   if Selected <> 0 then
//     ShowMessage('Selected Date: ' + DateToStr(Selected))
//   else
//     ShowMessage('No date was selected.');
// end;
//-------------END it can be deleted!!!

// Event handler procedure for the button click
procedure TfmTTNPlan.ConfirmButtonClick(Sender: TObject);
var
  DatePicker: TDateTimePicker;
  ParentForm: TForm;
begin
  // Cast the sender's owner to the form
  ParentForm := TForm((Sender as TButton).Owner);

  // Find the DateTimePicker component on the form
  DatePicker := ParentForm.FindComponent('DatePicker') as TDateTimePicker;

  // Retrieve the selected date
  if Assigned(DatePicker) then
    FSelectedDate := DatePicker.Date;

  // Close the form with a modal result
  ParentForm.ModalResult := mrOk;
end;

function TfmTTNPlan.ShowDateInputForm: TDateTime;
var
  DateForm: TForm;
  DatePicker: TDateTimePicker;
  ConfirmButton: TButton;
  MousePos: TPoint;
begin
  // Default result if no date is selected
  Result := 0;

  // Create the form dynamically
  DateForm := TForm.Create(nil);
  try
    DateForm.Caption := 'Виберіть дату:';
    DateForm.Width := 300;
    DateForm.Height := 150;
    DateForm.Position := poDesigned;

    GetCursorPos(MousePos);
    DateForm.Left := MousePos.X-50; // Set the X-coordinate
    DateForm.Top := MousePos.Y-50;  // Set the Y-coordinate

    // Create the DateTimePicker dynamically
    DatePicker := TDateTimePicker.Create(DateForm);
    DatePicker.Name := 'DatePicker'; // Assign a name to find it later
    DatePicker.Parent := DateForm;
    DatePicker.Left := 50;
    DatePicker.Top := 30;
    DatePicker.Width := 200;
    DatePicker.Format := 'dd.MM.yyyy'; // Customize the date format
    DatePicker.Date := MegaDatePanel.Date + 2;

    // Create the Confirm button dynamically
    ConfirmButton := TButton.Create(DateForm);
    ConfirmButton.Parent := DateForm;
    ConfirmButton.Caption := 'OK';
    ConfirmButton.Left := 100;
    ConfirmButton.Top := 70;
    ConfirmButton.Width := 100;

    // Assign the ConfirmButtonClick event handler
    ConfirmButton.OnClick := ConfirmButtonClick;

    // Show the form as modal and return the result
    if DateForm.ShowModal = mrOk then
      Result := FSelectedDate;

  finally
    DateForm.Free; // Ensure resources are freed after the form is closed
  end;
end;
// END add new nirs 18_03_2025


procedure TfmTTNPlan.actTTNCreateExecute(Sender: TObject);
var
  MinSumma : string;
  MessageStr : string;
  scr:string;
begin

  if dbedCAR_DRIVER.Showing then
    dbcbType.SetFocus; //фиктивный код, но без этого почему-то не устанавливается свойство Modified у датасета

 {  //[gsa] 040619 добавил для фиксации плана
  if dbtxtTonnag.Caption<>'' then   begin
       if((fltfldDEBET_KOD_MATERMegaDSTTNPlanTONNAG.AsString <> '') and(MegaDSTTNPlanENABLE_NOT_RENTABLE.AsInteger <> 0))then
          begin
              Abort;
          end;
        scr:='update ttn_plan set tonnag='+(dbtxtTonnag.Caption)+' '+
            ' where plandate='''+DateToStr(MegaDatePanel.Date)+''' and plannumber='+IntToStr(MegaDSTTNPlanPLANNumber.AsInteger)  +''+
            ' and baseid='+IntToStr(IntfMegaDBCommon.GetBaseID)+' ';
         mQuery1.Close;
         mQuery1.SQL.Text:=scr;
         mQuery1.ExecQuery;
         mQuery1.Close;
  end;
         }


  if (MegaDSTTNPlan.State = dsInsert) or (MegaDSTTNPlan.State = dsEdit) then
    MegaDSTTNPlan.Post;

  if not
     ({IntfMegaDBCommon.IsOffice or}
      IntfMegaAccessManager.IsAdmin or
      IntfMegaCommon.getFM or
      IntfMegaAccessManager.IsOfficeOperator
     ) then
   begin
    if not CanCreateTTN then
    begin
      MessageBox(Application.Handle,'Обращайтесь в отдел логистики.'+#13#10+'Создание ТТН не возможно!','Ошибка!',MB_OK+MB_ICONERROR+MB_APPLMODAL);
      Exit;
    end;
     //проверка на минимальній заказ
   { MinSumma := CheckMinSum(TMegaTransaction(MegaDSTTNPlan.Transaction),
                 MegaDSTTNPlanPLANDATE.AsDateTime,
                 MegaDSTTNPlanBASEID.AsInteger,
                 MegaDSTTNPlanPLANNUMBER.asInteger);
    if MinSumma <>'' then
    begin
        MessageStr := 'Накладные, №'+#13#10 + MinSumma+ #13#10+
                      'не удовлетворяют условию минимального заказа.'+ #13#10+'Операция проведения партии невозможна!';
        MessageBox(Application.Handle,PChar(MessageStr),'Проведение партии',MB_OK+MB_ICONERROR+MB_APPLMODAL);

      Exit;
    end; }
   end;
  if ((dbcbType.Text = sttndtReclame) and (IntfMegaAccessManager.GetUserRole <> 'TRANSPORT_AUDIT'))  then
  begin
    MessageBox(Application.Handle,'Обращайтесь в отдел логистики.'+#13#10+'Накладную с типо "ДР" может создавть только человек с ролью TRANSPORT_AUDIT!','Ошибка!',MB_OK+MB_ICONERROR+MB_APPLMODAL);
    Exit;
  end;
  MegaDSTTNPlan.CreateTTN(MegaDSTTNPlanPositions);
  IsTTNCreated;
end;

procedure TfmTTNPlan.actTTNCreateUpdate(Sender: TObject);

var CrUpdEnable:Boolean;

begin
  CrUpdEnable:=true;

  //Для Украины - если маршрут следующего дня, то проверить можно ли в данный момент создавать ТТН
  if (IntfMegaDBCommon.GetCountry = iccUkraine) then
  begin
    //процедура TTN_MARSH_EDIT_ALLOW
    if (mqAllowCrTTN.Open) then mqAllowCrTTN.Close;
    mqAllowCrTTN.ParamByName('marsh_date').AsDate:= MegaDatePanel.Date;
    mqAllowCrTTN.ExecQuery;
   // CrUpdEnable:= mqAllowCrTTN.FieldByName('allow').AsBoolean;
    //Пусть проверяет через некоторое время
    //Timer1.Enabled:=not(CrUpdEnable);
    CrUpdEnable:=(mqAllowCrTTN.FieldByName('allow').AsBoolean) or (MegaDatePanel.Date>=IntfMegaDBCommon.GetParam('UNLOCKDATE',IntfIBCommon.GetServerDate));
  end;

  cxLabel2.Visible:=not(CrUpdEnable);

  TAction(sender).Enabled := (MegaDSTTNPlanIS_TEMP_MARSHRUT.IsNull or
                            (MegaDSTTNPlanIS_TEMP_MARSHRUT.AsInteger<>1)) and
                            CrUpdEnable;

end;

procedure TfmTTNPlan.actTTNDeleteExecute(Sender: TObject);
begin
  MegaDSTTNPlan.DeleteTTN;
  IsTTNCreated;
  //Transaction.CommitRetaining;
end;

procedure TfmTTNPlan.actTTNDeleteUpdate(Sender: TObject);

var CrUpdEnable:Boolean;

begin
  CrUpdEnable:=true;

  //Для Украины - если маршрут следующего дня, то проверить можно ли в данный момент создавать ТТН
  if ((IntfMegaDBCommon.GetCountry = iccUkraine)) then
  begin
    //Пусть проверяет через некоторое время
    if(Timer1.Enabled=false) then Timer1.Enabled:=true;
    //процедура TTN_MARSH_EDIT_ALLOW
    if (mqAllowCrTTN.Open) then mqAllowCrTTN.Close;
    mqAllowCrTTN.ParamByName('marsh_date').AsDate:= MegaDatePanel.Date;
    mqAllowCrTTN.ExecQuery;
    CrUpdEnable:= (mqAllowCrTTN.FieldByName('allow').AsBoolean) or (MegaDatePanel.Date>=IntfMegaDBCommon.GetParam('UNLOCKDATE',IntfIBCommon.GetServerDate));

  end;

  cxLabel2.Visible:=not(CrUpdEnable);
  TAction(sender).Enabled := (MegaDSTTNPlanIS_TEMP_MARSHRUT.IsNull or
                            (MegaDSTTNPlanIS_TEMP_MARSHRUT.AsInteger<>1)) and
                            CrUpdEnable;
end;

procedure TfmTTNPlan.fdsNaklList2CalcFields(DataSet: TDataSet);
begin
  if fdsNaklListOPER_STATUS.AsInteger = 3
  then fdsNaklListCALC_OPERSTATUS.AsString:= 'A';

  if fdsNaklListOPER_STATUS.AsInteger = 4
  then fdsNaklListCALC_OPERSTATUS.AsString:= 'B';

  if fdsNaklListDELIV_TIME.AsString ='' then
   if fdsNaklListdesireddeliverytime.AsString ='' then fdsNaklListRes_deliveryTime.AsString := 'Любое'
     else fdsNaklListRes_deliveryTime.AsString := GetDecodeDeliveryTime(fdsNaklListdesireddeliverytime.AsString)
   else fdsNaklListRes_deliveryTime.AsString := GetDecodeDeliveryTime(fdsNaklListDELIV_TIME.AsString);
end;



// BEGIN add new nirs 03_04_2026
// procedure TfmTTNPlan.MegaDSTTNPlanPositionsCalcFields(DataSet: TDataSet);
// begin
//   if MegaDSTTNPlanPositionsOPER_STATUS.AsInteger = 3
//   then MegaDSTTNPlanPositionsCALC_OPERSTATUS.AsString:= 'A';

//   if MegaDSTTNPlanPositionsOPER_STATUS.AsInteger = 4
//   then MegaDSTTNPlanPositionsCALC_OPERSTATUS.AsString:= 'B';

//   if MegaDSTTNPlanPositionsDELIV_TIME.AsString ='' then
//    if MegaDSTTNPlanPositionsdesireddeliverytime.AsString='' then MegaDSTTNPlanPositionsRes_deliveryTime.AsString := 'Любое'
//     else MegaDSTTNPlanPositionsRes_deliveryTime.AsString := GetDecodeDeliveryTime( MegaDSTTNPlanPositionsdesireddeliverytime.AsString )
//    else MegaDSTTNPlanPositionsRes_deliveryTime.AsString := GetDecodeDeliveryTime( MegaDSTTNPlanPositionsDELIV_TIME.AsString );

// end;


procedure TfmTTNPlan.MegaDSTTNPlanPositionsCalcFields(DataSet: TDataSet);
var
  DelivTime: string;
begin
  if MegaDSTTNPlanPositionsOPER_STATUS.AsInteger = 3
  then MegaDSTTNPlanPositionsCALC_OPERSTATUS.AsString:= 'A';

  if MegaDSTTNPlanPositionsOPER_STATUS.AsInteger = 4
  then MegaDSTTNPlanPositionsCALC_OPERSTATUS.AsString:= 'B';

  DelivTime:= Trim(MegaDSTTNPlanPositionsDELIV_TIME.AsString);
  if (DelivTime ='') or (DelivTime ='01.01.19') or (DelivTime ='01.01.1900') then
   if MegaDSTTNPlanPositionsdesireddeliverytime.AsString='' then MegaDSTTNPlanPositionsRes_deliveryTime.AsString := 'Любое'
    else MegaDSTTNPlanPositionsRes_deliveryTime.AsString := GetDecodeDeliveryTime( MegaDSTTNPlanPositionsdesireddeliverytime.AsString )
   else MegaDSTTNPlanPositionsRes_deliveryTime.AsString := GetDecodeDeliveryTime( DelivTime );

end;

// END add new nirs 03_04_2026

procedure TfmTTNPlan.MegaSelTruckChange(Sender: TObject);
begin
  actPlanRefresh.Execute;
  listTonnag;
end;

procedure TfmTTNPlan.MenuItem1Click(Sender: TObject);
const sDocs='select distinct '#13#10+
  ' dn.recid ID   '#13#10+
  //' ,cast(dn.recid*1000+dn.baseid as double precision) UNISTRING   '#13#10+
  ' ,dn.recid||substring(dn.baseid + 1000 from 2 for 3) UNISTRING   '#13#10+
  ' ,dn.docnumber NUMBER_DOC   '#13#10+
  ' ,dn.baseid FROM_ID   '#13#10+
  ' ,cast((dl.outlet_recid*1000+dl.outlet_baseid) as double precision)  TO_ID   '#13#10+
  ' ,cast(dn.docdate as DATE) DOC_DATE  '#13#10+
 // ' ,cast(:ADate as date) DOC_DATE  '#13#10+
  ' ,gds.doc_summa SUMMA  '#13#10+
  ' ,(select ROUND(sum(dnpsum.kolich*smsum.brutto),0)/1000  '#13#10+
  '  from doc_nakl dnsum  '#13#10+
  ' left join doc_nakl_pos dnpsum on (dnpsum.docrecno=dnsum.recid and dnpsum.baseid=dnsum.baseid)  '#13#10+
  ' left join sprav_mater smsum on (smsum.kod_mater= dnpsum.kod_mater)  '#13#10+
  ' where dnsum.recid=dn.recid and dnsum.baseid=dn.baseid) MASSA   '#13#10+
  ' ,(select sum(dnpsum.kolich/(iif((smsum.countinbox is null) or (smsum.countinbox = 0) ,dnpsum.kolich,smsum.countinbox)))  '#13#10+
  '  from doc_nakl dnsum  '#13#10+
  ' left join doc_nakl_pos dnpsum on (dnpsum.docrecno=dnsum.recid and dnpsum.baseid=dnsum.baseid)  '#13#10+
  ' left join sprav_mater smsum on (smsum.kod_mater= dnpsum.kod_mater)  '#13#10+
  ' where dnsum.recid=dn.recid and dnsum.baseid=dn.baseid) OBEM  '#13#10+
  ' ,dn.notes COMMENTS   '#13#10+
  ' ,(select sum(dnpsum.kolich)  '#13#10+
  '  from doc_nakl dnsum   '#13#10+
  ' left join doc_nakl_pos dnpsum on (dnpsum.docrecno=dnsum.recid and dnpsum.baseid=dnsum.baseid)  '#13#10+
  ' left join sprav_mater smsum on (smsum.kod_mater= dnpsum.kod_mater)  '#13#10+
  ' where dnsum.recid=dn.recid and dnsum.baseid=dn.baseid) QTY   '#13#10+
  ' ,1 DOCS_TYPE                                                 '#13#10+
  ' ,1 GRUZ_TYPE_ID                                              '#13#10+
  ' ,iif(char_length(dl.deliv_time)=4, SUBSTRING(dl.deliv_time from 1 for 2)||'':''||SUBSTRING(dl.deliv_time from 3 for 2),'''') TIME1 '#13#10+
  ' ,iif(char_length(dl.deliv_time)=4, SUBSTRING(dl.deliv_time from 1 for 2)||'':''||SUBSTRING(dl.deliv_time from 3 for 2),'''') TIME2 '#13#10+
  ' from proc_get_nakl_for_ttn_all(:ADate, :baseid, :BDate, :filt) pgnft    '#13#10+
  ' left join doc_nakl dn on (dn.recid=pgnft.recid and dn.baseid=pgnft.baseid)  '#13#10+
  ' left join GET_DOC_SUMM(dn.recid, dn.baseid, 1) gds on 1=1    '#13#10+
  ' LEFT JOIN DELIVERY_LOCATION DL ON (DL.FORMTYPE=1 AND DL.BASEID=dn.BASEID AND  DL.DOCRECNO=dn.RECID)';
  sFirms='select  distinct      '#13#10+
  ' (dl.outlet_recid*1000+dl.outlet_baseid) UNISTRING     '#13#10+
  ' ,sd_otl.name_dk NAME    '#13#10+
  ' ,sd_otl.name_dk FULLNAME     '#13#10+
  ' ,iif((td.address like ''%''||snp.nas_p_name||'' %'') or (td.address like ''%''||snp.nas_p_name||'',%'') ,td.address,''м.''||snp.nas_p_name||'',''||td.address) ADRESS     '#13#10+
  ' ,iif (oom.WORKTIMEFROM is null,''00:00'', iif (oom.WORKTIMEFROM=''  :'',''00:00'',iif (oom.WORKTIMEFROM=''00:0'',''00:00'',iif (oom.WORKTIMEFROM=''80:00'',''08:00'',    '#13#10+
  ' iif (oom.WORKTIMEFROM=''9 :'',''09:00'',iif (oom.WORKTIMEFROM=''08:0'',''08:00'',iif (oom.WORKTIMEFROM=''09:0'',''09:00'',iif (oom.WORKTIMEFROM=''10:0'',''10:00'',oom.WORKTIMEFROM)))))))) UPLIMTIME0    '#13#10+
  ' ,iif (oom.WORKTIMETILL is null,''24:00'',iif (oom.WORKTIMETILL=''  :'',''24:00'',iif (oom.WORKTIMETILL=''00:0'',''24:00'',iif (oom.WORKTIMETILL=''20:0'',''20:00'',   '#13#10+
  ' iif (oom.WORKTIMETILL=''22:0'',''22:00'',iif (oom.WORKTIMETILL=''19:0'',''19:00'',iif (oom.WORKTIMETILL=''18:0'',''18:00'',iif (oom.WORKTIMETILL=''19:'',''19:00'',iif (oom.WORKTIMETILL=''18:'',''18:00'',oom.WORKTIMETILL))))))))) DNLIMTIME0    '#13#10+
  ' ,oom.BREAKTIMEFROM UPLIMTIME1     '#13#10+
  ' ,oom.BREAKTIMETILL DNLIMTIME1     '#13#10+
  ' ,1 USED                           '#13#10+
 // ' ,sto.category CLIENTS_TYPE_ID      '#13#10+
  ' ,sto.gps_avg_width   GPS_X         '#13#10+
  ' ,sto.gps_avg_heigth GPS_Y ,dn.notes, occ.TIME_WAIT          '#13#10+
  '           from proc_get_nakl_for_ttn_all(:ADate, :baseid, :BDate, :filt) pgnft      '#13#10+
  '           left join doc_nakl dn on (dn.recid=pgnft.recid and dn.baseid=pgnft.baseid)    '#13#10+
  '           LEFT JOIN DELIVERY_LOCATION DL ON (DL.FORMTYPE=1 AND DL.BASEID=dn.BASEID AND  DL.DOCRECNO=dn.RECID)     '#13#10+
  '           LEFT JOIN SPRAV_DK_ADDRESS TD ON (TD.BASEID=DL.BASEID AND TD.RECID=DL.LOCRECNO)    '#13#10+
  '           left join sprav_nas_p snp on (snp.nas_p_id = td.nas_p_id and snp.country_id = td.country_id) '#13#10+
  '           left join sprav_trade_outlet sto on (sto.recid=dl.outlet_recid and sto.baseid=dl.outlet_baseid)    '#13#10+
  '           left join sprav_dk sd_otl on (sd_otl.kod_dk=sto.kod_dk)                                             '#13#10+
  '           left join doc_nakl_pos dnp on (dnp.docrecno=dn.recid and dnp.baseid=dn.baseid)                     '#13#10+
  '           left join sprav_mater sm on (sm.kod_mater= dnp.kod_mater)                                          '#13#10+
  '           left join group_mater gm on (gm.group_mater= sm.group_mater)                                        '#13#10+
  '           left join PROC_GET_KLADOV_NUM(gm.group_mater, DN.cfo) gms on 1=1                                    '#13#10+
  '           left join doc_party dp  on ( dp.number=dnp.party )                                                  '#13#10+
  '           left join dbf_product db_pr on (db_pr.ukp = dnp.ukp)                                                 '#13#10+
  '           left join outlet_category occ on (occ.id = sto.category)                                                 '#13#10+
  '           left join OUTLET_SCHEDULE_RECEPTION oom on (oom.outlet_recid = dl.outlet_recid and oom.outlet_baseid = dl.outlet_baseid and oom.day_number=EXTRACT(WEEKDAY FROM dn.operdate))';



  var F:TextFile;
   OldDir,DirSave,s,DatS,DatPo, Notes:String;
   dlg:TDlgEnterPeriod;
begin
   OldDir:=IntfMegaDBCommon.GetParam('MAPXPLUS_PATH_OUT','');
   Get_Dir(OldDir,DirSave);
   if DirSave='' then Exit;

   if Application.MessageBox(pchar('При выгрузке информации в файлы будет использован фильтр "'+cbFilt.Text+'". Продолжить? '),
                             'Подтвердите действие...',
                             MB_YESNO+MB_ICONQUESTION)<>ID_YES
     then Exit;

  { dlg:=TDlgEnterPeriod.Create(self);
   try
      dlg.InitFrom_SysDateSource;
      if dlg.ShowModal=mrOk then
         dlg.saveFrom_SysDateSource;
   finally
      dlg.Free;
   end;   }
   sQuery.Close;
   sQuery.SQL.Text:=sDocs;
   sQuery.ParamByName('ADATE').AsDateTime:= MegaDatePanel.Date;//DM.SysDateSource.DataSet.FieldByName('BeginDate').asDateTime;//
   sQuery.ParamByName('BDATE').AsDateTime:= MegaDatePanel.Date;// DM.SysDateSource.DataSet.FieldByName('EndDate').asDateTime;//MegaDatePanel.Date;
   sQuery.ParamByName('filt').AsInteger := cbFilt.ItemIndex;
   if MegaSelTradeDelegate.Value = '' then
     begin
       MegaSelTradeDelegate.ComboBox.SetFocus;
       raise Exception.Create('Выберите регион!');
     end;
   sQuery.ParamByName('BASEID').AsInteger:= StrToInt(MegaSelTradeDelegate.Value);
   sQuery.ExecQuery;
   
   AssignFile(f,DirSave+'docs.csv');
   Rewrite(f);
   Writeln(f,'UNISTRING;NUMBER_DOC;FROM_ID;TO_ID;DOC_DATE;SUMMA;MASSA;OBEM;COMMENTS;QTY;DOCS_TYPE;GRUZ_TYPE_ID;TIME1;TIME2');
   while not sQuery.EOF do
      begin
       Writeln(f,sQuery.FieldByName('UNISTRING').AsString+';'+sQuery.FieldByName('NUMBER_DOC').AsString+';'+sQuery.FieldByName('FROM_ID').AsString+';'+
       sQuery.FieldByName('TO_ID').AsString+';'+sQuery.FieldByName('DOC_DATE').AsString+';'+sQuery.FieldByName('SUMMA').AsString+';'+
       sQuery.FieldByName('MASSA').AsString+';'+sQuery.FieldByName('OBEM').AsString+';'+
       ReplaceStr(ReplaceStr(ReplaceStr(sQuery.FieldByName('COMMENTS').AsString,#13,''),#10,''),';','')+';'+
       sQuery.FieldByName('QTY').AsString+';'+sQuery.FieldByName('DOCS_TYPE').AsString+';'+
       sQuery.FieldByName('GRUZ_TYPE_ID').AsString+';'+sQuery.FieldByName('TIME1').AsString+';'+sQuery.FieldByName('TIME2').AsString);
       sQuery.Next
      end;
    sQuery.Close;
    CloseFile(f);
   sQuery.SQL.Text:=sFirms;
   sQuery.ParamByName('ADATE').AsDateTime:= MegaDatePanel.Date;//DM.SysDateSource.DataSet.FieldByName('BeginDate').asDateTime;//MegaDatePanel.Date;
   sQuery.ParamByName('BDATE').AsDateTime:= MegaDatePanel.Date;//DM.SysDateSource.DataSet.FieldByName('EndDate').asDateTime;//MegaDatePanel.Date;
   sQuery.ParamByName('filt').AsInteger := cbFilt.ItemIndex;
   if MegaSelTradeDelegate.Value = '' then
     begin
       MegaSelTradeDelegate.ComboBox.SetFocus;
       raise Exception.Create('Выберите регион!');
     end;
   sQuery.ParamByName('BASEID').AsInteger:= StrToInt(MegaSelTradeDelegate.Value);
   sQuery.ExecQuery;
   AssignFile(f,DirSave+'firms.csv');
   Rewrite(f);                                                                                                //  CLIENTS_TYPE_ID;
   Writeln(f,'UNISTRING;NAME;FULLNAME;ADRESS;TIME_WAIT;UPLIMTIME0;DNLIMTIME0;UPLIMTIME1;DNLIMTIME1;USED;GPS_X;GPS_Y');
   while not sQuery.EOF do
      begin  //СЕРТИФИКАТЫ НУЖНЫ Доставка: с 10:00 по 17:00   notes
       //if sQuery.FieldByName('UNISTRING').AsString then
       
        Notes:=sQuery.FieldByName('NOTES').AsString;
       if Pos('Доставка: с ',Notes)>0 then
         begin
            DatS:=Copy(Notes,Pos('Доставка: с ',Notes)+12,5);
            DatPo:=Copy(Notes,Pos('Доставка: с ',Notes)+21,5);
         end
           else
             begin
                DatS:=sQuery.FieldByName('UPLIMTIME0').AsString;
                DatPo:=sQuery.FieldByName('DNLIMTIME0').AsString;
             end;
       Writeln(f,sQuery.FieldByName('UNISTRING').AsString+';'+
       ReplaceStr(ReplaceStr(ReplaceStr(sQuery.FieldByName('NAME').AsString,#13,''),#10,''),';','')+';'+
       ReplaceStr(ReplaceStr(ReplaceStr(sQuery.FieldByName('FULLNAME').AsString,#13,''),#10,''),';','')+';'+
       ReplaceStr(ReplaceStr(ReplaceStr(sQuery.FieldByName('ADRESS').AsString,#13,''),#10,''),';','')+';'+sQuery.FieldByName('TIME_WAIT').AsString+';'+
       //sQuery.FieldByName('UPLIMTIME0').AsString+';'+sQuery.FieldByName('DNLIMTIME0').AsString
       DatS+';'+DatPo+';'+sQuery.FieldByName('UPLIMTIME1').AsString+';'+
       sQuery.FieldByName('DNLIMTIME1').AsString+';'+sQuery.FieldByName('USED').AsString+';'+//sQuery.FieldByName('CLIENTS_TYPE_ID').AsString+';'+
       sQuery.FieldByName('GPS_X').AsString+';'+sQuery.FieldByName('GPS_Y').AsString);
       sQuery.Next
      end;
  sQuery.Close;
  CloseFile(f);
  ShowMessage('Выгрузка завершена');

end;

procedure TfmTTNPlan.MenuItem2Click(Sender: TObject);
var
mCount,aCount,i,RouteCount,RoutePor,RouteID,G_Count,R_Count,wordnum:integer;
UpdatePlan, st,st1,Dir,param,RouteNum:string;
svcFile:TextFile;
sl,sls,NPlan,srow:TStringList;
RouteList: TList;
PlanUpd:boolean;
reg, reg_tail : TregExpr;
MyEx: OleVariant;
ExApp: string;
begin
    Dir:=IntfMegaDBCommon.GetParam('MAPXPLUS_PATH_IN','');
    MainForm.InfoPanel.Visible:=true;
    MainForm.spInfo.Visible:=true;

    MegaDSTTNPlan.Close;
    MegaDSTTNPlan.Open(MegaDatePanel.Date, StrToInt(MegaSelTradeDelegate.Value));
    MegaDSTTNPlan.Locate('PLANNUMBER', StrToInt(MegaSelTradeDelegate.Value), []);
   if  MegaDSTTNPlan.RecordCount=0 then
   begin
     MainForm.reInfo.Lines.Add('!!!Ошибка!!!. Создайте маршруты в Моней' ) ;
     exit;
   end;

   if not (FileExists(Dir+'Route.CSV')) then
     begin
       MainForm.reInfo.Lines.Add('Нет маршрутов для загрузки') ;
       exit;
    end;
    //****************************************************
    try
      fmTTNRoadCheck:=TfmTTNRoadCheck.Create(Application);
      fmTTNRoadCheck.clRoad.Items.Clear;
      RoadList.Clear;
      AssignFile(svcFile, Dir+'Route.CSV');
      Reset(svcFile);
      ReadLn(svcFile, st);
      RouteNum:='';
       sls := TStringList.Create;
      while not Eof(svcFile) do
        begin
          ReadLn(svcFile, st);
          if Length(st)>20 then
            begin
               param:='';
               for I := 1 to Length(st) do
                 if st[i]=';' then
                   begin
                     sls.Add(param);
                     param:='';
                   end
                     else param:=param+st[i];
              if sls.Strings[0]<>RouteNum then
                begin
                  RouteNum:=sls.Strings[0];
                  fmTTNRoadCheck.clRoad.Items.Add(sls.Strings[0]+'('+sls.Strings[1]+' Автомобиль: '+sls.Strings[3]+' Масса: '+sls.Strings[8]+' Расстояние: '+sls.Strings[6] +')');
                end;

            end;
            sls.Clear;
        end;
      CloseFile(svcFile);

      fmTTNRoadCheck.ShowModal;
    except
      CloseFile(svcFile);
      sls.Free;
      MainForm.reInfo.Lines.Add('!!!Ошибка!!!. При обработке файла Route.CSV' ) ;
      exit;
    end;

    if RoadList.Count=0 then
      begin
        ShowMessage('Не выбрано ни одного маршрута для импорта');
        sls.Free;
        exit;
      end;
        st:='';
    {  for I := 0 to RoadList.Count - 1 do
        begin
          st:=st+RoadList.Strings[i]+#13#10;
        end;
       ShowMessage(st);}
    //****************************************************
    if isFirst then
      begin
        MainForm.reInfo.Lines.Add('Очистка маршрутов');
        MegaDSTTNPlan.First;
        while not  MegaDSTTNPlan.Eof do
        begin
           if (MegaDSTTNPlanPLANNUMBER.AsInteger<MStart) or (MegaDSTTNPlanPLANNUMBER.AsInteger>MFinish) then

          MegaDSTTNPlan.DeleteTTN(false);
          if not (MegaDSTTNPlan.State  in [dsEdit,dsInsert]) then MegaDSTTNPlan.Edit;
          MegaDSTTNPlan.Post;
          MegaDSTTNPlan.Next;
        end;


        Dm.ChangeQuery.Close;
        Dm.ChangeQuery.SQL.Text:='delete from TTN_PLAN_POSITIONS where PLANDATE=:PLANDATE and BASEID=:BASEID and (PLANNUMBER<:PLAN_START OR PLANNUMBER>:PLAN_FINISH) ';
        Dm.ChangeQuery.Prepare;
        Dm.ChangeQuery.ParamByName('PLANDATE').AsDateTime :=MegaDatePanel.Date;
        Dm.ChangeQuery.ParamByName('BASEID').Value:=StrToInt(MegaSelTradeDelegate.Value);
        Dm.ChangeQuery.ParamByName('PLAN_START').AsInteger:=MStart;
        Dm.ChangeQuery.ParamByName('PLAN_FINISH').AsInteger:=MFinish;
        Dm.ChangeQuery.ExecQuery;

      end;


    Dm.ChangeQuery.Close;
    Dm.ChangeQuery.SQL.Text:=' INSERT INTO TTN_PLAN_POSITIONS (PLANDATE, PLANNUMBER, BASEID, NAKL_RECID, NAKL_BASEID, POS_NUM, NUM_KM) VALUES (:PLANDATE, :PLANNUMBER, :BASEID, :NAKL_RECID, :NAKL_BASEID, :POS_NUM, :NUM_KM)';
    Dm.ChangeQuery.Transaction.Active:=true;
    Dm.ChangeQuery.Prepare;

    mQuery1.Close;
    mQuery1.SQL.Text:='INSERT INTO OUTLET_ADDITION_PROP (OUTLET_RECID, OUTLET_BASEID, ULOADING_TIME)';
    mQuery1.SQL.Add(' VALUES (:OUTLET_RECID, :OUTLET_BASEID, :ULOADING_TIME)');
    mQuery1.Prepare;
    RouteList := TList.Create;
    try
      //AssignFile(svcFile, Dir+'Route.CSV');
      //Reset(svcFile);
     // ReadLn(svcFile, st);
      RouteCount:=0;
      RouteNum:='';
      sl := TStringList.Create;
      sl.Delimiter:=';';
      sl.QuoteChar:='''';
      sl.LoadFromFile( Dir+'Route.CSV');
      srow:= TStringList.Create;
      srow.Delimiter:=';';
      srow.QuoteChar:='''';
      for I := 1 to sl.Count-1 do
      begin
        srow.DelimitedText:=sl[i];
        if srow.Strings[0]<>RouteNum then
        begin
           RouteNum:=srow.Strings[0];
           Inc(RouteCount);
        end;
        if RoadList.IndexOf(srow.Strings[0])<>-1 then
          RouteList.Add(TRoute.Create(srow.Strings[0],srow.Strings[13],srow.Strings[1],srow.Strings[3],
          srow.Strings[9],srow.Strings[4],srow.Strings[5],srow.Strings[10],srow.Strings[6],
                           srow.Strings[8],'1',srow.Strings[16],srow.Strings[15],srow.Strings[17],
                           srow.Strings[18],srow.Strings[19],srow.Strings[20],srow.Strings[21]));
         srow.Clear;
      end;

      {while not Eof(svcFile) do
        begin
          ReadLn(svcFile, st);
          reg.Exec(st);
          wordnum := rxStrUtils.WordCount(st,[';']);
          if wordnum>18 then
          begin
            if rxStrUtils.ExtractWord(1,st,[';'])<>RouteNum then
            begin
               RouteNum:=rxStrUtils.ExtractWord(1,st,[';']);
               Inc(RouteCount);
            end;
            RouteList.Add(TRoute.Create(rxStrUtils.ExtractWord(1,st,[';']),rxStrUtils.ExtractWord(14,st,[';']),rxStrUtils.ExtractWord(2,st,[';']),
            rxStrUtils.ExtractWord(4,st,[';']),rxStrUtils.ExtractWord(10,st,[';']),rxStrUtils.ExtractWord(5,st,[';']),rxStrUtils.ExtractWord(6,st,[';']),rxStrUtils.ExtractWord(11,st,[';']),rxStrUtils.ExtractWord(7,st,[';']),
                                   rxStrUtils.ExtractWord(9,st,[';']),'1',rxStrUtils.ExtractWord(17,st,[';']),rxStrUtils.ExtractWord(16,st,[';']),rxStrUtils.ExtractWord(18,st,[';']),
                                   rxStrUtils.ExtractWord(19,st,[';']),rxStrUtils.ExtractWord(20,st,[';']),rxStrUtils.ExtractWord(21,st,[';']),rxStrUtils.ExtractWord(22,st,[';'])));

          end; }
         { if Length(st)>20 then
            begin
               for I := 1 to Length(st) do
                 if st[i]=';' then
                   begin
                     sl.Add(param);
                     param:='';
                   end
                else param:=param+st[i];
              if sl.Strings[0]<>RouteNum then
                begin
                  RouteNum:=sl.Strings[0];
                  Inc(RouteCount);
                end;
                if RoadList.IndexOf(sl.Strings[0])<>-1 then
                  RouteList.Add(TRoute.Create(sl.Strings[0],sl.Strings[13],sl.Strings[1],sl.Strings[3],
                  sl.Strings[9],sl.Strings[4],sl.Strings[5],sl.Strings[10],sl.Strings[6],
                                   sl.Strings[8],'1',sl.Strings[16],sl.Strings[15],sl.Strings[17],
                                   sl.Strings[18],sl.Strings[19],sl.Strings[20],sl.Strings[21]));
               sl.Clear;
            end;}
       { end;}
      //CloseFile(svcFile);
      sl.Free;
      srow.Free;
    except
     // CloseFile(svcFile);
      sl.Free;
      MainForm.reInfo.Lines.Add('!!!Ошибка!!!. При обработке файла Route.CSV' ) ;
      exit;
    end;
    if RouteList.Count=0 then
      begin
        MainForm.reInfo.Lines.Add('Нет маршрутов в файле Route.CSV' ) ;
        exit;
      end;
    for i:= 0 to RouteList.Count - 1 do
     if TRoute(RouteList.Items[i]).DocDate<>FormatDateTime('dd.mm.yyyy',MegaDatePanel.Date) then
       begin
         MainForm.reInfo.Lines.Add('В файле Route.CSV есть маршруты не за '+FormatDateTime('dd.mm.yyyy',MegaDatePanel.Date));
         exit;
       end;
        NPlan:=TStringList.Create;
        if isFirst then
          begin
            for i:= 1 to MegaDSTTNPlan.RecordCount do
              if (i<MStart) or (i>MFinish) then
                 NPlan.Add(IntToStr(i));
          end
            else
              begin
                sQuery.Transaction.Active:=true;
                sQuery.Close;
                sQuery.SQL.Text:='select distinct tp.plannumber '#13#10+
                         ' from TTN_PLAN tp  '#13#10+
                         ' left join TTN_PLAN_POSITIONS tpp on (tpp.plandate=tp.plandate and tpp.baseid=tp.baseid and tpp.plannumber=tp.plannumber) '#13#10+
                         ' where tp.PLANDATE = :PLANDATE and tp.BASEID = :BASEID and tpp.nakl_recid is null '#13#10+
                         ' order by tp.plannumber ';
                sQuery.ParamByName('PLANDATE').AsDateTime :=MegaDatePanel.Date;
                sQuery.ParamByName('BASEID').Value:=StrToInt(MegaSelTradeDelegate.Value);
                sQuery.ExecQuery;

                while not sQuery.Eof do
                  begin
                    NPlan.Add(sQuery.FieldByName('plannumber').AsString);
                    sQuery.Next;
                  end;
             end;


     if NPlan.Count<RouteCount then
         begin
           MainForm.reInfo.Lines.Add('Не хватает свободных маршрутов. Требуется '+IntToStr(NPlan.Count)+' маршрутов');
           exit;
         end;

      RoutePor:=-1;
      RouteID:=0;
      PlanUpd:=False;
     for i:= 0 to RouteList.Count - 1 do
       begin
         if RouteID<>TRoute(RouteList.Items[i]).ID then
           begin
             RouteID:=TRoute(RouteList.Items[i]).ID;
             Inc(RoutePor);
             R_Count:=0; G_Count:=0;
           end;
         MainForm.reInfo.Lines.Add(NPlan.Strings[RoutePor]+' '+IntToStr(RouteID)+' '+IntToStr(TRoute(RouteList.Items[i]).PorNumber)+' '+IntToStr(TRoute(RouteList.Items[i]).DocRecID)+' '+IntToStr(TRoute(RouteList.Items[i]).DocBaseID));
         if MegaDSTTNPlan.Locate('PLANNUMBER',StrToInt(NPlan.Strings[RoutePor]), []) then
           begin
             Dm.ChangeQuery.ParamByName('PLANDATE').AsDateTime:=MegaDatePanel.Date;
             Dm.ChangeQuery.ParamByName('PLANNUMBER').AsInteger:=StrToInt(NPlan.Strings[RoutePor]); //dsRoute.FieldByName('ROUTE_NUM').AsInteger;
             Dm.ChangeQuery.ParamByName('NAKL_BASEID').AsInteger:=TRoute(RouteList.Items[i]).DocBaseID;//StrToInt(MegaSelTradeDelegate.Value);
             Dm.ChangeQuery.ParamByName('POS_NUM').AsInteger:=TRoute(RouteList.Items[i]).PorNumber;  //  dsRoute.FieldByName('NUM_INROUTE').AsInteger;
             Dm.ChangeQuery.ParamByName('NAKL_RECID').AsInteger:=TRoute(RouteList.Items[i]).DocRecID;//StrToInt(System.copy(st,1,System.Pos('|',st)-1));
             Dm.ChangeQuery.ParamByName('BASEID').AsInteger:=StrToInt(MegaSelTradeDelegate.Value);//TRoute(RouteList.Items[i]).DocBaseID;//StrToInt(System.copy(st,System.Pos('|',st)+1,Length(st)));
             Dm.ChangeQuery.ParamByName('NUM_KM').AsFloat:=TRoute(RouteList.Items[i]).Distance;//Trunc(dsRoute.FieldByName('DISTANC').AsFloat);
             if TRoute(RouteList.Items[i]).TTType=999 then inc(G_Count);
             if TRoute(RouteList.Items[i]).TTType=998 then inc(R_Count);
             try
               Dm.ChangeQuery.ExecQuery;
             except
               MainForm.reInfo.Lines.Add('!!! ОШИБКА!!! Не загружен маршрут '+ NPlan.Strings[RoutePor]+' '+IntToStr(RouteID)+' '+IntToStr(TRoute(RouteList.Items[i]).PorNumber)+' '+IntToStr(TRoute(RouteList.Items[i]).DocRecID)+' '+IntToStr(TRoute(RouteList.Items[i]).DocBaseID));
             end;
             if i=RouteList.Count - 1 then PlanUpd:=True
             else if TRoute(RouteList.Items[i]).ID<>TRoute(RouteList.Items[i+1]).ID then PlanUpd:=True;

             if PlanUpd then
               begin
                  UpdatePlan:=    ' update ttn_plan tp set '#13#10+
                                  ' tp.num_km=:num_km, '#13#10+
                                  ' tp.cost_route=:cost_route, '#13#10+
                                  ' tp.nas_p_from=(select first 1 sc.storage_city from sprav_cfo sc where sc.kod_cfo=:baseid),  '#13#10+
                                  ' tp.doctype=:doctype,                         '#13#10+
                                  ' /*_expeditor_*/                               '#13#10+
                                  ' tp.dk_to=(select first 1 st.owner from SPRAV_TRUCK st  where (st.num=:car_snum)),                              '#13#10+
                                  ' tp.car_snum=(select first 1 st.num from SPRAV_TRUCK st  where (st.num=:car_snum)),                       '#13#10+
                                  ' tp.car_driver=:car_driver , tp.tms=1                   '#13#10+
                                  ' where tp.plandate=:plandate and tp.plannumber=:plannumber and tp.baseid=:baseid ';
                  if TRoute(RouteList.Items[i]).ExpeditorID<>0 then
                    UpdatePlan:=ReplaceStr(UpdatePlan,'/*_expeditor_*/',' tp.dk_c=:dk_c, ');
                  mQuery.Close;
                  mQuery.SQL.Text:=UpdatePlan;
                  mQuery.ParamByName('PLANDATE').AsDateTime :=MegaDatePanel.Date;
                  mQuery.ParamByName('BASEID').Value:=StrToInt(MegaSelTradeDelegate.Value);
                  mQuery.ParamByName('PLANNUMBER').AsInteger:=StrToInt(NPlan.Strings[RoutePor]);
                  mQuery.ParamByName('num_km').AsFloat:=TRoute(RouteList.Items[i]).LengthPath;
                  mQuery.ParamByName('cost_route').AsFloat:=TRoute(RouteList.Items[i]).Cost;
                  if G_Count>=R_Count then mQuery.ParamByName('doctype').AsString:='Г'
                  else mQuery.ParamByName('doctype').AsString:='Р';
                  if TRoute(RouteList.Items[i]).ExpeditorID<>0 then
                    mQuery.ParamByName('dk_c').AsFloat:=TRoute(RouteList.Items[i]).ExpeditorID;
                  mQuery.ParamByName('car_snum').AsString:=TRoute(RouteList.Items[i]).CarID;
                  mQuery.ParamByName('car_driver').AsString:=TRoute(RouteList.Items[i]).CarDriver;
                   mQuery.ExecQuery;
               end;

           end else MainForm.reInfo.Lines.Add('!!! ОШИБКА!!! Не загружен маршрут '+ IntToStr(RoutePor)+' '+IntToStr(RouteID)+' '+IntToStr(TRoute(RouteList.Items[i]).PorNumber)+' '+IntToStr(TRoute(RouteList.Items[i]).DocRecID)+' '+IntToStr(TRoute(RouteList.Items[i]).DocBaseID));
       end;

   RouteList.Free;
   actRefreshDataExecute(Sender);
end;

procedure TfmTTNPlan.N27Click(Sender: TObject);
var BaseID : string;
    exportToFile : TdmExportTTNToFile;
begin
BaseID := IntfMegaDBCommon.GetParam('BASE_KOD', '0');
exportToFile:=TdmExportTTNToFile.Create(self);
exportToFile.ExportToFile(StrToInt(BaseID),MegaDatePanel.Date,pcTTNPlan.ActivePage.Tag);
end;

procedure TfmTTNPlan.N31Click(Sender: TObject);
var
 st,stT1,stT2, dir_fn,buf_str:string;
 DateBeg,DateEnd:TDateTime;
 F:TextFile;
 i:integer;
begin

if Application.MessageBox('Выгрузить заявки в файл? (Да - в файл, нет - в таблицу БД)',
  'Внимание', MB_YESNO + MB_ICONQUESTION) = IDYES then
begin
   if cxShellBrowserDialog1.Execute then
   begin
     dir_fn:=cxShellBrowserDialog1.Path+'\D__IMPORT0.txt';
     ForceDirectories(cxShellBrowserDialog1.Path);
     AssignFile(f,dir_fn);
     Rewrite(f);
   //  Writeln(f,'UNISTRING;NUMBER_DOC;FROM_ID;TO_ID;DOC_DATE;SUMMA;MASSA;OBEM;COMMENTS;QTY;DOCS_TYPE;GRUZ_TYPE_ID;TIME1;TIME2');

     fdsNaklList.First;
     DecimalSeparator:='.';
     while not  fdsNaklList.Eof do
     begin
       if  not  ((fdsNaklList.FieldByName('GROUP_OPER').Value=500061) and  (fdsNaklList.FieldByName('KOD_OPER').Value=50061603)) then
       begin
         if fdsNaklList.FieldByName('LATITUDE').Value=0 then
         begin
          MainForm.reInfo.Lines.Add('!!! Отсутствуют координаты!!!  заказ №'+fdsNaklList.FieldByName('DOCNUMBER').AsString+' - '+ fdsNaklList.FieldByName('SHORTNAME_DK_TO').AsString + ' - ' +fdsNaklList.FieldByName('ADDRESS').AsString);
      //  fdsNaklList.Next;
         end;
        { buf_str := fdsNaklList.FieldByName('EXT_STRID').asString+#09+
         fdsNaklList.FieldByName('CUST_STRID').asString+#09+
         '0'+#09+'0'+#09+'0'+#09+
         fdsNaklList.FieldByName('TIME_BEG').asString+#09+
         fdsNaklList.FieldByName('TIME_END').asString+#09+
         fdsNaklList.FieldByName('TIME_UNLOAD').asString+#09+
         fdsNaklList.FieldByName('ACTIVE_').asString+#09+
         FloatToStr(fdsNaklList.FieldByName('OGRSUM1').asFloat*1000)+#09+
         FloatToStr(fdsNaklList.FieldByName('OGRSUM2').asFloat)+#09+
         '0'+#09+'0'+#09+
         ReplaceStr(fdsNaklList.FieldByName('ADDR').asString,'Респ Татарстан','РТ',false,true)+#09+
         fdsNaklList.FieldByName('STR1').asString+#09+
         '0'+#09+'0'+#09+
         fdsNaklList.FieldByName('DELIV_DATE1').asString+#09+
         '0'+#09+
         fdsNaklList.FieldByName('LONGITUDE').asString+#09+
         fdsNaklList.FieldByName('LATITUDE').asString+#09+
         AntorIndex+#09+
         '0'+#09+'0'+#09+'-1'+#09+'0'+#09;  }
         Writeln(f,fdsNaklList.FieldByName('EXT_STRID').asString+#09+
         fdsNaklList.FieldByName('CUST_STRID').asString+#09+
         '0'+#09+'0'+#09+'0'+#09+
         FormatDateTime('hh:nn',fdsNaklList.FieldByName('TIME_BEG').asDateTime)+#09+
         FormatDateTime('hh:nn',fdsNaklList.FieldByName('TIME_END').asDateTime)+#09+
         FormatDateTime('hh:nn',fdsNaklList.FieldByName('TIME_UNLOAD').asDateTime)+#09+
         fdsNaklList.FieldByName('ACTIVE_').asString+#09+
         FormatFloat('0.00000',fdsNaklList.FieldByName('OGRSUM1').asFloat*1000)+#09+
         FormatFloat('0.00000',fdsNaklList.FieldByName('OGRSUM2').asFloat)+#09+
         '0'+#09+'0'+#09+
         ReplaceStr(fdsNaklList.FieldByName('ADDR').asString,'Респ Татарстан','РТ',false,true)+#09+
         fdsNaklList.FieldByName('DISTR').asString+#09+
         fdsNaklList.FieldByName('TOWN').asString+#09+
         fdsNaklList.FieldByName('STREET').asString+#09+
         fdsNaklList.FieldByName('HOUS').asString+#09+
         fdsNaklList.FieldByName('CORP').asString+#09+
         //
         fdsNaklList.FieldByName('STR1').asString+#09+
         '0'+#09+'0'+#09+
         FormatDateTime('hh:nn',fdsNaklList.FieldByName('DELIV_DATE1').asDateTime)+#09+
         '0'+#09+
         fdsNaklList.FieldByName('LONGITUDE').asString+#09+
         fdsNaklList.FieldByName('LATITUDE').asString+#09+
         AntorIndex+#09+
         '0'+#09+'0'+#09+'-1'+#09+'0'
         );
        i:=i+1;
       end;
       fdsNaklList.Next;
     end;
     DecimalSeparator:=',';
     CloseFile(f);
   end;
end
else
begin
   MainForm.InfoPanel.Visible:=true;
   MainForm.spInfo.Visible:=true;

   if not  Antor.Connected then
   begin
    MainForm.reInfo.Lines.Add('Подключение к ' +ReplaceStr( Antor.ConnectionString,'tripusss','passw',false,true));
     Antor.Connected:=true;
   end;
   i:=0;
  MainForm.reInfo.Lines.Add('Выгрузка заявок');

   qQuery.Close;
   qQuery.SQL.Text:='TRUNCATE table  d__import'+AntorIndex;
   qQuery.ExecSQL;
  // qQuery.Close;
  // qQuery.SQL.Text:='TRUNCATE table  d__orders0';
  // qQuery.ExecSQL;
  // fdsNaklList.DisableControls;

   qInsertNakl.SQL.Text:='insert into d__import'+AntorIndex+' (EXT_STRID, CUST_STRID, UNLOAD_TYP, ORD_TYP, CATEGORY_ID, TIME_BEG, TIME_END,'+
     'TIME_UNLOAD, ACTIVE, OGRSUM1, OGRSUM2, SUM3, SUM4, ADDR, STR1, MAX_CAR, MIN_CAR, DELIV_DATE, RENTED, LATITUDE, LONGITUDE,'+
     'OPER_ID, ROUTE_ID, ROUTE_NUM,NUM_INROUTE,ALTITUDE)'+
     ' VALUES (:EXT_STRID, :CUST_STRID, :UNLOAD_TYP, :ORD_TYP, :CATEGORY_ID, :TIME_BEG, :TIME_END,'+
     ':TIME_UNLOAD, :ACTIVE, :OGRSUM1, :OGRSUM2, :SUM3, :SUM4, :ADDR, :STR1, :MAX_CAR, :MIN_CAR, :DELIV_DATE, :RENTED, :LATITUDE, :LONGITUDE,'+
     ':OPER_ID, :ROUTE_ID, :ROUTE_NUM, :NUM_INROUTE,:ALTITUDE)';

   fdsNaklList.First;
   while not  fdsNaklList.Eof do
   begin
     if  not  ((fdsNaklList.FieldByName('GROUP_OPER').Value=500061) and  (fdsNaklList.FieldByName('KOD_OPER').Value=50061603)) then
     begin
       if fdsNaklList.FieldByName('LATITUDE').Value=0 then
       begin
        MainForm.reInfo.Lines.Add('!!! Отсутствуют координаты!!!  заказ №'+fdsNaklList.FieldByName('DOCNUMBER').AsString+' - '+ fdsNaklList.FieldByName('SHORTNAME_DK_TO').AsString + ' - ' +fdsNaklList.FieldByName('ADDRESS').AsString);
    //  fdsNaklList.Next;
       end;
      qInsertNakl.Parameters.ParamByName('EXT_STRID').Value :=fdsNaklList.FieldByName('EXT_STRID').Value;
 { EXT_STRID, CUST_STRID, UNLOAD_TYP, ORD_TYP, CATEGORY_ID, TIME_BEG, TIME_END,
 TIME_UNLOAD, ACTIVE, OGRSUM1, OGRSUM2, SUM3, SUM4, ADDR, STR1, MAX_CAR, MIN_CAR, DELIV_DATE, RENTED, LATITUDE, LONGITUDE}
      qInsertNakl.Parameters.ParamByName('CUST_STRID').Value :=fdsNaklList.FieldByName('CUST_STRID').Value;
      qInsertNakl.Parameters.ParamByName('UNLOAD_TYP').Value :=0;//fdsNaklList.FieldByName('UNLOAD_TYP').Value;
      qInsertNakl.Parameters.ParamByName('ORD_TYP').Value :=0;//fdsNaklList.FieldByName('ORD_TYP').Value;
      qInsertNakl.Parameters.ParamByName('CATEGORY_ID').Value :=0;//fdsNaklList.FieldByName('CATEGORY_ID').Value;
      qInsertNakl.Parameters.ParamByName('TIME_BEG').Value :=fdsNaklList.FieldByName('TIME_BEG').Value;
      qInsertNakl.Parameters.ParamByName('TIME_END').Value :=fdsNaklList.FieldByName('TIME_END').Value;
      qInsertNakl.Parameters.ParamByName('TIME_UNLOAD').Value :=fdsNaklList.FieldByName('TIME_UNLOAD').Value;
      qInsertNakl.Parameters.ParamByName('ACTIVE').Value :=fdsNaklList.FieldByName('ACTIVE_').Value;
      qInsertNakl.Parameters.ParamByName('OGRSUM1').Value :=fdsNaklList.FieldByName('OGRSUM1').Value*1000;
      qInsertNakl.Parameters.ParamByName('OGRSUM2').Value :=fdsNaklList.FieldByName('OGRSUM2').Value;
      qInsertNakl.Parameters.ParamByName('SUM3').Value :=0;//fdsNaklList.FieldByName('SUM3').Value;
      qInsertNakl.Parameters.ParamByName('SUM4').Value :=0;//fdsNaklList.FieldByName('SUM3').Value;
      qInsertNakl.Parameters.ParamByName('ADDR').Value := ReplaceStr(fdsNaklList.FieldByName('ADDR').Value,'Респ Татарстан','РТ',false,true);
      qInsertNakl.Parameters.ParamByName('STR1').Value :=fdsNaklList.FieldByName('STR1').Value;
      qInsertNakl.Parameters.ParamByName('MIN_CAR').Value :=0;
      qInsertNakl.Parameters.ParamByName('MAX_CAR').Value :=0;
      qInsertNakl.Parameters.ParamByName('DELIV_DATE').Value :=fdsNaklList.FieldByName('DELIV_DATE1').Value;
      qInsertNakl.Parameters.ParamByName('ALTITUDE').Value :=0;
      qInsertNakl.Parameters.ParamByName('LATITUDE').Value :=fdsNaklList.FieldByName('LONGITUDE').Value;
      qInsertNakl.Parameters.ParamByName('LONGITUDE').Value :=fdsNaklList.FieldByName('LATITUDE').Value;
      qInsertNakl.Parameters.ParamByName('OPER_ID').Value :=StrToInt(AntorIndex);
      qInsertNakl.Parameters.ParamByName('ROUTE_ID').Value :=0;
      qInsertNakl.Parameters.ParamByName('ROUTE_NUM').Value :=0;
      qInsertNakl.Parameters.ParamByName('NUM_INROUTE').Value :=-1;
      qInsertNakl.Parameters.ParamByName('RENTED').Value :=0;
  { if fdsNaklList.FieldByName('DELIV_TIME').Asstring<>''
   then
   begin
     st:= fdsNaklList.FieldByName('DELIV_TIME').Asstring;
     stT1:='01.01.1900 '+System.Copy(st,1,2)+':'+System.Copy(st,3,2);
     stT2:='01.01.1900 '+System.Copy(st,5,2)+':'+System.Copy(st,7,2);
     try
       qInsertNakl.Parameters.ParamByName('TIME_BEG').Value := StrToDateTime(stT1);
       qInsertNakl.Parameters.ParamByName('TIME_END').Value := StrToDateTime(stT2);
     except
       MainForm.reInfo.Lines.Add('!!!Ошибка интервала доставки ' +  st);
     end;
   end;
   }

     qInsertNakl.ExecSQL;
     i:=i+1;
   end;
   fdsNaklList.Next;
   end;
 //  qQuery.Close;
 //  qQuery.SQL.Text:='insert into  d__orders0 select * from d__orders';
 //  qQuery.ExecSQL;
 end;
   MainForm.reInfo.Lines.Add('Выгружено заявок: ' + IntToStr(i));


end;

procedure TfmTTNPlan.N32Click(Sender: TObject);
var
mCount,aCount:integer;
st,st1:string;
begin
    MainForm.InfoPanel.Visible:=true;
    MainForm.spInfo.Visible:=true;

    MegaDSTTNPlan.Close;
    MegaDSTTNPlan.Open(MegaDatePanel.Date, StrToInt(MegaSelTradeDelegate.Value));
    MegaDSTTNPlan.Locate('PLANNUMBER', StrToInt(MegaSelTradeDelegate.Value), []);
   if  MegaDSTTNPlan.RecordCount=0 then
   begin
     MainForm.reInfo.Lines.Add('!!!Ошибка!!!. Создайте маршруты в Моней' ) ;
     exit;
   end;

   qQuery.Close;
   qQuery.SQL.Text:='SELECT COUNT(*) as ''i'' from  D__ROUTE' + AntorIndex + '  where DATE_ROUTE=:DATE_ROUTE';
   qQuery.Parameters.ParamByName('DATE_ROUTE').Value:=MegaDatePanel.Date;
   qQuery.Open;
   aCount:=qQuery.FieldByName('i').AsInteger;
   if  aCount=0 then begin
      MainForm.reInfo.Lines.Add('Нет маршрутов для загрузки') ;
      exit;
   end;

   qQuery.Close;
   qQuery.SQL.Text:='select [EXT_STRID], count([EXT_STRID]) from  D__ORDERS' + AntorIndex + '  group by [EXT_STRID]   having count([EXT_STRID])>1';
   qQuery.Open;

   if  qQuery.RecordCount >0 then begin
      MainForm.reInfo.Lines.Add('!!!Ошибка!!! Имеются не разъединенные заявки!!!') ;
      exit;
   end;


    MainForm.reInfo.Lines.Add('Очистка маршрутов');
    MegaDSTTNPlan.First;
    while not  MegaDSTTNPlan.Eof do
    begin
      MegaDSTTNPlan.DeleteTTN(false);
      { TTN_RECID = ?TTN_RECID,
     TTN_BASEID = ?TTN_BASEID,
     DOCTYPE = ?DOCTYPE,
     ROAD_LIST = ?ROAD_LIST,
     DK_FROM = ?DK_FROM,
     DK_TO = ?DK_TO,
     CAR_SNUM = ?CAR_SNUM,
     CAR_TRAILER = ?CAR_TRAILER,
     CAR_TRAILER2 = ?CAR_TRAILER2,
     CAR_DRIVER = ?CAR_DRIVER,
     DK_C = ?DK_C,
     IS_HORECA = ?IS_HORECA,
     PLANNUMBER = ?PLANNUMBER,
     IS_TEMP_MARSHRUT = ?IS_TEMP_MARSHRUT,
     NAS_P_FROM = ?NAS_P_FROM}
      if not (MegaDSTTNPlan.State  in [dsEdit,dsInsert]) then MegaDSTTNPlan.Edit;
    //  MegaDSTTNPlan.FieldByName('DOCTYPE').Value:=NULL;
   //   MegaDSTTNPlan.FieldByName('ROAD_LIST').Value:=NULL;
   //   MegaDSTTNPlan.FieldByName('DK_TO').Value:=NULL;
   //   MegaDSTTNPlan.FieldByName('CAR_SNUM').Value:=NULL;
   //   MegaDSTTNPlan.FieldByName('CAR_TRAILER').Value:=NULL;
   //   MegaDSTTNPlan.FieldByName('CAR_TRAILER2').Value:=NULL;
   //   MegaDSTTNPlan.FieldByName('DK_C').Value:=NULL;
   //   MegaDSTTNPlan.FieldByName('IS_HORECA').Value:=NULL;
   //   MegaDSTTNPlan.FieldByName('IS_TEMP_MARSHRUT').Value:=NULL;
    //  MegaDSTTNPlan.FieldByName('CAR_DRIVER').Value:=NULL;
      MegaDSTTNPlan.Post;
      MegaDSTTNPlan.Next;
    end;
//    Dm.ChangeQuery.Transaction.Active:=true;
    Dm.ChangeQuery.Close;
    Dm.ChangeQuery.SQL.Text:='delete from TTN_PLAN_POSITIONS where PLANDATE=:PLANDATE and BASEID=:BASEID';
    Dm.ChangeQuery.Prepare;
    Dm.ChangeQuery.ParamByName('PLANDATE').AsDateTime :=MegaDatePanel.Date;
    Dm.ChangeQuery.ParamByName('BASEID').Value:=StrToInt(MegaSelTradeDelegate.Value);
    Dm.ChangeQuery.ExecQuery;
//    Dm.SharedQuery.Transaction.Commit;


    MainForm.reInfo.Lines.Add('Загрузка маршрутов');
    dsRoute.Close;
    dsRoute.CommandText:='SELECT    rr.ROUTE_NUM, oo.NUM_INROUTE,   dbo.D__CARS.MARK, dbo.D__CARS.NOMER, dbo.D__CARS.STR1, rr.ID,'+
                    '  CONVERT(varchar(5), oo.TIME_ARR, 8) AS TIME_ARR, CONVERT(varchar(8), oo.DELIV_DATE, 4) AS DELIV_DATE,'+
                    '  oo.EXT_STRID, oo.TIME_UNLOAD, rr.LEN ,oo.DISTANC '+
                    ' FROM dbo.D__CARS INNER JOIN'+
                    ' dbo.D__ROUTE' + AntorIndex + ' rr INNER JOIN'+
                    ' dbo.D__ORDERS' + AntorIndex + ' oo ON rr.ID = oo.ROUTE_ID ON dbo.D__CARS.ID = rr.CAR_ID'+
                    ' where oo.DELIV_DATE=:DELIV_DATE'+
                    ' order by rr.ROUTE_NUM, oo.NUM_INROUTE';
    dsRoute.Parameters.ParamByName('DELIV_DATE').Value:=MegaDatePanel.Date;
    dsRoute.Open;
    dsRoute.First;

    Dm.ChangeQuery.Close;
    Dm.ChangeQuery.SQL.Text:='    INSERT INTO TTN_PLAN_POSITIONS (PLANDATE, PLANNUMBER, BASEID, NAKL_RECID, NAKL_BASEID, POS_NUM, NUM_KM) VALUES (:PLANDATE, :PLANNUMBER, :BASEID, :NAKL_RECID, :NAKL_BASEID, :POS_NUM, :NUM_KM)';
    Dm.ChangeQuery.Transaction.Active:=true;
    Dm.ChangeQuery.Prepare;


    mQuery.Close;
    mQuery.SQL.Text:='UPDATE OUTLET_ADDITION_PROP SET ULOADING_TIME=:ULOADING_TIME ';
    mQuery.SQL.Add(' where OUTLET_RECID=:OUTLET_RECID and OUTLET_BASEID=:OUTLET_BASEID');
    mQuery.Prepare;

    mQuery1.Close;
    mQuery1.SQL.Text:='INSERT INTO OUTLET_ADDITION_PROP (OUTLET_RECID, OUTLET_BASEID, ULOADING_TIME)';
    mQuery1.SQL.Add(' VALUES (:OUTLET_RECID, :OUTLET_BASEID, :ULOADING_TIME)');
    mQuery1.Prepare;


    while not dsRoute.Eof do
    begin
      st:=dsRoute.FieldByName('EXT_STRID').AsString;
     // st1:=dsRoute.FieldByName('CUST_STRID').AsString;
      MainForm.reInfo.Lines.Add(dsRoute.FieldByName('ROUTE_NUM').AsString+' '+dsRoute.FieldByName('NUM_INROUTE').AsString+' '+st+' '+System.copy(st,1,System.Pos('|',st)-1)+' '+System.copy(st,System.Pos('|',st)+1,Length(st)));

      {INSERT INTO TTN_PLAN_POSITIONS (PLANDATE, PLANNUMBER, BASEID, NAKL_RECID, NAKL_BASEID, POS_NUM)
      VALUES (:PLANDATE, :PLANNUMBER, :BASEID, :NAKL_RECID, :NAKL_BASEID, :POS_NUM);}
      if MegaDSTTNPlan.Locate('PLANNUMBER',dsRoute.FieldByName('ROUTE_NUM').AsInteger , [])
      then
      begin
       Dm.ChangeQuery.ParamByName('PLANDATE').AsDateTime:=MegaDatePanel.Date;
       Dm.ChangeQuery.ParamByName('PLANNUMBER').AsInteger:=dsRoute.FieldByName('ROUTE_NUM').AsInteger;
       Dm.ChangeQuery.ParamByName('NAKL_BASEID').AsInteger:=StrToInt(System.copy(st,System.Pos('|',st)+1,Length(st)));//StrToInt(MegaSelTradeDelegate.Value);
       Dm.ChangeQuery.ParamByName('POS_NUM').AsInteger:=dsRoute.FieldByName('NUM_INROUTE').AsInteger;
       Dm.ChangeQuery.ParamByName('NAKL_RECID').AsInteger:=StrToInt(System.copy(st,1,System.Pos('|',st)-1));
       Dm.ChangeQuery.ParamByName('BASEID').AsInteger:=StrToInt(MegaSelTradeDelegate.Value);//StrToInt(System.copy(st,System.Pos('|',st)+1,Length(st)));
       Dm.ChangeQuery.ParamByName('NUM_KM').AsFloat:=Trunc(dsRoute.FieldByName('DISTANC').AsFloat);

       {if not (MegaDSTTNPlan.State  in [dsEdit,dsInsert]) then MegaDSTTNPlan.Edit;
         MegaDSTTNPlan.FieldByName('NUM_KM').AsFloat:=Trunc(dsRoute.FieldByName('LEN').AsFloat);
        MegaDSTTNPlan.Post; }
      try
       Dm.ChangeQuery.ExecQuery;
      except
          MainForm.reInfo.Lines.Add('!!! ОШИБКА!!! Не загружен маршрут '+ dsRoute.FieldByName('ROUTE_NUM').AsString+' '+dsRoute.FieldByName('NUM_INROUTE').AsString+' '+st+' '+System.copy(st,1,System.Pos('|',st)-1)+' '+System.copy(st,System.Pos('|',st)+1,Length(st)));
      end;

      {
      try
       mQuery.ParamByName('ULOADING_TIME').AsDateTime :=dsRoute.FieldByName('TIME_UNLOAD').AsDateTime;
       mQuery.ParamByName('OUTLET_RECID').Value:=StrToInt(System.copy(st1,1,System.Pos('|',st1)-1));
       mQuery.ParamByName('OUTLET_BASEID').Value:=StrToInt(System.copy(st1,System.Pos('|',st1)+1,Length(st1)));
       mQuery.ExecQuery;
      except
      end;
      try
       mQuery1.ParamByName('ULOADING_TIME').AsDateTime :=dsRoute.FieldByName('TIME_UNLOAD').AsDateTime;
       mQuery1.ParamByName('OUTLET_RECID').Value:=StrToInt(System.copy(st1,1,System.Pos('|',st1)-1));
       mQuery1.ParamByName('OUTLET_BASEID').Value:=StrToInt(System.copy(st1,System.Pos('|',st1)+1,Length(st1)));
       mQuery1.ExecQuery;
      except
      end;

       }
      end else MainForm.reInfo.Lines.Add('!!! ОШИБКА!!! Не загружен маршрут '+ dsRoute.FieldByName('ROUTE_NUM').AsString+' '+dsRoute.FieldByName('NUM_INROUTE').AsString+' '+st+' '+System.copy(st,1,System.Pos('|',st)-1)+' '+System.copy(st,System.Pos('|',st)+1,Length(st)));
      dsRoute.Next;
    end;
    //Dm.SharedQuery.Transaction.Commit;
    //MegaDSTTNPlan.Transaction.CommitRetaining;
end;

procedure TfmTTNPlan.N33Click(Sender: TObject);
 var ws: WebService7Interface;
     orderArray:Array_Of_wsLocationAndOrder7;
     orderPlanpos:wslocationAndOrder7;
     i:Integer;
   //  resultIns: insertLocationsAndOrders7Result;
     insLocationOrder: InsertLocationsAndOrders7Result2;
     resultIns2:insertLocationsAndOrders7Result;

     resultIns22:insertLocationsAndOrders7Result;
begin
 //
 try

  ws:= GetWebService7Interface;
  mgrdtstTmpSelRinkai.ParamByName('BDATE').asDateTime:= MegaDatePanel.Date;
  mgrdtstTmpSelRinkai.ParamByName('EDATE').asDateTime:= MegaDatePanel.Date;
  mgrdtstTmpSelRinkai.Open;
  i:=0;
  ws.DeleteAllLocationsAndOrders7('gl0gl0ss', 'GS');
  mgrdtstTmpSelRinkai.First;
  while not mgrdtstTmpSelRinkai.eof do
  begin
     SetLength(orderArray, i+1);
     orderPlanpos:= wslocationAndOrder7.Create;
     orderPlanpos.DepotUserDefinedId        :=  mgrdtstTmpSelRinkai.FieldByName('DepotUserDefinedId').AsString; //GSK
     orderPlanpos.LocationUserDefinedId     :=  mgrdtstTmpSelRinkai.FieldByName('LocationUserDefinedId').asString;
     orderPlanpos.Name_                     :=  mgrdtstTmpSelRinkai.FieldByName('NAME').asString;
     orderPlanpos.Country                   :=  mgrdtstTmpSelRinkai.FieldByName('COUNTRY').asString;
     orderPlanpos.City                      :=  mgrdtstTmpSelRinkai.FieldByName('City').asString;
     orderPlanpos.Street                    :=  mgrdtstTmpSelRinkai.FieldByName('Street').asString;
     orderPlanpos.HouseNumber               :=  mgrdtstTmpSelRinkai.FieldByName('HouseNumber').asString;
     orderPlanpos.PostCode                  :=  mgrdtstTmpSelRinkai.FieldByName('PostCode').asString;
     orderPlanpos.LocationComment           :=  mgrdtstTmpSelRinkai.FieldByName('LocationComment').asString;
     orderPlanpos.Mail                      :=  mgrdtstTmpSelRinkai.FieldByName('Mail').asString;
     orderPlanpos.Phone                     :=  mgrdtstTmpSelRinkai.FieldByName('Phone').asString;
     orderPlanpos.TW1F                      :=  mgrdtstTmpSelRinkai.FieldByName('TW1F').AsInteger;
     orderPlanpos.TW1T                      :=  mgrdtstTmpSelRinkai.FieldByName('TW1T').AsInteger;
     orderPlanpos.TW2F                      :=  mgrdtstTmpSelRinkai.FieldByName('TW2F').AsInteger;
     orderPlanpos.TW2T                      :=  mgrdtstTmpSelRinkai.FieldByName('TW2T').AsInteger;
     orderPlanpos.LoadingStartTimeFrom      :=  mgrdtstTmpSelRinkai.FieldByName('LoadingStartTimeFrom').AsInteger;
     orderPlanpos.LoadingStartTimeTo        :=  mgrdtstTmpSelRinkai.FieldByName('LoadingStartTimeTo').AsInteger;
     orderPlanpos.GeoX                      :=  mgrdtstTmpSelRinkai.FieldByName('GeoX').AsFloat;
     orderPlanpos.GeoY                      :=  mgrdtstTmpSelRinkai.FieldByName('GeoY').AsFloat;
     orderPlanpos.TimeAtCustomer            :=  mgrdtstTmpSelRinkai.FieldByName('TimeAtCustomer').AsInteger;
     orderPlanpos.AdminTimeAtCustomer       :=  mgrdtstTmpSelRinkai.FieldByName('AdminTimeAtCustomer').AsInteger;
  //   orderPlanpos.WeightLimit               :=  -1;//mgrdtstTmpSelRinkai.FieldByName('GeoY').AsFloat;
     orderPlanpos.VehicleTypeRestriction    :=  '';//mgrdtstTmpSelRinkai.FieldByName('GeoY').AsFloat;
     orderPlanpos.OrderUserDefinedId        :=  mgrdtstTmpSelRinkai.FieldByName('OrderUserDefinedId').AsString;
     orderPlanpos.Date                      :=  mgrdtstTmpSelRinkai.FieldByName('DATE_').AsInteger;
     orderPlanpos.OrderComment              :=  mgrdtstTmpSelRinkai.FieldByName('OrderComment').asString;
     orderPlanpos.Items                     :=  mgrdtstTmpSelRinkai.FieldByName('ITEMS').asString;
     orderArray[i]:= orderPlanpos;
     Inc(i);
     mgrdtstTmpSelRinkai.Next;
  end;
  //insLocationOrder:=  InsertLocationsAndOrders7Result2.Create;
//  insLocationOrder.wsKey:=  'gloglosp';
//  insLocationOrder.locationsAndOrders:= orderArray;

  resultIns2:=ws.InsertLocationsAndOrdersForMultipleDepots7('gl0gl0ss', orderArray);
 // resultIns22:= (HTTPRIO1 as WebService7Interface).InsertLocationsAndOrdersForMultipleDepots7('gloglosp',orderArray); //ws.InsertLocationsAndOrdersForMultipleDepots('gloglosp',orderArray);
  Application.MessageBox('Данные выгружены успешно!', 'Внимание!', MB_OK +
   MB_ICONINFORMATION);

except
  on E: EXCEPTION do
  begin
    Application.MessageBox(pchar(e.Message) , '', MB_OK + MB_ICONERROR);
  end;
end;

end;

procedure TfmTTNPlan.N34Click(Sender: TObject);
{var
  ws:WebServiceInterface;
  vGetPlans:GetPlans2;
  vPlansResponse:GetPlansResponse2;
  i,iOrders, iPlans:Integer;
  RouteList: TList;
  lYear, lMonth, lDay: Word;
  num_km:float;   }
begin
//
  {MStart:=1; MFinish:=40;
  ws:= GetWebServiceInterface;
  vGetPlans:= GetPlans2.Create;
  vGetPlans.wsKey := 'gloglosp';
  vGetPlans.depotUserDefinedId:= 'GSK';
  vPlansResponse:=ws.GetPlans(vGetPlans);
  if Length(vPlansResponse.return.Plans)<=0 then
  begin
     MainForm.reInfo.Lines.Add('Нет маршрутов для загрузки') ;
     exit;
  end;
  DecodeDate(MegaDatePanel.Date, lYear, lMonth, lDay);
  for iPlans := 0 to Length(vPlansResponse.return.Plans) - 1 do
  begin
    //берем только маршрут за выбранную дату
    if inttostr(vPlansResponse.return.Plans[iPlans].routes[0].Date)=inttostr(lYear)+formatFloat('00',lMonth)+formatFloat('00',lDay) then
    begin
      for i:=0 to Length(vPlansResponse.return.Plans[iPlans].Routes)-1 do
      begin
        if i=0 then
        begin
          MainForm.reInfo.Lines.Add('Очистка маршрутов');
          MegaDSTTNPlan.First;
          while not  MegaDSTTNPlan.Eof do
          begin
             if (MegaDSTTNPlanPLANNUMBER.AsInteger<MStart) or (MegaDSTTNPlanPLANNUMBER.AsInteger>MFinish) then

            MegaDSTTNPlan.DeleteTTN(false);
            if not (MegaDSTTNPlan.State  in [dsEdit,dsInsert]) then MegaDSTTNPlan.Edit;
            MegaDSTTNPlan.Post;
            MegaDSTTNPlan.Next;
          end;


          Dm.ChangeQuery.Close;
          Dm.ChangeQuery.SQL.Text:='delete from TTN_PLAN_POSITIONS where PLANDATE=:PLANDATE and BASEID=:BASEID and (PLANNUMBER<=:PLAN_START OR PLANNUMBER>=:PLAN_FINISH) ';
          Dm.ChangeQuery.Prepare;
          Dm.ChangeQuery.ParamByName('PLANDATE').AsDateTime :=MegaDatePanel.Date;
          Dm.ChangeQuery.ParamByName('BASEID').Value:=StrToInt(MegaSelTradeDelegate.Value);
          Dm.ChangeQuery.ParamByName('PLAN_START').AsInteger:=MStart;
          Dm.ChangeQuery.ParamByName('PLAN_FINISH').AsInteger:=MFinish;
          Dm.ChangeQuery.Transaction.Active:=true;
          Dm.ChangeQuery.ExecQuery;
          //Dm.ChangeQuery.transaction.CommitRetaining;
        end;
        Dm.ChangeQuery.Close;
        Dm.ChangeQuery.SQL.Text:=' INSERT INTO TTN_PLAN_POSITIONS (PLANDATE, PLANNUMBER, BASEID, NAKL_RECID, NAKL_BASEID, POS_NUM, NUM_KM) VALUES (:PLANDATE, :PLANNUMBER, :BASEID, :NAKL_RECID, :NAKL_BASEID, :POS_NUM, :NUM_KM)';
        Dm.ChangeQuery.Transaction.Active:=true;
        Dm.ChangeQuery.Prepare;
        num_km:=0;
        for iOrders := 0 to Length(vPlansResponse.return.Plans[iPlans].Routes[i].Stops)-1 do
        begin
          Dm.ChangeQuery.Close;
          Dm.ChangeQuery.ParamByName('PLANDATE').AsDateTime:=MegaDatePanel.Date;
          Dm.ChangeQuery.ParamByName('PLANNUMBER').AsInteger:=i+1; //dsRoute.FieldByName('ROUTE_NUM').AsInteger;
          Dm.ChangeQuery.ParamByName('NAKL_BASEID').AsInteger:=StrToInt(rxStrUtils.ExtractWord(2,vPlansResponse.return.Plans[iPlans].Routes[i].Stops[iOrders].OrderUserDefinedId,['|']));//StrToInt(MegaSelTradeDelegate.Value);
          Dm.ChangeQuery.ParamByName('POS_NUM').AsInteger:=vPlansResponse.return.Plans[iPlans].Routes[i].Stops[iOrders].StopNo+1;  //  dsRoute.FieldByName('NUM_INROUTE').AsInteger;
          Dm.ChangeQuery.ParamByName('NAKL_RECID').AsInteger:=StrToInt(rxStrUtils.ExtractWord(1,vPlansResponse.return.Plans[iPlans].Routes[i].Stops[iOrders].OrderUserDefinedId,['|']));//StrToInt(System.copy(st,1,System.Pos('|',st)-1));
          Dm.ChangeQuery.ParamByName('BASEID').AsInteger:=StrToInt(MegaSelTradeDelegate.Value);//TRoute(RouteList.Items[i]).DocBaseID;//StrToInt(System.copy(st,System.Pos('|',st)+1,Length(st)));
          Dm.ChangeQuery.ParamByName('NUM_KM').AsFloat:=vPlansResponse.return.Plans[iPlans].Routes[i].Stops[iOrders].Km;//Trunc(dsRoute.FieldByName('DISTANC').AsFloat);
          num_km:= num_km+vPlansResponse.return.Plans[iPlans].Routes[i].Stops[iOrders].Km;
          try
           Dm.ChangeQuery.ExecQuery;
          except
           MainForm.reInfo.Lines.Add('!!! ОШИБКА!!! Не загружена накладная '+ vPlansResponse.return.Plans[iPlans].Routes[i].Stops[iOrders].OrderUserDefinedId);
          end;
        end;
        Dm.ChangeQuery.Close;
        Dm.ChangeQuery.SQL.Text:=' update TTN_PLAN set TMS = 1,num_km= :NUM_KM where (PLANDATE = :PLANDATE) and (PLANNUMBER = :PLANNUMBER) and  (BASEID = :BASEID);';
        Dm.ChangeQuery.ParamByName('PLANDATE').AsDateTime:=MegaDatePanel.Date;
        Dm.ChangeQuery.ParamByName('PLANNUMBER').AsInteger:=i+1; //dsRoute.FieldByName('ROUTE_NUM').AsInteger;
        Dm.ChangeQuery.ParamByName('BASEID').AsInteger:=StrToInt(MegaSelTradeDelegate.Value);//TRoute(RouteList.Items[i]).DocBaseID;//StrToInt(System.copy(st,System.Pos('|',st)+1,Length(st)));
        Dm.ChangeQuery.ParamByName('NUM_KM').AsFloat:=vPlansResponse.return.Plans[iPlans].Routes[i].Km;//num_km;//TRoute(RouteList.Items[i]).DocBaseID;//StrToInt(System.copy(st,System.Pos('|',st)+1,Length(st)));
        Dm.ChangeQuery.ExecQuery;
        //Dm.ChangeQuery.transaction.CommitRetaining;
      end;
     end;
  end;
  MainForm.reInfo.Visible:=True;   }
end;

procedure TfmTTNPlan.N35Click(Sender: TObject);
begin
//
end;

procedure TfmTTNPlan.gridPlanSortMarkingChanged(Sender: TObject);
begin
  SortInGrid(gridPlan);
end;

procedure TfmTTNPlan.gridPlanDblClick(Sender: TObject);
begin
    if (actNaklRemove.Enabled) then actNaklRemove.Execute;
end;

procedure TfmTTNPlan.ceDK_CChange(Sender: TObject);
begin
  MegaDSTTNPlan.Edit;
  begin

    MegaSelDKDialogExpeditor.KodDK:= MegaDSTTNPlanDK_C.AsFloat;
    if MegaSelDKDialogExpeditor.ExecuteAsControlPopUp(ceDK_C) then
    begin
      MegaDSTTNPlanDK_C.AsFloat:= MegaSelDKDialogExpeditor.KodDK;
      MegaDSTTNPlanSHORTNAME_DK_C.AsString:= MegaSelDKDialogExpeditor.ShortnameDK;
    end;
  end;
  SelectNext(TWinControl(Sender), True, True);
end;

procedure TfmTTNPlan.chbCheckRentClick(Sender: TObject);
var
  afdsNaklListActive : boolean;
  aMegaDSTTNPlanActive : boolean;
  aMegaDSTTNPlanPositionsActive : boolean;
begin
  lbWholeRent.Enabled:= chbCheckRent.Checked;
  Label13.Enabled    := chbCheckRent.Checked;
  cxDBLabel1.Enabled := chbCheckRent.Checked;
  Label14.Enabled    := chbCheckRent.Checked;
  cxDBLabel2.Enabled := chbCheckRent.Checked;

//  gridNaklDBBandedTableView1DOC_CREATE.Visible:= chbCheckRent.Checked;
  gridNaklDBBandedTableView1VISITDATE.Visible := chbCheckRent.Checked;
//  gridNaklDBBandedTableView1VISITDATE2.Visible:= chbCheckRent.Checked;
  gridPlan.FieldColumns['DISTANCE'].Visible   := chbCheckRent.Checked;

  afdsNaklListActive := fdsNaklList.Active;
  aMegaDSTTNPlanActive := MegaDSTTNPlan.Active;
  aMegaDSTTNPlanPositionsActive := MegaDSTTNPlanPositions.Active;

  if afdsNaklListActive then
    fdsNaklList.Close;
  if aMegaDSTTNPlanActive then
    MegaDSTTNPlan.Close;
  if aMegaDSTTNPlanPositionsActive then
    MegaDSTTNPlanPositions.Close;

//  fdsNaklList.ParamByName('SHOW_RENT').Asinteger := byte(lbWholeRent.Enabled);
  MegaDSTTNPlan.ParamByName('SHOW_RENT').Asinteger := byte(lbWholeRent.Enabled);
  MegaDSTTNPlanPositions.ParamByName('SHOW_RENT').Asinteger := byte(lbWholeRent.Enabled);

  if afdsNaklListActive then
    fdsNaklList.Open;
  if aMegaDSTTNPlanActive then
    MegaDSTTNPlan.Active := true;
  if aMegaDSTTNPlanPositionsActive then
    MegaDSTTNPlanPositions.Active := true;

end;


procedure TfmTTNPlan.CSV1Click(Sender: TObject);
var  PathFile,email,Subject,s:string;
   f:TextFile;
begin
  mgrdtstTmpSelRinkai.ParamByName('BDATE').asDateTime:= MegaDatePanel.Date;
  mgrdtstTmpSelRinkai.ParamByName('EDATE').asDateTime:= MegaDatePanel.Date;
  mgrdtstTmpSelRinkai.Open;
  PathFile:= 'C:\Yana\xml\import_'+IntTostr(DateDay(MegaDatePanel.Date))+ '.csv';
  AssignFile(f,PathFile);
  Rewrite(f);
  while not mgrdtstTmpSelRinkai.Eof do
    begin
     Writeln(f, 'RIRO_INPUT_LOCATIONSANDORDERS_V6.00;'+
     mgrdtstTmpSelRinkai.FieldByName('DepotUserDefinedId').AsString +';'+ //GSK
     mgrdtstTmpSelRinkai.FieldByName('LocationUserDefinedId').asString +';' +
     mgrdtstTmpSelRinkai.FieldByName('NAME').asString + ';'+
     mgrdtstTmpSelRinkai.FieldByName('STREET').asString + ';'+// street
     mgrdtstTmpSelRinkai.FieldByName('HouseNumber').asString + ';'+// house
     mgrdtstTmpSelRinkai.FieldByName('PostCode').asString +';' +
      mgrdtstTmpSelRinkai.FieldByName('City').asString + ';'+ //city
     mgrdtstTmpSelRinkai.FieldByName('COUNTRY').asString + ';'+
     mgrdtstTmpSelRinkai.FieldByName('LocationComment').asString +';'+
     mgrdtstTmpSelRinkai.FieldByName('Mail').asString+';'+
     mgrdtstTmpSelRinkai.FieldByName('Phone').asString+';'+
     IntToStr(mgrdtstTmpSelRinkai.FieldByName('TW1F').AsInteger)+';'+
     IntToStr(mgrdtstTmpSelRinkai.FieldByName('TW1T').AsInteger)+';'+
     IntToStr(mgrdtstTmpSelRinkai.FieldByName('TW2F').AsInteger)+';'+
     IntToStr(mgrdtstTmpSelRinkai.FieldByName('TW2T').AsInteger)+';'+
     IntToStr(mgrdtstTmpSelRinkai.FieldByName('LoadingStartTimeFrom').AsInteger)+';'+
     IntToStr(mgrdtstTmpSelRinkai.FieldByName('LoadingStartTimeTo').AsInteger)+';'+
     ReplaceStr(mgrdtstTmpSelRinkai.FieldByName('GeoX').AsString,',','.')+';'+
     ReplaceStr(mgrdtstTmpSelRinkai.FieldByName('GeoY').AsString,',','.')+';'+
     IntToStr(mgrdtstTmpSelRinkai.FieldByName('AdminTimeAtCustomer').AsInteger)+';'+
     IntToStr(mgrdtstTmpSelRinkai.FieldByName('TimeAtCustomer').AsInteger)+';'+
      '-1;'+ //Weight limit
       '-1;'+ //Vehicle type
              '-1;'+ //Customer factor
     mgrdtstTmpSelRinkai.FieldByName('OrderUserDefinedId').AsString+';'+
     IntToStr(mgrdtstTmpSelRinkai.FieldByName('DATE_INT').AsInteger)+';'+
     mgrdtstTmpSelRinkai.FieldByName('OrderComment').asString+';'+
     mgrdtstTmpSelRinkai.FieldByName('ITEMS').asString+
     ';;' +
     mgrdtstTmpSelRinkai.FieldByName('car_snum').asString+';'+
     mgrdtstTmpSelRinkai.FieldByName('plannumber').asString+';'+//Id of the route
       '-1;'+ //Start time of the route
              '-1;'+ //End time of the route
              '-1;'+ //Km of the route
       '-1;'+ //Optimization of the route
                   mgrdtstTmpSelRinkai.FieldByName('pos_num').asString+';'+ //Stop order
              '-1' //Waiting time
     )
     ;

      {mgrdtstTmpSelRinkai.FieldByName('local_kod').AsString+';'+mgrdtstTmpSelRinkai.FieldByName('kolich').AsString+';'+ReplaceStr(mgrdtstTmpSelRinkai.FieldByName('price_with_nds').AsString,',','.')+';'+
               mgrdtstTmpSelRinkai.FieldByName('name_mater').AsString+';1;'+mgrdtstTmpSelRinkai.FieldByName('ed_izm').AsString+';'+ReplaceStr(mgrdtstTmpSelRinkai.FieldByName('price_without_nds').AsString,',','.')+';'+
               ReplaceStr(mgrdtstTmpSelRinkai.FieldByName('summa_without_nds').AsString,',','.')+';'+ReplaceStr(Query.FieldByName('summa_with_NDS').AsString,',','.')+';'+
               ReplaceStr(mgrdtstTmpSelRinkai.FieldByName('NDS').AsString,',','.')+';'+mgrdtstTmpSelRinkai.FieldByName('kod_ean').AsString);
       }
     //s:=Query.FieldByName('outlet_id').AsString+';"'+ReplaceStr(qr.FieldByName('NAME_DK').AsString,'"','""')+'('+
     //   ReplaceStr(qr.FieldByName('NAME').AsString,'"','""')+')";"'+ReplaceStr(qr.FieldByName('address').AsString,'"','""')+
     //   '";'+qr.FieldByName('category').AsString;
     //Writeln(f,s);
     mgrdtstTmpSelRinkai.Next;
    end;
  mgrdtstTmpSelRinkai.Close;
  CloseFile(f);

   frmSendMail:=TfrmSendMail.Create(Application);
   frmSendMail.SendMailMessage('kislaja.j@khortitsa.com','',Subject,'',PathFile,'[Выгрузка]',true,'','');
   frmSendMail.show;

end;

procedure TfmTTNPlan.cxButton9Click(Sender: TObject);
begin
  dmMegaReports.MyShow(200648, Date(), DateToStrEx(MegaDatePanel.Date) + ',' + MegaSelTradeDelegate.Value + ',' + IntToStr(MegaDSTTNPlanPLANNUMBER.AsInteger));
end;

procedure TfmTTNPlan.cxDBLookupComboBox1PropertiesChange(Sender: TObject);
begin
//
// MegaDSTTNPlanPositions.CloseOpen(true);
 if (MegaDSTTNPlan.State = dsInsert)
  or (MegaDSTTNPlan.State = dsEdit)
  then MegaDSTTNPlan.Post;
 MegaDSTTNPlanPositions.closeOpen(true);

end;

procedure TfmTTNPlan.dbcbTypeChange(Sender: TObject);
begin

  actPlanRefresh.Execute;
end;

procedure TfmTTNPlan.actTTNOpenExecute(Sender: TObject);
begin
  MegaDSTTNPlan.OpenTTN;
end;

procedure TfmTTNPlan.actTTNOpenUpdate(Sender: TObject);
begin
  TAction(sender).Enabled := MegaDSTTNPlanIS_TEMP_MARSHRUT.IsNull or
                            (MegaDSTTNPlanIS_TEMP_MARSHRUT.AsInteger<>1)
end;

procedure TfmTTNPlan.actRecalcPosExecute(Sender: TObject);
begin
   //
if MessageDlg('Вы хотите поменять располжение точек в маршруте согласно уадленности от склада?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
begin
   if (MegaDSTTNPlanNAS_P_FROM.asInteger<>0) then
   begin
     MegaDSTTNPlanPositions.DisableControls;
     MegaDSTTNPlanPositions.doSort(['distance_tt'],[true]);
     MegaDSTTNPlanPositions.first;
     while not MegaDSTTNPlanPositions.eof do
     begin
       MegaDSTTNPlanPositions.edit;
       MegaDSTTNPlanPositions.fieldByNAme('POS_NUM').asInteger:=MegaDSTTNPlanPositions.Recno;
       MegaDSTTNPlanPositions.Post;
       MegaDSTTNPlanPositions.Next;
     end;
     MegaDSTTNPlanPositions.UpdateTransaction.commit;
     MegaDSTTNPlanPositions.EnableControls;
   end
   else
     MessageBox(Application.Handle,'Не задан пункт погрузки.'+#13#10+'Пересчет произвести нельзя! Откройте "Заголовок" и укажите пункт погрузки','Ошибка!',MB_OK+MB_ICONERROR+MB_APPLMODAL);
end;
end;


{ ----------------------------------------------------------------
  PrintDocNaklByIDs                                    31_03_2026
  Друкує накладну за RecID / BaseID без залежності від TDocNaklForm.
  ---------------------------------------------------------------- }
procedure PrintDocNaklByIDs(aRecID, aBaseID: integer);
var
  ldmRep: TdmPrintNakl2;
  re: TRegExpr;
begin
  ldmRep := TdmPrintNakl2.Create(nil);
  try
    ldmRep.lvi                  := False;
    ldmRep.PrintNaklNew         := False;
    ldmRep.IsWithoutTransport   := False;
    ldmRep.PrintNaklWithVozvrat := False;
    ldmRep.PrintNaklWithZMC     := False;
    ldmRep.IsOSNakl             := False;
    ldmRep.IsBillaNakl          := False;

    ldmRep.PrepareReport(
      aRecID, aBaseID,
      IntfDBProvider.GetDB,
      DM.Transaction,
      False);

    frVariables.Variable['HidePriceAndCost'] := False;

    if ((ldmRep.OPERSTATUS = iosOutcomeToOtv)
    and (fbMegaUtils.fbExecQueryParams(
           'SELECT VALUE_INT FROM GET_SPRAV_DK_ADDITION_PROP(:DK, ''PRINT_PRICE_OTVET'')',
           ['DK', ldmRep.DocNaklDK_TO.AsFloat]) = 0)) then
    begin
      frVariables.Variable['IsOtv']            := True;
      frVariables.Variable['HidePriceAndCost'] := True;
    end
    else
      frVariables.Variable['IsOtv'] := False;

    if (IntfMegaDBCommon.GetCountry = iccRussia) or
       (IntfMegaDBCommon.GetCountry = kodRus)    then
    begin
      re := TRegExpr.Create;
      try
        re.Expression := '\#\s*([-0-9A-Za-zА-Яа-я]+)(\s*\@(\d+))*';
        if re.Exec(Trim(ldmRep.DocNaklNOTES.AsString)) then
        begin
          frVariables.Variable['ZakazNo']  := re.Match[1];
          if re.Match[3] = '' then
            frVariables.Variable['KodOrder'] := ''
          else
            frVariables.Variable['KodOrder'] := 'код поставщика  ' + re.Match[3];
        end
        else
        begin
          frVariables.Variable['ZakazNo']  := '';
          frVariables.Variable['KodOrder'] := '';
        end;
      finally
        re.Free;
      end;
    end;

    frVariables.Variable['flic']      := True;
    frVariables.Variable['not_agent'] := True;

    ldmRep.NaklReport.PrepareReport;
    ldmRep.NaklReport.ModifyPrepared :=
      (IntfMegaDBCommon.GetParam('EDIT_NAKL_REPORT', '0') = '1');
    //ldmRep.NaklReport.ShowReport;
    ldmRep.NaklReport.PrintPreparedReport('', 2, False, frAll);

  finally
    ldmRep.IsOSNakl := False;
    ldmRep.Free;
  end;
end;

{ ----------------------------------------------------------------
  PrintNaklF2WithoutHeaderByIDs                        01_04_2026
  Друкує накладну Ф2 без шапки за RecID / BaseID
  без залежності від TDocNaklForm.
  Адаптовано з TDocNaklForm.actPrintNaklF2WithoutHeaderExecute
  (DocNakl.pas) за патерном PrintDocNaklByIDs.
  Якщо fLic = True, друкується лише одна копія.
  Якщо fLic = False, друкується дві копії (одна з not_agent = True, друга з not_agent = False).
  ---------------------------------------------------------------- }
procedure PrintNaklF2WithoutHeaderByIDs(aRecID, aBaseID: integer);
var
  ldmRep: TdmPrintNakl2;
  fLic: boolean;
begin
  ldmRep := TdmPrintNakl2.Create(nil);
  try
    ldmRep.IsBillaNakl := False;
    ldmRep.IsOSNakl    := False;

    ldmRep.PrepareReport(
      aRecID, aBaseID,
      IntfDBProvider.GetDB, DM.Transaction, False);

    frVariables.Variable['HidePriceAndCost'] := False;

    if ldmRep.OPERSTATUS = iosOutcomeToOtv then
    begin
      frVariables.Variable['IsOtv']            := True;
      frVariables.Variable['HidePriceAndCost'] := True;
    end
    else
      frVariables.Variable['IsOtv'] := False;

    if (ldmRep.OPERSTATUS <> 4) or
       (IntfMegaDBCommon.GetParam('PR_NEW_NAKL_F2_AGENT', '0') <> '1') then
      fLic := True
    else
      fLic := DM.GetLic(ldmRep.DocNaklDK_TO.AsFloat,
                        ldmRep.DocNakl.FieldByName('OPERDATE').AsDateTime);

    frVariables.Variable['flic']          := fLic;
    frVariables.Variable['not_agent']     := True;
    frVariables.Variable['statePrint999'] := 0;

    ldmRep.frNakl_f2_withoutheader.PrepareReport;
    ldmRep.frNakl_f2_withoutheader.PrintPreparedReport('', 1, False, frAll);

    if not fLic then
    begin
      ldmRep.IsBillaNakl := False;
      ldmRep.IsOSNakl    := False;

      ldmRep.PrepareReport(
        aRecID, aBaseID,
        IntfDBProvider.GetDB, DM.Transaction, False);

      frVariables.Variable['HidePriceAndCost'] := False;
      if ldmRep.OPERSTATUS = iosOutcomeToOtv then
      begin
        frVariables.Variable['IsOtv']            := True;
        frVariables.Variable['HidePriceAndCost'] := True;
      end
      else
        frVariables.Variable['IsOtv'] := False;

      frVariables.Variable['flic']      := True;
      frVariables.Variable['not_agent'] := False; // на агента

      ldmRep.frNakl_f2_withoutheader.PrepareReport;
      ldmRep.frNakl_f2_withoutheader.PrintPreparedReport('', 1, False, frAll);
    end;

  finally
    ldmRep.IsOSNakl := False;
    ldmRep.Free;
  end;
end;

procedure Helper_PrintUntitledInternalDoc(aRecID, aBaseID: integer);
var
  LQuery: TMegaQuery;
  LOwnsTransaction: Boolean;
  LPrinterIndex: Integer;
  fLic: Boolean;
begin
  LOwnsTransaction := not DM.Transaction.Active;
  if LOwnsTransaction then
    DM.Transaction.Active := True;

  try
    LQuery := TMegaQuery.Create(nil);
    try
      LQuery.Database := DM.Money;
      LQuery.Transaction := DM.Transaction;
      LQuery.SQL.Text :=
        'select dn.group_oper, dn.kod_oper, dn.dk_to, dn.operdate ' +
        'from doc_nakl dn ' +
        'where dn.recid = :recid and dn.baseid = :baseid';
      LQuery.ParamByName('recid').AsInteger := aRecID;
      LQuery.ParamByName('baseid').AsInteger := aBaseID;
      LQuery.Prepare;
      LQuery.ExecQuery;
      if LQuery.Eof then
        Exit;

      fLic := CalcUntitledInternalDocLic(
        DM.Transaction,
        LQuery.FieldByName('GROUP_OPER').AsInteger,
        LQuery.FieldByName('KOD_OPER').AsInteger,
        LQuery.FieldByName('DK_TO').AsFloat,
        LQuery.FieldByName('OPERDATE').AsDateTime);

      LPrinterIndex := Printer.PrinterIndex;
      if (LPrinterIndex < 0) and (frxPrinters.PrinterIndex >= 0) then
        LPrinterIndex := frxPrinters.PrinterIndex;

      PrintUntitledInternalDoc(
        nil,
        DM.Transaction,
        aRecID,
        aBaseID,
        1,
        LPrinterIndex,
        True,
        fLic);
    finally
      LQuery.Free;
    end;
  finally
    if LOwnsTransaction and DM.Transaction.Active then
      DM.Transaction.Active := False;
  end;
end;

// add new nirs 31_03_2026 ----
function TfmTTNPlan.GetBalanceByNakl(aRecID, aBaseID: integer): integer;
var
   mQuery: TMegaQuery;
begin
    mQuery := TMegaQuery.Create(Self);
    try
      mQuery.DataBase:= DM.Money;
      mQuery.Transaction:= DM.Transaction;
      mQuery.SQL.Text:= 'select dn.balance_kod from doc_nakl dn where dn.recid = :RecID and dn.baseid = :BaseID';
      mQuery.ParamByName('RecID').AsInteger := aRecID;
      mQuery.ParamByName('BaseID').AsInteger := aBaseID;
      mQuery.Prepare;
      mQuery.ExecQuery;
      if not mQuery.Eof then
        Result := mQuery.FieldByName('balance_kod').AsInteger
      else
        Result := 0;
    finally
      mQuery.Free;
    end;
end;

procedure TfmTTNPlan.actPrintNaklListInRoutExecute(Sender: TObject);
var
 Nakl_RecID, Nakl_BaseID: Integer;
 Balance: Integer;
begin
  if not MegaDSTTNPlanPositions.Active then Exit;
  if MegaDSTTNPlanPositions.IsEmpty then Exit;

  MegaDSTTNPlanPositions.DisableControls;
  try
    MegaDSTTNPlanPositions.First;
    while not MegaDSTTNPlanPositions.Eof do
    begin
      if (not MegaDSTTNPlanPositionsNAKL_RECID.IsNull) and
         (MegaDSTTNPlanPositionsNAKL_RECID.AsInteger > 0) then begin
             Nakl_RecID := MegaDSTTNPlanPositionsNAKL_RECID.AsInteger;
             Nakl_BaseID := MegaDSTTNPlanPositionsNAKL_BASEID.AsInteger;
             balance := GetBalanceByNakl(Nakl_RecID, Nakl_BaseID);
             if (balance <> 0) then
             if (balance <> 300)  then
                PrintDocNaklByIDs(Nakl_RecID, Nakl_BaseID)
             else
             begin
               PrintNaklF2WithoutHeaderByIDs(Nakl_RecID, Nakl_BaseID);
               Helper_PrintUntitledInternalDoc(Nakl_RecID, Nakl_BaseID);
             end;
          end;
      MegaDSTTNPlanPositions.Next;
    end;
  finally
    MegaDSTTNPlanPositions.EnableControls;
  end;
end;

{ =====================================================
  SetupPrintNaklInRout                        31_03_2026
  Перепризначає btnPrintTTN для друку накладних по маршруту.
  Закоментувати виклик у FormCreate для відновлення старої логіки
  (Action = actTTNPrint, Caption = 'Печать маршрута').
  ===================================================== }
procedure TfmTTNPlan.SetupPrintNaklInRout;
begin
  btnPrintTTN.Action  := actPrintNaklListInRout;
  btnPrintTTN.Caption := 'Печать накладних';
end;
// ---- end add new nirs 31_03_2026

procedure TfmTTNPlan.actRefreshDataExecute(Sender: TObject);
begin  //Процедура ОБНОВИТЬ
  if MegaDSTTNPlan.Active then
     if MegaDSTTNPlan.State in [dsEdit,dsInsert] then MegaDSTTNPlan.Post;
  //Transaction.Commit;
 // Transaction.Active:= True;
  RefreshNaklList;
  InitTTNPlanTabSheets;
  tblTTN_Migrat.Open; //для выбора маршрута в который будет пемещатся ТТН
  {if MessageDlg('Создать маршруты'+#13+#10+'на текущую дату?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
     actPlanAddExecute(Sender);//Поставить процеду добавления маршрутов }

//  listTonnag;
end;

procedure TfmTTNPlan.actOpenNaklExecute(Sender: TObject);
var ds : TDataSet;
begin
  IntfMegaFormFactory.OpenDocument(
    Application.MainForm,
    fdsNaklListDOCTYPE.AsString,
    fdsNaklListRECID.AsInteger,
    fdsNaklListBASEID.Asinteger,
    fdsNaklListOPERDATE.AsDateTime);
end;

procedure TfmTTNPlan.actOpenNaklFromPlanExecute(Sender: TObject);
begin
  IntfMegaFormFactory.OpenDocument(
    Application.MainForm,
    MegaDSTTNPlanPositionsDOCTYPE.AsString,
    MegaDSTTNPlanPositionsNAKL_RECID.AsInteger,
    MegaDSTTNPlanPositionsNAKL_BASEID.AsInteger,
    MegaDSTTNPlanPositionsOPERDATE.AsDateTime);
end;


procedure TfmTTNPlan.actRequestExecute(Sender: TObject);
begin
  GotoURL(sRequestDelivery);
end;

procedure TfmTTNPlan.actSelDelNarExecute(Sender: TObject);
begin
//
  //if not(DM.SharedQuery.Transaction.InTransaction) then DM.SharedQuery.Transaction.StartTransaction;

  DM.ChangeQuery.Close;
  DM.ChangeQuery.SQL.Text:='delete from doc_order_sklad where recid=:recid and baseid=:baseid';
  DM.ChangeQuery.ParamByName('RECID').asInteger:=MegaDSTTNPlanPositionsORDER_RECID.value;
  DM.ChangeQuery.ParamByName('BASEID').asInteger:=MegaDSTTNPlanPositionsORDER_BASEID.value;
  DM.ChangeQuery.ExecQuery;

  //DM.SharedQuery.Transaction.Commit;

  MegaDSTTNPlanPositions.Refresh;
end;

procedure TfmTTNPlan.actSelEditNarExecute(Sender: TObject);
var fm:TfmDocOrderSkladPos;

begin
  //
  fm:=TfmDocOrderSkladPos.Create(self);

  //if MegaDSTTNPlanPositionsKOMPLEKTOVSCHIK.asString='' then
  begin
    fm.DOCRECNO:=MegaDSTTNPlanPositionsORDER_RECID.value;
    fm.BASEID:=MegaDSTTNPlanPositionsORDER_BASEID.value;
  end;

  Fm.actRefresh.Execute;
  fm.ShowModal;

end;

procedure TfmTTNPlan.actSendJointLogisticExecute(Sender: TObject);
begin
 SendJointLogistic(MegaDSTTNPlanPLANNUMBER.asInteger);
end;

procedure TfmTTNPlan.RefreshMinOutletCount;
var
  lMinClientCount: integer;
begin //Получения из параметров базы минимально допустимого количества посещения ТТ
  if (MegaDSTTNPlanDOCTYPE.AsString = sttndtCity)
  then lMinClientCount:= StrToIntDef(IntfMegaDBCommon.GetParam(sMinTTNClientCountCity, '23'), 23)
  else lMinClientCount:= StrToIntDef(IntfMegaDBCommon.GetParam(sMinTTNClientCount, '17'), 17);

  lbNeedOutletCount.Caption:= IntToStr(lMinClientCount);
end;

procedure TfmTTNPlan.MegaDSTTNPlanAfterPost(DataSet: TDataSet);
begin
  //if Transaction.InTransaction then
  //   Transaction.Commit;
//  MegaDSTTNPlanPositions.CloseOpen(true);
end;

procedure TfmTTNPlan.MegaDSTTNPlanAfterScroll(DataSet: TDataSet);
var
  NaklSum, PlanSum : double;
begin
  if chbCheckRent.Checked then
  begin
    PlanSum := DBSumListTTNPlan.SumCollection.Items[0].SumValue;
    NaklSum := DBSumListTTNPlan.SumCollection.Items[1].SumValue;

    if NaklSum = 0 then
    begin // деление на 0
      PlanSum := 0;
      NaklSum := 1;
    end;
    lbWholeRent.Caption := 'Общая рентабельность:'+Format('%6.2f',[PlanSum*100/NaklSum]);
  end;
end;

procedure TfmTTNPlan.MegaDSTTNPlanDOCTYPEChange(Sender: TField);
begin
  RefreshMinOutletCount;
end;

procedure TfmTTNPlan.SendJointLogistic(paramRouteNumber: integer);
var  TempDir,EmailAdr,EmailAdrOld:string;
     intfRef: IMySendMail;
    Size_dir: DWORD;
    s: Char;
    wsLogist: IJointLogistic;
  paramFileName:string;
  paramContent, A: TByteDynArray; // array of Byte;
  paramDebtorCodeLogistic: Double;
  Result: integer;
  doc: IXmlDocument;
  FS: TFileStream;
  directory: string;
  xsdt1: TXSDateTime;
  lSM:TMegaSendMail;
  email_seb,email_seb_buf,email_sv,email_all:string;
  pathbuffer: array [0..MAX_PATH] of Char;
  PathLine:  string;
  body: TStringList;
begin
  EmailAdr:= IntfMegaDBCommon.GetParam('JOINTLOGISTIC_MAIL', '');
  EmailAdrOld:= EmailAdr;
  if InputQuery('e-mail ', 'Введите адрес эл.почты', EmailAdr) then
     begin
     if EmailAdrOld <> EmailAdr then
      IntfMegaDBCommon.SetParam('JOINTLOGISTIC_MAIL', EmailAdr);

  SetLength(TempDir, MAX_PATH);
  Size_dir:= GetTempPath(MAX_PATH, PChar(TempDir));
  SetLength(TempDir, Size_dir);
  TempDir:= IncludeTrailingBackslash(TempDir);
  paramFileName:= 'RoutePlan_'+IntToStr(paramRouteNumber)+'_'+ReplaceStr(DateToStr(Now), '.', '')+'.xml';
  wsLogist:=  GetJointLogistic(False, (IntfMegaDBCommon.GetCountry = iccRussia));
  xsdt1:= TXSDateTime.Create();
  try
    xsdt1.AsDateTime := MegaDatePanel.Date;
    A:= wsLogist.GetRoutePlanXmlBytes(xsdt1, paramRouteNumber, IntfMegaDBCommon.GetBaseID);
    FS:= TFileStream.Create(TempDir+paramFileName, fmCreate);
    try
      if Length(A) > 0 then
       FS.WriteBuffer(Pointer(A)^, Length(A));
    finally
      FreeAndNil(FS);
    end;
  finally
    xsdt1.Free;
  end;    
    { intfRef := CreateComObject(CLASS_ClassSendMail) as IMySendMail;
       if intfRef.SendMail(EmailAdr,'План маршрута','во вложении',TempDir+paramFileName,'','')<>1 then
          ShowMessage('ОШИБКА отправки плана маршрута ');
       ShowMessage('Отправлено');}
        try
            lSM:=TMegaSendMail.Create(self);
            lSM.SetSMTPLoginByID(4); // устанавливаю хост/логин/пароль для SMTP
            lSM.ToAddress.Add(EmailAdr);
            lSM.Body.Clear;
            lSM.Body.Add('во вложении') ;
            lSM.Attachments.Add(TempDir+paramFileName);
            lSM.SetEmailFrom('postmaster@megapol.com.ua');
            lSM.Subject:= 'План маршрута';
            try
              lSM.SendEmail(false);
            except
              on e:Exception do
                liUtils.Error('Не удалось отправить данные !'+#13+#10+' ошибка - [' + e.Message + ']');
            end;
            ShowMessage('Отправлено');
            finally
             lSM.free;
            end;    

        //if FileExists(XlsFile) then DeleteFile(PChar(XlsFile));
        if FileExists(TempDir+paramFileName) then DeleteFile(PChar(TempDir+paramFileName));


  end;
end;

procedure TfmTTNPlan.ExportJointLogistic(paramRouteNumber: integer);
var
  wsLogist: IJointLogistic;
  paramFileName:string;
  paramContent, A: TByteDynArray; // array of Byte;
  paramDebtorCodeLogistic: Double;
  Result: integer;
  doc: IXmlDocument;
  FS: TFileStream;
  directory: string;
  xsdt1: TXSDateTime;
begin
  if SelectDirectory('Папка для сохранения файла:','C:\', directory) then
  begin
  paramFileName:= 'RoutePlan_'+IntToStr(paramRouteNumber)+'_'+ReplaceStr(DateToStr(Now), '.', '')+'.xml';
  wsLogist:=  GetJointLogistic(False, (IntfMegaDBCommon.GetCountry = iccRussia));
  xsdt1:= TXSDateTime.Create();
  try
    xsdt1.AsDateTime := MegaDatePanel.Date;
    A := wsLogist.GetRoutePlanXmlBytes(xsdt1, paramRouteNumber, IntfMegaDBCommon.GetBaseID);
    FS := TFileStream.Create(directory+'/'+paramFileName, fmCreate);
    try
      if Length(A) > 0 then
       FS.WriteBuffer(Pointer(A)^, Length(A));
      ShowMessage('Выгрузка завершена')
    finally
      FreeAndNil(FS);
    end;
  finally
    xsdt1.Free;
  end;
  end;

end;


procedure TfmTTNPlan.actExportCarsExecute(Sender: TObject);
var wsTocan: IDocumentZayavkaNaTransport;
    xsdt1: TXSDateTime;
    s:string;
begin
  wsTocan:=  GetApiForTocan(False, (IntfMegaDBCommon.GetCountry = iccRussia));
  xsdt1:= TXSDateTime.Create();
  try
    xsdt1.AsDateTime := MegaDatePanel.Date;
    try
      s:= wsTocan.RequestXmlDocCarsForTocan(xsdt1);
      ShowMessage('Машины выгружены -' + s);
    except
      on e: Exception do
      if e.Message <> '' then
        MessageDlg('Внимание!'+#13+#10+'<' + e.Message + '>''', mtWarning, [mbOK], 0);
    end
  finally
    xsdt1.Free;
  end;

end;

procedure TfmTTNPlan.actExportJointLogisticAllExecute(Sender: TObject);
begin
  ExportJointLogistic(0);
end;

procedure TfmTTNPlan.actExportJointLogisticExecute(Sender: TObject);
begin
  ExportJointLogistic(MegaDSTTNPlanPLANNUMBER.asInteger);
end;

procedure TfmTTNPlan.actExportNaklExecute(Sender: TObject);
var wsTocan: IDocumentZayavkaNaTransport;
    xsdt1: TXSDateTime;
    s:string;
begin
  wsTocan:=  GetApiForTocan(False, (IntfMegaDBCommon.GetCountry = iccRussia));
  xsdt1:= TXSDateTime.Create();
  try
    xsdt1.AsDateTime := MegaDatePanel.Date;
    try
    s:= wsTocan.RequestXmlDocInvoicesWitoutPlanForTocan(xsdt1);
    ShowMessage('Создан или обновлен проект -'+s);
    except
     on e: Exception do
      if e.Message <> '' then
        MessageDlg('Внимание!'+#13+#10+'<' + e.Message + '>''', mtWarning, [mbOK], 0);
   end
  finally
    xsdt1.Free;
  end;
end;

procedure TfmTTNPlan.actExportRouteExecute(Sender: TObject);
var //TempDir,EmailAdr,EmailAdrOld:string;
    // intfRef: IMySendMail;
    //Size_dir: DWORD;
    //s: Char;
  wsTocan: IDocumentZayavkaNaTransport;
  paramFileName:string;
  paramContent, A: TByteDynArray; // array of Byte;
//  paramDebtorCodeLogistic: Double;
//  Result: integer;
//  doc: IXmlDocument;
  FS: TFileStream;
  directory: string;
  xsdt1: TXSDateTime;
  s:string;
//  lSM:TMegaSendMail;
//  email_seb,email_seb_buf,email_sv,email_all:string;
//  pathbuffer: array [0..MAX_PATH] of Char;
//  PathLine:  string;
//  body: TStringList;
begin
  if SelectDirectory('Папка для сохранения файла:','C:\', directory) then
   begin
     paramFileName:= 'RoutePlan_TOCAN'+'_'+ReplaceStr(DateToStr(Now), '.', '')+'.xml';
     wsTocan:=  GetApiForTocan(False, (IntfMegaDBCommon.GetCountry = iccRussia));
     xsdt1:= TXSDateTime.Create();
     try
       xsdt1.AsDateTime := MegaDatePanel.Date;
       s := wsTocan.CreateAndGetXmlRoute(xsdt1);
       FS := TFileStream.Create(directory+'/'+paramFileName, fmCreate);
       try
         FS.WriteBuffer(s[1],  sizeof(TxMLChar)*length(s));
         ShowMessage('Выгрузка завершена')
       finally
         FreeAndNil(FS);
       end;
     finally
       xsdt1.Free;
     end;
  end;
end;

procedure TfmTTNPlan.actExportTTNPlanNaklsPosToExcelExecute(Sender: TObject);
var
  lFileName:string;
begin
  if(not SaveDialog1.Execute) then exit;
  lFileName:=SaveDialog1.FileName;

  InitTTNPlanNaklsPosDataSet(
        MegaDSTTNPlanPLANDATE.AsDateTime,
        MegaDSTTNPlanPLANNUMBER.AsInteger,
        MegaDSTTNPlanBASEID.AsInteger
        );
  try
    ExportDataSetToExcel(mdsTTNPlanNaklsPos, lFileName, true)
  finally
    mdsTTNPlanNaklsPos.Close;
  end;
end;

procedure TfmTTNPlan.actExportUpdateRouteExecute(Sender: TObject);
var wsTocan: IDocumentZayavkaNaTransport;
    xsdt1: TXSDateTime;
    s:string;
begin
  wsTocan:=  GetApiForTocan(False, (IntfMegaDBCommon.GetCountry = iccRussia));
  xsdt1:= TXSDateTime.Create();
  try
    xsdt1.AsDateTime := MegaDatePanel.Date;
    try
    s:= wsTocan.ExportByTocanRoute(xsdt1);
    ShowMessage(s);
    except
     on e: Exception do
      if e.Message <> '' then
        MessageDlg('Внимание!'+#13+#10+'<' + e.Message + '>''', mtWarning, [mbOK], 0);
   end
  finally
    xsdt1.Free;
  end;


end;

procedure TfmTTNPlan.InitTTNPlanNaklsPosDataSet(
    aPlanDate:TDateTime;
    aPlanNumber:integer;
    aBaseid:integer);
begin
  mdsTTNPlanNaklsPos.Close;
  mdsTTNPlanNaklsPos.DataBase:=mTrans.DefaultDatabase;
  mdsTTNPlanNaklsPos.Transaction:=mTrans;
  try
    mdsTTNPlanNaklsPos.ParamByName('PLANDATE').AsDateTime:=aPlanDate;
    mdsTTNPlanNaklsPos.ParamByName('PLANNUMBER').AsInteger:=aPlanNumber;
    mdsTTNPlanNaklsPos.ParamByName('BASEID').AsInteger:=aBaseid;
    mdsTTNPlanNaklsPos.Open;
    mdsTTNPlanNaklsPos.FetchAll;
  except
    raise;
  end;
end;


procedure TfmTTNPlan.actFixMarshrutExecute(Sender: TObject);
begin
  if fmTTNMarshrut = nil then
  begin
    fmTTNMarshrut:= TfmTTNMarshrut.Create(Self);
    fmTTNMarshrut.Show;
  end
  else begin
    fmTTNMarshrut.BringToFront;
  end;
end;

procedure TfmTTNPlan.actImportFromTocanExecute(Sender: TObject);
var wsTocan: IDocumentZayavkaNaTransport;
    xsdt1: TXSDateTime;
    s:string;
begin
  wsTocan:=  GetApiForTocan(False, (IntfMegaDBCommon.GetCountry = iccRussia));
  xsdt1:= TXSDateTime.Create();
  try
    xsdt1.AsDateTime := MegaDatePanel.Date;
    try
    s:= wsTocan.ImportTTNPlanFromTocan(xsdt1);
    ShowMessage(s);
    except
     on e: Exception do
      if e.Message <> '' then
        MessageDlg('Внимание!'+#13+#10+'<' + e.Message + '>''', mtWarning, [mbOK], 0);
   end
  finally
    xsdt1.Free;
  end;

end;

procedure TfmTTNPlan.actInsertNarSelNaklExecute(Sender: TObject);
var fm:TfmDocOrderSkladPos;
    i:integer;
begin
 //
  if not(DM.SharedQuery.Transaction.InTransaction) then DM.SharedQuery.Transaction.StartTransaction;
  if gridPlan.SelectedRows.count>0 then
  begin
    for I := 0 to gridPlan.SelectedRows.count - 1 do
    begin
      Dm.ChangeQuery.Close;
      DM.ChangeQuery.SQL.Text:= 'Insert into doc_order_sklad (OPERDATE,TYPE_ORDER,NAKL_RECID, NAKL_BASEID)'#13#10+
                                 ' values ( :OPERDATE, 1,:NAKL_RECID, :NAKL_BASEID)';

      gridPlan.DataSource.DataSet.GotoBookmark(pointer(gridPlan.SelectedRows.Items[i]));
      Dm.ChangeQuery.Close;
      DM.ChangeQuery.ParamByName('Operdate').asDateTime := MegaDSTTNPlanPLANDATE.Value;
      DM.ChangeQuery.ParamByName('NAKL_RECID').asInteger:=MegaDSTTNPlanPositionsNAKL_RECID.Value;
      DM.ChangeQuery.ParamByName('NAKL_BASEID').asInteger:=MegaDSTTNPlanPositionsNAKL_BASEID.Value;
      DM.ChangeQuery.ExecQuery;
//      DM.SharedQuery.Transaction.Commit;

      MegaDSTTNPlanPositions.Refresh;
    end;
  end;
  //DM.SharedQuery.Transaction.Commit;
  MegaDSTTNPlanPositions.Refresh;
  MegaDSTTNPlan.Refresh;

  fm:=TfmDocOrderSkladPos.Create(self);
  if gridPlan.SelectedRows.count>0 then
  begin
    fm.bList:=true;
  end;
  fm.DOCRECNO :=MegaDSTTNPlanPositionsORDER_RECID.value;
  fm.BASEID :=MegaDSTTNPlanPositionsORDER_BASEID.value;

  Fm.actRefresh.Execute;
 
  fm.ShowModal;
  MegaDSTTNPlanPositions.Refresh;
  MegaDSTTNPlan.Refresh;

end;

procedure TfmTTNPlan.ActInsertNarExecute(Sender: TObject);
var fm:TfmDocOrderSkladPos;
    i,FIsStickeringNakl:integer;
begin

  if (IntfMegaDBCommon.GetCountry = iccUkraine) then
  begin
     FIsStickeringNakl:=VarToInt(fbExecQuery(DM, ' SELECT count(*) FROM ttn_plan_positions tpp '+
     ' left join GET_LINKED_DOCS_NEW(1,tpp.nakl_recid,tpp.nakl_baseid,1,0) gl on (1=1) '+
     ' left join doc_nakl dn on (dn.recid = tpp.nakl_recid and dn.baseid = tpp.nakl_baseid) ' +
     ' where tpp.plandate=''%s'' and tpp.plannumber=%d and gl.LINKED_PARENT=1 and dn.doctype<>''РНк200'' and tpp.baseid = %d', [MegaDSTTNPlanPLANDATE.asString,MegaDSTTNPlanPLANNUMBER.asInteger ,MegaDSTTNPlanBASEID.asInteger]));
    if FIsStickeringNakl>0 then
    begin
       Application.MessageBox('Создавать наряд на маршрут в котором есть транзитные накладные запрещено!',
         'Внимание', MB_OK + MB_ICONSTOP);
       exit;
    end;
  end;
  if not(DM.SharedQuery.Transaction.InTransaction) then DM.SharedQuery.Transaction.StartTransaction;

  begin
      Dm.ChangeQuery.Close;
      DM.ChangeQuery.SQL.Text:='Insert into doc_order_sklad (operdate,TYPE_ORDER,PLAN_DATE,PLAN_NUMBER,PLAN_BASEID) values (:operdate,2,:PLAN_DATE,:PLAN_NUMBER,:PLAN_BASEID)';
      Dm.ChangeQuery.Close;
      DM.ChangeQuery.ParamByName('Operdate').asDateTime:=date;//MegaDSTTNPlanPLANDATE.Value;
      DM.ChangeQuery.ParamByName('PLAN_DATE').asDateTime:=MegaDSTTNPlanPLANDATE.Value;
      DM.ChangeQuery.ParamByName('PLAN_NUMBER').asInteger:=MegaDSTTNPlanPLANNUMBER.Value;
      DM.ChangeQuery.ParamByName('PLAN_BASEID').asInteger:=MegaDSTTNPlanBASEID.Value;
      DM.ChangeQuery.ExecQuery;
  end;
//  DM.SharedQuery.Transaction.Commit;
  MegaDSTTNPlan.Refresh;
  MegaDSTTNPlanPositions.Refresh;

  fm:=TfmDocOrderSkladPos.Create(self);

  fm.DOCRECNO := MegaDSTTNPlanORDER_RECID.value;
  fm.BASEID   := MegaDSTTNPlanORDER_BASEID.value;

  Fm.actRefresh.Execute;
  fm.ShowModal;
  //if fm.ShowModal=mrOk then   DM.SharedQuery.Transaction.CommitRetaining
  //else DM.SharedQuery.Transaction.Rollback;
end;

procedure TfmTTNPlan.ActInsertNarUpdate(Sender: TObject);
begin
   TAction(Sender).Visible:=MegaDSTTNPlanOrder_RecID.IsNull;
end;

procedure TfmTTNPlan.actLinkTTtoSotaExecute(Sender: TObject);
begin // Привязать торговую точку к логистическим сотам
  MegaCreateAndShowForm(TfmLogCells_AddTT, fmLogCells_AddTT);

  fmLogCells_AddTT.aOUTLET_RECID  := MegaDSTTNPlanPositionsOUTLET_RECID.Asinteger;
  fmLogCells_AddTT.aOUTLET_BASEID := MegaDSTTNPlanPositionsOUTLET_BASEID.Asinteger;
  fmLogCells_AddTT.UseOutletFilter:= true;

  fmLogCells_AddTT.RefreshTTList;
  fmLogCells_AddTT.cbWorkbases.EditValue := IntfMegaDBCommon.GetBaseID;
  fmLogCells_AddTT.cbWorkbasesClick(fmLogCells_AddTT.cbWorkbases);
  fmLogCells_AddTT.BitBtn2.Click;

  fmLogCells_AddTT.FIBDS_Cells.Locate('TT_RecID;TT_BaseID',
       VarArrayOf([fmLogCells_AddTT.aOUTLET_RECID,fmLogCells_AddTT.aOUTLET_BASEID]), []);
  if (not MegaDSTTNPlanPositionsKOD_CELL.IsNull) and (MegaDSTTNPlanPositionsKOD_CELL.AsString <> '') then
    fmLogCells_AddTT.DSLG_Cells.Locate('KOD_CELL',MegaDSTTNPlanPositionsKOD_CELL.AsString, []);
  fmLogCells_AddTT.Trade_OutletsDBTableView1.Controller.SelectAll;
end;

procedure TfmTTNPlan.actLinkTTtoSotaNaklListExecute(Sender: TObject);
begin // Привязать торговую точку к логистическим сотам
  MegaCreateAndShowForm(TfmLogCells_AddTT, fmLogCells_AddTT);

  fmLogCells_AddTT.aOUTLET_RECID  := fdsNaklListOUTLET_RECID.Asinteger;
  fmLogCells_AddTT.aOUTLET_BASEID := fdsNaklListOUTLET_BASEID.Asinteger;
  fmLogCells_AddTT.UseOutletFilter:= true;

  fmLogCells_AddTT.RefreshTTList;
  fmLogCells_AddTT.cbWorkbases.EditValue := IntfMegaDBCommon.GetBaseID;
  fmLogCells_AddTT.cbWorkbasesClick(fmLogCells_AddTT.cbWorkbases);
  fmLogCells_AddTT.BitBtn2.Click;

  fmLogCells_AddTT.FIBDS_Cells.Locate('TT_RecID;TT_BaseID',
     VarArrayOf([fmLogCells_AddTT.aOUTLET_RECID,fmLogCells_AddTT.aOUTLET_BASEID]), []);
  if (not fdsNaklListKOD_CELL.IsNull) and (fdsNaklListKOD_CELL.AsString <> '') then
    fmLogCells_AddTT.DSLG_Cells.Locate('KOD_CELL',fdsNaklListKOD_CELL.AsString, []);
  fmLogCells_AddTT.Trade_OutletsDBTableView1.Controller.SelectAll;
end;

procedure TfmTTNPlan.actLinkTTtoSotaNaklListUpdate(Sender: TObject);
begin // Привязать торговую точку к логистической соте
  TAction(sender).Enabled := true ;
      //or fdsNaklListKOD_CELL.IsNull or (fdsNaklListKOD_CELL.AsString='');
end;

procedure TfmTTNPlan.actLinkTTtoSotaUpdate(Sender: TObject);
begin // Привязать торговую точку к логистической соте
  TAction(sender).Enabled := true ;
      // or MegaDSTTNPlanPositionsKOD_CELL.IsNull or (MegaDSTTNPlanPositionsKOD_CELL.AsString='');
end;

procedure TfmTTNPlan.actMoveSchetsToNaklsExecute(Sender: TObject);
begin
  try
    TAAMakeForm.MoveSchetsToNaklsByTimeOut;
  except
    on E:Exception do
      MessageBox(Self.Handle, PChar('Ошибка переноса заказов в накладные! '+E.Message), 'Ошибка', MB_OK or MB_ICONERROR);
  end;
end;

procedure TfmTTNPlan.actNaclMAddExecute(Sender: TObject);
var
   i:integer;
begin
     //Распределение всех накладных по маршрутам
   if fdsNaklList.EOF and fdsNaklList.BOF then //Проверка на наличие накладных
   raise Exception.Create('Нет накладных для добавления');
   if MegaDSTTNPlan.EOF and MegaDSTTNPlan.BOF then //Проверка на наличие маршрутов
   raise Exception.Create('Нет маршрутов на текущую дату.');
   ////i:=fdsNaklList.RecordCount;
   ////MegaDSTTNPlan.First;
   ////while not MegaDSTTNPlan.Eof do //Цикл который проходится по всем маршрутам
   ////begin
        i:=fdsNaklList.RecordCount; //организованным на текущую дату
        fdsNaklList.DisableControls;
        fdsNaklList.First;
        while not fdsNaklList.Eof do  //Цикл который проходится по всем накладным
        begin                       //организованным на текущую дату
             MegaDSTTNPlan.Locate('PLANNUMBER', fdsNaklListN_TTN_MARSHRUT.Value, []);
             if fdsNaklListN_TTN_MARSHRUT.Value = MegaDSTTNPlanPLANNUMBER.Value then
             MegaDSTTNPlanPositions.Add(fdsNaklListRECID.asInteger, fdsNaklListBASEID.AsInteger);
             fdsNaklList.Next;
        end;
        fdsNaklList.EnableControls;
        actRefreshDataExecute(Sender);
end;

procedure TfmTTNPlan.actNaclRightExecute(Sender: TObject);
var
   nacl_id:integer;
begin  //Передвижение накладной вправо

    if MegaDSTTNPlan.FieldByName('TTN_RECID').AsInteger <> 0 then
    Raise Exception.Create('Действие неккоректно. Удалите ТТН.');


    if (MegaDSTTNPlan.State = dsInsert)
    or (MegaDSTTNPlan.State = dsEdit)
    then MegaDSTTNPlan.Post;

    fdsNaklList.DisableControls;
    nacl_id:=MegaDSTTNPlanPositionsNAKL_RECID.Value;//Присваивается значение перемещаемой ТТН
    actNaklRemoveExecute(Sender);  //Удалить ТТН из текущего маршрута
    if (MegaDSTTNPlan.Eof) then MegaDSTTNPlan.First
    else MegaDSTTNPlan.Next;           //Перейти на следующий маршрут
    actPlanRefresh.Execute;       //Обновить таблицу Позиций ТТН
    fdsNaklList.Locate('RECID',nacl_id,[]); //
    actPlanRefresh.Execute;
    actNaklAddExecute(Sender);    // Добавить ТТН в текущий маршрут
    fdsNaklList.EnableControls;
    pcTTNPlanChange(Sender);
end;

procedure TfmTTNPlan.actNaclLeftExecute(Sender: TObject);
var
   nacl_id:integer;
begin  //Передвижение накладной влево

    if MegaDSTTNPlan.FieldByName('TTN_RECID').AsInteger <> 0 then
    Raise Exception.Create('Действие неккоректно. Удалите ТТН.');

    if (MegaDSTTNPlan.State = dsInsert)
    or (MegaDSTTNPlan.State = dsEdit)
    then MegaDSTTNPlan.Post;

    fdsNaklList.DisableControls;
    nacl_id:=MegaDSTTNPlanPositionsNAKL_RECID.Value;//Присваивается значение перемещаемой ТТН
    actNaklRemoveExecute(Sender);  //Удалить ТТН из текущего маршрута
    if (MegaDSTTNPlan.Bof) then MegaDSTTNPlan.Last
    else MegaDSTTNPlan.Prior;          //Перейти на предыдущий маршрут
    actPlanRefresh.Execute;  //Обновить таблицу Позиций ТТН
    fdsNaklList.Locate('RECID',nacl_id,[]); //
    actPlanRefresh.Execute;
    actNaklAddExecute(Sender);    // Добавить ТТН в текущий маршрут
    fdsNaklList.EnableControls;
    pcTTNPlanChange(Sender); //Изменение просматриваемого маршрута(обновление открытой закладки)
end;

procedure TfmTTNPlan.edTTN_PositionChange(Sender: TObject);
var
   nacl_id:integer;
   base_id:integer;
begin //Перемещение ТТН на указанный маршрут
    if not actNaklRemove.Enabled then begin
      edTTN_Position.DisplayValue:='';
      abort;
    end;

    if MegaDSTTNPlan.FieldByName('TTN_RECID').AsInteger <> 0 then
    begin
         edTTN_Position.DisplayValue:='';
         Raise Exception.Create('Действие неккоректно. Удалите ТТН.');
    end;

    if (MegaDSTTNPlan.State = dsInsert)
    or (MegaDSTTNPlan.State = dsEdit)
    then MegaDSTTNPlan.Post;

    if edTTN_Position.DisplayValue='' then Exit;
    if edTTN_Position.DisplayValue=IntToStr(MegaDSTTNPlanPLANNUMBER.Value) then
    begin
    edTTN_Position.DisplayValue:='';
    Exit;
    end;

    fdsNaklList.DisableControls;
    nacl_id:=MegaDSTTNPlanPositionsNAKL_RECID.Value;//Присваивается значение перемещаемой ТТН
    base_id:=MegaDSTTNPlanPositionsNAKL_BASEID.Value;
    actNaklRemoveExecute(Sender);  //Удалить ТТН из текущего маршрута
    MegaDSTTNPlan.Locate('PLANNUMBER',edTTN_Position.Value,[]);
    MegaDSTTNPlanPositions.Add(nacl_id, base_id);
    //fdsNaklList.Locate('RECID',nacl_id,[]); //
    //actNaklAddExecute(Sender);    // Добавить ТТН в текущий маршрут
    fdsNaklList.EnableControls;
    RefreshNaklList;   //Обновление таблицы ТТН
    pcTTNPlanChange(Sender); //Изменение просматриваемого маршрута
    edTTN_Position.DisplayValue:='';
end;

procedure TfmTTNPlan.MegaSelTradeDelegateChange(Sender: TObject);
begin
    if MegaSelTradeDelegate.Value = '' then Exit;
      is_newcrm:=false;
      qPlan_Count.Close;
      qPlan_Count.SQL.Text:='SELECT sbp.PARAMVALUE '#13#10 +
                              'FROM SYS_BASE_PARAMS sbp'#13#10 +
                             'WHERE sbp.PARAMNAME=''Is_Newcreatm''';
      qPlan_Count.ExecQuery;
      if qPlan_Count.RecordCount<>0 then
      begin
           if qPlan_Count.FieldByName('PARAMVALUE').Value = 1 then
           begin
                cxButton3.Enabled:=true;//Добавить все (Enable=true)
//                actFixMarshrut.Enabled:=true;//Фиксированные маршруты
                dxBarButton2.Enabled:=false; //Удалить (Enable=false)
                is_newcrm:=true;
           end;
      end;
      {else
      begin
           cxButton3.Enabled:=true; //Добавить все (Enable=true)
           dxBarButton2.Enabled:=false; //Удалить (Enable=false)
           is_newcrm:=false;
      end;}
end;

procedure TfmTTNPlan.frReportGetValue(const ParName: String;
  var ParValue: Variant);
begin
 if ParName='Delivery_Time' then
  begin
   if report.FieldByName('DELIV_TIME').AsString ='' then
    if report.FieldByName('DESIREDDELIVERYTIME').AsString='' then ParValue:='Любое'
     else ParValue:= GetDecodeDeliveryTime(report.FieldByName('DESIREDDELIVERYTIME').AsString )
   else ParValue := GetDecodeDeliveryTime( report.FieldByName('DELIV_TIME').AsString );

  end;


end;

procedure TfmTTNPlan.frxRepSchetGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName='Operdate' then Value:=DateToStr(MegaDatePanel.Date);
  if VarName='BASEID' then Value:=StrToInt(MegaSelTradeDelegate.Value);
end;

procedure TfmTTNPlan.IsTTNCreated;
const
  sQueryText = 'select count(*) cnt from doc_trans_nakl dtn where dtn.recid = :RECID and dtn.baseid= :BASEID';
begin
  if MegaDSTTNPlan.FieldByName('TTN_RECID').AsInteger <> 0 then
    pnl_isTTNNAKL.Caption :=  TTN_Exists
  else
    pnl_isTTNNAKL.Caption := TTN_not_Exists;

  // если временный маршрут, то сообщаю об этом
  pn_MoveTempMarshr.Visible := (not MegaDSTTNPlanIS_TEMP_MARSHRUT.IsNull) and
                               (MegaDSTTNPlanIS_TEMP_MARSHRUT.AsInteger=1);
  if pn_MoveTempMarshr.Visible then
  begin
    pnl_isTTNNAKL.Caption := c_IS_TEMP_MARSH_Caption;
  end;
end;


procedure TfmTTNPlan.dbedCAR_DRIVERKeyPress(Sender: TObject;
  var Key: Char);
begin
// if not ((key in ['А'..'Я','а'..'я','.','-']) or ( Key <=' ')) then Key :=#0;
end;

procedure TfmTTNPlan.dxBarButton12Click(Sender: TObject);
var
foo:TPoint;
begin
 GetCursorPos(foo);
 pmRinkai.Popup(foo.X,foo.Y);
end;

procedure TfmTTNPlan.dxBarButton13Click(Sender: TObject);
begin
  ExportJointLogistic(0);
end;

procedure TfmTTNPlan.dxBarButton8Click(Sender: TObject);
var
foo:TPoint;
begin
 GetCursorPos(foo);
 if IsRussia then ppAntor.Popup(foo.X,foo.Y);
 if IsUkraine then ppMapXPlus.Popup(foo.X,foo.Y);

end;

function TfmTTNPlan.CanCreateTTN : boolean;
var
  lMinWeightLoad, FTotalWeight : double;
  lMinPersentLoad : integer;
  lMinClientCount, lClientCount : integer;
  FTotalWeightPersent : double;
  lNaklRecid, lNaklBaseID : integer;
begin
  Result := false;
  //  Изменение от 19.06.2004  Бехтеренко Ю.
  // Запрет на создание ТТН, если не выполнены оба ограничения.
  lNaklRecid := MegaDSTTNPlanPositionsNAKL_RECID.AsInteger;
  lNaklBaseID:= MegaDSTTNPlanPositionsNAKL_BASEID.AsInteger;

  FTotalWeight :=0;
  lClientCount :=0;

  MegaDSTTNPlanPositions.First;
  while not MegaDSTTNPlanPositions.Eof do
  begin
    FTotalWeight := FTotalWeight + MegaDSTTNPlanPositionsWEIGHT_TONN.AsFloat;
    MegaDSTTNPlanPositions.Next;
  end;

  if MegaDSTTNPlanDOCTYPE.AsString = sttndtCity then
  begin
    // по городу
    lMinWeightLoad := StrToIntDef(IntfMegaDBCommon.GetParam(sMinTTNCityLoadingWeight, '3'), 3);
    lMinPersentLoad := StrToIntDef(IntfMegaDBCommon.GetParam(sMinTTNLoadingPercentCity, '80'), 80);
    lMinClientCount := StrToIntDef(IntfMegaDBCommon.GetParam(sMinTTNClientCountCity, '25'), 25);
    FTotalWeightPersent := round((FTotalWeight / MegaDSTTNPlan.TotalTonnage) * 100);
    if FTotalWeightPersent >= lMinPersentLoad then
      Result := true
    //if FTotalWeight >= lMinWeightLoad then begin Result := true; End
    else
      if ((MegaDSTTNPlanPositions.OutletCount >= lMinClientCount) and  (FTotalWeightPersent >= 50)) then
        Result := true
      else
        Result := false
  end
  else
  begin
    // межгород
    lMinPersentLoad := StrToIntDef(IntfMegaDBCommon.GetParam(sMinTTNLoadingPercent, '80'), 80);
    lMinClientCount := StrToIntDef(IntfMegaDBCommon.GetParam(sMinTTNClientCount, '20'), 20);

    FTotalWeightPersent := round((FTotalWeight / MegaDSTTNPlan.TotalTonnage) * 100);
    if FTotalWeightPersent >= lMinPersentLoad then
      Result := true
    else
      if ((FTotalWeightPersent >= 50 ) and (MegaDSTTNPlanPositions.OutletCount >= lMinClientCount)) then
        Result := true
      else
        Result := false;
  end;

  MegaDSTTNPlanPositions.Locate('NAKL_RECID;NAKL_BASEID', VarArrayOf([lNaklRecid, lNaklBaseID]), []);

  if StrToIntDef(IntfMegaDBCommon.GetParam('NEWTTNPARAMS', '0'), 0)=1 then Result:=true;

end;

function TfmTTNPlan.CanCreatSortLot(aShowMessage: boolean): boolean;
var
  qr : TMegaQuery;
  s : string;
begin
  result := true;

  if IntfMegaDBCommon.GetCountry=iccRussia then
  begin

    qr := TMegaQuery.create(self);
    qr.Database    := MegaDSSortingLot.Database;
    qr.Transaction := MegaDSSortingLot.Transaction;
    qr.SQL.Text :=
      ' SELECT                                                                                                    '#13#10+
      '   sum(dn.summa1) SUMMA,                                                                                   '#13#10+
      '   sum(dn.KOLICH_) KOLICH,                                                                                 '#13#10+
      '   sdk.SHORTNAME_DK,                                                                                       '#13#10+
      '   snp.NAS_P_NAME||'' ''||sda.address TT                                                                   '#13#10+
      '                                                                                                           '#13#10+
      ' from ttn_plan_positions slp                                                                               '#13#10+
      '   left join DOC_NAKL dn on (dn.recid = slp.nakl_recid and dn.baseid = slp.nakl_baseid)                    '#13#10+
      '   left join delivery_location dl on (dl.formtype = 1 and dl.docrecno = dn.recid and dl.baseid = dn.baseid)'#13#10+
      '   left join sprav_trade_outlet sto on (sto.recid = dl.outlet_recid and sto.baseid = dl.outlet_baseid )    '#13#10+
      '   left join SPRAV_DK sdk on sdk.KOD_DK = sto.KOD_DK                                                       '#13#10+
      '   left join sprav_dk_address sda on (sda.recid = sto.addr_recid and sda.baseid = sto.addr_baseid )        '#13#10+
      '   left join sprav_nas_p snp on (snp.nas_p_id = sda.nas_p_id and snp.country_id = sda.country_id)          '#13#10+
      '   left join check_doc_min_sum(dn.dk_to,dn.operdate, dl.outlet_recid,dl.outlet_baseid,dn.group_oper, dn.kod_oper, dn.recid,dn.baseid, 1) cd  on 1=1 '#13#10+
      ' where slp.plandate = :LOTDATE                                                                              '#13#10+
      '   and slp.plannumber = :LOTNUMBER                                                                          '#13#10+
      '   and slp.BASEID = :BASEID                                                                                '#13#10+
      '   and cd.RESULT = 1                                                                                                        '#13#10+
      ' group by sto.RECID,sto.BASEID,sda.address, snp.NAS_P_NAME, sdk.SHORTNAME_DK                               '#13#10+
      '                      '#13#10;
    qr.ParamByName('LOTDATE').AsDateTime  := MegaDSTTNPlanPLANDATE.AsDateTime;
    qr.ParamByName('LOTNUMBER').AsInteger := MegaDSTTNPlanPLANNUMBER.asInteger;
    qr.ParamByName('BASEID').AsInteger    := MegaDSTTNPlanBASEID.AsInteger;

    qr.ExecQuery;
    s := '';
    while not qr.Eof do
    begin
      s := s+qr.FN('SHORTNAME_DK').ASString+
           ' ТТ: '+ qr.FN('TT').ASString+
           ' кол-во: '+qr.FN('KOLICH').ASString+
           ' сумма: '+qr.FN('SUMMA').ASString+
           #13#10;
      qr.Next;
    end;

    result := S = '';
    if aShowMessage and (not result) then
      MessageDlg('Запрещено отгружать накладные на одну торговую точку c'#13#10+
                 'общим количеством менее '+IntfMegaDBCommon.GetParam('NAKL_MIN_BOTTLE_CNT','10')+
                 ' и общей суммой менее '+IntfMegaDBCommon.GetParam('NAKL_MIN_NAKL_SUM','200')+'.'#13#10+
                 S+
                 'Обращайтесь в отдел продаж!', mtInformation, [mbok], 0 );
    qr.Close;
    qr.Destroy;
  end;
end;

procedure TfmTTNPlan.actTTNPrintExecute(Sender: TObject);
var
  lRecid, lBaseid : integer;
begin
  try
    lRecid:= MegaDSTTNPlanPositionsNAKL_RECID.AsInteger;
    lBaseid:= MegaDSTTNPlanPositionsNAKL_BASEID.AsInteger;

    //   frTTNRep.DesignReport;
   if (IntfMegaDBCommon.GetCountry = iccUkraine) then
   begin
     MessageBox(Application.Handle,'Используйте функцию печати маршрутного листа в ТТН.','Ошибка!',MB_OK+MB_ICONERROR+MB_APPLMODAL);
   end
   else
    frTTNRep.ShowReport;
    
    MegaDSTTNPlanPositions.Locate('NAKL_RECID;NAKL_BASEID', VarArrayOf([lRecid, lBaseid]), []);
  except
    MessageBox(Application.Handle,'Ошибка формирования отчета "Накладые в маршруте".','Ошибка!',MB_OK+MB_ICONERROR+MB_APPLMODAL);
  end;
end;

procedure TfmTTNPlan.actTTNPrintUpdate(Sender: TObject);
begin
  TAction(sender).Enabled := MegaDSTTNPlanIS_TEMP_MARSHRUT.IsNull or
                            (MegaDSTTNPlanIS_TEMP_MARSHRUT.AsInteger<>1)
end;

procedure TfmTTNPlan.btnMoveTempMarshrClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  try
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  qrTempMarsh.Close;
  qrTempMarsh.SQL.Text:=
  'SELECT tp.PLANNUMBER,tp.TTN_RECID '#13#10+
  '  FROM TTN_PLAN tp                '#13#10+
  'WHERE tp.PLANDATE   = :PLANDATE   '#13#10+
  '  and tp.PLANNUMBER = :PLANNUMBER '#13#10+
  '  and tp.BASEID     = :BASEID     ';
  qrTempMarsh.ParamByName('BASEID').AsString     := MegaSelTradeDelegate.Value;
  qrTempMarsh.ParamByName('PLANDATE').AsDateTime := dtMoveTempMarshDate.Date;
  qrTempMarsh.ParamByName('PLANNUMBER').AsInteger:= edMoveTempMarshNumber.Value;
  qrTempMarsh.ExecQuery;

  if qrTempMarsh.FieldByName('PLANNUMBER').IsNull then
  begin
    MessageDlg(format('Маршрут №%d за %s не создан.',
       [qrTempMarsh.ParamByName('PLANNUMBER').AsInteger,
        qrTempMarsh.ParamByName('PLANDATE').AsString]),
       mtError, [mbYes,mbNo], 0);
    qrTempMarsh.Close;
    Exit;
  end;

  if (not qrTempMarsh.FieldByName('TTN_RECID').IsNull) and
     (qrTempMarsh.FieldByName('TTN_RECID').AsInteger <>0) then
  begin
    MessageDlg(format('По маршруту №%d за %s уже создана ТТН',
       [qrTempMarsh.ParamByName('PLANNUMBER').AsInteger,
        qrTempMarsh.ParamByName('PLANDATE').AsString]),
       mtError, [mbYes,mbNo], 0);
    qrTempMarsh.Close;
    Exit;
  end;

  qrTempMarshUpd.Transaction.Commit;
  try

  // убираю галочки с накладных
  qrTempMarshUpd.Close;
  qrTempMarshUpd.SQL.Text:=
  'UPDATE DOC_NAKL dn SET                 '#13#10+
  '  dn.OPERDATE = :NEW_PLANDATE,         '#13#10+
  '  dn.DOCDATE = :NEW_PLANDATE,          '#13#10+
  '  dn.STATE = 0                         '#13#10+
  ' where EXISTS (SELECT *                '#13#10+
  ' FROM TTN_PLAN_POSITIONS tpp           '#13#10+
  ' WHERE tpp.PLANDATE   = :OLD_PLANDATE  '#13#10+
  '   and tpp.PLANNUMBER = :OLD_PLANNUMBER'#13#10+
  '   and tpp.BASEID     = :OLD_BASEID    '#13#10+
  '   and tpp.NAKL_RECID = dn.RECID       '#13#10+
  '   and tpp.NAKL_BASEID= dn.BASEID )    ';
  qrTempMarshUpd.ParamByName('OLD_BASEID').AsInteger    := MegaDSTTNPlanBASEID.AsInteger;
  qrTempMarshUpd.ParamByName('OLD_PLANDATE').AsDateTime := MegaDSTTNPlanPLANDATE.AsDateTime;
  qrTempMarshUpd.ParamByName('OLD_PLANNUMBER').AsInteger:= MegaDSTTNPlanPLANNUMBER.AsInteger;
  qrTempMarshUpd.ParamByName('NEW_PLANDATE').AsDateTime := dtMoveTempMarshDate.Date;
  qrTempMarshUpd.ExecQuery;

  qrTempMarshUpd.Transaction.Commit;
  
  // проставляю галочки
  qrTempMarsh.Close;
  qrTempMarsh.SQL.Text:=
  'SELECT distinct dn.DK_TO                           '#13#10+
  'FROM TTN_PLAN_POSITIONS tpp                        '#13#10+
  'left join DOC_NAKL dn on tpp.NAKL_RECID = dn.RECID '#13#10+
  '                     and tpp.NAKL_BASEID= dn.BASEID'#13#10+
  'WHERE tpp.PLANDATE   = :OLD_PLANDATE               '#13#10+
  '  and tpp.PLANNUMBER = :OLD_PLANNUMBER             '#13#10+
  '  and tpp.BASEID     = :OLD_BASEID                 '#13#10+
  '  and not dn.DK_TO is NULL                         '#13#10+
  '  and ((SELECT IS_SHOW FROM IS_NAKL_SHOW_IN_LIST(dn.recid, dn.baseid)) = 1) ';
  qrTempMarsh.ParamByName('OLD_BASEID').AsInteger    := MegaDSTTNPlanBASEID.AsInteger;
  qrTempMarsh.ParamByName('OLD_PLANDATE').AsDateTime := MegaDSTTNPlanPLANDATE.AsDateTime;
  qrTempMarsh.ParamByName('OLD_PLANNUMBER').AsInteger:= MegaDSTTNPlanPLANNUMBER.Value;
  qrTempMarsh.ExecQuery;
  while not qrTempMarsh.Eof do
  begin
    if DolgAnalizForm <> nil then
      DolgAnalizForm.Show
     else
      Application.CreateForm(TDolgAnalizForm, DolgAnalizForm);

    DolgAnalizForm.MegaSelDK.Kod_dk := qrTempMarsh.FieldByName('DK_TO').AsFloat;
    DolgAnalizForm.DateEdit1.Date   := dtMoveTempMarshDate.Date;
    DolgAnalizForm.DateEdit2.Date   := dtMoveTempMarshDate.Date;
    DolgAnalizForm.cbTDocs.ItemIndex:= 1;
    DolgAnalizForm.MegaSelCFO.Value := MegaDSTTNPlanBASEID.AsString;
    DolgAnalizForm.NoAsk := true;
    DolgAnalizForm.aAnaliz.Execute;
    DolgAnalizForm.AutoBugNakl.Execute;

    qrTempMarsh.Next;
  end;
  DolgAnalizForm.Close;

  // переношу в новый маршрут //
  qrTempMarshUpd.Close;
  qrTempMarshUpd.SQL.Text:=
  ' UPDATE TTN_PLAN_POSITIONS tpp SET               '#13#10+
  '   tpp.PLANDATE   = :NEW_PLANDATE,               '#13#10+
  '   tpp.PLANNUMBER = :NEW_PLANNUMBER              '#13#10+
  ' where tpp.PLANDATE   = :OLD_PLANDATE            '#13#10+
  '   and tpp.PLANNUMBER = :OLD_PLANNUMBER          '#13#10+
  '   and tpp.BASEID     = :OLD_BASEID              '#13#10+
  '   and coalesce((SELECT dn.STATE FROM doc_nakl dn'#13#10+
  '       WHERE tpp.NAKL_RECID = dn.RECID           '#13#10+
  '         and tpp.NAKL_BASEID= dn.BASEID), 0) <>0 ';
  qrTempMarshUpd.ParamByName('OLD_BASEID').AsInteger    := MegaDSTTNPlanBASEID.AsInteger;
  qrTempMarshUpd.ParamByName('OLD_PLANDATE').AsDateTime := MegaDSTTNPlanPLANDATE.AsDateTime;
  qrTempMarshUpd.ParamByName('OLD_PLANNUMBER').AsInteger:= MegaDSTTNPlanPLANNUMBER.AsInteger;
  qrTempMarshUpd.ParamByName('NEW_PLANDATE').AsDateTime := dtMoveTempMarshDate.Date;
  qrTempMarshUpd.ParamByName('NEW_PLANNUMBER').AsInteger:= edMoveTempMarshNumber.Value;
  qrTempMarshUpd.ExecQuery;

  // если все накладные перенесены, то удаляю маршрут //
  qrTempMarshUpd.Close;
  qrTempMarshUpd.SQL.Text:=
  ' DELETE FROM TTN_PLAN tp                              '#13#10+
  ' where tp.PLANDATE   = :OLD_PLANDATE                  '#13#10+
  '   and tp.PLANNUMBER = :OLD_PLANNUMBER                '#13#10+
  '   and tp.BASEID     = :OLD_BASEID                    '#13#10+
  '   and NOT EXISTS(SELECT * FROM TTN_PLAN_POSITIONS tpp'#13#10+
  '       where tpp.PLANDATE   = :OLD_PLANDATE           '#13#10+
  '         and tpp.PLANNUMBER = :OLD_PLANNUMBER         '#13#10+
  '         and tpp.BASEID     = :OLD_BASEID)            ';
  qrTempMarshUpd.ParamByName('OLD_BASEID').AsInteger    := MegaDSTTNPlanBASEID.AsInteger;
  qrTempMarshUpd.ParamByName('OLD_PLANDATE').AsDateTime := MegaDSTTNPlanPLANDATE.AsDateTime;
  qrTempMarshUpd.ParamByName('OLD_PLANNUMBER').AsInteger:= MegaDSTTNPlanPLANNUMBER.AsInteger;
  qrTempMarshUpd.ExecQuery;

  qrTempMarshUpd.Transaction.Commit;
  except
    on e:Exception do
    begin
      MessageDlg('В процессе переноса накладных в новый маршрут возникли следующие ошибки:'#13#10+e.Message,
                 mtInformation, [mbOk],0);
      qrTempMarshUpd.Transaction.Rollback;
    end;
  end;

  MegaDSTTNPlanPositions.CloseOpen(true);
  actRefreshDataExecute(actRefreshData);

  finally
  qrTempMarshUpd.Close;
  qrTempMarsh.Close;
  Screen.Cursor := OldCursor;
  end;
end;

procedure TfmTTNPlan.actDelNarExecute(Sender: TObject);
begin
  if not(DM.SharedQuery.Transaction.InTransaction) then DM.SharedQuery.Transaction.StartTransaction;

  DM.ChangeQuery.Close;
  DM.ChangeQuery.SQL.Text:='delete from doc_order_sklad where recid=:recid and baseid=:baseid';
  DM.ChangeQuery.ParamByName('RECID').asInteger:=MegaDSTTNPlanOrder_recid.Value;
  DM.ChangeQuery.ParamByName('BASEID').asInteger:=MegaDSTTNPlanOrder_baseid.Value;
  DM.ChangeQuery.ExecQuery;

  //DM.SharedQuery.Transaction.Commit;

  MegaDSTTNPlan.Refresh;  
end;

procedure TfmTTNPlan.actDelNarUpdate(Sender: TObject);
begin
   TAction(Sender).Visible:=not(MegaDSTTNPlanOrder_RecID.IsNull);
end;

procedure TfmTTNPlan.actDop_MarshrutsExecuteExecute(Sender: TObject);
var
is_dop:integer;
DopHor:char;
begin
  tran_Dop.Active:=True;
  if edDop.Text <>'' then
  begin
    try
    is_dop:=StrToInt(edDop.Text);
    except
    on e:Exception do
      begin
        ShowMessage(e.Message+' Некорректно указано количество дополнительных маршрутов');
        exit;
      end;
    end;
    if cbDopHor.Checked then
      DopHor:='1'
     else
      DopHor:='0';
    qrDop.Close;
    qrDop.SQL.Text:='INSERT INTO SYS_PROTOKOL '#13#10 +
                   '(TABLE_NAME,CHANGE_TYPE,NEW_ID,OLD_ID,EXP)'#13#10 +
                   ' VALUES (''DOP_MARSHRUT'',''I'','#13#10 +
                    QuotedStr(DateToStr(MegaDatePanel.Date)+'|' +
                    IntToStr(MegaSelTradeDelegate.CFOBaseID) + ':' +
                    MegaSelTradeDelegate.Value + '|' +
                    edDop.Text + '|' + DopHor)+','+'0,0)';
    qrDop.ExecQuery;
    edDop.Text:='';
    tran_Dop.Commit;
  end;
end;

procedure TfmTTNPlan.ActEditNarExecute(Sender: TObject);
var fm:TfmDocOrderSkladPos;
begin
  fm:=TfmDocOrderSkladPos.Create(self);
  begin
    fm.DOCRECNO :=MegaDSTTNPlanORDER_RECID.value;
    fm.BASEID :=MegaDSTTNPlanORDER_BASEID.value;
  end;
  Fm.actRefresh.Execute;
  fm.ShowModal;
end;

procedure TfmTTNPlan.ActEditNarUpdate(Sender: TObject);
begin
   TAction(Sender).Visible:=not(MegaDSTTNPlanOrder_RecID.IsNull);
end;

procedure TfmTTNPlan.gridNaklDBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//
  if (AViewInfo.GridRecord.Values[gridNaklDBBandedTableView1OPER_STATUS.Index]=202) then
     ACanvas.Canvas.Brush.Color := clSkyBlue;
  if (AViewInfo.GridRecord.Values[gridNaklDBBandedTableView1PARENT_RECID.Index]<>null) then
     ACanvas.Canvas.Brush.Color := clYellow;
  if (AViewInfo.GridRecord.Values[gridNaklDBBandedTableView1FLAG_SAN.Index] > 0) then
     ACanvas.Canvas.Brush.Color := clActiveCaption;
end;

procedure TfmTTNPlan.gridNaklDBBandedTableView1DblClick(Sender: TObject);
begin
  if actNaklAdd.Enabled then actNaklAdd.Execute;
end;

procedure TfmTTNPlan.gridPlanGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if not (MegaDSTTNPlanPositionsBLANK_ID.IsNull) then
    AFont.Color:=clGreen;
  if (MegaDSTTNPlanPositionsOPER_STATUS.asInteger=202) then
   Background := clSkyBlue;

end;

procedure TfmTTNPlan.gridPlanColumns33GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
   if MegaDSTTNPlanPositionsinSortLot.Value>0
    then Params.CheckboxState:=cbChecked
    else Params.CheckboxState:=cbUnchecked;
end;

procedure TfmTTNPlan.actPlanPosInfoExecute(Sender: TObject);
begin  //
    DM.SharedQuery.Close;
    try
      DM.SharedQuery.SQL.Text:=
        'select sl.* from sort_lot sl '+
        'inner join sort_lot_positions slp on slp.lotdate=sl.lotdate and slp.lotnumber=sl.lotnumber and slp.baseid=sl.baseid '+
        'where slp.nakl_recid=:nakl_recid and slp.nakl_baseid=:nakl_baseid';
      DM.SharedQuery.ParamByName('nakl_recid').asInteger :=MegaDSTTNPlanPositionsNAKL_RECID.Value;
      DM.SharedQuery.ParamByName('nakl_baseid').asInteger:=MegaDSTTNPlanPositionsNAKL_BASEID.Value;
      DM.SharedQuery.ExecQuery;
      if DM.SharedQuery.RecordCount>0 then begin
        MessageDlg('Накладная входит в сортировочную партию'+#13#10+
                   DM.SharedQuery.FieldByName('LOTNUMBER').asString+' от '+DM.SharedQuery.FieldByName('LOTDATE').asString
                   ,mtInformation,[mbOk],0);
      end;
    finally
      DM.SharedQuery.Close;
    end;
end;

procedure TfmTTNPlan.actNaklRemoveUpdate(Sender: TObject);
begin
    tAction(Sender).Enabled:={((IntfMegaDBCommon.GetBaseID in [])or
                             (MegaDSTTNPlanPositionsinSortLot.Value=0)or
                             (IntfMegaAccessManager.GetUserAccess in [iuaOfOperator,iuaSystem]))
                             and}
                             (IntfMegaDBCommon.GetParam('ANTOR_ONLY', '0') = '0') and
                             ((MegaDSTTNPlanPositionsinSortLot.Value=0) or (IntfMegaDBCommon.GetCountry = iccUkraine)) ;
end;

function TfmTTNPlan.AddNaklToEDIOrdRspFormingQueue(const NaklRecID, NaklBaseId: Integer; const NaklGUID: string; const NaklSumma: double): Integer;
var
  ws: IDocumentEDIOrdRsp;
begin
  ws:=  GetEDIOrdRsp(False, (IntfMegaDBCommon.GetCountry = iccRussia));
  OutputDebugString(PAnsiChar('Вызов AddInvoiceToOrdRsPFormingQueue. NaklRecid = '+IntToStr(NaklRecID)+
        ', NaklBaseID = '+IntToStr(NaklBaseId)+', NaklGUID = '+NaklGUID));
  Result := ws.AddInvoiceToOrdRspFormingQueue(NaklRecID, NaklBaseId, NaklGuid, NaklSumma);
end;

function TfmTTNPlan.AddNaklToEDIDesAdvFormingQueue(const NaklRecID, NaklBaseId: Integer; const NaklGUID: string; const NaklSumma: double): Integer;
var
  ws: IDocumentEDIDesAdv;
begin
  //if (IntfMegaDBCommon.GetCountry = iccUkraine) then
//  begin
//    try
      ws:=  GetEDIDesAdv(False, (IntfMegaDBCommon.GetCountry = iccRussia));
      OutputDebugString(PAnsiChar('Вызов AddInvoiceToDesAdvFormingQueue. NaklRecid = '+IntToStr(NaklRecID)+
        ', NaklBaseID = '+IntToStr(NaklBaseId)+', NaklGUID = '+NaklGUID));
      Result := ws.AddInvoiceToDesAdvFormingQueue(NaklRecID, NaklBaseId, NaklGuid, NaklSumma);
//    except
//      on E: Exception do
//        DM.WriteToInfo('Ошибка при вставке накладной в очередь формирования уведомлений об отгрузке EDI: '+E.Message);
//    end;
//  end;
end;

function TfmTTNPlan.AddNaklToEDIInvoiceFormingQueue(const NaklRecID, NaklBaseId: Integer; const NaklGUID: string; const NaklSumma: double): Integer;
var
  ws: IDocumentEDIInvoice;
begin
  //if (IntfMegaDBCommon.GetCountry = iccUkraine) then
//  begin
//    try
      ws:=  GetEDIInvoice(False, (IntfMegaDBCommon.GetCountry = iccRussia));
      OutputDebugString(PAnsiChar('Вызов CreateByInvoice. NaklRecid = '+IntToStr(NaklRecID)+
        ', NaklBaseID = '+IntToStr(NaklBaseId)+', NaklGUID = '+NaklGUID));
      Result := ws.CreateByInvoice(NaklRecID, NaklBaseId, NaklGuid);
//    except
//      on E: Exception do
//        DM.WriteToInfo('Ошибка при вставке накладной в очередь формирования уведомлений об отгрузке EDI: '+E.Message);
//    end;
//  end;
end;

procedure TfmTTNPlan.acBPExecute(Sender: TObject);
var
  Res: objectResponse;
  tmp:TfStartBPComment;
  sms,scr:string;
begin

  if Ask('Запустить бизнес-процесс согласования нерентабельного маршрута?') <> idYes then Exit;
  { [gsa] Призапуске БП всплывает окно для комментария, по БП. }

 // if dbtxtTonnag.Caption='' then begin ShowMessage('Внимание: не выбран тоннаж, см.заголовок.'); exit; end;


  tmp:= TfStartBPComment.Create(self);
  tmp.ShowModal;
  sms:=tmp.redtCommentar.Lines.Text;
  if tmp.ModalResult = 2 then
     begin
        if sms = '' then begin
            ShowMessage('Внимание: Комментарий обезательный.');
            tmp.Free;
            Exit;
        end;
        tmp.Free;
     end;
  //-----------
        {
          [gsa] 04-06-19
          если нужно хранить в БДв плане, информацию по тоннажу который выбрали в заголовке
          при запуске БП, что бы после нельзя было его изменить в ТТН, только под ролью
          админа по ТТН      FloatToStrEx
        }
                                  
     if dbtxtTonnag.Caption<>'' then   begin

        scr:='update ttn_plan set tonnag = '+ReplaceStr((dbtxtTonnag.Caption),',','.')+', BPSTART = 1 '+
            ' where plandate='''+DateToStrEx(MegaDatePanel.Date)+''' and plannumber='+ IntToStr(MegaDSTTNPlanPLANNumber.AsInteger)  +''+
            ' and baseid='+IntToStr(IntfMegaDBCommon.GetBaseID)+' ';
         mQuery1.Close;
         mQuery1.SQL.Text:=scr;
         mQuery1.ExecQuery;
         mQuery1.Close;
     end;
  //------------------------  GSA ДЛя теста 07-06-2019 -------------------------
  with GetICommonModulesBusinessProcesses(true) do
  try
    Res := StartBusinessProcessDistributionCoordinationUnprofitableRoutes(
        IntfMegaAccessManager.GetUserKodDK,
        ('Запуск из Money. С тоннажом '+(dbtxtTonnag.Caption)+'. Комментарий автора: '+sms+' '),
        MegaDSTTNPlanPLANNumber.AsInteger,
        MegaDSTTNPlanBASEID.AsInteger,
        //IntfMegaDBCommon.GetBaseID,
        DateTimeToXSDateTime(MegaDSTTNPlanPLANDATE.AsDateTime),
        );

     case Res.ResponseType of
       CommonModulesBusinessProcesses_V3.Error: liUtils.Error(Res.ResponseMessage);
       CommonModulesBusinessProcesses_V3.Alert: liUtils.Warning(Res.ResponseMessage);
       CommonModulesBusinessProcesses_V3.Successful: liUtils.Info(Res.ResponseMessage);
     end;
  except
    on E:Exception do
    begin
      liUtils.Error('При создании процесса возникли ошибки:'#13#10+e.Message);
    end;
  end;  

end;

procedure TfmTTNPlan.acCarExecute(Sender: TObject);
begin
  Transaction.Commit;
  Transaction.Active:= True;
  TfmTTNPlanCars.Create(self, MegaDatePanel.Date, StrToInt(MegaSelTradeDelegate.Value)).Show;
  RefreshNaklList;
end;

procedure TfmTTNPlan.actSendJointLogisticAllExecute(Sender: TObject);
begin
 SendJointLogistic(0);
end;

function TfmTTNPlan.fCreateSortLotCur(fShowMessage:boolean=true):Boolean;
var
  UnProvStr,MinSumma : string;
  MessageStr : string;
  i:integer;
  cntEDIOrdRsp, cntEDIInvoice, cntEDIDesAdv : integer;
  fNeedCreateEDIDoc, fNeedCreateSecondParty: boolean;
begin
  result:=false;


//  if MegaDSTTNPlanPositions.Lookup('')
  UnProvStr := GetUnProvTTNPlanNakl(TMegaTransaction(MegaDSTTNPlan.Transaction),
               MegaDSTTNPlanPLANDATE.AsDateTime,
               MegaDSTTNPlanBASEID.AsInteger,
               MegaDSTTNPlanPLANNUMBER.asInteger);
  if UnProvStr <>'' then
  begin
    if fShowMessage then begin
      MessageStr := 'Не проведенны накладные, №'+#13#10 + UnProvStr+ #13#10+
                    'Операция проведения партии невозможна!';
      MessageBox(Application.Handle,PChar(MessageStr),'Проведение партии',MB_OK+MB_ICONERROR+MB_APPLMODAL);
    end;
    Exit;
  end;

  MinSumma := CheckMinSum(TMegaTransaction(MegaDSTTNPlan.Transaction),
               MegaDSTTNPlanPLANDATE.AsDateTime,
               MegaDSTTNPlanBASEID.AsInteger,
               MegaDSTTNPlanPLANNUMBER.asInteger);
  if MinSumma <>'' then
  begin
    if fShowMessage then begin

      MessageStr := 'Накладные, №'+#13#10 + MinSumma+ #13#10+
                    'не удовлетовряют условию минимального заказа.'+ #13#10+'Операция проведения партии невозможна!';
      MessageBox(Application.Handle,PChar(MessageStr),'Проведение партии',MB_OK+MB_ICONERROR+MB_APPLMODAL);
    end;
    Exit;
  end;
  if fShowMessage then
  if Application.MessageBox('После создания сортировочной партии изменения будут не доступны!'+#13#10+
                            'Продолжить?','Внимание',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)<>ID_YES then exit;

  //if not CanCreatSortLot(true) then
  // exit;
  i:=0;
  MegaDSTTNPlanPositions.DisableControls;
  try
   fNeedCreateEDIDoc:= IntfMegaDBCommon.GetParam('MAKE_PARTY_NOT_EDI','0') <> '1';
//  fNeedCreateSecondParty:= IntfMegaDBCommon.GetParam('MAKE_PARTY_FED_MARKA','0') = '1';
  MegaDSTTNPlanPositions.First;
   try
    MegaDSSortingLot.Open(MegaDSTTNPlanPLANDATE.Value,IntfMegaDBCommon.GetBaseID,StrToInt(MegaSelTradeDelegate.Value));
//    MegaDSTTNPlanBASEID.Value
 try
      MegaDSSortingLot.SetMaxMetod(MegaDSTTNPlanPLANNUMBER.Value*10);
      MegaDSSortingLot.Add;
      MegaDSSortingLotPositions.Open;
      while not MegaDSTTNPlanPositions.Eof do
      begin
        if ((MegaDSTTNPlanPositionsinSortLot.Value=0))// and ((MegaDSTTNPlanPositionsIS_FED_MARKA.Value=0) or (fNeedCreateSecondParty=false)))
        then
        begin
          MegaDSSortingLotPositions.Add(MegaDSTTNPlanPositionsNAKL_RECID.Value,MegaDSTTNPlanPositionsNAKL_BASEID.Value);
          inc(i);
        end;
        MegaDSTTNPlanPositions.Next;
      end;
      if (fNeedCreateEDIDoc) then
       begin
          try
            cntEDIOrdRsp  := 0;
            cntEDIInvoice := 0;
            cntEDIDesAdv  := 0;
            MegaDSSortingLotPositions.Close;
            MegaDSSortingLotPositions.Open;
            MegaDSSortingLotPositions.First;
            While not MegaDSSortingLotPositions.Eof Do
             begin
               OutputDebugString(PAnsiChar('NaklRecID: ' + MegaDSSortingLotPositionsNAKL_RECID.AsString +
                                        ', NaklBaseID: ' + MegaDSSortingLotPositionsNAKL_BASEID.AsString +
                                        ', WWE: ' + MegaDSSortingLotPositionsWORK_WITH_EDI.AsString  +
                                        ', UEO: ' + MegaDSSortingLotPositionsUSE_EDI_ORDRSP.AsString +
                                        ', GUID: ' + MegaDSSortingLotPositionsMOB_ORDER_GUID.AsString));

               if (MegaDSSortingLotPositionsWORK_WITH_EDI.AsInteger = 1) and
                (MegaDSSortingLotPositionsMOB_ORDER_GUID.AsString <> '') then
                begin
                  if MegaDSSortingLotPositionsUSE_EDI_ORDRSP.AsInteger = 1 then
                    cntEDIOrdRsp := cntEDIOrdRsp +
                    AddNaklToEDIOrdRspFormingQueue(MegaDSSortingLotPositionsNAKL_RECID.AsInteger,
                                                   MegaDSSortingLotPositionsNAKL_BASEID.AsInteger,
                                                   MegaDSSortingLotPositionsMOB_ORDER_GUID.AsString,
                                                   MegaDSSortingLotPositionsDOC_SUMMA.AsFloat);
                if (not IsRussia) then
                 begin       // Для России перенесено при печати ТТН, чтобы было ГТД
                  if MegaDSSortingLotPositionsUSE_EDI_DESADV.AsInteger = 1 then
                    cntEDIDesAdv := cntEDIDesAdv +
                    AddNaklToEDIDesAdvFormingQueue(MegaDSSortingLotPositionsNAKL_RECID.AsInteger,
                      MegaDSSortingLotPositionsNAKL_BASEID.AsInteger,
                      MegaDSSortingLotPositionsMOB_ORDER_GUID.AsString,
                      MegaDSSortingLotPositionsDOC_SUMMA.AsFloat);

                  if MegaDSSortingLotPositionsUSE_EDI_INVOICE.AsInteger = 1 then
                    cntEDIInvoice := cntEDIInvoice +
                    AddNaklToEDIInvoiceFormingQueue(MegaDSSortingLotPositionsNAKL_RECID.AsInteger,
                      MegaDSSortingLotPositionsNAKL_BASEID.AsInteger,
                      MegaDSSortingLotPositionsMOB_ORDER_GUID.AsString,
                      MegaDSSortingLotPositionsDOC_SUMMA.AsFloat);
                 end;
                end;
             MegaDSSortingLotPositions.next;
           end;
          OutputDebugString(PAnsiChar('Подтверждений заказа EDI сформировано: ' + IntToStr(cntEDIOrdRsp)));
          OutputDebugString(PAnsiChar('Уведомлений об отгрузке EDI сформировано: ' + IntToStr(cntEDIDesAdv)));
        except
          on e:Exception do
           begin
             if fShowMessage
             then
              MessageDlg('Ошибка при формировании документов EDI:'#13#10+e.Message, mtWarning, [mbOk],0)
             else
              raise;
           end;
        end;
      end;
      MegaDSSortingLotPositions.First;
      if i<>0 then
       begin
         MegaDSSortingLot.MakeParty;
       end;
    finally
      MegaDSSortingLot.Close;
    end;

{   if fNeedCreateSecondParty then
   begin
   MegaDSTTNPlanPositions.First;
   try
    MegaDSSortingLot.Open(MegaDSTTNPlanPLANDATE.Value,IntfMegaDBCommon.GetBaseID,StrToInt(MegaSelTradeDelegate.Value));
//    MegaDSTTNPlanBASEID.Value
    try
      MegaDSSortingLot.SetMaxMetod(MegaDSTTNPlanPLANNUMBER.Value*10);
      MegaDSSortingLot.Add;
      MegaDSSortingLotPositions.Open;
      while not MegaDSTTNPlanPositions.Eof do
      begin
       if ((MegaDSTTNPlanPositionsinSortLot.Value=0) and (MegaDSTTNPlanPositionsIS_FED_MARKA.Value=1)) then
        begin
          MegaDSSortingLotPositions.Add(MegaDSTTNPlanPositionsNAKL_RECID.Value,MegaDSTTNPlanPositionsNAKL_BASEID.Value);
          inc(i);
        end;
        MegaDSTTNPlanPositions.Next;
      end;
      if (fNeedCreateEDIDoc) then
       begin
          try
            cntEDIOrdRsp  := 0;
            cntEDIInvoice := 0;
            cntEDIDesAdv  := 0;
            MegaDSSortingLotPositions.Close;
            MegaDSSortingLotPositions.Open;
            MegaDSSortingLotPositions.First;
            While not MegaDSSortingLotPositions.Eof Do
             begin
               OutputDebugString(PAnsiChar('NaklRecID: ' + MegaDSSortingLotPositionsNAKL_RECID.AsString +
                                        ', NaklBaseID: ' + MegaDSSortingLotPositionsNAKL_BASEID.AsString +
                                        ', WWE: ' + MegaDSSortingLotPositionsWORK_WITH_EDI.AsString  +
                                        ', UEO: ' + MegaDSSortingLotPositionsUSE_EDI_ORDRSP.AsString +
                                        ', GUID: ' + MegaDSSortingLotPositionsMOB_ORDER_GUID.AsString));

               if (MegaDSSortingLotPositionsWORK_WITH_EDI.AsInteger = 1) and
                (MegaDSSortingLotPositionsMOB_ORDER_GUID.AsString <> '') then
                begin
                  if MegaDSSortingLotPositionsUSE_EDI_ORDRSP.AsInteger = 1 then
                    cntEDIOrdRsp := cntEDIOrdRsp +
                    AddNaklToEDIOrdRspFormingQueue(MegaDSSortingLotPositionsNAKL_RECID.AsInteger,
                                                   MegaDSSortingLotPositionsNAKL_BASEID.AsInteger,
                                                   MegaDSSortingLotPositionsMOB_ORDER_GUID.AsString,
                                                   MegaDSSortingLotPositionsDOC_SUMMA.AsFloat);
                if (not IsRussia) then
                 begin       // Для России перенесено при печати ТТН, чтобы было ГТД
                  if MegaDSSortingLotPositionsUSE_EDI_DESADV.AsInteger = 1 then
                    cntEDIDesAdv := cntEDIDesAdv +
                    AddNaklToEDIDesAdvFormingQueue(MegaDSSortingLotPositionsNAKL_RECID.AsInteger,
                      MegaDSSortingLotPositionsNAKL_BASEID.AsInteger,
                      MegaDSSortingLotPositionsMOB_ORDER_GUID.AsString,
                      MegaDSSortingLotPositionsDOC_SUMMA.AsFloat);

                  if MegaDSSortingLotPositionsUSE_EDI_INVOICE.AsInteger = 1 then
                    cntEDIInvoice := cntEDIInvoice +
                    AddNaklToEDIInvoiceFormingQueue(MegaDSSortingLotPositionsNAKL_RECID.AsInteger,
                      MegaDSSortingLotPositionsNAKL_BASEID.AsInteger,
                      MegaDSSortingLotPositionsMOB_ORDER_GUID.AsString,
                      MegaDSSortingLotPositionsDOC_SUMMA.AsFloat);
                 end;
                end;
             MegaDSSortingLotPositions.next;
           end;
          OutputDebugString(PAnsiChar('Подтверждений заказа EDI сформировано: ' + IntToStr(cntEDIOrdRsp)));
          OutputDebugString(PAnsiChar('Уведомлений об отгрузке EDI сформировано: ' + IntToStr(cntEDIDesAdv)));
        except
          on e:Exception do
           begin
             if fShowMessage
             then
              MessageDlg('Ошибка при формировании документов EDI:'#13#10+e.Message, mtWarning, [mbOk],0)
             else
              raise;
           end;
        end;
      end;
      MegaDSSortingLotPositions.First;
      if i<>0 then
       begin
         MegaDSSortingLot.MakeParty;
       end;
    finally
      MegaDSSortingLot.Close;
    end;
       end;
    }
    if i<>0
      then MegaDSSortingLot.UpdateTransaction.Commit
      else MegaDSSortingLot.UpdateTransaction.Rollback;
   except
      MegaDSSortingLot.UpdateTransaction.Rollback;
      raise;
   end;

  finally
    if i<>0 then
       MegaDSTTNPlanPositions.FullRefresh;
    MegaDSTTNPlanPositions.EnableControls;
  end;
  result:=true;
end;


procedure TfmTTNPlan.actCreateSortLotAllExecute(Sender: TObject);
var dlg:TfmMSelectCheckList;
    i,i0:Integer;
begin
    dlg:=TfmMSelectCheckList.Create(self);
    try
      dlg.initdataFromTTNPlan_dataset(MegaDSTTNPlan);
      dlg.ShowModal;
    finally
      dlg.Free;
    end;
end;

procedure TfmTTNPlan.actCreateSortLotAllUpdate(Sender: TObject);
var f:boolean;
begin
  f:=MegaDSTTNPlan.Active;
  if f then
    f:=f and (not MegaDSTTNPlan.IsEmpty);
  TAction(sender).Enabled :=f and  (not IntfMegaDBCommon.IsOffice) and
           not (IntfMegaDBCommon.GetParam('DELIVERY_24_HOUR','0')='1');
end;

procedure TfmTTNPlan.actCreateSortLotCurExecute(Sender: TObject);
begin
   fCreateSortLotCur(true);
end;

procedure TfmTTNPlan.actCreateSortLotCurUpdate(Sender: TObject);
var f:boolean;
begin
  f:=MegaDSTTNPlan.Active;
  if f then
    f:=f and (not MegaDSTTNPlan.IsEmpty);
{не понятно зачем это, если потом идет проверка 'DELIVERY_24_HOUR'
  TAction(sender).Enabled := F and
    (MegaDSTTNPlanIS_TEMP_MARSHRUT.IsNull or (MegaDSTTNPlanIS_TEMP_MARSHRUT.AsInteger<>1));

   добавил "f and..." }

  TAction(sender).Enabled :=f  and (not IntfMegaDBCommon.IsOffice)and
                 not (IntfMegaDBCommon.GetParam('DELIVERY_24_HOUR','0')='1');
end;

procedure TfmTTNPlan.actCreateTempMarshrutExecute(Sender: TObject);
var
  aPlannumber : integer;
begin
  MegaDSTTNPlanPositions.Close;
  // наибольший номер маршрута
  qrTempMarsh.Close;
  qrTempMarsh.SQL.Text:=
    'SELECT max(a.NUM)+1 MAX_NUM FROM ('#13#10+
    '  SELECT tm.NOM_MARSHR NUM        '#13#10+
    '  FROM ttn_marshruts tm           '#13#10+
    '  WHERE CFO = :CFO                '#13#10+
    '  union all                       '#13#10+
    '  SELECT max(tp.PLANNUMBER) NUM   '#13#10+
    '  FROM ttn_plan tp                '#13#10+
    '  WHERE tp.PLANDATE=:PLANDATE     '#13#10+
    '    and tp.BASEID=:CFO            '#13#10+
    '  union all                       '#13#10+
    '  SELECT 49                       '#13#10+
    '  FROM RDB$DATABASE               '#13#10+
    '  ) A                             ';
  qrTempMarsh.ParamByName('CFO').AsString := MegaSelTradeDelegate.Value;
  qrTempMarsh.ParamByName('PLANDATE').AsDateTime := MegaDatePanel.Date;
  qrTempMarsh.ExecQuery;
  aPlannumber := qrTempMarsh.FN('MAX_NUM').AsInteger;
  qrTempMarsh.Close;

  MegaDSTTNPlan.Add;
  MegaDSTTNPlan.Edit;
//  MegaDSTTNPlanPLANDATE.AsDateTime  := MegaDatePanel.Date;
//  MegaDSTTNPlanBASEID.AsString      := MegaSelTradeDelegate.Value;
  MegaDSTTNPlanPLANNUMBER.AsInteger := aPlannumber;
  MegaDSTTNPlanIS_TEMP_MARSHRUT.AsInteger := 1;
  MegaDSTTNPlan.Post;
  MegaDSTTNPlan.Refresh;

  MegaDSTTNPlanPositions.Open;
  InitNewTabSheet;
  pcTTNPlanChange(Self);

  actPlanRefresh.Execute;
  RefreshNaklList;
end;

procedure TfmTTNPlan.actCreateTempMarshrutUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := IntfMegaDBCommon.GetCountry=iccRussia;
end;

end.

