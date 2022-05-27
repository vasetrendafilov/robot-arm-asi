VERSION 5.00
Begin VB.Form Form3 
   BackColor       =   &H8000000D&
   Caption         =   "TEST na ROBOT"
   ClientHeight    =   10260
   ClientLeft      =   9120
   ClientTop       =   1860
   ClientWidth     =   10770
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   12
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form3"
   ScaleHeight     =   12990
   ScaleWidth      =   21480
   Begin VB.CommandButton Command7 
      Caption         =   "EXIT"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   7680
      TabIndex        =   52
      Top             =   8700
      Width           =   2535
   End
   Begin VB.TextBox Text8 
      Alignment       =   2  'Center
      BackColor       =   &H80000016&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   7680
      TabIndex        =   51
      Text            =   "Kontura"
      Top             =   240
      Width           =   2535
   End
   Begin VB.ListBox List2 
      BackColor       =   &H80000016&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7620
      ItemData        =   "TEST na ROBOT.frx":0000
      Left            =   7680
      List            =   "TEST na ROBOT.frx":0002
      TabIndex        =   50
      Top             =   840
      Width           =   2535
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   "C:\Documents and Settings\MAKEDON\Desktop\Makedon\Mak 2020.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   495
      Left            =   0
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Fanuc100P"
      Top             =   0
      Visible         =   0   'False
      Width           =   2775
   End
   Begin VB.TextBox Text7 
      Height          =   735
      Index           =   6
      Left            =   0
      TabIndex        =   49
      Text            =   "0"
      Top             =   4920
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox Text7 
      Height          =   735
      Index           =   5
      Left            =   0
      TabIndex        =   48
      Text            =   "0"
      Top             =   4080
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox Text7 
      Height          =   735
      Index           =   4
      Left            =   0
      TabIndex        =   47
      Text            =   "0"
      Top             =   3360
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox Text7 
      Height          =   735
      Index           =   3
      Left            =   0
      TabIndex        =   46
      Text            =   "0"
      Top             =   2640
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox Text7 
      Height          =   735
      Index           =   2
      Left            =   0
      TabIndex        =   45
      Text            =   "0"
      Top             =   1920
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox Text7 
      Height          =   735
      Index           =   1
      Left            =   0
      TabIndex        =   44
      Text            =   "0"
      Top             =   1200
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox Text7 
      Height          =   735
      Index           =   0
      Left            =   0
      TabIndex        =   43
      Text            =   "0"
      Top             =   480
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.ListBox List1 
      Height          =   3195
      Left            =   0
      Sorted          =   -1  'True
      TabIndex        =   29
      Top             =   6360
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Frame Frame3 
      Height          =   3315
      Left            =   600
      TabIndex        =   15
      Top             =   6600
      Width           =   6855
      Begin VB.CommandButton Command4 
         BackColor       =   &H80000016&
         Caption         =   "STOP"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   800
         Left            =   3600
         Style           =   1  'Graphical
         TabIndex        =   21
         Top             =   960
         Width           =   3015
      End
      Begin VB.CommandButton Command3 
         BackColor       =   &H80000016&
         Caption         =   "START"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   800
         Left            =   200
         Style           =   1  'Graphical
         TabIndex        =   20
         Top             =   960
         Width           =   3255
      End
      Begin VB.TextBox Text2 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   20.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   4680
         TabIndex        =   19
         Text            =   "Steps"
         Top             =   1920
         Width           =   1935
      End
      Begin VB.TextBox Text4 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   20.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   540
         Index           =   2
         Left            =   4680
         TabIndex        =   18
         Text            =   "Z"
         Top             =   2640
         Width           =   1935
      End
      Begin VB.TextBox Text4 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   20.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   540
         Index           =   1
         Left            =   2520
         TabIndex        =   17
         Text            =   "Y"
         Top             =   2640
         Width           =   1935
      End
      Begin VB.TextBox Text4 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   20.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Index           =   0
         Left            =   200
         TabIndex        =   16
         Text            =   "X"
         Top             =   2640
         Width           =   1935
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Linija"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   20.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   200
         TabIndex        =   23
         Top             =   1920
         Width           =   4215
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Proba 001"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   20.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   195
         TabIndex        =   22
         Top             =   240
         Width           =   6400
      End
   End
   Begin VB.Frame Frame2 
      Height          =   4935
      Left            =   600
      TabIndex        =   1
      Top             =   1440
      Width           =   6855
      Begin VB.TextBox Text5 
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   550
         Index           =   5
         Left            =   0
         TabIndex        =   40
         Text            =   "Oska 6"
         Top             =   0
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox Text5 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   550
         Index           =   6
         Left            =   4680
         TabIndex        =   39
         Text            =   "Oska 6"
         Top             =   4200
         Width           =   1935
      End
      Begin VB.TextBox Text5 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   550
         Index           =   4
         Left            =   2400
         TabIndex        =   38
         Text            =   "Oska 5"
         Top             =   4200
         Width           =   2055
      End
      Begin VB.TextBox Text5 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   550
         Index           =   3
         Left            =   240
         TabIndex        =   37
         Text            =   "Oska 4"
         Top             =   4200
         Width           =   1935
      End
      Begin VB.TextBox Text5 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   550
         Index           =   2
         Left            =   4680
         TabIndex        =   36
         Text            =   "Oska 3"
         Top             =   3600
         Width           =   1935
      End
      Begin VB.TextBox Text5 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   550
         Index           =   1
         Left            =   2400
         TabIndex        =   35
         Text            =   "Oska 2"
         Top             =   3600
         Width           =   2055
      End
      Begin VB.TextBox Text5 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   550
         Index           =   0
         Left            =   240
         TabIndex        =   34
         Text            =   "Oska 1"
         Top             =   3600
         Width           =   1935
      End
      Begin VB.CommandButton Command5 
         BackColor       =   &H80000016&
         Caption         =   "Set"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   20.25
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1215
         Left            =   5325
         Style           =   1  'Graphical
         TabIndex        =   33
         Top             =   360
         Width           =   1275
      End
      Begin VB.CommandButton Get 
         BackColor       =   &H80000016&
         Caption         =   "Get"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   20.25
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1095
         Left            =   5325
         Style           =   1  'Graphical
         TabIndex        =   31
         ToolTipText     =   "Decelerate"
         Top             =   1570
         Width           =   1275
      End
      Begin VB.CommandButton Command1 
         BackColor       =   &H80000016&
         Caption         =   "STOP"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   15.75
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1095
         Left            =   200
         Style           =   1  'Graphical
         TabIndex        =   30
         Top             =   1570
         Width           =   1335
      End
      Begin VB.CommandButton CommandStart 
         BackColor       =   &H80000016&
         Caption         =   "START"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   15.75
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1215
         Left            =   200
         Style           =   1  'Graphical
         TabIndex        =   27
         Top             =   360
         Width           =   1335
      End
      Begin VB.TextBox TextDist 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   15.75
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   510
         Left            =   2955
         TabIndex        =   24
         Text            =   "2000"
         Top             =   360
         Width           =   1335
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   26.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   2955
         TabIndex        =   13
         Text            =   "1"
         Top             =   2760
         Width           =   1335
      End
      Begin VB.CommandButton Command2 
         BackColor       =   &H80000016&
         Caption         =   "Oska -"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   21.75
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   720
         Index           =   0
         Left            =   4320
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   2760
         Width           =   2295
      End
      Begin VB.CommandButton Command2 
         BackColor       =   &H80000016&
         Caption         =   "Oska +"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   21.75
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   720
         Index           =   1
         Left            =   200
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   2760
         Width           =   2655
      End
      Begin VB.TextBox TextTacc 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   15.75
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   510
         Left            =   2955
         TabIndex        =   4
         Text            =   "0.5"
         Top             =   2160
         Width           =   1335
      End
      Begin VB.TextBox TextMaxVel 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   15.75
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   510
         Left            =   2950
         TabIndex        =   3
         Text            =   "1000"
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox TextStrVel 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   15.75
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   510
         Left            =   2955
         TabIndex        =   2
         Text            =   "800"
         Top             =   960
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Rastojanie   "
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   1700
         TabIndex        =   26
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label Label5 
         Caption         =   "pulses"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Index           =   0
         Left            =   4400
         TabIndex        =   25
         Top             =   360
         Width           =   975
      End
      Begin VB.Label Label6 
         Caption         =   "Oska"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1485
         TabIndex        =   14
         Top             =   2880
         Width           =   1455
      End
      Begin VB.Label Label5 
         Caption         =   "sec"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Index           =   3
         Left            =   4400
         TabIndex        =   10
         Top             =   2280
         Width           =   615
      End
      Begin VB.Label Label5 
         Caption         =   "pul/sec"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Index           =   2
         Left            =   4400
         TabIndex        =   9
         Top             =   1680
         Width           =   1215
      End
      Begin VB.Label Label5 
         Caption         =   "pul/sec"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Index           =   1
         Left            =   4400
         TabIndex        =   8
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label Label4 
         Caption         =   "Zabr-Uspo"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   1700
         TabIndex        =   7
         Top             =   2280
         Width           =   1455
      End
      Begin VB.Label Label3 
         Caption         =   "MaxBrzina"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   1700
         TabIndex        =   6
         Top             =   1680
         Width           =   1455
      End
      Begin VB.Label Label2 
         Caption         =   "StartBrzina"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1700
         TabIndex        =   5
         Top             =   1080
         Width           =   1455
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1215
      Left            =   600
      TabIndex        =   0
      Top             =   240
      Width           =   6855
      Begin VB.TextBox Text6 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000016&
         Height          =   420
         Left            =   2880
         TabIndex        =   42
         Text            =   "Numb.of Cards"
         Top             =   240
         Width           =   1530
      End
      Begin VB.TextBox Text3 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000016&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   480
         Left            =   2880
         TabIndex        =   41
         Text            =   "0"
         ToolTipText     =   "Broj na Motion Card"
         Top             =   620
         Width           =   1530
      End
      Begin VB.CommandButton Command6 
         BackColor       =   &H80000016&
         Caption         =   "Stand"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   20.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   1
         Left            =   200
         Style           =   1  'Graphical
         TabIndex        =   32
         Top             =   240
         Width           =   2655
      End
      Begin VB.CommandButton Command6 
         BackColor       =   &H80000016&
         Caption         =   "Home"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   20.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   0
         Left            =   4440
         Style           =   1  'Graphical
         TabIndex        =   28
         Top             =   240
         Width           =   2175
      End
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim StrVel As Long, MaxVel As Long, Tacc As Double, Tdec, Time As Double
Dim oska, h, i, j As Integer
Dim Dist(6), DistR(6) As Long
Dim Bafer, KeepRun As Boolean
Dim MCard As Byte
Dim T(3), U(3), V(3), Vagol(10) As Double

