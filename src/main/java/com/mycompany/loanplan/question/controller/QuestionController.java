package com.mycompany.loanplan.question.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.question.Question;
import com.mycompany.loanplan.question.service.QuestionService;
import com.mycompany.loanplan.question.service.QuestionServiceImpl;

@Controller
public class QuestionController {
	@Autowired
	private QuestionService questionService;

	//게시글목록조회
	@RequestMapping(value = "/questionView", method = RequestMethod.GET)
	public ModelAndView questionListService(ModelAndView mv) {
				mv.addObject("qlist",questionService.selectList());				
				mv.setViewName("question/questionView");
				return mv;
	}

	//게시글상세조회
	@RequestMapping(value = "/questionDview", method = RequestMethod.GET)
	public ModelAndView questionDetail( ModelAndView mv) {
						
///			mv.addObject("qlist", qService.selectquestion());
			mv.setViewName("question/questionDview");
			mv.addObject("question", questionService.selectquestion(0));
			return mv;
	}

	//게시글 작성
	@RequestMapping(value = "/questionInsert", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView questionInsert(Question q,  ModelAndView mv) {			
		questionService.insertquestion(q);
			mv.setViewName("question/questionInsert");		
			return mv;
	}
	
	//게시글 수정
	@RequestMapping(value="/questionUpdate", method = RequestMethod.POST)
	public String update(@ModelAttribute Question q) {
		questionService.updatequestion(q);
		return "redirect:questionView";
	}
	
}
	
	//게시글삭제
//	@RequestMapping("deleteQuestion")
//	public String delete(@RequestParam ) {
//		questionService.deletequestion(question_num);
//		return "redirect:questionView";
//	}
//	
	
//
//	@RequestMapping(value = "/questionDelete", method = RequestMethod.GET)
//	public ModelAndView questionDelete(@RequestParam(name = "question_num") String question_num,
//			@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request, ModelAndView mv) {
//		try {
//			question q = qService.selectquestion(1, question_num);
//
//			questionService.deletequestion(question_num);
//			mv.addObject("currentPage", page);
//			mv.setViewName("redirect:qlist.do");
//		} catch (Exception e) {
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return mv;
//	}
//			  
	
			 
			 

