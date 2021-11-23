package com.mycompany.loanplan.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.admin.model.vo.Administor;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;

@Repository
public class AdministorDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Administor> listLoan(){
		List<Administor> rm = new ArrayList<Administor>();
		return sqlSession.selectList("Administor.listAdmin");
	}
	
	public List<Administor> selectList(int startPage, int limit){
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<Administor> volist =  sqlSession.selectList("Administor.selectList",null,row);
		return volist;
	}
	
	public List<RecommendLoanCharter> recommendLoanCharterList(int startPage, int limit){
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<RecommendLoanCharter> volist =  sqlSession.selectList("Administor.recommendLoanCharterList",null,row);
		return volist;
	}
	
	public List<RecommendLoanCredit> recommendLoanCreditList(int startPage, int limit){
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<RecommendLoanCredit> volist =  sqlSession.selectList("Administor.recommendLoanCreditList",null,row);
		return volist;
	}
	
	public List<Administor> recommendLoan(int startPage, int limit){
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<Administor> volist =  sqlSession.selectList("Administor.recommendLoan",null,row);
		return volist;
	}
	
	public int loanCount() {
		return sqlSession.selectOne("Administor.loanCount");
	}
	public int loancreditCount() {
		return sqlSession.selectOne("Administor.loancreditCount");
	}
	public int loancharterCount() {
		return sqlSession.selectOne("Administor.loancharterCount");
	}
	
}
