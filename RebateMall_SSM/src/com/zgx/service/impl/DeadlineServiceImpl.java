package com.zgx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.IDeadlineDao;
import com.zgx.po.Deadlinetable;
import com.zgx.service.IDeadlineService;

@Transactional
@Service("deadlineService") 
public class DeadlineServiceImpl implements IDeadlineService{

	@Autowired
	private IDeadlineDao deadlineDao;
	
	@Override
	public Deadlinetable findById(int id) {
		return deadlineDao.findById(id);
	}

	@Override
	public Deadlinetable findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Deadlinetable findBySQL(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Deadlinetable> findPage(String where, int startIndex,
			int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Deadlinetable> findAll() {
		return deadlineDao.findAll();
	}

	@Override
	public int getTotalRow(String where) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean insert(Deadlinetable t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int insertReturnId(Deadlinetable t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean update(Deadlinetable t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteById(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteAll() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Deadlinetable> findBySQLone(String sqlOA) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Deadlinetable findByIdQD(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
