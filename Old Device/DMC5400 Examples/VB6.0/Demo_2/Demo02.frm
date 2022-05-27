VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Linearna Interpolacija"
   ClientHeight    =   3540
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5385
   LinkTopic       =   "Form1"
   ScaleHeight     =   3540
   ScaleWidth      =   5385
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox TextC1 
      Height          =   270
      Left            =   1440
      TabIndex        =   10
      Text            =   "1000"
      Top             =   240
      Width           =   855
   End
   Begin VB.TextBox TextC2 
      Height          =   270
      Left            =   1440
      TabIndex        =   9
      Text            =   "2000"
      Top             =   720
      Width           =   855
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   4560
      Top             =   960
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
      Left            =   3960
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1560
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
      Left            =   3960
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   240
      Width           =   1215
   End
   Begin VB.TextBox TextTacc 
      Height          =   270
      Left            =   1440
      TabIndex        =   2
      Text            =   "0.1"
      Top             =   2160
      Width           =   855
   End
   Begin VB.TextBox TextMaxVel 
      Height          =   270
      Left            =   1440
      TabIndex        =   1
      Text            =   "1000"
      Top             =   1680
      Width           =   855
   End
   Begin VB.TextBox TextStrVel 
      Height          =   270
      Left            =   1440
      TabIndex        =   0
      Text            =   "100"
      Top             =   1200
      Width           =   855
   End
   Begin VB.Label Label6 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label6"
      Height          =   255
      Index           =   1
      Left            =   3480
      TabIndex        =   20
      Top             =   3000
      Width           =   1695
   End
   Begin VB.Label Label6 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label6"
      Height          =   255
      Index           =   0
      Left            =   3480
      TabIndex        =   19
      Top             =   2640
      Width           =   1695
   End
   Begin VB.Label LabelPos 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Internal position Oska2"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   18
      Top             =   3000
      Width           =   3135
   End
   Begin VB.Label Label5 
      Caption         =   "pulses"
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
      Index           =   5
      Left            =   2400
      TabIndex        =   17
      Top             =   720
      Width           =   855
   End
   Begin VB.Label Label5 
      Caption         =   "pulses"
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
      Index           =   4
      Left            =   2400
      TabIndex        =   16
      Top             =   240
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
      TabIndex        =   15
      Top             =   1200
      Width           =   975
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
      TabIndex        =   14
      Top             =   1680
      Width           =   975
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
      TabIndex        =   13
      Top             =   2160
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "Dist 1"
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
      Left            =   240
      TabIndex        =   12
      Top             =   240
      Width           =   1095
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      Caption         =   "Dist 2"
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
      Index           =   0
      Left            =   240
      TabIndex        =   11
      Top             =   720
      Width           =   1095
   End
   Begin VB.Label LabelPos 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Internal position Oska1"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   8
      Top             =   2640
      Width           =   3135
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
      Left            =   360
      TabIndex        =   7
      Top             =   2160
      Width           =   975
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
      Left            =   360
      TabIndex        =   6
      Top             =   1680
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
      Left            =   360
      TabIndex        =   5
      Top             =   1200
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim Dist1 As Long, Dist2 As Long, StrVel As Long, MaxVel As Long, Tacc As Double, Tdec As Double    '定义各个变量

Private Sub Form_Load()
If d5400_board_init < 1 Then MsgBox "No DMC5400 card was found"
End Sub

Private Sub Form_Unload(Cancel As Integer)
d5400_board_close
End
End Sub

Private Sub CommandStart_Click()
Dist1 = Val(TextC1.Text)
Dist2 = Val(TextC2.Text)
StrVel = Val(TextStrVel.Text)
MaxVel = Val(TextMaxVel.Text)
Tacc = Tdec = Val(TextTacc.Text)
d5400_set_vector_profile StrVel, MaxVel, Tacc, Tdec
d5400_t_line2 0, Dist1, 1, Dist2, 0
End Sub

Private Sub CommandStop_Click()
d5400_decel_stop 0, Tdec
d5400_decel_stop 1, Tdec
End Sub

Private Sub Timer1_Timer()
LabelPos(0).Caption = "Internal position Oska1= " & d5400_get_position(0)
LabelPos(1).Caption = "Internal position Oska2= " & d5400_get_position(1)
Label6(0).Caption = "Deviation = " & d5400_get_postion_deviation(0)
Label6(1).Caption = "Deviation = " & d5400_get_postion_deviation(1)
End Sub
