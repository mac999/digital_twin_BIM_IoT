#ifndef __CAU_FEM_ENGINE_H__
#define __CAU_FEM_ENGINE_H__
// 목적 : FEM 엔진
// 작성자 : 강태욱
// 작성일 : 2005.7.24

#include <AfxTempl.h>

// Constance define 
//
#define MAX_DEF_STR	256
#define DEF_METRIX_SIZE 6	// 임시로 3d truss에 맞춤.
#define FEM_ERROR_VALUE -1.

#define _BooLeq(c1, c2)	(fabs((c1) - (c2)) < 1.0E-6)
#define _BooLz(v1)		(fabs(v1) < 1.0E-6)
#define _POW2(v)	(v * v)

// FemVector class
//
#define MAX_DIM 3
class FemVector
{
public:
	FemVector();
	~FemVector();

public:
	double v[MAX_DIM];
};


// FemMetrix class
//
class FemEngine;
class FemElement;
class FemMetrix
{
public:
	FemMetrix(int iSize = DEF_METRIX_SIZE);
	virtual ~FemMetrix();
	void Dump();

	void Resize(int iSize);
	void Clear();
	int GetSize();

	void SetAt(int i, int j, double dValue);
	double GetAt(int i, int j);
	void SetFreeDegreeAt(int i, int iFreeDegree, bool bFixed);
	int GetFreeDegreeAt(int i);
	bool GetFixedAt(int i);
	bool GetFreeDegreePos(int& iRow, int& iCol);

	FemMetrix& operator*=(double dScalar);
	FemVector& operator*(FemVector& v);

	void CopyFrom(double aaMetrix[DEF_METRIX_SIZE][DEF_METRIX_SIZE]);
	void CopyFrom(FemMetrix& Src);
	void SetSymmetry();
	void Inverse();	// K^-1

public:
	bool Add(int i, int j, double& dValue);
	bool Add(FemMetrix& m);

	void Reduce();
	int GetReduceFreeDegreeSize();

private:
	int m_iSize;

	#define MAX_METRIX_SIZE 128
	double* m_pMetrix[MAX_METRIX_SIZE];
	bool m_abFixed[MAX_METRIX_SIZE];
	int m_aiFreeDegree[MAX_METRIX_SIZE];
};


// FemVertex class
//
class FemVertex
{
public:
	FemVertex(FemEngine* pEngine);
	~FemVertex();

	void SetFixed(int iIndex, bool bFixed);
	bool IsFixed(int iIndex);
	void SetCoord(int iIndex, double dValue);
	double GetCoord(int iIndex);
	void SetForce(int iIndex, double dForce);
	double GetForce(int iIndex);

	double GetLength(FemVertex* pVertex);
	enum AxisPlaneType
	{
		eAxisX = 0,
		eAxisY,
		eAxisZ
	};
	double GetCosineAt(int iAxis, FemVertex* pVertex);

	virtual void Dump();

protected:
	bool m_abFixed[MAX_DIM];	// 제약조건
	double m_aCoord[MAX_DIM];	// 좌표
	double m_aForce[MAX_DIM];	// 외력
	// double m_aMoment[MAX_DIM];	// 

	FemEngine* m_pEngine;
};

// class FemElement
//
class FemElement
{
public:
	FemElement(FemEngine* pEngine);
	~FemElement();

	enum MaturialType
	{
		eElastic = 0,	// 탄성
		eArea = 1,		// 면적
		eMaxMaturial	
	};
	void SetMaturial(FemElement::MaturialType eType, double dValue);
	virtual bool GetK(FemMetrix& mK);
	virtual bool GetForce(FemVector& vForce);

	virtual void Dump();

protected:
	double m_adMaturial[FemElement::eMaxMaturial];
	FemMetrix m_m;

	FemEngine* m_pEngine;
};

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
class FemTrussElement : public FemElement	// 트러스트
{
public:
	FemTrussElement(FemEngine* pEngine);

	void SetVertex(int iNo, int iVertex);
	int GetVertexIndex(int iNo);
	FemVertex* GetVertex(int iNo);

	double GetLength();
	double GetCosineAt(int iAxis);

	virtual bool GetK(FemMetrix& mK);

private:
	int m_aVertexIndex[2];
};

// FemSolid class
//
// class FemSolidElement : public FemElement
// {
// public:
// 	FemSolid();
// 	
// 	void DivideElement();	// 요소분할
// }
 
// FemEngine class
//
#define MAX_FEM_VERTEX  200
#define MAX_FEM_ELEMENT 100
class FemEngine	// Vertex 방식. 2차원 면방식은 따로 만들겠음.
{
public:
	FemEngine();
	~FemEngine();

	bool Init();
	bool Load(const char* szInputFile);
	void Action();
	void Save(const char* szOutputFile);

	bool AddVertex(FemVertex* pVertex);
	int GetVertexCount();
	FemVertex* GetVertexAt(int iIndex);
	void ClearVertex();

	bool AddElement(FemElement* pEle);
	int GetElementCount();
	FemElement* GetElementAt(int iIndex);
	void ClearElement();

protected:
	virtual bool Solve(FemMetrix& FullMetrix, FemVector& vDelta);
	virtual void GetForce(FemMetrix& mK, FemVector &vForce);	// F = Kd 에서 d를 계산

private:
	CString m_sTitle;
	CArray<FemVertex*, FemVertex*> m_aVertex;
	CArray<FemElement*, FemElement*> m_aElement;
};


// 작업 계획
//
// 1. 먼저 p154를 참고해 트러스 FEM을 만든다.
// 2. 1 완성후 이를 기반으로 평면 프레임/격자 해석 FEM을 만든다.
// 3. 2D 삼각형 모형에서 FEM을 만든다.
//
  
#endif
