package com.mycompany.loanplan.loan.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.loan.model.vo.RecommendLoan;

@Repository("recommendLoanDao")
public class RecommendLoanDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<RecommendLoan> selectList() {
		return sqlSession.selectList("RecommendLoan.listRecommendLoan");
	}
}
