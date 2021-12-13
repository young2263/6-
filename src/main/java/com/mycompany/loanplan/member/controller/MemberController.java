package com.mycompany.loanplan.member.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.loanplan.member.model.service.MailSendService;
//import com.github.scribejava.core.model.OAuth2AccessToken;
//import com.mycompany.loanplan.member.NaverLoginBO;
import com.mycompany.loanplan.member.model.service.MemberService;
import com.mycompany.loanplan.member.model.vo.Member;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	private MailSendService member;
//	@Autowired
//	private NaverLoginBO naverloginbo;
	
//	@RequestMapping(value = "memberlist", method = RequestMethod.GET)
//	public ModelAndView memberlist(ModelAndView mv) {
//		mv.setViewName("member/memberlist");
//		mv.addObject("mlist", memberService.memberlist());
//		return mv;
//	}
	
//	@RequestMapping(value = "login", method = RequestMethod.GET)
//	public ModelAndView loginMember(ModelAndView mv) throws Exception{
//		mv.setViewName("member/login");
//		return mv;
//	}
	
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String signUp(Member vo, RedirectAttributes ra) {
		int result = 0;
		try {
			result = memberService.signUp(vo);
			if (result > 0) {
				ra.addAttribute("msg", "회원가입 성공");
			} else {
				ra.addAttribute("msg", "회원가입 실패");
			}
		}catch (Exception e) {
			ra.addAttribute("msg", "회원가입 과정에서 오류 발생");
			e.printStackTrace();
		}
		
		return "member/finish";
	}
	
	@RequestMapping("/login.do")
	public String getLogin() {
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		
		HttpSession session = req.getSession();
		Member login = memberService.login(vo);
		
		if(login == null) {
			System.out.println("로그아웃 실패");
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			
		}else {
			session.setAttribute("member", login);
			
		}
		System.out.println("로그인 성공");
		System.out.println(login);
		
		return "redirect:/";
//		return "home";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		System.out.println("로그아웃");
		return "redirect:/";
	}
	
//	@RequestMapping(value = "login", method = RequestMethod.POST)
//	public String login(Member vo, HttpServletRequest request) throws Exception {
//		logger.info("post login");
//		
//		HttpSession session = request.getSession();
//		
//		Member login = memberService.login(vo);
//		
//		if(login == null) {
//			session.setAttribute("member", null);
//		
//		} else {
//			session.setAttribute("member", login);
//		}
//		System.out.println(login);
//		
//		return "redirect:/login";
//	}
	
//	@RequestMapping(value = "logout.do", method= RequestMethod.GET)
//	public ModelAndView logout(HttpSession session) {
//		memberService.logout(session);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("member/login");
//		mv.addObject("msg", "logout");
//		return mv;
//	}
	
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
	
	@RequestMapping(value = "email", method = RequestMethod.GET)
	public ModelAndView mailCheck(@RequestParam String Memberemail, Model model) {
		logger.info("Memberemail: "+Memberemail);
		ModelAndView mv = new ModelAndView();
		mv.addObject("email",Memberemail);
		mv.setViewName("member/mail");
		return mv;
	}
	
	//약관동의 화면
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String registerMember() throws Exception {
		return "member/register";
	}
	
	//인증 화면
	@RequestMapping(value = "auth", method = RequestMethod.GET)
	public String authMember() throws Exception {
		return "member/auth";
	}
	
	//회원 가입 정보 입력 화면
	@RequestMapping(value="information", method = RequestMethod.GET)
	public String informationMember() throws Exception {
		return "member/information";
	}
	
	//회원가입 완료 화면
	@RequestMapping(value = "finish", method = RequestMethod.GET)
	public String finishMember() throws Exception {
		return "member/finish";
	}
	
	//아이디 중복 검사
	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("m_id") String m_id) {
		return memberService.userIdCheck(m_id);
	}
	
	//아이디 찾기
	@RequestMapping(value = "findId", method = RequestMethod.GET)
	private String findIdMember() throws Exception {
		return "member/findId";
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "findPwd", method = RequestMethod.GET)
	private String findPwdMember() throws Exception {
		return "member/findPwd";
	}
	
	//마이페이지
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	private ModelAndView selectMembers(HttpSession session) throws Exception {
		String m_id = ((Member)session.getAttribute("loginInfo")).getM_id();
		Member vo = new Member();
		vo.setM_id(m_id);
		ModelAndView mv = new ModelAndView();
		Member m= memberService.getMember(vo);
		mv.addObject("vo", m);
		mv.setViewName("member/myPage");
		return mv;
	}

	//개인정보수정
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	private ModelAndView editMemberinfo(@RequestParam String m_id) throws Exception { 
		logger.info("userId: "+m_id);
		Member vo = new Member();
		vo.setM_id(m_id);
		ModelAndView mv = new ModelAndView();
		Member m = memberService.getMember(vo);
		mv.addObject("vo", m);
		mv.setViewName("member/modify");
		return mv;
	}
}
