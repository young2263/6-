package com.mycompany.loanplan.question.service;

import java.util.List;

import com.mycompany.loanplan.question.Question;

public interface QuestionService {
	int totalCount();

	Question selectquestion(int chk);

	List<Question> selectList(int startPage, int limit);

	List<Question> selectSearch(String keyword);

	int insertquestion(Question q);

	int updatequestion(Question q);

	int deletequestion(int question_num);
}