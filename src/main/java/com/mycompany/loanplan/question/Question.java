package com.mycompany.loanplan.question;

public class Question {	
	
	private static final long serialVersionUID = 1111L;
	private int Q_NUM;
	private String Q_TITLE;
	private String Q_CONTENT;
	private String Q_IMG;
	
	
	public Question() {
		
	}
	
	
	
	public Question(int q_NUM, String q_TITLE, String q_CONTENT, String q_IMG) {
		super();
		Q_NUM = q_NUM;
		Q_TITLE = q_TITLE;
		Q_CONTENT = q_CONTENT;
		Q_IMG = q_IMG;
	}



	public int getQ_NUM() {
		return Q_NUM;
	}
	public void setQ_NUM(int q_NUM) {
		Q_NUM = q_NUM;
	}
	public String getQ_TITLE() {
		return Q_TITLE;
	}
	public void setQ_TITLE(String q_TITLE) {
		Q_TITLE = q_TITLE;
	}
	public String getQ_CONTENT() {
		return Q_CONTENT;
	}
	public void setQ_CONTENT(String q_CONTENT) {
		Q_CONTENT = q_CONTENT;
	}
	public String getQ_IMG() {
		return Q_IMG;
	}
	public void setQ_IMG(String q_IMG) {
		Q_IMG = q_IMG;
	}
	
	
	@Override
	public String toString() {
		return "Question [Q_NUM=" + Q_NUM + ", Q_TITLE=" + Q_TITLE + ", Q_CONTENT=" + Q_CONTENT + ", Q_IMG=" + Q_IMG
				+ "]";
	}
	
	
	
}