package com.zgx.po;

import java.io.Serializable;
import java.util.Date;

public class Signtable implements Serializable{



	/**
	 * 
	 */
	private static final long serialVersionUID = -7504101874536069420L;

	/**
	 * 签到ID
	 */
	private Integer signid;
	
	/**
	 * （起始）判断清零时间
	 */
	private Date resettime;
	
	/**
	 * 上次签到时间
	 */
	private Date signtime;
	
	/**
	 * 签到积分（30天清零）
	 */
	private Integer signintegral;
	
	/**
	 * 积分（除签到积分）
	 */
	private Integer integral;
	
	/**
	 * 签到天数
	 */
	private Integer signdate;

	public Integer getSignid() {
		return signid;
	}

	public void setSignid(Integer signid) {
		this.signid = signid;
	}

	public Date getResettime() {
		return resettime;
	}

	public void setResettime(Date resettime) {
		this.resettime = resettime;
	}

	public Date getSigntime() {
		return signtime;
	}

	public void setSigntime(Date signtime) {
		this.signtime = signtime;
	}



	public Integer getSignintegral() {
		return signintegral;
	}

	public void setSignintegral(Integer signintegral) {
		this.signintegral = signintegral;
	}

	public Integer getIntegral() {
		return integral;
	}

	public void setIntegral(Integer integral) {
		this.integral = integral;
	}

	public Integer getSigndate() {
		return signdate;
	}

	public void setSigndate(Integer signdate) {
		this.signdate = signdate;
	}
	
	
	
	
}
