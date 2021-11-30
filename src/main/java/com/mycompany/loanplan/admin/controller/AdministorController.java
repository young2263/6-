package com.mycompany.loanplan.admin.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.PrinterInfo;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
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

@Controller
public class AdministorController {

	private static final Logger logger = LoggerFactory.getLogger(AdministorController.class);

	private static final int LIMIT = 10;
	
	

	@Autowired
	private AdministorService adminService;

	@Autowired
	private AdvertiseService advertiseService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		System.out.println("admin진입");
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

	@RequestMapping(value = "/guarAdd", method = RequestMethod.POST)
	public ModelAndView guarAdd(HttpServletRequest request, ModelAndView mv,
			@RequestParam("RL_IMG") MultipartFile file) {
		try {
			String FIN_PRDT_NM = request.getParameter("FIN_PRDT_NM");
			String KOR_CO_NM = request.getParameter("KOR_CO_NM");
			String DCLS_MONTH = request.getParameter("DCLS_MONTH");
			String LEND_RATE_TYPE_NM = request.getParameter("LEND_RATE_TYPE_NM");
			String RPAY_TYPE_NM = request.getParameter("RPAY_TYPE_NM");
			String ERLY_RPAY_FEE = request.getParameter("ERLY_RPAY_FEE");
			String DLY_RATE = request.getParameter("DLY_RATE");
			String LOAN_LMT = request.getParameter("LOAN_LMT");
			String RL_URL = request.getParameter("RL_URL");
			String RL_IMG = "test";
//			String RL_IMG = request.getParameter("RL_IMG");
			System.out.println(FIN_PRDT_NM);
			RecommendLoan guar = new RecommendLoan(RL_IMG, RL_URL, DCLS_MONTH, KOR_CO_NM, FIN_PRDT_NM,
					LEND_RATE_TYPE_NM, RPAY_TYPE_NM, ERLY_RPAY_FEE, DLY_RATE, LOAN_LMT);

			int result = adminService.guarInsert(guar);

			// 파일 업로드
			System.out.println(file.getOriginalFilename());

			System.out.println(result);
			mv.setViewName("admin/main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/creditAdd", method = RequestMethod.POST)
	public ModelAndView creditAdd(HttpServletRequest request, ModelAndView mv) {
		try {
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
			String RL_CR_IMG = request.getParameter("RL_CR_IMG");
			RecommendLoanCredit credit = new RecommendLoanCredit(RL_CR_IMG, RL_CR_URL, DCLS_MONTH, KOR_CO_NM,
					CRDT_PRDT_TYPE_NM, CRDT_GRAD_1, CRDT_GRAD_4, CRDT_GRAD_5, CRDT_GRAD_6, CRDT_GRAD_10, CRDT_GRAD_12,
					CRDT_GRAD_13, CRDT_GRAD_AVG);
			int result = adminService.creditInsert(credit);
			System.out.println(result);
			mv.setViewName("admin/main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/jeonAdd", method = RequestMethod.POST)
	public ModelAndView jeonAdd(HttpServletRequest request, ModelAndView mv) {
		try {
			String FIN_PRDT_NM = request.getParameter("FIN_PRDT_NM");
			String KOR_CO_NM = request.getParameter("KOR_CO_NM");
			String DCLS_MONTH = request.getParameter("DCLS_MONTH");
			String LEND_RATE_TYPE_NM = request.getParameter("LEND_RATE_TYPE_NM");
			String RPAY_TYPE_NM = request.getParameter("RPAY_TYPE_NM");
			String ERLY_RPAY_FEE = request.getParameter("ERLY_RPAY_FEE");
			String DLY_RATE = request.getParameter("DLY_RATE");
			String LOAN_LMT = request.getParameter("LOAN_LMT");
			String RL_URL = request.getParameter("RL_CH_URL");
			String RL_IMG = request.getParameter("RL_CH_IMG");
			RecommendLoanCharter jeon = new RecommendLoanCharter(RL_IMG, RL_URL, DCLS_MONTH, KOR_CO_NM, FIN_PRDT_NM,
					LEND_RATE_TYPE_NM, RPAY_TYPE_NM, ERLY_RPAY_FEE, DLY_RATE, LOAN_LMT);
			int result = adminService.geonInsert(jeon);
			System.out.println(result);
			mv.setViewName("admin/main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/advertise", method = RequestMethod.GET)
	public ModelAndView advertisement(Administor ad, HttpServletRequest request, ModelAndView mv) {
		try {
			List<Advertise> advertiseList = advertiseService.advertiseList();
			mv.addObject("advertiseList", advertiseList);
			mv.setViewName("admin/advertiseMain");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/advertiseAdd", method = RequestMethod.GET)
	public ModelAndView advertiseAdd(Administor ad, HttpServletRequest request, ModelAndView mv) {
		try {
			mv.setViewName("admin/advertiseAdd");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/advertiseAdd.do", method = RequestMethod.POST)
	public ModelAndView advertiseAddDo(Administor ad, HttpServletRequest request, ModelAndView mv) {
		try {
			String AD_TITLE = request.getParameter("AD_TITLE");
			String AD_CONTENT = request.getParameter("AD_CONTENT");
			String AD_IMG = request.getParameter("AD_IMG");
			String AD_SRC = request.getParameter("AD_SRC");
			Advertise adt = new Advertise(AD_TITLE, AD_CONTENT, AD_IMG, AD_SRC);
			int result = advertiseService.advertiseAdd(adt);
			System.out.println(result);
			List<Advertise> advertiseList = advertiseService.advertiseList();
			mv.addObject("advertiseList", advertiseList);
			mv.setViewName("admin/advertiseMain");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public String upload(MultipartHttpServletRequest request) throws Exception{
		System.out.println("진입");
		Iterator itr = request.getFileNames();
		System.out.println(itr);
		
		if(itr.hasNext()) {
			List mpf = request.getFiles((String) itr.next());
//			for(int i = 0; i < mpf.size(); i++) 
//			{ File file = new File(PATH + mpf.get(i).getOriginalFilename());
//			logger.info(file.getAbsolutePath()); 
//			mpf.get(i).transferTo(file); 
//			}
		}
		return "success";
	}

}
