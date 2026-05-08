// ------------------------------------
// project : Megapolis Money
// --
// module  : окно операций по счёту
// author  :
// --
// created       :
// last modified :
// ------------------------------------
unit ViewOperList2;
{$i mega.inc}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBGridEH, StdCtrls, Mask, RXLookup, Db, MoneyData,
  Buttons, CSEZForm, FIBDataSet, FIBQuery, RXDBCtrl, DocList,
  FIBDatabase, ExtCtrls, ActnList, Menus, DBSumLst, DBGridEhImpExp,
  rxStrUtils , contNRS, uMegaComboSelect,
  FR_DSet, FR_DBSet, FR_Class, MegaDebug,
  RegExpr, uUtils, liUtils,
  {$IFDEF RX_LIB_2_7_7}rxToolEdit,{$ELSE}ToolEdit,{$endif}
  {$ifdef D6+}Variants, {$endif}
  uMegaDSDocTTN,
  uMegaSelBalance,
  uMegaSelSchet,
  uMegaSelCFO,
  uMegaSelectDK,
  uMegaCustomSelect,
  DBClient,
  uMegaCustomDialog,
  uTypes,
  uMegaForms, uMegaCustomSelectDB, frxClass, frxDBSet, frxExportPDF,
  frxExportRTF, frxExportXLS, uMegaPeriodPanel2, uMegaRDataSet,
  pFIBDatabase, pFIBDataSet, pFIBQuery, ufmDKOutlets, frxDesgn, ufmMegaSelDlg,
  RXCtrls, RxMemDS, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  dxSkinscxPCPainter, MemTbl, uMegaSelBrandCase, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxButtons, cxCheckBox, uMegaSelContract, pFIBProps,
  DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh
  ,MidasLib ,midas // add new nirs 16_04_2024
  ;

  const
  ExceptSubDk2 = 'Выбранный дебитор - сабдебитор Ф2. Выберите основного дебитора!';
  Exept_MainDk_With_SubDkF2 = 'У дебитора есть сабдебиторы Ф2. Нужно поставить галочку "+ сабдебиторы"';
  Analitik_brandCase =3 ; //аналитика по пакету брендов
  Analitik_Contract =6; // аналитика по договорам
