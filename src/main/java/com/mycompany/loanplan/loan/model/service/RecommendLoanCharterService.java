package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;

public interface RecommendLoanCharterService {

	int loanCount();
	RecommendLoanCharter recommendLoanCharterDt(int rlchnum);
//	public List<RecommendLoanCharter> listLoanCharter();
	public List<RecommendLoanCharter> selectList(int startPage, int limit);
}

