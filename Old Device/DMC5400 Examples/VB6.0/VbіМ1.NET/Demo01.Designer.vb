<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> Partial Class Form1
#Region "Windows Form Designer generated code "
	<System.Diagnostics.DebuggerNonUserCode()> Public Sub New()
		MyBase.New()
		'This call is required by the Windows Form Designer.
		InitializeComponent()
	End Sub
	'Form overrides dispose to clean up the component list.
	<System.Diagnostics.DebuggerNonUserCode()> Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
		If Disposing Then
			If Not components Is Nothing Then
				components.Dispose()
			End If
		End If
		MyBase.Dispose(Disposing)
	End Sub
	'Required by the Windows Form Designer
	Private components As System.ComponentModel.IContainer
	Public ToolTip1 As System.Windows.Forms.ToolTip
	Public WithEvents Timer1 As System.Windows.Forms.Timer
	Public WithEvents CommandStop As System.Windows.Forms.Button
	Public WithEvents CommandStart As System.Windows.Forms.Button
	Public WithEvents TextTacc As System.Windows.Forms.TextBox
	Public WithEvents TextMaxVel As System.Windows.Forms.TextBox
	Public WithEvents TextStrVel As System.Windows.Forms.TextBox
	Public WithEvents TextDist As System.Windows.Forms.TextBox
	Public WithEvents _Label5_3 As System.Windows.Forms.Label
	Public WithEvents _Label5_2 As System.Windows.Forms.Label
	Public WithEvents _Label5_1 As System.Windows.Forms.Label
	Public WithEvents _Label5_0 As System.Windows.Forms.Label
	Public WithEvents LabelPos As System.Windows.Forms.Label
	Public WithEvents Label4 As System.Windows.Forms.Label
	Public WithEvents Label3 As System.Windows.Forms.Label
	Public WithEvents Label2 As System.Windows.Forms.Label
	Public WithEvents Label1 As System.Windows.Forms.Label
	Public WithEvents Label5 As Microsoft.VisualBasic.Compatibility.VB6.LabelArray
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form1))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.Timer1 = New System.Windows.Forms.Timer(components)
		Me.CommandStop = New System.Windows.Forms.Button
		Me.CommandStart = New System.Windows.Forms.Button
		Me.TextTacc = New System.Windows.Forms.TextBox
		Me.TextMaxVel = New System.Windows.Forms.TextBox
		Me.TextStrVel = New System.Windows.Forms.TextBox
		Me.TextDist = New System.Windows.Forms.TextBox
		Me._Label5_3 = New System.Windows.Forms.Label
		Me._Label5_2 = New System.Windows.Forms.Label
		Me._Label5_1 = New System.Windows.Forms.Label
		Me._Label5_0 = New System.Windows.Forms.Label
		Me.LabelPos = New System.Windows.Forms.Label
		Me.Label4 = New System.Windows.Forms.Label
		Me.Label3 = New System.Windows.Forms.Label
		Me.Label2 = New System.Windows.Forms.Label
		Me.Label1 = New System.Windows.Forms.Label
		Me.Label5 = New Microsoft.VisualBasic.Compatibility.VB6.LabelArray(components)
		Me.SuspendLayout()
		Me.ToolTip1.Active = True
		CType(Me.Label5, System.ComponentModel.ISupportInitialize).BeginInit()
		Me.Text = "Single axis T-curve position move"
		Me.ClientSize = New System.Drawing.Size(298, 215)
		Me.Location = New System.Drawing.Point(4, 23)
		Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
		Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
		Me.BackColor = System.Drawing.SystemColors.Control
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Sizable
		Me.ControlBox = True
		Me.Enabled = True
		Me.KeyPreview = False
		Me.MaximizeBox = True
		Me.MinimizeBox = True
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.ShowInTaskbar = True
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "Form1"
		Me.Timer1.Interval = 100
		Me.Timer1.Enabled = True
		Me.CommandStop.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.CommandStop.BackColor = System.Drawing.Color.FromARGB(255, 128, 128)
		Me.CommandStop.Text = "STOP"
		Me.CommandStop.Font = New System.Drawing.Font("Times New Roman", 12!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me.CommandStop.Size = New System.Drawing.Size(73, 33)
		Me.CommandStop.Location = New System.Drawing.Point(200, 112)
		Me.CommandStop.TabIndex = 5
		Me.CommandStop.CausesValidation = True
		Me.CommandStop.Enabled = True
		Me.CommandStop.ForeColor = System.Drawing.SystemColors.ControlText
		Me.CommandStop.Cursor = System.Windows.Forms.Cursors.Default
		Me.CommandStop.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.CommandStop.TabStop = True
		Me.CommandStop.Name = "CommandStop"
		Me.CommandStart.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.CommandStart.BackColor = System.Drawing.Color.Green
		Me.CommandStart.Text = "START"
		Me.CommandStart.Font = New System.Drawing.Font("Times New Roman", 12!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me.CommandStart.Size = New System.Drawing.Size(73, 33)
		Me.CommandStart.Location = New System.Drawing.Point(200, 40)
		Me.CommandStart.TabIndex = 4
		Me.CommandStart.CausesValidation = True
		Me.CommandStart.Enabled = True
		Me.CommandStart.ForeColor = System.Drawing.SystemColors.ControlText
		Me.CommandStart.Cursor = System.Windows.Forms.Cursors.Default
		Me.CommandStart.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.CommandStart.TabStop = True
		Me.CommandStart.Name = "CommandStart"
		Me.TextTacc.AutoSize = False
		Me.TextTacc.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
		Me.TextTacc.Font = New System.Drawing.Font("Times New Roman", 9!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me.TextTacc.Size = New System.Drawing.Size(57, 18)
		Me.TextTacc.Location = New System.Drawing.Point(88, 144)
		Me.TextTacc.TabIndex = 3
		Me.TextTacc.Text = "0.1"
		Me.TextTacc.AcceptsReturn = True
		Me.TextTacc.BackColor = System.Drawing.SystemColors.Window
		Me.TextTacc.CausesValidation = True
		Me.TextTacc.Enabled = True
		Me.TextTacc.ForeColor = System.Drawing.SystemColors.WindowText
		Me.TextTacc.HideSelection = True
		Me.TextTacc.ReadOnly = False
		Me.TextTacc.Maxlength = 0
		Me.TextTacc.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.TextTacc.MultiLine = False
		Me.TextTacc.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.TextTacc.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.TextTacc.TabStop = True
		Me.TextTacc.Visible = True
		Me.TextTacc.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.TextTacc.Name = "TextTacc"
		Me.TextMaxVel.AutoSize = False
		Me.TextMaxVel.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
		Me.TextMaxVel.Font = New System.Drawing.Font("Times New Roman", 9!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me.TextMaxVel.Size = New System.Drawing.Size(57, 18)
		Me.TextMaxVel.Location = New System.Drawing.Point(88, 104)
		Me.TextMaxVel.TabIndex = 2
		Me.TextMaxVel.Text = "1000"
		Me.TextMaxVel.AcceptsReturn = True
		Me.TextMaxVel.BackColor = System.Drawing.SystemColors.Window
		Me.TextMaxVel.CausesValidation = True
		Me.TextMaxVel.Enabled = True
		Me.TextMaxVel.ForeColor = System.Drawing.SystemColors.WindowText
		Me.TextMaxVel.HideSelection = True
		Me.TextMaxVel.ReadOnly = False
		Me.TextMaxVel.Maxlength = 0
		Me.TextMaxVel.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.TextMaxVel.MultiLine = False
		Me.TextMaxVel.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.TextMaxVel.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.TextMaxVel.TabStop = True
		Me.TextMaxVel.Visible = True
		Me.TextMaxVel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.TextMaxVel.Name = "TextMaxVel"
		Me.TextStrVel.AutoSize = False
		Me.TextStrVel.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
		Me.TextStrVel.Font = New System.Drawing.Font("Times New Roman", 9!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me.TextStrVel.Size = New System.Drawing.Size(57, 18)
		Me.TextStrVel.Location = New System.Drawing.Point(88, 64)
		Me.TextStrVel.TabIndex = 1
		Me.TextStrVel.Text = "100"
		Me.TextStrVel.AcceptsReturn = True
		Me.TextStrVel.BackColor = System.Drawing.SystemColors.Window
		Me.TextStrVel.CausesValidation = True
		Me.TextStrVel.Enabled = True
		Me.TextStrVel.ForeColor = System.Drawing.SystemColors.WindowText
		Me.TextStrVel.HideSelection = True
		Me.TextStrVel.ReadOnly = False
		Me.TextStrVel.Maxlength = 0
		Me.TextStrVel.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.TextStrVel.MultiLine = False
		Me.TextStrVel.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.TextStrVel.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.TextStrVel.TabStop = True
		Me.TextStrVel.Visible = True
		Me.TextStrVel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.TextStrVel.Name = "TextStrVel"
		Me.TextDist.AutoSize = False
		Me.TextDist.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
		Me.TextDist.Font = New System.Drawing.Font("Times New Roman", 9!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me.TextDist.Size = New System.Drawing.Size(57, 18)
		Me.TextDist.Location = New System.Drawing.Point(88, 24)
		Me.TextDist.TabIndex = 0
		Me.TextDist.Text = "2000"
		Me.TextDist.AcceptsReturn = True
		Me.TextDist.BackColor = System.Drawing.SystemColors.Window
		Me.TextDist.CausesValidation = True
		Me.TextDist.Enabled = True
		Me.TextDist.ForeColor = System.Drawing.SystemColors.WindowText
		Me.TextDist.HideSelection = True
		Me.TextDist.ReadOnly = False
		Me.TextDist.Maxlength = 0
		Me.TextDist.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.TextDist.MultiLine = False
		Me.TextDist.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.TextDist.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.TextDist.TabStop = True
		Me.TextDist.Visible = True
		Me.TextDist.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.TextDist.Name = "TextDist"
		Me._Label5_3.Text = "sec"
		Me._Label5_3.Font = New System.Drawing.Font("Times New Roman", 8.25!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me._Label5_3.Size = New System.Drawing.Size(41, 17)
		Me._Label5_3.Location = New System.Drawing.Point(152, 144)
		Me._Label5_3.TabIndex = 14
		Me._Label5_3.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me._Label5_3.BackColor = System.Drawing.SystemColors.Control
		Me._Label5_3.Enabled = True
		Me._Label5_3.ForeColor = System.Drawing.SystemColors.ControlText
		Me._Label5_3.Cursor = System.Windows.Forms.Cursors.Default
		Me._Label5_3.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me._Label5_3.UseMnemonic = True
		Me._Label5_3.Visible = True
		Me._Label5_3.AutoSize = False
		Me._Label5_3.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me._Label5_3.Name = "_Label5_3"
		Me._Label5_2.Text = "pul/sec"
		Me._Label5_2.Font = New System.Drawing.Font("Times New Roman", 8.25!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me._Label5_2.Size = New System.Drawing.Size(41, 17)
		Me._Label5_2.Location = New System.Drawing.Point(152, 104)
		Me._Label5_2.TabIndex = 13
		Me._Label5_2.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me._Label5_2.BackColor = System.Drawing.SystemColors.Control
		Me._Label5_2.Enabled = True
		Me._Label5_2.ForeColor = System.Drawing.SystemColors.ControlText
		Me._Label5_2.Cursor = System.Windows.Forms.Cursors.Default
		Me._Label5_2.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me._Label5_2.UseMnemonic = True
		Me._Label5_2.Visible = True
		Me._Label5_2.AutoSize = False
		Me._Label5_2.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me._Label5_2.Name = "_Label5_2"
		Me._Label5_1.Text = "pul/sec"
		Me._Label5_1.Font = New System.Drawing.Font("Times New Roman", 8.25!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me._Label5_1.Size = New System.Drawing.Size(41, 17)
		Me._Label5_1.Location = New System.Drawing.Point(152, 64)
		Me._Label5_1.TabIndex = 12
		Me._Label5_1.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me._Label5_1.BackColor = System.Drawing.SystemColors.Control
		Me._Label5_1.Enabled = True
		Me._Label5_1.ForeColor = System.Drawing.SystemColors.ControlText
		Me._Label5_1.Cursor = System.Windows.Forms.Cursors.Default
		Me._Label5_1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me._Label5_1.UseMnemonic = True
		Me._Label5_1.Visible = True
		Me._Label5_1.AutoSize = False
		Me._Label5_1.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me._Label5_1.Name = "_Label5_1"
		Me._Label5_0.Text = "pulses"
		Me._Label5_0.Font = New System.Drawing.Font("Times New Roman", 8.25!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me._Label5_0.Size = New System.Drawing.Size(33, 17)
		Me._Label5_0.Location = New System.Drawing.Point(152, 24)
		Me._Label5_0.TabIndex = 11
		Me._Label5_0.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me._Label5_0.BackColor = System.Drawing.SystemColors.Control
		Me._Label5_0.Enabled = True
		Me._Label5_0.ForeColor = System.Drawing.SystemColors.ControlText
		Me._Label5_0.Cursor = System.Windows.Forms.Cursors.Default
		Me._Label5_0.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me._Label5_0.UseMnemonic = True
		Me._Label5_0.Visible = True
		Me._Label5_0.AutoSize = False
		Me._Label5_0.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me._Label5_0.Name = "_Label5_0"
		Me.LabelPos.TextAlign = System.Drawing.ContentAlignment.TopCenter
		Me.LabelPos.Text = "Get current internal position"
		Me.LabelPos.Size = New System.Drawing.Size(225, 17)
		Me.LabelPos.Location = New System.Drawing.Point(24, 184)
		Me.LabelPos.TabIndex = 10
		Me.LabelPos.BackColor = System.Drawing.SystemColors.Control
		Me.LabelPos.Enabled = True
		Me.LabelPos.ForeColor = System.Drawing.SystemColors.ControlText
		Me.LabelPos.Cursor = System.Windows.Forms.Cursors.Default
		Me.LabelPos.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.LabelPos.UseMnemonic = True
		Me.LabelPos.Visible = True
		Me.LabelPos.AutoSize = False
		Me.LabelPos.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.LabelPos.Name = "LabelPos"
		Me.Label4.TextAlign = System.Drawing.ContentAlignment.TopRight
		Me.Label4.Text = "Zabrz-Uspor"
		Me.Label4.Font = New System.Drawing.Font("Times New Roman", 9!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me.Label4.Size = New System.Drawing.Size(73, 25)
		Me.Label4.Location = New System.Drawing.Point(8, 144)
		Me.Label4.TabIndex = 9
		Me.Label4.BackColor = System.Drawing.SystemColors.Control
		Me.Label4.Enabled = True
		Me.Label4.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label4.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label4.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label4.UseMnemonic = True
		Me.Label4.Visible = True
		Me.Label4.AutoSize = False
		Me.Label4.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label4.Name = "Label4"
		Me.Label3.TextAlign = System.Drawing.ContentAlignment.TopRight
		Me.Label3.Text = "MaxBrzina"
		Me.Label3.Font = New System.Drawing.Font("Times New Roman", 9!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me.Label3.Size = New System.Drawing.Size(65, 25)
		Me.Label3.Location = New System.Drawing.Point(16, 104)
		Me.Label3.TabIndex = 8
		Me.Label3.BackColor = System.Drawing.SystemColors.Control
		Me.Label3.Enabled = True
		Me.Label3.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label3.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label3.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label3.UseMnemonic = True
		Me.Label3.Visible = True
		Me.Label3.AutoSize = False
		Me.Label3.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label3.Name = "Label3"
		Me.Label2.TextAlign = System.Drawing.ContentAlignment.TopRight
		Me.Label2.Text = "StartBrzina"
		Me.Label2.Font = New System.Drawing.Font("Times New Roman", 9!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me.Label2.Size = New System.Drawing.Size(65, 25)
		Me.Label2.Location = New System.Drawing.Point(16, 64)
		Me.Label2.TabIndex = 7
		Me.Label2.BackColor = System.Drawing.SystemColors.Control
		Me.Label2.Enabled = True
		Me.Label2.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label2.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label2.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label2.UseMnemonic = True
		Me.Label2.Visible = True
		Me.Label2.AutoSize = False
		Me.Label2.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label2.Name = "Label2"
		Me.Label1.TextAlign = System.Drawing.ContentAlignment.TopRight
		Me.Label1.Text = "Rastojanie"
		Me.Label1.Font = New System.Drawing.Font("Times New Roman", 9!, System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(204, Byte))
		Me.Label1.Size = New System.Drawing.Size(65, 25)
		Me.Label1.Location = New System.Drawing.Point(16, 24)
		Me.Label1.TabIndex = 6
		Me.Label1.BackColor = System.Drawing.SystemColors.Control
		Me.Label1.Enabled = True
		Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label1.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label1.UseMnemonic = True
		Me.Label1.Visible = True
		Me.Label1.AutoSize = False
		Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label1.Name = "Label1"
		Me.Controls.Add(CommandStop)
		Me.Controls.Add(CommandStart)
		Me.Controls.Add(TextTacc)
		Me.Controls.Add(TextMaxVel)
		Me.Controls.Add(TextStrVel)
		Me.Controls.Add(TextDist)
		Me.Controls.Add(_Label5_3)
		Me.Controls.Add(_Label5_2)
		Me.Controls.Add(_Label5_1)
		Me.Controls.Add(_Label5_0)
		Me.Controls.Add(LabelPos)
		Me.Controls.Add(Label4)
		Me.Controls.Add(Label3)
		Me.Controls.Add(Label2)
		Me.Controls.Add(Label1)
		Me.Label5.SetIndex(_Label5_3, CType(3, Short))
		Me.Label5.SetIndex(_Label5_2, CType(2, Short))
		Me.Label5.SetIndex(_Label5_1, CType(1, Short))
		Me.Label5.SetIndex(_Label5_0, CType(0, Short))
		CType(Me.Label5, System.ComponentModel.ISupportInitialize).EndInit()
		Me.ResumeLayout(False)
		Me.PerformLayout()
	End Sub
#End Region 
End Class