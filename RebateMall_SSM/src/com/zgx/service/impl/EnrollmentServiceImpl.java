package com.zgx.service.impl;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.IEnrollmentDao;
import com.zgx.po.Enrollmenttable;
import com.zgx.service.IEnrollmentService;

@Transactional
@Service("enrollmentService")
public class EnrollmentServiceImpl implements IEnrollmentService{

	@Autowired
	private IEnrollmentDao EnrollmentDao;

	@Override
	public Enrollmenttable findById(int id) {
		return EnrollmentDao.findById(id);
	}

	@Override
	public Enrollmenttable findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Enrollmenttable findBySQL(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Enrollmenttable> findPage(String strwhere, int startIndex,
			int pageSize) {
		return EnrollmentDao.findPage(strwhere, startIndex, pageSize);
	}

	@Override
	public List<Enrollmenttable> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalRow(String strwhere) {
		return EnrollmentDao.getTotalRow(strwhere);
	}

	@Override
	public boolean insert(Enrollmenttable t) {
		return EnrollmentDao.insert(t);
	}

	@Override
	public int insertReturnId(Enrollmenttable t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean update(Enrollmenttable t) {
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
	public List<Enrollmenttable> findBySQLone(String sqlOA) {
		// TODO Auto-generated method stub
		return null;
	}


	
	@Override
	public String findByTotal(){
		return EnrollmentDao.findByTotal();
	}

	@Override
	public Enrollmenttable findByIdQD(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Enrollmenttable findByIdQDParamint(int whereint) {
		return EnrollmentDao.findByIdQDParamint(whereint);
	}



	@Override
	public String findByLump(int whereint) {
		return EnrollmentDao.findByLump(whereint);
	}

	@Override
	public String findBySum(int whereint) {
		return EnrollmentDao.findBySum(whereint);
	}

	@Override
	public BigDecimal findByIdAndTime(Date wheredate, int whereint) {
		return EnrollmentDao.findByIdAndTime(wheredate, whereint);
	}

	@Override
	public BigDecimal findByIdAndTimeSY(Date wheredate, int whereint) {
		
		return EnrollmentDao.findByIdAndTimeSY(wheredate, whereint);
	}


	
	
}
