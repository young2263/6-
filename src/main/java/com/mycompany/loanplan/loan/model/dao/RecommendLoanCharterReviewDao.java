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
	
	public List<RecommendLoanCharterReview> selectList(int rl_ch_num) {  //그 대출에 해당하는 리뷰 조회
		return sqlSession.selectList("RecommendLoanCharterReview.listRecommendLoanCharterReview", rl_ch_num);
	}
	
	public RecommendLoanCharterReview selectOne(String m_id) {  //단일 리뷰 조회
		return sqlSession.selectOne("RecommendLoanCharterReview.selectRecommendLoanCharterReview", m_id);
	}
	
	public int insertRecommendLoanCharterReview(RecommendLoanCharterReview rlcr) {  //리뷰 입력
		return sqlSession.insert("RecommendLoanCharterReview.insertRecommendLoanCharterReview", rlcr);
	}
	
	public int updateRecommendLoanCharterReview(RecommendLoanCharterReview rlcr) {  //리뷰 수정
		System.out.println(rlcr);
		return sqlSession.update("RecommendLoanCharterReview.updateRecommendLoanCharterReview", rlcr);
	}
	
	public int deleteRecommendLoanCharterReview(RecommendLoanCharterReview rlcr) {  //리뷰 삭제
		System.out.println(rlcr);
		return sqlSession.delete("RecommendLoanCharterReview.deleteRecommendLoanCharterReview", rlcr);
	}
}
