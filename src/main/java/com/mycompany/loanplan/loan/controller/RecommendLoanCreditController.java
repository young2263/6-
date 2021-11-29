package com.mycompany.loanplan.loan.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanCreditService;
import com.mycompany.loanplan.loan.model.service.RecommendLoanService;

@Controller
public class RecommendLoanCreditController {
	
	private static final Logger logger = LoggerFactory.getLogger(RecommendLoanCreditController.class);
	
	private static final int LIMIT = 10;
	
	@Autowired
	private RecommendLoanCreditService recommendLoanCreditService;
	
	@RequestMapping(value = "/recommendloan/recommendloancreditlist", method = RequestMethod.GET)
	public ModelAndView recommendLoanList(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword,
			ModelAndView mv) {
		System.out.println("recommendloancreditlist 진입");
		try {
			int currentPage = page;
			int listCount = recommendLoanCreditService.loanCount();
			int maxPage = (int)((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", recommendLoanCreditService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("recommendloan/recommendloancreditlist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "/recommendloan/recommendloancreditdt", method = RequestMethod.GET)
	public ModelAndView selectLoanCreditDt(@RequestParam(name = "rlcrnum", defaultValue = "1") int rlcrnum,
			ModelAndView mv) {
		System.out.println(rlcrnum);
		try {
			mv.addObject("recommendloancredit", recommendLoanCreditService.selectLoanCreditDt(rlcrnum));
			mv.setViewName("recommendloan/recommendloancreditdt");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}
}
