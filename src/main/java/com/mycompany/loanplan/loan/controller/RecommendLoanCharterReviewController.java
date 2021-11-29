package com.mycompany.loanplan.loan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanCharterReviewService;

@Controller
public class RecommendLoanCharterReviewController {

	private static final int LIMIT = 10;
	
	@Autowired
	private RecommendLoanCharterReviewService recommendLoanCharterReviewService;
	
	@RequestMapping(value = "/recommendloan/recommendloancharterreview", method = RequestMethod.GET)
	public ModelAndView recommendLoanCharterReviewList(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword,
			ModelAndView mv) {
		System.out.println("recommendloancharterreview 진입");
		try {
			int currentPage = page;
			int listCount = recommendLoanCharterReviewService.loanCharterReviewCount();
			int maxPage = (int)((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", recommendLoanCharterReviewService.selectCharterReviewList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("recommendloan/recommendloancharterreview");
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "/recommendloan/insertrecommendloancharterreview")
	public ModelAndView insertRecommendLoanCharterReview(ModelAndView mv) {
		try {
			mv.setViewName("recommendloan/insertrecommendloancharterreview");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}