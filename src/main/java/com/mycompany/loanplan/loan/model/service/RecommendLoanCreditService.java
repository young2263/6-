package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;

public interface RecommendLoanCreditService {

		public List<RecommendLoanCredit> getRecommendLoanList(RecommendLoanCredit vo) throws Exception;
}