Private Sub Command7_Click()
End
End Sub

Private Sub Form_Load()
MCard = d5400_board_init: Text3 = MCard
End Sub

Private Sub Command6_Click(Index As Integer) '---------------------------------------Home/Stand-----------------------------------------------------
On Error GoTo ErrorHandler
List1.Clear
If Index = 0 Then   '---------------------------------------Home
'For h = 0 To 6
'Dist(h) = Val(Text7(h))
'Text5(h) = Dist(h)
Dist(0) = 0: Dist(1) = -18323: Dist(2) = 4623:
Dist(3) = 0: Dist(4) = 41733: Dist(5) = 0: Dist(6) = -54420:
'Next h
ElseIf Index = 1 Then  '---------------------------------------Stand
Dist(0) = 0: Dist(1) = -10125: Dist(2) = -7500:
Dist(3) = 0: Dist(4) = 41733: Dist(5) = 0: Dist(6) = -54420:
For h = 0 To 6: Text5(h) = Dist(h): Next h
End If
For h = 0 To 6
oska = h
DistR(h) = d5400_get_position(oska)
List1.AddItem Format(Abs(Dist(h) - DistR(h)), "00000000")
Next h
Time = List1.List(5) / Val(TextMaxVel)
For h = 0 To 6
If Time > 0 Then Vagol(h) = Int(Abs(Dist(h) - DistR(h)) / Time)
Next h
If MCard = 2 Then
For h = 0 To 6
oska = h
d5400_set_profile oska, Vagol(h) - 1, Vagol(h), 0, 0
d5400_t_pmove oska, Dist(h), 1
Next h
End If
Exit Sub
ErrorHandler: MsgBox "Greska vo komandata Home/Stand " & Err.Number & vbCrLf, vbInformation, "VNIMANIE"
Resume Next
End Sub

