package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;

@Service("recommendLoanService")
public class RecommendLoanServiceImpl implements RecommendLoanService {
	
	@Autowired
	private RecommendLoanDao recommendLoanDao;
	
	public List<RecommendLoan> selectRecommendLoans() {
		return recommendLoanDao.selectRecommendLoans();
	}
}
