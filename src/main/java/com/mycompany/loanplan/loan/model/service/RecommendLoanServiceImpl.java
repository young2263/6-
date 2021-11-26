package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanReview;

@Service("recommendLoanService")
public class RecommendLoanServiceImpl implements RecommendLoanService {
	
	@Autowired
	private RecommendLoanDao recommendLoanDao;
	
	
	@Autowired
	
	@Override
	public List<RecommendLoan> listLoan() {
		return recommendLoanDao.listLoan();
	}
	
	@Override
	public List<RecommendLoan> selectList(int startPage, int limit) {
		return recommendLoanDao.selectList(startPage, limit);
	}
	
	@Override
	public int loanCount() {
		return recommendLoanDao.loanCount();
	}
	
	@Override
	public int recommendLoanDt(int rlnum) {
		return recommendLoanDao.recommendLoanDT(rlnum);
	}
}
