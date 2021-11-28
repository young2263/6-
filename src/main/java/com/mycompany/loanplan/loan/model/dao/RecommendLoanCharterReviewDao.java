package com.mycompany.loanplan.loan.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharterReview;

@Repository("recommendLoanCharterReviewDao")
public class RecommendLoanCharterReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<RecommendLoanCharterReview> listLoanCharterReview() {
		List<RecommendLoanCharterReview> rmctr = new ArrayList<RecommendLoanCharterReview>();
		return sqlSession.selectList("RecommendLoanCharterReview.listRecommendLoanCharterReview");
	}
	
	public List<RecommendLoanCharterReview> selectCharterReviewList(int startPage, int limit) {
		int StartRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(StartRow, limit);
		List<RecommendLoanCharterReview> volist = sqlSession.selectList("RecommendLoanCharterReview.selectCharterReviewList", null, row);
		System.out.println(volist);
		return volist;
	}
	
	public int loanCharterReviewCount() {
		return sqlSession.selectOne("RecommendLoanCharterReview.loanCharterReviewCount");
	}
	
	public int insertRecommendLoanCharterReview(int rlchnum) {
		return sqlSession.insert("RecommendLoanCharterReview.insertRecommendLoanCharterReview", rlchnum);
	}
}
