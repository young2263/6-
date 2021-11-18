package com.mycompany.loanplan.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.admin.model.service.AdministorService;

@Controller
public class AdministorController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdministorController.class);

	@Autowired
	private AdministorService adminService;

	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminList(ModelAndView mv) {
		System.out.println("admin진입");
		System.out.println(adminService.selectList());
		try {
			mv.addObject("volist", adminService.selectList());
			mv.setViewName("admin/main");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
		}
		
		return mv;
	}
	
}
