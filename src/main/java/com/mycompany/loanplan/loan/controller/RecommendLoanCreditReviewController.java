package com.mycompany.loanplan.loan.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.loan.model.service.RecommendLoanCreditReviewService;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCreditReview;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanReview;

@Controller
public class RecommendLoanCreditReviewController {

private static final int LIMIT = 10;
	
	@Autowired
	private RecommendLoanCreditReview rlcrr;

	@Autowired
	private RecommendLoanCreditReviewService recommendLoanCreditReviewService;
	
	@RequestMapping(value = "/recommendloan/recommendloancreditreview", method = RequestMethod.GET)
	public ModelAndView recommendLoanCreditReviewInsert(
			@RequestParam(name = "rl_cr_num") int rl_cr_num,
			@RequestParam(name = "page", defaultValue = "1") int page,
			RecommendLoanCreditReview rlr, ModelAndView mv) {
		try {
			recommendLoanCreditReviewService.insertRecommendLoanCreditReview(rlcrr);
			mv.addObject("rl_cr_num", rl_cr_num);
			mv.addObject("page", page);
			mv.setViewName("redirect:recommendloan/recommendloancreditdt");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "/recommendloan/recommendloanrcrediteviewupdate", method = RequestMethod.GET)
	public void recommendLoanCreditReviewUpdate(HttpServletResponse response, RecommendLoanCreditReview rlcrr) {
		PrintWriter out = null;
		JSONObject job = new JSONObject();
		try {
			job.put("ack", recommendLoanCreditReviewService.updateRecommendLoanCreditReview(rlcrr));
			out = response.getWriter();
			out.append(job.toJSONString());
		} catch (Exception e) {
			job.put("ack", -1);
		} finally {
			out.flush();
			out.close();
		}
	}
	
	@RequestMapping(value = "/recommendloan/recommendloancreditreviewdelete", method = RequestMethod.GET)
	public void recommendLoanCreditReviewDelete(HttpServletResponse response, RecommendLoanCreditReview rlcrr) {
		PrintWriter out = null;
		JSONObject job = new JSONObject();
		try {
			job.put("ack", recommendLoanCreditReviewService.deleteRecommendLoanCreditReview(rlcrr));
			out = response.getWriter();
			out.append(job.toJSONString());
		} catch (Exception e) {
			job.put("ack", -1);
		} finally {
			out.flush();
			out.close();
		}
	}
}
