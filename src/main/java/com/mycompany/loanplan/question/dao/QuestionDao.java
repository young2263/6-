package com.mycompany.loanplan.question.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.question.Question;

@Repository("questionDao")
public class QuestionDao {
	@Autowired
	private SqlSession sqlSession;


	public List<Question> selectList() { 
		return sqlSession.selectList("Question.selectQuestion");
	}

	public Question selectOne(int question_num) {
		return sqlSession.selectOne("Question.selectViewQuestion", question_num);
	}
	
	public void insertquestion(Question q) { 
		sqlSession.insert("Question.insertQuestion",q); 
	 }

	public void updatequestion(Question q) { 
		 sqlSession.update("Question.updateQuestion", q); 
		 }

	public void deletequestion(int question_num) {
		 sqlSession.delete("Question.deleteQuestion", question_num);
		 }
	
	public int listCount() {
		return sqlSession.selectOne("Question.listCount");
	}
	
	
	public List<Question> searchList(String keyword) {
		return sqlSession.selectList("question.searchList", keyword);
	}
}