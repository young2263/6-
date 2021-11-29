package com.mycompany.loanplan.loan.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class RecommendLoanCharter {
	private static final long serialVersionUID = 1111L;
	private int RL_CH_NUM; // 대출번호
	private String RL_CH_IMG; // 이미지
	private String RL_CH_URL; // url
	private String DCLS_MONTH; // 공시제출월
	private String KOR_CO_NM; // 금융회사명
	private String FIN_PRDT_NM; // 금융상품명
	private String LEND_RATE_TYPE_NM; // 대출금리유형
	private String RPAY_TYPE_NM; // 대출상환유형
	private String ERLY_RPAY_FEE; // 중도상환수수료
	private String DLY_RATE; // 연체이자율
	private String LOAN_LMT; // 대출한도
	
	public RecommendLoanCharter() {
		
	}
	
	public RecommendLoanCharter(int rlchnum, String rlchcategory, String rlchimg, String rlchurl, String dclsmonth, String korconm, String finprdtnm, String lendratetypenm, String rpaytypenm, String erlyrpayfee, String dlyrate, String loanlmt) {
		super();
		this.RL_CH_NUM = rlchnum;
		this.RL_CH_IMG = rlchimg;
		this.RL_CH_URL = rlchurl;
		this.DCLS_MONTH = dclsmonth;
		this.KOR_CO_NM = korconm;
		this.FIN_PRDT_NM = finprdtnm;
		this.LEND_RATE_TYPE_NM = lendratetypenm;
		this.RPAY_TYPE_NM = rpaytypenm;
		this.ERLY_RPAY_FEE = erlyrpayfee;
		this.DLY_RATE = dlyrate;
		this.LOAN_LMT = loanlmt;
	}
	
	public RecommendLoanCharter(String rlchimg, String rlchurl, String dclsmonth, String korconm, String finprdtnm, String lendratetypenm, String rpaytypenm, String erlyrpayfee, String dlyrate, String loanlmt) {
		super();
		this.RL_CH_IMG = rlchimg;
		this.RL_CH_URL = rlchurl;
		this.DCLS_MONTH = dclsmonth;
		this.KOR_CO_NM = korconm;
		this.FIN_PRDT_NM = finprdtnm;
		this.LEND_RATE_TYPE_NM = lendratetypenm;
		this.RPAY_TYPE_NM = rpaytypenm;
		this.ERLY_RPAY_FEE = erlyrpayfee;
		this.DLY_RATE = dlyrate;
		this.LOAN_LMT = loanlmt;
	}

	@Override
	public String toString() {
		return "RecommendLoanCharter [RL_CH_NUM=" + RL_CH_NUM + ", RL_CH_IMG=" + RL_CH_IMG + ", RL_CH_URL=" + RL_CH_URL
				+ ", DCLS_MONTH=" + DCLS_MONTH + ", KOR_CO_NM=" + KOR_CO_NM + ", FIN_PRDT_NM=" + FIN_PRDT_NM
				+ ", LEND_RATE_TYPE_NM=" + LEND_RATE_TYPE_NM + ", RPAY_TYPE_NM=" + RPAY_TYPE_NM + ", ERLY_RPAY_FEE="
				+ ERLY_RPAY_FEE + ", DLY_RATE=" + DLY_RATE + ", LOAN_LMT=" + LOAN_LMT + "]";
	}

	public int getRL_CH_NUM() {
		return RL_CH_NUM;
	}

	public void setRL_CH_NUM(int rL_CH_NUM) {
		RL_CH_NUM = rL_CH_NUM;
	}

	public String getRL_CH_IMG() {
		return RL_CH_IMG;
	}

	public void setRL_CH_IMG(String rL_CH_IMG) {
		RL_CH_IMG = rL_CH_IMG;
	}

	public String getRL_CH_URL() {
		return RL_CH_URL;
	}

	public void setRL_CH_URL(String rL_CH_URL) {
		RL_CH_URL = rL_CH_URL;
	}

	public String getDCLS_MONTH() {
		return DCLS_MONTH;
	}

	public void setDCLS_MONTH(String dCLS_MONTH) {
		DCLS_MONTH = dCLS_MONTH;
	}

	public String getKOR_CO_NM() {
		return KOR_CO_NM;
	}

	public void setKOR_CO_NM(String kOR_CO_NM) {
		KOR_CO_NM = kOR_CO_NM;
	}

	public String getFIN_PRDT_NM() {
		return FIN_PRDT_NM;
	}

	public void setFIN_PRDT_NM(String fIN_PRDT_NM) {
		FIN_PRDT_NM = fIN_PRDT_NM;
	}

	public String getLEND_RATE_TYPE_NM() {
		return LEND_RATE_TYPE_NM;
	}

	public void setLEND_RATE_TYPE_NM(String lEND_RATE_TYPE_NM) {
		LEND_RATE_TYPE_NM = lEND_RATE_TYPE_NM;
	}

	public String getRPAY_TYPE_NM() {
		return RPAY_TYPE_NM;
	}

	public void setRPAY_TYPE_NM(String rPAY_TYPE_NM) {
		RPAY_TYPE_NM = rPAY_TYPE_NM;
	}

	public String getERLY_RPAY_FEE() {
		return ERLY_RPAY_FEE;
	}

	public void setERLY_RPAY_FEE(String eRLY_RPAY_FEE) {
		ERLY_RPAY_FEE = eRLY_RPAY_FEE;
	}

	public String getDLY_RATE() {
		return DLY_RATE;
	}

	public void setDLY_RATE(String dLY_RATE) {
		DLY_RATE = dLY_RATE;
	}

	public String getLOAN_LMT() {
		return LOAN_LMT;
	}

	public void setLOAN_LMT(String lOAN_LMT) {
		LOAN_LMT = lOAN_LMT;
	}

	
	
	
}
