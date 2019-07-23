package com.zgx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.ISignupDao;
import com.zgx.po.Signuptable;
import com.zgx.service.ISignupService;
import com.zgx.util.MD5Util;

/**
 * 
 * 用户
 * 
 * @author 星月
 *
 */
@Transactional
@Service("signupService")
public  class SignupServiceImpl implements ISignupService{
	
	@Autowired
	private ISignupDao signuptableDao;

	@Override
	public Signuptable findById(int id) {
		return signuptableDao.findById(id);
	}

	@Override
	public Signuptable findByName(String name) {
		return signuptableDao.findByName(name);
	}

	@Override
	public Signuptable findBySQL(String sql) {
		
		return signuptableDao.findBySQL(sql);
		
	}

	@Override
	public List<Signuptable> findPage(String where, int startIndex, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Signuptable> findAll() {
		return signuptableDao.findAll();
	}

	@Override
	public int getTotalRow(String where) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean insert(Signuptable t) {
		return signuptableDao.insert(t);
	}

	@Override
	public int insertReturnId(Signuptable t) {
		return signuptableDao.insertReturnId(t);
	}

	@Override
	public boolean update(Signuptable t) {
		return signuptableDao.update(t);
	}

	@Override
	public boolean deleteById(int id) {
		return signuptableDao.deleteById(id);
	}

	@Override
	public boolean deleteAll() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Signuptable login(String signUpName, String password) {
		Signuptable users=null;
		Signuptable dbUsers=signuptableDao.findByName(signUpName);
		if (dbUsers !=null) {
			password=MD5Util.getMD5(password);//加密
			if (password.equals(dbUsers.getPassword().trim())) {//判断值是否相同 之前少.trim()
				users=dbUsers;
			}
		}		
		return users;
	}

	@Override
	public List<Signuptable> findBySQLone(String sqlOA) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Signuptable findByIdQD(int id) {
		return signuptableDao.findByIdQD(id);
	}

	@Override
	public boolean updatetow(int whereint) {
		return signuptableDao.updatetow(whereint);
	}



	@Override
	public boolean updatePramone(Signuptable tables) {
		return signuptableDao.updatePramone(tables);
	}

	@Override
	public boolean updatePramtwo(Signuptable tables) {
		return signuptableDao.updatePramtwo(tables);
	}

	@Override
	public boolean updatePramthree(Signuptable tables) {
		return signuptableDao.updatePramthree(tables);
	}

	@Override
	public boolean updatetable(Signuptable tables) {
		return signuptableDao.updatetable(tables);
	}

	@Override
	public boolean updatePramoneSFZ(Signuptable tables) {
		return signuptableDao.updatePramoneSFZ(tables);
	}

	@Override
	public boolean updatePramoneYHK(Signuptable tables) {
		return signuptableDao.updatePramoneYHK(tables);
	}

	@Override
	public boolean updatePramoneDZYX(Signuptable tables) {
		return signuptableDao.updatePramoneDZYX(tables);
	}

	@Override
	public Signuptable findBySQL() {
		return signuptableDao.findBySQL();
	}

	@Override
	public boolean updateBCH(int whereint) {
		return signuptableDao.updateBCH(whereint);
	}

	@Override
	public Signuptable findByIdparmint(int whereint) {
		return signuptableDao.findByIdparmint(whereint);
	}

	@Override
	public boolean updaterewu(int intwhere, int intwhereA) {
		return signuptableDao.updaterewu(intwhere, intwhereA);
	}

	@Override
	public boolean updatePramoneQT(Signuptable tables) {
		return signuptableDao.updatePramoneQT(tables);
	}





	
}
