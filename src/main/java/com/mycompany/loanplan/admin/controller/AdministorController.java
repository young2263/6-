package com.mycompany.loanplan.admin.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.admin.model.service.AdministorService;
import com.mycompany.loanplan.admin.model.vo.Administor;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;

@Controller
public class AdministorController {

	private static final Logger logger = LoggerFactory.getLogger(AdministorController.class);

	private static final int LIMIT = 10;

	@Autowired
	private AdministorService adminService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminList(@RequestParam(name="page",defaultValue = "1") int page,
			@RequestParam(name="keyword",required = false) String keyword,
			ModelAndView mv) {
		System.out.println("admin진입");
		try {
			
			int currentPage = page;
			int listCount = adminService.loanCount();
			int maxPage = (int)((double) listCount / LIMIT +0.9);
			mv.addObject("volist", adminService.selectList(currentPage, LIMIT ));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/main");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			e.printStackTrace();
		}

		return mv;
	}
	@RequestMapping(value = "/loanSelect", method = RequestMethod.POST)
	@ResponseBody
	public void loanSelect(@RequestParam(name="page",defaultValue = "1") int page, HttpServletRequest request,
			@RequestBody String param, HttpServletResponse response) throws Exception {
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		try {
			int currentPage = page;
			int listCount = adminService.loanCount();
			int maxPage = (int)((double) listCount / LIMIT +0.9);
			
			JSONParser parser = new JSONParser();
			JSONObject job = (JSONObject) parser.parse(param);
			
			PrintWriter out = response.getWriter();
			
			
			String text = (String) job.get("text");
			System.out.println(text);
			if(text.equals("주택담보대출")) { 
				List<Administor> list = adminService.recommendLoan(currentPage, LIMIT);
				sendJson.put("list", list);
				out.println(sendJson.toJSONString());
				System.out.println(list);
			}else if(text.equals("전세자금대출")) {
				List<RecommendLoanCharter> chlist = adminService.recommendLoanCharterList(currentPage, LIMIT);
				sendJson.put("list", chlist);
				out.println(sendJson.toJSONString());
				System.out.println(chlist);
			}else if(text.equals("개인신용대출")) {
				List<RecommendLoanCredit> crlist = adminService.recommendLoanCreditList(currentPage, LIMIT);
				sendJson.put("list", crlist);
				out.println(sendJson.toJSONString());
				System.out.println(crlist);
			}else {
				System.out.println("end");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@RequestMapping(value = "/admin/list", method = RequestMethod.GET)
	public ModelAndView creditlist(ModelAndView mv) {
		try {
			mv.setViewName("admin/main");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping("/loanAdd")
	public ModelAndView addLoan(Administor ad, HttpServletRequest request, ModelAndView mv) {
		try {
			mv.setViewName("admin/loanAdd");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

}
