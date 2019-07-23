package com.zgx.po;

import java.io.Serializable;
import java.util.Date;

public class RenWutable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 605010570636904718L;
	
	/**
	 * 任务ID
	 */
	private Integer taskid;
	
	/**
	 * 内容
	 */
	private String content;
	
	/**
	 * 奖励分或金额
	 */
	private String reward;
	
	
	/**
	 * 开始时间
	 */
	private Date starttime;
	
	
	/**
	 * 结束期限
	 */
	private Date term;
	
	
	/**
	 * 要求
	 */
	private String requirement;
	
	/**
	 * 个人公司状态
	 */
	private Integer state;
	
	/**
	 * 有效无效状态
	 */
	private Integer stateywx;
	
	//任务记录表  
	
	/**
	 * 任务记录表ID
	 */
	private Integer tasklogid;
	
	/**
	 * 会员ID
	 */
	private Integer signupId;
	
	/**
	 * 完成状态
	 */
	private Integer lagstate;
	
	//审核表
	/**
	 * 任务审核ID
	 */
	private Integer shenheid;
	
	/**
	 * 图片
	 */
	private String tupian;
	
	/**
	 * 审核状态
	 */
	private Integer shstate; 
	
	
	/**
	 * 审核状态
	 */
	private Date ljtime;


	public Integer getTaskid() {
		return taskid;
	}


	public void setTaskid(Integer taskid) {
		this.taskid = taskid;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getReward() {
		return reward;
	}


	public void setReward(String reward) {
		this.reward = reward;
	}


	public Date getStarttime() {
		return starttime;
	}


	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}


	public Date getTerm() {
		return term;
	}


	public void setTerm(Date term) {
		this.term = term;
	}


	public String getRequirement() {
		return requirement;
	}


	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}


	public Integer getState() {
		return state;
	}


	public void setState(Integer state) {
		this.state = state;
	}





	public Integer getTasklogid() {
		return tasklogid;
	}


	public void setTasklogid(Integer tasklogid) {
		this.tasklogid = tasklogid;
	}


	public Integer getSignupId() {
		return signupId;
	}


	public void setSignupId(Integer signupId) {
		this.signupId = signupId;
	}


	public Integer getLagstate() {
		return lagstate;
	}


	public void setLagstate(Integer lagstate) {
		this.lagstate = lagstate;
	}


	public Integer getShenheid() {
		return shenheid;
	}


	public void setShenheid(Integer shenheid) {
		this.shenheid = shenheid;
	}


	public String getTupian() {
		return tupian;
	}


	public void setTupian(String tupian) {
		this.tupian = tupian;
	}


	public Integer getShstate() {
		return shstate;
	}


	public void setShstate(Integer shstate) {
		this.shstate = shstate;
	}


	public Date getLjtime() {
		return ljtime;
	}


	public void setLjtime(Date ljtime) {
		this.ljtime = ljtime;
	}


	public Integer getStateywx() {
		return stateywx;
	}


	public void setStateywx(Integer stateywx) {
		this.stateywx = stateywx;
	} 
	
	
	
}
