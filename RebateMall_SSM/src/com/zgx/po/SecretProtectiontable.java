package com.zgx.po;

import java.io.Serializable;

/**
 * 密保表
 * @author LXT
 *
 */
public class SecretProtectiontable implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4801600371102928093L;

	/**
	 * 密保ID
	 */
	private Integer secretProtectionId;
	
	/**
	 * 密保问题
	 */
	private String secretProtection;

	public Integer getSecretProtectionId() {
		return secretProtectionId;
	}

	public void setSecretProtectionId(Integer secretProtectionId) {
		this.secretProtectionId = secretProtectionId;
	}

	public String getSecretProtection() {
		return secretProtection;
	}

	public void setSecretProtection(String secretProtection) {
		this.secretProtection = secretProtection;
	}	
}
