package com.zgx.po;

import java.io.Serializable;

/**
 * 金额日记表
 * @author LXT
 *
 */
public class AmountJournaltable implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1873506064834923989L;

	/**
	 * 金额日记ID
	 */
	private Integer amountJournalId;
	
    /**
     * 账户充值
     */
    private double recharge;
    
    /**
     * 收入
     */
    private double income;
    
    /**
     * 支付
     */
    private double payment;
    
    /**
     * 提现
     */
    private double dish;
    
    /**
     * 描述
     */
    private String description;

	public Integer getAmountJournalId() {
		return amountJournalId;
	}

	public void setAmountJournalId(Integer amountJournalId) {
		this.amountJournalId = amountJournalId;
	}

	public double getRecharge() {
		return recharge;
	}

	public void setRecharge(double recharge) {
		this.recharge = recharge;
	}

	public double getIncome() {
		return income;
	}

	public void setIncome(double income) {
		this.income = income;
	}

	public double getPayment() {
		return payment;
	}

	public void setPayment(double payment) {
		this.payment = payment;
	}

	public double getDish() {
		return dish;
	}

	public void setDish(double dish) {
		this.dish = dish;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
