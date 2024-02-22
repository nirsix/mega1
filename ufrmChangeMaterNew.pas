
unit ufrmChangeMaterNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer,
  cxTLData, cxDBTL, dxBar, cxClasses, cxSplitter, ExtCtrls, uMegaForms,
  uMegaCustomDialog, uMegaSelectMater, ActnList, DB, FIBDataSet, pFIBDataSet,
  uMegaRDataSet, cxMaskEdit, Menus, cxPC, dxBarBuiltInMenu, Grids, Outline,
  DBGrids, cxDropDownEdit, cxFilterControl, cxDBFilterControl, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, uMegaGrid, ComCtrls, dxtree, dxdbtree, TntDBGrids,
  DBVertGridsEh, StdCtrls, FIBQuery, pFIBQuery, uTypes;

type
  TfrmChangeMaterNew = class(TMegaForm)
    pnl1: TPanel;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarManager1Bar2: TdxBar;
    dxBarDockControl1: TdxBarDockControl;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    MegaSelMaterDialog1: TMegaSelMaterDialog;
    ActionList1: TActionList;
    actAddMoveUp: TAction;
    actAddMoveDown: TAction;
    mdsChangeMater: TMegaRDataSet;
    dsChangeMater: TDataSource;
    mdsChangeMaterKOD_MATER: TFIBFloatField;
    mdsChangeMaterKOD_MATER_PARENT: TFIBFloatField;
    mdsChangeMaterACTIVE_: TFIBSmallIntField;
    mdsChangeMaterNAME_MATER: TFIBStringField;
    mdsChangeMaterNAME_MATER_PARENT: TFIBStringField;
    pm1: TPopupMenu;
    actMoveUp1: TMenuItem;
    actMoveDown1: TMenuItem;
    actAddCur: TAction;
    dxBarButton4: TdxBarButton;
    N1: TMenuItem;
    actDelete: TAction;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    actRefresh: TAction;
    mdsChangeMaterGROUP_NAME: TFIBStringField;
    mdsChangeMaterSHORTNAME_MATER: TFIBStringField;
    mdsChangeMaterSHORT_NAME_MATER_P: TFIBStringField;
    cxstylrpstry1: TcxStyleRepository;
    cxstyl1: TcxStyle;
    cxstyl2: TcxStyle;
    pc: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxDBTreeListChangeMaterEDI: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeListColumn5: TcxDBTreeListColumn;
    cxDBTreeListColumn6: TcxDBTreeListColumn;
    cxDBTreeListColumn7: TcxDBTreeListColumn;
    cxDBTreeListColumn8: TcxDBTreeListColumn;
    mdsChangeMaterEDI: TMegaRDataSet;
    FIBFloatField1: TFIBFloatField;
    FIBFloatField2: TFIBFloatField;
    FIBSmallIntField1: TFIBSmallIntField;
    FIBStringField1: TFIBStringField;
    FIBStringField2: TFIBStringField;
    FIBStringField3: TFIBStringField;
    FIBStringField4: TFIBStringField;
    FIBStringField5: TFIBStringField;
    dsChangeMaterEDI: TDataSource;
    cxDBTreeListChangeMater: TcxDBTreeList;
    cxDBTreeListChangeMaterGROUP_NAME: TcxDBTreeListColumn;
    cxDBTreeListChangeMaterKOD_MATER: TcxDBTreeListColumn;
    cxDBTreeListChangeMaterKOD_MATER_PARENT: TcxDBTreeListColumn;
    cxDBTreeListChangeMaterACTIVE_: TcxDBTreeListColumn;
    cxDBTreeListChangeMaterNAME_MATER: TcxDBTreeListColumn;
    cxDBTreeListChangeMaterNAME_MATER_PARENT: TcxDBTreeListColumn;
    cxDBTreeListChangeMaterSHORTNAME_MATER: TcxDBTreeListColumn;
    cxDBTreeListChangeMaterSHORT_NAME_MATER_P: TcxDBTreeListColumn;
    pnFiltr: TPanel;
    lbFiltr: TLabel;
    cbFiltr: TComboBox;
    mqFiltr: TMegaRDataSet;
    cxDBTreeListChangeMaterDESTCOUNTRY_NAME: TcxDBTreeListColumn;
    cxDBTreeListColumn9: TcxDBTreeListColumn;
    mdsChangeMaterDESTCOUNTRY_NAME: TStringField;
    mdsChangeMaterEDIDESTCOUNTRY_NAME: TStringField;
    procedure actAddMoveUpExecute(Sender: TObject);
    procedure actAddMoveDownExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddCurExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure cbFiltrChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fillCb;
  end;

