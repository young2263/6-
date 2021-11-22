package com.mycompany.loanplan.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.admin.model.service.AdministorService;
import com.mycompany.loanplan.admin.model.vo.Administor;

@Controller
public class AdministorController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdministorController.class);

	@Autowired
	private AdministorService adminService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminList(ModelAndView mv) {
		System.out.println("admin진입");
		try {
			mv.addObject("volist", adminService.selectList());
			mv.setViewName("admin/main");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
		}
		
		return mv;
	}
	
	@RequestMapping("/loanAdd")
	public ModelAndView addLoan(Administor ad,HttpServletRequest request, ModelAndView mv ) {
		try {
			mv.setViewName("admin/loanAdd");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
}
