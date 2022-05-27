VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Status I/O"
   ClientHeight    =   1980
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4185
   LinkTopic       =   "Form1"
   ScaleHeight     =   1980
   ScaleWidth      =   4185
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   480
      Top             =   1080
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
      Height          =   615
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   960
      Width           =   1575
   End
   Begin VB.Label LabelIO 
      Caption         =   "Status I/O"
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   360
      Width           =   3375
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
If d5400_board_init < 1 Then MsgBox "No DMC5400 card was found"         'Nema DMC5400 kartica
End Sub

Private Sub Form_Unload(Cancel As Integer)
d5400_board_close
End
End Sub

Private Sub CommandStart_Click()
If d5400_read_outbit(1) = 0 Then                                   'Get the status of output pin
  d5400_write_outbit 1, 1                                          'Set the status of output pin
Else
  d5400_write_outbit 1, 0                                          'Set the status of output pin
End If
End Sub


Private Sub Timer1_Timer()
LabelIO.Caption = "Staus input= " & d5400_read_inbit(3)                                    'Get the status of input pin
LabelIO.Caption = LabelIO.Caption & "         Status output= " & d5400_read_outbit(1)      'Get the status of output pin
End Sub
