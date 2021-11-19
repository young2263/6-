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

	public int listCount() {
		return sqlSession.selectOne("question.listCount");
	}

	public Question selectOne(int question_num) {
		return sqlSession.selectOne("question.selectOne", question_num);
	}

	public List<Question> searchList(String keyword) {
		return sqlSession.selectList("question.searchList", keyword);
	}

	public List<Question> selectList(int startPage, int limit) { 

	int startRow = (startPage - 1) * limit;
	RowBounds row = new RowBounds(startRow, limit);
	return sqlSession.selectList("question.selectList",null,row);
	}

	public int insertquestion(Question q) { 
	 return sqlSession.insert("question.insertquestion",q); 
	 }

	public int updatequestion(Question q) { 
		 return sqlSession.update("question.updatequestion", q); 
		 }

	public int deletequestion(int question_num) {
		 return sqlSession.delete("question.deletequestion", question_num);
		 }
}