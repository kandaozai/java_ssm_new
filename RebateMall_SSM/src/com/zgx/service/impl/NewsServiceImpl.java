package com.zgx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zgx.mapper.InewsDao;
import com.zgx.po.Newstable;
import com.zgx.service.InewsService;
/**
 * 
 * 消息实现接口
 * 
 * @author 星月
 *
 */
@Transactional
@Service("newsService")
public class NewsServiceImpl implements InewsService{
	
	@Autowired
	private InewsDao newsDaoImpl;

	@Override
	public Newstable findById(int id) {
		
		return newsDaoImpl.findById(id);
	}

	@Override
	public Newstable findByName(String name) {
		
		return newsDaoImpl.findByName(name);
	}

	@Override
	public Newstable findBySQL(String sql) {
		
		return newsDaoImpl.findBySQL(sql);
	}

	@Override
	public List<Newstable> findPage(String where, int startIndex, int pageSize) {
		
		return newsDaoImpl.findPage(where, startIndex, pageSize);
	}

	@Override
	public List<Newstable> findAll() {
		
		return newsDaoImpl.findAll();
	}

	@Override
	public int getTotalRow(String where) {
		
		return newsDaoImpl.getTotalRow(where);
	}

	@Override
	public boolean insert(Newstable t) {
		
		return newsDaoImpl.insert(t);
	}

	@Override
	public int insertReturnId(Newstable t) {
		
		return newsDaoImpl.insertReturnId(t);
	}

	@Override
	public boolean update(Newstable t) {
		
		return newsDaoImpl.update(t);
	}

	@Override
	public boolean deleteById(int id) {
		
		return newsDaoImpl.deleteById(id);
	}

	@Override
	public boolean deleteAll() {
		
		return newsDaoImpl.deleteAll();
	}

	@Override
	public List<Newstable> findBySQLone(String sqlOA) {
		
		return newsDaoImpl.findBySQLone(sqlOA);
	}

	@Override
	public Newstable findByIdQD(int id) {
	
		return newsDaoImpl.findByIdQD(id);
	}

	@Override
	public List<Newstable> findPagepramo(String strwhere) {
		return newsDaoImpl.findPagepramo(strwhere);
	}

	@Override
	public boolean deleteByIdParam(int whereint) {
		return newsDaoImpl.deleteByIdParam(whereint);
	}
	
	


}
