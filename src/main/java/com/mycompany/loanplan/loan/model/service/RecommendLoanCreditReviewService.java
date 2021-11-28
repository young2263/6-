package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCreditReview;

public interface RecommendLoanCreditReviewService {

	public List<RecommendLoanCreditReview> listLoanCreditReview();
	public List<RecommendLoanCreditReview> selectCreditReviewList(int startPage, int limit);
	public int loanCreditReviewCount();
	public int insertRecommendLoanCharterReview(int rlcrnum);
}
