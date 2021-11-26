package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoan;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanReview;

public interface RecommendLoanService {

	public List<RecommendLoan> listLoan();
	public List<RecommendLoan> selectList(int startPage, int limit);
	public int loanCount();
	int recommendLoanDt(int rlnum);
}
