//********************************************
//    ��̩DMC5400���ƿ����ʾ��֮������ԭ�㣩
//
//  �ؼ�����:
//        d5400_board_init       ��ʼ�����ƿ�
//        d5400_board_close      �رտ��ƿ�
//        d5400_set_profile      ����T������
//        d5400_config_home_mode ���û�ԭ��ģʽ
//        d5400_home_move        ��ԭ��
//        d5400_decel_stop       ����ֹͣ
//        d5400_axis_io_status   ��ȡָ�����I/O״̬
//        d5400_get_position     ��ȡ����λ��ֵ
//
//
// ע���ɸ���ʵ������ڻ�ԭ����ú���d5400_set_position�趨��ǰλ��
//    Writen by LeadTech-support
//    FAX: 0755 - 26417609
//    TEL: 0755 - 26434329
//    http://www.szleadtech.com.cn
//********************************************
// Demo_3Dlg.cpp : implementation file
//

#include "stdafx.h"
#include "Demo_3.h"
#include "Demo_3Dlg.h"
#include "DMC5400.H"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDemo_3Dlg dialog

CDemo_3Dlg::CDemo_3Dlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDemo_3Dlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDemo_3Dlg)
	m_MaxVel = 1000;
	m_StrVel = 100;
	m_Tacc = 0.1;
	m_Dir = 0;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CDemo_3Dlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDemo_3Dlg)
	DDX_Text(pDX, IDC_EDIT_MAXVEL, m_MaxVel);
	DDX_Text(pDX, IDC_EDIT_STRVEL, m_StrVel);
	DDX_Text(pDX, IDC_EDIT_TACC, m_Tacc);
	DDX_Radio(pDX, IDC_RADIO1, m_Dir);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDemo_3Dlg, CDialog)
	//{{AFX_MSG_MAP(CDemo_3Dlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON_START, OnButtonStart)
	ON_BN_CLICKED(IDC_BUTTON_STOP, OnButtonStop)
	ON_WM_DESTROY()
	ON_WM_TIMER()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDemo_3Dlg message handlers

BOOL CDemo_3Dlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	if( d5400_board_init() < 1)                    //��ʼ�����ƿ�
	{
		MessageBox("û���ҵ��κο��ƿ���","����"); //��ʾû���ҵ����ƿ�
	}
	SetTimer(0x001,100,NULL);                      //����Timer	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CDemo_3Dlg::OnPaint() 
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
HCURSOR CDemo_3Dlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CDemo_3Dlg::OnButtonStart() 
{
	// TODO: Add your control notification handler code here
	UpdateData(true);                              //��ֵ����
	m_Tdec=m_Tacc;                                 //�趨����ʱ��ͼ���ʱ��һ����Ҳ������Ϊ��һ��
	d5400_set_profile (0, m_StrVel, m_MaxVel, m_Tacc, m_Tdec);  //����T������
	if (m_Dir==0)
	{
      d5400_config_home_mode (0, 0, 0);                  //���û�ԭ��ģʽ����ԭ���ź�ֹͣ��EZ�źŴ���Ϊ0
      d5400_home_move (0, 1, 0 );                        //�����������ԭ��
	}
	else
	{
      d5400_config_home_mode (0, 0, 0);                 //���û�ԭ��ģʽ����ԭ���ź�ֹͣ��EZ�źŴ���Ϊ0
      d5400_home_move (0, 2, 1 );                       //�����������ԭ��
	}

}

void CDemo_3Dlg::OnButtonStop() 
{
	// TODO: Add your control notification handler code here
	d5400_decel_stop (0,m_Tdec);              //��0�����ֹͣ
}

void CDemo_3Dlg::OnDestroy() 
{
	d5400_board_close();           //�رտ��ƿ�
	KillTimer(0X001);              //�ر�Timer
	CDialog::OnDestroy();
	
	// TODO: Add your message handler code here
	
}

void CDemo_3Dlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	CString nORG;
	nORG.Format("ԭ���źţ�%d   ��0��λ�ã�%d",(d5400_axis_io_status(0) & 16384)==16384,d5400_get_position(0));   //��ȡԭ���ź�״̬�͵�ǰλ��
	GetDlgItem(IDC_STATIC_ORG)->SetWindowText(nORG);       //��ʾԭ���ź�״̬�͵�ǰλ��
	CDialog::OnTimer(nIDEvent);
}
