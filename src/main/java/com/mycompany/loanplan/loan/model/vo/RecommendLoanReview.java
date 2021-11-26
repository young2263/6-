package com.mycompany.loanplan.loan.model.vo;

import org.springframework.stereotype.Component;

@Component
public class RecommendLoanReview implements java.io.Serializable {
	private static final long serialVersionUID = 1111L;
	private int RLR_NUM;
	private int RLR_AST;
	private String RLR_COMMENT;
	private int RL_NUM;
	private String M_ID;
	
	public RecommendLoanReview() {}
	
	public RecommendLoanReview(int RLR_NUM, int RLR_AST, String RLR_COMMENT, int RL_NUM, String M_ID) {
		super();
		this.RLR_NUM = RLR_NUM;
		this.RLR_AST = RLR_AST;
		this.RLR_COMMENT = RLR_COMMENT;
		this.RL_NUM = RL_NUM;
		this.M_ID = M_ID;
	}

	@Override
	public String toString() {
		return "RecommendLoanReview [RLR_NUM=" + RLR_NUM + ", RLR_AST=" + RLR_AST + ", RLR_COMMENT=" + RLR_COMMENT
				+ ", RL_NUM=" + RL_NUM + ", M_ID=" + M_ID + "]";
	}

	public int getRLR_NUM() {
		return RLR_NUM;
	}

	public void setRLR_NUM(int rLR_NUM) {
		RLR_NUM = rLR_NUM;
	}

	public int getRLR_AST() {
		return RLR_AST;
	}

	public void setRLR_AST(int rLR_AST) {
		RLR_AST = rLR_AST;
	}

	public String getRLR_COMMENT() {
		return RLR_COMMENT;
	}

	public void setRLR_COMMENT(String rLR_COMMENT) {
		RLR_COMMENT = rLR_COMMENT;
	}

	public int getRL_NUM() {
		return RL_NUM;
	}

	public void setRL_NUM(int rL_NUM) {
		RL_NUM = rL_NUM;
	}

	public String getM_ID() {
		return M_ID;
	}

	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}
	
	
}
