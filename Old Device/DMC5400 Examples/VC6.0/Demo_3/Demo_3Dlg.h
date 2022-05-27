// Demo_3Dlg.h : header file
//

#if !defined(AFX_DEMO_3DLG_H__E0EF1724_AA3D_4081_B893_097C0202DCF6__INCLUDED_)
#define AFX_DEMO_3DLG_H__E0EF1724_AA3D_4081_B893_097C0202DCF6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CDemo_3Dlg dialog

class CDemo_3Dlg : public CDialog
{
// Construction
public:
	double m_Tdec;
	CDemo_3Dlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CDemo_3Dlg)
	enum { IDD = IDD_DEMO_3_DIALOG };
	long	m_MaxVel;
	long	m_StrVel;
	double	m_Tacc;
	int		m_Dir;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemo_3Dlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CDemo_3Dlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButtonStart();
	afx_msg void OnButtonStop();
	afx_msg void OnDestroy();
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMO_3DLG_H__E0EF1724_AA3D_4081_B893_097C0202DCF6__INCLUDED_)
