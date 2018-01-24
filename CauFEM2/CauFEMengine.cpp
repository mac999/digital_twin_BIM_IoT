#include "StdAfx.h"
#include <math.h>
#include "CauFemEngine.h"

// FemMetrix class
//
FemMetrix::FemMetrix(int iSize)
{
	Resize(iSize);
}

FemMetrix::~FemMetrix()
{
	Clear();
}

void FemMetrix::Resize(int iSize)
{
	Clear();

	for(int i = 0; i < iSize; i++)
	{
		m_pMetrix[i] = new double[iSize];
		memset(m_pMetrix[i], 0, sizeof(double) * iSize);
	}

	m_iSize = iSize;

	memset(m_aiFreeDegree, 0, sizeof(m_aiFreeDegree));
	for(i = 0; i < iSize; i++)
		m_aiFreeDegree[i] = i;

	memset(m_abFixed, 0, sizeof(m_abFixed));
}

void FemMetrix::Clear()
{
	for(int i = 0; i < m_iSize; i++)
	{
		if(m_pMetrix[i] == NULL)
			continue;
		delete [] m_pMetrix[i];
		m_pMetrix[i] = NULL;
	}
}

int FemMetrix::GetSize()
{
	return m_iSize;
}

void FemMetrix::SetAt(int i, int j, double dValue)
{
	if(i < 0 || i >= m_iSize)
		return;
	if(j < 0 || j >= m_iSize)
		return;

	m_pMetrix[i][j] = dValue;
}

double FemMetrix::GetAt(int i, int j)
{
	if(i < 0 || i >= m_iSize)
		return 0.;
	if(j < 0 || j >= m_iSize)
		return 0.;

	return m_pMetrix[i][j];
}

void FemMetrix::SetFreeDegreeAt(int i, int iFreeDegree, bool bFixed)
{
	if(i < 0 || i >= m_iSize)
		return;
	m_aiFreeDegree[i] = iFreeDegree;
	m_abFixed[i] = bFixed;
}

int FemMetrix::GetFreeDegreeAt(int i)
{
	if(i < 0 || i >= m_iSize)
		return -1;
	return m_aiFreeDegree[i];
}

bool FemMetrix::GetFixedAt(int i)
{
	if(i < 0 || i >= m_iSize)
		return false;
	return m_abFixed[i];
}

bool FemMetrix::GetFreeDegreePos(int& iRow, int& iCol)
{
	if(iRow < 0 || iRow >= m_iSize)
		return false;
	if(iCol < 0 || iCol >= m_iSize)
		return false;
	iRow = abs(m_aiFreeDegree[iRow]);
	iCol = abs(m_aiFreeDegree[iCol]);
	return true;
}

FemMetrix& FemMetrix::operator*=(double dScalar)
{
	for(int iRow = 0; iRow < m_iSize; iRow++)
	{	 
		for(int iCol = 0; iCol < m_iSize; iCol++)
		{
			m_pMetrix[iRow][iCol] *= dScalar;
		}
	}
	return *this;
}

FemVector& FemMetrix::operator*(FemVector& v)
{
	return v;
}

void FemMetrix::CopyFrom(double aaMetrix[DEF_METRIX_SIZE][DEF_METRIX_SIZE])
{
	for(int i = 0; i < DEF_METRIX_SIZE; i++)
	{
		memcpy(m_pMetrix[i], aaMetrix[i], sizeof(double) * DEF_METRIX_SIZE);
	}
}

void FemMetrix::CopyFrom(FemMetrix& Src)
{
	Clear();
	Resize(Src.GetSize());

	for(int iRow = 0; iRow < m_iSize; iRow++)
	{	 
		m_abFixed[iRow] = Src.GetFixedAt(iRow);
		m_aiFreeDegree[iRow] = Src.GetFreeDegreeAt(iRow);

		for(int iCol = 0; iCol < m_iSize; iCol++)
			m_pMetrix[iRow][iCol] = Src.GetAt(iRow, iCol);
	}
}

void FemMetrix::SetSymmetry()
{
	for(int iRow = 0; iRow < m_iSize; iRow++)
	{	 
		for(int iCol = iRow + 1; iCol < m_iSize; iCol++)
		{
			m_pMetrix[iCol][iRow] = m_pMetrix[iRow][iCol];
		}
	}
}

void FemMetrix::Inverse()	// K^-1
{
}

