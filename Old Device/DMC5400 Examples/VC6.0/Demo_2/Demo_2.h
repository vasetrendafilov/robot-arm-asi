// Demo_2.h : main header file for the DEMO_2 application
//

#if !defined(AFX_DEMO_2_H__95F1FCD4_A7B3_425E_8AA2_395FD13567A9__INCLUDED_)
#define AFX_DEMO_2_H__95F1FCD4_A7B3_425E_8AA2_395FD13567A9__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CDemo_2App:
// See Demo_2.cpp for the implementation of this class
//

class CDemo_2App : public CWinApp
{
public:
	CDemo_2App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemo_2App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CDemo_2App)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMO_2_H__95F1FCD4_A7B3_425E_8AA2_395FD13567A9__INCLUDED_)
