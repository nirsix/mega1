object fmReturnsMake: TfmReturnsMake
  Left = 120
  Top = 162
  Caption = 'Создание возвратов'
  ClientHeight = 647
  ClientWidth = 1048
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pn_bottom: TPanel
    Left = 0
    Top = 613
    Width = 1048
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object pn_bottom_right: TPanel
      Left = 799
      Top = 0
      Width = 249
      Height = 34
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnClose: TcxButton
        Left = 136
        Top = 6
        Width = 109
        Height = 26
        Action = actClose
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = False
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Black'
        OptionsImage.Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FAE6E6F5E1E1
          E5D3D3C8B8B8AEA0A0AEA0A0CEBEBEEEDBDBF9E5E5FAE6E6FAE6E6FAE6E6FAE6
          E6FAE6E6FAE6E6FAE6E6F4E0E0DCCACA9A8EA64248A82D36A76962799C9090D1
          C1C1F3DFDFF9E5E5F6E2E2EBD8D8E1CFCFE8D5D5F5E1E1FAE6E6E6D4D67273B5
          1338E2083EFF0840FF2037BE716770A69999D9C8C8EAD7D7D7C6C6B8A9A9A497
          97B8A9A9E1CFCFF7E3E37777C6578FFA336DFF0D41FF1348FF1148FF323B9E7E
          7474A79A9AB0A2A76B689E1A33C93F418F857A7AB8A9A9E4D2D29893CD81BCFD
          80BCFF2A60FE194EFF1D53FF1A4CFA454689615C7B2639BD0938F40039FF0330
          EF4C4B81908484C8B8B8FAE6E6808ACE95D6FF70AAFE2A61FE265CFE255BFF20
          49E81A42E6154CFF0F45FF093DFF0138FF0C2FDF656094C8B8B8FAE6E6E5D3DF
          7899DF8BCAFF538CFD3066FE3066FE2B61FF255CFF1F54FE174CFF0F45FF073E
          FF1432D88179B1E7D4D4FAE6E6F8E4E4C5B5CF587FE13A72FF3B72FE3B72FE35
          6BFE2E64FE275CFE1F54FF1648FB2E44CCB3A6BCEFDCDCF8E4E4F8E4E4E9D6D6
          C8B8B83E4FC03F79FF4A83FE457DFE3F75FE376EFE2E65FF2455F6434898A496
          99DFCDCDF8E4E4FAE6E6EFDCDCAC9FB64B5DBD548CFD5B95FF558EFE5088FE47
          7FFE3F76FE366EFF295BF54C4B83887D7DC0B0B0EBD8D8F9E5E5B0A3CB3C62E3
          609DFF67A1FE659FFE619BFE5B96FF4E87FE447CFE3B72FE3168FF2452EF5750
          74948888CBBBBBEEDBDB8281C973B1FF7CB8FE71ABFD74B1FF6DA9FD5A8EF470
          ACFD629BFD3E75FE346AFE2861FF2643CB696170A09393D4C3C3D9C7DA779BE0
          91D2FF8AC9FF78B1F85F79CE877EB56A92E376B4FF4C84FE346BFE2A60FF1F56
          FF3041B37E758AC9B9B9FAE6E6C2B3D36B8ADA769DE28580BAD5C4CFF4E0E09F
          99CE5F97FB538DFF386FFE2A61FF1F58FF1A41E4716BA8DFCDCDFAE6E6FAE6E6
          DFCDDCE2D0DDF7E3E3F9E5E5FAE6E6FAE6E67A7FCE4079FF2F68FF265DFE2149
          EA7B76B6DECCD1F5E1E1FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FA
          E6E6EDDAE14A57CC2046E66365C1C3B4CAF1DDDDF8E4E4FAE6E6}
      end
    end
    object chbReturnsControl: TcxCheckBox
      Left = 7
      Top = 6
      Caption = 'Контролировать остатки на регионе'
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 1
      OnClick = chbReturnsControlClick
      Width = 210
    end
    object lbSaldo: TcxLabel
      Left = 256
      Top = 8
      Caption = 'Сальдо клиента'
      Visible = False
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 62
    Width = 1048
    Height = 346
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Lilian'
    object cxView: TcxGridDBBandedTableView
      PopupMenu = pmDocs
      OnKeyDown = cxViewKeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsMain
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.##'
          Kind = skSum
          Column = cxViewKOLICH_MY
        end
        item
          Format = '0.##'
          Kind = skSum
          Column = cxViewKOLICH
        end
        item
          Format = '0.00'
          Kind = skSum
          Column = cxViewSUMMA_MY
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.Footer = True
      OptionsView.FooterAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.ContentEven = cxStyleContentEven
      Styles.ContentOdd = cxStyleContentOdd
      Styles.Inactive = cxStyleSelected
      Styles.Selection = cxStyleSelected
      Bands = <
        item
          Caption = 'Документ'
          Options.HoldOwnColumnsOnly = True
          Width = 295
        end
        item
          Caption = 'Ценность'
          Options.HoldOwnColumnsOnly = True
          Width = 389
        end
        item
          Caption = 'ТТ'
          Options.HoldOwnColumnsOnly = True
          Width = 157
        end
        item
          Caption = 'В накладной'
          Options.HoldOwnColumnsOnly = True
          Width = 148
        end
        item
          Caption = 'В возврате'
          Options.HoldOwnColumnsOnly = True
          Width = 136
        end>
      object cxViewRECID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'RECID'
        Visible = False
        Options.Moving = False
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxViewBASEID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'BASEID'
        Visible = False
        Options.Moving = False
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxViewOPERDATE: TcxGridDBBandedColumn
        DataBinding.FieldName = 'OPERDATE'
        Options.Editing = False
        Options.Moving = False
        Width = 64
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxViewDOCTYPE: TcxGridDBBandedColumn
        DataBinding.FieldName = 'DOCTYPE'
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
        Width = 41
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxViewDOCNUMBER: TcxGridDBBandedColumn
        DataBinding.FieldName = 'DOCNUMBER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Options.Moving = False
        Width = 83
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object cxViewNAME_MATER: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NAME_MATER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Options.Moving = False
        Width = 139
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxViewKOD_MATER: TcxGridDBBandedColumn
        Caption = 'Код'
        DataBinding.FieldName = 'KOD_MATER'
        Options.Moving = False
        Width = 43
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxViewKOD_EAN: TcxGridDBBandedColumn
        DataBinding.FieldName = 'KOD_EAN'
        Width = 33
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxViewIS_KOMISS_MATER: TcxGridDBBandedColumn
        Caption = 'Комис.'
        DataBinding.FieldName = 'IS_KOMISS_MATER'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Options.Editing = False
        Width = 50
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxViewADDRESS: TcxGridDBBandedColumn
        DataBinding.FieldName = 'ADDRESS'
        Options.Editing = False
        Options.Moving = False
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxViewSCHET: TcxGridDBBandedColumn
        Caption = 'Счет'
        DataBinding.FieldName = 'SCHET'
        Options.Editing = False
        Width = 44
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object cxViewKOLICH: TcxGridDBBandedColumn
        DataBinding.FieldName = 'KOLICH'
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
        Width = 52
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxViewSUMMA: TcxGridDBBandedColumn
        Caption = 'Цена'
        DataBinding.FieldName = 'PRICE'
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
        Width = 42
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxViewSUMMA_PDV: TcxGridDBBandedColumn
        Caption = 'Цена с НДС'
        DataBinding.FieldName = 'PRICE_PDV'
        Options.Editing = False
        Options.Filtering = False
        Width = 54
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxViewKOLICH_MY: TcxGridDBBandedColumn
        DataBinding.FieldName = 'KOLICH_MY'
        Options.Filtering = False
        Width = 83
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxViewSUMMA_MY: TcxGridDBBandedColumn
        Caption = 'Сумма'
        DataBinding.FieldName = 'SUMMA_MY'
        Options.Editing = False
        Options.Filtering = False
        Width = 53
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxViewDATE_ROZLIVA: TcxGridDBBandedColumn
        Caption = 'Дата розлива'
        DataBinding.FieldName = 'DATE_ROZLIVA'
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object cxViewINVOCE_NUMBER: TcxGridDBBandedColumn
        Caption = 'Инвойс'
        DataBinding.FieldName = 'INVOCE_NUMBER'
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object cxViewREGID_FORM_A: TcxGridDBBandedColumn
        Caption = '№ Ф1'
        DataBinding.FieldName = 'REGID_FORM_A'
        Width = 62
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object cxViewREGID_FORM_B: TcxGridDBBandedColumn
        Caption = '№ Ф2'
        DataBinding.FieldName = 'REGID_FORM_B'
        Width = 62
        Position.BandIndex = 1
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxView
    end
  end
  object pn_filters: TPanel
    Left = 0
    Top = 408
    Width = 1048
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    TabStop = True
    object cxLabel1: TcxLabel
      Left = 130
      Top = 21
      Hint = 'Фильтр по номеру накладной (F4)'
      Caption = '№ накладной'
      ParentShowHint = False
      ShowHint = True
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
    end
    object edFilterNaklNumber: TcxTextEdit
      Left = 202
      Top = 20
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 2
      OnKeyDown = edFilterNaklNumberKeyDown
      Width = 121
    end
    object edFilterMaterName: TcxTextEdit
      Left = 416
      Top = 20
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 3
      OnKeyDown = edFilterMaterNameKeyDown
      Width = 188
    end
    object cxLabel6: TcxLabel
      Left = 337
      Top = 21
      Hint = 'Фильтр по наименованию ценности (F8)'
      Caption = 'Наименование'
      ParentShowHint = False
      ShowHint = True
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
    end
    object btnClearFilter: TcxButton
      Left = 4
      Top = 17
      Width = 120
      Height = 22
      Action = actClearFilter
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Silver'
      OptionsImage.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FAE6E6FAE6E6
        FAE6E6FAE6E6FAE6E6FAE6E6F3DFDFE5D3D3DCCACAE5D3D3F5E1E1FAE6E6FAE6
        E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6F3DFDFD3C2C29F
        9393877C7CA89B9BE6D3D3FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6
        FAE6E6FAE6E6FAE6E6DDCCCC867F7F757272686262837878DBCACAFAE6E6FAE6
        E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6F9E5E5B5AEAEECECECA6
        A6A6646161796F6FD8C7C7F9E5E5FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6
        FAE6E6FAE6E6F8E4E4CFCDCDE9E9E99E9E9E636060726969D3C2C2F9E5E5FAE6
        E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6F9E5E5EDDADACDCCCCD1D1D191
        9191615F5F645C5CBAABABEEDBDBFAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6
        F9E5E5F1DDDDBFB1B1909090B1B1B18888885D5D5D5E5757847979CDBDBDF3DF
        DFFAE6E6FAE6E6FAE6E6FAE6E6F9E5E5EFDCDCCCBDBDA3A0A0F5F5F5D7D7D7AC
        ACAC7373736562625D5656948888D8C7C7F6E2E2FAE6E6FAE6E6F9E5E5EEDBDB
        C5B6BB95939FE9EEF7DBDBDCD0D0D0B1B1B18484846464646D6767625A5AA396
        96E0CECEF8E4E4FAE6E6F4E0E1BCB9CC7377B8808DFB9EC9F7ACB6E3CECFD5B9
        B9B99191917272725C5C5C6E67676B6363B3A5A5E8D5D5F9E5E5D6C9DB7A95D1
        5092FA5AB1FC4698F63D53DB7D87B29898988686866666665151514B4B4B655E
        5E776E6EC2B2B2F1DDDDAFABD52F51E458D9F71CE4FE57E9FB52A7F281A1DFD7
        DAE1F6F6F6FFFFFFFAFAFAAEAEAE5857575F5858908484E0CECE7B83B73F81DA
        52E8FA00CDFF3BEBFE2C74F16A7BDFC9CBD6E5E5E5F2F2F2FFFFFFFFFFFFFFFF
        FF7672728B8080DECCCC848FA91636B7368BEC60F5FC67DBF93169EC8696D7D0
        D0D4E1E1E1ECECECF8F8F8FFFFFFFFFFFF8E8C8CBEAEAEEEDBDBEDDEE6848DC9
        365DCF427FE32D50DE7DA4D6B3B8CFD7D7D7E7E7E7F5F5F5FFFFFFF2F2F2A3A0
        A0B9ABABEEDBDBF9E5E5FAE6E6F0DDE5CBD2E69EA0D39398C1A3A3B3B2B0B0B0
        AEAEB0ADADABA6A6A49C9CBAADADECD9D9F6E2E2FAE6E6FAE6E6}
    end
    object cxLabel4: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = 'Фильтр'
      ParentColor = False
      Style.BorderStyle = ebsNone
      Style.Color = clInactiveCaption
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 17
      Width = 1048
      AnchorX = 524
      AnchorY = 9
    end
    object Panel2: TPanel
      Left = 895
      Top = 17
      Width = 153
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnFilterOnlyWithCounts: TcxButton
        Left = 48
        Top = 1
        Width = 99
        Height = 22
        Hint = 'Создать возвратные накладные'
        Caption = 'Не пустые'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnFilterOnlyWithCountsClick
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Silver'
        OptionsImage.Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FAE6E6FAE6E6
          FAE6E6FAE6E6FAE6E6FAE6E6F3DFDFE5D3D3DCCACAE5D3D3F5E1E1FAE6E6FAE6
          E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6F3DFDFD3C2C29F
          9393877C7CA89B9BE6D3D3FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6
          FAE6E6FAE6E6FAE6E6DDCCCC867F7F757272686262837878DBCACAFAE6E6FAE6
          E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6F9E5E5B5AEAEECECECA6
          A6A6646161796F6FD8C7C7F9E5E5FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6
          FAE6E6FAE6E6F8E4E4CFCDCDE9E9E99E9E9E636060726969D3C2C2F9E5E5FAE6
          E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6F9E5E5EDDADACDCCCCD1D1D191
          9191615F5F645C5CBAABABEEDBDBFAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6
          F9E5E5F1DDDDBFB1B1909090B1B1B18888885D5D5D5E5757847979CDBDBDF3DF
          DFFAE6E6FAE6E6FAE6E6FAE6E6F9E5E5EFDCDCCCBDBDA3A0A0F5F5F5D7D7D7AC
          ACAC7373736562625D5656948888D8C7C7F6E2E2FAE6E6FAE6E6F9E5E5EEDBDB
          C5B6BB95939FE9EEF7DBDBDCD0D0D0B1B1B18484846464646D6767625A5AA396
          96E0CECEF8E4E4FAE6E6F4E0E1BCB9CC7377B8808DFB9EC9F7ACB6E3CECFD5B9
          B9B99191917272725C5C5C6E67676B6363B3A5A5E8D5D5F9E5E5D6C9DB7A95D1
          5092FA5AB1FC4698F63D53DB7D87B29898988686866666665151514B4B4B655E
          5E776E6EC2B2B2F1DDDDAFABD52F51E458D9F71CE4FE57E9FB52A7F281A1DFD7
          DAE1F6F6F6FFFFFFFAFAFAAEAEAE5857575F5858908484E0CECE7B83B73F81DA
          52E8FA00CDFF3BEBFE2C74F16A7BDFC9CBD6E5E5E5F2F2F2FFFFFFFFFFFFFFFF
          FF7672728B8080DECCCC848FA91636B7368BEC60F5FC67DBF93169EC8696D7D0
          D0D4E1E1E1ECECECF8F8F8FFFFFFFFFFFF8E8C8CBEAEAEEEDBDBEDDEE6848DC9
          365DCF427FE32D50DE7DA4D6B3B8CFD7D7D7E7E7E7F5F5F5FFFFFFF2F2F2A3A0
          A0B9ABABEEDBDBF9E5E5FAE6E6F0DDE5CBD2E69EA0D39398C1A3A3B3B2B0B0B0
          AEAEB0ADADABA6A6A49C9CBAADADECD9D9F6E2E2FAE6E6FAE6E6}
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1048
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object edSelDK: TcxButtonEdit
      Left = 63
      Top = 25
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick1
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 2
      OnEnter = edSelDKEnter
      Width = 344
    end
    object cmbTT: TcxLookupComboBox
      Left = 413
      Top = 26
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 550
      Properties.KeyFieldNames = 'RECID;BASEID'
      Properties.ListColumns = <
        item
          Caption = 'Адрес'
          FieldName = 'ADDRESS'
        end>
      Properties.ListSource = dsTT
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 3
      Width = 233
    end
    object btnRefresh: TcxButton
      Left = 652
      Top = 12
      Width = 105
      Height = 29
      Action = actRefresh
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Black'
      OptionsImage.Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00080808001717
        1700272727003737370047474700575757006767670077777700878787009797
        9700A7A7A700B7B7B700C7C7C700D7D7D700E7E7E700F7F7F70000004C000000
        7F000000B2000000E5001919FF004C4CFE007F7FFF00B2B2FF0000104C00001B
        7F000026B2000031E500194AFF004C72FE007F9AFF00B2C2FF0000204C000036
        7F00004CB2000062E500197BFF004C99FE007FB6FF00B2D3FF0000314C000051
        7F000072B2000093E50019ADFF004CBFFE007FD1FF00B2E3FF0000414C00006D
        7F000099B20000C4E50019DEFF004CE5FE007FECFF00B2F4FF00004C4700007F
        760000B2A50000E5D50019FFEE004CFEF2007FFFF500B2FFF900004C3600007F
        5B0000B27F0000E5A30019FFBD004CFECC007FFFDA00B2FFE900004C2600007F
        3F0000B2590000E5720019FF8C004CFEA5007FFFBF00B2FFD800004C1500007F
        240000B2330000E5410019FF5B004CFE7F007FFFA300B2FFC800004C0500007F
        090000B20C0000E5100019FF29004CFE59007FFF8800B2FFB7000A4C0000127F
        000019B2000020E500003AFF190066FE4C0091FF7F00BDFFB2001B4C00002D7F
        00003FB2000051E500006BFF19008CFE4C00ADFF7F00CDFFB2002B4C0000487F
        000065B2000083E500009CFF1900B2FE4C00C8FF7F00DEFFB2003C4C0000647F
        00008CB20000B4E50000CDFF1900D8FE4C00E3FF7F00EEFFB2004C4C00007F7F
        0000B2B20000E5E50000FFFF1900FEFE4C00FFFF7F00FFFFB2004C3C00007F64
        0000B28C0000E5B40000FFCD1900FED84C00FFE37F00FFEEB2004C2B00007F48
        0000B2660000E5830000FF9C1900FEB24C00FFC87F00FFDEB2004C1B00007F2D
        0000B23F0000E5510000FF6B1900FE8C4C00FFAD7F00FFCDB2004C0A00007F12
        0000B2190000E5200000FF3A1900FE654C00FF917F00FFBDB2004C0005007F00
        0900B2000C00E5001000FF192900FE4C5900FF7F8800FFB2B7004C0015007F00
        2400B2003200E5004100FF195B00FE4C7F00FF7FA300FFB2C8004C0026007F00
        3F00B2005900E5007200FF198C00FE4CA500FF7FBF00FFB2D8004C0036007F00
        5B00B2007F00E500A300FF19BD00FE4CCC00FF7FDA00FFB2E9004C0047007F00
        7600B200A500E500D500FF19EE00FE4CF200FF7FF500FFB2F90041004C006D00
        7F009900B200C400E500DE19FF00E54CFE00EC7FFF00F4B2FF0031004C005100
        7F007200B2009300E500AD19FF00BF4CFE00D17FFF00E3B2FF0020004C003600
        7F004C00B2006200E5007B19FF00994CFE00B67FFF00D3B2FF0010004C001B00
        7F002600B2003100E5004A19FF00724CFE009A7FFF00C2B2FF00090909090919
        0909090909090909090909090909B7A10909090909090909090909090909ADA2
        16991616090909090909090909B69AB6B5ADB5A29917090909090909A6ADAD08
        A419A6AFBFAD1609090909090907AEA5B5A609090909AEAD09090909090909AF
        AE170909090909AE090909090909090909AE0909090909090909090909090909
        0909091B0909090909090909AE1A0909090909ADA11909090909090909AD0809
        090909AD08A21519090909090909ADA21516A2ADADADA2A209090909090909B7
        AEADAD18ADADAD090909090909090909AF1CA6A6AEAD19090909090909090909
        0909090907AD0909090909090909090909090909A70909090909}
    end
    object SelPeriod: TMegaPeriodPanel2
      Left = 423
      Top = 0
      Width = 217
      Height = 25
      Orientation = mpHorizontal
      LeftComboPos = 0
      LabelCaption = ' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Color = clBtnFace
      TabStop = True
      BevelOuter = bvNone
      TabOrder = 1
      DBAwareType = dbatAlways
      FromDate = 38604.000000000000000000
      TillDate = 38604.000000000000000000
      ShowPeriodButtons = False
      FixedPeriodShift = False
      Period = dtNone
    end
    object SelBalance: TMegaSelBalance
      Left = 2
      Top = 2
      Width = 425
      Height = 25
      Orientation = mpHorizontal
      LeftComboPos = 60
      LabelCaption = '&Баланс'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Color = clBtnFace
      TabStop = True
      BevelOuter = bvNone
      TabOrder = 0
      Database = DM.Money
      Transaction = tr
      DropDownWidth = 0
      OnChange = SelBalanceChange
      DesignSize = (
        425
        25)
    end
    object lbSelDK: TcxLabel
      Left = 7
      Top = 28
      Caption = 'От кого:'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object btnOtlozLoad: TcxButton
      Left = 772
      Top = 24
      Width = 131
      Height = 23
      Hint = 'Обновить список накладных'
      Caption = 'Загрузитьвозврат'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnOtlozLoadClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = 'Silver'
      OptionsImage.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000C2C1C78B9CA8
        8B9CA88B9CA88B9CA88B9CA88B9CA88B9CA88B9CA88B9CA88B9CA88B9CA890A0
        ABFAE6E6FAE6E6FAE6E68B9CA872BDDD72BDDD72BDDD72BDDD72BDDD72BDDD0F
        4D5F376D84417B95417B95417B956DB5D48B9CA8FAE6E6FAE6E68B9CA873BEDF
        73C0DF73C0DF73C0DF75BEDF73BFDE868686BDBDBDFFFFFFFFFFFF437C956FB7
        D66FB7D68B9CA8FAE6E68B9CA877C1E277C2E277C2E275C2E477C2E277C2E286
        8686BDBDBDFFFFFFFFFFFF447F9870B9D970B9DA8B9CA8FAE6E68B9CA878C6E7
        78C6E778C6E778C6E878C6E878C6E8868686BDBDBDFFFFFFFFFFFF45819C73BD
        DE72BDDD8B9CA8FAE6E68B9CA87CCBEC7CCBEC7CCBED7CCBEC7DCBEC7DCBED86
        8686BDBDBDFFFFFFFFFFFF48849E75C0E075C1E08B9CA8FAE6E68B9CA880CFF1
        80CFF180CFF181CFF180CFF181CFF1868686BDBDBDFFFFFFFFFFFF4B89A178C5
        E578C5E58B9CA8FAE6E68F9FAB84D5F784D5F684D5F684D5F684D5F684D4F786
        8686B4B4B4E5E5E5FFFFFF4E8CA67BC8E8577A8CA9B0B9FAE6E694A2AD87DAFC
        87DAFC86DAFE87DAFC86DAFC86D8FC87DAFC949494D9D9D9FFFFFF508FAB6986
        96ADB3BBFAE6E6FAE6E69AA6B08BDEFE8BDEFE8BDEFE8BDEFE8BDEFE89DEFE8B
        DEFE8ADDFEA3A3A3FFFFFF5699B79AA6B0FAE6E6FAE6E6FAE6E6A0AAB48CE2FE
        8EE2FE8EE2FE8EE2FE8EE2FE8CE2FE8EE2FE8CE1FEB7B7B7FFFFFF5196B8A0AA
        B4FAE6E6FAE6E6FAE6E6A7AFB890E5FE90E7FE90E7FE91E5FE90E5FE91E7FE91
        E7FE90E5FEBFBFBFFFFFFF4C98BDA7AFB8FAE6E6FAE6E6FAE6E6AEB4BC92E8FE
        92E8FE92EAFE92EAFE92E8FE92E8FE92E8FE92E8FECBCBCBFFFFFF4D9EC9AEB4
        BCFAE6E6FAE6E6FAE6E6B6B9C093EAFE93EAFE93EAFE93EAFE93EAFE93EAFE93
        EAFE93EAFED3D3D3FFFFFF5DABD2B6B9C0FAE6E6FAE6E6FAE6E6BEBEC493EAFE
        93EAFE93EAFE93EAFE93EAFE93EAFE93EAFE93EAFE72BDDD87D8FB96D1EBBEBE
        C4FAE6E6FAE6E6FAE6E6E0D4D7C6C3C9C7C4C9C7C4C9C7C4C9C7C4C9C7C4C9C6
        C3C9C7C4C9C7C4C9C7C4C9C7C4C9E0D4D7FAE6E6FAE6E6FAE6E6}
    end
    object btnOtlozSave: TcxButton
      Left = 772
      Top = 2
      Width = 131
      Height = 23
      Hint = 'Обновить список накладных'
      Caption = 'Отложить возврат'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnOtlozSaveClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = 'Silver'
      OptionsImage.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FAE6E6B1B4A6
        B1B6A7B6B6ABC1B7B5C3B6B6C0B6B4BFB6B3BEB5B3BFB6B3BBB4AFAFB3A4B1B5
        A6B2B7A8B0B5A6E2D1D1F2E7E110AF3D21BF5743A652C3D1CA45BC70B6C8BCD2
        D0D2CDCCCDCECACC93BCA21CBC520B9D2324BE5820BF5294A28DF2E7E21AB34E
        2BC3664AA85AB5D2C219C25BA9C9B5DBD8D9D1D1D1D2CED099BFA726C262139D
        2C2EC1672BC46399A491F2E7E219B34E2ABE634BA45ABDDACA17C058B1D1BDE7
        E4E6DFDFDFDEDBDD9FC5AE26C16112982B2CBA622BC46299A492F2E7E219B44D
        26B25D4CA55BE6EEEC57C382DAE5DFFFF7FFF9F1F8FAEEF7ADCEBB22BD5C1197
        292AB05D2AC26299A492F2E7E218AE4A2BB3620F9B32369A433E9C49359C4432
        9E41329F42329C42139126029119109A312CB26127B95C99A592F2E7E217A948
        20AA4D84BB8E89C09188BF9088C09088C09088C09088C0908BC0928EC19581BA
        8B1EAB4D27B55B9AA591F2E7E215A5471FA141FFF2FEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDF91AA14026B55A9AA491F2E7E215A547
        1EA140FDF3FAF5F5F5F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F5F5F5F9EE
        F619A23F26B55B9AA491F2E7E217A9481EA140FCF2F9FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDF519A13F26B65A9AA591F2E7E218AE4A
        1EA140FDF3FAF5F5F5F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F5F5F5F9EE
        F619A13E27BA5E99A592F2E7E219B44F1EA341FCF2F9FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDF518A03E2AC36299A492F2E7E217B64D
        20AB43FDF2FAF5F5F5F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F5F5F5F9EE
        F51BAA432DC76699A492F2E8E2477A43398F40FFF6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEFF9149B32149B329AA693F1E7E2146912
        138823C5D1C5C3D7C5C3D6C4C3D6C4C3D6C4C3D6C4C3D6C4C3D6C4C4D7C5C1CC
        C00D9C2D09982A93A08CFAE6E6E7E6DAE5E5D8E4E4D6E3E4D6E3E4D6E3E4D6E3
        E4D6E3E4D6E3E4D6E3E4D6E3E4D6E4E4D6E5E4D8E5E5D8F8E5E5}
    end
  end
  object cxLabel2: TcxLabel
    Left = 0
    Top = 47
    Align = alTop
    AutoSize = False
    Caption = 'Накладные'
    ParentColor = False
    Style.Color = clInactiveCaption
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Height = 15
    Width = 1048
    AnchorX = 524
    AnchorY = 55
  end
  object pnCreateNakl: TPanel
    Left = 0
    Top = 484
    Width = 1048
    Height = 129
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 3
    object cxButton2: TcxButton
      Left = 8
      Top = 23
      Width = 137
      Height = 41
      Action = actCreateNewNakl
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Black'
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
    object cxLabel3: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = 'Создание накладных'
      ParentColor = False
      Style.BorderStyle = ebsNone
      Style.Color = clInactiveCaption
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 17
      Width = 1044
      AnchorX = 522
      AnchorY = 9
    end
    object Panel3: TPanel
      Left = 820
      Top = 17
      Width = 224
      Height = 108
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 5
      object btnClearFullReturn: TcxButton
        Left = 138
        Top = 3
        Width = 84
        Height = 37
        Action = actClearFullReturn
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Black'
        OptionsImage.Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FAE6E6FAE6E6
          FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6
          E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6F3D8D3CE9373B6622EA9
          4B0EA7480EB15D2ECA8D74F3D8D3FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6
          FAE6E6ECB89CBA5F0FB95E00B75A00B65600C26714AA4800A84800A9490FE4B0
          9DFAE6E6FAE6E6FAE6E6FAE6E6FAE6E6EDB99CC16402C26900C06500BB5B00EC
          B37BFFFFFABF6101B25400AA4900A94603E4B09DFAE6E6FAE6E6FAE6E6F6D9D2
          C67217C86F00C66E00C36300E6A766FFFFFFFFFFFFC56804BA5D00B55900AA49
          00A9490FF2D7D3FAE6E6FAE6E6D7A070D3861DCC7400CA6D00E39F58FFFFFFFF
          FFFFF2C699BE5E00BC6000B95C00B35300AA4900CB8F73FAE6E6FAE6E6CE8736
          D88E1ECF7300E0984CFFFFFFFFFFFFEEBB86D47205D37810D37B19D37C20C66B
          0DAB4900B35F2DFAE6E6FAE6E6CF8321DE951FDD9141FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3C4AE4B00AB4B0CFAE6E6FAE6E6D48521
          E7A234DC8B35FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D3
          AEB45100AD4D0CFAE6E6FAE6E6D89136F0B75BE68000DC8D39FFFFFFFFFFFFE6
          A96CD36C00D47400D17300CF7204C66A00B95D00BA692EFAE6E6FAE6E6E0A973
          F5B654F2A127ED8500DE9241FFFFFFFFFFFFE6AA6CD47B00CF7900CA7200C46A
          00BB6000D29976FAE6E6FAE6E6F6DCD3E5962BFDC267FA9B0AF18600DE9549FF
          FFFFF6E2D4D47800D17B00CC7300C86F00BF6412F5DBD5FAE6E6FAE6E6FAE6E6
          F7C8A1F3A530FFC564F9A21FEB8000E09E5AECC7AAD67C00D17C00CD7700C66C
          04EDBFA3FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6F6CAA3E9992EF9B954F7B54EEA
          9A21DD880BDC8D0ED58711CC7615EFC1A4FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6
          FAE6E6FAE6E6F8DFD7E2AE7ADE9A43D98F2DD78D2ED69243DDA87BF7DED7FAE6
          E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FA
          E6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6}
      end
      object btnFullReturn: TcxButton
        Left = 28
        Top = 3
        Width = 104
        Height = 38
        Action = actFullReturn
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Black'
        OptionsImage.Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FAE6E6FAE6E6
          FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6
          E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6E5D4E57D7FDA3C4ED71B
          32D41931D03A48CE7E7BCDE6D3E3FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6
          FAE6E6AAA8ED284EF13464FD2E5EFE2F63FB2454F41B40E7183CE11A32D1ABA0
          DFFAE6E6FAE6E6FAE6E6FAE6E6FAE6E6A9A9EE3160FD4273FF3D6DFF2F62FFC9
          E0FFB3D2FF255DFF2552F71A3CDF1230DBABA0DFFAE6E6FAE6E6FAE6E6E4D6E8
          3962FD4C7AFF4674FF4573FF3668FFD0E2FFFFFFFFA3C8FF275EFF2958FE1A3C
          DF1A30D2E5D3E3FAE6E6FAE6E67A89F16993FE5080FF5382FF5281FF4676FF73
          9FFFFFFFFFFFFFFF9DC5FF285EFF2652F61A3CE07D7AD0FAE6E6FAE6E65577FA
          76A0FF3D73FF2D66FF3069FF346DFF2B69FF709FFFFFFFFFFFFFFF93BDFF275E
          FF1E42E33948D1FAE6E6FAE6E64D78FD7EACFF7C98FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF8CB8FF224CF01A34D4FAE6E6FAE6E6547EFD
          94BEFF6B89FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F9D
          FF2B58F71A36D6FAE6E6FAE6E6678AFAB1D5FF5895FF3A77FF3C7BFF3E7BFF1F
          61FF7FA0FFFFFFFFFFFFFF608FFF3567FF3562F93C51DAFAE6E6FAE6E68C9CF2
          B1D7FF9DCEFF89C4FF89C3FF78B4FF7E9DFFFFFFFFFFFFFF5785FF4172FF4373
          FF3865F88085E0FAE6E6FAE6E6E9DBE7729EFDC7EAFF99D2FF8BC9FF5E9CFFD7
          DDFFFFFFFF507BFF4F83FF4D7CFF4B7AFF2D52F3E8D7E7FAE6E6FAE6E6FAE6E6
          BBBEED92BEFECEF4FFA4D7FF6AA8FF9BABFF4E77FF5A92FF5B8CFF5584FF3464
          FEB1AFEDFAE6E6FAE6E6FAE6E6FAE6E6FAE6E6BDC0ED7AA3FCBAE3FFB6DEFF72
          A2FF7BADFF75A6FF6997FF3C68FCB2B1EDFAE6E6FAE6E6FAE6E6FAE6E6FAE6E6
          FAE6E6FAE6E6EBDDE796A2F17596F9668FFC6088FC6786F98A98F1EADAE7FAE6
          E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FA
          E6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6FAE6E6}
      end
    end
    object chbBoy: TcxCheckBox
      Left = 958
      Top = 59
      Action = actBoy
      Style.BorderStyle = ebsUltraFlat
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 1
      Visible = False
      Width = 52
    end
    object edNotes: TcxTextEdit
      Left = 233
      Top = 60
      TabOrder = 2
      Width = 306
    end
    object cxLabel5: TcxLabel
      Left = 151
      Top = 40
      Caption = 'Причина:'
    end
    object lbNaklNumber: TcxLabel
      Left = 545
      Top = 20
      Caption = '№ накл.:'
    end
    object edNaklNumber: TcxTextEdit
      Left = 592
      Top = 20
      TabOrder = 3
      OnKeyDown = edFilterNaklNumberKeyDown
      Width = 77
    end
    object chbChangePriceOper: TcxCheckBox
      Left = 958
      Top = 90
      Caption = 'Изм. цены'
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 8
      Visible = False
      Width = 76
    end
    object edNaklDate: TcxDateEdit
      Left = 731
      Top = 20
      TabOrder = 9
      Width = 102
    end
    object cxLabel9: TcxLabel
      Left = 670
      Top = 23
      Caption = 'Дата накл.'
    end
    object chbPodotchet: TcxCheckBox
      Left = 958
      Top = 74
      Action = actPodotchet
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 11
      Visible = False
      Width = 69
    end
    object cxLabel10: TcxLabel
      Left = 151
      Top = 60
      Caption = 'Примечание:'
    end
    object edReturnCauseId: TcxLookupComboBox
      Left = 233
      Top = 40
      Properties.KeyFieldNames = 'CAUSEID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = dsCauseSprav
      TabOrder = 13
      Width = 306
    end
    object chkMarkDown: TcxCheckBox
      Left = 958
      Top = 104
      Caption = 'Уценка'
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 14
      Visible = False
      Width = 66
    end
    object edReturnTypeId: TcxLookupComboBox
      Left = 233
      Top = 20
      Properties.KeyFieldNames = 'TYPEID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = dsCauseSpravType
      Properties.OnChange = edReturnTypeIdPropertiesChange
      TabOrder = 15
      Width = 306
    end
    object cxLabel11: TcxLabel
      Left = 151
      Top = 20
      Caption = 'Тип возврата:'
    end
    object lbExperitorDK: TcxLabel
      Left = 111
      Top = 80
      Caption = 'Экспедитор/Дебитор:'
    end
    object lbPerevDK: TcxLabel
      Left = 547
      Top = 99
      Caption = 'Перевозчик:'
    end
    object edExperitorDK: TcxButtonEdit
      Left = 233
      Top = 80
      Hint = 
        'При переделке с формы на форму здесь указывается дебитор, иначе ' +
        'указывается экспедитор'
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 19
      Width = 306
    end
    object edPerevDK: TcxButtonEdit
      Left = 629
      Top = 99
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = edPerevDKPropertiesButtonClick
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 20
      Width = 323
    end
    object cmbTTDK: TcxLookupComboBox
      Left = 545
      Top = 79
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 550
      Properties.KeyFieldNames = 'RECID;BASEID'
      Properties.ListColumns = <
        item
          Caption = 'Адрес'
          FieldName = 'ADDRESS'
        end>
      Properties.ListSource = dsTTDK
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 21
      Width = 407
    end
    object edStiker: TcxTextEdit
      Left = 652
      Top = 40
      TabOrder = 22
      Width = 181
    end
    object lbStiker: TcxLabel
      Left = 545
      Top = 40
      Caption = 'Номер стикера :'
    end
    object lbZayavka: TcxLabel
      Left = 545
      Top = 56
      Caption = 'Номер заявки :'
    end
    object edZayavka: TcxTextEdit
      Left = 652
      Top = 60
      TabOrder = 25
      Width = 181
    end
    object MegaSelBalance1: TMegaSelBalance
      Left = 172
      Top = 100
      Width = 369
      Height = 25
      Orientation = mpHorizontal
      LeftComboPos = 60
      LabelCaption = '&Баланс'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Color = clBtnFace
      TabStop = True
      BevelOuter = bvNone
      TabOrder = 26
      Database = DM.Money
      Transaction = tr
      DropDownWidth = 0
      DesignSize = (
        369
        25)
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 450
    Width = 1048
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    object cxLabel7: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = 'Печать'
      ParentColor = False
      Style.BorderStyle = ebsNone
      Style.Color = clInactiveCaption
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 17
      Width = 1048
      AnchorX = 524
      AnchorY = 9
    end
    object chbPrintKorNN: TcxCheckBox
      Left = 5
      Top = 15
      Caption = 'Печать кор. НН'
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 1
      Width = 114
    end
    object chbPrintPriemAct: TcxCheckBox
      Left = 125
      Top = 15
      Caption = 'Печатать прием. Акт'
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 2
      Width = 141
    end
    object cxLabel8: TcxLabel
      Left = 276
      Top = 16
      Caption = 'Печатать возвр. накладные в кличестве (копий)'
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
    end
    object sePrintNaklCount: TcxSpinEdit
      Left = 528
      Top = 14
      Properties.MaxValue = 100.000000000000000000
      Style.LookAndFeel.SkinName = 'Lilian'
      StyleDisabled.LookAndFeel.SkinName = 'Lilian'
      StyleFocused.LookAndFeel.SkinName = 'Lilian'
      StyleHot.LookAndFeel.SkinName = 'Lilian'
      TabOrder = 4
      Width = 53
    end
  end
  object tr: TMegaTransaction
    DefaultDatabase = DM.Money
    TimeoutAction = TACommitRetaining
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 408
    Top = 264
  end
  object qr: TMegaQuery
    Transaction = tr
    Database = DM.Money
    Left = 224
    Top = 216
  end
  object mselDK: TMegaSelDKDialog
    Database = DM.Money
    Transaction = tr
    Options = []
    Left = 408
    Top = 312
  end
  object ActionList1: TActionList
    Images = DM.ImageList1
    Left = 488
    Top = 184
    object actRefresh: TAction
      Caption = 'Обновить'
      Hint = 'Обновить список накладных'
      ShortCut = 16466
      OnExecute = actRefreshExecute
    end
    object actClose: TAction
      Caption = 'Закрыть'
      Hint = 'Закрыть форму'
      ShortCut = 32849
      OnExecute = actCloseExecute
    end
    object actFullReturn: TAction
      Caption = 'Полный возврат'
      Hint = 'Переношу все позиции в возврат'
      ShortCut = 16449
      OnExecute = actFullReturnExecute
    end
    object actCreateNewNakl: TAction
      Caption = 'Создать накладные'
      Hint = 'Создать возвратные накладные'
      ShortCut = 16397
      OnExecute = actCreateNewNaklExecuteNew
    end
    object actClearFullReturn: TAction
      Caption = 'Очистить'
      ShortCut = 16451
      OnExecute = actFullReturnExecute
    end
    object actFocusNaklFilter: TAction
      Caption = 'actFocusNaklFilter'
      ShortCut = 115
      OnExecute = actFocusNaklFilterExecute
    end
    object actFocusMaterFilter: TAction
      Caption = 'actFocusMaterFilter'
      ShortCut = 119
      OnExecute = actFocusMaterFilterExecute
    end
    object actClearFilter: TAction
      Caption = 'Очистить фильтр'
      Hint = 'Очистить фильтр'
      ShortCut = 16503
      OnExecute = actClearFilterExecute
    end
    object actBoy: TAction
      Category = 'бой и подотчет'
      AutoCheck = True
      Caption = 'Бой'
      GroupIndex = 213
    end
    object actPodotchet: TAction
      Category = 'бой и подотчет'
      AutoCheck = True
      Caption = 'Подотчет'
      GroupIndex = 213
    end
  end
  object dsMain: TDataSource
    DataSet = cdsMain
    Left = 168
    Top = 320
  end
  object cdsMain: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'RECID'
        DataType = ftInteger
      end
      item
        Name = 'BASEID'
        DataType = ftInteger
      end
      item
        Name = 'OPERDATE'
        DataType = ftDate
      end
      item
        Name = 'DOCTYPE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DOCNUMBER'
        DataType = ftInteger
      end
      item
        Name = 'KOD_MATER'
        DataType = ftFloat
      end
      item
        Name = 'NAME_MATER'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'KOD_EAN'
        DataType = ftFloat
      end
      item
        Name = 'ADDRESS'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'SCHET'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'KOLICH'
        DataType = ftFloat
      end
      item
        Name = 'PRICE'
        DataType = ftFloat
      end
      item
        Name = 'PRICE_PDV'
        DataType = ftFloat
      end
      item
        Name = 'KOLICH_MY'
        DataType = ftFloat
      end
      item
        Name = 'IS_KOMISS_MATER'
        DataType = ftInteger
      end
      item
        Name = 'BALANCE_KOD'
        DataType = ftInteger
      end
      item
        Name = 'KOD_OPER'
        DataType = ftInteger
      end
      item
        Name = 'GROUP_OPER'
        DataType = ftInteger
      end
      item
        Name = 'DATE_ROZLIVA'
        DataType = ftDate
      end
      item
        Name = 'INVOCE_NUMBER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'REGID_FORM_A'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'REGID_FORM_B'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'cdsMainIndex1'
        Fields = 'RECID;BASEID;KOD_MATER;SCHET'
      end>
    Params = <>
    StoreDefs = True
    BeforePost = cdsMainBeforePost
    OnCalcFields = cdsMainCalcFields
    Left = 168
    Top = 272
    object cdsMainRECID: TIntegerField
      FieldName = 'RECID'
      Visible = False
    end
    object cdsMainBaseID: TIntegerField
      FieldName = 'BASEID'
      Visible = False
    end
    object cdsMainOPERDATE: TDateField
      DisplayLabel = 'Дата операции'
      FieldName = 'OPERDATE'
    end
    object cdsMainDOCTYPE: TStringField
      DisplayLabel = 'Тип'
      FieldName = 'DOCTYPE'
      Size = 6
    end
    object cdsMainDOCNUMBER: TIntegerField
      DisplayLabel = 'Номер'
      FieldName = 'DOCNUMBER'
    end
    object cdsMainKOD_MATER: TFloatField
      FieldName = 'KOD_MATER'
      Visible = False
    end
    object cdsMainNAME_MATER: TStringField
      DisplayLabel = 'Наименование'
      FieldName = 'NAME_MATER'
      Size = 45
    end
    object cdsMainKOD_EAN: TFloatField
      DisplayLabel = 'ЕАН'
      FieldName = 'KOD_EAN'
    end
    object cdsMainADDRESS: TStringField
      DisplayLabel = 'ТТ'
      FieldName = 'ADDRESS'
      Size = 80
    end
    object cdsMainSCHET: TStringField
      FieldName = 'SCHET'
      Size = 8
    end
    object cdsMainKOLICH: TFloatField
      DisplayLabel = 'Количество'
      FieldName = 'KOLICH'
    end
    object cdsMainPRICE: TFloatField
      DisplayLabel = 'Сумма'
      FieldName = 'PRICE'
    end
    object cdsMainPRICE_PDV: TFloatField
      FieldName = 'PRICE_PDV'
    end
    object cdsMainKOLICH_MY: TFloatField
      DisplayLabel = 'Количество'
      FieldName = 'KOLICH_MY'
    end
    object cdsMainSUMMA_MY: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUMMA_MY'
      Calculated = True
    end
    object cdsMainIS_KOMISS_MATER: TIntegerField
      FieldName = 'IS_KOMISS_MATER'
    end
    object cdsMainBALANCE_KOD: TIntegerField
      FieldName = 'BALANCE_KOD'
    end
    object cdsMainKOD_OPER: TIntegerField
      FieldName = 'KOD_OPER'
    end
    object cdsMainGROUP_OPER: TIntegerField
      FieldName = 'GROUP_OPER'
    end
    object cdsMainDATE_ROZLIVA: TDateField
      FieldName = 'DATE_ROZLIVA'
    end
    object cdsMainINVOCE_NUMBER: TIBStringField
      FieldName = 'INVOCE_NUMBER'
    end
    object cdsMainREGID_FORM_A: TStringField
      FieldName = 'REGID_FORM_A'
      Size = 30
    end
    object cdsMainREGID_FORM_B: TStringField
      FieldName = 'REGID_FORM_B'
      Size = 30
    end
  end
  object fs: TFormStorage
    StoredProps.Strings = (
      'cxViewADDRESS.Width'
      'cxViewBASEID.Width'
      'cxViewDOCNUMBER.Width'
      'cxViewDOCTYPE.Width'
      'cxViewKOD_MATER.Width'
      'cxViewKOLICH.Width'
      'cxViewKOLICH_MY.Width'
      'cxViewNAME_MATER.Width'
      'cxViewOPERDATE.Width'
      'cxViewSCHET.Width'
      'cxViewSUMMA.Width'
      'cxViewSUMMA_MY.Width'
      'cxViewSUMMA_PDV.Width'
      'chbBoy.Checked'
      'edFilterNaklNumber.Text'
      'edFilterMaterName.Text'
      'sePrintNaklCount.Value')
    StoredValues = <>
    Left = 472
    Top = 312
  end
  object qrMain: TMegaQuery
    Transaction = tr
    Database = DM.Money
    Left = 168
    Top = 216
  end
  object qrTT: TMegaDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT'
      '  sto.RECID RECID,'
      '  sto.BASEID BASEID,'
      ''
      
        '  ( snp.nas_p_name || '#39' '#39' || sda.address || '#39' ('#39' || sto.NAME || ' +
        #39')'#39' ) address'
      'FROM SPRAV_TRADE_OUTLET sto'
      
        'left join SPRAV_DK_ADDRESS SDA on ( sda.recid = sto.addr_recid a' +
        'nd sda.baseid = sto.addr_baseid )'
      
        'left join SPRAV_NAS_P snp on (snp.nas_p_id = sda.nas_p_id and sn' +
        'p.country_id = sda.country_id)'
      ''
      'where sto.kod_dk = :kod_dk'
      ' ')
    Transaction = DM.Transaction
    Database = DM.Money
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    DefaultFormats.NumericEditFormat = '0'
    Left = 80
    Top = 104
    object qrTTRECID: TFIBIntegerField
      FieldName = 'RECID'
    end
    object qrTTBASEID: TFIBIntegerField
      FieldName = 'BASEID'
    end
    object qrTTADDRESS: TFIBStringField
      FieldName = 'ADDRESS'
      Size = 242
      EmptyStrToNull = True
    end
  end
  object dsTT: TDataSource
    DataSet = qrTT
    Left = 84
    Top = 152
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 408
    Top = 216
    PixelsPerInch = 96
    object cxStyleSelected: TcxStyle
      AssignedValues = [svColor]
      Color = 14265992
    end
    object cxStyleContentEven: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyleContentOdd: TcxStyle
      AssignedValues = [svColor]
      Color = 16250871
    end
  end
  object qrKodGroupOper: TMegaDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    SelectSQL.Strings = (
      '    SELECT'
      '      so.GROUP_OPER,'
      '      so.KOD_OPER,'
      '      ('
      '        sg.GROUP_NAME || '#39'  /  '#39' ||'
      '        so.NAME_OPER'
      ''
      '      ) NAME'
      ''
      ''
      '    FROM SPRAV_OPER so'
      '      LEFT JOIN SPRAV_GROPER sg on sg.GROUP_OPER = so.GROUP_OPER'
      ''
      '    where so.STATUS = 2 and ('
      '      (GROUP_OPER=300006300 and KOD_OPER=996410)OR  -- 300'
      '      (GROUP_OPER=300006300 and KOD_OPER=77024000)OR-- 300'
      '      (GROUP_OPER=300006300 and KOD_OPER=6402)    -- 300'
      '      )'
      ''
      '    order by sg.GROUP_NAME, so.NAME_OPER')
    Transaction = tr
    Database = DM.Money
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    DefaultFormats.NumericEditFormat = '0'
    Left = 80
    Top = 272
    object qrKodGroupOperGROUP_OPER: TFIBIntegerField
      FieldName = 'GROUP_OPER'
    end
    object qrKodGroupOperKOD_OPER: TFIBIntegerField
      FieldName = 'KOD_OPER'
    end
    object qrKodGroupOperNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 140
      EmptyStrToNull = True
    end
  end
  object dsqrKodGroupOper: TDataSource
    DataSet = qrKodGroupOper
    Left = 80
    Top = 320
  end
  object cdsNaklDistinct: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'RECID'
        DataType = ftInteger
      end
      item
        Name = 'BASEID'
        DataType = ftInteger
      end
      item
        Name = 'SCHET'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'IS_KOMISS_MATER'
        DataType = ftInteger
      end
      item
        Name = 'OPERDATE'
        DataType = ftDate
      end
      item
        Name = 'DOCNUMBER'
        DataType = ftInteger
      end
      item
        Name = 'BALANCE_KOD'
        DataType = ftInteger
      end
      item
        Name = 'KOD_OPER'
        DataType = ftInteger
      end
      item
        Name = 'GROUP_OPER'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 280
    Top = 272
    object cdsNaklDistinctRECID: TIntegerField
      FieldName = 'RECID'
      Visible = False
    end
    object cdsNaklDistinctBASEID: TIntegerField
      FieldName = 'BASEID'
      Visible = False
    end
    object cdsNaklDistinctSCHET: TStringField
      FieldName = 'SCHET'
      Size = 8
    end
    object cdsNaklDistinctIS_KOMISS_MATER: TIntegerField
      FieldName = 'IS_KOMISS_MATER'
    end
    object cdsNaklDistinctDOCNUMBER: TIntegerField
      FieldName = 'DOCNUMBER'
    end
    object cdsNaklDistinctoperdate: TDateField
      FieldName = 'operdate'
    end
    object cdsNaklDistinctbalance_kod: TIntegerField
      FieldName = 'balance_kod'
    end
    object cdsNaklDistinctKOD_OPER: TIntegerField
      FieldName = 'KOD_OPER'
    end
    object cdsNaklDistinctGROUP_OPER: TIntegerField
      FieldName = 'GROUP_OPER'
    end
  end
  object pmDocs: TPopupMenu
    Left = 472
    Top = 264
    object miOpenNakl: TMenuItem
      Caption = 'Открыть накладную'
      Default = True
      OnClick = miOpenNaklClick
    end
    object miSep1: TMenuItem
      Caption = '-'
    end
    object miOpenLinkDocs: TMenuItem
      Caption = 'Связанные документы'
      OnClick = miOpenLinkDocsClick
    end
  end
  object qrGetOstatok: TMegaQuery
    Transaction = tr
    Database = DM.Money
    SQL.Strings = (
      'SELECT SUM(REST_KOLICH) OSTATOK, SUM(REST_SUMMA) OSTATOK_SUM '
      'FROM C_GET_MATER_REST('
      ':BALANCE_KOD, '
      ':SCHET, '
      ':KOD_MATER,'
      'null,'
      ':OPERDATE,'
      '1,'
      
        '(SELECT first 1 dn.CFO FROM DOC_NAKL dn WHERE dn.RECID=:RECID AN' +
        'D dn.BASEID=:BASEID )'
      ') rst')
    Left = 280
    Top = 216
  end
  object qrCauseSprav: TMegaDataSet
    SelectSQL.Strings = (
      'SELECT'
      '  CAUSEID,'
      '  NAME'
      'FROM '
      '  SPRAV_RETURN_CAUSE'
      'WHERE '
      '  ACTIVE_ = 1')
    AllowedUpdateKinds = []
    Transaction = DM.trMainRO
    Database = DM.Money
    UpdateTransaction = DM.trMainWShort
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    Left = 592
    Top = 185
    object qrCauseSpravCAUSEID: TFIBIntegerField
      FieldName = 'CAUSEID'
      Origin = 'SPRAV_RETURN_CAUSE.CAUSEID'
    end
    object qrCauseSpravNAME: TFIBStringField
      FieldName = 'NAME'
      Origin = 'SPRAV_RETURN_CAUSE.NAME'
      Size = 25
      EmptyStrToNull = True
    end
  end
  object dsCauseSprav: TDataSource
    DataSet = qrCauseSprav
    Left = 592
    Top = 233
  end
  object qrCauseSpravType: TMegaDataSet
    SelectSQL.Strings = (
      'SELECT'
      '  TYPEID,'
      '  NAME,'
      '  coalesce(need_more_doc, 0) need_more_doc,'
      '  IS_SEL_BALANCE'
      'FROM '
      '  SPRAV_RETURN_TYPE'
      'ORDER BY TYPEID ASC;')
    AllowedUpdateKinds = []
    Transaction = DM.trMainRO
    Database = DM.Money
    UpdateTransaction = DM.trMainWShort
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    Left = 692
    Top = 181
    object FIBIntegerField1: TFIBIntegerField
      FieldName = 'TYPEID'
      Origin = 'SPRAV_RETURN_CAUSE_TYPE.TYPEID'
    end
    object FIBStringField1: TFIBStringField
      FieldName = 'NAME'
      Origin = 'SPRAV_RETURN_CAUSE_TYPE.NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object qrCauseSpravTypeNEED_MORE_DOC: TFIBIntegerField
      FieldName = 'NEED_MORE_DOC'
    end
    object qrCauseSpravTypeIS_SEL_BALANCE: TFIBIntegerField
      FieldName = 'IS_SEL_BALANCE'
    end
  end
  object dsCauseSpravType: TDataSource
    DataSet = qrCauseSpravType
    Left = 700
    Top = 233
  end
  object qrCauseSpravTypePos: TMegaDataSet
    SelectSQL.Strings = (
      'SELECT'
      '  TYPEID,'
      '  KOD_OPER,'
      'GROUP_OPER,'
      'DOCTYPE,'
      'DK_TO,'
      'ACCOUNT,'
      'BALANCE'
      '  '
      'FROM '
      '  SPRAV_RETURN_TYPE_POS'
      
        'WHERE TYPEID=:TYPEID AND BALANCE=:BALANCE AND (ACCOUNT=:ACCOUNT ' +
        'OR ACCOUNT IS NULL) '
      'ORDER BY ACCOUNT DESC')
    AllowedUpdateKinds = []
    Transaction = DM.trMainRO
    Database = DM.Money
    UpdateTransaction = DM.trMainWShort
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    Left = 832
    Top = 181
    object FIBIntegerField2: TFIBIntegerField
      FieldName = 'TYPEID'
      Origin = 'SPRAV_RETURN_TYPE.TYPEID'
    end
    object qrCauseSpravTypePosOPERKOD: TIntegerField
      FieldName = 'KOD_OPER'
    end
    object qrCauseSpravTypePosOPERGROUP: TIntegerField
      FieldName = 'GROUP_OPER'
    end
    object qrCauseSpravTypePosDOCTYPE: TStringField
      FieldName = 'DOCTYPE'
      Size = 50
    end
    object qrCauseSpravTypePosFIELDDK: TFloatField
      FieldName = 'DK_TO'
    end
    object qrCauseSpravTypePosACCOUNT: TStringField
      FieldName = 'ACCOUNT'
    end
    object qrCauseSpravTypePosBALANCE: TIntegerField
      FieldName = 'BALANCE'
    end
  end
  object mExpeditorDK: TMegaSelDKDialog
    Database = DM.Money
    Transaction = tr
    Options = []
    Left = 584
    Top = 300
  end
  object mPerevDK: TMegaSelDKDialog
    Database = DM.Money
    Transaction = tr
    Options = []
    Left = 684
    Top = 300
  end
  object qrTTDK: TMegaDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT'
      '  sto.RECID RECID,'
      '  sto.BASEID BASEID,'
      ''
      
        '  ( snp.nas_p_name || '#39' '#39' || sda.address || '#39' ('#39' || sto.NAME || ' +
        #39')'#39' ) address'
      'FROM SPRAV_TRADE_OUTLET sto'
      
        'left join SPRAV_DK_ADDRESS SDA on ( sda.recid = sto.addr_recid a' +
        'nd sda.baseid = sto.addr_baseid )'
      
        'left join SPRAV_NAS_P snp on (snp.nas_p_id = sda.nas_p_id and sn' +
        'p.country_id = sda.country_id)'
      ''
      'where sto.kod_dk = :kod_dk'
      ''
      ' ')
    Transaction = DM.Transaction
    Database = DM.Money
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    DefaultFormats.NumericEditFormat = '0'
    Left = 140
    Top = 116
    object qrTTDKRECID: TFIBIntegerField
      FieldName = 'RECID'
    end
    object qrTTDKBASEID: TFIBIntegerField
      FieldName = 'BASEID'
    end
    object qrTTDKADDRESS: TFIBStringField
      FieldName = 'ADDRESS'
      Size = 242
      EmptyStrToNull = True
    end
  end
  object dsTTDK: TDataSource
    DataSet = qrTTDK
    Left = 144
    Top = 164
  end
end
