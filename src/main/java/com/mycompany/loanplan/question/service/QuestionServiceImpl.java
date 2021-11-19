package com.mycompany.loanplan.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.question.Question;
import com.mycompany.loanplan.question.dao.QuestionDao;

@Service("qService")
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	public QuestionDao qDao;

	@Override
	public int totalCount() {
		int result = qDao.listCount();
		return result;
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
	public int insertquestion(Question q) {
		return qDao.insertquestion(q);
	}

	@Override
	public int updatequestion(Question q) {
		return qDao.updatequestion(q);
	}

	@Override
	public int deletequestion(int question_num) {
		return qDao.deletequestion(question_num);
	}

	@Override
	public Question selectquestion(int chk) {
		return qDao.selectOne(chk);
	}
}
