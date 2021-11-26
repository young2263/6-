package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanReview;

public interface RecommendLoanReviewService {
	
	public List<RecommendLoanReview> listLoanReview();
	public List<RecommendLoanReview> selectReviewList(int startPage, int limit);
	public int loanReviewCount();
	public int insertRecommendLoanReview(int rlnum);

}
