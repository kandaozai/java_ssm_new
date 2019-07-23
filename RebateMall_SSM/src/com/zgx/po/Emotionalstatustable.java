package com.zgx.po;

import java.io.Serializable;

public class Emotionalstatustable implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8253142464526226458L;

	/**
     * 情感状态ID
     */
    private Integer emotionalStatusId;
    
    /**
     * 情感状态
     */
    private String emotionalStatus;

	public Integer getEmotionalStatusId() {
		return emotionalStatusId;
	}

	public void setEmotionalStatusId(Integer emotionalStatusId) {
		this.emotionalStatusId = emotionalStatusId;
	}

	public String getEmotionalStatus() {
		return emotionalStatus;
	}

	public void setEmotionalStatus(String emotionalStatus) {
		this.emotionalStatus = emotionalStatus;
	}
}
