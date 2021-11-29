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
		
	public List<RecommendLoanReview> selectList(int rl_num) {  //그 대출에 해당하는 리뷰 조회
		return sqlSession.selectList("RecommendLoanReview.listRecommendLoanReview", rl_num);
	}

	public RecommendLoanReview selectOne(String m_id) {   //단일 리뷰 조회
		return sqlSession.selectOne("RecommendLoanReview.selectRecommendLoanReview", m_id);
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
