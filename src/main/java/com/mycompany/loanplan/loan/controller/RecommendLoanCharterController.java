package com.mycompany.loanplan.loan.controller;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RecommendLoanCharterController {
	
	@RequestMapping(value = "recommendloancharterlist", method = RequestMethod.GET)
	public static void main(String[] args) {
		
		//인증키
		String key = "ca671628ffa24c972229e54f6db94508";
		
		//데이터를 저장할 변수
		String result = "charterLoan";
		
		try {
			
			URL url = new URL("http://finlife.fss.or.kr/finlifeapi/rentHouseLoanProductsSearch.json?auth="
					+ key + "&topFinGrpNo=050000&pageNo=1");
			
			BufferedReader bf;
			
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
			JSONObject product = (JSONObject)jsonObject.get("product");
			JSONObject baseinfo = (JSONObject)product.get("baseinfo");
			
			JSONArray dcls_month = (JSONArray)baseinfo.get("dcls_month");
			JSONArray kor_co_nm = (JSONArray)baseinfo.get("kor_co_nm");
			JSONArray fin_prdt_nm = (JSONArray)baseinfo.get("fin_prdt_nm");
			JSONArray lend_rate_type_nm = (JSONArray)baseinfo.get("lend_rate_type_nm");
			JSONArray rpay_type_nm = (JSONArray)baseinfo.get("rpay_type_nm");
			JSONArray erly_rpat_fee = (JSONArray)baseinfo.get("erly_rpat_fee");
			JSONArray dly_rate = (JSONArray)baseinfo.get("dly_rate");
			JSONArray loan_lmt = (JSONArray)baseinfo.get("loan_lmt");
			
			System.out.println("공시제출월 : " + baseinfo.get("dcls_month"));
			System.out.println("금융회사명 : " + baseinfo.get("kor_co_nm"));
			System.out.println("금융상품명 : " + baseinfo.get("fin_prdt_nm"));
			System.out.println("대출금리유형 : " + baseinfo.get("lend_rate_type_nm"));
			System.out.println("대출상환유형 : " + baseinfo.get("rpay_type_nm"));
			System.out.println("중도상환수수료 : " + baseinfo.get("erly_rpat_fee"));
			System.out.println("연체이자율 : " + baseinfo.get("dly_rate"));
			System.out.println("대출한도 : " + baseinfo.get("loan_lmt"));
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


}