bool FemMetrix::Add(int i, int j, double& dValue)
{
	if(i < 0 || i >= m_iSize)
		return false;
	if(j < 0 || j >= m_iSize)
		return false;

	double dValue1 = GetAt(i, j);
	SetAt(i, j, dValue + dValue1);
	return true;
}

bool FemMetrix::Add(FemMetrix& m)
{
	for(int i = 0; i < m.GetSize(); i++)
	{
		for(int j = 0; j < m.GetSize(); j++)
		{
			double dValue = m.GetAt(i, j);
			int iRow = i;
			int iCol = j;
			m.GetFreeDegreePos(iRow, iCol);
			if(Add(iRow, iCol, dValue) == false)
				return false;

			bool bFixed = m.GetFixedAt(j);

			SetFreeDegreeAt(iCol, iCol, bFixed);
		}
	}

	return true;
}

int FemMetrix::GetReduceFreeDegreeSize()
{
	int iCount = 0;
	for(int i = 0; i < m_iSize; i++)
	{
		if(m_abFixed[i] == false)
			iCount++;
	}

	return iCount;
}

void FemMetrix::Reduce()
{
	int iFreeDegree = GetReduceFreeDegreeSize();
	FemMetrix mReduce;
	mReduce.Resize(iFreeDegree);

	int iRealRow, iRealCol;
	iRealRow = iRealCol = 0;
	for(int iRow = 0; iRow < m_iSize; iRow++)
	{
		bool bFixed = m_abFixed[iRow];
		if(bFixed)
			continue;
		iRealCol = 0;
		for(int iCol = 0; iCol < m_iSize; iCol++)
		{
			bool bFixed = m_abFixed[iCol];
			if(bFixed)
				continue;

			int iFreeDegree = m_aiFreeDegree[iCol];
			mReduce.SetFreeDegreeAt(iRealCol, iFreeDegree, false);
			double dValue = m_pMetrix[iRow][iCol];
			mReduce.SetAt(iRealRow, iRealCol, dValue);

			iRealCol++;
		}
		iRealRow++;
	}

	CopyFrom(mReduce);
}

void FemMetrix::Dump()
{
	TRACE("\n* Dump Metrix\n");
	for(int iCol = 0; iCol < m_iSize; iCol++)
		TRACE("[%d-%c],", m_aiFreeDegree[iCol], m_abFixed[iCol] ? 'Y' : 'N');
	TRACE("\n");
	for(int iRow = 0; iRow < m_iSize; iRow++)
	{	 
		for(int iCol = 0; iCol < m_iSize; iCol++)
			TRACE("%.2f,", m_pMetrix[iRow][iCol]);
		TRACE("\n");
	}
}


// FemVector
//
FemVector::FemVector()
{
}

FemVector::~FemVector()
{
}



// FemVertex
//
FemVertex::FemVertex(FemEngine* pEngine)
{
	m_pEngine = pEngine;
	memset(m_abFixed, 0, sizeof(m_abFixed));
	memset(m_aCoord, 0, sizeof(m_aCoord));
	memset(m_aForce, 0, sizeof(m_aForce));
}

FemVertex::~FemVertex()
{

}

void FemVertex::SetFixed(int iIndex, bool bFixed)
{
	if(iIndex < 0 || iIndex >= MAX_DIM)
		return;
	m_abFixed[iIndex] = bFixed;
}

bool FemVertex::IsFixed(int iIndex)
{
	if(iIndex < 0 || iIndex >= MAX_DIM)
		return true;

	return m_abFixed[iIndex];
}

void FemVertex::SetCoord(int iIndex, double dValue)
{
	if(iIndex < 0 || iIndex >= MAX_DIM)
		return;
	m_aCoord[iIndex] = dValue;
}

double FemVertex::GetCoord(int iIndex)
{
	if(iIndex < 0 || iIndex >= MAX_DIM)
		return true;

	return m_aCoord[iIndex];
}

void FemVertex::SetForce(int iIndex, double dForce)
{
	if(iIndex < 0 || iIndex >= MAX_DIM)
		return;
	m_aForce[iIndex] = dForce;
}

double FemVertex::GetForce(int iIndex)
{
	if(iIndex < 0 || iIndex >= MAX_DIM)
		return true;

	return m_aForce[iIndex];
}

double FemVertex::GetLength(FemVertex* pVertex)
{
	double dTotal = 0.;
	for(int i = 0; i < MAX_DIM; i++)
	{
		double dDelta = pVertex->GetCoord(i) - m_aCoord[i];
		dDelta *= dDelta;
		dTotal += dDelta;
	}
	return sqrt(dTotal);
}

