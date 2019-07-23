package com.zgx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zgx.po.Stotetable;
import com.zgx.common.dao.BaseDao;

public interface IStoreDao extends BaseDao<Stotetable, Integer>{

	//public List<Stotetable> findBySQLonePA(@Param("whereint")String  whereint);//分类查询
 
	
}
