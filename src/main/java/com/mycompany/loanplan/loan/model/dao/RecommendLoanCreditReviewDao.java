package com.mycompany.loanplan.loan.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.loan.model.vo.RecommendLoanCreditReview;

@Repository("recommendLoanCreditReviewDao")
public class RecommendLoanCreditReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<RecommendLoanCreditReview> listLoanCreditReview() {
		List<RecommendLoanCreditReview> rmcdr = new ArrayList<RecommendLoanCreditReview>();
		return sqlSession.selectList("RecommendLoanCreditReview.listRecommendLoanCreditReview");
	}
	
	public List<RecommendLoanCreditReview> selectCreditReviewList(int startPage, int limit) {
		int StartRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(StartRow, limit);
		List<RecommendLoanCreditReview> volist = sqlSession.selectList("RecommendLoanCreditReview.selectCreditReviewList", null, row);
		System.out.println(volist);
		return volist;
	}
	
	public int loanCreditReviewCount() {
		return sqlSession.selectOne("RecommendLoanCreditReview.loanCreditReviewCount");
	}
	
	public int insertRecommendLoanCharterReview(int rlcrnum) {
		return sqlSession.insert("RecommendLoanCreditReview.insertRecommendLoanCreditReview", rlcrnum);
	}
}
