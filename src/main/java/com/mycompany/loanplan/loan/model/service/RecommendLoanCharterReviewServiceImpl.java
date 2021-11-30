package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanCharterDao;
import com.mycompany.loanplan.loan.model.dao.RecommendLoanCharterReviewDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharterReview;

@Service("recommendLoanCharterReviewService")
public class RecommendLoanCharterReviewServiceImpl implements RecommendLoanCharterReviewService {

	@Autowired
	private RecommendLoanCharterReviewDao recommendLoanCharterReviewDao;
	
	@Override
	public RecommendLoanCharterReview selectRecommendLoanCharterReview(String m_id) {
		return recommendLoanCharterReviewDao.selectOne(m_id);
	}
	
	@Override
	public List<RecommendLoanCharterReview> selectList(int rl_ch_num) {
		return recommendLoanCharterReviewDao.selectList(rl_ch_num);
	}
	
	@Override
	public int insertRecommendLoanCharterReview(RecommendLoanCharterReview rlcr) {
		return recommendLoanCharterReviewDao.insertRecommendLoanCharterReview(rlcr);
	}
	
	@Override
	public int updateRecommendLoanCharterReview(RecommendLoanCharterReview rlcr) {
		return recommendLoanCharterReviewDao.updateRecommendLoanCharterReview(rlcr);
	}
	
	@Override
	public int deleteRecommendLoanCharterReview(RecommendLoanCharterReview rlcr) {
		return recommendLoanCharterReviewDao.deleteRecommendLoanCharterReview(rlcr);
	}
}
