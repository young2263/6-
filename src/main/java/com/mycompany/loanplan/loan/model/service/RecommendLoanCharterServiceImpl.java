package com.mycompany.loanplan.loan.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.loanplan.loan.model.dao.RecommendLoanCharterDao;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;

@Service("recommendLoanCharterService")
@Transactional(rollbackFor = Exception.class)
public class RecommendLoanCharterServiceImpl implements RecommendLoanCharterService {
	@Autowired
	private RecommendLoanCharterDao recommendLoanCharterDao;
	
	public List<RecommendLoanCharter> getRecommendLoanList(RecommendLoanCharter vo) throws Exception {
		List<RecommendLoanCharter> volist = null;
		System.out.println(volist);
		
		return volist;
	}

}