type
  TViewOperListForm2 = class(TMegaForm)
    pnHeader: TPanel;
    fqSummaryTemp: TMegaQuery;
    dsMain: TDataSource;
    pnGrid: TPanel;
    FIBDataSetCurrentBase: TMegaRDataSet;
    DBGridEH1: TDBGridEH;
    al: TActionList;
    Document: TAction;
    Print: TAction;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    FIBDataSetCurrentBaseOPERDATE: TDateTimeField;
    FIBDataSetCurrentBaseDOCTYPE: TMegaStringField;
    FIBDataSetCurrentBaseDOCNUM: TIntegerField;
    FIBDataSetCurrentBaseKOR_SCHET: TMegaStringField;
    FIBDataSetCurrentBaseFORMTYPE: TIntegerField;
    FIBDataSetCurrentBaseDOCRECNO: TIntegerField;
    FIBDataSetCurrentBaseDEBET_SUMMA: TFloatField;
    FIBDataSetCurrentBaseKREDIT_SUMMA: TFloatField;
    Calculate: TAction;
    FIBDataSetCurrentBaseBASEID: TIntegerField;
    FIBDataSetCurrentBaseKOLICH_DEBET: TFloatField;
    FIBDataSetCurrentBaseKOLICH_KREDIT: TFloatField;
    FIBDataSetCurrentBaseDK_NAME: TMegaStringField;
    DBSumList1: TDBSumList;
    pmPrint: TPopupMenu;
    PrintOperList: TAction;
    actPrintActSver: TAction;
    ViewDocProv: TAction;
    N6: TMenuItem;
    Panel4: TPanel;
    ViewDocBtn: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    FIBDataSetCurrentBaseREG_BASEID: TIntegerField;
    Query: TMegaQuery;
    aSelBase: TAction;
    FIBDataSetCurrentBaseKOLICH_DEBET1: TFloatField;
    FIBDataSetCurrentBaseDEBET_SUMMA1: TFloatField;
    FIBDataSetCurrentBaseKOLICH_KREDIT1: TFloatField;
    FIBDataSetCurrentBaseKREDIT_SUMMA1: TFloatField;
    aUnSelBase: TAction;
    Query1: TMegaQuery;
    aChangeDK: TAction;
    aProv: TAction;
    Transaction: TMegaTransaction;
    aChangeOper: TAction;
    actLinkDocOplRun: TAction;
    N5: TMenuItem;
    FIBDataSetCurrentBaseParentCount: TIntegerField;
    FIBDataSetCurrentBaseChildCount: TIntegerField;
    actHighLightOplDocs: TAction;
    N7: TMenuItem;
    actRemoveParentOplDoc: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    actRemoveOplDoc: TAction;
    N10: TMenuItem;
    actShowLinkedDocs: TAction;
    N11: TMenuItem;
    aPlatToReg: TAction;
    FIBDataSetCurrentBaseCFO: TIntegerField;
    FIBDataSetCurrentBaseKOR_CFO: TIntegerField;
    MegaSelDKDialog: TMegaSelDKDialog;
    pnHeaderLeft: TPanel;
    pnRunButton: TPanel;
    StartBtn: TBitBtn;
    MegaSelBalance: TMegaSelBalance;
    MegaSelCFO: TMegaSelCFO;
    MegaSelSchet: TMegaSelSchet;
    PanelDK: TPanel;
    Label6: TLabel;
    DK_FROM_CE: TcxButtonEdit;
    CheckBox3: TCheckBox;
    chbInBalanceValyut: TCheckBox;
    MegaPeriodPanel: TMegaPeriodPanel2;
    FIBDataSetReestr: TMegaRDataSet;
    cdsData: TClientDataSet;
    FIBDataSetCurrentBaseKOD_DK: TFloatField;
    FIBDataSetReestrOPERDATE: TDateTimeField;
    FIBDataSetReestrDOCTYPE: TMegaStringField;
    FIBDataSetReestrDOCNUM: TIntegerField;
    FIBDataSetReestrKOR_SCHET: TMegaStringField;
    FIBDataSetReestrKOLICH_DEBET: TFloatField;
    FIBDataSetReestrDEBET_SUMMA: TFloatField;
    FIBDataSetReestrKOLICH_KREDIT: TFloatField;
    FIBDataSetReestrKREDIT_SUMMA: TFloatField;
    FIBDataSetReestrFORMTYPE: TIntegerField;
    FIBDataSetReestrDK_NAME: TMegaStringField;
    FIBDataSetReestrDOCRECNO: TIntegerField;
    FIBDataSetReestrBASEID: TIntegerField;
    FIBDataSetReestrREG_BASEID: TIntegerField;
    FIBDataSetReestrKOLICH_DEBET1: TFloatField;
    FIBDataSetReestrDEBET_SUMMA1: TFloatField;
    FIBDataSetReestrKOLICH_KREDIT1: TFloatField;
    FIBDataSetReestrKREDIT_SUMMA1: TFloatField;
    FIBDataSetReestrParentCount: TIntegerField;
    FIBDataSetReestrChildCount: TIntegerField;
    FIBDataSetReestrCFO: TIntegerField;
    FIBDataSetReestrKOR_CFO: TIntegerField;
    FIBDataSetReestrKOD_DK: TFloatField;
    aSelBase1: TMenuItem;
    aProvToReg: TAction;
    actPrintOperList2AMater: TAction;
    N14: TMenuItem;
    actFindExpeditor: TAction;
    N15: TMenuItem;
    N16: TMenuItem;
    actPrintActSver2: TAction;
    N17: TMenuItem;
    actPrintKassaBook: TAction;
    N18: TMenuItem;
    N19: TMenuItem;
    actPrintArkush: TAction;
    N20: TMenuItem;
    N21: TMenuItem;
    actPrintBoth: TAction;
    N22: TMenuItem;
    pmPrintRu: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    sbtnPeriod: TSpeedButton;
    PrintCheckBox: TCheckBox;
    frxdbData: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    N3: TMenuItem;
    bAddCompl: TBitBtn;
    actAdd2Compl: TAction;
    SharedQ: TMegaQuery;
    sharedTr: TMegaTransaction;
    PrintTTNameCheckBox: TCheckBox;
    CB_PrintReturn: TCheckBox;
    frxDesigner1: TfrxDesigner;
    frxRepMater: TfrxReport;
    N23: TMenuItem;
    actPrintNotes: TAction;
    N24: TMenuItem;
    actPrintSverExport: TAction;
    N25: TMenuItem;
    BitBtn1: TBitBtn;
    actReturnsMakeShowForm: TAction;
    N26: TMenuItem;
    actChangeDate: TAction;
    sbtAnaliz: TRxSpeedButton;
    dsSource: TClientDataSet;
    dsSumGroup: TRxMemoryData;
    dsSum: TRxMemoryData;
    dsSourceOPERDATE: TDateTimeField;
    dsSourceDOCTYPE: TMegaStringField;
    dsSourceDOCNUM: TIntegerField;
    dsSourceKOR_SCHET: TMegaStringField;
    dsSourceKOLICH_DEBET: TFloatField;
    dsSourceDEBET_SUMMA: TFloatField;
    dsSourceKOLICH_KREDIT: TFloatField;
    dsSourceKREDIT_SUMMA: TFloatField;
    dsSourceFORMTYPE: TIntegerField;
    dsSourceDK_NAME: TMegaStringField;
    dsSourceDOCRECNO: TIntegerField;
    dsSourceBASEID: TIntegerField;
    dsSourceREG_BASEID: TIntegerField;
    dsSourceKOLICH_DEBET1: TFloatField;
    dsSourceDEBET_SUMMA1: TFloatField;
    dsSourceKOLICH_KREDIT1: TFloatField;
    dsSourceKREDIT_SUMMA1: TFloatField;
    dsSourceParentCount: TIntegerField;
    dsSourceChildCount: TIntegerField;
    dsSourceCFO: TIntegerField;
    dsSourceKOR_CFO: TIntegerField;
    dsSourceKOD_DK: TFloatField;
    dsSourceKOR_CFO_NAME: TMegaStringField;
    dsSourceNOTES: TMegaStringField;
    dsSourceTT: TMegaStringField;
    dsSourcePNSumma: TFloatField;
    dsSourcePNDate: TDateTimeField;
    dsSourcePNNumber: TMegaStringField;
    dsSourceAddress_from: TMegaStringField;
    dsSourceINOUT: TSmallintField;
    dsSourceRETURN_TEXT: TMegaStringField;
    dsSourceDAYCOUNT: TIntegerField;
    dsSourceCHECKED: TIntegerField;
    dsSumGroupCHECKED: TIntegerField;
    dsSumCHECKED: TIntegerField;
    dsSourceOSTATOK: TFloatField;
    dsSumGroupOSTATOK: TFloatField;
    dsSumOSTATOK: TFloatField;
    actActDoneWorks: TAction;
    N4: TMenuItem;
    FIBDataSetReestrIS_HORECA_NAME: TMegaStringField;
    FIBDataSetCurrentBaseIS_HORECA_NAME: TMegaStringField;
    btnHightLightSandora: TMenuItem;
    btnShowDebetNotEqualKredit: TMenuItem;
    dsSourceIS_HORECA_NAME: TMegaStringField;
    dsSourceDEBET_MINUS_KREDIT: TFloatField;
    dsSourceDEBET_SUMMA_TRUNC2: TIntegerField;
    dsSourceKREDIT_SUMMA_TRUNC2: TIntegerField;
    dsSumGroupIS_HORECA_NAME: TMegaStringField;
    dsSumGroupDEBET_MINUS_KREDIT: TFloatField;
    dsSumGroupDEBET_SUMMA_TRUNC2: TIntegerField;
    dsSumGroupKREDIT_SUMMA_TRUNC2: TIntegerField;
    dsSumIS_HORECA_NAME: TMegaStringField;
    dsSumDEBET_MINUS_KREDIT: TFloatField;
    dsSumDEBET_SUMMA_TRUNC2: TIntegerField;
    dsSumKREDIT_SUMMA_TRUNC2: TIntegerField;
    N13: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    actSetColorArrearsDoc: TAction;
    N29: TMenuItem;
    mdsArrearsDolg: TMegaRDataSet;
    chkProsrDolg: TCheckBox;
    dsSourceOTSR: TIntegerField;
    dsSourcePROSR_SUM: TFloatField;
    dsSumGroupOTSR: TIntegerField;
    dsSumGroupPROSR_SUM: TFloatField;
    dsSumOTSR: TIntegerField;
    dsSumPROSR_SUM: TFloatField;
    G1: TMenuItem;
    frxBuhSpravka: TfrxReport;
    FIBDataSetReestrMODE_1C: TIntegerField;
    FIBDataSetCurrentBaseMODE_1C: TIntegerField;
    actHighLightOplDocs1C: TMenuItem;
    PanelFAnalitic: TPanel;
    MegaSelBrandCase1: TMegaSelBrandCase;
    Panel7: TPanel;
    Label12: TLabel;
    edKladov: TEdit;
    Panel2: TPanel;
    pnStaticKODDK: TPanel;
    edStaticDK: TLabel;
    stDK: TStaticText;
    CheckBox1: TCheckBox;
    Panel5: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    CheckBox2: TCheckBox;
    Panel6: TPanel;
    Label9: TLabel;
    StaticText3: TStaticText;
    pnMater: TPanel;
    Label1: TLabel;
    StaticText5: TStaticText;
    dsSourcemode_1c: TIntegerField;
    dsSumGroupMode_1c: TIntegerField;
    dsSumMode_1c: TIntegerField;
    dsSumGroupday_prosr: TIntegerField;
    dsSumday_prosr: TIntegerField;
    dsSourceday_prosr: TIntegerField;
    actPrintPKO: TAction;
    actPrintRKO: TAction;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    actPrintSverkaAll: TAction;
    N33: TMenuItem;
    cxBtnSeparatorMO: TcxButton;
    actSeparationMO: TAction;
    chkOtsr: TcxCheckBox;
    FIBDataSetCurrentBaseOTSR: TIntegerField;
    actViewProtokol: TAction;
    actClearKodDk: TAction;
    MegaSelContract: TMegaSelContract;
    actZeroProv: TAction;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    actPrintActSverDoc: TAction;
    chkNumberDogovor: TCheckBox;
    actPrintOperList2AMater_ENG: TAction;
    ENG1: TMenuItem;
    actChangeDk_c: TAction;
    dsSourceDOCDATE: TDateTimeField;
    dsSumGroupDOCDATE: TDateTimeField;
    dsSumDOCDATE: TDateTimeField;
    FIBDataSetCurrentBaseDOCDATE: TDateTimeField;
    FIBDataSetReestrDOCDATE: TDateTimeField;
    ActshowError: TAction;
    N37: TMenuItem;
    actValyutaControl: TAction;
    N38: TMenuItem;
    dsSourceDAYVALCONTROL: TSmallintField;
    FIBDataSetReestrDAYVALCONTROL: TIntegerField;
    FIBDataSetCurrentBaseDAYVALCONTROL: TIntegerField;
    ActPrintCheckPdv_83: TAction;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    actPrintZapros: TAction;
    N42: TMenuItem;
    btnCheckPDV_UA: TBitBtn;
    pmChechPDV: TPopupMenu;
    N43: TMenuItem;
    actActPrintCheckPdv_incoming: TAction;
    actActPrintCheckPdvincoming1: TMenuItem;
    Action1: TAction;
    actPrintActSverNew: TAction;
    N44: TMenuItem;
    N45: TMenuItem;
    actActPrintCheckPdv_631_incoming: TAction;
    N6311: TMenuItem;
    actPrintSverkaFromLVZ: TAction;
    N46: TMenuItem;
    chkDebetKredit: TcxCheckBox;
    accPrintRepForNalogRus: TAction;
    N47: TMenuItem;
    N48: TMenuItem;
    mniActTovarOper: TMenuItem;
    mniActPretens: TMenuItem;
    mniActOtherOper: TMenuItem;
    actPrintTurnoverDal: TAction;
    N49: TMenuItem;
    MegaPeriodPanel21: TMegaPeriodPanel2;
    BitBtn4: TBitBtn;
    actPereprSel: TAction;
    ADeleteProvSel: TAction;
    AltF71: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FIBDataSetCurrentBaseAfterOpen(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DocumentExecute(Sender: TObject);
    procedure DocumentUpdate(Sender: TObject);
    procedure PrintExecute(Sender: TObject);
    procedure CalculateUpdate(Sender: TObject);
    procedure CalculateExecute(Sender: TObject);
    procedure DBGridEH1DrawFooterCell(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEH; Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure PrintUpdate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure PrintOperListUpdate(Sender: TObject);
    procedure actPrintActSverUpdate(Sender: TObject);
    procedure ViewDocProvExecute(Sender: TObject);
    procedure DBGridEH1SortMarkingChanged(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure FIBDataSetCurrentBaseCalcFields(DataSet: TDataSet);
    procedure aSelBaseExecute(Sender: TObject);
    procedure DBGridEH1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aUnSelBaseExecute(Sender: TObject);
    procedure aChangeDKExecute(Sender: TObject);
    procedure DBGridEH1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aProvExecute(Sender: TObject);
    procedure DBGridEH1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aChangeOperExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actLinkDocOplRunExecute(Sender: TObject);
    procedure actHighLightOplDocsExecute(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure actRemoveParentOplDocExecute(Sender: TObject);
    procedure actRemoveOplDocExecute(Sender: TObject);
    procedure actShowLinkedDocsExecute(Sender: TObject);
    procedure aPlatToRegExecute(Sender: TObject);
    procedure MegaSelSchetChange(Sender: TObject);
    procedure aProvToRegExecute(Sender: TObject);
    procedure actPrintOperList2AMaterExecute(Sender: TObject);
    procedure actFindExpeditorExecute(Sender: TObject);
    procedure actPrintActSver2Execute(Sender: TObject);
    procedure actPrintKassaBookExecute(Sender: TObject);
    procedure actPrintArkushExecute(Sender: TObject);
    procedure actPrintBothExecute(Sender: TObject);
    procedure sbtnPeriodClick(Sender: TObject);
    procedure MegaSelDKDialogChangeTO(Sender: TObject;
      const KOD_DK: Double; const SHORTNAME_DK: String);
    procedure N3Click(Sender: TObject);
    procedure actAdd2ComplExecute(Sender: TObject);
    procedure actAdd2ComplUpdate(Sender: TObject);
    procedure cdsDataBeforePost(DataSet: TDataSet);
    procedure actPrintNotesExecute(Sender: TObject);
    procedure actPrintSverExportExecute(Sender: TObject);
    procedure actReturnsMakeShowFormExecute(Sender: TObject);
    procedure actReturnsMakeShowFormUpdate(Sender: TObject);
    procedure actChangeDateUpdate(Sender: TObject);
    procedure actChangeDateExecute(Sender: TObject);
    procedure DBGridEH1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure sbtAnalizClick(Sender: TObject);
    procedure cdsDataCalcFields(DataSet: TDataSet);
    procedure actActDoneWorksExecute(Sender: TObject);
    procedure actActDoneWorksUpdate(Sender: TObject);
    procedure DK_FROM_CEEnter(Sender: TObject);
    procedure DK_FROM_CEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnHightLightSandoraClick(Sender: TObject);
    procedure aPlatToRegUpdate(Sender: TObject);
    procedure aProvToRegUpdate(Sender: TObject);
    procedure actSetColorArrearsDocExecute(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure chkProsrDolgClick(Sender: TObject);
    procedure actPrintPKOExecute(Sender: TObject);
    procedure actPrintRKOExecute(Sender: TObject);
    procedure actPrintSverkaAllExecute(Sender: TObject);
    procedure actSeparationMOExecute(Sender: TObject);
    procedure chkOtsrPropertiesChange(Sender: TObject);
    procedure actViewProtokolExecute(Sender: TObject);
    procedure actClearKodDkExecute(Sender: TObject);
    procedure actZeroProvExecute(Sender: TObject);
    procedure actPrintActSverDocExecute(Sender: TObject);
    procedure actChangeDk_cExecute(Sender: TObject);
    procedure ActshowErrorExecute(Sender: TObject);
    procedure ActshowErrorUpdate(Sender: TObject);
    procedure actValyutaControlExecute(Sender: TObject);
    procedure ActPrintCheckPdv_83Execute(Sender: TObject);
    procedure ActPrintCheckPdv_83Update(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure actPrintZaprosExecute(Sender: TObject);
    procedure actPrintActSverExecute(Sender: TObject);
    procedure actActPrintCheckPdv_incomingExecute(Sender: TObject);
    procedure actActPrintCheckPdv_incomingUpdate(Sender: TObject);
    procedure btnCheckPDV_UAClick(Sender: TObject);
    procedure actPrintActSverNewExecute(Sender: TObject);
    procedure actActPrintCheckPdv_631_incomingUpdate(Sender: TObject);
    procedure actActPrintCheckPdv_631_incomingExecute(Sender: TObject);
    procedure actPrintSverkaFromLVZExecute(Sender: TObject);
    procedure MegaSelBalanceChange(Sender: TObject);
    procedure accPrintRepForNalogRusExecute(Sender: TObject);
    procedure mniActTovarOperClick(Sender: TObject);
    procedure mniActPretensClick(Sender: TObject);
    procedure mniActOtherOperClick(Sender: TObject);
    procedure actPrintTurnoverDalExecute(Sender: TObject);
    procedure actPereprSelExecute(Sender: TObject);
  private
    { Private declarations }
//    cdsData: TClientDataSet; // add new nirs 16_04_2024
    FValyutInfo : String;
    FDebug: Boolean;
    fF2MAin: boolean;

    procedure InsNAkl2ComplPos(aRecid,aBaseid:double);
    procedure Recalc(var Message: TMessage); message 39999;

    procedure CalcHeaderPanelHeight;
    procedure PrepareGetOplQueries;
    procedure ExecGetOplQueries;

    property GetValyutInfo: string read FValyutInfo;
    procedure CalcValyutInfo;
    procedure ShowDebetNotEqualKredit;
    procedure CreateAndInitcdsData; // add new nirs 16_04_2024
    procedure cdsDataBeforePost_F(DataSet: TDataSet); // add new nirs 16_04_2024
  protected
    FGetDataFromReestr: boolean;
    FReestrMinDate: TDate; //минимальная дата из реестра

    FReestrWD: TDateTime;
    FReestrED: TDateTime;

    FCurrentBaseOborotFromDate: TDateTime;
    FCurrentBaseOborotTillDate: TDateTime;

    FReestrOborotFromDate: TDateTime;
    FReestrOborotTillDate: TDateTime;


    procedure RunSummaryQuery;
    procedure FillSummaryParams(aq: TMegaQuery);

    procedure RunSummaryQueryWithReestr;
    procedure RunSummaryQueryWithReestrPart
        (aDataBase: TMegaBase; aTransaction: TMegaTransactionParent;
         aDateFrom, aDateTill, aEndDate: TDateTime); //получение части остатков
                                                     //по заданной база (реестр или основная база)
                                                     //добавляет полученную сумму к начальному остатку
                                                     //(поле FBEGIN_REST)

    procedure MakeAndFillMainDataSet;
    procedure MakeMainDataSet;
    procedure SetActiveMegaSelContract;
    procedure Recalc_OSTATOK;
  public
    { Public declarations }
    CalcAfterShow: Boolean;
    KodDK: Double;
    KontrKodDK: Double;
    KodMater: Double;
    SubSchet: String;
    FSubCFO: Integer;
    SpeedOper: Double;
    SelBase: integer;
    slDK: TStringList;
    aComplRECID, aComplBASEID: Double;
    analitik_brand:integer;
    analitik_ContractID:integer;
    //summary fields
    FBEGIN_REST    : Double;
    FDEBET         : Double;
    FDEBET_KOLICH  : Double;
    FKREDIT        : Double;
    FKREDIT_KOLICH : Double;
    FEND_REST      : Double;
    FPROSR_SUM     : Double;
    FBEGIN_KOLICH  : Double;
    FEND_KOLICH    : Double;

    procedure GetBaseID;
    procedure GetCalcDolg(type_:integer{0- обычный долг по галочке; 1- долг по валютному контролю});

    procedure SelBaseExecute(BaseId:Integer);
    function GetDKStr(const FldName:string; dd:Double):string;
    constructor Create(Owner: TComponent);overload; override;
    constructor Create(
      Owner: TComponent;
      FBalance: Integer; FSchet, FSubSchet: String;
      InBalanceValyuta: Boolean;
      Kod_DK, Kod_Mater: Double;
      NameDK, NameMater: String;
      KontrKod_DK: Double; ABeginSumma: Double;
      aCFO: integer;
      aSubCFO: integer;
      DKsub:boolean=false); overload;

      procedure InitControls;

      procedure PrintActSver2Init(aDM:TDataModule;aExport:Integer=0; aByDoc: boolean = false);
      procedure PrintActSver3Init(aDM:TDataModule;aExport:Integer=0; aByDoc: boolean = false);
end;

var
  ViewOperListForm2: TViewOperListForm2;

implementation

uses ViewDocProv, SelectOper, ufmReturnsMake, ufmLinkedDocs, uConst, ReestrData,
     Main, uMegaIntf, GroupSum, udmPrintActSver, uDlgEnterPeriod, udmMegaReports,
     //uPrintKassaU,
     uSelAccount,ViewSysProtokol,
     ufmBookSaleCheckDetail, StrUtils, ViewMainBook;

{ ----------------- Rem by Lion in 12.08.2008 ---------------- }
{ Уже не нужно }
//const
//  iNonExistentFieldCount = 17; //количество полей в клиент-датасете, которых не существует в фиб-датасете.
{ ----------- End of reming by Lion in 12.08.2008 ----------- }

type
  TDocIDItem=class
    BaseID: integer;
    RecID: integer;
    FormType: integer;
//    FormType: string;
  end;

{$R *.DFM}

constructor TViewOperListForm2.Create(Owner: TComponent);
begin
  inherited Create(Owner);

//  CreateAndInitcdsData; // add new nirs 16_04_2024
  slDK:= TStringList.Create;
  SpeedOper := -1;

  pnHeader.Visible := True;
  Panel2.Visible := False;

  FSubCFO:= -1;

  InitControls;
end;

constructor TViewOperListForm2.Create(Owner: TComponent;
  FBalance: Integer; FSchet, FSubSchet: String;
  InBalanceValyuta: Boolean; Kod_DK, Kod_Mater: Double;
  NameDK, NameMater: String; KontrKod_DK: Double; ABeginSumma: Double;
  aCFO: integer; aSubCFO: integer;DKsub:boolean=false);
var
  st,st1:string;
begin
  inherited Create(Owner);

//  CreateAndInitcdsData; // add new nirs 16_04_2024
  slDK:= TStringList.Create;
  st1:=trim(FSchet);
  st:=Copy2SymbDel(st1,'*');
  CheckBox3.Checked := (st1<>'') or DKsub;
  SpeedOper := ABeginSumma;
  pnHeader.Visible := false;
  Panel2.Visible := true;

  InitControls;

  MegaSelBalance.Value:= IntToStr(FBalance);
  MegaSelSchet.Value := Copy2SymbDel(st,'+');
  MegaSelCFO.Value:= intToStr(aCFO);


  if st<>'' then begin
    System.Delete(st,1,1);
    Edit1.Text:=st;
  end;

  chbInBalanceValyut.Checked := InBalanceValyuta;
  SubSchet := FSubSchet;
  FSubCFO:= aSubCFO;

  StaticText1.Caption := MegaSelBalance.BalanceName;
  StaticText2.Caption := MegaSelSchet.SchetName;

  if FSubSchet <> '' then
  begin
    DM.SharedQuery.Close;
    DM.SharedQuery.SQL.Text := 'SELECT SCHET_NAME FROM SPRAV_SCHET WHERE BALANCE_KOD='+IntToStr(FBalance)+' AND SCHET_KOD='''+SubSchet+'''';
    DM.SharedQuery.ExecQuery;
    StaticText3.Caption := SubSchet+', '+DM.SharedQuery.Fields[0].AsString;
  end;

  if Kod_DK <> 0 then DK_FROM_CE.Text := NameDK;     //значение DK_FROM_CE.Text используется в отчёте "Акт сверки"
  DK_FROM_CE.Enabled := False;

  KodDK := Kod_DK;
  if KodDK <> 0 then
  begin
    stDK.Caption:= FloatToStr(KodDK)+', '+NameDK;
  end;
  pnStaticKODDK.Visible:= KodDK <> 0;

  if Kod_Mater <> 0 then StaticText5.Caption := FloatToStr(Kod_Mater)+' | '+NameMater;

  KontrKodDK := KontrKod_DK;

  KodMater := Kod_Mater;
  CalcAfterShow := true;


end;

// BEGIN add new nirs 16_04_2024
procedure TViewOperListForm2.CreateAndInitcdsData; // add new nirs 16_04_2024
begin
//  cdsData := TClientDataSet.Create(Self);
  cdsData := TClientDataSet.Create(nil);
  cdsData.BeforePost := cdsDataBeforePost_F;
 // cdsData.FieldDefs.
//  cdsData.OnCalcFields := Self.cdsData111CalcFields;
end;

procedure TViewOperListForm2.cdsDataBeforePost_F(DataSet: TDataSet);
begin
//  cdsData111BeforePost(DataSet);
end;
// END add new nirs 16_04_2024


procedure TViewOperListForm2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  slDK.Free;
//  cdsData.Free; // add new nirs 16_04_2024

  // [gsa] 24-04-2019 Нажимает Esc – Операции по счету закрываются, но первоначальная форма Анализ счета свернута.
  if (ViewMainBookForm<>nil) then
    begin
     if ViewMainBookForm.WindowState = wsMinimized then
      begin
         ViewMainBookForm.WindowState:= wsNormal;
         ViewMainBookForm.DBGridEH1.SetFocus;
      end;
    end;
end;

procedure TViewOperListForm2.FIBDataSetCurrentBaseAfterOpen(DataSet: TDataSet);
begin
//  RunSummaryQuery;

  DBGridEH1.FieldColumns['KOLICH_DEBET'].Visible := (MegaSelSchet.ResultDataSet.FieldByName('SCHET_AMATER').AsInteger = 1);
  DBGridEH1.FieldColumns['KOLICH_KREDIT'].Visible := (MegaSelSchet.ResultDataSet.FieldByName('SCHET_AMATER').AsInteger = 1);
end;

procedure TViewOperListForm2.Recalc(var Message: TMessage);
begin
  CalculateExecute(nil);
  SendMessage(TWinControl(Owner).Handle , 39998, 0, 0);
end;

procedure TViewOperListForm2.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TViewOperListForm2.btnCheckPDV_UAClick(Sender: TObject);
begin
    pmChechPDV.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y);
end;

procedure TViewOperListForm2.btnHightLightSandoraClick(Sender: TObject);
begin //Выделять накладные, прошедшие через ТА «Сандора»
  DBGridEh1.FieldColumns['IS_HORECA_NAME'].Visible:= btnHightLightSandora.checked;
end;

procedure TViewOperListForm2.FormCreate(Sender: TObject);
begin
  Panel6.Visible := SubSchet <> '';
  pnMater.Visible := KodMater <> 0;

  MegaSelContract.ShowEmptyValue:=true;

  SetActiveMegaSelContract;

  cxBtnSeparatorMO.visible:= (IntfMegaAccessManager.GetUserRole = 'BUHGALTER_DEBITOR') or (IntfMegaAccessManager.GetUserRole = 'DEVELOPER');
  PanelDK.Visible := (MegaSelSchet.ResultDataSet.FieldByName('SCHET_ADK').AsInteger = 1) or (KodDK <> 0);
  actReturnsMakeShowForm.Visible := (IntfMegaDBCommon.GetCountry=iccUkraine) or (IntfMegaDBCommon.GetCountry=kodUKR)or(IntfMegaDBCommon.GetCountry=iccRussia) or (IntfMegaDBCommon.GetCountry=kodRUS);
  CalcHeaderPanelHeight;
  //chkProsrDolg.visible := IntfMegaDBCommon.isOffice;
  //DBGridEh1.FieldColumns['OTSR'].Visible := IntfMegaDBCommon.isOffice;
  //DBGridEh1.FieldColumns['PROSR_SUM'].Visible := IntfMegaDBCommon.isOffice;

   N42.visible := IntfMegaDBCommon.isOffice;
   btnCheckPDV_UA.Visible:=IsUkraine or IsRussia;


end;

procedure TViewOperListForm2.DocumentExecute(Sender: TObject);
begin
  OpenDocument(self,cdsData.FieldByName('DOCTYPE').AsString, cdsData.FieldByName('DOCRECNO').AsInteger, cdsData.FieldByName('BASEID').AsInteger, cdsData.FieldByName('OPERDATE').AsDateTime);
end;

procedure TViewOperListForm2.DocumentUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (dsMain.DataSet.Active and (ActiveControl.Tag = 100));
end;

procedure TViewOperListForm2.PrintExecute(Sender: TObject);
begin
  case (IntfMegaDBCommon.GetCountry) of
    iccUkraine,kodukr: pmPrint.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y);
    iccRussia,kodrus: pmPrintRu.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y);
    iccUSA: pmPrintRu.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y);
  end;
end;

procedure TViewOperListForm2.CalculateUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := true;
end;

procedure TViewOperListForm2.CalcValyutInfo;
begin
  DM.SharedQuery.Close;

  if chbInBalanceValyut.Checked then
  begin // валюта определяется по балансу
    DM.SharedQuery.SQL.Text :=
      'SELECT sv.VALYUTA_SNAME VALYUTA_NAME                           '#13#10+
      'FROM SPRAV_BALANCE sb                                           '#13#10+
      'LEFT JOIN SPRAV_VALYUT sv ON sv.VALYUTA_KOD = sb.BALANCE_VALYUTA'#13#10+
      'WHERE sb.BALANCE_KOD = :BALANCE_KOD                             ';
    DM.SharedQuery.ParamByName('BALANCE_KOD').AsString :=  MegaSelBalance.Value;
  end
  else
  begin // валюта определяется по счету
    DM.SharedQuery.SQL.Text :=
      'SELECT sv.VALYUTA_SNAME VALYUTA_NAME                         '#13#10+
      'FROM SPRAV_SCHET ss                                           '#13#10+
      'LEFT JOIN SPRAV_VALYUT sv ON sv.VALYUTA_KOD = ss.SCHET_VALYUTA'#13#10+
      'WHERE ss.BALANCE_KOD = :BALANCE_KOD AND ss.SCHET_KOD = :SCHET_KOD ';
    DM.SharedQuery.ParamByName('BALANCE_KOD').AsString := MegaSelBalance.Value;
    DM.SharedQuery.ParamByName('SCHET_KOD').AsString := MegaSelSchet.Value;
  end;

  DM.SharedQuery.ExecQuery;
  FValyutInfo := ', '+DM.SharedQuery.FieldByName('VALYUTA_NAME').AsString;
  DM.SharedQuery.Close;
end;

procedure TViewOperListForm2.CalculateExecute(Sender: TObject);
const
  sQueryHead =
    ' SELECT '#13#10+
    ' OPERDATE, '#13#10+
    ' A.DOCTYPE, '#13#10+
    ' DOCNUM, '#13#10+
    ' __KOR_SCHET__ KOR_SCHET, '#13#10+
    ' SUM( __DEBETSUMMA__ ) DEBET_SUMMA, '#13#10+
    ' SUM( __KREDITSUMMA__ ) KREDIT_SUMMA, '#13#10+
    ' FORMTYPE, '#13#10+
    ' DOCRECNO, '#13#10+
    ' a.BASEID BASEID, '#13#10+
    ' SUM(__KOLICH_DEBET__) KOLICH_DEBET, '#13#10+
    ' SUM(__KOLICH_KREDIT__) KOLICH_KREDIT, '#13#10+
    ' '' '' DK_NAME,       '#13#10+
    ' a.__KOD_DK__ KOD_DK, '#13#10+
    ' 0 as ChildCount,     '#13#10+
    ' 0 as ParentCount,    '#13#10+
    ' __CFO__  CFO ,       '#13#10+
    ' __KOR_CFO__ KOR_CFO, '#13#10+
    ' __otsr__ '#13#10+
//    ' (select __otsr__ from doc_nakl dn where dn.recid=a.docrecno and dn.baseid=a.baseid and a.formtype=1) otsr, '#13#10+
    ' (SELECT MODE FROM C8_LINKS_GET_MODE(A.DOCRECNO, A.BASEID) WHERE A.FORMTYPE = 4) MODE_1C, '#13#10+
    ' __IS_HORECA_NAME__ IS_HORECA_NAME, '#13#10+
    ' __DOCDATE__ docdate '#13#10+
   // ' ,0 DAYVALCONTROL '#13#10+
    ' ,iif(FORMTYPE =55,cast((operdate+_CONST_DAY_)-cast(''today'' as date) as integer),NULL) DAYVALCONTROL '#13#10+
   // ' (select docdate from     GET_DOC_PROPERTIES(a.formtype,a.docrecno,a.baseid)) docdate '#13#10+
    ' FROM sprav_schet ss '#13#10+
    ' left join OPER_JORNAL A on (a.__GROUP_SCHET__=ss.schet_kod and a.balance_kod=ss.balance_kod) '#13#10+
    ' '+
    '';
   //В ЭТОМ ЗАПРОСЕ НАДО ИСПРАВЛЯТЬ ТОЛЬКО ТОГДА КОГДА УВЕРЕНЫ ЧТО В РЕЕСТР ЕСТЬ ТАКИЕ ЖЕ ПОЛЯ. НЕЗЫБЫВАЕМ ПРО РЕЕСТР


  sJoinWithKladov    = '';
  sJoinWithoutKladov = '';

   sMainWherePart =
    ' where ss.BALANCE_KOD = __BALANCE_KOD__ '+
    ' AND __DEBETORKREDIT__ STARTING ''__DEBETORKREDITVALUE__'' '#13#10;
//  sMainWherePart =
 //   ' where A.BALANCE_KOD = __BALANCE_KOD__ AND __DEBETORKREDIT__ = "__DEBETORKREDITVALUE__" '#13#10;

  sFilterByCFO =
    ' and __DEBETORKREDITCFO__ = __CFOVALUE__ '#13#10;

  sFilterBySubSchet =
    ' AND __SUBSCHET_DEBETORKREDIT__||'''' STARTING ''__SUBSCHET__'' '#13#10;
 // sFilterBySubSchet =
 //   ' AND __SUBSCHET_DEBETORKREDIT__ = "__SUBSCHET__" '#13#10;

  sFilterBySubCFO =
    ' AND __SUBCFO_DEBETORKREDIT__ =__SUBCFO__ '#13#10;

  sFilterByKodMater =
    ' AND __MATER_DEBETORKREDIT__ = __KOD_MATER__ '#13#10;

  sFilterByFromOperDate =
    ' AND OPERDATE >= ''__FROMOPERDATE__'' '#13#10;
  sFilterByTillOperDate =
    ' AND OPERDATE <= ''__TILLOPERDATE__'' '#13#10;

  sFilterByBrandCase =
    ' AND _DEBET_KREDIT_ANALITIK_ = _DEBETKREDITANALITIK_VALUE_ '#13#10;


  sFilterByKladov =
//    ' AND (select gms.kladov from sprav_mater sm '#13#10+
//    ' left join group_mater gm on (gm.group_mater=sm.group_mater) '#13#10+
//    ' left join PROC_GET_KLADOV_NUM(gm.group_mater, a.CFO_KREDIT) gms on 1=1 '#13#10 +
//    ' where sm.kod_mater=A.__MATER_DEBETORKREDIT__)= __KLADOV__'#13#10;
    ' AND (select gms.kladov from sprav_mater sm '#13#10+
    ' left join doc_nakl dn on dn.recid = a.docrecno and dn.baseid = a.baseid and a.formtype = 1 '#13#10+
    ' left join PROC_GET_KLADOV_NUM(sm.group_mater, dn.CFO) gms on 1=1 '#13#10+
    ' where sm.kod_mater=A.__MATER_DEBETORKREDIT__)= __KLADOV__ '#13#10;


  sGroupByPart =
    ' GROUP BY '#13#10+
    '   OPERDATE, '#13#10+
    '   A.DOCTYPE, '#13#10+
    '   DOCNUM, '#13#10+
    '   __DEBETORKREDIT__, '#13#10+
    '   FORMTYPE, '#13#10+
    '   DOCRECNO, '#13#10+
    '   a.BASEID, '#13#10+
    '   a.__KOD_DK__, '#13#10+
    '   a.CFO_DEBET, '#13#10+
    '   a.CFO_KREDIT '#13#10+
    '';

  sUnionAll = ' union all '#13#10;

  sIsHorekaNameSubSelect =
'(SELECT sat.TYPE_NAME  FROM doc_nakl dn                                                              '#13#10+
'   LEFT JOIN DELIVERY_LOCATION DL ON DL.DOCRECNO=DN.RECID AND DL.BASEID=DN.BASEID AND DL.FORMTYPE=1  '#13#10+
'   LEFT JOIN SPRAV_TRADE_OUTLET STO ON STO.RECID=DL.OUTLET_RECID AND STO.BASEID=DL.OUTLET_BASEID     '#13#10+
'   LEFT JOIN SPRAV_AREA sa on sa.AREA_ID = sto.ACTIVE_AREA_ID and sa.BASEID = sto.ACTIVE_AREA_BASE_ID'#13#10+
'   LEFT JOIN SPRAV_AREA_TYPE sat on sat.TYPE_RECID = sa.IS_HORECA                                    '#13#10+
' WHERE dn.RECID=a.DOCRECNO and dn.BASEID=a.BASEID and a.FORMTYPE=1 )                                 '#13#10;

//--
  function GetJoinByDK(aKLADOV_DKTemplate: string; aOperJornalDKTemplate: string ): string;
  var
    lStr: string;
  begin
    if Panel7.Visible and (edKladov.Text<>'') then
    begin
      lStr:= sJoinWithKladov;
      lStr:= ReplaceRegExpr('__KLADOV_DK__', lStr, aKLADOV_DKTemplate);
    end
    else begin
      lStr:= sJoinWithoutKladov;
      lStr:= ReplaceRegExpr('__OPER_JORNAL_KLADOV__', lStr, aOperJornalDKTemplate);
    end;
    Result:= lStr;
  end;

  function GetMainWherePart(aBalanceValue: string; aDebetOrKredit: string; aScetValue:string): string;
  var
    lStr: string;
  begin
    lStr:= sMainWherePart;
    lStr:= ReplaceRegExpr('__BALANCE_KOD__', lStr, aBalanceValue);
    lStr:= ReplaceRegExpr('__DEBETORKREDIT__', lStr, aDebetOrKredit);
    lStr:= ReplaceRegExpr('__DEBETORKREDITVALUE__', lStr, aScetValue);

    Result:= lStr;
  end;

  function GetCFOFilter(aDEBETORKREDITCFO : string): string;
  var
    lStr: string;
  begin
    if MegaSelCFO.Value <> '' then
    begin
      lStr:= sFilterByCFO;
      lStr:= ReplaceRegExpr('__DEBETORKREDITCFO__', lStr, aDEBETORKREDITCFO);
      lStr:= ReplaceRegExpr('__CFOVALUE__', lStr, MegaSelCFO.Value);
    end
    else begin
      lStr:= '';
    end;
    Result:= lStr;
  end;

  function GetSubSchetFilter(aDebetOrKredit: string): string;
  var
    lStr: string;
  begin
    if SubSchet <>  '' then
    begin
      lStr:= sFilterBySubSchet;
      lStr:= ReplaceRegExpr('__SUBSCHET_DEBETORKREDIT__', lStr, aDebetOrKredit);
      lStr:= ReplaceRegExpr('__SUBSCHET__', lStr, SubSchet);
    end
    else begin
      lStr:= '';
    end;
    Result:= lStr;
  end;

  function GetSubCFOFilter(aDebetOrKredit: string): string;
  var
    lStr: string;
  begin
    if FSubCFO <>  -1 then
    begin
      lStr:= sFilterBySubCFO;
      lStr:= ReplaceRegExpr('__SUBCFO_DEBETORKREDIT__', lStr, aDebetOrKredit);
      lStr:= ReplaceRegExpr('__SUBCFO__', lStr, IntToStr(FSubCFO));
    end
    else begin
      lStr:= '';
    end;
    Result:= lStr;
  end;

  function GetDKFilter(aDebetOrKredit: string): string;
  var
    lStr: string;
  begin
    if KodDK <> 0 then
    begin
       lStr:= ' AND '+ GetDKStr(aDebetOrKredit,KodDK)+' ';
    end
    else begin
      lStr:= '';
    end;
    Result:= lStr;
  end;


  function GetKontrDKFilter(aDebetOrKredit: string): string;
  var
    lStr: string;
  begin
    if KontrKodDK <> 0 then
    begin
       lStr:= ' AND '+GetDKStr(aDebetOrKredit, KontrKodDK)+' ';
    end
    else begin
      lStr:= '';
    end;
    Result:= lStr;
  end;

  function GetMaterFilter(aMaterDebetOrKredit: string): string;
  var
    lStr: string;
  begin
    if KodMater <> 0 then
    begin
      lStr:= ' AND '+aMaterDebetOrKredit+' =  '+FloatToStr(KodMater)+' ';
    end
    else begin
      lStr:= '';
    end;
    Result:= lStr;
  end;

  function GetPeriodFilter: string;
  var
    lStr: string;
  begin
    lStr:= '';
    if MegaPeriodPanel.FromDate <> 0 then
      lStr:= lStr + ' AND OPERDATE >= :FROMDATE '#13#10;
    if MegaPeriodPanel.TillDate <> 0 then
      lStr:= lStr + ' AND OPERDATE <= :TILLDATE '#13#10;
    Result:= lStr;
  end;

  function getKladovFilter(aMaterDebetOrKredit: string): string;
  var
    lStr: string;
  begin
    if (Panel7.Visible) and  (Trim(edKladov.Text)<>'') then
    begin
      lStr:= sFilterByKladov;
      lStr:= ReplaceRegExpr('__MATER_DEBETORKREDIT__', lStr, aMaterDebetOrKredit);
      lStr:= ReplaceRegExpr('__KLADOV__', lStr, Trim(edKladov.Text));
    end
    else begin
      lStr:= '';
    end;
    Result:= lStr;
  end;

  function GetGroupByPart(aDebetOrKredit, aDK_DEBETORKREDIT: string): string;
  var
    lStr: string;
  begin
    lStr:= sGroupByPart;
    lStr:= ReplaceRegExpr('__DEBETORKREDIT__', lStr, aDEBETORKREDIT);
    lStr:= ReplaceRegExpr('__KOD_DK__', lStr, aDK_DEBETORKREDIT);

    Result:= lStr;
  end;

 function GetBrandCase(aBrandCaseDebetOrKredit,aBrandCaseValue,aBrandCaseId: string): string;
  var
    lStr: string;
  begin
    //if MegaSelBrandCase1.value<>'' then
    if aBrandCaseValue<>'' then
    begin
      lstr:= sFilterByBrandCase;
      lStr:= ReplaceRegExpr('_DEBET_KREDIT_ANALITIK_', lStr, aBrandCaseDebetOrKredit+aBrandCaseId);
      if aBrandCaseValue='-999' then  // по договорам есть необходимость поиска по документам у которых не проставлен договор
        lStr:= ReplaceRegExpr('= _DEBETKREDITANALITIK_VALUE_', lStr, ' IS NULL')
      else
        lStr:= ReplaceRegExpr('_DEBETKREDITANALITIK_VALUE_', lStr, aBrandCaseValue);
    end
    else
       lstr:='';
    Result:= lStr;
  end;

var
  iCurScreenState: Integer;
  tempSchet:string;
  lQueryText: string;
  lTempStr: string;
  checkSubDk_F2:TMegaQuery;
  sumFP:double;
  f_debugmode: Boolean; // nirs for debug
  strlist :TStringList; // nirs for debug
  i: Integer; // nirs for debug
begin
  //****************************************************************************
  // Шестаков Г.С.
  //Проверка на саба Ф2
  //Если саб Ф2, то расчет запускать нельзя
  //Если основной с сабами Ф2, расчет вести с галочкой "+сабы"
  //Если офисная база или access =0 , то только предупреждаем
  fF2MAin:=false;
  if MegaSelBalance.Value='77' then
  begin
      Transaction.Active:=true;
      checkSubDk_F2:=TMegaQuery.Create(self);
      checkSubDk_F2.Database:=DM.Money;
      checkSubDk_F2.Transaction:=Transaction;
      //Проверка , не саб ли это Ф2
      checkSubDk_F2.SQL.Text:='select parent, forma from sprav_dk where kod_dk='+FloatToStr(MegaSelDKDialog.KodDK);
      try
        checkSubDk_F2.ExecQuery;
        if (not checkSubDk_F2.FieldByName('parent').IsNull) and
           (checkSubDk_F2.FieldByName('forma').AsInteger=2) then
        begin
           if  (IntfMegaDBCommon.IsOffice) then
           begin
                    Application.MessageBox(ExceptSubDk2,'Внимание',MB_OK+MB_ICONINFORMATION);
           end
           else
           if (IntfMegaAccessManager.GetUserAccess<>iuaSystem) then
                    raise Exception.Create(ExceptSubDk2)
           else
                    Application.MessageBox(ExceptSubDk2,'Внимание',MB_OK+MB_ICONINFORMATION);
        end
        else
        begin
           checkSubDk_F2.CLose;
           checkSubDk_F2.SQL.Text:='select count(*) from sprav_dk where forma=2 and  parent='+FloatToStr(MegaSelDKDialog.KodDK);
           checkSubDk_F2.ExecQuery;
           if checkSubDk_F2.Fields[0].AsInteger>0 then
           begin
              if  (IntfMegaDBCommon.IsOffice) then
              begin
                    if not CheckBox3.Checked then
                       Application.MessageBox(Exept_MainDk_With_SubDkF2 ,'Внимание',MB_OK+MB_ICONINFORMATION);
              end
              else begin
                fF2MAin:=true;
                if (IntfMegaAccessManager.GetUserAccess<>iuaSystem) then
                 //Ставим галочку + сабдебиторы
                 CheckBox3.Checked:=true
                else
                  if not CheckBox3.Checked then
                     Application.MessageBox(Exept_MainDk_With_SubDkF2,'Внимание',MB_OK+MB_ICONINFORMATION);
              end;
           end;
        end;
      finally
        checkSubDk_F2.CLose;
        checkSubDk_F2.Free;
      end;
      Transaction.Active:=False;
  end;
  //****************************************************************************

  FGetDataFromReestr:= DMR.NeedGetDataFromReestr(StrToIntDef(MegaSelBalance.Value, -1), MegaSelSchet.Value);

  if FGetDataFromReestr then
  begin
    FReestrWD:= DMR.GetWorkDate(StrToIntDef(MegaSelBalance.Value, -1), MegaSelSchet.Value);
    FReestrED:= DMR.GetEndDate(StrToIntDef(MegaSelBalance.Value, -1), MegaSelSchet.Value);

    if (MegaPeriodPanel.FromDate < FReestrWD) then
    begin
      FReestrMinDate := FReestrWD;
    end
    else begin
      FReestrMinDate := MegaPeriodPanel.FromDate;
    end;

    //проверка дат
    if  (MegaPeriodPanel.FromDate <= FReestrED)and(MegaPeriodPanel.TillDate <= FReestrED) then
    begin
      //начальная и конечная даты попадают в реестр
      FReestrOborotFromDate:= FReestrMinDate;
      FReestrOborotTillDate:= MegaPeriodPanel.TillDate;

      FCurrentBaseOborotFromDate:= 0;
      FCurrentBaseOborotTillDate:= 0;
    end;

    if  (MegaPeriodPanel.FromDate <= FReestrED)and(MegaPeriodPanel.TillDate > FReestrED) then
    begin
      //в реестр попадает только начальная дата периода
      FReestrOborotFromDate:= FReestrMinDate;
      FReestrOborotTillDate:= FReestrED;

      FCurrentBaseOborotFromDate:= FReestrED+1;
      FCurrentBaseOborotTillDate:= MegaPeriodPanel.TillDate;
    end;

    if  (MegaPeriodPanel.FromDate > FReestrED)
    and (MegaPeriodPanel.TillDate > FReestrED) then
    begin
      //период не попадает в реестр т.е. больше реестра
      FReestrOborotFromDate:= 0;
      FReestrOborotTillDate:= 0;

      FCurrentBaseOborotFromDate:= FReestrMinDate;
      FCurrentBaseOborotTillDate:= MegaPeriodPanel.TillDate;
    end;
  end
  else
  begin
    FReestrOborotFromDate:= 0;
    FReestrOborotTillDate:= 0;

    FCurrentBaseOborotFromDate:= MegaPeriodPanel.FromDate;
    FCurrentBaseOborotTillDate:= MegaPeriodPanel.TillDate;
  end;

  iCurScreenState := Screen.Cursor;
  Screen.Cursor := crSQLWAIT;
  try
    lQueryText:= '';

    SelBase:= 0;

//--

    lTempStr:= sQueryHead;

    lTempStr:= ReplaceRegExpr('__KOR_SCHET__', lTempStr, 'KREDIT');
    lTempStr:= ReplaceRegExpr('__GROUP_SCHET__', lTempStr, 'DEBET');
    if IntfMegaDBCommon.isOffice then
       lTempStr:= ReplaceRegExpr('__DOCDATE__', lTempStr, '(select docdate from GET_DOC_PROPERTIES(a.formtype,a.docrecno,a.baseid))')
    else
       lTempStr:= ReplaceRegExpr('__DOCDATE__', lTempStr, 'OPERDATE');
    if chbInBalanceValyut.Checked
    then lTempStr:= ReplaceRegExpr('__DEBETSUMMA__', lTempStr ,'SUMMA')
    else lTempStr:= ReplaceRegExpr('__DEBETSUMMA__', lTempStr ,'SUMMA_D');
    lTempStr:= ReplaceRegExpr('__KREDITSUMMA__', lTempStr ,'0.0');

    if FGetDataFromReestr
      then lTempStr:= ReplaceRegExpr('__KOLICH_DEBET__', lTempStr ,'0.0')
      else lTempStr:= ReplaceRegExpr('__KOLICH_DEBET__', lTempStr ,'KOLICH_DEBET');

    lTempStr:= ReplaceRegExpr('__KOLICH_KREDIT__', lTempStr ,'0.0');
    lTempStr:= ReplaceRegExpr('__CFO__', lTempStr, 'a.CFO_DEBET');
    lTempStr:= ReplaceRegExpr('__KOR_CFO__', lTempStr, 'a.CFO_KREDIT');
    if chkDebetKredit.checked then
       lTempStr:= ReplaceRegExpr('__KOD_DK__', lTempStr, 'DK_DEBET')
    else
       lTempStr:= ReplaceRegExpr('__KOD_DK__', lTempStr, 'DK_KREDIT');
    lTempStr:= ReplaceRegExpr('_CONST_DAY_', lTempStr, IntfMegaDBCommon.GetParam('DAY_VAL_CONTROL', '90'));
    if btnHightLightSandora.checked then
      lTempStr:= ReplaceRegExpr('__IS_HORECA_NAME__', lTempStr, sIsHorekaNameSubSelect)
     else
      lTempStr:= ReplaceRegExpr('__IS_HORECA_NAME__', lTempStr, ' ''-'' ');

    lQueryText:= lQueryText + lTempStr;

//    lQueryText:= lQueryText + GetMainWherePart(MegaSelBalance.Value, 'DEBET', MegaSelSchet.Value);
    lQueryText:= lQueryText + GetMainWherePart(MegaSelBalance.Value, 'SS.SCHET_KOD', MegaSelSchet.Value);
    lQueryText:= lQueryText + GetCFOFilter('CFO_DEBET');

    lQueryText:= lQueryText + GetSubSchetFilter('KREDIT');
    //lQueryText:= lQueryText + GetSubSchetFilter('SS.SCHET_KOD');
    lQueryText:= lQueryText + GetSubCFOFilter('CFO_KREDIT');


    lQueryText:= lQueryText + GetDKFilter('DK_DEBET');

    lQueryText:= lQueryText + GetMaterFilter('MATER_DEBET');
    lQueryText:= lQueryText + GetPeriodFilter;
    lQueryText:= lQueryText + GetKladovFilter('MATER_DEBET');
    lQueryText:= lQueryText + GetBrandCase('DEBET_A', MegaSelBrandCase1.Value, inttostr(analitik_brand));
    if MegaSelContract.Value<>'' then
    lQueryText:= lQueryText + GetBrandCase('DEBET_A', MegaSelContract.Value, inttostr(analitik_ContractID));
    if chkDebetKredit.checked then   //необходиом было при расчете расчетов где много сабов. не было видно дебитора кому отгружалось. по просьбе Панченко О. (20.06.2014 Дереза Д.)
       lQueryText:= lQueryText + GetGroupByPart('KREDIT', 'DK_DEBET')
    else
       lQueryText:= lQueryText + GetGroupByPart('KREDIT', 'DK_KREDIT');


    lQueryText:= lQueryText + sUnionAll;
//--

    lTempStr:= sQueryHead;
    lTempStr:= ReplaceRegExpr('__KOR_SCHET__', lTempStr, 'DEBET');
    lTempStr:= ReplaceRegExpr('__GROUP_SCHET__', lTempStr, 'KREDIT');
    lTempStr:= ReplaceRegExpr('__DEBETSUMMA__', lTempStr ,'0.0');
    if IntfMegaDBCommon.isOffice then
       lTempStr:= ReplaceRegExpr('__DOCDATE__', lTempStr, '(select docdate from GET_DOC_PROPERTIES(a.formtype,a.docrecno,a.baseid))')
    else
       lTempStr:= ReplaceRegExpr('__DOCDATE__', lTempStr, 'OPERDATE');

    if chbInBalanceValyut.Checked
    then lTempStr:= ReplaceRegExpr('__KREDITSUMMA__', lTempStr ,'SUMMA')
    else lTempStr:= ReplaceRegExpr('__KREDITSUMMA__', lTempStr ,'SUMMA_K');
    lTempStr:= ReplaceRegExpr('__KOLICH_DEBET__', lTempStr ,'0.0');

    if FGetDataFromReestr
      then lTempStr:= ReplaceRegExpr('__KOLICH_KREDIT__', lTempStr ,'0.0')
      else lTempStr:= ReplaceRegExpr('__KOLICH_KREDIT__', lTempStr ,'KOLICH_KREDIT');

    lTempStr:= ReplaceRegExpr('__CFO__', lTempStr, 'a.CFO_KREDIT');
    lTempStr:= ReplaceRegExpr('__KOR_CFO__', lTempStr, 'a.CFO_DEBET');
    if chkDebetKredit.checked then   //необходиом было при расчете расчетов где много сабов. не было видно дебитора кому отгружалось. по просьбе Панченко О. (20.06.2014 Дереза Д.)
      lTempStr:= ReplaceRegExpr('__KOD_DK__', lTempStr, 'DK_KREDIT')
    else
      lTempStr:= ReplaceRegExpr('__KOD_DK__', lTempStr, 'DK_DEBET');
    lTempStr:= ReplaceRegExpr('_CONST_DAY_', lTempStr, IntfMegaDBCommon.GetParam('DAY_VAL_CONTROL', '90'));
    if btnHightLightSandora.checked then
      lTempStr:= ReplaceRegExpr('__IS_HORECA_NAME__', lTempStr, sIsHorekaNameSubSelect)
     else
      lTempStr:= ReplaceRegExpr('__IS_HORECA_NAME__', lTempStr, ' ''-'' ');

    lQueryText:= lQueryText + lTempStr;
//    lQueryText:= lQueryText + GetMainWherePart(MegaSelBalance.Value, 'KREDIT', MegaSelSchet.Value);
    lQueryText:= lQueryText + GetMainWherePart(MegaSelBalance.Value, 'SS.SCHET_KOD', MegaSelSchet.Value);

    lQueryText:= lQueryText + GetCFOFilter('CFO_KREDIT');

    lQueryText:= lQueryText + GetSubSchetFilter('DEBET');
//    lQueryText:= lQueryText + GetSubSchetFilter('SS.SCHET_KOD');
    lQueryText:= lQueryText + GetSubCFOFilter('CFO_DEBET');

    lQueryText:= lQueryText + GetDKFilter('DK_KREDIT');

    lQueryText:= lQueryText + GetMaterFilter('MATER_KREDIT');
    lQueryText:= lQueryText + GetPeriodFilter;
    lQueryText:= lQueryText + GetKladovFilter('MATER_KREDIT');
    lQueryText:= lQueryText + GetBrandCase('KREDIT_A', MegaSelBrandCase1.Value, inttostr(analitik_brand));
    if MegaSelContract.Value<>'' then
    lQueryText:= lQueryText + GetBrandCase('KREDIT_A', MegaSelContract.Value, inttostr(analitik_ContractID));
    if chkDebetKredit.checked then   //необходиом было при расчете расчетов где много сабов. не было видно дебитора кому отгружалось. по просьбе Панченко О. (20.06.2014 Дереза Д.)
      lQueryText:= lQueryText + GetGroupByPart('DEBET', 'DK_KREDIT')
    else
      lQueryText:= lQueryText + GetGroupByPart('DEBET', 'DK_DEBET');

//--
    if Edit1.Text <> '' then
    begin
      lQueryText:= lQueryText + sUnionAll;

      lTempStr:= sQueryHead;
      lTempStr:= ReplaceRegExpr('__KOR_SCHET__', lTempStr, 'KREDIT');
      lTempStr:= ReplaceRegExpr('__GROUP_SCHET__', lTempStr, 'DEBET');
      if IntfMegaDBCommon.isOffice then
         lTempStr:= ReplaceRegExpr('__DOCDATE__', lTempStr, '(select docdate from GET_DOC_PROPERTIES(a.formtype,a.docrecno,a.baseid))')
      else
         lTempStr:= ReplaceRegExpr('__DOCDATE__', lTempStr, 'OPERDATE');

      if chbInBalanceValyut.Checked
      then lTempStr:= ReplaceRegExpr('__DEBETSUMMA__', lTempStr ,'SUMMA')
      else lTempStr:= ReplaceRegExpr('__DEBETSUMMA__', lTempStr ,'SUMMA_D');
      lTempStr:= ReplaceRegExpr('__KREDITSUMMA__', lTempStr ,'0.0');

      if FGetDataFromReestr
        then lTempStr:= ReplaceRegExpr('__KOLICH_DEBET__', lTempStr ,'0.0')
        else lTempStr:= ReplaceRegExpr('__KOLICH_DEBET__', lTempStr ,'KOLICH_DEBET');

      lTempStr:= ReplaceRegExpr('__KOLICH_KREDIT__', lTempStr ,'0.0');
      lTempStr:= ReplaceRegExpr('__CFO__', lTempStr, 'a.CFO_DEBET');
      lTempStr:= ReplaceRegExpr('__KOR_CFO__', lTempStr, 'a.CFO_KREDIT');
      lTempStr:= ReplaceRegExpr('__KOD_DK__', lTempStr, 'DK_KREDIT');
      lTempStr:= ReplaceRegExpr('_CONST_DAY_', lTempStr, IntfMegaDBCommon.GetParam('DAY_VAL_CONTROL', '90'));
      if btnHightLightSandora.checked then
        lTempStr:= ReplaceRegExpr('__IS_HORECA_NAME__', lTempStr, sIsHorekaNameSubSelect)
       else
        lTempStr:= ReplaceRegExpr('__IS_HORECA_NAME__', lTempStr, ' ''-'' ');

      lQueryText:= lQueryText + lTempStr;
      lQueryText:= lQueryText + GetMainWherePart(MegaSelBalance.Value, 'DEBET', Edit1.Text);
      lQueryText:= lQueryText + GetCFOFilter('CFO_DEBET');

      lQueryText:= lQueryText + GetSubSchetFilter('KREDIT');
      lQueryText:= lQueryText + GetSubCFOFilter('CFO_KREDIT');

      lQueryText:= lQueryText + GetDKFilter('DK_DEBET');

      lQueryText:= lQueryText + GetMaterFilter('MATER_DEBET');
      lQueryText:= lQueryText + GetPeriodFilter;
      lQueryText:= lQueryText + GetKladovFilter('MATER_DEBET');
      lQueryText:= lQueryText + getGroupByPart('KREDIT', 'DK_KREDIT');

      lQueryText:= lQueryText + sUnionAll;
//--
      lTempStr:= sQueryHead;
      lTempStr:= ReplaceRegExpr('__KOR_SCHET__', lTempStr, 'DEBET');
      lTempStr:= ReplaceRegExpr('__GROUP_SCHET__', lTempStr, 'KREDIT');
      lTempStr:= ReplaceRegExpr('__DEBETSUMMA__', lTempStr ,'0.0');
      if IntfMegaDBCommon.isOffice then
         lTempStr:= ReplaceRegExpr('__DOCDATE__', lTempStr, '(select docdate from GET_DOC_PROPERTIES(a.formtype,a.docrecno,a.baseid))')
      else
         lTempStr:= ReplaceRegExpr('__DOCDATE__', lTempStr, 'OPERDATE');

      if chbInBalanceValyut.Checked
      then lTempStr:= ReplaceRegExpr('__KREDITSUMMA__', lTempStr ,'SUMMA')
      else lTempStr:= ReplaceRegExpr('__KREDITSUMMA__', lTempStr ,'SUMMA_K');
      lTempStr:= ReplaceRegExpr('__KOLICH_DEBET__', lTempStr ,'0.0');

      if FGetDataFromReestr then
        lTempStr:= ReplaceRegExpr('__KOLICH_KREDIT__', lTempStr ,'0.0')
       else
        lTempStr:= ReplaceRegExpr('__KOLICH_KREDIT__', lTempStr ,'KOLICH_KREDIT');

      lTempStr:= ReplaceRegExpr('__CFO__', lTempStr, 'a.CFO_KREDIT');
      lTempStr:= ReplaceRegExpr('__KOR_CFO__', lTempStr, 'a.CFO_DEBET');
      lTempStr:= ReplaceRegExpr('__KOD_DK__', lTempStr, 'DK_DEBET');
      lTempStr:= ReplaceRegExpr('_CONST_DAY_', lTempStr, IntfMegaDBCommon.GetParam('DAY_VAL_CONTROL', '90'));      
      if btnHightLightSandora.checked then
        lTempStr:= ReplaceRegExpr('__IS_HORECA_NAME__', lTempStr, sIsHorekaNameSubSelect)
       else
        lTempStr:= ReplaceRegExpr('__IS_HORECA_NAME__', lTempStr, ' ''-'' ');

      lQueryText:= lQueryText + lTempStr;
     // lQueryText:= lQueryText + GetMainWherePart(MegaSelBalance.Value, 'KREDIT', Edit1.Text);
      lQueryText:= lQueryText + GetMainWherePart(MegaSelBalance.Value, 'SS.SCHET_KOD', Edit1.Text);
      lQueryText:= lQueryText + GetCFOFilter('CFO_KREDIT');

      lQueryText:= lQueryText + GetSubSchetFilter('DEBET');
      lQueryText:= lQueryText + GetSubCFOFilter('CFO_DEBET');

      lQueryText:= lQueryText + GetDKFilter('DK_KREDIT');

      lQueryText:= lQueryText + GetMaterFilter('MATER_KREDIT');
      lQueryText:= lQueryText + GetPeriodFilter;
      lQueryText:= lQueryText + GetKladovFilter('MATER_KREDIT');
      lQueryText:= lQueryText + GetGroupByPart('DEBET', 'DK_DEBET');

    end;
    tempSchet:=MegaSelSchet.Value;

    //lQueryText:= lQueryText + 'union all select  OPERDATE,DOCTYPE,DOCNUM,KOR_SCHET,DEBET_SUMMA,KREDIT_SUMMA,FORMTYPE,'#13#10+
    //        ' DOCRECNO,BASEID,KOLICH_DEBET,KOLICH_KREDIT," ",KOD_DK,CHILDCOUNT,PARENTCOUNT,'#13#10+
    //        ' CFO,KOR_CFO from get_operalldk_un (:balance,:schet,:FROMDATE,:TILLDATE,:kod_dk)'#13#10 ;
    lQueryText:= lQueryText + ' ORDER BY 1,2,3 ';

    dsMain.DataSet.Close;

    //для украины отображаем отсрочку из поля otsr для россии из realotsr
{    if IntfMegaDBCommon.GetCountry=iccUkraine then
       lTempStr:= ReplaceRegExpr('__otsr__', lTempStr, 'otsr')
    else
       lTempStr:= ReplaceRegExpr('__otsr__', lTempStr, 'real_otsr');}

{18/12/2017
if ((IntfMegaDBCommon.GetCountry=iccUkraine) or (IntfMegaDBCommon.GetCountry=iccUSA)) then
       lTempStr:= ReplaceRegExpr('__otsr__', lQueryText, '(select otsr from doc_nakl dn where dn.recid=a.docrecno and dn.baseid=a.baseid and a.formtype=1) otsr,')
    else
       lTempStr:= ReplaceRegExpr('__otsr__', lQueryText, '(select real_otsr from doc_nakl dn where dn.recid=a.docrecno and dn.baseid=a.baseid and a.formtype=1) otsr,');
  }
    lTempStr:= ReplaceRegExpr('__otsr__', lQueryText, '(select otsr from get_doc_otsr(a.docrecno, a.baseid, a.formtype)) otsr,');
    FIBDataSetCurrentBase.Close;
    FIBDataSetCurrentBase.SelectSQL.Text:= lTempStr;

//    FIBDataSetCurrentBase.SelectSQL.SaveToFile('C:\schet.sql');

    FIBDataSetCurrentBase.ParamByName('FROMDate').AsDateTime:= FCurrentBaseOborotFromDate;
    FIBDataSetCurrentBase.ParamByName('TillDate').AsDateTime:= FCurrentBaseOborotTillDate;
    //FIBDataSetCurrentBase.ParamByName('balance').Asstring:= MegaSelBalance.Value;
    //FIBDataSetCurrentBase.ParamByName('schet').Asstring:=  tempSchet;
    //FIBDataSetCurrentBase.ParamByName('kod_dk').AsDouble:=KodDK;
    FIBDataSetCurrentBase.Open;

    if FGetDataFromReestr then
    begin
      FIBDataSetReestr.Close;
       lQueryText:=ReplaceRegExpr('__otsr__', lQueryText,'');
      // в реестре нет doc_nakl :)
      if btnHightLightSandora.checked then
        lQueryText := ReplaceStr(lQueryText, sIsHorekaNameSubSelect, ' ( ''-'')');

      FIBDataSetReestr.SelectSQL.Text:= lQueryText;
      try
//        FIBDataSetReestr.SelectSQL.SaveToFile('operlistreestr.sql');
      except
      end;

      FIBDataSetReestr.ParamByName('FROMDate').AsDateTime:= FReestrOborotFromDate;
      FIBDataSetReestr.ParamByName('TillDate').AsDateTime:= FReestrOborotTillDate;
      //FIBDataSetReestr.ParamByName('balance').Asstring:= MegaSelBalance.Value;
      //FIBDataSetReestr.ParamByName('schet').Asstring:=  tempSchet;
      //FIBDataSetReestr.ParamByName('kod_dk').AsDouble:=KodDK;
      FIBDataSetReestr.Open;
    end;

    //собственно заполнение результирующего датасета
    MakeAndFillMainDataSet;


    if btnShowDebetNotEqualKredit.checked then
      ShowDebetNotEqualKredit;

    DBGridEh1.FieldColumns['OSTATOK'].Visible:= not( (Panel7.Visible) and  (Trim(edKladov.Text)<>''));
    DBGridEh1.FieldColumns['DEBET_MINUS_KREDIT'].Visible:= not( (Panel7.Visible) and  (Trim(edKladov.Text)<>''));

    //получение остатков
    if not FGetDataFromReestr then
    begin
      RunSummaryQuery;
    end
    else begin
      RunSummaryQueryWithReestr;
    end;

    if sbtAnaliz.Down then
      sbtAnaliz.Click;

    CalcValyutInfo;
    if DBGridEh1.FieldColumns['OSTATOK' ].Visible then
    begin
      Recalc_OSTATOK;
    end;

    DBGridEH1.SetFocus;

    // идем на последний рекорд
    cdsData.Last;
    // лоховство конечно, зато дешево, надежно и практично :), ничего поумнее, к сожалению не придумал
    keybd_event( VK_UP,VK_UP, KEYEVENTF_EXTENDEDKEY OR 0, 0 );
    keybd_event( VK_UP,VK_UP, KEYEVENTF_EXTENDEDKEY OR KEYEVENTF_KEYUP, 0);
    keybd_event( VK_DOWN,VK_DOWN, KEYEVENTF_EXTENDEDKEY OR 0, 0 );
    keybd_event( VK_DOWN,VK_DOWN, KEYEVENTF_EXTENDEDKEY OR KEYEVENTF_KEYUP, 0);


    // f_debugmode := false; // !!!NOW IS DEBUG_off (must be set debug_off for text searching in source code *.pas before deploy)
    // if(f_debugmode) then begin
    //   // begin debug nirs - special codes
    //   FIBDataSetReestr.SQLs.SelectSQL.SaveToFile('sqlreestr.txt'); // debug nirs
    //   FIBDataSetCurrentBase.SQLs.SelectSQL.SaveToFile('sqlcurdb.txt'); // debug nirs
    //   strlist := TStringList.Create; // debug nirs
    //   for i := 0 to FIBDataSetReestr.Params.Count - 1 do begin // debug nirs
    //     strlist.Add(FIBDataSetReestr.Params[i].Name + ' --- ' + FIBDataSetReestr.Params[i].AsString); // debug nirs
    //   end; // debug nirs
    //   strlist.SaveToFile('1reestr_par.txt'); // debug nirs
    //   strlist.clear; // debug nirs
    //   for i := 0 to FIBDataSetCurrentBase.Params.Count - 1 do begin // debug nirs
    //     strlist.Add(FIBDataSetCurrentBase.Params[i].Name + ' --- ' + FIBDataSetCurrentBase.Params[i].AsString); // debug nirs
    //   end; // debug nirs
    //   strlist.SaveToFile('1curdb_par.txt'); // debug nirs
    //   strlist.Free;     // debug nirs
    // end; // end debug nirs -- special codes

  finally
    Screen.Cursor := iCurScreenState;
  end
end;

procedure TViewOperListForm2.Recalc_OSTATOK;
var sumFP:Double;
begin
   if (not cdsData.Active) or (cdsData.IsEmpty) then Exit;
   cdsData.DisableControls;
   try
      sumFP:=0;
      cdsData.Last;
      while not cdsData.bof do
      begin
           cdsData.Edit;
           cdsData.FieldByName('OSTATOK').asFloat:=FEND_REST-sumFP;
//           sumF:=sumF-cdsData.FieldByName('OSTATOK').asFloat;
           cdsData.Post;

           sumFP := sumFP +
              cdsData.FieldByName('DEBET_SUMMA').AsFloat-
              cdsData.FieldByName('KREDIT_SUMMA').AsFloat;

           cdsData.Prior;
      end;
   finally
      cdsData.EnableControls;
   end;
end;

procedure TViewOperListForm2.DBGridEH1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  DBGridEH1.FieldColumns['KOLICH_DEBET'].Title.Caption := 'Приход'+GetValyutInfo+'|Количество';
  DBGridEH1.FieldColumns['DEBET_SUMMA' ].Title.Caption := 'Приход'+GetValyutInfo+'|Сумма';
  DBGridEH1.FieldColumns['KOLICH_KREDIT'].Title.Caption:= 'Расход'+GetValyutInfo+'|Количество';
  DBGridEH1.FieldColumns['KREDIT_SUMMA' ].Title.Caption:= 'Расход'+GetValyutInfo+'|Сумма';
  DBGridEh1.FieldColumns['OSTATOK' ].Title.Caption:= 'Остаток'+GetValyutInfo;
  DBGridEh1.FieldColumns['DEBET_MINUS_KREDIT' ].Title.Caption:= 'Дебет за вычетом кредита'+GetValyutInfo;


end;

procedure TViewOperListForm2.DBGridEH1DrawFooterCell(Sender: TObject;
  DataCol, Row: Integer; Column: TColumnEH; Rect: TRect;
  State: TGridDrawState);
begin
    if Column.Index = DBGridEh1.FieldColumns['OPERDATE'].Index then
     begin
       if Row = 0 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,DateToStr(MegaPeriodPanel.FromDate),taRightJustify,tlTop,False,False,0,0,false,true)
                  else WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,DateToStr(MegaPeriodPanel.TillDate),taRightJustify,tlTop,False,False,0,0,false,true);
     end
    else
    if Column.Index = DBGridEh1.FieldColumns['DOCTYPE'].Index then
     begin
       if Row = 0 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,'',taRightJustify,tlTop,False,False,0,0,false,true);
     end
    else
    if Column.Index = DBGridEh1.FieldColumns['DOCNUM'].Index then
     WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,'',taRightJustify,tlTop,False,False,0,0,false,true)
    else
    if Column.Index = DBGridEh1.FieldColumns['KOR_SCHET'].Index then
     begin
       if Row = 1 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,'Итого:',taRightJustify,tlTop,False,False,0,0,false,true)
                  else WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,'',taRightJustify,tlTop,False,False,0,0,false,true);
     end
    else
    if Column.Index = DBGridEh1.FieldColumns['KOLICH_DEBET'].Index then
     begin
       if Row = 1 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,FloatToStrF(FDEBET_KOLICH,ffNumber,14,2),taRightJustify,tlTop,False,False,0,0,false,true)
                  else WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,'',taRightJustify,tlTop,False,False,0,0,false,true);
     end
    else
    if Column.Index = DBGridEh1.FieldColumns['DEBET_SUMMA'].Index then
     begin
       if Row = 1 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,FloatToStrF(FDEBET,ffNumber,14,2),taRightJustify,tlTop,False,False,0,0,false,true)
            {      else
                  if SelBase>0 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,FloatToStrF(DBSumList1.SumCollection.Items[5].SumValue,ffNumber,14,2),taRightJustify,tlTop,False,False,0,0)}
                    else WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,'',taRightJustify,tlTop,False,False,0,0,false,true);
     end
    else
    if Column.Index = DBGridEh1.FieldColumns['KOLICH_KREDIT'].Index then
     begin
       if Row = 1 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,FloatToStrF(FKREDIT_KOLICH,ffNumber,14,2),taRightJustify,tlTop,False,False,0,0,false,true)
                  else WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,'',taRightJustify,tlTop,False,False,0,0,false,true);
     end
    else
    if Column.Index = DBGridEh1.FieldColumns['KREDIT_SUMMA'].Index then
     begin
       if Row = 1 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,FloatToStrF(FKREDIT,ffNumber,14,2),taRightJustify,tlTop,False,False,0,0,false,true)
              {    else
                  if SelBase>0 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,FloatToStrF(DBSumList1.SumCollection.Items[7].SumValue,ffNumber,14,2),taRightJustify,tlTop,False,False,0,0)
               }     else WriteTextEH(
               DBGridEH1.Canvas,Rect,False,2,2,'',taRightJustify,tlTop,False,False,0,0,false,true);
     end
    else
    if Column.Index = DBGridEh1.FieldColumns['OSTATOK'].Index then
     begin
       if Row = 0 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,FloatToStrF(FBEGIN_REST,ffNumber,14,2),taRightJustify,tlTop,False,False,0,0,false,true)
                  else WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,FloatToStrF(FEND_REST,ffNumber,14,2),taRightJustify,tlTop,False,False,0,0,false,true);
     end
    else
    if Column.Index = DBGridEh1.FieldColumns['PROSR_SUM'].Index then
    begin
      if Row = 0 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,FloatToStrF(FPROSR_SUM,ffNumber,14,2),taRightJustify,tlTop,False,False,0,0,false,true)
    end
    else
    if Column.Index = DBGridEh1.FieldColumns['OTSR'].Index then
    begin
       if Row = 0 then WriteTextEH(DBGridEH1.Canvas,Rect,False,2,2,'Просрочка:',taRightJustify,tlTop,False,False,0,0,false,true)
    end;


