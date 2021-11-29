package com.mycompany.loanplan.loan.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharterReview;

@Repository("recommendLoanCharterDao")
public class RecommendLoanCharterDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int loanCount() {
		return sqlSession.selectOne("RecommendLoanCharter.loanCount");
	}
	
	public RecommendLoanCharter recommendLoanCharterDt(int rlchnum) {
		return sqlSession.selectOne("RecommendLoanCharter.recommendLoanCharterDt", rlchnum);
	}
	
//	public List<RecommendLoanCharter> listLoanCharter() {
//		List<RecommendLoanCharter> rmc = new ArrayList<RecommendLoanCharter>();
//		return sqlSession.selectList("RecommendLoanCharter.listRecommendLoanCharter");
//	}
	
	
	public List<RecommendLoanCharter> selectList(int startPage, int limit) {
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<RecommendLoanCharter> volist = sqlSession.selectList("RecommendLoanCharter.selectList", null, row);
		System.out.println(volist);
		return volist;
	}
	
	
}
