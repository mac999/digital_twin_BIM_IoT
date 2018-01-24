// CauFEM.h : main header file for the CAUFEM application
//

#if !defined(AFX_CAUFEM_H__62ADAB6C_48DA_4E7E_9D69_D3507559C3AE__INCLUDED_)
#define AFX_CAUFEM_H__62ADAB6C_48DA_4E7E_9D69_D3507559C3AE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CCauFEMApp:
// See CauFEM.cpp for the implementation of this class
//

class CCauFEMApp : public CWinApp
{
public:
	CCauFEMApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCauFEMApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CCauFEMApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CAUFEM_H__62ADAB6C_48DA_4E7E_9D69_D3507559C3AE__INCLUDED_)
