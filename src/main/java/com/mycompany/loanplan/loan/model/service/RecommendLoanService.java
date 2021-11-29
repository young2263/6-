package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoan;

public interface RecommendLoanService {

	int loanCount();
	RecommendLoan selectLoanDt(int rlnum);
//	public List<RecommendLoan> listLoan();
	public List<RecommendLoan> selectList(int startPage, int limit);
}
