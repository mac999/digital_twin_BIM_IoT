// CauFEMDoc.cpp : implementation of the CCauFEMDoc class
//

#include "stdafx.h"
#include "CauFEM.h"

#include "CauFEMDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CCauFEMDoc

IMPLEMENT_DYNCREATE(CCauFEMDoc, CDocument)

BEGIN_MESSAGE_MAP(CCauFEMDoc, CDocument)
	//{{AFX_MSG_MAP(CCauFEMDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCauFEMDoc construction/destruction

CCauFEMDoc::CCauFEMDoc()
{
	// TODO: add one-time construction code here

}

CCauFEMDoc::~CCauFEMDoc()
{
}

BOOL CCauFEMDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CCauFEMDoc serialization

void CCauFEMDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CCauFEMDoc diagnostics

#ifdef _DEBUG
void CCauFEMDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CCauFEMDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CCauFEMDoc commands
