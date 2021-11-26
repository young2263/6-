package com.mycompany.loanplan.loan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanReviewService;

@Controller
public class RecommendLoanReviewController {

		private static final int LIMIT = 10;
		
		@Autowired
		private RecommendLoanReviewService recommendLoanReviewService;
		
		@RequestMapping(value = "/recommendloan/recommendloanreview", method = RequestMethod.GET)
		public ModelAndView recommendLoanReviewList(
				@RequestParam(name = "page", defaultValue = "1") int page,
				@RequestParam(name = "keyword", required = false) String keyword,
				ModelAndView mv) {
			System.out.println("recommendloanreview 진입");
			try {
				int currentPage = page;
				int listCount = recommendLoanReviewService.loanReviewCount();
				int maxPage = (int)((double) listCount / LIMIT + 0.9);
				mv.addObject("volist", recommendLoanReviewService.selectReviewList(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.setViewName("recommendloan/recommendloanreview");
			}catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				e.printStackTrace();
			}
			return mv;
		}
		
		@RequestMapping(value = "/recommendloan/insertrecommendloanreview")
		public ModelAndView insertRecommendLoanReview(ModelAndView mv) {
			try {
				mv.setViewName("recommendloan/insertrecommendloanreview");
			}catch (Exception e) {
				e.printStackTrace();
			}
			return mv;
		}
}