Private Sub Command5_Click()
Command6(0).Enabled = True: Command6(1).Enabled = True: CommandStart.Enabled = True:
If MsgBox("Dali sakate da gi vnesete podatocite za STAND pozicija", vbYesNo, "VNIMANIE") = vbYes Then
d5400_set_position 0, 0:          d5400_set_encoder 0, 0:              Text5(0) = 0
d5400_set_position 1, -18323:     d5400_set_encoder 1, -18323:         Text5(1) = -18323:
d5400_set_position 2, 4623:     d5400_set_encoder 2, 4623:             Text5(2) = 4623:
d5400_set_position 3, 0:          d5400_set_encoder 3, 0:              Text5(3) = 0
d5400_set_position 4, 41733:      d5400_set_encoder 4, 41733:          Text5(4) = 41733
d5400_set_position 6, -54420:     d5400_set_encoder 6, -54420:         Text5(6) = -54420
End If
End Sub

Private Sub Command2_Click(Index As Integer)
If Index = 0 Then Text1 = Val(Text1) - 1
If Index = 1 Then Text1 = Val(Text1) + 1
If Text1 < 1 Then Text1 = 1
If Text1 > 6 Then Text1 = 6
End Sub

Private Sub Command1_Click()
oska = Val(Text1.Text) - 1
If Text1.Text = 6 Then oska = Val(Text1.Text) 'bidejki kartickata za oska 6 e rasipana
For oska = 0 To 6
d5400_imd_stop oska
Next oska
End Sub