end;

procedure TViewOperListForm2.FormShow(Sender: TObject);
begin
  CheckBox2.Checked := chbInBalanceValyut.Checked;
  if (not CheckBox2.Checked) and CalcAfterShow then CalculateExecute(Sender);


end;

procedure TViewOperListForm2.PrintUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := dsMain.DataSet.Active;
end;

procedure TViewOperListForm2.CheckBox2Click(Sender: TObject);
begin
  chbInBalanceValyut.Checked := CheckBox2.Checked;
  CalculateExecute(Sender);
end;

procedure TViewOperListForm2.chkOtsrPropertiesChange(Sender: TObject);
begin
  DBGridEH1.FieldColumns['OTSR'].Visible :=not(DBGridEH1.FieldColumns['OTSR'].Visible);
end;

procedure TViewOperListForm2.chkProsrDolgClick(Sender: TObject);
begin
  DBGridEH1.FieldColumns['OTSR'].Visible := not(DBGridEH1.FieldColumns['OTSR'].Visible);
  DBGridEH1.FieldColumns['PROSR_SUM'].Visible := not(DBGridEH1.FieldColumns['PROSR_SUM'].Visible);
  DBGridEH1.FieldColumns['DAY_PROSR'].Visible := not(DBGridEH1.FieldColumns['DAY_PROSR'].Visible);
end;

procedure TViewOperListForm2.PrintOperListUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := true;
end;

procedure TViewOperListForm2.actPrintActSverUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ((MegaSelSchet.ResultDataSet.FieldByName('SCHET_ADK').AsInteger = 1)and (KodDK <> 0));
//  TAction(Sender).Visible := false;
end;

procedure TViewOperListForm2.ViewDocProvExecute(Sender: TObject);
begin

  if IntfMegaCommon.IsDocumentExist(
    cdsData.FieldByName('DOCTYPE').AsString,
    cdsData.FieldByName('DOCRECNO').AsInteger,
    cdsData.FieldByName('BASEID').AsInteger) then
  begin
    Transaction.Active:= True;
    TViewDocProvForm.Create(Self, Transaction,
                                  cdsData.FieldByName('DOCRECNO').AsInteger,
                                  cdsData.FieldByName('BASEID').AsInteger,
                                  cdsData.FieldByName('FORMTYPE').AsInteger
                                  ).ShowModal;
  end
  else begin
    MessageDlg(semDocFromReestr, mtWarning, [mbOK], 0);
  end;
end;

procedure TViewOperListForm2.DBGridEH1SortMarkingChanged(Sender: TObject);
begin
  MoneyData.SortCds(cdsData, TDBGridEH(Sender));
end;

procedure TViewOperListForm2.DK_FROM_CEEnter(Sender: TObject);
begin
  if KodDk = 0 then
  begin
    DK_FROM_CEPropertiesButtonClick(Self,0);
  end;
end;

procedure TViewOperListForm2.DK_FROM_CEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if MegaSelDKDialog.ExecuteAsControlPopUp(DK_FROM_CE) then
  begin
    KodDk := MegaSelDKDialog.KodDK;
    DK_FROM_CE.Text:= MegaSelDKDialog.ShortnameDK;
  end;
  SetActiveMegaSelContract;

  SelectNext(DK_FROM_CE, True, True);
end;

procedure TViewOperListForm2.RxDBLookupCombo2Change(Sender: TObject);
begin
  if DK_FROM_CE.Enabled then
  begin
    if MegaSelSchet.ResultDataSet.FieldByName('SCHET_ADK').AsInteger <> 1 then
    begin
       KodDK := 0;
       DK_FROM_CE.Text := '';
    end;
  end;
  PanelDK.Visible := (MegaSelSchet.ResultDataSet.FieldByName('SCHET_ADK').AsInteger = 1);
  CalcHeaderPanelHeight;

  Panel7.Visible := (MegaSelSchet.ResultDataSet.FieldByName('SCHET_AMATER').AsInteger = 1);
end;

