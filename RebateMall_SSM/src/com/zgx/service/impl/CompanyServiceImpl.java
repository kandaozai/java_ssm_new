package com.zgx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.ICompanyDao;
import com.zgx.po.Conpanytable;
import com.zgx.service.ICompanyService;

@Transactional
@Service("companyService")
public class CompanyServiceImpl implements ICompanyService {
	
	@Autowired
	private ICompanyDao  companyDao;
	
	
	@Override
	public Conpanytable findById(int id) {
		return companyDao.findById(id);
	}
	
	

	@Override
	public Conpanytable findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Conpanytable findBySQL(String sql) {
		
		return companyDao.findBySQL(sql);
	}

	@Override
	public List<Conpanytable> findPage(String where, int startIndex,
			int pageSize) {
		return companyDao.findPage(where, startIndex, pageSize);
	}

	@Override
	public List<Conpanytable> findAll() {
		return companyDao.findAll();
	}

	@Override
	public int getTotalRow(String where) {
		return companyDao.getTotalRow(where);
	}

	@Override
	public boolean insert(Conpanytable t) {
		return companyDao.insert(t);
	}

	@Override
	public int insertReturnId(Conpanytable t) {
		return companyDao.insertReturnId(t);
	}

	@Override
	public boolean update(Conpanytable t) {
		return companyDao.update(t);
	}

	@Override
	public boolean deleteById(int id) {
		return companyDao.deleteById(id);
	}

	@Override
	public boolean deleteAll() {
		// TODO Auto-generated method stub
		return false;
	}



	@Override
	public List<Conpanytable> findBySQLone(String sqlOA) {
		return companyDao.findBySQLone(sqlOA);
	}



	@Override
	public Conpanytable findByIdQD(int id) {
		return companyDao.findByIdQD(id);
	}



	@Override
	public List<Conpanytable> findBySQLoneo() {
		
		return companyDao.findBySQLoneo();
	}

	@Override
	public List<Conpanytable> findBySQLtwoo() {
		return companyDao.findBySQLtwoo();
	}

	@Override
	public List<Conpanytable> findBySQLthreeo() {
		return companyDao.findBySQLthreeo();
	}



	





}
