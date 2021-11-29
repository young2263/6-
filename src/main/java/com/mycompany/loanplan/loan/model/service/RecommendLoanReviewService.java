package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanReview;

public interface RecommendLoanReviewService {
	
	RecommendLoanReview selectRecommendLoanReview(String m_id);
	List<RecommendLoanReview> selectList(int rl_num);
	int insertRecommendLoanReview(RecommendLoanReview rlr);
	int updateRecommendLoanReview(RecommendLoanReview rlr);
	int deleteRecommendLoanReview(RecommendLoanReview rlr);
}
