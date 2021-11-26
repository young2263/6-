package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanCreditDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCreditReview;

@Service("recommendLoanCreditService")
public class RecommendLoanCreditServiceImpl implements RecommendLoanCreditService {
	
	@Autowired
	private RecommendLoanCreditDao recommendLoanCreditDao;
	
	@Override
	public List<RecommendLoanCredit> listLoan() {
		return recommendLoanCreditDao.listLoan();
	}
	
	@Override
	public List<RecommendLoanCredit> selectList(int startPage, int limit) {
		return recommendLoanCreditDao.selectList(startPage, limit);
	}
	
	@Override
	public int loanCount() {
		return recommendLoanCreditDao.loanCount();
	}
	
	@Override
	public int recommendLoanCreditDt(int rlchnum) {
		return recommendLoanCreditDao.recommendLoanCreditDt(rlchnum);
	}
	
	@Override
	public List<RecommendLoanCreditReview> listLoanCretitReview() {
		return recommendLoanCreditDao.listLoanCretitReview();
	}
	
	@Override
	public List<RecommendLoanCreditReview> selectCrReviewList(int startPage, int limit) {
		return recommendLoanCreditDao.selectCrReviewList(startPage, limit);
	}
	
	@Override
	public int loanCrReviewCount() {
		return recommendLoanCreditDao.loanCrReviewCount();
	}
	
	@Override
	public int insertRecommendLoanCrReview(int rlcrnum) {
		return recommendLoanCreditDao.insertRecommendLoanCrReview(rlcrnum);
	}
}
