package com.zgx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.IStoreDao;
import com.zgx.mapper.XlkIStoreDao;
import com.zgx.po.Stotetable;
import com.zgx.service.IStoreService;

@Transactional
@Service("xlkService")
public class XlkServiceImpl implements IStoreService{
	
	@Autowired
	private  XlkIStoreDao Dao;

	@Override
	public Stotetable findById(int id) {
		return Dao.findById(id);
	}

	@Override
	public Stotetable findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Stotetable findBySQL(String sql) {
		return Dao.findBySQL(sql);
	}

	@Override
	public List<Stotetable> findPage(String where, int startIndex, int pageSize) {
		return Dao.findPage(where, startIndex, pageSize);
	}

	@Override
	public List<Stotetable> findAll() {
		return Dao.findAll();
	}

	@Override
	public int getTotalRow(String where) {
		return Dao.getTotalRow(where);
	}

	@Override
	public boolean insert(Stotetable t) {

		return Dao.insert(t);
	}

	@Override
	public int insertReturnId(Stotetable t) {
		return Dao.insertReturnId(t);
	}

	@Override
	public boolean update(Stotetable t) {
		return Dao.update(t);
	}

	@Override
	public boolean deleteById(int id) {
		return Dao.deleteById(id);
	}

	@Override
	public boolean deleteAll() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Stotetable> findBySQLone(String sqlOA) {
		
		return Dao.findBySQLone(sqlOA);
	}

	@Override
	public Stotetable findByIdQD(int id) {
		//需要进行加锁
		
		return Dao.findByIdQD(id);
	}
	

	@Override
	public List<Stotetable> findBySQLonePA(int whereint) {
		return Dao.findBySQLonePA(whereint);
	}

	@Override
	public List<Stotetable> findAllstr(String strwhere) {
		return Dao.findAllstr(strwhere);
	}

	@Override
	public boolean findByIdQDParam(int whereint) {
		return Dao.findByIdQDParam(whereint);
	}

	@Override
	public boolean findByNameParam(int whereintA, int whereintB) {
		return Dao.findByNameParam(whereintA,whereintB);
	}

	@Override
	public boolean findBySQLParam(int whereintA, int whereintB) {
		return Dao.findBySQLParam(whereintA,whereintB);
	}

	@Override
	public Stotetable findByIdQDParamint(int whereint) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
