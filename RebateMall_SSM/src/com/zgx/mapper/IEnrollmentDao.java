package com.zgx.mapper;

import java.math.BigDecimal;
import java.sql.Date;

import org.apache.ibatis.annotations.Param;

import com.zgx.po.Enrollmenttable;
import com.zgx.common.dao.BaseDao;

public interface IEnrollmentDao extends BaseDao<Enrollmenttable, Integer>{
	public String findByTotal();
	
	public String findByLump(@Param("whereint")int  whereint);
	
	public String findBySum(@Param("whereint")int  whereint);
	
	public Enrollmenttable findByIdQDParamint(@Param("whereint")int  whereint);
	
	//统计获取每个月的投资金额
	public BigDecimal findByIdAndTime(@Param("wheredate")Date  wheredate,@Param("whereint")int  whereint);
	
	//统计获取每个月的投资金额的收益
	public BigDecimal findByIdAndTimeSY(@Param("wheredate")Date  wheredate,@Param("whereint")int  whereint);
	
	
	
}
