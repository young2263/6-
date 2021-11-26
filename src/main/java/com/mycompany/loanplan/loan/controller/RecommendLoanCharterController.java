package com.mycompany.loanplan.loan.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
	
	@RequestMapping(value = "/recommendloan/recommendloancharterdt", method = RequestMethod.GET)
	public ModelAndView recommendLoancharterDt(ModelAndView mv) {
	System.out.println("recommendloancharterdt 진입");
	mv.setViewName("recommendloan/recommendloancharterdt");
	return mv;
}
	
	@RequestMapping(value = "/recommendloan/recommendloancharterreview", method = RequestMethod.GET)
	public ModelAndView recommendLoanCharterReviewList(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword,
			ModelAndView mv) {
		System.out.println("recommendloancharterreview 진입");
		try {
			int currentPage = page;
			int listCount = recommendLoanCharterService.loanChReviewCount();
			int maxPage = (int)((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", recommendLoanCharterService.selectChReviewList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("recommendloan/recommendloancharterreview");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "/recommendloan/insertrecommendloanchartereview", method = RequestMethod.GET)
	public ModelAndView insertRecommendLoanChReview(ModelAndView mv) {
		try {
			mv.setViewName("recommendloan/insertrecommendloanchartereview");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	

}