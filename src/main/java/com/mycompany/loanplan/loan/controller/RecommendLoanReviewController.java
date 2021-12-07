package com.mycompany.loanplan.loan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		private RecommendLoanReview rlr;
		
		@Autowired
		private RecommendLoanReviewService recommendLoanReviewService;
		
		@RequestMapping(value = "/recommendloan/recommendloanreviewlist", method = RequestMethod.GET)
		public ModelAndView recommendLoanReviewList(
				@RequestParam(name = "page", defaultValue = "1") int page,
				@RequestParam(name = "keyword", required = false) String keyword,
				ModelAndView mv) {
			System.out.println("recommendloanreviewlist 진입");
			try {
				int currentPage = page;
				//한 페이지 당 출력할 목록 갯수
				int listCount = recommendLoanReviewService.listCount();
				int maxPage = (int) ((double) listCount / LIMIT + 0.9);
				mv.addObject("volist", recommendLoanReviewService.selectList(currentPage, LIMIT));
				mv.addObject("recommendloanreview", recommendLoanReviewService.selectList(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.setViewName("recommendloan/recommendloanreviewlist");
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				e.printStackTrace();
			}
			return mv;
		}
		
		@RequestMapping(value = "/recommendloan/recommendloanreview", method = RequestMethod.GET)
		public ModelAndView reviewDetail(
				@RequestParam(name = "rlnum") int rlnum,
				@RequestParam(name = "page", defaultValue = "1") int page,
				ModelAndView mv) {
			System.out.println(rlnum);
			
			try {
				int currentPage = page;
				//한 페이지당 출력할 목록 갯수
				
				mv.addObject("recommendloanreview", recommendLoanReviewService.selectOne(rlnum));
				mv.addObject("currentPage", currentPage);
				mv.setViewName("recommendloan/recommendloanreview");
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("errorPage");
			}
			return mv;
		}
		
		
		@RequestMapping(value = "/recommendloan/recommendloanreviewinsert.do", method = RequestMethod.GET)
		public ModelAndView recommendLoanReviewInsert(
				HttpServletRequest request, ModelAndView mv) {
			try {
				recommendLoanReviewService.insertRecommendLoanReview(rlr);
				mv.setViewName("redirect:recommendloan/recommendloanreviewlist");
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("errorPage");
			}
			return mv;
		}
		
		@RequestMapping(value = "/recommendloan/recommendloanreviewupdate.do", method = RequestMethod.POST)
		public ModelAndView recommendLoanReviewUpdate(RecommendLoanReview rlr, 
				@RequestParam(name = "page", defaultValue = "1") int page,
				HttpServletResponse response, ModelAndView mv) {
			try {
				mv.addObject("rlnum", recommendLoanReviewService.updateRecommendLoanReview(rlr));
				mv.addObject("currentPage", page);
				mv.setViewName("redirect:recommendloan/recommendloanreviewlist");
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("errorPage");
			}
			return mv;
			
		}
		
		@RequestMapping(value = "/recommendloan/recommendloanreviewdelete.do", method = RequestMethod.POST)
		public ModelAndView recommendLoanReviewDelete(
				@RequestParam(name = "rlnum") int rlnum,
				@RequestParam(name = "page", defaultValue = "1") int page,
				HttpServletResponse response, ModelAndView mv) {
			try {
				recommendLoanReviewService.deleteRecommendLoanReview(rlr);
				mv.addObject("currentPage", page);
				mv.setViewName("redirect:recommendloan/recommendloanreviewlist");
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("errorPage");
			}
			return mv;
		}

}