procedure TViewOperListForm2.FIBDataSetCurrentBaseCalcFields(DataSet: TDataSet);
begin
  if SelBase=0 then
  DataSet.FieldByName('REG_BASEID').AsInteger:= DataSet.FieldByName('BASEID').AsInteger
  else
  begin
    if SelBase= DataSet.FieldByName('REG_BASEID').AsInteger then
    begin
      DataSet.FieldByName('KOLICH_DEBET1').AsFloat:= DataSet.FieldByName('KOLICH_DEBET').AsFloat;
      DataSet.FieldByName('DEBET_SUMMA1').AsFloat:= DataSet.FieldByName('DEBET_SUMMA').AsFloat;
      DataSet.FieldByName('KOLICH_KREDIT1').AsFloat:= DataSet.FieldByName('DEBET_SUMMA1').AsFloat;
      DataSet.FieldByName('KREDIT_SUMMA1').AsFloat:= DataSet.FieldByName('KREDIT_SUMMA').AsFloat;
    end
    else
    begin
      DataSet.FieldByName('KOLICH_DEBET1').AsFloat:=0;
      DataSet.FieldByName('DEBET_SUMMA1').AsFloat:=0;
      DataSet.FieldByName('KOLICH_KREDIT1').AsFloat:=0;
      DataSet.FieldByName('KREDIT_SUMMA1').AsFloat:=0;
    end;
  end;
end;

procedure TViewOperListForm2.aSelBaseExecute(Sender: TObject);
begin
  if dsMain.DataSet.RecordCount=0 then exit;
  if dsMain.DataSet.FieldByName('REG_BASEID').AsInteger=0 then exit;
  GetBaseID;
  SelBase:=dsMain.DataSet.FieldByName('REG_BASEID').AsInteger;
  DBSumList1.RecalcAll;
  FDEBET := DBSumList1.SumCollection.Items[5].SumValue;
  FKREDIT := DBSumList1.SumCollection.Items[7].SumValue;
  FDEBET_KOLICH := DBSumList1.SumCollection.Items[4].SumValue;
  FKREDIT_KOLICH := DBSumList1.SumCollection.Items[6].SumValue;
  FPROSR_SUM := DBSumList1.SumCollection.Items[8].SumValue;
  FEND_REST := FBEGIN_REST + FDEBET - FKREDIT;
  DBGridEH1.Refresh;
end;

procedure TViewOperListForm2.DBGridEH1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if dsMain.DataSet.FieldByName('REG_BASEID').AsInteger = SelBase then
  begin
    AFont.Style:=[fsBold];
  end;

//  if FDebug then //06/05/2002 lutsenko это условие временное
//  begin
  if actHighLightOplDocs.Checked then
  begin
  // lutsenko 03.12.2002 - временно закомментировал

    if (cdsData.FieldByName('ParentCount').AsInteger > 0)
    and (AnsiSameText(Column.FieldName, 'KREDIT_SUMMA')) then
    begin  //есть родительские документы
      if (gdSelected in State) or (gdFocused in State )
      then Background:= clInactiveCaption //focused selected
      else Background:= clYellow;
    end
    else
    if (cdsData.FieldByName('ChildCount').AsInteger > 0)
    and (AnsiSameText(Column.FieldName, 'DEBET_SUMMA')) then
    begin  //есть связанные оплатные документы
      if (gdSelected in State) or (gdFocused in State )
      then Background:= clInactiveCaption //focused selected
      else Background:= clGreen;
    end
    else begin //старые дебиторы
      if (gdSelected in State) or (gdFocused in State )
      then Background:= clHighLight    //focused selected
      else Background:= clWindow;;
    end;

  end;

  if DBGridEH1.DataSource.DataSet.FieldByName('OTSR').asInteger = 2 then
  begin
    AFont.Style := [fsBold];
    Background := $E2E2E2;
  end;

  if sbtAnaliz.Down then
  begin // группировка по дебиторам
     AFont.Color := clBlack;
    if DBGridEH1.DataSource.DataSet.FieldByName('CHECKED').AsInteger = 1 then
    begin
      AFont.Style := [fsBold];
      Background := $FFF0E7;
    end
    else
    if DBGridEH1.DataSource.DataSet.FieldByName('CHECKED').asInteger = 2 then
    begin
      AFont.Style := [fsBold];
      Background := $E2E2E2;
    end
    else
    begin
      AFont.Style := [];
      Background := clwhite;
//      if Column.FieldName='OSTATOK' then
//        AFont.Color := clwhite;
    end    ;
  end;

  // подсвечиавем сандору
  if btnHightLightSandora.checked and
    (DBGridEH1.DataSource.DataSet.FieldByName('IS_HORECA_NAME').AsString = 'Сандора') then
    Background := $0000CC00;

  if actHighLightOplDocs1C.Checked and (Column.Index = 0) then
  begin
    if not NullVar(cdsData['MODE_1C']) then
      case VarToInt(cdsData['MODE_1C']) of
//        0: AFont.Color:= clGreen;
//        1: AFont.Color:= clYellow;
//        2: AFont.Color:= clRed;
        0: begin Background:= clGreen; AFont.Color:= clHighlightText; end;
        1: begin Background:= clYellow; end;
        2: begin Background:= clRed; AFont.Color:= clHighlightText; end;
      end;
  end;

end;

procedure TViewOperListForm2.aUnSelBaseExecute(Sender: TObject);
begin
  SelBase:=-2;
  DBSumList1.RecalcAll;
  FDEBET := DBSumList1.SumCollection.Items[1].SumValue;
  FKREDIT := DBSumList1.SumCollection.Items[3].SumValue;
  FDEBET_KOLICH := DBSumList1.SumCollection.Items[0].SumValue;
  FKREDIT_KOLICH := DBSumList1.SumCollection.Items[2].SumValue;
  FEND_REST := FBEGIN_REST + FDEBET - FKREDIT;
  FPROSR_SUM := DBSumList1.SumCollection.Items[8].SumValue;
  DBGridEH1.Refresh;
end;

procedure TViewOperListForm2.GetBaseID;
begin
    Query.Transaction.Active:=true;

    if (IntfMegaDBCommon.IsOffice) and (SelBase=0) then
    begin
      SelBase:=-1;
      dsMain.DataSet.DisableControls;
      dsMain.DataSet.First;
      Query.Close;
      Query.SQL.Text:='select REG_BASEID from DOC_PROV where RECID= :RECID and BASEID = :BASEID';
      Query.Prepare;

      Query1.Close;
      Query1.SQL.Text:='select REG_BASEID from DOC_PP where RECID= :RECID and BASEID = :BASEID';
      Query1.Prepare;


      while not dsMain.DataSet.Eof do
      begin
        if dsMain.DataSet.FieldByName('FORMTYPE').AsInteger=4 then
        begin
          Query.Close;
          Query.Params[0].AsInteger:=dsMain.DataSet.FieldByName('DOCRECNO').AsInteger;
          Query.Params[1].AsInteger:=dsMain.DataSet.FieldByName('BASEID').AsInteger;
          Query.ExecQuery;
          if Query.Fields[0].AsInteger<>0 then
          begin
            dsMain.DataSet.Edit;
            dsMain.DataSet.FieldByName('REG_BASEID').AsInteger:=Query.Fields[0].AsInteger;
            dsMain.DataSet.Post;
          end;
        end else
        if dsMain.DataSet.FieldByName('FORMTYPE').AsInteger=3 then
        begin
          Query1.Close;
          Query1.Params[0].AsInteger:=dsMain.DataSet.FieldByName('DOCRECNO').AsInteger;
          Query1.Params[1].AsInteger:=dsMain.DataSet.FieldByName('BASEID').AsInteger;
          Query1.ExecQuery;
          if Query1.Fields[0].AsInteger<>0 then begin
            dsMain.DataSet.Edit;
            dsMain.DataSet.FieldByName('REG_BASEID').AsInteger:=Query1.Fields[0].AsInteger;
            dsMain.DataSet.Post;
          end;
        end;
        dsMain.DataSet.Next;
      end;
      dsMain.DataSet.EnableControls;
    end;
end;

procedure TViewOperListForm2.GetCalcDolg(type_:integer);
begin
//
    mdsArrearsDolg.close;
    mdsArrearsDolg.ParamByName('BDATE').asdatetime:=MegaPeriodPanel.FromDate;
    mdsArrearsDolg.ParamByName('EDATE').asdatetime:=MegaPeriodPanel.TillDate;
    mdsArrearsDolg.ParamByName('BALANCE_KOD').asinteger:=StrToInt(MegaSelBalance.Value);
    mdsArrearsDolg.ParamByName('SCHET').asString:=MegaSelSchet.Value;
    mdsArrearsDolg.ParamByName('KOD_DK').AsFloat:=KodDk;
    mdsArrearsDolg.ParamByName('sub').AsInteger:= liutils.iif(CheckBox3.checked,1,0);
    mdsArrearsDolg.open;
    mdsArrearsDolg.first;

    while not mdsArrearsDolg.eof do
    begin
      if cdsData.Locate('DOCRECNO;BASEID;FORMTYPE', VarArrayOf([
             mdsArrearsDolg.FieldByName('DOCRECNO').AsInteger,
             mdsArrearsDolg.FieldByName('BASEID').AsInteger,
             mdsArrearsDolg.FieldByName('FORMTYPE').AsInteger]),[]) then
      begin
        cdsData.EDit;
        cdsData.FieldByName('OTSR').AsInteger := mdsArrearsDolg.FieldByName('OTSR_').AsInteger;
        cdsData.FieldByName('PROSR_SUM').AsFloat := mdsArrearsDolg.FieldByName('DOLG').AsFloat;
        cdsData.FieldByName('DAY_PROSR').AsInteger := abs(mdsArrearsDolg.FieldByName('day_prosr').AsInteger);
        if ((type_=1) and (cdsData.FieldByName('PROSR_SUM').AsFloat>0)) then
            cdsData.FieldByName('DAYVALCONTROL').AsInteger := Round((cdsData.FieldByName('OPERDATE').AsDateTime+strtoint(IntfMegaDBCommon.GetParam('DAY_VAL_CONTROL', '90')))-date);
        cdsData.Post;
      end
      else
      begin
        if ((type_=1) and (cdsData.FieldByName('PROSR_SUM').AsFloat=0)) then
        begin
          cdsData.EDit;
          cdsData.FieldByName('DAYVALCONTROL').AsVariant := null;
          cdsData.Post;
        end;
      end;
      mdsArrearsDolg.next;
    end;
    DBSumList1.RecalcAll;
    FPROSR_SUM := DBSumList1.SumCollection.Items[8].SumValue;
    //,:EDATE,:BALANCE_KOD,:SCHET,:KOD_DK')

end;

procedure TViewOperListForm2.SelBaseExecute(BaseId:Integer);
begin
  if dsMain.DataSet.RecordCount=0 then exit;
  if dsMain.DataSet.FieldByName('REG_BASEID').AsInteger=0 then exit;
  GetBaseID;
  SelBase:=BaseId;
  DBSumList1.RecalcAll;
  FDEBET := DBSumList1.SumCollection.Items[5].SumValue;
  FKREDIT := DBSumList1.SumCollection.Items[7].SumValue;
  FDEBET_KOLICH := DBSumList1.SumCollection.Items[4].SumValue;
  FKREDIT_KOLICH := DBSumList1.SumCollection.Items[6].SumValue;
  FPROSR_SUM := DBSumList1.SumCollection.Items[8].SumValue;
  FEND_REST := FBEGIN_REST + FDEBET - FKREDIT;
  DBGridEH1.Refresh;
end;



procedure TViewOperListForm2.ShowDebetNotEqualKredit;
var
  cdsSums : TClientDataSet;
begin
  try
  cdsData.DisableControls;
  cdsSums := TClientDataSet.Create(self);

  with cdsSums.FieldDefs.AddFieldDef do
   begin
    DataType := ftInteger;
    Name := 'SUMM_D';
   end;
  with cdsSums.FieldDefs.AddFieldDef do
   begin
    DataType := ftInteger;
    Name := 'SUMM_K';
   end;

  with cdsSums.IndexDefs.AddIndexDef do
   begin
    Fields := 'SUMM_D;SUMM_K';
   end;
  with cdsSums.IndexDefs.AddIndexDef do
   begin
    Fields := 'SUMM_K;SUMM_D';
   end;
   
  cdsSums.CreateDataSet;

  cdsData.First;
  while not cdsData.eof do
  begin
    cdsData.Edit;
    cdsData.FieldByName('DEBET_SUMMA_TRUNC2').AsInteger := Round(cdsData.FieldByName('DEBET_SUMMA').AsFloat*100);
    cdsData.FieldByName('KREDIT_SUMMA_TRUNC2').AsInteger := Round(cdsData.FieldByName('KREDIT_SUMMA').AsFloat*100);
    cdsData.Post;

    if not cdsSums.Locate('SUMM_D;SUMM_K', VarArrayOf([
           cdsData.FieldByName('DEBET_SUMMA_TRUNC2').AsInteger,
           cdsData.FieldByName('KREDIT_SUMMA_TRUNC2').AsInteger]),[]) then
    begin
      cdsSums.Append;
      cdsSums.FieldByName('SUMM_D').AsInteger := cdsData.FieldByName('DEBET_SUMMA_TRUNC2').AsInteger;
      cdsSums.FieldByName('SUMM_K').AsInteger := cdsData.FieldByName('KREDIT_SUMMA_TRUNC2').AsInteger;
      cdsSums.Post;
    end;
    cdsData.next;
  end;


  cdsSums.First;
  while not cdsSums.eof do
  begin
    if cdsData.Locate('DEBET_SUMMA_TRUNC2;KREDIT_SUMMA_TRUNC2', VarArrayOf([
       cdsSums.FieldByName('SUMM_D').AsInteger, cdsSums.FieldByName('SUMM_K').AsInteger]),[]) and
       cdsData.Locate('DEBET_SUMMA_TRUNC2;KREDIT_SUMMA_TRUNC2', VarArrayOf([
       cdsSums.FieldByName('SUMM_K').AsInteger, cdsSums.FieldByName('SUMM_D').AsInteger]),[]) then
    begin
      if cdsData.Locate('DEBET_SUMMA_TRUNC2;KREDIT_SUMMA_TRUNC2', VarArrayOf([
         cdsSums.FieldByName('SUMM_D').AsInteger, cdsSums.FieldByName('SUMM_K').AsInteger]),[]) then
        cdsData.Delete;
      if cdsData.Locate('DEBET_SUMMA_TRUNC2;KREDIT_SUMMA_TRUNC2', VarArrayOf([
         cdsSums.FieldByName('SUMM_K').AsInteger, cdsSums.FieldByName('SUMM_D').AsInteger]),[]) then
        cdsData.Delete;
    end
    else // в else задуман хитро-....-й смысл, на случай если цдс-ке есть две пары задвоеных сумм
     cdsSums.next;
  end;

  finally
    cdsData.EnableControls;
  end;
end;

procedure TViewOperListForm2.accPrintRepForNalogRusExecute(Sender: TObject);
var sWithSubDk: string;
begin
  if checkBox3.Checked then
   sWithSubDk:= '1'
  else
   sWithSubDk:= '0';
  dmMegaReports.MyShow(200646, Date(), InttoStr(StrToIntDef(MegaSelBalance.Value, -1))+','+DateToStr(MegaPeriodPanel.FromDate)+','+DateToStr(MegaPeriodPanel.TillDate)+','+MegaSelSchet.Value+','+Edit1.Text+','+ FloatToStr(KodDK) +','+ sWithSubDk);
end;

procedure TViewOperListForm2.aChangeDKExecute(Sender: TObject);
 var
  i:integer;
  st,st1,st2:string;
  dd,dd1:Double;
begin
  if not (DM.UserAccess in [0,5]) then exit;
  Query.Transaction.Active:=true;

  dd:=0;
  dd1:=0;
  if DBGridEh1.SelectedRows.Count=0 then exit;
  if not GetDK2(DM.Money, dd,st) then exit;

  if (dd=0) or (st='') then exit;
