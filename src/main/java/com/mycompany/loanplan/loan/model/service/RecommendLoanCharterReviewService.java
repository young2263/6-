package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharterReview;

public interface RecommendLoanCharterReviewService {
	
	RecommendLoanCharterReview selectRecommendLoanCharterReview(String m_id);
	List<RecommendLoanCharterReview> selectList(int rl_ch_num);
	int insertRecommendLoanCharterReview(RecommendLoanCharterReview rlcr);
	int updateRecommendLoanCharterReview(RecommendLoanCharterReview rlcr);
	int deleteRecommendLoanCharterReview(RecommendLoanCharterReview rlcr);
}
