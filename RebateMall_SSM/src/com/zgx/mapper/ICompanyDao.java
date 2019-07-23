package com.zgx.mapper;

import java.util.List;

import com.zgx.po.Conpanytable;
import com.zgx.common.dao.BaseDao;

public interface ICompanyDao extends BaseDao<Conpanytable, Integer> {
	
    public List<Conpanytable> findBySQLoneo();//公司信息1
	
	public List<Conpanytable> findBySQLtwoo();//公司信息2
	
	public List<Conpanytable> findBySQLthreeo();//公司信息3
	
	
}
