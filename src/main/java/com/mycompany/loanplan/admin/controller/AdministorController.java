package com.mycompany.loanplan.admin.controller;

import javax.servlet.http.HttpServletRequest;

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
	public String loanSelect(HttpServletRequest request,
			@RequestBody String param) throws Exception {
		
		try {
			JSONParser parser = new JSONParser();
			JSONObject job = (JSONObject) parser.parse(param);
			String text = (String) job.get("text");
			if(text == "주택담보대출") {
				
			}else if(text=="전세자금대출") {
				
			}else if(text=="개인신용대출") {
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "success";
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
