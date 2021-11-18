package com.mycompany.loanplan.admin.model.service;

import java.util.List;

import com.mycompany.loanplan.admin.model.vo.Administor;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;

public interface AdministorService {

	List<RecommendLoan> selectList();
}
