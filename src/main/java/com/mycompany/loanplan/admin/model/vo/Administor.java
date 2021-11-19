package com.mycompany.loanplan.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Administor {
	private static final long serialVersionUID = 20001L;
	private String aId;
	private String aName;
	private String aPwd;
	private String aEmail;
	private String aPhn;
	private String aGender;
	private int aAge;
	private String aAddress;

	public Administor() {

	}

	public Administor(String aId, String aName, String aPwd, String aEmail, String aPhn, String aGender, int aAge,
			String aAddress) {
		super();
		this.aId = aId;
		this.aName = aName;
		this.aPwd = aPwd;
		this.aEmail = aEmail;
		this.aPhn = aPhn;
		this.aGender = aGender;
		this.aAge = aAge;
		this.aAddress = aAddress;
	}

	@Override
	public String toString() {
		return "Administor [aId=" + aId + ", aName=" + aName + ", aPwd=" + aPwd + ", aEmail=" + aEmail + ", aPhn="
				+ aPhn + ", aGender=" + aGender + ", aAge=" + aAge + ", aAddress=" + aAddress + "]";
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaPwd() {
		return aPwd;
	}

	public void setaPwd(String aPwd) {
		this.aPwd = aPwd;
	}

	public String getaEmail() {
		return aEmail;
	}

	public void setaEmail(String aEmail) {
		this.aEmail = aEmail;
	}

	public String getaPhn() {
		return aPhn;
	}

	public void setaPhn(String aPhn) {
		this.aPhn = aPhn;
	}

	public String getaGender() {
		return aGender;
	}

	public void setaGender(String aGender) {
		this.aGender = aGender;
	}

	public int getaAge() {
		return aAge;
	}

	public void setaAge(int aAge) {
		this.aAge = aAge;
	}

	public String getaAddress() {
		return aAddress;
	}

	public void setaAddress(String aAddress) {
		this.aAddress = aAddress;
	}
}
