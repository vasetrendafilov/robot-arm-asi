//********************************************
//    ��̩DMC5400���ƿ����ʾ��֮�ģ�I/O�ڣ�
//  �ؼ�����:
//        d5400_board_init       ��ʼ�����ƿ�
//        d5400_board_close      �رտ��ƿ�
//        d5400_write_outbit     ���ͨ������ź�
//        d5400_read_inbit       ��ȡͨ�������ź�
//        d5400_read_outbit      ��ȡͨ������ź�
//
//
//
//    Writen by LeadTech-support
//    FAX: 0755 - 26417609
//    TEL: 0755 - 26434329
//    http://www.szleadtech.com.cn
//********************************************
// Demo_4Dlg.cpp : implementation file
//

#include "stdafx.h"
#include "Demo_4.h"
#include "Demo_4Dlg.h"
#include "DMC5400.H"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDemo_4Dlg dialog

CDemo_4Dlg::CDemo_4Dlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDemo_4Dlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDemo_4Dlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CDemo_4Dlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDemo_4Dlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDemo_4Dlg, CDialog)
	//{{AFX_MSG_MAP(CDemo_4Dlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON_START, OnButtonStart)
	ON_WM_TIMER()
	ON_WM_DESTROY()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDemo_4Dlg message handlers

BOOL CDemo_4Dlg::OnInitDialog()
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

void CDemo_4Dlg::OnPaint() 
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
HCURSOR CDemo_4Dlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CDemo_4Dlg::OnButtonStart() 
{
	// TODO: Add your control notification handler code here
	if (d5400_read_outbit(1) == 0 )                                    //�ж������1�Ƿ�Ϊ�͵�ƽ
       d5400_write_outbit  (1, 1);                                     //�����1��Ϊ�ߵ�ƽ
    else d5400_write_outbit  (1, 0);                                   //�����1��Ϊ�͵�ƽ
}

void CDemo_4Dlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	CString nIO;
	nIO.Format("�����3״̬��%d      �����1״̬��%d",d5400_read_inbit(3),d5400_read_outbit(1));   //��ȡI/O״̬
	GetDlgItem(IDC_STATIC_IO)->SetWindowText(nIO);       //��ʾI/O״̬
	CDialog::OnTimer(nIDEvent);
}

void CDemo_4Dlg::OnDestroy() 
{
	d5400_board_close();           //�رտ��ƿ�
	KillTimer(0X001);              //�ر�Timer
	CDialog::OnDestroy();
	
	// TODO: Add your message handler code here
	
}
