package com.zgx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.ISigntDao;
import com.zgx.po.Signtable;
import com.zgx.service.IsignService;

/**
 * 
 * 签到
 * 
 * @author 星月
 *
 */
@Transactional
@Service("signservice")
public class ISignserviceImpl implements IsignService{
	
	
	@Autowired
	private ISigntDao signtableDao;

	@Override
	public Signtable findById(int id) {
	
		return signtableDao.findById(id);
	}

	@Override
	public Signtable findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Signtable findBySQL(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Signtable> findPage(String where, int startIndex, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Signtable> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalRow(String where) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean insert(Signtable t) {
		return signtableDao.insert(t);
	}

	@Override
	public int insertReturnId(Signtable t) {
		return signtableDao.insertReturnId(t);
	}

	@Override
	public boolean update(Signtable t) {
		
		return signtableDao.update(t);
	}

	@Override
	public boolean deleteById(int id) {
		
		return signtableDao.deleteById(id);
	}

	@Override
	public boolean deleteAll() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Signtable> findBySQLone(String sqlOA) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Signtable findByIdQD(int id) {
		return signtableDao.findByIdQD(id);
	}

	@Override
	public int insertint(Signtable t) {
		return signtableDao.insertint(t);
	}

	@Override
	public Signtable findByIdQDparmint(int intwhere) {
		return signtableDao.findByIdQDparmint(intwhere);
	}

}
