package com.mycompany.loanplan.question.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.loanplan.question.Question;
import com.mycompany.loanplan.question.service.QuestionService;

@Controller
@SessionAttributes("msg")
public class QuestionController {
	
private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	private static final int LIMIT = 10;
	

	
	@Autowired
	private QuestionService questionService;

	private Question q;

	//게시글목록조회
	@RequestMapping(value = "/question/questionView", method = RequestMethod.GET)
	public ModelAndView questionList(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword,
			ModelAndView mv) {
		System.out.println("questionlist 진입");
		try {
			int currentPage = page;
			//한 페이지당 출력할 목록 갯수
			int listCount = questionService.questionCount();
			int maxPage = (int)((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", questionService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("question/questionView");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			e.printStackTrace();
		}
		return mv;
	}

	//게시글상세조회
	@RequestMapping(value = "/question/questionDview", method = RequestMethod.GET)
	public ModelAndView selectQuestionDt(@RequestParam(name = "qnum") int qnum , ModelAndView mv) {
	System.out.println(qnum);
      try {
    	 System.out.println(questionService.selectQuestionDt(qnum));
         mv.addObject("question", questionService.selectQuestionDt(qnum));
         mv.setViewName("question/questionDview");
      } catch (Exception e) {
         mv.addObject("msg", e.getMessage());
         mv.setViewName("errorPage");
         e.printStackTrace();
      }
      return mv;   
			
			
}

	
	
	//게시글 작성
	@RequestMapping(value = "/question/questionInsert", method = RequestMethod.GET)
	public ModelAndView questionInsert(HttpServletRequest request, ModelAndView mv) {
		try {
			questionService.insertQuestion(q);
			mv.setViewName("question/questionInsert");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
		
		}
		return mv;
	}
	
	//게시글 수정
	@RequestMapping(value = "/question/questionUpdate", method = RequestMethod.GET)
	public ModelAndView questionUpdate(@RequestParam(name = "q", defaultValue = "1") int NUM, ModelAndView mv) {
		try {
			mv.addObject("qnum", questionService.updateQuestion(q));
			mv.setViewName("question/questionUpdate");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
		
	}
	@RequestMapping(value= " /question/questionUpdate.do", method=RequestMethod.POST)
	public ModelAndView questionModify(@RequestParam(name = "page", defaultValue = "1") int page,
			HttpServletRequest request, ModelAndView mv) {
		System.out.println("수정실행");
		try {
			int Q_NUM = Integer.parseInt(request.getParameter("Q_NUM"));
			String Q_TITLE = request.getParameter("Q_TITLE");
			String Q_CONTENT= request.getParameter("Q_CONTENT");
			Question que = new Question(Q_NUM, Q_TITLE, Q_CONTENT);
			int result = questionService.updateQuestion(que);
			System.out.println(result);
			int currentPage = page;
			int listCount = questionService.questionCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", questionService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("question/questionInsert");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
		
	
	//게시글삭
	@RequestMapping(value = "/question/questionDelete", method = RequestMethod.GET)
	public ModelAndView questionDelete(@RequestParam(name = "Q_NUM") int Q_NUM, @RequestParam(name = "page", defaultValue = "1") int page, HttpServletResponse response, ModelAndView mv) {
		try {
			int result = questionService.deleteQuestion(Q_NUM);
			int currentPage= page;
			int listCount = questionService.questionCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", questionService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("question/questionView");
		}	catch(Exception e) {
				e.printStackTrace();
			}
			return mv;
		}


			 
			 
}
