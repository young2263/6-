package com.mycompany.loanplan.loan.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanCharterService;
import com.mycompany.loanplan.loan.model.service.RecommendLoanService;

@Controller
public class RecommendLoanCharterController {
	
	private static final Logger logger = LoggerFactory.getLogger(RecommendLoanCharterController.class);
	
	private static final int LIMIT = 10;
	
	@Autowired
	private RecommendLoanCharterService recommendLoanCharterService;
	
	@RequestMapping(value = "/recommendloan/recommendloancharterlist", method = RequestMethod.GET)
	public ModelAndView recommendLoanCharterList(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword,
			ModelAndView mv) {
		System.out.println("recommendloancharterlist 진입");
		try {
			int currentPage = page;
			int listCount = recommendLoanCharterService.loanCount();
			int maxPage = (int)((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", recommendLoanCharterService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("recommendloan/recommendloancharterlist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			e.printStackTrace();
		}
		return mv;
	}
	

}