var
  frmChangeMaterNew: TfrmChangeMaterNew;

implementation

{$R *.dfm}

procedure TfrmChangeMaterNew.actAddCurExecute(Sender: TObject);
var 
  ANode: TcxDBTreeListNode; 
begin 
  if Application.MessageBox('Вы действительно хотите добавить ценность как основную?','Внимание', MB_YESNO + MB_ICONQUESTION) = ID_NO then
    Exit;
  if pc.ActivePageIndex = 0 then
   begin
     ANode := TcxDBTreeListNode(cxDBTreeListChangeMater.FocusedNode);//выделенный узел, который нужно поднять на уровень вверх
     if ANode.ParentKeyValue = 0 then exit;//нулевой уровень, выше уже некуда переносить
     if MegaSelMaterDialog1.Execute then
      begin
       mdsChangeMater.DisableControls;
       if not (mdsChangeMater.State in [dsEdit,dsInsert]) then
          mdsChangeMater.Insert;

       mdsChangeMater.FieldByName('Kod_mater').Value:= MegaSelMaterDialog1.KodMater;
       mdsChangeMater.FieldByName('name_mater').Value:= MegaSelMaterDialog1.NameMater;
       mdsChangeMater.FieldByName('ACTIVE_').Value:= 1;

       mdsChangeMater.Post;
       mdsChangeMater.CloseOpen(true);
       mdsChangeMater.EnableControls;
      end;

    ANode.Focused := true;
    cxDBTreeListChangeMater.SetFocus;
  end
  else
  begin
    ANode := TcxDBTreeListNode(cxDBTreeListChangeMaterEDI.FocusedNode);//выделенный узел, который нужно поднять на уровень вверх
    if ANode.ParentKeyValue = 0 then exit;//нулевой уровень, выше уже некуда переносить

    if MegaSelMaterDialog1.Execute then
     begin
       mdsChangeMaterEDI.DisableControls;

       if not (mdsChangeMaterEDI.State in [dsEdit,dsInsert]) then
          mdsChangeMaterEDI.Insert;

       mdsChangeMaterEDI.FieldByName('Kod_mater').Value:= MegaSelMaterDialog1.KodMater;
       mdsChangeMaterEDI.FieldByName('name_mater').Value:= MegaSelMaterDialog1.NameMater;
       mdsChangeMaterEDI.FieldByName('ACTIVE_').Value:= 1;
       
       mdsChangeMaterEDI.Post;
       mdsChangeMaterEDI.CloseOpen(true);
       mdsChangeMaterEDI.EnableControls;
     end;

    ANode.Focused := true;
    cxDBTreeListChangeMaterEDI.SetFocus;
  end;
end;

procedure TfrmChangeMaterNew.actAddMoveDownExecute(Sender: TObject);
var
  ANode: TcxDBTreeListNode;
