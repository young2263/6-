package com.mycompany.loanplan.admin.model.vo;



import org.springframework.stereotype.Component;

@Component
public class Administor {
	private static final long serialVersionUID = 1111L;
	private int RL_NUM;
	private String RL_CATEGORY;
	private String RL_IMG;
	private String RL_URL;
	private String DCLS_MONTH;
	private String KOR_CO_NM;
	private String FIN_PRDT_NM;
	private String LEND_RATE_TYPE_NM;
	private String RPAY_TYPE_NM;
	private String ERLY_RPAY_FEE;
	private String DLY_RATE;
	private String LOAN_LMT;

	public Administor() {

	}

	@Override
	public String toString() {
		return "Administor [RL_NUM=" + RL_NUM + ", RL_CATEGORY=" + RL_CATEGORY + ", RL_IMG=" + RL_IMG + ", RL_URL="
				+ RL_URL + ", DCLS_MONTH=" + DCLS_MONTH + ", KOR_CO_NM=" + KOR_CO_NM + ", FIN_PRDT_NM=" + FIN_PRDT_NM
				+ ", LEND_RATE_TYPE_NM=" + LEND_RATE_TYPE_NM + ", RPAY_TYPE_NM=" + RPAY_TYPE_NM + ", ERLY_RPAY_FEE="
				+ ERLY_RPAY_FEE + ", DLY_RATE=" + DLY_RATE + ", LOAN_LMT=" + LOAN_LMT + "]";
	}

	public Administor(int rL_NUM, String rL_CATEGORY, String rL_IMG, String rL_URL, String dCLS_MONTH, String kOR_CO_NM,
			String fIN_PRDT_NM, String lEND_RATE_TYPE_NM, String rPAY_TYPE_NM, String eRLY_RPAY_FEE, String dLY_RATE,
			String lOAN_LMT) {
		super();
		RL_NUM = rL_NUM;
		RL_CATEGORY = rL_CATEGORY;
		RL_IMG = rL_IMG;
		RL_URL = rL_URL;
		DCLS_MONTH = dCLS_MONTH;
		KOR_CO_NM = kOR_CO_NM;
		FIN_PRDT_NM = fIN_PRDT_NM;
		LEND_RATE_TYPE_NM = lEND_RATE_TYPE_NM;
		RPAY_TYPE_NM = rPAY_TYPE_NM;
		ERLY_RPAY_FEE = eRLY_RPAY_FEE;
		DLY_RATE = dLY_RATE;
		LOAN_LMT = lOAN_LMT;
	}

	public int getRL_NUM() {
		return RL_NUM;
	}

	public void setRL_NUM(int rL_NUM) {
		RL_NUM = rL_NUM;
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
