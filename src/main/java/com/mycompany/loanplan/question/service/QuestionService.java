package com.mycompany.loanplan.question.service;

import java.util.List;

import com.mycompany.loanplan.question.Question;

public interface QuestionService {
	int questionCount();
	
	Question selectQuestionDt(int qnum);

	public List<Question> selectList(int startPage, int limit);

	public List<Question> selectSearch(String keyword);
	
	int insertQuestion(Question q);
	
	int updateQuestion(Question q);
	
	int deleteQuestion(Question q);
}