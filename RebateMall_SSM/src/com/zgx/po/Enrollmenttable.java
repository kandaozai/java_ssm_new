package com.zgx.po;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 投资登记表
 * @author LXT
 *
 */
public class Enrollmenttable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6988942842728918072L;
	
	/**
	 * 投资登记id
	 */
	private Integer enrollmentid;
	
	/**
	 * 平台背景id
	 */
	private Integer platformbackgroundid;
	
	/**
	 * 投资期限id
	 */
	private Integer deadlineid;
	
	/**
	 * 方案id
	 */
	private Integer programid;
	
	/**
	 * 姓名
	 */
	private String enrname;
	
	/**
	 * 手机号码
	 */
	private String phonenumber;
	
	/**
	 * 用户名
	 */
	private String enrusers;
	
	/**
	 * 投资金额
	 */
	private String investjer;
	
	/**
	 * 投资日期
	 */
	private Date investdate;
	
	/**
	 * 备注
	 */
	private String note;
	
	/**
	 * 上传凭证
	 */
	private String certificate;
	
	//用户ID
	private Integer signupId;
	
	//申报审核状态
	private Integer stateshsb;
	
	
	//
	private String investplatform;
	
	
	//=======扩展字段
	/**
	 * 平台背景名称
	 */
	private String platformbackground;
	
	/**
	 * 投资期限
	 */
	private String deadline;
	
	/**
	 * 方案名称
	 */
	private String program;
	
	
	
	
	/**
	 * 临时值
	 */
	private String zongzhi;


	/**
	 * 公司的一部分字段
	 */
	//公司ID
	private int companyid;
	
	//平台返利
	private BigDecimal reward;
	
	//公司返利
	private BigDecimal companyrebate;
	
	




	public int getCompanyid() {
		return companyid;
	}




	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}




	public BigDecimal getReward() {
		return reward;
	}




	public void setReward(BigDecimal reward) {
		this.reward = reward;
	}




	public BigDecimal getCompanyrebate() {
		return companyrebate;
	}




	public void setCompanyrebate(BigDecimal companyrebate) {
		this.companyrebate = companyrebate;
	}




	public Integer getSignupId() {
		return signupId;
	}




	public void setSignupId(Integer signupId) {
		this.signupId = signupId;
	}




	public Integer getStateshsb() {
		return stateshsb;
	}




	public void setStateshsb(Integer stateshsb) {
		this.stateshsb = stateshsb;
	}




	public String getEnrname() {
		return enrname;
	}




	public void setEnrname(String enrname) {
		this.enrname = enrname;
	}




	public String getPhonenumber() {
		return phonenumber;
	}




	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	


	public String getInvestplatform() {
		return investplatform;
	}




	public void setInvestplatform(String investplatform) {
		this.investplatform = investplatform;
	}




	public String getEnrusers() {
		return enrusers;
	}




	public void setEnrusers(String enrusers) {
		this.enrusers = enrusers;
	}




	public String getInvestjer() {
		return investjer;
	}




	public void setInvestjer(String investjer) {
		this.investjer = investjer;
	}




	public Date getInvestdate() {
		return investdate;
	}




	public void setInvestdate(Date investdate) {
		this.investdate = investdate;
	}




	public String getNote() {
		return note;
	}




	public void setNote(String note) {
		this.note = note;
	}




	public String getCertificate() {
		return certificate;
	}




	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}




	public String getPlatformbackground() {
		return platformbackground;
	}




	public void setPlatformbackground(String platformbackground) {
		this.platformbackground = platformbackground;
	}




	public String getDeadline() {
		return deadline;
	}




	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}




	public String getProgram() {
		return program;
	}




	public void setProgram(String program) {
		this.program = program;
	}




	public String getZongzhi() {
		return zongzhi;
	}




	public void setZongzhi(String zongzhi) {
		this.zongzhi = zongzhi;
	}




	public Integer getEnrollmentid() {
		return enrollmentid;
	}




	public void setEnrollmentid(Integer enrollmentid) {
		this.enrollmentid = enrollmentid;
	}




	public Integer getPlatformbackgroundid() {
		return platformbackgroundid;
	}




	public void setPlatformbackgroundid(Integer platformbackgroundid) {
		this.platformbackgroundid = platformbackgroundid;
	}




	public Integer getDeadlineid() {
		return deadlineid;
	}




	public void setDeadlineid(Integer deadlineid) {
		this.deadlineid = deadlineid;
	}




	public Integer getProgramid() {
		return programid;
	}




	public void setProgramid(Integer programid) {
		this.programid = programid;
	}
	


}
