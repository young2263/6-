package com.mycompany.loanplan.calculator;

public class Calcul {
	
	private String C_REPAY;
	private String C_SUM;
	private int C_RATE;
	private int C_PERIOD;
	private String U_ID;
	
	
	
	public Calcul() {
		
	}
	
	
	
	public Calcul(String c_REPAY, String c_SUM, int c_RATE, int c_PERIOD, String u_ID) {
		super();
		C_REPAY = c_REPAY;
		C_SUM = c_SUM;
		C_RATE = c_RATE;
		C_PERIOD = c_PERIOD;
		U_ID = u_ID;
	}



	@Override
	public String toString() {
		return "Calcul [C_REPAY=" + C_REPAY + ", C_SUM=" + C_SUM + ", C_RATE=" + C_RATE + ", C_PERIOD=" + C_PERIOD
				+ ", U_ID=" + U_ID + "]";
	}
	public String getC_REPAY() {
		return C_REPAY;
	}
	public void setC_REPAY(String c_REPAY) {
		C_REPAY = c_REPAY;
	}
	public String getC_SUM() {
		return C_SUM;
	}
	public void setC_SUM(String c_SUM) {
		C_SUM = c_SUM;
	}
	public int getC_RATE() {
		return C_RATE;
	}
	public void setC_RATE(int c_RATE) {
		C_RATE = c_RATE;
	}
	public int getC_PERIOD() {
		return C_PERIOD;
	}
	public void setC_PERIOD(int c_PERIOD) {
		C_PERIOD = c_PERIOD;
	}
	public String getU_ID() {
		return U_ID;
	}
	public void setU_ID(String u_ID) {
		U_ID = u_ID;
	}
	
	

}
