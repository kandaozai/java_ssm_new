package com.zgx.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 个人信息表
 * @author LXT
 *
 */
public class Personalinfotable implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8691574839295240403L;

	/**
	 * 个人信息ID
	 */
	private Integer personalInfoId;
	
	/**
	 * 会员注册ID
	 */
	private Integer signUpId;
	
    /**
     * 姓名
     */
    private String personalName;
    
    /**
     * 年龄
     */
    private Integer age;
	
    /**
     * 性别
     */
    private Boolean sex;
	
    /**
     * 生日
     */
    private Date dirthday;
	
    /**
     * 情感状态ID
     */
    private Integer emotionalStatusId;
    
    /**
     * 职业
     */
    private String career;
	
    /**
     * 居住地
     */
    private String placeResidence;
	
    /**
     * 家乡地址
     */
    private String hometownAddress;
	
    /**
     * 积分ID
     */
    private Integer integralId;
	
    /**
     * 密保ID
     */
    private Integer secretProtectionId;

	public Integer getPersonalInfoId() {
		return personalInfoId;
	}

	public void setPersonalInfoId(Integer personalInfoId) {
		this.personalInfoId = personalInfoId;
	}

	public Integer getSignUpId() {
		return signUpId;
	}

	public void setSignUpId(Integer signUpId) {
		this.signUpId = signUpId;
	}

	public String getPersonalName() {
		return personalName;
	}

	public void setPersonalName(String personalName) {
		this.personalName = personalName;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Boolean getSex() {
		return sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	public Date getDirthday() {
		return dirthday;
	}

	public void setDirthday(Date dirthday) {
		this.dirthday = dirthday;
	}

	public Integer getEmotionalStatusId() {
		return emotionalStatusId;
	}

	public void setEmotionalStatusId(Integer emotionalStatusId) {
		this.emotionalStatusId = emotionalStatusId;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getPlaceResidence() {
		return placeResidence;
	}

	public void setPlaceResidence(String placeResidence) {
		this.placeResidence = placeResidence;
	}

	public String getHometownAddress() {
		return hometownAddress;
	}

	public void setHometownAddress(String hometownAddress) {
		this.hometownAddress = hometownAddress;
	}

	public Integer getIntegralId() {
		return integralId;
	}

	public void setIntegralId(Integer integralId) {
		this.integralId = integralId;
	}

	public Integer getSecretProtectionId() {
		return secretProtectionId;
	}

	public void setSecretProtectionId(Integer secretProtectionId) {
		this.secretProtectionId = secretProtectionId;
	}
}
