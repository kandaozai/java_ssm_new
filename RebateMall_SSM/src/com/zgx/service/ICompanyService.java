package com.zgx.service;

import java.util.List;

import com.zgx.common.service.BaseService;
import com.zgx.po.Conpanytable;

public interface ICompanyService extends BaseService<Conpanytable, Integer>{
	
	
	public List<Conpanytable> findBySQLoneo();//公司信息1
	
	public List<Conpanytable> findBySQLtwoo();//公司信息2
	
	public List<Conpanytable> findBySQLthreeo();//公司信息3
	
}
