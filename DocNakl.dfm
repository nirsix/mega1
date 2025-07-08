object DocNaklForm: TDocNaklForm
  Left = 198
  Top = 105
  Caption = 'Документ'
  ClientHeight = 695
  ClientWidth = 1183
  Color = clBtnFace
  Constraints.MinHeight = 630
  Constraints.MinWidth = 787
  ParentFont = True
  FormStyle = fsMDIChild
  HelpFile = 'Документ.Накладная.aspx'
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesigned
  ShowHint = True
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TAutoPanel
    Left = 0
    Top = 661
    Width = 1183
    Height = 34
    Align = alBottom
    TabOrder = 3
    AutoChildPosLeft = True
    AutoChildWidth = True
    object btSep: TSpeedButton
      Left = 585
      Top = 5
      Width = 74
      Height = 25
      Caption = 'Разделение'
      Flat = True
      Visible = False
      OnClick = btSepClick
    end
    object RxSpeedButton1: TRxSpeedButton
      Left = 757
      Top = 4
      Width = 124
      Height = 25
      Action = actGroupNameMAter
      AllowAllUp = True
      GroupIndex = 1
      Flat = True
      Glyph.Data = {
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
      Layout = blGlyphLeft
    end
    object BitBtn7: TcxButton
      Left = 546
      Top = 5
      Width = 76
      Height = 25
      Caption = 'Скидка !'
      TabOrder = 6
      Visible = False
      OnClick = BitBtn7Click
    end
    object BitBtn3: TcxButton
      Tag = 100
      Left = 169
      Top = 5
      Width = 129
      Height = 25
      Action = CopyPos
      TabOrder = 2
      TabStop = False
      OptionsImage.Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      OptionsImage.NumGlyphs = 2
    end
    object BitBtn4: TcxButton
      Tag = 100
      Left = 473
      Top = 5
      Width = 76
      Height = 25
      Action = Print
      TabOrder = 5
      TabStop = False
      OptionsImage.Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      OptionsImage.NumGlyphs = 2
    end
    object BitBtn5: TcxButton
      Tag = 100
      Left = 378
      Top = 5
      Width = 89
      Height = 25
      Action = ACatalog
      TabOrder = 4
      TabStop = False
      OptionsImage.Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      OptionsImage.NumGlyphs = 2
    end
    object BitBtn2: TcxButton
      Tag = 100
      Left = 0
      Top = 4
      Width = 77
      Height = 25
      Action = Edit
      ModalResult = 1
      TabOrder = 0
      TabStop = False
      OptionsImage.Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      OptionsImage.NumGlyphs = 2
    end
    object BitBtn6: TcxButton
      Left = 300
      Top = 5
      Width = 72
      Height = 25
      Action = CreateDoc
      TabOrder = 3
      OptionsImage.Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000000000000000000000000000000000
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F0000000000000000FF7FFF7FFF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F000000000000000000000000FF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F000000000000000000000000FF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F000000000000FF7FFF7FFF7FFF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0000000000000000
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00000000FF7FFF7F0000FF7F00001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F000000001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object BitBtn8: TcxButton
      Left = 623
      Top = 5
      Width = 65
      Height = 25
      Action = FillRests
      TabOrder = 7
    end
    object BitBtn1: TcxButton
      Tag = 100
      Left = 83
      Top = 5
      Width = 84
      Height = 25
      Action = CloseForm
      Cancel = True
      Default = True
      ModalResult = 1
      TabOrder = 1
      TabStop = False
      LookAndFeel.Kind = lfUltraFlat
      OptionsImage.Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      OptionsImage.NumGlyphs = 2
    end
    object cxButton1: TcxButton
      Left = 689
      Top = 5
      Width = 62
      Height = 25
      Action = actAddPosAntiBrand
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object cxButton2: TcxButton
      Left = 753
      Top = 5
      Width = 18
      Height = 25
      Action = actAddFivePoistion
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Visible = False
    end
    object btnAPIFOCUSApi: TButton
      Left = 898
      Top = 4
      Width = 108
      Height = 25
      Caption = 'btnAPIFOCUSApi'
      TabOrder = 10
      Visible = False
      OnClick = btnAPIFOCUSApiClick
    end
  end
  object Panel2: TAutoPanel
    Left = 0
    Top = 69
    Width = 1183
    Height = 249
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    TabOrder = 1
    AutoChildPosLeft = True
    AutoChildWidth = True
    object Panel5: TAutoPanel
      Left = 2
      Top = 2
      Width = 1179
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      AutoChildPosLeft = True
      AutoChildWidth = True
      object Label1: TLabel
        Left = 4
        Top = 4
        Width = 101
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'НАКЛАДНАЯ № '
        FocusControl = DOCNUMBER
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 251
        Top = 4
        Width = 16
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'от'
      end
      object RxLabel1: TcxLabel
        Left = 604
        Top = 4
        Caption = 'Курс:'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object RxLabel8: TcxLabel
        Left = 444
        Top = 4
        Caption = 'Расчеты в:'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object DOCNUMBER: TcxDBTextEdit
        Left = 102
        Top = 3
        DataBinding.DataField = 'DOCNUMBER'
        DataBinding.DataSource = Source
        Properties.MaxLength = 10
        TabOrder = 0
        Width = 67
      end
      object DOCDATE: TcxDBDateEdit
        Left = 268
        Top = 3
        DataBinding.DataField = 'DOCDATE'
        DataBinding.DataSource = Source
        TabOrder = 2
        OnKeyDown = DBDateEdit1KeyDown
        Width = 89
      end
      object InVal: TcxDBLookupComboBox
        Left = 516
        Top = 3
        DataBinding.DataField = 'PRICE_FROM_VALYUTA'
        DataBinding.DataSource = Source
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'Val'
        Properties.ListColumns = <
          item
            FieldName = 'Name'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsVal
        TabOrder = 5
        Width = 89
      end
      object Kurs: TcxDBCalcEdit
        Left = 640
        Top = 3
        DataBinding.DataField = 'KURS'
        DataBinding.DataSource = Source
        Properties.AssignedValues.DisplayFormat = True
        Properties.Precision = 12
        Properties.UseThousandSeparator = True
        Properties.OnChange = KursChange
        TabOrder = 7
        OnExit = KursChange
        Width = 93
      end
      object DBEdit1: TcxDBTextEdit
        Left = 360
        Top = 3
        DataBinding.DataField = 'STATE'
        DataBinding.DataSource = Source
        TabOrder = 3
        Width = 49
      end
      object DBEdit3: TcxDBTextEdit
        Left = 175
        Top = 4
        DataBinding.DataField = 'SUFICS'
        DataBinding.DataSource = Source
        TabOrder = 1
        Width = 80
      end
      object Kurs1: TcxCalcEdit
        Left = 736
        Top = 3
        AutoSize = False
        EditValue = 0
        Properties.AssignedValues.DisplayFormat = True
        Properties.Precision = 12
        Properties.UseThousandSeparator = True
        TabOrder = 8
        OnExit = Kurs1Change
        Height = 21
        Width = 73
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 815
        Top = 3
        DataBinding.DataField = 'SOGL'
        DataBinding.DataSource = Source
        TabOrder = 9
        Width = 33
      end
    end
    object Panel6: TAutoPanel
      Left = 2
      Top = 26
      Width = 1179
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      AutoChildPosLeft = True
      AutoChildWidth = True
      DesignSize = (
        1179
        25)
      object RxLabel3: TcxLabel
        Left = 6
        Top = 7
        Caption = '&От кого:'
        FocusControl = DK_FROM_CE
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object DK_FROM_CE: TcxDBButtonEdit
        Left = 173
        Top = 3
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'DK_FROM_NAME'
        DataBinding.DataSource = Source
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = DK_FROM_CEButtonClick
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = DK_TO_CEEnter
        Width = 805
      end
      object DK_FROM_ED: TcxDBTextEdit
        Left = 72
        Top = 3
        DataBinding.DataField = 'DK_FROM'
        DataBinding.DataSource = Source
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 1
        Width = 97
      end
      object MegaSelCFOfrom: TMegaSelAddress
        Left = 981
        Top = 0
        Width = 198
        Height = 25
        Orientation = mpHorizontal
        LeftComboPos = 0
        LabelCaption = 'Адрес'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Color = clBtnFace
        TabStop = True
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 3
        Database = DM.Money
        Transaction = Nakl_Transaction
        DataField = 'ADDR_FROM'
        DataSource = Source
        DropDownWidth = 0
        DisableForRegions = False
        ShowWithHistory = False
        DesignSize = (
          198
          25)
      end
    end
    object Panel7: TAutoPanel
      Left = 2
      Top = 51
      Width = 1179
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      AutoChildPosLeft = True
      AutoChildWidth = True
      DesignSize = (
        1179
        25)
      object RxLabel4: TcxLabel
        Left = 7
        Top = 3
        Caption = 'К&ому:'
        FocusControl = DK_TO_CE
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object DK_TO_CE: TcxDBButtonEdit
        Left = 173
        Top = 2
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'DK_TO_NAME'
        DataBinding.DataSource = Source
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = DK_FROM_CEButtonClick
        Properties.OnChange = DK_TO_CEChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = DK_TO_CEEnter
        Width = 805
      end
      object DK_TO_ED: TcxDBTextEdit
        Left = 72
        Top = 2
        DataBinding.DataField = 'DK_TO'
        DataBinding.DataSource = Source
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 1
        Width = 97
      end
      object MegaSelCFOto: TMegaSelAddress
        Left = 981
        Top = 0
        Width = 198
        Height = 25
        Orientation = mpHorizontal
        LeftComboPos = 0
        LabelCaption = 'Адрес'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Color = clBtnFace
        TabStop = True
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 3
        Database = DM.Money
        Transaction = Nakl_Transaction
        DataField = 'ADDR_TO'
        DataSource = Source
        DropDownWidth = 0
        OnChange = MegaSelCFOtoChange
        DisableForRegions = False
        ShowWithHistory = False
        DesignSize = (
          198
          25)
      end
    end
    object Panel8: TAutoPanel
      Left = 2
      Top = 126
      Width = 1179
      Height = 83
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 3
      TabOrder = 5
      AutoChildPosLeft = True
      AutoChildWidth = True
      object lbOutletInfo: TLabel
        Left = 72
        Top = 41
        Width = 490
        Height = 13
        AutoSize = False
      end
      object stUser: TDBText
        Left = 421
        Top = 3
        Width = 121
        Height = 13
        Hint = 'Автор документа'
        DataField = 'DOC_CREATOR'
        DataSource = Source
      end
      object RxLabel2: TcxLabel
        Left = 7
        Top = 1
        Caption = '&Форма оплаты:'
        FocusControl = FOplName
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object RxLabel5: TcxLabel
        Left = 120
        Top = 1
        Caption = '&Цена:'
        FocusControl = PriceType
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object RxLabel6: TcxLabel
        Left = 232
        Top = 1
        Caption = '&% +/-'
        FocusControl = cxDBse_Nacenka
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object RxLabel7: TcxLabel
        Left = 350
        Top = 1
        Caption = 'Приме&чание:'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object RxLabel10: TcxLabel
        Left = 804
        Top = 4
        Caption = 'Отгр'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object RxLabel11: TcxLabel
        Left = 715
        Top = 4
        Caption = 'Отср'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object RxLabel13: TcxLabel
        Left = 2
        Top = 39
        Caption = 'Торг.точка'
        FocusControl = FOplName
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object RxLabel14: TcxLabel
        Left = 542
        Top = 1
        Caption = 'Жел.время дост:'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object FOplName: TcxDBLookupComboBox
        Left = 2
        Top = 19
        DataBinding.DataField = 'FOplName'
        DataBinding.DataSource = Source
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.ListOptions.ShowHeader = False
        TabOrder = 3
        Width = 110
      end
      object PriceType: TcxDBLookupComboBox
        Left = 120
        Top = 19
        DataBinding.DataField = 'PriceType'
        DataBinding.DataSource = Source
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.ListOptions.ShowHeader = False
        TabOrder = 5
        Width = 105
      end
      object cbOpl: TCheckBox
        Left = 808
        Top = 20
        Width = 27
        Height = 17
        Hint = 'Отгрузка разрешена'
        TabStop = False
        Color = clBtnFace
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        OnClick = cbOplClick
      end
      object dbedOtsr: TcxDBTextEdit
        Left = 720
        Top = 19
        TabStop = False
        DataBinding.DataField = 'OTSR'
        DataBinding.DataSource = Source
        Properties.ReadOnly = True
        TabOrder = 18
        Width = 37
      end
      object btnPriceCols: TButton
        Left = 720
        Top = 41
        Width = 92
        Height = 16
        Caption = 'ценовые колонки'
        TabOrder = 8
        TabStop = False
        OnClick = btnPriceColsClick
      end
      object Button2: TButton
        Left = 626
        Top = 41
        Width = 92
        Height = 16
        Hint = 'Непредставленные бренды <F10>'
        Action = aBrands
        Caption = 'Бренды'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        TabStop = False
      end
      object edDelivTime: TEdit
        Left = 634
        Top = 3
        Width = 81
        Height = 14
        TabStop = False
        BorderStyle = bsNone
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
      object DBEdit7: TcxDBTextEdit
        Left = 353
        Top = 19
        Hint = 
          'Примечание. '#13#10'- чтобы указать номер заказа клиента, выделите его' +
          ' символом '#39'#'#39';'#13#10'- чтобы указать номер поставщика в системе клиен' +
          'та, поставьте перед ним символ '#39'@'#39';'#13#10'Например,  если надо указат' +
          'ь в накладной номер заказа 12 и код поставщика 5389, в примечани' +
          'и должна быть такая строка:'#13#10'"  #12 @5389 "'
        DataBinding.DataField = 'NOTES'
        DataBinding.DataSource = Source
        TabOrder = 11
        OnKeyDown = cbNotesKeyDown
        Width = 365
      end
      object Button3: TButton
        Left = 532
        Top = 41
        Width = 92
        Height = 15
        Action = actSticker
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        TabStop = False
      end
      object cxDBse_Nacenka: TcxDBSpinEdit
        Left = 231
        Top = 19
        DataBinding.DataField = 'NACENKA_'
        DataBinding.DataSource = Source
        Enabled = False
        Properties.ExceptionOnInvalidInput = True
        Properties.Increment = 0.010000000000000000
        Properties.LargeIncrement = 1.000000000000000000
        Properties.ReadOnly = False
        Properties.ValueType = vtFloat
        TabOrder = 7
        OnExit = cxDBse_NacenkaExit
        Width = 51
      end
      object cbPallete: TcxDBCheckBox
        Left = 215
        Top = 59
        Caption = 'Отгрузка с паллетами'
        DataBinding.DataField = 'USE_PALLETE'
        DataBinding.DataSource = Source
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.SkinName = 'Office2007Black'
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
        StyleHot.LookAndFeel.SkinName = 'Office2007Black'
        TabOrder = 2
        Width = 150
      end
      object cxlReal_Otsr: TcxLabel
        Left = 750
        Top = 4
        Caption = 'Отср ТА'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object teReal_Otsr: TcxDBTextEdit
        Left = 763
        Top = 18
        TabStop = False
        DataBinding.DataField = 'REAL_OTSR'
        DataBinding.DataSource = Source
        Properties.ReadOnly = True
        TabOrder = 21
        Width = 37
      end
      object pnlZayavka: TPanel
        Left = 562
        Top = 59
        Width = 241
        Height = 24
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 14
        DesignSize = (
          241
          24)
        object lbZayavka: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 3
          Width = 36
          Height = 13
          Hint = 'Заявка на транспорт - должна подтягиваться автоматически'
          Caption = 'Заявка'
          Layout = tlCenter
        end
        object lcbZayavka: TcxDBExtLookupComboBox
          AlignWithMargins = True
          Left = 46
          Top = 0
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'ZAYAVKA_ID'
          DataBinding.DataSource = Source
          Properties.ClearKey = 46
          Properties.DropDownSizeable = True
          Properties.DropDownWidth = 800
          Properties.View = cxGridViewRepository1DBTableView1
          Properties.KeyFieldNames = 'RECID'
          Properties.ListFieldItem = cxGridViewRepository1DBTableView1RECID
          Properties.OnInitPopup = lcbZayavkaPropertiesInitPopup
          TabOrder = 0
          Visible = False
          Width = 191
        end
      end
      object chkIsBanket: TcxDBCheckBox
        Left = 371
        Top = 59
        Hint = 'Банкет, сезонный, новогдний'
        Caption = 'Банкет'
        DataBinding.DataField = 'IS_BANKET'
        DataBinding.DataSource = Source
        Properties.Alignment = taLeftJustify
        Properties.DisplayChecked = '1'
        Properties.DisplayUnchecked = '0'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        TabOrder = 12
        Width = 63
      end
      object cbdbDontUseSpecPrice: TcxDBCheckBox
        Left = 0
        Top = 59
        Caption = 'Не использовать акционные цены'
        DataBinding.DataField = 'DONT_USE_SPEC_PRICE'
        DataBinding.DataSource = Source
        Properties.Alignment = taLeftJustify
        Properties.DisplayChecked = '1'
        Properties.DisplayUnchecked = '0'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        TabOrder = 6
        Width = 201
      end
      object cxLabel3: TcxLabel
        Left = 291
        Top = 1
        Caption = 'Скидка, %'
        FocusControl = cxDBse_PercentDiscount
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxDBse_PercentDiscount: TcxDBSpinEdit
        Left = 289
        Top = 19
        DataBinding.DataField = 'PERCENT_DISCOUNT'
        DataBinding.DataSource = Source
        Enabled = False
        Properties.ExceptionOnInvalidInput = True
        Properties.Increment = 0.010000000000000000
        Properties.LargeIncrement = 1.000000000000000000
        Properties.ReadOnly = False
        Properties.ValueType = vtFloat
        TabOrder = 25
        Width = 61
      end
      object grpTRANSPORT_TIME: TGroupBox
        Left = 841
        Top = 28
        Width = 163
        Height = 49
        Caption = 'Время подачи ТС'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 26
        Visible = False
        object btnTRANSPORT_TIMESave: TSpeedButton
          AlignWithMargins = True
          Left = 120
          Top = 21
          Width = 38
          Height = 23
          Align = alRight
          Enabled = False
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000040000
            00130000001E0000002000000020000000200000002100000021000000210000
            002200000022000000220000002300000021000000160000000500000012281E
            16CB37291EFF463A31FFBD8150FFBC7E4DFFB97949FFB67646FFB37141FFB06D
            3DFFAD6839FFAB6535FF42362EFF3D3026FF241A13CE00000015000000193B2C
            21FF685C54FF483C34FFE8C28BFFE7C088FFE6BD85FFE5BB81FFE4B87CFFE3B5
            79FFE2B276FFE2B273FF443931FF51433AFF34261DFF0000001E000000183E2F
            24FF6C6057FF4A3F37FFD9B27DFFD8B07BFFD7AE77FFD7AB74FFD6A970FFD5A6
            6DFFD4A56AFFD4A268FF473B33FF5B4F47FF37291EFF0000001D000000164031
            26FF6F645CFF4C4038FFFFFFFFFFF7F1EBFFF7F0EBFFF7F0EBFFF7EFEBFFF6EF
            EAFFF6EFEAFFF6EFE9FF463B34FF5D5249FF3A2C21FF0000001B000000144434
            29FF73675FFF4F443CFFFFFFFFFFF8F2EDFFF8F1EDFFF7F1EDFFF7F0EDFFF8F1
            EBFFF7F0EBFFF7F0ECFF4A4037FF5F534BFF3D2E23FF00000019000000124637
            2CFF776B63FF50453DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF4E433BFF61544CFF403126FF0000001700000010493A
            2FFF796E66FF50453DFF61564EFF60564EFF60554DFF5F544CFF5E544CFF5E53
            4BFF5D524AFF5C5249FF5B5149FF61554DFF433429FF000000150000000E4C3D
            32FF7C706AFF674E44FF654B42FF634A41FF61473FFF5F473EFF5C443CFF5B43
            3AFF594139FF584038FF573F37FF63574FFF46362DFF000000130000000D4E3F
            35FF80746DFF6B5248FFF4ECE6FFE9DACEFFE9D8CDFFE9D8CCFFE9D8CBFFE8D7
            CAFFF3EAE2FFF3E9E2FF5A4139FF645850FF483A2FFF000000110000000B5142
            36FF827770FF70564DFFF9F5F2FFF4EAE4FFF1E6DEFFEBDCD2FFE9D9CCFF4E41
            3DFF60534CFFF3EAE3FF5D453CFF655951FF4C3D32FF0000000F000000095344
            39FF857A73FF755A50FFFAF6F3FFF5EDE7FFF4EDE6FFF4ECE6FFEFE2DAFF493D
            38FF5A4D46FFF4EBE4FF60483FFF655A52FF4F3F34FF0000000D000000075545
            3AFF887D76FF795E54FFFAF6F4FFF5EEE9FFF5EDE7FFF4EDE7FFF4ECE6FF473A
            36FF483D36FFE9D9CDFF644C43FF675A52FF514137FF0000000B000000065748
            3DFF898079FF7C6157FFFAF7F4FFFAF6F4FFFAF6F4FFFAF6F3FFFAF6F3FFFAF5
            F2FFF5EEE9FFF4ECE6FF695046FF82776FFF534439FF00000009000000034235
            2EC058493DFF7F645AFF998178FF967F75FF937A72FF8E786DFF8B7269FF866E
            64FF82695FFF7D645BFF6E544AFF56453BFF3F332BC200000005000000000000
            0002000000030000000400000004000000040000000400000005000000050000
            0005000000050000000500000006000000060000000400000001}
          OnClick = btnTRANSPORT_TIMESaveClick
          ExplicitLeft = 140
          ExplicitTop = 12
          ExplicitHeight = 32
        end
        object pnlTRANSPORT_TIME: TPanel
          Left = 2
          Top = 18
          Width = 112
          Height = 29
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          OnClick = pnlTRANSPORT_TIMEClick
          object lsTRANSPORT_TIME: TLabel
            Left = 49
            Top = 0
            Width = 7
            Height = 29
            Align = alLeft
            Caption = ':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitHeight = 23
          end
          object cbTRANSPORT_TIME_MM: TComboBox
            Left = 56
            Top = 0
            Width = 51
            Height = 24
            Align = alLeft
            ItemHeight = 16
            TabOrder = 0
            Items.Strings = (
              '00'
              '15'
              '30'
              '45')
          end
          object cbbTRANSPORT_TIME_HH: TComboBox
            Left = 0
            Top = 0
            Width = 49
            Height = 24
            Align = alLeft
            Enabled = False
            ItemHeight = 16
            TabOrder = 1
            Items.Strings = (
              '00'
              '01'
              '02'
              '03'
              '04'
              '05'
              '06'
              '07'
              '08'
              '09'
              '10'
              '11'
              '12'
              '13'
              '14'
              '15'
              '16'
              '17'
              '18'
              '19'
              '20'
              '21'
              '22'
              '23')
          end
        end
      end
      object chkIncludeOkom: TcxDBCheckBox
        Left = 440
        Top = 60
        Caption = 'Вкл в ОКОМ'
        DataBinding.DataField = 'is_included'
        DataBinding.DataSource = dsIncludedOkom
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        TabOrder = 27
        Width = 90
      end
      object btnVekselAdd: TButton
        Left = 451
        Top = 41
        Width = 75
        Height = 16
        Caption = 'Вексель'
        TabOrder = 28
        OnClick = btnVekselAddClick
      end
    end
    object Panel9: TAutoPanel
      Left = 2
      Top = 76
      Width = 1179
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      Visible = False
      AutoChildPosLeft = True
      AutoChildWidth = True
      DesignSize = (
        1179
        25)
      object RxLabel9: TcxLabel
        Left = 7
        Top = 3
        Caption = 'Через:'
        FocusControl = DK_C_NAME_CE
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object DK_C_NAME_CE: TcxDBButtonEdit
        Left = 173
        Top = 0
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'DK_C_NAME'
        DataBinding.DataSource = Source
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = DK_FROM_CEButtonClick
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = DK_TO_CEEnter
        Width = 1003
      end
      object DK_C_ED: TcxDBTextEdit
        Left = 72
        Top = 0
        DataBinding.DataField = 'DK_C'
        DataBinding.DataSource = Source
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 1
        Width = 97
      end
    end
    object Panel10: TPanel
      Left = 2
      Top = 209
      Width = 1179
      Height = 21
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 7
      DesignSize = (
        1179
        21)
      object RxLabel15: TcxLabel
        Left = 8
        Top = 0
        Caption = 'Номер грузовой таможенной декларации'
        FocusControl = DK_C_NAME_CE
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object RxDBComboEdit1: TcxDBButtonEdit
        Left = 272
        Top = 0
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataBinding.DataField = 'DG_DOCNUMBER'
        DataBinding.DataSource = Source
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = RxDBComboEdit1ButtonClick
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 1
        OnKeyDown = RxDBComboEdit1KeyDown
        Width = 903
      end
    end
    object pnlOffice: TAutoPanel
      Left = 2
      Top = 101
      Width = 1179
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object PanelDop: TPanel
        Left = 359
        Top = -2
        Width = 385
        Height = 25
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          385
          25)
        object Label24: TLabel
          Left = -42
          Top = 6
          Width = 36
          Height = 13
          Caption = 'Cклад:'
          Visible = False
        end
        object DBEdit5: TcxDBTextEdit
          Left = 15
          Top = 2
          DataBinding.DataField = 'BASEID'
          DataBinding.DataSource = Source
          Enabled = False
          Properties.ReadOnly = True
          StyleDisabled.Color = clInfoBk
          TabOrder = 0
          Visible = False
          Width = 59
        end
        object RxLabel12: TcxLabel
          Left = 261
          Top = 4
          Hint = 'Транспортные услуги'
          Anchors = [akTop, akRight]
          Caption = 'Тран.:'
          FocusControl = DK_FROM_CE
          ParentFont = False
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object smTrans: TcxCalcEdit
          Left = 309
          Top = 3
          TabStop = False
          Anchors = [akTop, akRight]
          AutoSize = False
          EditValue = 0
          Properties.DisplayFormat = ',0.00'
          Properties.ImmediatePost = True
          Properties.OnEditValueChanged = smTransChange
          TabOrder = 4
          Height = 21
          Width = 69
        end
        object cxLabelEgaisCode: TcxLabel
          Left = 80
          Top = 4
          Hint = 'Код дебитора в системе ЕГАИС'
          Caption = 'ТТ ФСРАР'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -10
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object cxDBTextEditEgaisCode: TcxDBTextEdit
          Left = 139
          Top = 2
          Hint = 'Код дебитора в системе ЕГАИС'
          DataBinding.DataField = 'EGAIS_KOD_DK'
          DataBinding.DataSource = Source
          Properties.ReadOnly = True
          TabOrder = 2
          Width = 116
        end
      end
      object PanelDopLeft: TPanel
        Left = 0
        Top = 0
        Width = 353
        Height = 25
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object MegaSelBrandCase2: TMegaSelBrandCase
          Left = 0
          Top = 0
          Width = 1
          Height = 25
          Orientation = mpHorizontal
          LeftComboPos = 0
          LabelCaption = 'Фокус-группа'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clBtnFace
          TabStop = True
          Align = alLeft
          Visible = False
          TabOrder = 0
          Database = DM.Money
          Transaction = Nakl_Transaction
          DataField = 'BRAND_CASE_ID'
          DataSource = Source
          DropDownWidth = 0
          Value = '0'
          ShowBrandCaseID = True
          ShowAll = True
          DesignSize = (
            1
            25)
        end
        object MegaSelContract1: TMegaSelContract
          Left = 1
          Top = 0
          Width = 352
          Height = 25
          Orientation = mpHorizontal
          LeftComboPos = 0
          LabelCaption = '&Договор'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clBtnFace
          TabStop = True
          Align = alLeft
          TabOrder = 1
          Database = DM.Money
          Transaction = DM.trMainRO
          DataField = 'CONTRACT_ID'
          DataSource = Source
          DropDownWidth = 0
          OnChange = MegaSelContract1Change
          DataFieldOperDate = 'OPERDATE'
          DataFieldBalanceKod = 'BALANCE_KOD'
          DesignSize = (
            352
            25)
        end
      end
      object smDBCustoms: TcxDBCalcEdit
        Left = 838
        Top = 2
        DataBinding.DataField = 'SUMMA_EXPORT'
        DataBinding.DataSource = Source
        Properties.DisplayFormat = ',0.00'
        TabOrder = 3
        Width = 115
      end
      object cxLabel2: TcxLabel
        Left = 755
        Top = 2
        Caption = 'Там. сто-сть'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object cxDBTEEgais: TcxDBTextEdit
        Left = 1039
        Top = 2
        DataBinding.DataField = 'EGAIS_FIX_NUM_STR'
        DataBinding.DataSource = Source
        Enabled = False
        TabOrder = 4
        Width = 121
      end
      object cxLblEgais: TcxLabel
        Left = 959
        Top = 2
        Caption = 'Рег.№ ЕГАИС'
      end
    end
    object pnKeytAddress: TPanel
      Left = 2
      Top = 230
      Width = 1179
      Height = 17
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 6
      object lblKeytAddress: TLabel
        Left = 8
        Top = 0
        Width = 176
        Height = 13
        Caption = 'Адрес доставки (кейт. компания):'
      end
    end
  end
  object Panel4: TAutoPanel
    Left = 0
    Top = 26
    Width = 1183
    Height = 43
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    AutoChildPosLeft = True
    AutoChildWidth = True
    DesignSize = (
      1183
      43)
    object Label2: TLabel
      Left = 5
      Top = 2
      Width = 83
      Height = 17
      AutoSize = False
      Caption = '&Дата операции'
      WordWrap = True
    end
    object Label6: TLabel
      Left = 102
      Top = 2
      Width = 129
      Height = 13
      AutoSize = False
      Caption = 'Операция по докумен&ту'
    end
    object lblCFOOtgr: TLabel
      Left = 235
      Top = -1
      Width = 284
      Height = 13
      Cursor = crHandPoint
      Hint = 'ЦФО отгрузки - щелкните мышкой для обновления'
      Caption = '< ЦФО отгрузки - щелкните мышкой для обновления >'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = lblCFOOtgrClick
    end
    object DBDateEdit1: TcxDBDateEdit
      Left = 4
      Top = 18
      DataBinding.DataField = 'OPERDATE'
      DataBinding.DataSource = Source
      ParentFont = False
      TabOrder = 0
      OnKeyDown = DBDateEdit1KeyDown
      Width = 93
    end
    object GrOper_CE: TcxDBButtonEdit
      Left = 103
      Top = 18
      DataBinding.DataField = 'GROUP_NAME'
      DataBinding.DataSource = Source
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = GrOper_CEButtonClick
      Properties.OnChange = GrOper_CEPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 1
      OnEnter = GrOper_CEEnter
      Width = 308
    end
    object Kod_OPER_CE: TcxDBButtonEdit
      Tag = 1
      Left = 417
      Top = 18
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'NAME_OPER'
      DataBinding.DataSource = Source
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = GrOper_CEButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 2
      OnEnter = GrOper_CEEnter
      Width = 761
    end
    object cxLabelSelfExport: TcxLabel
      Left = 564
      Top = 0
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
  end
  object Panel3: TAutoPanel
    Left = 0
    Top = 318
    Width = 1183
    Height = 343
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    AutoChildPosLeft = True
    AutoChildWidth = True
    object DBGridEH1: TDBGridEh
      Tag = 100
      Left = 2
      Top = 2
      Width = 1179
      Height = 339
      Align = alClient
      BorderStyle = bsNone
      DataSource = DocPosSource
      DynProps = <>
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterRowCount = 3
      FooterParams.Color = clInfoBk
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
      ParentFont = False
      PopupMenu = PopupMenu1
      RowSizingAllowed = True
      SumList.Active = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      TitleParams.VertLines = True
      OnDblClick = EditExecute
      OnDragDrop = DBGridEH1DragDrop
      OnDragOver = DBGridEH1DragOver
      OnDrawFooterCell = DBGridEH1DrawFotterCell
      OnEnter = DBGridEH1Enter
      OnGetCellParams = DBGridEH1GetCellParams
      OnSortMarkingChanged = DBGridEH1SortMarkingChanged
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOD_EAN'
          Footer.Font.Charset = RUSSIAN_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Title.Caption = 'Код ЕАН'
          Title.TitleButton = True
          Width = 84
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ARTICUL_PARTNER'
          Footers = <>
          Title.Caption = 'Артикул'
          Width = 80
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PDV'
          Footers = <>
          Title.Caption = 'Н Д С'
          Title.TitleButton = True
          Width = 11
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME_MATER'
          Footer.Font.Charset = RUSSIAN_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Title.Caption = 'Наименование'
          Title.TitleButton = True
          Width = 184
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ED_IZM'
          Footers = <>
          Title.Caption = 'Изм.'
          Title.TitleButton = True
          Width = 33
        end
        item
          CellButtons = <>
          DisplayFormat = ',0.##'
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOLICH'
          Footers = <>
          Title.Caption = 'Количество|ед.'
          Title.TitleButton = True
          Width = 61
        end
        item
          CellButtons = <>
          DisplayFormat = ',0.##'
          DynProps = <>
          EditButtons = <>
          FieldName = 'Boxcount'
          Footer.FieldName = 'Boxcount'
          Footers = <
            item
              FieldName = 'Boxcount'
              ValueType = fvtSum
            end>
          Title.Caption = 'Количество|ящ.'
          Title.TitleButton = True
          Width = 34
        end
        item
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'COL_CHECK_WITH'
          Footers = <>
          ReadOnly = True
          Title.Caption = 'Кол15'
          Title.TitleButton = True
          Title.Orientation = tohVertical
          Visible = False
          Width = 17
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'COL'
          Footers = <>
          Title.Caption = 'К'
          Title.TitleButton = True
          Visible = False
          Width = 17
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Price1_'
          Footers = <>
          Title.Caption = 'Цена'
          Title.TitleButton = True
          Width = 60
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Summa2'
          Footers = <>
          Title.Caption = 'Сумма'
          Title.TitleButton = True
          Width = 70
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Price_box'
          Footers = <>
          Title.Caption = 'Price for box'
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Price2_'
          Footers = <>
          Title.Caption = 'Цена'
          Title.TitleButton = True
          Width = 47
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Summa3'
          Footers = <>
          Title.Caption = 'Сумма'
          Title.TitleButton = True
          Width = 81
        end
        item
          CellButtons = <>
          DisplayFormat = ',0.0000'
          DynProps = <>
          EditButtons = <>
          FieldName = 'PRICEWPDV'
          Footers = <>
          Title.Caption = 'Цена с НДС'
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DisplayFormat = ',0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'SUMMAWPDV'
          Footers = <>
          Title.Caption = 'Сумма с НДС'
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EXCISE'
          Footers = <>
          Title.Caption = 'Ставка акциза'
          Title.TitleButton = True
          Width = 82
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EXCISE_SUM'
          Footer.DisplayFormat = ',0.00'
          Footers = <
            item
              FieldName = 'EXCISE_SUM'
              ValueType = fvtSum
            end>
          Title.Caption = 'Сумма акциза'
          Title.TitleButton = True
          Width = 80
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'LOCAL_KOD'
          Footers = <>
          Title.Caption = 'Локальный код'
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'IND_SUMMA'
          Footers = <>
          Title.Caption = 'Нач.Сумма'
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'OptPrice'
          Footers = <>
          Title.Caption = 'Цена с НДС (Опт)'
          Title.TitleButton = True
          Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RealPrice'
          Footers = <>
          Title.Caption = 'Цена с НДС*'
          Title.TitleButton = True
          Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'INVOCE_NUMBER'
          Footers = <>
          Title.Caption = 'Номер инвойса'
          Width = 94
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_ROZLIVA'
          Footers = <>
          Title.Caption = 'Дата розлива'
          Title.TitleButton = True
          Width = 98
        end
        item
          CellButtons = <>
          DisplayFormat = ',0.0000'
          DynProps = <>
          EditButtons = <>
          FieldName = 'SKIDKA_WITH_PDV'
          Footers = <>
          Title.Caption = 'Скидка с учетом НДС'
        end
        item
          CellButtons = <>
          DisplayFormat = ',0.0000'
          DynProps = <>
          EditButtons = <>
          FieldName = 'PRICE_PREV'
          Footers = <>
          Title.Caption = 'Начальная'#13#10'цена'
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'GROUP_NAME'
          Footers = <>
          Title.Caption = 'Бренд'
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SPRAV_MATER_CATEGORY_NAME'
          Footers = <>
          Title.Caption = 'категория ценности'
          Width = 69
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'GDOCUMENT'
          Footers = <>
          Title.Caption = 'Номер грузовой таможенной декларации'
          Visible = False
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 1183
    Height = 26
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 4
    object ToolBar1: TToolBar
      Left = 11
      Top = 2
      Width = 447
      Height = 22
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = DM.ImageList1
      TabOrder = 0
      object ToolButton10: TToolButton
        Left = 0
        Top = 0
        Action = Edit
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Action = CloseForm
      end
      object ToolButton3: TToolButton
        Left = 46
        Top = 0
        Hint = 'Создание документов|Создание документов'
        Caption = 'ToolButton3'
        DropdownMenu = CreatePopup
        ImageIndex = 16
        PopupMenu = CreatePopup
      end
      object ToolButton4: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 77
        Top = 0
        Hint = 'Печать|Печать'
        Caption = 'ToolButton7'
        DropdownMenu = pmPrint
        ImageIndex = 4
      end
      object ToolButton6: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 29
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 108
        Top = 0
        Action = actShowLinkedDocs
      end
      object ToolButton11: TToolButton
        Left = 131
        Top = 0
        Hint = 'Показать связи|Показать связи'
        Caption = 'ToolButton11'
        DropdownMenu = pmLink
        ImageIndex = 12
      end
      object ToolButton1: TToolButton
        Left = 154
        Top = 0
        Action = aSetDocExistsInOffice
      end
      object ToolButton12: TToolButton
        Left = 177
        Top = 0
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 15
        Style = tbsSeparator
      end
      object tbtnSendToRegion: TToolButton
        Left = 185
        Top = 0
        Action = aSendToRegion
      end
      object ToolButton13: TToolButton
        Left = 208
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 42
        Style = tbsSeparator
      end
      object tbVozvr: TToolButton
        Left = 216
        Top = 0
        Hint = 'Создание возвратов из шаблона'
        Caption = 'tbVozvr'
        ImageIndex = 48
        OnClick = tbVozvrClick
      end
      object tbVozvrChP: TToolButton
        Left = 239
        Top = 0
        Hint = 'Создание возвратов ЧП'
        Caption = 'tbVozvrChP'
        ImageIndex = 49
        OnClick = tbVozvrChPClick
      end
      object ToolButton14: TToolButton
        Left = 262
        Top = 0
        Width = 8
        Caption = 'ToolButton14'
        ImageIndex = 50
        Style = tbsSeparator
      end
      object ToolButton15: TToolButton
        Left = 270
        Top = 0
        Action = actSelLinkDOc
      end
      object ToolButton16: TToolButton
        Left = 293
        Top = 0
        Hint = 'Внести пометку о договоре аренды'
        Action = aSetOFDogovor
      end
      object tbSendNakl: TToolButton
        Left = 316
        Top = 0
        Action = aSendNaklToOffice
        ImageIndex = 44
      end
      object tbAkcis: TToolButton
        Left = 339
        Top = 0
        Hint = 'Сумма акцизного сбора'
        Caption = 'tbAkcis'
        ImageIndex = 18
        OnClick = tbAkcisClick
      end
      object tbSelfExport: TToolButton
        Left = 362
        Top = 0
        Action = actSelfExport
        ImageIndex = 52
      end
      object ToolButton17: TToolButton
        Left = 385
        Top = 0
        Width = 8
        Caption = 'ToolButton17'
        ImageIndex = 53
        Style = tbsSeparator
      end
      object btnNakl2Egais: TToolButton
        Left = 393
        Top = 0
        Action = actUpdateNakl2Egais
        ImageIndex = 53
      end
      object ToolButton19: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton19'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object ToolButton18: TToolButton
        Left = 424
        Top = 0
        Action = actSplitNaklPosByParty
      end
    end
    object ToolBar2: TToolBar
      Left = 471
      Top = 2
      Width = 595
      Height = 22
      ButtonHeight = 27
      Caption = 'ToolBar2'
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = DM.ImageList1
      TabOrder = 1
      Wrapable = False
      object btTransit: TToolButton
        Left = 0
        Top = 0
        Action = aTransit
        AllowAllUp = True
        Grouped = True
        Style = tbsCheck
      end
      object ToolButton8: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 32
        Style = tbsSeparator
      end
      object ToolButton9: TToolButton
        Left = 31
        Top = 0
        Hint = 'Статус согласования'
        Caption = 'ToolButton9'
        ImageIndex = 43
      end
      object MegaSelCFO: TMegaSelCFO
        Left = 54
        Top = 0
        Width = 167
        Height = 27
        Orientation = mpHorizontal
        LeftComboPos = 0
        LabelCaption = '&ЦФО'
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
        Transaction = Nakl_Transaction
        DataField = 'CFO'
        DataSource = Source
        DropDownWidth = 0
        DisableForRegions = False
        OnlySubordinateCFO = False
        ShowAllCFO = False
        DesignSize = (
          167
          27)
      end
      object btnStartBP: TToolButton
        Left = 221
        Top = 0
        Caption = 'btnStartBP'
        DropdownMenu = pmBP
        ImageIndex = 54
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
      end
      object tbOrderSklad: TToolButton
        Left = 259
        Top = 0
        Hint = 'Наряд на погрузку\разгрузку'
        DropdownMenu = pmOrder
        ImageIndex = 71
        Style = tbsDropDown
      end
      object btnReturnCause: TToolButton
        Left = 297
        Top = 0
        Hint = 'Причина возврата|Причина возврата'
        Caption = 'Причина возврата'
        ImageIndex = 50
        OnClick = btnReturnCauseClick
      end
      object ToolButton20: TToolButton
        Left = 320
        Top = 0
        Action = actAllowNotCheckForNewTT
        ImageIndex = 67
      end
      object tbSertificat: TToolButton
        Left = 343
        Top = 0
        Hint = 'Привязать сертификат к позиции'
        Caption = 'Привязать сертификат к позиции'
        ImageIndex = 59
        OnClick = tbSertificatClick
      end
      object ToolButton21: TToolButton
        Left = 366
        Top = 0
        Hint = 'Пометить как базовую'
        DropdownMenu = pmTypeAkc
        ImageIndex = 60
        Style = tbsDropDown
      end
      object ToolButton23: TToolButton
        Left = 404
        Top = 0
        Hint = 
          'Создаются акционные накалдные по данному документу в случае если' +
          ' они не были созданны. Накладная создается в следующем числе от ' +
          'текущего'
        Action = actCreateNaklAkcii
        ImageIndex = 62
      end
      object ToolButton22: TToolButton
        Left = 427
        Top = 0
        Caption = 'Обновление отсрочек по акциям'
        ImageIndex = 13
        OnClick = ToolButton22Click
      end
      object btnStorageIn: TToolButton
        Left = 450
        Top = 0
        Hint = 'Распределить ценности по ячейкам'
        Caption = 'btnStorageIn'
        ImageIndex = 78
        Visible = False
        OnClick = btnStorageInClick
      end
      object btnStorageOut: TToolButton
        Left = 473
        Top = 0
        Hint = 'Выбрать ценности из ячеек'
        Caption = 'btnStorageOut'
        ImageIndex = 79
        OnClick = btnStorageOutClick
      end
      object ToolButton24: TToolButton
        Left = 496
        Top = 0
        Action = ActDocListLocate
      end
      object ToolButton25: TToolButton
        Left = 519
        Top = 0
        Caption = 'ToolButton25'
        ImageIndex = 70
      end
      object ToolButton26: TToolButton
        Left = 542
        Top = 0
        Hint = 'Экспорт в WMS накладных из сортировки'
        Caption = 'Экспорт в WMS накладных из сортировки'
        DropdownMenu = pmWMS
        ImageIndex = 66
      end
    end
  end
  object Nakl_Transaction: TMegaTransaction
    DefaultDatabase = DM.Money
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    BeforeEnd = Nakl_TransactionBeforeEnd
    AfterEnd = Nakl_TransactionAfterEnd
    TPBMode = tpbDefault
    Left = 89
    Top = 392
  end
  object Source: TDataSource
    DataSet = DocNakl
    Left = 96
    Top = 328
  end
  object DocPosSource: TDataSource
    DataSet = DocPos
    Left = 292
    Top = 296
  end
  object Sum: TMegaDataSet
    SelectSQL.Strings = (
      'select'
      
        '  doc_nakl.kolich_ SUM1, doc_nakl.summa SUM2, doc_nakl.summa1 SU' +
        'M3,'
      '  PDV.RESULT PDV_SUMMA,'
      '  INDIKATIV.SUMMA INDIKAT'
      'from doc_nakl '
      'left join PDV(:RECID, :BASEID, doc_nakl.v1,:DOCTYPE) on (1=1)'
      
        'left join INDIKATIV(:RECID, :BASEID, doc_nakl.v1,:DOCTYPE) on (1' +
        '=1)'
      'where RECID = :RECID and BASEID = :BASEID')
    BeforeOpen = SumBeforeOpen
    OnCalcFields = SumCalcFields
    Transaction = Nakl_Transaction
    Database = DM.Money
    DefaultFormats.NumericEditFormat = '0'
    Left = 664
    Top = 348
    object SUM1: TFloatField
      FieldName = 'SUM1'
      DisplayFormat = ',0.00'
    end
    object SUM2: TFloatField
      FieldName = 'SUM2'
      DisplayFormat = ',0.00'
    end
    object SUM3: TFloatField
      FieldName = 'SUM3'
      DisplayFormat = ',0.00'
    end
    object SumPDV_SUMMA: TFloatField
      FieldName = 'PDV_SUMMA'
      DisplayFormat = ',0.00'
    end
    object SumPDV_SUMMA_: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PDV_SUMMA_'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object SumSUMMARY: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUMMARY'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object SumINDIKATIV: TFloatField
      FieldName = 'INDIKAT'
    end
    object SumIS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IS'
      Calculated = True
    end
  end
  object Query: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    Left = 476
    Top = 328
  end
  object ActionList1: TActionList
    Images = DM.ImageList1
    Left = 236
    Top = 68
    object Insert: TAction
      Caption = '&Добавить позицию ...'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = InsertExecute
      OnUpdate = InsertUpdate
      Left = 12345
    end
    object Edit: TAction
      Caption = '&Позиция...'
      Hint = 'Редактирование позиции|Редактирование позиции'
      ImageIndex = 2
      ShortCut = 13
      OnExecute = EditExecute
      OnUpdate = EditUpdate
      Left = 12345
    end
    object PrintNaklWithVozvrat: TAction
      Category = 'Печать'
      Caption = 'Печать накладной с учетом возвратов'
      ImageIndex = 4
      OnExecute = PrintNaklExecute
      OnUpdate = PrintNaklUpdate
      Left = 12345
    end
    object Delete: TAction
      Caption = '&Удалить позицию'
      ImageIndex = 8
      ShortCut = 16430
      OnExecute = DeleteExecute
      OnUpdate = EditUpdate
      Left = 12345
    end
    object CloseForm: TAction
      Caption = '&Сохранить'
      Hint = 'Сохранить документ|Сохранить документ и закрыть'
      ImageIndex = 33
      OnExecute = CloseFormExecute
      Left = 12345
    end
    object CreatePDVN_D2: TAction
      Category = 'Создание документа'
      Caption = 'Создать/открыть корректировку к налоговой накладной на продажу'
      ImageIndex = 16
      OnExecute = CreatePDVN_D2Execute
      OnUpdate = CreateDocUpdate
      Left = 12345
    end
    object Copy: TAction
      Caption = '&Копировать'
      Hint = 'Копирование документа'
      ImageIndex = 20
      ShortCut = 116
      Left = 12345
    end
    object ACatalog: TAction
      Caption = '&Справочник'
      Hint = 'Ввод через открытый справочник ...'
      ImageIndex = 22
      ShortCut = 114
      OnExecute = ACatalogExecute
      OnUpdate = InsertUpdate
      Left = 12345
    end
    object Print: TAction
      Category = 'Печать'
      Caption = '&Печать'
      Hint = 'Печать документа'
      ImageIndex = 4
      ShortCut = 16464
      OnExecute = PrintExecute
      Left = 12345
    end
    object printNaclOF: TAction
      Category = 'Печать'
      Caption = 'Печать накл. для Смольянинова'
      ImageIndex = 4
      OnExecute = printNaclOFExecute
      OnUpdate = printNaclOFUpdate
      Left = 12345
    end
    object actPrintSpecInvoiceUKR: TAction
      Category = 'Печать ВЭД'
      Caption = 'Друк специфікації/інвойсу Укр'
      OnExecute = actPrintSpecInvoiceUKRExecute
      OnUpdate = actPrintSpecInvoiceUpdate
      Left = 12345
    end
    object CreateDoc: TAction
      Caption = 'Создать...'
      ImageIndex = 16
      ShortCut = 117
      OnExecute = CreateDocExecute
      OnUpdate = CreateDocUpdate
      Left = 12345
    end
    object CreatePDVNakl: TAction
      Category = 'Создание документа'
      Caption = 'Создать/открыть налоговую накладную на продажу'
      ImageIndex = 16
      OnExecute = CreatePDVNaklExecute
      OnUpdate = CreateDocUpdate
      Left = 12345
    end
    object SeparateNakl: TAction
      Category = 'Создание документа'
      Caption = 'Разбить накладную'
      Hint = 'Разбить накладную по нескольким складам'
      ImageIndex = 6
      OnExecute = SeparateNaklExecute
      Left = 12345
    end
    object Check: TAction
      Caption = 'Корректность'
      Hint = 
        'Проверка корректности списания ценностей'#13#10'в многопользовательско' +
        'й среде'
      ShortCut = 16496
      OnExecute = CheckExecute
      Left = 12345
    end
    object PrintNakl: TAction
      Category = 'Печать'
      Caption = 'Печать накладной'
      ImageIndex = 4
      OnExecute = PrintNaklExecute
      OnUpdate = PrintNaklUpdate
      Left = 12345
    end
    object PrintNaklTMC: TAction
      Category = 'Печать'
      Caption = 'Бланк накладной ТМЦ'
      ImageIndex = 4
      OnExecute = PrintNaklTMCExecute
      OnUpdate = PrintNaklUpdate
      Left = 12345
    end
    object PrintInternal: TAction
      Category = 'Печать'
      Caption = 'Печать внутреннего документа'
      ImageIndex = 4
      OnExecute = PrintInternalExecute
      OnUpdate = PrintInternalUpdate
      Left = 12345
    end
    object PrintSchet: TAction
      Category = 'Печать'
      Caption = 'Счет'
      ImageIndex = 4
      OnExecute = PrintSchetExecute
      Left = 12345
    end
    object FillRests: TAction
      Caption = 'Остатки'
      ShortCut = 115
      OnExecute = FillRestsExecute
      Left = 12345
    end
    object PrintRetNakl: TAction
      Category = 'Печать'
      Caption = 'Накладная на возврат'
      ImageIndex = 4
      OnExecute = PrintRetNaklExecute
      Left = 12345
    end
    object PrintAct: TAction
      Category = 'Печать'
      Caption = 'Приемный акт'
      ImageIndex = 4
      OnExecute = PrintActExecute
      Left = 12345
    end
    object PrintCopy: TAction
      Category = 'Печать'
      Caption = 'Печать копии'
      ImageIndex = 4
      OnExecute = PrintCopyExecute
      OnUpdate = PrintCopyUpdate
      Left = 12345
    end
    object CopyPos: TAction
      Caption = 'Копировать позиции'
      Hint = 'Копировать позиции в буффер'
      ImageIndex = 20
      OnExecute = CopyPosExecute
      Left = 12345
    end
    object PastePos: TAction
      Caption = 'Вставить позиции из буфера'
      Hint = 'Вставить позиции из буфера'
      ImageIndex = 26
      OnExecute = PastePosExecute
      Left = 12345
    end
    object ViewDocProv: TAction
      Caption = 'Проводки по документу'
      ImageIndex = 6
      ShortCut = 32882
      OnExecute = ViewDocProvExecute
      Left = 12345
    end
    object PriceLabels: TAction
      Caption = 'Ценники'
      ShortCut = 16471
      OnExecute = PriceLabelsExecute
      OnUpdate = PriceLabelsUpdate
      Left = 12345
    end
    object PriceList: TAction
      Caption = 'Прайс-лист'
      OnExecute = PriceListExecute
      Left = 12345
    end
    object MakeLgeDoc: TAction
      Caption = 'Документы на провоз'
      Left = 12345
    end
    object MakeDoc: TAction
      Category = 'Создание документа'
      Caption = 'Создать накладную ...'
      OnExecute = MakeDocExecute
      Left = 12345
    end
    object Order1: TAction
      Caption = 'Order1'
      ShortCut = 16497
      OnExecute = Order1Execute
      Left = 12345
    end
    object Order2: TAction
      Caption = 'Order2'
      ShortCut = 113
      OnExecute = Order2Execute
      Left = 12345
    end
    object Prib: TAction
      Caption = 'Prib'
      ShortCut = 16452
      OnExecute = PribExecute
      Left = 12345
    end
    object PrintDolg: TAction
      Category = 'Печать'
      Caption = 'Отплаченный долг'
      ImageIndex = 4
      OnExecute = PrintDolgExecute
      Left = 12345
    end
    object UntitledDoc: TAction
      Category = 'Печать'
      Caption = 'Безреквизитный'
      ImageIndex = 4
      OnExecute = UntitledDocExecute
      Left = 12345
    end
    object SetNacenka: TAction
      Caption = 'SetNacenka'
      ShortCut = 16462
      OnExecute = SetNacenkaExecute
      Left = 12345
    end
    object CheckPrn: TAction
      Caption = 'CheckPrn'
      ShortCut = 16453
      OnExecute = CheckPrnExecute
      Left = 12345
    end
    object CheckPrnPos: TAction
      Caption = 'CheckPrnPos'
      OnExecute = CheckPrnPosExecute
      Left = 12345
    end
    object Sep: TAction
      Caption = 'Sep'
      ShortCut = 16466
      OnExecute = SepExecute
      Left = 12345
    end
    object CopyPosH: TAction
      Caption = 'CopyPosH'
      ShortCut = 49219
      OnExecute = CopyPosHExecute
      Left = 12345
    end
    object PastePosH: TAction
      Caption = 'PastePosH'
      ShortCut = 49238
      OnExecute = PastePosHExecute
      Left = 12345
    end
    object AA: TAction
      Caption = 'AA'
      ShortCut = 49217
      OnExecute = AAExecute
      Left = 12345
    end
    object NotOtsr: TAction
      Caption = 'NotOtsr'
      ShortCut = 16463
      OnExecute = NotOtsrExecute
      Left = 12345
    end
    object aSetka: TAction
      Caption = 'aSetka'
      ShortCut = 16467
      OnExecute = aSetkaExecute
      Left = 12345
    end
    object aSetNacInd: TAction
      Caption = 'aSetNacInd'
      ShortCut = 16457
      OnExecute = aSetNacIndExecute
      Left = 12345
    end
    object aShowBaseid: TAction
      Caption = 'aShowBaseid'
      ShortCut = 16450
      OnExecute = aShowBaseidExecute
      Left = 12345
    end
    object aShowRealPrice: TAction
      Caption = 'Показать реальную цену'
      ShortCut = 49234
      OnExecute = aShowRealPriceExecute
      Left = 12345
    end
    object aShowOptPrice: TAction
      Caption = 'Показать оптовую цену'
      ShortCut = 49231
      OnExecute = aShowOptPriceExecute
      Left = 12345
    end
    object aDnac: TAction
      Caption = 'aDnac'
      ShortCut = 49230
      OnExecute = aDnacExecute
      Left = 12345
    end
    object aF1F2: TAction
      Caption = 'Разбить по формам'
      ShortCut = 16454
      OnExecute = aF1F2Execute
      Left = 12345
    end
    object aCpProtokol: TAction
      Caption = 'aCpProtokol'
      ShortCut = 49272
      OnExecute = aCpProtokolExecute
      Left = 12345
    end
    object aViewSysProtokol: TAction
      Caption = 'aViewSysProtokol'
      ShortCut = 120
      OnExecute = aViewSysProtokolExecute
      Left = 12345
    end
    object aPrintProver: TAction
      Caption = 'Печать проверочного документа'
      OnExecute = aPrintProverExecute
      Left = 12345
    end
    object aShowRetPos: TAction
      Caption = 'Дополнить выбор...'
      Hint = 'Редактирование возвратов'
      ImageIndex = 28
      ShortCut = 49235
      OnExecute = aShowRetPosExecute
      Left = 12345
    end
    object aBrands: TAction
      Caption = 'Непредставленные бренды'
      ShortCut = 121
      OnExecute = aBrandsExecute
      Left = 12345
    end
    object aSetNacRound: TAction
      Caption = 'aSetNacRound'
      ShortCut = 32846
      OnExecute = aSetNacRoundExecute
      Left = 12345
    end
    object aTakeAcc: TAction
      Caption = 'Забрать права'
      ShortCut = 16469
      OnExecute = aTakeAccExecute
      Left = 12345
    end
    object aG: TAction
      Caption = 'aG'
      ShortCut = 16455
      OnExecute = aGExecute
      Left = 12345
    end
    object actCreateOplDoc: TAction
      Category = 'Создание документа'
      Caption = 'Создание оплат и возврата'
      Hint = '|Создание оплатного/возвратного документа'
      OnExecute = actCreateOplDocExecute
      Left = 12345
    end
    object actShowLinkedDocs: TAction
      Caption = 'Показать связанные документы'
      Hint = 'Показать связанные документы|Показать связанные документы'
      ImageIndex = 28
      OnExecute = actShowLinkedDocsExecute
      Left = 12345
    end
    object areg_rest: TAction
      Caption = 'reg_rest'
      ShortCut = 49228
      OnExecute = areg_restExecute
      Left = 12345
    end
    object aCreateOplDocNoPos: TAction
      Category = 'Создание документа'
      Caption = 'Создание оплат и возврата (без позиций)'
      OnExecute = aCreateOplDocNoPosExecute
      Left = 12345
    end
    object aTransit: TAction
      Caption = 'Транзит'
      Hint = 'Транзитная накладная'
      ImageIndex = 46
      OnExecute = aTransitExecute
      Left = 12345
    end
    object actShowIndColor1: TAction
      Caption = 'actShowIndColor1'
      ShortCut = 16433
      OnExecute = actShowIndColor1Execute
      Left = 12345
    end
    object actFindTTN: TAction
      Category = 'Вспомогательное'
      Caption = 'Найти Товарно-транспортную накладную'
      Hint = 
        'Найти Товарно-транспортную накладную|Найти Товарно-транспортную ' +
        'накладную в которую включена данная накладная'
      ImageIndex = 45
      OnExecute = actFindTTNExecute
      Left = 12345
    end
    object aSendENakl: TAction
      Category = 'Электронная накладная'
      Caption = 'Создание электронной накладной'
      OnExecute = aSendENaklExecute
      Left = 12345
    end
    object actFindSortingParty: TAction
      Category = 'Вспомогательное'
      Caption = 'Найти сортировочную партию'
      Hint = 
        'Найти сортировочную партию|Найти сортировочную партию в которую ' +
        'включена данная накладная'
      OnExecute = actFindSortingPartyExecute
      Left = 12345
    end
    object PrintRecPrice: TAction
      Category = 'Печать'
      Caption = 'Печать рекомендованных цен'
      ImageIndex = 4
      OnExecute = PrintRecPriceExecute
      Left = 12345
    end
    object aSendToRegion: TAction
      Caption = 'Отправить в регион'
      Hint = 'Отправить в регион'
      ImageIndex = 41
      OnExecute = aSendToRegionExecute
      OnUpdate = aSendToRegionUpdate
      Left = 12345
    end
    object aCreatePDVIncDoc: TAction
      Category = 'Создание документа'
      Caption = 'Создать/открыть налоговую накладную на приобретение'
      ShortCut = 49225
      OnExecute = aCreatePDVIncDocExecute
      OnUpdate = aCreatePDVIncDocUpdate
      Left = 12345
    end
    object aCreatePDVIncKorDoc: TAction
      Category = 'Создание документа'
      Caption = 
        'Создать/открыть корректировку к налоговой накладной на приобрете' +
        'ние'
      OnExecute = aCreatePDVIncKorDocExecute
      OnUpdate = aCreatePDVIncDocUpdate
      Left = 12345
    end
    object aSetDocExistsInOffice: TAction
      Category = 'Вспомогательное'
      Caption = 'aSetDocExistsInOffice'
      OnExecute = aSetDocExistsInOfficeExecute
      Left = 12345
    end
    object PrintActSpisan: TAction
      Category = 'Печать'
      Caption = 'Акт списания основных фондов'
      ImageIndex = 4
      OnExecute = PrintActSpisanExecute
      OnUpdate = printNaclOFUpdate
      Left = 12345
    end
    object actPrintTTN: TAction
      Category = 'Печать'
      Caption = 'Печать транспортной накладной'
      Hint = 'Печать транспортной накладной|Печать транспортной накладной'
      ImageIndex = 4
      OnExecute = actPrintTTNExecute
      Left = 12345
    end
    object FillShowCase: TAction
      Caption = 'FillShowCase'
      ShortCut = 16434
      OnExecute = FillShowCaseExecute
      Left = 12345
    end
    object PrintIntNakl: TAction
      Caption = 'Печать накладной на внутреннее перемещение'
      ImageIndex = 4
      OnExecute = PrintIntNaklExecute
      Left = 12345
    end
    object actNote: TAction
      Category = 'Печать'
      Caption = 'Письма'
      ImageIndex = 4
      OnExecute = actNoteExecute
      Left = 12345
    end
    object actTransfer: TAction
      Category = 'Печать'
      Caption = 'Акт приемки-передачи'
      Hint = 'Акт приемки-передачи|Акт приемки-передачи'
      ImageIndex = 4
      OnExecute = actTransferExecute
      Left = 12345
    end
    object actPrintGift: TAction
      Category = 'Печать'
      Caption = 'Акт передачи'
      Hint = 'Акт передачи|Акт передачи'
      ImageIndex = 4
      OnExecute = actPrintGiftExecute
      Left = 12345
    end
    object actPrintSpravB: TAction
      Category = 'Печать'
      Caption = 'Печать справки к ТТН (раздел Б)'
      OnExecute = actPrintSpravBExecute
      Left = 12345
    end
    object actPrintTorg15: TAction
      Category = 'Печать'
      Caption = 'Акт о порче, бое,ломе... (Торг-15)'
      ImageIndex = 4
      OnExecute = actPrintTorg15Execute
      Left = 12345
    end
    object actPrintTorg16: TAction
      Category = 'Печать'
      Caption = 'Акт о списании (Торг-16)'
      ImageIndex = 4
      OnExecute = actPrintTorg16Execute
      Left = 12345
    end
    object actPrintRbToTTN: TAction
      Category = 'Печать'
      Caption = 'Печать справки к ТТН (бывший раздел Б)'
      ImageIndex = 4
      OnExecute = actPrintRbToTTNExecute
      Left = 12345
    end
    object actSelLinkDOc: TAction
      Caption = 'Показать связанные документы'
      Hint = 'Показать связанные документы'
      ImageIndex = 51
      ShortCut = 32844
      OnExecute = actSelLinkDOcExecute
      Left = 12345
    end
    object actPrintSoprDToTN: TAction
      Category = 'Печать'
      Caption = 'Печать сопроводительного документа к ТН'
      ImageIndex = 4
      OnExecute = actPrintSoprDToTNExecute
      Left = 12345
    end
    object actPrintSchetR: TAction
      Category = 'Печать'
      Caption = 'Счет на оплату'
      ImageIndex = 4
      OnExecute = actPrintSchetRExecute
      Left = 12345
    end
    object actPrintTorg13: TAction
      Category = 'Печать'
      Caption = 'Накладная на внутренние ... (Торг-13)'
      ImageIndex = 4
      OnExecute = actPrintTorg13Execute
      Left = 12345
    end
    object actPrintMx3: TAction
      Category = 'Печать'
      Caption = 'Акт о возврате сданного на хранение (МХ-3)'
      ImageIndex = 4
      OnExecute = actPrintMx3Execute
      Left = 12345
    end
    object actPrintM11: TAction
      Category = 'Печать'
      Caption = 'Требование-накладная (М-11)'
      ImageIndex = 4
      OnExecute = actPrintM11Execute
      Left = 12345
    end
    object actPrintM4: TAction
      Category = 'Печать'
      Caption = 'Приходный ордер (М-4)'
      ImageIndex = 4
      OnExecute = actPrintM4Execute
      Left = 12345
    end
    object aSetKolPrecent: TAction
      Caption = 'Изменить кол-во на %'
      ShortCut = 49227
      OnExecute = aSetKolPrecentExecute
      Left = 12345
    end
    object actPrintOC1: TAction
      Category = 'Печать'
      Caption = 'Акт о приеме-передаче осн.средств(ОС-1) '
      OnExecute = actPrintOC1Execute
      Left = 12345
    end
    object actPrintOC2: TAction
      Category = 'Печать'
      Caption = 'Накладная на внутр.перемещение осн.фондов(ОС-2)'
      OnExecute = actPrintOC2Execute
      Left = 12345
    end
    object actPrintOC4: TAction
      Category = 'Печать'
      Caption = 'Акт о списании осн.средств(ОС-4)'
      OnExecute = actPrintOC4Execute
      Left = 12345
    end
    object actPrintOC4a: TAction
      Category = 'Печать'
      Caption = 'Акт о списании атотранспортных средств (ОС-4а)'
      OnExecute = actPrintOC4aExecute
      Left = 12345
    end
    object actPrintMB7: TAction
      Category = 'Печать'
      Caption = 'Ведомость учета выдачи спецодежды, .. (МБ-7)'
      OnExecute = actPrintMB7Execute
      Left = 12345
    end
    object actPercentNakl: TAction
      Caption = 'actPercentNakl'
      ShortCut = 49222
      OnExecute = actPercentNaklExecute
      Left = 12345
    end
    object aSetPriceColExecute: TAction
      Category = 'Вспомогательное'
      Caption = 'Проставить цены по колонке'
      ShortCut = 49232
      OnExecute = aSetPriceColExecuteExecute
      OnUpdate = aSetPriceColExecuteUpdate
      Left = 12345
    end
    object actPrintMx1: TAction
      Category = 'Печать'
      Caption = 'Акт о приеме-передаче ТМЦ (МХ-1)'
      ImageIndex = 4
      OnExecute = actPrintMx1Execute
      Left = 12345
    end
    object actSticker: TAction
      Category = 'Вспомогательное'
      Caption = 'Стикер'
      OnExecute = actStickerExecute
      Left = 12345
    end
    object actPrintActR: TAction
      Category = 'Печать'
      Caption = 'Акт о выполненных работах (услугах)'
      ImageIndex = 4
      OnExecute = actPrintActRExecute
      Left = 12345
    end
    object actPrintBreak: TAction
      Category = 'Печать'
      Caption = 'Акт боя от поставщика'
      OnExecute = actPrintBreakExecute
      OnUpdate = actPrintBreakUpdate
      Left = 12345
    end
    object actGetID: TAction
      Caption = 'actGetID'
      ShortCut = 49223
      OnExecute = actGetIDExecute
      Left = 12345
    end
    object aktSubRent: TAction
      Category = 'Печать'
      Caption = 'Договор субаренды'
      ImageIndex = 4
      OnExecute = aktSubRentExecute
      Left = 12345
    end
    object actSubRent_List: TAction
      Category = 'Печать'
      Caption = 'Акт приёма-передачи имущества'
      ImageIndex = 4
      OnExecute = actSubRent_ListExecute
      OnUpdate = actSubRent_ListUpdate
      Left = 12345
    end
    object actNaklPosSplit: TAction
      Caption = 'Разбить позицию'
      Hint = 'Разбить позицию|Разбить позицию'
      ShortCut = 49236
      OnExecute = actNaklPosSplitExecute
      OnUpdate = actNaklPosSplitUpdate
      Left = 12345
    end
    object aSetOFDogovor: TAction
      Category = 'Вспомогательное'
      Caption = 'Договор подписан'
      ImageIndex = 48
      OnExecute = aSetOFDogovorExecute
      OnUpdate = aSetOFDogovorUpdate
      Left = 12345
    end
    object actCheckNext: TAction
      Caption = 'actCheckNext'
      ShortCut = 24688
      OnExecute = actCheckNextExecute
      Left = 12345
    end
    object actPrintDogovor: TAction
      Category = 'Печать'
      Caption = 'Договор поручительства'
      OnExecute = actPrintDogovorExecute
      Left = 12345
    end
    object actPrintActSpisanNew: TAction
      Category = 'Печать'
      Caption = 'Акт списания основных фондов (новый)'
      OnExecute = actPrintActSpisanNewExecute
      OnUpdate = printNaclOFUpdate
      Left = 12345
    end
    object actPrintSpec: TAction
      Category = 'Печать ВЭД'
      Caption = 'Печать спецификации'
      OnExecute = actPrintSpecExecute
      OnUpdate = actPrintSpecUpdate
      Left = 12345
    end
    object actPrintInvoiceP: TAction
      Category = 'Печать ВЭД'
      Caption = 'Проформа-Инвойс'
      OnExecute = actPrintInvoicePExecute
      OnUpdate = actPrintInvoicePUpdate
      Left = 12345
    end
    object actPrintInvoice: TAction
      Category = 'Печать ВЭД'
      Caption = 'Инвойс - отгрузка'
      OnExecute = actPrintInvoiceExecute
      OnUpdate = actPrintInvoiceUpdate
      Left = 12345
    end
    object actPrintInvoicePP: TAction
      Category = 'Печать ВЭД'
      Caption = 'Инвойс - предоплата'
      OnExecute = actPrintInvoicePPExecute
      OnUpdate = actPrintInvoiceUpdate
      Left = 12345
    end
    object actPrintPackList: TAction
      Category = 'Печать'
      Caption = 'Упаковочный лист'
      OnUpdate = actPrintPackListUpdate
      Left = 12345
    end
    object actPrintSubRent_Strono: TAction
      Category = 'Печать'
      Caption = 'Акт приема-передачи имущества(сторно)'
      OnExecute = actPrintSubRent_StronoExecute
      Left = 12345
    end
    object actPrintInvoiceDe: TAction
      Category = 'Печать ВЭД'
      Caption = 'Инвойс, рус/нем'
      OnExecute = actPrintInvoiceDeExecute
      OnUpdate = actPrintInvoiceUpdate
      Left = 12345
    end
    object aSendNaklToOffice: TAction
      Category = 'Вспомогательное'
      Caption = 'aSendNaklToOffice'
      Hint = 'Отправить накладную в офис'
      OnExecute = aSendNaklToOfficeExecute
      Left = 12345
    end
    object actSelfExport: TAction
      Category = 'Вспомогательное'
      Hint = 'Пометить как Самовывоз'
      OnExecute = actSelfExportExecute
      Left = 12345
    end
    object actPrintSpec_Rekl: TAction
      Category = 'Печать ВЭД'
      Caption = 'Печать спецификации (реклама)'
      OnExecute = actPrintSpec_ReklExecute
      OnUpdate = actPrintSpecUpdate
      Left = 12345
    end
    object actPrintInvoiceP_Rekl: TAction
      Category = 'Печать ВЭД'
      Caption = 'Проформа-Инвойс (реклама)'
      OnExecute = actPrintInvoiceP_ReklExecute
      OnUpdate = actPrintInvoicePUpdate
      Left = 12345
    end
    object actPrintInvoice_Rekl: TAction
      Category = 'Печать ВЭД'
      Caption = 'Инвойс (реклама) -отгрузка'
      OnExecute = actPrintInvoice_ReklExecute
      OnUpdate = actPrintInvoiceUpdate
      Left = 12345
    end
    object actPrintInvoice_ReklPP: TAction
      Category = 'Печать ВЭД'
      Caption = 'Инвойс (реклама) -предоплата'
      OnExecute = actPrintInvoice_ReklPPExecute
      OnUpdate = actPrintInvoiceUpdate
      Left = 12345
    end
    object actSpecificationParams: TAction
      Category = 'Печать ВЭД'
      Caption = 'Заполнить параметры отчёта'
      OnExecute = actSpecificationParamsExecute
      OnUpdate = actSpecificationParamsUpdate
      Left = 12345
    end
    object actPrintSpecInvoice: TAction
      Category = 'Печать ВЭД'
      Caption = 'Печать спецификации/инвойса'
      OnExecute = actPrintSpecInvoiceExecute
      OnUpdate = actPrintSpecInvoiceUpdate
      Left = 12345
    end
    object PrintNaklOS: TAction
      Category = 'Печать'
      Caption = 'Печать накладной для основных средств ЧП'
      ImageIndex = 4
      OnExecute = PrintNaklOSExecute
      OnUpdate = PrintNaklOSUpdate
      Left = 12345
    end
    object actPrintSpec_TNVED: TAction
      Category = 'Печать ВЭД'
      Caption = 'Печать спецификации ТН ВЭД'
      ImageIndex = 4
      OnExecute = actPrintSpec_TNVEDExecute
      OnUpdate = actPrintSpecUpdate
      Left = 12345
    end
    object actPrintInvoice_TNVED: TAction
      Category = 'Печать ВЭД'
      Caption = 'Инвойс - отгрузка ТН ВЭД'
      ImageIndex = 4
      OnExecute = actPrintInvoice_TNVEDExecute
      OnUpdate = actPrintInvoiceUpdate
      Left = 12345
    end
    object actPrintInvoicePP_TNVED: TAction
      Category = 'Печать ВЭД'
      Caption = 'Инвойс - предоплата ТН ВЭД'
      OnExecute = actPrintInvoicePP_TNVEDExecute
      OnUpdate = actPrintInvoiceUpdate
      Left = 12345
    end
    object actUpdateNakl2Egais: TAction
      Caption = 'actUpdateNakl2Egais'
      OnExecute = actUpdateNakl2EgaisExecute
      OnUpdate = actUpdateNakl2EgaisUpdate
      Left = 12345
    end
    object actSetPdvC: TAction
      Category = 'Вспомогательное'
      ShortCut = 24697
      OnExecute = actSetPdvCExecute
      Left = 12345
    end
    object actPrintPackListEn: TAction
      Category = 'Печать ВЭД'
      Caption = 'Упаковочный лист, рус/англ'
      OnExecute = actPrintPackListEnExecute
      OnUpdate = actPrintPackListEnUpdate
      Left = 12345
    end
    object actPrintQualityCertification: TAction
      Category = 'Печать'
      Caption = 'Печать удостоверений качества'
      Hint = 'Печать удостоверений качества'
      ImageIndex = 4
      OnExecute = actPrintQualityCertificationExecute
      Left = 12345
    end
    object actPrinRealRus: TAction
      Category = 'Печать'
      Caption = 'Печать накладной (РЕАЛ гипермаркет)'
      OnExecute = actPrinRealRusExecute
      OnUpdate = actPrinRealRusUpdate
      Left = 12345
    end
    object actPrintActRekl_Ru: TAction
      Category = 'Печать'
      Caption = 'Акт о списании рекламной продукции'
      OnExecute = actPrintActRekl_RuExecute
      OnUpdate = actPrintActRekl_RuUpdate
      Left = 12345
    end
    object actViewProvParty: TAction
      Caption = 'actViewProvParty'
      Left = 12345
    end
    object actPrintInvoiceTabClient: TAction
      Category = 'Печать ВЭД'
      Caption = 'Таблица для клиента'
      OnExecute = actPrintInvoiceTabClientExecute
      OnUpdate = actPrintInvoiceTabClientUpdate
      Left = 12345
    end
    object actPrintGtdLinks: TAction
      Category = 'Печать'
      Caption = 'Печать привязок позиций к ГТД'
      OnExecute = actPrintGtdLinksExecute
      OnUpdate = actPrintGtdLinksUpdate
      Left = 12345
    end
    object actPrintNaklImages: TAction
      Category = 'Печать'
      Caption = 'Весь набор документов'
      OnExecute = actPrintNaklImagesExecute
      Left = 12345
    end
    object actGovQuality: TAction
      Category = 'Печать'
      Caption = 'Свидетельства госконтроля качества'
      OnExecute = actGovQualityExecute
      Left = 12345
    end
    object actPrintNaklVozvrat: TAction
      Category = 'Печать'
      Caption = 'Печать возвратной накладной'
      OnExecute = actPrintNaklVozvratExecute
      Left = 12345
    end
    object actActPP: TAction
      Category = 'Печать'
      Caption = 'Акт приема-передачи рекламных материалов'
      OnExecute = actActPPExecute
      Left = 12345
    end
    object actNaklVoronezh: TAction
      Category = 'Печать'
      Caption = 'Печать Торг-12 с датами розлива'
      OnExecute = actNaklVoronezhExecute
      OnUpdate = actPrinRealRusUpdate
      Left = 12345
    end
    object actViewKartForm: TAction
      Category = 'Вспомогательное'
      Caption = 'Карточка движения ценности'
      ShortCut = 118
      OnExecute = actViewKartFormExecute
      Left = 12345
    end
    object actSplitPosByRests: TAction
      Category = 'Вспомогательное'
      Caption = 'Провести накладную с разделением позиций по остаткам'
      Hint = 'Провести накладную с разделением позиций по остаткам'
      ImageIndex = 50
      OnExecute = actSplitPosByRestsExecute
      OnUpdate = actSplitPosByRestsUpdate
      Left = 12345
    end
    object actSplitNaklPosByParty: TAction
      Category = 'Вспомогательное'
      Caption = 'Распределить партии'
      Hint = 'Разбивка по партиям, новый алгоритм (FIFO, VIP)'
      ImageIndex = 6
      OnExecute = actSplitNaklPosByPartyExecute
      OnUpdate = actSplitNaklPosByPartyUpdate
      Left = 12345
    end
    object actCreatePodotchetNakl: TAction
      Category = 'Создание документа'
      Caption = 'Создать накладную в подотчет'
      Hint = 'Создать накладную в подотчет'
      ImageIndex = 2
      Left = 12345
    end
    object actStartBPAgreementOfProductionReturn: TAction
      Caption = 'Стартовать процесс возвратной накладной'
      Hint = 'Стартовать процесс возвратной накладной'
      OnExecute = actStartBPAgreementOfProductionReturnExecute
      Left = 12345
    end
    object actStartBPContragentVIP: TAction
      Caption = 'Стартовать бизнес-процесс согласования VIP'
      OnExecute = actStartBPContragentVIPExecute
      Left = 12345
    end
    object actPrintBirka: TAction
      Category = 'Печать'
      Caption = 'Печать бирки на палетту'
      OnExecute = actPrintBirkaExecute
      OnUpdate = actPrintBirkaUpdate
      Left = 12345
    end
    object actStartBPRemoveBlockingOfMinimalOrder: TAction
      Caption = 'Стартовать бизнес-процесс снятия блокировки мин. суммы заказа'
      Hint = 'Стартовать бизнес-процесс снятия блокировки мин. суммы заказа'
      OnExecute = actStartBPRemoveBlockingOfMinimalOrderExecute
      Left = 12345
    end
    object actPrintMETRO: TAction
      Category = 'Печать'
      Caption = 'Печать накладной (МЕТРО)'
      OnExecute = actPrintMETROExecute
      OnUpdate = actPrintMETROUpdate
      Left = 12345
    end
    object actInsNar: TAction
      Category = 'наряды'
      Caption = 'Создать наряд'
      OnExecute = actInsNarExecute
      OnUpdate = actInsNarUpdate
      Left = 12345
    end
    object actUpdateNar: TAction
      Category = 'наряды'
      Caption = 'Изменить наряд'
      OnExecute = actUpdateNarExecute
      OnUpdate = actUpdateNarUpdate
      Left = 12345
    end
    object actDelNar: TAction
      Category = 'наряды'
      Caption = 'Удалить наряд'
      OnExecute = actDelNarExecute
      OnUpdate = actDelNarUpdate
      Left = 12345
    end
    object actPrintOrder: TAction
      Category = 'Печать'
      Caption = 'Печать наряда на разгрузку/погрузку'
      OnExecute = actPrintOrderExecute
      Left = 12345
    end
    object actStartBPFinanceCoordinationOfGettingProductOnCredit: TAction
      Caption = 'Стартовать бизнес-процесс на согласование продукции в подотчет'
      OnExecute = actStartBPFinanceCoordinationOfGettingProductOnCreditExecute
      Left = 12345
    end
    object actAllowNotCheckForNewTT: TAction
      Caption = 'Не проверять ассортимент для новой точки'
      Hint = 'Не проверять ассортимент для новой точки'
      OnExecute = actAllowNotCheckForNewTTExecute
      Left = 12345
    end
    object actPrintNaklF2WithoutHeader: TAction
      Category = 'Печать'
      Caption = 'Печать накладной по Ф2'
      OnExecute = actPrintNaklF2WithoutHeaderExecute
      OnUpdate = actPrintNaklF2WithoutHeaderUpdate
      Left = 12345
    end
    object actPrintMailBonus: TAction
      Category = 'Печать'
      Caption = 'Печать письма (бонусы)'
      OnExecute = actPrintMailBonusExecute
      Left = 12345
    end
    object actPrintNaklNotLVI: TAction
      Category = 'Печать'
      Caption = 'Печать накладной(Не ЛВИ)'
      OnExecute = actPrintNaklNotLVIExecute
      Left = 12345
    end
    object actAddPosAntiBrand: TAction
      Category = 'Вспомогательное'
      Caption = 'СКИДКА'
      Hint = 
        'проводит скидку в накладной согласно программам абсолютный партн' +
        'ер и топ -ассортимент'
      OnExecute = actAddPosAntiBrandExecute
      Left = 12345
    end
    object actAddFivePoistion: TAction
      Caption = '5 - позиций'
      Hint = 'Добавление позиций по Хортице и Благову'
      OnExecute = actAddFivePoistionExecute
      OnUpdate = actAddFivePoistionUpdate
      Left = 12345
    end
    object actStartBusinessSellingForTTWithoutLicense: TAction
      Caption = 'Стартовать бизнес-процесс "Продажи в ТТ без лицензии"'
      Hint = 'Стартовать бизнес-процесс "Продажи в ТТ без лицензии"'
      OnExecute = actStartBusinessSellingForTTWithoutLicenseExecute
      Left = 12345
    end
    object actCheckBaseNakl: TAction
      Caption = 'Отметить как базовую (Хортица)'
      Visible = False
      OnExecute = actCheckBaseNaklExecute
      OnUpdate = actCheckBaseNaklUpdate
      Left = 12345
    end
    object actCheckBaseNakl_med: TAction
      Caption = 'Отметить как базовую (Медовуха)'
      Visible = False
      OnExecute = actCheckBaseNakl_medExecute
      Left = 12345
    end
    object actCheckBaseNakl_blg: TAction
      Caption = 'Отметить как базовую (Благофф)'
      Visible = False
      OnExecute = actCheckBaseNakl_blgExecute
      Left = 12345
    end
    object actCreateNaklAkcii: TAction
      Category = 'Создание документа'
      Caption = 'Создание акционных накалдных'
      Hint = 
        'Создаются акционные накалдные по данному документу в случае если' +
        ' они не были созданны. Накладная создается в следующем числе'
      OnExecute = actCreateNaklAkciiExecute
      Left = 12345
    end
    object actPrintTTN2: TAction
      Category = 'Печать'
      Caption = 'Печать ТТН'
      OnExecute = actPrintTTN2Execute
      Left = 12345
    end
    object actPrintEANBox: TAction
      Category = 'Печать'
      Caption = 'Печать штрих-кодов с датой розлива на ящик'
      Hint = 'Печать штрих-кодов с датой розлива на ящик'
      OnExecute = actPrintEANBoxExecute
      Left = 12345
    end
    object actPrintActMaterial: TAction
      Category = 'Печать'
      Caption = 'Акт о списании расходных материалов'
      OnExecute = actPrintActMaterialExecute
      Left = 12345
    end
    object acPrintSertif: TAction
      Category = 'Печать'
      Caption = 'Документы на сертификацию Краснодар'
      Hint = 'Печать заявки на сертификацию'
      OnExecute = acPrintSertifExecute
      Left = 12345
    end
    object acPrintSertifKrasnoyarsk: TAction
      Category = 'Печать'
      Caption = 'Красноярск'
      Hint = 'Документы на сертификацию Красноярск'
      OnExecute = acPrintSertifKrasnoyarskExecute
      Left = 12345
    end
    object acPrintSertifRostov: TAction
      Category = 'Печать'
      Caption = 'по сертификату соответствия'
      OnExecute = acPrintSertifRostovExecute
      Left = 12345
    end
    object acPrintSertifPostovDate: TAction
      Category = 'Печать'
      Caption = 'по дате розлива'
      OnExecute = acPrintSertifPostovDateExecute
      Left = 12345
    end
    object acPrintSertifVoroneg: TAction
      Category = 'Печать'
      Caption = 'Воронеж'
      Hint = 'Региональная сертификация для Воронежа'
      OnExecute = acPrintSertifVoronegExecute
      Left = 12345
    end
    object ActPrintImportZ_ZTPP: TAction
      Category = 'Печать ВЭД'
      Caption = 'заявка-декларация в ЗТПП'
      OnExecute = ActPrintImportZ_ZTPPExecute
      OnUpdate = actPrintPackListEnUpdate
      Left = 12345
    end
    object ActPrintImport_ActZ: TAction
      Category = 'Печать ВЭД'
      Caption = 'Акт о загрузке'
      OnExecute = ActPrintImport_ActZExecute
      OnUpdate = actPrintPackListEnUpdate
      Left = 12345
    end
    object ActPrintImport_CMR: TAction
      Category = 'Печать ВЭД'
      Caption = 'Печать CMR'
      OnExecute = ActPrintImport_CMRExecute
      OnUpdate = actPrintPackListEnUpdate
      Left = 12345
    end
    object actPrintSpravkaB: TAction
      Category = 'Печать'
      Caption = 'Печать справки Б'
      OnExecute = actPrintSpravkaBExecute
      Left = 12345
    end
    object acPrintSertifYaroslavl: TAction
      Category = 'Печать'
      Caption = 'Ярославль'
      Hint = 'Региональная сертификация для Ярославля'
      OnExecute = acPrintSertifYaroslavlExecute
      Left = 12345
    end
    object acPrintSertifKazan: TAction
      Category = 'Печать'
      Caption = 'Казань'
      Hint = 'Региональная сертификация для Казани'
      OnExecute = acPrintSertifKazanExecute
      Left = 12345
    end
    object acPrintSertifRostovExcel: TAction
      Category = 'Печать'
      Caption = 'в Excel'
      OnExecute = acPrintSertifRostovExcelExecute
      Left = 12345
    end
    object actTransferStore: TAction
      Category = 'Печать'
      Caption = 'Акт приемки-передачи ответ хранения'
      Hint = 
        'Акт приемки-передачи ответ хранения|Акт приемки-передачи  ответ ' +
        'хранения'
      ImageIndex = 4
      OnExecute = actTransferStoreExecute
      Left = 12345
    end
    object actSendInvoice: TAction
      Caption = 'Send Invoice'
      OnExecute = actSendInvoiceExecute
      Left = 12345
    end
    object actGroupNameMAter: TAction
      Category = 'Вспомогательное'
      Caption = 'Сумма по группам'
      OnExecute = actGroupNameMAterExecute
      Left = 12345
    end
    object actInsNarUnloadCont: TAction
      Category = 'наряды'
      Caption = 'Выгрузка контейнеров'
      OnExecute = actInsNarUnloadContExecute
      OnUpdate = actInsNarUnloadContUpdate
      Left = 12345
    end
    object actPrintCheck: TAction
      Category = 'Печать ЧЕКОВ'
      Caption = 'Печать чеков'
      OnExecute = actPrintCheckExecute
      Left = 12345
    end
    object actCreatePDVNaklReports: TAction
      Category = 'Создание документа'
      Caption = 'Создать/открыть счет-фактуру на возврат (печатная форма)'
      OnExecute = actCreatePDVNaklReportsExecute
      Left = 12345
    end
    object PrintWithZMC: TAction
      Category = 'Печать'
      Caption = 'Печать накладной с учетом ЗМЦ'
      OnExecute = PrintNaklExecute
      OnUpdate = PrintNaklUpdate
      Left = 12345
    end
    object actSendNakl: TAction
      Caption = 'Отправить накладную по эл. почте'
      ShortCut = 49221
      OnExecute = actSendNaklExecute
      Left = 12345
    end
    object actSendWestern: TAction
      Caption = 'Send WesternCarriers'
      OnExecute = actSendWesternExecute
      Left = 12345
    end
    object actPrintSpecInvoiceNew: TAction
      Caption = 'Печать спецификации/инвойса Pos'
      OnExecute = actPrintSpecInvoiceNewExecute
      Left = 12345
    end
    object ActPasteFromExcel: TAction
      Category = 'Вспомогательное'
      Caption = 'вставить из Excel ...'
      Hint = 'вставить из Excel <код ценности>, <сумма>[, <количество> =1]'
      ImageIndex = 50
      OnExecute = ActPasteFromExcelExecute
      OnUpdate = ActPasteFromExcelUpdate
      Left = 12345
    end
    object ActDocListLocate: TAction
      Category = 'Вспомогательное'
      Caption = 'Поиск документа в списке'
      Hint = 'Поиск документа в списке'
      ImageIndex = 69
      ShortCut = 16460
      OnExecute = ActDocListLocateExecute
      Left = 12345
    end
    object actSplitList: TAction
      Category = 'Разделение накладной'
      Caption = 'Разделить на несколько'
      ShortCut = 24694
      OnExecute = actSplitListExecute
      Left = 12345
    end
    object actStickering: TAction
      Category = 'наряды'
      Caption = 'Стикеровка РЦ'
      OnExecute = actStickeringExecute
      OnUpdate = actStickeringUpdate
      Left = 12345
    end
    object actShippingPallets: TAction
      Category = 'наряды'
      Caption = 'Отгрузка паллет'
      OnExecute = actShippingPalletsExecute
      OnUpdate = actShippingPalletsUpdate
      Left = 12345
    end
    object acPrintNaklWithoutTransport: TAction
      Category = 'Печать'
      Caption = 'Печать накладной без транспортных услуг'
      OnExecute = PrintNaklExecute
      OnUpdate = PrintNaklUpdate
      Left = 12345
    end
    object actGetEgaisNUmber: TAction
      Category = 'ЕГАИС'
      Caption = 'actGetEgaisNUmber'
      Left = 12345
    end
    object actPrintMarkTara: TAction
      Category = 'ЕГАИС'
      Caption = 'Печать документа для маркировки поддона'
      OnExecute = actPrintMarkTaraExecute
      Left = 12345
    end
    object actExportToWMS: TAction
      Category = 'WMS'
      Caption = 'Экспорт в WMS накладных из сортировки'
      ImageIndex = 66
      OnExecute = actExportToWMSExecute
      Left = 12345
    end
    object actExportSortToWMS: TAction
      Category = 'WMS'
      Caption = 'Экспорт в WMS сортировочной накладной'
      ImageIndex = 66
      OnExecute = actExportSortToWMSExecute
      Left = 12345
    end
    object actAkt1: TAction
      Category = 'Печать'
      Caption = 'на ответ-хранение'
      OnExecute = actAkt1Execute
      Left = 12345
    end
    object actAkt2: TAction
      Category = 'Печать'
      Caption = 'с ответ-хранения'
      OnExecute = actAkt2Execute
      Left = 12345
    end
    object actExportOrderToWMS: TAction
      Category = 'WMS'
      Caption = 'Экспорт в WMS сортировки как заказ'
      OnExecute = actExportOrderToWMSExecute
      Left = 12345
    end
    object actImportFromWMS: TAction
      Category = 'WMS'
      Caption = 'Импорт из WMS сортировки как заказ'
      OnExecute = actImportFromWMSExecute
      Left = 12345
    end
    object PrintNaklNew: TAction
      Category = 'Печать'
      Caption = 'Накладная с округлением'
      OnExecute = PrintNaklExecute
      Left = 12345
    end
    object PrintNaklNew2: TAction
      Category = 'Печать'
      Caption = 'PrintNaklNew2'
      OnExecute = PrintNaklExecute
      Left = 12345
    end
    object actPrintExcel: TAction
      Category = 'Печать'
      Caption = 'Выгрузка в Эксель'
      OnExecute = actPrintExcelExecute
      Left = 12345
    end
    object actCSV: TAction
      Category = 'Печать'
      Caption = 'Выгрузить в csv'
      OnExecute = actCSVExecute
      Left = 12345
    end
    object actPrintLVZ: TAction
      Category = 'Печать'
      Caption = 'actPrintLVZ'
      OnExecute = PrintNaklExecute
    end
    object actExportAktATB: TAction
      Category = 'Печать'
      Caption = 'Акт о предоставлении скидки АТБ в XML'
      OnExecute = actExportAktATBExecute
    end
    object actPrint300War: TAction
      Category = 'Печать'
      Caption = 'Накладная на перевозку'
      OnExecute = actPrint300WarExecute
    end
    object actTestReportL: TAction
      Caption = 'actTestReportL'
      ShortCut = 24692
      OnExecute = actTestReportLExecute
    end
    object actTestPrint_F2: TAction
      Caption = 'actTestPrint_F2'
      OnExecute = actTestPrint_F2Execute
    end
    object actPrintNaklInPathway: TAction
      Caption = 'Накладная в путь'
      OnExecute = actPrintNaklInPathwayExecute
    end
    object actPrintTTNNakl: TAction
      Caption = 'Печать накладной с ТТН'
      OnExecute = actPrintTTNNaklExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 328
    Top = 496
    object N4: TMenuItem
      Action = Edit
      Default = True
      Left = 12345
    end
    object N7: TMenuItem
      Action = Insert
      Left = 12345
    end
    object N37: TMenuItem
      Action = actNaklPosSplit
      Left = 12345
    end
    object N6: TMenuItem
      Action = Delete
      Left = 12345
    end
    object N5: TMenuItem
      Action = CloseForm
      Caption = '&Сохранить документ'
      Left = 12345
    end
    object N1: TMenuItem
      Action = Copy
      Caption = '&Копировать документ'
      Left = 12345
    end
    object N3: TMenuItem
      Action = ACatalog
      Caption = '&Справочник позиций'
      Left = 12345
    end
    object N2: TMenuItem
      Action = Print
      Caption = '&Печать документа'
      Left = 12345
    end
    object N13: TMenuItem
      Action = CopyPos
      ShortCut = 16429
      Left = 12345
    end
    object N14: TMenuItem
      Action = PastePos
      ShortCut = 8237
      Left = 12345
    end
    object N15: TMenuItem
      Action = PriceLabels
      Left = 12345
    end
    object N20: TMenuItem
      Caption = 'Печать чека с позиции'
      OnClick = CheckPrnPosExecute
      Left = 12345
    end
    object btnShowCol: TMenuItem
      Caption = 'Показать колонки'
      OnClick = btnShowColClick
      Left = 12345
    end
    object btnCheckWithCol: TMenuItem
      Caption = 'Сравнить с колонкой ...'
      OnClick = btnCheckWithColClick
      Left = 12345
    end
    object N83: TMenuItem
      Action = actViewKartForm
      Left = 12345
    end
    object Excel2: TMenuItem
      Action = ActPasteFromExcel
      Left = 12345
    end
    object N114: TMenuItem
      Action = actSplitList
      Left = 12345
    end
    object dbf1: TMenuItem
      Caption = 'Отправить dbf-файл'
      OnClick = dbf1Click
      Left = 12345
    end
    object N97: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object miEDI: TMenuItem
      Caption = 'EDI'
      Left = 12345
      object J1: TMenuItem
        Tag = 1
        Caption = 'Отправить счет EDI'
        OnClick = N98Click
        Left = 12345
      end
      object J2: TMenuItem
        Tag = 2
        Caption = 'Отправить подтверждение заказа'
        OnClick = N98Click
        Left = 12345
      end
      object N98: TMenuItem
        Tag = 3
        Caption = 'Отправить уведомление об отгрузке'
        OnClick = N98Click
        Left = 12345
      end
    end
    object actGetEgaisNUmber1: TMenuItem
      Action = actGetEgaisNUmber
      Visible = False
      Left = 12345
    end
    object gPositionsCopyPast: TMenuItem
      Caption = 'Скопировать/вставить позицию'
      object gCopy: TMenuItem
        Caption = '&Cкопировать'
        OnClick = gCopyClick
      end
      object gPast: TMenuItem
        Caption = '&Вставить'
        Enabled = False
        OnClick = gPastClick
      end
    end
  end
  object CreatePopup: TPopupMenu
    Left = 328
    Top = 276
    object N8: TMenuItem
      Action = CreatePDVNakl
      Left = 12345
    end
    object N16: TMenuItem
      Action = CreatePDVN_D2
      Left = 12345
    end
    object N64: TMenuItem
      Action = actCreatePDVNaklReports
      Visible = False
      Left = 12345
    end
    object N30: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N32: TMenuItem
      Action = aCreatePDVIncDoc
      Left = 12345
    end
    object N33: TMenuItem
      Action = aCreatePDVIncKorDoc
      Left = 12345
    end
    object N31: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object SeparateNakl1: TMenuItem
      Action = SeparateNakl
      Left = 12345
    end
    object N84: TMenuItem
      Action = actSplitPosByRests
      Left = 12345
    end
    object MakeDoc1: TMenuItem
      Action = MakeDoc
      Caption = 'Создать накладную (проводку) ...'
      Left = 12345
    end
    object N23: TMenuItem
      Action = actCreateOplDoc
      Left = 12345
    end
    object N24: TMenuItem
      Action = aCreateOplDocNoPos
      Left = 12345
    end
    object BtnCreatePodotchetNakl: TMenuItem
      Action = actCreatePodotchetNakl
      Left = 12345
    end
    object N18: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N25: TMenuItem
      Action = aSendENakl
      Left = 12345
    end
  end
  object UpdateQuery: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    SQL.Strings = (
      
        'EXECUTE PROCEDURE UPDATE_NAKL_POS(:REDID, :BASEID, :PRICE_TYPE, ' +
        ':VALYUTA, :KURS, :CHANGE_PRICE)'
      ' ')
    Left = 752
    Top = 300
  end
  object pmPrint: TPopupMenu
    OnPopup = pmPrintPopup
    Left = 260
    Top = 560
    object PrintNakl1: TMenuItem
      Action = PrintNakl
      Left = 12345
    end
    object N105: TMenuItem
      Caption = 'Печать накладной(Не ЛВИ) с примечанием'
      OnClick = N105Click
      Left = 12345
    end
    object N124: TMenuItem
      Action = acPrintNaklWithoutTransport
      Left = 12345
    end
    object N95: TMenuItem
      Caption = 'Печать накладной(Не ЛВИ) без примечания'
      OnClick = N95Click
      Left = 12345
    end
    object N1210: TMenuItem
      Action = actPrint300War
    end
    object N93: TMenuItem
      Action = actPrintNaklF2WithoutHeader
      Left = 12345
    end
    object PrintNakl1_With_Vozvrat: TMenuItem
      Action = PrintNaklWithVozvrat
      Left = 12345
    end
    object N71: TMenuItem
      Action = PrintWithZMC
      Left = 12345
    end
    object actPrintTTN1: TMenuItem
      Action = actPrintTTN
      Left = 12345
    end
    object N9: TMenuItem
      Action = PrintNaklTMC
      Enabled = False
      Left = 12345
    end
    object PrintInternal1: TMenuItem
      Action = PrintInternal
      Left = 12345
    end
    object mnPrint11: TMenuItem
      Action = actPrintNaklInPathway
    end
    object N137: TMenuItem
      Action = actPrintTTNNakl
    end
    object N10: TMenuItem
      Action = PrintSchet
      Left = 12345
    end
    object miSchet2Print: TMenuItem
      Caption = 'Счет(2)'
      OnClick = miSchet2PrintClick
      Left = 12345
    end
    object N19: TMenuItem
      Action = PrintDolg
      Caption = 'Оплаченный долг'
      Enabled = False
      Left = 12345
    end
    object N11: TMenuItem
      Action = PrintRetNakl
      Left = 12345
    end
    object N12: TMenuItem
      Action = PrintAct
      Left = 12345
    end
    object N17: TMenuItem
      Action = PriceList
      Enabled = False
      Left = 12345
    end
    object IntitledDoc1: TMenuItem
      Action = UntitledDoc
      Enabled = False
      Left = 12345
    end
    object IntitledDocBR: TMenuItem
      Caption = 'Безреквизитный (без разбивки)'
      OnClick = IntitledDocBRClick
      Left = 12345
    end
    object PrintCopy1: TMenuItem
      Action = PrintCopy
      Enabled = False
      Left = 12345
    end
    object miProvPrint: TMenuItem
      Action = aPrintProver
      Left = 12345
    end
    object Rf1: TMenuItem
      Action = CheckPrn
      Caption = 'Кассовый чек'
      Left = 12345
    end
    object N28: TMenuItem
      Action = PrintRecPrice
      Left = 12345
    end
    object NN: TMenuItem
      Action = PrintIntNakl
      Left = 12345
    end
    object N39: TMenuItem
      Action = actPrintGift
      Left = 12345
    end
    object N38: TMenuItem
      Action = actTransfer
      Left = 12345
    end
    object N58: TMenuItem
      Action = actTransferStore
      Left = 12345
    end
    object N43: TMenuItem
      Action = actPrintBreak
      Left = 12345
    end
    object N72: TMenuItem
      Action = actPrintQualityCertification
      Left = 12345
    end
    object N52: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object pmPrint_i_Docs: TMenuItem
      Caption = 'Документы ВЭД'
      Left = 12345
      object pmPrint_i_Spec: TMenuItem
        Action = actPrintSpec
        Left = 12345
      end
      object pmPrint_i_SpecTNVED1: TMenuItem
        Action = actPrintSpec_TNVED
        Left = 12345
      end
      object pmPrint_i_SpecRekl: TMenuItem
        Action = actPrintSpec_Rekl
        Left = 12345
      end
      object pmPrint_i_is: TMenuItem
        Caption = 'Инвойс'
        Left = 12345
        object N66: TMenuItem
          Action = actPrintInvoice
          Left = 12345
        end
        object N67: TMenuItem
          Action = actPrintInvoicePP
          Left = 12345
        end
        object actPrintInvoiceTNVED1: TMenuItem
          Action = actPrintInvoice_TNVED
          Left = 12345
        end
        object N70: TMenuItem
          Action = actPrintInvoicePP_TNVED
          Left = 12345
        end
      end
      object pmPrint_i_rs: TMenuItem
        Caption = 'Инвойс (реклама)'
        Left = 12345
        object N68: TMenuItem
          Action = actPrintInvoice_Rekl
          Left = 12345
        end
        object N69: TMenuItem
          Action = actPrintInvoice_ReklPP
          Left = 12345
        end
      end
      object pmPrint_i_InvoiceP: TMenuItem
        Action = actPrintInvoiceP
        Left = 12345
      end
      object pmPrint_i_invocePRekl: TMenuItem
        Action = actPrintInvoiceP_Rekl
        Left = 12345
      end
      object pmPrint_i_TabClient: TMenuItem
        Action = actPrintInvoiceTabClient
        Left = 12345
      end
      object N54: TMenuItem
        Caption = '-'
        Left = 12345
      end
      object pmPrint_i_InvoiceGermany: TMenuItem
        Action = actPrintInvoiceDe
        Left = 12345
      end
      object pmPrint_i_packList: TMenuItem
        Action = actPrintPackListEn
        Left = 12345
      end
      object pmPrint_i_Z_ZTPP: TMenuItem
        Action = ActPrintImportZ_ZTPP
        Left = 12345
      end
      object pmPrint_i_ActZag: TMenuItem
        Action = ActPrintImport_ActZ
        Left = 12345
      end
      object pmPrint_i_CMR: TMenuItem
        Action = ActPrintImport_CMR
        Left = 12345
      end
      object N63: TMenuItem
        Caption = '-'
        Left = 12345
      end
      object pmPrint_i_IParamsMake: TMenuItem
        Action = actSpecificationParams
        Left = 12345
      end
      object pmPrint_i_IParams: TMenuItem
        Action = actPrintSpecInvoice
        Left = 12345
      end
      object N113: TMenuItem
        Action = actPrintSpecInvoiceNew
        Left = 12345
      end
      object N136: TMenuItem
        Action = actPrintSpecInvoiceUKR
      end
    end
    object N36: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N29: TMenuItem
      Caption = 'Акт приема-передачи ОФ'
      ImageIndex = 4
      Left = 12345
    end
    object N34: TMenuItem
      Action = PrintActSpisan
      Left = 12345
    end
    object N50: TMenuItem
      Action = actPrintActSpisanNew
      Left = 12345
    end
    object N35: TMenuItem
      Action = printNaclOF
      Visible = False
      Left = 12345
    end
    object N65: TMenuItem
      Action = PrintNaklOS
      Left = 12345
    end
    object N135: TMenuItem
      Caption = 'Акт узгодження ціни'
      OnClick = N135Click
    end
    object btnNote: TMenuItem
      Caption = 'Письма'
      OnClick = actNoteExecute
      Left = 12345
    end
    object N94: TMenuItem
      Action = actPrintMailBonus
      Left = 12345
    end
    object N40: TMenuItem
      Caption = 'Дополнение к ТН (для МЭТРО...)'
      Visible = False
      OnClick = N40Click
      Left = 12345
    end
    object N44: TMenuItem
      Action = actPrintDogovor
      Left = 12345
    end
    object N86: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N87: TMenuItem
      Action = actPrintBirka
      Left = 12345
    end
    object N92: TMenuItem
      Action = actPrintOrder
      Left = 12345
    end
    object N61: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N62: TMenuItem
      Action = actPrintCheck
      Left = 12345
    end
    object N75: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object AA1: TMenuItem
      Action = actSendNakl
      Left = 12345
    end
    object N115: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N116: TMenuItem
      Caption = 'Печать отчета для ЧП'
      OnClick = N116Click
      Left = 12345
    end
    object N119: TMenuItem
      Caption = 'Печать начального отчет по ЧП'
      OnClick = N119Click
      Left = 12345
    end
    object N117: TMenuItem
      Caption = 'Печать конечного отчет по ЧП'
      OnClick = N117Click
      Left = 12345
    end
    object N118: TMenuItem
      Caption = 'Печать накаладной по ЧП'
      OnClick = N118Click
      Left = 12345
    end
    object N120: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N212: TMenuItem
      Caption = 'Печать начала по ЧП2'
      OnClick = N212Click
      Left = 12345
    end
    object N210: TMenuItem
      Caption = 'Печать по ЧП2'
      OnClick = N210Click
      Left = 12345
    end
    object N211: TMenuItem
      Caption = 'Печать конечного отчета 2'
      OnClick = N211Click
      Left = 12345
    end
    object N126: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N127: TMenuItem
      Caption = 'ИБТ'
      Left = 12345
      object N128: TMenuItem
        Caption = 'Акт приема-передачи на ответ. хранение'
        OnClick = N128Click
        Left = 12345
      end
      object N129: TMenuItem
        Caption = 'Акт приема-передачи возврата с ответ.хранения'
        OnClick = N129Click
        Left = 12345
      end
    end
    object N130: TMenuItem
      Caption = 'Акты НОВЫЕ'
      Left = 12345
      object N131: TMenuItem
        Action = actAkt1
        Left = 12345
      end
      object N132: TMenuItem
        Action = actAkt2
        Left = 12345
      end
      object N134: TMenuItem
        Caption = 'сборка и сортировка'
        OnClick = N134Click
        Left = 12345
      end
    end
    object PrintNaklNew1: TMenuItem
      Action = PrintNaklNew
      Left = 12345
    end
    object PrintNaklNew21: TMenuItem
      Action = PrintNaklNew2
      Visible = False
      Left = 12345
    end
    object actPrintExcel1: TMenuItem
      Action = actPrintExcel
      Left = 12345
    end
    object N133: TMenuItem
      Action = actCSV
      Left = 12345
    end
    object pLvz: TMenuItem
      Action = actPrintLVZ
    end
    object XML1: TMenuItem
      Action = actExportAktATB
    end
  end
  object Query2: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    Left = 704
    Top = 260
  end
  object IndQuery: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    Left = 552
    Top = 280
  end
  object Rest: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    SQL.Strings = (
      
        'EXECUTE PROCEDURE GET_REST_DOC_CFO(:KOD_MATER, :GROUP_OPER, :KOD' +
        '_OPER, :BALANCE_KOD, :OPERDATE, :RECID, :BASEID,:FORM)')
    Left = 520
    Top = 345
  end
  object Query3: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    Left = 592
    Top = 284
  end
  object PriceControlData: TMegaRDataSet
    SelectSQL.Strings = (
      
        'select DNP.KOD_MATER, (SELECT PRICE FROM GET_PH_PRICE('#39'01.01.200' +
        '1'#39',DNP.KOD_MATER)) OPT_PRICE, CPN.PRICE_ FROM DOC_NAKL_POS DNP'
      
        'LEFT JOIN check_price_nakl(:FORMTYPE, :RECID,101, :BALANCE) CPN ' +
        'ON (CPN.KODMATER=DNP.KOD_MATER)'
      'where DNP.DOCRECNO = :RECID1 AND DNP.BASEID = 101'
      ' ')
    BeforeOpen = PriceControlDataBeforeOpen
    Transaction = Nakl_Transaction
    Database = DM.Money
    DefaultFormats.NumericEditFormat = '0'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 352
    Top = 369
    object PriceControlDataKOD_MATER: TFloatField
      FieldName = 'KOD_MATER'
    end
    object PriceControlDataOPT_PRICE: TFloatField
      FieldName = 'OPT_PRICE'
    end
    object PriceControlDataPRICE_: TFloatField
      FieldName = 'PRICE_'
    end
  end
  object AdrQuery: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    Left = 572
    Top = 348
  end
  object Transaction3: TMegaTransaction
    DefaultDatabase = DM.Money
    TimeoutAction = TARollback
    TRParams.Strings = (
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 644
    Top = 268
  end
  object pmPrintUSA: TPopupMenu
    Left = 416
    Top = 572
    object P1: TMenuItem
      Caption = 'Print Invoice'
      OnClick = P1Click
      Left = 12345
    end
    object SendInvoice1: TMenuItem
      Action = actSendInvoice
      Left = 12345
    end
  end
  object Query4: TMegaQuery
    Transaction = Transaction3
    Database = DM.Money
    Left = 536
    Top = 405
  end
  object mselDK_From: TMegaSelDKDialog
    Database = DM.Money
    Transaction = Nakl_Transaction
    Options = []
    Left = 660
    Top = 400
  end
  object mselDK_TO: TMegaSelDKDialog
    Database = DM.Money
    Transaction = Nakl_Transaction
    Options = [dkoOnlySubDKF2, dkoSelTradeOutlet, dkoSelKeytAddress]
    OnDKCheck = mselDK_TODKCheck
    OnTradeOutletCheck = mselDK_TOTradeOutletCheck
    OnChangeTO = mselDK_TOChangeTO
    Left = 224
    Top = 416
  end
  object mselDK_C: TMegaSelDKDialog
    Database = DM.Money
    Transaction = Nakl_Transaction
    Options = []
    Left = 616
    Top = 400
  end
  object UpdateQueryKol: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    SQL.Strings = (
      
        'EXECUTE PROCEDURE UPDATE_NAKL_POS_KOL(:REDID, :BASEID, :PRICE_TY' +
        'PE, :VALYUTA, :KURS, :CHANGE_PRICE)'
      ' ')
    Left = 520
    Top = 244
  end
  object qrEnakl: TMegaDataSet
    Transaction = Nakl_Transaction
    Database = DM.Money
    DefaultFormats.NumericEditFormat = '0'
    Left = 136
    Top = 401
  end
  object qrCheckEAN: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    SQL.Strings = (
      'SELECT count(*)'
      'FROM SPRAV_MATER '
      'WHERE KOD_EAN=:KOD_EAN')
    Left = 184
    Top = 401
  end
  object pmLink: TPopupMenu
    Left = 496
    Top = 496
    object N26: TMenuItem
      Action = actFindTTN
      Left = 12345
    end
    object N27: TMenuItem
      Action = actFindSortingParty
      Left = 12345
    end
  end
  object dsNote_m: TMegaDataSet
    SelectSQL.Strings = (
      'SELECT'
      '  GNM.*,'
      '  sdk_to.NASH_KOD AS NASH_KOD,'
      '  doc.NOTES,'
      '  st.ORDER_NUM,'
      '  st.NUMBER,'
      
        '  sdk_from.shortname_dk,sdk_from.addres,sdk_from.phones,sdk_from' +
        '.parent,sdk_from.kod_dk,'
      '  doc.recid,doc.baseid'
      ''
      'FROM GET_NOTE_MET(:zmc_recid, :zmc_baseid) GNM'
      
        'LEFT JOIN DOC_NAKL DOC ON (:zmc_recid=doc.RECID AND :zmc_baseid=' +
        'doc.BASEID)'
      'LEFT JOIN sprav_dk sdk_to ON (sdk_to.kod_dk=doc.dk_to)'
      'LEFT JOIN sprav_dk sdk_from ON (sdk_from.kod_dk=doc.dk_from)'
      
        'LEFT JOIN sticker st ON (st.doc_recid= :zmc_recid and st.doc_bas' +
        'eid= :zmc_baseid)'
      'order by cast(gnm.artikulm as integer)')
    OnCalcFields = dsNote_mCalcFields
    Transaction = DM.Transaction
    Database = DM.Money
    DefaultFormats.NumericEditFormat = '0'
    Left = 280
    Top = 352
    object dsNote_mzmc_mater: TFIBStringField
      FieldName = 'zmc_mater'
      Size = 45
      EmptyStrToNull = True
    end
    object dsNote_mzmc_kolich: TIntegerField
      FieldName = 'zmc_kolich'
    end
    object dsNote_mvalue_nakl: TFloatField
      FieldName = 'value_nakl'
    end
    object dsNote_mvalue_right: TFloatField
      FieldName = 'value_right'
    end
    object dsNote_mvalue_dif: TFloatField
      FieldName = 'value_dif'
    end
    object dsNote_msum_dif: TFloatField
      FieldName = 'sum_dif'
    end
    object dsNote_mzmc_date: TDateTimeField
      FieldName = 'zmc_date'
    end
    object dsNote_mnakl_num: TIntegerField
      FieldName = 'nakl_num'
    end
    object dsNote_mnakl_date: TDateTimeField
      FieldName = 'nakl_date'
    end
    object dsNote_mnakl_balance: TIntegerField
      FieldName = 'nakl_balance'
    end
    object dsNote_martikul: TFloatField
      FieldName = 'artikul'
    end
    object dsNote_martikulm: TFIBStringField
      FieldName = 'artikulm'
      Size = 10
      EmptyStrToNull = True
    end
    object dsNote_mTotalSumAsString: TMegaStringField
      FieldKind = fkCalculated
      FieldName = 'TotalSumAsString'
      Size = 100
      EmptyStrToNull = True
      Calculated = True
    end
    object dsNote_mNASH_KOD: TMegaStringField
      FieldName = 'NASH_KOD'
      Size = 10
      EmptyStrToNull = True
    end
    object dsNote_mNOTES: TMegaStringField
      FieldName = 'NOTES'
      Size = 255
      EmptyStrToNull = True
    end
    object dsNote_mORDER_NUM: TMegaStringField
      FieldName = 'ORDER_NUM'
      Size = 50
      EmptyStrToNull = True
    end
    object dsNote_mNUMBER: TMegaStringField
      FieldName = 'NUMBER'
      Size = 50
      EmptyStrToNull = True
    end
    object dsNote_mzmc_num: TFIBStringField
      FieldName = 'zmc_num'
      Size = 50
      EmptyStrToNull = True
    end
    object dsNote_mSHORTNAME_DK: TFIBStringField
      FieldName = 'SHORTNAME_DK'
      Size = 45
      EmptyStrToNull = True
    end
    object dsNote_maddres: TFIBStringField
      FieldName = 'addres'
      Size = 60
      EmptyStrToNull = True
    end
    object dsNote_mphones: TFIBStringField
      FieldName = 'phones'
      Size = 40
      EmptyStrToNull = True
    end
    object dsNote_mKOD_DK: TFloatField
      FieldName = 'KOD_DK'
    end
    object dsNote_mRECID: TIntegerField
      FieldName = 'RECID'
    end
    object dsNote_mBASEID: TIntegerField
      FieldName = 'BASEID'
    end
  end
  object frDB_Notem: TfrDBDataSet
    DataSet = dsNote_m
    Left = 284
    Top = 412
  end
  object DocNakl: TMegaDSDocNakl
    UpdateSQL.Strings = (
      'update DOC_NAKL'
      'set'
      '  RECID = ?RECID,'
      '  BASEID = ?BASEID,'
      '  OPERDATE = ?OPERDATE,'
      '  DOCTYPE = ?DOCTYPE,'
      '  DOCNUMBER = ?DOCNUMBER,'
      '  DOCDATE = ?DOCDATE,'
      '  GROUP_OPER = ?GROUP_OPER,'
      '  KOD_OPER = ?KOD_OPER,'
      '  DK_FROM = ?DK_FROM,'
      '  DK_TO = ?DK_TO,'
      '  KURS = ?KURS,'
      '  NOTES = ?NOTES,'
      '  FORMAOPL_ = ?FORMAOPL_,'
      '  PRICETYPE_ = ?PRICETYPE_,'
      '  NACENKA_ = ?NACENKA_,'
      '  BALANCE_KOD =?BALANCE_KOD,'
      '  V = ?V,'
      '  V1 = ?V1,'
      '  PRICE_FROM_VALYUTA = ?PRICE_FROM_VALYUTA,'
      '  STATE = ?STATE,'
      '  DK_C = ?DK_C,'
      '  OTSR = ?OTSR,'
      '  TRANSPORT= ?TRANSPORT,'
      '  CFO = ?CFO,'
      '  PRESENT = ?PRESENT,'
      '  SUFICS = ?SUFICS,'
      '  ADDR_FROM = ?ADDR_FROM,'
      '  ADDR_TO = ?ADDR_TO,'
      '  SOGL  = ?SOGL,'
      '  USE_PALLETE = ?USE_PALLETE'
      '  ,ZAYAVKA_ID=?ZAYAVKA_ID,SENDED_TO_OFFICE=?SENDED_TO_OFFICE,'
      '  BRAND_CASE_ID = ?BRAND_CASE_ID,'
      '  DONT_USE_SPEC_PRICE = ?DONT_USE_SPEC_PRICE,'
      '  SUMMA_EXPORT = ?SUMMA_EXPORT,'
      '  CONTRACT_ID = ?CONTRACT_ID,'
      '  ADDR_FROM_ID = ?ADDR_FROM_ID,'
      '  ADDR_TO_ID = ?ADDR_TO_ID'
      'where'
      '  RECID = ?old_RECID'
      '  AND BASEID = ?old_BASEID')
    DeleteSQL.Strings = (
      'delete from DOC_NAKL'
      'where'
      '  RECID = ?old_RECID and BASEID =  ?old_BASEID')
    InsertSQL.Strings = (
      'insert into DOC_NAKL ('
      '  RECID,'
      '  OPERDATE,'
      '  DOCTYPE,'
      '  DOCNUMBER,'
      '  DOCDATE,'
      '  GROUP_OPER,'
      '  KOD_OPER,'
      '  DK_FROM,'
      '  DK_TO,'
      '  KURS,'
      '  NOTES,'
      '  FORMAOPL_,'
      '  PRICETYPE_,'
      '  NACENKA_,'
      '  BALANCE_KOD,'
      '  V,'
      '  V1,'
      '  PRICE_FROM_VALYUTA,'
      '  STATE,'
      '  DK_C,'
      '  OTSR,'
      ' TRANSPORT,'
      '  CFO,'
      '  PRESENT,'
      '  SUFICS,'
      '  ADDR_FROM,'
      '  ADDR_TO,'
      '  SOGL,'
      '  USE_PALLETE'
      '  ,ZAYAVKA_ID,SENDED_TO_OFFICE,'
      '  BRAND_CASE_ID,'
      '  DONT_USE_SPEC_PRICE,'
      '  SUMMA_EXPORT,'
      '  CONTRACT_ID,'
      '  ADDR_FROM_ID,'
      '  ADDR_TO_ID'
      ')'
      'values'
      '('
      '  ?RECID,'
      '  ?OPERDATE,'
      '  ?DOCTYPE,'
      '  ?DOCNUMBER,'
      '  ?DOCDATE,'
      '  ?GROUP_OPER,'
      '  ?KOD_OPER,'
      '  ?DK_FROM,'
      '  ?DK_TO,'
      '  ?KURS,'
      '  ?NOTES,'
      '  ?FORMAOPL_,'
      '  ?PRICETYPE_,'
      '  ?NACENKA_,'
      '  ?BALANCE_KOD,'
      '  ?V,'
      '  ?V1,'
      '  ?PRICE_FROM_VALYUTA,'
      '  ?STATE,'
      '  ?DK_C,'
      '  ?OTSR,'
      '  ?TRANSPORT,'
      '  ?CFO,'
      '  ?PRESENT,'
      '  ?SUFICS,'
      '  ?ADDR_FROM,'
      '  ?ADDR_TO,'
      '  ?SOGL,'
      '  ?USE_PALLETE'
      '  ,?ZAYAVKA_ID,?SENDED_TO_OFFICE,'
      '  ?BRAND_CASE_ID,'
      '  ?DONT_USE_SPEC_PRICE,'
      '  ?SUMMA_EXPORT,'
      '  ?CONTRACT_ID,'
      '  ?ADDR_FROM_ID,'
      '  ?ADDR_TO_ID '
      ')')
    RefreshSQL.Strings = (
      'SELECT DOC.*,'
      'ldo.recid ldo_recid,'
      'ldo.baseid ldo_baseid,'
      'dg.recid dg_recid,'
      'dg.baseid dg_baseid,'
      'dg.docnumber dg_docnumber,'
      'dg.notes dg_notes,'
      
        '(SELECT GROUP_NAME FROM SPRAV_GROPER WHERE GROUP_OPER = DOC.GROU' +
        'P_OPER) GROUP_NAME,'
      
        '(SELECT NAME_OPER FROM SPRAV_OPER WHERE GROUP_OPER = DOC.GROUP_O' +
        'PER AND KOD_OPER = DOC.KOD_OPER) NAME_OPER,'
      
        '(SELECT SHORTNAME_DK FROM SPRAV_DK WHERE KOD_DK = DOC.DK_FROM) D' +
        'K_FROM_NAME,'
      
        '(SELECT SHORTNAME_DK FROM SPRAV_DK WHERE KOD_DK = DOC.DK_TO) DK_' +
        'TO_NAME,'
      
        '(SELECT DK_BASEID FROM SPRAV_DK WHERE KOD_DK = DOC.DK_TO) DK_TO_' +
        'BASEID,'
      
        '(SELECT SHORTNAME_DK FROM SPRAV_DK WHERE KOD_DK = DOC.DK_C) DK_C' +
        '_NAME,'
      
        '(SELECT PRICE_MIN FROM SPRAV_DK WHERE KOD_DK = DOC.DK_TO) PRICE_' +
        'MIN,'
      
        '(SELECT DOC_INHERITED FROM SPRAV_TDOC WHERE DOCTYPE = DOC.DOCTYP' +
        'E) DOC_INHERITED,'
      
        '(SELECT DOC_NAME_ FROM SPRAV_TDOC  WHERE DOCTYPE = DOC.DOCTYPE) ' +
        'DOC_NAME_,'
      
        '(SELECT NDSINSUMMA FROM SPRAV_BALANCE  WHERE BALANCE_KOD = DOC.B' +
        'ALANCE_KOD) NDSINSUMMA,'
      'TD.AREA_ID AREA_ID, TD.ADDRESS DK_ADDRESS, NNL.RECID TRANSIT,'
      'DL.IS_BANKET,'
      
        '(SELECT EXCISE_IN_SUMMA FROM SPRAV_OPER WHERE GROUP_OPER = DOC.G' +
        'ROUP_OPER AND KOD_OPER = DOC.KOD_OPER) EXCISE_IN_SUMMA,'
      'doc.SOGL'
      'FROM DOC_NAKL DOC'
      
        'left join link_doc_opl ldo on (ldo.parent_recid = DOC.RECID AND ' +
        'ldo.parent_baseid= DOC.BASEID and opl_form_type = 7)'
      
        'left join doc_gtd dg on (dg.recid = ldo.opl_recid and dg.baseid ' +
        '= ldo.opl_baseid)'
      
        'LEFT JOIN DELIVERY_LOCATION DL ON (DL.FORMTYPE=1 AND DL.BASEID=D' +
        'OC.BASEID AND  DL.DOCRECNO=DOC.RECID)'
      
        'LEFT JOIN SPRAV_DK_ADDRESS TD ON (TD.BASEID=DL.BASEID AND TD.REC' +
        'ID=DL.LOCRECNO)'
      
        'LEFT JOIN NAKL_NOT_LOAD NNL ON (NNL.RECID=DOC.RECID AND NNL.BASE' +
        'ID=DOC.BASEID)'
      'WHERE DOC.RECID = ?RECID'
      'AND DOC.BASEID = ?BASEID')
    SelectSQL.Strings = (
      '  SELECT DOC.*,'
      'PDVN.DOCNUMBER PDVNNUMBER,'
      'PDVN.DOCDATE PDVNDATE,'
      'ldo.recid ldo_recid,'
      'ldo.baseid ldo_baseid,'
      'dg.recid dg_recid,'
      'dg.baseid dg_baseid,'
      'dg.docnumber dg_docnumber,'
      'dg.notes dg_notes,'
      
        '(SELECT GROUP_NAME FROM SPRAV_GROPER WHERE GROUP_OPER = DOC.GROU' +
        'P_OPER) GROUP_NAME,'
      'so.NAME_OPER,'
      
        '(SELECT SHORTNAME_DK FROM SPRAV_DK WHERE KOD_DK = DOC.DK_FROM) D' +
        'K_FROM_NAME,'
      
        '(SELECT SHORTNAME_DK FROM SPRAV_DK WHERE KOD_DK = DOC.DK_TO) DK_' +
        'TO_NAME,'
      
        '(SELECT PARENT       FROM SPRAV_DK WHERE KOD_DK = DOC.DK_TO) PAR' +
        'ENT_DK_TO,'
      
        '(SELECT DK_COUNTRY_KOD FROM SPRAV_DK WHERE KOD_DK = DOC.DK_TO) D' +
        'K_TO_COUNTRY,'
      
        '(SELECT PRINT_WITH_VOZVRAT FROM SPRAV_DK WHERE KOD_DK = DOC.DK_T' +
        'O) DK_TO_PRINT_WITH_VOZVRAT,'
      
        '(SELECT DK_BASEID FROM SPRAV_DK WHERE KOD_DK = DOC.DK_TO) DK_TO_' +
        'BASEID,'
      
        '(SELECT SHORTNAME_DK FROM SPRAV_DK WHERE KOD_DK = DOC.DK_C) DK_C' +
        '_NAME,'
      
        '(SELECT PRICE_MIN FROM SPRAV_DK WHERE KOD_DK = DOC.DK_TO) PRICE_' +
        'MIN,'
      
        '(SELECT DOC_INHERITED FROM SPRAV_TDOC WHERE DOCTYPE = DOC.DOCTYP' +
        'E) DOC_INHERITED,'
      
        '(SELECT DOC_NAME_ FROM SPRAV_TDOC  WHERE DOCTYPE = DOC.DOCTYPE) ' +
        'DOC_NAME_,'
      
        '(SELECT NDSINSUMMA FROM SPRAV_BALANCE  WHERE BALANCE_KOD = DOC.B' +
        'ALANCE_KOD) NDSINSUMMA,'
      'TD.AREA_ID AREA_ID, TD.ADDRESS DK_ADDRESS, NNL.RECID TRANSIT,'
      'DL.IS_BANKET,'
      
        '(SELECT EXCISE_IN_SUMMA FROM SPRAV_OPER WHERE GROUP_OPER = DOC.G' +
        'ROUP_OPER AND KOD_OPER = DOC.KOD_OPER) EXCISE_IN_SUMMA,'
      'DOC.SOGL,'
      
        'case when (lr.recid is not null and lr.baseid is not null)or (so' +
        '.status in (1,2,27,209,22))'
      ' -- для возврата берем ОТ_КОГО'
      
        ' then (select first 1 DOC_NUMBER from PROC_GET_DK_DOCUMENT(doc.d' +
        'k_from,doc.operdate,2005,dl.outlet_recid,dl.outlet_baseid,1,doc.' +
        'ADDR_FROM) pg)'
      ' -- берем КОМУ'
      
        ' else (select first 1 DOC_NUMBER from PROC_GET_DK_DOCUMENT(doc.d' +
        'k_to,doc.operdate,2005,dl.outlet_recid,dl.outlet_baseid,1,doc.AD' +
        'DR_TO) pg)'
      'end as egais_kod_dk,'
      'coalesce(so.with_sum_transport, 0) with_sum_transport,'
      'snp.nas_p_name,'
      'nad.EGAIS_FIX_NUM_STR,'
      'spd_dt.dt  date_pdvstavka,'
      ''
      
        'nad.TRANSPORT_TIME --[gsa] 24.09.19 добавил по просьбе Maloletov' +
        '.M'
      ''
      'FROM DOC_NAKL DOC'
      
        'left join link_doc_opl ldo on (ldo.parent_recid = DOC.RECID AND ' +
        'ldo.parent_baseid= DOC.BASEID and ldo.opl_form_type = 7)'
      
        'left join GET_DATE_PDVSTAVKA(doc.recid, doc.baseid, doc.doctype)' +
        ' spd_dt on 1=1'
      
        'left join doc_gtd dg on (dg.recid = ldo.opl_recid and dg.baseid ' +
        '= ldo.opl_baseid)'
      
        'LEFT JOIN DELIVERY_LOCATION DL ON (DL.FORMTYPE=1 AND DL.BASEID=D' +
        'OC.BASEID AND  DL.DOCRECNO=DOC.RECID)'
      
        'LEFT JOIN SPRAV_DK_ADDRESS TD ON (TD.BASEID=DL.BASEID AND TD.REC' +
        'ID=DL.LOCRECNO)'
      
        'LEFT JOIN NAKL_NOT_LOAD NNL ON (NNL.RECID=DOC.RECID AND NNL.BASE' +
        'ID=DOC.BASEID)'
      
        'LEFT JOIN pdv_nakl PDVN on (PDVN.NAKL_RECID = DOC.RECID AND PDVN' +
        '.NAKL_BASEID = DOC.BASEID)'
      
        'left join SPRAV_OPER so on so.GROUP_OPER = DOC.GROUP_OPER AND so' +
        '.KOD_OPER = DOC.KOD_OPER'
      
        'left join link_doc_opl lr on (lr.opl_recid = DOC.RECID AND lr.op' +
        'l_baseid= DOC.BASEID and lr.opl_form_type = 1)'
      'left join sprav_cfo sc on (sc.kod_cfo=doc.cfo)'
      'left join sprav_nas_p snp on (snp.nas_p_id=sc.city)'
      
        'left join nakl_addition_prop nad on (nad.nakl_recid = doc.recid ' +
        'and nad.nakl_baseid = doc.baseid)'
      'WHERE DOC.RECID = ?RECID'
      'AND DOC.BASEID = ?BASEID')
    AfterOpen = DocNaklAfterOpen
    AfterPost = DocNaklAfterPost
    BeforeEdit = DocNaklBeforeEdit
    BeforePost = DocNaklBeforePost
    OnNewRecord = DocNaklNewRecord
    Transaction = Nakl_Transaction
    Database = DM.Money
    DefaultFormats.NumericEditFormat = '0'
    Key = 'RECID;BASEID'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    ConfirmPostMsg.Strings = (
      'Записать изменения ?')
    Left = 44
    Top = 336
    oNoForceIsNull = True
    object DocNaklOPERDATE: TDateTimeField
      FieldName = 'OPERDATE'
      OnChange = DocNaklOPERDATEChange
    end
    object DocNaklDOCTYPE: TFIBStringField
      FieldName = 'DOCTYPE'
      Size = 6
      EmptyStrToNull = True
    end
    object DocNaklDOCNUMBER: TIntegerField
      FieldName = 'DOCNUMBER'
    end
    object DocNaklDOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
    end
    object DocNaklKOD_OPER: TIntegerField
      FieldName = 'KOD_OPER'
      OnChange = DocNaklKOD_OPERChange
    end
    object DocNaklDK_FROM: TFloatField
      FieldName = 'DK_FROM'
      OnChange = DocNaklDK_FROMChange
      DisplayFormat = '#.'
      EditFormat = '#.'
    end
    object DocNaklGROUP_OPER: TIntegerField
      FieldName = 'GROUP_OPER'
    end
    object DocNaklDK_TO: TFloatField
      FieldName = 'DK_TO'
      OnChange = DocNaklDK_TOChange
      DisplayFormat = '#.'
      EditFormat = '#.'
    end
    object DocNaklKURS: TFloatField
      FieldName = 'KURS'
      OnChange = DocNaklPRICETYPE_Change
      DisplayFormat = ',0.####'
    end
    object DocNaklSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object DocNaklSUMMA1: TFloatField
      FieldName = 'SUMMA1'
      DisplayFormat = ',0.00'
    end
    object DocNaklNOTES: TFIBStringField
      FieldName = 'NOTES'
      Size = 255
      EmptyStrToNull = True
    end
    object DocNaklKOLICH_: TFloatField
      FieldName = 'KOLICH_'
    end
    object DocNaklFORMAOPL_: TIntegerField
      FieldName = 'FORMAOPL_'
    end
    object DocNaklPRICETYPE_: TIntegerField
      FieldName = 'PRICETYPE_'
      OnChange = DocNaklPRICETYPE_Change
    end
    object DocNaklBALANCE_KOD: TIntegerField
      FieldName = 'BALANCE_KOD'
    end
    object DocNaklV: TIntegerField
      FieldName = 'V'
    end
    object DocNaklV1: TIntegerField
      FieldName = 'V1'
      OnChange = DocNaklV1Change
    end
    object DocNaklNACENKA_: TFloatField
      FieldName = 'NACENKA_'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 3
    end
    object DocNaklPRICE_FROM_VALYUTA: TIntegerField
      FieldName = 'PRICE_FROM_VALYUTA'
    end
    object DocNaklSTATE: TIntegerField
      FieldName = 'STATE'
    end
    object DocNaklGROUP_NAME: TFIBStringField
      FieldName = 'GROUP_NAME'
      Size = 65
      EmptyStrToNull = True
    end
    object DocNaklNAME_OPER: TFIBStringField
      FieldName = 'NAME_OPER'
      Size = 70
      EmptyStrToNull = True
    end
    object DocNaklDK_FROM_NAME: TFIBStringField
      FieldName = 'DK_FROM_NAME'
      Size = 45
      EmptyStrToNull = True
    end
    object DocNaklDK_TO_NAME: TFIBStringField
      FieldName = 'DK_TO_NAME'
      Size = 45
      EmptyStrToNull = True
    end
    object DocNaklDOC_INHERITED: TIntegerField
      FieldName = 'DOC_INHERITED'
    end
    object DocNaklNDSINSUMMA: TIntegerField
      FieldName = 'NDSINSUMMA'
    end
    object DocNaklFOplName: TFIBStringField
      FieldKind = fkLookup
      FieldName = 'FOplName'
      LookupDataSet = DM.SPRAV_FOPL
      LookupKeyFields = 'KOD'
      LookupResultField = 'NAME'
      KeyFields = 'FORMAOPL_'
      Size = 50
      EmptyStrToNull = True
      Lookup = True
    end
    object DocNaklBASEID: TIntegerField
      FieldName = 'BASEID'
    end
    object DocNaklRECID: TIntegerField
      FieldName = 'RECID'
    end
    object DocNaklV_Name: TFIBStringField
      FieldKind = fkLookup
      FieldName = 'V_Name'
      LookupDataSet = DM.SPRAV_VALYUT
      LookupKeyFields = 'VALYUTA_KOD'
      LookupResultField = 'VALYUTA_SNAME'
      KeyFields = 'V'
      Size = 50
      EmptyStrToNull = True
      Lookup = True
    end
    object DocNaklPriceType: TFIBStringField
      FieldKind = fkLookup
      FieldName = 'PriceType'
      LookupDataSet = DM.PRICE_TYPES
      LookupKeyFields = 'PRICE_KOD'
      LookupResultField = 'PRICE_NAME'
      KeyFields = 'PRICETYPE_'
      Size = 50
      EmptyStrToNull = True
      Lookup = True
    end
    object DocNaklV1_Name: TFIBStringField
      FieldKind = fkLookup
      FieldName = 'V1_Name'
      LookupDataSet = DM.SPRAV_VALYUT
      LookupKeyFields = 'VALYUTA_KOD'
      LookupResultField = 'VALYUTA_SNAME'
      KeyFields = 'V1'
      Size = 50
      EmptyStrToNull = True
      Lookup = True
    end
    object DocNaklPRICE_MIN: TIntegerField
      FieldName = 'PRICE_MIN'
    end
    object DocNaklDK_C: TFloatField
      FieldName = 'DK_C'
      OnChange = DocNaklDK_CChange
      DisplayFormat = '#.'
      EditFormat = '#.'
    end
    object DocNaklDK_C_NAME: TFIBStringField
      FieldName = 'DK_C_NAME'
      Size = 45
      EmptyStrToNull = True
    end
    object DocNaklOTSR: TIntegerField
      FieldName = 'OTSR'
    end
    object DocNaklTRANSPORT: TFloatField
      FieldName = 'TRANSPORT'
      OnChange = DocNaklTRANSPORTChange
    end
    object DocNaklAREA_ID: TFIBStringField
      FieldName = 'AREA_ID'
      Size = 3
      EmptyStrToNull = True
    end
    object DocNaklDOC_NAME_: TFIBStringField
      FieldName = 'DOC_NAME_'
      Size = 50
      EmptyStrToNull = True
    end
    object DocNaklDK_TO_BASEID: TIntegerField
      FieldName = 'DK_TO_BASEID'
    end
    object DocNaklDK_ADDRESS: TFIBStringField
      FieldName = 'DK_ADDRESS'
      Size = 80
      EmptyStrToNull = True
    end
    object DocNaklTRANSIT: TIntegerField
      FieldName = 'TRANSIT'
    end
    object DocNaklCFO: TIntegerField
      FieldName = 'CFO'
    end
    object DocNaklPRESENT: TSmallintField
      FieldName = 'PRESENT'
    end
    object DocNaklLDO_RECID: TIntegerField
      FieldName = 'LDO_RECID'
    end
    object DocNaklLDO_BASEID: TIntegerField
      FieldName = 'LDO_BASEID'
    end
    object DocNaklDG_RECID: TIntegerField
      FieldName = 'DG_RECID'
    end
    object DocNaklDG_BASEID: TIntegerField
      FieldName = 'DG_BASEID'
    end
    object DocNaklDG_DOCNUMBER: TFIBStringField
      FieldName = 'DG_DOCNUMBER'
      Size = 40
      EmptyStrToNull = True
    end
    object DocNaklDG_NOTES: TFIBStringField
      FieldName = 'DG_NOTES'
      Size = 255
      EmptyStrToNull = True
    end
    object DocNaklSUFICS: TFIBStringField
      DisplayWidth = 17
      FieldName = 'SUFICS'
      Size = 15
      EmptyStrToNull = True
    end
    object DocNaklADDR_FROM: TIntegerField
      FieldName = 'ADDR_FROM'
    end
    object DocNaklADDR_TO: TIntegerField
      FieldName = 'ADDR_TO'
    end
    object DocNaklDOC_CREATOR: TFIBStringField
      FieldName = 'DOC_CREATOR'
      Size = 31
      EmptyStrToNull = True
    end
    object DocNaklIS_BANKET: TFIBSmallIntField
      FieldName = 'IS_BANKET'
      OnChange = DocNaklIS_BANKETChange
    end
    object DocNaklDK_TO_PRINT_WITH_VOZVRAT: TFIBSmallIntField
      FieldName = 'DK_TO_PRINT_WITH_VOZVRAT'
    end
    object DocNaklEXCISE_IN_SUMMA: TIntegerField
      FieldName = 'EXCISE_IN_SUMMA'
    end
    object DocNaklSOGL: TIntegerField
      FieldName = 'SOGL'
    end
    object DocNaklPARENT_DK_TO: TFIBFloatField
      FieldName = 'PARENT_DK_TO'
    end
    object DocNaklDK_TO_COUNTRY: TFIBIntegerField
      FieldName = 'DK_TO_COUNTRY'
    end
    object DocNaklUSE_PALLETE: TFIBIntegerField
      FieldName = 'USE_PALLETE'
    end
    object DocNaklREAL_OTSR: TIntegerField
      FieldName = 'REAL_OTSR'
    end
    object DocNaklZAYAVKA_ID: TFIBIntegerField
      FieldName = 'ZAYAVKA_ID'
    end
    object DocNaklSENDED_TO_OFFICE: TFIBIntegerField
      FieldName = 'SENDED_TO_OFFICE'
    end
    object DocNaklBRAND_CASE_ID: TFIBIntegerField
      FieldName = 'BRAND_CASE_ID'
    end
    object DocNaklDONT_USE_SPEC_PRICE: TFIBBooleanField
      DisplayLabel = 'Не использовать акционные цены'
      FieldName = 'DONT_USE_SPEC_PRICE'
      OnChange = DocNaklDONT_USE_SPEC_PRICEChange
    end
    object DocNaklCONTRACT_ID: TFIBFloatField
      FieldName = 'CONTRACT_ID'
    end
    object DocNaklEGAIS_KOD_DK: TFIBStringField
      FieldName = 'EGAIS_KOD_DK'
      Size = 30
      EmptyStrToNull = True
    end
    object DocNaklSUMMA_EXPORT: TFloatField
      FieldName = 'SUMMA_EXPORT'
    end
    object DocNaklWITH_SUM_TRANSPORT: TFIBIntegerField
      FieldName = 'WITH_SUM_TRANSPORT'
    end
    object DocNaklNAS_P_NAME: TFIBStringField
      FieldName = 'NAS_P_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object DocNaklDOC_CREATE: TDateTimeField
      FieldName = 'DOC_CREATE'
    end
    object DocNaklADDR_FROM_ID: TFIBIntegerField
      FieldName = 'ADDR_FROM_ID'
    end
    object DocNaklADDR_TO_ID: TFIBIntegerField
      FieldName = 'ADDR_TO_ID'
    end
    object DocNaklEGAIS_FIX_NUM_STR: TFIBStringField
      FieldName = 'EGAIS_FIX_NUM_STR'
      Size = 18
      EmptyStrToNull = True
    end
    object DocNaklPERCENT_DISCOUNT: TFIBFloatField
      FieldName = 'PERCENT_DISCOUNT'
    end
    object DocNaklDATE_PDVSTAVKA: TDateTimeField
      FieldName = 'DATE_PDVSTAVKA'
    end
  end
  object DocPos: TMegaRDataSet
    UpdateSQL.Strings = (
      'update DOC_NAKL_POS'
      'set'
      '  RECID = ?RECID,'
      '  BASEID = ?BASEID,'
      '  DOCRECNO = ?DOCRECNO,'
      '  KOD_MATER = ?KOD_MATER,'
      '  KOLICH = ?KOLICH,'
      '  SUMMA = ?SUMMA,'
      '  SUMMA1 = ?SUMMA1,'
      '  STATE = ?STATE,'
      '  IND_SUMMA = ?IND_SUMMA,'
      '  PDV = ?PDV,'
      '  IND = ?IND,'
      '  KOD_DK = ?KOD_DK,'
      '  GTD_4 = ?GTD_4,'
      '  PARTY = ?PARTY,'
      '  UKP = ?UKP,'
      '  DATE_ROZLIVA = ?DATE_ROZLIVA,'
      '  ARTICUL_PARTNER = ?ARTICUL_PARTNER, '
      '  INVOCE_NUMBER = ?INVOCE_NUMBER,'
      '  COUNT_PARTY = ?COUNT_PARTY,'
      '  SUMMA_DUTY = ?SUMMA_DUTY,'
      '  PACK_RECID = ?PACK_RECID,'
      '  SUMMA_AMOUNT_TRAFIC  = ?SUMMA_AMOUNT_TRAFIC'
      
        '  /*, EGAIS_ADD_NUM = ?EGAIS_ADD_NUM */  --<-- это условие будет' +
        ' измененно в коде для партионного учета 3'
      'where'
      '  RECID = ?old_RECID AND'
      '  BASEID = ?old_BASEID')
    DeleteSQL.Strings = (
      'delete from DOC_NAKL_POS'
      'where'
      '  RECID = ?old_RECID AND'
      '  BASEID = ?old_BASEID')
    InsertSQL.Strings = (
      'insert into DOC_NAKL_POS'
      '('
      '  RECID,'
      '  BASEID,'
      '  DOCRECNO,'
      '  KOD_MATER,'
      '  KOLICH,'
      '  SUMMA,'
      '  SUMMA1,'
      '  STATE,'
      '  IND_SUMMA,'
      '  IND,'
      '  PDV,'
      '  KOD_DK,'
      '  GTD_4,'
      '  PARTY,'
      '  UKP,'
      '  PACK_RECID,'
      '  DATE_ROZLIVA,'
      '  ARTICUL_PARTNER, '
      '  INVOCE_NUMBER,'
      '  COUNT_PARTY,'
      '  SUMMA_DUTY,'
      '  SUMMA_AMOUNT_TRAFIC'
      
        '  /*, EGAIS_ADD_NUM */  --<-- это условие будет измененно в коде' +
        ' для партионного учета 3'
      ')'
      'values'
      '('
      '  ?RECID,'
      '  ?BASEID,'
      '  ?DOCRECNO,'
      '  ?KOD_MATER,'
      '  ?KOLICH,'
      '  ?SUMMA,'
      '  ?SUMMA1,'
      '  ?STATE,'
      '  ?IND_SUMMA,'
      '  ?IND,'
      '  ?PDV,'
      '  ?KOD_DK,'
      '  ?GTD_4,'
      '  ?PARTY,'
      '  ?UKP,'
      '  ?PACK_RECID,'
      '  ?DATE_ROZLIVA,'
      '  ?ARTICUL_PARTNER, '
      '  ?INVOCE_NUMBER,'
      '  ?COUNT_PARTY,'
      '  ?SUMMA_DUTY,'
      '  ?SUMMA_AMOUNT_TRAFIC'
      
        '  /*, ?EGAIS_ADD_NUM */  --<-- это условие будет измененно в код' +
        'е для партионного учета 3'
      ')'
      ' ')
    RefreshSQL.Strings = (
      
        'select POS.*, MATER.*, SPRAV_PDVGROUP.PDVGROUP_STAVKA, smg.NAME ' +
        'as SPRAV_MATER_CATEGORY_NAME'
      
        ', GROUP_MATER.GROUP_NAME, GROUP_MATER.OTSR OTSR ,GROUP_MATER.OTS' +
        'R_PRIOR OTSR_PRIOR, GROUP_MATER.TVID_KOD TVID_KOD, GROUP_MATER.C' +
        'OL COL1'
      
        ',(SELECT COUNT(*) FROM PRICE_KOLICH WHERE GROUP_MATER=MATER.GROU' +
        'P_MATER) PRICE_KOL,'
      'get_docs_mater.cnt MAT_DOC,'
      
        '(select sd.name_dk from sprav_dk sd where sd.kod_dk=pos.kod_dk) ' +
        'as name_dk,'
      'ges.result as excise,'
      'dp.date_part'
      
        ',coalesce(MATER.sname_kassa,MATER.shortname_mater) NAME_MATER_KA' +
        'S'
      ', dg.docnumber as GDOCUMENT'
      ', dpp.DOC_GTD_RECID, dpp.DOC_GTD_BASEID'
      'from DOC_NAKL_POS POS'
      
        'left join  SPRAV_MATER MATER on (  POS.KOD_MATER = MATER.KOD_MAT' +
        'ER) left join SPRAV_MATER_CATEGORY smg on smg.ID=MATER.ACTIVE_'
      
        'left join SPRAV_PDVGROUP on (POS.PDV=SPRAV_PDVGROUP.PDVGROUP_KOD' +
        ')'
      
        'left join  GROUP_MATER on (GROUP_MATER.GROUP_MATER = MATER.GROUP' +
        '_MATER)'
      'left join get_docs_mater(pos.kod_mater, :OLD_OPERDATE) on (1=1)'
      
        'left join GET_EXCISE_STAVKA(pos.kod_mater,:operdate,:V) ges on (' +
        '1=1)'
      'left join doc_party dp on (dp.number=pos.party)'
      
        'left join DOC_NAKL_POS_ADD_PROP dpp on pos.recid=dpp.recid and d' +
        'pp.baseid=pos.baseid'
      
        'left join doc_gtd dg on dg.recid=dpp.doc_gtd_recid and dg.baseid' +
        '=dpp.doc_gtd_baseid'
      'WHERE'
      '  POS.RECID = :OLD_RECID AND POS.BASEID = :OLD_BASEID')
    SelectSQL.Strings = (
      
        'select POS.*, MATER.COUNTINBOX COUNTINBOX_, MATER.*, spd.PDVGROU' +
        'P_STAVKA, grm.GROUP_NAME, smg.NAME as SPRAV_MATER_CATEGORY_NAME'
      
        ', grm.OTSR OTSR ,grm.OTSR_PRIOR OTSR_PRIOR, grm.TVID_KOD TVID_KO' +
        'D'
      ', grm.COL COL1,'
      
        '(SELECT COUNT(*) FROM PRICE_KOLICH WHERE GROUP_MATER=MATER.GROUP' +
        '_MATER) PRICE_KOL,'
      'gdm.cnt MAT_DOC,'
      
        '(select sd.name_dk from sprav_dk sd where sd.kod_dk=pos.kod_dk) ' +
        'as name_dk,'
      'ges.result as excise,'
      'dp.date_part,'
      '0 checked'
      
        ',coalesce(MATER.sname_kassa,MATER.shortname_mater) NAME_MATER_KA' +
        'S'
      ''
      ', dg.docnumber as GDOCUMENT'
      ', dpp.DOC_GTD_RECID, dpp.DOC_GTD_BASEID,'
      'sva.code'
      ''
      'from'
      '-- DOC_NAKL dn '
      '--left join'
      
        ' DOC_NAKL_POS POS --on pos.docrecno=dn.recid and pos.baseid=dn.b' +
        'aseid'
      
        'left join  SPRAV_MATER MATER on (POS.KOD_MATER = MATER.KOD_MATER' +
        ') left join SPRAV_MATER_CATEGORY smg on smg.ID=MATER.ACTIVE_'
      
        'left join doc_nakl dn on dn.recid = pos.docrecno and dn.baseid=p' +
        'os.baseid'
      '--left join  SPRAV_PDVGROUP spd on (POS.PDV=spd.PDVGROUP_KOD)'
      
        'left join GET_DATE_PDVSTAVKA(pos.docrecno, pos.baseid, dn.doctyp' +
        'e) spd_dt on 1=1'
      
        'left join GET_PDV_STAVKA_BALANCE(dn.balance_kod, spd_dt.dt, POS.' +
        'PDV) spd on 1=1'
      
        'left join  GROUP_MATER grm on (grm.GROUP_MATER = mater.GROUP_MAT' +
        'ER)'
      'left join get_docs_mater(pos.kod_mater,:docdate) gdm on (1=1)'
      
        'left join GET_EXCISE_STAVKA(pos.kod_mater,:docdate,:V,pos.docrec' +
        'no,pos.baseid,:DOCTYPE) ges on (1=1) '
      'left join doc_party dp on (dp.number=pos.party)'
      ''
      
        'left join DOC_NAKL_POS_ADD_PROP dpp on pos.recid=dpp.recid and d' +
        'pp.baseid=pos.baseid'
      
        'left join doc_gtd dg on dg.recid=dpp.doc_gtd_recid and dg.baseid' +
        '=dpp.doc_gtd_baseid'
      'left join sprav_vid_alc sva on sva.vid_id=mater.sm_vid_alc'
      'WHERE'
      '  POS.DOCRECNO = :RECID AND POS.BASEID  = :BASEID'
      '--  dn.recid=:recid and dn.baseid=:baseid'
      'ORDER BY'
      '  grm.TVID_KOD,'
      
        '  UPPER(cast(grm.GROUP_NAME as VARCHAR(35) CHARACTER SET WIN1251' +
        ')),'
      '  MATER.SM_NETTO,'
      '  MATER.NAME_MATER, '
      '  POS.KOLICH DESC')
    AfterClose = DocPosAfterClose
    AfterDelete = DocPosAfterDelete
    AfterOpen = DocPosAfterOpen
    AfterPost = DocPosAfterPost
    BeforeDelete = DocPosBeforeDelete
    BeforePost = DocPosBeforePost
    OnCalcFields = DocPosCalcFields
    OnNewRecord = DocPosNewRecord
    Transaction = Nakl_Transaction
    Database = DM.Money
    DataSource = Source
    DefaultFormats.NumericEditFormat = '0'
    Key = 'RECID;BASEID'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = True
    ConfirmDelete = True
    ConfirmDeleteMsg.Strings = (
      'Удалить позицию в накладной ?')
    ConfirmPostMsg.Strings = (
      'Сохранить позицию в накладной ?')
    Left = 224
    Top = 304
    dcForceOpen = True
    oNoForceIsNull = True
    object DocPosKOD_MATER: TFloatField
      FieldName = 'KOD_MATER'
      Origin = 'DOC_NAKL_POS.KOD_MATER'
      OnChange = DocPosKOD_MATERChange
      DisplayFormat = '#.'
    end
    object DocPosPDV: TFIBStringField
      FieldName = 'PDV'
      Origin = 'DOC_NAKL_POS.PDV'
      Size = 1
      EmptyStrToNull = True
    end
    object DocPosED_IZM: TFIBStringField
      FieldName = 'ED_IZM'
      Origin = 'SPRAV_MATER.ED_IZM'
      Size = 5
      EmptyStrToNull = True
    end
    object DocPosKOLICH: TFloatField
      FieldName = 'KOLICH'
      Origin = 'DOC_NAKL_POS.KOLICH'
      DisplayFormat = '#.##'
    end
    object DocPosNAME_MATER: TFIBStringField
      FieldName = 'NAME_MATER'
      Origin = 'SPRAV_MATER.NAME_MATER'
      Size = 45
      EmptyStrToNull = True
    end
    object DocPosBoxcount: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Boxcount'
      Origin = 'CALCULATED.Boxcount'
      DisplayFormat = '0.####'
      Calculated = True
    end
    object DocPosPrice1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Price1'
      Origin = 'CALCULATED.Price1'
      DisplayFormat = ',0.0000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'DOC_NAKL_POS.SUMMA'
      DisplayFormat = ',0.000'
    end
    object DocPosPrice2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Price2'
      Origin = 'CALCULATED.Price2'
      DisplayFormat = ',0.0000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosSUMMA1: TFloatField
      FieldName = 'SUMMA1'
      Origin = 'DOC_NAKL_POS.SUMMA1'
      DisplayFormat = ',0.000'
    end
    object DocPosTOSALE: TIntegerField
      FieldName = 'TOSALE'
      Origin = 'SPRAV_MATER.TOSALE'
    end
    object DocPosLOCAL_KOD: TIntegerField
      FieldName = 'LOCAL_KOD'
      Origin = 'SPRAV_MATER.LOCAL_KOD'
      OnChange = DocPosKOD_MATERChange
    end
    object DocPosSTATE: TIntegerField
      FieldName = 'STATE'
      Origin = 'DOC_NAKL_POS.STATE'
    end
    object DocPosBASEID: TIntegerField
      FieldName = 'BASEID'
      Origin = 'DOC_NAKL_POS.BASEID'
    end
    object DocPosGROUP_MATER: TIntegerField
      FieldName = 'GROUP_MATER'
      Origin = 'SPRAV_MATER.GROUP_MATER'
    end
    object DocPosCOUNTINBOX_: TIntegerField
      FieldName = 'COUNTINBOX_'
      Origin = 'SPRAV_MATER.COUNTINBOX'
    end
    object DocPosCOUNTINBOX_METRO: TIntegerField
      FieldName = 'COUNTINBOX_METRO'
      Origin = 'SPRAV_MATER.COUNTINBOX_METRO'
    end
    object DocPosCOUNTINBOX: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'COUNTINBOX'
      Origin = 'CALCULATED.COUNTINBOX'
      Calculated = True
    end
    object DocPosDESCRIPTION: TFIBStringField
      FieldName = 'DESCRIPTION'
      Origin = 'SPRAV_MATER.DESCRIPTION'
      Size = 255
      EmptyStrToNull = True
    end
    object DocPosVALYUTA: TIntegerField
      FieldName = 'VALYUTA'
      Origin = 'SPRAV_MATER.VALYUTA'
    end
    object DocPosRest: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Rest'
      Origin = 'CALCULATED.Rest'
      DisplayFormat = '0.###'
      EditFormat = '0.000'
      Calculated = True
    end
    object DocPosRECID: TIntegerField
      FieldName = 'RECID'
      Origin = 'DOC_NAKL_POS.RECID'
    end
    object DocPosDOCRECNO: TIntegerField
      FieldName = 'DOCRECNO'
      Origin = 'DOC_NAKL_POS.DOCRECNO'
    end
    object DocPosSumma2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Summa2'
      Origin = 'CALCULATED.Summa2'
      DisplayFormat = ',0.000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosSumma3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Summa3'
      Origin = 'CALCULATED.Summa3'
      DisplayFormat = ',0.000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosPrice1_: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Price1_'
      Origin = 'CALCULATED.Price1_'
      DisplayFormat = ',0.0000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosPrice2_: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Price2_'
      Origin = 'CALCULATED.Price2_'
      DisplayFormat = ',0.0000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosBeginRest: TFloatField
      FieldKind = fkCalculated
      FieldName = 'BeginRest'
      Origin = 'CALCULATED.BeginRest'
      DisplayFormat = '#,###0.'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosIND: TIntegerField
      FieldName = 'IND'
      Origin = 'DOC_NAKL_POS.IND'
      DisplayFormat = ',0.00'
    end
    object DocPosIND_SUMMA: TFloatField
      FieldName = 'IND_SUMMA'
      Origin = 'DOC_NAKL_POS.IND_SUMMA'
      DisplayFormat = ',0.00'
    end
    object DocPosSUMMAWPDV: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUMMAWPDV'
      Origin = 'CALCULATED.SUMMAWPDV'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object DocPosPRICEWPDV: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRICEWPDV'
      Origin = 'CALCULATED.PRICEWPDV'
      DisplayFormat = ',0.0000'
      Calculated = True
    end
    object DocPosPDVGROUP_STAVKA: TFloatField
      FieldName = 'PDVGROUP_STAVKA'
      Origin = 'SPRAV_PDVGROUP.PDVGROUP_STAVKA'
    end
    object DocPosIND_PRICE: TFloatField
      FieldName = 'IND_PRICE'
      Origin = 'DOC_NAKL_POS.IND_PRICE'
      DisplayFormat = ',0.0000'
    end
    object DocPosTARA_MATER: TFloatField
      FieldName = 'TARA_MATER'
      Origin = 'SPRAV_MATER.TARA_MATER'
    end
    object DocPosTRIGGER_OFF: TIntegerField
      FieldName = 'TRIGGER_OFF'
      Origin = 'DOC_NAKL_POS.TRIGGER_OFF'
    end
    object DocPosOTSR: TIntegerField
      FieldName = 'OTSR'
      Origin = 'GROUP_MATER.OTSR'
    end
    object DocPosOTSR_PRIOR: TIntegerField
      FieldName = 'OTSR_PRIOR'
      Origin = 'GROUP_MATER.OTSR_PRIOR'
    end
    object DocPosRealPrice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RealPrice'
      Origin = 'CALCULATED.RealPrice'
      DisplayFormat = ',0.0000'
      Calculated = True
    end
    object DocPosOptPrice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OptPrice'
      LookupDataSet = PriceControlData
      LookupKeyFields = 'KOD_MATER'
      LookupResultField = 'OPT_PRICE'
      KeyFields = 'KOD_MATER'
      Origin = 'CALCULATED.OptPrice'
      Calculated = True
    end
    object DocPosTVID_KOD: TIntegerField
      FieldName = 'TVID_KOD'
      Origin = 'GROUP_MATER.TVID_KOD'
    end
    object DocPosCOL: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'COL'
      Origin = 'CALCULATED.COL'
      DisplayFormat = '#'
      Calculated = True
    end
    object DocPosCOL_CHECK_WITH: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'COL_CHECK_WITH'
      Origin = 'CALCULATED.COL_CHECK_WITH'
      Calculated = True
    end
    object DocPosCOL1: TIntegerField
      FieldName = 'COL1'
      Origin = 'GROUP_MATER.COL'
    end
    object DocPosKOD_EAN: TFloatField
      FieldName = 'KOD_EAN'
      Origin = 'SPRAV_MATER.KOD_EAN'
      DisplayFormat = '#.'
    end
    object DocPosACTIVE_: TIntegerField
      FieldName = 'ACTIVE_'
      Origin = 'SPRAV_MATER.ACTIVE_'
    end
    object DocPosPRICE_KOL: TIntegerField
      FieldName = 'PRICE_KOL'
    end
    object DocPosINVENTAR_NUMBER: TFloatField
      FieldName = 'INVENTAR_NUMBER'
      Origin = 'SPRAV_MATER.INVENTAR_NUMBER'
      OnChange = DocPosKOD_MATERChange
    end
    object DocPosMADEIN: TIntegerField
      FieldName = 'MADEIN'
      Origin = 'SPRAV_MATER.MADEIN'
    end
    object DocPosIS_SERTIF: TIntegerField
      FieldName = 'IS_SERTIF'
      Origin = 'SPRAV_MATER.IS_SERTIF'
    end
    object DocPosMAT_DOC: TIntegerField
      FieldName = 'MAT_DOC'
      Origin = 'GET_DOCS_MATER.CNT'
    end
    object DocPosKOD_DK: TFIBFloatField
      FieldName = 'KOD_DK'
      Origin = 'DOC_NAKL_POS.KOD_DK'
    end
    object DocPosNAME_DK: TFIBStringField
      FieldName = 'NAME_DK'
      Size = 90
      EmptyStrToNull = True
    end
    object DocPosGTD_4: TSmallintField
      FieldName = 'GTD_4'
      Origin = 'DOC_NAKL_POS.GTD_4'
    end
    object DocPosEXCISE: TFIBFloatField
      FieldName = 'EXCISE'
      Origin = 'GET_EXCISE_STAVKA.RESULT'
      DisplayFormat = ',0.00'
    end
    object DocPosEXCISE_SUM: TFIBFloatField
      FieldKind = fkCalculated
      FieldName = 'EXCISE_SUM'
      Origin = 'CALCULATED.EXCISE_SUM'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object DocPosPARTY: TFIBStringField
      FieldName = 'PARTY'
      Origin = 'DOC_NAKL_POS.PARTY'
      Size = 100
      EmptyStrToNull = True
    end
    object DocPosdate_part: TFIBDateTimeField
      FieldName = 'date_part'
      Origin = 'DOC_PARTY.DATE_PART'
    end
    object DocPosUKP: TFloatField
      FieldName = 'UKP'
      Origin = 'DOC_NAKL_POS.UKP'
    end
    object DocPosPACK_RECID: TFIBIntegerField
      FieldName = 'PACK_RECID'
      Origin = 'DOC_NAKL_POS.PACK_RECID'
    end
    object DocPosPARTY_RECID: TFIBIntegerField
      FieldName = 'PARTY_RECID'
    end
    object DocPosPARTY_BASEID: TFIBIntegerField
      FieldName = 'PARTY_BASEID'
    end
    object DocPosDATE_ROZLIVA: TFIBDateTimeField
      FieldName = 'DATE_ROZLIVA'
    end
    object DocPosINVOCE_NUMBER: TFIBStringField
      FieldName = 'INVOCE_NUMBER'
      Size = 40
      EmptyStrToNull = True
    end
    object DocPosARTICUL_PARTNER: TFIBStringField
      FieldName = 'ARTICUL_PARTNER'
      Size = 50
      EmptyStrToNull = True
    end
    object DocPosSKIDKA: TFIBFloatField
      FieldName = 'SKIDKA'
    end
    object DocPosSKIDKA_WITH_PDV: TFIBFloatField
      FieldKind = fkCalculated
      FieldName = 'SKIDKA_WITH_PDV'
      Calculated = True
    end
    object DocPosPRICE_PREV: TFIBFloatField
      FieldKind = fkCalculated
      FieldName = 'PRICE_PREV'
      Calculated = True
    end
    object DocPosDATE_AKCIZ_FIX: TFIBDateTimeField
      FieldName = 'DATE_AKCIZ_FIX'
    end
    object DocPosNUMB_AKCIZ_FIX: TFIBStringField
      FieldName = 'NUMB_AKCIZ_FIX'
      Size = 40
      EmptyStrToNull = True
    end
    object DocPosPrice_box: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Price_box'
      DisplayFormat = ',0.0000'
      Calculated = True
    end
    object DocPosCOUNT_PARTY: TIntegerField
      FieldName = 'COUNT_PARTY'
    end
    object DocPosSUMMA_DUTY: TFloatField
      FieldName = 'SUMMA_DUTY'
      DisplayFormat = ',0.000'
    end
    object DocPosSUMMA_AMOUNT_TRAFIC: TFloatField
      FieldName = 'SUMMA_AMOUNT_TRAFIC'
      DisplayFormat = ',0.000'
    end
    object DocPosGROUP_NAME: TMegaStringField
      FieldName = 'GROUP_NAME'
      Size = 35
      EmptyStrToNull = True
    end
    object DocPosCHECKED: TIntegerField
      FieldName = 'CHECKED'
    end
    object DocPosNAME_MATER_KAS: TFIBStringField
      FieldName = 'NAME_MATER_KAS'
      Size = 45
      EmptyStrToNull = True
    end
    object DocPosALCOHOL_PERCENT: TFloatField
      FieldName = 'ALCOHOL_PERCENT'
    end
    object DocPosFIXED_PRICE: TFIBFloatField
      FieldName = 'FIXED_PRICE'
    end
    object DocPosSPRAV_MATER_CATEGORY_NAME: TMegaStringField
      FieldName = 'SPRAV_MATER_CATEGORY_NAME'
      EmptyStrToNull = True
    end
    object strngfldListsDocPosGDOCUMENT: TMegaStringField
      FieldName = 'GDOCUMENT'
      EmptyStrToNull = True
    end
    object intgrfldDEBET_KOD_MATERDocPosDOC_GTD_RECID: TIntegerField
      FieldName = 'DOC_GTD_RECID'
    end
    object intgrfldDEBET_KOD_MATERDocPosDOC_GTD_BASEID: TIntegerField
      FieldName = 'DOC_GTD_BASEID'
    end
    object DocPoscode: TFIBStringField
      FieldName = 'code'
      EmptyStrToNull = True
    end
    object DocPosCOUNT_PACK_BOX: TIntegerField
      FieldName = 'COUNT_PACK_BOX'
    end
  end
  object pmPrintRu: TPopupMenu
    OnPopup = pmPrintPopup
    Left = 360
    Top = 572
    object MenuItem1: TMenuItem
      Action = PrintNakl
      Left = 12345
    end
    object N81: TMenuItem
      Action = actPrintNaklVozvrat
      Left = 12345
    end
    object PrintNakl2_With_Vozvrat: TMenuItem
      Action = PrintNaklWithVozvrat
      Left = 12345
    end
    object MenuItem2: TMenuItem
      Action = actPrintTTN
      Left = 12345
    end
    object G2: TMenuItem
      Action = actPrintTTN2
      Left = 12345
    end
    object MenuItem4: TMenuItem
      Action = PrintInternal
      Left = 12345
    end
    object MenuItem3: TMenuItem
      Action = aPrintProver
      Left = 12345
    end
    object N57: TMenuItem
      Caption = 'Безреквизитная накладная'
      OnClick = N57Click
      Left = 12345
    end
    object ItemTorg3: TMenuItem
      Caption = 'Акт о расхождениях при импорте (Торг-3)'
      OnClick = ItemTorg3Click
      Left = 12345
    end
    object MenuItem5_Torg2: TMenuItem
      Caption = 'Акт о расхождениях (Торг-2)'
      OnClick = MenuItem5_Torg2Click
      Left = 12345
    end
    object Torg2ForClient: TMenuItem
      Caption = 'Акт о расхождениях (Торг-2) (для клиентов)'
      OnClick = Torg2ForClientClick
      Left = 12345
    end
    object ItemTorg13: TMenuItem
      Action = actPrintTorg13
      Left = 12345
    end
    object ItemTorg15: TMenuItem
      Action = actPrintTorg15
      Left = 12345
    end
    object ItemTorg16: TMenuItem
      Action = actPrintTorg16
      Left = 12345
    end
    object ItemSoprToTN: TMenuItem
      Action = actPrintSoprDToTN
      Left = 12345
    end
    object ItemSbToTTN: TMenuItem
      Action = actPrintRbToTTN
      Caption = 'Печать сопроводительной ведости (бывший раздел Б)'
      Left = 12345
    end
    object N91: TMenuItem
      Caption = 'Печать сопроводительной ведости (МЕТРО)'
      OnClick = N91Click
      Left = 12345
    end
    object N22: TMenuItem
      Action = actPrintSpravkaB
      Left = 12345
    end
    object ItemToShetR: TMenuItem
      Action = actPrintSchetR
      Left = 12345
    end
    object ItemsOS: TMenuItem
      Caption = 'по Основным средствам'
      Left = 12345
      object ItemOC1: TMenuItem
        Action = actPrintOC1
        Left = 12345
      end
      object ItemOC2: TMenuItem
        Action = actPrintOC2
        Left = 12345
      end
      object ItemOC4: TMenuItem
        Action = actPrintOC4
        Left = 12345
      end
      object ItemOC4a: TMenuItem
        Action = actPrintOC4a
        Left = 12345
      end
    end
    object ItemsTMC: TMenuItem
      Caption = 'по учету ТМЦ'
      Left = 12345
      object ItemM4: TMenuItem
        Action = actPrintM4
        Left = 12345
      end
      object ItemM11: TMenuItem
        Action = actPrintM11
        Left = 12345
      end
      object ItemMB7: TMenuItem
        Action = actPrintMB7
        Left = 12345
      end
      object ItemMX_3: TMenuItem
        Action = actPrintMx3
        Left = 12345
      end
      object ItemMX_1: TMenuItem
        Action = actPrintMx1
        Left = 12345
      end
      object N41: TMenuItem
        Caption = 'Акт о приеме-передаче ТМЦ (изм.)'
        OnClick = N41Click
        Left = 12345
      end
    end
    object N42: TMenuItem
      Action = actPrintActR
      Left = 12345
    end
    object N82: TMenuItem
      Action = actActPP
      Left = 12345
    end
    object N73: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N55: TMenuItem
      Action = actPrinRealRus
      Left = 12345
    end
    object actPrintMETRO1: TMenuItem
      Action = actPrintMETRO
      Left = 12345
    end
    object miBilla: TMenuItem
      Caption = 'Печать накладной (БИЛЛА)'
      OnClick = PrintNaklExecute
      Left = 12345
    end
    object N74: TMenuItem
      Action = actPrintActRekl_Ru
      Left = 12345
    end
    object N106: TMenuItem
      Action = actPrintActMaterial
      Left = 12345
    end
    object N76: TMenuItem
      Action = actPrintGtdLinks
      Left = 12345
    end
    object miOKK_OLD: TMenuItem
      Caption = 'Документы ОКК (старый вариант)'
      Visible = False
      Left = 12345
      object N79: TMenuItem
        Action = actGovQuality
        Left = 12345
      end
      object N80: TMenuItem
        Caption = '-'
        Left = 12345
      end
      object N77: TMenuItem
        Action = actPrintNaklImages
        Left = 12345
      end
    end
    object miOKK: TMenuItem
      Caption = 'Документы ОКК'
      OnClick = miOKKClick
      Left = 12345
    end
    object N121: TMenuItem
      Action = actNaklVoronezh
      Left = 12345
    end
    object N88: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N89: TMenuItem
      Action = actPrintBirka
      Left = 12345
    end
    object G1: TMenuItem
      Caption = 'Приложение к накладной (Ярославль, Владивосток, Ростов)'
      OnClick = G1Click
      Left = 12345
    end
    object N101: TMenuItem
      Caption = 'Печать счёта-оферты'
      OnClick = N101Click
      Left = 12345
    end
    object N104: TMenuItem
      Action = actPrintEANBox
      Left = 12345
    end
    object L1: TMenuItem
      Caption = 'Документы на региональную сертификацию'
      Left = 12345
      object N108: TMenuItem
        Action = acPrintSertifKrasnoyarsk
        Left = 12345
      end
      object N107: TMenuItem
        Action = acPrintSertif
        Caption = 'Краснодар'
        Hint = 'Документы на сертификацию Краснодар'
        Left = 12345
      end
      object N109: TMenuItem
        Caption = 'Ростов'
        Left = 12345
        object N110: TMenuItem
          Action = acPrintSertifRostov
          Left = 12345
        end
        object N111: TMenuItem
          Action = acPrintSertifPostovDate
          Left = 12345
        end
        object Excel1: TMenuItem
          Action = acPrintSertifRostovExcel
          Left = 12345
        end
      end
      object N112: TMenuItem
        Action = acPrintSertifVoroneg
        Left = 12345
      end
      object N51: TMenuItem
        Action = acPrintSertifKazan
        Left = 12345
      end
      object N53: TMenuItem
        Action = acPrintSertifYaroslavl
        Left = 12345
      end
    end
    object N125: TMenuItem
      Action = actPrintMarkTara
      Left = 12345
    end
  end
  object DocPosForENakl: TMegaRDataSet
    SelectSQL.Strings = (
      'select POS.*, MATER.*, spd.PDVGROUP_STAVKA, grm.GROUP_NAME,'
      'grm.OTSR OTSR ,grm.OTSR_PRIOR OTSR_PRIOR, grm.TVID_KOD TVID_KOD,'
      'grm.COL COL1,'
      
        '(SELECT COUNT(*) FROM PRICE_KOLICH WHERE GROUP_MATER=MATER.GROUP' +
        '_MATER) PRICE_KOL,'
      'gdm.cnt MAT_DOC,'
      
        'dn.operdate,dn.docnumber,dl.outlet_recid||'#39#39'||dl.outlet_baseid l' +
        'ocation, dn.dk_to,dn.dk_from'
      'from doc_nakl dn'
      
        'left join DOC_NAKL_POS POS on (pos.docrecno = dn.recid and pos.b' +
        'aseid = dn.baseid)'
      
        'left join  SPRAV_MATER MATER on (POS.KOD_MATER = MATER.KOD_MATER' +
        ')'
      'left join  SPRAV_PDVGROUP spd on (POS.PDV=spd.PDVGROUP_KOD)'
      
        'left join  GROUP_MATER grm on (grm.GROUP_MATER = mater.GROUP_MAT' +
        'ER)'
      'left join get_docs_mater(pos.kod_mater,dn.OPERDATE) gdm on (1=1)'
      
        'left join delivery_location dl on (dl.formtype=1 and dl.docrecno' +
        ' = dn.recid and dl.baseid = dn.baseid)'
      'WHERE'
      '  --POS.DOCRECNO = :RECID AND POS.BASEID  = :BASEID'
      '  dn.recid =  :RECID AND dn.BASEID  = :BASEID'
      'ORDER BY'
      '  grm.TVID_KOD,'
      '  grm.GROUP_NAME,'
      '  MATER.SORT_ORDER,'
      '  MATER.SM_NETTO,'
      '  MATER.NAME_MATER, '
      '  POS.KOLICH DESC')
    OnCalcFields = DocPosForENaklCalcFields
    Transaction = Nakl_Transaction
    Database = DM.Money
    DataSource = Source
    DefaultFormats.NumericEditFormat = '0'
    Key = 'RECID;BASEID'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 384
    Top = 295
    object DocPosForENaklKOD_MATER: TFloatField
      FieldName = 'KOD_MATER'
      OnChange = DocPosKOD_MATERChange
    end
    object DocPosForENaklPDV: TFIBStringField
      FieldName = 'PDV'
      Size = 1
      EmptyStrToNull = True
    end
    object DocPosForENaklED_IZM: TFIBStringField
      FieldName = 'ED_IZM'
      Size = 5
      EmptyStrToNull = True
    end
    object DocPosForENaklKOLICH: TFloatField
      FieldName = 'KOLICH'
    end
    object DocPosForENaklNAME_MATER: TFIBStringField
      FieldName = 'NAME_MATER'
      Size = 45
      EmptyStrToNull = True
    end
    object DocPosForENaklBoxcount: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Boxcount'
      DisplayFormat = '0.0'
      EditFormat = '0.0'
      Calculated = True
    end
    object DocPosForENaklPrice1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Price1'
      DisplayFormat = ',0.0000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosForENaklSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.000'
    end
    object DocPosForENaklPrice2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Price2'
      DisplayFormat = ',0.0000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosForENaklSUMMA1: TFloatField
      FieldName = 'SUMMA1'
      DisplayFormat = ',0.000'
    end
    object DocPosForENaklTOSALE: TIntegerField
      FieldName = 'TOSALE'
    end
    object DocPosForENaklLOCAL_KOD: TIntegerField
      FieldName = 'LOCAL_KOD'
      OnChange = DocPosKOD_MATERChange
    end
    object DocPosForENaklSTATE: TIntegerField
      FieldName = 'STATE'
    end
    object DocPosForENaklBASEID: TIntegerField
      FieldName = 'BASEID'
    end
    object DocPosForENaklGROUP_MATER: TIntegerField
      FieldName = 'GROUP_MATER'
    end
    object DocPosForENaklCOUNTINBOX: TIntegerField
      FieldName = 'COUNTINBOX'
    end
    object DocPosForENaklDESCRIPTION: TFIBStringField
      FieldName = 'DESCRIPTION'
      Size = 255
      EmptyStrToNull = True
    end
    object DocPosForENaklVALYUTA: TIntegerField
      FieldName = 'VALYUTA'
    end
    object DocPosForENaklRest: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Rest'
      DisplayFormat = '0.###'
      EditFormat = '0.000'
      Calculated = True
    end
    object DocPosForENaklRECID: TIntegerField
      FieldName = 'RECID'
    end
    object DocPosForENaklDOCRECNO: TIntegerField
      FieldName = 'DOCRECNO'
    end
    object DocPosForENaklSumma2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Summa2'
      DisplayFormat = ',0.000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosForENaklSumma3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Summa3'
      DisplayFormat = ',0.000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosForENaklPrice1_: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Price1_'
      DisplayFormat = ',0.0000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosForENaklPrice2_: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Price2_'
      DisplayFormat = ',0.0000'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosForENaklBeginRest: TFloatField
      FieldKind = fkCalculated
      FieldName = 'BeginRest'
      DisplayFormat = '#,###0.'
      EditFormat = '0.'
      Calculated = True
    end
    object DocPosForENaklIND: TIntegerField
      FieldName = 'IND'
      DisplayFormat = ',0.00'
    end
    object DocPosForENaklIND_SUMMA: TFloatField
      FieldName = 'IND_SUMMA'
      DisplayFormat = ',0.00'
    end
    object DocPosForENaklSUMMAWPDV: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUMMAWPDV'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object DocPosForENaklPRICEWPDV: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRICEWPDV'
      DisplayFormat = ',0.0000'
      Calculated = True
    end
    object DocPosForENaklPDVGROUP_STAVKA: TFloatField
      FieldName = 'PDVGROUP_STAVKA'
    end
    object DocPosForENaklIND_PRICE: TFloatField
      FieldName = 'IND_PRICE'
      DisplayFormat = ',0.0000'
    end
    object DocPosForENaklTARA_MATER: TFloatField
      FieldName = 'TARA_MATER'
    end
    object DocPosForENaklTRIGGER_OFF: TIntegerField
      FieldName = 'TRIGGER_OFF'
    end
    object DocPosForENaklOTSR: TIntegerField
      FieldName = 'OTSR'
    end
    object DocPosForENaklOTSR_PRIOR: TIntegerField
      FieldName = 'OTSR_PRIOR'
    end
    object DocPosForENaklRealPrice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RealPrice'
      DisplayFormat = ',0.0000'
      Calculated = True
    end
    object DocPosForENaklOptPrice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OptPrice'
      LookupDataSet = PriceControlData
      LookupKeyFields = 'KOD_MATER'
      LookupResultField = 'OPT_PRICE'
      KeyFields = 'KOD_MATER'
      Calculated = True
    end
    object DocPosForENaklTVID_KOD: TIntegerField
      FieldName = 'TVID_KOD'
    end
    object DocPosForENaklCOL: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'COL'
      DisplayFormat = '#'
      Calculated = True
    end
    object DocPosForENaklCOL1: TIntegerField
      FieldName = 'COL1'
    end
    object DocPosForENaklKOD_EAN: TFloatField
      FieldName = 'KOD_EAN'
    end
    object DocPosForENaklACTIVE_: TIntegerField
      FieldName = 'ACTIVE_'
    end
    object DocPosForENaklPRICE_KOL: TIntegerField
      FieldName = 'PRICE_KOL'
    end
    object DocPosForENaklINVENTAR_NUMBER: TFloatField
      FieldName = 'INVENTAR_NUMBER'
      OnChange = DocPosKOD_MATERChange
    end
    object DocPosForENaklMADEIN: TIntegerField
      FieldName = 'MADEIN'
    end
    object DocPosForENaklIS_SERTIF: TIntegerField
      FieldName = 'IS_SERTIF'
    end
    object DocPosForENaklMAT_DOC: TIntegerField
      FieldName = 'MAT_DOC'
    end
    object DocPosForENaklOPERDATE: TFIBDateTimeField
      FieldName = 'OPERDATE'
    end
    object DocPosForENaklDOCNUMBER: TIntegerField
      FieldName = 'DOCNUMBER'
    end
    object DocPosForENakllocation: TFIBStringField
      FieldName = 'location'
      Size = 100
      EmptyStrToNull = True
    end
    object DocPosForENaklDK_TO: TFloatField
      FieldName = 'DK_TO'
    end
    object DocPosForENaklDK_FROM: TFloatField
      FieldName = 'DK_FROM'
    end
  end
  object frDB_Subrent: TfrDBDataSet
    DataSet = DocPos
    Left = 448
    Top = 380
  end
  object NaklSplitQ: TMegaQuery
    Transaction = trSplitNakl
    Database = DM.Money
    Left = 32
    Top = 440
  end
  object trSplitNakl: TMegaTransaction
    DefaultDatabase = DM.Money
    TimeoutAction = TARollback
    TRParams.Strings = (
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 32
    Top = 392
  end
  object pmPrintReklama: TPopupMenu
    Left = 432
    Top = 442
    object N46: TMenuItem
      Action = aktSubRent
      Left = 12345
    end
    object N47: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object N48: TMenuItem
      Action = PrintInternal
      Left = 12345
    end
    object N49: TMenuItem
      Action = actSubRent_List
      Left = 12345
    end
    object N45: TMenuItem
      Action = actPrintDogovor
      Left = 12345
    end
    object N56: TMenuItem
      Action = actPrintSubRent_Strono
      Left = 12345
    end
  end
  object Ins2Office: TMegaQuery
    Transaction = RemoteTransaction
    Database = RemoteBase
    Left = 490
    Top = 118
  end
  object RemoteTransaction: TMegaTransaction
    DefaultDatabase = RemoteBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 366
    Top = 134
  end
  object RemoteBase: TMegaBase
    DBName = 'dbs.office.meganet:/db/base.gdb'
    DBParams.Strings = (
      'user_name=packet'
      'password=gfrtn'
      'sql_role_name=replicator')
    DefaultTransaction = RemoteTransaction
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 330
    Top = 134
  end
  object selNakl2Office: TMegaRDataSet
    SelectSQL.Strings = (
      'select * from doc_nakl where recid= :RECID and baseid= :BASEID')
    Transaction = Nakl_Transaction
    Database = DM.Money
    DataSource = Source
    DefaultFormats.NumericEditFormat = '0'
    Key = 'RECID;BASEID'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 162
    Top = 114
  end
  object selNaklPos2Office: TMegaRDataSet
    SelectSQL.Strings = (
      
        'select * from doc_nakl_pos dnp where dnp.docrecno= :RECID and dn' +
        'p.baseid= :BASEID')
    Transaction = Nakl_Transaction
    Database = DM.Money
    DataSource = Source
    DefaultFormats.NumericEditFormat = '0'
    Key = 'RECID;BASEID'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 250
    Top = 114
  end
  object qAkcis: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    Left = 323
    Top = 90
  end
  object qSelfNakl: TpFIBQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    Left = 400
    Top = 86
  end
  object cdsVal: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Val'
        DataType = ftInteger
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 496
    Top = 40
    object cdsValVal: TIntegerField
      FieldName = 'Val'
    end
    object cdsValName: TStringField
      FieldName = 'Name'
    end
  end
  object dsVal: TDataSource
    DataSet = cdsVal
    Left = 458
    Top = 87
  end
  object LinkQ: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    SQL.Strings = (
      'select RESULT,ERROR_DESCR'
      'from MAKE_DOC_LINKED'
      '(:PARENT_RECID,:PARENT_BASEID,:PARENT_FORM_TYPE'
      ',:DOC_RECID,:DOC_BASEID,:DOC_FORM_TYPE)')
    Left = 400
    Top = 217
  end
  object mdRestParty: TMegaDataSet
    SelectSQL.Strings = (
      'select dp.date_part, gtp.number, gtp.num_party_egais, gtp.kolich'
      
        'from get_number_party(:kod_mater, :group_oper, :kod_oper, :operd' +
        'ate, :recid,'
      
        ' :baseid, :balance, :forma, :kolich_kredit,  :schet, :isprihod) ' +
        'gtp'
      'left join doc_party dp on (dp.number=gtp.number)')
    Transaction = Nakl_Transaction
    Database = DM.Money
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    Left = 568
    Top = 440
    object mdRestPartyNUMBER: TFIBStringField
      FieldName = 'NUMBER'
      Size = 100
      EmptyStrToNull = True
    end
    object mdRestPartyNUM_PARTY_EGAIS: TFIBFloatField
      FieldName = 'NUM_PARTY_EGAIS'
    end
    object mdRestPartyKOLICH: TFIBFloatField
      FieldName = 'KOLICH'
    end
    object mdRestPartyDATE_PART: TFIBDateTimeField
      FieldName = 'DATE_PART'
    end
  end
  object NaklSplitPartyQ: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    Left = 96
    Top = 445
  end
  object mdsSelParty: TMegaDataSet
    SelectSQL.Strings = (
      'select   grp.number_PARTY NUMBER, dp.num_party_egais'
      '       , grp.kolich_party KOLICH, dp.date_part, dp.operdate'
      '       , dg.docnumber, dp.gtd_num4, dp.Recid, dp.baseid, dp.UKP'
      'from  GET_REST_PARTY(:KOD_MATER,:SCHET_REST) grp'
      '  left join doc_party dp on (dp.number=grp.number_PARTY)'
      
        '  left join doc_gtd dg on (dg.recid = dp.gtd_recid and dg.baseid' +
        ' = dp.gtd_baseid)'
      'where grp.kolich_party>=:KOLICH'
      '')
    Transaction = Nakl_Transaction
    Database = DM.Money
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    Left = 568
    Top = 488
    object mdsSelPartyNUMBER: TFIBStringField
      FieldName = 'NUMBER'
      Size = 100
      EmptyStrToNull = True
    end
    object mdsSelPartyNUM_PARTY_EGAIS: TFIBFloatField
      FieldName = 'NUM_PARTY_EGAIS'
    end
    object mdsSelPartyKOLICH: TFIBFloatField
      FieldName = 'KOLICH'
    end
    object mdsSelPartyDATE_PART: TFIBDateTimeField
      FieldName = 'DATE_PART'
    end
    object mdsSelPartyOPERDATE: TFIBDateTimeField
      FieldName = 'OPERDATE'
    end
    object mdsSelPartyDOCNUMBER: TFIBStringField
      FieldName = 'DOCNUMBER'
      Size = 40
      EmptyStrToNull = True
    end
    object mdsSelPartyGTD_NUM4: TFIBIntegerField
      FieldName = 'GTD_NUM4'
    end
    object mdsSelPartyRECID: TFIBIntegerField
      FieldName = 'RECID'
    end
    object mdsSelPartyBASEID: TFIBIntegerField
      FieldName = 'BASEID'
    end
    object mdsSelPartyUKP: TFIBFloatField
      FieldName = 'UKP'
    end
  end
  object pmBP: TPopupMenu
    Left = 552
    Top = 100
    object N21: TMenuItem
      Action = actStartBPAgreementOfProductionReturn
      Left = 12345
    end
    object N85: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object VIP1: TMenuItem
      Action = actStartBPContragentVIP
      Caption = 'Стартовать бизнес-процесс согласования продажи на просрочку'
      Left = 12345
    end
    object N90: TMenuItem
      Action = actStartBPRemoveBlockingOfMinimalOrder
      Left = 12345
    end
    object actStartBPFinanceCoordinationOfGettingProductOnCredit1: TMenuItem
      Action = actStartBPFinanceCoordinationOfGettingProductOnCredit
      Left = 12345
    end
    object N96: TMenuItem
      Caption = 'Стартовать бизнес-процесс на снятие блокировки перегруза ТТ'
      OnClick = N96Click
      Left = 12345
    end
    object N78: TMenuItem
      Action = actStartBusinessSellingForTTWithoutLicense
      Left = 12345
    end
  end
  object fdsZayavka: TMegaDataSet
    UpdateSQL.Strings = (
      'UPDATE'
      '  DOC_ZAYAVKA_NA_TRANSPORT'
      'SET'
      '  STATUS = :STATUS,'
      '  SCANDOC = :SCANDOC,'
      '  DK_CARRIER = :DK_CARRIER,'
      '  DRIVER_NAME = :DRIVER_NAME,'
      '  DRIVER_PASSPORT = :DRIVER_PASSPORT,'
      '  CAR_SNUM = :CAR_SNUM,'
      '  CAR_TRAILER = :CAR_TRAILER,'
      '  CAR_TRAILER2 = :CAR_TRAILER2,'
      '  DRIVER_PHONE = :DRIVER_PHONE,'
      '  COST = :COST,'
      '  GRUZ = :GRUZ,'
      '  PLACES = :PLACES,'
      '  VOLUME = :VOLUME,'
      '  REGIME = :REGIME,'
      '  OUTLET_FROM = :OUTLET_FROM,'
      '  OUTLET_TO = :OUTLET_TO,'
      '  OUTLET_TRANSIT = :OUTLET_TRANSIT'
      'WHERE'
      '  RECID = :OLD_RECID')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DOC_ZAYAVKA_NA_TRANSPORT'
      'WHERE'
      '        RECID = :OLD_RECID'
      '    ')
    RefreshSQL.Strings = (
      'SELECT'
      '    znt.RECID,'
      '    znt.RECID DocNumber,'
      '    znt.DOCDATE,'
      '    znt.GOROD_FROM,'
      '    znt.GOROD_TO,'
      '    znt.GOROD_TRANSIT,'
      
        '    (SELECT NAS_P_NAME FROM SPRAV_NAS_P WHERE NAS_P_ID = znt.GOR' +
        'OD_FROM and COUNTRY_ID = znt.COUNTRY_ID) TOWN_FROM,'
      
        '    (SELECT NAS_P_NAME FROM SPRAV_NAS_P WHERE NAS_P_ID = znt.GOR' +
        'OD_TO and COUNTRY_ID = znt.COUNTRY_ID) TOWN_TO,'
      
        '    (SELECT NAS_P_NAME FROM SPRAV_NAS_P WHERE NAS_P_ID = znt.GOR' +
        'OD_TRANSIT and COUNTRY_ID = znt.COUNTRY_ID) TOWN_TRANSIT,'
      ''
      '    znt.START_DATE,'
      '    (znt.START_DATE + sd.DAYS) END_DATE,'
      '    znt.TYP,'
      
        '    (SELECT NAME FROM SPRAV_TRANSPORT_TYP WHERE RECID = znt.TYP)' +
        ' TYP_NAME,'
      
        '    (SELECT NAME FROM SPRAV_TRANSPORT_TONNAGE WHERE RECID = znt.' +
        'TONNAGE) TONNAGE_NAME,'
      
        '    (SELECT TONNAGE FROM SPRAV_TRANSPORT_TONNAGE WHERE RECID = z' +
        'nt.TONNAGE) TONNAGE_VALUE,'
      '    znt.STATUS,'
      '    znt.SCANDOC,'
      '    CASE znt.STATUS'
      '      WHEN 0 THEN '#39'окрытая'#39
      '      WHEN 1 THEN '#39'в работе'#39
      '      WHEN 2 THEN '#39'закрытая'#39
      '      WHEN 3 THEN '#39'в работе'#39
      '      WHEN 4 THEN '#39'отменена'#39
      '      WHEN 5 THEN '#39'утверждена'#39
      '      ELSE '#39'?'#39
      '    end as Status_Name,'
      
        '   (SELECT FIRST 1 NAME FROM SYS_USERS WHERE KOD_DK = znt.DK_USE' +
        'R) UserName,'
      '   znt.DK_CARRIER,'
      '   sdk.NAME_DK DK_CARRIER_NAME,'
      '   znt.DRIVER_NAME,'
      '   znt.DRIVER_PASSPORT,'
      '   znt.CAR_SNUM,'
      '   znt.CAR_TRAILER,'
      '   znt.CAR_TRAILER2,'
      '   znt.DRIVER_PHONE,'
      '   znt.COST,'
      '   znt.GRUZ,'
      '   znt.PLACES,'
      '   znt.VOLUME,'
      '   znt.REGIME'
      
        '   ,iif(znt.gorod_from = :cfo_city, 1, iif(znt.GOROD_TRANSIT=:cf' +
        'o_city, 2, 3)) cur_city'
      'FROM'
      '    DOC_ZAYAVKA_NA_TRANSPORT znt'
      '    LEFT JOIN SPRAV_DOSTAVKA sd ON ('
      '      sd.GOROD_FROM = znt.GOROD_FROM'
      '      AND sd.GOROD_TO = znt.GOROD_TO'
      '      AND sd.GOROD_TRANSIT = znt.GOROD_TRANSIT'
      '      AND sd.TYP = znt.TYP'
      '      AND sd.COUNTRY_ID = znt.COUNTRY_ID'
      '      and sd.TONNAGE = znt.Tonnage'
      '      and sd.DK_CARRIER = znt.DK_CARRIER'
      '      )'
      '    LEFT JOIN SPRAV_DK sdk ON (sdk.KOD_DK = znt.DK_CARRIER)'
      'where'
      '    znt.RECID = :OLD_RECID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    znt.RECID,'
      '    znt.RECID DocNumber,'
      '    znt.DOCDATE,'
      '    znt.GOROD_FROM,'
      '    znt.GOROD_TO,'
      '    znt.GOROD_TRANSIT,'
      
        '    (SELECT NAS_P_NAME FROM SPRAV_NAS_P WHERE NAS_P_ID = znt.GOR' +
        'OD_FROM and COUNTRY_ID = znt.COUNTRY_ID) TOWN_FROM,'
      
        '    (SELECT NAS_P_NAME FROM SPRAV_NAS_P WHERE NAS_P_ID = znt.GOR' +
        'OD_TO and COUNTRY_ID = znt.COUNTRY_ID) TOWN_TO,'
      
        '    (SELECT NAS_P_NAME FROM SPRAV_NAS_P WHERE NAS_P_ID = znt.GOR' +
        'OD_TRANSIT and COUNTRY_ID = znt.COUNTRY_ID) TOWN_TRANSIT,'
      ''
      '    znt.START_DATE,'
      '    (znt.START_DATE + sd.DAYS) END_DATE,'
      '    znt.TYP,'
      
        '    (SELECT NAME FROM SPRAV_TRANSPORT_TYP WHERE RECID = znt.TYP)' +
        ' TYP_NAME,'
      
        '    (SELECT NAME FROM SPRAV_TRANSPORT_TONNAGE WHERE RECID = znt.' +
        'TONNAGE) TONNAGE_NAME,'
      
        '    (SELECT TONNAGE FROM SPRAV_TRANSPORT_TONNAGE WHERE RECID = z' +
        'nt.TONNAGE) TONNAGE_VALUE,'
      '    znt.STATUS,'
      '    znt.SCANDOC,'
      '    CASE znt.STATUS'
      '      WHEN 0 THEN '#39'окрытая'#39
      '      WHEN 1 THEN '#39'в работе'#39
      '      WHEN 2 THEN '#39'закрытая'#39
      '      WHEN 3 THEN '#39'в работе'#39
      '      WHEN 4 THEN '#39'отменена'#39
      '      WHEN 5 THEN '#39'утверждена'#39
      '      ELSE '#39'?'#39
      '    end as Status_Name,'
      
        '   (SELECT FIRST 1 NAME FROM SYS_USERS WHERE KOD_DK = znt.DK_USE' +
        'R) UserName,'
      '   znt.DK_CARRIER,'
      '   sdk.NAME_DK DK_CARRIER_NAME,'
      '   znt.DRIVER_NAME,'
      '   znt.DRIVER_PASSPORT,'
      '   znt.CAR_SNUM,'
      '   znt.CAR_TRAILER,'
      '   znt.CAR_TRAILER2,'
      '   znt.DRIVER_PHONE,'
      '   znt.COST,'
      '   znt.GRUZ,'
      '   znt.PLACES,'
      '   znt.VOLUME,'
      '   znt.REGIME'
      
        '   ,iif(znt.gorod_from = :cfo_city, 1, iif(znt.GOROD_TRANSIT=:cf' +
        'o_city, 2, 3)) cur_city'
      'FROM'
      '    DOC_ZAYAVKA_NA_TRANSPORT znt'
      '    LEFT JOIN SPRAV_DOSTAVKA sd ON ('
      '      sd.GOROD_FROM = znt.GOROD_FROM'
      '      AND sd.GOROD_TO = znt.GOROD_TO'
      '      AND sd.GOROD_TRANSIT = znt.GOROD_TRANSIT'
      '      AND sd.TYP = znt.TYP'
      '      AND sd.COUNTRY_ID = znt.COUNTRY_ID'
      '      and sd.TONNAGE = znt.Tonnage'
      '      and sd.DK_CARRIER = znt.DK_CARRIER'
      '      )'
      '    LEFT JOIN SPRAV_DK sdk ON (sdk.KOD_DK = znt.DK_CARRIER)'
      'where'
      '  znt.STATUS = 5'
      '  and znt.DOCDATE < :DOCDATE + 1'
      
        '--  and (:cfo_city in (znt.GOROD_FROM, /*znt.GOROD_TO,*/ znt.GOR' +
        'OD_TRANSIT))'
      ''
      '')
    FilterOptions = [foCaseInsensitive]
    Transaction = DM.Transaction
    Database = DM.Money
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    Left = 726
    Top = 383
    object fdsZayavkaRECID: TFIBIntegerField
      FieldName = 'RECID'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.RECID'
    end
    object fdsZayavkaDOCNUMBER: TFIBIntegerField
      FieldName = 'DOCNUMBER'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.RECID'
    end
    object fdsZayavkaDOCDATE: TFIBDateTimeField
      FieldName = 'DOCDATE'
      Origin = 'SPRAV_DK.DOCDATE'
    end
    object fdsZayavkaGOROD_FROM: TFIBIntegerField
      FieldName = 'GOROD_FROM'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.GOROD_FROM'
    end
    object fdsZayavkaGOROD_TO: TFIBIntegerField
      FieldName = 'GOROD_TO'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.GOROD_TO'
    end
    object fdsZayavkaGOROD_TRANSIT: TFIBIntegerField
      FieldName = 'GOROD_TRANSIT'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.GOROD_TRANSIT'
    end
    object fdsZayavkaTOWN_FROM: TFIBStringField
      FieldName = 'TOWN_FROM'
      Size = 30
      EmptyStrToNull = True
    end
    object fdsZayavkaTOWN_TO: TFIBStringField
      FieldName = 'TOWN_TO'
      Size = 30
      EmptyStrToNull = True
    end
    object fdsZayavkaTOWN_TRANSIT: TFIBStringField
      FieldName = 'TOWN_TRANSIT'
      Size = 30
      EmptyStrToNull = True
    end
    object fdsZayavkaSTART_DATE: TFIBDateTimeField
      FieldName = 'START_DATE'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.START_DATE'
    end
    object fdsZayavkaEND_DATE: TFIBDateTimeField
      FieldName = 'END_DATE'
    end
    object fdsZayavkaTYP: TFIBIntegerField
      FieldName = 'TYP'
      Origin = 'SPRAV_DOSTAVKA.TYP'
    end
    object fdsZayavkaTYP_NAME: TFIBStringField
      FieldName = 'TYP_NAME'
      Size = 60
      EmptyStrToNull = True
    end
    object fdsZayavkaTONNAGE_NAME: TFIBStringField
      FieldName = 'TONNAGE_NAME'
      EmptyStrToNull = True
    end
    object fdsZayavkaTONNAGE_VALUE: TFIBFloatField
      FieldName = 'TONNAGE_VALUE'
    end
    object fdsZayavkaSTATUS: TFIBIntegerField
      FieldName = 'STATUS'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.STATUS'
    end
    object fdsZayavkaSCANDOC: TFIBBlobField
      FieldName = 'SCANDOC'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.SCANDOC'
      Size = 8
    end
    object fdsZayavkaSTATUS_NAME: TFIBStringField
      FieldName = 'STATUS_NAME'
      Size = 8
      EmptyStrToNull = True
    end
    object fdsZayavkaUSERNAME: TFIBStringField
      FieldName = 'USERNAME'
      Size = 31
      EmptyStrToNull = True
    end
    object fdsZayavkaDK_CARRIER: TFIBFloatField
      FieldName = 'DK_CARRIER'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.DK_CARRIER'
    end
    object fdsZayavkaDRIVER_NAME: TFIBStringField
      FieldName = 'DRIVER_NAME'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.DRIVER_NAME'
      Size = 80
      EmptyStrToNull = True
    end
    object fdsZayavkaDRIVER_PASSPORT: TFIBStringField
      FieldName = 'DRIVER_PASSPORT'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.DRIVER_PASSPORT'
      Size = 80
      EmptyStrToNull = True
    end
    object fdsZayavkaCAR_SNUM: TFIBStringField
      FieldName = 'CAR_SNUM'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.CAR_SNUM'
      EmptyStrToNull = True
    end
    object fdsZayavkaCAR_TRAILER: TFIBStringField
      FieldName = 'CAR_TRAILER'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.CAR_TRAILER'
      EmptyStrToNull = True
    end
    object fdsZayavkaCAR_TRAILER2: TFIBStringField
      FieldName = 'CAR_TRAILER2'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.CAR_TRAILER2'
      EmptyStrToNull = True
    end
    object fdsZayavkaDRIVER_PHONE: TFIBStringField
      FieldName = 'DRIVER_PHONE'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.DRIVER_PHONE'
      Size = 60
      EmptyStrToNull = True
    end
    object fdsZayavkaCOST: TFIBFloatField
      FieldName = 'COST'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.COST'
    end
    object fdsZayavkaGRUZ: TFIBStringField
      FieldName = 'GRUZ'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.GRUZ'
      Size = 60
      EmptyStrToNull = True
    end
    object fdsZayavkaPLACES: TFIBStringField
      FieldName = 'PLACES'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.PLACES'
      EmptyStrToNull = True
    end
    object fdsZayavkaVOLUME: TFIBStringField
      FieldName = 'VOLUME'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.VOLUME'
      EmptyStrToNull = True
    end
    object fdsZayavkaREGIME: TFIBStringField
      FieldName = 'REGIME'
      Origin = 'DOC_ZAYAVKA_NA_TRANSPORT.REGIME'
      EmptyStrToNull = True
    end
    object fdsZayavkacur_city: TIntegerField
      FieldName = 'cur_city'
    end
    object fdsZayavkaDK_CARRIER_NAME: TFIBStringField
      FieldName = 'DK_CARRIER_NAME'
      Origin = 'SPRAV_DK.NAME_DK'
      Size = 90
      EmptyStrToNull = True
    end
  end
  object dsZayavka: TDataSource
    DataSet = fdsZayavka
    Left = 730
    Top = 440
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 676
    Top = 484
    object cxGridViewRepository1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsZayavka
      DataController.KeyFieldNames = 'RECID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      Left = 12345
      object cxGridViewRepository1DBTableView1RECID: TcxGridDBColumn
        DataBinding.FieldName = 'RECID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1DOCNUMBER: TcxGridDBColumn
        Caption = '№ заявки'
        DataBinding.FieldName = 'DOCNUMBER'
        HeaderAlignmentHorz = taCenter
        MinWidth = 0
        Options.Editing = False
        Width = 59
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1DOCDATE: TcxGridDBColumn
        Caption = 'Дата'
        DataBinding.FieldName = 'DOCDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1GOROD_FROM: TcxGridDBColumn
        Caption = 'Пункт отправления'
        DataBinding.FieldName = 'GOROD_FROM'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 100
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1GOROD_TO: TcxGridDBColumn
        Caption = 'Пункт назначения'
        DataBinding.FieldName = 'GOROD_TO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 100
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1GOROD_TRANSIT: TcxGridDBColumn
        Caption = 'Транзит'
        DataBinding.FieldName = 'GOROD_TRANSIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 100
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1TOWN_FROM: TcxGridDBColumn
        Caption = 'Пункт отправления'
        DataBinding.FieldName = 'TOWN_FROM'
        HeaderAlignmentHorz = taCenter
        Width = 106
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1TOWN_TO: TcxGridDBColumn
        Caption = 'Пункт назначения'
        DataBinding.FieldName = 'TOWN_TO'
        HeaderAlignmentHorz = taCenter
        Width = 100
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1TOWN_TRANSIT: TcxGridDBColumn
        Caption = 'Транзит'
        DataBinding.FieldName = 'TOWN_TRANSIT'
        HeaderAlignmentHorz = taCenter
        Width = 100
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1START_DATE: TcxGridDBColumn
        Caption = 'Дата загрузки'
        DataBinding.FieldName = 'START_DATE'
        HeaderAlignmentHorz = taCenter
        Width = 65
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1END_DATE: TcxGridDBColumn
        Caption = 'Дата разгрузки'
        DataBinding.FieldName = 'END_DATE'
        HeaderAlignmentHorz = taCenter
        Width = 65
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1TYP: TcxGridDBColumn
        DataBinding.FieldName = 'TYP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1TYP_NAME: TcxGridDBColumn
        Caption = 'Тип ТС'
        DataBinding.FieldName = 'TYP_NAME'
        HeaderAlignmentHorz = taCenter
        Width = 60
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1TONNAGE_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'TONNAGE_NAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1TONNAGE_VALUE: TcxGridDBColumn
        Caption = 'Тоннаж'
        DataBinding.FieldName = 'TONNAGE_VALUE'
        HeaderAlignmentHorz = taCenter
        Width = 50
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1STATUS: TcxGridDBColumn
        DataBinding.FieldName = 'STATUS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1SCANDOC: TcxGridDBColumn
        Caption = 'Документ'
        DataBinding.FieldName = 'SCANDOC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1STATUS_NAME: TcxGridDBColumn
        Caption = 'Статус'
        DataBinding.FieldName = 'STATUS_NAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1USERNAME: TcxGridDBColumn
        DataBinding.FieldName = 'USERNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1DK_CARRIER: TcxGridDBColumn
        Caption = 'Перевозчик'
        DataBinding.FieldName = 'DK_CARRIER_NAME'
        HeaderAlignmentHorz = taCenter
        Width = 80
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1DRIVER_NAME: TcxGridDBColumn
        Caption = 'Водитель'
        DataBinding.FieldName = 'DRIVER_NAME'
        HeaderAlignmentHorz = taCenter
        Width = 100
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1DRIVER_PASSPORT: TcxGridDBColumn
        Caption = 'Паспорт водителя'
        DataBinding.FieldName = 'DRIVER_PASSPORT'
        HeaderAlignmentHorz = taCenter
        Width = 80
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1CAR_SNUM: TcxGridDBColumn
        Caption = 'Номер авто'
        DataBinding.FieldName = 'CAR_SNUM'
        HeaderAlignmentHorz = taCenter
        Width = 63
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1CAR_TRAILER: TcxGridDBColumn
        Caption = 'Прицеп'
        DataBinding.FieldName = 'CAR_TRAILER'
        HeaderAlignmentHorz = taCenter
        Width = 73
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1CAR_TRAILER2: TcxGridDBColumn
        Caption = 'Прицеп2'
        DataBinding.FieldName = 'CAR_TRAILER2'
        HeaderAlignmentHorz = taCenter
        Width = 66
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1DRIVER_PHONE: TcxGridDBColumn
        Caption = 'тел. водителя'
        DataBinding.FieldName = 'DRIVER_PHONE'
        HeaderAlignmentHorz = taCenter
        Width = 78
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1COST: TcxGridDBColumn
        DataBinding.FieldName = 'COST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1GRUZ: TcxGridDBColumn
        DataBinding.FieldName = 'GRUZ'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1PLACES: TcxGridDBColumn
        DataBinding.FieldName = 'PLACES'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1VOLUME: TcxGridDBColumn
        DataBinding.FieldName = 'VOLUME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
      object cxGridViewRepository1DBTableView1REGIME: TcxGridDBColumn
        DataBinding.FieldName = 'REGIME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Left = 12345
      end
    end
  end
  object pmOrder: TPopupMenu
    Left = 608
    Top = 92
    object MenuItem5: TMenuItem
      Caption = 'Создать наряд'
      Left = 12345
      object N59: TMenuItem
        Action = actInsNar
        Hint = 'Может быть неактивным если это тарнзитная накладная'
        Left = 12345
      end
      object N60: TMenuItem
        Action = actInsNarUnloadCont
        Left = 12345
      end
      object N122: TMenuItem
        Action = actStickering
        Left = 12345
      end
      object N123: TMenuItem
        Action = actShippingPallets
        Left = 12345
      end
    end
    object MenuItem6: TMenuItem
      Action = actUpdateNar
      Left = 12345
    end
    object MenuItem7: TMenuItem
      Action = actDelNar
      Left = 12345
    end
  end
  object mdsDocOrderSklad: TMegaDataSet
    SelectSQL.Strings = (
      'select * from doc_order_sklad dos'
      'where dos.nakl_recid=:recid and dos.nakl_baseid=:baseid'
      
        'and ((:TYPE_ORDER=0 and type_order in (1,3,4)) or (:TYPE_ORDER >' +
        ' 0 and type_order=:TYPE_ORDER)) ')
    Transaction = DM.Transaction
    Database = DM.Money
    DataSource = Source
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    Left = 800
    Top = 56
    object mdsDocOrderSkladRECID: TFIBIntegerField
      FieldName = 'RECID'
    end
    object mdsDocOrderSkladBASEID: TFIBIntegerField
      FieldName = 'BASEID'
    end
    object mdsDocOrderSkladDOCNUMBER: TFIBIntegerField
      FieldName = 'DOCNUMBER'
    end
    object mdsDocOrderSkladOPERDATE: TFIBDateTimeField
      FieldName = 'OPERDATE'
    end
    object mdsDocOrderSkladTYPE_ORDER: TFIBIntegerField
      FieldName = 'TYPE_ORDER'
    end
    object mdsDocOrderSkladPLAN_DATE: TFIBDateTimeField
      FieldName = 'PLAN_DATE'
    end
    object mdsDocOrderSkladPLAN_NUMBER: TFIBIntegerField
      FieldName = 'PLAN_NUMBER'
    end
    object mdsDocOrderSkladPLAN_BASEID: TFIBIntegerField
      FieldName = 'PLAN_BASEID'
    end
    object mdsDocOrderSkladNAKL_RECID: TFIBIntegerField
      FieldName = 'NAKL_RECID'
    end
    object mdsDocOrderSkladNAKL_BASEID: TFIBIntegerField
      FieldName = 'NAKL_BASEID'
    end
  end
  object trGTD: TMegaTransaction
    DefaultDatabase = DM.Money
    TimeoutAction = TARollback
    Left = 188
    Top = 480
  end
  object mdsIncludeOkom: TMegaRDataSet
    UpdateSQL.Strings = (
      ' update doc_nakl_include_okom'
      ' set doc_recid = doc_recid'
      ' where (doc_recid = :doc_recid) and (doc_baseid = :doc_baseid)')
    InsertSQL.Strings = (
      
        'insert into doc_nakl_include_okom (doc_recid, doc_baseid) values' +
        ' (:doc_recid, :doc_baseid)')
    RefreshSQL.Strings = (
      ''
      
        'select iif(dni.doc_recid is null,0,1) is_included,dn.recid doc_r' +
        'ecid,dn.baseid doc_baseid'
      'from doc_nakl dn'
      
        'left join doc_nakl_include_okom dni on (dni.doc_recid=dn.recid a' +
        'nd dni.doc_baseid=dn.baseid)'
      'where dn.recid=:RECID and dn.baseid=:BASEID')
    SelectSQL.Strings = (
      ''
      
        'select iif(dni.doc_recid is null,0,1) is_included,dn.recid doc_r' +
        'ecid,dn.baseid doc_baseid'
      'from doc_nakl dn'
      
        'left join doc_nakl_include_okom dni on (dni.doc_recid=dn.recid a' +
        'nd dni.doc_baseid=dn.baseid)'
      'where dn.recid= :RECID and dn.baseid= :BASEID')
    Transaction = Nakl_Transaction
    Database = DM.Money
    DataSource = Source
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    Key = 'RECID;BASEID'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 420
    Top = 188
    oNoForceIsNull = True
    object mdsIncludeOkomis_included: TSmallintField
      FieldName = 'is_included'
      OnChange = mdsIncludeOkomis_includedChange
    end
    object mdsIncludeOkomdoc_recid: TIntegerField
      FieldName = 'doc_recid'
    end
    object mdsIncludeOkomdoc_baseid: TIntegerField
      FieldName = 'doc_baseid'
    end
  end
  object dsIncludedOkom: TDataSource
    DataSet = mdsIncludeOkom
    Left = 472
    Top = 200
  end
  object pmTypeAkc: TPopupMenu
    Left = 828
    Top = 420
    object N99: TMenuItem
      Action = actCheckBaseNakl
      Caption = 'Отметить как базовую(Хортица)'
      Left = 12345
    end
    object N100: TMenuItem
      Action = actCheckBaseNakl_med
      Left = 12345
    end
    object actCheckBaseNaklblg1: TMenuItem
      Action = actCheckBaseNakl_blg
      Left = 12345
    end
    object actCheckBaseNaklFeodosia: TMenuItem
      Caption = 'Отметить как базовую (Феодосия)'
      Visible = False
      OnClick = actCheckBaseNaklFeodosiaClick
      Left = 12345
    end
    object actCheckBaseNaklOKZ: TMenuItem
      Caption = 'Отметить как базовую (ОКЗ)'
      Visible = False
      OnClick = actCheckBaseNaklOKZClick
      Left = 12345
    end
    object actCheckBaseNaklTOP14: TMenuItem
      Caption = 'Отметить как базовую (ТОП14)'
      OnClick = actCheckBaseNaklTOP14Click
      Left = 12345
    end
    object N102: TMenuItem
      Caption = '-'
      Left = 12345
    end
    object actUnCheckBaseNakl_Khortitsa: TMenuItem
      Caption = 'Снять отметку базовой накладной(Хортица)'
      Hint = 
        'Снимает признак базовой по данному клиенту. Гланвое чтобы клиент' +
        ' в накаладной совпадал с нужным.'
      Visible = False
      OnClick = actUnCheckBaseNakl_KhortitsaClick
      Left = 12345
    end
    object actUnCheckBaseNakl_Med: TMenuItem
      Caption = 'Снять отметку базовой накладной(Медовуха)'
      Visible = False
      OnClick = actUnCheckBaseNakl_MedClick
      Left = 12345
    end
    object actUnCheckBaseNakl_Blg: TMenuItem
      Caption = 'Снять отметку базовой накладной(Благофф)'
      Visible = False
      OnClick = actUnCheckBaseNakl_BlgClick
      Left = 12345
    end
    object actUnCheckBaseNakl_Feod: TMenuItem
      Caption = 'Снять отметку базовой накладной(Феодосия)'
      Visible = False
      OnClick = actUnCheckBaseNakl_FeodClick
      Left = 12345
    end
    object actUnCheckBaseNakl_OKZ: TMenuItem
      Caption = 'Снять отметку базовой накладной(ОКЗ)'
      Visible = False
      OnClick = actUnCheckBaseNakl_OKZClick
      Left = 12345
    end
    object actUnCheckBaseNakl_TOP14: TMenuItem
      Caption = 'Снять отметку базовой накладной(ТОП14)'
      OnClick = actUnCheckBaseNakl_TOP14Click
      Left = 12345
    end
    object actUnCheckBaseNakl_all: TMenuItem
      Caption = 'Снять отметку базовой накладной(ВСЕ АКЦИИ)'
      OnClick = actUnCheckBaseNakl_allClick
      Left = 12345
    end
    object N103: TMenuItem
      Caption = '-'
      Left = 12345
    end
  end
  object MegaSelMaterDialog1: TMegaSelMaterDialog
    Database = DM.Money
    Transaction = DM.trMainRO
    Left = 164
    Top = 260
  end
  object PopupMenu3: TPopupMenu
    Left = 392
    Top = 344
  end
  object PopupMenu4: TPopupMenu
    Left = 448
    Top = 292
  end
  object DBSumList1: TDBSumList
    DataSet = DocPos
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'KOLICH'
        GroupOperation = goSum
      end
      item
        FieldName = 'SUMMAWPDV'
        GroupOperation = goSum
      end>
    VirtualRecords = False
    Left = 572
    Top = 560
  end
  object RxMemoryData1: TRxMemoryData
    Filtered = True
    FieldDefs = <>
    Left = 180
    Top = 600
  end
  object dsSum: TRxMemoryData
    FieldDefs = <>
    Left = 100
    Top = 599
  end
  object dsSumGroup: TRxMemoryData
    FieldDefs = <>
    Left = 100
    Top = 547
  end
  object dsSource: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 99
    Top = 495
  end
  object conEgais: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=people12q;Persist Security Info=Tru' +
      'e;User ID=admin;Initial Catalog=RFTS-ALCO;Data Source=db_egais;E' +
      'xtended Properties="Connection Timeout=600"'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 792
    Top = 496
  end
  object dsDocNumber: TADODataSet
    Connection = conEgais
    CursorType = ctStatic
    CommandText = 
      'SELECT'#13#10'a.[ID] ID_DOC'#13#10',a.[DOC_NUMBER]'#13#10',a.[FIX_NOTIFICATION_ID]' +
      #13#10',a.[FIX_NOTIFICATION_DATE]'#13#10',WB.[IS_IMPORT]'#13#10'from [RFTS-ALCO].' +
      '[dbo].[DOCFLOW_OBJECT] a'#13#10'left join [RFTS-ALCO].[dbo].[WRH_WAYBI' +
      'LL] wb on wb.id = a.id'#13#10'where WB.[OUT_DATE]>= :b_date and WB.[OU' +
      'T_DATE]< :e_date'#13#10'and ([CALC_DATA_ID36] = 36010) and a.[REF_DATA' +
      '_ID38] = 38041 and a.[INACTIVE_FLAG] = 0  and a.[DOC_NUMBER] = :' +
      'doc_number'#13#10'order by WB.[OUT_DATE]'
    Parameters = <
      item
        Name = 'b_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'e_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'doc_number'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 64
        Value = Null
      end>
    Left = 848
    Top = 496
    object dsDocNumberID_DOC: TLargeintField
      FieldName = 'ID_DOC'
    end
    object dsDocNumberDOC_NUMBER: TMegaStringField
      FieldName = 'DOC_NUMBER'
      Size = 64
      EmptyStrToNull = False
    end
    object dsDocNumberFIX_NOTIFICATION_ID: TLargeintField
      FieldName = 'FIX_NOTIFICATION_ID'
    end
    object dsDocNumberFIX_NOTIFICATION_DATE: TDateTimeField
      FieldName = 'FIX_NOTIFICATION_DATE'
    end
    object dsDocNumberIS_IMPORT: TBooleanField
      FieldName = 'IS_IMPORT'
    end
  end
  object mdsImportAsnInWMS: TMegaRDataSet
    SelectSQL.Strings = (
      ' select dn.docnumber AsnNumber,dn.addr_from||'#39#39' WhsCode, '
      'dn.addr_to||'#39#39' WhsToCode ,dn.dk_from VendorCode, '
      'pr_nakl.dk_to VendorToCode,'
      'dn.dk_from SupplierCode,'
      'sd_from.shortname_dk SupplierName,'
      'sd_to.shortname_dk CustomerName,'
      'pr_nakl.TO_ADDRESS,'
      'pr_nakl.DK_PAYER_ADDRESS,'
      'pr_nakl.outlet_recid,'
      'pr_nakl.outlet_baseid,'
      'dn.notes Comment,'
      'dn.operdate,'
      'sto.name outlet_name'
      'from doc_nakl dn'
      
        'left join LINK_DOC_AKCIA ld on ld.akcia_recid=dn.rECID and ld.ak' +
        'cia_baseid=dn.BASEID'
      
        'left join PROC_GET_NAKL_TITLE(coalesce(ld.parent_recid, dn.recid' +
        '), coalesce(ld.parent_baseid, dn.baseid), 1) pr_nakl on 1=1'
      
        'left join sprav_trade_outlet sto on sto.recid = pr_nakl.outlet_r' +
        'ecid and sto.baseid=pr_nakl.outlet_baseid'
      'left join sprav_dk sd_from on (sd_from.kod_dk = pr_nakl.dk_from)'
      'left join sprav_dk sd_to on (sd_to.kod_dk = pr_nakl.dk_to)'
      'where dn.recid = :RECID and dn.baseid = :BASEID')
    Transaction = DM.trMainWShort
    Database = DM.Money
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 408
    Top = 504
    object mdsImportAsnInWMSASNNUMBER: TFIBIntegerField
      FieldName = 'ASNNUMBER'
    end
    object mdsImportAsnInWMSWHSCODE: TFIBStringField
      FieldName = 'WHSCODE'
      Size = 0
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSWHSTOCODE: TFIBStringField
      FieldName = 'WHSTOCODE'
      Size = 0
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSSUPPLIERCODE: TFIBFloatField
      FieldName = 'SUPPLIERCODE'
    end
    object mdsImportAsnInWMSSUPPLIERNAME: TFIBStringField
      FieldName = 'SUPPLIERNAME'
      Size = 45
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSCOMMENT: TFIBStringField
      FieldName = 'COMMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSVENDORCODE: TFIBFloatField
      FieldName = 'VENDORCODE'
    end
    object mdsImportAsnInWMSVENDORTOCODE: TFIBFloatField
      FieldName = 'VENDORTOCODE'
    end
    object mdsImportAsnInWMSCUSTOMERNAME: TFIBStringField
      FieldName = 'CUSTOMERNAME'
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSTo_address: TFIBStringField
      FieldName = 'To_address'
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSDK_PAYER_ADDRESS: TFIBStringField
      FieldName = 'DK_PAYER_ADDRESS'
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSoutlet_recid: TFIBIntegerField
      FieldName = 'outlet_recid'
    end
    object mdsImportAsnInWMSoutlet_baseid: TFIBIntegerField
      FieldName = 'outlet_baseid'
    end
    object mdsImportAsnInWMSoperdate: TFIBDateTimeField
      FieldName = 'operdate'
    end
    object mdsImportAsnInWMSOUTLET_NAME: TFIBStringField
      FieldName = 'OUTLET_NAME'
      EmptyStrToNull = True
    end
  end
  object mdsImportAsnInWMSPos: TMegaRDataSet
    SelectSQL.Strings = (
      
        'select dnp.kod_mater GoodsCode, dnp.kolich Qty,'#39'B'#39' MuCode,DATEAD' +
        'D(day,iif(sm.is_age is not null,is_age,0 ),'
      'dnp.date_rozliva) BBD, dnp.date_rozliva PRD,'
      
        'slp.lotnumber LotNo,sm.manufacturer ProducerCode,sd.shortname_dk' +
        ' ProducerName,sm.madein CountryCode,'#39#39' SSCC, '#39#39' PoRegNo,0 PoLine' +
        'No,'
      ' '#39#39' GtdRegNo,0 GtdLineNo, '#39#39' Comment,'#39'N'#39' StockStatus'
      'from doc_nakl_pos dnp'
      'left join sprav_mater sm on (sm.kod_mater = dnp.kod_mater)'
      'left join sprav_dk sd on (sm.manufacturer = sd.kod_dk)'
      
        'left join sort_lot_positions slp on slp.nakl_recid = dnp.docrecn' +
        'o and slp.nakl_baseid=dnp.baseid'
      'where dnp.docrecno= :RECID and dnp.baseid = :BASEID')
    Transaction = DM.trMainWShort
    Database = DM.Money
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy'
    AutoFetchAll = False
    AutoRefresh = False
    AutoPost = False
    AutoDelete = False
    ConfirmPost = False
    ConfirmDelete = False
    Left = 352
    Top = 424
    object mdsImportAsnInWMSPosGOODSCODE: TFIBFloatField
      FieldName = 'GOODSCODE'
    end
    object mdsImportAsnInWMSPosQTY: TFIBFloatField
      FieldName = 'QTY'
    end
    object mdsImportAsnInWMSPosMUCODE: TFIBStringField
      FieldName = 'MUCODE'
      Size = 7
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSPosBBD: TFIBDateTimeField
      FieldName = 'BBD'
    end
    object mdsImportAsnInWMSPosPRD: TFIBDateTimeField
      FieldName = 'PRD'
    end
    object mdsImportAsnInWMSPosPRODUCERCODE: TFIBFloatField
      FieldName = 'PRODUCERCODE'
    end
    object mdsImportAsnInWMSPosPRODUCERNAME: TFIBStringField
      FieldName = 'PRODUCERNAME'
      Size = 45
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSPosCOUNTRYCODE: TFIBIntegerField
      FieldName = 'COUNTRYCODE'
    end
    object mdsImportAsnInWMSPosSSCC: TFIBStringField
      FieldName = 'SSCC'
      Size = 0
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSPosPOREGNO: TFIBStringField
      FieldName = 'POREGNO'
      Size = 0
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSPosPOLINENO: TFIBIntegerField
      FieldName = 'POLINENO'
    end
    object mdsImportAsnInWMSPosGTDREGNO: TFIBStringField
      FieldName = 'GTDREGNO'
      Size = 0
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSPosGTDLINENO: TFIBIntegerField
      FieldName = 'GTDLINENO'
    end
    object mdsImportAsnInWMSPosCOMMENT: TFIBStringField
      FieldName = 'COMMENT'
      Size = 0
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSPosSTOCKSTATUS: TFIBStringField
      FieldName = 'STOCKSTATUS'
      Size = 1
      EmptyStrToNull = True
    end
    object mdsImportAsnInWMSPoslotno: TFIBIntegerField
      FieldName = 'lotno'
    end
  end
  object qSortNakl: TMegaQuery
    Transaction = Nakl_Transaction
    Database = DM.Money
    SQL.Strings = (
      'select pos.nakl_recid, pos.nakl_baseid '
      'from sort_lot sl'
      
        'left join sort_lot_positions pos on sl.lotdate=pos.lotdate and s' +
        'l.lotnumber=pos.lotnumber and sl.baseid=pos.baseid'
      'where sl.nakl_recid = :recid'
      'and sl.nakl_baseid = :baseid')
    Left = 435
    Top = 362
  end
  object pmWMS: TPopupMenu
    Left = 888
    Top = 248
    object actExportSortToWMS1: TMenuItem
      Action = actExportSortToWMS
      Left = 12345
    end
    object WMS1: TMenuItem
      Action = actExportToWMS
      Left = 12345
    end
    object WMS2: TMenuItem
      Action = actExportOrderToWMS
      Left = 12345
    end
  end
end
