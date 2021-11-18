package com.mycompany.loanplan.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.admin.model.vo.Administor;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;

@Repository
public class AdministorDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<RecommendLoan> listLoan(){
		return sqlSession.selectList("Administor.listAdmin");
	}
}
