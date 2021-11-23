package com.mycompany.loanplan.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.member.model.service.MemberService;
import com.mycompany.loanplan.member.model.vo.Member;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "memberlist", method = RequestMethod.GET)
	
	public ModelAndView memberlist(ModelAndView mv) {
		//mv.setViewName("a/b");
		mv.setViewName("member/memberlist");
		mv.addObject("mlist", memberService.memberlist());
		return mv;
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView loginMember(ModelAndView mv) {
		mv.setViewName("member/login");
		return mv;
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Member vo, HttpServletRequest request) throws Exception {
		logger.info("post login");
		
		HttpSession session = request.getSession();
		
		Member login = memberService.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
		
		} else {
			session.setAttribute("member", login);
		}
		System.out.println(login);
		
		return "redirect:/login";
	}
	
	@RequestMapping(value = "logout.do", method= RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		memberService.logout(session);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/login");
		mv.addObject("msg", "logout");
		return mv;
	}
	
	@RequestMapping(value = "loginCheck.do", method = RequestMethod.GET)
	public ModelAndView loginCheck(@ModelAttribute Member vo, HttpSession session) {
		boolean result = memberService.loginCheck(vo, session);
		ModelAndView mv = new ModelAndView();
		if (result == true) {
			mv.setViewName("main");
			mv.addObject("msg", "success");
		} else {
			mv.setViewName("member/login");
			mv.addObject("msg", "failure");
		}
		return mv;
	}
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public ModelAndView insertMember(ModelAndView mv) {
		mv.setViewName("member/register");
		return mv;
	}
	
	@RequestMapping(value = "auth", method = RequestMethod.GET)
	public ModelAndView test(ModelAndView mv) {
		mv.setViewName("member/auth");
		return mv;
	}
	
	@RequestMapping(value = "information", method = RequestMethod.GET)
	public ModelAndView test2(ModelAndView mv) {
		mv.setViewName("member/information");
		return mv;
	}
	
	@RequestMapping(value = "finish", method = RequestMethod.GET)
	public ModelAndView test3(ModelAndView mv) {
		mv.setViewName("member/finish");
		return mv;
	}
	
	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("m_id") String m_id) {
		return memberService.userIdCheck(m_id);
	}
	
}
