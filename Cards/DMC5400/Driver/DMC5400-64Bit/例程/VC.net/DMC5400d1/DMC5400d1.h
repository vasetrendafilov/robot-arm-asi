// DMC5400d1.h : main header file for the DMC5400D1 application
//

#if !defined(AFX_DMC5400D1_H__56A5F361_20E4_468F_BFA2_85DEE06B5C5C__INCLUDED_)
#define AFX_DMC5400D1_H__56A5F361_20E4_468F_BFA2_85DEE06B5C5C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CDMC5400d1App:
// See DMC5400d1.cpp for the implementation of this class
//

class CDMC5400d1App : public CWinApp
{
public:
	CDMC5400d1App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDMC5400d1App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CDMC5400d1App)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DMC5400D1_H__56A5F361_20E4_468F_BFA2_85DEE06B5C5C__INCLUDED_)
