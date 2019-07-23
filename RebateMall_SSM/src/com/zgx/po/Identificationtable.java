package com.zgx.po;

import java.io.Serializable;

/**
 * 认证表
 * @author LXT
 *
 */
public class Identificationtable implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1400042589643367898L;

	/**
	 * 认证ID
	 */
	private Integer identificationId;
	
    /**
     * 认证名称
     */
    private String identification;
    
    /**
     * 手机号码
     */
    private String phoneNumber;
    
    /**
     * 身份证号
     */
    private String iDNumber;
    
    /**
     * 邮箱
     */
    private String mailbox;
    
	/**
	 * 密保ID
	 */
	private Integer secretProtectionId;
	
    /**
     * 密保答案
     */
    private String secretProtectionIssue;
    
    /**
     * 交易密码
     */
    private String dealPassword;
    
    /**
     * 登录密码
     */
    private String password;
    
	/**
	 * 风险评估ID
	 */
	private Integer assessmentId;

	public Integer getIdentificationId() {
		return identificationId;
	}

	public void setIdentificationId(Integer identificationId) {
		this.identificationId = identificationId;
	}

	public String getIdentification() {
		return identification;
	}

	public void setIdentification(String identification) {
		this.identification = identification;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getiDNumber() {
		return iDNumber;
	}

	public void setiDNumber(String iDNumber) {
		this.iDNumber = iDNumber;
	}

	public String getMailbox() {
		return mailbox;
	}

	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}

	public Integer getSecretProtectionId() {
		return secretProtectionId;
	}

	public void setSecretProtectionId(Integer secretProtectionId) {
		this.secretProtectionId = secretProtectionId;
	}

	public String getSecretProtectionIssue() {
		return secretProtectionIssue;
	}

	public void setSecretProtectionIssue(String secretProtectionIssue) {
		this.secretProtectionIssue = secretProtectionIssue;
	}

	public String getDealPassword() {
		return dealPassword;
	}

	public void setDealPassword(String dealPassword) {
		this.dealPassword = dealPassword;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getAssessmentId() {
		return assessmentId;
	}

	public void setAssessmentId(Integer assessmentId) {
		this.assessmentId = assessmentId;
	}
}
