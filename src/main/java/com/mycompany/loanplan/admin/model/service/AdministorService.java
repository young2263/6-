package com.mycompany.loanplan.admin.model.service;

import java.util.List;

import com.mycompany.loanplan.admin.model.vo.Administor;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;

public interface AdministorService {	

	//리스트
	List<Administor> listLoan();
	List<Administor> selectList(int startPage, int limit);
	List<RecommendLoanCharter> recommendLoanCharterList(int startPage, int limit);
	List<RecommendLoanCredit> recommendLoanCreditList(int startPage, int limit);
	List<Administor> recommendLoan(int startPage, int limit);
	List<RecommendLoanCredit> recommendLoanCreditListDetail(int NUM);
	List<RecommendLoanCharter> recommendLoanCharterListDetail(int NUM);
	List<Administor> recommendLoanDetail(int NUM);
	
	//카운트
	int loanCount();
	int loancreditCount();
	int loancharterCount();
	
	//추가
	int guarInsert(RecommendLoan rm);
	int creditInsert(RecommendLoanCredit rmc);
	int geonInsert(RecommendLoanCharter rmct);
	
	//삭제
	int deleteLoan(int RL_NUM);
	int deleteCredit(int RL_CR_NUM);
	int deleteCharter(int RL_CH_NUM);
	
	//수정
	public int modifyLoan(RecommendLoan list);
	public int modifyCredit(RecommendLoanCredit list);
	public int modifyCharter(RecommendLoanCharter list);
}
