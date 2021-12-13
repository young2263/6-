package com.mycompany.loanplan.question;

public class Question {

	private static final long serialVersionUID = 1111L;
	private int QUESTION_NUM;
	private String QUESTION_TITLE;
	private String QUESTION_CONTENT;
	
	public Question() {
		
	}

	public Question(int qUESTION_NUM, String qUESTION_TITLE, String qUESTION_CONTENT) {
		super();
		QUESTION_NUM = qUESTION_NUM;
		QUESTION_TITLE = qUESTION_TITLE;
		QUESTION_CONTENT = qUESTION_CONTENT;
	}

	public int getQUESTION_NUM() {
		return QUESTION_NUM;
	}

	public void setQUESTION_NUM(int qUESTION_NUM) {
		QUESTION_NUM = qUESTION_NUM;
	}

	public String getQUESTION_TITLE() {
		return QUESTION_TITLE;
	}

	public void setQUESTION_TITLE(String qUESTION_TITLE) {
		QUESTION_TITLE = qUESTION_TITLE;
	}

	public String getQUESTION_CONTENT() {
		return QUESTION_CONTENT;
	}

	public void setQUESTION_CONTENT(String qUESTION_CONTENT) {
		QUESTION_CONTENT = qUESTION_CONTENT;
	}

	@Override
	public String toString() {
		return "Question [QUESTION_NUM=" + QUESTION_NUM + ", QUESTION_TITLE=" + QUESTION_TITLE + ", QUESTION_CONTENT="
				+ QUESTION_CONTENT + "]";
	};
	
	

	

}