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
	public int listCount() {
		return recommendLoanReviewDao.listCount();
	}
	
	@Override
	public RecommendLoanReview selectOne(int rlnum) {
		return recommendLoanReviewDao.selectOne(rlnum);
	}
	
	@Override
	public List<RecommendLoanReview> selectList(int startPage, int limit) {
		return recommendLoanReviewDao.selectList(startPage, limit);
	}
	
	@Override
	public int insertRecommendLoanReview(RecommendLoanReview rlr) {
		return recommendLoanReviewDao.insertRecommendLoanReview(rlr);
	}
	
	@Override
	public int updateRecommendLoanReview(RecommendLoanReview rlr) {
		return recommendLoanReviewDao.updateRecommendLoanReview(rlr);
	}
	
	@Override
	public int deleteRecommendLoanReview(RecommendLoanReview rlr) {
		return recommendLoanReviewDao.deleteRecommendLoanReview(rlr);
	}
	
	
}