double FemVertex::GetCosineAt(int iAxis, FemVertex* pVertex)
{
	if(iAxis < 0 || iAxis >= MAX_DIM)
		return FEM_ERROR_VALUE;
	double dLength = GetLength(pVertex);
	if(_BooLz(dLength))
		return FEM_ERROR_VALUE;

	return (pVertex->GetCoord(iAxis) - m_aCoord[iAxis]) / dLength;
}

void FemVertex::Dump()
{
}



// FemElement class
//
FemElement::FemElement(FemEngine* pEngine)
{
	m_pEngine = pEngine;
}

FemElement::~FemElement()
{
}

void FemElement::SetMaturial(MaturialType eType, double dValue)
{
	if(eType < 0 || eType >= eMaxMaturial)
		return;
	m_adMaturial[eType] = dValue;
}

bool FemElement::GetK(FemMetrix& mK)
{
	return false;
}

bool FemElement::GetForce(FemVector& vForce)
{
	return false;
}

void FemElement::Dump()
{
}



// FemBeamElement class
//
// class FemBeamElement : public FemElement
// {
// public:
// 	virtual bool GetK(FemMetrix& mK);
// };

// FemBarElement class
//
// #define MAX_BAR_VERTEX 2;
// class FemBarElement : public FemElement		// 봉
// {
// public:
// 	virtual bool GetK(FemMetrix& mK);
// 
// private:
// 	int m_aVertex[MAX_BAR_VERTEX];
// };

// FemBeamElement class
//
// class FemBeamElement : public FemElement	// 보
// {
// public:
// 	virtual bool GetK(FemMetrix& mK);
// };
// 

// FemTrussElement class
//
FemTrussElement::FemTrussElement(FemEngine* pEngine)
	: FemElement(pEngine)
{
}

void FemTrussElement::SetVertex(int iNo, int iVertex)
{
	if(iNo < 0 || iNo >= 2)
		return;
	m_aVertexIndex[iNo] = iVertex;
}

int FemTrussElement::GetVertexIndex(int iNo)
{
	if(iNo < 0 || iNo >= 2)
		return -1;
	return m_aVertexIndex[iNo];
}

FemVertex* FemTrussElement::GetVertex(int iNo)
{
	int iVertex = GetVertexIndex(iNo);
	if(iVertex < 0)
		return NULL;
	return m_pEngine->GetVertexAt(iVertex);
}

double FemTrussElement::GetLength()
{
	FemVertex* pVertex1 = GetVertex(0);
	FemVertex* pVertex2 = GetVertex(1);
	if(pVertex1 == NULL || pVertex2 == NULL)
		return FEM_ERROR_VALUE;
	return pVertex1->GetLength(pVertex2);
}

double FemTrussElement::GetCosineAt(int iAxis)
{
	FemVertex* pVertex1 = GetVertex(0);
	FemVertex* pVertex2 = GetVertex(1);
	if(pVertex1 == NULL || pVertex2 == NULL)
		return FEM_ERROR_VALUE;
	return pVertex1->GetCosineAt(iAxis, pVertex2);
}

bool FemTrussElement::GetK(FemMetrix& mK)
{
	// 물성 얻기
	//
	double dLength = GetLength();

	// 각 좌표축별 cosine 값 얻기
	//
	double aC[MAX_DIM];
	for(int i = 0; i < MAX_DIM; i++)
		aC[i] = GetCosineAt(i);

	double dMetrix[DEF_METRIX_SIZE][DEF_METRIX_SIZE] =
    {
		{_POW2(aC[0]), aC[0] * aC[1], aC[0] * aC[2], -1. * _POW2(aC[0]) , -1. * aC[0] * aC[1], -1. * aC[0] * aC[2]},
		{0.,	   	    _POW2(aC[1]), aC[1] * aC[2], -1. * aC[0] * aC[1], -1. *  _POW2(aC[1]), -1. * aC[1] * aC[2]},
		{0., 0.,			   		   _POW2(aC[2]), -1. * aC[0] * aC[2], -1. * aC[1] * aC[2],  -1. * _POW2(aC[2])},
		{0., 0., 0.,								        _POW2(aC[0]),       aC[0] * aC[1],       aC[0] * aC[2]},
		{0., 0., 0., 0.,												         _POW2(aC[1]),       aC[1] * aC[2]},
		{0., 0., 0., 0., 0.,																		  _POW2(aC[2])},
	};

	double dMaturial = (m_adMaturial[eArea] * m_adMaturial[eElastic]) / dLength;
	mK.CopyFrom(dMetrix);
	mK *= dMaturial;
	mK.SetSymmetry();


	// Set FreeDegreeId
	//
	for(i = 0; i < 2; i++)
	{
		int iVertex = m_aVertexIndex[i];
		FemVertex* pVertex = m_pEngine->GetVertexAt(iVertex);
		if(pVertex == NULL)
			break;

		iVertex *= 3;
		for(int j = 0; j < MAX_DIM; j++)
		{
			bool bFixed = pVertex->IsFixed(j);
			int iFreeDegree = iVertex + j;
			mK.SetFreeDegreeAt(i * 3 + j, iFreeDegree, bFixed);
		}
	}

	return true;
}


