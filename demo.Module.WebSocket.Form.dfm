object FormWebSocket: TFormWebSocket
  Left = 0
  Top = 0
  Caption = 'FormWebSocket'
  ClientHeight = 597
  ClientWidth = 1031
  Color = 7223856
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object P_Main: TAmLayout
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 1011
    Height = 577
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    Color = 7223856
    TabOrder = 1
    OnAlignInsertBefore = P_MainAlignInsertBefore
    OnAlignPosition = P_MainAlignPosition
    BevelOuter = bvNone
    Caption = ''
    object P_Client: TAmLayout
      Left = 8
      Top = 3
      Width = 465
      Height = 571
      Align = alCustom
      Color = 5395485
      TabOrder = 0
      Caption = ''
      ColorBolder = 16744448
      ColorBolder2 = 16744448
      object P_ClientTop: TAmLayout
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 445
        Height = 265
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alTop
        Color = 5395485
        TabOrder = 0
        BevelOuter = bvNone
        Caption = ''
        DesignSize = (
          445
          265)
        object Label1: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 5
          Width = 439
          Height = 23
          Margins.Top = 5
          Align = alTop
          Alignment = taCenter
          Caption = 'Client'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 46
        end
        object Label8: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 27
          Width = 92
          Height = 16
          Margins.Top = 10
          Alignment = taCenter
          Caption = #1050#1083#1072#1089#1089'-'#1087#1088#1086#1090#1086#1082#1086#1083
          Color = 7223856
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label2: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 94
          Width = 99
          Height = 16
          Margins.Top = 10
          Alignment = taCenter
          Caption = 'Url '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
          Color = 7223856
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label3: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 161
          Width = 192
          Height = 16
          Margins.Top = 10
          Alignment = taCenter
          Caption = #1055#1088#1086#1082#1089#1080' (login:password||ip:port)'
          Color = 7223856
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object P_Client_Class: TAmComboBox
          Left = 10
          Top = 49
          Width = 425
          Height = 38
          Anchors = [akLeft, akTop, akRight]
          Color = 5921565
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          DropCanMove = False
          DropCanResize = False
          DropAnimate = waVER_POSITIVE
          DropAnimateTime = 120
          DropPaddingSize = 4
          DropColor = 5921565
          OnChange = SettingChange
          OnDropDown = P_Client_ClassDropDown
          Button.Left = 0
          Button.Top = 0
          Button.Width = 425
          Button.Height = 38
          Button.Align = alClient
          Button.Color = 5921565
          Button.Font.Charset = DEFAULT_CHARSET
          Button.Font.Color = 14080169
          Button.Font.Height = -13
          Button.Font.Name = 'Tahoma'
          Button.Font.Style = []
          Button.ParentFont = False
          Button.TabOrder = 1
          Button.Bolder.Color = 11389748
          Button.Bolder.ColorActive = 44223
          Button.Caption = ''
          Button.Ico.SizeProcent = 100
          DropListBox.Left = 0
          DropListBox.Top = 0
          DropListBox.Width = 121
          DropListBox.Height = 97
          DropListBox.Style = lbOwnerDrawFixed
          DropListBox.BevelInner = bvNone
          DropListBox.BevelOuter = bvNone
          DropListBox.BorderStyle = bsNone
          DropListBox.Color = 5329949
          DropListBox.ItemHeight = 30
          DropListBox.Items.Strings = (
            '11111111111'
            '222222222222'
            '3333333333'
            '4444444444444444444444444444444444444'
            '5555555555555'
            '66666666666666666666666666666666666666666666666666666'
            '7777777777777777777777')
          DropListBox.TabOrder = 0
          DropListBox.ColorItemMouseMovi = 6251042
          DropListBox.ColorItemSelect = 4227072
          DropListBox.TextItemCorrectX = 7
          DropListBox.ScrollVStandart = False
          DropListBox.ScrollHStandart = False
          DropListBox.ScrollV.Left = 104
          DropListBox.ScrollV.Top = 0
          DropListBox.ScrollV.Width = 17
          DropListBox.ScrollV.Height = 97
          DropListBox.ScrollV.ATheme.CanOpenEditor = True
          DropListBox.ScrollV.ATheme.AStyle = btmDefault
          DropListBox.ScrollV.ATheme.AStyleColor = btcWhite
          DropListBox.ScrollV.ATheme.AStyleSize = btsMid
          DropListBox.ScrollV.ATheme.AStyleSpeed = btdLow
          DropListBox.ScrollV.ATheme.Color = 12369084
          DropListBox.ScrollV.ATheme.Size = 17
          DropListBox.ScrollV.ATheme.ScalePercents = 0
          DropListBox.ScrollV.ATheme.Revers = False
          DropListBox.ScrollV.ATheme.IndentCorner = 0
          DropListBox.ScrollV.ATheme.TransparentMin = 200
          DropListBox.ScrollV.ATheme.TransparentMax = 255
          DropListBox.ScrollV.ATheme.SpeedDelay = 40
          DropListBox.ScrollV.ATheme.SpeedPage = -10
          DropListBox.ScrollV.ATheme.SpeedArrow = 20
          DropListBox.ScrollV.ATheme.SpeedArrowAtPage = 0
          DropListBox.ScrollV.ATheme.SpeedJumpOnClickArea = False
          DropListBox.ScrollV.ATheme.AreaColor = 15724527
          DropListBox.ScrollV.ATheme.AreaColorScrolling = 14869218
          DropListBox.ScrollV.ATheme.BorderColor = 13948116
          DropListBox.ScrollV.ATheme.BorderSize = 1
          DropListBox.ScrollV.ATheme.ThumbRounded = True
          DropListBox.ScrollV.ATheme.ThumbMinSize = 25
          DropListBox.ScrollV.ATheme.ThumbBorderColor = clSilver
          DropListBox.ScrollV.ATheme.ThumbBorderSize = 1
          DropListBox.ScrollV.ATheme.ThumbMarningSize = 3
          DropListBox.ScrollV.ATheme.ThumbFillColor = 13224393
          DropListBox.ScrollV.ATheme.ThumbFillColorActive = 11645361
          DropListBox.ScrollV.ATheme.ThumbFillColorPress = 7500402
          DropListBox.ScrollV.ATheme.ThumbMarkOffon = True
          DropListBox.ScrollV.ATheme.ThumbMarkColor1 = 7631988
          DropListBox.ScrollV.ATheme.ThumbMarkColor2 = clWhite
          DropListBox.ScrollV.ATheme.ArrowStyle = am_scbar_ArrowsNormal
          DropListBox.ScrollV.ATheme.ArrowBorderColor = 14342874
          DropListBox.ScrollV.ATheme.ArrowBorderSize = 0
          DropListBox.ScrollV.ATheme.ArrowFillProcent = 100
          DropListBox.ScrollV.ATheme.ArrowFillColor = 15132390
          DropListBox.ScrollV.ATheme.ArrowFillColorActive = 13092807
          DropListBox.ScrollV.ATheme.ArrowFillColorPress = 11645361
          DropListBox.ScrollV.ATheme.ArrowTriangleColor = 10132122
          DropListBox.ScrollV.ATheme.ArrowTriangleSize = 1
          DropListBox.ScrollV.FocusParent = True
          DropListBox.ScrollV.Position = 0
          DropListBox.ScrollV.Min = 0
          DropListBox.ScrollV.Max = 210
          DropListBox.ScrollV.PageSize = 97
          DropListBox.ScrollVNotVisible = False
        end
        object P_Client_Url: TAmEdit
          Left = 10
          Top = 116
          Width = 377
          Height = 38
          Anchors = [akLeft, akTop, akRight]
          Color = 5921565
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          TabOrder = 0
          BevelOuter = bvNone
          PyrimeterOpt.Active = True
          PyrimeterOpt.Left.Color = 11389748
          PyrimeterOpt.Left.Width = 1
          PyrimeterOpt.Top.Color = 11389748
          PyrimeterOpt.Top.Width = 1
          PyrimeterOpt.Right.Color = 11389748
          PyrimeterOpt.Right.Width = 1
          PyrimeterOpt.Bottom.Color = 11389748
          PyrimeterOpt.Bottom.Width = 1
          Edit.Font.Charset = DEFAULT_CHARSET
          Edit.Font.Color = 14080169
          Edit.Font.Height = -13
          Edit.Font.Name = 'Tahoma'
          Edit.Font.Style = []
          Edit.ParentFont = False
          Edit.TabOrder = 0
          Edit.Text = 'Edit'
          EditMargins.Left = 5
          EditMargins.Top = 1
          EditMargins.Right = 3
          OnEditChange = SettingChange
          DesignSize = (
            377
            38)
        end
        object P_Client_Ssl: TAmCheckBox
          Left = 10
          Top = 230
          Width = 140
          Height = 22
          Color = 5921565
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          Caption = 'Ssl '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077
          CaptionOpt.Ellips = epNone
          Checked = True
          CheckedOpt.CheckColor.Color = 14080169
          CheckedOpt.CheckColor.ColorActive = 14080169
          CheckedOpt.RectBolderColor.Color = 13553256
          CheckedOpt.RectBolderColor.ColorActive = 13553256
          CheckedOpt.RectColor.Color = 8421440
          CheckedOpt.RectColor.ColorActive = 8421440
          OnChangeChecked = SettingChange
        end
        object P_Client_Proxy: TAmEdit
          Left = 10
          Top = 183
          Width = 425
          Height = 38
          Anchors = [akLeft, akTop, akRight]
          Color = 5789981
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          TabOrder = 3
          BevelOuter = bvNone
          PyrimeterOpt.Active = True
          PyrimeterOpt.Left.Color = 11389748
          PyrimeterOpt.Left.Width = 1
          PyrimeterOpt.Top.Color = 11389748
          PyrimeterOpt.Top.Width = 1
          PyrimeterOpt.Right.Color = 11389748
          PyrimeterOpt.Right.Width = 1
          PyrimeterOpt.Bottom.Color = 11389748
          PyrimeterOpt.Bottom.Width = 1
          Edit.Font.Charset = DEFAULT_CHARSET
          Edit.Font.Color = 14080169
          Edit.Font.Height = -13
          Edit.Font.Name = 'Tahoma'
          Edit.Font.Style = []
          Edit.ParentFont = False
          Edit.TabOrder = 0
          Edit.Text = 'Edit'
          EditMargins.Left = 5
          EditMargins.Top = 1
          EditMargins.Right = 3
          OnEditChange = SettingChange
          DesignSize = (
            425
            38)
        end
        object P_Client_Connect: TAmButton
          Left = 172
          Top = 230
          Width = 121
          Height = 27
          Color = 5789981
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = P_Client_ConnectClick
          Bolder.Color = 11389748
          Bolder.ColorActive = 44223
          Bolder.BolderSizeActive = 1
          Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1089#1103
          Ico.SizeProcent = 100
        end
        object P_Client_SendOpen: TAmButton
          Left = 298
          Top = 230
          Width = 121
          Height = 27
          Color = 5527069
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = P_Client_SendOpenClick
          Bolder.Color = 11389748
          Bolder.ColorActive = 44223
          Bolder.BolderSizeActive = 1
          Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100'...'
          Ico.SizeProcent = 100
        end
        object P_Client_UrlListOpen: TAmButton
          Left = 392
          Top = 116
          Width = 43
          Height = 38
          Anchors = [akTop, akRight]
          Color = 5921565
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = P_Client_UrlListOpenClick
          Bolder.Color = 11389748
          Bolder.ColorActive = 44223
          Bolder.BolderSizeActive = 1
          Caption = '...'
          Ico.SizeProcent = 100
        end
      end
      object P_Client_Log: TAmMemo
        AlignWithMargins = True
        Left = 20
        Top = 290
        Width = 425
        Height = 276
        Margins.Left = 20
        Margins.Top = 5
        Margins.Right = 20
        Margins.Bottom = 5
        Align = alClient
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 4144917
        Ctl3D = False
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'AmMemo1')
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
        WordWrap = False
        ScrollVert.Left = 412
        ScrollVert.Top = 0
        ScrollVert.Width = 13
        ScrollVert.Height = 263
        ScrollVert.AThemeLink = SbThemeClient
        ScrollVert.FocusParent = True
        ScrollVert.Position = 0
        ScrollVert.Min = 0
        ScrollVert.Max = 2
        ScrollVert.PageSize = 15
        ScrollVert.Align = alRight
        ScrollHorz.Left = 0
        ScrollHorz.Top = 263
        ScrollHorz.Width = 425
        ScrollHorz.Height = 13
        ScrollHorz.AThemeLink = SbThemeClient
        ScrollHorz.Kind = sbHorizontal
        ScrollHorz.FocusParent = True
        ScrollHorz.Position = 0
        ScrollHorz.Min = 0
        ScrollHorz.Max = 65535
        ScrollHorz.PageSize = 391
        ScrollHorz.Align = alBottom
        MarginsText.Left = 10
        MarginsText.Top = 10
        MarginsText.Right = 10
        MarginsText.Bottom = 10
        ColorMargins = clBlack
      end
    end
    object P_Server: TAmLayout
      Left = 527
      Top = 3
      Width = 472
      Height = 567
      Align = alCustom
      Color = 3161689
      TabOrder = 1
      Caption = ''
      ColorBolder = 16744448
      ColorBolder2 = 16744448
      object AmLayout1: TAmLayout
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 452
        Height = 266
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alTop
        Color = 3161689
        TabOrder = 0
        BevelOuter = bvNone
        Caption = ''
        DesignSize = (
          452
          266)
        object Label6: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 5
          Width = 446
          Height = 23
          Margins.Top = 5
          Align = alTop
          Alignment = taCenter
          Caption = 'Server'
          Color = 3096410
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10994394
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 54
        end
        object Label7: TLabel
          AlignWithMargins = True
          Left = 11
          Top = 27
          Width = 92
          Height = 16
          Margins.Top = 10
          Alignment = taCenter
          Caption = #1050#1083#1072#1089#1089'-'#1087#1088#1086#1090#1086#1082#1086#1083
          Color = 7223856
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10994394
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label5: TLabel
          AlignWithMargins = True
          Left = 302
          Top = 27
          Width = 28
          Height = 16
          Margins.Top = 10
          Alignment = taCenter
          Anchors = [akTop, akRight]
          Caption = #1055#1086#1088#1090
          Color = 7223856
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10994394
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label10: TLabel
          AlignWithMargins = True
          Left = 11
          Top = 118
          Width = 183
          Height = 16
          Margins.Top = 10
          Alignment = taCenter
          Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1099#1093' '#1082#1083#1080#1077#1085#1090#1086#1074
          Color = 7223856
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10994394
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object P_Server_Ssl: TAmCheckBox
          Left = 11
          Top = 91
          Width = 140
          Height = 22
          Color = 3096410
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10994394
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          Caption = 'Ssl '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077
          CaptionOpt.Ellips = epNone
          CheckedOpt.CheckColor.Color = 12439775
          CheckedOpt.CheckColor.ColorActive = 15923193
          CheckedOpt.RectBolderColor.Color = 10994394
          CheckedOpt.RectBolderColor.ColorActive = 10994394
          CheckedOpt.RectColor.Color = 3823749
          CheckedOpt.RectColor.ColorActive = 3823749
          OnChangeChecked = SettingChange
        end
        object P_Server_Run: TAmButton
          Left = 395
          Top = 49
          Width = 42
          Height = 38
          Anchors = [akTop, akRight]
          Color = 3096410
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = P_Server_RunClick
          Bolder.Color = 8301255
          Bolder.ColorActive = 44223
          Bolder.BolderSizeActive = 1
          Caption = ''
          Ico.SizeProcent = 60
          Ico.SizeFix = 0
          Ico.PosH = tvphCentr
        end
        object P_Server_SocketClass: TAmComboBox
          Left = 11
          Top = 49
          Width = 288
          Height = 38
          Anchors = [akLeft, akTop, akRight]
          Color = 3096410
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10994394
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          DropCanMove = False
          DropCanResize = False
          DropAnimate = waVER_POSITIVE
          DropAnimateTime = 120
          DropPaddingSize = 4
          DropColor = 4216185
          OnChange = SettingChange
          OnDropDown = P_Server_SocketClassDropDown
          Button.Left = 0
          Button.Top = 0
          Button.Width = 288
          Button.Height = 38
          Button.Align = alClient
          Button.Color = 3096410
          Button.Font.Charset = DEFAULT_CHARSET
          Button.Font.Color = 10994394
          Button.Font.Height = -13
          Button.Font.Name = 'Tahoma'
          Button.Font.Style = []
          Button.ParentFont = False
          Button.TabOrder = 1
          Button.Bolder.Color = 8301255
          Button.Bolder.ColorActive = 44223
          Button.Caption = ''
          Button.Ico.SizeProcent = 100
          DropListBox.Left = 0
          DropListBox.Top = 0
          DropListBox.Width = 121
          DropListBox.Height = 97
          DropListBox.Style = lbOwnerDrawFixed
          DropListBox.BevelInner = bvNone
          DropListBox.BevelOuter = bvNone
          DropListBox.BorderStyle = bsNone
          DropListBox.Color = 3161689
          DropListBox.ItemHeight = 30
          DropListBox.Items.Strings = (
            '11111111111'
            '222222222222'
            '3333333333'
            '4444444444444444444444444444444444444'
            '5555555555555'
            '66666666666666666666666666666666666666666666666666666'
            '7777777777777777777777')
          DropListBox.TabOrder = 0
          DropListBox.ColorItemMouseMovi = 3952239
          DropListBox.ColorItemSelect = 5401240
          DropListBox.TextItemCorrectX = 7
          DropListBox.ScrollVStandart = False
          DropListBox.ScrollHStandart = False
          DropListBox.ScrollV.Left = 104
          DropListBox.ScrollV.Top = 0
          DropListBox.ScrollV.Width = 17
          DropListBox.ScrollV.Height = 97
          DropListBox.ScrollV.ATheme.CanOpenEditor = True
          DropListBox.ScrollV.ATheme.AStyle = btmDefault
          DropListBox.ScrollV.ATheme.AStyleColor = btcWhite
          DropListBox.ScrollV.ATheme.AStyleSize = btsMid
          DropListBox.ScrollV.ATheme.AStyleSpeed = btdLow
          DropListBox.ScrollV.ATheme.Color = 12369084
          DropListBox.ScrollV.ATheme.Size = 17
          DropListBox.ScrollV.ATheme.ScalePercents = 0
          DropListBox.ScrollV.ATheme.Revers = False
          DropListBox.ScrollV.ATheme.IndentCorner = 0
          DropListBox.ScrollV.ATheme.TransparentMin = 200
          DropListBox.ScrollV.ATheme.TransparentMax = 255
          DropListBox.ScrollV.ATheme.SpeedDelay = 40
          DropListBox.ScrollV.ATheme.SpeedPage = -10
          DropListBox.ScrollV.ATheme.SpeedArrow = 20
          DropListBox.ScrollV.ATheme.SpeedArrowAtPage = 0
          DropListBox.ScrollV.ATheme.SpeedJumpOnClickArea = False
          DropListBox.ScrollV.ATheme.AreaColor = 15724527
          DropListBox.ScrollV.ATheme.AreaColorScrolling = 14869218
          DropListBox.ScrollV.ATheme.BorderColor = 13948116
          DropListBox.ScrollV.ATheme.BorderSize = 1
          DropListBox.ScrollV.ATheme.ThumbRounded = True
          DropListBox.ScrollV.ATheme.ThumbMinSize = 25
          DropListBox.ScrollV.ATheme.ThumbBorderColor = clSilver
          DropListBox.ScrollV.ATheme.ThumbBorderSize = 1
          DropListBox.ScrollV.ATheme.ThumbMarningSize = 3
          DropListBox.ScrollV.ATheme.ThumbFillColor = 13224393
          DropListBox.ScrollV.ATheme.ThumbFillColorActive = 11645361
          DropListBox.ScrollV.ATheme.ThumbFillColorPress = 7500402
          DropListBox.ScrollV.ATheme.ThumbMarkOffon = True
          DropListBox.ScrollV.ATheme.ThumbMarkColor1 = 7631988
          DropListBox.ScrollV.ATheme.ThumbMarkColor2 = clWhite
          DropListBox.ScrollV.ATheme.ArrowStyle = am_scbar_ArrowsNormal
          DropListBox.ScrollV.ATheme.ArrowBorderColor = 14342874
          DropListBox.ScrollV.ATheme.ArrowBorderSize = 0
          DropListBox.ScrollV.ATheme.ArrowFillProcent = 100
          DropListBox.ScrollV.ATheme.ArrowFillColor = 15132390
          DropListBox.ScrollV.ATheme.ArrowFillColorActive = 13092807
          DropListBox.ScrollV.ATheme.ArrowFillColorPress = 11645361
          DropListBox.ScrollV.ATheme.ArrowTriangleColor = 10132122
          DropListBox.ScrollV.ATheme.ArrowTriangleSize = 1
          DropListBox.ScrollV.FocusParent = True
          DropListBox.ScrollV.Position = 0
          DropListBox.ScrollV.Min = 0
          DropListBox.ScrollV.Max = 210
          DropListBox.ScrollV.PageSize = 97
          DropListBox.ScrollVNotVisible = False
        end
        object P_Server_Port: TAmEdit
          Left = 303
          Top = 49
          Width = 88
          Height = 38
          Anchors = [akTop, akRight]
          Color = 3096410
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10994394
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          TabOrder = 3
          BevelOuter = bvNone
          PyrimeterOpt.Active = True
          PyrimeterOpt.Left.Color = 8301255
          PyrimeterOpt.Left.Width = 1
          PyrimeterOpt.Top.Color = 8301255
          PyrimeterOpt.Top.Width = 1
          PyrimeterOpt.Right.Color = 8301255
          PyrimeterOpt.Right.Width = 1
          PyrimeterOpt.Bottom.Color = 8301255
          PyrimeterOpt.Bottom.Width = 1
          Edit.Font.Charset = DEFAULT_CHARSET
          Edit.Font.Color = 10994394
          Edit.Font.Height = -13
          Edit.Font.Name = 'Tahoma'
          Edit.Font.Style = []
          Edit.ParentFont = False
          Edit.TabOrder = 0
          Edit.Text = '22'
          Edit.acColorBad = 2237068
          Edit.acOffon = True
          Edit.acRegular = '\d+'
          EditMargins.Left = 5
          EditMargins.Top = 1
          EditMargins.Right = 3
          OnEditChange = SettingChange
          DesignSize = (
            88
            38)
        end
        object P_Server_ClientList: TAmComboBox
          Left = 11
          Top = 140
          Width = 380
          Height = 38
          Anchors = [akLeft, akTop, akRight]
          Color = 3096410
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10994394
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          DropCanMove = False
          DropCanResize = False
          DropAnimate = waVER_POSITIVE
          DropAnimateTime = 120
          DropPaddingSize = 4
          DropColor = 4216185
          OnChangeIndex = P_Server_ClientListChangeIndex
          OnChange = SettingChange
          Button.Left = 0
          Button.Top = 0
          Button.Width = 380
          Button.Height = 38
          Button.Align = alClient
          Button.Color = 3096410
          Button.Font.Charset = DEFAULT_CHARSET
          Button.Font.Color = 10994394
          Button.Font.Height = -13
          Button.Font.Name = 'Tahoma'
          Button.Font.Style = []
          Button.ParentFont = False
          Button.TabOrder = 1
          Button.Bolder.Color = 8301255
          Button.Bolder.ColorActive = 44223
          Button.Caption = ''
          Button.Ico.SizeProcent = 100
          DropListBox.Left = 0
          DropListBox.Top = 0
          DropListBox.Width = 121
          DropListBox.Height = 97
          DropListBox.Style = lbOwnerDrawFixed
          DropListBox.BevelInner = bvNone
          DropListBox.BevelOuter = bvNone
          DropListBox.BorderStyle = bsNone
          DropListBox.Color = 3161689
          DropListBox.ItemHeight = 30
          DropListBox.TabOrder = 0
          DropListBox.ColorItemMouseMovi = 3952239
          DropListBox.ColorItemSelect = 5401240
          DropListBox.TextItemCorrectX = 7
          DropListBox.ScrollVStandart = False
          DropListBox.ScrollHStandart = False
          DropListBox.ScrollV.Left = 104
          DropListBox.ScrollV.Top = 0
          DropListBox.ScrollV.Width = 17
          DropListBox.ScrollV.Height = 97
          DropListBox.ScrollV.Visible = False
          DropListBox.ScrollV.ATheme.CanOpenEditor = True
          DropListBox.ScrollV.ATheme.AStyle = btmDefault
          DropListBox.ScrollV.ATheme.AStyleColor = btcWhite
          DropListBox.ScrollV.ATheme.AStyleSize = btsMid
          DropListBox.ScrollV.ATheme.AStyleSpeed = btdLow
          DropListBox.ScrollV.ATheme.Color = 12369084
          DropListBox.ScrollV.ATheme.Size = 17
          DropListBox.ScrollV.ATheme.ScalePercents = 0
          DropListBox.ScrollV.ATheme.Revers = False
          DropListBox.ScrollV.ATheme.IndentCorner = 0
          DropListBox.ScrollV.ATheme.TransparentMin = 200
          DropListBox.ScrollV.ATheme.TransparentMax = 255
          DropListBox.ScrollV.ATheme.SpeedDelay = 40
          DropListBox.ScrollV.ATheme.SpeedPage = -10
          DropListBox.ScrollV.ATheme.SpeedArrow = 20
          DropListBox.ScrollV.ATheme.SpeedArrowAtPage = 0
          DropListBox.ScrollV.ATheme.SpeedJumpOnClickArea = False
          DropListBox.ScrollV.ATheme.AreaColor = 15724527
          DropListBox.ScrollV.ATheme.AreaColorScrolling = 14869218
          DropListBox.ScrollV.ATheme.BorderColor = 13948116
          DropListBox.ScrollV.ATheme.BorderSize = 1
          DropListBox.ScrollV.ATheme.ThumbRounded = True
          DropListBox.ScrollV.ATheme.ThumbMinSize = 25
          DropListBox.ScrollV.ATheme.ThumbBorderColor = clSilver
          DropListBox.ScrollV.ATheme.ThumbBorderSize = 1
          DropListBox.ScrollV.ATheme.ThumbMarningSize = 3
          DropListBox.ScrollV.ATheme.ThumbFillColor = 13224393
          DropListBox.ScrollV.ATheme.ThumbFillColorActive = 11645361
          DropListBox.ScrollV.ATheme.ThumbFillColorPress = 7500402
          DropListBox.ScrollV.ATheme.ThumbMarkOffon = True
          DropListBox.ScrollV.ATheme.ThumbMarkColor1 = 7631988
          DropListBox.ScrollV.ATheme.ThumbMarkColor2 = clWhite
          DropListBox.ScrollV.ATheme.ArrowStyle = am_scbar_ArrowsNormal
          DropListBox.ScrollV.ATheme.ArrowBorderColor = 14342874
          DropListBox.ScrollV.ATheme.ArrowBorderSize = 0
          DropListBox.ScrollV.ATheme.ArrowFillProcent = 100
          DropListBox.ScrollV.ATheme.ArrowFillColor = 15132390
          DropListBox.ScrollV.ATheme.ArrowFillColorActive = 13092807
          DropListBox.ScrollV.ATheme.ArrowFillColorPress = 11645361
          DropListBox.ScrollV.ATheme.ArrowTriangleColor = 10132122
          DropListBox.ScrollV.ATheme.ArrowTriangleSize = 1
          DropListBox.ScrollV.FocusParent = True
          DropListBox.ScrollV.Position = 0
          DropListBox.ScrollV.Min = 0
          DropListBox.ScrollV.Max = 1
          DropListBox.ScrollV.PageSize = 97
          DropListBox.ScrollVNotVisible = False
        end
        object P_Server_SendMessageToClient: TAmButton
          Left = 395
          Top = 140
          Width = 42
          Height = 38
          Anchors = [akTop, akRight]
          Color = 3096410
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14080169
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = P_Server_SendMessageToClientClick
          Bolder.Color = 8301255
          Bolder.ColorActive = 44223
          Bolder.BolderSizeActive = 1
          Caption = ''
          Ico.SizeProcent = 60
          Ico.Picture.Data = {
            0954416D50686F746F6E89504E470D0A1A0A0000000D49484452000000800000
            00800806000000C33E61CB0000000473424954080808087C0864880000000970
            48597300000EC400000EC401952B0E1B00001B5D4944415478DAED5D09901CD5
            79FE7BEE3DA55DB43A5642273A0D48DC37429C2212C62888C3151C7062135770
            C938B6C14ECA8E524E4C2555293BF8AEA288CB31874E0468110864716B11D820
            1085168CEE5DDDD26ACF99E9EE97FF7B336FA667A667A6E7D89D1969BEAA99BE
            FB7FFDFEEFFDFFFF8E7EAD5115A735B45227E074C36FFED234E2EB538F9FD434
            12A54E0B5025C030E1671D63E7B8C9BD96153F4308718CB5FF6B6D44F8270F8C
            39DC5BCA745509304C78B4A3F535B7E6BEAAD93F8AFAF53EF913240E6882BEFF
            8F333A7F572A8B5025C030E0F19D14E80D8FEF6DF68D728FF43751C05D477D7A
            0F75F5EFA3B01924B6085BC945CBBE39BDF3EDE14E5B9500C300F8FD905177A2
            9615DF6FF4B1AE5DD452339646F9C7D0D1E0213A34D045A630049B8027BDA47D
            EF1B33F7ED1FAEB45509300C9004D0EB4E68B0F3226EE9BD2E1FB5D69E49B59E
            7A690D4E848EC22DF4F3498F34F83BFFEBBE293438D469AB1260180002049900
            E98ED73101C6D74E84F2697FDF1E69259804BB78FBA165B33A570C65DAAA0418
            06480284EB4F643B0F01E2D8DA09D413EE96164137C3CC03F335D325963D38B3
            F3FDA1485B9500C3001060D001010097E6A63135E3980C2D7478E0001D1E3C00
            1298EC381ED3DCFA3F2F9B71E07031D35625C030E011264020E48C000A7E7740
            C60701770D75F6EFA5EED071B8856E41DABFD5CEDEFBE8FD1A858B91B6538300
            9C2B3FE267F9782569735AF899AE216A7D8FB4CE0069CD3ED28EED27ADD1CFFB
            274CA07AB7A19D3C6C6A351E53EB739B5AA05B68031EA1353511F5BB4C6DB087
            349FAB410BF2BAAF5FF05268F5F544215E7A791B4B0FFFC21A2F076B34AA25F2
            68D1ED6064999C3C97CBD3E816AE6DF93C5A83B791C6D74DA2B008737CB09B06
            F50104921D1A990F7EEB0BFBDB0ACDBACA204054C1B6C7B693A7855A7CC2E5F5
            87C9E3E348DB4F14F687C39A1FEB6E72F984C7F09111D9E62BF8C74B93979AE9
            679BEB8BED13589A7E8DD74DECE36D4D1E17F23A2DBA0FE78AE83EFEF9B09F93
            C874C3710139EE6267C1A8C0188E0F5AE944F0988C0F0C6180081B4CB7FEE077
            66757D92EF7D2B9A005FA0A51AED255F2335D6989A566B905E6392BBC64D668D
            AE6BB582979A5B2A8B8B2A05888F4714C54A3645C02033A04191501C2F458400
            3EBE0E8A64DBC13F327C26AF7389E32A3A79D91F7BF9386F0B8F29D785878FC9
            753EDFC3E743F92EBBC7E80BF7CA002F5FB8350F8DAB9B40237DCD7470603FC7
            080741029DE3839FBBEBB4E50F4ED99D939B012A8A0052E149087436B1D2EA6B
            5D41ADCEE30FD688B0A7566866ADCB43353A895A4D88808B89C09954C36A0908
            03EB52F101134BA1452C0113C044E967A573CC1525009341135E490A2197F879
            4C125E8D0C0FEFF3F0396E2C05E9AC7CC1CAE7989D842D017A42DD743C78B4E0
            EC08786A6802BB05B423EC63B780FBB2CCC39CD61FF6CED9FBDBE5CC48A7F7AA
            2802D81EDB3E875DC061DF497601017601C1A0E677B922E65ED3C25CFA5D3E37
            BB75947203FB8C88E997E69CDD80706BD2842B17204B7F745D9A7617F9B0AD89
            8895C07D44CC1510E4F884740F22806D5891A17001768025185F3F9106382E40
            7C10340611286EE3F42CFBEE39BB373BB9474602ECDCB93370F4E8D1EB4CD3BC
            CCE5724DE55D3568CD1A7E08FB9E1261B25E74CDE0D0CC24846D3A2F799DB775
            11722174D3799FE0A54121B729C22ED31576092C897F1AAFF3D2A0B09BEF13D9
            16BA3C26E4BD743E06931E5937E5BD22EB820C972974B7D022EB91FD861BEB64
            13080E155818B570B57134C70747070FD1C1FEFD323E6022ACD6BDF49DEFCFDE
            BD2BD3F5B609DDB66D5B533018FC012BFBEBACF846289D97F2571A02A4A50083
            3D39E9FC0B477FD675BBEDE83E11B6DF6FDD16D9EE633D168A6D8B1274EC795D
            5E6AAD9B488DBE91D4D5B7978E30193819834C84FFD668E03FBE3BEF609FDD75
            29DA7CF7DD7717B14F7BDCED76B7040201AAADAD259FCF471E8F27F1C2612582
            489BA90204604519516519723D145DE7A5D0E5D2900A0D458E4359C2EEDCC831
            DBFDB17B8493EE977CCF10A7C9B10B2E3AD0AF7066C36456AC8BF6F5EEA4DE70
            0F02C54ED6D6C30FCDDBF5FBE4F313B4D8DEDEFE0FACE89F7BBD5EF7C89123C9
            EFF74B45B30B903FABD287930011E5DB13C014464CF1668C047165C58F45F659
            D7CD044527AEDB9F6FBD2E8948148A91A5940450680E8CA2568E0FFA423D323E
            08192110A19D03C5653F98B7AB3DA647B5B275EBD6DB59A94FD7D4D4B89A9B9B
            A5B9673740E170A4C109DBF202567C29DC40560B605578B2F295D21296362489
            967EFBEB4249D7C7F7C70844E5430000CDCA636BC7534BED583AD4DFC5F14127
            19A6C12135FD3EE80D3DB8FCEC7DC7A426B76CD932814BFE762EF18DA3468D92
            A57D60608094EF574A4F56FC701121930500010C11F5C1D2DCC7AD4044817AB4
            2487528960517A0A39EC8891814456AB532E0450F0B9FD34A17E12D5F91A685F
            CF6E3A3E7804FD0B9F72047B91D4E03BEFBCF3B8D7EBB977D4A81699A5030383
            C431404AE057AA00305308286440A74715ACA794E054C5855263061BF39E722C
            E5BEA1D87D935D0695190114EA7D8D1C1F4CA17EBD977677FF05447D5863BF3F
            9695BCBBA1A1C1575F5F4F7D7D7D52F98A00805A960A99A26A53E81645EB29E6
            585980449F9E5892ADCA4C25402A611289154A891FCACD0258A1A1DA1875091A
            894740806F70D0F7CB33CE3843FA7C9472A57CE5024A8D5C08906A92755B8525
            2BDC3628CC723C1E3C2612A59C0910CF541172BB8D8B408027D8F7DF8DA81F04
            40750F0448E7F74B92D6BC08A094A22799EAF87ADC6D846CCF49547E28851495
            4B0071886DC1BD3FBAB8E30510E09DBABABA8B50E5C3783510A0D48D3E29C9CD
            46809862749BD2AAC79464A69020B99D20AEF064B224C60F7AA22549B22CE54A
            00D66F9855FA8B80DBF8D7872FFC5CF64A695CFDFB0B13602A940DE52B02944B
            E99709CF8300B62539B9D4266DA70BEAECC9907C2C14DB2E4F02982F681EEDDB
            CB2FEC48E83A06017672DD7FB252BE35FA2F17382580A1D69394A5CCBC21E24B
            D3A2B06485662286AD1BB15884B223803077084D7CFBC7977D6A3B7844122010
            F04FF67A7D310B1009FECAA3F4CB67B0FC27032D8171A5E809A53DB9F4A76CDB
            58846C16239D15D1453C4E280B0208EAE6307FF98E7D9FFC62E51DCCCE34D0DE
            79E71D26408009E04D2240255900E5C7ED08A0E7408064DFAE5C4A28C5BA24DF
            C7B0B88C5212007D00935DF3A9599B76D95F5FFA4F5BB29EAF08800E1F987F6B
            0C502E704600ABD9D72D4AD16D94A5A751621AE566383721102CB10B18E39D43
            E707FE96EA8C5634E1CFBBF4D24B3FC876CDA945004B2C90E0AFB3283CF15C75
            7D28E55E996286788C31FC0468F08CA68B1BEFA549DE4B65DF4DB40FC7190110
            037015B0A209A032DEAAECB8B2F48C4A4FBC36DD3936F72A030278343F5D30F2
            0E9ADB701B46A691AEEB8511C05A0BA81402A0ED02192E304A9697A65C37A3FB
            A2DB967DF1E346CA7133EB7D8CF87DD4B1D87AFC7EC901ABCEE478EBD8EF8A96
            1FD0CC8CFA6BE88AE6FBA8DE13E9BC330C233F02445C80B516A0FA00CA870095
            8EA0D94BBFD9795751EE35263083AE3EE36B342E303BB60FC4D3F53801422110
            40774E8072B700958EA0D14BBFDA797741F7A87537D195677C8566375CCBBA49
            ACA1D959005EAF12A05C1034FAE8979FE74700B7E6A5F3477E912E6E5E4A3E57
            ADED3955029439069900BFF8ECCB395F7756FD2534BFE5AB34D23736E3794344
            805267DBA90310E0D14FFFC6F1F92DFE89B460F4DFD1A4BA731D9D8F7787F326
            407B7B7BD5020C3124013AEEC97A5EC05D4F57B6DC4D7347DE28C7F339859D05
            E0ED2A01CA0541A39F7EBA233D015C1CD49DD7B490AE68B9836ADC0D39DFBF4A
            800AC0CF777C9D7AF46329FBA7D6CFA56BC7DC4B2D8133F3BEF71011A0D45976
            6AE183E39B68FDBE5FC7B69BFC63E9FAB15FA1E98D17167C6FBB18C03101B66C
            D9126B08F27AD570B0AA05180AECEFFF943A073EA3668EEAA7D49F9B939FCF84
            640B808620C3309D13A0EA022A1B762E80F7550970BA60880850EAC7AAC229EC
            6200C70478EBADB762E301AA16A0326167018410E5458023478ED09E3D7BE8D8
            B16334381879F56CC48811D4DADA4A679E79A6DC1E0A40DEEEDDBBE512EF3B42
            4E6363238D1B378E264E9C98F2DA7BB170E2C409DAB56B171D3D7A3426B7A1A1
            21261743F08A85B22500FAEA3FF9E4137AFBEDB7E9D0A14369CFABA9A9A179F3
            E6D125975C429893A018D8B163075E7AA5AEAEAEB4E7E05D88B973E7D265975D
            26D3500C7CF6D96752EEBE7DFBD29E83BC3EE79C73A45CBC8E57280A24C09BB6
            0428743C406F6F0FAD5FDF264BBD14C4846A6A6A923FC842827B7A7AA46550AF
            A0D7D7D7D1C28537D3942953F2963B30D04F6D6D6DF4F9E73BD3CAEDEDED9572
            43A1C8605928FFA69B6EA4E9D367E42D37181CA40D1B365047C7A7B17D78DB0A
            AFDA83685092920B0501D87FC30D37D0ECD9B3F3152B81F100C9040885C2F3AE
            BAEAAAEC0478F3CD378B6E018E1F3F4EAB56AD920F8C7B4D9B368D66CC982167
            1B4906120E926CDFBE3DF64AFAB5D75E4BE79EEBAC23C48AEEEE6E5ABD7AB55C
            E23E20D2CC99336D4B1914B277EF5E29172FC4029C6174E185B937CC80C86BD6
            AC916E0672274F9E2CE5C2E4DBC9DDBF7FBF948BEB002EA9D21AE48B7423824A
            4280FEFE7E7AFAE9A7E5C341E1175F7CB12C09D980C4BFF7DE7BD26443F6A245
            8B68EAD4A98EE5E2A157AC5821C9073702B9287DD9808C7BFFFDF72519201725
            72D6AC598EE522C341F6C3870F4B0B73D14517514B4B8B23A56DDBB64DC609C0
            35D75C9317E9D5BD86800079A5855E7861036617934AB8FCF2CB73F2E98819A0
            0C9000E6F1AEBBEEA2BABA5A47D7BEF2CA2BECF73BA412509AEAEAEA724A3794
            01BF8DE0ECCE3BEFE440D159A7CCEBAFBF411F7EF8A1CC3BC8B52BF599F0F1C7
            1F4B1220DF972E5DCAA46DCA39CFE3D5C0308682E54E80623504757676B2DF5F
            2FD72FB8E002E97773051EA4BDBD5D5A12F8C62BAFBC32EB350830D7AD5B27D7
            114C629693DC33D1C44419D26DC165C10D6503AC0D5C0E888BA06ECC983139CB
            C5B5B07CA835A036B470E1C2BCD29ED8141C2A0D01366EDC284BD1E8D1A37332
            A3C940A0849281B4A034C21A64C2ABAFBECA41DFE7D2E49F7DF6D979CB851260
            09F0EC288DD9AC08D7A0646D03D559D426F205DCE59FFFFC67B9BE64C91279BF
            5C502001DE600214EE022078C58A95323173E6CCC9D9145A8152F1C1071F4853
            0637326D5AFA58C0304C5AB972A5948FC0CB49BC910930E7B03EF0E5B366CDCC
            98C655AB56CB368DE9D3A73B8A3732014121ACCF79E7CDCB99C4C92D816A54B0
            2302BCF1C61B45E90D3C78F0206DDEBC595E5F482954802541230ACC71A6C81C
            91372C0F480BB985B65F20FE804B41634DA6C8BCA7E72457375F90EB905B6843
            16F2EFC08103B2A1E8EAABAFCEE95A3B0B8021618E09500C1780C00F660C41DF
            A449930ACA0C00FE158A803BC91407207ADFBA75AB0CFE0A693F504015128A40
            FCB260C182B4E7E11CB800E419485A28E0061043A1CA7AE38D37E6746D810478
            BD282E003EF8A38FB6CB461528AD50C01CC20260EEA22BAEB83CED797BF6EC95
            3507102F9F202C1930FFA8D28D18D148F3E7CF4F7B5E57D78118F1506A0B055C
            09AC00AACED75F7F5D4ED7DAB9005D379C11E0F5D75F2F8A0B508D2AA84615EA
            0F012802A502117D261700938D7801E405590A051AA34E9E3C2903B14C2E0024
            41F48EFCCAA7D6910C1000D60781271AA472819D05C08820C70428860B80C9FE
            D39FFE24AF2B2400B466081E64FCF8F1196B1450164A22804E9E62C98535C914
            CB80A0E8E300F0BC85C61E0878F1039972AD510C1101727B0024E0EDB7B7C8C4
            A849260A011E0691F6CC9933329A76983F2802F28B29F7ACB3CEA2D6D6F4A61D
            DF7F6C6FDF8236F7A2CA4533F2C489B90D104D6E085243C21C11E0B5D75E2BDA
            9840D4896109F0204850BE507314E177FEF9E767EDB2450F1CDA0E0A95ABE648
            C4F2BCF3CE93FE3D1310F8C26F174B2E306FDE5C8E6772EB99B4B3001810E298
            00C56A0882CFEEE8E890EB309148503E998148184BB4A9A33A960D90856E6728
            023E5CF52EE60AC8C5B323867152A380BB408315E42AD751885CB461E453A328
            1201304790374A80FCA788DBBD7B8F0C66902858835C49A0A6A90719D1C002AB
            E4047BF7EE8B591FB40DE42A17411F6A1278FEE9D3CFCA5AFA153A3BBB62D607
            F273251FE216D49C4000B81DB6C639E7799C0006CB0F4509209C13801FB668BD
            81480846E02023B00E1389D2910D90095FAF066620F8CB65B084EA568EB25FCA
            8535702217D556D5558D2A5D2EC12464416E741C9E6CBB8045CA9AF1510BA79E
            11CF9E6F2BA622007E787EFC3020A44002E4951609281FF564550A5132AC0321
            921500938BE8570553586F68C87DA40CE441AE2A8568DB875C3B022A930BE5AB
            1803D548D4FF7305321E72950B8005845C3B02422EAC0DE4AA6161E8012CA409
            5B05818904083201AECB4E80575F7D955D80AFE823824CD360537C3C41E9C810
            151B40064C2EEABD6A4A3AC86E6A820BC87F5898723D56A5631D72410C3BB958
            426EAEC19715189503B9986A3F9D5CB836C855015F848423D8EA39EBF2CE243B
            D9050483A179D75DE79000C57401C94026640BCC200FA65FF9C26200C453999F
            49AEFA2E52B1E5AA6A5D3AB98A0CC5906BE702F8E794009B990043FF5E007AED
            9029B00C2A5F20077312B9DD9E217B0F219D5C3523DA50C9855220174A89CBD5
            E4B3E2998B39EA3AEE0274D92E911301366FDE2C5D40F5DDC0CA859D05C07800
            C704184A1750C5D0A340026C620204A2ED005502541AE05E54101821407C4088
            23026CDAB42961B2E82A012A0F560B609D23A8400294FAB1AA700A6B10182140
            285702F85308509D29B47290D80E101F11E49800E80BA8BA804A85486809CC99
            00AFBCF28A65AE6077D5025420AC41A072011810E29800D6E9E2AB16A0F2901C
            04AA11410E09F0727450A857B65215DA1D5CC5F0C39E00A63302BCFCF2CB292E
            A0DA125859B0230006843824C0C6D8B0F0441750EAC7AAC2295283408C4D405F
            C0C2EC04D8B871A3B4001102C005B8AA416085C12E084467D0C2850E09101F13
            88D25FB50095063B0B8019421C12E025DB5A40D502540EEC2C003A831C11E0A5
            975EAA56032B1C7641600E0478B14A800A873D0174670478F1C52A012A1D7604
            4053700E04F0550950A1481E0F606D0A7648800DD13181D696C02A012A05F2C3
            9922B5168096404704D8B06143744858B537B012612540FCD5B0B06C09744880
            366901E24DC1E5F7EDE02AD2239900784358BD1AE688006D6D6DD1F1001ECBBB
            812ED9215445F903CA8F0481666C4450E4CD20724A80F51F3101BE00E52B0B80
            E6E08805A892A0DC213F586D7939346201C220C6AC9B6FBE7947B6EBB5F5EBD7
            6F64FF7F7DE288A06A9770B923F2B28932FFA67CF125120344ACC091234746DC
            73CF3D27B3DD0704F84F56FC7723047027740855AD40394344CDBF90CA8FC700
            F2EDA04F172D5AE468EA737601CFCED734CFE6B805500470C7E280AA25282F44
            EAFE22E6FFAD048005308CF0FF2C5A74CB3227F7D2F8266C059EFF846B013340
            00EBB8406505E204A812A1F41031E5ABE85FBD8718AD06323DB4B96C013E7472
            37A9D1679F7DF64E56FC53F1405011C01A0B68D12EE23809AA86616891F872B1
            48F0FB11D31F29FD56027020B8E2965B6EB9D3A98C980A9F7BEEB9B5ACFC2FA9
            B757AD133545868851424C50FECA4F4C60627ACB21F111EDA6BE419EFA4A795C
            F1CAF49B160298B1974298000739209C7BEBADB71ECC3997DADADA1A4D537F8D
            09301725DFEA0622B180165BA66668B941B3495FDC82252E871756655A97F1E3
            C2E67C756EBCF4C7AB7F3102F4F333DDB078F1E2B772CB290B9E7FFEF926218C
            B54C80F9F1EAA02BE606ACB140B910C059801A39C7FA1CCAAA0D9F354834E156
            65AAE3F23F8510D66376049001E0414D33962C5E7C5B4ECAB77D7A16E0E298E0
            3B9C59FFC2046848478048E60F53DEE50D2B5123E98F4C0E61756D434F66A544
            ABE2E211BC20AB8253AF8B6D251020EAFF05AFAFE083CB7231FB893994061B36
            6C680E0683F771062DE1CD0B38C3FC951C042A02AB99418667006C72C98D9B6D
            55758B90224E8284AB85FDBDF89A0E22B34DD3DC8F71C0F75141F9E2E4A43FFE
            F18F9E03070E8C0B04022339F38A33994E09C019EEF2F97C77F1337C2FDEFD3D
            741D5F11C5938DBF9675763E6C3CC7B5F0FFE5533F77723F4E674F7F7FFFA13B
            EEB8A3B75869ACA0325C1C3CF3CC330D7EBFFFA49A8C324280A1E0B44828F971
            C54BE577F3FE3BB9F4BE58EAFC38ED08F0FCF3EB1EF2787C8F603248355D5DB1
            660853482DF986B5B72ECC267C01FBEC374B9D17C06945000E6ECFE780F6ADFA
            FA063F2666C4848E6A72E86241F97315F029B3AF1A6A0C23FCAD2F7D69C9CF4A
            9D170AA70D0156AC583182CDFE7B7EBF6F1A26A0EEEE3E2927552CE67792D532
            31E053CA8715083FC6CAFFFB52E78515A70501D0DFB16EDD33CF7A3CDEC5F806
            004A3D66F5B4767815414682D9B70ED288CE53B8FEC08143B7DD7FFFFDF94D65
            3E44382D08B076EDEA9FB0F21FC69CC44D4DCD74E8D0C158B5B010FF9F5CEA93
            4B7EBC8DDED8C4AE7F3147EFD967AF1E669CF20458B366CDD7B8C4FF169F821D
            37AE55CEE60DE5C47B3AF3BF7772B76C52EB9C0AFED671BC71D782050BB24F99
            5E029CD20458BD7AF56D5CCD5B515757E7993061829C3D1CF3165BBBBAF381B5
            C42757F5AC7E9F95FF2B5EFF2697FCFC3F2732C4386509B06AD5AA5BB8E4AF0C
            04027E7C937760A03F16F5E7ABFCD4404F24F9FC58C90F09612C5BB264E9AF4B
            9D0FD9704A1260CD9A95B76A9AFB698EFAFD28F9182583AF8820E0CBB5F45B95
            AE96F1B67C11EB8F8F8FCB333EE3EDBB972E5DFA6EA9F3C1094E3902AC5CB9F2
            ABACE0DF70C997661FA6F8E8D123B1CE9FD48EAD542476C1AAA588B5DB2747FA
            D1767D74CCFCB2A1A1E1A19B6EBAA9AFD4F9E014A71401B8AEFFEFECF37F80EF
            0E8C1F3F418D8E8D957C15F5A70E71CBDCFD9A18E8C5237D4B2B1F865F7DE3F6
            DB6F2F8BD6BD5C704A1060EDDAB523C3E1E0EFB85EFF457C83A7B5B555BE2089
            AF7B4694AE258C6F5404504B6B37AC52B65A574AB7AE5B82BD2E2EF5CBB76FDF
            FED8F2E5CB73FF445A19A0E209F0C4134F5CE2F1B89E649F3F05F5FCD1A35B62
            DF1D8E2BDD95341824FED876236E92076CC48760196A09C5FF942F7AB41CEBF6
            B9A06209C0E6DE679AFA0F59B9DFF3783CDEB163C7524343A30CF6BABB4FA498
            7CBB920F2446F6F13177F6265FBCCFCB47FBFBFB9FB8EFBEFBCAB25E9F2B2A92
            004F3DF5D4D95C0A57B07267E3BB3BF8D41BAA77070F1E92D53D6B89572381E2
            835AD5632746F76A644EB2C9E7DF313EB6D2E5321E5FBAF4CBEDA57EF662A3E2
            08C0257FBCAE873F648537A96FEDA17107DF098C7CBE35AEEC74A55E2159F996
            52BF8703BB36DEF94C7777F7A6726BBF2F262A8E007FF8C31FFE8A75B91E498F
            BCD1EC912F43269670A2F42FB4A444F8262F3AF8DCADACFC37D9AA6C66BF9EF5
            A5CA5305154700E0C927FF6FB110AE9B5979535871F8B4F828D675233F4E23DC
            BE7AB4A8FEF1822486501D67B57709A175F1FA2EFEA1C16607C70CDB1F78E081
            A20DB1AA34542401AA281EAA0438CDF1FFB3D7150288784B3B0000000049454E
            44AE426082}
          Ico.SizeFix = 0
          Ico.PosH = tvphCentr
        end
      end
      object P_Server_Log: TAmMemo
        AlignWithMargins = True
        Left = 20
        Top = 291
        Width = 432
        Height = 271
        Margins.Left = 20
        Margins.Top = 5
        Margins.Right = 20
        Margins.Bottom = 5
        Align = alClient
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 1778997
        Ctl3D = False
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'AmMemo1')
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
        WordWrap = False
        ScrollVert.Left = 419
        ScrollVert.Top = 0
        ScrollVert.Width = 13
        ScrollVert.Height = 258
        ScrollVert.AThemeLink = SbThemeServer
        ScrollVert.FocusParent = True
        ScrollVert.Position = 0
        ScrollVert.Min = 0
        ScrollVert.Max = 2
        ScrollVert.PageSize = 14
        ScrollVert.Align = alRight
        ScrollHorz.Left = 0
        ScrollHorz.Top = 258
        ScrollHorz.Width = 432
        ScrollHorz.Height = 13
        ScrollHorz.AThemeLink = SbThemeServer
        ScrollHorz.Kind = sbHorizontal
        ScrollHorz.FocusParent = True
        ScrollHorz.Position = 0
        ScrollHorz.Min = 0
        ScrollHorz.Max = 65535
        ScrollHorz.PageSize = 398
        ScrollHorz.Align = alBottom
        MarginsText.Left = 10
        MarginsText.Top = 10
        MarginsText.Right = 10
        MarginsText.Bottom = 10
        ColorMargins = clBlack
      end
    end
    object P_Spliter: TAmLayout
      Left = 502
      Top = 3
      Width = 19
      Height = 591
      Cursor = crSizeWE
      CanMoved = True
      OnMoveWindow = P_SpliterMoveWindow
      OnBeforeMoveSized = P_SpliterBeforeMoveSized
      Align = alCustom
      Color = 7223856
      TabOrder = 2
      BevelOuter = bvNone
      Caption = ''
    end
  end
  object P_Client_UrlListPanel: TAmLayout
    Left = 80
    Top = 552
    Width = 617
    Height = 258
    Margins.Bottom = 10
    Visible = False
    Color = 5789981
    TabOrder = 0
    BevelOuter = bvNone
    Caption = ''
    object P_Client_UrlList: TAmListBox
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 597
      Height = 238
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Style = lbOwnerDrawFixed
      Align = alClient
      BorderStyle = bsNone
      Color = 3882004
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14080169
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 25
      Items.Strings = (
        'https://127.0.0.1:5756'
        'https://stream.binance.com:9443/stream?streams=btcusdt@kline_15m'
        'https://stream.binance.com:9443/stream?streams=ethusdt@kline_15m'
        'https://stream.binance.com:9443/stream?streams=btcusdt@aggTrade')
      ParentFont = False
      TabOrder = 0
      ColorItemMouseMovi = 6250273
      ColorItemSelect = 8947759
      TextItemCorrectX = 7
      ScrollVStandart = False
      ScrollHStandart = False
      OnChangeSelect = P_Client_UrlListChangeSelect
      ScrollV.Left = 594
      ScrollV.Top = 10
      ScrollV.Width = 13
      ScrollV.Height = 238
      ScrollV.Visible = False
      ScrollV.AThemeLink = SbThemeClient
      ScrollV.FocusParent = True
      ScrollV.Position = 0
      ScrollV.Min = 0
      ScrollV.Max = 1
      ScrollV.PageSize = 20
      ScrollVNotVisible = False
    end
  end
  object P_Client_SendPanel: TAmLayout
    Left = 208
    Top = 354
    Width = 423
    Height = 235
    Visible = False
    Color = 5789981
    TabOrder = 2
    BevelOuter = bvNone
    Caption = ''
    object Label4: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 5
      Width = 417
      Height = 23
      Margins.Top = 5
      Align = alTop
      Alignment = taCenter
      Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077' '#1089#1077#1088#1074#1077#1088#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14080169
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 174
    end
    object P_Client_SendMessageText: TAmMemo
      AlignWithMargins = True
      Left = 10
      Top = 36
      Width = 403
      Height = 153
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alTop
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 3882004
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        #1055#1088#1080#1074#1077#1090' '#1089#1077#1088#1074#1077#1088'.')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      WordWrap = False
      ScrollVert.Left = 390
      ScrollVert.Top = 0
      ScrollVert.Width = 13
      ScrollVert.Height = 140
      ScrollVert.AThemeLink = SbThemeClient
      ScrollVert.FocusParent = True
      ScrollVert.Position = 0
      ScrollVert.Min = 0
      ScrollVert.Max = 2
      ScrollVert.PageSize = 7
      ScrollVert.Align = alRight
      ScrollHorz.Left = 0
      ScrollHorz.Top = 140
      ScrollHorz.Width = 403
      ScrollHorz.Height = 13
      ScrollHorz.AThemeLink = SbThemeClient
      ScrollHorz.Kind = sbHorizontal
      ScrollHorz.FocusParent = True
      ScrollHorz.Position = 0
      ScrollHorz.Min = 0
      ScrollHorz.Max = 65535
      ScrollHorz.PageSize = 369
      ScrollHorz.Align = alBottom
      MarginsText.Left = 10
      MarginsText.Top = 10
      MarginsText.Right = 10
      MarginsText.Bottom = 10
      ColorMargins = clBlack
    end
    object P_Client_SendPing: TAmButton
      Left = 10
      Top = 197
      Width = 130
      Height = 27
      Color = 5658397
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14080169
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = P_Client_SendPingClick
      Bolder.Color = 11389748
      Bolder.ColorActive = 44223
      Bolder.BolderSizeActive = 1
      Caption = 'Ping'
      Ico.SizeProcent = 100
    end
    object P_Client_SendText: TAmButton
      Left = 280
      Top = 197
      Width = 130
      Height = 27
      Color = 5921565
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14080169
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = P_Client_SendTextClick
      Bolder.Color = 11389748
      Bolder.ColorActive = 44223
      Bolder.BolderSizeActive = 1
      Caption = #1058#1077#1082#1089#1090
      Ico.SizeProcent = 100
    end
    object P_Client_SendFile: TAmButton
      Left = 145
      Top = 197
      Width = 130
      Height = 27
      Color = 5921565
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14080169
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = P_Client_SendFileClick
      Bolder.Color = 11389748
      Bolder.ColorActive = 44223
      Bolder.BolderSizeActive = 1
      Caption = #1060#1072#1081#1083
      Ico.SizeProcent = 100
    end
  end
  object P_Server_SendPanel: TAmLayout
    Left = 414
    Top = 343
    Width = 423
    Height = 235
    Visible = False
    Color = 3096410
    TabOrder = 3
    BevelOuter = bvNone
    Caption = ''
    object Label9: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 5
      Width = 417
      Height = 23
      Margins.Top = 5
      Align = alTop
      Alignment = taCenter
      Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077' '#1082#1083#1080#1077#1085#1090#1091
      Color = 3096410
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10994394
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 174
    end
    object P_Server_SendMessageText: TAmMemo
      AlignWithMargins = True
      Left = 10
      Top = 36
      Width = 403
      Height = 153
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alTop
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 1779769
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        #1055#1088#1080#1074#1077#1090' '#1082#1083#1080#1077#1085#1090'.')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      WordWrap = False
      ScrollVert.Left = 390
      ScrollVert.Top = 0
      ScrollVert.Width = 13
      ScrollVert.Height = 140
      ScrollVert.AThemeLink = SbThemeServer
      ScrollVert.FocusParent = True
      ScrollVert.Position = 0
      ScrollVert.Min = 0
      ScrollVert.Max = 2
      ScrollVert.PageSize = 7
      ScrollVert.Align = alRight
      ScrollHorz.Left = 0
      ScrollHorz.Top = 140
      ScrollHorz.Width = 403
      ScrollHorz.Height = 13
      ScrollHorz.AThemeLink = SbThemeServer
      ScrollHorz.Kind = sbHorizontal
      ScrollHorz.FocusParent = True
      ScrollHorz.Position = 0
      ScrollHorz.Min = 0
      ScrollHorz.Max = 65535
      ScrollHorz.PageSize = 369
      ScrollHorz.Align = alBottom
      MarginsText.Left = 10
      MarginsText.Top = 10
      MarginsText.Right = 10
      MarginsText.Bottom = 10
      ColorMargins = clBlack
    end
    object P_Server_SendText: TAmButton
      Left = 13
      Top = 197
      Width = 130
      Height = 27
      Color = 3096410
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10994394
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = P_Server_SendTextClick
      Bolder.Color = 8301255
      Bolder.ColorActive = 44223
      Bolder.BolderSizeActive = 1
      Caption = #1058#1077#1082#1089#1090
      Ico.SizeProcent = 60
      Ico.SizeFix = 0
      Ico.PosH = tvphCentr
    end
  end
  object P_Example_CasePanel: TAmLayout
    Left = 489
    Top = 253
    Width = 433
    Height = 222
    Visible = False
    Color = 7223856
    TabOrder = 4
    BevelOuter = bvNone
    Caption = ''
    DesignSize = (
      433
      222)
    object Label11: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 5
      Width = 427
      Height = 23
      Margins.Top = 5
      Align = alTop
      Alignment = taCenter
      Caption = #1050#1072#1082#1086#1081' '#1087#1088#1080#1084#1077#1088' '#1087#1086#1082#1072#1079#1072#1090#1100'?'
      Color = 3096410
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16431008
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 216
    end
    object P_Example_Local: TAmButton
      AlignWithMargins = True
      Left = 32
      Top = 55
      Width = 169
      Height = 138
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Color = 7223856
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16431008
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = P_Example_LocalClick
      Bolder.Color = 16361617
      Bolder.BolderSizeActive = 1
      Caption = #1051#1086#1082#1072#1083#1100#1085#1099#1081' '#1089#1077#1088#1074#1077#1088
      Ico.SizeProcent = 70
      Ico.SizeFix = 0
      Ico.PosH = tvphCentr
    end
    object P_Example_Remote: TAmButton
      AlignWithMargins = True
      Left = 232
      Top = 55
      Width = 169
      Height = 138
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Anchors = [akTop, akRight]
      Color = 7223856
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16431008
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = P_Example_RemoteClick
      Bolder.Color = 16361617
      Bolder.BolderSizeActive = 1
      Caption = #1059#1076#1072#1083#1077#1085#1085#1099#1081' '#1089#1077#1088#1074#1077#1088
      Ico.SizeProcent = 70
      Ico.SizeFix = 0
      Ico.PosH = tvphCentr
    end
  end
  object SbThemeClient: TAmScrollBarThemeLink
    ATheme.CanOpenEditor = True
    ATheme.AStyle = btmLiteBlack
    ATheme.AStyleColor = btcBlackCustom
    ATheme.AStyleSize = btsMidLow
    ATheme.AStyleSpeed = btdLow
    ATheme.Color = 7891768
    ATheme.Size = 13
    ATheme.ScalePercents = 0
    ATheme.Revers = False
    ATheme.IndentCorner = 0
    ATheme.TransparentMin = 180
    ATheme.TransparentMax = 255
    ATheme.SpeedDelay = 40
    ATheme.SpeedPage = -10
    ATheme.SpeedArrow = 20
    ATheme.SpeedArrowAtPage = 0
    ATheme.SpeedJumpOnClickArea = False
    ATheme.AreaColor = 7891768
    ATheme.AreaColorScrolling = 8747077
    ATheme.BorderColor = 9207628
    ATheme.BorderSize = 0
    ATheme.ThumbRounded = False
    ATheme.ThumbMinSize = 25
    ATheme.ThumbBorderColor = 7694389
    ATheme.ThumbBorderSize = 1
    ATheme.ThumbMarningSize = 2
    ATheme.ThumbFillColor = 10391902
    ATheme.ThumbFillColorActive = 13023622
    ATheme.ThumbFillColorPress = 14405275
    ATheme.ThumbMarkOffon = False
    ATheme.ThumbMarkColor1 = clWhite
    ATheme.ThumbMarkColor2 = clWhite
    ATheme.ArrowStyle = am_scbar_ArrowsNormal
    ATheme.ArrowBorderColor = 9207628
    ATheme.ArrowBorderSize = 0
    ATheme.ArrowFillProcent = 100
    ATheme.ArrowFillColor = 7891768
    ATheme.ArrowFillColorActive = 8418112
    ATheme.ArrowFillColorPress = 11115625
    ATheme.ArrowTriangleColor = 14405275
    ATheme.ArrowTriangleSize = 1
    Left = 824
    Top = 280
  end
  object SbThemeServer: TAmScrollBarThemeLink
    ATheme.CanOpenEditor = True
    ATheme.AStyle = btmLiteBlack
    ATheme.AStyleColor = btcBlackCustom
    ATheme.AStyleSize = btsMidLow
    ATheme.AStyleSpeed = btdLow
    ATheme.Color = 3494499
    ATheme.Size = 13
    ATheme.ScalePercents = 0
    ATheme.Revers = False
    ATheme.IndentCorner = 0
    ATheme.TransparentMin = 180
    ATheme.TransparentMax = 255
    ATheme.SpeedDelay = 40
    ATheme.SpeedPage = -10
    ATheme.SpeedArrow = 20
    ATheme.SpeedArrowAtPage = 0
    ATheme.SpeedJumpOnClickArea = False
    ATheme.AreaColor = 3494499
    ATheme.AreaColorScrolling = 4349808
    ATheme.BorderColor = 4810359
    ATheme.BorderSize = 0
    ATheme.ThumbRounded = False
    ATheme.ThumbMinSize = 25
    ATheme.ThumbBorderColor = 3297121
    ATheme.ThumbBorderSize = 1
    ATheme.ThumbMarningSize = 2
    ATheme.ThumbFillColor = 5994634
    ATheme.ThumbFillColorActive = 8626353
    ATheme.ThumbFillColorPress = 10008007
    ATheme.ThumbMarkOffon = False
    ATheme.ThumbMarkColor1 = clWhite
    ATheme.ThumbMarkColor2 = clWhite
    ATheme.ArrowStyle = am_scbar_ArrowsNormal
    ATheme.ArrowBorderColor = 4810359
    ATheme.ArrowBorderSize = 0
    ATheme.ArrowFillProcent = 100
    ATheme.ArrowFillColor = 3494499
    ATheme.ArrowFillColorActive = 4020843
    ATheme.ArrowFillColorPress = 6718356
    ATheme.ArrowTriangleColor = 10008007
    ATheme.ArrowTriangleSize = 1
    Left = 752
    Top = 304
  end
end
