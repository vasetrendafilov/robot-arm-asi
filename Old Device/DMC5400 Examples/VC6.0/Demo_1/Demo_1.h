// Demo_1.h : main header file for the DEMO_1 application
//

#if !defined(AFX_DEMO_1_H__99BFD247_090A_4EBE_B8E4_FED9D82AFA99__INCLUDED_)
#define AFX_DEMO_1_H__99BFD247_090A_4EBE_B8E4_FED9D82AFA99__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CDemo_1App:
// See Demo_1.cpp for the implementation of this class
//

class CDemo_1App : public CWinApp
{
public:
	CDemo_1App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemo_1App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CDemo_1App)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMO_1_H__99BFD247_090A_4EBE_B8E4_FED9D82AFA99__INCLUDED_)