begin

  if Application.MessageBox('Вы действительно хотите добавить ценность как подчиненную текущей?','Внимание', MB_YESNO + MB_ICONQUESTION) = ID_NO then
    Exit;
  if pc.ActivePageIndex = 0 then
   begin
     ANode := TcxDBTreeListNode(cxDBTreeListChangeMater.FocusedNode);//выделенный узел, который нужно поднять на уровень вверх
     if ANode.ParentKeyValue = 0 then exit;//нулевой уровень, выше уже некуда переносить

     if MegaSelMaterDialog1.Execute then
      begin
       mdsChangeMater.DisableControls;

       if mdsChangeMater.Locate('KOD_MATER_PARENT',TcxDBTreeListNode(ANode).KeyValue,[]) then
       begin
         if not (mdsChangeMater.State in [dsEdit,dsInsert]) then
             mdsChangeMater.Edit;
         mdsChangeMater.FieldByName('KOD_MATER_PARENT').Value:= MegaSelMaterDialog1.KodMater;
         mdsChangeMater.Post;
       end;
       if not (mdsChangeMater.State in [dsEdit,dsInsert]) then
          mdsChangeMater.Insert;

       mdsChangeMater.FieldByName('Kod_mater').Value:= MegaSelMaterDialog1.KodMater;
       mdsChangeMater.FieldByName('name_mater').Value:= MegaSelMaterDialog1.NameMater;
       mdsChangeMater.FieldByName('KOD_MATER_PARENT').Value:= TcxDBTreeListNode(ANode).KeyValue;
       mdsChangeMater.FieldByName('ACTIVE_').Value:= 1;
       mdsChangeMater.Post;

       mdsChangeMater.CloseOpen(true);
       mdsChangeMater.EnableControls;
      end;

     ANode.Focused := true;
     cxDBTreeListChangeMater.SetFocus;
   end
   else
   begin
     ANode := TcxDBTreeListNode(cxDBTreeListChangeMaterEDI.FocusedNode);//выделенный узел, который нужно поднять на уровень вверх
     if ANode.ParentKeyValue = 0 then exit;//нулевой уровень, выше уже некуда переносить

     if MegaSelMaterDialog1.Execute then
      begin
       mdsChangeMaterEDI.DisableControls;

       if mdsChangeMaterEDI.Locate('KOD_MATER_PARENT',TcxDBTreeListNode(ANode).KeyValue,[]) then
       begin
         if not (mdsChangeMaterEDI.State in [dsEdit,dsInsert]) then
             mdsChangeMaterEDI.Edit;
         mdsChangeMaterEDI.FieldByName('KOD_MATER_PARENT').Value:= MegaSelMaterDialog1.KodMater;
         mdsChangeMaterEDI.Post;
       end;
       if not (mdsChangeMaterEDI.State in [dsEdit,dsInsert]) then
          mdsChangeMaterEDI.Insert;

       mdsChangeMaterEDI.FieldByName('Kod_mater').Value:= MegaSelMaterDialog1.KodMater;
       mdsChangeMaterEDI.FieldByName('name_mater').Value:= MegaSelMaterDialog1.NameMater;
       mdsChangeMaterEDI.FieldByName('KOD_MATER_PARENT').Value:= TcxDBTreeListNode(ANode).KeyValue;
       mdsChangeMaterEDI.FieldByName('ACTIVE_').Value:= 1;
       mdsChangeMaterEDI.Post;

       mdsChangeMaterEDI.CloseOpen(true);
       mdsChangeMaterEDI.EnableControls;
      end;

     ANode.Focused := true;
     cxDBTreeListChangeMaterEDI.SetFocus;
   end;
end;

procedure TfrmChangeMaterNew.actAddMoveUpExecute(Sender: TObject);
var
  ANode: TcxDBTreeListNode;
