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
	public RecommendLoanCreditReview selectRecommendLoanCreditReview(String m_id) {
		return recommendLoanCreditReviewDao.selectOne(m_id);
	}
	
	@Override
	public List<RecommendLoanCreditReview> selectList(int rl_cr_num) {
		return recommendLoanCreditReviewDao.selectList(rl_cr_num);
	}
	
	@Override
	public int insertRecommendLoanCreditReview(RecommendLoanCreditReview rlcrr) {
		return recommendLoanCreditReviewDao.insertRecommendLoanCreditReview(rlcrr);
	}

	@Override
	public int updateRecommendLoanCreditReview(RecommendLoanCreditReview rlcrr) {
		return recommendLoanCreditReviewDao.updateRecommendLoanCreditReview(rlcrr);
	}
	
	@Override
	public int deleteRecommendLoanCreditReview(RecommendLoanCreditReview rlcrr) {
		return recommendLoanCreditReviewDao.deleteRecommendLoanCreditReview(rlcrr);
	}
}
