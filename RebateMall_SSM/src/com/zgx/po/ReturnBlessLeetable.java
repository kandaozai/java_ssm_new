package com.zgx.po;

import java.io.Serializable;

/**
 * 返福利表
 * @author LXT
 *
 */
public class ReturnBlessLeetable implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2831956835144249635L;

	/**
	 * 返福利ID
	 */
	private Integer returnBlessLeeId;
	
    /**
     * 返福利名称
     */
    private String returnBlessLee;

	public Integer getReturnBlessLeeId() {
		return returnBlessLeeId;
	}

	public void setReturnBlessLeeId(Integer returnBlessLeeId) {
		this.returnBlessLeeId = returnBlessLeeId;
	}

	public String getReturnBlessLee() {
		return returnBlessLee;
	}

	public void setReturnBlessLee(String returnBlessLee) {
		this.returnBlessLee = returnBlessLee;
	}  
}
