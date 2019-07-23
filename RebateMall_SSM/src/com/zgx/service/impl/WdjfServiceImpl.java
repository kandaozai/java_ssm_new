package com.zgx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.IStoreDao;
import com.zgx.mapper.IWdjfDao;
import com.zgx.po.Stotetable;
import com.zgx.service.IStoreService;

/**
 * 
 * 我的积分
 * 
 * @author 星月
 *
 */
@Transactional
@Service("wdjfService")
public class WdjfServiceImpl implements IStoreService{
	
	@Autowired
	private  IWdjfDao Daoon;
	//private  IStoreDao Daoon;

	@Override
	public Stotetable findById(int id) {
		return Daoon.findById(id);
	}

	@Override
	public Stotetable findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Stotetable findBySQL(String sql) {
		return Daoon.findBySQL(sql);
	}

	@Override
	public List<Stotetable> findPage(String where, int startIndex, int pageSize) {
		return Daoon.findPage(where, startIndex, pageSize);
	}

	@Override
	public List<Stotetable> findAll() {
		return Daoon.findAll();
	}

	@Override
	public int getTotalRow(String where) {
		return Daoon.getTotalRow(where);
	}

	@Override
	public boolean insert(Stotetable t) {

		return Daoon.insert(t);
	}

	@Override
	public int insertReturnId(Stotetable t) {
		return Daoon.insertReturnId(t);
	}

	@Override
	public boolean update(Stotetable t) {
		return Daoon.update(t);
	}

	@Override
	public boolean deleteById(int id) {
		return Daoon.deleteById(id);
	}

	@Override
	public boolean deleteAll() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Stotetable> findBySQLone(String sqlOA) {
		
		return Daoon.findBySQLone(sqlOA);
	}

	@Override
	public Stotetable findByIdQD(int id) {
		
		return Daoon.findByIdQD(id);
	}

	@Override
	public List<Stotetable> findBySQLonePA(int whereint) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Stotetable> findAllstr(String strwhere) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean findByIdQDParam(int whereint) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean findByNameParam(int whereintA, int whereintB) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean findBySQLParam(int whereintA, int whereintB) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Stotetable findByIdQDParamint(int whereint) {
		
	    return Daoon.findByIdQDParamint(whereint);
	}

	


}
