package com.zgx.po;

import java.io.Serializable;
import java.util.Date;

public class Stotetable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8608936766617599302L;
	
	/**
	 * 积分商品ID
     */
	private Integer integralstoreid;
	
	/**
	 * 商品名
	 */
	private String storemc;
	
	/**
	 * 积分
	 */
	private Integer integral;
	
	/**
	 * 图片
	 */
	private String picture;
	
	//-----------商品分类详细(类别)
	/**
	 * 商品分类详细ID  storetypexqID  storetyleID
	 */
	private Integer storetypexqid;
	
	
	
	/**
	 * 商品类型ID
	 */
	private Integer storetyleid;
	
	/**
	 * （两个）mc
    */
	private String mc;
	
	//-----------------------商品兑换------------------//
	/**
	 * 商品兑换ID
	 */
	private Integer commodityexchangeid;
	
	
	/**
	 * 收货地址
	 */
	private String receivingaddress;
	
	/**
	 * 收货人姓名
	 */
	private String consigneename;
	
	/**
	 * 电话
	 */
	private String telephone;
	
	
	/**
	 * QQ
	 */
	private String qq;
	
	/**
	 * 兑换时间
	 */
	private Date cundatetime;
	
	/**
	 * 会员ID
	 */
	private Integer signupId;
	
	/**
	 * int值ID
	 */
	private Integer intzhi;
	
	//积分记录表
	/**
	 * 积分记录ID
	 */
	private Integer integrallogid;
	
	/**
	 * 获得积分 
	 */
	private Integer getintegral;
	
	/**
	 * 获得时间
	 */
	private Date  gettime;
	
	/**
	 * 积分说明
	 */
	private String  integralexplain;
	
	//签到积分表
	
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
	 * 签到天数
	 */
	private Integer signdate;
	
	
	
	
	
	/**
	 * 签到积分（30天清零）
	 */
	private Integer signintegral;
	
	
	
	

	public Integer getIntegralstoreid() {
		return integralstoreid;
	}

	public void setIntegralstoreid(Integer integralstoreid) {
		this.integralstoreid = integralstoreid;
	}

	public String getStoremc() {
		return storemc;
	}

	public void setStoremc(String storemc) {
		this.storemc = storemc;
	}

	public Integer getIntegral() {
		return integral;
	}

	public void setIntegral(Integer integral) {
		this.integral = integral;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Integer getStoretypexqid() {
		return storetypexqid;
	}

	public void setStoretypexqid(Integer storetypexqid) {
		this.storetypexqid = storetypexqid;
	}

	public Integer getStoretyleid() {
		return storetyleid;
	}

	public void setStoretyleid(Integer storetyleid) {
		this.storetyleid = storetyleid;
	}

	public String getMc() {
		return mc;
	}

	public void setMc(String mc) {
		this.mc = mc;
	}

	public Integer getCommodityexchangeid() {
		return commodityexchangeid;
	}

	public void setCommodityexchangeid(Integer commodityexchangeid) {
		this.commodityexchangeid = commodityexchangeid;
	}

	public String getReceivingaddress() {
		return receivingaddress;
	}

	public void setReceivingaddress(String receivingaddress) {
		this.receivingaddress = receivingaddress;
	}

	public String getConsigneename() {
		return consigneename;
	}

	public void setConsigneename(String consigneename) {
		this.consigneename = consigneename;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Date getCundatetime() {
		return cundatetime;
	}

	public void setCundatetime(Date cundatetime) {
		this.cundatetime = cundatetime;
	}

	public Integer getSignupId() {
		return signupId;
	}

	public void setSignupId(Integer signupId) {
		this.signupId = signupId;
	}

	public Integer getIntzhi() {
		return intzhi;
	}

	public void setIntzhi(Integer intzhi) {
		this.intzhi = intzhi;
	}

	public Integer getIntegrallogid() {
		return integrallogid;
	}

	public void setIntegrallogid(Integer integrallogid) {
		this.integrallogid = integrallogid;
	}

	public Integer getGetintegral() {
		return getintegral;
	}

	public void setGetintegral(Integer getintegral) {
		this.getintegral = getintegral;
	}

	public Date getGettime() {
		return gettime;
	}

	public void setGettime(Date gettime) {
		this.gettime = gettime;
	}

	public String getIntegralexplain() {
		return integralexplain;
	}

	public void setIntegralexplain(String integralexplain) {
		this.integralexplain = integralexplain;
	}

	public Integer getSignid() {
		return signid;
	}

	public void setSignid(Integer signid) {
		this.signid = signid;
	}

	public Integer getSignintegral() {
		return signintegral;
	}

	public void setSignintegral(Integer signintegral) {
		this.signintegral = signintegral;
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

	public Integer getSigndate() {
		return signdate;
	}

	public void setSigndate(Integer signdate) {
		this.signdate = signdate;
	}
	
	// 积分（除签到积分）integral
	 
	
	
}
