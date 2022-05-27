//********************************************
//    ��̩DMC5400���ƿ����ʾ��֮��������T��ֱ�߲岹����˶���
//
//  �ؼ�����:
//        d5400_board_init       ��ʼ�����ƿ�
//        d5400_board_close      �رտ��ƿ�
//        d5400_set_vector_profile �趨�����˶����ٶ�
//        d5400_t_line2          ����ֱ�߲岹�˶�
//        d5400_decel_stop       ����ֹͣ
//        d5400_get_position     ��ȡ����λ��ֵ
//
//
//
//    Writen by LeadTech-support
//    FAX: 0755 - 26417609
//    TEL: 0755 - 26434329
//    http://www.szleadtech.com.cn
//********************************************
// Demo_2Dlg.cpp : implementation file
//

#include "stdafx.h"
#include "Demo_2.h"
#include "Demo_2Dlg.h"
#include "DMC5400.H"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDemo_2Dlg dialog

CDemo_2Dlg::CDemo_2Dlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDemo_2Dlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDemo_2Dlg)
	m_Dist1 = 1000;
	m_Dist2 = 2000;
	m_MaxVel = 1000;
	m_StrVel = 100;
	m_Tacc = 0.1;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CDemo_2Dlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDemo_2Dlg)
	DDX_Text(pDX, IDC_EDIT_DIST1, m_Dist1);
	DDX_Text(pDX, IDC_EDIT_DIST2, m_Dist2);
	DDX_Text(pDX, IDC_EDIT_MAXVEL, m_MaxVel);
	DDX_Text(pDX, IDC_EDIT_STRVEL, m_StrVel);
	DDX_Text(pDX, IDC_EDIT_TACC, m_Tacc);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDemo_2Dlg, CDialog)
	//{{AFX_MSG_MAP(CDemo_2Dlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_DESTROY()
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_BUTTON_START, OnButtonStart)
	ON_BN_CLICKED(IDC_BUTTON_STOP, OnButtonStop)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDemo_2Dlg message handlers

BOOL CDemo_2Dlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	if( d5400_board_init() < 1)                    //��ʼ�����ƿ�
	{
		MessageBox("û���ҵ��κο��ƿ���","����"); //��ʾû���ҵ����ƿ�
	}
	SetTimer(0x001,100,NULL);   	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CDemo_2Dlg::OnPaint() 
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
HCURSOR CDemo_2Dlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CDemo_2Dlg::OnDestroy() 
{
	d5400_board_close();           //�رտ��ƿ�
	KillTimer(0X001);              //�ر�Timer
	CDialog::OnDestroy();
	
	// TODO: Add your message handler code here
	
}

void CDemo_2Dlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	CString nPos;
	nPos.Format("��0��λ�ã�%d   ��1��λ�ã�%d",d5400_get_position(0),d5400_get_position(1));   //��ȡ��ǰλ��
	GetDlgItem(IDC_STATIC_POS)->SetWindowText(nPos);       //��ʾ��ǰλ��
	CDialog::OnTimer(nIDEvent);
}

void CDemo_2Dlg::OnButtonStart() 
{
	// TODO: Add your control notification handler code here
	UpdateData(true);                                                  //��ֵ����
    d5400_set_vector_profile (m_StrVel, m_MaxVel, m_Tacc, m_Tdec);     //�趨�����˶��ٶ�
    d5400_t_line2 (0, m_Dist1, 1, m_Dist2, 0);                         //����ֱ�߲岹���λ���˶�
}

void CDemo_2Dlg::OnButtonStop() 
{
	// TODO: Add your control notification handler code here
	d5400_decel_stop (0,m_Tdec);                  //��0�����ֹͣ
	d5400_decel_stop (1,m_Tdec);                  //��1�����ֹͣ
}
