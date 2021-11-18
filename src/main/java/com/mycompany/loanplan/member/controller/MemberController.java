package com.mycompany.loanplan.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.member.model.service.MemberService;
import com.mycompany.loanplan.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "memberlist", method = RequestMethod.GET)
	
	public ModelAndView memberlist(ModelAndView mv) {
		//mv.setViewName("a/b");
		mv.setViewName("memberlist");
		mv.addObject("mlist", memberService.selectMembers());
		return mv;
	}
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public ModelAndView insertMember(ModelAndView mv) {
		mv.setViewName("register");
		return mv;
	}
	
	@RequestMapping(value = "auth", method = RequestMethod.GET)
	public ModelAndView test(ModelAndView mv) {
		mv.setViewName("auth");
		return mv;
	}
	
	@RequestMapping(value = "information", method = RequestMethod.GET)
	public ModelAndView test2(ModelAndView mv) {
		mv.setViewName("information");
		return mv;
	}
	
	@RequestMapping(value = "finish", method = RequestMethod.GET)
	public ModelAndView test3(ModelAndView mv) {
		mv.setViewName("finish");
		return mv;
	}
	
	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("m_id") String m_id) {
		return memberService.userIdCheck(m_id);
	}
	
	
}
