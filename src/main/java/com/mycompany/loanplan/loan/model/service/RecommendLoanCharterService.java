package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharterReview;

public interface RecommendLoanCharterService {

	List<RecommendLoanCharter> listLoan();
	List<RecommendLoanCharter> selectList(int startPage, int limit);
	int loanCount();
	int recommendLoanCharterDt(int rlchnum);
	public List<RecommendLoanCharterReview> listLoanCharterReview();
	public List<RecommendLoanCharterReview> selectChReviewList(int startPage, int limit);
	public int loanChReviewCount();
	public int insertRecommendLoanChReview(int rlchnum);
}

