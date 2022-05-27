// DMC5400d1Dlg.cpp : implementation file
//

#include "stdafx.h"
#include "DMC5400d1.h"
#include "DMC5400d1Dlg.h"
#include "dmc5400.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


/////////////////////////////////////////////////////////////////////////////
// CDMC5400d1Dlg dialog

CDMC5400d1Dlg::CDMC5400d1Dlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDMC5400d1Dlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDMC5400d1Dlg)
	m_bLogic = TRUE;
	m_bSymmetry = FALSE;
	m_fAccel = 0.1;
	m_fDecel = 0.1;
	m_nPulse = 6400;
	m_nSpeed = 3200;
	m_nStart = 1600;
	m_nActionst = 0;
	m_nSpeedst = 0;
	m_nAxis = 0;
	m_nSacc = 100;
	m_nSdec = 100;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CDMC5400d1Dlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDMC5400d1Dlg)
	DDX_Check(pDX, IDC_CHECK_LOGIC, m_bLogic);
	DDX_Check(pDX, IDC_CHECK_SYMMETRY, m_bSymmetry);
	DDX_Text(pDX, IDC_EDIT_ACCEL, m_fAccel);
	DDX_Text(pDX, IDC_EDIT_DECEL, m_fDecel);
	DDX_Text(pDX, IDC_EDIT_PULSE, m_nPulse);
	DDX_Text(pDX, IDC_EDIT_SPEED, m_nSpeed);
	DDX_Text(pDX, IDC_EDIT_START, m_nStart);
	DDX_Radio(pDX, IDC_RADIO_ACTIONST, m_nActionst);
	DDX_Radio(pDX, IDC_RADIO_SPEEDST, m_nSpeedst);
	DDX_Radio(pDX, IDC_RADIO_AXISX, m_nAxis);
	DDX_Text(pDX, IDC_EDIT_SACC, m_nSacc);
	DDX_Text(pDX, IDC_EDIT_SDEC, m_nSdec);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDMC5400d1Dlg, CDialog)
	//{{AFX_MSG_MAP(CDMC5400d1Dlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_RADIO_SPEEDST, OnRadioSpeedst)
	ON_BN_CLICKED(IDC_BUTTON_DO, OnButtonDo)
	ON_BN_CLICKED(IDC_BUTTON_CLOSE, OnButtonClose)
	ON_BN_CLICKED(IDC_BUTTON_DECSTOP, OnButtonDecstop)
	ON_BN_CLICKED(IDC_BUTTON_EMGSTOP, OnButtonEmgstop)
	ON_BN_CLICKED(IDC_CHECK_LOGIC, OnCheckLogic)
	ON_BN_CLICKED(IDC_CHECK_SYMMETRY, OnCheckSymmetry)
	ON_BN_CLICKED(IDC_RADIO_CMOVE, OnRadioCmove)
	ON_BN_CLICKED(IDC_RADIO_ACTIONST, OnRadioActionst)
	ON_BN_CLICKED(IDC_RADIO_TS, OnRadioTs)
	ON_BN_CLICKED(IDC_RADIO_SS, OnRadioSs)
	ON_WM_TIMER()
	ON_WM_DESTROY()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDMC5400d1Dlg message handlers

BOOL CDMC5400d1Dlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	int n;

	// TODO: Add extra initialization here
	n = d5400_board_init();
	if( n <= 0 )// DMC5400 initialization 
		MessageBox("Initialize DMC5400 failed!","error");
	
		UpdateControl();
	    SetTimer( IDC_TIMER, 100, NULL );
        return TRUE;  // return TRUE  unless you set the focus to a control
}


// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CDMC5400d1Dlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CDMC5400d1Dlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CDMC5400d1Dlg::OnRadioSpeedst() 
{
	//uniform Velocity
	UpdateData( true );
	m_nSpeed = m_nStart;//the start Velocity equal to Maximum Velocity
	UpdateData( FALSE );
	UpdateControl();
	
}

