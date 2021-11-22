package com.mycompany.loanplan.admin.model.service;

import java.util.List;

import com.mycompany.loanplan.admin.model.vo.Administor;

public interface AdministorService {

	List<Administor> listLoan();
	List<Administor> selectList(int startPage, int limit);
	int loanCount();
	int loancreditCount();
	int loancharterCount();
}
