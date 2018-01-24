// CauFEMView.h : interface of the CCauFEMView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_CAUFEMVIEW_H__2658901C_F431_476D_A892_2AA3DC0C81C3__INCLUDED_)
#define AFX_CAUFEMVIEW_H__2658901C_F431_476D_A892_2AA3DC0C81C3__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "CauFEMengine.h"

class CCauFEMView : public CView
{
protected: // create from serialization only
	CCauFEMView();
	DECLARE_DYNCREATE(CCauFEMView)

// Attributes
public:
	CCauFEMDoc* GetDocument();
	FemEngine m_FEMengine;

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCauFEMView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CCauFEMView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CCauFEMView)
	afx_msg void OnFemCalcTrust();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in CauFEMView.cpp
inline CCauFEMDoc* CCauFEMView::GetDocument()
   { return (CCauFEMDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CAUFEMVIEW_H__2658901C_F431_476D_A892_2AA3DC0C81C3__INCLUDED_)
