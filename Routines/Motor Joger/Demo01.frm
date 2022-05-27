VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Single axis T-curve position move"
   ClientHeight    =   4245
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4470
   LinkTopic       =   "Form1"
   ScaleHeight     =   4245
   ScaleWidth      =   4470
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   360
      TabIndex        =   16
      Text            =   "Text2"
      Top             =   3120
      Width           =   3375
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3000
      TabIndex        =   14
      Text            =   "6"
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   3960
      Top             =   2640
   End
   Begin VB.CommandButton CommandStart 
      BackColor       =   &H0000FF00&
      Caption         =   "START"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   360
      Width           =   1095
   End
   Begin VB.TextBox TextTacc 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   1320
      TabIndex        =   3
      Text            =   "0.1"
      Top             =   2160
      Width           =   855
   End
   Begin VB.TextBox TextMaxVel 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   1320
      TabIndex        =   2
      Text            =   "1000"
      Top             =   1560
      Width           =   855
   End
   Begin VB.TextBox TextStrVel 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   1320
      TabIndex        =   1
      Text            =   "100"
      Top             =   960
      Width           =   855
   End
   Begin VB.TextBox TextDist 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   1320
      TabIndex        =   0
      Text            =   "2000"
      Top             =   360
      Width           =   855
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "Oska"
      Height          =   255
      Left            =   3000
      TabIndex        =   15
      Top             =   1800
      Width           =   1095
   End
   Begin VB.Label Label5 
      Caption         =   "sec"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   3
      Left            =   2280
      TabIndex        =   13
      Top             =   2160
      Width           =   615
   End
   Begin VB.Label Label5 
      Caption         =   "pul/sec"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   2280
      TabIndex        =   12
      Top             =   1560
      Width           =   615
   End
   Begin VB.Label Label5 
      Caption         =   "pul/sec"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   2280
      TabIndex        =   11
      Top             =   960
      Width           =   615
   End
   Begin VB.Label Label5 
      Caption         =   "pulses"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   2280
      TabIndex        =   10
      Top             =   360
      Width           =   495
   End
   Begin VB.Label LabelPos 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Get current internal position"
      Height          =   255
      Left            =   360
      TabIndex        =   9
      Top             =   2760
      Width           =   3375
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
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
      Left            =   120
      TabIndex        =   8
      Top             =   2160
      Width           =   1095
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
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
      Left            =   240
      TabIndex        =   7
      Top             =   1560
      Width           =   975
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
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
      Left            =   240
      TabIndex        =   6
      Top             =   960
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "Rastojanie"
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
      Left            =   240
      TabIndex        =   5
      Top             =   360
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim oska As Integer
Dim Dist As Long, StrVel As Long, MaxVel As Long, Tacc As Double, Tdec As Double

Private Sub Form_Load()
Dim temp As Integer
temp = d5400_board_init
If temp < 1 Then MsgBox "No DMC5400 card was found"
Text2 = temp
End Sub

Private Sub Form_Unload(Cancel As Integer)
d5400_board_close
End
End Sub

Private Sub CommandStart_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
oska = Val(Text1)
Dist = Val(TextDist.Text)
StrVel = Val(TextStrVel.Text)
MaxVel = Val(TextMaxVel.Text)
Tacc = Tedc = Val(TextTacc.Text)
d5400_set_profile oska, StrVel, MaxVel, Tacc, Tdec  'Set T-curve velocity
d5400_t_pmove oska, Dist, 0    'Single axis T-curve position move(symmetrical T-curve acceleration and deceleration)
CommandStart.Caption = "STOP"
CommandStart.BackColor = vbRed
End Sub

Private Sub CommandStart_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
d5400_decel_stop oska, Tdec
CommandStart.Caption = "START"
CommandStart.BackColor = vbGreen
End Sub

Private Sub Timer1_Timer()
LabelPos.Caption = "Current position= " & d5400_get_position(oska)           'Get current internal position
End Sub