void CDMC5400d1Dlg::OnButtonDo() 
{
		try{
		if( !UpdateData(true) )
			throw "";
	}
	catch( char * ){
		return;
	}
	//////////////////////////
	if ((d5400_check_done( m_nAxis ))&0x02 == 1) //check whether in moving
		return; 
	//set the output pulses mode and logistic direction (set the pulse+direction,and the logistic direction is default setting)	
	d5400_set_pulse_outmode( m_nAxis, m_bLogic?1:3);
	//set the S curve velocity , accelerate/decelerate time, etc
	d5400_set_s_profile(m_nAxis,m_nStart,m_nSpeed,m_fAccel,m_fDecel,m_nSacc,m_nSdec);
	//set the T curve velocity , accelerate/decelerate time, etc
	d5400_set_profile(m_nAxis,m_nStart,m_nSpeed,m_fAccel,m_fDecel);

	if( m_nActionst == 0 ){//discontinuous motion(positon mode)
		//now using relative motion function here, if you need to use absolute motion fuction,
		//just replace with the related function d5400_ex_t_pmove ,other function have no need to change
		m_nSpeedst == 2 ?//S curve
			d5400_s_pmove( m_nAxis, m_nPulse, 0):
	 	    d5400_ex_t_pmove( m_nAxis, m_nPulse, 0);
			//uniform velocity, it means the start velocity equal to the maximum velocity
	}
	else{//Continuous move(Velocity mode)
		int dir = (m_nPulse>0 ) ? 0 : 1;//use the dir parameter to judge the moving direction
		m_nSpeedst == 2 ?//S curve 
			d5400_s_vmove( m_nAxis, dir):
			d5400_t_vmove( m_nAxis, dir);//T curve£¬
            //uniform velocity, it means the start velocity equal to the maximum velocity
	}
	
}

void CDMC5400d1Dlg::OnButtonClose() 
{
	CDialog::OnCancel();
	
}

void CDMC5400d1Dlg::OnButtonDecstop() 
{
	//decelerate stop or immediately stop is lie on your selected funtion
	//d5400_decel_stop( m_nAxis, m_fDecel );
	//stop m_nAxis axis motion
	d5400_imd_stop(m_nAxis);
	
}

void CDMC5400d1Dlg::OnButtonEmgstop() 
{
	
	//emergency stop all the axes
		d5400_emg_stop(  );
	
	
}

void CDMC5400d1Dlg::OnCheckLogic() 
{
	//change the logistic direction
	UpdateData( TRUE );
	UpdateControl();
	
	
}

void CDMC5400d1Dlg::OnCheckSymmetry() 
{
	// set the velocity curve is Symmetry or Dissymmetry
	UpdateData( true );
	m_fDecel = m_fAccel;//Symmetry£¬the accelerate time is equal to decelerate time
	if( m_bSymmetry )
		m_fDecel += m_fAccel;//Dissymmetry£¬automatically to set the accelerate time is equal to decelerate time
	UpdateData( FALSE );
	UpdateControl();
	
}

void CDMC5400d1Dlg::OnRadioCmove() 
{
	UpdateData( true );
	UpdateControl();
	
}

void CDMC5400d1Dlg::OnRadioActionst() 
{
	UpdateData( true );
	UpdateControl();
	
}

void CDMC5400d1Dlg::OnRadioTs() 
{
	//T Curve
	UpdateData( true );
    if( m_nSpeed == m_nStart ){//realized differernt Velocity automatically
		m_nSpeed = m_nStart+m_nStart;
		UpdateData( FALSE );
	}
	UpdateControl();
	
}

void CDMC5400d1Dlg::OnRadioSs() 
{
	//S Curve 
	UpdateData( true );
    if( m_nSpeed == m_nStart ){//change the Velocity automatically 
		m_nSpeed = m_nStart+m_nStart;
		UpdateData( FALSE );
	}
	UpdateControl();
	
}

void CDMC5400d1Dlg::OnTimer(UINT_PTR nIDEvent) 
{
	CString string;
	long position = d5400_get_position( m_nAxis );
	string.Format("Current Position£º%ld", position );
	GetDlgItem( IDC_STATIC_POSITION )->SetWindowText( string );

	DWORD status = d5400_check_done( m_nAxis );
	string.Format("Status Value£º%04x", status );
	GetDlgItem( IDC_STATIC_STATUS )->SetWindowText( string );
	
	
	CDialog::OnTimer(nIDEvent);
}

void CDMC5400d1Dlg::OnDestroy() 
{
		
	d5400_board_close();	//Very important, release the pc's resource
	KillTimer( IDC_TIMER );
	CDialog::OnDestroy();
	
}


void CDMC5400d1Dlg::UpdateControl()
{

	GetDlgItem( IDC_CHECK_LOGIC )->SetWindowText( m_bLogic?"Logic Direction£ºforward":"Logic Direction£ºbackward");

	GetDlgItem( IDC_CHECK_SYMMETRY )->EnableWindow( m_nSpeedst == 1 );//only support to T curve
	GetDlgItem( IDC_CHECK_SYMMETRY )->SetWindowText( m_bSymmetry ?"dissymmetrical curve ":"symmetrical curve");

	GetDlgItem( IDC_EDIT_SACC )->EnableWindow( m_nSpeedst == 2 );
	GetDlgItem( IDC_EDIT_SDEC )->EnableWindow( m_nSpeedst == 2 );

}
