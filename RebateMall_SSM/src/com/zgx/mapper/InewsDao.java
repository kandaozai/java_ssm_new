package com.zgx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zgx.po.Newstable;
import com.zgx.po.RenWutable;
import com.zgx.common.dao.BaseDao;

public interface InewsDao extends BaseDao<Newstable,Integer> {
	
	public List<Newstable> findPagepramo(@Param("strwhere")String  strwhere);
	
	public boolean deleteByIdParam(@Param("whereint")int  whereint);//删除param

}
