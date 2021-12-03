package com.mycompany.loanplan.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.admin.model.vo.Administor;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;

@Repository
public class AdministorDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 주택담보 리스트
	public List<Administor> listLoan(){
		List<Administor> rm = new ArrayList<Administor>();
		return sqlSession.selectList("Administor.listAdmin");
	}
	// 주택담보 리스트
	public List<Administor> selectList(int startPage, int limit){
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<Administor> volist =  sqlSession.selectList("Administor.selectList",null,row);
		return volist;
	}
	// 전세자금 리스트
	public List<RecommendLoanCharter> recommendLoanCharterList(int startPage, int limit){
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<RecommendLoanCharter> volist =  sqlSession.selectList("Administor.recommendLoanCharterList",null,row);
		return volist;
	}
	// 신용대출 리스트
	public List<RecommendLoanCredit> recommendLoanCreditList(int startPage, int limit){
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<RecommendLoanCredit> volist =  sqlSession.selectList("Administor.recommendLoanCreditList",null,row);
		return volist;
	}
	// 주택담보 리스트
	public List<Administor> recommendLoan(int startPage, int limit){
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		List<Administor> volist =  sqlSession.selectList("Administor.recommendLoan",null,row);
		return volist;
	}
	
	// 주택 담보 수정 디테일
	public List<Administor> recommendLoanDetail(int NUM){
		List<Administor> volist = sqlSession.selectList("Administor.recommendLoanDetail",NUM);
		return volist;
	}
	// 전세자금 수정 디테일
	public List<RecommendLoanCharter> recommendLoanCharterListDetail(int NUM){
		List<RecommendLoanCharter> volist =sqlSession.selectList("Administor.recommendLoanCharterListDetail",NUM);
		return volist;
	}
	// 신용 대출 수정 디테일
	public List<RecommendLoanCredit> recommendLoanCreditListDetail(int NUM){
		List<RecommendLoanCredit> volist = sqlSession.selectList("Administor.recommendLoanCreditListDetail",NUM);
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
	
	public int guarInsert(RecommendLoan rm) {
		return sqlSession.insert("Administor.guarInsert", rm);
	}
	public int creditInsert(RecommendLoanCredit rmc) {
		return sqlSession.insert("Administor.creditInsert", rmc);
	}
	public int geonInsert(RecommendLoanCharter rmct) {
		return sqlSession.insert("Administor.geonInsert", rmct);
	}
	
	public int deleteLoan(int RL_NUM) {
		return sqlSession.delete("Administor.deleteLoan",RL_NUM);
	}
	public int deleteCredit(int RL_CR_NUM) {
		return sqlSession.delete("Administor.deleteCredit",RL_CR_NUM);
	}
	public int deleteCharter(int RL_CH_NUM) {
		return sqlSession.delete("Administor.deleteCharter",RL_CH_NUM);
	}
	
	//수정
	public int modifyLoan(RecommendLoan list) {
		return sqlSession.update("Administor.updateLoan", list);
	}
	
	
}
