package com.zgx.mapper;

import org.apache.ibatis.annotations.Param;

import com.zgx.common.dao.BaseDao;
import com.zgx.po.Stotetable;

/**
 * 
 * 兑换记录
 * 
 * @author 星月
 *
 */
public interface IWdjfDao extends BaseDao<Stotetable, Integer>{

	public Stotetable findByIdQDParamint(@Param("whereint")int  whereint);//
 
	
}
