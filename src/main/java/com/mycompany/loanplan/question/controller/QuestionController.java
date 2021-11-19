package com.mycompany.loanplan.question.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	private QuestionService qService;

	public static final int LIMIT = 10;

	@RequestMapping(value = "qlist.do", method = RequestMethod.GET)
	public ModelAndView questionListService(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int listCount = qService.totalCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals(""))
				mv.addObject("list", qService.selectSearch(keyword));
			else
				mv.addObject("list", qService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("question/qlist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "qDetail.do", method = RequestMethod.GET)
	public ModelAndView questionDetail(@RequestParam(name = "question_num") String question_num,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			
//			mv.addObject("question", qService.selectquestion(0));  여기가 무슨 내용인지 모르겠어서 오류잡는데 필요할 것 같아 주석처리 해놨습니다
			mv.addObject("currentPage", currentPage);
			mv.setViewName("question/questionDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "bRenew.do", method = RequestMethod.GET)
	public ModelAndView questionDetail(@RequestParam(name = "question_num") String question_num, ModelAndView mv) {
		try {
//			mv.addObject("question", qService.selectquestion(1, question_num));
			mv.setViewName("question/questionRenew");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "writeForm.do", method = RequestMethod.GET)
	public String questionInsertForm(ModelAndView mv) {
		return "question/writeForm";
	}

//	@RequestMapping(value = "qInsert.do", method = RequestMethod.POST)
//	public ModelAndView questionInsert(Question q,
//			@RequestParam(name = "upfile", required = false) MultipartFile report, HttpServletRequest request,
//			ModelAndView mv) {
//		try {
//			if (report != null && !report.equals(""))
//				saveFile(report, request);
//			q.setquestion_file(report.getOriginalFilename());
//			qService.insertquestion(q);
//			mv.setViewName("redirect:qlist.do");
//		} catch (Exception e) {
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return mv;
//	}
//
//	@RequestMapping(value = "qUpdate.do", method = RequestMethod.POST)
//	public ModelAndView questionUpdate(Question q, @RequestParam(name = "page", defaultValue = "1") int page,
//			@RequestParam("upfile") MultipartFile report, HttpServletRequest request, ModelAndView mv) {
//		try {
//
//			mv.addObject("question_num", qService.updatequestion(q).getquestion_num());
//			mv.addObject("currentPage", page);
//			mv.setViewName("redirect:qDetail.do");
//		} catch (Exception e) {
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return mv;
//	}
//
//	@RequestMapping(value = "qDelete.do", method = RequestMethod.GET)
//	public ModelAndView questionDelete(@RequestParam(name = "question_num") String question_num,
//			@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request, ModelAndView mv) {
//		try {
//			question q = qService.selectquestion(1, question_num);
//
//			qService.deletequestion(question_num);
//			mv.addObject("currentPage", page);
//			mv.setViewName("redirect:qlist.do");
//		} catch (Exception e) {
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return mv;
//	}
//			  
			 
			 
}