begin

  if Application.MessageBox('Вы действительно хотите добавить ценность как родительскую к текущей?','Внимание', MB_YESNO + MB_ICONQUESTION) = ID_NO then
    Exit;
  if pc.ActivePageIndex = 0 then
   begin
    ANode := TcxDBTreeListNode(cxDBTreeListChangeMater.FocusedNode);//выделенный узел, который нужно поднять на уровень вверх
    if ANode.ParentKeyValue = 0 then exit;//нулевой уровень, выше уже некуда переносить

    if MegaSelMaterDialog1.Execute then
     begin
       mdsChangeMater.DisableControls;
       if not (mdsChangeMater.State in [dsEdit,dsInsert]) then
           mdsChangeMater.Edit;

       mdsChangeMater.FieldByName('KOD_MATER_PARENT').Value:= MegaSelMaterDialog1.KodMater;
       mdsChangeMater.Post;
       if not (mdsChangeMater.State in [dsEdit,dsInsert]) then
          mdsChangeMater.Insert;

       mdsChangeMater.FieldByName('Kod_mater').Value:= MegaSelMaterDialog1.KodMater;
       mdsChangeMater.FieldByName('name_mater').Value:= MegaSelMaterDialog1.NameMater;
       mdsChangeMater.FieldByName('ACTIVE_').Value:= 1;
       if ANode.ParentKeyValue <> null then
          mdsChangeMater.FieldByName('KOD_MATER_PARENT').Value:=  TcxDBTreeListNode(ANode).ParentKeyValue;

       mdsChangeMater.Post;

       mdsChangeMater.CloseOpen(true);
       mdsChangeMater.EnableControls;
     end;
{  if ANode.Parent <> nil then//проверяем существование родителя
    with TpFibDataSet(cxDBTreeListChangeMater.DataController.DataSource.DataSet) do
    begin 
      DisableControls;
      Edit;
      //TcxDBTreeListNode(ANode.Parent).ParentKeyValue - значение ключевого поля нового родителя
      FBN('KOD_MATER_PARENT').Value := TcxDBTreeListNode(ANode.Parent).ParentKeyValue;//нужно переместить на уровень выше своего родителя.
      FBN('KOD_MATER').Value := TcxDBTreeListNode(ANode).KeyValue;//какой узел перемещаем
      Post; 
      EnableControls;
    end//with 
  else 
    with TpFibDataSet(cxDBTreeListChangeMater.DataController.DataSource.DataSet) do
    begin//если у родителя нет родителя, то перемещение происходит со 1го на нулевой уровень, а значит parent = 0 
        DisableControls; 
        Edit;
        FBN('KOD_MATER_PARENT').Value := 0;//перемещаем на самый верхний уровень 
        FBN('KOD_MATER').Value := TcxDBTreeListNode(ANode).KeyValue;//какой узел перемещаем
        Post;
        EnableControls;
    end;//with }

    ANode.Focused := true;
    cxDBTreeListChangeMater.SetFocus;
   end
   else
   begin
    ANode := TcxDBTreeListNode(cxDBTreeListChangeMaterEDI.FocusedNode);//выделенный узел, который нужно поднять на уровень вверх
    if ANode.ParentKeyValue = 0 then exit;//нулевой уровень, выше уже некуда переносить

    if MegaSelMaterDialog1.Execute then
     begin
       mdsChangeMaterEDI.DisableControls;
       if not (mdsChangeMaterEDI.State in [dsEdit,dsInsert]) then
           mdsChangeMaterEDI.Edit;

       mdsChangeMaterEDI.FieldByName('KOD_MATER_PARENT').Value:= MegaSelMaterDialog1.KodMater;
       mdsChangeMaterEDI.Post;
       if not (mdsChangeMaterEDI.State in [dsEdit,dsInsert]) then
          mdsChangeMaterEDI.Insert;

       mdsChangeMaterEDI.FieldByName('Kod_mater').Value:= MegaSelMaterDialog1.KodMater;
       mdsChangeMaterEDI.FieldByName('name_mater').Value:= MegaSelMaterDialog1.NameMater;
       mdsChangeMaterEDI.FieldByName('ACTIVE_').Value:= 1;
       if ANode.ParentKeyValue <> null then
          mdsChangeMaterEDI.FieldByName('KOD_MATER_PARENT').Value:=  TcxDBTreeListNode(ANode).ParentKeyValue;

       mdsChangeMaterEDI.Post;

       mdsChangeMaterEDI.CloseOpen(true);
       mdsChangeMaterEDI.EnableControls;
     end;

    ANode.Focused := true;
    cxDBTreeListChangeMaterEDI.SetFocus;
   end;
end;

procedure TfrmChangeMaterNew.actDeleteExecute(Sender: TObject);
var
  ANode: TcxDBTreeListNode;
begin
  // if ANode.ParentKeyValue <> null then
  if Application.MessageBox('Вы действительно хотите удалить ценность?','Внимание', MB_YESNO + MB_ICONQUESTION) = ID_NO then
    Exit;
  if pc.ActivePageIndex = 0 then
   begin
     ANode := TcxDBTreeListNode(cxDBTreeListChangeMater.FocusedNode);//выделенный узел, который нужно поднять на уровень вверх
     mdsChangeMater.DisableControls;

     mdsChangeMater.Delete;
     mdsChangeMater.Post;

     if mdsChangeMater.Locate('KOD_MATER_PARENT',TcxDBTreeListNode(ANode).KeyValue,[]) then
     begin
       if not (mdsChangeMater.State in [dsEdit,dsInsert]) then
        mdsChangeMater.Edit;
      mdsChangeMater.FieldByName('KOD_MATER_PARENT').Value:= TcxDBTreeListNode(ANode.Parent).ParentKeyValue;
      mdsChangeMater.Post;
     end;

     mdsChangeMater.CloseOpen(true);
     mdsChangeMater.EnableControls;
     ANode.Focused := true;
     cxDBTreeListChangeMater.SetFocus;
   end
  else
   begin
     ANode := TcxDBTreeListNode(cxDBTreeListChangeMaterEDI.FocusedNode);//выделенный узел, который нужно поднять на уровень вверх
     mdsChangeMaterEDI.DisableControls;

     mdsChangeMaterEDI.Delete;
     mdsChangeMaterEDI.Post;

     if mdsChangeMaterEDI.Locate('KOD_MATER_PARENT',TcxDBTreeListNode(ANode).KeyValue,[]) then
      begin
        if not (mdsChangeMaterEDI.State in [dsEdit,dsInsert]) then
         mdsChangeMaterEDI.Edit;
        mdsChangeMaterEDI.FieldByName('KOD_MATER_PARENT').Value:= TcxDBTreeListNode(ANode.Parent).ParentKeyValue;
        mdsChangeMaterEDI.Post;
      end;

     mdsChangeMaterEDI.CloseOpen(true);
     mdsChangeMaterEDI.EnableControls;
     ANode.Focused := true;
     cxDBTreeListChangeMaterEDI.SetFocus;
   end;
end;

procedure TfrmChangeMaterNew.actRefreshExecute(Sender: TObject);
begin
   mdsChangeMater.CloseOpen(true);
   mdsChangeMaterEDI.CloseOpen(true);
end;

procedure TfrmChangeMaterNew.cbFiltrChange(Sender: TObject);
var
  tmp:string;
begin
  //---------------
  tmp:=cbFiltr.Text;

  if tmp = '-' then
    begin
       mdsChangeMater.Filtered:=False;
       cxDBTreeListChangeMater.FullCollapse;
    end
  else
    begin
           mdsChangeMater.Filtered:=False;
           mdsChangeMater.Filter:='GROUP_NAME = '''+tmp+'''';
           mdsChangeMater.Filtered:=true;
           cxDBTreeListChangeMater.FullCollapse;
    end;

  //---------------
end;

procedure TfrmChangeMaterNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  mdsChangeMater.Close;
  mdsChangeMaterEDI.Close;
  Action:= caFree;
  frmChangeMaterNew:=nil;
end;

procedure TfrmChangeMaterNew.FormCreate(Sender: TObject);
begin
   mdsChangeMater.Open;
   mdsChangeMaterEDI.Open;
   fillCb;
end;

procedure TfrmChangeMaterNew.fillCb;
var
  i:integer;
  s:string;
begin
    cbFiltr.Items.Clear;
    mqFiltr.Open;
    cbFiltr.Items.Add('-');
      for i := 1 to mqFiltr.RecordCountFromSrv do
          begin
             s:=mqFiltr.FieldByName('GROUP_NAME').AsString;
             cbFiltr.Items.Add(s);
             mqFiltr.Next;
          end;
    mqFiltr.Close;
end;


end.
