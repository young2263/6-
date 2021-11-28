package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanReviewDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanReview;


@Service("recommendLoanReviewService")
public class RecommendLoanReviewServiceImpl implements RecommendLoanReviewService {
	
	@Autowired
	private RecommendLoanReviewDao recommendLoanReviewDao;
	
	@Override
	public List<RecommendLoanReview> listLoanReview() {
		return recommendLoanReviewDao.listLoanReview();
	}
	
	@Override
	public List<RecommendLoanReview> selectReviewList(int startPage, int limit) {
		return recommendLoanReviewDao.selectReviewList(startPage, limit);
	}
	
	@Override
	public int loanReviewCount() {
		return recommendLoanReviewDao.loanReviewCount();
	}
	
	@Override
	public int insertRecommendLoanReview(RecommendLoanReview r) {
		return recommendLoanReviewDao.insertRecommendLoanReview(r);
	}
	
	@Override
	public void updateRecommendLoanReview(RecommendLoanReview r) {
		recommendLoanReviewDao.updateRecommendLoanReview(r);
	}
	
	@Override
	public void deleteRecommendLoanReview(RecommendLoanReview r) {
		recommendLoanReviewDao.deleteRecommendLoanReview(r);
	}
}
