Option Strict Off
Option Explicit On
Friend Class Form1
	Inherits System.Windows.Forms.Form
	
	
	Dim StrVel, Dist, MaxVel As Integer
	Dim Tacc, Tdec As Double
	
	Private Sub Form1_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
        'If d5400_board_init < 1 Then MsgBox("No DMC5400 card was found")
	End Sub
	
	Private Sub Form1_FormClosed(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
		d5400_board_close()
		End
	End Sub
	
	Private Sub CommandStart_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles CommandStart.Click
		Dim Tedc As Object
		Dist = Val(TextDist.Text)
		StrVel = Val(TextStrVel.Text)
		MaxVel = Val(TextMaxVel.Text)
		'UPGRADE_WARNING: Couldn't resolve default property of object Tedc. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		Tacc = Tedc = Val(TextTacc.Text)
		d5400_set_profile(0, StrVel, MaxVel, Tacc, Tdec) 'Set T-curve velocity
		d5400_t_pmove(0, Dist, 0) 'Single axis T-curve position move(symmetrical T-curve acceleration and deceleration)
	End Sub
	
	Private Sub CommandStop_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles CommandStop.Click
		d5400_decel_stop(0, Tdec)
	End Sub
	
	Private Sub Timer1_Tick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Timer1.Tick
		LabelPos.Text = "Current position= " & d5400_get_position(0) 'Get current internal position
	End Sub
End Class