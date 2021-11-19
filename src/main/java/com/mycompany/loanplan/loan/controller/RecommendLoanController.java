package com.mycompany.loanplan.loan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanService;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;

@Controller
public class RecommendLoanController {
	@Autowired
	private RecommendLoanService recommendLoanService;
	
	@RequestMapping(value = "recommendloanlist", method = RequestMethod.GET)
	public ModelAndView recommendloanlist(ModelAndView mv) {
		mv.setViewName("recommendloanlist");
		mv.addObject("rllist", recommendLoanService.selectRecommendLoans());
		return mv;
	}
	

}
