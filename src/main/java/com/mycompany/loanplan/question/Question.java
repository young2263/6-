package com.mycompany.loanplan.question;

public class Question {	
	
	private static final long serialVersionUID = 1111L;
	private int Q_NUM;
	private String Q_TITLE;
	private String Q_CONTENT;
	
	
	
	public Question() {
		
	}
	
	
	
	public Question(int q_NUM, String q_TITLE, String q_CONTENT) {
		super();
		Q_NUM = q_NUM;
		Q_TITLE = q_TITLE;
		Q_CONTENT = q_CONTENT;

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



	@Override
	public String toString() {
		return "Question [Q_NUM=" + Q_NUM + ", Q_TITLE=" + Q_TITLE + ", Q_CONTENT=" + Q_CONTENT + "]";
	}
	
	
	

	
	
}