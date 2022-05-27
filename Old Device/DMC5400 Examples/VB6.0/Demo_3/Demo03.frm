VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Home mode"
   ClientHeight    =   3120
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4695
   LinkTopic       =   "Form1"
   ScaleHeight     =   3120
   ScaleWidth      =   4695
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Caption         =   "Home mode"
      Height          =   735
      Left            =   240
      TabIndex        =   9
      Top             =   1560
      Width           =   2295
      Begin VB.OptionButton Option2 
         Caption         =   "High"
         Height          =   255
         Left            =   1200
         TabIndex        =   11
         Top             =   360
         Width           =   855
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Low"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   360
         Value           =   -1  'True
         Width           =   975
      End
   End
   Begin VB.TextBox TextMaxVel 
      Height          =   270
      Left            =   1440
      TabIndex        =   8
      Text            =   "2000"
      Top             =   720
      Width           =   855
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   3960
      Top             =   2160
   End
   Begin VB.CommandButton CommandStop 
      BackColor       =   &H008080FF&
      Caption         =   "STOP"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   1320
      Width           =   1215
   End
   Begin VB.CommandButton CommandStart 
      BackColor       =   &H0000FF00&
      Caption         =   "START"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   240
      Width           =   1215
   End
   Begin VB.TextBox TextTacc 
      Height          =   270
      Left            =   1440
      TabIndex        =   1
      Text            =   "0.1"
      Top             =   1200
      Width           =   855
   End
   Begin VB.TextBox TextStrVel 
      Height          =   270
      Left            =   1440
      TabIndex        =   0
      Text            =   "100"
      Top             =   240
      Width           =   855
   End
   Begin VB.Label Label5 
      Caption         =   "sec"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   3
      Left            =   2400
      TabIndex        =   14
      Top             =   1200
      Width           =   615
   End
   Begin VB.Label Label5 
      Caption         =   "pul/sec"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   2400
      TabIndex        =   13
      Top             =   720
      Width           =   735
   End
   Begin VB.Label Label5 
      Caption         =   "pul/sec"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   2400
      TabIndex        =   12
      Top             =   240
      Width           =   615
   End
   Begin VB.Label LabelPos 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Get current internal position"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   2640
      Width           =   4215
   End
   Begin VB.Label Label4 
      Caption         =   "Zabrz-Uspor"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   360
      TabIndex        =   6
      Top             =   1200
      Width           =   1095
   End
   Begin VB.Label Label3 
      Caption         =   "MaxBrzina"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   480
      TabIndex        =   5
      Top             =   720
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "StartBrzina"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   480
      TabIndex        =   4
      Top             =   240
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim StrVel As Long, MaxVel As Long, Tacc As Double, Tdec As Double

Private Sub Form_Load()
If d5400_board_init < 1 Then MsgBox "No DMC5400 card was found"
End Sub

Private Sub Form_Unload(Cancel As Integer)
d5400_board_close
End
End Sub

Private Sub CommandStart_Click()
StrVel = Val(TextStrVel.Text)
MaxVel = Abs(TextMaxVel.Text)
Tacc = Tdec = Val(TextTacc.Text)
d5400_set_profile 0, StrVel, MaxVel, Tacc, Tdec   'Set S-curve velosety

If Option1.Value = True Then              'positive direction, low speed
  d5400_config_home_mode 0, 0, 0          'Configure home mode
  d5400_home_move 0, 1, 0                 'Staart a home return move
Else                                      'negative direction, high speed
  d5400_config_home_mode 0, 0, 0          'Configure home mode
  d5400_home_move 0, 2, 1                 'Start a home return move
End If
End Sub

Private Sub CommandStop_Click()
d5400_decel_stop 0, Tdec
d5400_decel_stop 1, Tdec
End Sub

Private Sub Timer1_Timer()
LabelPos.Caption = "Status I/O = " & d5400_axis_io_status(0)
LabelPos.Caption = LabelPos.Caption & "   Current internal position= " & d5400_get_position(0)
End Sub
