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
	public RecommendLoanReview selectRecommendLoanReview(String m_id) {
		return recommendLoanReviewDao.selectOne(m_id);
	}
	
	@Override
	public List<RecommendLoanReview> selectList(int rl_num) {
		return recommendLoanReviewDao.selectList(rl_num);
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
