package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoan;

public interface RecommendLoanService {

	List<RecommendLoan> listLoan();
	List<RecommendLoan> selectList(int startPage, int limit);
	int loanCount();
	String recommendLoanDt();
}
