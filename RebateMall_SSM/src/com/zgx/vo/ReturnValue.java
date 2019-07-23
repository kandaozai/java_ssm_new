package com.zgx.vo;

import java.io.Serializable;
import java.util.List;

public class ReturnValue implements Serializable {


	
	private List<String> list_st;
	private String strin;

	
	public String getStrin() {
		return strin;
	}

	public void setStrin(String strin) {
		this.strin = strin;
	}

	

	public List<String> getList_st() {
		return list_st;
	}

	public void setList_st(List<String> list_st) {
		this.list_st = list_st;
	}
	

}
