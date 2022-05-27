// Demo_1Dlg.h : header file
//

#if !defined(AFX_DEMO_1DLG_H__2245A263_8C17_4642_83B5_DA73E4BE8637__INCLUDED_)
#define AFX_DEMO_1DLG_H__2245A263_8C17_4642_83B5_DA73E4BE8637__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CDemo_1Dlg dialog

class CDemo_1Dlg : public CDialog
{
// Construction
public:
	double m_Tdec;
	CDemo_1Dlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CDemo_1Dlg)
	enum { IDD = IDD_DEMO_1_DIALOG };
	long	m_Dist;
	long	m_MaxVel;
	long	m_StrVel;
	double	m_Tacc;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemo_1Dlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CDemo_1Dlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnDestroy();
	afx_msg void OnButtonStart();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnButtonStop();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMO_1DLG_H__2245A263_8C17_4642_83B5_DA73E4BE8637__INCLUDED_)
