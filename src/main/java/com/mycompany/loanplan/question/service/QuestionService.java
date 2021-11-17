package com.mycompany.loanplan.question.service;

import java.util.List;

import com.mycompany.loanplan.question.Question;

public interface QuestionService {
	public List<Question> getQuestion(Question vo)throws Exception;
}
