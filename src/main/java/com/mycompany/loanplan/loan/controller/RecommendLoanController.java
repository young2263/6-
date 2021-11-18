package com.mycompany.loanplan.loan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanService;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;

@Controller
public class RecommendLoanController {
	@Autowired
	private RecommendLoanService recommendLoanService;
	
	@RequestMapping(value = "recommendloanlist", method = RequestMethod.GET)
	public ModelAndView getRecommendLoans(ModelAndView mv
			, @RequestParam(value = "msg") String msg
			,@RequestParam(value = "pagenum") int pagenum
			) {
		
		String viewpage = "";
		RecommendLoan vo = new RecommendLoan();
		List<RecommendLoan> volist = null;
		try {
			volist = recommendLoanService.getRecommendLoansList(vo);
			viewpage = "recommendloanlist";
			mv.addObject("volist", volist);
		} catch(Exception e) {
			viewpage = "error/commonError";
			mv.addObject("msg", "대출 리스트 읽기에 문제가 발생하였습니다. 페이지를 다시 열어주세요");
			mv.addObject("url", "recommendloanlist");
			e.printStackTrace();
		}
		mv.addObject("volist", volist);
		mv.setViewName(viewpage);
		return mv;
		
	}
}
