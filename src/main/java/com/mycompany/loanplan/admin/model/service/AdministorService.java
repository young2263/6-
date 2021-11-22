package com.mycompany.loanplan.admin.model.service;

import java.util.List;

import com.mycompany.loanplan.admin.model.vo.Administor;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;

public interface AdministorService {

	List<Administor> listLoan();
	List<Administor> selectList(int startPage, int limit);
	List<RecommendLoanCharter> recommendLoanCharterList(int startPage, int limit);
	List<RecommendLoanCredit> recommendLoanCreditList(int startPage, int limit);
	List<Administor> recommendLoan(int startPage, int limit);
	int loanCount();
	int loancreditCount();
	int loancharterCount();
}
