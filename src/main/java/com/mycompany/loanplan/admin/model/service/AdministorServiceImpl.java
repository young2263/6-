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
	public List<Administor> selectList(){
		return adminDao.listLoan();
	}
	
}