Private Sub CommandStart_Click()
If MCard = 2 Then
oska = Val(Text1.Text) - 1
If Text1.Text = 6 Then oska = Val(Text1.Text)
Dist(0) = Val(TextDist.Text)
StrVel = Val(TextStrVel.Text)
MaxVel = Val(TextMaxVel.Text)
Tacc = Tdec = Val(TextTacc.Text)
d5400_set_profile oska, StrVel, MaxVel, Tacc, Tdec  'Set T-curve velocity
d5400_t_pmove oska, Dist(0), 0    'Single axis T-curve position move(symmetrical T-curve acceleration and deceleration)
End If
End Sub

Private Sub Get_Click()
If MsgBox("Dali sakate da vnesete podatoci za HOME pozicija ?", vbYesNo, "VNIMANIE") = vbYes Then
For oska = 0 To 6
Text5(oska) = d5400_get_position(oska)
Text7(oska) = Text5(oska)
Next oska
End If
End Sub

Private Sub TextDist_Click()
If Left(TextDist, 1) = "-" Then
TextDist = Right(TextDist, Len(TextDist) - 1)
ElseIf Left(TextDist, 1) <> "-" Then
TextDist = "-" & TextDist
End If
End Sub

Private Sub Command3_Click()
Data1.Recordset.MoveFirst: j = 0:
For i = 0 To Data1.Recordset.RecordCount - 1
If Data1.Recordset("Ime") = Label7.Caption Then j = 1: Exit For
Data1.Recordset.MoveNext
Next i
If j = 0 Then MsgBox "Ovaa Linija ne e vnesena vo bazata na podatoci na Robotot", vbInformation, "VNIMANIE":  Exit Sub
KeepRun = True: Bafer = True: i = 0
Data1.Recordset.MoveFirst
Call Dowhile
End Sub

