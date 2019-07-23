package com.zgx.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 会员注册表
 * @author LXT
 *
 */
public class Signuptable implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5956429552730516516L;

	/**
	 * 会员注册ID
	 */
	private Integer signupId;
	
    /**
     * 会员名
     */
    private String signupname;
    
    /**
     * 登录密码
     */
    private String password;
    
    /**
     * 确认密码
     */
    private String conpassword;
    
    /**
     * 手机号码
     */
    private String phonenumber;
    
    /**
     * 手机验证码
     */
    private String phonecode;
    
    /**
     * 数字ID
     */
    private String digital;
    
    /**
     * 邮箱
     */
    private String mailbox;
    
    /**
     * 推荐码
     */
    private String refer;
    
    /**
     * 图片（路径）
     */
    private String headportrait;
    
  /**
   * 性别
   */
    private Boolean sex;
    
    /**
     * 身份证
     */
    private String idnumber;
    
    /**
     * 银行卡
     */
    private String bankcard;
    
    
    
    /**
     * 职业
     */
    private String occupation;
    
    
    /**
     * 签到ID
     */
    private Integer signid;
    
    /**
     * 可用金额
     */
    private Integer sum;
    
    /**
     * 返利冻结
     */
    private Integer rebatefreeze;
    
    /**
     * 提现冻结
     */
    private Integer txfreeze;
    
    /**
     * 出身年月
     */
    private Date yearofbirth;
    
    /**
     * 情感状态ID
     */
    private Integer emotionalstatusId;

    /**
     * 现居住地
     */
    private String living;
    
    /**
     * 家乡地址
     */
    private String homeaddress;
    
    /**
	 * 情感状态
	 */
	private String emotionalstatus;
	
	
	/**
	 * 版次号
	 */
    private Integer edition;


	public Integer getSignupId() {
		return signupId;
	}


	public void setSignupId(Integer signupId) {
		this.signupId = signupId;
	}


	public String getSignupname() {
		return signupname;
	}


	public void setSignupname(String signupname) {
		this.signupname = signupname;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getConpassword() {
		return conpassword;
	}


	public void setConpassword(String conpassword) {
		this.conpassword = conpassword;
	}


	public String getPhonenumber() {
		return phonenumber;
	}


	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}


	public String getPhonecode() {
		return phonecode;
	}


	public void setPhonecode(String phonecode) {
		this.phonecode = phonecode;
	}


	public String getDigital() {
		return digital;
	}


	public void setDigital(String digital) {
		this.digital = digital;
	}


	public String getMailbox() {
		return mailbox;
	}


	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}


	public String getRefer() {
		return refer;
	}


	public void setRefer(String refer) {
		this.refer = refer;
	}


	public String getHeadportrait() {
		return headportrait;
	}


	public void setHeadportrait(String headportrait) {
		this.headportrait = headportrait;
	}


	public Boolean getSex() {
		return sex;
	}


	public void setSex(Boolean sex) {
		this.sex = sex;
	}


	public String getIdnumber() {
		return idnumber;
	}


	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}


	public String getOccupation() {
		return occupation;
	}


	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}


	public Integer getSignid() {
		return signid;
	}


	public void setSignid(Integer signid) {
		this.signid = signid;
	}


	public Integer getSum() {
		return sum;
	}


	public void setSum(Integer sum) {
		this.sum = sum;
	}


	public Integer getRebatefreeze() {
		return rebatefreeze;
	}


	public void setRebatefreeze(Integer rebatefreeze) {
		this.rebatefreeze = rebatefreeze;
	}


	public Integer getTxfreeze() {
		return txfreeze;
	}


	public void setTxfreeze(Integer txfreeze) {
		this.txfreeze = txfreeze;
	}

	public Date getYearofbirth() {
		return yearofbirth;
	}


	public void setYearofbirth(Date yearofbirth) {
		this.yearofbirth = yearofbirth;
	}


	public Integer getEmotionalstatusId() {
		return emotionalstatusId;
	}


	public void setEmotionalstatusId(Integer emotionalstatusId) {
		this.emotionalstatusId = emotionalstatusId;
	}


	public String getLiving() {
		return living;
	}


	public void setLiving(String living) {
		this.living = living;
	}


	public String getHomeaddress() {
		return homeaddress;
	}


	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}


	public String getEmotionalstatus() {
		return emotionalstatus;
	}


	public void setEmotionalstatus(String emotionalstatus) {
		this.emotionalstatus = emotionalstatus;
	}


	public Integer getEdition() {
		return edition;
	}


	public void setEdition(Integer edition) {
		this.edition = edition;
	}


	public String getBankcard() {
		return bankcard;
	}


	public void setBankcard(String bankcard) {
		this.bankcard = bankcard;
	}
    
    
    

}
