package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharterReview;

public interface RecommendLoanCharterReviewService {
	
	public List<RecommendLoanCharterReview> listLoanCharterReview();
	public List<RecommendLoanCharterReview> selectCharterReviewList(int startPage, int limit);
	public int loanCharterReviewCount();
	public int insertRecommendLoanCharterReview(int rlchnum);
}
