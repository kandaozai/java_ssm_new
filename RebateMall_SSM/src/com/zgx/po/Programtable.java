package com.zgx.po;

import java.io.Serializable;

/**
 * 方案表
 * @author LXT
 *
 */
public class Programtable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5044185500480943743L;
	
	/**
	 * 方案id
	 */
	private Integer programId;
	
	/**
	 * 方案名称
	 */
	private String program;

	public Integer getProgramId() {
		return programId;
	}

	public void setProgramId(Integer programId) {
		this.programId = programId;
	}

	public String getProgram() {
		return program;
	}

	public void setProgram(String program) {
		this.program = program;
	}
	
	
}
