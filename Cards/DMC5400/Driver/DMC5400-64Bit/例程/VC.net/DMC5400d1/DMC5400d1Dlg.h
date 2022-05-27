// DMC5400d1Dlg.h : header file
//

#if !defined(AFX_DMC5400D1DLG_H__18625FEF_BA48_4543_9534_2B1F3EE662DA__INCLUDED_)
#define AFX_DMC5400D1DLG_H__18625FEF_BA48_4543_9534_2B1F3EE662DA__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "DMC5400.h"
#pragma comment(lib, "DMC5400.LIB")

/////////////////////////////////////////////////////////////////////////////
// CDMC5400d1Dlg dialog

class CDMC5400d1Dlg : public CDialog
{
// Construction
public:
	void UpdateControl();
	CDMC5400d1Dlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CDMC5400d1Dlg)
	enum { IDD = IDD_DMC5400D1_DIALOG };
	BOOL	m_bLogic;
	BOOL	m_bSymmetry;
	double	m_fAccel;
	double	m_fDecel;
	long	m_nPulse;
	long	m_nSpeed;
	long	m_nStart;
	int		m_nActionst;
	int		m_nSpeedst;
	int		m_nAxis;
	long	m_nSacc;
	long	m_nSdec;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDMC5400d1Dlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CDMC5400d1Dlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnRadioSpeedst();
	afx_msg void OnButtonDo();
	afx_msg void OnButtonClose();
	afx_msg void OnButtonDecstop();
	afx_msg void OnButtonEmgstop();
	afx_msg void OnCheckLogic();
	afx_msg void OnCheckSymmetry();
	afx_msg void OnRadioCmove();
	afx_msg void OnRadioActionst();
	afx_msg void OnRadioTs();
	afx_msg void OnRadioSs();
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	afx_msg void OnDestroy();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DMC5400D1DLG_H__18625FEF_BA48_4543_9534_2B1F3EE662DA__INCLUDED_)
