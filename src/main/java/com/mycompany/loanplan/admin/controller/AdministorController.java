package com.mycompany.loanplan.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.PrinterInfo;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mycompany.loanplan.admin.model.service.AdministorService;
import com.mycompany.loanplan.admin.model.service.AdvertiseService;
import com.mycompany.loanplan.admin.model.vo.Administor;
import com.mycompany.loanplan.admin.model.vo.Advertise;
import com.mycompany.loanplan.loan.model.vo.RecommendLoan;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCharter;
import com.mycompany.loanplan.loan.model.vo.RecommendLoanCredit;
import com.mycompany.loanplan.member.model.service.MemberService;
import com.mycompany.loanplan.question.Question;
import com.mycompany.loanplan.question.service.QuestionService;

@Controller
public class AdministorController {

	private static final Logger logger = LoggerFactory.getLogger(AdministorController.class);

	private static final int LIMIT = 10;

	private static final String file_path = "resources/img";

	@Autowired
	private AdministorService adminService;

	@Autowired
	private AdvertiseService advertiseService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private QuestionService questionService;

	// 대출 리스트창 띄우기
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {

			int currentPage = page;
			int listCount = adminService.loanCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", adminService.selectList(currentPage, LIMIT));
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

	@RequestMapping(value = "/creditLoan", method = RequestMethod.GET)
	public ModelAndView creditList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {

			int currentPage = page;
			int listCount = adminService.loancreditCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			List<RecommendLoanCredit> volist = adminService.recommendLoanCreditList(currentPage, LIMIT);
			mv.addObject("volist", adminService.recommendLoanCreditList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/creditLoanList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping(value = "/charterLoan", method = RequestMethod.GET)
	public ModelAndView charterList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			int listCount = adminService.loancharterCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", adminService.recommendLoanCharterList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/charterLoanList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping(value = "/loanSelect", method = RequestMethod.POST)
	@ResponseBody
	public void loanSelect(@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request,
			@RequestBody String param, HttpServletResponse response) throws Exception {
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();

		try {
			int currentPage = page;
			int listCount = adminService.loanCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);

			Gson gson = new GsonBuilder().create();

			JSONParser parser = new JSONParser();
			JSONObject job = (JSONObject) parser.parse(param);

			PrintWriter out = response.getWriter();

			String text = (String) job.get("text");
			System.out.println(text);
			if (text.equals("주택담보대출")) {
				List<Administor> list = adminService.recommendLoan(currentPage, LIMIT);
				String rLlist = gson.toJson(list);
				out.println(rLlist);
				System.out.println(list);
			} else if (text.equals("전세자금대출")) {
				List<RecommendLoanCharter> chlist = adminService.recommendLoanCharterList(currentPage, LIMIT);
				String rLlist = gson.toJson(chlist);
				out.println(rLlist);

			} else if (text.equals("개인신용대출")) {
				List<RecommendLoanCredit> crlist = adminService.recommendLoanCreditList(currentPage, LIMIT);
				String rLlist = gson.toJson(crlist);
				out.println(rLlist);
			} else {
				System.out.println("end");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 대출 추가창 띄우기
	@RequestMapping("/loanAdd")
	public ModelAndView addLoan(Administor ad, HttpServletRequest request, ModelAndView mv) {
		try {
			mv.setViewName("admin/loanAdd");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 주택담보 대출 추가
	@RequestMapping(value = "/guarAdd", method = RequestMethod.POST)
	public ModelAndView guarAdd(@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request,
			ModelAndView mv, @RequestParam("RL_IMG") MultipartFile file) {
		try {
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String fileName = file.getOriginalFilename();
			System.out.println(fileName);
			if (!fileName.isEmpty()) {
				file.transferTo(new File(root_path + file_path, fileName));
				System.out.println("업로드 성공");
			}
			String FIN_PRDT_NM = request.getParameter("FIN_PRDT_NM");
			String KOR_CO_NM = request.getParameter("KOR_CO_NM");
			String DCLS_MONTH = request.getParameter("DCLS_MONTH");
			String LEND_RATE_TYPE_NM = request.getParameter("LEND_RATE_TYPE_NM");
			String RPAY_TYPE_NM = request.getParameter("RPAY_TYPE_NM");
			String ERLY_RPAY_FEE = request.getParameter("ERLY_RPAY_FEE");
			String DLY_RATE = request.getParameter("DLY_RATE");
			String LOAN_LMT = request.getParameter("LOAN_LMT");
			String RL_URL = request.getParameter("RL_URL");
			String RL_IMG = file_path + "/" + fileName;
			RecommendLoan guar = new RecommendLoan(RL_IMG, RL_URL, DCLS_MONTH, KOR_CO_NM, FIN_PRDT_NM,
					LEND_RATE_TYPE_NM, RPAY_TYPE_NM, ERLY_RPAY_FEE, DLY_RATE, LOAN_LMT);

			int result = adminService.guarInsert(guar);

			int currentPage = page;
			int listCount = adminService.loanCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", adminService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 신용 대출 추가
	@RequestMapping(value = "/creditAdd", method = RequestMethod.POST)
	public ModelAndView creditAdd(@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request,
			ModelAndView mv, @RequestParam("RL_CR_IMG") MultipartFile file) {
		try {
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String fileName = file.getOriginalFilename();
			if (!fileName.isEmpty()) {
				file.transferTo(new File(root_path + file_path, fileName));
				System.out.println("업로드 성공");
			}
			String KOR_CO_NM = request.getParameter("KOR_CO_NM");
			String DCLS_MONTH = request.getParameter("DCLS_MONTH");
			String CRDT_PRDT_TYPE_NM = request.getParameter("CRDT_PRDT_TYPE_NM");
			String CRDT_GRAD_1 = request.getParameter("CRDT_GRAD_1");
			String CRDT_GRAD_4 = request.getParameter("CRDT_GRAD_4");
			String CRDT_GRAD_5 = request.getParameter("CRDT_GRAD_5");
			String CRDT_GRAD_6 = request.getParameter("CRDT_GRAD_6");
			String CRDT_GRAD_10 = request.getParameter("CRDT_GRAD_10");
			String CRDT_GRAD_12 = request.getParameter("CRDT_GRAD_12");
			String CRDT_GRAD_13 = request.getParameter("CRDT_GRAD_13");
			String CRDT_GRAD_AVG = request.getParameter("CRDT_GRAD_AVG");
			String RL_CR_URL = request.getParameter("RL_CR_URL");
			String RL_CR_IMG = file_path + "/" + fileName;
			RecommendLoanCredit credit = new RecommendLoanCredit(RL_CR_IMG, RL_CR_URL, DCLS_MONTH, KOR_CO_NM,
					CRDT_PRDT_TYPE_NM, CRDT_GRAD_1, CRDT_GRAD_4, CRDT_GRAD_5, CRDT_GRAD_6, CRDT_GRAD_10, CRDT_GRAD_12,
					CRDT_GRAD_13, CRDT_GRAD_AVG);
			int result = adminService.creditInsert(credit);
			System.out.println(result);
			int currentPage = page;
			int listCount = adminService.loancreditCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			List<RecommendLoanCredit> volist = adminService.recommendLoanCreditList(currentPage, LIMIT);
			mv.addObject("volist", adminService.recommendLoanCreditList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/creditLoanList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 전세자금 대출 추가
	@RequestMapping(value = "/jeonAdd", method = RequestMethod.POST)
	public ModelAndView jeonAdd(@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request,
			ModelAndView mv, @RequestParam("RL_CH_IMG") MultipartFile file) {
		try {
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String fileName = file.getOriginalFilename();
			if (!fileName.isEmpty()) {
				file.transferTo(new File(root_path + file_path, fileName));
				System.out.println("업로드 성공");
			}
			String FIN_PRDT_NM = request.getParameter("FIN_PRDT_NM");
			String KOR_CO_NM = request.getParameter("KOR_CO_NM");
			String DCLS_MONTH = request.getParameter("DCLS_MONTH");
			String LEND_RATE_TYPE_NM = request.getParameter("LEND_RATE_TYPE_NM");
			String RPAY_TYPE_NM = request.getParameter("RPAY_TYPE_NM");
			String ERLY_RPAY_FEE = request.getParameter("ERLY_RPAY_FEE");
			String DLY_RATE = request.getParameter("DLY_RATE");
			String LOAN_LMT = request.getParameter("LOAN_LMT");
			String RL_URL = request.getParameter("RL_CH_URL");
			String RL_IMG = file_path + "/" + fileName;
			RecommendLoanCharter jeon = new RecommendLoanCharter(RL_IMG, RL_URL, DCLS_MONTH, KOR_CO_NM, FIN_PRDT_NM,
					LEND_RATE_TYPE_NM, RPAY_TYPE_NM, ERLY_RPAY_FEE, DLY_RATE, LOAN_LMT);
			int result = adminService.geonInsert(jeon);
			System.out.println(result);
			int currentPage = page;
			int listCount = adminService.loancharterCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", adminService.recommendLoanCharterList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/charterLoanList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 광고 리스트창 띄우기
	@RequestMapping(value = "/advertise", method = RequestMethod.GET)
	public ModelAndView advertisement(HttpServletRequest request, ModelAndView mv) {
		try {
			List<Advertise> advertiseList = advertiseService.advertiseList();
			mv.addObject("advertiseList", advertiseList);
			mv.setViewName("admin/advertiseMain");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 광고 추가창 띄우기
	@RequestMapping(value = "/advertiseAdd", method = RequestMethod.GET)
	public ModelAndView advertiseAdd(Administor ad, HttpServletRequest request, ModelAndView mv) {
		try {
			mv.setViewName("admin/advertiseAdd");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 광고 추가
	@RequestMapping(value = "/advertiseAdd.do", method = RequestMethod.POST)
	public ModelAndView advertiseAddDo(@RequestParam("AD_IMG") MultipartFile file, HttpServletRequest request,
			ModelAndView mv) {
		try {
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String fileName = file.getOriginalFilename();
			System.out.println(fileName);
			if (!fileName.isEmpty()) {
				file.transferTo(new File(root_path + file_path, fileName));
				System.out.println("업로드 성공");
			}
			String AD_TITLE = request.getParameter("AD_TITLE");
			String AD_CONTENT = request.getParameter("AD_CONTENT");
			String AD_IMG = file_path + "/" + fileName;
			String AD_SRC = request.getParameter("AD_SRC");
			Advertise adt = new Advertise(AD_TITLE, AD_CONTENT, AD_IMG, AD_SRC);
			int result = advertiseService.advertiseAdd(adt);
			System.out.println(AD_TITLE);
			List<Advertise> advertiseList = advertiseService.advertiseList();
			mv.addObject("advertiseList", advertiseList);
			mv.setViewName("admin/advertiseMain");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 주택담보 대출 상품 삭제
	@RequestMapping(value = "/deleteLoan", method = RequestMethod.GET)
	public ModelAndView deleteLoan(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "RL_NUM") int RL_NUM, ModelAndView mv) {
		try {
			System.out.println(RL_NUM);
			int result = adminService.deleteLoan(RL_NUM);
			int currentPage = page;
			int listCount = adminService.loanCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", adminService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 신용 대출 상품 삭제
	@RequestMapping(value = "/deleteCredit", method = RequestMethod.GET)
	public ModelAndView deleteCredit(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "RL_CR_NUM") int RL_CR_NUM, ModelAndView mv) {
		try {
			System.out.println(RL_CR_NUM);
			int result = adminService.deleteCredit(RL_CR_NUM);
			int currentPage = page;
			int listCount = adminService.loancreditCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", adminService.recommendLoanCreditList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/creditLoanList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 전세자금 대출 상품 삭제
	@RequestMapping(value = "/deleteCharter", method = RequestMethod.GET)
	public ModelAndView deleteCharter(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "RL_CH_NUM") int RL_CH_NUM, ModelAndView mv) {
		try {
			System.out.println(RL_CH_NUM);
			int result = adminService.deleteCharter(RL_CH_NUM);
			System.out.println(result);
			int currentPage = page;
			int listCount = adminService.loancharterCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", adminService.recommendLoanCharterList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/charterLoanList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 광고 삭제
	@RequestMapping(value = "/deleteAdvertise", method = RequestMethod.GET)
	public ModelAndView deleteAdvertise(@RequestParam(name = "AD_NUM") int AD_NUM, ModelAndView mv) {
		try {
			System.out.println(AD_NUM);
			int result = advertiseService.deleteAdvertise(AD_NUM);
			System.out.println(result);
			List<Advertise> advertiseList = advertiseService.advertiseList();
			System.out.println(advertiseList);
			mv.addObject("advertiseList", advertiseList);
			mv.setViewName("admin/advertiseMain");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 대출 상품 수정
	@RequestMapping(value = "/loanModify", method = RequestMethod.GET)
	public ModelAndView recommendLoanDetail(@RequestParam(name = "NUM") int NUM, ModelAndView mv) {
		try {
			mv.addObject("volist", adminService.recommendLoanDetail(NUM));
			mv.setViewName("admin/loanModify");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/loanModify.do", method = RequestMethod.POST)
	public ModelAndView loanModify(@RequestParam(name = "page", defaultValue = "1") int page,
			HttpServletRequest request, ModelAndView mv) {
		System.out.println("수정실행 진입");
		try {
			int RL_NUM = Integer.parseInt(request.getParameter("RL_NUM"));
			String FIN_PRDT_NM = request.getParameter("FIN_PRDT_NM");
			String KOR_CO_NM = request.getParameter("KOR_CO_NM");
			String DCLS_MONTH = request.getParameter("DCLS_MONTH");
			String LEND_RATE_TYPE_NM = request.getParameter("LEND_RATE_TYPE_NM");
			String RPAY_TYPE_NM = request.getParameter("RPAY_TYPE_NM");
			String ERLY_RPAY_FEE = request.getParameter("ERLY_RPAY_FEE");
			String DLY_RATE = request.getParameter("DLY_RATE");
			String LOAN_LMT = request.getParameter("LOAN_LMT");
			String RL_URL = request.getParameter("RL_URL");
			String RL_IMG = request.getParameter("RL_IMG");
			RecommendLoan guar = new RecommendLoan(RL_NUM, RL_IMG, RL_URL, DCLS_MONTH, KOR_CO_NM, FIN_PRDT_NM,
					LEND_RATE_TYPE_NM, RPAY_TYPE_NM, ERLY_RPAY_FEE, DLY_RATE, LOAN_LMT);
			int result = adminService.modifyLoan(guar);
			System.out.println(result);
			int currentPage = page;
			int listCount = adminService.loanCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", adminService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/charterModify", method = RequestMethod.GET)
	public ModelAndView recommendLoanCharterListDetail(@RequestParam(name = "NUM") int NUM, ModelAndView mv) {
		System.out.println("modify 진입");
		try {
			mv.addObject("volist", adminService.recommendLoanCharterListDetail(NUM));
			mv.setViewName("admin/charterModify");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/charterModify.do", method = RequestMethod.POST)
	public ModelAndView charterModify(@RequestParam(name = "page", defaultValue = "1") int page,
			HttpServletRequest request, ModelAndView mv) {
		System.out.println("수정실행 진입");
		try {
			int RL_CH_NUM = Integer.parseInt(request.getParameter("RL_CH_NUM"));
			String FIN_PRDT_NM = request.getParameter("FIN_PRDT_NM");
			String KOR_CO_NM = request.getParameter("KOR_CO_NM");
			String DCLS_MONTH = request.getParameter("DCLS_MONTH");
			String LEND_RATE_TYPE_NM = request.getParameter("LEND_RATE_TYPE_NM");
			String RPAY_TYPE_NM = request.getParameter("RPAY_TYPE_NM");
			String ERLY_RPAY_FEE = request.getParameter("ERLY_RPAY_FEE");
			String DLY_RATE = request.getParameter("DLY_RATE");
			String LOAN_LMT = request.getParameter("LOAN_LMT");
			String RL_CH_URL = request.getParameter("RL_CH_URL");
			String RL_CH_IMG = request.getParameter("RL_CH_IMG");
			RecommendLoanCharter charter = new RecommendLoanCharter(RL_CH_NUM, RL_CH_IMG, RL_CH_URL, DCLS_MONTH,
					KOR_CO_NM, FIN_PRDT_NM, LEND_RATE_TYPE_NM, RPAY_TYPE_NM, ERLY_RPAY_FEE, DLY_RATE, LOAN_LMT);
			int result = adminService.modifyCharter(charter);
			System.out.println(result);
			int currentPage = page;
			int listCount = adminService.loancharterCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", adminService.recommendLoanCharterList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/charterLoanList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/creditModify", method = RequestMethod.GET)
	public ModelAndView recommendLoanCreditListDetail(@RequestParam(name = "NUM") int NUM, ModelAndView mv) {
		System.out.println("modify 진입");
		System.out.println(adminService.recommendLoanCreditListDetail(NUM));
		try {
			List<RecommendLoanCredit> volist = adminService.recommendLoanCreditListDetail(NUM);
			mv.addObject("volist", volist);
			mv.setViewName("admin/creditModify");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/creditModify.do", method = RequestMethod.POST)
	public ModelAndView creditModify(@RequestParam(name = "page", defaultValue = "1") int page,
			HttpServletRequest request, ModelAndView mv) {
		System.out.println("수정실행 진입");
		try {
			int RL_CR_NUM = Integer.parseInt(request.getParameter("RL_CR_NUM"));
			String KOR_CO_NM = request.getParameter("KOR_CO_NM");
			String DCLS_MONTH = request.getParameter("DCLS_MONTH");
			String CRDT_PRDT_TYPE_NM = request.getParameter("CRDT_PRDT_TYPE_NM");
			// String Page= (request.getParameter("Page") == null) ? "1" :
			// request.getParameter("Page");
			String CRDT_GRAD_1 = (request.getParameter("CRDT_GRAD_1") == null) ? "0"
					: request.getParameter("CRDT_GRAD_1");
			String CRDT_GRAD_4 = (request.getParameter("CRDT_GRAD_4") == null) ? "0"
					: request.getParameter("CRDT_GRAD_4");
			String CRDT_GRAD_5 = (request.getParameter("CRDT_GRAD_5") == null) ? "0"
					: request.getParameter("CRDT_GRAD_5");
			String CRDT_GRAD_6 = (request.getParameter("CRDT_GRAD_6") == null) ? "0"
					: request.getParameter("CRDT_GRAD_6");
			String CRDT_GRAD_10 = (request.getParameter("CRDT_GRAD_10") == null) ? "0"
					: request.getParameter("CRDT_GRAD_10");
			String CRDT_GRAD_12 = (request.getParameter("CRDT_GRAD_12") == null) ? "0"
					: request.getParameter("CRDT_GRAD_12");
			String CRDT_GRAD_13 = (request.getParameter("CRDT_GRAD_13") == null) ? "0"
					: request.getParameter("CRDT_GRAD_13");
			String CRDT_GRAD_AVG = (request.getParameter("CRDT_GRAD_AVG") == null) ? "0"
					: request.getParameter("CRDT_GRAD_AVG");
			String RL_CR_URL = request.getParameter("RL_CR_URL");
			String RL_CR_IMG = request.getParameter("RL_CR_IMG");
			System.out.println(CRDT_GRAD_1);
			System.out.println(CRDT_GRAD_10);
			RecommendLoanCredit credit = new RecommendLoanCredit(RL_CR_NUM, RL_CR_IMG, RL_CR_URL, DCLS_MONTH, KOR_CO_NM,
					CRDT_PRDT_TYPE_NM, CRDT_GRAD_1, CRDT_GRAD_4, CRDT_GRAD_5, CRDT_GRAD_6, CRDT_GRAD_10, CRDT_GRAD_12,
					CRDT_GRAD_13, CRDT_GRAD_AVG);

			int result = adminService.modifyCredit(credit);
			System.out.println(result);
			int currentPage = page;
			int listCount = adminService.loancreditCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			List<RecommendLoanCredit> volist = adminService.recommendLoanCreditList(currentPage, LIMIT);
			mv.addObject("volist", adminService.recommendLoanCreditList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/creditLoanList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 회원관리 리스트창 띄우기
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public ModelAndView member(@RequestParam(name = "page", defaultValue = "1") int page,
			HttpServletRequest request, ModelAndView mv) {
		try {
			int currentPage = page;
			int listCount = memberService.memberCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("volist", adminService.recommendLoanCharterList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.addObject("memberlist", memberService.memberlist(currentPage, LIMIT));
			mv.setViewName("admin/member");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 댓글관리 리스트창 띄우기
	@RequestMapping(value = "/comment", method = RequestMethod.GET)
	public ModelAndView comment(HttpServletRequest request, ModelAndView mv) {
		System.out.println("관리자 공지사항관리 진입");
		try {
			System.out.println(questionService.questionList());
			mv.addObject("commentlist", questionService.questionList());
			mv.setViewName("admin/comment");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 공지사항 추가창 띄우기
	@RequestMapping(value = "/questionAdd", method = RequestMethod.GET)
	public ModelAndView questionAdd(Administor ad, HttpServletRequest request, ModelAndView mv) {
		try {
			mv.setViewName("admin/questionAdd");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 공지사항 추가
	@RequestMapping(value = "/questionAdd.do", method = RequestMethod.POST)
	public ModelAndView questionAddDo(HttpServletRequest request, ModelAndView mv) {
		try {
			String QUESTION_TITLE = request.getParameter("QUESTION_TITLE");
			String QUESTION_CONTENT = request.getParameter("QUESTION_CONTENT");
			Question q = new Question(QUESTION_TITLE, QUESTION_CONTENT);
			int result = questionService.insertQuestion(q);
			System.out.println(result);
			mv.addObject("commentlist", questionService.questionList());
			mv.setViewName("admin/comment");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	// 공지사항 삭제
		@RequestMapping(value = "/deleteQuestion", method = RequestMethod.GET)
		public ModelAndView deleteQuestion(@RequestParam(name = "QUESTION_NUM") int QUESTION_NUM, ModelAndView mv) {
			try {
				int result = questionService.deleteQuestion(QUESTION_NUM);
				System.out.println(result);
				mv.addObject("commentlist", questionService.questionList());
				mv.setViewName("admin/comment");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mv;
		}
}
