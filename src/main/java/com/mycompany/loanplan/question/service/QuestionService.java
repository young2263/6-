package com.mycompany.loanplan.question.service;

import java.util.List;

import com.mycompany.loanplan.question.Question;

public interface QuestionService {
	public int totalCount();

	public Question selectquestion(int chk);

	public List<Question> selectList();

	public List<Question> selectSearch(String keyword);

	public void insertquestion(Question q);

	public void updatequestion(Question q);

	public void deletequestion(int question_num);
}