package com.mycompany.loanplan.loan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanReviewService;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanReview;

@Controller
public class RecommendLoanReviewController {

		private static final int LIMIT = 10;
		
		@Autowired
		private RecommendLoanReviewService recommendLoanReviewService;
		
		@RequestMapping(value = "/recommendloan/recommendloanreviewlist", method = RequestMethod.GET)
		public ModelAndView recommendLoanReviewList(
				@RequestParam(name = "page", defaultValue = "1") int page,
				@RequestParam(name = "keyword", required = false) String keyword,
				ModelAndView mv) {
			System.out.println("recommendloanReviewlist 진입");
			try {
				int currentPage = page;
				int listCount = recommendLoanReviewService.loanReviewCount();
				int maxPage = (int)((double) listCount / LIMIT + 0.9);
				mv.addObject("volist", recommendLoanReviewService.selectReviewList(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.setViewName("recommendloan/recommendloanlist");
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				e.printStackTrace();
			}
			return mv;
		}
		
		@RequestMapping(value = "/recommendloan/insertrecommendloanreview")
		public ModelAndView insertRecommendLoanReview(RecommendLoanReview vo, ModelAndView mv) {
			recommendLoanReviewService.insertRecommendLoanReview(vo);
			mv.setViewName("recommendloan/insertrecommendloanreview");
			return mv;
		}
		
		@RequestMapping(value = "recommendLoan/updaterecommendloanreview")
		public String update(@ModelAttribute RecommendLoanReview r) {
			recommendLoanReviewService.updateRecommendLoanReview(r);
			return "redirect:recommendloanreview";
		}
		
//		// 평점 옵션
//		Map<String, Object> ratingOptions = new HashMap<String, Object>();
//		ratingOptions.put(0, "☆☆☆☆☆");
//		ratingOptions.put(1, "★☆☆☆☆");
//		ratingOptions.put(2, "★★☆☆☆");
//		ratingOptions.put(3, "★★★☆☆");
//		ratingOptions.put(4, "★★★★☆");
//		ratingOptions.put(5, "★★★★★");
//		model.addAttribute("ratingOptions", ratingOptions);

}
