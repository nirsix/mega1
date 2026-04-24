object fmTTNPlan: TfmTTNPlan
  Left = 65
  Top = 154
  Caption = 'План маршрутов по накладным'
  ClientHeight = 741
  ClientWidth = 1247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnCenter: TPanel
    Left = 0
    Top = 28
    Width = 1247
    Height = 713
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 0
      Top = 270
      Width = 1247
      Height = 4
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 268
    end
    object pnTop: TPanel
      Left = 0
      Top = 0
      Width = 1247
      Height = 42
      Align = alTop
      TabOrder = 0
      object Label12: TLabel
        Left = 891
        Top = 14
        Width = 71
        Height = 13
        Caption = 'Доп. маршрут'
      end
      object lbWholeRent: TLabel
        Left = 739
        Top = 14
        Width = 83
        Height = 13
        Caption = 'Рентабельность'
        Enabled = False
      end
      object MegaDatePanel: TMegaDatePanel
        Left = 161
        Top = 0
        Width = 87
        Height = 40
        Orientation = mpVertical
        LabelCaption = 'Дата'
        LeftEditPos = 0
        Date = -700000.000000000000000000
        OnChange = MegaDatePanelChange
        TabOrder = 1
      end
      object cxButton1: TcxButton
        Left = 406
        Top = 11
        Width = 81
        Height = 25
        Action = actRefreshData
        TabOrder = 2
        OptionsImage.Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C000000000000000000000000000000000000000000000000
          00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0002FF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7F00020002FF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C1F7C0000FF7FFF7FFF7F00020002000200020002FF7FFF7FFF7F
          00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7F00020002FF7FFF7F0002FF7FFF7F
          00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0002FF7FFF7F0002FF7FFF7F
          00001F7C1F7C1F7C0000FF7FFF7F0002FF7FFF7FFF7FFF7FFF7F0002FF7FFF7F
          00001F7C1F7C1F7C0000FF7FFF7F0002FF7FFF7F0002FF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C1F7C0000FF7FFF7F0002FF7FFF7F00020002FF7FFF7FFF7FFF7F
          00001F7C1F7C1F7C0000FF7FFF7FFF7F00020002000200020002FF7FFF7FFF7F
          00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00020002FF7FFF7FFF7FFF7F
          00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0002FF7FFF7F000000000000
          00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000
          1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001F7C
          1F7C1F7C1F7C1F7C00000000000000000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C}
      end
      object cxButton2: TcxButton
        Left = 493
        Top = 9
        Width = 97
        Height = 25
        Action = actFixMarshrut
        TabOrder = 3
      end
      object btnDop: TcxButton
        Left = 994
        Top = 10
        Width = 21
        Height = 21
        Action = actDop_MarshrutsExecute
        Enabled = False
        TabOrder = 5
        OptionsImage.Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00848484008484840084848400848484008484840084848400848484008484
          8400848484008484840084848400848484008484840084848400FF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000084848400FF00FF000000
          0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF000000000000000000FFFFFF0000FFFF000000000084848400FF00FF000000
          000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
          FF0000000000C6C6C60000000000FFFFFF000000000084848400FF00FF000000
          0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF000000000000FFFF00C6C6C600000000000000000084848400FF00FF000000
          000000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
          FF00000000000000000000000000000000000000000084848400FF00FF000000
          0000FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000084848400FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF0000FFFF00FFFF
          FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000084848400840000008400
          00008400000084000000840000008400000084000000FFFFFF00FFFFFF0000FF
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000084848400840000008400
          0000840000008400000084000000840000008400000084000000FFFFFF00FFFF
          FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000084848400840000008400
          000084000000840000008400000084000000840000008400000084000000FFFF
          FF000000000000000000000000000000000000000000FF00FF00840000008400
          0000840000008400000084000000840000008400000084000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00840000008400
          00008400000084000000840000008400000084000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object edDop: TEdit
        Left = 966
        Top = 10
        Width = 26
        Height = 21
        TabOrder = 4
      end
      object cbDopHor: TCheckBox
        Left = 827
        Top = 13
        Width = 65
        Height = 17
        Caption = 'Хорека'
        TabOrder = 6
      end
      object MegaSelTradeDelegate: TMegaSelCFO
        Left = 0
        Top = 0
        Width = 161
        Height = 41
        Orientation = mpVertical
        LeftComboPos = 0
        LabelCaption = '&ЦФО'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        TabStop = True
        TabOrder = 0
        Database = DM.Money
        Transaction = DM.trMainRO
        DropDownWidth = 0
        OnChange = MegaSelTradeDelegateChange
        DisableForRegions = False
        OnlySubordinateCFO = False
        ShowAllCFO = False
        DesignSize = (
          161
          41)
      end
      object chbCheckRent: TcxCheckBox
        Left = 592
        Top = 11
        Caption = 'Расчет рентабельности'
        TabOrder = 7
        OnClick = chbCheckRentClick
        Width = 146
      end
      object cbFilt: TComboBox
        Left = 254
        Top = 13
        Width = 152
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 8
        Text = 'Не в маршрутах'
        Visible = False
        Items.Strings = (
          'Не в маршрутах'
          'Не в сортировке'
          'Все')
      end
    end
    object pnDocNakl: TPanel
      Left = 0
      Top = 42
      Width = 1247
      Height = 228
      Align = alTop
      Constraints.MinHeight = 50
      TabOrder = 1
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 1245
        Height = 13
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Список накладных для транспортировки'
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInactiveCaptionText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object gridNakl: TcxGrid
        Left = 1
        Top = 14
        Width = 1245
        Height = 213
        Align = alClient
        PopupMenu = pmNaklList
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object gridNaklDBBandedTableView1: TcxGridDBBandedTableView
          OnDblClick = gridNaklDBBandedTableView1DblClick
          Navigator.Buttons.CustomButtons = <>
          OnCustomDrawCell = gridNaklDBBandedTableView1CustomDrawCell
          DataController.DataSource = dsNaklList
          DataController.Filter.MaxValueListCount = 1000
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Filter.Active = True
          DataController.KeyFieldNames = 'RECID;BASEID'
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              Position = spFooter
              Column = gridNaklDBBandedTableView1WEIGHT_TONN
            end
            item
              Format = '0.'
              Kind = skSum
              Position = spFooter
              Column = gridNaklDBBandedTableView1KOLICH
            end
            item
              Format = 'Количество 0.'
              Kind = skCount
              Position = spFooter
              Column = gridNaklDBBandedTableView1ADDRESS
            end>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          Preview.AutoHeight = False
          Preview.MaxLineCount = 2
          Bands = <
            item
              Caption = 'Накладная'
              HeaderAlignmentHorz = taLeftJustify
            end>
          Left = 12345
          object gridNaklDBBandedTableView1RECID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'RECID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Width = 29
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1BASEID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BASEID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Width = 29
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1OPERDATE: TcxGridDBBandedColumn
            Caption = 'Дата операции'
            DataBinding.FieldName = 'OPERDATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.DateButtons = [btnClear, btnToday]
            Properties.DateOnError = deToday
            Width = 116
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1DOCTYPE: TcxGridDBBandedColumn
            Caption = 'Тип'
            DataBinding.FieldName = 'DOCTYPE'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 6
            Properties.ReadOnly = True
            Width = 42
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1CALC_OPERSTATUS: TcxGridDBBandedColumn
            Caption = 'Кат.'
            DataBinding.FieldName = 'CALC_OPERSTATUS'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 2
            Properties.ReadOnly = True
            Visible = False
            Width = 41
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1Res_deliveryTime: TcxGridDBBandedColumn
            Caption = 'Время доставки'
            DataBinding.FieldName = 'Res_deliveryTime'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 20
            Properties.ReadOnly = True
            SortIndex = 0
            SortOrder = soAscending
            Width = 81
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1GROUP_OPER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'GROUP_OPER'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Width = 29
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1KOD_OPER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KOD_OPER'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Width = 29
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1DK_TO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DK_TO'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Width = 29
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1DK_C: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DK_C'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Width = 29
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1NAS_P_NAME: TcxGridDBBandedColumn
            Caption = 'Нас.Пункт'
            DataBinding.FieldName = 'NAS_P_NAME'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 30
            Properties.ReadOnly = True
            Width = 69
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1ADDRESS: TcxGridDBBandedColumn
            Caption = 'Адрес'
            DataBinding.FieldName = 'ADDRESS'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 80
            Properties.ReadOnly = True
            Width = 137
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1DOCNUMBER: TcxGridDBBandedColumn
            Caption = 'Номер'
            DataBinding.FieldName = 'DOCNUMBER'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Width = 48
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1WEIGHT_TONN: TcxGridDBBandedColumn
            Caption = 'Вес(т)'
            DataBinding.FieldName = 'WEIGHT_TONN'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1KOLICH: TcxGridDBBandedColumn
            Caption = 'Шт.'
            DataBinding.FieldName = 'KOLICH'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Width = 54
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1BOX_COUNT: TcxGridDBBandedColumn
            Caption = 'Ящ.'
            DataBinding.FieldName = 'BOX_COUNT'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Width = 51
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1SUMMA1: TcxGridDBBandedColumn
            Caption = 'Сумма'
            DataBinding.FieldName = 'SUMMA1'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Width = 44
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1TTN_NUMBER: TcxGridDBBandedColumn
            Caption = 'Номер'
            DataBinding.FieldName = 'TTN_NUMBER'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1TTN_DOCTYPE: TcxGridDBBandedColumn
            Caption = 'Тип'
            DataBinding.FieldName = 'TTN_DOCTYPE'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 6
            Properties.ReadOnly = True
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1GROUP_NAME: TcxGridDBBandedColumn
            Caption = 'Группа операций'
            DataBinding.FieldName = 'GROUP_NAME'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 45
            Properties.ReadOnly = True
            Visible = False
            Width = 139
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1NAME_OPER: TcxGridDBBandedColumn
            Caption = 'Операция'
            DataBinding.FieldName = 'NAME_OPER'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 50
            Properties.ReadOnly = True
            Visible = False
            Width = 118
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1SHORTNAME_DK_TO: TcxGridDBBandedColumn
            Caption = 'Кому'
            DataBinding.FieldName = 'SHORTNAME_DK_TO'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 45
            Properties.ReadOnly = True
            Width = 109
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1SHORTNAME_DK_C: TcxGridDBBandedColumn
            Caption = 'Через'
            DataBinding.FieldName = 'SHORTNAME_DK_C'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 45
            Properties.ReadOnly = True
            Width = 126
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1NAS_P_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAS_P_ID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Width = 29
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1COUNTRY_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'COUNTRY_ID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Width = 35
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1KOD_CELL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KOD_CELL'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1N_TTN_MARSHRUT: TcxGridDBBandedColumn
            Caption = 'Маршрут'
            DataBinding.FieldName = 'N_TTN_MARSHRUT'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1DOC_CREATE: TcxGridDBBandedColumn
            Caption = 'Дата создания д-та'
            DataBinding.FieldName = 'DOC_CREATE'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1VISITDATE: TcxGridDBBandedColumn
            Caption = 'Дата посещения'
            DataBinding.FieldName = 'VISITDATE'
            Visible = False
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1VISITDATE2: TcxGridDBBandedColumn
            Caption = 'Дата доставки'
            DataBinding.FieldName = 'VISITDATE2'
            Width = 86
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1TYPE_NAME: TcxGridDBBandedColumn
            Caption = 'Тип района'
            DataBinding.FieldName = 'TYPE_NAME'
            Width = 72
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1POS_CNT: TcxGridDBBandedColumn
            Caption = 'Кол-во номенклатурных позиций'
            DataBinding.FieldName = 'POS_CNT'
            Width = 185
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1OPER_STATUS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OPER_STATUS'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 32
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1PLANNUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PLANNUMBER'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 33
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1DELIV_TIME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DELIV_TIME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 34
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1DELIV_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DELIV_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 35
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1IS_HORECA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_HORECA'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 36
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1desireddeliverytime: TcxGridDBBandedColumn
            DataBinding.FieldName = 'desireddeliverytime'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 37
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1CATEGORY: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CATEGORY'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 38
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1OUTLET_RECID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OUTLET_RECID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 39
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1OUTLET_BASEID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OUTLET_BASEID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 40
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1PARENT_RECID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PARENT_RECID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 41
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1PARENT_BASEID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PARENT_BASEID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 42
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1LPR: TcxGridDBBandedColumn
            Caption = 'Есть ЛПР'
            DataBinding.FieldName = 'LPR'
            Width = 65
            Position.BandIndex = 0
            Position.ColIndex = 43
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1IS_FED_MARKA: TcxGridDBBandedColumn
            Caption = 'Фед.марка'
            DataBinding.FieldName = 'IS_FED_MARKA'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Visible = False
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 44
            Position.RowIndex = 0
            Left = 12345
          end
          object gridNaklDBBandedTableView1NOTES: TcxGridDBBandedColumn
            Caption = 'Прим.'
            DataBinding.FieldName = 'NOTES'
            Options.Editing = False
            Width = 130
            Position.BandIndex = 0
            Position.ColIndex = 45
            Position.RowIndex = 0
          end
          object gridNaklDBBandedTableView1FLAG_SAN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'FLAG_SAN'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 46
            Position.RowIndex = 0
          end
        end
        object gridNaklLevel1: TcxGridLevel
          GridView = gridNaklDBBandedTableView1
          Left = 12345
        end
      end
    end
    object PnPlan: TPanel
      Left = 0
      Top = 274
      Width = 1247
      Height = 439
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object lb: TLabel
        Left = 0
        Top = 0
        Width = 1247
        Height = 13
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Маршруты'
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInactiveCaptionText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object pcTTNPlan: TcxPageControl
        Left = 0
        Top = 13
        Width = 1247
        Height = 426
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = dxTabSheet1
        Properties.CustomButtons.Buttons = <>
        Properties.HotTrack = True
        LookAndFeel.NativeStyle = True
        LookAndFeel.SkinName = 'iMaginary'
        OnChange = pcTTNPlanChange
        ClientRectBottom = 422
        ClientRectLeft = 4
        ClientRectRight = 1243
        ClientRectTop = 24
        object dxTabSheet1: TcxTabSheet
          Caption = 'dxTabSheet1'
          Color = clBtnFace
          ParentColor = False
          object pnPlanItem: TPanel
            Left = 0
            Top = 0
            Width = 1239
            Height = 398
            Align = alClient
            BevelOuter = bvNone
            Caption = 'pnPlan'
            TabOrder = 0
            object Splitter2: TSplitter
              Left = 269
              Top = 67
              Height = 304
              ExplicitHeight = 186
            end
            object pnPlanItemTop: TPanel
              Left = 0
              Top = 0
              Width = 1239
              Height = 32
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label13: TLabel
                Left = 736
                Top = 7
                Width = 83
                Height = 13
                Caption = 'Рентабельность'
                Enabled = False
              end
              object Label14: TLabel
                Left = 871
                Top = 7
                Width = 55
                Height = 13
                Caption = 'Стоимость'
                Enabled = False
              end
              object SpeedButton5: TcxButton
                Left = 71
                Top = 3
                Width = 26
                Height = 22
                Action = actNaklRemove
                Caption = ' '
                TabOrder = 1
                OptionsImage.Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C00000000000000001002100210020000000000000000
                  1F7C1F7C1F7C1F7C1F7C1F7C0000100210021002100210021002100200001F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001002100210021002100200001F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000100200001F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C}
                OptionsImage.Spacing = -3
              end
              object SpeedButton6: TcxButton
                Left = 103
                Top = 3
                Width = 26
                Height = 22
                Action = actPlanRefresh
                Caption = ' '
                TabOrder = 2
                OptionsImage.Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001000100010001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C100010001000100010001000100010001F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1000100010001F7C1F7C1F7C1F7C100010001000
                  1F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C10001000
                  1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
                  10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
                  10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
                  10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
                  10001F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C10001F7C10001000
                  1F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1000100010001000
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000100010001F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000100010001000
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C}
                OptionsImage.Spacing = -3
              end
              object SpeedButton1: TcxButton
                Left = 132
                Top = 4
                Width = 90
                Height = 22
                Action = actTTNCreate
                TabOrder = 3
                LookAndFeel.NativeStyle = False
                OptionsImage.Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C0000000000000000000000000000000000000000
                  00001F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                  00001F7C1F7C1F7C1F7C1F7C1042FF7F18631863007C007C007C18631863FF7F
                  00001F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                  00001F7C1F7C1F7C000000001042FF7F007C007C007C007C186318631863FF7F
                  00001F7C1F7C1F7CE07F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                  00001F7C1F7C1F7C1042E07F00000000000018631863007C007C18631863FF7F
                  00001F7C1F7C1F7C1F7C1042FF7FE07F0000000018631863007C007C007CFF7F
                  00001F7C1F7C0000000000000000FF7FE07F00000000FF7FFF7FFF7FFF7FFF7F
                  00001F7C1F7C1042FF7FE07FE07FE07FE07FE07F000000001863104200000000
                  00001F7C1F7C1F7C1042FF7FE07F00000000FF7FFF7FFF7FFF7F1042FF7F0000
                  1F7C1F7C1F7C1F7C1F7C1042FF7FE07F00000000FF7FFF7FFF7F104200001F7C
                  1F7C1F7C1F7C1F7C1F7C1042FF7FE07FE07F000000001042104210421F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FE07FE07F000000001F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FE07FE07F000000001F7C1F7C1F7C
                  1F7C1F7C1F7C}
              end
              object SpeedButton8: TcxButton
                Left = 415
                Top = 3
                Width = 90
                Height = 22
                Action = actTTNDelete
                TabOrder = 4
                OptionsImage.Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C00001F7C00001F7C00001F7C00001F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000001F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000000000000000000000E07F0000
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0000E07F0000
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F007C007C007C007C0000E07FE07F
                  00001F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7F0000E07F
                  00001F7C1F7C1F7C1F7C1F7C1F7C0000FF7F007C007C007C007C007C0000E07F
                  E07F00001F7C1F7C00401F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
                  0000000000001F7C004000401F7C0000FF7F007C007C0040007C007CFF7F0000
                  0040004000001F7C104200401042FF7FFF7F104200401042FF7FFF7FFF7F0000
                  000000001F7C1F7C1F7C004000401042104200400040FF7FFF7F000000000000
                  10421F7C1F7C1F7C1F7C10420040004000400040FF7FFF7FFF7F0000FF7F0000
                  1F7C1F7C1F7C1F7C1F7C1042004000400040FF7FFF7FFF7FFF7F000000001F7C
                  1F7C1F7C1F7C1F7C104200400040004000401042FF7F0000000000001F7C1F7C
                  1F7C1F7C1F7C1F7C0040004010421F7C0040004010421F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0040004010421F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C}
              end
              object SpeedButton9: TcxButton
                Left = 224
                Top = 4
                Width = 92
                Height = 22
                Action = actTTNOpen
                TabOrder = 5
                OptionsImage.Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF0000000000FF00FF0000000000FF00FF0000000000FF00FF0000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
                  0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  00000000000000000000000000000000000000000000000000000000000000FF
                  FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
                  FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF000000FF000000FF000000FF000000FF000000FF000000000000FF
                  FF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
                  000000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF000000FF000000FF000000FF000000FF000000FF000000FF000000
                  000000FFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF000000FF000000FF000000FF000000FF000000FF000000FF00FFFF
                  FF0000000000000084000000840000000000FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF000000FF000000FF000000FF00FFFFFF0000000000000000000000
                  000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
                  0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000000000000000000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              end
              object SpeedButton4: TcxButton
                Left = 43
                Top = 4
                Width = 26
                Height = 22
                Action = actNaklAdd
                Caption = ' '
                TabOrder = 0
                OptionsImage.Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000100200001F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001002100210021002100200001F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C0000100210021002100210021002100200001F7C
                  1F7C1F7C1F7C1F7C1F7C00000000000000001002100210020000000000000000
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C}
                OptionsImage.Spacing = -3
              end
              object cxButton3: TcxButton
                Left = 5
                Top = 4
                Width = 32
                Height = 22
                Hint = 
                  'Распределение всех накладных по маршрутам в соответствии с торго' +
                  'вым точкам'
                Action = actNaclMAdd
                Caption = ' '
                Enabled = False
                TabOrder = 6
                OptionsImage.Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777077777777
                  7777777F77777777777777730777777777777777F77777777777777F30777777
                  777777787F77777777777777B30777777777777787F7777777777777FB307777
                  77777777877F7777777777777FB30777777777777877F777777777777FBB3077
                  7777777778777F7777777F0000BBB307777778FFFF7777F7777777FBBBBBBB37
                  77777787777888877777777FBB30777777777778777F77777777777FBBB07777
                  777777787777F77777777777FBB30777777777778777F777777777777FBB3077
                  7777777778777F777777777777FB307777777777778777F77777777777FBB307
                  77777777778777F777777777777FBB37777777777778777F7777}
                OptionsImage.NumGlyphs = 2
                OptionsImage.Spacing = -2
              end
              object cxButton4: TcxButton
                Left = 366
                Top = 3
                Width = 24
                Height = 22
                Action = actNaclLeft
                TabOrder = 7
                OptionsImage.Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00000000008484000000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00000000008484000084840000000000000000
                  0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF0000000000848400008484000084840000848400008484
                  0000848400008484000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF000000000084840000848400008484000084840000848400008484
                  0000848400008484000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF0000000000848400008484000084840000848400008484
                  0000848400008484000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00000000008484000084840000000000000000
                  0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00000000008484000000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                OptionsImage.Spacing = -2
              end
              object cxButton5: TcxButton
                Left = 389
                Top = 3
                Width = 24
                Height = 22
                Action = actNaclRight
                TabOrder = 8
                OptionsImage.Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000848400000000
                  0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF000000000000000000000000000000000000000000848400008484
                  000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF000000000084840000848400008484000084840000848400008484
                  00008484000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF000000000084840000848400008484000084840000848400008484
                  0000848400008484000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF000000000084840000848400008484000084840000848400008484
                  00008484000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF000000000000000000000000000000000000000000848400008484
                  000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000848400000000
                  0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                OptionsImage.Spacing = -2
              end
              object edTTN_Position: TRxDBLookupCombo
                Left = 319
                Top = 3
                Width = 46
                Height = 22
                Hint = 'Переместить выбранную накладную по указанному маршруту.'
                DropDownCount = 8
                LookupField = 'PLANNUMBER'
                TabOrder = 9
                OnChange = edTTN_PositionChange
              end
              object pnl_isTTNNAKL: TPanel
                Left = 628
                Top = 3
                Width = 105
                Height = 22
                Caption = 'ТТН не создана'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 10
              end
              object btnPrintTTN: TcxButton
                Left = 507
                Top = 3
                Width = 119
                Height = 22
                Action = actTTNPrint
                Caption = 'Печать маршрута'
                TabOrder = 11
                OptionsImage.Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
                  C600C6C6C60000000000C6C6C60000000000FF00FF00FF00FF00000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000C6C6C60000000000FF00FF0000000000C6C6
                  C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FF
                  FF00C6C6C600C6C6C600000000000000000000000000FF00FF0000000000C6C6
                  C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400848484008484
                  8400C6C6C600C6C6C60000000000C6C6C60000000000FF00FF00000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000C6C6C600C6C6C6000000000000000000C6C6
                  C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
                  C600C6C6C60000000000C6C6C60000000000C6C6C60000000000FF00FF000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000C6C6C60000000000C6C6C6000000000000000000FF00FF00FF00
                  FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF0000000000C6C6C60000000000C6C6C60000000000FF00FF00FF00
                  FF00FF00FF0000000000FFFFFF00000000000000000000000000000000000000
                  0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
                  FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF0000000000FFFFFF000000000000000000000000000000
                  000000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
                  000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              end
              object cxDBLabel1: TcxDBLabel
                Left = 821
                Top = 5
                DataBinding.DataField = 'RENT'
                DataBinding.DataSource = dsPlan
                Enabled = False
                Height = 21
                Width = 44
              end
              object cxDBLabel2: TcxDBLabel
                Left = 931
                Top = 5
                DataBinding.DataField = 'SUM_TTN_PDV'
                DataBinding.DataSource = dsPlan
                Enabled = False
                Height = 21
                Width = 55
              end
              object cxButton7: TcxButton
                Left = 989
                Top = 4
                Width = 130
                Height = 21
                Hint = 'Наряд на комплектацию'
                Caption = 'Наряд на комплектацию'
                TabOrder = 14
                DropDownMenu = pmOrder
                Kind = cxbkDropDown
              end
              object cxButton9: TcxButton
                Left = 1125
                Top = 5
                Width = 119
                Height = 21
                Hint = 'Печать реестра долгов по первичным док-там'
                Caption = 'Долги по док-там'
                TabOrder = 15
                OnClick = cxButton9Click
                OptionsImage.Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
                  C600C6C6C60000000000C6C6C60000000000FF00FF00FF00FF00000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000C6C6C60000000000FF00FF0000000000C6C6
                  C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FF
                  FF00C6C6C600C6C6C600000000000000000000000000FF00FF0000000000C6C6
                  C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400848484008484
                  8400C6C6C600C6C6C60000000000C6C6C60000000000FF00FF00000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000C6C6C600C6C6C6000000000000000000C6C6
                  C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
                  C600C6C6C60000000000C6C6C60000000000C6C6C60000000000FF00FF000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000C6C6C60000000000C6C6C6000000000000000000FF00FF00FF00
                  FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF0000000000C6C6C60000000000C6C6C60000000000FF00FF00FF00
                  FF00FF00FF0000000000FFFFFF00000000000000000000000000000000000000
                  0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
                  FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF0000000000FFFFFF000000000000000000000000000000
                  000000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
                  000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              end
            end
            object pnPlanItemBottom: TPanel
              Left = 0
              Top = 371
              Width = 1239
              Height = 27
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object Label10: TLabel
                Left = 495
                Top = 10
                Width = 95
                Height = 13
                Caption = 'Необходимо% : '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label4: TLabel
                Left = 305
                Top = 10
                Width = 145
                Height = 13
                Caption = 'Посещается торговых точек'
                Color = clBtnFace
                ParentColor = False
              end
              object Label3: TLabel
                Left = 109
                Top = 10
                Width = 47
                Height = 13
                Caption = 'Загрузка'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object GaugeWeight: TGauge
                Left = 158
                Top = 8
                Width = 90
                Height = 18
                ForeColor = clBlue
                Progress = 0
              end
              object lbPercent: TLabel
                Left = 588
                Top = 10
                Width = 55
                Height = 13
                Caption = 'lbPercent'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object Label9: TLabel
                Left = 623
                Top = 10
                Width = 107
                Height = 13
                Caption = 'или  Необходимо '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbNeedOutletCount: TLabel
                Left = 727
                Top = 10
                Width = 108
                Height = 13
                Caption = 'lbNeedOutletCount'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label11: TLabel
                Left = 746
                Top = 10
                Width = 131
                Height = 13
                Caption = 'т.т. при 50% загрузки'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbPlod: TLabel
                Left = 252
                Top = 10
                Width = 36
                Height = 13
                Caption = 'lbPlod'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object SpeedButton7: TcxButton
                Left = 6
                Top = 6
                Width = 97
                Height = 22
                Action = actPlanHeaderShow
                TabOrder = 1
                OptionsImage.Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001F7C0040
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001F7C0040
                  00401F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001F7C0040
                  004000401F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001F7C0040
                  0040004000401F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001F7C0040
                  004000401F7C00000000000000000000000000001F7C1F7C1F7C10001F7C0040
                  00401F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001F7C1F7C1F7C10001F7C0040
                  1F7C1F7C1F7C0000FF7F104210421042FF7F00001F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C0000FF7F104210421042FF7F00001F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C0000FF7FFF7F0000000000000000000000000000000000001F7C
                  1F7C1F7C1F7C0000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F00001F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C0000E07FFF7FE07FFF7FE07FFF7FE07F00001F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C0000000000000000000000000000000000001F7C
                  1F7C1F7C1F7C}
              end
              object edOutletCount: TEdit
                Left = 453
                Top = 6
                Width = 29
                Height = 21
                Color = clScrollBar
                ReadOnly = True
                TabOrder = 0
              end
              object cxButton11: TcxButton
                Left = 6
                Top = 20
                Width = 23
                Height = 22
                Action = actExportJointLogistic
                TabOrder = 2
                Visible = False
              end
            end
            object pnPlanHeader: TPanel
              Left = 0
              Top = 67
              Width = 269
              Height = 304
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
              Visible = False
              DesignSize = (
                269
                304)
              object Label5: TLabel
                Left = 4
                Top = 56
                Width = 19
                Height = 13
                Caption = 'Тип'
              end
              object Label6: TLabel
                Left = 0
                Top = 0
                Width = 269
                Height = 13
                Align = alTop
                Alignment = taCenter
                AutoSize = False
                Caption = 'Заголовок ТТН'
                Color = clInactiveCaption
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clInactiveCaptionText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object RxLabel9: TRxLabel
                Left = 4
                Top = 76
                Width = 62
                Height = 13
                Caption = 'Экспедитор'
                FocusControl = ceDK_C
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShadowSize = 0
              end
              object Label2: TLabel
                Left = 92
                Top = 54
                Width = 48
                Height = 13
                Caption = 'Водитель'
              end
              object Label7: TLabel
                Left = 2
                Top = 157
                Width = 75
                Height = 13
                Caption = 'Общий тоннаж'
              end
              object lbTonnage: TLabel
                Left = 93
                Top = 156
                Width = 51
                Height = 13
                Caption = 'lbTonnage'
              end
              object MegaSelTransporter: TMegaSelTransporter
                Left = -3
                Top = 95
                Width = 269
                Height = 25
                Orientation = mpHorizontal
                LeftComboPos = 91
                LabelCaption = 'Перевозчик'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clBtnFace
                TabStop = True
                Anchors = [akLeft, akTop, akRight]
                BevelOuter = bvNone
                TabOrder = 3
                Database = DM.Money
                Transaction = Transaction
                OnChange = MegaSelTransporterChange
                DataSource = dsPlan
                FieldNameKOD_DK = 'DK_TO'
                DesignSize = (
                  269
                  25)
              end
              object MegaSelTruck: TMegaSelCarrier
                Left = 0
                Top = 117
                Width = 89
                Height = 38
                Orientation = mpVertical
                LeftComboPos = 68
                LabelCaption = 'Грузовик'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                TabStop = True
                BevelOuter = bvNone
                TabOrder = 4
                Database = DM.Money
                Transaction = Transaction
                OnChange = MegaSelTruckChange
                DataSource = dsPlan
                FieldNameNUM = 'CAR_SNUM'
                ShowTypes = [mctTruck]
                DesignSize = (
                  89
                  38)
              end
              object MegaSelTrailer1: TMegaSelCarrier
                Left = 89
                Top = 117
                Width = 89
                Height = 38
                Orientation = mpVertical
                LeftComboPos = 68
                LabelCaption = 'Прицеп 1'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                TabStop = True
                BevelOuter = bvNone
                TabOrder = 5
                Database = DM.Money
                Transaction = Transaction
                OnChange = MegaSelTruckChange
                DataSource = dsPlan
                FieldNameNUM = 'CAR_TRAILER'
                ShowTypes = [mctTrailer]
                DesignSize = (
                  89
                  38)
                object Label8: TLabel
                  Left = 8
                  Top = 40
                  Width = 32
                  Height = 13
                  Caption = 'Label8'
                end
              end
              object MegaSelTrailer2: TMegaSelCarrier
                Left = 178
                Top = 117
                Width = 89
                Height = 38
                Orientation = mpVertical
                LeftComboPos = 68
                LabelCaption = 'Прицеп 2'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                TabStop = True
                BevelOuter = bvNone
                TabOrder = 6
                Database = DM.Money
                Transaction = Transaction
                OnChange = MegaSelTruckChange
                DataSource = dsPlan
                FieldNameNUM = 'car_trailer2'
                ShowTypes = [mctTrailer]
                DesignSize = (
                  89
                  38)
              end
              object dbcbType: TDBComboBox
                Left = 26
                Top = 52
                Width = 62
                Height = 21
                Style = csDropDownList
                DataField = 'DOCTYPE'
                DataSource = dsPlan
                ItemHeight = 13
                Items.Strings = (
                  'Р'
                  'Г'
                  'Рн'
                  'Гн'
                  'Ра'
                  'Гд'
                  'ДР'
                  'Гсл'
                  'РЦ')
                TabOrder = 0
                OnChange = dbcbTypeChange
              end
              object ceDK_C: TRxDBComboEdit
                Left = 91
                Top = 72
                Width = 176
                Height = 21
                Margins.Left = 1
                Margins.Top = 1
                AutoSelect = False
                ClickKey = 16397
                Ctl3D = True
                DataField = 'SHORTNAME_DK_C'
                DataSource = dsPlan
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                GlyphKind = gkEllipsis
                Anchors = [akLeft, akTop, akRight]
                NumGlyphs = 1
                ParentCtl3D = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                OnButtonClick = ceDK_CChange
              end
              object dbedCAR_DRIVER: TDBEdit
                Left = 145
                Top = 51
                Width = 120
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'CAR_DRIVER'
                DataSource = dsPlan
                TabOrder = 1
                OnKeyPress = dbedCAR_DRIVERKeyPress
              end
              object cxLabel1: TcxLabel
                Left = 0
                Top = 22
                Caption = 'Нас. пункт погрузки'
              end
              object cxDBLookupComboBox1: TcxDBLookupComboBox
                Left = 109
                Top = 19
                DataBinding.DataField = 'NAS_P_FROM'
                DataBinding.DataSource = dsPlan
                Properties.ImmediatePost = True
                Properties.KeyFieldNames = 'NAS_P_ID'
                Properties.ListColumns = <
                  item
                    Caption = 'Город'
                    FieldName = 'NAS_P_NAME'
                  end>
                Properties.ListSource = dsDKFROMNasP
                Properties.OnChange = cxDBLookupComboBox1PropertiesChange
                TabOrder = 8
                Width = 157
              end
              object gbCustomTonnage: TGroupBox
                Left = 2
                Top = 176
                Width = 261
                Height = 49
                Caption = 'По цене тоннажа:'
                TabOrder = 9
                object dbtxtTonnag: TDBText
                  AlignWithMargins = True
                  Left = 5
                  Top = 36
                  Width = 251
                  Height = 8
                  Align = alBottom
                  DataField = 'TONNAGE'
                  DataSource = dsTonnag
                  Visible = False
                  ExplicitTop = 48
                end
                object cbbPriseTonazTONNAGE: TcxDBLookupComboBox
                  Left = 5
                  Top = 17
                  DataBinding.DataField = 'TONNAG'
                  DataBinding.DataSource = dsPlan
                  Properties.DropDownSizeable = True
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'TONNAGE'
                  Properties.ListColumns = <
                    item
                      FieldName = 'DESCRIPTION'
                    end>
                  Properties.ListOptions.ShowHeader = False
                  Properties.ListSource = dsTonnag
                  TabOrder = 0
                  Width = 253
                end
              end
            end
            object pnPositions: TPanel
              Left = 1210
              Top = 67
              Width = 29
              Height = 304
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 3
              object SpeedButton2: TcxButton
                Left = 5
                Top = 35
                Width = 23
                Height = 22
                Action = actPlanPosUp
                TabOrder = 0
                OptionsImage.Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C00000000000000001002100210020000000000000000
                  1F7C1F7C1F7C1F7C1F7C1F7C0000100210021002100210021002100200001F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001002100210021002100200001F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000100200001F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C}
              end
              object SpeedButton3: TcxButton
                Left = 5
                Top = 55
                Width = 23
                Height = 22
                Action = actPlanPosDown
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OptionsImage.Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000100200001F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001002100210021002100200001F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C0000100210021002100210021002100200001F7C
                  1F7C1F7C1F7C1F7C1F7C00000000000000001002100210020000000000000000
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000010021002100200001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C}
              end
              object cxButton6: TcxButton
                Left = 6
                Top = 83
                Width = 23
                Height = 22
                Action = actPlanPosInfo
                TabOrder = 2
                OptionsImage.Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
                  00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF0084848400C6C6C60000FFFF00C6C6C600C6C6C600000000008484
                  840084848400848484000000000000000000FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
                  000000FFFF00C6C6C600848484008484840000000000FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF008484840000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
                  FF0000000000FFFFFF0000FFFF00C6C6C6008484840000000000FF00FF00FF00
                  FF00FF00FF00FF00FF0084848400FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFF
                  FF0000000000FFFFFF0000000000000000008484840000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF0000FF
                  FF008484840000000000FFFFFF0000FFFF00C6C6C60000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00000000000000000000FFFF00FFFFFF00FFFF
                  FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF000000
                  000000000000FF00FF0000000000848400008484000000000000FFFFFF0000FF
                  FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00C6C6C60000000000000000008484
                  0000848400000000000000000000000000008484000000000000FFFFFF00FFFF
                  FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000FFFF
                  00008484000000000000FFFF0000000000008484000000000000000000000000
                  0000FFFFFF00FFFFFF00FFFFFF0000FFFF00C6C6C6000000000000000000FFFF
                  0000FFFF00000000000000000000FFFF0000FFFF000000000000FFFFFF00FFFF
                  FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF000000
                  000000000000FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF0000FF
                  FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00C6C6C60000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF0084848400FFFFFF0000FFFF00FFFFFF00FFFF
                  FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00848484008484840084848400848484008484
                  8400848484008484840084848400848484008484840000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              end
              object btnTTNPlanExport: TcxButton
                Left = 6
                Top = 111
                Width = 23
                Height = 22
                Action = actExportTTNPlanNaklsPosToExcel
                TabOrder = 3
              end
              object cxButton8: TcxButton
                Left = 5
                Top = 4
                Width = 23
                Height = 25
                Action = actRecalcPos
                TabOrder = 4
                OptionsImage.Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C40E0000C40E00000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000000508850AC
                  99899D7E6D9C7E6D9C7D6D9B7C6B9B7C6B997B689B7C6B000000000000000000
                  0000000000004F8D4F087C0B5A905AB4998CFFFFFFFAF4E9FAF3E8FAF2E6FAF1
                  E4F8EDDA9779670000000000000000000000004D904D20B43116A01F000000A2
                  7F6FFFFFFFFCF6EDFBF5ECFBF4EAFBF3E8FAF1E2987968000000000000000000
                  00000015981D3DDC5C169E20000000A98778FFFFFFFDF9F4FCF8F2FCF7EFFBF6
                  EDFBF4E8997B6B000000000000C6B5AB9FAE8A26B73A4AE66E1CAB2AB6B29ED0
                  BCB4FFFFFFFDFBF7FDFAF5FCF8F2FCF7EFFBF5EA9A7C6B0000000000006EA75E
                  38A4382DC14457F1832FC34630A52C609446FFFFFFFEFEFEEEF6EB57B655E8F2
                  E0FCF6ED9B7C6C000000000000C1B5A63DB4405CF68A69FF9F5BF38748B545C0
                  AB9CFFFFFFF5FCF53CB33B5AF38533B131E2E5D39F8070000000000000A98778
                  F0FBF033B1325AF3853BB237F1F3E4B79787FAFDFA49B84A5BF38769FF9F5CF6
                  8A2D9E27C4B7A6000000000000AB897AFFFFFFE9F4E457B655ECF2E3FCF7EFB8
                  98888CD28C31A8312FC34657F1832DC1442B91235F9B54000000000000AF8F80
                  FFFFFFFEFEFEFEFCFBFDFAF6FCF9F3D7C4BBD7C4BBD5D6C61CAB2A4AE66E26B7
                  3A899B7A000000000000000000B19080FFFFFFFFFFFFFEFEFEFDFBF8FCF9F4F0
                  E8E09F8070000000169E203DDC5C15971C000000000000000000000000B79787
                  FFFFFFFFFFFFFEFEFEFDFBF9A78270A78270A7827000000016A01F20B4314D90
                  4D000000000000000000000000B89888FFFFFFFFFFFFFFFFFFFFFFFFA78270B1
                  8E7EAB9E985A905A087B0B4F8D4F000000000000000000000000000000B89888
                  B89888B49383B08E7DAC8877A78270AB9E980000005088500000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000}
              end
              object cxButton10: TcxButton
                Left = 6
                Top = 135
                Width = 23
                Height = 22
                Action = actExportJointLogistic
                TabOrder = 5
              end
              object cxButton12: TcxButton
                Left = 6
                Top = 156
                Width = 23
                Height = 22
                Action = actSendJointLogistic
                TabOrder = 6
              end
            end
            object gridPlan: TDBGridEh
              Left = 272
              Top = 67
              Width = 938
              Height = 304
              Align = alClient
              AllowedOperations = [alopUpdateEh]
              DataSource = dsPlanPositions
              DynProps = <>
              EditActions = [geaCopyEh, geaSelectAllEh]
              EvenRowColor = clWhite
              Flat = True
              FooterRowCount = 1
              FooterParams.Color = clInfoBk
              GridLineParams.VertEmptySpaceStyle = dessNonEh
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghColumnResize, dghColumnMove]
              PopupMenu = pmPlan
              SumList.Active = True
              TabOrder = 4
              TitleParams.MultiTitle = True
              OnDblClick = gridPlanDblClick
              OnGetCellParams = gridPlanGetCellParams
              OnSortMarkingChanged = gridPlanSortMarkingChanged
              Columns = <
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'POS_NUM'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = '№ п/п'
                  Title.TitleButton = True
                  Width = 22
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'OPERDATE'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Документ|Дата'
                  Title.TitleButton = True
                  Width = 45
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DOCTYPE'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Документ|Тип'
                  Title.TitleButton = True
                  Width = 35
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DOCNUMBER'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Документ|Номер'
                  Title.TitleButton = True
                  Width = 38
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NOTES'
                  Footers = <>
                  Title.Caption = 'Прим.'
                  Width = 50
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'Res_deliveryTime'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Время'
                  Title.Hint = 'Желаемое время доставки'
                  Title.TitleButton = True
                  Width = 61
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'KOD_CELL'
                  Footers = <>
                  ReadOnly = True
                  Width = 54
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NAS_P_NAME'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Нас. пункт'
                  Title.Hint = 'Адрес доставки|Нас. пункт.'
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ADDRESS'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Адрес'
                  Title.Hint = 'Адрес'
                  Title.TitleButton = True
                  Width = 126
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DISTANCE_TT'
                  Footers = <>
                  Title.Caption = 'Расстояние до точки'
                  Title.Hint = 'Расстояние от начального пункта погрузки до конкретной точки'
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PLACES_NUM_KM'
                  Footers = <>
                  Title.Caption = 'Расстояние'
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'WEIGHT_TONN'
                  Footer.FieldName = 'WEIGHT_TONN'
                  Footer.ValueType = fvtSum
                  Footers = <
                    item
                      FieldName = 'WEIGHT_TONN'
                      ValueType = fvtSum
                    end>
                  ReadOnly = True
                  Title.Caption = 'Вес, т'
                  Title.Hint = 'Вес,т'
                  Title.TitleButton = True
                  Width = 35
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'KOLICH'
                  Footer.FieldName = 'KOLICH'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Шт'
                  Title.Hint = 'Шт.'
                  Title.TitleButton = True
                  Width = 31
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'BOX_COUNT'
                  Footer.FieldName = 'BOX_COUNT'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Ящ.'
                  Title.Hint = 'Ящ.'
                  Title.TitleButton = True
                  Width = 32
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PLACES_COUNT'
                  Footer.FieldName = 'PLACES_COUNT'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = 'Мест'
                  Title.Hint = 'Мест'
                  Title.TitleButton = True
                  Width = 33
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'SUMMA1'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Сумма'
                  Title.Hint = 'Сумма'
                  Title.TitleButton = True
                  Width = 54
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'SHORTNAME_DK_TO'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Кому'
                  Title.Hint = 'Кому'
                  Title.TitleButton = True
                  Width = 111
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'SHORTNAME_DK_C'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Через'
                  Title.Hint = 'Через'
                  Title.TitleButton = True
                  Width = 108
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'POS_CNT'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = 'Кол-во номенклатурных позиций'
                  Title.TitleButton = True
                  Width = 82
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'TTN_NUMBER'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'ТТН|Номер'
                  Title.Hint = 'ТТН|Номер'
                  Title.TitleButton = True
                  Width = 38
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'TTN_DOCTYPE'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'ТТН|Тип'
                  Title.Hint = 'ТТН|Тип'
                  Title.TitleButton = True
                  Width = 32
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PLANNUMBER'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PLANDATE'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'BASEID'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'POS_NUM_CITY'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NAKL_RECID'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NAKL_BASEID'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'GROUP_OPER'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'KOD_OPER'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DK_TO'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DK_C'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'GROUP_NAME'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NAME_OPER'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NAS_P_ID'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'COUNTRY_ID'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'MEGAOBJ'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'OPER_STATUS'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Color = 16776176
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CALC_OPERSTATUS'
                  Footers = <>
                  ReadOnly = True
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  CellButtons = <>
                  Checkboxes = True
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'inSortLot'
                  Footers = <>
                  Title.Caption = 'X'
                  Title.Hint = 'Признак вкл. накладной в сортировочеую'
                  Title.TitleButton = True
                  Title.ToolTips = True
                  ToolTips = True
                  Width = 18
                  OnGetCellParams = gridPlanColumns33GetCellParams
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DISTANCE'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Расстояние'
                  Visible = False
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'KOMPLEKTOVSCHIK'
                  Footers = <>
                  Title.Caption = 'Комплектовщик'
                  Title.TitleButton = True
                  Width = 188
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'cost_one_pos'
                  Footers = <>
                  Title.Caption = 'Стоимость экспедирования|Торговой точки'
                  Title.TitleButton = True
                  Width = 126
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'cost_sku'
                  Footers = <>
                  Title.Caption = 'Стоимость экспедирования|SKU'
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'cost_kg'
                  Footers = <>
                  Title.Caption = 'Стоимость экспедирования|Кг'
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  Color = clInfoBk
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'cost_sum'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = 'Стоимость экспедирования|Итого'
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ORDER_RECID'
                  Footers = <>
                  Visible = False
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ORDER_BASEID'
                  Footers = <>
                  Visible = False
                end
                item
                  CellButtons = <>
                  Checkboxes = True
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'IS_FED_MARKA'
                  Footers = <>
                  KeyList.Strings = (
                    '1'
                    '0')
                  ReadOnly = True
                  Title.Caption = 'Фед.марка'
                  Title.TitleButton = True
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object pn_MoveTempMarshr: TPanel
              Left = 0
              Top = 32
              Width = 1239
              Height = 35
              Align = alTop
              TabOrder = 5
              object lbMoveTempMarshNumber: TLabel
                Left = 296
                Top = 12
                Width = 64
                Height = 13
                Caption = '№ маршрута'
              end
              object btnMoveTempMarshr: TcxButton
                Left = 15
                Top = 6
                Width = 153
                Height = 22
                Hint = 'Перенести маршрут на|Перенести маршрут на'
                Caption = 'Перенести маршрут на'
                TabOrder = 0
                OnClick = btnMoveTempMarshrClick
                OptionsImage.Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FAE6E6FAE6E6
                  FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6
                  E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6CCBABA6F
                  6565766060D4CECE2A55F51B4CF71B4BF6163CEF3359F0FAE6E6FAE6E6FAE6E6
                  FAE6E6FAE6E6DDC7C7A38B8B766262B793939D8989D3C2C22552F64FAAFF4EA9
                  FF1138E9FAE6E6FAE6E6FAE6E6FAE6E6E6CDCDB69898B59595DCBDBDA99A9A93
                  A0896E9866D3C5C52854F41652FC3582FE2E7BFF6463D1FAE6E6FAE6E6D5B6B6
                  C3A4A4D9C0C0E4D3D3F6EFEFFFFFFF338234399036F8E6E6214DE7FAE6E62F42
                  DD2773FF2535C7FAE6E6FAE6E6C6A9A9EFE5E5FDF9F9FFFFFFBEB1B1D3C6C61B
                  8B2017A01FD2DCC6DBD3D3FAE6E6D5C4E30D30E11E2DC4FAE6E6FAE6E6DBBABA
                  FEFAFADAC6C6967979E0B7B7F2E1E1278F2840DF60299828E2DADA27892AFAE6
                  E64745C74A48B6FAE6E6FAE6E6F8E4E4F0D4D4F8E3E3C3ADADE9CCCCF0DFDF65
                  A56245DE674FE8761DB02C239322FAE6E6978BD5CFBFDCFAE6E6FAE6E6FAE6E6
                  FAE6E6FAE6E6DBC3C3E3CCCCEDDADAF8F1F11199146CFFA268FF9C2FA02EFAE6
                  E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6E9D1D1E0CDCDFAF3F35C
                  BD5E22A62425B02B1FAE272CB030ECE3E3AC9E9EEEDADAFAE6E6FAE6E6FAE6E6
                  FAE6E6FAE6E6F0DCDCD8D0D0FEFCFCFDFBFBFFFFFFFFFFFFF6F6F6C5B7B7755C
                  5CFFE6E6998686FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE5E5D4D2D2FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF926F6F7F5D5DFFD7D7A98888FAE6E6FAE6E6FAE6E6
                  FAE6E6FAE6E6FAE6E6E3CECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E5E5A582
                  829F7979C3ABABFAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6E0C0C0FFFFFFFF
                  FFFFFFFFFFEDE6E6C3B1B1BFA9A9CEB8B8F4E1E1FAE6E6FAE6E6FAE6E6FAE6E6
                  FAE6E6FAE6E6FAE6E6F6DFDFCAAFAFC7B1B1BEA3A3D2BABAF6E1E1FAE6E6FAE6
                  E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FA
                  E6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6}
              end
              object dtMoveTempMarshDate: TMegaDatePanel
                AlignWithMargins = True
                Left = 172
                Top = 4
                Width = 119
                Height = 27
                Margins.Left = 1
                Margins.Top = 1
                Margins.Right = 1
                Margins.Bottom = 1
                Orientation = mpHorizontal
                LabelCaption = 'Дата'
                LeftEditPos = 0
                Date = -700000.000000000000000000
                OnChange = MegaDatePanelChange
                TabOrder = 1
              end
              object edMoveTempMarshNumber: TcxSpinEdit
                Left = 366
                Top = 8
                TabOrder = 2
                Width = 51
              end
            end
          end
        end
      end
    end
  end
  object cxLabel2: TcxLabel
    Left = 228
    Top = 116
    Caption = 
      'Создавать и удалять ТТН в прошлом периоде нельзя! Обратитесь в о' +
      'тдел логистики ЦО'
    ParentColor = False
    ParentFont = False
    Style.Color = clBtnFace
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfFlat
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    Visible = False
  end
  object fdsNaklList2: TMegaDataSet
    UpdateSQL.Strings = (
      'select * from doc_nakl where RECID=:RECID and BASEID=:BASEID')
    DeleteSQL.Strings = (
      'select * from doc_nakl where RECID=:RECID and BASEID=:BASEID')
    InsertSQL.Strings = (
      ''
      'select * from doc_nakl where RECID=:RECID and BASEID=:BASEID')
    RefreshSQL.Strings = (
      'select'
      '  dn.recid,'
      '  dn.baseid,'
      '  dn.OPERDATE,'
      '  dn.DOCTYPE,'
      '  dn.DOCNUMBER,'
      '  dn.GROUP_OPER,'
      '  dn.KOD_OPER,'
      '  dn.SUMMA1,'
      '  dn.KOLICH,'
      '  dn.dk_to,'
      '  dn.DK_C,'
      ''
      '  dn.group_name group_name, --r'
      '  dn.name_oper name_oper, --r'
      '  dn.OPER_STATUS, --r'
      ''
      '  dn.SHORTNAME_DK_TO, --r'
      '  dn.SHORTNAME_DK_C, --r'
      ''
      '  dn.deliv_date deliv_date, --r'
      '  dn.deliv_time deliv_time, --r'
      ''
      '  dn.nas_p_id nas_p_id, --r'
      '  dn.Country_ID Country_ID, --r'
      '  dn.nas_p_name nas_p_name, --r'
      ''
      '  dn.address address, --r'
      ''
      '  dn.WEIGHT_TONN WEIGHT_TONN, --r'
      '  dn.BOX_COUNT BOX_COUNT, --r'
      ''
      '  dn.TTN_NUMBER,'
      '  dn.TTN_DOCTYPE,'
      ''
      '  dn.PLANNUMBER,'
      ''
      '  dn.OUTLET_RECID, --r'
      '  dn.OUTLET_BASEID, --r'
      '  dn.N_TTN_MARSHRUT, --r'
      ' '
      '  dn.desireddeliverytime, --r'
      '  dn.Category, --r'
      ''
      ' dn.IS_HORECA, --r'
      ' dn.KOD_CELL, --r'
      ' dn.VISITDATE, --r'
      ' dn.VISITDATE2,'
      ' dn.TYPE_NAME, --r'
      ' dn.DOC_CREATE DOC_CREATE, --r'
      ''
      ' dn.pos_cnt --r'
      ' ,dn.parent_recid, dn.parent_baseid,'
      ' dn.EXT_STRID , --r'
      ' dn.CUST_STRID , --r'
      '  0 UNLOAD_TYP,'
      '  0 ORD_TYP,'
      ' dn.CATEGORY_ID, --r'
      ''
      'dn.TIME_END, -- r170325'
      '0  ACTIVE_,'
      ' dn.OGRSUM1, --r'
      ' 0.0 OGRSUM2,'
      ' 0.0  SUM3,'
      ' 0.0  SUM4,'
      ' dn.address ADDR, --rr'
      ' dn.name_dk STR1, -- r170325'
      ' 0.0 MAX_CAR,'
      ' 0.0 MIN_CAR,'
      ' dn.OPERDATE DELIV_DATE1,'
      ' 0 RENTED,'
      ''
      ' dn.gps_avg_heigth LONGITUDE, --r'
      ' dn.gps_avg_width LATITUDE, --r'
      ''
      'dn.TIME_UNLOAD, --rr'
      'dn.LPR --rr'
      ''
      'from proc_get_nakl_for_ttn_2(:ADate, :baseid, :BDate, :filt) dn')
    SelectSQL.Strings = (
      'select'
      '  dn.recid,'
      '  dn.baseid,'
      '  dn.OPERDATE,'
      '  dn.DOCTYPE,'
      '  dn.DOCNUMBER,'
      '  dn.GROUP_OPER,'
      '  dn.KOD_OPER,'
      '  dn.SUMMA1,'
      '  dn.KOLICH,'
      '  dn.dk_to,'
      '  dn.DK_C,'
      ''
      '  dn.group_name group_name, --r'
      '  dn.name_oper name_oper, --r'
      '  dn.OPER_STATUS, --r'
      ''
      '  dn.SHORTNAME_DK_TO, --r'
      '  dn.SHORTNAME_DK_C, --r'
      ''
      '  dn.deliv_date deliv_date, --r'
      '  dn.deliv_time deliv_time, --r'
      ''
      '  dn.nas_p_id nas_p_id, --r'
      '  dn.Country_ID Country_ID, --r'
      '  dn.nas_p_name nas_p_name, --r'
      ''
      '  dn.address address, --r'
      ''
      '  dn.WEIGHT_TONN WEIGHT_TONN, --r'
      '  dn.BOX_COUNT BOX_COUNT, --r'
      ''
      '  dn.TTN_NUMBER,'
      '  dn.TTN_DOCTYPE,'
      ''
      '  dn.PLANNUMBER,'
      ''
      '  dn.OUTLET_RECID, --r'
      '  dn.OUTLET_BASEID, --r'
      '  dn.N_TTN_MARSHRUT, --r'
      ' '
      '  dn.desireddeliverytime, --r'
      '  dn.Category, --r'
      ''
      ' dn.IS_HORECA, --r'
      ' dn.KOD_CELL, --r'
      ' dn.VISITDATE, --r'
      ' dn.VISITDATE2,'
      ' dn.TYPE_NAME, --r'
      ' dn.DOC_CREATE DOC_CREATE, --r'
      ''
      ' dn.pos_cnt --r'
      ' ,dn.parent_recid, dn.parent_baseid,'
      ' dn.EXT_STRID , --r'
      ' dn.CUST_STRID , --r'
      '  0 UNLOAD_TYP,'
      '  0 ORD_TYP,'
      ' dn.CATEGORY_ID, --r'
      ''
      'dn.TIME_END, -- r170325'
      '0  ACTIVE_,'
      ' dn.OGRSUM1, --r'
      ' 0.0 OGRSUM2,'
      ' 0.0  SUM3,'
      ' 0.0  SUM4,'
      ' dn.address ADDR, --rr'
      ' dn.name_dk STR1, -- r170325'
      ' 0.0 MAX_CAR,'
      ' 0.0 MIN_CAR,'
      ' dn.OPERDATE DELIV_DATE1,'
      ' 0 RENTED,'
      ''
      ' dn.gps_avg_heigth LONGITUDE, --r'
      ' dn.gps_avg_width LATITUDE, --r'
      ''
      'dn.TIME_UNLOAD, --rr'
      'dn.LPR --rr'
      ''
      'from proc_get_nakl_for_ttn_2(:ADate, :baseid, :BDate, :filt) dn')
    OnCalcFields = fdsNaklList2CalcFields
    Transaction = DM.trMainRO
    Database = DM.Money
    AutoCommit = True
    DefaultFormats.NumericEditFormat = '0'
    Left = 52
    Top = 238
    object fdsNaklList2RECID: TIntegerField
      FieldName = 'RECID'
    end
    object fdsNaklList2BASEID: TIntegerField
      FieldName = 'BASEID'
    end
    object fdsNaklList2OPERDATE: TDateTimeField
      FieldName = 'OPERDATE'
      DisplayFormat = 'dd.mm.yyyy '
    end
    object fdsNaklList2DOCTYPE: TFIBStringField
      FieldName = 'DOCTYPE'
      Size = 6
      EmptyStrToNull = True
    end
    object fdsNaklList2DOCNUMBER: TIntegerField
      FieldName = 'DOCNUMBER'
    end
    object fdsNaklList2GROUP_OPER: TIntegerField
      FieldName = 'GROUP_OPER'
    end
    object fdsNaklList2KOD_OPER: TIntegerField
      FieldName = 'KOD_OPER'
    end
    object fdsNaklList2SUMMA1: TFloatField
      FieldName = 'SUMMA1'
      DisplayFormat = ',0.00'
      EditFormat = '0'
    end
    object fdsNaklList2DK_TO: TFloatField
      FieldName = 'DK_TO'
      DisplayFormat = '0.##'
      EditFormat = '0'
    end
    object fdsNaklList2DK_C: TFloatField
      FieldName = 'DK_C'
      DisplayFormat = '0.##'
      EditFormat = '0'
    end
    object fdsNaklList2GROUP_NAME: TFIBStringField
      FieldName = 'GROUP_NAME'
      Size = 65
      EmptyStrToNull = True
    end
    object fdsNaklList2NAME_OPER: TFIBStringField
      FieldName = 'NAME_OPER'
      Size = 70
      EmptyStrToNull = True
    end
    object fdsNaklList2SHORTNAME_DK_TO: TFIBStringField
      FieldName = 'SHORTNAME_DK_TO'
      Size = 45
      EmptyStrToNull = True
    end
    object fdsNaklList2SHORTNAME_DK_C: TFIBStringField
      FieldName = 'SHORTNAME_DK_C'
      Size = 45
      EmptyStrToNull = True
    end
    object fdsNaklList2NAS_P_ID: TIntegerField
      FieldName = 'NAS_P_ID'
    end
    object fdsNaklList2COUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
    end
    object fdsNaklList2NAS_P_NAME: TFIBStringField
      FieldName = 'NAS_P_NAME'
      Size = 30
      EmptyStrToNull = True
    end
    object fdsNaklList2ADDRESS: TFIBStringField
      FieldName = 'ADDRESS'
      Size = 80
      EmptyStrToNull = True
    end
    object fdsNaklList2WEIGHT_TONN: TFloatField
      FieldName = 'WEIGHT_TONN'
      DisplayFormat = ',0.00;-,0.00;#'
      EditFormat = ',0.00;-,0.00;#'
    end
    object fdsNaklList2TTN_NUMBER: TIntegerField
      FieldName = 'TTN_NUMBER'
    end
    object fdsNaklList2TTN_DOCTYPE: TFIBStringField
      FieldName = 'TTN_DOCTYPE'
      Size = 6
      EmptyStrToNull = True
    end
    object fdsNaklList2PLANNUMBER: TIntegerField
      FieldName = 'PLANNUMBER'
    end
    object fdsNaklList2OPER_STATUS: TIntegerField
      FieldName = 'OPER_STATUS'
    end
    object fdsNaklList2CALC_OPERSTATUS: TFIBStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_OPERSTATUS'
      Size = 2
      EmptyStrToNull = True
      Calculated = True
    end
    object fdsNaklList2KOLICH: TFloatField
      FieldName = 'KOLICH'
      DisplayFormat = '0.##'
      EditFormat = '0'
    end
    object fdsNaklList2DELIV_TIME: TFIBStringField
      FieldName = 'DELIV_TIME'
      Size = 10
      EmptyStrToNull = True
    end
    object fdsNaklList2DELIV_DATE: TDateTimeField
      FieldName = 'DELIV_DATE'
      DisplayFormat = 'dd.mm.yyyy '
    end
    object fdsNaklList2BOX_COUNT: TFloatField
      FieldName = 'BOX_COUNT'
      DisplayFormat = ',0.00;-,0.00;#'
    end
    object fdsNaklList2N_TTN_MARSHRUT: TIntegerField
      FieldName = 'N_TTN_MARSHRUT'
    end
    object fdsNaklList2IS_HORECA: TIntegerField
      FieldName = 'IS_HORECA'
    end
    object fdsNaklList2Res_deliveryTime: TFIBStringField
      FieldKind = fkCalculated
      FieldName = 'Res_deliveryTime'
      EmptyStrToNull = True
      Calculated = True
    end
    object fdsNaklList2desireddeliverytime: TFIBStringField
      FieldName = 'desireddeliverytime'
      Size = 8
      EmptyStrToNull = True
    end
    object fdsNaklList2CATEGORY: TIntegerField
      FieldName = 'CATEGORY'
    end
    object fdsNaklList2KOD_CELL: TFIBStringField
      DisplayLabel = 'Код соты'
      FieldName = 'KOD_CELL'
      Size = 15
      EmptyStrToNull = True
    end
    object fdsNaklList2VISITDATE: TFIBDateTimeField
      FieldName = 'VISITDATE'
    end
    object fdsNaklList2VISITDATE2: TFIBDateTimeField
      FieldName = 'VISITDATE2'
    end
    object fdsNaklList2TYPE_NAME: TFIBStringField
      FieldName = 'TYPE_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object fdsNaklList2DOC_CREATE: TFIBDateTimeField
      FieldName = 'DOC_CREATE'
      DisplayFormat = 'dd.mm.yy hh:mm '
    end
    object fdsNaklList2OUTLET_RECID: TFIBIntegerField
      FieldName = 'OUTLET_RECID'
    end
    object fdsNaklList2OUTLET_BASEID: TFIBIntegerField
      FieldName = 'OUTLET_BASEID'
    end
    object fdsNaklList2POS_CNT: TIntegerField
      FieldName = 'POS_CNT'
    end
    object fdsNaklList2PARENT_RECID: TIntegerField
      FieldName = 'PARENT_RECID'
    end
    object fdsNaklList2EXT_STRID: TFIBStringField
      FieldName = 'EXT_STRID'
      Size = 16
      EmptyStrToNull = True
    end
    object fdsNaklList2CUST_STRID: TFIBStringField
      FieldName = 'CUST_STRID'
      Size = 16
      EmptyStrToNull = True
    end
    object fdsNaklList2UNLOAD_TYP: TFIBIntegerField
      FieldName = 'UNLOAD_TYP'
    end
    object fdsNaklList2ORD_TYP: TFIBIntegerField
      FieldName = 'ORD_TYP'
    end
    object fdsNaklList2CATEGORY_ID: TFIBIntegerField
      FieldName = 'CATEGORY_ID'
    end
    object fdsNaklList2ACTIVE_: TFIBIntegerField
      FieldName = 'ACTIVE_'
    end
    object fdsNaklList2OGRSUM1: TFIBFloatField
      FieldName = 'OGRSUM1'
    end
    object fdsNaklList2OGRSUM2: TFIBFloatField
      FieldName = 'OGRSUM2'
    end
    object fdsNaklList2SUM3: TFIBFloatField
      FieldName = 'SUM3'
    end
    object fdsNaklList2SUM4: TFIBFloatField
      FieldName = 'SUM4'
    end
    object fdsNaklList2ADDR: TFIBStringField
      FieldName = 'ADDR'
      Size = 80
      EmptyStrToNull = True
    end
    object fdsNaklList2STR1: TFIBStringField
      FieldName = 'STR1'
      Size = 90
      EmptyStrToNull = True
    end
    object fdsNaklList2MAX_CAR: TFIBFloatField
      FieldName = 'MAX_CAR'
    end
    object fdsNaklList2MIN_CAR: TFIBFloatField
      FieldName = 'MIN_CAR'
    end
    object fdsNaklList2DELIV_DATE1: TFIBDateTimeField
      FieldName = 'DELIV_DATE1'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object fdsNaklList2RENTED: TFIBIntegerField
      FieldName = 'RENTED'
    end
    object fdsNaklList2LATITUDE: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'LATITUDE'
      DisplayFormat = '0.##'
      EditFormat = '0'
    end
    object fdsNaklList2LONGITUDE: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'LONGITUDE'
      DisplayFormat = '0.##'
      EditFormat = '0'
    end
    object fdsNaklList2TIME_UNLOAD: TFIBDateTimeField
      FieldName = 'TIME_UNLOAD'
    end
    object fdsNaklList2PARENT_BASEID: TIntegerField
      FieldName = 'PARENT_BASEID'
    end
    object fdsNaklList2LPR: TFIBStringField
      FieldName = 'LPR'
      EmptyStrToNull = True
    end
    object fdsNaklList2TIME_BEG: TDateTimeField
      FieldName = 'TIME_BEG'
    end
    object fdsNaklList2TIME_END: TDateTimeField
      FieldName = 'TIME_END'
    end
  end
  object Transaction: TMegaTransaction
    DefaultDatabase = DM.Money
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed'
      'rec_version')
    TPBMode = tpbDefault
    Left = 584
    Top = 28
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Планы'
      'Default'
      'Временный маршрут')
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    ImageOptions.Images = DM.MegaImages
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    NotDocking = [dsNone, dsLeft, dsRight, dsBottom]
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 504
    Top = 75
    DockControlHeights = (
      0
      0
      28
      0)
    object dxBarManagerBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = 'PlanEdit'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 276
      FloatTop = 216
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          Visible = True
          ItemName = 'dxBarButton12'
        end
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end>
      OldName = 'PlanEdit'
      OneOnRow = False
      Row = 0
      ShowMark = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
      Left = 12345
    end
    object dxBarManagerBar2: TdxBar
      Caption = 'Help'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 576
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 276
      FloatTop = 216
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end>
      OldName = 'Help'
      OneOnRow = False
      Row = 0
      ShowMark = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
      Left = 12345
    end
    object dxBarManagerBar3: TdxBar
      Caption = 'TempMarsch'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 659
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 1004
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnCreateTempMarshrut'
        end
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem3'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem4'
        end>
      OneOnRow = False
      Row = 0
      ShowMark = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
      Left = 12345
    end
    object dxBarButton1: TdxBarButton
      Action = actPlanAdd
      Category = 0
      PaintStyle = psCaptionGlyph
      Left = 12345
    end
    object dxBarButton2: TdxBarButton
      Action = actPlanDelete
      Category = 0
      Left = 12345
    end
    object dxBarButton4: TdxBarButton
      Action = actRefreshData
      Category = 0
      Left = 12345
    end
    object dxBarButton5: TdxBarButton
      Action = actRequest
      Category = 0
      Left = 12345
    end
    object dxBarButton3: TdxBarButton
      Action = actReport
      Category = 1
      Left = 12345
    end
    object dxBarButton6: TdxBarButton
      Action = actCreateSortLotCur
      Category = 1
      PaintStyle = psCaptionGlyph
      Left = 12345
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 1
      Visible = ivAlways
      ItemLinks = <>
      Left = 12345
    end
    object dxBarButton7: TdxBarButton
      Action = actPrintShets
      Category = 1
      Left = 12345
    end
    object dxBarButton8: TdxBarButton
      Caption = 'ANTOR'
      Category = 1
      Hint = 'ANTOR'
      Visible = ivNever
      OnClick = dxBarButton8Click
      Left = 12345
    end
    object dxBarButton9: TdxBarButton
      Action = acCar
      Category = 1
      Left = 12345
    end
    object dxBarButton10: TdxBarButton
      Action = acBP
      Category = 1
      Left = 12345
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'Сортировочные партии'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton11'
        end>
      Left = 12345
    end
    object dxBarButton11: TdxBarButton
      Action = actCreateSortLotAll
      Category = 1
      Left = 12345
    end
    object dxBarButton12: TdxBarButton
      Caption = 'Rinkai'
      Category = 1
      Hint = 'Rinkai'
      Visible = ivAlways
      OnClick = dxBarButton12Click
      Left = 12345
    end
    object dxBarButton13: TdxBarButton
      Caption = 'Экспорт'
      Category = 1
      Hint = 'Экспорт'
      Visible = ivAlways
      OnClick = actExportJointLogisticAllExecute
      Left = 12345
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = 'ИБТ'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton14'
        end
        item
          Visible = True
          ItemName = 'dxBarButton15'
        end>
      Left = 12345
    end
    object dxBarButton14: TdxBarButton
      Action = actExportJointLogisticAll
      Category = 1
      Left = 12345
    end
    object dxBarButton15: TdxBarButton
      Action = actSendJointLogisticAll
      Category = 1
      Left = 12345
    end
    object dxBarSubItem4: TdxBarSubItem
      Caption = 'Tocan'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton16'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton18'
        end
        item
          Visible = True
          ItemName = 'dxBarButton19'
        end
        item
          Visible = True
          ItemName = 'dxBarButton17'
        end
        item
          Visible = True
          ItemName = 'dxBarButton20'
        end>
    end
    object dxBarButton16: TdxBarButton
      Action = actExportNakl
      Category = 1
    end
    object dxBarButton17: TdxBarButton
      Action = actExportRoute
      Category = 1
    end
    object dxBarButton18: TdxBarButton
      Action = actImportFromTocan
      Category = 1
    end
    object dxBarButton19: TdxBarButton
      Action = actExportUpdateRoute
      Category = 1
    end
    object dxBarButton20: TdxBarButton
      Action = actExportCars
      Category = 1
    end
    object btnCreateTempMarshrut: TdxBarButton
      Action = actCreateTempMarshrut
      Category = 2
      PaintStyle = psCaptionGlyph
      Left = 12345
    end
  end
  object fs: TFormStorage
    StoredProps.Strings = (
      'pnDocNakl.Height')
    StoredValues = <>
    Left = 455
    Top = 75
  end
  object al: TActionList
    Images = DM.MegaImages
    Left = 459
    Top = 195
    object actPlanAdd: TAction
      Caption = 'Создать Маршрут'
      Hint = 'Создать Маршрут'
      ImageIndex = 78
      OnExecute = actPlanAddExecute
      Left = 12345
    end
    object actPlanDelete: TAction
      Caption = 'Удалить маршрут'
      Hint = 'Удалить маршрут'
      ImageIndex = 79
      OnExecute = actPlanDeleteExecute
      Left = 12345
    end
    object actNaklAdd: TAction
      Caption = 'Добавить'
      Hint = 'Добавить накладную в маршрут'
      ImageIndex = 57
      OnExecute = actNaklAddExecute
      Left = 12345
    end
    object actNaklAddSota: TAction
      Category = 'Соты и врем. маршр.'
      Caption = 'Добавить накладные по соте'
      Hint = 'Добавить накладные в маршрут по выбранной соте'
      ImageIndex = 57
      ShortCut = 16467
      OnExecute = actNaklAddSotaExecute
      Left = 12345
    end
    object actNaklRemove: TAction
      Caption = 'Удалить'
      Hint = 'Удалить накладную из маршрута'
      ImageIndex = 56
      OnExecute = actNaklRemoveExecute
      OnUpdate = actNaklRemoveUpdate
      Left = 12345
    end
    object actPlanRefresh: TAction
      Caption = 'Обновить'
      Hint = 'Обновить данные по маршруту'
      ImageIndex = 201
      OnExecute = actPlanRefreshExecute
      Left = 12345
    end
    object actReport: TAction
      Caption = 'Отчёт "Маршруты"'
      Hint = 'Печать маршрутов'
      ImageIndex = 12
      OnExecute = actReportExecute
      Left = 12345
    end
    object actPlanHeaderShow: TAction
      Caption = 'Заголовок'
      Hint = 
        'Показать/скрыть заголовок маршрута|Показать/скрыть заголовок мар' +
        'шрута'
      ImageIndex = 68
      OnExecute = actPlanHeaderShowExecute
      Left = 12345
    end
    object actPlanPosUp: TAction
      Category = 'PlanPositions'
      Hint = 'Переместить вверх|Переместить позицию маршрута вверх'
      ImageIndex = 56
      OnExecute = actPlanPosUpExecute
      Left = 12345
    end
    object actOpenNaklFromPlan: TAction
      Caption = 'Открыть накладную'
      Hint = 'Открыть накладную|Открыть накладную'
      ImageIndex = 3
      ShortCut = 49231
      OnExecute = actOpenNaklFromPlanExecute
      Left = 12345
    end
    object actPlanPosDown: TAction
      Category = 'PlanPositions'
      Hint = 'Переместить вниз|Переместить позицию маршрута вниз'
      ImageIndex = 57
      OnExecute = actPlanPosDownExecute
      Left = 12345
    end
    object actTTNCreate: TAction
      Category = 'TTN'
      Caption = 'Создать ТТН'
      Hint = 
        'Формировать ТТН|Формировать товарно-транспортную накладную согла' +
        'сно маршрута'
      ImageIndex = 148
      OnExecute = actTTNCreateExecute
      OnUpdate = actTTNCreateUpdate
      Left = 12345
    end
    object actTTNDelete: TAction
      Category = 'TTN'
      Caption = 'Удалить ТТН'
      Hint = 'Удалить ТТН|Удалить товарно-транспортную накладную'
      ImageIndex = 153
      OnExecute = actTTNDeleteExecute
      OnUpdate = actTTNDeleteUpdate
      Left = 12345
    end
    object actTTNOpen: TAction
      Category = 'TTN'
      Caption = 'Открыть ТТН'
      Hint = 'Открыть ТТН|Открыть товарно-транспортную накладную'
      ImageIndex = 150
      OnExecute = actTTNOpenExecute
      OnUpdate = actTTNOpenUpdate
      Left = 12345
    end
    object actRefreshData: TAction
      Caption = 'Обновить'
      Hint = 'Обновить данные|Обновить список накладных'
      ImageIndex = 201
      OnExecute = actRefreshDataExecute
      Left = 12345
    end
    object actOpenNakl: TAction
      Caption = 'Открыть накладную'
      Hint = 'Открыть накладную|Открыть накладную'
      ImageIndex = 3
      ShortCut = 16463
      OnExecute = actOpenNaklExecute
      Left = 12345
    end
    object actFixMarshrut: TAction
      Caption = 'Фиксир.маршр.'
      Enabled = False
      ShortCut = 16507
      OnExecute = actFixMarshrutExecute
      Left = 12345
    end
    object actRequest: TAction
      Caption = 'Пожелания'
      Hint = 'Пожелания|Пожелания/предложения по вопросам доставки'
      ImageIndex = 157
      OnExecute = actRequestExecute
      Left = 12345
    end
    object actNaclMAdd: TAction
      Caption = 'Добавить все'
      Hint = 'Распределение всех накладных по маршрутам '
      ImageIndex = 55
      OnExecute = actNaclMAddExecute
      Left = 12345
    end
    object actNaclRight: TAction
      Hint = 'Перемещение накладной на следующий маршрут'
      ImageIndex = 54
      OnExecute = actNaclRightExecute
      OnUpdate = actNaklRemoveUpdate
      Left = 12345
    end
    object actNaclLeft: TAction
      Hint = 'Перемещение накладной на предыдущий маршрут'
      ImageIndex = 53
      OnExecute = actNaclLeftExecute
      OnUpdate = actNaklRemoveUpdate
      Left = 12345
    end
    object actTTNPrint: TAction
      Category = 'TTN'
      Caption = 'Печать накладных в маршруте'
      Hint = 
        'Печать списка накладных в маршруте|Печать списка накладных в мар' +
        'шруте'
      ImageIndex = 12
      OnExecute = actTTNPrintExecute
      OnUpdate = actTTNPrintUpdate
      Left = 12345
    end
    object actDop_MarshrutsExecute: TAction
      Category = 'Соты и врем. маршр.'
      ImageIndex = 36
      OnExecute = actDop_MarshrutsExecuteExecute
      Left = 12345
    end
    object actCreateSortLotCur: TAction
      Category = 'TTN'
      Caption = 'Создать сортировочную партию'
      Hint = 'Создать сортировочную партию'#13#10'согласно позиций плана маршрута'
      ImageIndex = 52
      OnExecute = actCreateSortLotCurExecute
      OnUpdate = actCreateSortLotCurUpdate
      Left = 12345
    end
    object actPlanPosInfo: TAction
      Category = 'PlanPositions'
      Hint = 'Информация: '#13#10'какой сортировочной партиии принадлежит накладная'
      ImageIndex = 17
      ShortCut = 16457
      OnExecute = actPlanPosInfoExecute
      Left = 12345
    end
    object actCreateTempMarshrut: TAction
      Category = 'Соты и врем. маршр.'
      Caption = 'Создать временный маршрут'
      Hint = 'Создать временный маршрут|Создать временный маршрут'
      ImageIndex = 151
      OnExecute = actCreateTempMarshrutExecute
      OnUpdate = actCreateTempMarshrutUpdate
      Left = 12345
    end
    object actMoveSchetsToNakls: TAction
      Caption = 'actMoveSchetsToNakls'
      ShortCut = 49229
      OnExecute = actMoveSchetsToNaklsExecute
      Left = 12345
    end
    object actLinkTTtoSota: TAction
      Category = 'Соты и врем. маршр.'
      Caption = 'Привязать торговую точку к логистической соте'
      Hint = 
        'Привязать торговую точку к логистической соте|Привязать торговую' +
        ' точку к логистической соте'
      ImageIndex = 30
      OnExecute = actLinkTTtoSotaExecute
      OnUpdate = actLinkTTtoSotaUpdate
      Left = 12345
    end
    object actLinkTTtoSotaNaklList: TAction
      Category = 'Соты и врем. маршр.'
      Caption = 'Привязать торговую точку к логистической соте'
      Hint = 
        'Привязать торговую точку к логистической соте|Привязать торговую' +
        ' точку к логистической соте'
      ImageIndex = 30
      OnExecute = actLinkTTtoSotaNaklListExecute
      OnUpdate = actLinkTTtoSotaNaklListUpdate
      Left = 12345
    end
    object actPrintShets: TAction
      Hint = 'Печать счетов'
      ImageIndex = 50
      OnExecute = actPrintShetsExecute
      Left = 12345
    end
    object ActInsertNar: TAction
      Category = 'Наряды'
      Caption = 'Создать наряд'
      OnExecute = ActInsertNarExecute
      OnUpdate = ActInsertNarUpdate
      Left = 12345
    end
    object ActEditNar: TAction
      Category = 'Наряды'
      Caption = 'Изменить наряд'
      OnExecute = ActEditNarExecute
      OnUpdate = ActEditNarUpdate
      Left = 12345
    end
    object actDelNar: TAction
      Category = 'Наряды'
      Caption = 'Удалить наряд'
      OnExecute = actDelNarExecute
      OnUpdate = actDelNarUpdate
      Left = 12345
    end
    object actPrintKompMarshrut: TAction
      Category = 'Наряды'
      Caption = 'Печать Комплектации маршрутов'
      OnExecute = actPrintKompMarshrutExecute
      Left = 12345
    end
    object actPrintKomplOrder: TAction
      Category = 'Наряды'
      Caption = 'Печать наряда на комплектацию'
      OnExecute = actPrintKomplOrderExecute
      Left = 12345
    end
    object actPrintPeriod: TAction
      Category = 'Наряды'
      Caption = 'Отчет по работе комплектовщика'
      Enabled = False
      Visible = False
      OnExecute = actPrintPeriodExecute
      Left = 12345
    end
    object actPrintPeriodExpeditor: TAction
      Category = 'Наряды'
      Caption = 'Отчет по работе экспедитора'
      Enabled = False
      Visible = False
      OnExecute = actPrintPeriodExpeditorExecute
      Left = 12345
    end
    object actPrintSvodAll: TAction
      Category = 'Наряды'
      Caption = 'Печать сводного отчета за период'
      OnExecute = actPrintSvodAllExecute
      Left = 12345
    end
    object actInsertNarSelNakl: TAction
      Category = 'Наряды'
      Caption = 'Создать наряд по выделенным накладным'
      OnExecute = actInsertNarSelNaklExecute
      Left = 12345
    end
    object actSelEditNar: TAction
      Category = 'Наряды'
      Caption = 'Изменить наряд'
      OnExecute = actSelEditNarExecute
      Left = 12345
    end
    object actSelDelNar: TAction
      Category = 'Наряды'
      Caption = 'Удалить наряд'
      OnExecute = actSelDelNarExecute
      Left = 12345
    end
    object actExportTTNPlanNaklsPosToExcel: TAction
      Hint = 'Экспорт позиций накладных в Excel'
      ImageIndex = 87
      OnExecute = actExportTTNPlanNaklsPosToExcelExecute
      Left = 12345
    end
    object actRecalcPos: TAction
      Category = 'PlanPositions'
      Hint = 'Переместить точки согласно удаленности от склада'
      OnExecute = actRecalcPosExecute
      Left = 12345
    end
    object actPrintNaklListInRout: TAction
      Caption = 'Печать накладних'
      Hint = 'Друк накладних по поточному маршруту'
      OnExecute = actPrintNaklListInRoutExecute
      Left = 12345
    end
    object acCar: TAction
      Caption = 'Привязать машины'
      Hint = 'Привязать машины'
      OnExecute = acCarExecute
      Left = 12345
    end
    object acBP: TAction
      Caption = 'БП: Соглас-е нерентабельного маршрута'
      Hint = 'БП: Согласование нерентабельного маршрута'
      OnExecute = acBPExecute
      Left = 12345
    end
    object actCreateSortLotAll: TAction
      Category = 'TTN'
      Caption = 'Создать сортировочную партию по ВСЕМ'
      ImageIndex = 52
      OnExecute = actCreateSortLotAllExecute
      OnUpdate = actCreateSortLotAllUpdate
      Left = 12345
    end
    object actExportJointLogistic: TAction
      Hint = 'Выгрузить план маршрута в файл'
      ImageIndex = 203
      OnExecute = actExportJointLogisticExecute
      Left = 12345
    end
    object actExportJointLogisticAll: TAction
      Caption = 'Сохранить в файл'
      Hint = 'Выгрузить все маршруты в файл'
      ImageIndex = 203
      OnExecute = actExportJointLogisticAllExecute
      Left = 12345
    end
    object actSendJointLogistic: TAction
      Hint = 'Отправить по почте'
      ImageIndex = 2
      OnExecute = actSendJointLogisticExecute
      Left = 12345
    end
    object actSendJointLogisticAll: TAction
      Caption = 'Отправить по почте'
      Hint = 'Отправить по почте'
      ImageIndex = 2
      OnExecute = actSendJointLogisticAllExecute
      Left = 12345
    end
    object actExportNakl: TAction
      Category = 'Tocan'
      Caption = 'Выгрузить заявки за день'
      OnExecute = actExportNaklExecute
    end
    object actExportRoute: TAction
      Category = 'Tocan'
      Caption = 'Сформировать файл для выгрузки маршрута'
      OnExecute = actExportRouteExecute
    end
    object actImportFromTocan: TAction
      Category = 'Tocan'
      Caption = 'Загрузить маршруты из Tocan'
      OnExecute = actImportFromTocanExecute
    end
    object actExportUpdateRoute: TAction
      Category = 'Tocan'
      Caption = 'Отправить изменения в маршрутах в Токан'
      OnExecute = actExportUpdateRouteExecute
    end
    object actExportCars: TAction
      Category = 'Tocan'
      Caption = 'Выгрузить авто'
      OnExecute = actExportCarsExecute
    end
    object actTransitDate: TAction
      Caption = 'Перенести заявку на звірку'
      OnExecute = actTransitDateExecute
    end
  end
  object dsNaklList: TDataSource
    DataSet = fdsNaklList
    Left = 40
    Top = 191
  end
  object report: TMegaRDataSet
    UpdateSQL.Strings = (
      'UPDATE TTN_PLAN_POSITIONS SET '
      '    POS_NUM = ?POS_NUM,'
      '    POS_NUM_CITY = ?POS_NUM_CITY'
      ' WHERE     '
      '            PLANDATE = ?OLD_PLANDATE'
      '     and PLANNUMBER = ?OLD_PLANNUMBER'
      '     and BASEID = ?OLD_BASEID'
      '     and NAKL_RECID = ?OLD_NAKL_RECID'
      '     and NAKL_BASEID = ?OLD_NAKL_BASEID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM TTN_PLAN_POSITIONS'
      ' WHERE     '
      '            PLANDATE = ?OLD_PLANDATE'
      '     and PLANNUMBER = ?OLD_PLANNUMBER'
      '     and BASEID = ?OLD_BASEID'
      '     and NAKL_RECID = ?OLD_NAKL_RECID'
      '     and NAKL_BASEID = ?OLD_NAKL_BASEID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TTN_PLAN_POSITIONS('
      '    PLANDATE,'
      '    PLANNUMBER,'
      '    BASEID,'
      '    NAKL_RECID,'
      '    NAKL_BASEID,'
      '    POS_NUM,'
      '    POS_NUM_CITY'
      ')'
      'VALUES('
      '    ?PLANDATE,'
      '    ?PLANNUMBER,'
      '    ?BASEID,'
      '    ?NAKL_RECID,'
      '    ?NAKL_BASEID,'
      '    ?POS_NUM,'
      '    ?POS_NUM_CITY'
      ')')
    RefreshSQL.Strings = (
      
        ' select  tpp.plandate, tpp.plannumber, tpp.baseid, tpp.nakl_reci' +
        'd,'
      'tpp.nakl_baseid, tpp.pos_num, tpp.pos_num_city'
      'from ttn_plan_positions tpp'
      ' WHERE '
      '    (    '
      '            PLANDATE = ?OLD_PLANDATE'
      '     and PLANNUMBER = ?OLD_PLANNUMBER'
      '     and BASEID = ?OLD_BASEID'
      '     and NAKL_RECID = ?OLD_NAKL_RECID'
      '     and NAKL_BASEID = ?OLD_NAKL_BASEID'
      '    )')
    SelectSQL.Strings = (
      'select'
      '   trgoc.outlet_count,'
      '   tp.plandate,'
      '   tp.plannumber,'
      '   tpp.plandate plandate,'
      '   tpp.plannumber plannumber,'
      '   tpp.baseid baseid,'
      '   tpp.pos_num pos_num,'
      '   tpp.pos_num_city pos_num_city,'
      '   dn.recid NAKL_recid,'
      '   dn.baseid NAKL_baseid,'
      '   dn.OperDate OPERDATE,'
      '   dn.doctype DOCTYPE,'
      '   dn.docnumber DOCNUMBER,'
      '   dn.group_oper GROUP_OPER,'
      '   dn.kod_oper KOD_OPER,'
      '   dn.summa1 SUMMA1,'
      '   dn.dk_to dk_to,'
      '   dn.dk_c DK_C,'
      '   sgo.group_name group_name,'
      '   so.name_oper name_oper,'
      ''
      '   sdk_to.SHORTNAME_DK SHORTNAME_DK_TO,'
      '   sdk_c.SHORTNAME_DK SHORTNAME_DK_C,'
      ''
      '   snp.nas_p_id nas_p_id,'
      '   snp.Country_ID Country_ID,'
      '   snp.nas_p_name nas_p_name,'
      ''
      '   sda.address address,'
      ''
      '   gnti.WEIGHT_TONN WEIGHT_TONN,'
      '   gnti.BOX_COUNT BOX_COUNT,'
      ''
      '   dtn.docnumber TTN_NUMBER,'
      '   dtn.doctype TTN_DOCTYPE,'
      '   sto.DESIREDDELIVERYTIME DESIREDDELIVERYTIME,'
      '   dl.DELIV_TIME DELIV_TIME'
      '   ,tdn.distance'
      '   ,pcp.pos_cnt'
      '   ,dn.kolich_'
      '   ,tp.doctype'
      '   ,tp.car_driver'
      '   ,sdk_f.shortname_dk forward_dk'
      '   ,sdk_car.shortname_dk carrier_dk'
      '   ,ti.load_percent'
      '   ,snp_f.nas_p_name nas_p_name_from'
      ' from TTN_PLAN tp'
      
        ' left join TTN_PLAN_POSITIONS tpp on (tpp.plandate = tp.plandate' +
        ' and tpp.plannumber = tp.plannumber and tpp.baseid = tp.baseid)'
      
        ' left join DOC_NAKL dn on (dn.recid = tpp.nakl_recid and dn.base' +
        'id = tpp.nakl_baseid)'
      ' left join sprav_groper sgo on (sgo.group_oper = dn.group_oper)'
      
        ' left join sprav_oper so on (so.GROUP_OPER = DN.GROUP_OPER and s' +
        'o.KOD_OPER = DN.KOD_OPER)'
      ' left join sprav_dk sdk_to on (sdk_to.KOD_DK = DN.DK_TO)'
      ' left join sprav_dk sdk_c on (sdk_c.KOD_DK = DN.DK_C)'
      ' left join sprav_dk sdk_f on (sdk_f.KOD_DK = tp.DK_C)'
      ' left join sprav_dk sdk_car on (sdk_car.KOD_DK = tp.DK_TO)'
      
        ' left join delivery_location dl on (dl.formtype = 1 and dl.docre' +
        'cno = dn.recid and dl.baseid = dn.baseid)'
      
        ' left join sprav_trade_outlet sto on (sto.recid = dl.outlet_reci' +
        'd and sto.baseid = dl.outlet_baseid )'
      
        ' left join sprav_dk_address sda on (sda.recid = sto.addr_recid a' +
        'nd sda.baseid = sto.addr_baseid )'
      
        ' left join sprav_nas_p snp on (snp.nas_p_id = sda.nas_p_id and s' +
        'np.country_id = sda.country_id)'
      
        ' left join sprav_nas_p snp_f on (snp_f.nas_p_id = tp.nas_p_from ' +
        'and snp.country_id = sda.country_id)'
      
        ' left join GET_NAKL_TRANSP_INFO2(dn.recid, dn.baseid) gnti on (1' +
        '=1)'
      
        ' left join doc_trans_nakl_pos dtnp on (dtnp.nakl_recid = dn.reci' +
        'd and dtnp.nakl_baseid = dn.baseid)'
      
        ' left join doc_trans_nakl dtn on (dtn.recid = dtnp.docrecno and ' +
        'dtn.baseid = dtnp.baseid)'
      
        ' left join TTN_ROUTE_GET_OUTLET_COUNT(tp.plandate, tp.baseid, tp' +
        '.plannumber) trgoc on (1=1)'
      
        '-- left join TTN_GET_PLAN_POS_DISTS(tp.plandate,tp.plannumber,tp' +
        '.BASEID, tpp.POS_NUM ) tgpd on 1=1'
      
        ' left join TTN_DISTANCE_NAS_P(tp.nas_p_from,snp.nas_p_id,snp.cou' +
        'ntry_id) tdn on (1=1)'
      ' left join PROC_CALC_POS(1,dn.recid,dn.baseid) pcp on (1=1)'
      
        ' left join TTN_PLAN_GET_LOADING_INFO(tp.plannumber,tp.baseid,tp.' +
        'plandate,tp.doctype) ti on (1=1)'
      
        ' WHERE ((SELECT IS_SHOW FROM IS_NAKL_SHOW_IN_LIST(dn.recid, dn.b' +
        'aseid)) = 1)'
      ' and tp.plandate = :PLANDATE'
      ' and tp.baseid = :BASEID'
      ''
      ''
      ' ORDER BY'
      '   tp.plannumber,'
      '   TPP.POS_NUM,'
      '   TPP.POS_NUM_CITY')
    Transaction = DM.trMainRO
    Database = DM.Money
    UpdateTransaction = DM.trMainWShort
    DefaultFormats.NumericEditFormat = '0'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 200
    Top = 194
  end
  object dsPlanPositions: TDataSource
    DataSet = MegaDSTTNPlanPositions
    Left = 193
    Top = 29
  end
  object pmNaklList: TPopupMenu
    Left = 396
    Top = 46
    object N1: TMenuItem
      Action = actNaklAdd
      Left = 12345
    end
    object N9: TMenuItem
      Action = actNaklAddSota
      Left = 12345
    end
    object N10: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N6: TMenuItem
      Action = actOpenNakl
      Left = 12345
    end
    object N11: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N12: TMenuItem
      Action = actLinkTTtoSotaNaklList
      Left = 12345
    end
    object N36: TMenuItem
      Action = actTransitDate
    end
  end
  object pmPlan: TPopupMenu
    Left = 316
    Top = 435
    object N2: TMenuItem
      Action = actNaklRemove
      Left = 12345
    end
    object N5: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N3: TMenuItem
      Action = actPlanPosUp
      Caption = 'Вверх'
      Left = 12345
    end
    object N4: TMenuItem
      Action = actPlanPosDown
      Caption = 'Вниз'
      Left = 12345
    end
    object N7: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N8: TMenuItem
      Action = actPlanAdd
      Left = 12345
    end
    object N13: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N14: TMenuItem
      Action = actLinkTTtoSota
      Left = 12345
    end
    object N24: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object C1: TMenuItem
      Action = actInsertNarSelNakl
      Left = 12345
    end
    object N25: TMenuItem
      Action = actSelEditNar
      Left = 12345
    end
    object N26: TMenuItem
      Action = actSelDelNar
      Left = 12345
    end
    object N28: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N27: TMenuItem
      Caption = 'Выгрузка маршрута для внешней логистики'
      OnClick = N27Click
      Left = 12345
    end
    object N29: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N30: TMenuItem
      Action = actOpenNaklFromPlan
      Left = 12345
    end
  end
  object frReport: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frReportGetValue
    Left = 532
    Top = 250
    ReportForm = {
      190000003A180000190000000001000100FFFFFFFFFF090000009A0B00003408
      00000000000000000000000000000000000001FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000500000002F0400003A0000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200420100000B004D61737465
      72446174613100020100000000FC0000002F0400000E00000030000500010000
      00000000000000FFFFFF1F000000000C00667244424461746153657431000000
      00000000FFFF000000000002000000010000000000000001000000C800000014
      000000010000000000000200C30100000C0047726F7570486561646572310002
      01000000009C0000002F040000130000003100100001000000000000000000FF
      FFFF1F0000000015005B7265706F72742E22504C414E4E554D424552225D0000
      0000000000FFFF000000000002000000010000000000000001000000C8000000
      14000000010000000000000200300200000D004D617374657248656164657231
      00020100000000C40000002F0400001E00000030000400010000000000000000
      00FFFFFF1F00000000000000000000000000FFFF000000000002000000010000
      000000000001000000C8000000140000000100000000000002009C0200000C00
      47726F7570466F6F74657231000201000000001C0100002F0400001200000030
      00110001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      0000000000008C03000006004D656D6F3333000200130000001C010000080400
      001200000003000F0001000000000000000000FFFFFF1F2E0200000000000100
      7100C7E0E3F0F3E7EAE03A205B464F524D4154464C4F41542827232C2323302E
      3030272C205B7265706F72742E224C4F41445F50455243454E54225D295D252C
      20EFEEF1E5F9E0E5F2F1FF20F2EEF0E3EEE2FBF520F2EEF7E5EA3A205B726570
      6F72742E224F55544C45545F434F554E54225D00000000FFFF00000000000200
      000001000000000500417269616C000800000003000000000008000000CC0002
      0000000000FFFFFF00000000020000000000000000001B04000005004D656D6F
      310002004000000058000000DC0000001A000000030000000100000000000000
      0000FFFFFF1F2E02000000000001001100CCE0F0F8F0F3F2FB20E4EEF1F2E0E2
      EAE800000000FFFF00000000000200000001000000000500417269616C001000
      000000000000000000000000CC00020000000000FFFFFF000000000200000000
      0000000000AC04000005004D656D6F3200020074000000740000006000000012
      0000000300000001000000000000000000FFFFFF1F2E02000000000001001300
      5B7265706F72742E22504C414E44415445225D00000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000000000000CC0002
      0000000000FFFFFF00000000020000000000000000002E05000005004D656D6F
      3300020040000000740000003000000012000000030000000100000000000000
      0000FFFFFF1F2E02000000000001000400C4E0F2E000000000FFFF0000000000
      0200000001000000000500417269616C000A00000000000000000000000000CC
      00020000000000FFFFFF00000000020000000000000000006606000005004D65
      6D6F35000200130000009C000000080400001300000003000F00010000000000
      00000000FFFFFF1F2E0200000000000100BA00CCE0F0F8F0F3F220B9205B7265
      706F72742E22504C414E4E554D424552225D3A5B7265706F72742E226E61735F
      705F6E616D655F66726F6D225D2C20D2E8EF3A205B7265706F72742E22444F43
      5459504531225D2CE2EEE4E8F2E5EBFC3A205B7265706F72742E224341525F44
      5249564552225D2C20FDEAF1EFE5E4E8F2EEF03A205B7265706F72742E22464F
      52574152445F444B225D2C20EFE5F0E5E2EEE7F7E8EA3A205B7265706F72742E
      22434152524945525F444B225D00000000FFFF00000000000200000001000000
      000500417269616C000C00000002000000000000000000CC00020000000000FF
      FFFF0000000002000000000000000000F806000005004D656D6F370002001300
      0000FC000000320000000E00000003000F0001000000000000000000FFFFFF1F
      2E020000000000010014005B7265706F72742E22444F434E554D424552225D00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      000000000001000000CC00020000000000FFFFFF000000000200000000000000
      00008707000005004D656D6F3800020045000000FC000000320000000E000000
      03000F0001000000000000000000FFFFFF1F2E020101000000010011005B7265
      706F72742E2253554D4D4131225D00000000FFFF000000000002000000010000
      00000500417269616C000800000000000000000001000000CC00020000000000
      FFFFFF00000000020000000000000000002008000006004D656D6F3131000200
      B7000000FC000000BB0000000E00000003000F0001000000000000000000FFFF
      FF1F2E02000000000001001A005B7265706F72742E2253484F52544E414D455F
      444B5F544F225D00000000FFFF00000000000200000001000000000500417269
      616C000800000000000000000000000000CC00020000000000FFFFFF00000000
      02000000000000000000B308000005004D656D6F3900020072010000FC000000
      710000000E00000003000F0001000000000000000000FFFFFF1F2E0200000000
      00010015005B7265706F72742E224E41535F505F4E414D45225D00000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      00000000CC00020000000000FFFFFF00000000020000000000000000004B0900
      0006004D656D6F3132000200B0020000FC000000890000000E00000003000F00
      01000000000000000000FFFFFF1F2E020000000000010019005B7265706F7274
      2E2253484F52544E414D455F444B5F43225D00000000FFFF0000000000020000
      0001000000000500417269616C000800000000000000000000000000CC000200
      00000000FFFFFF0000000002000000000000000000DC09000006004D656D6F31
      33000200E3010000FC000000CD0000000E00000003000F000100000000000000
      0000FFFFFF1F2E020000000000010012005B7265706F72742E22414444524553
      53225D00000000FFFF00000000000200000001000000000500417269616C0008
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      000000000000710A000006004D656D6F3134000200AA030000FC000000260000
      000E00000003000F0001000000000000000000FFFFFF1F2E0201010000000100
      16005B7265706F72742E225745494748545F544F4E4E225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000100
      0000CC00020000000000FFFFFF0000000002000000000000000000040B000006
      004D656D6F3135000200D0030000FC0000002A0000000E00000003000F000100
      0000000000000000FFFFFF1F2E020101000000010014005B7265706F72742E22
      424F585F434F554E54225D00000000FFFF000000000002000000010000000005
      00417269616C000800000000000000000001000000CC00020000000000FFFFFF
      0000000002000000000000000000920B000006004D656D6F3136000200770000
      00FC000000400000000E00000003000F0001000000000000000000FFFFFF1F2E
      02000000000001000F005B44656C69766572795F54696D655D00000000FFFF00
      000000000200000001000000000500417269616C000800000000000000000000
      000000CC00020000000000FFFFFF0000000002000000000000000000260C0000
      06004D656D6F3137000200FA030000FC000000210000000E00000003000F0001
      000000000000000000FFFFFF1F2E020000000000010015005B7265706F72742E
      2254544E5F4E554D424552225D00000000FFFF00000000000200000001000000
      000500417269616C000800000000000000000001000000CC00020000000000FF
      FFFF0000000002000000000000000000AA0C000006004D656D6F313800020013
      000000D4000000320000000E00000003000F0001000000000000000000FFFFFF
      1F2E02000000000001000500CDEEECE5F000000000FFFF000000000002000000
      01000000000500417269616C00080000000200000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000002E0D000006004D656D6F3139
      00020045000000D4000000320000000E00000003000F00010000000000000000
      00FFFFFF1F2E02010100000001000500D1F3ECECE000000000FFFF0000000000
      0200000001000000000500417269616C00080000000200000000000A000000CC
      00020000000000FFFFFF0000000002000000000000000000B30D000006004D65
      6D6F3230000200B7000000C4000000BB0000001E00000003000F000100000000
      0000000000FFFFFF1F2E02000000000001000600CAEBE8E5EDF200000000FFFF
      00000000000200000001000000000500417269616C0008000000020000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000370E00
      0006004D656D6F323100020072010000C4000000710000001E00000003000F00
      01000000000000000000FFFFFF1F2E02000000000001000500C3EEF0EEE40000
      0000FFFF00000000000200000001000000000500417269616C00080000000200
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      00BB0E000006004D656D6F3232000200B0020000C4000000890000001E000000
      03000F0001000000000000000000FFFFFF1F2E02000000000001000500D7E5F0
      E5E700000000FFFF00000000000200000001000000000500417269616C000800
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      00000000003F0F000006004D656D6F3233000200E3010000C4000000CD000000
      1E00000003000F0001000000000000000000FFFFFF1F2E020000000000010005
      00C0E4F0E5F100000000FFFF0000000000020000000100000000050041726961
      6C00080000000200000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000C40F000006004D656D6F3234000200AA030000C4000000
      260000001E00000003000F0001000000000000000000FFFFFF1F2E0201010000
      0001000600C2E5F12C20F200000000FFFF000000000002000000010000000005
      00417269616C00080000000200000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000004D10000006004D656D6F3235000200D00300
      00C40000002A0000001E00000003000F0001000000000000000000FFFFFF1F2E
      02010100000001000A00CAEEEB2DE2EE2C20FFF900000000FFFF000000000002
      00000001000000000500417269616C00070000000200000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000D710000006004D656D
      6F323600020077000000C4000000400000001E00000003000F00010000000000
      00000000FFFFFF1F2E02000000000001000B00C2F0E5ECFF20E4EEF1F22E0000
      0000FFFF00000000000200000001000000000500417269616C00080000000200
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      005911000006004D656D6F3237000200FA030000C4000000210000001E000000
      03000F0001000000000000000000FFFFFF1F2E02000000000001000300D2D2CD
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000000DD11000006004D656D6F3238000200E10200001C010000600000001200
      00000300000001000000000000000000FFFFFF1F2E02000000000001000500C8
      F2EEE3EE00000000FFFF00000000000200000001000000000500417269616C00
      080000000300000000000A000000CC00020000000000FFFFFF00000000020000
      000000000000006112000006004D656D6F3239000200410300001C0100002400
      0000120000000300000001000000000000000000FFFFFF1F2E02000000000001
      000500C2E5F1203A00000000FFFF000000000002000000010000000005004172
      69616C00080000000300000000000A000000CC00020000000000FFFFFF000000
      0002000000000000000000FF12000006004D656D6F3330000200650300001C01
      000038000000120000000300000001000000000000000000FFFFFF1F2E020101
      00000001001F005B53554D285B7265706F72742E225745494748545F544F4E4E
      225D295D20F200000000FFFF0000000000020000000100000000050041726961
      6C00080000000300000000000A000000CC00020000000000FFFFFF0000000002
      0000000000000000009913000006004D656D6F3331000200ED0300001C010000
      2C000000120000000300000001000000000000000000FFFFFF1F2E0000010000
      0001001B005B53554D285B7265706F72742E22424F585F434F554E54225D295D
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      0300000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000002014000006004D656D6F33320002009D0300001C010000500000001200
      00000300000001000000000000000000FFFFFF1F2E02000000000001000800DF
      F9E8EAEEE2203A00000000FFFF00000000000200000001000000000500417269
      616C00080000000300000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000A714000006004D656D6F333400020013000000C40000
      00640000001000000003000F0001000000000000000000FFFFFF1F2E02000000
      000001000800C4EEEAF3ECE5EDF200000000FFFF000000000002000000010000
      00000500417269616C00080000000200000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000002915000005004D656D6F3400020039
      030000C40000002B0000001E00000003000F0001000000000000000000FFFFFF
      1F2E02000000000001000400D0E0F1F200000000FFFF00000000000200000001
      000000000500417269616C00080000000200000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000BA15000005004D656D6F360002
      0039030000FC0000002B0000000E00000003000F0001000000000000000000FF
      FFFF1F2E020000000000010013005B7265706F72742E2244495354414E434522
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      0000000000000001000000CC00020000000000FFFFFF00000000020000000000
      000000003B16000006004D656D6F313000020064030000C4000000270000001E
      00000003000F0001000000000000000000FFFFFF1F2E02000000000001000200
      F8F200000000FFFF00000000000200000001000000000500417269616C000800
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000CC16000006004D656D6F333500020064030000FC00000027000000
      0E00000003000F0001000000000000000000FFFFFF1F2E020000000000010012
      005B7265706F72742E224B4F4C4943485F225D00000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000001000000CC0002
      0000000000FFFFFF00000000020000000000000000005417000006004D656D6F
      33360002008B030000C40000001F0000001E00000003000F0001000000000000
      000000FFFFFF1F2E02000000000002000300EAEEEB0D0300F1EAFE00000000FF
      FF00000000000200000001000000000500417269616C00080000000200000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000E517
      000006004D656D6F33370002008B030000FC0000001F0000000E00000003000F
      0001000000000000000000FFFFFF1F2E020000000000010012005B7265706F72
      742E22504F535F434E54225D00000000FFFF0000000000020000000100000000
      0500417269616C000800000000000000000001000000CC00020000000000FFFF
      FF000000000200000000000000FEFEFF020000000A002043617465676F727931
      000000000D0044656C69766572795F54696D65000000000000000000000000FC
      00000000000000000000000000000000580006F6E77CB4EDE2405D584BC90D56
      E640}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = report
    Left = 476
    Top = 238
  end
  object dsPlan: TDataSource
    DataSet = MegaDSTTNPlan
    Left = 139
    Top = 179
  end
  object MegaDSTTNPlan: TMegaDSTTNPlan
    UpdateSQL.Strings = (
      ' UPDATE TTN_PLAN SET '
      '     TTN_RECID = ?TTN_RECID, '
      '     TTN_BASEID = ?TTN_BASEID, '
      '     DOCTYPE = ?DOCTYPE, '
      '     ROAD_LIST = ?ROAD_LIST, '
      '     DK_FROM = ?DK_FROM, '
      '     DK_TO = ?DK_TO, '
      '     CAR_SNUM = ?CAR_SNUM, '
      '     CAR_TRAILER = ?CAR_TRAILER, '
      '     CAR_TRAILER2 = ?CAR_TRAILER2, '
      '     CAR_DRIVER = ?CAR_DRIVER, '
      '     DK_C = ?DK_C,'
      '     IS_HORECA = ?IS_HORECA,'
      '     PLANNUMBER = ?PLANNUMBER,'
      '     IS_TEMP_MARSHRUT = ?IS_TEMP_MARSHRUT,'
      '     NAS_P_FROM = ?NAS_P_FROM,'
      '     NUM_KM = ?NUM_KM,'
      '     TMS =?TMS,'
      '     TONNAG=?TONNAG,'
      '     BPSTART=?BPSTART'
      ''
      '  WHERE PLANDATE = :OLD_PLANDATE '
      '    and PLANNUMBER = :OLD_PLANNUMBER '
      '    and BASEID = :OLD_BASEID ')
    DeleteSQL.Strings = (
      ' DELETE FROM TTN_PLAN '
      '  WHERE '
      '        PLANDATE = :OLD_PLANDATE '
      '    and PLANNUMBER = :OLD_PLANNUMBER '
      '    and BASEID = :OLD_BASEID ')
    InsertSQL.Strings = (
      ' INSERT INTO TTN_PLAN( '
      '     PLANDATE, '
      '     PLANNUMBER, '
      '     BASEID, '
      '     TTN_RECID, '
      '     TTN_BASEID, '
      '     DOCTYPE, '
      '     ROAD_LIST, '
      '     DK_FROM, '
      '     DK_TO, '
      '     CAR_SNUM, '
      '     CAR_TRAILER, '
      '     CAR_TRAILER2, '
      '     CAR_DRIVER, '
      '     DK_C,'
      '     IS_TEMP_MARSHRUT,'
      '     NAS_P_FROM'
      ' ) '
      ' VALUES( '
      '     ?PLANDATE, '
      '     ?PLANNUMBER, '
      '     ?BASEID, '
      '     ?TTN_RECID, '
      '     ?TTN_BASEID, '
      '     ?DOCTYPE, '
      '     ?ROAD_LIST, '
      '     ?DK_FROM, '
      '     ?DK_TO, '
      '     ?CAR_SNUM, '
      '     ?CAR_TRAILER, '
      '     ?CAR_TRAILER2, '
      '     ?CAR_DRIVER, '
      '     ?DK_C,'
      '     ?IS_TEMP_MARSHRUT,'
      '     ?NAS_P_FROM'
      ' ) ')
    RefreshSQL.Strings = (
      ' select '
      '   tp.plandate plandate, '
      '   tp.plannumber plannumber, '
      '   tp.Baseid BASEID, '
      '   tp.ttn_recid ttn_recid, '
      '   tp.ttn_baseid ttn_baseid, '
      '   tp.doctype doctype, '
      '   tp.road_list road_list, '
      '   tp.dk_from dk_from, '
      '   tp.dk_to dk_to, '
      '   tp.car_snum car_snum, '
      '   tp.car_trailer car_trailer, '
      '   tp.car_trailer2 car_trailer2, '
      '   tp.car_driver car_driver, '
      '   tp.dk_c dk_c, '
      '   tp.IS_HORECA,'
      '   tp.IS_TEMP_MARSHRUT,'
      '   tp.nas_p_from,'
      '   tp.NUM_KM,'
      '   tp.TMS,'
      '   sdk_c.SHORTNAME_DK SHORTNAME_DK_C,'
      '   tp.TONNAG,'
      '   tp.BPSTART,'
      ''
      '   case when :SHOW_RENT=1 and tgsp.SUM_IN_NAKL <> 0'
      '        then tgsp.SUM_TTN_PDV*100/tgsp.SUM_IN_NAKL'
      '        else cast(0 as DOUBLE PRECISION) end RENT,'
      
        '   case when :SHOW_RENT=1 then tgsp.SUM_TTN_PDV else cast(0 as D' +
        'OUBLE PRECISION) end SUM_TTN_PDV,'
      
        '   case when :SHOW_RENT=1 then tgsp.SUM_IN_NAKL else cast(0 as D' +
        'OUBLE PRECISION) end SUM_IN_NAKL,'
      '   dos.RECID order_recid,dos.BASEID order_baseid'
      ' from ttn_plan tp'
      ' left join sprav_dk sdk_c on (sdk_c.kod_dk = tp.dk_c)'
      
        ' left join TTN_GET_SUM_IN_PLAN(tp.PLANDATE, tp.PLANNUMBER, tp.BA' +
        'SEID)tgsp on 1=1'
      
        ' left join DOC_ORDER_SKLAD dos on dos.TYPE_ORDER=2 and dos.PLAN_' +
        'DATE=tp.PLANDATE AND dos.PLAN_NUMBER=tp.PLANNUMBER and dos.PLAN_' +
        'BASEID=tp.BASEID'
      ''
      ' where tp.PLANDATE = :OLD_PLANDATE '
      '   and tp.PLANNUMBER = :OLD_PLANNUMBER'
      '   and tp.BASEID = :OLD_BASEID ')
    SelectSQL.Strings = (
      ' select '
      '   tp.plandate plandate, '
      '   tp.plannumber plannumber, '
      '   tp.Baseid BASEID, '
      '   tp.ttn_recid ttn_recid, '
      '   tp.ttn_baseid ttn_baseid, '
      '   tp.doctype doctype, '
      '   tp.road_list road_list, '
      '   tp.dk_from dk_from, '
      '   tp.dk_to dk_to, '
      '   tp.car_snum car_snum, '
      '   tp.car_trailer car_trailer, '
      '   tp.car_trailer2 car_trailer2, '
      '   tp.car_driver car_driver, '
      '   tp.dk_c dk_c, '
      '   tp.IS_HORECA,'
      '   tp.IS_TEMP_MARSHRUT,'
      '   tp.nas_p_from,'
      '   tp.NUM_KM,'
      '   tp.TMS,'
      '   tp.ENABLE_NOT_RENTABLE, '
      '   sdk_c.SHORTNAME_DK SHORTNAME_DK_C,'
      '   tp.TONNAG,'
      '   tp.BPSTART,'
      '   case when :SHOW_RENT=1 and tgsp.SUM_IN_NAKL <> 0'
      '        then tgsp.SUM_TTN_PDV*100/tgsp.SUM_IN_NAKL'
      '        else cast(0 as DOUBLE PRECISION) end RENT,'
      
        '   case when :SHOW_RENT=1 then tgsp.SUM_TTN_PDV else cast(0 as D' +
        'OUBLE PRECISION) end SUM_TTN_PDV,'
      
        '   case when :SHOW_RENT=1 then tgsp.SUM_IN_NAKL else cast(0 as D' +
        'OUBLE PRECISION) end SUM_IN_NAKL,'
      '   dos.RECID order_recid,dos.BASEID order_baseid'
      ' from ttn_plan tp'
      ' left join sprav_dk sdk_c on (sdk_c.kod_dk = tp.dk_c)'
      
        ' left join TTN_GET_SUM_IN_PLAN(tp.PLANDATE, tp.PLANNUMBER, tp.BA' +
        'SEID)tgsp on 1=1'
      
        ' left join DOC_ORDER_SKLAD dos on dos.TYPE_ORDER=2 and dos.PLAN_' +
        'DATE=tp.PLANDATE AND dos.PLAN_NUMBER=tp.PLANNUMBER and dos.PLAN_' +
        'BASEID=tp.BASEID'
      ' where tp.PLANDATE = :PLANDATE '
      '   and tp.BASEID = :BASEID '
      'order by '
      '  tp.plannumber')
    AfterPost = MegaDSTTNPlanAfterPost
    AfterScroll = MegaDSTTNPlanAfterScroll
    Transaction = DM.trMainRO
    Database = DM.Money
    UpdateTransaction = DM.trMainWShort
    AutoCommit = True
    DefaultFormats.NumericEditFormat = '0'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = True
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 131
    Top = 58
    object MegaDSTTNPlanPLANDATE: TDateTimeField
      FieldName = 'PLANDATE'
    end
    object MegaDSTTNPlanPLANNUMBER: TIntegerField
      FieldName = 'PLANNUMBER'
    end
    object MegaDSTTNPlanBASEID: TIntegerField
      FieldName = 'BASEID'
    end
    object MegaDSTTNPlanTTN_RECID: TIntegerField
      FieldName = 'TTN_RECID'
    end
    object MegaDSTTNPlanTTN_BASEID: TIntegerField
      FieldName = 'TTN_BASEID'
    end
    object MegaDSTTNPlanROAD_LIST: TFIBStringField
      FieldName = 'ROAD_LIST'
      Size = 15
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanDK_FROM: TFloatField
      FieldName = 'DK_FROM'
    end
    object MegaDSTTNPlanDK_TO: TFloatField
      FieldName = 'DK_TO'
    end
    object MegaDSTTNPlanCAR_SNUM: TFIBStringField
      FieldName = 'CAR_SNUM'
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanDOCTYPE: TFIBStringField
      FieldName = 'DOCTYPE'
      OnChange = MegaDSTTNPlanDOCTYPEChange
      Size = 6
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanCAR_TRAILER: TFIBStringField
      FieldName = 'CAR_TRAILER'
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanCAR_TRAILER2: TFIBStringField
      FieldName = 'CAR_TRAILER2'
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanCAR_DRIVER: TFIBStringField
      FieldName = 'CAR_DRIVER'
      Size = 40
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanDK_C: TFloatField
      FieldName = 'DK_C'
    end
    object MegaDSTTNPlanSHORTNAME_DK_C: TFIBStringField
      FieldName = 'SHORTNAME_DK_C'
      Size = 45
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanIS_HORECA: TIntegerField
      FieldName = 'IS_HORECA'
    end
    object MegaDSTTNPlanIS_TEMP_MARSHRUT: TFIBSmallIntField
      FieldName = 'IS_TEMP_MARSHRUT'
    end
    object MegaDSTTNPlanRENT: TFIBFloatField
      FieldName = 'RENT'
      DisplayFormat = '0.00'
    end
    object MegaDSTTNPlanSUM_TTN_PDV: TFIBFloatField
      FieldName = 'SUM_TTN_PDV'
      DisplayFormat = '0.##'
    end
    object MegaDSTTNPlanSUM_IN_NAKL: TFIBFloatField
      FieldName = 'SUM_IN_NAKL'
      DisplayFormat = '0.##'
    end
    object MegaDSTTNPlanorder_recid: TIntegerField
      FieldName = 'order_recid'
    end
    object MegaDSTTNPlanorder_baseid: TIntegerField
      FieldName = 'order_baseid'
    end
    object MegaDSTTNPlanNAS_P_FROM: TIntegerField
      FieldName = 'NAS_P_FROM'
    end
    object fbfltfldMegaDSTTNPlanNUM_KM: TFIBFloatField
      FieldName = 'NUM_KM'
    end
    object MegaDSTTNPlanTMS: TFIBIntegerField
      FieldName = 'TMS'
    end
    object fltfldDEBET_KOD_MATERMegaDSTTNPlanTONNAG: TFloatField
      FieldName = 'TONNAG'
    end
  end
  object MegaDSTTNPlanPositions: TMegaDSTTNPlanPositions
    UpdateSQL.Strings = (
      ' UPDATE TTN_PLAN_POSITIONS SET '
      '     POS_NUM = :POS_NUM, '
      '     POS_NUM_CITY = :POS_NUM_CITY,'
      '     PLACES_COUNT = :PLACES_COUNT '
      '  WHERE '
      '             PLANDATE = :OLD_PLANDATE '
      '      and PLANNUMBER = :OLD_PLANNUMBER '
      '      and BASEID = :OLD_BASEID '
      '      and NAKL_RECID = :OLD_NAKL_RECID '
      '      and NAKL_BASEID = :OLD_NAKL_BASEID ')
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE DEL_PLAN_POS ('
      ' :OLD_PLANDATE,'
      ' :OLD_PLANNUMBER,'
      ' :OLD_BASEID,'
      ' :OLD_NAKL_RECID,'
      ' :OLD_NAKL_BASEID,'
      ' :OLD_DOCTYPE )')
    InsertSQL.Strings = (
      'EXECUTE PROCEDURE INS_PLAN_POS( '
      '     :PLANDATE, '
      '     :PLANNUMBER, '
      '     :BASEID, '
      '     :NAKL_RECID, '
      '     :NAKL_BASEID, '
      '     :POS_NUM, '
      '     :POS_NUM_CITY,'
      '     :PLACES_COUNT,'
      '     :NUM_KM,'
      '     :DOCTYPE'
      ' )')
    RefreshSQL.Strings = (
      ' select'
      '   tpp.plandate plandate,'
      '   tpp.plannumber plannumber,'
      '   tpp.baseid baseid,'
      '   tpp.OUTLET_POS_NUM pos_num,'
      '   --tpp.pos_num_city pos_num_city,'
      '   0 pos_num_city,'
      '   --tpp.PLACES_COUNT PLACES_COUNT,'
      ' 0 PLACES_COUNT,'
      '   --tpp.NUM_KM PLACES_NUM_KM,'
      '0 PLACES_NUM_KM,'
      '   tp.NUM_KM,'
      '   tpp.tn_recid NAKL_recid,'
      '   tpp.tn_baseid NAKL_baseid,'
      '   dn.OperDate OPERDATE,'
      '   tpp.doctype DOCTYPE,'
      '   tpp.TN_NUMBER DOCNUMBER,'
      '   dn.group_oper GROUP_OPER,'
      '   dn.kod_oper KOD_OPER,'
      '   tpp.TN_SUMMA_WITH_NDS SUMMA1,'
      '   tpp.TN_KOLICH KOLICH,'
      '   dn.dk_to dk_to,'
      '   dn.dk_c DK_C,'
      '   dn.NOTES,'
      '   sgo.group_name group_name,'
      '   so.name_oper name_oper,'
      '   so.status OPER_STATUS,'
      ''
      '   sdk_to.SHORTNAME_DK SHORTNAME_DK_TO,'
      '   sdk_c.SHORTNAME_DK SHORTNAME_DK_C,'
      ''
      '--   tpp.delivery_time DELIV_DATE,'
      #39'01.01.1900'#39' DELIV_DATE,'
      ''
      '   --dl.DELIV_TIME DELIV_TIME,'
      ' '#39'01.01.1900'#39' DELIV_TIME,'
      ''
      '   tpp.nas_p_id nas_p_id,'
      '   tpp.Country_ID Country_ID,'
      '   snp.nas_p_name nas_p_name,'
      '   tpp.OUTLET_ADDRESS address,--addr.address address,'
      ''
      '   gnti.WEIGHT_TONN WEIGHT_TONN,'
      '   gnti.BOX_COUNT BOX_COUNT,'
      ''
      '   dtn.docnumber TTN_NUMBER,'
      '   dtn.doctype TTN_DOCTYPE,'
      '   tdn.distance distance_tt,'
      '    @@PosInSortLot%0@ as inSortLot,'
      ' '
      '   sto.RECID OUTLET_RECID,'
      '   sto.BASEID OUTLET_BASEID,'
      '   sto.desireddeliverytime,'
      '   dos.RECID order_recid,'
      '   dos.BASEID order_baseid,'
      ''
      
        '   (select first 1 RECID from SPRAV_TRADE_BLANK where KOD_DK=dn.' +
        'DK_to and OUTLET_RECID=tpp.outlet_recid and OUTLET_BASEID=tpp.OU' +
        'TLET_BASEID) as blank_id,'
      '   tpp.kod_cell,--lc.KOD_CELL,'
      
        '   case when :SHOW_RENT=1 then tgpd.DISTANCE else cast(0 as DOUB' +
        'LE PRECISION) end DISTANCE,'
      '   pcp.pos_cnt pos_cnt,'
      '   '
      '  (SELECT first 1 sdk.SHORTNAME_DK from DOC_ORDER_SKLAD_POS dosp'
      '    LEFT JOIN sprav_dk sdk on sdk.KOD_DK = dosp.KOD_DK '
      
        '    where dosp.DOCRECNO = dos.RECID and dosp.BASEID = dos.BASEID' +
        ') KOMPLEKTOVSCHIK,'
      '   (SELECT first 1 dosp.KOD_DK from DOC_ORDER_SKLAD_POS dosp'
      
        '    where dosp.DOCRECNO = dos.RECID and dosp.BASEID = dos.BASEID' +
        ') KOMPLEKTOVSCHIK_DK,'
      ''
      ''
      
        '   prg.cost_kg, prg.cost_one_pos, prg.cost_sku, prg.cost_kg+ prg' +
        '.cost_one_pos+ prg.cost_sku cost_sum,'
      '   dn_fed.res is_fed_marka,'
      '   lda.parent_recid,'
      '   lda.parent_baseid'
      
        ' from PROC_GET_TTN_PLAN(:PLANDATE, :BASEID, :PLANNUMBER)   /*TTN' +
        '_PLAN_POSITIONS*/ tpp'
      
        ' left join DOC_NAKL dn on (dn.recid = tpp.tn_recid and dn.baseid' +
        ' = tpp.tn_baseid and tpp.formtype=1)'
      
        ' left join LINK_DOC_AKCIA lda on (lda.akcia_recid=tpp.tn_recid a' +
        'nd lda.akcia_baseid=tpp.tn_baseid and tpp.formtype=1)'
      
        ' left join IS_NAKL_FED_MARKA(tpp.tn_recid, tpp.tn_baseid) dn_fed' +
        ' on 1=1'
      
        ' left join PROC_CALC_POS(tpp.formtype,tpp.tn_recid,tpp.tn_baseid' +
        ') pcp on (1=1)'
      ' left join sprav_groper sgo on (sgo.group_oper = dn.group_oper)'
      
        ' left join sprav_oper so on (so.GROUP_OPER = DN.GROUP_OPER and s' +
        'o.KOD_OPER = DN.KOD_OPER)'
      ' left join sprav_dk sdk_to on (sdk_to.KOD_DK = tpp.OUTLET_DK)'
      ' left join sprav_dk sdk_c on (sdk_c.KOD_DK = DN.DK_C) '
      
        '-- left join delivery_location dl on (dl.formtype = 1 and dl.doc' +
        'recno =  tpp.tn_recid and dl.baseid = tpp.tn_baseid)'
      
        ' left join sprav_trade_outlet sto on (sto.recid = tpp.outlet_rec' +
        'id and sto.baseid = tpp.OUTLET_BASEID )'
      
        ' --left join LG_CELLS lc on lc.RECID = sto.CELL_RECID and lc.BAS' +
        'EID = sto.CELL_BASEID'
      
        '-- left join sprav_dk_address sda on (sda.recid = sto.addr_recid' +
        ' and sda.baseid = sto.addr_baseid )'
      
        '-- left join sprav_nas_p snp on (snp.nas_p_id = tpp.nas_p_id and' +
        ' snp.country_id = tpp.country_id)'
      
        'left join sprav_nas_p snp on (snp.nas_p_id = tpp.nas_p_id and sn' +
        'p.country_id = :country_id)'
      
        ' --left join GET_OUTLET_ADDRESS(tpp.outlet_recid, tpp.OUTLET_BAS' +
        'EID) addr on 1=1'
      
        ' left join ttn_plan tp on (tp.plandate=tpp.plandate and tp.plann' +
        'umber=tpp.plannumber and tp.baseid=tpp.baseid)'
      
        ' left join TTN_DISTANCE_NAS_P(tp.nas_p_from,tpp.nas_p_id,tpp.cou' +
        'ntry_id) tdn on (1=1)'
      
        ' left join GET_NAKL_TRANSP_INFO2(tpp.tn_recid, tpp.tn_baseid) gn' +
        'ti on (1=1)'
      
        ' left join doc_trans_nakl_pos dtnp on (dtnp.nakl_recid = tpp.tn_' +
        'recid and dtnp.nakl_baseid = tpp.tn_baseid)'
      
        ' left join doc_trans_nakl dtn on (dtn.recid = dtnp.docrecno and ' +
        'dtn.baseid = dtnp.baseid) '
      
        ' left join TTN_GET_PLAN_POS_DISTS(:PLANDATE,:PLANNUMBER,:BASEID,' +
        ' tpp.OUTLET_POS_NUM ) tgpd on 1=1'
      
        ' LEFT JOIN DOC_ORDER_SKLAD dos on dos.TYPE_ORDER=1 and dos.NAKL_' +
        'RECID=tpp.tn_recid AND dos.NAKL_BASEID=tpp.tn_baseid'
      
        ' left join PIECE_RATES_GET_COSTS(tpp.tn_recid, tpp.tn_baseid,1,d' +
        'tn.doctype, gnti.weight_tonn*1000,pcp.pos_cnt) prg on (1=1)'
      
        ' WHERE ((SELECT IS_SHOW FROM IS_NAKL_SHOW_IN_LIST(tpp.tn_recid,t' +
        'pp.tn_baseid)) = 1)'
      '')
    SelectSQL.Strings = (
      ' select'
      '   tpp.plandate plandate,'
      '   tpp.plannumber plannumber,'
      '   tpp.baseid baseid,'
      '   tpp.OUTLET_POS_NUM pos_num,'
      '   --tpp.pos_num_city pos_num_city,'
      '   0 pos_num_city,'
      '   --tpp.PLACES_COUNT PLACES_COUNT,'
      ' 0 PLACES_COUNT,'
      '   --tpp.NUM_KM PLACES_NUM_KM,'
      'cast(0 as double precision) PLACES_NUM_KM,'
      '   tp.NUM_KM,'
      '   tpp.tn_recid NAKL_recid,'
      '   tpp.tn_baseid NAKL_baseid,'
      '   dn.OperDate OPERDATE,'
      '   tpp.doctype DOCTYPE,'
      '   tpp.TN_NUMBER DOCNUMBER,'
      '   dn.group_oper GROUP_OPER,'
      '   dn.kod_oper KOD_OPER,'
      '   tpp.TN_SUMMA_WITH_NDS SUMMA1,'
      '   tpp.TN_KOLICH KOLICH,'
      '   dn.dk_to dk_to,'
      '   dn.dk_c DK_C,'
      '   dn.NOTES,'
      '   sgo.group_name group_name,'
      '   so.name_oper name_oper,'
      '   so.status OPER_STATUS,'
      '--  0 OPER_STATUS,'
      ''
      '   sdk_to.SHORTNAME_DK SHORTNAME_DK_TO,'
      '   sdk_c.SHORTNAME_DK SHORTNAME_DK_C,'
      ''
      '--   tpp.delivery_time DELIV_DATE,'
      'cast('#39'01.01.1900'#39' as date) DELIV_DATE,'
      ''
      '   --dl.DELIV_TIME DELIV_TIME,'
      ' '#39'01.01.19'#39' DELIV_TIME,'
      ''
      '   tpp.nas_p_id nas_p_id,'
      '   tpp.Country_ID Country_ID,'
      '   snp.nas_p_name nas_p_name,'
      '   tpp.OUTLET_ADDRESS address,--addr.address address,'
      ''
      '   gnti.WEIGHT_TONN WEIGHT_TONN,'
      '   gnti.BOX_COUNT BOX_COUNT,'
      ''
      '   dtn.docnumber TTN_NUMBER,'
      '--   dtn.doctype TTN_DOCTYPE,'
      '   null TTN_DOCTYPE,'
      '   tdn.distance distance_tt,'
      '    @@PosInSortLot%0@ as inSortLot,'
      ' '
      '   sto.RECID OUTLET_RECID,'
      '   sto.BASEID OUTLET_BASEID,'
      '   sto.desireddeliverytime,'
      '   dos.RECID order_recid,'
      '   dos.BASEID order_baseid,'
      ''
      
        '   (select first 1 RECID from SPRAV_TRADE_BLANK where KOD_DK=dn.' +
        'DK_to and OUTLET_RECID=tpp.outlet_recid and OUTLET_BASEID=tpp.OU' +
        'TLET_BASEID) as blank_id,'
      '   tpp.kod_cell,--lc.KOD_CELL,'
      
        '   case when :SHOW_RENT=1 then tgpd.DISTANCE else cast(0 as DOUB' +
        'LE PRECISION) end DISTANCE,'
      '   pcp.pos_cnt pos_cnt,'
      '   '
      '  (SELECT first 1 sdk.SHORTNAME_DK from DOC_ORDER_SKLAD_POS dosp'
      '    LEFT JOIN sprav_dk sdk on sdk.KOD_DK = dosp.KOD_DK '
      
        '    where dosp.DOCRECNO = dos.RECID and dosp.BASEID = dos.BASEID' +
        ') KOMPLEKTOVSCHIK,'
      '   (SELECT first 1 dosp.KOD_DK from DOC_ORDER_SKLAD_POS dosp'
      
        '    where dosp.DOCRECNO = dos.RECID and dosp.BASEID = dos.BASEID' +
        ') KOMPLEKTOVSCHIK_DK,'
      ''
      ''
      
        '   prg.cost_kg, prg.cost_one_pos, prg.cost_sku, prg.cost_kg+ prg' +
        '.cost_one_pos+ prg.cost_sku cost_sum,'
      '   dn_fed.res is_fed_marka,'
      '   lda.parent_recid,'
      '   lda.parent_baseid'
      
        ' from PROC_GET_TTN_PLAN(:PLANDATE, :BASEID, :PLANNUMBER)   /*TTN' +
        '_PLAN_POSITIONS*/ tpp'
      
        ' left join DOC_NAKL dn on (dn.recid = tpp.tn_recid and dn.baseid' +
        ' = tpp.tn_baseid and tpp.formtype=1)'
      
        ' left join LINK_DOC_AKCIA lda on (lda.akcia_recid=tpp.tn_recid a' +
        'nd lda.akcia_baseid=tpp.tn_baseid and tpp.formtype=1)'
      
        ' left join IS_NAKL_FED_MARKA(tpp.tn_recid, tpp.tn_baseid) dn_fed' +
        ' on 1=1'
      
        ' left join PROC_CALC_POS(tpp.formtype,tpp.tn_recid,tpp.tn_baseid' +
        ') pcp on (1=1)'
      ' left join sprav_groper sgo on (sgo.group_oper = dn.group_oper)'
      
        ' left join sprav_oper so on (so.GROUP_OPER = DN.GROUP_OPER and s' +
        'o.KOD_OPER = DN.KOD_OPER)'
      ' left join sprav_dk sdk_to on (sdk_to.KOD_DK = tpp.OUTLET_DK)'
      ' left join sprav_dk sdk_c on (sdk_c.KOD_DK = DN.DK_C) '
      
        '-- left join delivery_location dl on (dl.formtype = 1 and dl.doc' +
        'recno =  tpp.tn_recid and dl.baseid = tpp.tn_baseid)'
      
        ' left join sprav_trade_outlet sto on (sto.recid = tpp.outlet_rec' +
        'id and sto.baseid = tpp.OUTLET_BASEID )'
      
        ' --left join LG_CELLS lc on lc.RECID = sto.CELL_RECID and lc.BAS' +
        'EID = sto.CELL_BASEID'
      
        '-- left join sprav_dk_address sda on (sda.recid = sto.addr_recid' +
        ' and sda.baseid = sto.addr_baseid )'
      
        '-- left join sprav_nas_p snp on (snp.nas_p_id = tpp.nas_p_id and' +
        ' snp.country_id = tpp.country_id)'
      
        'left join sprav_nas_p snp on (snp.nas_p_id = tpp.nas_p_id and sn' +
        'p.country_id = :country_id)'
      
        ' --left join GET_OUTLET_ADDRESS(tpp.outlet_recid, tpp.OUTLET_BAS' +
        'EID) addr on 1=1'
      
        ' left join ttn_plan tp on (tp.plandate=tpp.plandate and tp.plann' +
        'umber=tpp.plannumber and tp.baseid=tpp.baseid)'
      
        ' left join TTN_DISTANCE_NAS_P(tp.nas_p_from,tpp.nas_p_id,tpp.cou' +
        'ntry_id) tdn on (1=1)'
      
        ' left join GET_NAKL_TRANSP_INFO2(tpp.tn_recid, tpp.tn_baseid) gn' +
        'ti on (1=1)'
      
        ' left join doc_trans_nakl_pos dtnp on (dtnp.nakl_recid = tpp.tn_' +
        'recid and dtnp.nakl_baseid = tpp.tn_baseid)'
      
        ' left join doc_trans_nakl dtn on (dtn.recid = dtnp.docrecno and ' +
        'dtn.baseid = dtnp.baseid) '
      
        ' left join TTN_GET_PLAN_POS_DISTS(:PLANDATE,:PLANNUMBER,:BASEID,' +
        ' tpp.OUTLET_POS_NUM ) tgpd on 1=1'
      
        ' LEFT JOIN DOC_ORDER_SKLAD dos on dos.TYPE_ORDER=1 and dos.NAKL_' +
        'RECID=tpp.tn_recid AND dos.NAKL_BASEID=tpp.tn_baseid'
      
        ' left join PIECE_RATES_GET_COSTS(tpp.tn_recid, tpp.tn_baseid,1,d' +
        'tn.doctype, gnti.weight_tonn*1000,pcp.pos_cnt) prg on (1=1)'
      
        ' WHERE ((SELECT IS_SHOW FROM IS_NAKL_SHOW_IN_LIST(tpp.tn_recid,t' +
        'pp.tn_baseid)) = 1)'
      '')
    AfterPost = MegaDSTTNPlanAfterPost
    OnCalcFields = MegaDSTTNPlanPositionsCalcFields
    Transaction = DM.trMainRO
    Database = DM.Money
    UpdateTransaction = DM.trMainWShort
    AutoCommit = True
    DataSource = dsPlan
    DefaultFormats.NumericEditFormat = '0'
    Key = 'PLANDATE; PLANNUMBER; BASEID; NAKL_RECID; NAKL_BASEID'
    AutoFetchAll = False
    AutoRefresh = True
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 297
    Top = 55
    object MegaDSTTNPlanPositionsPLANDATE: TDateTimeField
      FieldName = 'PLANDATE'
    end
    object MegaDSTTNPlanPositionsPLANNUMBER: TIntegerField
      FieldName = 'PLANNUMBER'
    end
    object MegaDSTTNPlanPositionsBASEID: TIntegerField
      FieldName = 'BASEID'
    end
    object MegaDSTTNPlanPositionsPOS_NUM: TIntegerField
      FieldName = 'POS_NUM'
    end
    object MegaDSTTNPlanPositionsPOS_NUM_CITY: TIntegerField
      FieldName = 'POS_NUM_CITY'
    end
    object MegaDSTTNPlanPositionsNAKL_RECID: TIntegerField
      FieldName = 'NAKL_RECID'
    end
    object MegaDSTTNPlanPositionsNAKL_BASEID: TIntegerField
      FieldName = 'NAKL_BASEID'
    end
    object MegaDSTTNPlanPositionsOPERDATE: TDateTimeField
      FieldName = 'OPERDATE'
    end
    object MegaDSTTNPlanPositionsDOCTYPE: TFIBStringField
      FieldName = 'DOCTYPE'
      Size = 6
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsDOCNUMBER: TIntegerField
      FieldName = 'DOCNUMBER'
    end
    object MegaDSTTNPlanPositionsGROUP_OPER: TIntegerField
      FieldName = 'GROUP_OPER'
    end
    object MegaDSTTNPlanPositionsKOD_OPER: TIntegerField
      FieldName = 'KOD_OPER'
    end
    object MegaDSTTNPlanPositionsSUMMA1: TFloatField
      FieldName = 'SUMMA1'
      DisplayFormat = ',0.00;-,0.00;#'
    end
    object MegaDSTTNPlanPositionsDK_TO: TFloatField
      FieldName = 'DK_TO'
    end
    object MegaDSTTNPlanPositionsDK_C: TFloatField
      FieldName = 'DK_C'
    end
    object MegaDSTTNPlanPositionsGROUP_NAME: TFIBStringField
      FieldName = 'GROUP_NAME'
      Size = 65
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsNAME_OPER: TFIBStringField
      FieldName = 'NAME_OPER'
      Size = 70
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsSHORTNAME_DK_TO: TFIBStringField
      FieldName = 'SHORTNAME_DK_TO'
      Size = 45
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsSHORTNAME_DK_C: TFIBStringField
      FieldName = 'SHORTNAME_DK_C'
      Size = 45
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsNAS_P_ID: TIntegerField
      FieldName = 'NAS_P_ID'
    end
    object MegaDSTTNPlanPositionsCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
    end
    object MegaDSTTNPlanPositionsNAS_P_NAME: TFIBStringField
      FieldName = 'NAS_P_NAME'
      Size = 30
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsADDRESS: TFIBStringField
      FieldName = 'ADDRESS'
      Size = 160
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsWEIGHT_TONN: TFloatField
      FieldName = 'WEIGHT_TONN'
      DisplayFormat = ',0.000;-,0.000;#'
      EditFormat = ',0.000;-,0.000;#'
    end
    object MegaDSTTNPlanPositionsTTN_NUMBER: TIntegerField
      FieldName = 'TTN_NUMBER'
    end
    object MegaDSTTNPlanPositionsTTN_DOCTYPE: TFIBStringField
      FieldName = 'TTN_DOCTYPE'
      Size = 6
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsOPER_STATUS: TIntegerField
      FieldName = 'OPER_STATUS'
    end
    object MegaDSTTNPlanPositionsCALC_OPERSTATUS: TFIBStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_OPERSTATUS'
      Size = 2
      EmptyStrToNull = True
      Calculated = True
    end
    object MegaDSTTNPlanPositionsKOLICH: TFloatField
      FieldName = 'KOLICH'
    end
    object MegaDSTTNPlanPositionsPLACES_COUNT: TIntegerField
      FieldName = 'PLACES_COUNT'
    end
    object MegaDSTTNPlanPositionsDELIV_DATE: TDateTimeField
      FieldName = 'DELIV_DATE'
    end
    object MegaDSTTNPlanPositionsDELIV_TIME: TFIBStringField
      FieldName = 'DELIV_TIME'
      Size = 10
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsBOX_COUNT: TFloatField
      FieldName = 'BOX_COUNT'
      DisplayFormat = ',0.00;-,0.00;#'
    end
    object MegaDSTTNPlanPositionsdesireddeliverytime: TFIBStringField
      FieldName = 'desireddeliverytime'
      Size = 8
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsRes_deliveryTime: TFIBStringField
      FieldKind = fkCalculated
      FieldName = 'Res_deliveryTime'
      EmptyStrToNull = True
      Calculated = True
    end
    object MegaDSTTNPlanPositionsBLANK_ID: TIntegerField
      FieldName = 'BLANK_ID'
    end
    object MegaDSTTNPlanPositionsinSortLot: TFIBIntegerField
      FieldName = 'inSortLot'
      ReadOnly = True
    end
    object MegaDSTTNPlanPositionsKOD_CELL: TFIBStringField
      DisplayLabel = 'Код соты'
      FieldName = 'KOD_CELL'
      Size = 15
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsDISTANCE: TFIBFloatField
      FieldName = 'DISTANCE'
    end
    object MegaDSTTNPlanPositionsOUTLET_RECID: TFIBIntegerField
      FieldName = 'OUTLET_RECID'
    end
    object MegaDSTTNPlanPositionsOUTLET_BASEID: TFIBIntegerField
      FieldName = 'OUTLET_BASEID'
    end
    object MegaDSTTNPlanPositionsPOS_CNT: TIntegerField
      FieldName = 'POS_CNT'
    end
    object MegaDSTTNPlanPositionsORDER_RECID: TIntegerField
      FieldName = 'ORDER_RECID'
    end
    object MegaDSTTNPlanPositionsORDER_BASEID: TIntegerField
      FieldName = 'ORDER_BASEID'
    end
    object MegaDSTTNPlanPositionsKOMPLEKTOVSCHIK: TStringField
      FieldName = 'KOMPLEKTOVSCHIK'
      Size = 45
    end
    object MegaDSTTNPlanPositionscost_kg: TFloatField
      FieldName = 'cost_kg'
      DisplayFormat = ',0.00;-,0.00;#'
    end
    object MegaDSTTNPlanPositionscost_one_pos: TFloatField
      FieldName = 'cost_one_pos'
      DisplayFormat = ',0.00;-,0.00;#'
    end
    object MegaDSTTNPlanPositionscost_sku: TFloatField
      FieldName = 'cost_sku'
      DisplayFormat = ',0.00;-,0.00;#'
    end
    object MegaDSTTNPlanPositionscost_sum: TFloatField
      FieldName = 'cost_sum'
      DisplayFormat = ',0.00;-,0.00;#'
    end
    object MegaDSTTNPlanPositionsDISTANCE_TT: TFloatField
      FieldName = 'DISTANCE_TT'
    end
    object fbfltfldMegaDSTTNPlanPositionsNUM_KM: TFIBFloatField
      FieldName = 'NUM_KM'
    end
    object MegaDSTTNPlanPositionsNOTES: TFIBStringField
      FieldName = 'NOTES'
      Size = 255
      EmptyStrToNull = True
    end
    object MegaDSTTNPlanPositionsPLACES_NUM_KM: TFIBFloatField
      FieldName = 'PLACES_NUM_KM'
    end
    object MegaDSTTNPlanPositionsIS_FED_MARKA: TFIBIntegerField
      FieldName = 'IS_FED_MARKA'
    end
    object MegaDSTTNPlanPositionsPARENT_RECID: TFIBIntegerField
      FieldName = 'PARENT_RECID'
    end
    object MegaDSTTNPlanPositionsPARENT_BASEID: TFIBIntegerField
      FieldName = 'PARENT_BASEID'
    end
  end
  object DBSumListTTNPlanPositions: TDBSumList
    DataSet = MegaDSTTNPlanPositions
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'WEIGHT_TONN'
        GroupOperation = goSum
      end>
    VirtualRecords = False
    Left = 332
    Top = 515
  end
  object MegaSelDKDialogExpeditor: TMegaSelDKDialog
    Database = DM.Money
    Transaction = Transaction
    Options = []
    GroupFilter = '3,21,50,150,1200'
    Left = 591
    Top = 274
  end
  object qPlan_Count: TMegaQuery
    Transaction = DM.trMainRO
    Database = DM.Money
    Left = 664
    Top = 70
  end
  object tblTTN_Migrat: TMegaDataSet
    SelectSQL.Strings = (
      'select tp.plannumber'
      '  from ttn_plan tp'
      'where tp.plandate=:plandate and tp.baseid=:baseid')
    Transaction = DM.trMainRO
    Database = DM.Money
    DataSource = dsPlan
    DefaultFormats.NumericEditFormat = '0'
    Left = 704
    Top = 263
    object tblTTN_MigratPLANNUMBER: TIntegerField
      FieldName = 'PLANNUMBER'
    end
  end
  object frTTNRep: TfrReport
    Dataset = frDBTTNPos
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 556
    Top = 202
    ReportForm = {
      1900000073180000190000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00001200000024000000120000002400000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000028000000F60200003E0000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200390100000E005265706F72
      7453756D6D617279310002010000000098010000F60200001200000030000100
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000200A40100000B0050616765466F6F746572310002010000000068010000F6
      0200000E0000003000030001000000000000000000FFFFFF1F00000000000000
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200190200000B004D6173746572446174613100
      020100000000E4000000F6020000120000003100050001000000000000000000
      FFFFFF1F000000000A006672444254544E506F7300000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000200860200000D004D61737465724865616465723100020100000000A80000
      00F60200001A0000003100040001000000000000000000FFFFFF1F0000000000
      0000000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200F10200000B0050616765486561646572
      31000201000000007C000000F602000012000000300002000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002005E0300000D
      004D6173746572466F6F74657231000201000000000C010000F6020000120000
      003100060001000000000000000000FFFFFF1F00000000000000000000000000
      FFFF000000000002000000010000000000000001000000C80000001400000001
      00000000000000002D04000005004D656D6F310002001200000044000000D202
      0000120000000300000001000000000000000000FFFFFF1F2C02000000000001
      005100CDE0EAEBE0E4EDFBE520E220ECE0F0F8F0F3F2E520B9205B4D65676144
      5354544E506C616E2E22504C414E4E554D424552225D20EEF2205B4D65676144
      5354544E506C616E2E22504C414E44415445225D00000000FFFF000000000002
      00000001000000040500417269616C000A0000000200000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000CD04000005004D656D
      6F320002005002000068010000880000000E0000000300000001000000000000
      000000FFFFFF1F2C02000000000001002200F1F2F0E0EDE8F6E020B9205B5041
      4745235D20E8E7205B544F54414C50414745535D00000000FFFF000000000002
      00000001000000000500417269616C000800000000000000000009000000CC00
      020000000000FFFFFF00000000020000000000000000005005000005004D656D
      6F3300020014000000A8000000180000001A00000003000E0001000000000000
      000000FFFFFF1F2C02000000000001000500B920EF2FEF00000000FFFF000000
      00000200000001000000000500417269616C0008000000000000000000090000
      00CC00020000000000FFFFFF0000000002000000000000000000F00500000500
      4D656D6F3400020014000000E4000000180000001200000003000E0001000000
      000000000000FFFFFF1F2C020000000000010022005B4D656761445354544E50
      6C616E506F736974696F6E732E22504F535F4E554D225D00000000FFFF000000
      00000200000001000000000500417269616C00080000000000000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000710600000500
      4D656D6F350002002C000000A8000000280000001A00000003000E0001000000
      000000000000FFFFFF1F2C02000000000001000300D2E8EF00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000A00
      0000CC00020000000000FFFFFF00000000020000000000000000001107000005
      004D656D6F360002002C000000E4000000280000001200000003000E00010000
      00000000000000FFFFFF1F2C020000000000010022005B4D656761445354544E
      506C616E506F736974696F6E732E22444F4354595045225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000A00
      0000CC00020000000000FFFFFF00000000020000000000000000009507000005
      004D656D6F3700020054000000A8000000280000001A00000003000E00010000
      00000000000000FFFFFF1F2C02000000000001000600B920EDE0EAEB00000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000000037
      08000005004D656D6F3800020054000000E4000000280000001200000003000E
      0001000000000000000000FFFFFF1F2C020000000000010024005B4D65676144
      5354544E506C616E506F736974696F6E732E22444F434E554D424552225D0000
      0000FFFF00000000000200000001000000000500417269616C00070000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      00C308000005004D656D6F390002007C000000A80000002C0000001A00000003
      000E0001000000000000000000FFFFFF1F2C02000000000001000E00C2F0E5EC
      FF20E4EEF1F2E0E2EAE800000000FFFF00000000000200000001000000000500
      417269616C00070000000000000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000006D09000006004D656D6F31300002007C000000
      E40000002C0000001200000003000E0001000000000000000000FFFFFF1F2C02
      000000000001002B005B4D656761445354544E506C616E506F736974696F6E73
      2E225265735F64656C697665727954696D65225D00000000FFFF000000000002
      00000001000000000500417269616C00070000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000F509000006004D656D
      6F3131000200A8000000A80000003C0000001A00000003000E00010000000000
      00000000FFFFFF1F2C02000000000001000900CDE0F12EEFF3EDEAF200000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000000099
      0A000006004D656D6F3132000200A8000000E40000003C000000120000000700
      0E0001000000000000000000FFFFFF1F2C020000000000010025005B4D656761
      445354544E506C616E506F736974696F6E732E224E41535F505F4E414D45225D
      00000000FFFF00000000000200000001000000000500417269616C0007000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000001D0B000006004D656D6F3133000200E4000000A8000000640000001A00
      000003000E0001000000000000000000FFFFFF1F2C02000000000001000500C0
      E4F0E5F100000000FFFF00000000000200000001000000000500417269616C00
      080000000000000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000BE0B000006004D656D6F3134000200E4000000E40000006400
      00001200000007000E0001000000000000000000FFFFFF1F2C02000000000001
      0022005B4D656761445354544E506C616E506F736974696F6E732E2241444452
      455353225D00000000FFFF00000000000200000001000000000500417269616C
      000700000000000000000008000000CC00020000000000FFFFFF000000000200
      0000000000000000440C000006004D656D6F313500020048010000A800000020
      0000001A00000003000E0001000000000000000000FFFFFF1F2C020000000000
      01000700C2E5F12C20F22E00000000FFFF000000000002000000010000000005
      00417269616C00080000000000000000000A000000CC00020000000000FFFFFF
      0000000002000000000000000000E90C000006004D656D6F3136000200480100
      00E4000000200000001200000003000E0001000000000000000000FFFFFF1F2C
      020301000000010026005B4D656761445354544E506C616E506F736974696F6E
      732E225745494748545F544F4E4E225D00000000FFFF00000000000200000001
      000000000500417269616C00070000000000000000000A000000CC0002000000
      0000FFFFFF00000000020000000000000000006B0D000006004D656D6F313700
      020068010000A8000000200000001A00000003000E0001000000000000000000
      FFFFFF1F2C02000000000001000300F8F22E00000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000EE0D000006004D656D6F31
      3800020088010000A8000000200000001A00000003000E000100000000000000
      0000FFFFFF1F2C02000000000001000400FFF9E8EA00000000FFFF0000000000
      0200000001000000000500417269616C00080000000000000000000A000000CC
      00020000000000FFFFFF00000000020000000000000000008E0E000006004D65
      6D6F313900020068010000E4000000200000001200000003000E000100000000
      0000000000FFFFFF1F2C000001000000010021005B4D656761445354544E506C
      616E506F736974696F6E732E224B4F4C494348225D00000000FFFF0000000000
      0200000001000000000500417269616C00070000000000000000000A000000CC
      00020000000000FFFFFF0000000002000000000000000000310F000006004D65
      6D6F323000020088010000E4000000200000001200000003000E000100000000
      0000000000FFFFFF1F2C020301000000010024005B4D656761445354544E506C
      616E506F736974696F6E732E22424F585F434F554E54225D00000000FFFF0000
      0000000200000001000000000500417269616C00070000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000B40F000006
      004D656D6F3231000200A8010000A8000000180000001A00000003000E000100
      0000000000000000FFFFFF1F2C02000000000001000400ECE5F1F200000000FF
      FF00000000000200000001000000000500417269616C00070000000000000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000005A10
      000006004D656D6F3232000200A8010000E4000000180000001200000043000E
      0001000000000000000000FFFFFF1F2C020301000000010027005B4D65676144
      5354544E506C616E506F736974696F6E732E22504C414345535F434F554E5422
      5D00000000FFFF00000000000200000001000000000500417269616C00070000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000DE10000006004D656D6F3233000200C0010000A8000000340000001A
      00000003000E0001000000000000000000FFFFFF1F2C02000000000001000500
      F1F3ECECE000000000FFFF00000000000200000001000000000500417269616C
      00080000000000000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000007E11000006004D656D6F3234000200C0010000E400000034
      0000001200000043000E0001000000000000000000FFFFFF1F2C020101000000
      010021005B4D656761445354544E506C616E506F736974696F6E732E2253554D
      4D4131225D00000000FFFF00000000000200000001000000000500417269616C
      00070000000000000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000000112000006004D656D6F3235000200F4010000A80000007C
      0000001A00000003000E0001000000000000000000FFFFFF1F2C020000000000
      01000400CAEEECF300000000FFFF000000000002000000010000000005004172
      69616C00080000000000000000000A000000CC00020000000000FFFFFF000000
      00020000000000000000008512000006004D656D6F323600020070020000A800
      0000740000001A00000003000F0001000000000000000000FFFFFF1F2C020000
      00000001000500D7E5F0E5E700000000FFFF0000000000020000000100000000
      0500417269616C00080000000000000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000002E13000006004D656D6F3237000200F401
      0000E40000007C0000001200000043000E0001000000000000000000FFFFFF1F
      2C02010100000001002A005B4D656761445354544E506C616E506F736974696F
      6E732E2253484F52544E414D455F444B5F544F225D00000000FFFF0000000000
      0200000001000000000500417269616C000700000000000000000008000000CC
      00020000000000FFFFFF0000000002000000000000000000D613000006004D65
      6D6F323800020070020000E4000000740000001200000043000F000100000000
      0000000000FFFFFF1F2C020101000000010029005B4D656761445354544E506C
      616E506F736974696F6E732E2253484F52544E414D455F444B5F43225D000000
      00FFFF00000000000200000001000000000500417269616C0007000000000000
      00000008000000CC00020000000000FFFFFF0000000002000000000000000000
      5314000006004D656D6F3239000200120000007C000000D20200001200000003
      00000001000000000000000000FFFFFF1F2C020000000000000000000000FFFF
      00000000000200000001000000040500417269616C0007000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000001500
      0006004D656D6F3330000200480100000C010000200000001200000003000E00
      01000000000000000000FFFFFF1F2C02030100000001002E00205B53554D285B
      4D656761445354544E506C616E506F736974696F6E732E225745494748545F54
      4F4E4E225D295D00000000FFFF00000000000200000001000000000500417269
      616C00080000000200000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000A715000006004D656D6F3331000200680100000C0100
      00200000001200000003000E0001000000000000000000FFFFFF1F2C00000100
      0000010028005B53554D285B4D656761445354544E506C616E506F736974696F
      6E732E224B4F4C494348225D295D00000000FFFF000000000002000000010000
      00000500417269616C00080000000200000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000005116000006004D656D6F3332000200
      880100000C010000200000001200000003000E0001000000000000000000FFFF
      FF1F2C02030100000001002B005B53554D285B4D656761445354544E506C616E
      506F736974696F6E732E22424F585F434F554E54225D295D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000200000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000FE16000006
      004D656D6F3333000200A80100000C010000180000001200000003000F000100
      0000000000000000FFFFFF1F2C02030100000001002E005B53554D285B4D6567
      61445354544E506C616E506F736974696F6E732E22504C414345535F434F554E
      54225D295D00000000FFFF00000000000200000001000000000500417269616C
      00080000000200000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000008317000006004D656D6F3334000200140000000C01000034
      0100001200000003000F0001000000000000000000FFFFFF1F2C020000000000
      01000600C2F1E5E3EE2000000000FFFF00000000000200000001000000000500
      417269616C000A00000002000000000010000000CC00020000000000FFFFFF00
      000000020000000000000000000218000006004D656D6F3335000200C0010000
      0C010000240100001200000003000F0001000000000000000000FFFFFF1F2C02
      00000000000100000000000000FFFF0000000000020000000100000000050041
      7269616C000A00000002000000000008000000CC00020000000000FFFFFF0000
      00000200000000000000FEFEFF00000000020000000D004D656761445354544E
      506C616E0000000016004D656761445354544E506C616E506F736974696F6E73
      00000000010000000A006672444254544E506F7300000000FC00000000000000
      000000000000000000580006F6E77CB4EDE240935E4BC90D56E640}
  end
  object frDBTTNPos: TfrDBDataSet
    DataSource = dsPlanPositions
    Left = 608
    Top = 202
  end
  object qrDop: TMegaQuery
    Transaction = tran_Dop
    Database = DM.Money
    Left = 956
    Top = 66
  end
  object tran_Dop: TMegaTransaction
    DefaultDatabase = DM.Money
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 644
    Top = 142
  end
  object MegaDSSortingLot: TMegaDSSortingLot
    UpdateSQL.Strings = (
      ' UPDATE SORT_LOT SET '
      '     CREATE_TIME = :CREATE_TIME, '
      '     NAKL_RECID  = :NAKL_RECID, '
      '     NAKL_BASEID = :NAKL_BASEID,'
      '     IS_PROV     = :IS_PROV '
      '  WHERE   LOTDATE   = :OLD_LOTDATE '
      '      and LOTNUMBER = :OLD_LOTNUMBER '
      '      and BASEID    = :OLD_BASEID ')
    DeleteSQL.Strings = (
      ' DELETE FROM SORT_LOT '
      '  WHERE '
      '          LOTDATE   = :OLD_LOTDATE '
      '      and LOTNUMBER = :OLD_LOTNUMBER '
      '      and BASEID    = :OLD_BASEID ')
    InsertSQL.Strings = (
      ' INSERT INTO SORT_LOT( '
      '     LOTDATE, '
      '     LOTNUMBER, '
      '     BASEID, '
      '     CFO, '
      '     CREATE_TIME, '
      '     NAKL_RECID, '
      '     NAKL_BASEID,'
      '     IS_PROV '
      ' ) '
      ' VALUES( '
      '     :LOTDATE, '
      '     :LOTNUMBER, '
      '     :BASEID, '
      '     :CFO, '
      '     :CREATE_TIME, '
      '     :NAKL_RECID, '
      '     :NAKL_BASEID,'
      '     :IS_PROV '
      ' ) ')
    RefreshSQL.Strings = (
      ' select '
      '   sl.lotdate, '
      '   sl.lotnumber, '
      '   sl.baseid, '
      '   sl.create_time, '
      '   sl.nakl_recid, '
      '   sl.nakl_baseid,'
      '   sl.IS_PROV  '
      ' from sort_lot sl '
      '  WHERE '
      '     ( '
      '             sl.LOTDATE = :OLD_LOTDATE '
      '      and sl.LOTNUMBER = :OLD_LOTNUMBER '
      '      and sl.BASEID = :OLD_BASEID '
      '     ) ')
    SelectSQL.Strings = (
      ' select '
      '   sl.lotdate, '
      '   sl.lotnumber, '
      '   sl.baseid, '
      '   sl.cfo, '
      '   sl.create_time, '
      '   sl.nakl_recid, '
      '   sl.nakl_baseid,'
      '   sl.IS_PROV,'
      '   sl.KIND '
      ' from sort_lot sl '
      ' where '
      '     sl.lotdate = :LOTDATE '
      ' and sl.baseid  = :BASEID '
      ' and sl.cfo     = :CFO '
      ' and sl.kind    = :lot_kind'
      'order by'
      '  sl.lotnumber')
    AfterPost = MegaDSTTNPlanAfterPost
    Transaction = DM.trMainRO
    Database = DM.Money
    UpdateTransaction = DM.trMainWShort
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    DefaultFormats.NumericEditFormat = '0'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 752
    Top = 467
    object MegaDSSortingLotLOTDATE: TDateTimeField
      FieldName = 'LOTDATE'
    end
    object MegaDSSortingLotLOTNUMBER: TIntegerField
      FieldName = 'LOTNUMBER'
    end
    object MegaDSSortingLotBASEID: TIntegerField
      FieldName = 'BASEID'
    end
    object MegaDSSortingLotCFO: TIntegerField
      FieldName = 'CFO'
    end
    object MegaDSSortingLotCREATE_TIME: TMegaStringField
      FieldName = 'CREATE_TIME'
      Size = 10
      EmptyStrToNull = True
    end
    object MegaDSSortingLotNAKL_RECID: TIntegerField
      FieldName = 'NAKL_RECID'
    end
    object MegaDSSortingLotNAKL_BASEID: TIntegerField
      FieldName = 'NAKL_BASEID'
    end
    object MegaDSSortingLotIS_PROV: TIntegerField
      FieldName = 'IS_PROV'
    end
    object MegaDSSortingLotKIND: TIntegerField
      FieldName = 'KIND'
    end
  end
  object MegaDSSortingLotPositions: TMegaDSSortingLotPositions
    UpdateSQL.Strings = (
      ' UPDATE SORT_LOT_POSITIONS SET '
      '   LOTDATE = :LOTDATE, '
      '   LOTNUMBER = :LOTNUMBER ,'
      '   BASEID = :BASEID ,'
      '   NAKL_RECID = :NAKL_RECID ,'
      '   NAKL_BASEID = :NAKL_BASEID '
      ' WHERE '
      '             LOTDATE = :OLD_LOTDATE '
      '      and LOTNUMBER = :OLD_LOTNUMBER '
      '      and BASEID = :OLD_BASEID '
      '      and NAKL_RECID = :OLD_NAKL_RECID '
      '      and NAKL_BASEID = :OLD_NAKL_BASEID ')
    DeleteSQL.Strings = (
      ' DELETE FROM SORT_LOT_POSITIONS '
      '  WHERE '
      '             LOTDATE = :OLD_LOTDATE '
      '      and LOTNUMBER = :OLD_LOTNUMBER '
      '      and BASEID = :OLD_BASEID '
      '      and NAKL_RECID = :OLD_NAKL_RECID '
      '      and NAKL_BASEID = :OLD_NAKL_BASEID ')
    InsertSQL.Strings = (
      ' INSERT INTO SORT_LOT_POSITIONS( '
      '     LOTDATE, '
      '     LOTNUMBER, '
      '     BASEID, '
      '     NAKL_RECID, '
      '     NAKL_BASEID '
      ' ) '
      ' VALUES( '
      '     :LOTDATE, '
      '     :LOTNUMBER, '
      '     :BASEID, '
      '     :NAKL_RECID, '
      '     :NAKL_BASEID '
      ' ) ')
    RefreshSQL.Strings = (
      ' select '
      '   slp.lotdate, '
      '   slp.lotnumber, '
      '   slp.baseid, '
      '   slp.nakl_recid, '
      '   slp.nakl_baseid ,'
      ''
      '   DN.OPERDATE,'
      '   DN.DOCTYPE,'
      '   DN.DOCNUMBER,'
      '   DN.GROUP_OPER,'
      '   DN.KOD_OPER,'
      '   DN.DK_FROM,'
      '   DN.DK_TO,'
      '   DN.DK_C,'
      '   DN.SUMMA1,'
      '   DN.KOLICH_,'
      '   SPRAV_GROPER.GROUP_NAME,'
      '   SPRAV_OPER.NAME_OPER,'
      '   DK_FROM.SHORTNAME_DK SHORTNAME_DK_FROM,'
      '   DK_TO.SHORTNAME_DK SHORTNAME_DK_TO,'
      '   DK_C.SHORTNAME_DK SHORTNAME_DK_C'
      ''
      ' from SORT_LOT_POSITIONS slp '
      
        '   left join DOC_NAKL dn on (dn.recid = slp.nakl_recid and dn.ba' +
        'seid = slp.nakl_baseid)'
      '   LEFT OUTER JOIN SPRAV_DK DK_C ON (DN.DK_C = DK_C.KOD_DK)'
      
        '   LEFT OUTER JOIN SPRAV_GROPER ON (DN.GROUP_OPER = SPRAV_GROPER' +
        '.GROUP_OPER)'
      
        '   LEFT OUTER JOIN SPRAV_OPER ON (DN.KOD_OPER = SPRAV_OPER.KOD_O' +
        'PER) AND (DN.GROUP_OPER = SPRAV_OPER.GROUP_OPER)'
      
        '   LEFT OUTER JOIN SPRAV_DK DK_FROM ON (DN.DK_FROM = DK_FROM.KOD' +
        '_DK)'
      '   LEFT OUTER JOIN SPRAV_DK DK_TO ON (DN.DK_TO = DK_TO.KOD_DK)'
      '  WHERE '
      '     ( '
      '             slp.LOTDATE = :OLD_LOTDATE '
      '      and slp.LOTNUMBER = :OLD_LOTNUMBER '
      '      and slp.BASEID = :OLD_BASEID '
      '      and slp.NAKL_RECID = :OLD_NAKL_RECID '
      '      and slp.NAKL_BASEID = :OLD_NAKL_BASEID '
      '     ) ')
    SelectSQL.Strings = (
      ' select '
      '   slp.lotdate, '
      '   slp.lotnumber, '
      '   slp.baseid, '
      '   slp.nakl_recid, '
      '   slp.nakl_baseid ,'
      ''
      '   DN.OPERDATE,'
      '   DN.DOCTYPE,'
      '   DN.DOCNUMBER,'
      '   DN.GROUP_OPER,'
      '   DN.KOD_OPER,'
      '   DN.DK_FROM,'
      '   DN.DK_TO,'
      '   DN.DK_C,'
      '   DN.SUMMA1,'
      '   DN.KOLICH_,'
      '   SPRAV_GROPER.GROUP_NAME,'
      '   SPRAV_OPER.NAME_OPER,'
      '   DK_FROM.SHORTNAME_DK SHORTNAME_DK_FROM,'
      '   DK_TO.SHORTNAME_DK SHORTNAME_DK_TO,'
      '   DK_C.SHORTNAME_DK SHORTNAME_DK_C,'
      '   STN.WORK_WITH_EDI, STN.USE_EDI_INVOICE, '
      
        '   STN.USE_EDI_ORDRSP -STN.IS_EDI_ONE_ORDRSP  as USE_EDI_ORDRSP,' +
        ' '
      '   STN.USE_EDI_DESADV,'
      '   gds.doc_summa,'
      '   dl.mob_order_guid,'
      '   pr_fed.res is_fed_marka'
      ' from SORT_LOT_POSITIONS slp '
      
        '   left join DOC_NAKL dn on (dn.recid = slp.nakl_recid and dn.ba' +
        'seid = slp.nakl_baseid)'
      
        '   left join IS_NAKL_FED_MARKA(dn.recid, dn.baseid) pr_fed on 1=' +
        '1'
      
        '   left join DELIVERY_LOCATION DL on (DL.DOCRECNO = DN.RECID and' +
        ' DL.BASEID = DN.BASEID and DL.FORMTYPE = 1)'
      '   LEFT OUTER JOIN SPRAV_DK DK_C ON (DN.DK_C = DK_C.KOD_DK)'
      
        '   LEFT OUTER JOIN SPRAV_GROPER ON (DN.GROUP_OPER = SPRAV_GROPER' +
        '.GROUP_OPER)'
      
        '   LEFT OUTER JOIN SPRAV_OPER ON (DN.KOD_OPER = SPRAV_OPER.KOD_O' +
        'PER) AND (DN.GROUP_OPER = SPRAV_OPER.GROUP_OPER)'
      
        '   LEFT OUTER JOIN SPRAV_DK DK_FROM ON (DN.DK_FROM = DK_FROM.KOD' +
        '_DK)'
      '   LEFT OUTER JOIN SPRAV_DK DK_TO ON (DN.DK_TO = DK_TO.KOD_DK)'
      
        '   left join SPRAV_TRADE_NETWORK STN on STN.RECID = DK_TO.TRADE_' +
        'NETWORK'
      '   left join GET_DOC_SUMM(dn.recid, dn.baseid, 1) gds on 1=1'
      ' where slp.lotdate = :LOTDATE '
      '  and  slp.lotnumber = :LOTNUMBER  '
      '  and slp.BASEID = :BASEID '
      
        '  and ((SELECT IS_SHOW FROM IS_NAKL_SHOW_IN_LIST(dn.recid, dn.ba' +
        'seid)) = 1)')
    AfterPost = MegaDSTTNPlanAfterPost
    Transaction = DM.trMainRO
    Database = DM.Money
    UpdateTransaction = DM.trMainWShort
    DataSource = dsMegaDSSortingLot
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    DefaultFormats.NumericEditFormat = '0'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 648
    Top = 450
    object MegaDSSortingLotPositionsLOTDATE: TDateTimeField
      FieldName = 'LOTDATE'
    end
    object MegaDSSortingLotPositionsLOTNUMBER: TIntegerField
      FieldName = 'LOTNUMBER'
    end
    object MegaDSSortingLotPositionsBASEID: TIntegerField
      FieldName = 'BASEID'
    end
    object MegaDSSortingLotPositionsNAKL_RECID: TIntegerField
      FieldName = 'NAKL_RECID'
    end
    object MegaDSSortingLotPositionsNAKL_BASEID: TIntegerField
      FieldName = 'NAKL_BASEID'
    end
    object MegaDSSortingLotPositionsOPERDATE: TDateTimeField
      FieldName = 'OPERDATE'
    end
    object MegaDSSortingLotPositionsDOCTYPE: TMegaStringField
      FieldName = 'DOCTYPE'
      Size = 6
      EmptyStrToNull = True
    end
    object MegaDSSortingLotPositionsDOCNUMBER: TIntegerField
      FieldName = 'DOCNUMBER'
    end
    object MegaDSSortingLotPositionsGROUP_OPER: TIntegerField
      FieldName = 'GROUP_OPER'
    end
    object MegaDSSortingLotPositionsKOD_OPER: TIntegerField
      FieldName = 'KOD_OPER'
    end
    object MegaDSSortingLotPositionsDK_FROM: TFloatField
      FieldName = 'DK_FROM'
    end
    object MegaDSSortingLotPositionsDK_TO: TFloatField
      FieldName = 'DK_TO'
    end
    object MegaDSSortingLotPositionsDK_C: TFloatField
      FieldName = 'DK_C'
    end
    object MegaDSSortingLotPositionsSUMMA1: TFloatField
      FieldName = 'SUMMA1'
    end
    object MegaDSSortingLotPositionsKOLICH_: TFloatField
      FieldName = 'KOLICH_'
      DisplayFormat = '#0'
    end
    object MegaDSSortingLotPositionsGROUP_NAME: TMegaStringField
      FieldName = 'GROUP_NAME'
      Size = 45
      EmptyStrToNull = True
    end
    object MegaDSSortingLotPositionsNAME_OPER: TMegaStringField
      FieldName = 'NAME_OPER'
      Size = 50
      EmptyStrToNull = True
    end
    object MegaDSSortingLotPositionsSHORTNAME_DK_FROM: TMegaStringField
      FieldName = 'SHORTNAME_DK_FROM'
      Size = 45
      EmptyStrToNull = True
    end
    object MegaDSSortingLotPositionsSHORTNAME_DK_TO: TMegaStringField
      FieldName = 'SHORTNAME_DK_TO'
      Size = 45
      EmptyStrToNull = True
    end
    object MegaDSSortingLotPositionsSHORTNAME_DK_C: TMegaStringField
      FieldName = 'SHORTNAME_DK_C'
      Size = 45
      EmptyStrToNull = True
    end
    object MegaDSSortingLotPositionsMOB_ORDER_GUID: TFIBStringField
      FieldName = 'MOB_ORDER_GUID'
      EmptyStrToNull = True
    end
    object MegaDSSortingLotPositionsWORK_WITH_EDI: TFIBIntegerField
      FieldName = 'WORK_WITH_EDI'
    end
    object MegaDSSortingLotPositionsUSE_EDI_INVOICE: TFIBIntegerField
      FieldName = 'USE_EDI_INVOICE'
    end
    object MegaDSSortingLotPositionsUSE_EDI_ORDRSP: TFIBIntegerField
      FieldName = 'USE_EDI_ORDRSP'
    end
    object MegaDSSortingLotPositionsUSE_EDI_DESADV: TFIBIntegerField
      FieldName = 'USE_EDI_DESADV'
    end
    object MegaDSSortingLotPositionsDOC_SUMMA: TFIBFloatField
      FieldName = 'DOC_SUMMA'
    end
    object MegaDSSortingLotPositionsIS_FED_MARKA: TIntegerField
      FieldName = 'IS_FED_MARKA'
    end
  end
  object dsMegaDSSortingLot: TDataSource
    DataSet = MegaDSSortingLot
    Left = 488
    Top = 472
  end
  object mTrans: TMegaTransaction
    DefaultDatabase = DM.Money
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed'
      'rec_version')
    TPBMode = tpbDefault
    Left = 404
    Top = 296
  end
  object qrTempMarsh: TMegaQuery
    Transaction = DM.trMainRO
    Database = DM.Money
    Left = 812
    Top = 66
  end
  object qrTempMarshUpd: TMegaQuery
    Transaction = DM.trMainWShort
    Database = DM.Money
    Left = 728
    Top = 150
  end
  object DBSumListTTNPlan: TDBSumList
    DataSet = MegaDSTTNPlan
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'SUM_TTN_PDV'
        GroupOperation = goSum
      end
      item
        FieldName = 'SUM_IN_NAKL'
        GroupOperation = goSum
      end>
    VirtualRecords = False
    Left = 336
    Top = 183
  end
  object frxRepSchet: TfrxReport
    Version = '4.7.61'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'По умолчанию'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39590.518814375000000000
    ReportOptions.LastChange = 39590.518814375000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepSchetGetValue
    Left = 392
    Top = 216
    Datasets = <
      item
        DataSet = frxRepSchet.FIBQuery1
        DataSetName = 'FIBQuery1'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'Operdate'
        Value = Null
      end
      item
        Name = 'BASEID'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object FIBQuery1: TfrxFIBQuery
        UserName = 'FIBQuery1'
        CloseDataSource = True
        FieldAliases.Strings = (
          'GROUP_NAME=GROUP_NAME'
          'NAME_MATER=NAME_MATER'
          'KOL_NOTVIP=KOL_NOTVIP'
          'KOL_VIP=KOL_VIP'
          'KOL_ALL=KOL_ALL')
        BCDToCurrency = False
        IgnoreDupParams = False
        Params = <
          item
            Name = 'operdate'
            DataType = ftDateTime
            Expression = '<Operdate>'
          end
          item
            Name = 'baseid'
            DataType = ftInteger
            Expression = '<BASEID>'
          end
          item
            Name = 'operdate'
            DataType = ftDateTime
            Expression = '<Operdate>'
          end>
        SQL.Strings = (
          ''
          'SELECT gm.GROUP_NAME,sm.NAME_MATER,'
          
            '  sum((CASE when sa.IS_HORECA=3 then 0 else dsp.KOLICH END)) kol' +
            '_notVIP,'
          
            '  sum((CASE when sa.IS_HORECA=3 then dsp.KOLICH else 0 END)) kol' +
            '_VIP,'
          '  sum(dsp.KOLICH) kol_ALL'
          'from proc_get_nakl_for_ttn(:operdate, :baseid ) ds'
          
            'left join DOC_NAKL_POS dsp on dsp.DOCRECNO=ds.RECID and dsp.BASE' +
            'ID=ds.BASEID'
          
            'left join DELIVERY_LOCATION dl on dl.FORMTYPE=5 and dl.DOCRECNO=' +
            'ds.RECID and dl.BASEID=ds.BASEID'
          
            'left join SPRAV_TRADE_OUTLET sto on sto.RECID=dl.OUTLET_RECID an' +
            'd sto.BASEID=dl.OUTLET_BASEID'
          
            'left JOIN sprav_area SA on sa.AREA_ID=sto.ACTIVE_AREA_ID AND sa.' +
            'BASEID=sto.ACTIVE_AREA_BASE_ID'
          'left join sprav_mater SM on sm.KOD_MATER=dsp.KOD_MATER'
          'left join GROUP_MATER gm ON gm.GROUP_MATER=sm.GROUP_MATER'
          'where'
          'gm.GROUP_NAME<>'#39#39
          'and  ds.OPERDATE=:operdate'
          'GROUP BY 1,2'
          'order by 1,2')
        pLeft = 60
        pTop = 20
        Parameters = <
          item
            Name = 'operdate'
            DataType = ftDateTime
            Expression = '<Operdate>'
          end
          item
            Name = 'baseid'
            DataType = ftInteger
            Expression = '<BASEID>'
          end
          item
            Name = 'operdate'
            DataType = ftDateTime
            Expression = '<Operdate>'
          end>
      end
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 160.000000000000000000
        Width = 740.409927000000000000
        DataSet = frxRepSchet.FIBQuery1
        DataSetName = 'FIBQuery1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Align = baLeft
          Left = 37.795275590000000000
          Width = 151.181102360000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[FIBQuery1."GROUP_NAME"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Left = 548.031496060000000000
          Width = 94.488188980000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[FIBQuery1."KOL_VIP"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 453.543307080000000000
          Width = 94.488188980000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[FIBQuery1."KOL_NOTVIP"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 642.519685040000000000
          Width = 94.488188980000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[FIBQuery1."KOL_ALL"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baLeft
          Left = 188.976377950000000000
          Width = 264.566929130000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[FIBQuery1."NAME_MATER"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 120.000000000000000000
        Width = 740.409927000000000000
        object Memo7: TfrxMemoView
          Align = baLeft
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'в„– РїРї')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baLeft
          Left = 37.795275590000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'РўРњ')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Left = 188.976377950000000000
          Width = 264.566929133858200000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'РќРѕРјРµРЅРєР»Р°С‚СѓСЂР° ')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          Left = 453.543307083858200000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'РљРѕР»-РІРѕ РѕР±С‹С‡РЅС‹Рµ ')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Left = 548.031496063858200000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'РљРѕР»-РІРѕ VIP')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          Left = 642.519685043858200000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'РС‚РѕРіРѕ')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 83.149660000000000000
        Top = 16.000000000000000000
        Width = 740.409927000000000000
        object Memo13: TfrxMemoView
          Left = 158.740260000000000000
          Width = 381.732530000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              'РџРѕС‚СЂРµР±РЅРѕСЃС‚СЊ РІ РїСЂРѕРґСѓРєС†РёРё РїРѕРґ Р·Р°СЏРІРєРё' +
              ' РўРђ '
            
              'РїРѕ СЃС‡С‘С‚Сѓ/СЃРєР»Р°РґСѓ РїСЂРѕРґСѓРєС†РёРё Р›Р’Р— "РҐРѕСЂС‚' +
              'РёС†Р°"'
            'РїРѕ СЃРѕСЃС‚РѕСЏРЅРёСЋ РЅР° [Time]   [Operdate]    ')
          ParentFont = False
        end
      end
    end
  end
  object frxFIBComponents1: TfrxFIBComponents
    DefaultDatabase = DM.Money
    Left = 296
    Top = 216
  end
  object pmOrder: TPopupMenu
    Left = 952
    Top = 336
    object N15: TMenuItem
      Action = ActInsertNar
      Left = 12345
    end
    object N16: TMenuItem
      Action = ActEditNar
      Left = 12345
    end
    object N17: TMenuItem
      Action = actDelNar
      Left = 12345
    end
    object N18: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N19: TMenuItem
      Action = actPrintKomplOrder
      Left = 12345
    end
    object N20: TMenuItem
      Action = actPrintKompMarshrut
      Left = 12345
    end
    object N21: TMenuItem
      Action = actPrintPeriod
      Left = 12345
    end
    object N22: TMenuItem
      Action = actPrintPeriodExpeditor
      Left = 12345
    end
    object N23: TMenuItem
      Action = actPrintSvodAll
      Left = 12345
    end
  end
  object mdsTTNPlanNaklsPos: TMegaRDataSet
    SelectSQL.Strings = (
      'select'
      '   gm.group_name,'
      '   sm.kod_ean,'
      '   sm.name_mater,'
      '   sm.countinbox,'
      '   sm.ed_izm,'
      '   sum(pp.sum_with_nds) summa,'
      '   sum(pp.nds) nds,'
      '   sum(dnp.kolich) kolich,'
      '   max(pp.sum_with_nds/dnp.kolich) max_price'
      'from ttn_plan ttp'
      
        '  left join ttn_plan_positions ttpp on (ttpp.plandate=ttp.planda' +
        'te and ttpp.plannumber=ttp.plannumber and ttpp.baseid=ttp.baseid' +
        ')'
      
        '  left join doc_nakl dn on (dn.recid=ttpp.nakl_recid and dn.base' +
        'id=ttpp.nakl_baseid)'
      
        '  left join doc_nakl_pos dnp on (dnp.docrecno=dn.recid and dnp.b' +
        'aseid=dn.baseid)'
      '  left join pdv_pos(dnp.recid, dnp.baseid, 1) pp on (1=1)'
      '  left join sprav_mater sm on (sm.kod_mater=dnp.kod_mater)'
      '  left join group_mater gm on (gm.group_mater=sm.group_mater)'
      
        'where ttp.plandate=:PLANDATE and ttp.plannumber=:PLANNUMBER and ' +
        'ttp.baseid=:BASEID'
      'group by'
      '   gm.group_name,'
      '   sm.kod_ean,'
      '   sm.name_mater,'
      '   sm.countinbox,'
      '   sm.ed_izm'
      'order by gm.group_name, sm.name_mater')
    UpdateTransaction = DM.trMainWShort
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 992
    Top = 480
    object mdsTTNPlanNaklsPosGROUP_NAME: TFIBStringField
      DisplayLabel = 'Группа'
      FieldName = 'GROUP_NAME'
      Size = 35
      EmptyStrToNull = True
    end
    object mdsTTNPlanNaklsPosKOD_EAN: TFIBFloatField
      DisplayLabel = 'Код EAN'
      FieldName = 'KOD_EAN'
    end
    object mdsTTNPlanNaklsPosNAME_MATER: TFIBStringField
      DisplayLabel = 'Ценность'
      FieldName = 'NAME_MATER'
      Size = 45
      EmptyStrToNull = True
    end
    object mdsTTNPlanNaklsPosCOUNTINBOX: TFIBIntegerField
      DisplayLabel = 'Кол-во в яшике'
      FieldName = 'COUNTINBOX'
    end
    object mdsTTNPlanNaklsPosED_IZM: TFIBStringField
      DisplayLabel = 'Ед.изм'
      FieldName = 'ED_IZM'
      Size = 5
      EmptyStrToNull = True
    end
    object mdsTTNPlanNaklsPosSUMMA: TFIBFloatField
      DisplayLabel = 'Сумма'
      FieldName = 'SUMMA'
    end
    object mdsTTNPlanNaklsPosNDS: TFIBFloatField
      DisplayLabel = 'НДС'
      FieldName = 'NDS'
    end
    object mdsTTNPlanNaklsPosKOLICH: TFIBFloatField
      DisplayLabel = 'Количество'
      FieldName = 'KOLICH'
    end
    object mdsTTNPlanNaklsPosMAX_PRICE: TFIBFloatField
      DisplayLabel = 'Макс. цена'
      FieldName = 'MAX_PRICE'
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Книга Excel|*.xls; *.xlsx'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 1104
    Top = 448
  end
  object fdsDKFROMNasP: TMegaRDataSet
    RefreshSQL.Strings = (
      'select'
      '  sda.RECID as RECID,'
      '  sda.BASEID as BASEID,'
      '  sda.KOD_DK as KOD_DK,'
      '  sda.NAS_P_ID as NAS_P_ID,'
      '  sda.COUNTRY_ID as COUNTRY_ID,'
      '  sda.ADDRESS as ADDRESS,'
      '  sda.AREA_ID as AREA_ID,'
      '  snp.nas_p_name as nas_p_name'
      'from SPRAV_DK_ADDRESS sda'
      
        'left join sprav_nas_p snp on (snp.nas_p_id = sda.nas_p_id and sn' +
        'p.country_id = sda.country_id)'
      'where'
      '  KOD_DK = :KOD_DK')
    SelectSQL.Strings = (
      'select distinct'
      '  sda.KOD_DK as KOD_DK,'
      '  sda.NAS_P_ID as NAS_P_ID,'
      '  sda.COUNTRY_ID as COUNTRY_ID,'
      '  snp.nas_p_name as nas_p_name'
      'from SPRAV_DK_ADDRESS sda'
      
        'left join sprav_nas_p snp on (snp.nas_p_id = sda.nas_p_id and sn' +
        'p.country_id = sda.country_id)'
      'where'
      '  sda.KOD_DK = :DK_FROM')
    Transaction = DM.trMainRO
    Database = DM.Money
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    DefaultFormats.NumericEditFormat = '0'
    Key = 'NAS_P_ID'
    AutoFetchAll = False
    AutoRefresh = True
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 185
    Top = 256
    object fdsDKFROMNasPKOD_DK: TFloatField
      FieldName = 'KOD_DK'
    end
    object fdsDKFROMNasPNAS_P_ID: TIntegerField
      FieldName = 'NAS_P_ID'
    end
    object fdsDKFROMNasPCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
    end
    object fdsDKFROMNasPNAS_P_NAME: TFIBStringField
      FieldName = 'NAS_P_NAME'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object dsDKFROMNasP: TDataSource
    DataSet = fdsDKFROMNasP
    Left = 253
    Top = 272
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 36
    Top = 100
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      Left = 12345
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 828
    Top = 528
  end
  object mqAllowCrTTN: TMegaQuery
    Transaction = DM.trMainRO
    Database = DM.Money
    SQL.Strings = (
      'select allow from TTN_MARSH_EDIT_ALLOW(:marsh_date)')
    Left = 888
    Top = 528
  end
  object ppAntor: TPopupMenu
    Left = 252
    Top = 164
    object N31: TMenuItem
      Caption = 'Выгрузить заявки'
      OnClick = N31Click
      Left = 12345
    end
    object N32: TMenuItem
      Caption = 'Загрузить маршруты'
      OnClick = N32Click
      Left = 12345
    end
  end
  object Antor: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 76
    Top = 148
  end
  object qInsertNakl: TADOQuery
    Connection = Antor
    Parameters = <
      item
        Name = 'EXT_STRID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 36
        Value = Null
      end
      item
        Name = 'CUST_STRID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 36
        Value = Null
      end
      item
        Name = 'UNLOAD_TYP'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ORD_TYP'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CATEGORY_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'TIME_BEG'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'TIME_END'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'TIME_UNLOAD'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'ACTIVE'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'OGRSUM1'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'OGRSUM2'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'SUM3'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'SUM4'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'ADDR'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'STR1'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 250
        Value = Null
      end
      item
        Name = 'MAX_CAR'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'MIN_CAR'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'DELIV_DATE'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'RENTED'
        Attributes = [paNullable]
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'LATITUDE'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'LONGITUDE'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'OPER_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ROUTE_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ROUTE_NUM'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'NUM_INROUTE'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ALTITUDE'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        'insert into d__import0 (EXT_STRID, CUST_STRID, UNLOAD_TYP, ORD_T' +
        'YP, CATEGORY_ID, TIME_BEG, TIME_END,'
      
        'TIME_UNLOAD, ACTIVE, OGRSUM1, OGRSUM2, SUM3, SUM4, ADDR, STR1, M' +
        'AX_CAR, MIN_CAR, DELIV_DATE, RENTED, LATITUDE, LONGITUDE,'
      'OPER_ID, ROUTE_ID, ROUTE_NUM,NUM_INROUTE,ALTITUDE) '
      
        'VALUES (:EXT_STRID, :CUST_STRID, :UNLOAD_TYP, :ORD_TYP, :CATEGOR' +
        'Y_ID, :TIME_BEG, :TIME_END,'
      
        ':TIME_UNLOAD, :ACTIVE, :OGRSUM1, :OGRSUM2, :SUM3, :SUM4, :ADDR, ' +
        ':STR1, :MAX_CAR, :MIN_CAR, :DELIV_DATE, :RENTED, :LATITUDE, :LON' +
        'GITUDE,'
      ':OPER_ID, :ROUTE_ID, :ROUTE_NUM, :NUM_INROUTE,:ALTITUDE)')
    Left = 124
    Top = 140
  end
  object qQuery: TADOQuery
    Connection = Antor
    Parameters = <
      item
        Name = 'EXT_STRID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 36
        Value = Null
      end>
    SQL.Strings = (
      'insert into d__import0 (EXT_STRID) VALUES (:EXT_STRID)')
    Left = 228
    Top = 132
  end
  object dsRoute: TADODataSet
    Connection = Antor
    CommandText = 
      'SELECT    rr.ROUTE_NUM, oo.NUM_INROUTE,   dbo.D__CARS.MARK, dbo.' +
      'D__CARS.NOMER, dbo.D__CARS.STR1, rr.ID, '#13#10'                      ' +
      'CONVERT(varchar(5), oo.TIME_ARR, 8) AS TIME_ARR, CONVERT(varchar' +
      '(8), oo.DELIV_DATE, 4) AS DELIV_DATE, '#13#10'                      oo' +
      '.EXT_STRID, oo.TIME_UNLOAD '#13#10'FROM                  dbo.D__CARS I' +
      'NNER JOIN'#13#10'                      dbo.D__ROUTE0 rr INNER JOIN'#13#10'  ' +
      '                    dbo.D__ORDERS0 oo ON rr.ID = oo.ROUTE_ID ON ' +
      'dbo.D__CARS.ID = rr.CAR_ID '#13#10'                      where oo.DELI' +
      'V_DATE=:DELIV_DATE'#13#10'order by rr.ROUTE_NUM, oo.NUM_INROUTE'
    Parameters = <
      item
        Name = 'DELIV_DATE'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 180
    Top = 140
  end
  object mQuery: TMegaQuery
    Transaction = DM.trMainWShort
    Database = DM.Money
    Left = 372
    Top = 108
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object mQuery1: TMegaQuery
    Transaction = DM.trMainWShort
    Database = DM.Money
    Left = 424
    Top = 132
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object mgqryQuery2: TMegaQuery
    Transaction = DM.trMainWShort
    Database = DM.Money
    Left = 516
    Top = 160
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object fdsNaklList: TMegaRDataSet
    UpdateSQL.Strings = (
      ''
      'select * from doc_nakl where RECID=:RECID and BASEID=:BASEID')
    DeleteSQL.Strings = (
      ''
      'select * from doc_nakl where RECID=:RECID and BASEID=:BASEID')
    InsertSQL.Strings = (
      ''
      'select * from doc_nakl where RECID=:RECID and BASEID=:BASEID')
    RefreshSQL.Strings = (
      'select'
      '  dn.recid,'
      '  dn.baseid,'
      '  dn.OPERDATE,'
      '  dn.DOCTYPE,'
      '  dn.DOCNUMBER,'
      '  dn.GROUP_OPER,'
      '  dn.KOD_OPER,'
      '  dn.SUMMA1,'
      '  dn.KOLICH,'
      '  dn.dk_to,'
      '  dn.DK_C,'
      ''
      '  dn.group_name group_name, --r'
      '  dn.name_oper name_oper, --r'
      '  dn.OPER_STATUS, --r'
      ''
      '  dn.SHORTNAME_DK_TO, --r'
      '  dn.SHORTNAME_DK_C, --r'
      ''
      '  dn.deliv_date deliv_date, --r'
      '  dn.deliv_time deliv_time, --r'
      ''
      '  dn.nas_p_id nas_p_id, --r'
      '  dn.Country_ID Country_ID, --r'
      '  dn.nas_p_name nas_p_name, --r'
      ''
      '  dn.address address, --r'
      ''
      '  dn.WEIGHT_TONN WEIGHT_TONN, --r'
      '  dn.BOX_COUNT BOX_COUNT, --r'
      ''
      '  dn.TTN_NUMBER,'
      '  dn.TTN_DOCTYPE,'
      ''
      '  dn.PLANNUMBER,'
      ''
      '  dn.OUTLET_RECID, --r'
      '  dn.OUTLET_BASEID, --r'
      '  dn.N_TTN_MARSHRUT, --r'
      '  DN.TIME_BEG,'
      ''
      '  dn.desireddeliverytime, --r'
      '  dn.Category, --r'
      ''
      '('
      'select first 1 ps1.docrecno'
      'From DOC_NAKL_POS ps1'
      'left join sprav_mater sm1 on (sm1.kod_mater=ps1.kod_mater)'
      'left join group_mater g3 on g3.group_mater=sm1.group_mater'
      'where'
      'ps1.docrecno = dn.RECID'
      'AND ps1.baseid = dn.BASEID'
      'and g3.tvid_kod = 20'
      ') as flag_SAN,'
      ' dn.IS_HORECA, --r'
      ' dn.KOD_CELL, --r'
      ' dn.VISITDATE, --r'
      ' dn.VISITDATE2,'
      ' dn.TYPE_NAME, --r'
      ' dn.DOC_CREATE DOC_CREATE, --r'
      ''
      ' dn.pos_cnt --r'
      ' ,dn.parent_recid, dn.parent_baseid,'
      ' dn.EXT_STRID , --r'
      ' dn.CUST_STRID , --r'
      '  0 UNLOAD_TYP,'
      '  0 ORD_TYP,'
      ' dn.CATEGORY_ID, --r'
      ''
      'dn.TIME_END, -- r170325'
      '0  ACTIVE_,'
      ' dn.OGRSUM1, --r'
      ' 0.0 OGRSUM2,'
      ' 0.0  SUM3,'
      ' 0.0  SUM4,'
      ' dn.address ADDR, --rr'
      ' dn.name_dk STR1, -- r170325'
      ' 0.0 MAX_CAR,'
      ' 0.0 MIN_CAR,'
      ' dn.OPERDATE DELIV_DATE1,'
      ' 0 RENTED,'
      ''
      ' dn.gps_avg_heigth LONGITUDE, --r'
      ' dn.gps_avg_width LATITUDE, --r'
      ''
      'dn.TIME_UNLOAD, --rr'
      'dn.LPR, --rr'
      ''
      
        'pgk.NAME_DISTRICT DISTR,pgk.NAME_CITY TOWN,pgk.NAME_STREET STREE' +
        'T,pgk.HOME HOUS,pgk.CORPS CORP,'
      'pr_fed.res is_fed_marka,'
      'dn.notes'
      'from proc_get_nakl_for_ttn_2(:ADate, :baseid, :BDate, :FILT) dn'
      
        'left join PROC_GET_KLADR_ADDR_DK(dn.dk_to,dn.outlet_recid,dn.out' +
        'let_baseid) pgk on (1=1)'
      'left join IS_NAKL_FED_MARKA(dn.recid, dn.baseid) pr_fed on 1=1')
    SelectSQL.Strings = (
      'select'
      '  dn.recid,'
      '  dn.baseid,'
      '  dn.OPERDATE,'
      '  dn.DOCTYPE,'
      '  dn.DOCNUMBER,'
      '  dn.GROUP_OPER,'
      '  dn.KOD_OPER,'
      '  dn.SUMMA1,'
      '  dn.KOLICH,'
      '  dn.dk_to,'
      '  dn.DK_C,'
      ''
      '  dn.group_name group_name, --r'
      '  dn.name_oper name_oper, --r'
      '  dn.OPER_STATUS, --r'
      ''
      '  dn.SHORTNAME_DK_TO, --r'
      '  dn.SHORTNAME_DK_C, --r'
      ''
      '  dn.deliv_date deliv_date, --r'
      '  dn.deliv_time deliv_time, --r'
      ''
      '  dn.nas_p_id nas_p_id, --r'
      '  dn.Country_ID Country_ID, --r'
      '  dn.nas_p_name nas_p_name, --r'
      ''
      '  dn.address address, --r'
      ''
      '  dn.WEIGHT_TONN WEIGHT_TONN, --r'
      '  dn.BOX_COUNT BOX_COUNT, --r'
      ''
      '  dn.TTN_NUMBER,'
      '  dn.TTN_DOCTYPE,'
      ''
      '  dn.PLANNUMBER,'
      ''
      '  dn.OUTLET_RECID, --r'
      '  dn.OUTLET_BASEID, --r'
      '  dn.N_TTN_MARSHRUT, --r'
      '  DN.TIME_BEG,'
      ''
      ''
      '  dn.desireddeliverytime, --r'
      '  dn.Category, --r'
      ''
      '('
      'select first 1 ps1.docrecno'
      'From DOC_NAKL_POS ps1'
      'left join sprav_mater sm1 on (sm1.kod_mater=ps1.kod_mater)'
      'left join group_mater g3 on g3.group_mater=sm1.group_mater'
      'where'
      'ps1.docrecno = dn.RECID'
      'AND ps1.baseid = dn.BASEID'
      'and g3.tvid_kod = 20'
      ') as flag_SAN,'
      ' dn.IS_HORECA, --r'
      ' dn.KOD_CELL, --r'
      ' dn.VISITDATE, --r'
      ' dn.VISITDATE2,'
      ' dn.TYPE_NAME, --r'
      ' dn.DOC_CREATE DOC_CREATE, --r'
      ''
      ' dn.pos_cnt --r'
      ' ,dn.parent_recid, dn.parent_baseid,'
      ' dn.EXT_STRID , --r'
      ' dn.CUST_STRID , --r'
      '  0 UNLOAD_TYP,'
      '  0 ORD_TYP,'
      ' dn.CATEGORY_ID, --r'
      ''
      'dn.TIME_END, -- r170325'
      '0  ACTIVE_,'
      ' dn.OGRSUM1, --r'
      ' 0.0 OGRSUM2,'
      ' 0.0  SUM3,'
      ' 0.0  SUM4,'
      ' dn.address ADDR, --rr'
      ' dn.name_dk STR1, -- r170325'
      ' 0.0 MAX_CAR,'
      ' 0.0 MIN_CAR,'
      ' dn.OPERDATE DELIV_DATE1,'
      ' 0 RENTED,'
      ''
      ' dn.gps_avg_heigth LONGITUDE, --r'
      ' dn.gps_avg_width LATITUDE, --r'
      ''
      'dn.TIME_UNLOAD, --rr'
      'dn.LPR, --rr'
      ''
      
        'pgk.NAME_DISTRICT DISTR,pgk.NAME_CITY TOWN,pgk.NAME_STREET STREE' +
        'T,pgk.HOME HOUS,pgk.CORPS CORP,'
      'pr_fed.res is_fed_marka,'
      'dn.notes'
      'from proc_get_nakl_for_ttn_2(:ADate, :baseid, :BDate, :FILT) dn'
      
        'left join PROC_GET_KLADR_ADDR_DK(dn.dk_to,dn.outlet_recid,dn.out' +
        'let_baseid) pgk on (1=1)'
      'left join IS_NAKL_FED_MARKA(dn.recid, dn.baseid) pr_fed on 1=1')
    OnCalcFields = fdsNaklList2CalcFields
    Transaction = DM.trMainRO
    Database = DM.Money
    UpdateTransaction = DM.trMainWShort
    AutoCommit = True
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    Key = 'RECID;BASEID'
    AutoFetchAll = False
    AutoRefresh = True
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 120
    Top = 236
    object fdsNaklListRECID: TIntegerField
      FieldName = 'RECID'
    end
    object fdsNaklListBASEID: TIntegerField
      FieldName = 'BASEID'
    end
    object fdsNaklListOPERDATE: TDateTimeField
      FieldName = 'OPERDATE'
      DisplayFormat = 'dd.mm.yyyy '
    end
    object fdsNaklListDOCTYPE: TFIBStringField
      FieldName = 'DOCTYPE'
      Size = 6
      EmptyStrToNull = True
    end
    object fdsNaklListDOCNUMBER: TIntegerField
      FieldName = 'DOCNUMBER'
    end
    object fdsNaklListGROUP_OPER: TIntegerField
      FieldName = 'GROUP_OPER'
    end
    object fdsNaklListKOD_OPER: TIntegerField
      FieldName = 'KOD_OPER'
    end
    object fdsNaklListSUMMA1: TFloatField
      FieldName = 'SUMMA1'
      DisplayFormat = ',0.00'
      EditFormat = '0'
    end
    object fdsNaklListDK_TO: TFloatField
      FieldName = 'DK_TO'
      DisplayFormat = '0.##'
      EditFormat = '0'
    end
    object fdsNaklListDK_C: TFloatField
      FieldName = 'DK_C'
      DisplayFormat = '0.##'
      EditFormat = '0'
    end
    object fdsNaklListGROUP_NAME: TFIBStringField
      FieldName = 'GROUP_NAME'
      Size = 65
      EmptyStrToNull = True
    end
    object fdsNaklListNAME_OPER: TFIBStringField
      FieldName = 'NAME_OPER'
      Size = 70
      EmptyStrToNull = True
    end
    object fdsNaklListSHORTNAME_DK_TO: TFIBStringField
      FieldName = 'SHORTNAME_DK_TO'
      Size = 45
      EmptyStrToNull = True
    end
    object fdsNaklListSHORTNAME_DK_C: TFIBStringField
      FieldName = 'SHORTNAME_DK_C'
      Size = 45
      EmptyStrToNull = True
    end
    object fdsNaklListNAS_P_ID: TIntegerField
      FieldName = 'NAS_P_ID'
    end
    object fdsNaklListCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
    end
    object fdsNaklListNAS_P_NAME: TFIBStringField
      FieldName = 'NAS_P_NAME'
      Size = 30
      EmptyStrToNull = True
    end
    object fdsNaklListADDRESS: TFIBStringField
      FieldName = 'ADDRESS'
      Size = 80
      EmptyStrToNull = True
    end
    object fdsNaklListWEIGHT_TONN: TFloatField
      FieldName = 'WEIGHT_TONN'
      DisplayFormat = ',0.00;-,0.00;#'
      EditFormat = ',0.00;-,0.00;#'
    end
    object fdsNaklListTTN_NUMBER: TIntegerField
      FieldName = 'TTN_NUMBER'
    end
    object fdsNaklListTTN_DOCTYPE: TFIBStringField
      FieldName = 'TTN_DOCTYPE'
      Size = 6
      EmptyStrToNull = True
    end
    object fdsNaklListPLANNUMBER: TIntegerField
      FieldName = 'PLANNUMBER'
    end
    object fdsNaklListOPER_STATUS: TIntegerField
      FieldName = 'OPER_STATUS'
    end
    object fdsNaklListCALC_OPERSTATUS: TFIBStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_OPERSTATUS'
      Size = 2
      EmptyStrToNull = True
      Calculated = True
    end
    object fdsNaklListKOLICH: TFloatField
      FieldName = 'KOLICH'
      DisplayFormat = '0.##'
      EditFormat = '0'
    end
    object fdsNaklListDELIV_TIME: TFIBStringField
      FieldName = 'DELIV_TIME'
      Size = 10
      EmptyStrToNull = True
    end
    object fdsNaklListDELIV_DATE: TDateTimeField
      FieldName = 'DELIV_DATE'
      DisplayFormat = 'dd.mm.yyyy '
    end
    object fdsNaklListBOX_COUNT: TFloatField
      FieldName = 'BOX_COUNT'
      DisplayFormat = ',0.00;-,0.00;#'
    end
    object fdsNaklListN_TTN_MARSHRUT: TIntegerField
      FieldName = 'N_TTN_MARSHRUT'
    end
    object fdsNaklListIS_HORECA: TIntegerField
      FieldName = 'IS_HORECA'
    end
    object fdsNaklListRes_deliveryTime: TFIBStringField
      FieldKind = fkCalculated
      FieldName = 'Res_deliveryTime'
      EmptyStrToNull = True
      Calculated = True
    end
    object fdsNaklListdesireddeliverytime: TFIBStringField
      FieldName = 'desireddeliverytime'
      Size = 8
      EmptyStrToNull = True
    end
    object fdsNaklListCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
    end
    object fdsNaklListKOD_CELL: TFIBStringField
      DisplayLabel = 'Код соты'
      FieldName = 'KOD_CELL'
      Size = 15
      EmptyStrToNull = True
    end
    object fdsNaklListVISITDATE: TFIBDateTimeField
      FieldName = 'VISITDATE'
    end
    object fdsNaklListVISITDATE2: TFIBDateTimeField
      FieldName = 'VISITDATE2'
    end
    object fdsNaklListTYPE_NAME: TFIBStringField
      FieldName = 'TYPE_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object fdsNaklListDOC_CREATE: TFIBDateTimeField
      FieldName = 'DOC_CREATE'
      DisplayFormat = 'dd.mm.yy hh:mm '
    end
    object fdsNaklListOUTLET_RECID: TFIBIntegerField
      FieldName = 'OUTLET_RECID'
    end
    object fdsNaklListOUTLET_BASEID: TFIBIntegerField
      FieldName = 'OUTLET_BASEID'
    end
    object fdsNaklListPOS_CNT: TIntegerField
      FieldName = 'POS_CNT'
    end
    object fdsNaklListPARENT_RECID: TIntegerField
      FieldName = 'PARENT_RECID'
    end
    object fdsNaklListEXT_STRID: TFIBStringField
      FieldName = 'EXT_STRID'
      Size = 16
      EmptyStrToNull = True
    end
    object fdsNaklListCUST_STRID: TFIBStringField
      FieldName = 'CUST_STRID'
      Size = 16
      EmptyStrToNull = True
    end
    object fdsNaklListUNLOAD_TYP: TFIBIntegerField
      FieldName = 'UNLOAD_TYP'
    end
    object fdsNaklListORD_TYP: TFIBIntegerField
      FieldName = 'ORD_TYP'
    end
    object fdsNaklListCATEGORY_ID: TFIBIntegerField
      FieldName = 'CATEGORY_ID'
    end
    object fdsNaklListACTIVE_: TFIBIntegerField
      FieldName = 'ACTIVE_'
    end
    object fdsNaklListOGRSUM1: TFIBFloatField
      FieldName = 'OGRSUM1'
    end
    object fdsNaklListOGRSUM2: TFIBFloatField
      FieldName = 'OGRSUM2'
    end
    object fdsNaklListSUM3: TFIBFloatField
      FieldName = 'SUM3'
    end
    object fdsNaklListSUM4: TFIBFloatField
      FieldName = 'SUM4'
    end
    object fdsNaklListADDR: TFIBStringField
      FieldName = 'ADDR'
      Size = 80
      EmptyStrToNull = True
    end
    object fdsNaklListSTR1: TFIBStringField
      FieldName = 'STR1'
      Size = 90
      EmptyStrToNull = True
    end
    object fdsNaklListMAX_CAR: TFIBFloatField
      FieldName = 'MAX_CAR'
    end
    object fdsNaklListMIN_CAR: TFIBFloatField
      FieldName = 'MIN_CAR'
    end
    object fdsNaklListDELIV_DATE1: TFIBDateTimeField
      FieldName = 'DELIV_DATE1'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object fdsNaklListRENTED: TFIBIntegerField
      FieldName = 'RENTED'
    end
    object fdsNaklListLATITUDE: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'LATITUDE'
      DisplayFormat = '0.##'
      EditFormat = '0'
    end
    object fdsNaklListLONGITUDE: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'LONGITUDE'
      DisplayFormat = '0.##'
      EditFormat = '0'
    end
    object fdsNaklListTIME_UNLOAD: TFIBDateTimeField
      FieldName = 'TIME_UNLOAD'
    end
    object fdsNaklListPARENT_BASEID: TIntegerField
      FieldName = 'PARENT_BASEID'
    end
    object fdsNaklListLPR: TFIBStringField
      FieldName = 'LPR'
      EmptyStrToNull = True
    end
    object fdsNaklListTIME_BEG: TDateTimeField
      FieldName = 'TIME_BEG'
    end
    object fdsNaklListTIME_END: TDateTimeField
      FieldName = 'TIME_END'
    end
    object fdsNaklListDISTR: TFIBStringField
      FieldName = 'DISTR'
      Size = 61
      EmptyStrToNull = True
    end
    object fdsNaklListTOWN: TFIBStringField
      FieldName = 'TOWN'
      Size = 101
      EmptyStrToNull = True
    end
    object fdsNaklListSTREET: TFIBStringField
      FieldName = 'STREET'
      Size = 101
      EmptyStrToNull = True
    end
    object fdsNaklListHOUS: TFIBStringField
      FieldName = 'HOUS'
      EmptyStrToNull = True
    end
    object fdsNaklListCORP: TFIBStringField
      FieldName = 'CORP'
      EmptyStrToNull = True
    end
    object fdsNaklListIS_FED_MARKA: TIntegerField
      FieldName = 'IS_FED_MARKA'
    end
    object fdsNaklListNOTES: TFIBStringField
      FieldName = 'NOTES'
      EmptyStrToNull = True
    end
    object fdsNaklListFLAG_SAN: TIntegerField
      FieldName = 'FLAG_SAN'
    end
  end
  object ppMapXPlus: TPopupMenu
    Left = 308
    Top = 164
    object MenuItem1: TMenuItem
      Caption = 'Выгрузить заявки'
      OnClick = MenuItem1Click
      Left = 12345
    end
    object MenuItem2: TMenuItem
      Caption = 'Загрузить маршруты'
      OnClick = MenuItem2Click
      Left = 12345
    end
  end
  object sQuery: TMegaQuery
    Transaction = DM.trMainRO
    Database = DM.Money
    Left = 472
    Top = 156
    qoStartTransaction = True
  end
  object pmRinkai: TPopupMenu
    Left = 360
    Top = 160
    object N33: TMenuItem
      Caption = 'Выгрузить заявки'
      OnClick = N33Click
      Left = 12345
    end
    object N34: TMenuItem
      Caption = 'Загрузить маршруты'
      OnClick = N34Click
      Left = 12345
    end
    object N35: TMenuItem
      Caption = 'Выгрузить уже существующие маршруты'
      OnClick = N35Click
      Left = 12345
    end
    object CSV1: TMenuItem
      Caption = 'Выгрузить в CSV'
      OnClick = CSV1Click
    end
  end
  object mgrdtstTmpSelRinkai: TMegaRDataSet
    SelectSQL.Strings = (
      '/*select distinct '#39'GS'#39' DepotUserDefinedId,'
      ' sto.recid*1000+sto.baseid LocationUserDefinedId,'
      'sd.name_dk Name,'
      #39'UA'#39' Country,'
      'coalesce(snp.nas_p_name,'#39#39') City,'
      'sda.address Street,'
      #39#39' HouseNumber,'
      #39#39' PostCode,'
      #39#39' LocationComment,'
      #39#39' Mail,'
      #39#39' Phone,'
      'oom.worktimefrom,'
      'oom.worktimetill,'
      
        '(cast(substring(iif(oom.worktimefrom is null or (oom.worktimefro' +
        'm ='#39'  :'#39'),'#39'09:00'#39',oom.worktimefrom) from 1 for 2)as integer)*360' +
        '0)+'
      
        'iif(substring(iif(oom.worktimefrom is null or (oom.worktimefrom ' +
        '='#39'  :'#39'),'#39'09:00'#39',oom.worktimefrom) from 4 for 2)='#39'00'#39
      
        'or (substring(iif(oom.worktimefrom is null or (oom.worktimefrom ' +
        '='#39'  :'#39'),'#39'09:00'#39',oom.worktimefrom) from 4 for 2)='#39#39') ,0,'
      
        'substring(iif(oom.worktimefrom is null or (oom.worktimefrom ='#39'  ' +
        ':'#39'),'#39'09:00'#39',oom.worktimefrom) from 4 for 2)) as TW1F,'
      
        '(cast(substring(iif(oom.worktimetill is null or (oom.worktimetil' +
        'l ='#39'  :'#39'),'#39'18:00'#39',oom.worktimetill) from 1 for 2)as integer)*360' +
        '0)+'
      
        'iif(substring(iif(oom.worktimetill is null or (oom.worktimetill ' +
        '='#39'  :'#39'),'#39'18:00'#39',oom.worktimetill) from 4 for 2)='#39'00'#39
      
        'or (substring(iif(oom.worktimetill is null or (oom.worktimetill ' +
        '='#39'  :'#39'),'#39'18:00'#39',oom.worktimetill) from 4 for 2)='#39#39') ,0,'
      
        'substring(iif(oom.worktimetill is null or (oom.worktimetill ='#39'  ' +
        ':'#39'),'#39'18:00'#39',oom.worktimetill) from 4 for 2)) as TW1T,'
      '-1 TW2F,-1 TW2T,-1 LoadingStartTimeFrom,-1 LoadingStartTimeTo,'
      'sto.gps_avg_heigth GeoY, sto.gps_avg_width GeoX,'
      '-1 TimeAtCustomer,'
      
        'extract(minute from coalesce(oap.uloading_time,cast('#39'01.01.2015 ' +
        '00:10:00'#39' as date)))*60+extract(hour from coalesce(oap.uloading_' +
        'time,cast('#39'01.01.2015 00:10:00'#39' as date)))*3600 AdminTimeAtCusto' +
        'mer,'
      '-1 WeightLimit,-1 VehicleTypeRestriction,'
      
        'dn.recid||'#39#39'||dn.baseid OrderUserDefinedId, extract(YEAR from dn' +
        '.operdate)||'#39'0'#39'||extract(MONTH from dn.operdate)||extract(DAY fr' +
        'om dn.operdate) Date_, dn.notes OrderComment,'
      
        #39'w:'#39'||(select RESULT from PROC_DOUBLE_TO_STR(dw.weight*1000, 2, ' +
        #39'.'#39'))||'#39';v:0;wb:0;vb:0'#39' Items'
      'from ttn_plan tp'
      
        'left join ttn_plan_positions ttp on (ttp.plandate = tp.plandate ' +
        'and ttp.plannumber = tp.plannumber)'
      
        'left join doc_nakl dn on (ttp.nakl_recid = dn.recid and ttp.nakl' +
        '_baseid = dn.baseid)'
      'left join sprav_dk sd on (sd.kod_dk = dn.dk_to)'
      
        'left join delivery_location dl on (dl.formtype = 1 and dl.docrec' +
        'no = dn.recid and dl.baseid = dn.baseid)'
      
        'left join sprav_trade_outlet sto on (sto.recid = dl.outlet_recid' +
        ' and sto.baseid = dl.outlet_baseid)'
      
        'left join outlet_operating_mode oom on (oom.outlet_recid = sto.r' +
        'ecid and oom.outlet_baseid = sto.baseid and oom.day_number =( se' +
        'lect WEEKD from dayofweek(dn.operdate)))'
      
        'left join sprav_dk_address sda on (sda.recid = sto.addr_recid an' +
        'd sda.baseid = sto.baseid)'
      
        'left join sprav_nas_p snp on (snp.nas_p_id = sda.nas_p_id and sn' +
        'p.country_id = 38)'
      'left join DOC_WEIGHT_PRODUCT(1, dn.recid, dn.baseid) dw on 1=1'
      
        'left join outlet_addition_prop oap  on (oap.outlet_recid=sto.rec' +
        'id and oap.outlet_baseid=sto.baseid)'
      
        'where tp.plandate between :BDATE and :EDATE and dn.baseid = 101*' +
        '/--запрос по уже готовы маршрутам'
      'select distinct '#39'GS'#39' DepotUserDefinedId,'
      ' sto.recid*1000+sto.baseid LocationUserDefinedId,'
      'sd.name_dk Name,'
      #39'UA'#39' Country,'
      'coalesce(snp.nas_p_name,'#39#39') City,'
      'sda.address Street,'
      #39#39' HouseNumber,'
      #39#39' PostCode,'
      #39#39' LocationComment,'
      #39#39' Mail,'
      #39#39' Phone,'
      'oom.worktimefrom,'
      'oom.worktimetill,'
      
        '(cast(substring(iif(oom.worktimefrom is null or (oom.worktimefro' +
        'm ='#39'  :'#39'),'#39'09:00'#39',oom.worktimefrom) from 1 for 2)as integer)*360' +
        '0)+'
      
        'iif(substring(iif(oom.worktimefrom is null or (oom.worktimefrom ' +
        '='#39'  :'#39'),'#39'09:00'#39',oom.worktimefrom) from 4 for 2)='#39'00'#39
      
        'or (substring(iif(oom.worktimefrom is null or (oom.worktimefrom ' +
        '='#39'  :'#39'),'#39'09:00'#39',oom.worktimefrom) from 4 for 2)='#39#39') ,0,'
      
        'substring(iif(oom.worktimefrom is null or (oom.worktimefrom ='#39'  ' +
        ':'#39'),'#39'09:00'#39',oom.worktimefrom) from 4 for 2)) as TW1F,'
      
        '(cast(substring(iif(oom.worktimetill is null or (oom.worktimetil' +
        'l ='#39'  :'#39'),'#39'18:00'#39',oom.worktimetill) from 1 for 2)as integer)*360' +
        '0)+'
      
        'iif(substring(iif(oom.worktimetill is null or (oom.worktimetill ' +
        '='#39'  :'#39'),'#39'18:00'#39',oom.worktimetill) from 4 for 2)='#39'00'#39
      
        'or (substring(iif(oom.worktimetill is null or (oom.worktimetill ' +
        '='#39'  :'#39'),'#39'18:00'#39',oom.worktimetill) from 4 for 2)='#39#39') ,0,'
      
        'substring(iif(oom.worktimetill is null or (oom.worktimetill ='#39'  ' +
        ':'#39'),'#39'18:00'#39',oom.worktimetill) from 4 for 2)) as TW1T,'
      '-1 TW2F,-1 TW2T,-1 LoadingStartTimeFrom,-1 LoadingStartTimeTo,'
      'sto.gps_avg_heigth GeoY, sto.gps_avg_width GeoX,'
      '-1 TimeAtCustomer,'
      
        'extract(minute from coalesce(oap.uloading_time,cast('#39'01.01.2015 ' +
        '00:10:00'#39' as date)))*60+extract(hour from coalesce(oap.uloading_' +
        'time,cast('#39'01.01.2015 00:10:00'#39' as date)))*3600 AdminTimeAtCusto' +
        'mer,'
      '-1 WeightLimit,-1 VehicleTypeRestriction,'
      'dn.recid||'#39'|'#39'||dn.baseid OrderUserDefinedId, '
      
        '--extract(YEAR from dn.operdate)||'#39'0'#39'||extract(MONTH from dn.ope' +
        'rdate)||extract(DAY from dn.operdate) '
      'dn.operdate as Date_, '
      'dn.notes OrderComment,'
      
        #39'w:'#39'||(select RESULT from PROC_DOUBLE_TO_STR(dw.weight*1000, 2, ' +
        #39'.'#39'))||'#39'#v:0#wb:0#vb:0'#39' Items,'
      'pg.car_snum,'
      'pg.plannumber,'
      'pg.pos_num,'
      'pg.date_int'
      '--ttn_plan tp'
      
        '--left join ttn_plan_positions ttp on (ttp.plandate = tp.plandat' +
        'e and ttp.plannumber = tp.plannumber)'
      'from proc_get_nakl_for_ttn_test(:bDate, 59, :eDate) pg'
      
        'left join doc_nakl dn on (pg.recid = dn.recid and pg.baseid = dn' +
        '.baseid)'
      'left join sprav_dk sd on (sd.kod_dk = dn.dk_to)'
      
        'left join delivery_location dl on (dl.formtype = 1 and dl.docrec' +
        'no = dn.recid and dl.baseid = dn.baseid)'
      
        'left join sprav_trade_outlet sto on (sto.recid = dl.outlet_recid' +
        ' and sto.baseid = dl.outlet_baseid)'
      
        'left join outlet_operating_mode oom on (oom.outlet_recid = sto.r' +
        'ecid and oom.outlet_baseid = sto.baseid and oom.day_number =( se' +
        'lect WEEKD from dayofweek(dn.operdate)))'
      
        'left join sprav_dk_address sda on (sda.recid = sto.addr_recid an' +
        'd sda.baseid = sto.baseid)'
      
        'left join sprav_nas_p snp on (snp.nas_p_id = sda.nas_p_id and sn' +
        'p.country_id = 38)'
      'left join DOC_WEIGHT_PRODUCT(1, dn.recid, dn.baseid) dw on 1=1'
      
        'left join outlet_addition_prop oap  on (oap.outlet_recid=sto.rec' +
        'id and oap.outlet_baseid=sto.baseid)'
      'where sto.recid is not null')
    Transaction = DM.trMainRO
    Database = DM.Money
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 864
    Top = 136
  end
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 'https://www.rinkai.eu/riro/WebServiceInterface?wsdl'
    Service = 'WebServiceInterfaceService'
    Port = 'WebServiceInterfacePort'
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soDocument, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 704
    Top = 208
  end
  object WSDLHTMLPublish1: TWSDLHTMLPublish
    WebDispatch.MethodType = mtAny
    WebDispatch.PathInfo = 'wsdl*'
    Left = 936
    Top = 112
  end
  object frXMLExcelExport1: TfrXMLExcelExport
    Left = 824
    Top = 184
  end
  object od: TOpenDialog
    Left = 1152
    Top = 160
  end
  object cxShellBrowserDialog1: TcxShellBrowserDialog
    Left = 896
    Top = 208
  end
  object dsTonnag: TDataSource
    DataSet = mgdTonnag1
    Left = 464
    Top = 604
  end
  object mgdTonnag1: TMegaDSDocNakl
    RefreshSQL.Strings = (
      
        'select owner, baseid, cast(tonnage as double precision) tonnage,' +
        '  cost_km, cost_day,'
      
        'cost_km_por, activ, description, NO_VAT_RATE, NO_VAT_TARIFF, VAT' +
        '_RATE,VAT_TARIFF,MILEAGE'
      
        'from ttn_list_tonnage(:DK_To, :BASEID, :TON)  order by owner, to' +
        'nnage')
    SelectSQL.Strings = (
      
        'select owner, baseid, cast(tonnage as double precision) tonnage,' +
        '  cost_km, cost_day,'
      
        'cost_km_por, activ, description, NO_VAT_RATE, NO_VAT_TARIFF, VAT' +
        '_RATE,VAT_TARIFF,MILEAGE'
      
        'from ttn_list_tonnage(:DK_To, :BASEID, :TON)  order by owner, to' +
        'nnage')
    Transaction = DM.Transaction
    Database = DM.Money
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 432
    Top = 544
    object fltfldDEBET_KOD_MATERTonnag1TONNAGE: TFloatField
      FieldName = 'TONNAGE'
    end
    object strngfldListsTonnag1DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
    end
  end
  object MegaTranW: TMegaTransaction
    DefaultDatabase = DM.Money
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 684
    Top = 558
  end
end
