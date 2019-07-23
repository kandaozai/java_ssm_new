package com.zgx.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zgx.common.service.BaseService;
import com.zgx.po.Newstable;
/**
 * 
 * （ 信息）接口
 * 
 * @author 星月
 *
 */

public interface InewsService extends BaseService<Newstable, Integer>{
	
	public List<Newstable> findPagepramo(String  strwhere);
	
	public boolean deleteByIdParam(int  whereint);//删除param

}
