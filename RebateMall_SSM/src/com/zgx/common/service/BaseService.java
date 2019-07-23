package com.zgx.common.service;

import java.io.Serializable;
import java.util.List;

public interface BaseService <T,PK extends Serializable> {
	public T findById(int id);
	public T findByName(String name);
	public T findBySQL(String sql);
	public List<T> findPage(String where,int startIndex,int pageSize);
	public List<T> findAll();
	public int getTotalRow(String where);
	public boolean insert(T t);
	public int insertReturnId(T t);
	public boolean update(T t);
	public boolean deleteById(int id);
	public boolean deleteAll();
	
	//外加
	public List<T> findBySQLone(String sqlOA);//公司信息
	public T findByIdQD(int id);//签到id
}
