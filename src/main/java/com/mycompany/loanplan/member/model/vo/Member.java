package com.mycompany.loanplan.member.model.vo;

import java.sql.Date;

public class Member {
//	  M_ID VARCHAR(20) PRIMARY KEY,
//    M_PWD VARCHAR(20) NOT NULL,
//    M_NAME VARCHAR(20) NOT NULL,
//    M_EMAIL VARCHAR(30) NOT NULL,
//    M_PHN VARCHAR(20) NOT NULL,
//    M_GENDER VARCHAR(20) NOT NULL,
//    M_AGE NUMBER NOT NULL,
//    M_JOB VARCHAR(20) NOT NULL,
//    M_ADDRESS VARCHAR(1000) NOT NULL,
//    M_ASSET NUMBER ,
//    M_DEBT NUMBER , 
//    M_CAR VARCHAR(20),
//    M_HOUSE VARCHAR(20)
	private static final long serialVersionUID = 1111L;
	
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_email;
	private String m_phn;
	private String m_gender;
	private int m_age;
	private String m_job;
	private String m_address;
	private int m_asset;
	private int m_debt;
	private String car;
	private String m_house;
	private Date m_cdate;
	
	public Member() {	
	}
	
	public Member(String m_id, String m_pwd, String m_name, String m_email, String m_phn,
	String m_gender, int m_age, String m_job, String m_address, int m_asset, int m_debt, String car,
	String m_house, Date m_cdate) {
		super();
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_phn = m_phn;
		this.m_gender = m_gender;
		this.m_age = m_age;
		this.m_job = m_job;
		this.m_address = m_address;
		this.m_asset = m_asset;
		this.m_debt = m_debt;
		this.car = car;
		this.m_house = m_house;
		this.m_cdate = m_cdate;
	}
	
	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_pwd=" + m_pwd + ", m_name=" + m_name + ", m_email=" + m_email + ", m_phn="
				+ m_phn + ", m_gender=" + m_gender + ", m_age=" + m_age + ", m_job=" + m_job + ", m_address="
				+ m_address + ", m_asset=" + m_asset + ", m_debt=" + m_debt + ", car=" + car + ", m_house=" + m_house
				+ ", m_cdate=" + m_cdate + "]";
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_phn() {
		return m_phn;
	}

	public void setM_phn(String m_phn) {
		this.m_phn = m_phn;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public int getM_age() {
		return m_age;
	}

	public void setM_age(int m_age) {
		this.m_age = m_age;
	}

	public String getM_job() {
		return m_job;
	}

	public void setM_job(String m_job) {
		this.m_job = m_job;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public int getM_asset() {
		return m_asset;
	}

	public void setM_asset(int m_asset) {
		this.m_asset = m_asset;
	}

	public int getM_debt() {
		return m_debt;
	}

	public void setM_debt(int m_debt) {
		this.m_debt = m_debt;
	}

	public String getCar() {
		return car;
	}

	public void setCar(String car) {
		this.car = car;
	}

	public String getM_house() {
		return m_house;
	}

	public void setM_house(String m_house) {
		this.m_house = m_house;
	}

	public Date getM_cdate() {
		return m_cdate;
	}

	public void setM_cdate(Date m_cdate) {
		this.m_cdate = m_cdate;
	}
	
}
