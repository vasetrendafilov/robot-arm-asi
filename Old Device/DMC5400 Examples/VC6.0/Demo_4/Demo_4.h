// Demo_4.h : main header file for the DEMO_4 application
//

#if !defined(AFX_DEMO_4_H__30A03244_9A5F_4D1A_85BF_8FAD3E10EB49__INCLUDED_)
#define AFX_DEMO_4_H__30A03244_9A5F_4D1A_85BF_8FAD3E10EB49__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CDemo_4App:
// See Demo_4.cpp for the implementation of this class
//

class CDemo_4App : public CWinApp
{
public:
	CDemo_4App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemo_4App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CDemo_4App)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMO_4_H__30A03244_9A5F_4D1A_85BF_8FAD3E10EB49__INCLUDED_)
