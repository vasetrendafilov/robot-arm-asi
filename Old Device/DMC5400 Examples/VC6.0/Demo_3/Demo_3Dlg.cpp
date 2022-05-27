//********************************************
//    雷泰DMC5400控制卡编程示例之三（回原点）
//
//  关键函数:
//        d5400_board_init       初始化控制卡
//        d5400_board_close      关闭控制卡
//        d5400_set_profile      设置T型曲线
//        d5400_config_home_mode 设置回原点模式
//        d5400_home_move        回原点
//        d5400_decel_stop       减速停止
//        d5400_axis_io_status   读取指定轴的I/O状态
//        d5400_get_position     读取程序位置值
//
//
// 注：可根据实际情况在回原点后用函数d5400_set_position设定当前位置
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
	UpdateData(true);                              //赋值参数
	m_Tdec=m_Tacc;                                 //设定减速时间和加速时间一样，也可以设为不一样
	d5400_set_profile (0, m_StrVel, m_MaxVel, m_Tacc, m_Tdec);  //设置T型曲线
	if (m_Dir==0)
	{
      d5400_config_home_mode (0, 0, 0);                  //设置回原点模式：遇原点信号停止，EZ信号次数为0
      d5400_home_move (0, 1, 0 );                        //低速正方向回原点
	}
	else
	{
      d5400_config_home_mode (0, 0, 0);                 //设置回原点模式：遇原点信号停止，EZ信号次数为0
      d5400_home_move (0, 2, 1 );                       //低速正方向回原点
	}

}

void CDemo_3Dlg::OnButtonStop() 
{
	// TODO: Add your control notification handler code here
	d5400_decel_stop (0,m_Tdec);              //第0轴减速停止
}

void CDemo_3Dlg::OnDestroy() 
{
	d5400_board_close();           //关闭控制卡
	KillTimer(0X001);              //关闭Timer
	CDialog::OnDestroy();
	
	// TODO: Add your message handler code here
	
}

void CDemo_3Dlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	CString nORG;
	nORG.Format("原点信号：%d   第0轴位置：%d",(d5400_axis_io_status(0) & 16384)==16384,d5400_get_position(0));   //读取原点信号状态和当前位置
	GetDlgItem(IDC_STATIC_ORG)->SetWindowText(nORG);       //显示原点信号状态和当前位置
	CDialog::OnTimer(nIDEvent);
}
