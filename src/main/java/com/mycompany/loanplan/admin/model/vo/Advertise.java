package com.mycompany.loanplan.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Advertise {

	private static final long serialVersionUID = 1111L;
	private int AD_NUM;
	private String AD_TITLE;
	private String AD_CONTENT;
	private String AD_IMG;
	private String AD_SRC;
	
	public Advertise() {
		
	}

	public Advertise(String aD_TITLE, String aD_CONTENT, String aD_IMG, String aD_SRC) {
		super();
		AD_TITLE = aD_TITLE;
		AD_CONTENT = aD_CONTENT;
		AD_IMG = aD_IMG;
		AD_SRC = aD_SRC;
	}

	public int getAD_NUM() {
		return AD_NUM;
	}

	public void setAD_NUM(int aD_NUM) {
		AD_NUM = aD_NUM;
	}

	public String getAD_TITLE() {
		return AD_TITLE;
	}

	public void setAD_TITLE(String aD_TITLE) {
		AD_TITLE = aD_TITLE;
	}

	public String getAD_CONTENT() {
		return AD_CONTENT;
	}

	public void setAD_CONTENT(String aD_CONTENT) {
		AD_CONTENT = aD_CONTENT;
	}

	public String getAD_IMG() {
		return AD_IMG;
	}

	public void setAD_IMG(String aD_IMG) {
		AD_IMG = aD_IMG;
	}

	public String getAD_SRC() {
		return AD_SRC;
	}

	public void setAD_SRC(String aD_SRC) {
		AD_SRC = aD_SRC;
	}


	
}
