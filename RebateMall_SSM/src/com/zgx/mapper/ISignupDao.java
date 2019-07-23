package com.zgx.mapper;


import org.apache.ibatis.annotations.Param;

import com.zgx.po.Signuptable;
import com.zgx.common.dao.BaseDao;

public interface ISignupDao extends BaseDao<Signuptable, Integer>{
	
	
   //public Signuptable login(String signUpName,String password); 为什么不要？？？
	
   public boolean updatetow(@Param("whereint")int  whereint);//金额+2 红包
	
	
	public boolean updaterewu(@Param("intwhere")int  intwhere,@Param("intwhereA")int  intwhereA);//金额任务
	
	public boolean updatePramone(Signuptable  tables);
	
	public boolean updatePramtwo(Signuptable  tables);
	
	public boolean updateBCH(@Param("whereint")int  whereint);
	
	
	public Signuptable findByIdparmint(@Param("whereint")int  whereint);
	
	
	
	public boolean updatePramthree(Signuptable  tables);
	
	public boolean updatePramoneQT(Signuptable  tables);
	
	public boolean updatetable(Signuptable  tables);
	
	
	
	public boolean updatePramoneSFZ(Signuptable  tables);
	
	public boolean updatePramoneYHK(Signuptable  tables);
	
	public boolean updatePramoneDZYX(Signuptable  tables);
	
	public Signuptable findBySQL();
	
	     
	
	
	
}
