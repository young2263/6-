package com.mycompany.loanplan.loan.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanCreditService;

@Controller
public class RecommendLoanCreditController {
	@Autowired
	private RecommendLoanCreditService recommendLoanCreditService;
	
	@RequestMapping(value = "/recommendloan/recommendloancreditlist",  method = RequestMethod.GET)
	public ModelAndView recommendloancreditlist(ModelAndView mv) {
		mv.setViewName("recommendloan/recommendloancreditlist");
		mv.addObject("rlcrlist", recommendLoanCreditService.selectRecommendLoanCredits());
		return mv;
	}
}