Private Sub Dowhile()
'----------------------------------------------------------Do While  Start---------------------------------------------------------------------------
On Error GoTo ErrorHandler
Do While KeepRun
If Data1.Recordset("Ime") = Label7.Caption Then
i = i + 1: Text2 = i
T(3) = Data1.Recordset("T(3)"): Text4(0) = Format(T(3), "0.000")
U(3) = Data1.Recordset("U(3)"): Text4(1) = Format(U(3), "0.000")
V(3) = Data1.Recordset("V(3)"): Text4(2) = Format(V(3), "0.000")
Label8 = Data1.Recordset("Lin") & " " & Data1.Recordset("BrLin")
'--------------------------------------------Agolni Brzini na zglobovite vo pulses/sec------------------------------
'Form1.Data1.Recordset("Vagol3") e vo pulsees/sec
Vagol(1) = Data1.Recordset("Vagol1")
Vagol(2) = Data1.Recordset("Vagol2")
Vagol(3) = Data1.Recordset("Vagol3")
Vagol(4) = Data1.Recordset("Vagol4")
Vagol(5) = Data1.Recordset("Vagol5")
Vagol(6) = Data1.Recordset("Vagol6")
'----------------------------------------------------Cekor na oskite vo pulses--------------------------------------
Dist(1) = Data1.Recordset("T1") 'Oska1-Absolutna pozicija vo pulses
Dist(2) = Data1.Recordset("T2") 'Oska2--Absolutna pozicija vo pulses
Dist(3) = Data1.Recordset("T3") 'Oska3--Absolutna pozicija vo pulses
Dist(4) = Data1.Recordset("T4")  'Oska4-Absolutna pozicija vo pulses
Dist(5) = Data1.Recordset("T5")  'Oska5--Absolutna pozicija vo pulses
Dist(6) = Data1.Recordset("T6")  'Oska6--Absolutna pozicija vo pulses
'-----------------------------------------------DMC d5400-ON--------------------------------------------------------
If MCard = 2 Then
For h = 0 To 5
oska = h
If h = 5 Then oska = 6
'd5400_variety_speed_range oska, 1, Vagol(h + 1)
'd5400_change_speed oska, Vagol(h + 1)
d5400_set_profile oska, Vagol(h + 1) - 1, Vagol(h + 1), 0, 0
d5400_t_pmove oska, Dist(h + 1), 1
Next h
Do While Bafer
If d5400_check_done(0) = 1 And d5400_check_done(1) = 1 And d5400_check_done(2) = 1 _
And d5400_check_done(3) = 1 And d5400_check_done(4) = 1 And d5400_check_done(6) = 1 Then Exit Do
DoEvents
Loop
End If
End If
Data1.Recordset.MoveNext
If Data1.Recordset.EOF Then KeepRun = False
DoEvents
Loop
Exit Sub
ErrorHandler: MsgBox "Greska vo komandata DoWhile", vbInformation, "VNIMANIE"
Resume Next
End Sub

Private Sub Command4_Click()
KeepRun = False: Bafer = False
For oska = 0 To 6
d5400_decel_stop oska, Tdec
Next oska
End Sub

Private Sub Text8_Click()
Call Programi
End Sub

Private Sub Programi() '-------------------Gi vnesuva programite vo lista1--------------------------------------
'Timer2.Enabled = False: Command7(0).Enabled = True
'List1.Visible = True: List1.Left = 11160: List1.Top = 600
Data1.Recordset.MoveFirst:
'Picture1.Cls:  Call Grafik
For i = 1 To Data1.Recordset.RecordCount - 1
List2.AddItem Data1.Recordset("Ime")
Data1.Recordset.MoveNext
Next i
For i = 0 To List2.ListCount - 1
For j = i + 1 To List2.ListCount
If List2.List(i) = List2.List(j) Then
List2.RemoveItem (j)
j = j - 1
End If
Next j
Next i
End Sub

Private Sub List2_Click() '-----------------------------------------------------------Bira kontura--------------------------------------
'Text9 = "Approach of Robot": Command5(0).Enabled = False
'Picture15.Visible = False:
Label7 = List2.Text:
'Label2.Visible = False: Label3.Visible = True:
'Frame3.Visible = False: Frame6.Visible = True: Command7(1).Caption = "S T O P":
'Picture5.Enabled = True: Timer2.Enabled = False:
''Label2.Caption = List1.Text: Form2.A(0) = List1.Text: Label10 = "Lin, Circle, Point, DKin"
'Label3.Caption = Label2.Caption: Form3.Label7.Caption = List1.Text:
'Form2.Tabela.TextMatrix(1, 0) = List1.Text: Text2 = 0: Text3 = 0: Text7 = 0: Text8 = 0: Text10 = 0
'Label13.Caption = List1.Text
'Text19(0) = 0: Text19(1) = 0: Text19(2) = 0: Text20 = 0: Text23 = 0: Text21(0) = 0:
'For i = 0 To 9: Command4(i).BackColor = &H8000000A: Next i
'Call Form2.Tabela1
'List1.Visible = False: cekorB = 0: Step = 0
'Call Grafik





End Sub
