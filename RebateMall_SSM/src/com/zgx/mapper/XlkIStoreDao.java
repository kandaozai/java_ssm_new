package com.zgx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zgx.common.dao.BaseDao;
import com.zgx.po.Stotetable;

public interface XlkIStoreDao extends BaseDao<Stotetable, Integer>{

	public List<Stotetable> findBySQLonePA(@Param("whereint")int  whereint);//分类查询
 
	public List<Stotetable> findAllstr(@Param("strwhere")String  strwhere);
	
	public boolean findByIdQDParam(@Param("whereint")int  whereint);//修改

	public boolean findByNameParam(@Param("whereintA")int  whereintA,@Param("whereintB")int  whereintB);
	
	public boolean findBySQLParam(@Param("whereintA")int  whereintA,@Param("whereintB")int  whereintB);
}