//  Application.MessageBox('Перепровести проводки ?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES) then
  for i:=0 to DBGridEh1.SelectedRows.Count-1 do
  begin
    DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
    DM.WhatForm.Close;
    DM.WhatForm.Params[0].AsString := cdsData.FieldByName('DOCTYPE').AsString;
    DM.WhatForm.ExecQuery;
  // DM.WhatForm.Fields[0].AsString
    if dd1=0 then
    begin
      Query.Close;
      Query.SQL.Text:='Select DOC.DK_TO, SDK.SHORTNAME_DK from '+DM.WhatForm.Fields[0].AsString+' DOC';
      Query.SQL.Add('left join sprav_dk sdk on (sdk.kod_dk=doc.DK_TO)');
      Query.SQL.Add('where doc.recid='+cdsData.FieldByName('DOCRECNO').AsString+' and doc.baseid='+cdsData.FieldByName('BASEID').AsString);
      Query.ExecQuery;
      st1:='Заменить '+Query.Fields[1].AsString+' на '+st+'?';
      if Application.MessageBox(Pchar(st1),'Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES then
      begin
        dd1:=Query.Fields[0].AsDouble;
      end;
    end;
    if dd1=0 then
    begin
      Query.Close;
      Query.SQL.Text:='Select DOC.DK_FROM, SDK.SHORTNAME_DK from '+DM.WhatForm.Fields[0].AsString+' DOC';
      Query.SQL.Add('left join sprav_dk sdk on (sdk.kod_dk=doc.DK_FROM)');
      Query.SQL.Add('where doc.recid='+cdsData.FieldByName('DOCRECNO').AsString+' and doc.baseid='+cdsData.FieldByName('BASEID').AsString);
      Query.ExecQuery;
      st1:='Заменить '+Query.Fields[1].AsString+' на '+st+'?';
      if Application.MessageBox(Pchar(st1),'Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES then
      begin
        dd1:=Query.Fields[0].AsDouble;
      end;
    end;

    if dd1=0 then exit;
    Query.Close;
    Query.SQL.Text:=' EXECUTE PROCEDURE SET_CONTEXT_VARIABLE(''CHANGE_PRESENT'', ''1'')';
    Query.ExecQuery;

    Query.Close;
    Query.SQL.Text:='update '+DM.WhatForm.Fields[0].AsString;
    Query.SQL.Add('set dk_to='+FloatToStr(dd));
    Query.SQL.Add('where recid='+cdsData.FieldByName('DOCRECNO').AsString+' and baseid='+cdsData.FieldByName('BASEID').AsString);
    Query.SQL.Add('and dk_to='+FloatToStr(dd1));
    Query.ExecQuery;

    Query.Close;
    Query.SQL.Text:='update '+DM.WhatForm.Fields[0].AsString;
    Query.SQL.Add('set dk_from='+FloatToStr(dd));
    Query.SQL.Add('where recid='+cdsData.FieldByName('DOCRECNO').AsString+' and baseid='+cdsData.FieldByName('BASEID').AsString);
    Query.SQL.Add('and dk_from='+FloatToStr(dd1));
    Query.ExecQuery;
    Query.Transaction.CommitRetaining;
  end;
end;

procedure TViewOperListForm2.DBGridEH1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
    VK_SPACE:
      begin
        if not (Shift = [ssShift]) then
          DBGridEh1.SelectedRows.CurrentRowSelected := not DBGridEh1.SelectedRows.CurrentRowSelected
        else DBGridEh1.SelectedRows.Clear;
      end;
  end;
end;

procedure TViewOperListForm2.aProvExecute(Sender: TObject);
begin
try
  if Application.MessageBox('Перепровести проводки по документам в списке?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) <> IDYES then Exit;

  cdsData.First;
  Query.Transaction.Active := False;
  Query.Transaction.Active := True;

  //IntfMegaDBCommon.ReplicatorOn(Query, '');

//  TMainForm(Application.MainForm).sbMain.SimpleText := 'Фаза 1: удаление прводок ...'; //rem by lutsenko 01.07.2002
  Application.Hint:= 'Фаза 1: удаление прводок ...'; //added by lutsenko 01.07.2002

  // было закомментарено (НАЧАЛО БЛОКА), вернули по просьбе Спивак 16.02.2023
  //{ --add comment nirs 16_02_2023
  while not cdsData.EOF do
  begin
    Query.Close;

    Query.SQL.Text := 'EXECUTE PROCEDURE DELETE_PROV_DOC_NEW('+
    cdsData.FieldByName('DOCRECNO').AsString+', '+
    cdsData.FieldByName('BASEID').AsString+', '+
    cdsData.FieldByName('FORMTYPE').AsString+', null, 1)';

    Query.ExecQuery;
    //Query.transaction.commit;
    cdsData.Next;
    DBGridEH1.Update;
  end;
  //} --add comment nirs 16_02_2023
  // было закомментарено (КОНЕЦ БЛОКА), вернули по просьбе Спивак 16.02.2023

//  TMainForm(Application.MainForm).sbMain.SimpleText := 'Фаза 2: перепроведение документов ...'; //rem by lutsenko 01.07.2002
  Application.Hint:='Фаза 2: перепроведение документов ...'; //added by lutsenko 01.07.2002

  cdsData.First;

  Query.Close;
  //Query.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC(:DOC_INHERITED, :RECID, :BASEID, 1)';
  //Query.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC_NEW(:DOC_INHERITED, :RECID, :BASEID, null, null, null)';
  //Query.Prepare;
  while not cdsData.EOF do
  begin
    Query.Close;
    Query.SQL.Text := 'EXECUTE PROCEDURE DELETE_PROV_DOC_NEW('+
    cdsData.FieldByName('DOCRECNO').AsString+', '+
    cdsData.FieldByName('BASEID').AsString+', '+
    cdsData.FieldByName('FORMTYPE').AsString+', null, 1)';

    Query.ExecQuery;

    begin
      Query.Close;
      Query.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC_NEW(:DOC_INHERITED, :RECID, :BASEID, null, null, null)';
      Query.Params.ByName['DOC_INHERITED'].Value := cdsData.FieldByName('FORMTYPE').Value;
      Query.Params.ByName['RECID'].Value := cdsData.FieldByName('DOCRECNO').Value;
      Query.Params.ByName['BASEID'].Value := cdsData.FieldByName('BASEID').Value;
      Query.ExecQuery;
    end;
    cdsData.Next;
    DBGridEH1.Update;
  end;
  //IntfMegaDBCommon.ReplicatorOff(Query);
  if Query.Transaction.InTransaction then Query.Transaction.Commit;
  CalculateExecute(nil);

//  TMainForm(Application.MainForm).sbMain.SimpleText := ''; //rem by lutsenko 01.07.2002
  Application.Hint:= ''; //added by lutsenko 01.07.2002

except
  on E: Exception do
  begin
    Query.Transaction.Rollback;
    CalculateExecute(nil);

//    TMainForm(Application.MainForm).sbMain.SimpleText := E.Message; //rem by lutsenko 01.07.2002
    Application.Hint:= E.Message; //added by lutsenko 01.07.2002

  end;
end;
DBGridEh1.SelectedRows.Clear;
end;

procedure TViewOperListForm2.DBGridEH1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//
//  - 01.06.2002 - луценко - закомментировал код метода
//  - так как сбрасывались выделенные строчки
//  - при выборе пункта во всплывающем меню.
//
//  if not ((ssShift in Shift) or (ssCtrl in Shift))
//  then DBGridEh1.SelectedRows.Clear;
end;

function TViewOperListForm2.GetDKStr(const FldName:string; dd:Double):string;
var
  st,st1:string;
begin
  slDK.Clear;
  if  not CheckBox3.Checked then
  begin
    if ((dd=772151190321602) or (dd=772151190311501)) then
      Result:= '('+FldName+'='+FloatToStr(772151190311501)+' or '+FldName+'='+FloatToStr(772151190321602)+')'
    else if ((dd=772062816903001) or (dd=772062816911501) or (dd=772062816923901)) then
      Result:= '('+FldName+'='+FloatToStr(772062816903001)+' or '+FldName+'='+FloatToStr(772062816911501)+' or '+FldName+'='+FloatToStr(772062816923901)+')'
    else if ((dd=782570608623101 ) or (dd=782570608624301)) then
      Result:= '('+FldName+'='+FloatToStr(782570608623101)+' or '+FldName+'='+FloatToStr(782570608624301)+')'
    else
      Result:='('+FldName+'='+FloatToStr(dd)+')';
  end else
  begin
    Query.Close;
    Query.Transaction.Active:=true;
    Query.SQL.Text:='select Result FROM GET_DK_CHILDRENS('+FloatToStr(dd)+')';
    Query.ExecQuery;
    st:='('+FldName+'='+FloatToStr(dd);
    While not Query.EOF do
    begin
      st:=st + ' OR '+FldName+'='+FloatToStr(Query.Fields[0].AsDouble);
      slDK.Add(FloatToStr(Query.Fields[0].AsDouble));
      Query.Next;
    end;
    st:=st+')';
    Result:=st;
  end;
  if  chkNumberDogovor.checked then
  begin
    Query.Close;
    Query.Transaction.Active:=true;
    Query.SQL.Text:=' select kod_dk from sprav_dk sd where sd.nash_kod = ( select sd.nash_kod from sprav_dk sd '+
                    ' where sd.kod_dk=' + FloatToStr(dd)+') and sd.parent = (select sd.parent from sprav_dk sd '+
                    ' where sd.kod_dk=' + FloatToStr(dd)+')';
    Query.ExecQuery;
    st:='('+FldName+'='+FloatToStr(dd);
    While not Query.EOF do
    begin
      st:=st + ' OR '+FldName+'='+FloatToStr(Query.Fields[0].AsDouble);
      slDK.Add(FloatToStr(Query.Fields[0].AsDouble));
      Query.Next;
    end;
    st:=st+')';
    Result:=st;
  end
end;

procedure TViewOperListForm2.aChangeOperExecute(Sender: TObject);
 var
  i,go,ko,go1,ko1:integer;
  st,st1,st2,gon,kon,gon1,kon1:string;
  dd,dd1:Double;
  AUTO_OPL: Integer;
begin
  if not (DM.UserAccess in [0,5]) then exit;
  Query.Transaction.Active:=true;
  dd:=0;
  dd1:=0;
  if DBGridEh1.SelectedRows.Count=0 then exit;
  DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
  DM.WhatForm.Close;
  DM.WhatForm.Params[0].AsString := cdsData.FieldByName('DOCTYPE').AsString;
  DM.WhatForm.ExecQuery;
  go1:=0;
  ko1:=0;

  if not (GetOper1(DM.WhatForm.Fields[0].AsString, cdsData.FieldByName('DOCTYPE').AsString,
  TComponent(Sender).Tag,
  go,
  ko,
  gon,
  kon, AUTO_OPL) = mrOk) then exit;

  st := gon+' / '+kon;
//  if (dd=0) or (st='') then exit;

//  Application.MessageBox('Перепровести проводки ?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES) then
  for i:=0 to DBGridEh1.SelectedRows.Count-1 do
  begin
    DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
    DM.WhatForm.Close;
    DM.WhatForm.Params[0].AsString := cdsData.FieldByName('DOCTYPE').AsString;
    DM.WhatForm.ExecQuery;
  // DM.WhatForm.Fields[0].AsString
    if go1=0 then
    begin
      Query.Close;
      Query.SQL.Text:='Select DOC.group_oper, DOC.kod_oper,  sg.group_name, so.name_oper from '+DM.WhatForm.Fields[0].AsString+' DOC';
      Query.SQL.Add('left join sprav_groper sg on (sg.group_oper=DOC.group_oper)');
      Query.SQL.Add('left join sprav_oper so on (so.kod_oper=doc.kod_oper)');
      Query.SQL.Add('where doc.recid='+cdsData.FieldByName('DOCRECNO').AsString+' and doc.baseid='+cdsData.FieldByName('BASEID').AsString);
      Query.ExecQuery;
      st1:='Заменить '+Query.Fields[2].AsString+' / '+Query.Fields[3].AsString+' на '+st+'?';
      if Application.MessageBox(Pchar(st1),'Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES then
      begin
        go1:=Query.Fields[0].AsInteger;
        ko1:=Query.Fields[1].AsInteger;

      end;
    end;
    if go1=0 then  exit;
   { begin
      Query.Close;
      Query.SQL.Text:='Select DOC.DK_FROM, SDK.SHORTNAME_DK from '+DM.WhatForm.Fields[0].AsString+' DOC';
      Query.SQL.Add('left join sprav_dk sdk on (sdk.kod_dk=doc.DK_FROM)');
      Query.SQL.Add('where doc.recid='+FIBDataSet1DOCRECNO.AsString+' and doc.baseid='+FIBDataSet1BASEID.AsString);
      Query.ExecQuery;
      st1:='Заменить '+Query.Fields[1].AsString+' на '+st+'?';
      if Application.MessageBox(Pchar(st1),'Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES then
      begin
        dd1:=Query.Fields[0].AsDouble;
      end;
    end;}

  //  if dd1=0 then exit;
    Query.Close;
    Query.SQL.Text:='update '+DM.WhatForm.Fields[0].AsString;
    Query.SQL.Add('set group_oper='+IntToStr(go)+',');
    Query.SQL.Add('kod_oper='+IntToStr(ko));
    Query.SQL.Add('where recid='+cdsData.FieldByName('DOCRECNO').AsString+' and baseid='+cdsData.FieldByName('BASEID').AsString);
    Query.SQL.Add('and group_oper='+IntToStr(go1)+' and kod_oper='+IntToStr(ko1));
    Query.ExecQuery;

    Query.Transaction.CommitRetaining;
  end;
end;

procedure TViewOperListForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: integer;
begin
  if (Key = Ord('D')) and (ssCtrl in Shift) and (ssAlt in Shift) and (ssShift in Shift) then
  begin // условие для возможности редактирования отчёта
    FDebug:= True;
    actLinkDocOplRun.Visible:= True;
    actHighLightOplDocs.Visible:= True;

    for i:= 0 to DBGridEH1.Columns.Count - 1 do
    begin
      DBGridEH1.Columns[i].Visible:= True;
    end;
  end;

end;

procedure TViewOperListForm2.actLinkDocOplRunExecute(Sender: TObject);
var
  i: integer;
  lPrihodDocs: TObjectList;
  lRashodDocs: TObjectList;
  lDocIDItem: TDocIDItem;
  lbm: TBookMarkStr;

  lInsQuery: TMegaQuery;
  lSelQuery: TMegaQuery;

  lPrihodItem, lRashodItem: TDocIDItem;
const
  sSelSQLText =
    ' select '+
    '   parent_recid, parent_baseid, '+
    '   opl_recid, opl_baseid, opl_form_type '+
    ' from '+
    '   link_doc_opl '+
    ' where '+
    '     parent_recid = :parent_recid '+
    ' and parent_baseid = :parent_baseid '+
    ' and opl_recid = :opl_recid '+
    ' and opl_baseid = :opl_baseid '+
    ' and opl_form_type = :opl_form_type ';

  sInsSQLText =
    ' insert into link_doc_opl '+
    '   ( parent_recid, parent_baseid, opl_recid, opl_baseid, opl_form_type) '+
    ' values '+
    '   (:parent_recid,:parent_baseid,:opl_recid,:opl_baseid,:opl_form_type) ';

begin
//  ShowMessage('Разрабатывается');
//  Raise Exception.Create('Возможность не реализована');


  if not cdsData.Active then
  begin
    Raise Exception.Create('Нет данных');
  end;

  if DBGridEH1.SelectedRows.Count <= 1 then
  begin
    Raise Exception.Create('Для связки документов необходимо выделить минимум 2 строки');
  end;

  lPrihodDocs:= TObjectList.Create;
  lRashodDocs:= TObjectList.Create;

  lbm:= cdsData.Bookmark;
  cdsData.DisableControls;
  try

    for i:= 0 to DBGridEH1.SelectedRows.Count - 1 do
    begin
      cdsData.GotoBookmark(pointer(DBGridEH1.SelectedRows.Items[i]));

      lDocIDItem:= TDocIDItem.Create;
      lDocIDItem.BaseID:= cdsData.FieldByName('BASEID').AsInteger;
      lDocIDItem.RecID:= cdsData.FieldByName('DOCRECNO').AsInteger;
      lDocIDItem.FormType:= cdsData.FieldByName('FormType').Asinteger;
//      lDocIDItem.FormType:= FibDataSet1.FieldByName('DocType').AsString;

      if (cdsData.FieldByName('DEBET_SUMMA').AsFloat > 0)and
         (pos('ЗМЦ',UpperCase(cdsData.FieldByName('docType').AsString))<>1)
      then
      begin
        // заполняем приходный список
        lPrihodDocs.Add(lDocIDItem);
//        Showmessage('приход');
      end
      else begin
        // заполняем расходный список
        lRashodDocs.Add(lDocIDItem);
//        Showmessage('расход');
      end;
    end;

    if lPrihodDocs.Count < 1 then
    begin
      Raise Exception.Create('Ошибка ввода! Необходимо чтобы в выделенных строках было не менее одного документа с суммой в приходе');
    end;

    {if lPrihodDocs.Count <> 1 then
    begin
      Raise Exception.Create('Ошибка ввода! Необходимо чтобы в выделенных строках был один документ с суммой в приходе');
    end;
     }
    if lRashodDocs.Count < 1 then
    begin
      Raise Exception.Create('Ошибка ввода! Необходимо чтобы в выделенных строках было не менее одного документа с суммой в расходе');
    end;


    lSelQuery:= TMegaQuery.Create(Self);
    lInsQuery:= TMegaQuery.Create(Self);
    try


      lSelQuery.DataBase:= FIBDataSetCurrentBase.Database;
      lSelQuery.Transaction:= FIBDataSetCurrentBase.Transaction;

      lInsQuery.DataBase:= FIBDataSetCurrentBase.Database;
      lInsQuery.Transaction:= dm.trMainWShort;
      lInsQuery.options:= [qoStartTransaction,qoAutoCommit];
//      Raise Exception.Create('Не установлены наборы данных');


      lSelQuery.SQL.Text:= sSelSQLText;
      lInsQuery.SQL.Text:= sInsSQLText;

      lSelQuery.Prepare;
      lInsQuery.Prepare;

//{ TODO -olutsenko -cпредм область : возможно при вставке в таблицу связки приходные и расходные документы необходимо поменять местами }

      lPrihodItem:= TDocIDItem(lPrihodDocs.Items[0]);

      for i:= 0 to lRashodDocs.Count - 1 do
      begin
        lRashodItem:= TDocIDItem(lRashodDocs.Items[i]);

        lSelQuery.Close;

        lSelQuery.Params.ByName['Parent_recid'].AsInteger:= lPrihodItem.RecID;
        lSelQuery.Params.ByName['Parent_baseid'].AsInteger:= lPrihodItem.BaseID;
        lSelQuery.Params.ByName['opl_recid'].AsInteger:= lRashodItem.RecID;
        lSelQuery.Params.ByName['opl_baseid'].AsInteger:= lRashodItem.BaseID;
//        lSelQuery.Params.ByName['opl_form_type'].AsString:= lRashodItem.FormType;
        lSelQuery.Params.ByName['opl_form_type'].AsInteger:= lRashodItem.FormType;

        lSelQuery.ExecQuery;

        if lSelQuery.EOF and lSelQuery.BOF then
        begin

          lInsQuery.Close;

          lInsQuery.Params.ByName['Parent_recid'].AsInteger:= lPrihodItem.RecID;
          lInsQuery.Params.ByName['Parent_baseid'].AsInteger:= lPrihodItem.BaseID;
          lInsQuery.Params.ByName['opl_recid'].AsInteger:= lRashodItem.RecID;
          lInsQuery.Params.ByName['opl_baseid'].AsInteger:= lRashodItem.BaseID;
//          lInsQuery.Params.ByName['opl_form_type'].AsString:= lRashodItem.FormType;
          lInsQuery.Params.ByName['opl_form_type'].AsInteger:= lRashodItem.FormType;

          lInsQuery.ExecQuery;

        end;

      end;


    finally
      lSelQuery.Free;
      lInsQuery.Free;
    end;

    FIBDataSetCurrentBase.Transaction.CommitRetaining;
//    Raise Exception.Create('Действие не подтверждено');


    PrepareGetOplQueries;


    for i:= 0 to DBGridEH1.SelectedRows.Count - 1 do
    begin
      cdsData.GotoBookmark(pointer(DBGridEH1.SelectedRows.Items[i]));
      ExecGetOplQueries;

    end;
    cdsData.Bookmark:= lbm;
  finally
    cdsData.EnableControls;
    lPrihodDocs.Free;
    lRashodDocs.Free;
  end;
end;

procedure TViewOperListForm2.PrepareGetOplQueries;
const
  sSelParSQLText =
    ' select count(*) '+
    ' from '+
    '   link_doc_opl '+
    ' where '+
    ' opl_recid = :opl_recid '+
    ' and opl_baseid = :opl_baseid '+
    ' and opl_form_type = :opl_form_type ';

  sSelOplSQLText =
    ' select count(*) '+
    ' from '+
    '   link_doc_opl '+
    ' where '+
    '     parent_recid = :parent_recid '+
    ' and parent_baseid = :parent_baseid ';
begin
      Query.Transaction.Active:=true;
      Query.Close;
      Query.SQL.Text:=sSelParSQLText;
      Query.Prepare;
      Query1.Close;
      Query1.SQL.Text:=sSelOplSQLText;
      Query1.Prepare;
end;

procedure TViewOperListForm2.ExecGetOplQueries;
begin
        Query.Transaction.Active:=true;
        Query.Close;
        Query.Params[0].AsInteger:=cdsData.FieldByName('DOCRECNO').AsInteger;
        Query.Params[1].AsInteger:=cdsData.FieldByName('BASEID').AsInteger;
        Query.Params[2].AsInteger:=cdsData.FieldByName('FormType').AsInteger;
        Query.ExecQuery;
        Query1.Close;
        Query1.Params[0].AsInteger:=cdsData.FieldByName('DOCRECNO').AsInteger;
        Query1.Params[1].AsInteger:=cdsData.FieldByName('BASEID').AsInteger;
        Query1.ExecQuery;

       { if (Query.Fields[0].AsInteger<>0) or (Query1.Fields[0].AsInteger<>0) then
        begin}
          cdsData.Edit;
          cdsData.FieldByName('ParentCount').AsInteger:=Query.Fields[0].AsInteger;
          cdsData.FieldByName('ChildCount').AsInteger:=Query1.Fields[0].AsInteger;
          cdsData.Post;
        {end;}
end;


procedure TViewOperListForm2.actHighLightOplDocsExecute(Sender: TObject);

begin

  actHighLightOplDocs.Checked:= not actHighLightOplDocs.Checked;

  if actHighLightOplDocs.Checked then
  begin
    PrepareGetOplQueries;
    cdsData.First;
    while not cdsData.Eof do
    begin
      ExecGetOplQueries;
      cdsData.Next;
    end;
  end;

  DBGridEH1.Refresh;
end;

procedure TViewOperListForm2.actPrintSverExportExecute(Sender: TObject);
var
  dm: TdmPrintActSver;
begin
  dm:= TdmPrintActSver.Create(Self);
  try
    PrintActSver2Init(dm,1,TRUE);

    if FDebug
     then dm.Report.DesignReport
     else dm.Report.ShowReport;
  finally
    dm.Free;
  end;
end;

procedure TViewOperListForm2.actPrintSverkaAllExecute(Sender: TObject);
var
  dmAct: TdmPrintActSver;
  K,IndexNameIndex,aBalance_F2 : integer;
  aRecid,aBaseid : integer;
  dater: TDateTime;
  locDEBETInc : double;
  locEndRest,locBeginRest : double;
  aPrintDate: TDateTime;
  aSchet_F2: string;

begin
//
   aBalance_F2 := 300;
   aSchet_F2 := '64';
   try
     dmact:= TdmPrintActSver.Create(Self);
     begin
       PrintActSver2Init(dmact);
       //if IsF2F1 then
       begin
         dm.SharedQuery.Close;
         dm.SharedQuery.SQL.Text:=
            'SELECT DOCNUM,                            '#13#10+
            '       BASEID,                            '#13#10+
            '       FORMTYPE,                          '#13#10+
            '       OPERDATE,                          '#13#10+
            '       DOCTYPE,                           '#13#10+
            '       SUMMA,                             '#13#10+
            '       DEBET_SUMMA,                       '#13#10+
            '       KREDIT_SUMMA,                      '#13#10+
            '       DOLG,                              '#13#10+
            '       A_KOD_DK,                          '#13#10+
            '       OTSR_                              '#13#10+
            '       ,END_SUMMA                         '#13#10+
            '       ,BEGIN_SUMMA                         '#13#10+            
            'FROM GET_DK_VISIT_ACTF2_LIST(:BEGIN_DATE, '#13#10+
            ':END_DATE,                                '#13#10+
            ':BALANCE_KOD,                             '#13#10+
            ':SCHET_KOD,                               '#13#10+
            ':KODDK)                                   ';
         dm.SharedQuery.ParamByName('BALANCE_KOD').AsInteger:=aBalance_F2;
         dm.SharedQuery.ParamByName('SCHET_KOD').AsString:=aSchet_F2;
         dm.SharedQuery.ParamByName('BEGIN_DATE').AsDateTime:=MegaPeriodPanel.FromDate;
         dm.SharedQuery.ParamByName('END_DATE').AsDateTime:=MegaPeriodPanel.TillDAte;
         dm.SharedQuery.ParamByName('KODDK').AsFloat:=KodDk;
         dm.SharedQuery.ExecQuery;
         locDEBETInc := 0;
         While not dm.SharedQuery.Eof do
         begin
           dmAct.cdsData.Append;
           dmAct.cdsData.FieldByName('OPERDATE').Value:=dm.SharedQuery.FieldByName('OPERDATE').Value;
           dmAct.cdsData.FieldByName('DOCTYPE').Value:=dm.SharedQuery.FieldByName('DOCTYPE').Value;
           dmAct.cdsData.FieldByName('DOCNUM').Value:=dm.SharedQuery.FieldByName('DOCNUM').Value;
           dmAct.cdsData.FieldByName('KOLICH_DEBET').Value:=0;//dm.SharedQuery.FieldByName('KOLICH_DEBET').Value;
           dmAct.cdsData.FieldByName('DEBET_SUMMA').Value:=dm.SharedQuery.FieldByName('DEBET_SUMMA').Value;
           locDEBETInc := locDEBETInc + dmAct.cdsData.FieldByName('DEBET_SUMMA').AsFloat;
           dmAct.cdsData.FieldByName('KOLICH_KREDIT').Value:=0;//            dm.SharedQuery.FieldByName('KOLICH_KREDIT').Value;
           dmAct.cdsData.FieldByName('KREDIT_SUMMA').Value:=dm.SharedQuery.FieldByName('KREDIT_SUMMA').Value;
           dmAct.cdsData.FieldByName('FORMTYPE').Value:=dm.SharedQuery.FieldByName('FORMTYPE').Value;
  //           dmAct.cdsData.FieldByName('DOCRECNO').Value:=dm.SharedQuery.FieldByName('DOCRECNO').Value;
           dmAct.cdsData.FieldByName('BASEID').Value:=dm.SharedQuery.FieldByName('BASEID').Value;
           dmAct.cdsData.Post;
           locEndRest:= dm.SharedQuery.FieldByName('END_SUMMA').Value;
           locBeginRest:= dm.SharedQuery.FieldByName('BEGIN_SUMMA').Value;
           dm.SharedQuery.Next;
         end;

         dmAct.InitActSver(
          MegaPeriodPanel.FromDate,
          MegaPeriodPanel.TillDate,
          StrToIntDef(MegaSelBalance.Value, -1),
          StrToIntDef(MegaSelCFO.Value, -1),
          MegaSelSchet.Value,
          KodDk,
          DK_FROM_CE.Text,
          FBEGIN_REST+locEndRest-locDEBETInc,
          FDEBET+locDEBETInc,
          FKREDIT,
          FEND_REST + locEndRest,
          0
         );
         // Заменяю оплаты
       end;

       //SortCds(dmAct.cdsData,'OPERDATE;DOCTYPE;DOCNUM','');

       //close;
     end;



  { ----------------- Added by Lion in 25.03.2008 ---------------- }
      dmAct.cdsData.IndexFieldNames:= 'OPERDATE;DOCTYPE;DOCNUM';
  { ----------- End of addition by Lion in 25.03.2008 ----------- }
      if FDebug then
        dmAct.Report.DesignReport
       else
        dmAct.Report.ShowReport;
  finally
    dmAct.Free;
  end;


end;

procedure TViewOperListForm2.actPrintSverkaFromLVZExecute(Sender: TObject);
var
  dm: TdmPrintActSver;
begin
//
 dm:= TdmPrintActSver.Create(Self);
  try
    if MegaSelContract.ComboBox.DisplayValues[0]<>'' then
      dm.DogovorNum:='Договір №'+MegaSelContract.ComboBox.DisplayValues[0]+' від '+MegaSelContract.ComboBox.DisplayValues[1]
    else
      dm.DogovorNum:='';
    PrintActSver3Init(dm, 4, true);




{ ----------------- Added by Lion in 25.03.2008 ---------------- }
//    dm.cdsData.IndexFieldNames:= 'OPERDATE;DOCTYPE;DOCNUM';
{ ----------- End of addition by Lion in 25.03.2008 ----------- }
    if FDebug then
      dm.Report.DesignReport
     else
      dm.Report.ShowReport;
  finally
    dm.Free;
  end;

end;

procedure TViewOperListForm2.actPrintTurnoverDalExecute(Sender: TObject);
begin
//
  dmMegaReports.MyShow(992, Now(), DateToStr(MegaPeriodPanel.FromDate)+','+DateToStr(MegaPeriodPanel.TillDate)+','+MegaSelBalance.value+','+MegaSelSchet.Value +','+FloattoStr(KodDk));
end;

procedure TViewOperListForm2.actPrintZaprosExecute(Sender: TObject);
var
  dm: TdmPrintActSver;
begin
  dm:= TdmPrintActSver.Create(Self);
  try
  if CheckBox3.Checked then
     PrintActSver2Init(dm,3, false)
     else
    PrintActSver2Init(dm,2, false);
    if FDebug then
      dm.Report.DesignReport
     else
      dm.Report.ShowReport;
  finally
    dm.Free;
  end;
end;

procedure TViewOperListForm2.sbHelpClick(Sender: TObject);
begin
//  pnGridHighLightHelp.Visible:= sbHelp.Down;
end;

procedure TViewOperListForm2.actRemoveParentOplDocExecute(Sender: TObject);
var
  lFibQuery: TMegaQuery;
  lMR: integer;
  lBM: TBookMarkStr;
const
  sDelParentOplDocs = 'delete from link_doc_opl where parent_recid = :parent_recid and parent_baseid = :parent_baseid';
begin
  if DBGridEH1.SelectedRows.Count>1 then
  begin
    Raise Exception.Create('Должен быть выбран только один документ');
  end;

  if not cdsData.Active then
  begin
    Raise Exception.Create('Нет данных!');
  end;

  lMR:= MessageBox(Handle, 'Все оплатные документы у выбранного докмуента будут отсоединены!', 'Внимание!', MB_YESNO+MB_ICONQUESTION);

  if lMR = mrYes then
  begin
    lFibQuery:= TMegaQuery.Create(Self);
    try
//      lFibQuery.Database:= FIBDataSet1.DataBase;
//      lFibQuery.Transaction:= FIBDataSet1.Transaction;
      lFibQuery.Transaction:= dm.trMainWShort;
      lFibQuery.options:= [qoStartTransaction,qoAutoCommit];

      Raise Exception.Create('Не присвоен набор данных');

      lFibQuery.Sql.Text:= sDelParentOplDocs;

      lFibQuery.Params.ByName['parent_recid'].AsInteger:= cdsData.FieldByName('DOCRECNO').AsInteger;
      lFibQuery.Params.ByName['parent_baseid'].AsInteger:= cdsData.FieldByName('BASEID').AsInteger;

      lFibQuery.ExecQuery;

      //lFibQuery.Transaction.CommitRetaining;

    finally
      lFibQuery.Free;
    end;

    lBM:= cdsData.Bookmark;
      PrepareGetOplQueries;
      ExecGetOplQueries;
    cdsData.Bookmark:= lBM;

  end;
end;

procedure TViewOperListForm2.actReturnsMakeShowFormExecute(Sender: TObject);
begin

  with TfmReturnsMake.Create(Application.MainForm,
                             KodDK,
                             StrToIntDef(MegaSelBalance.Value, 0),
                             MegaPeriodPanel.FromDate,
                             MegaPeriodPanel.TillDate            ) do
    Show;
end;

procedure TViewOperListForm2.actReturnsMakeShowFormUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (dsMain.DataSet.Active);
end;

procedure TViewOperListForm2.actRemoveOplDocExecute(Sender: TObject);
var
  lFibQuery: TMegaQuery;
  lMR: integer;
  lBM: TBookMarkStr;
const
  sDelOplDoc = 'delete from link_doc_opl where opl_recid = :opl_recid and opl_baseid = :opl_baseid and opl_form_type = :opl_form_type';
begin
  if DBGridEH1.SelectedRows.Count>1 then
  begin
    Raise Exception.Create('Должен быть выбран только один документ');
  end;

  if not cdsData.Active then
  begin
    Raise Exception.Create('Нет данных!');
  end;

  if cdsData.FieldByName('KREDIT_SUMMA').AsFloat = 0 then
  begin
    Raise Exception.Create('Операция невозможна!');
  end;

  lMR:= MessageBox(Handle, 'Данный документ больше не будет рассматриваться как оплатный. Продолжить?', 'Внимание!', MB_YESNO+MB_ICONQUESTION);

  if lMR = mrYes then
  begin
    lFibQuery:= TMegaQuery.Create(Self);
    try
      lFibQuery.Database:= FIBDataSetCurrentBase.Database;
      lFibQuery.Transaction:= dm.trMainWShort;
      lFibQuery.options:= [qoStartTransaction,qoAutoCommit];


//      lSelQuery.DataBase:= FIBDataSetCurrentBase.Database;
//      lSelQuery.Transaction:= FIBDataSetCurrentBase.Transaction;


     // Raise Exception.Create('Не установлена база данных');

      lFibQuery.Sql.Text:= sDelOplDoc;

      lFibQuery.Params.ByName['opl_recid'].AsInteger:= cdsData.FieldbyName('DOCRECNO').AsInteger;
      lFibQuery.Params.ByName['opl_baseid'].AsInteger := cdsData.FieldbyName('BASEID').AsInteger;
      lFibQuery.Params.ByName['opl_form_type'].AsInteger:= cdsData.FieldbyName('FormTYPE').AsInteger;

      lFibQuery.ExecQuery;

      //lFibQuery.Transaction.CommitRetaining;

    finally
      lFibQuery.Free;
    end;

    lBM:= cdsData.Bookmark;
    PrepareGetOplQueries;
    ExecGetOplQueries;
    cdsData.Bookmark:= lBM;

  end;
end;

procedure TViewOperListForm2.actSeparationMOExecute(Sender: TObject);
var
   rows:integer;
begin
  //
  try
      DM.ChangeQuery.Close;
      DM.ChangeQuery.SQL.Text := 'select count(*) cnt from PROC_SEPARATION_MO77(:DT)';
      DM.ChangeQuery.ParamByName('DT').asDateTime:= MegaPeriodPanel.TillDate;
      DM.ChangeQuery.ExecQuery;
      rows:= dm.ChangeQuery.FieldByName('cnt').asinteger;
      MessageBox(Handle,pchar('Разнесено '+intTOstr(rows)+' платежей! Нажмите "Расчитать" чтобы увидеть результат'), Pchar('Внимание!'), MB_OK+MB_ICONWARNING);
//      DM.SharedQuery.transaction.commitretaining;
  except
    on E: Exception do
    begin
       MessageBox(Handle, pchar(e.Message), Pchar('Внимание!'), MB_OK+MB_ICONWARNING);
    end;
  end;
end;

procedure TViewOperListForm2.actSetColorArrearsDocExecute(Sender: TObject);
begin
  //
end;

procedure TViewOperListForm2.ActshowErrorExecute(Sender: TObject);
begin
   ShowModal_PDVINC_DOC_ERR_NOTES(Self,nil,
                                  cdsData.FieldByName('DOCRECNO').Value,
                                  cdsData.FieldByName('BASEID').Value,
                                  cdsData.FieldByName('FormType').value);
end;

procedure TViewOperListForm2.ActshowErrorUpdate(Sender: TObject);
begin
   TAction(Sender).Enabled:=cdsData.Active and
                            (not cdsData.isEmpty) and
                            IsUkraine and IsOffice;
end;

procedure TViewOperListForm2.actShowLinkedDocsExecute(Sender: TObject);
begin
  if not cdsData.Active then
  begin
    Raise Exception.Create('Нет данных');
  end;
  ShowLinkedDocs(cdsData.FieldByName('DOCRECNO').AsInteger, cdsData.FieldByName('BASEID').AsInteger, cdsData.FieldByName('FORMTYPE').AsInteger);
end;

procedure TViewOperListForm2.actValyutaControlExecute(Sender: TObject);
begin
//
  N38.Checked := not N38.checked;
  DBGridEH1.FieldColumns['DAYVALCONTROL'].Visible := N38.Checked;
  DBGridEH1.FieldColumns['PROSR_SUM'].Visible := not(DBGridEH1.FieldColumns['PROSR_SUM'].Visible);
 // GetCalcDolg(1);
  CalculateExecute(nil);
end;

procedure TViewOperListForm2.actViewProtokolExecute(Sender: TObject);
begin
//
  DM.SYS_FORM_TYPES.Locate('FORM_KOD',cdsData.FieldByName('FORMTYPE').asInteger, []);
  if not cdsData.IsEmpty then TViewSysProtokolForm.Create(self,DM.SYS_FORM_TYPES.FieldByName('MAIN_TABLE').AsString,cdsData.FieldByName('DOCRECNO').AsString+'|'+cdsData.FieldByName('BASEID').AsString).ShowModal;
end;

procedure TViewOperListForm2.actZeroProvExecute(Sender: TObject);
 var
  i:integer;
  st,st1,st2:string;
  dd,dd1:Double;
begin
  //if not (DM.UserAccess in [0,5]) then exit;
  Query.Transaction.Active:=true;

  dd:=0;
  dd1:=0;
  if DBGridEh1.SelectedRows.Count=0 then exit;


  if (Application.MessageBox('Вы дейстивтельно хотите удалить проводки ?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES) then
  begin
    for i:=0 to DBGridEh1.SelectedRows.Count-1 do
    begin
      DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
      DM.WhatForm.Close;
      DM.WhatForm.Params[0].AsString := cdsData.FieldByName('DOCTYPE').AsString;
      DM.WhatForm.ExecQuery;
    // DM.WhatForm.Fields[0].AsString
      if DM.WhatForm.Fields[0].AsString = 'DOC_PROV' then
      begin
        Query.Close;
        Query.SQL.Text:='update '+DM.WhatForm.Fields[0].AsString;
        Query.SQL.Add('set summa = 0, summa1 = 0');
        Query.SQL.Add('where recid='+cdsData.FieldByName('DOCRECNO').AsString+' and baseid='+cdsData.FieldByName('BASEID').AsString);
        Query.ExecQuery;
        Query.Transaction.CommitRetaining;
      end
    end;
  end;
end;

procedure TViewOperListForm2.aPlatToRegExecute(Sender: TObject);
 var
  i:integer;
{  st,st1,st2,gon,kon,gon1,kon1:string;
  dd,dd1:Double;
  AUTO_OPL: Integer;}
  DK_BASEID:integer;
begin
  if not (DM.UserAccess in [0,5]) then exit;
  if DBGridEh1.SelectedRows.Count=0 then exit;
  if (Application.MessageBox('Отправить выделенные проводки в регион ?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDNO) then exit;

  Query.Transaction.Active:=false;
  Query.Transaction.Active:=true;

 for i:=0 to DBGridEh1.SelectedRows.Count-1 do
 begin
  DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
  DM.WhatForm.Close;
  DM.WhatForm.Params[0].AsString := cdsData.FieldByName('DOCTYPE').AsString;
  DM.WhatForm.ExecQuery;

  if DM.WhatForm.Fields[0].AsString='DOC_PROV' then
  begin
      Query.Close;
      Query.SQL.Text:='Select SDK.DK_BASEID from DOC_PROV DOC';
      Query.SQL.Add('left join sprav_dk sdk on (sdk.kod_dk=doc.DK_FROM)');
      Query.SQL.Add('where doc.recid='+cdsData.FieldByName('DOCRECNO').AsString+' and doc.baseid='+cdsData.FieldByName('BASEID').AsString);
      Query.ExecQuery;
      DK_BASEID:=Query.Fields[0].AsInteger;
      // для россии такое не надо ибо там все выставляется на триггере
      if  ((DK_BASEID>1) and (IntfMegaDBCommon.GetCountry<>iccRussia)) then
      begin

        Query.Close;
        Query.SQL.Text:='update DOC_PROV set state=20, REG_BASEID='+IntToStr(DK_BASEID);
        Query.SQL.Add('where recid='+cdsData.FieldByName('DOCRECNO').AsString+' and baseid='+cdsData.FieldByName('BASEID').AsString);
        Query.ExecQuery;

        Query.Close;
        Query.SQL.Text:='insert into SYS_PROTOKOL (USER_NAME, TABLE_NAME, CHANGE_TYPE, OLD_ID, NEW_ID) VALUES ('+
        #39+IntfMegaAccessManager.GetUserName+#39+',''DOC_PROV1'',''I'',0,'+#39+IntToStr(cdsData.FieldByName('DOCRECNO').AsInteger)+'|'+
        IntToStr(cdsData.FieldByName('BASEID').AsInteger)+'|'+IntToStr(DK_BASEID)+#39+')';
        Query.ExecQuery;
      end;
   end;
  end;
  Query.Transaction.CommitRetaining;
end;

procedure TViewOperListForm2.aPlatToRegUpdate(Sender: TObject);
begin
    tAction(sender).Visible:=IntfMegaDBCommon.IsOffice;
end;

procedure TViewOperListForm2.InitControls;
begin
//--
  MegaSelBalance.Open;
  MegaSelSchet.Open;
  MegaSelCFO.Open;
  MegaSelBrandCase1.Open;
  MegaSelBalance.Value:= DM.SpBalanceSource.DataSet.FieldByName('BALANCE_KOD').AsString;
  MegaSelSchet.Value := MegaSelSchet.ResultDataSet.FieldByName('SCHET_KOD').AsString;
  MegaSelContract.BalanceKod:=MegaSelBalance.ValueInt;
//--
end;

procedure TViewOperListForm2.MegaSelSchetChange(Sender: TObject);

begin
  if DK_FROM_CE.Enabled then
  begin
    if MegaSelSchet.ResultDataSet.FieldByName('SCHET_ADK').AsInteger <> 1 then
    begin
       KodDK := 0;
       DK_FROM_CE.Text := '';
    end;
  end;
  PanelDK.Visible := (MegaSelSchet.ResultDataSet.FieldByName('SCHET_ADK').AsInteger = 1);
  CalcHeaderPanelHeight;
  Panel7.Visible := (MegaSelSchet.ResultDataSet.FieldByName('SCHET_AMATER').AsInteger = 1);
  analitik_brand :=0;
  analitik_brand :=
  //liutils.iif(MegaSelSchet.ResultDataSet.FieldByName('schet_analitik2').AsInteger = Analitik_brandCase,2,0);
  (liutils.iif((MegaSelSchet.ResultDataSet.FieldByName('schet_analitik1').AsInteger = Analitik_brandCase),1,0) or
                            liutils.iif(MegaSelSchet.ResultDataSet.FieldByName('schet_analitik2').AsInteger = Analitik_brandCase,2,0) or
                            liutils.iif(MegaSelSchet.ResultDataSet.FieldByName('schet_analitik3').AsInteger = Analitik_brandCase,3,0) or
                            liutils.iif(MegaSelSchet.ResultDataSet.FieldByName('schet_analitik4').AsInteger = Analitik_brandCase,4,0) or
                            liutils.iif(MegaSelSchet.ResultDataSet.FieldByName('schet_analitik5').AsInteger = Analitik_brandCase,5,0)) ;
  analitik_ContractID:=0;
  analitik_ContractID:=
  (liutils.iif((MegaSelSchet.ResultDataSet.FieldByName('schet_analitik1').AsInteger = Analitik_Contract),1,0) or
                            liutils.iif(MegaSelSchet.ResultDataSet.FieldByName('schet_analitik2').AsInteger = Analitik_Contract,2,0) or
                            liutils.iif(MegaSelSchet.ResultDataSet.FieldByName('schet_analitik3').AsInteger = Analitik_Contract,3,0) or
                            liutils.iif(MegaSelSchet.ResultDataSet.FieldByName('schet_analitik4').AsInteger = Analitik_Contract,4,0) or
                            liutils.iif(MegaSelSchet.ResultDataSet.FieldByName('schet_analitik5').AsInteger = Analitik_Contract,5,0)) ;

  PanelFAnalitic.visible := (analitik_brand>0)or(analitik_ContractID>0);
  MegaSelBrandCase1.visible := (analitik_brand>0);
  MegaSelContract.visible := (analitik_ContractID>0);
  SetActiveMegaSelContract;
end;


procedure TViewOperListForm2.mniActOtherOperClick(Sender: TObject);
var  params: string;
iCurScreenState: Integer;
begin
params := FloatToStr(KodDK) + ',' + DateToStr(MegaPeriodPanel.FromDate) + ',' + DateToStr(MegaPeriodPanel.TillDate) + ','
                          + MegaSelBalance.Value + ',' + MegaSelSchet.Value + ',' + '60/1/64';
iCurScreenState := Screen.Cursor;
Screen.Cursor := crSQLWAIT;
try
  dmMegaReports.frxXLSExport1.FastExport:= False;
  dmMegaReports.MyCreateXLS(116, Now(), params);
finally
  Screen.Cursor := iCurScreenState;
  MessageBox(handle,'Выгрузка данных в файл завершена','Выгрузка данных',MB_OK);
end;
end;

procedure TViewOperListForm2.mniActPretensClick(Sender: TObject);
var  params: string;
iCurScreenState: Integer;
begin
params := FloatToStr(KodDK) + ',' + DateToStr(MegaPeriodPanel.FromDate) + ',' + DateToStr(MegaPeriodPanel.TillDate) + ','
                          + MegaSelBalance.Value + ',' + MegaSelSchet.Value + ',' + '!';
iCurScreenState := Screen.Cursor;
Screen.Cursor := crSQLWAIT;
try
  dmMegaReports.frxXLSExport1.FastExport:= False;
  dmMegaReports.MyCreateXLS(116, Now(), params);
finally
  Screen.Cursor := iCurScreenState;
  MessageBox(handle,'Выгрузка данных в файл завершена','Выгрузка данных',MB_OK);
end;
end;

procedure TViewOperListForm2.mniActTovarOperClick(Sender: TObject);
var  params: string;
iCurScreenState: Integer;
begin
params := FloatToStr(KodDK) + ',' + DateToStr(MegaPeriodPanel.FromDate) + ',' + DateToStr(MegaPeriodPanel.TillDate) + ','
                          + MegaSelBalance.Value + ',' + MegaSelSchet.Value + ',' + '60/5';
iCurScreenState := Screen.Cursor;
Screen.Cursor := crSQLWAIT;
try
  dmMegaReports.frxXLSExport1.FastExport:= False;
  dmMegaReports.MyCreateXLS(115, Now(), params);
finally
  Screen.Cursor := iCurScreenState;
  MessageBox(handle,'Выгрузка данных в файл завершена','Выгрузка данных',MB_OK);
end;
end;

procedure TViewOperListForm2.CalcHeaderPanelHeight;
var
  lHeight: integer;
begin
  lHeight:= MegaSelBalance.Height + MegaSelSchet.Height;
  if PanelDK.Visible then
  begin
    lHeight:= lHeight + PanelDK.Height;
  end;
  pnHeaderLeft.Height:= lHeight;
  pnHeader.Height:= lHeight;
end;

procedure TViewOperListForm2.FillSummaryParams(aq: TMegaQuery);
begin
  aq.Params.ByName['BALANCE'].AsInteger := StrToInt(MegaSelBalance.Value);
  aq.Params.ByName['SCHET'].AsString  := MegaSelSchet.Value;
  aq.Params.ByName['SUBSCHET'].AsString  := SubSchet;
  aq.Params.ByName['BDATE'].AsDateTime  := MegaPeriodPanel.FromDate;
  if MegaPeriodPanel.TillDate = 0 then DM.SYSDATEENDDATE.Value := Date;
  aq.Params.ByName['EDATE'].AsDateTime  := MegaPeriodPanel.TillDate;
  if KodMater <> 0
    then aq.Params.ByName['KODMATER'].AsDouble := KodMater
    else aq.Params.ByName['KODMATER'].AsVariant := null;
  if chbInBalanceValyut.Checked
     then aq.Params.ByName['VALYUTA'].AsInteger := 1
     else aq.Params.ByName['VALYUTA'].AsInteger := 0;
  aq.Params.ByName['CFO'].AsInteger:= StrToIntDef(MegaSelCFO.Value, -1);
  aq.Params.ByName['SUBCFO'].AsInteger:= StrToIntDef(MegaSelCFO.Value, -1);
  if MegaSelSchet.ResultDataSet.FieldByName('schet_analitik1').AsInteger = 1 then
     aq.Params.ByName['SCHET_ANALITIK1'].AsDouble:=KodDK;
  if  MegaSelContract.Value<>'' then
    aq.Params.ByName['SCHET_ANALITIK'+inttostr(analitik_ContractID)].AsDouble:=StrtoFloat(MegaSelContract.Value);
end;

procedure TViewOperListForm2.MakeMainDataSet;
begin
  if cdsData.Active then
  begin
    cdsData.EmptyDataSet;
  end;

  cdsData.IndexName:= '';

  cdsData.Close;
  cdsData.IndexDefs.Clear;

  if btnShowDebetNotEqualKredit.checked then
  begin
    with cdsData.IndexDefs.AddIndexDef do
      Fields := 'DEBET_SUMMA_TRUNC2;KREDIT_SUMMA_TRUNC2';
    with cdsData.IndexDefs.AddIndexDef do
      Fields := 'KREDIT_SUMMA_TRUNC2;DEBET_SUMMA_TRUNC2';
  end;

  cdsData.CreateDataSet;

  TFloatField(cdsData.FieldByName('DEBET_SUMMA')).DisplayFormat:=  sfCommonCurrency;
  TFloatField(cdsData.FieldByName('KREDIT_SUMMA')).DisplayFormat:= sfCommonCurrency;

end;

procedure TViewOperListForm2.MakeAndFillMainDataSet;
const
  sDKNameQueryText   = 'select SHORTNAME_DK from SPRAV_DK where KOD_DK = :KOD_DK';
  sFormTypeQueryText = 'select MAIN_TABLE from SPRAV_TDOC,SYS_FORM_TYPES where DOC_INHERITED=FORM_KOD and DOCTYPE=:DOCTYPE';
var
  i: integer;
  q, FormTypeQuery, NotesQuery, TTQuery: TMegaQuery;
begin
  cdsData.DisableControls;
  try
    DBGridEh1.FieldColumns['NOTES'].Visible := PrintCheckBox.Checked;
    DBGridEH1.FieldColumns['NOTES'].Title.TitleButton := PrintCheckBox.Checked; // add new nirs 20_05_2025
    DBGridEh1.FieldColumns['TT'].Visible:=PrintTTNameCheckBox.Checked;
    MakeMainDataSet;
    cdsData.Open;


    q:= TmEGAQuery.Create(Self);
    FormTypeQuery:=TmEGAQuery.Create(Self);
    NotesQuery:=TMegaQuery.Create(Self);
    TTQuery:=TMegaQuery.Create(Self);
    try
      q.DataBase:= DM.Money;
      q.Transaction:= DM.Transaction;

      q.SQL.Text:= sDKNameQueryText;
      q.Prepare;

      NotesQuery.DataBase:= DM.Money;
      NotesQuery.Transaction:= DM.Transaction;

      TTQuery.DataBase:= DM.Money;
      TTQuery.Transaction:= DM.Transaction;
      TTQuery.SQL.Text:=
          ' select '+
           '   sto.name stoname, '+
           '   sda.address sdaaddress, '+
           '   gdo.otsr '+
          ' from delivery_location dl '+
          ' left join doc_nakl dn on (dn.recid = dl.docrecno and dn.baseid = dl.baseid ) '+
          ' left join sprav_trade_outlet sto on (sto.recid = dl.outlet_recid and sto.baseid = dl.outlet_baseid) '+
          ' left join sprav_dk_address sda on (sda.recid = sto.addr_recid and sda.baseid = sto.addr_baseid) '+
          ' left join get_doc_otsr(dn.recid, dn.baseid, dl.formtype) gdo on 1=1 ' +
          ' '+
          ' where dl.formtype = :formtype '+
          '   and dl.baseid = :baseid '+
          '   and dl.docrecno = :docrecno '+
          ' ';
      TTQuery.Prepare;



      FormTypeQuery.DataBase:= DM.Money;
      FormTypeQuery.Transaction:= DM.Transaction;

      FormTypeQuery.SQL.Text:= sFormTypeQueryText;
      FormTypeQuery.Prepare;



      //получение оборотов из реестра
      if FGetDataFromReestr then
      begin
        FIBDataSetReestr.First;
        while not FIBDataSetReestr.EOF do
        begin
{ ---------------- Changed by Lion in 12.08.2008 --------------- }
{ Копировать нужно поля по именам, а не по индексам!!!! }
//          cdsData.Append;
//          for i:= 0 to cdsData.FieldCount - 1 - iNonExistentFieldCount do
//          begin
//            cdsData.Fields[i].Value:= FIBDataSetReestr.Fields[i].Value;
//          end;
          CopyRecordEx(FIBDataSetReestr, cdsData, True, nil, nil, True, True);
{ ----------- End of changing by Lion in 12.08.2008 ----------- }

          q.Close;
          q.Params.Byname['KOD_DK'].Value:= FIBDataSetReestr.FieldByName('KOD_DK').Value;
          q.ExecQuery;
          cdsData.FieldByName('DK_NAME').AsString:= q.FieldByName('SHORTNAME_DK').AsString;

          // добавляю колонку торговые точки
          If PrintTTNameCheckBox.Checked Then
            Begin
              TTQuery.Close;
              TTQuery.Params.ByName['BASEID'].AsInteger:=FIBDataSetReestr.FieldByName('BASEID').AsInteger;
              TTQuery.Params.ByName['formtype'].AsInteger:=FIBDataSetReestr.FieldByName('formtype').AsInteger;
              TTQuery.Params.ByName['docrecno'].AsString:=FIBDataSetReestr.FieldByName('docrecno').AsString;
              TTQuery.ExecQuery;
              if trim(TTQuery.FieldByName('stoname').AsString+TTQuery.FieldByName('sdaaddress').AsString) <> '' Then
                cdsData.FieldByName('TT').AsString:=
                    TTQuery.FieldByName('stoname').AsString+' ('+
                    TTQuery.FieldByName('sdaaddress').AsString+')';
            End;

        if chkOtsr.checked then
        begin
            TTQuery.Close;
            TTQuery.Params.ByName['BASEID'].AsInteger:=FIBDataSetReestr.FieldByName('BASEID').AsInteger;
            TTQuery.Params.ByName['formtype'].AsInteger:=FIBDataSetReestr.FieldByName('formtype').AsInteger;
            TTQuery.Params.ByName['docrecno'].AsString:=FIBDataSetReestr.FieldByName('docrecno').AsString;
            TTQuery.ExecQuery;
            cdsData.FieldByName('OTSR').value:= TTQuery.FieldByName('OTSR').value;

        end;
            
          if PrintCheckBox.Checked then
            Begin
              FormTypeQuery.Close;
              FormTypeQuery.Params.ByName['DOCTYPE'].AsString:=FIBDataSetReestr.FieldByName('DOCTYPE').AsString;
              FormTypeQuery.ExecQuery;
              if FormTypeQuery.FieldByName('MAIN_TABLE').AsString <> '' then
                begin
                  NotesQuery.Close;
                  NotesQuery.SQL.Text:='Select NOTES from '+FormTypeQuery.FieldByName('MAIN_TABLE').AsString+' where RECID=:RECID and BASEID=:BASEID and DOCTYPE=:DOCTYPE and OPERDATE=:OPERDATE';
                  NotesQuery.Prepare;
                  NotesQuery.Close;
                  NotesQuery.Params.ByName['RECID'].AsInteger:=FIBDataSetReestr.FieldByName('DOCRECNO').AsInteger;
                  NotesQuery.Params.ByName['BASEID'].AsInteger:=FIBDataSetReestr.FieldByName('BASEID').AsInteger;
                  NotesQuery.Params.ByName['DOCTYPE'].AsString:=FIBDataSetReestr.FieldByName('DOCTYPE').AsString;
                  NotesQuery.Params.ByName['OPERDATE'].AsDateTime:=FIBDataSetReestr.FieldByName('OPERDATE').AsDateTime;
                  NotesQuery.ExecQuery;
                  cdsData.FieldByName('NOTES').AsString:= NotesQuery.FieldByName('NOTES').AsString;
               end;
            End;
            if  (IntfMegaDBCommon.IsOffice) then
            begin
              FormTypeQuery.Close;
              FormTypeQuery.Params.ByName['DOCTYPE'].AsString:=FIBDataSetCurrentBase.FieldByName('DOCTYPE').AsString;
              FormTypeQuery.ExecQuery;
              if FormTypeQuery.FieldByName('MAIN_TABLE').AsString <> '' then
                begin
                  NotesQuery.Close;
                  NotesQuery.SQL.Text:='Select NOTES from '+FormTypeQuery.FieldByName('MAIN_TABLE').AsString+' where RECID=:RECID and BASEID=:BASEID and DOCTYPE=:DOCTYPE and OPERDATE=:OPERDATE';
                  NotesQuery.Prepare;
                  NotesQuery.Close;
                  NotesQuery.Params.ByName['RECID'].AsInteger:=FIBDataSetCurrentBase.FieldByName('DOCRECNO').AsInteger;
                  NotesQuery.Params.ByName['BASEID'].AsInteger:=FIBDataSetCurrentBase.FieldByName('BASEID').AsInteger;
                  NotesQuery.Params.ByName['DOCTYPE'].AsString:=FIBDataSetCurrentBase.FieldByName('DOCTYPE').AsString;
                  NotesQuery.Params.ByName['OPERDATE'].AsDateTime:=FIBDataSetCurrentBase.FieldByName('OPERDATE').AsDateTime;
                  NotesQuery.ExecQuery;
                  cdsData.FieldByName('NOTES').AsString:= NotesQuery.FieldByName('NOTES').AsString;
               end;
            end;
            

          cdsData.Post;
          FIBDataSetReestr.Next;
        end;
      end;


      //добивка по текущей базе
      FIBDataSetCurrentBase.First;
      while not FIBDataSetCurrentBase.EOF do
      begin
{ ---------------- Changed by Lion in 12.08.2008 --------------- }
{ Копировать нужно поля по именам, а не по индексам!!!! }
//        cdsData.Append;
//        for i:= 0 to cdsData.FieldCount - 1 - iNonExistentFieldCount do
//        begin
//          cdsData.Fields[i].Value:= FIBDataSetCurrentBase.Fields[i].Value;
//        end;
        CopyRecordEx(FIBDataSetCurrentBase, cdsData, True, nil, nil, True, True);
{ ----------- End of changing by Lion in 12.08.2008 ----------- }


        try
        cdsData.FieldByName('DEBET_MINUS_KREDIT').AsFloat :=
              FIBDataSetCurrentBaseDEBET_SUMMA.AsFloat -
              FIBDataSetCurrentBaseKREDIT_SUMMA.AsFloat;
        except
        end;

        q.Close;
        q.Params.Byname['KOD_DK'].AsDouble:= FIBDataSetCurrentBase.FieldByName('KOD_DK').AsFloat; // Value;
        q.ExecQuery;
        if FIBDataSetCurrentBase.FieldByName('KOD_DK').AsFloat<>0 then
         cdsData.FieldByName('DK_NAME').AsString:= q.FieldByName('SHORTNAME_DK').AsString
        else cdsData.FieldByName('DK_NAME').AsString:='';

        // добавляю колонку торговые точки
        If PrintTTNameCheckBox.Checked Then
          Begin
            TTQuery.Close;
            TTQuery.Params.ByName['BASEID'].AsInteger:=FIBDataSetCurrentBase.FieldByName('BASEID').AsInteger;
            TTQuery.Params.ByName['formtype'].AsInteger:=FIBDataSetCurrentBase.FieldByName('formtype').AsInteger;
            TTQuery.Params.ByName['docrecno'].AsString:=FIBDataSetCurrentBase.FieldByName('docrecno').AsString;
            TTQuery.ExecQuery;
            if trim(TTQuery.FieldByName('stoname').AsString+TTQuery.FieldByName('sdaaddress').AsString) <> '' Then
              cdsData.FieldByName('TT').AsString:=
                  TTQuery.FieldByName('stoname').AsString+' ('+
                  TTQuery.FieldByName('sdaaddress').AsString+')';
          End;

        if chkOtsr.checked then
        begin
            TTQuery.Close;
            TTQuery.Params.ByName['BASEID'].AsInteger:=FIBDataSetCurrentBase.FieldByName('BASEID').AsInteger;
            TTQuery.Params.ByName['formtype'].AsInteger:=FIBDataSetCurrentBase.FieldByName('formtype').AsInteger;
            TTQuery.Params.ByName['docrecno'].AsString:=FIBDataSetCurrentBase.FieldByName('docrecno').AsString;
            TTQuery.ExecQuery;
            cdsData.FieldByName('OTSR').value:= TTQuery.FieldByName('OTSR').value;

        end;

        if PrintCheckBox.Checked then
         begin
            FormTypeQuery.Close;
    //        FormTypeQuery.Params.ByName['RECID'].AsInteger:=cdsData.FieldByName('DOCRECNO').AsInteger;
    //        FormTypeQuery.Params.ByName['BASEID'].AsInteger:=cdsData.FieldByName('BASEID').AsInteger;
            FormTypeQuery.Params.ByName['DOCTYPE'].AsString:=cdsData.FieldByName('DOCTYPE').AsString;
    //        FormTypeQuery.Params.ByName['OPERDATE'].AsDateTime:=cdsData.FieldByName('OPERDATE').AsDateTime;
            FormTypeQuery.ExecQuery;
            if FormTypeQuery.FieldByName('MAIN_TABLE').AsString <> '' then
                begin
                    NotesQuery.Close;
                    NotesQuery.SQL.Text:='Select NOTES from '+FormTypeQuery.FieldByName('MAIN_TABLE').AsString+' where RECID=:RECID and BASEID=:BASEID and DOCTYPE=:DOCTYPE and OPERDATE=:OPERDATE';
                    NotesQuery.Prepare;
                    NotesQuery.Close;
                    NotesQuery.Params.ByName['RECID'].AsInteger:=cdsData.FieldByName('DOCRECNO').AsInteger;
                    NotesQuery.Params.ByName['BASEID'].AsInteger:=cdsData.FieldByName('BASEID').AsInteger;
                    NotesQuery.Params.ByName['DOCTYPE'].AsString:=cdsData.FieldByName('DOCTYPE').AsString;
                    NotesQuery.Params.ByName['OPERDATE'].AsDateTime:=cdsData.FieldByName('OPERDATE').AsDateTime;
                    NotesQuery.ExecQuery;
                    cdsData.FieldByName('NOTES').AsString:= NotesQuery.FieldByName('NOTES').AsString;
               end;
         end;



        cdsData.Post;
        FIBDataSetCurrentBase.Next;
      end;

      if (((chkProsrDolg.checked) or (CheckBox1.checked)) and (KodDK <> 0)) then
      begin
        GetCalcDolg(0);
      {  mdsArrearsDolg.close;
        mdsArrearsDolg.ParamByName('BDATE').asdatetime:=MegaPeriodPanel.FromDate;
        mdsArrearsDolg.ParamByName('EDATE').asdatetime:=MegaPeriodPanel.TillDate;
        mdsArrearsDolg.ParamByName('BALANCE_KOD').asinteger:=StrToInt(MegaSelBalance.Value);
        mdsArrearsDolg.ParamByName('SCHET').asString:=MegaSelSchet.Value;
        mdsArrearsDolg.ParamByName('KOD_DK').AsFloat:=KodDk;
        mdsArrearsDolg.ParamByName('sub').AsInteger:= liutils.iif(CheckBox3.checked,1,0);
        mdsArrearsDolg.open;
        mdsArrearsDolg.first;

        while not mdsArrearsDolg.eof do
        begin
          if cdsData.Locate('DOCRECNO;BASEID;FORMTYPE', VarArrayOf([
                 mdsArrearsDolg.FieldByName('DOCRECNO').AsInteger,
                 mdsArrearsDolg.FieldByName('BASEID').AsInteger,
                 mdsArrearsDolg.FieldByName('FORMTYPE').AsInteger]),[]) then
          begin
            cdsData.EDit;
            cdsData.FieldByName('OTSR').AsInteger := mdsArrearsDolg.FieldByName('OTSR_').AsInteger;
            cdsData.FieldByName('PROSR_SUM').AsFloat := mdsArrearsDolg.FieldByName('DOLG').AsFloat;
            cdsData.FieldByName('DAY_PROSR').AsInteger := abs(mdsArrearsDolg.FieldByName('day_prosr').AsInteger);
            cdsData.Post;
          end;
          mdsArrearsDolg.next;
        end;
        DBSumList1.RecalcAll;
        FPROSR_SUM := DBSumList1.SumCollection.Items[8].SumValue; }

        //,:EDATE,:BALANCE_KOD,:SCHET,:KOD_DK')
      end;
      if N38.Checked then
         GetCalcDolg(1);

    finally
      q.Free;

      FormTypeQuery.Free; // add new nirs 16_04_2024
      NotesQuery.Free; // add new nirs 16_04_2024
      TTQuery.Free; // add new nirs 16_04_2024
    end;
  finally
    cdsData.EnableControls;
  end;
end;

procedure TViewOperListForm2.RunSummaryQuery;
const
  sSumQueryText =
  ' SELECT '#13#10+
  ' BEGIN_REST, '#13#10+
  ' DEBET, '#13#10+
  ' KREDIT, '#13#10+
  ' END_REST, '#13#10+
  ' BEGIN_KOLICH, '#13#10+
  ' DEBET_KOLICH, '#13#10+
  ' KREDIT_KOLICH, '#13#10+
  ' END_KOLICH '#13#10+
  ' FROM C_OPERLIST_QUERY3(?BALANCE,?SCHET,?SUBSCHET,?BDATE,?EDATE,__KODDK__,?KODMATER,?VALYUTA,?CFO,?SUBCFO, ?USE_SUB_DEBITORS, ?SCHET_ANALITIK1, ?SCHET_ANALITIK2, ?SCHET_ANALITIK3, ?SCHET_ANALITIK4, ?SCHET_ANALITIK5)';
var
  S: Double;
  i:integer;
  st1:string;
  lQueryText: string;
  lq: TMegaQuery;

  f_debugmode: Boolean; // nirs for debug
  strlist :TStringList; // nirs for debug
begin
  lq:= TMegaQuery.Create(Self);
  try
    lq.DataBase   := DM.Money;
    lq.Transaction:= DM.Transaction;

    S:=0;
    lq.Close;

    lQueryText:= sSumQueryText;
    if KodDK <> 0 then  lQueryText:= ReplaceRegExpr('__KODDK__', lQueryText, FloatToStr(KodDK))
                  else  lQueryText:= ReplaceRegExpr('__KODDK__', lQueryText, 'NULL');
    lq.SQL.Text:= lQueryText;

    FillSummaryParams(lq);

    lq.Prepare;
    if (SpeedOper = -1) then
    begin
      lq.ExecQuery;
      if Edit1.Text <> '' then
      begin
        S := lq.FieldByName('BEGIN_REST').AsDouble;

        lq.FieldByName('BEGIN_REST').AsDouble:=0;
        lq.Close;
        lq.Params.ByName['SCHET'].AsString  := Edit1.Text;
        lq.ExecQuery;
        lq.FieldByName('BEGIN_REST').AsDouble := lq.FieldByName('BEGIN_REST').AsDouble + S;
      end;
      if (KodDk<>0) and (checkBox3.Checked or chkNumberDogovor.checked) then
      begin
        st1:=GetDKSTr('qwer',KodDK);
        for i:=0 to slDK.Count-1 do
        begin
          S := lq.FieldByName('BEGIN_REST').AsDouble;
          lq.FieldByName('BEGIN_REST').AsDouble:=0;
          lq.Close;
          lQueryText:= sSumQueryText;
          lQueryText:= ReplaceRegExpr('__KODDK__', lQueryText, slDK[i]);
          lq.SQL.Text:= lQueryText;
          FillSummaryParams(lq);

          lq.ExecQuery;

          lq.FieldByName('BEGIN_REST').AsDouble := lq.FieldByName('BEGIN_REST').AsDouble + S;

          if Edit1.Text <> '' then
          begin
            S := lq.FieldByName('BEGIN_REST').AsDouble;
            lq.FieldByName('BEGIN_REST').AsDouble:=0;
            lq.Close;

            lq.Params.ByName['SCHET'].AsString  := Edit1.Text;

            lq.ExecQuery;
            lq.FieldByName('BEGIN_REST').AsDouble := lq.FieldByName('BEGIN_REST').AsDouble + S;
          end;
        end;
      end;
      FBEGIN_REST:= lq.FieldByName('BEGIN_REST').AsDouble;
    end
    else begin
      FBEGIN_REST:= SpeedOper;
    end;

    f_debugmode := false; // !!!NOW IS DEBUG_off (must be set debug_off for text searching in source code *.pas before deploy)
    if(f_debugmode) then begin
      // begin debug nirs - special codes
      lq.SQL.SaveToFile('sqlrest.txt'); // debug nirs
      strlist := TStringList.Create; // debug nirs
      for i := 0 to lq.Params.Count - 1 do begin // debug nirs
        strlist.Add(lq.Params[i].Name + ' --- ' + lq.Params[i].AsString); // debug nirs
      end; // debug nirs
      strlist.SaveToFile('rest_par.txt'); // debug nirs
      strlist.Free;     // debug nirs
    end; // end debug nirs -- special codes

    //--
    FBEGIN_KOLICH  := lq.FieldByName('BEGIN_KOLICH').AsDouble;
    FDEBET         := DBSumList1.SumCollection.Items[1].SumValue;
    FKREDIT        := DBSumList1.SumCollection.Items[3].SumValue;
    FDEBET_KOLICH  := DBSumList1.SumCollection.Items[0].SumValue;
    FKREDIT_KOLICH := DBSumList1.SumCollection.Items[2].SumValue;

    FEND_REST      := FBEGIN_REST + FDEBET - FKREDIT;
    FEND_KOLICH    := FBEGIN_KOLICH + FDEBET_KOLICH - FKREDIT_KOLICH;

  finally
    lq.Free;
  end;
end;


procedure TViewOperListForm2.RunSummaryQueryWithReestr;
var
  lReestrOstDate: TDateTime;
begin
  FBEGIN_REST:= 0;

  if MegaPeriodPanel.FromDate > FReestrED then
    lReestrOstDate:= FReestrED+1
  else
    lReestrOstDate:= FReestrMinDate; //MegaPeriodPanel.FromDate;

  RunSummaryQueryWithReestrPart(
    DMR.dbReestr, DMR.trReestr,
    lReestrOstDate,  lReestrOstDate, 0);

  RunSummaryQueryWithReestrPart(
    dm.Money, dm.Transaction,
    FCurrentBaseOborotFromDate, FCurrentBaseOborotFromDate, FReestrED {+ 1 // 04.01.2002 lutsenko // закомментировал, т.к. терялся один день после реестра });

  FDEBET         := DBSumList1.SumCollection.Items[1].SumValue;
  FKREDIT        := DBSumList1.SumCollection.Items[3].SumValue;
  FDEBET_KOLICH  := DBSumList1.SumCollection.Items[0].SumValue;
  FKREDIT_KOLICH := DBSumList1.SumCollection.Items[2].SumValue;
  FEND_REST      := FBEGIN_REST + FDEBET - FKREDIT;
end;

procedure TViewOperListForm2.RunSummaryQueryWithReestrPart(
  aDataBase: TMegaBase; aTransaction: TMegaTransactionParent; aDateFrom,
  aDateTill, aEndDate: TDateTime);
const
  sQueryText =
    ' select '+
    '   SUM(BEGIN_SUMMA) SUM_BEGIN_SUMMA, SUM(END_SUMMA) SUM_END_SUMMA'+
    ' from raschdk_query_centre( '+
    '   :BALANCE, :SCHET, '+
    '   :BEGIN_DATE, :END_DATE, '+
    '   :GROUP_DK, :KOD_DK, '+
    '   :BALANCE_VALYUTA, '+
    '   :CFO_, :DK_CFO_, '+
    '  :ENDDATE) '+
    '';
var
  S: Double;
  i:integer;
  st1:string;
  lq: TMegaQuery;
begin
  lq:= TMegaQuery.Create(Self);
  try
    lq.DataBase   := aDataBase;
    lq.Transaction:= aTransaction;

    lq.SQL.Text:= sQueryText;

    lq.Params.ByName['BALANCE'].AsInteger := StrToInt(MegaSelBalance.Value);
    lq.Params.ByName['SCHET'].AsString  := MegaSelSchet.Value;
    lq.Params.ByName['BEGIN_DATE'].AsDateTime  := aDateFrom;
    lq.Params.ByName['END_DATE'].AsDateTime  := aDateTill;

    lq.Params.ByName['GROUP_DK'].AsVariant:= null;

    if KodDK <> 0 then  lq.Params.ByName['KOD_DK'].Value:= KodDK
                  else  lq.Params.ByName['KOD_DK'].AsVariant:= null;

    if chbInBalanceValyut.Checked
       then lq.Params.ByName['BALANCE_VALYUTA'].AsInteger := 1
       else lq.Params.ByName['BALANCE_VALYUTA'].AsInteger := 0;

    lq.Params.ByName['CFO_'].AsInteger:= -1;//StrToIntDef(MegaSelCFO.Value, -1);
    lq.Params.ByName['DK_CFO_'].AsInteger:= StrToIntDef(MegaSelCFO.Value, -1);

    lq.Params.ByName['ENDDATE'].AsDateTime:= aEndDate;//StrToDate('01.01.2001');//aEndDate;
    lq.ExecQuery;
    FBEGIN_REST:= FBEGIN_REST + lq.FieldByName('SUM_BEGIN_SUMMA').AsDouble;

    if Edit1.Text <> '' then
    begin
      lq.Params.ByName['BALANCE'].AsInteger := StrToInt(MegaSelBalance.Value);
      lq.Params.ByName['SCHET'].AsString  := Edit1.Text;
      lq.Params.ByName['BEGIN_DATE'].AsDateTime  := aDateFrom;
      lq.Params.ByName['END_DATE'].AsDateTime  := aDateTill;

      lq.Params.ByName['GROUP_DK'].AsVariant:= null;

      if KodDK <> 0 then  lq.Params.ByName['KOD_DK'].Value:= KodDK
                    else  lq.Params.ByName['KOD_DK'].AsVariant:= null;

      if chbInBalanceValyut.Checked
         then lq.Params.ByName['BALANCE_VALYUTA'].AsInteger := 1
         else lq.Params.ByName['BALANCE_VALYUTA'].AsInteger := 0;

      lq.Params.ByName['CFO_'].AsInteger:= -1;//StrToIntDef(MegaSelCFO.Value, -1);
      lq.Params.ByName['DK_CFO_'].AsInteger:= StrToIntDef(MegaSelCFO.Value, -1);

      lq.Params.ByName['ENDDATE'].AsDateTime:= aEndDate;//StrToDate('01.01.2001');//aEndDate;
      lq.ExecQuery;
      FBEGIN_REST:= FBEGIN_REST + lq.FieldByName('SUM_BEGIN_SUMMA').AsDouble;

    end;

    if (KodDk<>0) and (checkBox3.Checked or chkNumberDogovor.checked) and (not fF2MAin) then
    begin
      st1:=GetDKSTr('qwer',KodDK);
      for i:=0 to slDK.Count-1 do
      begin
        lq.FieldByName('SUM_BEGIN_SUMMA').AsDouble:=0;
        lq.Close;
        lq.Params.ByName['SCHET'].AsString  := MegaSelSchet.Value;
        lq.Params.ByName['KOD_DK'].Value := StrToFloat(slDK[i]);
        lq.ExecQuery;
        FBEGIN_REST:= FBEGIN_REST + lq.FieldByName('SUM_BEGIN_SUMMA').AsDouble;

        // ВТОРОЙ СЧЁТ !!!!
        if Edit1.Text <> '' then
        begin
          lq.FieldByName('SUM_BEGIN_SUMMA').AsDouble:=0;
          lq.Close;
          lq.Params.ByName['SCHET'].AsString  := Edit1.Text;
          lq.Params.ByName['KOD_DK'].Value := StrToFloat(slDK[i]);
          lq.ExecQuery;
          FBEGIN_REST:= FBEGIN_REST + lq.FieldByName('SUM_BEGIN_SUMMA').AsDouble;
        end;
      end;
    end;
//     else
//    begin
//        lq.ExecQuery;
//        FBEGIN_REST:= FBEGIN_REST + lq.FieldByName('SUM_BEGIN_SUMMA').AsDouble;
//    end;

  finally
    lq.Free;
  end;
end;

procedure TViewOperListForm2.aProvToRegExecute(Sender: TObject);
 var
  i:integer;
  REG_BASEID:integer;
begin
  if not (DM.UserAccess in [0,5]) then exit;
  if DBGridEh1.SelectedRows.Count=0 then exit;
  if (Application.MessageBox('Отправить выделенные проводки в регион ?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDNO) then exit;

  Query.Transaction.Active:=false;
  Query.Transaction.Active:=true;

 for i:=0 to DBGridEh1.SelectedRows.Count-1 do
 begin
  DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
  DM.WhatForm.Close;
  DM.WhatForm.Params[0].AsString := cdsData.FieldByName('DOCTYPE').AsString;
  DM.WhatForm.ExecQuery;

  if DM.WhatForm.Fields[0].AsString='DOC_PROV' then
  begin
      Query.Close;
      Query.SQL.Text:='Select doc.REG_BASEID from DOC_PROV DOC';
      Query.SQL.Add('where doc.recid='+cdsData.FieldByName('DOCRECNO').AsString+' and doc.baseid='+cdsData.FieldByName('BASEID').AsString);
      Query.ExecQuery;
      REG_BASEID:=Query.Fields[0].AsInteger;
      if  REG_BASEID>1 then
      begin
        Query.Close;
        Query.SQL.Text:='update DOC_PROV set state=20, REG_BASEID='+IntToStr(REG_BASEID);
        Query.SQL.Add('where recid='+cdsData.FieldByName('DOCRECNO').AsString+' and baseid='+cdsData.FieldByName('BASEID').AsString);
        Query.ExecQuery;

        Query.Close;
        Query.SQL.Text:='insert into SYS_PROTOKOL (USER_NAME, TABLE_NAME, CHANGE_TYPE, OLD_ID, NEW_ID) VALUES ('+
        #39+IntfMegaAccessManager.GetUserName+#39+',''DOC_PROV1'',''I'',0,'+#39+IntToStr(cdsData.FieldByName('DOCRECNO').AsInteger)+'|'+
        IntToStr(cdsData.FieldByName('BASEID').AsInteger)+'|'+IntToStr(REG_BASEID)+#39+')';
        Query.ExecQuery;
      end;
   end;
  end;
  Query.Transaction.CommitRetaining;
end;

procedure TViewOperListForm2.aProvToRegUpdate(Sender: TObject);
begin
    tAction(sender).Visible:=IntfMegaDBCommon.IsOffice;
end;

procedure TViewOperListForm2.actPrintOperList2AMaterExecute(
  Sender: TObject);
begin


  if {(TMenuItem(sender).Name='actPrintOperList2AMater_ENG')} IsUSA then frxRepMater.Variables.Variables['ENG']:=1
  else frxRepMater.Variables.Variables['ENG']:=0;

  frxRepMater.Variables.Variables['Balance']:= QuotedStr(MegaSelBalance.BalanceName);
  frxRepMater.Variables.Variables['Schet']:= QuotedStr(MegaSelSchet.Value);
  frxRepMater.Variables.Variables['SchetName']:= QuotedStr(MegaSelSchet.SchetName);
  frxRepMater.Variables.Variables['CFO']:= QuotedStr(MegaSelCFO.Value);
  frxRepMater.Variables.Variables['CFOName']:=  QuotedStr(MegaSelCFO.CFOName + ' - ' + MegaSelCFO.FieldCFOAdress.AsString);

  frxRepMater.Variables.Variables['DateFrom']:= QuotedStr(DateToStr(MegaPeriodPanel.FromDate));
  frxRepMater.Variables.Variables['DateTill']:= QuotedStr(DateToStr(MegaPeriodPanel.TillDate));

  frxRepMater.Variables.Variables['BeginSumma']  := FBEGIN_REST;
  frxRepMater.Variables.Variables['BeginKolich'] := FBEGIN_KOLICH;
  frxRepMater.Variables.Variables['EndSumma']    := FEND_REST;
  frxRepMater.Variables.Variables['EndKolich']   := FEND_KOLICH;

  frxRepMater.Variables.Variables['ValyutInfo']  := QuotedStr(GetValyutInfo);


  if CB_PrintReturn.Checked then
    frxRepMater.Variables.Variables['printreturn'] := 1
  else
    frxRepMater.Variables.Variables['printreturn'] := 0;
  frxRepMater.Variables.Variables['A_MATER']     := MegaSelSchet.ResultDataSet.FieldByName('SCHET_AMATER').AsInteger = 1;

  if pnStaticKODDK.Visible and Panel2.Visible then
    frxRepMater.Variables.Variables['DK_Name']:=QuotedStr(stDK.Caption)
   else
    if DK_FROM_CE.Visible and  (DK_FROM_CE.Text<>'')
     then frxRepMater.Variables.Variables['DK_Name']:=QuotedStr(DK_FROM_CE.Text)
     else frxRepMater.Variables.Variables['DK_Name']:=QuotedStr('');


  if DebugMode or (IntfMegaAccessManager.GetUserRole = 'DEVELOPER') then
    frxRepMater.DesignReport
   else
    frxRepMater.ShowReport;

end;

procedure TViewOperListForm2.actPrintPKOExecute(Sender: TObject);
var

  lbm: TBookmarkStr;
begin
//
  if DBGridEh1.SelectedRows.Count = 0 then
   if Ask('Будет произведена печать ВСЕХ документов.'+#13#10+'Продолжить?') <> idYes then
    Exit;

  lbm:= dsMain.dataset.Bookmark;
  dsMain.dataset.DisableControls;
  try
    dsMain.dataset.first;
    While not dsMain.dataset.Eof do
    try
      if (DBGridEh1.SelectedRows.Count = 0) or (DBGridEh1.SelectedRows.CurrentRowSelected) then
      begin
        // application.processmessages;
         if cdsData.FieldByName('FORMTYPE').AsInteger = idvProv then
         begin
           dmMegaReports.MyPrint(8,strtodate('01.12.2007'),cdsData.FieldByName('DOCRECNO').AsString+','+cdsData.FieldByName('BASEID').AsString);
         end;
      end;
    finally
      dsMain.dataset.Next;
    end;
  finally
    dsMain.dataset.Bookmark:= lbm;
    dsMain.dataset.EnableControls;
  end;
end;

procedure TViewOperListForm2.actPrintRKOExecute(Sender: TObject);
var

  lbm: TBookmarkStr;
begin
//
  if DBGridEh1.SelectedRows.Count = 0 then
   if Ask('Будет произведена печать ВСЕХ документов.'+#13#10+'Продолжить?') <> idYes then
    Exit;

  lbm:= dsMain.dataset.Bookmark;
  dsMain.dataset.DisableControls;
  try
    dsMain.dataset.first;
    While not dsMain.dataset.Eof do
    try
      if (DBGridEh1.SelectedRows.Count = 0) or (DBGridEh1.SelectedRows.CurrentRowSelected) then
      begin
        // application.processmessages;
         if cdsData.FieldByName('FORMTYPE').AsInteger = idvProv then
         begin
          // dmMegaReports.MyPrint(7,strtodate('01.12.2007'),cdsData.FieldByName('DOCRECNO').AsString+','+cdsData.FieldByName('BASEID').AsString);
          //[gsa:07082020] внес правку для печати с паспортными данными
          dmMegaReports.MyShow(97,strtodate('05.01.2018'),cdsData.FieldByName('DOCRECNO').AsString+','+cdsData.FieldByName('BASEID').AsString);
         end;
      end;
    finally
      dsMain.dataset.Next;
    end;
  finally
    dsMain.dataset.Bookmark:= lbm;
    dsMain.dataset.EnableControls;
  end;
end;

procedure TViewOperListForm2.actFindExpeditorExecute(Sender: TObject);
var
  ds: TMegaDSDocTTN;
begin
  if cdsData.FieldByName('FORMTYPE').AsInteger = idvNakl then
  begin
    ds:= TMegaDSDocTTN.Create(Self);
    try
      ds.DataBase:= IntfDBProvider.GetDB;
      ds.Transaction:= IntfDBProvider.getTrans;
      ds.OpenByNakl(
        cdsData.FieldByName('DOCRECNO').AsInteger,
        cdsData.FieldByName('BASEID').AsInteger);

      ShowMessage(Format(
        'Экспедитор по данной накладной : '#13#10+
        '%s - %s ',
        [ds.FieldExpeditorKod.AsString, ds.GetExpeditorName] ));
    finally
      ds.Free;
    end;
  end
  else begin
    Raise Exception.Create('Это не накладная! Просмотр экспедитора возможен только для накладных');
  end;
end;


procedure TViewOperListForm2.actPrintActSver2Execute(Sender: TObject);
var
  dm: TdmPrintActSver;
begin
  dm:= TdmPrintActSver.Create(Self);
  try
    PrintActSver2Init(dm,0, false);//16.12.2013 вернули воз-ть печати по операциям (Терещенко)
{ ----------------- Added by Lion in 25.03.2008 ---------------- }
//    dm.cdsData.IndexFieldNames:= 'OPERDATE;DOCTYPE;DOCNUM';
{ ----------- End of addition by Lion in 25.03.2008 ----------- }
    if FDebug then
      dm.Report.DesignReport
     else
      dm.Report.ShowReport;
  finally
    dm.Free;
  end;
end;

procedure TViewOperListForm2.actPrintActSverDocExecute(Sender: TObject);
var
  dm: TdmPrintActSver;
begin
  dm:= TdmPrintActSver.Create(Self);
  try
    PrintActSver2Init(dm, 0, true);
{ ----------------- Added by Lion in 25.03.2008 ---------------- }
//    dm.cdsData.IndexFieldNames:= 'OPERDATE;DOCTYPE;DOCNUM';
{ ----------- End of addition by Lion in 25.03.2008 ----------- }
    if FDebug then
      dm.Report.DesignReport
     else
      dm.Report.ShowReport;
  finally
    dm.Free;
  end;

end;

procedure TViewOperListForm2.PrintActSver2Init(aDM:TDataModule; aExport:Integer=0; aByDoc: boolean = false);
var
  dm: TdmPrintActSver;
  i: Integer;
begin
    dm:=TdmPrintActSver(aDM);
    dm.InitActSver(
      MegaPeriodPanel.FromDate,
      MegaPeriodPanel.TillDate,
      StrToIntDef(MegaSelBalance.Value, -1),
      StrToIntDef(MegaSelCFO.Value, -1),
      MegaSelSchet.Value,
      KodDk,
      DK_FROM_CE.Text,
      FBEGIN_REST,
      FDEBET,
      FKREDIT,
      FEND_REST,
      aExport
    );
    //Игнат К
    if DM.cdsData.Active then
      DM.cdsData.Close;
    DM.cdsData.CreateDataSet;
    cdsData.DisableControls;
    try
      cdsData.First;
         dm.qQueryRO.Close;
         dm.qQueryRO.SQL.Text:='select C_USER from PDV_NAKL_AMAKE_IGNORE_DOC where RECID=:ri and BASEID=:bi and FORMTYPE=:ft';
      while not cdsData.EOF do
      begin
         dm.qQueryRO.Close;
         dm.qQueryRO.ParamByName('ri').asInteger:=cdsData.FieldByName('DocRecNo').asInteger;
         dm.qQueryRO.ParamByName('bi').asInteger:=cdsData.FieldByName('BaseID').asInteger;
         dm.qQueryRO.ParamByName('ft').asInteger:=cdsData.FieldByName('FormType').asInteger;
         dm.qQueryRO.ExecQuery;
         if dm.qQueryRO.RecordCount<>0 then begin
             cdsData.Next;
             continue;
         end;
      //(IntfMegaDBCommon.GetCountry=iccRussia) and
    if (aByDoc) then //по документу
         if dm.cdsData.Locate('DOCRECNO;BaseID;FormType',
                               VarArrayOf(
                               [cdsData.FieldByName('DocRecNo').Value,
                                cdsData.FieldByName('BaseID').Value,
                                cdsData.FieldByName('FormType').Value])
                               ,[]) then

           begin
             dm.cdsData.Edit;
             dm.cdsData.FieldByName('Kolich_Debet').asFloat :=dm.cdsData.FieldByName('Kolich_Debet').asFloat +cdsData.FieldByName('Kolich_Debet').asFloat;
             dm.cdsData.FieldByName('Kolich_Kredit').asFloat:=dm.cdsData.FieldByName('Kolich_Kredit').asFloat+cdsData.FieldByName('Kolich_Kredit').asFloat;
             dm.cdsData.FieldByName('Debet_Summa').asFloat  :=dm.cdsData.FieldByName('Debet_Summa').asFloat  +cdsData.FieldByName('Debet_Summa').asFloat;
             dm.cdsData.FieldByName('Kredit_Summa').asFloat :=dm.cdsData.FieldByName('Kredit_Summa').asFloat +cdsData.FieldByName('Kredit_Summa').asFloat;

             dm.cdsData.FieldByName('Kolich_Debet1').asFloat :=dm.cdsData.FieldByName('Kolich_Debet1').asFloat +cdsData.FieldByName('Kolich_Debet').asFloat;
             dm.cdsData.FieldByName('Kolich_Kredit1').asFloat:=dm.cdsData.FieldByName('Kolich_Kredit1').asFloat+cdsData.FieldByName('Kolich_Kredit').asFloat;
             dm.cdsData.FieldByName('Debet_Summa1').asFloat  :=dm.cdsData.FieldByName('Debet_Summa1').asFloat  +cdsData.FieldByName('Debet_Summa').asFloat;
             dm.cdsData.FieldByName('Kredit_Summa1').asFloat :=dm.cdsData.FieldByName('Kredit_Summa1').asFloat +cdsData.FieldByName('Kredit_Summa').asFloat;

             dm.cdsData.Post;
             cdsData.Next;
             continue;
           end;
{ ---------------- Changed by Lion in 12.08.2008 --------------- }
{ Копировать нужно поля по именам, а не по индексам!!!! }
//        dm.cdsData.Append;
////        for i:= 0 to dm.cdsData.FieldCount - 1 - iNonExistentFieldCount do
//        for i:= 0 to cdsData.FieldCount - 1 - iNonExistentFieldCount do
//        begin
//          dm.cdsData.Fields[i].Value:= cdsData.Fields[i].Value;
//        end;
//        dm.cdsData.Post;
        CopyRecord(cdsData, dm.cdsData, True);
{ ----------- End of changing by Lion in 12.08.2008 ----------- }

        cdsData.Next;
      end;
    finally
      cdsData.EnableControls;
    end;
    //
end;

procedure TViewOperListForm2.PrintActSver3Init(aDM: TDataModule;
  aExport: Integer; aByDoc: boolean);
var
  dm: TdmPrintActSver;
  i: Integer;
  contract_id:Double;
begin
//
    if MegaSelContract.Value<>'' then contract_id:= strtofloat(MegaSelContract.Value)
    else  contract_id := 0.0;

    dm:=TdmPrintActSver(aDM);
    dm.InitActSver(
      MegaPeriodPanel.FromDate,
      MegaPeriodPanel.TillDate,
      StrToIntDef(MegaSelBalance.Value, -1),
      StrToIntDef(MegaSelCFO.Value, -1),
      MegaSelSchet.Value,
      KodDk,
      DK_FROM_CE.Text,
      FBEGIN_REST,
      FDEBET,
      FKREDIT,
      FEND_REST,
      aExport,
      liUtils.iif(((aExport=4) and (MegaSelContract.Value<>'')),contract_id,0.0)
    );
    //Игнат К
    if DM.cdsData.Active then
      DM.cdsData.Close;
    DM.cdsData.CreateDataSet;
    cdsData.DisableControls;
    try
      cdsData.First;
      while not cdsData.EOF do
      begin
      //(IntfMegaDBCommon.GetCountry=iccRussia) and
    if (aByDoc) then //по документу
         if dm.cdsData.Locate('DOCNUM;BaseID;FormType;OPERDATE',
                               VarArrayOf(
                               [cdsData.FieldByName('DOCNUM').Value,
                                cdsData.FieldByName('BaseID').Value,
                                cdsData.FieldByName('FormType').Value,
                                cdsData.FieldByName('OPERDATE').Value]
                                )
                               ,[]) then

           begin
             dm.cdsData.Edit;
             dm.cdsData.FieldByName('Kolich_Debet').asFloat :=dm.cdsData.FieldByName('Kolich_Debet').asFloat +cdsData.FieldByName('Kolich_Debet').asFloat;
             dm.cdsData.FieldByName('Kolich_Kredit').asFloat:=dm.cdsData.FieldByName('Kolich_Kredit').asFloat+cdsData.FieldByName('Kolich_Kredit').asFloat;
             dm.cdsData.FieldByName('Debet_Summa').asFloat  :=dm.cdsData.FieldByName('Debet_Summa').asFloat  +cdsData.FieldByName('Debet_Summa').asFloat;
             dm.cdsData.FieldByName('Kredit_Summa').asFloat :=dm.cdsData.FieldByName('Kredit_Summa').asFloat +cdsData.FieldByName('Kredit_Summa').asFloat;

             dm.cdsData.FieldByName('Kolich_Debet1').asFloat :=dm.cdsData.FieldByName('Kolich_Debet1').asFloat +cdsData.FieldByName('Kolich_Debet').asFloat;
             dm.cdsData.FieldByName('Kolich_Kredit1').asFloat:=dm.cdsData.FieldByName('Kolich_Kredit1').asFloat+cdsData.FieldByName('Kolich_Kredit').asFloat;
             dm.cdsData.FieldByName('Debet_Summa1').asFloat  :=dm.cdsData.FieldByName('Debet_Summa1').asFloat  +cdsData.FieldByName('Debet_Summa').asFloat;
             dm.cdsData.FieldByName('Kredit_Summa1').asFloat :=dm.cdsData.FieldByName('Kredit_Summa1').asFloat +cdsData.FieldByName('Kredit_Summa').asFloat;

             dm.cdsData.Post;
             cdsData.Next;
             continue;
           end;
{ ---------------- Changed by Lion in 12.08.2008 --------------- }
{ Копировать нужно поля по именам, а не по индексам!!!! }
//        dm.cdsData.Append;
////        for i:= 0 to dm.cdsData.FieldCount - 1 - iNonExistentFieldCount do
//        for i:= 0 to cdsData.FieldCount - 1 - iNonExistentFieldCount do
//        begin
//          dm.cdsData.Fields[i].Value:= cdsData.Fields[i].Value;
//        end;
//        dm.cdsData.Post;
        CopyRecord(cdsData, dm.cdsData, True);
{ ----------- End of changing by Lion in 12.08.2008 ----------- }

        cdsData.Next;
      end;
    finally
      cdsData.EnableControls;
    end;
    //

end;

procedure TViewOperListForm2.actPrintActSverExecute(Sender: TObject);
var
  dm: TdmPrintActSver;
begin
  dm:= TdmPrintActSver.Create(Self);
  try
    PrintActSver2Init(dm,0, true);
    if FDebug then
      dm.Report.DesignReport
     else
      dm.Report.ShowReport;
  finally
    dm.Free;
  end;
end;

procedure TViewOperListForm2.actPrintActSverNewExecute(Sender: TObject);
var acfo:Integer;
    aSub:Integer;
begin //
    if MegaSelCFO.Value=''
      then acfo:=1
      else acfo:=StrToInt(MegaSelCFO.Value);
    if CheckBox3.Checked
      then aSub:=1
      else aSub:=0;
 dmMegaReports.MyShow(113,MegaPeriodPanel.TillDate,   
                         [MegaSelBalance.ValueInt,
                          DateToStr(MegaPeriodPanel.FromDate),
                          DateToStr(MegaPeriodPanel.TillDate),
                          acfo,
                          MegaSelSchet.Value,
                          KodDk,
                          aSub],
                         7);
end;

procedure TViewOperListForm2.actPrintKassaBookExecute(Sender: TObject);
var
   //dmP:TdmPrintKassaU;
   v:variant;
begin
   if (Koddk=0)or(not PanelDK.Visible)
     then v:=Null
     else v:=Koddk;

   if MegaSelCFO.Value = '' Then
     Begin
       MessageDlg('Выберите, пожалуста, ЦФО', mtError,[mbOk],0);
       Exit;
     End;

   //dmP:=TdmPrintKassaU.Create(self);
   try
      {if FDebug
      then
      dmMegaReports.MyDesign(dmP.frxRCashier,['Звіт касира',
                                    StrToInt(MegaSelBalance.Value),
                                    MegaSelSchet.Value,
                                    StrToInt(MegaSelCFO.Value),
                                    DateTimeTostr(MegaPeriodPanel.FromDate),
                                    DateTimeTostr(MegaPeriodPanel.TillDate),v],7)

      else }
      dmMegaReports.MyShow(94,MegaPeriodPanel.FromDate,['Звіт касира',
                                    StrToInt(MegaSelBalance.Value),
                                    MegaSelSchet.Value,
                                    StrToInt(MegaSelCFO.Value),
                                    DateTimeTostr(MegaPeriodPanel.FromDate),
                                    DateTimeTostr(MegaPeriodPanel.TillDate),v],7);
   finally
   //   dmP.Free;
   end;
end;

procedure TViewOperListForm2.actPrintNotesExecute(Sender: TObject);
const
  sFormTypeQueryText = 'select MAIN_TABLE from SPRAV_TDOC,SYS_FORM_TYPES where DOC_INHERITED=FORM_KOD and DOCTYPE=:DOCTYPE';
var
  FormTypeQuery, NotesQuery: TMegaQuery;
begin
  {FormTypeQuery:=TmEGAQuery.Create(Self);
  FormTypeQuery.DataBase:= DM.Money;
  FormTypeQuery.Transaction:= DM.Transaction;

  FormTypeQuery.SQL.Text:= sFormTypeQueryText;
  FormTypeQuery.Prepare;
   }
  PrintCheckBox.checked:=true;
  MakeAndFillMainDataSet;
//  DBGridEh1.FieldColumns['NOTES'].Visible:=true;

  {FormTypeQuery.Close;
  FormTypeQuery.Params.ByName['DOCTYPE'].AsString:=FIBDataSetReestr.FieldByName('DOCTYPE').AsString;
  FormTypeQuery.ExecQuery;
  if FormTypeQuery.FieldByName('MAIN_TABLE').AsString <> '' then
    begin
      NotesQuery.Close;
      NotesQuery.SQL.Text:='Select NOTES from '+FormTypeQuery.FieldByName('MAIN_TABLE').AsString+' where RECID=:RECID and BASEID=:BASEID and DOCTYPE=:DOCTYPE and OPERDATE=:OPERDATE';
      NotesQuery.Prepare;
      NotesQuery.Close;
      NotesQuery.Params.ByName['RECID'].AsInteger:=FIBDataSetReestr.FieldByName('DOCRECNO').AsInteger;
      NotesQuery.Params.ByName['BASEID'].AsInteger:=FIBDataSetReestr.FieldByName('BASEID').AsInteger;
      NotesQuery.Params.ByName['DOCTYPE'].AsString:=FIBDataSetReestr.FieldByName('DOCTYPE').AsString;
      NotesQuery.Params.ByName['OPERDATE'].AsDateTime:=FIBDataSetReestr.FieldByName('OPERDATE').AsDateTime;
      NotesQuery.ExecQuery;
      cdsData.FieldByName('NOTES').AsString:= NotesQuery.FieldByName('NOTES').AsString;
   end; }
end;

procedure TViewOperListForm2.actPrintArkushExecute(Sender: TObject);
var
   //dmP:TdmPrintKassaU;
   v:variant;
begin
   if (Koddk=0)or(not PanelDK.Visible)
     then v:=Null
     else v:=Koddk;

   if MegaSelCFO.Value = '' Then
     Begin
       MessageDlg('Выберите, пожалуста, ЦФО', mtError,[mbOk],0);
       Exit;
     End;

   //dmP:=TdmPrintKassaU.Create(self);
   try                     //dmP.frxRCashier
      dmMegaReports.MyShow(94,MegaPeriodPanel.FromDate,['Вкладний аркуш касової книги',
                                    StrToInt(MegaSelBalance.Value),
                                    MegaSelSchet.Value,
                                    StrToInt(MegaSelCFO.Value),
                                    DateTimeTostr(MegaPeriodPanel.FromDate),
                                    DateTimeTostr(MegaPeriodPanel.TillDate),v],7);
   finally
      //dmP.Free;
   end;
end;

procedure TViewOperListForm2.actPrintBothExecute(Sender: TObject);
var
   //dmP:TdmPrintKassaU;
   v:variant;
begin
   if (Koddk=0)or(not PanelDK.Visible)
     then v:=Null
     else v:=Koddk;

   if MegaSelCFO.Value = '' Then
     Begin
       MessageDlg('Выберите, пожалуста, ЦФО', mtError,[mbOk],0);
       Exit;
     End;

   //dmP:=TdmPrintKassaU.Create(self);
   try                     //dmP.frxRCashierDepSheet
      dmMegaReports.MyShow(95,MegaPeriodPanel.FromDate,['',
                                    StrToInt(MegaSelBalance.Value),
                                    MegaSelSchet.Value,
                                    StrToInt(MegaSelCFO.Value),
                                    DateTimeTostr(MegaPeriodPanel.FromDate),
                                    DateTimeTostr(MegaPeriodPanel.TillDate),v],7);
   finally
      //dmP.Free;
   end;
end;

procedure TViewOperListForm2.ActPrintCheckPdv_83Execute(Sender: TObject);
var acfo:Integer;
    aSub:Integer;
begin //
    if MegaSelCFO.Value=''
      then acfo:=0
      else acfo:=StrToInt(MegaSelCFO.Value);
    if CheckBox3.Checked
      then aSub:=1
      else aSub:=0;
    dmMegaReports.MyShow(83,MegaPeriodPanel.TillDate,
                         [MegaSelBalance.ValueInt,
                          MegaSelSchet.Value,
                          acfo,
                          MegaPeriodPanel.FromDate,
                          MegaPeriodPanel.TillDate,
                          KodDk,
                          aSub],
                         7);
end;

procedure TViewOperListForm2.ActPrintCheckPdv_83Update(Sender: TObject);
begin
   TAction(Sender).Enabled:=//(IsUkraine or IsRussia)and
                            (KodMater=0) and (SubSchet='');
end;

procedure TViewOperListForm2.sbtAnalizClick(Sender: TObject);
var
  i : integer;
  fld : TField;
begin
  if sbtAnaliz.Down then
  begin
    cdsData.DisableControls;
    try
      dsSource.Close;
      dsSumGroup.Close;
      dsSum.Close;

(*      cdsData.First;
      while not cdsData.Eof do
      begin
        cdsData.Edit;
        cdsData.FieldByName('CHECKED').AsInteger := 0;
        cdsData.post;
        cdsData.next;
      end;
*)
      SortCds(cdsData,'DK_NAME;OSTATOK','');

      GroupSumCDS(
        TDataSet(cdsData),
        dsSource,
        dsSumGroup,
        dsSum,
        'DK_NAME',
        'KOR_SCHET',
        'DK_NAME;OSTATOK',
        'KOLICH_DEBET,DEBET_SUMMA,KOLICH_KREDIT,KREDIT_SUMMA,OSTATOK',
        'CHECKED'     );

      DBGridEH1.DataSource.DataSet:= dsSumGroup;
//      DBGridEH1.FooterRowCount:=0;
      dsSumGroup.EnableControls;
    finally
      cdsData.EnableControls;
    end;
  end
  else
  begin
//    DBGridEH1.FooterRowCount:=2;
    DBGridEH1.DataSource.DataSet := cdsData;
    dsSource.Close;
    dsSumGroup.Close;
    dsSum.Close;
  end;

end;

procedure TViewOperListForm2.sbtnPeriodClick(Sender: TObject);
var dlg:TDlgEnterPeriod;
begin
   dlg:=TDlgEnterPeriod.Create(self);
   try
      dlg.InitFrom_SysDateSource;
      if dlg.ShowModal=mrOk then
         dlg.saveFrom_SysDateSource;
   finally
      dlg.Free;
   end;
end;

procedure TViewOperListForm2.MegaSelBalanceChange(Sender: TObject);
begin
    if MegaSelBalance.Value<>''
       then MegaSelContract.BalanceKod:=MegaSelBalance.ValueInt
       else MegaSelContract.BalanceKod:=0;
    if MegaSelBalance.Enabled then
       SetActiveMegaSelContract;
end;

procedure TViewOperListForm2.MegaSelDKDialogChangeTO(Sender: TObject;
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

procedure TViewOperListForm2.N30Click(Sender: TObject);
begin
  actHighLightOplDocs1C.Checked:= not actHighLightOplDocs1C.Checked;

//  if actHighLightOplDocs1C.Checked then
//  begin
//    PrepareGetOplQueries;
//    cdsData.First;
//    while not cdsData.Eof do
//    begin
//      ExecGetOplQueries;
//      cdsData.Next;
//    end;
//  end;

  DBGridEH1.Refresh;
end;

procedure TViewOperListForm2.N3Click(Sender: TObject);
begin
    N3.Checked:=not N3.Checked;
    DBGridEH1.FieldColumns['KOD_DK'].Visible:=N3.Checked;
end;

procedure TViewOperListForm2.N41Click(Sender: TObject);
begin
   Recalc_OSTATOK;
end;

procedure TViewOperListForm2.actActDoneWorksExecute(Sender: TObject);
begin // акт выполненных работ
  if DebugMode or (IntfMegaAccessManager.GetUserRole = 'DEVELOPER') then
    dmMegaReports.MyDesign(38,date,
        ReplaceStr(FloatToStr(KodDK),',','.')+','+
        ReplaceStr(FloatToStr(FCurrentBaseOborotFromDate),',','.')+','+
        ReplaceStr(FloatToStr(FCurrentBaseOborotTillDate),',','.')+','+
        ReplaceStr(FloatToStr(FDEBET),',','.')
        , dm.Transaction)
   else
    dmMegaReports.MyShow(38,date,
        ReplaceStr(FloatToStr(KodDK),',','.')+','+
        ReplaceStr(FloatToStr(FCurrentBaseOborotFromDate),',','.')+','+
        ReplaceStr(FloatToStr(FCurrentBaseOborotTillDate),',','.')+','+
        ReplaceStr(FloatToStr(FDEBET),',','.')
        );

end;

procedure TViewOperListForm2.actActDoneWorksUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := IntfMegaDBCommon.IsOffice;
end;

procedure TViewOperListForm2.actActPrintCheckPdv_631_incomingExecute(
  Sender: TObject);
begin
    dmMegaReports.MyShow(84,MegaPeriodPanel.TillDate,
                         [MegaSelBalance.ValueInt,
                          MegaPeriodPanel.FromDate,
                          MegaPeriodPanel.TillDate,
                          KodDk],
                         4);
end;

procedure TViewOperListForm2.actActPrintCheckPdv_631_incomingUpdate(
  Sender: TObject);
begin
  TAction(Sender).Enabled:=IsOffice and
                           IsUkraine and
                           ( Copy( MegaSelSchet.Value,1,3)='631' )and
                           (KodDK <> 0);
end;

procedure TViewOperListForm2.actActPrintCheckPdv_incomingExecute(
  Sender: TObject);
begin //
   TfmBookSaleCheckDetail.Create(Application.MainForm,
                                 MegaSelBalance.ValueInt,
                                 ifThen(IsRussia,'19','644'),
                                 MegaPeriodPanel.FromDate,
                                 MegaPeriodPanel.TillDate,
                                 KodDK,
                                 CheckBox3.Checked and (KodDK<>0),
                                 false).Show;
end;

procedure TViewOperListForm2.actActPrintCheckPdv_incomingUpdate(
  Sender: TObject);
begin //
  TAction(Sender).Enabled:=IsOffice and
                           //IsUkraine and
                           (MegaSelSchet.ResultDataSet.FieldByName('SCHET_ADK').AsInteger = 1)and
                           (KodDK <> 0);
end;

procedure TViewOperListForm2.actAdd2ComplExecute(Sender: TObject);
var
  i: integer;
begin
  SharedTR.StartTransaction;
  try
    with DBGridEh1.DataSource.DataSet do
    begin
      for i:=0 to DbGridEh1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(DbGridEh1.SelectedRows.Items[i]));
        InsNakl2ComplPos(FieldByName('DOCRECNO').AsInteger,FieldByName('BASEID').AsInteger);
      end;
    end;
  finally
    SharedTr.Commit;
  end;
end;

procedure TviewOperListForm2.InsNAkl2ComplPos(aRecid,aBaseid:double);
begin
  try
    SharedQ.Close;
    SharedQ.SQL.Text :=
      'INSERT INTO DK_COMPLAINT_POS (COMPLAINT_RECID, COMPLAINT_BASEID, NAKL_RECID, NAKL_BASEID) VALUES (:COMPLAINT_RECID, :COMPLAINT_BASEID, :NAKL_RECID, :NAKL_BASEID)';
    SharedQ.ParamByName('COMPLAINT_RECID').AsFloat := aComplRECID;
    SharedQ.ParamByName('COMPLAINT_BASEID').AsFloat := aComplBASEID;
    SharedQ.ParamByName('NAKL_RECID').AsFloat := aRecid;
    SharedQ.ParamByName('NAKL_BASEID').AsFloat := aBaseid;
    SharedQ.ExecQuery;
  except
    on e:Exception do
    begin
      ShowMessage(e.Message);
    end;
    
  end;
end;


procedure TViewOperListForm2.actAdd2ComplUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ((IntfMegaAccessManager.GetUserRole='ST_BUHGALTER') or (IntfMegaDBCommon.IsOffice));
end;

procedure TViewOperListForm2.actChangeDateExecute(Sender: TObject);
var
  lDateDlg: TfmMegaSelDlg;
  lSc, i, lChanged: Integer;
  lTableName: String;
begin
  lDateDlg := TfmMegaSelDlg.Create(Self);
  lDateDlg.InitDKSelect(DM.Money, dM.Transaction, True);
  lDateDlg.Caption := 'Перенос документов на число...';

  if lDateDlg.ShowModal = mrOK then
  begin
    //ShowMessage('OK, Date:' + DateToStr(lDateDlg.lDate) + ', DK:' + format('%.0f', [lDateDlg.lKodDK]))
    lChanged := 0;
    lSc := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    DBGridEH1.SaveBookmark;
    DBGridEH1.DataSource.DataSet.DisableControls;
    try
      if not Query.Transaction.InTransaction then
        Query.Transaction.StartTransaction;
      for i:=0 to DBGridEh1.SelectedRows.Count-1 do
      try
        DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
        Query.Close;
        Query.SQL.Text := 'select main_table from sys_form_types where form_kod = ' + cdsData.FieldByName('FORMTYPE').AsString;
        Query.ExecQuery;
        if Query.FieldByName('MAIN_TABLE').AsString <> '' then
        begin
          lTableName := Query.FieldByName('MAIN_TABLE').AsString;
          Query.Close;
          Query.SQL.Text := 'update ' + lTableName + ' set operdate = :DT, DOCDATE = :DT where recid = :RECID and baseid = :BASEID';
          Query.ParamByName('RECID').AsInteger := cdsData.FieldByName('DOCRECNO').AsInteger;
          Query.ParamByName('BASEID').AsInteger := cdsData.FieldByName('BASEID').AsInteger;
          Query.ParamByName('DT').AsDate := lDateDlg.lDate;
          Query.ExecQuery;
          lChanged := lChanged + 1;
        end;
      except
        on e:Exception do
          ShowMessage('Ошибка при изменении дат: <' + e.Message + '>');
      end;
      Query.Transaction.Commit;
    finally
      DBGridEH1.RestoreBookmark;
      DBGridEH1.DataSource.DataSet.EnableControls;
      Screen.Cursor:= lSc;
    end;
    ShowMessage(format('Изменено %d документов.', [lChanged]));
  end
  else
    ShowMessage('Операция отменена.');
end;

procedure TViewOperListForm2.actChangeDateUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ((IntfMegaDBCommon.IsOffice)) AND (DBGridEh1.SelectedRows.Count > 0);
end;

procedure TViewOperListForm2.actChangeDk_cExecute(Sender: TObject);
 var
  i:integer;
  st,st1,st2:string;
  dd,dd1:Double;
begin
  if not (DM.UserAccess in [0,5]) then exit;
  Query.Transaction.Active:=true;

  dd:=0;
  dd1:=0;
  if DBGridEh1.SelectedRows.Count=0 then exit;
  if not GetDK2(DM.Money, dd,st) then exit;

  if (dd=0) or (st='') then exit;
//  Application.MessageBox('Перепровести проводки ?','Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES) then
  for i:=0 to DBGridEh1.SelectedRows.Count-1 do
  begin
    DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
    DM.WhatForm.Close;
    DM.WhatForm.Params[0].AsString := cdsData.FieldByName('DOCTYPE').AsString;
    DM.WhatForm.ExecQuery;
  // DM.WhatForm.Fields[0].AsString
    if dd1=0 then
    begin
      Query.Close;
      Query.SQL.Text:='Select DOC.DK_C, SDK.SHORTNAME_DK from '+DM.WhatForm.Fields[0].AsString+' DOC';
      Query.SQL.Add('left join sprav_dk sdk on (sdk.kod_dk=doc.DK_C)');
      Query.SQL.Add('where doc.recid='+cdsData.FieldByName('DOCRECNO').AsString+' and doc.baseid='+cdsData.FieldByName('BASEID').AsString);
      Query.ExecQuery;
      st1:='Заменить '+Query.Fields[1].AsString+' на '+st+'?';
      if Application.MessageBox(Pchar(st1),'Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES then
      begin
        dd1:=Query.Fields[0].AsDouble;
      end;
    end;

    if dd1=0 then exit;
    Query.Close;
    Query.SQL.Text:=' EXECUTE PROCEDURE SET_CONTEXT_VARIABLE(''CHANGE_PRESENT'', ''1'')';
    Query.ExecQuery;

    Query.Close;
    Query.SQL.Text:='update '+DM.WhatForm.Fields[0].AsString;
    Query.SQL.Add('set dk_C='+FloatToStr(dd));
    Query.SQL.Add('where recid='+cdsData.FieldByName('DOCRECNO').AsString+' and baseid='+cdsData.FieldByName('BASEID').AsString);
    Query.SQL.Add('and dk_C='+FloatToStr(dd1));
    Query.ExecQuery;

  end;

end;

procedure TViewOperListForm2.actClearKodDkExecute(Sender: TObject);
begin
//
  DK_FROM_CE.Text:= '' ;
  KodDk := 0;
end;

procedure TViewOperListForm2.cdsDataBeforePost(DataSet: TDataSet);
begin
  if ((cdsData.State in [dsEdit, dsInsert]) AND (CB_PrintReturn.Checked)) then
  try
    query.Close;
    query.sql.Text := 'select * from PROC_GET_LINK_NAKL(:RECID, :BASEID, :FORMTYPE)';
    query.ParamByName('RECID').AsInteger := cdsData.fieldByName('DOCRECNO').AsInteger;
    query.ParamByName('BASEID').AsInteger := cdsData.fieldByName('BASEID').AsInteger;
    query.ParamByName('FORMTYPE').AsInteger := cdsData.fieldByName('FORMTYPE').AsInteger;

    query.Transaction := dm.Transaction;
    try
      query.ExecQuery;
      if not query.Eof then
        if (query.FieldByName('RECID').ASInteger > 0) then
        begin
          cdsData.fieldByName('INOUT').AsInteger := query.FieldByName('INOUT').ASInteger;
          cdsData.fieldByName('RETURN_TEXT').AsString := '(№ ' + query.FieldByName('DOCNUMBER').asString + ' от ' + query.FieldByName('OPERDATE').AsString + ')';
          cdsData.fieldByName('DAYCOUNT').AsInteger := round(query.FieldByName('OPERDATE').ASDate - cdsData.fieldByName('operdate').AsDateTime) ;

        end;
    finally
      query.Close;
      query.Transaction := Transaction;
    end;
  except
    on e:exception do
      ShowMessage(e.Message);
  end;
end;


procedure TViewOperListForm2.cdsDataCalcFields(DataSet: TDataSet);
begin
//  cdsData.FieldByName('OSTATOK').
end;

procedure TViewOperListForm2.G1Click(Sender: TObject);
var
  Acc: string;
begin
  Acc:= '44/1/1';
  if not TfmSelAcc.Execute(Acc, MegaSelBalance) then Exit;

  frxBuhSpravka.Variables['BDate']:= QuotedStr(DateToStrEx(MegaPeriodPanel.FromDate));
  frxBuhSpravka.Variables['EDate']:= QuotedStr(DateToStrEx(MegaPeriodPanel.TillDate));
  frxBuhSpravka.Variables['AccKt']:= QuotedStr(MegaSelSchet.Value);
  frxBuhSpravka.Variables['Balance']:= QuotedStr(MegaSelBalance.Value);
  if MegaSelCFO.Value <> '' then
    frxBuhSpravka.Variables['CFO']:= VarToInt(MegaSelCFO.Value)
  else
    frxBuhSpravka.Variables['CFO']:= -1;


  frxBuhSpravka.Variables['AccDt']:= QuotedStr(Acc);
  if MegaSelSchet.Value = '97/0' then
  begin
    frxBuhSpravka.Variables['SutOper']:= QuotedStr('');
    frxBuhSpravka.Variables['SodergOper']:= QuotedStr('');
  end
  else
  begin
    frxBuhSpravka.Variables['SutOper']:= QuotedStr(StrChar(' ', 200));
    frxBuhSpravka.Variables['SodergOper']:= QuotedStr(StrChar(' ', 200));
  end;

  if IsDebug() then
    frxBuhSpravka.DesignReport()
  else
    frxBuhSpravka.ShowReport();
end;

procedure TViewOperListForm2.SetActiveMegaSelContract;
begin
  if KodDK=0 then
  begin
    MegaSelContract.Close;
    MegaSelContract.Enabled:=false;
    MegaSelContract.Value:='';
  end
  else
  begin
    MegaSelContract.Close;
    MegaSelContract.Value:='';
    MegaSelContract.Enabled:=true;
    if MegaSelContract.Visible then begin
       MegaSelContract.KodDK:=KodDK;
       MegaSelContract.OperDate:=0;
       MegaSelContract.Open;
    end;
  end;
end;

// begin add new procedure nirs 15_02_2023
// взято из TViewKartForm.APereprSelExecute
procedure TViewOperListForm2.actPereprSelExecute(Sender: TObject);
var
  LockDate:string;
  I : Integer;
  cdsSelected: TClientDataSet;
begin
try
  if Sender <> ADeleteProvSel then
  begin
    if Application.MessageBox('Перепровести проводки по выделенным документам в списке?',
                              'Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) <> IDYES then
      Exit;
  end
  else
  begin
    if Application.MessageBox('Удалить проводки по выделенным документам в списке?',
                              'Подтверждение', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) <> IDYES then
      Exit;
  end;

  // Создаю сдску, и поля к ней: DOCRECNO, BASEID, FORMTYPE 
  cdsSelected:= TClientDataSet.Create(Self);
  cdsSelected.Close;
  cdsSelected.Fields.Clear;
  cdsSelected.FieldDefs.Clear;
  cdsSelected.IndexDefs.Clear;
  With cdsSelected.FieldDefs.AddFieldDef Do
    Begin
      DataType := ftInteger;
      Name := 'DOCRECNO';
    End;
  With cdsSelected.FieldDefs.AddFieldDef Do
    Begin
      DataType := ftInteger;
      Name := 'BASEID';
    End;
  With cdsSelected.FieldDefs.AddFieldDef Do
    Begin
      DataType := ftInteger;
      Name := 'FORMTYPE';
    End;
  cdsSelected.CreateDataSet;

  // заполняю сдску
  cdsData.DisableControls;
  cdsData.First;
  while not cdsData.EOF do
  begin
    IF (DBGridEH1.SelectedRows.CurrentRowSelected) Then
      begin
        cdsSelected.Append;
        cdsSelected.FieldByName('DOCRECNO').Value := cdsData.FieldByName('DOCRECNO').Value;
        cdsSelected.FieldByName('BASEID').Value := cdsData.FieldByName('BASEID').Value;
        cdsSelected.FieldByName('FORMTYPE').Value := cdsData.FieldByName('FORMTYPE').Value;
        cdsSelected.Post;
      end;
    cdsData.Next;
  end;
  cdsData.EnableControls;

  Query.Transaction.Active := False;
  Query.Transaction.Active := True;

  Application.Hint:= 'Фаза 1: удаление проводок ...'; // added by lutsneko 01.07.2002

  cdsSelected.First;
  While Not cdsSelected.eof Do
    Begin
      Query.Close;
      Query.SQL.Text := 'EXECUTE PROCEDURE DELETE_PROV_DOC_NEW('+
      cdsSelected.FieldByName('DOCRECNO').AsString +', '+
      cdsSelected.FieldByName('BASEID').AsString+', '+
      cdsSelected.FieldByName('FORMTYPE').AsString+', null, 1)';
      Query.ExecQuery;

      cdsSelected.Next;
    End;

  if Sender <> ADeleteProvSel then
  begin
    Application.Hint:= 'Фаза 2: перепроведение документов ...'; //added by lutsenko 01.07.2002

    cdsSelected.First;
    while not cdsSelected.eof do
      begin
        Query.Close;
        Query.SQL.Text := 'EXECUTE PROCEDURE DELETE_PROV_DOC_NEW('+
        cdsSelected.FieldByName('DOCRECNO').AsString +', '+
        cdsSelected.FieldByName('BASEID').AsString+', '+
        cdsSelected.FieldByName('FORMTYPE').AsString+', null, 1)';
        Query.ExecQuery;

        Query.Close;
        //Query.SQL.Text := 'EXECUTE PROCEDURE PROV_POS_DOC(:DOC_INHERITED, :RECID, :BASEID, :POSRECID, :POSBASEID)';
        Query.SQL.Text := 'EXECUTE PROCEDURE PROV_DOC_NEW(:DOC_INHERITED, :RECID, :BASEID, null, null, null)';

        Query.Params.ByName['DOC_INHERITED'].AsString := cdsSelected.FieldByName('FORMTYPE').Value;
        Query.Params.ByName['RECID'].Value := cdsSelected.FieldByName('DOCRECNO').Value;
        Query.Params.ByName['BASEID'].AsString := cdsSelected.FieldByName('BASEID').Value;
        //Query.Params.ByName['POSRECID'].Value := FIBDataSet1.FieldByName('SUBDOCRECNO').Value;
        //Query.Params.ByName['POSBASEID'].Value := FIBDataSet1.FieldByName('BASEID').Value;
        Query.ExecQuery;

        cdsSelected.Next;
      end;
  end;

  DBGridEH1.Update;

  if Query.Transaction.InTransaction then
    Query.Transaction.Commit;

  if Sender <> ADeleteProvSel then
    CalculateExecute(nil);

  Application.Hint:= ''; //added by lutsenko 01.07.2002

  cdsSelected.Destroy;
except
  on E: Exception do
  begin
    Query.Transaction.Rollback;
    CalculateExecute(nil);
    MessageDlg('В процессе выполнения возникла следующая ошибка:'#13#10+
               E.Message, mtError, [mbok],0);

    Application.Hint:= E.Message; //added by lutsenko 01.07.2002
  end;
end;
end;
// end add new procedure nirs 15_02_2023


end.
