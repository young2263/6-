package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanCreditDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;

@Service("recommendLoanCreditService")
@Transactional(rollbackFor = Exception.class)
public class RecommendLoanCreditServiceImpl implements RecommendLoanCreditService {
	@Autowired
	private RecommendLoanCreditDao recommendLoanCreditDao;
	
	public List<RecommendLoanCredit> selectRecommendLoanCredits() {
		return recommendLoanCreditDao.selectRecommendLoanCredits();
	}
}
