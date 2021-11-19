package com.mycompany.loanplan.loan.controller;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanCharterService;

@Controller
public class RecommendLoanCharterController {
	@Autowired
	private RecommendLoanCharterService recommendLoanCharterService;
	
	@RequestMapping(value = "/recommendloan/recommendloancharterlist", method = RequestMethod.GET)
	public ModelAndView recommendloancharterlist(ModelAndView mv) {
		mv.setViewName("recommendloan/recommendloancharterlist");
		mv.addObject("rlchlist", recommendLoanCharterService.selectRecommendLoanCharters());
		return mv;
	}
	


}
