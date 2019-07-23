package com.zgx.po;

import java.io.Serializable;
/**
 * 
 * 公司table
 * 
 * @author 星月
 *
 */
public class Conpanytable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;



	/**
	 * 公司ID
	 */
	private Integer companyid;
	
	/**
	 * 公司名称
	 */
	private String companyname;
	
	/**
	 * 注册资金
	 */
	private String registeredcapital;
	
	/**
	 *电话
	 */

	private String telephone;
	
	/**
	 *客服热线
	 */
	private String customerservicehotline;
	
	/**
	 * 电子邮箱
	 */
	private String mailbox;
	
	/**
	 * 所在地址 
	 */
	private String address;

	/**
	 * 平台年化
	 */
	private String platformyear;
	
	/**
	 * 平台实缴
	 */
	private String platformpayment;
	
	/**
	 * 项目类型
	 */
	private String projecttype;
	
	/**
	 * 天下奖励
	 */
	private String reward;
	
	/**
	 * 运营年限
	 */
	private String servicelife;
	
	/**
	 * 保障方式
	 */
	private String safeguardmode;
	
	/**
	 * 图片
	 */
	private String picture;
	
	/**
	 * 投资要求ID
	 */
	private Integer investmentrequirementsid;
	
	/**
	 * 网站
	 */
	private String companyrebate;
	
	/**
	 * 公司返利
	 */
	private String website;
	
	/**
	 * 启用
	 */
	private boolean startusing;

	public Integer getCompanyid() {
		return companyid;
	}

	public void setCompanyid(Integer companyid) {
		this.companyid = companyid;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getRegisteredcapital() {
		return registeredcapital;
	}

	public void setRegisteredcapital(String registeredcapital) {
		this.registeredcapital = registeredcapital;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getCustomerservicehotline() {
		return customerservicehotline;
	}

	public void setCustomerservicehotline(String customerservicehotline) {
		this.customerservicehotline = customerservicehotline;
	}

	public String getMailbox() {
		return mailbox;
	}

	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPlatformyear() {
		return platformyear;
	}

	public void setPlatformyear(String platformyear) {
		this.platformyear = platformyear;
	}

	public String getPlatformpayment() {
		return platformpayment;
	}

	public void setPlatformpayment(String platformpayment) {
		this.platformpayment = platformpayment;
	}

	public String getProjecttype() {
		return projecttype;
	}

	public void setProjecttype(String projecttype) {
		this.projecttype = projecttype;
	}

	public String getReward() {
		return reward;
	}

	public void setReward(String reward) {
		this.reward = reward;
	}

	public String getServicelife() {
		return servicelife;
	}

	public void setServicelife(String servicelife) {
		this.servicelife = servicelife;
	}

	public String getSafeguardmode() {
		return safeguardmode;
	}

	public void setSafeguardmode(String safeguardmode) {
		this.safeguardmode = safeguardmode;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Integer getInvestmentrequirementsid() {
		return investmentrequirementsid;
	}

	public void setInvestmentrequirementsid(Integer investmentrequirementsid) {
		this.investmentrequirementsid = investmentrequirementsid;
	}

	public String getCompanyrebate() {
		return companyrebate;
	}

	public void setCompanyrebate(String companyrebate) {
		this.companyrebate = companyrebate;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public boolean isStartusing() {
		return startusing;
	}

	public void setStartusing(boolean startusing) {
		this.startusing = startusing;
	}


	
}
