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
	
	public int questionCount() {
		return sqlSession.selectOne("Question.questionCount");
	}
	
	
	public Question selectQuestionDt(int qnum) {
		return sqlSession.selectOne("Question.questionDt", qnum);
	}
	
	public List<Question> selectList(int startPage, int limit) {
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<Question> volist = sqlSession.selectList("Question.selectList", null, row);
		System.out.println(volist);
		return volist;
	}

	public Question selectOne(int question_num) {
		return sqlSession.selectOne("Question.selectViewQuestion", question_num);
	}
	
	public int insertQuestion(Question q) {  
		return sqlSession.insert("Question.insertQuestion", q);
	}

	public int updateQuestion(Question q) {  
		return sqlSession.update("Question.updateQuestion", q);
	}

	public int deleteQuestion(Question q) {  
		return sqlSession.delete("Question.deleteQuestion", q);
	}
	
	public int listCount() {
		return sqlSession.selectOne("Question.listCount");
	}
	
	
	public List<Question> searchList(String keyword) {
		return sqlSession.selectList("question.searchList", keyword);
	}
}