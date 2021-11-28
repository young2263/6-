package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanCreditReviewDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCreditReview;

@Service("recommendLoanCreditReviewService")
public class RecommendLoanCreditReviewServiceImpl implements RecommendLoanCreditReviewService{

	@Autowired
	private RecommendLoanCreditReviewDao recommendLoanCreditReviewDao;
	
	@Override
	public List<RecommendLoanCreditReview> listLoanCreditReview() {
		return recommendLoanCreditReviewDao.listLoanCreditReview();
	}
	
	@Override
	public List<RecommendLoanCreditReview> selectCreditReviewList(int startPage, int limit) {
		return recommendLoanCreditReviewDao.selectCreditReviewList(startPage, limit);
	}
	
	@Override
	public int loanCreditReviewCount() {
		return recommendLoanCreditReviewDao.loanCreditReviewCount();
	}
	
	@Override
	public int insertRecommendLoanCharterReview(int rlcrnum) {
		return recommendLoanCreditReviewDao.insertRecommendLoanCharterReview(rlcrnum);
	}
}
