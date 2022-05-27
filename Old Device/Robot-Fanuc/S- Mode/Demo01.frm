VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Single axis T-curve position move"
   ClientHeight    =   4020
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4755
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   4020
   ScaleWidth      =   4755
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      BackColor       =   &H8000000D&
      Height          =   3735
      Left            =   3240
      ScaleHeight     =   3675
      ScaleWidth      =   1275
      TabIndex        =   19
      Top             =   120
      Width           =   1335
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
         Height          =   495
         Left            =   120
         TabIndex        =   23
         Top             =   120
         Width           =   1095
      End
      Begin VB.CommandButton CommandStop 
         BackColor       =   &H008080FF&
         Caption         =   "STOP"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   22
         Top             =   1080
         Width           =   1095
      End
      Begin VB.CommandButton Command1 
         Caption         =   "END"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   15.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   21
         Top             =   3120
         Width           =   1095
      End
      Begin VB.CommandButton Command2 
         Caption         =   "RESET"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   20
         Top             =   2040
         Width           =   1095
      End
   End
   Begin VB.TextBox A 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   5
      Left            =   2160
      TabIndex        =   18
      Text            =   "6000"
      Top             =   3480
      Width           =   975
   End
   Begin VB.TextBox A 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   4
      Left            =   1200
      TabIndex        =   17
      Text            =   "5000"
      Top             =   3480
      Width           =   975
   End
   Begin VB.TextBox A 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   240
      TabIndex        =   16
      Text            =   "4000"
      Top             =   3480
      Width           =   975
   End
   Begin VB.TextBox A 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   2160
      TabIndex        =   15
      Text            =   "3000"
      Top             =   3120
      Width           =   975
   End
   Begin VB.TextBox A 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   1200
      TabIndex        =   14
      Text            =   "2000"
      Top             =   3120
      Width           =   975
   End
   Begin VB.TextBox A 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   240
      TabIndex        =   13
      Text            =   "1000"
      Top             =   3120
      Width           =   975
   End
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   0
      Top             =   0
   End
   Begin VB.TextBox Text2 
      Alignment       =   2  'Center
      Height          =   375
      Left            =   1320
      TabIndex        =   10
      Text            =   "0"
      Top             =   2160
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Height          =   375
      Left            =   1320
      TabIndex        =   9
      Text            =   "0"
      Top             =   1680
      Width           =   975
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
      Left            =   1440
      TabIndex        =   2
      Text            =   "0.1"
      Top             =   1200
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
      TabIndex        =   1
      Text            =   "10000"
      Top             =   720
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
      TabIndex        =   0
      Text            =   "100"
      Top             =   240
      Width           =   855
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "Encoder"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   12
      Top             =   2160
      Width           =   1095
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "Position"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   11
      Top             =   1680
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
      Left            =   2400
      TabIndex        =   8
      Top             =   1200
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
      TabIndex        =   7
      Top             =   720
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
      TabIndex        =   6
      Top             =   240
      Width           =   615
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
      Left            =   240
      TabIndex        =   5
      Top             =   1200
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
      TabIndex        =   4
      Top             =   720
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
      TabIndex        =   3
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
Dim Dist1(), Dist2(), Dist3(), Dist4(), Dist5(), Dist6() As Long
Dim Running As Boolean

Private Sub Command1_Click()
End
End Sub

Private Sub Command2_Click()
d5400_set_encoder 0, 0
d5400_set_position 0, 0
End Sub

Private Sub Form_Load()
If d5400_board_init < 1 Then MsgBox "No DMC5400 card was found"
End Sub

Private Sub Form_Unload(Cancel As Integer)
d5400_board_close
End
End Sub

Private Sub CommandStart_Click()
Running = True
Dist1() = Array(A(0), A(1), A(2), A(3), A(4), A(5), A(6))
Dist2() = Array(100, 200, 300, 400, 500, 600)
Dist3() = Array(100, 200, 300, 400, 500, 600)
Dist4() = Array(100, 200, 300, 400, 500, 600)
'Dist5() = Array(100, 200, 300, 400, 500)
'Dist6() = Array(100, 200, 300, 400, 500)
StrVel = Val(TextStrVel.Text)
MaxVel = Val(TextMaxVel.Text)
Tacc = Tedc = Val(TextTacc.Text)
'd5400_set_vector_profile StrVel, MaxVel, Tacc, Tdec
d5400_set_profile 0, StrVel, MaxVel, Tacc, Tdec  'Set T-curve velocity

For i = 0 To 5
'Do
'If (d5400_prebuff_status(0) = 0) And (d5400_prebuff_status(1) = 0) And (d5400_prebuff_status(2) = 0) _
'And (d5400_prebuff_status(3) = 0) Then ' And (d5400_prebuff_status(4) = 0) And (d5400_prebuff_status(6) = 0) Then
'Exit Do
'End If
'If Running = False Then Exit Do
'DoEvents
'Loop
'd5400_t_line4 0, Dist1(i), Dist2(i), Dist3(i), Dist4(i), 0
'd5400_t_line2 4, Dist5(i), 6, Dist6(i), 0
d5400_t_pmove 0, Dist1(i), 0
Next
End Sub

Private Sub CommandStop_Click()
Running = False
d5400_decel_stop 0, Tdec
End Sub


Private Sub Timer1_Timer()
Text1 = d5400_get_position(0)
Text2 = d5400_get_encoder(0) * 4
End Sub
