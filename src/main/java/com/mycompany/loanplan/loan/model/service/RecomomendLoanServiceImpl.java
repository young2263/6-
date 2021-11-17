package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;

@Service("recommendLoanService")
@Transactional(rollbackFor = Exception.class)
public class RecomomendLoanServiceImpl implements RecommendLoanService {
	@Autowired
	private RecommendLoanDao recommendLoanDao;
	
	public List<RecommendLoan> getRecommendLoans(RecommendLoan vo) throws Exception {
		List<RecommendLoan> volist = null;
		System.out.println(volist);
		
		return volist;
	}
}
