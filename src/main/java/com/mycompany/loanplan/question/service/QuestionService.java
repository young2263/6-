package com.mycompany.loanplan.question.service;

import java.util.List;

import com.mycompany.loanplan.question.Question;

public interface QuestionService {
	int questionCount();
	
	Question selectQuestionDt(int qnum);

	public List<Question> selectList(int startPage, int limit);

	public List<Question> selectSearch(String keyword);
	
	public List<Question> questionList();
	
	int insertQuestion(Question q);
	
	int updateQuestion(Question list);
	
	int deleteQuestion(int Q_NUM);
}