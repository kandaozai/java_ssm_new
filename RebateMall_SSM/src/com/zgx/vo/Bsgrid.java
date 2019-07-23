package com.zgx.vo;

import java.io.Serializable;
import java.util.List;
/**
 * 
 * @author qzly
 *
 * @param <T>
 */
public class Bsgrid<T>  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8138184679341404159L;
	private boolean success;
	private int totalRows;
	private int curPage;
	private List<T> data;
	
	private T data_lst;
	
	
	public T getData_lst() {
		return data_lst;
	}
	public void setData_lst(T data_lst) {
		this.data_lst = data_lst;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	
	
	
}
