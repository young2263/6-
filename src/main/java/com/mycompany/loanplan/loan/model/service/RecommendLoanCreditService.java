package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;

public interface RecommendLoanCreditService {

	List<RecommendLoanCredit> listLoan();
	List<RecommendLoanCredit> selectList(int startPage, int limit);
	int loanCount();
}

