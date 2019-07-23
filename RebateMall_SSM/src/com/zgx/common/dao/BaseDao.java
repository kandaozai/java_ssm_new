package com.zgx.common.dao;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BaseDao<T,PK extends Serializable> {
	public T findById(int id);//搜索id
	public T findByName(String name);//搜索名称
	public T findBySQL(String sql);
	
	public List<T> findPage(@Param("strwhere")String  strwhere, @Param("startIndex")int startIndex,  @Param("pageSize")int  pageSize);//分页 方法
	public int getTotalRow(@Param("strwhere")String  strwhere);//返回总的条数 方法
	
//	public List<T> findPage(String where,int startIndex,int pageSize);//分页
//	public int getTotalRow(String where);//分页的返回总的条数
	
	public List<T> findAll();//搜索全部

	public boolean insert(T t);//新增
	public int insertReturnId(T t);//新增返回id
	public boolean update(T t);//修改
	public boolean deleteById(int id);//删除
	public boolean deleteAll();//删除所有
	
	
	//外加
	public List<T> findBySQLone(String sql);//公司信息
	public T findByIdQD(int id);//签到id
}
