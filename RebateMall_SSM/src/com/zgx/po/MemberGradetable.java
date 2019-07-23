package com.zgx.po;

import java.io.Serializable;

/**
 * 会员等级表
 * @author LXT
 *
 */
public class MemberGradetable implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6311684714632278781L;

	/**
	 * 会员等级ID
	 */
	private Integer memberGradeId;
	
	/**
	 * 会员等级名称
	 */
	private String memberGrade;
	
	/**
	 * 积分类型ID
	 */
	private Integer creditTypeId;
	
	/**
	 * 积分数值
	 */
	private double integralValue;

	public Integer getMemberGradeId() {
		return memberGradeId;
	}

	public void setMemberGradeId(Integer memberGradeId) {
		this.memberGradeId = memberGradeId;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public Integer getCreditTypeId() {
		return creditTypeId;
	}

	public void setCreditTypeId(Integer creditTypeId) {
		this.creditTypeId = creditTypeId;
	}

	public double getIntegralValue() {
		return integralValue;
	}

	public void setIntegralValue(double integralValue) {
		this.integralValue = integralValue;
	}
}
