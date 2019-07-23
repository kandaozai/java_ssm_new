package com.zgx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.IProgramDao;
import com.zgx.po.Programtable;
import com.zgx.service.IProgramService;

@Transactional
@Service("programService")
public class ProgramServiceImpl implements IProgramService{

	@Autowired
	private IProgramDao programDao;
	
	@Override
	public Programtable findById(int id) {
		return programDao.findById(id);
	}

	@Override
	public Programtable findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Programtable findBySQL(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Programtable> findPage(String where, int startIndex,
			int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Programtable> findAll() {
		return programDao.findAll();
	}

	@Override
	public int getTotalRow(String where) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean insert(Programtable t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int insertReturnId(Programtable t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean update(Programtable t) {
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
	public List<Programtable> findBySQLone(String sqlOA) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Programtable findByIdQD(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}
