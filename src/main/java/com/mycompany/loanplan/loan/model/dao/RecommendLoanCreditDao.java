package com.mycompany.loanplan.loan.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.loan.model.vo.RecommendLoan;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCreditReview;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanReview;

@Repository("recommendLoanCreditDao")
public class RecommendLoanCreditDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<RecommendLoanCredit> listLoan() {
		List<RecommendLoanCredit> rmd = new ArrayList<RecommendLoanCredit>();
		return sqlSession.selectList("RecommendLoanCredit.listRecommendLoanCredit");
	}
	
	public List<RecommendLoanCredit> selectList(int startPage, int limit) {
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<RecommendLoanCredit> volist = sqlSession.selectList("RecommendLoanCredit.selectList", null, row);
		System.out.println(volist);
		return volist;
	}
	
	public int loanCount() {
		return sqlSession.selectOne("RecommendLoanCredit.loanCount");
	}
	
	public List<RecommendLoanCredit> selectLoanDt() {
		return sqlSession.selectList("RecommendLoanCredit.recommendLoanCreditDt");
	}
}