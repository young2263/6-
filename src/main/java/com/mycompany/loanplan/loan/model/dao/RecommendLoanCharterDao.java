package com.mycompany.loanplan.loan.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;

@Repository("recommendLoanCharterDao")
public class RecommendLoanCharterDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<RecommendLoanCharter> selectRecommendLoanCharters() {
		return sqlSession.selectList("RecommendLoanCharter.listRecommendLoanCharter");
	}

}
