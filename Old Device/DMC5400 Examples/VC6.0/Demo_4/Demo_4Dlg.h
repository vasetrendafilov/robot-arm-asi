// Demo_4Dlg.h : header file
//

#if !defined(AFX_DEMO_4DLG_H__C750CDA6_B3EC_43EE_A276_6F7A3C751254__INCLUDED_)
#define AFX_DEMO_4DLG_H__C750CDA6_B3EC_43EE_A276_6F7A3C751254__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CDemo_4Dlg dialog

class CDemo_4Dlg : public CDialog
{
// Construction
public:
	CDemo_4Dlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CDemo_4Dlg)
	enum { IDD = IDD_DEMO_4_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemo_4Dlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CDemo_4Dlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButtonStart();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnDestroy();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMO_4DLG_H__C750CDA6_B3EC_43EE_A276_6F7A3C751254__INCLUDED_)
