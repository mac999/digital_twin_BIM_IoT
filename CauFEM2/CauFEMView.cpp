// CauFEMView.cpp : implementation of the CCauFEMView class
//

#include "stdafx.h"
#include "CauFEM.h"

#include "CauFEMDoc.h"
#include "CauFEMView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CCauFEMView

IMPLEMENT_DYNCREATE(CCauFEMView, CView)

BEGIN_MESSAGE_MAP(CCauFEMView, CView)
	//{{AFX_MSG_MAP(CCauFEMView)
	ON_COMMAND(IDM_FEM_CALC_TRUST, OnFemCalcTrust)
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCauFEMView construction/destruction

CCauFEMView::CCauFEMView()
{
	// TODO: add construction code here

}

CCauFEMView::~CCauFEMView()
{
}

BOOL CCauFEMView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CCauFEMView drawing

void CCauFEMView::OnDraw(CDC* pDC)
{
	CCauFEMDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CCauFEMView printing

BOOL CCauFEMView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CCauFEMView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CCauFEMView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CCauFEMView diagnostics

#ifdef _DEBUG
void CCauFEMView::AssertValid() const
{
	CView::AssertValid();
}

void CCauFEMView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CCauFEMDoc* CCauFEMView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CCauFEMDoc)));
	return (CCauFEMDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CCauFEMView message handlers

void CCauFEMView::OnFemCalcTrust() 
{
	// TODO: Add your command handler code here
	if(m_FEMengine.Init() == false)
		return;
	if(m_FEMengine.Load("TrustInput.txt") == false)
	{
		AfxMessageBox("Error file open!");
		return;
	}
	m_FEMengine.Action();
	m_FEMengine.Save("TrustOutput.txt");
}
