package com.mycompany.loanplan.loan.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanService;

@Controller
public class RecommendLoanController {
	
	private static final Logger logger = LoggerFactory.getLogger(RecommendLoanController.class);
	
	private static final int LIMIT = 10;
	
	@Autowired
	private RecommendLoanService recommendLoanService;
	
	@RequestMapping(value = "/recommendloan/recommendloanlist", method = RequestMethod.GET)
	public ModelAndView recommendLoanList(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword,
			ModelAndView mv) {
		System.out.println("recommendloanlist 진입");
		try {
			int currentPage = page;
			//한 페이지당 출력할 목록 갯수
			int listCount = recommendLoanService.loanCount();
			int maxPage = (int)((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", recommendLoanService.selectList(currentPage, LIMIT));
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
	
	@RequestMapping(value = "/recommendloan/recommendloandt", method = RequestMethod.GET)
		public ModelAndView selectLoanDt(@RequestParam(name = "rlnum", defaultValue="1") int rlnum ,
				ModelAndView mv) {
		System.out.println(rlnum);
	      try {
	         mv.addObject("recommendloan", recommendLoanService.selectLoanDt(rlnum));
	         mv.setViewName("recommendloan/recommendloandt");
	      } catch (Exception e) {
	         mv.addObject("msg", e.getMessage());
	         mv.setViewName("errorPage");
	         e.printStackTrace();
	      }
	      return mv;   			
	}
}
