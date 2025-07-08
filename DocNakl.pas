// ------------------------------------
// projecWTYFMegapolis Money
// --
// module  : Документ накладная
// author  :
// --
// created       :
// last modified : 16.04.2002
// ------------------------------------
{ ...

16/04/2002 lutsenko
  изменился вызов функции NeedPrintTaraNakl

14.04.2002 lutsenko
  Убрал метод NeedPrintTaraNakl. теперь
  эту проверку выполняет функция NeedPrintTaraNakl в модуле uUtils
}

unit DocNakl;

interface

{$i '..\_Components\Mega.inc'}

uses
  SysUtils,
  Windows,
  Messages,
  Classes,
  Graphics,
  Controls,
  StdCtrls,
  Forms,
  DBCtrls,
  DB{$ifdef D6+},Variants {$endif},
  DBTables,
  Mask,
  ExtCtrls,
  Buttons,
  RegExpr,

  CSEZForm,
  {$IFDEF RX_LIB_2_7_7}
   rxToolEdit,
   rxCurrEdit,
   rxDateUtil,
  {$ELSE}
   ToolEdit,
   CurrEdit,
   DateUtil,
  {$endif}
  DBGridEH,
  DBSumLst,
  EditNaklPosForm,
  MoneyData,
  FIBDatabase,
  FIBQuery,
  FIBDataSet,
  DocList,
  ActnList,
  Menus,
  MoneyFunc,
  AutoPnl,
  DBGridEhImpExp,
  Dialogsr,
  DBClient,
  RxMemDS,
  ComCtrls,
  ToolWin,
  fr_Class,

  uTypes,
  uMegaSelectDK,
  uMegaComboSelect,
  uMegaSelCFO,
  uMegaIntf,
  uMegaForms,
  uMegaCustomSelect,
  uMegaCustomDialog,
  uMegaDSDocType,
  uMegaDSDocNakl, uMegaCustomSelectDB, cxButtons, FR_DSet, FR_DBSet, cxShellBrowserDialog, xdProgress,
  ufmShowLinkedDoc1,
  {$ifdef USE_FIB6}
    //udmInternalDocs,
    udmMegaReports,
  {$endif}
  ClipBrd, uMegaSelAddress, uMegaRDataSet, pFIBQuery, pFIBDataSet,
  pFIBDatabase,
  uMakeScripManager,fib, uUtilsEh, ufmDKOutlets, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc, cxDBEdit,
  cxSpinEdit, cxLabel, cxCalendar, cxButtonEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, frxClass, cxLookAndFeelPainters,
  cxGraphics, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, dxSkinsdxDockControlPainter, cxCheckBox,
  {$IFDEF RX_LIB_2_7_7}rxPlacemnt,{$ELSE}Placemnt,{$endif}
  liUtils,  fbMegaUtils, cxDBExtLookupComboBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDBData, cxGridCustomTableView, cxLookAndFeels,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxDataStorage, MegaDebug, uExcelReports,ufmLinkeTTN,GroupSum, RXCtrls,ufmSendMail,ComObj,
  ADODB, XSBuiltIns, uWMS,
  uMegaSelectMater, udmDocPopupMenuPrint_Items,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, cxNavigator,
  EhLibVCL, GridsEh, DBAxisGridsEh, uMegaSelContract,
  uMegaSelBrandCase, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdCustomHTTPServer, IdHTTPServer, IdTCPConnection, IdTCPClient, IdHTTP,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, uGSACopyPastRows;

type
  TDocNaklForm = class(TMegaForm, IMegaDocNaklForm)
    Panel1: TAutoPanel;
    Panel2: TAutoPanel;
    BitBtn3: TcxButton;
    BitBtn4: TcxButton;
    BitBtn5: TcxButton;
    Panel4: TAutoPanel;
    Label2: TLabel;
    Label6: TLabel;
    DBDateEdit1: TcxDBDateEdit;
    Source: TDataSource;
    DocPosSource: TDataSource;
    Sum: TMegaDataSet;
    GrOper_CE: TcxDBButtonEdit;
    Panel5: TAutoPanel;
    Label1: TLabel;
    Label3: TLabel;
    DOCDATE: TcxDBDateEdit;
    Panel6: TAutoPanel;
    RxLabel3: TcxLabel;
    DK_FROM_CE: TcxDBButtonEdit;
    Panel7: TAutoPanel;
    RxLabel4: TcxLabel;
    DK_TO_CE: TcxDBButtonEdit;
    Panel8: TAutoPanel;
    DK_FROM_ED: TcxDBTextEdit;
    DK_TO_ED: TcxDBTextEdit;
    RxLabel1: TcxLabel;
    FOplName: TcxDBLookupComboBox;
    PriceType: TcxDBLookupComboBox;
    RxLabel2: TcxLabel;
    RxLabel5: TcxLabel;
    Kod_OPER_CE: TcxDBButtonEdit;
    Query: TMegaQuery;
    RxLabel6: TcxLabel;
    SUM1: TFloatField;
    SUM2: TFloatField;
    ActionList1: TActionList;
    Copy: TAction;
    Print: TAction;
    ACatalog: TAction;
    CloseForm: TAction;
    BitBtn2: TcxButton;
    Edit: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    Delete: TAction;
    N6: TMenuItem;
    Insert: TAction;
    N7: TMenuItem;
    RxLabel7: TcxLabel;
    SUM3: TFloatField;
    CreateDoc: TAction;
    CreatePopup: TPopupMenu;
    N8: TMenuItem;
    CreatePDVNakl: TAction;
    BitBtn6: TcxButton;
    SumPDV_SUMMA: TFloatField;
    SumPDV_SUMMA_: TFloatField;
    Nakl_Transaction: TMegaTransaction;
    SumSUMMARY: TFloatField;
    InVal: TcxDBLookupComboBox;
    RxLabel8: TcxLabel;
    UpdateQuery: TMegaQuery;
    SeparateNakl: TAction;
    SeparateNakl1: TMenuItem;
    Kurs: TcxDBCalcEdit;
    DOCNUMBER: TcxDBTextEdit;
    Check: TAction;
    pmPrint: TPopupMenu;
    PrintNakl: TAction;
    PrintInternal: TAction;
    PrintNakl1: TMenuItem;
    PrintInternal1: TMenuItem;
    DBEdit1: TcxDBTextEdit;
    N9: TMenuItem;
    PrintNaklTMC: TAction;
    PrintSchet: TAction;
    N10: TMenuItem;
    SumINDIKATIV: TFloatField;
    SumIS: TFloatField;
    BitBtn8: TcxButton;
    FillRests: TAction;
    Query2: TMegaQuery;
    PrintRetNakl: TAction;
    N11: TMenuItem;
    PrintAct: TAction;
    N12: TMenuItem;
    PrintCopy: TAction;
    PrintCopy1: TMenuItem;
    CopyPos: TAction;
    PastePos: TAction;
    N13: TMenuItem;
    N14: TMenuItem;
    BitBtn1: TcxButton;
    ViewDocProv: TAction;
    PriceLabels: TAction;
    N15: TMenuItem;
    CreatePDVN_D2: TAction;
    N16: TMenuItem;
    IndQuery: TMegaQuery;
    Panel9: TAutoPanel;
    RxLabel9: TcxLabel;
    DK_C_NAME_CE: TcxDBButtonEdit;
    DK_C_ED: TcxDBTextEdit;
    Panel3: TAutoPanel;
    DBGridEH1: TDBGridEh;
    Rest: TMegaQuery;
    PriceList: TAction;
    N17: TMenuItem;
    MakeDoc: TAction;
    MakeDoc1: TMenuItem;
    MakeLgeDoc: TAction;
    Order1: TAction;
    Order2: TAction;
    Prib: TAction;
    PrintDolg: TAction;
    N19: TMenuItem;
    UntitledDoc: TAction;
    IntitledDoc1: TMenuItem;
    SetNacenka: TAction;
    BitBtn7: TcxButton;
    CheckPrn: TAction;
    Rf1: TMenuItem;
    RxLabel10: TcxLabel;
    cbOpl: TCheckBox;
    N20: TMenuItem;
    CheckPrnPos: TAction;
    btSep: TSpeedButton;
    Sep: TAction;
    CopyPosH: TAction;
    PastePosH: TAction;
    IntitledDocBR: TMenuItem;
    RxLabel11: TcxLabel;
    dbedOtsr: TcxDBTextEdit;
    AA: TAction;
    NotOtsr: TAction;
    aSetka: TAction;
    aSetNacInd: TAction;
    miSchet2Print: TMenuItem;
    aShowBaseid: TAction;
    aShowRealPrice: TAction;
    aShowOptPrice: TAction;
    Query3: TMegaQuery;
    PriceControlData: TMegaRDataSet;
    PriceControlDataKOD_MATER: TFloatField;
    PriceControlDataOPT_PRICE: TFloatField;
    PriceControlDataPRICE_: TFloatField;
    aDnac: TAction;
    aF1F2: TAction;
    aCpProtokol: TAction;
    aViewSysProtokol: TAction;
    miProvPrint: TMenuItem;
    aPrintProver: TAction;
    aShowRetPos: TAction;
    RxLabel13: TcxLabel;
    AdrQuery: TMegaQuery;
    DBEdit7: TcxDBTextEdit;
    btnPriceCols: TButton;
    Button2: TButton;
    aBrands: TAction;
    aSetNacRound: TAction;
    Transaction3: TMegaTransaction;
    btnShowCol: TMenuItem;
    aTakeAcc: TAction;
    pmPrintUSA: TPopupMenu;
    aG: TAction;
    actCreateOplDoc: TAction;
    N23: TMenuItem;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    actShowLinkedDocs: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    areg_rest: TAction;
    aCreateOplDocNoPos: TAction;
    N24: TMenuItem;
    ToolBar2: TToolBar;
    btTransit: TToolButton;
    aTransit: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    Query4: TMegaQuery;
    mselDK_From: TMegaSelDKDialog;
    mselDK_TO: TMegaSelDKDialog;
    lbOutletInfo: TLabel;
    MegaSelCFO: TMegaSelCFO;
    mselDK_C: TMegaSelDKDialog;
    actShowIndColor1: TAction;
    actFindTTN: TAction;
    UpdateQueryKol: TMegaQuery;
    N18: TMenuItem;
    N25: TMenuItem;
    aSendENakl: TAction;
    qrEnakl: TMegaDataSet;
    qrCheckEAN: TMegaQuery;
    pmLink: TPopupMenu;
    ToolButton11: TToolButton;
    N26: TMenuItem;
    actFindSortingParty: TAction;
    N27: TMenuItem;
    ToolButton1: TToolButton;
    PrintRecPrice: TAction;
    N28: TMenuItem;
    aSendToRegion: TAction;
    ToolButton12: TToolButton;
    tbtnSendToRegion: TToolButton;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    aCreatePDVIncDoc: TAction;
    aCreatePDVIncKorDoc: TAction;
    N32: TMenuItem;
    N33: TMenuItem;
    aSetDocExistsInOffice: TAction;
    PrintActSpisan: TAction;
    N34: TMenuItem;
    printNaclOF: TAction;
    N35: TMenuItem;
    N36: TMenuItem;
    ToolButton13: TToolButton;
    tbVozvr: TToolButton;
    tbVozvrChP: TToolButton;
    actPrintTTN: TAction;
    actPrintTTN1: TMenuItem;
    RxLabel14: TcxLabel;
    edDelivTime: TEdit;
    FillShowCase: TAction;
    dsNote_m: TMegaDataSet;
    dsNote_mzmc_mater: TFIBStringField;
    dsNote_mzmc_kolich: TIntegerField;
    dsNote_mvalue_nakl: TFloatField;
    dsNote_mvalue_right: TFloatField;
    dsNote_mvalue_dif: TFloatField;
    dsNote_msum_dif: TFloatField;
    dsNote_mzmc_date: TDateTimeField;
    dsNote_mnakl_num: TIntegerField;
    dsNote_mnakl_date: TDateTimeField;
    dsNote_mnakl_balance: TIntegerField;
    dsNote_martikulm: TFIBStringField;
    frDB_Notem: TfrDBDataSet;
    btnNote: TMenuItem;
    actNote: TAction;
    dsNote_martikul: TFloatField;
    actTransfer: TAction;
    N38: TMenuItem;
    actPrintGift: TAction;
    N39: TMenuItem;
    Panel10: TPanel;
    RxLabel15: TcxLabel;
    RxDBComboEdit1: TcxDBButtonEdit;
    DocNakl: TMegaDSDocNakl;
    DocNaklOPERDATE: TDateTimeField;
    DocNaklDOCTYPE: TFIBStringField;
    DocNaklDOCNUMBER: TIntegerField;
    DocNaklDOCDATE: TDateTimeField;
    DocNaklKOD_OPER: TIntegerField;
    DocNaklDK_FROM: TFloatField;
    DocNaklGROUP_OPER: TIntegerField;
    DocNaklDK_TO: TFloatField;
    DocNaklKURS: TFloatField;
    DocNaklSUMMA: TFloatField;
    DocNaklSUMMA1: TFloatField;
    DocNaklNOTES: TFIBStringField;
    DocNaklKOLICH_: TFloatField;
    DocNaklFORMAOPL_: TIntegerField;
    DocNaklPRICETYPE_: TIntegerField;
    DocNaklBALANCE_KOD: TIntegerField;
    DocNaklV: TIntegerField;
    DocNaklV1: TIntegerField;
    DocNaklNACENKA_: TFloatField;
    DocNaklPRICE_FROM_VALYUTA: TIntegerField;
    DocNaklSTATE: TIntegerField;
    DocNaklGROUP_NAME: TFIBStringField;
    DocNaklNAME_OPER: TFIBStringField;
    DocNaklDK_FROM_NAME: TFIBStringField;
    DocNaklDK_TO_NAME: TFIBStringField;
    DocNaklDOC_INHERITED: TIntegerField;
    DocNaklNDSINSUMMA: TIntegerField;
    DocNaklFOplName: TFIBStringField;
    DocNaklBASEID: TIntegerField;
    DocNaklRECID: TIntegerField;
    DocNaklV_Name: TFIBStringField;
    DocNaklPriceType: TFIBStringField;
    DocNaklV1_Name: TFIBStringField;
    DocNaklPRICE_MIN: TIntegerField;
    DocNaklDK_C: TFloatField;
    DocNaklDK_C_NAME: TFIBStringField;
    DocNaklOTSR: TIntegerField;
    DocNaklTRANSPORT: TFloatField;
    DocNaklAREA_ID: TFIBStringField;
    DocNaklDOC_NAME_: TFIBStringField;
    DocNaklDK_TO_BASEID: TIntegerField;
    DocNaklDK_ADDRESS: TFIBStringField;
    DocNaklTRANSIT: TIntegerField;
    DocNaklCFO: TIntegerField;
    DocNaklPRESENT: TSmallintField;
    DocNaklLDO_RECID: TIntegerField;
    DocNaklLDO_BASEID: TIntegerField;
    DocNaklDG_RECID: TIntegerField;
    DocNaklDG_BASEID: TIntegerField;
    DocNaklDG_DOCNUMBER: TFIBStringField;
    DocNaklDG_NOTES: TFIBStringField;
    DocPos: TMegaRDataSet;
    DocPosKOD_MATER: TFloatField;
    DocPosPDV: TFIBStringField;
    DocPosED_IZM: TFIBStringField;
    DocPosKOLICH: TFloatField;
    DocPosNAME_MATER: TFIBStringField;
    DocPosBoxcount: TFloatField;
    DocPosPrice1: TFloatField;
    DocPosSUMMA: TFloatField;
    DocPosPrice2: TFloatField;
    DocPosSUMMA1: TFloatField;
    DocPosTOSALE: TIntegerField;
    DocPosLOCAL_KOD: TIntegerField;
    DocPosSTATE: TIntegerField;
    DocPosBASEID: TIntegerField;
    DocPosGROUP_MATER: TIntegerField;
    DocPosCOUNTINBOX_: TIntegerField;
    DocPosDESCRIPTION: TFIBStringField;
    DocPosVALYUTA: TIntegerField;
    DocPosRest: TFloatField;
    DocPosRECID: TIntegerField;
    DocPosDOCRECNO: TIntegerField;
    DocPosSumma2: TFloatField;
    DocPosSumma3: TFloatField;
    DocPosPrice1_: TFloatField;
    DocPosPrice2_: TFloatField;
    DocPosBeginRest: TFloatField;
    DocPosIND: TIntegerField;
    DocPosIND_SUMMA: TFloatField;
    DocPosSUMMAWPDV: TFloatField;
    DocPosPRICEWPDV: TFloatField;
    DocPosPDVGROUP_STAVKA: TFloatField;
    DocPosIND_PRICE: TFloatField;
    DocPosTARA_MATER: TFloatField;
    DocPosTRIGGER_OFF: TIntegerField;
    DocPosOTSR: TIntegerField;
    DocPosOTSR_PRIOR: TIntegerField;
    DocPosRealPrice: TFloatField;
    DocPosOptPrice: TFloatField;
    DocPosTVID_KOD: TIntegerField;
    DocPosCOL: TIntegerField;
    DocPosCOL_CHECK_WITH: TBooleanField;
    DocPosCOL1: TIntegerField;
    DocPosKOD_EAN: TFloatField;
    DocPosACTIVE_: TIntegerField;
    DocPosPRICE_KOL: TIntegerField;
    DocPosINVENTAR_NUMBER: TFloatField;
    DocPosMADEIN: TIntegerField;
    pmPrintRu: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem3: TMenuItem;
    actPrintSpravB: TAction;
    MenuItem5_Torg2: TMenuItem;
    actPrintTorg15: TAction;
    ItemTorg15: TMenuItem;
    actPrintTorg16: TAction;
    ItemTorg16: TMenuItem;
    ItemSbToTTN: TMenuItem;
    actPrintRbToTTN: TAction;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    actSelLinkDOc: TAction;
    actPrintSoprDToTN: TAction;
    ItemSoprToTN: TMenuItem;
    actPrintSchetR: TAction;
    ItemToShetR: TMenuItem;
    actPrintTorg13: TAction;
    ItemTorg13: TMenuItem;
    actPrintMx3: TAction;
    ItemMX_3: TMenuItem;
    actPrintM11: TAction;
    ItemM11: TMenuItem;
    actPrintM4: TAction;
    ItemM4: TMenuItem;
    aSetKolPrecent: TAction;
    actPrintOC1: TAction;
    actPrintOC2: TAction;
    actPrintOC4: TAction;
    actPrintOC4a: TAction;
    ItemsOS: TMenuItem;
    ItemOC1: TMenuItem;
    ItemOC2: TMenuItem;
    ItemOC4: TMenuItem;
    ItemOC4a: TMenuItem;
    DocPosIS_SERTIF: TIntegerField;
    DocPosMAT_DOC: TIntegerField;
    actPrintMB7: TAction;
    ItemsTMC: TMenuItem;
    ItemMB7: TMenuItem;
    actPercentNakl: TAction;
    aSetPriceColExecute: TAction;
    DocPosForENakl: TMegaRDataSet;
    DocPosForENaklKOD_MATER: TFloatField;
    DocPosForENaklPDV: TFIBStringField;
    DocPosForENaklED_IZM: TFIBStringField;
    DocPosForENaklKOLICH: TFloatField;
    DocPosForENaklNAME_MATER: TFIBStringField;
    DocPosForENaklBoxcount: TFloatField;
    DocPosForENaklPrice1: TFloatField;
    DocPosForENaklSUMMA: TFloatField;
    DocPosForENaklPrice2: TFloatField;
    DocPosForENaklSUMMA1: TFloatField;
    DocPosForENaklTOSALE: TIntegerField;
    DocPosForENaklLOCAL_KOD: TIntegerField;
    DocPosForENaklSTATE: TIntegerField;
    DocPosForENaklBASEID: TIntegerField;
    DocPosForENaklGROUP_MATER: TIntegerField;
    DocPosForENaklCOUNTINBOX: TIntegerField;
    DocPosForENaklDESCRIPTION: TFIBStringField;
    DocPosForENaklVALYUTA: TIntegerField;
    DocPosForENaklRest: TFloatField;
    DocPosForENaklRECID: TIntegerField;
    DocPosForENaklDOCRECNO: TIntegerField;
    DocPosForENaklSumma2: TFloatField;
    DocPosForENaklSumma3: TFloatField;
    DocPosForENaklPrice1_: TFloatField;
    DocPosForENaklPrice2_: TFloatField;
    DocPosForENaklBeginRest: TFloatField;
    DocPosForENaklIND: TIntegerField;
    DocPosForENaklIND_SUMMA: TFloatField;
    DocPosForENaklSUMMAWPDV: TFloatField;
    DocPosForENaklPRICEWPDV: TFloatField;
    DocPosForENaklPDVGROUP_STAVKA: TFloatField;
    DocPosForENaklIND_PRICE: TFloatField;
    DocPosForENaklTARA_MATER: TFloatField;
    DocPosForENaklTRIGGER_OFF: TIntegerField;
    DocPosForENaklOTSR: TIntegerField;
    DocPosForENaklOTSR_PRIOR: TIntegerField;
    DocPosForENaklRealPrice: TFloatField;
    DocPosForENaklOptPrice: TFloatField;
    DocPosForENaklTVID_KOD: TIntegerField;
    DocPosForENaklCOL: TIntegerField;
    DocPosForENaklCOL1: TIntegerField;
    DocPosForENaklKOD_EAN: TFloatField;
    DocPosForENaklACTIVE_: TIntegerField;
    DocPosForENaklPRICE_KOL: TIntegerField;
    DocPosForENaklINVENTAR_NUMBER: TFloatField;
    DocPosForENaklMADEIN: TIntegerField;
    DocPosForENaklIS_SERTIF: TIntegerField;
    DocPosForENaklMAT_DOC: TIntegerField;
    ItemTorg3: TMenuItem;
    actPrintMx1: TAction;
    ItemMX_1: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    Button3: TButton;
    actSticker: TAction;
    DocNaklSUFICS: TFIBStringField;
    DBEdit3: TcxDBTextEdit;
    N42: TMenuItem;
    actPrintActR: TAction;
    Kurs1: TcxCalcEdit;
    N43: TMenuItem;
    actPrintBreak: TAction;
    actGetID: TAction;
    aktSubRent: TAction;
    frDB_Subrent: TfrDBDataSet;
    actSubRent_List: TAction;
    NN: TMenuItem;
    N37: TMenuItem;
    actNaklPosSplit: TAction;
    NaklSplitQ: TMegaQuery;
    trSplitNakl: TMegaTransaction;
    ToolButton16: TToolButton;
    aSetOFDogovor: TAction;
    actCheckNext: TAction;
    pmPrintReklama: TPopupMenu;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    pnlOffice: TAutoPanel;
    MegaSelCFOfrom: TMegaSelAddress;
    MegaSelCFOto: TMegaSelAddress;
    DocNaklADDR_FROM: TIntegerField;
    DocNaklADDR_TO: TIntegerField;
    actPrintDogovor: TAction;
    N44: TMenuItem;
    N45: TMenuItem;
    actPrintActSpisanNew: TAction;
    N50: TMenuItem;
    actPrintSpec: TAction;
    pmPrint_i_Spec: TMenuItem;
    actPrintInvoiceP: TAction;
    actPrintInvoice: TAction;
    actPrintPackList: TAction;
    N52: TMenuItem;
    pmPrint_i_is: TMenuItem;
    N56: TMenuItem;
    actPrintSubRent_Strono: TAction;
    N57: TMenuItem;
    actPrintInvoiceDe: TAction;
    pmPrint_i_InvoiceGermany: TMenuItem;
    N54: TMenuItem;
    tbSendNakl: TToolButton;
    aSendNaklToOffice: TAction;
    Ins2Office: TMegaQuery;
    RemoteTransaction: TMegaTransaction;
    RemoteBase: TMegaBase;
    selNakl2Office: TMegaRDataSet;
    selNaklPos2Office: TMegaRDataSet;
    DocNaklDOC_CREATOR: TFIBStringField;
    stUser: TDBText;
    pmPrint_i_InvoiceP: TMenuItem;
    tbAkcis: TToolButton;
    qAkcis: TMegaQuery;
    tbSelfExport: TToolButton;
    actSelfExport: TAction;
    qSelfNakl: TpFIBQuery;
    actPrintSpec_Rekl: TAction;
    actPrintInvoiceP_Rekl: TAction;
    actPrintInvoice_Rekl: TAction;
    pmPrint_i_SpecRekl: TMenuItem;
    pmPrint_i_rs: TMenuItem;
    pmPrint_i_invocePRekl: TMenuItem;
    cxDBse_Nacenka: TcxDBSpinEdit;
    cdsVal: TClientDataSet;
    cdsValVal: TIntegerField;
    cdsValName: TStringField;
    dsVal: TDataSource;
    actSpecificationParams: TAction;
    N63: TMenuItem;
    pmPrint_i_IParamsMake: TMenuItem;
    actPrintSpecInvoice: TAction;
    pmPrint_i_IParams: TMenuItem;
    PrintNaklOS: TAction;
    N65: TMenuItem;
    LinkQ: TMegaQuery;
    N66: TMenuItem;
    actPrintInvoicePP: TAction;
    N67: TMenuItem;
    N68: TMenuItem;
    N69: TMenuItem;
    actPrintInvoice_ReklPP: TAction;
    DocPosKOD_DK: TFIBFloatField;
    DocPosNAME_DK: TFIBStringField;
    actPrintSpec_TNVED: TAction;
    actPrintInvoice_TNVED: TAction;
    actPrintInvoicePP_TNVED: TAction;
    pmPrint_i_SpecTNVED1: TMenuItem;
    actPrintInvoiceTNVED1: TMenuItem;
    N70: TMenuItem;
    ToolButton17: TToolButton;
    btnNakl2Egais: TToolButton;
    actUpdateNakl2Egais: TAction;
    actSetPdvC: TAction;
    actPrintPackListEn: TAction;
    pmPrint_i_packList: TMenuItem;
    actPrintQualityCertification: TAction;
    N72: TMenuItem;
    pnKeytAddress: TPanel;
    lblKeytAddress: TLabel;
    DocNaklIS_BANKET: TFIBSmallIntField;
    actPrinRealRus: TAction;
    N55: TMenuItem;
    N73: TMenuItem;
    PrintNaklWithVozvrat: TAction;
    DocNaklDK_TO_PRINT_WITH_VOZVRAT: TFIBSmallIntField;
    PrintNakl1_With_Vozvrat: TMenuItem;
    PrintNakl2_With_Vozvrat: TMenuItem;
    dsNote_mTotalSumAsString: TMegaStringField;
    dsNote_mNASH_KOD: TMegaStringField;
    dsNote_mNOTES: TMegaStringField;
    dsNote_mORDER_NUM: TMegaStringField;
    dsNote_mNUMBER: TMegaStringField;
    DocPosGTD_4: TSmallintField;
    actPrintActRekl_Ru: TAction;
    N74: TMenuItem;
    DocPosEXCISE: TFIBFloatField;
    DocPosEXCISE_SUM: TFIBFloatField;
    DocNaklEXCISE_IN_SUMMA: TIntegerField;
    mdRestParty: TMegaDataSet;
    mdRestPartyNUMBER: TFIBStringField;
    mdRestPartyNUM_PARTY_EGAIS: TFIBFloatField;
    mdRestPartyKOLICH: TFIBFloatField;
    NaklSplitPartyQ: TMegaQuery;
    actViewProvParty: TAction;
    DocPosPARTY: TFIBStringField;
    DocPosdate_part: TFIBDateTimeField;
    mdRestPartyDATE_PART: TFIBDateTimeField;
    mdsSelParty: TMegaDataSet;
    DocPosUKP: TFloatField;
    btnStartBP: TToolButton;
    actPrintInvoiceTabClient: TAction;
    pmPrint_i_TabClient: TMenuItem;
    DocNaklSOGL: TIntegerField;
    actPrintGtdLinks: TAction;
    N76: TMenuItem;
    cxDBTextEdit1: TcxDBTextEdit;
    DocPosCOUNTINBOX: TIntegerField;
    DocPosCOUNTINBOX_METRO: TIntegerField;
    DocNaklPARENT_DK_TO: TFIBFloatField;
    actPrintNaklImages: TAction;
    N77: TMenuItem;
    miOKK_OLD: TMenuItem;
    actGovQuality: TAction;
    N79: TMenuItem;
    N80: TMenuItem;
    actPrintNaklVozvrat: TAction;
    N81: TMenuItem;
    actActPP: TAction;
    N82: TMenuItem;
    actNaklVoronezh: TAction;
    N121: TMenuItem;
    DocPosPACK_RECID: TFIBIntegerField;
    DocNaklDK_TO_COUNTRY: TFIBIntegerField;
    actViewKartForm: TAction;
    N83: TMenuItem;
    actSplitPosByRests: TAction;
    N84: TMenuItem;
    actSplitNaklPosByParty: TAction;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    cbPallete: TcxDBCheckBox;
    DocNaklUSE_PALLETE: TFIBIntegerField;
    cxlReal_Otsr: TcxLabel;
    teReal_Otsr: TcxDBTextEdit;
    DocNaklREAL_OTSR: TIntegerField;
    btnCheckWithCol: TMenuItem;
    BtnCreatePodotchetNakl: TMenuItem;
    actCreatePodotchetNakl: TAction;
    pmBP: TPopupMenu;
    actStartBPAgreementOfProductionReturn: TAction;
    actStartBPContragentVIP: TAction;
    N21: TMenuItem;
    N85: TMenuItem;
    VIP1: TMenuItem;
    actPrintBirka: TAction;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    N89: TMenuItem;
    DocPosPARTY_RECID: TFIBIntegerField;
    DocPosPARTY_BASEID: TFIBIntegerField;
    pnlZayavka: TPanel;
    lbZayavka: TLabel;
    lcbZayavka: TcxDBExtLookupComboBox;
    fdsZayavka: TMegaDataSet;
    fdsZayavkaRECID: TFIBIntegerField;
    fdsZayavkaDOCNUMBER: TFIBIntegerField;
    fdsZayavkaDOCDATE: TFIBDateTimeField;
    fdsZayavkaGOROD_FROM: TFIBIntegerField;
    fdsZayavkaGOROD_TO: TFIBIntegerField;
    fdsZayavkaGOROD_TRANSIT: TFIBIntegerField;
    fdsZayavkaTOWN_FROM: TFIBStringField;
    fdsZayavkaTOWN_TO: TFIBStringField;
    fdsZayavkaTOWN_TRANSIT: TFIBStringField;
    fdsZayavkaSTART_DATE: TFIBDateTimeField;
    fdsZayavkaEND_DATE: TFIBDateTimeField;
    fdsZayavkaTYP: TFIBIntegerField;
    fdsZayavkaTYP_NAME: TFIBStringField;
    fdsZayavkaTONNAGE_NAME: TFIBStringField;
    fdsZayavkaTONNAGE_VALUE: TFIBFloatField;
    fdsZayavkaSTATUS: TFIBIntegerField;
    fdsZayavkaSCANDOC: TFIBBlobField;
    fdsZayavkaSTATUS_NAME: TFIBStringField;
    fdsZayavkaUSERNAME: TFIBStringField;
    fdsZayavkaDK_CARRIER: TFIBFloatField;
    fdsZayavkaDRIVER_NAME: TFIBStringField;
    fdsZayavkaDRIVER_PASSPORT: TFIBStringField;
    fdsZayavkaCAR_SNUM: TFIBStringField;
    fdsZayavkaCAR_TRAILER: TFIBStringField;
    fdsZayavkaCAR_TRAILER2: TFIBStringField;
    fdsZayavkaDRIVER_PHONE: TFIBStringField;
    fdsZayavkaCOST: TFIBFloatField;
    fdsZayavkaGRUZ: TFIBStringField;
    fdsZayavkaPLACES: TFIBStringField;
    fdsZayavkaVOLUME: TFIBStringField;
    fdsZayavkaREGIME: TFIBStringField;
    fdsZayavkacur_city: TIntegerField;
    fdsZayavkaDK_CARRIER_NAME: TFIBStringField;
    dsZayavka: TDataSource;
    DocNaklZAYAVKA_ID: TFIBIntegerField;
    DocNaklSENDED_TO_OFFICE: TFIBIntegerField;
    cxGridViewRepository1: TcxGridViewRepository;
    cxGridViewRepository1DBTableView1: TcxGridDBTableView;
    cxGridViewRepository1DBTableView1RECID: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1DOCNUMBER: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1DOCDATE: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1GOROD_FROM: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1GOROD_TO: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1GOROD_TRANSIT: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1TOWN_FROM: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1TOWN_TO: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1TOWN_TRANSIT: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1START_DATE: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1END_DATE: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1TYP: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1TYP_NAME: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1TONNAGE_NAME: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1TONNAGE_VALUE: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1STATUS: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1SCANDOC: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1STATUS_NAME: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1USERNAME: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1DK_CARRIER: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1DRIVER_NAME: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1DRIVER_PASSPORT: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1CAR_SNUM: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1CAR_TRAILER: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1CAR_TRAILER2: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1DRIVER_PHONE: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1COST: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1GRUZ: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1PLACES: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1VOLUME: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1REGIME: TcxGridDBColumn;
    actStartBPRemoveBlockingOfMinimalOrder: TAction;
    N90: TMenuItem;
    tbOrderSklad: TToolButton;
    pmOrder: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    actInsNar: TAction;
    actUpdateNar: TAction;
    actDelNar: TAction;
    mdsDocOrderSklad: TMegaDataSet;
    mdsDocOrderSkladRECID: TFIBIntegerField;
    mdsDocOrderSkladBASEID: TFIBIntegerField;
    mdsDocOrderSkladDOCNUMBER: TFIBIntegerField;
    mdsDocOrderSkladOPERDATE: TFIBDateTimeField;
    mdsDocOrderSkladTYPE_ORDER: TFIBIntegerField;
    mdsDocOrderSkladPLAN_DATE: TFIBDateTimeField;
    mdsDocOrderSkladPLAN_NUMBER: TFIBIntegerField;
    mdsDocOrderSkladPLAN_BASEID: TFIBIntegerField;
    mdsDocOrderSkladNAKL_RECID: TFIBIntegerField;
    mdsDocOrderSkladNAKL_BASEID: TFIBIntegerField;
    actPrintOrder: TAction;
    actPrintMETRO: TAction;
    actPrintMETRO1: TMenuItem;
    N92: TMenuItem;
    N91: TMenuItem;
    btnReturnCause: TToolButton;
    actStartBPFinanceCoordinationOfGettingProductOnCredit: TAction;
    actStartBPFinanceCoordinationOfGettingProductOnCredit1: TMenuItem;
    miBilla: TMenuItem;
    actAllowNotCheckForNewTT: TAction;
    ToolButton20: TToolButton;
    mdsSelPartyNUMBER: TFIBStringField;
    mdsSelPartyNUM_PARTY_EGAIS: TFIBFloatField;
    mdsSelPartyKOLICH: TFIBFloatField;
    mdsSelPartyDATE_PART: TFIBDateTimeField;
    mdsSelPartyOPERDATE: TFIBDateTimeField;
    mdsSelPartyDOCNUMBER: TFIBStringField;
    mdsSelPartyGTD_NUM4: TFIBIntegerField;
    mdsSelPartyRECID: TFIBIntegerField;
    mdsSelPartyBASEID: TFIBIntegerField;
    mdsSelPartyUKP: TFIBFloatField;
    trGTD: TMegaTransaction;
    lblCFOOtgr: TLabel;
    DocNaklBRAND_CASE_ID: TFIBIntegerField;
    PanelDop: TPanel;
    Label24: TLabel;
    DBEdit5: TcxDBTextEdit;
    RxLabel12: TcxLabel;
    smTrans: TcxCalcEdit;
    N93: TMenuItem;
    actPrintNaklF2WithoutHeader: TAction;
    actPrintMailBonus: TAction;
    N94: TMenuItem;
    actPrintNaklNotLVI: TAction;
    N95: TMenuItem;
    cxButton1: TcxButton;
    actAddPosAntiBrand: TAction;
    cxButton2: TcxButton;
    actAddFivePoistion: TAction;
    DocPosDATE_ROZLIVA: TFIBDateTimeField;
    DocPosINVOCE_NUMBER: TFIBStringField;
    chkIsBanket: TcxDBCheckBox;
    N96: TMenuItem;
    tbSertificat: TToolButton;
    G1: TMenuItem;
    miOKK: TMenuItem;
    N78: TMenuItem;
    actStartBusinessSellingForTTWithoutLicense: TAction;
    mdsIncludeOkom: TMegaRDataSet;
    dsIncludedOkom: TDataSource;
    mdsIncludeOkomis_included: TSmallintField;
    mdsIncludeOkomdoc_recid: TIntegerField;
    mdsIncludeOkomdoc_baseid: TIntegerField;
    N97: TMenuItem;
    miEDI: TMenuItem;
    J1: TMenuItem;
    J2: TMenuItem;
    N98: TMenuItem;
    cxLabelSelfExport: TcxLabel;
    ToolButton21: TToolButton;
    actCheckBaseNakl: TAction;
    pmTypeAkc: TPopupMenu;
    N99: TMenuItem;
    actCheckBaseNakl_med: TAction;
    N100: TMenuItem;
    actCheckBaseNakl_blg: TAction;
    actCheckBaseNaklblg1: TMenuItem;
    actCheckBaseNaklFeodosia: TMenuItem;
    N101: TMenuItem;
    DocPosARTICUL_PARTNER: TFIBStringField;
    actCheckBaseNaklOKZ: TMenuItem;
    N102: TMenuItem;
    actUnCheckBaseNakl_Khortitsa: TMenuItem;
    actUnCheckBaseNakl_Med: TMenuItem;
    actUnCheckBaseNakl_Blg: TMenuItem;
    actUnCheckBaseNakl_Feod: TMenuItem;
    actUnCheckBaseNakl_OKZ: TMenuItem;
    actUnCheckBaseNakl_all: TMenuItem;
    cbdbDontUseSpecPrice: TcxDBCheckBox;
    DocNaklDONT_USE_SPEC_PRICE: TFIBBooleanField;
    N103: TMenuItem;
    actCreateNaklAkcii: TAction;
    ToolButton23: TToolButton;
    actCheckBaseNaklTOP14: TMenuItem;
    actUnCheckBaseNakl_TOP14: TMenuItem;
    DocNaklCONTRACT_ID: TFIBFloatField;
    G2: TMenuItem;
    actPrintTTN2: TAction;
    dsNote_mzmc_num: TFIBStringField;
    ToolButton22: TToolButton;
    actPrintEANBox: TAction;
    N104: TMenuItem;
    N105: TMenuItem;
    dsNote_mSHORTNAME_DK: TFIBStringField;
    dsNote_maddres: TFIBStringField;
    dsNote_mphones: TFIBStringField;
    dsNote_mKOD_DK: TFloatField;
    dsNote_mRECID: TIntegerField;
    dsNote_mBASEID: TIntegerField;
    actPrintActMaterial: TAction;
    N106: TMenuItem;
    acPrintSertif: TAction;
    N107: TMenuItem;
    PanelDopLeft: TPanel;
    MegaSelBrandCase2: TMegaSelBrandCase;
    MegaSelContract1: TMegaSelContract;
    cxLabelEgaisCode: TcxLabel;
    DocNaklEGAIS_KOD_DK: TFIBStringField;
    cxDBTextEditEgaisCode: TcxDBTextEdit;
    MegaSelMaterDialog1: TMegaSelMaterDialog;
    acPrintSertifKrasnoyarsk: TAction;
    N108: TMenuItem;
    acPrintSertifRostov: TAction;
    acPrintSertifPostovDate: TAction;
    L1: TMenuItem;
    N109: TMenuItem;
    N110: TMenuItem;
    N111: TMenuItem;
    acPrintSertifVoroneg: TAction;
    N112: TMenuItem;
    DocPosSKIDKA: TFIBFloatField;
    DocPosSKIDKA_WITH_PDV: TFIBFloatField;
    DocPosPRICE_PREV: TFIBFloatField;
    smDBCustoms: TcxDBCalcEdit;
    cxLabel2: TcxLabel;
    DocNaklSUMMA_EXPORT: TFloatField;
    ActPrintImportZ_ZTPP: TAction;
    pmPrint_i_Z_ZTPP: TMenuItem;
    pmPrint_i_Docs: TMenuItem;
    pmPrint_i_ActZag: TMenuItem;
    ActPrintImport_ActZ: TAction;
    ActPrintImport_CMR: TAction;
    pmPrint_i_CMR: TMenuItem;
    DocPosDATE_AKCIZ_FIX: TFIBDateTimeField;
    DocPosNUMB_AKCIZ_FIX: TFIBStringField;
    DocNaklWITH_SUM_TRANSPORT: TFIBIntegerField;
    DocPosPrice_box: TFloatField;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    P1: TMenuItem;
    actPrintSpravkaB: TAction;
    N22: TMenuItem;
    acPrintSertifYaroslavl: TAction;
    acPrintSertifKazan: TAction;
    N51: TMenuItem;
    N53: TMenuItem;
    acPrintSertifRostovExcel: TAction;
    Excel1: TMenuItem;
    DocPosCOUNT_PARTY: TIntegerField;
    actTransferStore: TAction;
    N58: TMenuItem;
    DocPosSUMMA_DUTY: TFloatField;
    DocPosSUMMA_AMOUNT_TRAFIC: TFloatField;
    actSendInvoice: TAction;
    SendInvoice1: TMenuItem;
    DocPosGROUP_NAME: TMegaStringField;
    DBSumList1: TDBSumList;
    RxMemoryData1: TRxMemoryData;
    dsSum: TRxMemoryData;
    dsSumGroup: TRxMemoryData;
    dsSource: TClientDataSet;
    DocPosCHECKED: TIntegerField;
    RxSpeedButton1: TRxSpeedButton;
    actGroupNameMAter: TAction;
    actInsNarUnloadCont: TAction;
    N59: TMenuItem;
    N60: TMenuItem;
    DocNaklNAS_P_NAME: TFIBStringField;
    btnStorageIn: TToolButton;
    btnStorageOut: TToolButton;
    N61: TMenuItem;
    actPrintCheck: TAction;
    DocPosNAME_MATER_KAS: TFIBStringField;
    N62: TMenuItem;
    N64: TMenuItem;
    actCreatePDVNaklReports: TAction;
    PrintWithZMC: TAction;
    N71: TMenuItem;
    actSendNakl: TAction;
    N75: TMenuItem;
    AA1: TMenuItem;
    actSendWestern: TAction;
    actPrintSpecInvoiceNew: TAction;
    N113: TMenuItem;
    DocNaklDOC_CREATE: TDateTimeField;
    ActPasteFromExcel: TAction;
    Excel2: TMenuItem;
    ActDocListLocate: TAction;
    ToolButton24: TToolButton;
    actSplitList: TAction;
    N114: TMenuItem;
    N115: TMenuItem;
    N116: TMenuItem;
    N117: TMenuItem;
    N118: TMenuItem;
    N119: TMenuItem;
    Torg2ForClient: TMenuItem;
    N120: TMenuItem;
    N210: TMenuItem;
    N211: TMenuItem;
    N212: TMenuItem;
    dbf1: TMenuItem;
    DocNaklADDR_FROM_ID: TFIBIntegerField;
    DocNaklADDR_TO_ID: TFIBIntegerField;
    actStickering: TAction;
    N122: TMenuItem;
    actShippingPallets: TAction;
    N123: TMenuItem;
    N124: TMenuItem;
    acPrintNaklWithoutTransport: TAction;
    DocPosForENaklOPERDATE: TFIBDateTimeField;
    DocPosForENaklDOCNUMBER: TIntegerField;
    DocPosForENakllocation: TFIBStringField;
    DocPosForENaklDK_TO: TFloatField;
    DocPosForENaklDK_FROM: TFloatField;
    conEgais: TADOConnection;
    dsDocNumber: TADODataSet;
    dsDocNumberID_DOC: TLargeintField;
    dsDocNumberDOC_NUMBER: TMegaStringField;
    dsDocNumberFIX_NOTIFICATION_ID: TLargeintField;
    dsDocNumberFIX_NOTIFICATION_DATE: TDateTimeField;
    dsDocNumberIS_IMPORT: TBooleanField;
    actGetEgaisNUmber: TAction;
    actGetEgaisNUmber1: TMenuItem;
    cxDBTEEgais: TcxDBTextEdit;
    cxLblEgais: TcxLabel;
    DocNaklEGAIS_FIX_NUM_STR: TFIBStringField;
    actPrintMarkTara: TAction;
    N125: TMenuItem;
    N126: TMenuItem;
    N127: TMenuItem;
    N128: TMenuItem;
    N129: TMenuItem;
    actExportToWMS: TAction;
    mdsImportAsnInWMS: TMegaRDataSet;
    mdsImportAsnInWMSASNNUMBER: TFIBIntegerField;
    mdsImportAsnInWMSWHSCODE: TFIBStringField;
    mdsImportAsnInWMSWHSTOCODE: TFIBStringField;
    mdsImportAsnInWMSSUPPLIERCODE: TFIBFloatField;
    mdsImportAsnInWMSSUPPLIERNAME: TFIBStringField;
    mdsImportAsnInWMSCOMMENT: TFIBStringField;
    mdsImportAsnInWMSPos: TMegaRDataSet;
    mdsImportAsnInWMSPosGOODSCODE: TFIBFloatField;
    mdsImportAsnInWMSPosQTY: TFIBFloatField;
    mdsImportAsnInWMSPosMUCODE: TFIBStringField;
    mdsImportAsnInWMSPosBBD: TFIBDateTimeField;
    mdsImportAsnInWMSPosPRD: TFIBDateTimeField;
    mdsImportAsnInWMSPosPRODUCERCODE: TFIBFloatField;
    mdsImportAsnInWMSPosPRODUCERNAME: TFIBStringField;
    mdsImportAsnInWMSPosCOUNTRYCODE: TFIBIntegerField;
    mdsImportAsnInWMSPosSSCC: TFIBStringField;
    mdsImportAsnInWMSPosPOREGNO: TFIBStringField;
    mdsImportAsnInWMSPosPOLINENO: TFIBIntegerField;
    mdsImportAsnInWMSPosGTDREGNO: TFIBStringField;
    mdsImportAsnInWMSPosGTDLINENO: TFIBIntegerField;
    mdsImportAsnInWMSPosCOMMENT: TFIBStringField;
    mdsImportAsnInWMSPosSTOCKSTATUS: TFIBStringField;
    qSortNakl: TMegaQuery;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    mdsImportAsnInWMSPoslotno: TFIBIntegerField;
    mdsImportAsnInWMSVENDORCODE: TFIBFloatField;
    mdsImportAsnInWMSVENDORTOCODE: TFIBFloatField;
    mdsImportAsnInWMSCUSTOMERNAME: TFIBStringField;
    mdsImportAsnInWMSTo_address: TFIBStringField;
    mdsImportAsnInWMSDK_PAYER_ADDRESS: TFIBStringField;
    mdsImportAsnInWMSoutlet_recid: TFIBIntegerField;
    mdsImportAsnInWMSoutlet_baseid: TFIBIntegerField;
    mdsImportAsnInWMSoperdate: TFIBDateTimeField;
    mdsImportAsnInWMSOUTLET_NAME: TFIBStringField;
    pmWMS: TPopupMenu;
    actExportSortToWMS: TAction;
    actExportSortToWMS1: TMenuItem;
    WMS1: TMenuItem;
    DocPosALCOHOL_PERCENT: TFloatField;
    actAkt1: TAction;
    actAkt2: TAction;
    N130: TMenuItem;
    N131: TMenuItem;
    N132: TMenuItem;
    cxLabel3: TcxLabel;
    cxDBse_PercentDiscount: TcxDBSpinEdit;
    DocNaklPERCENT_DISCOUNT: TFIBFloatField;
    actExportOrderToWMS: TAction;
    WMS2: TMenuItem;
    actImportFromWMS: TAction;
    DocPosFIXED_PRICE: TFIBFloatField;
    PrintNaklNew: TAction;
    PrintNaklNew1: TMenuItem;
    PrintNaklNew2: TAction;
    PrintNaklNew21: TMenuItem;
    DocPosSPRAV_MATER_CATEGORY_NAME: TMegaStringField;
    DocNaklDATE_PDVSTAVKA: TDateTimeField;
    actPrintExcel: TAction;
    actPrintExcel1: TMenuItem;
    btnAPIFOCUSApi: TButton;
    grpTRANSPORT_TIME: TGroupBox;
    btnTRANSPORT_TIMESave: TSpeedButton;
    pnlTRANSPORT_TIME: TPanel;
    lsTRANSPORT_TIME: TLabel;
    cbTRANSPORT_TIME_MM: TComboBox;
    cbbTRANSPORT_TIME_HH: TComboBox;
    actCSV: TAction;
    N133: TMenuItem;
    N134: TMenuItem;
    strngfldListsDocPosGDOCUMENT: TMegaStringField;
    intgrfldDEBET_KOD_MATERDocPosDOC_GTD_RECID: TIntegerField;
    intgrfldDEBET_KOD_MATERDocPosDOC_GTD_BASEID: TIntegerField;
    chkIncludeOkom: TcxDBCheckBox;
    btnVekselAdd: TButton;
    actPrintLVZ: TAction;
    pLvz: TMenuItem;
    gPositionsCopyPast: TMenuItem;
    gCopy: TMenuItem;
    gPast: TMenuItem;
    DocPoscode: TFIBStringField;
    actExportAktATB: TAction;
    XML1: TMenuItem;
    N135: TMenuItem;
    DocPosCOUNT_PACK_BOX: TIntegerField;
    actPrint300War: TAction;
    N1210: TMenuItem;
    actTestReportL: TAction;
    actPrintSpecInvoiceUKR: TAction;
    N136: TMenuItem;
    actTestPrint_F2: TAction;
    actPrintNaklInPathway: TAction;
    mnPrint11: TMenuItem;
    actPrintTTNNakl: TAction;
    N137: TMenuItem;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEH1DrawFotterCell(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEH; Rect: TRect; State: TGridDrawState);
    procedure DBGridEH1Enter(Sender: TObject);
    procedure DocNaklAfterOpen(DataSet: TDataSet);
    procedure DocNaklNewRecord(DataSet: TDataSet);
    procedure GrOper_CEButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure DK_FROM_CEButtonClick(Sender: TObject;AButtonIndex:Integer);
    procedure DK_TO_CEEnter(Sender: TObject);
    procedure GrOper_CEEnter(Sender: TObject);
    procedure DocNaklOPERDATEChange(Sender: TField);
    procedure DocNaklKOD_OPERChange(Sender: TField);
    procedure DocNaklDK_FROMChange(Sender: TField);
    procedure DocNaklDK_TOChange(Sender: TField);
    procedure DocPosKOD_MATERChange(Sender: TField);
    procedure DocNaklV1Change(Sender: TField);
    procedure DocNaklPRICETYPE_Change(Sender: TField);
    function GetRest: Double;
    procedure SumCalcFields(DataSet: TDataSet);
    procedure ACatalogExecute(Sender: TObject);
    procedure CloseFormExecute(Sender: TObject);
    procedure PrintExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure EditUpdate(Sender: TObject);
    procedure DBGridEH1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGridEH1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DeleteExecute(Sender: TObject);
    procedure InsertExecute(Sender: TObject);
    procedure InsertUpdate(Sender: TObject);
    procedure CreateDocExecute(Sender: TObject);
    procedure CreatePDVNaklExecute(Sender: TObject);
    procedure SumBeforeOpen(DataSet: TDataSet);
    procedure DocNaklAfterPost(DataSet: TDataSet);
    procedure SeparateNaklExecute(Sender: TObject);
    procedure CheckExecute(Sender: TObject);
    procedure DocPosAfterDelete(DataSet: TDataSet);
    procedure DocPosAfterClose(DataSet: TDataSet);
    procedure DocPosAfterOpen(DataSet: TDataSet);
    procedure DocPosAfterPost(DataSet: TDataSet);
    procedure DocPosBeforePost(DataSet: TDataSet);
    procedure DocPosNewRecord(DataSet: TDataSet);
    procedure DocPosCalcFields(DataSet: TDataSet);
    procedure PrintNaklExecute(Sender: TObject);
    procedure PrintNaklUpdate(Sender: TObject);
    procedure PrintInternalExecute(Sender: TObject);
    procedure PrintInternalUpdate(Sender: TObject);
    procedure CreateDocUpdate(Sender: TObject);
    procedure PrintNaklTMCExecute(Sender: TObject);
    procedure PrintSchetExecute(Sender: TObject);
    procedure FillRestsExecute(Sender: TObject);
    procedure PrintRetNaklExecute(Sender: TObject);
    procedure PrintActExecute(Sender: TObject);
    procedure ViewProtokolUpdate(Sender: TObject);
    function  CheckRest(PDVCheck: Boolean): Boolean;
    procedure PrintCopyUpdate(Sender: TObject);
    procedure PrintCopyExecute(Sender: TObject);
    procedure CopyPosExecute(Sender: TObject);
    procedure PastePosExecute(Sender: TObject);
    procedure OLD__PastePosExecute(Sender: TObject); // nirs 12.01.2023
    procedure DK_TO_CEChange(Sender: TObject);
    procedure ViewDocProvExecute(Sender: TObject);
    procedure PriceLabelsExecute(Sender: TObject);
    procedure PriceLabelsUpdate(Sender: TObject);
    procedure CreatePDVN_D2Execute(Sender: TObject);
    procedure DocNaklDK_CChange(Sender: TField);
    procedure PriceListExecute(Sender: TObject);
    procedure DBGridEH1SortMarkingChanged(Sender: TObject);
    procedure MakeDocExecute(Sender: TObject);
    procedure Order1Execute(Sender: TObject);
    procedure Order2Execute(Sender: TObject);
    procedure PribExecute(Sender: TObject);
    procedure PrintDolgExecute(Sender: TObject);
    procedure UntitledDocExecute(Sender: TObject);
    procedure SetNacenkaExecute(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure CheckPrnExecute(Sender: TObject);
    procedure cbOplClick(Sender: TObject);
    procedure DocNaklBeforePost(DataSet: TDataSet);
    procedure CheckPrnPosExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btSepClick(Sender: TObject);
    procedure SepExecute(Sender: TObject);
    procedure CopyPosHExecute(Sender: TObject);
    procedure PastePosHExecute(Sender: TObject);
    procedure IntitledDocBRClick(Sender: TObject);
    procedure AAExecute(Sender: TObject);
    procedure smTransChange(Sender: TObject);
    procedure DocNaklTRANSPORTChange(Sender: TField);
    procedure NotOtsrExecute(Sender: TObject);
    procedure aSetkaExecute(Sender: TObject);
    procedure aSetNacIndExecute(Sender: TObject);
    procedure miSchet2PrintClick(Sender: TObject);
    procedure aShowBaseidExecute(Sender: TObject);
    procedure aShowRealPriceExecute(Sender: TObject);
    procedure aShowOptPriceExecute(Sender: TObject);
    procedure PriceControlDataBeforeOpen(DataSet: TDataSet);
    procedure aDnacExecute(Sender: TObject);
    procedure aF1F2Execute(Sender: TObject);
    procedure aViewSysProtokolExecute(Sender: TObject);
    procedure aCpProtokolExecute(Sender: TObject);
    procedure aPrintProverExecute(Sender: TObject);
    procedure aShowRetPosExecute(Sender: TObject);
    procedure cbNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPriceColsClick(Sender: TObject);
    procedure aBrandsExecute(Sender: TObject);
    procedure aSetNacRoundExecute(Sender: TObject);
    procedure btnShowColClick(Sender: TObject);
    procedure lbForDesignReportDblClick(Sender: TObject);
    procedure aTakeAccExecute(Sender: TObject);
    procedure aGExecute(Sender: TObject);
    procedure actCreateOplDocExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEH1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure actShowLinkedDocsExecute(Sender: TObject);
    procedure areg_restExecute(Sender: TObject);
    procedure pmPrintPopup(Sender: TObject);
    procedure aCreateOplDocNoPosExecute(Sender: TObject);
    procedure aTransitExecute(Sender: TObject);
    procedure mselDK_TODKCheck(Sender: TObject);
    procedure mselDK_TOTradeOutletCheck(Sender: TObject);
    procedure actShowIndColor1Execute(Sender: TObject);
    procedure actFindTTNExecute(Sender: TObject);
    procedure DocPosBeforeDelete(DataSet: TDataSet);
    procedure aSendENaklExecute(Sender: TObject);
    procedure DocNaklBeforeEdit(DataSet: TDataSet);
    procedure actFindSortingPartyExecute(Sender: TObject);
    procedure PrintRecPriceExecute(Sender: TObject);
    procedure aSendToRegionUpdate(Sender: TObject);
    procedure aSendToRegionExecute(Sender: TObject);
    procedure aCreatePDVIncDocExecute(Sender: TObject);
    procedure aCreatePDVIncKorDocExecute(Sender: TObject);
    procedure aCreatePDVIncDocUpdate(Sender: TObject);
    procedure aSetDocExistsInOfficeExecute(Sender: TObject);
    procedure DrawPresentButton;
    procedure PrintActSpisanExecute(Sender: TObject);
    procedure printNaclOFExecute(Sender: TObject);
    procedure printNaclOFUpdate(Sender: TObject);
    procedure tbVozvrClick(Sender: TObject);
    procedure tbVozvrChPClick(Sender: TObject);
    procedure CreateVozvrat(aKod: integer);
    procedure actPrintTTNExecute(Sender: TObject);
    function CheckSubDiller(aDk: double): boolean;
    procedure FillShowCaseExecute(Sender: TObject);
    procedure actScetFactPrnExecute(Sender: TObject);
    procedure actNoteExecute(Sender: TObject);
    procedure actTransferExecute(Sender: TObject);
    procedure actPrintGiftExecute(Sender: TObject);
    procedure RxDBComboEdit1ButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actPrintSpravBExecute(Sender: TObject);
    procedure MenuItem5_Torg2Click(Sender: TObject);
    procedure actPrintTorg15Execute(Sender: TObject);
    procedure actPrintTorg16Execute(Sender: TObject);
    procedure PrintIntNaklExecute(Sender: TObject);
    procedure actPrintRbToTTNExecute(Sender: TObject);
    procedure actSelLinkDOcExecute(Sender: TObject);
    procedure actPrintSoprDToTNExecute(Sender: TObject);
    procedure actPrintSchetRExecute(Sender: TObject);
    procedure actPrintTorg13Execute(Sender: TObject);
    procedure actPrintMx3Execute(Sender: TObject);
    procedure actPrintM11Execute(Sender: TObject);
    procedure actPrintM4Execute(Sender: TObject);
    procedure aSetKolPrecentExecute(Sender: TObject);
    procedure actPrintOC1Execute(Sender: TObject);
    procedure actPrintOC2Execute(Sender: TObject);
    procedure actPrintOC4Execute(Sender: TObject);
    procedure actPrintOC4aExecute(Sender: TObject);
    procedure actPrintMB7Execute(Sender: TObject);
    procedure actPercentNaklExecute(Sender: TObject);
    procedure aSetPriceColExecuteExecute(Sender: TObject);
    procedure DocPosForENaklCalcFields(DataSet: TDataSet);
    procedure ItemTorg3Click(Sender: TObject);
    procedure actPrintMx1Execute(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure actStickerExecute(Sender: TObject);
    procedure actPrintActRExecute(Sender: TObject);
    procedure KursChange(Sender: TObject);
    procedure Kurs1Change(Sender: TObject);
    procedure actPrintBreakExecute(Sender: TObject);
    procedure actPrintBreakUpdate(Sender: TObject);
    procedure actGetIDExecute(Sender: TObject);
    procedure aktSubRentExecute(Sender: TObject);
    procedure actSubRent_ListExecute(Sender: TObject);
    procedure actNaklPosSplitUpdate(Sender: TObject);
    procedure actNaklPosSplitExecute(Sender: TObject);
    procedure aSetOFDogovorExecute(Sender: TObject);
    procedure aSetOFDogovorUpdate(Sender: TObject);
    procedure actCheckNextExecute(Sender: TObject);
    procedure actSubRent_ListUpdate(Sender: TObject);
    procedure actPrintDogovorExecute(Sender: TObject);
    procedure actPrintActSpisanNewExecute(Sender: TObject);
    procedure actPrintSpecExecute(Sender: TObject);
    procedure actPrintSpecUpdate(Sender: TObject);
    procedure actPrintInvoicePExecute(Sender: TObject);
    procedure actPrintInvoiceExecute(Sender: TObject);
    procedure actPrintSubRent_StronoExecute(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure actPrintInvoiceDeExecute(Sender: TObject);
    procedure aSendNaklToOfficeExecute(Sender: TObject);
    procedure tbAkcisClick(Sender: TObject);
    procedure actPrintInvoicePUpdate(Sender: TObject);
    procedure mselDK_TOChangeTO(Sender: TObject; const KOD_DK: Double;
      const SHORTNAME_DK: String);
    procedure actPrintInvoiceUpdate(Sender: TObject);
    procedure actPrintSpec_ReklExecute(Sender: TObject);
    procedure actPrintInvoiceP_ReklExecute(Sender: TObject);
    procedure actPrintInvoice_ReklExecute(Sender: TObject);
    procedure cxDBse_NacenkaExit(Sender: TObject);
    procedure DBDateEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actSpecificationParamsUpdate(Sender: TObject);
    procedure actSpecificationParamsExecute(Sender: TObject);
    procedure actPrintSpecInvoiceUpdate(Sender: TObject);
    procedure actPrintSpecInvoiceExecute(Sender: TObject);
    procedure PrintNaklOSExecute(Sender: TObject);
    procedure PrintNaklOSUpdate(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure Nakl_TransactionBeforeEnd(EndingTR: TFIBTransaction;
      Action: TTransactionAction; Force: Boolean);
    procedure actPrintInvoicePPExecute(Sender: TObject);
    procedure actPrintInvoice_ReklPPExecute(Sender: TObject);
    procedure actPrintPackListUpdate(Sender: TObject);
    procedure actPrintSpec_TNVEDExecute(Sender: TObject);
    procedure actPrintInvoice_TNVEDExecute(Sender: TObject);
    procedure actPrintInvoicePP_TNVEDExecute(Sender: TObject);
    procedure actUpdateNakl2EgaisExecute(Sender: TObject);
    procedure actUpdateNakl2EgaisUpdate(Sender: TObject);
    procedure actSetPdvCExecute(Sender: TObject);
    procedure actPrintPackListEnExecute(Sender: TObject);
    procedure actPrintPackListEnUpdate(Sender: TObject);
    procedure actPrintQualityCertificationExecute(Sender: TObject);
    procedure actPrinRealRusUpdate(Sender: TObject);
    procedure actPrinRealRusExecute(Sender: TObject);
    procedure dsNote_mCalcFields(DataSet: TDataSet);
    procedure actPrintActRekl_RuExecute(Sender: TObject);
    procedure actPrintActRekl_RuUpdate(Sender: TObject);
    procedure actPrintInvoiceTabClientUpdate(Sender: TObject);
    procedure actPrintInvoiceTabClientExecute(Sender: TObject);
    procedure actPrintGtdLinksExecute(Sender: TObject);
    procedure actPrintGtdLinksUpdate(Sender: TObject);
    procedure actPrintNaklImagesExecute(Sender: TObject);
    procedure actGovQualityExecute(Sender: TObject);
    procedure actPrintNaklVozvratExecute(Sender: TObject);
    procedure actActPPExecute(Sender: TObject);
    procedure actNaklVoronezhExecute(Sender: TObject);
    procedure actViewKartFormExecute(Sender: TObject);
    procedure actSplitPosByRestsExecute(Sender: TObject);
    procedure actSplitPosByRestsUpdate(Sender: TObject);
    procedure actSplitNaklPosByPartyUpdate(Sender: TObject);
    procedure actSplitNaklPosByPartyExecute(Sender: TObject);
    procedure btnCheckWithColClick(Sender: TObject);
    procedure aSetPriceColExecuteUpdate(Sender: TObject);
    procedure actStartBPAgreementOfProductionReturnExecute(Sender: TObject);
    procedure actStartBPContragentVIPExecute(Sender: TObject);
    procedure actPrintBirkaExecute(Sender: TObject);
    procedure actPrintBirkaUpdate(Sender: TObject);
    procedure lcbZayavkaPropertiesInitPopup(Sender: TObject);
    procedure actStartBPRemoveBlockingOfMinimalOrderExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actInsNarExecute(Sender: TObject);
    procedure actUpdateNarExecute(Sender: TObject);
    procedure actDelNarExecute(Sender: TObject);
    procedure actInsNarUpdate(Sender: TObject);
    procedure actUpdateNarUpdate(Sender: TObject);
    procedure actDelNarUpdate(Sender: TObject);
    procedure actPrintOrderExecute(Sender: TObject);
    procedure GrOper_CEPropertiesChange(Sender: TObject);
    procedure actPrintMETROExecute(Sender: TObject);
    procedure actPrintMETROUpdate(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure btnReturnCauseClick(Sender: TObject);
    procedure actStartBPFinanceCoordinationOfGettingProductOnCreditExecute(
      Sender: TObject);
    procedure actAllowNotCheckForNewTTExecute(Sender: TObject);
    procedure RxDBComboEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblCFOOtgrClick(Sender: TObject);
    procedure MegaSelCFOtoChange(Sender: TObject);
    procedure actPrintNaklF2WithoutHeaderUpdate(Sender: TObject);
    procedure actPrintNaklF2WithoutHeaderExecute(Sender: TObject);
    procedure actPrintMailBonusExecute(Sender: TObject);
    procedure actPrintNaklNotLVIExecute(Sender: TObject);
    procedure actAddPosAntiBrandExecute(Sender: TObject);
    procedure actAddFivePoistionExecute(Sender: TObject);
    procedure actAddFivePoistionUpdate(Sender: TObject);
    procedure aSendENaklKodMaterExecute(Sender: TObject);
    procedure chkIsBanketEditing(Sender: TObject; var CanEdit: Boolean);
    procedure DocNaklIS_BANKETChange(Sender: TField);
    procedure N96Click(Sender: TObject);
    procedure tbSertificatClick(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure miOKKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Nakl_TransactionAfterEnd(EndingTR: TFIBTransaction;
      Action: TTransactionAction; Force: Boolean);
    procedure actStartBusinessSellingForTTWithoutLicenseExecute(
      Sender: TObject);
    procedure mdsIncludeOkomis_includedChange(Sender: TField);
    procedure N98Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure actCheckBaseNaklExecute(Sender: TObject);
    procedure actCheckBaseNaklUpdate(Sender: TObject);
    procedure actCheckBaseNakl_medExecute(Sender: TObject);
    procedure actCheckBaseNakl_blgExecute(Sender: TObject);
    procedure actCheckBaseNaklFeodosiaClick(Sender: TObject);
    procedure actSelfExportExecute(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure actCheckBaseNaklOKZClick(Sender: TObject);
    procedure actUnCheckBaseNakl_KhortitsaClick(Sender: TObject);
    procedure actUnCheckBaseNakl_MedClick(Sender: TObject);
    procedure actUnCheckBaseNakl_BlgClick(Sender: TObject);
    procedure actUnCheckBaseNakl_FeodClick(Sender: TObject);
    procedure actUnCheckBaseNakl_OKZClick(Sender: TObject);
    procedure actUnCheckBaseNakl_allClick(Sender: TObject);
    procedure DocNaklDONT_USE_SPEC_PRICEChange(Sender: TField);
    procedure actCreateNaklAkciiExecute(Sender: TObject);
    procedure actCheckBaseNaklTOP14Click(Sender: TObject);
    procedure actUnCheckBaseNakl_TOP14Click(Sender: TObject);
    procedure actPrintTTN2Execute(Sender: TObject);
    procedure ToolButton22Click(Sender: TObject);
    procedure actPrintEANBoxExecute(Sender: TObject);
    procedure N105Click(Sender: TObject);
    procedure N95Click(Sender: TObject);
    procedure actPrintActMaterialExecute(Sender: TObject);
    procedure acPrintSertifExecute(Sender: TObject);
    procedure acPrintSertifKrasnoyarskExecute(Sender: TObject);
    procedure acPrintSertifRostovExecute(Sender: TObject);
    procedure acPrintSertifPostovDateExecute(Sender: TObject);
    procedure acPrintSertifVoronegExecute(Sender: TObject);
    procedure ActPrintImportZ_ZTPPExecute(Sender: TObject);
    procedure G3Click(Sender: TObject);
    procedure ActPrintImport_ActZExecute(Sender: TObject);
    procedure ActPrintImport_CMRExecute(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure actPrintSpravkaBExecute(Sender: TObject);
    procedure acPrintSertifYaroslavlExecute(Sender: TObject);
    procedure acPrintSertifKazanExecute(Sender: TObject);
    procedure acPrintSertifRostovExcelExecute(Sender: TObject);
    procedure actTransferStoreExecute(Sender: TObject);
    procedure actSendInvoiceExecute(Sender: TObject);
    procedure actGroupNameMAterExecute(Sender: TObject);
    procedure actInsNarUnloadContExecute(Sender: TObject);
    procedure actInsNarUnloadContUpdate(Sender: TObject);
    procedure btnStorageInClick(Sender: TObject);
    procedure btnStorageOutClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actPrintCheckExecute(Sender: TObject);
    procedure actCreatePDVNaklReportsExecute(Sender: TObject);
    procedure actSendNaklExecute(Sender: TObject);
    procedure actSendWesternExecute(Sender: TObject);
    procedure actPrintSpecInvoiceNewExecute(Sender: TObject);
    procedure MegaSelContract1Change(Sender: TObject);
    procedure ActPasteFromExcelExecute(Sender: TObject);
    procedure ActPasteFromExcelUpdate(Sender: TObject);
    procedure ActDocListLocateExecute(Sender: TObject);
    procedure actSplitListExecute(Sender: TObject);
    procedure N116Click(Sender: TObject);
    procedure N117Click(Sender: TObject);
    procedure N118Click(Sender: TObject);
    procedure N119Click(Sender: TObject);
    procedure Torg2ForClientClick(Sender: TObject);
    procedure N210Click(Sender: TObject);
    procedure N211Click(Sender: TObject);
    procedure N212Click(Sender: TObject);
    procedure dbf1Click(Sender: TObject);
    procedure actStickeringExecute(Sender: TObject);
    procedure actStickeringUpdate(Sender: TObject);
    procedure actShippingPalletsExecute(Sender: TObject);
    procedure actShippingPalletsUpdate(Sender: TObject);
    procedure N124Click(Sender: TObject);
    procedure actPrintMarkTaraExecute(Sender: TObject);
    procedure N128Click(Sender: TObject);
    procedure N129Click(Sender: TObject);
    procedure actExportToWMSExecute(Sender: TObject);
    procedure actExportSortToWMSExecute(Sender: TObject);
    procedure actAkt1Execute(Sender: TObject);
    procedure actAkt2Execute(Sender: TObject);
    procedure actExportOrderToWMSExecute(Sender: TObject);
    procedure actImportFromWMSExecute(Sender: TObject);
    procedure actPrintExcelExecute(Sender: TObject);
    procedure btnAPIFOCUSApiClick(Sender: TObject);
    procedure btnTRANSPORT_TIMESaveClick(Sender: TObject);
    procedure pnlTRANSPORT_TIMEClick(Sender: TObject);
    procedure actCSVExecute(Sender: TObject);
    procedure N134Click(Sender: TObject);
    procedure btnVekselAddClick(Sender: TObject);
    procedure actPrintLVZExecute(Sender: TObject);
    procedure gCopyClick(Sender: TObject);
    procedure gPastClick(Sender: TObject);
    procedure actExportAktATBExecute(Sender: TObject);
    procedure N135Click(Sender: TObject);
    procedure actPrint300WarExecute(Sender: TObject);
    procedure actTestReportLExecute(Sender: TObject);
    procedure actPrintSpecInvoiceUKRExecute(Sender: TObject);
    procedure actTestPrint_F2Execute(Sender: TObject);
    procedure actPrintNaklInPathwayExecute(Sender: TObject);
    procedure actPrintTTNNaklExecute(Sender: TObject);



  private
    S0, SB, S, SD: Double;
    CountInBox: Double;
    Brutto: Double;
    BruttoMer:string;
    aCheckWithColNumber : integer;
    aCanFreeForm,isAlphaCol : boolean;

    FProvStatus: integer; // статус проводки в документе
    FIsStickering: integer;  //стикеруестя дебитор или нет
    FDesignReport: boolean; //added by lutsenko 01/04/2002 -
                            //internal variable - switch for designing report

    printNaklIf_different_Addr:boolean; // sys_base_params.PRINT_NAKL_DIF_CFO (def=1) печатать накладную если ADDR_FROM<>ADDR_TO

    NaklPervChange : boolean;
    NaklContractChange : boolean;
    PrintOSNakl:boolean;
    FDSDocType: TMegaDSDocType;
    lstDoc:TList; //Список привязанных документов по операции
    NaklOutletRecid: integer;  // параметры ТТ в накладной
    NaklOutletBaseid: integer;
    FIsUnloadContainers:integer;
    FIsShippingPallets:integer;// признак что это отгрузка паллет
    FIsStickeringNakl:integer;// признак что это отгрузка паллет
    FInsertedPosIds: TList;
    pmp_items: TdmDocPopupMenuPrint_Items;

    function DrawState: Word;
    procedure AddMater(var Message: TMessage); message 39980;
    procedure AddSelectedMater;
    procedure LocateDocPos(Insert:boolean);
    { private declarations }

    procedure InternalMakeDoc(aCreateLinkedOplDoc : boolean);

    function GetVozvrChP: boolean;
    function GetNewDocNaklNumber:integer;

    // первичная документация
    procedure InsertNaklPerv(msg : string; r: integer);
    procedure DeleteNaklPerv;
    function  GetNaklPervComment : string;
    function  GetProvStatus : integer;
    function  isStickering : integer;


    function CanChangeCFO:boolean;
    procedure PrintSoprDocToTN(tt:smallint);
    procedure GetRestSplit;

    procedure CalcColFordocNaklPosRecord;
    function isNaklProv : boolean; overload;
    procedure UpdatePosPrices(Param5IsNull: Boolean = False);
    function GetCfoCity(cfo: Integer): Integer;
    procedure GetCfoIsUnloadCONTAINERS(cfo: Integer);
    procedure GetIsShippingPallets(naklRecid,naklBaseid: Integer);
    procedure GetIsStickering(naklRecid, naklBaseid: Integer);
    procedure PrintReport(const ReportName: string);
    procedure CheckSelfExportState;
    procedure LogException(ExceptObj: TObject; ExceptAddr: Pointer; IsOS: Boolean);
  protected
    o_DK_FROM,o_DK_TO,o_DK_C:variant;
    balanceDType:integer;

    fErrLink:boolean;
    sErrLink:string;

    procedure SetGridColumnNames;
    procedure UpdateDK_C_Controls;
    procedure SetDK_C(aDialog: TMegaSelDKDialog);
    procedure CheckParentDoc;

    procedure CheckDK_TO(aKod_DK: Double);
    procedure CheckDogovor(aKOD_DK: double);

    procedure CheckTradeOutlet_TO(aDialog: TMegaSelDKDialog);
    procedure CheckTradeOutlet_Name(aDialog: TMegaSelDKDialog);
    procedure CheckTradeOutlet_Category(aDialog: TMegaSelDKDialog);

    procedure InitOutletNameFromNaklData;

    //-- realization of IMegaDocNaklForm
    procedure SetNotSetOtsr(aValue: Boolean);
    procedure SetNoOtsr(aValue: Boolean);

    procedure SetGroupOper(aValue: integer);
    procedure SetKodOper(aValue: integer);
    procedure ExecuteGetOperDialog;

    procedure SetDKFrom(aValue: double);
    function GetDKFrom: double;

    procedure ExecuteDKFromDialog;

    procedure SetDKTo(aValue: double);
    procedure SetDKC(aValue: double);

    procedure SetDocDate(aDate: TDateTime);
    procedure SetOperDate(aDate: TDateTime);

    procedure SetDocNumber(aNumber: integer);

    procedure SetPriceType(aValue : integer);

    procedure NaklEdit;
    procedure NaklPost;

    function GetQuery: TMegaQuery;
    function GetDocPos: TMegaDataSetParent;

    procedure DoAfterPost;

    function GetRecID: integer;

    procedure NaklCopyPos;

    procedure NaklCreatePDVNakl;

    function GetTransaction: TMegaTransaction;

    function GetSum: double;

    procedure InitDeliveryTimeFromNaklData;

    Function CheckAndMakeIfDocNeedSogl(aQuiet : Boolean): Boolean;

    function SaveDoc(InExport: Boolean = False): Boolean;
    function CheckFromSubDog_ToNacenka:boolean;

    function ShowError:integer;
    procedure checkReturnCause;
    //Проверка возможности изменения документа, исходя из статуса STATE
    procedure CheckAllowChangeByNaklState;
    procedure SkidckaNDSUchet;
  public
    paramCheck5Pos: Boolean;
    aNaklSaved: Boolean;
    bSelTT: boolean;
    is_leave: boolean;
    HandMethod:boolean;
    FOPERDATE: TDateTime;
    EditNaklPos: TEditNaklPos;
    IsPrihod: Integer;
    Schet: String;
    KOD_CHANGED: Boolean;
    OLD_KOD_MATER: Double;
    OLD_REST_MATER: Double;
    PosModified: Boolean;
    DontCheckRest: Boolean;
    SepRest: Boolean;
    NoEvent:Boolean;
    AntiRecusria: Boolean;
    NoTr:Boolean;
    NoOtsr,NotSetOtsr:Boolean;
    POS_OTSR,DK_OTSR,POS_PRIOR,DK_PRIOR:integer;
    SYSGALKA:boolean;
    DK_TO_BASEID:integer;
    DefaultPrice:integer;
    AllowPrice:set of byte;
    ClientDK:double;
    ClientDKBaseId:integer;
    FORCEPRICE:boolean;
    ChangeZakSpravForbidden:boolean;
    CheckPriceForbidden:boolean;
    NoPos:boolean;
    Loaded:boolean;
    LOCKPRICE:integer;

    //  0  Разрешить менять цены
    //  1  Запретить менять при наличии колонки
    //  2  Разрешить менять в +-0.01 по колонкам, остальніе свободны
    //  3  Разрешить менять в +-0.01
    OPERSTATUS: Integer;
    verKassa:integer;
    protokol:integer;//протокол для датекса 0- датекс; 1- криптон
    DISCOUNT:Integer;// яункция скидки работала криво в старой длл (были перевернуты параметры) в новой все ок. поэтому 0- старый вызов; 1- новый

    PDVOPERSTATUS: integer;
    // см константы ios... (модуль uConst)
    ShowIndColor:boolean;
    ChangeKolich:boolean;
    CheckRecNo:integer;
    NextCheckFlag:boolean;
    DatePart:TDateTime;
    WhereNaklPosSQL: String;// Список рекайди накладных,на базе которых собирать данную

    MainTableName: String;
    SubTableName: String;

    PU_PartyDate: TDatetime;
    PU_PartyNumber: string;
    fSetAddr: Boolean;
    SelfExportState: Integer;
    procedure Waiting(Sender: TObject; var Done: Boolean);
    function UseNaklTranForInvoces: Boolean;
    procedure SetRules;
    procedure SetOtsr;
    procedure MakeSepRestExecute;
    procedure PrintCheck(FirstPos:Boolean);
    procedure AddrPost(aSelTT:TMegaSelDKDialog);
    function AllowAll: boolean;
    function CheckPrice:boolean;
    procedure ChangeSysProtokol(table_name:string;id:string);
    function IsBreakNakl:boolean;
    procedure DeletePosNakl(multiDel:integer);
    Procedure SplitNakl2Party();
    procedure SplitNakl2PartyNew;
    procedure OpenDataSetParty();
    procedure GetLinkDocParty();
    function Round2(x: double): double;
    procedure PrintCheckPos();
    procedure GetStateSelfExport();
    function InitializeComPort2():boolean;
    procedure GetDocParty(Date: TDatetime);
    procedure CheckTypeOperParty(Date: TDateTime);
    procedure GetAllParty(date_party:TDateTime;kod_mater:double);
    function  GetPartyNumber(date_party:TDateTime;kod_mater:double):string;
    procedure CheckCorrectPeresort(var exept:string;var result:integer);
    procedure SetCFO(aCFO: integer);
    procedure CheckNaklBase(numAkc:integer);
   //снимаем пометку базовой накладной по конкретной акции
    procedure UnCheckNaklBase(numAkc:integer);
    procedure AddMissingColumn;
    //проверка на создание накалдной по чп (задача от Нарыкова)
    procedure CheckCreateNaklCHP(var doctype_to:string;var group_oper_to:integer;var kod_oper_to:integer);
    function CreateNaklCopy2CHP(doctype_to:string;group_oper_to,kod_oper_to:integer):boolean;
    //снимаем пометку по всемакциям
    procedure UnCheckNaklBaseAll;
{    constructor Create(AOwner: TComponent;
                       RECID: Integer; BASEID: Integer;
                       OPERDATE: TDateTime;
                       FormKod: Integer);
}
    constructor Create(AOwner: TComponent;
                       RECID: Integer; BASEID: Integer;
                       aDocType: string;
                       OPERDATE: TDateTime;
                       FormKod: Integer;
                       aDestNaklsList: String = '');

    destructor Destroy; override;
    procedure SendENakl(aOutKodMater: boolean = false; aShowInfo:boolean=true);

    procedure SetPriceCol(aCol, aAllPrice: integer);
    //Разрешить отгрузку без проверки ассортимента для новой точки
    procedure AllowNotCheckForNewTT(aOutletRecid, aOutletBaseid:integer);
    { public declarations }
    procedure UpdateActions; override;
    procedure SetAddr(StatusOper: integer);
    procedure SaveAddr;
    class function SetSelfExport(NaklRecid, NaklBaseId: Integer; tran: TMegaTransaction = nil): Integer; static;
    class procedure PrintTorg13(NaklRecId, NaklBaseId: Integer); static;
    class function IsNaklProv(RecId, BaseId, FormType: Integer): Boolean; overload; static;

    procedure Refresh_NaklPos;
  end;

var
  BUF_FORMKOD: Integer;
  BUF_RECID: Integer;
  BUF_BASEID: Integer;
  BUF_NSDINSUMMA: Integer;
  BUF_OPERDATE: string; //nirs 12.01.2023
  WasRepainted:boolean=false;
  OplCheckEnable:boolean;  //++ Для временной блокировки события cbOplClick во время программного изменения
  SumVpl:Double; //++ Сумма к оплате используется если изменяется оплаченная накладная
  fp:Variant;
  LastErrorBool: Boolean; // Результат последней операции (Истина-успешно, Ложь-ошибка)
  sumPDVScidcka: Float; // Сумма с учетом скиндки НДС

  lvi:bool = false; // [gsa:180220]

  gDNP:  gDocNP;

procedure SendNakl2Email(aOwner:TComponent;aRecID,aBaseID:Integer; aDNForm:TDocNaklForm=nil; aShowInfo:boolean =true);



implementation
uses SpDk, SelectOper, SelectMaterForm, MakePDVN, ufrmListSplit,
  {$IFDEF USE_FR3} udmPrintInternalDoc,
  {$ELSE}  PrintInternalDoc, PrintDolg, UntitledDocRep,{$ENDIF}
  {$IFDEF D10+}CommonModulesBusinessProcesses,CommonModulesBusinessProcesses_V3,{$ENDIF}
  ViewSysProtokol, ViewDocProv, MakePDVN_D2, IndControl, PriceLabel, SelectDocType,
  SpLSh, rxStrUtils,SelNaklPrn, DocProv,AAMake,ChProtokol, SelectRetPos, ColSet, BrandAdd,
  PrintNaklTara, uUtils,GenCodes, Main, PDVNaklList, ufmLinkedDocs, uConst,
  PrintNakl2, uMegaObjTradeOutlet, uMegaDSDK, uMegaSendMail, uGlobalVars, PrintRetNakl2,
  ufmPDVDocsEdit, uUtilSortSklad, ufmDocNalkPervComment, ufmGtd, ToWord, ufmSelLinkDoc,
  PrintNakl2R, uPrint_FormsToOFond, udmPriceListRep,ufmSticker, ufmSendSogl,
  ufmSpecificationParams, ufmActBreakTrailer, ufmQualityCertBlank,
  {$IFDEF RX_LIB_2_7_7}rxVCLUtils,{$ELSE}VCLUtils,{$endif}
  uSendRegion2, ufmReturnsMake, ViewKart, ufmSortingLot, ufmViewDocAnalizProtocol, ufmDialogBPContragentVIP, ufmDialogBPRemoveBlockingOfMinimalOrder,
  uUtilsDistr, uAktTorg2Params, ufmDocOrderSkladPos, ufmDocReturnCause,
  ufmDialogBPCustom,ufmAddFivePosition,ufrmSaveUncheckState,
  ufmCertificateToMater, uPrintOKK,
  ufmDialogBPDistributionSellingForTTWithoutLicense, uCreateOrderEDI,
  UFV, udmTTNDocRep, TypInfo,
  ufmStoragePlacement, ufmStorageShip,DocumentInvoices_V3, wsWMSIntegration ,
   {[gsa] 28-08-19} httpsend, SimpleXML, wsWMSGSAServiceLicences, UnitVekselAdd
  ,uUtilsDbg // add new nirs 09_04_2024 fordebugsql
  ,ufmSelCFOForPrint // add new nirs 27_09_2024
   ;
{$R *.DFM}

procedure TDocNaklForm.LogException(ExceptObj: TObject; ExceptAddr: Pointer; IsOS: Boolean);


begin
{  TmpS := 'Exception ' + ExceptObj.ClassName;
  if ExceptObj is Exception then
    TmpS := TmpS + ': ' + Exception(ExceptObj).Message;
  if IsOS then
    TmpS := TmpS + ' (OS Exception)';
  MainForm.reInfo.Lines.Add(TmpS);
  ModInfo := GetLocationInfo(ExceptAddr);
  MainForm.reInfo.Lines.Add(Format(
    '  Exception occured at $%p (Module "%s", Procedure "%s", Unit "%s", Line %d)',
    [ModInfo.Address,
     ModInfo.UnitName,
     ModInfo.ProcedureName,
     ModInfo.SourceName,
     ModInfo.LineNumber]));
  if stExceptFrame in JclStackTrackingOptions then
  begin
    MainForm.reInfo.Lines.Add('  Except frame-dump:');
    I := 0;
    ExceptionHandled := False;
    while (not ExceptionHandled) and
      (I < JclLastExceptFrameList.Count) do
    begin
      ExceptFrame := JclLastExceptFrameList.Items[I];
      ExceptionHandled := ExceptFrame.HandlerInfo(ExceptObj, HandlerLocation);
      if (ExceptFrame.FrameKind = efkFinally) or
          (ExceptFrame.FrameKind = efkUnknown) or
          not ExceptionHandled then
        HandlerLocation := ExceptFrame.CodeLocation;
      ModInfo := GetLocationInfo(HandlerLocation);
      TmpS := Format(
        '    Frame at $%p (type: %s',
        [ExceptFrame.FrameLocation,
         GetEnumName(TypeInfo(TExceptFrameKind), Ord(ExceptFrame.FrameKind))]);
      if ExceptionHandled then
        TmpS := TmpS + ', handles exception)'
      else
        TmpS := TmpS + ')';
      MainForm.reInfo.Lines.Add(TmpS);
      if ExceptionHandled then
        MainForm.reInfo.Lines.Add(Format(
          '      Handler at $%p',
          [HandlerLocation]))
      else
        MainForm.reInfo.Lines.Add(Format(
          '      Code at $%p',
          [HandlerLocation]));
      MainForm.reInfo.Lines.Add(Format(
        '      Module "%s", Procedure "%s", Unit "%s", Line %d',
        [ModInfo.UnitName,
         ModInfo.ProcedureName,
         ModInfo.SourceName,
         ModInfo.LineNumber]));
      Inc(I);
    end;
  end;
  MainForm.reInfo.Lines.Add('');   }
end;
constructor TDocNaklForm.Create(AOwner: TComponent;
                                RECID: Integer; BASEID: Integer;
                                aDocType: string;
                                OPERDATE: TDateTime; FormKod: Integer; aDestNaklsList: String = '');
var
  ff, F :TField;
  Table_Name: String;
begin
  inherited Create(AOwner);
  paramCheck5Pos:= IntfMegaDBCommon.GetParam('CHECK_5_POS', '0') = '1';
  HandMethod:=false;
  bSelTT:=true;
  NaklOutletRecid:=0;
  NaklOutletBaseid:=0;

  aNaklSaved := RECID > 0;

  // Список рекайди накладных,на базе которых собирать данную
  WhereNaklPosSQL:= aDestNaklsList;
  FProvStatus:=-1;
  FIsStickering:= -1;
  // btnNote.Visible := IntfMegaDBCommon.IsOffice;
  // Action виден для Офиса или когда Счёт-фактура
  // MakeDoc.Visible := ((IntfMegaDBCommon.IsOffice) AND (FormKod = 5));
  // DBEdit3.Visible:= IsRussia or IsUsa;
  miOKK.Visible:= IsRussia;
  miEDI.Visible:= IsRussia;
  cxLblEgais.Visible:= IsRussia;
  cxDBTEEgais.Visible:= IsRussia;
  cxDBTextEditEgaisCode.Visible:= IsRussia;
  cxLabelEgaisCode.Visible:= IsRussia;
  //проверяем ст. оператора
  tbSendNakl.Enabled:= ((IntfMegaAccessManager.GetUserAccess = iuaSystem)
                     or (IntfMegaAccessManager.GetUserRole='DEVELOPER')
                     or (IntfMegaAccessManager.GetUserAccess = iuaStOperator)
                     or (IntfMegaAccessManager.GetUserAccess = iuaBuhgalter));

  AntiRecusria:=false;
  NoOtsr:=false;
  NotSetOtsr:=false;
  NoEvent:=false;
  FOPERDATE := OPERDATE;
  Nakl_Transaction.Active := True;
  NaklPervChange :=false;
  NaklContractChange:= False;
  NextCheckFlag:=false;
  CheckRecNo:=0;
  PrintOSNakl:=false;

  DM.SYS_FORM_TYPES.Locate('FORM_KOD', FormKod, []);
  MainTableName := DM.SYS_FORM_TYPES.FieldByName('MAIN_TABLE').AsString;
  SubTableName := DM.SYS_FORM_TYPES.FieldByName('SUB_TABLE').AsString;

  Source.DataSet.Close;

  if IsPartUchet3 and (MainTableName='DOC_NAKL') then
  begin
    F:= TStringField.Create(DocPos);
    F.FieldName:= 'EGAIS_ADD_NUM';
    F.DataSet:= DocPos;
    DocPos.InsertSQL.Text:= ReplaceStr(DocPos.InsertSQL.Text, '/*, EGAIS_ADD_NUM */', ', EGAIS_ADD_NUM');
    DocPos.InsertSQL.Text:= ReplaceStr(DocPos.InsertSQL.Text, '/*, ?EGAIS_ADD_NUM */', ', ?EGAIS_ADD_NUM');
    DocPos.UpdateSQL.Text:= ReplaceStr(DocPos.UpdateSQL.Text, '/*, EGAIS_ADD_NUM = ?EGAIS_ADD_NUM */', ', EGAIS_ADD_NUM = ?EGAIS_ADD_NUM');
  end;

  TMegaRDataset(Source.DataSet).Params[0].AsInteger := RECID;
  TMegaRDataset(Source.DataSet).Params[1].AsInteger := BASEID;
  try
    Source.DataSet.Open;
    lcbZayavkaPropertiesInitPopup(nil);
    if IsRussia then
      lblCFOOtgrClick(nil)
    else
      lblCFOOtgr.Visible:= False;
  except
{ ----------------- Added by Lion in 26.06.2008 ---------------- }
{ Какое-то время некоторые базы будут необновленные - поэтому нужно,
  если что, дать возможность работать новой версии программы со старыми базами.
  Позже этот код можно будет убрать (когда во всех базах будут эти поля)
}
    FreeVar(DocNaklZAYAVKA_ID);
    FreeVar(DocNaklSENDED_TO_OFFICE);
    DocNakl.SQLs.InsertSQL.Text:=
                            ReplaceText(
                            ReplaceText(
                            ReplaceText(DocNakl.SQLs.InsertSQL.Text,
                            ',ZAYAVKA_ID,SENDED_TO_OFFICE', ''),
                            ',?ZAYAVKA_ID,?SENDED_TO_OFFICE', ''),
                            ',ZAYAVKA_ID=?ZAYAVKA_ID,SENDED_TO_OFFICE=?SENDED_TO_OFFICE', '');
    pnlZayavka.Visible:= False;
    lcbZayavka.DataBinding.DataField:= '';
    Source.DataSet.Open;
{ ----------- End of addition by Lion in 26.06.2008 ----------- }
  end;
  //-- объект - тип документа
  FDSDocType:= TMegaDSDocType.Create(Self);
  FDSDocType.Database:= IntfDBProvider.GetDB;
  FDSDocType.Transaction:= Nakl_Transaction;
  if aDocType='' then
    if not Source.DataSet.IsEmpty then
      aDocType:=Source.DataSet.FieldByName('DOCTYPE').asString;
  FDSDocType.OpenByDocType(aDocType);
  chkIsBanket.visible:=IntfMegaDBCommon.GetParam('CHECK_BANKET', '0') = '1';
  if RECID = 0 then
  begin
    Source.DataSet.Insert;

    Caption := FDSDocType.FieldDocName.AsString ;

    DocNaklCFO.AsInteger:= IntfMegaDBCommon.GetCFONakl;

    MegaSelCFO.Enabled:= false;

    tbVozvr.Enabled:= false;
    tbVozvrChP.Enabled:= false;
    smTrans.enabled:=((IntfMegaDBCommon.IsOffice) or (IntfMegaAccessManager.GetUserRole = 'TRANSPORT_AUDIT')
                                                  or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR'));
  end
  else
  begin

    // Source.DataSet.Edit;
    balanceDType:=IntfMegaCommon.GetBalanceByDocType(Source.DataSet.FieldByName('DOCTYPE').AsString);
    Caption := Source.Dataset.FieldByName('DOC_NAME_').AsString;
    if (Source.Dataset.FieldByName('IS_BANKET').AsInteger=1) then
      Caption:= Caption+' (БАНКЕТНАЯ)';
    {+++}
    dm.GetOperStatus(Nakl_Transaction, DocNaklGROUP_OPER.AsInteger, DocNaklKOD_OPER.AsInteger,OPERSTATUS,PDVOPERSTATUS);
    MegaSelCFO.Enabled:= OPERSTATUS in [iosOFInternalMove,iosOFFromToRoad,iosOFPurchasingWriteOff];
    tbVozvr.Enabled:= OPERSTATUS = iosReturnFromClientPattern;
    tbVozvrChP.Enabled:=GetVozvrChP;

    SetRules;
    //----------------------------------------------------
    // установка названия текущей торг точки
    InitOutletNameFromNaklData;
    InitDeliveryTimeFromNaklData;

    smTrans.enabled:= ((IntfMegaDBCommon.IsOffice) or (((IntfMegaAccessManager.GetUserRole = 'TRANSPORT_AUDIT')
     or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR')) and (DocNaklWITH_SUM_TRANSPORT.AsInteger =1)));

  end;
  KOD_CHANGED := False;
  PosModified := False;
  EditNaklPos := TEditNaklPos.Create(Self);
  DocNaklV1Change(nil);
  AlphaStarted := False;

  //-- added by lutsenko 02.11.2002
  MegaSelCFO.Open;
//!!! тест
  MegaSelCFOfrom.Open;
  MegaSelCFOto.Open;
//

   MegaSelBrandCase2.Open;
  //--
  DrawPresentButton; //--Inserted by Ignat K.

  //++
  if (DocNaklSTATE.AsInteger = idsKassa) or (DocNaklSTATE.AsInteger = idsBug)
   or (DocNaklSTATE.AsInteger = idsOFDogovor)
  then
  begin
    OplCheckEnable:=false;
    cbOpl.Checked:=true;
  end;
  OplCheckEnable:=true;
  if not (grKassir in aIniParams.UserGroup) then
  begin
    Rf1.Visible:=false;
    N20.Visible:=false;
  end;
  DrawState;
  if ((DocNaklSTATE.AsInteger = 5) or (DocNaklSTATE.AsInteger = 6)) then
    SumVpl:=Sum.FieldByName('SUMMARY').AsFloat
  else SumVpl:=0;
{BS+ }

// Добавил проверку на формирование по списку накладных
// 14.02.2007, Игнат К.
  {if (((DocNaklDOCTYPE.AsString[1]='З') and  (IntfMegaDBCommon.GetBaseID<>2))
      OR ((aDestNaklsList <> '') AND IsRussia) ) then
  begin
    DontCheckRest:=true;
    btSep.Visible:= not ((aDestNaklsList <> '') AND (IntfMegaDBCommon.GetCountry=iccRussia));
  end;}
  NoTr:=true;
  //убираем умножение на НДС будет все хранится без НДС (транспорт это база)
  //if DocNaklNDSINSUMMA.Value=0 then
 // begin
 //   smTrans.Value:=DocNaklTRANSPORT.Value*1.2;
 // end
 // else
   smTrans.Value:=DocNaklTRANSPORT.Value;
   NoTr:=false;
  if DocPos.RecordCount<>0 then
  begin
    POS_OTSR:=DocPosOTSR.AsInteger;
    POS_PRIOR:=DocPosOTSR_PRIOR.AsInteger;
  end
  else
  begin
    POS_OTSR:=0;
    POS_PRIOR:=0;
  end;
  DK_OTSR:=-1;
  //!1
//  if (DocNaklDK_TO.AsFloat<>DM.DKTDM)
//  and ((Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant=NULL) or (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger<>0) or (DocNaklDK_TO.AsFloat<>999))
//  and (DocNaklDK_TO.AsFloat<>DM.DKPP) and (DocNaklDK_TO.AsFloat<>14) {and (DocNaklDK_TO.AsFloat<>999)} and (DocNaklDK_TO.AsFloat<>1017) then
//  begin
//    DBEdit2.ReadOnly:=not CheckSubDiller(0) // zis true;
//  end else
//  begin
//    DBEdit2.ReadOnly:=false;
//  end; это уже давно не нужно (Дереза Д)


  cxDBse_Nacenka.Properties.ReadOnly:=true;

  if (((IntfMegaDBCommon.GetCountry=iccUkraine) and (IntfMegaDBCommon.IsOffice))
                   or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR')) then
      cxDBse_Nacenka.Properties.ReadOnly:=false;
  try
    if OPERSTATUS = iosPrePay then
      cxDBse_Nacenka.Properties.ReadOnly:=CheckFromSubDog_ToNacenka;
  except
    // не понимаю откуда тут эксепшн, но он есть
    on e:Exception do
      ShowMessage(e.Message);
  end;

  UpdateDK_C_Controls; //изменить элементы управления "Через Кого"

  btTransit.Down:=not DocNaklTRANSIT.IsNull;
  if  btTransit.Down then
    btTransit.ImageIndex:=46
  else
    btTransit.ImageIndex:=45;

  //++

  //--
  dbedOtsr.Properties.ReadOnly:= not ((not IntfMegaAccessManager.IsSystemAccess) or ((intfmegadbcommon.isoffice) and ((IntfMegaDBCommon.GetCountry=iccRussia) or (IntfMegaDBCommon.GetCountry=iccUSA))));
  N35.Visible:=IntfMegaDBCommon.IsOffice;

//  smTrans.enabled:=(IntfMegaDBCommon.IsOffice or (IntfMegaAccessManager.GetUserRole = 'TRANSPORT_AUDIT') or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR'));

  smDBCustoms.enabled:=(IntfMegaDBCommon.IsOffice or (IntfMegaAccessManager.GetUserRole = 'TRANSPORT_AUDIT') or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR') or (IntfMegaAccessManager.GetUserRole = 'DEVELOPER'));
 // PanelDop.Visible:=(IntfMegaDBCommon.IsOffice or (IntfMegaAccessManager.GetUserRole = 'TRANSPORT_AUDIT') or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR'));
//  pnlOffice.Visible:=IntfMegaDBCommon.IsOffice;

  //проверка на изменение ЦФО
//  if IntfMegaDBCommon.IsOffice then
//  begin
    if not MegaSelCFO.Enabled then MegaSelCFO.Enabled:=CanChangeCFO();
//  end;
  //------------------
  if IntfMegaDBCommon.GetCountry=iccRussia
  then begin
    N8.Caption :='Создать/открыть счет-фактуру на продажу';
    N16.Caption:='Создать/открыть корректировку к счету-фактуре на продажу';
    N32.Caption:='Создать/открыть счет-фактуру на приобретение';
    N33.Caption:='Создать/открыть корректировку к счету-фактуре на приобретение';
    N64.Visible:=True;
  end;

  tbAkcis.Visible := (IntfMegaDBCommon.GetCountry=iccUkraine) and (IntfMegaDBCommon.IsOffice);


  actAllowNotCheckForNewTT.Visible:=((IntfMegaDBCommon.GetCountry=iccUkraine) and (not IntfMegaDBCommon.IsOffice));
  actStartBusinessSellingForTTWithoutLicense.Visible:=(IntfMegaDBCommon.GetCountry = iccRussia);
  
  if Kurs.Value<>0 then Kurs1.Value:=1/Kurs.Value;
  mdsDocOrderSklad.Close;
  mdsDocOrderSklad.ParamByName('TYPE_ORDER').asInteger:=0;
  mdsDocOrderSklad.Open;
  if IntfMegaDBCommon.GetCountry=iccRussia then
   GetCfoIsUnloadCONTAINERS(VarToInt(MegaSelCFO.Value));
  if IntfMegaDBCommon.GetCountry=iccUkraine then
  begin
    GetIsShippingPallets(DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger);
    GetIsStickering(DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger);
  end;
  if IntfMegaAccessManager.GetUserRole = 'SALE_EXPORT_SPECIALIST' then
 //  if IntfMegaAccessManager.GetUserRole <> 'CORRECTOR' then
    cbOpl.Enabled:= false;
end;

destructor TDocNaklForm.Destroy;
begin
  FDSDocType.Free;
  EditNaklPos.Free;
  inherited;
end;

procedure TDocNaklForm.FormActivate(Sender: TObject);
begin
//
  Application.OnIdle := Waiting;
  if gDNP<>nil then
  gPast.Enabled:=gDNP.fill;

end;

procedure TDocNaklForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if conEgais.Connected then   conEgais.Connected:=false;
  
  Action := caFree;
  is_leave:=false;

  // SaveDoc сохраняет, откатывает или совсем отказывается от сохранения документа
  // если документ сохранен или наоборот - транзакция откачена, процедура
  // вернет - True, т.е. работа с документом завершена (сохранена или отменена)
  // False возвращается лишь в случае, когда сохранение невозможно или пользователь
  // предпочел Cancel
  if not SaveDoc then
  begin
    Action := caNone;
    exit;
  end;

// отпрвляю сообщение только если накладная вызвана из Doclist-а
  if Assigned(Owner) and (Owner is TDocListForm) then
  begin
    // тогда если накладная открыта из операций по счету, он не пересчитывабтся
    // а если накладная пересохраняется LocateDocPos будет вызвана из SaveDoc
    LocateDocPos(false);   //++ если true - тогда в доклисте создается новый документ
  end;


  case ShowError of
    ID_RETRY: Action:=caNone;
    ID_CANCEL: if Docnakl.Transaction.Active then
               begin
                 DocNakl.Transaction.Rollback;
                 Action := caFree;
               end;
               else
                 Action := caFree;
  end;

  if (not aCanFreeForm) and (Action = caFree) then
    Action := caMinimize; 

  if is_leave=true then
    Action:=caNone;
end;

procedure TDocNaklForm.SetAddr(StatusOper: integer);
begin
   fSetAddr:= True;
   MegaSelCFOFrom.Close;
   MegaSelCFOto.Close;
  if (StatusOper = iosCFOAddressChange) then
   begin
     MegaSelCFOfrom.ShowWithHistory:= true;
     MegaSelCFOto.ShowWithHistory:= true;
     MegaSelCFOFrom.Open;
     MegaSelCFOto.Open;
     MegaSelCFOfrom.Value:= IntToStr(DocNaklADDR_FROM_ID.AsInteger);
     MegaSelCFOto.Value:= IntToStr(DocNaklADDR_TO_ID.AsInteger);
   end
   else
   begin
     MegaSelCFOfrom.ShowWithHistory:= false;
     MegaSelCFOto.ShowWithHistory:= false;
     MegaSelCFOFrom.Open;
     MegaSelCFOto.Open;
     MegaSelCFOto.Value:= IntToStr(DocNaklADDR_TO.AsInteger);
     MegaSelCFOfrom.Value:= IntToStr(DocNaklADDR_FROM.AsInteger);
   end;
   fSetAddr:= False;
end;

procedure TDocNaklForm.SaveAddr;
begin
  Source.DataSet.Edit;
  if (MegaSelCFOfrom.ShowWithHistory) then
   begin
     DocNaklADDR_FROM_ID.AsInteger:= MegaSelCFOfrom.AddressId;
     DocNaklADDR_TO_ID.AsInteger:= MegaSelCFOto.AddressId;
     DocNaklADDR_FROM.AsInteger:= StrToInt(MegaSelCFOfrom.Value);
     DocNaklADDR_To.AsInteger:= StrToInt(MegaSelCFOto.Value);
   end
   else
   begin
     DocNaklADDR_FROM_ID.Value:= null;
     DocNaklADDR_TO_ID.Value:= null;
   end;
end;

function TDocNaklForm.GetRest: Double;
var
  ProvKolich: Double;
  restYear:double;
begin
  { Выборка всех cчетов из операции где есть аналитика по ценностям}
  Result := 0;
  if DocPosKOD_MATER.Value = 0 then Exit;
  if FindPart('ПСРТ',DocNaklDocType.AsString) >0 then Exit;

 {Херня для России -  делаем типа возврат вместо клиента}
  if ((OPERSTATUS = iosReturnClient)
  and ((IntfMegaDBCommon.GetCountry = iccRussia) OR (IntfMegaDBCommon.GetCountry = kodRUS))) then
     exit;
  
  Rest.Params.ByName['KOD_MATER'].AsDouble := DocPosKOD_MATER.Value;
  Rest.Params.ByName['GROUP_OPER'].AsInteger := DocNaklGROUP_OPER.Value;
  Rest.Params.ByName['KOD_OPER'].AsInteger := DocNaklKOD_OPER.Value;
  Rest.Params.ByName['BALANCE_KOD'].AsInteger := DocNaklBALANCE_KOD.Value;

  if ((IntfMegaDBCommon.GetCountry = iccRussia) OR (IntfMegaDBCommon.GetCountry = kodRUS)) then
  begin
    if ((intfMegaDBCommon.IsOffice) AND (IntfMegaDBCommon.GetParam('CHECK_REST_YEAR', '0')='1')) then
      Rest.Params.ByName['OPERDATE'].AsDateTime := DocNaklOPERDATE.Value+365
    else
      if intfMegaDBCommon.IsOffice then
        Rest.Params.ByName['OPERDATE'].AsDateTime := DocNaklOPERDATE.Value
      else
        Rest.Params.ByName['OPERDATE'].AsDateTime := DocNaklOPERDATE.Value+365;
  end
  else
    Rest.Params.ByName['OPERDATE'].AsDateTime := DocNaklOPERDATE.Value;//+365;

  Rest.Params.ByName['RECID'].Value := DocNaklRECID.Value;
  Rest.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
  if self.ClassName='TDocSchetForm' then
    Rest.Params.ByName['FORM'].Value:=idvSchet
   else
    Rest.Params.ByName['FORM'].Value:=DocNaklDOC_INHERITED.Value;//idvNakl;
  Rest.ExecQuery;

  Schet := Rest.FieldByName('SCHET').AsString;
  Result := Rest.FieldByName('REST').AsDouble;
  IsPrihod := Rest.FieldByName('ISPRIHOD').AsInteger;
  if ((IntfMegaDBCommon.GetCountry = iccRussia) or (IntfMegaDBCommon.GetCountry = kodRUS)) then
    if IntfMegaDBCommon.GetParam('CHECK_REST_YEAR', '0')='1' then
    begin
      Rest.Params.ByName['OPERDATE'].AsDateTime := DocNaklOPERDATE.Value;
      Rest.ExecQuery;
      RestYear := Rest.FieldByName('REST').AsDouble;
      if  RestYear<Result then
        Result:=RestYear;
    end;
  { Контроль остатков проведенной позиции, DocPosRECID.Value <> 0}
  if DocPosRECID.Value <> 0 then
  begin
    Query.Close;
    Query.SQL.Text :=
      'SELECT KOLICH_DEBET, KOLICH_KREDIT FROM OPER_JORNAL J WHERE'+
      ' DOCRECNO = ' + DocNaklRECID.AsString +
      ' AND BASEID = ' + DocNaklBASEID.AsString +
      ' AND FORMTYPE = ' + DocNaklDOC_INHERITED.AsString +
      ' AND SUBDOCRECNO = ' + DocPosRECID.AsString +
      ' AND (((SELECT SCHET_NOT_CONTROL FROM SPRAV_SCHET WHERE SCHET_KOD = J.DEBET AND BALANCE_KOD = J.BALANCE_KOD) <> 1)'+
      ' AND -1='+Inttostr(IsPrihod)+ 
      ' OR ((SELECT SCHET_NOT_CONTROL FROM SPRAV_SCHET WHERE SCHET_KOD = J.KREDIT AND BALANCE_KOD = J.BALANCE_KOD) <> 1)'+
      ' AND 1='+Inttostr(IsPrihod)+   ')';
    Query.ExecQuery;
    if Query.Fields[0].AsDouble=0 then Query.Fields[0].AsDouble:=Query.Fields[1].AsDouble;
    if Query.Fields[1].AsDouble=0 then Query.Fields[1].AsDouble:=Query.Fields[0].AsDouble;
    if IsPrihod = -1 then ProvKolich := Query.Fields[0].AsDouble else ProvKolich := Query.Fields[1].AsDouble;

  end
  else ProvKolich := 0;
  if (ProvKolich < 0) and (DocPosKOLICH.Value > 0) then ProvKolich := -ProvKolich;
  DocPosBeginRest.Value := Result + ProvKolich * IsPrihod;
//  DocPosBeginRest.Value := Result;
  DocPosCalcFields(DocPos);
  Result := DocPosRest.Value;
end;

procedure TDocNaklForm.SumCalcFields(DataSet: TDataSet);
begin
  DataSet.Fields[4].AsFloat := DataSet.Fields[3].AsFloat;
  if DocNaklNDSINSUMMA.Value = 1
     then DataSet.Fields[5].AsFloat := DataSet.Fields[2].AsFloat
     else DataSet.Fields[5].AsFloat := DataSet.Fields[2].AsFloat + DataSet.Fields[4].AsFloat;
  DataSet.Fields[7].AsFloat := DataSet.Fields[5].AsFloat - DataSet.Fields[6].AsFloat;
end;

function TDocNaklForm.CheckRest(PDVCheck: Boolean): Boolean;
var
  PDV1: Boolean;
  PDV2: Boolean;
  Rest: Double;
  Price: Integer;
begin
  if DontCheckrest then
  begin
    Result := True;
    Exit;
  end;
  PDV1 := false; PDV2 := false;
  Result := False;
  sort(TMegaDataset(DocPos),[DocPosNAME_MATER.index,DocPosRECID.Index],[true,true]);
  DocPos.First;
  if NextCheckFlag then
    DocPos.MoveBy(CheckRecNo);
  // Прставление признака "в продаже". Убрал 29.10.05 Захарченко.
  // Query1.Close;
  // Query1.SQL.Text := 'UPDATE SPRAV_MATER SET TOSALE = ?TOSALE WHERE KOD_MATER = ?KOD_MATER';
  // Query1.Prepare;
  Query2.Close;
  Query2.SQL.Text := 'UPDATE '+SubTableName+' SET STATE = ?STATE WHERE RECID = ?RECID AND BASEID = ?BASEID AND STATE <> ?STATE1';
  Query2.Prepare;
  IndQuery.Close;
  IndQuery.SQL.Text := 'SELECT PRICE_VALUE FROM SPRAV_PRICES WHERE PRICE_BALANCE = :B AND PRICE_TOVARKOD = :T AND PRICE_KOD = :P AND PRICE_VALYUTA = :V';
  IndQuery.Prepare;
  if DocNaklPRICE_MIN.AsVariant <> NULL then Price := DocNaklPRICE_MIN.AsInteger else Price := -1;
  IndQuery.Params.ByName['B'].asInteger := DocNaklBALANCE_KOD.Value;
  IndQuery.Params.ByName['P'].asInteger := Price;
  IndQuery.Params.ByName['V'].asInteger := DocNaklV1.Value;
  while not DocPos.Eof do
  begin
    Rest := GetRest;
    if Rest < 0 then
    begin
      if ((DocNaklDOCTYPE.AsString[1]<>'З') AND (not (OPERSTATUS in [iosSpecification, iosRealization,iosZMC, iosCorrectReturn]))) then
      begin
        Application.MessageBox('Ценность списана со склада другим пользователем. Требуется изменить количество ...', 'Внимание !', MB_OK + MB_ICONWARNING);
        Result := false;
        Exit;
      end;
    end;
    // Query1.Params[1].AsDouble := DocPosKOD_MATER.Value;
    Query2.Params[1].AsInteger := DocPosRECID.Value;
    Query2.Params[2].AsInteger := DocPosBASEID.Value;
    if Rest > 0 then
    begin
      // Query1.Params[0].AsInteger := 1;
      Query2.Params[0].AsInteger := 100;
      Query2.Params[3].AsInteger := 100;
    end
    else
    begin
      // Query1.Params[0].AsInteger := 0;
      Query2.Params[0].AsInteger := -1;
      Query2.Params[3].AsInteger := -1;
    end;
    // if DocPosTOSALE.Value <> Query1.Params[0].AsInteger
    //  then Query1.ExecQuery;

   { 09/10/2018 - убрала по просьбе Спивак - не может дать бухгалтеру права на все операции (согласовано с Данилом) 
     if not IntfMegaDBCommon.IsOffice then
     if (DocPosSTATE.Value <> Query2.Params[0].AsInteger) and (DocNaklSTATE.AsInteger<>5) and (DocNaklSTATE.AsInteger<>6)
       then Query2.ExecQuery;
    }
    if PDVCheck then
    begin
      if DocPosPDV.Value[1] in ['A', 'B', 'C'] then
        PDV1 := true
       else
        PDV2 := true;
      if PDV1 and PDV2 then
      begin
        Application.MessageBox('В документе обнаружена позиция с несовместимой налоговой группой. Перенесите позицию в другой документ...', 'Внимание !', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;

    {сохранение индикативных цен}
    // В России неактуально - ха-ха-ха
    if not ((IntfMegaDBCommon.GetCountry = iccRussia) OR (IntfMegaDBCommon.GetCountry = kodRUS)) then
      if (DocPosIND.Value = 1) and (IsPrihod <> -1) and not AlphaStarted then
      begin
        IndQuery.Close;
        IndQuery.Params.ByName['T'].asDouble := DocPosKOD_MATER.Value;
        IndQuery.ExecQuery;
        if (MyRoundFunc(DocPosSUMMAWPDV.Value, 0.01) < MyRoundFunc(IndQuery.FieldByName('PRICE_VALUE').AsDouble * DocPosKOLICH.Value, 0.01)) then
        begin
          TIndControlForm.Create(Self).ShowModal;
          Exit;
        end;
      end;
    DocPos.Next;
    DBGridEH1.Update;
  end;
  Result := True;
end;

procedure TDocNaklForm.checkReturnCause;
begin
  if operstatus = iosReturnFromClient then
  begin
    dm.SharedQuery.Close;
    dm.SharedQuery.SQL.Text :=
      'SELECT count(*) CNT   '#13#10+
      'FROM RETURN_CAUSE     '#13#10+
      'WHERE RECID=:RECID    '#13#10+
      '  and BASEID=:BASEID  '#13#10+
      '  and NOTE is NOT NULL';
    dm.SharedQuery.ParamByName('RECID').Asinteger := DocNaklRECID.AsInteger;
    dm.SharedQuery.ParamByName('BASEID').Asinteger := DocNaklBASEID.AsInteger;
    dm.SharedQuery.ExecQuery;
    if dm.SharedQuery.FN('CNT').AsInteger =0 then
      btnReturnCauseClick(btnReturnCause);
    dm.SharedQuery.Close;
  end;

end;

procedure TDocNaklForm.DBGridEH1Enter(Sender: TObject);
begin
  if DocNakl.State in [dsInsert, dsEdit]
   then DocNakl.SafePost;

// Саша Пец: смысл кода не понятен:), закоментарил, было торможение - пару секунд
//  try
//    DocNakl.Edit;
//  except
    // блокируем exception при отсутствии прав
//  end;
end;

procedure TDocNaklForm.SkidckaNDSUchet; { [gsa] 18-01-2018 для подсчета
  количества скидок с учетом НДС. Согласно доработки с Расширения ф-й мани. }
begin
   sumPDVScidcka:=0.0;
   DocPos.DisableControls;
   DocPos.First;
   while not DocPos.Eof do
       begin
              sumPDVScidcka:=sumPDVScidcka + DocPos.FieldByName('SKIDKA_WITH_PDV').AsFloat ;
              DocPos.Next;
       end;
   DocPos.EnableControls;
end;

procedure TDocNaklForm.DBGridEH1DrawFotterCell(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEH; Rect: TRect; State: TGridDrawState);
begin
  case Column.Index of
    0 : if Row = 0 then
           begin
             WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
             'Итого:',taRightJustify,tlTop,True,False,0,0,false,true);
           end;
    3 : case Row of
          1: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               FloatToStrF(Sum.Fields[6].AsFloat,ffNumber,11,2),taRightJustify,tlTop,False,False,0,0,false,true);
             end;
          2: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               FloatToStrF(Sum.Fields[7].AsFloat,ffNumber,11,2),taRightJustify,tlTop,False,False,0,0,false,true);
             end;
        end;
    5 : case Row of
          0: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               FloatToStrF(Sum.Fields[0].AsFloat,ffNumber,11,3),taRightJustify,tlTop,False,False,0,0,false,true);
             end;
          1: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               FloatToStrF(Brutto,ffNumber,11,3),taRightJustify,tlTop,False,False,0,0,false,true);
             end;
         end;
{    6 : case Row of
          0: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               FloatToStrF(CountInBox,ffNumber,11,0),taRightJustify,tlTop,False,False,0,0,false);
             end;
          1: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               BruttoMer,taRightJustify,tlTop,False,False,0,0,false);
             end;
        end;}
    10 : if Row = 0 then
           begin
             WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
             FloatToStrF(Sum.Fields[1].AsFloat,ffNumber,12,3),taRightJustify,tlTop,False,False,0,0,false,true);
           end;
    12: case Row of
         1: if DocNaklNDSINSUMMA.Value = 1 then
              WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
             'В т.ч. НДС:',taLeftJustify,tlTop,True,False,0,0,false,true)
            else
              WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
             'НДС:',taLeftJustify,tlTop,True,False,0,0,false,true);
         2:   WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
             'К оплате:',taLeftJustify,tlTop,True,False,0,0,false,true);
       end;
    13 : case Row of
          0: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               FloatToStrF(Sum.Fields[2].AsFloat,ffNumber,12,3),taRightJustify,tlTop,False,False,0,0,false,true);
             end;
          1: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               FloatToStrF(Sum.Fields[4].AsFloat,ffNumber,12,3),taRightJustify,tlTop,False,False,0,0,false,true);
             end;
          2: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               FloatToStrF(Sum.Fields[5].AsFloat,ffNumber,12,2),taRightJustify,tlTop,False,False,0,0,false,true);
             end;
         end;
    18 : case Row of
          0: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               FloatToStrF(S,ffNumber,12,3),taRightJustify,tlTop,False,False,0,0,false,true);
             end;
          1: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               FloatToStrF(SB,ffNumber,12,3),taRightJustify,tlTop,False,False,0,0,false,true);
             end;
          2: begin
               WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
               FloatToStrF(SD,ffNumber,12,3),taRightJustify,tlTop,False,False,0,0,false,true);
             end;
         end;
    16 : case Row of
          0: begin
               if DocNaklEXCISE_IN_SUMMA.Value=1 then
                 WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
                 'В т.ч. акциз:',taLeftJustify,tlTop,True,False,0,0,false,true)
               else
                 WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,
                 'А также акциз:',taLeftJustify,tlTop,True,False,0,0,false,true)
             end;
          end;
    24 : case Row of //[gsa] 16012019  доработка по запросу расширение функций Мани
            0: begin
                WriteTextEH(DBGridEH1.Canvas,
                              Rect,
                              False,
                              0,
                              0,
                              FloatToStrF(sumPDVScidcka,ffNumber,12,3),
                              taRightJustify,
                              tlTop,
                              True,
                              False,
                              0,
                              0,
                              false,
                              true);
             end;
          end;

  end;
end;

procedure TDocNaklForm.DocNaklAfterOpen(DataSet: TDataSet);
var
  HH, MM, SS, SSS: Word;
  dateHHMM: string;
  DT:TDateTime;
begin
  DocPosSource.Dataset.Open;
  Sum.Close;
  Sum.Open;
  GetStateSelfExport;
  btnStartBP.Visible :=  False{$IFDEF D10+}OR true{(DocNaklDOCTYPE.asString = 'ВНк77')}{$ENDIF};

  if (DocNaklGroup_OPER.Value<>0)and(DocNaklKOD_OPER.Value<>0) then
    pmp_items.AddPopupMenuItems(DocNaklOPERDATE.Value,DocNaklDocType.Value,
                                DocNaklGroup_OPER.Value,DocNaklKOD_OPER.Value,
                                DocNaklDK_FROM.Value,DocNaklDK_TO.Value);


  //[gsa] 24-09-2019

   if (IsRussia = true)then begin
       grpTRANSPORT_TIME.Visible:=True;
       dateHHMM:=(fbExecQuery('select TRANSPORT_TIME from NAKL_ADDITION_PROP where NAKL_RECID = %d  and NAKL_BASEID = %d ',
                 [DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger]));
       if dateHHMM <> '' then
          begin
           DT:= StrToDateTime(dateHHMM);
           DecodeTime(DT,HH,MM,SS,SSS);
//           cbbTRANSPORT_TIME_HH.Enabled:=true;
           cbbTRANSPORT_TIME_HH.Text:=IntToStr(HH);
//           cbbTRANSPORT_TIME_HH.Enabled:=false;
//           cbTRANSPORT_TIME_MM.Enabled:=true;
           cbTRANSPORT_TIME_MM.Text:=IntToStr(MM);
//           cbTRANSPORT_TIME_MM.Enabled:=false;

       //----
         end;

   end;
end;

procedure TDocNaklForm.DocNaklNewRecord(DataSet: TDataSet);
var
  group_name,name_oper:string;
  group_oper,kod_oper:Integer;
begin
  Dataset.FieldByName('RECID').AsInteger  := IntfIBCommon.GetGeneratorValue(liUtils.iif(FDSDocType.FieldDocInherited.AsInteger=1,'DOC_NAKL_GEN','DOC_SCHET_GEN'));
  Dataset.FieldByName('BASEID').AsInteger := IntfMegaDBCommon.GetBaseID;

  Dataset.FieldByName('DOCTYPE').AsString        := FDSDocType.FieldDocType.AsString;
  balanceDType:=IntfMegaCommon.GetBalanceByDocType(Source.DataSet.FieldByName('DOCTYPE').AsString);

  Dataset.FieldByName('BALANCE_KOD').AsInteger   := FDSDocType.FieldBalance.AsInteger;
  Dataset.FieldByName('DOC_INHERITED').AsInteger := FDSDocType.FieldDocInherited.AsInteger;

  Dataset.FieldByName('OPERDATE').AsDateTime := FOPERDATE;

  //-- получение номера документа
  Query.Close;
  try
    if IntfMegaDBCommon.GetCountry = iccRussia then
      Query.SQL.Text :=' select DOCNUMBER from GET_NEW_DOCNUMBER(:BASEID,:DOCTYPE,:OPERDATE,null)'
    else
    begin
      Query.SQL.Text :=' select DOCNUMBER from GET_NEW_DOCNUMBER(:BASEID,:DOCTYPE,:OPERDATE,null,:CFO)';
      Query.ParamByName('CFO').asInteger:= IntfMegaDBCommon.GetCFONakl;
    end;
    Query.ParamByName('BASEID').asInteger:=IntfMegaDBCommon.GetBaseID;
    Query.ParamByName('DOCTYPE').asString:=FDSDocType.FieldDocType.AsString;
    Query.ParamByName('OPERDATE').asDate:=FOPERDATE;
    Query.ExecQuery;
  except
    { А вдруг процедура старая ещё }
    Query.SQL.Text :=' select DOCNUMBER from GET_NEW_DOCNUMBER(:BASEID,:DOCTYPE,:OPERDATE,null)';
    Query.ParamByName('BASEID').asInteger:=IntfMegaDBCommon.GetBaseID;
    Query.ParamByName('DOCTYPE').asString:=FDSDocType.FieldDocType.AsString;
    Query.ParamByName('OPERDATE').asDate:=FOPERDATE;
    Query.ExecQuery;
  end;
  Dataset.FieldByName('DOCNUMBER').AsInteger :=Query.Fields[0].AsInteger;


//  Dataset.FieldByName('DOCNUMBER').AsInteger := GetNewDocNaklNumber(); //Query.Fields[0].AsInteger + 1;

  //--
//  Dataset.FieldByName('FORMAOPL_').AsInteger          := 1;
  Dataset.FieldByName('PRICE_FROM_VALYUTA').AsInteger := 2;
  Dataset.FieldByName('PRICETYPE_').AsInteger         := iptOpt;
  Dataset.FieldByName('STATE').AsInteger              := idsNew;
  Dataset.FieldByName('TRANSPORT').AsInteger          := 0;

  //-- операции поумолчанию
  Query.Close;
  if ((IntfMegaDBCommon.GetCountry = iccUSA) and (MainTableName='DOC_NAKL') and (Source.Dataset.FieldByName('GROUP_OPER').AsInteger=0)) then
  begin
      Query.SQL.Text :=' select first 1 so.group_oper,so.kod_oper,so.name_oper,sg.group_name from sprav_oper so left join sprav_groper sg on (sg.group_oper=so.group_oper) where DEFAULT_OPER = 1';
      Query.ExecQuery;
      if Query.RowsAffected>0  then
      begin
        group_name:=Query.FieldByName('group_name').AsString;
        name_oper:= Query.FieldByName('name_oper').AsString;
        group_oper:=Query.FieldByName('group_oper').AsInteger;
        kod_oper:= Query.FieldByName('kod_oper').AsInteger;
        Query.close;
        //только в таком порядке потому что при изменении  KOD_OPER Query закрывается
        DataSet.FieldByName('GROUP_NAME').value := group_name;
        Dataset.FieldByName('NAME_OPER').value := name_oper;
        Dataset.FieldByName('GROUP_OPER').AsInteger := group_oper;
        Dataset.FieldByName('KOD_OPER').AsInteger := kod_oper;
      end;
      Dataset.FieldByName('FORMAOPL_').AsInteger:= 2;
  end;
end;

procedure TDocNaklForm.GrOper_CEButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  AUTO_OPL: Integer;
begin
  Source.DataSet.Edit;
  if GetOper(MainTableName, Source.DataSet.FieldByName('DOCTYPE').AsString,
    TComponent(Sender).Tag,
    Source.DataSet.FieldByName('GROUP_OPER'),
    Source.DataSet.FieldByName('KOD_OPER'),
    Source.DataSet.FieldByName('GROUP_NAME'),
    Source.DataSet.FieldByName('NAME_OPER'), AUTO_OPL) = mrOk then
      SelectNext(Kod_Oper_CE, True, True);
  DocNaklOPERDATEChange(nil);
end;

procedure TDocNaklForm.DK_FROM_CEButtonClick(Sender: TObject;AButtonIndex:integer);
begin
  Source.DataSet.Edit;
  if OPERSTATUS in [iosRealizationF1, iosRealizationF2, iosOFSubarenda,
                    iosBrends,iosReturnStornoTT,iosPrePay,iosMaterZatr,
                    iosRealization,  iosMaterWithDiscReal,iosReturnClient,iosIndikativ,iosZMC, iosCorrectReturn, iosOutcomeToOtv] then
    mSelDK_TO.Options:=[dkoOnlySubDKF2,dkoSelTradeOutlet,dkoSelKeytAddress]
  else
    mSelDK_TO.Options:=[dkoOnlySubDKF2];

  if Sender = DK_FROM_CE then
   begin
     if ((OperStatus = iosReturnFromClient) or (OperStatus = iosReturnClient))  then
      begin
        mSelDK_From.KodDK:= DocNaklDK_FROM.AsFloat;
        mSelDK_From.Options:=[dkoSelTradeOutlet];
        if mSelDK_From.ExecuteAsControlPopUp(DK_FROM_CE) then
         begin
           DocNaklDK_From.AsFloat:= mselDK_From.KodDK;
           DocNaklDK_From_NAME.AsString:= mselDK_From.ShortnameDK;
           AddrPost(mSelDK_From);
         end;
      end
    else
     begin
      mSelDK_From.KodDK:= DocNaklDK_FROM.AsFloat;
      if mSelDK_From.ExecuteAsControlPopUp(DK_FROM_CE) then
       begin
         DocNaklDK_From.AsFloat:= mselDK_From.KodDK;
         DocNaklDK_From_NAME.AsString:= mselDK_From.ShortnameDK;
       end;
     end;
   end
  else
   if Sender = DK_TO_CE then
    begin
      bSelTT:=false;
      mSelDK_To.KodDK:= DocNaklDK_TO.AsFloat;
      if mselDK_TO.ExecuteAsControlPopUp(DK_TO_CE) then
       begin
         DocNaklBRAND_CASE_ID.AsInteger:= mselDK_TO.BrandCaseId;
         DocNaklDK_TO.AsFloat:= mselDK_TO.KodDK;
         // DocNaklDK_TO_NAME.AsString:= mselDK_TO.ShortnameDK;
         AddrPost(mSelDK_To);
       end;
      bSelTT:=true;
    end
   else
    begin
      if (OperStatus = iosSelectByDK_C) or ((OperStatus <> iosRealizationF1) and(OperStatus <> iosPrePay)
      and ((OperStatus <> iosRealizationF2) OR (((IntfMegaDBCommon.GetCountry = iccRussia) OR (IntfMegaDBCommon.GetCountry = kodRUS)) AND ((Pos('КЧк', DocNaklDOCTYPE.AsString) > 0) OR (OperStatus = iosRealizationF2))))) then
      begin
        if (OperStatus = iosSelectByDK_C) then
         begin
           bSelTT:=false;
           mSelDK_C.Options:=[dkoOnlySubDKF2,dkoSelTradeOutlet,dkoSelKeytAddress];
         end;
        mSelDK_C.KodDK:= DocNaklDK_C.AsFloat;
        if mselDK_C.ExecuteAsControlPopUp(DK_C_NAME_CE) then
         begin
           DocNaklDK_C.AsFloat:= mselDK_C.KodDK;
           DocNaklDK_C_NAME.AsString:= mselDK_C.ShortnameDK;
         end;
        if (OperStatus = iosSelectByDK_C) then
         begin
           AddrPost(mSelDK_C);
           bSelTT:=true;
         end;
      end;
    end;
  SelectNext(TWinControl(Sender), True, True);
end;

procedure TDocNaklForm.DocNaklOPERDATEChange(Sender: TField);
begin
  if NoEvent then exit;
  if (Source.Dataset.State=dsInsert) or (Source.Dataset.FieldByName('DOCDATE').AsDateTime < Source.Dataset.FieldByName('OPERDATE').AsDateTime) then
     Source.Dataset.FieldByName('DOCDATE').AsDateTime := Source.Dataset.FieldByName('OPERDATE').AsDateTime;
  if not DM.Q.Active then Exit;

  Source.DataSet.FieldByName('KURS').AsFloat:=
    IntfMegaDBCommon.GetKursByDate(Source.DataSet.FieldByName('OPERDATE').AsDateTime,
                                   balanceDType,
                                   Source.DataSet.FieldByName('V').AsInteger,
                                   Source.DataSet.FieldByName('V1').AsInteger);

end;

function TDocNaklForm.DrawState: Word;
var
  bbb:boolean;
  OPERSTATUS_OLD: integer;
  ProvCFO,analitik_brand_case,analitik_contract:integer;
  analitic_contract_FROM,analitic_contract_TO:Boolean;
begin

  Result := GetProvAttrib(
         Source.DataSet.FieldByName('GROUP_OPER').AsInteger,
         Source.DataSet.FieldByName('KOD_OPER').AsInteger,
         Source.DataSet.FieldByName('OPERDATE').AsDateTime,
         Schet, ProvCFO,analitik_brand_case,analitik_contract,
         analitic_contract_FROM,analitic_contract_TO,Source.DataSet.FieldByName('CFO').AsInteger);

  o_DK_FROM:=kod_DK_FROM;
  o_DK_TO  :=kod_DK_TO;
  o_DK_C   :=kod_DK_C;

   DK_FROM_CE.Enabled:= not CheckDKfromOper(o_DK_FROM,Source.Dataset.FieldByName('DK_FROM'),'От кого');
   DK_FROM_ED.Enabled:=DK_FROM_CE.Enabled;
   DK_TO_CE.Enabled  := not CheckDKfromOper(o_DK_TO,Source.Dataset.FieldByName('DK_TO'),'Кому');
   DK_TO_ED.Enabled  :=DK_TO_CE.Enabled;
   DK_C_NAME_CE.Enabled   := not CheckDKfromOper(o_DK_C,Source.Dataset.FieldByName('DK_C'),'Через');
   DK_C_ED.Enabled   :=DK_C_NAME_CE.Enabled;


  bbb:=false;
  bbb:=Panel9.Visible;
  Panel9.Visible := Result and (2048 or 4096) <> 0;
  PanelDopLeft.Visible := (analitik_brand_case=1) or (analitik_contract<>0) or (analitic_contract_FROM) or (analitic_contract_TO) or IntfMegaDBCommon.IsOffice;
//   IntfMegaDBCommon.IsOffice or (IntfMegaAccessManager.GetUserRole = 'TRANSPORT_AUDIT') or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR');
  MegaSelBrandCase2.Visible := analitik_brand_case=1;
  MegaSelContract1.Visible  := (analitik_contract<>0) or analitic_contract_FROM or analitic_contract_TO;
  if MegaSelContract1.Visible then begin
    MegaSelContract1.Close;
    case analitik_contract of
       4: MegaSelContract1.DataFieldKodDK:='DK_C';
       1: MegaSelContract1.DataFieldKodDK:='DK_FROM';
       2: MegaSelContract1.DataFieldKodDK:='DK_TO';
    end;
    if analitic_contract_FROM then
       MegaSelContract1.DataFieldKodDK:='DK_FROM';
    if analitic_contract_TO then
       MegaSelContract1.DataFieldKodDK:='DK_TO';

    MegaSelContract1.Open;
  end
  else MegaSelContract1.Close;

  if bbb and (not Panel9.Visible) then
    if (DocNakl.State=dsInsert) or (DocNakl.State=dsEdit) then DocNaklDK_C.AsVariant:=NULL;
  Self.Width := Self.Width + 1;
  Self.Width := Self.Width - 1;
  //получение статуса операции
  Query.Close;
  Query.SQL.Text := 'select * from GET_ISRASKHOD(' +
    IntToStr(Source.DataSet.FieldByName('GROUP_OPER').AsInteger)+', ' +
    IntToStr(Source.DataSet.FieldByName('KOD_OPER').AsInteger) + ', 0, ''' +
    Source.DataSet.FieldByName('OPERDATE').AsString + ''')';
  Query.ExecQuery;
 // Panel10.Visible := (IntfMegaDBCommon.GetCountry = iccRussia);

  OPERSTATUS_OLD:=OPERSTATUS;
  OPERSTATUS:= GetProvStatus;

  // Адрес откуда/куда
  Query.Close;
  Query.SQL.Text:='select can_change from can_change_cfo_on_doc(:GROUP_OPER,:KOD_OPER, :kc, :operdate)';
  Query.Params.ByName['GROUP_OPER'].AsInteger:=Source.DataSet.FieldByName('GROUP_OPER').AsInteger;
  Query.Params.ByName['KOD_OPER'].AsInteger:=Source.DataSet.FieldByName('KOD_OPER').AsInteger;
  Query.Params.ByName['OPERDATE'].AsDateTime:=Source.DataSet.FieldByName('OPERDATE').AsDateTime;
  Query.Params.ByName['KC'].AsInteger:=3;
  Query.ExecQuery;
  MegaSelCFOto.Enabled:= Query.Fields[0].AsInteger>0;

  if (IntfMegaDBCommon.GetCountry = iccRussia) then
    if MegaSelCFOto.Enabled then
      PriceType.Enabled:= (IntfMegaAccessManager.GetUserRole = 'CORRECTOR') or IsDebug;
  //делаем активным или нет при изменении операции
  smTrans.enabled:= ((IntfMegaDBCommon.IsOffice) or (((IntfMegaAccessManager.GetUserRole = 'TRANSPORT_AUDIT') or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR')) and (DocNaklWITH_SUM_TRANSPORT.AsInteger =1)));

  Query.Close;
  Query.Params.ByName['GROUP_OPER'].AsInteger:=Source.DataSet.FieldByName('GROUP_OPER').AsInteger;
  Query.Params.ByName['KOD_OPER'].AsInteger:=Source.DataSet.FieldByName('KOD_OPER').AsInteger;
  Query.Params.ByName['KC'].AsInteger:=2;
  Query.ExecQuery;
  MegaSelCFOfrom.Enabled:= Query.Fields[0].AsInteger>0;
  // or (OPERSTATUS in [iosIncomeFromProvider,iosIncomeFromRoad, iosImportIncomeFromRoad, iosCFOAddressChange]); 31.07.19 перенесла в процедуру

//  Query.Close;
//  Query.SQL.Text:='select status from sprav_oper where  group_oper = '+
//  IntToStr(Source.DataSet.FieldByName('GROUP_OPER').AsInteger)+' and kod_oper ='+
//  IntToStr(Source.DataSet.FieldByName('KOD_OPER').AsInteger);
//  Query.ExecQuery;
//
//
//  OPERSTATUS:= Query.Fields[0].AsInteger;

  if OPERSTATUS_OLD<>OPERSTATUS then
  begin
    case OPERSTATUS of
      iosReturnToProvider:  //Возврат поставщику
        begin
        end;
      iosReturnFromClient:  //Возврат от покупателя
        begin
        end;
      iosRealizationF1:  //Реализация Ф1
        begin
        end;
      iosRealizationF2:  //Реализация Ф2
        begin
        end;
      iosInternalMove:  //Внутреннее перемещение
        begin
        end;
      iosIncomeFromProvider:  //Приход от поставщика
        begin
        end;
      iosIncomeFromRoad:  //Приход из пути
        begin
        end;
      iosImportIncomeFromRoad:  //импорт Приход из пути
        begin
        end;
      iosOutcomeToRoad:  //Уход в путь
        begin
        end;
      iosPrePay:    //со Скидкой при допсоглашении "Работа по предоплате"
        begin
        end;
      iosCFOAddressChange:
        begin

        end;  
    end;
  end;

  //!!! тест  SetAddr(operstatus);

  Kurs.Hint:=DocNaklV1_Name.Value+ '/'+ DocNaklV_Name.Value;
  Kurs1.Hint:=DocNaklV_Name.Value+ '/'+ DocNaklV1_Name.Value;
end;

procedure TDocNaklForm.DocNaklKOD_OPERChange(Sender: TField);
var
  S: Word;
  DK: Double;
  lBalanceDK: double;
begin
  if NoEvent then exit;
  FProvStatus:=-1;
  FIsStickering:= -1;
  dm.GetOperStatus(Nakl_Transaction, DocNaklGROUP_OPER.AsInteger, DocNaklKOD_OPER.AsInteger,OPERSTATUS,PDVOPERSTATUS);

  S := DrawState;

  lBalanceDK:= IntfMegaCommon.GetBalanceDK(
    Source.Dataset.FieldByName('OPERDATE').AsDateTime,
    Source.Dataset.FieldByName('DOCTYPE').AsString,
    StrToIntDef(MegaSelCFO.Value, -1));

  if (S and (1 or 4) = 0) then
    if Source.Dataset.FieldByName('DK_FROM').AsFloat <> lBalanceDK {DM.SharedQuery.Fields[0].AsDouble} then
      Source.Dataset.FieldByName('DK_FROM').AsFloat := lBalanceDK {DM.SharedQuery.Fields[0].AsDouble};
  DK := 0;
  DM.Q.First;

  if (S and (2 or 8) = 0) then
  begin
    if DK <> 0 then Source.Dataset.FieldByName('DK_TO').AsFloat := DK else
      if (S and 512 <> 0) then Source.Dataset.FieldByName('DK_TO').AsFloat := DEBET_DK else
        Source.Dataset.FieldByName('DK_TO').AsFloat := lBalanceDK {DM.SharedQuery.Fields[0].AsDouble};
  end;
//!!!!!
  if not (Source.DataSet.State in[dsInsert,dsEdit]) then Source.DataSet.Edit;
  if Source.DataSet.FieldByName('V').AsInteger <> V then
    Source.DataSet.FieldByName('V').AsInteger := V;
  if Source.DataSet.FieldByName('V1').AsInteger <> V1 then
    Source.DataSet.FieldByName('V1').AsInteger := V1;
  DocNaklOPERDATEChange(nil);
  //после этого могут пересчитаться цены и датасет закрывается. 
  if not (Source.DataSet.State in[dsInsert,dsEdit]) then Source.DataSet.Edit;
  if Source.DataSet.FieldByName('V').AsInteger = Source.DataSet.FieldByName('V1').AsInteger then
    Source.DataSet.FieldByName('PRICE_FROM_VALYUTA').AsInteger := Source.DataSet.FieldByName('V').AsInteger;

   if not (S and (2048 or 4096) <> 0) then DocNaklDK_C.AsVariant := NULL;
   SetRules;
   if DefaultPrice<>0 then DocNaklPRICETYPE_.Value:=DefaultPrice;

   cxDBse_Nacenka.Properties.ReadOnly:=true;
  if (((IntfMegaDBCommon.GetCountry=iccUkraine) and (IntfMegaDBCommon.IsOffice)) or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR')) then
      cxDBse_Nacenka.Properties.ReadOnly:=false;

   if OPERSTATUS = iosPrePay then
      cxDBse_Nacenka.Properties.ReadOnly:=CheckFromSubDog_ToNacenka;
   if (DocNaklNACENKA_.Value<>0) and (OPERSTATUS <> iosPrePay) then
      DocNaklNACENKA_.Value:=0;
//!!!!
  if (OPERSTATUS = iosRealizationF1) or (OPERSTATUS = iosRealizationF2)or(OPERSTATUS = iosPrePay) then
  begin
  end;
  // added by ZIS 02.07.2003
  MegaSelCFO.Enabled:= OPERSTATUS in [iosOFInternalMove,iosOFFromToRoad,iosOFPurchasingWriteOff];
  //проверка на изменение ЦФО
  if IntfMegaDBCommon.IsOffice then
  begin
     if not MegaSelCFO.Enabled then MegaSelCFO.Enabled:=CanChangeCFO();
  end;
  tbVozvr.Enabled:= OPERSTATUS = iosReturnFromClientPattern;
  tbVozvrChP.Enabled:=GetVozvrChP;
  UpdateDK_C_Controls;
  Kurs.Hint:=DocNaklV1_Name.Value+ '/'+ DocNaklV_Name.Value;
  Kurs1.Hint:=DocNaklV_Name.Value+ '/'+ DocNaklV1_Name.Value;

  pmp_items.AddPopupMenuItems(DocNaklOPERDATE.Value,DocNaklDocType.Value,
                              DocNaklGroup_OPER.Value,DocNaklKOD_OPER.Value,
                              DocNaklDK_FROM.Value,DocNaklDK_TO.Value);
end;

procedure TDocNaklForm.DK_TO_CEEnter(Sender: TObject);
begin
  if TcxButtonEdit(Sender).Text = '' then DK_FROM_CEButtonClick(Sender,0);
end;

procedure TDocNaklForm.GrOper_CEEnter(Sender: TObject);
begin
   if TcxButtonEdit(Sender).Text = '' then GrOper_CEButtonClick(Sender,0);
end;

procedure TDocNaklForm.GrOper_CEPropertiesChange(Sender: TObject);
begin
  aSetOFDogovor.Enabled:= (grBuhgalter in aIniParams.UserGroup)
                            and (GetProvStatus=iosOFSubarenda);

  actSubRent_List.Enabled:=(GetProvStatus=iosOFSubarenda) and (DocNaklSTATE.Value=8);
  //или на дебиторе установлен признак ситкеровки
  tbOrderSklad.Visible:=(GetProvStatus in [iosUnionSort, iosOutcomeToOtv,iosIncomeFromRoad,iosImportIncomeFromRoad,iosOutcomeToRoad,iosIncomeFromProvider,iosMaterWithDiscReal,iosMaterWithDiscount, iosRealizationF1, iosRealizationF2,iosPosting,iosIncomeFromRoadFromProvider]) or (isStickering=1);

 // tbOrderSklad.Visible:=;
  smTrans.enabled:= ((IntfMegaDBCommon.IsOffice) or (((IntfMegaAccessManager.GetUserRole = 'TRANSPORT_AUDIT') or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR')) and (Source.DataSet.FieldByName('WITH_SUM_TRANSPORT').AsInteger = 1)));
  if (not smTrans.Enabled) and (smTrans.Value <> 0) then smTrans.Value:= 0;

  if not MegaSelCFO.Enabled then MegaSelCFO.Enabled:=CanChangeCFO();
end;

procedure TDocNaklForm.UpdatePosPrices(Param5IsNull: Boolean);
begin
  if AntiRecusria then Exit;
  Inc(AntiRecusria);
  try
  DocNakl.CheckBrowseMode;
  finally
    Dec(AntiRecusria);
  end;
  UpdateQuery.Close;
  UpdateQuery.Params[0].AsInteger := DocNaklRECID.Value;
  UpdateQuery.Params[1].AsInteger := DocNaklBASEID.Value;
  UpdateQuery.Params[2].AsInteger := DocNaklPRICETYPE_.Value;
  UpdateQuery.Params[3].AsInteger := DocNaklPRICE_FROM_VALYUTA.Value;
  UpdateQuery.Params[4].AsDouble := DocNaklKURS.Value;
  if Param5IsNull then
    UpdateQuery.Params[5].Value := null
  else
    UpdateQuery.Params[5].AsInteger := 0;
  try
   UpdateQuery.ExecQuery;
  except
    on E:Exception do
    begin
         Warning('Возникли ошибки при проставлении цен. '#13#10+
              e.Message);
    end;
  end;
  Refresh_NaklPos;
end;


procedure TDocNaklForm.DocNaklDK_FROMChange(Sender: TField);
begin
   DK_FROM_CE.Enabled:= not CheckDKfromOper(o_DK_FROM,sender,'От кого');
   DK_FROM_ED.Enabled:=DK_FROM_CE.Enabled;
   Source.DataSet.FieldByName('DK_FROM_NAME').AsString:=IntfMegaCommon.GetShortNameDK(sender.AsFloat);

  if NoEvent then exit;
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM SPRAV_DK WHERE KOD_DK = ' + FloatToStr(Sender.AsFloat);
  Query.ExecQuery;
  if  Source.DataSet.FieldByName('DOCTYPE').AsString[1]='П' then
  begin
    DK_OTSR:= Query.FieldByName('OTSR').AsInteger;
    if  (DocNaklBALANCE_KOD.AsInteger<>ibcMP) and (DocNaklBALANCE_KOD.AsInteger<>ibcMPRus) and (Query.FieldByName('OTSRF2').AsInteger<>0) then
    begin
      DK_OTSR:= Query.FieldByName('OTSRF2').AsInteger;
    end;
    DK_PRIOR:= Query.FieldByName('OTSR_PRIOR').AsInteger;
    SetOtsr;
  end;
  Source.DataSet.FieldByName('DK_FROM_NAME').AsString :=
    Query.FieldByName('SHORTNAME_DK').AsString;

//  if OperStatus = iosReturnFromClient  then
//  begin
//    SetDK_C;
//  end;

  SetRules;
  if DefaultPrice<>0 then DocNaklPRICETYPE_.Value:=DefaultPrice;

end;

procedure TDocNaklForm.DocNaklDK_TOChange(Sender: TField);
var
  i,analitik_brand_case,analitik_contract:integer;
  analitic_contract_FROM,analitic_contract_TO:Boolean;
  ldsDK: TMegaDSDK;
begin

   DK_TO_CE.Enabled  := not CheckDKfromOper(o_DK_TO,sender,'Кому');
   DK_TO_ED.Enabled  := DK_TO_CE.Enabled;
   Source.DataSet.FieldByName('DK_TO_NAME').AsString:=IntfMegaCommon.GetShortNameDK(sender.AsFloat);

  if NoEvent then exit;
  if AntiRecusria then Exit;
  if bSelTT
   and (OPERSTATUS in [iosRealizationF1, iosRealizationF2, iosOFSubarenda, iosBrends,iosReturnStornoTT,iosPrePay,iosRealization,iosMaterWithDiscReal,iosIndikativ])
   and ((GetProvAttrib(Source.DataSet.FieldByName('GROUP_OPER').AsInteger,
    Source.DataSet.FieldByName('KOD_OPER').AsInteger,
    Source.DataSet.FieldByName('OPERDATE').AsDateTime,
    Schet, i,analitik_brand_case,
    analitik_contract,analitic_contract_FROM,analitic_contract_TO)) and (2048 or 4096) <> 0)
  then begin
    // нужен диалог выбора ТТ
    //для России если реализация по Ф2 и это конечный потребитель, то "выход"
    if ((IntfMegaDBCommon.GetCountry= iccRussia)or (IntfMegaDBCommon.GetCountry=kodRUS))and
       ((DocNaklDK_TO.AsFloat=999) OR (DocNaklDK_TO.AsFloat=9999)) and (OPERSTATUS=iosRealizationF2)
      then exit;
    mselDK_TO.koddk:=DocNaklDK_TO.Value;
    if mselDK_TO.OutletExecute then
    begin
      DocNaklDK_TO_NAME.AsString:= mselDK_TO.ShortnameDK;
      DocNaklBRAND_CASE_ID.AsInteger:= mselDK_TO.BrandCaseId;
      AddrPost(mselDK_TO);
    end
    else begin
      Source.DataSet.Cancel;
      // Sender. Clear; // showmessage('выбор ТТ отменен');
      exit;
    end;
    // mSelDK_TO.Options:=[dkoOnlySubDKF2,dkoSelTradeOutlet])
  end;

  //DBEdit2.ReadOnly:=false;
   cxDBse_Nacenka.Properties.ReadOnly:=true;
  if (((IntfMegaDBCommon.GetCountry=iccUkraine) and (IntfMegaDBCommon.IsOffice)) or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR')) then
      cxDBse_Nacenka.Properties.ReadOnly:=false;
   
   if OPERSTATUS=iosPrePay then
    cxDBse_Nacenka.Properties.ReadOnly:=CheckFromSubDog_ToNacenka;

  ldsDK:= TMegaDSDK.Create(Self); //набор данных - дебитор-кредитор
  try
    ldsDK.Database:= IntfDBProvider.GetDB;
    ldsDK.Transaction:= Nakl_Transaction;
    ldsDK.Open(Sender.AsFloat);

    Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant :=
      ldsDK.FieldDKBaseID.AsVariant;

    SetRules;
    if DefaultPrice<>0 then DocNaklPRICETYPE_.Value:=DefaultPrice;

    if   (Sender.AsFloat=DM.DKTDM)
      or (    (Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL)
          and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger= ibcAllBases)
          AND (Sender.AsFloat<>ddkEndUser)
         )
      or (Sender.AsFloat= DM.DKPP)
      or (Sender.AsFloat= ddkPeresort)
      or (Sender.AsFloat= ddkBoy)
      or (Sender.AsFloat=IntfMegaCommon.GetBalanceDK(
    DocNaklOPERDATE.AsDateTime,
    DocNaklDOCTYPE.AsString,
    DocNaklCfo.asInteger))
    then i:=0
    else i:=1;

    if  Source.DataSet.FieldByName('DOCTYPE').AsString[1]<>'П' then
    begin
      DK_OTSR:= ldsDK.FieldOtsr.AsInteger;

      if  (DocNaklBALANCE_KOD.AsInteger <> intfMegaCommon.GetMainFirmBalanceKod )
      and (ldsDK.FieldOtsrF2.AsInteger <> 0)
      then
      begin
        DK_OTSR:= ldsDK.FieldOtsrF2.AsInteger;
      end;
      DK_PRIOR:= ldsDK.FieldOtsrPrior.AsInteger;
      SetOtsr;
    end;
    if Source.DataSet.FieldByName('DK_TO_NAME').AsString<>ldsDK.FieldShortnameDK.AsString then
    Source.DataSet.FieldByName('DK_TO_NAME').AsString:=
      ldsDK.FieldShortnameDK.AsString;

    if OperStatus in [iosRealizationF1, iosRealizationF2,iosPrePay,iosRealization,iosMaterWithDiscReal,iosIndikativ]
    then
    begin
      SetDK_C(mselDK_TO);
    end;

    if not ((ldsDK.RecordCount = 0) or (not DocPos.IsEmpty)) then
    begin
      Source.DataSet.FieldByName('PRICE_FROM_VALYUTA').AsInteger :=
        ldsDK.FieldPriceFromValyuta.AsInteger;
     // Source.DataSet.FieldByName('NACENKA_').Value :=
     //   ldsDK.FieldPricePriceNacenka.AsFloat;
      if DefaultPrice=0 then Source.DataSet.FieldByName('PRICETYPE_').AsInteger :=
        ldsDK.FieldPriceType.AsInteger;

      {пересчет цен при изменении дебитора согласно его ценовой политики}
      if (Sender.OldValue<>null) and (Sender.OldValue <> Sender.NewValue) and (GetProvStatus<>iosBreakManufact) and
      (Application.MessageBox('Изменить цены в документе ?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES) then
      begin
{ ---------------- Changed by Lion in 25.12.2008 --------------- }
//        AntiRecusria := True;
//        DocNakl.Post;
//        AntiRecusria := False;
//        UpdateQuery.Close;
//        UpdateQuery.Params[0].AsInteger := DocNaklRECID.Value;
//        UpdateQuery.Params[1].AsInteger := DocNaklBASEID.Value;
//        UpdateQuery.Params[2].AsInteger := DocNaklPRICETYPE_.Value;
//        UpdateQuery.Params[3].AsInteger := DocNaklPRICE_FROM_VALYUTA.Value;
//        UpdateQuery.Params[4].AsDouble := DocNaklKURS.Value;
//        UpdateQuery.Params[5].AsInteger := 0;
//        UpdateQuery.ExecQuery;
//        DocPos.Close;
//        DocPos.Open;
//        Sum.Close;
//        Sum.Open;
        UpdatePosPrices;
{ ----------- End of changing by Lion in 25.12.2008 ----------- }
      end;
    end;

  finally
    ldsDK.Free;
  end;

  if i>0 then
  begin
    //DBEdit2.ReadOnly:= not CheckSubDiller(0); // zis true;
    AntiRecusria := True;
    if not (Source.DataSet.State in [dsInsert, dsEdit]) then
    begin
      Source.DataSet.Edit;
    end;
    NoEvent:=true;
      if GetProvStatus=iosBrends then Source.DataSet.FieldByName('PRICETYPE_').AsInteger := iptSpecial2
       else
       if GetProvStatus in [iosMaterWithDiscount,iosMaterWithDiscReal]
       then  Source.DataSet.FieldByName('PRICETYPE_').AsInteger:=iptDiscount
       else  if GetProvStatus<>iosBreakManufact then  Source.DataSet.FieldByName('PRICETYPE_').AsInteger := iptSpecial;
//      Source.DataSet.FieldByName('NACENKA_').AsFloat:=0;
    NoEvent:=false;

    AntiRecusria := False;
    if not (DocPos.IsEmpty) then
    begin
      try
        AntiRecusria := True;
        DocNakl.Post;
      finally
        AntiRecusria := false;
      end;
      UpdateQuery.Close;
      UpdateQuery.Params[0].AsInteger := DocNaklRECID.Value;
      UpdateQuery.Params[1].AsInteger := DocNaklBASEID.Value;
      UpdateQuery.Params[2].AsInteger := DocNaklPRICETYPE_.Value;
      UpdateQuery.Params[3].AsInteger := DocNaklPRICE_FROM_VALYUTA.Value;
      UpdateQuery.Params[4].AsDouble := DocNaklKURS.Value;
      UpdateQuery.Params[5].AsInteger := 0;
      UpdateQuery.ExecQuery;
    end;
    Refresh_NaklPos;
  end;

end;
procedure TDocNaklForm.DocNaklDONT_USE_SPEC_PRICEChange(Sender: TField);
var lAntiRecusriaPrev: boolean;
begin
  if NoEvent then exit;
  if AntiRecusria then Exit;
  {пересчет цен при изменении галочки}
  if (Sender.OldValue<>null) and (Sender.OldValue <> Sender.NewValue) and
     (Application.MessageBox('Изменить цены в документе ?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES) then
  begin
    UpdatePosPrices;

    Refresh_NaklPos;
  end;
end;

procedure TDocNaklForm.DocNaklIS_BANKETChange(Sender: TField);
var
   q: TMegaQuery;
begin

  Q := TMegaQuery.Create(Self);
  Q.Database := DM.Money;
  Q.Transaction := Nakl_Transaction;
  try
   if (DocNaklSTATE.OldValue = idsBug) and (DocNaklSTATE.NewValue=idsBug) then
    begin
      if not IntfMegaDBCommon.IsOffice then
        raise Exception.Create('Изменение в документе запрещено. Снимите признак оплаты!');
    end
    else
    begin
      Q.Close;
      Q.SQL.Text := 'update delivery_location dl set dl.is_banket=:is_banket where dl.docrecno=:recid and dl.baseid=:baseid and dl.formtype=:formtype;';
      Q.Params.ByName['RECID'].Value := DocNaklRecid.Value;
      Q.Params.ByName['baseid'].Value := DocNaklBaseid.Value;
      Q.Params.ByName['formtype'].Value := DocNaklDOC_INHERITED.asinteger;
      Q.Params.ByName['is_banket'].Value := liUtils.iif(chkIsBanket.checked,1,0);
      Q.ExecQuery;
      DocNakl.Edit;
      DocNaklState.value:=0;
    end;
  finally
    q.Free;
  end;
end;

//-----------------------------------------------------------------------

procedure TDocNaklForm.DK_TO_CEChange(Sender: TObject);
var
  Q: TMegaQuery;
begin
  Q := TMegaQuery.Create(Self);
  Q.Database := DM.Money;
  Q.Transaction := Nakl_Transaction;
  try
    Q.Close;
    Q.SQL.Text := 'SELECT MAX(DOC_END_DATE) END_DATE FROM DK_DOCS'
      + ' WHERE DK_DOCS.KOD_DK = :DK_TO AND DK_DOCS.DOC_VID=100';
    Q.Params.ByName['DK_TO'].Value := DocNaklDK_TO.Value;
    Q.ExecQuery;
    if Q.FieldByName('END_DATE').AsDateTime < DocNaklDOCDATE.AsDateTime then
    begin
      DK_TO_CE.Style.Font.Color := clBlue;
    end else
    if Q.FieldByName('END_DATE').AsDateTime-5 < DocNaklDOCDATE.AsDateTime then
    begin
      DK_TO_CE.Style.Font.Color := clBlue;
    end
    else
    begin
      DK_TO_CE.Style.Color := clWhite;
      DK_TO_CE.Style.Font.Color := clBlack;
    end;
    Q.Close;
    Q.SQL.Text := 'SELECT MAX(DOC_END_DATE) END_DATE FROM DK_DOCS, SPRAV_DOC_VIDS '
      + ' WHERE DK_DOCS.KOD_DK = :DK_TO AND DK_DOCS.DOC_VID<>100 AND DK_DOCS.DOC_VID = SPRAV_DOC_VIDS.DOC_VID AND SPRAV_DOC_VIDS.ALLOW_OUT = 1';
    Q.Params.ByName['DK_TO'].Value := DocNaklDK_TO.Value;
    Q.ExecQuery;
    if Q.FieldByName('END_DATE').AsDateTime < DocNaklDOCDATE.AsDateTime then
    begin
      DK_TO_CE.Style.Color := clBlack;
      DK_TO_CE.Style.Font.Color := clWhite;
    end else
    if Q.FieldByName('END_DATE').AsDateTime-5 < DocNaklDOCDATE.AsDateTime then
    begin
      DK_TO_CE.Style.Color := clRed;
      DK_TO_CE.Style.Font.Color := clWhite;
    end;
  finally
    Q.Free;
  end
end;

procedure TDocNaklForm.DocPosKOD_MATERChange(Sender: TField);
var
  virtPriceKod:integer;
begin
  if NoEvent then exit;
  { Выборка наименования ценности по коду }
  if KOD_CHANGED then
  begin
    KOD_CHANGED := False;
    Exit;
  end;
  Query.Close;
  if Sender = DocPosLOCAL_KOD then
    // выбор по локальному коду
    Query.SQL.Text := 'SELECT sm.*, spdv.PDVGROUP_STAVKA,  coalesce(sm.PDVGROUP, ''A'') as PDVGROUP_KOD, gm.OTSR, gm.OTSR_PRIOR, gm.COL COL1,'
    + ' (SELECT COUNT(*) FROM PRICE_KOLICH WHERE GROUP_MATER=sm.GROUP_MATER) PRICE_KOL, gm.TVID_KOD '
    + ' FROM SPRAV_MATER sm '
    + ' left join GROUP_MATER gm on gm.group_mater=sm.group_mater '
    + ' left join GET_PDV_STAVKA_BALANCE(' + IntToStr(DocNaklBALANCE_KOD.AsInteger) + ', ''' + DateToStrEx(DocNaklDATE_PDVSTAVKA.AsDatetime) + ''', sm.PDVGROUP) spdv on 1=1 '
    +' WHERE sm.LOCAL_KOD = ' + InttoStr(DocPosLOCAL_KOD.AsInteger)
  else begin
    if Sender = DocPosINVENTAR_NUMBER then
      // выбор по инветларному номеру
 //     Query.SQL.Text := 'SELECT SPRAV_MATER.*,SPRAV_PDVGROUP.PDVGROUP_STAVKA, PDVGROUP_KOD, GROUP_MATER.OTSR, GROUP_MATER.OTSR_PRIOR, GROUP_MATER.COL COL1,'
//      + ' (SELECT COUNT(*) FROM PRICE_KOLICH WHERE GROUP_MATER=SPRAV_MATER.GROUP_MATER) PRICE_KOL, GROUP_MATER.TVID_KOD '
//      + ' FROM SPRAV_MATER, SPRAV_PDVGROUP, GROUP_MATER WHERE INVENTAR_NUMBER = ' + ReplaceStr(FloatToStr(DocPosINVENTAR_NUMBER.AsFloat), ',', '.') + 'AND SPRAV_MATER.PDVGROUP=SPRAV_PDVGROUP.PDVGROUP_KOD AND  GROUP_MATER.GROUP_MATER=SPRAV_MATER.GROUP_MATER'
       Query.SQL.Text := 'SELECT sm.*, spdv.PDVGROUP_STAVKA,  coalesce(Sm.PDVGROUP, ''A'') as PDVGROUP_KOD, gm.OTSR, gm.OTSR_PRIOR, gm.COL COL1,'
    + ' (SELECT COUNT(*) FROM PRICE_KOLICH WHERE GROUP_MATER=sm.GROUP_MATER) PRICE_KOL, gm.TVID_KOD '
    + ' FROM SPRAV_MATER sm '
    + ' left join GROUP_MATER gm on gm.group_mater=sm.group_mater '
    + ' left join GET_PDV_STAVKA_BALANCE(' + IntToStr(DocNaklBALANCE_KOD.AsInteger) + ', ''' + DateToStrEx(DocNaklDATE_PDVSTAVKA.AsDatetime) + ''', Sm.PDVGROUP) spdv on 1=1 '
    +' WHERE sm.INVENTAR_NUMBER = ' + ReplaceStr(FloatToStr(DocPosINVENTAR_NUMBER.AsFloat), ',', '.')
    else
      // выбор по коду товара
      Query.SQL.Text := 'SELECT sm.*, spdv.PDVGROUP_STAVKA,  coalesce(Sm.PDVGROUP, ''A'') as PDVGROUP_KOD, gm.OTSR, gm.OTSR_PRIOR, gm.COL COL1,'
    + ' (SELECT COUNT(*) FROM PRICE_KOLICH WHERE GROUP_MATER=Sm.GROUP_MATER) PRICE_KOL, Gm.TVID_KOD '
    + ' FROM SPRAV_MATER sm '
    + ' left join GROUP_MATER gm on gm.group_mater=sm.group_mater '
    + ' left join GET_PDV_STAVKA_BALANCE(' + IntToStr(DocNaklBALANCE_KOD.AsInteger) + ', ''' + DateToStrEx(DocNaklDATE_PDVSTAVKA.AsDatetime) + ''', Sm.PDVGROUP) spdv on 1=1 '
    +' WHERE sm.kod_mater = ' + ReplaceStr(FloatToStr(DocPosKOD_MATER.AsFloat), ',', '.') ;
  end;
  Query.ExecQuery;
  DocPosSource.DataSet.FieldByName('NAME_MATER').AsString :=Query.FieldByName('NAME_MATER').AsString;
  DocPosSource.DataSet.FieldByName('COUNTINBOX_').AsInteger := Query.FieldByName('COUNTINBOX').AsInteger;
  DocPosSource.DataSet.FieldByName('COUNT_PACK_BOX').AsInteger := Query.FieldByName('COUNT_PACK_BOX').AsInteger;
  DocPosSource.DataSet.FieldByName('COUNTINBOX_METRO').AsInteger := Query.FieldByName('COUNTINBOX_METRO').AsInteger;
  DocPosSource.DataSet.FieldByName('ED_IZM').AsString := Query.FieldByName('ED_IZM').AsString;
  KOD_CHANGED := True;
  DocPosSource.DataSet.FieldByName('KOD_MATER').AsFloat := Query.FieldByName('KOD_MATER').AsDouble;
  KOD_CHANGED := True;
  DocPosSource.DataSet.FieldByName('KOD_EAN').AsFloat := Query.FieldByName('KOD_EAN').AsDouble;
  DocPosSource.DataSet.FieldByName('LOCAL_KOD').AsFloat := Query.FieldByName('LOCAL_KOD').AsInteger;
  KOD_CHANGED := True;
  DocPosSource.DataSet.FieldByName('INVENTAR_NUMBER').AsFloat := Query.FieldByName('INVENTAR_NUMBER').AsDouble;
  DocPosSource.DataSet.FieldByName('TOSALE').AsInteger := Query.FieldByName('TOSALE').AsInteger;
  case IntfMegaDBCommon.GetCountry of
    iccUkraine : DocPosSource.DataSet.FieldByName('IND').AsInteger := Query.FieldByName('INDIKATIV').AsInteger * liUtils.iif(DocNaklBALANCE_KOD.AsInteger<>11,1,0);//для баланса 11 идикатив не ставим равным 0 (магазин в на лвз полтавы)
    iccRussia : DocPosSource.DataSet.FieldByName('IND').AsInteger := 0;
  end;

  DocPosSource.DataSet.FieldByName('PDV').AsString := Query.FieldByName('PDVGROUP_KOD').AsString;
  DocPosSource.DataSet.FieldByName('PDVGROUP_STAVKA').AsFloat := Query.FieldByName('PDVGROUP_STAVKA').AsInteger;
  DocPosSource.DataSet.FieldByName('TARA_MATER').Value := Query.FieldByName('TARA_MATER').Value;
  DocPosSource.DataSet.FieldByName('KOLICH').Value := 0;
  DocPosSource.DataSet.FieldByName('COL1').AsInteger := Query.FieldByName('COL1').AsInteger;
  DocPosSource.DataSet.FieldByName('PRICE_KOL').AsInteger := Query.FieldByName('PRICE_KOL').AsInteger;
  DocPosSource.DataSet.FieldByName('TVID_KOD').AsInteger := Query.FieldByName('TVID_KOD').AsInteger;  

 {Запрет изменения цены в зависимости от колонки}
{  if IntfMegaDBCommon.GetBaseID=1 then EditNaklPos.Price1Edit.ReadOnly:=false else
  EditNaklPos.Price1Edit.ReadOnly:= (DocPos.FieldByName('COL1').AsInteger = 1) AND (DocNaklDK_TO.AsFloat<>DM.DKTDM) and (DocNaklDK_TO.AsFloat<>DM.DKPP) and (DocNaklDK_TO.AsFloat<>14) and (DocNaklDK_TO.AsFloat<>999) and (DocNaklDK_TO.AsFloat<>1017);
  EditNaklPos.Price2Edit.ReadOnly:=EditNaklPos.Price1Edit.ReadOnly;
  EditNaklPos.RxDBCalcSumma1Edit.ReadOnly:=EditNaklPos.Price1Edit.ReadOnly;
  EditNaklPos.RxDBCalcSumma2Edit.ReadOnly:=EditNaklPos.Price1Edit.ReadOnly;
  EditNaklPos.Ind_Price.ReadOnly:=EditNaklPos.Price1Edit.ReadOnly;
  EditNaklPos.Ind_Summa.ReadOnly:=EditNaklPos.Price1Edit.ReadOnly;
  EditNaklPos.WithPdvPrice.ReadOnly:=EditNaklPos.Price1Edit.ReadOnly;
  EditNaklPos.SummaWPDV.ReadOnly:=EditNaklPos.Price1Edit.ReadOnly;
  EditNaklPos.RxDBCalcEdit3.ReadOnly:=EditNaklPos.Price1Edit.ReadOnly;
  EditNaklPos.RxDBCalcEdit1.ReadOnly:=EditNaklPos.Price1Edit.ReadOnly;
  EditNaklPos.RxDBCalcEdit4.ReadOnly:=EditNaklPos.Price1Edit.ReadOnly;
  EditNaklPos.RxDBCalcEdit2.ReadOnly:=EditNaklPos.Price1Edit.ReadOnly;}
 {*******}

  if (DocNaklBALANCE_KOD.AsInteger<>IntfMegaCommon.GetMainFirmBalanceKod) and (DocNaklDOCTYPE.AsString[1]<>'П') and (DocNaklDOCTYPE.AsString[1]<>'Р') and (DocNaklDK_TO.AsFloat<>999) then
  begin
    if Query.FieldByName('GROUP_MATER').AsInteger=2 then begin
//      Query3.Transaction.Active:=false;
//      Query3.Transaction.Active:=true;
      Query3.Close;
      Query3.SQL.Text:='select count(*) from sprav_prov where group_oper='+
      DocNaklGROUP_OPER.AsString+
      ' and kod_oper='+
      DocNaklKOD_OPER.AsString+
      ' and balance_kod='+
      DocNaklBALANCE_KOD.AsString+
      ' and kredit='+#39+'41/50'+#39;
      Query3.ExecQuery;
      if Query3.Fields[0].AsInteger=0
      then
      begin
         Query3.Close;
         Query3.SQL.Text:='SELECT BEGIN_KOLICH FROM OPERLIST_QUERY1('+
         DocNaklBALANCE_KOD.AsString+','+#39+'41/50'+#39+','+#39+#39+','+#39+DateToStr(DocNaklOPERDATE.AsDateTime+1)+#39+','
         +#39+DateToStr(DocNaklOPERDATE.AsDateTime+1)+#39+','+'null,'+FloatToStr(DocPosSource.DataSet.FieldByName('KOD_MATER').AsFloat)+
         ',0)';


{         ?BALANCE,?SCHET,?SUBSCHET,?BDATE,?EDATE,?KODDK,?KODMATER,?VALYUTA)';
         Query3.Params[0].AsInteger :=DocNaklBALANCE_KOD.AsInteger;
         Query3.Params[1].AsString  := '41/50';
         Query3.Params[2].AsString  := '';
         Query3.Params[3].AsDateTime  := DocNaklOPERDATE.AsDateTime;
         Query3.Params[4].AsDateTime  := DocNaklOPERDATE.AsDateTime;
         Query3.Params[5].AsVariant := null;
         Query3.Params[6].AsDouble := DocPosSource.DataSet.FieldByName('KOD_MATER').AsFloat;
         Query3.Params[7].AsInteger := 0; }
         Query3.ExecQuery;

        if  not ((Query3.Fields[0].AsFloat=0) or (Query3.Fields[0].AsVariant=NULL)) then
        begin
          Application.MessageBox('Товар есть на складе 50', 'Внимание !', MB_OK + MB_ICONWARNING);
          DocPos.Cancel;
          DocPos.Append;
          exit;
        end;
      end;
    end;
  end;


  if POS_OTSR<>Query.FieldByName('OTSR').AsInteger then
  begin
    if DocPos.RecordCount=0 then begin
      POS_OTSR:=Query.FieldByName('OTSR').AsInteger;
      POS_PRIOR:=Query.FieldByName('OTSR_PRIOR').AsInteger;
    end else
    begin
      if (POS_OTSR<>Query.FieldByName('OTSR').AsInteger) and (not NoOtsr) then
      begin
              Application.MessageBox('Набивайте позиции с отличающимися отсрочками в разных накладных', 'Внимание !', MB_OK + MB_ICONWARNING);
              DocPos.Cancel;
              DocPos.Append;
              exit;
      end else
      if POS_PRIOR<Query.FieldByName('OTSR_PRIOR').AsInteger then POS_PRIOR:=Query.FieldByName('OTSR_PRIOR').AsInteger;
    end;
  end;
  //SetOtsr;


{  Query.Close;
  Query.SQL.Text :=
    'DELETE FROM OPER_JORNAL WHERE'+
    ' DOCRECNO = ' + DocNaklRECID.AsString +
    ' AND BASEID = ' + DocNaklBASEID.AsString +
    ' AND FORMTYPE = ' + DocNaklDOC_INHERITED.AsString +
    ' AND SUBDOCRECNO = ' + DocPosRECID.AsString;
  Query.ExecQuery;}
  GetRest;

  if Schet = ''  then Exit;
  if (OPERSTATUS in [iosMaterWithDiscount,iosMaterWithDiscReal]) then
      virtPriceKod:=iptDiscount
  else
      virtPriceKod:=DocNaklPRICETYPE_.AsInteger;

  Query.Close;
  Query.SQL.Text :='SELECT first 1 coalesce(so.NOT_CONTROL_PRICE,0)   FROM SPRAV_OPER so where so.GROUP_OPER='+IntToStr(DocNaklGROUP_OPER.Value)+' and so.KOD_OPER='+IntToStr(DocNaklKOD_OPER.Value)+';';
  Query.ExecQuery;
  if Query.Fields[0].AsInteger<>1 then
    begin
      Query.Close;
      if ((((IntfMegaDBCommon.GetCountry = iccRussia) OR (IntfMegaDBCommon.GetCountry = kodRUS))
      AND (not intfMegaDBCommon.IsOffice)) OR (IntfMegaDBCommon.GetCountry = iccUSA)) then
        Query.SQL.Text :=
          'SELECT * FROM PROC_GET_MATER_PRICE_DK_OUTLET(' + DocPosKOD_MATER.AsString + ', ''' +
          DateToStr(DocNaklOPERDATE.Value) + ''',  ' +
          DocNaklBALANCE_KOD.AsString + ', ''' + Schet + ''', ' +
          {DocNaklPRICETYPE_.AsString}IntToStr(virtPriceKod)
          + ', ' + InVal.DataBinding.Field.AsString
          + ', ' + FloatToStr(ClientDK)
          + ', ' + DocNaklCFO.asstring
          + ', ' + IntToStr(NaklOutletRecid)
          + ', ' + IntToStr(NaklOutletBaseid)
          { ---------------- Added by Lion in 24.12.2008 --------------- }
          {           Накладную нужно создавать по ценам региона           }
          + liUtils.iif((Trim(DocNaklADDR_TO.asstring) = '') or (DocNaklCFO.asInteger = DocNaklADDR_TO.AsInteger), ' ,null ', ', ' + DocNaklADDR_TO.asstring)
          + ', null, 0, null , '''+DateToStr(DocNaklDOC_CREATE.Value)+''''
          { ----------- End of changing by Lion in 24.12.2008 ----------- }
          + ')'
      else
        Query.SQL.Text :=
          'SELECT * FROM C_GET_MATER_PRICE_TO_DK(' + DocPosKOD_MATER.AsString + ', ''' +
          DateToStr(DocNaklOPERDATE.Value) + ''',  ' +
          DocNaklBALANCE_KOD.AsString + ', ''' + Schet + ''', ' +
          {DocNaklPRICETYPE_.AsString}IntToStr(virtPriceKod)
          + ', ' + InVal.DataBinding.Field.AsString
          + ', ' + FloatToStr(ClientDK)
          + ', ' + DocNaklCFO.asstring
          { ---------------- Added by Lion in 24.12.2008 --------------- }
          {           Накладную нужно создавать по ценам региона - в Украине не нужно           }
          //      + liUtils.iif(Trim(DocNaklADDR_TO.asstring) = '', '', ', ' + DocNaklADDR_TO.asstring)
          { ----------- End of changing by Lion in 24.12.2008 ----------- }
          + ')';

      Query.ExecQuery;
      if (InVal.DataBinding.Field.AsInteger = DocNaklV.AsInteger)or
         (not EditNaklPos.Price2Edit.visible)
      then
        begin
          EditNaklPos.ActiveControl := EditNaklPos.Price1Edit;
          DocPosPrice1.Value := Query.Fields[0].AsDouble;
          DocPosPrice2.Value := Query.Fields[0].AsDouble * DocNaklKURS.Value;
          EditNaklPos.Price2Edit.Value := Query.Fields[0].AsDouble * DocNaklKURS.Value;
          EditNaklPos.Price1Edit.Value := Query.Fields[0].AsDouble;
        end
      else
        begin
          EditNaklPos.ActiveControl := EditNaklPos.Price2Edit;
          DocPosPrice2.Value := Query.Fields[0].AsDouble;
          DocPosPrice1.Value := Query.Fields[0].AsDouble / DocNaklKURS.Value;
          EditNaklPos.Price1Edit.Value := Query.Fields[0].AsDouble / DocNaklKURS.Value;
          EditNaklPos.Price2Edit.Value := Query.Fields[0].AsDouble;
        end;


      DocPosPrice1_.Value := DocPosPrice1.Value * (1 + DocNaklNACENKA_.Value/100);
      DocPosPrice2_.Value := DocPosPrice2.Value * (1 + DocNaklNACENKA_.Value/100);
      EditNaklPos.Ind_price.Value := Query.Fields[3].AsDouble;
      if DocNaklNDSINSUMMA.Value = 0 then
        begin
          EditNaklPos.Ind_price.Value := EditNaklPos.Ind_price.Value * (1+DocPosPDVGROUP_STAVKA.AsFloat/100);
          EditNaklPos.WithPdvPrice.Value := DocPosPrice2.Value * (1+DocPosPDVGROUP_STAVKA.AsFloat/100);
        end;
      EditNaklPos.Panel3.Visible := DocPos.FieldByName('IND').AsInteger = 1;
      DocPosInd_SUMMA.Value := EditNaklPos.Ind_price.Value * DocPos.FieldByName('KOLICH').AsFloat;
       //added by lutsenko 18.07.2002
      if not IntfMegaDBCommon.IsOffice then
        begin
         If   ((Query.FieldIndex['IND_'] >= 0) and  (Query.FieldByName('IND_').AsInteger<>0))
            or ((Query.FieldIndex['IND1'] >= 0) and  (Query.FieldByName('IND1').AsDouble<>0))
         then
           begin
             DocPosSource.DataSet.FieldByName('IND').AsInteger:=1;  EditNaklPos.Panel3.Visible := DocPos.FieldByName('IND').AsInteger = 1;
           end;
        end;
      //end of added by lutenko
   end
      else
        begin
          DocPosPrice2.Value := 0;
          DocPosPrice1.Value := 0;
          EditNaklPos.Price1Edit.Value := 0;
          EditNaklPos.Price2Edit.Value := 0;
          DocPosPrice1_.Value := 0;
          DocPosPrice2_.Value := 0;
          EditNaklPos.Ind_price.Value := 0;
          if DocNaklNDSINSUMMA.Value = 0 then
            EditNaklPos.WithPdvPrice.Value := 0;
          EditNaklPos.Panel3.Visible := False;
          DocPosInd_SUMMA.Value := 0;
        end;

  KOD_CHANGED := False;
  EditNaklPos.ActiveControl := EditNaklPos.RxDBCalcKolichEdit;
end;

var
  MATER: Double;
  KOLICH: Double;
  PACK_RECID: Integer;

procedure TDocNaklForm.AddSelectedMater;
var
  I: Integer;

procedure Add(KOD: Double);
begin
  DocPos.Append;
  DocPosKOD_MATER.Value := KOD;
{BS+} if (IntfMegaDBCommon.GetBaseID<>2) then  EditNaklPos.NotCheckRest:=((DocNaklDOCTYPE.AsString[1]='З') OR (OPERSTATUS in [iosSpecification, iosRealization, iosZMC, iosCorrectReturn]) );  //btSep.Down;}
  if EditNaklPos.ShowModal = mrOk then
    if DocPosTARA_MATER.Value <> 0 then
    begin
      DocPos.ConfirmPost := False;
      MATER := DocPosTARA_MATER.Value;
      KOLICH := DocPosKOLICH.Value;
      if DocPos.Locate('KOD_MATER', DocPosTARA_MATER.Value, []) then
        DocPos.Edit
      else
      begin
        DocPos.Append;
        DocPosKOD_MATER.Value := MATER;
      end;
      DocPosSUMMA.Value := (DocPosKOLICH.Value + KOLICH) * DocPosPrice1.Value;
      DocPosSUMMA1.Value := (DocPosKOLICH.Value + KOLICH) * DocPosPrice2.Value;
      DocPosKOLICH.Value := DocPosKOLICH.Value + KOLICH;
      DocPos.Post;
      DocPos.ConfirmPost := True;

      sumPDVScidcka:= sumPDVScidcka+DocPosPRICE_PREV.Value;

    end;
end;

begin
  if Catalog.DragDBGrid.SelectedRows.Count = 0 then
    Add(KOD_MATER)
  else
    for I := 0 to Catalog.DragDBGrid.SelectedRows.Count-1 do
    begin
      Catalog.DragDbGrid.DataSource.DataSet.Bookmark := Catalog.DragDbGrid.SelectedRows[I];
      Add(Catalog.DragDbGrid.DataSource.DataSet.FieldByName('KOD_MATER').asFloat);
    end
end;

procedure TDocNaklForm.AddMater;
begin
  AddSelectedMater;
end;

procedure TDocNaklForm.ACatalogExecute(Sender: TObject);
procedure Add(KOD: Double);
begin
  DocPos.Append;
  DocPosKOD_MATER.Value := KOD;
{BS+} if (IntfMegaDBCommon.GetBaseID<>2) then  EditNaklPos.NotCheckRest:=((DocNaklDOCTYPE.AsString[1]='З') OR (OPERSTATUS in [iosSpecification, iosRealization,iosZMC, iosCorrectReturn]) );  //btSep.Down;}
  if EditNaklPos.ShowModal = mrOk then
    if DocPosTARA_MATER.Value <> 0 then
    begin
      DocPos.ConfirmPost := False;
      MATER := DocPosTARA_MATER.Value;
      KOLICH := DocPosKOLICH.Value;
      if DocPos.Locate('KOD_MATER', DocPosTARA_MATER.Value, []) then
        DocPos.Edit
      else
      begin
        DocPos.Append;
        DocPosKOD_MATER.Value := MATER;
      end;
      DocPosSUMMA.Value := (DocPosKOLICH.Value + KOLICH) * DocPosPrice1.Value;
      DocPosSUMMA1.Value := (DocPosKOLICH.Value + KOLICH) * DocPosPrice2.Value;
      DocPosKOLICH.Value := DocPosKOLICH.Value + KOLICH;
      DocPos.Post;
      DocPos.ConfirmPost := True;
            sumPDVScidcka:= sumPDVScidcka+DocPosPRICE_PREV.Value;
    end;
end;
var i:double;
begin
  CatalogMode(Self);
  //i:=5;
  //i:=5/0;
  {if MegaSelMaterDialog1.Execute then
   if MegaSelMaterDialog1.KodMater<>0 then
      begin
      //PostMessage(nil , 39980, 0, 0);
      //Add(MegaSelMaterDialog1.KodMater);
      AddSelectedMater;
      end;     }
end;

procedure TDocNaklForm.DeleteExecute(Sender: TObject);
var
 i:integer;
 StrListRECID : TStringList;
 StrListBASEID : TStringList;
begin

  if DBGridEh1.SelectedRows.Count>0 then
  begin
    if (Application.MessageBox('Вы действительно хотите удалить выбранные позиции?','Подтверждение', MB_YESNO+MB_ICONQUESTION) = IDYES) then
      Begin
        StrListRECID := TStringList.Create;
        StrListBASEID := TStringList.Create;
        // сохраняю RecID, BaseID
        For i:=0 to DBGridEh1.SelectedRows.Count-1 do
          Begin
            DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
            StrListBASEID.Add(DocPosBASEID.AsString);
            StrListRECID.Add(DocPosRECID.AsString);
          End;

        // по RecID, BaseID, выполняю delete
        For i:=0 to StrListRECID.count - 1  do
          Begin
            if DocPos.Locate('BASEID;RECID',
                             VarArrayOf([StrListBASEID.Strings[I], StrListRECID.Strings[I]]), []) then
              DeletePosNakl(1);
          End;

        StrListBASEID.Destroy;
        StrListRECID.Destroy;
      End;
  end
  else
    DeletePosNakl(0);

end;


procedure TDocNaklForm.EditExecute(Sender: TObject);
var
  OLD_KOLICH: Double;
begin
  // если нет прав
  try  // если нет прав, то открываю формочку только для чтения
    DocPosSource.Dataset.Edit;
    EditNaklPos.ReadOnly := false;
  except
    EditNaklPos.ReadOnly := true;
  end;

  if pos('U',GetCurrentUserRights('DOC_NAKL',''))>0 then
    DocPosSource.Dataset.Edit;
  ChangeKolich:=false;
  OLD_KOLICH := DocPosKOLICH.Value;
{BS+}  if (IntfMegaDBCommon.GetBaseID<>2) then  EditNaklPos.NotCheckRest:=((DocNaklDOCTYPE.AsString[1]='З') OR (OPERSTATUS in [iosSpecification, iosRealization,iosZMC, iosCorrectReturn]) ); //btSep.Down; }
  if (EditNaklPos.ShowModal = mrOk) and
     (DocPosTARA_MATER.Value <> 0) and
     (not EditNaklPos.ReadOnly) then
  begin
    DocPos.ConfirmPost := False;
    MATER := DocPosTARA_MATER.Value;
    KOLICH := DocPosKOLICH.Value - OLD_KOLICH;
    if DocPos.Locate('KOD_MATER', DocPosTARA_MATER.Value, []) then
    begin
      DocPos.Edit;
      DocPosSUMMA.Value := (DocPosKOLICH.Value + KOLICH) * DocPosPrice1.Value;
      DocPosSUMMA1.Value := (DocPosKOLICH.Value + KOLICH) * DocPosPrice2.Value;
      DocPosKOLICH.Value := DocPosKOLICH.Value + KOLICH;
      DocPos.Post;
             sumPDVScidcka:= sumPDVScidcka+DocPosPRICE_PREV.Value;
    end;
    DocPos.ConfirmPost := True;
  end;
  EditNaklPos.ReadOnly := false;
  if ChangeKolich then
  begin
    UpdateQueryKol.Close;
    UpdateQueryKol.Params[0].AsInteger := DocNaklRECID.Value;
    UpdateQueryKol.Params[1].AsInteger := DocNaklBASEID.Value;
    UpdateQueryKol.Params[2].AsInteger := DocNaklPRICETYPE_.Value;
    UpdateQueryKol.Params[3].AsInteger := DocNaklPRICE_FROM_VALYUTA.Value;
    UpdateQueryKol.Params[4].AsDouble := DocNaklKURS.Value;
    UpdateQueryKol.Params[5].AsInteger := 3;
    UpdateQueryKol.ExecQuery;
    DocPos.Close;
    DocPos.Open;
    Sum.Close;
    Sum.Open;
    ChangeKolich:=false;
  end;
end;

procedure TDocNaklForm.InsertExecute(Sender: TObject);
var
  mr: Integer;
begin
  //25.01.2005
  // Игнат К.
  if DocNakl.State in [dsInsert] then
    DocNakl.Post;
  mr := mrOk;
  ChangeKolich:=false;
  while mr = mrOk do
  begin
    DocPosSource.Dataset.Append;
{ BS+}  if (IntfMegaDBCommon.GetBaseID<>2) then  EditNaklPos.NotCheckRest:=((DocNaklDOCTYPE.AsString[1]='З') OR (OPERSTATUS in [iosSpecification, iosRealization,iosZMC, iosCorrectReturn]) );  //btSep.Down; }
    mr := EditNaklPos.ShowModal;
    if mr = mrOk then
      if DocPosTARA_MATER.Value <> 0 then
      begin
        DocPos.ConfirmPost := False;
        MATER := DocPosTARA_MATER.Value;
        KOLICH := DocPosKOLICH.Value;
        if DocPos.Locate('KOD_MATER', DocPosTARA_MATER.Value, []) then
          DocPos.Edit
        else
        begin
          DocPos.Append;
          DocPosKOD_MATER.Value := MATER;
          if (DocNaklDK_TO_COUNTRY.AsInteger  <> kodRUS)
          and (DocNaklDK_TO_COUNTRY.AsInteger <> kodUKR)
          and (OPERSTATUS in [iosSpecification,iosInvoiceProf,iosInvoicePrePaid,iosInvoiceForPay])
//          and (DocNaklKOD_OPER.AsInteger = 999992)
//          and (DocNaklGROUP_OPER.AsInteger = 77024000)
          then DocPosPACK_RECID.Value := PACK_RECID;
        end;

        DocPosSUMMA.Value := (DocPosKOLICH.Value + KOLICH) * DocPosPrice1.Value;
        DocPosSUMMA1.Value := (DocPosKOLICH.Value + KOLICH) * DocPosPrice2.Value;
        DocPosKOLICH.Value := DocPosKOLICH.Value + KOLICH;
        DocPos.Post;
        DocPos.ConfirmPost := True;
              sumPDVScidcka:= sumPDVScidcka+DocPosPRICE_PREV.Value;
      end;
  end;
  if ChangeKolich then
  begin
    UpdateQueryKol.Close;
    UpdateQueryKol.Params[0].AsInteger := DocNaklRECID.Value;
    UpdateQueryKol.Params[1].AsInteger := DocNaklBASEID.Value;
    UpdateQueryKol.Params[2].AsInteger := DocNaklPRICETYPE_.Value;
    UpdateQueryKol.Params[3].AsInteger := DocNaklPRICE_FROM_VALYUTA.Value;
    UpdateQueryKol.Params[4].AsDouble := DocNaklKURS.Value;
    UpdateQueryKol.Params[5].AsInteger := 3;
    UpdateQueryKol.ExecQuery;

    Refresh_NaklPos;
    ChangeKolich:=false;
  end;
end;

procedure TDocNaklForm.CloseFormExecute(Sender: TObject);
begin
  Close;
end;

procedure TDocNaklForm.PrintExecute(Sender: TObject);
begin
  // проверяю, если на дебиторе выставлена галочка "печать с учетом возвратов",
  // то делаю видимым пункт "Печать накладной с учетом возвратов"
  PrintNaklWithVozvrat.Visible := DocNaklDK_TO_PRINT_WITH_VOZVRAT.AsInteger = 1;

  (**)
  FDesignReport := ((UpperCase(IntfMegaAccessManager.GetUserRole) = 'DEVELOPER')
                 or DebugMode);
  (**)
  if (IntfMegaDBCommon.GetCountry = iccUkraine) OR (IntfMegaDBCommon.GetCountry = kodUKR) then
  begin
    if (GetProvStatus=iosOFSubarenda) or (GetProvStatus=22) then
    begin
      if not (IntfMegaDBCommon.IsOffice) then
      begin
        if CheckAndMakeIfDocNeedSogl(False) then
        pmPrintReklama.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y)
      end
      else
        pmPrintReklama.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y);
    end
    else pmPrint.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y);
  end
  else
    if (IntfMegaDBCommon.GetCountry = iccRussia) OR (IntfMegaDBCommon.GetCountry = kodRUS) then
      pmPrintRu.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y)
      else
        if (IntfMegaDBCommon.GetCountry = iccUSA) OR (IntfMegaDBCommon.GetCountry = kodUSD) then
          pmPrintUSA.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y);

end;

procedure TDocNaklForm.EditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not DocPosSource.Dataset.IsEmpty
                             and ((ActiveControl = nil) or (ActiveControl.Tag = 100));
end;

procedure TDocNaklForm.DBGridEH1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := TComponent(Source).Tag = 100;
end;

procedure TDocNaklForm.DBGridEH1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  AddSelectedMater;
end;

procedure TDocNaklForm.InsertUpdate(Sender: TObject);
begin
  if ActiveControl<>nil then
     TAction(Sender).Enabled := ActiveControl.Tag = 100;
end;

procedure TDocNaklForm.CreateDocExecute(Sender: TObject);
begin
{BS+}  if (DocNaklDOCTYPE.AsString[1]='З') and (DocNaklDOCTYPE.AsString[2]='А') and (IntfMegaDBCommon.GetBaseID<>2) then exit;
  CreatePopup.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y);
end;

procedure TDocNaklForm.CreatePDVNaklExecute(Sender: TObject);
//21/05/2002 - луценко - изменил логику процедуры, чтобы не только создавало , но и показывало налоговые накладные
var
  fff:TMakePDVNForm;
  i: integer;
begin
  //if OPERSTATUS=6 then exit; убрал проверку пусть регулируется статусом НДС в операции
  if PosModified then
    if not CheckRest(True) then
      Exit;
  if  not (DocNakl.State in [dsEdit, dsInsert]) then
   begin
     Query2.Close;
     Query2.SQL.Text := 'execute procedure set_context_variable(''CHANGE_PERMITTED'',''1'')';
     Query2.ExecQuery;
   end;
  DocNakl.ConfirmPost := True;
  DocNakl.AutoPost := True;
  DocNakl.Edit;
  if  (DocNaklSTATE.Value<>idsBug)
  and (DocNaklSTATE.Value<>idsKassa)
  and (DocNaklSTATE.Value<>idsOFDogovor)
  then DocNaklSTATE.Value := 2;

  try
    DocNakl.SafePost;
  except end;

  i:=0;
  Query3.Close;
  Query3.SQL.Text :=
    ' select so.scquan from sprav_oper so where so.group_oper= '+DocNaklGROUP_OPER.AsString+' and so.kod_oper= '+DocNaklKOD_OPER.AsString;
  Query3.ExecQuery;
  i:=Query3.Fields[0].AsInteger;
  if i>0 then begin
    Query3.Close;
    Query3.SQL.Text :=
      'select count(*) from link_doc ld left join pdv_nakl pn on pn.recid=ld.doc_recid and pn.baseid=ld.doc_baseid '+
      ' where ld.parent_recid='+DocNaklRECID.AsString+' and ld.parent_baseid='+DocNaklBASEID.AsString+' and ld.parent_form_type='+DocNaklDOC_INHERITED.AsString+
      ' and ld.doc_form_type='+sdtPdvNakl+' and pn.recid<>0';
    Query3.ExecQuery;
    if Query3.Fields[0].AsInteger>0 then begin
       i:=i-Query3.Fields[0].AsInteger;
       if i<=0
        then i:=98
        else
         if Application.MessageBox('Допустимо создание нескольких документов.Создать?','Внимание',MB_YESNO)=ID_YES then begin
            I:=-99
         end
         else i:=99;
    end;
  end;

  if i<>-99 then begin
    Query3.Close;
    Query3.SQL.Text :=
      ' select recid,baseid from pdv_nakl where nakl_baseid = '+DocNaklBASEID.AsString+' and nakl_recid = '+DocNaklRECID.AsString;
    Query3.Prepare;
    Query3.ExecQuery;
  end;

  if (Query3.EOF and Query3.BOF)or(i=-99) then //налоговой не существует - создаём
  begin
//    fff:=TMakePDVNForm.Create(self,DocNaklRECID.Value,DocNaklBASEID.Value,DocNaklDOC_INHERITED.Value,DocNaklBALANCE_KOD.Value);
    fff:=TMakePDVNForm.Create(self,DocNaklRECID.Value,DocNaklBASEID.Value,DocNaklDOC_INHERITED.Value,DocNaklBALANCE_KOD.Value,DocNaklCFO.asString);
    fff.DateEdit1.Text := DateToStr(DocNaklOPERDATE.AsDateTime);
    fff.ShowModal;
    DocNakl.ConfirmPost := False;
    DocNakl.AutoPost := False;
  end
  else begin //налоговая уже существует - открываем
    if IntfMegaDBCommon.GetCountry in [iccRussia] then
            Application.MessageBox(PChar('По данной накладной уже создан счет-фактура'),Pchar('Внимание'),MB_OK+MB_ICONINFORMATION);
    if IntfMegaDBCommon.GetCountry in [iccUkraine] then
            Application.MessageBox(PChar('По данной накладной уже существует налоговая накладная'),Pchar('Внимание'),MB_OK+MB_ICONINFORMATION);
//          ShowMessage('По данной накладной уже существует налоговая накладная');
    if Query3.FieldByName('recid').AsInteger<>0 then
    OpenDocument(Application,12,Query3.FieldByName('recid').AsInteger,Query3.FieldByName('baseid').AsInteger,date,null);
{    PDVKey := VarArrayOf([Query3.FieldByName('recid').AsInteger, Query3.FieldByName('baseid').AsInteger]);

    for i := 0 to Application.MainForm.MDIChildCount - 1 do
      SendMessage(Application.MainForm.MDIChildren[I].Handle, MSG_PDV_NAKL, DocNaklBALANCE_KOD.AsInteger, 0);
    if (I = Application.MainForm.MDIChildCount) then
    begin
      SendMessage(TPDVListForm.Create(Application).Handle, MSG_PDV_NAKL, DocNaklBALANCE_KOD.AsInteger, 0);
    end;}

  end;


end;


procedure TDocNaklForm.SumBeforeOpen(DataSet: TDataSet);
begin
  Sum.Params[0].AsInteger := DocNaklRecID.Value;
  Sum.Params[1].AsInteger := DocNaklBASEID.Value;
  Sum.Params[2].AsString := DocNaklDOCTYPE.Value;
end;

procedure TDocNaklForm.DocNaklV1Change(Sender: TField);
begin
  if NoEvent then exit;
  cdsVal.Close;
  cdsVal.CreateDataSet;
  cdsVal.Open;
  cdsVal.Insert;
  cdsValVal.Value:=DocNaklV.Value;
  cdsValName.Value:=DocNaklV_NAME.Value;
  cdsVal.Post;
  cdsVal.Insert;
  cdsValVal.Value:=DocNaklV1.Value;
  cdsValName.Value:=DocNaklV1_NAME.Value;
  cdsVal.Post;

  SetGridColumnNames;

  { if DocNaklV.AsInteger = DocNaklV1.AsInteger then PostMessage(InVal.handle,WM_KEYDOWN,VK_DOWN,0);}
//  InVal.EnableValues := True;
end;

procedure TDocNaklForm.DocNaklAfterPost(DataSet: TDataSet);
begin
  if not (LinkQ.ParamByName('PARENT_RECID').IsNull or LinkQ.ParamByName('DOC_RECID').IsNull) then begin
     //документ был создан из др. документа
     //пытаемся создать "связь"
     LinkQ.Close;
     LinkQ.ExecQuery;
     fErrLink:=false;
     sErrLink:='';
     if LinkQ.FieldByName('RESULT').AsInteger <>1 then begin
       fErrLink:=true;
       sErrLink:=LinkQ.FieldByName('ERROR_DESCR').AsString;
     end;
  end;

  if NoEvent then
    exit;
  Sum.Close;
  Sum.Open;
  PosModified := True;

  if ((WhereNaklPosSQL <> '') AND (IntfMegaDBCommon.GetCountry=iccRussia)) then
  begin
    NoEvent := True; // Чтоб рекурсия не мешала
    try
      // Позиции?
      // 12.02.2007
      // добавить позиции из базовых документов
      if WhereNaklPosSQL <> '' then
      begin
        DM.SharedQuery.Transaction.CommitRetaining;
        DM.SharedQuery.Close;
        DM.SharedQuery.SQL.Text := 'select dnp.kod_mater, ' +#13#10 +
          '       dnp.pdv, ' +#13#10 +
          '       dnp.ind, ' +#13#10 +
          '       MyRound(dnp.summa/dnp.kolich, 3) as price_, ' +#13#10 +
          '       MyRound(dnp.summa1/dnp.kolich, 3) as price_1, ' +#13#10 +
          '       sum(dnp.kolich) as kolich, ' + #13#10 +
          '       sum(dnp.summa) as summa1, ' + #13#10 +
          '       sum(dnp.summa) as summa, ' + #13#10 +
          '       sum(dnp.ind_summa) as ind_summa ' + #13#10 +
          'from doc_nakl dn ' + #13#10 +
          '  left join doc_nakl_pos dnp on (dnp.docrecno = dn.recid and dnp.baseid = dn.baseid) ' + #13#10 +
          WhereNaklPosSQL +  #13#10 +
          ' group by 1, 2, 3, 4, 5 ';
        DM.SharedQuery.ExecQuery;

        DocPos.ConfirmPost := False;
        while not DM.SharedQuery.EOF Do
        try
          DocPosSource.Dataset.Append;
          DocPos.FieldByName('DOCRECNO').AsInteger := Source.DataSet.FieldByName('RECID').AsInteger;
          DocPos.FieldByName('BASEID').AsInteger := Source.DataSet.FieldByName('BASEID').AsInteger;
          DocPos.FieldByName('KOD_MATER').AsFloat := DM.SharedQuery.FieldByName('KOD_MATER').AsDouble;
          DocPos.FieldByName('KOLICH').AsFloat := DM.SharedQuery.FieldByName('KOLICH').AsDouble;
          try
            DocPos.FieldByName('SUMMA1').AsFloat := DM.SharedQuery.FieldByName('SUMMA1').AsDouble;
            DocPos.FieldByName('SUMMA').AsFloat := DM.SharedQuery.FieldByName('SUMMA1').AsDouble;
            DocPos.FieldByName('IND_SUMMA').AsFloat := DM.SharedQuery.FieldByName('IND_SUMMA').AsDouble;
            DocPos.FieldByName('IND').Value := DM.SharedQuery.FieldByName('IND').Value;
            DocPos.FieldByName('PDV').Value := DM.SharedQuery.FieldByName('PDV').Value;
            DocPos.Post;
            DocPos.Refresh;
          except
            on E:Exception do
            begin
              if IntfMegaDBCommon.IsOffice then
              begin
                DocPos.Cancel;
                ShowMessage(e.Message);
              end
              else
                DocPos.Cancel;
            end;
          end;
        finally
          DM.SharedQuery.Next;
        end;
        DocPos.ConfirmPost := True;
    //    ChangeZakSpravForbidden:=false;
      end;
    finally
      WhereNaklPosSQL := '';
      NoEvent := False; // Чтоб рекурсия не мешала
      DocPos.Close;
      DocPos.Open;
    end;
  end;
end;

procedure TDocNaklForm.SeparateNaklExecute(Sender: TObject);
begin
  if not CheckRest(False) then
    Exit;
  Query.Close;
  Query.SQL.Text := 'EXECUTE PROCEDURE SEPARATE('+DocNaklRECID.AsString+','+ DocNaklBASEID.AsString + ', ' + DocNaklDOC_INHERITED.AsString+','+DocNaklGROUP_OPER.AsString+','+DocNaklKOD_OPER.AsString+')';
  Query.ExecQuery;
  DocNakl.Refresh;
  DocNaklAfterPost(DocNakl);
end;

procedure TDocNaklForm.CheckExecute(Sender: TObject);
begin
  CheckRest(False);
end;

procedure TDocNaklForm.DocNaklPRICETYPE_Change(Sender: TField);
var
  pricetype:  integer;
  pricetype1: integer;
  pricetype2: integer;
begin
{ ----------------- Added by Lion in 29.12.2008 ---------------- }
  if AntiRecusria then Exit;
{ ----------- End of addition by Lion in 29.12.2008 ----------- }
  if NoEvent then exit;
  if (DocNaklKOD_OPER.AsVariant=NULL) or (DocNaklDK_TO.AsVariant=NULL)
   or (DocNaklDK_FROM.AsVariant=NULL) then exit;
  if not (DocNaklPRICETYPE_.IsNull)
   then pricetype:=DocNaklPRICETYPE_.NewValue
   else pricetype:=0;
  if (DocNaklPRICETYPE_.OldValue=null)
   then pricetype1:=0
   else pricetype1:=DocNaklPRICETYPE_.OldValue;
  if ((not ((pricetype in AllowPrice) or (0 in AllowPrice))) and (not AlphaStarted)) then
  begin
    if (not ((pricetype1 in AllowPrice) or (0 in AllowPrice))) then
      pricetype2:=DefaultPrice  else  pricetype2:=pricetype1;
    DocNaklPRICETYPE_.NewValue:=pricetype2;
    Application.MessageBox('Тип цены недопустим','Ошибка', MB_OK+MB_ICONERROR);
    exit;
  end;

  if ((DocPos.RecordCount <= 0) or ((DocNaklPRICETYPE_.OldValue = DocNaklPRICETYPE_.NewValue) and (DocNaklKURS.OldValue=DocNaklKURS.NewValue))) then Exit;
  if not AlphaStarted then
  if not FORCEPRICE  then if (Application.MessageBox('Изменить цены в документе ?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) <> IDYES) then Exit;
{ ---------------- Changed by Lion in 25.12.2008 --------------- }
//  UpdateQuery.Close;
//  UpdateQuery.Params[0].AsInteger := DocNaklRECID.Value;
//  UpdateQuery.Params[1].AsInteger := DocNaklBASEID.Value;
//  UpdateQuery.Params[2].AsInteger := DocNaklPRICETYPE_.Value;
//  UpdateQuery.Params[3].AsInteger := DocNaklPRICE_FROM_VALYUTA.Value;
//  UpdateQuery.Params[4].AsDouble := DocNaklKURS.Value;
//  if Sender = DocNaklKURS then UpdateQuery.Params[5].AsVariant := NULL
//  else UpdateQuery.Params[5].AsInteger := 0;
////  UpdateQuery.Params[6].AsVariant := NULL;
//  UpdateQuery.ExecQuery;
//  DocPos.Close;
//  DocPos.Open;
//  Sum.Close;
//  Sum.Open;
  //if not AlphaStarted then // если стартует альфа не будем пересчитывать цены.
  UpdatePosPrices(Sender = DocNaklKURS);
{ ----------- End of changing by Lion in 25.12.2008 ----------- }
  SetOtsr;
end;

procedure TDocNaklForm.DocPosAfterDelete(DataSet: TDataSet);
begin
  if ChangeKolich then
  begin
    UpdateQueryKol.Close;
    UpdateQueryKol.Params[0].AsInteger := DocNaklRECID.Value;
    UpdateQueryKol.Params[1].AsInteger := DocNaklBASEID.Value;
    UpdateQueryKol.Params[2].AsInteger := DocNaklPRICETYPE_.Value;
    UpdateQueryKol.Params[3].AsInteger := DocNaklPRICE_FROM_VALYUTA.Value;
    UpdateQueryKol.Params[4].AsDouble := DocNaklKURS.Value;
    UpdateQueryKol.Params[5].AsInteger := 3;
    UpdateQueryKol.ExecQuery;

    Refresh_NaklPos;
    ChangeKolich:=false;
  end;
  DocNaklAfterPost(DataSet.DataSource.DataSet);
end;

procedure TDocNaklForm.DocPosAfterClose(DataSet: TDataSet);
begin
  Dataset.DisableControls;
end;

procedure TDocNaklForm.DocPosAfterOpen(DataSet: TDataSet);
begin
  Dataset.EnableControls;
  HandMethod:=false;

  RxMemoryData1.EmptyTable;
  //RxMemoryData1.FieldDefs:= Dataset.FieldDefs;
  AddMissingColumn;
  RxMemoryData1.LoadFromDataSet(Dataset, 0, LmAppend);

  RxMemoryData1.First;

   SkidckaNDSUchet;
end;

procedure TDocNaklForm.AddMissingColumn;
var
   i:integer;
   NewField:TField;
begin
  RxMemoryData1.close;
  RxMemoryData1.Fields.Clear;
  RxMemoryData1.FieldDefs.Clear;
  for i:=0 to DocPos.Fields.Count-1 do
  begin
    //if   DocPos.Fields[i].FieldByNumber = fkData then
    begin
      if  RxMemoryData1.FindField(DocPos.Fields[i].FieldName) = nil then
      begin
        try
          with RxMemoryData1.FieldDefs.AddFieldDef do
          begin
              DataType := DocPos.Fields[i].DataType;
              Name := DocPos.Fields[i].FieldName;
              Size :=  DocPos.Fields[i].Size;
          end;
        except
          on e: Exception do
            ShowMessage('Ошибка!:' + e.Message + format(' [%d:%s] ', [i, DocPos.Fields[i].FieldName]));
        end;

      end;
    end;
  end;
  RxMemoryData1.open;
end;

procedure TDocNaklForm.DocPosAfterPost(DataSet: TDataSet);
begin
  if NoEvent then exit;
{
  if (DocPosSource.DataSet.FieldByName('PRICE_KOL').AsInteger<>0)
   // add by ZIS 23.05.03 исключаем изменение кол-ва в возвратах
   and not( (DocNaklDK_TO.AsFloat=DM.DKTDM) or (DocNaklDK_TO.AsFloat=DM.DKPP))
}
  if(not( (DocNaklDK_TO.AsFloat=DM.DKTDM) or (DocNaklDK_TO.AsFloat=DM.DKPP)))
  then
    ChangeKolich:=true;

  if (isPrihod = -1) and not AlphaStarted and not ChangeZakSpravForbidden
  then
   { if (Application.MessageBox('Изменить закупочную цену в справочнике ?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES) then
    begin
      Query.Close;
      Query.SQL.Text :=  'EXECUTE PROCEDURE UPDATE_PRICES(' +
        DocNaklBALANCE_KOD.AsString + ', ' +
        DocPosKOD_MATER.AsString + ', 1, ' + DocNaklPRICE_FROM_VALYUTA.AsString + ', ?VAL)';
      if DocNaklPRICE_FROM_VALYUTA.AsInteger = DocNaklV.AsInteger then
        if DocNaklNDSINSUMMA.Value = 0 then
          Query.Params[0].asDouble := DocPosPRICE1_.Value * (1+DocPosPDVGROUP_STAVKA.AsFloat/100)
        else
          Query.Params[0].asDouble := DocPosPRICE1_.Value
      else
        if DocNaklNDSINSUMMA.Value = 0 then
          Query.Params[0].asDouble := DocPosPRICE2_.Value * (1+DocPosPDVGROUP_STAVKA.AsFloat/100)
        else
          Query.Params[0].asDouble := DocPosPRICE2_.Value;
      Query.ExecQuery;
    end;   }

  if (IntfMegaDBCommon.GetCountry=iccRussia) or IsPartUchet3 then
  begin
    if (not HandMethod) and (not ChangeZakSpravForbidden) and (self.ClassName<>'TDocSchetForm') then
    begin
//        if IsPartUchet then
//          SplitNakl2PartyNew()
//        else
        if not IsPartUchet3 then
          SplitNakl2Party();
        DocPOs.FullRefresh;
        DocNaklAfterPost(DataSet.DataSource.DataSet);
    end;
  end;
  DataSet.Refresh;
  DocNaklAfterPost(DataSet.DataSource.DataSet);

end;

procedure TDocNaklForm.DocPosBeforePost(DataSet: TDataSet);
begin
  DatePart:=DocPosdate_part.asdatetime;
  if NoEvent then exit;
  if not CheckPrice then
  begin
    DocPos.Cancel;
    raise Exception.Create('Цена позиции не совпадает с ценой в ценовой колонке!');
    exit;
  end;
  if (DocNaklSTATE.Value = 3)
  then Dataset.Cancel
  else begin
    if (DocPosKOLICH.Value = 0) then
      if Application.MessageBox('Сохранить позицию с нулевым количеством ?','Внимание', MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2) = ID_NO
      then Dataset.Cancel;

    if(DataSet.State in [dsInsert, dsEdit])
    then CheckAllowChangeByNaklState();
  end;

{ ----------------- Added by Lion in 10.01.2009 ---------------- }
  if IsPartUchet3 then
  begin
    if (not HandMethod) and (not ChangeZakSpravForbidden) and (self.ClassName<>'TDocSchetForm') then
      SplitNakl2Party();
  end;
{ ----------- End of addition by Lion in 10.01.2009 ----------- }

end;

procedure TDocNaklForm.DocPosNewRecord(DataSet: TDataSet);
begin
  if ((NoEvent) AND (WhereNaklPosSQL = '')) then exit;
  Query.Close;
  Query.SQL.Text := 'SELECT * from NEW_'+SubTableName+'';
  Query.ExecQuery;
  HandMethod:=false;
  Dataset.FieldByName('RECID').AsInteger := Query.Fields[0].AsInteger;
  DataSet.FieldByName('BASEID').AsInteger := Source.Dataset.FieldByName('BASEID').AsInteger;
  DataSet.FieldByName('DOCRECNO').AsInteger := Source.Dataset.FieldByName('RECID').AsInteger;
  DataSet.FieldByName('STATE').AsInteger := 100;
  FInsertedPosIds.Add(Pointer(Dataset.FieldByName('RECID').AsInteger));
end;

function TDocNaklForm.UseNaklTranForInvoces: Boolean;
begin
  Result:= (FInsertedPosIds.IndexOf(Pointer(DocPos.FieldByName('RECID').AsInteger)) <> -1)
        or (not cbOpl.Checked and (DocNakl.FieldByName('DOCTYPE').AsString = 'РН-500'));
end;

procedure TDocNaklForm.DocPosCalcFields(DataSet: TDataSet);
begin
  if NoEvent then exit;

  if (DocNaklDK_TO.AsFloat=32049199) or (DocNaklPARENT_DK_TO.AsFloat=32049199) then
    DocPosCOUNTINBOX.asInteger := DocPosCOUNTINBOX_METRO.asInteger
   else
    DocPosCOUNTINBOX.asInteger := DocPosCOUNTINBOX_.asInteger;

  DocPosRest.Value := MyRoundFunc(DocPosBeginRest.Value - DocPosKOLICH.Value * IsPrihod, 0.001);
//  DocPosRest.Value := MyRoundFunc(DocPosBeginRest.Value, 0.001);
  DocPosSUMMA2.Value := DocPosSUMMA.Value * (1 + DocNaklNACENKA_.Value/100);
  DocPosSUMMA3.Value := DocPosSUMMA1.Value * (1 + DocNaklNACENKA_.Value/100);
  //DocPosSUMMA2.Value := DocPosSUMMA.Value ;//* (1 + DocNaklNACENKA_.Value/100);
  //DocPosSUMMA3.Value := DocPosSUMMA1.Value ;//* (1 + DocNaklNACENKA_.Value/100);

  if DocPosCOUNTINBOX.Value <> 0 then DocPosBoxcount.Value := DocPosKolich.Value / DocPosCOUNTINBOX.Value;
  if DocPosKolich.Value = 0 then Exit;
  DocPosPrice1.Value := DocPosSumma.Value  / DocPosKolich.Value;
  DocPosPrice2.Value := DocPosSumma1.Value  / DocPosKolich.Value;
  DocPosPrice1_.Value := DocPosSumma2.Value  / DocPosKolich.Value;
  DocPosPrice2_.Value := DocPosSumma3.Value  / DocPosKolich.Value;
  if DocNaklNDSINSUMMA.Value = 0 then
    DocPosSUMMAWPDV.Value := DocPosSUMMA3.Value * (1+DocPosPDVGROUP_STAVKA.AsFloat/100)
  else
    DocPosSUMMAWPDV.Value := DocPosSUMMA3.Value;
  DocPosPRICEWPDV.Value := DocPosSUMMAWPDV.Value / DocPosKolich.Value;
  if DocPosIND.AsInteger=1 then
     DocPosRealPrice.Value := DocPosIND_SUMMA.Value / DocPosKolich.Value else
     DocPosRealPrice.Value := DocPosPRICEWPDV.Value;
  if IsRussia then
  begin
    if DocNaklNDSINSUMMA.Value = 0 then
      DocPosSKIDKA_WITH_PDV.Value := DocPosSKIDKA.Value * (1+DocPosPDVGROUP_STAVKA.AsFloat/100)
    else
      DocPosSKIDKA_WITH_PDV.Value := DocPosSKIDKA.Value;
  end
  else
    DocPosSKIDKA_WITH_PDV.Value := DocPosSKIDKA.Value;
  DocPosPRICE_PREV.Value:= DocPosPRICEWPDV.Value + DocPosSKIDKA_WITH_PDV.Value / DocPosKolich.Value;
  // считаем самую похожую колонку - btnShowCol.checked
  // сравниваю с выбранной колонкой - btnCheckWithCol.checked
  CalcColFordocNaklPosRecord;
  DocPosPrice_box.value := DocPosPrice1.Value*DocPosCOUNTINBOX.Value;
{  if DBGridEH1.Columns[15].Visible then
  begin
     Query3.Close;
     Query3.SQL.Text:='select price from get_ph_price('+#39+DateToStr(DocNaklOPERDATE.AsDateTime)+
     #39+','+FloatToStr(DocPosKod_Mater.AsFloat)+')';
     Query3.ExecQuery;
//     if  Query3.Fields[0].AsDouble<>0 then
       DocPosOptPrice.Value:=Query3.Fields[0].AsDouble;

  end;
 }
 DocPosEXCISE_SUM.Value:=DocPosEXCISE.Value*DocPosKolich.Value;
end;

procedure TDocNaklForm.PrintNaklUpdate(Sender: TObject);
begin
  TAction(Sender).Visible := printNaklIf_different_Addr or
                            (DocNaklADDR_FROM.Value=DocNaklADDR_TO.Value);
  //TAction(Sender).Enabled:=true;
end;

procedure TDocNaklForm.PrintInternalUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := true;
end;

procedure TDocNaklForm.CreateDocUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not (DocNakl.State in [dsInsert]);
end;

function TDocNaklForm.CreateNaklCopy2CHP(doctype_to: string; group_oper_to,
  kod_oper_to: integer):boolean;
const  sInsertLinkDocNew = 'select result, error_descr from MAKE_DOC_LINKED(:PARENT_RECID,:PARENT_BASEID,:PARENT_FORM_TYPE,:OPL_RECID,:OPL_BASEID,:OPL_FORM_TYPE,0)';
       sCreateCopy = 'select RESULT, RECID_RESULT, BASEID_RESULT from CREATE_COPY_DOC_NAKL(:RECID, :BASEID, :DOCTYPE, :GROUP_OPER, :KOD_OPER, null, :DK_FROM, :DK_TO,null,null,1)';
var
   copy_recid,copy_baseid:integer;
begin
    result := false;
//создаем копию данной накладной
      try
        Query.Close;
        Query.SQL.Text:= sCreateCopy;
        Query.Params.ByName['RECID'].AsInteger:= DocNaklRECID.AsInteger;
        Query.Params.ByName['BASEID'].AsInteger:= DocNaklBASEID.AsInteger;
        Query.Params.ByName['DOCTYPE'].AsString:= doctype_to;
        Query.Params.ByName['GROUP_OPER'].AsInteger:= group_oper_to;
        Query.Params.ByName['KOD_OPER'].AsInteger:= kod_oper_to;
        Query.Params.ByName['DK_FROM'].AsFloat:= DocNaklDK_FROM.asFloat;
        Query.Params.ByName['DK_TO'].AsFloat:= DocNaklDK_TO.asFloat;
        Query.ExecQuery;
      except

        on e:Exception do
        begin
           Warning('Возникли ошибки при создании документа в ЧП: '#13#10+
              e.Message);
           result := false;
           exit;
        end;
      end;


      copy_recid := Query.FieldByName('RECID_RESULT').asInteger;
      copy_baseid := Query.FieldByName('BASEID_RESULT').asInteger;
      //создаем привязку чпшной и удкщной накладной чтобы потом можно было проверить надо делать копию или нет
     if  copy_recid<>0 then
     begin
        try
          Query.Close;
          Query.SQL.Text:= sInsertLinkDocNew;
          Query.Params.ByName['PARENT_RECID'].AsInteger:= DocNaklRECID.AsInteger;
          Query.Params.ByName['PARENT_BASEID'].AsInteger:= DocNaklBASEID.AsInteger;
          Query.Params.ByName['PARENT_FORM_TYPE'].AsInteger:= DocNaklDOC_INHERITED.AsInteger;
          Query.Params.ByName['OPL_RECID'].AsInteger:= copy_recid;
          Query.Params.ByName['OPL_BASEID'].AsInteger:= copy_baseid;
          Query.Params.ByName['OPL_FORM_TYPE'].AsInteger:= 1;
          Query.ExecQuery;

        except
          on e:Exception do
          begin
           Warning('Возникли ошибки при создании првязки накладной в ЧП: '#13#10+
              e.Message);
             result := false;
             exit;
          end;
        end;
      end;

    if Query.FieldByName('result').asInteger > 0  then
      result:= true;
end;

{function TDocNaklForm.GetLic(inKod_dk: double; inDate: TDateTime): boolean;
const cQueryLic = 'select IsLic from PROC_GET_LIC_MAXDATE(:Kod_dk, :in_Date, :in_Delta) ';
var QueryLic: TMegaQuery;
begin
  Result:= False;
  QueryLic:= TMegaQuery.Create(Self);
  try
    QueryLic.Database:= DM.Money;
    QueryLic.Transaction:= DM.trMainRO;
    QueryLic.Transaction.StartTransaction;
    QueryLic.Close;
    QueryLic.SQL.Text:= cQueryLic;
    QueryLic.ParamByName('KOD_DK').AsDouble:= inKod_dk;
    QueryLic.ParamByName('IN_DATE').AsDateTime:= inDate;
    QueryLic.ParamByName('IN_DELTA').AsInteger:= 30;
    QueryLic.ExecQuery;
    Result:= (QueryLic.FieldByName('IsLic').AsInteger = 1);
  finally
    QueryLic.Close;
    QueryLic.Free;
  end;
end;   }


procedure TDocNaklForm.CheckSelfExportState;
begin
  case SelfExportState of
    stRejected: Abort('Печать запрещена, т.к. БП "Самовывоз" отклонён.');
    stPending: Abort('Печать запрещена, т.к. БП "Самовывоз" ещё не согласован.');
  end;
end;

procedure TDocNaklForm.PrintNaklExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
  re: TRegExpr;
  flic: boolean;
  i: integer;
begin

  if ((DocNaklTRANSPORT.asFloat>0) and (Sender <> acPrintNaklWithoutTransport)) then
      if Application.MessageBox('Перед распечаткой накладной с'+
     ' транспортными услугами документ должен быть включен в ТТН. '+
     '  Документ включен в ТТН?','Подтверждение', MB_YESNO+MB_ICONQUESTION) <> IDYES then
     exit;

  CheckSelfExportState;
  // проверки на возможность печати
  if  (not AllowAll)
  and (DocNaklSTATE.Value<>idsBug)
  and (DocNaklSTATE.Value<>idsKassa)
  and (DocNaklDK_TO.AsFloat<>ddkEndUser)
  and (not intfMegaDBCommon.IsOffice)
  and (not (IntfMegaDBCommon.GetParam('IS_LVZ', '0') = '1')) // для лвз печатаем все документы
  and (DocNaklSTATE.Value<>idsFromOffice)
{ ----------------- Added by Lion in 06.04.2009 ---------------- }
  and (DocNaklDOCTYPE.AsString<>'ПН-500') // 06.04.2009: Давыдов Денис сказал, что такие нужно иметь возможность печатать из регионов
{ ----------- End of addition by Lion in 06.04.2009 ----------- }
  {and (OPERSTATUS = iosOutcomeToOtv)} then
  begin
    Application.MessageBox('Нет галочки "опл" или тип документ ПН-500, печать документа невозможна! ',
      'Внимание', MB_OK + MB_ICONSTOP);

    exit;
  end;
  if (DocNaklSTATE.Value= idsPrepare)
  or (DocNaklSTATE.Value= idsToOffice) then
  begin
    Application.MessageBox('Документ отправлен в офис! ',
      'Внимание', MB_OK + MB_ICONSTOP);
    exit;
  end;

  //-- тоже проверка
//  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then
  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then

  begin
    DocNakl.Edit;
    DocNaklSTATE.Value := idsInternal;
  end;

{ ---------------- Changed by Petc.O in 06.11.2008 --------------- }
  // всвязи с особенностями реализации многопоточности в fr3
  // не даем закрыть накладную(а сворачиваем), пока она не допечатается
  aCanFreeForm := false;
{ ----------- End of changing by Petc.O in 06.11.2008 ----------- }
  //
  ldmRep:= TdmPrintNakl2.Create(Self);
  // проверяю, если на дебиторе выставлена галочка "печать с учетом возвратов",
  // то делаю видимым пункт "Печать накладной с учетом возвратов"
  if ((Sender = PrintNaklWithVozvrat) or (Sender = PrintWithZMC)) And (DocNaklDK_TO_PRINT_WITH_VOZVRAT.AsInteger = 1){} Then
    Begin
      ldmRep.PrintNaklWithVozvrat := True;
      if  Sender = PrintWithZMC then
        ldmRep.PrintNaklWithZMC :=true;
    End; // DocNaklDK_TO_PRINT_WITH_VOZVRAT.AsInteger = 1
  ldmRep.IsWithoutTransport:= (Sender = acPrintNaklWithoutTransport);
  ldmRep.PrintNaklNew := ((Sender = PrintNaklNew) or (Sender = actPrintLVZ));
  ldmRep.lvi:=lvi;
   try
    // проверка на наличие лицензии
    if (OPERSTATUS <> 4) or (IntfMegaDBCommon.GetParam('PR_NEW_NAKL_F2_AGENT','0') <> '1') then
     fLic:= True
    else
     fLic:= DM.GetLic(DocNakl.FieldByName('DK_TO').AsFloat, DocNakl.FieldByName('OPERDATE').AsDateTime);
    i:= 1;
  repeat  //если нет лицензии печатаем еще док-т и на агента
    ldmRep.IsBillaNakl:= Sender = miBilla;
    ldmRep.IsOSNakl:=PrintOSNakl;

    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);

    frVariables.Variable['HidePriceAndCost']:= False;

    if ((OPERSTATUS=iosOutcomeToOtv) and (fbMegaUtils.fbExecQueryParams('SELECT VALUE_INT FROM GET_SPRAV_DK_ADDITION_PROP(:DK, ''PRINT_PRICE_OTVET'')',
        [
         'DK', DocNakl.FieldByName('DK_TO').AsFloat
        ]) = 0)) then
    begin
      frVariables.Variable['IsOtv']:= True;
      frVariables.Variable['HidePriceAndCost']:= true;
    end
    else begin
      frVariables.Variable['IsOtv']:= False;
    end;

//    FDesignReport := ((IntfMegaAccessManager.GetUserName = 'DEREZA') OR (IntfMegaDBCommon.GetCountry = iccRussia));
    // Для российских сетевиков, по наличию символа # в
    // примечании документа, пишу в переменную отчёта
    // строку вида - "заказ №ХХХХ"
    if ((IntfMegaDBCommon.GetCountry = iccrussia) or (IntfMegaDBCommon.GetCountry = kodRus)) then
    begin
      re:=TRegExpr.Create;
      try
//        re.Expression:='\#\s*(\d+-\d+)(\s*\@(\d+))*';
{ ---------------- Changed by Lion in 04.02.2009 --------------- }
//        re.Expression:='\#\s*([0-9\-]+)(\s*\@(\d+))*';
        re.Expression:='\#\s*([-0-9A-Za-zА-Яа-я]+)(\s*\@(\d+))*';
{ ----------- End of changing by Lion in 04.02.2009 ----------- }
        if re.Exec(Trim(DocNakl.FieldByName('NOTES').AsString)) then
        begin
//          frVariables.Variable['ZakazNo']:= ', заказ №' + re.Match[1];
          frVariables.Variable['ZakazNo']:= re.Match[1];
          if (re.Match[3]='') then
             frVariables.Variable['KodOrder']:= ''
          else
             frVariables.Variable['KodOrder']:= 'код поставщика  ' + re.Match[3];
        end
        else
        begin
          frVariables.Variable['ZakazNo']:= '';
          frVariables.Variable['KodOrder']:='';
        end
      finally
        re.Free;
      end;
    end;
    if TMenuItem(sender).Name = 'N105' then
      frVariables.Variable['notLVIwithoutNotes']:= false;
    if TMenuItem(sender).Name  = 'N95' then
       frVariables.Variable['notLVIwithoutNotes']:= true;
       
    frVariables.Variable['flic']:= fLic;
    if i = 1 then
     frVariables.Variable['not_agent']:= true
    else
     frVariables.Variable['not_agent']:= false;

//    ToClipBoard_DebugSqlTextAndPar(lDMRep.DocPos); // add new nirs 09_04_2024 fordebugsql
    DbgCopyToClipboard(GetDebugSqlTextAndPar(lDMRep.DocPos)+GetDebugSqlTextAndPar(TMegaRDataSet(lDMRep.DocNakl))); //// add new nirs 14_05_2024 fordebugsql

    if FDesignReport then
    begin
      if (((IntfMegaDBCommon.GetCountry = iccrussia) or (IntfMegaDBCommon.GetCountry = kodRus)) and   (IntfMegaDBCommon.IsOffice)) then
      begin
        lDMRep.NaklReport.Modified:=true;
//        lDMRep.NaklReport.ModifyPrepared:=False;
        lDMRep.NaklReport.ModifyPrepared:= (IntfMegaDBCommon.GetParam('EDIT_NAKL_REPORT','0') = '1');
      end;
     //if Sender = PrintNaklNew2 then
     //  dmMegaReports.MyShow(3103, Now(), '')
     // else

      lDMRep.NaklReport.DesignReport;
    end
    else
    begin
      lDMRep.NaklReport.PrepareReport;
      lDMRep.NaklReport.ModifyPrepared:= (IntfMegaDBCommon.GetParam('EDIT_NAKL_REPORT','0') = '1'); // False;
      //if (UpperCase(IntfMegaAccessManager.GetUserRole) = 'CORRECTOR') then
      lDMRep.NaklReport.ShowReport;
      if (DocNaklTRANSPORT.asFloat>0) then
         dmMegaReports.MyShow(23,Now(),DocNaklRECID.asString+','+DocNaklBASEID.asString);
     // else
     //   lDMRep.NaklReport.PrintPreparedReportDlg;
    end ;
    inc(i);
   until (fLic) or (i > 2);

  finally
    ldmRep.IsOSNakl:=false;
    ldmRep.Free;
    aCanFreeForm := true;
    lvi:=False;
  end;
  //--
end;



procedure TDocNaklForm.PrintInternalExecute(Sender: TObject);
var
{$IFDEF USE_FR3}
  dmPrintInternalDoc : TdmPrintInternalDoc;
{$ELSE}
  PrintInternalDocRep: TPrintInternalDocRep;
{$ENDIF}
begin
  CheckSelfExportState;
  if ((NOT aNaklSaved) AND ((IntfMegaDBCommon.GetCountry = iccRussia) OR (IntfMegaDBCommon.GetCountry = kodRUS))) then
  begin
    showmessage('Документ не сохранён!');
    exit;
  end
  else // а для Украины проверка будет более хитро*ой
  if (NOT aNaklSaved )or (PosModified) or (DocNakl.State in [dsEdit, dsInsert]) then
    if not SaveDoc then
      exit;
{ 07.03.2009. Lion - Пока уберём эту проверку, а то некоторые нужные документы не печатаются
  if not AllowAll
   and (DocNaklSTATE.Value<>6) and (DocNaklSTATE.Value<>5) and (DocNaklSTATE.Value<>1)
   and (DocNaklDK_TO.AsFloat<>999) and (DocNaklSTATE.Value<>20) and (DocNaklSTATE.Value<>8) then
  begin
    Query.Close;
    Query.SQL.Text:='SELECT count(*) FROM OPER_JORNAL WHERE'+
      ' DOCRECNO = ' + DocNaklRECID.AsString +
      ' AND BASEID = ' + DocNaklBASEID.AsString +
      ' AND FORMTYPE = ' + DocNaklDOC_INHERITED.AsString +
(*     ' AND SUBDOCRECNO IS NULL AND (DEBET STARTING WITH ''301'' OR DEBET STARTING WITH ''50'' OR '+
      ' KREDIT STARTING WITH ''301'' OR KREDIT STARTING WITH ''50'')'; *)
      ' AND SUBDOCRECNO IS NULL AND '+
      ' (DEBET STARTING WITH ''301'' OR DEBET STARTING WITH ''50'' OR '+
      ' DEBET STARTING WITH ''71/2'' OR DEBET STARTING WITH ''45'' OR '+
      ' KREDIT STARTING WITH ''301'' OR KREDIT STARTING WITH ''50'' OR' +
      ' (KREDIT STARTING WITH ''10/'' AND KREDIT STARTING WITH ''10/'') OR' +
      ' KREDIT STARTING WITH ''71/2'' OR KREDIT STARTING WITH ''45'')';
    Query.ExecQuery;
      If Query.Fields[0].AsInteger<=0 Then
        Exit;
  end;
}
  if (DocNaklSTATE.Value=18) or (DocNaklSTATE.Value=19)  Then
    Exit;


  if DocNaklSTATE.Value<>21 then
   begin
     if not self.isNaklProv then
     begin
//       messageDlg('Документ не проведен!'#13#10+'Проведите, пожалуйста.',mtInformation,[mbOk],0);
       Warning('Документ не проведен!'#13#10+'Проведите, пожалуйста.');
       exit;
     end;
(*    if not CheckRest(False) then
      Exit;
*)
    if DocNaklSTATE.Value <= 0 then
    try
    DocNakl.Edit;
    if DocNaklSTATE.Value <= 0 then
      DocNaklSTATE.Value := 1;
    except
    on e:Exception do
      Warning('Возникли ошибки при проставлении признака'#13#10+
              '"Напечатан внутренний документ"(накладная красненькая):'#13#10+
              e.Message);
//      messageDlg('Возникли ошибки при проставлении признака'#13#10+
//                 '"Напечатан внутренний документ"(накладная красненькая):'#13#10+
//                 e.Message ,mtInformation,[mbOk],0);
    end;
   end;


{$IFDEF USE_FR3}
  dmPrintInternalDoc := TdmPrintInternalDoc.Create(Self);
  try
    aCanFreeForm := false;
    dmPrintInternalDoc.SetProperties(False,True,1);
    dmPrintInternalDoc.DocNakl.Transaction := DocNakl.Transaction;
    dmPrintInternalDoc.DocPos.Transaction := DocNakl.Transaction;
    dmPrintInternalDoc.Sum.Transaction := DocNakl.Transaction;

    dmPrintInternalDoc.PrintInternal(DocNaklRecID.AsInteger, DocNaklBaseID.AsInteger);

  finally
    aCanFreeForm := true;
    dmPrintInternalDoc.Free;
  end;

{$ELSE}
  PrintInternalDocRep := TPrintInternalDocRep.Create(Self);
  try
    If (IntfMegaDBCommon.GetCountry = iccUkraine) then
      PrintInternalDocRep.NameDoc.Caption:='ВНУТРІШНІЙ ДОКУМЕНТ №'
     Else
      PrintInternalDocRep.NameDoc.Caption:='Накладная на внутренний отпуск №';
    PrintInternalDocRep.DocNakl.Transaction := DocNakl.Transaction;
    PrintInternalDocRep.DocPos.Transaction := DocNakl.Transaction;
    PrintInternalDocRep.Sum.Transaction := DocNakl.Transaction;
    PrintInternalDocRep.DocNakl.Params[0].AsInteger := DocNaklRecID.Value;
    PrintInternalDocRep.DocNakl.Params[1].AsInteger := DocNaklBaseID.Value;
    ///
    if PrintInternalDocRep.GroupBySchet
    then PrintInternalDocRep.QRGroup1.EXpression:='KREDIT+KLADOV'
    else PrintInternalDocRep.QRGroup1.EXpression:='KLADOV';

    PrintInternalDocRep.NotPrinterSetup:=false;
    PrintInternalDocRep.Prepare;
    PrintInternalDocRep.qlPageCount.Caption:='из ' +IntToStr(PrintInternalDocRep.QRPrinter.PageCount);
    PrintInternalDocRep.NotPrinterSetup:=true;

    PrintInternalDocRep.Print;

  finally
    PrintInternalDocRep.Free;
  end;
{$ENDIF}
end;

procedure TDocNaklForm.PrintNaklTMCExecute(Sender: TObject);
begin
  DocNakl.Edit;
  if DocNaklSTATE.Value <= 0 then DocNaklSTATE.Value := 1;

  dmMegaReports.MyPrint(19,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString);
end;

procedure TDocNaklForm.PrintSchetExecute(Sender: TObject);
begin
   dmMegaReports.MyShow(21,DocNaklOperDate.Value,DocNaklRecID.AsString+','+DocNaklBaseID.AsString+',""');//,1,true);
end;

procedure TDocNaklForm.FillRestsExecute(Sender: TObject);
begin
  if Application.MessageBox('Сформировать остатки ?','Внимание',
   MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = ID_NO then Exit;
  Query.Close;
  // Query.SQL.Text := 'EXECUTE PROCEDURE FillNaklRests(:RECID, :BASEID)';
  Query.SQL.Text := 'EXECUTE PROCEDURE FILL_DOC_RESTS(:RECID, :BASEID, :FORMTYPE)';
  Query.Params[0].asInteger := DocNaklRECID.Value;
  Query.Params[1].asInteger := DocNaklBASEID.Value;
  Query.Params[2].asInteger := DocNaklDOC_INHERITED.Value;
  Query.ExecQuery;
    {$ifdef USE_FIB6}
      DocPos.FullRefresh;
    {$endif}
  DocNaklAfterPost(DocNakl);
end;

procedure TDocNaklForm.PrintRetNaklExecute(Sender: TObject);
var
  PrintNaklRep: TdmPrintRetNakl2;
begin
  DocNakl.Edit;
  if DocNaklSTATE.Value <= 0 then
    DocNaklSTATE.Value := 1;

  try
  PrintNaklRep := TdmPrintRetNakl2.Create(Self);
  PrintNaklRep.PrintNakl(TMegaTransaction(DocNakl.Transaction),
                         DocNaklRecID.AsInteger,DocNaklBaseID.AsInteger,
                         OPERSTATUS, 0, true,1);
  finally
    PrintNaklRep.Free;
  end;
end;

procedure TDocNaklForm.PrintActExecute(Sender: TObject);
begin
  dmMegaReports.MyPrint(9,DocNaklOperDate.value,DocNaklRecID.AsString+','+DocNaklBaseID.AsString);
end;

procedure TDocNaklForm.PrintDolgExecute(Sender: TObject);
var
{$IFDEF USE_FR3}
  dmPrintInternalDoc : TdmPrintInternalDoc;
{$ELSE}
  PrintInternalDocRep: TPrintDolgRep;
{$ENDIF}
begin
  DocNakl.Edit;
  if DocNaklSTATE.Value <= 0 then
    DocNaklSTATE.Value := 1;


{$IFDEF USE_FR3}
  dmPrintInternalDoc := TdmPrintInternalDoc.Create(Self);
  try
    dmPrintInternalDoc.SetProperties(False,True,1);
    dmPrintInternalDoc.DocNakl.Transaction := DocNakl.Transaction;
    dmPrintInternalDoc.DocPos.Transaction := DocNakl.Transaction;
    dmPrintInternalDoc.Sum.Transaction := DocNakl.Transaction;

    dmPrintInternalDoc.PrintDolg(DocNaklRecID.AsInteger, DocNaklBaseID.AsInteger);
  finally
  dmPrintInternalDoc.Free;
  end;

 {$ELSE}
  PrintInternalDocRep := TPrintDolgRep.Create(Self);
  PrintInternalDocRep.DocNakl.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.DocPos.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.Sum.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.DocNakl.Params[0].AsInteger := DocNaklRecID.Value;
  PrintInternalDocRep.DocNakl.Params[1].AsInteger := DocNaklBaseID.Value;

 // PrintInternalDocRep.Preview;
 // PrintInternalDocRep.Print;
  PrintInternalDocRep.PrinterSetup;
  if PrintInternalDocRep.Tag = 0 then
  begin
    PrintInternalDocRep.Print;
  end;


  PrintInternalDocRep.Free;
{$ENDIF}

end;

procedure TDocNaklForm.PrintCopyExecute(Sender: TObject);
begin
     dmMegaReports.MyPrint(30,DocNaklOperDate.Value,DocNaklRecID.AsString+','+DocNaklBaseID.AsString);
end;

procedure TDocNaklForm.ViewProtokolUpdate(Sender: TObject);
begin
  if DBGridEH1.Focused then TAction(Sender).Enabled := true;
end;

procedure TDocNaklForm.Waiting(Sender: TObject; var Done: Boolean);
begin
//
 //StatusBar1.SimplePanel := True;
 //StatusBar1.SimpleText := 'Событие OnIdle';
 Done := true;
end;

procedure TDocNaklForm.PrintCopyUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := true;
end;

procedure TDocNaklForm.CopyPosExecute(Sender: TObject);
begin
  BUF_FORMKOD :=  Source.DataSet.fieldByName('DOC_INHERITED').AsInteger;
  BUF_RECID :=  Source.DataSet.fieldByName('RECID').AsInteger;
  BUF_BASEID := Source.DataSet.fieldByName('BASEID').AsInteger;
  BUF_NSDINSUMMA := Source.DataSet.fieldByName('NDSINSUMMA').AsInteger;
//  BUF_OPERDATE := FormatDateTime('dd.mm.yyyy',Source.DataSet.fieldByName('OPERDATE').AsDateTime); // nirs 12.01.2023
  BUF_OPERDATE := FormatDateTime('dd.mm.yyyy',now); // nirs 12.01.2023
end;

procedure TDocNaklForm.P1Click(Sender: TObject);
begin
  dmMegaReports.MyShow(10100111,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString);
end;
procedure TDocNaklForm.actSendInvoiceExecute(Sender: TObject);
var
   PdfFile,Body, balDKName:string;

begin
  if (NOT aNaklSaved ) or (PosModified) or (DocNakl.State in [dsEdit, dsInsert]) then
   if (Application.MessageBox('Перед отправкой накладную необходимо сохранить. Сохранить накладную ?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES) then
     begin
       if not SaveDoc then
         exit;
     end else exit;
    balDKName:=IntfMegaCommon.GetBalanceDKName(DocNaklBALANCE_KOD.Value,DocNaklOPERDATE.Value,DocNaklCFO.Value);
    PdfFile:={ExtractFileDir(Application.ExeName) +'\Invoice'}TempDir+'Invoice'+DocNaklDOCNUMBER.AsString+'.pdf';
   dmMegaReports.MyCreatePdf(10100111,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString,PdfFile);
   Body:='Dear Customer:'#13#10#13#10+
         'Your invoice is attached. Please remit payment at earliest convenience.'#13#10#13#10+
         'Thank you for your business – we appreciate it very much.'#13#10#13#10+
         'Sincerely,'#13#10#13#10+
         balDKName;
         //'Megapolis USA';
   frmSendMail:=TfrmSendMail.Create(Application);
   frmSendMail.SendMailMessage('','','Invoice '+DocNaklDOCNUMBER.AsString+' from '+balDKName,Body,PdfFile,'[Your Invoice '+DocNaklDOCNUMBER.AsString+' will be attached to the message as a PDF file]',true,'','');
   frmSendMail.show;


end;
procedure TDocNaklForm.actSendNaklExecute(Sender: TObject);
var


   PathFile,email,Subject,s:string;
   f:TextFile;
begin
   Query.Close;
   Query.SQL.Text := 'select sd_from.shortname_dk,sd_from.kod_dk,dn.docnumber,sto.name_op,dn.docdate '#13#10+
                     ' ,iif (dn.balance_kod=300,11,10) form_opl,pgdd.doc_number,sm.kod_mater as local_kod '#13#10+
                     '  ,dnp.kolich,(dnp.summa1/dnp.kolich * (1+spdv.pdvgroup_stavka/100)) price_with_nds '#13#10+
                     '  ,sm.name_mater,sm.ed_izm,(dnp.summa1/dnp.kolich) price_without_nds                 '#13#10+
                     '  ,dnp.summa1 summa_without_nds,(dnp.summa1* (1+spdv.pdvgroup_stavka/100)) summa_with_NDS   '#13#10+
                     '  ,(dnp.summa1* (spdv.pdvgroup_stavka/100)) NDS,sm.kod_ean, ocp.email  '#13#10+
                    ' from doc_nakl dn                                                                           '#13#10+
                    ' left join doc_nakl_pos dnp on (dnp.docrecno=dn.recid and dnp.baseid=dn.baseid)            '#13#10+
                    ' left join sprav_dk sd_from on (sd_from.kod_dk=dn.dk_from)                                  '#13#10+
                    ' LEFT JOIN DELIVERY_LOCATION DL ON (DL.FORMTYPE=1 AND DL.BASEID=dn.BASEID AND DL.DOCRECNO=dn.RECID) '#13#10+
                    ' LEFT join SPRAV_TRADE_OUTLET sto on (sto.RECID = DL.OUTLET_RECID and sto.BASEID = DL.OUTLET_BASEID) '#13#10+
                    ' left join PROC_GET_DK_DOCUMENT(dn.DK_TO,dn.OPERDATE,100,dl.outlet_recid,dl.outlet_baseid,1) pgdd on (1=1) '#13#10+
                    ' left join sprav_mater sm on (sm.kod_mater=dnp.kod_mater)                                                   '#13#10+
                    ' left join group_mater gm on (gm.group_mater=sm.group_mater)                                                '#13#10+
                    ' left join sprav_pdvgroup spdv on (spdv.pdvgroup_kod=''A'')                                                    '#13#10+
                    ' left join outlet_contact_person ocp on (ocp.outlet_recid=DL.OUTLET_RECID and ocp.outlet_baseid=DL.OUTLET_BASEID and ocp.duties=2)  '#13#10+
                    ' where dn.recid=:recid and dn.baseid=:baseid';
   Query.Params.ByName['RECID'].Value := DocNaklRECID.Value;
   Query.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
   Query.ExecQuery;
   Subject:='Подтверждение поставки '+Query.FieldByName('shortname_dk').AsString;
   email:=Query.FieldByName('email').AsString;
   PathFile:=TempDir+'УДК_'+Query.FieldByName('kod_dk').AsString+'_'+DocNaklDOCNUMBER.AsString+'.csv';
   AssignFile(f,PathFile);
   Rewrite(f);
   Writeln(f,Query.FieldByName('shortname_dk').AsString+';'+Query.FieldByName('kod_dk').AsString+';'+Query.FieldByName('docnumber').AsString+
   ';'+Query.FieldByName('name_op').AsString+';14;RN;'+FormatDateTime('dd.mm.yyyy',Query.FieldByName('docdate').AsDateTime)+';'+
    Query.FieldByName('doc_number').AsString+';'+Query.FieldByName('form_opl').AsString+';') ;
    //+Query.FieldByName('outlet_number').AsString+';');  -- авион хотел, но перехотел - перешел на EDI
    while not Query.Eof do
    begin
     Writeln(f,Query.FieldByName('local_kod').AsString+';'+Query.FieldByName('kolich').AsString+';'+ReplaceStr(Query.FieldByName('price_with_nds').AsString,',','.')+';'+
               Query.FieldByName('name_mater').AsString+';1;'+Query.FieldByName('ed_izm').AsString+';'+ReplaceStr(Query.FieldByName('price_without_nds').AsString,',','.')+';'+
               ReplaceStr(Query.FieldByName('summa_without_nds').AsString,',','.')+';'+ReplaceStr(Query.FieldByName('summa_with_NDS').AsString,',','.')+';'+
               ReplaceStr(Query.FieldByName('NDS').AsString,',','.')+';'+Query.FieldByName('kod_ean').AsString);

     //s:=Query.FieldByName('outlet_id').AsString+';"'+ReplaceStr(qr.FieldByName('NAME_DK').AsString,'"','""')+'('+
     //   ReplaceStr(qr.FieldByName('NAME').AsString,'"','""')+')";"'+ReplaceStr(qr.FieldByName('address').AsString,'"','""')+
     //   '";'+qr.FieldByName('category').AsString;
     //Writeln(f,s);
     Query.Next;
    end;
  Query.Close;
  CloseFile(f);

   frmSendMail:=TfrmSendMail.Create(Application);
   frmSendMail.SendMailMessage(email,'',Subject,'',PathFile,'[Ваша накладная '+DocNaklDOCNUMBER.AsString+' была прикреплена  к письму]',true,'','');
   frmSendMail.show;

end;

procedure TDocNaklForm.actSendWesternExecute(Sender: TObject);
var ws:IDocumentInvoices;
   ow: CreateOrderWestern;
begin

  {ws:=GetIDocumentInvoices();
  ow:= CreateOrderWestern.Create;
  ow.paramRecID:=DocNaklRecID.AsInteger;
  ow.paramBaseID:=DocNaklBaseID.AsInteger;
  ow.paramCarrier:='';
  //ow.AuthKey:='abcdefg';
  ws.CreateOrderWestern(ow);
  ow.Free;
  ShowMessage('Данные отправленны');}

end;

procedure TDocNaklForm.PastePosExecute(Sender: TObject);
var
  K,K1: Double;
  Table_Name , sq1: String;
  oldCheckPriceForbidden: boolean;
  q33Temp:TMegaQuery;
begin
  q33Temp:=nil;
  oldCheckPriceForbidden:= CheckPriceForbidden;
  try
    ChangeZakSpravForbidden:=true;
    DM.SharedQuery.Transaction.CommitRetaining;
    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'SELECT SUB_TABLE FROM SYS_FORM_TYPES WHERE FORM_KOD = :FORM_KOD';
    DM.SharedQuery.Params.ByName['FORM_KOD'].AsInteger := BUF_FORMKOD;
    DM.SharedQuery.ExecQuery;
    Table_Name := DM.SharedQuery.FieldByName('SUB_TABLE').AsString;

    HandMethod := true; //что бы подтягивалась партия из расходной накладной

    if ((sender <> nil) and (Sender.ClassName<>'TAction'))
    and (False) // nirs 12.01.2023
    then
       DM.mdsSharedQuery:= TMegaRDataSet(Sender)
    else
    begin
      DM.mdsSharedQuery.Close;
     // DM.SharedQuery.Transaction:=Nakl_Transaction;
//      DM.mdsSharedQuery.selectsql.Text := 'SELECT * FROM '+ Table_Name + ' WHERE DOCRECNO = :RECID AND BASEID = :BASEID'; // old variant

      sq1 := 'select gtp.kolich as KOLICHOST, dnp.* from doc_nakl_pos dnp left join  GET_DOC_NAKL_POS_WITH_VOZVRAT(dnp.docrecno, dnp.baseid,dnp.kod_mater ,1,0,'''+
      BUF_OPERDATE+''') gtp on 1=1'+
      'where dnp.docrecno = :RECID and dnp.baseid = :BASEID';
      DM.mdsSharedQuery.selectsql.Text := sq1;
      DM.mdsSharedQuery.ParamBYname('RECID').asInteger := BUF_RECID;
      DM.mdsSharedQuery.ParamBYname('BASEID').asInteger := BUF_BASEID;
      DM.mdsSharedQuery.open;
    end;
  //  DM.SharedQuery.Transaction.CommitRetaining;

    DocPos.ConfirmPost := False;
    if Source.DataSet.FieldByName('NDSINSUMMA').AsInteger = BUF_NSDINSUMMA then K := 1
    else begin if BUF_NSDINSUMMA = 1 then K := 1 / 1.2 else K := 1.2; end;

    if IsRussia and (BUF_FORMKOD=idvNakl) then begin
      q33Temp:=TMegaQuery.Create(self);
      q33Temp.Database   :=DocPos.Database;
      q33Temp.Transaction:=DocPos.Transaction;
      q33Temp.SQL.Text:='insert into DOC_NAKL_POS_ADD_PROP (RECID, BASEID, REGID_FORM_A, REGID_FORM_B, KOD_MATER) '+
                         'select :RECID, :BASEID, REGID_FORM_A, REGID_FORM_B, KOD_MATER '+
                         'from DOC_NAKL_POS_ADD_PROP a2 '+
                         'where a2.recid=:RECID0 and a2.baseid=:BASEID0';
    end;

    DM.mdsSharedQuery.first;
    while not DM.mdsSharedQuery.EOF Do
    begin
      if DM.mdsSharedQuery.FieldByName('PDV').Value='D' then K1:=1 else K1:=K;
      DocPosSource.Dataset.Append;
      DocPos.FieldByName('KOD_MATER').AsFloat := DM.mdsSharedQuery.FieldByName('KOD_MATER').AsFloat;
{    // 14.07.2007, Игнат К,
    // сделал изменение цен в документе, созданном из другого с статусом - реализация Ф2
    // - делаю варварскую схему с выводом индикатива
    //первое что делаю - после изменения ценности выключаю автоизменение позиций
    if ((OPERSTATUS = iosRealizationF2) AND ((IntfMegaDBCommon.GetCountry = iccRussia) or (IntfMegaDBCommon.GetCountry = kodRUS))) then
    try
      noEvent := True;
      try
        DocPos.FieldByName('KOLICH').AsFloat := DM.SharedQuery.FieldByName('KOLICH').AsDouble;

        DocPos.FieldByName('SUMMA1').AsFloat := DM.SharedQuery.FieldByName('KOLICH').AsDouble * DocPos.FieldByName('PRICE1').AsFloat;
        DocPos.FieldByName('SUMMA').AsFloat := DM.SharedQuery.FieldByName('KOLICH').AsDouble * DocPos.FieldByName('PRICE2').AsFloat;
        DocPos.FieldByName('IND_SUMMA').AsFloat := DM.SharedQuery.FieldByName('SUMMA1').AsDouble * K1 * (1+DocPosPDVGROUP_STAVKA.AsFloat/100)
      finally
        noEvent := False;
      end;
      // Индикатив там, по идее, уже выставился, менять ни к чему
      DocPos.FieldByName('PDV').Value := DM.SharedQuery.FieldByName('PDV').Value;
      DocPos.FieldByName('PARTY').Value := DM.SharedQuery.FieldByName('PARTY').Value;
      DocPos.Post;
    except
      on E:Exception do
      begin
        if IntfMegaDBCommon.IsOffice then
        begin
          DocPos.Cancel;
          ShowMessage(e.Message);
        end
        else DocPos.Cancel;
      end;
    end
    else
}
      try
//        DocPos.FieldByName('KOLICH').AsFloat := DM.mdsSharedQuery.FieldByName('KOLICH').AsFloat; // old nirs 12.01.2023
        DocPos.FieldByName('KOLICH').AsFloat := DM.mdsSharedQuery.FieldByName('KOLICHOST').AsFloat;
        DocPos.FieldByName('SUMMA1').AsFloat := DM.mdsSharedQuery.FieldByName('SUMMA1').AsFloat * K1;
        DocPos.FieldByName('SUMMA').AsFloat := DM.mdsSharedQuery.FieldByName('SUMMA1').AsFloat * K1 / DocNakl.FieldByName('KURS').AsFloat;
        DocPos.FieldByName('IND_SUMMA').AsFloat := DM.mdsSharedQuery.FieldByName('IND_SUMMA').AsFloat;
        DocPos.FieldByName('IND').Value := DM.mdsSharedQuery.FieldByName('IND').Value;
        DocPos.FieldByName('PDV').Value := DM.mdsSharedQuery.FieldByName('PDV').Value;
        DocPos.FieldByName('PARTY').Value := DM.mdsSharedQuery.FieldByName('PARTY').Value;
        DocPos.FieldByName('ARTICUL_PARTNER').Value:=DM.mdsSharedQuery.FieldByName('ARTICUL_PARTNER').Value;
        DocPos.FieldByName('PACK_RECID').Value:=DM.mdsSharedQuery.FieldByName('PACK_RECID').Value;
        DocPos.FieldByName('DATE_ROZLIVA').Value:=DM.mdsSharedQuery.FieldByName('DATE_ROZLIVA').Value;
        DocPos.FieldByName('INVOCE_NUMBER').Value:=DM.mdsSharedQuery.FieldByName('INVOCE_NUMBER').Value;
        DocPos.Post;

        if q33Temp<>nil then
        try
          q33Temp.ExecWP([DocPos.FieldByName('recid').asInteger,DocPos.FieldByName('baseid').asInteger,
                          DM.mdsSharedQuery.FieldByName('recid').asInteger,
                          DM.mdsSharedQuery.FieldByName('baseid').asInteger]);
        finally
          q33Temp.Close;
        end;

      except
        on E:Exception do
        begin
            DocPos.Cancel;
            ShowMessage(e.Message);
        end;
      end;

      DM.mdsSharedQuery.Next;
    end;
    //DM.SharedQuery.Transaction:=dm.Transaction;
    DocPos.ConfirmPost := True;
    ChangeZakSpravForbidden:=false;
    {Query.Close;
    Query.SQL.Text := 'EXECUTE PROCEDURE UPDATE_NAKL_POS(:RECID, :BASEID, :price, :VAL, 1, 1)';
    Query.Params.ByName['RECID'].Value := DocPosRECID.Value;
    Query.Params.ByName['BASEID'].Value := DocPosBASEID.Value;
    Query.Params.ByName['VAL'].Value := DocNaklV.Value;
    Query.ExecQuery; }
  finally
    if q33Temp<>nil then q33Temp.Free;
    
    CheckPriceForbidden:= oldCheckPriceForbidden;

  end;
end;


// SAVED nirs on 12.01.2023
procedure TDocNaklForm.OLD__PastePosExecute(Sender: TObject);
var
  K,K1: Double;
  Table_Name: String;
  oldCheckPriceForbidden: boolean;
  q33Temp:TMegaQuery;
begin
  q33Temp:=nil;
  oldCheckPriceForbidden:= CheckPriceForbidden;
  try
    ChangeZakSpravForbidden:=true;
    DM.SharedQuery.Transaction.CommitRetaining;
    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'SELECT SUB_TABLE FROM SYS_FORM_TYPES WHERE FORM_KOD = :FORM_KOD';
    DM.SharedQuery.Params.ByName['FORM_KOD'].AsInteger := BUF_FORMKOD;
    DM.SharedQuery.ExecQuery;
    Table_Name := DM.SharedQuery.FieldByName('SUB_TABLE').AsString;

    HandMethod := true; //что бы подтягивалась партия из расходной накладной

    if ((sender <> nil) and (Sender.ClassName<>'TAction')) then
       DM.mdsSharedQuery:= TMegaRDataSet(Sender)
    else
    begin
      DM.mdsSharedQuery.Close;
     // DM.SharedQuery.Transaction:=Nakl_Transaction;
      DM.mdsSharedQuery.selectsql.Text := 'SELECT * FROM '+ Table_Name + ' WHERE DOCRECNO = :RECID AND BASEID = :BASEID';
      DM.mdsSharedQuery.ParamBYname('RECID').asInteger := BUF_RECID;
      DM.mdsSharedQuery.ParamBYname('BASEID').asInteger := BUF_BASEID;
      DM.mdsSharedQuery.open;
    end;
  //  DM.SharedQuery.Transaction.CommitRetaining;

    DocPos.ConfirmPost := False;
    if Source.DataSet.FieldByName('NDSINSUMMA').AsInteger = BUF_NSDINSUMMA then K := 1
    else begin if BUF_NSDINSUMMA = 1 then K := 1 / 1.2 else K := 1.2; end;

    if IsRussia and (BUF_FORMKOD=idvNakl) then begin
      q33Temp:=TMegaQuery.Create(self);
      q33Temp.Database   :=DocPos.Database;
      q33Temp.Transaction:=DocPos.Transaction;
      q33Temp.SQL.Text:='insert into DOC_NAKL_POS_ADD_PROP (RECID, BASEID, REGID_FORM_A, REGID_FORM_B, KOD_MATER) '+
                         'select :RECID, :BASEID, REGID_FORM_A, REGID_FORM_B, KOD_MATER '+
                         'from DOC_NAKL_POS_ADD_PROP a2 '+
                         'where a2.recid=:RECID0 and a2.baseid=:BASEID0';
    end;

    DM.mdsSharedQuery.first;
    while not DM.mdsSharedQuery.EOF Do
    begin
      if DM.mdsSharedQuery.FieldByName('PDV').Value='D' then K1:=1 else K1:=K;
      DocPosSource.Dataset.Append;
      DocPos.FieldByName('KOD_MATER').AsFloat := DM.mdsSharedQuery.FieldByName('KOD_MATER').AsFloat;
{    // 14.07.2007, Игнат К,
    // сделал изменение цен в документе, созданном из другого с статусом - реализация Ф2
    // - делаю варварскую схему с выводом индикатива
    //первое что делаю - после изменения ценности выключаю автоизменение позиций
    if ((OPERSTATUS = iosRealizationF2) AND ((IntfMegaDBCommon.GetCountry = iccRussia) or (IntfMegaDBCommon.GetCountry = kodRUS))) then
    try
      noEvent := True;
      try
        DocPos.FieldByName('KOLICH').AsFloat := DM.SharedQuery.FieldByName('KOLICH').AsDouble;

        DocPos.FieldByName('SUMMA1').AsFloat := DM.SharedQuery.FieldByName('KOLICH').AsDouble * DocPos.FieldByName('PRICE1').AsFloat;
        DocPos.FieldByName('SUMMA').AsFloat := DM.SharedQuery.FieldByName('KOLICH').AsDouble * DocPos.FieldByName('PRICE2').AsFloat;
        DocPos.FieldByName('IND_SUMMA').AsFloat := DM.SharedQuery.FieldByName('SUMMA1').AsDouble * K1 * (1+DocPosPDVGROUP_STAVKA.AsFloat/100)
      finally
        noEvent := False;
      end;
      // Индикатив там, по идее, уже выставился, менять ни к чему
      DocPos.FieldByName('PDV').Value := DM.SharedQuery.FieldByName('PDV').Value;
      DocPos.FieldByName('PARTY').Value := DM.SharedQuery.FieldByName('PARTY').Value;
      DocPos.Post;
    except
      on E:Exception do
      begin
        if IntfMegaDBCommon.IsOffice then
        begin
          DocPos.Cancel;
          ShowMessage(e.Message);
        end
        else DocPos.Cancel;
      end;
    end
    else
}
      try
        DocPos.FieldByName('KOLICH').AsFloat := DM.mdsSharedQuery.FieldByName('KOLICH').AsFloat;
        DocPos.FieldByName('SUMMA1').AsFloat := DM.mdsSharedQuery.FieldByName('SUMMA1').AsFloat * K1;
        DocPos.FieldByName('SUMMA').AsFloat := DM.mdsSharedQuery.FieldByName('SUMMA1').AsFloat * K1 / DocNakl.FieldByName('KURS').AsFloat;
        DocPos.FieldByName('IND_SUMMA').AsFloat := DM.mdsSharedQuery.FieldByName('IND_SUMMA').AsFloat;
        DocPos.FieldByName('IND').Value := DM.mdsSharedQuery.FieldByName('IND').Value;
        DocPos.FieldByName('PDV').Value := DM.mdsSharedQuery.FieldByName('PDV').Value;
        DocPos.FieldByName('PARTY').Value := DM.mdsSharedQuery.FieldByName('PARTY').Value;
        DocPos.FieldByName('ARTICUL_PARTNER').Value:=DM.mdsSharedQuery.FieldByName('ARTICUL_PARTNER').Value;
        DocPos.FieldByName('PACK_RECID').Value:=DM.mdsSharedQuery.FieldByName('PACK_RECID').Value;
        DocPos.FieldByName('DATE_ROZLIVA').Value:=DM.mdsSharedQuery.FieldByName('DATE_ROZLIVA').Value;
        DocPos.FieldByName('INVOCE_NUMBER').Value:=DM.mdsSharedQuery.FieldByName('INVOCE_NUMBER').Value;
        DocPos.Post;

        if q33Temp<>nil then
        try
          q33Temp.ExecWP([DocPos.FieldByName('recid').asInteger,DocPos.FieldByName('baseid').asInteger,
                          DM.mdsSharedQuery.FieldByName('recid').asInteger,
                          DM.mdsSharedQuery.FieldByName('baseid').asInteger]);
        finally
          q33Temp.Close;
        end;

      except
        on E:Exception do
        begin
            DocPos.Cancel;
            ShowMessage(e.Message);
        end;
      end;

      DM.mdsSharedQuery.Next;
    end;
    //DM.SharedQuery.Transaction:=dm.Transaction;
    DocPos.ConfirmPost := True;
    ChangeZakSpravForbidden:=false;
    {Query.Close;
    Query.SQL.Text := 'EXECUTE PROCEDURE UPDATE_NAKL_POS(:RECID, :BASEID, :price, :VAL, 1, 1)';
    Query.Params.ByName['RECID'].Value := DocPosRECID.Value;
    Query.Params.ByName['BASEID'].Value := DocPosBASEID.Value;
    Query.Params.ByName['VAL'].Value := DocNaklV.Value;
    Query.ExecQuery; }
  finally
    if q33Temp<>nil then q33Temp.Free;
    
    CheckPriceForbidden:= oldCheckPriceForbidden;

  end;
end;



procedure TDocNaklForm.ViewDocProvExecute(Sender: TObject);
var
  b:boolean;
  i : integer;
begin
  b:=fErrLink;
  fErrLink:=false;
  try
    if (DocNaklSTATE.Value=6) or (DocNaklSTATE.Value=5) then
      Nakl_transaction.RollbackRetaining;

    // если документ не сохранен, и его провести(либо закомитить транзакцию в другом месте),
    // то он сохранится(без проверок в функции SaveDoc) => делаем сохранение принужительно
    if SaveDoc and (ShowError <> ID_RETRY)then
    begin
      if not Nakl_Transaction.Active then
      begin
        Nakl_Transaction.StartTransaction;
        DocNakl.Open;
      end;
      TViewDocProvForm.Create(self,DocNakl.Transaction,
                              DocNakl.FieldByName('RECID').asInteger,
                              DocNakl.FieldByName('BASEID').asInteger,
                              DocNaklDOC_INHERITED.Value{idvNakl}).ShowModal;
    end;

  finally
   fErrLink:=b;
  end;            
end;

procedure TDocNaklForm.PriceLabelsExecute(Sender: TObject);
var
  F: TPriceLabelForm;
begin
  F :=  TPriceLabelForm.Create(Self);
  F.RECID := DocNaklRECID.Value;
  F.BASEID := DocNaklBASEID.Value;
  F.Caption := F.Caption + ' [из накладной] ';
  F.Show;
end;

procedure TDocNaklForm.PriceLabelsUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not PosModified;
end;

procedure TDocNaklForm.CreatePDVN_D2Execute(Sender: TObject);
begin
  if PosModified then
    if not CheckRest(True) then
      Exit;
  if  not (DocNakl.State in [dsEdit, dsInsert]) then
   begin
     Query2.Close;
     Query2.SQL.Text := 'execute procedure set_context_variable(''CHANGE_PERMITTED'',''1'')';
     Query2.ExecQuery;
   end;
  DocNakl.ConfirmPost := True;
  DocNakl.AutoPost := True;
  DocNakl.Edit;
  if (DocNaklSTATE.Value<>6) and (DocNaklSTATE.Value<>5) then DocNaklSTATE.Value := 2;
  DocNakl.SafePost;
  TMakePDVN_D2Form.Create(self).ShowModal;
  DocNakl.ConfirmPost := False;
  DocNakl.AutoPost := False;
end;

procedure TDocNaklForm.DocNaklDK_CChange(Sender: TField);

begin
   DK_C_NAME_CE.Enabled   := not CheckDKfromOper(o_DK_C,sender,'Через');
   DK_C_ED.Enabled   := DK_C_NAME_CE.Enabled;
   Source.DataSet.FieldByName('DK_C_NAME').AsString:=IntfMegaCommon.GetShortNameDK(sender.AsFloat);

   SetRules;
  if NoEvent then exit;
{  Query.Close;
  Query.SQL.Text := 'SELECT * FROM SPRAV_DK WHERE KOD_DK = ' + FloatToStr(Sender.AsFloat);
  Query.ExecQuery;
  Source.DataSet.FieldByName('DK_C_NAME').AsString :=
    Query.FieldByName('SHORTNAME_DK').AsString; }
end;

procedure TDocNaklForm.PriceListExecute(Sender: TObject);
var
  sSql: string;
  pDk: double;
  arrPrice: array [1..maxPriceCol] of string;
  price: TdmPriceListRep;
begin
  price:=TdmPriceListRep.Create(Self);
  sSql:='select M.KOD_MATER, M.LOCAL_KOD, M.GROUP_MATER, GROUP_NAME, M.NAME_MATER, M.ED_IZM, M.COUNTINBOX, M.INDIKATIV,'+
        ' (SELECT PRICE * (1 + ((SELECT SPRAV_PDVGROUP.PDVGROUP_STAVKA FROM SPRAV_PDVGROUP WHERE M.PDVGROUP = SPRAV_PDVGROUP.PDVGROUP_KOD) / 100) *'+
        ' (SELECT ABS(NDSINSUMMA-1) FROM SPRAV_BALANCE WHERE BALANCE_KOD= 77)) FROM GET_MATER_PRICE(M.KOD_MATER, "today",'+
           IntToStr(DM.DocListBALANCE_KOD.AsInteger)+','''',2,2)) PRICE1,'+
        '0.0 PRICE0,'+
        '0.0 PRICE2,'+
        '0.0 PRICE3,'+
        '0.0 PRICE4,'+
        '0.0 PRICE5,'+
        '0.0 PRICE6'+
        ' from SPRAV_MATER M'+
        ' inner join GROUP_MATER on (GROUP_MATER.GROUP_MATER=M.GROUP_MATER)'+
        ' inner join SPRAV_TVID on (GROUP_MATER.TVID_KOD=SPRAV_TVID.TVID_KOD)'+
        ' and (KOD_MATER IN (SELECT KOD_MATER FROM DOC_NAKL_POS WHERE DOCRECNO ='+IntToStr(DocNaklRECID.Value)+' AND BASEID ='+IntToStr(DocNaklBASEID.Value)+'))'+
        ' order by TVID_KOD, GROUP_NAME, NAME_MATER';
   pDk:=IntfMegaCommon.GetBalanceDK(DM.DocListBALANCE_KOD.AsInteger,Date,IntfmegaDBCommon.GetCFONakl);
   arrPrice[1]:='';
   price.PreparePrice(dm.Transaction,pDk,sSql,arrPrice,DocNaklDK_TO_NAME.AsString,DocNaklDOCNUMBER.AsString);
   price.frRepRow.ShowReport;
   price.free;
end;

procedure TDocNaklForm.DBGridEH1SortMarkingChanged(Sender: TObject);
begin
  SortInGrid(TDBGridEH(Sender));
end;

procedure TDocNaklForm.MakeDocExecute(Sender: TObject);
begin
  // Стояло проcто False, вплоть до 27.12.2005
  // Игнат К.
  // Чтоб создавать накладную из счёта-спецификации или из Инвойса на предоплату
  InternalMakeDoc((OPERSTATUS = iosInvoiceProf) OR (OPERSTATUS = iosInvoicePrePaid));
end;

procedure TDocNaklForm.Order1Execute(Sender: TObject);
begin
  DocPos.RefreshKeyTo('LOCAL_KOD;KOLICH', VarArrayOf([DocPosLOCAL_KOD.Value, DocPosKOLICH.Value]));
end;

procedure TDocNaklForm.Order2Execute(Sender: TObject);
begin
  DocPos.DisableControls;
  DocPos.Close;
  DocPos.Open;
  DocPos.EnableControls;
end;

procedure TDocNaklForm.PribExecute(Sender: TObject);
begin
  Query.Close;
  if DocNaklNDSINSUMMA.Value = 0 then
    Query.SQL.Text := 'SELECT SUM(SUMMA_K * (1 + (SELECT PDVGROUP_STAVKA FROM SPRAV_PDVGROUP, ' + SubTableName + ' P WHERE P.PDV = PDVGROUP_KOD AND P.RECID = J.SUBDOCRECNO AND P.DOCRECNO = J.DOCRECNO AND P.BASEID = J.BASEID)/100)) FROM OPER_JORNAL J WHERE DOCRECNO = :RECID AND BASEID = :BASEID AND FORMTYPE = :FORMTYPE AND MATER_KREDIT IS NOT NULL AND DEBET <> KREDIT'
  else
    Query.SQL.Text := 'SELECT SUM(SUMMA_K) FROM OPER_JORNAL J WHERE DOCRECNO = :RECID AND BASEID = :BASEID AND FORMTYPE = :FORMTYPE AND MATER_KREDIT IS NOT NULL AND DEBET <> KREDIT';
  Query.Params.ByName['RECID'].Value := DocNaklRECID.Value;
  Query.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
  Query.Params.ByName['FORMTYPE'].Value := DocNaklDOC_INHERITED.Value;
  Query.ExecQuery;
  S0 := Query.Fields[0].AsDouble;

  Query.Close;
  Query.SQL.Text := 'SELECT SUM(IND_SUMMA), SUM(KOLICH/COUNTINBOX), SUM(KOLICH*BRUTTO) FROM ' + SubTableName + ' POS, SPRAV_MATER MATER WHERE DOCRECNO = :RECID AND BASEID = :BASEID AND POS.KOD_MATER = MATER.KOD_MATER AND COUNTINBOX <> 0';
  Query.Params.ByName['RECID'].Value := DocNaklRECID.Value;
  Query.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
  Query.ExecQuery;
  SB := Query.Fields[0].AsDouble - S0;
  CountInBox := Query.Fields[1].AsDouble;
  Brutto:=Query.Fields[2].AsDouble/1000;
  BruttoMer:='кг.';
  S :=  Sum.Fields[5].AsFloat - S0;
  SD :=  S - SB;
  DBGridEH1.Repaint;
end;

procedure TDocNaklForm.UnCheckNaklBase(numAkc: integer);
var
  q:TMegaQuery;
  trans: TMegaTransaction;
const
  cSQL = 'select exept from check_akcia_base_nakl(:doc_recid, :doc_baseid, :num_akc,1)';
begin
//
  q:=nil; trans:=nil;
  try
    q:=TMegaQuery.Create(Self);

    trans:=TMegaTransaction.Create(Self);
    trans.DefaultDataBase:=IntfDBProvider.GetDB;

    q.DataBase:=IntfDBProvider.GetDB;
    q.Transaction:=trans;

    trans.StartTransaction;
    try
      q.SQL.Text:=cSQL;
      MegaQueryParam(q, 'DOC_RECID').AsInteger:=docnaklrecid.asinteger;
      MegaQueryParam(q, 'DOC_BASEID').AsInteger:=docnaklbaseid.asinteger;
      MegaQueryParam(q, 'NUM_AKC').AsInteger:=numAkc;
      MegaExecQuery(q);

      if q.FieldByNAme('exept').asInteger=0 then
         Application.MessageBox('Признак базовой накладной по данной акции ликвидирован!', 'Внимание !', MB_OK + MB_ICONWARNING);
      trans.Commit;

    except
      trans.Rollback;
      raise;
    end;
  finally
    if(Assigned(q)) then q.Free;
    if(Assigned(trans)) then trans.Free;
  end;
end;

procedure TDocNaklForm.UnCheckNaklBaseAll;
var
  q:TMegaQuery;
  trans: TMegaTransaction;
const
  cSQL = 'select exept from check_akcia_base_nakl(:doc_recid, :doc_baseid, :num_akc,2)';
begin
//
  q:=nil; trans:=nil;
  try
    q:=TMegaQuery.Create(Self);

    trans:=TMegaTransaction.Create(Self);
    trans.DefaultDataBase:=IntfDBProvider.GetDB;

    q.DataBase:=IntfDBProvider.GetDB;
    q.Transaction:=trans;

    trans.StartTransaction;
    try
      q.SQL.Text:=cSQL;
      MegaQueryParam(q, 'DOC_RECID').AsInteger:=docnaklrecid.asinteger;
      MegaQueryParam(q, 'DOC_BASEID').AsInteger:=docnaklbaseid.asinteger;
      MegaQueryParam(q, 'NUM_AKC').AsInteger:=1;
      MegaExecQuery(q);

      if q.FieldByNAme('exept').asInteger=0 then
         Application.MessageBox('Признак базовой накладной по всем акциям ликвидирован!', 'Внимание !', MB_OK + MB_ICONWARNING);
      trans.Commit;

    except
      trans.Rollback;
      raise;
    end;
  finally
    if(Assigned(q)) then q.Free;
    if(Assigned(trans)) then trans.Free;
  end;
end;

procedure TDocNaklForm.UntitledDocExecute(Sender: TObject);
var
{$IFDEF USE_FR3}
  dmPrintInternalDoc : TdmPrintInternalDoc;
{$ELSE}
  PrintInternalDocRep: TUntitledDocRepF;
{$ENDIF}
begin
  if not CheckRest(False) then
    Exit;
  DocNakl.Edit;
  if DocNaklSTATE.Value <= 0 Then
    DocNaklSTATE.Value := 1;

{$IFDEF USE_FR3}
  dmPrintInternalDoc := TdmPrintInternalDoc.Create(Self);
  try
    dmPrintInternalDoc.SetProperties(False,True,1);
    dmPrintInternalDoc.DocNakl.Transaction := DocNakl.Transaction;
    dmPrintInternalDoc.DocPos.Transaction := DocNakl.Transaction;
    dmPrintInternalDoc.Sum.Transaction := DocNakl.Transaction;
    ///
    dmPrintInternalDoc.PrintUntitled(DocNaklRecID.AsInteger, DocNaklBaseID.AsInteger, false{PrintInternalDocRep.QRGroup1.EXpression<>''});
  finally
  dmPrintInternalDoc.Free;
  end;
    
{$ELSE}
  PrintInternalDocRep := TUntitledDocRepF.Create(Self);
  PrintInternalDocRep.DocNakl.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.DocPos.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.Sum.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.DocNakl.Params[0].AsInteger := DocNaklRecID.Value;
  PrintInternalDocRep.DocNakl.Params[1].AsInteger := DocNaklBaseID.Value;
  PrintInternalDocRep.Print;
  PrintInternalDocRep.Free;
{$ENDIF}
end;
procedure TDocNaklForm.SetNacenkaExecute(Sender: TObject);
var
  S: String;
  D: Double;
  J, I: Integer;
begin
  if InputQuery('Введите наценку', 'Наценка %', S) then
  begin
    D := StrToFloat(S);
    J:= -1;
    if DBGridEh1.SelectedRows.Count = 0 then
      DBGridEh1.SelectedRows.CurrentRowSelected := True;
      DocPos.ConfirmPost := False;
      for I:=0 to DBGridEh1.SelectedRows.Count-1 do
      begin
        DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
        DBGridEh1.Update;
        if (DBGridEh1.DataSource.DataSet.FieldByName('COL1').Value<>1) or (D>0)  or (IntfMegaDBCommon.IsOffice)
          or ((IntfMegaAccessManager.GetUserRole='FIN_DIRECTOR_RUS')
           and (IntfMegaDBCommon.GetCountry=iccRussia))
        then
        begin
          DBGridEh1.DataSource.DataSet.Edit;
  {        if DBGridEh1.DataSource.DataSet.FieldByName('IND').Value = 1 then
          begin
            DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value := DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value * (1 + D / 100);
            DBGridEh1.DataSource.DataSet.FieldByName('IND_PRICE').Value := DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value / DBGridEh1.DataSource.DataSet.FieldByName('KOLICH').Value;
          end
          else
          begin}
            DBGridEh1.DataSource.DataSet.FieldByName('SUMMA').Value := DBGridEh1.DataSource.DataSet.FieldByName('SUMMA').Value * (1 + D / 100);
            DBGridEh1.DataSource.DataSet.FieldByName('SUMMA1').Value := DBGridEh1.DataSource.DataSet.FieldByName('SUMMA1').Value * (1 + D / 100);
      {    end;}
          DBGridEh1.DataSource.DataSet.FieldByName('STATE').Value := 100;
          DBGridEh1.DataSource.DataSet.Post;
        end;
        J:= I;
      end;
    if J <> -1 then
      DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[J-1]));
    DocPos.ConfirmPost := True;
{    Query.Close;
    Query.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    Query.Prepare;
    Query.Params.ByName['DOC_INHERITED'].Value := DocNakl.FieldByName('DOC_INHERITED').Value;
    Query.Params.ByName['RECID'].Value := DocNakl.FieldByName('RECID').Value;
    Query.Params.ByName['BASEID'].Value := DocNakl.FieldByName('BASEID').Value;
    Query.ExecQuery;}
  end;
end;

{procedure TDocNaklForm.OPLButtonClick(Sender: TObject);
var
  S: String;
  D: TDateTime;
begin
  if OPLButton.Down then S := '1' else S := '0';
  OPLQuery.Transaction.Active := True;

  OPLQuery.Close;
  OPLQuery.SQL.Text := 'SELECT CAST(PARAMVALUE AS DATE) FROM SYS_BASE_PARAMS WHERE PARAMNAME = ''WORKDATE''';
  OPLQuery.ExecQuery;
  D := OPLQuery.Fields[0].AsDateTime;

  if D > DocNaklOPERDATE.AsDateTime then
  begin
    OPLQuery.Close;
    OPLQuery.SQL.Text := 'UPDATE SYS_BASE_PARAMS SET PARAMVALUE = CAST(''' + DocNaklOPERDATE.AsString  + ''' AS DATE) WHERE PARAMNAME = ''WORKDATE''';
    OPLQuery.ExecQuery;
  end;

  OPLQuery.Close;
  OPLQuery.SQL.Text := 'UPDATE '+MainTableName+' SET OPL = ' + S + ' WHERE RECID = :RECID AND BASEID = :BASEID AND OPL <> ' + S;
  OPLQuery.Params.ByName['RECID'].Value := DocNaklRECID.Value;
  OPLQuery.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
  OPLQuery.ExecQuery;

  if D > DocNaklOPERDATE.AsDateTime then
  begin
    OPLQuery.Close;
    OPLQuery.SQL.Text := 'UPDATE SYS_BASE_PARAMS SET PARAMVALUE = CAST(''' + DateToStr(D)  + ''' AS DATE) WHERE PARAMNAME = ''WORKDATE''';
    OPLQuery.ExecQuery;
  end;

  OPLQuery.Transaction.Commit;
end;}

procedure TDocNaklForm.BitBtn7Click(Sender: TObject);
begin
  if (DocPos.RecordCount <= 0) then Exit;
  UpdateQuery.Close;
  UpdateQuery.Params[0].AsInteger := DocNaklRECID.Value;
  UpdateQuery.Params[1].AsInteger := DocNaklBASEID.Value;
  UpdateQuery.Params[2].AsInteger := DocNaklPRICETYPE_.Value;
  UpdateQuery.Params[3].AsInteger := DocNaklPRICE_FROM_VALYUTA.Value;
  UpdateQuery.Params[4].AsDouble := DocNaklKURS.Value;
  UpdateQuery.Params[5].AsInteger := 0;
//  UpdateQuery.Params[6].AsVariant := 0;
  UpdateQuery.ExecQuery;
  Refresh_NaklPos;
end;

procedure TDocNaklForm.CheckPrnExecute(Sender: TObject);
begin
  PrintCheck(true);
end;

procedure TDocNaklForm.LocateDocPos(Insert:boolean);
begin
  try
    if Nakl_Transaction.Active then
      Nakl_Transaction.CommitRetaining;
    DM.SYS_FORM_TYPES.Locate('MAIN_TABLE', ''+MainTableName+'', []);
    Key := VarArrayOf([Source.Dataset.FieldByName('RECID').AsInteger,
                    Source.Dataset.FieldByName('BASEID').AsInteger]);
    if Insert {and not btSep.Down }then
      PostMessage(TWinControl(Owner).Handle , 39999,
      DM.SYS_FORM_TYPES.FieldByName('FORM_KOD').AsInteger, 0)
    else PostMessage(TWinControl(Owner).Handle , 39999,
            DM.SYS_FORM_TYPES.FieldByName('FORM_KOD').AsInteger,
            Source.Dataset.FieldByName('RECID').AsInteger);

  except
  end;
end;

procedure TDocNaklForm.cbOplClick(Sender: TObject); //++
var
    Action: TCloseAction;
    frm:TfrmSaveUncheckSate;
    idCauses:integer;
    Comment:string;
    q: TMegaQuery;
begin
 if not OplCheckEnable then exit;

 if cbOpl.Checked then
 begin
   if ((not ((grBuhgalter in aIniParams.UserGroup)or(grKassir in aIniParams.UserGroup))) or
       ((IntfMegaAccessManager.GetUserRole <> 'CORRECTOR') and (IntfMegaDBCommon.GetCountry=iccRussia)  ) )then // Рос - только корректор может ставить галочку
   begin
     OplCheckEnable:=false;
     cbOpl.Checked:= not cbOpl.Checked;
     OplCheckEnable:=true;
     exit;
   end;
   DocNakl.Edit;
   {если снимают признак делаем запись в табличку}
   if grBuhgalter in aIniParams.UserGroup then  DocNaklSTATE.Value := idsBug;
   if grKassir in aIniParams.UserGroup then  DocNaklSTATE.Value := idsKassa;

   DocNakl.ConfirmPost:=false;
   DocNakl.Post;
   PosModified:=false;
   LocateDocPos(false);
   Close; exit;
 end else
 begin
   if ((DocNaklSTATE.Value = idsKassa)
       and
       (grKassir in aIniParams.UserGroup)
      )
   or ((DocNaklSTATE.Value = idsBug)
        and (grBuhgalter in aIniParams.UserGroup)
        or (MainTableName='DOC_SCHET')
      )
   or (
   //(IntfMegaDBCommon.GetCountry=iccRussia) and
       (''= IsNaklInSortParty(DocNaklRECID.AsInteger,DocNaklBASEID.AsInteger))
      ) then
   begin
     DocNakl.Edit;
     DocNaklSTATE.Value := 0;
     SumVpl:=0;
     DocNakl.Post;
    if ((DocNaklDOC_INHERITED.AsInteger=1) and (IntfMegaDBCommon.GetCountry=iccUkraine) and not (IntfMegaDBCommon.IsOffice) and (IntfMegaDBCommon.GetParam('SAVE_UNCHECK_STATE', '0') = '1')) then
     begin
        frm:=TfrmSaveUncheckSate.create(self);
        frm.ShowModal;
        Q := TMegaQuery.Create(Self);
        Q.Database := DM.Money;
        Q.Transaction := Nakl_Transaction;
        try
          Q.Close;
          Q.SQL.Text := 'insert into doc_nakl_causes_uncheck (nakl_recid, nakl_baseid, id, notes) values (:nakl_recid, :nakl_baseid, :id, :notes);';
          Q.Params.ByName['ID'].Value := frm.idCauses;
          Q.Params.ByName['NOTES'].Value := frm.Comment;
          Q.Params.ByName['NAKL_RECID'].Value := DocNaklRecid.Value;
          Q.Params.ByName['NAKL_baseid'].Value := DocNaklBaseid.Value;
          Q.ExecQuery;
        finally
          q.Free;
        end;
     end;

   end else
   begin


     OplCheckEnable:=false;
     cbOpl.Checked:= not cbOpl.Checked;
     OplCheckEnable:=true;
     exit;
   end;
end;


end;

procedure TDocNaklForm.DocNaklBeforePost(DataSet: TDataSet);
begin
  KursChange(nil);
  if NoEvent then exit;
  if (OPERSTATUS = iosReturnFromClient) OR (OPERSTATUS = iosInvoiceProf) then
  begin
    DBDateEdit1.SetFocus;
    CheckParentDoc;
  end;
  if (DocNaklOPERDATE.AsDateTime < Date) and (not IntfMegaDBCommon.IsOffice)  and   (DM.Money.DBParams.Values['user_name']<>'SYSDBA') then  begin
    if Application.MessageBox('Дата документа меньше текущей, вы уверены сохраняя документ в прошлый период? ', 'Внимание!!!', MB_YESNO + MB_ICONERROR+MB_DEFBUTTON2)=IDNO then
    begin
      Abort;
    end;
  end;
  if ((DocNaklFOplName.IsNull) and (not AlphaStarted)) then
   if (mrCANCEL=Application.MessageBox('Не задана форма оплаты. Сохранение не возможно.!', 'Внимание!',MB_OK + MB_ICONERROR)) then
   begin
      Abort;
   end;


  try
    CheckAllowChangeByNaklState;
  except
    on E:Exception do
    begin
      Application.MessageBox(PChar(E.Message), PChar('Внимание!'), MB_OK + MB_ICONERROR);
      DocNakl.Cancel;
    end;
  end;
end;


procedure TDocNaklForm.CheckAllowChangeByNaklState;
begin

  if (DocNaklSTATE.OldValue <> idsNotChange ) and (DocNaklSTATE.NewValue = idsNotChange) and (IntfMegaAccessManager.GetUserName<>'SYSDBA') and (IntfMegaAccessManager.GetUserRole<>'CORRECTOR') then
  begin
    DocNaklSTATE.NewValue:=DocNaklSTATE.OldValue;
  end;

  if (DocNaklSTATE.OldValue = idsKassa) and (DocNaklSTATE.NewValue <> idsKassa) and (not (DM.UserAccess in [0,2,3,5])) then
  begin
    DocNaklSTATE.NewValue:=idsKassa;
  end;

  if (DocNaklSTATE.OldValue = idsBug) and (DocNaklSTATE.NewValue <> idsBug) and
     (MainTableName<>'DOC_SCHET') and (not (DM.UserAccess in [0,2,3,5])) and
     (not (OPERSTATUS in [iosSpecification,iosInvoiceProf,iosInvoicePrePaid,iosInvoiceForPay])) and
     (not((IntfMegaDBCommon.GetCountry=iccRussia) and
          (''= IsNaklInSortParty(DocNaklRECID.AsInteger,DocNaklBASEID.AsInteger)))
     ) then
  begin
    DocNaklSTATE.NewValue:=idsBug;
    Application.MessageBox(PChar('Снимать признак оплаты можно только пользователям с уровнем доступа(0,2,3,5), либо если документ является предварительным заказом(счетом) !'), PChar('Внимание!'), MB_OK + MB_ICONERROR);
  end;

  if not (grKassir in aIniParams.UserGroup) then
  begin
    if (DocNaklSTATE.OldValue <> idsKassa) and (DocNaklSTATE.NewValue = idsKassa) then
    begin
      DocNaklSTATE.NewValue:=DocNaklSTATE.OldValue;
    end;
  end;

  if not ((grBuhgalter in aIniParams.UserGroup) and SYSGALKA) then
  begin
    if (DocNaklSTATE.OldValue <> idsBug) and (DocNaklSTATE.NewValue = idsBug) then
    begin
      DocNaklSTATE.NewValue:=DocNaklSTATE.OldValue;
    end;
  end;

  if (DocNaklSTATE.OldValue = idsBug) and (DocNaklSTATE.NewValue=idsBug) then
  begin
    if not IntfMegaDBCommon.IsOffice then
      raise Exception.Create('Изменение в документе запрещено. Снимите признак оплаты!');
  end;

  if (DocNaklSTATE.OldValue = idsNotChange) and (DocNaklSTATE.NewValue<>idsNotChange) and
     (IntfMegaAccessManager.GetUserRole<>'CORRECTOR') then
  begin
    raise Exception.Create('Изменение в документе запрещено!');
  end;

  if (DocNaklSTATE.OldValue = idsOFDogovor) and (DocNaklSTATE.NewValue=idsOFDogovor) then
  begin
    raise Exception.Create('Изменение в документе запрещено. Подписан договор на аренду ОФ.');
  end;

end;


procedure TDocNaklForm.CheckPrnPosExecute(Sender: TObject);
begin
PrintCheck(false);
end;

procedure TDocNaklForm.PrintCheck(FirstPos:Boolean);
var
slFileOut:TStringList;
popr,sum1,dd1,transport:double;
st1:string;
delFile:boolean;
PrnDir:string;
SelNaklPrnForm:TSelNaklPrnForm;
begin
  if not (grKassir in aIniParams.UserGroup) then exit;
  // 12.05.2005
  // Игнат К. (менял ini'шку)
  if ((aIniParams.Kassa) AND (DM.DocListBALANCE_KOD.AsString = aIniParams.Balance)) then
    PrnDir:=aIniParams.Path
  else
    PrnDir := '';
  //  PrnDir:=DM.lsKass.Values[DM.DocListBALANCE_KOD.AsString];

  if (DocNaklSTATE.Value = 6) then
  begin
   Application.MessageBox('Оплачено перечислением!', 'Внимание !', MB_OK + MB_ICONERROR);
   exit;
  end;

  if (FileExists(PrnDir+'check.ok')) then
  begin
   Application.MessageBox('Подождите пока печатается предыдущий чек или устраните ошибки ...', 'Внимание !', MB_OK + MB_ICONWARNING);
   exit;
  end;

  if (DocNaklSTATE.Value = 5) then
  begin
   PosModified := False;

   if Application.MessageBox('Попытка повторной печати чека!!! Продолжить? ', 'Внимание !', MB_YESNO + MB_ICONWARNING)=IDNO
   then  exit;
  end;
  //убираем умножение на НДС(будет хранится как внесли с этой суммы будет браться ндс)
  //if DocNaklNDSINSUMMA.Value=0 then
  //begin
 //   transport:=DocNaklTRANSPORT.Value*1.2;
 // end else
    transport:=DocNaklTRANSPORT.Value;


  sum1:=MyRoundFunc(Sum.FieldByName('SUMMARY').AsFloat,0.01);
  SelNaklPrnForm:=TSelNaklPrnForm.Create(Application,DocPos,transport,sum1,FirstPos);
  if SelNaklPrnForm.ShowModal=mrOk  then
   begin
     if DocNaklSTATE.Value <> 5 then
     begin
       DocNakl.Edit;
       DM.dsKassa.AppendRecord([DM.DocListBALANCE_KOD.Value,DocNaklRECID.Value, DocNaklBASEID.Value, DocNaklOPERDATE.Value,SelNaklPrnForm.Summ,(sum1-SelNaklPrnForm.Summ),1]);
       DocNaklSTATE.Value := 5;
       DocNakl.ConfirmPost:=false;

       DM.dsKassa.SaveToFile(PrnDir+'Kassa.cds');

       DocNakl.Post;
       LocateDocPos(false);
       SelNaklPrnForm.Free;
       Close; exit;

     end;
   end;
 SelNaklPrnForm.Free;

end;

procedure TDocNaklForm.PrintCheckPos;
var
   sumdoc,sumbuf,pricesum:double;
   addsum:double;
   nameMater:string;
   ipdv:integer;
begin
//
//   if MessageDlg('Вы хотите напечатать чеки?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
   if MessageDlg('Вы хотите напечатать чеки с акцизом?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
   begin
     sumdoc:=0.0;
     sumbuf:=0.0;
     addsum:=0.0;
     DocPos.DisableControls;
     DocPos.first;

     while not DocPos.eof do
     begin
       pricesum:=Round2(DocPosPRICEWPDV.AsFloat);
       IF verKassa=5 THEN
         FP.beginFiscalReceipt(0, '');
       sumdoc:=sumdoc+pricesum*DocPosKOLICH.AsFloat;

       nameMater :=  DocPos.FieldByName('code').AsString + '#' +  DocPos.FieldByName('NAME_MATER_KAS').AsString;
//       nameMater := DocPosNUMB_AKCIZ_FIX.AsString + '#' + nameMater; // add new nirs 12_05_2025

       ShowMessage(nameMater);
       if (verKassa=5) THEN
       begin
          case  DocPos.FieldByName('PDV').AsString[1] of
          'А':ipdv :=1;
          'B':ipdv :=3;
          else  ipdv :=1;
          end;
//          LastErrorBool :=FP.displayText(nameMater, pricesum*DocPosKOLICH.AsFloat);
//          if not LastErrorBool then ShowMessage(fp.LastErrorText);
          LastErrorBool := FP.printRecItem(nameMater, pricesum, DocPosKOLICH.AsFloat, ipdv, 0, 0);
          if not LastErrorBool then ShowMessage(fp.LastErrorText);
//          ShowErrors;
       END;
       DocPos.next;

     end;
     if SumSUMMARY.asfloat<>sumdoc then
     begin
         addsum:=SumSUMMARY.asfloat-sumdoc;
         if (verKassa=5) THEN
         begin
           if DISCOUNT=0 then   fp.printRecSubtotalAdjustment(0,addsum)//датекс
           else fp.printRecSubtotalAdjustment(addsum,0);//датекс новый
         end
     end;
     if MessageBox(0, PChar('Печать чека на сумму '+floattostr(Round2(SumSUMMARY.asfloat))+' прошла успешно?'), 'Подтверждение', MB_ICONQUESTION or MB_YESNO)=IDYES then
     begin
         if (verKassa=5) THEN
         begin
            if MessageBox(0, PChar('Оплатить наличными? '), 'Подтверждение', MB_ICONQUESTION or MB_YESNO)=IDYES then
              LastErrorBool := FP.printRecTotal(0,  0)
            else
              LastErrorBool := FP.printRecTotal(0,  3);

            LastErrorBool := FP.endFiscalReceipt;
            DocNakl.Edit;
            DocNaklSTATE.Value := idsKassa;
            DocNakl.Post;
            PosModified:=true;
            //updstate;
         end
     end;
     DocPos.EnableControls;
   end;
end;

procedure TDocNaklForm.MakeSepRestExecute;
var
  Nakl: TDocNaklForm;
  Form1:TForm;
  rest,d1,d2,cib:double;
begin
  if not  AAMakeForm.AAParamsData.Locate('DOCTYPE1;GROUP_OPER1;KOD_OPER1',VarArrayOf([DocNaklDOCTYPE.AsString,DocNaklGROUP_OPER.AsInteger,DocNaklKOD_OPER.AsInteger]),[])
  then begin exit;  end;

  Form1  := OpenDocument(Owner, AAMakeForm.AAParamsDataDOCTYPE2.Value, 0, 0, Date);
  if Form1 is TDocNaklForm then
  begin
    Nakl:= TDocNaklForm(Form1);
    Nakl.NotSetOtsr:=true;
    Nakl.NoOtsr:=true;
    Nakl.DocNaklDOCTYPE.AsString:=AAMakeForm.AAParamsDataDOCTYPE2.Value;
    Nakl.DocNaklGROUP_OPER.Value:=AAMakeForm.AAParamsDataGROUP_OPER2.Value;
    Nakl.DocNaklKOD_OPER.Value:=AAMakeForm.AAParamsDataKOD_OPER2.Value;
    if Nakl.DocNaklDK_FROM.Value = NULL then Nakl.DocNaklDK_FROM.Value := DocNaklDK_FROM.Value;
    Nakl.DocNaklDK_TO.Value := DocNaklDK_TO.Value;
    Nakl.DocNaklDK_C.AsVariant := DocNaklDK_C.AsVariant;
    Nakl.DocNaklNACENKA_.Value := DocNaklNACENKA_.Value;
    Nakl.DocNaklNOTES.Value := DocNaklNOTES.Value;
    Nakl.DocNaklPRICETYPE_.Value := DocNaklPRICETYPE_.Value;
    Nakl.DocNaklDOCDATE.AsDateTime:=DocNaklDOCDATE.AsDateTime;
    Nakl.DocNaklPRICE_FROM_VALYUTA.Value := DocNaklPRICE_FROM_VALYUTA.Value;
    Nakl.DocNaklV.Value := DocNaklV.Value;
    Nakl.DocNaklV1.Value := DocNaklV1.Value;
    Nakl.DocNaklKURS.Value :=DocNaklKURS.Value;
    Nakl.DocNaklOTSR.Value := DocNaklOTSR.Value;
    Nakl.DocNaklSTATE.Value := DocNaklSTATE.Value;
    Nakl.DocNaklTRANSPORT.Value := DocNaklTRANSPORT.Value;
    Nakl.DocNakl.Post;
    DocPos.First;
    DocPos.ConfirmPost:=false;
    DocPos.ConfirmDelete:=false;
    Nakl.DocPos.ConfirmPost:=false;
    while not DocPos.Eof do
    begin
      rest:=GetRest;
      if rest < 0 then
      begin
        cib:=DocPos.FieldByName('COUNTINBOX').AsFloat;
        d1:=DocPos.FieldByName('KOLICH').AsFloat+rest;
        if (cib<>0) and (DocPos.FieldByName('KOLICH').AsFloat>cib) then
        begin
          d2:= Trunc(d1/cib)*cib;
          rest:=rest-(d1-d2);
          d1:=d2;
        end;
      end
      else begin
             d1:=DocPos.FieldByName('KOLICH').AsFloat;
           end;
      if d1<>0 then begin
        Nakl.DocPosSource.Dataset.Append;
        Nakl.DocPos.FieldByName('KOD_MATER').AsFloat := DocPos.FieldByName('KOD_MATER').AsFloat;
        Nakl.DocPos.FieldByName('KOLICH').AsFloat :=d1 ;
        Nakl.DocPos.FieldByName('SUMMA1').AsFloat := (DocPos.FieldByName('SUMMA1').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1);
        Nakl.DocPos.FieldByName('SUMMA').AsFloat :=(DocPos.FieldByName('SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1);
        Nakl.DocPos.FieldByName('IND_SUMMA').AsFloat := (DocPos.FieldByName('IND_SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1);
        Nakl.DocPos.FieldByName('IND').Value :=DocPos.FieldByName('IND').Value ;
        Nakl.DocPos.FieldByName('PDV').Value := DocPos.FieldByName('PDV').Value ;
        Nakl.DocPos.Post;
       if rest>=0 then begin DocPos.Delete; {DocPos.Prior;} end
       else begin
         DocPos.Edit;
         DocPos.FieldByName('SUMMA1').AsFloat := (DocPos.FieldByName('SUMMA1').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(-rest);
         DocPos.FieldByName('SUMMA').AsFloat :=(DocPos.FieldByName('SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(-rest);
         DocPos.FieldByName('IND_SUMMA').AsFloat := (DocPos.FieldByName('IND_SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(-rest);
         DocPos.FieldByName('KOLICH').AsFloat := (-rest);
         DocPos.Post;
       end;
     end;
     if rest<0 then DocPos.Next;
    end;
    if Nakl.DocPos.RecordCount=0 then begin
      Nakl.DocNakl.ConfirmDelete := False;
      Nakl.DocNakl.Delete;
      Nakl.Close;
      Nakl.DocNakl.Transaction.Commit;
      exit;
    end;
    DocPos.ConfirmDelete := True;
    Nakl.DocPos.ConfirmPost := True;
    PosModified:=false;
    DocNakl.ConfirmPost:=false;
    LocateDocPos(false);
    Nakl.DocNakl.Edit;
    Nakl.DocNaklSTATE.Value := DocNaklSTATE.Value;
 //   Nakl.DocNaklDOCNUMBER.Value :=0;
    Nakl.DocNakl.Post;
//    Nakl.DontCheckRest := True;}
    Nakl.DocNakl.Transaction.CommitRetaining;
    DM.SharedQuery.Close;
    DM.SharedQuery.Transaction:= DM.trMainWShort;

    DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;


    DM.SharedQuery.Transaction.Commit;
    DM.SharedQuery.Transaction:=dm.trMainRO;
    //DocNakl.Edit;
  //  DocNaklSTATE.Value := 2;
    DontCheckRest := True;
    if DocPos.RecordCount=0 then
    begin
     DocNakl.Delete;
     DocNakl.Transaction.Commit;
    end else begin
     DocNakl.Edit;
     DocNaklDOCNUMBER.AsInteger:=Nakl.DocNaklDOCNUMBER.AsInteger;
     DocNakl.Post;
     PosModified:=false;
     DocNakl.ConfirmPost:=false;
     DocNakl.Transaction.CommitRetaining;
    end;
    Nakl.CheckRest(False);
    Self.Close;

 {   DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'SELECT ACCOUNT FROM SPRAV_TDOC WHERE DOCTYPE = :DOCTYPE';
    DM.SharedQuery.Params.ByName['DOCTYPE'].Value := DocNaklDOCTYPE.Value;
    DM.SharedQuery.ExecQuery;

  if DM.SharedQuery.Fields[0].AsInteger = 1 then
  begin
    DocNakl.Post;
    DocNakl.Transaction.CommitRetaining;
    Nakl.DocNakl.Post;
    Nakl.DocNakl.Transaction.CommitRetaining;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Transaction.CommitRetaining;

    DocNakl.ConfirmDelete := False;
    PosModified := False;
    DocNakl.Delete;
    DocNakl.Transaction.Commit;
    Close;
    TDocListForm(Owner).RefreshListExecute(Self);
  end; }
  end;
end;



procedure TDocNaklForm.mdsIncludeOkomis_includedChange(Sender: TField);
const sInsertQuery = 'insert into doc_nakl_include_okom (doc_recid, doc_baseid) values (:doc_recid, :doc_baseid)';
      sDeleteQuery = 'delete from doc_nakl_include_okom where (doc_recid = :doc_recid) and (doc_baseid = :doc_baseid)';
var
   q: TMegaQuery;
begin

  Q := TMegaQuery.Create(Self);
  Q.Database := DM.Money;
  Q.Transaction := Nakl_Transaction;
  try
    Q.Close;
    if chkIncludeOkom.checked then
       Q.SQL.Text := sInsertQuery
    else
       Q.SQL.Text := sDeleteQuery;
    Q.Params.ByName['DOC_RECID'].Value := DocNaklRecid.Value;
    Q.Params.ByName['DOC_BASEID'].Value := DocNaklBaseid.Value;
    Q.ExecQuery;
  finally
    q.Free;
  end;
end;

procedure TDocNaklForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
  var
  id:integer;
begin
{  if btSep.Down then
  begin
    if not CheckRest(False) then
    begin
      id:=Application.MessageBox('Создать корректирующий документ?', 'Внимание - количество превышает остатки!', MB_YESNOCANCEL + MB_ICONQUESTION);
      case id of
      IDCANCEL: begin
                  CanClose:=false;
                  exit;
                end;
      IDNO:     begin
                  if Application.MessageBox('Документ будет сохранен с неправильными остатками!!!', 'Внимание!', MB_OKCANCEL + MB_ICONQUESTION) =IDCANCEL then
                  begin
                    CanClose:=false;
                    exit;
                  end else  DontCheckRest := True;
                end;
      IDYES:    begin    MakeSepRestExecute; end;
      end;
    end;
  end;

 }
end;

procedure TDocNaklForm.btSepClick(Sender: TObject);
var
id:integer;
begin

  if not btSep.Down then DontCheckRest:=false;
 // if not CheckRest(False) then
 //   begin
      id:=Application.MessageBox('Создать корректирующий документ?', 'Внимание - количество превышает остатки!', MB_YESNO + MB_ICONQUESTION);
      case id of
      IDNO: begin
                  exit;
            end;
      IDYES:    begin
                  ShowMessage('Вызов устаревшего метода DocNakl.btSepClick. Срочно обратитесь в Отдел Автоматизации!');
                  AAMakeForm:=TAAMakeForm.Create(Self);
                  try
                    MakeSepRestExecute;
                  finally
                    AAMakeForm.Close;
                  end;
       end;
      end;
//    end;

end;

procedure TDocNaklForm.SepExecute(Sender: TObject);
begin
//if  btSep.Down then btSep.Down:=false else btSep.Down:=true;
   if btSep.Visible then btSep.Click;
end;

procedure TDocNaklForm.CopyPosHExecute(Sender: TObject);
begin
  CopyDataset(DocNakl,'Nakl.cds');
  CopyDataset(DocPos,'Pos.cds');
end;

procedure TDocNaklForm.PastePosHExecute(Sender: TObject);
begin
  NoEvent:=true;
  try
    DocPos.ConfirmPost := False;
    PasteDataset(DocNakl,'Nakl.cds', false);
    PasteDataset(DocPos,'Pos.cds', true);
  finally
    NoEvent := false;
    PosModified := true;
    DocPos.ConfirmPost := True;
  end;
end;

// Begin add new nirs 03_09_2024
procedure TDocNaklForm.actTestPrint_F2Execute(Sender: TObject);
var
{$IFDEF USE_FR3}
  dmPrintInternalDoc : TdmPrintInternalDoc;
{$ELSE}
  PrintInternalDocRep: TUntitledDocRepF;
{$ENDIF}
  fLic: Boolean;
begin
  If Not CheckRest(False) Then
    Exit;
  DocNakl.Edit;
  If DocNaklSTATE.Value <= 0 Then
    DocNaklSTATE.Value := 1;

{$IFDEF USE_FR3}
  dmPrintInternalDoc := TdmPrintInternalDoc.Create(Self);
  try
    dmPrintInternalDoc.SetProperties(False,True,1);
    dmPrintInternalDoc.DocNakl.Transaction := DocNakl.Transaction;
    dmPrintInternalDoc.DocPos.Transaction := DocNakl.Transaction;
    dmPrintInternalDoc.Sum.Transaction := DocNakl.Transaction;
//    // проверка на наличие лицензии
//    if (OPERSTATUS <> 4) or (IntfMegaDBCommon.GetParam('PR_NEW_NAKL_F2_AGENT','0') <> '1') then
//     fLic:= True
//    else
//     fLic:= DM.GetLic(DocNakl.FieldByName('DK_TO').AsFloat, DocNakl.FieldByName('OPERDATE').AsDateTime);
    dmPrintInternalDoc.PrintNewF2_2024(DocNaklRecID.AsInteger, DocNaklBaseID.AsInteger);
  finally
  dmPrintInternalDoc.Free;
  end;

{$ELSE}
{$ENDIF}
end;
// END add new nirs 03_09_2024


procedure TDocNaklForm.IntitledDocBRClick(Sender: TObject);
var
{$IFDEF USE_FR3}
  dmPrintInternalDoc : TdmPrintInternalDoc;
{$ELSE}
  PrintInternalDocRep: TUntitledDocRepF;
{$ENDIF}
  fLic: Boolean;
begin
  If Not CheckRest(False) Then
    Exit;
  DocNakl.Edit;
  If DocNaklSTATE.Value <= 0 Then
    DocNaklSTATE.Value := 1;

{$IFDEF USE_FR3}
  dmPrintInternalDoc := TdmPrintInternalDoc.Create(Self);
  try
    dmPrintInternalDoc.SetProperties(False,True,1);
    dmPrintInternalDoc.DocNakl.Transaction := DocNakl.Transaction;
    dmPrintInternalDoc.DocPos.Transaction := DocNakl.Transaction;
    dmPrintInternalDoc.Sum.Transaction := DocNakl.Transaction;
    // проверка на наличие лицензии
    if (OPERSTATUS <> 4) or (IntfMegaDBCommon.GetParam('PR_NEW_NAKL_F2_AGENT','0') <> '1') then
     fLic:= True
    else
     fLic:= DM.GetLic(DocNakl.FieldByName('DK_TO').AsFloat, DocNakl.FieldByName('OPERDATE').AsDateTime);
    dmPrintInternalDoc.PrintUntitled(DocNaklRecID.AsInteger, DocNaklBaseID.AsInteger, true, fLic{PrintInternalDocRep.QRGroup1.EXpression=''});
  finally
  dmPrintInternalDoc.Free;
  end;

{$ELSE}
  PrintInternalDocRep := TUntitledDocRepF.Create(Self);
  PrintInternalDocRep.DocNakl.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.DocPos.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.Sum.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.DocNakl.Params[0].AsInteger := DocNaklRecID.Value;
  PrintInternalDocRep.DocNakl.Params[1].AsInteger := DocNaklBaseID.Value;
  PrintInternalDocRep.QRGroup1.EXpression:='';
  PrintInternalDocRep.Print;
  PrintInternalDocRep.Free;
{$ENDIF}
end;



procedure TDocNaklForm.AAExecute(Sender: TObject);
begin
{AAMakeForm:=AAMakeForm.Create(Self);
AAMakeForm.Query1.SQL.Text:='select * from doc_schet';
AAMakeForm.Query1.SQL.Add('where recid');
}

end;

procedure TDocNaklForm.smTransChange(Sender: TObject);
begin
 if (((IntfMegaDBCommon.IsOffice) {and (IntfMegaDBCommon.GetCountry=iccRussia)})
    or (((IntfMegaAccessManager.GetUserRole = 'TRANSPORT_AUDIT') or (IntfMegaAccessManager.GetUserRole = 'CORRECTOR'))))
 then
 begin

   if NoTr then exit;
    if not (DocNakl.State in [dsInsert, dsEdit]) then
      DocNakl.Edit;
    try

       {if DocNaklNDSINSUMMA.Value=0
       then DocNaklTRANSPORT.Value:=smTrans.Value/1.2
       else}
       DocNaklTRANSPORT.Value:=smTrans.Value;
    except end;
  end;
end;

procedure TDocNaklForm.DocNaklTRANSPORTChange(Sender: TField);
begin

  NoTr := true;
  If DocPos.RecordCount = 0 then  DocNaklTRANSPORT.NewValue := 0;
 // if DocNaklNDSINSUMMA.Value = 0 then
 // begin
 //   smTrans.Value := DocNaklTRANSPORT.Value * 1.2;
 // end else
    smTrans.Value := DocNaklTRANSPORT.Value;
  NoTr := false;
end;

procedure TDocNaklForm.SetOtsr;
var
OTSR: Integer;
begin
  if NotSetOtsr then exit;
  if DocNaklPriceType_.AsInteger in [iptSpecialP,iptZakP] then
  begin
    if not ((DocNakl.State = dsEdit) or (DocNakl.State = dsInsert)) then DocNakl.Edit;
    DocNaklOTSR.AsInteger:=1;
    exit;
  end;
  if DK_OTSR=-1 then
  begin
    Query.Close;
    Query.SQL.Text:='select otsr, otsr_prior from sprav_dk where  KOD_DK=:KOD_DK';
    if DocNaklDOCTYPE.AsString[1]='П' then Query.Params[0].AsDouble:=DocNaklDK_FROM.AsFloat
    else Query.Params[0].AsDouble:=DocNaklDK_TO.AsFloat;
    Query.ExecQuery;
    DK_OTSR:=Query.Fields[0].AsInteger;
    DK_PRIOR:=Query.Fields[1].AsInteger;
  end;
  if DK_OTSR=0 then DK_OTSR:=10;
  if (POS_OTSR =0) then
  begin
    POS_OTSR := 0;
    POS_PRIOR := 0;
    if DocNaklOTSR.AsInteger <> DK_OTSR then
    begin
      if not ((DocNakl.State = dsEdit) or (DocNakl.State = dsInsert)) then DocNakl.Edit;
      DocNaklOTSR.AsInteger := DK_OTSR;
    end;
    exit;
  end;
  if POS_PRIOR>DK_PRIOR then
  begin
    OTSR:=POS_OTSR
  end else
  if POS_PRIOR<DK_PRIOR then
  begin
    OTSR:=DK_OTSR
  end else
  begin
    if DK_OTSR<POS_OTSR then
    begin
      OTSR:=DK_OTSR;
    end else
    begin
      OTSR:=POS_OTSR;
    end;
  end;
      if DocNaklOTSR.AsInteger <> OTSR then
    begin
      if not ((DocNakl.State = dsEdit) or (DocNakl.State = dsInsert)) then DocNakl.Edit;
      DocNaklOTSR.AsInteger := OTSR;
    end;

end;
procedure TDocNaklForm.NotOtsrExecute(Sender: TObject);
begin
  NoOtsr := true;
end;

procedure TDocNaklForm.aSetkaExecute(Sender: TObject);
begin
 if (DocPos.RecordCount <= 0) then Exit;
  UpdateQuery.Close;
  UpdateQuery.Params[0].AsInteger := DocNaklRECID.Value;
  UpdateQuery.Params[1].AsInteger := DocNaklBASEID.Value;
  UpdateQuery.Params[2].AsInteger := DocNaklPRICETYPE_.Value;
  UpdateQuery.Params[3].AsInteger := DocNaklPRICE_FROM_VALYUTA.Value;
  UpdateQuery.Params[4].AsDouble := DocNaklKURS.Value;
  UpdateQuery.Params[5].AsInteger := 0;
//  UpdateQuery.Params[6].AsVariant := 0;
  UpdateQuery.ExecQuery;

  Refresh_NaklPos;
end;

procedure TDocNaklForm.aSetNacIndExecute(Sender: TObject);
var
  S: String;
  D: Double;
  I: Integer;
begin
  if InputQuery('Введите индикативную наценку', 'Индик. наценка %', S) then
  begin
    D := StrToFloat(S);
    if DBGridEh1.SelectedRows.Count = 0 then
      DBGridEh1.SelectedRows.CurrentRowSelected := True;
      DocPos.ConfirmPost := False;
      for I:=0 to DBGridEh1.SelectedRows.Count-1 do
      begin
        DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
        DBGridEh1.Update;
        if (DBGridEh1.DataSource.DataSet.FieldByName('COL1').Value<>1)  or (D>0)  or (IntfMegaDBCommon.IsOffice) then
        begin
        DBGridEh1.DataSource.DataSet.Edit;
        if DBGridEh1.DataSource.DataSet.FieldByName('IND').Value = 0 then
        begin
          if DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value>DBGridEh1.DataSource.DataSet.FieldByName('SUMMAWPDV').Value
          then DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value:=DBGridEh1.DataSource.DataSet.FieldByName('SUMMAWPDV').Value;
          DBGridEh1.DataSource.DataSet.FieldByName('IND').Value:=1;
        end;

        if DBGridEh1.DataSource.DataSet.FieldByName('IND').Value = 1 then
        begin
          DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value := DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value * (1 + D / 100);
          DBGridEh1.DataSource.DataSet.FieldByName('IND_PRICE').Value := DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value / DBGridEh1.DataSource.DataSet.FieldByName('KOLICH').Value;
        end
        else
        begin
          DBGridEh1.DataSource.DataSet.FieldByName('SUMMA').Value := DBGridEh1.DataSource.DataSet.FieldByName('SUMMA').Value * (1 + D / 100);
          DBGridEh1.DataSource.DataSet.FieldByName('SUMMA1').Value := DBGridEh1.DataSource.DataSet.FieldByName('SUMMA1').Value * (1 + D / 100);
        end;
        DBGridEh1.DataSource.DataSet.FieldByName('STATE').Value := 100;
        DBGridEh1.DataSource.DataSet.Post;
        end;
      end;
    DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i-1]));
    DocPos.ConfirmPost := True;
{    Query.Close;
    Query.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    Query.Prepare;
    Query.Params.ByName['DOC_INHERITED'].Value := DocNakl.FieldByName('DOC_INHERITED').Value;
    Query.Params.ByName['RECID'].Value := DocNakl.FieldByName('RECID').Value;
    Query.Params.ByName['BASEID'].Value := DocNakl.FieldByName('BASEID').Value;
    Query.ExecQuery;}
  end;
end;

procedure TDocNaklForm.miSchet2PrintClick(Sender: TObject);
var
  dk:double;
  st:string;
  lMR:integer;
begin
  DocNakl.Edit;
  if DocNaklSTATE.Value <= 0 then DocNaklSTATE.Value := 1;
  if not GetDK2(DM.Money,dk,st,4) then exit;
//  Form.GROUP_DK_.RefreshKeyTo(Form.GROUP_DK_.Key, 4);
     st := ReplaceStr(st,'"','""');
     dmMegaReports.MyPrint(21,DocNaklOperDate.Value,DocNaklRecID.AsString+','+DocNaklBaseID.AsString+',"'+st+'"');
end;



procedure TDocNaklForm.aShowBaseidExecute(Sender: TObject);
begin
// if not IntfMegaDBCommon.IsOffice then exit;
 Label24.Visible:=not Label24.Visible;
 DBEdit5.Visible:=not DBEdit5.Visible;
end;

procedure TDocNaklForm.aShowRealPriceExecute(Sender: TObject);
begin
  if DBGridEh1.FieldColumns['RealPrice'].Visible then
    DBGridEh1.FieldColumns['RealPrice'].Visible:=false
   else
    DBGridEh1.FieldColumns['RealPrice'].Visible:=true;
end;

procedure TDocNaklForm.aShowOptPriceExecute(Sender: TObject);
begin
  if DBGridEh1.FieldColumns['OptPrice'].Visible then
  begin
    DBGridEh1.FieldColumns['OptPrice'].Visible:=false;
//    DocPosOptPrice.FieldKind:=fkCalculated;
    PriceControlData.Close;
  end
  else
  begin
//    DocPosOptPrice.FieldKind:=fkLookup;
    PriceControlData.Open;
    DBGridEh1.FieldColumns['OptPrice'].Visible:=true;
 {   DocPos.AutoCalcFields:=false;
    DocPos.AutoCalcFields:=true;}

    DBGridEH1.Refresh;
  end;
end;

procedure TDocNaklForm.PriceControlDataBeforeOpen(DataSet: TDataSet);
begin
//  PriceControlData.Params[0].AsDateTime:=DocNaklOPERDATE.AsDateTime;
  PriceControlData.Params[0].AsInteger:=DocNaklDOC_INHERITED.AsInteger;
  PriceControlData.Params[1].AsDouble:=DocNaklRECID.AsFloat;
//  PriceControlData.Params[].AsInteger:=DocNaklBASEID.AsInteger;
  PriceControlData.Params[2].AsInteger:=DocNaklBALANCE_KOD.AsInteger;
  PriceControlData.Params[3].AsDouble:=DocNaklRECID.AsFloat;
//  PriceControlData.Params[].AsInteger:=DocNaklBASEID.AsInteger;
end;

procedure TDocNaklForm.aDnacExecute(Sender: TObject);
var
  S: String;
  D: Double;
  I: Integer;
begin
  if InputQuery('Введите наценку', 'Наценка %', S) then
  begin
    D := StrToFloat(S);
    if DBGridEh1.SelectedRows.Count = 0 then
      DBGridEh1.SelectedRows.CurrentRowSelected := True;
      DocPos.ConfirmPost := False;
      for I:=0 to DBGridEh1.SelectedRows.Count-1 do
      begin
        DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
        DBGridEh1.Update;
        DBGridEh1.DataSource.DataSet.Edit;
        if DBGridEh1.DataSource.DataSet.FieldByName('IND').Value = 1 then
        begin
          DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value := DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value * (1 + D / 100);
          DBGridEh1.DataSource.DataSet.FieldByName('IND_PRICE').Value := DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value / DBGridEh1.DataSource.DataSet.FieldByName('KOLICH').Value;
        end
        else
        begin
          DBGridEh1.DataSource.DataSet.FieldByName('SUMMA').Value := DBGridEh1.DataSource.DataSet.FieldByName('SUMMA').Value * (1 + D / 100);
          DBGridEh1.DataSource.DataSet.FieldByName('SUMMA1').Value := DBGridEh1.DataSource.DataSet.FieldByName('SUMMA1').Value * (1 + D / 100);
        end;
        DBGridEh1.DataSource.DataSet.FieldByName('STATE').Value := 100;
        DBGridEh1.DataSource.DataSet.Post;
      end;
    DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i-1]));
    DocPos.ConfirmPost := True;
{    Query.Close;
    Query.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    Query.Prepare;
    Query.Params.ByName['DOC_INHERITED'].Value := DocNakl.FieldByName('DOC_INHERITED').Value;
    Query.Params.ByName['RECID'].Value := DocNakl.FieldByName('RECID').Value;
    Query.Params.ByName['BASEID'].Value := DocNakl.FieldByName('BASEID').Value;
    Query.ExecQuery;}
  end;

end;

procedure TDocNaklForm.aF1F2Execute(Sender: TObject);
var
  Nakl: TDocNaklForm;
  Form1:TForm;
  rest,d1,d2,cib:double;
  proc,kk:double;
  s:string;
  balance2:string;
//  stSCHET:string;
begin
  if InputQuery('Разделение по формам', 'Отправить в другую форму %', S) then
  begin
    proc := StrToFloat(S);
    if DocNaklBalance_KOD.AsString=IntTOStr(IntfMegaCommon.GetMainFirmBalanceKod) then
    begin
      DM.SharedQuery.Close;
      if IntfMegaDBCommon.GetParam('ALPHA_CHECK', '0')='0' then
            DM.SharedQuery.SQL.Text := 'select * from ALPHA_PARAMS where BASEID = '+ IntToStr(IntfMegaDBCommon.GetBaseID)
      else
            DM.SharedQuery.SQL.Text := 'select PP_BALANCE A_BALANCE from ALPHA_MASTER where CREATE_NAKL=0 and BASEID = '+ IntToStr(IntfMegaDBCommon.GetBaseID);
      DM.SharedQuery.ExecQuery;
      balance2:=DM.SharedQuery.FieldByName('A_BALANCE').AsString;
    end  else
    begin
      balance2:=IntTOStr(IntfMegaCommon.GetMainFirmBalanceKod);
    end;

    TSelectDocTypeForm.Create(Self, balance2).ShowModal;


    Form1  := OpenDocument(Self, DM.TDOCSource.DataSet.FieldByName('DOCTYPE').AsString, 0, 0, Date);

  if Form1 is TDocNaklForm then
  begin
    Nakl:= TDocNaklForm(Form1);
    Nakl.DocNaklDK_C.AsVariant := DocNaklDK_C.AsVariant;
    Nakl.GrOper_CEButtonClick(Self,0);
    Nakl.NotSetOtsr:=true;
    Nakl.NoOtsr:=true;
    if Nakl.DocNaklDK_FROM.Value = NULL then Nakl.DocNaklDK_FROM.Value := DocNaklDK_FROM.Value;
    Nakl.DocNaklDK_TO.Value := DocNaklDK_TO.Value;
    Nakl.DocNaklDK_C.AsVariant := DocNaklDK_C.AsVariant;
    Nakl.DocNaklNACENKA_.Value := DocNaklNACENKA_.Value;
    Nakl.DocNaklNOTES.Value := DocNaklNOTES.Value;
    Nakl.DocNaklPRICETYPE_.Value := DocNaklPRICETYPE_.Value;
    Nakl.DocNaklDOCDATE.AsDateTime:=DocNaklDOCDATE.AsDateTime;
//    Nakl.DocNaklTRIGGER_OFF.Value := DocNaklTRIGGER_OFF.Value;
    Nakl.DocNaklPRICE_FROM_VALYUTA.Value := DocNaklPRICE_FROM_VALYUTA.Value;
    Nakl.DocNaklV.Value := DocNaklV.Value;
    Nakl.DocNaklV1.Value := DocNaklV1.Value;
    Nakl.DocNaklKURS.Value :=DocNaklKURS.Value;
    Nakl.DocNaklOTSR.Value := DocNaklOTSR.Value;
    Nakl.DocNaklSTATE.Value := DocNaklSTATE.Value;
    Nakl.DocNaklTRANSPORT.Value := DocNaklTRANSPORT.Value;
    Nakl.DocNakl.Post;
  //  Nakl.PastePosExecute(nil);
    DocPos.First;
    DocPos.ConfirmPost:=false;
    DocPos.ConfirmDelete:=false;
    Nakl.DocPos.ConfirmPost:=false;
    kk:=1;
    if DocNaklBALANCE_KOD.AsInteger <> Nakl.DocNaklBALANCE_KOD.AsInteger then
    begin
      if DocNaklBALANCE_KOD.AsInteger=IntfMegaCommon.GetMainFirmBalanceKod then kk:=1.2 else kk:=1/1.2;
    end;


    while not DocPos.Eof do
    begin
      d1:=Round((DocPos.FieldByName('KOLICH').AsFloat*proc)/100);
      rest:=DocPos.FieldByName('KOLICH').AsFloat-d1;

      if d1<>0 then begin
        Nakl.DocPosSource.Dataset.Append;
        Nakl.DocPos.FieldByName('KOD_MATER').AsFloat := DocPos.FieldByName('KOD_MATER').AsFloat;
        Nakl.DocPos.FieldByName('KOLICH').AsFloat :=d1 ;
        Nakl.DocPos.FieldByName('SUMMA1').AsFloat := (DocPos.FieldByName('SUMMA1').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1)*kk;
        Nakl.DocPos.FieldByName('SUMMA').AsFloat :=(DocPos.FieldByName('SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1)*kk;
        Nakl.DocPos.FieldByName('IND_SUMMA').AsFloat := (DocPos.FieldByName('IND_SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1);
        Nakl.DocPos.FieldByName('IND').Value :=DocPos.FieldByName('IND').Value ;
        Nakl.DocPos.FieldByName('PDV').Value := DocPos.FieldByName('PDV').Value ;
        Nakl.DocPos.Post;
       if rest=0 then begin DocPos.Delete; {DocPos.Prior;} end
       else begin
         DocPos.Edit;
         DocPos.FieldByName('SUMMA1').AsFloat := (DocPos.FieldByName('SUMMA1').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(rest);
         DocPos.FieldByName('SUMMA').AsFloat :=(DocPos.FieldByName('SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(rest);
         DocPos.FieldByName('IND_SUMMA').AsFloat := (DocPos.FieldByName('IND_SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(rest);
         DocPos.FieldByName('KOLICH').AsFloat := (rest);
         DocPos.Post;
       end;
     end;

     if rest<>0 then DocPos.Next;
    end;
    if Nakl.DocPos.RecordCount=0 then begin
      Nakl.DocNakl.ConfirmDelete := False;
      Nakl.DocNakl.Delete;
      Nakl.Close;
      Nakl.DocNakl.Transaction.Commit;
      exit;
    end;
    DocPos.ConfirmDelete := True;
    Nakl.DocPos.ConfirmPost := True;
    PosModified:=false;
    DocNakl.ConfirmPost:=false;
    LocateDocPos(false);
    Nakl.DocNakl.Edit;
    Nakl.DocNaklSTATE.Value := DocNaklSTATE.Value;
 //   Nakl.DocNaklDOCNUMBER.Value :=0;
    Nakl.DocNakl.Post;
//    Nakl.DontCheckRest := True;}
    Nakl.DocNakl.Transaction.CommitRetaining;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;


    DM.SharedQuery.Transaction.CommitRetaining;
    //DocNakl.Edit;
  //  DocNaklSTATE.Value := 2;
    DontCheckRest := True;
    if DocPos.RecordCount=0 then
    begin
     DocNakl.Delete;
     DocNakl.Transaction.Commit;
    end else begin
//   DocNakl.Edit;
//   DocNaklDOCNUMBER.AsInteger:=Nakl.DocNaklDOCNUMBER.AsInteger;
//   DocNakl.Post;
     PosModified:=false;
     DocNakl.ConfirmPost:=false;
     DocNakl.Transaction.CommitRetaining;
    end;
    Nakl.CheckRest(False);
    Self.Close;

 {   DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'SELECT ACCOUNT FROM SPRAV_TDOC WHERE DOCTYPE = :DOCTYPE';
    DM.SharedQuery.Params.ByName['DOCTYPE'].Value := DocNaklDOCTYPE.Value;
    DM.SharedQuery.ExecQuery;

  if DM.SharedQuery.Fields[0].AsInteger = 1 then
  begin
    DocNakl.Post;
    DocNakl.Transaction.CommitRetaining;
    Nakl.DocNakl.Post;
    Nakl.DocNakl.Transaction.CommitRetaining;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Transaction.CommitRetaining;

    DocNakl.ConfirmDelete := False;
    PosModified := False;
    DocNakl.Delete;
    DocNakl.Transaction.Commit;
    Close;
    TDocListForm(Owner).RefreshListExecute(Self);
  end; }
   end;
  end;

end;

procedure TDocNaklForm.aViewSysProtokolExecute(Sender: TObject);
begin
  if not DocPos.IsEmpty then TViewSysProtokolForm.Create(self,SubTableName,DocPos.FieldByName('RECID').AsString+'|'+DocPos.FieldByName('BASEID').AsString).ShowModal;
end;

procedure TDocNaklForm.aCpProtokolExecute(Sender: TObject);
begin
  TfmChProtokol.Create(self,DocNakl.FieldByName('RECID').AsInteger,DocNakl.FieldByName('BASEID').AsInteger,MainTableName,SubTableName).ShowModal;
end;



procedure TDocNaklForm.acPrintSertifExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(103157, Now(), DocNaklRECID.asString+','+DocNaklBASEID.asString);
end;



procedure TDocNaklForm.acPrintSertifKrasnoyarskExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(200628, Now(), DocNaklRECID.asString+','+DocNaklBASEID.asString);
end;

procedure TDocNaklForm.acPrintSertifPostovDateExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(200632, Now(), DocNaklRECID.asString+','+DocNaklBASEID.asString);
end;

procedure TDocNaklForm.acPrintSertifRostovExcelExecute(Sender: TObject);
begin
  CreateReportsRostov(DocNaklRECID.AsInteger,DocNaklBASEID.AsInteger);
end;

procedure TDocNaklForm.acPrintSertifRostovExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(200631, Now(), DocNaklRECID.asString+','+DocNaklBASEID.asString);
end;

procedure TDocNaklForm.acPrintSertifVoronegExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(200633, Now(), DocNaklRECID.asString+','+DocNaklBASEID.asString);
end;

procedure TDocNaklForm.acPrintSertifYaroslavlExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(200640, Now(), DocNaklRECID.asString+','+DocNaklBASEID.asString);
end;
procedure TDocNaklForm.acPrintSertifKazanExecute(Sender: TObject);
begin
   dmMegaReports.MyShow(200641, Now(), DocNaklRECID.asString+','+DocNaklBASEID.asString);
end;

procedure TDocNaklForm.aPrintProverExecute(Sender: TObject);
var

{$IFDEF USE_FR3}
  dmPrintInternalDoc : TdmPrintInternalDoc;
  ldmRep: TdmPrintNakl2R;
{$ELSE}
  PrintInternalDocRep: TPrintInternalDocRep;
{$ENDIF}
begin
  CheckSelfExportState;
{$IFDEF USE_FR3}
  if ((IntfMegaCommon.GetPPBalance = DocNaklBALANCE_KOD.AsInteger) and (IntfMegaDBCommon.GetCountry = iccRussia)) then
  begin
    ldmRep:= TdmPrintNakl2R.Create(Self);
    try
      //ldmRep.frxNakl_Blank.Variables.Variables['PRINT_ALL']:=2;
      ldmRep.BlankNaklShowReport(DocNaklRecID.Value,DocNaklBaseID.Value,2);
    finally
      ldmRep.Free;
    end;
  end
  else
  begin
    dmPrintInternalDoc := TdmPrintInternalDoc.Create(Self);
    try
      dmPrintInternalDoc.SetProperties(False,True,1);
      dmPrintInternalDoc.DocNakl.Transaction := DocNakl.Transaction;
      dmPrintInternalDoc.DocPos.Transaction := DocNakl.Transaction;
      dmPrintInternalDoc.Sum.Transaction := DocNakl.Transaction;
      ///
      dmPrintInternalDoc.PrintProver(DocNaklRecID.AsInteger, DocNaklBaseID.AsInteger);
      ///
    finally
      dmPrintInternalDoc.Free;
    end;
  end;
{$ELSE}
//  if not CheckRest(False) then Exit;
//  DocNakl.Edit;
//  if DocNaklSTATE.Value <= 0 then DocNaklSTATE.Value := 1;
  PrintInternalDocRep := TPrintInternalDocRep.Create(Self);
  PrintInternalDocRep.NameDoc.Left:=PrintInternalDocRep.NameDoc.Left-5;
  PrintInternalDocRep.NameDoc.Caption:='ПРОВЕРОЧНЫЙ ДОКУМЕНТ';
 //
  PrintInternalDocRep.NameDoc.Font.Style:=[fsItalic];
  PrintInternalDocRep.QRDBText2.Font.Style:=[fsItalic];
  PrintInternalDocRep.QRDBText26.Font.Style:=[fsItalic];
  PrintInternalDocRep.QRExpr2.Font.Style:=[fsItalic];
  PrintInternalDocRep.QRLabel3.Font.Style:=[fsItalic];
  PrintInternalDocRep.QRLabel11.Font.Style:=[fsItalic];
  PrintInternalDocRep.QRLabel14.Font.Style:=[fsItalic];
  PrintInternalDocRep.QRLabel5.Font.Style:=[fsItalic];
  PrintInternalDocRep.QRLabel6.Font.Style:=[fsItalic];
  PrintInternalDocRep.QRChildBand1.Enabled:=false;


  PrintInternalDocRep.QRLabel31.Color:=clWhite;
  PrintInternalDocRep.QRLabel32.Color:=clWhite;
  PrintInternalDocRep.QRLabel33.Color:=clWhite;
  PrintInternalDocRep.QRLabel34.Color:=clWhite;
  PrintInternalDocRep.QRLabel35.Color:=clWhite;
  PrintInternalDocRep.QRLabel37.Color:=clWhite;
  PrintInternalDocRep.QRLabel38.Color:=clWhite;
  PrintInternalDocRep.QRLabel4.Color:=clWhite;

 //
  PrintInternalDocRep.DocNakl.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.DocPos.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.Sum.Transaction := DocNakl.Transaction;
  PrintInternalDocRep.DocNakl.Params[0].AsInteger := DocNaklRecID.Value;
  PrintInternalDocRep.DocNakl.Params[1].AsInteger := DocNaklBaseID.Value;
  if IntfMegaDBCommon.GetCountry=iccRussia then
    PrintInternalDocRep.QRGroup1.EXpression:='KREDIT'
  else
    PrintInternalDocRep.QRGroup1.EXpression:='';
  PrintInternalDocRep.QRLabelGet.Caption:=DocNakl.GetPersonsReceivingGrade;


  ///
  PrintInternalDocRep.NotPrinterSetup:=false;
  PrintInternalDocRep.Prepare;
  PrintInternalDocRep.qlPageCount.Caption:='из ' +IntToStr(PrintInternalDocRep.QRPrinter.PageCount);
  PrintInternalDocRep.NotPrinterSetup:=true;
  ///

  //  PrintInternalDocRep.Print;
//  PrintInternalDocRep.PrinterSetup;
//  if PrintInternalDocRep.Tag = 0 then
//  begin
    PrintInternalDocRep.Print;
//  end;


  PrintInternalDocRep.Free;
{$ENDIF}

end;

procedure TDocNaklForm.aShowRetPosExecute(Sender: TObject);
var
  fm1:TfrmSelectRetPos;
begin
      fm1:=TfrmSelectRetPos.Create(Self);
      fm1.ENP:=EditNaklPos;
      fm1.ShowModal;
end;

procedure TDocNaklForm.cbNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
    VK_RETURN:
    begin
      if  (ssCtrl in Shift) then
      begin
//        Geta(DocNaklDK_TO.AsFloat, true);
      end;
    end;
  end;
end;

procedure TDocNaklForm.AddrPost(aSelTT:TMegaSelDKDialog);
var
  sObjTO: TMegaObjTradeOutlet;
  lSc: integer;
  lInsSQL:string;
begin
 lSc:=Screen.Cursor;
 Screen.Cursor:=crHourGlass;
 try
  AdrQuery.Close;
  if(aSelTT.AddressRecid=0 ) then
  begin
    AdrQuery.SQL.Text:=
       'delete from DELIVERY_LOCATION '+
       'where FORMTYPE='+ DocNaklDOC_INHERITED.AsString +
       '  and DOCRECNO = ' + DocNaklRECID.AsString +
       '  and BASEID = ' + DocNaklBASEID.AsString;
    AdrQuery.ExecQuery;
  end
  else begin
    if not (Source.DataSet.State in [dsEdit,dsInsert] ) then
      Source.DataSet.Edit;

    AdrQuery.SQL.Text:=
       'execute procedure SET_DOC_DELIVERY_LOCATION ('+
             DocNaklRECID.AsString+','+
             DocNaklBASEID.AsString+','+
             DocNaklDOC_INHERITED.AsString+','+
             uUtils.iif(aSelTT.OutletRecID=0,'NULL',IntToStr(aSelTT.OutletRecID))+','+
             uUtils.iif(aSelTT.OutletBaseID=0,'NULL',IntToStr(aSelTT.OutletBaseID))+','+
             uUtils.iif(aSelTT.AddressRecid=0,'NULL',IntToStr(aSelTT.AddressRecid))+','+
             uUtils.iif(aSelTT.AddressBaseid=0,'NULL',IntToStr(aSelTT.AddressBaseid))+','+
             uUtils.iif(aSelTT.AreaId=0,'NULL',IntToStr(aSelTT.AreaId))+','+
             uUtils.iif(aSelTT.AreaBaseid=0,'NULL',IntToStr(aSelTT.AreaBaseid))+','+
             uUtils.iif(aSelTT.KeytRecid=0,'NULL',IntToStr(aSelTT.KeytRecid))+','+
             uUtils.iif(aSelTT.KeytBaseid=0,'NULL',IntToStr(aSelTT.KeytBaseid))+')';
    try
      AdrQuery.ExecQuery;
    except
      on E: EXCEPTION do
      begin
        Application.MessageBox(pchar(e.Message), 'Ошибка !', MB_OK + MB_ICONERROR);
        // чистим dk_to
        DocNaklDK_TO.AsVariant:=null;
        DocNaklDK_TO_NAME.Value:='';
        DocNaklDK_C.AsVariant:=null;
        DocNaklDK_C_NAME.Value:='';
        // AdrQuery.Transaction.RollbackRetaining;
      end;
    end;
  end;

  //----------------------------------------

  // если строка адреса пуста - и есть ссылка на торг точку
  // пытаемся получить её название и адрес из
  // объекта торговая точка
  if ((aSelTT.OutletAddress = '') and (aSelTT.OutletRecID <> 0)) then
  begin
    sObjTO:= TMegaObjTradeOutlet.Create(Self, Nakl_Transaction);
    try
    try
      sObjTO.Open(aSelTT.OutletRecID, aSelTT.OutletBaseID);
      aSelTT.OutletName:= sObjTO.FieldOutletName.AsString;
      aSelTT.OutletAddress:= sObjTO.Address;
    except
      on e: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
    finally
      sObjTO.Free;
    end;
  end;

  InitOutletNameFromNaklData;

  //  lbOutletInfo.Caption:= aSelTT.OutletName + ' ('+aSelTT.OutletAddress+')';
  NaklOutletRecid:=aSelTT.OutletRecID;
  NaklOutletBaseid:=aSelTT.OutletBaseID;

  // после изменения в delivery_location,
  // может изменится ЦФО в накладной, проверяем эту возможность
  AdrQuery.Close;
  AdrQuery.SQL.Text:= 'SELECT first 1 dn.CFO '+
    ' FROM DOC_NAKL dn '+
    ' WHERE dn.RECID = '+ DocNaklRECID.asString+
    '   and dn.BASEID= '+ DocNaklBASEID.asString;
  AdrQuery.ExecQuery;
  if (not AdrQuery.FN('CFO').IsNull ) and
     (AdrQuery.FN('CFO').AsInteger <> 0) and
     (AdrQuery.FN('CFO').AsInteger <> DocNaklCFO.AsInteger) and
     (Ask('ЦФО накладной не соответствует ЦФО торговой точки.'#13#10+
          'Изменить ЦФО в накланой?')= mrOk) then
  begin
    DocNaklCFO.AsInteger := AdrQuery.FN('CFO').AsInteger;
  end;

 finally
   Screen.Cursor:=lSc;
 end;
end;

procedure TDocNaklForm.btnAPIFOCUSApiClick(Sender: TObject);
var {[gsa] 280519 }
  scrQ, scrA, prm1, prm2: string;
  ft:Boolean;
  wk:IKonturCheckDebtor;
begin
  {//
  prm1:= 'DEMO6fb795dc8d827f6d92f1226d9667e8210df4';
  prm2:= '6663003127';
  scrQ:= 'https://focus-api.kontur.ru/api3/buh?key='+prm1+'&inn=6663003127';
//  idhtpsrvrFocus1
//  idhtpsrvrFocus1.Active:=false;
//  idhtpsrvrFocus1.Active:=True;

  lMemStream33  :=TMemoryStream.Create;
  lStrListR1:=TStringList.Create;

  HTTPSend:= THTTPSend.Create;

  lStrListR1.Clear;
  try
//    {scrA:= }{HttpGetText(scrQ,lStrListR1);
//    lXML_listdoc:=CreateXMLFromTStringList(lStrListR1,lMemStream33);

//  ft:=HTTPSend.HTTPMethod('GET',scrQ);
//  scrA:=HTTPSend.ResultString;


  finally
    lMemStream33.Free;
    lStrListR1.Free;
    HTTPSend.Destroy;
  end;
       }
//   GetKonturLisence(const debtorKodInn: Double)
  wk:=GetIKonturCheckDebtor;


  try
      scrA:=wk.GetKonturLisence({6663003127}  StrToFloat(DK_TO_ED.Text));
      ShowMessage(scrA);
  except
      ShowMessage('APIFOCUSApi: че то пошле не так. :( ');
  end;


end;

procedure TDocNaklForm.btnCheckWithColClick(Sender: TObject);
var
  s : string;
begin
  btnCheckWithCol.Checked := not btnCheckWithCol.Checked;
  isAlphaCol:=False;
  if IntfMegaDBCommon.GetCountry=iccUkraine then
    if Application.MessageBox('Хотите сравнить цены альфы?', 'Внимание',
      MB_YESNO + MB_ICONQUESTION) = IDYES
       then  isAlphaCol := true;


  if btnCheckWithCol.Checked and
     InputQuery('Сравнить цены с колонкой...', 'Номер колонки', S) and
     tryStrToInt(s,aCheckWithColNumber) then
  begin
    DBGridEh1.FieldColumns['COL_CHECK_WITH'].Visible := btnCheckWithCol.Checked;
    DBGridEh1.FieldColumns['COL_CHECK_WITH'].Title.Caption := 'Кол.'+IntToStr(aCheckWithColNumber);
  end
  else
    DBGridEh1.FieldColumns['COL_CHECK_WITH'].Visible := btnCheckWithCol.Checked;

  DocPos.Refresh;
end;

procedure TDocNaklForm.btnPriceColsClick(Sender: TObject);
var
 Form1:TfmColSet;
begin
  Form1:=TfmColSet.Create(self);
  Form1.ColData.Transaction:=DocNakl.Transaction;
  Form1.ColData.SelectSQL.Text:='select sm.group_mater, gm.group_name, 0 col, 0 IND from '+SubTableName+
    ' dnp '+
    'left join sprav_mater sm on (dnp.kod_mater=sm.kod_mater) '+
    'left join group_mater gm on (sm.group_mater=gm.group_mater) '+
    'left join view_price_col pc on (pc.kod_mater=sm.kod_mater) '+
    'where pc.col is not null and dnp.docrecno=:RECID and baseid=:BASEID '+
    'group by sm.group_mater, gm.group_name ';

  Form1.ColData.Params[0].AsInteger:=DocNaklRECID.AsInteger;
  Form1.ColData.Params[1].AsInteger:=DocNaklBASEID.AsInteger;
  Form1.ColData.Open;
  DocPos.ConfirmPost:=false;
  if Form1.ShowModal=mrOk then
  begin
    DocPos.First;
    DBGridEh1.SetFocus;
    while not DocPos.Eof do
    begin
      if Form1.ColData.Locate('GROUP_MATER',DocPosGROUP_MATER.AsInteger,[]) AND ((DocNaklDK_TO.AsFloat=999) or (DocPosCOL1.AsInteger<>1))  then
      begin
        if Form1.ColDataCOL.AsInteger<>0 then
        begin
          DocPos.Edit;
          Query.Close;
          Query.SQL.Text :='SELECT first 1 coalesce(so.NOT_CONTROL_PRICE,0)   FROM SPRAV_OPER so where so.GROUP_OPER='+IntToStr(DocNaklGROUP_OPER.Value)+' and so.KOD_OPER='+IntToStr(DocNaklKOD_OPER.Value)+';';
          Query.ExecQuery;
          if Query.Fields[0].AsInteger<>1 then
            begin
              Query.Close;
              if (((IntfMegaDBCommon.GetCountry = iccRussia) OR (IntfMegaDBCommon.GetCountry = kodRUS)) AND (not intfMegaDBCommon.IsOffice)) then
                Query.SQL.Text :=
                  'SELECT * FROM PROC_GET_MATER_PRICE_DK_OUTLET(' + DocPosKOD_MATER.AsString + ', ''' +
                  DateToStr(DocNaklOPERDATE.Value) + ''',  ' +
                  DocNaklBALANCE_KOD.AsString + ', ''!!!'', 100, ' + Form1.ColDataCOL.AsString + ', '+
                  DocNaklDK_TO.AsString + ','+DocNaklCFO.asstring +', ' + IntToStr(NaklOutletRecid) + ', ' + IntToStr(NaklOutletBaseid)
    { ---------------- Added by Lion in 24.12.2008 --------------- }
    {             Накладную нужно создавать по ценам региона           }
//                  + liUtils.iif(Trim(DocNaklADDR_TO.asstring) = '', '', ', ' + DocNaklADDR_TO.asstring)
                  + liUtils.iif((Trim(DocNaklADDR_TO.asstring) = '') or (DocNaklCFO.asInteger = DocNaklADDR_TO.AsInteger), ' ,null ', ', ' + DocNaklADDR_TO.asstring)
    { ----------- End of changing by Lion in 24.12.2008 ----------- }
                  + ')'
              else
                Query.SQL.Text :=
                  'SELECT * FROM C_GET_MATER_PRICE_TO_DK(' + DocPosKOD_MATER.AsString + ', ''' +
                  DateToStr(DocNaklOPERDATE.Value) + ''',  ' +
                  DocNaklBALANCE_KOD.AsString + ', ''!!!'', 100, ' + Form1.ColDataCOL.AsString + ', '+
                  DocNaklDK_TO.AsString + ','+DocNaklCFO.asstring
      { ---------------- Added by Lion in 24.12.2008 --------------- }
      {           Накладную нужно создавать по ценам региона - в Украине не нужно           }
      //              + liUtils.iif(Trim(DocNaklADDR_TO.asstring) = '', '', ', ' + DocNaklADDR_TO.asstring)
      { ----------- End of changing by Lion in 24.12.2008 ----------- }
                  + ')';

              Query.ExecQuery;
              if (Form1.ColDataIND.AsInteger<>1) then
               begin
                 if InVal.DataBinding.Field.AsInteger = DocNaklV.AsInteger then
                   begin
                     DocPosSUMMA.Value := (DocPosKOLICH.Value) * Query.Fields[0].AsDouble;
                     DocPosSUMMA1.Value := (DocPosKOLICH.Value) * Query.Fields[0].AsDouble * DocNaklKURS.Value;
                   end
                 else
                   begin
                     DocPosSUMMA.Value := (DocPosKOLICH.Value) * Query.Fields[0].AsDouble/DocNaklKURS.Value;
                     DocPosSUMMA1.Value := (DocPosKOLICH.Value) * Query.Fields[0].AsDouble;
                   end;
               end
                 else
                   DocPosIND.AsInteger:=1;

              EditNaklPos.Ind_price.Value := Query.Fields[3].AsDouble;
            end
              else
                begin
                   if (Form1.ColDataIND.AsInteger<>1) then
                     begin
                       DocPosSUMMA.Value := 0;
                       DocPosSUMMA1.Value := 0;
                     end
                   else
                     DocPosIND.AsInteger:=1;
                   EditNaklPos.Ind_price.Value :=0;
                end;

          if DocNaklNDSINSUMMA.Value = 0 then
            begin
              EditNaklPos.Ind_price.Value := EditNaklPos.Ind_price.Value * (1+DocPosPDVGROUP_STAVKA.AsFloat/100);
              EditNaklPos.WithPdvPrice.Value := DocPosPrice2.Value * (1+DocPosPDVGROUP_STAVKA.AsFloat/100);
            end;
          DocPosInd_SUMMA.Value := EditNaklPos.Ind_price.Value * DocPos.FieldByName('KOLICH').AsFloat;
          DocPos.FieldByName('STATE').Value := 100;
          DocPos.Post;
          // считаем самую похожую колонку - btnShowCol.checked
          // сравниваю с выбранной колонкой - btnCheckWithCol.checked
          CalcColFordocNaklPosRecord;

        end;
      end;
      DocPos.Next;
    end;
  end;
  DocPos.ConfirmPost:=true;
  DBGridEh1.FieldColumns['COL'].Visible:=true;
  Form1.Free;
end;

procedure TDocNaklForm.btnReturnCauseClick(Sender: TObject);
begin
  fmDocReturnCause := TfmDocReturnCause.Create(Self);
  fmDocReturnCause.init(Nakl_Transaction, DocNaklRECID.AsInteger,DocNaklBASEID.AsInteger);
  fmDocReturnCause.ShowModal;
  DocNakl.Edit;
  DocNakl.RecordModified(True);
end;

procedure TDocNaklForm.aBrandsExecute(Sender: TObject);
var
  Form1:TfmBrandAdd;
begin
  If DocNaklDK_C.IsNull then exit;
 { Form1:=TfmBrandAdd.Create(Self);
  Form1.Dataset1:=DocPos;
  Form1.ENP:=EditNaklPos;
  Form1.BrandData.Transaction:=DocNakl.Transaction;
  Form1.BrandData.Params[0].AsDouble:=DocNaklDK_TO.AsFloat;
  Form1.BrandData.Params[1].AsDouble:=DocNaklDK_C.AsFloat;
  Form1.BrandData.Params[2].AsDouble:=DocNaklBASEID.AsFloat;
  Form1.BrandData.Open;
  Form1.ShowModal;
  Form1.Free;}
end;

procedure TDocNaklForm.aSetNacRoundExecute(Sender: TObject);
var
  S: String;
  D: Double;
  I: Integer;
begin
  if InputQuery('Введите наценку ', 'Наценка c округлением до копейки %', S) then
  begin
    D := StrToFloat(S);
    if DBGridEh1.SelectedRows.Count = 0 then
      DBGridEh1.SelectedRows.CurrentRowSelected := True;
      DocPos.ConfirmPost := False;
      for I:=0 to DBGridEh1.SelectedRows.Count-1 do
      begin
        DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
        DBGridEh1.Update;
        if (DBGridEh1.DataSource.DataSet.FieldByName('COL1').Value<>1)  or (D>0)  or (IntfMegaDBCommon.IsOffice) then
        begin
        DBGridEh1.DataSource.DataSet.Edit;
{        if DBGridEh1.DataSource.DataSet.FieldByName('IND').Value = 1 then
        begin
          DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value := DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value * (1 + D / 100);
          DBGridEh1.DataSource.DataSet.FieldByName('IND_PRICE').Value := DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value / DBGridEh1.DataSource.DataSet.FieldByName('KOLICH').Value;
        end
        else
        begin}
          DBGridEh1.DataSource.DataSet.FieldByName('SUMMA').Value := MyRoundFunc(DBGridEh1.DataSource.DataSet.FieldByName('SUMMA').Value * (1 + D / 100),0.01);
          DBGridEh1.DataSource.DataSet.FieldByName('SUMMA1').Value := MyRoundFunc(DBGridEh1.DataSource.DataSet.FieldByName('SUMMA1').Value * (1 + D / 100),0.01);
    {    end;}
        DBGridEh1.DataSource.DataSet.FieldByName('STATE').Value := 100;
        DBGridEh1.DataSource.DataSet.Post;
        end;
      end;
    DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i-1]));
    DocPos.ConfirmPost := True;
{    Query.Close;
    Query.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    Query.Prepare;
    Query.Params.ByName['DOC_INHERITED'].Value := DocNakl.FieldByName('DOC_INHERITED').Value;
    Query.Params.ByName['RECID'].Value := DocNakl.FieldByName('RECID').Value;
    Query.Params.ByName['BASEID'].Value := DocNakl.FieldByName('BASEID').Value;
    Query.ExecQuery;}
  end;

end;

procedure TDocNaklForm.btnShowColClick(Sender: TObject);
begin
  btnShowCol.Checked:= not btnShowCol.Checked;
  DBGridEh1.FieldColumns['COL'].Visible:=btnShowCol.Checked;
  DocPos.First;
end;

procedure TDocNaklForm.btnStorageInClick(Sender: TObject);
begin
    Query.Close;
    Query.SQL.Text :='select coalesce(so.storage,0) from  sprav_oper so where so.group_oper = '+ DocNaklGROUP_OPER.AsString +' and so.kod_oper = '+DocNaklKOD_OPER.AsString;
    Query.ExecQuery;
    if ((Query.Fields[0].AsInteger=1) or((Query.Fields[0].AsInteger=2)and(DocNaklSUMMA.AsFloat<0))or (DocNaklDK_TO.AsFloat=14))   then
      begin
        fmStoragePlacement:=TfmStoragePlacement.Create(Application,DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger);
        fmStoragePlacement.ShowModal;
      end
        else
          ShowMessage('Для документа с такой группой и кодом операции размещение на складе не разрешено!');


end;

procedure TDocNaklForm.btnStorageOutClick(Sender: TObject);
begin
    Query.Close;
    Query.SQL.Text :='select coalesce(so.storage,0) from  sprav_oper so where so.group_oper = '+ DocNaklGROUP_OPER.AsString +' and so.kod_oper = '+DocNaklKOD_OPER.AsString;
    Query.ExecQuery;
    if ((Query.Fields[0].AsDouble=2) and (DocNaklSUMMA.AsFloat>=0))or (DocNaklDK_TO.AsFloat=14) then
      begin
        fmStorageShip:=TfmStorageShip.Create(Application,DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger);
        fmStorageShip.ShowModal;
        DocPos.CloseOpen(true);
      end
         else
          ShowMessage('Для документа с такой группой и кодом операции распределения со склада не разрешено!');
         
end;

procedure TDocNaklForm.btnTRANSPORT_TIMESaveClick(Sender: TObject);
var          //[gsa] 24-09-2019 добавления данные по накладной в базу.
  str, DT:String;
  q: TMegaQuery;
begin
//----
 DT := DateToStr(DOCDATE.Date);
 DT := DT+' '+cbbTRANSPORT_TIME_HH.Text+':'+cbTRANSPORT_TIME_MM.Text+':00';
 str:='update or insert into NAKL_ADDITION_PROP(NAKL_RECID, NAKL_BASEID, TRANSPORT_TIME) '+
  'values('+DocNaklRECID.AsString+','+ DocNaklBASEID.AsString+','''+DT+''') matching(NAKL_RECID,NAKL_BASEID);';


    q:= TMegaQuery.Create(Self);
    try
      q.Database:= DM.Money;
      q.Transaction:= Nakl_Transaction;
      q.SQL.Text:=str;
      MegaExecQuery(q);
    finally
      q.Free;
    end;
  ShowMessage('Инф.: Данные записаны.');

end;

procedure TDocNaklForm.btnVekselAddClick(Sender: TObject);
var
   frmTmp:TfVekselAdd;
begin
//------
  frmTmp:=TfVekselAdd.Create(self);
  frmTmp.trans.Active:=True;


  frmTmp.fbdsVeksel.Params.ByName['DOC_RECID'].Value:=DocNaklRecID.Value;
  frmTmp.fbdsVeksel.Params.ByName['DOC_BASEID'].Value:= DocNaklBASEID.Value;
  frmTmp.fbdsVeksel.Params.ByName['FORMTYPE'].Value:= DocNaklDOC_INHERITED.Value;
  frmTmp.fbdsVeksel.Open;

  if((frmTmp.fbdsVeksel.Eof) and (frmTmp.fbdsVeksel.Bof))
    then  frmTmp.fbdsVeksel.append
    else   frmTmp.fbdsVeksel.edit;



  frmTmp.recid:=DocNaklRecID.AsInteger ;
  frmTmp.baseid:=DocNaklBaseid.asInteger;
  frmTmp.formtype:=DocNaklDOC_INHERITED.Value;
//  frmTmp.kodmater:=DocPosKOD_MATER.asInteger;
//  frmTmp.edtMaterNm.Text:=DocPosNAME_MATER.AsString;
  frmTmp.ShowModal;
  frmTmp.Free;

//------
end;

procedure TDocNaklForm.lbForDesignReportDblClick(Sender: TObject);
begin
  FDesignReport:= True;
//  lbForDesignReport.Caption:= 'Design';
end;

procedure TDocNaklForm.lblCFOOtgrClick(Sender: TObject);
begin
  DocNakl.Open;
  lblCFOOtgr.Caption:= Format('ЦФО отгрузки - %d', [
    VarToInt(fbExecQuery(Nakl_Transaction, 'select st.cfo from DISTR_GET_AGENT_AREA(%s, %s) dga '
     +' left join DISTR_GET_AREA_TERRIT(dga.area_recid, dga.area_baseid, %1:s) dgt on (1=1)'
     +' left join sprav_territory st on (st.recid=dgt.territ_recid and st.baseid=dgt.territ_baseid)',
     [StrEx(DocNaklDK_C.AsFloat, 0), QuotedStr(DateToStrEx(DocNaklOPERDATE.AsDateTime))]))
  ]);
  lblCFOOtgr.Font.Color:= clWindowText;
end;

procedure TDocNaklForm.lcbZayavkaPropertiesInitPopup(Sender: TObject);
begin
(*
  fdsZayavka.Close;
  fdsZayavka.ParamByName('DOCDATE').AsDateTime:= DOCDATE.Date;
  fdsZayavka.ParamByName('cfo_city').AsInteger:= GetCfoCity(VarToInt(MegaSelCFO.Value));
  fdsZayavka.Conditions.Clear;
//  fdsZayavka.Conditions.AddCondition('CLOSED',
//    Format('(znt.PrintDate is not Null and znt.InDATE is Null) or znt.Recid = %d', [VarToInt(fdsZayavkaRECID.Value)]), True);
  fdsZayavka.Conditions.Apply;
  fdsZayavka.Open;
*)
  lbZayavka.Caption:= 'Заявка: ' + DocNaklZAYAVKA_ID.AsString;
end;

procedure TDocNaklForm.aTakeAccExecute(Sender: TObject);
begin
  exit;
//  if DM.UserAccess<>1 then exit;
//  if Application.MessageBox('Забирая права, вы забираете всю ответственность за данную накладную', 'Внимание !', MB_YESNO + MB_ICONWARNING)=IDNO then exit;
//  Query3.Close;
//  Query3.SQL.Text:='delete from SYS_USER_DOC WHERE OPER=0 AND '+
//   'BASEID='+DocNaklBASEID.AsString+' AND RECID='+DocNaklRECID.AsString+' AND TABLENAME='+#39+MainTableName+#39;
//  Query3.ExecQuery;
//  Query3.Close;
//  Query3.SQL.Text:='INSERT INTO SYS_USER_DOC (USERNAME, TABLENAME, RECID, BASEID, OPER) VALUES ('+
//  #39+IntfMegaAccessManager.GetUserName+#39+','+#39+MainTableName+#39+','+DocNaklRECID.AsString+','+DocNaklBASEID.AsString+',0)';
//  Query3.ExecQuery;
//  stUser.Text:=IntfMegaAccessManager.GetUserName;
end;

procedure TDocNaklForm.aGExecute(Sender: TObject);
var
 S, st,st1:string;
 dd:double;
begin
  if (DM.UserAccess<>2) and (DM.UserAccess<>0) then exit;
  if InputQuery('Проставление галочки:', 'Введите код доступа', S) then
  begin
      st:=MakeGalPassw(IntfMegaDBCommon.GetBaseID,DocNaklDK_TO.AsFloat,DocNaklOPERDATE.AsDateTime,DocNaklSUMMA1.AsFloat);
{      st:=DateToStr(DocNaklOPERDATE.AsDateTime);
      st1:=Copy2SymbDel(st,'.');
      System.Delete(st,1,1);
      st1:=st1+Copy2SymbDel(st,'.');
      dd:=ABS(DocNaklDK_TO.AsFloat/StrToFloat(st1));
      dd:=(dd*MyRoundFunc(DocNaklSUMMA1.AsFloat, 0.01))/IntfMegaDBCommon.GetBaseID;
      st:=FloatToStr(dd);
      st:=ReplaceStr(st,DecimalSeparator,'');
      st:=System.Copy(st,1,8);  }
      if Trim(S)<>st then
      begin
        Application.MessageBox('Код доступа неверен','Ошибка', MB_OK+MB_ICONERROR);
        exit;
      end else
      begin
        try
          SYSGALKA:=true;
          DocNakl.Edit;
          DocNaklSTATE.Value:=6;
          DocNakl.Post;
          PosModified:=true;
        finally
           SYSGALKA:=false;
           if DocNaklSTATE.Value=6 then cbOpl.Checked:=true;
        end;
      end;
  end;
end;

function TDocNaklForm.AllowAll: boolean;
var
  q: TMegaQuery;
begin
  Result:=(DocNaklDK_TO.AsFloat=DM.DKTDM) or (DocNaklDK_TO.AsFloat=DM.DKPP)
   or (DocNaklDK_TO.AsFloat=14) or (DocNaklDOCTYPE.AsString= 'РНа300')
   or (DocNaklDOCTYPE.AsString= 'РНд300')
   or (OPERSTATUS in [iosOutcomeToOtv,{iosSpecifciation,}iosRealization,iosPrintNakl,iosFinal]); //[gsa] 26-07-2019 не определаня переменя.
  if not Result then
  begin
    q:= TMegaQuery.Create(Self);
    try
      q.Database:= DM.Money;
      q.Transaction:= Nakl_Transaction;
      q.SQL.Text:='SELECT count(*) CNT FROM ALPHA_DK WHERE KOD_DK=:KOD_DK';
      MegaQueryParam(q, 'KOD_DK').AsDouble:= DocNaklDK_TO.AsFloat;
      MegaExecQuery(q);
      Result:= MegaQueryField(q, 'CNT').AsInteger>0;
    finally
      q.Free;
    end;
  end;
end;

procedure TDocNaklForm.actCreateNaklAkciiExecute(Sender: TObject);
var
  q:TMegaQuery;
  trans: TMegaTransaction;
const
  cSQL = 'select count(NEW_NAKL_RECID) except from CHECK_AKCIA_AND_MAKE_AKCIA_NAKL(:doc_recid, :doc_baseid)';
begin
//
  q:=nil; trans:=nil;
  try
    q:=TMegaQuery.Create(Self);

    trans:=TMegaTransaction.Create(Self);
    trans.DefaultDataBase:=IntfDBProvider.GetDB;

    q.DataBase:=IntfDBProvider.GetDB;
    q.Transaction:=trans;

    trans.StartTransaction;
    try
      q.Sql.Text:=cSQL;
      MegaQueryParam(q, 'DOC_RECID').AsInteger:=docnaklrecid.asinteger;
      MegaQueryParam(q, 'DOC_BASEID').AsInteger:=docnaklbaseid.asinteger;
      MegaExecQuery(q);

      if q.FieldByNAme('except').asInteger>0 then
         Application.MessageBox('По накладной созданы акционные накладные!', 'Внимание !', MB_OK + MB_ICONWARNING);
      trans.Commit;

    except
      trans.Rollback;
      raise;
    end;
  finally
    if(Assigned(q)) then q.Free;
    if(Assigned(trans)) then trans.Free;
  end;
end;

procedure TDocNaklForm.actCreateOplDocExecute(Sender: TObject);
begin
  InternalMakeDoc(True);
end;

procedure TDocNaklForm.actCreatePDVNaklReportsExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(301,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString);
end;

procedure TDocNaklForm.actDelNarExecute(Sender: TObject);
begin
  //if not(DM.ChangeQuery.Transaction.InTransaction) then DM.SharedQuery.Transaction.StartTransaction;

  DM.ChangeQuery.Close;
  DM.ChangeQuery.SQL.Text:='delete from doc_order_sklad where recid=:recid and baseid=:baseid';
  DM.ChangeQuery.ParamByName('RECID').asInteger:=mdsDocOrderSkladrecid.Value;
  DM.ChangeQuery.ParamByName('BASEID').asInteger:=mdsDocOrderSkladbaseid.Value;
  DM.ChangeQuery.ExecQuery;

  //DM.ChangeQuery.Transaction.Commit;

  mdsDocOrderSklad.Close;
  mdsDocOrderSklad.ParamByName('TYPE_ORDER').asInteger:= 0;
  mdsDocOrderSklad.Open;
end;

procedure TDocNaklForm.actDelNarUpdate(Sender: TObject);
begin
   TAction(Sender).Visible:=not(mdsDocOrderSkladRecid.isNull);
end;

procedure TDocNaklForm.ActDocListLocateExecute(Sender: TObject);
begin
  DocListLocate(DocNaklBALANCE_KOD.Value,
                DocNaklRECID.Value,DocNaklBASEID.Value,
                DocNaklOPERDATE.Value,
                MainTableName);
end;

procedure TDocNaklForm.InternalMakeDoc(aCreateLinkedOplDoc: boolean);
var
  Nakl: TDocNaklForm;
  Prov: TDocProvForm;
  Form1:TForm;

  lFormType,i: integer;
  lAutoperenos: boolean;
  isVipChPriceReturnNaklF2, isVipChPriceReturnNakl : boolean;
const
  sInsertLinkDocOplQuery =
    ' insert into link_doc_opl '+
    '  (PARENT_RECID, PARENT_BASEID, OPL_RECID, OPL_BASEID, OPL_FORM_TYPE) '+
    ' values '+
    '  (:PARENT_RECID, :PARENT_BASEID, :OPL_RECID, :OPL_BASEID, :OPL_FORM_TYPE)';

  sInsertLinkDocNew = 'select result, error_descr from MAKE_DOC_LINKED(:PARENT_RECID,:PARENT_BASEID,:PARENT_FORM_TYPE,:OPL_RECID,:OPL_BASEID,:OPL_FORM_TYPE)';

  sQueryGetFormType =
    ' select DOC_INHERITED '+
    ' from sprav_tdoc '+
    ' where doctype  = :DOCTYPE ';

  cQueryGetOplState =
    ' select STATUS'+
    ' from SPRAV_OPER '+
    ' where GROUP_OPER = :GROUP_OPER and KOD_OPER = :KOD_OPER';

  cQueryGetIsRaskhod = 'select * from GET_ISRASKHOD( :GROUP_OPER, :KOD_OPER, :BALANCE_KOD, :OPERDATE)';

begin
  // Здравствуй Ж... Новый Год!
  // начинаем с того, что закрываем возврат из возврата
  // Игнат К.Г.
  // 2005-01-03

  // Если в документе были изменения - сохраняю..
  if ((PosModified) OR (DocNakl.State in [dsEdit, dsInsert])) AND ((OPERSTATUS = iosInvoicePrePaid)) then
    SaveDoc;

  DM.SharedQuery.Close;
  DM.SharedQuery.SQL.Text := 'SELECT ACCOUNT FROM SPRAV_TDOC WHERE DOCTYPE = :DOCTYPE';
  DM.SharedQuery.Params.ByName['DOCTYPE'].Value := DocNaklDOCTYPE.Value;
  DM.SharedQuery.ExecQuery;
  lAutoperenos:=DM.SharedQuery.Fields[0].AsInteger = 1;

  // Определяю, не приход ли этот документ
  DM.SharedQuery.Close;
  DM.SharedQuery.SQL.Text:= cQueryGetIsRaskhod;
  DM.SharedQuery.Params.ByName['GROUP_OPER'].AsInteger:= DocNaklGROUP_OPER.AsInteger;
  DM.SharedQuery.Params.ByName['KOD_OPER'].AsInteger:= DocNaklKOD_OPER.AsInteger;
  DM.SharedQuery.Params.ByName['BALANCE_KOD'].AsInteger:= DocNaklBALANCE_KOD.AsInteger;
  DM.SharedQuery.Params.ByName['OPERDATE'].AsDateTime:= DocNaklOPERDATE.AsDateTime;
  DM.SharedQuery.ExecQuery;

  isVipChPriceReturnNakl := (DocNaklGROUP_OPER.AsInteger=77361000)and(DocNaklKOD_OPER.AsInteger=240003);
  isVipChPriceReturnNaklF2 := (DocNaklGROUP_OPER.AsInteger=300006300)and(DocNaklKOD_OPER.AsInteger=9964001);

  // Если приход, тогда надо проверить, не возврат ли он?

   // Если оказалось, что действительно, возврат, тогда вон наХ..
   //if GetProvStatus = 2 then
   // i:=0;
    // Но, Вон наХ..., говорим не сразу, для "на склад комисс.товара ВОЗВРАТ ЧЕРЕЗ (Цпд) (изм. цены)"
    // всетаки разрешаем делать расход из возврата - "покупателю ЧЕРЕЗ + 20% НДС (изм.цены)"
    // проверка на только "покупателю ЧЕРЕЗ + 20% НДС (изм.цены)"
   // if not( isVipChPriceReturnNakl or isVipChPriceReturnNaklF2 )then
   //   raise Exception.Create('Нельзя делать возврат из возврата!');

  CopyPosExecute(nil);

  if isVipChPriceReturnNakl or isVipChPriceReturnNaklF2 then
  begin
    TSelectDocTypeForm.Create(Self, DocNaklBalance_KOD.AsString).ShowModal;
  end
  else
  if (not aCreateLinkedOplDoc) then
  begin
    TSelectDocTypeForm.Create(Self, DocNaklBalance_KOD.AsString).ShowModal;
  end
  else
  begin
    TSelectDocTypeForm.CreateOnlyPrihodDocs(Self, DocNaklBalance_KOD.AsString).ShowModal;
  end;


  Form1  := OpenDocument(nil {Self}, DM.TDOCSource.DataSet.FieldByName('DOCTYPE').AsString, 0, 0, Date);

  if Form1 is TDocProvForm then
  begin
    Prov:= TDocProvForm(Form1);

    // 27/05/2002 - eooaiei - ia?aei eciaiaiey aey naycee iieaiouo aieoiaioia
    if aCreateLinkedOplDoc then
    begin
      Prov.Query.Close;
      Prov.Query.SQL.Text:= sQueryGetFormType;
      Prov.Query.Params.ByName['DOCTYPE'].AsString:= Prov.DocProvDOCTYPE.AsString;
      Prov.Query.ExecQuery;
      lFormType:= Prov.Query.Fields[0].AsInteger;

      // "Новая" привязка документов
      // пока не категоричная
      try
        Prov.Query.Close;
        Prov.Query.SQL.Text:= sInsertLinkDocNew;
        Prov.Query.Params.ByName['PARENT_RECID'].AsInteger:= DocNaklRECID.AsInteger;
        Prov.Query.Params.ByName['PARENT_BASEID'].AsInteger:= DocNaklBASEID.AsInteger;
        Prov.Query.Params.ByName['PARENT_FORM_TYPE'].AsInteger:= DocNaklDOC_INHERITED.AsInteger;
        Prov.Query.Params.ByName['OPL_RECID'].AsInteger:= Prov.DocProvRECID.AsInteger;
        Prov.Query.Params.ByName['OPL_BASEID'].AsInteger:= Prov.DocProvBASEID.AsInteger;
        Prov.Query.Params.ByName['OPL_FORM_TYPE'].AsInteger:= lFormType;
        Prov.Query.ExecQuery;
//        if not Prov.Query.eof then
//          if Prov.Query.FieldByName('RESULT').asInteger <1 then
//            ShowMessage(Prov.Query.FieldByName('ERROR_DESCR').asString)
      except
        on e:Exception do
          ShowMessage(e.Message);
      end;

      Prov.Query.Close;
      Prov.Query.SQL.Text:= sInsertLinkDocOplQuery;

      Prov.Query.Params.ByName['PARENT_RECID'].AsInteger:= DocNaklRECID.AsInteger;
      Prov.Query.Params.ByName['PARENT_BASEID'].AsInteger:= DocNaklBASEID.AsInteger;

      Prov.Query.Params.ByName['OPL_RECID'].AsInteger:= Prov.DocProvRECID.AsInteger;
      Prov.Query.Params.ByName['OPL_BASEID'].AsInteger:= Prov.DocProvBASEID.AsInteger;
      Prov.Query.Params.ByName['OPL_FORM_TYPE'].AsInteger:= lFormType;

      Prov.Query.ExecQuery;
    end;


      Prov.DocProvDK_FROM.Value:=DocNaklDK_TO.Value;
      Prov.DocProvDK_FROM_NAME.Value:=DocNaklDK_TO_NAME.Value;
      if DocNaklDK_C.AsFloat<>0 then
      begin
        Prov.DocProvDK_C.Value:=DocNaklDK_C.Value;
        Prov.DocProvDK_C_NAME.Value:=DocNaklDK_C_NAME.Value;
      end;
      Prov.DocProvSUMMA1.Value:=SumSUMMARY.Value;
      Prov.DocProvOPERDATE.AsDateTime:=Date;
      Prov.DocProvDOCDATE.AsDateTime:=Date;

    Prov.GrOper_CEButtonClick(Self);

    if Prov.OPERSTATUS=iosSkidkaInd then
    begin
      Prov.DocProvDK_TO.Value:=DocNaklDK_TO.Value;
      Prov.DocProvDK_TO_NAME.Value:=DocNaklDK_TO_NAME.Value;
      Prov.DocProvSUMMA1.Value:=SumINDIKATIV.Value;
    end;


  end
  else
    if Form1 is TDocNaklForm then
    begin
      Nakl:= TDocNaklForm(Form1);

      // 27/05/2002 - eooaiei - ia?aei eciaiaiey aey naycee iieaoiuo aieoiaioia
      if aCreateLinkedOplDoc then
      begin
        Nakl.Query.Close;
        Nakl.Query.SQL.Text:= sQueryGetFormType;
        Nakl.Query.Params.ByName['DOCTYPE'].AsString:= Nakl.DocNaklDOCTYPE.AsString;
        Nakl.Query.ExecQuery;
        lFormType:= Nakl.Query.Fields[0].AsInteger;

        // "Новая" привязка документов
        // пока не категоричная
        try
          Nakl.Query.Close;
          Nakl.Query.SQL.Text:= sInsertLinkDocNew;
          Nakl.Query.Params.ByName['PARENT_RECID'].AsInteger:= DocNaklRECID.AsInteger;
          Nakl.Query.Params.ByName['PARENT_BASEID'].AsInteger:= DocNaklBASEID.AsInteger;
          Nakl.Query.Params.ByName['PARENT_FORM_TYPE'].AsInteger:= DocNaklDOC_INHERITED.AsInteger;
          Nakl.Query.Params.ByName['OPL_RECID'].AsInteger:= Nakl.DocNaklRECID.AsInteger;
          Nakl.Query.Params.ByName['OPL_BASEID'].AsInteger:= Nakl.DocNaklBASEID.AsInteger;
          Nakl.Query.Params.ByName['OPL_FORM_TYPE'].AsInteger:= lFormType;
          Nakl.Query.ExecQuery;
//          if not Prov.Query.eof then
//            if Prov.Query.FieldByName('RESULT').asInteger <1 then
//              ShowMessage(Prov.Query.FieldByName('ERROR_DESCR').asString)
        except
          on e:Exception do
            ShowMessage(e.Message);
        end;

        Nakl.Query.Close;
        Nakl.Query.SQL.Text:= sInsertLinkDocOplQuery;
        Nakl.Query.Params.ByName['PARENT_RECID'].AsInteger:= DocNaklRECID.AsInteger;
        Nakl.Query.Params.ByName['PARENT_BASEID'].AsInteger:= DocNaklBASEID.AsInteger;
        Nakl.Query.Params.ByName['OPL_RECID'].AsInteger:= Nakl.DocNaklRECID.AsInteger;
        Nakl.Query.Params.ByName['OPL_BASEID'].AsInteger:= Nakl.DocNaklBASEID.AsInteger;
        Nakl.Query.Params.ByName['OPL_FORM_TYPE'].AsInteger:= lFormType;
        Nakl.Query.ExecQuery;
      end;
      // eiiao eciaiaiee aey naycee iieaoiuo aieoiaioia


      Nakl.DocNaklDK_C.AsVariant := DocNaklDK_C.AsVariant;
      if isVipChPriceReturnNakl then
      begin
        Nakl.DocNaklKOD_OPER.AsInteger := 3610002;
        Nakl.DocNaklGROUP_OPER.AsInteger := 772811000;
        Nakl.DocNaklKOD_OPERChange(DocNaklKOD_OPER);
      end
      else
      if isVipChPriceReturnNaklF2 then
      begin
        Nakl.DocNaklKOD_OPER.AsInteger := 9962001;
        Nakl.DocNaklGROUP_OPER.AsInteger := 300004101;
        Nakl.DocNaklKOD_OPERChange(DocNaklKOD_OPER);
      end
      else
        Nakl.GrOper_CEButtonClick(Self,0);

    if ((Nakl.OPERSTATUS = 2) and (GetProvStatus = 2)) then

      // Но, Вон наХ..., говорим не сразу, для "на склад комисс.товара ВОЗВРАТ ЧЕРЕЗ (Цпд) (изм. цены)"
      // всетаки разрешаем делать расход из возврата - "покупателю ЧЕРЕЗ + 20% НДС (изм.цены)"
      // проверка на только "покупателю ЧЕРЕЗ + 20% НДС (изм.цены)"
      if not( isVipChPriceReturnNakl or isVipChPriceReturnNaklF2 )then
         raise Exception.Create('Нельзя делать возврат из возврата!');
      Nakl.NotSetOtsr:=true;
      Nakl.NoOtsr:=true;

      Nakl.bSelTT:=not lAutoperenos;
      //Для отгрузок из инвойсов, принудительно проставляю отправителя и получателя
      //согласно исходного документа (вне зависимости от типа документа).
      //Соответственно проверка на счет становиться вторичной...
      //26.01.2006
      //Игнат К.
      if isVipChPriceReturnNakl or isVipChPriceReturnNaklF2  then
      begin
        Nakl.DocNaklDK_FROM.Value := DocNaklDK_TO.value;
        Nakl.DocNaklDK_TO.Value := DocNaklDK_FROM.Value;
      end
      else
      if ((OPERSTATUS = iosInvoiceProf) OR (OPERSTATUS = iosInvoicePrePaid)) then
      begin
        Nakl.DocNaklDK_FROM.Value := DocNaklDK_FROM.Value;
        Nakl.DocNaklDK_TO.Value := DocNaklDK_TO.value;
      end
      else
        if  MainTableName = 'DOC_SCHET' then
        begin
          if Nakl.DocNaklDK_FROM.IsNull then
            Nakl.DocNaklDK_FROM.Value := DocNaklDK_FROM.Value;
          if Nakl.DocNaklDK_TO.IsNull then
          begin
            Nakl.mselDK_TO.KodDK:=DocNaklDK_TO.Value;
            Nakl.mselDK_TO.OutletRecID:=NaklOutletRecid;
            Nakl.mselDK_TO.OutletBaseID:=NaklOutletBaseid;
            Nakl.DocNaklDK_TO.Value := DocNaklDK_TO.Value;
          end;
        end
        else
          begin
            if Nakl.DocNaklDK_FROM.IsNull then
              Nakl.DocNaklDK_FROM.Value := DocNaklDK_TO.Value;
            if ((DocNaklDK_FROM.Value <> DocNaklDK_TO.Value) OR (IntfMegaDBCommon.GetCountry <> iccRussia)) then
              if Nakl.DocNaklDK_TO.IsNull then
                Nakl.DocNaklDK_TO.Value := DocNaklDK_FROM.Value;
          end;

      // В России не работало создание документов адекватно ... внёс коррективы, надо проверить в украине

      if ((Nakl.DocNaklDK_TO.IsNull) AND (IntfMegaDBCommon.GetCountry = iccRussia)) then
        Nakl.DK_FROM_CEButtonClick(Nakl.DK_TO_CE,0);

      Nakl.bSelTT:=true;

      if not (Nakl.DocNakl.state in [dsInsert,dsEdit]) then
        Nakl.DocNakl.Edit;
      Nakl.DocNaklNACENKA_.Value := DocNaklNACENKA_.Value;
      Nakl.DocNaklNOTES.Value := DocNaklNOTES.Value;
      Nakl.DocNaklFORMAOPL_.Value := DocNaklFORMAOPL_.Value;
      //Nakl.DocNaklTRANSPORT.Value := DocNaklTRANSPORT.Value;
      if (Nakl.OPERSTATUS in [iosTrailerBreak,iosTrailerBrak,iosTrailerNotAll])   then
      begin
        Nakl.DocNaklPRICETYPE_.Value := iptSpecial;
      end
      else
        Nakl.DocNaklPRICETYPE_.Value := DocNaklPRICETYPE_.Value;
      if Nakl.DocNakl.State in [dsInsert,dsEdit] then
        Nakl.DocNakl.Post;
  //    ShowMessage('Расход'+IntToStr(DocNaklRecId.AsInteger)+#13#10+'Приход'+Nakl.DocNaklRecId.Asstring);
      if not NoPos then
      begin
      Nakl.CheckPriceForbidden:=true;
      Nakl.ChangeZakSpravForbidden:=true;
        try
          Nakl.PastePosExecute(DocPos);
        finally
          Nakl.CheckPriceForbidden:=false;
          Nakl.ChangeZakSpravForbidden:=false;
        end;
      end;

      if isVipChPriceReturnNakl or isVipChPriceReturnNaklF2 then
      begin
        (**)
        Nakl.UpdateQuery.Close;
        Nakl.UpdateQuery.Params[0].AsInteger := Nakl.DocNaklRECID.Value;
        Nakl.UpdateQuery.Params[1].AsInteger := Nakl.DocNaklBASEID.Value;
        Nakl.UpdateQuery.Params[2].AsInteger := Nakl.DocNaklPRICETYPE_.Value;
        Nakl.UpdateQuery.Params[3].AsInteger := Nakl.DocNaklPRICE_FROM_VALYUTA.Value;
        Nakl.UpdateQuery.Params[4].AsDouble := Nakl.DocNaklKURS.Value;
        Nakl.UpdateQuery.Params[5].AsInteger := 0;
        Nakl.UpdateQuery.ExecQuery;
        Nakl.Refresh_NaklPos;
        (**)
      end;
            
      Nakl.DocNakl.Edit;
      Nakl.DocNaklSTATE.Value := 0;
     // Nakl.DocNaklTRANSPORT.Value := DocNaklTRANSPORT.Value;
      Nakl.DocNaklOTSR.Value := DocNaklOTSR.Value;
      Nakl.DocNakl.Post;
      Nakl.DontCheckRest := True;
      {тут добавил проверку на дату поскольку накладная может быть в закрытом периоде (Дереза Д.)}
      if (DocNaklSTATE.Value<>idsBug)  then
      if (DocNaklOperdate.value>=intfmegadbcommon.GetParam('UNLOCKDATE',intfIbCommon.getserverdate)) then
        begin
          DocNakl.Edit;
          DocNaklSTATE.Value := 2;
          DocNakl.Post;
        end;
      DontCheckRest := True;
      DM.SharedQuery.Close;
      DM.SharedQuery.SQL.Text := 'SELECT ACCOUNT FROM SPRAV_TDOC WHERE DOCTYPE = :DOCTYPE';
      DM.SharedQuery.Params.ByName['DOCTYPE'].Value := DocNaklDOCTYPE.Value;
      DM.SharedQuery.ExecQuery;

      if DM.SharedQuery.Fields[0].AsInteger = 1 then
      begin
        if DocNakl.State in [dsInsert,dsEdit] then DocNakl.Post;
  //      DocNakl.Post;
        DocNakl.Transaction.CommitRetaining;
       Nakl.DocNakl.Post;
       Nakl.DocNakl.Transaction.CommitRetaining;

        DM.ChangeQuery.Close;
        //DM.SharedQuery.Transaction:= DM.trMainWShort;
        DM.ChangeQuery.SQL.Text := 'UPDATE DELIVERY_LOCATION SET '+
        'FORMTYPE=1,' +
        'DOCRECNO='+ Nakl.DocNaklRECID.AsString +
        ' where FORMTYPE=5 and DOCRECNO ='+DocNaklRECID.AsString+ ' and BASEID = ' + DocNaklBASEID.AsString;
        DM.ChangeQuery.ExecQuery;

        if  MainTableName = 'DOC_SCHET' then
        begin
          DM.ChangeQuery.Close;
         { DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
          DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := DocNaklDOC_INHERITED.Value;
          DM.SharedQuery.Params.ByName['RECID'].Value := DocNaklRECID.Value;
          DM.SharedQuery.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;}

          DM.ChangeQuery.SQL.Text := 'EXECUTE PROCEDURE DELETE_PROV_DOC_NEW(:RECID, :BASEID, :DOC_INHERITED,NULL,1);';//'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
          DM.ChangeQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
          DM.ChangeQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
          DM.ChangeQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
          DM.ChangeQuery.ExecQuery;

        end;
        DM.ChangeQuery.Close;
        {DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
        DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
        DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
        DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;}

        DM.ChangeQuery.SQL.Text := 'EXECUTE PROCEDURE DELETE_PROV_DOC_NEW(:RECID, :BASEID, :DOC_INHERITED,NULL,1);';//'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
        DM.ChangeQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
        DM.ChangeQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
        DM.ChangeQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
        DM.ChangeQuery.ExecQuery;

        DM.ChangeQuery.Close;
        DM.ChangeQuery.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
        DM.ChangeQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
        DM.ChangeQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
        DM.ChangeQuery.Params.ByName['BASEID'].Value :=Nakl.DocNaklBASEID.Value;
        DM.ChangeQuery.ExecQuery;

        // Если исходный документ - Инвойс.спецификация, и были сохранены - сохраняю..
//        if (PosModified) AND ((OPERSTATUS = iosInvoiceProf) OR (OPERSTATUS = iosInvoicePrePaid))) then
//        begin
        if DM.ChangeQuery.Transaction.InTransaction then
          DM.ChangeQuery.Transaction.Commit;
        DocNakl.ConfirmDelete := False;
        PosModified := False;
        if  MainTableName = 'DOC_SCHET' then
          DocNakl.Delete;
        DocNakl.Transaction.CommitRetaining;
//        end;
        //Close;
        if Owner is  TDocListForm then TDocListForm(Owner).RefreshListExecute(Self);
      end;
    end;
  // В начале процедуры все изменения были сохранены,
  // но последний из постов таки переключил переменную-флажок в TRUE
  // избавляюсь от этого принудительно
  PosModified := False;
end;

procedure TDocNaklForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if    (Key = Ord('D'))
    and (ssCtrl in Shift)
    and (ssAlt in Shift)
    and (ssShift in Shift)
  then  // условие для возможности редактирования отчёта
  begin
    FDesignReport:= True;
  end;
end;

procedure TDocNaklForm.FormShow(Sender: TObject);
begin
//  Self.windowState := wsMaximized;
end;

procedure TDocNaklForm.DBGridEH1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Column.Index=0) and (DocPosCOL1.AsInteger=1) then begin
   if  gdFocused in State then
   begin
     Background:=clWhite;
     AFont.Color:=clBlack;
   end  else
     Background:=$00EBEACF;
  end;

  if ShowIndColor and (DocPosInd.AsInteger=1) then
    Background:=clYellow;

  if (Column.Index=0) and (DocPosIS_SERTIF.asInteger>DocPosMAT_DOC.AsInteger) then
  begin
   if  gdFocused in State then
   begin
     Background:=clWhite;
     AFont.Color:=clBlack;
   end
   else
     Background:=$008A8DFF;
  end;

  if IntfMegaDBCommon.GetCountry=iccRussia then
  begin
    if (Column.Index=0) and (DocPosKOD_DK.AsFloat=0)
                        and (DocPosDATE_ROZLIVA.AsDateTime = 0)
                        and (DocPosInvoce_Number.AsString = '')
    then
    begin
     if  gdFocused in State then
     begin
       Background:=clWhite;
       AFont.Color:=clBlack;
     end
     else
       Background:=clRed;
    end;
     DBGridEH1.Columns[28].Visible:=True;
  end;

  // подсвечиваю если не совпадает с выбранной колонкой
  if btnCheckWithCol.checked and (not DocPosCOL_CHECK_WITH.asBoolean)then
    Background := $008A8DFF;

  if DBGridEH1.DataSource.DataSet.FieldByName('CHECKED').AsInteger = 1 then
    AFont.Style := AFont.Style + [fsBold] else
  if DBGridEH1.DataSource.DataSet.FieldByName('CHECKED').asInteger = 2 then
  begin
    AFont.Style := AFont.Style + [fsBold];
//    AFont.Color := clWhite;
//    Background := clGray;
    Background := clSilver;
  end;


end;

procedure TDocNaklForm.actShowLinkedDocsExecute(Sender: TObject);
begin
  ShowLinkedDocs(DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger, idvNakl);
end;

procedure TDocNaklForm.areg_restExecute(Sender: TObject);
var
s1,s2,s3,s4:string;
begin
  if InputQuery('Введите код базы', 'код базы %', s1) then
  begin
    Query.Transaction.Active:=true;
    Query.Close;
    Query.SQL.Text:='select SH_SKLAD from sys_workbases where baseid='+s1;
    Query.ExecQuery;
    s2:=Query.Fields[0].AsString;

    s3:=DateToStr(DocNaklOPERDATE.AsDateTime);
    s4:=IntToStr(DocNaklRECID.AsInteger);
    Query.Close;
    Query.SQL.Text:='INSERT INTO DOC_NAKL_POS (DOCRECNO, KOD_MATER, KOLICH, STATE) '
    +' select '+s4+', rr.kod_mater, myround(rr.kolich,0.01)-myround(rr1.kolich,0.01), 100 from reg_rests rr '
    +' full join reg_rests rr1 on (rr.kod_mater=rr1.kod_mater and rr1.baseid='+s1+' and rr1.schet='+#39+s2+#39+' and rr1.enddate='+#39+s3+#39+') '
    +' where myround(rr.kolich,0.01)-myround(rr1.kolich,0.01)<>0 and '
    +' rr.baseid=1 and (rr.kolich<>rr1.kolich or rr.kolich is null or rr1.kolich is null) '
    +' and rr.schet='+#39+s2+#39+' and rr.enddate='+#39+s3+#39;
    Query.ExecQuery;
    Query.Transaction.CommitRetaining;
  end;
end;

procedure TDocNaklForm.UpdateActions;
begin
  inherited;
  FillRests.Enabled:= not cbOpl.Checked;
end;

procedure TDocNaklForm.UpdateDK_C_Controls;
var
  lDKCAllowEdit: boolean;
begin
  lDKCAllowEdit:= not ((OPERSTATUS = iosRealizationF1) or (OPERSTATUS = iosRealizationF2) or (OPERSTATUS = iosPrePay));

  DK_C_ED.Properties.ReadOnly:= not lDKCAllowEdit;
  if DK_C_ED.Properties.ReadOnly then
  begin
    DK_C_ED.Hint:= '|Редактирование запрещено. Торговый агент автоматически выбирается из справочника районов';
  end
  else begin
    DK_C_ED.Hint:= '';
  end;

  DK_C_NAME_CE.Properties.ReadOnly:= not IntfMegaAccessManager.IsSystemAccess;

  if DK_C_NAME_CE.Properties.ReadOnly then
  begin
    DK_C_NAME_CE.Hint:= '|Редактирование запрещено. Торговый агент автоматически выбирается из справочника районов';
  end
  else begin
    DK_C_ED.Hint:= '';
  end;

end;

procedure TDocNaklForm.SetDK_C(aDialog: TMegaSelDKDialog);
const
{  sQueryText =
' select  '#13#10  +
'   ta.kod_dk kod_dk, '#13#10  +
'   sdk.shortname_dk shortname_dk  '#13#10  +
' from sprav_dk_address sda  '#13#10  +
' inner join sprav_trade_outlet sto on ( sto.addr_recid = sda.recid and sto.addr_baseid = sda.baseid )  '#13#10  +
' inner join route2 r on (r.activ = 1 and r.outlet_recid = sto.recid and r.outlet_baseid = sto.baseid )  '#13#10  +
' inner join ta_area ta on (ta.area_id = r.area_id and ta.area_baseid = r.area_baseid)  '#13#10  +
' inner join sprav_dk sdk on (sdk.kod_dk = ta.kod_dk ) '#13#10  +
' where  '#13#10  +
'     sda.Recid = :RecID  '#13#10  +
' and sda.BaseID = :BaseID  '#13#10  +
' and ta_area.activ = 1 '#13#10  +
' order by r.datefrom desc '#13#10+
    '';
 }

// Изменение от 24.07.2003 Бехтеренко Ю.
// Новая схема с ТТ.
// 2008-12-27 Филимонов - МегаНовая схема дистрибуции
  sQueryText =
      ' SELECT dga.kod_dk kod_dk, dga.shortname_dk shortname_dk '+
      '  from distr_select_tt_distr_info(:date, null, null, null, null, null, :OUTLET_RECID, :OUTLET_BASEID, :BRAND_CASE_ID,null,null,null,null,null,null,null,null,null,1,0,null,1,null,1) dst '+
      ' left join distr_get_area_agent_info(dst.area_id,dst.area_baseid,:date) dga on (1=1) ';
var
  q: TMegaQuery;
begin
  if Panel9.Visible then
  begin
    q:= TMegaQuery.Create(Self);
    try
      q.DataBase:= dm.Money;
      q.Transaction:= dm.Transaction;
      q.SQL.Text:= sQueryText;

      q.Params.ByName['OUTLET_RECID'].Asinteger:= aDialog.OutletRecID;
      q.Params.ByName['OUTLET_BASEID'].Asinteger:= aDialog.OutletBaseID;
      if IntfMegaDBCommon.GetParam('WORK_BRAND_CASE_ON', '0') = '1' then
         q.Params.ByName['BRAND_CASE_ID'].Asinteger:= aDialog.BrandCaseId
      else
         q.Params.ByName['BRAND_CASE_ID'].AsVariant:= null;
      q.Params.ByName['DATE'].AsDateTime:= IntfIBCommon.GetServerDate;

      q.ExecQuery;

      if not ( q.EOF and q.BOF ) then
      begin

        if (Source.DataSet.State <> dsEdit)
        or (Source.DataSet.State <> dsInsert) then
        begin
          Source.DataSet.Edit;
        end;

        DocNaklDK_C.AsFloat:= q.FieldByName('KOD_DK').AsDouble;
        // DocNaklDK_C_NAME.AsString:= q.FieldByName('SHORTNAME_DK').AsString;

      end

      else
        if (((IntfMegaDBCommon.GetCountry = iccRussia) OR (IntfMegaDBCommon.GetCountry = kodRUS))
            AND (DocNakl.FieldByName('BALANCE_KOD').AsInteger <> ibcMPRus)
            AND ((DocNakl.FieldByName('DK_TO').AsFloat = 999) OR (DocNakl.FieldByName('DK_TO').AsFloat = 9999))
            ) then
        begin
//        ShowMessage(
//          'Клиенту не сопоставлен торговый агент'#13#10+
//          '  (Операцию можно произвести через "Дистрибуция/Состав района" в Money)'#13#10+
//          'или ЦФО Клиента не соответствует вашей базе '
//         );
        // Source.DataSet.FieldByName('DK_TO').AsVariant:=null;
          Source.DataSet.Cancel;
          raise exception.Create('Клиенту не сопоставлен торговый агент'#13#10+
            '  (Операцию можно произвести через "Дистрибуция/Состав района" в Money)'#13#10+
            'или ЦФО Клиента не соответствует вашей базе ')
        end;
    finally
      q.Free;
    end;
  end;
end;

procedure TDocNaklForm.pmPrintPopup(Sender: TObject);
begin
  if Panel9.Visible
  and (DocNaklDK_C.IsNull) then
  begin
    Raise Exception.Create(
      'Печать невозможна'#13+
      'Клиенту не присвоен торговый агент'#13+
      'Присвоить необходимо через справочник районов в MoneyR'#13+
      ''
    );
  end;
  //Печать накладной(Не ЛВИ) с примечанием
  N105.Visible:= printNaklIf_different_Addr or
                            (DocNaklADDR_FROM.Value=DocNaklADDR_TO.Value);
  //Печать накладной(Не ЛВИ) без примечания
  N95.Visible:= N105.Visible;
end;

procedure TDocNaklForm.pnlTRANSPORT_TIMEClick(Sender: TObject);
begin

end;

(* Рефакторинг процедуры 27.02.2006г. задачу поставил Хоренко
procedure TDocNaklForm.SetRules;
begin
    case OPERSTATUS of
      iosReturnToProvider:  //Возврат поставщику
        begin
          LOCKPRICE:=ilptLockPriceNot;
          FORCEPRICE:=true;
          AllowPrice:=[0,iptZak1,iptZakP];
          DefaultPrice:=iptZak1;
          ClientDK:=DocNaklDK_TO.AsFloat;
          if DocNaklDK_TO_BASEID.AsVariant=NULL then
          ClientDKBaseId:=-1 else ClientDKBaseId:=DocNaklDK_TO_BASEID.AsInteger;

          if (DocNaklDK_TO.AsFloat=DM.DKTDM)
          or ((Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL) and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger=0))
          or (DocNaklDK_TO.AsFloat=DM.DKPP) or (DocNaklDK_TO.AsFloat=14)
          or (DocNaklDK_TO.AsFloat=999) or (DocNaklDK_TO.AsFloat=1017) then
          begin
            LOCKPRICE:=ilptLockPriceNot;
            FORCEPRICE:=false;
            AllowPrice:=[0];
            DefaultPrice:=0;
          end;
          If DocNaklDK_TO.AsFloat=14 then
          begin
            LOCKPRICE:=ilptLockPricePlus;//ilptLockPriceColKop;
            FORCEPRICE:=true;
            AllowPrice:=[5,6];
            DefaultPrice:=6;
            ClientDK:=DocNaklDK_TO.AsFloat;
          end
        end;
      iosReturnFromClient:  //Возврат от покупателя
        begin
          LOCKPRICE:=ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_FROM.AsFloat;

          if (DocNaklDK_TO.AsFloat=DM.DKTDM)
          or ((Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL) and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger=0))
          or (DocNaklDK_TO.AsFloat=DM.DKPP) or (DocNaklDK_TO.AsFloat=14)
          or (DocNaklDK_TO.AsFloat=999) or (DocNaklDK_TO.AsFloat=1017) then
          begin
            LOCKPRICE:=ilptLockPriceNot;
            FORCEPRICE:=false;
            AllowPrice:=[0];
            DefaultPrice:=0;
          end;
        end;
      iosTrailerBreak:  //перевозчику товар в БОЙ
        begin
          LOCKPRICE:=ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_FROM.AsFloat;
        end;
      iosTrailerBrak:  //перевозчику БРАК товара
        begin
          LOCKPRICE:=ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_FROM.AsFloat;
        end;
      iosTrailerNotAll:  //перевозчику НЕДОСТАЧА
        begin
          LOCKPRICE:=ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_FROM.AsFloat;
        end;
      iosBreakToDostavka:  //19-бой при доставке
        begin
          LOCKPRICE:=ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_FROM.AsFloat;
        end;
      iosBreakToSkald:  //18-бой на складе
        begin
          LOCKPRICE:=ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_FROM.AsFloat;
        end;
      iosRealizationF1,iosPrePay:  //Реализация Ф1 или со Скидкой при допсоглашении "Работа по предоплате"
        begin
          LOCKPRICE:=ilptLockPriceCol;//ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial,iptSpecialP];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_TO.AsFloat;
          if (DocNaklDK_TO.AsFloat=DM.DKTDM)
          or ((Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL) and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger=0) AND (DocNaklDK_TO.AsFloat<>999))
          or (DocNaklDK_TO.AsFloat=DM.DKPP) or (DocNaklDK_TO.AsFloat=14)
          {or (DocNaklDK_TO.AsFloat=999)} or (DocNaklDK_TO.AsFloat=1017) then
          begin
            LOCKPRICE:=ilptLockPriceNot;
            FORCEPRICE:=false;
            AllowPrice:=[0];
            DefaultPrice:=0;
          end;
        end;
      iosRealizationF2:  //Реализация Ф2
        begin
          LOCKPRICE:=ilptLockPriceCol;//ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial,iptSpecialP];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_TO.AsFloat;

          if (DocNaklDK_TO.AsFloat=DM.DKTDM)
          or ((Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL) and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger=0) AND (DocNaklDK_TO.AsFloat<>999))
          or (DocNaklDK_TO.AsFloat=DM.DKPP) or (DocNaklDK_TO.AsFloat=14)
          {or (DocNaklDK_TO.AsFloat=999)} or (DocNaklDK_TO.AsFloat=1017) then
          begin
            LOCKPRICE:=ilptLockPriceNot;
            FORCEPRICE:=false;
            AllowPrice:=[0];
            DefaultPrice:=0;
          end;
        end;
      iosBrends:  //Реализация рекламных материалов
        begin
          LOCKPRICE:=ilptLockPriceCol;//ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial2];
          DefaultPrice:=iptSpecial2;
          ClientDK:=DocNaklDK_TO.AsFloat;
          if (DocNaklDK_TO.AsFloat=DM.DKTDM)
          or ((Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL) and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger=0) AND (DocNaklDK_TO.AsFloat<>999))
          or (DocNaklDK_TO.AsFloat=DM.DKPP) or (DocNaklDK_TO.AsFloat=14)
          {or (DocNaklDK_TO.AsFloat=999)} or (DocNaklDK_TO.AsFloat=1017) then
          begin
            LOCKPRICE:=ilptLockPriceNot;
            FORCEPRICE:=false;
            AllowPrice:=[0];
            DefaultPrice:=0;
          end;
        end;
      iosInternalMove:  //Внутреннее перемещение
        begin
          LOCKPRICE:=ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial,iptSpecialP];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_TO.AsFloat;

          if (DocNaklDK_TO.AsFloat=DM.DKTDM)
          or ((Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL) and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger=0))
          or (DocNaklDK_TO.AsFloat=DM.DKPP) or (DocNaklDK_TO.AsFloat=14)
          or (DocNaklDK_TO.AsFloat=999) or (DocNaklDK_TO.AsFloat=1017) then
          begin
            LOCKPRICE:=ilptLockPriceNot;
            FORCEPRICE:=false;
            AllowPrice:=[0];
            DefaultPrice:=0;
          end;
        end;
      iosIncomeFromProvider:  //Приход от поставщика
        begin
          LOCKPRICE:=ilptLockPriceKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptZak1,iptZakP];
          DefaultPrice:=iptZak1;
          ClientDK:=DocNaklDK_FROM.AsFloat;
        end;
      iosIncomeFromRoad:  //Приход из пути
        begin
          LOCKPRICE:=ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_FROM.AsFloat;
          if (DocNaklDK_TO.AsFloat=DM.DKTDM)
          or ((Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL) and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger=0))
          or (DocNaklDK_TO.AsFloat=DM.DKPP) or (DocNaklDK_TO.AsFloat=14)
          or (DocNaklDK_TO.AsFloat=999) or (DocNaklDK_TO.AsFloat=1017) then
          begin
            LOCKPRICE:=ilptLockPriceNot;
            FORCEPRICE:=false;
            AllowPrice:=[0];
            DefaultPrice:=0;
          end;
        end;
      iosOutcomeToRoad:  //Уход в путь
        begin
          LOCKPRICE:=ilptLockPriceKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_TO.AsFloat;
          if (DocNaklDK_TO.AsFloat=DM.DKTDM)
          or ((Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL) and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger=0))
          or (DocNaklDK_TO.AsFloat=DM.DKPP) or (DocNaklDK_TO.AsFloat=14)
          or (DocNaklDK_TO.AsFloat=999) or (DocNaklDK_TO.AsFloat=1017) then
          begin
            LOCKPRICE:=ilptLockPriceNot;
            FORCEPRICE:=false;
            AllowPrice:=[0];
            DefaultPrice:=0;
          end;
        end;
     else
       begin
          LOCKPRICE:=ilptLockPriceColKop;
          FORCEPRICE:=true;
          AllowPrice:=[iptSpecial,iptSpecialP];
          DefaultPrice:=iptSpecial;
          ClientDK:=DocNaklDK_TO.AsFloat;
          if (DocNaklDK_TO.AsFloat=DM.DKTDM)
          or ((Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL) and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger=0))
          or (DocNaklDK_TO.AsFloat=DM.DKPP) or (DocNaklDK_TO.AsFloat=14)
          or (DocNaklDK_TO.AsFloat=999) or (DocNaklDK_TO.AsFloat=1017) then
          begin
            LOCKPRICE:=ilptLockPriceNot;
            FORCEPRICE:=false;
            AllowPrice:=[0];
            DefaultPrice:=0;
          end;
       end;
   end;
  if IntfMegaDBCommon.IsOffice then
  begin
            LOCKPRICE:=ilptLockPriceNot;
            FORCEPRICE:=false;
            AllowPrice:=[0];
            DefaultPrice:=0;
  end;
 end;
*)

procedure TDocNaklForm.SetRules;

  //  Измененная процедура (27.02.2006г.) задачу поставил Хоренко
  //  убрал отмену контроля цены для БОЯ и КОНЕЧНОГО ПОТРЕБИТЕЛЯ
  procedure ChechDK_TO;
  begin
    if (DocNaklDK_TO.AsFloat=DM.DKTDM)
     or (
      (Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL)
       and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger=0)
       AND (DocNaklDK_TO.AsFloat<>999{Конечный потребитель})
       AND (DocNaklDK_TO.AsFloat<>1017{Бой})
       )
     or (DocNaklDK_TO.AsFloat=DM.DKPP) or (DocNaklDK_TO.AsFloat=14)
     or (DocNaklDK_TO.AsFloat=IntfMegaCommon.GetBalanceDK(
    DocNaklOPERDATE.AsDateTime,
    DocNaklDOCTYPE.AsString,
    DocNaklCfo.asInteger))
    then
    begin
      LOCKPRICE:=ilptLockPriceNot;
      FORCEPRICE:=false;
      AllowPrice:=[0];
      DefaultPrice:=0;
    end;
  end;

begin
  case OPERSTATUS of
    iosReturnToProvider,iosOutcomeToOtv:  //Возврат поставщику
      begin
        LOCKPRICE:=ilptLockPriceNot;
        FORCEPRICE:=true;
        AllowPrice:=[0,iptZak1,iptZakP];
        DefaultPrice:=iptZak1;
        ClientDK:=DocNaklDK_TO.AsFloat;
        if DocNaklDK_TO_BASEID.AsVariant=NULL then
        ClientDKBaseId:=-1 else ClientDKBaseId:=DocNaklDK_TO_BASEID.AsInteger;
        ChechDK_TO;
        If DocNaklDK_TO.AsFloat=14 then
        begin
          LOCKPRICE:=ilptLockPricePlus;
          FORCEPRICE:=true;
          AllowPrice:=[5,6];
          DefaultPrice:=6;
          ClientDK:=DocNaklDK_TO.AsFloat;
        end
      end;
    iosReturnFromClient,iosReturnFromKomis:  //Возврат от покупателя
      begin
        LOCKPRICE:=ilptLockPriceColKop;
        FORCEPRICE:=true;
        AllowPrice:=[iptSpecial];
        DefaultPrice:=iptSpecial;
        ClientDK:=DocNaklDK_FROM.AsFloat;
        ChechDK_TO;
      end;
     iosTrailerBreak,     //перевозчику товар в БОЙ
     iosTrailerBrak,     //перевозчику БРАК товара
     iosTrailerNotAll,   //перевозчику НЕДОСТАЧА
     iosBreakToDostavka, //19-бой при доставке
     iosBreakToSkald:    //18-бой на складе
      begin
        LOCKPRICE:=ilptLockPriceColKop;
        FORCEPRICE:=true;
        AllowPrice:=[iptSpecial];
        DefaultPrice:=iptSpecial;
        if ((OPERSTATUS=iosBreakToDostavka) and (IntfMegaDBCommon.GetCountry=iccRussia)) then
           ClientDK:=DocNaklDK_FROM.AsFloat
        else
           ClientDK:=DocNaklDK_TO.AsFloat;//DocNaklDK_FROM.AsFloat;
      end;
     iosBreakManufact:
     begin
        LOCKPRICE:=ilptLockPriceColKop;
        FORCEPRICE:=true;
        AllowPrice:=[iptZak1];
        DefaultPrice:=iptZak1;
        ClientDK:=DocNaklDK_C.AsFloat;

      end;

     iosRealizationF1,iosPrePay,iosIndikativ:  //Реализация Ф1 или со Скидкой при допсоглашении "Работа по предоплате"
      begin
        LOCKPRICE:=ilptLockPriceCol;
        FORCEPRICE:=true;
        AllowPrice:=[iptSpecial,iptSpecialP];
        DefaultPrice:=iptSpecial;
        ClientDK:=DocNaklDK_TO.AsFloat;
        ChechDK_TO;
        if (DocNaklDK_TO.AsFloat=DM.DKTDM)
        or ((Source.DataSet.FieldByName('DK_TO_BASEID').AsVariant<>NULL) and (Source.DataSet.FieldByName('DK_TO_BASEID').AsInteger=0) AND (DocNaklDK_TO.AsFloat<>999))
        or (DocNaklDK_TO.AsFloat=DM.DKPP) or (DocNaklDK_TO.AsFloat=14) or (DocNaklDK_TO.AsFloat=42735405)
        or (DocNaklDK_TO.AsFloat=40235755) // для ВДГ //add new nirs 08_07_2025
        {or (DocNaklDK_TO.AsFloat=999)} or (DocNaklDK_TO.AsFloat=1017) then
        begin
          LOCKPRICE:=ilptLockPriceNot;
          FORCEPRICE:=false;
          AllowPrice:=[0];
          DefaultPrice:=0;
        end;
      end;
    iosRealizationF2:  //Реализация Ф2
      begin
        LOCKPRICE:=ilptLockPriceCol;//ilptLockPriceColKop;
        FORCEPRICE:=true;
        AllowPrice:=[iptSpecial,iptSpecialP];
        DefaultPrice:=iptSpecial;
        ClientDK:=DocNaklDK_TO.AsFloat;
        ChechDK_TO;
      end;
    iosBrends:  //Реализация рекламных материалов
      begin
        LOCKPRICE:=ilptLockPriceCol;//ilptLockPriceColKop;
        FORCEPRICE:=true;
        AllowPrice:=[iptSpecial2];
        DefaultPrice:=iptSpecial2;
        ClientDK:=DocNaklDK_TO.AsFloat;
        ChechDK_TO;
      end;
    iosInternalMove:  //Внутреннее перемещение
      begin
        LOCKPRICE:=ilptLockPriceColKop;
        FORCEPRICE:=true;
        AllowPrice:=[iptSpecial,iptSpecialP];
        DefaultPrice:=iptSpecial;
        ClientDK:=DocNaklDK_TO.AsFloat;
        ChechDK_TO;
      end;
    iosIncomeFromProvider:  //Приход от поставщика
      begin
        LOCKPRICE:=ilptLockPriceKop;
        FORCEPRICE:=true;
        AllowPrice:=[iptZak1,iptZakP];
        DefaultPrice:=iptZak1;
        ClientDK:=DocNaklDK_FROM.AsFloat;
      end;
    iosIncomeFromRoad,iosImportIncomeFromRoad:  //Приход из пути
      begin
        LOCKPRICE:=ilptLockPriceColKop;
        FORCEPRICE:=true;
        AllowPrice:=[iptSpecial];
        DefaultPrice:=iptSpecial;
        ClientDK:=DocNaklDK_FROM.AsFloat;
        ChechDK_TO;
      end;
    iosOutcomeToRoad:  //Уход в путь
      begin
        LOCKPRICE:=ilptLockPriceKop;
        FORCEPRICE:=true;
        AllowPrice:=[iptSpecial];
        DefaultPrice:=iptSpecial;
        ClientDK:=DocNaklDK_TO.AsFloat;
        ChechDK_TO;
      end;
    iosMaterWithDiscount:
      begin
        LOCKPRICE:=ilptLockPriceKop;
        FORCEPRICE:=true;
        AllowPrice:=[iptDiscount];
        DefaultPrice:=iptDiscount;
      end;
    iosMaterWithDiscReal:
      begin
        LOCKPRICE:=ilptLockPriceKop;
        FORCEPRICE:=true;
        AllowPrice:=[iptDiscount];
        DefaultPrice:=iptDiscount;
      end;

    else begin
      LOCKPRICE:=ilptLockPriceColKop;
      FORCEPRICE:=true;
      AllowPrice:=[iptSpecial,iptSpecialP];
      DefaultPrice:=iptSpecial;
      ClientDK:=DocNaklDK_TO.AsFloat;
      ChechDK_TO;
    end;
  end; {case}
  if IntfMegaDBCommon.IsOffice then
  begin
    LOCKPRICE:=ilptLockPriceNot;
    FORCEPRICE:=false;
    AllowPrice:=[0];
    DefaultPrice:=0;
  end;
  // показываем галочку только для экспорта (инвойс на предоплату УСД)
  cbPallete.Visible := (IntfMegaDBCommon.GetParam('WORK_VED', '0')='1')
//  ((DocNaklBASEID.AsInteger=215)or
//                         (IntfMegaDBCommon.GetBaseID=215))
    and (DocNaklDK_TO_COUNTRY.AsInteger <> iccRussia)
    and (DocNaklDK_TO_COUNTRY.AsInteger  <> kodRUS)
    and (DocNaklDK_TO_COUNTRY.AsInteger <> iccUkraine)
    and (DocNaklDK_TO_COUNTRY.AsInteger <> kodUKR)
    and (OPERSTATUS in [iosSpecification,iosInvoiceProf,iosInvoicePrePaid,iosInvoiceForPay]);
//  and (DocNaklKOD_OPER.AsInteger = 999992)
//  and (DocNaklGROUP_OPER.AsInteger = 77024000);
  pmPrint_i_Docs.Enabled:=OPERSTATUS in [iosSpecification,iosInvoiceProf,iosInvoicePrePaid,iosInvoiceForPay];
end;

function TDocNaklForm.CheckPrice:boolean;
var
 dd,ddi,kop, nac :double;

begin

  nac:=0;

{ ----------------- Added by Lion in 08.01.2009 ---------------- }
{  Не проверять цены в ценовой колонке для таких вот документов  }
  if OPERSTATUS in [iosReturnFromClient,   //Возврат от покупателя
                    //iosIncomeFromProvider, //Приход от поставщика
                    iosIncomeFromRoad,     //Приход из пути
                    iosImportIncomeFromRoad,     //импорт Приход из пути
                    iosBreakToDostavka,    //бой при доставке
                    iosBreakToSkald        //бой на складе
                   ]
  then
  begin
    Result:=true;
    exit;
  end;

  if  ((DocNaklBALANCE_KOD.asInteger = 11) and (OPERSTATUS=iosFinal))
  then
  begin
    Result:=true;
    exit;
  end;
{ ----------- End of addition by Lion in 08.01.2009 ----------- }


  if (OPERSTATUS=iosNoCheckPrice) then
  begin
    Result:=true;
    exit;
  end;

  if (IntfMegaAccessManager.GetUserRole='FIN_DIRECTOR_RUS')
   and (IntfMegaDBCommon.GetCountry=iccRussia)
  then begin
    Result:=true;
    exit;
  end;

   if  (LOCKPRICE=ilptLockPricePlus) and
    (DocPosKOLICH.AsFloat<0) then
  begin
    Result:=true;
    exit;
  end;

  if  (LOCKPRICE=ilptLockPriceMinus) and
    (DocPosKOLICH.AsFloat>0) then
  begin
    Result:=true;
    exit;
  end;
 //закоментировал. менялась цена на сандоре (17.06.2006)
//  if (DocPosSource.DataSet.FieldByName('PRICE_KOL').AsInteger<>0) and
//   (DocNaklPRICETYPE_.AsInteger in [iptSpecial,iptSpecialP])
//  then
//  begin
//    Result:=true;
//    exit;
//  end;

  if ((DocNaklDK_TO.AsFloat=999) or (DocNaklDK_TO.AsFloat=9999)) then nac:=1000;
  if (IntfMegaDBCommon.IsOffice and (DocPosTVID_KOD.AsInteger<>iTvidKodAccessoriesLVI)) then
  begin
    Result:=true;
    exit;
  end;
  if (IntfMegaAccessManager.GetUserRole='CORRECTOR') or (IntfMegaAccessManager.GetUserRole='BUHGALTER_CO') then
  begin
    Result:=true;
    exit;
  end;

  Result:=false;
  kop:=0.01;
 if CheckPriceForbidden then
 begin
   Result:=true;
   exit;
 end;
  if  LOCKPRICE=ilptLockPriceNot then
  begin
    if(DocPosTVID_KOD.AsInteger<>iTvidKodAccessoriesLVI)
    then begin
      Result:=true;
      exit;
    end;
  end;
  if  LOCKPRICE=ilptLockPrice then
  begin
    kop:=0.0001;
  end;
  if  LOCKPRICE=ilptLockPriceCol then
  begin
    kop:=0.0001;
    if  (DocPos.FieldByName('COL1').AsInteger <> 1) or (DocPos.FieldByName('ACTIVE_').AsInteger = -1) then
    begin
       Result:=true;
       exit;
    end;
  end;
  if  LOCKPRICE=ilptLockPriceColKop then
  begin
    kop:=0.01;
    if  DocPos.FieldByName('COL1').AsInteger <> 1 then
    begin
       Result:=true;
       exit;
    end;
  end;
  if (OPERSTATUS=iosReturnToProvider) then kop:=1;
  Query.Close;
  Query.SQL.Text :='SELECT first 1 coalesce(so.NOT_CONTROL_PRICE,0)   FROM SPRAV_OPER so where so.GROUP_OPER='+IntToStr(DocNaklGROUP_OPER.Value)+' and so.KOD_OPER='+IntToStr(DocNaklKOD_OPER.Value)+';';
  Query.ExecQuery;
  if Query.Fields[0].AsInteger<>1 then
    begin
      Query.Close;
      if (((IntfMegaDBCommon.GetCountry = iccRussia) OR (IntfMegaDBCommon.GetCountry = kodRUS)) AND (not intfMegaDBCommon.IsOffice)) then
        Query.SQL.Text :=
        'SELECT * FROM PROC_GET_MATER_PRICE_DK_OUTLET(' + DocPosKOD_MATER.AsString + ', ''' +
        DateToStr(DocNaklOPERDATE.Value) + ''',  ' +
        DocNaklBALANCE_KOD.AsString + ', ''' + Schet + ''', ' +
        DocNaklPRICETYPE_.AsString + ', ' + InVal.dataBinding.Field.AsString + ', '+
        FloatToStr(ClientDK) + ','+DocNaklCFO.asstring +', ' + IntToStr(NaklOutletRecid) + ', ' + IntToStr(NaklOutletBaseid)
   { ---------------- Added by Lion in 24.12.2008 --------------- }
   {           Накладную нужно создавать по ценам региона           }
//        + liUtils.iif(Trim(DocNaklADDR_TO.asstring) = '', '', ', ' + DocNaklADDR_TO.asstring)
        + liUtils.iif((Trim(DocNaklADDR_TO.asstring) = '') or (DocNaklCFO.asInteger = DocNaklADDR_TO.AsInteger), ' ,null ', ', ' + DocNaklADDR_TO.asstring)
   { ----------- End of changing by Lion in 24.12.2008 ----------- }
        + ', ' + FloatToStrEx(DocPosFIXED_PRICE.AsFloat) +')'
      else
        Query.SQL.Text :=
        'SELECT * FROM C_GET_MATER_PRICE_TO_DK(' + DocPosKOD_MATER.AsString + ', ''' +
        DateToStr(DocNaklOPERDATE.Value) + ''',  ' +
        DocNaklBALANCE_KOD.AsString + ', ''' + Schet + ''', ' +
        DocNaklPRICETYPE_.AsString + ', ' + InVal.dataBinding.Field.AsString + ', '+
        FloatToStr(ClientDK) + ','+DocNaklCFO.asstring
   { ---------------- Added by Lion in 24.12.2008 --------------- }
   {           Накладную нужно создавать по ценам региона - в Украине не нужно           }
   //      + liUtils.iif(Trim(DocNaklADDR_TO.asstring) = '', '', ', ' + DocNaklADDR_TO.asstring)
   { ----------- End of changing by Lion in 24.12.2008 ----------- }
        + ')';
        Query.ExecQuery;
      if InVal.dataBinding.Field.AsInteger = DocNaklV.AsInteger then
       begin
         dd := Query.FieldByName('PRICE').AsDouble * DocNaklKURS.AsFloat;
       end else
        begin
          dd := Query.FieldByName('PRICE').AsDouble;
        end;
      dd := dd * (1 + DocNaklNACENKA_.Value/100);
      ddi := Query.FieldByName('OLD_PRICE').AsDouble;
      if DocNaklNDSINSUMMA.Value = 0 then
        begin
          ddi := ddi * (1+DocPosPDVGROUP_STAVKA.AsFloat/100);
          dd :=dd * (1+DocPosPDVGROUP_STAVKA.AsFloat/100);
        end;
      Result:=true;
      if (DocPosPRICEWPDV.Value>(dd+kop+nac)) or (DocPosPRICEWPDV.Value<(dd-kop)) then Result:=false;
      If   (((Query.FieldIndex['IND_'] >= 0) and  (Query.FieldByName('IND_').AsInteger<>0))
         or ((Query.FieldIndex['IND1'] >= 0) and  (Query.FieldByName('IND1').AsDouble<>0))) //для ПЛВЗ пропускаем
         and  (DocPosKolich.Value <> 0)  or (DocPosIND.AsInteger=1) then
        begin
          if (DocPosIND_SUMMA.Value / DocPosKolich.Value>(ddi+kop+nac)) or (DocPosIND_SUMMA.Value / DocPosKolich.Value<(ddi-kop))
           then Result:=false
             else Result:=true;
        end;
    end
      else
        begin
          dd:=0;
          ddi:=0;
          Result:=true;
          if DocNaklDK_FROM.AsFloat=IntfMegaCommon.GetBalanceDK(
    Source.Dataset.FieldByName('OPERDATE').AsDateTime,
    Source.Dataset.FieldByName('DOCTYPE').AsString,
    StrToIntDef(MegaSelCFO.Value, -1)) then
                if (DocPosPRICEWPDV.Value>(dd+kop+nac)) or (DocPosPRICEWPDV.Value<(dd-kop)) then Result:=false;
        end;

  //возможность добавлять товар с ценой меньше закупочной на ЛВЗ
  if (DocPosPRICEWPDV.Value<>dd) and (((IntfMegaDBCommon.GetBaseID in [60, 215]) or (IntfMegaDBCommon.GetParam('WORK_VED', '0')='1')) or
                                     (((IntfMegaAccessManager.GetUserRole='BUHGALTER_SUPPLIER') or (IntfMegaAccessManager.GetUserRole='BUHGALTER_ON_SUPPLIER') or (IntfMegaAccessManager.GetUserRole='BUHGALTER_ON_ASSETS') or (IntfMegaAccessManager.GetUserRole='CORRECTOR'))
                                          and (IntfMegaDBCommon.GetCountry=iccRussia) and (OPERSTATUS=iosIncomeFromProvider))) then
  begin
    Query.Close;
    Query.SQL.Text :=
      'select gm.tvid_kod from sprav_mater sm '+
      ' left join group_mater gm on (gm.group_mater=sm.group_mater) '+
      ' where sm.kod_mater= :KOD_MATER ';
    Query.Params.ByName['KOD_MATER'].value:=DocPosKOD_MATER.Value;
    Query.ExecQuery;
    if (Query.Fields[0].asinteger <> iTvidKodAlco) then
    begin
       //DocPosIND.asinteger:=0;
       DocPosIND_SUMMA.Value:= DocPosSUMMAWPDV.Value;
       result:=true;
    end;
  end;

  ddi:=kop/2;
end;

procedure TDocNaklForm.CheckParentDoc;
const
  sQueryGetParentDoc =
    ' select '+
    '   PARENT_RECID, '+
    '   PARENT_BASEID, '+
    '   OPL_RECID, '+
    '   OPL_BASEID, '+
    '   OPL_FORM_TYPE, '+
    '   dn.operdate as OperDate, '+
    '   dn.doctype as DOCTYPE, '+
    '   dn.docnumber as DOCNUM '+
    ' from '+
    '   link_doc_opl ldo '+
    ' left join DOC_NAKL dn '+
    '   on (    dn.RECID = ldo.parent_recid '+
    '       and dn.baseid = ldo.parent_baseid '+
    '      ) '+
    ' where '+
    '     ldo.opl_recid = :OPL_RECID '+
    ' and ldo.opl_baseid = :OPL_BASEID '+
    ' and ldo.opl_form_type = :FORMTYPE ';
begin
  Query.Close;
  Query.SQL.Text:=sQueryGetParentDoc;
  Query.Params.ByName['OPL_RECID'].AsInteger:=DocNaklRECID.AsInteger;
  Query.Params.ByName['OPL_BASEID'].AsInteger:=DocNaklBASEID.AsInteger;
  Query.Params.ByName['FORMTYPE'].AsInteger:=DocNaklDOC_INHERITED.AsInteger;
  Query.ExecQuery;
  if (Query.RecordCount=0) and (DM.DKPP<>DocNaklDK_FROM.AsFloat) and (DM.DKTDM<>DocNaklDK_FROM.AsFloat) and (not IntfMegaDBCommon.IsOffice) then
  begin
    raise exception.Create(
      'Сохранение накладной невозможно'#13+
      'Создавайте возвратный документ из расходной накладной');
  end
  else
    if (Query.RecordCount=0) AND (GetProvStatus = iosRealization) then
      raise exception.Create(
          'Сохранение накладной невозможно'#13+
          'Создавайте этот документ из инвойса на преодплату!');
end;

procedure TDocNaklForm.aCreateOplDocNoPosExecute(Sender: TObject);
begin
  try
    NoPos:=true;
    InternalMakeDoc(True);
  finally
    NoPos:=false;
  end;
end;

procedure TDocNaklForm.aTransitExecute(Sender: TObject);
begin
//   if not (DM.UserAccess in [2,4]) then exit;
   if btTransit.Down then
   begin
     if Application.MessageBox('Вы уверенны, что по данной накладной не было погрузочно-разгрузочных работ ?', 'Внимание !', MB_YESNO + MB_ICONQUESTION)=ID_NO
     then begin
       btTransit.Down:=false;
       exit;
     end;
     Query4.Close;
     Query4.Transaction.Active:=false;
     Query4.Transaction.Active:=true;
     Query4.SQL.Text:='insert into nakl_not_load (recid,baseid)'+
     ' values (:RECID,:BASEID)';
     Query4.Params.ByName['RECID'].AsInteger:=DocNaklRECID.AsInteger;
     Query4.Params.ByName['BASEID'].AsInteger:=DocNaklBASEID.AsInteger;
     Query4.ExecQuery;
     Query4.Transaction.CommitRetaining;
   end else
   begin
     if Application.MessageBox('Вы уверенны, что по данной накладной были погрузочно-разнрузочные работы ?', 'Внимание !', MB_YESNO + MB_ICONQUESTION)=ID_NO
     then begin
       btTransit.Down:=true;
       exit;
     end;
     Query4.Close;
     Query4.Transaction.Active:=false;
     Query4.Transaction.Active:=true;
     Query4.SQL.Text:='delete from nakl_not_load where recid=:RECID '+
     ' and baseid=:BASEID';
     Query4.Params.ByName['RECID'].AsInteger:=DocNaklRECID.AsInteger;
     Query4.Params.ByName['BASEID'].AsInteger:=DocNaklBASEID.AsInteger;
     Query4.ExecQuery;
     Query4.Transaction.CommitRetaining;
   end;

 if btTransit.Down  then
   btTransit.ImageIndex:=46
 else
   btTransit.ImageIndex:=45;

end;

procedure TDocNaklForm.mselDK_TODKCheck(Sender: TObject);
begin
  CheckDK_TO(mselDK_TO.KodDK);
end;

procedure TDocNaklForm.mselDK_TOTradeOutletCheck(Sender: TObject);
begin
  CheckTradeOutlet_TO(mselDK_TO);
end;

procedure TDocNaklForm.CheckDK_TO(aKod_DK: Double);
begin
end;

procedure TDocNaklForm.CheckDogovor(aKOD_DK: double);
const
  sQueryText =
    ' select max(doc_end_date) from dk_docs where kod_dk = :kod_dk and doc_vid = '+sdvDogovor;
var
  q: TMegaQuery;
begin
  if (not intfMegaDBCommon.IsOffice) and not ((aKOD_DK=DM.DKTDM) or (aKOD_DK=DM.DKPP)) then
  begin
    q:= TMegaQuery.Create(Self);
    try
      q.Database:= dm.Money;
      q.Transaction:= Nakl_Transaction;
      q.SQL.Text:= sQueryText;
      q.Params.Byname['kod_dk'].AsDouble:= aKOD_DK;
      q.ExecQuery;
      if q.Fields[0].AsDateTime < Date then
      begin
        Raise Exception.Create('У данного дебитора просрочен или отсутствует договор');
      end;

    finally
      q.Free;
    end;
  end;
end;

procedure TDocNaklForm.CheckTradeOutlet_Name(aDialog: TMegaSelDKDialog);
begin
  if Trim(aDialog.OutletName) = '' then
  begin
    raise Exception.Create('Не задано название торговой точки');
  end;
end;

procedure TDocNaklForm.CheckTradeOutlet_TO(aDialog: TMegaSelDKDialog);
var
  lOutletObj: TMegaObjTradeOutlet;
begin
  if aDialog.IsactiveDK and (OPERSTATUS in [iosRealizationF1,iosRealizationF2,iosPrePay])
  and (Panel9.Visible) then
  begin
    CheckTradeOutlet_Name(aDialog);
    CheckTradeOutlet_Category(aDialog);

    lOutletObj:= TMegaObjTradeOutlet.Create(Self);
    try
      lOutletObj.Open(adialog.OutletRecID, adialog.OutletBaseID);
      lOutletObj.CheckOperatingMode;
      lOutletObj.CheckContactPerson;
      lOutletObj.CheckVisitDay;
      lOutletObj.CheckAddress;
    finally
      lOutletObj.Close;
      lOutletObj.Free;
    end;
  end;
end;

procedure TDocNaklForm.CheckTradeOutlet_Category(
  aDialog: TMegaSelDKDialog);
const
  sQueryText =
    ' select category, istrading '+
    ' from sprav_trade_outlet '+
    ' where recid = :recid and baseid = :baseid'+
    ' '+
    '';
var
  q: TMegaQuery;
begin
  q:= TMegaQuery.Create(Self);
  try
    q.Database:= aDialog.Database;
    q.Transaction:= aDialog.Transaction;
    q.SQL.Text:= sQueryText;
    q.Params.ByName['Recid'].AsInteger:=  adialog.OutletRecID;
    q.Params.ByName['baseid'].AsInteger:= adialog.OutletBaseID;

    q.ExecQuery;

    if q.FieldByName('ISTrading').AsInteger = 1 then
    begin
      if q.FieldByName('category').IsNull then
      begin
        Raise Exception.Create('Не задана категория торговой точки');
      end;
    end;

  finally
    q.Free;
  end;
end;

procedure TDocNaklForm.InitOutletNameFromNaklData;
const
  sQueryText =
    ' select                                                                                                       '#13#10+
    '   sto.baseid stobaseid,                                                                                      '#13#10+
    '   sto.recid storecid,                                                                                        '#13#10+
    '   sto.name stoname,                                                                                          '#13#10+
    '   sto.category category,                                                                                     '#13#10+
    '                                                                                                              '#13#10+
    '   sda.address sdaaddress,                                                                                    '#13#10+
    '   ska.keyt_name,                                                                                             '#13#10+
    '   ska.keyt_address,                                                                                          '#13#10+
    '   snp.nas_p_name,                                                                                            '#13#10+
    '   (case when dl.OUTLET_RECID is NULL THEN 1 ELSE 0 end) TT_FROM_LINK_DOC                                     '#13#10+
    '   ,oc.CAT_NAME                                                                                                           '#13#10+
    ' from PROC_GET_DOC_OUTLET(:docrecno, :baseid, :formtype ) pgdo                                                '#13#10+
    ' left join delivery_location dl on dl.formtype = :formtype and dl.baseid = :baseid and dl.docrecno = :docrecno'#13#10+

    ' left join sprav_trade_outlet sto on (sto.recid = pgdo.outlet_recid and sto.baseid = pgdo.outlet_baseid)      '#13#10+

//    ' left join sprav_dk_address sda on (sda.recid = sto.addr_recid and sda.baseid = sto.addr_baseid)              '#13#10+
//    ' left join proc_outlet_adress(dl.outlet_recid, coalesce(dl.outlet_baseid, :baseid), :dk_to) sda on (1=1)       '#13#10+
    ' left join proc_outlet_adress(dl.outlet_recid, coalesce(dl.outlet_baseid, :baseid), null) sda on (1=1)       '#13#10+
    ' left join OUTLET_CATEGORY oc on (oc.id = sto.category)       '#13#10+
    ' left join sprav_nas_p snp on (snp.nas_p_id = sda.nas_p_id)                                                   '#13#10+
    ' left join sprav_keyt_address ska on (ska.recid = dl.keyt_recid and ska.baseid = dl.keyt_baseid)              ';

var
  q: TMegaQuery;
begin
  q:= TMegaQuery.Create(Self);
  try
    q.Database:= dm.Money;
    q.Transaction:= Nakl_Transaction;
    q.SQL.Text:= sQueryText;
    q.Params.ByName['FORMTYPE'].AsInteger:= DocNaklDOC_INHERITED.AsInteger;
    q.Params.ByName['baseid'].AsInteger:= DocNaklBASEID.AsInteger;
    q.Params.ByName['docrecno'].AsInteger:= DocNaklRECID.AsInteger;
    //q.Params.ByName['dk_to'].AsFloat:= DocNaklDK_TO.AsFloat;

    q.ExecQuery;

    // для возвратов подтягиваю ТТ из расходной накалдной
    if (q.FieldByname('TT_FROM_LINK_DOC').AsInteger = 1) and
       (not q.FieldByname('storecid').isNull) then
      lbOutletInfo.Caption:= 'Возврат с ТТ '
     else
      lbOutletInfo.Caption:= '';

    lbOutletInfo.Caption:= lbOutletInfo.Caption+
      q.FieldByname('stoname').AsString+' ('+
      q.FieldByname('nas_p_name').AsString+', '+
      q.FieldByname('sdaaddress').AsString+'), кат: '+q.FieldByname('CAT_NAME').AsString;

    lbOutletInfo.Hint:= lbOutletInfo.Caption;  

    pnKeytAddress.Visible:=(q.FieldByname('category').AsInteger=iocK_Keyt);
    lblKeytAddress.Caption:='Адрес доставки (кейт. компания): '+
      q.FieldByname('keyt_name').AsString+' ('+
      q.FieldByname('keyt_address').AsString+')';

    NaklOutletRecid:=q.FieldByname('storecid').Asinteger;
    NaklOutletBaseid:=q.FieldByname('stobaseid').Asinteger;

  finally
    q.Close;
    q.Free;
  end;

end;

procedure TDocNaklForm.actShippingPalletsExecute(Sender: TObject);
begin
//
 actInsNarExecute(Sender);
end;

procedure TDocNaklForm.actShippingPalletsUpdate(Sender: TObject);
begin
 TAction(Sender).Visible:=FIsShippingPallets=1;
// actStickering.Visible:= not TAction(Sender).Visible;
 actInsNar.Visible:= not TAction(Sender).Visible;;
end;

procedure TDocNaklForm.actShowIndColor1Execute(Sender: TObject);
begin
  ShowIndColor:=not ShowIndColor;
end;

procedure TDocNaklForm.actFindTTNExecute(Sender: TObject);
begin
  //DocNakl.FindTTN;
  ShowTTNByNakl(DocNaklRECID.AsInteger,DocNaklBASEID.AsInteger);

end;

procedure TDocNaklForm.DocPosBeforeDelete(DataSet: TDataSet);
begin
{
   if (DocPosSource.DataSet.FieldByName('PRICE_KOL').AsInteger<>0)
   // add by ZIS 23.05.03 исключаем изменение кол-ва в возвратах
   and not( (DocNaklDK_TO.AsFloat=DM.DKTDM) or (DocNaklDK_TO.AsFloat=DM.DKPP))
}
   if(not( (DocNaklDK_TO.AsFloat=DM.DKTDM) or (DocNaklDK_TO.AsFloat=DM.DKPP)))
   then
     ChangeKolich:=true;

   CheckAllowChangeByNaklState();
end;

procedure SendNakl2Email(aOwner:TComponent;aRecID,aBaseID:Integer; aDNForm:TDocNaklForm=nil; aShowInfo:boolean =true);
var
  lForm, lBalance: integer;
  lSN: string;
  lEmail: string;
  lEnaklTxt, listAddr: TStringList;
  lSM: TMegaSendMail;
  lDt: string;
  lSc: integer;
  lFileOUT: string;
  //lFldNakl, l: TStringList;
  //i,j: integer;
  ldsNm, lFldNm: string;
  pathbuffer: array [0..MAX_PATH] of Char;
  PathIni,PathLine: String;

  qrEnakl_:TMegaDataSet;
  lOPERDATE:TDateTime; lDOCNUMBER:string;
  lDNForm:TDocNaklForm;
  procedure Prepare_lDNForm;
  begin
      if lDNForm=nil then
       if aDNForm<>nil
         then lDNForm:=aDNForm
         else begin
            lDNForm:=TDocNaklForm.Create(aOwner,aRecID,aBaseID,'',0,idvNakl);
         end;
  end;
begin
  lSc:=Screen.Cursor;
  Screen.Cursor:=crSQLWait;

  lEnaklTxt:=TstringList.Create;
  listAddr:=TstringList.Create;
  lSM:=TMegaSendMail.Create(aOwner);

  lDNForm:=nil;

//  if IntfMegaDBCommon.IsOffice then
//    lSM.Host := 'mail.office.meganet';
  lSM.SetSMTPLoginByID(3); // устанавливаю хост/логин/пароль для SMTP

  if aDNForm=nil
  then begin
    qrEnakl_:=TMegaDataSet.Create(aOwner);
    qrEnakl_.Database:=IntfDBProvider.GetDB;
    qrEnakl_.Transaction:=IntfDBProvider.getTrans;
  end
  else
    qrEnakl_:=aDNForm.qrEnakl;

  try
    // определяем торговую точку и параметры по ней
//    outlet:=DocNakl.GetOutlet(false);
//    if outlet.RecID = 0 then
    qrEnakl_.Close;
    qrEnakl_.SelectSQL.Text:='SELECT dn.balance_kod, dn.OPERDATE,dn.DOCNUMBER, oe.KOD_ENAKL, oe.SHORT_NAME, oe.EMAIL, sen.DELIMITER,coalesce(oe.type_file_name,0) type_file_name ' +
     ' ,dn.OPERDATE, dn.DOCNUMBER '+
     ' FROM PROC_GET_ENAKL_KOD(:RECID, :BaseID) oe ' +
     ' left join SPRAV_ENAKL sen on (sen.KOD_ENAKL=oe.KOD_ENAKL) '+
     ' left join doc_nakl dn on dn.recid=:RECID and dn.baseid=:BaseID';
    qrEnakl_.ParamByName('recid').AsInteger:= aRecID;
    qrEnakl_.ParamByName('baseid').AsInteger:= aBaseID;
    qrEnakl_.Open;
    if (qrEnakl_.FieldByName('EMAIL').IsNull) or (qrEnakl_.FieldByName('EMAIL').AsString = '') then
     raise Exception.Create('Для накладной не заполнены параметры электронной накладной.');

    lForm     :=qrEnakl_.FieldByName('KOD_ENAKL').AsInteger;
    lOPERDATE :=qrEnakl_.FieldByName('OPERDATE').asDateTime;
    lDOCNUMBER:=qrEnakl_.FieldByName('DOCNUMBER').asString;
    lBalance  :=qrEnakl_.FieldByName('KOD_ENAKL').AsInteger;

    {if IntfMegaAccessManager.GetUserName='ZIN'
      then  lEmail:='zubrilin.i@khortitsa.com'
      else}
    lEmail:=trim(qrEnakl_.FieldByName('EMAIL').AsString);

    listAddr.CommaText:= lEmail;
    listAddr.Add('Kovalenko.Ev@khortitsa.com');

    lSN:=trim(qrEnakl_.FieldByName('SHORT_NAME').AsString);
    //typeFileName :=qrEnakl_.FieldByName('type_file_name').AsInteger;
    if length(lSN)>0 then lSN:=lSN+'_';

    if (lform=3) then
    begin
       Prepare_lDNForm;
       datetimetostring(lDt,'ddmm',lOPERDATE);
       lDt:=lDt+'_';
       lFileOUT:='Megapolis_'+lSN+lDt+lDOCNUMBER+'.xls';
       lDNForm.DBGridEH1.DataSource.DataSet.DisableControls;
       lDNForm.DBGridEh1.Selection.SelectAll;
       SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,lDNForm.DBGridEh1,lFileOUT,False);
       lDNForm.DBGridEh1.Selection.Clear;
       lDNForm.DBGridEH1.DataSource.DataSet.EnableControls
    end
    else
    begin
        qrEnakl_.Close;
        qrEnakl_.SelectSQL.Text:='select STR_LINE from GET_ENAKL_FORM_CSV(:ARECID, :ABASEID, :AKOD_ENAKL)';
        qrEnakl_.ParamByName('ARECID').AsInteger:=aRecID;
        qrEnakl_.ParamByName('ABASEID').AsInteger:=aBaseID;
        qrEnakl_.ParamByName('AKOD_ENAKL').AsInteger:=lForm;
        qrEnakl_.Open;
        if qrEnakl_.IsEmpty then
          raise exception.Create('Не заполнен формат электронной накладной.');
        while not qrEnakl_.eof do begin
          if qrEnakl_.FieldByName('STR_LINE').AsString<>'' then
            lEnaklTxt.Add(qrEnakl_.FieldByName('STR_LINE').AsString);
          qrEnakl_.Next;
        end;

      // шлем письмо
      datetimetostring(lDt,'yyyymmdd',lOPERDATE);
      lDt:=lDt+'_';
      if lBalance=77 then
        lFileOUT:='Megapolis_'+lSN+lDt+lDOCNUMBER+'.txt'
      else if lBalance=7 then
        lFileOUT:='UDK_'+lSN+lDt+lDOCNUMBER+'.txt'
      else
        lFileOUT:='CHP_'+lSN+lDt+lDOCNUMBER+'.txt';
      GetEnvironmentVariable('TEMP', pathbuffer, SizeOf(pathbuffer));
      PathLine := String(pathbuffer);
      //FFileName:=  ReplaceStr(PathIni,'%TEMP%',PathLine);

      lEnaklTxt.SaveToFile(PathLine+'\'+lFileOUT);
    end;

//    lSM.ToAddress.Add(listAddr.s {lEmail});
    lSM.ToAddress:= listAddr;
     // lSM.ToAddress.Add('panchenko.dm@khortitsa.com');
//    lSM.ToAddress.Add('kislaja.j@khortitsa.com');
    lSM.Attachments.Add(PathLine+'\'+lFileOUT);
    lSM.SetEmailFrom('postmaster@megapol.com.ua');

    if lBalance=77 then
      lSM.Subject:= 'Nakladna from Megapolis'
    else
      lSM.Subject:= 'Nakladna from GlobalSpirits';
    try
      lSM.SendEmail;
      if aShowInfo then
        Info('Накладная успешно отправлена.');
    except
      on e:Exception do
        liUtils.Error('Не удалось отправить накладную !'+#13+#10+' ошибка - [' + e.Message + ']');
    end;
  finally
    if aDNForm=nil then
       qrEnakl_.Free;

    lSM.Free;
    lEnaklTxt.Free; listAddr.Free;
    if FileExists(lFileOUT) then DeleteFile(PChar(lFileOUT));
    if aDNForm=nil then lDNForm.Free;

    Screen.Cursor:=lSc;
  end;
end;

procedure TDocNaklForm.SendENakl(aOutKodMater: boolean = false; aShowInfo:boolean =true);
(*var
  outlet: TRecObjID;
  lForm: integer;
  lSN: string;
  lEmail: string;
  lEnaklTxt, listAddr: TStringList;
  lDelimiter, lPos: string;
  lSM: TMegaSendMail;
  lDt: string;
  lSc: integer;
  lFileOUT: string;
  lFldNakl, l: TStringList;
  i,j: integer;
  ldsNm, lFldNm: string;
  pathbuffer: array [0..MAX_PATH] of Char;
  PathIni,PathLine: String;
  typeFileName:SmallInt;
function MyFieldAsString(aFld: TField): string;
begin
  Result:=aFld.AsString;
  if aFld.DataType=ftFloat then result:=ReplaceStr(Result,',','.');
end;                    *)
begin
  SendNakl2Email(Self,docNaklRecID.asinteger,docNaklBaseID.asinteger,
                      TDocNaklForm(self));

(*  lSc:=Screen.Cursor;
  Screen.Cursor:=crSQLWait;
  lEnaklTxt:=TstringList.Create;
  lFldNakl:=TStringList.Create;
  listAddr:= TStringList.Create;
  lSM:=TMegaSendMail.Create(self);
//  if IntfMegaDBCommon.IsOffice then
//    lSM.Host := 'mail.office.meganet';
  lSM.SetSMTPLoginByID(3); // устанавливаю хост/логин/пароль для SMTP
  try
    // определяем торговую точку и параметры по ней
//    outlet:=DocNakl.GetOutlet(false);
//    if outlet.RecID = 0 then
    qrEnakl.Close;
    qrEnakl.SelectSQL.Text:='SELECT oe.KOD_ENAKL, oe.SHORT_NAME, oe.EMAIL, sen.DELIMITER,coalesce(oe.type_file_name,0) type_file_name ' +
     ' FROM PROC_GET_ENAKL_KOD(:RECID, :BaseID) oe ' +
     ' left join SPRAV_ENAKL sen on (sen.KOD_ENAKL=oe.KOD_ENAKL)';
    qrEnakl.ParamByName('recid').AsInteger:= DocNaklRecID.Value;
    qrEnakl.ParamByName('baseid').AsInteger:= DocNaklBaseID.Value;
    qrEnakl.Open;
    if (qrEnakl.FieldByName('EMAIL').IsNull) or (qrEnakl.FieldByName('EMAIL').AsString = '') then
     raise Exception.Create('Для накладной не заполнены параметры электронной накладной.');
    lForm:=qrEnakl.FieldByName('KOD_ENAKL').AsInteger;
    if IntfMegaAccessManager.GetUserName='ZIN'
      then  lEmail:='zubrilin.i@khortitsa.com'
      else  lEmail:=trim(qrEnakl.FieldByName('EMAIL').AsString);
    listAddr.CommaText:= lEmail;
    lDelimiter:=qrEnakl.FieldByName('DELIMITER').AsString;
    lSN:=trim(qrEnakl.FieldByName('SHORT_NAME').AsString);
    typeFileName :=qrEnakl.FieldByName('type_file_name').AsInteger;
    if length(lSN)>0 then lSN:=lSN+'_';
    if (lform=3) then
    begin
       datetimetostring(lDt,'ddmm',Source.DataSet.FieldByName('OPERDATE').AsDateTime);
       lDt:=lDt+'_';
       lFileOUT:='Megapolis_'+lSN+lDt+Source.DataSet.FieldByName('DOCNUMBER').asstring+'.xls';
       DBGridEH1.DataSource.DataSet.DisableControls;
       DBGridEh1.Selection.SelectAll;
       SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,lFileOUT,False);
       DBGridEh1.Selection.Clear;
       DBGridEH1.DataSource.DataSet.EnableControls
    end
    else
    begin
        qrEnakl.Close;
        qrEnakl.SelectSQL.Text:=format('SELECT KOD_ENAKL, COLUMN_NAME, ISEMPTY, INSERT_ORDER' +
         ' FROM SPRAV_ENAKL_FORM ' +
         ' WHERE KOD_ENAKL=%d order by INSERT_ORDER',[lForm]);
        qrEnakl.Open;
        if qrEnakl.IsEmpty then
          raise exception.Create('Не заполнен формат электронной накладной.');
        // формируем текст
        DocPosForENakl.active:=false;
        DocPosForENakl.active:=true;
        DocPosForENakl.First;
        while not DocPosForENakl.Eof do //DBGridEH1.DataSource.DataSet.Eof
        begin
          qrEnakl.First;
          lPos:='';
          while not qrEnakl.Eof do
          begin
             case qrEnakl.FieldByName('ISEMPTY').AsInteger of
              0:
               begin
                if (trim(qrEnakl.FieldByName('COLUMN_NAME').AsString)='KOD_EAN') and
                 (qrEnakl.FieldByName('KOD_ENAKL').AsInteger=1) then
                begin
                  qrCheckEAN.Close;
                  qrCheckEAN.Params.ByName['KOD_EAN'].Value:=
                   DocPosForENakl.FieldByName(trim(qrEnakl.FieldByName('COLUMN_NAME').AsString)).Value;
                  qrCheckEAN.ExecQuery;
                    lPos:= lPos + MyFieldAsString(
                    DocPosForENakl.FieldByName(trim(qrEnakl.FieldByName('COLUMN_NAME').AsString)))+
                    lDelimiter;
                end
                 else
                  begin
                lPos:=lPos+MyFieldAsString(
                 DocPosForENakl.FieldByName(trim(qrEnakl.FieldByName('COLUMN_NAME').AsString)))+
                 lDelimiter;
                end;
              end;
              1:
               begin
                lPos:=lPos+lDelimiter;
              end;
            end;
            qrEnakl.Next;
          end;
          if length(lPos)>1 then system.delete(lPos,length(lPos),1);
          lEnaklTxt.Add(lPos);
          DocPosForENakl.Next;
        end;
        // заполним информайию заголовка
        qrEnakl.First;
        while not qrEnakl.Eof do
        begin
          if qrEnakl.FieldByName('ISEMPTY').AsInteger=2 then
          begin
            lFldNakl.Clear;
            lFldNakl.CommaText:=trim(qrEnakl.FieldByName('COLUMN_NAME').AsString);
            lPos:='';
            for i:=0 to lFldNakl.Count-1 do
            begin
              if trim(lFldNakl.Strings[i])<>'' then
              begin
                ldsNm:=trim(lFldNakl.Strings[i]);
                ldsNm:=system.copy(ldsNm,1,pos(':',ldsNm)-1);
                lFldNm:=trim(lFldNakl.Strings[i]);
                lFldNm:=system.copy(lFldNm,pos(':',lFldNm)+1,length(lFldNm)-pos(':',lFldNm));
                for j:=0 to ComponentCount-1 do
                 if AnsiUpperCase(Components[j].Name)=AnsiUpperCase(ldsNm) then
                 begin
                   lPos:=lPos+MyFieldAsString(TDataset(Components[j]).FieldByName(lFldNm))+
                    lDelimiter;
                 end;
              end;
            end;
            if length(lPos)>1 then system.delete(lPos,length(lPos),1);
            lEnaklTxt.Add(lPos);
          end;
          qrEnakl.Next;
        end;
      // шлем письмо
      datetimetostring(lDt,'yyyymmdd',Source.DataSet.FieldByName('OPERDATE').AsDateTime);
      lDt:=lDt+'_';
      if docNaklBalance_kod.asinteger=77 then
        lFileOUT:='Megapolis_'+lSN+lDt+Source.DataSet.FieldByName('DOCNUMBER').asstring+'.txt'
      else if docNaklBalance_kod.asinteger=7 then
        lFileOUT:='UDK_'+lSN+lDt+Source.DataSet.FieldByName('DOCNUMBER').asstring+'.txt'
      else
        lFileOUT:='CHP_'+lSN+lDt+Source.DataSet.FieldByName('DOCNUMBER').asstring+'.txt';
      GetEnvironmentVariable('TEMP', pathbuffer, SizeOf(pathbuffer));
      PathLine := String(pathbuffer);
      //FFileName:=  ReplaceStr(PathIni,'%TEMP%',PathLine);

      lEnaklTxt.SaveToFile(PathLine+'\'+lFileOUT);
    end;
//    lSM.ToAddress.Add(listAddr.s {lEmail});
    lSM.ToAddress:= listAddr;
     // lSM.ToAddress.Add('panchenko.dm@khortitsa.com');
//    lSM.ToAddress.Add('kislaja.j@khortitsa.com');
    lSM.Attachments.Add(PathLine+'\'+lFileOUT);
    lSM.SetEmailFrom('postmaster@megapol.com.ua');
    if docNaklBalance_kod.asinteger=77 then
      lSM.Subject:= 'Nakladna from Megapolis'
    else
      lSM.Subject:= 'Nakladna from UDK';
    try
      lSM.SendEmail;
      if aShowInfo then
        Info('Накладная успешно отправлена.');
    except
      on e:Exception do
        liUtils.Error('Не удалось отправить накладную !'+#13+#10+' ошибка - [' + e.Message + ']');
    end;
  finally
    listAddr.Free;
    lSM.Free;
    lEnaklTxt.Free;
    lFldNakl.Free;
    if FileExists(lFileOUT) then DeleteFile(PChar(lFileOUT));
    Screen.Cursor:=lSc;
  end;         *)
end;

procedure TDocNaklForm.aSendENaklExecute(Sender: TObject);
begin
  SendENakl;
end;

procedure TDocNaklForm.aSendENaklKodMaterExecute(Sender: TObject);
begin
  SendENakl(true);
end;

procedure TDocNaklForm.DoAfterPost;
begin
  Docnakl.AfterPost(docnakl);
end;

procedure TDocNaklForm.NaklEdit;
begin
  DocNakl.Edit;
end;

procedure TDocNaklForm.NaklPost;
begin
  DocNakl.Post;
end;

procedure TDocNaklForm.SetDKTo(aValue: double);
begin
  DocNaklDK_TO.Value := aValue;
end;

procedure TDocNaklForm.SetGroupOper(aValue: integer);
begin
  DocNaklGROUP_OPER.Value := aValue; 
end;

procedure TDocNaklForm.SetKodOper(aValue: integer);
begin
  DocNaklKOD_OPER.Value := aValue;
end;

procedure TDocNaklForm.SetNoOtsr(aValue: Boolean);
begin
  NoOtsr:= aValue;
end;

procedure TDocNaklForm.SetNotSetOtsr(aValue: Boolean);
begin
  NotSetOtsr:= aValue;
end;

procedure TDocNaklForm.SetPriceCol(aCol, aAllPrice: integer);
var
  lSc: integer;
begin
  // проставить по всем позициям колонку
  lSc:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
    Query.Close;
    Query.SQL.Text := 'EXECUTE PROCEDURE SET_NAKL_PRICE_COL(:NAKL_RECID, :NAKL_BASEID, :COL_NUMBER, :COL_CFO, :ALL_PRICES)';
    Query.Params[0].asInteger := DocNaklRECID.Value;
    Query.Params[1].asInteger := DocNaklBASEID.Value;
    Query.Params[2].asInteger := aCol;
    Query.Params[3].asInteger := DocNaklCFO.AsInteger;
    Query.Params[4].asInteger := aAllPrice;
    Query.ExecQuery;
  finally
    Screen.Cursor:=lSc;
  end;
end;

procedure TDocNaklForm.SetPriceType(aValue: integer);
begin
  if not ((DocNakl.State = dsEdit) or (DocNakl.State = dsInsert)) then DocNakl.Edit;
  DocNaklPRICETYPE_.Value := aValue;
end;


function TDocNaklForm.GetDocPos: TMegaDataSetParent;
begin
  Result:= DocPos;
end;

procedure TDocNaklForm.GetIsShippingPallets(naklRecid, naklBaseid: Integer);
begin
//
 FIsShippingPallets:=VarToInt(fbExecQuery(DM, 'select count(*) from (SELECT sum(iif(sm.group_mater=28,1,0)) sm,count(*) cnt FROM DOC_NAKL_POS dnp '+
' left join sprav_mater sm on (sm.kod_mater = dnp.kod_mater) '+
' WHERE dnp.docrecno = %d and dnp.baseid= %d '+
' having sum(iif(sm.group_mater=28,1,0)) = count(*))', [naklRecid,naklBaseid]));
end;

procedure TDocNaklForm.GetIsStickering(naklRecid, naklBaseid: Integer);
begin
//
 FIsStickeringNakl:=VarToInt(fbExecQuery(DM, 'SELECT count(*) FROM GET_LINKED_DOCS_NEW(1,%d,%d,1,0) WHERE LINKED_PARENT=1', [naklRecid,naklBaseid]));
end;

function TDocNaklForm.GetQuery: TMegaQuery;
begin
  Result:= Query;
end;

function TDocNaklForm.GetRecID: integer;
begin
  Result:= DocNaklRECID.AsInteger;
end;

procedure TDocNaklForm.NaklCopyPos;
begin
  CopyPosExecute(nil)
end;

procedure TDocNaklForm.NaklCreatePDVNakl;
begin
  CreatePDVNakl.Execute;
end;

function TDocNaklForm.GetTransaction: TMegaTransaction;
begin
  Result:= Nakl_Transaction;
end;

procedure TDocNaklForm.DocNaklBeforeEdit(DataSet: TDataSet);
begin
 btnPriceCols.Caption:='Колонки';
end;
  {
procedure TDocNaklForm.ExportToWMS(isSort:boolean);
var
  order_nakl: Order;
  OrderLines_pos : OrderLines;
  OrderLines_pos_array:ArrayOfOrderLines;
  i, j:integer;
  ws:WMSWebServiceSoap;
  Res:Response;
  lstRecid, lstBaseid : TStringList;
  xsdt1: Txsdatetime;
  dNumb: Double;
  fNaklIsSort: boolean;
  sMessage : string;

begin
 i := 0; sMessage:= '';
 ws := GetWMSWebServiceSoap;
 lstRecid:= TStringList.Create;
 lstBaseid:= TStringList.Create;
 fNaklIsSort:= IsSortNakl(DocNaklRECID.AsInteger,DocNaklBASEID.AsInteger) = 1;
 if (isSort and not fNaklIsSort)  then
   MessageDlg('Накладная не является сортировочной!',  mtError, [mbOK], 0);
 xsdt1:= TXSDateTime.Create();
 try
   if (fNaklIsSort) and (not isSort)  then
    begin   // выгружаем накладные, включенные в эту сортировку
      qSortNakl.Close;
      qSortNakl.ParamByName('RECID').asInteger:= DocNaklRECID.AsInteger;
      qSortNakl.ParamByName('BASEID').asInteger:= DocNaklBASEID.AsInteger;
      qSortNakl.ExecQuery;
      while not qSortNakl.EOF do
       begin
         lstRecid.Add(IntToStr(qSortNakl.Fields[0].AsInteger));
         lstBaseid.Add(IntToStr(qSortNakl.Fields[1].AsInteger));
         qSortNakl.Next;
       end;
    end
  else
  begin    // выгружаем текущую накладную (либо просто накладную либо всю сортировку как "большой заказ")
    lstRecid.Add(IntToStr(DocNaklRECID.AsInteger));
    lstBaseid.Add(IntToStr(DocNaklBASEID.AsInteger));
  end ;
  for j:=0 to lstRecid.Count-1 do
   begin
     mdsImportAsnInWMS.Close;
     mdsImportAsnInWMS.ParamByName('RECID').asInteger:= StrToInt(lstRecid[j]);
     mdsImportAsnInWMS.ParamByName('BASEID').asInteger:= StrToInt(lstBaseid[j]);
     mdsImportAsnInWMS.Open;

     mdsImportAsnInWMSPos.Close;
     mdsImportAsnInWMSPos.ParamByName('RECID').asInteger:= StrToInt(lstRecid[j]);
     mdsImportAsnInWMSPos.ParamByName('BASEID').asInteger:= StrToInt(lstBaseid[j]);
     mdsImportAsnInWMSPos.Open;
     i:=mdsImportAsnInWMSPos.RecordCountFromSrv+1;
     SetLength(OrderLines_pos_array, i);
     mdsImportAsnInWMSPos.First;
     i:=0;
     while not mdsImportAsnInWMSPos.Eof do
      begin
        OrderLines_pos:= OrderLines.Create;
        OrderLines_pos.GoodsCode :=  mdsImportAsnInWMSPosGOODSCODE.asString;
        OrderLines_pos.Qty :=  mdsImportAsnInWMSPosQTY.AsInteger;
        OrderLines_pos.MuCode := mdsImportAsnInWMSPosMUCODE.asString;
        OrderLines_pos.PoLineNo :=0; // mdsImportAsnInWMSPosPOLINENO.asInteger;
        OrderLines_pos_array[i] := OrderLines_pos;
        Inc(i);
        mdsImportAsnInWMSPos.Next;
      end;
    order_nakl:= Order.Create;
    dNumb:= StrToFloat(lstRecid[j])*1000+StrToFloat(lstBaseid[j]);
    order_nakl.OrderNumber := FloatToStr(dNumb);// Inttostr(StrToInt(lstRecid[j])*1000+StrToInt(lstBaseid[j]));//mdsImportAsnInWMSASNNUMBER.AsString;
    order_nakl.WhsCode :=  'WRH'; //  mdsImportAsnInWMSWHSCODE.AsString;
    order_nakl.VendorCode := mdsImportAsnInWMSVENDORCODE.AsString;
    order_nakl.CustomerCode := mdsImportAsnInWMSVENDORTOCODE.AsString;
    order_nakl.CustomerName := mdsImportAsnInWMSCustomerName.AsString;
    order_nakl.DeliveryCode := Inttostr(mdsImportAsnInWMSOutlet_recid.AsInteger*1000+mdsImportAsnInWMSOutlet_BASEID.AsInteger);//mdsImportAsnInWMSASNNUMBER.AsString;
    order_nakl.DeliveryName:= mdsImportAsnInWMSOutlet_Name.AsString;
    order_nakl.DeliveryAddr:= mdsImportAsnInWMSTo_address.AsString;
    order_nakl.CustomerAddr:= mdsImportAsnInWMSDK_PAYER_ADDRESS.AsString;
    order_nakl.Comment :=  mdsImportAsnInWMSCOMMENT.asString;
    xsdt1.AsDateTime :=  mdsImportAsnInWMSOperdate.asDateTime;
    xsdt1.UseZeroMilliseconds:= True;
    order_nakl.OrderDate    :=DateTimeToXMLTime(mdsImportAsnInWMSOperdate.asDateTime,false);// System.Copy(xsdt1;//.nativetoxs, 1, 19) ; //'2016-09-28T00:00:00'; // DateTimeToStr(xsdt1.AsDateTime);
    order_nakl.DespatchDate:=DateTimeToXMLTime(mdsImportAsnInWMSOperdate.asDateTime,false); // xsdt1;//DateTimeToStr(xsdt1.AsDateTime);
    order_nakl.ListOrderLines := OrderLines_pos_array;
    Res:=ws.ImportOrderInWMS(order_nakl);
    if Res.State <>0  then
     begin
       if not DM.trMainWShort.Active then DM.trMainWShort.Active:= True;
          fbExecQuery(DM.trMainWShort, 'UPDATE OR INSERT INTO NAKL_ADDITION_PROP (NAKL_RECID, NAKL_BASEID, WMS_IMPORT_STATUS) VALUES (%d, %d, %d)',
                      [lstRecid[j], lstBaseid[j], Res.State]);  //ошибка вставки
       DM.trMainWShort.Commit;
      if lstRecid.Count > 1 then
        sMessage:= sMessage + FloatToStr(dNumb) + ' - ошибка при передачи накладной в WMS!'+Res.DescriptionError +#13#10
       else
       MessageDlg('Произошла ошибка при передачи накладной в WMS!'+Res.DescriptionError,  mtError,
        [mbOK], 0);
     end
    else
     begin
       if not DM.trMainWShort.Active then DM.trMainWShort.Active:= True;
          fbExecQuery(DM.trMainWShort, 'UPDATE OR INSERT INTO NAKL_ADDITION_PROP (NAKL_RECID, NAKL_BASEID, WMS_IMPORT_STATUS) VALUES (%d, %d, %d)',
                      [StrToInt(lstRecid[j]), StrToInt(lstBaseid[j]), Res.State]);  //ошибка вставки
       DM.trMainWShort.Commit;
       if lstRecid.Count < 2 then
        MessageDlg('Накладная выгружена успешно!',  mtInformation, [mbOK], 0);
     end;
   end;
   if sMessage <> '' then
    MessageDlg(sMessage,  mtInformation, [mbOK], 0)
   else
    if lstRecid.Count > 1 then
     MessageDlg('Накладная выгружена успешно!',  mtInformation, [mbOK], 0)
    else
     if lstRecid.Count = 0 then
      MessageDlg('Нет накладных, включенных в сортировку!',  mtInformation, [mbOK], 0)
  finally
    FreeAndNil(lstRecid);
    FreeAndNil(lstBaseid);
  end;
end;

procedure TDocNaklForm.ExportToWMSSort(isSort:boolean);
var
  order_nakl: PurchaseOrder;
  OrderLines_pos : PurchaseOrderLines;
  OrderLines_pos_array:ArrayOfPurchaseOrderLines;
  i, j:integer;
  ws:WMSWebServiceSoap;
  Res:Response;
  lstRecid, lstBaseid : TStringList;
  xsdt1: Txsdatetime;
  dNumb: Double;
  fNaklIsSort: boolean;
  sMessage : string;
begin
 i := 0; sMessage:= '';
 fNaklIsSort:= IsSortNakl(DocNaklRECID.AsInteger,DocNaklBASEID.AsInteger) = 1;
 if (not fNaklIsSort)  then
  Abort('Накладная не является сортировочной!');
 ws:= GetWMSWebServiceSoap;
 lstRecid:= TStringList.Create;
 lstBaseid:= TStringList.Create;
 xsdt1:= TXSDateTime.Create();
 try
    // выгружаем текущую накладную (либо просто накладную либо всю сортировку как "большой заказ")
    lstRecid.Add(IntToStr(DocNaklRECID.AsInteger));
    lstBaseid.Add(IntToStr(DocNaklBASEID.AsInteger));
   for j:=0 to lstRecid.Count-1 do
   begin
     mdsImportAsnInWMS.Close;
     mdsImportAsnInWMS.ParamByName('RECID').asInteger:= StrToInt(lstRecid[j]);
     mdsImportAsnInWMS.ParamByName('BASEID').asInteger:= StrToInt(lstBaseid[j]);
     mdsImportAsnInWMS.Open;

     mdsImportAsnInWMSPos.Close;
     mdsImportAsnInWMSPos.ParamByName('RECID').asInteger:= StrToInt(lstRecid[j]);
     mdsImportAsnInWMSPos.ParamByName('BASEID').asInteger:= StrToInt(lstBaseid[j]);
     mdsImportAsnInWMSPos.Open;
     i:=mdsImportAsnInWMSPos.RecordCountFromSrv+1;
     SetLength(OrderLines_pos_array, i);
     mdsImportAsnInWMSPos.First;
     i:=0;
     while not mdsImportAsnInWMSPos.Eof do
      begin
        OrderLines_pos:= PurchaseOrderLines.Create;
        OrderLines_pos.GoodsCode :=  mdsImportAsnInWMSPosGOODSCODE.asString;
        OrderLines_pos.Qty :=  mdsImportAsnInWMSPosQTY.AsInteger;
        OrderLines_pos.MuCode := mdsImportAsnInWMSPosMUCODE.asString;
        //OrderLines_pos.PoLineNo :=0; // mdsImportAsnInWMSPosPOLINENO.asInteger;
        OrderLines_pos_array[i] := OrderLines_pos;
        Inc(i);
        mdsImportAsnInWMSPos.Next;
      end;
    order_nakl:= PurchaseOrder.Create;
    dNumb:= StrToFloat(lstRecid[j])*1000+StrToFloat(lstBaseid[j]);
    order_nakl.RegNo := FloatToStr(dNumb);// Inttostr(StrToInt(lstRecid[j])*1000+StrToInt(lstBaseid[j]));//mdsImportAsnInWMSASNNUMBER.AsString;
    order_nakl.WhsCode :=  'WRH'; //  mdsImportAsnInWMSWHSCODE.AsString;
    order_nakl.WhsToCode :=  'WRH'; //  mdsImportAsnInWMSWHSCODE.AsString;
    order_nakl.VendorCode := mdsImportAsnInWMSVENDORCODE.AsString;
    order_nakl.Comment :=  mdsImportAsnInWMSCOMMENT.asString;
//    xsdt1.AsDateTime :=  mdsImportAsnInWMSOperdate.asDateTime;
//    xsdt1.UseZeroMilliseconds:= True;
//    order_nakl.OrderDate    :=DateTimeToXMLTime(mdsImportAsnInWMSOperdate.asDateTime,false);// System.Copy(xsdt1;//.nativetoxs, 1, 19) ; //'2016-09-28T00:00:00'; // DateTimeToStr(xsdt1.AsDateTime);
//    order_nakl.DespatchDate:=DateTimeToXMLTime(mdsImportAsnInWMSOperdate.asDateTime,false); // xsdt1;//DateTimeToStr(xsdt1.AsDateTime);
    order_nakl.ListOrderLines := OrderLines_pos_array;
    Res:=ws.ImportPurchaseOrder(order_nakl);
    if Res.State <> 0  then
     begin
       if not DM.trMainWShort.Active then DM.trMainWShort.Active:= True;
          fbExecQuery(DM.trMainWShort, 'UPDATE OR INSERT INTO NAKL_ADDITION_PROP (NAKL_RECID, NAKL_BASEID, WMS_IMPORT_STATUS) VALUES (%d, %d, %d)',
                      [lstRecid[j], lstBaseid[j], Res.State]);  //ошибка вставки
       DM.trMainWShort.Commit;
      if lstRecid.Count > 1 then
        sMessage:= sMessage + FloatToStr(dNumb) + ' - ошибка при передачи накладной в WMS!'+Res.DescriptionError +#13#10
       else
       MessageDlg('Произошла ошибка при передачи накладной в WMS!'+Res.DescriptionError,  mtError,
        [mbOK], 0);
     end
    else
     begin
       if not DM.trMainWShort.Active then DM.trMainWShort.Active:= True;
          fbExecQuery(DM.trMainWShort, 'UPDATE OR INSERT INTO NAKL_ADDITION_PROP (NAKL_RECID, NAKL_BASEID, WMS_IMPORT_STATUS) VALUES (%d, %d, %d)',
                      [StrToInt(lstRecid[j]), StrToInt(lstBaseid[j]), Res.State]);  //ошибка вставки
       DM.trMainWShort.Commit;
       if lstRecid.Count < 2 then
        MessageDlg('Накладная выгружена успешно!',  mtInformation, [mbOK], 0);
     end;
   end;
   if sMessage <> '' then
    MessageDlg(sMessage,  mtInformation, [mbOK], 0)
   else
    if lstRecid.Count > 1 then
     MessageDlg('Накладная выгружена успешно!',  mtInformation, [mbOK], 0);
  finally
    FreeAndNil(lstRecid);
    FreeAndNil(lstBaseid);
  end;
end;
 }


procedure TDocNaklForm.actExportSortToWMSExecute(Sender: TObject);
var sMessage: string;
begin
 //  ExportToWMSSort(true);  1
  sMessage:= ExportToWMSSort(DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger, true);
  if sMessage = '' then sMessage:= 'Завершено успешно';
  MessageDlg(sMessage,  mtInformation,[mbOK], 0);
end;

procedure TDocNaklForm.actExportToWMSExecute(Sender: TObject);
var sMessage: string;
begin
//  ExportToWMS(false);      2
  sMessage:= ExportToWMS(DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger, false);
  if sMessage = '' then sMessage:= 'Завершено успешно';
  MessageDlg(sMessage,  mtInformation,[mbOK], 0);
end;

procedure TDocNaklForm.actFindSortingPartyExecute(Sender: TObject);
begin
  DocNakl.FindSortingParty;
end;

procedure TDocNaklForm.PrintRecPriceExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
begin
  // проверки на возможность печати
  if  not AllowAll
  and (DocNaklSTATE.Value<>idsBug)
  and (DocNaklSTATE.Value<>idsKassa)
  and (DocNaklDK_TO.AsFloat<>ddkEndUser)
  and (not intfMegaDBCommon.IsOffice)
  and (DocNaklSTATE.Value<>idsFromOffice) then
  begin
    exit;
  end;
  if (DocNaklSTATE.Value= idsPrepare)
  or (DocNaklSTATE.Value= idsToOffice) then
  begin
    exit;
  end;

  //-- тоже проверка
  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then
  begin
    DocNakl.Edit;
    DocNaklSTATE.Value := idsInternal;
  end;

  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.PreparePriceReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction);

    frVariables.Variable['HidePriceAndCost']:= False;

    if OPERSTATUS=10 then
      frVariables.Variable['IsOtv']:= True else
      frVariables.Variable['IsOtv']:= False;

    if FDesignReport then
    begin
     lDMRep.frRecPrice.DesignReport;
    end
    else begin
     if not ldmRep.ds_RecPrice.IsEmpty then begin
      lDMRep.frRecPrice.PrepareReport;
      lDMRep.frRecPrice.PrintPreparedReportDlg;
                                            end;
    end;

  finally
    ldmRep.Free;
  end;

end;

procedure TDocNaklForm.aSendToRegionUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:= true; // OPERSTATUS in [iosOFInternalMove,iosOFFromToRoad,iosOFPurchasingWriteOff];
end;

procedure TDocNaklForm.aSendToRegionExecute(Sender: TObject);
var
  t: TMegaTransaction;
  q: TMegaQuery;
  frmSelRegion:TfrmSendToRegion;
  Region: Integer;
begin
  Region:= -1;
  if (DocNaklBASEID.Value<>1) and (DocNaklBASEID.Value<>231) then
  begin
{ ---------------- Changed by Lion in 24.09.2008 --------------- }
//    Error('Нельзя отправлять документ, созданный в региональной базе !');
//    exit;
    Region:= 999999;
{ ----------- End of changing by Lion in 24.09.2008 ----------- }
  end;
  t:=TMegaTransaction.Create(self);
  t.DefaultDatabase:=DocNakl.Transaction.DefaultDatabase;
  q:=TMegaQuery.Create(self);
  q.Database:=DocNakl.Transaction.DefaultDatabase;
  q.Transaction:=t;
  t.StartTransaction;
  try
    if (DocNaklRECID.Value=0) or (DocNaklBASEID.Value=0) {or (DocNaklCFO.AsInteger<2)} then exit;
   // if (Application.MessageBox('Отправить в регион?','Подтверждение', MB_YESNO+MB_ICONQUESTION) = IDYES) then
    if ((Region = -1) or (IntfMegaAccessManager.GetUserAccess = iuaSystem)) then
    begin
      frmSelRegion := TfrmSendToRegion.Create(Self);
      frmSelRegion.MegaSelRegion1.value:=DocNaklCFO.AsString;
      if frmSelRegion.ShowModal=mrOk then
        Region:= StrToIntDef(frmSelRegion.megaselregion1.value, -1);
    end;

    if Region >= 0 then
    begin
        q.Close;
        if DocNaklCFO.AsInteger=3 then
         q.SQL.Text:='insert into SYS_PROTOKOL (TABLE_NAME, CHANGE_TYPE, OLD_ID, NEW_ID) VALUES ('+
          '''DOC_NAKL1'',''I'',0,'+QuotedStr(IntToStr(DocNaklRECID.AsInteger)+'|'+
          IntToStr(DocNaklBASEID.AsInteger)+'|2')+')'
        else
        begin
{ ----------------- Added by Lion in 24.09.2008 ---------------- }
          if Region = 999999 then
           begin
             query.Close;
             query.SQL.Text:=Format(
               'insert into SYS_PROTOKOL (TABLE_NAME, CHANGE_TYPE, OLD_ID, NEW_ID) VALUES ('+
                '%s, %s, %s, %2:s)',
             [QuotedStr('DOC_NAKL_POS_FIX'), QuotedStr('U'), QuotedStr(IntToStr(DocNaklRECID.AsInteger)+'|'+
              IntToStr(DocNaklBASEID.AsInteger)+'|'+IntToStr(DocNaklCFO.AsInteger))]);
             MegaExecQuery(query);

             q.SQL.Text:= Format(
               'insert into SYS_PROTOKOL (TABLE_NAME, CHANGE_TYPE, OLD_ID, NEW_ID) VALUES ('+
                '%s, %s, %s, %2:s)',
             [QuotedStr('DOC_NAKL1'), QuotedStr('U'), QuotedStr(IntToStr(DocNaklRECID.AsInteger)+'|'+
              IntToStr(DocNaklBASEID.AsInteger)+'|'+IntToStr(DocNaklCFO.AsInteger))])
           end
{ ----------- End of addition by Lion in 24.09.2008 ----------- }
          else begin
             if Region =0 then
                Region:=DocNaklCFO.AsInteger;
             q.SQL.Text:='insert into SYS_PROTOKOL (TABLE_NAME, CHANGE_TYPE, OLD_ID, NEW_ID) VALUES ('+
             '''DOC_NAKL1'',''I'',0,'+QuotedStr(IntToStr(DocNaklRECID.AsInteger)+'|'+
             IntToStr(DocNaklBASEID.AsInteger)+'|'+IntToStr(Region))+')';
             query.Close;
             query.SQL.Text:='select recid,baseid from link_doc_opl where '+
                             'opl_recid='+IntToStr(DocNaklRECID.AsInteger)+' and '+
                             'opl_baseid='+IntToStr(DocNaklBASEID.AsInteger)+' and OPL_FORM_TYPE=1';
             MegaExecQuery(query);
             if (query.FieldByName('baseid').asINteger<>0)and
                (query.FieldByName('baseid').asINteger<>region)
             then begin
               MegaExecQuery(q);
               q.SQL.Text:='insert into SYS_PROTOKOL (TABLE_NAME, CHANGE_TYPE, OLD_ID, NEW_ID) VALUES ('+
               '''LINK_DOC_OPL1'',''I'',0,'+QuotedStr(IntToStr(query.FieldByName('recid').asINteger)+'|'+
               IntToStr(query.FieldByName('baseid').asINteger)+'|'+IntToStr(Region))+')';
             end;
             query.Close;
          end;
        end;
        MegaExecQuery(q);
        if t.InTransaction then t.Commit;
        Info('Накладная поставлена на отправку.');
    end;
  finally
    t.Free;
    q.Free;
  end;
end;

procedure TDocNaklForm.aCreatePDVIncDocExecute(Sender: TObject);
begin
  PDVDocsEditForm_Show2CreatorT(Self,DocNaklRECID.Value, DocNaklBASEID.Value, 'DOC_NAKL',
                                     DocNaklDOCDATE.Value, DocNaklOPERDATE.Value,
                                     DocNaklDK_FROM.value, IntfMegaCommon.GetBalanceDK(DocNaklDOCDATE.Value,DocNaklDOCTYPE.Value,DocNaklCFO.Value),
                                     DocNaklSUMMA1.Value, 1,
                                     DM.GetOperPdvVid(DM.trMainRO, DocNaklGROUP_OPER.Value, DocNaklKOD_OPER.Value));
  {TPDVDocsEditForm.Create(Self, nil, 0, IntfMegaDBCommon.GetBaseID,
   DocNaklRECID.Value, DocNaklBASEID.Value, 'DOC_NAKL',
   DocNaklDOCDATE.Value, DocNaklOPERDATE.Value,
   DocNaklDK_FROM.value, IntfMegaCommon.GetBalanceDK(DocNaklDOCDATE.Value,DocNaklDOCTYPE.Value,DocNaklCFO.Value),
   DocNaklSUMMA1.Value,
   DM.GetOperPdvVid(DM.trMainRO, DocNaklGROUP_OPER.Value, DocNaklKOD_OPER.Value)).Show;}
end;

procedure TDocNaklForm.aCreatePDVIncKorDocExecute(Sender: TObject);
begin
  PDVDocsEditForm_Show2CreatorT(Self,DocNaklRECID.Value, DocNaklBASEID.Value, 'DOC_NAKL',
                                     DocNaklDOCDATE.Value, DocNaklOPERDATE.Value,
                                     DocNaklDK_TO.value, IntfMegaCommon.GetBalanceDK(DocNaklDOCDATE.Value,DocNaklDOCTYPE.Value,DocNaklCFO.Value),
                                     0,-1,
                                     DM.GetOperPdvVid(DM.trMainRO, DocNaklGROUP_OPER.Value, DocNaklKOD_OPER.Value));

  {TPDVDocsEditForm.Create(Self, nil, 0, IntfMegaDBCommon.GetBaseID,
   DocNaklRECID.Value, DocNaklBASEID.Value, 'DOC_NAKL',
   DocNaklDOCDATE.Value, DocNaklOPERDATE.Value,
   DocNaklDK_TO.value, IntfMegaCommon.GetBalanceDK(DocNaklDOCDATE.Value,DocNaklDOCTYPE.Value,DocNaklCFO.Value),
   0,
   DM.GetOperPdvVid(DM.trMainRO, DocNaklGROUP_OPER.Value, DocNaklKOD_OPER.Value)).Show;}
end;

procedure TDocNaklForm.aCreatePDVIncDocUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=(PDVOPERSTATUS=-1) or (PDVOPERSTATUS=99);
end;

procedure TDocNaklForm.aSetDocExistsInOfficeExecute(Sender: TObject);
const sQueryText = ' update doc_nakl set PRESENT=:PRESENT where RECID =:DOCRECID and BASEID= :DOCBASEID ';
var frm : TfmDocNalkPervComment;
 s : string;
 q : TMegaQuery;
 Value, r : integer;
begin
  q := TMegaQuery.Create(Self);
  if (DocNakl.FieldByName('PRESENT').AsInteger=-1) or (DocNakl.FieldByName('PRESENT').AsInteger=0) then
   begin
     Value:=1;
     DeleteNaklPerv;
     NaklPervChange :=true;
   end
  else
   begin
     Value:=-1;
     NaklPervChange :=true;
     try
       frm:=TfmDocNalkPervComment.Create(Self);
       s:= frm.GetComment;
       r:= frm.GetReason;
       InsertNaklPerv(s, r);
     finally
       frm.Free;
     end;
   end;
  try
    q.Database:= dm.Money;
    q.Transaction:= Nakl_Transaction;
    q.SQL.Text:= sQueryText;
    q.Params.ByName['DOCRECID'].AsInteger:= DocNaklRECID.AsInteger;
    q.Params.ByName['DOCBASEID'].AsInteger:= DocNaklBASEID.AsInteger;
    q.Params.ByName['PRESENT'].AsInteger:=Value;
    q.ExecQuery;
  finally
   q.Free;
  end;

{  if not (DocNakl.State in [dsEdit, dsInsert]) then DocNakl.Edit;
  if (DocNakl.FieldByName('PRESENT').AsInteger=-1) or
   (DocNakl.FieldByName('PRESENT').AsInteger=0) then
     begin
      DocNakl.FieldByName('PRESENT').AsInteger:=1;
      DeleteNaklPerv;
     end
   else begin
         DocNakl.FieldByName('PRESENT').AsInteger:=-1;
          try
           frm:=TfmDocNalkPervComment.Create(Self);
           s:=frm.GetComment;
           InsertNaklPerv(s);
          finally
           frm.Free;
          end;

        end; }

  DocNakl.Refresh;
  DrawPresentButton;
end;

procedure TDocNaklForm.DrawPresentButton;
begin
  case DocNakl.FieldByName('PRESENT').AsInteger of
    1:
    begin
        ToolButton1.ImageIndex:= 39;
        ToolButton1.Hint:= 'Имеется полностью оформленный оригинал документа.';
    end;
    -1:
    begin
        ToolButton1.ImageIndex := 14;
        //ToolButton1.Hint:= 'Документ отсутствует либо оформлен неправильно!';
        ToolButton1.Hint:=GetNaklPervComment
    end;
    else
    begin
        ToolButton1.ImageIndex := 15;
        ToolButton1.Hint:= 'Наличие оригинального документа не проверено!';
    end;
  end;
end;

procedure TDocNaklForm.PrintActSpisanExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;    //mPrintNakl2
begin
  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.PreparePriceReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction);
    if FDesignReport then
    begin
      lDMRep.frActSpisan.DesignReport;
    end
    else begin
      lDMRep.frActSpisan.PrepareReport;
      lDMRep.frActSpisan.ShowReport;
    end;
  finally
    ldmRep.Free;
  end;
end;

procedure TDocNaklForm.printNaclOFExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
begin
  // проверки на возможность печати
  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);
    if FDesignReport then
    begin
      lDMRep.frNaklF3.DesignReport;
    end
    else begin
      lDMRep.frNaklF3.PrepareReport;
      lDMRep.frNaklF3.PrintPreparedReportDlg;
    end;
  finally
    ldmRep.Free;
  end;
end;

procedure TDocNaklForm.printNaclOFUpdate(Sender: TObject);
begin
//  TAction(Sender).Enabled :=  OPERSTATUS in [iosOFInternalMove,iosOFFromToRoad,iosOFPurchasingWriteOff];
end;

procedure TDocNaklForm.SetDKFrom(aValue: double);
begin
  DocNaklDK_FROM.Value := aValue;
end;

procedure TDocNaklForm.ExecuteGetOperDialog;
begin
  GrOper_CEButtonClick(GrOper_CE,0);
end;

procedure TDocNaklForm.ExecuteDKFromDialog;
begin
  DK_FROM_CEButtonClick(DK_FROM_CE,0);
end;

function TDocNaklForm.GetDKFrom: double;
begin
  Result:= DocNaklDK_FROM.Value;
end;



procedure TDocNaklForm.tbVozvrClick(Sender: TObject);
begin
  CreateVozvrat(0);
end;

procedure TDocNaklForm.ToolButton22Click(Sender: TObject);
var
  q:TMegaQuery;
  trans: TMegaTransaction;
  otsr: integer;
  real_otsr: integer;
const
  cSQL = 'select NEW_OTSR, NEW_REAL_OTSR from CHECK_AKCIA_AND_SET_AKCIA_OTSR(:doc_recid, :doc_baseid)';
begin
//
  q:=nil; trans:=nil;
  otsr:= DocNaklOTSR.AsInteger;
  real_otsr:= DocNaklREAL_OTSR.AsInteger;

  try
    q:=TMegaQuery.Create(Self);

    trans:=TMegaTransaction.Create(Self);
    trans.DefaultDataBase:=IntfDBProvider.GetDB;

    q.DataBase:=IntfDBProvider.GetDB;
    q.Transaction:=trans;

    trans.StartTransaction;
    try
      q.Sql.Text:=cSQL;
      MegaQueryParam(q, 'DOC_RECID').AsInteger:=docnaklrecid.asinteger;
      MegaQueryParam(q, 'DOC_BASEID').AsInteger:=docnaklbaseid.asinteger;
      MegaExecQuery(q);

      if ((q.FieldByNAme('NEW_OTSR').asInteger<>otsr) or (q.FieldByNAme('NEW_REAL_OTSR').asInteger<>real_otsr))
      then
      trans.Commit;
      DocNakl.Refresh;
    except
      trans.Rollback;
      raise;
    end;
  finally
    if(Assigned(q)) then q.Free;
    if(Assigned(trans)) then trans.Free;
  end;

end;

function TDocNaklForm.GetVozvrChP: boolean;
var
  q: TMegaQuery;
begin
  Result:=false;
  q:= TMegaQuery.Create(Self);
  try
    q.Database:= dm.Money;
    q.Transaction:= Nakl_Transaction;
    q.SQL.Text:='select count(dn.RECID) CNT ' +
     'from link_doc_opl ldo ' +
     'INNER join DOC_NAKL dn on (dn.RECID=ldo.OPL_RECID and dn.baseid=ldo.OPL_BASEID) ' +
     'where ldo.PARENT_RECID=:RECID and ldo.PARENT_BASEID=:BASEID and ldo.opl_form_type=1';
    q.Params.ByName['RECID'].AsInteger:=DocNaklRECID.Value;
    q.Params.ByName['BASEID'].AsInteger:=DocNaklBASEID.Value;
    q.ExecQuery;
    Result:= (DocNaklBALANCE_KOD.Value=IntfMegaCommon.GetMainFirmBalanceKod)
     and (DocNaklDK_FROM.Value=IntfMegaCommon.GetPPDK)
     and (q.FieldByName('CNT').AsInteger=0);
  finally
    q.Free;
  end;
end;

procedure TDocNaklForm.Refresh_NaklPos;
begin
   DocPos.Close;
   DocPos.Open;
   Sum.Close;
   Sum.Open;
end;

procedure TDocNaklForm.gPastClick(Sender: TObject); //[gsa:07092020] вставить данные
var
  str:string;
  q:TMegaQuery;
  trans: TMegaTransaction;
begin
  gDNP:=gDocNP.Create;
  str:=gDNP.ReadAtom;
  q:=nil; trans:=nil;

  if str='' then exit;
   if Ask('Друзя, если наклданая новая, сохраните её перед вставкой позици. \n Вставить скопированую позицию ?') = mrYes then
   begin
  // gDNP.WriteAtom('execute procedure DNP_COPYPASTROWS('+DocPosRECID.Text+','+DocPosBASEID.Text+',:InRecId,:InBaseId)');
      try
        q:=TMegaQuery.Create(Self);

        trans:=TMegaTransaction.Create(Self);
        trans.DefaultDataBase:=IntfDBProvider.GetDB;

        q.DataBase:=IntfDBProvider.GetDB;
        q.Transaction:=trans;

        trans.StartTransaction;
        try
          q.Sql.Text:=str;
          MegaQueryParam(q,'InRecId').AsInteger:=DocNaklRECID.asinteger;
          MegaQueryParam(q,'InBaseId').AsInteger:=DocNaklBASEID.asinteger;
          MegaExecQuery(q);
          trans.Commit;

          Refresh_NaklPos;

        except
          trans.Rollback;
          raise;
        end;
       finally
        if(Assigned(q)) then q.Free;
        if(Assigned(trans)) then trans.Free;
       end;
   end;
end;

procedure TDocNaklForm.tbVozvrChPClick(Sender: TObject);
begin
  CreateVozvrat(1);
  tbVozvrChP.Enabled:=GetVozvrChP;
end;

procedure TDocNaklForm.CreateVozvrat(aKod: integer);
{****************************************************************************
*  Создание возвратных накладных                                            *
*   aKod = 0 - из шаблона                                                   *
*   aKod = 1 - накладная ЧП                                                 *
*****************************************************************************}
var
  lSc: integer;
  s: string;
begin
  case aKod of
    0: s:='Создать возвратные накладные из шаблона ?';
    1: s:='Создать возвратную накладную ?'
  end;
  if not (Ask(s) = mrYes) then exit;
  lSc:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
    if DocNakl.State in [dsEdit, dsInsert] then DocNakl.Post;
    if DocPos.State in [dsEdit, dsInsert] then DocPos.Post;
    qrEnakl.Close;
    case aKod of
      0: qrEnakl.SelectSQL.Text:='select * from VZ_CREATE('+
       DocNaklRECID.AsString+','+
       DocNaklBASEID.AsString+','+
       replacestr(DocNaklDK_FROM.AsString,',','.')+','+
       DocNaklGROUP_OPER.AsString+','+
       DocNaklKOD_OPER.AsString+','+
       quotedstr(DocNaklOPERDATE.AsString)+')';
      1:qrEnakl.SelectSQL.Text:='select * from VZ_CREATE_300('+
       DocNaklRECID.AsString+','+
       DocNaklBASEID.AsString+','+
       'null, null)';
    end;
    try
      qrEnakl.Open;
      if Ask('Сохранить изменения ?') = mrYes then
      begin
        if Nakl_Transaction.InTransaction then Nakl_Transaction.CommitRetaining;
          Refresh_NaklPos;
      end
      else begin
        if Nakl_Transaction.InTransaction then Nakl_Transaction.RollbackRetaining;
        Refresh_NaklPos;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(pchar(E.Message), 'Ошибка !', MB_OK + MB_ICONERROR);
        if Nakl_Transaction.InTransaction then Nakl_Transaction.RollbackRetaining;
        Refresh_NaklPos;
      end;
    end;
  finally
    Screen.Cursor:=lSc;
  end;
end;

procedure TDocNaklForm.actPrintTTN2Execute(Sender: TObject);
var
  ldm: TdmTTNDocRep;
  i: integer;
  lDestList: string;
  lTTNNumCopies: integer;
  rep:TfrReport;
  FDebug:boolean;
begin
  if (OPERSTATUS<>iosReturnClient) then
  begin
      Application.MessageBox('Печать ТТН возможно только для операций со статусом "Возврат клиент"', 'Внимание !', MB_OK + MB_ICONWARNING);
      Exit;
  end;
  //FPrinting:= True;
  try
   
    ldm:=TdmTTNDocRep.Create(self);
    try
      FDebug := (IsRussia AND (IntfMegaAccessManager.GetUserRole = 'DEVELOPER'));
      try
        rep:=ldm.GetSingleTTNReport(
          -999,
          0,
          DocNaklRECID.asInteger,
          DocNaklBASEID.asInteger,
          1,
          nil
        );
{ ----------------- Added by Lion in 24.04.2008 ---------------- }
        //CorrectReport(rep);
{ ----------- End of addition by Lion in 24.04.2008 ----------- }
       if not FDebug then
        begin
          rep.PrepareReport;
          rep.ShowReport;
        end
        else
          rep.DesignReport;
      finally
        ldm.AfterPrepareTTNForNakl;
      end;
    finally
      ldm.Free;
    end;
//    SendDataToOfficeToPSETrip(fdsTTnaklRECID.AsInteger, fdsTTnaklBASEID.AsInteger, DM.Money, trans, self);
  finally
    //FPrinting:= False;
  end;
end;


procedure TDocNaklForm.actPrintTTNExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
begin
  CheckSelfExportState;
  // проверки на возможность печати
  if  not AllowAll
  and (DocNaklSTATE.Value<>idsBug)
  and (DocNaklSTATE.Value<>idsKassa)
  and (DocNaklDK_TO.AsFloat<>ddkEndUser)
  and (not intfMegaDBCommon.IsOffice)
  and (DocNaklSTATE.Value<>idsFromOffice)
  and (OPERSTATUS=10) then
  begin
    exit;
  end;
  if (DocNaklSTATE.Value= idsPrepare)
  or (DocNaklSTATE.Value= idsToOffice) then
  begin
    exit;
  end;

  //-- тоже проверка
  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then
  begin
    DocNakl.Edit;
    DocNaklSTATE.Value := idsInternal;
  end;

  //
  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);

    frVariables.Variable['HidePriceAndCost']:= True;
    frVariables.Variable['TTN']:= False;

    if OPERSTATUS=10 then
    begin
      frVariables.Variable['IsOtv']:= True;
      frVariables.Variable['HidePriceAndCost']:= True;
    end
    else begin
      frVariables.Variable['IsOtv']:= False;
    end;

    if FDesignReport then
    begin
      lDMRep.NaklTTNReport.DesignReport;
    end
    else begin
      lDMRep.NaklTTNReport.PrepareReport;
      lDMRep.NaklTTNReport.PrintPreparedReportDlg;
    end;

  finally
    ldmRep.Free;
  end;
  //--
end;


function TDocNaklForm.CheckSubDiller(aDk: double): boolean;
{ Проверка субдиллеров }
begin
  Result:=false;
end;

procedure TDocNaklForm.SetDocDate(aDate: TDateTime);
begin
  DocNaklDOCDATE.AsDateTime:= aDate;
end;

procedure TDocNaklForm.SetOperDate(aDate: TDateTime);
begin
  DocNaklOPERDATE.AsDateTime:= aDate;
end;

procedure TDocNaklForm.SetCFO(aCFO: integer);
begin
  DocNaklCFO.AsInteger:= aCFO;

end;

procedure TDocNaklForm.SetDocNumber(aNumber: integer);
begin
  DocNaklDOCNUMBER.AsInteger:= aNumber;
end;

procedure TDocNaklForm.GetStateSelfExport;
begin
//
    try
     qSelfNakl.close;
     qSelfNakl.SQL.Text:= 'select state, state_text from get_nakl_state_self_export(:nakl_recid, :nakl_baseid)';
     qSelfNakl.ParamByName('NAKL_RECID').value:=  DocNaklRECID.value;
     qSelfNakl.ParamByName('NAKL_BASEID').value:=  DocNaklBASEID.value;
     qSelfNakl.ExecQuery;
     cxLabelSelfExport.caption:= qSelfNakl.fieldByname('state_text').asString;
     SelfExportState:= qSelfNakl.fieldByname('state').asInteger;
    finally
    end;
end;

function TDocNaklForm.GetSum: double;
begin
  Result:= SumSUMMARY.Value;
end;

procedure TDocNaklForm.InitDeliveryTimeFromNaklData;
const
  sQueryText =
    ' select '+
    '   dl.deliv_time, '#13#10  +
    '   sto.desireddeliverytime '#13#10 +
    ' from delivery_location dl '+
    ' left join sprav_trade_outlet sto on (sto.recid = dl.outlet_recid and sto.baseid = dl.outlet_baseid) '+
    ' where '+
    '     dl.formtype = :formtype '+
    ' and dl.baseid = :baseid '+
    ' and dl.docrecno = :docrecno '+
    ' ';

var
  q: TMegaQuery;
begin
  q:= TMegaQuery.Create(Self);
  try
    q.Database:= dm.Money;
    q.Transaction:= Nakl_Transaction;
    q.SQL.Text:= sQueryText;
    q.Params.ByName['FORMTYPE'].AsInteger:= DocNaklDOC_INHERITED.AsInteger;
    q.Params.ByName['baseid'].AsInteger:= DocNaklBASEID.AsInteger;
    q.Params.ByName['docrecno'].AsInteger:= DocNaklRECID.AsInteger;

    q.ExecQuery;

    if q.FieldByName('deliv_time').AsString ='' then
      if q.FieldByName('desireddeliverytime').asString = '' then edDelivTime.Text := 'Любое'
       else edDelivTime.Text := GetDecodeDeliveryTime( q.FieldByName('desireddeliverytime').asString)
     else edDelivTime.Text := GetDecodeDeliveryTime(q.FieldByName('deliv_time').AsString);

  finally
    q.Free;
  end;
end;

function TDocNaklForm.InitializeComPort2: boolean;
var
  Ecr: Variant;
  EcrModel, EcrVers: WideString;
  wsSerilaNumber:widestring;
  ncom : integer;
  vcom : integer;
begin
  FP := CreateOleObject('ArtSoft.FiscalPrinter');
  ncom:=strtoint(aIniParams.GetIniParam('KASSA','COM')) ; // номер СОМ-порта
  vcom:=strtoint(aIniParams.GetIniParam('KASSA','RATE')); // скорость обмена

  FP.start(protokol); //это протокл датекс
  //FP.OpenPort('COM'+aIniParams.GetIniParam('KASSA','COM'), 3);
  FP.OpenPort('COM'+aIniParams.GetIniParam('KASSA','COM'), 0);
 // FP.OpenPort(ncom, vcom);
  if fp.LastError=0 then
     result:=true
  else
  begin
     //ShowErrors;
     result:=false;
  end;

end;

procedure TDocNaklForm.FillShowCaseExecute(Sender: TObject);
var
  lSc: integer;
begin
  if Application.MessageBox('Сформировать накладную на витрину ?','Внимание', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = ID_NO then Exit;
  lSc:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
    Query.Close;
    Query.SQL.Text := 'EXECUTE PROCEDURE FILLNAKLSHOWCASE(:RECID, :BASEID)';
    Query.Params[0].asInteger := DocNaklRECID.Value;
    Query.Params[1].asInteger := DocNaklBASEID.Value;
    Query.ExecQuery;
  finally
    {$ifdef USE_FIB6}
      DocPos.FullRefresh;
    {$endif}
    DocNakl.Refresh;
    DocNaklAfterPost(DocNakl);
    DocNakl.First;
    Screen.Cursor:=lSc;
  end;
end;

//Шестаков Г.С. - Генерация номера документа
function TDocNaklForm.GetNewDocNaklNumber: integer;
var q1,q2:TMegaQuery;
    MaxNumber,BeforeMaxNumber:integer;
begin
   q1:=TMegaQuery.Create(self);
   q1.Database:=dm.Money;
   q1.Transaction:=Nakl_Transaction;

   q2:=TMegaQuery.Create(self);
   q2.Database:=dm.Money;
   q2.Transaction:=Nakl_Transaction;
   try
    q1.SQL.Text :=
    ' SELECT Max(DOCNUMBER) FROM '+MainTableName+
    ' WHERE DOCTYPE = ''' + FDSDocType.FieldDocType.AsString+''''+
    ' AND   EXTRACT(YEAR FROM OPERDATE) = ' + IntToStr(ExtractYear(FOPERDATE))+
    ' AND   OPERDATE > ''today''-7';
    q1.ExecQuery;
    MaxNumber:=  q1.Fields[0].AsInteger;

    q2.SQL.Text :=
    ' SELECT Max(DOCNUMBER) FROM '+MainTableName+
    ' WHERE DOCTYPE = ''' + FDSDocType.FieldDocType.AsString+''''+
    ' AND   EXTRACT(YEAR FROM OPERDATE) = ' + IntToStr(ExtractYear(FOPERDATE))+
    ' AND   OPERDATE > ''today''-7 '+
    ' AND DOCNUMBER< '+IntToStr(MaxNumber-5000);
    q2.ExecQuery;
    BeforeMaxNumber:=  q2.Fields[0].AsInteger;
    if (MaxNumber-BeforeMaxNumber)>10000 then
      result:=BeforeMaxNumber+1
    else
      result:=MaxNumber+1;
   finally
     q1.Close;
     q2.Close;
     q1.free;
     q2.free;
   end;
end;

procedure TDocNaklForm.InsertNaklPerv(msg: string; r: integer);
const sQueryText = 'INSERT INTO DOC_NAKL_PERV( DOCRECID, DOCBASEID, BASEID, DESCRIPTION, USERNAME, TABLE_NAME, reason ) VALUES( :DOCRECID, :DOCBASEID, :BASEID, :DESCRIPTION, :USERNAME, ''DOC_NAKL'', :r )';
var q : TMegaQuery;
begin
  q := TMegaQuery.Create(Self);
  try
    q.Database:= dm.Money;
    q.Transaction:= Nakl_Transaction;
    q.SQL.Text:= sQueryText;
    q.Params.ByName['DOCRECID'].AsInteger:= DocNaklRECID.AsInteger;
    q.Params.ByName['DOCBASEID'].AsInteger:= DocNaklBASEID.AsInteger;
    q.Params.ByName['BASEID'].AsInteger:= DocNaklBASEID.AsInteger;
    q.Params.ByName['DESCRIPTION'].AsString:= msg;
    q.Params.ByName['USERNAME'].AsVariant:= NULL;
    q.Params.ByName['r'].AsInteger:= r;
    q.ExecQuery;
  finally
   q.Free;
  end;
end;
procedure TDocNaklForm.DeleteNaklPerv;
const
//  sQueryText = 'DELETE FROM DOC_NAKL_PERV WHERE DOCBASEID = :DOCBASEID AND DOCRECID = :DOCRECID AND BASEID = :BASEID'+
  sQueryText = 'DELETE FROM DOC_NAKL_PERV WHERE DOCBASEID = :DOCBASEID AND DOCRECID = :DOCRECID '+
               ' and TABLE_NAME=''DOC_NAKL'' and coalesce(exist_return, 0) <> 1';
var q : TMegaQuery;
begin
  q := TMegaQuery.Create(Self);
  try
    q.Database:= dm.Money;
    q.Transaction:= Nakl_Transaction;
    q.SQL.Text:= sQueryText;
    q.Params.ByName['DOCRECID'].AsInteger:= DocNaklRECID.AsInteger;
    q.Params.ByName['DOCBASEID'].AsInteger:= DocNaklBASEID.AsInteger;
//    q.Params.ByName['BASEID'].AsInteger:= DocNaklBASEID.AsInteger;
    q.ExecQuery;
  finally
   q.Free;
  end;
end;
function TDocNaklForm.GetNaklPervComment : string;
const sQueryText = 'select DESCRIPTION from DOC_NAKL_PERV WHERE DOCBASEID = :DOCBASEID AND DOCRECID = :DOCRECID'+
                   ' and TABLE_NAME=''DOC_NAKL''';
var q : TMegaQuery;
begin
  q := TMegaQuery.Create(Self);
  try
    q.Database:= dm.Money;
    q.Transaction:= Nakl_Transaction;
    q.SQL.Text:= sQueryText;
    q.Params.ByName['DOCRECID'].AsInteger:= DocNaklRECID.AsInteger;
    q.Params.ByName['DOCBASEID'].AsInteger:= DocNaklBASEID.AsInteger;
    q.ExecQuery;
    Result := q.Fields[0].AsString;
  finally
   q.Free;
  end;

end;


procedure TDocNaklForm.SetDKC(aValue: double);
begin
  DocNaklDK_C.Value := aValue;
end;

procedure TDocNaklForm.CalcColFordocNaklPosRecord;
var
  aBASEIDPart : string;
  aSelByBaseID : boolean;
begin
  // DocNaklPos.state должен быть dsEdit
  // считаем самую похожую колонку - btnShowCol.checked
  aSelByBaseID := IntfMegaDBCommon.IsOffice  or (IntfMegaDBCommon.GetParam('WORK_VED', '0')='1');

  if btnShowCol.Checked then
  begin
    Query3.Close;
    if aSelByBaseID then
      aBASEIDPart :=
        '  AND pc.BASEID = coalesce(             '#13#10+
        '        (SELECT BASEID FROM view_price_col pc'#13#10+
        '         WHERE pc.KOD_MATER=:KOD_MATER  '#13#10+
        '           AND pc.BASEID = :BASEID      '#13#10+
        '        ),0)                            '#13#10
      else
      aBASEIDPart := '';
    {Query3.SQL.Text:=
      'SELECT pc.COL, pc.PRICE                 '#13#10+
      'FROM view_price_col pc                       '#13#10+
      'WHERE pc.KOD_MATER=:KOD_MATER           '#13#10+
      aBASEIDPart +   }
      Query3.SQL.Text:= ' select  pc.COL, pc.PRICE from  SELECT_PRICE_COL(''today'',:kod_mater,null,:baseid,null,1, :BALANCE) pc '+
      '  where PRICE between :PRICE1 and :PRICE2 ';

    Query3.ParamByName('KOD_MATER').AsDouble:=DocPosKOD_MATER.AsFloat;
    Query3.ParamByName('PRICE1').AsDouble:=DocPosPRICEWPDV.AsFloat-0.0001;
    Query3.ParamByName('PRICE2').AsDouble:=DocPosPRICEWPDV.AsFloat+0.0001;
    Query3.ParamByName('BALANCE').AsInteger:=DocNaklBALANCE_KOD.asInteger;
    Query3.ParamByName('BASEID').AsInteger:=DocPosBASEID.AsInteger;
    Query3.ExecQuery;
    DocPosCOL.Value:=Query3.FieldByName('COL').AsInteger;
    Query3.Close;
  end;

  // сравниваю с выбранной колонкой - btnCheckWithCol.checked
  if btnCheckWithCol.checked then
  begin
    Query3.Close;
    if aSelByBaseID then
      aBASEIDPart :=
        '  AND pc.BASEID = coalesce(             '#13#10+
        '        (SELECT BASEID FROM view_price_col pc'#13#10+
        '         WHERE pc.KOD_MATER=:KOD_MATER  '#13#10+
        '           AND pc.COL = :COL            '#13#10+
        '           AND pc.BASEID = :BASEID      '#13#10+
        '        ),0)                            '#13#10
      else
      aBASEIDPart := '';
   { Query3.SQL.Text:=
      'SELECT pc.COL, pc.PRICE                 '#13#10+
      'FROM view_price_col pc                       '#13#10+
      'WHERE pc.KOD_MATER=:KOD_MATER           '#13#10+
      '  AND pc.COL = :COL                     '#13#10+
      aBASEIDPart +
      '  AND PRICE between :PRICE1 and :PRICE2 ';  }
      Query3.SQL.Text:= ' select  pc.COL, pc.PRICE from  SELECT_PRICE_COL(''today'',:kod_mater,:col,:baseid,null,1, :BALANCE) pc '+
      ' where PRICE between :PRICE1 and :PRICE2 ';


    Query3.ParamByName('KOD_MATER').AsDouble:=DocPosKOD_MATER.AsFloat;
    Query3.ParamByName('PRICE1').AsDouble:=DocPosPRICEWPDV.AsFloat-0.0001;
    Query3.ParamByName('PRICE2').AsDouble:=DocPosPRICEWPDV.AsFloat+0.0001;
    Query3.ParamByName('COL').AsInteger:=aCheckWithColNumber;
    Query3.ParamByName('BALANCE').AsInteger:=liUtils.iif(isAlphaCol,IntfMegaCommon.GetCurActiveMainBalance,DocNaklBALANCE_KOD.asInteger);

    //if aSelByBaseID then
    Query3.ParamByName('BASEID').AsInteger:=DocPosBASEID.AsInteger;
    Query3.ExecQuery;
    DocPosCOL_CHECK_WITH.Value:= (not Query3.FieldByName('COL').isNULL) and
         (Query3.FieldByName('COL').AsInteger = aCheckWithColNumber);
    Query3.Close;
  end;

end;

function TDocNaklForm.CanChangeCFO: boolean;
const SqlTxt='select can_change from can_change_cfo_on_doc(:groper,:oper)';
var  qCanChangeCFO:TMegaQuery;
begin
   result:=false;
   qCanChangeCFO:=TMegaQuery.Create(self);
   qCanChangeCFO.Database:=DM.Money;
   qCanChangeCFO.Transaction:=Nakl_Transaction;
   qCanChangeCFO.SQL.text:=SqlTxt;
   qCanChangeCFO.Params.ByName['groper'].AsInteger:=DocNaklGROUP_OPER.AsInteger;
   qCanChangeCFO.Params.ByName['oper'].AsInteger:=DocNaklKOD_OPER.AsInteger;
   try
      qCanChangeCFO.ExecQuery;
      if qCanChangeCFO.FieldByName('can_change').asInteger=1 then result:=true;
      qCanChangeCFO.Close;
      qCanChangeCFO.SQL.Text:='select count(kod_cfo) cnt from SPRAV_CFO_VIEW';
      qCanChangeCFO.ExecQuery;
      if qCanChangeCFO.FieldByName('cnt').asInteger<=1 then result:=false;
      qCanChangeCFO.Close;
   finally
      qCanChangeCFO.free;
   end;
end;

procedure TDocNaklForm.actScetFactPrnExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
begin
  ldmRep:= TdmPrintNakl2.Create(Self);
  FDesignReport := True;
  try
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);
    if FDesignReport then
    begin
      lDMRep.frScFact.DesignReport;
    end
    else
    begin
      lDMRep.frScFact.PrepareReport;
      lDMRep.frScFact.PrintPreparedReportDlg;
    end;

  finally
    ldmRep.Free;
  end;
  //--
end;

procedure TDocNaklForm.actCSVExecute(Sender: TObject);
var
   PathFile,email,Subject,s:string;
   f:TextFile;
begin
   Query.Close;
   Query.SQL.Text := 'select sd_from.shortname_dk,sd_from.kod_dk,dn.docnumber,sto.name_op,dn.docdate '#13#10+
                     ' ,iif (dn.balance_kod=300,11,10) form_opl,pgdd.doc_number,sm.local_kod '#13#10+
                     '  ,dnp.kolich,(dnp.summa1/dnp.kolich * (1+spdv.pdvgroup_stavka/100)) price_with_nds '#13#10+
                     '  ,sm.name_mater,sm.ed_izm,(dnp.summa1/dnp.kolich) price_without_nds                 '#13#10+
                     '  ,dnp.summa1 summa_without_nds,(dnp.summa1* (1+spdv.pdvgroup_stavka/100)) summa_with_NDS   '#13#10+
                     '  ,(dnp.summa1* (spdv.pdvgroup_stavka/100)) NDS,sm.kod_ean,ocp.email                      '#13#10+
                    ' from doc_nakl dn                                                                           '#13#10+
                    ' left join doc_nakl_pos dnp on (dnp.docrecno=dn.recid and dnp.baseid=dn.baseid)            '#13#10+
                    ' left join sprav_dk sd_from on (sd_from.kod_dk=dn.dk_from)                                  '#13#10+
                    ' LEFT JOIN DELIVERY_LOCATION DL ON (DL.FORMTYPE=1 AND DL.BASEID=dn.BASEID AND DL.DOCRECNO=dn.RECID) '#13#10+
                    ' LEFT join SPRAV_TRADE_OUTLET sto on (sto.RECID = DL.OUTLET_RECID and sto.BASEID = DL.OUTLET_BASEID) '#13#10+
                    ' left join PROC_GET_DK_DOCUMENT(dn.DK_TO,dn.OPERDATE,100,dl.outlet_recid,dl.outlet_baseid,1) pgdd on (1=1) '#13#10+
                    ' left join sprav_mater sm on (sm.kod_mater=dnp.kod_mater)                                                   '#13#10+
                    ' left join group_mater gm on (gm.group_mater=sm.group_mater)                                                '#13#10+
                    ' left join sprav_pdvgroup spdv on (spdv.pdvgroup_kod=''A'')                                                    '#13#10+
                    ' left join outlet_contact_person ocp on (ocp.outlet_recid=DL.OUTLET_RECID and ocp.outlet_baseid=DL.OUTLET_BASEID and ocp.duties=2)  '#13#10+
                    ' where dn.recid=:recid and dn.baseid=:baseid';
   Query.Params.ByName['RECID'].Value := DocNaklRECID.Value;
   Query.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
   Query.ExecQuery;
 //  Subject:='Подтверждение поставки '+Query.FieldByName('shortname_dk').AsString;
 //  email:=Query.FieldByName('email').AsString;
//   PathFile:=TempDir+'УДК_'+Query.FieldByName('kod_dk').AsString+'_'+DocNaklDOCNUMBER.AsString+'.csv';
   AssignFile(f,PathFile);
   Rewrite(f);
   Writeln(f,Query.FieldByName('shortname_dk').AsString+';'+Query.FieldByName('kod_dk').AsString+';'+Query.FieldByName('docnumber').AsString+
   ';'+Query.FieldByName('name_op').AsString+';14;RN;'+FormatDateTime('dd.mm.yyyy',Query.FieldByName('docdate').AsDateTime)+';'+
    Query.FieldByName('doc_number').AsString+';'+Query.FieldByName('form_opl').AsString+';');
    while not Query.Eof do
    begin
     Writeln(f,Query.FieldByName('local_kod').AsString+';'+Query.FieldByName('kolich').AsString+';'+ReplaceStr(Query.FieldByName('price_with_nds').AsString,',','.')+';'+
               Query.FieldByName('name_mater').AsString+';1;'+Query.FieldByName('ed_izm').AsString+';'+ReplaceStr(Query.FieldByName('price_without_nds').AsString,',','.')+';'+
               ReplaceStr(Query.FieldByName('summa_without_nds').AsString,',','.')+';'+ReplaceStr(Query.FieldByName('summa_with_NDS').AsString,',','.')+';'+
               ReplaceStr(Query.FieldByName('NDS').AsString,',','.')+';'+Query.FieldByName('kod_ean').AsString);

     //s:=Query.FieldByName('outlet_id').AsString+';"'+ReplaceStr(qr.FieldByName('NAME_DK').AsString,'"','""')+'('+
     //   ReplaceStr(qr.FieldByName('NAME').AsString,'"','""')+')";"'+ReplaceStr(qr.FieldByName('address').AsString,'"','""')+
     //   '";'+qr.FieldByName('category').AsString;
     //Writeln(f,s);
     Query.Next;
    end;
  Query.Close;
  CloseFile(f);

   frmSendMail:=TfrmSendMail.Create(Application);
   frmSendMail.SendMailMessage(email,'',Subject,'',PathFile,'[Ваша накладная '+DocNaklDOCNUMBER.AsString+' была прикреплена  к письму]',true,'','');
   frmSendMail.show;

end;

procedure TDocNaklForm.actNoteExecute(Sender: TObject);
var
   lSc:integer;
   ReportPageIndex : Integer;
begin
     lSc:=Screen.Cursor;
     Screen.Cursor:=crHourGlass;
     //Печать писем для Римик
     //Письмо для Метро
      if (pos('32049199',FloatToStr(DocNaklDK_TO.AsFloat))<>0)
      or (pos('32049199',FloatToStr(DocNaklDK_FROM.AsFloat))<>0)
      or (pos('35030945',FloatToStr(DocNaklDK_TO.AsFloat))<>0)
      or (pos('35030945',FloatToStr(DocNaklDK_FROM.AsFloat))<>0)
      or (pos('25288083',FloatToStr(DocNaklDK_TO.AsFloat))<>0)
      or (pos('25288083',FloatToStr(DocNaklDK_FROM.AsFloat))<>0) then//Код ОКПО МЕТРО
      //25288083 билла
      begin
        {dsNote_m.Close;
        dsNote_m.Params.ByName['zmc_recid'].AsInteger:=DocNaklRECID.AsInteger;
        dsNote_m.Params.ByName['zmc_baseid'].AsInteger:=DocNaklBASEID.AsInteger;
        dsNote_m.Open;
        dmMegaReports.SetFrxDataSet(dsNote_m,'NOTE') ; }

        if pos('ЗМЦ',DocNaklDOCTYPE.AsString)<>0 then
          begin
            // корректировка по цене
            if ((pos('35030945',FloatToStr(DocNaklDK_TO.AsFloat))<>0)
                or (pos('35030945',FloatToStr(DocNaklDK_FROM.AsFloat))<>0)
                ) then
              ReportPageIndex := 4
            else if ((pos('25288083',FloatToStr(DocNaklDK_FROM.AsFloat))<>0)
                or (pos('25288083',FloatToStr(DocNaklDK_TO.AsFloat))<>0)) then
              ReportPageIndex := 5
            else
              ReportPageIndex := 2;
//            frNote_met.ShowReport;
          end
         else
          begin
            // корректировка по колличеству
            if ((pos('35030945',FloatToStr(DocNaklDK_TO.AsFloat))<>0)
                or (pos('35030945',FloatToStr(DocNaklDK_FROM.AsFloat))<>0)
                or (pos('25288083',FloatToStr(DocNaklDK_FROM.AsFloat))<>0)
                or (pos('25288083',FloatToStr(DocNaklDK_TO.AsFloat))<>0)
                
                ) then
              ReportPageIndex := 3
            else
              ReportPageIndex := 1;
//            frNote_met1.ShowReport;
          end;

        If FDesignReport Then
          dmMegaReports.MyDesign(27, Now(), IntToStr(ReportPageIndex)+ ','+IntToStr(DM.DocListSource.DataSet.FieldByName('RECID').AsInteger)+','+IntToStr(DM.DocListSource.DataSet.FieldByName('BASEID').AsInteger))
         Else
          dmMegaReports.MyShow(27, Now(), IntToStr(ReportPageIndex)+ ','+IntToStr(DM.DocListSource.DataSet.FieldByName('RECID').AsInteger)+','+IntToStr(DM.DocListSource.DataSet.FieldByName('BASEID').AsInteger));

      end
      //Письмо для Биллы и остальных
      else
      //if (pos('25288083',FloatToStr(dm.DocListDK_TO.AsFloat))<>0) then
      if pos('ЗМЦ',DocNaklDOCTYPE.AsString)<>0 then
      begin
         If FDesignReport Then
          dmMegaReports.MyDesign(62, DocNaklOPERDATE.Value, [DocNaklRECID.AsInteger,DocNaklBASEID.AsInteger],2)
         Else
          dmMegaReports.MyShow(62, DocNaklOPERDATE.Value, [DocNaklRECID.AsInteger,DocNaklBASEID.AsInteger],2);
      end;
      Screen.Cursor:=lSc;
end;

procedure TDocNaklForm.ActPasteFromExcelExecute(Sender: TObject);
var
  Buf: TStringList;
  i,iCntErr: integer;
  s,s1: string;
  lKod_, lSumma_, lKoich_, lSummaOO1, lSummaOO2: double;
  lFPost:boolean;
  lDt:Variant; //TDateTime;
  sInvoice: string;
begin
  iCntErr:=0;
  StartWait;
  Buf:=TStringList.Create;
  lFPost:=DocPos.ConfirmPost;
  DocPos.ConfirmPost:=False;
  try
      DocPos.DisableControls;
      if not Clipboard.HasFormat(CF_TEXT) then
      begin
         Application.MessageBox('Буфер обмена не содержит текст !','Ошибка!', MB_ICONERROR);
         exit;
      end;
      Buf.Text:=Clipboard.asText;
      for i:=0 to Buf.Count-1 do
      begin
        s:=trim(Buf.Strings[i])+#09;
        s1:=Copy2SymbDel(s,#09); // код ценности
        System.delete(s,1,1);
        lKod_:=strtofloatdef(s1,0);
        s1:=Copy2SymbDel(s,#09); // сумма
        System.delete(s,1,1);
        lSumma_:=strtofloatdef(s1,0);

        s1:=Copy2SymbDel(s,#09); // КОЛИЧЕСТВО
        lKoich_:=strtofloatdef(s1,0);
        if lKoich_=0 then lKoich_:=1;

        lSummaOO1:=0;lSummaOO2:=0;
        sInvoice:='';
        lDt:=null;
        {IF s<>'' then System.delete(s,1,1);
        IF s<>'' then begin
          s1:=Copy2SymbDel(s,#09); //
          lSummaOO1:=strtofloatdef(s1,0);
        end;
        IF s<>'' then System.delete(s,1,1);
        IF s<>'' then begin
          s1:=Copy2SymbDel(s,#09); //
          lSummaOO2:=strtofloatdef(s1,0);
        end;  }
        IF s<>'' then System.delete(s,1,1);
        IF s<>'' then begin
          s1:=Copy2SymbDel(s,#09); //
          lDt:=strtoDateEx(s1);
        end;
        IF s<>'' then System.delete(s,1,1);
        IF s<>'' then begin
          s1:=Copy2SymbDel(s,#09); //
          sInvoice:=s1;
        end;


        if (lKod_<>0)and((lSumma_<>0)or (IntfMegaDBCommon.GetBaseID=216)) then
        begin
          if DocPos.State in [dsinsert,dsEdit] then DocPos.Cancel;
          DocPos.Insert;
          DocPosKOD_MATER.Value:=lKod_;
          DocPosKOLICH.Value   :=lKoich_;
          if (lKoich_>0)and(lSumma_=-1)  then
            if DocPosPrice1.AsFloat>0 then
              lSumma_:= lKoich_ * DocPosPrice1.AsFloat;

          DocPosSUMMA.Value    :=lSumma_;
          DocPosSUMMA1.Value   :=lSumma_;
          DocPosSUMMA_DUTY.Value          :=lSummaOO1;
          DocPosSUMMA_AMOUNT_TRAFIC.Value :=lSummaOO2;
          if sInvoice <> '' then
           DocPosINVOCE_NUMBER.value := sInvoice;
          if lDt<>NUll then
           DocPosDATE_ROZLIVA.value:= lDt;
          try
            DocPos.Post;
          except
            if DocPos.State in [dsinsert,dsEdit] then DocPos.Cancel;
            inc(iCntErr);
          end;
        end;
      end;
  finally
    DocPos.ConfirmPost:=lFPost;
    i:=Buf.Count;
    Buf.Free;
    DocPos.EnableControls;
    StopWait;
  end;
  Application.MessageBox(pchar('обработано '+intToStr(i)+' строк. ошибок при вскавке '+intToStr(iCntErr)+'.'),
                         'операция завершена');
end;

procedure TDocNaklForm.ActPasteFromExcelUpdate(Sender: TObject);
begin // только для Приобретение/списание Осн.Фондов
   TAction(Sender).Enabled:= (OPERSTATUS = iosOFPurchasingWriteOff)or
                             (IntfMegaDBCommon.GetBaseID=216);
end;


procedure TDocNaklForm.actTestReportLExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
begin
//
ShowMessage('Shift+Ctrl+F5');
try
  ldmRep:= TdmPrintNakl2.Create(Self);
  ldmRep.LoadFrxp;
finally
     ldmRep.Free;
end;

end;

procedure TDocNaklForm.actTransferExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
begin
  ldmRep:= TdmPrintNakl2.Create(Self);
//  FDesignReport := True;
  try
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);
    if FDesignReport then
    begin
      lDMRep.frActTransfer.DesignReport;
    end
    else
    begin
      lDMRep.frActTransfer.PrepareReport;
      lDMRep.frActTransfer.PrintPreparedReportDlg;
    end;

  finally
    ldmRep.Free;
  end;


end;

procedure TDocNaklForm.actTransferStoreExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(4610, Now(), DocNaklRECID.asString+','+DocNaklBASEID.asString);

end;

procedure TDocNaklForm.actPrintGiftExecute(Sender: TObject);
begin
   dmMegaReports.MyPrint(15,DocNaklOperdate.Value,DocNaklRecID.AsString+','+DocNaklBaseID.AsString+','+liUtils.iif(GetProvStatus in [iosReturnToProvider, iosReturnFromClient],'true','false'));
end;

function  TDocNaklForm.GetProvStatus : integer;
begin
  if FProvStatus=-1 then
  begin
    //получение статуса операции
    Query.Close;
    Query.SQL.Text:='select iif(sos.parent_status is null,so.status, parent_status) from sprav_oper so left join sprav_oper_status sos on (sos.status=so.status)  where  group_oper = '+
    IntToStr(Source.DataSet.FieldByName('GROUP_OPER').AsInteger)+' and kod_oper ='+
    IntToStr(Source.DataSet.FieldByName('KOD_OPER').AsInteger);
    Query.ExecQuery;
    FProvStatus:= Query.Fields[0].AsInteger;
 end;
 Result:=FProvStatus;
end;

function TDocNaklForm.Round2(x: double): double;
var
  x1: double;
begin
  Result:=trunc(x*100);
  x1:=x*100-trunc(x*100);
  if (x1<>0)then
  if Round2(abs(x1)*100)>=50 then
  begin
    if x<0 then Result:=Result-1 else Result:=Result+1;
  end;
  Result:=Result*0.01
end;

procedure TDocNaklForm.RxDBComboEdit1ButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  DocNakl.Edit;
  GetGtd(DocNaklRECID, DocNaklBASEID, DocNaklDG_RECID,
  DocNaklDG_BASEID, DocNaklDG_DOCNUMBER, DocNaklDG_NOTES, DocNaklLDO_RECID);
end;

procedure TDocNaklForm.RxDBComboEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    if VarToInt(DocNaklDG_RECID.Value) = 0 then Exit;

    if Ask('Отвязать ГТД от накладной?') <> idYes then Exit;

    CheckAllowChangeByNaklState;

    trGTD.StartTransaction;
    try
      fbExecQuery(trGTD,
      'delete from link_doc_opl ldo where ldo.parent_recid = %d AND parent_BASEID = %d AND OPL_FORM_TYPE = 7',
      [DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger]
      );

      fbExecQuery(trGTD,
      'delete from link_doc ldo where ldo.parent_recid = %d AND parent_BASEID = %d AND DOC_FORM_TYPE = 7 and ldo.PARENT_FORM_TYPE = 1',
      [DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger]
      );

      if IsPartUchet3 then
        fbExecQuery(trGTD,
          'update DOC_PARTY dp'#13#10+
          'set dp.GTD_RECID = null,'#13#10+
          '    dp.GTD_BASEID = null'#13#10+
          'where'#13#10+
          '  EXISTS'#13#10+
          '  (select dnp.recid from DOC_NAKL_POS dnp'#13#10+
          '   where dnp.docrecno = %d and dnp.baseid = %d AND'#13#10+
          '     dnp.PARTY=dp.NUMBER)',
          [DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger]
        );

      trGTD.Commit;
    except
      trGTD.Rollback;
      raise;
    end;

    DocNakl.Refresh;
//    DocNakl.Edit;
//    DocNaklDG_RECID.Value:= Null;
//    DocNaklDG_BASEID.Value:= Null;
//    DocNaklDG_DOCNUMBER.Value:= Null;
//    DocNaklDG_NOTES.Value:= Null;
//    DocNakl.Post;

  end;
end;

procedure TDocNaklForm.actPrintSpravBExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
begin
  // проверки на возможность печати
  // Без проверок - всё равно работает только для России
  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then
  begin
    DocNakl.Edit;
    DocNaklSTATE.Value := idsInternal;
  end;

  //
  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, True);

    frVariables.Variable['HidePriceAndCost']:= False;

    if OPERSTATUS=iosOutcomeToOtv then
    begin
      frVariables.Variable['IsOtv']:= True;
      frVariables.Variable['HidePriceAndCost']:= true;
    end
    else begin
      frVariables.Variable['IsOtv']:= False;
    end;

    FDesignReport := ((IntfMegaAccessManager.GetUserName = 'KIGNAT') AND (IntfMegaDBCommon.GetCountry = iccRussia));
    if FDesignReport then
    begin
      lDMRep.frSpravB.DesignReport;
    end
    else
    begin
      lDMRep.frSpravB.PrepareReport;
      lDMRep.frSpravB.PrintPreparedReportDlg;
    end;

  finally
    ldmRep.Free;
  end;
  //--
end;

procedure TDocNaklForm.actPrintSpravkaBExecute(Sender: TObject);
var
  ldmRep: TdmTTNDocRep;
begin

  ldmRep:=TdmTTNDocRep.Create(self);
  try

    ldmRep.PrintExpeditor:= false; {???}
    ldmRep.PrepareNaklSpravkaRUSByNakl(DocNaklRecID.Value, DocNaklBaseID.Value);
    ldmRep.frxSpravkaTTN.PrepareReport;
    ldmRep.frxSpravkaTTN.PrintOptions.Copies:= 1;
    If FDesignReport Then
      begin
         ldmRep.frxSpravkaTTN.DesignReport;
         dmMegaReports.MyDesign(3205, Now(), DocNaklRECID.asString+','+DocNaklBASEID.asString);
      end
    else
      begin
        ldmRep.frxSpravkaTTN.ShowPreparedReport;
        dmMegaReports.MyShow(3205, Now(), DocNaklRECID.asString+','+DocNaklBASEID.asString);
      end;
  finally
    ldmRep.free;
  end;
end;

procedure TDocNaklForm.MegaSelCFOtoChange(Sender: TObject);
begin
  if DocPos.Active and (DocPos.RecordCount > 0) and (not fSetAddr) and
     (Application.MessageBox('Изменить цены в документе?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES) then
    UpdatePosPrices;
end;

procedure TDocNaklForm.MegaSelContract1Change(Sender: TObject);
var
   i:integer;
begin
//
  i:=i+1;
  NaklContractChange:= true;
end;

procedure TDocNaklForm.MenuItem5_Torg2Click(Sender: TObject);
var
  ldmRep: TdmPrintNakl2R;
begin // подготовка к печати "Акт об установленных расхождениях по количеству .."
      // унифицированная форма "Торг-2"
   if (IntfMegaDBCommon.GetCountry <> iccRussia) then exit;

  if fmAktTorg2Params = nil then
    fmAktTorg2Params:= TfmAktTorg2Params.Create(Self);

  if fmAktTorg2Params.ShowModal <> mrOk then Exit;

  ldmRep:= TdmPrintNakl2R.Create(Self);
  try
    ldmRep.dsTorg2Title.Params.ByName['RECID'].asInteger:=DocNaklRecID.Value;
    ldmRep.dsTorg2Title.Params.ByName['BASEID'].asInteger:=DocNaklBaseID.Value;
    ldmRep.dsTorg2Title.Open;
    ldmRep.dsTorg2Pos.Params.ByName['RECID'].asInteger:=DocNaklRecID.Value;
    ldmRep.dsTorg2Pos.Params.ByName['BASEID'].asInteger:=DocNaklBaseID.Value;
    ldmRep.dsTorg2Pos.Open;
    ldmRep.frTorg2.ShowReport;
  finally
    ldmRep.Free;
  end;
end;

procedure TDocNaklForm.actPrintTorg15Execute(Sender: TObject);
var  ldmRep: TdmPrintNakl2R;
begin // подготовка к печати "Акт о порче, бое, ломе товарно-материальных ценностей"
      // унифицированная форма "Торг-15"
   if (IntfMegaDBCommon.GetCountry <> iccRussia) then exit;

  ldmRep:= TdmPrintNakl2R.Create(Self);
  try
    ldmRep.Torg15ShowReport(DocNaklRecID.Value,DocNaklBaseID.Value);
  finally
    ldmRep.Free;
  end;
end;

procedure TDocNaklForm.actPrintTorg16Execute(Sender: TObject);
var  ldmRep: TdmPrintNakl2R;
begin // подготовка к печати "Акт о списании товаров"
      // унифицированная форма "Торг-16"
   if (IntfMegaDBCommon.GetCountry <> iccRussia) then exit;

  ldmRep:= TdmPrintNakl2R.Create(Self);
  try
    ldmRep.Torg16ShowReport(DocNaklRecID.Value,DocNaklBaseID.Value);
  finally
    ldmRep.Free;
  end;
end;

procedure TDocNaklForm.PrintIntNaklExecute(Sender: TObject);
var
    ldmRep1: TdmPrintNakl2;
begin
      //накладная на внутреннее перемещение
      if  not AllowAll
      and (DocNaklSTATE.Value<>idsBug)
      and (DocNaklSTATE.Value<>idsKassa)
      and (DocNaklDK_TO.AsFloat<>ddkEndUser)
      and (not intfMegaDBCommon.IsOffice)
      and (DocNaklSTATE.Value<>idsFromOffice)
      and (OPERSTATUS = iosOutcomeToOtv) then
      begin
           exit;
      end;
      if (DocNaklSTATE.Value= idsPrepare)
      or (DocNaklSTATE.Value= idsToOffice) then
      begin
           exit;
      end;
      if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then
      begin
           DocNakl.Edit;
           DocNaklSTATE.Value := idsInternal;
      end;
      ldmRep1:= TdmPrintNakl2.Create(Self);
      try
         ldmRep1.PrepareReport(
         DocNaklRecID.Value, DocNaklBaseID.Value,
         IntfDBProvider.GetDB , Nakl_Transaction, False);

         frVariables.Variable['HidePriceAndCost']:= False;

         if OPERSTATUS=iosOutcomeToOtv then
         begin
              frVariables.Variable['IsOtv']:= True;
              frVariables.Variable['HidePriceAndCost']:= true;
         end
         else begin
         frVariables.Variable['IsOtv']:= False;
         end;

             lDMRep1.frNakl75_v.PrepareReport;
             lDMRep1.frNakl75_v.PrintPreparedReportDlg;

      finally
     ldmRep1.Free;
  end;
end;


procedure TDocNaklForm.actSelLinkDOcExecute(Sender: TObject);
var tc:TComponent;
begin
  tc:=FindComponent('fmShowLinkedDoc1');
  if tc=nil
    then tc:=TfmShowLinkedDoc1.Create(self,DocNAKL.Transaction,DocNAKLRecId.Value,DocNAKLBaseId.Value,'DOC_NAKL')
    else TfmShowLinkedDoc1(tc).RefreshMD;
  TfmShowLinkedDoc1(tc).show;
end;



procedure TDocNaklForm.PrintSoprDocToTN(tt:smallint);
var
  ldmRep:TdmPrintNakl2;
begin //печать справки к ТТН РАЗДЕЛ Б
  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, True);

    frVariables.Variable['HidePriceAndCost']:= False;

    if OPERSTATUS=iosOutcomeToOtv then
    begin
      frVariables.Variable['IsOtv']:= True;
      frVariables.Variable['HidePriceAndCost']:= true;
    end
    else begin
      frVariables.Variable['IsOtv']:= False;
    end;
    ldmRep.MaterDocs1.Params.ByName['DOC_MVID'].Value:=1;
//    ldmRep.MaterDocs1.Params.ByName['OPERDATE'].Value:=DOCNaklOperdate.Value;
    ldmRep.MaterDocs1.Open;
    ldmRep.MaterDocs.Params.ByName['DOC_MVID'].Value:=1;
//    ldmRep.MaterDocs.Params.ByName['OPERDATE'].Value:=DOCNaklOperdate.Value;
    ldmRep.MaterDocs.Open;
    if FDesignReport then
    begin
      lDMRep.frSpravB.DesignReport;
    end
    else
    begin
      case tt of
        0:lDMRep.frSpravB.Pages.Pages[1].Visible:=false;
        1:lDMRep.frSpravB.Pages.Pages[0].Visible:=false;
      end;
      lDMRep.frSpravB.PrepareReport;
      lDMRep.frSpravB.PrintPreparedReportDlg;
    end;

  finally
    ldmRep.Free;
  end;
end;

procedure TDocNaklForm.actPrintRbToTTNExecute(Sender: TObject);
begin //
  PrintSoprDocToTN(1);
end;

procedure TDocNaklForm.actPrintSoprDToTNExecute(Sender: TObject);
begin
 PrintSoprDocToTN(0);
end;

procedure TDocNaklForm.actPrintSchetRExecute(Sender: TObject);
begin
     DocPOS.SafePost;
     DocNakl.SafePost;

     dmMegaReports.MyShow(43,DocNaklDOCDATE.Value,
                             [DocNaklRECID.Value,DocNaklBASEID.Value],2);
end;

procedure TDocNaklForm.actPrintTorg13Execute(Sender: TObject);
var ldmRep:TdmPrintNakl2R;
begin
   ldmRep:=TdmPrintNakl2R.Create(self);
   try
     ldmRep.Torg13ShowReport(DocNaklRECID.value,DocNaklBASEID.value);
   finally
     ldmRep.free;
   end;
end;

procedure TDocNaklForm.actPrintMx3Execute(Sender: TObject);
var ldmRep:TdmPrintNakl2R;
begin
   ldmRep:=TdmPrintNakl2R.Create(self);
   try
     ldmRep.Mx3ShowReport(DocNaklRECID.value,DocNaklBASEID.value);
   finally
     ldmRep.free;
   end;
end;


class procedure TDocNaklForm.PrintTorg13(NaklRecId, NaklBaseId: Integer);
var
  ldmRep: TdmPrintNakl2R;
begin
   ldmRep:= TdmPrintNakl2R.Create(nil);
   try
     ldmRep.Mx1ShowReport(NaklRecId, NaklBaseId);
   finally
     ldmRep.free;
   end;
end;

procedure TDocNaklForm.actPrintMx1Execute(Sender: TObject);
begin
  PrintTorg13(DocNaklRECID.value,DocNaklBASEID.value);
end;

procedure TDocNaklForm.N41Click(Sender: TObject);
var ldmRep:TdmPrintNakl2R;
begin
   ldmRep:=TdmPrintNakl2R.Create(self);
   try
     ldmRep.Mx1_ShowReport(DocNaklRECID.value,DocNaklBASEID.value);
   finally
     ldmRep.free;
   end;
end;

procedure TDocNaklForm.actPrintM11Execute(Sender: TObject);
var ldmRep:TdmPrintNakl2R;
begin
   ldmRep:=TdmPrintNakl2R.Create(self);
   try
     ldmRep.M11ShowReport(DocNaklRECID.value,DocNaklBASEID.value);
   finally
     ldmRep.free;
   end;
end;

procedure TDocNaklForm.actPrintM4Execute(Sender: TObject);
var ldmRep:TdmPrintNakl2R;
begin
   ldmRep:=TdmPrintNakl2R.Create(self);
   try
     ldmRep.M4ShowReport(DocNaklRECID.value,DocNaklBASEID.value);
   finally
     ldmRep.free;
   end;
end;

procedure TDocNaklForm.actPrintMailBonusExecute(Sender: TObject);
begin
//
  dmMegaReports.MyShow(651, Now(), DocNaklRecID.asString + ',' + DocNaklBaseID.asString);
end;

procedure TDocNaklForm.actPrintMarkTaraExecute(Sender: TObject);
begin
//проверяем зафиксирована накладная или нет (заполнена наша табличка)

  if (DocNaklEGAIS_FIX_NUM_STR.IsNull) or (DocNaklEGAIS_FIX_NUM_STR.asString='') then
  begin
    if Application.MessageBox('У данной накладной отсутсвует номер фиксации в ЕГАИС! '
      + #13#10 + 'Либо накладная еще не была выгружен в ЕГАИС, ' + #13#10 +
      'либо по накладной не были загружены данные из ЕГАИС. ' + #13#10 +
      'Выгрузить данные можно в форме "Список документов". ' + #13#10 +
      'Хотите попробовать загрузить номер фиксации из ЕГАИС?', 'Внимание',
      MB_YESNO + MB_ICONWARNING) = IDYES then
    begin
      if not conEgais.Connected then conEgais.Connected:=true;
      dsDocNumber.Parameters.ParamByName('b_date').value:=DocNaklOPERDATE.AsDateTime;
      dsDocNumber.Parameters.ParamByName('e_date').value:=DocNaklOPERDATE.AsDateTime+1;
      dsDocNumber.Parameters.ParamByName('doc_number').value:=DocNaklDOCNUMBER.AsInteger;
      dsDocNumber.open;
      if not dsDocNumber.IsEmpty then
      begin
        if not DM.trMainWShort.Active then DM.trMainWShort.Active:= True;
          fbExecQuery(DM.trMainWShort, 'UPDATE OR INSERT INTO NAKL_ADDITION_PROP (NAKL_RECID, NAKL_BASEID, EGAIS_FIX_NUM_STR, EGAIS_FIX_DATE) VALUES (%d, %d, ''%s'', ''%s'')',
                      [DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger, VarToStr(dsDocNumberFIX_NOTIFICATION_ID.Value), DateTimeToStrEx(dsDocNumberFIX_NOTIFICATION_DATE.AsDateTime)]);
        DM.trMainWShort.Commit;
      end
      else
      begin
         Info('В базе ЕГАИС отсутсвуют данные о документе с номером: ' + DocNaklDOCNUMBER.AsString);
         Exit;
      end;
    end;
  end;
// проверяем чтобы были заполнены все даты розлива
    dm.SharedQuery.Close;
    dm.SharedQuery.SQL.Text :=
      'SELECT count(*) CNT   '#13#10+
      'FROM DOC_NAKL_POS     '#13#10+
      'WHERE DOCRECNO=:RECID    '#13#10+
      '  and BASEID=:BASEID  '#13#10+
      '  and DATE_ROZLIVA is NULL';
    dm.SharedQuery.ParamByName('RECID').Asinteger := DocNaklRECID.AsInteger;
    dm.SharedQuery.ParamByName('BASEID').Asinteger := DocNaklBASEID.AsInteger;
    dm.SharedQuery.ExecQuery;
    if dm.SharedQuery.FN('CNT').AsInteger >0 then
    begin
       Warning('В документе есть позиции без указания даты розлива! Укажите дату розлива и повторите попытку. ');
       dm.SharedQuery.Close;
       exit;
    end;
    If FDesignReport Then
      dmMegaReports.MyDesign(3180, Now(), DocNaklRecID.asString+','+DocNaklBaseID.asString)
    Else
      dmMegaReports.MyShow(3180, Now(), DocNaklRecID.asString+','+DocNaklBaseID.asString);

end;

procedure TDocNaklForm.aSetKolPrecentExecute(Sender: TObject);
// изменение колличества ценностей в накладной
var
  S: String;
  D: Double;
  KL: Double;
  I: Integer;
begin
  if InputQuery('Введите процент изменения количества', '% изменения', S) then
  begin
    D := StrToFloat(S);
    if DBGridEh1.SelectedRows.Count = 0 then
      DBGridEh1.SelectedRows.CurrentRowSelected := True;
      DocPos.ConfirmPost := False;
      for I:=0 to DBGridEh1.SelectedRows.Count-1 do
      begin
        DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
        DBGridEh1.Update;
        DBGridEh1.DataSource.DataSet.Edit;
        KL:=DBGridEh1.DataSource.DataSet.FieldByName('KOLICH').AsFloat;
        DBGridEh1.DataSource.DataSet.FieldByName('KOLICH').AsFloat :=trunc(DBGridEh1.DataSource.DataSet.FieldByName('KOLICH').Value * (1 + D / 100));
        DBGridEh1.DataSource.DataSet.FieldByName('SUMMA').Value := DBGridEh1.DataSource.DataSet.FieldByName('KOLICH').AsFloat*
         DBGridEh1.DataSource.DataSet.FieldByName('SUMMA').AsFloat/KL;
        DBGridEh1.DataSource.DataSet.FieldByName('SUMMA1').Value :=DBGridEh1.DataSource.DataSet.FieldByName('KOLICH').AsFloat*
         DBGridEh1.DataSource.DataSet.FieldByName('SUMMA1').Value/KL;
        if DBGridEh1.DataSource.DataSet.FieldByName('IND').Value = 1 then
        begin
          DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value := DBGridEh1.DataSource.DataSet.FieldByName('KOLICH').AsFloat*
           DBGridEh1.DataSource.DataSet.FieldByName('IND_SUMMA').Value/KL;
        end;
        DBGridEh1.DataSource.DataSet.FieldByName('STATE').Value := 100;
        DBGridEh1.DataSource.DataSet.Post;
      end;
    DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i-1]));
    DocPos.ConfirmPost := True;
  end;
end;

procedure TDocNaklForm.actPrintOC1Execute(Sender: TObject);
var ldmRep:TPrint_FormsToOFond;
begin
   ldmRep:=TPrint_FormsToOFond.Create(self);
   try
     ldmRep.OC1_ShowReport(DocNaklRECID.value,DocNaklBASEID.value);
   finally
     ldmRep.free;
   end;
end;

procedure TDocNaklForm.actPrintOC2Execute(Sender: TObject);
var ldmRep:TPrint_FormsToOFond;
begin
   ldmRep:=TPrint_FormsToOFond.Create(self);
   try
     ldmRep.OC2_ShowReport(DocNaklRECID.value,DocNaklBASEID.value);
   finally
     ldmRep.free;
   end;
end;

procedure TDocNaklForm.actPrintOC4Execute(Sender: TObject);
var ldmRep:TPrint_FormsToOFond;
begin
   ldmRep:=TPrint_FormsToOFond.Create(self);
   try
     ldmRep.OC4_ShowReport(DocNaklRECID.value,DocNaklBASEID.value);
   finally
     ldmRep.free;
   end;
end;

procedure TDocNaklForm.actPrintOrderExecute(Sender: TObject);
begin
  if GetProvStatus in [iosIncomeFromRoad,iosImportIncomeFromRoad] then
    dmMegaReports.MyShow(75,Now(),DocNaklRecID.asString+','+DocNaklBaseID.asString+',1')
  else //iosOutcomeToRoad
    dmMegaReports.MyShow(75,Now(),DocNaklRecID.asString+','+DocNaklBaseID.asString+',2');
end;

procedure TDocNaklForm.actPrintOC4aExecute(Sender: TObject);
var ldmRep:TPrint_FormsToOFond;
begin
   ldmRep:=TPrint_FormsToOFond.Create(self);
   try
     ldmRep.OC4a_ShowReport(DocNaklRECID.value,DocNaklBASEID.value);
   finally
     ldmRep.free;
   end;
end;

procedure TDocNaklForm.actPrintMB7Execute(Sender: TObject);
var
  ldmRep:TdmPrintNakl2R;
begin
//
   ldmRep:=TdmPrintNakl2R.Create(self);
   try
     ldmRep.MB7ShowReport(DocNaklRECID.value,DocNaklBASEID.value);
   finally
     ldmRep.free;
   end;
end;

procedure TDocNaklForm.PrintReport(const ReportName: string);
var
  ldmRep: TdmPrintNakl2;
  re: TRegExpr;
  rep: TfrReport;
begin
  // в связи с особенностями реализации многопоточности в fr3
  // не даем закрыть накладную(а сворачиваем), пока она не допечатается
  aCanFreeForm := false;
  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);

    // Для российских сетевиков, по наличию символа # в
    // примечании документа, пишу в переменную отчёта
    // строку вида - "заказ №ХХХХ"
    if ((IntfMegaDBCommon.GetCountry = iccrussia) or (IntfMegaDBCommon.GetCountry = kodRus)) then
    begin
      re:=TRegExpr.Create;
      try
{ ---------------- Changed by Lion in 04.02.2009 --------------- }
//        re.Expression:='\#\s*([0-9\-]+)(\s*\@(\d+))*';
        re.Expression:='\#\s*([-0-9A-Za-zА-Яа-я]+)(\s*\@(\d+))*';
{ ----------- End of changing by Lion in 04.02.2009 ----------- }
        if re.Exec(Trim(DocNakl.FieldByName('NOTES').AsString)) then
        begin
          frVariables.Variable['ZakazNo']:= re.Match[1];
          if (re.Match[3]='') then
             frVariables.Variable['KodOrder']:= ''
          else
             frVariables.Variable['KodOrder']:= 'код поставщика  ' + re.Match[3];
        end
        else
        begin
          frVariables.Variable['ZakazNo']:= '';
          frVariables.Variable['KodOrder']:='';
        end
      finally
        re.Free;
      end;
    end;

    rep:= TfrReport(lDMRep.FindComponent(ReportName));
    if rep = nil then
      rep:= lDMRep.NaklReport
    else
      TdmMegaReports.AssignReport(rep, DocNaklRecID.Value, DocNaklBaseID.Value, dtrkNakladna);

    if FDesignReport then
      rep.DesignReport
    else
    begin
      rep.PrepareReport;
      rep.ShowReport;
    end;

  finally
    ldmRep.IsOSNakl:=false;
    ldmRep.Free;
    aCanFreeForm := true;
  end;
  //--
end;

procedure TDocNaklForm.actPrintMETROExecute(Sender: TObject);
begin
  // Никаких проверок
  //Накладаная для МЕТРО
  PrintReport('frNaklrMetro');
end;

procedure TDocNaklForm.actPrintMETROUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (IntfMegaDBCommon.GetCountry=iccRussia);
end;

procedure TDocNaklForm.actPercentNaklExecute(Sender: TObject);
var
  Nakl: TDocNaklForm;
  Form1:TForm;
  rest,d1,d2,cib:double;
  proc,kk:double;
  s:string;
  balance2:string;
  state_:integer;
begin
//
  //DocNakl.edit;
  state_:=DocNaklSTATE.AsInteger;
  //DocNaklSTATE.AsInteger:=0;
 // DocNaklNOTES.AsString:='№1';
  //DocNakl.SafePost;
  if InputQuery('Разделение по накладным', 'Отправить в другую накладную %', S) then
  begin
    proc := StrToFloat(S);
   { if DocNaklBalance_KOD.AsString='77' then
    begin
      DM.SharedQuery.Close;
      DM.SharedQuery.SQL.Text := 'select * from ALPHA_PARAMS where BASEID = '+ IntToStr(IntfMegaDBCommon.GetBaseID);
      DM.SharedQuery.ExecQuery;
      balance2:=DM.SharedQuery.FieldByName('A_BALANCE').AsString;
    end  else
    begin
      balance2:='77';
    end;}
    balance2:=DocNaklBALANCE_KOD.AsString;
    //TSelectDocTypeForm.Create(Self, balance2).ShowModal;


    Form1  := OpenDocument(Self, DocNaklDOCTYPE.AsString, 0, 0, DocNaklDOCDATE.AsDateTime);

  if Form1 is TDocNaklForm then
  begin
    Nakl:= TDocNaklForm(Form1);
    //Nakl.DocNakl.Append;

    Nakl.DocNaklDOCNUMBER.asVariant:=DocNaklDOCNUMBER.asVariant;
    Nakl.DocNaklDK_C.AsVariant := DocNaklDK_C.AsVariant;
    Nakl.DocNaklOPERDATE.AsVariant:=DocNaklOPERDATE.AsVariant;
    Nakl.DocNaklDOCDATE.AsVariant:=DocNaklDOCDATE.AsVariant;
    Nakl.DocNaklGROUP_OPER.AsVariant:=DocNaklGROUP_OPER.AsVariant;
    Nakl.DocNaklKOD_OPER.AsVariant:=DocNaklKOD_OPER.AsVariant;
    Nakl.DocNaklCFO.asVariant:=DocNaklCFO.asVariant;
    //Nakl.GrOper_CEButtonClick(Self);
    Nakl.NotSetOtsr:=true;
    Nakl.NoOtsr:=true;
    Nakl.DocNaklDK_FROM.Value := DocNaklDK_FROM.Value;
    Nakl.DocNaklDK_TO.Value := DocNaklDK_TO.Value;
    Nakl.DocNaklDK_C.AsVariant := DocNaklDK_C.AsVariant;
    Nakl.DocNaklNACENKA_.Value := DocNaklNACENKA_.Value;
    Nakl.DocNaklNOTES.Value := DocNaklNOTES.Value+' (№2)';
    //DocNaklNOTES.asString := DocNaklNOTES.asString+' (№1)';
    Nakl.DocNaklPRICETYPE_.Value := DocNaklPRICETYPE_.Value;
    Nakl.DocNaklDOCDATE.AsDateTime:=DocNaklDOCDATE.AsDateTime;
//    Nakl.DocNaklTRIGGER_OFF.Value := DocNaklTRIGGER_OFF.Value;
    Nakl.DocNaklPRICE_FROM_VALYUTA.Value := DocNaklPRICE_FROM_VALYUTA.Value;
    Nakl.DocNaklV.Value := DocNaklV.Value;
    Nakl.DocNaklV1.Value := DocNaklV1.Value;
    Nakl.DocNaklKURS.Value :=DocNaklKURS.Value;
    Nakl.DocNaklOTSR.Value := DocNaklOTSR.Value;
    Nakl.DocNaklSTATE.Value := state_;
    Nakl.DocNaklTRANSPORT.Value := DocNaklTRANSPORT.Value;
    if Nakl.DocNakl.State in [dsInsert, dsEdit] then
    Nakl.DocNakl.SafePost;
    Nakl.DocNakl.Edit;
    //Nakl.DocNakl.Post;
  //  Nakl.PastePosExecute(nil);
    DocPos.First;
    DocPos.ConfirmPost:=false;
    DocPos.ConfirmDelete:=false;
    Nakl.DocPos.ConfirmPost:=false;
    kk:=1;
    if DocNaklBALANCE_KOD.AsInteger <> Nakl.DocNaklBALANCE_KOD.AsInteger then
    begin
      if DocNaklBALANCE_KOD.AsInteger=IntfMegaCommon.GetMainFirmBalanceKod then kk:=1.2 else kk:=1/1.2;
    end;


    while not DocPos.Eof do
    begin
      d1:=Round((DocPos.FieldByName('KOLICH').AsFloat*proc)/100);
      rest:=DocPos.FieldByName('KOLICH').AsFloat-d1;

      if d1<>0 then begin
        Nakl.DocPosSource.Dataset.Append;
        Nakl.DocPos.FieldByName('KOD_MATER').AsFloat := DocPos.FieldByName('KOD_MATER').AsFloat;
        Nakl.DocPos.FieldByName('KOLICH').AsFloat :=d1 ;
        Nakl.DocPos.FieldByName('SUMMA1').AsFloat := (DocPos.FieldByName('SUMMA1').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1)*kk;
        Nakl.DocPos.FieldByName('SUMMA').AsFloat :=(DocPos.FieldByName('SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1)*kk;
        Nakl.DocPos.FieldByName('IND_SUMMA').AsFloat := (DocPos.FieldByName('IND_SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1);
        Nakl.DocPos.FieldByName('IND').Value :=DocPos.FieldByName('IND').Value ;
        Nakl.DocPos.FieldByName('PDV').Value := DocPos.FieldByName('PDV').Value ;
        Nakl.DocPos.Post;
       if rest=0 then begin DocPos.Delete; {DocPos.Prior;} end
       else begin
         DocPos.Edit;
         DocPos.FieldByName('SUMMA1').AsFloat := (DocPos.FieldByName('SUMMA1').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(rest);
         DocPos.FieldByName('SUMMA').AsFloat :=(DocPos.FieldByName('SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(rest);
         DocPos.FieldByName('IND_SUMMA').AsFloat := (DocPos.FieldByName('IND_SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(rest);
         DocPos.FieldByName('KOLICH').AsFloat := (rest);
         DocPos.Post;
       end;
     end;

     if rest<>0 then DocPos.Next;
    end;
    if Nakl.DocPos.RecordCount=0 then begin
      Nakl.DocNakl.ConfirmDelete := False;
      Nakl.DocNakl.Delete;
      Nakl.Close;
      Nakl.DocNakl.Transaction.Commit;
      exit;
    end;
    DocPos.ConfirmDelete := True;
    Nakl.DocPos.ConfirmPost := True;
    PosModified:=false;
    DocNakl.ConfirmPost:=false;
    LocateDocPos(false);

    DM.SharedQuery.Close;
    DM.SharedQuery.Transaction:= DM.trMainWShort;

    DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'DELETE FROM OPER_JORNAL WHERE FORMTYPE =:DOC_INHERITED AND DOCRECNO = :RECID AND BASEID = :BASEID';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;


    DM.SharedQuery.Transaction.Commit;
    DM.SharedQuery.Transaction:=dm.trMainRO;

    //DocNakl.Edit;
  //  DocNaklSTATE.Value := 2;
    DontCheckRest := True;
    if DocPos.RecordCount=0 then
    begin
     DocNakl.Delete;
     DocNakl.Transaction.Commit;
    end else begin
     {DocNakl.Edit;
     DocNaklNOTES.asString := DocNaklNOTES.asString+' (№1)';
     DocNakl.Post;}
     PosModified:=false;
     DocNakl.ConfirmPost:=false;
     DocNakl.Transaction.CommitRetaining;
    end;
    Nakl.CheckRest(False);

    Nakl.DocNakl.Edit;
    Nakl.DocNaklSTATE.Value:=state_;
    Nakl.DocNakl.Post;
    Nakl.DocNakl.Transaction.CommitRetaining;

    //Nakl.DocNaklSTATE.Value := DocNaklSTATE.Value;

 //   Nakl.DocNaklDOCNUMBER.Value :=0;
//    Nakl.DocNakl.Post;
//    Nakl.DontCheckRest := True;}
//    Nakl.DocNakl.Transaction.CommitRetaining;

    Self.Close;
   end;
  end;

end;

procedure TDocNaklForm.aSetPriceColExecuteExecute(Sender: TObject);
var
  S: string;
  NewCol: integer;
  AllPrice: integer;
begin
  //if not IntfMegaDBCommon.IsOffice then exit;
  if not InputQuery('Проставить цену в накладной по колонке', 'колонка №', S)
   then exit;
  try
    NewCol:=StrToInt(S);
  except
    liUtils.Error('Неверно задана колонка !');
    exit;
  end;
  case Windows.MessageBox(0, pChar('Выставить ВСЕ (в т.ч. инд.) цены в накладной по колонке '+inttostr(NewCol)+
     ' для ЦФО '+DocNaklCFO.AsString),
     'Цены по колонке', MB_ICONQUESTION or MB_YESNOCANCEL or MB_DEFBUTTON3)
  of
    mrYes: AllPrice:=1;
    mrNo: AllPrice:=0;
    mrCancel: exit;
  end;

  SetPriceCol(NewCol,AllPrice);

  Refresh_NaklPos;
  PosModified := True;

end;

procedure TDocNaklForm.aSetPriceColExecuteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := IntfMegaDBCommon.IsOffice or
  (IntfMegaAccessManager.GetUserRole = 'CORRECTOR')or(IntfMegaAccessManager.GetUserName = 'SYSDBA')
  or (((IntfMegaAccessManager.GetUserRole = 'ST_BUHGALTER')   or (IntfMegaAccessManager.GetUserRole = 'BUHGALTER_OPERATOR') ) and (Date<=StrToDate('01.03.2017')));
end;

procedure TDocNaklForm.DocPosForENaklCalcFields(DataSet: TDataSet);
begin
  if NoEvent then exit;
  DocPosForENaklRest.Value := MyRoundFunc(DocPosForENaklBeginRest.Value - DocPosForENaklKOLICH.Value * IsPrihod, 0.001);
  DocPosForENaklSUMMA2.Value := DocPosForENaklSUMMA.Value * (1 + DocNaklNACENKA_.Value/100);
  DocPosForENaklSUMMA3.Value := DocPosForENaklSUMMA1.Value * (1 + DocNaklNACENKA_.Value/100);
  if DocPosForENaklCOUNTINBOX.Value <> 0
     then DocPosForENaklBoxcount.Value := DocPosForENaklKolich.Value / DocPosForENaklCOUNTINBOX.Value;

  if DocPosForENaklKolich.Value = 0 then Exit;
  DocPosForENaklPrice1.Value := DocPosForENaklSumma.Value  / DocPosForENaklKolich.Value;
  DocPosForENaklPrice2.Value := DocPosForENaklSumma1.Value  / DocPosForENaklKolich.Value;
  DocPosForENaklPrice1_.Value := DocPosForENaklSumma2.Value  / DocPosForENaklKolich.Value;
  DocPosForENaklPrice2_.Value := DocPosForENaklSumma3.Value  / DocPosForENaklKolich.Value;
  if DocNaklNDSINSUMMA.Value = 0 then
    DocPosForENaklSUMMAWPDV.Value := DocPosForENaklSUMMA3.Value * (1+DocPosForENaklPDVGROUP_STAVKA.AsFloat/100)
  else
    DocPosForENaklSUMMAWPDV.Value := DocPosForENaklSUMMA3.Value;
  DocPosForENaklPRICEWPDV.Value := DocPosForENaklSUMMAWPDV.Value / DocPosForENaklKolich.Value;
  if DocPosForENaklIND.AsInteger=1 then
     DocPosForENaklRealPrice.Value := DocPosForENaklIND_SUMMA.Value / DocPosForENaklKolich.Value else
     DocPosForENaklRealPrice.Value := DocPosForENaklPRICEWPDV.Value;

end;

procedure TDocNaklForm.ItemTorg3Click(Sender: TObject);
var  ldmRep: TdmPrintNakl2R;
begin // подготовка к печати "Акт ОБ УСТАНОВЛЕННОМ РАСХОЖДЕНИИ ПО КОЛИЧЕСТВУ И КАЧЕСТВУ ПРИ ПРИЕМКЕ ИМПОРТНЫХ ТОВАРОВ"
      // унифицированная форма "Торг-3"
   if (IntfMegaDBCommon.GetCountry <> iccRussia) then exit;

  ldmRep:= TdmPrintNakl2R.Create(Self);
  try
    ldmRep.Torg3ShowReport(DocNaklRecID.Value,DocNaklBaseID.Value);
  finally
    ldmRep.Free;
  end;
end;


procedure TDocNaklForm.N40Click(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
begin
  // проверки на возможность печати
  if  not AllowAll
  and (DocNaklSTATE.Value<>idsBug)
  and (DocNaklSTATE.Value<>idsKassa)
  and (DocNaklDK_TO.AsFloat<>ddkEndUser)
  and (not intfMegaDBCommon.IsOffice)
  and (DocNaklSTATE.Value<>idsFromOffice)
  and (OPERSTATUS = iosOutcomeToOtv) then
  begin
    exit;
  end;
  if (DocNaklSTATE.Value= idsPrepare)
  or (DocNaklSTATE.Value= idsToOffice) then
  begin
    exit;
  end;

  //-- тоже проверка
//  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then
  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then

  begin
    DocNakl.Edit;
    DocNaklSTATE.Value := idsInternal;
  end;

  //
  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);

    if not ldmRep.IsMETRONakl then begin
     if Application.MessageBox('Дебитор не является "МЭТРО..". Печать?','ВНИМАНИЕ!',MB_OKCANCEL+MB_ICONQUESTION)=IDCANCEL
         then abort;
    end;

    frVariables.Variable['HidePriceAndCost']:= False;

    if OPERSTATUS=iosOutcomeToOtv then
    begin
      frVariables.Variable['IsOtv']:= True;
      frVariables.Variable['HidePriceAndCost']:= true;
    end
    else begin
      frVariables.Variable['IsOtv']:= False;
    end;

    //FDesignReport := ((IntfMegaAccessManager.GetUserName = 'DEREZA') OR (IntfMegaDBCommon.GetCountry = iccRussia));
    if FDesignReport then
    begin
      lDMRep.frAdd_to_TN_METRO.DesignReport;
    end
    else
    begin
      lDMRep.frAdd_to_TN_METRO.PrepareReport;
      lDMRep.frAdd_to_TN_METRO.PrintPreparedReportDlg;
    end;

  finally
    ldmRep.Free;
  end;
  //--
end;

procedure TDocNaklForm.actStartBPAgreementOfProductionReturnExecute(
  Sender: TObject);
var
  ProcessKod : Integer;
begin
{$IFDEF D10+}
  // стартовать процесс возвратной накладной
  with GetCommonModulesBusinessProcessesSoap(true) do
    try
      ProcessKod := CreateDocAndStartBusinessProcessAgreementOfProductionReturn3(
          IntfMegaAccessManager.GetUserKodDK, DocNaklRECID.ASInteger, DocNaklBASEID.ASInteger);
      try
        if not (DocNakl.State in [dsEdit,dsInsert]) then
          DocNakl.Edit;
        DocNakl.FieldByName('SOGL').AsInteger := -1;

      except
      on E: Exception do
        begin
          liUtils.Error('Не удалось установить признак '#13#10+
                     'согласования возврата на накладной. '#13#10+
                     'текст ошибки'#13#10+e.Message);
        end;
      end;


      Info('Стартовал процесс #'+IntToStr(ProcessKod));
    except
      on E:Exception do
      begin
        liUtils.Error('При создании процесса возникли ошибки:'#13#10+e.Message);
      end;
    end;
{$ENDIF}
end;

procedure TDocNaklForm.actStartBPContragentVIPExecute(Sender: TObject);
var  // Стартовать бизнес-процесс согласования VIP
  ProcessKod : string;
  locTerritoryCFO,lAreaID,lOutletRecid,lOutletBaseid: integer;
begin
  try

    dm.SharedQuery.Close;
    dm.SharedQuery.SQL.Text :=
      'SELECT spr_t.CFO                                                             '#13#10+
      'FROM DELIVERY_LOCATION DL                                                    '#13#10+
      'left join SPRAV_TRADE_OUTLET sto on sto.RECID = dl.OUTLET_RECID              '#13#10+
      '                                and sto.BASEID = dl.OUTLET_BASEID            '#13#10+
      'left join sprav_territory spr_t on spr_t.recid = sto.active_territory_recid  '#13#10+
      '                               and spr_t.baseid = sto.active_territory_baseid'#13#10+
      'where (DL.FORMTYPE=:FORMTYPE AND DL.BASEID=:BASEID AND  DL.DOCRECNO=:RECID)  ';
    dm.SharedQuery.ParamByName('RECID').Asinteger := DocNaklRECID.AsInteger;
    dm.SharedQuery.ParamByName('BASEID').Asinteger := DocNaklBASEID.AsInteger;
    dm.SharedQuery.ParamByName('FORMTYPE').Asinteger := DocNaklDOC_INHERITED.AsInteger;
    dm.SharedQuery.ExecQuery;
    try
      locTerritoryCFO := dm.SharedQuery.FN('CFO').AsInteger;
    except
      locTerritoryCFO := 0;
    end;
    dm.SharedQuery.Close;
    if NaklOutletRecid=0 then
    begin
      dm.SharedQuery.SQL.Text := 'select first 1 outlet_recid,outlet_baseid from distr_select_tt_distr_inf2(''today'',null,null,null,null,null,null,null, null,0,null,null,:kod_dk) where territ_recid is not null ';
      dm.SharedQuery.ParamByName('KOD_DK').AsDouble := DocNaklDK_TO.AsFloat;
      dm.SharedQuery.ExecQuery;
      dm.SharedQuery.Close;
      lOutletRecid := dm.SharedQuery.FN('outlet_recid').AsInteger;
      lOutletBaseid := dm.SharedQuery.FN('outlet_baseid').AsInteger;
    end
    else
    begin
      lOutletRecid := NaklOutletRecid;
      lOutletBaseid := NaklOutletBaseid;
    end;
    lAreaID := liUtils.iif(DocNaklAREA_ID.IsNull,0,DocNaklAREA_ID.asvariant);

    ProcessKod := TfmDialogBPContragentVIP.StartBusinessProcessContragentVIP(
                     IntfMegaAccessManager.GetUserKodDK,
                     lOutletRecid,
                     lOutletBaseid,
                     GetSum,
                     DocNakl.FieldByName('OPERDATE').AsDateTime,
                     liUtils.iif(IntfMegaCommon.GetCurActiveMainBalance = DocNaklBALANCE_KOD.asInteger,1,2),
                     lAreaID);


    if(ProcessKod<>'') then
//      MessageDlg(format('Бизнес-процесс стартовал успешно'#13#10'Информация:'#13#10'%s',
          MessageDlg(format('%s',
                        [ProcessKod]), mtInformation, [mbOk], 0);
//    if(ProcessKod>0) then
//        Info(format('Стартовал процесс #%8.0f'#13#10+
//                    'Детали доступны в 1С web-интерфейс.',
//                    [ProcessKod]));
  except
    on E:Exception do
    begin
      liUtils.Error('При создании процесса возникли ошибки:'#13#10+e.Message);
    end;
  end;
end;

procedure TDocNaklForm.actStartBPFinanceCoordinationOfGettingProductOnCreditExecute(Sender: TObject);
const
  cBPUrl='http://svc-1cv8bp.khortitsa.com:8000/MegaDAL_1CV8BP_V3/CommonModulesBusinessProcesses?wsdl';
var
  frm : TfmDialogBPCustom;
  lSumma : double;
  lNotes : string;
  ProcessKod: double;
begin
  frm := TfmDialogBPCustom.Create(Application);
  frm.Caption := 'Бизнес-процесс согласования продукции в подотчет';
  frm.lbCaption.Caption := 'Стартовать бизнес-процесс согласования продукции в подотчет';
  frm.lbLink.Hint := cBPUrl;

  if frm.ShowModal = mrOk then
  begin
    with GetCommonModulesBusinessProcessesSoap(true) do
    try
      ProcessKod := StartBusinessProcessFinanceCoordinationOfGettingProductOnCredit(
          DocNaklRECID.ASInteger, DocNaklBASEID.ASInteger,frm.aNotes,  IntfMegaAccessManager.GetUserKodDK );
      Info('Стартовал процесс #'+FloatToStr(ProcessKod));
    except
      on E:Exception do
      begin
        liUtils.Error('При создании процесса возникли ошибки:'#13#10+e.Message);
      end;
    end;
  end;
end;

procedure TDocNaklForm.actStartBPRemoveBlockingOfMinimalOrderExecute(
  Sender: TObject);
var
  ProcessKod : double;
begin
  try
    ProcessKod := TfmDialogBPRemoveBlockingOfMinimalOrder.StartBusinessProcessRemoveBlockingOfMinimalOrder(
                     DocNakl.FieldByName('DK_TO').AsFloat,
                     NaklOutletRecid,
                     NaklOutletBaseid,
                     SumSUMMARY.AsFloat,
                     DocNakl.FieldByName('OPERDATE').AsDateTime,
                     DocNakl.FieldByName('OPERDATE').AsDateTime,
                     GetOutletKodSV(NaklOutletRecid, NaklOutletBaseid)
                     );

    if(ProcessKod>0) then
        MessageDlg(format('Стартовал процесс #%8.0f'#13#10+
                          'Детали доступны в 1С web-интерфейс.',
                          [ProcessKod]), mtInformation, [mbOk], 0);
  except
    on E:Exception do
    begin
      MessageDlg('При создании процесса возникли ошибки:'#13#10+e.Message, mtError, [mbOk], 0);
    end;
  end;
end;

procedure TDocNaklForm.actStartBusinessSellingForTTWithoutLicenseExecute(
  Sender: TObject);
var
  sResponseMessage : string;
begin
  sResponseMessage:='';
  try
    sResponseMessage := TfmDialogBPDistributionSellingForTTWithoutLicense.StartBusinessProcessDistributionSellingForTTWithoutLicense(
                     DocNakl.FieldByName('DK_TO').AsFloat,
                     NaklOutletRecid, NaklOutletBaseId,
                     Date,
                     DocNakl.FieldByName('OPERDATE').AsDateTime
                     );

    if(sResponseMessage<>'')
    then MessageDlg(sResponseMessage, mtInformation, [mbOk], 0);
  except
    on E:Exception do
    begin
      MessageDlg('При создании процесса возникли ошибки:'#13#10+e.Message, mtError, [mbOk], 0);
    end;
  end;
end;

procedure TDocNaklForm.actStickerExecute(Sender: TObject);
var
 Form1:TfrmSticker;
begin
    //
 Form1:=TfrmSticker.Create(self);
 form1.trans.Active:=true;
 form1.fbdsSticker.Params.ByName['DOC_RECID'].Value:= DocNaklRecID.Value;
 form1.fbdsSticker.Params.ByName['DOC_BASEID'].Value:= DocNaklBASEID.Value;
 form1.fbdsSticker.Params.ByName['FORMTYPE'].Value:= DocNaklDOC_INHERITED.Value;
 form1.fbdsSticker.Open;

 if((form1.fbdsSticker.Eof) and (form1.fbdsSticker.Bof))
 then
   form1.fbdsSticker.append
 else
   form1.fbdsSticker.edit;

 form1.recid:=DocNaklRecID.AsInteger ;
 form1.baseid:=DocNaklBaseid.asInteger;
 form1.formtype:=DocNaklDOC_INHERITED.Value;
 Form1.ShowModal;
 Form1.Free;

end;

procedure TDocNaklForm.actStickeringExecute(Sender: TObject);
begin
//
 actInsNarExecute(Sender);
end;

procedure TDocNaklForm.actStickeringUpdate(Sender: TObject);
begin
   TAction(Sender).Visible:= ((IntfMegaDBCommon.GetCountry=iccUkraine) and (FIsStickeringNakl=0));
end;

procedure TDocNaklForm.actPrintActRExecute(Sender: TObject);
begin // "Акт о выполненных работах (услугах)" Россия
     DocPOS.SafePost;
     DocNakl.SafePost;

     dmMegaReports.MyShow(43,DocNaklDOCDATE.Value,
                           [DocNaklRECID.Value,DocNaklBASEID.Value],2);
end;

procedure TDocNaklForm.KursChange(Sender: TObject);
begin
  try
//   if Kurs.Focused then
     if Kurs.Value<>0 then
        Kurs1.Value:=1/Kurs.Value;
  except
  end;
end;

procedure TDocNaklForm.Kurs1Change(Sender: TObject);
begin
  try
//   if Kurs1.Focused then begin
     if not (DocNakl.State in [dsEdit,dsInsert]) then DocNakl.Edit;
     if Kurs1.Value<>0 then
        DocNaklKurs.Value:=1/Kurs1.Value;
//   end;
  except
  end;
end;

procedure TDocNaklForm.actPrintBreakExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
begin
  Query.Close;
  Query.SQL.Text:=
        'SELECT count(*) DocsCount FROM link_doc_opl ldo'#13+
        'left join doc_nakl dn on (dn.recid=ldo.opl_recid and dn.baseid=ldo.opl_baseid)'#13+
        'left join sprav_oper so on (so.group_oper=dn.group_oper and so.kod_oper=dn.kod_oper)'#13+
        'where ldo.parent_recid='+DocNaklRecID.AsString+' and ldo.parent_baseid='+DocNaklBaseID.AsString+
        ' and (so.status in ('+IntToStr(iosTrailerBreak)+','+IntToStr(iosTrailerBrak)+','+IntToStr(iosTrailerNotAll)+','+IntToStr(iosBreakManufact)+')'#13#10+
        ' or (so.kod_oper='+IntToStr(iotCarrierGoodsBreak)+' and so.group_oper='+IntToStr(igotCarrierGoodsBreak)+') '#13#10+
//претензии
        ' or (so.kod_oper=3740000 and so.group_oper=772811000) '#13#10+
        ' or (so.kod_oper=374000 and so.group_oper=77024000) )';
  Query.ExecQuery;

  if not (Query.FieldByName('DocsCount').AsInteger>0)
  then
    begin
      ShowMessage('Для данного документа нет связанных документов боя, брака и недостачи');
      exit;
    end;

  ldmRep:= TdmPrintNakl2.Create(Self);
  try
////Форма заполнения перевозчика и ТТН
    fmActBreakTrailer:=TfmActBreakTrailer.Create(Self);
    if fmActBreakTrailer.ShowModal=mrOk then
    begin
      ldmRep.PrepareActBreakReport(
        DocNaklRecID.Value, DocNaklBaseID.Value,
        IntfDBProvider.GetDB , Nakl_Transaction);

      frVariables.Variable['TrailerName']:=fmActBreakTrailer.TrailerDKName;
      frVariables.Variable['TrailerAddr']:=fmActBreakTrailer.TrailerDKAddress;
      frVariables.Variable['TTNNum']:=fmActBreakTrailer.TTNNum;
      frVariables.Variable['AutoNum']:=fmActBreakTrailer.AutoNum;
      frVariables.Variable['CarDriver']:=fmActBreakTrailer.CarDriver;
      if fmActBreakTrailer.TTNDate<StrToDate('01.01.1990')
      then frVariables.Variable['TTNDate']:=''
      else frVariables.Variable['TTNDate']:=DateToStr(fmActBreakTrailer.TTNDate);

      if FDesignReport
      then
       begin
         lDMRep.frActBreak.DesignReport;
       end
      else
       begin
         lDMRep.frActBreak.PrepareReport;
         lDMRep.frActBreak.ShowReport;
       end;
    end;
  finally
   if Assigned(fmActBreakTrailer) then fmActBreakTrailer.Free;
   ldmRep.Free;
  end;
end;

procedure TDocNaklForm.actPrintBreakUpdate(Sender: TObject);
begin
  //
  TAction(Sender).Enabled :=  OPERSTATUS in [6,7,220];
end;

procedure TDocNaklForm.actPrintCheckExecute(Sender: TObject);
begin
   //
   if aIniParams.GetIniParam('KASSA','TYPE')='DATECS' then
   begin
      protokol := 0;
      protokol :=StrToInt(aIniParams.GetIniParam('KASSA','PROTOCOL','0'));
      DISCOUNT :=StrToInt(aIniParams.GetIniParam('KASSA','DISCOUNT','0'));
      verKassa :=StrToInt(aIniParams.GetIniParam('KASSA','VER'));
      if not  InitializeComPort2 then
        MessageDlg('Порт не инициализирован!!!', mtError, [mbOK], 0)
      else
        PrintCheckPos;

     if verKassa= 5 then
     begin
       FP.ClosePort;
       FP.stop;
     end;

   end
end;

procedure TDocNaklForm.actGetIDExecute(Sender: TObject);
var
  aBuf: TClipboard;
begin
  aBuf := TClipboard.Create;
  try
    aBuf.SetTextBuf(PChar('RECID = ' + DocNaklRECID.AsString + ' AND BASEID = ' + DocNaklBASEID.AsString));
  finally
    aBuf.Free;
  end;
end;

procedure TDocNaklForm.actGovQualityExecute(Sender: TObject);
begin
  // Печать реестра свидетельств прохождения госконтроля качества.
  dmMegaReports.MyShow(705,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString);
end;

procedure TDocNaklForm.actGroupNameMAterExecute(Sender: TObject);
begin

  if RxSpeedButton1.Down then
  begin

    RxMemoryData1.DisableControls;
    try
      GroupSumCDS(
        TDataSet(RxMemoryData1),
        dsSource,
        dsSumGroup,
        dsSum,
        'GROUP_NAME',
        'NAME_MATER',
        'GROUP_NAME;NAME_MATER',
        'KOLICH,Boxcount,SUMMAWPDV',
        'CHECKED'
      );

      DBGridEH1.DataSource.DataSet:= dsSumGroup;
      DBGridEH1.FooterRowCount:=0;
      dsSumGroup.EnableControls;
    finally
      RxMemoryData1.EnableControls;
    end;
  end
  else
  begin
    DBGridEH1.FooterRowCount:=3;
    DBGridEH1.DataSource.DataSet := DocPos;
    dsSource.Close;
    dsSumGroup.Close;
    dsSum.Close;
  end;


end;

procedure TDocNaklForm.actImportFromWMSExecute(Sender: TObject);
var sMessage: string;
begin
 //  ExportToWMSSort(true);  1
  sMessage:= ImportFromWMS(DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger);
  if sMessage = '' then sMessage:= 'Завершено успешно';
   MessageDlg(sMessage,  mtInformation,[mbOK], 0);
end;

procedure TDocNaklForm.actInsNarExecute(Sender: TObject);
var fm:TfmDocOrderSkladPos;
    is_unload,typeorder:integer;
begin

  if (TMenuItem(sender).Name='actInsNar') then is_unload:=0
  else is_unload:=1;
  if (TMenuItem(sender).Name='actStickering') then
    typeorder := 3
  else if (TMenuItem(sender).Name='actShippingPallets') then
    typeorder := 4
  else
    typeorder := 1;
  if not(DM.SharedQuery.Transaction.InTransaction) then DM.SharedQuery.Transaction.StartTransaction;

  
  Dm.ChangeQuery.Close;
  DM.ChangeQuery.SQL.Text:='Insert into doc_order_sklad (operdate,TYPE_ORDER,NAKL_RECID,NAKL_BASEID,IS_UNLOAD_CONTAINERS) values (:operdate,:TYPE_ORDER,:NAKL_RECID,:NAKL_BASEID, :IS_UNLOAD_CONTAINERS)';
  DM.ChangeQuery.ParamByName('Operdate').asDateTime:=Source.DataSet.FieldByName('OPERDATE').asDateTime;
  DM.ChangeQuery.ParamByName('TYPE_ORDER').asInteger:=typeorder;
  DM.ChangeQuery.ParamByName('NAKL_RECID').asInteger:=Source.DataSet.FieldByName('RECID').asInteger;
  DM.ChangeQuery.ParamByName('NAKL_BASEID').asInteger:=Source.DataSet.FieldByName('BASEID').asInteger;
  DM.ChangeQuery.ParamByName('IS_UNLOAD_CONTAINERS').asInteger:=is_unload;
  DM.ChangeQuery.ExecQuery;

//  DM.SharedQuery.Transaction.CommitRetaining;
  mdsDocOrderSklad.Close;
  mdsDocOrderSklad.ParamByName('TYPE_ORDER').asInteger:=typeorder;  // 02.08.2021 - здесь нужно тип наряда - из накладной могут создавать наряд на комплектацию и потом на стикеровку
  mdsDocOrderSklad.Open;
  fm:=TfmDocOrderSkladPos.Create(self);
  fm.DOCRECNO:=mdsDocOrderSkladRECID.value;
  fm.BASEID:=mdsDocOrderSkladBASEID.value;
  Fm.actRefresh.Execute;
  fm.ShowModal;

end;

procedure TDocNaklForm.actInsNarUnloadContExecute(Sender: TObject);
begin
//
  actInsNarExecute(Sender);
end;

procedure TDocNaklForm.actInsNarUnloadContUpdate(Sender: TObject);
begin
   //
   TAction(Sender).Visible:= FIsUnloadContainers=1;
end;

procedure TDocNaklForm.actInsNarUpdate(Sender: TObject);
begin
   TAction(Sender).Visible := (mdsDocOrderSkladRecid.isNull and (FIsStickeringNakl=0));
   N59.enabled := (mdsDocOrderSkladRecid.isNull and (FIsStickeringNakl=0));
end;

procedure TDocNaklForm.actExportAktATBExecute(Sender: TObject);
var cxShellBrowserDialog:TcxShellBrowserDialog;
begin
  cxShellBrowserDialog:=TcxShellBrowserDialog.Create(self);
  if cxShellBrowserDialog.Execute then
   begin
   // dmMegaReports.Load(313,Date());
    dmMegaReports.MyPrepareReport(313,Now(),
                                         [DocNaklRecID.Value, DocNaklBaseID.Value, cxShellBrowserDialog.Path+PathDelim],3);
//   dmMegaReports.frxMain.Show;
   end;
end;

procedure TDocNaklForm.actExportOrderToWMSExecute(Sender: TObject);
var sMessage: string;
begin
  sMessage:= ExportToWMS(DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger, true);
  if sMessage = '' then sMessage:= 'Завершено успешно';
  MessageDlg(sMessage,  mtInformation,[mbOK], 0);
end;

procedure TDocNaklForm.aktSubRentExecute(Sender: TObject);
begin
  // Договор с Субарендатором
  dmMegaReports.MyShow(16,DocNaklOperDate.Value,DocNaklRECID.AsString+','+DocNaklBASEID.AsString);
end;

procedure TDocNaklForm.actSubRent_ListExecute(Sender: TObject);
begin
  //печать акта приёма передач суб.аренды
   dmMegaReports.MyShow(10,DocNaklOperDate.value,DocNaklRECID.AsString+','+DocNaklBASEID.AsString);
end;

procedure TDocNaklForm.actNaklPosSplitUpdate(Sender: TObject);
begin
  TAction(sender).Enabled:=true;//(IntfMegaDBCommon.IsOffice or (IntfMegaDBCommon.GetCountry=iccRussia));
end;

procedure TDocNaklForm.actNaklVoronezhExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
  re: TRegExpr;
begin
  // Никаких проверок
  //frNaklrReal

  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);
    if FDesignReport then
    begin
      lDMRep.frNaklVoronezh.DesignReport;
    end
    else
    begin
      lDMRep.frNaklVoronezh.PrepareReport;
      lDMRep.frNaklVoronezh.ShowReport;
    end;

  finally
    ldmRep.IsOSNakl:=false;
    ldmRep.Free;
  end;
  //--
end;

procedure TDocNaklForm.actNaklPosSplitExecute(Sender: TObject);
//Хазов С. 27-04-2005
var
  InStr: string;
  iInStr: integer;
  lsc:integer;
begin
  if not(DocPos.Active) then Exit;
  lsc:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
    GetRestSplit;
    iInStr:=StrToIntDef(InputBox('Разбивка позиции', 'Введите новое количество (ед.)', ''),0);
    if ((iInStr<=0) or (iInStr>=DocPosKOLICH.Value)) then
    begin
      ShowMessage('Разбить проводку не возможно. Укажите другое количество');
      Exit;
    end;
    if trSplitNakl.InTransaction then trSplitNakl.CommitRetaining
     else trSplitNakl.StartTransaction;
    if DocPosBaseID.asInteger=intfMegaDBCommon.GetBaseID then
    begin
      //ShowMessage('Для офисной базы разбить проводку можно вручную');
      NaklSplitQ.Close;
      NaklSplitQ.SQL.Text:='Execute procedure NAKL_POS_SPLIT ('+DocPosBaseID.asString+','+DocPosRecID.AsString+','+inttostr(iInStr)+')';
      NaklSplitQ.ExecQuery;
      trSplitNakl.CommitRetaining;
      Refresh_NaklPos;
    end
    else begin
      NaklSplitQ.Close;
      NaklSplitQ.SQL.Text:='insert into SYS_PROTOKOL (USER_NAME, TABLE_NAME, CHANGE_TYPE, OLD_ID, NEW_ID) VALUES ('+
         #39+IntfMegaAccessManager.GetUserName+#39+',''DOC_NAKL_POS_SPLIT'',''I'','+#39+DocPosRecID.AsString+'|'+
      DocPosBaseID.asString + '|' + IntToStr(iInStr)+#39+',0)';
      NaklSplitQ.ExecQuery;
      trSplitNakl.CommitRetaining;
    end;
  finally
    Screen.Cursor:=lsc;
  end;
end;

procedure TDocNaklForm.aSetOFDogovorExecute(Sender: TObject);
begin
  if (DocNaklSTATE.Value<>idsOFDogovor) then
  begin
    if MessageBox(0, 'Вносим отметку о наличии договора аренды.'+#13+#10+
     'Изменения в накладной будут блокированы.'+#13+#10+
     'Вы уверены ?', 'ВНИМАНИЕ !', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2)<>mrYes
    then exit;
    if not (DocNakl.State in [dsInsert, dsEdit]) then DocNakl.Edit;
    DocNaklSTATE.Value:=idsOFDogovor;
  end
  else begin
    if (DocNaklSTATE.Value=idsOFDogovor) then
    begin
      if MessageBox(0, 'Снять отметку о наличии договора аренды.'+#13+#10+
       'Вы уверены ?', 'ВНИМАНИЕ !', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2)<>mrYes
      then exit;
      if not (DocNakl.State in [dsInsert, dsEdit]) then DocNakl.Edit;
      DocNaklSTATE.Value:=-1;
    end;
  end;  
  CloseFormExecute(sender);
end;

procedure TDocNaklForm.aSetOFDogovorUpdate(Sender: TObject);
begin
//  TAction(sender).Enabled:=
//   (grBuhgalter in aIniParams.UserGroup)
//   and (GetProvStatus=iosOFSubarenda);
end;

procedure TDocNaklForm.actActPPExecute(Sender: TObject);

var
    frxRep:TfrxReport;
    ldmRep: TdmPrintNakl2;
begin

   ldmRep := TdmPrintNakl2.create(self);
   frxRep:= ldmRep.frACtPP;
  frxRep.Variables.Variables['BASEID']:=docnakl.FieldByName('BASEID').asinteger;
  frxRep.Variables.Variables['RECID'] :=docnakl.FieldByName('RECID').asinteger;
  if ((IntfMegaAccessManager.GetUserRole = 'DEVELOPER') OR ( IntfMegaAccessManager.GetUserName = 'SYSDBA')) then
    frxRep.DesignReport
  else
    if frxRep.PrepareReport(True) then
      frxRep.ShowPreparedReport;
end;

procedure TDocNaklForm.actAddFivePoistionExecute(Sender: TObject);
begin
  if TfrmAddFivePos.Create(self,docnaklrecid.asinteger,docnaklbaseid.asinteger,DocNaklDOC_INHERITED.asinteger,DocNaklBRAND_CASE_ID.asInteger,DocNaklOperdate.asDateTime).ShowModal = mrOk then
  DocPos.FullRefresh;
end;

procedure TDocNaklForm.actAddFivePoistionUpdate(Sender: TObject);
begin
   TAction(Sender).Enabled := paramCheck5Pos;
end;

procedure TDocNaklForm.actAddPosAntiBrandExecute(Sender: TObject);
const
  cSQL = 'execute procedure ANTI_BRAND_INSERT_INTO_DOC_POS (:docrecno, :baseid,  1, :formtype);';
var
  q:TMegaQuery;
  trans: TMegaTransaction;
begin
  //
  q:=nil; trans:=nil;
  if(IDYES<>Application.MessageBox('Хотите провести скидку в данной накладной?', '', MB_YESNO + MB_ICONQUESTION))
  then exit;
  try
    q:=TMegaQuery.Create(Self);

    trans:=TMegaTransaction.Create(Self);
    trans.DefaultDataBase:=IntfDBProvider.GetDB;

    q.DataBase:=IntfDBProvider.GetDB;
    q.Transaction:=trans;

    trans.StartTransaction;
    try
      q.SQL.Text:=cSQL;
      MegaQueryParam(q, 'docrecno').AsInteger:=docnaklrecid.asinteger;
      MegaQueryParam(q, 'baseid').AsInteger:=docnaklbaseid.asinteger;
      MegaQueryParam(q, 'formtype').AsInteger:=DocNaklDOC_INHERITED.asinteger;
      MegaExecQuery(q);

      trans.Commit;
    except
      trans.Rollback;
      raise;
    end;
  finally
    if(Assigned(q)) then q.Free;
    if(Assigned(trans)) then trans.Free;
  end;
  DocPOs.FullRefresh;
end;

procedure TDocNaklForm.actAkt1Execute(Sender: TObject);
begin
    dmMegaReports.MyShow(200638, Now(), DateToStrEx(DBDateEdit1.Date)+',' +DateToStrEx(DBDateEdit1.Date) + ', ' + DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString);
end;

procedure TDocNaklForm.actAkt2Execute(Sender: TObject);
begin
    dmMegaReports.MyShow(200639, Now(), DateToStrEx(DBDateEdit1.Date)+',' +DateToStrEx(DBDateEdit1.Date) + ', ' + DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString);
end;

procedure TDocNaklForm.actAllowNotCheckForNewTTExecute(Sender: TObject);
begin
  if(IDYES<>Application.MessageBox('Отключить проверку ассортимента новой точки для документа?', '', MB_YESNO + MB_ICONQUESTION))
  then exit;
  try
    if(NaklOutletRecid=0) then raise Exception.Create('В документе не задана торговая точка!');

    AllowNotCheckForNewTT(NaklOutletRecid, NaklOutletBaseid);
    MessageBox(Self.Handle, PChar('Для данного документа проверка отключена!'), PChar(''), MB_OK + MB_ICONINFORMATION);
  except
    on E:Exception do
      Application.MessageBox(PChar(E.Message), PChar('Ошибка!'), MB_OK + MB_ICONERROR);
  end;
end;

procedure TDocNaklForm.AllowNotCheckForNewTT(aOutletRecid, aOutletBaseid:integer);
const
  cSQL = 'execute procedure SET_DA_NON_CHK_FOR_NEW_TT(:OUTLET_RECID, :OUTLET_BASEID)';
var
  q:TMegaQuery;
  trans: TMegaTransaction;
begin
  q:=nil; trans:=nil;
  try
    q:=TMegaQuery.Create(Self);

    trans:=TMegaTransaction.Create(Self);
    trans.DefaultDataBase:=IntfDBProvider.GetDB;

    q.DataBase:=IntfDBProvider.GetDB;
    q.Transaction:=trans;

    trans.StartTransaction;
    try
      q.SQL.Text:=cSQL;
      MegaQueryParam(q, 'OUTLET_RECID').AsInteger:=aOutletRecid;
      MegaQueryParam(q, 'OUTLET_BASEID').AsInteger:=aOutletBaseid;
      MegaExecQuery(q);

      trans.Commit;
    except
      trans.Rollback;
      raise;
    end;
  finally
    if(Assigned(q)) then q.Free;
    if(Assigned(trans)) then trans.Free;
  end;
end;

procedure TDocNaklForm.actCheckBaseNaklExecute(Sender: TObject);
begin
// акция по Хортице

  CheckNaklBase(1);
end;

procedure TDocNaklForm.actCheckBaseNaklFeodosiaClick(Sender: TObject);
begin
  //феодосия
  CheckNaklBase(4);
end;

procedure TDocNaklForm.actCheckBaseNaklOKZClick(Sender: TObject);
begin
  //окз
  CheckNaklBase(5);
end;

procedure TDocNaklForm.actCheckBaseNaklTOP14Click(Sender: TObject);
begin
  CheckNaklBase(6);
end;

procedure TDocNaklForm.actCheckBaseNaklUpdate(Sender: TObject);
begin
 //

end;

procedure TDocNaklForm.actCheckBaseNakl_blgExecute(Sender: TObject);
begin
//акция по благову
  CheckNaklBase(3);
end;

procedure TDocNaklForm.actCheckBaseNakl_medExecute(Sender: TObject);
begin
//акция по медовухе
  CheckNaklBase(2);
end;

procedure TDocNaklForm.actCheckNextExecute(Sender: TObject);
begin
NextCheckFlag:=true;
CheckRest(false);
if DocPos.Eof then CheckRecNo:=0 else CheckRecNo:=DocPos.RecNo;
NextCheckFlag:=False;
end;

procedure TDocNaklForm.GetRestSplit;
//Хазов С. 10-05-2005 - Показывает остатки по счетам для текущей позиции
var
  Res: string;
  lSc: integer;
begin
  lSc:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
    if trSplitNakl.InTransaction then trSplitNakl.RollbackRetaining
     else trSplitNakl.StartTransaction;
    NaklSplitQ.Close;
    NaklSplitQ.sql.Text:='SELECT SPRAV_PROV.KREDIT SCHET, (SELECT SUM(REST_KOLICH) '+
     'FROM C_GET_MATER_REST('+DocNAklBalance_Kod.AsString+', SPRAV_PROV.KREDIT, '+
     replacestr(DocPosKOD_MATER.AsString,',','.')+', null, :OPERDATE, 1,'+ DocNaklCFO.AsString +')) REST '+
     'FROM SPRAV_PROV, SPRAV_SCHET WHERE '+
     'SPRAV_SCHET.BALANCE_KOD = SPRAV_PROV.BALANCE_KOD AND '+
     'SPRAV_SCHET.SCHET_KOD = SPRAV_PROV.KREDIT AND (KOEFICIENT IS NULL OR '+
     'UPPER(TRIM(KOEFICIENT)) <> ''>>>'') AND '+
     'SPRAV_SCHET.SCHET_AMATER = 1 and '+
     'SPRAV_PROV.GROUP_OPER = '+DocNaklGROUP_OPER.AsString+
     ' and SPRAV_PROV.KOD_OPER = '+DocNaklKOD_OPER.AsString+
     ' AND (BEGIN_DATE IS NULL OR BEGIN_DATE <= :operdate) AND (END_DATE IS NULL '+
     'OR END_DATE >= :operdate) ORDER BY SPRAV_PROV.PROV_ORDER';
    NaklSplitQ.Params.ByName['operdate'].AsDateTime:=DocNaklOPERDATE.AsDateTime;
    NaklSplitQ.ExecQuery;
    Res:='';
    while not NaklSplitQ.EOF do
    begin
      Res:=Res+'Остаток по счёту '+NaklSplitQ.FieldByName('SCHET').AsString+' = '+
       NaklSplitQ.FieldByName('REST').AsString+#13#10;
      NaklSplitQ.next;
    end;
    if Trim(Res)='' then Res:='0';
    ShowMessage(Res);
  finally
    Screen.Cursor:=lSc;
  end;
end;

procedure TDocNaklForm.actSubRent_ListUpdate(Sender: TObject);
begin
//  TAction(Sender).Enabled:=(GetProvStatus=iosOFSubarenda) and (DocNaklSTATE.Value=8);
end;

procedure TDocNaklForm.actPrintDogovorExecute(Sender: TObject);
const
  cGetArea = 'select sto.active_area_id, sto.active_area_base_id, sto.active_territory_recid, sto.active_territory_baseid '#13#10  +
      '  from delivery_location dl '#13#10  +
      '  left join sprav_trade_outlet sto on (sto.recid = dl.outlet_recid and sto.baseid = dl.outlet_baseid) '#13#10  +
      '  where dl.docrecno = :RECID and dl.baseid = :BASEID and dl.formtype = 1 ';
  cGetTA = 'SELECT sdk.name_dk, sdk.shortname_dk, sdk.kod_dk '#13#10  +
      '  from ta_area ta '#13#10  +
      '  left join sprav_dk sdk on (sdk.kod_dk = ta.kod_dk) '#13#10  +
      '  where area_id = :AREA and area_baseid = :BASEID and datefrom = (select max(datefrom) from ta_area where area_id = :AREA AND area_baseid = :BASEID AND datefrom <= :DOCDATE) ';
  cGetSV = 'SELECT sdk.name_dk, sdk.shortname_dk, sdk.kod_dk '#13#10  +
      '  from sv_territory st '#13#10  +
      '  left join sprav_dk sdk on (sdk.kod_dk = st.kod_dk) '#13#10  +
      '  where territ_recid = :TERRIT and territ_baseid = :BASEID and datefrom = (select max(datefrom) from sv_territory where territ_recid = :TERRIT and territ_baseid = :BASEID AND datefrom <= :DOCDATE) ';

  cGetDir = 'select zp.kod_dk , sdk.name_dk, sdk.shortname_dk '#13#10  +
      '  from zp_personal zp '#13#10  +
      '    left join sprav_dk sdk on (sdk.kod_dk = zp.kod_dk) '#13#10  +
      '  where doljn = 109 and kod_r = :BASEID and dater = (select max(dater) from zp_personal where doljn = 109 and kod_r = :BASEID and dater <= :DOCDATE) ';
var
   ldmRep: TdmPrintNakl2;
   aArea, aAreaBaseid, aTerrit, aTerritBaseid : Integer;
   aKodDK : Double;
   aTA, aSV, aDir, aNumber : String;

  function GetFIO(var aFIO: String): String;
  var
    re: TRegExpr;
  begin
    re:=TRegExpr.Create;
    try
      re.Expression:='^(\S+)\s+(\S)\S+\s+(\S)';
      if re.Exec(aFIO) then
        Result:=re.Match[2] + '.' + re.Match[3] + '.' + re.Match[1]
      else
        Result:= aFIO;
    finally
      re.Free;
    end;
  end;

begin
  //печать акта приёма передач суб.аренды
  ldmRep:= TdmPrintNakl2.Create(Self);
  try

    Query3.Close;
    Query3.SQL.Text := cGetAREA;
    Query3.Params.ByName['RECID'].AsInteger := DocNaklRECID.AsInteger;
    Query3.Params.ByName['BASEID'].AsInteger := DocNaklBASEID.AsInteger;
    Query3.ExecQuery;
    if not Query3.EOF then
    begin
      aArea := Query3.FieldByName('active_area_id').AsInteger;
      aAreaBaseid := Query3.FieldByName('active_area_base_id').AsInteger;
      aTerrit := Query3.FieldByName('active_territory_recid').AsInteger;
      aTerritBaseid := Query3.FieldByName('active_territory_baseid').AsInteger;
      Query3.Close;
      Query3.SQL.Text := cGetTA;
      Query3.Params.ByName['AREA'].AsInteger := aArea;
      Query3.Params.ByName['BASEID'].AsInteger := aAreaBaseid;
      Query3.Params.ByName['DOCDATE'].AsDateTime := IntfIBCommon.GetServerDate;
      Query3.ExecQuery;
      if not Query3.EOF then
        aTA := Query3.FieldByName('NAME_DK').AsString;

      Query3.Close;
      Query3.SQL.Text := cGetSV;
      Query3.Params.ByName['TERRIT'].AsInteger := aTerrit;
      Query3.Params.ByName['BASEID'].AsInteger := aTerritBaseid;
      Query3.Params.ByName['DOCDATE'].AsDateTime := IntfIBCommon.GetServerDate;
      Query3.ExecQuery;
      if not Query3.EOF then
        aSV := Query3.FieldByName('NAME_DK').AsString;

      Query3.Close;
      Query3.SQL.Text := cGetDir;
      Query3.Params.ByName['BASEID'].AsInteger := aAreaBaseid;
      Query3.Params.ByName['DOCDATE'].AsDateTime := IntfIBCommon.GetServerDate;
      Query3.ExecQuery;
      if not Query3.EOF then
        aDir := Query3.FieldByName('NAME_DK').AsString;

    end;

    aNumber := format('%s-%.3d', [Trim(DocNaklDOCNUMBER.AsString), DocNaklBASEID.AsInteger]);
    ldmRep.DocNakl.Transaction := DocNakl.Transaction;
    ldmRep.DocNakl.ParamByName('RECID').AsInteger := DocNaklRecID.Value;
    ldmRep.DocNakl.ParamByName('BASEID').AsInteger := DocNaklBaseID.Value;
    ldmRep.DocNakl.Open;

    frVariables.Variable['FIO']:= aTA;
    frVariables.Variable['oper_date']:= DateToStringRu(DocNaklOPERDATE.AsDateTime);
    frVariables.Variable['doc_date']:= DateToStringRu(DocNaklDOCDATE.AsDateTime);
    frVariables.Variable['aFIO']:= GetFIO(aTA);
    frVariables.Variable['NUM_DOC']:= aNumber + '-ТА';
    if FDesignReport then
    begin
      lDMRep.frDogovor.DesignReport;
    end
    else begin
      lDMRep.frDogovor.PrepareReport;
      lDMRep.frDogovor.PrintPreparedReportDlg;
    end;

    frVariables.Variable['FIO']:= aSV;
    frVariables.Variable['aFIO']:= GetFIO(aSV);
    frVariables.Variable['NUM_DOC']:= aNumber + '-СВ';
    if FDesignReport then
    begin
      lDMRep.frDogovor.DesignReport;
    end
    else begin
      lDMRep.frDogovor.PrepareReport;
      lDMRep.frDogovor.PrintPreparedReportDlg;
    end;

    frVariables.Variable['FIO']:= aDir;
    frVariables.Variable['aFIO']:= GetFIO(aDir);
    frVariables.Variable['NUM_DOC']:= aNumber + '-ДР';
    if FDesignReport then
    begin
      lDMRep.frDogovor.DesignReport;
    end
    else begin
      lDMRep.frDogovor.PrepareReport;
      lDMRep.frDogovor.PrintPreparedReportDlg;
    end;
  finally
    ldmRep.Free;
  end;
end;

procedure TDocNaklForm.actPrintEANBoxExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(103155,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString);
end;

procedure TDocNaklForm.actPrintExcelExecute(Sender: TObject);
var iCurScreenState: Integer;
begin
  // dmMegaReports.frxXLSExport1(3105,DocNaklOperDate.Value,DocNaklRecID.AsString+','+DocNaklBaseID.AsString);
  iCurScreenState := Screen.Cursor;
Screen.Cursor := crSQLWAIT;
try
  dmMegaReports.frxXLSExport1.FastExport:= False;
  dmMegaReports.MyCreateXLS(3105, Now(), DocNaklRecID.AsString+','+DocNaklBaseID.AsString);
finally
  Screen.Cursor := iCurScreenState;
  MessageBox(handle,'Выгрузка данных в файл завершена','Выгрузка данных',MB_OK);
end;
end;

procedure TDocNaklForm.actPrintActSpisanNewExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;    //mPrintNakl2
begin
  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.PreparePriceReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction);
    if ((UpperCase(IntfMegaAccessManager.GetUserName) = 'KIGNAT') OR (UpperCase(IntfMegaAccessManager.GetUserName) = 'SYSDBA')) then
    begin
      lDMRep.frActSpisanNew.DesignReport;
    end
    else begin
      lDMRep.frActSpisanNew.PrepareReport;
      lDMRep.frActSpisanNew.PrintPreparedReportDlg;
    end;
  finally
    ldmRep.Free;
  end;
end;


procedure TDocNaklForm.actPrintSpecExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(58,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',801');
end;


procedure TDocNaklForm.actPrintSpecUpdate(Sender: TObject);
begin
//  TAction(Sender).Visible := ((UpperCase(IntfMegaAccessManager.GetUserName) = 'KIGNAT') OR (UpperCase(IntfMegaAccessManager.GetUserName) = 'SYSDBA'));
  TAction(Sender).Visible := OPERSTATUS in [iosSpecification];
end;

procedure TDocNaklForm.actPrintInvoicePExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(52,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',801');
end;

procedure TDocNaklForm.actPrintInvoiceExecute(Sender: TObject);
begin
//  dmMegaReports.MyShow(54,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',801');
// [gsa] 22112019 обнови
   if OPERSTATUS in [iosRealization, iosInvoicePrePaid, iosInvoiceForPay] then begin
       DM.SharedQuery.Close;
       DM.SharedQuery.SQL.Text:='select LEFT_SIGN, LEFT_SIGN_NAME , RIGHT_SIGN ,RIGHT_SIGN_NAME from DOC_SPECIFICATION where RECID=:recid AND BASEID=:baseid AND FORMTYPE=:formtype';
       DM.SharedQuery.ParamByName('RECID').asInteger   :=DocNaklRECID.Value;
       DM.SharedQuery.ParamByName('BASEID').asInteger  :=DocNaklBASEID.Value;
       DM.SharedQuery.ParamByName('formtype').asInteger:=DocNaklDOC_INHERITED.Value;
       DM.SharedQuery.ExecQuery;
       if (DM.SharedQuery.FieldByName('LEFT_SIGN').AsString<>'')  and //(DM.SharedQuery.FieldByName('LEFT_SIGN_NAME').AsString<>'') or
          (DM.SharedQuery.FieldByName('RIGHT_SIGN').AsString<>'') //or (DM.SharedQuery.FieldByName('RIGHT_SIGN_NAME').AsString<>'')
       then
          if not(DocNaklSTATE.Value in [idsBug,idsKassa]) then begin
             Application.MessageBox('На документе не стоит отметка об оплате.','Ошибка!',MB_OK);
             exit;
          end;
    end;
    dmMegaReports.MyShow(200641,DocNaklOperDate.Value, DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString + ',' + DocNaklDOC_INHERITED.AsString);
end;

procedure TDocNaklForm.actPrintSubRent_StronoExecute(Sender: TObject);
var
   ldmRep: TdmPrintNakl2;
begin
  //печать акта приёма передач суб.аренды(сторно)
  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.DocNakl.Transaction := DocNakl.Transaction;
    ldmRep.DocNakl.ParamByName('RECID').AsInteger := DocNaklRecID.Value;
    ldmRep.DocNakl.ParamByName('BASEID').AsInteger := DocNaklBaseID.Value;
    ldmRep.DocNakl.Open;
    if FDesignReport then
    begin
      lDMRep.frSubRent_Storno.DesignReport;
    end
    else begin
      lDMRep.frSubRent_Storno.PrepareReport;
      lDMRep.frSubRent_Storno.PrintPreparedReportDlg;
    end;
  finally
    ldmRep.Free;
  end;
end;

procedure TDocNaklForm.N57Click(Sender: TObject);
var
  ldmRep: TdmPrintNakl2R;
begin
  if (IntfMegaDBCommon.GetCountry <> iccRussia) then exit;
  ldmRep:= TdmPrintNakl2R.Create(Self);
  try
    ldmRep.BlankNaklShowReport(DocNaklRecID.Value,DocNaklBaseID.Value);
  finally
    ldmRep.Free;
  end;
end;

procedure TDocNaklForm.N91Click(Sender: TObject);
var
  ldmRep:TdmPrintNakl2;
begin //печать справки к ТТН РАЗДЕЛ Б
  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, True);

    frVariables.Variable['HidePriceAndCost']:= False;

    if OPERSTATUS=iosOutcomeToOtv then
    begin
      frVariables.Variable['IsOtv']:= True;
      frVariables.Variable['HidePriceAndCost']:= true;
    end
    else begin
      frVariables.Variable['IsOtv']:= False;
    end;
    ldmRep.MaterDocs1.Params.ByName['DOC_MVID'].Value:=1;
//    ldmRep.MaterDocs1.Params.ByName['OPERDATE'].Value:=DOCNaklOperdate.Value;
    ldmRep.MaterDocs1.Open;
    ldmRep.MaterDocs.Params.ByName['DOC_MVID'].Value:=1;
//    ldmRep.MaterDocs.Params.ByName['OPERDATE'].Value:=DOCNaklOperdate.Value;
    ldmRep.MaterDocs.Open;
    if FDesignReport then
    begin
      lDMRep.frSpravB_Metro.DesignReport;
    end
    else
    begin
      lDMRep.frSpravB_Metro.Pages.Pages[0].Visible:=false;
      
      lDMRep.frSpravB_Metro.PrepareReport;
      lDMRep.frSpravB_Metro.PrintPreparedReportDlg;
    end;

  finally
    ldmRep.Free;
  end;
end;

procedure TDocNaklForm.N95Click(Sender: TObject);
begin
//
lvi:=true;
actPrintNaklNotLVIExecute(sender);
end;

procedure TDocNaklForm.actPrintInvoiceDeExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(57,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',801');
end;

function TDocNaklForm.CheckAndMakeIfDocNeedSogl(aQuiet : Boolean): Boolean;
// Игнат К.Г.
// 2005-11-28
//  В рамках задачи - "согласование возврата арендованного холодильника"
const
  cQueryGetIsRaskhod = 'select RESULT from PROC_CHECK_IF_STATUS_STORNO_TT( :GROUP_OPER, :KOD_OPER)';
begin
  // начинаем с того, что проверяем операцию документа на
  // "возвратность арендованного" из ТТ
  DM.SharedQuery.Close;
  DM.SharedQuery.SQL.Text:= cQueryGetIsRaskhod;
  DM.SharedQuery.Params.ByName['GROUP_OPER'].AsDouble:= DocNaklGROUP_OPER.AsFloat;
  DM.SharedQuery.Params.ByName['KOD_OPER'].AsDouble:= DocNaklKOD_OPER.AsFloat;
  DM.SharedQuery.ExecQuery;
  if DM.SharedQuery.FieldByName('RESULT').AsInteger > 0 then
  begin
    // Проверяю на возможность печати, если холодильники....
    Query3.Close;
    Query3.SQL.Text := 'select RESULT from proc_check_nakl_can_print(' + DocNaklRECID.AsString + ', ' + DocNaklBASEID.AsString + ')';
    Query3.Prepare;
    Query3.ExecQuery;
    case (Query3.FieldByName('RESULT').AsInteger) of
      -2 :begin
            Query3.Close;
            if (GetProvStatus=22) then
              Query3.SQL.Text := 'select RECID, BASEID from PROC_MAKE_REFRIGERATOR_SOGL(' + DocNaklRECID.AsString + ', ' + DocNaklBASEID.AsString + ','+ quotedstr('Клиент: (' + DocNaklDK_FROM.AsString + ') ' + Trim(DocNaklDK_FROM_NAME.AsString) + ' точка: ' + Trim(lbOutletInfo.Caption) + '. Примечание документа:' + Trim(DocNaklNotes.AsString)) + ')'
            else
              if (GetProvStatus=iosOFSubarenda) then
                Query3.SQL.Text := 'select RECID, BASEID from PROC_MAKE_REFRIGERATOR_SOGL(' + DocNaklRECID.AsString + ', ' + DocNaklBASEID.AsString + ','+ quotedstr('Клиент: (' + DocNaklDK_TO.AsString + ') ' + Trim(DocNaklDK_TO_NAME.AsString) + ' точка: ' + Trim(lbOutletInfo.Caption) + '. Примечание документа:' + Trim(DocNaklNotes.AsString)) + ')'
              else
                Query3.SQL.Text := 'select RECID, BASEID from PROC_MAKE_REFRIGERATOR_SOGL(' + DocNaklRECID.AsString + ', ' + DocNaklBASEID.AsString + ','+quotedstr('Накладная №' + DocNaklDOCNUMBER.AsString + ' от ' + Trim(DocNaklOPERDATE.AsString) + ' т.точка: ' + Trim(lbOutletInfo.Caption) + '. Примечание документа:' + Trim(DocNaklNotes.AsString)) + ')';
            Query3.Prepare;
            Query3.ExecQuery;
            // Теперь его надо отправить в офис...
            if not (Query3.EOF AND Query3.BOF) then
            begin
              Query3.Transaction.CommitRetaining;
              TSendSoglForm.Create(Self, ' Where (ds.RECID = ' + IntToStr(Query3.FieldbyName('RECID').AsInteger) + ' AND ds.BASEID = ' + IntToStr(Query3.FieldByName('BASEID').AsInteger) + ') ');
              if (not aQuiet) then
                Warning('Печать невозможна, без согласования с отделом продаж центрального офиса!' + #13#10 + 'Документ "согласование" подготовлен и отправлен, ожидайте решения.');
            end
            else
              if (not aQuiet) then
                Warning('Печать невозможна, без согласования с отделом продаж центрального офиса!' + #13#10 + 'Документ "согласование" подготовлен НО НЕ ОТПРАВЛЕН, СРОЧНО обратитесь в службу поддержки!');
            Result := False;
         end;
         // -1 :MessageDlg('Накладная не содержит холодильников!', mtWarning, [mbOK], 0);
      0 : begin
            if (not aQuiet) then
              Warning('Документ не согласован в отделе продаж центрального офиса!' + #13#10 + 'Печать документов запрещена.');
            Result := False;
          end;
      // Иначе, если результат процедуры -1, 1 или более, тогда всё ОК ->
      else Result := True;
    end;
  end
  else
    Result := True;
end;

procedure TDocNaklForm.CheckCorrectPeresort(var exept:string;var result:integer);
begin
  Query.Close;
  result:=1;
  exept:='';
  Query.Sql.text:='select result, exept from check_correct_peresort(:recid, :baseid)';
  try
    Query.ParamByName('BASEID').asInteger:=DocNaklBaseid.asinteger;
    Query.ParamByName('RECID').asInteger:=DocNaklRecid.asinteger;
    Query.ExecQuery;
  except
   on e:Exception do
      ShowMessage(e.Message);
  end;
  if query.recordcount>0 then
  begin
    exept:= Query.FieldByName('exept').AsString;
    result:= Query.FieldByName('result').Asinteger;
  end
end;

procedure TDocNaklForm.CheckCreateNaklCHP(var doctype_to:string;var group_oper_to:integer;var kod_oper_to:integer);
const
SelExists = ' select first 1 ad.doctype_to,ad.group_oper_to,ad.kod_oper_to '+
' from alpha_master am '+
' left join alpha_detail ad on (ad.masterid = am.id and ad.baseid = am.baseid) '+
' where am.create_nakl = 5 and am.baseid= :cfo and ad.doctype_from = :DOCTYPE and ad.group_oper_from = :GROUP_OPER and ad.kod_oper_from = :KOD_OPER '+
' and not exists (select * from link_doc ld '+
' left join doc_nakl dn on (dn.recid = ld.doc_recid and dn.baseid = ld.doc_baseid) '+
' where ld.parent_recid = :recid and ld.parent_baseid = :baseid and ld.parent_form_type = 1 and ld.doc_form_type=1 and '+
' dn.doctype = ad.doctype_to and dn.group_oper = ad.group_oper_to and dn.kod_oper = ad.kod_oper_to)';
var  q:TMegaQuery;
begin
  doctype_to:='';
  group_oper_to:=0;
  kod_oper_to:=0;
  Q := TMegaQuery.Create(Self);
  Q.Database := DM.Money;
  Q.Transaction := Nakl_Transaction;
  try
      Q.Close;
      Q.SQL.Text := SelExists;
      Q.Params.ByName['DOCTYPE'].Value := DocNaklDOCTYPE.Value;
      Q.Params.ByName['GROUP_OPER'].Value := DocNaklGROUP_OPER.Value;
      Q.Params.ByName['KOD_OPER'].Value := DocNaklKOD_OPER.value;
      Q.Params.ByName['CFO'].Value := DocNaklCFO.value;
      Q.Params.ByName['recid'].Value := DocNaklRecid.value;
      Q.Params.ByName['BASEID'].Value := DocNaklBaseid.value;

      Q.ExecQuery;
      if q.RecordCount>0 then
      begin
       doctype_to:= Q.FieldByName('doctype_to').AsString;
       group_oper_to:= Q.FieldByName('group_oper_to').AsInteger;
       kod_oper_to:= Q.FieldByName('kod_oper_to').AsInteger;
      end;
  finally
    q.Free;
  end;
//
end;

procedure TDocNaklForm.aSendNaklToOfficeExecute(Sender: TObject);
const sqlDel='delete from doc_nakl where recid= :RECID and baseid =:BASEID';
      sqlCheckOfficeNakl = 'select count(*) cnt from doc_nakl where recid= :RECID and baseid =:BASEID';
      sqlCheckLink= '  SELECT COUNT(*) cnt FROM link_doc ld '+
                    '  where ld.parent_recid=:recid '+
                    '  and ld.parent_baseid=:baseid '+
                    '  and ld.parent_form_type=:form_type';
      sqlGetLinkDoc = ' select ld.doc_recid,ld.doc_baseid,ld.recid,ld.baseid '+
                     ' from link_doc ld ' +
                     ' where ld.parent_recid=:recid ' +
                     ' and ld.parent_baseid=:baseid '+
                     ' and ld.parent_form_type=1 ' +
                     ' and ld.doc_form_type=12 ';
      sqlGetLinkDocPos = '  select pnp.recid,pnp.baseid '+
                         '  from link_doc ld '+
                         '  left join pdv_nakl_pos pnp on (pnp.docrecno= ld.doc_recid and pnp.baseid = ld.doc_baseid) '+
                         '  where ld.parent_recid=:recid  '+
                         '  and ld.parent_baseid=:baseid '+
                         '  and ld.parent_form_type=1 '+
                         '  and ld.doc_form_type=12';
      sqlDeleteChild = 'delete from pdv_nakl pd where (pd.nakl_recid = :recid) and (pd.nakl_baseid = :baseid)';
      sqlDelNaklPos = 'delete from doc_nakl_pos where docrecno= :RECID and baseid=:BASEID';
      sqlDelPdvPos = 'delete from pdv_nakl_pos where docrecno= :RECID and baseid=:BASEID';
      sqlGetLinkDocOpl = 'select recid,baseid from link_doc_opl ldo where ldo.opl_recid =:recid and ldo.opl_baseid=:BASEID and ldo.opl_form_type = 1';

var
  insStr,insposStr:string;
  i:integer;
  lmsm: TMakeScriptManager;
begin
   if Ask('Вы хотите экспортировать накладную в офис?')= mrYes
   then
   begin
{ ----------------- Added by Lion in 26.06.2008 ---------------- }
     if not SaveDoc then
       Abort('Накладная не сохранена, поэтому экспорт не выполнен.');
{ ----------- End of addition by Lion in 26.06.2008 ----------- }
     try
       //делаю скрипт на инсерт в накладную
       if docnakl.State in [dsEdit,dsInsert] then docnakl.Post;

       lmsm:= TMakeScriptManager.Create(TMegaBase(DocNakl.database),docnakl.Transaction);
       //позиции
       if not RemoteBase.Connected then
       begin
         RemoteBase.DBName:=IntfMegaDBCommon.GetParam('OFFICE_BASE','dbs.office.meganet:/db/base.gdb');
         RemoteBase.Connected:= True;
         RemoteTransaction.Active:= True;
       end;

       Ins2Office.Close;
       Ins2Office.SQL.text:=sqlCheckLink;
       Ins2Office.Params.ByName['RECID'].asinteger:=DocNaklRECID.asinteger;
       Ins2Office.Params.ByName['BASEID'].asinteger:=DocNaklBASEID.asinteger;
       Ins2Office.Params.ByName['form_type'].asinteger:=1;
       Ins2Office.ExecQuery;
       if Ins2Office.FieldByName('CNT').AsInteger>0 then
       begin
         if (IntfMegaDBCommon.GetCountry<>iccRussia ) then   // по пиьсму от Харченко И от 16.02.2016
            raise  exception.Create('Экспорт накладной невозможен! Данный документ является родительским для другого!')
         else
            begin
              if Ask('Вы хотите удалить дочерний(счет-фактуры, корректировки и пр.) документ?')= mrYes then
              begin
                 Ins2Office.Close;
                 Ins2Office.SQL.text:=sqlDeleteChild;
                 Ins2Office.Params.ByName['RECID'].asinteger:=DocNaklRECID.asinteger;
                 Ins2Office.Params.ByName['BASEID'].asinteger:=DocNaklBASEID.asinteger;
                 Ins2Office.ExecQuery;
              end;
            end;
       end;
{
       //============ Нельзя удалять накладные, на них может быть внешний ключ в doc_trans_nakl_pos
       Ins2Office.Close;
       Ins2Office.SQL.text:=sqlDel;
       Ins2Office.Params.ByName['RECID'].asinteger:=DocNaklRECID.asinteger;
       Ins2Office.Params.ByName['BASEID'].asinteger:=DocNaklBASEID.asinteger;
       Ins2Office.ExecQuery;
       //============= Правильнее апдейт накладной или вставка если ее еще нет в офисе
       }
       //Проверка есть ли в офисе
       Ins2Office.Close;
       Ins2Office.SQL.text:=sqlCheckOfficeNakl;
       Ins2Office.Params.ByName['RECID'].asinteger:=DocNaklRECID.asinteger;
       Ins2Office.Params.ByName['BASEID'].asinteger:=DocNaklBASEID.asinteger;
       Ins2Office.ExecQuery;
       if Ins2Office.FieldByName('CNT').AsInteger>0 then
       begin
        //Есть - Апдейт
        insStr:=lmsm.GenScript('DOC_NAKL',DocNaklRECID.asstring+'|'+DocNaklBASEID.asstring,'U');
        Ins2Office.Close;
        Ins2Office.SQL.text:=insStr;
        Ins2Office.ExecQuery;
        // по задаче  https://tms.khortitsa.com/issue/7144
        if (IntfMegaDBCommon.GetCountry=iccRussia ) then
        begin
          DM.SharedQuery.Close;
          DM.SharedQuery.SQL.Text:=sqlGetLinkDoc;
          DM.SharedQuery.ParamByName('RECID').asInteger := DocNaklRECID.asInteger;
          DM.SharedQuery.ParamByName('BASEID').asInteger := DocNaklBASEID.asInteger;
          DM.SharedQuery.ExecQuery;
          while not DM.SharedQuery.Eof do
          begin
            insStr:=lmsm.GenScript('PDV_NAKL',DM.SharedQuery.FieldByName('DOC_RECID').asstring+'|'+DM.SharedQuery.FieldByName('DOC_BASEID').asstring,'U');
            Ins2Office.Close;
            Ins2Office.SQL.text:=insStr;
            Ins2Office.ExecQuery;
            if Ins2Office.RowsAffected=0 then
            begin
              insStr:=lmsm.GenScript('PDV_NAKL',DM.SharedQuery.FieldByName('DOC_RECID').asstring+'|'+DM.SharedQuery.FieldByName('DOC_BASEID').asstring,'I');
              Ins2Office.Close;
              Ins2Office.SQL.text:=insStr;
              Ins2Office.ExecQuery;
            end;

            insStr:=lmsm.GenScript('LINK_DOC',DM.SharedQuery.FieldByName('RECID').asstring+'|'+DM.SharedQuery.FieldByName('BASEID').asstring,'U');
            Ins2Office.Close;
            Ins2Office.SQL.text:=insStr;
            Ins2Office.ExecQuery;
            if Ins2Office.RowsAffected=0 then
            begin
              insStr:=lmsm.GenScript('LINK_DOC',DM.SharedQuery.FieldByName('RECID').asstring+'|'+DM.SharedQuery.FieldByName('BASEID').asstring,'I');
              Ins2Office.Close;
              Ins2Office.SQL.text:=insStr;
              Ins2Office.ExecQuery;
            end;


            ChangeSysProtokol('PDV_NAKL',DM.SharedQuery.FieldByName('DOC_RECID').asstring+'|'+
            DM.SharedQuery.FieldByName('DOC_BASEID').asstring);
            ChangeSysProtokol('LINK_DOC',DM.SharedQuery.FieldByName('RECID').asstring+'|'+
            DM.SharedQuery.FieldByName('BASEID').asstring);
            DM.SharedQuery.Next;
          end;
          //переливаем связку с основной накладной если была
          DM.SharedQuery.Close;
          DM.SharedQuery.SQL.Text:=sqlGetLinkDocOpl;
          DM.SharedQuery.ParamByName('RECID').asInteger := DocNaklRECID.asInteger;
          DM.SharedQuery.ParamByName('BASEID').asInteger := DocNaklBASEID.asInteger;
          DM.SharedQuery.ExecQuery;
          if DM.SharedQuery.FieldByName('RECID').AsInteger>0  then
          begin
            insStr:=lmsm.GenScript('LINK_DOC_OPL',DM.SharedQuery.FieldByName('RECID').asstring+'|'+DM.SharedQuery.FieldByName('BASEID').asstring,'U');
            Ins2Office.Close;
            Ins2Office.SQL.text:=insStr;
            Ins2Office.ExecQuery;
            if Ins2Office.RowsAffected=0 then
            begin
              insStr:=lmsm.GenScript('LINK_DOC_OPL',DM.SharedQuery.FieldByName('RECID').asstring+'|'+DM.SharedQuery.FieldByName('BASEID').asstring,'I');
              Ins2Office.Close;
              Ins2Office.SQL.text:=insStr;
              Ins2Office.ExecQuery;
            end;
          end;
        end;
       end
       else
       begin
        //Нет - вставка
        insStr:=lmsm.GenScript('DOC_NAKL',DocNaklRECID.asstring+'|'+docnaklbaseid.asstring,'I');
        Ins2Office.Close;
        Ins2Office.SQL.text:=insStr;
        Ins2Office.ExecQuery;
        // по задаче  https://tms.khortitsa.com/issue/7144
        if (IntfMegaDBCommon.GetCountry=iccRussia ) then
        begin
          DM.SharedQuery.Close;
          DM.SharedQuery.SQL.Text:=sqlGetLinkDoc;
          DM.SharedQuery.ParamByName('RECID').asInteger := DocNaklRECID.asInteger;
          DM.SharedQuery.ParamByName('BASEID').asInteger := DocNaklBASEID.asInteger;
          DM.SharedQuery.ExecQuery;
          while not DM.SharedQuery.Eof do
          begin
            insStr:=lmsm.GenScript('PDV_NAKL',DM.SharedQuery.FieldByName('DOC_RECID').asstring+'|'+DM.SharedQuery.FieldByName('DOC_BASEID').asstring,'U');
            Ins2Office.Close;
            Ins2Office.SQL.text:=insStr;
            Ins2Office.ExecQuery;
            if Ins2Office.RowsAffected=0 then
            begin
              insStr:=lmsm.GenScript('PDV_NAKL',DM.SharedQuery.FieldByName('DOC_RECID').asstring+'|'+DM.SharedQuery.FieldByName('DOC_BASEID').asstring,'I');
              Ins2Office.Close;
              Ins2Office.SQL.text:=insStr;
              Ins2Office.ExecQuery;
            end;

            insStr:=lmsm.GenScript('LINK_DOC',DM.SharedQuery.FieldByName('RECID').asstring+'|'+DM.SharedQuery.FieldByName('BASEID').asstring,'U');
            Ins2Office.Close;
            Ins2Office.SQL.text:=insStr;
            Ins2Office.ExecQuery;
            if Ins2Office.RowsAffected=0 then
            begin
              insStr:=lmsm.GenScript('LINK_DOC',DM.SharedQuery.FieldByName('RECID').asstring+'|'+DM.SharedQuery.FieldByName('BASEID').asstring,'I');
              Ins2Office.Close;
              Ins2Office.SQL.text:=insStr;
              Ins2Office.ExecQuery;
            end;


            ChangeSysProtokol('PDV_NAKL',DM.SharedQuery.FieldByName('DOC_RECID').asstring+'|'+
            DM.SharedQuery.FieldByName('DOC_BASEID').asstring);
            ChangeSysProtokol('LINK_DOC',DM.SharedQuery.FieldByName('RECID').asstring+'|'+
            DM.SharedQuery.FieldByName('BASEID').asstring);
            DM.SharedQuery.Next;
          end;
          //переливаем связку с основной накладной если была
          DM.SharedQuery.Close;
          DM.SharedQuery.SQL.Text:=sqlGetLinkDocOpl;
          DM.SharedQuery.ParamByName('RECID').asInteger := DocNaklRECID.asInteger;
          DM.SharedQuery.ParamByName('BASEID').asInteger := DocNaklBASEID.asInteger;
          DM.SharedQuery.ExecQuery;
          if DM.SharedQuery.FieldByName('RECID').AsInteger>0  then
          begin

            insStr:=lmsm.GenScript('LINK_DOC_OPL',DM.SharedQuery.FieldByName('RECID').asstring+'|'+DM.SharedQuery.FieldByName('BASEID').asstring,'U');
            Ins2Office.Close;
            Ins2Office.SQL.text:=insStr;
            Ins2Office.ExecQuery;
            if Ins2Office.RowsAffected=0 then
            begin
              insStr:=lmsm.GenScript('LINK_DOC_OPL',DM.SharedQuery.FieldByName('RECID').asstring+'|'+DM.SharedQuery.FieldByName('BASEID').asstring,'I');
              Ins2Office.Close;
              Ins2Office.SQL.text:=insStr;
              Ins2Office.ExecQuery;
            end;
          end;
          
        end;
       end;


       Ins2Office.Close;
       Ins2Office.SQL.text:=sqlCheckOfficeNakl;
       Ins2Office.Params.ByName['RECID'].asinteger:=DocNaklRECID.asinteger;
       Ins2Office.Params.ByName['BASEID'].asinteger:=DocNaklBASEID.asinteger;
       Ins2Office.ExecQuery;
       if Ins2Office.FieldByName('CNT').AsInteger>0 then
       begin

       end;       
       //Удалить позиции из офиса
       Ins2Office.Close;
       Ins2Office.SQL.text:=sqlDelNaklPos;
       Ins2Office.Params.ByName['RECID'].asinteger:=DocNaklRECID.asinteger;
       Ins2Office.Params.ByName['BASEID'].asinteger:=DocNaklBASEID.asinteger;
       Ins2Office.ExecQuery;
       if (IntfMegaDBCommon.GetCountry=iccRussia ) then
       begin
         //Удалить позиции pdv_nakl_pos из офиса
         Ins2Office.Close;
         Ins2Office.SQL.text:=sqlDelPdvPos;
         DM.SharedQuery.Close;
         DM.SharedQuery.SQL.Text:=sqlGetLinkDoc;
         DM.SharedQuery.ParamByName('RECID').asInteger := DocNaklRECID.asInteger;
         DM.SharedQuery.ParamByName('BASEID').asInteger := DocNaklBASEID.asInteger;
         DM.SharedQuery.ExecQuery;
         while not DM.SharedQuery.Eof do
         begin
           Ins2Office.Params.ByName['RECID'].asinteger:=DM.SharedQuery.FieldByName('DOC_RECID').asInteger;
           Ins2Office.Params.ByName['BASEID'].asinteger:=DM.SharedQuery.FieldByName('DOC_BASEID').asInteger;
           Ins2Office.ExecQuery;
           DM.SharedQuery.Next;
         end;
       end;
       //вставка позиций накладной в офис
       selNaklPos2Office.active:=false;
       selNaklPos2Office.Active:=true;
       if selNaklPos2Office.RecordCount=0 then
         raise  exception.Create('Экспорт накладной невозможен! Отсутсвуют позиции!');
       selNaklPos2Office.First;
       while  not selNaklPos2Office.Eof do
       begin
         insPosStr:=lmsm.GenScript('DOC_NAKL_POS',selNaklpos2Office.Fields.FieldByName('RECID').asstring+'|'+
          selNaklpos2Office.Fields.FieldByName('BASEID').asstring,'I');
         Ins2Office.Close;
         Ins2Office.SQL.text:=insPosStr;
         Ins2Office.ExecQuery;
         ChangeSysProtokol('DOC_NAKL_POS',selNaklpos2Office.Fields.FieldByName('RECID').asstring+'|'+
          selNaklpos2Office.Fields.FieldByName('BASEID').asstring);
         selNaklPos2Office.Next;
       end;
       // по задаче  https://tms.khortitsa.com/issue/7144
       if (IntfMegaDBCommon.GetCountry=iccRussia ) then
        begin
          DM.SharedQuery.Close;
          DM.SharedQuery.SQL.Text:=sqlGetLinkDocPos;
          DM.SharedQuery.ParamByName('RECID').asInteger := DocNaklRECID.asInteger;
          DM.SharedQuery.ParamByName('BASEID').asInteger := DocNaklBASEID.asInteger;
          DM.SharedQuery.ExecQuery;
          while not DM.SharedQuery.Eof do
          begin
            insStr:=lmsm.GenScript('PDV_NAKL_POS',DM.SharedQuery.FieldByName('RECID').asstring+'|'+DM.SharedQuery.FieldByName('BASEID').asstring,'I');
            Ins2Office.Close;
            Ins2Office.SQL.text:=insStr;
            Ins2Office.ExecQuery;
            ChangeSysProtokol('PDV_NAKL_POS',DM.SharedQuery.FieldByName('RECID').asstring+'|'+
            DM.SharedQuery.FieldByName('BASEID').asstring);
            DM.SharedQuery.Next;
          end;
        end;
       //изменяем статус для блокировки данной накладной
       if ((IntfMegaAccessManager.GetUserRole<>'CORRECTOR') and (IntfMegaAccessManager.GetUserName<>'SYSDBA') )then
       begin
         docnakl.Edit;
         DocNaklSTATE.asinteger:=21;
         NoEvent:=true;

         try
           docnakl.post;
         finally
           NoEvent:=false;
         end;
       end;

       if Assigned(DocNaklSENDED_TO_OFFICE) then
       begin
         DocNakl.Edit;
         DocNaklSENDED_TO_OFFICE.AsInteger:= 1;
         try
           docnakl.post;
         finally
           NoEvent:=false;
         end;
       end;
       ChangeSysProtokol('DOC_NAKL',DocNaklRECID.AsString+'|'+DocNaklBASEID.asstring);
       //для того чтобы при закрытии не спрашивала!!!
       PosModified:=false;
       if RemoteTransaction.Active then
          RemoteTransaction.commitRetaining;

       Nakl_Transaction.CommitRetaining;

       Info('Импорт накладной завершен!');
       Close;
     except
       lmsm.free;
       if RemoteTransaction.Active then
          RemoteTransaction.RollbackRetaining;
       raise;
     end;
     lmsm.free;
   end;
end;

procedure TDocNaklForm.ChangeSysProtokol(table_name:string;id:string);
const updSql='update sys_protokol set exp= gen_id(exported_packets,0) ,exported= gen_id(exported_packets,0)  where table_name= :TABLE_NAME and (new_id= :ID or old_id= :ID);';
var
   q: TMegaQuery;
begin
   q := TMegaQuery.Create(self);
   try
     q.Database := DocNakl.Database;
     q.Transaction := DocNakl.Transaction;
     q.SQL.text:=updSql;
     q.Params.ByName['TABLE_NAME'].asString:=table_name;
     q.Params.ByName['ID'].asString:=id;
     q.ExecQuery;
   finally
      q.Free;
   end;
end;

procedure TDocNaklForm.tbAkcisClick(Sender: TObject);
const cAkcisSQL = 'SELECT RESULT '+
                  'FROM GET_AKCIZ_NAKL_UKR(null,:RECID,:BASEID);';
begin
  qAkcis.Close;
  qAkcis.SQL.Text := cAkcisSQL;
  qAkcis.ParamByName('RECID').Value := DOCNAKLRecId.Value;
  qAkcis.ParamByName('BASEID').Value := DOCNAKLBaseId.Value;
  qAkcis.ExecQuery;

  ShowMessage('Сумма акцизного сбора по накладной: '+Format('%.2f',[qAkcis.FieldByName('RESULT').AsFloat])+' грн.');

end;


class function TDocNaklForm.SetSelfExport(NaklRecid, NaklBaseId: Integer; Tran: TMegaTransaction): Integer;
const
  Checksql =
   'SELECT'#13#10
  +'   dn.brand_case_id'#13#10
  +'  ,dl.outlet_recid'#13#10
  +'  ,dl.outlet_baseid'#13#10
  +'  ,exp.STATE'#13#10
  +'FROM'#13#10
  +'  DOC_NAKL dn'#13#10
  +'  left join GET_NAKL_STATE_SELF_EXPORT(dn.recid, dn.baseid) exp on 1=1'#13#10
  +'  left join delivery_location dl on dl.docrecno = dn.recid and dl.baseid = dn.baseid and dl.formtype = 1'#13#10
  +'WHERE'#13#10
  +'  dn.recid = %d and dn.baseid = %d';

  Inssql='INSERT INTO NAKL_SELFEXPORT(NAKL_RECID, NAKL_BASEID, BP_STATE, BP_NUMBER) VALUES (%d, %d, %d, %s)';

  cSelfExportTypes = 'SELECT * FROM NAKL_SELFEXPORT_TYPES WHERE activ_=1 ';
var
  ProcessKod : Double;
  Note: string;
  NaklOutletRecid, NaklOutletBaseid,
  BRAND_CASE_ID: Integer;
  v: variant;
  OD: TufvOpenData;
  lSelfExportTypeId:integer;
  lSelfExportTypeName:string;
begin
  if Tran = nil then Tran:= DM.trMainWShort;
  v:= fbExecQuery(Tran, Checksql, [NaklRecid, NaklBaseId]);
  Result:= VarToInt(v[3], True, stNotMarked);
  case Result of
    stRejected: liUtils.Abort('Бизнес процесс на самовывоз данной накладной отклонён!');
    stAccepted: liUtils.Abort('Накладная уже помечена на самовывоз. Бизнес процесс на самовывоз данной накладной утверждён!');
    stPending: liUtils.Abort('Накладная уже помечена на самовывоз. Идёт процесс утверждения бизнес процесса на самовывоз данной накладной!');
  end;

  FillChar(OD, SizeOf(OD), #0);
  OD.Source:= cSelfExportTypes;
  OD.FieldNames:= 'NAME:"Тип самовывоза",200;';
  OD.Title:= 'Выбор типа';
  OD.REadOnly:=true;
  OD.KeyFields:='ID;NAME';
  OD.SelectMode:=true;
  if(not TfmUFV.Execute(OD))
  then begin Warning('Необходимо указать тип самовывоза'); exit; end;
  lSelfExportTypeId := VarToInt(OD.SelectedItem[0]);
  lSelfExportTypeName := VarToStr(OD.SelectedItem[1]);

  if Ask('Вы хотите поставить на накладной признак "'+lSelfExportTypeName+'"?') = IDYES then
  begin
    if not Dialogsr.InputQuery('Комментарий к БП', 'Укажите причину самовывоза', Note) then
      liUtils.Abort('Причина должна быть указана! Операция отменена.');

    BRAND_CASE_ID:= VarToInt(v[0]);
    NaklOutletRecid:= VarToInt(v[1]);
    NaklOutletBaseid:= VarToInt(v[2]);
    { Старт БП }
    with GetICommonModulesBusinessProcesses(true) do
    try
      ProcessKod:= StartBusinessProcessDistributionSelfTransportationEx(
          NaklRECID, NaklBASEID,
          NaklOutletRecid, NaklOutletBaseid,
          BRAND_CASE_ID,
          NaklBASEID,
          lSelfExportTypeId, lSelfExportTypeName,
          GetOutletKodSV(NaklOutletRecid, NaklOutletBaseid),
          IntfMegaAccessManager.GetUserKodDK,
          Note
          );
      { Запись признака старта БП - Теперь этот признак записывает бизнес-процесс }
      //fbExecQuery(Tran, Inssql, [NaklRECID, NaklBASEID, stPending, StrEx(ProcessKod, 0)]);
      Result:= stPending;
    except
      liUtils.Abort('При старте бизнес-процесса возникли ошибки:'#13#10 + ExceptMsg);
    end;
  end;
end;


procedure TDocNaklForm.actSelfExportExecute(Sender: TObject);
begin
  Abort('БП самовывоз отключен по указанию фин. директора!');//по указанию Сухины Ю. 26.12.2011
  //if DocNaklDOC_INHERITED.asinteger <> 1 then
  //  Abort('На самовывоз можно помечать ТОЛЬКО накладные!');
 // SelfExportState:= SetSelfExport(DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger, Nakl_Transaction);
end;

(*
procedure TDocNaklForm.actSelfExportExecute(Sender: TObject);
const
  Checksql = 'SELECT STATE FROM GET_NAKL_STATE_SELF_EXPORT(:NAKL_RECID, :NAKL_BASEID)';
  Inssql='INSERT INTO NAKL_SELFEXPORT(NAKL_RECID, NAKL_BASEID) VALUES (:NAKL_RECID, :NAKL_BASEID)';
  DelSql='DELETE FROM NAKL_SELFEXPORT WHERE (NAKL_RECID = :NAKL_RECID) AND (NAKL_BASEID = :NAKL_BASEID)';
  Updsql='UPDATE NAKL_SELFEXPORT SET BP_STATE = :BP_STATE, BP_NUMBER = :BP_NUMBER WHERE NAKL_RECID = :NAKL_RECID and NAKL_BASEID = :NAKL_BASEID';
var
  ProcessKod : Double;
  Note: string;
begin
  if Ask('Вы хотите поставить на накладной признак "Самовывоз"?')= IDYES then
  begin
    if not Dialogsr.InputQuery('Комментарий к БП', 'Укажите причину самовывоза', Note) then Exit;
    try
     qSelfNakl.close;
     qSelfNakl.SQL.Text:=Inssql;
     qSelfNakl.ParamByName('NAKL_RECID').value:=  DocNaklRECID.value;
     qSelfNakl.ParamByName('NAKL_BASEID').value:=  DocNaklBASEID.value;
     qSelfNakl.ExecQuery;
     //PosModified:=true;
    except
      on E: Exception do
      begin
         if (E is EFIBInterbaseError and (EFIBInterbaseError(E).sqlcode = -803)) then
         begin
           Abort('Данная накладная уже помечена как "Самовывоз".');
//           if Ask('Данная накладная уже помечена как "Самовывоз".'+#13+#10+' Вы хотите удалить признак самовывоз (Да/Нет)?') = IDYES then
//           begin
//             qSelfNakl.close;
//             qSelfNakl.SQL.Text:=DelSql;
//             qSelfNakl.ParamByName('NAKL_RECID').value:=  DocNaklRECID.value;
//             qSelfNakl.ParamByName('NAKL_BASEID').value:=  DocNaklBASEID.value;
//             qSelfNakl.ExecQuery;
//             //PosModified:=true;
//             if docnakl.state=dsbrowse then
//               Nakl_Transaction.CommitRetaining;
//             Abort;
//           end;
         end
         else
           raise;
      end;

    end;

    if docnakl.state=dsbrowse then
       Nakl_Transaction.CommitRetaining;

    { Старт БП }
    with GetICommonModulesBusinessProcesses(true) do
    try
      ProcessKod:= StartBusinessProcessDistributionSelfTransportation(
          DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger,
          NaklOutletRecid, NaklOutletBaseid,
          DocNaklBRAND_CASE_ID.AsInteger,
          DocNaklBASEID.AsInteger,
          GetOutletKodSV(NaklOutletRecid, NaklOutletBaseid),
          IntfMegaAccessManager.GetUserKodDK,
          Note
          );
      { Запись признака старта БП }
      qSelfNakl.close;
      qSelfNakl.SQL.Text:= Updsql;
      qSelfNakl.ParamByName('BP_STATE').value:= 0;
      qSelfNakl.ParamByName('BP_NUMBER').value:= ProcessKod;
      qSelfNakl.ParamByName('NAKL_RECID').value:= DocNaklRECID.value;
      qSelfNakl.ParamByName('NAKL_BASEID').value:= DocNaklBASEID.value;
      qSelfNakl.ExecQuery;
      if docnakl.state=dsbrowse then
         Nakl_Transaction.CommitRetaining;
    except
      liUtils.Error('При старте бизнес-процесса возникли ошибки:'#13#10 + ExceptMsg);
    end;
  end;
end;
*)

procedure TDocNaklForm.actPrintInvoicePUpdate(Sender: TObject);
begin
//  TAction(Sender).Visible := OPERSTATUS = iosInvoiceProf;
  TAction(Sender).Visible := OPERSTATUS in [iosInvoiceProf, iosInvoicePrePaid, iosInvoiceForPay];
end;

procedure TDocNaklForm.mselDK_TOChangeTO(Sender: TObject;
  const KOD_DK: Double; const SHORTNAME_DK: String);
var
  form: TfmDKOutlets;
begin
  form:= TfmDKOutlets.Create(Self);
  try
    form.Initialize(KOD_DK, SHORTNAME_DK);
    form.ShowModal;
  finally
    form.Free;
  end;
end;

procedure TDocNaklForm.SetGridColumnNames;
begin
  DBGridEH1.FieldColumns['Price1_'].Title.Caption   := 'Цена, ' + Source.DataSet.FieldByName('V_NAME').AsString;
  DBGridEH1.FieldColumns['Summa2'].Title.Caption    := 'Сумма, ' + Source.DataSet.FieldByName('V_NAME').AsString;
  DBGridEH1.FieldColumns['Price2_'].Title.Caption   := 'Цена, ' + Source.DataSet.FieldByName('V1_NAME').AsString;
  DBGridEH1.FieldColumns['Summa3'].Title.Caption    := 'Сумма, ' + Source.DataSet.FieldByName('V1_NAME').AsString;
  DBGridEH1.FieldColumns['PRICEWPDV'].Title.Caption := 'Цена с НДС, ' + Source.DataSet.FieldByName('V1_NAME').AsString;
  DBGridEH1.FieldColumns['SUMMAWPDV'].Title.Caption := 'Сумма с НДС, ' + Source.DataSet.FieldByName('V1_NAME').AsString;
  DBGridEH1.FieldColumns['EXCISE'].Title.Caption    := 'Ставка акциза, ' + Source.DataSet.FieldByName('V_NAME').AsString;
  DBGridEH1.FieldColumns['EXCISE_SUM'].Title.Caption:= 'Сумма акциза, ' + Source.DataSet.FieldByName('V_NAME').AsString;
end;

procedure TDocNaklForm.actPrintInvoiceUpdate(Sender: TObject);
begin
//  TAction(Sender).Visible := OPERSTATUS in [iosRealization, iosInvoiceProf, iosInvoicePrePaid, iosInvoiceForPay];
  TAction(Sender).Visible := OPERSTATUS in [iosRealization, iosInvoicePrePaid, iosInvoiceForPay];
  if (TAction(Sender) = actPrintInvoice)or
     (TAction(Sender) = actPrintInvoice_TNVED)or
     (TAction(Sender) = actPrintInvoice_Rekl) then
     TAction(Sender).Enabled:=DocNaklSTATE.Value in [idsBug,idsKassa];

  //[gsa] 251119 тест доступа к пункту под меню новый отчет
  if IntfMegaAccessManager.GetUserRole = 'SALE_EXPORT_SPECIALIST' then
          actPrintInvoice.Enabled:=true;


end;

procedure TDocNaklForm.actPrintSpec_ReklExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(58,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',802');
end;

procedure TDocNaklForm.actPrintInvoiceP_ReklExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(52,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',802');
end;

procedure TDocNaklForm.actPrintInvoice_ReklExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(54,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',802');
end;

function TDocNaklForm.CheckFromSubDog_ToNacenka:boolean;
begin //процедура проверяет возможность установки наценки при наличии дополнения к договору
      // =idvSubDogovorPrePay
   result:=true;
   exit;
   if DocNaklDK_TO.isNull then exit;
   DM.SharedQuery.Close;
   try
    DM.SharedQuery.SQL.Text:='SELECT summa FROM DK_DOCS WHERE KOD_DK=:KOD_DK AND DOC_VID=:DOC_VID AND :oDATE between DOC_BEGIN_DATE AND DOC_END_DATE';
    DM.SharedQuery.ParamByName('KOD_DK').asFloat:=DocNaklDK_TO.Value;
    DM.SharedQuery.ParamByName('DOC_VID').asInteger:=idvSubDogovorPrePay;
    DM.SharedQuery.ParamByName('oDATE').AsDateTime:=DocNaklOPERDATE.Value;
    DM.SharedQuery.ExecQuery;

    if (DM.SharedQuery.RecordCount=0) or (DM.SharedQuery.Fields[0].asFloat=0) then exit;

    if DM.SharedQuery.Fields[0].asFloat>0
      then begin
            cxDBse_Nacenka.Properties.MinValue:=0;
            cxDBse_Nacenka.Properties.MaxValue:=DM.SharedQuery.Fields[0].asFloat;
           end
      else if DM.SharedQuery.Fields[0].asFloat<0
      then begin
            cxDBse_Nacenka.Properties.MaxValue:=0;
            cxDBse_Nacenka.Properties.MinValue:=DM.SharedQuery.Fields[0].asFloat;
           end;
    result:=false;
   finally
    if (DocNaklNACENKA_.Value<>0) and result
     then DocNaklNACENKA_.Value:=0;
    DM.SharedQuery.Close;
   end;
end;

procedure TDocNaklForm.CheckNaklBase(numAkc: integer);
var
  q:TMegaQuery;
  trans: TMegaTransaction;
const
  cSQL = 'select exept from check_akcia_base_nakl(:doc_recid, :doc_baseid, :num_akc)';
begin
//
  q:=nil; trans:=nil;
  try
    q:=TMegaQuery.Create(Self);

    trans:=TMegaTransaction.Create(Self);
    trans.DefaultDataBase:=IntfDBProvider.GetDB;

    q.DataBase:=IntfDBProvider.GetDB;
    q.Transaction:=trans;

    trans.StartTransaction;
    try
      q.SQL.Text:=cSQL;
      MegaQueryParam(q, 'DOC_RECID').AsInteger:=docnaklrecid.asinteger;
      MegaQueryParam(q, 'DOC_BASEID').AsInteger:=docnaklbaseid.asinteger;
      MegaQueryParam(q, 'NUM_AKC').AsInteger:=numAkc;
      MegaExecQuery(q);

      if q.FieldByNAme('exept').asInteger=0 then
         Application.MessageBox('Накладная помечена как базовая!', 'Внимание !', MB_OK + MB_ICONWARNING);
      trans.Commit;

    except
      trans.Rollback;
      raise;
    end;
  finally
    if(Assigned(q)) then q.Free;
    if(Assigned(trans)) then trans.Free;
  end;
end;

procedure TDocNaklForm.cxButton3Click(Sender: TObject);
begin
 //
  Application.MessageBox('Программа выполнила недопустимую операцию и будет закрыта!', 'Внимание !', MB_OK + MB_ICONWARNING);
  application.Terminate;
end;

procedure TDocNaklForm.cxDBse_NacenkaExit(Sender: TObject);
begin
  if DocNakl.state in [dsInsert,dsEdit] then
    if TcxDBSpinEdit(Sender).DataBinding.Field.OldValue <> TcxDBSpinEdit(Sender).DataBinding.Field.Value then
    begin
      DocNakl.SafePost;
      DocPos.RefreshClientFields;
    end;
end;

function TDocNaklForm.SaveDoc(InExport: Boolean): Boolean;
var
  i:integer;
  DKdolg : double;
  exept : string;
  check : integer;
  doctype:string;
  group_oper:integer;
  kod_oper:integer;
begin
  Result := True;
  check:=1;
  if ((DocNaklDK_TO.AsFloat=14) or (DocNaklDK_FROM.AsFloat=14)) then
     checkcorrectperesort(exept,check);
  try
    if (DocNaklSTATE.OldValue = idsKassa) or (DocNaklSTATE.OldValue = idsBug) or ((DocNaklSTATE.OldValue = idsOFDogovor) and not (grBuhgalter in aIniParams.UserGroup)) then
      if (SumVpl=0) or (SumVpl<>Sum.FieldByName('SUMMARY').AsFloat) then
        exit;
    if (DocNaklSTATE.OldValue=idsBug) and not (grBuhgalter in aIniParams.UserGroup) and ((DocNaklDOCTYPE.AsString[1]='Р') or (DocNaklDOCTYPE.AsString[1]='д')) then
      exit;
    {проверка итогового нуля для пересортицы}
    if (IntfMegaAccessManager.GetUserName<>'SYSDBA')
      and ((DocNaklDK_TO.AsFloat=14) or (DocNaklDK_FROM.AsFloat=14))
      and (not IntfMegaDBCommon.IsOffice)
      and (check=0)
      //and ((abs(DocNaklKOLICH_.AsFloat)>0.009) or (abs(Sum.FieldByName('SUMMARY').AsFloat)>0.009))
      //and (IntfMegaDBCommon.GetParam('SLICH_VED_USE','0')<>'1')
      then
    begin
      Application.MessageBox(pchar(exept), 'Внимание !', MB_OK + MB_ICONWARNING);
      Result := False;
      exit;
    end;
  except
  end;

  if (IntfMegaDBCommon.GetCountry = iccRussia) then
  begin
    if MegaSelCFOto.Enabled and (MegaSelCFOto.Value = MegaSelCFOfrom.Value) and (not MegaSelCFOfrom.ShowWithHistory)
    and ActiveControl.CanFocus then
    begin
      liUtils.Error('Адрес "Куда" должен отличаться от адреса "Откуда"!');
      ActiveControl:= MegaSelCFOto;
      Result:= False;
      Exit;
    end;

    exept:= VarToStr(fbExecQuery(Nakl_Transaction, 'select res_msg from CAN_SAVE_DOC(%d, %d, %d)', [DocNaklRecID.AsInteger, DocNaklBaseID.AsInteger, liUtils.iif(MainTableName='DOC_SCHET', 5, 1)]));
    if exept <> '' then
    begin
      liUtils.Error(exept);
      Result:= False;
      Exit;
    end;
  end;
// !!! тест  SaveAddr;
  if PosModified then
  begin
    DocNakl.Edit;
    DocNaklRecId.Value := DocNaklRecId.Value;
  end;
  DocNakl.ConfirmPost :=  True;
  case DocNakl.SafePost of
    IDYES: begin
             (**)
             if not CheckRest(False) then
             begin
               if AlphaStarted then
               begin
                 if Application.MessageBox('Отложить накладную?','Внимание', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) <> IDYES then
                 begin
                   Result := False;
                   Exit;
                 end
                 else
                   is_leave:=true;
                 check_remake:=false;
               end
               else
               begin
                 Result := False;
                 Exit;
               end;
             end;
             // if IntfMegaDBCommon.GetBaseID in [2, 201, 213 ] then
             if not IntfMegaDBCommon.IsOffice then
               if IsPartyProv2(DocNaklRECID.AsInteger , DocNaklBASEID.AsInteger, DocNaklOPERDATE.AsDateTime ) then
                 if (IntfMegaAccessManager.GetUserRole <> 'CORRECTOR') and
                    (IntfMegaAccessManager.GetUserName <> 'SYSDBA') then
                 begin
                   Application.MessageBox('Накладная включена в проведенную сортировочную партию. Сохранение не возможно.', 'Внимание !', MB_OK + MB_ICONERROR);
                   Result := False;
                   exit;
                 end;

             //Проверка формы оплаты
             if (DocNaklFOplName.IsNull)then
               if (mrCANCEL=Application.MessageBox('Не задана форма оплаты. Сохранение не возможно.!', 'Внимание!',MB_OK + MB_ICONERROR)) then
               begin
                 Result := false;
                 exit;
               end;
             //Проверка проставления адреса откуда
             if ((OPERSTATUS in [iosIncomeFromProvider,iosIncomeFromRoad,iosImportIncomeFromRoad])
                           and (DocNaklADDR_FROM.AsInteger=DocNaklCFO.AsInteger)) then
               if (mrCANCEL=Application.MessageBox('Не задан адрес откуда.'+#13#10+'Сохранить?',
                               'Предупреждение', MB_ICONWARNING or MB_OKCANCEL)) then
               begin
                 Result := false;
                 exit;
               end;


             if (IntfMegaDBCommon.GetCountry = iccUkraine) then
             begin
               CheckCreateNaklCHP(doctype,group_oper,kod_oper);
               if group_oper>0   then
               begin
                 if  CreateNaklCopy2CHP(doctype,group_oper,kod_oper) then
                 Begin
                     Application.MessageBox(PChar('!!!Сформирована ПРИХОДНАЯ накладная в балансе 300. Необходимо проверить соответствие!!!'),Pchar('Внимание'),MB_OK+MB_ICONINFORMATION);
                 end;    
                 //!!!Сформирована ПРИХОДНАЯ накладная в балансе 300. Необходимо проверить соответствие!!!
               end;
             end;
             //
             //Проверка суммы для накладных боя (не должна превышать 1000 грн.)
             if (IsBreakNakl) then
             begin
               if (IntfMegaAccessManager.GetUserRole <> 'CORRECTOR') and
                    (IntfMegaAccessManager.GetUserName <> 'SYSDBA') then
               begin
                 if (IntfMegaDBCommon.GetCountry=iccUkraine) and (DocNaklSUMMA1.AsFloat>1000) then
                 begin
                   MessageBox(0, 'Сумма превышает предельно допустимую (1000 грн.).'+#13+#10+
                                 'Списание боя необходимо произвести в балансе Мегаполиса на расчет по претензиям.',
                              'Сохранение', MB_ICONSTOP or MB_OK);
                   Result := false;
                   exit;
                 end;
               end;
             end;

             // проверяем чтобы долг ДК был не больше гривны
             if ((IntfMegaDBCommon.GetCountry = iccUkraine)or(IntfMegaDBCommon.GetCountry = kodUKR))
                and(DocNaklBALANCE_KOD.AsInteger = IntfMegaCommon.GetMainFirmBalanceKod)
                and ufmReturnsMake.isReturnsControl
                and ufmReturnsMake.isReturnNakl(DocNaklGROUP_OPER.AsInteger,
                                                DocNaklKOD_OPER.AsInteger)
                and ufmReturnsMake.isNeedCheckSaldoForReturn(
                    DocNaklGROUP_OPER.AsInteger,DocNaklKOD_OPER.AsInteger) then
               begin
                 DKdolg := ufmReturnsMake.CheckDKDolg(
                              DocNaklRECID.AsInteger,DocNaklBASEID.AsInteger,
                              DocNaklBALANCE_KOD.AsInteger, '361',
                              DocNakl.Database, DocNakl.Transaction, self );
                 if DKdolg <-1 then
                 begin
                   liUtils.Error('Невозможно сохранить накладную: Сумма в накладной превышает сальдо клиента.'+#13+#10+
                          Format('Долг клиента составляет %8.2f грн.'#13#10,[DKdolg])+
                          'Обратитесь в отдел учета и анализа дебиторской задолженности.');
                   Result := false;
                   exit;
                 end;
               end;

             //(2011-01-12 Филимонов) Не разрешаем сохранение без позиций
             if((DocPos.RecordCount = 0) and (OPERSTATUS in [iosRealizationF1,iosRealizationF2]))
             then begin
               liUtils.Error('В документе должна быть хотя бы одна позиция!'+#13#10+
                             'Сохранение документа не допустимо!');
               Result := false;
               exit;
             end;

             LocateDocPos(false);   //++

             NaklPervChange :=false;
             NaklContractChange:= False;
{ ----------------- Added by Lion in 07.08.2008 ---------------- }
             checkReturnCause;
{ ----------- End of addition by Lion in 07.08.2008 ----------- }
             (**)
           end;
    IDCANCEL: Result := False;
    IDNO:     Nakl_Transaction.Rollback;
  end;
  aNaklSaved := Result;
{ ----------------- Rem by Lion in 07.08.2008 ---------------- }
//  if Result then
//    checkReturnCause;
{ ----------- End of reming by Lion in 07.08.2008 ----------- }
  //******************************************************************************
  if Assigned(lstDoc) then
  begin
    for i:=0 to lstDoc.Count do
      TObject(lstDoc.Items[i]).Free;
    lstDoc.Free;
    lstDoc:=nil;
  end;
  //******************************************************************************
  if (NaklPervChange or NaklContractChange) then
  begin
    if IDYES=MessageBox(Application.Handle,'Сохранить изменения?','Закрытие формы.',MB_APPLMODAL+MB_YESNO+MB_ICONQUESTION) then
    begin
      if not IntfMegaDBCommon.IsOffice and not InExport
         and Assigned(DocNaklSENDED_TO_OFFICE)
         and (VarToInt(DocNaklSENDED_TO_OFFICE.Value) <> 1)
         and (VarToInt(DocNaklZAYAVKA_ID.Value) <> 0) then
      begin
        if Ask('Вы связали накладную на бой с заявкой на транспорт.'#13#10
              +'Для того чтобы данные в ЦО были актуальны необходимо обязательно выполнить экспорт накладной в ЦО.'
              +'Если по каким-то причинам отправка данных в офис невозможна, а накладную нужно сохранить - нажмите "Нет", однако сделайте экспорт как только появится возможность.',
              True, 'Внимание') <> idNo then Abort;
      end;
      // тихонечко делаем согласование
      CheckAndMakeIfDocNeedSogl(True);
      Nakl_Transaction.CommitRetaining;
    end;
    NaklPervChange :=false;
  end;
  DocNakl.ConfirmPost := False;
  if Result then
    PosModified:=false;
end;

procedure TDocNaklForm.DBDateEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key in [VK_ADD,VK_SUBTRACT] then
       TcxDBDateEdit(sender).DataBinding.DataSource.Edit;
    case Key of
      VK_ADD: TcxDBDateEdit(sender).DataBinding.Field.AsDateTime:=TcxDBDateEdit(sender).DataBinding.Field.AsDateTime+1;
      VK_SUBTRACT:  TcxDBDateEdit(sender).DataBinding.Field.AsDateTime:=TcxDBDateEdit(sender).DataBinding.Field.AsDateTime-1;
    end;
end;

procedure TDocNaklForm.dbf1Click(Sender: TObject);
begin
 //
  AAMakeForm:=TAAMakeForm.Create(Self);
  try
    AAMakeForm.importNakl2DBF('',DocNaklRECID.AsInteger,DocNaklBASEID.asinteger);
  finally
    AAMakeForm.Close;
  end;

end;

procedure TDocNaklForm.actSpecificationParamsUpdate(Sender: TObject);
begin
  TAction(Sender).Visible := ((IntfMegaAccessManager.GetUserName = 'KIGNAT') OR (IntfMegaAccessManager.GetUserName = 'SYSDBA')) OR ((OPERSTATUS in [iosSpecification, iosRealization, iosInvoiceProf, iosInvoicePrePaid, iosInvoiceForPay]));
end;

procedure TDocNaklForm.actSplitListExecute(Sender: TObject);
var
  frmListSplit:TfrmSplitNakl;
  Nakl: TDocNaklForm;
  Form1:TForm;
  rest,d1,d2,cib:double;
  proc,kk:double;
  s:string;
  balance2:string;
  state_:integer;
begin

  frmListSplit := TfrmSplitNakl.Create(Self);
  if frmListSplit.ShowModal = mrOk then
  begin

    state_:=DocNaklSTATE.AsInteger;

    frmListSplit.cdsListNakl.first;
    DocPos.First;
    DocPos.ConfirmPost:=false;
    DocPos.ConfirmDelete:=false;
    while not frmListSplit.cdsListNakl.eof do
    //if InputQuery('Разделение по накладным', 'Отправить в другую накладную %', S) then
    begin
      proc := frmListSplit.cdsListNaklpercent.asinteger; //StrToFloat(S);
      balance2:=DocNaklBALANCE_KOD.AsString;
      Form1  := OpenDocument(Self, DocNaklDOCTYPE.AsString, 0, 0, DocNaklDOCDATE.AsDateTime);

      if Form1 is TDocNaklForm then
      begin
        Nakl:= TDocNaklForm(Form1);
        //Nakl.DocNakl.Append;

        Nakl.DocNaklDOCNUMBER.asVariant:=DocNaklDOCNUMBER.asVariant;
        Nakl.DocNaklDK_C.AsVariant := DocNaklDK_C.AsVariant;
        Nakl.DocNaklOPERDATE.AsVariant:=DocNaklOPERDATE.AsVariant;
        Nakl.DocNaklDOCDATE.AsVariant:=DocNaklDOCDATE.AsVariant;
        Nakl.DocNaklGROUP_OPER.AsVariant:=DocNaklGROUP_OPER.AsVariant;
        Nakl.DocNaklKOD_OPER.AsVariant:=DocNaklKOD_OPER.AsVariant;
        Nakl.DocNaklCFO.asVariant:=DocNaklCFO.asVariant;
        //Nakl.GrOper_CEButtonClick(Self);
        Nakl.DocNaklFORMAOPL_.asvariant:=DocNaklFORMAOPL_.asVariant;
        Nakl.NotSetOtsr:=true;
        Nakl.NoOtsr:=true;
        Nakl.DocNaklDK_FROM.Value := DocNaklDK_FROM.Value;
        Nakl.DocNaklDK_TO.Value := DocNaklDK_TO.Value;
        Nakl.DocNaklDK_C.AsVariant := DocNaklDK_C.AsVariant;
        Nakl.DocNaklNACENKA_.Value := DocNaklNACENKA_.Value;
        Nakl.DocNaklNOTES.Value := frmListSplit.cdsListNaklnotes.asString;//DocNaklNOTES.Value+' (№2)';
        //DocNaklNOTES.asString := DocNaklNOTES.asString+' (№1)';
        Nakl.DocNaklPRICETYPE_.Value := DocNaklPRICETYPE_.Value;
        Nakl.DocNaklDOCDATE.AsDateTime:=DocNaklDOCDATE.AsDateTime;
    //    Nakl.DocNaklTRIGGER_OFF.Value := DocNaklTRIGGER_OFF.Value;
        Nakl.DocNaklPRICE_FROM_VALYUTA.Value := DocNaklPRICE_FROM_VALYUTA.Value;
        Nakl.DocNaklV.Value := DocNaklV.Value;
        Nakl.DocNaklV1.Value := DocNaklV1.Value;
        Nakl.DocNaklKURS.Value :=DocNaklKURS.Value;
        Nakl.DocNaklOTSR.Value := DocNaklOTSR.Value;
        Nakl.DocNaklSTATE.Value := state_;
        Nakl.DocNaklTRANSPORT.Value := DocNaklTRANSPORT.Value;
        if Nakl.DocNakl.State in [dsInsert, dsEdit] then
        Nakl.DocNakl.SafePost;
        Nakl.DocNakl.Edit;
        DocPos.First;
        DocPos.ConfirmPost:=false;
        DocPos.ConfirmDelete:=false;
        Nakl.DocPos.ConfirmPost:=false;
        kk:=1;
        if DocNaklBALANCE_KOD.AsInteger <> Nakl.DocNaklBALANCE_KOD.AsInteger then
        begin
          if DocNaklBALANCE_KOD.AsInteger=IntfMegaCommon.GetMainFirmBalanceKod then kk:=1.2 else kk:=1/1.2;
        end;

        while not DocPos.Eof do
        begin
          d1:=Round((DocPos.FieldByName('KOLICH').AsFloat*proc)/100);
          rest:=DocPos.FieldByName('KOLICH').AsFloat-d1;

          if d1<>0 then begin
            Nakl.DocPosSource.Dataset.Append;
            Nakl.DocPos.FieldByName('KOD_MATER').AsFloat := DocPos.FieldByName('KOD_MATER').AsFloat;
            Nakl.DocPos.FieldByName('KOLICH').AsFloat :=d1 ;
            Nakl.DocPos.FieldByName('SUMMA1').AsFloat := (DocPos.FieldByName('SUMMA1').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1)*kk;
            Nakl.DocPos.FieldByName('SUMMA').AsFloat :=(DocPos.FieldByName('SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1)*kk;
            Nakl.DocPos.FieldByName('IND_SUMMA').AsFloat := (DocPos.FieldByName('IND_SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(d1);
            Nakl.DocPos.FieldByName('IND').Value :=DocPos.FieldByName('IND').Value ;
            Nakl.DocPos.FieldByName('PDV').Value := DocPos.FieldByName('PDV').Value ;
            Nakl.DocPos.Post;
           if rest=0 then begin DocPos.Delete; {DocPos.Prior;} end
           else begin
             DocPos.Edit;
             DocPos.FieldByName('SUMMA1').AsFloat := (DocPos.FieldByName('SUMMA1').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(rest);
             DocPos.FieldByName('SUMMA').AsFloat :=(DocPos.FieldByName('SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(rest);
             DocPos.FieldByName('IND_SUMMA').AsFloat := (DocPos.FieldByName('IND_SUMMA').AsFloat/DocPos.FieldByName('KOLICH').AsFloat)*(rest);
             DocPos.FieldByName('KOLICH').AsFloat := (rest);
             DocPos.Post;
           end;
         end;

         if rest<>0 then DocPos.Next;
        end;
        {if Nakl.DocPos.RecordCount=0 then begin
          Nakl.DocNakl.ConfirmDelete := False;
          Nakl.DocNakl.Delete;
          Nakl.Close;
          Nakl.DocNakl.Transaction.Commit;
          exit;
        end;}
        Nakl.DocPos.ConfirmPost := True;
        PosModified:=false;

        LocateDocPos(false);

        DontCheckRest := True;

        Nakl.CheckRest(False);

        Nakl.DocNakl.Edit;
        Nakl.DocNaklSTATE.Value:=state_;
        Nakl.DocNakl.Post;
        Nakl.DocNakl.Transaction.CommitRetaining;
        end;
      frmListSplit.cdsListNakl.next;
    end;
    DocPos.ConfirmDelete := True;
    DocNakl.ConfirmPost:=false;
    DM.SharedQuery.Close;
    DM.SharedQuery.Transaction:= DM.trMainWShort;

    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'EXECUTE PROCEDURE REMAKE_PROV_DOC(:DOC_INHERITED, :RECID, :BASEID)';
    DM.SharedQuery.Params.ByName['DOC_INHERITED'].Value := Nakl.DocNaklDOC_INHERITED.Value;
    DM.SharedQuery.Params.ByName['RECID'].Value := Nakl.DocNaklRECID.Value;
    DM.SharedQuery.Params.ByName['BASEID'].Value := Nakl.DocNaklBASEID.Value;
    DM.SharedQuery.ExecQuery;


    DM.SharedQuery.Transaction.Commit;
    DM.SharedQuery.Transaction:=dm.trMainRO;
    if DocPos.RecordCount=0 then
    begin
     DocNakl.Delete;
     DocNakl.Transaction.Commit;
    end else begin
     {DocNakl.Edit;
     DocNaklNOTES.asString := DocNaklNOTES.asString+' (№1)';
     DocNakl.Post;}
     PosModified:=false;
     DocNakl.ConfirmPost:=false;
     DocNakl.Transaction.CommitRetaining;
    end;
  end;
end;

procedure TDocNaklForm.actSplitNaklPosByPartyExecute(Sender: TObject);
begin
  Query.Close;
  Query.SQL.Text := 'execute procedure PROC_SET_NAKL_PARTY('+
    Source.DataSet.FieldByName('RECID').AsString+','+
    Source.DataSet.FieldByName('BASEID').AsString+')';
  Query.ExecProc;
  Query.Transaction.CommitRetaining;
  Query.Close;  

  DocPOs.FullRefresh;
//  DocNakl.FullRefresh;
end;

procedure TDocNaklForm.actSplitNaklPosByPartyUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled :=(((UpperCase(IntfMegaAccessManager.GetUserRole) = 'DEVELOPER') OR (IntfMegaDBCommon.GetParam('CHECK_PARTY', '0')='1')) AND (IntfMegaDBCommon.GetCountry = iccRussia) OR (IntfMegaDBCommon.GetCountry = kodRUS) or IsPartUchet);
end;

procedure TDocNaklForm.actSplitPosByRestsExecute(Sender: TObject);
begin
  // если в sprav_oper стоит статус SPLIT_BY_RESTS
  Query.Close;
  Query.SQL.Text :=
    'execute procedure REMAKE_PROV_NAKL_SPLIT_BY_RESTS('+
    Source.DataSet.FieldByName('RECID').AsString+','+
    Source.DataSet.FieldByName('BASEID').AsString+')';
  Query.ExecProc;
  Query.Close;
  Query.Transaction.CommitRetaining;

  PosModified := true;

  DocPOs.FullRefresh;
  DocNakl.FullRefresh;
end;

procedure TDocNaklForm.actSplitPosByRestsUpdate(Sender: TObject);
begin
  try
  // если в sprav_oper стоит статус SPLIT_BY_RESTS, тогда можно делить позиции
  if (IntfMegaDBCommon.GetCountry=iccRussia) or IsPartUchet  then
    Exit;

  // если в sprav_oper стоит статус SPLIT_BY_RESTS, тогда можно делить позиции
  Query.Close;
  Query.SQL.Text :=
    'SELECT coalesce(so.SPLIT_BY_RESTS,0) SPLIT_BY_RESTS from sprav_oper so'+
    '  where so.KOD_OPER='+Source.DataSet.FieldByName('KOD_OPER').AsString+
    '    and so.GROUP_OPER ='+Source.DataSet.FieldByName('GROUP_OPER').AsString;
  Query.ExecQuery;
  TAction(Sender).Enabled := Query.FN('SPLIT_BY_RESTS').AsInteger = 1;
  Query.Close;
  except
    on e:Exception do
      TAction(Sender).Enabled := false;
  end;
end;

procedure TDocNaklForm.actSpecificationParamsExecute(Sender: TObject);
var
  Form: TForm;
begin
  Form := TfmSpecificationParams.Create(Self, DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger, DocNaklDOC_INHERITED.AsInteger, OPERSTATUS);
//  Form.Show;
end;


procedure TDocNaklForm.actPrintSpecInvoiceUpdate(Sender: TObject);
begin
  TAction(Sender).Visible := ((IntfMegaAccessManager.GetUserName = 'KIGNAT') OR (IntfMegaAccessManager.GetUserName = 'SYSDBA')) OR ((OPERSTATUS in [iosSpecification, iosRealization, iosInvoiceProf, iosInvoicePrePaid, iosInvoiceForPay]));
end;

// BEGIN add new nirs 09_07_2024
procedure TDocNaklForm.actPrintSpecInvoiceUKRExecute(Sender: TObject);
begin
//    if OPERSTATUS in [iosRealization, iosInvoicePrePaid, iosInvoiceForPay] then begin
//       DM.SharedQuery.Close;
//       DM.SharedQuery.SQL.Text:='select LEFT_SIGN, LEFT_SIGN_NAME , RIGHT_SIGN ,RIGHT_SIGN_NAME from DOC_SPECIFICATION where RECID=:recid AND BASEID=:baseid AND FORMTYPE=:formtype';
//       DM.SharedQuery.ParamByName('RECID').asInteger   :=DocNaklRECID.Value;
//       DM.SharedQuery.ParamByName('BASEID').asInteger  :=DocNaklBASEID.Value;
//       DM.SharedQuery.ParamByName('formtype').asInteger:=DocNaklDOC_INHERITED.Value;
//       DM.SharedQuery.ExecQuery;
//       if (DM.SharedQuery.FieldByName('LEFT_SIGN').AsString<>'')  and //(DM.SharedQuery.FieldByName('LEFT_SIGN_NAME').AsString<>'') or
//          (DM.SharedQuery.FieldByName('RIGHT_SIGN').AsString<>'') //or (DM.SharedQuery.FieldByName('RIGHT_SIGN_NAME').AsString<>'')
//       then
//          if not(DocNaklSTATE.Value in [idsBug,idsKassa]) then begin
//             Application.MessageBox('На документе не стоит отметка об оплате.','Ошибка!',MB_OK);
//             exit;
//          end;
//    end;
    dmMegaReports.MyShow(6006,DocNaklOperDate.Value, DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString + ',' + DocNaklDOC_INHERITED.AsString);
end;
// END add new nirs 09_07_2024


procedure TDocNaklForm.actPrintSpecInvoiceExecute(Sender: TObject);
begin
    if OPERSTATUS in [iosRealization, iosInvoicePrePaid, iosInvoiceForPay] then begin
       DM.SharedQuery.Close;
       DM.SharedQuery.SQL.Text:='select LEFT_SIGN, LEFT_SIGN_NAME , RIGHT_SIGN ,RIGHT_SIGN_NAME from DOC_SPECIFICATION where RECID=:recid AND BASEID=:baseid AND FORMTYPE=:formtype';
       DM.SharedQuery.ParamByName('RECID').asInteger   :=DocNaklRECID.Value;
       DM.SharedQuery.ParamByName('BASEID').asInteger  :=DocNaklBASEID.Value;
       DM.SharedQuery.ParamByName('formtype').asInteger:=DocNaklDOC_INHERITED.Value;
       DM.SharedQuery.ExecQuery;
       if (DM.SharedQuery.FieldByName('LEFT_SIGN').AsString<>'')  and //(DM.SharedQuery.FieldByName('LEFT_SIGN_NAME').AsString<>'') or
          (DM.SharedQuery.FieldByName('RIGHT_SIGN').AsString<>'') //or (DM.SharedQuery.FieldByName('RIGHT_SIGN_NAME').AsString<>'')
       then
          if not(DocNaklSTATE.Value in [idsBug,idsKassa]) then begin
             Application.MessageBox('На документе не стоит отметка об оплате.','Ошибка!',MB_OK);
             exit;
          end;
    end;
    dmMegaReports.MyShow(6,DocNaklOperDate.Value, DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString + ',' + DocNaklDOC_INHERITED.AsString);
end;

procedure TDocNaklForm.actPrintSpecInvoiceNewExecute(Sender: TObject);
begin
        if OPERSTATUS in [iosRealization, iosInvoicePrePaid, iosInvoiceForPay] then begin
       DM.SharedQuery.Close;
       DM.SharedQuery.SQL.Text:='select LEFT_SIGN, LEFT_SIGN_NAME , RIGHT_SIGN ,RIGHT_SIGN_NAME from DOC_SPECIFICATION where RECID=:recid AND BASEID=:baseid AND FORMTYPE=:formtype';
       DM.SharedQuery.ParamByName('RECID').asInteger   :=DocNaklRECID.Value;
       DM.SharedQuery.ParamByName('BASEID').asInteger  :=DocNaklBASEID.Value;
       DM.SharedQuery.ParamByName('formtype').asInteger:=DocNaklDOC_INHERITED.Value;
       DM.SharedQuery.ExecQuery;
       if (DM.SharedQuery.FieldByName('LEFT_SIGN').AsString<>'')  and //(DM.SharedQuery.FieldByName('LEFT_SIGN_NAME').AsString<>'') or
          (DM.SharedQuery.FieldByName('RIGHT_SIGN').AsString<>'') //or (DM.SharedQuery.FieldByName('RIGHT_SIGN_NAME').AsString<>'')
       then
          if not(DocNaklSTATE.Value in [idsBug,idsKassa]) then begin
             Application.MessageBox('На документе не стоит отметка об оплате.','Ошибка!',MB_OK);
             exit;
          end;
    end;
    dmMegaReports.MyShow(86,DocNaklOperDate.Value, DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString + ',' + DocNaklDOC_INHERITED.AsString);

end;

procedure TDocNaklForm.PrintNaklOSExecute(Sender: TObject);
begin
  PrintOSNakl:=true;
  PrintNakl.Execute;
  PrintOSNakl:=false;
end;

procedure TDocNaklForm.PrintNaklOSUpdate(Sender: TObject);
begin
 (Sender as TAction).Visible:=(IntfMegaDBCommon.IsOffice) and (DocNaklBALANCE_KOD.AsInteger=IntfMegaCommon.GetPPBalance);
end;

procedure TDocNaklForm.FormCreate(Sender: TObject);
var
  i:integer;
  F: TStringField;
  connectString:string;
 
begin
//  JclAddExceptNotifier(LogException);
  fSetAddr:= False;
  FInsertedPosIds:= TList.Create;
  fErrLink:=false;
  sErrLink:='';
  for i:=LinkQ.Params.Count-1 to 0 do
    LinkQ.Params[i].Value:=null;

   ToolButton22.Visible:= IsRussia or IsUkraine;
   btnStorageIn.Visible:=IntfMegaDBCommon.GetParam('STORAGE','0')='1';
   btnStorageOut.Visible:=IntfMegaDBCommon.GetParam('STORAGE','0')='1';

   printNaklIf_different_Addr:=IntfMegaDBCommon.GetParam('PRINT_NAKL_DIF_CFO','1')='1';


//  DBGridEH1.FieldColumns['date_part'].Visible := (IntfMegaDBCommon.GetCountry=iccRussia) OR (IntfMegaDBCommon.GetCountry=kodRUS) or IsPartUchet;
  DBGridEH1.FieldColumns['date_rozliva'].Visible := IsRussia or IsUkraine;
  DBGridEH1.FieldColumns['invoce_number'].Visible := IsRussia;
  DBGridEH1.FieldColumns['Price_box'].Visible := IsUSA;
  DBGridEH1.FieldColumns['Price2_'].Visible := not IsUSA;
  DBGridEH1.FieldColumns['Summa3'].Visible :=not IsUSA;

  DBGridEH1.FieldColumns['PRICEWPDV'].Visible := not IsUSA;
  DBGridEH1.FieldColumns['SUMMAWPDV'].Visible := not IsUSA;
  DBGridEH1.FieldColumns['PDV'].Visible       := not IsUSA;


//  DBGridEH1.FieldColumns['skidka_with_pdv'].Visible := IsRussia;
//  DBGridEH1.FieldColumns['price_prev'].Visible := IsRussia;
  cxlReal_Otsr.Visible := (IntfMegaDBCommon.GetCountry=iccRussia) OR (IntfMegaDBCommon.GetCountry=kodRUS);
  teReal_Otsr.Visible := (IntfMegaDBCommon.GetCountry=iccRussia) OR (IntfMegaDBCommon.GetCountry=kodRUS);
  chkIncludeOkom.Visible :=(IntfMegaDBCommon.IsOffice) and (IntfMegaDBCommon.GetCountry=iccUkraine);

{ ----------------- Added by Lion in 11.06.2008 ---------------- }
  lcbZayavka.Enabled:= (UpperCase(IntfMegaAccessManager.GetUserRole) = 'DEVELOPER');
{ ----------- End of addition by Lion in 11.06.2008 ----------- }

  // это нужно чтобы нельзя было закрыть форму, пока в ней что-то делается, например внутренний документ
  aCanFreeForm := true;

  tbSertificat.Visible:= IsRussia and (IntfMegaDBCommon.IsOffice or (IntfMegaDBCommon.GetBaseID = 240) or IsDebug);
  mdsIncludeOkom.active:=true;
  cxLabelSelfExport.visible:= not (IntfMegaDBCommon.GetCountry=iccRussia);
  //cbdbDontUseSpecPrice.Visible:= IsRussia;
  DocNaklDONT_USE_SPEC_PRICE.ReadOnly:= IntfMegaDBCommon.IsOffice;
  //GetStateSelfExport;
  if IntfMegaDBCommon.GetParam('STORAGE','0')='1'  then
     actSplitNaklPosByParty.Enabled:=False;

  ToolButton21.visible:= ((IntfMegaAccessManager.GetUserName='MUZHEVSKIY_N') or (IntfMegaAccessManager.GetUserName='KOCHEVOJ_R')
                            or (IntfMegaAccessManager.GetUserRole = 'DEVELOPER') or (IntfMegaAccessManager.GetUserName='SYSDBA'));

  pmp_items:= TdmDocPopupMenuPrint_Items.Create(self);
  if isRussia
    then pmp_items.Init(pmPrintRu)
    else pmp_items.Init(pmPrint);

  connectString:= conEgais.ConnectionString;
  connectString:= ReplaceStr(connectString,'db_egais','db-egais.'+ReplaceStr(rxStrUtils.ExtractWord(1,DM.Money.DBName,[':']),'db.',''));
  conEgais.ConnectionString := connectString;

   //----[gsa] 24-09-2019 права на поля с временем
  if ((UpperCase(IntfMegaAccessManager.GetUserRole) = 'DEVELOPER')
        or (UpperCase(IntfMegaAccessManager.GetUserRole) = 'DISP_DOSTAVKA')
        or (UpperCase(IntfMegaAccessManager.GetUserRole) = 'TRANSPORT_AUDIT')) then
     begin
         cbbTRANSPORT_TIME_HH.Enabled:=True;
         cbTRANSPORT_TIME_MM.Enabled:=True;
         btnTRANSPORT_TIMESave.Enabled:=True;
     end;

  if isRussia then btnVekselAdd.Visible:=False
              else btnVekselAdd.Visible:=True;

end;

procedure TDocNaklForm.FormDestroy(Sender: TObject);
begin
//  JclRemoveExceptNotifier(LogException);
  FreeVar(FInsertedPosIds);
end;

function TDocNaklForm.ShowError:integer;
begin
  result:=ID_OK;
  if fErrLink then begin
    result:=Application.MessageBox(pChar(sErrLink),'Ошибка при "связывании" документов.!',MB_RETRYCANCEL+MB_ICONERROR);
  end;
end;

procedure TDocNaklForm.Nakl_TransactionAfterEnd(EndingTR: TFIBTransaction;
  Action: TTransactionAction; Force: Boolean);
begin
  if FInsertedPosIds <> nil then
    FInsertedPosIds.Clear;
end;

procedure TDocNaklForm.Nakl_TransactionBeforeEnd(EndingTR: TFIBTransaction;
  Action: TTransactionAction; Force: Boolean);
begin
    if (Action in [TACommit, TACommitRetaining]) and fErrLink
       then abort;
end;

procedure TDocNaklForm.actPrintInvoicePPExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(53,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',801');
end;

procedure TDocNaklForm.actPrintInvoice_ReklPPExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(53,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',802');
end;

function TDocNaklForm.IsBreakNakl: boolean;
begin
 result:=(OPERSTATUS=iosTrailerBreak)   or (OPERSTATUS=iosBreakManufact)
           or
         ((DocNaklGROUP_OPER.AsInteger=igotCarrierGoodsBreak) and (DocNaklKOD_OPER.AsInteger=iotCarrierGoodsBreak));

end;

class function TDocNaklForm.IsNaklProv(RecId, BaseId, FormType: Integer): Boolean;
begin
  Result:= VarToInt(fbExecQuery('SELECT STATUS FROM CHECK_PROV_DOC_NEW(%d, %d, %d)', [FormType, RecId, BaseId])) = 1;
end;

function TDocNaklForm.isStickering: integer;
begin
//
  if FIsStickering=-1 then
  begin
    //получение статуса операции
    Query.Close;
    Query.SQL.Text:='select  coalesce(IS_STICKERING,0) IS_STICKERING from sprav_dk_addition_prop where kod_dk= '+
    FloatToStr(Source.DataSet.FieldByName('DK_TO').AsFloat);
    Query.ExecQuery;
    FIsStickering:= Query.FieldByName('IS_STICKERING').AsInteger;
 end;
 Result:=FIsStickering;
end;

function TDocNaklForm.isNaklProv: boolean;
//const
//  sSql='SELECT STATUS FROM CHECK_PROV_DOC_NEW(:FORMTYPE,:RECID, :BASEID)';
//var
//   q: TMegaQuery;
//begin // проведена накладная (CHECK_PROV_DOC_NEW)
//   q := TMegaQuery.Create(self);
//   try
//     q.Database := DocNakl.Database;
//     q.Transaction := DocNakl.Transaction;
//     q.SQL.text:=sSql;
//     q.Params.ByName['RECID'].Value:=DocNaklRECID.Value;
//     q.Params.ByName['BASEID'].Value:=DocNaklBASEID.Value;
//     q.Params.ByName['FORMTYPE'].Value:=DocNaklDOC_INHERITED.Value;
//     q.ExecQuery;
//     result := q.FN('STATUS').Asinteger = 1 ; // 1- проеведен -1- непроеведен
//
//   finally
//      q.Free;
//   end;
begin
  Result:= isNaklProv(DocNaklRECID.Value, DocNaklBASEID.Value, DocNaklDOC_INHERITED.Value);
end;


procedure TDocNaklForm.actPrintPackListUpdate(Sender: TObject);
begin
  TAction(Sender).Visible := (IntfMegaDBCommon.GetParam('WORK_VED', '0')='1')
  //((DocNaklBASEID.AsInteger=215)or
                             // (IntfMegaDBCommon.GetBaseID=215))
  and  (OPERSTATUS in [iosSpecification,iosInvoiceProf,iosInvoicePrePaid,iosInvoiceForPay]);
end;

procedure TDocNaklForm.actPrintSpec_TNVEDExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(59,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',801');
end;

procedure TDocNaklForm.actPrintInvoice_TNVEDExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(56,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',801');
end;

procedure TDocNaklForm.actPrintLVZExecute(Sender: TObject);
var  ldmRep: TdmPrintNakl2;
  Recid, Baseid : integer;
begin
//   Transaction.Active:=true;
   ldmRep:= TdmPrintNakl2.Create(Self);
   try
     recid:= DocNaklRecID.AsInteger;
     Baseid:= DocNaklBaseID.AsInteger;
     ldmRep.PrepareReport(RecID, BaseID, IntfDBProvider.GetDB, NAkl_Transaction, False);
     frVariables.Variable['HidePriceAndCost']:= False;
     frVariables.Variable['IsOtv']:= False;
     lDMRep.NaklReport.DefaultCopies:= 1; //addttnkol;
     lDMRep.NaklReport.PrintToDefault:= True;
     if FDesignReport then
      begin
        lDMRep.NaklReport.DesignReport;
      //  oExportfilter := TfrxCustomExportFilter(frxPDFExport1);
////        oExportFilter.ShowDialog := False;
//        oExportFilter.FileName := aptd + '\test.pdf';
//        lDMRep.NaklReport.PrepareReport;
//        lDMRep.NaklReport.ExportTo(f1, '1.xls');
      end
     else begin
      lDMRep.NaklReport.PrepareReport;
//      Printer.PrinterIndex:= PrinterIndex;
//      frxPrinters.PrinterIndex:= PrinterIndex;
      //lDMRep.NaklReport.ChangePrinter(Printer.PrinterIndex,PrinterIndex);
//      if print_upd <> 1 then
         lDMRep.NaklReport.PrintPreparedReport('', 1, false, frAll);
//      if (PRINT_TORG=1) then
//       importNakl2DBF('',StrToInt(stRECID),StrToInt(stBaseid));
     end;
    finally
      ldmRep.Free;
    end;
 end;


procedure TDocNaklForm.actPrintInvoicePP_TNVEDExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(55,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString+',801');
end;

procedure TDocNaklForm.actUnCheckBaseNakl_allClick(Sender: TObject);
begin
//снимаем признак по всем акциям

  UnCheckNaklBaseAll;
end;

procedure TDocNaklForm.actUnCheckBaseNakl_BlgClick(Sender: TObject);
begin
 UnCheckNaklBase(3);
end;

procedure TDocNaklForm.actUnCheckBaseNakl_FeodClick(Sender: TObject);
begin
 UnCheckNaklBase(4);
end;

procedure TDocNaklForm.actUnCheckBaseNakl_KhortitsaClick(Sender: TObject);
begin
  UNCheckNaklBase(1);
end;

procedure TDocNaklForm.actUnCheckBaseNakl_MedClick(Sender: TObject);
begin
 UnCheckNaklBase(2);
end;

procedure TDocNaklForm.actUnCheckBaseNakl_OKZClick(Sender: TObject);
begin
 UnCheckNaklBase(5);
end;

procedure TDocNaklForm.actUnCheckBaseNakl_TOP14Click(Sender: TObject);
begin
 UnCheckNaklBase(6);
end;

procedure TDocNaklForm.actUpdateNakl2EgaisExecute(Sender: TObject);
const updSql='execute procedure update_nakl_to_egais1(:RECID,:BASEID);';
var
   q_e: TMegaQuery;
begin

   try
     q_e := TMegaQuery.Create(self);
     q_e.Database := DocNakl.Database;
     q_e.Transaction := DocNakl.Transaction;
    // Query.Close;
    // Query.SQL.text:=updSql;
    // Query.Params.ByName['RECID'].asInteger:=DocNaklRECID.asinteger;
    // Query.Params.ByName['BASEID'].asInteger:=DocNaklBASEID.asinteger;
     q_e.SQL.text:=updSql;
     q_e.Params.ByName['RECID'].asInteger:=DocNaklRECID.asinteger;
     q_e.Params.ByName['BASEID'].asInteger:=DocNaklBASEID.asinteger;

     try
      // Query.ExecProc;
      // Query.Transaction.CommitRetaining;
       q_e.ExecProc;
       q_e.Transaction.CommitRetaining;

{ ----------------- Added by Lion in 02.06.2009 ---------------- }
{ Раньше было написано так, что необходимо было сохранять накладную
  после разнесения ЕГАИСОВ, однако сохранение происходит ооочень долго
  поэтому можно сделать автокоммит - чтобы ускорить разнесение.
  Однако это оставляет лазейку, выраженную в том, что после этого
  накладная будет фактически сохранена (то что касается её позиций)
  и все проверки, которые делаются при сохранении не отработают
}
//     DocNakl.Edit;
//     DocNaklRecId.Value := DocNaklRecId.Value;


{ ----------- End of addition by Lion in 02.06.2009 ----------- }
   except
    //Query.Transaction.RollbackRetaining;
     q_e.Transaction.RollbackRetaining;
     raise;
   end;

     finally
       //Query.Close;
       FreeAndNil(q_e);
     end;
end;

procedure TDocNaklForm.actUpdateNakl2EgaisUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FindPart('ПСРТ',DocNaklDocType.AsString) >0{DocNaklDOCTYPE.asstring='ПСРТ'}) and (IntfMegaDBCommon.GetCountry=iccRussia);
end;

procedure TDocNaklForm.actUpdateNarExecute(Sender: TObject);
var fm:TfmDocOrderSkladPos;
begin
  fm:=TfmDocOrderSkladPos.Create(self);
  fm.DOCRECNO:=mdsDocOrderSkladRECID.value;
  fm.BASEID:=mdsDocOrderSkladBASEID.value;
  Fm.actRefresh.Execute;
  fm.ShowModal;
end;

procedure TDocNaklForm.actUpdateNarUpdate(Sender: TObject);
begin
   TAction(Sender).Visible:=not(mdsDocOrderSkladRecid.isNull);
end;

procedure TDocNaklForm.actViewKartFormExecute(Sender: TObject);
var
  K : TViewKartForm;
begin
  DM.SharedQuery.Close;
  DM.SharedQuery.sql.Text :=
    'SELECT first 1                                                                      '#13#10+
    '  sp.GROUP_OPER, SP.KOD_OPER,                                                       '#13#10+
    '  SP.DEBET, SP.KREDIT,                                                              '#13#10+
    '  case WHEN so.STATUS<>2 then SP.KREDIT else SP.DEBET end SCHET                      '#13#10+
    '                                                                                    '#13#10+
    'from SPRAV_OPER so                                                                  '#13#10+
    'left join SPRAV_PROV sp on so.KOD_OPER = sp.KOD_OPER and so.GROUP_OPER=sp.GROUP_OPER'#13#10+
    'where so.KOD_OPER = :KOD_OPER and so.GROUP_OPER = :GROUP_OPER                       '#13#10+
    'order by sp.PROV_ORDER                                                              ';
  DM.SharedQuery.ParamByName('KOD_OPER').AsInteger  := DocNaklKOD_OPER.AsInteger;
  DM.SharedQuery.ParamByName('GROUP_OPER').AsInteger:= DocNaklGROUP_OPER.AsInteger;
  DM.SharedQuery.ExecQuery;

  K := TViewKartForm.Create(self);
  K.KFSelBalance.Value := DocNaklBALANCE_KOD.AsString;
  K.KFSelSchet.Value := DM.SharedQuery.FN('SCHET').AsString;
  K.KodMater := DocPosKOD_MATER.AsFloat;
  K.Mater.Text := DocPosNAME_MATER.AsString;
  K.Show;

  DM.SharedQuery.Close;
end;

procedure TDocNaklForm.actSetPdvCExecute(Sender: TObject);
var i:integer;
begin
  if (IntfMegaDBCommon.GetBaseID=215) then
//  IntfMegaDBCommon.GetBaseID=215 then
  begin
    if DBGridEh1.SelectedRows.Count = 0 then
        DBGridEh1.SelectedRows.CurrentRowSelected := True;
    DocPos.ConfirmPost := False;
    for I:=0 to DBGridEh1.SelectedRows.Count-1 do
    begin
      DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
      DBGridEh1.Update;
      DBGridEh1.DataSource.DataSet.Edit;
      DBGridEh1.DataSource.DataSet.fieldByName('PDV').AsString:='C';
      DBGridEh1.DataSource.DataSet.Post;
    end;
    DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i-1]));
    DocPos.ConfirmPost := True;
  end;
end;

procedure TDocNaklForm.actPrintPackListEnExecute(Sender: TObject);
//var  iDocs: TdmInternalDocs;
begin

  If FDesignReport
  Then dmMegaReports.MyDesign(71, Now(), DocNaklRECID.AsString+','+DocNaklBASEID.AsString)
  Else dmMegaReports.MyShow(71, Now(), DocNaklRECID.AsString+','+DocNaklBASEID.AsString);
{
  iDocs:= TdmInternalDocs.Create(self);
  try
    FDesignReport := ((UpperCase(IntfMegaAccessManager.GetUserRole) = 'DEVELOPER') or (UpperCase(IntfMegaAccessManager.GetUserName) = 'SOSNA_A'));
    if FDesignReport then
      iDocs.MyDesign(iDocs.frxPackListExp,DocNaklRECID.AsString+','+DocNaklBASEID.AsString)
    else iDocs.MyShow(iDocs.frxPackListExp,DocNaklRECID.AsString+','+DocNaklBASEID.AsString);
  finally
    iDocs.Free;
  end;}
end;

procedure TDocNaklForm.actPrintPackListEnUpdate(Sender: TObject);
begin
  TAction(Sender).Visible := ((IntfMegaDBCommon.GetParam('WORK_VED', '0')='1')
  //(((DocNaklBASEID.AsInteger=215)or
                             //  (IntfMegaDBCommon.GetBaseID=215))
  and (OPERSTATUS in [iosSpecification,iosInvoiceProf,iosInvoicePrePaid,iosInvoiceForPay]));
end;

procedure TDocNaklForm.actPrintQualityCertificationExecute(Sender: TObject);
  var
  pstr: string;
  Begin
//  nirs debug_on
//  ufmQualityCertBlank.QualityCertReportExecute(DocNakl.ParamByName('RECID').ASString,DocNakl.ParamByName('BASEID').ASString,False);    
    pstr := DocNakl.ParamByName('RECID').AsString + ',' + DocNakl.ParamByName('BASEID').AsString;
    dmMegaReports.MyPrint(4488, Now(), pstr); // add new nirs 23_06_2025
  End;

procedure TDocNaklForm.DeletePosNakl(multiDel:integer);
begin
//
  KOLICH := -DocPosKOLICH.Value;
  MATER := DocPosTARA_MATER.Value;
  if (multiDel=1) then
      DocPos.ConfirmDelete := False;

  DocPosSource.Dataset.Delete;

  if (DocPos.DelAction = 1) and (MATER <> 0) then
  begin
    DocPos.ConfirmPost := False;
    DocPos.ConfirmDelete := False;
    if DocPos.Locate('KOD_MATER', MATER, []) then
    begin
      DocPos.Edit;
      DocPosSUMMA.Value := (DocPosKOLICH.Value + KOLICH) * DocPosPrice1.Value;
      DocPosSUMMA1.Value := (DocPosKOLICH.Value + KOLICH) * DocPosPrice2.Value;
      DocPosKOLICH.Value := DocPosKOLICH.Value + KOLICH;
      if DocPosKOLICH.Value = 0 then DocPos.Delete else DocPos.Post;
            sumPDVScidcka:= sumPDVScidcka+DocPosPRICE_PREV.Value;
    end;
    DocPos.ConfirmPost := True;
    DocPos.ConfirmDelete := True;
  end;
  if (multiDel=1) then
      DocPos.ConfirmDelete := True;
end;

procedure TDocNaklForm.actPrinRealRusUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (IntfMegaDBCommon.GetCountry=iccRussia);
end;

procedure TDocNaklForm.actPrinRealRusExecute(Sender: TObject);
begin
  // Никаких проверок
  //frNaklrReal
  PrintReport('frNaklrReal');
end;

procedure TDocNaklForm.dsNote_mCalcFields(DataSet: TDataSet);
  Var
    S,S2 : String;
    F : Double;
  Begin
    // общая сумма прописью
    if pos('ЗМЦ',DocNaklDOCTYPE.AsString)<>0 then
      F := Sum.Fields[5].AsFloat
     Else
      F := -Sum.Fields[5].AsFloat;

    If (F < 0) Then
      Begin
        S := 'мінус ';
        F := -F;
      End
     Else
      S := '';
    S := S + String(AnsiStrLower(PChar(ToWord.ValutaToWordUA(F,2,1))));
    S := TRIM(S);

    if system.Copy(S,Length(S)-3,4) = 'коп.' Then
      Begin
        S[Length(S)] := 'і';
        S := S + 'йок';
      End;

    dsNote_m.FieldByName('TotalSumAsString').AsString := AnsiUpperFirstChar(S);

  End;

procedure TDocNaklForm.actPrint300WarExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
  re: TRegExpr;
  flic: boolean;
begin
  CheckSelfExportState;
  // проверки на возможность печати
  if  (not AllowAll)
  and (DocNaklSTATE.Value<>idsBug)
  and (DocNaklSTATE.Value<>idsKassa)
  and (DocNaklDK_TO.AsFloat<>ddkEndUser)
  and (not intfMegaDBCommon.IsOffice)
  and (DocNaklSTATE.Value<>idsFromOffice)
  {and (OPERSTATUS = iosOutcomeToOtv)} then
  begin
    exit;
  end;
  if (DocNaklSTATE.Value= idsPrepare)
  or (DocNaklSTATE.Value= idsToOffice) then
  begin
    exit;
  end;

  //-- тоже проверка
//  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then
  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then

  begin
    DocNakl.Edit;
    DocNaklSTATE.Value := idsInternal;
  end;

{ ---------------- Changed by Petc.O in 06.11.2008 --------------- }
  // всвязи с особенностями реализации многопоточности в fr3
  // не даем закрыть накладную(а сворачиваем), пока она не допечатается
  aCanFreeForm := true;
{ ----------- End of changing by Petc.O in 06.11.2008 ----------- }
  //
  ldmRep:= TdmPrintNakl2.Create(Self);
  // проверяю, если на дебиторе выставлена галочка "печать с учетом возвратов",
  // то делаю видимым пункт "Печать накладной с учетом возвратов"

  try
    ldmRep.IsBillaNakl:= Sender = miBilla;
    ldmRep.IsOSNakl:=PrintOSNakl;
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);

    frVariables.Variable['HidePriceAndCost']:= False;

    if OPERSTATUS=iosOutcomeToOtv then
    begin
      frVariables.Variable['IsOtv']:= True;
      frVariables.Variable['HidePriceAndCost']:= true;
    end
    else begin
      frVariables.Variable['IsOtv']:= False;
    end;
    if (OPERSTATUS <> 4) or (IntfMegaDBCommon.GetParam('PR_NEW_NAKL_F2_AGENT','0') <> '1') then
     fLic:= True
    else
     fLic:= DM.GetLic(DocNakl.FieldByName('DK_TO').AsFloat, DocNakl.FieldByName('OPERDATE').AsDateTime);
    frVariables.Variable['fLic']:= fLic;
    frVariables.Variable['not_agent']:= true;
    frVariables.Variable['statePrint999']:=0; //все стр., 1 только КП, -1 без КП
    if FDesignReport then
    begin
      lDMRep.frNakl_f2_withheader.DesignReport;
    end
    else
    begin
      lDMRep.frNakl_f2_withheader.PrepareReport;
      lDMRep.frNakl_f2_withheader.PrintPreparedReportDlg;
    end;
    if not fLic then
     begin
       ldmRep.IsBillaNakl:= Sender = miBilla;
       ldmRep.IsOSNakl:=PrintOSNakl;
       ldmRep.PrepareReport(
         DocNaklRecID.Value, DocNaklBaseID.Value,
         IntfDBProvider.GetDB , Nakl_Transaction, False);
       frVariables.Variable['HidePriceAndCost']:= False;
       if OPERSTATUS=iosOutcomeToOtv then
        begin
          frVariables.Variable['IsOtv']:= True;
          frVariables.Variable['HidePriceAndCost']:= true;
        end
       else
        begin
          frVariables.Variable['IsOtv']:= False;
        end;
       frVariables.Variable['fLic']:= true;
       frVariables.Variable['not_agent']:= false; //на агента
       if FDesignReport then
        begin
          lDMRep.frNakl_f2_withheader.DesignReport;
        end
       else
        begin
          lDMRep.frNakl_f2_withheader.PrepareReport;
          lDMRep.frNakl_f2_withheader.PrintPreparedReportDlg;
        end;
     end;
  finally
    ldmRep.IsOSNakl:=false;
    ldmRep.Free;
    aCanFreeForm := true;
  end;
  //--

end;

procedure TDocNaklForm.actPrintActMaterialExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(103156,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString);
end;

procedure TDocNaklForm.actPrintActRekl_RuExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2R;
begin // подготовка к печати "Акт о списании товаров"
      // унифицированная форма "Торг-16"
  ldmRep:= TdmPrintNakl2R.Create(Self);
  try
    ldmRep.Torg16_RShowReport(DocNaklRecID.Value,DocNaklBaseID.Value);
  finally
    ldmRep.Free;
  end;
end;

procedure TDocNaklForm.actPrintActRekl_RuUpdate(Sender: TObject);
begin
  TAction(Sender).Visible := IntfMegaDBCommon.GetCountry = iccRussia;
end;


// Лейбов Е. - Для нового партионного учета. Если в накладной выбрали дату партии - подобрать партии с этой датой
// Если значение Party_RecID, Party_BaseID соответствуют установленным значениям Даты и Номера партии - ничего не делается
// Иначе производится автоматический подбор подходящих партий с этой датой и номером с учетом механизма FIFO и VIP
// Если необходимо - позиция накладной разбивается на несколько
procedure TDocNaklForm.SplitNakl2PartyNew;
var
  Party_RecID, Party_BaseID: Integer;
  Party_Date: TDateTime;
  Party_Number: string;
  V: Variant;
begin
  if (IntfMegaDBCommon.IsOffice) then
    exit;
  Party_RecID:= VarToInt(DocPos['Party_RecID']);
  Party_BaseID:= VarToInt(DocPos['Party_BaseID']);
  Party_Date:= PU_PartyDate;
  Party_Number:= Trim(PU_PartyNumber);
  if (Party_Date <= 0) and (Party_Number = '') then
  begin
    fbExecQuery(Nakl_Transaction, 'UPDATE DOC_NAKL_POS SET PARTY = '''', PARTY_RECID = Null, PARTY_BASEID = Null WHERE RECID = %d and BASEID = %d',
      [DocPosRecID.AsInteger, DocPosBaseID.AsInteger]);
    Exit;
  end;

  if IsPrihod = -1 then
  begin
    fbExecQuery(Nakl_Transaction, 'UPDATE DOC_NAKL_POS SET PARTY = %s, PARTY_RECID = %d, PARTY_BASEID = %d WHERE RECID = %d and BASEID = %d',
      [QuotedStr(Party_Number), Party_RecID, Party_BaseID, DocPosRecID.AsInteger, DocPosBaseID.AsInteger]);
    Exit;
  end;

  V:= fbExecQuery(Nakl_Transaction, 'SELECT NUMBER, DATE_PART, GTD_NUM4 FROM DOC_PARTY WHERE RECID = %d and BASEID = %d', [Party_RecID, Party_BaseID]);
  if not NullVar(V) and (VarToStr(V[0]) = Party_Number) and (VarToDateTime(V[1]) = Party_Date) then Exit;
  fbExecQuery(Nakl_Transaction, 'EXECUTE PROCEDURE PU_Select_Matched_Parties(%d, %d, %s, %s)',
    [DocPosRecID.AsInteger, DocPosBaseID.AsInteger
      , liUtils.iif(Party_Date <= 0, 'Null', QuotedStr(DateToStrEx(Party_Date)))
      , liUtils.iif(Party_Number = '', 'Null', QuotedStr(Party_Number))]);
end;


procedure TDocNaklForm.SplitNakl2Party;
const InsSql='insert into doc_party (number, date_part, kolich, docrecno, baseid, num_party_egais, operdate, kod_mater,debet,subdocrecno) '+
        ' values (:NUMBER_DEBET, :DATE_PART ,:KOLICH_DEBET, :docrecno, :baseid, :KOD_DK_POS, :operdate, :MATER_DEBET, :debet, :subdocrecno);';
      updSql='update doc_party set date_part= :DATE_PART , KOLICH=:KOLICH_DEBET where NUMBER= :NUMBER_DEBET;';
var
   q: TMegaQuery;
   iInStr:integer;
   currentParty:string;

   function CalcPartyNum: string;
   begin
     if (currentParty <> '')  then
       Result:= currentParty
     else if IsPartUchet3 and (DatePart <> 0) then
       Result:= FormatDateTime('DDMMYY', DatePart)+'-'+FormatFloat('000000000000', DocPosKOD_DK.AsFloat)+'-'+IntToStr(DocNaklDG_RECID.AsInteger)+'-'+IntToStr(DocNaklDG_BASEID.AsInteger)
     else
       Result:= IntToStr(DocNaklRECID.asInteger)+'-'+IntToStr(DocNaklBaseid.asInteger)+'-'+IntToStr(DocPosRECID.AsInteger);
   end;
begin
  //select number, num_party_egais, kolich
  //from get_number_party(:kod_mater, :group_oper, :kod_oper, :operdate, :recid, :baseid, :balance, :forma, :kolich_kredit, :debet, :kredit)

  {mdRestParty.close;
  mdRestParty.Params.byname['kod_mater'].AsFloat:=DocPosKOD_MATER.asfloat;
  mdRestParty.Params.byname['group_oper'].AsInteger:=DocNaklGROUP_OPER.asinteger;
  mdRestParty.Params.byname['kod_oper'].AsInteger:=DocNaklKod_OPER.asinteger;
  mdRestParty.Params.byname['operdate'].AsDateTime:=DocNaklOperdate.asdatetime;
  mdRestParty.Params.byname['recid'].AsInteger:=DocNaklRecid.asinteger;
  mdRestParty.Params.byname['baseid'].AsInteger:=DocNaklBaseid.asinteger;
  mdRestParty.Params.byname['balance'].AsInteger:=DocNaklBalance_kod.asinteger;
  if self.ClassName='TDocSchetForm' then     mdRestParty.Params.byname['forma'].AsInteger:=idvSchet
  else     mdRestParty.Params.byname['forma'].AsInteger:=idvNakl;
  mdRestParty.Params.byname['kolich_kredit'].AsFloat:=DocPosKOLICH.asfloat;
  mdRestParty.Params.byname['schet'].AsString:=Schet;
  mdRestParty.Params.byname['isprihod'].AsInteger:=isprihod;
  mdRestParty.open;}
  if (IntfMegaDBCommon.IsOffice) then
    exit;
  OpenDataSetParty;
  mdRestParty.first;
  while not mdRestParty.eof do
  begin
    if  (mdRestPartyKOLICH.asFloat>=0) then
    begin
      NaklSplitPartyQ.Close;
      if (IsPrihod=-1) then
      begin
         currentParty:= GetPartyNumber(DatePart,DocPosKOD_MATER.asFloat);
         if (currentParty='') or  (OPERSTATUS in [iosIncomeFromProvider,iosIncomeFromRoad,iosImportIncomeFromRoad]) then
            NaklSplitPartyQ.SQL.Text:='Execute procedure NAKL_POS_SPLIT_PARTY ('+DocPosBaseID.asString+','+DocPosRecID.AsString+','+floattostr(DocPosKOLICH.asFloat)+','''+CalcPartyNum+''','+'NULL'+','+inttostr(mdRestParty.Params.byname['forma'].AsInteger)+')'
         else
            NaklSplitPartyQ.SQL.Text:='Execute procedure NAKL_POS_SPLIT_PARTY ('+DocPosBaseID.asString+','+DocPosRecID.AsString+','+floattostr(DocPosKOLICH.asFloat)+','''+currentParty+''','+'NULL'+','+inttostr(mdRestParty.Params.byname['forma'].AsInteger)+')'
      end
      else
         NaklSplitPartyQ.SQL.Text:='Execute procedure NAKL_POS_SPLIT_PARTY ('+DocPosBaseID.asString+','+DocPosRecID.AsString+','+floattostr(mdRestPartyKOLICH.asFloat)+','''+mdRestPartyNUMBER.asString+''','+floattostr(mdRestPartyNUM_PARTY_EGAIS.asFloat)+','+inttostr(mdRestParty.Params.byname['forma'].AsInteger)+')';

      NaklSplitPartyQ.ExecQuery;
    end;
    if (IsPrihod=-1) then
    try
      q := TMegaQuery.Create(self);
      try
        q.Database := DocNakl.Database;
        q.Transaction := DocNakl.Transaction;
        q.SQL.text:=InsSql;
        if  mdRestPartyNUMBER.asString='' then
        begin
          if (CurrentParty = '') or (not IsPartUchet3 and (OPERSTATUS in [iosIncomeFromProvider,iosIncomeFromRoad,iosImportIncomeFromRoad])) then
          begin
            q.Params.ByName['NUMBER_DEBET'].asString:= CalcPartyNum;
            q.Params.ByName['subdocrecno'].AsInteger:=DocPosRECID.AsInteger;
            q.Params.ByName['KOLICH_DEBET'].asFloat:=DocPosKOLICH.asFloat;
            q.Params.ByName['DATE_PART'].asDateTime:=DatePart;
            q.Params.ByName['docrecno'].asInteger:=DocNaklRECID.asInteger;
            q.Params.ByName['baseid'].asInteger:=DocNaklBaseid.asInteger;
            q.Params.ByName['KOD_DK_POS'].asFloat:=mdRestPartyNUM_PARTY_EGAIS.asFloat;
            q.Params.ByName['OPERDATE'].AsDateTime:=DocNaklOPERDATE.asDateTime;
            q.Params.ByName['MATER_DEBET'].AsFloat:=DocPosKOD_MATER.asFloat;
            if not IsPartUchet3 then
              q.Params.ByName['DEBET'].AsString:= Schet
            else
              q.Params.ByName['DEBET'].AsString:= '';
            try
              q.ExecQuery;
            except
              q.close;
              q.SQL.text:=UpdSql;
              q.Params.ByName['NUMBER_DEBET'].asString:= CalcPartyNum;
              q.Params.ByName['KOLICH_DEBET'].asFloat:=DocPosKOLICH.asFloat;
              q.Params.ByName['DATE_PART'].asDateTime:=DatePart;
              q.ExecQuery;
            end;
            if IsPartUchet3 then
            begin
              CurrentParty:= CalcPartyNum;
              DocPosPARTY.AsString:= CurrentParty;
            end;
          end;
        end;
      finally
        q.Free;
      end;
    except
      on e: Exception do
        if IntfMegaAccessManager.GetUserRole = 'DEVELOPER' then
          ShowMessage(e.message);
      // Ну где же вы?
    end;
    mdRestParty.next;
  end;
end;

procedure TDocNaklForm.OpenDataSetParty;
begin
//
    mdRestParty.close;
    mdRestParty.Params.byname['kod_mater'].AsFloat:=DocPosKOD_MATER.asfloat;
    mdRestParty.Params.byname['group_oper'].AsInteger:=DocNaklGROUP_OPER.asinteger;
    mdRestParty.Params.byname['kod_oper'].AsInteger:=DocNaklKod_OPER.asinteger;
    mdRestParty.Params.byname['operdate'].AsDateTime:=DocNaklOperdate.asdatetime;
    mdRestParty.Params.byname['recid'].AsInteger:=DocNaklRecid.asinteger;
    mdRestParty.Params.byname['baseid'].AsInteger:=DocNaklBaseid.asinteger;
    mdRestParty.Params.byname['balance'].AsInteger:=DocNaklBalance_kod.asinteger;
    if self.ClassName='TDocSchetForm'
    then  mdRestParty.Params.byname['forma'].AsInteger:=idvSchet
    else  mdRestParty.Params.byname['forma'].AsInteger:=idvNakl;
    mdRestParty.Params.byname['kolich_kredit'].AsFloat:=DocPosKOLICH.asfloat;
    mdRestParty.Params.byname['schet'].AsString:=Schet;
    mdRestParty.Params.byname['isprihod'].AsInteger:=isprihod;
    mdRestParty.open;
end;

// Используется в накладной "Возврат от покупателей"
procedure TDocNaklForm.GetLinkDocParty;
//определение партий по связанному документу
const
   selSqlLinkParty= ' select dp.number NUMBER,dp.num_party_egais, dnp.kolich KOLICH,dp.date_part,dn.operdate, dg.docnumber, dp.gtd_num4, dp.recid, dp.baseid, dp.ukp '+
                    ' from link_doc_opl ldo '+
                    '   left join doc_nakl dn on (dn.recid=ldo.parent_recid and dn.baseid=ldo.parent_baseid) '+
                    '   left join doc_nakl_pos dnp on (dnp.docrecno=ldo.parent_recid and dnp.baseid=ldo.parent_baseid) '+
                    '   left join doc_party dp on (dp.number=dnp.party) '+
                    '   left join doc_gtd dg on (dg.recid = dp.gtd_recid and dg.baseid = dp.gtd_baseid) '+
                    ' where ldo.opl_recid=:recid and ldo.opl_baseid=:baseid and ldo.opl_form_type=1 and dnp.kod_mater=:KOD_MATER  and dnp.kolich>=:KOLICH';
begin
  mdsSelParty.close;
  mdsSelParty.selectSql.text:=selSqlLinkParty;
  mdsSelParty.parambyname('RECID').asInteger:=DocNaklRECID.AsInteger;
  mdsSelParty.parambyname('BASEID').asInteger:=DocNaklBASEID.AsInteger;
  mdsSelParty.parambyname('KOD_MATER').AsFloat:=DocPosKOD_MATER.AsFloat;
  mdsSelParty.parambyname('KOLICH').AsFloat:=DocPosKOLICH.AsFloat;
  mdsSelParty.open;
  mdsSelParty.First;
  if mdsSelParty.RecordCount=1 then
    if mdsSelParty.FieldByName('NUMBER').asString='' then
       GetAllParty(mdsSelParty.FieldByName('OPERDATE').asDateTime,DocPosKOD_MATER.AsFloat);
end;

procedure TDocNaklForm.GetDocParty(Date: TDatetime);
// оперделение партий по остаткам продукции
const
   selSqlDocParty='select grp.number_PARTY NUMBER,dp.num_party_egais, sum(grp.kolich_party) KOLICH,dp.date_part,dp.operdate, dg.docnumber, dp.gtd_num4, dp.ukp, 0 recid, 0 baseid '+
                  ' from  GET_REST_PARTY(:KOD_MATER,:SCHET_REST) grp '+
                  '  left join doc_party dp on (dp.number=grp.number_PARTY) '+
                  '  left join doc_gtd dg on (dg.recid = dp.gtd_recid and dg.baseid = dp.gtd_baseid) ' +
                  ' %s '+
                  ' group by 1,2,4,5,6,7,8 '+
                  ' having sum(grp.kolich_party)>=:KOLICH ';

   selSqlDocParty2='select grp.number_PARTY NUMBER,dp.num_party_egais, grp.kolich_party KOLICH,dp.date_part,dp.operdate, dg.docnumber, dp.gtd_num4, dp.recid, dp.baseid, dp.UKP '+
                  ' from  GET_REST_PARTY2(:KOD_MATER,:SCHET_REST, 1) grp '+
                  '  left join doc_party dp on (dp.recid=grp.PARTY_recid and dp.baseid=grp.PARTY_baseid) '+
                  '  left join doc_gtd dg on (dg.recid = dp.gtd_recid and dg.baseid = dp.gtd_baseid) ' +
                  ' where grp.kolich_party >= :KOLICH ';
begin
   mdsSelParty.Close;
   if IsPartUchet then
     mdsSelParty.selectSql.text:= selSqlDocParty2
      + liUtils.iif(Date <> 0, ' AND dp.date_part = ' + QuotedStr(DateToStrEx(Date)), '')
   else
     mdsSelParty.selectSql.text:= Format(selSqlDocParty,
      [liUtils.iif(Date <> 0, 'WHERE dp.date_part = ' + QuotedStr(DateToStrEx(Date)), '')]);

   mdsSelParty.ParamByName('KOLICH').asfloat:=DocPosKOLICH.AsFloat;
   mdsSelParty.ParamByName('KOD_MATER').asfloat:=DocPosKOD_MATER.AsFloat;
   mdsSelParty.ParamByName('SCHET_REST').asString:=Schet;
   mdsSelParty.Open;
end;

procedure TDocNaklForm.CheckTypeOperParty(Date: TDateTime);
//оперделяем какие партии отображать
begin
  if OPERSTATUS = iosReturnFromClient then
      GetLinkDocParty
  else if OPERSTATUS in [iosRealizationF1, iosRealizationF2] then
    GetDocParty(Date)
  else if DocNaklDK_TO.asfloat=ddkPeresort then
//    GetAllParty(date, DocPosKOD_MATER.AsFloat)
    GetAllParty(DocDate.Date, DocPosKOD_MATER.AsFloat)
  else if OPERSTATUS  in  [iosIncomeFromRoad,iosImportIncomeFromRoad, iosIncomeFromProvider] then
//    GetAllParty(date, DocPosKOD_MATER.AsFloat)
    GetAllParty(DocDate.Date, DocPosKOD_MATER.AsFloat)
{ ----------------- Added by Lion in 07.06.2008 ---------------- }
  else if OPERSTATUS = 0 then
//    GetAllParty(date, DocPosKOD_MATER.AsFloat)
    GetAllParty(DocDate.Date, DocPosKOD_MATER.AsFloat)
{ ----------- End of addition by Lion in 07.06.2008 ----------- }
  else
    GetDocParty(Date);
end;




procedure TDocNaklForm.chkIsBanketEditing(Sender: TObject;
  var CanEdit: Boolean);
var
   q: TMegaQuery;
begin

  Q := TMegaQuery.Create(Self);
  Q.Database := DM.Money;
  Q.Transaction := Nakl_Transaction;
  try
    Q.Close;
    Q.SQL.Text := 'update delivery_location dl set dl.is_banket=:is_banket where dl.docrecno=:recid and dl.baseid=:baseid and dl.formtype=:formtype;';
    Q.Params.ByName['RECID'].Value := DocNaklRecid.Value;
    Q.Params.ByName['baseid'].Value := DocNaklBaseid.Value;
    Q.Params.ByName['formtype'].Value := DocNaklDOC_INHERITED.asinteger;
    Q.Params.ByName['is_banket'].Value := liUtils.iif(chkIsBanket.checked,1,0);
    Q.ExecQuery;
    if (DocNaklSTATE.OldValue = idsBug) and (DocNaklSTATE.NewValue=idsBug) then
    begin
      if not IntfMegaDBCommon.IsOffice then
        raise Exception.Create('Изменение в документе запрещено. Снимите признак оплаты!');
    end
    else
    begin
      DocNakl.Edit;
      DocNaklState.value:=0;
    end;
  finally
    q.Free;
  end;
end;

{ Пересортица, Приход из пути, Приход от поставщика, OPERSTATUS = 0 }
procedure TDocNaklForm.GetAllParty(date_party: TDateTime;kod_mater:double);
const
   selSqlDocParty='select dp.number,dp.num_party_egais,dp.kolich,dp.date_part,dp.operdate, dg.docnumber, dp.gtd_num4, '
                 +'dp.recid, dp.baseid, dp.ukp from doc_party dp   left join doc_gtd dg on (dg.recid = dp.gtd_recid and dg.baseid = dp.gtd_baseid) '
                 +'where dp.operdate<=:DT and dp.kod_mater=:KOD_MATER';
begin
//
   mdsSelParty.Close;
   mdsSelParty.selectSql.text:=selSqlDocParty;
   mdsSelParty.ParamByName('DT').AsDateTime:=date_party;
   mdsSelParty.ParamByName('KOD_MATER').AsFloat:=kod_mater;
   mdsSelParty.Open;
end;

procedure TDocNaklForm.actPrintInvoiceTabClientUpdate(Sender: TObject);
begin
  TAction(Sender).Visible :=
  (IsOffice or (IntfMegaDBCommon.GetParam('WORK_VED', '0')='1')
  //(DocNaklBASEID.AsInteger=215)or(IntfMegaDBCommon.GetBaseID=215)
  )
  and (OPERSTATUS in [iosRealization,iosSpecification,iosInvoiceProf,iosInvoicePrePaid,iosInvoiceForPay]);
end;

procedure TDocNaklForm.actPrintInvoiceTabClientExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(51,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString);
end;

function TDocNaklForm.GetPartyNumber(date_party:TDateTime;kod_mater: double): string;
const
   selSql='select first 1 number from doc_party where kod_mater=:KOD_MATER and date_part=:DATE_PART order by operdate';
   selSqlLinkParty= ' select dp.number NUMBER,dp.num_party_egais, dnp.kolich KOLICH,dp.date_part,dn.operdate '+
                    ' from link_doc_opl ldo '+
                    ' left join doc_nakl dn on (dn.recid=ldo.parent_recid and dn.baseid=ldo.parent_baseid) '+
                    ' left join doc_nakl_pos dnp on (dnp.docrecno=ldo.parent_recid and dnp.baseid=ldo.parent_baseid) '+
                    ' left join doc_party dp on (dp.number=dnp.party) '+
                    ' where ldo.opl_recid=:recid and ldo.opl_baseid=:baseid and ldo.opl_form_type=1 and dnp.kod_mater=:KOD_MATER  and dnp.kolich>=:KOLICH';

var
   q: TMegaQuery;
begin
//
  result:='';
  q := TMegaQuery.Create(self);
  try
    q.Database    := DocNakl.Database;
    q.Transaction := DocNakl.Transaction;
    q.SQL.text:=selSql;
    q.Params.ByName['DATE_PART'].asDateTime:=Date_Party;
    q.Params.ByName['KOD_MATER'].AsFloat:=kod_mater;
    q.ExecQuery;
    while not q.Eof do
    begin
        result:=q.Fieldbyname('NUMBER').asString;
        q.next;
    end
  finally
    q.Free;
  end;
end;

procedure TDocNaklForm.actPrintGtdLinksExecute(Sender: TObject);
//var   ldmRep: TdmPrintNakl2;
begin

    if FDesignReport then
      dmMegaReports.MyDesign(45,DocNaklDocDATE.value,
                              [DocNakl.FieldByName('RECID').AsInteger,
                               DocNakl.FieldByName('BASEID').AsInteger,
                               DocNaklDOC_INHERITED.value],3)
    else
      dmMegaReports.MyShow(45,DocNaklDocDATE.value,
                              [DocNakl.FieldByName('RECID').AsInteger,
                               DocNakl.FieldByName('BASEID').AsInteger,
                               DocNaklDOC_INHERITED.value],3);

{  ldmRep:= TdmPrintNakl2.Create(Self);
  try
    lDMRep.frxNaklGTDLinks.Variables.Variables['RECID'] := DocNakl.FieldByName('RECID').AsInteger;
    lDMRep.frxNaklGTDLinks.Variables.Variables['BASEID'] := DocNakl.FieldByName('BASEID').AsInteger;
    if FDesignReport then
      lDMRep.frxNaklGTDLinks.DesignReport
    else
    begin
      lDMRep.frxNaklGTDLinks.PrepareReport;
      lDMRep.frxNaklGTDLinks.ShowReport;
    end;
  finally
    ldmRep.Free;
  end;}

end;

procedure TDocNaklForm.actPrintGtdLinksUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (UpperCase(MainTableName) = 'DOC_NAKL');
end;

procedure TDocNaklForm.ActPrintImportZ_ZTPPExecute(Sender: TObject);
begin
  If FDesignReport
  Then dmMegaReports.MyDesign(65, DocNaklOPERDATE.value, [DocNaklRECID.Value,DocNaklBASEID.Value],2)
  Else dmMegaReports.MyShow(65,DocNaklOPERDATE.value, [DocNaklRECID.Value,DocNaklBASEID.Value],2);
end;

procedure TDocNaklForm.ActPrintImport_ActZExecute(Sender: TObject);
begin
  If FDesignReport
  Then dmMegaReports.MyDesign(66, DocNaklOPERDATE.value, [DocNaklRECID.Value,DocNaklBASEID.Value],2)
  Else dmMegaReports.MyShow(66,DocNaklOPERDATE.value, [DocNaklRECID.Value,DocNaklBASEID.Value],2);

end;

procedure TDocNaklForm.ActPrintImport_CMRExecute(Sender: TObject);
begin
  If FDesignReport
  Then dmMegaReports.MyDesign(67, DocNaklOPERDATE.value, [DocNaklRECID.Value,DocNaklBASEID.Value],2)
  Else dmMegaReports.MyShow(67,DocNaklOPERDATE.value, [DocNaklRECID.Value,DocNaklBASEID.Value],2);

end;

procedure TDocNaklForm.actPrintNaklF2WithoutHeaderExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
  re: TRegExpr;
  flic: boolean;
begin
  CheckSelfExportState;
  // проверки на возможность печати
  if  (not AllowAll)
  and (DocNaklSTATE.Value<>idsBug)
  and (DocNaklSTATE.Value<>idsKassa)
  and (DocNaklDK_TO.AsFloat<>ddkEndUser)
  and (not intfMegaDBCommon.IsOffice)
  and (DocNaklSTATE.Value<>idsFromOffice)
  {and (OPERSTATUS = iosOutcomeToOtv)} then
  begin
    exit;
  end;
  if (DocNaklSTATE.Value= idsPrepare)
  or (DocNaklSTATE.Value= idsToOffice) then
  begin
    exit;
  end;

  //-- тоже проверка
//  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then
  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then

  begin
    DocNakl.Edit;
    DocNaklSTATE.Value := idsInternal;
  end;

{ ---------------- Changed by Petc.O in 06.11.2008 --------------- }
  // всвязи с особенностями реализации многопоточности в fr3
  // не даем закрыть накладную(а сворачиваем), пока она не допечатается
  aCanFreeForm := true;
{ ----------- End of changing by Petc.O in 06.11.2008 ----------- }
  //
  ldmRep:= TdmPrintNakl2.Create(Self);
  // проверяю, если на дебиторе выставлена галочка "печать с учетом возвратов",
  // то делаю видимым пункт "Печать накладной с учетом возвратов"

  try
    ldmRep.IsBillaNakl:= Sender = miBilla;
    ldmRep.IsOSNakl:=PrintOSNakl;
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);

    frVariables.Variable['HidePriceAndCost']:= False;

    if OPERSTATUS=iosOutcomeToOtv then
    begin
      frVariables.Variable['IsOtv']:= True;
      frVariables.Variable['HidePriceAndCost']:= true;
    end
    else begin
      frVariables.Variable['IsOtv']:= False;
    end;
    if (OPERSTATUS <> 4) or (IntfMegaDBCommon.GetParam('PR_NEW_NAKL_F2_AGENT','0') <> '1') then
     fLic:= True
    else
     fLic:= DM.GetLic(DocNakl.FieldByName('DK_TO').AsFloat, DocNakl.FieldByName('OPERDATE').AsDateTime);
    frVariables.Variable['fLic']:= fLic;
    frVariables.Variable['not_agent']:= true;
    frVariables.Variable['statePrint999']:=0; //все стр., 1 только КП, -1 без КП
    if FDesignReport then
    begin
      lDMRep.frNakl_f2_withoutheader.DesignReport;
    end
    else
    begin
      lDMRep.frNakl_f2_withoutheader.PrepareReport;
      lDMRep.frNakl_f2_withoutheader.PrintPreparedReportDlg;
    end;
    if not fLic then
     begin
       ldmRep.IsBillaNakl:= Sender = miBilla;
       ldmRep.IsOSNakl:=PrintOSNakl;
       ldmRep.PrepareReport(
         DocNaklRecID.Value, DocNaklBaseID.Value,
         IntfDBProvider.GetDB , Nakl_Transaction, False);
       frVariables.Variable['HidePriceAndCost']:= False;
       if OPERSTATUS=iosOutcomeToOtv then
        begin
          frVariables.Variable['IsOtv']:= True;
          frVariables.Variable['HidePriceAndCost']:= true;
        end
       else
        begin
          frVariables.Variable['IsOtv']:= False;
        end;
       frVariables.Variable['fLic']:= true;
       frVariables.Variable['not_agent']:= false; //на агента
       if FDesignReport then
        begin
          lDMRep.frNakl_f2_withoutheader.DesignReport;
        end
       else
        begin
          lDMRep.frNakl_f2_withoutheader.PrepareReport;
          lDMRep.frNakl_f2_withoutheader.PrintPreparedReportDlg;
        end;
     end;
  finally
    ldmRep.IsOSNakl:=false;
    ldmRep.Free;
    aCanFreeForm := true;
  end;
  //--
end;

procedure TDocNaklForm.actPrintNaklF2WithoutHeaderUpdate(Sender: TObject);
begin
  TAction(Sender).Visible := (DocNaklBALANCE_KOD.AsInteger = 300)
    and (not PrintOSNakl)
    //and (IntfMegaDBCommon.GetParam('PR_NAKL_F2_F1_SORT','0')='1')
    ;
end;

procedure TDocNaklForm.actPrintNaklImagesExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(701,DocNaklOperDate.Value,DocNaklRecID.asString+','+DocNaklBaseID.asString);
end;

procedure TDocNaklForm.actPrintTTNNaklExecute(Sender: TObject);
var
  r: Boolean;
begin
//   if  dmMegaReports.MyPrepareReport(3102,DocNaklOperDate.Value,
//                                         [DocNaklRecid.Value,DocNaklBaseid.Value,false,0],2)
//   if  dmMegaReports.MyPrepareReport(3102,DocNaklOperDate.Value,
//                                         DocNaklRecid.asString+','+DocNaklBaseid.asString+','+'0,0,2')
//
//   then r:=True;
    dmMegaReports.MyShow(3102,DocNaklOperDate.Value,
                                         DocNaklRecid.asString+','+DocNaklBaseid.asString+','+'0,0,2')

end;


procedure TDocNaklForm.actPrintNaklInPathwayExecute(Sender: TObject);
var
  dlg:TfmSelCfoForPrint;
  q: TMegaQuery;

begin
//
//  Q := TMegaQuery.Create(Self);
//  Q.Database := DM.Money;
//  Q.Transaction := Nakl_Transaction;
//  try
//      Q.Close;  //#13#10+
//      Q.SQL.Text := ' select first 1 dtn.recid, dtn.baseid dtn_baseid, dtnp.recid dtnp_recid, dtn.docdate from doc_nakl dn '+
//                    ' left join doc_trans_nakl_pos dtnp on dtnp.nakl_recid = dn.recid and dtnp.nakl_baseid = dn.baseid '+
//                    ' left join DOC_TRANS_NAKL dtn on dtnp.docrecno = dtn.recid and dtnp.baseid = dtn.baseid '+
//                    ' where dn.recid = :nakl_recid and dn.baseid = :baseid ';
//      Q.Params.ByName['nakl_recid'].Value := DocNaklRecid.Value;
//      Q.Params.ByName['baseid'].Value := DocNaklBaseid.Value;
//      Q.ExecQuery;
// add new nirs 27_09_2024
//  dlg := TfmSelCfoForPrint.create(self);
//  if dlg.ShowModal <> mrOk then exit;
//  if dlg.pcfo <= 0 then begin
//    ShowMessage('Не вибрано ЦФО');
//    Exit;
//  end;
//  dmMegaReports.MyShow(317,Now(),DocNaklRECID.asString+','+DocNaklBASEID.asString+','+IntToStr(dlg.pcfo));



 if (IntfMegaAccessManager.GetUserRole = 'DEVELOPER') then
    dmMegaReports.MyShow(317,Now(),DocNaklRECID.asString+','+DocNaklBASEID.asString)
 else
    dmMegaReports.MyShow(317,Now(),DocNaklRECID.asString+','+DocNaklBASEID.asString);
//  dmMegaReports.MyPrint(317,Now(),DocNaklRECID.asString+','+DocNaklBASEID.asString);

 if (IntfMegaAccessManager.GetUserRole = 'DEVELOPER') then
     dmMegaReports.MyShow(325, DocNaklOperDate.Value, DocNaklRECID.asString+','+DocNaklBASEID.asString)
   else
    dmMegaReports.MyShow(325, DocNaklOperDate.Value, DocNaklRECID.asString+','+DocNaklBASEID.asString);
end;

procedure TDocNaklForm.actPrintNaklNotLVIExecute(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
  re: TRegExpr;
begin

  if IntfMegaCommon.GetCurActiveMainBalance = DocNaklBALANCE_KOD.asInteger then
  begin
    PrintNaklExecute(Sender);
    exit;
  end;

{ ---------------- Changed by Petc.O in 06.11.2008 --------------- }
  // всвязи с особенностями реализации многопоточности в fr3
  // не даем закрыть накладную(а сворачиваем), пока она не допечатается
  aCanFreeForm := false;
{ ----------- End of changing by Petc.O in 06.11.2008 ----------- }
  //
  ldmRep:= TdmPrintNakl2.Create(Self);
  // проверяю, если на дебиторе выставлена галочка "печать с учетом возвратов",
  // то делаю видимым пункт "Печать накладной с учетом возвратов"
  if (Sender = PrintNaklWithVozvrat) And (DocNaklDK_TO_PRINT_WITH_VOZVRAT.AsInteger = 1){} Then
    Begin
      ldmRep.PrintNaklWithVozvrat := True;
    End; // DocNaklDK_TO_PRINT_WITH_VOZVRAT.AsInteger = 1

  try
    ldmRep.IsBillaNakl:= Sender = miBilla;
    ldmRep.IsOSNakl:=PrintOSNakl;

    ldmRep.lvi:=lvi; // [gsa:180220]

    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);
    if TMenuItem(sender).Name = 'N105' then
       frVariables.Variable['notes']:= true;
    if TMenuItem(sender).Name  = 'N95' then
       frVariables.Variable['notes']:= false;

    frVariables.Variable['HidePriceAndCost']:= False;
    frVariables.Variable['TTN']:= true;
    if OPERSTATUS=iosOutcomeToOtv then
    begin
      frVariables.Variable['IsOtv']:= True;
      frVariables.Variable['HidePriceAndCost']:= true;
    end
    else begin
      frVariables.Variable['IsOtv']:= False;
    end;

//    FDesignReport := ((IntfMegaAccessManager.GetUserName = 'DEREZA') OR (IntfMegaDBCommon.GetCountry = iccRussia));
    // Для российских сетевиков, по наличию символа # в
    // примечании документа, пишу в переменную отчёта
    // строку вида - "заказ №ХХХХ"

    if FDesignReport then
    begin
      lDMRep.frNaklNotLVI.DesignReport;
    end
    else
    begin
      lDMRep.frNaklNotLVI.PrepareReport;
      lDMRep.frNaklNotLVI.ShowReport;//PrintPreparedReportDlg;
    end;  
    {if FDesignReport then
    begin
      if (((IntfMegaDBCommon.GetCountry = iccUkraine) or (IntfMegaDBCommon.GetCountry = kodUKR)) and   (IntfMegaDBCommon.IsOffice)) then
      begin
        lDMRep.NaklReport.Modified:=true;
        lDMRep.NaklReport.ModifyPrepared:=true;
      end
      else
      begin
        lDMRep.NaklReport.Modified:=false;
        lDMRep.NaklReport.ModifyPrepared:=false;
      end;
      lDMRep.NaklReport.DesignReport;
    end
    else
    begin
      if (((IntfMegaDBCommon.GetCountry = iccUkraine) or (IntfMegaDBCommon.GetCountry = kodUKR)) and   (IntfMegaDBCommon.IsOffice)) then
      begin
        lDMRep.NaklReport.Modified:=true;
        lDMRep.NaklReport.ModifyPrepared:=true;
      end
      else
      begin
        lDMRep.NaklReport.Modified:=false;
        lDMRep.NaklReport.ModifyPrepared:=false;
      end;

      lDMRep.NaklReport.ShowReport;

    end; }

  finally
    ldmRep.IsOSNakl:=false;
    ldmRep.Free;
    aCanFreeForm := true;
    lvi:=False;
  end;
  //--
end;

procedure TDocNaklForm.actPrintNaklVozvratExecute(Sender: TObject);
var
 ldmRep: TdmPrintNakl2;
  re: TRegExpr;
begin
  // проверки на возможность печати
  if  (not AllowAll)
  and (DocNaklSTATE.Value<>idsBug)
  and (DocNaklSTATE.Value<>idsKassa)
  and (DocNaklDK_TO.AsFloat<>ddkEndUser)
  and (not intfMegaDBCommon.IsOffice)
  and (DocNaklSTATE.Value<>idsFromOffice)
  {and (OPERSTATUS = iosOutcomeToOtv)} then
  begin
    exit;
  end;
  if (DocNaklSTATE.Value= idsPrepare)
  or (DocNaklSTATE.Value= idsToOffice) then
  begin
    exit;
  end;

  //-- тоже проверка
//  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then
  if (DocNaklSTATE.Value <= 0) and (not IntfMegaDBCommon.IsOffice) then

  begin
    DocNakl.Edit;
    DocNaklSTATE.Value := idsInternal;
  end;

  //
  ldmRep:= TdmPrintNakl2.Create(Self);
  // проверяю, если на дебиторе выставлена галочка "печать с учетом возвратов",
  // то делаю видимым пункт "Печать накладной с учетом возвратов"
  if (Sender = PrintNaklWithVozvrat) And (DocNaklDK_TO_PRINT_WITH_VOZVRAT.AsInteger = 1){} Then
    Begin
      ldmRep.PrintNaklWithVozvrat := True;
    End; // DocNaklDK_TO_PRINT_WITH_VOZVRAT.AsInteger = 1

  try
    ldmRep.IsOSNakl:=PrintOSNakl;
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);

    frVariables.Variable['HidePriceAndCost']:= False;

    if OPERSTATUS=iosOutcomeToOtv then
    begin
      frVariables.Variable['IsOtv']:= True;
      frVariables.Variable['HidePriceAndCost']:= true;
    end
    else begin
      frVariables.Variable['IsOtv']:= False;
    end;

//    FDesignReport := ((IntfMegaAccessManager.GetUserName = 'DEREZA') OR (IntfMegaDBCommon.GetCountry = iccRussia));
    // Для российских сетевиков, по наличию символа # в
    // примечании документа, пишу в переменную отчёта
    // строку вида - "заказ №ХХХХ"
    if ((IntfMegaDBCommon.GetCountry = iccrussia) or (IntfMegaDBCommon.GetCountry = kodRus)) then
    begin
      re:=TRegExpr.Create;
      try
//        re.Expression:='\#\s*(\d+-\d+)(\s*\@(\d+))*';
{ ---------------- Changed by Lion in 04.02.2009 --------------- }
//        re.Expression:='\#\s*([0-9\-]+)(\s*\@(\d+))*';
        re.Expression:='\#\s*([-0-9A-Za-zА-Яа-я]+)(\s*\@(\d+))*';
{ ----------- End of changing by Lion in 04.02.2009 ----------- }
        if re.Exec(Trim(DocNakl.FieldByName('NOTES').AsString)) then
        begin
//          frVariables.Variable['ZakazNo']:= ', заказ №' + re.Match[1];
          frVariables.Variable['ZakazNo']:= re.Match[1];
          if (re.Match[3]='') then
             frVariables.Variable['KodOrder']:= ''
          else
             frVariables.Variable['KodOrder']:= 'код поставщика  ' + re.Match[3];
        end
        else
        begin
          frVariables.Variable['ZakazNo']:= '';
          frVariables.Variable['KodOrder']:='';
        end
      finally
        re.Free;
      end;
    end;

    if FDesignReport then
    begin
      lDMRep.NaklVozvratReport.DesignReport;
    end
    else
    begin
      lDMRep.NaklVozvratReport.PrepareReport;
      lDMRep.NaklVozvratReport.ShowReport;//lDMRep.NaklReport.ShowReport
    end;

  finally
    ldmRep.IsOSNakl:=false;
    ldmRep.Free;
  end;
  //--
end;

procedure TDocNaklForm.actPrintBirkaUpdate(Sender: TObject);
begin
   TAction(sender).Visible:= IsPartUchet3;
end;

procedure TDocNaklForm.actPrintBirkaExecute(Sender: TObject);
begin
  dmMegaReports.MyShow(706, Now(), DocNaklRecID.asString + ',' + DocNaklBaseID.asString);
end;

function TDocNaklForm.GetCfoCity(cfo: Integer): Integer;
begin
  Result:= VarToInt(fbExecQuery(DM, 'SELECT City FROM SPRAV_CFO WHERE KOD_CFO = %d', [cfo]));
end;

procedure TDocNaklForm.GetCfoIsUnloadCONTAINERS(cfo: Integer);
begin
//
  FIsUnloadContainers:=VarToInt(fbExecQuery(DM, 'SELECT coalesce(IS_UNLOAD_CONTAINERS,0) FROM SPRAV_CFO WHERE KOD_CFO = %d', [cfo]));
end;

procedure TDocNaklForm.N96Click(Sender: TObject);
var
  frm : TfmDialogBPCustom;
  lSumma : double;
  lNotes : string;
  Res: objectResponse;
begin
  frm := TfmDialogBPCustom.Create(Application);
  frm.Caption := 'Бизнес-процесс на снятие блокировки с ТТ по перегрузу';
  frm.lbCaption.Caption := 'Стартовать бизнес-процесс на снятие блокировки с ТТ по перегрузу';

  if frm.ShowModal = mrOk then
  begin
    with GetICommonModulesBusinessProcesses(true) do
    try
      Res := StartBusinessProcessDistributionRemoveOverloadBlockForTT(
          IntfMegaAccessManager.GetUserKodDK,
          NaklOutletRecid, NaklOutletBaseId,
          DocNaklBRAND_CASE_ID.AsInteger,
          Sum.Fields[5].AsFloat,
          DateTimeToXSDateTime(Date),
          frm.aNotes
          );
       case Res.ResponseType of
         Error: liUtils.Error(Res.ResponseMessage);
         Alert: liUtils.Warning(Res.ResponseMessage);
         Successful: liUtils.Info(Res.ResponseMessage);
       end;
    except
      on E:Exception do
      begin
        liUtils.Error('При создании процесса возникли ошибки:'#13#10+e.Message);
      end;
    end;
  end;
end;


procedure TDocNaklForm.tbSertificatClick(Sender: TObject);
begin
  TfmCertificateToMater.Execute(DocPosRECID.Value, DocPosBASEID.Value, Nakl_Transaction);
end;

procedure TDocNaklForm.G1Click(Sender: TObject);
begin
  dmMegaReports.MyShow(3191, Now(), DocNaklRecID.asString + ',' + DocNaklBaseID.asString + ', 0');
  //[gsa] 120419 добавил для клиента еще одну часть  в отчет,
end;

procedure TDocNaklForm.G3Click(Sender: TObject);
begin
//
end;

procedure TDocNaklForm.gCopyClick(Sender: TObject);
begin
//[gsa;07092020] скопировать в буфер данные
 gDNP:=gDocNP.Create;
 gDNP.WriteAtom('execute procedure DNP_COPYPASTROWS('+DocPosRECID.Text+','+DocPosBASEID.Text+',:InRecId,:InBaseId)');
 gPast.Enabled:=gDnp.fill;

end;

procedure TDocNaklForm.miOKKClick(Sender: TObject);
begin
  TfmPrintOKK.Execute(DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger);
end;


procedure TDocNaklForm.N98Click(Sender: TObject);
var
  EDIDoc: TEDIDocInfo;
begin
  case TMenuItem(Sender).Tag of
    1: begin
         EDIDoc:= CreateEDIInvoice(DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger);
         if (EDIDoc.doc = '') then
           Warning('Нет заказа EDI по этой накладной.');
         if (EDIDoc.invoice_send) then
           Warning('Счёт EDI по этой накладной уже отправлен.');
         if EDIDoc.invoice_required then
           Warning('Счёт EDI по этой накладной не требуется.');
       end;
    2: begin
         EDIDoc:= CreateEDIOrdrSP(DocNaklRECID.AsInteger, DocNaklBASEID.AsInteger);
         if (EDIDoc.doc = '') then
           Warning('Нет заказа EDI по этой накладной.');
         if (EDIDoc.ordrsp_send) then
           Warning('Подтверждение заказа EDI по этой накладной уже отправлено.');
         if EDIDoc.ordrsp_required then
           Warning('Подтверждение заказа EDI по этой накладной не требуется.');
       end;
    3: begin
         EDIDoc:= CreateEDIDesadv(DocNaklRECID.AsInteger{1256380}, DocNaklBASEID.AsInteger{216});
         if (EDIDoc.doc = '') then
           Warning('Нет заказа EDI по этой накладной.');
         if (EDIDoc.desadv_send) then
           Warning('Уведомление об отгрузке EDI по этой накладной уже отправлено.');
         if EDIDoc.desadv_required then
           Warning('Уведомление об отгрузке EDI по этой накладной не требуется.');
       end;
  end;
end;

procedure TDocNaklForm.N101Click(Sender: TObject);
begin
  dmMegaReports.MyShow(3005, Now(), DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString);
end;


procedure TDocNaklForm.N105Click(Sender: TObject);
begin
//
lvi:=True;
actPrintNaklNotLVIExecute(sender);
end;






procedure TDocNaklForm.N116Click(Sender: TObject);
begin
// печать чека для чп. страшное дело.
  dmMegaReports.MyShow(200632, Now(), DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString);
end;

procedure TDocNaklForm.N117Click(Sender: TObject);
var
   s,notes:string;
begin
  //
  InputQuery('Введите сумму', 'Сумма', S);
  InputQuery('Введите примечание', 'Текст', notes);
  dmMegaReports.MyShow(200633, Now(), s + ',' + notes);
end;

procedure TDocNaklForm.N118Click(Sender: TObject);
var
  ldmRep: TdmPrintNakl2;
  re: TRegExpr;
begin



{ ---------------- Changed by Petc.O in 06.11.2008 --------------- }
  // всвязи с особенностями реализации многопоточности в fr3
  // не даем закрыть накладную(а сворачиваем), пока она не допечатается
  aCanFreeForm := false;
{ ----------- End of changing by Petc.O in 06.11.2008 ----------- }
  //
  ldmRep:= TdmPrintNakl2.Create(Self);
  // проверяю, если на дебиторе выставлена галочка "печать с учетом возвратов",
  // то делаю видимым пункт "Печать накладной с учетом возвратов"
  if (Sender = PrintNaklWithVozvrat) And (DocNaklDK_TO_PRINT_WITH_VOZVRAT.AsInteger = 1){} Then
    Begin
      ldmRep.PrintNaklWithVozvrat := True;
    End; // DocNaklDK_TO_PRINT_WITH_VOZVRAT.AsInteger = 1

  try
    ldmRep.IsBillaNakl:= Sender = miBilla;
    ldmRep.IsOSNakl:=PrintOSNakl;
    ldmRep.PrepareReport(
      DocNaklRecID.Value, DocNaklBaseID.Value,
      IntfDBProvider.GetDB , Nakl_Transaction, False);
    if TMenuItem(sender).Name = 'N105' then
       frVariables.Variable['notes']:= true;
    if TMenuItem(sender).Name = 'N118' then
       frVariables.Variable['notes']:= true;
    if TMenuItem(sender).Name  = 'N95' then
       frVariables.Variable['notes']:= false;

    frVariables.Variable['HidePriceAndCost']:= False;
    frVariables.Variable['TTN']:= true;
    if OPERSTATUS=iosOutcomeToOtv then
    begin
      frVariables.Variable['IsOtv']:= True;
      frVariables.Variable['HidePriceAndCost']:= true;
    end
    else begin
      frVariables.Variable['IsOtv']:= False;
    end;

//    FDesignReport := ((IntfMegaAccessManager.GetUserName = 'DEREZA') OR (IntfMegaDBCommon.GetCountry = iccRussia));
    // Для российских сетевиков, по наличию символа # в
    // примечании документа, пишу в переменную отчёта
    // строку вида - "заказ №ХХХХ"

    if FDesignReport then
    begin
      lDMRep.frNaklNotLVIpp.DesignReport;
    end
    else
    begin
      lDMRep.frNaklNotLVIPP.PrepareReport;
      lDMRep.frNaklNotLVIPP.ShowReport;//PrintPreparedReportDlg;
    end;

  finally
    ldmRep.IsOSNakl:=false;
    ldmRep.Free;
    aCanFreeForm := true;
  end;
  //--
end;

procedure TDocNaklForm.N119Click(Sender: TObject);
begin
//
  dmMegaReports.MyShow(200634, Now(), '');
end;

procedure TDocNaklForm.N124Click(Sender: TObject);
begin
  PrintNakl;
end;

procedure TDocNaklForm.N128Click(Sender: TObject);
begin
  dmMegaReports.MyShow(200635, Now(), DateToStrEx(DBDateEdit1.Date)+',' +DateToStrEx(DBDateEdit1.Date) + ', ' + DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString);
end;

procedure TDocNaklForm.N129Click(Sender: TObject);
begin
  dmMegaReports.MyShow(200636, Now(), DateToStrEx(DBDateEdit1.Date)+',' +DateToStrEx(DBDateEdit1.Date) + ', ' + DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString);
end;

procedure TDocNaklForm.N134Click(Sender: TObject);
begin
///
dmMegaReports.MyShow(200640, Now(), DateToStrEx(DBDateEdit1.Date)+',' +DateToStrEx(DBDateEdit1.Date) + ', ' + DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString);
end;

procedure TDocNaklForm.N135Click(Sender: TObject);
begin
  dmMegaReports.MyShow(220202, Now(), DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString);
end;

procedure TDocNaklForm.N210Click(Sender: TObject);
begin
//
dmMegaReports.MyShow(200635, Now(), DocNaklRECID.AsString + ',' + DocNaklBASEID.AsString);
end;

procedure TDocNaklForm.N211Click(Sender: TObject);
var
   dt1,summa,dt2,dt3,number,dt4,dt5:string;
begin
  //
  InputQuery('Введите дату и время (1)', 'Дата/Время', dt1);
  InputQuery('Введите Сумму', 'Сумма', summa);
  InputQuery('Введите дату и время (2)', 'Дата/Время', dt2);
  InputQuery('Введите дату и время (3)', 'Дата/Время', dt3);
  InputQuery('Введите номер Z-отчета и дату (4)', 'Номер/Дата', number);
  InputQuery('Введите время (5)', 'Время', dt4);
  InputQuery('Введите дату и время (6)', 'Дата/Время', dt5);
  dmMegaReports.MyShow(200636, Now(), dt1 + ',' + summa+','+dt2+','+dt3+','+number+','+dt4+','+dt5);
end;

procedure TDocNaklForm.N212Click(Sender: TObject);
begin
//
 dmMegaReports.MyShow(200637, Now(), '');
end;

procedure TDocNaklForm.Torg2ForClientClick(Sender: TObject);
var
  ldmRep: TdmPrintNakl2R;
begin // подготовка к печати "Акт об установленных расхождениях по количеству .."
      // унифицированная форма "Торг-2"
   if (IntfMegaDBCommon.GetCountry <> iccRussia) then exit;

  //if fmAktTorg2Params = nil then
  //  fmAktTorg2Params:= TfmAktTorg2Params.Create(Self);

  //if fmAktTorg2Params.ShowModal <> mrOk then Exit;

  ldmRep:= TdmPrintNakl2R.Create(Self);
  try
    ldmRep.dsTorg2Title.Params.ByName['RECID'].asInteger:=DocNaklRecID.Value;
    ldmRep.dsTorg2Title.Params.ByName['BASEID'].asInteger:=DocNaklBaseID.Value;
    ldmRep.dsTorg2Title.Open;
    ldmRep.dsTorg2Pos.Params.ByName['RECID'].asInteger:=DocNaklRecID.Value;
    ldmRep.dsTorg2Pos.Params.ByName['BASEID'].asInteger:=DocNaklBaseID.Value;
    ldmRep.dsTorg2Pos.Open;
    if (IntfMegaAccessManager.GetUserRole='DEVELOPER') then
      ldmRep.frTorg2forClient.DesignReport
    else
      ldmRep.frTorg2forClient.ShowReport;
  finally
    ldmRep.Free;
  end;
end;

// инициализация механизма перехвата исключений
{initialization

  JclStackTrackingOptions := JclStackTrackingOptions + [stExceptFrame];
  JclStartExceptionTracking;  }



end.





