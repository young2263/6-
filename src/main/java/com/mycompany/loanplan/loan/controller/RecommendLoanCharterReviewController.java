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

import com.mycompany.loanplan.loan.model.service.RecommendLoanCharterReviewService;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharterReview;

@Controller
public class RecommendLoanCharterReviewController {

	private static final int LIMIT = 10;
	
	@Autowired
	private RecommendLoanCharterReview rlcr;
	
	@Autowired
	private RecommendLoanCharterReviewService recommendLoanCharterReviewService;
	
	@RequestMapping(value = "/recommendloan/recommendloancharterreviewinsert", method = RequestMethod.GET)
	public ModelAndView recommendLoanCharterReviewInsert(
			@RequestParam(name = "rl_ch_num") int rl_ch_num,
			@RequestParam(name = "page", defaultValue = "1") int page,
			RecommendLoanCharterReview rlcr, ModelAndView mv) {
		try {
			recommendLoanCharterReviewService.insertRecommendLoanCharterReview(rlcr);
			mv.addObject("rl_ch_num", rl_ch_num);
			mv.addObject("page", page);
			mv.setViewName("redirect:recommendloan/recommendloancharterdt");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "/recommendloan/recommendloancharterreviewupdate", method = RequestMethod.GET)
	public void recommendLoanCharterReviewUpdate(HttpServletResponse response, RecommendLoanCharterReview rlcr) {
		PrintWriter out = null;
		JSONObject job = new JSONObject();
		try {
			job.put("ack", recommendLoanCharterReviewService.updateRecommendLoanCharterReview(rlcr));
			out = response.getWriter();
			out.append(job.toJSONString());
		} catch (Exception e) {
			job.put("ack", -1);
		} finally {
			out.flush();
			out.close();
		}
	}
	
	@RequestMapping(value = "/recommendloan/recommendloancharterreviewdelete")
	public void recommendLoanCharterReviewDelete(HttpServletResponse response, RecommendLoanCharterReview rlcr) {
		PrintWriter out = null;
		JSONObject job = new JSONObject();
		try {
			job.put("ack", recommendLoanCharterReviewService.deleteRecommendLoanCharterReview(rlcr));
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
