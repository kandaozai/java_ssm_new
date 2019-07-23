package com.zgx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.IRenWuDao;
import com.zgx.po.RenWutable;
import com.zgx.service.IRenWuService;

/**
 *  
 *  实现接口IRenWuService
 * 
 * @author 星月
 *
 */

@Transactional
@Service("renWuService")
public class RenWuServiceImpl  implements IRenWuService{


	@Autowired
	private IRenWuDao rwDao;
	

	@Override
	public RenWutable findById(int id) {
		return rwDao.findById(id);
	}

	@Override
	public RenWutable findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RenWutable findBySQL(String sql) {
		return rwDao.findBySQL(sql);
	}

	@Override
	public List<RenWutable> findPage(String where, int startIndex, int pageSize) {
		return rwDao.findPage(where, startIndex, pageSize);
	}

	@Override
	public List<RenWutable> findAll() {
		return rwDao.findAll();
	}

	@Override
	public int getTotalRow(String where) {
		return rwDao.getTotalRow(where);
	}

	@Override
	public boolean insert(RenWutable t) {

		return rwDao.insert(t);
	}

	@Override
	public int insertReturnId(RenWutable t) {
		return rwDao.insertReturnId(t);
	}

	@Override
	public boolean update(RenWutable t) {
		return rwDao.update(t);
	}

	@Override
	public boolean deleteById(int id) {
		return rwDao.deleteById(id);
	}

	@Override
	public boolean deleteAll() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<RenWutable> findBySQLone(String sqlOA) {
		
		return rwDao.findBySQLone(sqlOA);
	}

	@Override
	public RenWutable findByIdQD(int id) {
		
		return rwDao.findByIdQD(id);
	}



	@Override
	public List<RenWutable> findPagelw(String strwhere) {
		return rwDao.findPagelw(strwhere);
	}

	@Override
	public List<RenWutable> findPagenull() {
		return rwDao.findPagenull();
	}

	@Override
	public RenWutable findByIdtow(int idone, int idtwo) {
		return rwDao.findByIdtow(idone, idtwo);
	}

	@Override
	public List<RenWutable> findPagepramo(String strwhere) {
		return rwDao.findPagepramo(strwhere);
	}

	@Override
	public RenWutable shenhetable(int idone) {
		return rwDao.shenhetable(idone);
	}

	@Override
	public boolean updateLQ(int intwhere) {
		return rwDao.updateLQ(intwhere);
	}

	@Override
	public boolean updateYSH(int intwhere,int intwhereA) {
		return rwDao.updateYSH(intwhere,intwhereA);
	}

	@Override
	public boolean insertGRRW_WSH(int intwhere, int intwhereA) {
		return rwDao.insertGRRW_WSH(intwhere,intwhereA);
	}

	@Override
	public boolean insertGRRW_SH(int intwhere, int intwhereA) {
		return rwDao.insertGRRW_SH(intwhere,intwhereA);
	}

	@Override
	public boolean updateWX() {
		return rwDao.updateWX();
	}

	@Override
	public boolean insertSH(RenWutable tablea) {
		return rwDao.insertSH(tablea);
	}

	@Override
	public boolean updateTP(RenWutable tablea) {
		return rwDao.updateTP(tablea);
	}



	
	
}
