package com.zgx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.IRenWuDao;
import com.zgx.po.RenWutable;
import com.zgx.service.IRenWuService;


@Transactional
@Service("renWulogService")
public class RenWulogServiceImpl implements IRenWuService{
   // IRenWuDao Dao=new RenWuDaoImpl();
	
	@Autowired
	private  IRenWuDao Dao;
	
	@Override
	public RenWutable findById(int id) {
		return Dao.findById(id);
	}

	@Override
	public RenWutable findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RenWutable findBySQL(String sql) {
		return Dao.findBySQL(sql);
	}

	@Override
	public List<RenWutable> findPage(String where, int startIndex, int pageSize) {
		return Dao.findPage(where, startIndex, pageSize);
	}

	@Override
	public List<RenWutable> findAll() {
		return Dao.findAll();
	}

	@Override
	public int getTotalRow(String where) {
		return Dao.getTotalRow(where);
	}

	@Override
	public boolean insert(RenWutable t) {

		return Dao.insert(t);
	}

	@Override
	public int insertReturnId(RenWutable t) {
		return Dao.insertReturnId(t);
	}

	@Override
	public boolean update(RenWutable t) {
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
	public List<RenWutable> findBySQLone(String sqlOA) {
		
		return Dao.findBySQLone(sqlOA);
	}

	@Override
	public RenWutable findByIdQD(int id) {
		
		return Dao.findByIdQD(id);
	}

	@Override
	public RenWutable findByIdtow(int id, int idd) {
		return Dao.findByIdtow(id,idd);
	}

	@Override
	public List<RenWutable> findPagelw(String strwhere) {
		return Dao.findPagelw(strwhere);
	}

	@Override
	public List<RenWutable> findPagenull() {
		return Dao.findPagenull();
	}

	@Override
	public List<RenWutable> findPagepramo(String strwhere) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RenWutable shenhetable(int idone) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateLQ(int intwhere) {
		return Dao.updateLQ(intwhere);
	}

	@Override
	public boolean updateYSH(int intwhere,int intwhereA) {
		return Dao.updateYSH(intwhere,intwhereA);
	}

	@Override
	public boolean insertGRRW_WSH(int intwhere, int intwhereA) {
		return Dao.insertGRRW_WSH(intwhere,intwhereA);
	}

	@Override
	public boolean insertGRRW_SH(int intwhere, int intwhereA) {
		return Dao.insertGRRW_SH(intwhere,intwhereA);
	}

	@Override
	public boolean updateWX() {
		return Dao.updateWX();
	}

	@Override
	public boolean insertSH(RenWutable tablea) {
		return Dao.insertSH(tablea);
	}

	@Override
	public boolean updateTP(RenWutable tablea) {
		return Dao.updateTP(tablea);
	}


	

}
