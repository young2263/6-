package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCreditReview;

public interface RecommendLoanCreditReviewService {

	RecommendLoanCreditReview selectRecommendLoanCreditReview(String m_id);
	List<RecommendLoanCreditReview> selectList(int rl_cr_num);
	int insertRecommendLoanCreditReview(RecommendLoanCreditReview rlcrr);
	int updateRecommendLoanCreditReview(RecommendLoanCreditReview rlcrr);
	int deleteRecommendLoanCreditReview(RecommendLoanCreditReview rlcrr);
}