// FemEngine class
//
FemEngine::FemEngine()
{
}

FemEngine::~FemEngine()
{
	ClearVertex();
	ClearElement();
}


bool FemEngine::Init()
{
	return true;
}

// Data sample
//
// SPACE TRUSS EXAMPLE OF SECTION
// 3,4
// 1,0,1,0,72.0,0.,0.,0.,0.,-1000.0
// 2,1,1,1,0.0,36.0,0.,0.,0.,0.
// 3,1,1,1,0.0,36.0,72.0,0.,0.,0.
// 4,1,1,1,0.0,0.0,-48.0,0.,0.,0.
// 1,1,4,1.2E+6,0.187
// 2,1,2,1.2E+6,0.302
// 3,1,3,1.2E+6,0.726
// 

void _GetToken(char* szLine, const char* sSeps, CStringArray& saToken)
{
	saToken.RemoveAll();

   /* Establish string and get the first token: */
   char* token = strtok(szLine, sSeps);
   while(token)
   {
		saToken.Add(token);
		token = strtok(NULL, sSeps);
   }
}

bool FemEngine::Load(const char* szInputFile)
{
	CStdioFile DataFile;
	if(DataFile.Open(szInputFile, CStdioFile::modeRead) == FALSE)
		return false;
	
	// Read title
	char szLine[MAX_DEF_STR];
	DataFile.ReadString(szLine, sizeof(szLine));
	m_sTitle = szLine;

	// Read element, vertex count
	DataFile.ReadString(szLine, sizeof(szLine));
	CStringArray saToken;
	_GetToken(szLine, ",", saToken);
	if(saToken.GetSize() < 2)
		return false;

	int iEleCount = atoi(saToken[0]);
	int iVertexCount = atoi(saToken[1]);

	// read vertex data
	//   j, ifix(1,j), ifix(2,j), ifix(3,j), xc(j), yc(j), zc(j), force(1,j), force(2,j), force(3,j)
	#define MAX_VERTEX_DATA 10
	for(int i = 0; i < iVertexCount; i++)
	{
		DataFile.ReadString(szLine, sizeof(szLine));
		_GetToken(szLine, ",", saToken);

		if(saToken.GetSize() < MAX_VERTEX_DATA)
		{
			AfxMessageBox("Vertex data error!");
			break;
		}

		FemVertex* pVertex = new FemVertex(this);
		if(pVertex == NULL)
		{
			AfxMessageBox("Memory error!");
			break;
		}
		for(int iAxis = 0; iAxis < MAX_DIM; iAxis++)
		{
			bool bFixed = atoi(saToken[1 + iAxis]) ? true : false;
			pVertex->SetFixed(iAxis, bFixed);

			double dCoord = atof(saToken[4 + iAxis]);
			pVertex->SetCoord(iAxis, dCoord);

			double dForce = atof(saToken[7 + iAxis]);
			pVertex->SetForce(iAxis, dForce);
		}
		AddVertex(pVertex);
	}

	// read element
	//   k, node(1,k), node(2,k), E(k), A(k)
	#define MAX_ELEMENT_DATA 5
	for(i = 0; i < iEleCount; i++)
	{
		FemTrussElement* pEle = new FemTrussElement(this);
		if(pEle == NULL)
			break;

		DataFile.ReadString(szLine, sizeof(szLine));
		_GetToken(szLine, ",", saToken);

		if(saToken.GetSize() < MAX_ELEMENT_DATA)
		{
			AfxMessageBox("Element data error!");
			break;
		}

		for(int iNo = 0; iNo < 2; iNo++)
		{
			int iIndex = atoi(saToken[1 + iNo]);
			pEle->SetVertex(iNo, iIndex - 1);
		}

		double dElatic = atof(saToken[3]);
		pEle->SetMaturial(FemElement::eElastic, dElatic);

		double dArea = atof(saToken[4]);
		pEle->SetMaturial(FemElement::eArea, dArea);

		AddElement(pEle);
	}

	DataFile.Close();

#ifdef _DEBUG
	for(i = 0; i < GetVertexCount(); i++)
	{
		FemVertex* pVertex = GetVertexAt(i);
		pVertex->Dump();
	}

	for(i = 0; i < GetElementCount(); i++)
	{
		FemElement* pElement = GetElementAt(i);
		pElement->Dump();
	}
#endif

	return true;
}

