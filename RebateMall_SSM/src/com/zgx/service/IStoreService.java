package com.zgx.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zgx.common.service.BaseService;
import com.zgx.po.Stotetable;

public interface IStoreService extends BaseService<Stotetable, Integer>{

	public List<Stotetable> findBySQLonePA(int  whereint);//分类查询
	
	public List<Stotetable> findAllstr(String  strwhere);
	
	public boolean findByIdQDParam(int  whereint);//修改
	
	public boolean findByNameParam(int  whereintA,int  whereintB);//修改
	
	public boolean findBySQLParam(int  whereintA,int  whereintB);
	
	public Stotetable findByIdQDParamint(int  whereint);
}
