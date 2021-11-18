package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;

public interface RecommendLoanCharterService {

	public List<RecommendLoanCharter> getRecommendLoanList(RecommendLoanCharter vo) throws Exception;
}
