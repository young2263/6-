package com.mycompany.loanplan.loan.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
		private RecommendLoanReview rlr;
		
		@Autowired
		private RecommendLoanReviewService recommendLoanReviewService;
		
		@RequestMapping(value = "/recommendloan/recommendloanreviewinsert", method = RequestMethod.GET)
		public ModelAndView recommendLoanReviewInsert(
				@RequestParam(name = "rl_num") int rl_num,
				@RequestParam(name = "page", defaultValue = "1") int page,
				RecommendLoanReview rlr, ModelAndView mv) {
			try {
				recommendLoanReviewService.insertRecommendLoanReview(rlr);
				mv.addObject("rl_num", rl_num);
				mv.addObject("page", page);
				mv.setViewName("redirect:recommendloan/recommendloandt");
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("errorPage");
			}
			return mv;
		}
		
		@RequestMapping(value = "/recommendloan/recommendloanreviewupdate", method = RequestMethod.GET)
		public void recommendLoanReviewUpdate(HttpServletResponse response, RecommendLoanReview rlr) {
			PrintWriter out = null;
			JSONObject job = new JSONObject();
			try {
				job.put("ack", recommendLoanReviewService.updateRecommendLoanReview(rlr));
				out = response.getWriter();
				out.append(job.toJSONString());
			} catch (Exception e) {
				job.put("ack", -1);
			} finally {
				out.flush();
				out.close();
			}
		}
		
		@RequestMapping(value = "/recommendloan/recommendloanreviewdelete", method = RequestMethod.GET)
		public void recommendLoanReviewDelete(HttpServletResponse response, RecommendLoanReview rlr) {
			PrintWriter out = null;
			JSONObject job = new JSONObject();
			try {
				job.put("ack", recommendLoanReviewService.deleteRecommendLoanReview(rlr));
				out = response.getWriter();
				out.append(job.toJSONString());
			} catch (Exception e) {
				job.put("ack", -1);
			} finally {
				out.flush();
				out.close();
			}
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
