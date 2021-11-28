package com.mycompany.loanplan.loan.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanService;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;

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
		public String selectLoanDt(Model model) {
			System.out.println("recommendloandt 진입");
			List<RecommendLoan> volist;
			volist = recommendLoanService.selectLoanDt();
			model.addAttribute("volist", volist);
			return "recommendloan/recommendloandt";
	}

}