void FemEngine::Action()
{
	// 참고 : p153, p359.
	//

	// 변위경계조건을 적용해 전체 강성행렬과 하중벡터를 수정
	// 
	FemMetrix FullMetrix;
	FemVector vDelta;
	Solve(FullMetrix, vDelta);	// m_aVertex의 Force고려.

	// Kd = F에서 d를 계산
	//
	FemVector vForce;
	GetForce(FullMetrix, vForce);

	// 요소내 응력 계산
	//
	FemVector vEleForce;
	for(int iEle = 0; iEle < m_aElement.GetSize(); iEle++)
	{
		m_aElement[iEle]->GetForce(vEleForce);
	}
}

void FemEngine::Save(const char* szOutputFile)
{
}

bool FemEngine::AddVertex(FemVertex* pVertex)
{
	m_aVertex.Add(pVertex);
	return true;
}

int FemEngine::GetVertexCount()
{
	return m_aVertex.GetSize();
}

FemVertex* FemEngine::GetVertexAt(int iIndex)
{
	if(iIndex < 0 || iIndex >= m_aVertex.GetSize())
		return NULL;
	return m_aVertex[iIndex];
}

void FemEngine::ClearVertex()
{
	for(int i = 0; i < m_aVertex.GetSize(); i++)
		delete m_aVertex[i];
	m_aVertex.RemoveAll();
}

bool FemEngine::AddElement(FemElement* pEle)
{
	m_aElement.Add(pEle);
	return true;
}

int FemEngine::GetElementCount()
{
	return m_aElement.GetSize();
}

FemElement* FemEngine::GetElementAt(int iIndex)
{
	if(iIndex < 0 || iIndex >= m_aElement.GetSize())
		return NULL;
	return m_aElement[iIndex];
}

void FemEngine::ClearElement()
{
	for(int i = 0; i < m_aElement.GetSize(); i++)
		delete m_aElement[i];
	m_aElement.RemoveAll();
}

bool FemEngine::Solve(FemMetrix& FullMetrix, FemVector& vDelta)	// 변위경계조건을 적용해 전체 강성행렬과 하중벡터를 수정
{
	// 각 요소에서 K를 구해 매트릭스 구함
	//
	FullMetrix.Resize(MAX_DIM * m_aVertex.GetSize());
	for(int iEle = 0; iEle < m_aElement.GetSize(); iEle++)
	{
		FemElement* pEle = m_aElement[iEle];
		FemMetrix m;
		if(pEle->GetK(m) == false)
			return false;
		m.Dump();

		if(FullMetrix.Add(m) == false)	// 전체 강성행렬 구함.
			return false;
	}
	FullMetrix.Dump();

	// 제약조건이 있을때, 변위 0.일때 그 부분의 행, 열을 삭제
	//
	FullMetrix.Reduce();	
	FullMetrix.Dump();
	return true;
}

void FemEngine::GetForce(FemMetrix& mK, FemVector& vDelta)	// F = Kd 에서 d를 계산
{
	FemVector vForce;
	for(int i = 0; i < mK.GetSize(); i++)
	{
		int iFreeDegree = mK.GetFreeDegreeAt(i);

		int iVertexIndex = iFreeDegree / MAX_DIM;
		FemVertex* pVertex = GetVertexAt(iVertexIndex);
		if(pVertex == NULL)
			return;
		double dForce = pVertex->GetForce(iFreeDegree % 3);
		vForce.v[iFreeDegree] = dForce;
	}

	mK.Inverse();	// K^-1
	vDelta = mK * vForce;	// d = K^-1 * F
}




