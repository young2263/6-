package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanCharterDao;
import com.mycompany.loanplan.loan.model.dao.RecommendLoanDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharterReview;

@Service("recommendLoanCharterService")
public class RecommendLoanCharterServiceImpl implements RecommendLoanCharterService {
	
	@Autowired
	private RecommendLoanCharterDao recommendLoanCharterDao;
	
	@Override
	public List<RecommendLoanCharter> listLoan() {
		return recommendLoanCharterDao.listLoan();
	}
	
	@Override
	public List<RecommendLoanCharter> selectList(int startPage, int limit) {
		return recommendLoanCharterDao.selectList(startPage, limit);
	}
	
	@Override
	public int loanCount() {
		return recommendLoanCharterDao.loanCount();
	}
	
	@Override
	public int recommendLoanCharterDt(int rlchnum) {
		return recommendLoanCharterDao.recommendLoanCharterDt(rlchnum);
	}
	
	@Override
	public List<RecommendLoanCharterReview> listLoanCharterReview() {
		return recommendLoanCharterDao.listLoanCharterReview();
	}
	
	@Override
	public List<RecommendLoanCharterReview> selectChReviewList(int startPage, int limit) {
		return recommendLoanCharterDao.selectChReviewList(startPage, limit);
	}
	
	@Override
	public int loanChReviewCount() {
		return recommendLoanCharterDao.loanChReviewCount();
	}
	
	@Override
	public int insertRecommendLoanChReview(int rlchnum) {
		return recommendLoanCharterDao.insertRecommendLoanChReview(rlchnum);
	}
}
