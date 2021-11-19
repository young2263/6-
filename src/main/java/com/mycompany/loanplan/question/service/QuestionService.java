package com.mycompany.loanplan.question.service;

import java.util.List;

import com.mycompany.loanplan.question.Question;

public interface QuestionService {
	int totalCount();

	Question selectquestion(int chk, String question_num);

	List<Question> selectList(int startPage, int limit);

	List<Question> selectSearch(String keyword);

	void insertquestion(Question q);

	Question updatequestion(Question q);

	void deletequestion(int question_num);
}