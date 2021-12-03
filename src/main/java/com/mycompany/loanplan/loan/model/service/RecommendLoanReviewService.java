package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanReview;

public interface RecommendLoanReviewService {
	
	int listCount();
	RecommendLoanReview selectOne(int rlnum);
	public List<RecommendLoanReview> selectList(int startPage, int limit);
	int insertRecommendLoanReview(RecommendLoanReview rlr);
	int updateRecommendLoanReview(RecommendLoanReview rlr);
	int deleteRecommendLoanReview(RecommendLoanReview rlr);
}
