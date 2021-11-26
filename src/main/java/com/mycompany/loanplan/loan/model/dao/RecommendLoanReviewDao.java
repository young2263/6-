package com.mycompany.loanplan.loan.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanReview;

@Repository("recommendLoanReviewDao")
public class RecommendLoanReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
		
	public List<RecommendLoanReview> listLoanReview() {
		List<RecommendLoanReview> rmr = new ArrayList<RecommendLoanReview>();
		return sqlSession.selectList("RecommendLoanReview.listRecommendLoanReview");
	}
	
	public List<RecommendLoanReview> selectReviewList(int startPage, int limit) {
		int StartRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(StartRow, limit);
		List<RecommendLoanReview> volist = sqlSession.selectList("RecommendLonaReview.selectReviewList", null, row);
		System.out.println(volist);
		return volist;
	}
	
	public int loanReviewCount() {
		return sqlSession.selectOne("RecommendLoanReview.loanReviewCount");
	}
	
	public int insertRecommendLoanReview(int rlnum) {
		return sqlSession.insert("RecommendLoanReview.insertRecommendLoanReview", rlnum);
	}
}
