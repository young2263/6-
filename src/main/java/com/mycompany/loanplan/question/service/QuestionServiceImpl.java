package com.mycompany.loanplan.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mycompany.loanplan.question.Question;
import com.mycompany.loanplan.question.dao.QuestionDao;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	public QuestionDao qDao;

	@Override
	public int questionCount() {
		return qDao.questionCount();
	}
	
	@Override
	public Question selectQuestionDt(int qnum) {
		return qDao.selectQuestionDt(qnum);
	}
	
	
	@Override
	public List<Question> selectList(int startPage, int limit) {
		return qDao.selectList(startPage, limit);
	}

	@Override
	public List<Question> selectSearch(String keyword) {
		return qDao.searchList(keyword);
	}

	@Override
	public int insertQuestion(Question q) {
		return qDao.insertQuestion(q);
	}
	
	@Override
	public int updateQuestion(Question q) {
		return qDao.updateQuestion(q);
	}
	
	@Override
	public int deleteQuestion(Question q) {
		return qDao.deleteQuestion(q);
	}

	
}
