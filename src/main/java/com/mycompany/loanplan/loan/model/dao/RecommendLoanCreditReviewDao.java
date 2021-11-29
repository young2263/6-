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
	
	public List<RecommendLoanCreditReview> selectList(int rl_cr_num) {  //그 대출에 해당하는 리뷰 조회
		return sqlSession.selectList("RecommendLoanCreditReview.listRecommendLoanCreditReview", rl_cr_num);
	}
	
	public RecommendLoanCreditReview selectOne(String m_id) {  //단일 리뷰 조회
		return sqlSession.selectOne("RecommendLoanCreditReview.selectRecommendLoanCreditReview", m_id);
	}
	
	public int insertRecommendLoanCreditReview(RecommendLoanCreditReview rlcrr) {  //리뷰 입력
		return sqlSession.insert("RecommendLoanCreditReview.insertRecommendLoanCreditReview", rlcrr);
	}
	
	public int updateRecommendLoanCreditReview(RecommendLoanCreditReview rlcrr) {  //리뷰 수정
		System.out.println(rlcrr);
		return sqlSession.update("RecommendLoanCreditReview.updateRecommendLoanCreditReview", rlcrr);
	}
	
	public int deleteRecommendLoanCreditReview(RecommendLoanCreditReview rlcrr) {  //리뷰 삭제
		System.out.println(rlcrr);
		return sqlSession.delete("RecommendLoanCreditReview.deleteRecommendLoanCreditReview", rlcrr);
	}
}
