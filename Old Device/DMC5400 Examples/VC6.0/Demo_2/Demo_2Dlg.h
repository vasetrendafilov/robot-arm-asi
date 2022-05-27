// Demo_2Dlg.h : header file
//

#if !defined(AFX_DEMO_2DLG_H__1A36B03E_37BF_498E_B779_7F0309E8951D__INCLUDED_)
#define AFX_DEMO_2DLG_H__1A36B03E_37BF_498E_B779_7F0309E8951D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CDemo_2Dlg dialog

class CDemo_2Dlg : public CDialog
{
// Construction
public:
	double m_Tdec;
	CDemo_2Dlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CDemo_2Dlg)
	enum { IDD = IDD_DEMO_2_DIALOG };
	long	m_Dist1;
	long	m_Dist2;
	long	m_MaxVel;
	long	m_StrVel;
	double	m_Tacc;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemo_2Dlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CDemo_2Dlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnDestroy();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnButtonStart();
	afx_msg void OnButtonStop();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMO_2DLG_H__1A36B03E_37BF_498E_B779_7F0309E8951D__INCLUDED_)
