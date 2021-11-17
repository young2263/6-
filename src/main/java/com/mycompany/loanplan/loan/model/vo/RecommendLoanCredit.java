package com.mycompany.loanplan.loan.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class RecommendLoanCredit {
	private static final long serialVersionUID = 1111L;
	private int RL_CR_NUM;
	private String RL_CR_IMG;
	private String RL_CR_URL;
	private Date DCLS_MONTH;
	private String KOR_CO_NM;
	private String CRDT_PRDT_TYPE_NM;
	private int CRDT_GRAD_1;
	private int CRDT_GRAD_4;
	private int CRDT_GRAD_5;
	private int CRDT_GRAD_6;
	private int CRDT_GRAD_10;
	private int CRDT_GRAD_12;
	private int CRDT_GRAD_13;
	private int CRDT_GRAD_AVG;
	
	public RecommendLoanCredit() {}
	
	public RecommendLoanCredit(int rlcrnum, String rlcrimg, String rlcrurl, Date dclsmonth, String korconm, String crdtprdttypenm, int crdtgrad1, int crdtgrad4, int crdtgrad5, int crdtgrad6, int crdtgrad10, int crdtgrad12, int crdtgrad13, int crdtgradavg) {
		super();
		this.RL_CR_NUM = rlcrnum;
		this.RL_CR_IMG = rlcrimg;
		this.RL_CR_URL = rlcrurl;
		this.DCLS_MONTH = dclsmonth;
		this.KOR_CO_NM = korconm;
		this.CRDT_PRDT_TYPE_NM = crdtprdttypenm;
		this.CRDT_GRAD_1 = crdtgrad1;
		this.CRDT_GRAD_4 = crdtgrad4;
		this.CRDT_GRAD_5 = crdtgrad5;
		this.CRDT_GRAD_6 = crdtgrad6;
		this.CRDT_GRAD_10 = crdtgrad10;
		this.CRDT_GRAD_12 = crdtgrad12;
		this.CRDT_GRAD_13 = crdtgrad13;
		this.CRDT_GRAD_AVG = crdtgradavg;
	}

	@Override
	public String toString() {
		return "RecommendLoanCredit [RL_CR_NUM=" + RL_CR_NUM + ", RL_CR_IMG=" + RL_CR_IMG + ", RL_CR_URL=" + RL_CR_URL
				+ ", DCLS_MONTH=" + DCLS_MONTH + ", KOR_CO_NM=" + KOR_CO_NM + ", CRDT_PRDT_TYPE_NM=" + CRDT_PRDT_TYPE_NM
				+ ", CRDT_GRAD_1=" + CRDT_GRAD_1 + ", CRDT_GRAD_4=" + CRDT_GRAD_4 + ", CRDT_GRAD_5=" + CRDT_GRAD_5
				+ ", CRDT_GRAD_6=" + CRDT_GRAD_6 + ", CRDT_GRAD_10=" + CRDT_GRAD_10 + ", CRDT_GRAD_12=" + CRDT_GRAD_12
				+ ", CRDT_GRAD_13=" + CRDT_GRAD_13 + ", CRDT_GRAD_AVG=" + CRDT_GRAD_AVG + "]";
	}

	public int getRL_CR_NUM() {
		return RL_CR_NUM;
	}

	public void setRL_CR_NUM(int rL_CR_NUM) {
		RL_CR_NUM = rL_CR_NUM;
	}

	public String getRL_CR_IMG() {
		return RL_CR_IMG;
	}

	public void setRL_CR_IMG(String rL_CR_IMG) {
		RL_CR_IMG = rL_CR_IMG;
	}

	public String getRL_CR_URL() {
		return RL_CR_URL;
	}

	public void setRL_CR_URL(String rL_CR_URL) {
		RL_CR_URL = rL_CR_URL;
	}

	public Date getDCLS_MONTH() {
		return DCLS_MONTH;
	}

	public void setDCLS_MONTH(Date dCLS_MONTH) {
		DCLS_MONTH = dCLS_MONTH;
	}

	public String getKOR_CO_NM() {
		return KOR_CO_NM;
	}

	public void setKOR_CO_NM(String kOR_CO_NM) {
		KOR_CO_NM = kOR_CO_NM;
	}

	public String getCRDT_PRDT_TYPE_NM() {
		return CRDT_PRDT_TYPE_NM;
	}

	public void setCRDT_PRDT_TYPE_NM(String cRDT_PRDT_TYPE_NM) {
		CRDT_PRDT_TYPE_NM = cRDT_PRDT_TYPE_NM;
	}

	public int getCRDT_GRAD_1() {
		return CRDT_GRAD_1;
	}

	public void setCRDT_GRAD_1(int cRDT_GRAD_1) {
		CRDT_GRAD_1 = cRDT_GRAD_1;
	}

	public int getCRDT_GRAD_4() {
		return CRDT_GRAD_4;
	}

	public void setCRDT_GRAD_4(int cRDT_GRAD_4) {
		CRDT_GRAD_4 = cRDT_GRAD_4;
	}

	public int getCRDT_GRAD_5() {
		return CRDT_GRAD_5;
	}

	public void setCRDT_GRAD_5(int cRDT_GRAD_5) {
		CRDT_GRAD_5 = cRDT_GRAD_5;
	}

	public int getCRDT_GRAD_6() {
		return CRDT_GRAD_6;
	}

	public void setCRDT_GRAD_6(int cRDT_GRAD_6) {
		CRDT_GRAD_6 = cRDT_GRAD_6;
	}

	public int getCRDT_GRAD_10() {
		return CRDT_GRAD_10;
	}

	public void setCRDT_GRAD_10(int cRDT_GRAD_10) {
		CRDT_GRAD_10 = cRDT_GRAD_10;
	}

	public int getCRDT_GRAD_12() {
		return CRDT_GRAD_12;
	}

	public void setCRDT_GRAD_12(int cRDT_GRAD_12) {
		CRDT_GRAD_12 = cRDT_GRAD_12;
	}

	public int getCRDT_GRAD_13() {
		return CRDT_GRAD_13;
	}

	public void setCRDT_GRAD_13(int cRDT_GRAD_13) {
		CRDT_GRAD_13 = cRDT_GRAD_13;
	}

	public int getCRDT_GRAD_AVG() {
		return CRDT_GRAD_AVG;
	}

	public void setCRDT_GRAD_AVG(int cRDT_GRAD_AVG) {
		CRDT_GRAD_AVG = cRDT_GRAD_AVG;
	}
	
	
}
