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
	
	public List<RecommendLoanCharter> listLoan() {
		List<RecommendLoanCharter> rmc = new ArrayList<RecommendLoanCharter>();
		return sqlSession.selectList("RecommendLoanCharter.listRecommendLoanCharter");
	}
	
	public List<RecommendLoanCharter> selectList(int startPage, int limit) {
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<RecommendLoanCharter> volist = sqlSession.selectList("RecommendLoanCharter.selectList", null, row);
		System.out.println(volist);
		return volist;
	}
	
	public int loanCount() {
		return sqlSession.selectOne("RecommendLoanCharter.loanCount");
	}
	
	public int recommendLoanCharterDt(int rlchnum) {
		return sqlSession.selectOne("RecommendLoanCharter.recommendLoanCharterDt", rlchnum);
	}
	
	public List<RecommendLoanCharterReview> listLoanCharterReview() {
		List<RecommendLoanCharterReview> rmhv = new ArrayList<RecommendLoanCharterReview>();
		return sqlSession.selectList("RecommendLoanCharterReview.listRecommendLoanCharterReview");
	}
	
	public List<RecommendLoanCharterReview> selectChReviewList(int startPage, int limit) {
		int StartRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(StartRow, limit);
		List<RecommendLoanCharterReview> volist = sqlSession.selectList("RecommendLoanCharterReview.selectChReviewList", null, row);
		System.out.println(volist);
		return volist;
	}
	
	public int loanChReviewCount() {
		return sqlSession.selectOne("RecommendLoanCharterReview.loanChReviewCount");
	}
	
	public int insertRecommendLoanChReview(int rlchnum) {
		return sqlSession.insert("RecommendLoanCharterReview.insertRecommendLoanChReview", rlchnum);
	}
}
