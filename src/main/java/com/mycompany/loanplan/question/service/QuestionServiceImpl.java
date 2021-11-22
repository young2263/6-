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
	public int totalCount() {
		int result = qDao.listCount();
		return result;
	}

	@Override
	public List<Question> selectList() {
		return qDao.selectList();
	}

	@Override
	public List<Question> selectSearch(String keyword) {
		return qDao.searchList(keyword);
	}

	@Override
	public void insertquestion(Question q) {
		qDao.insertquestion(q);
	}

	@Override
	public void updatequestion(Question q) {
		qDao.updatequestion(q);
	}

	@Override
	public void deletequestion(int question_num) {
		qDao.deletequestion(question_num);
	}

	@Override
	public Question selectquestion(int chk) {
		return qDao.selectOne(chk);
	}
}
