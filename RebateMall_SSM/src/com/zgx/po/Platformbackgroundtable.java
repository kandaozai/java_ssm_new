package com.zgx.po;

import java.io.Serializable;

/**
 * 平台背景表
 * @author LXT
 *
 */
public class Platformbackgroundtable implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4415027054541726704L;

	/**
	 * 平台背景id
	 */
	private Integer platformbackgroundId;
	
	/**
	 * 平台背景名称
	 */
	private String platformbackground;

	public Integer getPlatformbackgroundId() {
		return platformbackgroundId;
	}

	public void setPlatformbackgroundId(Integer platformbackgroundId) {
		this.platformbackgroundId = platformbackgroundId;
	}

	public String getPlatformbackground() {
		return platformbackground;
	}

	public void setPlatformbackground(String platformbackground) {
		this.platformbackground = platformbackground;
	}

	
}
