package com.mycompany.loanplan.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.admin.model.dao.AdministorDao;
import com.mycompany.loanplan.admin.model.vo.Administor;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;

@Service("adminService")
public class AdministorServiceImpl implements AdministorService {

	@Autowired
	private AdministorDao adminDao;
	
	@Override
	public List<Administor> listLoan(){
		return adminDao.listLoan();
	}
	
	@Override
	public List<Administor> selectList(int startPage, int limit){
		return adminDao.selectList(startPage, limit);
	}
	
	@Override
	public List<RecommendLoanCharter> recommendLoanCharterList(int startPage, int limit){
		return adminDao.recommendLoanCharterList(startPage, limit);
	}
	
	@Override
	public List<RecommendLoanCredit> recommendLoanCreditList(int startPage, int limit){
		return adminDao.recommendLoanCreditList(startPage, limit);
	}
	
	@Override
	public List<Administor> recommendLoan(int startPage, int limit){
		return adminDao.selectList(startPage, limit);
	}
	
	@Override
	public int loanCount(){
		return adminDao.loanCount();
	}
	
	@Override
	public int loancreditCount(){
		return adminDao.loancreditCount();
	}
	
	@Override
	public int loancharterCount(){
		return adminDao.loancharterCount();
	}
	
	@Override
	public int guarInsert(RecommendLoan rm){
		return adminDao.guarInsert(rm);
	}
	
	@Override
	public int creditInsert(RecommendLoanCredit rmc){
		return adminDao.creditInsert(rmc);
	}
	
	@Override
	public int geonInsert(RecommendLoanCharter rmct){
		return adminDao.geonInsert(rmct);
	}
	
	
}