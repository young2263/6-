package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;

public interface RecommendLoanCharterService {

	List<RecommendLoanCharter> listLoan();
	List<RecommendLoanCharter> selectList(int startPage, int limit);
	int loanCount();
}

