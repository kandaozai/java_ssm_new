package com.zgx.po;

import java.io.Serializable;

/**
 * 积分类型表
 * @author LXT
 *
 */
public class CreditTypetable implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1889852349586766326L;

	/**
	 * 积分类型ID
	 */
	private Integer creditTypeId;
	
    /**
     * 积分类型名称
     */
    private String creditType;

	public Integer getCreditTypeId() {
		return creditTypeId;
	}

	public void setCreditTypeId(Integer creditTypeId) {
		this.creditTypeId = creditTypeId;
	}

	public String getCreditType() {
		return creditType;
	}

	public void setCreditType(String creditType) {
		this.creditType = creditType;
	}
}
