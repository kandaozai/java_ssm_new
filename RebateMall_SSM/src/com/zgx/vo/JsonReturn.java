package com.zgx.vo;

import java.io.Serializable;

public class JsonReturn implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5863100019332084445L;
	private Boolean state;
	private String msg;
	public Boolean getState() {
		return state;
	}
	public void setState(Boolean state) {
		this.state = state;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
