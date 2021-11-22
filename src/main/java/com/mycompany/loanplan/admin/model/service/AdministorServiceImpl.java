package com.mycompany.loanplan.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.admin.model.dao.AdministorDao;
import com.mycompany.loanplan.admin.model.vo.Administor;

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
	
}