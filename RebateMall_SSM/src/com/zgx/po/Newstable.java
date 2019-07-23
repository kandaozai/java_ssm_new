package com.zgx.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 消息table
 * 
 * @author 星月
 *
 */

public class Newstable implements Serializable{

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4893900980652561476L;

	/**
	 * 消息ID
	 */
	private Integer newsid;
	
	/**
	 * 会员ID
	 */
	private Integer signupId;
	
	/**
	 * 状态
	 */
	private Boolean status;
	
	/**
	 * 内容
	 */
	private String content;
	
	/**
	 * 发送时间
	 */
	private Date sendingtime;

	public Integer getNewsid() {
		return newsid;
	}

	public void setNewsid(Integer newsid) {
		this.newsid = newsid;
	}

	public Integer getSignupId() {
		return signupId;
	}

	public void setSignupId(Integer signupId) {
		this.signupId = signupId;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSendingtime() {
		return sendingtime;
	}

	public void setSendingtime(Date sendingtime) {
		this.sendingtime = sendingtime;
	}

	

}
