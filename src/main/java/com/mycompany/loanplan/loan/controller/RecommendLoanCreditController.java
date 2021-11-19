package com.mycompany.loanplan.loan.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class RecommendLoanCreditController {
	
	@RequestMapping(value = "recommendloancreditlist",  method = RequestMethod.GET)
	public String recommendLoanCredit() {
		StringBuffer result = new StringBuffer();
		try {
			StringBuilder urlBuilder = new StringBuilder("http://finlife.fss.or.kr/finlifeapi/creditLoanProductsSearch"); /* url */
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=ca671628ffa24c972229e54f6db94508"); /* Service Key */
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));  /* 페이지 번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("7", "UTF-8"));  /* 한 페이지 결과 수 */
			urlBuilder.append("&type=json");
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <=300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			String line;
			while ((line = rd.readLine()) != null) {
				result.append(line + "\n");
			}
			rd.close();
			conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result + "";
	}
}
