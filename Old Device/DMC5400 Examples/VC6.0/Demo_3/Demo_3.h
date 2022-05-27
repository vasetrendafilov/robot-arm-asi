// Demo_3.h : main header file for the DEMO_3 application
//

#if !defined(AFX_DEMO_3_H__371FF9B5_1151_484E_B54F_4DBF776B6910__INCLUDED_)
#define AFX_DEMO_3_H__371FF9B5_1151_484E_B54F_4DBF776B6910__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CDemo_3App:
// See Demo_3.cpp for the implementation of this class
//

class CDemo_3App : public CWinApp
{
public:
	CDemo_3App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemo_3App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CDemo_3App)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMO_3_H__371FF9B5_1151_484E_B54F_4DBF776B6910__INCLUDED_)
