package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanCharterReviewDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharterReview;

@Service("recommendLoanCharterReviewService")
public class RecommendLoanCharterReviewServiceImpl implements RecommendLoanCharterReviewService {

	@Autowired
	private RecommendLoanCharterReviewDao recommendLoanCharterReviewDao;
	
	@Override
	public List<RecommendLoanCharterReview> listLoanCharterReview() {
		return recommendLoanCharterReviewDao.listLoanCharterReview();
	}
	
	@Override
	public List<RecommendLoanCharterReview> selectCharterReviewList(int startPage, int limit) {
		return recommendLoanCharterReviewDao.selectCharterReviewList(startPage, limit);
	}
	
	@Override
	public int loanCharterReviewCount() {
		return recommendLoanCharterReviewDao.loanCharterReviewCount();
	}
	
	@Override
	public int insertRecommendLoanCharterReview(int rlchnum) {
		return recommendLoanCharterReviewDao.insertRecommendLoanCharterReview(rlchnum);
	}
}
