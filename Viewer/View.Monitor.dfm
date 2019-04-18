object fMonitor: TfMonitor
  Left = 488
  Top = 0
  Caption = 'DB1 LogViewer 2.4'
  ClientHeight = 629
  ClientWidth = 1344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 1344
    Height = 629
    ActivePage = TabSheetLog
    Align = alClient
    TabOrder = 0
    TabWidth = 110
    object TabSheetLog: TTabSheet
      Caption = 'Log'
      object Splitter: TSplitter
        Left = 0
        Top = 443
        Width = 1336
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        OnMoved = SplitterMoved
        ExplicitTop = 91
        ExplicitWidth = 338
      end
      object PanelOptions: TPanel
        Left = 0
        Top = 0
        Width = 1336
        Height = 61
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object LabelNewVersionAvailable: TLabel
          Left = 800
          Top = 16
          Width = 185
          Height = 38
          Cursor = crHandPoint
          Alignment = taCenter
          AutoSize = False
          Caption = 'Nova vers'#227'o dispon'#237'vel!'#13#10'Clique para atualizar.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
          OnClick = LabelNewVersionAvailableClick
        end
        object ActionToolBar: TActionToolBar
          Left = 0
          Top = 0
          Width = 561
          Height = 59
          ActionManager = ActionManager
          Align = alCustom
          Color = clMenuBar
          ColorMap.DisabledFontColor = 7171437
          ColorMap.HighlightColor = clWhite
          ColorMap.BtnSelectedFont = clBlack
          ColorMap.UnusedColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = True
          ParentFont = False
          Spacing = 0
        end
        object GroupBoxAutoUpdate: TGroupBox
          Left = 606
          Top = 2
          Width = 185
          Height = 54
          Caption = 'Atualiza'#231#227'o autom'#225'tica        '
          TabOrder = 1
          object LabelInterval: TLabel
            Left = 16
            Top = 26
            Width = 81
            Height = 13
            Caption = 'Intervalo (segs):'
          end
          object CheckBoxAutoUpdate: TCheckBox
            Left = 126
            Top = -1
            Width = 16
            Height = 17
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBoxAutoUpdateClick
          end
          object SpinEditInterval: TSpinEdit
            Left = 103
            Top = 22
            Width = 61
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 1
            OnChange = SpinEditIntervalChange
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 61
        Width = 1336
        Height = 382
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object DBGrid: TDBGrid
          Left = 0
          Top = 39
          Width = 1336
          Height = 343
          Align = alClient
          DataSource = DataSource
          Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          PopupMenu = PopupMenu
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = DBGridDrawColumnCell
          OnDblClick = DBGridDblClick
          OnKeyDown = DBGridKeyDown
          OnKeyPress = DBGridKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'Line'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Type'
              Title.Caption = 'Tipo'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Database'
              Title.Caption = 'Base'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'User'
              Title.Caption = 'Usu'#225'rio'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IP'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DateTime'
              Title.Caption = 'Data/Hora'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Class'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Method'
              Title.Caption = 'M'#233'todo'
              Width = 420
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Error'
              Title.Caption = 'Erro'
              Width = 50
              Visible = True
            end>
        end
        object PanelDBGridFilter: TPanel
          Left = 0
          Top = 0
          Width = 1336
          Height = 39
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object DBGridFilter: TDBGridLog
            Left = 0
            Top = 0
            Width = 1336
            Height = 39
            TabStop = False
            Align = alClient
            DataSource = DataSourceFilter
            Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnColEnter = DBGridFilterColEnter
            OnColumnMoved = DBGridFilterColumnMoved
            OnKeyPress = DBGridFilterKeyPress
            OnColResize = DBGridFilterColResize
            Columns = <
              item
                Expanded = False
                FieldName = 'Line'
                Title.Caption = 'Linha'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Type'
                Title.Caption = 'Tipo'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Database'
                Title.Caption = 'Base'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'User'
                Title.Caption = 'Usu'#225'rio'
                Width = 140
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IP'
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DateTime'
                Title.Caption = 'Data/Hora'
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Class'
                Title.Caption = 'Classe'
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Method'
                Title.Caption = 'M'#233'todo'
                Width = 420
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Error'
                Title.Alignment = taCenter
                Title.Caption = 'Erro'
                Width = 50
                Visible = True
              end>
          end
        end
      end
      object PanelSQL: TPanel
        Left = 0
        Top = 446
        Width = 1336
        Height = 155
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object SynMemoSQL: TSynMemo
          Left = 0
          Top = 29
          Width = 1336
          Height = 108
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          TabOrder = 0
          CodeFolding.GutterShapeSize = 11
          CodeFolding.CollapsedLineColor = clGrayText
          CodeFolding.FolderBarLinesColor = clGrayText
          CodeFolding.IndentGuidesColor = clGray
          CodeFolding.IndentGuides = True
          CodeFolding.ShowCollapsedLine = False
          CodeFolding.ShowHintMark = True
          UseCodeFolding = False
          Gutter.BorderStyle = gbsNone
          Gutter.DigitCount = 3
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.LeftOffset = 10
          Gutter.ShowLineNumbers = True
          Highlighter = SynSQLSyn
          ReadOnly = True
          RightEdge = 0
          ScrollBars = ssVertical
          WordWrap = True
          FontSmoothing = fsmNone
        end
        object PanelFilterSQL: TPanel
          Left = 0
          Top = 0
          Width = 1336
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            1336
            29)
          object LabelFilterSQL: TLabel
            Left = 4
            Top = 7
            Width = 28
            Height = 13
            Caption = 'Filtro:'
          end
          object EditSQLFilter: TEdit
            Left = 36
            Top = 4
            Width = 1299
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 200
            TabOrder = 0
            OnKeyPress = EditSQLFilterKeyPress
          end
        end
        object StatusBarDetails: TStatusBar
          Left = 0
          Top = 137
          Width = 1336
          Height = 18
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Panels = <
            item
              Width = 700
            end
            item
              Alignment = taCenter
              Width = 300
            end
            item
              Alignment = taCenter
              Width = 50
            end>
          UseSystemFont = False
        end
      end
    end
    object TabSheetSQL: TTabSheet
      Caption = 'SQL'
      ImageIndex = 2
      OnShow = TabSheetSQLShow
      object SynMemoTab: TSynMemo
        Left = 0
        Top = 45
        Width = 1336
        Height = 556
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        CodeFolding.GutterShapeSize = 11
        CodeFolding.CollapsedLineColor = clGrayText
        CodeFolding.FolderBarLinesColor = clGrayText
        CodeFolding.IndentGuidesColor = clGray
        CodeFolding.IndentGuides = True
        CodeFolding.ShowCollapsedLine = False
        CodeFolding.ShowHintMark = True
        UseCodeFolding = False
        Gutter.BorderStyle = gbsNone
        Gutter.DigitCount = 3
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.LeftOffset = 10
        Gutter.ShowLineNumbers = True
        Highlighter = SynSQLSyn
        ReadOnly = True
        RightEdge = 0
        FontSmoothing = fsmNone
      end
      object PanelSQLTab: TPanel
        Left = 0
        Top = 0
        Width = 1336
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object DBNavigator: TDBNavigator
          Left = 1216
          Top = 0
          Width = 120
          Height = 45
          DataSource = DataSource
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          TabOrder = 0
        end
        object LabeledEditDatabase: TLabeledEdit
          Left = 3
          Top = 18
          Width = 95
          Height = 21
          EditLabel.Width = 27
          EditLabel.Height = 13
          EditLabel.Caption = 'Base:'
          LabelSpacing = 2
          ReadOnly = True
          TabOrder = 1
        end
        object LabeledEditUser: TLabeledEdit
          Left = 103
          Top = 18
          Width = 160
          Height = 21
          EditLabel.Width = 40
          EditLabel.Height = 13
          EditLabel.Caption = 'Usu'#225'rio:'
          LabelSpacing = 2
          ReadOnly = True
          TabOrder = 2
        end
        object LabeledEditIP: TLabeledEdit
          Left = 268
          Top = 18
          Width = 110
          Height = 21
          EditLabel.Width = 14
          EditLabel.Height = 13
          EditLabel.Caption = 'IP:'
          LabelSpacing = 2
          ReadOnly = True
          TabOrder = 3
        end
        object LabeledEditDateTime: TLabeledEdit
          Left = 383
          Top = 18
          Width = 121
          Height = 21
          EditLabel.Width = 54
          EditLabel.Height = 13
          EditLabel.Caption = 'Data/Hora:'
          LabelSpacing = 2
          ReadOnly = True
          TabOrder = 4
        end
        object LabeledEditClass: TLabeledEdit
          Left = 509
          Top = 18
          Width = 200
          Height = 21
          EditLabel.Width = 35
          EditLabel.Height = 13
          EditLabel.Caption = 'Classe:'
          LabelSpacing = 2
          ReadOnly = True
          TabOrder = 5
        end
        object LabeledEditMethod: TLabeledEdit
          Left = 714
          Top = 18
          Width = 442
          Height = 21
          EditLabel.Width = 40
          EditLabel.Height = 13
          EditLabel.Caption = 'M'#233'todo:'
          LabelSpacing = 2
          ReadOnly = True
          TabOrder = 6
        end
      end
    end
    object TabSheetOptions: TTabSheet
      Caption = 'Op'#231#245'es'
      object GroupBoxLog: TGroupBox
        Left = 18
        Top = 16
        Width = 327
        Height = 130
        Caption = 'Log: '
        TabOrder = 0
        object LabelIgnoreBasicLogInfo: TLabel
          Left = 255
          Top = 78
          Width = 19
          Height = 13
          Cursor = crHandPoint
          Caption = '[ ? ]'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = LabelIgnoreBasicLogInfoClick
        end
        object LabelRowSelectInfo: TLabel
          Left = 176
          Top = 104
          Width = 19
          Height = 13
          Cursor = crHandPoint
          Caption = '[ ? ]'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = LabelRowSelectInfoClick
        end
        object LabelShowOnlySQLInfo: TLabel
          Left = 228
          Top = 26
          Width = 19
          Height = 13
          Cursor = crHandPoint
          Caption = '[ ? ]'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = LabelShowOnlySQLInfoClick
        end
        object ToggleSwitchShowOnlySQL: TToggleSwitch
          Left = 8
          Top = 23
          Width = 214
          Height = 20
          StateCaptions.CaptionOn = 'Exibir somente logs do tipo "SQL"'
          StateCaptions.CaptionOff = 'Exibir somente logs do tipo "SQL"'
          TabOrder = 0
          OnClick = ToggleSwitchShowOnlySQLClick
        end
        object ToggleSwitchHighlightErrors: TToggleSwitch
          Left = 8
          Top = 49
          Width = 172
          Height = 20
          StateCaptions.CaptionOn = 'Destacar linhas de erros'
          StateCaptions.CaptionOff = 'Destacar linhas de erros'
          TabOrder = 1
          OnClick = ToggleSwitchHighlightErrorsClick
        end
        object ToggleSwitchIgnoreServerDMLog: TToggleSwitch
          Left = 8
          Top = 75
          Width = 241
          Height = 20
          StateCaptions.CaptionOn = 'Ignorar logs da classe TfXXServidorDM'
          StateCaptions.CaptionOff = 'Ignorar logs da classe TfXXServidorDM'
          TabOrder = 2
          OnClick = ToggleSwitchIgnoreServerDMLogClick
        end
        object ToggleSwitchRowSelect: TToggleSwitch
          Left = 8
          Top = 101
          Width = 163
          Height = 20
          StateCaptions.CaptionOn = 'Selecionar linha inteira'
          StateCaptions.CaptionOff = 'Selecionar linha inteira'
          TabOrder = 3
          OnClick = ToggleSwitchRowSelectClick
        end
      end
      object GroupBoxVisual: TGroupBox
        Left = 18
        Top = 281
        Width = 327
        Height = 112
        Caption = 'Visual: '
        TabOrder = 1
        object ToggleSwitchStayOnTop: TToggleSwitch
          Left = 8
          Top = 53
          Width = 224
          Height = 20
          StateCaptions.CaptionOn = 'Manter na frente de outras janelas'
          StateCaptions.CaptionOff = 'Manter na frente de outras janelas'
          TabOrder = 1
          OnClick = ToggleSwitchStayOnTopClick
        end
        object ToggleSwitchShowBottomPanel: TToggleSwitch
          Left = 8
          Top = 27
          Width = 250
          Height = 20
          StateCaptions.CaptionOn = 'Exibir painel inferior com a instru'#231#227'o SQL'
          StateCaptions.CaptionOff = 'Exibir painel inferior com a instru'#231#227'o SQL'
          TabOrder = 0
          OnClick = ToggleSwitchShowBottomPanelClick
        end
        object ToggleSwitchStartMaximized: TToggleSwitch
          Left = 8
          Top = 79
          Width = 181
          Height = 20
          StateCaptions.CaptionOn = 'Iniciar sempre maximizado'
          StateCaptions.CaptionOff = 'Iniciar sempre maximizado'
          TabOrder = 2
          OnClick = ToggleSwitchStartMaximizedClick
        end
      end
      object GroupBoxShortCuts: TGroupBox
        Left = 567
        Top = 16
        Width = 234
        Height = 308
        Caption = 'Atalhos: '
        TabOrder = 2
        object LabelCtrlO: TLabel
          Left = 50
          Top = 24
          Width = 43
          Height = 13
          Caption = 'Ctrl + O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelCtrlL: TLabel
          Left = 52
          Top = 62
          Width = 41
          Height = 13
          Caption = 'Ctrl + L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelF5: TLabel
          Left = 80
          Top = 81
          Width = 13
          Height = 13
          Caption = 'F5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelCtrlC: TLabel
          Left = 51
          Top = 107
          Width = 42
          Height = 13
          Caption = 'Ctrl + C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelCtrlQ: TLabel
          Left = 50
          Top = 144
          Width = 43
          Height = 13
          Caption = 'Ctrl + Q'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelAlt1: TLabel
          Left = 55
          Top = 193
          Width = 38
          Height = 13
          Caption = 'Alt + 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelAlt2: TLabel
          Left = 55
          Top = 212
          Width = 38
          Height = 13
          Caption = 'Alt + 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelAlt3: TLabel
          Left = 55
          Top = 231
          Width = 38
          Height = 13
          Caption = 'Alt + 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelOpenFile: TLabel
          Left = 98
          Top = 24
          Width = 70
          Height = 13
          Caption = ': Abrir Arquivo'
        end
        object LabelClearLog: TLabel
          Left = 98
          Top = 62
          Width = 58
          Height = 13
          Caption = ': Limpar Log'
        end
        object LabelReloadLog: TLabel
          Left = 98
          Top = 81
          Width = 69
          Height = 13
          Caption = ': Atualizar Log'
        end
        object LabelCopyColumnValue: TLabel
          Left = 98
          Top = 107
          Width = 60
          Height = 13
          Caption = ': Copiar SQL'
        end
        object LabelCopySQL: TLabel
          Left = 98
          Top = 145
          Width = 116
          Height = 13
          Caption = ': Copiar Valor da Coluna'
        end
        object LabelShowLogTab: TLabel
          Left = 98
          Top = 193
          Width = 83
          Height = 13
          Caption = ': Exibir Aba "Log"'
        end
        object LabelShowSQLTab: TLabel
          Left = 98
          Top = 212
          Width = 85
          Height = 13
          Caption = ': Exibir Aba "SQL"'
        end
        object LabelShowOptionsTab: TLabel
          Left = 98
          Top = 231
          Width = 102
          Height = 13
          Caption = ': Exibir Aba "Op'#231#245'es"'
        end
        object BevelSeparator1: TBevel
          Left = 13
          Top = 100
          Width = 205
          Height = 10
          Shape = bsTopLine
        end
        object BevelSeparator2: TBevel
          Left = 13
          Top = 185
          Width = 205
          Height = 10
          Shape = bsTopLine
        end
        object LabelF4: TLabel
          Left = 80
          Top = 165
          Width = 13
          Height = 13
          Caption = 'F4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelClearFilters: TLabel
          Left = 98
          Top = 165
          Width = 70
          Height = 13
          Caption = ': Limpar Filtros'
        end
        object LabelCtrlU: TLabel
          Left = 50
          Top = 43
          Width = 43
          Height = 13
          Caption = 'Ctrl + U'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelOpenLast: TLabel
          Left = 98
          Top = 43
          Width = 82
          Height = 13
          Caption = ': Abrir '#218'ltimo Log'
        end
        object LabelCtrlM: TLabel
          Left = 50
          Top = 126
          Width = 45
          Height = 13
          Caption = 'Ctrl + M'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelCopyMethodName: TLabel
          Left = 98
          Top = 125
          Width = 122
          Height = 13
          Caption = ': Copiar Nome do M'#233'todo'
        end
        object Bevel1: TBevel
          Left = 15
          Top = 253
          Width = 205
          Height = 10
          Shape = bsTopLine
        end
        object Label1: TLabel
          Left = 10
          Top = 263
          Width = 83
          Height = 13
          Caption = 'Ctrl + Shift + 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 98
          Top = 263
          Width = 68
          Height = 13
          Caption = ': Marcar Linha'
        end
        object Label3: TLabel
          Left = 51
          Top = 282
          Width = 42
          Height = 13
          Caption = 'Ctrl + 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 98
          Top = 282
          Width = 112
          Height = 13
          Caption = ': Ir para Linha Marcada'
        end
      end
      object GroupBoxSQL: TGroupBox
        Left = 18
        Top = 157
        Width = 327
        Height = 113
        Caption = 'SQL: '
        TabOrder = 3
        object LabelForceToDateFunctionInfo: TLabel
          Left = 233
          Top = 52
          Width = 19
          Height = 13
          Cursor = crHandPoint
          Caption = '[ ? ]'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = LabelForceToDateFunctionInfoClick
        end
        object LabelDateFormat: TLabel
          Left = 8
          Top = 84
          Width = 85
          Height = 13
          Caption = 'Formato da Data:'
        end
        object ToggleSwitchShowLineNumbers: TToggleSwitch
          Left = 8
          Top = 23
          Width = 255
          Height = 20
          StateCaptions.CaptionOn = 'Exibir n'#250'mero das linhas na instru'#231#227'o SQL'
          StateCaptions.CaptionOff = 'Exibir n'#250'mero das linhas na instru'#231#227'o SQL'
          TabOrder = 0
          OnClick = ToggleSwitchShowLineNumbersClick
        end
        object ToggleSwitchForceToDateFunction: TToggleSwitch
          Left = 8
          Top = 49
          Width = 219
          Height = 20
          StateCaptions.CaptionOn = 'For'#231'ar fun'#231#227'o "to_date" em datas'
          StateCaptions.CaptionOff = 'For'#231'ar fun'#231#227'o "to_date" em datas'
          TabOrder = 1
          OnClick = ToggleSwitchForceToDateFunctionClick
        end
        object ComboBoxDateFormat: TComboBox
          Left = 99
          Top = 80
          Width = 94
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = 'dd/mm/yyyy'
          OnChange = ComboBoxDateFormatChange
          Items.Strings = (
            'dd/mm/yyyy'
            'mm/dd/yyyy'
            'yyyy/mm/dd')
        end
      end
      object PanelUpdateReminder: TPanel
        Left = 0
        Top = 574
        Width = 1336
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 4
        object LabelUpdateReminder: TLabel
          Left = 4
          Top = 4
          Width = 312
          Height = 14
          Caption = 'Verifique sempre novas atualiza'#231#245'es do LogViewer:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelURL: TLabel
          Left = 320
          Top = 3
          Width = 395
          Height = 16
          Cursor = crHandPoint
          Caption = 
            'https://colabore.softplan.com.br/display/~andre.celestino/LogVie' +
            'wer'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = LabelURLClick
        end
      end
      object RadioGroupStyles: TRadioGroup
        Left = 362
        Top = 16
        Width = 185
        Height = 377
        Caption = 'Temas: '
        Items.Strings = (
          'Amethyst Kamri'
          'Emerald Light Slate'
          'Iceberg Classico'
          'Light'
          'Luna'
          'Obsidian'
          'Silver'
          'Slate Classico'
          'Smokey Quartz Kamri'
          'Windows'
          'Windows10'
          'Windows10 SlateGray')
        TabOrder = 5
        OnClick = RadioGroupStylesClick
      end
    end
  end
  object DataSource: TDataSource
    DataSet = LogViewer
    Left = 13
    Top = 429
  end
  object TimerAutoUpdate: TTimer
    Enabled = False
    OnTimer = TimerAutoUpdateTimer
    Left = 69
    Top = 429
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 97
    Top = 429
    object MenuItemCopySQL: TMenuItem
      Caption = 'Copiar SQL'
      ShortCut = 16451
      OnClick = MenuItemCopySQLClick
    end
    object MenuItemCopyMethodName: TMenuItem
      Caption = 'Copiar Nome do M'#233'todo'
      ShortCut = 16461
      OnClick = MenuItemCopyMethodNameClick
    end
    object MenuItemCopyColumnValue: TMenuItem
      Caption = 'Copiar Coluna'
      ShortCut = 16465
      OnClick = MenuItemCopyColumnValueClick
    end
    object MenuItemSeparator1: TMenuItem
      Caption = '-'
    end
    object MenuItemSetBookmark: TMenuItem
      Caption = 'Marcar Linha'
      OnClick = MenuItemSetBookmarkClick
    end
    object MenuItemGoToBookmark: TMenuItem
      Caption = 'Ir para Linha Marcada'
      OnClick = MenuItemGoToBookmarkClick
    end
    object MenuItemSeparator2: TMenuItem
      Caption = '-'
    end
    object MenuItemExportData: TMenuItem
      Caption = 'Exportar Dados'
      OnClick = MenuItemExportDataClick
    end
  end
  object ImageList: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 125
    Top = 429
    Bitmap = {
      494C010105000900040020002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000030307080B0B1D221313303A1414374210102D3508081419000003030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000004040C0E1B1B
      4C59313195B03A3AC0E13D3DCFF23E3ED2F63C3CCCEF3939B7D72B2B859B1313
      353E020203040000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C0C2228313193AC3E3E
      D5F83D3DDBFF3C3CDBFF3C3CDBFF3C3CDBFF3C3CDBFF3C3CDBFF3D3DDBFF3E3E
      CBED2626728505050F1100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D0D242B3737ADC83E3EDCFF3B3B
      DCFF3B3BDCFF3D3DDDFF3E3EDDFF3E3EDDFF3E3EDDFF3C3CDCFF3B3BDCFF3C3C
      DCFF3F3FD9FC2D2D879E06060E10000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000005050F1133339BB34040DEFF4040DDFF6D6D
      DDFF7777DEFF4343DDFF3E3EDEFF3F3FDEFF3D3DDEFF5454DCFF8383DEFF5656
      DCFF3E3EDEFF4040DBFC24246C7D010102020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001E1E5A674141DCFB3F3FDFFF7A7AE1FFE8E8
      F2FFF1F1F5FF9494E3FF4444DEFF3E3EDFFF5757DEFFC4C4EBFFFAFAF8FFC7C7
      EBFF5454DFFF3F3FDFFF3D3DC7E41212343B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000001010103171B2408323D4C0935
      4050093540500935405009354050093540500935405009354050093540500935
      40500935405008353E4F0C334555363DB2CB4242E1FF4242E0FFB1B1EEFFFEFE
      FBFFFBFBFAFFF2F2F6FF9494E4FF5D5DDEFFC5C5EBFFFBFBFAFFFBFBFAFFF5F5
      F9FF7373E6FF3F3FE0FF4343E0FF2D2D879A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A3B4756179BBBD81AB9E0FB1AB9
      E0FB1AB9E0FB1AB9E0FB1AB9E0FB1AB9E0FB1AB9E0FB1AB9E0FB1AB9E0FB1AB9
      E0FB1AB9E0FB19BBE0FB25A3E0FC424DE1FF4443E2FF4242E2FF6565E7FFD5D5
      F5FFFCFCFAFFFBFBFAFFF0F0F6FFDCDCEFFFFAFAF9FFFBFBFAFFF8F8FAFFACAC
      F0FF4C4CE3FF4343E2FF4343E2FF3F3FC7E00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000169EC0D61AC7F2FF1AC9F4FF1AC9
      F4FF1AC9F4FF1AC9F4FF1AC9F4FF1AC9F4FF1AC9F4FF1AC9F4FF1AC9F4FF1AC9
      F4FF1AC9F4FF19CBF4FF299FEEFF4547E4FF4545E3FF4545E4FF4343E3FF6767
      E8FFD5D5F6FFFBFBFAFFFBFBFAFFFCFCFAFFFAFAFAFFF6F6FAFFADADF0FF4E4E
      E5FF4444E3FF4545E4FF4545E4FF4646E1FD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001ABDE5F31BC9F4FF1BC9F3FF1BC9
      F4FF1BC9F4FF1BC9F4FF1BC9F4FF1BC9F4FF1BC9F4FF1BC9F4FF1BC9F4FF1BC9
      F4FF1BC9F4FF1ACBF4FF2C99EEFF4647E5FF4646E5FF4646E5FF4646E5FF4343
      E4FF7C7CE7FFF1F1F8FFFBFBFAFFFAFAFAFFFCFCFAFFD0D0F2FF5454E5FF4444
      E5FF4646E5FF4646E5FF4646E5FF4646E5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001BBFE9F31CC9F4FF1CC9F4FF1CC9
      F4FF1CC9F4FF1CC9F4FF1CC9F4FF1CC9F4FF1CC9F4FF1CC9F4FF1CC9F4FF1CC9
      F4FF1CC9F4FF1BCBF4FF2A9FEFFF474AE6FF4848E6FF4848E6FF4646E6FF5D5D
      E4FFC5C5EDFFF9F9F9FFFAFAFAFFFBFBFAFFFBFBFAFFF0F0F6FF9898E6FF4B4B
      E5FF4747E6FF4848E6FF4848E6FF4848E4FD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001CBFE9F31DCAF4FF1DCAF4FF1DCA
      F4FF1DCAF4FF1DCAF4FF1DCAF4FF1DCAF4FF1DCAF4FF1DCAF4FF1DCAF4FF1DCA
      F4FF1DCAF4FF1CCCF5FF26B0F2FF4652E8FF4949E8FF4848E8FF5F5FE5FFC7C7
      EDFFFBFBF9FFFBFBFAFFF7F7FAFFEBEBF9FFFBFBFAFFFBFBFAFFF2F2F6FF9999
      E7FF4D4DE6FF4949E8FF4949E8FF4040CBE00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001DC1E9F31ECBF5FF1ECBF5FF1ECB
      F5FF1ECBF5FF1ECBF5FF1ECBF5FF1ECBF5FF1ECBF5FF1ECBF5FF1ECBF5FF1ECB
      F5FF1ECBF5FF1ECBF5FF20C3F4FF4069ECFF4B49E9FF4B4BE9FFAEAEEEFFFDFD
      F9FFFBFBFAFFF8F8FAFFAFAFF3FF7575EDFFD6D6F7FFFCFCFAFFFBFBFAFFF0F0
      F6FF7676EAFF4949E9FF4B4BE9FF2E2E8E9B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001DC1EAF31FCBF6FF1FCBF6FF1FCB
      F6FF1FCBF6FF1FCBF6FF1FCBF6FF1FCBF6FF1FCBF6FF1FCBF6FF1FCBF6FF1FCB
      F6FF1FCBF6FF1FCBF6FF1ECDF6FF3197F1FF4C4DEBFF4B4BEAFF9292F1FFF4F4
      F9FFF9F9FAFFB0B0F3FF5555EBFF4949EAFF6C6CEDFFD7D7F7FFFEFEFAFFD9D9
      F7FF6666EDFF4B4BEAFF4444D1E41111353B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001FC2EAF320CCF6FF20CCF6FF20CC
      F6FF20CCF6FF20CCF6FF20CCF6FF20CCF6FF20CCF6FF20CCF6FF20CCF6FF20CC
      F6FF20CCF6FF20CCF6FF20CDF6FF23C3F5FF4072EFFF4E4BECFF5151ECFF8D8D
      F1FF9898F2FF5757EDFF4C4CECFF4E4EECFF4C4CECFF6C6CEEFFA4A4F3FF6E6E
      EFFF4C4CECFF4D4CE9FC2626757E010102020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000020C2EBF321CCF7FF21CCF7FF21CC
      F7FF21CCF7FF21CCF7FF21CCF7FF21CCF7FF21CCF7FF21CCF7FF21CCF7FF21CC
      F7FF21CCF7FF21CCF7FF21CCF7FF20CEF7FF28B8F5FF4569EFFF4F4DEDFF4D4D
      EDFF4D4DEDFF4F4FEDFF4F4FEDFF4F4FEDFF4F4FEDFF4E4EEDFF4D4DEDFF4E4D
      EDFF4F51EDFF333FA4B005050F10000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021C3EBF322CDF7FF22CDF7FF22CD
      F7FF22CDF7FF22CDF7FF22CDF7FF22CDF7FF22CDF7FF22CDF7FF22CDF7FF22CD
      F7FF22CDF7FF22CDF7FF22CDF7FF22CDF7FF21CEF7FF29B9F6FF4178F1FF4F53
      EFFF514FEEFF5150EEFF5150EEFF5150EEFF5150EEFF514FEEFF514FEEFF4D59
      EFFF3A8CF2FF135E7B7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000022C4ECF323CEF8FF23CEF8FF23CE
      F8FF23CEF8FF23CEF8FF23CEF8FF23CEF8FF23CEF8FF23CEF8FF23CEF8FF23CE
      F8FF23CEF8FF23CEF8FF23CEF8FF23CEF8FF23CEF8FF22CFF8FF25C7F7FF33A2
      F5FF4377F2FF4C60F1FF5058F0FF5056F0FF4F59F0FF4B65F1FF3F82F3FF2EAF
      F6FF23CCF8FF10677C7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000023C4ECF324CEF8FF24CEF8FF24CE
      F8FF24CEF8FF24CEF8FF24CEF8FF24CEF8FF24CEF8FF24CEF8FF24CEF8FF24CE
      F8FF24CEF8FF24CEF8FF24CEF8FF24CEF8FF24CEF8FF24CEF8FF23CFF8FF23D0
      F8FF25CBF8FF2ABDF7FF2FB1F6FF30AEF6FF2EB4F7FF28C1F7FF24CDF8FF23D0
      F8FF23CEF8FF11677C7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000022BFE6EC25CFF9FF24CFF9FF24CF
      F9FF24CFF9FF24CFF9FF24CFF9FF24CFF9FF24CFF9FF24CFF9FF24CFF9FF24CF
      F9FF24CFF9FF24CFF9FF24CFF9FF24CFF9FF24CFF9FF24CFF9FF24CFF9FF24CF
      F9FF24CFF9FF24D0F9FF24D1F9FF24D1F9FF24D1F9FF24D0F9FF24CFF9FF24CF
      F9FF24CFF9FF11677C7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001CA0CCD725CFF9FF26D1FAFF26D1
      FAFF26D1FAFF26D1FAFF26D1FAFF26D1FAFF26D1FAFF26D1FAFF26D1FAFF26D0
      F9FF26D0F9FF26D0F9FF26D0F9FF26D0F9FF26D0F9FF26D0F9FF26D0F9FF26D0
      F9FF26D0F9FF26D0F9FF26D0F9FF26D0F9FF26D0F9FF26D0F9FF26D0F9FF26D0
      F9FF26D0F9FF12687C7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001580C0D51EAFEEFF22BDF3FF22BE
      F3FF22BEF3FF22BEF3FF22BEF3FF22BEF3FF22BEF3FF22BEF3FF23BFF4FF25C8
      F7FF26D0FAFF27D1FAFF27D0FAFF27D0FAFF27D0FAFF27D0FAFF27D0FAFF27D0
      FAFF27D0FAFF27D0FAFF27D0FAFF27D0FAFF27D0FAFF27D0FAFF27D0FAFF27D0
      FAFF27D0FAFF13687D7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000177FC1D51B98E7FF1C99E8FF1C99
      E8FF1C99E8FF1C99E8FF1C99E8FF1C99E8FF1C99E8FF1C99E8FF1C9AE8FF1DA0
      EAFF21B3F1FF26CBF9FF28D1FBFF28D1FAFF28D1FBFF28D1FBFF28D1FBFF28D1
      FBFF28D1FBFF28D1FBFF28D1FBFF28D1FBFF28D1FBFF28D1FBFF28D1FBFF28D1
      FBFF28D1FBFF13687D7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001A83C5D5209CEBFF209CEBFF209C
      EBFF209CEBFF209CEBFF209CEBFF209CEBFF209CEBFF209CEBFF1F9CEBFF1F9C
      EBFF1F9CEBFF22ADF1FF28CDFAFF29D2FBFF29D2FBFF29D2FBFF29D2FBFF29D2
      FBFF29D2FBFF29D2FBFF29D2FBFF29D2FBFF29D2FBFF29D2FBFF29D2FBFF29D2
      FBFF29D2FBFF14697D7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001D86C8D423A1F0FF23A1F0FF23A1
      F0FF23A1F0FF23A1F0FF23A1F0FF23A1F0FF23A1F0FF23A1F0FF23A1F0FF23A1
      F0FF23A0EFFF23A0EFFF26B8F5FF29D2FBFF2AD2FCFF2AD2FBFF2AD2FBFF2AD2
      FBFF2AD2FBFF2AD2FBFF2AD2FBFF2AD2FBFF2AD2FBFF2AD2FBFF2AD2FBFF2AD2
      FBFF2AD2FBFF14697D7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001A6EA2AB27A5F4FF27A5F4FF27A5
      F4FF27A5F4FF27A5F4FF27A5F4FF27A5F4FF27A5F4FF27A5F4FF27A5F4FF27A5
      F4FF27A5F4FF27A4F3FF27A8F4FF2AC6FAFF2BD3FCFF2AD3FCFF2AD3FCFF2AD3
      FCFF2AD3FCFF2AD3FCFF2AD3FCFF2AD3FCFF2AD3FCFF2AD3FCFF2AD3FCFF2AD3
      FCFF2AD3FCFF15697E7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000071E2C2E1E77AEB4279BE3EB279D
      E7EE279CE5ED279CE5ED279CE5ED279CE5ED279CE5ED279CE5ED279CE5ED279C
      E5ED279CE5ED279CE5ED279CE5ED28A6E7ED2ACAF5F82BD4FDFF2BD3FCFF2BD3
      FCFF2BD3FCFF2BD3FCFF2BD3FCFF2BD3FCFF2BD3FCFF2BD3FCFF2BD3FCFF2BD3
      FCFF2BD3FCFF14677B7C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000020A0F0F071E2B2D0822
      3233082232330822323308223233082232330822323308223233082232330822
      32330822323308223233082232330821303112586C6D28C1E7E92CD4FDFF2CD4
      FDFF2CD4FDFF2CD4FDFF2CD4FDFF2CD4FDFF2CD4FDFF2CD4FDFF2CD4FDFF2CD4
      FDFF2BCDF4F60E434F5000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000203030B363F411F8EA9AA28BB
      DFE02AC3E9EA2AC3E9EA2AC3E9EA2AC3E9EA2AC3E9EA2AC3E9EA2AC4EAEB28BB
      DFE0166C808201080A0A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000060707051B
      212107252D2D07262E2E07262E2E07262E2E07262E2E07262E2E07262E2E061B
      2020000405050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000060809000F
      1517000F1517000F1517000F1517000F1517000F1517000F1517000F1517000F
      1517000F1517000F1517000F1517000F1517000F1517000F1517000F1517000F
      1517000F1517000F1517000F1517000F1517000F1517000F151700090D0E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000085C7D8C0DA8E1FB0DAB
      E5FF0DABE5FF0DABE5FF0DABE5FF0DABE5FF0DABE5FF0DABE5FF0DABE5FF0DAB
      E5FF0DABE5FF0DABE5FF0DABE5FF0DABE5FF0DABE5FF0DABE5FF0DABE5FF0DAB
      E5FF0DABE5FF0DABE5FF0DABE5FF0DABE5FF0DABE5FF0DABE5FF0DA9E3FD0757
      7582000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000002020203050505060909090A0B0B
      0B0C0D0D0D0E0E0E0E0F0F0F0F1010101011101010110F0F0F100F0F0F100D0D
      0D0E0C0C0C0D0909090A06060607030303040000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101020606
      06070B0B0B0C0E0E0E0F10101011131313141414141515151516151515161515
      151613131314111111120F0F0F100C0C0C0D0909090A04040405000000010000
      0000000000000000000000000000000000000000000000000000000000030000
      00090000000F0000001100000011000000110000001100000011000000110000
      0011000000110000001100000011000000110000001100000011000000110000
      0011000000110000001100000011000000110000001100000011000000110000
      000F00000009000000030000000000000000000000000D9CD3ED0EABE5FF0EAB
      E5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EAB
      E5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EAB
      E5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EABE5FF0EA9
      E3FD01161E210000000000000000000000000000000000000000000000000000
      000000000001040404050909090A0D0D0D0E1111111215151516181818191B1B
      1B1C1D1D1D1E1F1F1F2020202021212121222121212221212122202020211E1E
      1E1F1C1C1C1D1919191A16161617121212130F0F0F100A0A0A0B060606070101
      0102000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000030303040909090A0F0F0F10141414151919
      191A1E1E1E1F2121212225252526262626282828282A2929292B2929292B2929
      292B2727272926262627232323241F1F1F201B1B1B1C17171718121212130C0C
      0C0D0606060700000001000000000000000000000000000000030305071E1D2E
      35652A414A852A414A8A2A414A8A2A414A8A2A414A8A2A414A8A2A414A8A2A41
      4A8A2A414A8A2A414A8A2A414A8A2A414A8A2A414A8A2A414A8A2A414A8A2A41
      4A8A2A414A8A2A414A8A2A414A8A2A414A8A2A414A8A2A414A8A2A414A8A2A41
      4A851D2E35650305071E0000000300000000000001010D92D3FB13ADE6FF13AD
      E6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13AD
      E6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13AD
      E6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13ADE6FF13AD
      E6FF07475F6A0000000000000000000000000000000000000000000000000505
      05060A0A0A0B10101011151515161A1A1A1B1E1E1E1F22222223262626282929
      292B2C2C2C2E2F2F2F31303030333030303331313134303030332F2F2F312D2D
      2D2F2A2A2A2C27272729242424251F1F1F201B1B1B1C16161617111111120C0C
      0C0D070707080101010200000000000000000000000000000000000000000000
      000000000000020202030A0A0A0B10101011171717181E1E1E1F242424252929
      292B2E2E2E304345454A5293A0C0558F9ABB62787D924B4D4D553C3C3C413C3C
      3C403A3A3A3E3737373B34343437303030322B2B2B2D26262628212121221A1A
      1A1B141414150D0D0D0E060606070000000000000000000000001A2E354D7BBD
      D3F28AD2E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1
      E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1
      E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD1E9FF8AD2
      E9FF7BBDD3F21A2E354D000000000000000000070C100D7CC8FF18AEE7FF18AE
      E7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AE
      E7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AE
      E7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AEE7FF18AE
      E7FF10749BAC0000000000000000000000000000000000000001060606070C0C
      0C0D12121213181818191E1E1E1F23232324272727292D2D2D2F313131343636
      36393939393D3C3C3C413F3E3E44615E5C70736C678A85776CA68E7B6BB58E7B
      6BB482756D9D65615E724A4948502929292B252525261F1F1F201A1A1A1B1414
      14150E0E0E0F0808080902020203000000000000000000000000000000000000
      0000030303040B0B0B0C131313141A1A1A1B222222232828282A2F2F2F313535
      35384141424732A8BDEB67D5E6FF46C5DBFF5CCBDCFC31AAC0F03B9AAFDD6170
      748B4C4C4C564646464E424242483D3D3D423737373B323232352C2C2C2E2525
      25261E1E1E1F171717180F0F0F10070707080000000000000000253F485C87D0
      E9FD8DD8F1FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7
      F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7
      F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8DD8
      F1FF87D0E9FD253F485C0000000000000000010F1C250E73C1FF4CBEE9FF1DB0
      E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0
      E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0
      E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0E8FF1DB0
      E8FF1BA3D5EC00010202000000000000000000000000040404050A0A0A0B2424
      24257B726A8D1D1D1D1E232323242828282A2E2E2E30333333363838383C3D3D
      3D425E5B5A6C8D7A6CB5A47A57E7B3865EF2C18B58FFC38D5AFFC48E5AFFC48F
      59FFC08650FFB77A49FDA97F59E4957D6ABE4746454C252525261F1F1F201818
      1819121212130C0C0C0D06060607000000000000000000000000000000000000
      000008080809101010111818181920202021262626282E2E2E30353535383C3C
      3C404897A6CC66D7E7FF0AB1CEFF36CEE1FF4AD1E3FF12B4D2FF6BDAE8FF5AC8
      D9FB1BA0BCF361787C994A4A4A544545454C3E3E3E443838383C313131342A2A
      2A2C242424251C1C1C1D141414150C0C0C0D0000000000000000233D485C86CE
      E8FD8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7
      F0FF8CD7F0FF8DD7F0FF8DD8F0FF8DD8F0FF8DD8F0FF8DD8F0FF8DD7F0FF8DD7
      F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7
      F0FF86CEE8FD233E485C000000000000000001172A38056EC0FF99D1E9FF22B1
      E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1
      E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1
      E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1E8FF22B1
      E8FF22B1E8FF06222C31000000000000000000000000040404050A0A0A0B2626
      2627A77E5BE187796F9F242424252929292B2F2F2F31343434375A585665997F
      69CBB38660F2C9996AFFCD9C69FFCC9864FFCA955FFFC9925BFFC89159FFC890
      58FFC78F57FFC78F56FFC68E55FFC1864DFFAC7A51ED6F69647D1F1F1F201919
      191A121212130C0C0C0D06060607000000000000000000000000000000000000
      000008080809101010111818181920202021272727292F2F2F31363636396172
      76883ABFD4FA3EC9DEFF04BDD6FF47D3E4FF07B0CEFF15C7DDFF4FD5E6FF29C0
      D7FF4DCFE1FF5DCBDCFC2D9DB4E7617C819C3F3F3F453939393D323232352B2B
      2B2D242424251C1C1C1D141414150C0C0C0D0000000000000000233C485C86CE
      E8FD8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8DD7F0FF8ED8
      F1FF8FD8F1FF90D9F1FF90D9F1FF91D9F1FF92D9F1FF94DBF2FF93DBF2FF90D9
      F1FF8FD8F1FF8ED8F0FF8DD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7F0FF8CD7
      F0FF86CEE8FD233C485C00000000000000000220394C056EC0FFC2D7E6FF3EB9
      EAFF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3
      E9FF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3
      E9FF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3E9FF27B3
      E9FF27B3E9FF114F697300000000000000000000000001010102080808092323
      2324B08F71E0CAAB8CF6736C6782252525262B2B2B2D8C7C6FAAB48D68F0D2A5
      79FFCE9E6DFFCB9662FFCA9560FFCA945FFFCA945DFFC9935CFFC9925BFFC891
      59FFC89058FFC78F56FFC78E55FFC68D53FFC68C52FFB27B48F87B726A8D1515
      15160F0F0F100909090A03030304000000000000000000000000000000000000
      0000040404050C0C0C0D141414151B1B1B1C232323242929292B303030323CA4
      B9E44BD3E5FF06B5D2FF1AC8DEFF23C0D9FF08C3DBFF39D3E6FF41CFE2FF03B2
      D0FF4AD4E5FF28C3DAFF2BBFD8FF33B5C6F25E8890AB333333362F2F2F312626
      26281F1F1F20171717180F0F0F10080808090000000000000000223B475C86CD
      E7FD8CD8F0FF8CD7F0FF8CD7F0FF8CD7F0FF8DD7F0FF8ED8F1FF90D9F1FF91D9
      F1FF92D9F1FF93DAF2FF93DAF2FF93D9F1FF5D99CEFF4C82C1FF6EA9D7FF8FD1
      EDFF93DBF2FF91D9F1FF8FD8F1FF8ED8F0FF8DD7F0FF8CD7F0FF8CD7F0FF8CD8
      F0FF86CDE7FD223B475C0000000000000000012A4860056EC0FFABCAE1FF95D3
      EBFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4
      EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4
      EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4EAFF2CB4
      EAFF2CB4EAFF1F7FA6B500000000000000000000000000000000010101021C1C
      1C1DB08F74DEE3C8AEFFBE9D81EC6E68637BA78261E2D1A883FFD1A272FFCC99
      66FFCC9864FFCB9763FFCB9662FFCA9560FFCA945FFFC9935DFFCA9560FFCA95
      60FFCA945FFFCA935CFFC89059FFC78E55FFC68C53FFC68B51FFB17D50F24E4C
      4A520909090A0202020300000000000000000000000000000000000000000000
      000000000000030303040B0B0B0C121212131919191A1F1F1F2053595B623EBE
      D5F935CADFFF01BBD6FF2CCFE3FF09B7D4FF15CFE7FF56DCEDFF13B7D3FF27C8
      DEFF30C7DEFF00B4D1FF03C3DAFF62DAE9FF61D1E0FD3D9FB2DA4F54555B1C1C
      1C1D151515160E0E0E0F070707080000000000000000000000002139475C85CD
      E7FD8CD8F0FF8CD7F0FF8DD7F0FF8ED8F0FF90D9F1FF91D9F1FF93DBF2FF95DB
      F2FF95DBF2FF96DBF2FF96DBF3FF95DAF2FF376FB8FF002F95FF08399AFF3164
      B1FF7BB9DFFF95DBF3FF92DAF2FF91D9F1FF8FD8F1FF8DD8F0FF8CD7F0FF8CD8
      F0FF85CDE7FD213A475C0000000000000000033257740670C2FF92BDDDFFE2EA
      EDFF3AB8EBFF31B6EBFF31B6EBFF31B6EBFF31B6EBFF31B6EBFF31B6EBFF31B6
      EBFF31B6EBFF31B6EBFF31B6EBFF31B6EBFF31B6EBFF31B6EBFF31B6EBFF31B6
      EBFF31B6EBFF31B6EBFF31B6EBFF31B6EBFF31B6EBFF31B6EBFF31B6EBFF31B6
      EBFF31B6EBFF2FACDFF201030404000000000000000000000000000000001515
      1516B09075DDE1C2A6FFE1C3A6FFCBA582FCE0C2A5FFDAB693FFCF9F6EFFCD9A
      67FFCC9966FFCC9864FFCC9865FFCE9D6BFFCC9C6BFFC18F64FEB48866EAB27D
      4EF6AE7349F7AF784CF6AF7D51F1B48355F2BF864FFFC68C53FFC68B51FFA082
      69CB0C0C0C0D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000050505060B0B0B0C1111111259929DB44CD1
      E3FF11C0D9FF0DC8E1FF1FC7E0FF15C7E2FF2DD8EDFF3CCEE4FF0CBCD8FF3CCF
      E2FF01B0CEFF00C2DAFF31CEE1FF4CD4E5FF2FC3DBFF39C1D8FF49AEC2E52525
      25260808080901010102000000000000000000000000000000002038465C85CC
      E7FD8CD8F0FF8DD7F0FF8FD8F1FF91D9F1FF92DAF2FF95DBF3FF8FCFECFF90D0
      ECFF99DDF4FF99DCF3FF99DDF3FF99DCF3FF75B5DDFF4D87C5FF2055A9FF0335
      98FF1E51A7FF7BB9E0FF96DCF3FF93DAF2FF92D9F1FF90D9F1FF8ED8F0FF8DD8
      F0FF85CCE7FD2038465C0000000000000000043D69870975C8FF78B0DBFFEEEE
      EEFF86CEECFF42BDEDFF36B7ECFF36B7ECFF36B7ECFF36B7ECFF36B7ECFF36B7
      ECFF36B7ECFF36B7ECFF36B7ECFF36B7ECFF36B7ECFF36B7ECFF36B7ECFF36B7
      ECFF36B7ECFF36B7ECFF36B7ECFF36B7ECFF36B7ECFF36B7ECFF36B7ECFF36B7
      ECFF36B7ECFF36B7ECFF0C2A353A000000000000000000000000000000001515
      1516B09075DDE1C3A6FFDCB998FFDFBEA0FFDBB796FFDBB695FFD9B491FFD2A3
      75FFCC9967FFD0A070FFCC9E70FFAF8C6CE199826FBD6C6661774C4A49505653
      515B6C656074A48A75BDD3B59EF2C9A282F8B28A62E7AF8257EAC68C53FFB37C
      4DF6403F3E420000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001515151651ABBAD632CE
      E1FF0BC0DCFF1BD3EAFF14C1DEFF27DAF3FF3DDCF1FF0EB5D4FF31D4E8FF0EB5
      D2FF00C0D8FF21CADFFF45D3E4FF0FB6D2FF2DC5DBFF64DAE8FF68D4E3FD5199
      A8C20000000000000000000000000000000000000000000000001F36465C85CC
      E6FD8DD8F1FF8FD8F1FF91D9F1FF93DAF2FF96DCF3FF92D4EEFF4076BBFF4176
      BBFF96D5EFFF9CDEF4FF9CDEF4FF9DDEF4FF9EE0F5FF9EE0F5FF8ACAE9FF3971
      B9FF053799FF3267B3FF91D2EEFF96DCF3FF94DAF2FF92DAF2FF90D9F1FF8ED8
      F1FF85CCE6FD1F36465C000000000000000007497D9B0C7ACDFF60A6D9FFEEEE
      EEFFD6E6EDFF4FC2EFFF59C7F1FF3BB9EDFF3BB9EDFF3BB9EDFF3BB9EDFF3BB9
      EDFF3BB9EDFF3BB9EDFF3BB9EDFF3BB9EDFF3BB9EDFF3BB9EDFF3BB9EDFF3BB9
      EDFF3BB9EDFF3BB9EDFF3BB9EDFF3BB9EDFF3BB9EDFF3BB9EDFF3BB9EDFF3BB9
      EDFF3BB9EDFF3BB9EDFF1D59727C000000000000000000000000000000001414
      1415B19076DDE1C3A7FFDCB998FFDCB998FFDCB897FFDBB795FFDBB695FFDBB8
      96FFDAB492FFAF9170DF84786E96323232340202020301010102010101020000
      000100000000000000009D8876AFBEB4ABCAA49E98AAA49385B6AC8159E7BF84
      4AFF7F756C8F0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003233343541B9CDF221CD
      E2FF17CCE6FF22D4EDFF21CEE8FF30E1F8FF1FC9E3FF1DCDE7FF26C7E0FF02BC
      D6FF12C6DDFF3DCEE2FF07B2CFFF35CBDFFF6FDDEAFF66BECBE661868D9A0C0C
      0C0D0000000000000000000000000000000000000000000000001E36455C85CB
      E6FD8FD9F1FF91D9F1FF93DAF2FF96DBF3FF97DAF2FF538BC6FF0A3D9CFF0A3D
      9CFF558CC7FF9EDDF3FF9FDFF5FFA0DFF5FFA1DEF4FFA0DEF4FFA1E1F6FF8CCB
      EAFF2358ACFF0C3E9DFF6FACD8FF9BDFF4FF97DBF3FF95DBF2FF92DAF2FF91D9
      F1FF86CCE7FD1E36455C00000000000000000A5690AF1080D3FF4A9CDAFFEEEE
      EEFFEDEDEDFF94D1EAFF5AC6F1FF74D3F6FF73D3F6FF73D3F6FF73D3F6FF73D3
      F6FF73D3F6FF73D3F6FF73D3F6FF75D4F6FF64CBF3FF41BAEEFF40BAEEFF40BA
      EEFF40BAEEFF40BAEEFF40BAEEFF40BAEEFF40BAEEFF40BAEEFF40BAEEFF40BA
      EEFF40BAEEFF40BAEEFF2F8BB1BE000000000000000000000000000000001414
      1415B19074DDE1C4A8FFDCB998FFDCB998FFDCB998FFDBB896FFDFBFA1FFCDAB
      90F49A8473BA2424242500000000000000000000000000000000000000000000
      000000000000000000001D1D1D1E9D9187A87D7B78815F5E5D61837A738FB085
      5BE899826EB90000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000051595B5E41CADFFF24D2
      E8FF25D9F1FF29D7F1FF32DCF5FF30DCF5FF1AC6E3FF2DD8F0FF0BBEDBFF08C4
      DBFF31CBE0FF03B7D4FF3CD1E3FF79D7E4FE5DACB9D3484D4E51000000000000
      00000000000000000000000000000000000000000000000000001D34435C86CB
      E6FD91DAF2FF93DAF2FF96DBF2FF98DBF2FF639DD0FF0F429FFF093C9CFF093C
      9CFF0F429FFF679FD1FFA4E1F6FF82BCE2FF5387C4FF598EC8FF88C3E5FFA4E3
      F7FF538DC8FF063A9BFF4E88C5FF9CDEF4FF99DCF3FF97DCF3FF95DBF2FF93DA
      F2FF87CCE7FD1E34455C00000000000000000F65A5C31284D8FF3394DBFFEEEE
      EEFFEDEDEDFFEAE3D4FFAB9F65FFB1C4B9FFB4CBD1FF9EB9BDFFAFC7CDFFBAD5
      DEFFC0DEEAFFADC2C6FF95B3B8FF8BC2D6FF63C6EEFF73D2F5FF46BCEEFF45BC
      EEFF45BCEEFF45BCEEFF45BCEEFF45BCEEFF45BCEEFF45BCEEFF45BCEEFF45BC
      EEFF45BCEEFF45BCEEFF43B6E6F7020607080000000000000000000000001414
      1415B19075DDE2C4A9FFDCB998FFDCB998FFDCB998FFDEBC9CFFDCBA9CFF8F7E
      70A7000000000000000000000000000000000000000000000000000000000000
      000000000000000000000D0D0D0E76716E7A5555545737373738181818199F83
      6DC2A07F62CE0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000617C828B51D4E7FF27DB
      F0FF34E3FBFF34D7F0FF46E6FCFF27CCE7FF2EDFF6FF19CBE5FF0FC6DFFF23C8
      DDFF01BAD5FF3BD0E3FF69D1E0FB649198A81616161700000000000000000000
      00000000000000000000000000000000000000000000000000001D33435C87CB
      E7FD93DBF2FF95DBF2FF98DDF3FF8ECFECFF4E88C5FF3870B8FF1146A1FF1146
      A1FF3970B9FF5189C6FF9AD5EFFF6FA9D7FF619BCFFF93CEECFF9DDAF2FFA7E4
      F8FF6AA5D5FF0A3E9DFF417ABEFF9DDDF4FF9CDDF4FF99DCF3FF97DBF3FF95DB
      F3FF89CCE7FD1D33435C00000000000000001173B8D61589DDFF1E8DDDFFEEEE
      EEFFEDEDEDFFEBE8E3FFD8C49CFFE1DACAFFD9D0C8FFC2BFB5FFD1CBC3FFDDD7
      D0FFEAEAEAFFD4C9BEFFB5B1A5FFD5CABFFFC6CAC8FF78C7E8FF6CCEF4FF4ABD
      EFFF4ABDEFFF4ABDEFFF4ABDEFFF4ABDEFFF4ABDEFFF4ABDEFFF4ABDEFFF4ABD
      EFFF4ABDEFFF4ABDEFFF4ABDEFFF12303E420000000000000000000000001414
      1415B19076DDE2C5A9FFDCB998FFDCB998FFDCB998FFDCB998FFE0C0A3FFC7A4
      86F05D5956620000000000000000000000000000000000000000000000000000
      00000000000000000000070707084C4B4A4D2D2D2D2E0E0E0E0F00000000766E
      6783A37F60D40000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006188909D56DAEDFF30E1
      F8FF43E6FCFF45DDF3FF47DEF4FF38D9F2FF2DDDF4FF19CCE7FF1BCAE1FF00BD
      D6FF35CFE1FF68CDDDF662848A97000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C32435C89CB
      E7FD95DBF3FF97DCF3FF9ADDF3FF9BDDF4FF9EDEF4FF92D0EDFF235AACFF174C
      A5FF8BC4E6FFA7E2F7FFA9E4F8FF71AAD8FF72ABD8FFACE7F9FFA8E3F7FFA9E5
      F8FF639CD0FF0A3E9DFF4983C3FFA0E0F5FF9EDEF4FF9BDDF4FF99DCF3FF97DC
      F3FF8ACCE7FD1C32435C00000000000000001C83CBE61C90E2FF188EE2FFE0E8
      EEFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFD9D0C8FFDCDBD7FFDCD8D2FFD3C7
      BBFFDCD5CFFFCCBCAEFFD7CEC6FFD0C3B7FFD5CCC4FFCECBC5FF76CCF0FF65CA
      F3FF4FBEF0FF4FBEF0FF4FBEF0FF4FBEF0FF4FBEF0FF4FBEF0FF4FBEF0FF4FBE
      F0FF4FBEF0FF4FBEF0FF4FBEF0FF29637C840000000000000000000000001414
      1415B19076DDE3C8AEFFDEBD9DFFDEBC9DFFDEBC9CFFDDBC9CFFDDBB9CFFE1C5
      A9FFBA9B7BE73C3B3B3E00000000000000000000000000000000000000000000
      00000000000000000000010100011C1C1C1D050404050000000000000000605C
      59679A7F69C00000000000000000000000000000000000000000000000000000
      00000000000000000000000000000909090A5E5E6C7E5D8596AE63DFF0FF3EE6
      FDFF51E5FAFF56E1F5FF52E4F8FF45E7FDFF26D6EEFF19D0E8FF06C1DCFF2ECD
      E0FF5EC6D4F15F74787F00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C31435C8ACB
      E7FD97DCF3FF99DCF3FF9CDEF4FF9EDFF5FFA1E0F5FFA0DDF4FF3E76BCFF0C42
      9FFF679ED1FFADE6F9FFACE6F9FF88C0E4FF89C0E4FFADE6F9FFABE5F8FFA5DD
      F4FF3D72B9FF0C429FFF67A2D4FFA4E3F7FFA0DFF5FF9DDEF4FF9BDDF4FF99DD
      F4FF8BCCE7FD1C31435C000000000000000013639CAD42A2E9FF2E9AE7FFCCE0
      EEFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFE2DDD8FFDAD1C8FFDDD6D0FFE2DE
      D9FFE7E5E3FFE9E9E9FFE8E8E8FFE7E6E6FFE0DEDBFFD9D3CDFFC3D0D3FF74CF
      F4FF65C9F3FF55C0F1FF55C0F1FF55C0F1FF55C0F1FF55C0F1FF55C0F1FF55C0
      F1FF55C0F1FF55C0F1FF55C0F1FF4D9CBCC60000000000000000000000001414
      1415A98160E0D8B699FFD8B598FFD7B698FFD8B698FFD8B698FFD7B598FFD8B6
      98FFD5B190FFA9825EE423232324000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003535
      3437726A657D0000000000000000000000000000000000000000000000000000
      000000000000000000000000000061617B9B0404A0FC06118EFB14429AFF65DB
      F2FF65EAFCFF69E9FAFF5AEAFDFF3CE4FAFF26D9F0FF14CEE6FF2FCDE1FF4EBB
      CCEC5864666B0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C30425C8BCB
      E7FD99DDF4FF9BDDF4FF9EDEF4FFA0DFF5FFA3E1F6FFA7E4F7FF72ACD9FF1248
      A3FF265BADFF8DC1E4FFB1E8FAFFB0E7F9FFAFE6F9FFB1E8FAFFAEE4F7FF6A9F
      D2FF1248A3FF265DAEFF93CEEBFFA6E2F7FFA2E0F5FF9FDFF5FF9DDEF4FF9ADE
      F4FF8CCCE7FD1C30425C000000000000000002090F101354818D2E75A7B6A8BE
      CEDFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFE3DFDAFFE8E7
      E5FFDBD3CCFFD5CAC0FFD8CFC6FFD6CDC3FFDDD7D1FFE4E3E2FFD1D2D2EB7A9F
      B0C074CFF5FE81D7F8FF6FCDF5FF69CAF4FF69CAF4FF69CAF4FF69CAF4FF69CA
      F4FF69CAF4FF6BCBF4FF81D7F8FF54ADD6E10000000000000000000000000000
      00003434333653504E57545250595754525C5855535D5B5755605C5956625E5A
      5764605C5966615D5A68161616170000000000000000101010117F746C8D9582
      71B2998475B5998475B5998473B5998473B5998473B5998474B6998474B69782
      71B65D5956620000000000000000000000000000000000000000000000000000
      0000000000000000000000000000424284D20000B8FF0000C3FF0E0FBCFF0C1C
      8AFE4D7BBAFF7AEAFAFF53E9FDFF37E6FDFF26D9F0FF4DD7EAFF3EB1C3E7454A
      4B4D000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001A2E425C8CCB
      E7FD9ADEF4FF9CDEF4FF9FDFF5FFA2E0F6FFA5E1F6FFA8E3F7FFA3DDF4FF4982
      C2FF0E45A1FF285DAEFF6FA2D3FF9ACCEAFFA2D4EEFF91C3E5FF578CC7FF174E
      A6FF164DA5FF6EA8D7FFAAE4F8FFA7E2F7FFA4E1F6FFA1E0F5FF9EDFF5FF9CDE
      F4FF8DCCE7FD1A2E425C00000000000000000000000000000000000000000A0B
      0B0D252525284646464BEEEEEEFFEDEDEDFFEDEDEDFFEDEDEDFFE6E2DFFFDED7
      D0FFE7E5E3FFE3E3E3F7B5B5B5C68383838F515151591F1F1F23000000000000
      00002040505456ADD8E370CDF5FF75D0F6FF75D0F6FF75D0F6FF75D0F6FF75D0
      F6FF75D0F6FF73CFF6FF62C4F2FE2751656B0000000000000000000000000808
      08099E7D61CF0606060700000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005E5B5864B995
      74EED9B696FFD8B290FFD7B18FFFD7B18FFFD7B28FFFD7B390FFD8B492FFD7B2
      92FF958271B30000000000000000000000000000000000000000000000000000
      000000000000000000000F0F0F10568A9CB90D2E8BFC05109BFF1D1DD4FF3636
      E7FF3338C2FE13268AFE4BA5D2FF56E6F9FF4FD0E4FD44A3B7D7202020210000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000192C415C8CCB
      E7FD9CDEF4FF9EDFF4FFA1E0F5FFA4E1F6FFA7E2F7FFA9E3F7FFADE6F9FF9FD6
      F0FF4C84C3FF144CA5FF1048A3FF1F55AAFF245BADFF1A51A7FF0E46A2FF1F57
      ABFF6BA2D4FFABE2F7FFABE4F8FFA8E3F7FFA6E2F6FFA3E0F6FFA0DFF5FF9EDF
      F5FF8ECCE7FD1A2C415C00000000000000000000000000000000000000000000
      0000000000000B0B0B0CEBEBEBFCEDEDEDFFEBEBEBFDC6C6C6D69393939F6161
      61692F2F2F33050505050000000000000000050A080E00000000000000000000
      00000000000002030404162E393D204252572042525720425257204252572042
      5257204252572042525710222B2D000000000000000000000000000000001C1C
      1C1DA77752E95A58555E3E3D3C3F2F2F2F302D2D2C2E1B1B1B1C000000000000
      0000000000000000000000000000000000000000000000000000000000006A65
      6172C6A283F2D6AC86FFD1A375FFD0A172FFCF9F70FFCF9F6FFFCF9F6FFFD8B3
      92FF988475B40000000000000000000000000000000000000000000000000000
      0000000000003C3F3F4135A5BBDF2BCBDFFF26D0E6FF339CCCFF12258EFF2C30
      C2FF5757FCFF3B3BE4FF111A9BFE224492ED5F73777E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000192B415C8DCB
      E7FD9DDFF5FF9FDFF5FFA2E0F6FFA5E2F6FFA8E3F7FFABE4F8FFAEE5F8FFB2E7
      FAFFACE0F6FF7CB2DCFF477EC0FF2D64B2FF265EAFFF336AB5FF568DC8FF90C5
      E7FFB1E6F9FFB0E6F9FFADE5F8FFAAE4F8FFA7E2F7FFA4E1F6FFA1E0F5FF9FE0
      F5FF8ECCE7FD192B415C00000000000000000000000000000000000000000000
      00000000000000000000444444493E3E3E430E0E0E0F00000000000000000000
      00000000000000000000000000000000000025A05FD81C7444A0041209180000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002020
      2021AA7650F2958577AB78726C7F6C67647179726B8332313133000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F746D8DCCA786F8D3A980FFD0A273FFD0A071FFCF9F6FFFCF9F6FFFD8B2
      91FF998474B60000000000000000000000000000000000000000000000000000
      000000000000343536374A9FAFCC36BED4F64FDEF0FF64EAFBFF6BE8FAFF3F7B
      BCFF1B2794FF2829C8FF1A1ACAFF363683DD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018293F5C8DCB
      E7FD9EDFF5FFA0E0F5FFA4E1F6FFA7E2F7FFAAE3F7FFADE5F8FFB0E6F9FFB3E7
      FAFFB6E9FBFFB9EBFCFFB5E6F9FFABDCF4FFA8D9F2FFAEDFF5FFB8E9FBFFB8EA
      FCFFB4E8FAFFB1E7F9FFAFE5F9FFACE4F8FFA9E3F7FFA6E2F6FFA2E0F6FFA0E0
      F5FF8FCBE7FD182A3F5C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000197B4BA129C175FF29B26BF11354
      3273000401050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002C2C
      2B2DB38764F0AA7C59EBA7907EC09C8B7DB19F8777BD5855525D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003C3B3B3EAE8D70DBD9B392FFD1A475FFD0A172FFCF9F6FFFCF9F6FFFD7B3
      90FF998474B60000000000000000000000000000000000000000000000000000
      00000000000000000000000000006073788121A8C6FD68DFF2FF80EFFDFF79EE
      FDFF79DDF1FF294996F1262982EA535359620000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018283F5C8DCA
      E7FD9FE0F5FFA1E0F5FFA5E1F6FFA8E3F7FFABE4F8FFAEE5F9FFB1E7F9FFB4E8
      FAFFB7E9FBFFBAEAFBFFBCEBFCFFBEEDFDFFC0EEFEFFBFEDFDFFBDECFDFFBAEB
      FCFFB7EAFBFFB4E9FBFFB1E7FAFFAEE6F9FFABE5F8FFA8E3F7FFA4E2F7FFA2E2
      F7FF91CDE8FD18283F5C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D4C316024C97EFF26C57AFF29C1
      75FF24A05FD70C331E4600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002323
      2324B2937ADCB68C6BF1B87B4FFFBB8C66F1B08765E8756D6880000000000000
      00000000000000000000000000000000000000000000000000000F0F0F108478
      7094B89B81E4D9B390FFD2A579FFD1A375FFD0A273FFCFA070FFCF9F6FFFD7B1
      8EFF9A8473B80000000000000000000000000000000000000000000000000000
      000000000000000000001E1E1E1F3D779ADD0F6FAAFF0E8FBAFF39BAD6FF85E9
      F7FF8EF0FDFF5CA4B1C800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000017273F5C8ECA
      E7FD9FE0F5FFA2E0F5FFA5E2F6FFA9E3F7FFACE4F8FFAFE6F9FFB3E7FAFFB6E8
      FAFFB9EAFBFFBCEBFCFFBEECFDFFC0EDFDFFB4DFF4FFACD7EFFFAAD6EEFFA8D5
      EEFFA5D4EDFFA3D3EDFFA0D2ECFF9DD1EBFF9AD0EAFF97CEEAFF95CDE9FF93CD
      E9FF74ABD2FD0F1D365C00000000000000000000000000000000000000000000
      00000000000000000000010A070B0D2A1F2F0000000000000000000000000000
      000000000000000000000000000004211729148A5AA720D086FF22CD83FF24C9
      7EFF26C57AFF28C176FF208350AE0107040B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A78971D2E6CEB9FFAD7D57F4AE6F40FFB6794DFFA2836BCF524F4D560000
      0000000000000000000000000000000000002E2D2D2F7D736B8BAC8F78D5CDAB
      8AFDD6AD87FFD3A87CFFD2A679FFD2A477FFD1A274FFD0A071FFCF9F6FFFD7B1
      8EFF9A8572B90000000000000000000000000000000000000000000000000000
      00000000000000000000557C93C0217BB7FF0B6DADFF106EABFF387C9EDD6099
      A4B960C3D3EE59A0B0C700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000015263E5C8EC9
      E6FDA0E0F5FFA2E0F6FFA6E2F6FFA9E3F7FFADE5F8FFB0E6F9FFB3E7FAFFB7E9
      FBFFBAEAFBFFBDECFCFFC2EFFEFFA3CCE8FF325A9EFF1E4791FF1E4791FF1E47
      91FF1D4691FF1D4690FF1C4590FF1B448FFF1A438FFF1A428FFF19428EFF1942
      8EFF123988FD020D2C5B00000000000000000000000000000000000000000000
      00000000000000000000000000000D6C4A7E0A52375F0324182A042D1F350740
      2C4B0A5D3F6C1082589915B77BD61AD991FF1BD78FFF1CD58DFF1ED28AFF20D0
      87FF22CD83FF24CA7EFF3ACE88FF113A264A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F766E8CDDBFA6FFE8D2BDFFBC9679F0A7734FF2A7643AFDA27454E49D7C
      62CD83766C956E6762787B736C899F8B7BBDBC9D87E4DCBEA3FFE3C8ADFFDEBF
      A0FFDAB492FFD4A981FFD3A77AFFD2A578FFD6AD86FFD5AB83FFCF9F70FFD7B0
      8DFF9A8473BA0000000000000000000000000000000000000000000000000000
      0000000000005E686E7B3584B9F81379BBFF0C72B4FF1D77B1FF617887A30000
      0000464A4B4D5761636700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000014253E5C8DC9
      E6FDA0E0F5FFA3E1F6FFA6E2F7FFA9E3F7FFADE5F8FFB0E6F9FFB4E8FAFFB7E9
      FBFFBBEAFCFFBEECFCFFC5F0FFFF84ADD5FF0B3C95FF0A3E99FF0A3D99FF0A3D
      98FF093C98FF083B97FF083A97FF073896FF063695FF053594FF043393FF0332
      92FF063392FD020E325B00000000000000000000000000000000000000000000
      0000000000000000000000000000020E091016BE81DE19DB94FF19DB94FF19DB
      94FF19DB94FF19DB94FF19DB94FF19DA93FF19DA93FF1AD991FF1BD78FFF1CD5
      8DFF1ED38AFF20D087FF3EBC83DD0308060A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002F2E2E30BBA08AE2EAD4C0FFE9D2BEFFE4C9B2FFD2B294FCC3A287F3BF9E
      7DF5C6A183F6CFB093F9DDC0A5FFE2C8AFFFE4C9AFFFE2C5ABFFE2C4A8FFE1C3
      A6FFE0C1A5FFDEBD9FFFD7B08BFFD9B48FFFC39871F9BD9E79E9D6AC86FFD6B0
      8CFF9C8473BB0000000000000000000000000000000000000000000000000000
      0000343535374685AEE6258AC7FF0D79C0FF1B82C0FF3A7DA7E8343535370000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000014233D5C8ECA
      E7FDA1E2F6FFA3E2F7FFA7E3F7FFAAE5F8FFAEE6F9FFB1E8FAFFB5E9FBFFB8EA
      FCFFBCECFDFFBFEDFDFFC5F2FFFF84ADD7FF1147A1FF1149A3FF1148A3FF1047
      A2FF0F46A2FF0E45A1FF0D43A0FF0C429FFF0B409EFF0A3E9DFF083C9CFF0739
      9BFF093898FD020F325B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000523182820C387E219DB94FF19DB
      94FF19DB94FF19DB94FF19DB94FF19DB94FF19DB94FF19DA93FF19DA93FF1AD9
      91FF1BD78FFF37DB98FE103C2A46000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B666272D2B398FBE9D3BEFFE8D2BDFFE8D0BBFFE7D0B9FFE6CF
      B8FFE7CDB6FFE5CBB3FFE5C9B1FFE4C9AFFFE3C7ADFFE2C6ABFFE2C4A9FFE1C3
      A7FFE0C2A6FFE1C4A8FFE0C4A9FFB79674EA69646071605C5966C09D79EED9B5
      94FF9D8471BB0000000000000000000000000000000000000000000000000000
      0101497D9ED84099CEFF0D7AC1FF0D7AC1FF3390C8FF577E95C0000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C18355C76A8
      D0FD97CDE9FF99CDE8FF9BCEE9FF9ECFEAFFA1D0EAFFA3D1EBFFA6D2ECFFA8D3
      ECFFABD4EDFFADD5EEFFB0D7EEFF658CC1FF144CA3FF1650A7FF154FA6FF144E
      A6FF134CA5FF124BA4FF1149A3FF0F46A2FF0E44A0FF0C429FFF0B409EFF093D
      9DFF0B3B99FD020F325B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003120D161E8E63A42ADB
      98FC19DB94FF19DB94FF19DB94FF19DB94FF19DB94FF24DD98FF19DB94FF19DA
      93FF1FDB95FF2B8F67A200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000847B7393D0B197FBE8D2BEFFE8D1BCFFE8CFB9FFE7CF
      B8FFE6CDB6FFE5CCB3FFE5CAB2FFE4C9B0FFE3C8AEFFE2C7ACFFE2C5AAFFE4C7
      ADFFE3C7AFFFC9A88AF49C8573BA1F1F1F200000000000000000706A657ABE94
      6EF39A8371BB0000000000000000000000000000000000000000000000005F6B
      727F4293C2FD0F78BCFF0D7AC1FF1E86C5FF3F89B7F4484B4D51000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020D2C5B163C
      8AFD1C4590FF1D4691FF1F4891FF1F4992FF214A93FF224C94FF234D95FF244F
      96FF265096FF265297FF265297FF1B4E99FF1A57AAFF1A57ABFF1956AAFF1754
      A9FF1651A8FF154FA7FF134CA5FF114AA4FF1047A2FF0E45A1FF0C42A0FF0B40
      9EFF0E3E9BFD0311335B00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000051A
      121E185A416721805C92248C639F24845F951F684B740E38273F15BA7DD819DB
      94FF3ACF95EA03120C1400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006F696577BC997EEAE0C6ADFFE8D1BBFFE7CF
      B9FFE6CEB7FFE6CDB6FFE5CCB3FFE5CBB3FFE5CBB2FFE5CBB3FFDBBCA0FFC1A0
      81F0A18770CA504D4C5300000000000000000000000000000000000000008679
      6F989D8069C7000000000000000000000000000000000000000000000000597D
      92B84093C2FF5895BBFF3B8CBCFF3F98CDFF497D9ED800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020D2644173F
      90EF18469BFE19489CFD1B4A9DFD1C4C9EFD1D4EA0FD1F50A1FD2052A2FD2154
      A3FD2356A4FD2458A5FD265AA7FD285EAAFD295FADFD285EACFD265CAAFD2559
      A9FD2457A8FD2255A8FD2154A7FD1F52A5FD1E50A4FD1D4DA3FD1B4BA2FD1A49
      A1FE194194EF030D264400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F8258972EDF
      9CFF15523B5D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001919191A877B7297AE8F74DCBF9E
      82EECFAA8EFAD8B79AFFD2AF91FFC6A284F6B79A7EE4AA8A6FD67F756D8D2F2E
      2E30000000000000000000000000000000000000000000000000000000000100
      000117171718020202030000000000000000000000000000000000000000617A
      89A44B97C4FF468AB2FF408EBDFF2F84B6FB4F53565B00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000010408050E
      27440814365C0814355B0814365B0816365B0816365B0816365B0916365B0916
      365B0916365B0916365B0917365B0917365B0917365B0916365B0916365B0916
      365B0916365B0916365B0816365B0816365B0816355B0814355B0814355B0814
      355C050E27440001040800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000D432F4E2CA1
      74B6000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000050505062424
      24254442414654514F5845434247343333352222222300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001313
      13143677A0E23C90C2FF488DB6EF62747F920000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000131313144E52555A3B3C3D3F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      FFFFF01F000000000000000000000000FFFFC007000000000000000000000000
      FFFF8003000000000000000000000000FFFF0001000000000000000000000000
      FFFE0000000000000000000000000000FFFE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000001000000000000000000000000
      0000000300000000000000000000000000000003000000000000000000000000
      0000000300000000000000000000000000000003000000000000000000000000
      0000000300000000000000000000000000000003000000000000000000000000
      0000000300000000000000000000000000000003000000000000000000000000
      0000000300000000000000000000000000000003000000000000000000000000
      0000000300000000000000000000000080000003000000000000000000000000
      FFFF0003000000000000000000000000FFFFC007000000000000000000000000
      FFFFFFFF000000000000000000000000C000001FFFFFFFFFFFFFFFFFFFFFFFFF
      8000000FFF00007FFFC0001FC000000380000007F000000FFE00000380000001
      00000007E0000003F8000001C00000030000000780000001F0000000C0000003
      0000000380000001F0000000C00000030000000380000001F0000000C0000003
      0000000380000001F0000000C000000300000003C0000003F8000001C0000003
      00000001E0000007FE000003C000000300000001E0000007FF80000FC0000003
      00000001E0000C07FF80000FC000000300000001E003FC07FF80003FC0000003
      00000000E00FFC07FF80007FC000000300000000E007FC27FF8001FFC0000003
      00000000E003FC67FE0003FFC000000300000000E001FFE7FE0007FFC0000003
      00000000F0018007FE000FFFC0000003E0003000E3FFC007FC001FFFC0000003
      F8037801E03FE007F8007FFFC0000003FC7F1FFFE03FF007F800FFFFC0000003
      FFFF07FFE03FF007FE00FFFFC0000003FFFF03FFE03FC007FC03FFFFC0000003
      FCFE00FFF01F0007FC03FFFFC0000003FE0000FFF0000007F813FFFFC0000003
      FE0000FFF0000007F01FFFFFC0000003FF0001FFF8000007E03FFFFFC0000003
      FF8003FFFC0000C7E03FFFFFC0000003FFE003FFFE0003E7E07FFFFFC0000003
      FFFFC7FFFF000FE3E07FFFFFC0000003FFFFCFFFFFC07FFFE0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFF1FFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionOpenFile
            Caption = '&Abrir Arquivo'
            ImageIndex = 0
            ShortCut = 16463
          end
          item
            Caption = '-'
          end
          item
            Action = ActionOpenLast
            Caption = 'A&brir '#218'ltimo'
            ImageIndex = 3
            ShortCut = 16469
          end
          item
            Caption = '-'
          end
          item
            Action = ActionReloadLog
            Caption = 'A&tualizar Log'
            ImageIndex = 1
            ShortCut = 16500
          end
          item
            Caption = '-'
          end
          item
            Action = ActionClearLog
            Caption = '&Limpar Log'
            ImageIndex = 2
            ShortCut = 16460
          end
          item
            Caption = '-'
          end
          item
            Action = ActionClearCache
            Caption = 'L&impar Cache'
            ImageIndex = 4
          end>
        ActionBar = ActionToolBar
        GlyphLayout = blGlyphTop
      end>
    Images = ImageList
    Left = 153
    Top = 429
    StyleName = 'Platform Default'
    object ActionOpenFile: TAction
      Caption = 'Abrir Arquivo'
      ImageIndex = 0
      ShortCut = 16463
      OnExecute = ActionOpenFileExecute
    end
    object ActionReloadLog: TAction
      Caption = 'Atualizar Log'
      ImageIndex = 1
      ShortCut = 16500
      OnExecute = ActionReloadLogExecute
    end
    object ActionClearLog: TAction
      Caption = 'Limpar Log'
      ImageIndex = 2
      ShortCut = 16460
      OnExecute = ActionClearLogExecute
    end
    object ActionOpenLast: TAction
      Caption = 'Abrir '#218'ltimo'
      ImageIndex = 3
      ShortCut = 16469
      OnExecute = ActionOpenLastExecute
    end
    object ActionClearCache: TAction
      Caption = 'Limpar Cache'
      ImageIndex = 4
      OnExecute = ActionClearCacheExecute
    end
  end
  object LogViewer: TFDLogViewer
    Active = True
    AfterScroll = LogViewerAfterScroll
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    Filter = '(1 = 1)'
    FieldDefs = <
      item
        Name = 'Type'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Database'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'User'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Class'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Method'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SQL'
        DataType = ftString
        Size = 15000
      end
      item
        Name = 'DateTime'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Error'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 41
    Top = 429
  end
  object DataSourceFilter: TDataSource
    DataSet = FDMemTableFilter
    Left = 13
    Top = 402
  end
  object FDMemTableFilter: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 41
    Top = 402
    object FDMemTableFilterLine: TIntegerField
      FieldName = 'Line'
    end
    object FDMemTableFilterType: TStringField
      FieldName = 'Type'
      OnSetText = FDMemTableFilterTypeSetText
      Size = 10
    end
    object FDMemTableFilterDatabase: TStringField
      FieldName = 'Database'
    end
    object FDMemTableFilterUser: TStringField
      FieldName = 'User'
      Size = 50
    end
    object FDMemTableFilterIP: TStringField
      FieldName = 'IP'
    end
    object FDMemTableFilterClass: TStringField
      FieldName = 'Class'
      Size = 100
    end
    object FDMemTableFilterMethod: TStringField
      FieldName = 'Method'
      Size = 100
    end
    object FDMemTableFilterDateTime: TStringField
      FieldName = 'DateTime'
    end
    object FDMemTableFilterError: TStringField
      FieldName = 'Error'
      OnSetText = FDMemTableFilterErrorSetText
      Size = 1
    end
  end
  object SynSQLSyn: TSynSQLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    CommentAttri.Foreground = clGray
    KeyAttri.Foreground = clNavy
    NumberAttri.Foreground = clBlue
    StringAttri.Foreground = 42496
    Left = 69
    Top = 402
  end
end
