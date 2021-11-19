package com.mycompany.loanplan.loan.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;

@Repository("recommendLoanCreditDao")
public class RecommendLoanCreditDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<RecommendLoanCredit> selectRecommendLoanCredits() {
		return sqlSession.selectList("RecommendLoanCredit.listRecommendLoanCredit");
	}
}
