package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanCreditDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;

@Service("recommendLoanCreditService")
public class RecommendLoanCreditServiceImpl implements RecommendLoanCreditService {
	
	@Autowired
	private RecommendLoanCreditDao recommendLoanCreditDao;
	
	@Override
	public int loanCount() {
		return recommendLoanCreditDao.loanCount();
	}
	
	@Override
	public RecommendLoanCredit selectLoanCreditDt(int rlcrnum) {
		return recommendLoanCreditDao.selectLoanCreditDt(rlcrnum);
	}
	
//	@Override
//	public List<RecommendLoanCredit> listLoan() {
//		return recommendLoanCreditDao.listLoan();
//	}
	
	@Override
	public List<RecommendLoanCredit> selectList(int startPage, int limit) {
		return recommendLoanCreditDao.selectList(startPage, limit);
	}
	
}
