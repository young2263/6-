package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCreditReview;

public interface RecommendLoanCreditService {

	List<RecommendLoanCredit> listLoan();
	List<RecommendLoanCredit> selectList(int startPage, int limit);
	int loanCount();
	int recommendLoanCreditDt(int rlchnum);
	public List<RecommendLoanCreditReview> listLoanCretitReview();
	public List<RecommendLoanCreditReview> selectCrReviewList(int startPage, int limit);
	public int loanCrReviewCount();
	public int insertRecommendLoanCrReview(int rlcrnum);
}

