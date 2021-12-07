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
	
	public int listCount() {  //전체 글 수 조회
		return sqlSession.selectOne("RecommendLoanReview.listCount");
	}
		
	public RecommendLoanReview selectOne(int rlnum) {  //글 가져오기
		return sqlSession.selectOne("RecommendLoanReview.selectRecommendLoanReview", rlnum);
	}
	
	public List<RecommendLoanReview> selectList(int startPage, int limit) {   //특정 페이지 단위의 게시글 조회
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<RecommendLoanReview> volist = sqlSession.selectList("RecommendLoanReview.listRecommendLoanReview", null, row);
		System.out.println(volist);
		return volist;
	}
	
	public int insertRecommendLoanReview(RecommendLoanReview rlr) {  //리뷰 입력 
		return sqlSession.insert("RecommendLoanReview.insertRecommendLoanReview", rlr);
	}
	
	public int updateRecommendLoanReview(RecommendLoanReview rlr) {   //리뷰 수정
		System.out.println(rlr);
		return sqlSession.update("RecommendLoanReview.updateRecommendLoanReview", rlr);
	}
	
	public int deleteRecommendLoanReview(RecommendLoanReview rlr) {  //리뷰 삭제
		System.out.println(rlr);
		return sqlSession.delete("RecommendLoanReview.deleteRecommendLoanReview", rlr);
	}

}
