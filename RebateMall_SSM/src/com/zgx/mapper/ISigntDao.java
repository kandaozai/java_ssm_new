package com.zgx.mapper;

import org.apache.ibatis.annotations.Param;

import com.zgx.po.Signtable;
import com.zgx.common.dao.BaseDao;


/**
 * 签到
 * @author 星月
 *
 */
public interface ISigntDao extends BaseDao<Signtable, Integer>{
	
	public int  insertint(Signtable t);//新增返回新增ID
	
	public Signtable findByIdQDparmint(@Param("intwhere")int intwhere);//签到id
	

}
