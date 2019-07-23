package com.zgx.po;

import java.io.Serializable;

/**
 * 投资期限表
 * @author LXT
 *
 */
public class Deadlinetable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7728463684673864027L;
	
	/**
	 * 投资期限id
	 */
	private Integer deadlineId;
	
	/**
	 * 投资期限
	 */
	private String deadline;

	public Integer getDeadlineId() {
		return deadlineId;
	}

	public void setDeadlineId(Integer deadlineId) {
		this.deadlineId = deadlineId;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	
	
}
