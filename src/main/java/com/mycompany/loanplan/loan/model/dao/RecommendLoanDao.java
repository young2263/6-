package com.mycompany.loanplan.loan.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.loan.model.vo.RecommendLoan;

@Repository("recommendLoanDao")
public class RecommendLoanDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int loanCount() {  //전체 글 수 조회
		return sqlSession.selectOne("RecommendLoan.loanCount");
	}
	
	public RecommendLoan selectLoanDt(int rlnum) {
		return sqlSession.selectOne("RecommendLoan.recommendLoanDt", rlnum);
	}
	
//	public List<RecommendLoan> listLoan() {
//		List<RecommendLoan> rm = new ArrayList<RecommendLoan>();
//		return sqlSession.selectList("RecommendLoan.listRecommendLoan");
//	}
	
	public List<RecommendLoan> selectList(int startPage, int limit) {
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<RecommendLoan> volist = sqlSession.selectList("RecommendLoan.selectList", null, row);
		System.out.println(volist);
		return volist;
	}
	
	
	
	
}
