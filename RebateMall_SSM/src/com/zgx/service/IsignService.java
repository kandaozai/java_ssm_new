package com.zgx.service;

import org.apache.ibatis.annotations.Param;

import com.zgx.common.service.BaseService;
import com.zgx.po.Signtable;
import com.zgx.po.Signuptable;
/**
 * 
 * 签到
 * 
 * @author 星月
 *
 */

public interface IsignService extends BaseService<Signtable, Integer>{
	
	public int  insertint(Signtable t);//新增返回新增ID
	
	public Signtable findByIdQDparmint(int intwhere);//签到id

}
