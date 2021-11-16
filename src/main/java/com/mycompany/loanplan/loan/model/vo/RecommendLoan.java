package com.mycompany.loanplan.loan.model.vo;

import java.sql.Date;

public class RecommendLoan {
	private static final long serialVersionUID = 1111L;
	private int RL_NUM;
	private String RL_NAME;
	private String RL_BANK;
	private Date RL_DATE;
	private String RL_SUM;
	private String RL_PS;
	private String RL_MTD;
	private String RL_ICMTD;
	private String RL_CMTD;
	private int RL_IL;
	private String RL_CATEGORY;
	private String RL_IMG;
	private String RL_URL;
	private int RL_PHN;
	
	public RecommendLoan() {
		
	}
	
	public RecommendLoan(int rlnum, String rlname, String rlbank, Date rldate, String rlsum, String rlps, String rlmtd, String rlicmtd, String rlcmtd, int rlil, String rlcategory, String rlimg, String rlurl, int rlphn) {
		super();
		this.RL_NUM = rlnum;
		this.RL_NAME = rlname;
		this.RL_BANK = rlbank;
		this.RL_DATE = rldate;
		this.RL_SUM = rlsum;
		this.RL_PS = rlps;
		this.RL_MTD = rlmtd;
		this.RL_ICMTD = rlicmtd;
		this.RL_CMTD = rlcmtd;
		this.RL_IL = rlil;
		this.RL_CATEGORY = rlcategory;
		this.RL_IMG = rlimg;
		this.RL_URL = rlurl;
		this.RL_PHN = rlphn;
	}

	@Override
	public String toString() {
		return "Loan [RL_NUM=" + RL_NUM + ", RL_NAME=" + RL_NAME + ", RL_BANK=" + RL_BANK + ", RL_DATE=" + RL_DATE
				+ ", RL_SUM=" + RL_SUM + ", RL_PS=" + RL_PS + ", RL_MTD=" + RL_MTD + ", RL_ICMTD=" + RL_ICMTD
				+ ", RL_CMTD=" + RL_CMTD + ", RL_IL=" + RL_IL + ", RL_CATEGORY=" + RL_CATEGORY + ", RL_IMG=" + RL_IMG
				+ ", RL_URL=" + RL_URL + ", RL_PHN=" + RL_PHN + "]";
	}

	public int getRL_NUM() {
		return RL_NUM;
	}

	public void setRL_NUM(int rL_NUM) {
		RL_NUM = rL_NUM;
	}

	public String getRL_NAME() {
		return RL_NAME;
	}

	public void setRL_NAME(String rL_NAME) {
		RL_NAME = rL_NAME;
	}

	public String getRL_BANK() {
		return RL_BANK;
	}

	public void setRL_BANK(String rL_BANK) {
		RL_BANK = rL_BANK;
	}

	public Date getRL_DATE() {
		return RL_DATE;
	}

	public void setRL_DATE(Date rL_DATE) {
		RL_DATE = rL_DATE;
	}

	public String getRL_SUM() {
		return RL_SUM;
	}

	public void setRL_SUM(String rL_SUM) {
		RL_SUM = rL_SUM;
	}

	public String getRL_PS() {
		return RL_PS;
	}

	public void setRL_PS(String rL_PS) {
		RL_PS = rL_PS;
	}

	public String getRL_MTD() {
		return RL_MTD;
	}

	public void setRL_MTD(String rL_MTD) {
		RL_MTD = rL_MTD;
	}

	public String getRL_ICMTD() {
		return RL_ICMTD;
	}

	public void setRL_ICMTD(String rL_ICMTD) {
		RL_ICMTD = rL_ICMTD;
	}

	public String getRL_CMTD() {
		return RL_CMTD;
	}

	public void setRL_CMTD(String rL_CMTD) {
		RL_CMTD = rL_CMTD;
	}

	public int getRL_IL() {
		return RL_IL;
	}

	public void setRL_IL(int rL_IL) {
		RL_IL = rL_IL;
	}

	public String getRL_CATEGORY() {
		return RL_CATEGORY;
	}

	public void setRL_CATEGORY(String rL_CATEGORY) {
		RL_CATEGORY = rL_CATEGORY;
	}

	public String getRL_IMG() {
		return RL_IMG;
	}

	public void setRL_IMG(String rL_IMG) {
		RL_IMG = rL_IMG;
	}

	public String getRL_URL() {
		return RL_URL;
	}

	public void setRL_URL(String rL_URL) {
		RL_URL = rL_URL;
	}

	public int getRL_PHN() {
		return RL_PHN;
	}

	public void setRL_PHN(int rL_PHN) {
		RL_PHN = rL_PHN;
	}
}
