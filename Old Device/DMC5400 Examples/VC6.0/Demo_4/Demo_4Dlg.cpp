//********************************************
//    雷泰DMC5400控制卡编程示例之四（I/O口）
//  关键函数:
//        d5400_board_init       初始化控制卡
//        d5400_board_close      关闭控制卡
//        d5400_write_outbit     输出通用输出信号
//        d5400_read_inbit       读取通用输入信号
//        d5400_read_outbit      读取通用输出信号
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
	if( d5400_board_init() < 1)                    //初始化控制卡
	{
		MessageBox("没有找到任何控制卡！","警告"); //提示没有找到控制卡
	}
	SetTimer(0x001,100,NULL);                      //创建Timer	
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
	if (d5400_read_outbit(1) == 0 )                                    //判断输出口1是否为低电平
       d5400_write_outbit  (1, 1);                                     //输出口1设为高电平
    else d5400_write_outbit  (1, 0);                                   //输出口1设为低电平
}

void CDemo_4Dlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	CString nIO;
	nIO.Format("输入口3状态：%d      输出口1状态：%d",d5400_read_inbit(3),d5400_read_outbit(1));   //读取I/O状态
	GetDlgItem(IDC_STATIC_IO)->SetWindowText(nIO);       //显示I/O状态
	CDialog::OnTimer(nIDEvent);
}

void CDemo_4Dlg::OnDestroy() 
{
	d5400_board_close();           //关闭控制卡
	KillTimer(0X001);              //关闭Timer
	CDialog::OnDestroy();
	
	// TODO: Add your message handler code here
	
}
