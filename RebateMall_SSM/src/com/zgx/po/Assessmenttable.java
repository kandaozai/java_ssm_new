package com.zgx.po;

import java.io.Serializable;

/**
 * 风险评估表
 * @author LXT
 *
 */
public class Assessmenttable implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7448446591554149047L;

	/**
	 * 风险评估ID
	 */
	private Integer assessmentId;
	
    /**
     * 风险评估名称
     */
    private String assessment;

	public Integer getAssessmentId() {
		return assessmentId;
	}

	public void setAssessmentId(Integer assessmentId) {
		this.assessmentId = assessmentId;
	}

	public String getAssessment() {
		return assessment;
	}

	public void setAssessment(String assessment) {
		this.assessment = assessment;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
