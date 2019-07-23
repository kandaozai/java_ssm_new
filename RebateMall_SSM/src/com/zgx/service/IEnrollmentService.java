package com.zgx.service;




import java.math.BigDecimal;
import java.sql.Date;

import org.apache.ibatis.annotations.Param;

import com.zgx.common.service.BaseService;
import com.zgx.po.Enrollmenttable;

public interface IEnrollmentService extends BaseService<Enrollmenttable, Integer>{
	public String findByTotal();
	
	public String findByLump(int  whereint);
	
	public String findBySum(int  whereint);
	
	public Enrollmenttable findByIdQDParamint(int  whereint);
	
	//统计获取每个月的投资金额
	public  BigDecimal findByIdAndTime(@Param("wheredate")Date  wheredate,@Param("whereint")int  whereint);

	//统计获取每个月的投资金额的收益
	public BigDecimal findByIdAndTimeSY(@Param("wheredate")Date  wheredate,@Param("whereint")int  whereint);
}
