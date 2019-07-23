package com.zgx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.IPlatformBackgroundDao;
import com.zgx.po.Platformbackgroundtable;
import com.zgx.service.IPlatformBackground;

@Transactional
@Service("platformbackgroundService")
public class PlatformBackgroundServiceImpl implements IPlatformBackground{

    @Autowired
	private IPlatformBackgroundDao platformBackgroundDao;
	@Override
	public Platformbackgroundtable findById(int id) {
		return platformBackgroundDao.findById(id);
	}

	@Override
	public Platformbackgroundtable findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Platformbackgroundtable findBySQL(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Platformbackgroundtable> findPage(String where, int startIndex,
			int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Platformbackgroundtable> findAll() {
		return platformBackgroundDao.findAll();
	}

	@Override
	public int getTotalRow(String where) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean insert(Platformbackgroundtable t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int insertReturnId(Platformbackgroundtable t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean update(Platformbackgroundtable t) {
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
	public List<Platformbackgroundtable> findBySQLone(String sqlOA) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Platformbackgroundtable findByIdQD(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
