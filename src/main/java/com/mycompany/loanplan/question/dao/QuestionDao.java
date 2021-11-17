package com.mycompany.loanplan.question.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.question.Question;

@Repository("questionDao")
public class QuestionDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Question> selectList(){
		return sqlSession.selectList("Question.questionlist");
	}
	
}
